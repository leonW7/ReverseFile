module("com.teamf1.core.l2tpd_returnCodes", package.seeall)
COMP_L2TPD_RETURNCODE_START = 1342177280
L2TP_SERVER_RETURNCODE_START = 1343225856
L2TP_SERVER_INVALID_IP_SAME_SUBNET_PPTP = L2TP_SERVER_RETURNCODE_START + 1
L2TP_SERVER_INVALID_IP_SAME_SUBNET_DMZ = L2TP_SERVER_INVALID_IP_SAME_SUBNET_PPTP + 1
L2TP_SERVER_INVALID_IP_SAME_SUBNET_VLAN = L2TP_SERVER_INVALID_IP_SAME_SUBNET_DMZ + 1
L2TP_SERVER_INVALID_IP_SAME_SUBNET_LAN = L2TP_SERVER_INVALID_IP_SAME_SUBNET_VLAN + 1
L2TP_SERVER_VALIDATION_CHECK_FAILED = L2TP_SERVER_INVALID_IP_SAME_SUBNET_LAN + 1
L2TP_SERVER_INVALID_TIMEOUT = L2TP_SERVER_VALIDATION_CHECK_FAILED + 1
L2TP_SERVER_INVALID_START_IP = L2TP_SERVER_INVALID_TIMEOUT + 1
L2TP_SERVER_INVALID_END_IP = L2TP_SERVER_INVALID_START_IP + 1
INVALID_AUTHENTICATION_TYPE = L2TP_SERVER_INVALID_END_IP + 1
LDAP_NOT_CONFIGURED = INVALID_AUTHENTICATION_TYPE + 1
POP3_NOT_CONFIGURED = LDAP_NOT_CONFIGURED + 1
RADIUS_SERVER_NOT_CONFIGURED = POP3_NOT_CONFIGURED + 1
ACTIVE_DIRECTORY_NOT_CONFIGURED = RADIUS_SERVER_NOT_CONFIGURED + 1
NT_DOMAIN_SERVER_NOT_CONFIGURED = ACTIVE_DIRECTORY_NOT_CONFIGURED + 1
L2TP_SERVER_START_END_INVALID_MASK = NT_DOMAIN_SERVER_NOT_CONFIGURED + 1
L2TP_SERVER_RANGE_INVALID = L2TP_SERVER_START_END_INVALID_MASK + 1
L2TP_SERVER_END_IP_RANGE_INVALID = L2TP_SERVER_RANGE_INVALID + 1
L2TP_SERVER_RETURNCODE_END = 1342308351
returnCodesToString = {
  [COMP_L2TPD_RETURNCODE_START] = "Unknown error occurred",
  [L2TP_SERVER_RETURNCODE_START] = "Unknown error occurred",
  [L2TP_SERVER_INVALID_IP_SAME_SUBNET_PPTP] = "Starting IP is in same subnet as PPTP Starting IP",
  [L2TP_SERVER_INVALID_IP_SAME_SUBNET_DMZ] = "Starting IP is in same subnet as DMZ server IP",
  [L2TP_SERVER_INVALID_IP_SAME_SUBNET_VLAN] = "Starting IP is in same subnet as vlan IP",
  [L2TP_SERVER_INVALID_IP_SAME_SUBNET_LAN] = "Starting IP is in same subnet as LAN IP",
  [L2TP_SERVER_VALIDATION_CHECK_FAILED] = "IP validation check failed",
  [L2TP_SERVER_INVALID_TIMEOUT] = "Timeout is invalid",
  [L2TP_SERVER_INVALID_START_IP] = "Start IP is invalid",
  [L2TP_SERVER_INVALID_END_IP] = "End IP is invalid",
  [INVALID_AUTHENTICATION_TYPE] = "Invalid pptp Authentication type",
  [LDAP_NOT_CONFIGURED] = "LDAP server settings not configured. Please Configure                                          LDAP server settings first.",
  [POP3_NOT_CONFIGURED] = "POP3 server settings not configured. Please Configure                                          POP3 server settings first.",
  [RADIUS_SERVER_NOT_CONFIGURED] = "Radius server settings not configured. Please Configure                                          Radius server settings first.",
  [ACTIVE_DIRECTORY_NOT_CONFIGURED] = "Active Directory Server Settings are not configured. Please Configure                                          Active Directory Server Settings first.",
  [NT_DOMAIN_SERVER_NOT_CONFIGURED] = "NT Domain Server Settings are not configured. Please Configure                                           NT Domain Server Settings first.",
  [L2TP_SERVER_START_END_INVALID_MASK] = "Starting and Ending IP Address must be in same subnet.",
  [L2TP_SERVER_RANGE_INVALID] = "Starting and Ending IP Address range must be less than or equal to ",
  [L2TP_SERVER_END_IP_RANGE_INVALID] = "Ending IP Address should be higher than Starting IP Address.",
  [L2TP_SERVER_RETURNCODE_END] = "Unknown error occurred"
}
