module("com.teamf1.core.vpn.openvpn.returnCodes", package.seeall)
OPENVPN_SERVER_NOTCONFIGURED = 1845559297
OPENVPN_TABLE_NIL = OPENVPN_SERVER_NOTCONFIGURED + 1
OPENVPN_FEATURE_NOTENABLED = OPENVPN_TABLE_NIL + 1
OPENVPN_NETWORKIP_INVALID = OPENVPN_FEATURE_NOTENABLED + 1
OPENVPN_NETWORKMASK_INVALID = OPENVPN_NETWORKIP_INVALID + 1
OPENVPN_PORTNUMBER_INVALID = OPENVPN_NETWORKMASK_INVALID + 1
OPENVPN_TUNNELTYPE_INVALID = OPENVPN_PORTNUMBER_INVALID + 1
OPENVPN_TUNNELPROTOCOL_INVALID = OPENVPN_TUNNELTYPE_INVALID + 1
OPENVPN_ENCRYPTIONALGO_INVALID = OPENVPN_TUNNELPROTOCOL_INVALID + 1
OPENVPN_HASHALGO_INVALID = OPENVPN_ENCRYPTIONALGO_INVALID + 1
OPENVPN_CLIENTTOCLIENT_COMMUNICATION_INVALID = OPENVPN_HASHALGO_INVALID + 1
INVALID_USERBASEDAUTH = OPENVPN_CLIENTTOCLIENT_COMMUNICATION_INVALID + 1
INVALID_USERNAME = INVALID_USERBASEDAUTH + 1
INVALID_PASSWORD = INVALID_USERNAME + 1
ENABLE_USER_AUTH = INVALID_PASSWORD + 1
ENABLE_CERTIFICATE_AUTH = ENABLE_USER_AUTH + 1
OPENVPN_CLIENT_NOTCONFIGURED = 1845624833
OPENVPN_SERVERIP_INVALID = OPENVPN_CLIENT_NOTCONFIGURED + 1
OPENVPN_TUNNELTYPE_NOTSPLITTUNNEL = 1845690369
OPENVPN_INVALID_COOKIE = OPENVPN_TUNNELTYPE_NOTSPLITTUNNEL + 1
OPENVPN_INVALID_NEXTCOOKIE = OPENVPN_INVALID_COOKIE + 1
OPENVPN_LANNETWORKS_NETWORKIP_INVALID = OPENVPN_INVALID_NEXTCOOKIE + 1
OPENVPN_LANNETWORKS_NETWORKMASK_INVALID = OPENVPN_LANNETWORKS_NETWORKIP_INVALID + 1
OPENVPN_LANNETWORKS_TABLENIL = OPENVPN_LANNETWORKS_NETWORKMASK_INVALID + 1
OPENVPN_REMOTENETWORKS_NETWORKIP_INVALID = 1845755905
OPENVPN_REMOTENETWORKS_NETWORKMASK_INVALID = OPENVPN_REMOTENETWORKS_NETWORKIP_INVALID + 1
OPENVPN_REMOTENETWORKS_TABLENIL = OPENVPN_REMOTENETWORKS_NETWORKMASK_INVALID + 1
OPENVPN_CACERTIFICATE_LOAD_FAILED = 1845821441
OPENVPN_SERVERCERTIFICATE_LOAD_FAILED = OPENVPN_CACERTIFICATE_LOAD_FAILED + 1
OPENVPN_SERVERKEYCERTIFICATE_LOAD_FAILED = OPENVPN_SERVERCERTIFICATE_LOAD_FAILED + 1
OPENVPN_DHCERTIFICATE_LOAD_FAILED = OPENVPN_SERVERKEYCERTIFICATE_LOAD_FAILED + 1
OPENVPN_TACERTIFICATE_LOAD_FAILED = OPENVPN_DHCERTIFICATE_LOAD_FAILED + 1
OPENVPN_CRLCERTIFICATE_LOAD_FAILED = OPENVPN_TACERTIFICATE_LOAD_FAILED + 1
SELECT_ONE_CRT = OPENVPN_CRLCERTIFICATE_LOAD_FAILED + 1
OPENVPN_ACCESSCERTIFICATE_LOAD_FAILED = SELECT_ONE_CRT + 1
SELECT_ONLY_ONE_CRT = OPENVPN_ACCESSCERTIFICATE_LOAD_FAILED + 1
LOAD_DH_CERTIFICATE = SELECT_ONLY_ONE_CRT + 1
UPLOAD_ACCESS_CLIENT_CRT = LOAD_DH_CERTIFICATE + 1
CERTS_NOT_FOUND = UPLOAD_ACCESS_CLIENT_CRT + 1
TA_CERT_FAILED = CERTS_NOT_FOUND + 1
ACCESS_CERT_FAILED = TA_CERT_FAILED + 1
CRL_CERT_FAILED = ACCESS_CERT_FAILED + 1
OPENVPN_CACERTIFICATE_LOAD_FAILED_ERR1 = CRL_CERT_FAILED + 1
ENABLEALLOWONLYUSERBASED = OPENVPN_CACERTIFICATE_LOAD_FAILED_ERR1 + 1
ENABLEUPLOADONLYCACERT = ENABLEALLOWONLYUSERBASED + 1
INVALID_ALLOWONLYUSERBASEDAUTH = ENABLEUPLOADONLYCACERT + 1
INVALID_DUPLICATECN = INVALID_ALLOWONLYUSERBASEDAUTH + 1
CLIENT_ALREADY_EXIT = INVALID_DUPLICATECN + 1
CA_CERT_NOT_UPLOADED = CLIENT_ALREADY_EXIT + 1
OPENVPN_SERVER_NOT_ENALBLED = CA_CERT_NOT_UPLOADED + 1
ENABLE_OPENVPN_SERVER = OPENVPN_SERVER_NOT_ENALBLED + 1
OPENVPN_CONFIG_CLIENT = ENABLE_OPENVPN_SERVER + 1
REGEN_CLIENT_CONFIG = OPENVPN_CONFIG_CLIENT + 1
INVALID_CAKEY = REGEN_CLIENT_CONFIG + 1
USER_DOESNT_EXIST = INVALID_CAKEY + 1
AUTHTYPE_INVALID = USER_DOESNT_EXIST + 1
AUTHSUBTYPE_INVALID = AUTHTYPE_INVALID + 1
RADIUS_NOT_ENABLED = AUTHSUBTYPE_INVALID + 1
NT_DOMAIN_NOT_ENABLED = RADIUS_NOT_ENABLED + 1
AD_SERVER_NOT_ENABLED = NT_DOMAIN_NOT_ENABLED + 1
LDAP_SERVER_NOT_ENABLED = AD_SERVER_NOT_ENABLED + 1
POP3_SERVER_NOT_ENABLED = LDAP_SERVER_NOT_ENABLED + 1
OPENVPN_REMOTEMANAGEMENT_DISABLED = POP3_SERVER_NOT_ENABLED + 1
POLICY_ALREADY_EXIST = OPENVPN_REMOTEMANAGEMENT_DISABLED + 1
OPENVPN_POLICYADDRESS_INVALID = POLICY_ALREADY_EXIST + 1
INVALID_PTENABLE = OPENVPN_POLICYADDRESS_INVALID + 1
INVALID_PTUSERNAME = INVALID_PTENABLE + 1
INVALID_PTPASSWORD = INVALID_PTUSERNAME + 1
INVALID_PTCLUSTERID = INVALID_PTPASSWORD + 1
DEF_OMNISSL_CLIENT_CANNOT_DEL = INVALID_PTCLUSTERID + 1
SUBJECT_NAME_EXISTS = DEF_OMNISSL_CLIENT_CANNOT_DEL + 1
SERVER_NAME_EXISTS = SUBJECT_NAME_EXISTS + 1
CLIENT_NAME_EXISTS = SERVER_NAME_EXISTS + 1
EASYRSA_MAX_LIMIT = CLIENT_NAME_EXISTS + 1
EASYRSA_GEN_FAIL = EASYRSA_MAX_LIMIT + 1
DEFAULT_ROW = EASYRSA_GEN_FAIL + 1
COMMON_NAME_MUST = DEFAULT_ROW + 1
C_LEN_EXCEEDED = COMMON_NAME_MUST + 1
S_LEN_EXCEEDED = C_LEN_EXCEEDED + 1
CITY_LEN_EXCEEDED = S_LEN_EXCEEDED + 1
O_LEN_EXCEEDED = CITY_LEN_EXCEEDED + 1
OU_LEN_EXCEEDED = O_LEN_EXCEEDED + 1
CN_LEN_EXCEEDED = OU_LEN_EXCEEDED + 1
SUBJECT_NAME_REF = CN_LEN_EXCEEDED + 1
COMMON_NAME_ALREADY_EXIST = SUBJECT_NAME_REF + 1
EMAIL_LEN_EXCEEDED = COMMON_NAME_ALREADY_EXIST + 1
SERVER_CLIENT_SAME = EMAIL_LEN_EXCEEDED + 1
USERCERTENABLE = SERVER_CLIENT_SAME + 1
SELECT_VALID_CRT = USERCERTENABLE + 1
OPENVPNDELCERT = SELECT_VALID_CRT + 1
CERT_NAME_ALREADY_EXIT = OPENVPNDELCERT + 1
CA_UPLOAD_BUTTON = CERT_NAME_ALREADY_EXIT + 1
SERVER_CERT_KEY_UPLOAD_BUTTON = CA_UPLOAD_BUTTON + 1
returnCodesToString = {
  [OPENVPN_SERVER_NOTCONFIGURED] = "openvpn server Not configured",
  [OPENVPN_TABLE_NIL] = "openvpn configuration is nil",
  [OPENVPN_FEATURE_NOTENABLED] = "openvpn feature is not enabled",
  [OPENVPN_NETWORKIP_INVALID] = "Invalid Network IP",
  [OPENVPN_NETWORKMASK_INVALID] = "Invalid NetworkMask",
  [OPENVPN_PORTNUMBER_INVALID] = "Invalid port number",
  [OPENVPN_TUNNELTYPE_INVALID] = "Invalid TunnelType",
  [OPENVPN_TUNNELPROTOCOL_INVALID] = "Invalid TunnelProtocol",
  [OPENVPN_ENCRYPTIONALGO_INVALID] = "Invalid Encryption Algorithm",
  [OPENVPN_HASHALGO_INVALID] = "Invalid Hash Algorithm",
  [OPENVPN_CLIENTTOCLIENT_COMMUNICATION_INVALID] = "Invalid Client To Client Communication",
  [OPENVPN_CLIENT_NOTCONFIGURED] = "Openvpn Client is Not configured",
  [OPENVPN_SERVERIP_INVALID] = "Invalid ServerIp/FQDN",
  [OPENVPN_TUNNELTYPE_NOTSPLITTUNNEL] = "Please select Split Tunnel and configure this page.",
  [OPENVPN_INVALID_COOKIE] = "Invalid cookie",
  [OPENVPN_INVALID_NEXTCOOKIE] = "Invalid Next cookie",
  [OPENVPN_LANNETWORKS_NETWORKIP_INVALID] = "Invalid LanNetworkIP",
  [OPENVPN_LANNETWORKS_NETWORKMASK_INVALID] = "Invalid LanNetworkMask",
  [OPENVPN_LANNETWORKS_TABLENIL] = "Local Networks Table is nil",
  [OPENVPN_REMOTENETWORKS_NETWORKIP_INVALID] = "Invalid RemoteNetworkIP",
  [OPENVPN_REMOTENETWORKS_NETWORKMASK_INVALID] = "Invalid RemoteNetworkMask",
  [OPENVPN_REMOTENETWORKS_TABLENIL] = "Remote Networks Table is nil",
  [OPENVPN_CACERTIFICATE_LOAD_FAILED] = "Error:upload ca certificate failed",
  [OPENVPN_SERVERCERTIFICATE_LOAD_FAILED] = "Error:upload server certificate failed",
  [OPENVPN_SERVERKEYCERTIFICATE_LOAD_FAILED] = "Error:upload server key certificate failed",
  [OPENVPN_DHCERTIFICATE_LOAD_FAILED] = "Error:upload dh certificate failed",
  [OPENVPN_TACERTIFICATE_LOAD_FAILED] = "upload ta certificate failed",
  [OPENVPN_CRLCERTIFICATE_LOAD_FAILED] = "upload crl certificate failed",
  [SELECT_ONE_CRT] = "Please select certificate from certificate section to authenticate",
  [OPENVPN_ACCESSCERTIFICATE_LOAD_FAILED] = "Openvpn Access Server client certificate load failed",
  [SELECT_ONLY_ONE_CRT] = "Please select only one certificate from certificate section",
  [LOAD_DH_CERTIFICATE] = "Please upload DH Key and enable OpenVPN",
  [UPLOAD_ACCESS_CLIENT_CRT] = "Please upload the client configuration and enable OpenVPN Access Server Client",
  [CERTS_NOT_FOUND] = "Required certificates Not Found.",
  [TA_CERT_FAILED] = "Ta certificate Failed.",
  [ACCESS_CERT_FAILED] = "Access Certificate Failed",
  [CRL_CERT_FAILED] = "CRL Certificate configuration failed",
  [OPENVPN_CACERTIFICATE_LOAD_FAILED_ERR1] = "Error:Upload failed. Common Name information missing in certificate.",
  [INVALID_USERBASEDAUTH] = "User Based Auth value is nil",
  [INVALID_USERNAME] = "OpenVPN username is nil.",
  [INVALID_PASSWORD] = "OpenVPN password is nil.",
  [ENABLE_USER_AUTH] = "User Based Auth should be enabled when Duplicate CN option is enabled",
  [ENABLE_CERTIFICATE_AUTH] = "Certificate Verification should be enabled when Duplicate CN option is enabled",
  [ENABLEALLOWONLYUSERBASED] = "Please Enable Allow Only User Based Auth or Please Disable the Upload Only CA Certificate in OpenVPN Authentication Page.",
  [ENABLEUPLOADONLYCACERT] = "Please Enable Upload Only CA Certificate in OpenVPN Authentication Page.",
  [INVALID_ALLOWONLYUSERBASEDAUTH] = "Invalid Allow Only User Based Auth",
  [INVALID_DUPLICATECN] = "Invalid Duplicate-CN",
  [CLIENT_ALREADY_EXIT] = "Already client configuration exists",
  [CA_CERT_NOT_UPLOADED] = "Please upload CA certifications before generating client configuration",
  [OPENVPN_SERVER_NOT_ENALBLED] = "Please enable the OpenVPN server",
  [ENABLE_OPENVPN_SERVER] = "Please enable OpenVPN server",
  [OPENVPN_CONFIG_CLIENT] = "Please configure client",
  [REGEN_CLIENT_CONFIG] = "Please regenerate client configuration",
  [INVALID_CAKEY] = "Invalid CA Key",
  [USER_DOESNT_EXIST] = "User does not exist",
  [AUTHTYPE_INVALID] = "Authentication value is invalid",
  [AUTHSUBTYPE_INVALID] = "Authentication sub type value is invalid",
  [RADIUS_NOT_ENABLED] = "Radius server not configured",
  [NT_DOMAIN_NOT_ENABLED] = "NT-Domain server not configured",
  [AD_SERVER_NOT_ENABLED] = "Active Directory server not configured",
  [LDAP_SERVER_NOT_ENABLED] = "LDAP server not configured",
  [POP3_SERVER_NOT_ENABLED] = "POP3 server not configured",
  [OPENVPN_REMOTEMANAGEMENT_DISABLED] = "Please Enable Remote Management to activate OpenVPN Configurations.",
  [POLICY_ALREADY_EXIST] = "Server policy configuration failed",
  [OPENVPN_POLICYADDRESS_INVALID] = "Invalid OpenVPN policy address",
  [INVALID_PTENABLE] = "Private tunnel enabled configuration failed",
  [INVALID_PTUSERNAME] = "Invalid private tunnel username",
  [INVALID_PTPASSWORD] = "Invalid private tunnel password",
  [INVALID_PTCLUSTERID] = "Invalid private tunnel cluster Id",
  [DEF_OMNISSL_CLIENT_CANNOT_DEL] = "Default OmniSSL client certificate can not be deleted",
  [SUBJECT_NAME_EXISTS] = "Subject name already exists.",
  [SERVER_NAME_EXISTS] = "Server name already exists.",
  [CLIENT_NAME_EXISTS] = "Client name already exists.",
  [EASYRSA_MAX_LIMIT] = "Maximum configuration limit reached.Cannot exceed the limit.",
  [EASYRSA_GEN_FAIL] = "Easy rsa certificate generation failed.",
  [DEFAULT_ROW] = "Default row cannot be deleted.",
  [COMMON_NAME_MUST] = "Subject Name should contain CN=",
  [C_LEN_EXCEEDED] = "Country name length, after CN= should be two characters only.",
  [S_LEN_EXCEEDED] = "State name length, after ST= should not exceed thirty characters.",
  [CITY_LEN_EXCEEDED] = "City name length, after L= should not exceed thirty characters.",
  [O_LEN_EXCEEDED] = "Organization name length, after O= should not exceed thirty characters.",
  [OU_LEN_EXCEEDED] = "Organizational unit name length, after OU= should not exceed thirty characters.",
  [CN_LEN_EXCEEDED] = "Common name cannot exceeded thirty two characters.",
  [SUBJECT_NAME_REF] = "Invalid subject Name. Subject Name should be like C=TI,ST=TS,L=HY,O=EI,OU=En,CN=openvpn",
  [COMMON_NAME_ALREADY_EXIST] = "Common Name already configured.",
  [EMAIL_LEN_EXCEEDED] = "Email name cannot exceeded 64 characters.",
  [SERVER_CLIENT_SAME] = "Server and client names are same. Please configure different name for server/client certificates.",
  [USERCERTENABLE] = "Please Enable User Based Auth or Certificate Verification.",
  [SELECT_VALID_CRT] = "Please Select valid Certificates.",
  [OPENVPNDELCERT] = "Selected certificate can not be deleted using this cert in Server/Client.",
  [CERT_NAME_ALREADY_EXIT] = "Certificate name already exists.",
  [CA_UPLOAD_BUTTON] = "please upload the ca certificate.",
  [SERVER_CERT_KEY_UPLOAD_BUTTON] = "please upload the server.crt or server.key certificate."
}
