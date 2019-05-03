module("com.teamf1.core.snmp.returnCodes", package.seeall)
SNMP_ACL_IPADDRESS_INVALID = 419495937
SNMP_ACL_SUBNETMASK_INVALID = SNMP_ACL_IPADDRESS_INVALID + 1
SNMP_SYSINFO_CONTACT_LENINVALID = 419561473
SNMP_SYSINFO_LOCATION_LENINVALID = SNMP_SYSINFO_CONTACT_LENINVALID + 1
SNMP_SYSINFO_NAME_LENINVALID = SNMP_SYSINFO_LOCATION_LENINVALID + 1
SNMP_TRAP_IPADDRESS_INVALID = 419627009
SNMP_TRAP_PORT_INVALID = SNMP_TRAP_IPADDRESS_INVALID + 1
SNMP_USER_AUTHPWD_INVALID = 419692545
SNMP_USER_PRIVACYPWD_INVALID = SNMP_USER_AUTHPWD_INVALID + 1
MD5_AUTHPWD_INVALID = SNMP_USER_PRIVACYPWD_INVALID + 1
SHA1_AUTHPWD_INVALID = MD5_AUTHPWD_INVALID + 1
DES_PRIVACYPWD_INVALID = SHA1_AUTHPWD_INVALID + 1
AES_PRIVACYPWD_INVALID = DES_PRIVACYPWD_INVALID + 1
ENTRY_ALREADY_EXIST = AES_PRIVACYPWD_INVALID + 1
SNMP_ACCESS_NOT_ALLOWED = ENTRY_ALREADY_EXIST + 1
returnCodesToString = {
  [SNMP_ACL_IPADDRESS_INVALID] = "SNMP Access control IP is invalid",
  [SNMP_ACL_SUBNETMASK_INVALID] = "SNMP Access control subnetmask is invalid",
  [SNMP_SYSINFO_CONTACT_LENINVALID] = "SNMP system contact is invalid",
  [SNMP_SYSINFO_LOCATION_LENINVALID] = "system location is invalid",
  [SNMP_SYSINFO_NAME_LENINVALID] = "system name is invalid",
  [SNMP_TRAP_IPADDRESS_INVALID] = "SNMP Trap IP is invalid",
  [SNMP_TRAP_PORT_INVALID] = "SNMP Trap port is invalid",
  [SNMP_USER_AUTHPWD_INVALID] = "SNMP User Auth password is invalid(Length should be atleast 16)",
  [SNMP_USER_PRIVACYPWD_INVALID] = "SNMP User Privacy password is invalid(Length should be atleat 8)",
  [MD5_AUTHPWD_INVALID] = "MD5 Auth password is invalid(Length must be 16)",
  [SHA1_AUTHPWD_INVALID] = "SHA1 Auth password is invalid(Length must be 20)",
  [DES_PRIVACYPWD_INVALID] = "DES Privacy password is invalid(Length must be 8)",
  [AES_PRIVACYPWD_INVALID] = "AES Privacy password is invalid(Length must be 16)",
  [ENTRY_ALREADY_EXIST] = "Entry is already exist in the table",
  [SNMP_ACCESS_NOT_ALLOWED] = "Entry already exists in access control list"
}
