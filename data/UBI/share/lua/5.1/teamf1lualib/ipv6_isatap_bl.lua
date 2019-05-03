local L0_0
L0_0 = module
L0_0("com.teamf1.bl.ipv6.isatap", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/ipv6_isatap")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.ipv6.isatap")
function isatapTunnelsSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
  L0_1 = _UPVALUE0_
  L0_1 = L0_1.tunnelGet
  L4_5 = L0_1()
  L5_6 = _UPVALUE1_
  L5_6 = L5_6.SUCCESS
  if L0_1 ~= L5_6 then
    return L0_1
  end
  L5_6 = tonumber
  L5_6 = L5_6(L3_4)
  if L5_6 == 0 then
    L3_4 = "2"
  end
  L5_6 = {}
  L5_6["isatapTunnels.prefix"] = L2_3
  L5_6["isatapTunnels.useLanAsEndpoint"] = L3_4
  L5_6["isatapTunnels.endPointAddr"] = L4_5
  return L0_1, L1_2, L5_6
end
function isatapTunnelsSectionGetNext(A0_7)
  local L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14
  L1_8 = A0_7["isatapTunnels.cookie"]
  if L1_8 == nil then
    L2_9 = util
    L2_9 = L2_9.appendDebugOut
    L3_10 = "Delete : Invalid Cookie"
    L2_9(L3_10)
    L2_9 = _UPVALUE0_
    L2_9 = L2_9.BAD_PARAMETER
    return L2_9
  end
  L2_9 = _UPVALUE1_
  L2_9 = L2_9.tunnelGetNext
  L3_10 = L1_8
  L6_13 = L2_9(L3_10)
  L7_14 = _UPVALUE0_
  L7_14 = L7_14.SUCCESS
  if L2_9 ~= L7_14 then
    return L2_9
  end
  L7_14 = tonumber
  L7_14 = L7_14(L5_12)
  if L7_14 == 0 then
    L5_12 = "2"
  end
  L7_14 = {}
  L7_14["isatapTunnels.prefix"] = L4_11
  L7_14["isatapTunnels.useLanAsEndpoint"] = L5_12
  L7_14["isatapTunnels.endPointAddr"] = L6_13
  return L2_9, L3_10, L7_14
end
function isatapTunnelsSectionGetCur(A0_15)
  local L1_16, L2_17, L3_18, L4_19, L5_20, L6_21
  if A0_15 == nil then
    L1_16 = util
    L1_16 = L1_16.appendDebugOut
    L2_17 = "Delete : Invalid Cookie"
    L1_16(L2_17)
    L1_16 = _UPVALUE0_
    L1_16 = L1_16.BAD_PARAMETER
    return L1_16
  end
  L1_16 = _UPVALUE1_
  L1_16 = L1_16.tunnelGetCur
  L2_17 = A0_15
  L5_20 = L1_16(L2_17)
  L6_21 = _UPVALUE0_
  L6_21 = L6_21.SUCCESS
  if L1_16 ~= L6_21 then
    return L1_16
  end
  L6_21 = tonumber
  L6_21 = L6_21(L4_19)
  if L6_21 == 0 then
    L4_19 = "2"
  end
  L6_21 = {}
  L6_21["isatapTunnels.prefix"] = L3_18
  L6_21["isatapTunnels.useLanAsEndpoint"] = L4_19
  L6_21["isatapTunnels.endPointAddr"] = L5_20
  return L1_16, L2_17, L6_21
