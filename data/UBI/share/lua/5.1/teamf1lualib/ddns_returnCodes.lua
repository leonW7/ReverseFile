module("com.teamf1.core.ddns.returnCodes", package.seeall)
SERVICE_INVALID = 755040256
SERVER_INVALID = SERVICE_INVALID + 1
USERNAME_INVALID = SERVER_INVALID + 1
DOMAIN_NAME_INVALID = USERNAME_INVALID + 1
WAN_INVALID = DOMAIN_NAME_INVALID + 1
WAN_NOTDEDICATED = WAN_INVALID + 1
returnCodesToString = {
  [SERVICE_INVALID] = "Innvalid service type",
  [SERVER_INVALID] = "Invalid IP Address",
  [USERNAME_INVALID] = "Invalid username",
  [DOMAIN_NAME_INVALID] = "Invalid domain name",
  [WAN_INVALID] = "DDNS should be configured only for primary WAN in Auto-rollOver WAN mode",
  [WAN_NOTDEDICATED] = "DDNS should be configured only for Dedicated WAN in case of Single WAN Port"
}
