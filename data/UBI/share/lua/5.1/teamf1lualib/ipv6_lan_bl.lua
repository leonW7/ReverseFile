local L0_0
L0_0 = module
L0_0("com.teamf1.bl.ipv6.lan", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/ipv6_lan")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = {}
modeMap = L0_0
L0_0 = modeMap
L0_0.stateless = "1"
L0_0 = modeMap
L0_0.stateful = "0"
L0_0 = {}
modeValMap = L0_0
L0_0 = modeValMap
L0_0["1"] = "stateless"
L0_0 = modeValMap
L0_0["0"] = "stateful"
L0_0 = require
L0_0 = L0_0("com.teamf1.core.ipv6.lan")
function ipv6LanSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14
  L13_14 = _UPVALUE0_
  L13_14 = L13_14.prefixGrpGet
  L1_2, L2_3, L3_4, L13_14 = nil, nil, nil, L13_14()
  L0_1 = L13_14
  L13_14 = _UPVALUE1_
  L13_14 = L13_14.SUCCESS
  if L0_1 ~= L13_14 then
    return L0_1
  end
  L13_14 = _UPVALUE0_
  L13_14 = L13_14.lanGet
  L1_2, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14 = L13_14()
  L0_1 = L13_14
  L13_14 = _UPVALUE1_
  L13_14 = L13_14.SUCCESS
  if L0_1 ~= L13_14 then
    return L0_1
  end
  L13_14 = {}
  L13_14["ipv6LanSettings.prefix"] = L2_3
  L13_14["ipv6LanSettings.prefixLength"] = L3_4
  L13_14["ipv6LanSettings.dhcpServer"] = L4_5
  L13_14["ipv6LanSettings.dhcpServerMode"] = L5_6
  L13_14["ipv6LanSettings.dhcpDomainName"] = L6_7
  L13_14["ipv6LanSettings.dhcpServerPreference"] = L7_8
  L13_14["ipv6LanSettings.dhcpServerDnsType"] = L8_9
  L13_14["ipv6LanSettings.primaryDnsServer"] = L9_10
  L13_14["ipv6LanSettings.secondaryDnsServer"] = L10_11
  L13_14["ipv6LanSettings.leaseTime"] = L11_12
  L13_14["ipv6LanSettings.prefixDelegation"] = L12_13
  return L0_1, L1_2, L13_14
end
function ipv6LanSectionSet(A0_15)
  local L1_16, L2_17, L3_18, L4_19, L5_20, L6_21, L7_22, L8_23, L9_24, L10_25, L11_26, L12_27, L13_28
  L3_18 = ACCESS_LEVEL
  if L3_18 ~= 0 then
    L3_18 = util
    L3_18 = L3_18.appendDebugOut
    L4_19 = "Detected Unauthorized access for page ipv6LanSettings.html"
    L3_18(L4_19)
    L3_18 = _UPVALUE0_
    L3_18 = L3_18.UNAUTHORIZED
    return L3_18
  end
  L3_18 = A0_15["ipv6LanSettings.prefix"]
  L4_19 = A0_15["ipv6LanSettings.prefixLength"]
  L5_20 = A0_15["ipv6LanSettings.dhcpServer"]
  L6_21 = A0_15["ipv6LanSettings.dhcpServerMode"]
  L7_22 = A0_15["ipv6LanSettings.dhcpDomainName"]
  L8_23 = A0_15["ipv6LanSettings.dhcpServerPreference"]
  L9_24 = A0_15["ipv6LanSettings.dhcpServerDnsType"]
  L10_25 = A0_15["ipv6LanSettings.primaryDnsServer"]
  L11_26 = A0_15["ipv6LanSettings.secondaryDnsServer"]
  L12_27 = A0_15["ipv6LanSettings.leaseTime"]
  L13_28 = A0_15["ipv6LanSettings.prefixDelegation"]
  if tonumber(L5_20) == 1 and (L6_21 == nil or L8_23 == nil or L9_24 == nil or L12_27 == nil or L13_28 == nil) then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L1_16, L2_17 = _UPVALUE2_.prefixGrpSet(L3_18, L4_19)
  if L1_16 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page ipv6LanSettings" .. L1_16)
    _UPVALUE1_.abort()
    return L1_16, L2_17
  end
  L1_16, L2_17 = _UPVALUE2_.lanSet(L5_20, L6_21, L7_22, L8_23, L9_24, L10_25, L11_26, L12_27, L13_28)
  if L1_16 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page ipv6LanSettings" .. L1_16)
    _UPVALUE1_.abort()
    return L1_16, L2_17
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L2_17
end
