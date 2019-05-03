local L0_0
L0_0 = module
L0_0("com.teamf1.bl.ipv6.mode", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/ipv6_mode")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/system_actions")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.ipv6.mode")
function ipModeSectionGet()
  local L0_1, L1_2, L2_3, L3_4
  L0_1 = _UPVALUE0_
  L0_1 = L0_1.ipv6ModeGet
  L3_4 = L0_1()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3, L3_4
end
function ipModeSectionSet(A0_5)
  local L1_6, L2_7, L3_8
  L1_6 = ACCESS_LEVEL
  if L1_6 ~= 0 then
    L1_6 = util
    L1_6 = L1_6.appendDebugOut
    L2_7 = "Detected Unauthorized access for page ipMode"
    L1_6(L2_7)
    L1_6 = _UPVALUE0_
    L1_6 = L1_6.UNAUTHORIZED
    return L1_6
  end
  L1_6 = _UPVALUE1_
  L1_6 = L1_6.start
  L1_6()
  L1_6 = A0_5["ipMode.ipv6Mode"]
  L2_7 = _UPVALUE2_
  L2_7 = L2_7.ipv6ModeSet
  L3_8 = L1_6
  L3_8 = L2_7(L3_8)
  if L2_7 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page openVpnLocalNetworks" .. L2_7)
    _UPVALUE1_.abort()
    return L2_7, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L3_8
end
