BEGIN;
create table dbUpdateRegisterTbl (
    compName text NOT NULL,
    stopIfError integer NOT NULL,
    waitForMe   integer NOT NULL,
    tableName text NOT NULL,
    rowIndex  integer,
    onUpdate integer NOT NULL,
    onAdd   integer NOT NULL,
    onDelete integer NOT NULL
); 

-- table used by evtDsptch to make sure all writes are done before
-- notifying backend components
-- a write to this table causes sqlite to complete the earlier write

create table sqliteLock
(
lock integer
);

create table ifDevEventTbl   
(
   ifName text NOT NULL,
   compName text NOT NULL,
   userArg text NOT NULL,
   ifAdded integer NOT NULL,
   ifDeleted integer NOT NULL,
   flagsChange integer NOT NULL,
   macAddrChange integer NOT NULL,
   ipChange integer NOT NULL,
   ip6Change integer NOT NULL,
   mask     integer
);

CREATE TABLE tableValidation
(
	tableName  text NOT NULL,
	function  text NOT NULL,
	 PRIMARY KEY (tableName)
)
;

CREATE TABLE tableDefaults
(
	tableName  text NOT NULL,
	columnName  text NOT NULL,
	defValue  text ,
	minValue  text ,
	maxValue  text ,
	PRIMARY KEY (tableName,columnName)
)
;

CREATE TABLE system
(
	name  text NOT NULL,
	firmwareVer  text,
	firmwareVerInt  text,
	firmwarePri  text,
	firmwareSec  text,
    firmwareTime text,
    firmCSum     text,
    firmwareFile text,
    vendor text NOT NULL,
    sysContact text,
    sysLoc  text,
	PRIMARY KEY (name)
)
;
create TABLE systemConfig
(
    configMajorVer  integer,
    configMinorVer  integer,
    checksum        integer
);

create table dbUpdateRegisterProgram
(
    progName text NOT NULL,
    stopIfError integer NOT NULL,
    waitForMe   integer NOT NULL,
    tableName text NOT NULL,
    rowIndex  integer,
    onUpdate integer NOT NULL,
    onAdd   integer NOT NULL,
    onDelete integer NOT NULL
);

CREATE TABLE saveTables
(
	tableName  text NOT NULL,
	PRIMARY KEY (tableName)
)
;
CREATE TABLE saveTables2
(
        TableName  text NOT NULL,
        PRIMARY KEY (tableName)
);


CREATE TABLE environment
(
	name  text NOT NULL,
	value  text,
	PRIMARY KEY (name)
)
;

CREATE TABLE tableMaxRecords
    (
    tableName text PRIMARY KEY,
    maxRecords integer NOT NULL
    );

CREATE TABLE stringsMap
(
    stringId  text NOT NULL,
    en_US     text NOT NULL,
    PRIMARY KEY (stringId)
); 
CREATE TABLE ethernet
(
	interfaceName  text NOT NULL,
	poe  integer NOT NULL,
	duplex  text NOT NULL,
	vlanId  integer NOT NULL,
	vlanEnabled integer NOT NULL,
	trunkPort integer NOT NULL,
	macAddress  text,
    edgePortStatus  bool,
    ethernetEdgePortCost  integer,
	 PRIMARY KEY (interfaceName),
	FOREIGN KEY (vlanId) REFERENCES vlan(vlanId),
    FOREIGN KEY (interfaceName) REFERENCES networkInterface(interfaceName)
)
;

insert into tableDefaults values ("ethernet","vlanEnabled","0","","");
insert into tableDefaults values ("ethernet","trunkPort","0","","");

insert into stringsMap values ("ETHERNET_PORT_CONFIG_FAILED","Ethernet port configuration failed");
insert into stringsMap values ("ETHERNET_STAT_CONFIG_FAILED","Ethernet statistics refresh configuration failed");
-- tables used in TeamF1's Network Interface Management (NIM) Framework 2.0

-- NimfConf - this table stores the nimf (AC) related helper parameters.

-- Note: This table holds parameters which are necessary for AC WAN interfaces.

-- Author : Abdul Muheedh B

-- modification history :
-------------------------
-- 01a,02dec15,abd  creating a seperate sql file for AC. 

create table VlanOverWan
     (
     OID                     integer,            
     LogicalIfName           text    NOT NULL, -- wan LogicalIfName WAN1.WAN2
     InterfaceName           text    NOT NULL,  -- wan Interface Names bdgWAN1/2,eth1/2
     VlanPortMode            integer NOT NULL, -- 2 for ACCESS 
     VlanId                  text    NOT NULL, -- Putting text for future reference if we are supporting multiple vlans, this field will be comma seprated
     PRIMARY KEY (LogicalIfName) -- primary key
     );

insert into dbUpdateRegisterTbl values ("UMI_COMP_NIMF", 0, 0, "VlanOverWan", 0, 1, 1, 0);    
CREATE TABLE networkInterface
    (
    interfaceName   text    NOT NULL,
    LogicalIfName   text    NOT NULL,
    VirtualIfName   text    NOT NULL,
    ConnectionType  text    NOT NULL,
    ConnectionType6 text    NOT NULL,
    ifType          text,
    MTU             integer,
    ipaddr          text,
    subnetmask      text,
    gateway         text,
    dns1            text,
    dns2            text,
    DHCP            integer,
    IfStatus        integer NOT NULL,
    refreshInterval integer NOT NULL,
    autoRefreshFlag integer NOT NULL,
    capabilities    integer NOT NULL,
    restartFwForMe  integer DEFAULT 0, --1 restart the firewall,  0-don't restart    
    ifGroupId       integer,--1 secure, 2 insecure, 3 dmz, 4 IPV6, 5 WIRELESS etc    
    PRIMARY KEY (interfaceName,LogicalIfName)
    );

CREATE TABLE Lan
    (
    LogicalIfName   text    NOT NULL,
    Mtu             integer NOT NULL,
    IpAddress       text    NOT NULL,
    SubnetMask      text    NOT NULL,
    IfStatus        boolean NOT NULL,
    PRIMARY KEY (LogicalIfName),
    FOREIGN KEY (LogicalIfName) REFERENCES networkInterface(LogicalIfName)
    );

CREATE TABLE interfaceStats
(
    interfaceName  text NOT NULL,
    rx_packets  text NOT NULL,
    rx_packets_prev  text NOT NULL,
    tx_packets  text NOT NULL,
    tx_packets_prev  text NOT NULL,
    rx_bytes  text NOT NULL,
    rx_bytes_prev  text NOT NULL,
    tx_bytes  text NOT NULL,
    tx_bytes_prev  text NOT NULL,
    rx_errors  text NOT NULL,
    rx_errors_prev  text NOT NULL,
    tx_errors  text NOT NULL,
    tx_errors_prev  text NOT NULL,
    rx_dropped  text NOT NULL,
    rx_dropped_prev  text NOT NULL,
    tx_dropped  text NOT NULL,
    tx_dropped_prev  text NOT NULL,
    multicast  text NOT NULL,
    multicast_prev  text NOT NULL,
    collisions  text NOT NULL,
    collisions_prev  text NOT NULL,
    PRIMARY KEY (interfaceName),
    FOREIGN KEY (interfaceName) REFERENCES networkInterface(interfaceName)
)
;

CREATE TABLE interfaceStatsParams
(
    ifType  text NOT NULL,
    refreshInterval integer NOT NULL,
    autoRefreshFlag integer NOT NULL
)
;

CREATE TABLE interfaceUsage
(
	interfaceName    text NOT NULL,
    entryNum         integer NOT NULL,
    entryTime        DATE NOT NULL,
	rx_packets       text NOT NULL,
    rx_packet_rate   text NOT NULL,
	tx_packets       text NOT NULL,
    tx_packet_rate   text NOT NULL,
	rx_bytes         text NOT NULL,
    rx_bytes_rate    text NOT NULL,
	tx_bytes         text NOT NULL,
    tx_bytes_rate    text NOT NULL,
	rx_errors        text NOT NULL,
    rx_error_rate    text NOT NULL,
	tx_errors        text NOT NULL,
    tx_error_rate    text NOT NULL,
	rx_dropped       text NOT NULL,
    rx_dropped_rate  text NOT NULL,
	tx_dropped       text NOT NULL,
    tx_dropped_rate  text NOT NULL,
	multicast        text NOT NULL,
    multicast_rate   text NOT NULL,
	collisions       text NOT NULL,
    collisions_rate  text NOT NULL,
    PRIMARY KEY (interfaceName, entryNum),
    FOREIGN KEY (interfaceName) REFERENCES networkInterface(interfaceName)
)
;

create table ipAddressTable
(
    LogicalIfName text NOT NULL,        -- hardware interface name
    addressFamily integer,              -- Address family
    isStatic boolean,                   -- static assigned or dynamic
    ipAddress text,                     -- IP address
    ipDstAddres text,                   -- End point for P-to-P
    ipv6PrefixLen integer,              -- IPv6 prefix length
    subnetMask text,                    -- subnet mask
    PRIMARY KEY(LogicalIfName,addressFamily,ipAddress), -- this modification will avoid same multiple ipaddress
                                                        -- for particular logicalifname and addressfamily.
    FOREIGN KEY (LogicalIfName) REFERENCES networkInterface(LogicalIfName)
);

create table resolverConfig
(
    LogicalIfName    text    NOT NULL,  -- WAN1, WAN2, LAN
    addressFamily    integer NOT NULL,  -- Address family
    nameserver1      text            ,  -- DNS nameserver 1 
    nameserver2      text            ,  -- DNS nameserver 2
    nameserver3      text            ,  -- DNS nameserver 1 
    nameserver4      text            ,  -- DNS nameserver 2 
    PRIMARY KEY (LogicalIfName, addressFamily),
    FOREIGN KEY (LogicalIfName) REFERENCES networkInterface(LogicalIfName)
);

create table  defaultRouters
(
  LogicalIfName    text    NOT NULL,    -- WAN1, WAN2, LAN  
  addressFamily    integer NOT NULL,    -- Address family   
  nextHopGateway   text            ,    -- Next hop gateway
  interfaceName    text            ,    -- for interface route
  PRIMARY KEY (LogicalIfName, addressFamily),
  FOREIGN KEY (LogicalIfName) REFERENCES networkInterface(LogicalIfName)
);

CREATE TABLE ifUsageReportConfig
    (
    maxSnaps integer NOT NULL,
    currSnap integer NOT NULL,
    PRIMARY KEY (maxSnaps, currSnap)
    );

CREATE TABLE networkInfo
(
	netWorkMode integer NOT NULL -- 1 = LAN IPv4, WAN IPv4
                                 -- 2 = LAN Dual, WAN IPv4   
                                 -- 3 = LAN Dual, WAN Dual
);

CREATE TABLE ipv6Interfaces
(
    interfaceName  text NOT NULL   -- ipv6 enabled interface name 
);

insert into tableDefaults values ("ifUsageReportConfig","maxSnaps","24","1","99");
    
insert into stringsMap values ("IFDEV_CONFIG_FAILED","Interface configuration failed");
insert into stringsMap values ("IFDEV_USAGE_CONFIG_FAILED","Usage reports configuration failed");
insert into stringsMap values ("IFDEV_RESET_STATS_FAILED","Reset of interface statistics failed");
insert into stringsMap values ("IP_MODE_SET_FAILED","IP Mode Configuration Failed");
insert into stringsMap values ("AUTOREFRESH_CONFIG_FAILED","Auto refresh Configuration Failed");
insert into stringsMap values ("CONFIG_CHECKSUM_FAILURE","Failed to update configuration (checksum error)");
CREATE TABLE cert
(
    name text,                 -- user identifier
	subjectName  text NOT NULL,
	issuerName   text NOT NULL,
	expiryTime   text NOT NULL,	
	serialNumber text NOT NULL,-- The cert serial number	
	format	     text,         -- the format of the certificate data; 
                               -- for future use	
	certType     text NOT NULL,-- cert type: "ca" = root/CA certificate, 
                               --            "self"=self certificate
	certData     text NOT NULL,-- Certificate data
    PRIMARY KEY (subjectName)
)
;

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"cert", 
                                         0, 1,1,1);
CREATE TABLE x509SelfCertReq
(
    requestName text NOT NULL,
    subjectName text NOT NULL,
    hashAlgo integer,
    signatureAlgo integer,
    signatureKeyLength integer,
    ipAddress text,
    domainName text,
    emailAddress text,
    selfCertData text,
    selfKeyData text,
    selfSignCertData text,
    appType text,
    requestStatus integer,
    PRIMARY KEY (requestName,subjectName)
);

CREATE TABLE x509DbUpdateFlag
(
    dbUpdateFlag integer
);

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1, 
                                        "x509SelfCertReq", 0, 1,1,1);

insert into stringsMap values ("X509_INVALID_CA","Can't Upload Invalid Trusted Certificate"); 
insert into stringsMap values ("X509_CA_ADD_SUCCESS","Added Trusted Certificate"); 
insert into stringsMap values ("X509_CA_ADD_FAILURE","Cannot Add Trusted Certificate"); 
insert into stringsMap values ("X509_CA_DEL_SUCCESS","Selected Trusted CAs Deleted"); 
insert into stringsMap values ("X509_CA_DEL_FAILURE","Cannot Delete Trusted CAs"); 
insert into stringsMap values ("X509_CA_BEING_USED_DEL_FAILED","Cannot Delete Trusted CA as it is being used by other self signed certificate(s)"); 
insert into stringsMap values ("X509_SELF_GEN_FAILURE","Generate Self Certificate Request Failed");
insert into stringsMap values ("X509_SELF_SAME_SUBJECT","Generate Self Certificate Request Failed As Self Certificate Request With Same Subject Already Exists");
insert into stringsMap values ("X509_SELF_SAME_REQUESTNAME","Generate Self Certificate Request Failed As Self Certificate Request With Same REQUEST NAME Already Exists");
insert into stringsMap values ("X509_SELF_DEL_SUCCESS","Selected Self Certificates Deleted");
insert into stringsMap values ("X509_SELF_DEL_FAILURE","Cannot Delete Self Certificates");
insert into stringsMap values ("X509_SELF_BEING_USED","Cannot Delete Self Certificates Request As It Is Being Used By Uploaded Active Self Signed Certificate");
insert into stringsMap values ("X509_SELF_ADD_SUCCESS","Added Active Self Certificate");
insert into stringsMap values ("X509_SELF_ADD_FAILURE","Cannot Add Active Self Certificate");
insert into stringsMap values ("X509_INVALID_SELF","Can't Upload Invalid Self Certificate"); 
insert into stringsMap values ("X509_INVALID_SELF_PURPOSE","Invalid purpose, Can't Upload Self Certificate"); 
insert into stringsMap values ("X509_INVALID_SELF_CA","No trusted certificate found, Can't Upload Self Certificate"); 
insert into stringsMap values ("MULIPLE_UPLOAD_ERROR","Can't Upload Multiple Active Certificates For Same Ceritificate Request"); 
insert into stringsMap values ("X509_SELF_MAX_UPLOAD","Can't Have Multiple Self Certificate Request For Same Apptype"); 
insert into stringsMap values ("X509_MARK_DEF_SUCCESS","Operation Succeeded"); 
insert into stringsMap values ("X509_MARK_DEF_FAILURE","Operation Failed"); 
insert into stringsMap values ("SELF_SIGN_CERT_CREATION_SUCCESS","Operation Succeeded"); 
insert into stringsMap values ("SELF_SIGN_CERT_CREATION_FAILED","Operation Failed"); 

CREATE TABLE ntp
(
   timezone  integer NOT NULL,
   enabled  integer NOT NULL,
   autoDaylight  integer NOT NULL,
   useDefServers  integer NOT NULL,
   server1  text NOT NULL,
   server2  text NOT NULL,
   reSyncNtpVal integer NOT NULL,
   networkMode	integer	NOT NULL,
   sharedSecretStatus boolean,
   authKeyID  integer,
   authKeyValue text		
)
;

CREATE TABLE ntpDefServers
    (
    serverName text NOT NULL,
    PRIMARY KEY (serverName)
    )
;

CREATE TABLE manualTime
(
   ManualTimeStatus boolean NOT NULL, 
   Timezone  integer NOT NULL,
   AutoDaylight  integer NOT NULL
)
;

insert into tableDefaults values ("manualTime", "ManualTimeStatus", "0", "0", "1");
insert into tableDefaults values ("ntp", "sharedSecretStatus", "0", "0", "1");

insert into dbUpdateRegisterTbl values ("UMI_COMP_NTP",1,1,"ntpDefServers", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_NTP",1,1,"ntp", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_NTP",1,0,"manualTime", 0, 1,1,0);

insert into stringsMap values ("TIME_STATUS_NTP_FAILED","NTP configuration failed");
insert into stringsMap values ("TIME_STATUS_TIMEDATE_FAILED","Time/Date configuration Failed");
insert into stringsMap values ("MANUAL_TIME_CONFIG_FAILED","Manual Time/Date configuration Failed");
CREATE TABLE crontab
(
    unit        integer NOT NULL,
    interval    integer,
    minute      integer,
    hour        integer,
    dayOfMonth  integer,
    month       integer,
    dayOfWeek   integer,
    command     text
);
insert into tableDefaults values ("crontab","unit","0","","");
insert into tableDefaults values ("crontab","interval","0","","");
insert into tableDefaults values ("crontab","minute","0","0","59");
insert into tableDefaults values ("crontab","hour","-1","","");
insert into tableDefaults values ("crontab","dayOfMonth","-1","","");
insert into tableDefaults values ("crontab","month","-1","","");
insert into tableDefaults values ("crontab","dayOfWeek","-1","","");
insert into dbUpdateRegisterTbl values ("UMI_COMP_CRON",1,1,"crontab", 0,1,1,1);

insert into stringsMap values ("CRONTAB_CONFIG_FAILED","Crontab configuration failed");



CREATE TABLE oidRecord
    (
    OID             integer,    -- next instance id to be used
    tableName       text        -- table name
    
    );

CREATE TABLE ConfigSupport
    (
    EncryptEnable    integer   NOT NULL ,    -- Enable/Disable
	EnableAutoBackup integer NOT NULL      -- Enable/Disable
    );

insert into oidRecord values (1, "route");

CREATE TABLE hwFamilyInfo
    (
    modelId text NOT NULL,                    -- current unit name
    currHardwareVersion text NOT NULL,        -- current hardware version
    hwFamilyName text NOT NULL                -- hardware family name
    );



insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"bridgePorts", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"bridgeTable", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",0,1,"networkInterface", 0, 1,0,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"users", 0, 1,1,1);

insert into stringsMap values ("NONE","");
insert into stringsMap values ("STATUS_OK","Operation succeeded");
insert into stringsMap values ("ADMIN_REQD","Administrator privileges are required");
insert into stringsMap values ("PASSWORD_CHANGED","Password Changed. Please login again");
insert into stringsMap values ("ERR_EMPTY_VALUE_ENTERED","Field cannot be left blank");
insert into stringsMap values ("ERR_STRING_LENGTH","Length of the string entered is incorrect");
insert into stringsMap values ("ERR_START_IP_GREATER","Start IP cannot be greater than end IP");
insert into stringsMap values ("ERR_PASSWORD_EMPTY","Password field cannot be left empty");
insert into stringsMap values ("ERR_PASSWORD_MISMATCH","Passwords entered do not match");
insert into stringsMap values ("INVALID_VALUE_ERR_ALPHABET","Only Numbers allowed for the field");
insert into stringsMap values ("INVALID_VALUE_ERR_ALPHA","Only Numbers allowed for the field");
insert into stringsMap values ("INVALID_VALUE_ERR_SPCLCHAR","Special Characters not allowed for the field");
insert into stringsMap values ("ERR_START_GREATER_THAN_END","Start value cannot be greater than end value");
insert into stringsMap values ("ERR_BOUND_INVALID_RANGE","Value entered does not fall in allowed range");
insert into stringsMap values ("INVALID_SUBNET_EMPTY_OCTET_1","Octet 1 of subnet field cannot be left blank");
insert into stringsMap values ("INVALID_SUBNET_EMPTY_OCTET_2","Octet 2 of subnet field cannot be left blank");
insert into stringsMap values ("INVALID_SUBNET_EMPTY_OCTET_3","Octet 3 of subnet field cannot be left blank");
insert into stringsMap values ("INVALID_SUBNET_EMPTY_OCTET_4","Octet 4 of subnet field cannot be left blank");
insert into stringsMap values ("ERR_INVALIDSUBNET_OCTET_1","Invalid value entered for subnet octet 1");
insert into stringsMap values ("ERR_INVALIDSUBNET_OCTET_2","Invalid value entered for subnet octet 2");
insert into stringsMap values ("ERR_INVALIDSUBNET_OCTET_3","Invalid value entered for subnet octet 3");
insert into stringsMap values ("ERR_INVALIDSUBNET_OCTET_4","Invalid value entered for subnet octet 4");
insert into stringsMap values ("INVALID_SUBNET_ERR1_OCTET_1","Subnet Octet1 should be 255");
insert into stringsMap values ("INVALID_SUBNET_ERR2_OCTET_4","Subnet Octet4 should not be 254");
insert into stringsMap values ("INVALID_SUBNET_ERR3_OCTET_4","Subnet Octet4 should not be 255");
insert into stringsMap values ("INVALID_SUBNET_ERR4_OCTET_3","Subnet Octet 3 should be 0");
insert into stringsMap values ("INVALID_SUBNET_ERR5_OCTET_4","Subnet Octet 4 should be 0");
insert into stringsMap values ("INVALID_SUBNET_ERR6_OCTET_2","Subnet Octet 2 should be 255 for class B");
insert into stringsMap values ("INVALID_SUBNET_ERR7_OCTET_2","Subnet Octet 2 should be 255 for class C");
insert into stringsMap values ("INVALID_SUBNET_ERR8_OCTET_3","Subnet Octet 3 should be 255 for class C");
insert into stringsMap values ("INVALID_IPCLASS_ERR9","IP Class not valid");
insert into stringsMap values ("INVALID_IP_CHECK_NUMBER_OCTETS","Number of octets in a IPv4 address should be 4");
insert into stringsMap values ("INVALID_IP_ERR_ALPHABET","Alphabets are not allowed in IPv4 address");
insert into stringsMap values ("INVALID_IP_ERR_SPCLCHAR","Special Characters are not allowed in IPv4 address"); 
insert into stringsMap values ("INVALID_IP_EMPTY_OCTET_1","Octet 1 of IP address cannot be left blank");
insert into stringsMap values ("INVALID_IP_EMPTY_OCTET_2","Octet 2 of IP address cannot be left blank");
insert into stringsMap values ("INVALID_IP_EMPTY_OCTET_3","Octet 3 of IP address cannot be left blank");
insert into stringsMap values ("INVALID_IP_EMPTY_OCTET_4","Octet 4 of IP address cannot be left blank");
insert into stringsMap values ("INVALID_IP_OCTET_1","Enter a value between 1 to 223 for octet 1");
insert into stringsMap values ("INVALID_IP_OCTET_2","Enter a value between 1 to 255 for octet 2");
insert into stringsMap values ("INVALID_IP_OCTET_3","Enter a value between 1 to 255 for octet 3");
insert into stringsMap values ("INVALID_IP_OCTET_4","Enter a value between 1 to 254 for octet 4");
insert into stringsMap values ("INVALID_SUBNET_ERR_ALPHABET","Alphabets are not allowed in IP subnet maks");
insert into stringsMap values ("INVALID_SUBNET_ERR_SPCLCHAR","Special Characters are not allowed in IP subnet maks");
insert into stringsMap values ("ERROR_MAC_NUMBER_OF_OCTETS","Invalid MAC Address");
insert into stringsMap values ("INVALID_MAC_ERR_SPCLCHAR","Special Characters are not allowed in MAC field");
insert into stringsMap values ("ERR_MAC_EMPTY_VALUE_OCTET_1","Octet 1 of MAC field cannot be left empty");
insert into stringsMap values ("ERR_MAC_EMPTY_VALUE_OCTET_2","Octet 2 of MAC field cannot be left empty");
insert into stringsMap values ("ERR_MAC_EMPTY_VALUE_OCTET_3","Octet 3 of MAC field cannot be left empty");
insert into stringsMap values ("ERR_MAC_EMPTY_VALUE_OCTET_4","Octet 4 of MAC field cannot be left empty");
insert into stringsMap values ("ERR_MAC_EMPTY_VALUE_OCTET_5","Octet 5 of MAC field cannot be left empty");
insert into stringsMap values ("ERR_MAC_EMPTY_VALUE_OCTET_6","Octet 6 of MAC field cannot be left empty");
insert into stringsMap values ("ERR_TWOCHAR_OCTET_1","Only 2 characters allowed in octet 1");
insert into stringsMap values ("ERR_TWOCHAR_OCTET_2","Only 2 characters allowed in octet 2");
insert into stringsMap values ("ERR_TWOCHAR_OCTET_3","Only 2 characters allowed in octet 3");
insert into stringsMap values ("ERR_TWOCHAR_OCTET_4","Only 2 characters allowed in octet 4");
insert into stringsMap values ("ERR_TWOCHAR_OCTET_5","Only 2 characters allowed in octet 5");
insert into stringsMap values ("ERR_TWOCHAR_OCTET_6","Only 2 characters allowed in octet 6");
insert into stringsMap values ("ERR_ONLYHEX_OCTET_1","Only a-f and 0-9 allowed in octet 1");
insert into stringsMap values ("ERR_ONLYHEX_OCTET_2","Only a-f and 0-9 allowed in octet 2");
insert into stringsMap values ("ERR_ONLYHEX_OCTET_3","Only a-f and 0-9 allowed in octet 3");
insert into stringsMap values ("ERR_ONLYHEX_OCTET_4","Only a-f and 0-9 allowed in octet 4");
insert into stringsMap values ("ERR_ONLYHEX_OCTET_5","Only a-f and 0-9 allowed in octet 5");
insert into stringsMap values ("ERR_ONLYHEX_OCTET_6","Only a-f and 0-9 allowed in octet 6");
insert into stringsMap values ("ERR_LEASETIME_EMPTY_VALUE","Lease Time field cannot be left empty");
insert into stringsMap values ("INVALID_LEASETIME_ERR_SPCLCHAR","Special chracter not allowed in lease time field");
insert into stringsMap values ("INVALID_LEASETIME_ERR_ALPHA","Alphabet not allowed in Lease time field");
insert into stringsMap values ("ERR_LEASETIME_INVALIDRANGEVALUE","Lease time entered is outside allowed range");
insert into stringsMap values ("ERR_MTU_EMPTY_VALUE","MTU field cannot be left empty");
insert into stringsMap values ("INVALID_MTUSIZE_ERR_ALPHA","Alphabet not allowed in MTU field");
insert into stringsMap values ("INVALID_MTUSIZE_ERR_SPCLCHAR","Special chracter not allowed in MTU field");
insert into stringsMap values ("ERR_MTUSIZE_INVALIDRANGEVALUE","MTU value entered falls outside allowed range");
insert into stringsMap values ("ERR_PORT_EMPTY_VALUE","Port field cannot be left empty");
insert into stringsMap values ("INVALID_PORT1_ERR_ALPHA","Alphabet not allowed in port field");
insert into stringsMap values ("INVALID_PORT1_ERR_SPCLCHAR","Special character not allowed in port1 field");
insert into stringsMap values ("INVALID_PORT2_ERR_ALPHA","Alphabet not allowed in port2 field");
insert into stringsMap values ("INVALID_PORT2_ERR_SPCLCHAR","Special character not allowed in port2 field");
insert into stringsMap values ("ERR_PORT1_GREATERTHAN_PORT2","Port1 entered is greater than Port2");
insert into stringsMap values ("ERR_PORT1_INVALID","Invalid port number");
insert into stringsMap values ("ERR_IDLETIME_EMPTY_VALUE","Idle time field cannot be left empty");
insert into stringsMap values ("INVALID_IDLETIME_ERR_ALPHA","Alphabet not allowed in idle time field");
insert into stringsMap values ("INVALID_IDLETIME_ERR_SPCLCHAR","Special character not allowed in idle time field");
insert into stringsMap values ("ERR_IDLETIME_INVALIDRANGEVALUE","Idle time entered is outside allowed limits");
insert into stringsMap values ("ERR_ADV_INV_EMPTY_VALUE","Empty field not allowed");
insert into stringsMap values ("INVALID_ADV_INV_ERR_ALPHA","Alphabet not allowed");
insert into stringsMap values ("INVALID_ADVINTERVAL_ERR_SPCLCHAR","Special character not allowed");
insert into stringsMap values ("ERR_ADV_INV_INVALIDRANGEVALUE","Advertisement interval entered falls ouside alowed range");
insert into stringsMap values ("INVALID_RADVDMTU_ERR_ALPHA","Alphabet not allowed");
insert into stringsMap values ("INVALID_RADVDMTU_ERR_SPCLCHAR","Special character not allowed");
insert into stringsMap values ("ERR_RADVDMTU_INVALIDRANGEVALUE","MTU value entered falls outside allowed range"); 
insert into stringsMap values ("INVALID_ROUTERLIFETIME_ERR_ALPHA","Alphabet not allowed in lifetime field");
insert into stringsMap values ("INVALID_ROUTERLIFETIME_ERR_SPCLCHAR","Special character not allowed in life time field");
insert into stringsMap values ("ERR_ROUTERLIFETIME_INVALIDRANGEVALUE","Life time entered falls ouside alowed range");
insert into stringsMap values ("INVALID_BANDWIDTH_ERR_ALPHA","Alphabet not allowed"); 
insert into stringsMap values ("INVALID_BANDWIDTH_ERR_SPCLCHAR","Special character not allowed"); 
insert into stringsMap values ("ERR_BANDWIDTH_INVALIDRANGEVALUE","Value entered falls outside allowed range");
insert into stringsMap values ("INVALID_IDLETIMEOUT_ERR_ALPHA","Alphabet not allowed in idle time out field");
insert into stringsMap values ("INVALID_IDLETIMEOUT_ERR_SPCLCHAR","Special character not allowed in idle timeout field");
insert into stringsMap values ("ERR_IDLETIMEOUT_INVALIDRANGEVALUE","Value entered falls outside allowed range"); 
insert into stringsMap values ("ERR_PRESHAREKEY_EMPTY_VALUE","Pre-Shared field cannot be left empty"); 
insert into stringsMap values ("ERR_PRESHAREKEY_INVALID_KEY_LEN","Please enter key with length 8-49 characters");
insert into stringsMap values ("INVALID_MAXQUERRYTIME_ERR_ALPHA","Alphabets not allowed in querry time field"); 
insert into stringsMap values ("INVALID_MAXQUERRYTIME_ERR_SPCLCHAR","Special Character not allowed in querry time field");
insert into stringsMap values ("ERR_MAXQUERRYTIME_INVALIDRANGEVALUE","Query time entered falls outside range");
insert into stringsMap values ("INVALID_ROBVARIABLE_ERR_ALPHA","Alphabets not allowed in robustness field"); 
insert into stringsMap values ("INVALID_ROBVARIABLE_ERR_SPCLCHAR","Special character not allowed in robustness field");
insert into stringsMap values ("ERR_ROBVARIABLE_INVALIDRANGEVALUE","Enter a value between 2 to 99 for robustness field");
insert into stringsMap values ("INVALID_QUERRYINV_ERR_ALPHA","Alphabets not allowed in querry interval field");
insert into stringsMap values ("INVALID_QUERRYINV_ERR_SPCLCHAR","Special character not allowed in querry interval field");
insert into stringsMap values ("ERR_QUERRYINV_INVALIDRANGEVALUE","enter a value between 100-99999 for query interval");
insert into stringsMap values ("INVALID_DETPERIOD_ERR_ALPHA","Alphabet not allowed in detection period field"); 
insert into stringsMap values ("INVALID_DETPERIOD_ERR_SPCLCHAR","Special character not allowed in detection period field");
insert into stringsMap values ("ERR_DETPERIOD_INVALIDRANGEVALUE","enter value between 10-999 for detection period");
insert into stringsMap values ("INVALID_RECONNECT_ERR_ALPHA","Alphabet not allowed in reconnect field");
insert into stringsMap values ("INVALID_RECONNECT_ERR_SPCLCHAR","Special characeter not allowed in re-connect field");
insert into stringsMap values ("ERR_RECONNECT_INVALIDRANGEVALUE","Value entered falls outside allowed range"); 
insert into stringsMap values ("ERR_IPV6_EMPTY_VALUE","Empty IPv6 Address");
insert into stringsMap values ("CHECK_NUMBER_OCTETS_IPV6","Check the number of octect in ipV6 address field");
insert into stringsMap values ("CHECK_COLON_POSITION_IPV6","Check colon position in ipv6 address"); 
insert into stringsMap values ("INVALID_IPV6ADDR_CHAR","Only hex character allowed in ipv6 address");
insert into stringsMap values ("INVALID_IPV6ADDR_CHECK_COLONS","Check colon position in ipv6 address");
insert into stringsMap values ("CHECK_OCTET_IPV4_TYPE","IPV4 address string can occur only once");
insert into stringsMap values ("INVALID_IPV4ADRR_NOT_AT_END","IPV4 string can be present only at the end");
insert into stringsMap values ("INVALID_IPV6ADDR_CHECK_OCTECT_POSITION","Ckeck octet position");
insert into stringsMap values ("INVALID_IPV6ADDR_CHECK_NUMBER_OCTETS","Check the number of octets present");
insert into stringsMap values ("INVALID_IPV6ADDR_CHECK_OCTET","Check the octet positons");
insert into stringsMap values ("FIRST_GREATER_THAN_SECOND_IP_V6","ipv6 start address greater than end address");
insert into stringsMap values ("BOTH_IP_EQUAL_V6","Error, both ipv6 address are equal");
insert into stringsMap values ("INVALID_PREFIX_LENGTH_ERR_ALPHA","Alphabet not allowed in prefix length field");
insert into stringsMap values ("INVALID_PREFIX_LENGTH_ERR_SPCLCHAR","Special character not allowed in prefix length field");
insert into stringsMap values ("ERR_PREFIX_LENGTH_INVALIDRANGEVALUE","Enter value between 1-127 for prefix length");
insert into stringsMap values ("INVALID_METRIC_ERR_ALPHA","Alphabet not allowed for metric field");
insert into stringsMap values ("INVALID_METRIC_ERR_SPCLCHAR","Special character not allowed in metric field"); 
insert into stringsMap values ("ERR_METRIC_INVALIDRANGEVALUE","enter value between 2-15 for metric field");
insert into stringsMap values ("INVALID_REBIND_TIME_ERR_ALPHA","Alphabet not allowed in rebind time field");
insert into stringsMap values ("INVALID_REBIND_TIME_ERR_SPCLCHAR","Special character not allowed in rebind time field");
insert into stringsMap values ("ERR_BIND_TIME_INVALIDRANGEVALUE","enter value between 0-604800 for rebind time");
insert into stringsMap values ("INVALID_LOGIN_MASK_ERR_ALPHA","Alphabet not allowed");
insert into stringsMap values ("INVALID_LOGIN_MASK_ERR_SPCLCHAR","Special character not allowed");
insert into stringsMap values ("ERR_LOGIN_MASK_INVALIDRANGEVALUE","Value entered falls outside allowed range");
insert into stringsMap values ("INVALID_FAILOVER_ERR_ALPHA","Alphabet not allowed in failover field");
insert into stringsMap values ("INVALID_FAILOVER_ERR_SPCLCHAR","Special character not allowed in failover field"); 
insert into stringsMap values ("ERR_FAILOVER_INVALIDRANGEVALUE","enter a value between 2-999 for failover"); 
insert into stringsMap values ("INVALID_RETRY_INV_ERR_ALPHA","Alphabet not allowed in retyr interval field");
insert into stringsMap values ("INVALID_RETRY_INV_ERR_SPCLCHAR","Special character not allowed in retrt interval field");
insert into stringsMap values ("ERR_RETRY_INV_INVALIDRANGEVALUE","enter a value between 30-999 for retry interval");
insert into stringsMap values ("INVALID_TCP_RANGE_ERR_ALPHA","Alphabet not allowed");
insert into stringsMap values ("INVALID_TCP_RANGE_ERR_SPCLCHAR","Special character not allowed"); 
insert into stringsMap values ("ERR_TCP_INVALIDRANGEVALUE","Value entered falls outside allowed range");
insert into stringsMap values ("INVALID_TIME_ERR_ALPHA","Alphabet not allowed in time field");
insert into stringsMap values ("INVALID_TIME_ERR_SPCLCHAR","Special character not allowed in time field");
insert into stringsMap values ("ERR_INVALID_HOUR_SETTING","enter value between 1-12 for hour field");
insert into stringsMap values ("ERR_INVALID_HOUR24_SETTING","enter value between 0-23 for hour field");
insert into stringsMap values ("ERR_INVALID_MINUTE_SETTING","enter value between 1-59 for minute field");
insert into stringsMap values ("ERR_INVALID_MONTH_SETTING","enter value between 1-12 for month field");
insert into stringsMap values ("ERR_INVALID_DATE_SETTING","enter value between 1-31 for cate field");
insert into stringsMap values ("ERR_INVALID_SECOND_SETTING","enter value between 1-59 for second field");
insert into stringsMap values ("INVALID_MD5_KEY_ERR_ALPHA","alphabet not allowed in MD5 key field");
insert into stringsMap values ("INVALID_MD5_KEY_ERR_SPCLCHAR","special characters not allowed in md5 key field");
insert into stringsMap values ("ERR_MD5KEY_INVALIDRANGEVALUE","enter value between 1-255 for md5 key field");
insert into stringsMap values ("ERR_SALIFE_EMPTY_VALUE","SA-LifeTime field empty");
insert into stringsMap values ("INVALID_SA_TIME_ERR_ALPHA","alphabet not allowed in sa-lifetime field");
insert into stringsMap values ("INVALID_SA_TIME_ERR_SPCLCHAR","Special character not allowed in sa-liftime field");
insert into stringsMap values ("ERR_SA_LIFE_TIME","SA-Lifteime value entered is out of range");
insert into stringsMap values ("ERR__VPN_KEY_EMPTY_VALUE","vpn key field cannot be empty");
insert into stringsMap values ("VPN_INCORRECT_KEY_LENGTH","VPN key length entered is out of range");
insert into stringsMap values ("ERROR_NAME_EMPTY","Empty field value"); 
insert into stringsMap values ("INAVLID_CHARACTER_IN_NAME","Invalid characters"); 
insert into stringsMap values ("INVALID_UPNP_INV_ERR_ALPHA","Alphabet not allowed in upnp interval field");
insert into stringsMap values ("INVALID_UPNP_INV_ERR_SPCLCHAR","Special character not allowed in interval field");
insert into stringsMap values ("ERR_UPNP_ADV_INV_INVALIDRANGEVALUE","enter value between 1-86400");
insert into stringsMap values ("INVALID_AD_TIME_ERR_ALPHA","Alphabet not allowed in Adv time field");
insert into stringsMap values ("INVALID_AD_TIME_ERR_SPCLCHAR","Special character not allowed in adv time field");
insert into stringsMap values ("ERR_UPNP_ADV_TIME_INVALIDRANGEVALUE","enter a value between 1-255 for avd time field");
insert into stringsMap values ("INVALID_PROFILE_ERR_ALPHA","alphabet not allowed for field in profile page");
insert into stringsMap values ("INVALID_PROFILE_ERR_SPCLCHAR"," Special characters not allowed for field in profile page");
insert into stringsMap values ("ERR_INVALIDRANGEVALUE_WL","enter a value between 1-36000 for the field");
insert into stringsMap values ("INVALID_RADIUS_ERR_ALPHA","alphabet not allowed in radius field");
insert into stringsMap values ("INVALID_RADIUS_ERR_SPCLCHAR","special characters not allowed in radius field");
insert into stringsMap values ("ERR_INVALIDRANGEVALUE_RADIUS","enter a value between 1-999 for radius fields");
insert into stringsMap values ("MAC_ADDR_NOT_FOUND","MAC address not found, please ensure you are on the DSR''s LAN subnets");
insert into stringsMap values ("LOGGED_IN_SUCCESS","Succesfully logged in");
CREATE TABLE bridgePorts
(
	interfaceName  text NOT NULL,
    portEnabled     integer NOT NULL,
	bridgeInterface  text NOT NULL,
    vlanEnabled     integer NOT NULL,
    vlanId          integer,
    trunk           integer,
    PRIMARY KEY (interfaceName),
    FOREIGN KEY (interfaceName) REFERENCES networkInterface(interfaceName)
)
;



CREATE TABLE bridgeTable
(
	interfaceName  text NOT NULL,
	macAddress  text,
    bridgeIndex integer NOT NULL,
    PRIMARY KEY (interfaceName),
    FOREIGN KEY (interfaceName) REFERENCES networkInterface(interfaceName)
)
;

insert into tableDefaults values ('bridgeTable','bridgeIndex','1','','');

insert into dbUpdateRegisterTbl values ("UMI_COMP_LOGGING",0,0,"system", 0, 1,0,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_LOGGING",1,1,"logging", 0, 1,0,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_LOGGING",1,1,"logConfig", 0, 1,0,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_LOGGING",1,1,"compFacilityMap", 0, 1,0,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_LOGGING",1,1,"sysLogInfo", 0, 1,0,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_LOGGING",1,1,"logEventEmailConfig", 0, 1,0,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_LOGGING",1,1,"smtpServer", 0, 1,0,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_LOGGING",1,1,"logCtrlTbl", 0, 1,0,0);

CREATE TABLE logging
(
    maxEventLogRows  integer NOT NULL,
    saveLogs    integer NOT NULL
);

CREATE TABLE displayLogs
(
    facilityID  integer NOT NULL,
    logLevel    integer NOT NULL, 
    category    text
);

insert into logging values (1000, 0);
insert into displayLogs values (255, 0, 'all');

CREATE TABLE logConfig
(
	facility  text NOT NULL,
    facilityId integer NOT NULL,
	emergency  integer NOT NULL,
	alert  integer NOT NULL,
	critical  integer NOT NULL,
	error  integer NOT NULL,
	warning  integer NOT NULL,
	notice  integer NOT NULL,
	information  integer NOT NULL,
	debug  integer NOT NULL,
	PRIMARY KEY (facilityId)
)
;

CREATE TABLE logEventEmailConfig
(
	facility  text NOT NULL,
    facilityId integer NOT NULL,
	emergency  integer NOT NULL,
	alert  integer NOT NULL,
	critical  integer NOT NULL,
	error  integer NOT NULL,
	warning  integer NOT NULL,
	notice  integer NOT NULL,
	information  integer NOT NULL,
	debug  integer NOT NULL,
	PRIMARY KEY (facilityId)
)
;

CREATE TABLE compFacilityMap
(
	component  text NOT NULL,
	facilityId  integer NOT NULL,
	PRIMARY KEY (component ,facilityId )
)
;


CREATE TABLE sysLogInfo
(
	serverName  text NOT NULL,      -- servername or ip
	serverPort  integer DEFAULT 514,
    facilityId  integer,            --Ex: kernel 0
    severity    integer,            --Ex: emergency 1
    Enable      integer,            -- 1- enable , 0- disable
    serverId    integer             -- i th syslog server (0 to 7)
)
;

CREATE TABLE logCtrlTbl
(
	logEnable integer NOT NULL  -- Disable (0) or Alert (1) or All (8)
)
;

insert into tableDefaults values("sysLogInfo","serverPort","514","","");
insert into tableDefaults values("sysLogInfo","facilityId","255","","");
insert into tableDefaults values("sysLogInfo","severity","0","","");
insert into tableDefaults values("sysLogInfo","Enable","1","0","1");
insert into tableDefaults values("sysLogInfo","serverId","0","0","7");

-- Logging facility 
insert into compFacilityMap values ("UMI_COMP_AUTH", 3);
insert into compFacilityMap values ("UMI_COMP_WCF", 20);
insert into compFacilityMap values ("UMI_COMP_SSHD", 3);
insert into compFacilityMap values ("UMI_COMP_PPTPC", 3);
insert into compFacilityMap values ("UMI_COMP_PPTPVPNC", 19);
insert into compFacilityMap values ("UMI_COMP_PPTPD", 19);
insert into compFacilityMap values ("UMI_COMP_L2TPC", 3);
insert into compFacilityMap values ("UMI_COMP_L2TPVPNC", 19);
insert into compFacilityMap values ("UMI_COMP_L2TPD", 19);
insert into compFacilityMap values ("UMI_COMP_PPPOE", 3);
insert into compFacilityMap values ("UMI_COMP_DHCPS", 3);
insert into compFacilityMap values ("UMI_COMP_DHCPV6C", 3);
insert into compFacilityMap values ("UMI_COMP_DHCPV6S", 3);
insert into compFacilityMap values ("UMI_COMP_THREEG", 3);
insert into compFacilityMap values ("UMI_COMP_IFSTATIC", 3);
insert into compFacilityMap values ("UMI_COMP_SNMP", 3);
insert into compFacilityMap values ("UMI_COMP_SMTPALG", 3);
insert into compFacilityMap values ("UMI_COMP_SIP", 3);
insert into compFacilityMap values ("UMI_COMP_GRE", 19);
insert into compFacilityMap values ("UMI_COMP_BRIDGE", 3);
insert into compFacilityMap values ("UMI_COMP_CAPTIVEPORTAL_ACC", 21);
insert into compFacilityMap values ("UMI_COMP_DHCP_HELPER", 3);
insert into compFacilityMap values ("UMI_COMP_DDNS", 3);
insert into compFacilityMap values ("UMI_COMP_FIRMWARE", 3);
insert into compFacilityMap values ("UMI_COMP_FRESET", 3);
insert into compFacilityMap values ("UMI_COMP_INTELAMT", 3);
insert into compFacilityMap values ("UMI_COMP_VLAN", 3);
insert into compFacilityMap values ("UMI_COMP_OPENVPN", 19);
insert into compFacilityMap values ("UMI_COMP_USB", 3);
insert into compFacilityMap values ("UMI_COMP_IGMP", 3);
insert into compFacilityMap values ("UMI_COMP_OSPF", 3);
insert into compFacilityMap values ("UMI_COMP_RIP", 3);
insert into compFacilityMap values ("UMI_COMP_BWLIMIT", 18);

--local0 facility (wireless)
insert into compFacilityMap values ("UMI_COMP_UDOT11", 16);
insert into compFacilityMap values ("UMI_COMP_KDOT11", 16);
insert into compFacilityMap values ("UMI_COMP_PNAC", 16);
insert into compFacilityMap values ("UMI_COMP_PNAC_USR", 16);
insert into compFacilityMap values ("UMI_COMP_RAD", 16);
insert into compFacilityMap values ("UMI_COMP_EAP_RAD", 16);
--local1 facility (UTM)
insert into compFacilityMap values ("UMI_COMP_IPS", 21);
insert into compFacilityMap values ("UMI_COMP_URLFILTER", 20);
insert into compFacilityMap values ("UMI_COMP_TM_PROTECTLINK", 17);
-- system facility
insert into compFacilityMap values ("UMI_COMP_LOGGING", 3);
insert into compFacilityMap values ("UMI_COMP_EVTDSPTCH", 3);
insert into compFacilityMap values ("UMI_COMP_PLATFORM", 3);
insert into compFacilityMap values ("UMI_COMP_REBOOT", 3);
-- kernel facility
insert into compFacilityMap values ("UMI_COMP_KERNEL", 0);

-- logCtrl Table Entry
insert into logCtrlTbl values (0);


CREATE TABLE eventLog
(
	component  text NOT NULL,
	facilityId integer NOT NULL,
	logLevel  integer NOT NULL,
	textMessage  text NOT NULL,
    binMessage blob,
    logTimeStamp text  NULL,
    category text  NULL,
    FOREIGN KEY (component,facilityId) REFERENCES compFacilityMap(component,facilityId)
)
;

insert into tableDefaults values("eventLog","category","system","","");
insert into tableDefaults values("eventLogging","category","system","","");

CREATE TABLE Events
(
	date DATE NOT NULL,
	eventMsg text NOT NULL
)
;

CREATE TABLE emailLogs
(
    mailLogs integer,
    entryName text NOT NULL,
    logId   text
)
;

insert into tableDefaults values("emailLogs","entryName","LOGGING","","");

insert into stringsMap values ("LOGGING_SYSLOG_CONFIG_FAILED","Syslog configuration failed");
insert into stringsMap values ("LOGGING_CONFIG_FAILED","Logging configuration failed");
insert into stringsMap values ("LOGGING_EMAILLOGS_CONFIG_FAILED","Email logs configuration failed");
insert into stringsMap values ("LOGGING_SMTP_CONFIG_FAILED","SMTP server configuration Failed");
insert into stringsMap values ("LOGGING_CRONTAB_CONFIG_FAILED","CRONTAB configuration failed");
insert into stringsMap values ("LOGGING_EMAIL_PASSED","Mail sent and logs cleared");
insert into stringsMap values ("LOGGING_EMAIL_FAILED","Unable to send mail");
insert into stringsMap values ("LOGGING_EMAIL_DISABLED","Email logs currently disabled. Please enable and try again.");

-- We create our own PID file for loggingd
insert into environment (name, value) values ("LOGGINGD_PID_FILE", "/var/run/loggingdPID.txt");
create TABLE reboot 
(
    reboot integer NOT NULL, 
    rebootTime integer NOT NULL
);

insert into reboot values (0,10);

insert into dbUpdateRegisterTbl values ("UMI_COMP_REBOOT",1,1,"reboot", 0, 1,1,1);
CREATE TABLE DnsStaticHostsMapping
(
    IpAddress               text            NULL,
    HostName                text            NULL
);

INSERT INTO dbUpdateRegisterTbl VALUES ("UMI_COMP_PLATFORM", 0, 1, "DnsStaticHostsMapping", 0, 1, 0, 1);
INSERT INTO dbUpdateRegisterProgram VALUES ("/pfrm2.0/bin/dnsStaticHostsMapping", 1, 1, "DnsStaticHostsMapping", 0, 1, 0, 1);
insert into stringsMap values ("DOMAIN_CONFIG_FAILED","DNS Host Name Mapping configuration failed.");


CREATE TABLE FirewallRules6
(
  _metadata text,                       -- metadata for internal use 
  OID integer NULL,
  RuleType text NOT NULL,               -- GUI (HIDDEN): SECURE_INSECURE
  Status integer NOT NULL,              -- GUI (HIDDEN)
  ServiceName text NULL,                -- GUI: Service
  Action text NULL,                     -- GUI: Action
  ScheduleName text NULL,               -- GUI: Select Schedule
  SourceAddressType integer NULL,       -- GUI: Src Users
  SourceAddressStart text NULL,         -- GUI: Start (Src Users)
  SourceAddressEnd text NULL,           -- GUI: Finish (Src Users)
  SourceAddressPrefixLength text NULL,  -- GUI: Prefix Length (Src Users)
  DestinationAddressType integer NULL,  -- GUI: Dest. Users
  DestinationAddressStart text NULL,    -- GUI: Start (Dest. Users)
  DestinationAddressEnd text NULL,      -- GUI: Finish (Dest. Users)
  DestinationAddressPrefixLength text NULL,  -- GUI: Prefix Length (Dest. Users)
  LogLevel integer NULL,                -- GUI: Log
  Ipv6HeaderType  text NULL,
  LogPrefix text NULL,     
  FromZoneType text NULL,
  ToZoneType text NULL,
  ConnectionState text NULL,
  Protocol integer NULL,
  DestinationPortStart integer NULL,
  DestinationPortEnd integer NULL,
  PriorityId integer NULL DEFAULT 0,
  FOREIGN KEY (ScheduleName) REFERENCES Schedules (ScheduleName),
  FOREIGN KEY (ServiceName) REFERENCES Services (ServiceName)
)
;

CREATE TABLE FirewallRules
(
  _metadata text,                       -- metadata for internal use 
  OID integer NULL,
  RuleType text NOT NULL,               -- GUI (HIDDEN): SECURE_INSECURE
  Status integer NOT NULL,              -- GUI (HIDDEN)
  ServiceName text NULL,                -- GUI: Service
  TypeOfService integer NULL,           -- GUI: Qos. 
  Action text NULL,                     -- GUI: Action
  ScheduleName text NULL,               -- GUI: Select Schedule
  SourceAddressType integer NULL,       -- GUI: LAN/DMZ Users
  SourceAddressStart text NULL,         -- GUI: Start (LAN/DMZ Users)
  SourceAddressEnd text NULL,           -- GUI: Finish (LAN/DMZ Users)
  LogLevel integer NULL,                -- GUI: Log
  DestinationAddressType integer NULL,  -- GUI: WAN/DMZ Users
  DestinationAddressStart text NULL,    -- GUI: Start (WAN/DMZ Users)
  DestinationAddressEnd text NULL,      -- GUI: Finish (WAN/DMZ Users)
  SNATAddressType integer NULL,         -- GUI: NAT IP
  SNATAddress text NULL,                -- GUI: NAT IP Address
  SNATInterface text NULL,              -- GUI: NAT Single IP Is On
  DestinationPublicInterface text NULL, -- GUI: WAN Destination IP Address
  DestinationPublicAddress text NULL,   -- GUI: WAN Destination IP Address
                                        -- this value is 'OTHER' for public ipAddr
  DNATAddress text NULL,                -- GUI: Send to LAN/DMZ Server
  DNATPortEnable integer NULL,          -- GUI: Translate to Port Number
  DNATPort integer NULL,                -- GUI: Translate to Port Number
  FromZoneType text NULL,
  ToZoneType text NULL,
  ConnectionState text NULL,
  Protocol integer NULL,
  DestinationPortStart integer NULL,
  DestinationPortEnd integer NULL,
  SourcePort integer NULL, 
  TrafficLimit integer NULL,
  MaximumTrafficLimit integer NULL,
  ConnectionLimit integer NULL,
  TcpMssValue integer NULL,
  WebContent integer NULL,
  MacSource  text NULL,
  BwLimitMark integer NULL,
  DscpMark text NULL,
  DscpMatch integer NULL,
  PriorityId integer NULL DEFAULT 0,
  FromZoneVlanId integer NULL DEFAULT 0,
  ToZoneVlanId integer NULL DEFAULT 0,
  FOREIGN KEY (ScheduleName) REFERENCES Schedules (ScheduleName),
  FOREIGN KEY (ServiceName) REFERENCES Services (ServiceName),
  FOREIGN KEY (DestinationPublicInterface) REFERENCES Zones (ZoneLogicalIfName),
  FOREIGN KEY (SNATInterface) REFERENCES Zones (ZoneLogicalIfName)
)
;
CREATE TABLE L2FirewallRules
(
    OID                        integer,
    --RuleName                   text,
    RuleType                   text NOT NULL,
    Status                     boolean NOT NULL,
    L2ServiceName              text NOT NULL,
    ServiceName                text,
    Action                     integer,
    ScheduleName               text,
    SourceAddressType          integer,       -- GUI: Src Users
    SourceAddressStart         text,         -- GUI: Start (Src Users)
    SourceAddressEnd           text,           -- GUI: Finish (Src. Users)
    DestinationAddressType     integer NULL,  -- GUI: Dest. Users
    DestinationAddressStart    text,    -- GUI: Start (Dest. Users)
    DestinationAddressEnd      text,      -- GUI: Finish (Dest. Users)
    SourceMACAddressType       integer,       -- GUI: Src Users
    SourceMACAddressStart      text,         -- GUI: Start (Src MACs)
    SourceMACAddressEnd        text,           -- GUI: Finish (Src. MACs)
    DestinationMACAddressType  integer NULL,  -- GUI: Dest. MACs
    DestinationMACAddressStart text,    -- GUI: Start (Dest. MACs)
    DestinationMACAddressEnd   text,      -- GUI: Finish (Dest. MACs)
    vlanId                     integer,
    dscp                       integer,
    classId                    text
    -- PRIMARY KEY (RuleName)
);

CREATE TABLE L2FirewallDefaultPolicy
(
    OID                        integer,
    defaultOutboundPolicy      boolean NOT NULL,
    defaultInboundPolicy       boolean NOT NULL
);  


insert into tableDefaults values ("FirewallRules","Status","1","0","2");
insert into tableDefaults values ("FirewallRules6","Status","1","0","1");
insert into stringsMap values ("FW_CONFIG_FAILED","Firewall Configuration Failed");
insert into stringsMap values ("FW_DEFAULT_CONFIG _FAILED","Default Outbound Policy Configuration Failed");
insert into stringsMap values ("FW_RULES_ENABLED_FAILED","Selected Firewall Rule(s) Enabling Failed");
insert into stringsMap values ("FW_RULES_SERVICE_NOT_FOUND","Selected Firewall Rule(s) Service Not Avaialble");
insert into stringsMap values ("FW_RULES_SCHED_NOT_FOUND","Selected Firewall Rule(s) Schedule Not Avaialble");
insert into stringsMap values ("FW_RULES_ENABLED","Selected Firewall Rule(s) Enabled Successfully");
insert into stringsMap values ("FW_RULES_DISABLED_FAILED","Selected Firewall Rule(s) Disabling Failed");
insert into stringsMap values ("FW_RULES_DISABLED","Selected Firewall Rule(s) Disabled Successfully");
insert into stringsMap values ("FW_RULES_DELETE_FAILED","Selected Firewall Rule(s) Delete Failed");
insert into stringsMap values ("FW_RULES_DELETED","Selected Firewall Rule(s) Deleted Successfully");
insert into stringsMap values ("FW_IN_RULE_CONFIG_FAILED","Firewall LAN WAN Inbound Rule Configuration Failed");
insert into stringsMap values ("FW_OUT_RULE_CONFIG_FAILED","Firewall LAN WAN Outbound Rule Configuration Failed");
insert into stringsMap values ("FW_SCHED_REQUIRE","Schedule Is Not Available, Add Schedule First ");
insert into stringsMap values ("SERVICE_IN_USE_BW_MGMT","Service is in use by Bandwidth Management");

 

insert into ifDevEventTbl values("bdg1","UMI_COMP_FIREWALL","",1,1,1,0,0,0,0);
insert into ifDevEventTbl values("bdgWAN1","UMI_COMP_FIREWALL","",1,1,1,0,0,0,0);
insert into ifDevEventTbl values("eth1","UMI_COMP_FIREWALL","",1,1,1,0,0,0,0);
insert into ifDevEventTbl values("sit0","UMI_COMP_FIREWALL","",1,1,1,0,0,0,0);

CREATE TABLE fwPriorityMap
(
    OID  integer NULL,
    RuleType        text NOT NULL,
    PriorityStr     text NULL,
    ResetStr        integer NULL DEFAULT 0   -- For avoiding factory reset from B51    
)
;

CREATE TABLE fwPriorityMap6
(
    OID  integer NULL,
    RuleType        text NOT NULL,
    PriorityStr     text NULL
)
;

CREATE TABLE L2Services
(
  OID integer NULL,
  ServiceName text NOT NULL,    -- name of the service
  L2Protocol  integer NOT NULL,    -- Ether proto
  ProtoType integer NULL,  -- This is to store different packet types of the protocol
  IsDefault boolean NOT NULL,
  PRIMARY KEY (ServiceName)
)
;

CREATE TABLE Services
(
  OID integer NULL,
  ServiceName text NOT NULL,    -- name of the service
  Protocol integer NOT NULL,       -- TCP/UDP/ICMP 
  PortType integer NOT NULL,  -- 1 - Port Range/Single Port, 2 - Mutiple Ports
  MultiPort text NULL, --for multiple ports option
  SourceMultiPort text NOT NULL, --for multiple ports option
  SourcePortStart integer NOT NULL,    -- first TCP/UDP port or ICMP type
  SourcePortEnd integer NOT NULL,      -- last TCP/UDP port
  DestinationPortStart integer NULL,    -- first TCP/UDP port or ICMP type
  DestinationPortEnd integer NULL,      -- last TCP/UDP port
  TypeOfService integer NULL,         -- type of service
  IsDefault boolean NOT NULL,
  PRIMARY KEY (ServiceName)
)
;
insert into tableDefaults values ("Services","TypeOfService","0","0","16");
insert into tableDefaults values ("Services","SourcePortStart","0","0","65535");
insert into tableDefaults values ("Services","SourcePortEnd","0","0","65535");
insert into tableDefaults values ("Services","SourceMultiPort","0","0","16");
insert into stringsMap values ("SERVICE_IN_USE","Service Is In Use, Disable/Delete Firewall Rule First ");
insert into stringsMap values ("SERVICE_IN_USE_DEL_RULE","Service Is In Use, Delete Firewall Rule First ");
insert into stringsMap values ("SERVICE_DELETE_FAILED","Service(s) Delete Failed");
insert into stringsMap values ("SERVICE_DELETE_OK","Selected Service(s) Deleted Successfully");
insert into stringsMap values ("SERVICE_CONFIG_FAILED","Service Configuration Failed");

CREATE TABLE Schedules
(
  OID integer NULL,
  ScheduleName text NOT NULL,
  Days integer NULL,
  AllDay boolean NOT NULL,
  StartTimeHours integer NULL,
  StartTimeMins integer NULL,
  EndTimeHours integer NULL,
  EndTimeMins integer NULL,
  PRIMARY KEY (ScheduleName)
);

insert into stringsMap values ("SCHEDULE_IN_USE","Schedule Is In Use, Disable/Delete Firewall Rule First ");
insert into stringsMap values ("SCHEDULE_IN_USE_DEL_RULE","Schedule Is In Use, Delete Firewall Rule First ");
insert into stringsMap values ("SCHEDULE_DELETE_FAILED","Schedule(s) Delete Failed");
insert into stringsMap values ("SCHEDULE_DELETE_OK","Selected Schedule(s) Deleted Successfully");
insert into stringsMap values ("SCHEDULE_CONFIG_FAILED","Schedule Configuration Failed");
insert into tableDefaults values ("Schedules","Days","127","0","127");
insert into tableDefaults values ("Schedules","AllDay","1","0","1");

CREATE TABLE BlockSites      -- table for blocking sites with keyword
(
  OID           integer NULL,
  KeywordToBlock    text NOT NULL,
  KeywordBlockingTo text NOT NULL,
  Status boolean NOT NULL,
  PRIMARY KEY (KeywordToBlock,KeywordBlockingTo)
)
;

insert into stringsMap values ("GROUPNAME_BLOCKED_KEYWORD_MAP_IN_USE","Selected Group Name(s) are using in Keyword Blocking");

CREATE TABLE PortTriggering
(
  OID                integer NULL,
  RuleName           text NOT NULL,                 -- port triggering rule name
  RuleStatus         integer NOT NULL,              -- enable/disable port trigger
  Interface          text    NOT NULL,               --rules for specific interface LAN/DMZ
  Protocol           integer NOT NULL,              -- protocol name 1-tcp,2-udp
  OutgoingPortStart  integer NOT NULL,              -- outgoing start port
  OutgoingPortEnd    integer NOT NULL,              -- outgoing end port
  IncomingPortStart  integer NOT NULL,              -- incoming start port
  IncomingPortEnd    integer NOT NULL,              -- incoming end port  
  PRIMARY KEY (RuleName)                            -- primary key
)
;
insert into stringsMap values ("FW_PORT_TRG_CONFIG_FAILED","Port Triggering Rule Configuration Failed");
insert into stringsMap values ("FW_PORT_TRG_RULES_DELETED","Selected Rule(s) Deleted Successfully");
insert into stringsMap values ("FW_PORT_TRG_RULES_DELETE_FAILED","Rule(s) Delete Failed");


CREATE TABLE PortTriggerStatus
(
OID  integer NULL,
LanIpAddr text NOT NULL,
OpenPortRangeStart integer NOT NULL,
OpenPortRangeEnd integer NOT NULL,
TimeRemaining integer NOT NULL
)
;

CREATE TABLE AttackChecks
(
  ExternalPing boolean,
  StealthMode boolean NULL,
  TcpFlood boolean NULL,
  UdpFlood boolean NULL,
  UdpConnLimitVal integer NOT NULL,
  PingReplyOnLan boolean NULL,
  DnsProxy boolean NULL,
  IpsecPassthrough boolean NULL,
  PptpPassthrough boolean NULL,
  L2tpPassthrough boolean NULL,
  BlockSpoof boolean NULL,
  TcpFilterCheck boolean NULL
)
;

insert into stringsMap values ("FW_AC_CONFIG_FAILED","Attack checks Configuration Failed");

CREATE TABLE AttackChecks6
(
  ExternalPing boolean,    -- enable/disable respond to ping on IPv6 WAN port
  BlockFragPkts boolean  
)
;

CREATE TABLE accessMgmt
(
    accessMgmtEnable integer NOT NULL,
    serviceType integer NOT NULL,
    accessMgmtIP1 text,
    accessMgmtIP2 text ,
    accessType integer NOT NULL,
    port integer NOT NULL,
    PRIMARY KEY (serviceType)
)
;


insert into stringsMap values("ACCESSMGMT_CONFIG_FAILED","Accesss Management Configuration Failed");

CREATE TABLE RemoteSnmp
(
    Status integer NOT NULL
)
;

CREATE TABLE ContentFiltering
(
  OID    integer NULL, 
  Status boolean NOT NULL                      --enable/disable content filter
  
)
;
insert into tableDefaults values ("ContentFiltering","Status","0","0","1");
insert into tableDefaults values ("FirewallLogs","webCategoryAccept","0","0","1");
insert into tableDefaults values ("FirewallLogs","webCategoryDrop","0","0","1");
insert into tableDefaults values ("FirewallLogs","categoryServerLogs","0","0","1");



CREATE TABLE WebComponents
(
  OID    integer NULL, 
  ProxyEnable           boolean NULL,       --Enable/Disable proxy to block
  JavaComponentEnable   boolean NULL,       --Enable/Disable Java component 
  ActivexControlEnable  boolean NULL,       --1-Enable/ 0-Disable 
  CookiesEnable         boolean NULL
)
;

insert into tableDefaults values ("WebComponents","ProxyEnable","0","0","1");
insert into tableDefaults values ("WebComponents","JavaComponentEnable","0","0","1");
insert into tableDefaults values ("WebComponents","ActivexControlEnable","0","0","1");
insert into tableDefaults values ("WebComponents","CookiesEnable","0","0","1");



CREATE TABLE TrustedDomains      -- table for blocking sites with keyword
(
  OID    integer NULL, 
  KeywordToAllow  text NULL,
  PRIMARY KEY (KeywordToAllow)
)
;

CREATE TABLE siteCategory       -- table for blocking websites by category
(
  OID           integer NULL,
  categoryList  text    NOT NULL,
  wcfStatus     boolean NOT NULL,                      --enable/disable content filter
  nonManagedVerdict     boolean NOT NULL,                      --enable/disable content filter
  categoryVerdict     boolean NOT NULL,                      --enable/disable content filter
  timeout     integer NOT NULL,                     --enable/disable content filter
  updateAccess     boolean NOT NULL                      --enable/disable content filter
)
;

CREATE TABLE siteCategoryConfig -- table for storing site Category server information
(
  OID       integer NULL,
  siteCategorySeverName text    NOT NULL
)
;

insert into stringsMap values ("FW_CF_CONFIG_FAILED","Content Filtering Configuration Failed");
insert into stringsMap values ("FW_KEYWORD_CONFIG_FAILED","Blocked Keyword Configuration Failed");
insert into stringsMap values ("FW_DOMAINS_CONFIG_FAILED","Trusted Domain Configuration Failed");
insert into stringsMap values ("FW_BLOCKED_KEYWORDS_DELETE_FAILED","Blocked Keyword Delete Failed");
insert into stringsMap values ("FW_BLOCKED_KEYWORDS_DELETED","Blocked Keyword(s) Deleted Successfully");
insert into stringsMap values ("FW_TRUSTED_DOMAINS_DELETE_FAILED","Trusted Domain Delete Failed");
insert into stringsMap values ("FW_TRUSTED_DOMAINS_DELETED","Trusted Domain(s) Deleted Successfully");
insert into stringsMap values ("IMPORT_FAILED","Import Failed");
insert into stringsMap values ("EXPORT_FAILED","Export Failed");
insert into stringsMap values ("NULL_PARAMETER","Parameter missing");
insert into stringsMap values ("TABLE_NOT_SUPPORTED","This feature is not supported for this table");


CREATE TABLE NatTable
(
  OID              integer NULL, 
  Enable           boolean NOT NULL,
  NATInterfaces    text NULL,
  RoutedInterfaces text NULL,
  BridgeVlan       boolean NOT NULL
)
;
insert into tableDefaults values("NatTable","BridgeVlan","1","","");
insert into stringsMap values ("ROUTING_MODE_CONFIG_FAILED","Routing Mode Configuration Failed");

-- table for firewall IP MAC binding
CREATE TABLE IPMACBinding 
( 
 OID integer NULL,
 Name               text NOT NULL,          --name of the entry for IPMACBinding
 SourceMACAddress   text NOT NULL,         
 IPAddress          text NOT NULL,
 LogStatus          boolean NOT NULL,
 AssociatingEnabled boolean NOT NULL,
 PRIMARY KEY (Name)
)
;

-- table for firewall MAC filtering configuration
CREATE TABLE MACFiltering 
( 
 OID integer NULL,
 MACFilterEnable    boolean NOT NULL,       --Enable/Disable Mac Filter status
 MACAddressPolicy  boolean NOT NULL         --policy for the MAC Address
)
;

-- table for MAC address of  firewall MAC filtering 
CREATE TABLE SourceMACAddress 
( 
 OID integer NULL,
 SourceMACAddress      text NOT NULL,      
 PRIMARY KEY (SourceMACAddress)
)
;


-- table for IP MAC binding Email configuration
CREATE TABLE IPMACEmailLogsConfig
(
 OID integer NULL,
 IPMACVoilationEmailLogsSet boolean NOT NULL    
)
;

insert into stringsMap values ("FW_MAC_DELETE_FAILED","Mac address Deletion Failed");
insert into stringsMap values ("FW_MAC_DELETED","Selected Mac Address Deleted");
insert into stringsMap values ("FW_IPMAC_DELETE_FAILED","Ip/Mac Binding Deletion Failed");
insert into stringsMap values ("FW_IPMAC_DELETED","Selected Ip/Mac Bindings Deleted");
insert into stringsMap values ("FW_MACFILTERING_CONFIG_FAILED","Source Mac Filtering Configuration Failed");
insert into stringsMap values ("FW_IPMACBINDING_CONFIG_FAILED","IpMacBinding Configuration Failed");
insert into stringsMap values ("FW_IPMACBINDING_CONFIG_DUPLICATE","Mac Address or IP Address already configured.");



CREATE TABLE ProtocolBinding
(
    OID integer,
    ServiceName text,
    Enabled boolean NOT NULL,
    LocalGatewayType integer NOT NULL,    
    SourceNetworkType integer NOT NULL,
    SourceNetworkStart text,
    SourceNetworkEnd text,
    DestinationNetworkType integer NOT NULL,
    DestinationNetworkStart text,
    DestinationNetworkEnd text,
    FOREIGN KEY (ServiceName) REFERENCES Services (ServiceName)
);

insert into tableDefaults values ("ProtocolBinding","Enabled","1","0","1");
insert into stringsMap values ("PB_RULES_ENABLED_FAILED","Selected Protocol Binding Rule(s) Enabling Failed");
insert into stringsMap values ("PB_RULES_ENABLED","Selected Protocol Binding Rule(s) Enabled Successfully");
insert into stringsMap values ("PB_RULES_DISABLED_FAILED","Selected Protocol Binding Rule(s) Disabling Failed");
insert into stringsMap values ("PB_RULES_DISABLED","Selected Protocol Binding Rule(s) Disabled Successfully");
insert into stringsMap values ("PB_RULES_DELETE_FAILED","Selected Protocol Binding Rule(s) Delete Failed");
insert into stringsMap values ("PB_RULES_DELETED","Selected Protocol Binding Rule(s) Deleted Successfully");
insert into stringsMap values ("PB_RULE_CONFIG_FAILED","Protocol Binding Rule Configuration Failed");

CREATE TABLE FwDosAttackSettings  --table Dos Attack ICMP flood and SYN floodsettings
(
OID                     integer  NULL,
SynFloodDetectRate      integer NOT NULL,
EchoStormFloodRate      integer NOT NULL,
IcmpFloodRate           integer NOT NULL
)
;

CREATE TABLE FirewallLogs
(
OID                            integer NULL,
LANToWANAccept                 boolean NOT NULL,   --LAN to WAN Accept packets logs
LANToWANDrop                   boolean NOT NULL,   --LAN to WAN Drop packets logs
WANToLANAccept                 boolean NOT NULL,   --WAN to LAN accept packets logs		 
WANToLANDrop                   boolean NOT NULL,   --WAN to LAN Drop packets logs	 
LANToDMZAccept                 boolean NOT NULL,   --LAN to DMZ	Accept packets logs 
LANToDMZDROP                   boolean NOT NULL,   --LAN to DMZ drop packets logs	 
DMZToWANAccept                 boolean NOT NULL,   --DMZ to WAN Accept packets logs	 
DMZToWANDrop                   boolean NOT NULL,   --DMZ to WAN drop packets logs		 
DMZToLANAccept                 boolean NOT NULL,   --DMZ to LAN Accept packets logs	 
DMZToLANDrop                   boolean NOT NULL,   --DMZ to LAN drop packets logs 
WANToDMZDrop                   boolean NOT NULL,   --WAN to DMZ drop packets logs
WANToDMZAccept                 boolean NOT NULL,   --WAN to DMZ Accept packets logs
LANToLANAccept                 boolean NOT NULL,   --LAN to LAN Accept packets logs
LANToLANDrop                   boolean NOT NULL,   --LAN to LAN Drop packets logs
UnicastTraffic                 boolean NOT NULL,   --All unicast traffic logs	 
BroadCastORMulticastTraffic    boolean NOT NULL,   --All Broadcast/mulitcast traffic logs
SourceMACFilter                boolean NOT NULL,   --source MAC filter logs
SessionLimitLogs               boolean NOT NULL,	  	  
BandwidthLimitLogs             boolean NOT NULL,
FtpLogs                        boolean NOT NULL,    --FTP Data logs
IcmpInvalidLogs                boolean NOT NULL,    
IcmpRedirectedLogs             boolean NOT NULL,
logInvalidPacket               boolean NOT NULL,
webCategoryAccept              boolean NOT NULL,    --Access allowed websites
webCategoryDrop                boolean NOT NULL,    --Access blocked websites
categoryServerLogs             boolean NOT NULL     --Remote classification server logs
)
;


CREATE TABLE FirewallLogs6
(
OID                            integer NULL,
LANToWANAccept                 boolean NOT NULL,   --LAN to WAN Accept packets logs
LANToWANDrop                   boolean NOT NULL,   --LAN to WAN Drop packets logs
WANToLANAccept                 boolean NOT NULL,   --WAN to LAN accept packets logs		 
WANToLANDrop                   boolean NOT NULL    --WAN to LAN Drop packets logs	 
)
;


CREATE TABLE OtherSystemLogs
(
OID                     integer NULL,
ChangeOfTimeByNTPLogs  	boolean NOT NULL, 	 
LoginAttemptsLogs       boolean NOT NULL,
SecureLoginAttempts 	boolean NOT NULL,	 
RebootLogs              boolean NOT NULL,
WANStatusLogs  	 	    boolean NOT NULL,
ResolvedDNSNames        boolean NOT NULL
);

CREATE TABLE IcsaSettings               --table for ICSA settings
(
 OID integer,
 BlockICMPNotification boolean,
 BlockFragPkts         boolean,
 BlockMulticastPkts    boolean,
 BlockTcpRST           boolean,
 BlockFtpBounceAttack  boolean
)
;



CREATE TABLE GlobalSettings
(
    OID integer,
    MaxUnidentifiedSessions integer NOT NULL,
    MaxHalfOpenSessions integer NOT NULL,
    TcpSessionTimoutDuration integer NOT NULL,
    UdpSessionTimoutDuration integer NOT NULL,
    OtherSessionTimeoutDuration integer NOT NULL,
    TcpSessionCleanupLatency integer NOT NULL
)
;
CREATE TABLE FwTrafficMeter
(
    OID integer,
    TrafficMeterStatus      boolean NOT NULL, -- enable/disable Trafficmeter
    WanId                   integer NOT NULL, -- wan mode 1-WAN1, 2-WAN2
    TrafficLimitType        integer,          -- 0 -No limit, 1-Download only, 2-Both Directions
    TrafficMonthlyLimit       integer,     -- monthly limit
    IncreaseLimitStatus       boolean,     -- Enable/disable increase limit
    IncreaseLimitBy           integer,     -- Extra traffic limit for this month
    RestartCounter            boolean,     -- 0 -Restart the counters now
                                           -- 1 -Restart counter on specific time 
    TimeHH                    integer,     -- hours
    TimeMM                    integer,     -- minutes
    DayOfMonth                integer,     -- Day of the month
    SendEmailReport           integer,     -- sends the email report before restart
    BlockTraffic              boolean,     -- 0 -Block All traffic when limit is reached
                                           -- 1 - Block All traffic Except Email
    SendEmailAlert            boolean,     -- Enable/Disable Email Alert
    PRIMARY KEY (WanId)
)    
;
CREATE TABLE TrafficCounters
(
OID     integer NULL,
WanId   integer NOT NULL,
TotalInCounter NUMERIC,
TotalOutCounter NUMERIC,
HttpInCounter NUMERIC,
HttpOutCounter NUMERIC,
EmailInCounter NUMERIC,
EmailOutCounter NUMERIC,
TfMtrlimitStatus  NUMERIC,     -- 1- traffic meter limit reached
                               -- 0- traffic meter limit not reached
PRIMARY KEY (WanId)
)
;

CREATE TABLE TrafficStatistics      -- table for traffic meter statistics
(
 OID             integer  NULL,
 WanId           integer NOT NULL,      -- 1= wan1 2=wan2
 StartTime       text     NULL,         --traffic Date/Time
 StartTimeReset  integer,         -- 1= ResetTime 0=Don't Reset
 OutgoingTrafVol integer  NULL,  --outgoing traffic volume
 IncomingTrafVol integer  NULL,  -- incoming traffic volume
 AvgPerDay       integer  NULL,  --Average per day
 StandardLimit   integer  NULL,  -- % of stadard limit
 ThisMonthLimit  integer  NULL,   -- %of this month limit
 PRIMARY KEY (WanId)
)
;

CREATE TABLE OneToOneNat
(
    OID             integer NULL,
    WanIfName       text  NOT NULL, -- WAN1/WAN2 etc
    PrivateIPstart  text NOT NULL, -- IP address in LAN
    PublicIPstart   text NOT NULL, -- public ip address
    PublicIPmask    text NOT NULL,    -- public IP address maks ex: 255.255.255.0
    RangeLen        integer  NULL, -- no of address from the start ip address
    PRIMARY KEY (PrivateIPstart)
)
;

CREATE TABLE OneToOneNatService
(
    OID             integer NULL,
    LanServerIp     text NOT NULL,  
    serviceName     text NOT NULL,  --service to be forwarded for LAN host
    WanIfName       text  NOT NULL, -- WAN1/WAN2 etc
    PRIMARY KEY (serviceName)
)
;

CREATE TABLE DefaultIfGrpInfo
(
    OID  integer NULL,
    LogicalIfName        text NOT NULL,
    VirtualIfName        text NOT NULL,
    IfGroupId            integer NOT NULL,
    PRIMARY KEY (LogicalIfName, VirtualIfName)
)
;

-- AlgConf - table for ALG configuration.
CREATE TABLE AlgConf
    (
    OID   Integer     NULL, -- OID
    Pptp  Boolean NOT NULL, -- PPTP ALG
    Ipsec Boolean NOT NULL, -- IPSEC ALG
    Rtsp  Boolean NOT NULL, -- RTSP ALG
    Sip   Boolean NOT NULL, -- SIP ALG
    H323  Boolean NOT NULL, -- H323 ALG
    Smtp  Boolean NOT NULL, -- SMTP ALG
    Dns   Boolean NOT NULL, -- DNS ALG
    Tftp  Boolean NOT NULL  -- TFTP ALG
    );

-- BW Mon table
CREATE TABLE BwMonStat
(
    OID   Integer     NULL, -- OID
    LogicalIfName     text NOT NULL,
    AppName              text NOT NULL,    
    Counter              text NOT NULL,    
    PRIMARY KEY (LogicalIfName, AppName)
);

--IntelAmt - table for enabling fixed ports
CREATE TABLE IntelAmt
(
    Status            Integer NOT NULL,
    AddressType       Integer NOT NULL,
    ExternalIpStr     text NULL,
    LocalServerIp     text NULL
);

CREATE TABLE smtpAlg
(
    smtpAlgStatus  integer NOT NULL, -- enable-1, disable-0
    port       integer -- port on which smtp traffic is being expected
);

CREATE TABLE approvedMailIdList
(
approvedMailId  text, -- MailId to be allowed
PRIMARY KEY (approvedMailId)
);

CREATE TABLE blockedMailIdList
(
blockedMailId  text, -- MailId to be blocked
PRIMARY KEY (blockedMailId)
);

CREATE TABLE subjectList
(
subject  text, --Subject of the mail
mailId   text, -- MailId (To or From)
action   integer --0 for block and 1 for allow
);

CREATE TABLE blockMAC
(
sourceMACAddress  text NOT NULL, -- Source MAC address
description  text NOT NULL, -- Source MAC address description
PRIMARY KEY (sourceMACAddress)
);

CREATE TABLE fwDefaultOutBoundPolicy
(
  OID              integer NULL, 
  Ipmode           integer, --1 for Ipv4 and 2 for Ipv6
  DefaultPolicyStatus boolean NOT NULL -- Default OutBound Policy Status
)
;

create table IpsecLocalTrafficSelectorMapping
(
vpnPolicyStatus boolean   NOT NULL,-- status of the VPN policy (enable/disable)
sourceIpStart text NOT NULL,
mappedIpStart text NOT NULL,
rangeLength   integer NOT NULL,
vpnPolicyName text      NOT NULL UNIQUE,-- VPN Policy Name
dstTrafficSeletorType integer NOT NULL, --0 :ANY,1 :Single, 2 :Range, 3 :Subnet
dstTrafficSelectorIpStart text,
dstTrafficSelectorIpEnd   text,
dstTrafficSelectorSubnetMask text
);

create table webAccessStatus
(
accessStatus boolean   NOT NULL -- status of the Web Access Filter (enable/disable)
);

create table webAccessInfo
(
name    text NULL,             -- name of the rule
accessType boolean   NOT NULL, -- accessType (0:  Single IP Address /1 : Vlan Network)
IpAddr text NULL,              -- Single IP Address 
vlanName   text NULL,          -- vlan Network Name
vlanIpAddr text NULL,          -- vlan IP Address
vlanSubnet text NULL,          -- vlan Subnet Mask
PRIMARY KEY (name,IpAddr,vlanName)
);

create table urlFilteringAccessControl
(
enable    boolean NOT NULL,   -- access control feature status (0/1) == (disable/enable)
action    boolean   NOT NULL  -- access control action (0/1) == (blacklist/whitelist)
);

create table urlFilteringAccessControlPolicy
(
policyName    text NOT NULL,   -- access control policy name
policyType    integer  NOT NULL,  -- access control policy type say, (0/1/2) == (IP/RANGE/INTERFACE)
ipAddress     text NULL,
startIpAddress text NULL,
endIpAddress text NULL,
interfaceName text NULL,
PRIMARY KEY (policyName)
);

-- default values for urlFilteringAccessControl
insert into tableDefaults values ("urlFilteringAccessControl","enable","0","0","1");
insert into tableDefaults values ("urlFilteringAccessControl","action","0","0","1");

CREATE TABLE bandwidthmanagement
(
    OID                    integer,               --OID
    action                 boolean     NOT NULL,  --Enable or disable 
    service                text     NOT NULL,  --service
    waninterface           text      NOT NULL,  --- wan 
    bandwidthrate          integer      NOT NULL  --- bandwidth rate        
);

insert into tableDefaults values ("bandwidthmanagement","action","0","","");

insert into tableDefaults values ("bandwidthmanagement","service","ANY","","");

insert into tableDefaults values ("bandwidthmanagement","waninterface","WAN1","","");

insert into tableDefaults values ("bandwidthmanagement","bandwidthrate","50","","");


insert into saveTables (tableName) values("bandwidthmanagement");

insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,0,"bandwidthmanagement",0,1,1,1);


--Error strings:
insert into stringsmap values ("FAILED_TO_ADD","Insert Failed");
insert into stringsmap values ("FAILED_TO_EDIT","Edit Failed");
insert into stringsmap values ("FAILED_TO_DELETE","Delete Failed");

--Default values 

--siteCategory service-provider server URL
insert into siteCategoryConfig values (0, "ckr.tf1-devtest.com");

CREATE TABLE sessionLimitProfiles
(
    OID            integer,
    profileName    text    NOT NULL, -- session limit profile name
    sourceType     integer NOT NULL,
    startIpAddr    text    NOT NULL,
    endIpAddr      text    , -- Ip/network address
    netMask        text    , -- Network mask
    interface      text    ,
    sessionLimit   integer NOT NULL, -- session limit
    enableSchedule boolean NOT NULL,  -- schedule enabled/disabled for profile
    scheduleProfile text   ,  -- select schedule profile
    PRIMARY KEY (profileName) 
);

insert into tableDefaults values ("sessionLimitProfiles","sourceType","1","","");
insert into tableDefaults values ("sessionLimitProfiles","sessionLimit","100","0","999");
insert into tableDefaults values ("sessionLimitProfiles","enableSchedule","0","","");


CREATE TABLE warningMessage
(
    OID            integer ,
    warningMessage text     NOT NULL
);
insert into tableDefaults values ("warningMessage","warningMessage","You have reached maximum number of permitted internet sessions. Please close one or more applications to allow further internet access. Contact system administrator for more information","","");

CREATE TABLE profileBlockAllTraffic
(
    OID             integer,
    profileName     text    NOT NULL,
    sourceType      integer NOT NULL,
    startIpAddr     text    NOT NULL,
    endIpAddr       text    ,
    netMask         text    ,
    profileBlockAllTraffic boolean NOT NULL,
    FOREIGN KEY (profileName) REFERENCES sessionLimitProfiles (profileName)
);

CREATE TABLE sessionLimitProfileStats 
(
    OID            integer,
    profileName    text    NOT NULL, -- session limit profile name
    currentSessions integer NULL, -- session limit
    totalSessions   integer NULL,
    FOREIGN KEY (profileName) REFERENCES sessionLimitProfiles (profileName)
);

--Lan
--insert into BwMonStat values (0, "LAN", "HTTP", "0");
--insert into BwMonStat values (0, "LAN", "HTTPS", "0");
--insert into BwMonStat values (0, "LAN", "DNS", "0");
--insert into BwMonStat values (0, "LAN", "SMTP", "0");
--insert into BwMonStat values (0, "LAN", "IMAP2", "0");
--insert into BwMonStat values (0, "LAN", "IMAP3", "0");
--insert into BwMonStat values (0, "LAN", "POP3", "0");
--insert into BwMonStat values (0, "LAN", "SSH", "0");
--insert into BwMonStat values (0, "LAN", "TELNET", "0");
--insert into BwMonStat values (0, "LAN", "SNMP", "0");
--insert into BwMonStat values (0, "LAN", "NFS", "0");
--Wan1
--insert into BwMonStat values (0, "WAN1", "HTTPS", "0");
--insert into BwMonStat values (0, "WAN1", "HTTP", "0");
--insert into BwMonStat values (0, "WAN1", "DNS", "0");
--insert into BwMonStat values (0, "WAN1", "SMTP", "0");
--insert into BwMonStat values (0, "WAN1", "IMAP2", "0");
--insert into BwMonStat values (0, "WAN1", "IMAP3", "0");
--insert into BwMonStat values (0, "WAN1", "POP3", "0");
--insert into BwMonStat values (0, "WAN1", "SSH", "0");
--insert into BwMonStat values (0, "WAN1", "TELNET", "0");
--insert into BwMonStat values (0, "WAN1", "SNMP", "0");
--insert into BwMonStat values (0, "WAN1", "NFS", "0");
--Wan2
--insert into BwMonStat values (0, "WAN2", "HTTPS", "0");
--insert into BwMonStat values (0, "WAN2", "HTTP", "0");
--insert into BwMonStat values (0, "WAN2", "DNS", "0");
--insert into BwMonStat values (0, "WAN2", "SMTP", "0");
--insert into BwMonStat values (0, "WAN2", "IMAP2", "0");
--insert into BwMonStat values (0, "WAN2", "IMAP3", "0");
--insert into BwMonStat values (0, "WAN2", "POP3", "0");
--insert into BwMonStat values (0, "WAN2", "SSH", "0");
--insert into BwMonStat values (0, "WAN2", "TELNET", "0");
--insert into BwMonStat values (0, "WAN2", "SNMP", "0");
--insert into BwMonStat values (0, "WAN2", "NFS", "0");

-- Event handlers for Firewall
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"LanGroup",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"LanHost",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"Services",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"Schedules",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"FirewallRules", 0,1,1,1);  
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"L2FirewallRules", 0,1,1,1);  
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"FirewallRules6", 0,1,1,1); 
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"PortTriggering",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"AttackChecks",
                                        0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"AttackChecks6",
                                        0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"accessMgmt", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"RemoteSnmp", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"L2FirewallDefaultPolicy", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"ContentFiltering",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"WebComponents",
                                        0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"TrustedDomains",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"BlockSites",0,1,1,1);  
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"siteCategory",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"NatTable",0,1,1,1);
-- Register networkInterface table to update firewall Rules.
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"networkInterface",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"fwPriorityMap",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"fwPriorityMap6",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"IPMACBinding",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"SourceMACAddress",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"MACFiltering",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"FwDosAttackSettings",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"fwDefaultOutBoundPolicy",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"FirewallLogs",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"FirewallLogs6",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"IcsaSettings",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"GlobalSettings",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"WanMode",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"ProtocolBinding",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"FwTrafficMeter",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"BwMonStat",
                                        0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"dhcp",0,1,1,1);
-- Register Zones table to update firewall Rules.
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"Zones",6,1,1,1);

insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"OneToOneNat",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"OneToOneNatService",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"DefaultIfGrpInfo",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"interVLANRouting",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"interVLAN",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"CaptivePortalSession",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"CaptivePortal",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"CaptivePortalVlan",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"IntelAmt",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"SharePortVlan",0,1,1,0);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"wirelessCtrl",0,1,1,0);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"pptpClient",0,1,1,0);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"sessionLimitProfiles",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"warningMessage",0,1,0,0);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"profileBlockAllTraffic",0,1,1,1);

-- Registration for smtpAlg
insert into dbUpdateRegisterTbl values ('UMI_COMP_FIREWALL',0,1,'smtpAlg',0,1,1,1);
insert into dbUpdateRegisterTbl values ('UMI_COMP_FIREWALL',0,1,'approvedMailIdList',0,1,1,1);
insert into dbUpdateRegisterTbl values ('UMI_COMP_FIREWALL',0,1,'blockedMailIdList',0,1,1,1);
insert into dbUpdateRegisterTbl values ('UMI_COMP_FIREWALL',0,1,'subjectList',0,1,1,1);

insert into stringsMap values ("CONFIG_FAILED","One to one nat config failed");

-- Register AlgConf for firewall
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"AlgConf",0,1,1,1);
-- Register GRE to firewall
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"GRE",0,1,1,1);

-- Register IpsecLocalTrafficSelectorMapping for firewall
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"IpsecLocalTrafficSelectorMapping",0,1,1,1);

-- Register blockMAC for firewall
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"blockMAC",0,1,1,1);

-- Register webAccessStatus for firewall
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"webAccessStatus",0,1,1,1);

-- Register webAccessInfo for firewall
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"webAccessInfo",0,1,1,1);

--Register urlFilteringAccesControl for firewall
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"urlFilteringAccessControl",0,1,1,0);

--Register urlFilteringAccesControlPolicy for firewall
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"urlFilteringAccessControlPolicy",0,1,1,1);


-------------------------------------------------------------------------------
--                        IPv4 Firewall Default Rules
-------------------------------------------------------------------------------
-- NAT Defaults:
-- =============

-- -A PREROUTING -j fwCPRedirect
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_NAT_IB_REDIRECT_RULE", 1, "fwCPRedirect", "ANY", "ANY");

-- -A PREROUTING -j fwDhcpRelay
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_NAT_IB_REDIRECT_RULE", 1, "fwDhcpRelay", "ANY", "ANY");

-- -A PREROUTING -j preOneToOneNat
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_NAT_IB_INTERNAL_DNAT_GRP", 1, "preOneToOneNat", "ANY", "ANY");

-- -A PREROUTING -m set --set Dnat dst -j fwIntelAmtIn
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_NAT_IB_INTERNAL_DNAT_GRP", 1, "fwIntelAmtIn", "ANY", "ANY");

-- -A PREROUTING -m set --set Dnat dst -j INSECURE_SECURE
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_NAT_IB_INTERNAL_DNAT_GRP", 1, "INSECURE_SECURE", "ANY", "ANY");

-- -A PREROUTING -m set --set Dnat dst -j INSECURE_PUBLIC
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_NAT_IB_INTERNAL_DNAT_GRP", 1, "INSECURE_PUBLIC", "ANY", "ANY");

-- -A PREROUTING -i <wan<N>Iface> -j TRIGGER --trigger-type dnat
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_NAT_IB_TRIGGER_DNAT", 1, "FW_TRIGGER_DNAT", "INSECURE", "ANY");

-- -A PREROUTING -i <lanIface> -j DEFAULT_WEB_SERVICE
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_NAT_IB_REDIRECT_RULE", 1, "DEFAULT_WEB_SERVICE", "SECURE", "ANY");

-- -A PREROUTING -i <lanIface> -j REDIRECT_RULE
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_NAT_IB_REDIRECT_RULE", 1, "REDIRECT_RULE", "SECURE", "ANY");

-- -A POSTROUTING  -j postOneToOneNat
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_NAT_OB_INTERNAL_INSECURE", 1, "postOneToOneNat", "ANY", "INSECURE");

-- -A POSTROUTING -o <wan<N>Iface> -j fwIntelAmtOut
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_NAT_OB_INTERNAL_INSECURE", 1, "fwIntelAmtOut", "ANY", "INSECURE");

-- -A POSTROUTING -o <wan<N>Iface> -j SECURE_INSECURE
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_NAT_OB_INTERNAL_INSECURE", 1, "SECURE_INSECURE", "ANY", "INSECURE");

-- -A POSTROUTING -o <wan<N>Iface> -j PUBLIC_INSECURE
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_NAT_OB_INTERNAL_INSECURE", 1, "PUBLIC_INSECURE", "ANY", "INSECURE");

-- -A POSTROUTING -o <wan<N>Iface> -j SNAT --to-source <wan<N>Addr>  
insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_NAT_OB_SNAT_RULE", 1, "FW_SNAT_INSECURE","ANY", "INSECURE");

-- -A POSTROUTING -m mark --mark 0x1111 -j SNAT --to-source <lanAddr>
insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_NAT_OB_SNAT_MARK_DNAT", 1, "FW_SNAT_SECURE","ANY", "ANY");

-- Firewall Defaults:
-- ==================
-- -A INPUT -m mark --mark 0xF1DEAD -j CONNMARK --set-mark 0XF1DEAD
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_IB_IPSEC_CONNMARK", 1, "CONNMARK", "ANY", "ANY");

-- -A INPUT -m mark --mark 0xF1DEAD -j ACCEPT
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_IB_IPSEC_MARK", 1, "ACCEPT", "ANY", "ANY");

-- -A INPUT -p udp -j fwInDhcpRelay  
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwInDhcpRelay", "ANY", "ANY", 17);

-- -A INPUT -j fwCPRedirectAccept
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwCPRedirectAccept", "ANY", "ANY");

-- -A INPUT -j fwAntiSpoof
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwAntiSpoof", "ANY", "ANY");

-- -A INPUT -i <loIface> -j ACCEPT
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_IB_LOOP_BACK", 1, "ACCEPT", "LOCAL", "ANY");

-- -A INPUT -i <lanIface> -p icmp -j fwLanToBox
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwLanToBox", "SECURE", "ANY");
	 	 
-- -A INPUT -i <dmzIface> -p icmp -j fwInputLnA 
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwInputLnA", "PUBLIC", "ANY", 1); 
	 	 
-- -A INPUT -i <dmzIface> -p icmp --icmp-type 8 -m limit --limit 10/second --limit-burst 30/second -j fwInputLnA 
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart, TrafficLimit, MaximumTrafficLimit) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwInputLnA", "PUBLIC", "ANY", 1, 8, 36000, 30); 

-- -A INPUT -p icmp -j fwInFlood 
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwInFlood", "ANY", "ANY",1); 

-- -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, ConnectionState) values ("edit=0","FW_FILTER_IB_STATE", 1, "ACCEPT", "ANY", "ANY", "RELATED,ESTABLISHED");

-- -A INPUT -j fwInTcpFilter
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_IB_TCP_FLAG", 1, "fwInTcpFilter", "ANY", "ANY");

-- -A fwInTcpFilter (This rule LOGs and DROPs the non-syn packets which are sent before tcp handshake has been done)
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_TCP_FLAG", 1, "fwInTcpFilter", "ANY", "ANY");

-- -A fwInputLnA -j ACCEPT
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_IN_ACCEPT", 1, "ACCEPT", "ANY", "ANY");


-- A INPUT -i <lanIface> -p tcp --dport 49152:49153 -j fwInputLnA
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart, DestinationPortEnd) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwInputLnA", "SECURE", "ANY", 6, 49152, 49153);

-- A INPUT -i <lanIface> -p udp --dport 1900 -j fwInputLnA
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType,
--Protocol, DestinationPortStart) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwInputLnA", "SECURE", "ANY", 17, 1900);

-- A INPUT -i <lanIface> -p 41 -j fwInputLnA
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwInputLnA", "SECURE", "ANY", 41);

-- A INPUT -i <wanIface> -p 41 -j fwInputLnA
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwInputLnA", "INSECURE", "ANY", 41);

-- -A INPUT -i <lanIface> -p tcp --syn --dport FW_HTTP_PROXY_PORT -j fwInputLnA

--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0", "FW_FILTER_IB_SYN_SERVICE", 1, "fwInputLnA", "SECURE", "ANY", 6, 8080);

-- -A INPUT -i <lanIface> -p tcp --syn --dport FW_TELNET_PORT -j fwInputLnA
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","FW_FILTER_IB_SYN_SERVICE", 1, "fwInputLnA", "SECURE", "ANY", 6, 23);

-- -A INPUT -i <lanIface> -p tcp --syn --dport  FW_HTTP_PORT -j fwInputLnA
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","FW_FILTER_IB_SYN_SERVICE", 1, "fwInputLnA", "SECURE", "ANY", 6, 80);

-- -A INPUT -i <lanIface> -p tcp --syn --dport FW_HTTPS_PORT -j fwInputLnA
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","FW_FILTER_IB_SYN_SERVICE", 1, "fwInputLnA", "SECURE", "ANY", 6, 443);

-- -A INPUT -i <lanIface> -p tcp --syn --dport FW_SSH_PORT -j fwInputLnA
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType,Protocol, DestinationPortStart) values ("edit=0","FW_FILTER_IB_SYN_SERVICE", 1,"fwInputLnA", "SECURE", "ANY", 6, 22);

-- -A INPUT -i <lanIface> -p tcp --dport FW_SAMBA_PORT -j fwUsbStorage
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType,Protocol, DestinationPortStart) values ("edit=0","FW_FILTER_IB_SERVICE", 1,"fwUsbStorage", "SECURE", "ANY", 6, 139);

-- -A INPUT -i <lanIface> -p tcp --dport FW_CUPS_PORT -j fwUsbPrinter 
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType,Protocol, DestinationPortStart) values ("edit=0","FW_FILTER_IB_SERVICE", 1,"fwUsbPrinter", "SECURE", "ANY", 6, 631);

-- -A INPUT -i <lanIface> -p udp --dport 67:68 -j fwInputLnA
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart, DestinationPortEnd) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwInputLnA", "SECURE", "ANY", 17, 67, 68);

-- -A INPUT -i <lanIface> -p udp --dport <ripPort> -j fwInputLnA
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType,
--    Protocol, DestinationPortStart) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwInputLnA", "SECURE", "ANY", 17, 520);

-- -A INPUT -i <lanIface> -p udp --dport 161 -j fwInputLnA
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwInputLnA", "SECURE", "ANY", 17, 161);

-- -A INPUT -i <dmzIface> -p udp --dport 67:68 -j fwInputLnA
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart, DestinationPortEnd) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwInputLnA", "PUBLIC", "ANY", 17, 67, 68);

-- -A INPUT -i <dmzIface> -p udp --dport 69 -j fwInputLnA
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwInputLnA", "PUBLIC", "ANY", 17, 69);

-- -A INPUT -p igmp -j fwIgmpIn
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, DestinationAddressType, DestinationAddressStart, DestinationAddressEnd, Protocol) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwIgmpIn", "ANY", "ANY", 2, "224.0.0.0", "239.255.255.255", 2);

-- -A INPUT -p udp -j fwInputDnsAndDhcp  
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwInputDnsAndDhcp", "ANY", "ANY", 17);

-- -A INPUT -p 50 -j fwInputLnA  (ESP);
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwInputLnA", "ANY", "ANY", 50);

-- -A INPUT -p 51 --j fwInputLnA (AH) 
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwInputLnA", "ANY", "ANY", 51);

-- -A INPUT -j fwRipInput
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_IB_INTERNAL", 1, "fwRipInput", "ANY", "ANY");

-- -A INPUT -p udp --dport 500 -j fwInputLnA
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwInputLnA", "ANY", "ANY", 17, 500);

-- -A INPUT -p udp --dport 4500 -j fwInputLnA
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwInputLnA", "ANY", "ANY", 17, 4500);

-- -A INPUT -j fwPPTPIn
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwPPTPIn", "ANY", "ANY");

-- -A INPUT -p icmp -j fwIcmpNotification 
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwIcmpNotification", "ANY", "ANY", 1);

-- A INPUT -i <lanIface> -p 89 -j fwInputLnA
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwInputLnA", "ANY", "ANY", 89);

-- -A INPUT -j fwInBypass
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_IB_INTERNAL", 1, "fwInBypass", "ANY", "ANY");

-- -A INPUT -j fwStealth
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_IB_INTERNAL", 1, "fwStealth", "ANY", "ANY");

-- -A INPUT -j fwInFltrEnd
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType)
--values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwInFltrEnd", "ANY", "ANY");

-- Bonjour Specific rule
-- -A INPUT -p udp --dport <mDNSPort> -j ACCEPT
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType,
--    Protocol, DestinationPortStart) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwInputLnA", "ANY", "ANY", 17, 5353);

-- Bonjour Specific rule
-- -A INPUT -p udp --sport <mDNSPort> -j ACCEPT
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType,
--    Protocol, SourcePort) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwInputLnA", "ANY", "ANY", 17, 5353);

-- -A fwdAccept -j ACCEPT
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType,
--    ToZoneType) values ("edit=0","IPS_QUEUE", 1, "ACCEPT", "ANY", "ANY");

-- -A FORWARD -m mark --mark 0xF1C001 -j ACCEPT
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_IPSEC_INET_MARK", 1, "ACCEPT", "ANY", "ANY");

-- -A FORWARD -m mark --mark 0xF1DEAD -j CONNMARK --set-mark 0XF1DEAD
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_IPSEC_CONNMARK", 1, "CONNMARK", "ANY", "ANY");

-- -A FORWARD -m mark --mark 0xF1DEAD -j ACCEPT
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_IPSEC_MARK", 1, "ACCEPT", "ANY", "ANY");

-- -A FORWARD -j fwAntiSpoof
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET", 1, "fwAntiSpoof", "ANY", "ANY");

-- -A FORWARD -j CONFIGFORWARD
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET", 1, "CONFIGFORWARD", "ANY", "ANY");

-- -A FORWARD -j fwSmtpAlg
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET", 1, "fwSmtpAlg", "ANY", "ANY");

-- -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, ConnectionState) values ("edit=0","FW_FILTER_FWD_STATE", 1, "ACCEPT", "ANY", "ANY", "RELATED,ESTABLISHED");

-- -A FORWARD -i <loIface> -j ACCEPT
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_LOOP_BACK", 1, "ACCEPT", "LOCAL", "ANY");

-- -A FORWARD -j fwInTcpFilter
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_TCP_FLAG", 1, "fwInTcpFilter", "ANY", "ANY");

-- -A FORWARD -o <wan<N>Iface>  fwVpnCheck
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_SERVICE", 1, "fwVpnCheck", "ANY", "INSECURE");

-- -A FORWARD -i <lanIface> -j fwSrcMacFltr
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET", 1, "fwSrcMacFltr", "SECURE", "ANY");

-- -A FORWARD -i <lanIface> -j fwBindIpToMac
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET", 1, "fwBindIpToMac", "SECURE", "ANY");

-- -A FORWARD -i <lanIface> -j fwBindMacToIp
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET", 1, "fwBindMacToIp", "SECURE", "ANY");

-- -A FORWARD -i -j fwConnLimitMatch
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET", 1, "fwConnLimitMatch", "ANY", "ANY");

-- -A FORWARD -i <lanIface> -o <dmzIface> -j SECURE_PUBLIC
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET", 1, "SECURE_PUBLIC", "SECURE", "PUBLIC");

-- -A FORWARD -i <dmzIface> -o <lanIface>  -j PUBLIC_SECURE
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET", 1, "PUBLIC_SECURE", "PUBLIC", "SECURE");

-- -A FORWARD -i <dmzIface> -o <wan<N>Iface> -j PUBLIC_INSECURE
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET", 1, "PUBLIC_INSECURE", "PUBLIC", "INSECURE");

-- -A FORWARD -i <lanIface> -o <wan<N>Iface> -j fwIntelAmtOut
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET", 1, "fwIntelAmtOut", "SECURE", "INSECURE");

-- -A FORWARD -i <lanIface> -o <wan<N>Iface> -j SECURE_INSECURE
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET", 1, "SECURE_INSECURE", "SECURE", "INSECURE");

-- -A FORWARD  -j fwTrigger
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET", 1, "fwTrigger", "ANY", "ANY");

-- -A FORWARD -j fwdOneToOneNat 
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET", 1, "fwdOneToOneNat", "ANY", "ANY");


-- -A FORWARD -j fwFltrIb 
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET", 1, "fwFltrIb", "ANY", "ANY");

-- -A FORWARD -j fwInterVlanRules
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET", 1, "fwInterVlanRules", "ANY", "ANY");

-- -A FORWARD -j fwInterVlanRouting
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_INTER_VLAN_ROUTING", 1, "fwInterVlanRouting", "ANY", "ANY");

-- -A FORWARD -m connmark --mark <wan1Mark/wan2Mark> -i <wan1> -o <lanIface> -j fwIntelAmtIn
insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET_LB", 1, "fwIntelAmtIn", "INSECURE", "SECURE");

-- -A FORWARD -m connmark --mark <wan1Mark/wan2Mark> -i <lanIface> -o <lanIface> -j fwIntelAmtIn 
insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET_LB_LAN_WAN1", 1, "fwIntelAmtIn", "SECURE", "SECURE");

-- -A FORWARD -m connmark --mark <wan1Mark/wan2Mark> -i <lanIface> -o <lanIface> -j fwIntelAmtIn
insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET_LB_LAN_WAN2", 1, "fwIntelAmtIn", "SECURE", "SECURE");

-- -A FORWARD -m connmark --mark <wan1Mark/wan2Mark> -i <wan1> -o <dmzIface> -j fwIntelAmtIn
insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET_LB", 1, "fwIntelAmtIn", "INSECURE", "PUBLIC");

-- -A FORWARD -m connmark --mark <wan1Mark/wan2Mark> -i <dmzIface> -o <dmzIface> -j fwIntelAmtIn
insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET_LB", 1, "fwIntelAmtIn", "PUBLIC", "PUBLIC");


-- -A FORWARD -m connmark --mark <wan1Mark/wan2Mark> -i <wan1> -o <lanIface> -j INSECURE_SECURE
insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET_LB", 1, "INSECURE_SECURE", "INSECURE", "SECURE");

-- -A FORWARD -m connmark --mark <wan1Mark/wan2Mark> -i <lanIface> -o <lanIface> -j INSECURE_SECURE
insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET_LB_LAN_WAN1", 1, "INSECURE_SECURE", "SECURE", "SECURE");

-- -A FORWARD -m connmark --mark <wan1Mark/wan2Mark> -i <lanIface> -o <lanIface> -j INSECURE_SECURE
insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET_LB_LAN_WAN2", 1, "INSECURE_SECURE", "SECURE", "SECURE");

-- -A FORWARD -m connmark --mark <wan1Mark/wan2Mark> -i <wan1> -o <dmzIface> -j INSECURE_PUBLIC
insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET_LB", 1, "INSECURE_SECURE", "INSECURE", "PUBLIC");

-- -A FORWARD -m connmark --mark <wan1Mark/wan2Mark> -i <dmzIface> -o <dmzIface> -j INSECURE_PUBLIC
insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET_LB", 1, "INSECURE_SECURE", "PUBLIC", "PUBLIC");

-- -A FORWARD -m connmark --mark <wan1Mark/wan2Mark> -j TRIGGER --trigger-type in
insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET_TRIGR_LB_WAN", 1, "FW_TRIGGER_IN", "ANY", "ANY");

-- -A FORWARD -m connmark --mark 0x888 -j TRIGGER --trigger-type in
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET_TRIGR_LB_WAN2", 1, "FW_TRIGGER_IN", "ANY", "ANY");


-- this rule  is to allow all the lan-lan[vlans included] traffic 
-- -A FORWARD -i <fwlanIface>  -o <fwlanIface> -j fwAccept 
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_DEFAULT", 1, "fwdAccept", "SECURE", "SECURE");

-- -A FORWARD -i <fwlanIface> -j DEFAULT_POLICY 
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_DEFAULT", 1, "DEFAULT_POLICY", "SECURE", "ANY");

-- this rule for accepting dmz static routing traffic 
-- -A FORWARD -i <fwdmzIface>  -o <fwdmzIface> -j INSECURE_SECURE
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET", 1, "fwdAccept", "PUBLIC", "PUBLIC");

-- -A FORWARD -i <fwdmzIface> -j INSECURE_SECURE
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET", 0, "INSECURE_SECURE", "PUBLIC", "ANY");

-- -A FORWARD -i <fwdmzIface> -j INSECURE_PUBLIC
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_SUBSET", 0, "INSECURE_PUBLIC", "PUBLIC", "ANY");

-- -A FORWARD -j fwFwdFltrEnd
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_SERVICE", 1, "fwFwdFltrEnd", "ANY", "ANY");

-- -A fwFltrIb -m connmark --mark 0x2222 -i <wan<N>Iface> -o <lanIface> -j fwIntelAmtIn 
insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_DNAT_CONNMARK", 1, "fwIntelAmtIn", "ANY", "SECURE");

-- -A fwFltrIb -m connmark --mark 0x2222 -i <lanIface> -o <lanIface> -j fwIntelAmtIn
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_DNAT_CONNMARK", 0, "fwIntelAmtIn", "SECURE", "SECURE");

-- -A fwFltrIb -m connmark --mark 0x2222 -i <wan<N>Iface> -o <lanIface> -j INSECURE_SECURE 
insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_DNAT_CONNMARK", 1, "INSECURE_SECURE", "ANY", "SECURE");

-- -A fwFltrIb -m connmark --mark 0x2222 -i <lanIface> -o <lanIface> -j INSECURE_SECURE
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_DNAT_CONNMARK", 0, "INSECURE_SECURE", "SECURE", "SECURE");

-- -A fwFltrIb -m connmark --mark 0x2222 -i <wan<N>Iface> -o <dmzIface> -j INSECURE_PUBLIC
insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_DNAT_CONNMARK", 1, "INSECURE_PUBLIC", "ANY", "PUBLIC");

-- -A fwFltrIb -m connmark --mark 0x2222 -i <dmzIface> -o <dmzIface> -j INSECURE_PUBLIC
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_DNAT_CONNMARK", 0, "INSECURE_PUBLIC", "PUBLIC", "PUBLIC");

-- -A fwFltrIb -m connmark --mark 0x2222 -j TRIGGER --trigger-type in
insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_INTERNAL_DNAT_CONNMARK", 1, "FW_TRIGGER_IN", "ANY", "ANY");

-- -A fwPPTPBox -p tcp --dport FW_PPTP_PORT -j ACCEPT
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","FW_PPTP_BOX", 1, "ACCEPT", "ANY", "ANY", 6, 1723);

-- -A fwPPTPBox -p gre -j ACCEPT
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType,
--Protocol) values ("edit=0","FW_PPTP_BOX", 1, "ACCEPT", "ANY", "ANY", 47);

-- Mangle Defaults:
-- =================

-- -A OUTPUT -o <lanIface> -p tcp --sport 80 -j TOS --set-tos 0x16
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, SourcePort, TypeOfService) values ("edit=0","FW_MANGLE_OUT_TOS", 1, "TOS", "ANY", "SECURE", 6, 80, 16);

-- -A FORWARD -o <lanIface> -m mark --mark 0xf1dead -j RETURN
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_MANGLE_FWD_IPSEC_INET_MARK", 1, "RETURN", "ANY", "SECURE");

-- -A FORWARD -o <wanIface> -m mark --mark 0xf1dead -j MARK --set-mark 0xf1c001
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_MANGLE_FWD_IPSEC_INET_MARK", 1, "MARK", "ANY", "INSECURE");

-- -A FORWARD -i <lanIface> -o <lanIface> -m connmark --mark 0x2222 -j MARK --set-mark 0x1111 
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_MANGLE_FWD_INTERNAL_DNAT_CONNMARK", 1, "MARK", "SECURE", "SECURE");

-- -A FORWARD -i <dmzIface> -o <dmzIface> -m connmark --mark 0x2222 -j MARK --set-mark 0x1111
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_MANGLE_FWD_INTERNAL_DNAT_CONNMARK", 1, "MARK", "PUBLIC", "PUBLIC");
.timeout 1000

-- -A FORWARD -i <lan<N>Iface> -o <wan<N>Iface> -j fwIntelAmtOut
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_MANGLE_FWD_INTERNAL_SUBSET", 1, "fwIntelAmtOut", "SECURE", "INSECURE");

-- -A FORWARD -i <lan<N>Iface> -o <wan<N>Iface> -j SECURE_INSECURE
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_MANGLE_FWD_INTERNAL_SUBSET", 1, "SECURE_INSECURE", "SECURE", "INSECURE");

-- -A FORWARD -i <dmz<N>Iface> -o <wan<N>Iface> -j PUBLIC_INSECURE
--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_MANGLE_FWD_INTERNAL_SUBSET", 1, "PUBLIC_INSECURE", "PUBLIC", "INSECURE");


-- Account Rules

--insert into FirewallRules (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_MANGLE_FWD_INTERNAL_SUBSET", 1, "PUBLIC_INSECURE", "PUBLIC", "INSECURE");


-------------------------------------------------------------------------------
--                        IPv6 Firewall Default Rules
-------------------------------------------------------------------------------

-- INPUT CHAIN

-- $IPTABLES_BIN  -A INPUT -m state --state ESTBLISHED,RELATED -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, ConnectionState) values ("edit=0","FW_FILTER_IB_STATE", 1, "ACCEPT", "ANY", "ANY", "RELATED,ESTABLISHED");

-- $IPTABLES_BIN -A INPUT -m mark --mark 0xF1DEAD -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_IB_IPSEC_MARK", 1, "ACCEPT", "ANY", "ANY");

-- $IPTABLES_BIN  -A INPUT -j fwLanInFilter
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwLanInFilter", "ANY", "ANY");

-- $IPTABLES_BIN  -A INPUT -s ::1/128 -d ::1/128 -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, SourceAddressType, SourceAddressStart, SourceAddressPrefixLength, DestinationAddressType, DestinationAddressStart, DestinationAddressPrefixLength) values ("edit=0","FW_FILTER_IB_LOOP_BACK", 1, "ACCEPT", "ANY", "ANY", 1,"::1",128, 1, "::1",128);

-- $IPTABLES_BIN  -A INPUT -i lo -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_IB_LOOP_BACK", 1, "ACCEPT", "LOCAL", "ANY");

-- $IPTABLES_BIN -A  INPUT -p icmpv6 -m icmpv6 --icmpv6-type 133/0 -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "ACCEPT", "ANY", "ANY", 58, " 133");

-- $IPTABLES_BIN -A  INPUT -p icmpv6 -m icmpv6 --icmpv6-type 134/0 -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "ACCEPT", "ANY", "ANY", 58, " 134");

-- $IPTABLES_BIN -A  INPUT -p icmpv6 -m icmpv6 --icmpv6-type 135/0 -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "ACCEPT", "ANY", "ANY", 58, " 135");

-- $IPTABLES_BIN -A  INPUT -p icmpv6 -m icmpv6 --icmpv6-type 136/0 -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "ACCEPT", "ANY", "ANY", 58, " 136");

-- $IPTABLES_BIN -A INPUT -p 50 -j fwInputLnA  (ESP);
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "ACCEPT", "ANY", "ANY", 50);

-- $IPTABLES_BIN -A INPUT -p 51 --j fwInputLnA (AH) 
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "ACCEPT", "ANY", "ANY", 51);

-- $IPTABLES_BIN -A INPUT -p udp --dport 500 -j fwInputLnA
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "ACCEPT", "ANY", "ANY", 17, 500);

-- $IPTABLES_BIN -A INPUT -p udp --dport 4500 -j fwInputLnA
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "ACCEPT", "ANY", "ANY", 17, 4500);


-- $IPTABLES_BIN  -A INPUT -p udp -m udp --dport 546  -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol,DestinationPortStart) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "ACCEPT", "ANY", "ANY", 17, 546);

-- $IPTABLES_BIN  -A INPUT -p udp -m udp --dport 547  -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "ACCEPT", "ANY", "ANY", 17, 547);

-- A INPUT -i <lanIface> -p 89 -j fwInputLnA
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "ACCEPT", "ANY", "ANY", 89);

-- $IPTABLES_BIN  -A INPUT -j fwWanInFilter
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwWanInFilter", "ANY", "ANY");

-- $IPTABLES_BIN  -A INPUT  -j ipv6HdrFilter
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "ipv6HdrFilter", "ANY", "ANY");

-- $IPTABLES_BIN  -A INPUT -j fwSysInputDrop
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_IB_SERVICE", 1, "fwSysInputDrop", "ANY", "ANY");



-- FORWARD CHAIN
--
-- $IPTABLES_BIN  -A   -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_ACCEPT", 1, "ACCEPT", "ANY", "ANY");

-- $IPTABLES_BIN  -A FORWARD -m state --state ESTBLISHED,RELATED -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, ConnectionState) values ("edit=0","FW_FILTER_FWD_STATE", 1, "ACCEPT", "ANY", "ANY", "RELATED,ESTABLISHED");

-- $IPTABLES_BIN -A FORWARD -m mark --mark 0xF1DEAD -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_IPSEC_MARK", 1, "ACCEPT", "ANY", "ANY");

-- $IPTABLES_BIN  -A FORWARD -j fwForwardFilter
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_SERVICE", 1, "fwForwardFilter", "ANY", "ANY");

-- $IPTABLES_BIN  -A FORWARD -j ipv6FragFilter
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_SERVICE", 1, "ipv6FragFilter", "ANY", "ANY");

-- $IPTABLES_BIN  -A FORWARD -j  fwVpnCheck
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType,ToZoneType) values ("edit=0","FW_FILTER_FWD_SERVICE", 1, "fwVpnCheck","ANY", "ANY");

-- $IPTABLES_BIN  -A FORWARD -j icmpv6ForwardFilter
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_SERVICE", 1, "icmpv6ForwardFilter", "ANY", "ANY");

-- $IPTABLES_BIN  -A FORWARD  -j ipv6HdrFilter
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_SERVICE", 1, "ipv6HdrFilter", "ANY", "ANY");

-- $IPTABLES_BIN  -A FORWARD -j ipv6BadAddrs
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_SERVICE", 1, "ipv6BadAddrs", "ANY", "ANY");

-- $IPTABLES_BIN  -A FORWARD -d fe80::/10 -o <wan> -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, DestinationAddressType, DestinationAddressStart, DestinationAddressPrefixLength) values ("edit=0","FW_FILTER_FWD_SERVICE", 1, "DROP", "ANY", "INSECURE", 1, "fe80::",10);

-- $IPTABLES_BIN  -A FORWARD -i <wan> -s fe80::/10 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, SourceAddressType, SourceAddressStart,SourceAddressPrefixLength) values ("edit=0","FW_FILTER_FWD_SERVICE", 1, "DROP", "INSECURE", "ANY", 1, "fe80::",10);

-- $IPTABLES_BIN  -A FORWARD -s ff00::/8 -j DROP 
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, SourceAddressType, SourceAddressStart,SourceAddressPrefixLength) values ("edit=0","FW_FILTER_FWD_SERVICE", 1, "DROP", "ANY", "ANY", 1, "ff00::",8);

-- $IPTABLES_BIN  -A FORWARD -j fwForwardAccept
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_SERVICE", 1, "fwForwardAccept", "ANY", "ANY");

-- $IPTABLES_BIN  -A FORWARD -j fwForwardDrop
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_SERVICE", 1, "fwForwardDrop", "ANY", "ANY");



-- fwLanMulticastFilter  - Filter for multicast packet from LAN to WAN
--
-- $IPTABLES_BIN  -A fwLanMulticastFilter -d ff08::/16 -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, DestinationAddressType, DestinationAddressStart, DestinationAddressPrefixLength)
 --values ("edit=0","fwLanMulticastFilter", 1, "ACCEPT", "ANY", "ANY", 1, "ff08::",16);

-- $IPTABLES_BIN  -A fwLanMulticastFilter -d ff0e::/16 -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType,  DestinationAddressType, DestinationAddressStart, DestinationAddressPrefixLength) values ("edit=0","fwLanMulticastFilter", 1, "ACCEPT", "ANY", "ANY", 1, "ff0e::",16);

-- $IPTABLES_BIN  -A fwLanMulticastFilter -d ff00::/8 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType,
--DestinationAddressType, DestinationAddressStart, DestinationAddressPrefixLength)
--values ("edit=0","fwLanMulticastFilter", 1, "DROP", "ANY", "ANY", 1, "ff00::",8);


-- fwForwardFilter - FORWARD filter

-- $IPTABLES_BIN  -A fwForwardFilter -i <lan> -o <wan> -j fwForwardOut
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_FLTR", 1, "fwForwardOut", "SECURE", "INSECURE"); 

-- $IPTABLES_BIN  -A fwForwardFilter -i <wan> -o <lan> -j fwForwardIn
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_FLTR", 1, "fwForwardIn", "INSECURE", "SECURE");

-- $IPTABLES_BIN  -A fwForwardFilter -i <isatap+> -o <isatap+> -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_FLTR", 1, "ACCEPT", "SECURE", "SECURE"); 


-- fwForwardOut - For Packets being forwarded to internet

--$IPTABLES_BIN -A fwForwardOut  -j SECURE_INSECURE 
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_OUT", 1, "SECURE_INSECURE", "ANY", "ANY"); 

--$IPTABLES_BIN  -A fwForwardOut  -p udp -m udp --dport 53 -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","FW_FILTER_FWD_OUT", 1, "ACCEPT", "ANY", "ANY", 17, 53);

-- $(IPTABLES_BIN -A fwForwardOut  -j fwLanMulticastFilter
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType)   values ("edit=0","FW_FILTER_FWD_OUT", 1, "fwLanMulticastFilter", "ANY", "ANY");

-- $IPTABLES_BIN  -A fwForwardOut  -s fec0::/10 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, SourceAddressType, SourceAddressStart,SourceAddressPrefixLength) values ("edit=0","FW_FILTER_FWD_OUT", 1, "DROP", "ANY", "ANY", 1, "fec0::",10);


-- fwForwardIn - For Packets being forwarded from internet

-- $IPTABLES_BIN  -A fwForwardIn  -j INSECURE_SECURE
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_FWD_IN", 1, "INSECURE_SECURE", "ANY", "ANY"); 

-- $IPTABLES_BIN  -A fwForwardIn  -d fec0::/10 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, DestinationAddressType, DestinationAddressStart,DestinationAddressPrefixLength) values ("edit=0","FW_FILTER_FWD_IN", 1, "DROP", "ANY", "ANY", 1, "fec0::",10);


-- fwWanInFilter - Packets from the WAN network to the BOX.

-- $IPTABLES_BIN  -A fwWanInFilter  -i WAN -j fwWanInFilter2
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","fwWanInFilter", 1, "fwWanInFilter2", "INSECURE", "ANY");

-- fwWanInFilter2

-- $IPTABLES_BIN  -A fwWanInFilter2  -j icmpv6WanInputFilter
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","fwWanInFilter2", 1, "icmpv6WanInputFilter", "ANY", "ANY");

-- $IPTABLES_BIN  -A fwWanInFilter2  -s ff00::/8 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, SourceAddressType, SourceAddressStart,SourceAddressPrefixLength) values ("edit=0","fwWanInFilter2", 1, "DROP", "ANY", "ANY", 1, "ff00::",8);


-- fwLanInFilter - Packets from the LAN network to the BOX.
--
-- $IPTABLES_BIN  -A fwLanInFilter -i $LAN_IF  -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_FILTER_IN_FILTER", 1, "ACCEPT", "SECURE", "ANY");


-- WAN ICMPv6 filter 


-- $IPTABLES_BIN -A  icmpv6WanInputFilter -p icmpv6 -m icmpv6 --icmpv6-type 1/0 -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","icmpv6WanInputFilter", 1, "ACCEPT", "ANY", "ANY", 58, "1");

-- $IPTABLES_BIN -A  icmpv6WanInputFilter -p icmpv6 -m icmpv6 --icmpv6-type 2/0 -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","icmpv6WanInputFilter", 1, "ACCEPT", "ANY", "ANY", 58, "2");

-- $IPTABLES_BIN -A  icmpv6WanInputFilter -p icmpv6 -m icmpv6 --icmpv6-type 3/0 -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","icmpv6WanInputFilter", 1, "ACCEPT", "ANY", "ANY", 58, "3");

-- $IPTABLES_BIN -A  icmpv6WanInputFilter -p icmpv6 -m icmpv6 --icmpv6-type 4/0 -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","icmpv6WanInputFilter", 1, "ACCEPT", "ANY", "ANY", 58, " 4");

-- $IPTABLES_BIN -A  icmpv6WanInputFilter -p icmpv6 -m icmpv6 --icmpv6-type 130/0 -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","icmpv6WanInputFilter", 1, "ACCEPT", "ANY", "ANY", 58, " 130");

-- $IPTABLES_BIN -A  icmpv6WanInputFilter -p icmpv6 -m icmpv6 --icmpv6-type 131/0 -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","icmpv6WanInputFilter", 1, "ACCEPT", "ANY", "ANY", 58, " 131");

-- $IPTABLES_BIN -A  icmpv6WanInputFilter -p icmpv6 -m icmpv6 --icmpv6-type 132/0 -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","icmpv6WanInputFilter", 1, "ACCEPT", "ANY", "ANY", 58, " 132");

-- ipv6FragFilter - IPv6 fragmentation filter

-- $IPTABLES_BIN  -A ipv6FragFilter -m ipv6header --header frag --soft -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Ipv6HeaderType) values ("edit=0","ipv6FragFilter", 1, "ACCEPT", "ANY", "ANY", " route");


-- ipv6HdrFilter - IPv6 header filtering

-- $IPTABLES_BIN  -A ipv6HdrFilter -m ipv6header --header route --soft -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Ipv6HeaderType) values ("edit=0","ipv6HdrFilter", 1, "DROP", "ANY", "ANY", " route");


-- Ultility Chains


-- $IPTABLES_BIN  -A fwSysInputDrop -j LOG --log-prefix "SYSTEM_INPUT"   \
    --log-level=debug 
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, LogPrefix, LogLevel) values ("edit=0","fwSysInputDrop", 1, "LOG", "ANY", "ANY", "SYSTEM_INPUT", 1);

-- $IPTABLES_BIN  -A fwSysInputDrop -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","fwSysInputDrop", 1, "DROP", "ANY", "ANY");


-- $IPTABLES_BIN  -A fwForwardDrop -j LOG --log-prefix "SYSTEM_FORWARD"  \
    --log-level=debug 
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, LogPrefix, LogLevel) values ("edit=0","fwForwardDrop", 1, "LOG", "ANY", "ANY", "SYSTEM_FORWARD", 1);

-- $IPTABLES_BIN  -A fwForwardDrop -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","fwForwardDrop", 1, "DROP", "ANY", "ANY");


-- $IPTABLES_BIN  -A fwForwardAccept -i <lan> -o <wan> -j DEFAULT_POLICY
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","fwForwardAccept", 1, "DEFAULT_POLICY", "SECURE", "ANY");


-- $IPTABLES_BIN  -A fwForwardAccept -i <lan> -o <isatap+> -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType) values ("edit=0","FW_SECURE_ISATAP", 1, "ACCEPT", "SECURE", "SECURE-ISATAP");

-- VpnCheck FORWARD Rules
 
-- $IPTABLES_BIN -A fwVpnCheck -p udp --dport 500 -i bdg1 -j fwdAccept
--insert into FirewallRules6 (_metadata, RuleType, Status, Action,FromZoneType,ToZoneType, Protocol, DestinationPortStart) values ("edit=0","FW_VPN_FWD_IN", 1, "fwdAccept", "SECURE", "ANY", 17, 500);
 
-- $IPTABLES_BIN -A fwVpnCheck -p udp --dport 4500 -i bdg1 -j fwdAccept
--insert into FirewallRules6 (_metadata, RuleType, Status, Action,FromZoneType,ToZoneType, Protocol, DestinationPortStart) values ("edit=0","FW_VPN_FWD_IN", 1, "fwdAccept", "SECURE", "ANY", 17, 4500);
 
-- $IPTABLES_BIN -A fwVpnCheck -p esp -i bdg1 -j fwdAccept
--insert into FirewallRules6 (_metadata, RuleType, Status,Action,FromZoneType,ToZoneType, Protocol) values ("edit=0","FW_VPN_FWD_IN", 1, "fwdAccept", "SECURE", "ANY", 50);

-- $IPTABLES_BIN -A fwVpnCheck -p ah -i bdg1 -j fwdAccept
--insert into FirewallRules6 (_metadata, RuleType, Status,Action,FromZoneType,ToZoneType, Protocol) values ("edit=0","FW_VPN_FWD_IN", 1, "fwdAccept", "SECURE", "ANY", 51);


-- LAN->WAN ICMPv6 filter 

-- $IPTABLES_BIN -A  icmpv6ForwardFilter -p icmpv6 -m icmpv6 --icmpv6-type 128/0 -j RETURN
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","icmpv6ForwardFilter", 1, "RETURN", "ANY", "ANY", 58, " 128");

-- $IPTABLES_BIN -A  icmpv6ForwardFilter -p icmpv6 -m icmpv6 --icmpv6-type 129/0 -j RETURN
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","icmpv6ForwardFilter", 1, "RETURN", "ANY", "ANY", 58, " 129");

-- $IPTABLES_BIN -A  icmpv6ForwardFilter -p icmpv6 -m icmpv6 --icmpv6-type 1/0 -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","icmpv6ForwardFilter", 1, "ACCEPT", "ANY", "ANY", 58, " 1");


-- $IPTABLES_BIN -A  icmpv6ForwardFilter -p icmpv6 -m icmpv6 --icmpv6-type 2/0 -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","icmpv6ForwardFilter", 1, "ACCEPT", "ANY", "ANY", 58, "2");


-- $IPTABLES_BIN -A  icmpv6ForwardFilter -p icmpv6 -m icmpv6 --icmpv6-type 3/0 -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","icmpv6ForwardFilter", 1, "ACCEPT", "ANY", "ANY", 58, "3");


-- $IPTABLES_BIN -A  icmpv6ForwardFilter -p icmpv6 -m icmpv6 --icmpv6-type 4/0 -j ACCEPT
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","icmpv6ForwardFilter", 1, "ACCEPT", "ANY", "ANY", 58, "4");


-- $IPTABLES_BIN -A  icmpv6ForwardFilter -p icmpv6 -m icmpv6 --icmpv6-type 130/0 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","icmpv6ForwardFilter", 1, "DROP", "ANY", "ANY", 58, "130");

-- $IPTABLES_BIN -A  icmpv6ForwardFilter -p icmpv6 -m icmpv6 --icmpv6-type 131/0 -j  DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","icmpv6ForwardFilter", 1, "DROP", "ANY", "ANY", 58, "131");

-- $IPTABLES_BIN -A  icmpv6ForwardFilter -p icmpv6 -m icmpv6 --icmpv6-type 132/0 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","icmpv6ForwardFilter", 1, "DROP", "ANY", "ANY", 58, "132");


-- $IPTABLES_BIN -A  icmpv6ForwardFilter -p icmpv6 -m icmpv6 --icmpv6-type 133/0 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","icmpv6ForwardFilter", 1, "DROP", "ANY", "ANY", 58, "133");

-- $IPTABLES_BIN -A  icmpv6ForwardFilter -p icmpv6 -m icmpv6 --icmpv6-type 134/0 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","icmpv6ForwardFilter", 1, "DROP", "ANY", "ANY", 58, "134");


-- $IPTABLES_BIN -A  icmpv6ForwardFilter -p icmpv6 -m icmpv6 --icmpv6-type 135/0 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","icmpv6ForwardFilter", 1, "DROP", "ANY", "ANY", 58, "135");

-- $IPTABLES_BIN -A  icmpv6ForwardFilter -p icmpv6 -m icmpv6 --icmpv6-type 136/0 -j  DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","icmpv6ForwardFilter", 1, "DROP", "ANY", "ANY", 58, "136");

-- $IPTABLES_BIN -A  icmpv6ForwardFilter -p icmpv6 --icmpv6-type 139 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","icmpv6ForwardFilter", 1, "DROP", "ANY", "ANY", 58, "139");

-- $IPTABLES_BIN -A  icmpv6ForwardFilter -p icmpv6 --icmpv6-type 140 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","icmpv6ForwardFilter", 1, "DROP", "ANY", "ANY", 58, "140");


-- $IPTABLES_BIN -A  icmpv6ForwardFilter -p icmpv6 --icmpv6-type 138 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","icmpv6ForwardFilter", 1, "DROP", "ANY", "ANY", 58, "138");


-- $IPTABLES_BIN -A  icmpv6ForwardFilter -p icmpv6 --icmpv6-type redirect -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, Protocol, DestinationPortStart) values ("edit=0","icmpv6ForwardFilter", 1, "DROP", "ANY", "ANY", 58, "redirect");



-- Drop all IPv4 mapped IPv6 addresses.

-- $IPTABLES_BIN  -A ipv6BadAddrs -s 0:0:0:0:0:0:ffff::/96 -j DROP 
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, SourceAddressType, SourceAddressStart,SourceAddressPrefixLength) values ("edit=0","ipv6BadAddrs", 1, "DROP", "ANY", "ANY", 1, "0:0:0:0:0:0:ffff::",96);

-- $IPTABLES_BIN  -A ipv6BadAddrs -d 0:0:0:0:0:0:ffff::/96 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, DestinationAddressType, DestinationAddressStart,DestinationAddressPrefixLength) values ("edit=0","ipv6BadAddrs", 1, "DROP", "ANY", "ANY", 1, "0:0:0:0:0:0:ffff::",96);

-- $IPTABLES_BIN  -A ipv6BadAddrs -s ::224.0.0.0/100 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, SourceAddressType, SourceAddressStart,SourceAddressPrefixLength) values ("edit=0","ipv6BadAddrs", 1, "DROP", "ANY", "ANY", 1, "::224.0.0.0",100);

-- $IPTABLES_BIN  -A ipv6BadAddrs -d ::224.0.0.0/100 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, DestinationAddressType, DestinationAddressStart,DestinationAddressPrefixLength) values ("edit=0","ipv6BadAddrs", 1, "DROP", "ANY", "ANY",1, "::224.0.0.0",100);

-- $IPTABLES_BIN  -A ipv6BadAddrs -s ::127.0.0.0/104 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, SourceAddressType, SourceAddressStart,SourceAddressPrefixLength) values ("edit=0","ipv6BadAddrs", 1, "DROP", "ANY", "ANY", 1, "::127.0.0.0",104); 
-- $IPTABLES_BIN  -A ipv6BadAddrs -d ::127.0.0.0/104 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, DestinationAddressType, DestinationAddressStart,DestinationAddressPrefixLength) values ("edit=0","ipv6BadAddrs", 1, "DROP", "ANY", "ANY", 1, "::127.0.0.0",104);

-- $IPTABLES_BIN  -A ipv6BadAddrs -s ::0.0.0.0/104 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, SourceAddressType, SourceAddressStart,SourceAddressPrefixLength) values ("edit=0","ipv6BadAddrs", 1, "DROP", "ANY", "ANY", 1, "::0.0.0.0",104);

-- $IPTABLES_BIN  -A ipv6BadAddrs -d ::0.0.0.0/104 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, DestinationAddressType, DestinationAddressStart,DestinationAddressPrefixLength) values ("edit=0","ipv6BadAddrs", 1, "DROP", "ANY", "ANY", 1, "::0.0.0.0",104);

-- $IPTABLES_BIN  -A ipv6BadAddrs -s ::255.0.0.0/104 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, SourceAddressType, SourceAddressStart,SourceAddressPrefixLength) values ("edit=0","ipv6BadAddrs", 1, "DROP", "ANY", "ANY", 1, "::255.0.0.0",104);

-- $IPTABLES_BIN  -A ipv6BadAddrs -d ::255.0.0.0/104 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, DestinationAddressType, DestinationAddressStart,DestinationAddressPrefixLength) values ("edit=0","ipv6BadAddrs", 1, "DROP", "ANY", "ANY", 1, "::255.0.0.0",104);

-- $IPTABLES_BIN  -A ipv6BadAddrs -s ::0.0.0.0/96 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, SourceAddressType, SourceAddressStart,SourceAddressPrefixLength) values ("edit=0","ipv6BadAddrs", 1, "DROP", "ANY", "ANY", 1, "::0.0.0.0",96);

-- $IPTABLES_BIN  -A ipv6BadAddrs -d ::0.0.0.0/96 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, DestinationAddressType, DestinationAddressStart,DestinationAddressPrefixLength) values ("edit=0","ipv6BadAddrs", 1, "DROP", "ANY", "ANY", 1, "::0.0.0.0",96);

-- $IPTABLES_BIN  -A ipv6BadAddrs -s 2002:e000::/20 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, SourceAddressType, SourceAddressStart,SourceAddressPrefixLength) values ("edit=0","ipv6BadAddrs", 1, "DROP", "ANY", "ANY", 1, "2002:e000::",20);

-- $IPTABLES_BIN  -A ipv6BadAddrs -d 2002:e000::/20 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, DestinationAddressType, DestinationAddressStart,DestinationAddressPrefixLength) values ("edit=0","ipv6BadAddrs", 1, "DROP", "ANY", "ANY", 1, "2002:e000::",20);

-- $IPTABLES_BIN  -A ipv6BadAddrs -s 2002:7f00::/24 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, SourceAddressType, SourceAddressStart,SourceAddressPrefixLength) values ("edit=0","ipv6BadAddrs", 1, "DROP", "ANY", "ANY", 1, "2002:7f00::",24);

-- $IPTABLES_BIN  -A ipv6BadAddrs -d 2002:7f00::/24 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, DestinationAddressType, DestinationAddressStart,DestinationAddressPrefixLength) values ("edit=0","ipv6BadAddrs", 1, "DROP", "ANY", "ANY", 1, "2002:7f00::",24);

-- $IPTABLES_BIN  -A ipv6BadAddrs -s 2002:0000::/24 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, SourceAddressType, SourceAddressStart,SourceAddressPrefixLength) values ("edit=0","ipv6BadAddrs", 1, "DROP", "ANY", "ANY", 1, "2002:0000::",24);

-- $IPTABLES_BIN  -A ipv6BadAddrs -d 2002:0000::/24 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, DestinationAddressType, DestinationAddressStart,DestinationAddressPrefixLength) values ("edit=0","ipv6BadAddrs", 1, "DROP", "ANY", "ANY", 1, "2002:0000::",24);

-- $IPTABLES_BIN  -A ipv6BadAddrs -s 2002:ff00::/24 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, SourceAddressType, SourceAddressStart,SourceAddressPrefixLength) values ("edit=0","ipv6BadAddrs", 1, "DROP", "ANY", "ANY", 1, "2002:ff00::",24);

-- $IPTABLES_BIN  -A ipv6BadAddrs -d 2002:ff00::/24 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, DestinationAddressType, DestinationAddressStart,DestinationAddressPrefixLength) values ("edit=0","ipv6BadAddrs", 1, "DROP", "ANY", "ANY", 1, "2002:ff00::",24);

-- $IPTABLES_BIN  -A ipv6BadAddrs -s 2002:0a00::/24 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, SourceAddressType, SourceAddressStart,SourceAddressPrefixLength) values ("edit=0","ipv6BadAddrs", 1, "DROP", "ANY", "ANY", 1, "2002:0a00::",24);

-- $IPTABLES_BIN  -A ipv6BadAddrs -d 2002:0a00::/24 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, DestinationAddressType, DestinationAddressStart,DestinationAddressPrefixLength) values ("edit=0","ipv6BadAddrs", 1, "DROP", "ANY", "ANY", 1, "2002:0a00::",24);

-- $IPTABLES_BIN  -A ipv6BadAddrs -s 2002:ac10::/28 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, SourceAddressType, SourceAddressStart,SourceAddressPrefixLength) values ("edit=0","ipv6BadAddrs", 1, "DROP", "ANY", "ANY", 1, "2002:ac10::",24);

-- $IPTABLES_BIN  -A ipv6BadAddrs -d 2002:ac10::/28 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, DestinationAddressType, DestinationAddressStart,DestinationAddressPrefixLength) values ("edit=0","ipv6BadAddrs", 1, "DROP", "ANY", "ANY",1, "2002:ac10::",24);

-- $IPTABLES_BIN  -A ipv6BadAddrs -s 2002:c0a8::/32 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, SourceAddressType, SourceAddressStart,SourceAddressPrefixLength) values ("edit=0","ipv6BadAddrs", 1, "DROP", "ANY", "ANY", 1, "2002:c0a8::",32);

-- $IPTABLES_BIN  -A ipv6BadAddrs -d 2002:c0a8::/32 -j DROP
--insert into FirewallRules6 (_metadata, RuleType, Status, Action, FromZoneType, ToZoneType, DestinationAddressType, DestinationAddressStart,DestinationAddressPrefixLength) values ("edit=0","ipv6BadAddrs", 1, "DROP", "ANY", "ANY", 1, "2002:c0a8::",32);
CREATE TABLE ddns
(
        OID integer ,
        interfaceName text NOT NULL,
        ddnsService integer NOT NULL,
        hostname text ,
        username text ,
        password text ,
        timePeriod integer ,
        wildflag boolean,
        server text,
        zonename text,
        key boolean,
        ipcheck boolean,
        ddnsType integer,
        ddnsUrl text,
        ddnsOptUrl text
)
;

CREATE TABLE ddnsStatus
(
        OID integer ,
        interfaceName text NOT NULL,
        Status text , 
        orayType text ,
        orayDomain text 
)
;

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"ddns", 0, 1,1,1);
insert into stringsMap values ("DDNS_CONFIG_FAILED","DDNS Configuration Failed");
insert into tableDefaults values ("ddns","hostname","NOHOST","","");
insert into tableDefaults values ("ddns","username","NOUSER","","");
insert into tableDefaults values ("ddns","password","NOPASSWD","","");
insert into tableDefaults values ("ddns","timePeriod","0","","");
insert into tableDefaults values ("ddns","wildflag","0","","");
insert into tableDefaults values ("ddns","server","NOSERVER","","");
insert into tableDefaults values ("ddns","zonename","NOZONE","","");
insert into tableDefaults values ("ddns","key","0","","");
insert into tableDefaults values ("ddns","ipcheck","1","","");
insert into tableDefaults values ("ddns","ddnsType","0","","");
insert into tableDefaults values ("ddns","ddnsUrl","NOURL","","");
insert into tableDefaults values ("ddns","ddnsOptUrl","NOOPTURL","","");
CREATE TABLE LanGroup
(
    OID           integer,
    GroupName     text NOT NULL,
    PRIMARY KEY   (GroupName)
)
;

CREATE TABLE LanHost
(
    OID           integer,
    GroupName     text NOT NULL,
    IPAddr        text,
    PRIMARY KEY   (IPAddr)
    FOREIGN KEY (GroupName) REFERENCES LanGroup (GroupName)
)
;

CREATE TABLE AvailableLanHost
(
    OID           integer,
    Name          text NOT NULL,
    IPAddr        text,
    MacAddr       text NOT NULL,
    LanType       text NOT NULL,
    PRIMARY KEY   (IPAddr)
)
;

insert into stringsMap values ("LAN_HOST_CONFIG_FAILED","LAN Hosts Configuration Failed");
insert into stringsMap values ("LAN_GROUPS_CONFIG_FAILED","LAN groups Configuration Failed");
insert into stringsMap values ("GROUPS_NAME_ALREADY_EXIXSTS","Groups Name already Exists");
-- SQL table for ifStatic back-end component.

-- ifStatic table
CREATE TABLE ifStatic
    (
    OID                      integer,           -- OID
    LogicalIfName            text     NOT NULL, -- interface names like 'lan1', 'wan2', etc.
    AddressFamily            integer NOT NULL,  -- address family.
    IspName                  integer,           -- name of the service provider
    StaticIp                 text     NOT NULL, -- ip which we want to assign
    NetMask                  text     NOT NULL, -- net mask for the above IP
    PrefixLength             integer          , -- address family.
    Gateway                  text     NOT NULL, -- gateway address
    PrimaryDns               text,              -- if we want to specify our DNS
    SecondaryDns             text,              -- if we want to specify our DNS
    -- add your new entries here

    PRIMARY KEY (LogicalIfName, AddressFamily),                -- primary key
    FOREIGN KEY (LogicalIfName) REFERENCES networkInterface (LogicalIfName)
    );

CREATE TABLE ifStaticAliasAddrTbl
    (
    LogicalIfName            text    NOT NULL, -- interface names like 'lan1', 'wan2', etc.
    AddressFamily            integer NOT NULL, -- address family.        
    StaticIp                 text    NOT NULL, -- ip which we want to assign
    NetMask                  text            , -- net mask for the above IP
    PrefixLength             integer         , -- Prefix Length.    
    PRIMARY KEY (LogicalIfName, AddressFamily, StaticIp),-- primary key
    FOREIGN KEY (LogicalIfName) REFERENCES networkInterface (LogicalIfName)    
    );

CREATE TABLE ifStaticIPAlias
    (
    OID                      integer         ,    
    LogicalIfName            text    NOT NULL, -- interface names like 'lan1', 'wan2', etc.
    PhyIfName                text            ,     
    IPAddress                text    NOT NULL, -- ip which we want to assign
    SubnetMask               text            , -- net mask for the above IP

    PRIMARY KEY (LogicalIfName, IPAddress)-- primary key
    );

insert into stringsMap values ("IP_CONFLICTING_WITH_LAN_IPADDR","Configured DMZ IP address conflicting with LAN IP address");
insert into stringsMap values ("IP_CONFLICTING_WITH_DMZ_IPADDR","Configured LAN IP address conflicting with DMZ IP address");
insert into stringsMap values ("ALIAS_IPADDR_IN_USE","Alias address is in use, please delete the corresponding firewall rule");
insert into stringsMap values ("MAX_ALIASES_CONFIGURED","Maximum allowed Aliases already configured on the selected interface");

--IP Aliasing
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"ifStaticIPAlias",0,1,1,1); 
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/ifStaticIPAliasHandler",1,1,"ifStaticIPAlias",0,1,1,1); 
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/ifStaticIPAliasHandler",0,1,"networkInterface",0,1,0,0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/ifStaticIPAliasHandler",0,1,"ipAddressTable",0,1,0,0);

CREATE TABLE option1DataHistory
(
 wan1Data integer NOT NULL,
 wan1HistoricData integer NOT NULL,
 time integer NOT NULL,
 PRIMARY KEY (time)
);

CREATE TABLE option2DataHistory
(
 wan2Data integer NOT NULL,
 wan2HistoricData integer NOT NULL,
 time integer NOT NULL,
 PRIMARY KEY (time)
);
CREATE TABLE wan3DataHistory
(
 wan3Data integer NOT NULL,
 wan3HistoricData integer NOT NULL,
 time integer NOT NULL,
 PRIMARY KEY (time)
);
CREATE TABLE vpnDataHistory
(
 sslvpnUser integer NOT NULL,
 activeSslvpnUser integer NOT NULL,
 clientTunnels integer NOT NULL,
 gatewayTunnels integer NOT NULL,
 activeClientTunnels integer NOT NULL,
 activeGatewayTunnels integer NOT NULL,
 time integer NOT NULL, 
 PRIMARY KEY (time)
);

INSERT INTO option1DataHistory VALUES (0,0,0);
INSERT INTO option2DataHistory VALUES (0,0,0);
INSERT INTO wan3DataHistory VALUES (0,0,0);
INSERT INTO vpnDataHistory VALUES (0,0,0,0,0,0,0);
CREATE TABLE ZoneTypes
(
  OID integer NULL,
  ZoneType text NOT NULL, -- SECURE/INSECURE/PUBLIC
  zoneIfGroupId integer,
  PRIMARY KEY (ZoneType)
)
;

CREATE TABLE Zones
(
  OID integer NULL,
  ZoneType text NOT NULL, --  SECURE/INSECURE/PUBLIC
  ZoneLogicalIfName text NOT NULL, --  LAN/WAN1/WAN2/DMZ
  -- this mark is for FW
  LogicalIfNameMark integer NULL,           
  PRIMARY KEY (ZoneLogicalIfName),
  FOREIGN KEY (ZoneType) REFERENCES ZoneTypes (ZoneType),
  FOREIGN KEY (ZoneLogicalIfName) REFERENCES networkInterface (logicalIfName)
)
;

CREATE TABLE ZoneAttr
(
  OID              integer NULL,
  LogicalIfName    text NOT NULL, --  LAN/WAN1/WAN2/DMZ
  ZoneAssTableId   integer,
  ZoneMark         integer, 
  ZonePBMark       integer, 
  PRIMARY KEY      (LogicalIfName),
  FOREIGN KEY      (LogicalIfName) REFERENCES Zones (ZoneLogicalIfName)
)
;
-- This file contains tables related to Bandwidth Limit Functionality.
   -- 1. BandWidthProfileStatus Table
   -- 2. BandWidthProfile Table
   -- 3. TrafficSelector Table


-- Enable/Disable BW Profiles
-- SPECS 
-- 1. This table will hold status of Bandwidth Profile functionality,whether its
--    enable or disable.
      -- When enable, default qdisc/class/filter will get added in backend. And
      -- for that event will be generated. And it will call bandwidthInit. 

-- GUI Changes proposed.
-- 1. Add a radio button called Enable/Disable on bandwidthProfiles.htm

CREATE TABLE BandWidthProfileStatus
(
    OID     integer NULL,
    Status  boolean NOT NULL -- Status of Bandwidth Profile functionality.Defaultly it should be enable.
);

CREATE TABLE L2BandWidthProfileStatus
(
    OID     integer NULL,
    Status  boolean NOT NULL -- Status of Layer 2 Bandwidth Profile functionality.
);

-- BandWidth Profiles table
-- SPECS
    -- 1. This table is for Adding bandwidth profiles.
       -- When user adds bandwidth profile, the database will get the values
       -- entered by user. No event will get generated here.  

--GUI Changes proposed.
    -- 1.  Add radio and priority radio buttons.If rate is selected, grayout
    --     priority dropdown. If priority is selected, grayout Min. rate/Max. rate.
    -- 2.  Remove Direction dropdown.
    -- 3.  Add WAN Iface dropdown as in FVX538 (for Auto failover and load balancing mode).

CREATE TABLE BandWidthProfile
(
    OID         integer     NULL,
    Policy      boolean NOT NULL,
    ProfileName text    NOT NULL,   -- Unique Profile Name PRIMARY KEY.
    ProfileType boolean NOT NULL,   -- It can be rate(value - 0)/priority(value - 1) according to 
                                    -- radio button.When rate is enabled, allow to add MaximumRate and
                                    -- MinimumRate and disallow Priority file  
                                    -- If Priority is enabled disallow to add MaximumRate and 
                                    -- MinimumRate and allow to select priority from 
                                    -- Priority dropdown.
    Priority    integer     NULL,   -- Priority (Dropdown).
                                    -- (LOW(10% - value - 1)/MEDIUM(30% - value -2 )/HIGH(60% - value 3))
    MinimumRate integer     NULL,   -- Minimum Bandwidth provided by user. 
    MaximumRate integer     NULL,   -- Maximum Bandwidth provided by user.
    WANID       text        NULL,   -- WAN interface selection if DUT is in 
                                    -- Auto Failover or Load balancing mode.
                                    -- Default WAN interface should be WAN1.    
    DscpMark    text    NOT NULL,   -- marking value, which should be used for 
                                    -- dscp bits for classification. DscpMark value should be taken
                                    -- from DscpClassList table as 
                                    -- explained for ClassId
    ClassId     integer NOT NULL,   -- ClassId values should be taken from DscpClassList,
                                    -- for first profile, first set of DscpMark and ClassId.
                                    -- For second profile second set of values, like that.     

    -- add your new entries here.

    PRIMARY KEY (ProfileName)

);

CREATE TABLE L2BandWidthProfile
(
    OID         integer     NULL,
    Policy      boolean NOT NULL,
    ProfileName text    NOT NULL,     -- Unique Profile Name PRIMARY KEY.
    ProfileType boolean NOT NULL,     -- It can be rate(value - 0)/priority(value - 1) according to 
                                      -- radio button.When rate is enabled, allow to add MaximumRate and
                                      -- MinimumRate and disallow Priority file  
                                      -- If Priority is enabled disallow to add MaximumRate and 
                                      -- MinimumRate and allow to select priority from 
                                      -- Priority dropdown.
    Priority    integer     NULL,     -- Priority (Dropdown).
                                      -- (LOW(10% - value - 1)/MEDIUM(30% - value -2 )/HIGH(60% - value 3))
    MinimumRate integer     NULL,     -- Minimum Bandwidth provided by user. 
    MaximumRate integer     NULL,     -- Maximum Bandwidth provided by user.
    WANID       text        NULL,     -- WAN interface selection if DUT is in 
                                      -- Auto Failover or Load balancing mode.
                                      -- Default WAN interface should be WAN1.    
    DscpMark    text    NOT NULL,     -- marking value, which should be used for 
                                      -- dscp bits for classification. DscpMark value should be taken
                                      -- from DscpClassList table as 
                                      -- explained for ClassId
    ClassId     integer NOT NULL,     -- ClassId values should be taken from DscpClassList,
                                      -- for first profile, first set of DscpMark and ClassId.
                                      -- For second profile second set of values, like that.     

    -- add your new entries here.

    PRIMARY KEY (ProfileName)

);

CREATE TABLE BandWidthProfileSpeed
(
    OID         integer     NULL,
    Wan1Speed   NOT        NULL,
    Wan2Speed   NOT        NULL
);

CREATE TABLE L2BandWidthProfileSpeed
(
    OID         integer     NULL,
    DmzSpeed   NOT        NULL,
    LanPort1Speed   NOT        NULL
);

insert into stringsMap values ("BWPROFILE_CONFIG_FAILED", "Bandwidth Profile(s) Configuration Failed");
insert into stringsMap values ("BWPROFILESTATUS_CONFIG_FAILED", "Bandwidth Profile Status Configuration Failed");
insert into stringsMap values ("BWPROFILE_DSCP_CONFIG_FAILED", "Bandwidth Profiles reached to maximum limit(15).");
insert into stringsMap values ("BWPROFILE_USE_DELETE_FAILED", "Bandwidth Profile(s) Delete Failed as it is being used by traffic selector");
insert into stringsMap values ("BWPROFILE_DELETE_FAILED", "Bandwidth Profile(s) Delete Failed");
insert into stringsMap values ("BWPROFILE_INUSE_EDIT_FAILED", "Bandwidth profile edit failed as it is being used by traffic selector");

-- Traffic Selector table
-- SPECS
    -- 1. This table has fields for selecting particular profile from added
    --    profiles. And apply that with proper iptables rule with it.
    -- 2. Event will get generated on the applying on this page.And according to
    --    selected BandWidth profile, the tc rules will get applied and
    --    according to values in Traffic selector table iptables rules will get
    --    applied.

-- GUI Changes Proposed.    
    -- 1. Remove Service & IP radio button. Only Service dropdown is needed.
    -- 2. radio button for IP is needed.

CREATE TABLE TrafficSelector
(
    OID         integer     NULL,
    ProfileName text        NULL,   -- FOREIGN KEY from BandWidthProfile table.
    ServiceName text        NULL,   -- FOREIGN KEY from Services table.
    MatchType   integer NOT NULL,   -- The Values of the MatchType are 
                                    -- IP(0) /MAC(1) /Port number(2) / VLAN Name(3).
    IPAddress   text        NULL,   -- Ip Address given by user.
    SubnetMask  text        NULL,   -- Subnet Mask.
    MACAddress  text        NULL,   -- Mac Address.
    PortName    text        NULL,   -- Port Name (Drop down).
    VlanId      integer     NULL,   -- Vlan Id ( Drop down).
    DscpValue   integer     NULL,   -- Dscp Value set
    VapName     text        NULL,   -- Access Point Name

    -- add your new entries here.

--foreign keys 

    FOREIGN KEY (ProfileName) REFERENCES BandWidthProfile (ProfileName), 
    FOREIGN KEY (ServiceName) REFERENCES Services (ServiceName),
    FOREIGN KEY (PortName) REFERENCES VlanPortMgmt (PortName)
);

CREATE TABLE L2TrafficSelector
(
    OID         integer       NULL,
    ProfileName text        NULL,   -- FOREIGN KEY from BandWidthProfile table.
    ServiceName text          NULL,   -- FOREIGN KEY from Services table.
    MatchType   integer NOT NULL,   -- The Values of the MatchType are 
                                      -- IP(0) /MAC(1) /Port number(2) / VLAN Name(3).
    IPAddress   text          NULL,   -- Ip Address given by user.
    SubnetMask  text          NULL,   -- Subnet Mask.
    MACAddress  text          NULL,   -- Mac Address.

    -- add your new entries here.

--foreign keys 

    FOREIGN KEY (ProfileName) REFERENCES L2BandWidthProfile (ProfileName), 
    FOREIGN KEY (ServiceName) REFERENCES Services (ServiceName)
);

insert into stringsMap values ("TRAF_SELECTOR_CONFIG_FAILED", "Traffic Selector Configuration Failed");
insert into stringsMap values ("TRAF_SELECTOR_DELETE_FAILED", "Traffic Selector(s) Delete Failed");

CREATE TABLE DscpClassList
(
    OID         integer     NULL,
    DscpMark    text    NOT NULL,
    ClassId     integer unique NOT NULL,
    Status      boolean NOT NULL,

    PRIMARY KEY (DscpMark)
);

CREATE TABLE L2DscpClassList
(
    OID         integer     NULL,
    DscpMark    text    NOT NULL,
    ClassId     integer unique NOT NULL,
    Status      boolean NOT NULL,

    PRIMARY KEY (DscpMark)
);

insert into tableDefaults values ("L2DscpClassList", "Status", "0", "", "");
insert into tableDefaults values ("DscpClassList", "Status", "0", "", "");
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"BandWidthProfile",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"BandWidthProfileStatus",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"TrafficSelector",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"L2BandWidthProfile",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"L2BandWidthProfileStatus",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"L2TrafficSelector",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"L2BandWidthProfileSpeed",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"dot11STA",0,1,1,1);
-- switchdevice Table
--

CREATE TABLE SwitchDevice
(
    OID               integer   NULL,
    SwitchDeviceName  text      NOT NULL,
	PRIMARY KEY (SwitchDeviceName)
)
;

CREATE TABLE portStats
(
OID integer NULL,
portId  integer,
TxBytes NUMERIC DEFULT ZERO,
TxDropPkts NUMERIC DEFULT ZERO,
RxBytes NUMERIC DEFULT ZERO,
RxDropPkts NUMERIC DEFULT ZERO,
PRIMARY KEY(portId)
)
;

-- PowerModeConf - table for power mode configuration
CREATE TABLE PowerModeConf
    (
    PowerMode  Boolean NOT NULL,              -- triggers the backend, set power mode
    LengthMode Boolean NOT NULL,              -- triggers the backend, set length mode
    JumboFrameEnable Boolean NULL             -- triggers the backend, set jumbo frames mode
    );

insert into tableDefaults values ("PowerModeConf", "JumboFrameEnable", "0", "0", "1");
INSERT INTO dbUpdateRegisterTbl VALUES ("UMI_COMP_PLATFORM", 0, 1, "PowerModeConf", 0, 1, 1, 0);
INSERT INTO dbUpdateRegisterProgram VALUES ("/pfrm2.0/bin/powerModeConfig", 0, 1, "PowerModeConf", 0, 1, 1, 0);
INSERT INTO dbUpdateRegisterProgram VALUES ("/pfrm2.0/bin/jumboFramesConfig", 0, 1, "PowerModeConf", 0, 1, 1, 0);



-- vlan Table
--
-- This table will hold vlan information which includes vlanId and vlan membership info.
-- 
-- Cases to be considered:
-- 1) If creating a new vlan where no port membership exists, use portName="dummy"
--    which will be ignored by the backend from configurations.
-- 2) when deleting a vlan, delete all the associated port entries and not just
--    the "dummy" entry to deconfigure all the ports on that vlan.
-- 3) Mode change in VlanPortMgmt requires an update on this table as well to change 
--    the memberships as per the mode. eg: trunk -> access mode change
-- 4) when deleting vlan, make sure that there are no ports currently using it
--    to avoid inconsitencies in frontend

CREATE TABLE vlan
(
    OID             integer   NULL,
    portName        text      NOT NULL,      --  PortLogicalName in VlanPortMgmt
	vlanId          integer   NOT NULL,      --  port is member of vlanID (Range: 1-4094) 
    vlanName        text      NOT NULL,      --  vlan name needed only for display
    vlanIPv6        integer   NOT NULL,      --  ipv6 status for the vlan
    vlanInternal    integer   NOT NULL,
    PRIMARY KEY (vlanId, portName)
)
;

-- vlan table default entries
insert into tableDefaults values("vlan","vlanIPv6","0","","");
insert into tableDefaults values("vlan","vlanInternal","0","","");
insert into tableDefaults values ("vlan","vlanId","","1","4094");
insert into stringsmap values ("VLAN_NAME_ALREADY_IN_USE","VLAN name already in use");
insert into stringsmap values ("PORT_VLAN_IN_USE_BY_BW_TRAFFIC_SELECTOR", "Port Vlan is being used by Traffic Selector");
insert into stringsmap values ("VLAN_IN_USE_BY_FIREWALL_RULES", "Port Vlan is being used in Firewall rules");
-- vlan status table
--
-- This table will hold vlan state information.
-- 
-- Cases to be Considered:
-- (none)
--

CREATE TABLE VlanStatus
(
    OID             integer   NULL,
    VlanState       boolean   NOT NULL,    -- vlanState is either Enable/Disable
    PRIMARY KEY (VlanState)
)
;

-- VlanPortMgmt table
--
-- This table will hold all port specific vlan information.
--
-- Backend Values:
-- Field            GUI          Backend Value
-- PortVlanMode   Access(Mode)         0
-- PortVlanMode   General(Mode)        1
-- PortVlanMode   Trunk(Mode)          2
-- PortType       (none)         "BRIDGE"/<ANY_STRING>
--
-- Cases to be considered:
-- 1) If Port is configured as access port(Mode: Access), then VLAN Membership
--    section should be updated to use only PVID
-- 2) The backend configuration is applied only if the portType=="BRIDGE" which
--    indicates that the port is part of the bridge (bdg) and be configured.
--
-- Description regarding the modes:
-- Access Mode : In this mode, the interface accepts untagged packets and can 
--               be a member of only one vlan, the DefaultPVID vlan.
-- Trunk Mode  : In this mode, the interface will accept only tagged packets and
--               can be a member of multiple vlans.
-- General Mode: In this mode, the interface will accept both tagged, untagged 
--               packets and can be a member of multiple vlans with a check that
--               untagged packets are handled on vlan matching the port's PVID.

CREATE TABLE VlanPortMgmt
(
    OID               integer   NULL,
    PortNumber        integer   NOT NULL,      --  unique port number
	PortName          text      NOT NULL,      --  Used for display
    PortLogicalName   text      NOT NULL,      --  Logical portName used in vlan table
    PortType          text      NOT NULL,      --  Port is part of a BRIDGE (or) ...
    PhyInterfaceName  text      NOT NULL,      --  physical interface attached to this port
	PortVlanMode      integer   NOT NULL,      --  Indicates access/general/trunk modes.
    DefaultPVID       integer   NOT NULL,      --  Indicates PVID(1-4094) field. 
	PRIMARY KEY (PortNumber)
)
;

-- VlanPortMgmt table default entries
insert into tableDefaults values ("VlanPortMgmt","portVlanMode", "","0","2");

-- comps. to be notified on updates
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "vlan", 0, 1, 1, 1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "VlanStatus", 0, 1, 1, 1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "VlanPortMgmt", 0, 1, 1, 1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "vlanCfgLoad", 0, 0, 1, 0);

-- stringIds used for GUI message mapping
insert into stringsmap values ("VLAN_ADD_CONFIG_FAILED","Add VLAN configuration failed.");
insert into stringsmap values ("VLAN_EDIT_CONFIG_FAILED","Edit VLAN configuration failed.");
insert into stringsmap values ("VLAN_DELETE_CONFIG_FAILED","Delete VLAN configuration failed.");
insert into stringsmap values ("VLAN_STATUS_CONFIG_FAILED","VLAN configuration failed.");
insert into stringsmap values ("PORT_VLAN_CONFIG_FAILED","Port VLAN configuration failed");
insert into stringsmap values ("VLAN_CONFIG_FAILED","VLAN configuration failed");
insert into stringsmap values ("VLAN_CONFIG_IN_USE","VLANID is in use");
insert into stringsmap values ("VLAN_UPDATE_CONFIG_FAILED","VLAN Configuration Update Failed");
insert into stringsmap values ("REMOVE_FIXED_IP","Remove Lan DHCP reserved Ips first");

-- save tables order
-- insert into saveTables (TableName) values("VlanStatus");
-- insert into saveTables (TableName) values("VlanPortMgmt");
-- insert into saveTables (TableName) values("vlan");

CREATE TABLE interVLANRouting
(
    vlanId  integer NOT NULL,
    ifName  text    NOT NULL,    
    status  boolean NOT NULL,
    accessType integer NOT NULL
);

CREATE TABLE interVLAN
(
    StaticIp text    NOT NULL,
    vlanId   integer NOT NULL,
    ifName   text    NOT NULL,    
    status   boolean NOT NULL
);

CREATE TABLE vlanCfgLoad
(
    reload  boolean NOT NULL    -- Flag to load the configuration during reboot 
);

CREATE TABLE wanRestartonTrunkUpdate
(
    PortLogicalName    text    NOT NULL,
	restartEnable      boolean NOT NULL
	
);

insert into tableDefaults values ("interVLANRouting","accessType", "0","","");
-- Port Mgmt Table
--
-- This table contains information regarding port management.
--
-- Backend values:
-- Backend Field        GUI            Backend value
--   PortStatus     Enable(Status)           1 
--   PortStatus     Disable(Status)          0
--   AutoNegEnable     AUTO            0(Disable),1(Enable)   
--   PortSpeed        Speed(10Mbps)          10            
--                    Speed(100Mbps)         100
--                    Speed(1000Mbps)        1000
--   DuplexMode     Duplex(Half)             0
--                  Duplex(Full)             1

CREATE TABLE PortMgmt
(
    OID               integer   NULL,
    PortName          text      NOT NULL,   -- Used for display and is Unique.
    PortPhyID         integer   NULL,       -- PhyID of port, filled by backend in default configuration
    InterfaceName     text      NULL,       -- Physical interface Name, filled in default configuration
    PortStatus        boolean   NOT NULL,   -- Port Status (enable/disable)
    AutoNegEnable     boolean   NOT NULL,   -- Auto negotiation enable/disable
    DuplexMode        boolean   NOT NULL,   -- Duplex Mode (HALF/FULL)
    PortSpeed         integer   NULL,       -- port speed (10/100/1000Mbps)
    MacAddress        text      NULL,       -- MAC Address of the port
    DefaultMacAddress text      NULL,       -- Default MAC Address of the port
    SetMacAddress     integer   NULL,      
    Mtu               integer   NULL,       -- Mtu size of the port
	PRIMARY KEY (PortName)
)
;
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "PortMgmt", 0, 1, 1, 1);
insert into stringsmap values ("PORT_MGMT_CONFIG_FAILED","Port Management configuration failed.");

-- Port Mirroring Table
--
-- This table contains information regarding port mirroring.
--
-- Backend values:
-- Backend Field               GUI                     Backend value
-- MirroringEnable     enable Port Mirroring           1(Yes), 0(No)   
-- CapturePort         Mirror all LAN Ports to         port1/port2/port3/port4

CREATE TABLE PortMirroring
(
    OID               integer   NULL,
    MirroringEnable   boolean   NOT NULL,
    CapturePort       text      NOT NULL,
	PRIMARY KEY (MirroringEnable)
)
;
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "PortMirroring", 0, 1, 1, 1);
insert into tableDefaults values ("PortMirroring","CapturePort","Port1","","");

-- Tables used in TF1's Configurable port management handlers 

CREATE TABLE ConfigPort
(
    OID integer,                    -- OID 
    LogicalIfName text NOT NULL     -- value can be LAN/WAN2/DMZ 
                                    -- Add new entries here  
)
;
insert into stringsMap values ("CONFIGPORT_CONFIG_FAILED","Configuration of PORT is Failed");
insert into stringsMap values ("CONFIG_LAN_IN_USE_BY_BW_TRAFFIC_SELECTOR","Optional Port(LAN) is using by bandwidth profiles traffic selectors");
insert into stringsMap values ("CONFIG_LAN_IN_USE_BY_PORT_MIRRORING","Optional Port(LAN) is in use by port mirroring configuration");
insert into stringsMap values ("ALL_PORTS_DISABLED","Operation Failed. Router cannot be accessible if all ports are disabled.");
CREATE TABLE radiusClient
(
    ProfileName text NOT NULL,
    isEnable    integer NOT NULL,
    authserver  text NOT NULL,
    authport  integer NOT NULL,
    authsecret  text NOT NULL,
    authtimeout  integer NOT NULL,
    authretries  integer NOT NULL,
    acctserver  text ,
    acctport  integer ,
    acctsecret  text ,
    PRIMARY KEY (authserver)
)
;

CREATE TABLE NTDomainSettings
(
    ProfileName                       text      NOT NULL, -- Profile name for NT Domain configuration
    AuthenticationServer	      text	    NULL,   -- Authenticating server address.
    SecondAuthenticationServer	      text	    NULL,   -- Authenticating server address.
    ThirdAuthenticationServer	      text	    NULL,   -- Authenticating server address 3.
    NTDomainWorkGroup                 text      NULL,   -- Work Group for NT Domain.
    NTDomainSecondWorkGroup           text	    NULL,   -- For NT Domain
    ThirdNTDomainWorkGroup            text	    NULL,   -- For NT Domain
    TimeOut			                  integer   NOT NULL,   -- Timeout
    Retries			                  integer   NOT NULL,   -- Number of retries
    FirstAdminAccount                 text   NULL,       -- Admin Account for Primary Server
    FirstAdminPasswd                  text   NULL,       -- Admin Password for Primary Server
    FirstServerHostname               text   NULL,       -- Hostname for First Server
    SecondAdminAccount                text   NULL,       -- Admin Account for Second Server
    SecondAdminPasswd                 text   NULL,       -- Admin Password for Second Server
    SecondServerHostname              text   NULL,       -- Hostname for Second Server
    ThirdAdminAccount                 text   NULL,       -- Admin Account for Third Server
    ThirdAdminPasswd                  text   NULL,       -- Admin Password for Third Server
    ThirdServerHostname               text   NULL,       -- Hostname for Third Server
    PRIMARY KEY (ProfileName)
)
;


CREATE TABLE ActiveDirectorySettings
(
    ProfileName                           text      NOT NULL, -- Profile name for Active Directory configuration
    AuthenticationServer	          text	    NULL,   -- Authenticating server address.
    SecondAuthenticationServer	          text	    NULL,   -- Authenticating server address.
    ThirdAuthenticationServer	          text	    NULL,   -- Authenticating server address 3.
    ActiveDirectoryDomain	          text	    NULL,   -- For Active Directory Authentication
    SecondActiveDirectoryDomain	          text	    NULL,   -- For Active Directory Authentication
    ThirdActiveDirectoryDomain	          text	    NULL,   -- For Active Directory Authentication
    TimeOut			          integer   NOT NULL,   -- Timeout
    Retries			          integer   NOT NULL,   -- Number of retries
    FirstAdminAccount                 text   NULL,       -- Admin Account for Primary Server
    FirstAdminPasswd                  text   NULL,       -- Admin Password for Primary Server
    FirstServerHostname               text   NULL,       -- Hostname for First Server
    SecondAdminAccount                text   NULL,       -- Admin Account for Second Server
    SecondAdminPasswd                 text   NULL,       -- Admin Password for Second Server
    SecondServerHostname              text   NULL,       -- Hostname for Second Server
    ThirdAdminAccount                 text   NULL,       -- Admin Account for Third Server
    ThirdAdminPasswd                  text   NULL,       -- Admin Password for Third Server
    ThirdServerHostname               text   NULL,       -- Hostname for Third Server    
    PRIMARY KEY (ProfileName)
)
;

CREATE TABLE POPProfiles
(
    ProfileName                         text        NOT NULL,   -- unique name of profile, PRIMARY KEY.
    Server                              text        NOT NULL,   -- Authenticating server 
    AuthenticationPort                  integer     DEFAULT 0,  -- Port of primary authentication server
    SSLEnable                           boolean     DEFAULT 0,  -- SSL for POP authentication
    CAFile                              text        NULL,       -- CA File name in router
    SecondServer                        text        NULL,   -- Second Authenticating server 
    SecondAuthenticationPort            integer     DEFAULT 0,  -- Port of second authentication server
    SecondSSLEnable                     boolean     DEFAULT 0,  -- SSL for POP authentication
    SecondCAFile                        text        NULL,       -- CA File name in router
    ThirdServer                         text        NULL,   -- Third Authenticating server 
    ThirdAuthenticationPort             integer     DEFAULT 0,  -- Port of third authentication server
    ThirdSSLEnable                      boolean     DEFAULT 0,  -- SSL for POP authentication
    ThirdCAFile                         text        NULL,       -- CA File name in router
    Timeout                             integer     NOT NULL,   -- Network Timeout
    Retries                             integer     NOT NULL,   -- Maximum Retries
    PRIMARY KEY (ProfileName)
);
insert into tableDefaults values ("POPProfiles", "AuthenticationPort", "0", "", "");
insert into tableDefaults values ("POPProfiles", "SSLEnable", "0", "", "");
insert into tableDefaults values ("POPProfiles", "SecondAuthenticationPort", "0", "", "");
insert into tableDefaults values ("POPProfiles", "SecondSSLEnable", "0", "", "");
insert into tableDefaults values ("POPProfiles", "ThirdAuthenticationPort", "0", "", "");
insert into tableDefaults values ("POPProfiles", "ThirdSSLEnable", "0", "", "");
insert into tableDefaults values ("POPProfiles", "Timeout", "10", "", "");
insert into tableDefaults values ("POPProfiles", "Retries", "5", "5", "9");

CREATE TABLE POPCAFiles
(
    CAFile                              text        NOT NULL,   -- name of ca file, PRIMARY KEY.
    PRIMARY KEY (CAFile)
);

CREATE TABLE LDAPSettings
(
    ProfileName                       text          NOT NULL, -- Profile name for LDAP configuration
    AuthenticationServer	      text	    NULL,   -- Authenticating server address.
    SecondAuthenticationServer	      text	    NULL,   -- Authenticating server address.
    ThirdAuthenticationServer	      text	    NULL,   -- Authenticating server address 3.
    LDAPBaseDN			      text	    NULL,   -- For LDAP Authentication
    SecondLDAPBaseDN		      text	    NULL,    -- For LDAP Authentication
    ThirdLDAPBaseDN		      text	    NULL,    -- For LDAP Authentication
    LDAPAttribute1                    text          NULL,   --  LDAP Attributes.
    LDAPAttribute2                    text          NULL,   --  LDAP Attributes.
    LDAPAttribute3                    text          NULL,   --  LDAP Attributes.
    LDAPAttribute4                    text          NULL,   --  LDAP Attributes.
    TimeOut			      integer       NOT NULL,   -- Timeout
    Retries			      integer       NOT NULL,   -- Number of retries
    FirstAdminAccount            text   NULL,       -- Admin Account for Primary Server
    FirstAdminPasswd             text   NULL,       -- Admin Password for Primary Server
    SecondAdminAccount           text   NULL,       -- Admin Account for Second Server
    SecondAdminPasswd            text   NULL,       -- Admin Password for Second Server
    ThirdAdminAccount            text   NULL,       -- Admin Account for Third Server
    ThirdAdminPasswd             text   NULL,       -- Admin Password for Third Server
    PRIMARY KEY (ProfileName)
)
;

CREATE TABLE ServicesRouteMgmt
(
    serviceName                       text      NOT NULL, -- Service Name to manage
    serviceInterface	              text	    NOT NULL, -- Server Interface Name.
    serverIPAddress	                  text	    NULL,     -- Server IP Address.
    routingInterface	              text	    NOT NULL, -- Interface based on which traffic should go.
    vlanName			              text	    NULL,     -- VLAN Name, if we select the management 
                                                          -- interface type as VLAN
    policyName                        text      NULL,     -- Policy Name, if we select the management 
                                                          -- interface type as IPSec                                                      
    sourceIPAddress		              text	    NOT NULL  -- Source IP Address of the radius packet 
                                                          -- based on above selection
)
;

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"radiusClient", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_EAP_RAD",1,1,"ServicesRouteMgmt", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"ActiveDirectorySettings", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_EAP_RAD",1,1,"radiusClient", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_EAP_RAD",1,1,"ActiveDirectorySettings", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"LDAPSettings", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"POPProfiles", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"NTDomainSettings", 0, 1,1,1);

insert into stringsMap values ("RADIUS_CONFIG_FAILED","RADIUS configuration failed");
insert into stringsMap values ("NT_DOMAIN_CONFIG_FAILED","NT Domain configuration failed");
insert into stringsMap values ("ACTIVE_DIRECTORY_CONFIG_FAILED","Active Directory configuration failed");
insert into stringsMap values ("LDAP_CONFIG_FAILED","LDAP configuration failed");
insert into tableDefaults values ("radiusClient","isEnable","0","0","1");
insert into tableDefaults values ("radiusClient","authsecret","sharedsecret","","");
insert into tableDefaults values ("radiusClient","authtimeout","1","1","999");
insert into tableDefaults values ("radiusClient","authretries","2","1","999");

-- we do not require table default values for these fields
--insert into tableDefaults values ("NTDomainSettings", "FirstAdminAccount", "admin1", "", "");
--insert into tableDefaults values ("NTDomainSettings", "FirstAdminPasswd", "admin1", "", "");
--insert into tableDefaults values ("NTDomainSettings", "FirstServerHostname", "hostname1", "", "");
--insert into tableDefaults values ("NTDomainSettings", "SecondAdminAccount", "admin2", "", "");
--insert into tableDefaults values ("NTDomainSettings", "SecondAdminPasswd", "admin2", "", "");
--insert into tableDefaults values ("NTDomainSettings", "SecondServerHostname", "hostname2", "", "");
--insert into tableDefaults values ("NTDomainSettings", "ThirdAdminAccount", "admin3", "", "");
--insert into tableDefaults values ("NTDomainSettings", "ThirdAdminPasswd", "admin3", "", "");
--insert into tableDefaults values ("NTDomainSettings", "ThirdServerHostname", "hostname3", "", "");

--insert into tableDefaults values ("ActiveDirectorySettings", "FirstAdminAccount", "admin1", "", "");
--insert into tableDefaults values ("ActiveDirectorySettings", "FirstAdminPasswd", "admin1", "", "");
--insert into tableDefaults values ("ActiveDirectorySettings", "FirstServerHostname", "hostname1", "", "");
--insert into tableDefaults values ("ActiveDirectorySettings", "SecondAdminAccount", "admin2", "", "");
--insert into tableDefaults values ("ActiveDirectorySettings", "SecondAdminPasswd", "admin2", "", "");
--insert into tableDefaults values ("ActiveDirectorySettings", "SecondServerHostname", "hostname2", "", "");
--insert into tableDefaults values ("ActiveDirectorySettings", "ThirdAdminAccount", "admin3", "", "");
--insert into tableDefaults values ("ActiveDirectorySettings", "ThirdAdminPasswd", "admin3", "", "");
--insert into tableDefaults values ("ActiveDirectorySettings", "ThirdServerHostname", "hostname3", "", "");

Create table radAuthTbl
(
serverId                    integer NOT NULL, -- serverId of auth server
serverIp                    text NOT NULL,    -- radius authenticating server Ip
routeIp                     text NOT NULL,    -- LAN/VLAN interface Ip of same subnet as serverIp, else dummy
routeIface                  text NOT NULL     -- LAN/VLAN interface name of same subnet as serverIp, else dummy
);

Create table radAuthConf
(
nasIface                  text NOT NULL     -- WAN iface selected by user in LB mode
);

insert into tableDefaults values ("radAuthTbl", "serverIp", "", "", "");
insert into tableDefaults values ("radAuthTbl", "routeIp", "0.0.0.0", "", "");
insert into tableDefaults values ("radAuthTbl", "routeIface", "dummy", "", "");
insert into tableDefaults values ("radAuthConf", "nasIface", "WAN1", "", "");
-- ipsecVPN Table
CREATE TABLE IpsecVPNPolicy
    (
    IpsecProtocol           integer   NOT NULL,      -- 0 for AH and 1 for ESP, default is 1 (ESP)
    TunnelOrTransport       boolean   NOT NULL,      -- 1 for tunnel mode, 0 for transport, default:1
    EnableDhcpOverIPSec     boolean   NOT NULL,      -- 1 for enabling and 0 for disabling, default: 0    
    OID                     integer   NULL,          -- OID
    VPNPolicyName           text      NOT NULL UNIQUE,-- VPN Policy Name
    PolicyType              integer   NOT NULL,      -- Type of the Policy (Manual/Auto/ModeConfig)
    LocalGateway            integer   NULL,          -- Type of Local GateWay (Dedicated/Secondary)
    RemoteEndPointType      boolean   NOT NULL,      -- Type of Remote GateWay (IPAddress/FQDN)
    RemoteEndPoint          text      NOT NULL,      -- IP or FQDN name
    Netbios                 boolean   NULL,          -- enable/disable netbios
    Rollover                boolean   NULL,          -- enable/disable rollover
    RolloverGateway         integer   NULL,          -- Rollover wan 
    EnableKeepAlive         boolean   NULL,          -- enable/disable KeepAlive
    KeepAliveSourceAddress  text      NULL,          -- source IP address of keepalive packet   
    RemotePingIPAddress     text      NULL,          -- IP address of th remote host to check KA   
    KeepAlivePeriod         integer   NULL,          -- KeepAlive Detection Period 
    KeepAliveFailureCount   integer   NULL,          -- Reconnect after failure count for KA
    EncryptionAlgorithm     integer   NOT NULL,      -- EncryptionAlgorithm
    KeyLength               text      NULL,          -- Key length for variable key-size algorithms like blowfish and cast128  
    AuthAlgorithm           integer   NOT NULL,      -- AuthAlgorithm
    LocalNetworkType        integer   NOT NULL,      -- Type of local traffic selectors (Any/Single/Range/Subnet)   
    LocalStartAddress       text      NULL,          -- Local network Start Address
    LocalEndAddress         text      NULL,          -- Local network End Address
    LocalSubnetMask         text      NULL,          -- Local network Subnet Mask
    LocalPrefixLength       integer   NULL,          -- Local prefix length (for IPv6 Networks)
    RemoteNetworkType       integer   NOT NULL,      -- Type of Remote traffic selectors (Any/Single/Range/Subnet)   
    RemoteStartAddress      text      NULL,          -- Remote network Start Address
    RemoteEndAddress        text      NULL,          -- Remote network End Address
    RemoteSubnetMask        text      NULL,          -- Remote network Subnet Mask
    RemotePrefixLength      integer   NULL,          -- Remote prefix length (for IPv6 Networks)
    SPIIn                   text      NULL,          -- SPI IN
    SPIOut                  text      NULL,          -- SPI OUT
    EncryptionKeyIn         text      NULL,          -- Key In for Encryption 
    EncryptionKeyOut        text      NULL,          -- Key Out for Encryption 
    AuthKeyIn               text      NULL,          -- Key In for Authentication
    AuthKeyOut              text      NULL,          -- Key Out for Authentication
    AutoPolicyType          integer   NULL,          -- Policy Type (Client/Gate Way)
    SALifeTime              integer   NULL,          -- SA LifeTime 
    SALifeTimeType          boolean   NULL,          -- SA LifeTime Type     
    PFSKeyGroup             integer   NULL,          -- PFSKeyGroup (DH Group 1/2/3)
    IKEPolicyName           text      NULL,          -- IKE Policy Name
    Status                  boolean   NOT NULL,      -- status of the VPN policy (enable/disable)
    RVGStatus               boolean   NOT NULL,
    BackupPolicyName        text      NULL,
    FailbackTime            integer   NULL,
    TypeofPolicy            integer   NULL,          -- Primary or Backup policy
    modeConfigStatus        integer   NOT NULL,      -- enable/disable mode config
    ModeConfigRecordName    text      NULL, 
    NodeId                  integer   primary key autoincrement,
    AddressFamily           integer   NOT NULL,      -- 2 for IPv4, 10 for IPv6 
    AutoInitiate            boolean   NOT NULL,      -- Auto establishes the tunnel if enabled
	VPNPolicyDescr			text	  NULL,			 -- brief description of this policy
    L2tpIpsecPolicy         boolean   NOT NULL,
    -- add your new entries here
    localLogIfName          text            NULL,    -- local wan logicalIfName
    rolloverLogIfName       text            NULL,    -- rollover wan logicalIfName
    
    FOREIGN KEY (IKEPolicyName) REFERENCES IpsecIKEPolicy (IKEPolicyName)    -- foreign key    
    );



insert into stringsMap values ("IPSEC_VPN_DEL_FAILED","IPsec VPN delete failed");
insert into stringsMap values ("IPSEC_VPN_ENABLE_FAILED","IPsec VPN enable failed");
insert into stringsMap values ("IPSEC_VPN_DISABLE_FAILED","IPsec VPN disable failed");
insert into stringsMap values ("IPSEC_VPN_ALREADY_ENABLED","Selected all policies already enabled");
insert into stringsMap values ("IPSEC_VPN_ALREADY_DISABLED","Selected all policies already disabled");
insert into stringsMap values ("IPSEC_VPN_CONFIG_FAILED","IPsec VPN configuration failed");
insert into stringsMap values ("IPSEC_VPN_INVALID_CONFIGURATION","Invalid configuration, can't add/edit policy");
insert into stringsMap values ("IPSEC_CANT_SHARE_IKE_FOR_DIFF_ENDPOINTS","Can't share IKE policy with different remote/local endpoint");
insert into stringsMap values ("IPSEC_CANT_SHARE_DIFF_IKE_FOR_SAME_ENDPOINTS","Can't share same remote end point with different IKE policies");
insert into stringsMap values ("ONYL_RVG_STATUS_ALLOW_TO_CHANGE","Only redundant VPN gateway status is allowed to change when backup policy is up");
insert into stringsMap values ("PRIMARY_POLICY_CONFIG_NOT_FOUND","Primary VPN policy configuration not found");
insert into stringsMap values ("MANUAL_POLICY_CANT_SET_AS_BACKUP","Backup policy setting is not allowed for manual policies");
insert into stringsMap values ("CLIENT_POLICY_CANT_SET_AS_BACKUP","Redundant VPN gateway is not for client policies");
insert into stringsMap values ("IKE_POLICY_CONFIG_NOT_FOUND","IKE policy configuration not found");
insert into stringsMap values ("DPD_NOT_ENABLED","Please enable DPD for this policy If you want to enable back up tunnel");
insert into stringsMap values ("DIRECTION_SET_TO_RESPONDER","Redundant VPN gateway is for initiators only");
insert into stringsMap values ("XAUTH_SET_TO_USER_DATABASE","Please disable XAuth user database option If you want to enable back up tunnel");
insert into stringsMap values ("POLICY_ALREADY_IN_USE","Selected policy is already using as backup policy");
insert into stringsMap values ("MODE_CONFIG_ONLY_CLIENT","Mode Config can be enabled only when Client Policy is configured.");
insert into stringsMap values ("KEEP_ALIVE_ONLY_GW_GW","Keep Alive can be enabled only when GW GW Policy is configured.");
insert into stringsMap values ("INVALID_IKE_CONFIG_WITH_MODE_CONFIG","Invalid IKE configuration with Mode Config enabled");
insert into stringsMap values ("BCK_POLICY_UP_AND_RUNNING","Backup policy is up and running so can't edit primary policy");
insert into stringsMap values ("FQDN_FOR_IPV6_CLIENT_POLICY","FQDN works for IPV6 client policy only");

insert into tableDefaults values ("IpsecVPNPolicy","IpsecProtocol","1","","");
insert into tableDefaults values ("IpsecVPNPolicy","TunnelOrTransport","1","","");
insert into tableDefaults values ("IpsecVPNPolicy","EnableDhcpOverIPSec","0","","");
insert into tableDefaults values ("IpsecVPNPolicy","PolicyType","1","","");
insert into tableDefaults values ("IpsecVPNPolicy","LocalGateway","0","","");
insert into tableDefaults values ("IpsecVPNPolicy","RemoteEndPointType","0","","");
insert into tableDefaults values ("IpsecVPNPolicy","Netbios","0","0","1");
insert into tableDefaults values ("IpsecVPNPolicy","Rollover","0","0","1");
insert into tableDefaults values ("IpsecVPNPolicy","EnableKeepAlive","0","0","1");
insert into tableDefaults values ("IpsecVPNPolicy","KeepAlivePeriod","10","","");
insert into tableDefaults values ("IpsecVPNPolicy","KeepAliveFailureCount","3","","");
insert into tableDefaults values ("IpsecVPNPolicy","EncryptionAlgorithm","3","","");
insert into tableDefaults values ("IpsecVPNPolicy","AuthAlgorithm","2","","");
insert into tableDefaults values ("IpsecVPNPolicy","LocalNetworkType","3","0","3");
insert into tableDefaults values ("IpsecVPNPolicy","RemoteNetworkType","3","0","3");
insert into tableDefaults values ("IpsecVPNPolicy","SPIIn","0x","","");
insert into tableDefaults values ("IpsecVPNPolicy","SPIOut","0x","","");
insert into tableDefaults values ("IpsecVPNPolicy","SALifeTime","3600", "", "");
insert into tableDefaults values ("IpsecVPNPolicy","SALifeTimeType","0", "0", "1");
insert into tableDefaults values ("IpsecVPNPolicy","PFSKeyGroup","2", "", "");
insert into tableDefaults values ("IpsecVPNPolicy","Status","1", "", "");
insert into tableDefaults values ("IpsecVPNPolicy","AutoPolicyType","0", "", "");
insert into tableDefaults values ("IpsecVPNPolicy","RVGStatus","0","","");
insert into tableDefaults values ("IpsecVPNPolicy","FailbackTime","30","30","3600");
insert into tableDefaults values ("IpsecVPNPolicy","modeConfigStatus","0","0","1");
insert into tableDefaults values ("IpsecVPNPolicy","ModeConfigRecordName","modeConfig","","");
insert into tableDefaults values ("IpsecVPNPolicy","AddressFamily","2","2","10");
insert into tableDefaults values ("IpsecVPNPolicy","AutoInitiate","0","","");
insert into tableDefaults values ("IpsecVPNPolicy","L2tpIpsecPolicy","0","0","2");

--- IpsecNodeIdUniqueId 
CREATE TABLE IpsecNodeIdUniqueId 
    (
     NodeId               integer         NOT NULL, 
     UniqueId             integer         NOT NULL,
     PRIMARY KEY (NodeId)                         -- primary key
    );




-- IpsecIKEPolicy Table
CREATE TABLE IpsecIKEPolicy
    (
    OID                     integer         NULL,        -- OID   
    IKEPolicyName           text            NOT NULL,    -- IKE PolicyName
    xmlId                   integer         NULL,    
    Direction               integer         NOT NULL,    -- Direction (Responder/Initiator/Both)
    ExchangeMode            boolean         NOT NULL,    -- ExchangeMode (Main/Aggressive)    
    IKEVersion              integer         NOT NULL,    -- IKE Version
    ModeConfigStatus        boolean         NOT NULL,    -- enable/disable ModeConfig 
    ModeConfigRecordName    text            NULL,        -- ModeConfigRecordName
    LocalGateway            integer         NULL,        -- Local GateWay WAN
    LocalIdentifierType     integer         NOT NULL,    -- LocalIdentifierType (IP/FQDN/User FQDN/DER ASN1 DN)
    LocalIdentifier         text            NULL,        -- LocalIdentifier
    RemoteIdentifierType    integer         NOT NULL,    -- RemoteIdentifierType (IP/FQDN/User FQDN/DER ASN1 DN)
    RemoteIdentifier        text            NULL,        -- RemoteIdentifier
    EncryptionAlgorithm     integer         NOT NULL,    -- EncryptionAlgorithm
    KeyLength               text            NULL,        -- EncryptionAlgoKeyLength
    AuthAlgorithm           integer         NOT NULL,    -- AuthAlgorithm
    AuthType                integer         NOT NULL,    -- Authentication Type (presharedkey/RSA signature) 
    Presharedkey            text            NULL,        -- Presharedkey
    DHGroup                 integer         NOT NULL,    -- DH Group 1/2/3
    SALifeTime              long integer    NOT NULL,    -- SA Life Time
    DPD                     boolean         NOT NULL,    -- enable/disable DPD
    DPDDetectionPeriod      integer         NULL,        -- DPD Detection Period
    DPDFailureCount         integer         NULL,        -- DPD Failure Count   
    XAUTHType               integer         NOT NULL,    -- XAUTH Type (Edgedevice/Ipsec Host/ Radius CHAP/PAP/User DB)
    XAUTHProfile            text            NULL,        -- If EdgeDevice & XAUTHType is AD/POP/LDAP/NTDOMAIN
    UserName                text            NULL,        -- UserName for Ipschost
    Password                text            NULL,        -- Password for Ipschost
    NatTraversal            boolean         NOT NULL,    -- 1-On, 0-off default:1
    NatKeepAliveTime        integer         NOT NULL,    -- Interval between sending keep-alive packets, in seconds 
    AddressFamily           integer         NOT NULL,    -- 2 for IPv4, 10 for IPv6 
    localLogIfName          text            NULL,        -- local gw logicalIfName

    -- add your new entries here
    
    PRIMARY KEY (IKEPolicyName)                         -- primary key
    );

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"IpsecIKEPolicy",0,1,1,1);

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"IpsecVPNPolicy",0,1,1,1);

insert into tableDefaults values ("IpsecIKEPolicy","xmlId","0","","");
insert into tableDefaults values ("IpsecIKEPolicy","IKEVersion","1","1","2");
insert into tableDefaults values ("IpsecIKEPolicy","Direction","2","0","2");
insert into tableDefaults values ("IpsecIKEPolicy","ModeConfigStatus","0","","");
insert into tableDefaults values ("IpsecIKEPolicy","EncryptionAlgorithm","3","","");
insert into tableDefaults values ("IpsecIKEPolicy","AuthAlgorithm","2","","");
insert into tableDefaults values ("IpsecIKEPolicy","AuthType","0","","");
insert into tableDefaults values ("IpsecIKEPolicy","DHGroup","2","","");
insert into tableDefaults values ("IpsecIKEPolicy","SALifeTime","28800","","");
insert into tableDefaults values ("IpsecIKEPolicy","DPD","0","","");
insert into tableDefaults values ("IpsecIKEPolicy","DPDDetectionPeriod","10","","");
insert into tableDefaults values ("IpsecIKEPolicy","DPDFailureCount","3","","");
insert into tableDefaults values ("IpsecIKEPolicy","XAUTHType","0","","");
insert into tableDefaults values ("IpsecIKEPolicy","NatTraversal","1","","");
insert into tableDefaults values ("IpsecIKEPolicy","NatKeepAliveTime","20","","");
insert into tableDefaults values ("IpsecIKEPolicy","modeConfigStatus","0","","");
insert into tableDefaults values ("IpsecIKEPolicy","ModeConfigRecordName","modeConfig","","");
insert into tableDefaults values ("IpsecIKEPolicy","AddressFamily","2","2","10");
insert into stringsMap values ("IKEP_CONFIG_FAILED","IKE policy configuration failed");
insert into stringsMap values ("IKEP_DELETE_FAILED","IKE policy deletion failed");
insert into stringsMap values ("IKEP_DELETE_DEPENDANT_FAILED","IKE policy cannot be deleted, being used in VPN policy");
insert into stringsMap values ("IKEP_DELETE_SUCCESS","Delete operation succeeded");
insert into stringsMap values ("IKEP_EDITCHECK_FAILED","Please disable corresponding VPN policy before making changes to this IKE policy");
insert into stringsMap values ("CANT_ENABLE_TWO_POLICIES_WITH_SAME_TRAFFIC_SELECTORS","Can't enable two policies with same traffic selectors");
insert into stringsMap values ("CANT_ENABLE_VPN_POLICY_WITH_IKE_POLICY_MODE_CONFIG","IKE Policy in use by Mode Config, can't use with VPN Policy");

--IpsecModeConfig Table
CREATE TABLE IpsecModeConfig
    (
    OID                     integer   NULL,             -- OID
    ModeConfigRecordName    text      NOT NULL,         -- ModeConfig RecordName
    FirstPoolStartIP        text      NOT NULL,         -- First Pool Start IP
    FirstPoolEndIP          text      NOT NULL,         -- First Pool End IP
    SecondPoolStartIP       text      NULL,         -- Second Pool StartIP
    SecondPoolEndIP         text      NULL,         -- Second Pool End IP
    ThirdPoolStartIP        text      NULL,         -- Third Pool Start IP
    ThirdPoolEndIP          text      NULL,         -- Third Pool End IP
    WINSServerPrimaryIP     text      NULL,         -- WINSServer Praimary IP
    WINSServerSecondaryIP   text      NULL,         -- WINSServer Secondary IP
    DNSServerPrimaryIP      text      NULL,         -- DNSServer Praimary IP
    DNSServerSecondaryIP    text      NULL,         -- DNSServer Secondary IP
    TunnelMode              bool      NOT NULL,         -- Split Tunnel or FullTunnel (split 1, Full 0) default is "0"

    -- add your new entries here
    PRIMARY KEY (ModeConfigRecordName)              -- primary key
    );

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"IpsecModeConfig",0,1,1,1);

insert into tableDefaults values ("IpsecModeConfig","ModeConfigRecordName","modeConfig","","");
insert into tableDefaults values ("IpsecModeConfig","FirstPoolStartIP","0.0.0.0","","");
insert into tableDefaults values ("IpsecModeConfig","FirstPoolEndIP","0.0.0.0","","");
insert into tableDefaults values ("IpsecModeConfig","TunnelMode","0","","");
insert into stringsMap values ("IPSEC_MODE_DEL_FAILED","IPsec mode delete failed");
insert into stringsMap values ("IPSEC_MODE_CONFIG_FAILED", "IPsec mode configuration failed");
insert into stringsMap values ("IPSEC_MODE_DEL_DEPEND_FAILED","IPsec mode delete failed as mode is used in IKE policy");

-- SplitDns
CREATE TABLE SplitDns 
(    
     OID                  integer        NULL , 
     DomainName           text           NOT NULL, -- fqdn string 

     PRIMARY KEY (DomainName)                      -- primary key
);
insert into stringsMap values ("IPSEC_SPLIT_DNS_NAME_CONFIG_FAILED","Domain Name already exits");
insert into stringsMap values ("IPSEC_SPLIT_DNS_CONFIG_FAILED","Split DNS Configuration Failed");
insert into stringsMap values ("IPSEC_SPLIT_DNS_DEL_FAILED","Split DNS Delete Failed");
insert into stringsMap values ("IPSEC_SPLIT_DNS_RECORD_FAILED","Split DNS record Doesn't Exists");


-- ConnectionStatus Table
CREATE TABLE ConnectionStatus
    (
    OID                 integer       NULL,         -- OID   
    PolicyName          text          NULL,         -- Policy Name
    TxData              text          NULL,         -- Tx Data  
    TxPackets           long integer  NULL,         -- Tx Packets
    RxData              text          NULL,         -- Rx Data  
    RxPackets           long integer  NULL,         -- Rx Packets
    ConnectionStatus    text          NULL,         -- Connction Status
    ActionStatus        boolean       NULL,         -- Is Action allowed    
    Action              boolean       NULL,         -- Action (Connect/DROP)
    NodeId              integer       NULL,         -- unique ID 
    OutSPI              text          NULL,         -- SPI
    RemoteEndpoint      text          NULL,         -- Remote End Point
    IKEPort             integer       NULL,         -- IKE port Number
    AutopolicyType      boolean       NULL,         -- Autopolicytype         
	vpnState			integer		  NULL,			-- VPN SA State
    
    -- add your new entries here
    upTime              text	      NULL,		    --UP-Time(seconds)
    PRIMARY KEY (PolicyName)            -- primary key
    );

-- IpsecConnectionStatus Table
CREATE TABLE IpsecUserAction 
    (
    OID                 integer       NULL,         -- OID   
    PolicyName          text          NULL,         -- Policy Name
    userAction          boolean       NULL,         -- Action (Connect/DROP)
    -- add your new entries here
    PRIMARY KEY (PolicyName)            -- primary key
    );

-- This table is used to maintain the reference count of a ikepolicy usage
-- This table is not saved across reboots. This is used only to get/set the reference count os ike policy usage
CREATE TABLE IKEPolicyUsageRefCountTable 
(
    OID   integer NULL,
    PolicyName text NOT NULL,
    RefCount integer NOT NULL,

    PRIMARY KEY (PolicyName),
    FOREIGN KEY (PolicyName) REFERENCES IpsecIKEPolicy (IKEPolicyName)   -- foreign key
);
    
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"ConnectionStatus",0,1,0,0);
insert into stringsMap values ("VIPSECURE_CS_CONFIG_FAILED","Connection status update failed");
insert into stringsMap values ("IPSEC_VPN_ENABLE_SUCCESS","IPsec VPN policy(s) enabled successfully");
insert into stringsMap values ("IPSEC_VPN_DISABLE_SUCCESS","IPsec VPN policy(s) disabled successfully");
insert into stringsMap values ("IPSEC_VPN_REMOTE_CONFIG_FAILED","IPsec VPN configuration failed as the remote end point is already in use");
insert into stringsMap values ("IPSEC_VPN_NAME_CONFIG_FAILED","VPN configuration failed as the policy name is already in use");
insert into stringsMap values ("IKEP_NAME_CONFIG_FAILED","IKE policy configuration failed as the policy name is already in use");
insert into stringsMap values ("IPSEC_MODE_NAME_CONFIG_FAILED", "IPsec mode configuration failed as the record name is already in use");
insert into stringsMap values ("IPSEC_VPN_DEL_SUCCESS","IPsec VPN policy(s) deleted successfully");
insert into tableDefaults values ("ConnectionStatus", "TxData", "0", "", "");
insert into tableDefaults values ("ConnectionStatus", "TxPackets", "0", "", "");
insert into tableDefaults values ("ConnectionStatus", "ConnectionStatus", "0", "", "");
insert into tableDefaults values ("ConnectionStatus", "Action", "0", "", "");

CREATE TABLE XAuthUsers
(
    OID integer NULL,
    UserName text NOT NULL,
    Password text NOT NULL,
    LanIPAddress text NULL,
    LanSubnet   text NULL,
    UserType integer NULL,
    AllowChangePassword boolean NULL,
    PRIMARY KEY (UserName)
);

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"XAuthUsers",0,1,1,1);

insert into tableDefaults values ("XAuthUsers", "UserType", "0", "", "");
insert into stringsMap values ("XAUTH_USERS_CONFIG_FAILED","XAuth user configuration failed");
insert into stringsMap values ("XAUTH_WRONGE_OLD_PASSWORD","Wrong old password");
insert into stringsMap values ("USER_NAME_ALREADY_EXISTS","User name already exists");
insert into stringsmap values ("EDIT_OPERATION_IS_NOT_PERMITTED","Edit Operation is not possible because the Quick VPN User is currently in use"); 
insert into stringsmap values ("DELETE_OPERATION_IS_NOT_PERMITTED","Delete Operation is not possible because some of the Quick VPN Users are currently in use"); 

-- This Table is for back end maintanance purpose. In GUI point of view it is a
-- dummy table. Here we will save the presharedkey, NAT IP if the client is
-- behind NAT.

CREATE TABLE QuickVPNUsersStatus
(
    OID             integer NULL,
    UserName        text    NOT NULL,
    Presharedkey    text    NULL,
    Status          boolean NOT NULL,
    ServerIP        text    NULL, -- IP of server.
    PublicIP        text    NULL, -- This is NAT IP if the client is behind NAT and in normal case it is client IP
    ClientIP        text    NULL, -- This is IP if the client.
    IkeBlockName    text    NULL, -- This is for with ike block it is sharing
    NodeId          integer NOT NULL,
    StartTime       text    NULL,
    TunnelStartSec  integer NULL,
    EndTime         text    NULL,
    Duration        text    NULL,

    PRIMARY KEY (UserName)
);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"QuickVPNUsersStatus",0,1,0,0);

-- This is table to exchange th data between racoon and rvgd daemon. This is
-- specific to redundant vpn gateway feature
CREATE TABLE VipsecureDeadPeer
(
    OID             integer NULL,
    PolicyName      text    NOT NULL,

    PRIMARY KEY (PolicyName)
);

-- This table stores the IP addresses that we assign to 'DHCP over IPsec' 
-- clients
CREATE TABLE IPsecDhcpClientIPRange
(
    StartIPAddress  text NOT NULL,
    EndIPAddress    text NOT NULL,
    SubnetMask      text NOT NULL,
    PRIMARY KEY (StartIPAddress,EndIPAddress,SubnetMask)
);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"IPsecDhcpClientIPRange",0,1,1,1);
insert into stringsMap values ("DHCP_IPSEC_FAILED","DHCP Over IPsec Configuration Failed.");
insert into stringsMap values ("FILE_OPEN_FAILED","Export Operation Failed.");

CREATE TABLE IpsecModeConfigVpnPolicy
(
    ModeConfigRecordName    text      NOT NULL,     -- ModeConfig RecordName
    FirstPoolStartIP        text      NOT NULL,     -- First Pool Start IP
    FirstPoolEndIP          text      NOT NULL,     -- First Pool End IP
    SecondPoolStartIP       text      NULL,         -- Second Pool StartIP
    SecondPoolEndIP         text      NULL,         -- Second Pool End IP
    ThirdPoolStartIP        text      NULL,         -- Third Pool Start IP
    ThirdPoolEndIP          text      NULL,         -- Third Pool End IP
    WINSServerPrimaryIP     text      NULL,         -- WINSServer Praimary IP
    WINSServerSecondaryIP   text      NULL,         -- WINSServer Secondary IP
    DNSServerPrimaryIP      text      NULL,         -- DNSServer Praimary IP
    DNSServerSecondaryIP    text      NULL,         -- DNSServer Secondary IP
    EncryptionAlgorithm     integer   NOT NULL,     -- EncryptionAlgorithm
    KeyLength               integer   NULL,         -- Key length for variable key-size algorithms like blowfish and cast128  
    AuthAlgorithm           integer   NOT NULL,     -- AuthAlgorithm
    LocalNetworkType        integer   NOT NULL,     -- Type of local traffic selectors (Any/Single/Range/Subnet)   
    LocalStartAddress       text      NULL,         -- Local network Start Address
    LocalEndAddress         text      NULL,         -- Local network End Address
    LocalSubnetMask         text      NULL,         -- Local network Subnet Mask
    LocalPrefixLength       integer   NULL,         -- Local prefix length (for IPv6 Networks)
    SALifeTime              integer   NULL,         -- SA LifeTime 
    SALifeTimeType          boolean   NULL,         -- SA LifeTime Type     
    PFSKeyGroup             integer   NULL,         -- PFSKeyGroup (DH Group 1/2/3)
    AddressFamily           integer   NOT NULL,     -- 2 for IPv4, 10 for IPv6
    RefCount                integer   NOT NULL,
    xmlId                   integer   NULL, 

	-- add your new entries here
    PRIMARY KEY (ModeConfigRecordName)              -- primary key
);

insert into tableDefaults values ("IpsecModeConfigVpnPolicy","EncryptionAlgorithm","3","","");
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"IpsecModeConfigVpnPolicy",0,0,1,0);

insert into tableDefaults values ("IpsecModeConfigVpnPolicy","ModeConfigRecordName","modeConfig","","");
insert into tableDefaults values ("IpsecModeConfigVpnPolicy","FirstPoolStartIP","0.0.0.0","","");
insert into tableDefaults values ("IpsecModeConfigVpnPolicy","FirstPoolEndIP","0.0.0.0","","");
insert into tableDefaults values ("IpsecModeConfigVpnPolicy","AddressFamily","2","2","10");
insert into tableDefaults values ("IpsecModeConfigVpnPolicy","LocalNetworkType","3","","");
insert into tableDefaults values ("IpsecModeConfigVpnPolicy","RefCount","0","","");
insert into tableDefaults values ("IpsecModeConfigVpnPolicy","PFSKeyGroup","2","","");
insert into tableDefaults values ("IpsecModeConfigVpnPolicy","SALifeTime","3600","","");
insert into tableDefaults values ("IpsecModeConfigVpnPolicy","SALifeTimeType","0", "0", "1");
CREATE TABLE sixToFourTunnel
    (
    tunnelStatus        integer NOT NULL,    -- enabled or disabled    
    LogicalIfName       text NOT NULL,       -- IPv4 interface to use
    interfaceName       text NOT NULL,       -- 6to4 interface name 
    localAddr           text NOT NULL,       -- local tunnel end-point   
    destAddr            text,                -- destination tunnel end-point
    PRIMARY KEY (LogicalIfName),
    FOREIGN KEY (LogicalIfName) REFERENCES networkInterface(LogicalIfName)
    );
insert into tableDefaults values ("sixToFourTunnel", "tunnelStatus", "1", "", "");
insert into tableDefaults values ("sixToFourTunnel", "LogicalIfName", "WAN1", "", "");
insert into tableDefaults values ("sixToFourTunnel", "interfaceName", "agl0", "", "");
insert into tableDefaults values ("sixToFourTunnel", "localAddr", "192.168.5.10", "", "");
insert into stringsMap values ("6TO4_TUNNEL_CONFIG_FAILED", "6 to 4 Tunnel Configuration Failed");    
CREATE TABLE isatapTunnel
    (
    isatapTunnelStatus  integer NOT NULL,
    isatapPrefix        text,    -- 64 bit ISATAP prefix
    useLanAddress       integer NOT NULL, -- use LAN address.
    localIPv4Address    text,    -- The IPV4 address to use as local endpoint
    isIsatapRouter      integer, -- Is this a ISATAP Router
    preferredRouter     text,    -- Preferred Router if this is a ISATAP host
    interfaceName       text,    -- tunnel interface name
    transportIfName     text NOT NULL, -- transport interface      
    PRIMARY KEY (isatapPrefix)
    );
insert into tableDefaults values ("isatapTunnel", "isatapTunnelStatus", "1", "", "");
insert into tableDefaults values ("isatapTunnel", "useLanAddress", "1", "", "");
insert into stringsMap values ("ISATAP_TUNNEL_DELETE_SUCCESS", "ISATAP Tunnel(s) Deleted Successfully");
insert into stringsMap values ("ISATAP_TUNNEL_DELETE_FAILED", "ISATAP Tunnel(s) Deletion Failed");
insert into stringsMap values ("ISATAP_TUNNEL_CONFIG_FAILED", "ISATAP Tunnel Configuration Failed");    
CREATE TABLE Dmz
(
    OID integer,
    DmzEnable boolean NOT NULL,
    DmzIP text
);
insert into tableDefaults values ("Dmz","DmzEnable","0","0","1");
insert into stringsMap values ("DMZ_CONFIG_FAILED","DMZ Configuration Failed");
--Add this enty when dmz rule is not added from Firewall rules
--insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"Dmz",0,1,1,1);   
-- FirmConf - table for firm check configuration
CREATE TABLE FirmConf
    (
    CheckNow Boolean NOT NULL          -- triggers the backend 
    );

-- FirmStatus - table for firmware status
CREATE TABLE FirmStatus
    (
    StatusMsg       Text,              -- status message
    StatusAvailable Integer,           -- status available
    ImageName       Text,              -- name of the image
    DownloadLink    Text,              -- firmware download link
    ReleaseNotes    Text,              -- firmware release notes link
    RegLink         Text,              -- firmware Registration Link
    UrlQuery        Text               -- Url used for Communication
    );


INSERT INTO dbUpdateRegisterTbl VALUES ("UMI_COMP_PLATFORM", 0, 1, "FirmConf", 0, 1, 1, 1);
INSERT INTO dbUpdateRegisterProgram VALUES ("/pfrm2.0/bin/firmCheckConfig", 1, 1, "FirmConf", 0, 1, 0, 0);
INSERT INTO FirmConf VALUES (0);
INSERT INTO FirmStatus VALUES ("", 0, "","","","","");
insert into stringsMap values ("FIRMWARE_INVALID_FILE","Firmware file is invalid or corrupted");
insert into stringsMap values ("UPGRADE_IN_PROGRESS","Upgrade Already In Progress .");
insert into stringsMap values ("RU_FIRMWARE_UPGRADE_DENIED","The RU firmware is NOT available to be installed in Non-Russian version machine, please use correct firmware version for your devices.");
insert into stringsMap values ("HARDWARE_VERSION_MISMATCH","The firmware being upgraded is not compatible with the current version of the hardware");
CREATE TABLE SystemStatistics
(
        OID integer ,

        CpuUsed 	integer NOT NULL,  /* CPU Total Usage */
        CpuIdle 	integer NOT NULL,  /* CPU idle */
        CpuUsedByUser 	integer NOT NULL,  /* CPU taken by user process */
        CpuUsedByKernel integer NOT NULL,  /* CPU taken by kernel process */
        CpuWaitingForIO integer NOT NULL,  /* Process waiting for IO operations*/

        MemoryFree  	integer NOT NULL,  /* Free Memory in the system */
        MemoryTotal 	integer NOT NULL,  /* Total memory of the system */
        MemoryUsed  	integer NOT NULL,  /* Used memory in the system */ 
        MemoryCached  	integer NOT NULL,  /* cached memory in the system */
        MemoryBuffers  	integer NOT NULL   /* buffered memory */
)
;

-- this table stores information about all the users
CREATE TABLE Users
(
    OID                               integer   NULL,
    UserName                          text      NOT NULL,
    FirstName                         text      NULL,
    LastName                          text      NULL,
    Password                          text      NULL,
    UserId                            integer   NOT NULL, -- unique for a particular user
    GroupId                           integer   NOT NULL,
    Capabilities                      text      NULL, -- comma separated list of capabilites like SSLVPN, PPTP, L2TP, etc
    UserTimeOut                       integer   NOT NULL,
    DefaultUser                       boolean   NULL,
    AllowChangePassword               boolean   NULL,
    multiLogSup                       boolean   NOT NULL,   -- FALSE-Singlelogin TRUE-multilogin
    enableChangePasswd                boolean   NOT NULL,   -- FALSE-Disable TRUE-Enable change password link  in captivePortal Page
    PRIMARY KEY (UserName),
    FOREIGN KEY (GroupId) REFERENCES UserGroups (GroupId)
)
;

-- this table stores the informacion for all the groups added
CREATE TABLE UserGroups
(
    OID                               integer   NULL,
    GroupName			      text	NOT NULL,      -- name of the group,
    GroupId			      integer   NOT NULL,  -- Id of the group,
    DomainName                        text      NULL,
    Description                       text      NULL,
    UserIds                           text      NULL,      -- Users part of a particular group   
    Capabilities		      text	NULL,
    DefaultGroup                      boolean   NULL,
    GroupTimeOut                      text      NOT NULL,
    LDAPAttribute1                    text      NULL,   --  LDAP Attributes.
    LDAPAttribute2                    text      NULL,   --  LDAP Attributes.
    LDAPAttribute3                    text      NULL,   --  LDAP Attributes.
    LDAPAttribute4                    text      NULL,   --  LDAP Attributes.
    PRIMARY KEY (GroupName)
)
;

-- this table stores the information of groups added for openvpn
CREATE TABLE OpenVpnUserGroups
(
    GroupName			  text	    NOT NULL,  -- name of the group,
    GroupId			      integer   NOT NULL,  -- Id of the group,
    PRIMARY KEY (GroupName)
)
;
-- all the components needing userdb services should register to userdb here
CREATE TABLE userdbRegistration
(
    UserType     text NOT NULL,
    UserTypeCode integer NOT NULL,
    ProgramName text NOT NULL,
    AuthenticationTypes text NULL,
    PRIMARY KEY (UserType,UserTypeCode)
)
;

-- this table saves the login failure count of each user
CREATE TABLE UserLoginFailure
(
    UserName				text		NOT NULL,
    FailureCount			integer		NULL,
    PRIMARY KEY (UserName),
    FOREIGN KEY (UserName) REFERENCES Users (UserName)
)
;

CREATE TABLE tempUsers
(
    ProfileId               Integer NOT NULL, 
    CstmAccName		        text NULL, -- Custom Account Name (not username)
    UserName                text NOT NULL PRIMARY KEY,
    Password                text NOT NULL,
    GroupId                 integer NOT NULL,  -- Id of the group,
    IdleTimeout             Integer NOT NULL, -- Minutes
    Limitchecks             Integer NOT NULL,
    LoginCheck              Integer NULL,
    BeginDate               text    NULL,-- will be nil in case of ValidBegin=Account login
    ExpirationDate          text    NULL, -- format "YYYY/MM/DD@HH:MM"
    MaxUsageTimeInfo        Integer NULL,
    MaxUsageTrafficInfo     Integer NULL,
    Flag                    Integer NOT NULL,
    FOREIGN KEY (GroupId) REFERENCES UserGroups (GroupId),
    FOREIGN KEY (ProfileId) REFERENCES tempCPUserProfiles (ProfileId)
);

--
-- GetUsersDb Table
--
-- SPECS :
--
--  1. 'GetUsersDbFile' This field contails the file name information. The file is in '.csv' format and the file 
--     is processed by the corresponding handler.

CREATE TABLE GETUSERSDb
(
    OID                         integer     NULL,
    GetUsersDbFile              text        NOT NULL
)
;

CREATE TABLE userDashboardCustomization
(
    username                text NOT NULL,
    TrafficOverview         boolean NOT NULL,
    DiscoveredAPs           boolean NOT NULL,
    OptionPorts             boolean NOT NULL,
    BandwidthUsage          boolean NOT NULL,
    WLANStatistics          boolean NOT NULL,
    VPNs                    boolean NOT NULL,
    CPUUtilization          boolean NOT NULL,
    MemoryUtilization       boolean NOT NULL,
    ActiveInfo              boolean NOT NULL,
    PRIMARY KEY (username)
);




--the tabledefault values go in here
insert into tableDefaults values ("UserGroups", "DefaultGroup", "0", "", "");

insert into tableDefaults values ("UserLoginFailure", "FailureCount", "3", "0", "");
insert into tableDefaults values ("Users", "UserTimeOut", "10", "", "");
insert into tableDefaults values ("Users", "DefaultUser", "0", "", "");
insert into tableDefaults values ("Users", "multiLogSup", "0", "", "");
insert into tableDefaults values ("Users", "enableChangePasswd", "1", "", "");
insert into tableDefaults values ("UserGroups", "LDAPAttribute1", "", "", "");
insert into tableDefaults values ("UserGroups", "LDAPAttribute2", "", "", "");
insert into tableDefaults values ("UserGroups", "LDAPAttribute3", "", "", "");
insert into tableDefaults values ("UserGroups", "LDAPAttribute4", "", "", "");

--the stringsMap entries
insert into stringsMap values ("USERDB_CONFIG_FAILED","User configuration failed");
insert into stringsMap values ("DELETE_FAILED_USER_LOGGEDIN","User deletion failed due to logged in users");
insert into stringsMap values ("USERDB_GROUP_ADD_FAILED","Adding of Group failed");
insert into stringsMap values ("USERDB_GROUP_EDIT_FAILED","Editing of Group failed");
insert into stringsMap values ("USERDB_GROUP_DELETE_FAILED","Group cannot be deleted");
insert into stringsMap values ("USERDB_WRONG_USER_PASSWORD","Wrong Login User Password");
insert into stringsMap values ("USERDB_USER_SESSION_NOT_FOUND","Failed to get login user's session to check login users password");
insert into stringsMap values ("USERDB_GROUP_HAS_USER_DEL_FAILED","Group cannot be deleted if it contains User(s)");
insert into stringsMap values ("USERDB_GROUP_IS_DEFAULT_DEL_FAILED", "Default Group(s) cannot be deleted");
insert into stringsMap values ("USER_GROUPS_NUMBER_EXCEEDED","Max limit reached for the number of users for this group"); 
insert into stringsMap values ("MAX_USERS_EXCEEDED","Max limit reached for the number of users"); 
insert into stringsMap values ("USER_LOCKED","Detected multiple login failures. Imposed temporary lock on the user");
insert into stringsMap values ("USERDB_USER_ADD_FAILED","Failed to add user");
insert into stringsMap values ("USERDB_USER_EDIT_FAILED","Failed to edit user");
insert into stringsMap values ("USERDB_USER_DEL_FAILED","Failed to delete user");
insert into stringsMap values ("USERDB_USER_IS_DEFAULT_DEL_FAILED", "Default User(s) cannot be deleted");

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "Users", 0, 1, 1, 1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "UserGroups", 0, 1, 1, 1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"XAuthUsers",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "GETUSERSDb", 0, 1, 1, 1);
-- Tables used for 3G component.
--
-- This table stores the configuration related to a 3G WAN connection.
--

-- ThreeG table
CREATE TABLE ThreeG
    (
    OID                      Integer,            -- OID
    LogicalIfName            Text     NOT NULL,  -- interface name link WAN1, WAN2
    Country                  Text,               -- country
    IspName                  Text,               -- ISP Name
    UserName                 Text,               -- user name
    Password                 Text,               -- password
    DialNumber               Text     NOT NULL,  -- dialing number
    AuthMethod               Integer  NOT NULL,  -- authentication protocol
    Apn                      text     NOT NULL,  -- Access Point Name
    GetDnsFromIsp            boolean  NOT NULL,  -- do we need DNS from ISP ?
    PrimaryDns               text,               -- if we want to specify our DNS
    SecondaryDns             text,               -- if we want to specify our DNS
    IdleTimeOutFlag          boolean  NOT NULL,  -- do we require idle timeout ?
    IdleTimeOutValue         integer  NOT NULL,  -- idle timeout value 
    ApnRequired              boolean  NOT NULL,  -- do we require APN 
    -- add your new entries here

    PRIMARY KEY (LogicalIfName),                 -- primary key
    FOREIGN KEY (LogicalIfName) REFERENCES networkInterface (LogicalIfName)
    );


CREATE TABLE smsEvents
    (
    OID                       Integer,  --OID
    ReceiverInfo              Text,     -- number on which sms will be sent
    WANStatusInfo             boolean,  -- status info of wan enabled/disabled
    VPNStatusInfo             boolean,  -- vpn tunnel connects/disconnects info enabled/disabled
    CPUUtilizationInfo        boolean  -- cpu utilization info enabled/disabled
    );

insert into tableDefaults values ("ThreeG","ApnRequired","1","1","1");
create table IPSConfig
    (
    OID             integer NOT NULL,
    idsEnable       boolean NOT NULL,
    ipsEnable       boolean NOT NULL,
    ipsAcclEnable   boolean,
    sigUpdateInterval   integer NOT NULL -- in hours
    );

create table IPSStatus
    (
    numRules    integer NOT NULL,
    numAlerts   integer NOT NULL,
    numDrops    integer NOT NULL,
    numRejects  integer NOT NULL
    );
insert into IPSStatus values (0, 0, 0, 0);
 
create table IPSNetworkSegments
    (
    OID             integer NOT NULL,
    FromZoneType    text NOT NULL,
    ToZoneType      text NOT NULL,
    ipsEnable       boolean NOT NULL,
    FOREIGN KEY (FromZoneType) REFERENCES ZoneTypes (ZoneType),
    FOREIGN KEY (ToZoneType) REFERENCES ZoneTypes (ZoneType)
    );

-- following table is used to build snort.conf. 1 row corresponds to 1 line
-- if option value is NULL, "optionType optionName" is added.
-- otherwise "optionType optionName: optionValue" is added. 
-- Some optionType/optionName might have a different format, in which case
-- backend can check for optionType/optionName and do special handling.
-- "managed" indicate if a particular option is exposed to user for
-- modification. This field will help, configSave() function to
-- only export "managed" entries to config file.

create table IPSAdvConfig
    (
    OID     integer NOT NULL,
    optionType  text NOT NULL, -- for example, "var", "preprocessor" etc
    optionName  text NOT NULL, -- name of the "var","preprocessor" etc
    optionValue text,          -- string containing value
    managed     boolean      
    );

-- following table generates threshold.conf
create table IPSThresholdConf
    (
    OID     integer NOT NULL,
    commandType text NOT NULL,  -- "threshold" or "suppression"
    gen_id      int NOT NULL,
    sig_id      int NOT NULL,
    limitType   text,       -- "limit", "threshold", or "both"
    trackType   text NOT NULL,  -- "by_src", or "by_dst"
    count       int,
    seconds     int,
    ipaddr      text
    );

-- following table generate classification.config
create table IPSClassConf
    (
    OID     integer NOT NULL,
    className   text NOT NULL,
    description text NOT NULL,
    priority    text NOT NULL,
    PRIMARY KEY (className)
    );

create table IPSAttackResponse
    (
    OID     integer NOT NULL,
    priority    text NOT NULL,
    response    text NOT NULL,
    log     int NOT NULL,
    PRIMARY KEY (priority)
    );

create table IPSCategories
    (
    OID         integer NOT NULL,
    categoryName        text NOT NULL,
    enable          boolean NOT NULL,
    categoryFilePrefix  text NOT NULL,
    categoryAction      text NOT NULL,
    PRIMARY KEY (categoryName)
    );
    
create table IPSRuleSource
    (
    OID     integer NOT NULL,
    ruleSource  text NOT NULL, -- roule source URL
    updateInterval  integer,
    enable      boolean NOT NULL
    );
    
-- table for user added rules (exportable to config) added to local.rules
--create table IPSUserRules 
--  (
    -- For future
--  )

-- TeamF1 defined rules (not exported to config) added to local.rules
--create table IPSTf1Rules
--  (
    -- For future
--  )

--rules from third parties (not exported to config)
create table IPSRules
    (
    rulesource text NOT NULL, -- "VRT", "VRT-community", "emerging" etc
    ruleCatogry text NOT NULL, -- "web", "p2p" etc
    ruleId      int  NOT NULL, -- rule id called "sid" in rule files
    ruleRev     int  NOT NULL, -- 
    ruleClass  text NOT NULL, -- foreign key of IPSClassConf
    ruleAction text NOT NULL, -- alert/log/pass/activate/dynamic/drop/reject/sdrop
    enable     int  NOT NULL,  -- enable/disable
    msg    text NOT NULL,  -- 
    reference  text NOT NULL  -- reference section of the rule for more info on attack
    );
---
--- USB Component schema
---

---
--- This table holds information of USB current status and USB type connected to system
---

CREATE TABLE USB 
(
	ObjId integer primary key autoincrement,
	ObjRevId integer,
	USBStatus   boolean NOT NULL,-- This field contains the status of USB,
                                 -- (1) Enabled or (0) Disabled.
	USBType  integer NOT NULL,   -- This field contains the type of USB attached
                                 -- to system for ex: NAS. Possible values 
                                 -- are Printer(0)/Network Storage(1)/Network Device(2).
    PrintServer boolean NOT NULL,--This field contains the status of printer sharing.
    StorageServer boolean NOT NULL,--This field contains the status of printer sharing.
        usbNum integer NOT NULL
);

CREATE TABLE USB_MNT
(
        MountPoint text  NULL,
        usbNum integer NOT NULL
);

CREATE TABLE SharePortVlan
(
    vlanId            integer   NOT NULL, --vlan id of the added vlan.
    vlanName          text      NOT NULL, --name of the vlan.
    interfaceName     text      NOT NULL, --interface name of the vlan.
    storageSharing    Boolean   NOT NULL, --Enable/Disable usb sharing.
    printerSharing    Boolean   NOT NULL, --Enable/Disable printer sharing. 
    PRIMARY KEY (vlanId) --Primary key.
);

insert into tableDefaults values ("USB", "ObjRevId", "0", "", "");
insert into tableDefaults values ("USB", "PrintServer", "0", "", "");
insert into tableDefaults values ("USB", "StorageServer", "0", "", "");
insert into stringsMap values ("USB_CONFIG_NOT_FOUND","USB configuration NOT Found");
insert into stringsMap values ("USB_CONFIG_FAILED","USB configuration Failed");
insert into stringsMap values ("VLAN_SHAREPORT_FAILED","USB sharing on vlan Failed");
insert into stringsMap values ("STORAGE_SHARING_NOT_ENABLED","Storage sharing cannot be disabled when sharing is enabled on interface(s)");
insert into stringsMap values ("SHAREPORT_INTERFACE_CHECK","Atleast one interface should be selected when Sharing is enabled");
insert into stringsMap values ("PRINTER_SHARING_NOT_ENABLED","Printer sharing cannot be disabled when sharing is enabled on interface(s)");
insert into stringsMap values ("VLAN_SHARING_ENABLED","SharePort is enabled on selected VLAN(s)");

insert into dbUpdateRegisterTbl values ('UMI_COMP_PLATFORM',1,1,"USB",0,1,1,0);CREATE TABLE CaptivePortalSession
(
    UserName                text            NOT NULL,     
    ipAddr                  text            NULL,
    macAddr                 text            NULL,
    idleTimeout             integer         NULL,
    ifName                  text            NOT NULL,   -- FALSE-Singlelogin TRUE-multilogin
    PRIMARY KEY (UserName,macAddr)
    UNIQUE (ipAddr)
);

CREATE TABLE CaptivePortal
(
    enable 	Boolean NOT NULL 
);

CREATE TABLE CaptivePortalVlan
(
    vlanId            integer   NOT NULL,
    ifName	      text      NOT NULL,
    accessType	      integer   NOT NULL, --1=SLA 2=Permanent 3=Temporary
    authServerId      integer   NULL,
    profileId         integer   NULL,     -- Login Profile Id
    redirectType      integer   NOT NULL,
    ipAddress      text    NOT NULL       -- IP address
    
);

CREATE TABLE authServers
(
    authServerId            integer   NOT NULL,
    authServerName	    text      NOT NULL
);

-- Header background image table
CREATE TABLE ImageDetails
(
    name     text NOT NULL,
    value    Boolean NOT NULL
);

-- This is a page backgroud image table.
CREATE TABLE pageBackgroundImage
(
            imageName     text NOT NULL,
            enableStatus  Boolean NOT NULL
        );

CREATE TABLE CaptivePortalPageDetails
(
    profileId                  integer    PRIMARY KEY AUTOINCREMENT, -- Login Profile Id
    configurationName          text       NULL,
    title                      text       NULL,
    BackGroundColor            text       NULL,
    CustomColor                text       NULL,
    headerImage                text       NULL, -- header background image.
    pageBackgroundImgConfigRow integer    NULL, -- page background image.
    pageBackgroundStyleSelector integer   NULL, -- page background style selector image/user color.
    headerBackground           text       NULL,
    headerBackColor            text       NULL,
    headerCustomColor          text       NULL,
    headerFont                 text       NULL,
    headerFontSize             integer    NULL,
    headerCaption              text       NULL,
    headerFontColor            text       NULL,
    LoginBoxTitle              text       NULL,
    welcomeMessage             text       NULL,
    errorMessage               text       NULL,
    messagesFontColor          text       NULL,
    MobileRedirection          integer    NOT NULL, -- mobile CP Pages 
    AdEnable                   text       NULL,
    AdContent                  text       NULL,
    AdPlace                    text       NULL,
    AdFont                     text       NULL,    
    AdFontSize                 integer    NULL,
    AdFontColor                text       NULL,
    FooterEnable               text       NULL,
    FooterContent              text       NULL,
    FooterFontColor            text       NULL
);


Create table tempCPUserProfiles
(
ProfileId		Integer NOT NULL PRIMARY KEY AUTOINCREMENT, -- Billing ProfileId
ProfileName		text	NOT NULL ,
ProfileDesc		text    NOT NULL,
MultiLogin		Boolean	NOT NULL,
ModifyAccount		Boolean NOT NULL,
BatchGen		Boolean NOT NULL,
IdleTimeout 		Integer NOT NULL, -- Minutes
ShowAlert		Boolean NOT NULL, -- 0=No Alert 1=Show Alert
AlertType		Integer NOT NULL, -- 0=Hour, 1=Day, 2=MB, 3=GB
AlertValue		Integer NULL,	  -- may be Hours/Days/MB/GB depending on AlertType
ValidDurationCheck	Boolean NOT NULL, 
ModifyDuration		Boolean NULL,	  -- 1=Modify on frontdesk
DurationType		Integer NULL,     -- 0=Account Created, 1=Account Login, 2=Begin From
StartTimeType		Boolean NULL,	  -- 0=Hours, 1=Days
StartTimeValue		Integer	NULL,     -- Hours (field will be nill for DurationType=2)
BeginDate		text	NULL,    -- format "YYYY/MM/DD@HH:MM" (field will be nill for ValidBegin=0 & 1)
ModifyUsage		Boolean NULL,	 -- 1=Modify on frontdesk
MaxUsageTimeCheck	Boolean NOT NULL, 
MaxUsageTimeType	Boolean NULL,     -- 0=Hours, 1=Days
MaxUsageTimeValue	Integer	NULL,     -- in Hours EDITABLE
MaxUsageTrafficCheck	Boolean NOT NULL,
MaxUsageTrafficType	Boolean NULL,	  -- 0=MB, 1=GB 
MaxUsageTrafficValue	Integer NULL,      -- in MB EDITABLE
UNIQUE (ProfileName)
);


CREATE TABLE CPAccConf(
	UserName text NOT NULL,
	BeginEndTimeCheck integer NOT NULL,
	SessionIdealTimeout integer NOT NULL,
	StartTime text NOT NULL, --YYYY/MM/DD@HH:MM 
	EndTime   text NOT NULL, --YYYY/MM/DD@HH:MM
	LoginCheck integer NOT NULL,
	MaxUsageTime integer NOT NULL,
	MaxUsageTraffic text NOT NULL
);

CREATE TABLE CPAccUserAccountExtend(
	UserName text NOT NULL,
	extendTimeUsage integer NOT NULL,
	extendTrafficUsage text NOT NULL,
	extendEndTime text NOT NULL
);

insert into dbUpdateRegisterTbl values ('UMI_COMP_PLATFORM', 0, 1, 'CPAccConf', 0, 0, 1, 1);
insert into dbUpdateRegisterTbl values ('UMI_COMP_PLATFORM', 0, 0, 'CaptivePortalSession', 0, 0, 1, 1);
insert into dbUpdateRegisterTbl values ('UMI_COMP_PLATFORM', 0, 0, 'CPAccUserAccountExtend', 0, 1, 1, 0);
insert into dbUpdateRegisterProgram values ('/pfrm2.0/bin/captivePortalAcc', 0, 1, 'CPAccConf', 0, 0, 1, 1);
insert into dbUpdateRegisterProgram values ('/pfrm2.0/bin/CPAccSessionUpdate', 0, 0, 'CaptivePortalSession', 0, 0, 1, 1);
insert into dbUpdateRegisterProgram values ('/pfrm2.0/bin/CPAccSessionExtend', 0, 0, 'CPAccUserAccountExtend', 0, 1, 1, 0);
insert INTO dbUpdateRegisterTbl VALUES ("UMI_COMP_PLATFORM", 0, 1, "CaptivePortal", 0, 1, 1, 0);
insert into dbUpdateRegisterTbl values ("UMI_COMP_CAPTIVEPORTAL", 0, 0, "CaptivePortalSession", 0, 1, 1, 1);
insert into tableDefaults values ("CaptivePortalPageDetails", "LoginBoxTitle", "CAPTIVE PORTAL LOGIN", "", "");
insert into tableDefaults values ("CaptivePortalPageDetails", "MobileRedirection" , "0","","");
insert into tableDefaults values ("CaptivePortalPageDetails", "welcomeMessage", "Please Login!", "", "");
insert into tableDefaults values ("CaptivePortalPageDetails", "errorMessage", "Invalid UserName/Password", "", "");
insert into tableDefaults values ("CaptivePortalVlan", "redirectType", "2", "", "");
insert into tableDefaults values ("tempCPUserProfiles", "AlertValue", "0", "", "");
insert into tableDefaults values ("tempCPUserProfiles", "IdleTimeout", "10", "", "");
insert into tableDefaults values ("tempCPUserProfiles", "DurationType", "0", "", "");

-- fbwifi
create table fbwifi(
    enabled     Boolean NOT NULL,
    vendor_key  text NOT NULL,
    name text   text NOT NULL,
    sw_version  text NOT NULL,
    hw_version  text NOT NULL,
    id          text NOT NULL,
    secret      text NOT NULL
);

create table fbwifisessions(
    token       text NOT NULL,
    ip_address  text NOT NULL
);

create table fbwifivlan(
    vlanName       text NOT NULL,
    vlanId         integer  NOT NULL,
    interfaceName       text NOT NULL,
    fbwifion       Boolean  NOT NULL,
    PRIMARY KEY (vlanId) --Primary key.

);
insert INTO dbUpdateRegisterTbl VALUES ("UMI_COMP_PLATFORM", 0, 1, "fbwifi", 0, 0, 1, 0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/lua /pfrm2.0/bin/fbwifienable.lua /tmp/system.db", 0, 1, "fbwifi", 0, 0, 1, 0);
CREATE TABLE IntelAmtPorts
(
    srcPort                 integer         NULL,
    destPort                integer         NULL,
    enable                  boolean         NULL
);

CREATE TABLE IntelAmtStart
(
    enable Boolean NOT NULL,
    serverIp text NULL    
);

insert into dbUpdateRegisterTbl values ("UMI_COMP_INTELAMT", 0, 0, "IntelAmtPorts", 0, 1, 1, 1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_INTELAMT", 0, 0, "IntelAmtStart", 0, 1, 1, 1);
CREATE TABLE loginSession
(
	username  text NOT NULL,
	ipaddr  text NOT NULL,
	cookie  text NOT NULL,
	loginTime  text NOT NULL,
	lastAccessTime  text NOT NULL,
	loginState  text NOT NULL,
	loginMessage  text,
	RefererValue  text,
	PRIMARY KEY (ipaddr,cookie),
    FOREIGN KEY (username) REFERENCES Users(UserName)
)
;

CREATE TABLE GroupAccessControl
(
    GroupId                           integer   NOT NULL,
    LoginTimeout                      integer   NOT NULL,
    LockoutEnable	                  boolean   NOT NULL, --  Enable/disable login block mechanishm
    MaxLockoutAttempts	              integer   NULL,  	  --  Maximum allowed wrong login attempts
	LockPeriod				          integer	NULL,	  --  Time period for which user will be blocked
    DenyLogin                         boolean   NOT NULL,  
    DenyLoginFromWan                  boolean   NOT NULL, 
    LoginFromIP                       boolean   NOT NULL,  
    LoginFromBrowser                  boolean   NOT NULL,
    PRIMARY KEY (GroupId) 
    FOREIGN KEY (GroupId) REFERENCES UserGroups (GroupId)
)
;

CREATE TABLE AccessControlUserGroupPolicyBrowser
(
    OID                               integer   NULL,
    GroupId                           integer   NOT NULL,
    ClientBrowserName                 text      NOT NULL,
    PRIMARY KEY (GroupId, ClientBrowserName)
    FOREIGN KEY (GroupId) REFERENCES UserGroups (GroupId)
)
;

CREATE TABLE AccessControlUserGroupPolicyIPAddress
(
    OID                               integer   NULL,
    GroupId                           integer   NOT NULL,
    AddressType                       integer   NOT NULL, -- Option to indicate that Address is a single or a Network.
    Address                           text      NOT NULL, -- IP Address string. 
    MaskLength                        integer   NOT NULL, -- Mask Length.
    PRIMARY KEY (GroupId,Address,MaskLength)
    FOREIGN KEY (GroupId) REFERENCES UserGroups (GroupId)
)
;

CREATE TABLE SessionSettings
(
    GroupCapability                   integer   NOT NULL,
    SessionTimeout                    integer   NOT NULL,
    PRIMARY KEY (GroupCapability)
)
;

insert into tableDefaults values ("AccessControlUserGroupPolicyIPAddress", "MaskLength", "32", "", "");
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "GroupAccessControl", 0, 1, 1, 1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "AccessControlUserGroupPolicyBrowser", 0, 1, 1, 1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "AccessControlUserGroupPolicyIPAddress", 0, 1, 1, 1);
insert into tableDefaults values ("GroupAccessControl", "DenyLogin", "0", "", "");
insert into tableDefaults values ("GroupAccessControl", "DenyLoginFromWan", "0", "", "");
insert into tableDefaults values ("GroupAccessControl", "LoginFromIP", "0", "", "");
insert into tableDefaults values ("GroupAccessControl", "LoginFromBrowser", "0", "", "");
insert into tableDefaults values ("GroupAccessControl", "LockoutEnable", "1", "0", "1");
insert into tableDefaults values ("GroupAccessControl", "MaxLockoutAttempts", "3", "0", "");
insert into tableDefaults values ("GroupAccessControl", "LockPeriod", "60", "0", "");
insert into tableDefaults values ("GroupAccessControl", "LoginTimeout","5", "1", "999");

insert into stringsMap values ("USER_LOGIN_INVALID_PASSWORD","Invalid username or password");
insert into stringsMap values ("USER_LOGIN_SESSION_EXPIRED","Session expired. Please login.");
insert into stringsMap values ("USER_LOGIN_SESSION_TERMINATED","Your session has been terminated.");
insert into stringsMap values ("USER_LOGIN_USER_ALREADY_LOGGED_IN","User already logged in");
insert into stringsMap values ("USER_WRONG_USER_PASSWORD","Wrong Login User Password");
insert into stringsMap values ("USER_USER_NUMBER_EXCEEDED","Maximum limit reached for the number of users for this domain");
insert into stringsMap values ("USER_DENY_LOGIN","Blocked to Login by Admin");
insert into stringsMap values ("USER_DENY_LOGIN_FROM_WAN","Blocked to Login from WAN by Admin");
insert into stringsMap values ("USER_DENY_LOGIN_FROM_BROWSER","Blocked to Login from this browser");
insert into stringsMap values ("USER_DENY_LOGIN_FROM_IP","Blocked to Login from this IP Address");
insert into stringsMap values ("DENY_LOGIN_DEFAULT_ADMIN","Default admin group cannot be denied login");
--
-- This file includes  ospf component related Tables like -
--
--  1. ospf
--  2.ospf6
--
CREATE TABLE ospf
(

        ospfEnable     integer NOT NULL,  -- 0(Disabled), 1(Enabled)
        LogicalIfName  text,      		  -- LAN/WAN1/WAN2
        areaId         text,              -- Area Id
        priority       integer,              -- Router priority
        helloInterval  integer NOT NULL,    -- hello interval
        deadInterval   integer NOT NULL,    -- deadInterval
        cost           integer,             -- cost of the interface
        authType       text,              -- Type of Authentication text auth / md5 auth
        textAuthKey    text,              -- Text authentication key
        md5KeyId       integer,              -- MD5 key id
        md5AuthKey     text,                  -- md5 authentication key
        lanEnable      boolean NOT NULL       -- LAN exchange on WAN

)
;


CREATE TABLE ospf6
(
  ospf6Enable   integer NOT NULL, --0 (Disabled) , 1 (Enabled)
  LogicalIfName text,             --LAN/WAN1/WAN2 
  priority      integer,           --Router priority
  helloInterval integer NOT NULL, --hello packets interval
  deadInterval  integer NOT NULL, -- dead interval
  cost          integer   --cost of the interface
)
;

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "ospf", 0, 1, 1, 1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "ospf6", 0, 1, 1, 1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "ipAddressTable", 0, 1, 1, 1);
insert into dbUpdateRegisterProgram values ('/pfrm2.0/bin/ospfConfig',0,1,'ospf',0,1,1,1);
insert into dbUpdateRegisterProgram values ('/pfrm2.0/bin/ospfConfig',0,1,'ospf6',0,1,1,1);
insert into dbUpdateRegisterProgram values ('/pfrm2.0/bin/ospfConfig',0,1,'ipAddressTable',0,1,1,1);
insert into stringsMap values ("OSPF_CONFIG_FAILED","ospf Configuration Failed");
insert into stringsMap values ("OSPF6_CONFIG_FAILED","ospf6 Configuration Failed");
insert into tableDefaults values ("ospf", "ospfEnable", "0", "", "");
insert into tableDefaults values ("ospf6", "ospf6Enable", "0", "", "");
insert into tableDefaults values ("ospf", "lanEnable", "1", "0", "1");
CREATE TABLE serverCheck
(
    authType text NOT NULL,               -- Authentication Type
    checkNow    integer NOT NULL,         -- checkNow Status
    updateFromWeb    integer NOT NULL,    -- check whether update is coming from web or backend
    response  integer NOT NULL,           -- response get from auth servers
    firstServerStatus  integer NOT NULL,  -- status of first server
    secondServerStatus  integer NOT NULL, -- staus of second server
    thirdServerStatus  integer NOT NULL,  -- status of third server
    PRIMARY KEY (authType)                -- primary key
)
;

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",0,0,"serverCheck", 0, 1,0,0);
insert into dbUpdateRegisterProgram values ('/pfrm2.0/bin/serverCheck',0,0,'serverCheck',0,1,0,0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/ntJoinStatus",0,0,"serverCheck", 0, 1,0,0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/ntJoinStatus",0,0,"NTDomainSettings", 0, 1,1,1);
INSERT INTO serverCheck VALUES ("Radius",0,0,0,0,0,0);
INSERT INTO serverCheck VALUES ("ldap",0,0,0,0,0,0);
INSERT INTO serverCheck VALUES ("pop3",0,0,0,0,0,0);
INSERT INTO serverCheck VALUES ("ntDomain",0,0,0,0,0,0);
INSERT INTO serverCheck VALUES ("activeDirectory",0,0,0,0,0,0);


-- SQL table for L2TP VPN Client.

-- l2tpVPNClient table
CREATE TABLE l2tpVPNClient
(
    OID                 	integer,             -- OID
    l2tpClientEnable   		boolean    NOT NULL, -- enable/disable L2TP VPN Client
    l2tpServerIp      		text       NOT NULL, -- IPv4 Address of L2TP Server
    RemoteNetwork       	text       NOT NULL, -- Network Address of network remote to  L2TP VPN Client
    RemoteNetmask        	integer    NOT NULL, -- Subnet Mask of network remote to L2TP VPN Client
    UserName      		    text       NOT NULL, -- username allocated to client
    Password       		    text       NOT NULL, -- password allocated to client
    Secret              	text	   NULL,     -- secret, if required
    DemandFlag              boolean    NOT NULL, -- initiate link only on demand, refer pppd man page 
    IdleTimeOut      		integer    NULL,     -- bring down connection if link is idle for this much time
    EnableMppe              boolean    NULL, -- enable MPPE 
                                                 -- NOTE : server should also support this option    
    ClientIp                text        
    -- add your new entries here	
);

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,0,"l2tpVPNClient",0,1,1,1);

insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/l2tpClientConfig",0,0,"l2tpVPNClient", 0, 1,1,1);


-- SQL table for L2TP VPN Client connection status.

-- l2tpClientConnectionStatus table
CREATE TABLE l2tpClientConnectionStatus
(
    OID                     integer,              -- OID  
    connectionStatus        integer     NOT NULL, -- show status of connection
    actionStatus            boolean     NOT NULL, -- action allowed or not
    action                  boolean     NOT NULL  -- action (connect/drop)
    -- add your new entries here	
);

--SQL table for auto dial L2TP

CREATE TABLE autodiall2tpvpn
(
    OID                    integer,               --OID
    action                 boolean     NOT NULL,  --Enable or disable 
    time                   integer     NOT NULL  --time
);

insert into tableDefaults values ("autodiall2tpvpn","time","2","","");

insert into tableDefaults values ("autodiall2tpvpn","action","0","","");

insert into saveTables (tableName) values("autodiall2tpvpn");

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,0,"autodiall2tpvpn",0,1,1,1);

insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/l2tpClientConfig",0,0,"autodiall2tpvpn", 0, 1,1,1);







---
--- GRE Tunnel Component schema
---

CREATE TABLE GRE
(
    TunnelName text NOT NULL, --Name of the GRE Tunnel.
    IpAddress  text NOT NULL, --IP Address of GRE Tunnel.
    SubnetMask text NOT NULL, --Subnet mask of GRE Tunnel.
    InterfaceName text NOT NULL, --Interface Name on which tunnel is 
                                 --established.
    RemoteIp  text NOT NULL, --Remote end of the GRE Tunnel.
    DdpBrd boolean NOT NULL, --Enable/disable broadcast on DDP.
    DstIpAddr text NOT NULL, --Destination network of static route.
    RouteNetMask text NOT NULL, --subnet mask of remote network.
    GwIpAddr  text NOT NULL, --gateway for static route.
    PRIMARY KEY (TunnelName) --Primary key.
); 

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "GRE", 0, 1, 1, 1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/greConfig", 0, 1, "GRE", 0, 1, 1, 1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/greConfig", 0, 1, "networkInterface", 0, 1, 0, 0);
insert into StringsMap values('GRE_CONFIGURATION_ALREADY_EXISTS','GRE Tunnel with configured Remote IP and Interface already exists');
insert into StringsMap values('MAX_LIMIT_REACHED','Cannot add configuration to this table. Maximum limit reached.');
insert into StringsMap values('GRE_CONFIG_FAILED','Operation Failed.');
-- Table that holds the advanced qos polocy information
-- Each row will be a policy in the CFP.
-- We keep track of the policy using the name. key is the name
CREATE TABLE advQosPolicyTable
    ( 
    -- Key attributes that every policy should have
    policyName text NOT NULL,
    policyType integer NOT NULL,
    priority  integer NOT NULL,
    portName text NOT NULL,
    description text,
    -- Attributes that the policy have
    vlan integer,
    macDstAddr text,
    macSrcAddr text,
    ipDstAddr text,
    ipSrcAddr text,
    tcpSrcPort integer,
    tcpDstPort integer,
    udpSrcPort integer,
    udpDstPort integer,
    PRIMARY KEY(policyName)
    );

-- Table that holds the port rate control information 
-- Each row shall have a relation of portName - percentage of link
-- We dont need a daemon to handle port rate control since it 
-- does not need CFP setting.
CREATE TABLE PortRateControl
(
    OID         integer     NULL,
    portName    text    NOT NULL,
    portRatePct integer NOT NULL,
    PRIMARY KEY (portName)
);

-- This table holds the SIP and H.323 feature special handling status 
-- 0 means that the feature is disabled. 1 mean enabled.
-- sipStatus will have the status for the SIP.
-- h3232Status will have the status for H.323 packet handling.
CREATE TABLE AdvancedQosSIPH3232
(
    OID         integer       NULL,
    sipStatus   integer  NOT  NULL,
    h3232Status integer  NOT  NULL
);

-- This table holds the flow based bandwidth control information
-- Flow : we consider IP to IP with a defined protocol.
-- serviceId refers to the service of the row ID in the table 
-- Services.

CREATE TABLE FlowBasedPolicyTable
(
    OID            integer    NULL,
    policyName     text  NOT  NULL,
    serviceId      integer NOT NULL,
    ratePercentage integer NOT NULL,
    dstIP          text,
    srcIP          text,
    dstPort        integer NOT NULL,
    PRIMARY KEY (policyName)
);

-- Strings and other info that are need for advanced QOS.
insert into compFacilityMap values ("UMI_COMP_CFP_DAEMON",3);

-- CFP daemon shall process all the updates on these tables
insert into dbUpdateRegisterTbl values ("UMI_COMP_CFP_DAEMON",0,1,"advQosPolicyTable",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_CFP_DAEMON",0,1,"AdvancedQosSIPH3232",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_CFP_DAEMON",0,1,"FlowBasedPolicyTable",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_CFP_DAEMON",0,1,"AdvancedQosSIPH3232",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_CFP_DAEMON",0,1,"swGlobalCfg",0,1,1,1);

-- We dont need a daemon to handle port rate control since it 
-- does not need CFP setting.
insert into dbUpdateRegisterProgram values("/pfrm2.0/bin/portRateControl", 0, 1, "PortRateControl", 1, 1, 1, 0);

-- Strings that need to hanlde errors meaningfully in GUI.
insert into stringsmap values ("QOS_CONFLICT_OF_POLICY", "Submitted QOS Policy conflicts with a existing configuration");
insert into stringsmap values ("QOS_CONFLICTING_SYSTEMWIDE_POLICY", "Submitted QOS Policy conflicts with an existing configuration");
insert into stringsmap values ("QOS_CONFLICT_OF_NAME_POLICY", "Submitted QOS Policy name conflicts with an existing configuration");
insert into stringsmap values ("MAX_NUM_OF_POLOCIES_REACHED", "Maximum number of polocies that can be programmed reachced");

-- advancedVlan status table
--
-- This table will hold all the advanced vlan state information.
-- 
--

CREATE TABLE AdvancedVlanStatus
(
    OID             	integer   NULL,
	ProtocolVlanState	boolean	  NOT NULL,	   -- Protocol Based Vlan Operational Status ( Enable/Disable)
    MacVlanState		boolean	  NOT NULL,	   -- MAC Based Vlan Operational Status ( Enable/Disable)
	DoubleVlanState		boolean	  NOT NULL,	   -- Double Vlan Operational Status ( Enable/Disable)
	VoiceVlanState      boolean	  NOT NULL,	   -- Voice Vlan Operational Status ( Enable/Disable)
    PRIMARY KEY (ProtocolVlanState)
)
;
-- Protocol Based Vlans Configuration/Status Table
--
-- All untagged packets coming into port, that match the 'protocol' are placed into
-- the vlan specified by 'vlanId'. Multiple protocols can be specified. If so, they 
-- need to ve comma separated.
--
-- The rows in table ProtocolVlanInterfaceConfig contain per-port entries, with port
-- number identified by 'portNum'. When for a particular row portNum == 255, it means its a system wide entry, 
-- i.e., rule is are applicable on all ports in the router.
--

CREATE TABLE ProtocolVlanConfig
(
    OID             	integer     NULL,
    GroupId             integer     NOT NULL,     -- A unique id, identifying this rule - GroupId
    GroupName           text        NULL,         -- Optional Text, describing the Group  
    portNum        	    integer     NOT NULL,     -- port identifier    , 255 for systemwise setting
    vlanId              integer     NOT NULL,     -- vlan where the matching packets are put into
    protocol            text        NOT NULL,     -- comma separated Protocol list  (from : IP / ARP / IPX) for matching
    PRIMARY KEY (GroupId)
)
;

-- MAC Based Vlans Configuration/Status Tables
--
-- All untagged packets coming into port, that have the same SRC MAC as ' macAddress' are placed into
-- the vlan specified by 'vlanId'. 
-- The rows in table MacVlanInterfaceConfig contain per-port entries, with port 
-- number identified by 'portNum'. When for a particular row portNum == 255, it means its a system wide entry, 
-- i.e., rule is are applicable on all ports in the router.
--

CREATE TABLE MacVlanConfig
(
    OID             	integer     NULL,
    portNum        	    integer     NOT NULL,     -- port identifier    , 255 for systemwise setting
    vlanId              integer     NOT NULL,     -- vlan where the matching packets are put into
    macAddress          text        NOT NULL,     -- SRC Mac of the incoming packet for matching
    PRIMARY KEY (portNum, macAddress)
)
;


-- Double Vlans Configuration/Status Table
--
-- When 'portNum' == 255, the double vlan is enabled on all ports. An additional tag, determined by 'etherType', is
-- added to the packets. 'etherType' can be standard 802.1q (0x8100) tag, or a vMAN tag (0x88A8), or a 'customTag'
-- specified by user. 
-- portNum != 255, specifes the same information when the configuration is on a per port basis.
-- 

CREATE TABLE DVLanConfig
(
    OID             	integer     NULL,
    portNum        	    integer     NOT NULL,     -- port identifier    , 255 for systemwise setting
    etherType           text        NOT NULL,     -- { dot1q_tag | vman_tag | custom_tag }; 
    customTag           integer     NULL,         -- A custom ethertype for use as an additional tag. Must be set when etherType == custom_tag 
    PRIMARY KEY (etherType)
)
;


-- Voice Vlan Configuration/Status Table
-- voice traffic is identified using the SRC MAC of the packets coming in. A predefined list of OUI are used to detect VOIP
-- phones connected to the switch.
-- When VoiceVlan is enabled on a given port 'portNum', the voice traffic can be detected and classified. Such traffic can be
-- set in a vlan ( voiceVlanMode == vlan, && voiceVlan == vlan-number) or can be put in a diffferent cosq 
-- ( voiceVlanMode == dot1p, && customDot1p == dot1p-number), or no prioritization (voiceVlanMode == none).
-- Non Voice traffic can be put in a lower cos-queue, by overriding any default dot1p tag from incoming packet by specifying
-- 'overrideCos == true'
--

CREATE TABLE VoiceVlanInterfaceConfig
(
    OID             	integer     NULL,
    VoiceVlanState		boolean	  	NOT NULL,	  -- Voice Vlan Operational Status ( Enable/Disable) for this port
    portNum        	    integer     NOT NULL,     -- port identifier
    overrideCos         boolean     NOT NULL,     -- Should the CoS value from incoming 'non voice' traffic be discarded ? 
    voiceVlanMode       text        NOT NULL,     -- { disable | none | vlan | dot1p | untagged } 
    customDot1p         integer     NOT NULL,     -- when voiceVlanMode == dot1p, all voice traffic will be assigned this dot1p mapping
    voiceVlan           integer     NOT NULL,     -- when voiceVlanMode == vlan, all voice traffic will be put in this vlan
    PRIMARY KEY (portNum)
)
;


-- Advanced QoS configuration error values
-- insert into advQoSPolicyCount values (0);

--insert into compFacilityMap values ("UMI_COMP_CFP_DEMON",3);
insert into dbUpdateRegisterTbl values ("UMI_COMP_CFP_DAEMON",0,1,"AdvancedVlanStatus",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_CFP_DAEMON",0,1,"ProtocolVlanConfig",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_CFP_DAEMON",0,1,"MacVlanConfig",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_CFP_DAEMON",0,1,"DVLanConfig",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_CFP_DAEMON",0,1,"VoiceVlanInterfaceConfig",0,1,1,1);


insert into stringsmap values ("CONFLICT_OF_NAME_POLICY", "Submitted configuration name conflicts with /is a duplicate of an existing configuration");
--insert into stringsmap values ("MAX_NUM_OF_POLOCIES_REACHED", "Maximum number of polocies that can be programmed reachced");
insert into stringsmap values ("VLANS_DISABLED", "Vlan functionality is currently disabled");
insert into stringsmap values ("VLAN_DOESNT_EXIST", "The selected VLAN doesn't exist in configuration");
insert into stringsmap values ("CONFLICT_OF_POLICY", "Submitted configuraion conflicts with / is a duplicate of an existing configuration");
insert into stringsmap values ("CONFLICTING_SYSTEMWIDE_POLICY", "Submitted configuraion conflicts with an existing configuration");
insert into stringsmap values ("VALIDATION_FAILURE", "One of the configured parameters has been assigned an illegal value");

insert into tableDefaults values ("MacVlanConfig","vlanId","","1","4094");
insert into tableDefaults values ("VoiceVlanInterfaceConfig","VoiceVlanState","0","0","1");


--
-- This file includes LM component related Tables like -
--
--  1. LM
-- These tables are not necessary for now

-- CREATE TABLE IPS_LM
--(
--    Activation_key text NULL,   -- Activation license key
--    Activated_time integer NULL,
--    valid_thru     integer NULL
--);
--
--CREATE TABLE AP6_LM
--( 
--    APS_supported integer NOT NULL,   -- number of APS supported on the AP.
--    FirstActivationKey text NULL,     -- First activation key
--    FirstActivatedDate integer NULL,  -- First AC activated date
--    FirstACvalidThru time integer NULL, -- First AC expiration date
--    SecondActivationKey text NULL,     -- second activation key
--    SecondActivatedDate integer NULL,  -- second AC activated date
--    secondACvalidThru time integer NULL, -- second AC expiration date
--    ThirdActivationKey text NULL,        -- Third AC key
--    ThirdActivatedDate integer NULL,     -- Third AC activation date
--    ThirdACValidThru   integer NULL      -- Third AC expiration date
--);
--              
--insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "LM", 0, 1, 1, 1);
--insert into tableDefaults values ("IPS_LM", "Activation_key", "0", "","");
--insert into tableDefaults values ("IPS_LM", "Activated_time", "0", "","");
--insert into tableDefaults values ("IPS_LM", "valid_thru", "0", "","");
--insert into tableDefaults values ("AP6_LM", "APS_supported", "6", "6", "24");


insert into stringsMap values ("LM_ACTIVATION_FAILED","License activation failed.");
insert into stringsMap values ("LM_ACTIVATION_SUCCEEDED","Activated successfully, please reboot the device for the license to take effect.");
insert into stringsMap values ("LM_LICENSES_CLEAR","Licenses cleared.");
insert into stringsMap values ("LM_NTP_ENABLE_REQUIRED", "NTP should be enabled and synchronised before activating the WCF license.");
insert into stringsMap values ("LM_IPS_LIC_REQUIRED", "VPN license should be enabled before activating the WCF license.");
insert into stringsMap values ("LM_LIC_PRE_REBOOT" , "One license is already activated, please reboot the device before activating another license."); 
insert into dbUpdateRegisterTbl values ('UMI_COMP_TRAFFIC_ACC', 0, 0, 'userAccountingSession', 0, 1, 1, 1);
insert into dbUpdateRegisterTbl values ('UMI_COMP_TRAFFIC_ACC', 0, 0, 'userAccountingEnable', 0, 1, 1, 0);
Create table userAccountingSession
(
userName                    text NOT NULL,    -- unique user name
ipAddress                   text NOT NULL,    -- IP address associated with this user
nasIpAddr                   text NULL,        -- NAS-IP address associated with this user
macAddr                     text NULL,        -- mac address of the user if exists
ifName                      text NOT NULL,    -- interface to which the client is connected
nasPort                     Integer NULL,      -- nas port like vlan
idleTimeout                 Integer NOT NULL, -- idle time our for this user
userType                    Integer NOT NULL, -- type of user cap, tempCap, pptp, l2tp, sslvpn, ipsec
enableAccounting            Integer NOT NULL, -- enable Accounting for this user
maxTimeUsageCheck           Integer NOT NULL, -- Time based user accounting
maxTimeUsageType            Integer NOT NULL, -- Time based accounting type (from login), (from creation), (start end/time)
maxTimeFromAllowed          Integer NOT NULL, -- Max Time allowed for this user
startTimeFromLogin          Integer NOT NULL, -- Start time for this user
stopTimeFromLogin           Integer NOT NULL, -- Stop time for this user
maxBandwidthUsageCheck      Integer NOT NULL, -- Bandwidth based accounting 
maxBandwidthUsageType       Integer NOT NULL, -- Bandwidth based accounting type (total bandwith), (rx bytes), (tx bytes)
maxBandwidthUsage           Integer NOT NULL, -- Total bandwith Allowed
maxTXBandwidthUsage         Integer NOT NULL, -- Total TX bandwith Allowed
maxRXBandwidthUsage         Integer NOT NULL  -- Total RX bandwith Allowed
--UNIQUE (userName)
);

Create table userAccountingEnable
(
captivePortal               Integer NOT NULL, -- enable/disable status for captive Portal
interimInterval             Integer NOT NULL, -- interim Interval period for radius accounting
routeIfaceName              text NOT NULL     --  iface selected in load balance mode, default:WAN1
);

Create table radAcctRouteTbl
(
serverId                    integer NOT NULL, -- serverId of acct server
serverIp                    text NOT NULL,    -- radius acctng server Ip
routeIp                     text NOT NULL,    -- LAN/VLAN interface Ip of same subnet as serverIp, else dummy
routeIface                  text NOT NULL     -- LAN/VLAN interface name of same subnet as serverIp, else dummy
);

-- table defaults
insert into tableDefaults values ("userAccountingSession", "userName", "", "", "");
insert into tableDefaults values ("userAccountingSession", "ipAddress", "", "", "");
insert into tableDefaults values ("userAccountingSession", "idleTimeout", "0", "", "");
insert into tableDefaults values ("userAccountingSession", "userType", "0", "", "");
insert into tableDefaults values ("userAccountingSession", "enableAccounting", "0", "0", "1");
insert into tableDefaults values ("userAccountingSession", "maxTimeUsageCheck", "0", "0", "1");
insert into tableDefaults values ("userAccountingSession", "maxTimeUsageType", "0", "", "");
insert into tableDefaults values ("userAccountingSession", "maxTimeFromAllowed", "0", "", "");
insert into tableDefaults values ("userAccountingSession", "startTimeFromLogin", "0", "", "");
insert into tableDefaults values ("userAccountingSession", "stopTimeFromLogin", "0", "", "");
insert into tableDefaults values ("userAccountingSession", "maxBandwidthUsageCheck", "0", "", "");
insert into tableDefaults values ("userAccountingSession", "maxBandwidthUsageType", "0", "", "");
insert into tableDefaults values ("userAccountingSession", "maxBandwidthUsage", "0", "", "");
insert into tableDefaults values ("userAccountingSession", "maxTXBandwidthUsage", "0", "", "");
insert into tableDefaults values ("userAccountingSession", "maxRXBandwidthUsage", "0", "", "");
insert into tableDefaults values ("userAccountingEnable", "interimInterval", "300", "300", "3600");
insert into tableDefaults values ("userAccountingEnable", "captivePortal", "0", "0", "1");
insert into tableDefaults values ("userAccountingEnable", "routeIfaceName", "WAN1", "", "");
insert into tableDefaults values ("radAcctRouteTbl", "serverIp", "", "", "");
insert into tableDefaults values ("radAcctRouteTbl", "routeIp", "0.0.0.0", "", "");
insert into tableDefaults values ("radAcctRouteTbl", "routeIface", "dummy", "", "");

-- Modification History
-- 
-- 01g,01may12,bhj Fixed 31424 - POP authentication support for SSLVPN
-- 01f,12may11,rac Added new table SslvpnEnable to support sslvpn enable/disable feature
-- 01e,06apr11,rac Changed AddressType to 4 in SSLVPNResourceObject table as required by sslvpn backend apis
-- 01d,07feb11,bhj Added IPv6 support to sslvpn
-- 01c,16feb11,bhj Fixed 21618, Added new entry in stringsMap
-- 01b,27feb10,ar  included new column for RefererValue to support CSRF fix.
-- 01a,22oct08,til included new colume to handle certificate updates 
--
--

--
-- This file includes sslvpn component related Tables like -
--
--  1. sslvpn Users
--  2. sslvpn Groups
--  3. sslvpn Domains
--  4. sslvpn PortalLayouts
--  5. sslvpn Policies
--  6. sslvpn Resources
--  7. sslvpn ClientConfiguration
--  8. sslvpn PortForwarding
--  9. sslvpn ActiveUsersStatus / sslvpn Connection Status
-- 10. sslvpn UsersState 
--
--  TODO :
--  0. Review
--  1. Include Error Macros
--  2. Rectifications, if any after getting Reviewed.
--

--
-- Portal Layout Table
--
--  SPECS(SPECIFICATIONS) :
--
--  1. DefaultPortal is used as a hidden key to mark(*) a layout as
--      'system Generated' PortalLayout or user defined 'display Default portal'.
--      DefaultPortal takes 0 (not a default Portal), 1 (system Default), 2(user Configured Display Default) 
--  
--  2. Portal Layout's 'Banner Message' @ ADD/EDIT is shown as 'Description' in
--      the list of PortalLayouts @ PortalLayouts Main page.
--      Its better to change 'Description' in GUI as 'Banner Message' to avoid confusion.
-- 
--  3. We can completely avoid the field 'Description' from displaying in the List of layouts as Very lengthy
--      entries in the field causes some weird results.
--
--  4. A Portal if it is  DefaultPortal cannot be deleted.
--      i.e, If DefaulPortal == 1 or 2, mark the PortalLayout with * and Grey out the
--      checkBox used for Deleting the row entry.
--  
--  5. A Portal canot be deleted if its UseCount > 0(=> if any of domains use it).
--     i.e, If a portal was Configured for any of the domains, such Portal
--     cannot be deleted. 
--     Error = "Portal cannot be deleted if Domains are Configured for it" should be thrown.
--  
--  6. When Domain is deleted/added, the 'UseCount' of the associated PortalLayout should be 
--      Updated(decremented/incremented).
--
--  7. PortalURL for a PortalLayoout entry should be Manufactured by the GUI/LUA, 
--      as "https://$wanIP/portal/$PortalLayoutName"  using wanIP field obtained from 
--      WAN Interface Table.
--  
--  8. Setting a portal with no domains configured, as Default portal, should throw an error.
--     i.e, clicking 'default' for a portal with UseCount == 0,should throw an error.   
--     error : "Portal is not configured for any domain. set as default Failed."
--  

CREATE TABLE SSLVPNPortalLayout
(
    OID                                 integer     NULL,
    PortalLayoutName                    text        NOT NULL,   -- unique PortalName, PRIMARY KEY.
    DefaultPortal                       integer     NULL,       -- Hidden value to mark the portal as system default.
    PortalSiteTitle                     text        NULL,       -- Displayed in Window's Title Bar for UserPortal 
    BannerTitle                         text        NULL,       -- Dispalyed in Login Page of the portal.
    BannerMessage                       text        NULL,       -- @ alias to 'Description'. 
                                                                -- Dispalyed in Login Page of the portal.
    DisplayBanner                       boolean     NULL,       -- option to Enable 'Display BannnerMessage'
    EnableHTTPMetaTags                  boolean     NULL,       -- option to Enable 'HTTP Tags for Cache Control'.  
    EnableActiveXWebCacheCleaner        boolean     NULL,       -- option to Enable Active X web Cache Control.
    EnableVPNTunnel                     boolean     NULL,       -- option to Enable Display VPNTunnel in userPortal.   
    EnablePortForwarding                boolean     NULL,       -- option to Enable Display PF in userPortal.   
    UseCount                            integer     NULL,       -- The number of Domains configured for this Portal.    
    PortalURL                           text        NULL,       -- shortCut link to UserPortal page.
    profileName                         text        NULL,       -- login profile name
    PRIMARY KEY (PortalLayoutName)
)
;

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "SSLVPNPortalLayout", 0, 1, 1, 1);
insert into tableDefaults values ("SSLVPNPortalLayout", "DefaultPortal", "0", "", "");
insert into tableDefaults values ("SSLVPNPortalLayout", "EnableVPNTunnel", "1", "", ""); -- Enabling VP by default
insert into tableDefaults values ("SSLVPNPortalLayout", "UseCount", "0", "", "");
insert into stringsMap values ("SSLVPN_PORTAL_LAYOUT_CONFIG_FAILED","PortalLayout(s) Configuration Failed");
insert into stringsMap values ("SSLVPN_PORTAL_LAYOUT_HAS_DOMAIN_DEL_FAILED","PortalLayout can not Deleted if it contains Domain(s)");
insert into stringsMap values ("SSLVPN_PORTAL_LAYOUT_HAS_GROUP_DEL_FAILED","PortalLayout can not Deleted if it contains Group(s)");
insert into stringsMap values ("SSLVPN_PORTAL_LAYOUT_NO_DOMAIN_SET_AS_DEFAULT_FAILED","Portal cannot be set as default if no domain uses it");
insert into stringsMap values ("SSLVPN_PORTAL_LAYOUT_NO_GROUP_SET_AS_DEFAULT_FAILED","Portal cannot be set as default if no group uses it");
insert into stringsMap values ("SSLVPN_PORTAL_LAYOUT_DELETE_SUCCESS","PortalLayout(s) Deleted Successfully");
insert into stringsMap values ("SSLVPN_PORTAL_INFO_FIND_FAILED","Failed to find Portal Information");
insert into stringsMap values ("SSLVPN_USER_AUTH_FAILED","SSLVPN User authentication Failed. Use the correct SSL portal URL to login");
insert into stringsMap values ("USER_AUTH_FAILED","User authentication Failed. Only default portal''s users should be allowed to login");

--
-- Domains Table
--
-- SPECS :
--
--  1. 'AuthenticationType', decides which Fields other than DomainName and
--      PortalLayoutName, should get disabled or enabled in the Add/Edit pages
--      of Domain configuration. In other words, Only related fields of 
--      'AuthenticationType' should be Enabled. 
--     Please refer platform1.0's add domain page.
--
--  2. 'AuthenticationType' Mapping : 
--      RULES:
--           For DropDown Entry,
--                             [GUI]   : [values needed by Backend]
--           case local User Database  : set value as "local";
--           case Radius-PAP           : set value as "radius_pap";
--           case Radius-CHAP          : set value as "radius_chap";
--           case Radius-MSCHAP        : set value as "radius_mschap";
--           case Radius-MACHAPv2      : set value as "radius_mschapv2";
--           case NT Domain            : set value as "ntdomain";
--           case Active Directory     : set value as "active-directory";
--           case LDAP                 : set value as "ldap";			
--    To avoid any Confusion we can display in the DropDown List of
--    Authentication Type, the same values what we set for 'AuthenticationType'. 
--
--  3. 'DefaultDomain' is a flag to indicate that Domain is system generated.  
--      It is used as hidden key to mark(*) in GUI as Default Domain.
--      'DefaultDomain' takes values 0 (not a default), 1 (default Domain).
--      Default Domains Cannot be deleted.
--
--  4. A Domain Should not be deleted if Users are Configured for it.
--      Error = "Domain cannot be deleted if Users are Configured for it." should be thrown.
-- 
--  5. when a Domain is created, its corresponding Default group(group with the same name as that of Domain)
--      should also be created in the GroupTable and the DefaultGroup flag should be set to 1 for that Group.
-- 
--  6. Domain Should NOT be Deleted if its portal is a Default Portal(ie when DefaultPortal == 1 or 2)
--      Error: "Domain Cannot if its portal is set as Default".
--     For a Domain, 'DefaultPortal' value  of its portal can be obtained using 
--      portalLayoutName reference to PortalLayoutTable. 
--          

CREATE TABLE SSLVPNDomain
(
    OID                               integer     NULL,
    DomainName                        text        NOT NULL,   -- Unique DomainName, PRIMARY KEY
    PortalLayoutName                  text        NOT NULL,   -- Portal for this Domain. 
    AuthenticationType                text        NOT NULL,   -- Authentication type.
    AuthenticationServer              text        NULL,       -- Authenticating server address.
    SecondAuthenticationServer        text        NULL,       -- Authenticating server address.
    AuthenticationRadiusSecret        text        NULL,       -- Radius secret.
    SecondAuthenticationRadiusSecret  text        NULL,       -- Radius secret.
    AuthenticationPort                integer     DEFAULT 0,  -- Port of primary authentication server
    SecondAuthenticationPort          integer     DEFAULT 0,  -- Port of secondary authentication server
    NTDomainWorkGroup                 text        NULL,       -- Work Group for NT Domain.
    LDAPBaseDN                        text        NULL,       -- Base DomainName for LDAP Authentication.
    ActiveDirectoryDomain             text        NULL,       -- AD domain Name for AD Authentication.
    SSLEnable                         boolean     NULL,       -- SSL for POP authentication
    CAFile                            text        NULL,       -- CA File used for POP Authentication
    DefaultDomain                     boolean     NULL,       -- Flag to indicate that the domain is a System Generated Domain.                                                            -- Default value is set to 0.    
    PRIMARY KEY (DomainName),
    FOREIGN KEY (PortalLayoutName) REFERENCES SSLVPNPortalLayout (PortalLayoutName)

)
;

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "SSLVPNDomain", 0, 1, 1, 1);
insert into tableDefaults values ("SSLVPNDomain", "DefaultDomain", "0", "", "");
insert into tableDefaults values ("SSLVPNDomain", "AuthenticationPort", "0", "", "");
insert into tableDefaults values ("SSLVPNDomain", "SecondAuthenticationPort", "0", "", "");
insert into tableDefaults values ("SSLVPNDomain", "SSLEnable", "0", "", "");
insert into stringsMap values ("SSLVPN_DOMAIN_CONFIG_FAILED","Domain(s) Configuration Failed");
insert into stringsMap values ("SSLVPN_DOMAIN_HAS_USERS_DOM_DEL_FAILED","Can not Delete a Domain if it contains User(s)");
insert into stringsMap values ("SSLVPN_PORTAL_IS_DEFAULT_DOMAIN_DEL_FAILED","Cannot delete the Only domain, As its portal is set as Default");
insert into stringsMap values ("SSLVPN_PORTAL_IS_DEFAULT_DOMAIN_EDIT_FAILED","Cannot change the protal for the only domain, As its portal is set as Default");
insert into stringsMap values ("SSLVPN_CA_FILE_TOO_LARGE","CA certificate file size is too large");
insert into stringsMap values ("SSLVPN_CA_FILE_UPLOAD_FAILED","CA certificate file upload failed");
insert into stringsMap values ("SSLVPN_CA_FILE_DELETE_FAILED","CA certificate file delete failed");

--
-- Groups Table
--
--  SPECS:
--
--  1. In Group Edit Page,
--      RULE:
--      Ldap Attributes fields should be enabled only if AuthenticationType == 'ldap'.
--      'AuthenticationType' for a Group could be obtained from DomainTable using the 'DomainName'
--      refrence .
--   
--  2. 'DefaultGroup' is the attribute to indicate that it's created along with the
--      creation of a domain. It is used as hidden key to mark(*) in GUI as Default
--      Group.
--      DefaultGroup takes values = 0 (Not a default Group), 1 (Default group).
--      Default Groups cannot be deleted.
--
--  3. when Domain is created, its corresponding Default group(group with the same name as that of Domain)
--      should also be created in the GroupTable and the DefaultGroup flag should be set to 1 for that Group.
      
--  4. Group, if has Users Configured for it, cannot be deleted.
--      Error : "Group cannot be deleted if Users are configured for it" should be thrown.
--
--  5. GUI REVIEW/proposal:
--      a. Can the LDAP Attributes be moved to ADD Page so that the user dont miss configuring
--          LDAP attributes.(Presently LDAP Attr are configured in EDIT page of Groups)
--      b. If LDAP Attributes are Moved to ADD page, 
--          We need to use AuthenticationType of selected DomainName to enable or disable the LDAP Attributes.   
--          The above same mechanism is followed in the EDIT page too.
-- 

CREATE TABLE SSLVPNGroup
(
    OID                         integer     NULL,
    GroupName                   text        NOT NULL,   --  Unique Group name, PRIMARY KEY.
    DomainName                  text        NOT NULL,   --  Domain to which This Group Belongs.       
    GroupTimeOut                integer     NOT NULL,   --  Idle TimeOut of Group, Defaul is 10.
    LDAPAttribute1              text        NULL,       --  LDAP Attributes.
    LDAPAttribute2              text        NULL,       --  LDAP Attributes.
    LDAPAttribute3              text        NULL,       --  LDAP Attributes.
    LDAPAttribute4              text        NULL,       --  LDAP Attributes.    
    DefaultGroup                boolean     NULL,       --  Flag to indicate that the Group is a Domain Generated Group.
                                                        --  Default valu is set to 0.
    PRIMARY KEY (GroupName),
    FOREIGN KEY (DomainName) REFERENCES SSLVPNDomain (DomainName)    
)
;

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "SSLVPNGroup", 0, 1, 1, 1);
insert into tableDefaults values ("SSLVPNGroup", "DefaultGroup", "0", "", "");
insert into tableDefaults values ("SSLVPNGroup", "GroupTimeOut", "5", "", "");
insert into tableDefaults values ("SSLVPNGroup", "LDAPAttribute1", "", "", "");
insert into tableDefaults values ("SSLVPNGroup", "LDAPAttribute2", "", "", "");
insert into tableDefaults values ("SSLVPNGroup", "LDAPAttribute3", "", "", "");
insert into tableDefaults values ("SSLVPNGroup", "LDAPAttribute4", "", "", "");
insert into stringsMap values ("SSLVPN_GROUP_CONFIG_FAILED","Groups Configuration Failed");
insert into stringsMap values ("SSLVPN_GROUP_HAS_USER_DEL_FAILED","Group cannot be deleted if it contains User(s)");
insert into stringsMap values ("SSLVPN_GROUP_IS_DEFAULT_DEL_FAILED", "Default Group(s) cannot be deleted");

--
-- Users Table
--
--  SPECS:
--
--  1. IPSEC user should be removed from the userType as we already have 
--      Xauth users Page.  
--
--  2. Use 'AuthenticationType' as hidden key to Identify which Groups(selected
--      from GroupList) Could support selected 'userType'. 
--      RULES:
--      An 'Adminstrator' userType can belong ONLY to a group which has "local" authenticationType. 
--
--  3. a. 'AutheticationType' is only for display purpose and for RULE @ SPECS 2(above)
--     b. 'DomainName' is only for Display Purpose @ 'list of users'. 
--     c. 'AuthenticationType' and 'DomainName' are NOT configurable for User and can be obtained 
--          using DomainName reference to the DomainTable.
--      
--  4. 'DefaultUser' indicates that the User is a system generated user and marks(*) such users.
--      Default user belongs to a default group which belongs to a default domain.
--      DefaultUser takes values 0 (NOT a default user), 1 (default user)
--
--  5. 'UserType' Mapping:
--      RULES:
--      For DropDown Entry,     
--      case Adminstrator : set UserType as 3 and display in the table as "Administrator"
--      case SSLVPN User  : set UserType as 0 and display in the table as "SSLVPN User"
--
--  6. When a User is Deleted, his/her DefinedAddresses Table and
--      DefinedBrowsers Tables should be Deleted. 
--
--  7. A Domain Should not be deleted if Users are Configured for it.
--      Error = "Domain cannot be deleted if Users are Configured for it." should be thrown.
-- 
--  8. GUI REVIEW/proposal:
--      Is it {LastName and FirstName} or {MiddleName and LastName} ?

-- ****  AdministratorPassword field is only to show in GUI.
--       No need to store this value in table. we need to call one
--       function in userLuaLib.c file written by comp dev.
--       It will validate the administrator password
--       and send ok or error, based on that value we need to update the password
--       while editing the user info. This is the password of the
--       administrator (current logged in user), the one who is trying to change the Password.
-- 

CREATE TABLE SSLVPNUser
(
    OID                     integer         NULL,
    HashName		        text	        NULL,       --  A random string of minimum length to support 
                                                        --  max characters and spaces for usernames
    UserName                text            NOT NULL,   --  Unique UserName(login name), PRIMARY KEY
    FirstName               text            NULL,       --  Middle Name
    LastName                text            NULL,       --  Last Name     
    GroupName               text            NOT NULL,   --  Group to which this User Belongs, FOREIGN KEY.
    UserType                integer         NOT NULL,   --  Type of the User.
    UserTimeOut             integer         NOT NULL,   --  Idle TimeOut for User, Default value 10 secs 
    DenyLogin               boolean         NOT NULL,   --  Option to Block Login, Default is FALSE(0) ie., ALLOW        
    DenyLoginFromWan        boolean         NOT NULL,   --  Option to Block Login From WAN, -  
                                                        --   - Default as FALSE(0) ie., ALLOW    
    LoginFromIP             boolean         NOT NULL,   --  Option to Allow Login From this Address. - 
                                                        --   - default value is FALSE(0) ie., Deny 
    LoginFromBrowser        boolean         NOT NULL,   --  Option to Allow Login From this Browser. - 
                                                        --   - Default is FALSE(0), ie DENY
    Password                text            NULL,       --  password / New Password in Edit page.
    DefaultUser             boolean         NULL,       --  Flag to indicate that the user is a system generated User.
	LockoutEnable			boolean			NOT NULL,	--	Enable/disable login block mechanism
	MaxLockoutAttempts		integer			NULL,		--  Maximum allowed wrong login attempts
	LockPeriod				integer			NULL,		--	Time period for which user will be blocked
														--	after MaxLockoutAttempts. Value in seconds
    SaveTableValue          boolean         NULL,       --  Save to the HashName taable value to TRUE(1)
                                                        --  default is FALSE(0)
    PRIMARY KEY (UserName),
    FOREIGN KEY (GroupName) REFERENCES SSLVPNGroup(GroupName)
)
;
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "SSLVPNUser", 0, 1, 1, 1);
insert into tableDefaults       values ("SSLVPNUser", "DefaultUser", "0", "", "");
insert into tableDefaults       values ("SSLVPNUser", "UserTimeOut", "10", "", "");
insert into tableDefaults       values ("SSLVPNUser", "DenyLogin", "0", "", "");
insert into tableDefaults       values ("SSLVPNUser", "DenyLoginFromWan", "0", "", "");
insert into tableDefaults       values ("SSLVPNUser", "EditPassWord", "0", "", "");
insert into tableDefaults       values ("SSLVPNUser", "LoginFromIP", "0", "", "");
insert into tableDefaults       values ("SSLVPNUser", "LoginFromBrowser", "0", "", "");
insert into stringsMap          values ("SSLVPN_USER_CONFIG_FAILED","SSLVPN User(s) Configuration Failed");
insert into stringsMap          values ("BROWSER_ALREADY_ADDED","Browser already added for this user");
insert into stringsMap          values ("WRONG_USER_PASSWORD","Wrong Login User Password");
insert into stringsMap          values ("USER_SESSION_NOT_FOUND","Failed to get login user's session to check login users password");
insert into stringsMap          values ("USERNAME_CHANGED","User Name Changed");
insert into stringsMap          values ("SSLVPN_USER_LIMIT_REACHED","Maximum SSL Seat count reached");
insert into tableDefaults values ("SSLVPNUser", "LockoutEnable", "1", "0", "1");
insert into tableDefaults values ("SSLVPNUser", "MaxLockoutAttempts", "3", "0", "");
insert into tableDefaults values ("SSLVPNUser", "LockPeriod", "60", "0", "");
insert into tableDefaults values ("SSLVPNUser", "SaveTableValue", "0", "0", "1");

--
-- UserLoginPolicy's Defined Address Table
--
-- SPECS:
--
--  1.  if any address entries are added, UserName field should be
--      filled up with the UserName for whom this address entry is getting
--      added. 
--      This was achieved platform1.0 by passing UserName across LoginPolicies tabs.
--
--  2. 'AddressType' values 
--      RULES: 
--      case IP Address: set AddressType = 1 and display as "IP Address";
--      case IP Network: set AddressType = 2 and display as "IP Network";
--
--  3. If addressType is 'IP Network', MaskLength field should be enabled/editable .
--     If addressType is 'IP Address', MaskLength field should be disabled/Not editable but should set value as 32.
--      By default 'MaskLength' is set to 32 so that it can be used a PRIMARY KEY, as in case of IP Networks two 
--      different MaskLength can be applied to same Network Address. 
--
--  4. For a Given User : 
--      a. Address and Mask Lenth combination Forms the PRIMARY KEY.  
--      b. All the configured IPs are subjected to same LoginPolicy PERMISSION. 
--      c. Obviously same UserName.
--
--  5. When a user is deleted, all the entries of DefinedAddress of that user
--      should also be deleted.
--  
--

CREATE TABLE SSLVPNUserLoginPolicyDefinedAddress
(
    OID                     integer         NULL,
    UserName                text            NOT NULL,       -- UserName to whom these Addresses Apply, FOREIGN KEY
    AddressType             integer         NOT NULL,       -- Option to indicate that Address is a single or a Network.
    Address                 text            NOT NULL,       -- IP Address string. 
    MaskLength              integer         NOT NULL,       -- Mask Length. 
    PRIMARY KEY (UserName, Address, MaskLength),
    FOREIGN KEY (UserName) REFERENCES SSLVPNUser (UserName) 
    FOREIGN KEY (UserName) REFERENCES USERDBUsers (UserName)
)
;
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "SSLVPNUserLoginPolicyDefinedAddress", 0, 1, 1, 1);
insert into tableDefaults       values ("SSLVPNUserLoginPolicyDefinedAddress", "MaskLength", "32", "", "");

--
-- USerLoginPolicy's Defined Browsers Table
--
-- SPECS:
--
--  1. 'ClientBrowserName' Values:
--      RULES:
--      case Internet Expolorer : 
--        set ClientBrowserName value as "MSIE" and  display as "Internet Explorer"
--      case Opera :
--        set value as "Opera"
--      case Netscape Navigator:
--        set value as "Navigator" and display as "Netscape Navigator"
--      case Firefox :
--        set value as "Firefox"
--      case Mozilla:
--        set value as "Mozilla" 
--
--  2.  if any Browsers entries are added, UserName field should be
--      filled up with the UserName for whom this address entry is getting
--      added.
--
--  4. For a Given User : 
--      a. All the Configured Browsers are subjected to same loginPolicy PERMISSION
--      b. Obviously same UserName .
--
--  5. When a user is deleted, all the entries of DefinedBrowser of that user
--      should also be deleted.
--
--

CREATE TABLE SSLVPNUserLoginPolicyDefinedBrowser
(
    OID                     integer         NULL,
    UserName                text            NOT NULL,       -- For whom this Browser Rule Apply.
    ClientBrowserName       text            NOT NULL,       -- Browser Name 
    PRIMARY KEY (UserName, ClientBrowserName),
    FOREIGN KEY (UserName) REFERENCES SSLVPNUser (UserName)
    FOREIGN KEY (UserName) REFERENCES USERDBUsers (UserName)  
)
;
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "SSLVPNUserLoginPolicyDefinedBrowser", 0, 1, 1, 1);

--
-- Resource Table
--
--  SPEC:
--  
--  1. 'ServiceType' values mapping:
--      RULES:
--      case VPN Tunnel      : set value as "VIRTUAL-PASSAGE" and display as 'VPN Tunnel'
--      case Port Forwarding : set value as "VIRTUAL-TRANSPORT" and display as 'Port Forwarding'
--      case All             : set value as "all" and display as 'All'
--
--  2. 'UseCount' is a counter of number of policies using a particular Resource.
--      when a resource is created, initiate the counter to 0.
--
--  3. Cannot delete a Resource if some Policy is using it.
--     i.e, if UseCount > 0, donot delete the Resource.
--      Error : "Resource in use, Cannot delete the Resource" should be Thrown.
--  
--  4. 'UseCount' for a resource should be updated when ever a corresponding policy updates its 'resource'.
--      i.e, 'UseCount' for a resource(r1) should be incremented where ever a policy configures
--      'ResourceName' as 'r1' and decremented when the policy changes its ResourceName from r1 to r2 or 
--      when the policy Configuring r1 as its resourceName is deleted.
--      The 'UseCount' has to be updated using 'ResourceName' reference to 'ResourceTable' in the 'PolicyTable'.
--

CREATE TABLE SSLVPNResource
(
    OID                     integer         NULL,
    ResourceName            text            NOT NULL,   -- Unique Resource Name, PRIMARY KEY.
    ServiceType             text            NOT NULL,   -- Service type on which the Resource is Configured.
    UseCount                integer         NULL,       -- The number of Policies configured over this ResourceName.
    PRIMARY KEY (ResourceName)
)
;

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "SSLVPNResource", 0, 1, 1, 1);
insert into tableDefaults values ("SSLVPNResource", "UseCount", "0", "", "");
insert into stringsMap values ("SSLVPN_RESOURCE_CONFIG_FAILED","SSLVPN Resource(s) Configuration Failed");
insert into stringsMap values ("SSLVPN_RESOURCE_IN_USE_DELETE_FAILED","Resource in use, Cannot delete the Resource");
insert into stringsMap values ("NO_RESOURCE_OBJECTS_CONFIGURED","No Objects Configured for the selected Resource");
insert into stringsMap values ("CANNOT_DELETE_ONLY_RESOURCE","Deleting the Only resourceObject of a resource will make the corresponding policy IN EFFECTIVE");

--
-- ResourceObject Table 
-- 
-- SPECS:
--
--  1. Every ResourceObject entry belongs to one of the Reource.
--      So, ResourceName should be passed to the page 'ResourceEdit'
--      where we configure ResourceObjects.
--  
--  2. Port ="BeginPort-EndPort"; if EndPort is Entered in GUI
--     Port = BeginPort         ; if EndPort is NOT Entered in GUI
--  
--  3. All the ResourceObjects belonging to a Resource should be deleted
--      when corresponding Resource is Deleted.
--  
--  4. 'ObjectType' Mapping
--     RULES:
--      For DropDown selected(Object type) @ resource Configure,     
--      case IP Address: set ObjectType = 1 and display In the table as "IP Address";
--      case IP Network: set ObjectType = 2 and display In the table as "IP Network";
--
--  5. GUI REVIEW : field 'IP Address/Name' should be 'IP Address' @ resourceConfigure(vpn->sslvpn->resource->add)  
--      As FQDN is not supported in the Backend.
-- 
--  6. GUI REVIEW : No need of 2 Fields : IP address/Name, Network Address @ resourceConfigure
--      (vpn->sslvpn->resource->add) Rather we can sigle Field 'ObjectAddress'
--
--  7. if 6. is implemented:
--      When ObjectType == IP Network, Only then 'Mask Length' should be Enabled.
--     else
--      When ObjectType == IP Network, Only then both 'Network Address' and 'Mask Length' should be Enabled.             
--
--  8. GUI REVIEW : No Resource Objects Table in the Resource Add page.
--  
--  9. DEfault Value is Given to port is " "(single space), just to make Port as PRIMARY KEY
--      And in the Backend, we will strip any spaces to pass empty string, if user Didnot 
--      configure port.    
--

CREATE TABLE SSLVPNResourceObject
(
    OID                     integer         NULL,
    ResourceName            text            NOT NULL,       --  Resource to which this Object Belongs to. 
    ObjectType              integer         NOT NULL,       --  IP Address / IP Network
                                                            --   - If IP Address, MaskLength will be ignored by backend.
    ObjectAddress           text            NULL,           --  Address of the Object
    ObjectAddress6          text            NULL,       	--  IPv6 Address of the Object
	AddressType				integer			NULL,			--	Address type of the Object Address
    MaskLength              integer         NOT NULL,       --  Mask length, default set to 32 
    StartPort               integer         NULL,           --  Start Port.
    EndPort                 integer         NULL,           --  End Port.    
    IcmpBlock               text            NULL,           --  Set Yes/No to enable/disable icmp rules.
    PRIMARY KEY (ResourceName, ObjectAddress, MaskLength, StartPort, EndPort),
    FOREIGN KEY (ResourceName) REFERENCES SSLVPNResource (ResourceName)
)
;

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "SSLVPNResourceObject", 0, 1, 1, 1);
insert into tableDefaults values ("SSLVPNResourceObject", "Port", " ", "", ""); -- default as " " single space
insert into tableDefaults values ("SSLVPNResourceObject", "MaskLength", "32", "", "");
insert into tableDefaults values ("SSLVPNResourceObject", "AddressType", "1", "", "");
insert into tableDefaults values ("SSLVPNResourceObject", "IcmpBlock", "no", "", "");
insert into stringsMap values ("SSLVPN_RESOURCE_IN_USE_DEL_POLCY_FIRST","Resource is in use, delete the policy first");
insert into stringsMap values ("SSLRESOURCE_OBJECT_DELETE_FAILED","Resource Object Delete Failed");
insert into stringsMap values ("RESOURCE_DELETE_FAILED","Resource delete failed");
insert into stringsMap values ("RESOURCE_DELETE_OK","selected Resources Deleted");

--
-- Policies Table
--
--  NEEDED FURTHER DISCUSSION:
--  ! regarding GUI design changes for policies add page and display entries.
--
-- SPECS:
-- 
--  1. 'PolicyType' mapping,
--      RULE:
--      For Radio Button checked(Policy for) @ List/Add pages
--      case Global : set value as "global"  
--      case Group  : set value as "group"  
--      case User   : set value as "user"
--
--  2. Port ='BeginPort-EndPort'; if EndPort is Entered in GUI
--     Port = BeginPOrt         ; if EndPort is NOT Entered in GUI
--
--  3. 'DestinationObjectType' Mapping,
--      RULE:
--      For Radio Button Checked(Apply Policy to ?) @ Add page, 
--      case Network Resource : set value as '1'
--      case Ip address       : set value as '2'
--      case IP Network       : set value as '3'
--      case All Addresses    : set value as '4'
--  
--  4. 'ServiceType' mapping:
--      RULES:
--      For DropDown Entry(Service) @ Add page,
--      case VPN Tunnel      : set value as "VIRTUAL-PASSAGE" and display as 'VPN Tunnel'
--      case Port Forwarding : set value as "VIRTUAL-TRANSPORT" and display as 'Port Forwarding'
--      case All             : set value as "all" and display as 'All'
-- 
--  5. 'Permission' mapping:
--      RULE:
--      For DropDown Entry @ Add/Edit page,
--      case PERMIT : set value as "Permit" and display as 'Permit'
--      case DENY   : set value as "Deny" and display as 'Deny'
--      To avoid confusion we can have same text at drop down and also while
--      displaying the Configured Policies.
--
--  6. Do not allow a Policy to be ADDED over a Network Resource if the NO
--      objects are configured for that resource.
--     i.e, For a policy to be added for a Network resource say r1, There should
--     atleast one row in the ResourceObjects table with 'r1' as its ResourceName.  
--
--  7. PROPOSAL :
--      'DestinationObject'  Mapping(For Displaying destination in the Policies List) 
--      RULE: 
--      For 'DestinationType'
--      case Network Resource(1) : set value same as "$ResourceName"
--      case IP Address      (2) : set value same as "$Address":"$Port"
--      case IP Network      (3) : set value same as "$Address"/"$maskLength":"$Port" 
--      case All Addresss    (4) : set value as "All"
-- 
--  8. when a policy is configured over a ResourceName, the Corresponding Resource's 
--      UseCount should be properly updated.
--  
--  9. 'PolicyOwnerName' runTime Mapping:
--      RULE :
--      When policyType is 
--      case global : set value as "global" 
--      case group  : set value as $GroupName selected from GroupList
--      case user   : set value as $UserName selected from UserList
--

CREATE TABLE SSLVPNPolicy
(
    OID                     integer         NULL,
    PolicyName              text            NOT NULL,       -- Policy Name, ID of policy for a policyOwner 
    PolicyType              text            NOT NULL,       -- Policy Type one of {"global", "group", "user"}
    PolicyOwnerName         text            NOT NULL,       -- fill based on Policy Type 
    DestinationObjectType   integer         NOT NULL,       -- Apply Policy to ? 
                                                            --  one of {NW Resoure, IP address, IP Network, All Address}
    Permission              text            NOT NULL,       -- policy is to PERMIT / DENY. Default value set is PERMIT
    DestinationObject       text            NULL,           -- The Fianl Value of Destination Object.
    ServiceType             text            NULL,           -- Service Type on which this Policy is configured.    
    Address                 text            NULL,           -- IP Address Input field.    
    MaskLength              integer         NULL,           -- Proposal to replace subnetmask
    ResourceName            text            NULL,           -- ResourceName if Destination Type is a NW resource. 
    StartPort               integer         NULL,           --  Start Port.
    EndPort                 integer         NULL,           --  End Port.
    IPVersion               integer         NULL,           --  IP version
    IcmpBlock               text            NULL,           --  Set Yes/No to enable/disable icmp rules.
    PRIMARY KEY (PolicyType, PolicyOwnerName, PolicyName),
    FOREIGN KEY (ResourceName) REFERENCES SSLVPNResource (ResourceName)
)
;

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "SSLVPNPolicy", 0, 1, 1, 1);
insert into tableDefaults       values ("SSLVPNPolicy", "PolicyOwnerName", "global", "", "");
insert into tableDefaults       values ("SSLVPNPolicy", "Permission", "Permit", "", ""); 
insert into tableDefaults       values ("SSLVPNPolicy", "IcmpBlock", "no", "", ""); 
insert into tableDefaults       values ("SSLVPNPolicy", "IPVersion", "1", "", ""); 
insert into stringsMap          values ("SSLVPN_POLICY_CONFIG_FAILED","SSLVPN Policy Configuration Failed");
insert into stringsMap          values ("SSLVPN_POLICY_ADD_FAILED_CONF_RESOURCE_FIRST","Configure the resource first before adding the Policy");

--
-- Client Configuration
--
--  GUI REVIEW : Proposal for addition of Option(checkBox/radioButton) to Configure DNS Attributes.
--

CREATE TABLE SSLVPNClientConf
(
    OID                 integer             NULL,
    EnableFullTunnel    boolean             NOT NULL,   --  Default is 0 (Unchecked, SPLIT TUNNEL MODE).  
    DNSSuffix           text                NULL,       --  DNS suuffix.       
    PrimaryDNSServer    text                NULL,       --  Primary DNS server.  
    SecondaryDNSServer  text                NULL,       --  secondary DNS server.
    BeginClientAddress  text                NOT NULL,   --  Begin Address, Default is : 192.168.251.1
    EndClientAddress    text                NOT NULL,   --  End Address,   Default is : 192.168.251.254
    BeginClientAddress6 text                NULL,   	--  IPv6 Begin Address, 
    EndClientAddress6   text                NULL,   	--  IPv6 End Address, 
    ForceIPv6		    boolean             NULL,   	--  Default is 0  
    lcpTimeout          text                NULL        --  lcpTimeout,   Default is : 60
)
;

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "SSLVPNClientConf", 0, 1, 1, 1);
insert into tableDefaults       values ("SSLVPNClientConf", "EnableFullTunnel", "0", "", "");
insert into tableDefaults       values ("SSLVPNClientConf", "BeginClientAddress", "192.168.251.1", "", "");
insert into tableDefaults       values ("SSLVPNClientConf", "EndClientAddress", "192.168.251.254", "", "");
insert into tableDefaults       values ("SSLVPNClientConf", "lcpTimeout", "60", "0", "999999");
insert into tableDefaults       values ("SSLVPNClientConf", "BeginClientAddress6", "4000::1", "", "");
insert into tableDefaults       values ("SSLVPNClientConf", "EndClientAddress6", "4000::200", "", "");
insert into tableDefaults       values ("SSLVPNClientConf", "ForceIPv6", "0", "", "");
insert into stringsMap          values ("IP_NETWORK_CONFLICT","IP/subnet is in conflict with LAN or WAN or VLANs. Please configure different pool");
insert into stringsMap          values ("END_ADDR_SMALLER_THAN_BEGIN_ADDR","End IP address must greater than or equal to the start IP address");

--
-- Client Routes
--

CREATE TABLE SSLVPNClientRoute
(
    OID                 integer             NULL,
    DestinationNetwork  text                NULL,   --  Destination Network (LAN side)
    SubnetMask          text                NULL,   --  subnet mask for above network 
    PRIMARY KEY (DestinationNetwork, SubnetMask)
)
;

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "SSLVPNClientRoute", 0, 1, 1, 1);
insert into stringsMap values ("SSL_VPN_CLIENT_ROUTE_CONFIG_FAILED", "SSL VPN client routes configuration failed");

--
-- PortForwarding Apps Map
--

CREATE TABLE SSLVPNPortForwardingAppsMap
(
    OID                 integer             NULL,
    ServerIP            text                NOT NULL,   -- Server Address.
    Port                integer             NOT NULL,   -- Port accesses on the above server.
                                                        -- PortForwarding rule is added using above 2 values.     
    PRIMARY KEY (ServerIP, Port)
)
;

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "SSLVPNPortForwardingAppsMap", 0, 1, 1, 1);

--
-- PortForwarding hosts Map
--

CREATE TABLE SSLVPNPortForwardingFQDNMap
(
    OID                 integer             NULL,
    ServerIP            text                NOT NULL,   -- Server Address.
--    ServerFQDN          text                NOT NULL,   -- FQDN binding for above address.
    FQDNName            text                NOT NULL,   -- FQDN binding for above address.
--    PRIMARY KEY (ServerIP, ServerFQDN)
    PRIMARY KEY (ServerIP, FQDNName)
)
;

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "SSLVPNPortForwardingFQDNMap", 0, 1, 1, 1);

--
-- Active Users / SSL VPN connection status 
-- 
-- The inputs are not given by the user, but are generated by the system basing 
-- on the logged in User's details.
--  
-- This table's fields are not configurable. Rather The Row entries are DELETED based on the SessionID and
-- are added by the Backened When a User Logins.
--  
CREATE TABLE SSLVPNActiveUsers
(
    OID                 integer             NULL,
    SessionID           text                NOT NULL,   -- Unique session Name, hidden, Needed by Backend API    
    Cookie              text                NULL,       -- This might NOT b required if sessionName == Cookie    
    UserName            text                NOT NULL,   -- Logged in User Name.
    GroupName           text                NULL,       -- Group of Logged in User.
    LoginAddress        text                NULL,       -- IP Address from which the User had logged in to the Portal.
    LoginTime           text                NULL,       -- Time of Login.
    LastAccessTime text                     NULL,       -- last access time
    PPPInterface        text                NULL,       -- ppp inteface name
    PPPInterfaceIP      text                NULL,       -- ppp inteface's IP
    PeerPPPInterfaceIP  text                NULL,       -- peer PPP interface's IP
    SessionStatus       text    DEFAULT     'ACTIVE',   -- session status of active user
    TxPackets           text                NULL,
    TxPacketsDropped    text                NULL,  
    TxBytes             text                NULL,
    RxPackets           text                NULL,
    RxPacketsDropped    text                NULL, 
    RxBytes             text                NULL,
    RefererValue	text		    NULL,	-- Http referer Value
    
    PRIMARY KEY (UserName)
)
;
-- Nor really sure that the flags are properly set ?
insert into stringsMap values ("SSL_VPN_USER_DISCONNECT_SUCCESS", "SSL VPN User Disconnected Successfully");
insert into stringsMap values ("SSL_VPN_USER_DISCONNECT_FAILED", "SSL VPN User State Reset Failed");
insert into stringsMap values ("EXPIRED_PWD_CHANGED", "Password changed by Administrator. Please login with new password");

-- Supporting Table to Track/Update ActiveUsers
--  Proposal : 
--  a. When ever a user is created an entry into 'SSLVPNUserState' should also be added.
--  b. when the ActiveUsers is Populated by a 'ActiveUsersGet' binary(TODO), the binary should also
--      update/set 'ActiveUser' entries in the 'SSLVPNUserState' table.
--  c. when 'disconnect' button is clicked, 'ActiveUser' flag for that user should be reset to 0.
--  d. when user is Deleted from DB, the corresponding user's entry in this table should also be deleted.
--  e. By default the users state is added as 0.(Inactive/NOT logged in) 
--
CREATE TABLE SSLVPNUserState
(
    OID                 integer             NULL,
    UserName            text                NOT NULL,       -- Logged in User Name.
    ActiveUser          boolean             NOT NULL,       -- flag to identify whether User is Currently 
                                                            -- logged into the box.
                                                            -- 0 : Not Logged in, 
    PRIMARY KEY (UserName)
)
;
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "SSLVPNUserState", 0, 1, 1, 1);
insert into tableDefaults values ("SSLVPNUserState", "ActiveUser", "0", "", "");
insert into stringsMap values ("VPN_SSLVPNCLIENT_CONFIG_FAILED","SSLVPN Client Config Failed");
insert into stringsMap values ("SSLVPN_PORTFORWARDING_CONFIG_FAILED","PortForwarding Config Failed");

CREATE TABLE httpsMgmt
(
    httpsMgmtPort integer NOT NULL,
    certEvent     integer NULL
)
;
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "httpsMgmt", 0, 1, 1, 1);
--insert into tableDefaults values ("httpsMgmt", "certEvent", "2", "", "");

CREATE TABLE SslvpnEnable
(
    OID                 integer             NULL,
    sslvpnEnableStatus  integer             NULL,
    sslvpnPort          integer             NULL
)
;
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "SslvpnEnable", 0, 1, 1, 1);

CREATE TABLE LoginProfiles
(
    configurationName          text       NULL,
    title                      text       NULL,
    BackGroundColor            text       NULL,
    CustomColor                text       NULL,
    headerImage                text       NULL,
    headerBackground           text       NULL,
    headerBackColor            text       NULL,
    headerCustomColor          text       NULL,
    headerFont                 text       NULL,
    headerFontSize             integer    NULL,
    headerCaption              text       NULL,
    headerFontColor            text       NULL,
    LoginBoxTitle              text       NULL,
    welcomeMessage             text       NULL,
    errorMessage               text       NULL,
    messagesFontColor          text       NULL, 
    AdEnable                   text       NULL,
    AdContent                  text       NULL,
    AdPlace                    text       NULL,
    AdFont                     text       NULL,    
    AdFontSize                 integer    NULL,
    AdFontColor                text       NULL,
    FooterEnable               text       NULL,
    FooterContent              text       NULL,
    FooterFontColor            text       NULL
);


CREATE TABLE LoginImageDetails
(
    name     text NOT NULL,
    value    Boolean NOT NULL
);
insert into tableDefaults values ("LoginProfiles", "configurationName", "Default", "", "");
insert into tableDefaults values ("LoginProfiles", "title", "Please Login", "", "");
insert into tableDefaults values ("LoginProfiles", "BackGroundColor", "1", "", "");
insert into tableDefaults values ("LoginProfiles", "headerImage", "1", "", "");
insert into tableDefaults values ("LoginProfiles", "headerBackground", "1", "", "");
insert into tableDefaults values ("LoginProfiles", "headerFont", "1", "", "");
insert into tableDefaults values ("LoginProfiles", "headerFontSize", "1", "", "");
insert into tableDefaults values ("LoginProfiles", "headerFontColor", "1", "", "");
insert into tableDefaults values ("LoginProfiles", "AdEnable", "0", "", "");
insert into tableDefaults values ("LoginProfiles", "FooterEnable", "0", "", "");
insert into tableDefaults values ("LoginProfiles", "LoginBoxTitle", "Portal Login", "", "");
insert into tableDefaults values ("LoginProfiles", "welcomeMessage", "Please Login!", "", "");
insert into tableDefaults values ("LoginProfiles", "errorMessage", "Invalid UserName/Password", "", "");


insert into tableDefaults values ("SslvpnEnable", "sslvpnEnableStatus", "1", "", "");
insert into tableDefaults values ("SslvpnEnable", "sslvpnPort", "443", "", "");

-- Login related String Maps
insert into stringsMap values ("LOGIN_INVALID_PASSWORD","Invalid username or password");
insert into stringsMap values ("LOGIN_SESSION_EXPIRED","Session expired. Please login.");
insert into stringsMap values ("LOGIN_SESSION_TERMINATED","Your session has been terminated.");
insert into stringsMap values ("LOGIN_USER_ALREADY_LOGGED_IN","user already logged in");
insert into stringsMap values ("USER_NUMBER_EXCEEDED","Maximum limit reached for the number of users for this domain");
insert into stringsMap values ("USER_GROUP_NUMBER_EXCEEDED","Maximum limit reached for the number of users for this group");

CREATE TABLE PortalProfiles
(
    Enable                     boolean    NOT NULL,
    CompanyName                text       NULL,
    Logo                       text       NULL,
    DepartmentName             text       NULL,
    Theme                      text       NULL,
    ProductName                text       NULL,
    WelcomeMessage             text       NULL
);

CREATE TABLE LogoDetails
(
    name     text NOT NULL,
    value    Boolean NOT NULL
);
CREATE TABLE sshd
(
        port integer NOT NULL,
        protocol integer NOT NULL,
        listenAddr text NOT NULL,
        keyBits integer NOT NULL,
        rootEnable integer NOT NULL,
        rsaEnable integer NOT NULL,
        dsaEnable integer NOT NULL,
        passEnable integer NOT NULL,
        emptyPassEnable integer NOT NULL,
        sftpEnable integer NOT NULL,
        scpEnable integer NOT NULL,
        sshdEnable integer NOT NULL,
        privSep   integer NOT NULL
)
;

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"sshd", 0, 1,1,1);
insert into stringsmap values ("SSHD_CONFIG_FAILED","SSHD configuration failed.");
CREATE TABLE OpenVpn
    (
     OID		Integer	NULL,
     ServerEnable	boolean	NOT NULL,	-- 0(Disable -default) or 1(Enable)
     OpenVpnMode        Integer,		-- Openvpn mode: 0(Server mode - default) or 1(Client mode) 2(AS Client)
     RemoteIpType       boolean NULL,       -- Openvpn remote IP/FQDN configuration option(for client mode)
     RemoteIp		Text,			-- Ip address of the openvpn server(for client mode)
     OpenVpnNetwork	Text	NOT NULL,	-- openvpn network
     OpenVpnNetmask	Text	NOT NULL,	-- openvpn netmask 
     Port		Integer	NULL,		--openvpn server default 1194
     TunnelProtocol	Integer	NULL,		--0(UDP-default) or 1(TCP)
     DevType		Integer NULL,		--Virtual Interface Type 0(Type-Tun), 1(Type-tap)
     EncryptionAlgorithm Integer NULL,		--Encryption cipher default- BF-CBC(0),AES-128(1),AES-192(2),AES-256(3) 
     HashAlgorithm	Integer	NULL,		--Digest algorithm  default- SHA1(0),SHA256(1),SHA512(2)
     LzoCompression	boolean NULL,		-- default null  - lzo compression
     TunnelType		boolean	NOT NULL,	-- Full Tunnel 0 - default / split tunnel 1
     AllowClientToClient boolean NOT NULL,	-- client-to-client connectivity-Enabling this flag allows client-client connectivity in split tunnel 
     TlsEnabled		 boolean NOT NULL,	-- Default-0.This corresponds to the enable check box 
     AdvancedOptions	boolean	NULL,		-- Advanced Tunnel Options
     Mtu		Integer	NULL,		-- Tunnel mtu "--tun-mtu n" Default-1500 
     Mssfix		Integer	NULL,		-- "--fragment size" 
     AdditionalConfig	boolean NULL,		-- Additoinal Config Options Default - 0
     KeyRenegotiationTime Integer NULL,		--default 36000 Renegotiate key after this secs
     PingDuration 	Integer NULL,		--default 10	Ping when inactive for this secs
     PingRetry		Integer NULL,		--default 120	Ping this many times
     VirtualDeviceName	Text	NULL,		--default tun1  virtual device name
     PassVerify		Text	NULL,		--script to verify username&passwd(auth-user-pass-verify)
     ClientConfDir	Text	NULL,		--null default, extra fields
     userAuthSupportEnable      boolean NOT NULL,   -- Enable userAuthSupportEnable, default value 0-> disable
     UserName    Text	NULL,		-- User Name
     Password    Text	NULL,		-- Password
     ptEnable      boolean NOT NULL,   -- Enable private tunnel, default value 0-> disable
     ptUserName    Text	NULL,		-- Private Tunnel User Name
     ptPassword    Text	NULL,		-- Private Tunnel Password
     ptClusterId   Text    NULL,               -- Cluster Id of Private Tunnel Server
     BlockCertWithCRL     boolean NOT NULL,  -- This corresponds to enabling block client certificates with CRL
     duplicateCN    boolean	NOT NULL,-- Enable using the duplicate certificates in diffrent clients  
	 allowOnlyUserBasedAuth  boolean NOT NULL,     -- Enable user Based Authentication only for client-cert-not-required
     FailoverRemoteIpType       boolean NULL,       -- Openvpn remote IP/FQDN configuration option(for client mode)
     FailoverRemoteIp   Text,			-- Ip address of the openvpn multiple server(for client mode)
	 UploadCaOnly  boolean NOT NULL,     -- upload ca certificate only for allow Only User BAsed Auth
	 authServerId      integer   NULL,    -- For External Authentications
     certificateVerification           boolean NOT NULL,   -- Enable certificates checking, default value 1-> enable
     serverClientCertsName    Text	NULL,		-- defualt certificates
     TlsCertsName    Text	NULL,		-- defualt certificates
     CrlCertsName    Text	NULL		-- defualt certificates 
    )
    ;

insert into tableDefaults values ("OpenVpn", "ServerEnable", "0", "", "");
insert into tableDefaults values ("OpenVpn", "userAuthSupportEnable", "0", "", "");
insert into tableDefaults values ("OpenVpn", "ptEnable", "0", "", "");
insert into tableDefaults values ("OpenVpn", "BlockCertWithCRL", "0", "", "");
insert into tableDefaults values ("OpenVpn", "duplicateCN", "0", "", "");
insert into tableDefaults values ("OpenVpn", "allowOnlyUserBasedAuth", "0", "", "");
insert into tableDefaults values ("OpenVpn", "FailoverRemoteIp", "None", "", "");
insert into tableDefaults values ("OpenVpn", "UploadCaOnly", "0", "", "");
insert into tableDefaults values ("OpenVpn", "authServerId", "0", "", "");
insert into tableDefaults values ("OpenVpn", "certificateVerification", "1", "", "");
insert into tableDefaults values ("OpenVpn", "serverClientCertsName", "default", "", "");

CREATE TABLE OpenVpnLanRoutes
    (
     OID		Integer	NULL,
     Network		Text	NOT NULL,	--Lan network behind router
     Netmask		Text	NOT NULL	--Netmask for above
    );

CREATE TABLE OpenVpnGwRoutes
    (
     OID		Integer	NULL,
     CommonName		Text,			--CommonName of the client certificate 
     Network		Text	NOT NULL,	--Lan network behind client gateway
     Netmask		Text	NOT NULL	--Netmask for above
    );


CREATE TABLE OpenvpnCertificates
    (
     OID		Integer NULL,
     name		Text,
     subjectName	Text,
     issuerName		Text,
     expiryTime		Text,
     serialNumber	Text,
     format		Text,
     certType		Text,
     certData		Text
    );

CREATE TABLE OpenvpnAuthCertificates
    (
     OID		    Integer NULL,
     name		    Text,
     caSubjectName	Text,
     crtSubjectName	Text,
     caCertData		Text,
     crtCertData	Text,
     keyCertData	Text,
     dhCertData		Text,
     keyExist       Text,
     dhExist        Text
    );

CREATE TABLE OpenvpnTlsCertificates
    (
     OID		    Integer NULL,
     name		    Text,
     tlsCertData	Text,
     tlsExist       Text
    );

CREATE TABLE OpenvpnCrlCertificates
    (
     OID		    Integer NULL,
     name		    Text,
     crlCertData	Text,
     crlExist       Text
    );

CREATE TABLE OpenvpnConnectionStatus
    (
     commonName		Text,
     clientIP       Text,
     bytesRx		Integer,
     bytesTx		Integer
    );
CREATE TABLE OpenvpnSession
(
        username  text NOT NULL,
        ipaddr  text NOT NULL,
        cookie  text NOT NULL,
        loginTime  text NOT NULL,
        lastAccessTime  text NOT NULL,
        loginState  text NOT NULL,
        loginMessage  text,
        RefererValue  text,
        PRIMARY KEY (ipaddr,cookie),
    FOREIGN KEY (username) REFERENCES Users(UserName)
);
CREATE TABLE OpenvpnClientConfig
(
        OID		Integer NULL,
        clientName      Text NOT NULL,
        name		Text,
        subjectName	Text,
        caCert  	Text,
        clientCert      Text,
        clientKey       Text
); 
CREATE TABLE OpenVpnConfigPolicy
(
    OID                     integer         NULL,
    PolicyName              text            NOT NULL,       -- Policy Name, ID of policy for a policyOwner 
    PolicyType              text            NOT NULL,       -- Policy Type one of {"global", "group", "user"}
    PolicyOwnerName         text            NOT NULL,       -- fill based on Policy Type 
    DestinationObjectType   integer         NOT NULL,       -- Apply Policy to ? 
                                                            --  one of {IP address, IP Network}
    Permission              text            NOT NULL,       -- policy is to PERMIT / DENY. Default value set is PERMIT
    DestinationObject       text            NULL,           -- The Fianl Value of Destination Object.
    Address                 text            NULL,           -- IP Address Input field.    
    MaskLength              integer         NULL,           -- Proposal to replace subnetmask
    StartPort               integer         NULL,           --  Start Port.
    EndPort                 integer         NULL,           --  End Port.
    IcmpBlock               text            NULL,          --  Set Yes/No to enable/disable icmp rules.
	PRIMARY KEY (PolicyType, PolicyOwnerName, PolicyName)
);

--insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "OpenVPNPolicy", 0, 1, 1, 1);
insert into tableDefaults       values ("OpenVPNPolicy", "PolicyOwnerName", "global", "", "");
insert into tableDefaults       values ("OpenVPNPolicy", "Permission", "Permit", "", ""); 
insert into tableDefaults       values ("OpenVPNPolicy", "IcmpBlock", "no", "", "");

CREATE TABLE OpenVpnPolicy
(
    OID                     integer         NULL,
    PolicyName              text            NOT NULL,       -- Policy Name, ID of policy for a policyOwner 
    PolicyType              text            NOT NULL,       -- Policy Type one of {"global", "group", "user"}
    PolicyOwnerName         text            NOT NULL,       -- fill based on Policy Type 
    DestinationObjectType   integer         NOT NULL,       -- Apply Policy to ? 
                                                            --  one of {IP address, IP Network}
    Permission              text            NOT NULL,       -- policy is to PERMIT / DENY. Default value set is PERMIT
    DestinationObject       text            NULL,           -- The Fianl Value of Destination Object.
    Address                 text            NULL,           -- IP Address Input field.    
    MaskLength              integer         NULL,           -- Proposal to replace subnetmask
    StartPort               integer         NULL,           --  Start Port.
    EndPort                 integer         NULL,           --  End Port.
    IcmpBlock               text            NULL,          --  Set Yes/No to enable/disable icmp rules.
	RemotesourceAddress           text            NULL,	       -- Remote Source Address 
	GroupId                 integer         NULL,         --GroupId Identification
	OctVal                  integer         NULL,         --Identification for last octet in RemotesourceAddress
	PRIMARY KEY (PolicyType, PolicyOwnerName, PolicyName)
);

CREATE TABLE openVPNActiveClients
    (
     cnName Text,
     ipAddrPortNum Text
    );
CREATE TABLE OpenVpnEasyrsaCert
(
    OID                     integer         NULL,
    ServerName              text            NOT NULL,       -- Server Name, used for server cert and key generation.
    ClientName              text            NOT NULL,       -- Client Name, used for client cert and key generation.
    SubjectName             text            NOT NULL,       -- subject Name, used for above certs and key generation.
    CertCreatedStatus       integer         NOT NULL,       -- Default value is 0, 1 indicates certs and keys are generated for the values configured.
    CertDefaultStatus       integer         NOT NULL,       -- Default value is 0. 1 indicates these certificates has been made default.
    CaCertData              text            NULL,       -- Ca cert data.
    CaKeyData               text            NULL,       -- Ca key data.
    ServerCertData          text            NULL,       -- Server cert data.
    ServerKeyData           text            NULL,       -- Server key data.
    ClientCertData          text            NULL,       -- Client cert data.
    ClientKeyData           text            NULL,       -- Client key data.
    DhKeyData               text            NULL,       -- Dhkey data.    
    defaultCrtData          text            NULL,       -- default cert data.
    defaultKeyData          text            NULL,       -- default key data.
    PRIMARY KEY (ServerName)
);

insert into tableDefaults values ("OpenVpnEasyrsaCert", "CertCreatedStatus", "0", "", "");
insert into tableDefaults values ("OpenVpnEasyrsaCert", "CertDefaultStatus", "0", "", "");

CREATE TABLE tcpdump
(
    LogicalIfName text NOT NULL,
    tcpdumpEnabled  boolean NOT NULL,
    FOREIGN KEY (LogicalIfName) REFERENCES networkInterface(LogicalIfName)
)
;

insert into tableDefaults values ("tcpdump","tcpdumpEnabled","0","0","1");
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"tcpdump", 0, 1,1,0);
insert into stringsMap values("TCPDUMP_CONFIG_FAILED","TCPDUMP Configuration Failed");
insert into stringsMap values("TCPDUMP_IFACE_DOWN","The interface selected is down");
CREATE TABLE dhcp
(
    dhcpEnabled boolean NOT NULL,
    logicalIfName text  NOT NULL,
    domainName text,
    startAddress text NOT NULL,
    endAddress text NOT NULL,
    defaultGw  text ,
    primaryDnsServer text,
    secondaryDnsServer text,
    winsServer text,
    leaseTime integer NOT NULL,
    enableDnsProxy boolean NOT NULL,
    primaryTftpServer text,
    secondaryTftpServer text,
    tftpServerOption66   text,
    oldState	boolean 
);

CREATE TABLE DhcpLeasedClients
(
   OID           integer,
   LogicalIfName text  NOT NULL,
   IPAddr        text,
   MacAddr       text NOT NULL,
   HostName      text,
   Starts        text,
   Ends          text,
   State         text,
   IAID          text,
   addressFamily integer NOT NULL,
   PRIMARY KEY   (IPAddr)
);

CREATE TABLE DhcpfixedIpAddress
(
        OID           integer,
        Name        text,
        LogicalIfName text  NOT NULL,
        IpAddr        text,
        MacAddr       text NOT NULL,
        AssociatingEnabled       boolean NOT NULL,
        PRIMARY KEY   (IpAddr,MacAddr)
)
;
-- Dhcpc table

CREATE TABLE Dhcpc
    (
    OID                      integer,           -- OID
    LogicalIfName            text     NOT NULL, -- interface names like 'lan1', 'wan2', etc.
    IspName                  integer,           -- name of the service provider
    GetDnsFromIsp            boolean  NOT NULL, -- do we need DNS from ISP ?
    PrimaryDns               text,              -- if we want to specify our DNS
    SecondaryDns             text,              -- if we want to specify our DNS
    ReleaseLease             boolean  NOT NULL, -- lease release flag
    HostName                 text,              -- host name to be sent to the server
    -- add your new entries here

    PRIMARY KEY (LogicalIfName),                -- primary key
    FOREIGN KEY (LogicalIfName) REFERENCES networkInterface (LogicalIfName)
    );

-- DhcpStatus - table for storing Dhcp related status information.
create table DhcpStatus
    (
    OID                      integer,           -- OID
    LogicalIfName            text     NOT NULL, -- interface names like 'lan1', 'wan2', etc.
    DhcpServerIp             text     NOT NULL, -- dhcp server identity.
    LeaseTime                text     NOT NULL, -- lease time of dhcp configured ip. 
    LeaseObtained            text     NOT NULL, -- time when dhcp server assgined ip to dhclient. 
    -- add newer entries here

    PRIMARY KEY (LogicalIfName),                -- primary key
    FOREIGN KEY (LogicalIfName) REFERENCES networkInterface (LogicalIfName)
    );

-- DhcpLdapServerInfo - table for storing and using Ldap Server related information
create table DhcpLdapServerInfo
    (
        OID                 integer,            -- OID
        DhcpLdapStatus       boolean NOT NULL,   -- Enable(1)/Disable(0) by default should be disabled.
        LogicalIfName       text    NOT NULL,   -- interface names like 'lan1', 'wan2', etc.
        DhcpLdapServerIP    text    NULL,       -- Ldap Server host name/IP - max text len - 21 chars.
        DhcpLdapSearchBase  text    NULL,       -- Search criterion - max text len - 255 chars.
        DhcpLdapServerPort  integer NULL,       -- Should not be > 65535 and not be less than 0.
        -- add newer entries here
        
        PRIMARY KEY (DhcpLdapServerIP),                -- primary key 
        FOREIGN KEY (LogicalIfName) REFERENCES networkInterface (LogicalIfName)
    );
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"dhcp", 0, 1,1,0);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"DhcpfixedIpAddress", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"DhcpLdapServerInfo", 0, 1,1,1);
insert into stringsMap values("DHCP_CONFIG_FAILED","DHCP Configuration Failed");
insert into tableDefaults values ('dhcp','dhcpEnabled','1','','');
insert into tableDefaults values ('dhcp','leaseTime','24','','');
insert into tableDefaults values ('dhcp','enableDnsProxy','1','','');
insert into tableDefaults values ("dhcp", "domainName", "DLink", "", "");
insert into tableDefaults values ("dhcp", "defaultGw", "", "", ""); 
insert into tableDefaults values ("dhcp", "primaryDnsServer", "", "", ""); 
insert into tableDefaults values ("dhcp", "secondaryDnsServer", "", "", ""); 
insert into tableDefaults values ("dhcp", "primaryTftpServer", "", "", ""); 
insert into tableDefaults values ("dhcp", "secondaryTftpServer", "", "", "");
insert into tableDefaults values ("dhcp", "tftpServerOption66", "", "", "");
insert into tableDefaults values ("dhcp", "winsServer", "", "", "");
insert into tableDefaults values ("DhcpLeasedClients", "addressFamily", "2", "", "");
insert into stringsMap values("DUPLICATE_IPADDR","IP address already assigned to other mac address. Please give another IP address.");
insert into stringsMap values("DUPLICATE_MACADDR","MAC address already configured. Please give another MAC address.");
-- SQL table for L2TP back-end component.

-- L2tp table
CREATE TABLE L2tp
    (
    OID                      integer,           -- OID
    LogicalIfName            text     NOT NULL, -- interface names like 'lan1', 'wan2', etc.
    IspName                  integer,           -- name of the service provider
    UserName                 text     NOT NULL, -- user name
    Password                 text     NOT NULL, -- password
    AccountName              text,              -- account name used in l2tp
    DomainName               text,              -- domain name used in l2tp
    Secret                   text,              -- secret to authenticate client
    GetIpFromIsp             boolean  NOT NULL, -- will ISP give IP ?
    GetDnsFromIsp            boolean  NOT NULL, -- do we need DNS from ISP ?
    MyIp                     text,              -- local IP of the wan interface
    ServerIp                 text     NOT NULL, -- l2tp server's IP
    StaticIp                 text,              -- ip which we want to assign or negotiate
    Gateway                  text,              -- Gateway to reach the L2TP Server
    NetMask                  text,              -- net mask for the above IP
    PrimaryDns               text,              -- if we want to specify our DNS
    SecondaryDns             text,              -- if we want to specify our DNS
    IdleTimeOutFlag          boolean  NOT NULL, -- do we require idle timeout ?
    IdleTimeOutValue         integer  NOT NULL, -- idle timeout value
    SplitTunnel              boolean  NOT NULL, -- split tunnel ?
    DualAccess               boolean  NOT NULL, -- L2TP or Dual Access L2TP
    StaticDNS                text     NOT NULL, -- L2TP DNS Static IP
    -- add your new entries here

    PRIMARY KEY (LogicalIfName),                -- primary key
    FOREIGN KEY (LogicalIfName) REFERENCES networkInterface (LogicalIfName)
    );

insert into tableDefaults values ("L2tp","LogicalIfName","wan1", "", "");
insert into tableDefaults values ("L2tp","UseDefaultMtu","0", "0", "1");
insert into tableDefaults values ("L2tp","MtuSize","1300", "10", "1600");
insert into tableDefaults values ("L2tp","IdleTimeOutFlag","0", "0", "1");
insert into tableDefaults values ("L2tp","IdleTimeOutValue","10", "5", "999");
insert into tableDefaults values ("L2tp","StaticDNS","0.0.0.0", "", "");
CREATE TABLE snmpTrap
(
	ipAddr  text NOT NULL,
	port  integer NOT NULL,
	commName text NOT NULL,
	snmpVersion text NOT NULL,

    PRIMARY KEY (ipAddr)
)
;

create table snmpAccessControl 
(
    ipAddr text NOT NULL, 
	subnetMask text NOT NULL, 
	commName text NOT NULL, 
	accessType text NOT NULL
	
-- 
--  PRIMARY KEY (ipAddr, subnetMask, commName) 
--  primary key should be :
--  ((ipAddr & subnetMask) and (commName))
--  where '&' is the bitwise/arithematic operation btwn ipAddress and subnetMask,
--  'and' is the logical operation with the above result and commName
--  
);

create table snmpv3Users 
(
    userName text NOT NULL, 
	accessType text NOT NULL, 
	securityLevel integer NOT NULL, 
	authAlgo text NOT NULL, 	 
	authPassword text, 
	privAlgo text NOT NULL, 
	privPassword text, 

	PRIMARY KEY (userName)
);

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"snmpAccessControl",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"snmpv3Users",0,1,1,1);
insert into stringsMap values ("SNMP_ACCESS_CONTROL_CONFIG_FAILED", "SNMP Access Control configuration failed");
insert into stringsMap values ("SNMPV3_USERS_CONFIG_FAILED","SNMPv3 susers configuration failed");
insert into stringsMap values ("SNMP_TRAPS_CONFIG_FAILED","SNMP traps configuration failed");

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"snmpTrap", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"system", 0, 1,1,1);

insert into stringsMap values ("SNMP_CONFIG_FAILED","SNMP configuration failed");
insert into stringsMap values ("SYS_CONFIG_FAILED","System configuration failed");

CREATE TABLE radvd
    (
    isEnabled            bool            , --  radvd enabled
    useDHCP6sPrefixes    bool            , --  use prefixes from upstream   
    UnicastOnly          integer         , --  unicast only !
    MaxRtrAdvInterval    integer         , --  router advertisement interval   
    AdvLinkMTU           integer         , --  Link MTU
    AdvManagedFlag       integer         , --  Use stateful protocol for 
                                           --  address assignment.
    AdvOtherConfigFlag   integer         , --  Other configuration flag
    AdvDefaultLifetime   integer         , --  default router lifetime
    AdvDefaultPreference integer         , --  router preference  
    LogicalIfName        text            , --  interface on which to run.
    FOREIGN KEY (LogicalIfName) REFERENCES networkInterface (LogicalIfName)    
    );

CREATE TABLE radvdLANPrefixPool
    (
    radvdPrefixType         integer     ,  --  6to4 or Others    
    Base6to4Interface       text        ,  --  6to4 Interface name.    
    SLAIdentifier           text        ,  --  SLA Identifier. 
    radvdAdvPrefix          text        ,  --  radvd advertisement prefix
    radvdAdvPrefixLength    integer     ,  --  radvd prefix length   
    radvdAdvPrefixLifetime  integer     ,  --  radvd prefix lifetime   
    interfaceName           text NOT NULL  --   interface for the advt prefix
    );
insert into tableDefaults values ("radvdLANPrefixPool", "interfaceName", "LAN", "", "");
insert into stringsMap values ("RADVD_CONFIG_FAILED", "RADVD Configuration Failed");
insert into stringsMap values ("RADVD_PREFIX_CONFIG_FAILED", "RADVD Prefix Configuration Failed");
insert into stringsMap values ("RADVD_PREFIX_DELETE_FAILED", "RADVD Prefix Deletion Failed");    
--
-- This file includes Rip component related Tables like -
--
--  1. Rip

CREATE TABLE Rip
(
	Direction	    		  integer	NOT NULL, -- 0(none), 1(In only), 2(Out only),
                                                  -- 3(Both)

	Version			    	  integer	NOT NULL, -- 0(Disabled), 1(Rip1), 
                                                  -- 2(Rip2B(Broadcast)), 
                                                  -- 3(Rip2M(Multicast))

    AuthenticationType		  integer	NOT NULL, -- 0(No), 1(Yes)
	FirstKeyId			      integer	NULL,     -- MD5 first Key ID		
	FirstAuthenticationKeyId  text 		NULL,	  -- Password
	FirstKeyFrom			  text		NULL,	  -- Starting Date		
	FirstKeyTo			      text		NULL,	  -- Ending Date
	SecondKeyId			      integer	NULL,     -- MD5 second Key ID		
	SecondAuthenticationKeyId text 		NULL,     -- Password
	SecondKeyFrom			  text		NULL,	  -- Starting Date	
	SecondKeyTo			      text		NULL	  -- Ending Date
)
;


insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "Rip", 0, 1, 1, 1);
insert into stringsMap values ("RIP_CONFIG_FAILED","RIP Configuration Failed");	
insert into tableDefaults values ("RIP", "Direction", "0", "", "");
insert into tableDefaults values ("RIP", "Version", "0", "", "");
insert into tableDefaults values ("RIP", "AuthenticationType", "0", "", "");
CREATE TABLE dhcpv6c
    (
    LogicalIfName          text  NOT NULL   , -- interface on which to run
    isEnabled                     integer   , -- is enabled  
    statelessMode                 integer   , -- 1 = stateless mode 
    requestPreferredAddress       integer   , -- 
    preferredAddress              text      , -- IPv6 addres
    preferredAddressPrefixLength  integer   , -- IPv6 prefix length  
    requestDNS                    integer   , -- request DNS  
    requestDNSSearchList          integer   , -- request DNS Search List
    prefixDelegation              integer   , -- prefix delegation  
    requestPreferredPrefix        integer   , -- 1 = request Preferred Prefix 
    preferredPrefix               text      , -- IPv6 addres
    preferredPrefixPrefixLength   integer   , -- IPv6 prefix length      
    renewTime                     integer   , -- leaseTime
    sendRapidCommit               integer   , -- rapid commit  
    PRIMARY KEY (LogicalIfName)             , -- primary key
    FOREIGN KEY (LogicalIfName) REFERENCES networkInterface (LogicalIfName)
    );

CREATE TABLE dhcpv6s
    (
    LogicalIfName     text  NOT NULL        ,--  Logical Interface name   
    isEnabled           integer             ,--  DHCPv6 server enabled   
    statelessMode       integer             ,--  stateless/stateful mode   
    serverPreference    integer             ,--  server preference
    domainName          text                ,--  domain name   
    useDNSServersFrom   integer             ,--  use DNS servers from
    primaryDNSServer    text                ,--  primary DNS server
    secondaryDNSServer  text                ,--  secondary DNS server
    leaseTime           integer             ,--  lease time.   
    prefixDelegation    boolean             ,--  enable prefix Delegation 
    PRIMARY KEY (LogicalIfName)             ,-- primary key
    FOREIGN KEY (LogicalIfName) REFERENCES networkInterface (LogicalIfName)
    );

CREATE TABLE dhcpv6sLANAddrPool
    (
    startAddress        text        ,    --  Address Pool start address
    endAddress          text        ,    --  Address Pool end address   
    prefixLength        integer     ,    --  prefix length   
    delegateEnabled     integer     ,    --  prefix delegation enabled   
    delegationPrefix    text        ,    --  prefix to be delegated   
    delegationPrefixLen integer     ,    --  delegation Prefix length
    interfaceName       text NOT NULL,   --  interface for the added prefix  
    PRIMARY KEY (startAddress,endAddress)  
    );

CREATE TABLE dhcpv6sLANPrefixPool
    (
    delegationPrefix    text  NOT NULL      ,--prefix address 
    delegationPrefixLen text  NOT NULL      ,--prefix length
    interfaceName       text  NOT NULL      ,--interface for the prefix 
    PRIMARY KEY (delegationPrefix)
    );

insert into tableDefaults values ("dhcpv6s", "LogicalIfName", "LAN", "", "");
insert into tableDefaults values ("dhcpv6sLANAddrPool", "interfaceName", "LAN", "", "");
insert into tableDefaults values ("dhcpv6sLANPrefixPool", "interfaceName", "LAN", "", "");
insert into stringsMap values ("IPV6_LAN_CONFIG_FAILED", "IPV6 Lan Configuration Failed");    
insert into stringsMap values ("IPV6_LAN_POOL_DELETE_SUCCESS", "IPV6 Lan Pool(s) Deleted Successfully");
insert into stringsMap values ("IPV6_LAN_POOL_DELETE_FAILED", "IPV6 Lan Pool(s) Deletion Failed");
insert into stringsMap values ("IPV6_LAN_POOL_CONFIG_FAILED", "IPV6 Lan Pool Configuration Failed");    
insert into stringsMap values ("IPV6_LAN_PREFIX_DELETE_SUCCESS", "IPV6 Lan Prefix(es) Deleted Successfully");
insert into stringsMap values ("IPV6_LAN_PREFIX_DELETE_FAILED", "IPV6 Lan Prefix(es) Deletion Failed");
insert into stringsMap values ("IPV6_LAN_PREFIX_CONFIG_FAILED", "IPV6 Lan Prefix Configuration Failed");
-- dhcp relay schema

CREATE TABLE DhcpRelay
(
LogicalIfName   text     NOT NULL, -- interface names like 'LAN',
virtualIfName   text     NOT NULL,
DhcpRelayStatus boolean NOT NULL, -- Status - 1(Enable), 0 - Diable
RelayGateway    text NOT NULL,    -- Relay gateway ip address
PRIMARY KEY     (LogicalIfName),
FOREIGN KEY (LogicalIfName) REFERENCES networkInterface (LogicalIfName)
FOREIGN KEY (VirtualIfName) REFERENCES networkInterface (VirtualIfName)
);

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 1, 1, "DhcpRelay", 0, 1, 1, 0);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL", 1, 1, "DhcpRelay", 0, 1, 1, 0);
CREATE TABLE upnp
(
        upnpEnable boolean NOT NULL,
        advPeriod integer ,
        advTimeToLive integer,
        interfaceName text NOT NULL
)
;
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"upnp", 0, 1,1,1);
insert into tableDefaults values ("upnp","upnpEnable","0","0","1");
CREATE TABLE upnpPortMap
(
        active text ,
        protocol text ,
        intPort integer ,
        extPort integer ,
        ipAddr text
)
;
CREATE TABLE upnpListenPort
(
        listenPort integer NOT NULL
)
;
-- SQL table for PPPoE back-end component.

-- Pppoe table
CREATE TABLE Pppoe
    (
    OID                      integer,           -- OID
    LogicalIfName            text     NOT NULL, -- interface names like 'lan1', 'wan2', etc.
    IspName                  integer,           -- name of the service provider
    UserName                 text     NOT NULL, -- user name
    Password                 text     NOT NULL, -- password
    AccountName              text,              -- account name used in PPPoE
    DomainName               text,              -- domain name used in PPPoE
    GetIpFromIsp             boolean  NOT NULL, -- will ISP give IP ?
    GetDnsFromIsp            boolean  NOT NULL, -- do we need DNS from ISP ?
    StaticIp                 text,              -- ip which we want to assign or negotiate
    NetMask                  text,              -- net mask for the above IP
    PrimaryDns               text,              -- if we want to specify our DNS
    SecondaryDns             text,              -- if we want to specify our DNS
    IdleTimeOutFlag          boolean  NOT NULL, -- do we require idle timeout ?
    IdleTimeOutValue         integer  NOT NULL, -- idle timeout value
    ProfileName                 text,    
    -- add your new entries here

    PRIMARY KEY (LogicalIfName),                -- primary key
    FOREIGN KEY (ProfileName) REFERENCES PppoeProfile (ProfileName),
    FOREIGN KEY (LogicalIfName) REFERENCES networkInterface (LogicalIfName)
    );


CREATE TABLE PppoeProfile
    (
    LogicalIfName            text     NOT NULL, -- interface names like 'lan1',    'wan2', etc.
    ProfileName              text     NOT NULL, -- Name of the profile
    Status                   boolean  NOT NULL, -- enable/disable the profile.
    AuthOpt                  integer  NOT NULL, -- can be NO-AUTH,PAP,CHAP,MS-CHAP,MS-CHAPV2    
    UserName                 text     NOT NULL, -- user name
    Password                 text     NOT NULL, -- password
    Service                  text,              -- service
    IdleTimeOutFlag          boolean  NOT NULL, -- do we require idle timeout ?
    IdleTimeOutValue         integer,           -- idle timeout value
    GetIpFromIsp             boolean  NOT NULL,
    StaticIp                 text,              -- ip which we want to assign or negotiate
    NetMask                  text,              -- net mask for the above IP
    GetDnsFromIsp            boolean  NOT NULL,
    PrimaryDns               text,
    SecondaryDns             text,
    -- add your new entries here

    PRIMARY KEY (ProfileName, LogicalIfName)    -- primary key
    );

-- Pppoe6 table
CREATE TABLE Pppoe6
    (
    LogicalIfName            text     NOT NULL, -- interface names like 'lan1', 'wan2', etc.
    UserName                 text     NOT NULL, -- user name
    Password                 text     NOT NULL, -- password
    AuthOpt                  integer  NOT NULL, -- can be NO-AUTH,PAP,CHAP,MS-CHAP,MS-CHAPV2
    Dhcpv6Opt                integer  NOT NULL,  
    PrimaryDns               text,
    SecondaryDns             text,  
    PppoeSessions            integer  NOT NULL, -- can be 1 for separate session , 2 for common session
    -- add your new entries here

    PRIMARY KEY (LogicalIfName)                 -- primary key
    );

CREATE TABLE DualPppoe                          -- for dual access pppoe
    (
    LogicalIfName            text     NOT NULL, -- interface names like 'lan1',    'wan2', etc.
    Status                   boolean  NOT NULL, -- enable/disable the profile.
    AuthOpt                  integer  NOT NULL, -- can be NO-AUTH,PAP,CHAP,MS-CHAP,MS-CHAPV2    
    UserName                 text     NOT NULL, -- user name
    Password                 text     NOT NULL, -- password
    Service                  text,              -- service
    IdleTimeOutFlag          boolean  NOT NULL, -- do we require idle timeout ?
    IdleTimeOutValue         integer,           -- idle timeout value
    GetIpFromIsp             boolean  NOT NULL,
    StaticIp                 text,              -- ip which we want to assign or negotiate
    NetMask                  text,              -- net mask for the above IP
    GetDnsFromIsp            boolean  NOT NULL,
    PrimaryDns               text,
    SecondaryDns             text,
    GetIpFromIspPhy          boolean  NOT NULL, -- Static/Dynamic for physical interface
    StaticIpPhy              text,              -- ip which we want to assign or negotiate
    NetMaskPhy               text,              -- net mask for the above IP
    GatewayPhy               text,              -- gateway for the above IP
    GetDnsFromIspPhy         boolean  NOT NULL,
    PrimaryDnsPhy            text,
    SecondaryDnsPhy          text,
    -- add your new entries here

    PRIMARY KEY (LogicalIfName)    -- primary key
    );

-- table defaults
insert into tableDefaults values ("Pppoe", "LogicalIfName", "wan1", "", "");
insert into tableDefaults values ("Pppoe", "UseDefaultMtu", "0", "0", "1");
insert into tableDefaults values ("Pppoe", "MtuSize", "1492", "10", "1492");
insert into tableDefaults values ("Pppoe", "IdleTimeOutFlag", "0", "0", "1");
insert into tableDefaults values ("Pppoe", "IdleTimeOutValue", "5", "5", "999");
insert into tableDefaults values ("PppoeProfile", "LogicalIfName", "WAN1", "", "");
insert into tableDefaults values ("PppoeProfile", "GetIpFromIsp", "1", "0", "1");
insert into tableDefaults values ("PppoeProfile", "GetDnsFromIsp", "1", "0", "1");

insert into stringsMap values ("PPPOE_PROFILE_CONFIG_FAILED", "PPPoE Profile Configuration Failed");
insert into stringsMap values ("PPPOE_PROFILES_LIMIT_ERROR", "Can not add new profile. PPPoE Profiles max limit reached");
insert into stringsMap values ("PROFILE_NAME_ALREADY_EXIST", "Profile name already exists");
insert into stringsMap values ("SELECT_PPPOE", "Configure WAN in PPPoE Mode");
insert into stringsMap values ("ENABLE_OP_FAILED", "PPPoE Profile Enabling Failed");
insert into stringsMap values ("DISABLE_OP_FAILED", "PPPoE Profile Disabling Failed");
insert into stringsMap values ("DISABLE_SELECTED_PROFILE_BEFORE_DELETE", "Disable PPPoE profile before delete");
insert into stringsMap values ("PROF_DELETE_FAILED", "PPPoE Profile Delete Failed");

CREATE TABLE Igmp
(
OID         integer,
IgmpEnable  integer NOT NULL,
igmpLogicalIfName text NOT NULL,
upstreamInterfaceWAN1 text NOT NULL,
upstreamInterfaceWAN2 text NOT NULL
);

CREATE TABLE allowedNets 
( 
networkAddr text NOT NULL, 
maskLength integer NOT NULL 
);


CREATE TABLE igmpPortMap 
( 
vlanId integer NOT NULL,  -- VLAN ID  
igmpPortMap text NOT NULL -- associated port map with VLAN ID to support snooping  
);
CREATE TABLE igmpSnooping 
( 
status integer NOT NULL  -- igmp snooping status 
);


insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",0,1,"Igmp", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",0,1,"igmpPortMap", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",0,1,"igmpSnooping", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",0,1,"allowedNets", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"Igmp", 0, 1,1,1);
insert into tableDefaults values ("igmpSnooping","status","0","0","1");
insert into tableDefaults values ("Igmp","IgmpEnable","0","0","1");
insert into tableDefaults values ("Igmp","upstreamInterfaceWAN1","0","0","2");
insert into tableDefaults values ("Igmp","upstreamInterfaceWAN2","0","0","2");
insert into tableDefaults values ("Igmp","igmpLogicalIfName","LAN","0","1");
insert into stringsMap values ("IGMP_CONFIG_FAILED", "IGMP Proxy Configuration Failed");
insert into stringsMap values ("IGMP_NETWORK_DELETE_FAILED", "IGMP Allowed Networks delete failed");
insert into stringsMap values ("ALLOWED_NETWORK_CONFIG_FAILED", "Allowed Netwroks configuration failed"); 
-- SQL table for PPTP back-end component.

-- Pptp table
CREATE TABLE Pptp
    (
    OID                      integer,           -- OID
    LogicalIfName            text     NOT NULL, -- interface names like 'lan1', 'wan2', etc.
    IspName                  integer,           -- name of the service provider
    UserName                 text     NOT NULL, -- user name
    Password                 text     NOT NULL, -- password
    GetIpFromIsp             boolean  NOT NULL, -- will ISP give IP ?
    GetDnsFromIsp            boolean  NOT NULL, -- do we need DNS from ISP ?
    MyIp                     text,              -- local IP of the wan interface
    ServerIp                 text     NOT NULL, -- PPTP server's IP
    StaticIp                 text,              -- ip which we want to assign or negotiate
    NetMask                  text,              -- net mask for the above IP
    Gateway                  text,              -- Gateway to reach the PPTP Server
    PrimaryDns               text,              -- if we want to specify our DNS
    SecondaryDns             text,              -- if we want to specify our DNS
    IdleTimeOutFlag          boolean  NOT NULL, -- do we require idle timeout ?
    IdleTimeOutValue         integer  NOT NULL, -- idle timeout value
    MppeEncryptSupport       boolean  NOT NULL, -- Mppe encryption support
    SplitTunnel              boolean  NOT NULL, -- Split tunnel option
    DualAccess               boolean  NOT NULL, -- PPTP or Dual Access PPTP
    StaticDNS                text     NOT NULL, -- PPTP DNS Static IP
    -- add your new entries here

    PRIMARY KEY (LogicalIfName),                -- primary key
    FOREIGN KEY (LogicalIfName) REFERENCES networkInterface (LogicalIfName)
    );


-- SQL table for pptp vpn client back-end component.

-- pptpClient table
CREATE TABLE pptpClient
(
    OID                 	integer,             -- OID
    pptpClientEnable   		boolean    NOT NULL, -- enable/disable pptp vpn client
    ServerIp        		text       NOT NULL, -- PPTP server's IP
    RemoteNetwork       	text       NOT NULL, -- Network Address of network remote to pptp vpn client
    RemoteNetmask        	integer    NOT NULL, -- Subnet Mask of network remote to pptp vpn client
    UserName      		    text       NOT NULL, -- username allocated to client
    Password       		    text       NOT NULL, -- password allocated to client
    MppeEncryptionEnable	boolean	   NOT NULL, -- to enable mppe encryption
    IdleTimeOut      		integer    NOT NULL, -- time out value
    ClientIp                text        
    -- add your new entries here	
); 


-- SQL table for pptp vpn client connection status.

-- pptpClientConnectionStatus table
CREATE TABLE pptpClientConnectionStatus
(
    OID                     integer,              -- OID  
    connectionStatus        integer     NOT NULL, -- show status of connection
    actionStatus            boolean     NOT NULL, -- action allowed or not
    action                  boolean     NOT NULL  -- action (connect/drop)
    -- add your new entries here	
);

--SQL table for auto-dial Vpn

CREATE TABLE autodialpptpvpn
(
    OID                    integer,               --OID
    action                 boolean     NOT NULL,  --Enable or disable 
    time                   integer     NOT NULL  --time
);

insert into tableDefaults values ("autodialpptpvpn","time","2","","");

insert into tableDefaults values ("autodialpptpvpn","action","0","","");

insert into tableDefaults values ("Pptp","StaticDNS","0.0.0.0","","");

insert into saveTables (tableName) values("autodialpptpvpn");

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,0,"autodialpptpvpn",0,1,1,1);

insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/pptpClientConfig",0,0,"autodialpptpvpn", 0, 1,1,1);


-- Modification History
--
-- 01b,14oct11,nis  added new columns to 'pptpServerIPRange' for IPv6 support
--                  and new table 'pppV6Interfaces' to keep track of current
--                  ipv6 enabled ppp interfaces.    
-- 01a,15feb11,adi  included new columns for configurable pptp server.

-- SQL table for PPTP server back-end component.

CREATE TABLE pptpServerIPRange
    (
    pptpdEnable boolean NOT NULL, --0 for disabling pptp server with v4
                                  --capability only and 1 for enabling
    pptpd6Enable boolean NOT NULL, --0 for disabling pptp server with v6
                                   --(and ipv4) capability and 1 for enabling
    pptpRoutingMode boolean NOT NULL, -- 0 for classical , 1 for Nat
    startIPAddress  text,  --The start ip address of the range
    endIPAddress text, --The end ip address of the range that is
                                 --allocated for remote users
    AuthenticationType boolean NOT NULL, -- 0 for Local User Database and 1 for External RADIUS Server
    pptpdIpv6Prefix text, --IPv6 Prefix that is to be assigned to the client
    PapEnable boolean NOT NULL, --0 for disabling pap authenticatication and 1  for enabling
    ChapEnable boolean NOT NULL, --0 for disabling chap authenticatication and 1 for enabling
    MSChapEnable boolean NOT NULL, --0 for disabling mschap authenticatication and 1 for enabling
    MSChapv2Enable boolean NOT NULL, --0 for disabling mschapv2 authenticatication and 1 for enabling
    Mppe40Enable boolean NOT NULL, --0 for disabling mppe 40bit encryption and 1 for enabling
    Mppe128Enable boolean NOT NULL, --0 for disabling mppe 128bit encryption and 1 for enabling
    MppeStatefullEnable boolean NOT NULL, --0 for disabling mppe stetaful encryption 1 for enabling
    UserTimeOut integer NOT NULL, --idle timeout after which the user is disconnected
    netbiosEnable boolean NOT NULL, --0 for disabling Netbios Name Resolution and 1 for enabling
    primWinsServerIp text, --IP address of Primary WINS Server
    secWinsServerIp text --IP address of Secondary WINS Server
    );

CREATE TABLE pptpServerUsers
    (
    userName text NOT NULL,
    remoteIP text,
    pptpIP text
    );

CREATE TABLE pppV6Interfaces 
    (
    ifName integer, -- ppp interface suffix 
    linkLocalIp text, -- Local LL Address of ppp link; It will be required when
                      -- the interface goes down and we have to remove associated entry 
    pptpdIpv6Prefix text --IPv6 Prefix that is to be assigned to the client    
    );

-- By default users added are 'enabled'. So adding a default entry.
insert into tableDefaults values ("pptpServerUsers", "enableConnection", "1", "0", "1");
insert into tableDefaults values ("pptpServerIPRange", "pptpRoutingMode", "1", "0", "1");
insert into tableDefaults values ("pptpServerIPRange", "pptpdEnable", "0", "0", "1");
insert into tableDefaults values ("pptpServerIPRange", "pptpd6Enable", "0", "0", "1");
insert into tableDefaults values ("pptpServerIPRange", "AuthenticationType", "0", "0", "1");

-- By default netbios will be disabled. So adding a default entry of '0'.
insert into tableDefaults values ("pptpServerIPRange", "netbiosEnable", "0", "0", "1");
-- Modification History
-- 01b,14oct11,nis  added new columns to 'Xl2tpServerIPRange' for IPv6 support
-- 01a,15feb11,adi  included new columns for configurable l2tp server. 

-- SQL table for L2TP server back-end component.

CREATE TABLE Xl2tpServerIPRange
    (
    Xl2tpdEnable   Boolean NOT NULL, --0 for disabling l2tp server with v4
                                  --capability only and 1 for enabling
    Xl2tpd6Enable boolean NOT NULL, -- 0 for disabling l2tp server with v6
                                   --(and ipv4) capability and 1 for enabling
    l2tpRoutingMode boolean NOT NULL, --0 for classical ,1 for nat
    StartIPAddress Text,             -- The start ip address of the range
    EndIPAddress   Text,             -- The end ip address of the range that is allocated for remote users
    Xl2tpdIpv6Prefix text, --IPv6 Prefix that is to be assigned to the client
    AuthenticationType boolean NOT NULL, --0 for Local and 1 for External RADIUS
    PapEnable boolean NOT NULL, --0 for disabling pap authenticatication and 1  for enabling
    ChapEnable boolean NOT NULL, --0 for disabling chap authenticatication and 1 for enabling
    MSChapEnable boolean NOT NULL, --0 for disabling mschap authenticatication and 1 for enabling
    MSChapv2Enable boolean NOT NULL, --0 for disabling mschapv2 authenticatication and 1 for enabling
    l2tpSecretKeyEnable boolean NULL,-- 0 default
    secretKey Text, -- Secret key 
    UserTimeOut boolean NOT NULL --idle timeout after which the user is disconnected
    );

CREATE TABLE Xl2tpActiveUsers
    (
    userName text NOT NULL,    
    RemoteIP         Text,
    Xl2tpIP          Text 
    );

-- By default users added are 'enabled'. So adding a default entry.          
INSERT INTO tableDefaults VALUES ("Xl2tpActiveUsers", "EnableConnection", "1", "0", "1");
INSERT INTO tableDefaults VALUES ("Xl2tpServerIPRange", "l2tpRoutingMode", "1", "0", "1");
INSERT INTO tableDefaults VALUES ("Xl2tpServerIPRange", "l2tpSecretKeyEnable", "0", "0", "1");
INSERT INTO tableDefaults VALUES ("Xl2tpServerIPRange", "AuthenticationType", "0", "0", "1");
CREATE TABLE teredoTunnel
    (
    tunnelStatus            integer NOT NULL,    -- enabled or disabled    
    serverName              text NOT NULL,       -- teredo server name 
    secodndaryServerName    text                 -- teredo secondary server name
    );
insert into tableDefaults values ("teredoTunnel", "tunnelStatus", "0", "", "");
insert into tableDefaults values ("teredoTunnel", "serverName", "teredo.ipv6.microsoft.com", "", "");
insert into tableDefaults values ("teredoTunnel", "secodndaryServerName", "teredo.remlab.net", "", "");
insert into dbUpdateRegisterTbl values("UMI_COMP_PLATFORM",1,1,"teredoTunnel", 0, 1,1,0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/teredoConfig",0,1,"teredoTunnel", 0, 1,1,0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/teredoConfig",0,1,"networkInterface", 0, 1,1,0);

CREATE table smtpServer
(
    entryName    text,
    emailServer  text,
    smtpPort     text,
    tlsSupport   boolean NOT NULL,
    fromAddr     text,
    toAddr       text,
    toAddr2       text,
    toAddr3       text,
    auth         integer,
    userName     text,
    passWord     text,
    respondIdentd   integer,
    PRIMARY KEY (entryName)
);

insert into tableDefaults values ("smtpServer","smtpPort","25","1","65536");
insert into tableDefaults values ("smtpServer","tlsSupport","0","0","1");


CREATE TABLE route
(
-- routeName       text NOT NULL,
routeName       text ,
dstIpAddr       text NOT NULL,
ipSNetMask      text,
gwIpAddr        text NOT NULL,
-- interfaceName   text NOT NULL,
interfaceName   text ,
metric          integer NOT NULL,
active          boolean NOT NULL,
private         boolean
-- _ROWID_         integer NOT NULL,
-- UNIQUE      (_ROWID_)
);


CREATE TABLE route6
(
routeName text NOT NULL,
dstIpAddr text NOT NULL,
prefix text,
gwIpAddr text NOT NULL,
interfaceName text NOT NULL,
metric integer NOT NULL,
active boolean NOT NULL,
PRIMARY KEY (routeName)
);

insert into tableDefaults values ("route","private","0","","");
-- Tables used in TeamF1's Network Interface Management (NIM) Framework 1.0

-- NimfConf - this table stores the nimf related helper parameters.

-- Note: This table holds parameters which are necessary for NIM Framework and
-- are generic enough to handle all the connection types. The connection type 
-- specific configuration will go into their respective connType.sql files.

create table NimfConf
    (
    OID                      integer,           -- OID
    LogicalIfName            text     NOT NULL, -- interface names like 'lan1', 'wan2', etc.
    AddressFamily            integer  NOT NULL, -- address family 
    RequireLogin             boolean  NOT NULL, -- specifies, if ISP requires login
    ConnectionType           text             , -- connection type like dhcp,pppoe
    ConnectionType6          text             , -- connection type like dhcp,pppoe for IPv6
    IfStatus                 integer  NOT NULL, -- nimf status like enable(1)/disable(0)
    UseDefaultMtu            boolean  NOT NULL, -- if we want to use default MTU
    MtuSize                  integer  NOT NULL, -- MTU size
    PortSpeed                integer  NOT NULL, -- port speed of a wan interface
    SetMacAddress            integer  NOT NULL, -- mac address options
    MacAddress               text,              -- mac address
    vlanTagEnable            boolean  NOT NULL, -- vlan tagging status
    vlanId                   integer  NOT NULL, -- vlan tag value
    PRIMARY KEY (LogicalIfName, AddressFamily), -- primary key
    FOREIGN KEY (LogicalIfName) REFERENCES networkInterface (LogicalIfName)
    );

insert into dbUpdateRegisterTbl values ("UMI_COMP_NIMF", 0, 0, "NimfConf", 0, 1, 1, 1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_NIMF", 0, 0, "NimfStatus", 0, 1, 1, 1);
insert into stringsMap values ("IPV6WAN_CONFIG_FAILED", "IPV6 WAN Configuration Failed");

insert into tableDefaults values ("NimfConf","vlanTagEnable","0","0","1");
insert into tableDefaults values ("NimfConf","vlanId","0","0","4095");

-- WanMode - table for storing WAN mode configuration.
create table WanMode
    (
    OID                      integer,           -- OID
    Wanmode                  integer  NOT NULL, -- wan mode (dedicated, autorollover or load balancing)
    AddressFamily            integer  NOT NULL, -- address family
    DedicatedLogicalIfName   text     NOT NULL, -- nimf id of dedicated WAN
    FailoverPriLogicalIfName text     NOT NULL, -- from where to fail over
    FailoverSecLogicalIfName text     NOT NULL, -- where to fail over
    FailureDetectionMeth     integer  NOT NULL, -- detection method
    RetryTime                integer  NOT NULL, -- time to retry
    RetryAttempts            integer  NOT NULL, -- number of attempts to retry
    LoadTolerance            integer  DEFAULT 80,           -- load tolerance value
    MaxBandwidth             integer  DEFAULT 8192,          -- maximum bandwidth value
    Unit                     integer  DEFAULT 0,   -- unit to measure bandwidth. 0 - bps 1 - Kbps 2 - Mbps
    -- add newer entries here

    FOREIGN KEY (DedicatedLogicalIfName) REFERENCES networkInterface (LogicalIfName),
    FOREIGN KEY (FailoverPriLogicalIfName) REFERENCES networkInterface (LogicalIfName),
    FOREIGN KEY (FailoverSecLogicalIfName) REFERENCES networkInterface (LogicalIfName)
    );

insert into dbUpdateRegisterTbl values ("UMI_COMP_NIMF", 0, 0, "WanMode", 0, 1, 0, 1);

-- WanFailure - table for storing IPs for failure detection.
create table WanFailure
    (
    OID                      integer,           -- OID
    LogicalIfName            text     NOT NULL, -- interface names like 'lan', 'wan2', etc.
    AddressFamily            integer  NOT NULL, -- address family
    PingIp                   text,              -- IP which is a ping destination
    DnsIp                    text,              -- IP which is used for DNS lookup
    -- add newer entries here

    PRIMARY KEY (LogicalIfName, AddressFamily), -- primary key
    FOREIGN KEY (LogicalIfName) REFERENCES networkInterface (LogicalIfName)
    );

insert into dbUpdateRegisterTbl values ("UMI_COMP_NIMF", 0, 0, "WanFailure", 0, 1, 0, 1);

-- NimfStatus - table for storing different status's of NIMF.
create table NimfStatus
    (
    OID                      integer,           -- OID
    LogicalIfName            text     NOT NULL, -- interface names like 'lan', 'wan2', etc.
    AddressFamily            integer  NOT NULL, -- address family
    Nimfstatus               text     NOT NULL, -- wan status like connected, disconnected, connecting etc. 
    -- add newer entries here
    WanUpTime                text     NOT NULL,
    Linkstatus               text     NOT NULL, --Link status like LINK UP or LINK DOWN.  

    PRIMARY KEY (LogicalIfName, AddressFamily), -- primary key
    FOREIGN KEY (LogicalIfName) REFERENCES networkInterface (LogicalIfName)
    );

-- NimfTrigger - table for triggering NIMF
create table NimfTrigger
    (
    OID                      integer,           -- OID
    LogicalIfName            text     NOT NULL, -- logical interface name 
    AddressFamily            integer  NOT NULL, -- address family    
    Status                   boolean,           -- trigger field
    PRIMARY KEY (LogicalIfName, AddressFamily), -- primary key
    FOREIGN KEY (LogicalIfName) REFERENCES networkInterface (LogicalIfName)
    );
-- MacTable - table for MAC refresh
create table MacTable
    (
    LogicalIfName            text     NOT NULL, -- logical interface name 
    Flag                     integer  NOT NULL, 
    PRIMARY KEY (LogicalIfName),                -- primary key
    FOREIGN KEY (LogicalIfName) REFERENCES networkInterface (LogicalIfName)
    );

-- NimfMtu - table for storing solution specific interface MTU values.
-- This MTU will be set on interface by NIMF. For PPP connection types we will
-- negotiate MTU in the backend connection type components.
create table NimfMtu
    (
    LogicalIfName            text     NOT NULL, -- logical interface name
    DefMtu                   integer  NOT NULL, -- default Mtu 
    MinMtu                   integer  NOT NULL, -- Minimum Mtu 
    MaxMtu                   integer  NOT NULL, -- Maximum Mtu
    PRIMARY KEY (LogicalIfName) -- primary key
    );

create table NimfMac
    (
    LogicalIfName            text     NOT NULL, -- logical interface name
    macAddress               text,              -- mac address
    PRIMARY KEY (LogicalIfName) -- primary key
    );

create table NimfLBStatus
     (
     OID                     integer,            -- OID
     wanStatus               integer    NOT NULL -- wanStatus 
     );

create table NimfAFStatus
     (
     OID                     integer,            -- OID
     wanStatus               integer    NOT NULL -- wanStatus 
     );

create table WanIfNameMap
     (
     OID                     integer,            -- OID
     LogicalIfName           text    NOT NULL, -- wan LogicalIfName WAN1.WAN2
     InterfaceName           text    NOT NULL,  -- wan Interface Names bdgWAN1/2,eth1/2
     VlanPortMode            integer NOT NULL  
     );

-- strings mappings
insert into stringsMap values ("NIMF_CONFIG_NOTFOUND","Internet Configuration Not Found");
insert into stringsMap values ("NIMF_CONFIG_FAILED","Internet Configuration Failed");
insert into stringsMap values ("IDLE_TIMEOUT_ERROR","Please Remove the idle timeout option for Dedicated/Secondary WAN");
insert into stringsMap values ("LOAD_BALANCE_ERROR","PPPOE profile selected has idle time configured whereas WAN is set in Load Balancing mode");
insert into ifDevEventTbl values ("ppp1", "UMI_COMP_NIMF", "NULL", 1, 1, 0, 0, 0, 0, 1);
insert into ifDevEventTbl values ("ppp2", "UMI_COMP_NIMF", "NULL", 1, 1, 0, 0, 0, 0, 1);
insert into ifDevEventTbl values ("ppp3", "UMI_COMP_NIMF", "NULL", 1, 1, 0, 0, 0, 0, 1);
insert into ifDevEventTbl values ("ppp101", "UMI_COMP_NIMF", "NULL", 1, 1, 0, 0, 0, 0, 1);
insert into ifDevEventTbl values ("ppp201", "UMI_COMP_NIMF", "NULL", 1, 1, 0, 0, 0, 0, 1);
insert into ifDevEventTbl values ("ppp99", "UMI_COMP_NIMF", "NULL", 1, 1, 0, 0, 0, 0, 1);
insert into ifDevEventTbl values ("ppp98", "UMI_COMP_NIMF", "NULL", 1, 1, 0, 0, 0, 0, 1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_NIMF", 0, 0, "NimfTrigger", 0, 1, 0, 0);
-- We dont register the WanIfNameMap table with the nimf conf
-- insert into dbUpdateRegisterTbl values ("UMI_COMP_NIMF", 0, 0, "WanIfNameMap", 0, 1, 1, 0);
insert into stringsMap values ("MULTICAST_MAC_ERROR","MAC Address configured is a Multicast MAC address");
insert into stringsMap values ("PPTP_L2TP_MYIP_FAILED","MY IP Address is already configured.");

insert into tableDefaults values ("WanMode","LoadTolerance","80","20","80");
insert into tableDefaults values ("WanMode","MaxBandwidth","8192","512","8192");
insert into tableDefaults values ("WanMode","Unit","0","0","2");
-- Modification History
-- 
-- 01a,01may12,bhj Fixed 31424 - POP authentication support for SSLVPN
--
-- Domains Table
--
-- SPECS :
--
--  1. 'AuthenticationType', decides which Fields other than DomainName and
--      PortalLayoutName, should get disabled or enabled in the Add/Edit pages
--      of Domain configuration. In other words, Only related fields of 
--      'AuthenticationType' should be Enabled. 
--     Please refer platform1.0's add domain page.
--
--  2. 'AuthenticationType' Mapping : 
--      RULES:
--           For DropDown Entry,
--                             [GUI]   : [values needed by Backend]
--           case local User Database  : set value as "local";
--           case Radius-PAP           : set value as "radius_pap";
--           case Radius-CHAP          : set value as "radius_chap";
--           case Radius-MSCHAP        : set value as "radius_mschap";
--           case Radius-MACHAPv2      : set value as "radius_mschapv2";
--           case NT Domain            : set value as "ntdomain";
--           case Active Directory     : set value as "active-directory";
--           case LDAP                 : set value as "ldap";			
--    To avoid any Confusion we can display in the DropDown List of
--    Authentication Type, the same values what we set for 'AuthenticationType'. 
--
--  3. 'DefaultDomain' is a flag to indicate that Domain is system generated.  
--      It is used as hidden key to mark(*) in GUI as Default Domain.
--      'DefaultDomain' takes values 0 (not a default), 1 (default Domain).
--      Default Domains Cannot be deleted.
--
--  4. A Domain Should not be deleted if Users are Configured for it.
--      Error = "Domain cannot be deleted if Users are Configured for it." should be thrown.
-- 
--  5. when a Domain is created, its corresponding Default group(group with the same name as that of Domain)
--      should also be created in the GroupTable and the DefaultGroup flag should be set to 1 for that Group.
-- 
--  6. Domain Should NOT be Deleted if its portal is a Default Portal(ie when DefaultPortal == 1 or 2)
--      Error: "Domain Cannot if its portal is set as Default".
--     For a Domain, 'DefaultPortal' value  of its portal can be obtained using 
--      portalLayoutName reference to PortalLayoutTable. 
--          

CREATE TABLE USERDBDomains
(
    OID                                           integer   NULL,
    GroupId			                  integer   NULL,   -- Id of the group,
    DomainName                        text      NOT NULL,
    PortalLayoutName                  text      NULL,   -- Portal for the group
    AuthenticationType		          text	    NOT NULL,   -- Authentication type.
    AuthProfile                           text      NULL,  -- Profile used for authentication
    AuthenticationServer	          text	    NULL,   -- Authenticating server address.
    SecondAuthenticationServer	      text	    NULL,   -- Authenticating server address.
    ThirdAuthenticationServer	      text	    NULL,   -- Authenticating server address 3.
    TimeOut			                  integer   NULL,   -- Timeout
    Retries			                  integer   NULL,   -- Number of retries
    AuthenticationRadiusSecret	      text	    NULL,   -- Radius secret.
    SecondAuthenticationRadiusSecret  text      NULL,   -- Radius secret.
    ThirdAuthenticationRadiusSecret   text      NULL,   -- Radius secret.
    AuthenticationPort                integer   DEFAULT 0,   -- Port of primary authentication server
    SecondAuthenticationPort          integer   DEFAULT 0,   -- Port of secondary authentication server
    ThirdAuthenticationPort           integer   DEFAULT 0,   -- Port of third authentication server
    NTDomainWorkGroup                 text      NULL,   -- Work Group for NT Domain.
    NTDomainSecondWorkGroup           text	    NULL,   -- For NT Domain
    ThirdNTDomainWorkGroup            text	    NULL,   -- For NT Domain
    LDAPBaseDN			              text	    NULL,   -- For LDAP Authentication
    SecondLDAPBaseDN		          text	    NULL,    -- For LDAP Authentication
    ThirdLDAPBaseDN		          text	    NULL,    -- For LDAP Authentication
    ActiveDirectoryDomain	          text	    NULL,   -- For Active Directory Authentication
    SecondActiveDirectoryDomain	      text	    NULL,   -- For Active Directory Authentication
    ThirdActiveDirectoryDomain	      text	    NULL,   -- For Active Directory Authentication
    SSLEnable                         boolean   NULL,   -- SSL for POP authentication
    CAFile                   	      text	    NULL,   -- CA File used for POP Authentication
    SecondSSLEnable                         boolean   NULL,   -- SSL for POP authentication
    SecondCAFile                   	      text	    NULL,   -- CA File used for POP Authentication
    ThirdSSLEnable                         boolean   NULL,   -- SSL for POP authentication
    ThirdCAFile                   	      text	    NULL,   -- CA File used for POP Authentication
    DefaultDomain                     boolean   NULL,   --  Flag to indicate that the Group is a Domain Generated Group.
    PRIMARY KEY (DomainName)
)
;

insert into tableDefaults values ("USERDBDomains", "DefaultDomain", "0", "", "");
insert into tableDefaults values ("USERDBDomains", "AuthenticationPort", "0", "", "");
insert into tableDefaults values ("USERDBDomains", "SecondAuthenticationPort", "0", "", "");
insert into tableDefaults values ("USERDBDomains", "ThirdAuthenticationPort", "0", "", "");
insert into tableDefaults values ("USERDBDomains", "SSLEnable", "0", "", "");
insert into tableDefaults values ("USERDBDomains", "SecondSSLEnable", "0", "", "");
insert into tableDefaults values ("USERDBDomains", "ThirdSSLEnable", "0", "", "");
insert into tableDefaults values ("USERDBDomains", "TimeOut", "30", "", "");
insert into tableDefaults values ("USERDBDomains", "Retries", "5", "", "");
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM", 0, 1, "USERDBDomains", 0, 1, 1, 1);

CREATE TABLE dot11Card
(
	cardNo  integer NOT NULL,
	cardName  text NOT NULL,
    txEnabled integer NOT NULL,
    rxEnabled integer NOT NULL,
    agcEnabled integer NOT NULL,
    txCancellation integer NOT NULL,
    rxMaxGain integer NOT NULL,
    txLO integer NOT NULL,
    rxLO integer NOT NULL,
	 PRIMARY KEY (cardNo)
)
;



CREATE TABLE dot11Radio
(
	interfaceName  text NOT NULL,
	radioNo  integer NOT NULL,
	cardNo  integer NOT NULL,
	band  text NOT NULL,
	currentChannel  integer NOT NULL,
	configuredChannel  text NOT NULL,
	radioenabled  integer NOT NULL,
	txPower  integer NOT NULL,
	path  integer NOT NULL,
	rogueAPEnabled  integer NOT NULL,
	rxDiversity  integer NOT NULL,
    dothEnabled integer NOT NULL,
    dothMaxPower integer NOT NULL,
    dothMarkDfs integer NOT NULL,
    wdsEnabled  integer NOT NULL,
    opMode  text NOT NULL,
	beaconInterval  integer NOT NULL,
	dtimInterval  integer NOT NULL,
	rtsThreshold  integer NOT NULL,
	fragThreshold  integer NOT NULL,
	preambleMode  text NOT NULL,
	rtsCtsProtect  integer NOT NULL,
	shortRetry  integer NOT NULL,
	longRetry  integer NOT NULL,
	uapsd  integer NOT NULL,
    wdsPskPassAscii  text ,
    txRate integer NOT NULL,
	PRIMARY KEY (radioNo),
    FOREIGN KEY (cardNo) REFERENCES dot11Card(cardNo)
)
;

insert into tableDefaults values ("dot11Radio","txRate","0","","");
insert into tableDefaults values ("dot11Radio","wdsEnabled","0","","");

CREATE TABLE dot11Interface
(
	interfaceName  text NOT NULL,
	radioNo  integer NOT NULL,
	vapName  text NOT NULL,
	macAddress  text NOT NULL,
	 PRIMARY KEY (interfaceName),
    FOREIGN KEY (interfaceName) REFERENCES networkInterface(interfaceName),
    FOREIGN KEY (radioNo) REFERENCES dot11Radio(radioNo)
)
;



CREATE TABLE dot11ACL
(
	macAddress  text NOT NULL,
    vapName  text NOT NULL,
    PRIMARY KEY (vapName, macAddress),
    FOREIGN KEY (vapName) REFERENCES dot11VAP(vapName)
)
;


CREATE TABLE dot11VAP
(
	vapName  text NOT NULL,
	vapEnabled  integer NOT NULL,
    opMode  text NOT NULL,
	profileName  text NOT NULL,
	beaconInterval  integer NOT NULL,
	dtimInterval  integer NOT NULL,
	maxClients  integer NOT NULL,
	rate1Mbps  integer NOT NULL,
	rate2Mbps  integer NOT NULL,
	rate5_5Mbps  integer NOT NULL,
	rate6Mbps  integer NOT NULL,
	rate9Mbps  integer NOT NULL,
	rate11Mbps  integer NOT NULL,
	rate12Mbps  integer NOT NULL,
	rate18Mbps  integer NOT NULL,
	rate24Mbps  integer NOT NULL,
	rate36Mbps  integer NOT NULL,
	rate48Mbps  integer NOT NULL,
	rate54Mbps  integer NOT NULL,
	rtsThreshold  integer NOT NULL,
	fragThreshold  integer NOT NULL,
	preambleMode  text NOT NULL,
	rtsCtsProtect  integer NOT NULL,
	shortRetry  integer NOT NULL,
	longRetry  integer NOT NULL,
	txPower  integer NOT NULL,
	dot11Mode  text NOT NULL,
	apIsolation  integer NOT NULL,
    defACLPolicy  text NOT NULL,
    iappEnabled  integer NOT NULL,
    uapsd  integer NOT NULL,
    radioList text, -- we use this only to trigger updates,
                    -- in case radio selection has changed
    txRate integer NOT NULL,
    puren integer NOT NULL,
    PRIMARY KEY (vapName),
    FOREIGN KEY (profileName) REFERENCES dot11Profile(profileName)
)
;

insert into tableDefaults values ("dot11VAP","vapEnabled","1","","");
insert into tableDefaults values ("dot11VAP","trunkPort","0","","");
insert into tableDefaults values ("dot11VAP","beaconInterval","100", "40", "3500");
insert into tableDefaults values ("dot11VAP","dtimInterval","1","1","255");
insert into tableDefaults values ("dot11VAP","rate1Mbps","1","","");
insert into tableDefaults values ("dot11VAP","rate2Mbps","1","","");
insert into tableDefaults values ("dot11VAP","rate5_5Mbps","1","","");
insert into tableDefaults values ("dot11VAP","rate6Mbps","1","","");
insert into tableDefaults values ("dot11VAP","rate9Mbps","1","","");
insert into tableDefaults values ("dot11VAP","rate11Mbps","1","","");
insert into tableDefaults values ("dot11VAP","rate12Mbps","1","","");
insert into tableDefaults values ("dot11VAP","rate18Mbps","1","","");
insert into tableDefaults values ("dot11VAP","rate24Mbps","1","","");
insert into tableDefaults values ("dot11VAP","rate36Mbps","1","","");
insert into tableDefaults values ("dot11VAP","rate48Mbps","1","","");
insert into tableDefaults values ("dot11VAP","rate54Mbps","1","","");
insert into tableDefaults values ("dot11VAP","rtsThreshold","2346","256","2347");
insert into tableDefaults values ("dot11VAP","fragThreshold","2346","257","2346");
insert into tableDefaults values ("dot11VAP","preambleMode","Long","","");
insert into tableDefaults values ("dot11VAP","rtsCtsProtect","0","","");
insert into tableDefaults values ("dot11VAP","shortRetry","16","0","128");
insert into tableDefaults values ("dot11VAP","longRetry","16","0","128");
insert into tableDefaults values ("dot11VAP","txPower","31","1","31");
insert into tableDefaults values ("dot11VAP","dot11Mode","AP","","");
insert into tableDefaults values ("dot11VAP","opMode","b and g","","");
insert into tableDefaults values ("dot11VAP","defACLPolicy","Open","","");
insert into tableDefaults values ("dot11VAP","iappEnabled","0","","");
insert into tableDefaults values ("dot11VAP","bssidSecret","","","");
insert into tableDefaults values ("dot11VAP","radioList","","","");
insert into tableDefaults values ("dot11VAP", "maxClients","8","","");
insert into tableDefaults values ("dot11VAP","uapsd","0","","");
insert into tableDefaults values ("dot11VAP","txRate","0","","");
insert into tableDefaults values ("dot11VAP","puren","0","","");

CREATE TABLE dot11VAPStats
(
	interfaceName  text NOT NULL,
	is_rx_badversion  integer NOT NULL,
	is_rx_tooshort  integer NOT NULL,
	is_rx_wrongbss  integer NOT NULL,
	is_rx_dup  integer NOT NULL,
	is_rx_wrongdir  integer NOT NULL,
	is_rx_mcastecho  integer NOT NULL,
	is_rx_notassoc  integer NOT NULL,
	is_rx_noprivacy  integer NOT NULL,
	is_rx_unencrypted  integer NOT NULL,
	is_rx_wepfail  integer NOT NULL,
	is_rx_decap  integer NOT NULL,
	is_rx_mgtdiscard  integer NOT NULL,
	is_rx_ctl  integer NOT NULL,
	is_rx_beacon  integer NOT NULL,
	is_rx_rstoobig  integer NOT NULL,
	is_rx_elem_missing  integer NOT NULL,
	is_rx_elem_toobig  integer NOT NULL,
	is_rx_elem_toosmall  integer NOT NULL,
	is_rx_elem_unknown  integer NOT NULL,
	is_rx_badchan  integer NOT NULL,
	is_rx_chanmismatch  integer NOT NULL,
	is_rx_nodealloc  integer NOT NULL,
	is_rx_ssidmismatch  integer NOT NULL,
	is_rx_auth_unsupported  integer NOT NULL,
	is_rx_auth_fail  integer NOT NULL,
	is_rx_auth_countermeasures  integer NOT NULL,
	is_rx_assoc_bss  integer NOT NULL,
	is_rx_assoc_notauth  integer NOT NULL,
	is_rx_assoc_capmismatch  integer NOT NULL,
	is_rx_assoc_norate  integer NOT NULL,
	is_rx_assoc_badwpaie  integer NOT NULL,
	is_rx_deauth  integer NOT NULL,
	is_rx_disassoc  integer NOT NULL,
	is_rx_badsubtype  integer NOT NULL,
	is_rx_nobuf  integer NOT NULL,
	is_rx_decryptcrc  integer NOT NULL,
	is_rx_ahdemo_mgt  integer NOT NULL,
	is_rx_bad_auth  integer NOT NULL,
	is_rx_unauth  integer NOT NULL,
	is_rx_badkeyid  integer NOT NULL,
	is_rx_ccmpreplay  integer NOT NULL,
	is_rx_ccmpformat  integer NOT NULL,
	is_rx_ccmpmic  integer NOT NULL,
	is_rx_tkipreplay  integer NOT NULL,
	is_rx_tkipformat  integer NOT NULL,
	is_rx_tkipmic  integer NOT NULL,
	is_rx_tkipicv  integer NOT NULL,
	is_rx_badcipher  integer NOT NULL,
	is_rx_nocipherctx  integer NOT NULL,
	is_rx_acl  integer NOT NULL,
	is_rx_ffcnt  integer NOT NULL,
	is_rx_badathtnl  integer NOT NULL,
	is_tx_nobuf  integer NOT NULL,
	is_tx_nonode  integer NOT NULL,
	is_tx_unknownmgt  integer NOT NULL,
	is_tx_badcipher  integer NOT NULL,
	is_tx_nodefkey  integer NOT NULL,
	is_tx_noheadroom  integer NOT NULL,
	is_tx_ffokcnt  integer NOT NULL,
	is_tx_fferrcnt  integer NOT NULL,
	is_scan_active  integer NOT NULL,
	is_scan_passive  integer NOT NULL,
	is_node_timeout  integer NOT NULL,
	is_crypto_nomem  integer NOT NULL,
	is_crypto_tkip  integer NOT NULL,    
	is_crypto_tkipenmic  integer NOT NULL,
	is_crypto_tkipdemic  integer NOT NULL,
	is_crypto_tkipcm  integer NOT NULL,
	is_crypto_ccmp  integer NOT NULL,
	is_crypto_wep  integer NOT NULL,
	is_crypto_setkey_cipher  integer NOT NULL,
	is_crypto_setkey_nokey  integer NOT NULL,
	is_crypto_delkey  integer NOT NULL,
	is_crypto_badcipher  integer NOT NULL,
	is_crypto_nocipher  integer NOT NULL,
	is_crypto_attachfail  integer NOT NULL,
	is_crypto_swfallback  integer NOT NULL,
	is_crypto_keyfail  integer NOT NULL,
	is_crypto_enmicfail  integer NOT NULL,
	is_ibss_capmismatch  integer NOT NULL,
	is_ibss_norate  integer NOT NULL,
	is_ps_unassoc  integer NOT NULL,
	is_ps_badaid  integer NOT NULL,
	is_ps_qempty  integer NOT NULL,
	 PRIMARY KEY (interfaceName),
    FOREIGN KEY (interfaceName) REFERENCES dot11Interface(interfaceName)
)
;



CREATE TABLE dot11STA
(
	interfaceName  text NOT NULL,
	macAddress  text NOT NULL,
	security  text NOT NULL,
	authentication  text NOT NULL,
	cipher  text NOT NULL,
	timeConnected  text NOT NULL,
	 PRIMARY KEY (macAddress),
    FOREIGN KEY (interfaceName) REFERENCES dot11Interface(interfaceName)
)
;



CREATE TABLE dot11NodeStats
(
	interfaceName  text NOT NULL,
	macAddress  text NOT NULL,
	ns_rx_data  integer NOT NULL,
	ns_rx_mgmt  integer NOT NULL,
	ns_rx_ctrl  integer NOT NULL,
	ns_rx_ucast  integer NOT NULL,
	ns_rx_mcast  integer NOT NULL,
	ns_rx_bytes  integer NOT NULL,
	ns_rx_beacons  integer NOT NULL,
	ns_rx_proberesp  integer NOT NULL,
	ns_rx_dup  integer NOT NULL,
	ns_rx_noprivacy  integer NOT NULL,
	ns_rx_wepfail  integer NOT NULL,
	ns_rx_demicfail  integer NOT NULL,
	ns_rx_decap  integer NOT NULL,
	ns_rx_defrag  integer NOT NULL,
	ns_rx_disassoc  integer NOT NULL,
	ns_rx_deauth  integer NOT NULL,
	ns_rx_decryptcrc  integer NOT NULL,
	ns_rx_unauth  integer NOT NULL,
	ns_rx_unencrypted  integer NOT NULL,
	ns_tx_data  integer NOT NULL,
	ns_tx_mgmt  integer NOT NULL,
	ns_tx_ucast  integer NOT NULL,
	ns_tx_mcast  integer NOT NULL,
	ns_tx_bytes  integer NOT NULL,
	ns_tx_probereq  integer NOT NULL,
	ns_tx_uapsd  integer NOT NULL,
	ns_tx_novlantag  integer NOT NULL,
	ns_tx_vlanmismatch  integer NOT NULL,
	ns_tx_eosplost  integer NOT NULL,
	ns_ps_discard  integer NOT NULL,
	ns_uapsd_triggers  integer NOT NULL,
	ns_tx_assoc  integer NOT NULL,
	ns_tx_assoc_fail  integer NOT NULL,
	ns_tx_auth  integer NOT NULL,
	ns_tx_auth_fail  integer NOT NULL,
	ns_tx_deauth  integer NOT NULL,
	ns_tx_deauth_code  integer NOT NULL,
	ns_tx_disassoc  integer NOT NULL,
	ns_tx_disassoc_code  integer NOT NULL,
	ns_psq_drops  integer NOT NULL,
	 PRIMARY KEY (macAddress),
    FOREIGN KEY (macAddress) REFERENCES dot11STA(macAddress),
    FOREIGN KEY (interfaceName) REFERENCES dot11Interface(interfaceName)
)
;



CREATE TABLE dot11RogueAP
(
	macAddress  text NOT NULL,
	SSID  text NOT NULL,
	security  text NOT NULL,
	pairwiseCiphers  text NOT NULL,
	authMethods  text NOT NULL,
	timeLastSeen  integer,
	 PRIMARY KEY (macAddress, SSID, security, pairwiseCiphers, authMethods)
)
;


CREATE TABLE dot11AuthorizedAP
(
	macAddress  text NOT NULL,
	SSID  text NOT NULL,
	security  text NOT NULL,
	pairwiseCiphers  text,
	authMethods  text,
	 PRIMARY KEY (macAddress, SSID, security, pairwiseCiphers, authMethods)
)
;

CREATE TABLE dot11Profile
(
	profileName  text NOT NULL,
	ssid  text NOT NULL,
	authserver  text ,
	broadcastSSID  integer NOT NULL,
	pskPassAscii  text ,
	pskPassHex  text ,
	wepkey0  text ,
	wepkey1  text ,
	wepkey2  text ,
	wepkey3  text ,
	defWepkeyIdx  integer ,
	groupCipher  text ,
	pairwiseCiphers  text ,
	authMethods  text ,
	security  text NOT NULL,
	authTimeout  integer ,
	assocTimeout  integer ,
	groupKeyUpdateInterval  integer ,
	pmksaLifetime  integer ,
	dot1xReauthInterval  integer ,
	wepAuth  text ,
    preAuthStatus integer NOT NULL,
    radioMode text ,
    qosEnable integer NOT NULL,
    defaultCos text NOT NULL,
    dscpCosMap0 text  NOT NULL,
    dscpCosMap1 text  NOT NULL,
    dscpCosMap2 text  NOT NULL,
    dscpCosMap3 text  NOT NULL,
    dscpCosMap4 text  NOT NULL,
    dscpCosMap5 text  NOT NULL,
    dscpCosMap6 text  NOT NULL,
    dscpCosMap7 text  NOT NULL,
    dscpCosMap8 text  NOT NULL,
    dscpCosMap9 text  NOT NULL,
    dscpCosMap10 text  NOT NULL,
    dscpCosMap11 text  NOT NULL,
    dscpCosMap12 text  NOT NULL,
    dscpCosMap13 text  NOT NULL,
    dscpCosMap14 text  NOT NULL,
    dscpCosMap15 text  NOT NULL,
    dscpCosMap16 text  NOT NULL,
    dscpCosMap17 text  NOT NULL,
    dscpCosMap18 text  NOT NULL,
    dscpCosMap19 text  NOT NULL,
    dscpCosMap20 text  NOT NULL,
    dscpCosMap21 text  NOT NULL,
    dscpCosMap22 text  NOT NULL,
    dscpCosMap23 text  NOT NULL,
    dscpCosMap24 text  NOT NULL,
    dscpCosMap25 text  NOT NULL,
    dscpCosMap26 text  NOT NULL,
    dscpCosMap27 text  NOT NULL,
    dscpCosMap28 text  NOT NULL,
    dscpCosMap29 text  NOT NULL,
    dscpCosMap30 text  NOT NULL,
    dscpCosMap31 text  NOT NULL,
    dscpCosMap32 text  NOT NULL,
    dscpCosMap33 text  NOT NULL,
    dscpCosMap34 text  NOT NULL,
    dscpCosMap35 text  NOT NULL,
    dscpCosMap36 text  NOT NULL,
    dscpCosMap37 text  NOT NULL,
    dscpCosMap38 text  NOT NULL,
    dscpCosMap39 text  NOT NULL,
    dscpCosMap40 text  NOT NULL,
    dscpCosMap41 text  NOT NULL,
    dscpCosMap42 text  NOT NULL,
    dscpCosMap43 text  NOT NULL,
    dscpCosMap44 text  NOT NULL,
    dscpCosMap45 text  NOT NULL,
    dscpCosMap46 text  NOT NULL,
    dscpCosMap47 text  NOT NULL,
    dscpCosMap48 text  NOT NULL,
    dscpCosMap49 text  NOT NULL,
    dscpCosMap50 text  NOT NULL,
    dscpCosMap51 text  NOT NULL,
    dscpCosMap52 text  NOT NULL,
    dscpCosMap53 text  NOT NULL,
    dscpCosMap54 text  NOT NULL,
    dscpCosMap55 text  NOT NULL,
    dscpCosMap56 text  NOT NULL,
    dscpCosMap57 text  NOT NULL,
    dscpCosMap58 text  NOT NULL,
    dscpCosMap59 text  NOT NULL,
    dscpCosMap60 text  NOT NULL,
    dscpCosMap61 text  NOT NULL,
    dscpCosMap62 text  NOT NULL,
    dscpCosMap63 text  NOT NULL,
    wmeEnabled integer NOT NULL,
	 PRIMARY KEY (profileName),
    FOREIGN KEY (authserver) REFERENCES radiusClient(authserver)
)
;

insert into tableDefaults values ("dot11Profile","radioMode","b","","");

create table dot11Countries
(
    country text,
    countrycode int
);

create table dot11CountriesRegDmnMapping
(
    country text,
    regDomain5Ghz  text,
    regDomain2Ghz text,
    allow11g int,
    allow11na40 int,
    allow11ng40 int
);

create table dot11RegDmnChannelMapping 
(
    regDomain text,
    channelNo int,
    frequency int,
    chan11a   int,
    chan11na int,
    chan11b   int,
    chan11g   int,
    chan11ng int,
    ht40 int -- 40Ghz channel width
); 

create table dot11GlobalConfig
(
    country text,
    radioNo int,
    iappBssidSecret text
);
insert into tableDefaults values ("dot11GlobalConfig","radioNo","1","","");

create table dot11WPS
(
    vapName       text, -- ap name
    wpsEnabled    int NOT NULL,  -- wps enabled/disabled
    PRIMARY KEY (vapName)
);

create table dot11WPSSessStatus
(
    sessionMsg    text, -- wps session status messages
    sessionStatus int NOT NULL  -- wps session status
);

create table dot11WDSPeers
(
    radioNo  integer NOT NULL,       
    macAddress  text NOT NULL,
    pskPassAscii text,
    pairwiseCipher text,
    wdsIndexNo  integer NOT NULL,
    ssid  text NOT NULL,  PRIMARY KEY (radioNo, macAddress),
    FOREIGN KEY (radioNo) REFERENCES dot11Radio(radioNo)
)
;

--insert into tableDefaults values ("dot11WDSPeers","pskPassAscii","  ","","");
insert into dot11WPSSessStatus values ("","0");

insert into stringsMap values ("WPS_CONFIG_FAILED","WPS Configuration Failed.");
insert into stringsMap values ("WPS_QUERRY_INPROCESS","WPS Station Adding in Process. Please try after some time to add new Station");
insert into stringsMap values ("AP_DISABLED_ERROR","Enable AP to add WPS Stations");
insert into stringsMap values ("WPA_VAP_USE_ERROR","Please disable WPS on AP using this profile");

insert into dot11CountriesRegDmnMapping values ("USA", "FCC3","FCCA", 1, 1, 1);
insert into dot11CountriesRegDmnMapping values ("INDIA", "APL6","WORLD", 1, 0, 1);
insert into dot11CountriesRegDmnMapping values ("CANADA", "FCC2","FCCA", 1, 1, 1);
--insert into dot11CountriesRegDmnMapping values ("KOREA", "--","--", 1, 1, 1);
--insert into dot11CountriesRegDmnMapping values ("JAPAN", "--","--", 1, 1, 1);
insert into dot11CountriesRegDmnMapping values ("HONG KONG", "FCC2","WORLD", 1, 1, 1);
insert into dot11CountriesRegDmnMapping values ("CHINA", "APL1","WORLD", 1, 1, 1);
insert into dot11CountriesRegDmnMapping values ("AUSTRALIA", "FCC2","WORLD", 1, 1, 1);
insert into dot11CountriesRegDmnMapping values ("SINGAPORE", "APL6","WORLD", 1, 1, 1);
insert into dot11CountriesRegDmnMapping values ("THAILAND", "NULL1","WORLD", 1, 0, 1);
insert into dot11CountriesRegDmnMapping values ("BRUNEI DARUSSALAM", "APL1","WORLD", 1, 1, 1);
insert into dot11CountriesRegDmnMapping values ("INDONESIA", "APL1","WORLD", 1, 0, 1);
insert into dot11CountriesRegDmnMapping values ("NEW ZEALAND", "FCC2","ETSIC", 1, 0, 1);
insert into dot11CountriesRegDmnMapping values ("PHILIPPINES", "APL1","WORLD", 1, 1, 1);
insert into dot11CountriesRegDmnMapping values ("VIETNAM", "NULL1","WORLD", 1, 0, 1);

insert into dot11RegDmnChannelMapping values ("FCCA",  1,2412, 0, 0,1, 1, 1, 0);
insert into dot11RegDmnChannelMapping values ("FCCA",  2,2417, 0, 0,1, 1, 1, 0);
insert into dot11RegDmnChannelMapping values ("FCCA",  3,2422, 0, 0,1, 1, 1, 1);
insert into dot11RegDmnChannelMapping values ("FCCA",  4,2427, 0, 0,1, 1, 1, 1);
insert into dot11RegDmnChannelMapping values ("FCCA",  5,2432, 0, 0,1, 1, 1, 1);
insert into dot11RegDmnChannelMapping values ("FCCA",  6,2437, 0, 0,1, 1, 1, 1);
insert into dot11RegDmnChannelMapping values ("FCCA",  7,2442, 0, 0,1, 1, 1, 1);
insert into dot11RegDmnChannelMapping values ("FCCA",  8,2447, 0, 0,1, 1, 1, 1);
insert into dot11RegDmnChannelMapping values ("FCCA",  9,2452, 0, 0,1, 1, 1, 1);
insert into dot11RegDmnChannelMapping values ("FCCA", 10,2457, 0, 0,1, 1, 1, 0);
insert into dot11RegDmnChannelMapping values ("FCCA", 11,2462, 0, 0,1, 1, 1, 0);
insert into dot11RegDmnChannelMapping values ("FCCA", 12,2467, 0, 0,0, 0, 1, 0);
insert into dot11RegDmnChannelMapping values ("FCCA", 13,2472, 0, 0,0, 0, 1, 0);

insert into dot11RegDmnChannelMapping values ("FCC2", 36, 5180, 1, 0,0,0,0,0);
insert into dot11RegDmnChannelMapping values ("FCC2", 38, 5190, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("FCC2", 40, 5200, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("FCC2", 44, 5220, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("FCC2", 46, 5230, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("FCC2", 48, 5240, 1, 0,0,0,0,0);
insert into dot11RegDmnChannelMapping values ("FCC2", 52, 5260, 1, 0,0,0,0,0);
insert into dot11RegDmnChannelMapping values ("FCC2", 54, 5270, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("FCC2", 56, 5280, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("FCC2", 60, 5300, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("FCC2", 62, 5310, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("FCC2", 64, 5320, 1, 0,0,0,0,0);
insert into dot11RegDmnChannelMapping values ("FCC2", 149, 5745, 1, 0,0,0,0,0);
insert into dot11RegDmnChannelMapping values ("FCC2", 153, 5765, 1, 0,0,0,0,0);
insert into dot11RegDmnChannelMapping values ("FCC2", 157, 5785, 1, 0,0,0,0,0);
insert into dot11RegDmnChannelMapping values ("FCC2", 159, 5795, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("FCC2", 161, 5805, 1, 0,0,0,0,0);
insert into dot11RegDmnChannelMapping values ("FCC2", 165, 5825, 1, 0,0,0,0,0);

insert into dot11RegDmnChannelMapping values ("FCC3", 36, 5180, 1, 0,0,0,0,0);
insert into dot11RegDmnChannelMapping values ("FCC3", 38, 5190, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("FCC3", 40, 5200, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("FCC3", 44, 5220, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("FCC3", 46, 5230, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("FCC3", 48, 5240, 1, 0,0,0,0,0);
insert into dot11RegDmnChannelMapping values ("FCC3", 52, 5260, 1, 0,0,0,0,0);
insert into dot11RegDmnChannelMapping values ("FCC3", 54, 5270, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("FCC3", 56, 5280, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("FCC3", 60, 5300, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("FCC3", 62, 5310, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("FCC3", 64, 5320, 1, 0,0,0,0,0);
insert into dot11RegDmnChannelMapping values ("FCC3", 100, 5500, 1, 0,0,0,0,0);
insert into dot11RegDmnChannelMapping values ("FCC3", 104, 5520, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("FCC3", 108, 5540, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("FCC3", 112, 5560, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("FCC3", 116, 5580, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("FCC3", 120, 5600, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("FCC3", 124, 5620, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("FCC3", 128, 5640, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("FCC3", 132, 5660, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("FCC3", 136, 5680, 1, 0,0,0,0,0);
insert into dot11RegDmnChannelMapping values ("FCC3", 140, 5700, 1, 0,0,0,0,0);
insert into dot11RegDmnChannelMapping values ("FCC3", 149, 5745, 1, 0,0,0,0,0);
insert into dot11RegDmnChannelMapping values ("FCC3", 153, 5765, 1, 0,0,0,0,0);
insert into dot11RegDmnChannelMapping values ("FCC3", 157, 5785, 1, 0,0,0,0,0);
insert into dot11RegDmnChannelMapping values ("FCC3", 159, 5795, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("FCC3", 161, 5805, 1, 0,0,0,0,0);
insert into dot11RegDmnChannelMapping values ("FCC3", 165, 5825, 1, 0,0,0,0,0);

insert into dot11RegDmnChannelMapping values ("APL1", 149, 5745, 1, 0,0,0,0,0);
insert into dot11RegDmnChannelMapping values ("APL1", 151, 5755, 0, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("APL1", 153, 5765, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("APL1", 157, 5785, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("APL1", 159, 5795, 0, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("APL1", 161, 5805, 1, 0,0,0,0,0);
insert into dot11RegDmnChannelMapping values ("APL1", 165, 5825, 1, 0,0,0,0,0);

insert into dot11RegDmnChannelMapping values ("APL6", 36, 5180, 1, 0,0,0,0,0);
insert into dot11RegDmnChannelMapping values ("APL6", 38, 5190, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("APL6", 40, 5200, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("APL6", 44, 5220, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("APL6", 46, 5230, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("APL6", 48, 5240, 1, 0,0,0,0,0);
insert into dot11RegDmnChannelMapping values ("APL6", 52, 5260, 1, 0,0,0,0,0);
insert into dot11RegDmnChannelMapping values ("APL6", 54, 5270, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("APL6", 56, 5280, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("APL6", 60, 5300, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("APL6", 62, 5310, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("APL6", 64, 5320, 1, 0,0,0,0,0);
insert into dot11RegDmnChannelMapping values ("APL6", 149, 5745, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("APL6", 153, 5765, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("APL6", 157, 5785, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("APL6", 159, 5795, 1, 1,0,0,0,1);
insert into dot11RegDmnChannelMapping values ("APL6", 161, 5805, 1, 0,0,0,0,0);
insert into dot11RegDmnChannelMapping values ("APL6", 165, 5825, 1, 0,0,0,0,0);

insert into dot11RegDmnChannelMapping values ("ETSIC",  1,2412, 0, 0,1, 1, 1, 0);
insert into dot11RegDmnChannelMapping values ("ETSIC",  2,2417, 0, 0,1, 1, 1, 0);
insert into dot11RegDmnChannelMapping values ("ETSIC",  3,2422, 0, 0,1, 1, 1, 1);
insert into dot11RegDmnChannelMapping values ("ETSIC",  4,2427, 0, 0,1, 1, 1, 1);
insert into dot11RegDmnChannelMapping values ("ETSIC",  5,2432, 0, 0,1, 1, 1, 1);
insert into dot11RegDmnChannelMapping values ("ETSIC",  6,2437, 0, 0,1, 1, 1, 1);
insert into dot11RegDmnChannelMapping values ("ETSIC",  7,2442, 0, 0,1, 1, 1, 1);
insert into dot11RegDmnChannelMapping values ("ETSIC",  8,2447, 0, 0,1, 1, 1, 1);
insert into dot11RegDmnChannelMapping values ("ETSIC",  9,2452, 0, 0,1, 1, 1, 1);
insert into dot11RegDmnChannelMapping values ("ETSIC", 10,2457, 0, 0,1, 1, 1, 1);
insert into dot11RegDmnChannelMapping values ("ETSIC", 11,2462, 0, 0,1, 1, 1, 1);
insert into dot11RegDmnChannelMapping values ("ETSIC", 12,2467, 0, 0,1, 1, 1, 0);
insert into dot11RegDmnChannelMapping values ("ETSIC", 13,2472, 0, 0,1, 1, 1, 0);

insert into dot11RegDmnChannelMapping values ("WORLD", 1,2412, 0, 0,1, 1, 1, 0);
insert into dot11RegDmnChannelMapping values ("WORLD", 2,2417, 0, 0,1, 1, 1, 0);
insert into dot11RegDmnChannelMapping values ("WORLD", 3,2422, 0, 0,1, 1, 1, 1);
insert into dot11RegDmnChannelMapping values ("WORLD", 4,2427, 0, 0,1, 1, 1, 1);
insert into dot11RegDmnChannelMapping values ("WORLD", 5,2432, 0, 0,1, 1, 1, 1);
insert into dot11RegDmnChannelMapping values ("WORLD", 6,2437, 0, 0,1, 1, 1, 1);
insert into dot11RegDmnChannelMapping values ("WORLD", 7,2442, 0, 0,1, 1, 1, 1);
insert into dot11RegDmnChannelMapping values ("WORLD", 8,2447, 0, 0,1, 1, 1, 1);
insert into dot11RegDmnChannelMapping values ("WORLD", 9,2452, 0, 0,1, 1, 1, 1);
insert into dot11RegDmnChannelMapping values ("WORLD", 10,2457, 0, 0,1, 1, 1, 0);
insert into dot11RegDmnChannelMapping values ("WORLD", 11,2462, 0, 0,1, 1, 1, 0);
insert into dot11RegDmnChannelMapping values ("WORLD", 12,2467, 0, 0,1, 1, 1, 0);
insert into dot11RegDmnChannelMapping values ("WORLD", 13,2472, 0, 0,1, 1, 1, 0);

CREATE TABLE dot11IAPPRemoteAP
(
    bssid  text NOT NULL,
    ipAddr  text,
    bssidSecret text,
    vlanId integer,
    neighbor text,
    PRIMARY KEY (bssid)
)
;

insert into tableDefaults values ("dot11IAPPRemoteAP", "bssid","","","");
insert into tableDefaults values ("dot11IAPPRemoteAP", "ipAddr","","","");
insert into tableDefaults values ("dot11IAPPRemoteAP", "bssidSecret","","","");
insert into tableDefaults values ("dot11IAPPRemoteAP", "vlanId","","1","4095");
insert into tableDefaults values ("dot11IAPPRemoteAP", "neighbor","","","");

insert into tableDefaults values ("dot11Profile", "authTimeout","10","1","3600");
insert into tableDefaults values ("dot11Profile", "assocTimeout","10","1","3600");
insert into tableDefaults values ("dot11Profile", "groupKeyUpdateInterval","3600","1","36000");
insert into tableDefaults values ("dot11Profile", "pmksaLifetime","3600","1","36000");
insert into tableDefaults values ("dot11Profile", "dot1xReauthInterval","3600","1","36000");
insert into tableDefaults values ("dot11Profile", "preAuthStatus","0","","");
insert into tableDefaults values ("dot11Profile","qosEnable","0","","");
insert into tableDefaults values ("dot11Profile","defaultCos","Background","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap0","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap1","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap2","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap3","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap4","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap5","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap6","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap7","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap8","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap9","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap10","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap11","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap12","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap13","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap14","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap15","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap16","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap17","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap18","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap19","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap20","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap21","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap22","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap23","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap24","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap25","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap26","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap27","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap28","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap29","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap30","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap31","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap32","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap33","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap34","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap35","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap36","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap37","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap38","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap39","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap40","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap41","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap42","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap43","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap44","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap45","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap46","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap47","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap48","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap49","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap50","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap51","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap52","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap53","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap54","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap55","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap56","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap57","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap58","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap59","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap60","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap61","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap62","Default","","");
insert into tableDefaults values ("dot11Profile","dscpCosMap63","Default","","");
insert into tableDefaults values ("dot11Profile","wmeEnabled","1","","");
insert into tableDefaults values ("dot11WPS", "vapName","","","");
insert into tableDefaults values ("dot11WPS", "wpsEnabled","0","","");

insert into tableDefaults values ("dot11WPSSessStatus", "sessionMsg","","","");
insert into tableDefaults values ("dot11WPSSessStatus", "sessionStatus","0","","");

insert into dbUpdateRegisterTbl values ("UMI_COMP_UDOT11",1,1,"dot11VAP", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_UDOT11",1,1,"dot11Profile", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_UDOT11",1,1,"dot11Interface", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_UDOT11",0,1,"dot11Radio", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_UDOT11",0,1,"dot11Radio11n", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_UDOT11",0,1,"dot11GlobalConfig", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_UDOT11",1,1,"dot11AuthorizedAP", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_UDOT11",1,1,"dot11RogueAP", 0, 0,0,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_UDOT11",1,1,"dot11ACL", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"dot11Radio", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",0,1,"dot11VAP", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"dot11Card", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_IAPP",0,0,"dot11VAP", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_IAPP",0,0,"dot11IAPPRemoteAP", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_IAPP",0,0,"networkInterface", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_IAPP",0,0,"dot11GlobalConfig", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_UDOT11",0,0,"dot11WPS", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_UDOT11",0,1,"dot11WDSPeers", 0, 1,1,1);

insert into stringsMap values ("DOT11_STAT_CONFIG_FAILED","Wireless statistics refresh configuration failed");
insert into stringsMap values ("DOT11_AP_STAT_CONFIG_FAILED","AP statistics refresh configuration failed");
insert into stringsMap values ("DOT11_ROGUE_AP_MOVE_FAILED","Unable to move rogue AP");
insert into stringsMap values ("DOT11_AUTH_AP_CONFIG_FAILED","Authorized AP configuration failed");
insert into stringsMap values ("DOT11_PROFILE_CONFIG_FAILED","Profile configuration failed");
insert into stringsMap values ("DOT11_ADV_PROFILE_CONFIG_FAILED","Advanced profile configuration failed");
insert into stringsMap values ("DOT11_QOS_CONFIG_FAILED","QoS configuration failed");
insert into stringsMap values ("DOT11_AP_DEL_FAILED","Unable to delete AP");
insert into stringsMap values ("DOT11_AP_ENABLE_FAILED","Enabling of AP failed");
insert into stringsMap values ("DOT11_AP_DISABLE_FAILED","Disabling of AP failed");
insert into stringsMap values ("DOT11_AP_CONFIG_FAILED","AP configuration failed");
insert into stringsMap values ("DOT11_ADV_AP_CONFIG_FAILED","Advanced AP configuration failed");
insert into stringsMap values ("DOT11_ACL_CONFIG_FAILED","ACL configuration failed");
insert into stringsMap values ("DOT11_RADIO_CONFIG_FAILED","Radio configuration failed");
insert into stringsMap values ("DOT11_CARD_CONFIG_FAILED","Card configuration failed");
insert into stringsMap values ("DOT11_IAPP_CONFIG_FAILED_BSSID","IAPP configuration failed (BSSID Secret)");
insert into stringsMap values ("DOT11_IAPP_ENABLE_FAILED","IAPP enable failed");
insert into stringsMap values ("DOT11_IAPP_DISABLE_FAILED","IAPP disable failed");
insert into stringsMap values ("DOT11_IAPP_CONFIG_FAILED_REMOTE","IAPP configuration failed (Remote AP)");
insert into stringsMap values ("DOT11_WDS_CONFIG_FAILED","Failed to configure WDS (Radio is in use by other APs)");
insert into stringsMap values ("DOT11_RADIO_CHAN_MUTEX_FAILURE","Channel configuration failed (Same channel already configured on a different radio)");
insert into stringsMap values ("DOT11_RADIO_CHAN_DWIDTH_FAILURE","Warning : Channel falls within 25Mhz range of channel configured on another radio (This might affect normal operation)");
insert into stringsMap values ("MAX_CLIENT_ERROR","Configuration Failed.Max Clients configured exceeds total number of clients allowed for the radio");
insert into stringsMap values ("DOT11_WPS_PIN_INVALID","Invalid PIN. Please enter correct PIN.");
insert into stringsMap values ("DELETE_FROM_WPS","This VAP is being used in WPS, cannot delete.");
insert into stringsMap values ("DISABLE_FROM_WPS","This VAP is being used in WPS, cannot disable.");
insert into stringsMap values ("CAN_NOT_EDIT_ACCESS_CONTROL","This VAP is being used in WPS, cannot edit.");
insert into stringsMap values ("AP_USING_PROFILE","Selected Profile(s) are using by a VAP.");
insert into stringsMap values ("WPA_LENGTH_FAILED","Invalid password length. Please enter a password having 8 to 63 characters.");
insert into stringsMap values ("WEP_LENGTH_FAILED","Failed to configure WEP key as the length is invalid.");
insert into stringsMap values ("WEP_ASCII_LENGTH_FAILED","ASCII key should contain 5(64 Bit) or 13(128 Bit) characters.");
insert into stringsMap values ("DOT11_AP_PROFILE_USE","Profile already in use.");
insert into stringsMap values ("DOT11_AP_SSID_USE","SSID already in use.");
insert into stringsMap values ("WDS_CONFIG_FAILED","Failed to configure WDS");
insert into stringsMap values ("WDS_BRIDGE_CONFIG_FAILED","Failed to add the wds peers to the bridge");
insert into stringsMap values ("WDS_PEER_CONFIG_FAILED","Failed to configure the WDS peer");

-- WIPS
create table dot11WIPS
(
    enabled  integer NOT NULL,          -- 0/1
    interface text  NOT NULL,           -- PCAP for now 
    interfaceParam text  NOT NULL,      -- vapX in case of PCAP interface
    channelList text  NOT NULL,         -- comma sep. list of channels to scan / "all"
    hopDuration integer NOT NULL,       -- hop across channels every x seconds
    PRIMARY KEY (interfaceParam)
)
;
insert into tableDefaults values ("dot11WIPS", "enabled","","0","1");
insert into tableDefaults values ("dot11WIPS", "channelList","all","","");
insert into tableDefaults values ("dot11WIPS", "hopDuration","2","1","10");

insert into dbUpdateRegisterTbl values ("UMI_COMP_DOT11_WIPS",1,1,"dot11WIPS", 0, 1,1,1);

--Multicast to Unicast
create table MulToUni
(
    Enabled  integer NOT NULL           --0/1
)
;
insert into tableDefaults values ("MulToUni", "Enabled","0","0","1");

insert into dbUpdateRegisterTbl values ("UMI_COMP_UDOT11",1,0,"MulToUni", 0, 1,1,0);

insert into dot11Countries values("NA","0");
insert into dot11Countries values("AL","8");
insert into dot11Countries values("DZ","12");
insert into dot11Countries values("AR","32");
insert into dot11Countries values("AM","51");
insert into dot11Countries values("AU","36");
insert into dot11Countries values("AU","5000");
insert into dot11Countries values("AT","40");
insert into dot11Countries values("AZ","31");
insert into dot11Countries values("BH","48");
insert into dot11Countries values("BY","112");
insert into dot11Countries values("BE","56");
insert into dot11Countries values("BE","5002");
insert into dot11Countries values("BZ","84");
insert into dot11Countries values("BO","68");
insert into dot11Countries values("BA","70");
insert into dot11Countries values("BR","76");
insert into dot11Countries values("BN","96");
insert into dot11Countries values("BG","100");
insert into dot11Countries values("CA","5001");
insert into dot11Countries values("CA","124");
insert into dot11Countries values("CL","152");
insert into dot11Countries values("CN","156");
insert into dot11Countries values("CO","170");
insert into dot11Countries values("CR","188");
insert into dot11Countries values("HR","191");
insert into dot11Countries values("CY","196");
insert into dot11Countries values("CZ","203");
insert into dot11Countries values("DO","214");
insert into dot11Countries values("EC","218");
insert into dot11Countries values("EG","818");
insert into dot11Countries values("SV","222");
insert into dot11Countries values("EE","233");
insert into dot11Countries values("FO","234");
insert into dot11Countries values("FI","246");
insert into dot11Countries values("FR","250");
insert into dot11Countries values("GE","268");
insert into dot11Countries values("DE","276");
insert into dot11Countries values("GR","300");
insert into dot11Countries values("GT","320");
insert into dot11Countries values("HN","340");
insert into dot11Countries values("HK","344");
insert into dot11Countries values("HU","348");
insert into dot11Countries values("IS","352");
insert into dot11Countries values("IS","612");
insert into dot11Countries values("IN","356");
insert into dot11Countries values("IN","456");
insert into dot11Countries values("ID","360");
insert into dot11Countries values("IR","364");
insert into dot11Countries values("IQ","368");
insert into dot11Countries values("IE","372");
insert into dot11Countries values("IL","376");
insert into dot11Countries values("IT","380");
insert into dot11Countries values("JM","388");
insert into dot11Countries values("JP","392");
insert into dot11Countries values("JP","393");
insert into dot11Countries values("JP","394");
insert into dot11Countries values("JP","395");
insert into dot11Countries values("JP","396");
insert into dot11Countries values("JP","397");
insert into dot11Countries values("JP","4006");
insert into dot11Countries values("JP","4007");
insert into dot11Countries values("JP","4008");
insert into dot11Countries values("JP","4009");
insert into dot11Countries values("JP","4010");
insert into dot11Countries values("JP","4011");
insert into dot11Countries values("JP","4012");
insert into dot11Countries values("JP","4013");
insert into dot11Countries values("JP","4014");
insert into dot11Countries values("JP","4015");
insert into dot11Countries values("JP","4016");
insert into dot11Countries values("JP","4017");
insert into dot11Countries values("JP","4018");
insert into dot11Countries values("JP","4019");
insert into dot11Countries values("JP","4020");
insert into dot11Countries values("JP","4021");
insert into dot11Countries values("JP","4022");
insert into dot11Countries values("JP","4023");
insert into dot11Countries values("JP","4024");
insert into dot11Countries values("JP","4025");
insert into dot11Countries values("JP","4026");
insert into dot11Countries values("JP","4027");
insert into dot11Countries values("JP","4028");
insert into dot11Countries values("JP","4029");
insert into dot11Countries values("JP","4030");
insert into dot11Countries values("JP","4031");
insert into dot11Countries values("JP","4032");
insert into dot11Countries values("JP","4033");
insert into dot11Countries values("JP","4034");
insert into dot11Countries values("JP","4035");
insert into dot11Countries values("JP","4036");
insert into dot11Countries values("JP","4037");
insert into dot11Countries values("JP","4038");
insert into dot11Countries values("JP","4039");
insert into dot11Countries values("JP","4040");
insert into dot11Countries values("JP","4041");
insert into dot11Countries values("JP","4042");
insert into dot11Countries values("JP","4043");
insert into dot11Countries values("JP","4044");
insert into dot11Countries values("JP","4045");
insert into dot11Countries values("JP","4046");
insert into dot11Countries values("JP","4047");
insert into dot11Countries values("JP","4048");
insert into dot11Countries values("JP","4049");
insert into dot11Countries values("JP","4050");
insert into dot11Countries values("JP","4051");
insert into dot11Countries values("JP","4052");
insert into dot11Countries values("JP","4053");
insert into dot11Countries values("JP","4054");
insert into dot11Countries values("JP","4055");
insert into dot11Countries values("JP","4056");
insert into dot11Countries values("JP","4057");
insert into dot11Countries values("JP","4058");
insert into dot11Countries values("JP","4059");
insert into dot11Countries values("JO","400");
insert into dot11Countries values("KZ","398");
insert into dot11Countries values("KE","404");
insert into dot11Countries values("KP","408");
insert into dot11Countries values("KR","410");
insert into dot11Countries values("KR","412");
insert into dot11Countries values("KW","414");
insert into dot11Countries values("LV","428");
insert into dot11Countries values("LB","422");
insert into dot11Countries values("LY","434");
insert into dot11Countries values("LI","438");
insert into dot11Countries values("LT","440");
insert into dot11Countries values("LU","442");
insert into dot11Countries values("MO","446");
insert into dot11Countries values("MK","807");
insert into dot11Countries values("MY","458");
insert into dot11Countries values("MT","470");
insert into dot11Countries values("MX","484");
insert into dot11Countries values("MC","492");
insert into dot11Countries values("MA","504");
insert into dot11Countries values("NL","528");
insert into dot11Countries values("AN","530");
insert into dot11Countries values("NZ","554");
insert into dot11Countries values("NI","558");
insert into dot11Countries values("NO","578");
insert into dot11Countries values("OM","512");
insert into dot11Countries values("PK","586");
insert into dot11Countries values("PA","591");
insert into dot11Countries values("PY","600");
insert into dot11Countries values("PE","604");
insert into dot11Countries values("PH","608");
insert into dot11Countries values("PL","616");
insert into dot11Countries values("PT","620");
insert into dot11Countries values("PR","630");
insert into dot11Countries values("QA","634");
insert into dot11Countries values("RO","642");
insert into dot11Countries values("RU","643");
insert into dot11Countries values("SA","682");
insert into dot11Countries values("CS","891");
insert into dot11Countries values("SG","702");
insert into dot11Countries values("SK","703");
insert into dot11Countries values("SI","705");
insert into dot11Countries values("ZA","710");
insert into dot11Countries values("ES","724");
insert into dot11Countries values("LK","114");
insert into dot11Countries values("SE","752");
insert into dot11Countries values("CH","756");
insert into dot11Countries values("SY","760");
insert into dot11Countries values("TW","158");
insert into dot11Countries values("TH","764");
insert into dot11Countries values("TT","780");
insert into dot11Countries values("TN","788");
insert into dot11Countries values("TR","792");
insert into dot11Countries values("AE","784");
insert into dot11Countries values("UA","804");
insert into dot11Countries values("GB","826");
insert into dot11Countries values("US","840");
insert into dot11Countries values("US","841");
insert into dot11Countries values("PS","842");
insert into dot11Countries values("UY","858");
insert into dot11Countries values("UZ","860");
insert into dot11Countries values("VE","862");
insert into dot11Countries values("VN","704");
insert into dot11Countries values("YE","887");
insert into dot11Countries values("ZW","716");
insert into dot11Countries values("PE","999");
insert into dot11Countries values("DK","208");
CREATE TABLE dot11Radio11n
    (
	radioNo integer NOT NULL,
    chanWidth integer NOT NULL,
    puren integer NOT NULL,                 -- 0 (Disable)/ 1 (Enable)
    mimoPreamble  integer NOT NULL,         -- 0 (for MM) / 1 (for GF)
    txAntennas  integer NOT NULL,
    rxAntennas  integer NOT NULL,
    ampdu  integer NOT NULL,
    beamforming  integer NOT NULL,
    VoW  integer NOT NULL,
    pure11ac integer NOT NULL,
	PRIMARY KEY (radioNo),
    FOREIGN KEY (radioNo) REFERENCES dot11Radio(radioNo)    
    );

insert into tableDefaults values ("dot11Radio11n","chanWidth","2040","","");
insert into tableDefaults values ("dot11Radio11n","txAntennas","0","","");
insert into tableDefaults values ("dot11Radio11n","rxAntennas","0","","");
insert into tableDefaults values ("dot11Radio11n","ampdu","1","","");
insert into tableDefaults values ("dot11Radio11n","beamforming","0","","");
insert into tableDefaults values ("dot11Radio11n","VoW","0","","");
insert into tableDefaults values ("dot11Radio11n","pure11ac","0","","");

CREATE TABLE dot11nRates
    (
	vapName  text NOT NULL,
    PRIMARY KEY (vapName),
    FOREIGN KEY (vapName) REFERENCES dot11VAP(vapName)
    );

insert into saveTables (tableName) values("system");
insert into saveTables (tableName) values("FactoryStatus");
insert into saveTables (tableName) values("systemConfig");

--wireless
insert into saveTables (tableName) values("dot11GlobalConfig");
insert into saveTables (tableName) values("dot11Card");
insert into saveTables (tableName) values("dot11Radio");
insert into saveTables (tableName) values("dot11Interface");
insert into saveTables (tableName) values("dot11AuthorizedAP");
insert into saveTables (tableName) values("dot11Profile");
insert into saveTables (tableName) values("dot11VAP");
insert into saveTables (tableName) values("dot11Radio11n");
insert into saveTables (tableName) values("dot11ACL");
insert into saveTables (tableName) values("dot11IAPPRemoteAP");
insert into saveTables (tableName) values("dot11WPS");
insert into saveTables (tableName) values("dot11WDSPeers");
insert into saveTables (tableName) values("bridgeTable");
insert into saveTables (tableName) values("bridgePorts");
insert into saveTables (TableName) values("VlanPortMgmt");
insert into saveTables (TableName) values("vlan");
insert into saveTables (TableName) values("vlanCfgLoad");
insert into saveTables (TableName) values("VlanStatus");
insert into saveTables (tableName) values("wanRestartonTrunkUpdate");
insert into saveTables (tableName) values("DefaultIfGrpInfo");
insert into saveTables (tableName) values("ethernet");
insert into saveTables (tableName) values("ifStatic");
insert into saveTables (tableName) values("DhcpfixedIpAddress");
insert into saveTables (tableName) values("DhcpLdapServerInfo");
insert into saveTables (tableName) values("IPsecDhcpClientIPRange");
insert into saveTables (tableName) values("dhcp");
insert into saveTables (TableName) values("PortMgmt");
insert into saveTables (TableName) values("PortMirroring");
insert into saveTables (tableName) values("crontab");
insert into saveTables (tableName) values("Dhcpc");
insert into saveTables (tableName) values("NimfMtu");
insert into saveTables (tableName) values("NimfMac");
insert into saveTables (tableName) values("WanMode");
insert into saveTables (tableName) values("WanFailure");
insert into saveTables (tableName) values("NimfConf");
insert into saveTables (tableName) values("WanIfNameMap");
insert into saveTables (tableName) values("Pppoe");
insert into saveTables (tableName) values("PppoeProfile");
insert into saveTables (tableName) values("L2tp");
insert into saveTables (tableName) values("Pptp");
insert into saveTables (tableName) values("radiusClient");
insert into saveTables (tableName) values("ServicesRouteMgmt");
insert into saveTables (tableName) values("POPCAFiles");
insert into saveTables (tableName) values("POPProfiles");
insert into saveTables (tableName) values("NTDomainSettings");
insert into saveTables (tableName) values("ActiveDirectorySettings");
insert into saveTables (tableName) values("LDAPSettings");
insert into saveTables (tableName) values("pptpServerIPRange");
insert into saveTables (tableName) values("pptpServerUsers");
insert into saveTables (tableName) values("Xl2tpServerIPRange");
insert into saveTables (tableName) values("Xl2tpActiveUsers");
insert into saveTables (tableName) values("ThreeG");
insert into saveTables (tableName) values("smsEvents");
insert into saveTables (tableName) values("DualPppoe");
insert into saveTables (tableName) values("ifStaticAliasAddrTbl");
insert into saveTables (tableName) values("networkInfo");
insert into saveTables (tableName) values("ntpDefServers");
insert into saveTables (tableName) values("ntp");
insert into saveTables (tableName) values("manualTime");
insert into saveTables (tableName) values("x509DbUpdateFlag");
insert into saveTables (tableName) values("x509SelfCertReq");
insert into saveTables (tableName) values("cert");
insert into saveTables (tableName) values("snmpTrap");
insert into saveTables (tableName) values("snmpAccessControl");
insert into saveTables (tableName) values("snmpv3Users");
insert into saveTables (tableName) values("smtpServer");
insert into saveTables (tableName) values("emailLogs");
insert into saveTables (tableName) values("sysLogInfo");
insert into saveTables (tableName) values("logEventEmailConfig");
insert into saveTables (tableName) values("upnp");
insert into saveTables (tableName) values("Rip");
--insert into saveTables (tableName) values("Ripng");
insert into saveTables (tableName) values("Igmp");
insert into saveTables (tableName) values("igmpPortMap");
insert into saveTables (tableName) values("igmpSnooping");
insert into saveTables (tableName) values("allowedNets");
insert into saveTables (tableName) values("route");
insert into saveTables (tableName) values("route6");
insert into saveTables (tableName) values("LanGroup");
--insert into saveTables (tableName) values("LanHost");
insert into saveTables (tableName) values("PortTriggering");
insert into saveTables (tableName) values("AttackChecks");
insert into saveTables (tableName) values("AttackChecks6");
insert into saveTables (tableName) values("RemoteSnmp");
insert into saveTables (tableName) values("IcsaSettings");
insert into saveTables (tableName) values("GlobalSettings");
insert into saveTables (tableName) values("FwTrafficMeter");
insert into saveTables (tableName) values("TrafficCounters");
insert into saveTables (tableName) values("TrafficStatistics");
insert into saveTables (tableName) values("FwDosAttackSettings");
insert into saveTables (tableName) values("IPMACBinding");
insert into saveTables (tableName) values("MACFiltering");
insert into saveTables (tableName) values("SourceMACAddress");
insert into saveTables (tableName) values("ContentFiltering");
insert into saveTables (tableName) values("BlockSites");
insert into saveTables (tableName) values("TrustedDomains");
insert into saveTables (tableName) values("WebComponents");
insert into saveTables (tableName) values("siteCategory");
insert into saveTables (tableName) values("urlFilteringAccessControl");
insert into saveTables (tableName) values("urlFilteringAccessControlPolicy");
insert into saveTables (tableName) values("NatTable");
insert into saveTables (tableName) values("ZoneTypes");
insert into saveTables (tableName) values("Zones");
insert into saveTables (tableName) values("Schedules");
insert into saveTables (tableName) values("Services");
insert into saveTables (tableName) values("L2Services");
insert into saveTables (tableName) values("BwMonStat");
insert into saveTables (tableName) values("FirewallRules");
insert into saveTables (tableName) values("L2FirewallRules");
insert into saveTables (tableName) values("fwPriorityMap");
insert into saveTables (tableName) values("IntelAmt");
insert into saveTables (tableName) values("ProtocolBinding");
insert into saveTables (tableName) values("L2BandWidthProfileStatus");
insert into saveTables (tableName) values("L2BandWidthProfile");
insert into saveTables (tableName) values("L2BandWidthProfileSpeed");
insert into saveTables (tableName) values("L2TrafficSelector");
insert into saveTables (tableName) values("BandWidthProfileStatus");
insert into saveTables (tableName) values("BandWidthProfile");
insert into saveTables (tableName) values("BandWidthProfileSpeed");
insert into saveTables (tableName) values("TrafficSelector");
insert into saveTables (tableName) values("webAccessStatus");
insert into saveTables (tableName) values("webAccessInfo");
insert into saveTables (tableName) values("accessMgmt");
insert into saveTables (tableName) values("httpsMgmt");
insert into saveTables (tableName) values("SSLVPNPortalLayout");
insert into saveTables (tableName) values("USERDBDomains");
--insert into saveTables (tableName) values("USERDBGroups");
--insert into saveTables (tableName) values("USERDBUsers");
insert into saveTables (tableName) values("UserGroups");
insert into saveTables (tableName) values("Users");
insert into saveTables (tableName) values("GETUSERSDb");
insert into saveTables (tableName) values("interfaceStatsParams");
insert into saveTables (tableName) values("ddns");
insert into saveTables (tableName) values("ddnsStatus"); 
insert into saveTables (tableName) values("DhcpLeasedClients");
insert into saveTables (tableName) values("IpsecIKEPolicy");
insert into saveTables (tableName) values("IpsecVPNPolicy");
insert into saveTables (tableName) values("IpsecModeConfig");
insert into saveTables (tableName) values("IpsecLocalTrafficSelectorMapping");
insert into saveTables (tableName) values("SplitDns");
insert into saveTables (tableName) values("XAuthUsers");
insert into saveTables (tableName) values("FirewallLogs");
insert into saveTables (tableName) values("FirewallLogs6");
insert into saveTables (tableName) values("OtherSystemLogs");
insert into saveTables (tableName) values ("IPSConfig");
insert into saveTables (tableName) values ("IPSNetworkSegments");
insert into saveTables (tableName) values("dhcpv6c");
insert into saveTables (tableName) values("dhcpv6s");
insert into saveTables (tableName) values("ipv6Interfaces");
insert into saveTables (tableName) values("dhcpv6sLANAddrPool");
insert into saveTables (tableName) values("dhcpv6sLANPrefixPool");
insert into saveTables (tableName) values("radvd");
insert into saveTables (tableName) values("radvdLANPrefixPool");
insert into saveTables (tableName) values("sixToFourTunnel");
insert into saveTables (tableName) values("isatapTunnel");
insert into saveTables (tableName) values("DscpClassList");
insert into saveTables (tableName) values("L2DscpClassList");
--insert into saveTables (tableName) values("mldproxy");
insert into saveTables (tableName) values("FirewallRules6");
insert into saveTables (tableName) values("fwPriorityMap6");
insert into saveTables (tableName) values("L2FirewallDefaultPolicy");
insert into saveTables (tableName) values("fwDefaultOutBoundPolicy");
insert into saveTables (tableName) values("DhcpRelay");
--insert into saveTables (tableName) values("AttackChecks6");
--insert into saveTables (tableName) values("DOT1PState");
--insert into saveTables (tableName) values("DOT1PrioDscpMap");
--insert into saveTables (tableName) values("DOT1PrioQueueMap");
insert into saveTables (tableName) values("interVLANRouting");
insert into saveTables (tableName) values("interVLAN");
insert into saveTables (tableName) values("DnsStaticHostsMapping");
--Captive Portal
insert into saveTables (tableName) values("CaptivePortal");
insert into saveTables (tableName) values("CaptivePortalVlan");
insert into saveTables (tableName) values("CaptivePortalPageDetails");
insert into saveTables (tableName) values("ImageDetails");
insert into saveTables (tableName) values("LoginImageDetails");
insert into saveTables (tableName) values("pageBackgroundImage");
insert into saveTables (tableName) values("CPAccConf");
insert into saveTables (tableName) values("CPAccInfoIP");
insert into saveTables (tableName) values("CPAccInfoUserAccount");
insert into saveTables (tableName) values("CPAccUserAccountExtend");
insert into saveTables (tableName) values("authServers");
insert into saveTables (tableName) values("tempCPUserProfiles");
insert into saveTables (tableName) values("tempUsers");
insert into saveTables (tableName) values("blockMAC");

-- accounting 
insert into saveTables (tableName) values("userAccountingEnable");
insert into saveTables (tableName) values("radAcctRouteTbl");
insert into saveTables (tableName) values("radAuthTbl");
insert into saveTables (tableName) values("radAuthConf");
--Intel Amt
insert into saveTables (tableName) values("IntelAmtPorts");
insert into saveTables (tableName) values("IntelAmtStart");

--PPPoE6
insert into saveTables (tableName) values("Pppoe6");
insert into tableDefaults values ("Pppoe6", "PppoeSessions", "1", "1", "2");

--GRE 
insert into saveTables (tableName) values("GRE");

--cdp
--Entries need to be presented in both saveTables & saveTables2. 
--insert into saveTables (tableName) values("cdpPortCtrl");
--insert into saveTables (tableName) values("cdpGlobalCtrl");
--insert into saveTables2 (tableName) values("cdpPortCtrl");
--insert into saveTables2 (tableName) values("cdpGlobalCtrl");

insert into saveTables (tableName) values("oidRecord");
--insert into saveTables (tableName) values("tr069Config");

/*--verisign 2fctr authentication
insert into saveTables (tableName) values("vsign2fctrConfigTbl");
insert into saveTables (tableName) values("vsign2fctrCertificate");
insert into saveTables (tableName) values("vsign2fctrCredMgmt");
*/
-- SSLVPN

insert into saveTables (tableName) values("USB_MNT");
insert into saveTables (tableName) values("USB");
insert into saveTables (tableName) values("SharePortVlan");
--insert into saveTables (tableName) values("SSLVPNUserLoginPolicyDefinedAddress");
--insert into saveTables (tableName) values("SSLVPNUserLoginPolicyDefinedBrowser");
insert into saveTables (tableName) values("SessionSettings");
insert into saveTables (tableName) values("userDashboardCustomization");
insert into saveTables (tableName) values("GroupAccessControl");
insert into saveTables (tableName) values("AccessControlUserGroupPolicyBrowser");
insert into saveTables (tableName) values("AccessControlUserGroupPolicyIPAddress");
insert into saveTables (tableName) values("SSLVPNResource");
insert into saveTables (tableName) values("SSLVPNResourceObject");
insert into saveTables (tableName) values("SSLVPNPolicy");
insert into saveTables (tableName) values("SSLVPNClientConf");
insert into saveTables (tableName) values("SSLVPNClientRoute");
insert into saveTables (tableName) values("SSLVPNPortForwardingAppsMap");
insert into saveTables (tableName) values("SSLVPNPortForwardingFQDNMap");
insert into saveTables (tableName) values("ConfigPort");

-- Login
insert into saveTables (tableName) values("LoginProfiles");

insert into saveTables (tableName) values("AlgConf");
--insert into saveTables (tableName) values("urlFilterConfig");
--insert into saveTables (tableName) values("urlFilterCategoryConfig");
--insert into saveTables (tableName) values("urlFilterBusinessHour");
--insert into saveTables (tableName) values("urlFilterUrlWhiteList");
--insert into saveTables (tableName) values("urlFilterClientWhiteList");
--insert into saveTables (tableName) values("urlFilterWebComponent");
--insert into saveTables (tableName) values("urlFilterBlockedKeyword");

--SIP status table
--insert into saveTables (tableName) values("SipStatusCtrl");



insert into saveTables (tableName) values("GettingStarted");
insert into saveTables (tableName) values("logConfig");
insert into saveTables (tableName) values("OneToOneNat");
insert into saveTables (tableName) values("OneToOneNatService");
insert into saveTables (tableName) values("Dmz");
insert into saveTables (tableName) values("OpenvpnCertificates");
insert into saveTables (tableName) values("OpenVpnLanRoutes");
insert into saveTables (tableName) values("OpenVpnGwRoutes");
insert into saveTables (tableName) values("OpenVpn");
--insert into saveTables (tableName) values("SslvpnEnable");
insert into saveTables (tableName) values("ifStaticIPAlias");
insert into saveTables (tableName) values("smtpAlg");
insert into saveTables (tableName) values("approvedMailIdList");
insert into saveTables (tableName) values("blockedMailIdList");
insert into saveTables (tableName) values("subjectList");
insert into saveTables (tableName) values("pptpClient");
insert into saveTables (tableName) values("l2tpVPNClient");
insert into saveTables (tableName) values("ConfigSupport");

--PowerMode Related Table
insert into saveTables (tableName) values("PowerModeConf");
--insert into saveTables (tableName) values("eventLog");

--OSPF realted Table
insert into saveTables (tableName) values("ospf");
insert into saveTables (tableName) values("ospf6");

--Multicast to unicast table
insert into saveTables (tableName) values("MulToUni");

--facebook Wifi table
insert into saveTables (tableName) values("fbwifi");
insert into saveTables (tableName) values("fbwifivlan");

--sessionLimitProfiles table
insert into saveTables (tableName) values("sessionLimitProfiles");
insert into saveTables (tableName) values("warningMessage");
insert into saveTables (tableName) values("sessionLimitProfileStats");

--PPTP Server Related Entry
insert into environment (name, value) values("PPTP_ACTIVE_USERS_UPDATE_PROGRAM", "/pfrm2.0/bin/pptpdDisplayUserDetails");
insert into environment (name, value) values("xl2tpdDisplayUserDetails", "/pfrm2.0/bin/xl2tpdDisplayUserDetails");



insert into environment (name, value) values("NVRAM_DHCPV6C_LEASES_FILE_WAN1",
                                             "");
insert into environment (name, value) values("NVRAM_DHCPV6C_LEASES_FILE_WAN1PPPOE6",
                                             "");
insert into environment (name, value) values("NVRAM_DHCPV6C_FLASH_STORE_DIR",
                                             "/flash/tmp/");
insert into environment (name, value) values("NVRAM_DHCPV6C_LEASES_FILE_WAN2PPPOE6",
                                             "");
--dhcpv6 client/server related entries
insert into environment (name, value) values("NVRAM_DHCPV6C_DUID","/flash/tmp/dhcp6c_duid");
insert into environment (name, value) values("NVRAM_DHCPV6S_LEASES_FILE","/flash/tmp/server6.leases");
insert into environment (name, value) values("NVRAM_DHCPV6S_FLASH_STORE_DIR","/flash/tmp/");
insert into environment (name, value) values("NVRAM_DHCPV6S_DUID","/flash/tmp/dhcp6s_duid");                                        
insert into environment (name, value) values("TEAMF1_CFG_ASCII", "/tmp/teamf1.cfg.ascii");
insert into environment (name, value) values("TEAMF1_CERT_FILE", "/pfrm2.0/etc/https.crt");
insert into environment (name, value) values("TEAMF1_KEY_FILE", "/pfrm2.0/etc/https.key");
insert into environment (name, value) values("TEAMF1_CFG_DEFAULTS_ASCII", "/var/teamf1.cfg.defaults.ascii");
insert into environment (name, value) values("PING_FILE_NAME", "/tmp/ping.output");
insert into environment (name, value) values("PRIVATE_ROUTE_FILE_NAME", "/tmp/privateRoute.output");
insert into environment (name, value) values("CFG_READ_PROGRAM", "/pfrm2.0/bin/readcfg.sh");
insert into environment (name, value) values("CFG_WRITE_PROGRAM", "/pfrm2.0/bin/writecfg.sh");
--insert into environment (name, value) values("CFG_READ_PROGRAM", "/pfrm2.0/bin/sffs r");
--insert into environment (name, value) values("CFG_WRITE_PROGRAM", "/pfrm2.0/bin/sffs w");

insert into environment (name, value) values("UPGRADE_PROGRAM", "/mnt/tmpfs/upgrade");
insert into environment (name, value) values("FACTORY_RESET_SCRIPT", "/bin/sh /pfrm2.0/bin/factoryDefault.sh");
insert into environment (name, value) values("TFTP_COMMAND_FORMAT", "/usr/bin/tftp -g -l %s -r %s %s");
insert into environment (name, value) values("REBOOT_PROGRAM", "/sbin/reboot");

insert into environment (name, value) values("USB_STATUS_CHECK_PROGRAM", "/pfrm2.0/bin/usbStatus.sh");
insert into environment (name, value) values("USB_MOUNT_PROGRAM", "/bin/mount");
insert into environment (name, value) values("USB_UNMOUNT_PROGRAM", "/bin/umount -l");
insert into environment (name, value) values("USB_STATUS_FILE1", "/var/usb_status1.txt");
insert into environment (name, value) values("USB_FILE_LIST1", "/var/usb_filelist1.txt");
insert into environment (name, value) values("USB_STATUS_FILE2", "/var/usb_status2.txt");
insert into environment (name, value) values("USB_FILE_LIST2", "/var/usb_filelist2.txt");

insert into environment (name, value) values("PING_PROGRAM", "/bin/ping -c 5");
insert into environment (name, value) values("PING6_PROGRAM", "/bin/ping6 -c 5");
insert into environment (name, value) values("VPN_PING_PROGRAM", "/pfrm2.0/bin/doPing 5 ");
insert into environment (name, value) values("IFDEVSTATS_PROGRAM", "/pfrm2.0/bin/ifDevUpdateStats");
insert into environment (name, value) values("IFDEVUSAGE_PROGRAM", "/pfrm2.0/bin/ifDevUsageRecord");

-- DSR-1000N is 20.3.1
--insert into environment (name, value) values("SNMP_SYSOBJID", "1.3.6.1.4.1.171.20.3.4");
insert into environment (name, value) values("IANA_ENTERPRISE_NUMBER","1127");
insert into environment (name, value) values("GET_BOOT_ENV", "/pfrm2.0/bin/fw_printenv");
insert into environment (name, value) values("SET_BOOT_ENV", "/pfrm2.0/bin/fw_setenv");
insert into environment (name, value) values("UPDATE_FIRMWARE_VERSION_PROGRAM","/pfrm2.0/bin/ShowFirm");
insert into environment (name, value) values("RADIUS_DICTIONARY", "/pfrm2.0/etc/radius.dict");
insert into environment (name, value) values("RADIUS_DEF_PORT", "1812");
insert into environment (name, value) values("RADIUS_DEF_TIMEOUT", "10");
insert into environment (name, value) values("RADIUS_DEF_RETRIES", "3");
insert into environment (name, value) values("LOG_FILE", "/tmp/logs.temp");
insert into environment (name, value) values("SMTPCLIENT_PATH","/pfrm2.0/bin/msmtp");
insert into environment (name, value) values("DEFAULT_USER_SHELL","/bin/sh");
insert into environment (name, value) values("EMAILLOGS_PROGRAM","/pfrm2.0/bin/emailLogs");
insert into environment (name, value) values("UPNP_REFRESH_PROGRAM",  "/pfrm2.0/bin/upnpShowConfig");
insert into environment (name, value) values("NIMFSTATUS_PROGRAM",  "/pfrm2.0/bin/nimfStatus");
insert into environment (name, value) values("LINKSTATUS_PROGRAM",  "/pfrm2.0/bin/linkStatusDetect");
insert into environment (name, value) values("LINKCHECK_PROGRAM",  "/pfrm2.0/bin/linkCheck");
insert into environment (name, value) values("LANGROUPS_CONFIG",  "/pfrm2.0/bin/langroupsConfig");
insert into environment (name, value) values("DHCP_VIEW",  "/pfrm2.0/bin/dhcpLeasesUpdate");
insert into environment (name, value) values("DDNS_VIEW",  "/pfrm2.0/bin/ddnsView"); 
insert into environment (name, value) values("PORTTRIG_STATUS_PROG", "/pfrm2.0/bin/portTriggerStatusConfig");
insert into environment (name, value) values("PFRM_BIN_PATH","/pfrm2.0/bin");
insert into environment (name, value) values("XAUTH_USER_ADD","/bin/ipsecuseradd");
insert into environment (name, value) values("XAUTH_USER_DEL","/bin/ipsecuserdel");
insert into environment (name, value) values("XAUTH_PASSWD","/bin/ipsecpasswd");
insert into environment (name, value) values("VIPSECURE_STATUS",  "/pfrm2.0/bin/vipsecureStatus"); 
insert into environment (name, value) values("TEAMF1_LUA_LIB_PATH", "/pfrm2.0/share/lua/5.1/teamf1lualib/"); 
insert into environment (name, value) values("FLASH_CFG_PARTITION", "/data/tmp/teamf1.cfg.ascii");
insert into environment (name, value) values("UPGRADEPREP_PROGRAM", "/pfrm2.0/bin/upgradePrep.sh");
insert into environment (name, value) values("BOOTENVSET_BIN","/bin/fw_setenv");
insert into environment (name, value) values("BOOTLOADER_FILENAME_VAR","filename");
insert into environment (name, value) values("BOOTENVREAD_BIN","/bin/fw_printenv");
insert into environment (name, value) values("BOOTLOADER_FILEPATH_VAR","filepath");
insert into environment (name, value) values("BOOTENVSET_SCRIPT","/pfrm2.0/bin/setBootEnv.sh");
--insert into environment (name, value) values("UPGRADE_SCRIPT","/pfrm2.0/bin/upgrade.sh");
insert into environment (name, value) values("BOOTENVGET_SCRIPT","/pfrm2.0/bin/getBootEnv.sh");;
insert into environment (name, value) values("CONFIG_PORT_UPDATE", "/pfrm2.0/bin/configPortUpdate /tmp/system.db 23 ConfigPort 1"); 
insert into environment (name, value) values("DOT11_MAX_ASSOC_CLIENTS","128");
insert into environment (name, value) values("WLAN_CONNECTED_CLIENTS_LIST", "/pfrm2.0/bin/wlanClientStatus");
insert into environment (name, value) values("WPS_PROGRAM", "/bin/wsccmd");
insert into environment (name, value) values("IPV6_GW_UPDATE","/pfrm2.0/bin/iprouteIPv6GwAdd");
-- Traceroute program for diagnostics. -m defines max # hops
insert into environment (name, value) values("TRACEROUTE_PROGRAM",  "/pfrm2.0/bin/traceroute -m 10");
insert into environment (name, value) values("TRACE_ROUTE_FILE_NAME","/tmp/traceroute.output");
insert into environment (name, value) values("TIMEZONECHANGESCRIPT","/pfrm2.0/bin/timezonechangescript.sh");
insert into environment (name, value) values("NTP_CUSTOM_SERVER1","0.us.pool.ntp.org");
insert into environment (name, value) values("NTP_CUSTOM_SERVER2","1.us.pool.ntp.org");
insert into environment (name, value) values("HW_CACHE_RESET","/pfrm2.0/bin/ResetCache");
insert into environment (name, value) values("HW_OFFLOAD_PROC_ENTRY","/proc/sys/hardware_offload_control");
insert into environment (name, value) values("HW_OFFLOAD_SCRIPT","/pfrm2.0/etc/hardwareOffload.lua");
insert into environment (name, value) values("HW_OFFLOAD_BRCM_ENTRY","/pfrm2.0/bin/syshandler offload_brcmtag_enabled ");
insert into environment (name, value) values("HW_OFFLOAD_VLAN_ENTRY","/pfrm2.0/bin/syshandler offload_vlan_enabled ");
insert into environment (name, value) values("HW_NATTING_CTRL_COMMAND","/pfrm2.0/bin/sppe_ioctl sppe");

--To get the usage report
insert into ifUsageReportConfig values(2,4); 

-- DNS Lookup program for diagnostics
insert into environment (name, value) values("NSLOOKUP_PROGRAM",  "/usr/bin/nslookup");

-- Route program for diagnostics
insert into environment (name, value) values("ROUTE_PROGRAM",  "/sbin/route -n");
insert into environment (name, value) values("ROUTE6_PROGRAM",  "/sbin/route -A inet6 -n");
insert into environment (name, value) values("ROUTE_PATH",  "/sbin/");
insert into environment (name, value) values("PRIVATE_ROUTE_PROGRAM",  "/bin/ip route list table local scope global");
--switch device table
insert into SwitchDevice values (0, "/dev/bcm53980");

--SSLVPN and VPN logs
insert into environment (name, value) values("SSLVPN_CONFIG","/pfrm2.0/sslvpn/bin/sslvpnConfig");
insert into environment (name, value) values("VPN_LOG_FILE_NAME","/var/racoon.log");

--System Default user as a global variable, make sure that this field is updated accordingly
insert into environment (name, value) values("DEFAULT_SYSTEM_USER", "admin");

--cpumemusage
insert into environment (name, value) values("MEM_USAGE_SCRIPT", "/pfrm2.0/bin/mem.sh");

insert into environment (name, value) values("CPU_USAGE_SCRIPT", "/pfrm2.0/bin/cpu.sh");


--Status tables
insert into NimfStatus( LogicalIfName, AddressFamily, Nimfstatus, Linkstatus, WanUpTime)values("WAN1", 2,"Not Yet Available", "LINK DOWN", "Not Yet Available");
insert into NimfStatus( LogicalIfName, AddressFamily, Nimfstatus, Linkstatus, WanUpTime)values("WAN1", 10,"Not Yet Available", "LINK DOWN", "Not Yet Available");
insert into NimfStatus( LogicalIfName,AddressFamily,Nimfstatus,Linkstatus,WanUpTime)values("LAN", 2,"Not Yet Available","LINK DOWN","Not Yet Available");
insert into NimfStatus( LogicalIfName, AddressFamily, Nimfstatus,Linkstatus,WanUpTime)values("LAN", 10,"Not Yet Available","LINK DOWN","Not Yet Available");
insert into DhcpStatus(LogicalIfName,DhcpServerIp,LeaseTime,LeaseObtained)values("WAN1","Not Yet Available","Not Yet Available","Not Yet Available");

insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/bridgeDBConfig",1,1,"bridgeTable", 0, 1,1,1);

insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/vlanDBConfig",1,1,"VlanStatus", 0, 1,0,0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/vlanDBConfig",1,1,"VlanPortMgmt", 0, 1,0,0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/vlanDBConfig",1,1,"vlanCfgLoad", 0, 0,1,0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/vlanDBConfig",1,1,"vlan", 0, 1,0,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/vlanDBConfig",0,1,"ConfigPort", 0, 1,1,0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/switchVlanDBConfig",1,1,"VlanStatus", 0, 1,1,0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/switchVlanDBConfig",1,1,"VlanPortMgmt", 0, 1,0,0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/switchVlanDBConfig",1,1,"vlan", 0, 1,0,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/switchVlanDBConfig",1,1,"vlanCfgLoad", 0, 0,1,0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/igmpConfig",1,1,"VlanPortMgmt", 0, 1,1,0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/bridgeDBConfig",1,1,"bridgePorts", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/dhcpConfig",0,1,"networkInterface", 0, 1,0,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/dhcpConfig",0,1,"ipAddressTable", 0, 1,0,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/pptpdConfig",0,1,"pptpServerIPRange", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/pptpdConfig",0,1,"networkInterface", 0, 1,0,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/pptpdConfig",0,1,"ipAddressTable", 0, 1,0,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/pptpdConfig",0,1,"dhcp", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/pptpdConfig",0,1,"radiusClient", 0, 1,0,0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/pptpdConfig",0,1,"LDAPSettings", 0, 1,0,0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/pptpdConfig",0,1,"POPProfiles", 0, 1,0,0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/pptpdConfig",0,1,"NTDomainSettings", 0, 1,0,0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/pptpdConfig",0,1,"ActiveDirectorySettings", 0, 1,0,0);
--insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/pptpdConfig",0,1,"USERDBUsers", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/pptpClientConfig",0,1,"pptpClientConnectionStatus", 0, 1,1,1);
insert into dbUpdateRegisterTbl values("UMI_COMP_PLATFORM",0,1,"pptpClientConnectionStatus", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/l2tpClientConfig",0,1,"l2tpClientConnectionStatus", 0, 1,1,1);
insert into dbUpdateRegisterTbl values("UMI_COMP_PLATFORM",0,1,"l2tpClientConnectionStatus", 0, 1,1,1);
insert into dbUpdateRegisterTbl values("UMI_COMP_PLATFORM",0,1,"pptpServerIPRange", 0, 1,1,1);
insert into dbUpdateRegisterTbl values("UMI_COMP_FIREWALL",0,1,"pptpServerIPRange", 0, 1,1,1);
insert into dbUpdateRegisterTbl values("UMI_COMP_PLATFORM",0,1,"pptpServerUsers", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/xl2tpdConfig",0,1,"Xl2tpServerIPRange", 0, 1,1,1);
--insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/xl2tpdConfig",0,1,"USERDBUsers", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/xl2tpdConfig",0,1,"networkInterface", 0, 1,0,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/xl2tpdConfig",0,1,"ipAddressTable", 0, 1,0,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/xl2tpdConfig",0,1,"dhcp", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/xl2tpdConfig",0,1,"radiusClient", 0, 1,0,0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/xl2tpdConfig",0,1,"LDAPSettings", 0, 1,0,0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/xl2tpdConfig",0,1,"POPProfiles", 0, 1,0,0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/xl2tpdConfig",0,1,"NTDomainSettings", 0, 1,0,0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/xl2tpdConfig",0,1,"ActiveDirectorySettings", 0, 1,0,0);
insert into dbUpdateRegisterTbl values("UMI_COMP_PLATFORM",0,1,"Xl2tpServerIPRange", 0, 1,1,1);
insert into dbUpdateRegisterTbl values("UMI_COMP_FIREWALL",0,1,"Xl2tpServerIPRange", 0, 1,1,1);
insert into dbUpdateRegisterTbl values("UMI_COMP_PLATFORM",0,1,"Xl2tpActiveUsers", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/portMgmtConfig",1,1,"PortMgmt", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/portMgmtConfig",1,1,"PortMirroring", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/upnpConfig",0,1,"networkInterface",0,1,0,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/upnpConfig",0,1,"ipAddressTable",0,1,0,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/x509Config",1,1,"cert", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/x509Config",1,1,"x509SelfCertReq", 0, 1,1,1);
insert into ifDevEventTbl values("bdg1","UMI_COMP_PLATFORM","/pfrm2.0/bin/ifDevUpdateMac /tmp/system.db ethernet bdg1",0,0,0,1,0,0,0);
insert into ifDevEventTbl values("bdgWAN1","UMI_COMP_PLATFORM","/pfrm2.0/bin/ifDevUpdateMac /tmp/system.db ethernet bdgWAN1",0,0,0,1,0,0,0);
insert into ifDevEventTbl values("eth1","UMI_COMP_PLATFORM","/pfrm2.0/bin/ifDevUpdateMac /tmp/system.db ethernet eth1",0,0,0,1,0,0,0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/dhcpConfig",1,1,"dhcp",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/dhcpConfig",1,1,"DhcpfixedIpAddress",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/dhcpConfig",1,1,"DhcpLdapServerInfo",0,1,0,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/dhcpConfig",1,1,"IPsecDhcpClientIPRange",0,1,0,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/upnpConfig",1,1,"upnp", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/ripConfig",1,1,"Rip", 0, 1,1,1);
--insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/ripngConfig",1,1,"Ripng", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/snmpConfig",1,1,"snmpTrap", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/snmpConfig",1,1,"system", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/snmpConfig",1,1,"snmpAccessControl", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/snmpConfig",1,1,"snmpv3Users", 0, 1,1,1);

insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/sshdConfig",1,1,"sshd", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"OpenVpnLanRoutes", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/openvpnConfig",1,1,"OpenVpnLanRoutes", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"OpenVpnGwRoutes", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/openvpnConfig",1,1,"OpenVpnGwRoutes", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"OpenVpn", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/openvpnConfig",1,1,"OpenVpn", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"OpenVpn", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"SslvpnEnable", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/igmpConfig",1,1,"Igmp", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/igmpConfig",1,1,"igmpPortMap", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/igmpConfig",1,1,"igmpSnooping", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/igmpConfig",0,1,"networkInterface", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/igmpConfig",1,1,"allowedNets", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/tcpdumpConfig",1,1,"tcpdump",0,1,1,1);
insert into ifDevEventTbl values("bdg1","UMI_COMP_PLATFORM","/pfrm2.0/bin/iprouteManageRoutes /tmp/system.db route",0,0,1,0,1,0,0);
insert into ifDevEventTbl values("bdgWAN1","UMI_COMP_PLATFORM","/pfrm2.0/bin/iprouteManageRoutes /tmp/system.db route",0,0,1,0,1,0,0);
insert into ifDevEventTbl values("eth1","UMI_COMP_PLATFORM","/pfrm2.0/bin/iprouteManageRoutes /tmp/system.db route",0,0,1,0,1,0,0);
-- ppp88 interface corresponds to l2tp vpn client
insert into ifDevEventTbl values("ppp88","UMI_COMP_PLATFORM","/pfrm2.0/bin/l2tpClientIfDevHandler /tmp/system.db",0,1,0,0,0,0,0);
insert into ifDevEventTbl values("ppp88","UMI_COMP_PLATFORM","/pfrm2.0/bin/ospfl2tpipsec /tmp/system.db ppp88",1,1,0,0,1,0,0);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"route", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/iprouteConfig",1,1,"route",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/iprouteAddRoutes",0,1,"networkInterface",0,1,0,1);
--insert into sshd values (22,2,"0.0.0.0",768,1,0,0,1,0,1,1,0);

--ips related
insert into dbUpdateRegisterTbl values ('UMI_COMP_PLATFORM', 0, 0, 'IPSNetworkSegments', 0, 1, 1, 1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/ipsDBConfig", 0, 1, "IPSNetworkSegments", 0, 1, 1, 1);
insert into dbUpdateRegisterTbl values ('UMI_COMP_PLATFORM', 0, 0, 'IPSConfig', 0, 1, 1, 1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/ipsDBConfig", 0, 1, "IPSConfig", 0, 1, 1, 1);

--dscp remark table


--8021p support

--QueueMap

-- Resource Untilization
insert into environment (name, value) values("RESOURCE_UTILITY_PROGRAM", "/pfrm2.0/bin/cpuMemUsage");

-- dhcp relay
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/dhcprelayConfig", 0, 1, "DhcpRelay", 0, 1, 1, 1);

-- dhcp relay
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/dhcprelayConfig", 0, 1, "networkInterface", 0, 1, 1, 1);

insert into networkInterface values ("bdg1", "LAN", "bdg1", "ifStatic", "", "bridge", 1500, "192.168.10.2", "255.255.255.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 1, 5, 0,1,1,1);

insert into networkInterface values ("eth1", "WAN1", "eth1", "dhcpc", "","ethernet", 1500, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 0, 5, 0,1,1,2);

insert into networkInterface values ("ppp101", "WAN1PPPOE2", "ppp101", "japanPppoe", "","ethernet", 1500, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 0, 5, 0,1,1,2);


insert into networkInterface values ("sit0", "sit0-WAN1", "sit0", "","", "tunnel", 1500, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 0, 5, 0,2,1 ,2); 


insert into networkInterface values ("ppp201", "WAN2PPPOE2", "ppp201", "japanPppoe", "","ethernet", 1500, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 0, 5, 0,1,1,2);

insert into networkInterface values ('ppp99','WAN1PPPOE6','ppp99','','pppoe6','ethernet',1500,'0.0.0.0','0.0.0.0','0.0.0.0','0.0.0.0','0.0.0.0',0,0,5,0,3,0,2);

insert into networkInterface values ('ppp1','WAN1PPPOE6','ppp1','','pppoe6','ethernet',1500,'0.0.0.0','0.0.0.0','0.0.0.0','0.0.0.0','0.0.0.0',0,0,5,0,3,0,2);

insert into networkInterface values ('ppp98','WAN2PPPOE6','ppp98','','pppoe6','ethernet',1500,'0.0.0.0','0.0.0.0','0.0.0.0','0.0.0.0','0.0.0.0',0,0,5,0,3,0,2);

insert into networkInterface values ('ppp2','WAN2PPPOE6','ppp2','','pppoe6','ethernet',1500,'0.0.0.0','0.0.0.0','0.0.0.0','0.0.0.0','0.0.0.0',0,0,5,0,3,0,2);


-- tr069 object record for static configurations
--insert into tr069ObjectRecord values ("InternetGatewayDevice.LANDevice.", 1, "networkInterface", "LogicalIfName", 1, 1); 
--insert into tr069ObjectRecord values ("InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.IPInterface.", 1, "ifStatic", "LogicalIfName", 1, 1);

insert into NimfTrigger values (1, "WAN1",2, 0);
insert into NimfTrigger values (2, "WAN1",10, 0);
insert into NimfLBStatus values("",0);
insert into NimfAFStatus values("",0);
insert into MacTable values ("WAN1", 0);

insert into interfaceStats values("bdg1",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0); 
insert into interfaceStats values("bdgWAN1",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0); 
insert into interfaceStats values("eth1",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
insert into interfaceStats values("ppp1",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0); 
insert into interfaceStats values("ppp2",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0); 
insert into SystemStatistics values(0, 0,0,0,0,0, 0,0,0,0,0);
insert into tableMaxRecords values ("radiusClient", 4);
-- system facility
insert into compFacilityMap values ("UMI_COMP_NTP", 3);
insert into compFacilityMap values ("UMI_COMP_IFDEV", 18);
insert into compFacilityMap values ("UMI_COMP_USERDB", 3);
insert into compFacilityMap values ("UMI_COMP_SSLVPN", 19);
-- insert into compFacilityMap values ("UMI_COMP_USB", 3);
insert into compFacilityMap values ("UMI_COMP_LOGIN", 3);
insert into compFacilityMap values ("UMI_COMP_FIREWALL", 21);
insert into compFacilityMap values ("UMI_COMP_DHCPC", 3);
insert into compFacilityMap values ("UMI_COMP_VIPSECURE", 19);
insert into compFacilityMap values ("UMI_COMP_NIMF", 3);
insert into compFacilityMap values ("UMI_COMP_CAPTIVEPORTAL", 21);

--cdp 
--handling cdpPortCtrl events only on the updates and not on the inserts
--handling cdpGlobalCtrl events on the updates as well as inserts. 
--handling dot11Interface events only on the updates.

--insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"cdpPortCtrl",0,1,0,0);
--insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"cdpGlobalCtrl",0, 1,1,0);
--insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"dot11Interface",0, 1,0,0);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"ConfigPort",0, 1,1,0);

--insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/cdpConfig",1,1,"cdpPortCtrl",0,1,0,1);
--insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/cdpConfig",1,1,"cdpGlobalCtrl",0,1,1,1);
--insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/cdpConfig",1,1,"VlanStatus", 0, 1,0,0);
--insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/cdpConfig",1,1,"dot11VAP", 0, 1,1,0);
--insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/cdpConfig",1,1,"dot11Interface", 0, 1,0,0);
--insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/cdpConfig",1,1,"VlanPortMgmt", 0, 1,0,0);
--insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/cdpConfig",1,1,"ipAddressTable", 0, 1,0,0);
--insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/cdpConfig",1,1,"ConfigPort", 0, 1,1,0);

--bandwidth profile registration
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/bwLimitConfig",1,1,"BandWidthProfile",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/bwLimitConfig",1,1,"BandWidthProfileStatus",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/bwLimitConfig",1,1,"TrafficSelector",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/bwLimitConfig",1,1,"L2BandWidthProfile",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/bwLimitConfig",1,1,"L2BandWidthProfileStatus",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/bwLimitConfig",1,1,"L2TrafficSelector",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/bwLimitConfig",1,1,"L2BandWidthProfileSpeed",0,1,1,1);

-- ddns program 
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/ddnsConfig",1,1,"ddns",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/ddnsConfig",0,1,"networkInterface",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/ddnsConfig",1,1,"NimfAFStatus",0,1,1,1);

-- vipsecure program
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/vipsecureConfig",1,1,"IpsecVPNPolicy",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/vipsecureConfig",1,1,"ipAddressTable",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/vipsecureConfig",1,1,"XAuthUsers",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/vipsecureConfig",1,1,"ConnectionStatus",0,1,0,0);
--insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/vipsecureConfig",1,1,"NimfAFStatus",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/vipsecureConfig",1,1,"radiusClient",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/vipsecureConfig",1,1,"IpsecIKEPolicy",0,0,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/quickVpnMgmtConfig",1,1,"QuickVPNUsersStatus",0,1,1,1);

-- urlfilter
--insert into urlFilterProxy values ("/pfrm2.0/bin/havp","/tmp/havp.conf","","",8080);


-- static configuration table
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",0,1,"ifStatic", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",0,1,"ifStaticAliasAddrTbl", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/ipv6LanUp",0,1,"ifStatic",5,0,1,0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/ifStaticTblManage",0,1,"ifStatic",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/ifStaticTblManage",0,1,"ifStaticAliasAddrTbl",1,1,1,1);
insert into ifDevEventTbl values ('bdgWAN1',"UMI_COMP_PLATFORM","/pfrm2.0/bin/ifStaticIfDevHandler /tmp/system.db ifStatic",0,0,1,0,0,0,0);
insert into ifDevEventTbl values ('bdg1' ,"UMI_COMP_PLATFORM","/pfrm2.0/bin/ifStaticIfDevHandler /tmp/system.db ifStatic",0,0,1,0,0,0,0);
insert into ifDevEventTbl values ('bdgWAN1',"UMI_COMP_PLATFORM","/pfrm2.0/bin/ifStaticIfDevHandler /tmp/system.db ifStaticAliasAddrTbl",0,0,1,0,0,0,0);
insert into ifDevEventTbl values ('eth1',"UMI_COMP_PLATFORM","/pfrm2.0/bin/ifStaticIfDevHandler /tmp/system.db ifStatic",0,0,1,0,0,0,0);
insert into ifDevEventTbl values ('bdg1' ,"UMI_COMP_PLATFORM","/pfrm2.0/bin/ifStaticIfDevHandler /tmp/system.db ifStaticAliasAddrTbl",0,0,1,0,0,0,0);

-- Registration for networkInfo
insert into dbUpdateRegisterTbl values ('UMI_COMP_PLATFORM',0,1,'networkInfo',0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/ipModeConfig",0,1,"networkInfo", 0, 1,1,1);
 



-- Registering to ipAddressTable
insert into dbUpdateRegisterTbl values ('UMI_COMP_PLATFORM',0,1,'ipAddressTable',0,1,1,1);
insert into dbUpdateRegisterTbl values ('UMI_COMP_FIREWALL',0,1,'ipAddressTable', 0, 1,1,1);

insert into ipAddressTable values ('LAN' ,2,1,'0.0.0.0','0.0.0.0',0,'255.255.255.0');
insert into ipAddressTable values ('WAN1',2,0,'0.0.0.0','0.0.0.0',0,'255.255.255.0');
insert into ipAddressTable values ('DMZ' ,2,0,'0.0.0.0','0.0.0.0',0,'255.255.255.0');
insert into ipAddressTable values ('WAN2',2,0,'0.0.0.0','0.0.0.0',0,'255.255.255.0');
insert into ipAddressTable values ('L2TPoverIPSEC',2,0,'0.0.0.0','0.0.0.0',0,'255.255.255.0');

-- IPv6 Support
--

-- IPv6 address updates
insert into ifDevEventTbl values("bdg1","UMI_COMP_PLATFORM","/pfrm2.0/bin/ifDevUpdateIp6Addr /tmp/system.db ipAddressTable",0,0,0,0,0,1,0);
insert into ifDevEventTbl values("bdgWAN1","UMI_COMP_PLATFORM","/pfrm2.0/bin/ifDevUpdateIp6Addr /tmp/system.db ipAddressTable",0,0,0,0,0,1,0);
insert into ifDevEventTbl values("eth1","UMI_COMP_PLATFORM","/pfrm2.0/bin/ifDevUpdateIp6Addr /tmp/system.db ipAddressTable",0,0,0,0,0,1,0);
insert into ifDevEventTbl values("bdgWAN1","UMI_COMP_PLATFORM","/pfrm2.0/bin/ifDevUpdateIp6Addr /tmp/system.db ipAddressTable",0,0,1,0,0,0,0);
insert into ifDevEventTbl values("bdg1","UMI_COMP_PLATFORM","/pfrm2.0/bin/ifDevUpdateIp6Addr /tmp/system.db ipAddressTable",0,0,1,0,0,0,0);
insert into ifDevEventTbl values("eth1","UMI_COMP_PLATFORM","/pfrm2.0/bin/ifDevUpdateIp6Addr /tmp/system.db ipAddressTable",0,0,1,0,0,0,0);

-- 6to4 tunnel
insert into ifDevEventTbl values("sit0","UMI_COMP_PLATFORM","/pfrm2.0/bin/ifDevUpdateIp6Addr /tmp/system.db ipAddressTable",0,0,0,0,0,1,0);
insert into ifDevEventTbl values("sit0","UMI_COMP_PLATFORM","/pfrm2.0/bin/ifDevUpdateIp6Addr /tmp/system.db ipAddressTable",0,0,1,0,0,0,0);

-- resolver configuration table
insert into dbUpdateRegisterTbl values ('UMI_COMP_PLATFORM',0,0,'resolverConfig', 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/dproxyConfig",0,1,"resolverConfig", 0, 1,1, 1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/dproxyConfig",0,1,"system", 0, 1,0,0);
insert into resolverConfig values ("WAN1", 10, "", "","",""); 
insert into resolverConfig values ("WAN1", 2, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0"); 
insert into resolverConfig values ("WAN2", 10, "", "","",""); 
insert into resolverConfig values ("WAN2", 2, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0"); 


-- default routers table
insert into defaultRouters values ("WAN1", 2, "0.0.0.0", ""); 
insert into defaultRouters values ("WAN1", 10, "", ""); 
insert into defaultRouters values ("WAN2", 2, "0.0.0.0", ""); 
insert into defaultRouters values ("WAN2", 10, "", "");

--register all the components that require userdb here. One entry per user type
--of the component
insert into userdbRegistration values ("SSLVPN User", 0, "/pfrm2.0/bin/sslvpnConfig", "Radius-PAP,Radius-CHAP,Radius-MSCHAP,Radius-MSCHAPv2,NT Domain,Active Directory,LDAP");
insert into userdbRegistration values ("Xauth User", 5, "/pfrm2.0/bin/vipsecureConfig","");
insert into userdbRegistration values ("PPTP User", 8, "/pfrm2.0/bin/pptpdConfig", "");
insert into userdbRegistration values ("L2TP User", 7, "/pfrm2.0/bin/xl2tpdConfig", "");
insert into userdbRegistration values ("Captive Portal User", 10, "", "");
--insert into userdbRegistration values ("Samba", "", "", "");

-- default pptpClientConnectionStatus tables
insert into pptpClientConnectionStatus values (0,0,1,0);
insert into l2tpClientConnectionStatus values (0,0,1,0);

-- Registering for route6
insert into dbUpdateRegisterTbl values ('UMI_COMP_PLATFORM',0,1,'route6',0,1,1,1);
insert into dbUpdateRegisterProgram values ('/pfrm2.0/bin/iprouteConfig',0,1,'route6',0,1,1,1);
insert into ifDevEventTbl values("sit0","UMI_COMP_PLATFORM","/pfrm2.0/bin/iprouteManageRoutes /tmp/system.db route",0,0,1,0,1,0,0);

-- Registration for radvd 
insert into dbUpdateRegisterTbl values ('UMI_COMP_PLATFORM',0,1,'radvd',0,1,1,1);
insert into dbUpdateRegisterTbl values ('UMI_COMP_PLATFORM',0,1,'radvdLANPrefixPool',0,1,1,1);
insert into dbUpdateRegisterTbl values ('UMI_COMP_PLATFORM',0,1,'pppV6Interfaces',0,1,1,1);
insert into dbUpdateRegisterProgram values ('/pfrm2.0/bin/radvdConfig',0,1,'radvd',0,1,1,1);
insert into dbUpdateRegisterProgram values ('/pfrm2.0/bin/radvdLANPrefixPoolConfig',1,1,'radvdLANPrefixPool',0,1,1,1);
insert into dbUpdateRegisterProgram values ('/pfrm2.0/bin/radvd6to4PrefixRestart',0,1,'ipAddressTable',0,1,1,0);
insert into dbUpdateRegisterProgram values ('/pfrm2.0/bin/radvdPppIpv6PrefixConfig',0,1,'pppV6Interfaces',0,1,1,1);

-- Registration for DHCPv6
insert into dbUpdateRegisterTbl values ('UMI_COMP_PLATFORM',0,1,'dhcpv6s',0,1,1,1);
insert into dbUpdateRegisterTbl values ('UMI_COMP_PLATFORM',0,1,'dhcpv6sLANAddrPool',0,1,1,1);
insert into dbUpdateRegisterTbl values ('UMI_COMP_PLATFORM',0,1,'dhcpv6sLANPrefixPool',0,1,1,1);
insert into dbUpdateRegisterProgram values ('/pfrm2.0/bin/dhcpv6sConfig',0,1,'dhcpv6s',0,1,1,1);
insert into dbUpdateRegisterProgram values ('/pfrm2.0/bin/dhcpv6sConfig',0,1,'dhcpv6sLANAddrPool',0,1,1,1);
insert into dbUpdateRegisterProgram values ('/pfrm2.0/bin/dhcpv6sConfig',0,1,'dhcpv6sLANPrefixPool',0,1,1,1);
insert into dbUpdateRegisterProgram values ('/pfrm2.0/bin/dhcpv6sConfig',0,1,'ifStatic',2,1,1,1);
insert into dbUpdateRegisterProgram values ('/pfrm2.0/bin/dhcpv6sConfig',0,1,'resolverConfig',1,1,1,1);
insert into ifDevEventTbl values("bdgWAN1","UMI_COMP_PLATFORM","/pfrm2.0/bin/dhcpv6cRestart /tmp/system.db WAN1",0,0,1,1,0,0,0);
insert into ifDevEventTbl values("eth1","UMI_COMP_PLATFORM","/pfrm2.0/bin/dhcpv6cRestart /tmp/system.db WAN1",0,0,1,1,0,0,0);

-- Registaration for isatapTunnel
insert into dbUpdateRegisterTbl values ('UMI_COMP_PLATFORM',0,1,'isatapTunnel',0,1,1,1);
insert into dbUpdateRegisterProgram values ('/pfrm2.0/bin/isatapConfig',0,1,'isatapTunnel',0,1,1,1);
insert into ifDevEventTbl values('',"UMI_COMP_PLATFORM","/pfrm2.0/bin/isatapDevHandler /tmp/system.db",1,1,0,0,0,0,0);
insert into dbUpdateRegisterProgram values ('/pfrm2.0/bin/radvdIsatapPrefixConfig',0,1,'isatapTunnel',0,1,1,1);
    

-- Registaration for sixToFourTunnel
insert into dbUpdateRegisterTbl values ('UMI_COMP_PLATFORM',0,1,'sixToFourTunnel',0,1,1,1);
insert into dbUpdateRegisterProgram values ('/pfrm2.0/bin/6to4Config',0,1,'sixToFourTunnel',0,1,1,1);
insert into dbUpdateRegisterProgram values ('/pfrm2.0/bin/6to4Restart',0,1,'ipAddressTable',0,1,0,0);

-- Registration for SIP 
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/sipConfig",0,1,"ipAddressTable", 1, 1,0,0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/sipConfig",0,1,"SipStatusCtrl", 0, 1,1,0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/sipConfig",0,1,"ConfigPort", 0, 1,1,0);
--insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/sipConfig",0,1,"AlgConf", 0, 1,1,0);
--insert into dbUpdateRegisterTbl values ('UMI_COMP_PLATFORM',0,1,'AlgConf',0,1,1,1);

-- Registaration for mldproxy
--insert into dbUpdateRegisterTbl values ('UMI_COMP_PLATFORM',0,1,'mldproxy',0,1,1,1);
--insert into dbUpdateRegisterProgram values ('/pfrm2.0/bin/mldproxyConfig',0,1,'mldproxy',0,1,1,1);

-- NIMF Registration for interface UP events
insert into ifDevEventTbl values ("bdgWAN1", "UMI_COMP_NIMF", "NULL", 0, 0, 1, 0, 0, 0, 0);
insert into ifDevEventTbl values ("eth1", "UMI_COMP_NIMF", "NULL", 0, 0, 1, 0, 0, 0, 0);

--- userdbConfig program

insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/userdbConfig",1,1,"Users",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/userdbConfig",1,1,"UserGroups",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/userdbConfig",1,1,"USERDBDomains",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/userdbConfig",1,1,"GETUSERSDb",0,1,1,1);

--- usbConfig program
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/usbConfig",1,1,"USB",0,1,1,1);

-- SSLVPN program
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/sslvpnConfig",1,1,"SSLVPNPortalLayout",0,1,1,1);
--insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/sslvpnConfig",1,1,"SSLVPNUserLoginPolicyDefinedAddress",0,1,1,1);
--insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/sslvpnConfig",1,1,"SSLVPNUserLoginPolicyDefinedBrowser",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/sslvpnConfig",1,1,"GroupAccessControl",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/sslvpnConfig",1,1,"AccessControlUserGroupPolicyBrowser",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/sslvpnConfig",1,1,"AccessControlUserGroupPolicyIPAddress",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/sslvpnConfig",1,1,"SSLVPNResource",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/sslvpnConfig",1,1,"SSLVPNResourceObject",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/sslvpnConfig",1,1,"SSLVPNPolicy",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/sslvpnConfig",1,1,"SSLVPNClientConf",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/sslvpnConfig",1,1,"SSLVPNClientRoute",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/sslvpnConfig",1,1,"SSLVPNPortForwardingAppsMap",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/sslvpnConfig",1,1,"SSLVPNPortForwardingFQDNMap",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/sslvpnConfig",1,1,"httpsMgmt",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/sslvpnConfig",1,1,"accessMgmt",0,1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/sslvpnConfig",1,1,"SslvpnEnable",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"accessMgmt", 0, 1,1,1); --to make sslvpn handle thru platformd

-- upnpListenPort
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",0,1,"upnpListenPort", 0, 1,1,1);
insert into upnpListenPort values (0);


-- WAN2 related entries
insert into NimfStatus( LogicalIfName, AddressFamily, Nimfstatus, Linkstatus, WanUpTime)values("WAN2", 2,"Not Yet Available", "LINK DOWN", "Not Yet Available");
insert into NimfStatus( LogicalIfName, AddressFamily, Nimfstatus, Linkstatus, WanUpTime)values("WAN2", 10,"Not Yet Available", "LINK DOWN", "Not Yet Available");
insert into NimfStatus( LogicalIfName, AddressFamily, Nimfstatus, Linkstatus, WanUpTime)values("DMZ", 2,"Not Yet Available", "LINK DOWN", "Not Yet Available");
insert into DhcpStatus(LogicalIfName,DhcpServerIp,LeaseTime,LeaseObtained)values("WAN2","Not Yet Available","Not Yet Available","Not Yet Available");
insert into NimfTrigger values (3, "WAN2",2, 0);
insert into NimfTrigger values (4, "WAN2",10, 0);
insert into MacTable values ("WAN2", 0);

-- table for unit information:
create table unitInfo (
modelId text NOT NULL,
hardwareVersion text NOT NULL,
regionInfo integer NOT NULL,
serialNumber text  NOT NULL,
lanMacAddress text NOT NULL,
firmwareQueryUrl text NOT NULL
);

-- table for Factory Default State information:
create table FactoryStatus (
factStatus integer NOT NULL
);

create table wirelessCtrl
(
enable integer NOT NULL,
wirelessCtrlIp text  NOT NULL,
lanIp          text  NOT NULL
);

insert into wirelessCtrl (enable, wirelessCtrlIp, lanIp) values (0,'0.0.0.0','0.0.0.0');
-- active sessions table
CREATE TABLE activeSessions
     (
     protocol                text     NOT NULL,
     LocalIp                 text     NOT NULL,
     ExternalIp              text     NOT NULL,
     connState               text     NOT NULL,
     NatIps                  text     NOT NULL,
     direction               text     NOT NULL,
     priority                text     NOT NULL,
     timeout                 text     NOT NULL
     );

create table webBrandingTags
(
companyName text NOT NULL,
copyright text NOT NULL,
webAddress text NOT NULL,
supportLink text NOT NULL,
unitName text NULL,
tradeMark text NULL,
prodFamily text NULL,
appName text NULL,
Version text NULL
);


--uid specific table
create table UDIInfo
(
udi text NOT NULL,
pid text NOT NULL,
vid text NULL,
serialNumber text NOT NULL,
prodName text NULL,
prodDesc text NULL
);
insert into UDIInfo values ("udi","pid","vid","sn","prodName","prodDesc");


-- table for default mac addresses:
create table defaultMac (
logicalName text NOT NULL,
macAddress  text NULL
);

-- table for LED Parameters:
create table LedParam (
LogicalIfName text NOT NULL,
LedPinId  text NOT NULL,
LedON  text NOT NULL,
LedOFF  text NOT NULL
);

-- table for showing getting Started page
create table GettingStarted (
dontShow integer NOT NULL
);

create table DropCache (
dropCache integer NOT NULL
);

insert into DropCache values ("1");

-- table for storing led status
create table wirelessLED (
ledStatus integer NOT NULL
);



-- vlan gui messages
--insert into stringsmap values ("VLAN_IN_USE_BY_BW_TRAFFIC_SELECTOR","Selected VLAN(s) are being using in bandwidth profiles traffic selector");
--insert into stringsmap values ("PORT_VLAN_IN_USE_BY_BW_TRAFFIC_SELECTOR","Cannot edit as this port is being used in bandwidth profiles traffic selector");
--insert into stringsmap values ("CONFIG_PORT_SET_AS_WANORDMZ","VLANID 4094 is reserved when configurable port is set as WAN/DMZ");
insert into stringsmap values ("PORT_MODE_NOT_ALLOWED","Access port can be member of only single vlan");
insert into stringsmap values ("VLAN_MAX_LIMIT_ERROR","Maximum Allowed VLANS Exceeded");
insert into stringsmap values ("VLAN_4094_EXISTS","VLANID 4094 Already Exists. Please delete VLANID 4094");
insert into stringsmap values ("PORT_VLAN_PVID_4094_EXISTS","PVID 4094 Already Exists. Please Change PVID 4094");
insert into stringsmap values ("FBWIFI_DEV_REG_FAIL","Please check your Internet Connection and try again");
insert into stringsmap values ("FBWIFI_DEV_REG_SUCC","Device registration with Facebook is Completed Successfully");
insert into stringsmap values ("FBWIFI_DEV_REG_AlRDY","Device is Already Registered with Facebook");
insert into stringsmap values ("VLAN_FBWIFI_ENABLED","Facebook WIFI is enabled on the vlan");
insert into stringsmap values ("FBWIFI_DEV_CAPTIVEPORTAL_CONFIGURED","CaptivePortal is enabled,please disable it to configure Facebook WiFi.");
insert into stringsmap values ("CAPTIVEPORTAL_DEV_FBWIFI_CONFIGURED","Facebook WIFI is enabled,please disable it to configure CaptivePortal");

--wireless
insert into networkInterface values ("vap0", "LAN-BDG", "vap0","ifStatic","","dot11", 1500, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 1, 5, 0,1,0,5);
insert into networkInterface values ("vap1", "LAN-BDG", "vap1","ifStatic","","dot11", 1500, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 1, 5, 0,1,0,5);
insert into networkInterface values ("vap2", "LAN-BDG", "vap2","ifStatic","","dot11", 1500, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 1, 5, 0,1,0,5);
insert into networkInterface values ("vap3", "LAN-BDG", "vap3","ifStatic","","dot11", 1500, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 1, 5, 0,1,0,5);

insert into interfaceStats values("vap0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0");
insert into interfaceStats values("vap1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0");
insert into interfaceStats values("vap2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0");
insert into interfaceStats values("vap3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0");

-- inserting default values for tcpdump
insert into tcpdump values ("WAN1","0");
insert into tcpdump values ("WAN2","0");
insert into tcpdump values ("LAN","0");
insert into tcpdump values ("WAN3","0");
 
insert into dbUpdateRegisterTbl values ("UMI_COMP_UDOT11",1,1,"dot11WPSSessStatus", 0, 0,0,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"dot11WPSSessStatus", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"dot11WPS", 0, 1,1,1);



insert into tableDefaults values ("SSLVPNPortalLayout", "profileName", "default", "", "");

-- override default configuration
update tableDefaults set minValue='40' where tableName="dot11VAP" and columnName="beaconInterval";
update tableDefaults set maxValue='3500' where tableName="dot11VAP" and columnName="beaconInterval";

insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"NimfAFStatus",0,1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"DropCache",0,0,1,0);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/dropCache.sh",1,1,"DropCache", 0, 0,1,0);

-- vipsecure multi algo support default algo value initialization
update tableDefaults set defValue='8' where tableName="IpsecVPNPolicy" and columnName="EncryptionAlgorithm";
update tableDefaults set defValue='4' where tableName="IpsecVPNPolicy" and columnName="AuthAlgorithm";
update tableDefaults set defValue='4' where tableName="IpsecIKEPolicy" and columnName="EncryptionAlgorithm";
update tableDefaults set defValue='2' where tableName="IpsecIKEPolicy" and columnName="AuthAlgorithm";

-- adding these from i18n.sql to support proper returnCodes in CLI.
insert into StringsMap values('10001',' and '' characters are not supported for this field');
insert into StringsMap values('10002',' is not supported for this field.');
insert into StringsMap values('10003','\n The following characters are not supported for this field:');
insert into StringsMap values('10004','has the same IP. Please configure different IP.');
insert into StringsMap values('10005','IP address is in the same subnet. Please specify IP address in a different subnet.');
insert into StringsMap values('10006','1 - Max. Bandwidth Kbps');
insert into StringsMap values('10007','100 - 1000000 Kbps');
insert into StringsMap values('10008','AM');
insert into StringsMap values('10009','(CF00CF)');
insert into StringsMap values('10010','(Check Box at First Column Header)');
insert into StringsMap values('10011','Failures');
insert into StringsMap values('10012','(GMT) Casablanca');
insert into StringsMap values('10013','(GMT) Greenwich Mean Time : Dublin  Edinburgh  Lisbon  London');
insert into StringsMap values('10014','(GMT) Monrovia  Reykjavik');
insert into StringsMap values('10015','(GMT+01:00) Amsterdam  Berlin  Bern  Rome  Stockholm  Vienna');
insert into StringsMap values('10016','(GMT+01:00) Belgrade  Bratislava  Budapest  Ljubljana  Prague');
insert into StringsMap values('10017','(GMT+01:00) Brussels  Copenhagen  Madrid  Paris');
insert into StringsMap values('10018','(GMT+01:00) Sarajevo  Skopje  Warsaw  Zagreb');
insert into StringsMap values('10019','(GMT+01:00) West Central Africa');
insert into StringsMap values('10020','(GMT+02:00) Amman');
insert into StringsMap values('10021','(GMT+02:00) Athens  Bucharest  Istanbul');
insert into StringsMap values('10022','(GMT+02:00) Beirut');
insert into StringsMap values('10023','(GMT+02:00) Cairo');
insert into StringsMap values('10024','(GMT+02:00) Harare  Pretoria');
insert into StringsMap values('10025','(GMT+02:00) Helsinki  Kyiv  Riga  Sofia  Tallinn  Vilnius');
insert into StringsMap values('10026','(GMT+02:00) Jerusalem');
insert into StringsMap values('10027','(GMT+02:00) Minsk');
insert into StringsMap values('10028','(GMT+02:00) Windhoek');
insert into StringsMap values('10029','(GMT+03:00) Baghdad');
insert into StringsMap values('10030','(GMT+03:00) Kuwait  Riyadh');
insert into StringsMap values('10031','(GMT+03:00) Moscow  St. Petersburg  Volgograd');
insert into StringsMap values('10032','(GMT+03:00) Nairobi');
insert into StringsMap values('10033','(GMT+03:00) Tbilisi');
insert into StringsMap values('10034','(GMT+03:30) Tehran');
insert into StringsMap values('10035','(GMT+04:00) Abu Dhabi  Muscat');
insert into StringsMap values('10036','(GMT+04:00) Baku');
insert into StringsMap values('10037','(GMT+04:00) Caucasus Standard Time');
insert into StringsMap values('10038','(GMT+04:00) Port Louis');
insert into StringsMap values('10039','(GMT+04:00) Yerevan');
insert into StringsMap values('10040','(GMT+04:30) Kabul');
insert into StringsMap values('10041','(GMT+05:00) Ekaterinburg');
insert into StringsMap values('10042','(GMT+05:00) Islamabad  Karachi');
insert into StringsMap values('10043','(GMT+05:00) Tashkent');
insert into StringsMap values('10044','(GMT+05:30) Chennai  Kolkata  Mumbai  New Delhi');
insert into StringsMap values('10045','(GMT+05:30) Sri Jayawardenepura');
insert into StringsMap values('10046','(GMT+05:45) Kathmandu');
insert into StringsMap values('10047','(GMT+06:00) Almaty  Novosibirsk');
insert into StringsMap values('10048','(GMT+06:00) Astana  Dhaka');
insert into StringsMap values('10049','(GMT+06:30) Yangon (Rangoon)');
insert into StringsMap values('10050','(GMT+07:00) Bangkok  Hanoi  Jakarta');
insert into StringsMap values('10051','(GMT+07:00) Krasnoyarsk');
insert into StringsMap values('10052','(GMT+08:00) Beijing  Chongqing  Hong Kong  Urumqi');
insert into StringsMap values('10053','(GMT+08:00) Irkutsk  Ulaan Bataar');
insert into StringsMap values('10054','(GMT+08:00) Kuala Lumpur  Singapore');
insert into StringsMap values('10055','(GMT+08:00) Perth');
insert into StringsMap values('10056','(GMT+08:00) Taipei');
insert into StringsMap values('10057','(GMT+09:00) Osaka  Sapporo  Tokyo');
insert into StringsMap values('10058','(GMT+09:00) Seoul');
insert into StringsMap values('10059','(GMT+09:00) Yakutsk');
insert into StringsMap values('10060','(GMT+09:30) Adelaide');
insert into StringsMap values('10061','(GMT+09:30) Darwin');
insert into StringsMap values('10062','(GMT+10:00) Brisbane');
insert into StringsMap values('10063','(GMT+10:00) Canberra  Melbourne  Sydney');
insert into StringsMap values('10064','(GMT+10:00) Guam  Port Moresby');
insert into StringsMap values('10065','(GMT+10:00) Hobart');
insert into StringsMap values('10066','(GMT+10:00) Vladivostok');
insert into StringsMap values('10067','(GMT+11:00) Magadan  Solomon Is.  New Caledonia');
insert into StringsMap values('10068','(GMT+12:00) Auckland  Wellington');
insert into StringsMap values('10069','(GMT+12:00) Fiji  Kamchatka  Marshall Is');
insert into StringsMap values('10070','(GMT+13:00) Nuku''alofa');
insert into StringsMap values('10071','(GMT+14:00) Kiribati,Western Samoa');
insert into StringsMap values('10072','(GMT-01:00) Azores');
insert into StringsMap values('10073','(GMT-01:00) Cape Verde Is.');
insert into StringsMap values('10074','(GMT-02:00) Mid-Atlantic');
insert into StringsMap values('10075','(GMT-03:00) Brasilia');
insert into StringsMap values('10076','(GMT-03:00) Buenos Aires');
insert into StringsMap values('10077','(GMT-03:00) Georgetown');
insert into StringsMap values('10078','(GMT-03:00) Greenland');
insert into StringsMap values('10079','(GMT-03:00) Montevideo');
insert into StringsMap values('10080','(GMT-03:30) Newfoundland');
insert into StringsMap values('10081','(GMT-04:00) Atlantic Time (Canada)');
insert into StringsMap values('10082','(GMT-04:00) La Paz');
insert into StringsMap values('10083','(GMT-04:00) Manaus');
insert into StringsMap values('10084','(GMT-04:00) Santiago');
insert into StringsMap values('10085','(GMT-04:30) Caracas');
insert into StringsMap values('10086','(GMT-05:00) Bogota  Lima  Quito  Rio Branco');
insert into StringsMap values('10087','(GMT-05:00) Eastern Time (US and Canada)');
insert into StringsMap values('10088','(GMT-05:00) Indiana (East)');
insert into StringsMap values('10089','(GMT-06:00) Central America');
insert into StringsMap values('10090','(GMT-06:00) Central Time (US and Canada)');
insert into StringsMap values('10091','(GMT-06:00) Guadalajara  Mexico City  Monterrey-New');
insert into StringsMap values('10092','(GMT-06:00) Guadalajara  Mexico City  Monterrey-Old');
insert into StringsMap values('10093','(GMT-06:00) Saskatchewan');
insert into StringsMap values('10094','(GMT-07:00) Arizona');
insert into StringsMap values('10095','(GMT-07:00) Chihuahua  La Paz  Mazatlan-New');
insert into StringsMap values('10096','(GMT-07:00) Chihuahua  La Paz  Mazatlan-Old');
insert into StringsMap values('10097','(GMT-07:00) Mountain Time (US and Canada)');
insert into StringsMap values('10098','(GMT-08:00) Pacific Time (US and Canada)');
insert into StringsMap values('10099','(GMT-08:00) Tijuana  Baja California');
insert into StringsMap values('10100','(GMT-09:00) Alaska');
insert into StringsMap values('10101','(GMT-10:00) Hawaii');
insert into StringsMap values('10102','(GMT-11:00) Midway Island  Samoa');
insert into StringsMap values('10103','(GMT-12:00) International Date Line West');
insert into StringsMap values('10104','(In Hops)');
insert into StringsMap values('10105','in KB');
insert into StringsMap values('10106','(In Secs)');
insert into StringsMap values('10107','Milliseconds');
insert into StringsMap values('10108','Minutes');
insert into StringsMap values('10109','Optional');
insert into StringsMap values('10110','PM');
insert into StringsMap values('10111','Seconds');
insert into StringsMap values('10112',''':'' is not supported for this field.');
insert into StringsMap values('10113','''@'' and double quote are not allowed in FQDN string');
insert into StringsMap values('10114','''@'' is not allowed in FQDN string');
insert into StringsMap values('10115','\n Following character is not supported for this field:');
insert into StringsMap values('10116','10 BaseT Full Duplex');
insert into StringsMap values('10117','10 BaseT Half Duplex');
insert into StringsMap values('10118','1000BaseT Full Duplex');
insert into StringsMap values('10119','1000BaseT Half Duplex');
insert into StringsMap values('10120','100BaseT Full Duplex');
insert into StringsMap values('10121','100BaseT Half Duplex');
insert into StringsMap values('10122','128 bit WEP');
insert into StringsMap values('10123','3DES');
insert into StringsMap values('10124','3G Internet');
insert into StringsMap values('10125','3G Internet Connection Type');
insert into StringsMap values('10126','401 Error');
insert into StringsMap values('10127','401 Unauthorized');
insert into StringsMap values('10128','6 to 4 Tunnel Configuration Failed');
insert into StringsMap values('10129','6 to 4 Tunneling');
insert into StringsMap values('10130','64 bit WEP');
insert into StringsMap values('10131','6to4');
insert into StringsMap values('10132','A critical error was encountered while loading the web page');
insert into StringsMap values('10133','Accepted Packets');
insert into StringsMap values('10134','Access');
insert into StringsMap values('10135','Access Control Configuration');
insert into StringsMap values('10136','Access Control List');
insert into StringsMap values('10137','Access Control List Status');
insert into StringsMap values('10138','Access Point Configuration');
insert into StringsMap values('10139','Access Point Status');
insert into StringsMap values('10140','Access Points');
insert into StringsMap values('10141','Access port can be member of only single vlan');
insert into StringsMap values('10142','Access Privilege');
insert into StringsMap values('10143','Access Server Client');
insert into StringsMap values('10144','Access Server Client Configuration Failed');
insert into StringsMap values('10145','Access Type');
insert into StringsMap values('10146','Accesss Management Configuration Failed');
insert into StringsMap values('10147','ACL configuration failed');
insert into StringsMap values('10148','ACL Policy Status');
insert into StringsMap values('10149','Action');
insert into StringsMap values('10150','Active');
insert into StringsMap values('10151','Active Directory');
insert into StringsMap values('10152','Active Directory Domain');
insert into StringsMap values('10153','Active Info');
insert into StringsMap values('10154','Active Interfaces');
insert into StringsMap values('10155','Active IPsec SAs');
insert into StringsMap values('10156','Active PPTP VPN connections');
insert into StringsMap values('10157','Active Self Certificate Not Uploaded');
insert into StringsMap values('10158','Active Self Certificate Uploaded');
insert into StringsMap values('10159','Active Self Certificates');
insert into StringsMap values('10160','Active Sessions');
insert into StringsMap values('10161','Active SSL VPN Connections');
insert into StringsMap values('10162','Active Time');
insert into StringsMap values('10163','Active Users');
insert into StringsMap values('10164','Active VPN');
insert into StringsMap values('10165','Active VPN Tunnels');
insert into StringsMap values('10166','Active VPNs');
insert into StringsMap values('10167','ActiveX');
insert into StringsMap values('10168','ActiveX web cache cleaner');
insert into StringsMap values('10169','Ad Content');
insert into StringsMap values('10170','Ad Place');
insert into StringsMap values('10171','Add');
insert into StringsMap values('10172','Add Approved URLs from File');
insert into StringsMap values('10173','Add Blocked Keywords from File');
insert into StringsMap values('10174','Add Defined Browser');
insert into StringsMap values('10175','Add Wireless Device');
insert into StringsMap values('10176','Add Wireless Device (WITH WPS/WI-FI PROTECTED SETUP) Wizard');
insert into StringsMap values('10177','Added Active Self Certificate');
insert into StringsMap values('10178','Added Client Browsers');
insert into StringsMap values('10179','Added Trusted Certificate');
insert into StringsMap values('10180','Adding of Group failed');
insert into StringsMap values('10181','Address Mode');
insert into StringsMap values('10182','Address Range');
insert into StringsMap values('10183','Admin');
insert into StringsMap values('10184','Admin Settings');
insert into StringsMap values('10185','Admin user authentication has failed');
insert into StringsMap values('10186','Administrator / Guest users cannot be associated with externally authenticated group');
insert into StringsMap values('10187','Administrator privileges are required');
insert into StringsMap values('10188','Advanced');
insert into StringsMap values('10189','Advanced AP configuration has failed');
insert into StringsMap values('10190','Advanced Help');
insert into StringsMap values('10191','Advanced Network');
insert into StringsMap values('10192','Advanced profile configuration has failed');
insert into StringsMap values('10193','Advanced Wireless');
insert into StringsMap values('10194','Advanced Wireless Configuration');
insert into StringsMap values('10195','Advertise Interval');
insert into StringsMap values('10196','Advertise Mode');
insert into StringsMap values('10197','Advertise Prefixes Configuration');
insert into StringsMap values('10198','Advertisement Details');
insert into StringsMap values('10199','Advertisement Period');
insert into StringsMap values('10200','Advertisement Prefixes Configuration');
insert into StringsMap values('10201','Advertisement Prefixes');
insert into StringsMap values('10202','Advertisement Time To Live');
insert into StringsMap values('10203','AES');
insert into StringsMap values('10204','AES-128');
insert into StringsMap values('10205','AES-192');
insert into StringsMap values('10206','AES-256');
insert into StringsMap values('10207','AES-CCM');
insert into StringsMap values('10208','AES-GCM');
insert into StringsMap values('10209','Aggressive');
insert into StringsMap values('10210','Alert');
insert into StringsMap values('10211','ALGs');
insert into StringsMap values('10212','Alias address is in use, please delete the corresponding firewall rule');
insert into StringsMap values('10213','All');
insert into StringsMap values('10214','All Addresses');
insert into StringsMap values('10215','All Broadcast / Multicast Traffic');
insert into StringsMap values('10216','All Day');
insert into StringsMap values('10217','All Days');
insert into StringsMap values('10218','All IP Addresses');
insert into StringsMap values('10219','All the policies in the file are added successfully');
insert into StringsMap values('10220','All Unicast Traffic');
insert into StringsMap values('10221','Allow');
insert into StringsMap values('10222','Allow Always');
insert into StringsMap values('10223','Allow Login from Defined Addresses');
insert into StringsMap values('10224','Allow Login from Defined Browsers');
insert into StringsMap values('10225','Allow Ping from Lan');
insert into StringsMap values('10226','Allowed Network Addresses');
insert into StringsMap values('10227','Allowed Netwroks configuration failed');
insert into StringsMap values('10228','Already configured DHCP connection will be replaced with this configuration. Are you sure you want to proceed ?');
insert into StringsMap values('10229','Already configured Japan multiple PPPoE connection will be replaced with this configuration. Are you sure you want to proceed ?');
insert into StringsMap values('10230','Already configured L2TP connection will be replaced with this configuration. Are you sure you want to proceed ?');
insert into StringsMap values('10231','Already configured PPPoE connection will be replaced with this configuration. Are you sure you want to proceed ?');
insert into StringsMap values('10232','Already configured PPTP connection will be replaced with this configuration. Are you sure you want to proceed ?');
insert into StringsMap values('10233','Already configured Russia L2TP connection will be replaced with this configuration. Are you sure you want to proceed ?');
insert into StringsMap values('10234','Already configured Russia PPTP connection will be replaced with this configuration. Are you sure you want to proceed ?');
insert into StringsMap values('10235','Already configured Static connection will be replaced with this configuration. Are you sure you want to proceed ?');
insert into StringsMap values('10236','Always');
insert into StringsMap values('10237','Always On');
insert into StringsMap values('10238','AM');
insert into StringsMap values('10239','An IP in this subnet is already configured on another interface('' %s ''). Please configure the IP in a different subnet.');
insert into StringsMap values('10240','Any');
insert into StringsMap values('10241','AP configuration has failed');
insert into StringsMap values('10242','AP Name');
insert into StringsMap values('10243','APN');
insert into StringsMap values('10244','Application Rules');
insert into StringsMap values('10245','Application rules are also commonly referred to as port triggering rules. Port triggering allows computers on the private network (LAN or DMZ) to request one or more ports to be forwarded to them. Unlike basic port forwarding, which forwards ports to only one IP address, port triggering waits for an outbound request from the private network on one of the defined outgoing ports. It then automatically sets up forwarding to the IP address from where the request was made. When the application ceases to transmit data over the port, the router waits for a timeout interval and then closes the port or range of ports, making them available to other computers on the private network. For example, if an IRC client on the private network makes a connection request through port 6667 and sends its username information to the IRC server, the IRC server will send an IDENT verification packet on port 113 to check the authenticity of the IRC client. In NAT mode, the router will discard this packet since it doesn''t know which computer to send the request on port 113 to. A Port Triggering rule can define port 6667 (or the range: 6660 to 7000) as the outgoing (trigger) port(s) and port 113 as the incoming (response) port');
insert into StringsMap values('10246','Application Rules Configuration');
insert into StringsMap values('10247','Application Rules Status');
insert into StringsMap values('10248','Applications');
insert into StringsMap values('10249','Apply');
insert into StringsMap values('10250','Apply Policy to');
insert into StringsMap values('10251','Approved Mail Ids');
insert into StringsMap values('10252','Approved Mail Ids Configuration');
insert into StringsMap values('10253','Approved URL Config');
insert into StringsMap values('10254','Approved URL Configuration');
insert into StringsMap values('10255','Approved URLs');
insert into StringsMap values('10256','Approved URLs List');
insert into StringsMap values('10257','Area');
insert into StringsMap values('10258','Arial');
insert into StringsMap values('10259','ASCII key should contain 5(64 Bit) or 13(128 Bit) characters');
insert into StringsMap values('10260','at row ');
insert into StringsMap values('10261','Attack Checks');
insert into StringsMap values('10262','Attack checks Configuration Failed');
insert into StringsMap values('10263','Auth');
insert into StringsMap values('10264','Authentication');
insert into StringsMap values('10265','Authentication Algorithm');
insert into StringsMap values('10266','Authentication Failed');
insert into StringsMap values('10267','Authentication for RIP-2B/2M');
insert into StringsMap values('10268','Authentication Key');
insert into StringsMap values('10269','Authentication Method');
insert into StringsMap values('10270','Authentication Password');
insert into StringsMap values('10271','Authentication Port');
insert into StringsMap values('10272','Authentication Protocol');
insert into StringsMap values('10273','Authentication Secret');
insert into StringsMap values('10274','Authentication Server');
insert into StringsMap values('10275','Authentication Server 1 (Primary)');
insert into StringsMap values('10276','Authentication Server 2 (Secondary)');
insert into StringsMap values('10277','Authentication Success');
insert into StringsMap values('10278','Authentication Supported');
insert into StringsMap values('10279','Authentication Type');
insert into StringsMap values('10280','Authentication with SMTP Server');
insert into StringsMap values('10281','AuthNoPriv');
insert into StringsMap values('10282','Authorized AP configuration has failed');
insert into StringsMap values('10283','AuthPriv');
insert into StringsMap values('10284','Auto');
insert into StringsMap values('10285','Auto (WPA or WPA2) - Personal');
insert into StringsMap values('10286','Auto Policy');
insert into StringsMap values('10287','Auto refresh configuration has failed');
insert into StringsMap values('10288','Auto Sense');
insert into StringsMap values('10289','Automatically assign a network key (Recommended)');
insert into StringsMap values('10290','Auto-negotiate');
insert into StringsMap values('10291','Auto-Rollover using WAN port');
insert into StringsMap values('10292','Available Access Points');
insert into StringsMap values('10293','Available Groups');
insert into StringsMap values('10294','Available Profiles');
insert into StringsMap values('10295','Available Users');
insert into StringsMap values('10296','Available VLANs');
insert into StringsMap values('10297','Back');
insert into StringsMap values('10298','Back Up');
insert into StringsMap values('10299','Background');
insert into StringsMap values('10300','Backup');
insert into StringsMap values('10301','Backup / Restore Settings');
insert into StringsMap values('10302','Backup policy setting is not allowed for manual policies');
insert into StringsMap values('10303','Bandwidth Limit');
insert into StringsMap values('10304','Bandwidth Profile');
insert into StringsMap values('10305','Bandwidth Profile Configuration');
insert into StringsMap values('10306','Bandwidth profile edit failed as it is being used by traffic selector');
insert into StringsMap values('10307','Bandwidth Profile Status Configuration Failey');
insert into StringsMap values('10308','Bandwidth Profile(s) Configuration Failed');
insert into StringsMap values('10309','Bandwidth Profile(s) Delete Failed');
insert into StringsMap values('10310','Bandwidth Profile(s) Delete Failed as it is being used by traffic selector');
insert into StringsMap values('10311','Bandwidth Profiles');
insert into StringsMap values('10312','Bandwidth Profiles Config');
insert into StringsMap values('10313','Bandwidth Profiles reached to maximum limit (15)');
insert into StringsMap values('10314','Bandwidth Rate / Priority');
insert into StringsMap values('10315','Bandwidth Usage');
insert into StringsMap values('10316','Banner Message (Optional)');
insert into StringsMap values('10317','Banner Title (Optional)');
insert into StringsMap values('10318','Beacon Interval');
insert into StringsMap values('10319','Before Date should be lesser than After date');
insert into StringsMap values('10320','Begin');
insert into StringsMap values('10321','Below is a detailed summary of your VPN Configuration.');
insert into StringsMap values('10322','Below is a detailed summary of your wireless security settings. Please print this page out, or write the information on a piece of paper, so you can configure the correct settings on your wireless client adapters');
insert into StringsMap values('10323','Best Effort');
insert into StringsMap values('10324','Best(Automatic)');
insert into StringsMap values('10325','Between 8 and 63 characters (A longer WPA key is more secure than a short one)');
insert into StringsMap values('10326','BF-CBC');
insert into StringsMap values('10327','Big');
insert into StringsMap values('10328','Black');
insert into StringsMap values('10329','Block');
insert into StringsMap values('10330','Block All URL');
insert into StringsMap values('10331','Block Always');
insert into StringsMap values('10332','Block Fragmented Packets');
insert into StringsMap values('10333','ICMP');
insert into StringsMap values('10334','Block ICMP Notification');
insert into StringsMap values('10335','Block Multicast Packets');
insert into StringsMap values('10336','Block Spoofed IP  Packets');
insert into StringsMap values('10337','Block TCP flood');
insert into StringsMap values('10338','Block UDP flood');
insert into StringsMap values('10339','Blocked All URL Configuration');
insert into StringsMap values('10340','Blocked by D-Link Firewall');
insert into StringsMap values('10341','Blocked Keyword');
insert into StringsMap values('10342','Blocked Keyword Config');
insert into StringsMap values('10343','Blocked Keyword Configuration');
insert into StringsMap values('10344','Blocked Keyword Configuration Failed');
insert into StringsMap values('10345','Blocked Keyword Delete Failed');
insert into StringsMap values('10346','Blocked Keyword(s) Deleted Successfully');
insert into StringsMap values('10347','Blocked Keywords');
insert into StringsMap values('10348','Blocked Mail Ids');
insert into StringsMap values('10349','Blocked Mail Ids Configuration');
insert into StringsMap values('10350','BLOWFISH');
insert into StringsMap values('10351','Blue');
insert into StringsMap values('10352','Both');
insert into StringsMap values('10353','Boxee Box at a Glance We get it - you want Internet freedom on your TV, but you want it to be the stuff you actually want to watch in HD and you want to enjoy it from the comfort of your couch. We&#39;re all over it-introducing the Boxee Box by D-Link: click, follow, watch - you are now in full command of your TV for the first time. No rules, no contracts. TV for the first time. No rules, no contracts.TV for the first time. No rules, no contracts.');
insert into StringsMap values('10354','Broadcast');
insert into StringsMap values('10355','Broadcast SSID');
insert into StringsMap values('10356','Browse');
insert into StringsMap values('10357','Browser Title');
insert into StringsMap values('10358','BSSID');
insert into StringsMap values('10359','Buffer Memory');
insert into StringsMap values('10360','By default, your new D-Link Router comes with ''admin'' password configured for administrator access to the Web-based configuration pages. To secure your new networking device, please change the password below');
insert into StringsMap values('10361','Bytes');
insert into StringsMap values('10362','CA Cert Status');
insert into StringsMap values('10363','CA Identity (Subject Name)');
insert into StringsMap values('10364','CA Subject Name');
insert into StringsMap values('10365','Cached Memory');
insert into StringsMap values('10366','Cancel');
insert into StringsMap values('10367','Cannot Add Active Self Certificate');
insert into StringsMap values('10368','Cannot add new profile. PPPoE Profiles max limit reached');
insert into StringsMap values('10369','Cannot Add Trusted Certificate');
insert into StringsMap values('10370','Cannot change the protal for the only domain, As its portal is set as Default');
insert into StringsMap values('10371','Cannot Delete Self Certificates');
insert into StringsMap values('10372','Cannot Delete Trusted CA as it is being used by other self signed certificate(s)');
insert into StringsMap values('10373','Cannot Delete Trusted CAs');
insert into StringsMap values('10374','Cannot enable duplicate protocol binding rules');
insert into StringsMap values('10375','Cannot use Direction type Initiator or Both when DHCP over IPsec in enabled.Please select Responder direction type.');
insert into StringsMap values('10376','Cannot use Manual Policy when DHCP is enabled. Please select Auto Policy.');
insert into StringsMap values('10377','Cannot use Manual Policy when DHCP is enabled.Please use Auto Policy.');
insert into StringsMap values('10378','Cannot use Transport Mode when DHCP is enabled.Please select Tunnel Mode.');
insert into StringsMap values('10379','Cannot add configuration to this table. Maximum limit reached.');
insert into StringsMap values('10380','Cannot enable two policies with same traffic selectors');
insert into StringsMap values('10381','Cannot share IKE policy with different remote/local endpoint');
insert into StringsMap values('10382','Cannot Upload Invalid Self Certificate');
insert into StringsMap values('10383','Cannot Upload Invalid Trusted Certificate');
insert into StringsMap values('10384','Cannot Upload Multiple Active Certificates');
insert into StringsMap values('10385','Caption Font');
insert into StringsMap values('10386','Captive Portal ');
insert into StringsMap values('10387','Captive Portal Configuration');
insert into StringsMap values('10388','Captive Portal Header Image');
insert into StringsMap values('10389','Captive Portal Login');
insert into StringsMap values('10390','Captive Portal Policies');
insert into StringsMap values('10391','Captive Portal Policy Configuration');
insert into StringsMap values('10392','Captive Portal Sessions');
insert into StringsMap values('10393','Captive Portal Setup');
insert into StringsMap values('10394','Captive Portal User');
insert into StringsMap values('10395','CaptivePortal Policy Added Successfully');
insert into StringsMap values('10396','CaptivePortal Policy Adding Failed');
insert into StringsMap values('10397','CaptivePortal Policy Delete Failed');
insert into StringsMap values('10398','CaptivePortal Policy Disable Failed');
insert into StringsMap values('10399','CaptivePortal Policy Edited Successfully');
insert into StringsMap values('10400','CaptivePortal Policy Editing Failed');
insert into StringsMap values('10401','CaptivePortal Policy Enable Failed');
insert into StringsMap values('10402','CaptivePortal Policy(s) Deleted Successfully');
insert into StringsMap values('10403','CaptivePortal Policy(s) Disabled Successfully');
insert into StringsMap values('10404','CaptivePortal Policy(s) Enabled Successfully');
insert into StringsMap values('10405','Capture Packets');
insert into StringsMap values('10406','Card configuration failed');
insert into StringsMap values('10407','CAST128');
insert into StringsMap values('10408','CCMP');
insert into StringsMap values('10409','Certificate');
insert into StringsMap values('10410','Certificate configuration failed');
insert into StringsMap values('10411','Certificate Details');
insert into StringsMap values('10412','Certificate File');
insert into StringsMap values('10413','Certificate Request Data');
insert into StringsMap values('10414','Certificates');
insert into StringsMap values('10415','Change Footer Content');
insert into StringsMap values('10416','Change Password');
insert into StringsMap values('10417','Channel');
insert into StringsMap values('10418','Channel Spacing');
insert into StringsMap values('10419','Channels List');
insert into StringsMap values('10420','CHAP');
insert into StringsMap values('10421','Check List');
insert into StringsMap values('10422','Check Now');
insert into StringsMap values('10423','Check to Edit Password');
insert into StringsMap values('10424','Choose this if your Internet connection automatically provides you with an IP Address. Most Cable Modems use this type of connection');
insert into StringsMap values('10425','Choose this option if your Internet connection requires a username and password to get online. Most DSL modems use this type of connection');
insert into StringsMap values('10426','Choose this option if your Internet Setup Provider provided you with IP Address information that has to be manually configured');
insert into StringsMap values('10427','Chrome');
insert into StringsMap values('10428','Cipher Type');
insert into StringsMap values('10429','Class Of Service');
insert into StringsMap values('10430','Classical');
insert into StringsMap values('10431','Classical Routing');
insert into StringsMap values('10432','Clear Logs');
insert into StringsMap values('10433','Client');
insert into StringsMap values('10434','Client Address Range Begin');
insert into StringsMap values('10435','Client Address Range End');
insert into StringsMap values('10436','Client Browser');
insert into StringsMap values('10437','Client IP Address Range');
insert into StringsMap values('10438','Clone your PC''s MAC Address');
insert into StringsMap values('10439','Collisions');
insert into StringsMap values('10440','Color');
insert into StringsMap values('10441','Command Output');
insert into StringsMap values('10442','Common Name');
insert into StringsMap values('10443','Community');
insert into StringsMap values('10444','CONFIG_CHECKSUM_FAILURE');
insert into StringsMap values('10445','Configurable Port');
insert into StringsMap values('10446','Configurable Port Status');
insert into StringsMap values('10447','Configurable Port (DMZ) MAC Address');
insert into StringsMap values('10448','Configurable Port (WAN2) MAC Address');
insert into StringsMap values('10449','Configurable WAN');
insert into StringsMap values('10450','Configuration file Stored in USB Device');
insert into StringsMap values('10451','Configuration Update Failed');
insert into StringsMap values('10452','Configure');
insert into StringsMap values('10453','Configure NTP Servers');
insert into StringsMap values('10454','Configure via PBC');
insert into StringsMap values('10455','Configure via PIN');
insert into StringsMap values('10456','Configure WAN in PPPoE Mode');
insert into StringsMap values('10457','Configured Client Routes');
insert into StringsMap values('10458','Configured IP Address already in use');
insert into StringsMap values('10459','Confirm New Password');
insert into StringsMap values('10460','Confirm Password');
insert into StringsMap values('10461','Connect');
insert into StringsMap values('10462','Connect Status');
insert into StringsMap values('10463','Connected');
insert into StringsMap values('10464','Connected Clients');
insert into StringsMap values('10465','Connection Name');
insert into StringsMap values('10466','Connection Status');
insert into StringsMap values('10467','Connection status update failed');
insert into StringsMap values('10468','Connection Type');
insert into StringsMap values('10469','Content Filtering');
insert into StringsMap values('10470','Content Filtering Configuration');
insert into StringsMap values('10471','Content Filtering Configuration Failed');
insert into StringsMap values('10472','Continue');
insert into StringsMap values('10473','Control Side Band');
insert into StringsMap values('10474','Cookies');
insert into StringsMap values('10475','Cost');
insert into StringsMap values('10476','Country');
insert into StringsMap values('10477','CPU idle');
insert into StringsMap values('10478','CPU usage by kernel');
insert into StringsMap values('10479','CPU usage by user');
insert into StringsMap values('10480','CPU Utilization');
insert into StringsMap values('10481','CPU waiting for IO');
insert into StringsMap values('10482','CRAM-MD5');
insert into StringsMap values('10483','Create Message');
insert into StringsMap values('10484','Critical');
insert into StringsMap values('10485','Crontab configuration failed');
insert into StringsMap values('10486','CRONTAB configuration failed');
insert into StringsMap values('10487','CTS-to-Self Protection');
insert into StringsMap values('10488','Current Channel');
insert into StringsMap values('10489','Current Router Time');
insert into StringsMap values('10490','Current WAN Mode');
insert into StringsMap values('10491','Custom');
insert into StringsMap values('10492','Custom Color');
insert into StringsMap values('10493','Custom MTU');
insert into StringsMap values('10494','Custom NTP Server');
insert into StringsMap values('10495','Custom Services');
insert into StringsMap values('10496','Custom Services Config');
insert into StringsMap values('10497','Custom Services Configuration');
insert into StringsMap values('10498','Customized Captive Portal Setup');
insert into StringsMap values('10499','Customized Login Portal Setup');
insert into StringsMap values('10500','Daily');
insert into StringsMap values('10501','Dashboard');
insert into StringsMap values('10502','Data to supply to CA');
insert into StringsMap values('10503','Date and Time');
insert into StringsMap values('10504','Day');
insert into StringsMap values('10505','Days');
insert into StringsMap values('10506','DD');
insert into StringsMap values('10507','DDNS Configuration Failed');
insert into StringsMap values('10508','Dead Interval');
insert into StringsMap values('10509','Debugging');
insert into StringsMap values('10510','Dedicated WAN');
insert into StringsMap values('10511','Default');
insert into StringsMap values('10512','Default Class Of Service');
insert into StringsMap values('10513','Default Group(s) cannot be deleted');
insert into StringsMap values('10514','Default IPv6 Gateway');
insert into StringsMap values('10515','Default NTP Server');
insert into StringsMap values('10516','Default Outbound Policy');
insert into StringsMap values('10517','Default Outbound Policy for IPV4');
insert into StringsMap values('10518','Default Outbound Policy for IPV6');
insert into StringsMap values('10519','Default Transmit Power');
insert into StringsMap values('10520','Default User(s) cannot be deleted');
insert into StringsMap values('10521','Defined Address Config');
insert into StringsMap values('10522','Defined Address Configuration');
insert into StringsMap values('10523','Defined Addresses');
insert into StringsMap values('10524','Defined Browsers');
insert into StringsMap values('10525','Defined Resource Addresses');
insert into StringsMap values('10526','Defined Resources');
insert into StringsMap values('10527','Delete');
insert into StringsMap values('10528','Delete Failed');
insert into StringsMap values('10529','Deleting the Only resourceObject of a resource will make the corresponding policy IN EFFECTIVE');
insert into StringsMap values('10530','Deny');
insert into StringsMap values('10531','Deny Login from Defined Addresses');
insert into StringsMap values('10532','Deny Login from Defined Browsers');
insert into StringsMap values('10533','Deny Login from WAN Interface');
insert into StringsMap values('10534','DER ASN1 DN');
insert into StringsMap values('10535','DES');
insert into StringsMap values('10536','Description');
insert into StringsMap values('10537','Dest Hosts');
insert into StringsMap values('10538','Destination');
insert into StringsMap values('10539','Destination Hosts');
insert into StringsMap values('10540','Destination IP Address');
insert into StringsMap values('10541','Destination NAT Settings');
insert into StringsMap values('10542','Destination Network');
insert into StringsMap values('10543','Detected multiple login failures. Imposed temporary lock on the user');
insert into StringsMap values('10544','Detection Period');
insert into StringsMap values('10545','Device Info');
insert into StringsMap values('10546','Device Model');
insert into StringsMap values('10547','Device Not Mounted');
insert into StringsMap values('10548','Device Statistics');
insert into StringsMap values('10549','Device Status');
insert into StringsMap values('10550','Device Type');
insert into StringsMap values('10551','Device Vendor');
insert into StringsMap values('10552','DH Group 14 (2048 bit)');
insert into StringsMap values('10553','DH Group 15 (3072 bit)');
insert into StringsMap values('10554','DH Group 16 (4096 bit)');
insert into StringsMap values('10555','DH Group 17 (6144 bit)');
insert into StringsMap values('10556','DH Group 18 (8192 bit)');
insert into StringsMap values('10557','DH Key ');
insert into StringsMap values('10558','Dh Key Status');
insert into StringsMap values('10559','Dh Key Uploaded');
insert into StringsMap values('10560','DHCP Configuration Failed');
insert into StringsMap values('10561','DHCP Connection (Dynamic IP Address)');
insert into StringsMap values('10562','DHCP for DMZ Connected Computers');
insert into StringsMap values('10563','DHCP LEASED CLIENTS');
insert into StringsMap values('10564','DHCP LEASED CLIENTS (DMZ)');
insert into StringsMap values('10565','DHCP Leased Clients (LAN)');
insert into StringsMap values('10566','DHCP Mode');
insert into StringsMap values('10567','DHCP Over IPsec Configuration Failed');
insert into StringsMap values('10568','DHCP Range');
insert into StringsMap values('10569','DHCP Range Over IPsec is in the same subnet.Please specify IP address in a different subnet.');
insert into StringsMap values('10570','DHCP range over IPsec should not include WAN1 IP address.');
insert into StringsMap values('10571','DHCP range should not include %s IP address.');
insert into StringsMap values('10572','DHCP range should not include WAN1 IP address.');
insert into StringsMap values('10573','DHCP Relay');
insert into StringsMap values('10574','Dhcp relay is enabled on DMZ network. To enable Dhcp server and disable dhcp relay on DMZ network automatically, click ''OK'' otherwise click ''CANCEL''.');
insert into StringsMap values('10575','Dhcp relay is enabled on LAN network. To enable Dhcp server and disable dhcp relay on LAN network automatically, click ''OK'' otherwise click ''CANCEL''.');
insert into StringsMap values('10576','DHCP Reserved IPs');
insert into StringsMap values('10577','DHCP Reserved IPs (DMZ)');
insert into StringsMap values('10578','DHCP RESERVED IPs (LAN)');
insert into StringsMap values('10579','DHCP Reserved IPs for LAN');
insert into StringsMap values('10580','DHCP Server');
insert into StringsMap values('10581','Dhcp server is enabled on DMZ network. To enable Dhcp relay and disable dhcp server on DMZ network automatically, click ''OK'' otherwise click ''CANCEL''.');
insert into StringsMap values('10582','Dhcp server is enabled on LAN network. To enable Dhcp relay and disable dhcp server on LAN network automatically, click ''OK'' otherwise click ''CANCEL''.');
insert into StringsMap values('10583','DHCP starting and ending IPs should not be equal to DMZ IP');
insert into StringsMap values('10584','DHCP starting and ending IPs should not be equal to LAN IP');
insert into StringsMap values('10585','DHCP Status');
insert into StringsMap values('10586','DHCPv6');
insert into StringsMap values('10587','DHCPv6 Leased Clients');
insert into StringsMap values('10588','DHCPv6 Leased Clients(LAN)');
insert into StringsMap values('10589','Dhcpv6 Options');
insert into StringsMap values('10590','Dial Number');
insert into StringsMap values('10591','Diffie-Hellman (DH) Group');
insert into StringsMap values('10592','Direction / Type');
insert into StringsMap values('10593','''Dis'' is a reserved style name.\n Please use a different style name');
insert into StringsMap values('10594','Disable');
insert into StringsMap values('10595','disable dhcpv6');
insert into StringsMap values('10596','Disable DHCPv6 Server');
insert into StringsMap values('10597','Disable Login');
insert into StringsMap values('10598','Disable not allowed since time schedule is Active');
insert into StringsMap values('10599','Disable PPPoE profile before delete');
insert into StringsMap values('10600','Disabled');
insert into StringsMap values('10601','Disabling of AP failed');
insert into StringsMap values('10602','Disconnect');
insert into StringsMap values('10603','Display');
insert into StringsMap values('10604','Display and Send Logs');
insert into StringsMap values('10605','Display banner message on login page');
insert into StringsMap values('10606','Display in Event Log');
insert into StringsMap values('10607','Display Logs');
insert into StringsMap values('10608','Display the IPv4 Routing Table');
insert into StringsMap values('10609','Display the IPv6 Routing Table');
insert into StringsMap values('10610','dlinkddns');
insert into StringsMap values('10611','DMZ');
insert into StringsMap values('10612','DMZ and WAN');
insert into StringsMap values('10613','DMZ Configuration Failed');
insert into StringsMap values('10614','DMZ DHCP Leased Clients');
insert into StringsMap values('10615','DMZ DHCP Reserved IPs');
insert into StringsMap values('10616','DMZ Information');
insert into StringsMap values('10617','DMZ IP address is in the same subnet. Please specify IP address in a different subnet.');
insert into StringsMap values('10618','DMZ Port Setup');
insert into StringsMap values('10619','DMZ Proxy');
insert into StringsMap values('10620','DMZ Setup');
insert into StringsMap values('10621','DMZ Setup Configuration');
insert into StringsMap values('10622','DMZ to LAN');
insert into StringsMap values('10623','DMZ to WAN');
insert into StringsMap values('10624','DNS');
insert into StringsMap values('10625','DNS Host Name Mapping');
insert into StringsMap values('10626','DNS Host Name Mapping configuration failed.');
insert into StringsMap values('10627','DNS Lookup for ');
insert into StringsMap values('10628','DNS lookup using DNS Servers');
insert into StringsMap values('10629','DNS lookup using WAN DNS Servers');
insert into StringsMap values('10630','DNS Server Source');
insert into StringsMap values('10631','DNS Servers');
insert into StringsMap values('10632','DNS settings');
insert into StringsMap values('10633','DNS Suffix(Optional)');
insert into StringsMap values('10634','Do you want this schedule to be active all day or at specific times during the day?');
insert into StringsMap values('10635','Do you want this schedule to be active on all days or specific days?');
insert into StringsMap values('10636','Do you want to enable UPnP?');
insert into StringsMap values('10637','Domain Name');
insert into StringsMap values('10638','Domain Name (Optional)');
insert into StringsMap values('10639','Domain name does not support ending character as');
insert into StringsMap values('10640','Domain Name System (DNS) Servers');
insert into StringsMap values('10641','Domain / Internet must contain only alphanumeric leters, ''.'' and ''-''');
insert into StringsMap values('10642','Domain / Internet must end with only alphanumerical character');
insert into StringsMap values('10643','Domain / Internet name must start with only alphanumerical character');
insert into StringsMap values('10644','DomainNames');
insert into StringsMap values('10645','Domains');
insert into StringsMap values('10646','Domains Configuration');
insert into StringsMap values('10647','Don''t Save Settings');
insert into StringsMap values('10648','DoS Attacks');
insert into StringsMap values('10649','double quote not allowed in FQDN string');
insert into StringsMap values('10650','Download');
insert into StringsMap values('10651','Dropped');
insert into StringsMap values('10652','Dropped In Packets');
insert into StringsMap values('10653','Dropped Out Packets');
insert into StringsMap values('10654','Dropped Packets');
insert into StringsMap values('10655','Dtim Interval');
insert into StringsMap values('10656','DUID');
insert into StringsMap values('10657','Dynamic DNS');
insert into StringsMap values('10658','Dynamic IP');
insert into StringsMap values('10659','Dynamic IP (DHCP)');
insert into StringsMap values('10660','Dynamic Routing (RIP)');
insert into StringsMap values('10661','dyndns');
insert into StringsMap values('10662','Each Lable length should not exceed 63 characters');
insert into StringsMap values('10663','Each node in the domain can only be 63 characters long.');
insert into StringsMap values('10664','Each octet length should not exceed 4');
insert into StringsMap values('10665','Easy Setup Site to Site VPN Tunnel');
insert into StringsMap values('10666','Echo Storm [ping pkts./sec]');
insert into StringsMap values('10667','Edge Device');
insert into StringsMap values('10668','Edit');
insert into StringsMap values('10669','Edit Failed');
insert into StringsMap values('10670','Editable Parameters');
insert into StringsMap values('10671','Editing of Group failed');
insert into StringsMap values('10672','Email Address (Optional)');
insert into StringsMap values('10673','E-mail ID does not contain a ''.'' character');
insert into StringsMap values('10674','E-mail ID does not contain an ''@'' character');
insert into StringsMap values('10675','Email logs configuration failed');
insert into StringsMap values('10676','E-Mail Server Address');
insert into StringsMap values('10677','Emergency');
insert into StringsMap values('10678','Empty lables(i.e. xxxx..xxxx) are not allowed');
insert into StringsMap values('10679','Empty space, '' and double quote characters are not supported for this field');
insert into StringsMap values('10680','Enable');
insert into StringsMap values('10681','Enable Advertisement');
insert into StringsMap values('10682','Enable ALGs');
insert into StringsMap values('10683','Enable Authentication for RIP-2B/2M');
insert into StringsMap values('10684','Enable Automatic Tunneling');
insert into StringsMap values('10685','Enable Bandwidth Profiles');
insert into StringsMap values('10686','Enable Client to Client Communication');
insert into StringsMap values('10687','Enable Content Filtering');
insert into StringsMap values('10688','Enable Daylight Saving');
insert into StringsMap values('10689','Enable Dead Peer Detection');
insert into StringsMap values('10690','Enable DHCP');
insert into StringsMap values('10691','Enable DHCPv6 Server');
insert into StringsMap values('10692','Enable DNS Proxy');
insert into StringsMap values('10693','Enable Editable Parameters');
insert into StringsMap values('10694','Enable E-Mail Logs');
insert into StringsMap values('10695','Enable IGMP Proxy');
insert into StringsMap values('10696','Enable Intel Amt Reflector');
insert into StringsMap values('10697','Enable Intrusion Detection');
insert into StringsMap values('10698','Enable Intrusion Prevention');
insert into StringsMap values('10699','Enable Jumbo Frames');
insert into StringsMap values('10700','Enable L2TP Secret Key');
insert into StringsMap values('10701','Enable L2TP Server?');
insert into StringsMap values('10702','Enable Mode Config');
insert into StringsMap values('10703','Enable NetBIOS');
insert into StringsMap values('10704','Enable not allowed since time schedule is InActive');
insert into StringsMap values('10705','Enable Openvpn');
insert into StringsMap values('10706','Enable Port Forwarding');
insert into StringsMap values('10707','Enable Ports');
insert into StringsMap values('10708','Enable PPTP Client');
insert into StringsMap values('10709','Enable PPTP Server?');
insert into StringsMap values('10710','Enable Pre-Authentication');
insert into StringsMap values('10711','Enable Prefix Delegation');
insert into StringsMap values('10712','Enable Remote Management');
insert into StringsMap values('10713','Enable Remote SNMP');
insert into StringsMap values('10714','Enable Remote SSH');
insert into StringsMap values('10715','Enable RollOver');
insert into StringsMap values('10716','Enable sharing');
insert into StringsMap values('10717','Enable Split Tunnel Support');
insert into StringsMap values('10718','Enable Split Tunnel Support to configure Client Routes');
insert into StringsMap values('10719','Enable Stealth Mode');
insert into StringsMap values('10720','Enable Tls Authentication Key');
insert into StringsMap values('10721','Enable USB Printer');
insert into StringsMap values('10722','Enable VLAN');
insert into StringsMap values('10723','Enable WMM');
insert into StringsMap values('10724','Enable XAUTH Client');
insert into StringsMap values('10725','Enabling ''Classical Routing'' will revert all DMZ and inbound firewall settings to defaults.');
insert into StringsMap values('10726','Enabling ''NAT'' will revert all DMZ and inbound firewall settings to defaults.');
insert into StringsMap values('10727','Enabling ''Transparent'' will revert all DMZ and inbound firewall settings to defaults.');
insert into StringsMap values('10728','Enabling of AP failed');
insert into StringsMap values('10729','Encr');
insert into StringsMap values('10730','Encryption');
insert into StringsMap values('10731','Encryption Algorithm');
insert into StringsMap values('10732','Encryption Key-In');
insert into StringsMap values('10733','Encryption Key-Out');
insert into StringsMap values('10734','Encryption Supported');
insert into StringsMap values('10735','End');
insert into StringsMap values('10736','End Address');
insert into StringsMap values('10737','End address should be higher than or equal to Start address');
insert into StringsMap values('10738','End hour cannot be less than the start hour');
insert into StringsMap values('10739','End IP Address');
insert into StringsMap values('10740','End IP address must greater than or equal to the start IP address');
insert into StringsMap values('10741','End IP address must greater than or equal to the start IP address');
insert into StringsMap values('10742','End IPv6 Address');
insert into StringsMap values('10743','End Port');
insert into StringsMap values('10744','End port must not be less than the start port');
insert into StringsMap values('10745','End Time hours cannot extend to next day');
insert into StringsMap values('10746','Ending IP Address');
insert into StringsMap values('10747','Ending IP Address must be in DMZ IP subnet: ');
insert into StringsMap values('10748','Ending IP Address must be in LAN subnet: ');
insert into StringsMap values('10749','Ending IP Address must be in the subnet of Starting IP Address : ');
insert into StringsMap values('10750','Ending IP Address must be in VLAN subnet:');
insert into StringsMap values('10751','Ending IP Address should be higher than or equal to Starting IP Address');
insert into StringsMap values('10752','Endpoint');
insert into StringsMap values('10753','Enter a proper value for NAT Keep Alive Frequency.');
insert into StringsMap values('10754','Enter a valid host name.');
insert into StringsMap values('10755','Enter a valid service name');
insert into StringsMap values('10756','Enter address in the form abcd:abcd:abcd:abcd:abcd:abcd:abcd:abcd');
insert into StringsMap values('10757','Enter Current Logged in Administrator Password');
insert into StringsMap values('10758','Enter IP in the same subnet as the interface');
insert into StringsMap values('10759','Enter IP within Same Subnet');
insert into StringsMap values('10760','Enter Local Server IP address');
insert into StringsMap values('10761','Enter Pass Phrase');
insert into StringsMap values('10762','Enter the range of IP addresses that is allocated to L2TP Clients');
insert into StringsMap values('10763','Enter the range of IP addresses that is allocated to PPTP Clients');
insert into StringsMap values('10764','Enter your new Password');
insert into StringsMap values('10765','Error');
insert into StringsMap values('10766','Error Message');
insert into StringsMap values('10767','Errors');
insert into StringsMap values('10768','Ethernet port configuration failed');
insert into StringsMap values('10769','Exactly 64 characters using 0-9 and A-F');
insert into StringsMap values('10770','Exchange Mode');
insert into StringsMap values('10771','Expiry Time');
insert into StringsMap values('10772','Export');
insert into StringsMap values('10773','Export Approved URLs');
insert into StringsMap values('10774','Export Blocked Keywords');
insert into StringsMap values('10775','Export Operation Failed.');
insert into StringsMap values('10776','Export Policy');
insert into StringsMap values('10777','Export Web Filter');
insert into StringsMap values('10778','Ext. Port');
insert into StringsMap values('10779','Extended Authentication Type');
insert into StringsMap values('10780','External IP Address');
insert into StringsMap values('10781','Facility');
insert into StringsMap values('10782','Factory Default settings');
insert into StringsMap values('10783','Failed to add route');
insert into StringsMap values('10784','Failed to add user');
insert into StringsMap values('10785','Failed to configure WEP key as the length is invalid');
insert into StringsMap values('10786','Failed to delete row(s)');
insert into StringsMap values('10787','Failed to delete user');
insert into StringsMap values('10788','Failed to edit');
insert into StringsMap values('10789','Failed to edit route');
insert into StringsMap values('10790','Failed to edit row');
insert into StringsMap values('10791','Failed to edit user');
insert into StringsMap values('10792','Failed to find Portal Information');
insert into StringsMap values('10793','Failed to find Portal Information');
insert into StringsMap values('10794','Failed to get login user''s session to check login users password');
insert into StringsMap values('10795','Failed to get login user''s session to check login users password');
insert into StringsMap values('10796','Failover after');
insert into StringsMap values('10797','Field cannot be left blank');
insert into StringsMap values('10798','File');
insert into StringsMap values('10799','File Size exceeded. Limit is 50kb');
insert into StringsMap values('10800','Finish Port');
insert into StringsMap values('10801','Firefox');
insert into StringsMap values('10802','Firewall Configuration Failed');
insert into StringsMap values('10803','Firewall LAN WAN Inbound Rule Configuration Failed');
insert into StringsMap values('10804','Firewall LAN WAN Outbound Rule Configuration Failed');
insert into StringsMap values('10805','Firewall Rule Configuration');
insert into StringsMap values('10806','Firewall Rules');
insert into StringsMap values('10807','Firewall Rules Config');
insert into StringsMap values('10808','Firewall Settings');
insert into StringsMap values('10809','Firmware');
insert into StringsMap values('10810','Firmware & Configuration (USB)');
insert into StringsMap values('10811','Firmware Date');
insert into StringsMap values('10812','Firmware Information');
insert into StringsMap values('10813','Firmware Query Link');
insert into StringsMap values('10814','Firmware Upgrade');
insert into StringsMap values('10815','Firmware Upgrade Notification Options');
insert into StringsMap values('10816','Firmware Version');
insert into StringsMap values('10817','Firmware via USB');
insert into StringsMap values('10818','Firmware file is invalid or corrupted');
insert into StringsMap values('10819','First');
insert into StringsMap values('10820','First Key Parameters');
insert into StringsMap values('10821','First Name');
insert into StringsMap values('10822','Font');
insert into StringsMap values('10823','Font Color');
insert into StringsMap values('10824','Font Size');
insert into StringsMap values('10825','Footer Content');
insert into StringsMap values('10826','Footer Details');
insert into StringsMap values('10827','Footer Font Color');
insert into StringsMap values('10828','For 3DES, every 8 bytes in 24 byte key-in should be different');
insert into StringsMap values('10829','For 3DES, every 8 bytes in 24 byte key-out should be different');
insert into StringsMap values('10830','for encryption algorithm: 3DES. Key must be 24 characters long.');
insert into StringsMap values('10831','for encryption algorithm: AES-128. Key must be 16 characters long.');
insert into StringsMap values('10832','for encryption algorithm: AES-192. Key must be 24 characters long.');
insert into StringsMap values('10833','for encryption algorithm: AES-256. Key must be 32 characters long.');
insert into StringsMap values('10834','for encryption algorithm: AES-CCM. Key must be 16 characters long.');
insert into StringsMap values('10835','for encryption algorithm: AES-GCM. Key must be 20 characters long.');
insert into StringsMap values('10836','for encryption algorithm: BLOWFISH . Key must be %s characters long.');
insert into StringsMap values('10837','for encryption algorithm: CAST128. Key must be %s characters long.');
insert into StringsMap values('10838','for encryption algorithm: DES. Key must be 8 characters long.');
insert into StringsMap values('10839','for encryption algorithm: TWOFISH (128). Key must be 16 characters long.');
insert into StringsMap values('10840','for encryption algorithm: TWOFISH (192). Key must be 24 characters long.');
insert into StringsMap values('10841','for encryption algorithm: TWOFISH (256). Key must be 32 characters long.');
insert into StringsMap values('10842','for integrity algorithm: MD5. Key must be 16 characters long.');
insert into StringsMap values('10843','for integrity algorithm: SHA1. Key must be 20 characters long.');
insert into StringsMap values('10844','for integrity algorithm: SHA2-224. Key must be 28 characters long.');
insert into StringsMap values('10845','for integrity algorithm: SHA2-256. Key must be 32 characters long.');
insert into StringsMap values('10846','for integrity algorithm: SHA2-384. Key must be 48 characters long.');
insert into StringsMap values('10847','for integrity algorithm: SHA2-512. Key must be 64 characters long.');
insert into StringsMap values('10848','Forward');
insert into StringsMap values('10849','FQDN');
insert into StringsMap values('10850','Frag Reass fail');
insert into StringsMap values('10851','Frag Reass OK');
insert into StringsMap values('10852','Fragmentation Threshold');
insert into StringsMap values('10853','Frags Received');
insert into StringsMap values('10854','Free Memory');
insert into StringsMap values('10855','Friday');
insert into StringsMap values('10856','From');
insert into StringsMap values('10857','From and To IP Addresses must be in same subnet.');
insert into StringsMap values('10858','From InterfaceName');
insert into StringsMap values('10859','From Zone');
insert into StringsMap values('10860','FTP Logs');
insert into StringsMap values('10861','Full Tunnel');
insert into StringsMap values('10862','Fully Qualified Domain Name');
insert into StringsMap values('10863','Gateway');
insert into StringsMap values('10864','Gateway IP Address');
insert into StringsMap values('10865','Gateway IP Address must be in Selected Interface Subnet: ');
insert into StringsMap values('10866','Gateway IP Address must be in the subnet:');
insert into StringsMap values('10867','General');
insert into StringsMap values('10868','General Details');
insert into StringsMap values('10869','generate key');
insert into StringsMap values('10870','Generate Self Certificate Request');
insert into StringsMap values('10871','Generate Self Certificate Request Failed');
insert into StringsMap values('10872','Get Dynamically from ISP');
insert into StringsMap values('10873','Import Users Database');
insert into StringsMap values('10874','Get Users DB file');
insert into StringsMap values('10875','Give your network a name, using up to 32 characters');
insert into StringsMap values('10876','Global');
insert into StringsMap values('10877','Global/Local/ISATAP');
insert into StringsMap values('10878','Green');
insert into StringsMap values('10879','Group');
insert into StringsMap values('10880','Group 1 (768 bit)');
insert into StringsMap values('10881','Group 2 (1024 bit)');
insert into StringsMap values('10882','Group 5 (1536 bit)');
insert into StringsMap values('10883','Group cannot be deleted');
insert into StringsMap values('10884','Group cannot be deleted if it contains User(s)');
insert into StringsMap values('10885','Group Configuration');
insert into StringsMap values('10886','Group Login Policies');
insert into StringsMap values('10887','Group Name');
insert into StringsMap values('10888','Group Policy By Client Browser');
insert into StringsMap values('10889','Groups');
insert into StringsMap values('10890','Groups Config');
insert into StringsMap values('10891','Groups Name already Exists');
insert into StringsMap values('10892','Groups Policy By Source IP Address');
insert into StringsMap values('10893','Guest User (readonly)');
insert into StringsMap values('10894','Guest User authentication Failed');
insert into StringsMap values('10895','Guest User authentication Failed');
insert into StringsMap values('10896','H.323');
insert into StringsMap values('10897','Hardware Version');
insert into StringsMap values('10898','Hash Algorithm');
insert into StringsMap values('10899','Header Background Color');
insert into StringsMap values('10900','Header Caption');
insert into StringsMap values('10901','Header Details');
insert into StringsMap values('10902','Header Image to Upload');
insert into StringsMap values('10903','Hello Interval');
insert into StringsMap values('10904','Hello Interval value should be less than Dead Interval value.');
insert into StringsMap values('10905','HELP');
insert into StringsMap values('10906','Help content goes here');
insert into StringsMap values('10907','Helpful Hints');
insert into StringsMap values('10908','HH');
insert into StringsMap values('10909','High');
insert into StringsMap values('10910','Host and Domain Name');
insert into StringsMap values('10911','Host Name');
insert into StringsMap values('10912','Host Name length should not exceed 255 characters');
insert into StringsMap values('10913','Host Name should not end with .(dot) / -(hyphen)');
insert into StringsMap values('10914','Host Name should not start with .(dot) / -(hyphen)');
insert into StringsMap values('10915','Hour');
insert into StringsMap values('10916','Hourly');
insert into StringsMap values('10917','Hours');
insert into StringsMap values('10918','HTTP meta tags for cache control (recommended)');
insert into StringsMap values('10919','HTTPS Port Number');
insert into StringsMap values('10920','IAID');
insert into StringsMap values('10921','IAPP configuration failed (BSSID Secret)');
insert into StringsMap values('10922','IAPP configuration failed (Remote AP)');
insert into StringsMap values('10923','IAPP disable failed');
insert into StringsMap values('10924','IAPP enable failed');
insert into StringsMap values('10925','ICMP');
insert into StringsMap values('10926','ICMP Flood [ICMP pkts./sec]');
insert into StringsMap values('10927','ICMP Received');
insert into StringsMap values('10928','ICMP Type');
insert into StringsMap values('10929','ICMP Type / Port Range');
insert into StringsMap values('10930','ICMPv6');
insert into StringsMap values('10931','ICSA Settings');
insert into StringsMap values('10932','ID');
insert into StringsMap values('10933','Identifier');
insert into StringsMap values('10934','Identifier Type');
insert into StringsMap values('10935','Idle Time Out');
insert into StringsMap values('10936','If you want to close the other session, please click on ''Continue'' button. Click ''Cancel'' button to logout');
insert into StringsMap values('10937','If you would like to configure the Internet settings of your new D-Link Systems Router manually, then click on the button below');
insert into StringsMap values('10938','If you would like to configure the VPN Policies of your new D-Link Systems Router manually, click on the button below.');
insert into StringsMap values('10939','If you would like to create a new SMS click on the button below.');
insert into StringsMap values('10940','If you would like to utilize our easy to use Web-based Wizards to assist you in connecting your new D-Link Systems Router to the Internet, click on the button below');
insert into StringsMap values('10941','If you would like to utilize our easy to use Web-based Wizards to assist you in VPN Configuration, click on the button below.');
insert into StringsMap values('10942','If you would like to view all messages in INBOX click on the button below.');
insert into StringsMap values('10943','If your wireless network is already set up with Wi-Fi Protected Setup, manual configuration of the wireless network will destroy the existing wireless network. If you would like to configure the wireless settings of your new D-Link Systems Router manually, then click on the Manual Wireless Network Setup button below');
insert into StringsMap values('10944','IGMP Allowed Networks delete failed');
insert into StringsMap values('10945','IGMP Configuration');
insert into StringsMap values('10946','IGMP Proxy Configuration Failed');
insert into StringsMap values('10947','IGMP Setup');
insert into StringsMap values('10948','IKE policy configuration failed');
insert into StringsMap values('10949','IKE policy configuration failed as the policy name is already in use');
insert into StringsMap values('10950','IKE policy configuration not found');
insert into StringsMap values('10951','IKE SA Parameters');
insert into StringsMap values('10952','IKE Version');
insert into StringsMap values('10953','IKEv1');
insert into StringsMap values('10954','IKEv2');
insert into StringsMap values('10955','Image');
insert into StringsMap values('10956','Import');
insert into StringsMap values('10957','Import Approved URLs');
insert into StringsMap values('10958','Import Blocked Keywords');
insert into StringsMap values('10959','Import Failed');
insert into StringsMap values('10960','In Interface');
insert into StringsMap values('10961','In Only');
insert into StringsMap values('10962','Inbox');
insert into StringsMap values('10963','Incoming (Response) Port Range');
insert into StringsMap values('10964','Incoming Packets');
insert into StringsMap values('10965','Incoming Ports');
insert into StringsMap values('10966','Information');
insert into StringsMap values('10967','Initiator');
insert into StringsMap values('10968','INSECURE (Dedicated WAN/Optional WAN)');
insert into StringsMap values('10969','INSECURE (WAN)');
insert into StringsMap values('10970','INSECURE (WAN1/WAN2/WAN3 (3G Internet))');
insert into StringsMap values('10971','Insert Failed');
insert into StringsMap values('10972','Int. Port');
insert into StringsMap values('10973','Integrity Algorithm');
insert into StringsMap values('10974','Integrity Key-In');
insert into StringsMap values('10975','Integrity Key-Out');
insert into StringsMap values('10976','Intel&#174; AMT');
insert into StringsMap values('10977','Intel&#174; AMT Reflector');
insert into StringsMap values('10978','Inter VLAN Routing Enable');
insert into StringsMap values('10979','Interface');
insert into StringsMap values('10980','Interface (DMZ/WAN2)');
insert into StringsMap values('10981','Interface (LAN)');
insert into StringsMap values('10982','Interface (LAN/WAN)');
insert into StringsMap values('10983','Interface (LAN/WAN1/DMZ/WAN2)');
insert into StringsMap values('10984','Interface (LAN/WAN1/DMZ/WAN2/WAN3)');
insert into StringsMap values('10985','Interface (VLAN)');
insert into StringsMap values('10986','Interface (WAN)');
insert into StringsMap values('10987','Interface (WAN1)');
insert into StringsMap values('10988','Interface Name');
insert into StringsMap values('10989','Internal IP Address');
insert into StringsMap values('10990','Internet');
insert into StringsMap values('10991','Internet Address');
insert into StringsMap values('10992','Internet Configuration Failed');
insert into StringsMap values('10993','Internet Configuration Not Found');
insert into StringsMap values('10994','Internet Configuration Not Found');
insert into StringsMap values('10995','Internet Connection');
insert into StringsMap values('10996','Internet Connection Setup Wizard');
insert into StringsMap values('10997','Internet Dest');
insert into StringsMap values('10998','Internet Explorer');
insert into StringsMap values('10999','Internet Name');
insert into StringsMap values('11000','Internet Settings');
insert into StringsMap values('11001','Intrusion Detection/Prevention Enable');
insert into StringsMap values('11002','Invalid active directory domain:');
insert into StringsMap values('11003','Invalid configuration, cannot add/edit policy');
insert into StringsMap values('11004','Invalid Day:');
insert into StringsMap values('11005','Invalid Detection Period -');
insert into StringsMap values('11006','Invalid Detection Period - Please enter a value between 10-999');
insert into StringsMap values('11007','Invalid dimensions for plot, width = '' %s '', height = '' %s');
insert into StringsMap values('11008','Invalid domain name:');
insert into StringsMap values('11009','Invalid E-mail ID');
insert into StringsMap values('11010','Invalid E-mail ID.''.'' character should not be the first/last character');
insert into StringsMap values('11011','Invalid E-mail ID.''@'' character should not be the first/last character');
insert into StringsMap values('11012','Invalid end time for schedule. Enter valid hour between 1 and 12');
insert into StringsMap values('11013','Invalid end time for schedule. Enter valid minutes between 0 and 59');
insert into StringsMap values('11014','Invalid FQDN. Please specify a Fully Qualified Domain Name for the remote endpoint');
insert into StringsMap values('11015','Invalid Hours:');
insert into StringsMap values('11016','Invalid Hours: Please enter a value between 1-12');
insert into StringsMap values('11017','Invalid ICMP Packets');
insert into StringsMap values('11018','Invalid incoming end port number - Please enter a value between 0-65535');
insert into StringsMap values('11019','Invalid incoming end port number.');
insert into StringsMap values('11020','Invalid incoming start port number - Please enter a value between 0-65535');
insert into StringsMap values('11021','Invalid incoming start port number.');
insert into StringsMap values('11022','Invalid IP Address.');
insert into StringsMap values('11023','Invalid IP Address/Domain name. Please enter a valid IP Address/Domain name.');
insert into StringsMap values('11024','Invalid IPv6 Address');
insert into StringsMap values('11025','Invalid Key Length for ');
insert into StringsMap values('11026','Invalid Key Length for BLOWFISH.');
insert into StringsMap values('11027','Invalid Key Length for CAST128.');
insert into StringsMap values('11028','Invalid mask length.');
insert into StringsMap values('11029','Invalid Minutes:');
insert into StringsMap values('11030','Invalid Minutes: Please enter a value between 0-59');
insert into StringsMap values('11031','Invalid Month:');
insert into StringsMap values('11032','Invalid MTU Size value:');
insert into StringsMap values('11033','Invalid Number');
insert into StringsMap values('11034','Invalid Number. Please enter a valid number.');
insert into StringsMap values('11035','Invalid octet length for octet ');
insert into StringsMap values('11036','Invalid outgoing end port number - Please enter a value between 1-65535');
insert into StringsMap values('11037','Invalid outgoing end port number.');
insert into StringsMap values('11038','Invalid outgoing start port number - Please enter a value between 1-65535');
insert into StringsMap values('11039','Invalid Packets');
insert into StringsMap values('11040','Invalid Password for Admin User');
insert into StringsMap values('11041','Invalid Password for Guest User');
insert into StringsMap values('11042','Invalid Password for SSLVPN User');
insert into StringsMap values('11043','Invalid password length. Please enter a password having 8 to 63 characters');
insert into StringsMap values('11044','Invalid PIN. Please enter correct PIN.');
insert into StringsMap values('11045','Invalid poll interval value: Please enter value between 1 - 99 seconds');
insert into StringsMap values('11046','Invalid Port Configured');
insert into StringsMap values('11047','Invalid Port.Please enter port between 1-65535');
insert into StringsMap values('11048','Invalid pre-shared key: Please enter key with length between 8 - 64 characters');
insert into StringsMap values('11049','Invalid purpose, Cannot Upload Self Certificate');
insert into StringsMap values('11050','Invalid range of ports. end service port ('' %s '') should be greater than start service port ('' %s '')');
insert into StringsMap values('11051','Invalid Reconnect after failure count -');
insert into StringsMap values('11052','Invalid Reconnect after failure count - Please enter a value between 3-99');
insert into StringsMap values('11053','Invalid SA Life time value:');
insert into StringsMap values('11054','Invalid second active directory domain:');
insert into StringsMap values('11055','Invalid second workgroup:');
insert into StringsMap values('11056','Invalid Seconds:');
insert into StringsMap values('11057','Invalid start time for schedule. Enter valid hour between 1 and 12');
insert into StringsMap values('11058','Invalid start time for schedule. Enter valid minutes between 0 and 59');
insert into StringsMap values('11059','Invalid Station PIN');
insert into StringsMap values('11060','Invalid Subnet Mask ');
insert into StringsMap values('11061','Invalid username or password');
insert into StringsMap values('11062','Invalid value for Time to re-synchronize:');
insert into StringsMap values('11063','Invalid WAN Host Addresses');
insert into StringsMap values('11064','Invalid Wireless Security Type');
insert into StringsMap values('11065','Invalid workgroup:');
insert into StringsMap values('11066','Invalid Year:');
insert into StringsMap values('11067','Invalid: Day should be in range of (1 - 28) for the Month ''2'' (February)');
insert into StringsMap values('11068','Invalid: Day should be in range of (1 - 29) for the Month ''2'' (February) in a Leap Year');
insert into StringsMap values('11069','Invalid: Day should be in range of (1 - 30) for Months April, June, September, November');
insert into StringsMap values('11070','IP Address');
insert into StringsMap values('11071','IP Address (Optional)');
insert into StringsMap values('11072','IP Address / Domain Name');
insert into StringsMap values('11073','IP address already assigned to other mac address. Please give another IP address');
insert into StringsMap values('11074','IP address and Gateway IP should be in the same subnet.');
insert into StringsMap values('11075','IP address and Gateway should be in the same subnet');
insert into StringsMap values('11076','IP address range');
insert into StringsMap values('11077','IP Address range should be lesser than or equal to 255.');
insert into StringsMap values('11078','IP Aliases');
insert into StringsMap values('11079','IP Aliases Configuration');
insert into StringsMap values('11080','IP Aliasing');
insert into StringsMap values('11081','IP DSCP/TOS');
insert into StringsMap values('11082','IP Gateway');
insert into StringsMap values('11083','IP in the same subnet is already configured.');
insert into StringsMap values('11084','IP Mode Configuration Failed');
insert into StringsMap values('11085','IP Network');
insert into StringsMap values('11086','Ip Range for DHCP OVER IPsec');
insert into StringsMap values('11087','IP Subnet Mask');
insert into StringsMap values('11088','IP TOS/DiffServ Mapping');
insert into StringsMap values('11089','IP/MAC Binding');
insert into StringsMap values('11090','IP/MAC Binding Config');
insert into StringsMap values('11091','IP/MAC Binding Configuration');
insert into StringsMap values('11092','Ip/Mac Binding Deletion Failed');
insert into StringsMap values('11093','IP/MAC Binding List');
insert into StringsMap values('11094','IP/subnet is in conflict with LAN or WAN or VLANs. Please configure different pool');
insert into StringsMap values('11095','IP_CONFLICTING_WITH_DMZ_IPADDR');
insert into StringsMap values('11096','IP_CONFLICTING_WITH_LAN_IPADDR');
insert into StringsMap values('11097','IpMacBinding Configuration Failed');
insert into StringsMap values('11098','IPMode');
insert into StringsMap values('11099','IPS');
insert into StringsMap values('11100','IPS Checks Active Between');
insert into StringsMap values('11101','IPS Status');
insert into StringsMap values('11102','IPsec');
insert into StringsMap values('11103','IPsec Configuration');
insert into StringsMap values('11104','IPsec Host');
insert into StringsMap values('11105','IPsec Mode');
insert into StringsMap values('11106','IPsec Mode Config');
insert into StringsMap values('11107','IPsec Mode Config Configuration');
insert into StringsMap values('11108','IPsec mode configuration failed');
insert into StringsMap values('11109','IPsec mode configuration failed as the record name is already in use');
insert into StringsMap values('11110','IPsec mode delete failed');
insert into StringsMap values('11111','IPsec mode delete failed as mode is used in IKE policy');
insert into StringsMap values('11112','IPsec Policies');
insert into StringsMap values('11113','IPsec VPN configuration failed');
insert into StringsMap values('11114','IPsec VPN configuration failed as the remote end point is already in use');
insert into StringsMap values('11115','IPsec VPN delete failed');
insert into StringsMap values('11116','IPsec VPN disable failed');
insert into StringsMap values('11117','IPsec VPN enable failed');
insert into StringsMap values('11118','IPsec VPN policy(s) deleted successfully');
insert into StringsMap values('11119','IPsec VPN policy(s) disabled successfully');
insert into StringsMap values('11120','IPsec VPN policy(s) enabled successfully');
insert into StringsMap values('11121','IPv4 / IPv6 mode');
insert into StringsMap values('11122','IPv4 Address');
insert into StringsMap values('11123','IPv4 Connection State');
insert into StringsMap values('11124','IPv4 Connection Type');
insert into StringsMap values('11125','IPv4 only mode');
insert into StringsMap values('11126','IPv6');
insert into StringsMap values('11127','IPv6 Address');
insert into StringsMap values('11128','IPv6 Address Prefix And Pools Configuration');
insert into StringsMap values('11129','IPv6 Addresses');
insert into StringsMap values('11130','IPv6 Connection State');
insert into StringsMap values('11131','IPv6 Connection Type');
insert into StringsMap values('11132','IPv6 Destination');
insert into StringsMap values('11133','IPv6 Firewall Rules');
insert into StringsMap values('11134','IPv6 Firewall Rules Config');
insert into StringsMap values('11135','IPv6 Gateway');
insert into StringsMap values('11136','IPv6 LAN');
insert into StringsMap values('11137','IPv6 LAN Config');
insert into StringsMap values('11138','IPV6 Lan Configuration Failed');
insert into StringsMap values('11139','IPV6 Lan Pool Configuration Failed');
insert into StringsMap values('11140','IPV6 Lan Pool(s) Deleted Successfully');
insert into StringsMap values('11141','IPV6 Lan Pool(s) Deletion Failed');
insert into StringsMap values('11142','IPv6 LAN Pools Config');
insert into StringsMap values('11143','IPV6 Lan Prefix Configuration Failed');
insert into StringsMap values('11144','IPV6 Lan Prefix(es) Deleted Successfully');
insert into StringsMap values('11145','IPV6 Lan Prefix(es) Deletion Failed');
insert into StringsMap values('11146','IPv6 Logging');
insert into StringsMap values('11147','IPv6 Prefix');
insert into StringsMap values('11148','IPV6 Prefix Delegation Configuration');
insert into StringsMap values('11149','IPv6 Prefix Length');
insert into StringsMap values('11150','IPv6 Prefix Type');
insert into StringsMap values('11151','Ipv6 Route Added Successfully');
insert into StringsMap values('11152','Ipv6 Route Adding Failed');
insert into StringsMap values('11153','Ipv6 Route Delete Failed');
insert into StringsMap values('11154','Ipv6 Route Edit Failed');
insert into StringsMap values('11155','Ipv6 Route Edited Successfully');
insert into StringsMap values('11156','Ipv6 Route(s) Deleted Successfully');
insert into StringsMap values('11157','IPv6 Static Route Configuration');
insert into StringsMap values('11158','IPv6 Static Routing');
insert into StringsMap values('11159','IPv6 Static Routing Config');
insert into StringsMap values('11160','IPv6 support is not available for vipsecure');
insert into StringsMap values('11161','IPv6 Tunnels Status');
insert into StringsMap values('11162','IPV6 WAN Configuration Failed');
insert into StringsMap values('11163','IPv6 WAN1 Config');
insert into StringsMap values('11164','IPv6 WAN2 Config');
insert into StringsMap values('11165','ISATAP Subnet Prefix');
insert into StringsMap values('11166','ISATAP Tunnel Configuration Failed');
insert into StringsMap values('11167','ISATAP Tunnel(s) Deleted Successfully');
insert into StringsMap values('11168','ISATAP Tunnel(s) Deletion Failed');
insert into StringsMap values('11169','ISATAP Tunnels');
insert into StringsMap values('11170','ISATAP Tunnels Config ');
insert into StringsMap values('11171','isChkboxEnabled : Invalid arguments');
insert into StringsMap values('11172','ISP Connection Type');
insert into StringsMap values('11173','Issuer Name');
insert into StringsMap values('11174','Japanese multiple PPPoE');
insert into StringsMap values('11175','Java');
insert into StringsMap values('11176','Jumbo Frames Option');
insert into StringsMap values('11177','KB');
insert into StringsMap values('11178','KBytes');
insert into StringsMap values('11179','Keep Alive Frequency value of 0 disables the ''Keep Alive'' feature. Are you sure you want to proceed?');
insert into StringsMap values('11180','Kernel');
insert into StringsMap values('11181','Kernel Version');
insert into StringsMap values('11182','Key length');
insert into StringsMap values('11183','Key Length must be multiple of 8.');
insert into StringsMap values('11184','L2TP');
insert into StringsMap values('11185','L2TP (Username/Password)');
insert into StringsMap values('11186','L2TP Active Users');
insert into StringsMap values('11187','L2TP client');
insert into StringsMap values('11188','L2TP IP');
insert into StringsMap values('11189','L2TP Routing Mode');
insert into StringsMap values('11190','L2TP Secret Key');
insert into StringsMap values('11191','L2TP Server');
insert into StringsMap values('11192','L2TP Server Configuration');
insert into StringsMap values('11193','L2TP User');
insert into StringsMap values('11194','LAN');
insert into StringsMap values('11195','LAN / DMZ IP address');
insert into StringsMap values('11196','LAN and WAN');
insert into StringsMap values('11197','LAN Clients');
insert into StringsMap values('11198','LAN DHCP Leased Clients');
insert into StringsMap values('11199','LAN DHCP Reserved IPs');
insert into StringsMap values('11200','LAN groups Configuration Failed');
insert into StringsMap values('11201','LAN Hosts Configuration Failed');
insert into StringsMap values('11202','LAN Information');
insert into StringsMap values('11203','LAN interface has the same subnet ');
insert into StringsMap values('11204','LAN IP changes might lead to an interruption in connectivity.\n Please renew connected host''s IP address.');
insert into StringsMap values('11205','LAN MAC Address');
insert into StringsMap values('11206','LAN Proxy');
insert into StringsMap values('11207','LAN Security Checks');
insert into StringsMap values('11208','LAN SETUP');
insert into StringsMap values('11209','LAN Setup Configuration');
insert into StringsMap values('11210','LAN TCP/IP Setup');
insert into StringsMap values('11211','LAN to DMZ');
insert into StringsMap values('11212','LAN to WAN');
insert into StringsMap values('11213','LAN/DMZ IP Address');
insert into StringsMap values('11214','Last');
insert into StringsMap values('11215','Last Name');
insert into StringsMap values('11216','Layout Name');
insert into StringsMap values('11217','LCP Timeout');
insert into StringsMap values('11218','LDAP');
insert into StringsMap values('11219','LDAP attribute 1');
insert into StringsMap values('11220','LDAP attribute 2');
insert into StringsMap values('11221','LDAP attribute 3');
insert into StringsMap values('11222','LDAP attribute 4');
insert into StringsMap values('11223','LDAP Base DN');
insert into StringsMap values('11224','Lease Time');
insert into StringsMap values('11225','Lease/Rebind Time');
insert into StringsMap values('11226','Left');
insert into StringsMap values('11227','Life Time');
insert into StringsMap values('11228','Link Local Connectivity');
insert into StringsMap values('11229','Link State');
insert into StringsMap values('11230','List Of Approved Mail Ids');
insert into StringsMap values('11231','List of Available Access Points');
insert into StringsMap values('11232','List of Available Application Rules');
insert into StringsMap values('11233','List OF Available Custom Services');
insert into StringsMap values('11234','List of Available Firewall Rules');
insert into StringsMap values('11235','List of Available ISATAP Tunnels');
insert into StringsMap values('11236','List of Available Profiles');
insert into StringsMap values('11237','List of Available Protocol Bindings');
insert into StringsMap values('11238','List of Available Schedules');
insert into StringsMap values('11239','List of available VLANs');
insert into StringsMap values('11240','List of Bandwidth Profiles');
insert into StringsMap values('11241','List Of Blocked Mail Ids');
insert into StringsMap values('11242','List of Captive Portal Sessions');
insert into StringsMap values('11243','List of Configured Applications for Port Forwarding');
insert into StringsMap values('11244','List of Configured Host Names for Port Forwarding');
insert into StringsMap values('11245','List of Domains');
insert into StringsMap values('11246','List of Groups');
insert into StringsMap values('11247','List of IP Aliases');
insert into StringsMap values('11248','List of IP/MAC Binding');
insert into StringsMap values('11249','List of IPv6 Address Pools');
insert into StringsMap values('11250','List of IPv6 Static Routes');
insert into StringsMap values('11251','List of L2TP Active Users');
insert into StringsMap values('11252','List of LAN Clients');
insert into StringsMap values('11253','List of Layouts');
insert into StringsMap values('11254','List of PPTP Active Users');
insert into StringsMap values('11255','List of Prefixes for Prefix Delegation');
insert into StringsMap values('11256','List of Prefixes to Advertise');
insert into StringsMap values('11257','List of Profiles');
insert into StringsMap values('11258','List of Resources');
insert into StringsMap values('11259','List of SSL VPN Policies');
insert into StringsMap values('11260','List of Static Routes');
insert into StringsMap values('11261','List of Traffic Selectors');
insert into StringsMap values('11262','List of Users');
insert into StringsMap values('11263','List of VPN Policies');
insert into StringsMap values('11264','Listen on Port');
insert into StringsMap values('11265','Load Balancing');
insert into StringsMap values('11266','Load Tolerance');
insert into StringsMap values('11267','Local');
insert into StringsMap values('11268','Local End IP Address');
insert into StringsMap values('11269','Local Gateway');
insert into StringsMap values('11270','Local Gateway Type');
insert into StringsMap values('11271','Local Identification');
insert into StringsMap values('11272','Local Identifier');
insert into StringsMap values('11273','Local Identifier Type');
insert into StringsMap values('11274','Local interface IP address is in the same subnet. Please specify IP address in a different subnet.');
insert into StringsMap values('11275','Local IP');
insert into StringsMap values('11276','Local Network');
insert into StringsMap values('11277','Local Network IP Address');
insert into StringsMap values('11278','Local Network Subnet');
insert into StringsMap values('11279','Local Network Subnet Mask');
insert into StringsMap values('11280','Local PPP Interface');
insert into StringsMap values('11281','Local Server');
insert into StringsMap values('11282','Local Server IP Address');
insert into StringsMap values('11283','Local Start and End IP Addresses must be in same subnet.');
insert into StringsMap values('11284','Local Start IP Address');
insert into StringsMap values('11285','Local Subnet Mask');
insert into StringsMap values('11286','Local User Database');
insert into StringsMap values('11287','Local Wan IP');
insert into StringsMap values('11288','Local WAN''s IP Address / FQDN');
insert into StringsMap values('11289','Local0-wireless');
insert into StringsMap values('11290','Local1-UTM');
insert into StringsMap values('11291','Locate & select the certificate file');
insert into StringsMap values('11292','Header Image');
insert into StringsMap values('11293','Locate & select the upgrade file');
insert into StringsMap values('11294','Log');
insert into StringsMap values('11295','Log Alert');
insert into StringsMap values('11296','Log Critical');
insert into StringsMap values('11297','Log Debug');
insert into StringsMap values('11298','Log Dropped Packets');
insert into StringsMap values('11299','Log Emerg');
insert into StringsMap values('11300','Log Error');
insert into StringsMap values('11301','Log Info');
insert into StringsMap values('11302','Log Notice');
insert into StringsMap values('11303','Log Options');
insert into StringsMap values('11304','Log Settings');
insert into StringsMap values('11305','Log Warning');
insert into StringsMap values('11306','Login');
insert into StringsMap values('11307','Login Details');
insert into StringsMap values('11308','Login Plain');
insert into StringsMap values('11309','Login Policies');
insert into StringsMap values('11310','Login Policies Browser');
insert into StringsMap values('11311','Login Policies IP');
insert into StringsMap values('11312','Login Portal Header Image');
insert into StringsMap values('11313','Login Portal Setup');
insert into StringsMap values('11314','Login Profiles');
insert into StringsMap values('11315','Login Section Title');
insert into StringsMap values('11316','Login Status');
insert into StringsMap values('11317','Logout');
insert into StringsMap values('11318','Logs');
insert into StringsMap values('11319','Logs Configuration');
insert into StringsMap values('11320','Logs Facility');
insert into StringsMap values('11321','Long');
insert into StringsMap values('11322','Lookup');
insert into StringsMap values('11323','Low');
insert into StringsMap values('11324','Lower');
insert into StringsMap values('11325','MAC Address');
insert into StringsMap values('11326','MAC address already configured. Please give another MAC address');
insert into StringsMap values('11327','MAC Address configured is a Multicast MAC address');
insert into StringsMap values('11328','MAC address Deletion Failed');
insert into StringsMap values('11329','MAC address not found, please ensure you are on the DSR''s LAN subnet');
insert into StringsMap values('11330','MAC Address or IP Address already configured');
insert into StringsMap values('11331','MAC Address Source');
insert into StringsMap values('11332','MAC Filter');
insert into StringsMap values('11333','MAC Filter Configuration');
insert into StringsMap values('11334','MAC Filtering');
insert into StringsMap values('11335','Mac values 00:00:00:00:00:00 or FF:FF:FF:FF:FF:FF are invalid.');
insert into StringsMap values('11336','Mail Id');
insert into StringsMap values('11337','Main');
insert into StringsMap values('11338','Managed');
insert into StringsMap values('11339','Manual');
insert into StringsMap values('11340','Manual Internet Connection Options');
insert into StringsMap values('11341','Manual Internet Connection Setup');
insert into StringsMap values('11342','Manual Policy');
insert into StringsMap values('11343','Manual Time/Date configuration Failed');
insert into StringsMap values('11344','Manual VPN Configuration');
insert into StringsMap values('11345','Manual VPN Configuration Options');
insert into StringsMap values('11346','Manual Wireless Network Setup');
insert into StringsMap values('11347','Manually assign a network key');
insert into StringsMap values('11348','Mask Length');
insert into StringsMap values('11349','Max Bandwidth');
insert into StringsMap values('11350','Max limit of 4 APs reached');
insert into StringsMap values('11351','Max limit reached for the number of users');
insert into StringsMap values('11352','Maximize-Reliability');
insert into StringsMap values('11353','Maximize-Throughput');
insert into StringsMap values('11354','Maximum allowed Aliases already configured on the selected interface');
insert into StringsMap values('11355','Maximum Allowed VLANS Exceeded');
insert into StringsMap values('11356','Maximum Bandwidth Rate');
insert into StringsMap values('11357','Maximum characters limit exceeded. Please enter upto 160 characters.');
insert into StringsMap values('11358','Maximum Idle Time');
insert into StringsMap values('11359','Maximum limit reached for the number of users for this domain');
insert into StringsMap values('11360','Maximum limit reached for the number of users for this group');
insert into StringsMap values('11361','MCS0-6.5[13.5]');
insert into StringsMap values('11362','MCS10-39[81]');
insert into StringsMap values('11363','MCS1-13[27]');
insert into StringsMap values('11364','MCS11-52[108]');
insert into StringsMap values('11365','MCS12-78[162]');
insert into StringsMap values('11366','MCS13-104[216]');
insert into StringsMap values('11367','MCS14-117[243]');
insert into StringsMap values('11368','MCS15-130[270]');
insert into StringsMap values('11369','MCS2-19.5[40.5]');
insert into StringsMap values('11370','MCS3-26[54]');
insert into StringsMap values('11371','MCS4-39[81]');
insert into StringsMap values('11372','MCS5-52[108]');
insert into StringsMap values('11373','MCS6-58.5[121.5]');
insert into StringsMap values('11374','MCS7-65[135]');
insert into StringsMap values('11375','MCS8-13[27]');
insert into StringsMap values('11376','MCS9-26[54]');
insert into StringsMap values('11377','MD5');
insert into StringsMap values('11378','MD5 Auth Key');
insert into StringsMap values('11379','MD5 Authentication Key ');
insert into StringsMap values('11380','MD5 Checksum');
insert into StringsMap values('11381','MD5 Key Id');
insert into StringsMap values('11382','Medium');
insert into StringsMap values('11383','Memory Utilization');
insert into StringsMap values('11384','Menu');
insert into StringsMap values('11385','Metric');
insert into StringsMap values('11386','Min');
insert into StringsMap values('11387','Minimize-Cost');
insert into StringsMap values('11388','Minimize-Delay');
insert into StringsMap values('11389','Minimum Bandwidth Rate');
insert into StringsMap values('11390','Minute');
insert into StringsMap values('11391','MM');
insert into StringsMap values('11392','Mode');
insert into StringsMap values('11393','Mode Config can be enabled only when Client Policy is configured.');
insert into StringsMap values('11394','Monday');
insert into StringsMap values('11395','Month');
insert into StringsMap values('11396','More');
insert into StringsMap values('11397','Mount Program Not Found');
insert into StringsMap values('11398','Mount Status');
insert into StringsMap values('11399','Mounted');
insert into StringsMap values('11400','Move');
insert into StringsMap values('11401','Move To');
insert into StringsMap values('11402','Mppe 128 bit');
insert into StringsMap values('11403','Mppe 40 bit');
insert into StringsMap values('11404','Mppe Encryption');
insert into StringsMap values('11405','MS-CHAP');
insert into StringsMap values('11406','MS-CHAPv2');
insert into StringsMap values('11407','MTU');
insert into StringsMap values('11408','MTU Size');
insert into StringsMap values('11409','MULTI VLAN SUBNET');
insert into StringsMap values('11410','MULTI VLAN SUBNET CONFIG');
insert into StringsMap values('11411','MULTI VLAN SUBNET List');
insert into StringsMap values('11412','MULTI VLAN SUBNETS');
insert into StringsMap values('11413','Multicast');
insert into StringsMap values('11414','Multicast Mac Address is not allowed.');
insert into StringsMap values('11415','Multiple VLAN Subnets');
insert into StringsMap values('11416','My IP Address');
insert into StringsMap values('11417','MY IP Address is already configured.');
insert into StringsMap values('11418','NA');
insert into StringsMap values('11419','Name');
insert into StringsMap values('11420','NAT');
insert into StringsMap values('11421','NAT (IPv4 only)');
insert into StringsMap values('11422','NAT Keep Alive Frequency (in seconds)');
insert into StringsMap values('11423','Nat Traversal');
insert into StringsMap values('11424','Network Address');
insert into StringsMap values('11425','Network Address / IP Address');
insert into StringsMap values('11426','Network Name (SSID)');
insert into StringsMap values('11427','Network Resource');
insert into StringsMap values('11428','Network Settings');
insert into StringsMap values('11429','Never');
insert into StringsMap values('11430','New Password');
insert into StringsMap values('11431','New Self Certificate');
insert into StringsMap values('11432','Next');
insert into StringsMap values('11433','No IKE Policy to Configure VPN Policy, Please Configure an Ike Policy');
insert into StringsMap values('11434','No Objects Configured for the selected Resource');
insert into StringsMap values('11435','No trusted certificate found, Cannot Upload Self Certificate');
insert into StringsMap values('11436','NoAuthNoPriv');
insert into StringsMap values('11437','None');
insert into StringsMap values('11438','Normal-Service');
insert into StringsMap values('11439','Not Available');
insert into StringsMap values('11440','Not Connected');
insert into StringsMap values('11441','Not Valid After');
insert into StringsMap values('11442','Not Valid Before');
insert into StringsMap values('11443','Note: Before launching these wizards, please make sure you have followed all steps outlined in the Quick Installation Guide included in the package');
insert into StringsMap values('11444','Note: Some changes made using this Setup Wizard may require you to change some settings on your wireless client adapters so they can still connect to the D-Link Router');
insert into StringsMap values('11445','Note: You may also need to provide a Host Name. If you do not have or know this information, please contact your ISP');
insert into StringsMap values('11446','Note: You will need to enter the same password as keys in this step into your wireless clients in order to enable proper wireless communication');
insert into StringsMap values('11447','Notification');
insert into StringsMap values('11448','NT Domain');
insert into StringsMap values('11449','NTP configuration failed');
insert into StringsMap values('11450','NTP Servers Configuration');
insert into StringsMap values('11451','Number of Signatures Loaded');
insert into StringsMap values('11452','Object Address');
insert into StringsMap values('11453','Object Type');
insert into StringsMap values('11454','Off');
insert into StringsMap values('11455','On');
insert into StringsMap values('11456','On Demand');
insert into StringsMap values('11457','One to one nat config failed');
insert into StringsMap values('11458','Only 0-9 and %s characters are allowed.');
insert into StringsMap values('11459','Only 0-9 and A-F are configurable in this field');
insert into StringsMap values('11460','Only 0-9 characters are allowed.');
insert into StringsMap values('11461','Only a-z, 0-9, .(dot) and -(hyphen) characters are allowed');
insert into StringsMap values('11462','Only a-z, A-Z, 0-9 and %s characters are allowed.');
insert into StringsMap values('11463','Only a-z, A-Z, 0-9 characters are allowed.');
insert into StringsMap values('11464','Only redundant VPN gateway status is allowed to change when backup policy is up');
insert into StringsMap values('11465','Only this PC');
insert into StringsMap values('11466','Open');
insert into StringsMap values('11467','Open Ports');
insert into StringsMap values('11468','Open System');
insert into StringsMap values('11469','OpenVPN');
insert into StringsMap values('11470','OpenVPN Authentication');
insert into StringsMap values('11471','OpenVPN Configuration');
insert into StringsMap values('11472','OpenVPN Local Network Configuration');
insert into StringsMap values('11473','OpenVPN Local Networks');
insert into StringsMap values('11474','OpenVPN Local Networks (Split Tunneling)');
insert into StringsMap values('11475','OpenVPN Remote Network Confguration');
insert into StringsMap values('11476','OpenVPN Remote Networks');
insert into StringsMap values('11477','OpenVPN Remote Networks (Site To Site)');
insert into StringsMap values('11478','OpenVPN Server/Client Configuration');
insert into StringsMap values('11479','Opera');
insert into StringsMap values('11480','Operating Frequency');
insert into StringsMap values('11481','Operation Failed');
insert into StringsMap values('11482','Operation Failed. Router cannot be accessible if all ports are disabled.');
insert into StringsMap values('11483','Operation Failed: WPS is enabled over this profile, cannot modify it.');
insert into StringsMap values('11484','Operation Succeeded');
insert into StringsMap values('11485','Operation Succeeded');
insert into StringsMap values('11486','Operation Successful');
insert into StringsMap values('11487','Operation Unsuccessful');
insert into StringsMap values('11488','Optional Port(LAN) is in use by port mirroring configuration');
insert into StringsMap values('11489','Optional Port(LAN) is using by bandwidth profiles traffic selectors');
insert into StringsMap values('11490','Optional WAN');
insert into StringsMap values('11491','oray');
insert into StringsMap values('11492','Oray Domain');
insert into StringsMap values('11493','Oray Status');
insert into StringsMap values('11494','Oray User Type');
insert into StringsMap values('11495','OSPF');
insert into StringsMap values('11496','OSPFV2');
insert into StringsMap values('11497','Ospfv2 Configuration');
insert into StringsMap values('11498','Ospfv2 Enable');
insert into StringsMap values('11499','OSPFV3');
insert into StringsMap values('11500','Ospfv3 Configuration');
insert into StringsMap values('11501','Ospfv3 Enable');
insert into StringsMap values('11502','Other');
insert into StringsMap values('11503','Other Events Logs');
insert into StringsMap values('11504','Other IP');
insert into StringsMap values('11505','Out Interface');
insert into StringsMap values('11506','Out Only');
insert into StringsMap values('11507','Outgoing (Trigger) Port Range');
insert into StringsMap values('11508','Outgoing Packets');
insert into StringsMap values('11509','Outgoing Ports');
insert into StringsMap values('11510','Packet Capturing Started');
insert into StringsMap values('11511','Packet Capturing Stoped');
insert into StringsMap values('11512','Packet Trace');
insert into StringsMap values('11513','Packet tracing started.<br> Click the ''Stop'' button to stop packet tracing.');
insert into StringsMap values('11514','Packet tracing stopped.<br> Click the ''Download'' button to view the capture logs.');
insert into StringsMap values('11515','Packets');
insert into StringsMap values('11516','Page Background Color');
insert into StringsMap values('11517','PAP');
insert into StringsMap values('11518','Parameter missing');
insert into StringsMap values('11519','Password');
insert into StringsMap values('11520','Password changed by Administrator. Please login with new password');
insert into StringsMap values('11521','Password Changed. Please login again');
insert into StringsMap values('11522','Password could not be changed');
insert into StringsMap values('11523','Password has been changed');
insert into StringsMap values('11524','Passwords do not match');
insert into StringsMap values('11525','PBC');
insert into StringsMap values('11526','PBC (Push Button Configuration)');
insert into StringsMap values('11527','Peer IKE Identification');
insert into StringsMap values('11528','Peer PPP Interface IP');
insert into StringsMap values('11529','Perform a DNS Lookup');
insert into StringsMap values('11530','Permission');
insert into StringsMap values('11531','Permit');
insert into StringsMap values('11532','PFS Key Group');
insert into StringsMap values('11533','Phase1(IKE SA Parameters)');
insert into StringsMap values('11534','Phase2-(Auto Policy Parameters)');
insert into StringsMap values('11535','Phase2-(Manual Policy Parameters)');
insert into StringsMap values('11536','PIN');
insert into StringsMap values('11537','PIN (Personal Identification Number)');
insert into StringsMap values('11538','Ping');
insert into StringsMap values('11539','Ping or Trace an IP Address');
insert into StringsMap values('11540','Ping these IP addresses');
insert into StringsMap values('11541','Ping through vpn tunnel failed');
insert into StringsMap values('11542','Pinging');
insert into StringsMap values('11543','Please add atleast one resource to configure policy over Network Resource');
insert into StringsMap values('11544','Please Add Schedule First...');
insert into StringsMap values('11545','Please check '':'' positions');
insert into StringsMap values('11546','Please check minutes');
insert into StringsMap values('11547','Please check number of octets');
insert into StringsMap values('11548','Please configure at least one <a style=''color: #E9102A; text-decoration: underline'' href=''?page=accessPoints.htm''>AP</a> with WPA/WPA2 security to use this feature.');
insert into StringsMap values('11549','Please configure the <a style=''color: #E9102A; text-decoration: underline'' href=''?page=accessPoints.htm''>AP</a> with WPA/WPA2 security to use this feature.');
insert into StringsMap values('11550','Please Confirm new Password');
insert into StringsMap values('11551','Please Confirm Password');
insert into StringsMap values('11552','Please connect a USB storage key');
insert into StringsMap values('11553','Please disable corresponding VPN policy before making changes to this IKE policy');
insert into StringsMap values('11554','Please disable WPS on AP using this profile');
insert into StringsMap values('11555','Please disable XAuth user database option If you want to enable back up tunnel');
insert into StringsMap values('11556','Please Enable <a href=''?page=remoteManagement.htm''>Remote Management</a> to activate SSL VPN Configurations.');
insert into StringsMap values('11557','Please enable at least one <a style=''color: #E9102A; text-decoration: underline'' href=''?page=accessPoints.htm''>AP</a> with WPA/WPA2 security to use this feature.');
insert into StringsMap values('11558','Please enable Bandwidth Profiles to perform Add/Edit/Delete Operations');
insert into StringsMap values('11559','Please enable certificates from Certificates section');
insert into StringsMap values('11560','Please enable DHCP in <a href=''?page=dmzSetup.htm''>DMZ Configuration Page</a> to configure this page.');
insert into StringsMap values('11561','Please enable DHCP in <a href=''?page=dmzSetup.htm''>DMZ Configuration Page</a> to view Dhcp Leased Clients.');
insert into StringsMap values('11562','Please enable DHCP in <a href=''?page=lanConfigIpv6.htm''>IPv6 Lan Configuration Page</a> to view DHCPv6 Leased Clients.');
insert into StringsMap values('11563','Please enable DHCP in <a href=''?page=lanSetup.htm''>IPv4 Lan Configuration Page</a> to view DHCP Leased Clients.');
insert into StringsMap values('11564','Please enable DPD for this policy If you want to enable back up tunnel');
insert into StringsMap values('11565','Please enable first profile before enabling second profile');
insert into StringsMap values('11566','Please enable profiles before applying the configuration.');
insert into StringsMap values('11567','Please enable the <a style=''color: #E9102A; text-decoration: underline'' href=''?page=accessPoints.htm''>AP</a> with WPA/WPA2 security to use this feature.');
insert into StringsMap values('11568','Please enable UPnP to refresh UPnP Portmap Table.');
insert into StringsMap values('11569','Please enable VLAN  to configure available VLANs.');
insert into StringsMap values('11570','Please enable VLAN on <a style=''color: #E9102A; text-decoration: underline'' href=''?page=vlan.htm''>VLAN Configuration</a> to configure available VLANs.');
insert into StringsMap values('11571','Please enable VLAN on <a style=''color: #E9102A; text-decoration: underline'' href=''?page=vlan.htm''>VLAN Configuration</a> to configure Port VLANs.');
insert into StringsMap values('11572','Please enter 0 ');
insert into StringsMap values('11573','Please enter 0/128/192/224/240/248/252 ');
insert into StringsMap values('11574','Please enter 0/128/192/224/240/248/252/254/255 ');
insert into StringsMap values('11575','Please enter 255 ');
insert into StringsMap values('11576','Please enter a name for the IKE policy');
insert into StringsMap values('11577','Please enter a name for the VPN connection being configured');
insert into StringsMap values('11578','Please enter a name for the VPN policy');
insert into StringsMap values('11579','Please enter a pre-shared key to be used for the VPN connection');
insert into StringsMap values('11580','Please enter a valid Address');
insert into StringsMap values('11581','Please enter a valid Advertise Interval.');
insert into StringsMap values('11582','Please enter a valid APN for 3G Internet Connection.');
insert into StringsMap values('11583','Please enter a valid Authentication Secret');
insert into StringsMap values('11584','Please enter a valid Authentication Server');
insert into StringsMap values('11585','Please enter a valid Browser Title.');
insert into StringsMap values('11586','Please enter a valid Confirm Password');
insert into StringsMap values('11587','Please enter a valid Custom Color.');
insert into StringsMap values('11588','Please enter a valid Date');
insert into StringsMap values('11589','Please enter a valid Description');
insert into StringsMap values('11590','Please enter a valid DHCP lease time');
insert into StringsMap values('11591','Please enter a valid DHCP relay Gateway.');
insert into StringsMap values('11592','Please enter a valid Dial Number');
insert into StringsMap values('11593','Please enter a valid domain name extension.');
insert into StringsMap values('11594','Please enter a valid Domain Name.');
insert into StringsMap values('11595','Please enter a valid Domain/Internet name');
insert into StringsMap values('11596','Please enter a valid End IP Address');
insert into StringsMap values('11597','Please enter a valid end Port number');
insert into StringsMap values('11598','Please enter a valid ending IP address.');
insert into StringsMap values('11599','Please enter a valid ending IP subnetmask.');
insert into StringsMap values('11600','Please enter a valid Footer Content.');
insert into StringsMap values('11601','Please enter a valid From IP address.');
insert into StringsMap values('11602','Please enter a valid Group Name');
insert into StringsMap values('11603','Please enter a valid Hello Interval');
insert into StringsMap values('11604','Please enter a valid hexadecimal color code');
insert into StringsMap values('11605','Please enter a valid Host Name');
insert into StringsMap values('11606','Please enter a valid Hours');
insert into StringsMap values('11607','Please enter a valid Idle Time');
insert into StringsMap values('11608','Please enter a valid Idle Timeout value');
insert into StringsMap values('11609','Please enter a valid incoming SPI for manual policy entry');
insert into StringsMap values('11610','Please enter a valid Internal IP Address');
insert into StringsMap values('11611','Please enter a valid IP Address');
insert into StringsMap values('11612','Please enter a valid IP subnetmask.');
insert into StringsMap values('11613','Please enter a valid IPv6 address');
insert into StringsMap values('11614','Please enter a valid IPv6 address in the last two octets');
insert into StringsMap values('11615','Please enter a valid IPv6 Prefix');
insert into StringsMap values('11616','Please enter a valid IPv6 Prefix Length');
insert into StringsMap values('11617','Please enter a valid Key Length.');
insert into StringsMap values('11618','Please enter a valid LDAP Bind Name');
insert into StringsMap values('11619','Please enter a valid Lifetime');
insert into StringsMap values('11620','Please enter a valid local identifier');
insert into StringsMap values('11621','Please enter a valid login name or ID provided by your ISP');
insert into StringsMap values('11622','Please enter a valid MAC Address');
insert into StringsMap values('11623','Please enter a valid mask length');
insert into StringsMap values('11624','Please enter a valid Minutes');
insert into StringsMap values('11625','Please enter a valid Month');
insert into StringsMap values('11626','Please enter a valid MTU size');
insert into StringsMap values('11627','Please enter a valid MTU.');
insert into StringsMap values('11628','Please enter a valid My IP Address');
insert into StringsMap values('11629','Please enter a valid Name');
insert into StringsMap values('11630','Please enter a valid NAT keep alive frequency.');
insert into StringsMap values('11631','Please enter a valid network address/netmask combination.');
insert into StringsMap values('11632','Please enter a valid Network Name(SSID)');
insert into StringsMap values('11633','Please enter a valid outgoing SPI for manual policy entry');
insert into StringsMap values('11634','Please enter a valid Password');
insert into StringsMap values('11635','Please enter a valid peer identifier');
insert into StringsMap values('11636','Please enter a valid Port');
insert into StringsMap values('11637','Please enter a valid Port Number for Port 16992');
insert into StringsMap values('11638','Please enter a valid Port Number for Port 16993');
insert into StringsMap values('11639','Please enter a valid Port Number for Port 16994');
insert into StringsMap values('11640','Please enter a valid Port Number for Port 16995');
insert into StringsMap values('11641','Please enter a valid Port Number for Port 9971');
insert into StringsMap values('11642','Please enter a valid Prefix Length');
insert into StringsMap values('11643','Please enter a valid Pre-Shared Key');
insert into StringsMap values('11644','Please enter a valid Primary NTP Server Name/IP Address');
insert into StringsMap values('11645','Please enter a valid Profile Name.');
insert into StringsMap values('11646','Please enter a valid Active Directory Domain');
insert into StringsMap values('11647','Please enter a valid Retries');
insert into StringsMap values('11648','Please enter a valid Router Lifetime.');
insert into StringsMap values('11649','Please enter a valid Secondary NTP Server Name/IP Address');
insert into StringsMap values('11650','Please enter a valid Seconds');
insert into StringsMap values('11651','Please enter a valid Server Address');
insert into StringsMap values('11652','Please enter a valid Server Preference.');
insert into StringsMap values('11653','Please enter a valid service name');
insert into StringsMap values('11654','Please enter a valid Start IP Address');
insert into StringsMap values('11655','Please enter a valid start Port number');
insert into StringsMap values('11656','Please enter a valid starting IP address.');
insert into StringsMap values('11657','Please enter a valid Subnet Mask');
insert into StringsMap values('11658','Please enter a valid TCP Port Number');
insert into StringsMap values('11659','Please enter a valid Timeout value');
insert into StringsMap values('11660','Please enter a valid To IP address');
insert into StringsMap values('11661','Please enter a valid User Name');
insert into StringsMap values('11662','Please enter a valid Workgroup');
insert into StringsMap values('11663','Please enter a valid XAUTH password');
insert into StringsMap values('11664','Please enter a valid XAUTH user name');
insert into StringsMap values('11665','Please enter a valid Year');
insert into StringsMap values('11666','Please enter a value 0/128/192/224/240/248/252/254/255 for each octet.');
insert into StringsMap values('11667','Please enter a value between');
insert into StringsMap values('11668','Please enter a value between');
insert into StringsMap values('11669','Please enter a value in the form XX:XX:XX:XX:XX:XX ');
insert into StringsMap values('11670','Please enter a value in the form XXXXXX');
insert into StringsMap values('11671','Please enter a value not less than ');
insert into StringsMap values('11672','Please enter after how many failures failover has to occur');
insert into StringsMap values('11673','Please enter an Area');
insert into StringsMap values('11674','Please enter Common Name');
insert into StringsMap values('11675','Please enter first MD5 authentication key');
insert into StringsMap values('11676','Please enter ICMP Type');
insert into StringsMap values('11677','Please enter in 4 digits Format: 2010');
insert into StringsMap values('11678','Please enter it in 2 digit Format : 01');
insert into StringsMap values('11679','Please enter key with length between 8 - 64 characters');
insert into StringsMap values('11680','Please enter Local Network IP Address');
insert into StringsMap values('11681','Please enter Local Network Subnet Mask');
insert into StringsMap values('11682','Please enter new Password');
insert into StringsMap values('11683','Please enter Password');
insert into StringsMap values('11684','Please enter Remote Network IP Address');
insert into StringsMap values('11685','Please enter Remote Network Subnet Mask');
insert into StringsMap values('11686','Please enter second MD5 authentication key');
insert into StringsMap values('11687','Please enter the 3G WAN');
insert into StringsMap values('11688','Please enter the Community');
insert into StringsMap values('11689','Please enter the Dedicated WAN');
insert into StringsMap values('11690','Please enter the Destination IP Address');
insert into StringsMap values('11691','Please enter the email address to send the logs to');
insert into StringsMap values('11692','Please enter the email server address');
insert into StringsMap values('11693','Please enter the First Name');
insert into StringsMap values('11694','Please enter the full path and file name containing settings to be restored');
insert into StringsMap values('11695','Please enter the full path and file name of the image to be uploaded');
insert into StringsMap values('11696','Please enter the Gateway IP Address');
insert into StringsMap values('11697','Please enter the incoming encryption check key for manual policy entry');
insert into StringsMap values('11698','Please enter the incoming integrity key for manual policy entry');
insert into StringsMap values('11699','Please enter the IP Address');
insert into StringsMap values('11700','Please enter the Last Name');
insert into StringsMap values('11701','Please enter the life-time in seconds for the security association created by this policy');
insert into StringsMap values('11702','Please enter the local node''s IP address or internet name');
insert into StringsMap values('11703','Please enter the Log Identifier');
insert into StringsMap values('11704','Please enter the Mask Length');
insert into StringsMap values('11705','Please enter the Metric');
insert into StringsMap values('11706','Please enter the outgoing encryption key for manual policy entry');
insert into StringsMap values('11707','Please enter the outgoing integrity check key for manual policy entry');
insert into StringsMap values('11708','Please enter the Password for this connection');
insert into StringsMap values('11709','Please enter the PIN');
insert into StringsMap values('11710','Please enter the PIN from your wireless device and click the below ''Connect'' Button');
insert into StringsMap values('11711','Please enter the PolicyName');
insert into StringsMap values('11712','Please enter the Port Number between 0-65535');
insert into StringsMap values('11713','Please enter the pre-shared key for this connection');
insert into StringsMap values('11714','Please enter the remote node''s IP address or internet name');
insert into StringsMap values('11715','Please enter the Retry Interval');
insert into StringsMap values('11716','Please enter the return email address to be used when sending the logs via email');
insert into StringsMap values('11717','Please enter the RouteName');
insert into StringsMap values('11718','Please enter the Secondary WAN');
insert into StringsMap values('11719','Please enter the Schedule Name');
insert into StringsMap values('11720','Please enter the SMTP server login password');
insert into StringsMap values('11721','Please enter the SMTP server login user name');
insert into StringsMap values('11722','Please enter the Subnet Mask');
insert into StringsMap values('11723','Please enter the Token value for this connection');
insert into StringsMap values('11724','Please enter the User Name');
insert into StringsMap values('11725','Please enter the Value between 1-999');
insert into StringsMap values('11726','Please enter valid Ad Content.');
insert into StringsMap values('11727','Please enter valid Authentication Key');
insert into StringsMap values('11728','Please enter valid characters for ');
insert into StringsMap values('11729','Please enter valid CIDR subnet mask.');
insert into StringsMap values('11730','Please enter valid Cost');
insert into StringsMap values('11731','Please enter valid Dead Interval');
insert into StringsMap values('11732','Please enter Valid End IP Address');
insert into StringsMap values('11733','Please enter valid ip address');
insert into StringsMap values('11734','Please enter valid ipv4 or ipv6 address');
insert into StringsMap values('11735','Please enter valid ipv6 address like xxxx:: / ::xxxx / xxxx:xxxx:: / ::xxxx:xxxx / xxxx::xxxx');
insert into StringsMap values('11736','Please enter valid Load Tolerance value between 20 to 80');
insert into StringsMap values('11737','Please enter valid Local Server Address');
insert into StringsMap values('11738','Please enter valid Mail Id');
insert into StringsMap values('11739','Please enter valid Maximum Bandwidth value between 512bps to 8192bps');
insert into StringsMap values('11740','Please enter valid MD5 authentication key');
insert into StringsMap values('11741','Please enter valid MD5 Key Id');
insert into StringsMap values('11742','Please enter valid Nat IP Address');
insert into StringsMap values('11743','Please enter valid network address');
insert into StringsMap values('11744','Please enter valid number of octets.');
insert into StringsMap values('11745','Please enter valid Port Number');
insert into StringsMap values('11746','Please enter valid Prefix Length');
insert into StringsMap values('11747','Please enter valid Priority');
insert into StringsMap values('11748','Please enter valid Start IP Address');
insert into StringsMap values('11749','Please enter valid Subject');
insert into StringsMap values('11750','Please enter Valid SubnetMask');
insert into StringsMap values('11751','Please enter Valid Syslog server');
insert into StringsMap values('11752','Please enter valid value for octet ');
insert into StringsMap values('11753','Please enter valid WAN Host Addresses');
insert into StringsMap values('11754','Please enter Vpn Netmask greater than or equal to 255.255.0.0');
insert into StringsMap values('11755','PLEASE LOGIN - NOT LOGGED IN YET! - no cookie');
insert into StringsMap values('11756','Please press the push button on your wireless device and click the below ''Connect'' Button within 120 seconds');
insert into StringsMap values('11757','PLEASE RELOGIN - LOGIN EXPIRED! - you waited too long');
insert into StringsMap values('11758','Please Remove the idle timeout option for Dedicated/Secondary WAN');
insert into StringsMap values('11759','Please Select a particular profile for Basic Configuration');
insert into StringsMap values('11760','Please select Auto Policy when Mode Config is enabled.');
insert into StringsMap values('11761','Please select certificates from Certificates section');
insert into StringsMap values('11762','Please select day(s) on which this schedule should apply.');
insert into StringsMap values('11763','Please select one of following configuration methods and click next to continue');
insert into StringsMap values('11764','Please select Split Tunnel and configure this page.');
insert into StringsMap values('11765','Please select the Internet connection type below');
insert into StringsMap values('11766','Please select Tunnel Mode when Mode Config is enabled.');
insert into StringsMap values('11767','Please Set IP Mode to IPv4/IPv6 in <a href=''?page=ipMode.htm''>Routing Mode Page</a> to configure IPv6 Static Routes');
insert into StringsMap values('11768','Please Set IP Mode to IPv4/IPv6 in <a href=''?page=ipMode.htm''>Routing Mode Page</a> to configure policy for IPv6.');
insert into StringsMap values('11769','Please Set IP Mode to IPv4/IPv6 in <a href=''?page=ipMode.htm''>Routing Mode Page</a> to configure this page.');
insert into StringsMap values('11770','Please set the Configurable port to DMZ in <a href=''?page=configurablePort.htm''>Configurable Port Page</a> to configure this page.');
insert into StringsMap values('11771','Please set the Configurable Port to WAN in <a href=''?page=configurablePort.htm''>Configurable Port Mode Page</a> to configure this page.');
insert into StringsMap values('11772','Please set the optional port to DMZ in <a href=''?page=configurablePort.htm''>Optional Port Mode Page</a> to view DMZ DHCP Leased Clients.');
insert into StringsMap values('11773','Please specify a valid ');
insert into StringsMap values('11774','Please specify a valid Number');
insert into StringsMap values('11775','Please Turn On <a style=''color: #E9102A; text-decoration: underline'' href=''?page=contentFiltering.htm''>Content Filtering</a> to configure Approved URLs');
insert into StringsMap values('11776','Please Turn On <a style=''color: #E9102A; text-decoration: underline'' href=''?page=contentFiltering.htm''>Content Filtering</a> to Configure Blocked Keywords');
insert into StringsMap values('11777','Please Turn On <a style=''color: #E9102A; text-decoration: underline'' href=''?page=smtpalgConfig.htm''>SMTP ALG Status</a> to Configure Approved Mail Ids');
insert into StringsMap values('11778','Please Turn On <a style=''color: #E9102A; text-decoration: underline'' href=''?page=smtpalgConfig.htm''>SMTP ALG Status</a> to Configure Blocked Mail Ids');
insert into StringsMap values('11779','Please Turn On <a style=''color: #E9102A; text-decoration: underline'' href=''?page=smtpalgConfig.htm''>SMTP ALG Status</a> to Configure Subject List');
insert into StringsMap values('11780','Please upload DH Key and enable OpenVPN');
insert into StringsMap values('11781','Please upload required <a href=''?page=openVpnAuthentication.htm''>Certificates</a> to activate Openvpn Server/Client.');
insert into StringsMap values('11782','Please upload the client configuration and enable OpenVPN Access Server Client');
insert into StringsMap values('11783','PM');
insert into StringsMap values('11784','Policies By Browsers');
insert into StringsMap values('11785','Policies By IP');
insert into StringsMap values('11786','Policies In The File Already Exists');
insert into StringsMap values('11787','POLICY already exists');
insert into StringsMap values('11788','Policy For');
insert into StringsMap values('11789','Policy Name');
insert into StringsMap values('11790','Policy Type');
insert into StringsMap values('11791','PolicyName already exists');
insert into StringsMap values('11792','Poll Interval');
insert into StringsMap values('11793','Port');
insert into StringsMap values('11794','Port Forwarding');
insert into StringsMap values('11795','Port Forwarding Application Configuration');
insert into StringsMap values('11796','Port Forwarding Host Configuration');
insert into StringsMap values('11797','Port Management configuration failed.');
insert into StringsMap values('11798','Port Mode');
insert into StringsMap values('11799','Port Name');
insert into StringsMap values('11800','Port Range / Port Number');
insert into StringsMap values('11801','Port Speed');
insert into StringsMap values('11802','Port Statistics');
insert into StringsMap values('11803','Port Triggering Rule Configuration Failed');
insert into StringsMap values('11804','Port VLAN');
insert into StringsMap values('11805','Port VLAN configuration failed');
insert into StringsMap values('11806','Port Vlan is being used by Traffic Selector');
insert into StringsMap values('11807','Port Vlan is being used in Firewall rules');
insert into StringsMap values('11808','Port VLANs');
insert into StringsMap values('11809','Portal cannot be set as default if no domain uses it');
insert into StringsMap values('11810','Portal Layout and Theme Name');
insert into StringsMap values('11811','Portal Layout Configuration');
insert into StringsMap values('11812','Portal Layout Name');
insert into StringsMap values('11813','Portal Layouts');
insert into StringsMap values('11814','Portal Name');
insert into StringsMap values('11815','Portal Site Title(Optional)');
insert into StringsMap values('11816','Portal URL');
insert into StringsMap values('11817','PortalLayout can not Deleted if it contains Domain(s)');
insert into StringsMap values('11818','PortalLayout(s) Configuration Failed');
insert into StringsMap values('11819','PortalLayout(s) Deleted Successfully');
insert into StringsMap values('11820','PortForwarding Config Failed');
insert into StringsMap values('11821','Power Save Enable');
insert into StringsMap values('11822','Power Saving by Cable Length');
insert into StringsMap values('11823','Power Saving by Link Status');
insert into StringsMap values('11824','Power Saving Options');
insert into StringsMap values('11825','PPPoE');
insert into StringsMap values('11826','PPPoE (Username/Password)');
insert into StringsMap values('11827','PPPoE Profile Configuration');
insert into StringsMap values('11828','PPPoE Profile Configuration Failed');
insert into StringsMap values('11829','PPPoE Profile Delete Failed');
insert into StringsMap values('11830','PPPoE Profile Disabling Failed');
insert into StringsMap values('11831','PPPoE Profile Enabling Failed');
insert into StringsMap values('11832','PPPoE profiles with idle timeout option can not be configured in Load Balancing mode.');
insert into StringsMap values('11833','PPTP');
insert into StringsMap values('11834','PPTP (Username/Password)');
insert into StringsMap values('11835','PPTP Active Users');
insert into StringsMap values('11836','PPTP Client');
insert into StringsMap values('11837','PPTP Client Configuration');
insert into StringsMap values('11838','PPTP IP');
insert into StringsMap values('11839','PPTP Routing Mode');
insert into StringsMap values('11840','PPTP Server');
insert into StringsMap values('11841','PPTP Server Configuration');
insert into StringsMap values('11842','PPTP Server IP range is in the same subnet. Please specify IP address in a different subnet.');
insert into StringsMap values('11843','PPTP User');
insert into StringsMap values('11844','Preamble Mode');
insert into StringsMap values('11845','Prefix');
insert into StringsMap values('11846','Prefix Address');
insert into StringsMap values('11847','Prefix Delegation');
insert into StringsMap values('11848','Prefix Length');
insert into StringsMap values('11849','Prefix Lifetime');
insert into StringsMap values('11850','Prefix Obtained');
insert into StringsMap values('11851','Preparing to restore factory default settings. Are you sure you want to proceed?\n WARNING: Current configuration will be erased.');
insert into StringsMap values('11852','Preparing to restore saved settings from user-provided file. Are you sure you want to proceed?\n WARNING: Current configuration will be erased.');
insert into StringsMap values('11853','Preparing to upgrade firmware image. If the image selected for upgrade is of a different region than what is presently used on your device, the current configuration will be automatically reset to factory defaults.\n The upgrade process may take a few minutes. Are you sure you want to proceed?\n WARNING: Interrupting the upload or powering off the system during the upload may damage the firmware.');
insert into StringsMap values('11854','Pre-shared key');
insert into StringsMap values('11855','Pre-Shared Key value length must be atleast 8 characters');
insert into StringsMap values('11856','Prev');
insert into StringsMap values('11857','Primary DNS');
insert into StringsMap values('11858','Primary DNS Server');
insert into StringsMap values('11859','Primary DNS Server (Optional)');
insert into StringsMap values('11860','Primary DNS (IPv6)');
insert into StringsMap values('11861','Primary DNS (Optional)');
insert into StringsMap values('11862','Primary NTP Server');
insert into StringsMap values('11863','Primary PPPoE Domain Name System (DNS) Servers');
insert into StringsMap values('11864','Primary PPPoE Profile Configuration');
insert into StringsMap values('11865','Primary WAN');
insert into StringsMap values('11866','Primary WINServer (Optional)');
insert into StringsMap values('11867','Priority');
insert into StringsMap values('11868','Privacy Algorithm');
insert into StringsMap values('11869','Privacy Password');
insert into StringsMap values('11870','Private');
insert into StringsMap values('11871','Privilege');
insert into StringsMap values('11872','Product Page');
insert into StringsMap values('11873','Profile already in use');
insert into StringsMap values('11874','Profile Configuration');
insert into StringsMap values('11875','Profile configuration failed');
insert into StringsMap values('11876','Profile Name');
insert into StringsMap values('11877','Profile name already exists');
insert into StringsMap values('11878','Profile Name entered is already in use. Please enter another valid Profile Name');
insert into StringsMap values('11879','Profile Name(Optional)');
insert into StringsMap values('11880','Profile Type');
insert into StringsMap values('11881','Profiles');
insert into StringsMap values('11882','Protection Mode');
insert into StringsMap values('11883','Protocol');
insert into StringsMap values('11884','Protocol Binding Config');
insert into StringsMap values('11885','Protocol Binding Configuration');
insert into StringsMap values('11886','Protocol Binding Rule Configuration Failed');
insert into StringsMap values('11887','Protocol Bindings');
insert into StringsMap values('11888','Proxy');
insert into StringsMap values('11889','PSK');
insert into StringsMap values('11890','PSK+RADIUS');
insert into StringsMap values('11891','PVID');
insert into StringsMap values('11892','PVID 4094 Already Exists. Please Change PVID 4094');
insert into StringsMap values('11893','QoS configuration failed');
insert into StringsMap values('11894','QoS Priority');
insert into StringsMap values('11895','Query');
insert into StringsMap values('11896','RA Flags');
insert into StringsMap values('11897','Radio');
insert into StringsMap values('11898','Radio Configuration');
insert into StringsMap values('11899','Radio configuration failed');
insert into StringsMap values('11900','Radio Settings');
insert into StringsMap values('11901','RADIUS');
insert into StringsMap values('11902','RADIUS configuration failed');
insert into StringsMap values('11903','Radius Server');
insert into StringsMap values('11904','Radius Server Configuration');
insert into StringsMap values('11905','Radius setting');
insert into StringsMap values('11906','Radius-CHAP');
insert into StringsMap values('11907','Radius-MSCHAP');
insert into StringsMap values('11908','Radius-MSCHAPv2');
insert into StringsMap values('11909','Radius-PAP');
insert into StringsMap values('11910','RADVD');
insert into StringsMap values('11911','RADVD Configuration Failed');
insert into StringsMap values('11912','RADVD Prefix Configuration Failed');
insert into StringsMap values('11913','RADVD Prefix Deletion Failed');
insert into StringsMap values('11914','RADVD Status');
insert into StringsMap values('11915','Range');
insert into StringsMap values('11916','Rate');
insert into StringsMap values('11917','Reboot');
insert into StringsMap values('11918','Receive Dropped');
insert into StringsMap values('11919','Received');
insert into StringsMap values('11920','Receiver');
insert into StringsMap values('11921','Reconnect after failure count');
insert into StringsMap values('11922','Reconnect Mode');
insert into StringsMap values('11923','Red');
insert into StringsMap values('11924','Redirect to Port 16992');
insert into StringsMap values('11925','Redirect to Port 16993');
insert into StringsMap values('11926','Redirect to Port 16994');
insert into StringsMap values('11927','Redirect to Port 16995');
insert into StringsMap values('11928','Redirect to Port 9971');
insert into StringsMap values('11929','Redirected ICMP Packets');
insert into StringsMap values('11930','Redundant VPN gateway is for initiators only');
insert into StringsMap values('11931','Redundant VPN gateway is not for client policies');
insert into StringsMap values('11932','Reflector Should be enabled on atleast one port');
insert into StringsMap values('11933','Refresh');
insert into StringsMap values('11934','Refresh Logs');
insert into StringsMap values('11935','Region');
insert into StringsMap values('11936','Relay Gateway');
insert into StringsMap values('11937','Release');
insert into StringsMap values('11938','Remote & Local Network Configuration');
insert into StringsMap values('11939','Remote & Local WAN Addresses');
insert into StringsMap values('11940','Remote Access');
insert into StringsMap values('11941','Remote and Local Gateway IP Address / FQDN should not be same');
insert into StringsMap values('11942','Remote and Local Network IP Address should not be in the same subnet.');
insert into StringsMap values('11943','Remote End IP Address');
insert into StringsMap values('11944','Remote end point must not same as Dedicated WAN IP address');
insert into StringsMap values('11945','Remote end point must not same as Secondary WAN IP address');
insert into StringsMap values('11946','Remote Endpoint');
insert into StringsMap values('11947','Remote Gateway Type');
insert into StringsMap values('11948','Remote Identifier');
insert into StringsMap values('11949','Remote Identifier Type');
insert into StringsMap values('11950','Remote IP');
insert into StringsMap values('11951','Remote Log Identifier');
insert into StringsMap values('11952','Remote Logging');
insert into StringsMap values('11953','REMOTE LOGGING CONFIGURATION');
insert into StringsMap values('11954','Remote Management');
insert into StringsMap values('11955','Remote Management Enable');
insert into StringsMap values('11956','Remote Netmask');
insert into StringsMap values('11957','Remote Network');
insert into StringsMap values('11958','Remote Network IP Address');
insert into StringsMap values('11959','Remote Network Subnet');
insert into StringsMap values('11960','Remote Network Subnet Mask');
insert into StringsMap values('11961','Remote Start and End IP Addresses must be in same subnet.');
insert into StringsMap values('11962','Remote Start IP Address');
insert into StringsMap values('11963','Remote Subnet Mask');
insert into StringsMap values('11964','Remote Wan IP');
insert into StringsMap values('11965','Remote WAN''s IP Address / FQDN');
insert into StringsMap values('11966','Remove all DHCP Reserved DMZ IPs first');
insert into StringsMap values('11967','Remove all DHCP Reserved LAN IPs first');
insert into StringsMap values('11968','remove leading 0''s for octet ');
insert into StringsMap values('11969','Renew');
insert into StringsMap values('11970','Reply');
insert into StringsMap values('11971','Requested Data Not Found');
insert into StringsMap values('11972','Resource Configuration');
insert into StringsMap values('11973','Resource delete failed');
insert into StringsMap values('11974','Resource in use, Cannot delete the Resource');
insert into StringsMap values('11975','Resource Name');
insert into StringsMap values('11976','Resource Object');
insert into StringsMap values('11977','Resource Object Configuration');
insert into StringsMap values('11978','Resources');
insert into StringsMap values('11979','Respond to Identd from SMTP Server');
insert into StringsMap values('11980','Respond to Ping');
insert into StringsMap values('11981','Responder');
insert into StringsMap values('11982','Restore');
insert into StringsMap values('11983','Restore Default');
insert into StringsMap values('11984','Restore Saved Settings');
insert into StringsMap values('11985','Retries');
insert into StringsMap values('11986','Retry Interval is');
insert into StringsMap values('11987','Return E-Mail Address');
insert into StringsMap values('11988','Right');
insert into StringsMap values('11989','RIP Configuration Failed');
insert into StringsMap values('11990','RIP Direction');
insert into StringsMap values('11991','RIP Version');
insert into StringsMap values('11992','RIP-1');
insert into StringsMap values('11993','RIP-2B');
insert into StringsMap values('11994','RIP-2M');
insert into StringsMap values('11995','Round Robin');
insert into StringsMap values('11996','Route Added Successfully');
insert into StringsMap values('11997','Route Adding Failed');
insert into StringsMap values('11998','Route Already Exists');
insert into StringsMap values('11999','Route Delete Failed');
insert into StringsMap values('12000','Route Display...');
insert into StringsMap values('12001','Route Edit Failed');
insert into StringsMap values('12002','Route Edited Successfully');
insert into StringsMap values('12003','Route Name');
insert into StringsMap values('12004','Route Name Already Exists');
insert into StringsMap values('12005','Route(s) Deleted Successfully');
insert into StringsMap values('12006','Router Advertisement');
insert into StringsMap values('12007','Router Advertisement Daemon (RADVD)');
insert into StringsMap values('12008','Router Lifetime');
insert into StringsMap values('12009','Router Options');
insert into StringsMap values('12010','Router Preference');
insert into StringsMap values('12011','Router will be up in');
insert into StringsMap values('12012','Routing');
insert into StringsMap values('12013','Routing Logs');
insert into StringsMap values('12014','Routing Mode');
insert into StringsMap values('12015','System Routing Mode');
insert into StringsMap values('12016','Routing Mode Configuration Failed');
insert into StringsMap values('12017','RSA-Signature');
insert into StringsMap values('12018','RTS Threshold');
insert into StringsMap values('12019','RTSP');
insert into StringsMap values('12020','Rule(s) Delete Failed');
insert into StringsMap values('12021','Russian dual access L2TP');
insert into StringsMap values('12022','Russian dual access PPTP');
insert into StringsMap values('12023','rx');
insert into StringsMap values('12024','Rx B/s');
insert into StringsMap values('12025','Rx Pkts');
insert into StringsMap values('12026','SA Lifetime');
insert into StringsMap values('12027','SA-Lifetime (sec)');
insert into StringsMap values('12028','Saturday');
insert into StringsMap values('12029','Save a copy of current settings');
insert into StringsMap values('12030','Save Current Settings');
insert into StringsMap values('12031','Save Settings');
insert into StringsMap values('12032','Schedule Configuration');
insert into StringsMap values('12033','Schedule Configuration Failed');
insert into StringsMap values('12034','Schedule Is In Use, Delete Firewall Rule First');
insert into StringsMap values('12035','Schedule Is Not Available, Add Schedule First');
insert into StringsMap values('12036','Schedule Name');
insert into StringsMap values('12037','Schedule(s) Delete Failed');
insert into StringsMap values('12038','Scheduled Days');
insert into StringsMap values('12039','Scheduled Time of Day');
insert into StringsMap values('12040','Schedules');
insert into StringsMap values('12041','Sec');
insert into StringsMap values('12042','Second Active Directory Domain');
insert into StringsMap values('12043','Second Key Parameters');
insert into StringsMap values('12044','Second LDAP Base DN');
insert into StringsMap values('12045','Second Workgroup');
insert into StringsMap values('12046','Secondary DNS');
insert into StringsMap values('12047','Secondary DNS Server');
insert into StringsMap values('12048','Secondary DNS Server (Optional)');
insert into StringsMap values('12049','Secondary DNS (IPv6)');
insert into StringsMap values('12050','Secondary DNS (Optional)');
insert into StringsMap values('12051','Secondary NTP Server');
insert into StringsMap values('12052','Secondary PPPoE Domain Name System (DNS) Servers');
insert into StringsMap values('12053','Secondary PPPoE Profile Configuration');
insert into StringsMap values('12054','Secondary WAN');
insert into StringsMap values('12055','Secondary WINServer (Optional)');
insert into StringsMap values('12056','Secret');
insert into StringsMap values('12057','Secret Key');
insert into StringsMap values('12058','SECURE (LAN)');
insert into StringsMap values('12059','SECURE (VLAN)');
insert into StringsMap values('12060','Security');
insert into StringsMap values('12061','Security level');
insert into StringsMap values('12062','Security Mode');
insert into StringsMap values('12063','Select Group');
insert into StringsMap values('12064','Select Interface');
insert into StringsMap values('12065','Select Local Gateway');
insert into StringsMap values('12066','Select Network');
insert into StringsMap values('12067','Select Portal');
insert into StringsMap values('12068','Select Schedule');
insert into StringsMap values('12069','Select the appropriate time zone for your location. This information is required to configure the time-based options for the router');
insert into StringsMap values('12070','Select the Dynamic DNS Service');
insert into StringsMap values('12071','Select the upgrade file from your hard disk');
insert into StringsMap values('12072','Select this option if your wireless device supports WPS (Wi-Fi Protected Setup)');
insert into StringsMap values('12073','Select this option will display the current wireless settings for you to configure the wireless device manually');
insert into StringsMap values('12074','Select VAP');
insert into StringsMap values('12075','Select VPN Type');
insert into StringsMap values('12076','Selected all policies already enabled');
insert into StringsMap values('12077','Selected Firewall Rule(s) Delete Failed');
insert into StringsMap values('12078','Selected Firewall Rule(s) Deleted Successfully');
insert into StringsMap values('12079','Selected Firewall Rule(s) Disabled Successfully');
insert into StringsMap values('12080','Selected Firewall Rule(s) Disabling Failed');
insert into StringsMap values('12081','Selected Firewall Rule(s) Enabled Successfully');
insert into StringsMap values('12082','Selected Firewall Rule(s) Enabling Failed');
insert into StringsMap values('12083','Selected Group Name(s) are using in Keyword Blocking');
insert into StringsMap values('12084','Selected IKE Policy View');
insert into StringsMap values('12085','Selected interface does not have a valid ip address');
insert into StringsMap values('12086','Selected interface not found.');
insert into StringsMap values('12087','Selected Ip/Mac Bindings Deleted');
insert into StringsMap values('12088','Selected Mac Address Deleted');
insert into StringsMap values('12089','Selected policy is already using as backup policy');
insert into StringsMap values('12090','Selected Profile(s) are using by a VAP');
insert into StringsMap values('12091','Selected Protocol Binding Rule(s) Delete Failed');
insert into StringsMap values('12092','Selected Protocol Binding Rule(s) Deleted Successfully');
insert into StringsMap values('12093','Selected Protocol Binding Rule(s) Disabled Successfully');
insert into StringsMap values('12094','Selected Protocol Binding Rule(s) Disabling Failed');
insert into StringsMap values('12095','Selected Protocol Binding Rule(s) Enabled Successfully');
insert into StringsMap values('12096','Selected Protocol Binding Rule(s) Enabling Failed');
insert into StringsMap values('12097','selected Resources Deleted');
insert into StringsMap values('12098','Selected Rule(s) Deleted Successfully');
insert into StringsMap values('12099','Selected Schedule(s) Deleted Successfully');
insert into StringsMap values('12100','Selected Self Certificates Deleted');
insert into StringsMap values('12101','Selected service with same source and destination network already exists on different Local Gateway.');
insert into StringsMap values('12102','Selected Service(s) Deleted Successfull');
insert into StringsMap values('12103','Selected Trusted CAs Deleted');
insert into StringsMap values('12104','Self Certificate Requests');
insert into StringsMap values('12105','Send E-mail logs by Schedule');
insert into StringsMap values('12106','Send Logs');
insert into StringsMap values('12107','Send Message');
insert into StringsMap values('12108','Send to E-Mail Address(1)');
insert into StringsMap values('12109','Send to E-Mail Address(2)');
insert into StringsMap values('12110','Send to E-Mail Address(3)');
insert into StringsMap values('12111','Send to Syslog');
insert into StringsMap values('12112','Sender');
insert into StringsMap values('12113','Serial Number');
insert into StringsMap values('12114','Server');
insert into StringsMap values('12115','Server Address');
insert into StringsMap values('12116','Server IP');
insert into StringsMap values('12117','Server IP Address');
insert into StringsMap values('12118','Server Preference');
insert into StringsMap values('12119','Server / Client Cert Status');
insert into StringsMap values('12120','Server / Client Cert Subject Name');
insert into StringsMap values('12121','Server / Client Certificate');
insert into StringsMap values('12122','Server / Client Key');
insert into StringsMap values('12123','Server / Client Key Status');
insert into StringsMap values('12124','Server / Client Key Uploaded');
insert into StringsMap values('12125','Service');
insert into StringsMap values('12126','Service Configuration Failed');
insert into StringsMap values('12127','Service Is In Use, Delete Firewall Rule First');
insert into StringsMap values('12128','Service Is In Use, Disable/Delete Firewall Rule First');
insert into StringsMap values('12129','Service(s) Delete Failed');
insert into StringsMap values('12130','Session expired. Please login.');
insert into StringsMap values('12131','Session Running');
insert into StringsMap values('12132','Session Status');
insert into StringsMap values('12133','Set Date And Time');
insert into StringsMap values('12134','Set Date and Time Manually');
insert into StringsMap values('12135','Set Default');
insert into StringsMap values('12136','Set Static IP Address Connection');
insert into StringsMap values('12137','Set Username and Password Connection (L2TP)');
insert into StringsMap values('12138','Set Username and Password Connection (PPPoE)');
insert into StringsMap values('12139','Set Username and Password Connection (PPTP)');
insert into StringsMap values('12140','Setup');
insert into StringsMap values('12141','Setup Complete!');
insert into StringsMap values('12142','SETUP HELP');
insert into StringsMap values('12143','SHA-1');
insert into StringsMap values('12144','SHA2-256');
insert into StringsMap values('12145','SHA2-384');
insert into StringsMap values('12146','SHA2-512');
insert into StringsMap values('12147','SHA256');
insert into StringsMap values('12148','SHA512');
insert into StringsMap values('12149','Shared Key');
insert into StringsMap values('12150','Short');
insert into StringsMap values('12151','Short Retry Limit / Long Retry Limit');
insert into StringsMap values('12152','Show Preview');
insert into StringsMap values('12153','Signature Algorithm');
insert into StringsMap values('12154','Signature Key Length');
insert into StringsMap values('12155','Simple');
insert into StringsMap values('12156','Single');
insert into StringsMap values('12157','Single Address');
insert into StringsMap values('12158','Single IP Address');
insert into StringsMap values('12159','SIP');
insert into StringsMap values('12160','SIP ALG Configuration failed');
insert into StringsMap values('12161','Site-to-Site');
insert into StringsMap values('12162','SLA ID');
insert into StringsMap values('12163','Small');
insert into StringsMap values('12164','sms Deleteted Successfully');
insert into StringsMap values('12165','sms Deleting failed');
insert into StringsMap values('12166','SMS INBOX');
insert into StringsMap values('12167','SMS sending fail');
insert into StringsMap values('12168','SMS sent success');
insert into StringsMap values('12169','SMS Service');
insert into StringsMap values('12170','SMTP');
insert into StringsMap values('12171','SMTP ALG');
insert into StringsMap values('12172','SMTP ALG Configuration');
insert into StringsMap values('12173','SMTP ALG Status');
insert into StringsMap values('12174','SMTP Port');
insert into StringsMap values('12175','SMTP server configuration Failed');
insert into StringsMap values('12176','SNMP');
insert into StringsMap values('12177','SNMP Access Control Configuration');
insert into StringsMap values('12178','SNMP Access Control configuration failed');
insert into StringsMap values('12179','SNMP Configuration');
insert into StringsMap values('12180','SNMP System Info');
insert into StringsMap values('12181','SNMP System Information');
insert into StringsMap values('12182','SNMP Traps Configuration');
insert into StringsMap values('12183','SNMP traps configuration failed');
insert into StringsMap values('12184','SNMP v3 Users List');
insert into StringsMap values('12185','SNMP Version');
insert into StringsMap values('12186','SNMPv3 susers configuration failed');
insert into StringsMap values('12187','SNMPv3 User Configuration');
insert into StringsMap values('12188','Sno');
insert into StringsMap values('12189','Source Address Type');
insert into StringsMap values('12190','Source Hosts');
insert into StringsMap values('12191','Source Mac Filtering Configuration Failed');
insert into StringsMap values('12192','Source NAT Settings');
insert into StringsMap values('12193','Source Network');
insert into StringsMap values('12194','Specific Days');
insert into StringsMap values('12195','Specific Times');
insert into StringsMap values('12196','Specify WAN IPs');
insert into StringsMap values('12197','SPI-Incoming');
insert into StringsMap values('12198','SPILLOVER CONFIGURATION');
insert into StringsMap values('12199','Spillover Mode');
insert into StringsMap values('12200','SPI-Outgoing');
insert into StringsMap values('12201','Split DNS Configuration Failed');
insert into StringsMap values('12202','Split DNS Delete Failed');
insert into StringsMap values('12203','Split DNS Names');
insert into StringsMap values('12204','Split DNS Names Configuration');
insert into StringsMap values('12205','Split DNS record Doesn''t Exist');
insert into StringsMap values('12206','Split Tunnel');
insert into StringsMap values('12207','SS');
insert into StringsMap values('12208','SSHD configuration failed.');
insert into StringsMap values('12209','SSID');
insert into StringsMap values('12210','SSID already in use');
insert into StringsMap values('12211','SSL VPN Client');
insert into StringsMap values('12212','SSL VPN Client Route Configuration');
insert into StringsMap values('12213','SSL VPN client routes configuration failed');
insert into StringsMap values('12214','SSL VPN Policies');
insert into StringsMap values('12215','SSL VPN Policy Configuration');
insert into StringsMap values('12216','SSL VPN Portal Pages to Display');
insert into StringsMap values('12217','SSL VPN Server');
insert into StringsMap values('12218','SSL VPN User Disconnected Successfully');
insert into StringsMap values('12219','SSL VPN User State Reset Failed');
insert into StringsMap values('12220','SSLVPN Client Config Failed');
insert into StringsMap values('12221','SSL-VPN client pool is also in the same range. Please configure different IP.');
insert into StringsMap values('12222','SSLVPN Client''s Dynamic IP range is in the same subnet. Please specify IP address in a different subnet.');
insert into StringsMap values('12223','SSLVPN Logs');
insert into StringsMap values('12224','SSLVPN Policy Configuration Failed');
insert into StringsMap values('12225','SSLVPN Resource(s) Configuration Failed');
insert into StringsMap values('12226','SSLVPN Settings');
insert into StringsMap values('12227','SSLVPN User');
insert into StringsMap values('12228','SSLVPN User authentication Failed. Use the correct SSL portal URL to login');
insert into StringsMap values('12229','SSLVPN User authentication Failed. Use the correct SSL portal URL to login');
insert into StringsMap values('12230','SSLVPN User(s) Configuration Failed');
insert into StringsMap values('12231','Start');
insert into StringsMap values('12232','Start Address');
insert into StringsMap values('12233','Start IP Address');
insert into StringsMap values('12234','Start IPv6 Address');
insert into StringsMap values('12235','Start Port');
insert into StringsMap values('12236','Start Time');
insert into StringsMap values('12237','Starting IP Address');
insert into StringsMap values('12238','Starting IP Address must be in DMZ IP subnet: ');
insert into StringsMap values('12239','Starting IP Address must be in LAN subnet: ');
insert into StringsMap values('12240','Starting IP Address must be in VLAN subnet:');
insert into StringsMap values('12241','State');
insert into StringsMap values('12242','Stateful');
insert into StringsMap values('12243','Stateful Address Auto Configuration');
insert into StringsMap values('12244','stateful dhcpv6');
insert into StringsMap values('12245','Stateful Mppe');
insert into StringsMap values('12246','Stateless');
insert into StringsMap values('12247','Stateless Address Auto Configuration');
insert into StringsMap values('12248','stateless dhcpv6');
insert into StringsMap values('12249','stateless dhcpv6 with Prefix delegation');
insert into StringsMap values('12250','Static IP');
insert into StringsMap values('12251','Static IP Address');
insert into StringsMap values('12252','Static IP address and Gateway should be in the same subnet');
insert into StringsMap values('12253','Static IP Address Connection');
insert into StringsMap values('12254','Static IPv6');
insert into StringsMap values('12255','Static Route Configuration');
insert into StringsMap values('12256','Static Routing');
insert into StringsMap values('12257','Static Routing Config');
insert into StringsMap values('12258','Station PIN');
insert into StringsMap values('12259','Station PIN length is a multiple of 4.');
insert into StringsMap values('12260','Status');
insert into StringsMap values('12261','Status Help');
insert into StringsMap values('12262','Status Message');
insert into StringsMap values('12263','Status not OK');
insert into StringsMap values('12264','Status OK');
insert into StringsMap values('12265','Operation Succeeded');
insert into StringsMap values('12266','Step 1: Change your Password');
insert into StringsMap values('12267','Step 1: Select Configuration Method for your Wireless Network');
insert into StringsMap values('12268','Step 1: Select VPN Type for your VPN Network');
insert into StringsMap values('12269','Step 1: Welcome TO THE D-LINK WIRELESS SECURITY SETUP WIZARD');
insert into StringsMap values('12270','Step 2: Configure Remote & Local WAN Addresses');
insert into StringsMap values('12271','Step 2: Connect your Wireless Device');
insert into StringsMap values('12272','Step 2: Connect your Wireless Device');
insert into StringsMap values('12273','Step 2: Select your Time Zone');
insert into StringsMap values('12274','Step 2: Set your Wireless Security Password');
insert into StringsMap values('12275','Step 3: Configure Secure Connection Accessibility');
insert into StringsMap values('12276','Step 3: Configure your Internet Connection');
insert into StringsMap values('12277','Step 4: Save Settings and Connect');
insert into StringsMap values('12278','Stop');
insert into StringsMap values('12279','Stop Time');
insert into StringsMap values('12280','Subject');
insert into StringsMap values('12281','Subject List');
insert into StringsMap values('12282','Subject list Configuration');
insert into StringsMap values('12283','Subject Name');
insert into StringsMap values('12284','Subnet');
insert into StringsMap values('12285','Subnet Mask');
insert into StringsMap values('12286','Succesfully logged in');
insert into StringsMap values('12287','Sunday');
insert into StringsMap values('12288','Support Menu');
insert into StringsMap values('12289','Switch Settings');
insert into StringsMap values('12290','SYN Flood Detect Rate [max/sec]');
insert into StringsMap values('12291','SYS LOG SERVER CONFIGURATION');
insert into StringsMap values('12292','SysContact');
insert into StringsMap values('12293','SysLocation');
insert into StringsMap values('12294','Syslog configuration failed');
insert into StringsMap values('12295','SysLog Facility');
insert into StringsMap values('12296','SysLog Server');
insert into StringsMap values('12297','SysLog Severity');
insert into StringsMap values('12298','SysName');
insert into StringsMap values('12299','System');
insert into StringsMap values('12300','System Check');
insert into StringsMap values('12301','System configuration failed');
insert into StringsMap values('12302','System Logs');
insert into StringsMap values('12303','System Name');
insert into StringsMap values('12304','System up Time');
insert into StringsMap values('12305','Tahoma');
insert into StringsMap values('12306','TCP');
insert into StringsMap values('12307','TCP Port Number');
insert into StringsMap values('12308','Text');
insert into StringsMap values('12309','Text Message');
insert into StringsMap values('12310','TFTP');
insert into StringsMap values('12311','The domain cannot be bigger than 253 or less than 1 characters');
insert into StringsMap values('12312','The interface selected is down');
insert into StringsMap values('12313','The Internet Connection Setup Wizard has completed. Click the Connect button to save your settings and connect');
insert into StringsMap values('12314','The page will auto-refresh in ');
insert into StringsMap values('12315','The page will auto-refresh in <label id=''refreshTime''> </label> seconds');
insert into StringsMap values('12316','The selected group does not have SSLVPN privileges');
insert into StringsMap values('12317','The subnet specified is same as LAN/VLAN subnet, Please specify a different subnet.');
insert into StringsMap values('12318','The Wizard sets most parameters to defaults as proposed by the VPN Consortium (VPNC), and assumes a pre-shared key, which greatly simplifies setup. After creating the policies through the VPN Wizard, you can always update the parameters through the Setup -> VPN Settings Menu');
insert into StringsMap values('12319','The WPA Password key must meet one of following guildelines');
insert into StringsMap values('12320','There are two ways to add wireless device to your wireless network');
insert into StringsMap values('12321','This feature is not supported for this table');
insert into StringsMap values('12322','This Mac Address has already been configured for Configurable Wan.Please configure another Mac Address.');
insert into StringsMap values('12323','This Mac Address has already been configured for Wan1.Please configure another Mac Address.');
insert into StringsMap values('12324','This Port Already Reserved');
insert into StringsMap values('12325','This VAP is being used in WPS, cannot delete');
insert into StringsMap values('12326','This VAP is being used in WPS, cannot disable');
insert into StringsMap values('12327','This VAP is being used in WPS, cannot edit.');
insert into StringsMap values('12328','This wizard is designed to assist you in connecting your wireless device to your wireless router. It will guide you through step-by-step instructions on how to get your wireless device connected. Click the button below to begin');
insert into StringsMap values('12329','This wizard is designed to assist you in your wireless network setup. It will guide you through step-by-step instructions on how to set up your wireless network and how to make it secure');
insert into StringsMap values('12330','Thursday');
insert into StringsMap values('12331','Time');
insert into StringsMap values('12332','Time Connected');
insert into StringsMap values('12333','Time Remaining (Sec.)');
insert into StringsMap values('12334','Time to re-synchronize (in minutes)');
insert into StringsMap values('12335','Time Zone');
insert into StringsMap values('12336','Time/Date configuration Failed');
insert into StringsMap values('12337','Timeout');
insert into StringsMap values('12338','Times New Roman');
insert into StringsMap values('12339','Timestamp');
insert into StringsMap values('12340','TKIP');
insert into StringsMap values('12341','TKIP and AES');
insert into StringsMap values('12342','TKIP+CCMP');
insert into StringsMap values('12343','Tls Authentication Key');
insert into StringsMap values('12344','Tls Key Status');
insert into StringsMap values('12345','To');
insert into StringsMap values('12346','To InterfaceName');
insert into StringsMap values('12347','To prevent outsiders from accessing your network, the router will automatically assign a security to your network');
insert into StringsMap values('12348','To set up this connection you will need to have a complete list of IP information provided by your Internet Service Provider. If you have a Static IP connection and do not have this information, please contact your ISP.');
insert into StringsMap values('12349','To set up this connection you will need to have a Username and Password from your Internet Service Provider.  You also need L2TP IP address. If you do not have this information, please contact your ISP.');
insert into StringsMap values('12350','To set up this connection you will need to have a Username and Password from your Internet Service Provider. If you do not have this information, please contact your ISP.');
insert into StringsMap values('12351','To set up this connection you will need to have a Username and Password from your Internet Service Provider. You also need PPTP IP address.  If you do not have this information, please contact your ISP.');
insert into StringsMap values('12352','To set up this connection, please make sure that you are connected to the D-Link Router with the PC that was originally connected to your broadband connection. If you are, then select ''Clone your PC''s MAC Address'' option to copy your computer''s MAC address to the D-Link Router.');
insert into StringsMap values('12353','To Zone');
insert into StringsMap values('12354','Tools');
insert into StringsMap values('12355','Total Memory');
insert into StringsMap values('12356','Traceroute');
insert into StringsMap values('12357','Traceroute To');
insert into StringsMap values('12358','Traffic Management');
insert into StringsMap values('12359','Traffic Monitor');
insert into StringsMap values('12360','Traffic Selector Config');
insert into StringsMap values('12361','Traffic Selector Configuration');
insert into StringsMap values('12362','Traffic Selector Configuration Failed');
insert into StringsMap values('12363','Traffic Selector Match Type');
insert into StringsMap values('12364','Traffic Selector(s) Delete Failed');
insert into StringsMap values('12365','Traffic Selectors');
insert into StringsMap values('12366','Translate Port Number');
insert into StringsMap values('12367','Transmission Rate');
insert into StringsMap values('12368','Transmit Dropped');
insert into StringsMap values('12369','Transmit Power');
insert into StringsMap values('12370','Transmitted');
insert into StringsMap values('12371','Transparent');
insert into StringsMap values('12372','Transport Mode');
insert into StringsMap values('12373','Traps List');
insert into StringsMap values('12374','Trunk');
insert into StringsMap values('12375','Trusted Certificate (CA Certificate)');
insert into StringsMap values('12376','Trusted Certificates (CA Certificate)');
insert into StringsMap values('12377','Trusted Domain Configuration Failed');
insert into StringsMap values('12378','Trusted Domain Delete Failed');
insert into StringsMap values('12379','Trusted Domain(s) Deleted Successfully');
insert into StringsMap values('12380','Trusted Domains');
insert into StringsMap values('12381','Trying to configure Reserve Port.  To Proceed, click ''OK'' otherwise click ''CANCEL''.');
insert into StringsMap values('12382','Tuesday');
insert into StringsMap values('12383','Tunnel Mode');
insert into StringsMap values('12384','Tunnel Name');
insert into StringsMap values('12385','Tunnel Protocol');
insert into StringsMap values('12386','Tunnel Type');
insert into StringsMap values('12387','TWOFISH (128)');
insert into StringsMap values('12388','TWOFISH (192)');
insert into StringsMap values('12389','TWOFISH (256)');
insert into StringsMap values('12390','tx');
insert into StringsMap values('12391','tx ( KB )');
insert into StringsMap values('12392','tx ( Packets )');
insert into StringsMap values('12393','Tx B/s');
insert into StringsMap values('12394','Tx Pkts');
insert into StringsMap values('12395','Type');
insert into StringsMap values('12396','type property cannot be changed');
insert into StringsMap values('12397','UDP');
insert into StringsMap values('12398','UDP Connection Limit');
insert into StringsMap values('12399','Unable to delete AP');
insert into StringsMap values('12400','Unable to move rogue AP');
insert into StringsMap values('12401','Unicast only');
insert into StringsMap values('12402','Unit');
insert into StringsMap values('12403','Unmount Program Not Found');
insert into StringsMap values('12404','Unmout Failed');
insert into StringsMap values('12405','Unsolicited Multicast');
insert into StringsMap values('12406','Up time');
insert into StringsMap values('12407','Update every 30 days');
insert into StringsMap values('12408','Upgrade');
insert into StringsMap values('12409','Upload');
insert into StringsMap values('12410','Upload Access Server Client Configuration');
insert into StringsMap values('12411','Upload Active Self Certificate');
insert into StringsMap values('12412','Upload Active Self Certificate Request');
insert into StringsMap values('12413','Upload Status');
insert into StringsMap values('12414','Upload Trusted Certificate');
insert into StringsMap values('12415','Upload Trusted Certificates');
insert into StringsMap values('12416','UPnP');
insert into StringsMap values('12417','UPnP Enable');
insert into StringsMap values('12418','UPnP Port map Table');
insert into StringsMap values('12419','Upper');
insert into StringsMap values('12420','URL');
insert into StringsMap values('12421','Usage reports configuration failed');
insert into StringsMap values('12422','USB');
insert into StringsMap values('12423','USB configuration Failed');
insert into StringsMap values('12424','USB device connected is not a USB storage key');
insert into StringsMap values('12425','USB Device not connected..');
insert into StringsMap values('12426','USB Device not mounted..');
insert into StringsMap values('12427','USB Drive Status');
insert into StringsMap values('12428','USB Settings');
insert into StringsMap values('12429','USB SharePort');
insert into StringsMap values('12430','USB Status');
insert into StringsMap values('12431','USB: 3G Device Settings');
insert into StringsMap values('12432','USB: Device Connected');
insert into StringsMap values('12433','USB: Device Not Connected');
insert into StringsMap values('12434','USB: Printer Device Settings');
insert into StringsMap values('12435','USB: Storage Device Settings');
insert into StringsMap values('12436','USB1');
insert into StringsMap values('12437','USB-1');
insert into StringsMap values('12438','USB-1: 3G Device Settings');
insert into StringsMap values('12439','USB-1: Device Connected');
insert into StringsMap values('12440','USB-1: Device Not Connected');
insert into StringsMap values('12441','USB-1: Printer Device Settings');
insert into StringsMap values('12442','USB-1: Storage Device Settings');
insert into StringsMap values('12443','USB2');
insert into StringsMap values('12444','USB-2');
insert into StringsMap values('12445','USB-2: 3G Device Settings');
insert into StringsMap values('12446','USB-2: Device Connected');
insert into StringsMap values('12447','USB-2: Device Not Connected');
insert into StringsMap values('12448','USB-2: Printer Device Settings');
insert into StringsMap values('12449','USB-2: Storage Device Settings');
insert into StringsMap values('12450','Use below');
insert into StringsMap values('12451','Use Count');
insert into StringsMap values('12452','Use Default Address');
insert into StringsMap values('12453','Use DNS from ISP');
insert into StringsMap values('12454','Use DNS Proxy');
insert into StringsMap values('12455','Use only single WAN port');
insert into StringsMap values('12456','Use These DNS Servers');
insert into StringsMap values('12457','Use this MAC Address');
insert into StringsMap values('12458','Use this options if you prefer to create our own key');
insert into StringsMap values('12459','Use wildcards');
insert into StringsMap values('12460','Used Applications');
insert into StringsMap values('12461','Used Memory');
insert into StringsMap values('12462','User');
insert into StringsMap values('12463','User already exists');
insert into StringsMap values('12464','User authentication Failed. Only default portal''s users should be allowed to login');
insert into StringsMap values('12465','User authentication Failed. Only default portal''s users should be allowed to login');
insert into StringsMap values('12466','User configuration failed');
insert into StringsMap values('12467','User database upload is in progress.Please wait...');
insert into StringsMap values('12468','User deletion failed due to logged in users');
insert into StringsMap values('12469','User Disconnect Failed');
insert into StringsMap values('12470','User Name');
insert into StringsMap values('12471','User Name Changed');
insert into StringsMap values('12472','User Time-out');
insert into StringsMap values('12473','Privilege Type');
insert into StringsMap values('12474','User-FQDN');
insert into StringsMap values('12475','Username / Password Connection (L2TP)');
insert into StringsMap values('12476','Username / Password Connection (PPPoE)');
insert into StringsMap values('12477','Username / Password Connection (PPTP)');
insert into StringsMap values('12478','Internal Users Data');
insert into StringsMap values('12479','Users Config ');
insert into StringsMap values('12480','Users Configuration');
insert into StringsMap values('12481','v1');
insert into StringsMap values('12482','v2c');
insert into StringsMap values('12483','v3');
insert into StringsMap values('12484','VAP Name');
insert into StringsMap values('12485','Verdana');
insert into StringsMap values('12486','Verify Password');
insert into StringsMap values('12487','Video');
insert into StringsMap values('12488','View');
insert into StringsMap values('12489','View All Logs');
insert into StringsMap values('12490','View Certificate Request Data');
insert into StringsMap values('12491','View List of SSL VPN Policies For');
insert into StringsMap values('12492','View SSLVPN Logs');
insert into StringsMap values('12493','Virtual AP');
insert into StringsMap values('12494','VLAN');
insert into StringsMap values('12495','VLAN Configuration');
insert into StringsMap values('12496','VLAN configuration failed');
insert into StringsMap values('12497','VLAN Configuration Update Failed');
insert into StringsMap values('12498','Vlan ID');
insert into StringsMap values('12499','VLAN Membership');
insert into StringsMap values('12500','VLAN Membership Configuration');
insert into StringsMap values('12501','VLAN Settings');
insert into StringsMap values('12502','VLAN to VLAN');
insert into StringsMap values('12503','VLANID 4094 Already Exists. Please delete VLANID 4094');
insert into StringsMap values('12504','VLANID is in use');
insert into StringsMap values('12505','Voice');
insert into StringsMap values('12506','VPN CONFIG EXPORT WIZARD FOR REMOTE DSR');
insert into StringsMap values('12507','VPN configuration failed as the policy name is already in use');
insert into StringsMap values('12508','VPN Logs');
insert into StringsMap values('12509','Vpn Netmask');
insert into StringsMap values('12510','Vpn Network');
insert into StringsMap values('12511','VPN Passthrough');
insert into StringsMap values('12512','VPN Settings ');
insert into StringsMap values('12513','VPN Setup Wizard');
insert into StringsMap values('12514','VPN Tunnel');
insert into StringsMap values('12515','VPN Tunnel page');
insert into StringsMap values('12516','VPN Wizard');
insert into StringsMap values('12517','WAN');
insert into StringsMap values('12518','WAN Failure Detection Method');
insert into StringsMap values('12519','WAN Host Addressses');
insert into StringsMap values('12520','WAN Hosts');
insert into StringsMap values('12521','WAN Information');
insert into StringsMap values('12522','WAN Interface');
insert into StringsMap values('12523','WAN Interface Address');
insert into StringsMap values('12524','WAN IP changes might lead to an interruption in connectivity.\n Please connect with new WAN IP address.');
insert into StringsMap values('12525','WAN Mode');
insert into StringsMap values('12526','WAN Port Setup');
insert into StringsMap values('12527','WAN Security Checks');
insert into StringsMap values('12528','WAN Settings');
insert into StringsMap values('12529','WAN Setup');
insert into StringsMap values('12530','Wan State');
insert into StringsMap values('12531','WAN Status');
insert into StringsMap values('12532','WAN Status (IPv4)');
insert into StringsMap values('12533','WAN Status (IPv6)');
insert into StringsMap values('12534','WAN to DMZ');
insert into StringsMap values('12535','WAN to LAN');
insert into StringsMap values('12536','WAN1');
insert into StringsMap values('12537','WAN1 has the same IP. Please configure different IP.');
insert into StringsMap values('12538','WAN1 Information');
insert into StringsMap values('12539','WAN1 IP Address is in the same subnet. Please specify IP Address in a different subnet');
insert into StringsMap values('12540','WAN1 MAC Address');
insert into StringsMap values('12541','WAN1 Port Setup');
insert into StringsMap values('12542','WAN1 Settings');
insert into StringsMap values('12543','WAN1 Setup');
insert into StringsMap values('12544','WAN1 Status');
insert into StringsMap values('12545','WAN1 Status (IPv4)');
insert into StringsMap values('12546','WAN1 Status (IPv6)');
insert into StringsMap values('12547','WAN2');
insert into StringsMap values('12548','WAN2 has the same IP. Please configure different IP.');
insert into StringsMap values('12549','WAN2 Information');
insert into StringsMap values('12550','WAN2 IP Address is in the same subnet. Please specify IP Address in a different subnet');
insert into StringsMap values('12551','WAN2 Port Setup');
insert into StringsMap values('12552','WAN2 Settings');
insert into StringsMap values('12553','WAN2 Setup');
insert into StringsMap values('12554','WAN2 Status');
insert into StringsMap values('12555','WAN2 Status (Ipv4)');
insert into StringsMap values('12556','WAN2 Status (Ipv6)');
insert into StringsMap values('12557','WAN3');
insert into StringsMap values('12558','WAN3 (3G Internet)');
insert into StringsMap values('12559','WAN3 (3G Internet) Information');
insert into StringsMap values('12560','Wan3 (3G Internet) Status');
insert into StringsMap values('12561','WAN3 Internet');
insert into StringsMap values('12562','WAN3 Settings');
insert into StringsMap values('12563','WAN3 Setup');
insert into StringsMap values('12564','WAN3 Status');
insert into StringsMap values('12565','WANs Ping');
insert into StringsMap values('12566','Warning');
insert into StringsMap values('12567','Warning: a low retry interval may result in WAN state fluctuations depending on ISP stability.');
insert into StringsMap values('12568','WARNING: The upgrade process takes a few minutes.<br> Interrupting the upload or powering off the system during the upload may damage the firmware.<br> Please wait until the upgrade process finishes before browsing any sites from your browser.');
insert into StringsMap values('12569','Web Components');
insert into StringsMap values('12570','Website Filter');
insert into StringsMap values('12571','Wednesday');
insert into StringsMap values('12572','Weekly');
insert into StringsMap values('12573','Welcome Message');
insert into StringsMap values('12574','Welcome to the D-Link Internet Connection Setup Wizard');
insert into StringsMap values('12575','WEP');
insert into StringsMap values('12576','WEP Index and Keys');
insert into StringsMap values('12577','WEP Key 1');
insert into StringsMap values('12578','WEP Key 2');
insert into StringsMap values('12579','WEP Key 3');
insert into StringsMap values('12580','WEP Key 4');
insert into StringsMap values('12581','WEP Passphrase');
insert into StringsMap values('12582','White');
insert into StringsMap values('12583','Wi-Fi Multimedia ');
insert into StringsMap values('12584','WINS Server');
insert into StringsMap values('12585','Wireless Clients');
insert into StringsMap values('12586','Wireless LAN');
insert into StringsMap values('12587','Wireless Network Name (SSID)');
insert into StringsMap values('12588','Wireless Network Setup Wizard');
insert into StringsMap values('12589','Wireless Security Password');
insert into StringsMap values('12590','Wireless Settings');
insert into StringsMap values('12591','Wireless Statistics');
insert into StringsMap values('12592','Wireless VLANs');
insert into StringsMap values('12593','Wizard');
insert into StringsMap values('12594','WLAN Domain');
insert into StringsMap values('12595','WLAN MAC Address');
insert into StringsMap values('12596','WLAN Partition');
insert into StringsMap values('12597','WLAN Statistics');
insert into StringsMap values('12598','WMM');
insert into StringsMap values('12599','Workgroup');
insert into StringsMap values('12600','WPA');
insert into StringsMap values('12601','WPA Password');
insert into StringsMap values('12602','WPA+WPA2');
insert into StringsMap values('12603','WPA2');
insert into StringsMap values('12604','WPS');
insert into StringsMap values('12605','WPS Configuration');
insert into StringsMap values('12606','WPS Current Status');
insert into StringsMap values('12607','WPS Setup Method');
insert into StringsMap values('12608','WPS Status');
insert into StringsMap values('12609','Wrong Login User Password');
insert into StringsMap values('12610','www.dlink.com');
insert into StringsMap values('12611','Xauth User');
insert into StringsMap values('12612','XAuth user configuration failed');
insert into StringsMap values('12613','Year');
insert into StringsMap values('12614','YOU ARE ALREADY LOGGED IN');
insert into StringsMap values('12615','You can download a newer firmware file at %s MyDSRSupport %s Website.');
insert into StringsMap values('12616','You have selected Guest User. Other users can not be selected when Guest User is selected.');
insert into StringsMap values('12617','You have selected your security level - you will need to set a wireless security password');
insert into StringsMap values('12618','You must choose at least one user type');
insert into StringsMap values('12619','You must register your device at the %s D-Link MyDsr %s Website before checking firmware status.');
insert into StringsMap values('12620','Your browser does not support AJAX!');
insert into StringsMap values('12621','YYYY');
insert into StringsMap values('12622','DHCP');
insert into StringsMap values('12623','View Details');
insert into StringsMap values('12624','Please set the Configurable Port to Option in <a href=''?page=configurablePort.htm''>Configurable Port Mode Page</a> to configure this page.');
insert into StringsMap values('12625','Date');
insert into StringsMap values('12626','Routing Mode between Option and LAN');
insert into StringsMap values('12627','dBm');
insert into StringsMap values('12628','End Time');
insert into StringsMap values('12629','rocommunity');
insert into StringsMap values('12630','rwcommunity');
insert into StringsMap values('12631','DHCP Reserved IPs for DMZ');
insert into StringsMap values('12632','Primary WINServer');
insert into StringsMap values('12633','Secondary WINServer ');
insert into StringsMap values('12634','DNS Suffix');
insert into StringsMap values('12635','SSL VPN Policy');
insert into StringsMap values('12636','INSECURE');
insert into StringsMap values('12637','Always Block');
insert into StringsMap values('12638','Always Allow');
insert into StringsMap values('12639','Block by schedule');
insert into StringsMap values('12640','Allow by schedule');
insert into StringsMap values('12641','Interface Address');
insert into StringsMap values('12642','If you want to close the other session, please click on ''Continue'' button');
insert into StringsMap values('12643','Click ''Cancel'' button to logout ');
insert into StringsMap values('12644','BLOCK by schedule');
insert into StringsMap values('12645','ALLOW by schedule');
insert into StringsMap values('12646','WLAN Module Version');
insert into StringsMap values('12647','Email Address');
insert into StringsMap values('12648','LDAP attribute');
insert into StringsMap values('12649','Hosts');
insert into StringsMap values('12650','Host Addresses');
insert into StringsMap values('12651','Status (IPv4)');
insert into StringsMap values('12652','Status (IPv6)');
insert into StringsMap values('12653','IP');
insert into StringsMap values('12654','Enabled');
insert into StringsMap values('12655','IP DSCP');
insert into StringsMap values('12656','TOS');
insert into StringsMap values('12657','IP Mode');
insert into StringsMap values('12658','Note');
insert into StringsMap values('12659','Some changes made using this Setup Wizard may require you to change some settings on your wireless client adapters so they can still connect to the D-Link Router');
insert into StringsMap values('12660','LAN and option');
insert into StringsMap values('12661','dmz and option');
insert into StringsMap values('12662','Remote');
insert into StringsMap values('12663','ISATAP Tunnel Configuration');
insert into StringsMap values('12664','End Point Address');
insert into StringsMap values('12665','Local Endpoint');
insert into StringsMap values('12666','You will need to enter the same password as keys in this step into your wireless clients in order to enable proper wireless communication');
insert into StringsMap values('12667','wds Peer Config');
insert into StringsMap values('12668','Add WDS Peer Configuration');
insert into StringsMap values('12669','WDS Configuration');
insert into StringsMap values('12670','WDS Enable');
insert into StringsMap values('12671','WDS Encryption');
insert into StringsMap values('12672','WDS Security');
insert into StringsMap values('12673','WDS Authentication');
insert into StringsMap values('12674','WDS Passphrase');
insert into StringsMap values('12675','WDS Peer Mac addresses');
insert into StringsMap values('12676','LAN IP Address Setup');
insert into StringsMap values('12677','Before launching these wizards, please make sure you have followed all steps outlined in the Quick Installation Guide included in the package');
insert into StringsMap values('12678','Port Setup');
insert into StringsMap values('12679','IPV6 Option1 Config');
insert into StringsMap values('12680','Ipv6 option config');
insert into StringsMap values('12681','Ipv6 wan config');
insert into StringsMap values('12682','Radius Settings');
insert into StringsMap values('12683','IPv6 Option2 Config');
insert into StringsMap values('12684','option port setup');
insert into StringsMap values('12685','Option2 SETUP');
insert into StringsMap values('12686','LAN to Option');
insert into StringsMap values('12687','Option to LAN');
insert into StringsMap values('12688','Deny Login from Option Interface');
insert into StringsMap values('12689','Option1 SETUP');
insert into StringsMap values('12690','Option SETUP');
insert into StringsMap values('12691','Option3 SETUP');
insert into StringsMap values('12692','Option to DMZ');
insert into StringsMap values('12693','DMZ to OPtion');
insert into StringsMap values('12694','A critical error encountered while loading web page');
insert into StringsMap values('12695','Option');
insert into StringsMap values('12696','Option1');
insert into StringsMap values('12697','Option2');
insert into StringsMap values('12698','Auto-Rollover using');
insert into StringsMap values('12699','port');
insert into StringsMap values('12700','Primary');
insert into StringsMap values('12701','Secondary');
insert into StringsMap values('12702','Use only single');
insert into StringsMap values('12703','Failure Detection Method');
insert into StringsMap values('12704','DNS lookup using');
insert into StringsMap values('12705','Step 2: Configure Remote & Local');
insert into StringsMap values('12706','Addresses');
insert into StringsMap values('12707','Remote & Local');
insert into StringsMap values('12708','IP Address / FQDN');
insert into StringsMap values('12709','Settings');
insert into StringsMap values('12710','WDS');
insert into StringsMap values('12711','Enable SSLVPN');
insert into StringsMap values('12712','(3G Internet) Status');
insert into StringsMap values('12713','Step 3: Configure your Option1 Connection');
insert into StringsMap values('12714','Please select the Option1 connection type below');
insert into StringsMap values('12715','Idle Time');
insert into StringsMap values('12716','CA Subject');
insert into StringsMap values('12717','Server/Client Cert');
insert into StringsMap values('12718','Server/Client');
insert into StringsMap values('12719','key');
insert into StringsMap values('12720','Uploaded');
insert into StringsMap values('12721','Dh Key');
insert into StringsMap values('12722','Portal Site Title');
insert into StringsMap values('12723','Banner Title');
insert into StringsMap values('12724','Banner Message');
insert into StringsMap values('12725','Display banner message');
insert into StringsMap values('12726','on login page');
insert into StringsMap values('12727','HTTP meta tags for cache');
insert into StringsMap values('12728','control(recommended)');
insert into StringsMap values('12729','Option State');
insert into StringsMap values('12730','DHCPv6 Server');
insert into StringsMap values('12731','SECURITY');
insert into StringsMap values('12732','ENCRYPTION');
insert into StringsMap values('12733','AUTHENTICATION');
insert into StringsMap values('12734','USER_DENY_LOGIN_FROM_BROWSER');
insert into StringsMap values('12735','Failed to delete route(s)');
insert into StringsMap values('12736','Falied to edit configuration');
insert into StringsMap values('12737','Tls-Auth key configuration failed');
insert into StringsMap values('12738','Upload failed');
insert into StringsMap values('12739','WAN Link: DOWN, Updating DB of NimfConf:IfStatus');
insert into StringsMap values('12740','WAN Link: UP, Updating DB of NimfConf:IfStatus');
insert into StringsMap values('12741','WAN Link: DOWN, Updating DB of NimfConf6');
insert into StringsMap values('12742','WAN Link: UP, Updating DB of NimfConf6:IfStatus');
insert into StringsMap values('12743','power saving configuration failed');
insert into StringsMap values('12744','You Are Not ADMIN, You Can''t Add Vpn Policies');
insert into StringsMap values('12745','FILE CORRUPTED');
insert into StringsMap values('12746','Firmstatus configuration failed');
insert into StringsMap values('12747','port mirroring configuration failed');
insert into StringsMap values('12748','port configuration failed');
insert into StringsMap values('12749','Intel AMT configuration failed');
insert into StringsMap values('12750','User is not logged in');
insert into StringsMap values('12751','NON PRIVILGED ACCESS!');
insert into StringsMap values('12752','IP Alias configuration failed');
insert into StringsMap values('12753','IP Alias delete failed');
insert into StringsMap values('12754','IPS configuration failed');
insert into StringsMap values('12755','OSPF Configuration failed');
insert into StringsMap values('12756','OSPF6 Configuration failed');
insert into StringsMap values('12757','Storage sharing cannot be disabled when sharing is enabled on interface(s)');
insert into StringsMap values('12758','IKE delete failed');
insert into StringsMap values('12759','Invalid Server IP');
insert into StringsMap values('12760','Invalid Remote Network');
insert into StringsMap values('12761','PPTP Client Status Configuration Failed');
insert into StringsMap values('12762','L2TP server configuration failed');
insert into StringsMap values('12763','L2TP operation failed');
insert into StringsMap values('12764','L2TP delete failed');
insert into StringsMap values('12765','L2TP deleted successfully');
insert into StringsMap values('12766','LAN configuration failed');
insert into StringsMap values('12767','IPv4 LAN configuration failed');
insert into StringsMap values('12768','Atleast one interface should be selected when Sharing is enabled');
insert into StringsMap values('12769','Printer sharing cannot be disabled when sharing is enabled on interface(s)');
insert into StringsMap values('12770','USB sharing on VLAN failed');
insert into StringsMap values('12771','Logging configuration failed');
insert into StringsMap values('12772','Multilan configuration delete failed');
insert into StringsMap values('12773','Multilan configuration failed');
insert into StringsMap values('12774','IPv6 multilan configuration delete failed');
insert into StringsMap values('12775','IPv6 multilan configuration failed');
insert into StringsMap values('12776','TCPDUMP Configuration Failed ');
insert into StringsMap values('12777','WDS Configuration failed');
insert into StringsMap values('12778','WDS Bridge Configuration Failed ');
insert into StringsMap values('12779','WDS Peer Configuration Failed ');
insert into StringsMap values('12780','Port mode setting failed');
insert into StringsMap values('12781','WAN mode configuration failed');
insert into StringsMap values('12782','WPS Configuration Failed ');
insert into StringsMap values('12783','IPV6 MLD configuration failed');
insert into StringsMap values('12784','Please remove Optional WAN Configurations from');
insert into StringsMap values('12785','IKE policy cannot be deleted, being used in VPN policy');
insert into StringsMap values('12786','Userdb failed');
insert into StringsMap values('12787','Admin and Xauth user types cannot be selected together');
insert into StringsMap values('12788','Credentials unchanged ');
insert into StringsMap values('12789','L2TP and PPTP user types cannot be selected together');
insert into StringsMap values('12790','Only admin and guest users are allowed to login');
insert into StringsMap values('12791','Delete operation succeede');
insert into StringsMap values('12792','IKE policy deletion failed');
insert into StringsMap values('12793','IKE policy using by backup policy');
insert into StringsMap values('12794','Back policy up and running');
insert into StringsMap values('12795','Selected all policies already disabled');
insert into StringsMap values('12796','Can''t share same remote end point with different IKE policies');
insert into StringsMap values('12797','Wireless wizard failed');
insert into StringsMap values('12798','Firewall default configuration failed');
insert into StringsMap values('12799','Firewall Rules priority configuration failed');
insert into StringsMap values('12800','VLAN subnetting configuration failed');
insert into StringsMap values('12801','VLANID 4094 is reserved when configurable port is set as WAN/DMZ');
insert into StringsMap values('12802','Selected VLAN(s) are being using in bandwidth profiles traffic selector');
insert into StringsMap values('12803','SharePort is enabled on selected VLAN(s)');
insert into StringsMap values('12804','Remove fixed IP');
insert into StringsMap values('12805','Move operation failed');
insert into StringsMap values('12806','Sessions configuration failed');
insert into StringsMap values('12807','Traffic Meter configuration failed');
insert into StringsMap values('12808','Admin user configuration not found');
insert into StringsMap values('12809','NTP configuration not found ');
insert into StringsMap values('12810','DENY_LOGIN_DEFAULT_ADMIN');
insert into StringsMap values('12811','Deny user login');
insert into StringsMap values('12812','Deny user login from WAN');
insert into StringsMap values('12813','WAN wizard configuration failed');
insert into StringsMap values('12814','PPTP user configuration failed');
insert into StringsMap values('12815','PPTP server configuration failed');
insert into StringsMap values('12816','Backup policy configuration not found');
insert into StringsMap values('12817','Primary VPN policy configuration not found ');
insert into StringsMap values('12818','Backup configuration failed');
insert into StringsMap values('12819','DB Error try again');
insert into StringsMap values('12820','seconds');
insert into StringsMap values('12821','Please enter a valid PIN');
insert into StringsMap values('12822','Please enter the Option1');
insert into StringsMap values('12823','Please enter the Option2');
insert into StringsMap values('12824','Warning: a low retry interval may result in Option state fluctuations depending on ISP stability.');
insert into StringsMap values('12825','Invalid range of ports. end service port');
insert into StringsMap values('12826','should be greater than start service port ');
insert into StringsMap values('12827','Invalid IP Address/Domain name');
insert into StringsMap values('12828','Auto-Rollover using Option port');
insert into StringsMap values('12829','Resource Object Delete Failed');
insert into StringsMap values('12830','SSLVPN Policy Delete Failed');
insert into StringsMap values('12831','Size of the uploaded image should be below 50KB');
insert into StringsMap values('12832','Please enter the Prefix Length');
insert into StringsMap values('12833','Load Balancing - Round Robin');
insert into StringsMap values('12834','Load Balancing - Spillover Mode');
insert into StringsMap values('12835','Use only single Option port ');
insert into StringsMap values('12836','DHCP range over IPsec should not include');
insert into StringsMap values('12837','1 IP address.');
insert into StringsMap values('12838','DHCP range should not include');
insert into StringsMap values('12839','One of the Reserved IPs fall out side this Dhcp Server address range. Please configure a different range.');
insert into StringsMap values('12840','1 has the same IP. Please configure different IP.');
insert into StringsMap values('12841','1 IP address is in the same subnet. Please specify IP address in a different subnet.');
insert into StringsMap values('12842','for octet');
insert into StringsMap values('12843','for Port field.');
insert into StringsMap values('12844','Please select alteast one interface and one Printer device');
insert into StringsMap values('12845','Please select alteast one interface and one Storage device');
insert into StringsMap values('12846','Invalid Lease Time: ');
insert into StringsMap values('12847','Invalid User Name:');
insert into StringsMap values('12848','Bytes');
insert into StringsMap values('12849','SN');
insert into StringsMap values('12850','for encryption algorithm: BLOWFISH . Key must be ');
insert into StringsMap values('12851','characters long.');
insert into StringsMap values('12852','for encryption algorithm: CAST128. Key must be ');
insert into StringsMap values('12853','Invalid Key-In length');
insert into StringsMap values('12854','Invalid Key-Out length ');
insert into StringsMap values('12855','GET');
insert into StringsMap values('12856','To set up this connection you will need to have a Username and Password from your Internet Service Provider.');
insert into StringsMap values('12857','You also need L2TP IP address. If you do not have this information, please contact your ISP.');
insert into StringsMap values('12858','To set up this connection you will need to have a Username and Password from your Internet Service Provider. You also need PPTP IP address.');
insert into StringsMap values('12859','If you do not have this information, please contact your ISP.');
insert into StringsMap values('12860','To set up this connection you will need to have a complete list of IP information provided by your Internet Service Provider.');
insert into StringsMap values('12861','If you have a Static IP connection and do not have this information, please contact your ISP.');
insert into StringsMap values('12862','To set up this connection, please make sure that you are connected to the D-Link Router with the');
insert into StringsMap values('12863','PC that was originally connected to your broadband connection. If you are, then select');
insert into StringsMap values('12864','''Clone your PC''s MAC Address'' option');
insert into StringsMap values('12865','to copy your computer''s MAC address to the D-Link Router.');
insert into StringsMap values('12866','Please enter valid mask length ');
insert into StringsMap values('12867','XAuth');
insert into StringsMap values('12868','SSLVPN');
insert into StringsMap values('12869','Guest');
insert into StringsMap values('12870','Runtime ');
insert into StringsMap values('12871','Users are mutually exclusive.');
insert into StringsMap values('12872','Gateway IP Address must be in Selected Interface Subnet:');
insert into StringsMap values('12873','Invalid Redirect Port Number:');
insert into StringsMap values('12874','Invalid Port Range ');
insert into StringsMap values('12875','IP changes might lead to an interruption in connectivity.\n');
insert into StringsMap values('12876','Please connect with new');
insert into StringsMap values('12877','Please enter a valid Gateway IP Address');
insert into StringsMap values('12878','2 has the same IP. Please configure different IP.');
insert into StringsMap values('12879','2 IP Address is in the same subnet. Please specify IP Address in a different subnet');
insert into StringsMap values('12880','This Mac Address has already been configured for Configurable ');
insert into StringsMap values('12881','.Please configure another Mac Address.');
insert into StringsMap values('12882','User FQDN is only for Aggressive mode ');
insert into StringsMap values('12883','An IP in this subnet is already configured on another interface ');
insert into StringsMap values('12884','Please configure the IP in a different subnet.');
insert into StringsMap values('12885','for each octet.');
insert into StringsMap values('12886','End IP smaller than Start IP ');
insert into StringsMap values('12887','between');
insert into StringsMap values('12888','to');
insert into StringsMap values('12889','Remote end point must not same as Option1 IP address');
insert into StringsMap values('12890','Remote end point must not same as Option2 IP address');
insert into StringsMap values('12891','Invalid Port Number :');
insert into StringsMap values('12892','Safely Remove');
insert into StringsMap values('12893','images/usbDataIcon.png');
insert into StringsMap values('12894','images/usb3gIcon.png');
insert into StringsMap values('12895','images/usbPrinterIcon.png');
insert into StringsMap values('12896','images/usbNoIcon.png');
insert into StringsMap values('12897','invalid MAC address');
insert into StringsMap values('12898','Please enter valid characters for');
insert into StringsMap values('12899','\nThe following characters are not supported for this field:');
insert into StringsMap values('12900','Lifetime value should be 0 or between 30 to 9000:');
insert into StringsMap values('12901','Lifetime value should be 0 or between');
insert into StringsMap values('12902','to 9000:');
insert into StringsMap values('12903','MTU must be 0 or between 1280 to 1500:');
insert into StringsMap values('12904','Invalid start time for schedule.');
insert into StringsMap values('12905','Invalid end time for schedule.');
insert into StringsMap values('12906','hours');
insert into StringsMap values('12907','minutes');
insert into StringsMap values('12908','Trying to configure Reserve Port.');
insert into StringsMap values('12909','To Proceed,');
insert into StringsMap values('12910','click ''OK'' otherwise click ''CANCEL''.');
insert into StringsMap values('12911','Be sure to change default password');
insert into StringsMap values('12912','Invalid outgoing start port number.');
insert into StringsMap values('12913','Invalid range of ports. end service port (');
insert into StringsMap values('12914',') should be greater than start service port (');
insert into StringsMap values('12915','Startport');
insert into StringsMap values('12916','EndPort');
insert into StringsMap values('12917','Please select the file name of the image to be uploaded ');
insert into StringsMap values('12918','You can download a newer firmware file at ');
insert into StringsMap values('12919','Website');
insert into StringsMap values('12920','You must register your device at the ');
insert into StringsMap values('12921','Website before checking firmware status');
insert into StringsMap values('12922','Process is going on. Please wait...');
insert into StringsMap values('12923','D-Link MyDsr ');
insert into StringsMap values('12924','MyDSRSupport');
insert into StringsMap values('12925','AH');
insert into StringsMap values('12926','ESP');
insert into StringsMap values('12927','User Database');
insert into StringsMap values('12928','SHA2-224 ');
insert into StringsMap values('12929','DH Group 1 (768 bit)');
insert into StringsMap values('12930','DH Group 2 (1024 bit)');
insert into StringsMap values('12931','DH Group 5 (1536 bit)');
insert into StringsMap values('12932','Key-In');
insert into StringsMap values('12933','Key-Out');
insert into StringsMap values('12934','Remote Prefix Length');
insert into StringsMap values('12935','Enable Keepalive');
insert into StringsMap values('12936','Source IP Address');
insert into StringsMap values('12937','Local Prefix Length');
insert into StringsMap values('12938','You have not selected any file. Please select a . ');
insert into StringsMap values('12939','Please select a .');
insert into StringsMap values('12940','You selected a .');
insert into StringsMap values('12941','file; please select a .');
insert into StringsMap values('12942','file instead!');
insert into StringsMap values('12943','file to be uploaded.');
insert into StringsMap values('12944','WDS is enabled. Please disable WDS to modify the configuration ');
insert into StringsMap values('12945','Please Enable');
insert into StringsMap values('12946','to activate SSL VPN Configurations.');
insert into StringsMap values('12947','Invalid poll interval value');
insert into StringsMap values('12948','Please enter WDS Passphrase');
insert into StringsMap values('12949','WDS Passphrase should be at least 8 charactes long');
insert into StringsMap values('12950','WPS has not been configured.Please configure it first.');
insert into StringsMap values('12951','WPS is currently disabled');
insert into StringsMap values('12952','Invalid idle timeout value');
insert into StringsMap values('12953','Invalid Load Tolerance');
insert into StringsMap values('12954','Invalid Max Bandwidth');
insert into StringsMap values('12955','WDS is enabled and this profile is being used in default VAP. Please disable WDS to modify configuration');
insert into StringsMap values('12956','Default Gateway');
insert into StringsMap values('12957','You have not selected any file. Please select a .');
insert into StringsMap values('12958','file to be uploaded');
insert into StringsMap values('12959','Please select a .');
insert into StringsMap values('12960','You selected a .');
insert into StringsMap values('12961','file');
insert into StringsMap values('12962','file; please select a .');
insert into StringsMap values('12963','file instead!');
insert into StringsMap values('12964','IPv4');
insert into StringsMap values('12965','Local Prefix Length');
insert into StringsMap values('12966','');
insert into StringsMap values('12967','Please select items from the list to be deleted');
insert into StringsMap values('12968','The selected group does not have privileges to configure login policies');
insert into StringsMap values('12969','VLANs count reached to maximum limit.');
insert into StringsMap values('12970','Default VLAN cannot be deleted.');
insert into StringsMap values('12971','Please uncheck default VLAN to delete other VLANs');
insert into StringsMap values('12972','Invalid advertisement period');
insert into StringsMap values('12973','in seconds');
insert into StringsMap values('12974','Invalid advertisement TTL value');
insert into StringsMap values('12975','Please enter valid advertisement period');
insert into StringsMap values('12976','Mail sent and logs cleared');
insert into StringsMap values('12977','Unable to send mail');
insert into StringsMap values('12978','Email logs currently disabled. Please enable and try again.');
insert into StringsMap values('12979','Please enter valid advertisement TTL');
insert into StringsMap values('12980','There should be atleast one Bandwidth Profile to perform Add Operation');
insert into StringsMap values('12981','Please select items from the list to be edited');
insert into StringsMap values('12982','An IP Mode change will cause the device to re-boot.');
insert into StringsMap values('12983','port is being used by sslvpn');
insert into StringsMap values('12984','Please add profile first...');
insert into StringsMap values('12985','Please enter a valid IPv4 Address');
insert into StringsMap values('12986','Invalid DSCP value');
insert into StringsMap values('12987','Please enter valid Internet Name');
insert into StringsMap values('12988','Invalid Internet Name');
insert into StringsMap values('12989','Looking up host');
insert into StringsMap values('12990','Retrieving Route Table Data...');
insert into StringsMap values('12991','Passwords and other possibly sensitive information is stored in the configuration file. Please protect the configuration file accordingly.');
insert into StringsMap values('12992','Preparing to reboot. Are you sure you want to proceed ? WARNING: All current sessions will be closed and the system will be down for about');
insert into StringsMap values('12993','Please enter a valid Start IPv6 Address');
insert into StringsMap values('12994','Please enter a valid End IPv6 Address');
insert into StringsMap values('12995','Please enter valid IP Address for the Host Name');
insert into StringsMap values('12996','Please enter valid Host Name for the IP Address');
insert into StringsMap values('12997','Please click on Display button for the facility first.');
insert into StringsMap values('12998','Defined Addresses entries reached to maxium number(7)');
insert into StringsMap values('12999','Specified portal not found');
insert into StringsMap values('13000','No users are configured for this portal');
insert into StringsMap values('13001','Set Language');
insert into StringsMap values('13002','Please enter valid subnet mask');
insert into StringsMap values('13003','Secret Key should not be empty');
insert into StringsMap values('13004','Starting and Ending IP Address must be in same subnet.');
insert into StringsMap values('13005','Ending IP Address should be higher than Starting IP Address.');
insert into StringsMap values('13006','Ending IP Address should not be equal to Starting IP Address.');
insert into StringsMap values('13007','Starting and Ending IP Address range must be less than or equal to 26.');
insert into StringsMap values('13008','PPTP Start IP Address is in the same subnet. Please specify IP address in a different subnet.');
insert into StringsMap values('13009','Please enter the Client Address Range Begin');
insert into StringsMap values('13010','Please enter the Client Address Range End');
insert into StringsMap values('13011','Please enter the LCP Timeout value');
insert into StringsMap values('13012','LAN IP/subnet is also in the same range. Please configure different pool');
insert into StringsMap values('13013','Please enter a valid AP Name');
insert into StringsMap values('13014','file; please select a .png or .gif or .jpg or .jpeg file instead!');
insert into StringsMap values('13015','please select a .png or .gif or .jpg or .jpeg file');
insert into StringsMap values('13016','Please select items from the list to be Disconnected.');
insert into StringsMap values('13017','Invalid poll interval value:');
insert into StringsMap values('13018','Please enter a valid System Name');
insert into StringsMap values('13019','Please enter a valid Beacon Interval');
insert into StringsMap values('13020','Please enter a valid Dtim Interval');
insert into StringsMap values('13021','Please enter a valid RTS Threshold');
insert into StringsMap values('13022','Please enter valid Network Address / IP Address');
insert into StringsMap values('13023','Please enter a valid Transmit Power Gain');
insert into StringsMap values('13024','Please enter a valid Short Retry Limit');
insert into StringsMap values('13025','Please enter a valid Long Retry Limit');
insert into StringsMap values('13026','Milliseconds');
insert into StringsMap values('13027','Please enter a valid Fragmentation Threshold');
insert into StringsMap values('13028','Local Option IP');
insert into StringsMap values('13029','Remote Option IP');
insert into StringsMap values('13030','Please select item from the list to be edit');
insert into StringsMap values('13031','Reserved IP cannot be configured in DHCP Server address range pool of Vlan. Please configure different IP');
insert into StringsMap values('13032','Please enter the full path and file name of the certificates for TIs Key to be uploaded');
insert into StringsMap values('13033','Please enter the full path and file name of the certificates for DH Key to be uploaded');
insert into StringsMap values('13034','Please enter a valid MAC Address in the form XX:XX:XX:XX:XX:XX');
insert into StringsMap values('13035','DHCP reserverd IPs should be in LAN/VLAN subnets');
insert into StringsMap values('13036','Please enter the full path and file name of the certificates for trusted CAs to be uploaded');
insert into StringsMap values('13037','Please enter the full path and file name of the certificates for Server Certificate to be uploaded');
insert into StringsMap values('13038','Please enter the Approved URL');
insert into StringsMap values('13039','Reserved IP can not be configured in DHCP Server address range pool. Please configure different IP');
insert into StringsMap values('13040','IP Address must be in DMZ subnet');
insert into StringsMap values('13041','Please enter the full path and file name of the URLs to be uploaded');
insert into StringsMap values('13042','please select a .csv file');
insert into StringsMap values('13043','file; please select a .csv file instead!');
insert into StringsMap values('13044','DLink.cfg file is already present in USB drive,saving configuration will overwrite that file ');
insert into StringsMap values('13045','Please enter valid SYN Flood Detect Rate');
insert into StringsMap values('13046','Please enter valid Echo Storm');
insert into StringsMap values('13047','Please enter valid ICMP Flood value');
insert into StringsMap values('13048','Invalid UDP Connection Limit:');
insert into StringsMap values('13049','Invalid SYN Flood Detect Rate:');
insert into StringsMap values('13050','Invalid Echo Storm:');
insert into StringsMap values('13051','Invalid ICMP Flood:');
insert into StringsMap values('13052','Please enter the full path and file name of the certificates for Server Keys to be uploaded');
insert into StringsMap values('13053','Invalid Network IP Address');
insert into StringsMap values('13054','Please select items from the list to be enable');
insert into StringsMap values('13055','Please select items from the list to be disable');
insert into StringsMap values('13056','Please select items from the list to be enabled');
insert into StringsMap values('13057','Please enter the full path and file name of the Access Server Client Configuration to be uploaded');
insert into StringsMap values('13058','SSID length cannot be more that 32 characters');
insert into StringsMap values('13059','Please select items from the list to be disabled.');
insert into StringsMap values('13060','Kbps.');
insert into StringsMap values('13061','Please enter valid Profile Name.');
insert into StringsMap values('13062','Please enter Minimum Bandwidth.');
insert into StringsMap values('13063','Please enter Maximum Bandwidth.');
insert into StringsMap values('13064','Please enter valid Keyword');
insert into StringsMap values('13065','''.'' is not allowed');
insert into StringsMap values('13066','cannot be configured as one of the AP''s is configured in WEP/WPA(TKIP) security mode. Please change the security setting to configure the Radio in');
insert into StringsMap values('13067','Please enter a valid IP Address for Primary Authentication Server');
insert into StringsMap values('13068','Please enter a valid Authentication Port for Primary Authentication Server.');
insert into StringsMap values('13069','Please enter a valid Secret value for Primary Authentication Server');
insert into StringsMap values('13070','Please enter a valid TimeOut value for Primary Authentication Server');
insert into StringsMap values('13071','Please enter a valid Retries value for Primary Authentication Server.');
insert into StringsMap values('13072','Please enter a valid IP Address for Secondary Authentication Server.');
insert into StringsMap values('13073','Please enter a valid Authentication Port for Secondary Authentication Server.');
insert into StringsMap values('13074','Please enter a valid Secret value for Secondary Authentication Server.');
insert into StringsMap values('13075','Please enter a value between 1 to ');
insert into StringsMap values('13076','Please enter a valid TimeOut value for Secondary Authentication Server');
insert into StringsMap values('13077','Please enter a valid Retries value for Secondary Authentication Server');
insert into StringsMap values('13078','Please enter the SysContact');
insert into StringsMap values('13079','Please enter the SysLocation');
insert into StringsMap values('13080','Please enter the SysName');
insert into StringsMap values('13081','G/N-Mixed');
insert into StringsMap values('13082','N only');
insert into StringsMap values('13083','A/N-Mixed');
insert into StringsMap values('13084','L2TP Start IP Address is in the same subnet. Please specify IP address in a different subnet.');
insert into StringsMap values('13085','for encryption algorithm: AES. Key must be 16 characters long.');
insert into StringsMap values('13086','Please enter the Resource Name');
insert into StringsMap values('13087','You must enable router advertisement in the Networking > IPv6 > <a href=''?page=radvdConfig.htm''>Router Advertisement page</a> before configuring advertisement prefixes.');
insert into StringsMap values('13088','Please enter a valid Object Address');
insert into StringsMap values('13089','Please enter SSID for the profile');
insert into StringsMap values('13090','Please enter a valid FQDN');
insert into StringsMap values('13091','Please enter a name for the certificate request being generated');
insert into StringsMap values('13092','Please enter WPA Password');
insert into StringsMap values('13093','Please enter WEP key');
insert into StringsMap values('13094','Please enter a subject for the certificate request being generated');
insert into StringsMap values('13095','Please enter the Valid Start-Port');
insert into StringsMap values('13096','Please enter the Valid End-Port');
insert into StringsMap values('13097','Client address range must be in same subnet.');
insert into StringsMap values('13098','WPA password should be at least 8 charactes long');
insert into StringsMap values('13099','WEP not supported in');
insert into StringsMap values('13100','Atleast one Resource Object is needed as the resource is being used by SSLVPN Policy');
insert into StringsMap values('13101','Invalid Subnet.');
insert into StringsMap values('13102','Please change the radio setting to configure the AP in WEP security mode');
insert into StringsMap values('13103','WPA/TKIP encryption not supported in');
insert into StringsMap values('13104','Please change the radio setting to configure the AP in WPA/TKIP security mode');
insert into StringsMap values('13105','Invalid WEP Key Length: Key Length should be');
insert into StringsMap values('13106','for ASCII Key and');
insert into StringsMap values('13107','for Hex Key');
insert into StringsMap values('13108','for ASCII Key');
insert into StringsMap values('13109','Please select items from the list to be configured.');
insert into StringsMap values('13110','Invalid MD5 Key ID:');
insert into StringsMap values('13111','Invalid MAC address:');
insert into StringsMap values('13112','Invalid Reconnect after failure count:');
insert into StringsMap values('13113','Invalid Detection Period:');
insert into StringsMap values('13114','Invalid Reconnect after failure count:');
insert into StringsMap values('13115','Please select items from the list to be exported');
insert into StringsMap values('13116','');
insert into StringsMap values('13117','');
insert into StringsMap values('13118','Out');
insert into StringsMap values('13119','In');
insert into StringsMap values('13120','Cannot delete the default profile');
insert into StringsMap values('13121','Cannot delete this profile as it is in use');
insert into StringsMap values('13122','Cannot edit the default profile');
insert into StringsMap values('13123','Please enter valid Policy Name.');
insert into StringsMap values('13124','Please select items from the list to be moved.');
insert into StringsMap values('13125','Language configuration failed');
insert into StringsMap values('13126','SECURE');
insert into StringsMap values('13127','DUT''s MAC Address');
insert into StringsMap values('13128','Config');
insert into StringsMap values('13129','Physical Setting Domain Name System');
insert into StringsMap values('13130','Please enter a valid VLAN Name');
insert into StringsMap values('13131','Please enter a valid Id');
insert into StringsMap values('13132','leading zeroes in the ''Id'' will be truncated.');
insert into StringsMap values('13133','VLAN ID already exists');
insert into StringsMap values('13134','VLAN Name already exists');
insert into StringsMap values('13135','Sharing Enabled interfaces');
insert into StringsMap values('13136','VLAN Name');
insert into StringsMap values('13137','Enable Printer');
insert into StringsMap values('13138','Enable Storage');
insert into StringsMap values('13139','Please enter a valid IPv4 Interface Name');
insert into StringsMap values('13140','Please enter a valid SLA ID');
insert into StringsMap values('13141','Please enter a valid Prefix Lifetime');
insert into StringsMap values('13142','You have changed Port Mode. Please click on apply button for Port VLAN Configuration first.');
insert into StringsMap values('13143','Please enter a valid Portal Layout');
insert into StringsMap values('13144','Please enter a valid Portal Site Title');
insert into StringsMap values('13145','Please enter a valid Banner Title');
insert into StringsMap values('13146','Please enter a valid Banner Message');
insert into StringsMap values('13147','Invalid portal name:');
insert into StringsMap values('13148','Please enter a valid Server IP address');
insert into StringsMap values('13149','Please enter a valid Remote Network.');
insert into StringsMap values('13150','Please enter a valid Remote Netmask.');
insert into StringsMap values('13151','Please enter a valid Idle Time Out');
insert into StringsMap values('13152','specify');
insert into StringsMap values('13153','(Physical Port)');
insert into StringsMap values('13154','DMZ and');
insert into StringsMap values('13155','LAN and');
insert into StringsMap values('13156','Option Security Checks');
insert into StringsMap values('13157','SETUP');
insert into StringsMap values('13158','ADVANCED');
insert into StringsMap values('13159','TOOLS');
insert into StringsMap values('13160','STATUS');
insert into StringsMap values('13161','Blocked to login from this browser');
insert into StringsMap values('13162','Blocked to Login from this IP Address');
insert into StringsMap values('13163','User already logged in');
insert into StringsMap values('13164','Maximum VPN Limit Reached');
insert into StringsMap values('13165','Domain Name already exits');
insert into StringsMap values('13166','Keep Alive can be enabled only when GW GW Policy is configured.');
insert into StringsMap values('13167','WDS is enabled. Disable WDS to disable default VAP');
insert into StringsMap values('13168','Yes');
insert into StringsMap values('13169','No');
insert into StringsMap values('13170','L2TP Server Mode');
insert into StringsMap values('13171','Enable IPv4');
insert into StringsMap values('13172','Enable IPv4/IPv6');
insert into StringsMap values('13173','PPTP Server Mode');
insert into StringsMap values('13174','UP');
insert into StringsMap values('13175','UP(IPv6)');
insert into StringsMap values('13176','UP (IPv4 and IPv6)');
insert into StringsMap values('13177','DOWN');
insert into StringsMap values('13178','Load Balancing - SpillOver');
insert into StringsMap values('13179','Default VAP is disabled. Please enable it to configure WDS');
insert into StringsMap values('13180','Drop');
insert into StringsMap values('13181','Disconnected');
insert into StringsMap values('13182','Option Interface');
insert into StringsMap values('13183','Configurable Port(WAN2) ');
insert into StringsMap values('13184','Not in Factory Default State.');
insert into StringsMap values('13185','Factory Default State.');
insert into StringsMap values('13186','Change');
insert into StringsMap values('13187','Option Mode');
insert into StringsMap values('13188','Current Option Mode');
insert into StringsMap values('13189','Not Yet Available');
insert into StringsMap values('13190','Russian dual access PPPoE');
insert into StringsMap values('13191','Dynamic IP (DHCPv6)');
insert into StringsMap values('13192','PPPoE over IPv6');
insert into StringsMap values('13193','IPv6 is disabled');
insert into StringsMap values('13194','Physical');
insert into StringsMap values('13195','SHA1');
insert into StringsMap values('13196','RSA');
insert into StringsMap values('13197','IPsec Host');
insert into StringsMap values('13198','Edge Device - User Database');
insert into StringsMap values('13199','Edge Device - Radius - PAP');
insert into StringsMap values('13200','Edge Device - Radius - CHAP');
insert into StringsMap values('13201','Two-Factor');
insert into StringsMap values('13202','Please configure at least one');
insert into StringsMap values('13203','AP');
insert into StringsMap values('13204','with WPA/WPA2 security to use this feature');
insert into StringsMap values('13205','Please configure the');
insert into StringsMap values('13206','Please enable at least one');
insert into StringsMap values('13207','Please enable the');
insert into StringsMap values('13208','Please enter a valid integer value.');
insert into StringsMap values('13209','There is error on this page.');
insert into StringsMap values('13210','Please enter a value between');
insert into StringsMap values('13211','Wan1Phy');
insert into StringsMap values('13212','Wan2Phy');
insert into StringsMap values('13213','Option1Phy');
insert into StringsMap values('13214','Option2Phy');
insert into StringsMap values('13215','sit0 Tunnel');
insert into StringsMap values('13216','Click ''OK'' to continue or ''Cancel'' to abort');
insert into StringsMap values('13217','Are you sure you want to enable ''Clasical Routing''?');
insert into StringsMap values('13218','Are you sure you want to enable ''NAT''?');
insert into StringsMap values('13219','Are you sure you want to enable ''Transparent''?');
insert into StringsMap values('13220','Port Type');
insert into StringsMap values('13221','Port Range');
insert into StringsMap values('13222','Multiple Ports');
insert into StringsMap values('13223','Ports');
insert into StringsMap values('13224','Optional port');
insert into StringsMap values('13225','WLAN Setup Wizard');
insert into StringsMap values('13226','IP Alias Configuration');
insert into StringsMap values('13227','AP Status');
insert into StringsMap values('13228','ACL Station Config');
insert into StringsMap values('13229','LAN DHCP Reserved IP Config');
insert into StringsMap values('13230','DMZ DHCP Reserved IP Config');
insert into StringsMap values('13231','IPsec Policy Config');
insert into StringsMap values('13232','Configured Client Routes Config');
insert into StringsMap values('13233','SSL VPN Client Portal');
insert into StringsMap values('13234','USB1 Status');
insert into StringsMap values('13235','USB2 Status');
insert into StringsMap values('13236','USB SharePort Settings');
insert into StringsMap values('13237','Create Sms');
insert into StringsMap values('13238','Port VLAN Config');
insert into StringsMap values('13239','Multiple VLAN Subnets Config');
insert into StringsMap values('13240','Available VLAN Config');
insert into StringsMap values('13241','WDS Peer Configuration');
insert into StringsMap values('13242','Intel AMT');
insert into StringsMap values('13243','TOOLS HELP');
insert into StringsMap values('13244','IPv6 Logs Configuration');
insert into StringsMap values('13245','License');
insert into StringsMap values('13246','Diag Display');
insert into StringsMap values('13247','Diag Ptrace');
insert into StringsMap values('13248','configurable port WAN');
insert into StringsMap values('13249','option2');
insert into StringsMap values('13250','OSPFv2');
insert into StringsMap values('13251','OSPFv3');
insert into StringsMap values('13252','Package Manager');
insert into StringsMap values('13253','Application Type');
insert into StringsMap values('13254','Https');
insert into StringsMap values('13255','IPsec');
insert into StringsMap values('13256','Router initializing after reboot, please wait');
insert into StringsMap values('13257','Your session has been terminated.');
insert into StringsMap values('13258','Copyright &#169; 2014 D-Link Corporation.');
insert into StringsMap values('13259','D-Link');
insert into StringsMap values('13260','Unified Services Router');
insert into StringsMap values('13261','Not Yet Connected');
insert into StringsMap values('13262','LINK DOWN');
insert into StringsMap values('13263','Cannot delete Self Certificates Request as it is being used by uploaded Active Self Signed Certificate');
insert into StringsMap values('13264','Cannot upload multiple active certificates for the same certificate request');
insert into StringsMap values('13265','Successfully marked the certificate as default');
insert into StringsMap values('13266','Failed to mark the certificate as default');
insert into StringsMap values('13267','Generate Self Certificate Request failed as self certificate request with same Subject already exists');
insert into StringsMap values('13268','Generate Self Certificate Request failed as self certificate request with same Request Name already exists');
insert into StringsMap values('13269','Unable to connect the server. Please check internet settings.');
insert into StringsMap values('13270','Connecting to the Server...');
insert into StringsMap values('13271','Unknown error has occurred.');
insert into StringsMap values('13272','Unknown Url.');
insert into StringsMap values('13273','Prorocol not specified');
insert into StringsMap values('13274','Protocol not supported.');
insert into StringsMap values('13275','Unable to create ssl context.');
insert into StringsMap values('13276','Failed to connect to remote server. Please check Internet Settings');
insert into StringsMap values('13277','Unable to send information.');
insert into StringsMap values('13278','Server is Busy. Please retry after some time.');
insert into StringsMap values('13279','Unable to retrieve information from server.');
insert into StringsMap values('13280','You are running the latest firmware version.');
insert into StringsMap values('13281','A newer version');
insert into StringsMap values('13282','is available for download.');
insert into StringsMap values('13283','Invalid Firmware Version.');
insert into StringsMap values('13284','Authentication Mode');
insert into StringsMap values('13285','Radius');
insert into StringsMap values('13286','Redirection Type');
insert into StringsMap values('13287','HTTP');
insert into StringsMap values('13288','HTTPS');
insert into StringsMap values('13289','Save');
insert into StringsMap values('13290','Service is in use with a configured Traffic Selector Rule');
insert into StringsMap values('13291','Service is in use with a configured Protocol Binding Rule');
insert into StringsMap values('13292','Computer Name');
insert into StringsMap values('13293','Associate with IP / MAC Binding');
insert into StringsMap values('13294','Associate with DHCP Reserved IP');
insert into StringsMap values('13295','Please enter a valid Computer Name');
insert into StringsMap values('13296','No Packages Available in the running Servers');
insert into StringsMap values('13297','No Server available');
insert into StringsMap values('13298','No Packages Available');
insert into StringsMap values('13299','Not Installed');
insert into StringsMap values('13300','Error In Network Connection');
insert into StringsMap values('13301','Selected Language pack has been installed. Please dis-select it');
insert into StringsMap values('13302','No Key Available');
insert into StringsMap values('13303','Authentication Server 3 (Optional)');
insert into StringsMap values('13304','Please enter a valid Authentication Port for Optional Authentication Server.');
insert into StringsMap values('13305','Please enter a valid IP Address for Optional Authentication Server.');
insert into StringsMap values('13306','Please enter a valid Secret value for Optional Authentication Server.');
insert into StringsMap values('13307','Please enter a valid TimeOut value for Optional Authentication Server');
insert into StringsMap values('13308','Please enter a valid Retries value for Optional Authentication Server');
insert into StringsMap values('13309','Provided user name is not a part of Administrator/Guest/SSL-VPN.');
insert into StringsMap values('13310','Blocked to Login by Admin');
insert into StringsMap values('13311','Blocked to Login From WAN side');
insert into StringsMap values('13312','Blocked to Login From this IP Address');
insert into StringsMap values('13313','Browser Not Supported!');
insert into StringsMap values('13314','Blocked to Login From this Browser');
insert into StringsMap values('13315','Portal Layout cannot be deleted if it contains Group(s)');
insert into StringsMap values('13316','Portal cannot be set as default if no group uses it');
insert into StringsMap values('13317','More than 2 languages cannot be installed');
insert into StringsMap values('13318','Please install drivers for languages in <a href=''?page=drivers.htm''>package manager</a> page to get more languages');
insert into StringsMap values('13319','Active Directory Settings');
insert into StringsMap values('13320','List of Active Directory Profiles');
insert into StringsMap values('13321','Profile');
insert into StringsMap values('13322','Primary Authentication Server');
insert into StringsMap values('13323','Active Directory Configuration');
insert into StringsMap values('13324','NTDOMAIN Profiles');
insert into StringsMap values('13325','Active Directory Profiles');
insert into StringsMap values('13326','LDAP Profiles');
insert into StringsMap values('13327','Radius Profiles');
insert into StringsMap values('13328','Authentication Database');
insert into StringsMap values('13329','External RADIUS Server');
insert into StringsMap values('13330','LDAP Settings');
insert into StringsMap values('13331','List of LDAP Profiles');
insert into StringsMap values('13332','LDAP Configuration');
insert into StringsMap values('13333','External Authentica');
insert into StringsMap values('13334','NT Domain Settings');
insert into StringsMap values('13335','List of NT Domain Profiles');
insert into StringsMap values('13336','NT Domain Configuration');
insert into StringsMap values('13337','Primary WINS Server');
insert into StringsMap values('13338','Secondary WINS Server (Optional)');
insert into StringsMap values('13339','Please enter a valid Primary WINS Server IP address.');
insert into StringsMap values('13340','Invalid Profile Name');
insert into StringsMap values('13341','List of RADIUS Profiles');
insert into StringsMap values('13342','Invalid LDAP Attribute:');
insert into StringsMap values('13343','Invalid LDAP Base DN:');
insert into StringsMap values('13344','Profile already exists');
insert into StringsMap values('13345','Active Directory Configuration failed');
insert into StringsMap values('13346','LDAP Configuration failed:');
insert into StringsMap values('13347','Selected Profile(s) deleted successfully');
insert into StringsMap values('13348','Selected Profile(s) could not be deleted');
insert into StringsMap values('13349','NT Domain configuration failed');
insert into StringsMap values('13350','Profile in enabled state cannot be deleted');
insert into StringsMap values('13351','Selected Profile successfully enabled');
insert into StringsMap values('13352','Rollover WAN');
insert into StringsMap values('13353','Invalid Driver Package');
insert into StringsMap values('13354','Space not available to install Package');
insert into StringsMap values('13355','Package exists and this version is already Installed');
insert into StringsMap values('13356','Not able to install Driver Package');
insert into StringsMap values('13357','Package is not available in repository');
insert into StringsMap values('13358','Not able to resolve dependency to install Driver Package');
insert into StringsMap values('13359','Not able to download Driver Package from server');
insert into StringsMap values('13360','Preparing to upgrade firmware image. If the image selected for upgrade is of a different region than what is presently used on your device, the current configuration will be automatically reset to factory defaults. If you are downgrading the firmware image to an older image then previously stored configuration of that older image will be restored. Changes made in the current firmware image will not persist.\n The upgrade process may take a few minutes. Are you sure you want to proceed?\n WARNING: Interrupting the upload or powering off the system during the upload may damage the firmware.');
insert into StringsMap values('13361','NTDOMAIN Settings are not configured. Please Configure NTDOMAIN Settings');
insert into StringsMap values('13362','Active Directory Settings are not configured. Please Configure Active Directory Settings');
insert into StringsMap values('13363','LDAP Settings are not configured. Please Configure LDAP Settings');
insert into StringsMap values('13364','No Radius Profiles to configure the group. Please configure a Radius Profile');
insert into StringsMap values('13365','Please check connectivity to server');
insert into StringsMap values('13366','Reserved IP should be configured in DHCP Server Address range pool of VLAN. Please configure a different IP');
insert into StringsMap values('13367','One of the Reserved IPs fall out side this Dhcp Server address range. Please configure a different range.');
insert into StringsMap values('13368','qosClassQueue');
insert into StringsMap values('13369','StaticRoutes');
insert into StringsMap values('13370','VPNProfiles');
insert into StringsMap values('13371','Firewall');
insert into StringsMap values('13372','Please remove DMZ configurations from Bandwidth Profiles');
insert into StringsMap values('13373','Schedule Control');
insert into StringsMap values('13374','Turn-on');
insert into StringsMap values('13375','Turn-off');
insert into StringsMap values('13376','Active-Directory');
insert into StringsMap values('13377','POP3');
insert into StringsMap values('13378','NT-Domain');
insert into StringsMap values('13379','Xauth Profile');
insert into StringsMap values('13380','Active Directory Settings are not configured. Please configure Active Directory Settings.');
insert into StringsMap values('13381','POP3 Settings are not configured. Please configure POP3 Settings');
insert into StringsMap values('13382','LDAP Settings are not configured. Please configure LDAP Settings.');
insert into StringsMap values('13383','NTDOMAIN Settings are not configured. Please configure NTDOMAIN Settings.');
insert into StringsMap values('13384','POP3 Profiles');
insert into StringsMap values('13385','List of POP3 Profiles');
insert into StringsMap values('13386','SSL Enable');
insert into StringsMap values('13387','CA File');
insert into StringsMap values('13388','POP3 Configuration');
insert into StringsMap values('13389','POP3 CA Files');
insert into StringsMap values('13390','List of POP3 CA Files');
insert into StringsMap values('13391','Upload POP3 CA Files');
insert into StringsMap values('13392','Add POP3 CA Files');
insert into StringsMap values('13393','please select a .crt file');
insert into StringsMap values('13394','file; please select a .crt file instead!');
insert into StringsMap values('13395','Please enter a valid Authentication Port');
insert into StringsMap values('13396','for Authport field.');
insert into StringsMap values('13397','Please upload CA file first');
insert into StringsMap values('13398','POP3 Settings');
insert into StringsMap values('13399','POP3 Server Configuration');
insert into StringsMap values('13400','POP3 Trusted CA');
insert into StringsMap values('13401','POP3');
insert into StringsMap values('13402','POP3 Profiles');
insert into StringsMap values('13403','POP3 Settings are not configured. Please Configure POP3 Settings');
insert into StringsMap values('13404','Third Workgroup');
insert into StringsMap values('13405','Invalid Third Workgroup:');
insert into StringsMap values('13406','Invalid Third Active Directory Domain:');
insert into StringsMap values('13407','Third Active Directory Domain');
insert into StringsMap values('13408','Third LDAP Base DN');
insert into StringsMap values('13409','Please enter a valid Authentication Server 2');
insert into StringsMap values('13410','Please enter a valid Second Authentication Port');
insert into StringsMap values('13411','Users');
insert into StringsMap values('13412','Enable MPPE');
insert into StringsMap values('13413','L2TP Client');
insert into StringsMap values('13414','Please enter a valid Secret');
insert into StringsMap values('13415','Link encryption will occur only if L2TP Server also supports MPPE');
insert into StringsMap values('13416','Active L2TP VPN connections');
insert into StringsMap values('13417','Enable L2TP Client');
insert into StringsMap values('13418','L2TP Client Configuration');
insert into StringsMap values('13419','NAT or Classical');
insert into StringsMap values('13420','NAT vs. Classical routing for each WAN');
insert into StringsMap values('13421','NAT with WAN1');
insert into StringsMap values('13422','NAT with WAN2');
insert into StringsMap values('13423','Block MAC');
insert into StringsMap values('13424','Default Gateway IP Address must be in LAN subnet: ');
insert into StringsMap values('13435','WAN1-DHCP');
insert into StringsMap values('13436','Server IP is invalid');
insert into StringsMap values('13437','Remote Network is invalid');
insert into StringsMap values('13438','Configuration applied successfully!');
insert into StringsMap values('13439','Configuration not applied!');
insert into StringsMap values('13440','UpstreamInterface WAN');
insert into StringsMap values('13441','WAN1-PPTP');
insert into StringsMap values('13442','WAN1-L2TP');
insert into StringsMap values('13443','WAN2-DHCP');
insert into StringsMap values('13444','WAN2-PPTP');
insert into StringsMap values('13445','WAN2-L2TP');
insert into StringsMap values('13446','Bridge Firewall Rules');
insert into StringsMap values('13447','List of Bridge Firewall Rules');
insert into StringsMap values('13448','Direction');
insert into StringsMap values('13449','Ethernet Protocol');
insert into StringsMap values('13450','Source MAC');
insert into StringsMap values('13451','Destination MAC');
insert into StringsMap values('13452','Inbound');
insert into StringsMap values('13453','Outbound');
insert into StringsMap values('13454','Single MAC');
insert into StringsMap values('13455','MAC Range');
insert into StringsMap values('13456','Bridge Firewall Rule Configuration');
insert into StringsMap values('13457','WAN1 Available VLANs');
insert into StringsMap values('13458','WAN2 Available VLANs');
insert into StringsMap values('13459','WAN1 VLAN Configuration');
insert into StringsMap values('13460','WAN2 VLAN Configuration');
insert into StringsMap values('13461','Enable Trunk Mode VLAN');
insert into StringsMap values('13462','Bridge Bandwidth Profiles');
insert into StringsMap values('13463','Enable Bridge Bandwidth Profiles');
insert into StringsMap values('13464','List of Bridge Bandwidth Profiles');
insert into StringsMap values('13465','Bridge Bandwidth Rate / Priority');
insert into StringsMap values('13466','Bridge Bandwidth Profile Configuration');
insert into StringsMap values('13467','Bridge Traffic Selectors');
insert into StringsMap values('13468','List of Bridge Traffic Selectors');
insert into StringsMap values('13469','Bridge Bandwidth Profile');
insert into StringsMap values('13470','Bridge Traffic Selectors Configuration');
insert into StringsMap values('13471','Bridge Bandwidth Profiles reached to maximum limit (15)');
insert into StringsMap values('13472','Bandwidth profile edit failed as it is being used by traffic selector');
insert into StringsMap values('13473','Bridge Bandwidth Profile(s) Configuration Failed');
insert into StringsMap values('13474','Bridge Bandwidth Profile Status Configuration Failey');
insert into StringsMap values('13475','Bridge Bandwidth Profile(s) Delete Failed as it is being used by traffic selector');
insert into StringsMap values('13476','Bridge Bandwidth Profile(s) Delete Failed');
insert into StringsMap values('13477','Bridge Traffic Selector(s) Delete Failed');
insert into StringsMap values('13478','Bridge Traffic Selector Configuration Failed');
insert into StringsMap values('13479','Accounting Server');
insert into StringsMap values('13480','Accounting Port');
insert into StringsMap values('13481','Accounting Secret');
insert into StringsMap values('13482','Please enter a valid IP Address for Primary Accounting Server.');
insert into StringsMap values('13483','Please enter a valid Accounting Port for Primary Authentication Server.');
insert into StringsMap values('13484','Please enter a valid Accounting Secret value for Primary Authentication Server.');
insert into StringsMap values('13485','Please enter a valid IP Address for Secondary Accounting Server.');
insert into StringsMap values('13486','Please enter a valid Accounting Port for Secondary Authentication Server.');
insert into StringsMap values('13487','Please enter a valid Accounting Secret value for Secondary Authentication Server.');
insert into StringsMap values('13488','Please enter a valid IP Address for Optional Accounting Server.');
insert into StringsMap values('13489','Please enter a valid Accounting Port for Optional Authentication Server.');
insert into StringsMap values('13490','Please enter a valid Accounting Secret value for Optional Authentication Server.');
insert into StringsMap values('13491','Force renegotiation on WAN with dynamic IP');
insert into StringsMap values('13492','User Based Auth Configuration');
insert into StringsMap values('13493','Enable User Based Auth');
insert into StringsMap values('13494','OpenVPN User');
insert into StringsMap values('13495','Upload failed. Common Name information missing in certificate.');

-- Strings for help text
insert into StringsMap values('20001','The table lists all the available port triggering rules and allows several operations on the rules.');
insert into StringsMap values('20002','Application rules are also referred to as port forwarding rules. Devices on the LAN or DMZ can send a request to the Internet along one of the defined outgoing ports, and then the configured rule will open the corresponding incoming port for the specified type of traffic coming from the WAN.Note that port triggering is not appropriate for servers on the LAN, since there is a dependency on the LAN device making an outgoing connection before incoming ports are opened.');
insert into StringsMap values('20003','This page lists the application rules currently configured.');
insert into StringsMap values('20004','This page will show the open ports and expiry time for a particular rule.');
insert into StringsMap values('20005','This content filtering option allows the user to block access to certain Internet sites. Up to 32 key words in the site''s name (web site URL) can be specified, which will block access to the site. To setup URLs, go to Approved URLs and Blocked Keywords page.');
insert into StringsMap values('20006','Approved or Blocked URL''s can be configured only when content Filtering is enabled.');
insert into StringsMap values('20007','This page displays the approved URLs.');
insert into StringsMap values('20008','The list of websites here are always allowed to be accessed, and have higher priority than any configured firewall rules or blocked keywords.');
insert into StringsMap values('20009','You can block access to websites by entering complete URLs or keywords. Keywords prevent access to websites that contain the specified characters in the URLs. The table lists all the Blocked keywords and allows several operations on the keywords.');
insert into StringsMap values('20010','The list of blocked keywords have lower priority than approved URLs, but higher than configured firewall rules.  Keywords defined in this list can be used to block LAN access to URL''s containing the entered keyword.');
insert into StringsMap values('20011','This page allows a user to configure default outbound policy for the router.');
insert into StringsMap values('20012','When the default outbound policy is Allow Always, you can configure to block hosts on the LAN from accessing internet services by creating an outbound firewall rule for each service.  Changing the default outbound policy to Block Always allows you to manage closely what type of traffic and what LAN hosts can access the Internet.');
insert into StringsMap values('20013','A firewall is a security mechanism to selectively block or allow certain types of traffic in accordance with rules specified by network administrators. You can use this page to manage the firewall rules that control traffic to and from your network. The List of Available Firewall Rules table includes all firewall rules for this device and allows several operations on the firewall rules.');
insert into StringsMap values('20014','Inbound rules govern access from the WAN to the LAN or DMZ. Using firewall rules allow you to specify which local resources can be accessed from the internet. By default all access from the internet blocked from accessing the secure LAN, except in response to requests from the LAN or DMZ. Outbound (LAN/DMZ to WAN) rules restrict access to traffic leaving your network, selectively allowing only specific local users to access outside resources. Firewall rules are applied in the order listed. As a general rule, you should move the strictest rules (those with the most specific services or addresses) to the top of the list.');
insert into StringsMap values('20015','A firewall is a security mechanism to selectively block or allow certain types of traffic in accordance with rules specified by network administrators. You can use this page to manage the firewall rules that control traffic to and from your IPv6 network. The List of Available Firewall Rules table includes all firewall rules for this device and allows several operations on the firewall rules.');
insert into StringsMap values('20016','Inbound rules govern access from the WAN to the LAN.  Using firewall rules allow you to specify which local resources can be accessed from the internet. By default all access from the internet blocked from accessing the secure LAN. Outbound (LAN to WAN) rules restrict access to traffic leaving your network, selectively allowing only specific local users to access outside resources. Firewall rules are applied in the order listed. As a general rule, you should move the strictest rules (those with the most specific services or addresses) to the top of the list.');
insert into StringsMap values('20017','When you create a firewall rule, you can specify a service that is controlled by the rule.. Common types of services are available for selection, and you can create your own custom services. This page allows creation of custom services against which firewall rules can be defined. Once defined, the new service will appear in the List of  Available Custom Services table.');
insert into StringsMap values('20018','While common services use known TCP/UDP/BOTH/ICMP/ICMPv6 ports, many custom or uncommon applications require traffic to be sent through the firewall.  This section allows you to define traffic type and static ports for a unique identifier and then create firewall rules for this user-defined service.');
insert into StringsMap values('20019','Application Level Gateway allows customized NAT traversal filters to be plugged into the gateway to support address and port translation for certain application layer ''control/data'' protocols such as TFTP, SIP, RTSP, IPsec, PPTP etc. Each ALG provides special handling for a specific protocol or application. A number of ALGs for common applications are enabled by default.');
insert into StringsMap values('20020','ALGs are security component that enhance the firewall and NAT support of this router to seamlessly support application layer protocols. Because the ALG understands the protocol used by the specific application that it supports, it is a very secure and efficient way of introducing support for client applications through the router''s firewall.');
insert into StringsMap values('20021','This features helps the user to block/allow mails based on Mail Id or subject.');
insert into StringsMap values('20022','The SMTP ALG Status needs to be enabled for this feature to work. The SMTP protocol generally works on TCP port 25. But if a different port is configured in the local environment, then appropriate configuration needs to be done in the ''port'' field on the page.');
insert into StringsMap values('20023','This is the list of Mail Ids that are supposed to be allowed');
insert into StringsMap values('20024','The user needs to configure the approved Mail Id here');
insert into StringsMap values('20025','The Mail Ids which are deemed to be safe, non-spam can be configured here');
insert into StringsMap values('20026','List of Mail Ids blocked');
insert into StringsMap values('20027','This is the list of Mail Ids that are supposed to be blocked');
insert into StringsMap values('20028','Configure the Mail Id to be blocked');
insert into StringsMap values('20029','The Mail Ids which are known to send spam-mails, virus containing attachments etc can be configured here.');
insert into StringsMap values('20030','List of Subjects and Mail Ids');
insert into StringsMap values('20031','This is the list of Subjects and Mail ids which are to allowed/blocked');
insert into StringsMap values('20032','Configure the Subject and corresponding mail Id');
insert into StringsMap values('20033','This feature allows the user to take action based on the Subject of a mail from/to a specific mail Id.');
insert into StringsMap values('20034','This page allows user to configure VPN (IPsec, PPTP and L2TP) passthrough on the router. Enabled passthrough checkboxes have higher priority than firewall rules based on the same service.');
insert into StringsMap values('20035','This router''s firewall settings can be configured to allow outbound encrypted VPN traffic for IPsec, PPTP, and L2TP VPN tunnel connections. This LAN to WAN passthrough support is easy to enable on this page as compared to creating a specific service-specific firewall outbound policy.');
insert into StringsMap values('20036','This page is used to specify advanced configuration settings for the radio.');
insert into StringsMap values('20037','It is recommended that you leave these options at their default values.  Modifying these could negatively impact the performance of your wireless network.');
insert into StringsMap values('20038','This page allows you to define and modify the Wi-Fi Protected Setup (WPS) configuration parameters.');
insert into StringsMap values('20039','WPS is a simplified method to add supporting wireless clients to the network, and can only be used for APs that use WPA or WPA2 security.  Note that more than one AP can use WPS, but only one AP can be used to establish WPS links to client at any given time.');
insert into StringsMap values('20040','UPnP (Universal Plug and Play) is a feature that allows for automatic discovery of devices that can communicate with this security appliance');
insert into StringsMap values('20041','UPnP is useful for auto-configuring application rules, where internal/external ports for the traffic protocol required by a detected network device are opened without user intervention.  The UPnP Port Map Table has the details of UPnP devices that respond to the router''s advertisements, and thereby don''t require corresponding application (port forwarding) rules to be configured.');
insert into StringsMap values('20042','This page allows user to configure advanced WAN options for the router.');
insert into StringsMap values('20043','The physical port settings for each WAN link can be defined here. If your ISP account defines the WAN port speed or is associated with a MAC address, enter the details here. One key parameter is the ability to disable ping response on the WAN ports.  Disabling this will increase the router''s overall security as it will not be detected easily from internet attacks that would attempt to take control of or disable the router.');
insert into StringsMap values('20044','The IGMP Proxy page allows the user to enable IGMP proxy on a LAN interface.');
insert into StringsMap values('20045','This is known as active IGMP snooping, and lets the router listen in on IGMP network traffic. The router filters multicast traffic through the router and is used to prevent LAN hosts from receiving traffic from a multicast group that they have not explicitly joined.');
insert into StringsMap values('20046','This page allows the user to configure the IP network or the host address of the multicast source.');
insert into StringsMap values('20047','Configure mask length as 32 in case of host addresses. In case of IP networks the appropriate mask length should be provided.');
insert into StringsMap values('20048','This page allows user to configure Intrusion Detection System and Intrusion Preventions system on the router.');
insert into StringsMap values('20049','IPS prevents malicious attacks from the internet from accessing the private network. Traffic from the LAN or WAN ports are compared against static attack signatures loaded to the router in order to detect and prevent the router from being starved of resources or otherwise disabled.');
insert into StringsMap values('20050','This page allows you to specify whether or not to protect against common attacks from the LAN and WAN networks.');
insert into StringsMap values('20051','For added security, it is recommended that you enable Stealth Mode. This blocks ping and ARP response from the WAN interfaces.  Ping is often used by malicious Internet users to locate active networks or PCs.');
insert into StringsMap values('20052','This page shows the list of configured bandwidth profiles. These profiles then can be used with the traffic selectors.');
insert into StringsMap values('20053','With bandwidth profiles you can shape and regulate the LAN to WAN traffic. This is useful to ensure that low priority LAN users do not monopolize the available WAN''s bandwidth for cost-savings or bandwidth-priority-allocation purposes.');
insert into StringsMap values('20054','This page shows a list of traffic selectors. Traffic selectors are service based rules to which user can attach bandwidth profiles.');
insert into StringsMap values('20055','Once a bandwidth profile has been created it can then be associated with a traffic flow from the LAN to WAN.  Traffic selectors are elements like IP addresses or services that require their outbound traffic to be regulated.');
insert into StringsMap values('20056','This page shows the list of static routes configured on the router. User can also add, delete and edit the configured routes.');
insert into StringsMap values('20057','Use this page to define static routes.  Be sure to enter a destination address, subnet mask, gateway and metric for each configured static route. The Interface dropdown menu will show all available configured wired interfaces on the router as options.');
insert into StringsMap values('20058','This page shows the configured protocol bindings. A user can also add, delete, edit, enable or disable the protocol bindings.');
insert into StringsMap values('20059','Protocol bindings are required when the Load Balancing feature is in use, and are only applicable when two WAN links are configured. This feature lets you assign a service to a particular WAN link to ensure the high priority services are sent to the more reliable or less expensive ISP.');
insert into StringsMap values('20060','Digital Certificates (also known as X509 Certificates) are used to authenticate the identity of users and systems, and are issued by Certification Authorities (CA) such as VeriSign, Thawte and other organizations. Digital Certificates are used by this router during the Internet Key Exchange (IKE) authentication phase to authenticate connecting VPN gateways or clients, or to be authenticated by remote entities.');
insert into StringsMap values('20061','IPsec VPN, SSL VPN, and management over HTTPS use digital certificates.  The router has a default self-signed certificate, and this can be replaced by one signed by a known Certificate Authority if needed.  Note that a CA certificate provides strong assurance of the server''s identity and is a requirement for most corporate network VPN solutions.');
insert into StringsMap values('20062','This page allows user to import a CSV formatted user database to the router.');
insert into StringsMap values('20063','The user may only add system users using the CSV file upload mechanism. Before adding users to different groups, the groups must be created using GUI. Also edit and delete operations on users can be more conveniently handled through GUI as it is much easier to select a particular user for edit/delete. This mechanism of csv file upload is more convenient than GUI only for adding a large number of users where users could be added at one go rather than one at a time through the GUI.');
insert into StringsMap values('20064','This page shows the list of added domains to the router. The user can add, delete and edit the domains also.');
insert into StringsMap values('20065','The Domain determines the authentication method for a VPN or GUI user.  For SSL VPN connections, the domain sets the portal layout and corresponding SSL VPN features. You must create a Domain first, and then a new Group can be created and assigned to the Domain.  The last step is to add specific SSL VPN users to an already-configured Group.');
insert into StringsMap values('20066','This page shows the list of added groups to the router. The user can add, delete and edit the groups also.');
insert into StringsMap values('20067','Login policies, Policies by Browser and Policies by IP can only be configured for groups having sslvpn privileges.');
insert into StringsMap values('20068','This page shows a list of available users in the system. A user can add, delete and edit the users also. This page can also be used for setting policies on users.');
insert into StringsMap values('20069','Authentication of the users (IPsec, SSL VPN, or GUI) is done by the router using either a local database on the router or external authentication servers (i.e. LDAP or RADIUS). User level policies can be specified by browser, IP address of the host, and whether the user can login to the router''s GUI in addition to the SSL VPN portal');
insert into StringsMap values('20070','Authentication of the users (IPsec or GUI) is done by the router using either a local database on the router.');
insert into StringsMap values('20071','The table lists all the currently defined IP/MAC Bind rules and allows several operations on the rules.');
insert into StringsMap values('20072','This feature allows protection against spoofed IP addresses by enforcing the gateway to validate the source traffic''s IP address with the unique MAC Address of the configured LAN node.  In the event of a violation (i.e. the traffic''s source IP address doesn''t match up with the expected MAC address having the same IP address) the packets will be dropped and can be logged for diagnosis.');
insert into StringsMap values('20073','This page allows user to configure the IP protocol version to be used on the router.');
insert into StringsMap values('20074','In order to support IPv6 on the LAN, you must set the router to be in IPv4 / IPv6 mode.  This mode will allow IPv4 nodes to communicate with IPv6 devices through this router.');
insert into StringsMap values('20075','This page allows user to IPv6 related WAN1 configurations.');
insert into StringsMap values('20076','This router can have a static IPv6 address or receive connection information when configured as a DHCPv6 client or connect to ISP using username and password (PPPoE). The DHCPv6 client on the gateway can be either stateless or stateful. If a stateful client is selected the gateway will connect to the ISP''s DHCPv6 server for a leased address. For stateless DHCP there need not be a DHCPv6 server available at the ISP, rather ICMPv6 discover messages will originate from this gateway and will be used for auto configuration.');
insert into StringsMap values('20077','This page allows user to IPv6 related WAN configurations.');
insert into StringsMap values('20078','This page shows a list of IPv6 static routes added. A user can add, delete and edit the routes also.');
insert into StringsMap values('20079','This page allows user to IPv6 related WAN2 configurations.');
insert into StringsMap values('20080','This page allows user to IPv6 related LAN configurations.');
insert into StringsMap values('20081','The IPv6 address is 128 bits, with a default 64 bit prefix that defines the network and is common among all LAN hosts. Changes here affect all devices connected to the router''s LAN switch.  Note that a change to the defaul LAN IP address will require all LAN hosts to be in the same network prefix and use the new address to access this GUI.');
insert into StringsMap values('20082','This table displays the list of DHCPv6 clients connected to the LAN DHCPv6 Server and to whom DHCPv6 Server has given leases.');
insert into StringsMap values('20083','If the LAN is serving DHCPV6 addresses, this table will show the list of DHCPv6 clients for the router''s LAN DHCPv6 server.');
insert into StringsMap values('20084','This page allows user to configure Router Advertisement Daemon (RADVD) related configurations.');
insert into StringsMap values('20085','Router Advertisements are analogous to IPv4 DHCP assignments for LAN clients.  With this the router will perform stateless autoconfiguration of LAN nodes by assigning an IP address and supporting network information to devices that are configured to accept such details.  By configuring the Router Advertisement Daemon on this router, the device will listen on the LAN for router solicitations and respond to these LAN hosts with router advisements.');
insert into StringsMap values('20086','This page allows user to configure IPv6 prefixes which will be used while advertisement.');
insert into StringsMap values('20087','The router advertisements configured with advertisement prefixes allow this router to inform hosts how to perform stateless address autoconfiguration.  Router advertisements contain a list of subnet prefixes that allow the router to determine neighbors and whether the host is on the same link as the router.');
insert into StringsMap values('20088','Use this page to define static routes for the IPv6 related interfaces.');
insert into StringsMap values('20089','This page allows user to enable/disable the 6 to 4 tunneling.');
insert into StringsMap values('20090','With this option enabled IPv4 address information is embedded in IPv6 addresses on the LAN.  This option is very common in network that use both IPv4 and IPv6 nodes.');
insert into StringsMap values('20091','This page shows the status of IPv6 tunnels.');
insert into StringsMap values('20092','Active IPv6 tunnels are listed by tunnel name and IPv6 address.');
insert into StringsMap values('20093','This page shows the list of available ISATAP tunnels. A user can also add, delete and edit ISATAP tunnels from this page.');
insert into StringsMap values('20094','ISATAP is available to provide connectivity between IPv6 nodes within the LAN, as it treats the IPv4 network as a single IPv6 local link.');
insert into StringsMap values('20095','This page allows user to enable/disable power saving, jumbo frames in the router.');
insert into StringsMap values('20096','There are two options available to support power efficiency on the router.  With Length Detection State enabled, the Ethernet cable link length will be detected by the router and power to the port will be modified accordingly. Jumbo Frames option is available to exchange traffic containing Jumbo Frames on Lan side Devices.');
insert into StringsMap values('20097','This page allows user to generate a self certificate using a custom configuration.');
insert into StringsMap values('20098','Please select the Hash Algorithm and Signature Key Length appropriately for better security.');
insert into StringsMap values('20099','This page allows user to configure various traffic rules, to which bandwidth profiles can be attached.');
insert into StringsMap values('20100','Once a bandwidth profile has been created it can then be associated with a traffic flow from the LAN to WAN. Traffic selectors are elements like IP addresses or services that require their outbound traffic to be regulated.');
insert into StringsMap values('20101','This page allows a user to add a new port triggering rule.');
insert into StringsMap values('20102','Application rules are also referred to as port forwarding rules. Devices on the LAN or DMZ can send a request to the Internet along one of the defined outgoing ports, and then the configured rule will open the corresponding incoming port for the specified type of traffic coming from the WAN. Note that port triggering is not appropriate for servers on the LAN, since there is a dependency on the LAN device making an outgoing connection before incoming ports are opened.');
insert into StringsMap values('20103','This page allows a user to add a trusted URL.');
insert into StringsMap values('20104','Do you know that trusted URLs will have higer priority than blocked URLs.');
insert into StringsMap values('20105','This page allows a user to add a blocked keyword.');
insert into StringsMap values('20106','You can block a website by adding an URL string as a blocked keyword.');
insert into StringsMap values('20107','This page allows you to add a new firewall rule or edit the configuration of an existing firewall rule. The details will then be displayed in the List of Available Firewall Rules table on the Firewall Rules page.');
insert into StringsMap values('20108','If you are not an expert user, we recommend not to configure firewall rules and leave the router into default firewall configuration.');
insert into StringsMap values('20109','This page allows you to add a new firewall rule or edit the configuration of an existing firewall rule. The details will then be displayed in the List of Available Firewall Rules table on the IPv6 Firewall Rules page.');
insert into StringsMap values('20110','This page allows a user to add a user defined custom service.');
insert into StringsMap values('20111','Created services are available as options for firewall rule configuration.');
insert into StringsMap values('20112','This page allows user to add a new bandwidth profile.');
insert into StringsMap values('20113','The new configured bandwidth profile can be attached to a traffic selector for bandwidth management on the router.');
insert into StringsMap values('20114','This page allows user to add a new static route.');
insert into StringsMap values('20115','Static routes can be used for routing the traffic. You can select the interface from where you want to route the traffic.');
insert into StringsMap values('20116','This page allows user to add a new protocol binding rule for the WAN interfaces.');
insert into StringsMap values('20117','Protocol bindings will work, when WAN is configured in Load Balancing mode.');
insert into StringsMap values('20118','This page allows user to upload a active self certificate to the router.');
insert into StringsMap values('20119','Please locate the certificate on your secondary storage of your computer and press Upload.');
insert into StringsMap values('20120','This page allow you to configure NT Domain servers.');
insert into StringsMap values('20121','Use workgroup for authentication server 1, second workgroup for authentication server 2, third workgroup for authentication server 3');
insert into StringsMap values('20122','This page allows user to add a new user group. Once this group is added, a user can then add system users to it.');
insert into StringsMap values('20123','Do you know that you can associate multiple users to a single group.');
insert into StringsMap values('20124','This page allows a user to add new system users.');
insert into StringsMap values('20125','If an user is added to a group that has more than one privilege, one requiring authentication from the local database and the other from some remote database like RADIUS, a valid password needs to be provided. However the local password will only be used for the group requiring authentication from the local database. For the group that has chosen remote authentication, the remote credentials will be used and not the local ones.');
insert into StringsMap values('20126','This page allows user to add login policies for the available users.');
insert into StringsMap values('20127','You can disable login for a user from this page.');
insert into StringsMap values('20128','This page allows user to add browser specific policies for available users.');
insert into StringsMap values('20129','You can specify login policies based upon browser from this page.');
insert into StringsMap values('20130','This page allows user to add IP based policies specific policies for available users.');
insert into StringsMap values('20131','You can specify login policies based upon IP from this page.');
insert into StringsMap values('20132','This page allows you to add a new IP/MAC Bind rule. The details will then be displayed in the List of IP/MAC Bind rules table.');
insert into StringsMap values('20133','You can enable/disable the logging associated with each IP/Mac binding rule.');
insert into StringsMap values('20134','This page allows user to configure the IPv6 address prefixes and pools');
insert into StringsMap values('20135','An IP address prefix and pool consists of start address, end address and prefix length.');
insert into StringsMap values('20136','This page allows user to configure a new IPv6 advertise prefix.');
insert into StringsMap values('20137','This page allows user to add a static IPv6 route.');
insert into StringsMap values('20138','Be sure to enter a destination address, subnet mask, gateway and metric for each configured static route. The Interface dropdown menu will show all available configured wired interfaces on the router as options.');
insert into StringsMap values('20139','This page allows user to configure a new isatap tunnel.');
insert into StringsMap values('20140','This page allows user to add IP address based entries which can be used for IP address based login rules.');
insert into StringsMap values('20141','These IP address related can be attached to login policies.');
insert into StringsMap values('20142','This page allows user to upload a trusted certificate to the router.');
insert into StringsMap values('20143','This page shows the certificate request details for a particular certificate request.');
insert into StringsMap values('20144','You can use the data shown to generate the CA.');
insert into StringsMap values('20145','This page displays a list of active run time sessions on your router.');
insert into StringsMap values('20146','Use this page to monitor the runtime authentication sessions that are active on your router.');
insert into StringsMap values('20147','Captive Portal is a security mechanism to selectively provide authentication on certain interfaces.You can use this page to manage the Login Profiles of CaptivePortal.');
insert into StringsMap values('20148','Enabling Captive Portal will result in the addition of firewall policies. This will help you to authenticate users trying to access internet. By default, Captive Portal is not enabled on any of the interfaces.');
insert into StringsMap values('20149','This page allows you to add a new captive Portal Policy or edit the configuration of an existing Policy. The details will then be displayed in the List of Captive Portal Policies table on the cpSetup page.');
insert into StringsMap values('20150','Captive Portal Login page is used for authentication on Captive Portal enabled interfaces.');
insert into StringsMap values('20151','Captive portal login page display can be altered by modifying the settings available here.');
insert into StringsMap values('20152','Here Header Images can be uploaded for Captive Portal Login Page.');
insert into StringsMap values('20153','The Images Uploaded here can be used as header Images in Captive Portal Login Page.');
insert into StringsMap values('20154','This page shows the OSPFv2 parameters configured on the router.User can also edit the OSPFv2 configured parameters.');
insert into StringsMap values('20155','OSPF (Open Shortest Path First) version 2 is a routing protocol which is described in RFC2328, OSPF Version 2. OSPF is an IGP (Interior Gateway Protocol) used to distribute routing information within a single Autonomous System. Compared with RIP, OSPF can provide scalable network support and faster convergence times.OSPF can be used to design and build large and complicated networks.');
insert into StringsMap values('20156','This page shows the OSPFv3 parameters configured on the router.User can also edit the OSPFv3 configured parameters');
insert into StringsMap values('20157','OSPF(Open Shortest Path First) version 3 is a routing protocol for IPv6 Networks (OSPFv3) described in RFC2740.OSPF is an IGP (Interior Gateway Protocol) used to distribute routing information within a single Autonomous System. Compared with RIP, OSPF can provide scalable network support and faster convergence times.OSPF can be used to design and build large and complicated networks.');
insert into StringsMap values('20158','This page allows the user to update the configured OSPFv3 parameters');
insert into StringsMap values('20159','Be sure to enter Area, Priority, HelloInterval , DeadInterval, Cost for particular interface.');
insert into StringsMap values('20160','This page allows the user to update the configured OSPFv2 parameters');
insert into StringsMap values('20161','Be sure to enter Area, Priority, HelloInterval , DeadInterval, Cost, Authentication Type for particular interface.The Authentication Type dropdown menu will show all available authentication types as options.');
insert into StringsMap values('20162','This page will guide you through common and easy steps to configure your router''s wireless interface.');
insert into StringsMap values('20163','If you are new to wireless networking and have never configured a wireless router before, click on Wireless Network Setup Wizard and the router will guide you through a few simple steps to get your wireless network up and running. If you have configured the wireless router with WPS and want to add a new supported client device to the network, click on Add Wireless Device and the router will guide you through the WPS configuration. If you consider yourself an advanced user and have configured a wireless router before, click Manual Wireless Network Setup to input all the settings manually.');
insert into StringsMap values('20164','This page will guide you through common and easy steps to configure IPsec VPN policies.');
insert into StringsMap values('20165','If you have never configured a VPN settings before, click on VPN Setup Wizard and the router will run you through a few simple steps to set up VPN policy. If you consider yourself an Advanced user and have configured a VPN settings before, click Manual VPN Configuration to input VPN settings manually.');
insert into StringsMap values('20166','This page will guide you through common configuration tasks such as changing the password, timezone and setting up of your internet connection.');
insert into StringsMap values('20167','If you are new to networking and have never configured a router before, click on Internet Connection Setup Wizard and the router will run you through a few simple steps to get your network up and running. If you consider yourself an Advanced user and have configured a router before, click Manual Internet Connection Setup to input all the settings manually.');
insert into StringsMap values('20168','This page allows you to set up your Internet connection. Ensure that you have the Internet connection information such as the IP Addresses, Account Information etc. This information is usually provided by your ISP or network administrator.');
insert into StringsMap values('20169','The setup page lets you configure the ISP settings to enable this router to connect to the Internet. This router supports multiple connections. Please select the appropriate connection to connect to the Internet. NOTE: WAN IP Address should not be configured as primary/secondary DNS server address.');
insert into StringsMap values('20170','The page provides current information regarding the WAN1 interface. Along with the information a user can enable or disable his Internet connection from this page.');
insert into StringsMap values('20171','The Status page will give you an overview of the primary and secondary internet connections from the router.  Active WAN links will have the WAN State as UP, and will show a Disable button.  If the WAN IP addresses are provided by a DHCP ISP, the DHCP lease can be released or renewed to refresh the connection.  Configured but inactive connections will have WAN State as down and can be brought up with the Enable button.');
insert into StringsMap values('20172','The setup page lets you configure the ISP settings to enable this router to connect to the Internet. This router supports multiple connections. Please select the appropriate connection to connect to the Internet. If you are connecting to a 3G ISP, please check the USB card status on Setup -> USB Settings page. NOTE: WAN IP Address should not be configured as primary/secondary DNS server address.');
insert into StringsMap values('20173','The page provides current information regarding the WAN2 interface. Along with the information a user can enable or disable his Internet connection from this page.');
insert into StringsMap values('20174','The Status page will give you an overview of the internet connections from the router.  Active WAN links will have the WAN State as UP, and will show a Disable button.  If the WAN IP addresses are provided by a DHCP ISP, the DHCP lease can be released or renewed to refresh the connection.  Configured but inactive connections will have WAN State as down and can be brought up with the Enable button.');
insert into StringsMap values('20175','The setup page lets you configure the ISP settings to enable this router to connect to the Internet.If you are connecting to a 3G ISP, please check the USB card status on Setup -> USB Settings page. NOTE: WAN IP Address should not be configured as primary/secondary DNS server address.');
insert into StringsMap values('20176','The page provides current information regarding the WAN3 interface. Along with the information a user can enable or disable his Internet connection from this page.');
insert into StringsMap values('20177','The Status page will give you an overview of the internet connections from the router.  Active WAN links will have the WAN State as UP, and will show a Disable button.  Configured but inactive connections will have WAN State as down and can be brought up with the Enable button.');
insert into StringsMap values('20178','This page allows you to configure the Port 6 of the your router to either WAN2 or DMZ.');
insert into StringsMap values('20179','The router allows you to determine the operating mode for this port to be either a hardware DMZ or a secondary Ethernet WAN port.  To configure WAN2 settings, the configurable port must be set to WAN.');
insert into StringsMap values('20180','The PPPoE Profiles page offers a convenient way to maintain multiple PPPoE accounts, which can then be associated with the WAN interface. The PPPoE profile is referenced on the WAN Configuration page. The Profiles table lists the available PPPoE profiles and some attributes associated with each profile.');
insert into StringsMap values('20181','Profiles are particularly useful when your ISP supports multiple concurrent PPPoE sessions.  Profiles configured here will appear as options in the PPPoE Profile Name in the WAN configuration page.');
insert into StringsMap values('20182','This page allows user to configure different routing modes like NAT, Classical, Transparent or Bridge. This page also allows to configure the RIP (Routing Information Protocol)');
insert into StringsMap values('20183','The Routing mode determines how traffic is handled when received on one physical interface.  NAT is the most common application for most routers, and allows you to hide internal LAN IP addresses from internet devices.  Transparent mode does not perform NAT and lets you bridge traffic between the LAN and WAN.');
insert into StringsMap values('20184','This page allows user to configure the policies on the two WAN ports for Internet connection.');
insert into StringsMap values('20185','By configuring both WANs, there are two ways for the router to access the internet.  Load balancing allows traffic to and from the internet to be shared across both configured links to ensure one ISP is not excessively overloaded.  Auto-Rollover uses a backup link to preserve internet connectivity for the LAN if the main ISP configured on the primary WAN fails for any reason.');
insert into StringsMap values('20186','This page displays the configured IP Aliases on WAN interfaces.');
insert into StringsMap values('20187','A single WAN Ethernet port can be accessed via multiple IP addresses by adding a alias to the port. This is done by configuring IP Alias.');
insert into StringsMap values('20188','This page allows you to configure Alias on WAN interfaces.');
insert into StringsMap values('20189','Enter the WAN interface, IP address, Subnet mask and click on save settings.The configured Aliases can be viewed in IP Aliasing page.');
insert into StringsMap values('20190','The List of Available Access Points table lists the configured Access Points (AP) for this device.  From this summary list, the status of each AP (over all radios) can be reviewed and AP parameter configuration settings can be accessed.');
insert into StringsMap values('20191','The DSR supports up to four concurrent Access Points. Each can have unique access policies, security settings, and bandwidth shaping depending on your needs.');
insert into StringsMap values('20192','A profile is a grouping of wireless settings which can be shared across multiple APs. AP specific settings are configured on the Access Point Configuration page. The profile allows for easy duplication of SSIDs, security settings, encryption methods, client authentication, etc. across APs.');
insert into StringsMap values('20193','The Profile can be thought of a grouping of security settings that can be applied to one or more Access Points.  When configured, a profile will be available to assign to a Access Point in the AP Configuration page.');
insert into StringsMap values('20194','This page configures the RADIUS servers to be used for authentication. A RADIUS server maintains a database of user accounts used in larger environments. If a RADIUS server is configured in the LAN, it can be used for authenticating users that want to connect to the wireless network provided by this device. If the first/primary RADIUS server is not accessible at any time, then the device will attempt to contact the secondary RADIUS server for user authentication.<br>');
insert into StringsMap values('20195','The RADIUS server is an external authentication server that can be used to associate wireless clients to an AP using RADIUS authentication.  This authentication is also referred to as Enterprise mode, and is available for WPA or WPA2 security.');
insert into StringsMap values('20196','This page allows you to configure the hardware settings for each available radio card.');
insert into StringsMap values('20197','This page lets you configure the radio''s operating mode, channel, or tranmission power.  These settings are shared among all configured access points.');
insert into StringsMap values('20198','The LAN Configuration page allows you to configure the LAN interface of the router including the DHCP Server which runs on it.');
insert into StringsMap values('20199','Changes here affect all devices connected to the router''s LAN switch and also wireless LAN clients.  Note that a change to the LAN IP address will require all LAN hosts to be in the same subnet and use the new address to access this GUI.');
insert into StringsMap values('20200','This page allows user to configure the reserved IP Addresses for the DHCP Server configuration.');
insert into StringsMap values('20201','In order to ensure certain LAN devices always receive the same IP address when DHCP is enabled on the LAN, bind the LAN device''s MAC address to a preferred IP address.  This IP address will only be assigned to the matching MAC address.');
insert into StringsMap values('20202','This table displays the list of DHCP clients connected to the LAN DHCP Server and to whom DHCP Server has given leases.');
insert into StringsMap values('20203','If the LAN is serving DHCP addresses, this table will show the list of DHCP clients for the router''s LAN DHCP server.');
insert into StringsMap values('20204','The De-Militarized Zone (DMZ) is a network which, when compared to the LAN, has fewer firewall restrictions, by default. This zone can be used to host servers and give public access to them.');
insert into StringsMap values('20205','DMZ setup is similar to the LAN TCP/IP options.  The network subnet for the DMZ can be different from the LAN, and firewall/VPN policies can be customized for the DMZ.  The DMZ is typically used for network devices that you wish to expose to the internet, such as FTP or mail servers.');
insert into StringsMap values('20206','In order to ensure certain DMZ devices always receive the same IP address when DHCP is enabled on the DMZ, bind the DMZ device''s MAC address to a preferred IP address.  This IP address will only be assigned to the matching MAC address.');
insert into StringsMap values('20207','This table displays the list of DHCP clients connected to the DMZ DHCP Server and to whom DHCP Server has given leases.');
insert into StringsMap values('20208','If the LAN is serving DHCP addresses, this table will show the list of DHCP clients for the router''s DMZ DHCP server.');
insert into StringsMap values('20209','This section allows you to add/edit/delete IKE policies.');
insert into StringsMap values('20210','The Internet Key Exchange protocol (IKE) is used to automatically exchange keys between two IPsec hosts.  A VPN tunnel requires a IKE policy and corresponding VPN policy.  You can create IKE policies to define the security parameters such as authentication of the peer, encryption algorithms, and so on to be used for the VPN tunnel. You can use the VPN wizard to quickly create both IKE and VPN policies.  Once the IKE or VPN policy is created, you can modify it as required.');
insert into StringsMap values('20211','This section allows you to add/edit/delete VPN policies.');
insert into StringsMap values('20212','A VPN tunnel requires a IKE policy and corresponding VPN policy.  The VPN policy is one half of the IKE/VPN policy pair required to establish a VPN tunnel.  The IP addresses of the machine or machines on the two VPN endpoints are configured here, along with the policy parameters required to secure the tunnel. You can use the VPN wizard to quickly create both IKE and VPN policies.  Once the IKE or VPN policy is created, you can modify it as required.');
insert into StringsMap values('20213','This page shows the list of configured IPsec VPN policies on the router. A user can also add, delete, edit, enable and disable IPsec VPN policies from this page.');
insert into StringsMap values('20214','An IPsec VPN can be established over the internet by configuring the appropriate policy here. You need to have matching parameters for both the connecting peers. Some important parameters (Type of the connection, Encryption algorithms used in communication  etc.) are displayed here.');
insert into StringsMap values('20215','This page allows you to define the IP address range for clients connecting using Mode Config.');
insert into StringsMap values('20216','Mode Config is an Internet Key Exchange (IKE) extension that enables the IPSec VPN gateway to provide LAN configuration to the remote user''s machine (i.e. IPSec VPN Client).');
insert into StringsMap values('20217','This page allows a user to add Split DNS FQDN');
insert into StringsMap values('20218','PPTP allows an external user to connect to your router through the internet. This section allows you to enable/disable PPTP server and define a range of IP addresses for clients connecting to your router. The connected clients can function as if they are on your LAN (they can communicate with LAN hosts, access any servers present etc.)');
insert into StringsMap values('20219','A PPTP VPN can be established through this router.  If the PPTP ISP is configured, then LAN hosts on this router can connect to the PPTP server. The router acts as a broker device to allow the ISP''s PPTP server to create a TCP control connection between the LAN VPN client and the VPN server. TCP port 1723 is opened for this VPN connection. The PPTP server will indicate the range of IP addresses to assign to LAN side VPN clients.');
insert into StringsMap values('20220','This page displays all the users currently connected to your PPTP server.');
insert into StringsMap values('20221','Active PPTP tunnels connections are listed here, as LAN VPN clients are active PPTP users.');
insert into StringsMap values('20222','L2TP allows an external user to connect to your router through the internet, forming a VPN. This section allows you to enable/disable L2TP server and define a range of IP addresses for clients connecting to your router. The connected clients can function as if they are on your LAN (they can communicate with LAN hosts, access any servers present etc.)');
insert into StringsMap values('20223','A L2TP VPN can be established through this router.  If the L2TP ISP is configured, then LAN hosts on this router can connect directly to the ISP''s L2TP server.  The router acts as a broker device to allow the ISP''s L2TP server to create a tunnel between the LAN VPN client and the VPN server.  The L2TP server will indicate the range of IP addresses to assign to LAN side VPN clients.');
insert into StringsMap values('20224','This page displays all the users currently connected to your L2TP server.');
insert into StringsMap values('20225','Active L2TP tunnels connections are listed here, as LAN VPN clients are active L2TP users.');
insert into StringsMap values('20226','This page allows you to create a new AP or edit the configuration of an existing AP.  The details will then be displayed in the AP table on the Wireless > Access Points page.');
insert into StringsMap values('20227','Do you know that at a time DSR can support upto four Access Points.');
insert into StringsMap values('20228','This page allows you to define the IP address range for clients connecting using DHCP over IPsec. Note: To support DHCP over IPsec, enable DHCP server on the LAN.');
insert into StringsMap values('20229','Using DHCP over IPsec, external IPsec clients can form a VPN to your router and function as if they are present on your LAN (they can communicate with LAN hosts, access any servers present etc.). Create an IPsec policy with ''Enable DHCP'' checkbox ticked for allowing a client to connect using DHCP over IPsec. The connecting clients get IP addresses from the range mentioned here.');
insert into StringsMap values('20230','This page allows you to configure Intel<sup>&reg;</sup> AMT service.');
insert into StringsMap values('20231','Enabling the Intel<sup>&reg;</sup> AMT service results in addition of appropriate inbound/outbound firewall rules for Intel<sup>&reg;</sup> AMT ports, VNC port and SNMP trap port. Among all the firewall rules, Intel<sup>&reg;</sup> AMT rules have the highest precedence. Enabling the Intel<sup>&reg;</sup> Amt Reflector will result in server listening on selected ports for incoming connections.');
insert into StringsMap values('20232','Openvpn provides authentication using certificates. This page allows you to upload required certificates and keys.');
insert into StringsMap values('20233','The CA Certificate, Server Certificate, Server Key and DH Key are must for running Openvpn server. For running OpenVPN client, CA Certificate, Client Certificate and Client Key are must. No need of DH Key in case of client. Tls Authentication Key is optional(for both server and client) which provides an additional layer of authentication. Since the set of certificates for server and client are different, user has to re-upload the corresponding certificates when there is a change in OpenVPN mode.');
insert into StringsMap values('20234','This page shows the list of configured OpenVPN LAN networks. Clients have access to only these local networks. The user can also add, delete and edit networks from this page.');
insert into StringsMap values('20235','For split tunnel, these client networks must be configured to direct the OpenVPN clients to a LAN resource.');
insert into StringsMap values('20236','This page allows the user to add/edit a local network and netmask which allows the OpenVPN clients to access this LAN resource.');
insert into StringsMap values('20237','Enter Network and Subnet Mask of the network and save settings. OpenVpnLocalNetworks page will be displayed where you can add new networks and edit/delete existing ones.');
insert into StringsMap values('20238','This page shows the list of remote VPN networks.The user can also add, delete and edit networks from this page.');
insert into StringsMap values('20239','For a site to site tunnel, these remote networks must be configured to direct the other clients to these networks.');
insert into StringsMap values('20240','This page allows the user to add/edit a remote network and netmask which allows the other OpenVPN clients to reach this network.');
insert into StringsMap values('20241','Enter Remote Network and Subnet Mask of the network and save settings. OpenVPNRemoteNetworks page will be displayed, where you can add new networks and edit/delete existing ones.');
insert into StringsMap values('20242','OpenVPN configuration page allows the user to configure OpenVPN as a server or client.');
insert into StringsMap values('20243','A VPN can be established using OpenVPN in this router. If OpenVPN is configured as a server, the clients can connect and function as if they are on your LAN(they can communicate with LAN hosts). If it is configured as a client, this router will establish a site to site tunnel with the OpenVPN server.');
insert into StringsMap values('20244','This page allows the user to configure PPTP VPN Client');
insert into StringsMap values('20245','PPTP VPN Client can be configured on this router. Using this client we can access remote network which is local to PPTP server.');
insert into StringsMap values('20246','This page allows you to configure the Wireless Distribution System (WDS) configuration parameters.');
insert into StringsMap values('20247','The Wireless Distribution System (WDS) is a feature which can allow wireless AP-to-AP connectivity between two devices without the requirement for a wired backbone to link them. A max of 4 WDS peers can be configured in any given mode.');
insert into StringsMap values('20248','The table lists the login profiles configured for this device and allows several operations on the login profiles.');
insert into StringsMap values('20249','The router allows you to create a custom login profile for SSL VPN portals which customizes the look of portal login page.');
insert into StringsMap values('20250','This page allows you to add/edit a login profile and save changes.');
insert into StringsMap values('20251','The router allows you to design a custom login profile for SSL VPN portals which customizes the look of portal login page. You can choose custom title image, back ground colors, title texts, etc.');
insert into StringsMap values('20252','The table lists the SSL portal layouts configured for this device and allows several operations on the portal layouts.');
insert into StringsMap values('20253','The router allows you to create a custom page for remote SSL VPN users that is presented upon authentication.  Login instructions, available services, and other usage details that are specific to a domain are useful to present on the authentication portal.  Portals are assigned to the user domain.');
insert into StringsMap values('20254','Policies are useful to permit or deny access to specific network resources, IP addresses, or IP networks. They may be defined at the user, group or global level. By Default, a global PERMIT policy (not displayed) was already configured over all addresses and over all services/ports.');
insert into StringsMap values('20255','SSL VPN Policies can be created on a Global, Group, or User level.  These policies can be applied to a specific network resource, IP address or ranges on the LAN, or to different SSL VPN services supported by the router. A more specific policy takes precedence over a generic policy when both are applied to the same user/group/global domain.  I.e. a policy for a specific IP address takes precedence over a policy for a range of addresses containing the IP address already referenced.');
insert into StringsMap values('20256','You can configure resources to use when configuring SSL VPN policies. Resources are groups of host names, IP addresses, or IP networks. The table lists the resources that have been added and allows several operations on the resources.');
insert into StringsMap values('20257','Network resources are services or groups of LAN IP addresses that are used to easily create and configure SSL VPN policies.  This shortcut saves time when creating similar policies for multiple remote SSL VPN users.');
insert into StringsMap values('20258','The Port Forwarding page allows you to detect and re-route data sent from remote users to the SSL VPN gateway to predefined applications running on private networks.');
insert into StringsMap values('20259','Port forwarding allows remote SSL users to access specified network applications or services after they login to the User Portal and launch the Port Forwarding service. Traffic from the remote user to the router is detected and re-routed based on configured port forwarding rules. Port forwarding requires the identification of the TCP application and local server IP address that is being made accessible to remote users.');
insert into StringsMap values('20260','This page allows user to enable/disable SSLVPN functionality on the router.');
insert into StringsMap values('20261','This SSLVPN Enable feature enables WAN users to use SSLVPN functionality.');
insert into StringsMap values('20262','An SSL VPN tunnel client provides a point-to-point connection between the browser-side machine and this device. When a SSL VPN client is launched from the user portal, a ''network adapter'' with an IP address, DNS and WINS settings is automatically created, which allows local applications to talk to services on the private network without any special network configuration on the remote SSL VPN client machine.');
insert into StringsMap values('20263','An SSL VPN tunnel client provides a point-to-point connection between the browser-side machine and this router. When a SSL VPN client is launched from the user portal, a ''network adapter'' with an IP address from the corporate subnet, DNS and WINS settings is automatically created. The IP addresses of the client''s network interfaces (Ethernet, Wireless, etc.) cannot be identical to the router''s IP address or a server on the corporate LAN that is being accessed through the SSL VPN tunnel.');
insert into StringsMap values('20264','The Configured Client Routes entries are the routing entries which will be added by the SSL VPN Client such that only traffic to these destination addresses is redirected through the SSL VPN tunnels, and all other traffic is redirected using the hosts (SSL VPN Clients) native network interface. The table shows the destination routes that will be configured on the SSL VPN client. For example if the SSL VPN Client wishes to access the LAN network then in SPLIT Tunnel mode you should add the LAN subnet as the destination subnet on this device.');
insert into StringsMap values('20265','For split tunnel SSL VPN client support, client routes must be configured to direct the SSL VPN client to a LAN resource.');
insert into StringsMap values('20266','This page displays information about the USB devices connected to the USB port(s). This page also allows user to do certain configurations on USB devices, such as safely unmounting the devices.');
insert into StringsMap values('20267','Do you know that this page will update dynamically to show the status of the USB devices connected to the router. It is also recommended to use the ''Safely Remove'' button to safely remove the hardware before pulling it out of the router.');
insert into StringsMap values('20268','This page allows the user to configure the SharePort feature available in the router.');
insert into StringsMap values('20269','The USB storage devices and USB printers connected to this router can be shared accross the network and can be accessed from any host connected to the network.');
insert into StringsMap values('20270','This page allows the users to check received messages in the Inbox and also to create new messages.');
insert into StringsMap values('20271','This Page displays all received messages and also allows users to create messages. If WAN3 is used in the dedicated wan mode, load balancing mode or if 3G USB Device is not connected to router then the controls on this page are greyed out.');
insert into StringsMap values('20272','This page will allow users to check the Inbox for received messages, delete a particular SMS, reply to a SMS or forward a particular message.');
insert into StringsMap values('20273','This Page will show the all the received messages in the Inbox as table. It also allows users to delete a particular SMS,reply to a particular message, forward a particular SMS and refresh the page in order to update the inbox.');
insert into StringsMap values('20274','This page will allow users to create a new SMS and send it to a particular number.');
insert into StringsMap values('20275','Use this page to send a SMS to a particular phone number.');
insert into StringsMap values('20276','This page allows user to enable/disable VLAN functionality on the router.');
insert into StringsMap values('20277','The router supports virtual network isolation on the LAN with the use of VLANs. LAN devices can be configured to communicate in a subnetwork defined by VLAN identifiers.');
insert into StringsMap values('20278','This page allows user to configure the port VLANs. A user can choose ports and can add them into a VLAN.');
insert into StringsMap values('20279','In order to tag all traffic through a specific LAN port with a VLAN ID, you can associate a VLAN to a physical port.  The VLAN Port table displays the port identifier, the mode setting for that port and VLAN membership information.  Go to the Available VLAN page to configure a VLAN membership that can then be associated with a port');
insert into StringsMap values('20280','This page shows a list of available multi-vlan subnets. User can even edit the multi-vlans from this page.');
insert into StringsMap values('20281','Each VLAN can be assigned a unique IP address and subnet mask for the virtually isolated network.  Unless inter-VLAN routing is enabled, the VLAN subnet will determine the network addresses on the LAN that can communicate to devices that correspond to this VLAN.');
insert into StringsMap values('20282','This page shows a list of available VLANs which a user can edit or delete. A user can add a new VLAN from this page as well.');
insert into StringsMap values('20283','A VLAN membership must be configured in order to be assigned to a port.  A VLAN membership entry consists of a VLAN identifier and the numerical VLAN ID which is assigned to the VLAN membership. The VLAN ID value can be any number from 2 to 4093.');
insert into StringsMap values('20284','This page allows user to configure a PPPoE profile. This profile can then be attached to a WAN to make a PPPoE connection with the ISP.');
insert into StringsMap values('20285','If you are unsure about the Authentication Type, then keep it as ''Auto-negotiate''. Also you can configure some idle timeout value to disconnect the PPPoE connection automatically, if you are not using Internet.');
insert into StringsMap values('20286','This page allows user to configure the port VLAN.');
insert into StringsMap values('20287','The VLAN mode is an important setting to determine how VLAN traffic is passed through the router. In Access mode the port is a member of a single VLAN (and only one).  In Trunk mode all data going into and out of the port is tagged, and untagged coming into the port is not forwarded, except for the default VLAN with PVID=1, which is untagged.   In General mode, the port sends and receives data that is tagged or untagged with a VLAN ID.');
insert into StringsMap values('20288','This page allows user to configure a manual VPN (IPsec) policy.');
insert into StringsMap values('20289','Help content goes here...');
insert into StringsMap values('20290','This page allows user to add/edit VPN (IPsec) policies which includes Auto and Manual policies.');
insert into StringsMap values('20291','Use Tunnel mode if you require communication to be secured between networks. Transport mode can be used if the requirement is to have secure communication between 2 hosts. Use Manual Policy parameters if you wish to specify the keys to be used for encryption/decryption (during communication). This is for advanced users who require more control over IPsec tunnel communication. For normal users, Auto Policy would do just fine. Enable Rollover only if the Port Mode is ''Auto-Rollover'' in WAN MODE settings page. The active WAN will be used for setting up the tunnel, thus providing an uninterrupted VPN connection. Enable DHCP over IPsec checkbox to allow external users to form a VPN to DSR-1000N. Multiple users can connect as well.');
insert into StringsMap values('20292','This page allows user to export VPN (IPsec) policies which includes Auto and Manual policies.');
insert into StringsMap values('20293','Use export policy option to export IPsec VPN policy to local host.User can import this policy in any remote DSR and edit policy parameters according to remote DSR requirements.');
insert into StringsMap values('20294','This page allows user to configure reserved IP Addresses for the DHCP server.');
insert into StringsMap values('20295','If you reserve an IP Address for a particular MAC Address, DSR will ensure that your MAC Address gets same IP Address everytime it asks for a lease.');
insert into StringsMap values('20296','This page allows user to configure a IKE policy.');
insert into StringsMap values('20297','This page allows you to add a new portal layout or edit the configuration of an existing portal layout.  The details will then be displayed in the List of Portal Layouts table on the SSL VPN Server> Portal Layouts page under the VPN menu.');
insert into StringsMap values('20298','When remote users want to access the private network through an SSL tunnel (either using the Port Forwarding or VPN tunnel service), they login through the Client Portal.  This portal provides the authentication fields to provide the appropriate access levels and privileges as determined by the router.');
insert into StringsMap values('20299','This page allows you to add a new SSL VPN Policy or edit the configuration of an existing SSL VPN Policy.');
insert into StringsMap values('20300','This page allows you to make policies for SSLVPN users/groups. You can permit/deny access to certain network resources for certain users/groups.');
insert into StringsMap values('20301','This page allows you to configure applicationServer(s)/network of applicationServer(s) as a resourceObject and hence associates them to a resource. The configured resourceObjects are listed in the ''Defined Resource Addresses'' section. A resource is effective for a sslvpn-policy, only if atleast one resourceObject is configured for that resource.');
insert into StringsMap values('20302','This page allows you to configure a Resource and associate a specific service with the resource. The details will then be displayed in the List of Resources table.');
insert into StringsMap values('20303','Enter the Resource Name and select the Service and save the settings. You will be displayed the ''List of Resources'' table where you can further configure/delete the Resource.');
insert into StringsMap values('20304','This page allows you to add a new application for Port Forwarding or edit the configuration of an existing application.  The details will then be displayed in the List of Configured Applications for Port Forwarding table.');
insert into StringsMap values('20305','Enter the Local Server IP Address and TCP Port Number and save the settings. You will be displayed the ''List of Configured Applications for Port Forwarding'' table where you can further delete existing entry(s) or add new entry(s).');
insert into StringsMap values('20306','This page allows you to add a new Host Name for Port Forwarding or edit the configuration of an existing Host Name.');
insert into StringsMap values('20307','Enter the Local Server IP Address and Fully Qualified Domain Name and save the settings. You will be displayed the ''List of Configured Host Names for Port Forwarding'' table where you can further delete existing entry(s) or add new entry(s).');
insert into StringsMap values('20308','The Configured Client Routes entries are the routing entries which will be added by the SSL VPN Client such that only traffic to these destination addresses is redirected through the SSL VPN tunnels. All other traffic is redirected using the native network interface of the hosts (SSL VPN Clients). For example if the SSL VPN Client wishes to access the LAN network, then in SPLIT Tunnel mode you should add the LAN subnet as the Destination Network.');
insert into StringsMap values('20309','Enter the Destination Network and the Subnet Mask for the network and save the settings. You will be displayed the ''Configured Client Routes'' table where you can further add new routes/delete existing ones.');
insert into StringsMap values('20310','This page shows the list of available multiple VLAN subnets.');
insert into StringsMap values('20311','By default, when you add a new VLAN, it is assigned an IP address of 192.168.2.1 with subnet-mask 255.255.255.0, the next added one is assigned 192.168.3.1 and so on. You can change the assigned IP address, subnet mask and many other options here. The only non-editable field in VLAN ID.');
insert into StringsMap values('20312','This page allows user to enable/disable VLAN support on the LAN.');
insert into StringsMap values('20313','Enter Name and ID and save the settings. Make sure that the ID provided is unique. Once the settings are saved, you will be shown the List of Available VLANs where you can further add new VLAN(s) or edit/delete existing VLAN(s).');
insert into StringsMap values('20314','Use this section to allow/block the access of certain devices (using their MAC addresses) to the Access Point that is being configured. Note that by default, all devices are allowed access.');
insert into StringsMap values('20315','Wireless traffic statistics for the selected AP are displayed in this table.  The receive (rx) and transmit (tx) data is shown. <br>');
insert into StringsMap values('20316','To change the default Poll Interval (which is 10), press ''Stop'' button, then edit the value in the text box and then press ''Start'' button to reflect the latest value.');
insert into StringsMap values('20317','This page allows you to define a policy that permits or denies connections to the selected AP based on the MAC address of a client.  The default is Open access, which does no filtering on the specified MAC addresses.');
insert into StringsMap values('20318','The maximum number of MAC addresses that you can add (and hence monitor) is <b>25</b>');
insert into StringsMap values('20319','The Profile Configuration page allows you to set or modify the network identifiers and wireless settings of a particular wireless profile.  Profiles can be applied to more than once access point if needed.<br>');
insert into StringsMap values('20320','For more security please use WPA and WPA2 Security Modes along with disabling SSID broadcast.');
insert into StringsMap values('20321','This page shows the access control list and also allows user to add new access control rules.');
insert into StringsMap values('20322','This page displays the current settings and displays a snapshot of the system information.');
insert into StringsMap values('20323','All of your Internet and network connection details are displayed on the Device Status page. The firmware version and hardware serial number is also displayed here.');
insert into StringsMap values('20324','This page displays the resources being used in the system currently. This page also shows the bandwidth used in form of bar graphs.');
insert into StringsMap values('20325','The hardware resources (CPU and memory) are profiled here and packet traffic through the router is displayed for each interface.');
insert into StringsMap values('20326','All your system log will be shown here.');
insert into StringsMap values('20327','This page displays the captured log messages of the router activities.  The logs displayed on this event viewer can be defined in the Log Configuration page of the Log Settings menu.');
insert into StringsMap values('20328','This page shows the VPN (IPSEC) related log.');
insert into StringsMap values('20329','This page displays the captured log messages specifically for IPsec events.  The logs displayed on this event viewer can be defined in the Log Configuration page of the Log Settings menu.');
insert into StringsMap values('20330','This page shows the VPN (SSLVPN) related log.');
insert into StringsMap values('20331','This page displays the captured log messages specifically for SSLVPN events.');
insert into StringsMap values('20332','This page shows the Rx/Tx packet and byte count for all the system interfaces. It also shows the up time for all the interfaces.');
insert into StringsMap values('20333','Use this page to check the wired interface statistics of your router.  This covers the LAN, VLAN, dedicated WAN, and configurable port (WAN or DMZ) ports of the router.');
insert into StringsMap values('20334','Wireless traffic statistics for all configured access points are displayed in this table.  The receive (Rx) and transmit (Tx) data is shown per configured AP.');
insert into StringsMap values('20335','Use this page to check the wireless access point statistics of your router.');
insert into StringsMap values('20336','This page displays a list of active sessions on your router.');
insert into StringsMap values('20337','Use this page to monitor the sessions that are active on your router.');
insert into StringsMap values('20338','This list identifies the wireless clients (or stations) currently connected to the Access Points configured and enabled on this device.');
insert into StringsMap values('20339','Displays the list of current wireless clients connected each enabled AP.');
insert into StringsMap values('20340','This page displays a list of LAN clients connected to the router.');
insert into StringsMap values('20341','Displays the current wired clients connected to the router through the LAN interface.');
insert into StringsMap values('20342','This page displays the active VPN connections, IPSEC, SSL, PPTP and L2TP.');
insert into StringsMap values('20343','This page displays the active IPSEC VPN connections.');
insert into StringsMap values('20344','This page lists current established IPsec Security Associations, SSL VPN tunnels, PPTP VPN Client and L2TP VPN Client connections.');
insert into StringsMap values('20345','This page lists current established IPsec Security Associations.');
insert into StringsMap values('20346','This page allows user to set the router identification name.');
insert into StringsMap values('20347','The System Name identifies the router for node identification and remote logging.');
insert into StringsMap values('20348','From this page a user can configure the remote management feature. This feature can be used to manage the box remotely from WAN side.');
insert into StringsMap values('20349','HTTPS and SSH access can be restricted to a subset of IP addresses.  Administrator and Guest users are permitted to login to the GUI, and User Login Policies will allow remote management over HTTPS to take place as configured.');
insert into StringsMap values('20350','Simple Network Management Protocol (SNMP) lets you monitor and manage your router from an SNMP manager. SNMP provides a remote means to monitor and control network devices, and to manage configurations, statistics collection, performance, and security.');
insert into StringsMap values('20351','SNMP is useful when multiple routers in a network are being managed by a central Master system.  When an external SNMP manager is provided with this router''s Management Information Base (MIB) file, the manager can update the router''s hierarchal variables to view or update configuration parameters.');
insert into StringsMap values('20352','This page displays the current SNMP configuration of the router. The following MIB (Management Information Base) fields are displayed and can be modified here.');
insert into StringsMap values('20353','The router is identified by an SNMP manager via the System Information.  The identifier settings The SysName set here is also used to identify the router for SysLog logging.');
insert into StringsMap values('20354','This page allows us to set the date, time and NTP servers. Network Time Protocol (NTP) is a protocol that is used to synchronize computer clock time in a network of computers.  Accurate time across a network is important for many reasons.');
insert into StringsMap values('20355','If the router has access to the internet, the most accurate mechanism to set the router time is to enable NTP server communication.  Otherwise use the router''s RTC and configure the time and time zone manually. Accurate date and time on the router is critical for firewall schedules, Wi-Fi power saving support to disable APs at certain times of the day, and accurate logging.');
insert into StringsMap values('20356','This page allows user to configure logging severity levels for different logging facilities.');
insert into StringsMap values('20357','In order to configure a logging facility, first select the facility and then press ''Display'' button.');
insert into StringsMap values('20358','This page allows user to configure system wide log settings.');
insert into StringsMap values('20359','Traffic through each network segment (LAN, WAN, DMZ) can be tracked based on whether the packet was accepted or dropped by the firewall.  Denial of service attacks, general attack information, login attempts, dropped packets, and similar events can be captured for review by the IT administrator.');
insert into StringsMap values('20360','This page allows user to configure the remote logging options for the router.');
insert into StringsMap values('20361','Configured logs can be sent to either a Syslog server or an E-Mail address.  For remote logging a key configuration field is the Remote Log Identifier, which is the prefix for every remote logged message.');
insert into StringsMap values('20362','This page allows user to configure log settings for IPv6 network.');
insert into StringsMap values('20363','Traffic through each network segment (LAN, WAN) can be tracked based on whether the packet was accepted or dropped by the firewall.  Denial of service attacks, general attack information, login attempts, dropped packets, and similar events can be captured for review by the IT administrator.');
insert into StringsMap values('20364','This page allows user to do configuration related operations which includes backup, restore and factory default. This page also allows user to reboot the router.');
insert into StringsMap values('20365','You can back up the router''s custom configuration settings to restore them to a different device or the same router after some other changes.  Be very careful when reverting to factory default settings, as you will loose the router''s custom configuration after this operation.');
insert into StringsMap values('20366','This page allows user to upgrade/downgrade the router firmware. This page also shows the information regarding firmware version and build time.');
insert into StringsMap values('20367','The router''s firmware can be upgraded here, and the current version is displayed on this page.  Another useful feature is to check online for newer versions of firmware, which will update the status field.');
insert into StringsMap values('20368','This page allows user to upgrade the firmware, backup and restore the settings using a USB storage key.');
insert into StringsMap values('20369','Make sure that USB storage key is connected to the router. You can check the device status on ''Setup -> USB Settings'' page. Please unmount the device before removing it from the router.');
insert into StringsMap values('20370','Dynamic DNS (DDNS) is an Internet service that allows routers with varying public IP addresses to be located using Internet domain names. To use DDNS, you must setup an account with a DDNS provider such as DynDNS.com, DlinkDDNS.com or Oray.net.');
insert into StringsMap values('20371','You can configure separate domain names for each of your WANs. The current WAN Mode is also displayed. Check this to see which WAN(s) are currently active.');
insert into StringsMap values('20372','This page can be used for diagnostics purpose. This page provides user with some diagnostic tools like ping, traceroute and packet sniffer.');
insert into StringsMap values('20373','The router has built in tools to allow an administrator to evaluate the communication status and overall network health.  Ping and Trace Route are two of the most frequently used tools to evaluate internet speed and connectivity.');
insert into StringsMap values('20374','When you create a firewall rule, you can specify a schedule when the rule applies. The table lists all the Available Schedules for this device and allows several operations on the Schedules.');
insert into StringsMap values('20375','Schedules are a very useful feature to allow firewall rules to be enabled or disabled based on the time of day or day of the week.  Configured schedules will be available to select in the firewall rule configuration page.   All schedules will follow the time in the routers configured time zone.');
insert into StringsMap values('20376','This page allows user to do packet sniffing on a specified interface.');
insert into StringsMap values('20377','Do you know that the captured file can be analysed by opening it into a packet capture program like ''Wireshark''.');
insert into StringsMap values('20378','This page allows user to configure the SNMP traps. User can specify the IP Address, Port, Community for a specified SNMP protocol version.');
insert into StringsMap values('20379','SNMP traps can be used for receiving system wide important notifications using into a SNMP MIB browser.');
insert into StringsMap values('20380','This page allows user to configure SNMPv3 user''s security configuration parameters.');
insert into StringsMap values('20381','Please use ''AuthPriv'' Security Level for more security.');
insert into StringsMap values('20382','This page allows user to add SNMP access control list. This list can be used to access the router using a SNMP browser.');
insert into StringsMap values('20383','If you want to give a global access, please use a subnet mask of ''0.0.0.0'' and if you want to restrict to a single machine, use a subnet mask of ''255.255.255.255'' ');
insert into StringsMap values('20384','This page displays the output of the diagnostic command which user runs.');
insert into StringsMap values('20385','Do you know there are certain other diagnostics commands available on ''Tools->System Check'' page.');
insert into StringsMap values('20386','This page allows user to configure schedules. These schedules then can be applied to firewall rules to achieve schedule based firewall.');
insert into StringsMap values('20387','Schedules are a very useful feature to allow firewall rules to be enabled or disabled based on the time of day or day of the week. Configured schedules will be available to select in the firewall rule configuration page. All schedules will follow the time in the routers configured time zone.');
insert into StringsMap values('20388','This page allows you to configure the WDS peers for the device.');
insert into StringsMap values('20389','The Wireless Distribution System (WDS) is a feature which can allow wireless AP-to-AP connectivity between two devices without the requirement for a wired backbone to link them. A max of 4 WDS peers can be configured in any given mode.');
insert into StringsMap values('20390','Please select at least one Encryption Algorithm');
insert into StringsMap values('20391','Please select at least one Authentication Algorithm');
insert into StringsMap values('20392','Please select at least one Phase2 Encryption Algorithm');
insert into StringsMap values('20393','Please select at least one Phase2 Integrity Algorithm');
insert into StringsMap values('20394','NONE can not be selected along with other algorithms while selecting Encryption algorithms');
insert into StringsMap values('20395','NONE can not be selected along with other algorithms while selecting Integrity algorithms');
insert into StringsMap values('20396','The RU firmware is NOT available to be installed in Non-Russian version machine, please use correct firmware version for your devices.');
insert into StringsMap values('20397','List of Device Drivers');
insert into StringsMap values('20398','Driver');
insert into StringsMap values('20399','Installed');
insert into StringsMap values('20400','Driver for your device not listed? <a href=''platform.cgi?thispage=drivers.htm&button.update.drivers=Update''>click here</a> to see if updates or new drivers are available.');
insert into StringsMap values('20401','Manual Install');
insert into StringsMap values('20402','Select Driver');
insert into StringsMap values('20403','Install History');
insert into StringsMap values('20404','Device Drivers');
insert into StringsMap values('20405','Install');
insert into StringsMap values('20406','Remove');
insert into StringsMap values('20407','Update to');
insert into StringsMap values('20408',' at position ');
insert into StringsMap values('20409','Please enter at least one port value');
insert into StringsMap values('20410','option1');
insert into StringsMap values('20411','This page shows the list of available drivers. User can install or uninstall the drivers.');
insert into StringsMap values('20412','All the drivers available for update are listed here. User can also update the drivers manually by uploading the package.');
insert into StringsMap values('20413','This page allows you to add resource objects to a resource. You can add multiple resource objects to a resource and create an SSLVPN policy for that resource.');
insert into StringsMap values('20414','Openvpn provides authentication using certificates. This page allows you to upload required certificates and keys which are in pem format.');
insert into StringsMap values('20415','The CA Certificate, Server Certificate, Server Key and DH Key are must for running Openvpn server. For running OpenVPN client, CA Certificate, Client Certificate and Client Key are must. No need of DH Key in case of client. Tls Authentication Key is optional(for both server and client) which provides an additional layer of authentication. Since the set of certificates for server and client are different, user has to re-upload the corresponding certificates when there is a change in OpenVPN mode. All the certificates and keys should be in .pem format which openvpn supports.');
insert into StringsMap values('20416','Physical Setting');
insert into StringsMap values('20417','Please Login!!');
insert into StringsMap values('20418','Authentication Details');
insert into StringsMap values('20419','Enter User Details');
insert into StringsMap values('20420','Hi this is sample content. Enter Ad details in this area');
insert into StringsMap values('20421','This page shows a list of available profiles for LDAP mode of authentication in the system. A user can add, delete and edit the profiles also.');
insert into StringsMap values('20422','The user can use this page to view list of all profiles under LDAP mode of authentication. Profiles can be added, edited and deleted.');
insert into StringsMap values('20423','This page allows a user to configure authentication servers for LDAP authentication.');
insert into StringsMap values('20424','The user can configure authentication servers for LDAP authentication. He has to supply details like authentication server IP addresses, LDAP Attributes, LDAP Base DN, server retries and timeout value.');
insert into StringsMap values('20425','This page allow to configure Active Directory authentication servers.');
insert into StringsMap values('20426','The user can configure authentication server address, active directory domain , timout and number of retries.');
insert into StringsMap values('20427','This page allows a user to create new profiles under Active Directory mode of authentication. The user can also edit existing profiles here.');
insert into StringsMap values('20428','The user can create new profiles under Active Directory mode of authentication. He has to supply details like authentication server IP addresses, Active Directory Domains,server retries and timeout values to configure a profile.');
insert into StringsMap values('20429','This page shows a list of available profiles for NT Domain mode of authentication in the system. A user can add, delete and edit the profiles also.');
insert into StringsMap values('20430','The user can use this page to view list of all profiles under NT Domain mode of authentication. Profiles can be added, edited and deleted.');
insert into StringsMap values('20431','This page allows a user to create new profiles under NT Domain mode of authentication. The user can also edit existing profiles here.');
insert into StringsMap values('20432','The user can create new profiles under NT Domain mode of authentication. He has to supply details like authentication server IP addresses, Workgroups,server retries and timeout values to configure a profile.');
insert into StringsMap values('20433','This page shows a list of available profiles for RADIUS mode of authentication in the system. A user can add, delete and edit the profiles also. He can select and enable a particular profile.');
insert into StringsMap values('20434','The user can select a particular profile and enable it. The server details in the enabled profile will be used for authenticating Wireless clients, Captive Portal users, L2TP/PPTP users, IPSec Extended Authentication if RADIUS authentication is configured for them. An enabled profile cannot be deleted by the user.');
insert into StringsMap values('20435','This page configures the RADIUS servers to be used for authentication. A RADIUS server maintains a database of user accounts used in larger environments. If a RADIUS server is configured in the LAN, it can be used for authenticating users that want to connect to the wireless network provided by this device. If the first or primary RADIUS server is not accessible at any time, then the device will attempt to contact the secondary RADIUS server for user authentication.');
insert into StringsMap values('20436','The RADIUS server is an external authentication server that can be used to associate wireless clients to an AP using RADIUS authentication. This authentication is also referred to as Enterprise mode, and is available for WPA or WPA2 security.');
insert into StringsMap values('20437','CA file(s) successfully deleted');
insert into StringsMap values('20438','CA file(s) deletion failed');
insert into StringsMap values('20439','CA File size is too large');
insert into StringsMap values('20440','CA file successfully uploaded');
insert into StringsMap values('20441','CA file upload failed');
insert into StringsMap values('20442','Authentication Failed, Network Unreachable');
insert into StringsMap values('20443','Invalid UserName or Password');
insert into StringsMap values('20444','This page allows the user to configure L2TP VPN Client.');
insert into StringsMap values('20445','L2TP VPN Client can be configured on this router. Using this client we can access remote network which is local to L2TP server over and above internet connectivity.');
insert into StringsMap values('20446','This page allow user to configure pop3 authentication servers.');
insert into StringsMap values('20447','If SSL support is enabled than it is mandatory to select a certificate authority.');
insert into StringsMap values('20448','This page shows the list of POP3 CA Files.');
insert into StringsMap values('20449','User can add and delete CA Files here.');
insert into StringsMap values('20450','This page allow you to upload a CA File.');
insert into StringsMap values('20451','Browse a CA File and click Upload to upload a CA File.');
insert into StringsMap values('20452','Maximum Entries are added.');
insert into StringsMap values('20453','Entries not found in DhcpFixedIpAddress table.');
insert into StringsMap values('20454','Device not found".');
insert into StringsMap values('20455','Unable to display the result.');
insert into StringsMap values('20456','Background Image');
insert into StringsMap values('20457',' to upload');
insert into StringsMap values('20458','Locate & select the ');
insert into StringsMap values('20459','Captive Portal ');
insert into StringsMap values('20460','Here Backround Images can be uploaded for Captive Portal Login Page.');
insert into StringsMap values('20461','The Images Uploaded here can be used as Background Images in Captive Portal Login Page.');
insert into StringsMap values('20462','Upgrade Version is Installed,please Remove Upgraded Driver to Install new Driver');
insert into StringsMap values('20463','List of Default Drivers');
insert into StringsMap values('20464','System is not supporting for This Driver');
insert into StringsMap values('20465','Page Background');
insert into StringsMap values('20466','Bridge');
insert into StringsMap values('20467','Enabling ''Bridge'' will revert all DMZ and inbound firewall settings to defaults.');
insert into StringsMap values('20468','Are you sure you want to enable ''Bridge''?');
insert into StringsMap values('20469','Bridge Mode Setup');
insert into StringsMap values('20470','Bridge Interface Ip Address');
insert into StringsMap values('20471','DMZ interface Ip Address');
insert into StringsMap values('20472','This page shows a list of available billing profiles for temporary CaptivePortal Users. We can add, delete and edit the profiles');
insert into StringsMap values('20473','Frontdesk User uses billing profiles created here to generate user for respective profiles. All configured properties of the profile will be applied to user created.Using this page we can add/edit/delete billing profiles.');
insert into StringsMap values('20474','This page allows us to create new billing profile for temporary Captive Portal user');
insert into StringsMap values('20475','Frontdesk User uses billing profiles created here to generate user for respective profiles. All configured properties of the profile will be applied to user created.Using this page we can add/edit/delete billing profiles');
insert into StringsMap values('20476','Service Level Agreement are the set of rules temporary Captive Portal user needs to accept before accessing internet or other services.This page is used to help admin set SLA rules');
insert into StringsMap values('20477','Service Level Agreement are the set of rules temporary Captive Portal user needs to accept before accessing internet or other services.This page displays the set of rules configured by admin.Admin can edit/change them using Edit button');
insert into StringsMap values('20478','Service Level Agreement are the set of rules temporary Captive Portal user needs to accept before accessing internet or other services.This page is used to help admin set SLA rules');
insert into StringsMap values('20479','Service Level Agreement are the set of rules temporary Captive Portal user needs to accept before accessing internet or other services.This page is used by admin to edit/change SLA rules');
insert into StringsMap values('20480','This page shows a list of clients MAC addresses blocked by admin');
insert into StringsMap values('20481','Adding MAC adding to the list will result in denying access to the clients having these MAC address');
insert into StringsMap values('20482','This page allows admin to add MAC addresses of the clients whom he wish to deny access');
insert into StringsMap values('20483','Adding MAC adding to the list will result in denying access to the clients having these MAC address');
insert into StringsMap values('20484','This page displayes the configured GRE tunnels in the router. GRE Tunnels can be added, edited or deleted from this page.');
insert into StringsMap values('20485','GRE tunnel can be established over the internet by configuring appropriate parameters here. The important parameters Tunnel Name, Interface and Remote IP are displayed here.');
insert into StringsMap values('20486','This page allows user to add/edit GRE tunnel configuration.');
insert into StringsMap values('20487','Remote LAN networks can be accessed using GRE tunnels and GRE tunnels even support broadcast forwarding of DDP packets.');
insert into StringsMap values('20488','GRE Tunnels');
insert into StringsMap values('20489','GRE Tunnels Configuration');
insert into StringsMap values('20490','Please remove 3G dongle first and wait for 12-15 seconds');
insert into StringsMap values('20491','Billing Profiles');
insert into StringsMap values('20492','Billing Profiles Configuration');
insert into StringsMap values('20493','Service Level Agreement');
insert into StringsMap values('20494','Service Level Agreement Configuration');
insert into StringsMap values('20495','Block Clients');
insert into StringsMap values('20496','Block Clients Configuration');
insert into StringsMap values('20497','Selected profile is being used by a VLAN');
insert into StringsMap values('20498','Selected profile can not be deleted as there are active users associated to it.');
insert into StringsMap values('20499','GRE Tunnel with configured Remote IP and Interface already exists');
insert into StringsMap values('20500','Frontdesk User privileges are required');
insert into StringsMap values('20501','This page allows you to configure the Wi-Fi Multimedia(WMM) configuration parameters.'); 
insert into StringsMap values('20502','Wi-Fi Multimedia(WMM) is used to give different types of traffic different processing priority. You can configure WMM settings to provide different priority to different applications, users or data flows, or to guarantee a certain level of performance to data flow.');
insert into StringsMap values('20503','Wi-Fi Multimedia');
insert into StringsMap values('20504', 'This page helps user to export allowed URLs and blocked keywords to a CSV formatted file.');
insert into StringsMap values('20505', 'URLs allowed and Keywords blocked can be downloaded to the local host in CSV format.The user has to click the export button to get the CSV file.');
insert into StringsMap values('20506', 'V');
insert into StringsMap values('20507','Please load a valid configuration file for this device');
insert into StringsMap values('20508', 'IP Protocol Version');
insert into StringsMap values('20509', 'Download debug logs');
insert into StringsMap values('20510', 'Enable Autobackup');
insert into StringsMap values('20511', 'Enable Encryption');
insert into StringsMap values('20512', 'Please enter a valid default gateway');
insert into StringsMap values('20513', 'Default Gateway IP Address must be in DMZ subnet: ');
insert into StringsMap values('20514', 'Default Gateway IP Address must be in VLAN subnet: ');
insert into StringsMap values('20515', 'Please enter a valid rule name.');
insert into StringsMap values('20516', 'Please enter a valid source start IP address.');
insert into StringsMap values('20517', 'Please enter a valid source end IP address.');
insert into StringsMap values('20518', 'Please enter a valid destination start IP address.');
insert into StringsMap values('20519', 'Please enter a valid destination end IP address.');
insert into StringsMap values('20520', 'Please enter a valid source start MAC address in the form XX:XX:XX:XX:XX:XX.');
insert into StringsMap values('20521', 'Please enter a valid source end MAC address in the form XX:XX:XX:XX:XX:XX.');
insert into StringsMap values('20522', 'Please enter a valid destination start MAC address in the form XX:XX:XX:XX:XX:XX.');
insert into StringsMap values('20523', 'Please enter a valid destination end MAC address in the form XX:XX:XX:XX:XX:XX.');
insert into StringsMap values('20524', 'A firewall is a security mechanism to selectively block or allow certain types of traffic in accordance with rules specified by network administrators. You can use this page to manage the firewall rules that control traffic between interfaces of your Bridged network. The List of Bridge Firewall Rules table includes all firewall rules for the bridged network and allows several operations on the firewall rules.');
insert into StringsMap values('20525', 'By default in bridge Mode, all access is allowed for Inbound and Outbound direction between the interfaces of the bridged network. Inbound Rules govern access from DMZ Port to the LAN Port1 interface. Oubound rules restrict access to traffic leaving your LAN Port1 interface. Firewall rules are applied in the order listed. As a general rule, you should move the strictest rules (those with the most specific services or addresses) to the top of the list.');
insert into StringsMap values('20526', 'This page allows you to add a new Bridge firewall rule or edit the configuration of an existing Bridge firewall rule. The details will then be displayed in the List of Available Bridge Firewall Rules table on the Bridge Firewall Rules page.');
insert into StringsMap values('20527', 'If you are not an expert user, we recommend not to configure bridge firewall rules and leave the router into default firewall configuration.');
insert into StringsMap values('20529', 'Firewall rules are not applicable for transparent mode');
insert into StringsMap values('20530', 'Please enable Bridge Bandwidth Profiles to perform Add/Edit/Delete Operations');
insert into StringsMap values('20531', 'This page allows the use to enable trunk mode VLAN on WAN1.');
insert into StringsMap values('20532', 'The router supports virtual network isolation on the WAN with the help of VLANs. User can configure VLANs of which the WAN port is a member.');
insert into StringsMap values('20533', 'This page shows the list of configured bridge bandwidth profiles. These profiles then can be used with the bridge traffic selectors.');
insert into StringsMap values('20534', 'With Bridge bandwidth profiles you can shape and regulate the bridge traffic. This is useful to ensure that low priority users do not monopolize the available Bridge bandwidth for cost-savings or bandwidth-priority-allocation purposes.');
insert into StringsMap values('20535', 'This page allows user to add a new bridge bandwidth profile.');
insert into StringsMap values('20536', 'The new configured bridge bandwidth profile can be attached to a bridge traffic selector for bandwidth management on the router.');
insert into StringsMap values('20537', 'This page shows a list of bridge traffic selectors. Bridge traffic selectors are service based rules to which user can attach bridge bandwidth profiles.');
insert into StringsMap values('20538', 'Once a bridge bandwidth profile has been created it can then be associated with a traffic flow from the LANPort-1 to DMZ. Bridge traffic selectors are elements like IP addresses or services that require their outbound traffic to be regulated.');
insert into StringsMap values('20539', 'This page allows user to configure various traffic rules, to which bridge bandwidth profiles can be attached.');
insert into StringsMap values('20540','VLANs count for WAN1 reached to maximum limit.');
insert into StringsMap values('20541','VLANs count for WAN2 reached to maximum limit.');
insert into StringsMap values('20542','This page allows user to add a Vlan to WAN1 networks.');
insert into StringsMap values('20543','The device allows user to add VLANs into the WAN network. User can configure custom VLAN IDs to be part of the WAN1 network.');
insert into StringsMap values('20544','This page allows user to add a Vlan to WAN2 networks');
insert into StringsMap values('20545','The device allows user to add VLANs into the WAN network. User can configure custom VLAN IDs to be part of the WAN2 network.');
insert into StringsMap values('20546', 'This page allows the use to enable trunk mode VLAN on WAN2.');
insert into StringsMap values('20547', 'LDAP Settings are not configured. Please Configure LDAP Settings.');
insert into StringsMap values('20548', 'POP3 Settings are not configured. Please Configure POP3 Settings.');
insert into StringsMap values('20549', 'RADIUS Settings are not configured. Please Configure RADIUS Settings.');
insert into StringsMap values('20550', 'VPN Policies is in use, please delete the corresponding IPsec One To One Mapping');
insert into StringsMap values('20551', 'IPsec One To One Mapping configuration failed');
insert into StringsMap values('20552', 'This page shows the list of configured IPsec One To One Mapping. A user can also add, edit and delete IPsec One To One Mapping from this page.');
insert into StringsMap values('20553', 'One to One mapping can be configured here. This is to map the ip pool configured in the policy to the IPs that are actually configured in the network');
insert into StringsMap values('20554', 'This page is used to configure IPsec One To One Mapping for a Policy.');
insert into StringsMap values('20555', 'One to One mapping can be configured here.');
insert into StringsMap values('20556', 'Unable to mount, USB size is greater than 2TB');
-- Entries to be stored in save tables
insert into environment (name, value) values("BOOTUP_TIME", "125");
insert into saveTables (tableName) values("VlanOverWan");
insert into saveTables (tableName) values("tcpdump");
insert into saveTables (tableName) values("teredoTunnel");

-- PPP interface related entries
insert into ifDevEventTbl values("ppp99","UMI_COMP_PLATFORM","/pfrm2.0/bin/dhcpv6cRestart /tmp/system.db WAN1PPPOE6",1,1,0,0,0,0,0);
insert into ifDevEventTbl values("ppp98","UMI_COMP_PLATFORM","/pfrm2.0/bin/dhcpv6cRestart /tmp/system.db WAN2PPPOE6",1,1,0,0,0,0,0);
insert into ifDevEventTbl values("ppp99","UMI_COMP_PLATFORM","/pfrm2.0/bin/ifDevUpdateIp6Addr /tmp/system.db ipAddressTable",0,0,0,0,0,1,0);
insert into ifDevEventTbl values("ppp1","UMI_COMP_PLATFORM","/pfrm2.0/bin/ifDevUpdateIp6Addr /tmp/system.db ipAddressTable",1,1,0,0,0,1,0);
insert into ifDevEventTbl values("ppp98","UMI_COMP_PLATFORM","/pfrm2.0/bin/ifDevUpdateIp6Addr /tmp/system.db ipAddressTable",0,0,0,0,0,1,0);
insert into ifDevEventTbl values("ppp2","UMI_COMP_PLATFORM","/pfrm2.0/bin/ifDevUpdateIp6Addr /tmp/system.db ipAddressTable",1,1,0,0,0,1,0);

-- Interface related stuff
insert into networkInterface values ("agl0", "LAN-BDG", "agl0", "ifStatic", "","ethernet", 1500, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 0, 5, 0,1,0,1);
insert into networkInterface values ('agl0.4088','LANPORT1','agl0.4088','','ifStatic','ethernet',1500,'0.0.0.0','0.0.0.0','0.0.0.0','0.0.0.0','0.0.0.0',0,1,5,0,1,0,1);
insert into networkInterface values ('agl0.1','LAN-VLAN1','agl0.1','','ifStatic','ethernet',1500,'0.0.0.0','0.0.0.0','0.0.0.0','0.0.0.0','0.0.0.0',0,1,5,0,1,0,1);

-- Bandwidth profile registration
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/bwLimitConfig",1,1,"networkInterface",0,1,0,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/bwLimitConfig",1,1,"dot11STA",0,1,1,1);

-- WAN2 related entries, even if there are commone entries lets keep this stuff together.
insert into ifDevEventTbl values("bdgWAN2","UMI_COMP_PLATFORM","/pfrm2.0/bin/ifDevUpdateMac /tmp/system.db ethernet bdgWAN2",0,0,0,1,0,0,0);
insert into ifDevEventTbl values("eth0","UMI_COMP_PLATFORM","/pfrm2.0/bin/ifDevUpdateMac /tmp/system.db ethernet eth0",0,0,0,1,0,0,0);
insert into ifDevEventTbl values("bdgWAN2","UMI_COMP_PLATFORM","/pfrm2.0/bin/iprouteManageRoutes /tmp/system.db route",0,0,1,0,1,0,0);
insert into ifDevEventTbl values("eth0","UMI_COMP_PLATFORM","/pfrm2.0/bin/iprouteManageRoutes /tmp/system.db route",0,0,1,0,1,0,0);
insert into networkInterface values ("eth0", "WAN2", "eth0", "dhcpc", "","ethernet", 1500, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 0, 5, 0,1,1,2); 
insert into interfaceStats values("bdgWAN2",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
insert into interfaceStats values("eth0",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0); 
insert into ifDevEventTbl values("bdgWAN2","UMI_COMP_PLATFORM","/pfrm2.0/bin/ifDevUpdateIp6Addr /tmp/system.db ipAddressTable",0,0,0,0,0,1,0);
insert into ifDevEventTbl values("eth0","UMI_COMP_PLATFORM","/pfrm2.0/bin/ifDevUpdateIp6Addr /tmp/system.db ipAddressTable",0,0,0,0,0,1,0);
insert into ifDevEventTbl values("bdgWAN2","UMI_COMP_PLATFORM","/pfrm2.0/bin/ifDevUpdateIp6Addr /tmp/system.db ipAddressTable",0,0,1,0,0,0,0);
insert into ifDevEventTbl values("eth0","UMI_COMP_PLATFORM","/pfrm2.0/bin/ifDevUpdateIp6Addr /tmp/system.db ipAddressTable",0,0,1,0,0,0,0);
insert into ifDevEventTbl values("bdgWAN2","UMI_COMP_PLATFORM","/pfrm2.0/bin/dhcpv6cRestart /tmp/system.db WAN2",0,0,1,0,0,0,0);
insert into ifDevEventTbl values("eth0","UMI_COMP_PLATFORM","/pfrm2.0/bin/dhcpv6cRestart /tmp/system.db WAN2",0,0,1,0,0,0,0);
insert into ifDevEventTbl values("bdgWAN2","UMI_COMP_FIREWALL","",0,0,1,0,0,0,0);
insert into ifDevEventTbl values("eth0","UMI_COMP_FIREWALL","",0,0,1,0,0,0,0);
insert into ifDevEventTbl values ('bdgWAN2',"UMI_COMP_PLATFORM","/pfrm2.0/bin/ifStaticIfDevHandler /tmp/system.db ifStatic",0,0,1,0,0,0,0);
insert into ifDevEventTbl values ('eth0',"UMI_COMP_PLATFORM","/pfrm2.0/bin/ifStaticIfDevHandler /tmp/system.db ifStatic",0,0,1,0,0,0,0);
insert into ifDevEventTbl values ('bdgWAN2',"UMI_COMP_PLATFORM","/pfrm2.0/bin/ifStaticIfDevHandler /tmp/system.db ifStaticAliasAddrTbl",0,0,1,0,0,0,0);
insert into ifDevEventTbl values ('eth0',"UMI_COMP_PLATFORM","/pfrm2.0/bin/ifStaticIfDevHandler /tmp/system.db ifStaticAliasAddrTbl",0,0,1,0,0,0,0);

-- Wireless related entries as AC will have more entries.
insert into networkInterface values ("vap4", "LAN-BDG", "vap4","ifStatic","","dot11", 1500, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 1, 5, 0,1,0,5);
insert into networkInterface values ("vap5", "LAN-BDG", "vap5","ifStatic","","dot11", 1500, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 1, 5, 0,1,0,5);
insert into networkInterface values ("vap6", "LAN-BDG", "vap6","ifStatic","","dot11", 1500, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 1, 5, 0,1,0,5);
insert into networkInterface values ("vap7", "LAN-BDG", "vap7","ifStatic","","dot11", 1500, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 1, 5, 0,1,0,5);
insert into interfaceStats values("vap4","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0");
insert into interfaceStats values("vap5","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0");
insert into interfaceStats values("vap6","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0");
insert into interfaceStats values("vap7","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0");

-- Register ledmgmt.lua with dot11 tables
insert into dbUpdateRegisterProgram values ("lua /pfrm2.0/bin/dot11mgmt.lua",1,1,"dot11Radio", 0, 1,1,0);
insert into dbUpdateRegisterProgram values ("lua /pfrm2.0/bin/dot11mgmt.lua",1,1,"dot11VAP", 0, 1,1,0);
insert into dbUpdateRegisterProgram values ("lua /pfrm2.0/bin/dot11mgmt.lua",1,1,"dot11WPSSessStatus", 0, 1,1,0);
insert into dbUpdateRegisterProgram values ("lua /pfrm2.0/bin/dot11mgmt.lua",1,1,"dot11WPS", 0, 1,1,0);
insert into networkInterface values ("eth0", "DMZ", "eth0", "ifStatic", "","ethernet", 1500, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 0, 5, 0,1,1,4);
insert into saveTables (tableName) values("OpenVpnUserGroups");
insert into saveTables (tableName) values("OpenvpnClientConfig");
insert into saveTables (tableName) values("OpenVpnConfigPolicy");
insert into saveTables (tableName) values("OpenVpnEasyrsaCert");
insert into saveTables (tableName) values("OpenvpnAuthCertificates");
insert into saveTables (tableName) values("OpenvpnTlsCertificates");
insert into saveTables (tableName) values("OpenvpnCrlCertificates");
--insert into saveTables (tableName) values("OpenVpnPolicy");
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"OpenvpnClientConfig", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/openvpnConfig",1,1,"OpenvpnClientConfig", 0, 1,1,1);
insert into dbUpdateRegisterTbl values ("UMI_COMP_PLATFORM",1,1,"OpenVpnConfigPolicy", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/openvpnConfig",1,1,"OpenVpnConfigPolicy", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/ptCoreIfDevEventHandler", 0, 1, "networkInterface", 0, 1, 0, 0);
insert into ifDevEventTbl values("tun0","UMI_COMP_PLATFORM","/pfrm2.0/bin/ptCoreIfDevEventHandler /tmp/system.db 23 ifDevEventTbl 22",0,0,0,0,1,0,0);
insert into dbUpdateRegisterTbl values ("UMI_COMP_FIREWALL",1,1,"OpenVpnPolicy", 0, 1,1,1);
insert into dbUpdateRegisterProgram values ("/pfrm2.0/bin/userdbConfig",1,1,"OpenVpnUserGroups",0,1,1,1);
insert into dbUpdateRegisterProgram values ('/pfrm2.0/bin/ospfConfig',0,1,'route',0,1,1,1);
