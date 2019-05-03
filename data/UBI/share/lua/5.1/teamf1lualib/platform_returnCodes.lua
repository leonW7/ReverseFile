module("com.teamf1.core.platform.returnCodes", package.seeall)
INVALID_PORT_NUMBER = 302055424
INVALID_FROM_IPADDRESS = INVALID_PORT_NUMBER + 1
INVALID_TO_IPADDRESS = INVALID_FROM_IPADDRESS + 1
INVALID_SELECTEDPC_IPADDRESS = INVALID_TO_IPADDRESS + 1
INVALID_FILE = INVALID_SELECTEDPC_IPADDRESS + 1
HTTPS_PORT_INVALID = INVALID_FILE + 1
CONFIG_CHECKSUM_FAILED = HTTPS_PORT_INVALID + 1
OPEN_PORT = CONFIG_CHECKSUM_FAILED + 1
FILE_SIZE_MORE_THAN_2MB = OPEN_PORT + 1
BOOT_NOT_COMPLETE = FILE_SIZE_MORE_THAN_2MB
returnCodesToString = {
  [INVALID_PORT_NUMBER] = "Invalid port number",
  [INVALID_FROM_IPADDRESS] = "Invalid value in From IP Address field",
  [INVALID_TO_IPADDRESS] = "Invalid value in To IP Address field",
  [INVALID_SELECTEDPC_IPADDRESS] = "Invalid value in Selected PC IP Address field",
  [INVALID_FILE] = "Invalid file",
  [HTTPS_PORT_INVALID] = "Can not use reserved HTTP port",
  [CONFIG_CHECKSUM_FAILED] = "Checksum failed",
  [OPEN_PORT] = "Port is already open.Please configure a different port.",
  [FILE_SIZE_MORE_THAN_2MB] = "Unable to upload the configuration, file size is more than 2 MB.",
  [BOOT_NOT_COMPLETE] = "Router initializing after reboot, please wait ..."
}
