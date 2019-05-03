local L0_0
L0_0 = module
L0_0("com.teamf1.bl.vpn.openvpnRemoteNetworks", package.seeall)
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
function openVpnRemoteNetworksSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  L0_1, L1_2, L2_3, L3_4, L4_5 = _UPVALUE0_.gatewayRouteGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3, L3_4, L4_5
end
function openVpnRemoteNetworksSectionGetNext(A0_6)
  local L1_7, L2_8, L3_9, L4_10, L5_11, L6_12
  L1_7 = A0_6["openVpnRemoteNetworks.cookie"]
  if L1_7 == nil then
    L2_8 = util
    L2_8 = L2_8.appendDebugOut
    L3_9 = "GetNext : Invalid Cookie"
    L2_8(L3_9)
    L2_8 = _UPVALUE0_
    L2_8 = L2_8.BAD_PARAMETER
    return L2_8
  end
  L2_8, L3_9, L4_10, L5_11, L6_12 = nil, nil, nil, nil, nil
  L2_8, L3_9, L4_10, L5_11, L6_12 = _UPVALUE1_.gatewayRouteGetNext(L1_7)
  if L2_8 ~= _UPVALUE0_.SUCCESS then
    return L2_8
  end
  return L2_8, L3_9, L4_10, L5_11, L6_12
