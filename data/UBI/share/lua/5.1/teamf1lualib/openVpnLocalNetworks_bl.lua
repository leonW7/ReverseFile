local L0_0
L0_0 = module
L0_0("com.teamf1.bl.vpn.openvpnLocalNetworks", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/openvpn_core")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function openVpnLocalNetworksSectionGet()
  local L0_1, L1_2, L2_3, L3_4
  L0_1, L1_2, L2_3, L3_4 = _UPVALUE0_.lanRouteGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3, L3_4
end
function openVpnLocalNetworksSectionGetNext(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10
  L1_6 = A0_5["openVpnLocalNetworks.cookie"]
  if L1_6 == nil then
    L2_7 = util
    L2_7 = L2_7.appendDebugOut
    L3_8 = "GetNext : Invalid Cookie"
    L2_7(L3_8)
    L2_7 = _UPVALUE0_
    L2_7 = L2_7.BAD_PARAMETER
    return L2_7
  end
  L2_7, L3_8, L4_9, L5_10 = nil, nil, nil, nil
  L2_7, L3_8, L4_9, L5_10 = _UPVALUE1_.lanRouteGetNext(L1_6)
  if L2_7 ~= _UPVALUE0_.SUCCESS then
    return L2_7
  end
  return L2_7, L3_8, L4_9, L5_10
end
function openVpnLocalNetworksSectionSet(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16
  L1_12 = ACCESS_LEVEL
  if L1_12 ~= 0 then
    L1_12 = util
    L1_12 = L1_12.appendDebugOut
    L2_13 = "Detected Unauthorized access for page openVpnLocalNetworks"
    L1_12(L2_13)
    L1_12 = _UPVALUE0_
    L1_12 = L1_12.UNAUTHORIZED
    return L1_12
  end
  L1_12 = A0_11["openVpnLocalNetworks.cookie"]
  L2_13 = A0_11["openVpnLocalNetworks.localNetwork"]
  L3_14 = A0_11["openVpnLocalNetworks.localNetworkMask"]
  if L1_12 == nil then
    L4_15 = util
    L4_15 = L4_15.appendDebugOut
    L5_16 = "Set : Invalid Cookie"
    L4_15(L5_16)
    L4_15 = _UPVALUE0_
    L4_15 = L4_15.BAD_PARAMETER
    return L4_15
  end
  if L2_13 == nil or L3_14 == nil then
    L4_15 = util
    L4_15 = L4_15.appendDebugOut
    L5_16 = "GetNext : Invalid Cookie"
    L4_15(L5_16)
    L4_15 = _UPVALUE0_
    L4_15 = L4_15.BAD_PARAMETER
    return L4_15
  end
  L4_15, L5_16 = nil, nil
  _UPVALUE1_.start()
  L4_15, L5_16 = _UPVALUE2_.lanRouteSet(L1_12, L2_13, L3_14)
  if L4_15 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page openVpnLocalNetworks" .. L4_15)
    _UPVALUE1_.abort()
    return L4_15, L1_12
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L5_16
end
function openVpnLocalNetworksSectionCreate(A0_17)
  local L1_18, L2_19, L3_20, L4_21
  L1_18 = ACCESS_LEVEL
  if L1_18 ~= 0 then
    L1_18 = util
    L1_18 = L1_18.appendDebugOut
    L2_19 = "Detected Unauthorized access for page openVpnLocalNetworks"
    L1_18(L2_19)
    L1_18 = _UPVALUE0_
    L1_18 = L1_18.UNAUTHORIZED
    return L1_18
  end
  L1_18 = A0_17["openVpnLocalNetworks.localNetwork"]
  L2_19 = A0_17["openVpnLocalNetworks.localNetworkMask"]
  if L1_18 == nil or L2_19 == nil then
    L3_20 = util
    L3_20 = L3_20.appendDebugOut
    L4_21 = "GetNext : Invalid Cookie"
    L3_20(L4_21)
    L3_20 = _UPVALUE0_
    L3_20 = L3_20.BAD_PARAMETER
    return L3_20
  end
  L3_20, L4_21 = nil, nil
  _UPVALUE1_.start()
  L3_20, L4_21 = _UPVALUE2_.lanRouteCreate(L1_18, L2_19)
  if L3_20 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page openVpnLocalNetworks" .. L3_20)
    _UPVALUE1_.abort()
    return L3_20, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L4_21
end
function openVpnLocalNetworksSectionDelete(A0_22)
  local L1_23, L2_24
  L1_23 = ACCESS_LEVEL
  if L1_23 ~= 0 then
    L1_23 = util
    L1_23 = L1_23.appendDebugOut
    L2_24 = "Detected Unauthorized access for page openVpnLocalNetworks"
    L1_23(L2_24)
    L1_23 = _UPVALUE0_
    L1_23 = L1_23.UNAUTHORIZED
    return L1_23
  end
  L1_23 = A0_22["openVpnLocalNetworks.cookie"]
  if L1_23 == nil then
    L2_24 = util
    L2_24 = L2_24.appendDebugOut
    L2_24("Delete : Invalid Cookie")
    L2_24 = _UPVALUE0_
    L2_24 = L2_24.BAD_PARAMETER
    return L2_24
  end
  L2_24 = nil
  _UPVALUE1_.start()
  L2_24, cookie = _UPVALUE2_.lanRouteDelete(L1_23)
  if L2_24 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page openVpnLocalNetworks" .. L2_24)
    _UPVALUE1_.abort()
    return L2_24, L1_23
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function openVpnLocalNetworksSectionGetAll()
  local L0_25, L1_26
  L1_26 = {}
  L0_25, L1_26 = _UPVALUE0_.lanRoutesGetAll()
  if L1_26 == _UPVALUE1_.NIL then
    L1_26 = {}
  end
  if L0_25 ~= _UPVALUE1_.SUCCESS then
    return L0_25, L1_26
  end
  return L0_25, L1_26
end
function openVpnLocalNetworksSectionDeleteAll()
  local L0_27
  L0_27 = ACCESS_LEVEL
  if L0_27 ~= 0 then
    L0_27 = util
    L0_27 = L0_27.appendDebugOut
    L0_27("Detected Unauthorized access for page openVpnLocalNetworks")
    L0_27 = _UPVALUE0_
    L0_27 = L0_27.UNAUTHORIZED
    return L0_27
  end
  L0_27 = nil
  _UPVALUE1_.start()
  L0_27 = _UPVALUE2_.lanRoutesDeleteAll()
  if L0_27 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page openVpnLocalNetworks" .. L0_27)
    _UPVALUE1_.abort()
    return L0_27
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function openVpnLocalNetworksSectionGetCur(A0_28)
  local L1_29, L2_30, L3_31
  L1_29, L2_30, L3_31 = _UPVALUE0_.lanRouteGetCur(A0_28)
  if L1_29 ~= _UPVALUE1_.SUCCESS then
    return L1_29
  end
  return L1_29, L2_30, L3_31
end
