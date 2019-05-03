local L0_0
L0_0 = module
L0_0("com.teamf1.bl.ipv6.sixToFour", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/ipv6_6to4")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.ipv6.sixToFour")
function isSixToFourEnabledGet()
  local L0_1, L1_2, L2_3
  L0_1 = _UPVALUE0_
  L0_1 = L0_1.isfeatureEnabled
  L2_3 = L0_1()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3
end
function sixToFourFeatureSet(A0_4)
  local L1_5, L2_6, L3_7
  L3_7 = ACCESS_LEVEL
  if L3_7 ~= 0 then
    L3_7 = util
    L3_7 = L3_7.appendDebugOut
    L3_7("Detected Unauthorized access for page ipv6ToIpv4")
    L3_7 = _UPVALUE0_
    L3_7 = L3_7.UNAUTHORIZED
    return L3_7
  end
  L3_7 = A0_4["sixToFourTunnel.tunnelStatus"]
  if L3_7 == nil then
    util.appendDebugOut("Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  if tonumber(L3_7) == 1 then
    L1_5, L2_6 = _UPVALUE2_.featureEnable()
  end
  if tonumber(L3_7) == 0 then
    L1_5, L2_6 = _UPVALUE2_.featureDisable()
  end
  if L1_5 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page ipv6ToIpv4" .. L1_5)
    _UPVALUE1_.abort()
    return L1_5, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L2_6
end
