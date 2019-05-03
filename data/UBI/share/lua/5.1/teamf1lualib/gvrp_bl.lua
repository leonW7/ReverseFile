local L0_0
L0_0 = module
L0_0("com.teamf1.bl.vlan.gvrp", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vlan_gvrp")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
ENABLE = "1"
function gvrpFeatureStatusGet()
  local L0_1, L1_2, L2_3
  L0_1, L1_2, L2_3 = _UPVALUE0_.isfeatureEnabled()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3
end
function gvrpFeatureStatusSet(A0_4)
  local L1_5, L2_6, L3_7, L4_8
  L1_5 = ACCESS_LEVEL
  if L1_5 ~= 0 then
    L1_5 = util
    L1_5 = L1_5.appendDebugOut
    L2_6 = "Detected Unauthorized access for page gvrp"
    L1_5(L2_6)
    L1_5 = _UPVALUE0_
    L1_5 = L1_5.UNAUTHORIZED
    return L1_5
  end
  L1_5 = A0_4["gvrp.cookie"]
  L2_6 = A0_4["gvrp.gvrpConfig"]
  if L1_5 == nil then
    L3_7 = util
    L3_7 = L3_7.appendDebugOut
    L4_8 = "Set : Invalid Cookie"
    L3_7(L4_8)
    L3_7 = _UPVALUE0_
    L3_7 = L3_7.BAD_PARAMETER
    return L3_7
  end
  if L2_6 == nil then
    L3_7 = util
    L3_7 = L3_7.appendDebugOut
    L4_8 = "GetNext : Invalid Cookie"
    L3_7(L4_8)
    L3_7 = _UPVALUE0_
    L3_7 = L3_7.BAD_PARAMETER
    return L3_7
  end
  L3_7, L4_8 = nil, nil
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page gvrp")
    return _UPVALUE0_.UNAUTHORIZED
  end
  _UPVALUE1_.start()
  if L2_6 == ENABLE then
    L3_7, L4_8 = _UPVALUE2_.featureEnableSet(L1_5)
  else
    L3_7, L4_8 = _UPVALUE2_.featureDisableSet(L1_5)
  end
  if L3_7 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page gvrp" .. L3_7)
    _UPVALUE1_.abort()
    return L3_7, L1_5
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L3_7, L4_8
end