end
function openVpnRemoteNetworksSectionSet(A0_13)
  local L1_14, L2_15, L3_16, L4_17, L5_18, L6_19
  L1_14 = ACCESS_LEVEL
  if L1_14 ~= 0 then
    L1_14 = util
    L1_14 = L1_14.appendDebugOut
    L2_15 = "Detected Unauthorized access for page openVpnRemoteNetworks"
    L1_14(L2_15)
    L1_14 = _UPVALUE0_
    L1_14 = L1_14.UNAUTHORIZED
    return L1_14
  end
  L1_14 = A0_13["openVpnRemoteNetworks.cookie"]
  L2_15 = A0_13["openVpnRemoteNetworks.remoteNetwork"]
  L3_16 = A0_13["openVpnRemoteNetworks.remoteNetworkname"]
  L4_17 = A0_13["openVpnRemoteNetworks.remoteNetworkMask"]
  if L1_14 == nil then
    L5_18 = util
    L5_18 = L5_18.appendDebugOut
    L6_19 = "Set : Invalid Cookie"
    L5_18(L6_19)
    L5_18 = _UPVALUE0_
    L5_18 = L5_18.BAD_PARAMETER
    return L5_18
  end
  L5_18 = _UPVALUE1_
  L5_18 = L5_18.checkWanSubnetRange
  L6_19 = L2_15
  L5_18 = L5_18(L6_19, L4_17)
  result = L5_18
  L5_18 = result
  L6_19 = _UPVALUE0_
  L6_19 = L6_19.SUCCESS
  if L5_18 == L6_19 then
    L5_18 = UNIT_NAME
    if L5_18 ~= "DSR-150N" then
      L5_18 = UNIT_NAME
      if L5_18 ~= "DSR-150" then
        L5_18 = UNIT_NAME
        if L5_18 ~= "DSR-250N" then
          L5_18 = UNIT_NAME
          if L5_18 ~= "DSR-250" then
            L5_18 = _UPVALUE0_
            L5_18 = L5_18.WAN_ALREADY_CONFIGURED
            return L5_18
          end
        end
      end
    else
      L5_18 = _UPVALUE0_
      L5_18 = L5_18.WAN_ECONA_ALREADY_CONFIGURED
      return L5_18
    end
  end
  L5_18 = HIGH_SEC
  if L5_18 == "HIGH" then
    L5_18 = _UPVALUE1_
    L5_18 = L5_18.checkSslClientRange
    L6_19 = L2_15
    L5_18 = L5_18(L6_19, L4_17)
    result = L5_18
    L5_18 = result
    L6_19 = _UPVALUE0_
    L6_19 = L6_19.SUCCESS
    if L5_18 == L6_19 then
      L5_18 = _UPVALUE0_
      L5_18 = L5_18.SSLVPN_CLIENT_ALREADY_CONFIGURED
      return L5_18
    end
  end
  L5_18 = _UPVALUE1_
  L5_18 = L5_18.checkLanVlanSubnetRange
  L6_19 = L2_15
  L5_18 = L5_18(L6_19, L4_17)
  result = L5_18
  L5_18 = result
  L6_19 = _UPVALUE0_
  L6_19 = L6_19.SUCCESS
  if L5_18 == L6_19 then
    L5_18 = _UPVALUE0_
    L5_18 = L5_18.LAN_VLAN_ALREADY_CONFIGURED
    return L5_18
  end
  L5_18 = _UPVALUE1_
  L5_18 = L5_18.checkDmzSubnetRange
  L6_19 = L2_15
  L5_18 = L5_18(L6_19, L4_17)
  result = L5_18
  L5_18 = result
  L6_19 = _UPVALUE0_
  L6_19 = L6_19.SUCCESS
  if L5_18 == L6_19 then
    L5_18 = _UPVALUE0_
    L5_18 = L5_18.DMZ_ALREADY_CONFIGURED
    return L5_18
  end
  L5_18 = _UPVALUE1_
  L5_18 = L5_18.checkIpSecSubnetRange
  L6_19 = L2_15
  L5_18 = L5_18(L6_19, L4_17)
  result = L5_18
  L5_18 = result
  L6_19 = _UPVALUE0_
  L6_19 = L6_19.SUCCESS
  if L5_18 == L6_19 then
    L5_18 = _UPVALUE0_
    L5_18 = L5_18.IPSEC_DHCP_ALREADY_CONFIGURED
    return L5_18
  end
  L5_18 = _UPVALUE1_
  L5_18 = L5_18.checkPptpSeverSubnetRange
  L6_19 = L2_15
  L5_18 = L5_18(L6_19, L4_17)
  result = L5_18
  L5_18 = result
  L6_19 = _UPVALUE0_
  L6_19 = L6_19.SUCCESS
  if L5_18 == L6_19 then
    L5_18 = _UPVALUE0_
    L5_18 = L5_18.PPTP_SERVER_ALREADY_CONFIGURED
    return L5_18
  end
  L5_18 = _UPVALUE1_
  L5_18 = L5_18.checkL2tpSeverSubnetRange
  L6_19 = L2_15
  L5_18 = L5_18(L6_19, L4_17)
  result = L5_18
  L5_18 = result
  L6_19 = _UPVALUE0_
  L6_19 = L6_19.SUCCESS
  if L5_18 == L6_19 then
    L5_18 = _UPVALUE0_
    L5_18 = L5_18.L2TP_SERVER_ALREADY_CONFIGURED
    return L5_18
  end
  if L2_15 == nil or L3_16 == nil or L4_17 == nil then
    L5_18 = util
    L5_18 = L5_18.appendDebugOut
    L6_19 = "GetNext : Invalid Cookie"
    L5_18(L6_19)
    L5_18 = _UPVALUE0_
    L5_18 = L5_18.BAD_PARAMETER
    return L5_18
  end
  L5_18, L6_19 = nil, nil
  _UPVALUE2_.start()
  L5_18, L6_19 = _UPVALUE3_.gatewayRouteSet(L1_14, L2_15, L3_16, L4_17)
  if L5_18 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page openVpnRemoteNetworks" .. L5_18)
    _UPVALUE2_.abort()
    return L5_18, L1_14
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return _UPVALUE0_.SUCCESS, L6_19
end
function openVpnRemoteNetworksSectionCreate(A0_20)
  local L1_21, L2_22, L3_23, L4_24, L5_25
  L1_21 = ACCESS_LEVEL
  if L1_21 ~= 0 then
    L1_21 = util
    L1_21 = L1_21.appendDebugOut
    L2_22 = "Detected Unauthorized access for page openVpnRemoteNetworks"
    L1_21(L2_22)
    L1_21 = _UPVALUE0_
    L1_21 = L1_21.UNAUTHORIZED
    return L1_21
  end
  L1_21 = A0_20["openVpnRemoteNetworks.remoteNetwork"]
  L2_22 = A0_20["openVpnRemoteNetworks.remoteNetworkname"]
  L3_23 = A0_20["openVpnRemoteNetworks.remoteNetworkMask"]
  if L1_21 == nil or L2_22 == nil or L3_23 == nil then
    L4_24 = util
    L4_24 = L4_24.appendDebugOut
    L5_25 = "GetNext : Invalid Cookie"
    L4_24(L5_25)
    L4_24 = _UPVALUE0_
    L4_24 = L4_24.BAD_PARAMETER
    return L4_24
  end
  L4_24 = _UPVALUE1_
  L4_24 = L4_24.checkWanSubnetRange
  L5_25 = L1_21
  L4_24 = L4_24(L5_25, L3_23)
  result = L4_24
  L4_24 = result
  L5_25 = _UPVALUE0_
  L5_25 = L5_25.SUCCESS
  if L4_24 == L5_25 then
    L4_24 = UNIT_NAME
    if L4_24 ~= "DSR-150N" then
      L4_24 = UNIT_NAME
      if L4_24 ~= "DSR-150" then
        L4_24 = UNIT_NAME
        if L4_24 ~= "DSR-250N" then
          L4_24 = UNIT_NAME
          if L4_24 ~= "DSR-250" then
            L4_24 = _UPVALUE0_
            L4_24 = L4_24.WAN_ALREADY_CONFIGURED
            return L4_24
          end
        end
      end
    else
      L4_24 = _UPVALUE0_
      L4_24 = L4_24.WAN_ECONA_ALREADY_CONFIGURED
      return L4_24
    end
  end
  L4_24 = HIGH_SEC
  if L4_24 == "HIGH" then
    L4_24 = _UPVALUE1_
    L4_24 = L4_24.checkSslClientRange
    L5_25 = L1_21
    L4_24 = L4_24(L5_25, L3_23)
    result = L4_24
    L4_24 = result
    L5_25 = _UPVALUE0_
    L5_25 = L5_25.SUCCESS
    if L4_24 == L5_25 then
      L4_24 = _UPVALUE0_
      L4_24 = L4_24.SSLVPN_CLIENT_ALREADY_CONFIGURED
      return L4_24
    end
  end
  L4_24 = _UPVALUE1_
  L4_24 = L4_24.checkLanVlanSubnetRange
  L5_25 = L1_21
  L4_24 = L4_24(L5_25, L3_23)
  result = L4_24
  L4_24 = result
  L5_25 = _UPVALUE0_
  L5_25 = L5_25.SUCCESS
  if L4_24 == L5_25 then
    L4_24 = _UPVALUE0_
    L4_24 = L4_24.LAN_VLAN_ALREADY_CONFIGURED
    return L4_24
  end
  L4_24 = _UPVALUE1_
  L4_24 = L4_24.checkDmzSubnetRange
  L5_25 = L1_21
  L4_24 = L4_24(L5_25, L3_23)
  result = L4_24
  L4_24 = result
  L5_25 = _UPVALUE0_
  L5_25 = L5_25.SUCCESS
  if L4_24 == L5_25 then
    L4_24 = _UPVALUE0_
    L4_24 = L4_24.DMZ_ALREADY_CONFIGURED
    return L4_24
  end
  L4_24 = _UPVALUE1_
  L4_24 = L4_24.checkIpSecSubnetRange
  L5_25 = L1_21
  L4_24 = L4_24(L5_25, L3_23)
  result = L4_24
  L4_24 = result
  L5_25 = _UPVALUE0_
  L5_25 = L5_25.SUCCESS
  if L4_24 == L5_25 then
    L4_24 = _UPVALUE0_
    L4_24 = L4_24.IPSEC_DHCP_ALREADY_CONFIGURED
    return L4_24
  end
  L4_24 = _UPVALUE1_
  L4_24 = L4_24.checkPptpSeverSubnetRange
  L5_25 = L1_21
  L4_24 = L4_24(L5_25, L3_23)
  result = L4_24
  L4_24 = result
  L5_25 = _UPVALUE0_
  L5_25 = L5_25.SUCCESS
  if L4_24 == L5_25 then
    L4_24 = _UPVALUE0_
    L4_24 = L4_24.PPTP_SERVER_ALREADY_CONFIGURED
    return L4_24
  end
  L4_24 = _UPVALUE1_
  L4_24 = L4_24.checkL2tpSeverSubnetRange
  L5_25 = L1_21
  L4_24 = L4_24(L5_25, L3_23)
  result = L4_24
  L4_24 = result
  L5_25 = _UPVALUE0_
  L5_25 = L5_25.SUCCESS
  if L4_24 == L5_25 then
    L4_24 = _UPVALUE0_
    L4_24 = L4_24.L2TP_SERVER_ALREADY_CONFIGURED
    return L4_24
  end
  L4_24, L5_25 = nil, nil
  _UPVALUE2_.start()
  L4_24, L5_25 = _UPVALUE3_.gatewayRouteCreate(L1_21, L2_22, L3_23)
  if L4_24 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page openVpnRemoteNetworks" .. L4_24)
    _UPVALUE2_.abort()
    return L4_24, 0
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return _UPVALUE0_.SUCCESS, L5_25
end
function openVpnRemoteNetworksSectionDelete(A0_26)
  local L1_27, L2_28
  L1_27 = ACCESS_LEVEL
  if L1_27 ~= 0 then
    L1_27 = util
    L1_27 = L1_27.appendDebugOut
    L2_28 = "Detected Unauthorized access for page openVpnRemoteNetworks"
    L1_27(L2_28)
    L1_27 = _UPVALUE0_
    L1_27 = L1_27.UNAUTHORIZED
    return L1_27
  end
  L1_27 = A0_26["openVpnRemoteNetworks.cookie"]
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
  L2_28, cookie = _UPVALUE2_.gatewayRouteDelete(L1_27)
  if L2_28 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page openVpnRemoteNetworks" .. L2_28)
    _UPVALUE1_.abort()
    return L2_28, L1_27
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function openVpnRemoteNetworksSectionGetAll()
  local L0_29, L1_30
  L1_30 = {}
  L0_29, L1_30 = _UPVALUE0_.gatewayRoutesGetAll()
  if L0_29 ~= _UPVALUE1_.SUCCESS then
    return L0_29
  end
  return L0_29, L1_30
end
function openVpnRemoteNetworksSectionDeleteAll()
  local L0_31
  L0_31 = ACCESS_LEVEL
  if L0_31 ~= 0 then
    L0_31 = util
    L0_31 = L0_31.appendDebugOut
    L0_31("Detected Unauthorized access for page openVpnRemoteNetworks")
    L0_31 = _UPVALUE0_
    L0_31 = L0_31.UNAUTHORIZED
    return L0_31
  end
  L0_31 = nil
  _UPVALUE1_.start()
  L0_31 = _UPVALUE2_.gatewayRoutesDeleteAll()
  if L0_31 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page openVpnRemoteNetworks" .. L0_31)
    _UPVALUE1_.abort()
    return L0_31
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function openVpnRemoteNetworksSectionGetCur(A0_32)
  local L1_33, L2_34, L3_35, L4_36
  L1_33, L2_34, L3_35, L4_36 = _UPVALUE0_.gatewayRouteGetCur(A0_32)
  if L1_33 ~= _UPVALUE1_.SUCCESS then
    return L1_33
  end
  return L1_33, L3_35, L2_34, L4_36
end
