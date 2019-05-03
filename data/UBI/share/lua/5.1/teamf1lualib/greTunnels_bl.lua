local L0_0
L0_0 = module
L0_0("com.teamf1.bl.vpn.gre", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vpn_gre")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function greTunnelsSectionSet(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13
  L1_2 = ACCESS_LEVEL
  if L1_2 ~= 0 then
    L1_2 = util
    L1_2 = L1_2.appendDebugOut
    L2_3 = "Detected Unauthorized access for page greTunnels"
    L1_2(L2_3)
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.UNAUTHORIZED
    return L1_2
  end
  L1_2 = A0_1["greTunnels.cookie"]
  L2_3 = A0_1["greTunnels.TunnelName"]
  L3_4 = A0_1["greTunnels.IpAddress"]
  L4_5 = A0_1["greTunnels.SubnetMask"]
  L5_6 = A0_1["greTunnels.InterfaceName"]
  L6_7 = A0_1["greTunnels.RemoteIp"]
  L7_8 = A0_1["greTunnels.DdpBrd"]
  L8_9 = A0_1["greTunnels.DstIpAddr"]
  L9_10 = A0_1["greTunnels.RouteNetMask"]
  L10_11 = A0_1["greTunnels.GwIpAddr"]
  if L1_2 == nil then
    L11_12 = util
    L11_12 = L11_12.appendDebugOut
    L12_13 = "Set : Invalid Cookie"
    L11_12(L12_13)
    L11_12 = _UPVALUE0_
    L11_12 = L11_12.BAD_PARAMETER
    return L11_12
  end
  if L2_3 == nil or L3_4 == nil or L4_5 == nil or L5_6 == nil or L6_7 == nil or L7_8 == nil or L8_9 == nil or L9_10 == nil or L10_11 == nil then
    L11_12 = util
    L11_12 = L11_12.appendDebugOut
    L12_13 = "GetNext : Invalid Cookie"
    L11_12(L12_13)
    L11_12 = _UPVALUE0_
    L11_12 = L11_12.BAD_PARAMETER
    return L11_12
  end
  L11_12, L12_13 = nil, nil
  _UPVALUE1_.start()
  L11_12, L12_13 = _UPVALUE2_.greSet(L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11)
  if L11_12 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page greTunnels" .. L11_12)
    _UPVALUE1_.abort()
    return L11_12, L1_2
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L12_13
end
function greTunnelsSectionCreate(A0_14)
  local L1_15, L2_16, L3_17, L4_18, L5_19, L6_20, L7_21, L8_22, L9_23, L10_24, L11_25
  L1_15 = ACCESS_LEVEL
  if L1_15 ~= 0 then
    L1_15 = util
    L1_15 = L1_15.appendDebugOut
    L2_16 = "Detected Unauthorized access for page greTunnels"
    L1_15(L2_16)
    L1_15 = _UPVALUE0_
    L1_15 = L1_15.UNAUTHORIZED
    return L1_15
  end
  L1_15 = A0_14["greTunnels.TunnelName"]
  L2_16 = A0_14["greTunnels.IpAddress"]
  L3_17 = A0_14["greTunnels.SubnetMask"]
  L4_18 = A0_14["greTunnels.InterfaceName"]
  L5_19 = A0_14["greTunnels.RemoteIp"]
  L6_20 = A0_14["greTunnels.DdpBrd"]
  L7_21 = A0_14["greTunnels.DstIpAddr"]
  L8_22 = A0_14["greTunnels.RouteNetMask"]
  L9_23 = A0_14["greTunnels.GwIpAddr"]
  if L2_16 == nil or L3_17 == nil or L4_18 == nil or L5_19 == nil or L6_20 == nil or L7_21 == nil or L8_22 == nil or L9_23 == nil then
    L10_24 = util
    L10_24 = L10_24.appendDebugOut
    L11_25 = "GetNext : Invalid Cookie"
    L10_24(L11_25)
    L10_24 = _UPVALUE0_
    L10_24 = L10_24.BAD_PARAMETER
    return L10_24
  end
  L10_24, L11_25 = nil, nil
  _UPVALUE1_.start()
  L10_24, L11_25 = _UPVALUE2_.greCreate(L1_15, L2_16, L3_17, L4_18, L5_19, L6_20, L7_21, L8_22, L9_23)
  if L10_24 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page greTunnels" .. L10_24)
    _UPVALUE1_.abort()
    return L10_24, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L11_25
end
function greTunnelsSectionDelete(A0_26)
  local L1_27, L2_28
  L1_27 = ACCESS_LEVEL
  if L1_27 ~= 0 then
    L1_27 = util
    L1_27 = L1_27.appendDebugOut
    L2_28 = "Detected Unauthorized access for page greTunnels"
    L1_27(L2_28)
    L1_27 = _UPVALUE0_
    L1_27 = L1_27.UNAUTHORIZED
    return L1_27
  end
  L1_27 = A0_26["greTunnels.cookie"]
  if L1_27 == nil then
    L2_28 = util
    L2_28 = L2_28.appendDebugOut
    L2_28("Delete : Invalid Cookie")
    L2_28 = _UPVALUE0_
    L2_28 = L2_28.BAD_PARAMETER
    return L2_28
  end
  L2_28 = nil
  _UPVALUE1_.start()
  L2_28, cookie = _UPVALUE2_.greDelete(L1_27)
  if L2_28 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page greTunnels" .. L2_28)
    _UPVALUE1_.abort()
    return L2_28, L1_27
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function greTunnelsSectionGetAll()
  local L0_29, L1_30
  L1_30 = {}
  L0_29, L1_30 = _UPVALUE0_.greGetAll()
  if L1_30 == _UPVALUE1_.NIL then
    L1_30 = {}
  end
  if L0_29 ~= _UPVALUE1_.SUCCESS then
    return L0_29, L1_30
  end
  return L0_29, L1_30
end
function greTunnelsSectionDeleteAll()
  local L0_31
  L0_31 = ACCESS_LEVEL
  if L0_31 ~= 0 then
    L0_31 = util
    L0_31 = L0_31.appendDebugOut
    L0_31("Detected Unauthorized access for page greTunnels")
    L0_31 = _UPVALUE0_
    L0_31 = L0_31.UNAUTHORIZED
    return L0_31
  end
  L0_31 = nil
  _UPVALUE1_.start()
  L0_31 = _UPVALUE2_.greDeleteAll()
  if L0_31 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page greTunnels" .. L0_31)
    _UPVALUE1_.abort()
    return L0_31
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function greTunnelsSectionGetCur(A0_32)
  local L1_33, L2_34, L3_35, L4_36, L5_37, L6_38, L7_39, L8_40, L9_41, L10_42
  L1_33, L2_34, L3_35, L4_36, L5_37, L6_38, L7_39, L8_40, L9_41, L10_42 = _UPVALUE0_.greGetCur(A0_32)
  if L1_33 ~= _UPVALUE1_.SUCCESS then
    return L1_33
  end
  return L1_33, L2_34, L3_35, L4_36, L5_37, L6_38, L7_39, L8_40, L9_41, L10_42
end
function greTunnelsStatusGetAll()
  local L0_43, L1_44
  L0_43 = _UPVALUE0_
  L0_43 = L0_43.greTunnelStatusGet
  L1_44 = L0_43()
  if L0_43 ~= _UPVALUE1_.SUCCESS then
    return L0_43
  end
  return L0_43, L1_44
end
