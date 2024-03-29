local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.powersetting", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/powersetting_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function powerSettingGet()
  local L0_1, L1_2, L2_3
  L0_1, L1_2, L2_3 = _UPVALUE0_.powersettingGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in configuring values in powerAlgorithm page" .. L0_1)
    return _UPVALUE1_.FAILURE
  end
  return L0_1, L1_2, L2_3
end
function powerSettingConfig(A0_4)
  local L1_5, L2_6, L3_7
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for discoveredVlans page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L2_6 = A0_4.poweradjustmentMode
  L3_7 = A0_4.powerInterval
  if L2_6 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L2_6 = tonumber(L2_6)
  if L3_7 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L3_7 = tonumber(L3_7)
  L1_5 = _UPVALUE1_.powersettingSet(L2_6, L3_7)
  if L1_5 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in powerAlgorithm page" .. L1_5)
    return _UPVALUE0_.FAILURE
  end
  return L1_5
end
