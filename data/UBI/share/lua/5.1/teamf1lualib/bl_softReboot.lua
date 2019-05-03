local L0_0
L0_0 = module
L0_0("com.teamf1.bl.system.actions", package.seeall)
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
L0_0 = L0_0("com.teamf1.core.system.actions")
function rebootStatusSet(A0_1)
  local L1_2, L2_3
  L1_2 = ACCESS_LEVEL
  if L1_2 ~= 0 then
    L1_2 = util
    L1_2 = L1_2.appendDebugOut
    L2_3 = "Detected unauthorized access for softReboot page"
    L1_2(L2_3)
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.UNAUTHORIZED
    return L1_2
  end
  L1_2 = A0_1["softReboot.reboot"]
  L2_3 = "1"
  if L1_2 ~= "start" and L1_2 ~= "stop" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if L1_2 == _UPVALUE0_.NIL then
    util.appenDebugOut("GetNext : Invalid reboot status ")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.rebootSet(L2_3, L1_2)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in softReboot page" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  return returnCode, cookie
end
function factoryDefaultSet(A0_4)
  local L1_5, L2_6
  L1_5 = ACCESS_LEVEL
  if L1_5 ~= 0 then
    L1_5 = util
    L1_5 = L1_5.appendDebugOut
    L2_6 = "Detected unauthorized access for softReboot page"
    L1_5(L2_6)
    L1_5 = _UPVALUE0_
    L1_5 = L1_5.UNAUTHORIZED
    return L1_5
  end
  L1_5 = A0_4["softReboot.default"]
  L2_6 = DEFINED_1
  if L1_5 ~= "start" and L1_5 ~= "stop" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if L1_5 == _UPVALUE0_.NIL then
    util.appenDebugOut("GetNext : Invalid reboot status ")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.factoryResetSet(L2_6, L1_5)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in softReboot page" .. tostring(returnCode))
    _UPVALUE1_.abort()
    return returnCode, cookie
  end
  _UPVALUE1_.complete()
  return returnCode, cookie
end
function systemBootTimeGet()
  local L0_7, L1_8
  L0_7, L1_8 = _UPVALUE0_.bootupTimeGet()
  if L0_7 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in softReboot page" .. L0_7)
    _UPVALUE2_.abort()
    return L0_7
  end
  return L0_7, L1_8
end
