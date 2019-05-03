module("com.teamf1.core.radiusAccounting_returnCodes", package.seeall)
COMP_RAD_ACC_START = 9177058398
MAXIMUM_ACCOUNTING_SERVERS_LIMIT_REACHED = COMP_RAD_ACC_START + 1
IP_ADDRESS_ALREADY_CONFIGURED_PLEASE_CHANGE_THE_SERVER_IP_ADDRESS = MAXIMUM_ACCOUNTING_SERVERS_LIMIT_REACHED + 1
SERVER_NAME_ALREADY_CONFIGURED_PLEASE_CHANGE_THE_SERVER_NAME = IP_ADDRESS_ALREADY_CONFIGURED_PLEASE_CHANGE_THE_SERVER_IP_ADDRESS + 1
RADIUS_ACCOUNTING_CONFIGURATION_FAILED = SERVER_NAME_ALREADY_CONFIGURED_PLEASE_CHANGE_THE_SERVER_NAME + 1
DEFAULT_ACCOUNTING_SERVER_CANT_BE_DELETED = RADIUS_ACCOUNTING_CONFIGURATION_FAILED + 1
COMP_RAD_ACC_END = 9177058500
returnCodesToString = {
  [MAXIMUM_ACCOUNTING_SERVERS_LIMIT_REACHED] = " Maximum Accounting servers limit reached.",
  [IP_ADDRESS_ALREADY_CONFIGURED_PLEASE_CHANGE_THE_SERVER_IP_ADDRESS] = "IP Address already configured.Please change the server IP address.",
  [SERVER_NAME_ALREADY_CONFIGURED_PLEASE_CHANGE_THE_SERVER_NAME] = "Server Name already configured.Please change the server Name.",
  [RADIUS_ACCOUNTING_CONFIGURATION_FAILED] = "RADIUS Accounting configuration failed.",
  [DEFAULT_ACCOUNTING_SERVER_CANT_BE_DELETED] = "Default Accounting Server can not be deleted."
}
