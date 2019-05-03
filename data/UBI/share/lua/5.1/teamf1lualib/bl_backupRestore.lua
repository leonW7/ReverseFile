local L0_0
L0_0 = module
L0_0("com.teamf1.bl.system.actionbackup", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/system_actions")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/usb_status")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.system.actions")
function restoreSet(A0_1)
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected unauthorized access for backupRestore ")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_1["backupRestore.filename"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  if A0_1["backupRestore.restoreStatus"] == _UPVALUE0_.NIL then
    util.appenDebugOut("GetNext : Invalid reboot status ")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if A0_1["backupRestore.restoreStatus"] ~= "pc" and A0_1["backupRestore.restoreStatus"] ~= "usb1" and A0_1["backupRestore.restoreStatus"] ~= "usb2" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.restoreConfigSet(A0_1)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in backupRestore " .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  return returnCode, cookie
end
function backupSet(A0_2)
  local L1_3, L2_4
  L1_3 = ACCESS_LEVEL
  if L1_3 ~= 0 then
    L1_3 = util
    L1_3 = L1_3.appendDebugOut
    L2_4 = "Detected unauthorized access for backupRestore "
    L1_3(L2_4)
    L1_3 = _UPVALUE0_
    L1_3 = L1_3.UNAUTHORIZED
    return L1_3
  end
  L1_3 = A0_2["backupRestore.backupStatus"]
  L2_4 = _UPVALUE0_
  L2_4 = L2_4.NIL
  if L1_3 == L2_4 then
    L2_4 = util
    L2_4 = L2_4.appenDebugOut
    L2_4("GetNext : Invalid backup status ")
    L2_4 = _UPVALUE0_
    L2_4 = L2_4.BAD_PARAMETER
    return L2_4
  end
  if L1_3 ~= "pc" and L1_3 ~= "usb1" and L1_3 ~= "usb2" then
    L2_4 = _UPVALUE0_
    L2_4 = L2_4.INVALID_ARGUMENT
    return L2_4
  end
  L2_4 = "start"
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.backupConfigSet(L1_3, L2_4)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in backupRestore page" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  return returnCode, cookie
end
function usb1StatusGet()
  local L0_5
  returnCode, cookie, L0_5 = _UPVALUE0_.connectionStatusGet(usbPort)
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, cookie, L0_5
end
function usb2StatusGet()
  local L0_6
  returnCode, cookie, L0_6 = _UPVALUE0_.connectionStatusGetNext()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, cookie, L0_6
end
function fileSizeCheck(A0_7)
  local L1_8, L2_9
  L1_8 = _UPVALUE0_
  L1_8 = L1_8.fileSizeGet
  L2_9 = A0_7
  L2_9 = L1_8(L2_9)
  return L1_8, L2_9
end
