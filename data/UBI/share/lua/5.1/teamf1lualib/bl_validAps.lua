local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.validap", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/validaps_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).macAddress = 1
;({}).location = 2
;({}).status = 3
;({}).profileId = 4
;({}).profileName = 5
function validApsGet()
  local L0_1, L1_2, L2_3, L3_4
  L2_3 = {}
  L3_4 = 1
  L0_1, L1_2 = _UPVALUE0_.validapsGet()
  if L0_1 == _UPVALUE1_.FAILURE then
    util.appendDebugOut("Error in Getting values for the validAps page" .. L0_1)
    return L0_1
  end
  for _FORV_7_, _FORV_8_ in pairs(L1_2) do
    L2_3[L3_4] = {}
    for _FORV_12_, _FORV_13_ in pairs(_UPVALUE2_) do
      L2_3[L3_4][_FORV_12_] = _FORV_8_[_FORV_13_]
    end
    L3_4 = L3_4 + 1
  end
  return L0_1, L2_3
end
function validApDelete(A0_5)
  local L1_6, L2_7, L3_8
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for validAps page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L2_7 = A0_5.cookie
  if L2_7 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_6 = _UPVALUE1_.validapsDelete(L2_7)
  if L1_6 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Getting values for the validAps page" .. L1_6)
    return L1_6
  end
  return L1_6
end
function validApDeleteAll()
  local L0_9, L1_10, L2_11
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for validAps page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L0_9 = _UPVALUE1_.validapsDeleteAll()
  if L0_9 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Getting values for the validAps page" .. L0_9)
    return L0_9
  end
  return L0_9
end
