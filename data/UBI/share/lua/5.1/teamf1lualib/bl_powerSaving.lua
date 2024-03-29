local L0_0
L0_0 = module
L0_0("com.teamf1.bl.system.management", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/system_management")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).powerMode = "PowerMode"
;({}).lengthMode = "LengthMode"
;({}).cookie = "cookie"
function powerSavingValueSet(A0_1)
  local L1_2, L2_3, L3_4
  L1_2 = ACCESS_LEVEL
  if L1_2 ~= 0 then
    L1_2 = util
    L1_2 = L1_2.appendDebugOut
    L2_3 = "Detected unauthorized access for powerSaving"
    L1_2(L2_3)
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.UNAUTHORIZED
    return L1_2
  end
  L1_2 = A0_1["powerSaving.cookie"]
  L2_3 = A0_1["powerSaving.PowerMode"]
  L3_4 = A0_1["powerSaving.LengthMode"]
  if L1_2 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L2_3 == _UPVALUE0_.NIL then
    util.appendDebugOut("set : Invalid packet link status ")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L3_4 == _UPVALUE0_.NIL then
    util.appendDebugOut("set : Invalid packet cable LengthDetectionStatus")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.powerSaveValueSet(L1_2, L2_3, L3_4)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in power Saving page" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
function powerSavingValueGet()
  local L0_5, L1_6, L2_7, L3_8
  L0_5, L1_6, L2_7, L3_8 = _UPVALUE0_.powerSavingStatusGet()
  if L0_5 ~= _UPVALUE1_.SUCCESS then
    return L0_5
  end
  return L0_5, L1_6, L2_7, L3_8
end
