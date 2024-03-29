local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/fwLogging")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function ipv6LogsGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7
  L6_7 = {}
  L0_1, L1_2, L2_3, L3_4, L4_5, L5_6 = fw.core.firewallLogs.Ipv6.Get()
  if L0_1 ~= _UPVALUE0_.SUCCESS then
    return L0_1, L1_2, L6_7
  end
  L6_7["ipv6Logs.lanToWanAccepted"] = L2_3
  L6_7["ipv6Logs.lanToWanDropped"] = L3_4
  L6_7["ipv6Logs.wanToLanAccepted"] = L4_5
  L6_7["ipv6Logs.wanToLanDropped"] = L5_6
  return L0_1, L1_2, L6_7
end
function ipv6LogsGetNext(A0_8)
  return _UPVALUE0_.NOT_SUPPORTED
end
function ipv6LogsSet(A0_9)
  local L1_10, L2_11, L3_12, L4_13, L5_14, L6_15, L7_16
  L1_10 = ACCESS_LEVEL
  if L1_10 ~= 0 then
    L1_10 = util
    L1_10 = L1_10.appendDebugOut
    L2_11 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_10(L2_11)
    L1_10 = _UPVALUE0_
    L1_10 = L1_10.UNAUTHORIZED
    return L1_10
  end
  L1_10 = A0_9["ipv6Logs.cookie"]
  L2_11 = A0_9["ipv6Logs.lanToWanAccepted"]
  L3_12 = A0_9["ipv6Logs.lanToWanDropped"]
  L4_13 = A0_9["ipv6Logs.wanToLanAccepted"]
  L5_14 = A0_9["ipv6Logs.wanToLanDropped"]
  if L1_10 == nil then
    L6_15 = util
    L6_15 = L6_15.appendDebugOut
    L7_16 = "Set : Invalid Cookie"
    L6_15(L7_16)
    L6_15 = _UPVALUE0_
    L6_15 = L6_15.BAD_PARAMETER
    return L6_15
  end
  L6_15, L7_16 = nil, nil
  _UPVALUE1_.start()
  L6_15, L7_16 = fw.core.firewallLogs.Ipv6.edit(L2_11, L3_12, L4_13, L5_14)
  if L6_15 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L6_15)
    _UPVALUE1_.abort()
    return L6_15, L1_10
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L7_16
end
function ipv6LogsDelete(A0_17)
  return _UPVALUE0_.NOT_SUPPORTED
end
function ipv6LogsDefaultsGet()
  local L0_18, L1_19, L2_20, L3_21, L5_22, L6_23, L7_24, L8_25, L9_26
  L0_18 = "0"
  L1_19 = "0"
  L2_20 = "0"
  L3_21 = "0"
  L5_22 = _UPVALUE0_
  L5_22 = L5_22.SUCCESS
  L6_23 = 0
  L7_24 = L0_18
  L8_25 = L1_19
  L9_26 = L2_20
  return L5_22, L6_23, L7_24, L8_25, L9_26, L3_21
end
function ipv6LogsCreate(A0_27)
  return _UPVALUE0_.NOT_SUPPORTED
end
