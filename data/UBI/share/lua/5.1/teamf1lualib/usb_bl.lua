local L0_0
L0_0 = module
L0_0("com.teamf1.bl.system.maintenance", package.seeall)
L0_0 = require
L0_0("upgradeFileCheck")
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/system_maintenance")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/usb_returnCodes")
L0_0 = require
L0_0("teamf1lualib/usb_status")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function usbFirmwareUpgrade(A0_1)
  local L1_2, L2_3, L3_4
  L1_2 = "1"
  L2_3 = A0_1["usb.filename"]
  L3_4 = A0_1["usb.usbStatus"]
  if L2_3 == nil or L3_4 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  returnCode, cookie = _UPVALUE1_.upgradeViaUSBSet(cookie, L2_3, L3_4)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page usb" .. returnCode)
    return returnCode, cookie
  end
  return returnCode, cookie
end
function usbFirmwareCheck(A0_5)
  local L1_6, L2_7, L3_8
  L1_6 = A0_5["usb.filename"]
  L2_7 = A0_5["usb.usbStatus"]
  if L1_6 == nil or L2_7 == nil then
    L3_8 = util
    L3_8 = L3_8.appendDebugOut
    L3_8("GetNext : Invalid Cookie")
    L3_8 = _UPVALUE0_
    L3_8 = L3_8.BAD_PARAMETER
    return L3_8
  end
  L3_8 = db
  L3_8 = L3_8.getAttribute
  L3_8 = L3_8("unitInfo", "_ROWID_", "1", "hardwareVersion")
  returnCode = upgradeFileCheck.firmwareCheck("/" .. L2_7 .. "/" .. L1_6, UNIT_NAME, L3_8)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in usb.html page" .. returnCode)
    if returnCode == -1 then
      return _UPVALUE1_.INVALID_FIRMWARE
    elseif returnCode == 2 then
      return _UPVALUE1_.FIRMWARE_MISMATCH
    else
      return returnCode
    end
  end
  return _UPVALUE1_.FIRMWARE_SUCCESS, cookie
end
function usb1StatusGet()
  local L0_9
  returnCode, cookie, L0_9 = _UPVALUE0_.connectionStatusGet(usbPort)
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, cookie, L0_9
end
function usb2StatusGet()
  local L0_10
  returnCode, cookie, L0_10 = _UPVALUE0_.connectionStatusGetNext()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, cookie, L0_10
end
function usbFileList1Get()
  local L0_11, L1_12
  L0_11, L1_12 = _UPVALUE0_.usb1FileListGet()
  if L0_11 ~= _UPVALUE1_.SUCCESS then
    return L0_11
  end
  return L0_11, L1_12
end
function usbFileList2Get()
  local L0_13, L1_14
  L0_13, L1_14 = _UPVALUE0_.usb2FileListGet()
  if L0_13 ~= _UPVALUE1_.SUCCESS then
    return L0_13
  end
  return L0_13, L1_14
end
