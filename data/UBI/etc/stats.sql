BEGIN;
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
    currSnap integer NOT NULL
    );
CREATE TABLE ddns
(
        OID integer ,
        interfaceName text NOT NULL,
        ddnsService integer NOT NULL,
        hostname text ,
        username text ,
        password text ,
        timePeriod integer ,
        wildflag integer 
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

insert into networkInterface values ("bdg1", "LAN", "bdg1", "ifStatic", "", "bridge", 1500, "192.168.10.2", "255.255.255.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 1, 5, 0,1,1,1);
insert into networkInterface values ("agl0", "LAN-BDG", "agl0", "ifStatic", "","ethernet", 1500, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 0, 5, 0,1,0,1);

insert into networkInterface values ("eth1", "WAN1", "eth1", "dhcpc", "","ethernet", 1500, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 0, 5, 0,1,1,2);

insert into networkInterface values ("ppp101", "WAN1PPPOE2", "ppp101", "japanPppoe", "","ethernet", 1500, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 0, 5, 0,1,1,2);


insert into networkInterface values ("sit0", "sit0-WAN1", "sit0", "","", "tunnel", 1500, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 0, 5, 0,2,1 ,2); 

insert into networkInterface values ("eth0", "DMZ", "eth0", "ifStatic", "","ethernet", 1500, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 0, 5, 0,3,1,4); 

insert into networkInterface values ("ppp201", "WAN2PPPOE2", "ppp201", "japanPppoe", "","ethernet", 1500, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 0, 5, 0,1,1,2);

insert into networkInterface values ('ppp99','WAN1PPPOE6','ppp99','','pppoe6','ethernet',1500,'0.0.0.0','0.0.0.0','0.0.0.0','0.0.0.0','0.0.0.0',0,0,5,0,3,0,2);

insert into networkInterface values ('ppp98','WAN2PPPOE6','ppp98','','pppoe6','ethernet',1500,'0.0.0.0','0.0.0.0','0.0.0.0','0.0.0.0','0.0.0.0',0,0,5,0,3,0,2);
insert into networkInterface values ('ppp2', 'WAN2', 'ppp2', 'dhcpc', '','ethernet', 1500, '0.0.0.0', '0.0.0.0', '0.0.0.0', '0.0.0.0', '0.0.0.0', 0, 0, 5, 0,3,1,2); 


--wireless
insert into networkInterface values ("vap0", "LAN-BDG", "vap0","ifStatic","","dot11", 1500, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 1, 5, 0,1,0,5);
insert into networkInterface values ("vap1", "LAN-BDG", "vap1","ifStatic","","dot11", 1500, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 1, 5, 0,1,0,5);
insert into networkInterface values ("vap2", "LAN-BDG", "vap2","ifStatic","","dot11", 1500, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 1, 5, 0,1,0,5);
insert into networkInterface values ("vap3", "LAN-BDG", "vap3","ifStatic","","dot11", 1500, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", 0, 1, 5, 0,1,0,5);



--Status tables
insert into NimfStatus( LogicalIfName, AddressFamily, Nimfstatus, Linkstatus, WanUpTime)values("WAN1", 2,"Not Yet Available", "LINK DOWN", "Not Yet Available");
insert into NimfStatus( LogicalIfName, AddressFamily, Nimfstatus, Linkstatus, WanUpTime)values("WAN1", 10,"Not Yet Available", "LINK DOWN", "Not Yet Available");
insert into NimfStatus( LogicalIfName,AddressFamily,Nimfstatus,Linkstatus,WanUpTime)values("LAN", 2,"Not Yet Available","LINK DOWN","Not Yet Available");
insert into NimfStatus( LogicalIfName, AddressFamily, Nimfstatus,Linkstatus,WanUpTime)values("LAN", 10,"Not Yet Available","LINK DOWN","Not Yet Available");
insert into DhcpStatus(LogicalIfName,DhcpServerIp,LeaseTime,LeaseObtained)values("WAN1","Not Yet Available","Not Yet Available","Not Yet Available");

insert into NimfStatus( LogicalIfName, AddressFamily, Nimfstatus, Linkstatus, WanUpTime)values("WAN2", 2,"Not Yet Available", "LINK DOWN", "Not Yet Available");
insert into NimfStatus( LogicalIfName, AddressFamily, Nimfstatus, Linkstatus, WanUpTime)values("WAN2", 10,"Not Yet Available", "LINK DOWN", "Not Yet Available");
insert into NimfStatus( LogicalIfName, AddressFamily, Nimfstatus, Linkstatus, WanUpTime)values("DMZ", 2,"Not Yet Available", "LINK DOWN", "Not Yet Available");
insert into DhcpStatus(LogicalIfName,DhcpServerIp,LeaseTime,LeaseObtained)values("WAN2","Not Yet Available","Not Yet Available","Not Yet Available");

insert into interfaceStats values("bdg1",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0); 
insert into interfaceStats values("eth1",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0); 
insert into interfaceStats values("eth0",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0); 
insert into interfaceStats values("ppp1",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0); 
insert into interfaceStats values("ppp2",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0); 

insert into interfaceStats values("vap0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0");
insert into interfaceStats values("vap1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0");
insert into interfaceStats values("vap2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0");
insert into interfaceStats values("vap3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0");

insert into ifUsageReportConfig values(2,4); 

insert into defaultRouters values ("WAN1", 2, "0.0.0.0", ""); 
insert into defaultRouters values ("WAN1", 10, "", ""); 
insert into defaultRouters values ("WAN2", 2, "0.0.0.0", ""); 
insert into defaultRouters values ("WAN2", 10, "", "");

insert into ddnsStatus(interfaceName) values ("WAN1");
insert into ddnsStatus(interfaceName) values ("WAN2");