end
function isatapTunnelsSectionSet(A0_22)
  local L1_23, L2_24, L3_25, L4_26, L5_27, L6_28
  L3_25 = ACCESS_LEVEL
  if L3_25 ~= 0 then
    L3_25 = util
    L3_25 = L3_25.appendDebugOut
    L4_26 = "Detected Unauthorized access for page isatapTunnels"
    L3_25(L4_26)
    L3_25 = _UPVALUE0_
    L3_25 = L3_25.UNAUTHORIZED
    return L3_25
  end
  L3_25 = A0_22["isatapTunnels.cookie"]
  L4_26 = A0_22["isatapTunnels.prefix"]
  L5_27 = A0_22["isatapTunnels.useLanAsEndpoint"]
  L6_28 = A0_22["isatapTunnels.endPointAddr"]
  if L3_25 == nil then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L4_26 == nil or L5_27 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if tonumber(L5_27) == 2 then
    L5_27 = 0
  end
  _UPVALUE1_.start()
  L1_23, L2_24 = _UPVALUE2_.tunnelSet(L3_25, L4_26, L5_27, L6_28)
  if L1_23 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page isatapTunnels" .. L1_23)
    _UPVALUE1_.abort()
    return L1_23, L3_25
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L2_24
end
function isatapTunnelsSectionCreate(A0_29)
  local L1_30, L2_31, L3_32, L4_33, L5_34
  L3_32 = ACCESS_LEVEL
  if L3_32 ~= 0 then
    L3_32 = util
    L3_32 = L3_32.appendDebugOut
    L4_33 = "Detected Unauthorized access for page isatapTunnels"
    L3_32(L4_33)
    L3_32 = _UPVALUE0_
    L3_32 = L3_32.UNAUTHORIZED
    return L3_32
  end
  L3_32 = A0_29["isatapTunnels.prefix"]
  L4_33 = A0_29["isatapTunnels.useLanAsEndpoint"]
  L5_34 = A0_29["isatapTunnels.endPointAddr"]
  if L3_32 == nil or L4_33 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if tonumber(L4_33) == 2 then
    L4_33 = 0
  end
  _UPVALUE1_.start()
  L1_30, L2_31 = _UPVALUE2_.tunnelCreate(L3_32, L4_33, L5_34)
  if L1_30 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page isatapTunnels" .. L1_30)
    _UPVALUE1_.abort()
    return L1_30, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L2_31
end
function isatapTunnelsSectionDelete(A0_35)
  local L1_36, L2_37
  L2_37 = ACCESS_LEVEL
  if L2_37 ~= 0 then
    L2_37 = util
    L2_37 = L2_37.appendDebugOut
    L2_37("Detected Unauthorized access for page isatapTunnels")
    L2_37 = _UPVALUE0_
    L2_37 = L2_37.UNAUTHORIZED
    return L2_37
  end
  L2_37 = A0_35["isatapTunnels.cookie"]
  if L2_37 == nil then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L1_36, cookie = _UPVALUE2_.tunnelDelete(L2_37)
  if L1_36 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page isatapTunnels" .. L1_36)
    _UPVALUE1_.abort()
    return L1_36, L2_37
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function isatapTunnelsSectionGetAll()
  local L0_38, L1_39
  L0_38 = _UPVALUE0_
  L0_38 = L0_38.isatapTunnelsGetAll
  L1_39 = L0_38()
  if L0_38 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in GetAll Operaion in page isatapTunnels" .. L0_38)
    return L0_38
  end
  for _FORV_5_, _FORV_6_ in pairs(L1_39) do
    if L1_39.useLanAddress == 0 then
      L1_39[""] = "2"
    end
  end
  return _UPVALUE1_.SUCCESS, L1_39
end
function isatapTunnelsSectionDeleteAll(A0_40)
  local L1_41, L2_42, L3_43, L4_44, L5_45
  if L1_41 ~= 0 then
    L1_41(L2_42)
    return L1_41
  end
  if A0_40 == nil then
    return L1_41
  end
  L1_41()
  for L4_44, L5_45 in L1_41(L2_42) do
    returnCode, cookie = _UPVALUE2_.tunnelDelete(L5_45)
    if returnCode ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in Delete Operaion in page isatapTunnels" .. returnCode)
      _UPVALUE1_.abort()
      return returnCode
    end
  end
  L1_41()
  L1_41()
  return L1_41
end
