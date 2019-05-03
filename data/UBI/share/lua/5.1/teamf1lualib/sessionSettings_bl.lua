local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/login_sessionSettings")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function sessionSettingsGet()
  local L0_1
  L0_1, adminTimeout, guestTimeout = _UPVALUE0_.sessionSettingsGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, adminTimeout, guestTimeout
end
function sessionSettingsSet(A0_2)
  local L1_3, L2_4, L3_5
  L1_3 = ACCESS_LEVEL
  if L1_3 ~= 0 then
    L1_3 = util
    L1_3 = L1_3.appendDebugOut
    L2_4 = "Detected Unauthorized access for page routingMode"
    L1_3(L2_4)
    L1_3 = _UPVALUE0_
    L1_3 = L1_3.UNAUTHORIZED
    return L1_3
  end
  L1_3 = A0_2["SessionSettings.adminTimeout"]
  L2_4 = A0_2["SessionSettings.guestTimeout"]
  L3_5 = _UPVALUE0_
  L3_5 = L3_5.NIL
  if L1_3 ~= L3_5 then
    L3_5 = _UPVALUE0_
    L3_5 = L3_5.NIL
  elseif L2_4 == L3_5 then
    L3_5 = util
    L3_5 = L3_5.appendDebugOut
    L3_5("Set : Invalid Cookie")
    L3_5 = _UPVALUE0_
    L3_5 = L3_5.BAD_PARAMETER
    return L3_5
  end
  L3_5 = nil
  _UPVALUE1_.start()
  L3_5 = _UPVALUE2_.sessionSettingsSet(L1_3, L2_4)
  if L3_5 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page sessionSettings" .. L3_5)
    _UPVALUE1_.abort()
    return L3_5
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
