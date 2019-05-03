module("com.teamf1.core.usb_returnCodes", package.seeall)
USB_RETURN_CODE_START = 9900000
PRINTER_SHARING_NOT_ENABLED = USB_RETURN_CODE_START + 1
SHAREPORT_INTERFACE_CHECK = PRINTER_SHARING_NOT_ENABLED + 1
USB_NOT_CONNECTED = SHAREPORT_INTERFACE_CHECK + 1
INVALID_FIRMWARE = USB_NOT_CONNECTED + 1
FIRMWARE_MISMATCH = INVALID_FIRMWARE + 1
FIRMWARE_SUCCESS = FIRMWARE_MISMATCH + 1
PRINTER_NOT_CONNECTED = FIRMWARE_SUCCESS + 1
UPGRADE_DENIED = PRINTER_NOT_CONNECTED + 1
UNMOUNT_FAILED = UPGRADE_DENIED + 1
UNMOUNT_SUCCESSFUL = UNMOUNT_FAILED + 1
returnCodesToString = {
  [USB_RETURN_CODE_START] = "Unkown error occured",
  [PRINTER_SHARING_NOT_ENABLED] = "Printer sharing cannot be disabled when sharing is enabled on interface(s)",
  [SHAREPORT_INTERFACE_CHECK] = "At least one interface should be selected when Sharing is enabled",
  [USB_NOT_CONNECTED] = "Usb not connected",
  [INVALID_FIRMWARE] = "Firmware file invalid or corrupted",
  [FIRMWARE_MISMATCH] = "The RU firmware is NOT available to be installed in Non-Russian version machine, please use correct firmware version for your devices",
  [FIRMWARE_SUCCESS] = "Firmware Upgrade is in progress",
  [PRINTER_NOT_CONNECTED] = "Connect at least one printer to configure USB Share Ports",
  [UPGRADE_DENIED] = "Firmware is NOT available to be installed in NON-Supported Hardware machine, please use correct firmware version for your devices.",
  [UNMOUNT_FAILED] = "Unmount failed",
  [UNMOUNT_SUCCESSFUL] = "USB successfully unmounted"
}
