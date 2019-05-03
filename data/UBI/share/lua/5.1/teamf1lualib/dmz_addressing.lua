local L0_0
L0_0 = module
L0_0("com.teamf1.core.dmz.addressing", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/vlan_validation")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/dhcp_serverLAN")
L0_0 = require
L0_0("teamf1lualib/dmz_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.dhcp.serverLAN")
addressingTable = "ifStatic"
dhcpTable = "dhcp"
dhcpRelayTable = "dhcpRelay"
attribute = {}
attribute.LogicalIfName = "LogicalIfName"
attribute.interfaceName = "logicalIfName"
attribute.ipAddress = "StaticIp"
attribute.subnetMask = "NetMask"
attribute.gateway = "defaultGw"
attribute.dhcpType = "dhcpType"
attribute.dnsProxy = "enableDnsProxy"
attribute.dhcpEnabled = "dhcpEnabled"
attribute.DhcpRelayStatus = "DhcpRelayStatus"
attribute.dhcpRelay = "RelayGateway"
dhcpWorkType = {}
dhcpWorkType.none = "None"
dhcpWorkType.server = "Server"
dhcpWorkType.relay = "Relay"
DISABLE = "0"
ENABLE = "1"
DEFAULTADDRESS = "0.0.0.0"
DMZ_NAME = "DMZ"
ROWID = "_ROWID_"
IPV4_ADDRESS_FAMILY = "2"
function ipAddressGet()
  local L0_1, L1_2
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L1_2 = addressingTable
  L0_1 = L0_1(L1_2, attribute.LogicalIfName, DMZ_NAME, ROWID)
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(addressingTable, ROWID, L0_1, attribute.ipAddress)
  if L1_2 == NIL then
    return _UPVALUE0_.COMP_DMZ_ADDRESSING_IPADDRESS_NIL, L0_1
  end
  return _UPVALUE1_.SUCCESS, L0_1, L1_2
end
function ipAddressGetNext(A0_3)
  local L2_4
  L2_4 = _UPVALUE0_
  L2_4 = L2_4.NOT_SUPPORTED
  return L2_4, A0_3
end
function ipAddressSet(A0_5, A1_6)
  local L2_7
  if checkCookieExists(A0_5, addressingTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if A1_6 == NIL then
    return _UPVALUE1_.COMP_DMZ_ADDRESSING_IPADDRESS_NIL
  end
  L2_7 = _UPVALUE2_.ipAddressCheck(IPV4_ADDRESS_FAMILY, A1_6)
  if L2_7 == _UPVALUE0_.ERROR then
    return _UPVALUE1_.COMP_DMZ_ADDRESSING_IPADDRESS_INVALID
  end
  if db.setAttribute(addressingTable, ROWID, A0_5, attribute.ipAddress, A1_6) == NIL then
    return _UPVALUE0_.FAILURE, A0_5
  end
  return _UPVALUE0_.SUCCESS, A0_5
end
function subnetMaskGet()
  local L0_8, L1_9
  L0_8 = db
  L0_8 = L0_8.getAttribute
  L1_9 = addressingTable
  L0_8 = L0_8(L1_9, attribute.LogicalIfName, DMZ_NAME, ROWID)
  L1_9 = db
  L1_9 = L1_9.getAttribute
  L1_9 = L1_9(addressingTable, ROWID, L0_8, attribute.subnetMask)
  if L1_9 == NIL then
    return _UPVALUE0_.COMP_DMZ_ADDRESSING_SUBNETMASK_NIL, L0_8
  end
  return _UPVALUE1_.SUCCESS, L0_8, L1_9
end
function subnetMaskGetNext(A0_10)
  local L2_11
  L2_11 = _UPVALUE0_
  L2_11 = L2_11.NOT_SUPPORTED
  return L2_11, A0_10
end
function subnetMaskSet(A0_12, A1_13)
  local L2_14
  if checkCookieExists(A0_12, addressingTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if A1_13 == NIL then
    return _UPVALUE1_.COMP_DMZ_ADDRESSING_SUBNETMASK_NIL
  end
  L2_14 = _UPVALUE2_.ipAddressCheck(IPV4_ADDRESS_FAMILY, A1_13)
  if L2_14 == _UPVALUE0_.ERROR then
    return _UPVALUE1_.COMP_DMZ_ADDRESSING_SUBNETMASK_INVALID
  end
  if db.setAttribute(addressingTable, ROWID, A0_12, attribute.subnetMask, A1_13) == NIL then
    return _UPVALUE0_.FAILURE, A0_12
  end
  return _UPVALUE0_.SUCCESS, A0_12
end
function gatewayGet()
  local L0_15, L1_16
  L0_15 = db
  L0_15 = L0_15.getAttribute
  L1_16 = addressingTable
  L0_15 = L0_15(L1_16, attribute.LogicalIfName, DMZ_NAME, ROWID)
  L1_16 = db
  L1_16 = L1_16.getAttribute
  L1_16 = L1_16(dhcpTable, attribute.interfaceName, DMZ_NAME, attribute.gateway)
  if L1_16 == NIL then
    return _UPVALUE0_.COMP_DMZ_ADDRESSING_GATEWAY_NIL, L0_15
  end
  return _UPVALUE1_.SUCCESS, L0_15, L1_16
end
function gatewayGetNext(A0_17)
  local L2_18
  L2_18 = _UPVALUE0_
  L2_18 = L2_18.NOT_SUPPORTED
  return L2_18, A0_17
end
function gatewaySet(A0_19, A1_20)
  local L2_21, L3_22, L4_23
  L3_22 = checkCookieExists
  L4_23 = A0_19
  L3_22 = L3_22(L4_23, addressingTable)
  L4_23 = FALSE
  if L3_22 == L4_23 then
    L3_22 = _UPVALUE0_
    L3_22 = L3_22.INVALID_COOKIE
    return L3_22
  end
  L3_22 = NIL
  if A1_20 == L3_22 then
    L3_22 = _UPVALUE1_
    L3_22 = L3_22.COMP_DMZ_ADDRESSING_GATEWAY_NIL
    return L3_22
  end
  L3_22 = _UPVALUE2_
  L3_22 = L3_22.ipAddressCheck
  L4_23 = IPV4_ADDRESS_FAMILY
  L3_22 = L3_22(L4_23, A1_20)
  L2_21 = L3_22
  L3_22 = _UPVALUE0_
  L3_22 = L3_22.ERROR
  if L2_21 == L3_22 then
    L3_22 = _UPVALUE1_
    L3_22 = L3_22.COMP_DMZ_ADDRESSING_GATEWAY_INVALID
    return L3_22
  end
  L3_22 = db
  L3_22 = L3_22.getAttribute
  L4_23 = addressingTable
  L3_22 = L3_22(L4_23, ROWID, A0_19, attribute.subnetMask)
  L4_23 = NIL
  if L3_22 == L4_23 then
    L4_23 = _UPVALUE0_
    L4_23 = L4_23.FAILURE
    return L4_23, A0_19
  end
  L4_23 = db
  L4_23 = L4_23.getAttribute
  L4_23 = L4_23(addressingTable, ROWID, A0_19, attribute.ipAddress)
  if L4_23 == NIL then
    return _UPVALUE0_.FAILURE, A0_19
  end
  L2_21 = _UPVALUE2_.ipv4SingleMaskCheck(L4_23, A1_20, L3_22)
  if L2_21 == _UPVALUE0_.ERROR then
    return _UPVALUE1_.COMP_DMZ_ADDRESSING_GATEWAY_NOTIN_NETWORK
  end
  if db.setAttribute(dhcpTable, attribute.interfaceName, DMZ_NAME, attribute.gateway, A1_20) == NIL then
    return _UPVALUE0_.FAILURE, A0_19
  end
  return _UPVALUE0_.SUCCESS, A0_19
end
function dhcpTypeGet()
  local L0_24, L1_25, L2_26, L3_27
  L0_24 = db
  L0_24 = L0_24.getAttribute
  L1_25 = addressingTable
  L2_26 = attribute
  L2_26 = L2_26.LogicalIfName
  L3_27 = DMZ_NAME
  L0_24 = L0_24(L1_25, L2_26, L3_27, ROWID)
  L1_25 = db
  L1_25 = L1_25.getAttribute
  L2_26 = dhcpTable
  L3_27 = attribute
  L3_27 = L3_27.interfaceName
  L1_25 = L1_25(L2_26, L3_27, DMZ_NAME, attribute.dhcpEnabled)
  L2_26 = db
  L2_26 = L2_26.getAttribute
  L3_27 = dhcpRelayTable
  L2_26 = L2_26(L3_27, attribute.LogicalIfName, DMZ_NAME, attribute.DhcpRelayStatus)
  L3_27 = nil
  if L1_25 == DISABLE and L2_26 == DISABLE then
    L3_27 = dhcpWorkType.none
  elseif L1_25 == ENABLE then
    L3_27 = dhcpWorkType.server
  elseif L2_26 == ENABLE then
    L3_27 = dhcpWorkType.relay
  end
  if L3_27 == NIL then
    return _UPVALUE0_.FAILURE, L0_24
  end
  return _UPVALUE0_.SUCCESS, L0_24, L3_27
end
function dhcpTypeGetNext(A0_28)
  local L2_29
  L2_29 = _UPVALUE0_
  L2_29 = L2_29.NOT_SUPPORTED
  return L2_29, A0_28
end
function dhcpTypeSet(A0_30, A1_31)
  local L2_32, L3_33, L4_34
  L3_33 = checkCookieExists
  L4_34 = A0_30
  L3_33 = L3_33(L4_34, addressingTable)
  L4_34 = FALSE
  if L3_33 == L4_34 then
    L3_33 = _UPVALUE0_
    L3_33 = L3_33.INVALID_COOKIE
    return L3_33
  end
  L3_33 = NIL
  if A1_31 == L3_33 then
    L3_33 = _UPVALUE1_
    L3_33 = L3_33.COMP_DMZ_ADDRESSING_DHCPTYPE_NIL
    return L3_33
  end
  L3_33 = dhcpWorkType
  L3_33 = L3_33.none
  if A1_31 ~= L3_33 then
    L3_33 = dhcpWorkType
    L3_33 = L3_33.server
    if A1_31 ~= L3_33 then
      L3_33 = dhcpWorkType
      L3_33 = L3_33.relay
      if A1_31 ~= L3_33 then
        L3_33 = _UPVALUE1_
        L3_33 = L3_33.COMP_DMZ_ADDRESSING_DHCPTYPE_INVALID
        return L3_33
      end
    end
  end
  L3_33, L4_34 = nil, nil
  if A1_31 == dhcpWorkType.none then
    L3_33 = DISABLE
    L4_34 = DISABLE
  elseif A1_31 == dhcpWorkType.server then
    L3_33 = ENABLE
    L4_34 = DISABLE
  elseif A1_31 == dhcpWorkType.relay then
    L3_33 = DISABLE
    L4_34 = ENABLE
  end
  if db.setAttribute(dhcpTable, attribute.interfaceName, DMZ_NAME, attribute.dhcpEnabled, L3_33) == NIL then
    return _UPVALUE0_.FAILURE, A0_30
  end
  if db.setAttribute(dhcpTable, attribute.interfaceName, DMZ_NAME, attribute.dhcpEnabled, L3_33) == NIL then
    return _UPVALUE0_.FAILURE, A0_30
  end
  return _UPVALUE0_.SUCCESS, A0_30
end
function isdnsProxyEnabled()
  local L0_35, L1_36
  L0_35 = db
  L0_35 = L0_35.getAttribute
  L1_36 = addressingTable
  L0_35 = L0_35(L1_36, attribute.LogicalIfName, DMZ_NAME, ROWID)
  L1_36 = db
  L1_36 = L1_36.getAttribute
  L1_36 = L1_36(dhcpTable, attribute.interfaceName, DMZ_NAME, attribute.dnsProxy)
  if L1_36 == NIL then
    return _UPVALUE0_.COMP_DMZ_ADDRESSING_DNS_PROXY_NIL, L0_35
  end
  return _UPVALUE1_.SUCCESS, L0_35, L1_36
end
function isdnsProxyEnabledNext(A0_37)
  local L2_38
  L2_38 = _UPVALUE0_
  L2_38 = L2_38.NOT_SUPPORTED
  return L2_38, A0_37
end
function dnsProxyEnable(A0_39)
  if checkCookieExists(A0_39, addressingTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if db.setAttribute(dhcpTable, attribute.interfaceName, DMZ_NAME, attribute.dnsProxy, ENABLE) == NIL then
    return _UPVALUE0_.FAILURE, A0_39
  end
  return _UPVALUE0_.SUCCESS, A0_39
end
function dnsProxyDisable(A0_40)
  if checkCookieExists(A0_40, addressingTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if db.setAttribute(dhcpTable, attribute.interfaceName, DMZ_NAME, attribute.dnsProxy, DISABLE) == NIL then
    return _UPVALUE0_.FAILURE, A0_40
  end
  return _UPVALUE0_.SUCCESS, A0_40
end
function dhcpRelayGet()
  local L0_41, L1_42
  L0_41 = db
  L0_41 = L0_41.getAttribute
  L1_42 = addressingTable
  L0_41 = L0_41(L1_42, attribute.LogicalIfName, DMZ_NAME, ROWID)
  L1_42 = db
  L1_42 = L1_42.getAttribute
  L1_42 = L1_42(dhcpRelayTable, attribute.LogicalIfName, DMZ_NAME, attribute.dhcpRelay)
  if L1_42 == NIL then
    return _UPVALUE0_.FAILURE, L0_41
  end
  return _UPVALUE0_.SUCCESS, L0_41, L1_42
end
function dhcpRelayGetNext(A0_43)
  local L2_44
  L2_44 = _UPVALUE0_
  L2_44 = L2_44.NOT_SUPPORTED
  return L2_44, A0_43
end
function dhcpRelaySet(A0_45, A1_46)
  local L2_47
  if checkCookieExists(A0_45, addressingTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if A1_46 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_47 = _UPVALUE1_.ipAddressCheck(IPV4_ADDRESS_FAMILY, A1_46)
  if L2_47 == _UPVALUE0_.ERROR then
    return _UPVALUE2_.COMP_DMZ_ADDRESSING_RELAY_ADDRESS_INVALID
  end
  if dhcpTypeGet() == dhcpWorkType.relay then
    if db.setAttribute(dhcpRelayTable, attribute.LogicalIfName, DMZ_NAME, attribute.dhcpRelay, A1_46) == NIL then
      return _UPVALUE0_.FAILURE, A0_45
    end
  else
    return _UPVALUE0_.DHCP_RELAY_DISABLE, A0_45
  end
  return _UPVALUE0_.SUCCESS, A0_45
end
function dmzAddressGet()
  local L0_48, L1_49, L2_50, L3_51, L4_52
  L0_48 = db
  L0_48 = L0_48.getAttribute
  L1_49 = addressingTable
  L2_50 = attribute
  L2_50 = L2_50.LogicalIfName
  L3_51 = DMZ_NAME
  L4_52 = ROWID
  L0_48 = L0_48(L1_49, L2_50, L3_51, L4_52)
  L1_49 = db
  L1_49 = L1_49.getRow
  L2_50 = addressingTable
  L3_51 = ROWID
  L4_52 = L0_48
  L1_49 = L1_49(L2_50, L3_51, L4_52)
  L2_50 = NIL
  if L1_49 == L2_50 then
    L2_50 = _UPVALUE0_
    L2_50 = L2_50.FAILURE
    L3_51 = L0_48
    return L2_50, L3_51
  end
  L2_50 = db
  L2_50 = L2_50.getRow
  L3_51 = dhcpTable
  L4_52 = attribute
  L4_52 = L4_52.interfaceName
  L2_50 = L2_50(L3_51, L4_52, DMZ_NAME)
  L3_51 = NIL
  if L2_50 == L3_51 then
    L3_51 = _UPVALUE0_
    L3_51 = L3_51.FAILURE
    L4_52 = L0_48
    return L3_51, L4_52
  end
  L3_51 = db
  L3_51 = L3_51.getRow
  L4_52 = dhcpRelayTable
  L3_51 = L3_51(L4_52, attribute.LogicalIfName, DMZ_NAME)
  L4_52 = nil
  if L2_50[dhcpTable .. "." .. attribute.dhcpEnabled] == DISABLE and L3_51[dhcpRelayTable .. "." .. attribute.DhcpRelayStatus] == DISABLE then
    L4_52 = dhcpWorkType.none
  elseif L2_50[dhcpTable .. "." .. attribute.dhcpEnabled] == ENABLE then
    L4_52 = dhcpWorkType.server
  else
    L4_52 = dhcpWorkType.relay
  end
  return _UPVALUE0_.SUCCESS, L0_48, L1_49[addressingTable .. "." .. attribute.ipAddress], L1_49[addressingTable .. "." .. attribute.subnetMask], L2_50[dhcpTable .. "." .. attribute.gateway], L4_52, L2_50[dhcpTable .. "." .. attribute.dnsProxy], L3_51[dhcpRelayTable .. "." .. attribute.dhcpRelay]
end
function dmzAddressGetNext(A0_53)
  local L2_54
  L2_54 = _UPVALUE0_
  L2_54 = L2_54.NOT_SUPPORTED
  return L2_54, A0_53
end
function dmzAddressSet(A0_55, A1_56, A2_57, A3_58, A4_59, A5_60, A6_61)
  local L7_62, L8_63, L9_64, L10_65, L11_66, L12_67, L13_68, L14_69, L15_70, L16_71, L17_72, L18_73, L19_74, L20_75
  L8_63 = checkCookieExists
  L9_64 = A0_55
  L10_65 = addressingTable
  L8_63 = L8_63(L9_64, L10_65)
  L9_64 = FALSE
  if L8_63 == L9_64 then
    L8_63 = _UPVALUE0_
    L8_63 = L8_63.INVALID_COOKIE
    return L8_63
  end
  L8_63 = NIL
  if A1_56 == L8_63 then
    L8_63 = _UPVALUE1_
    L8_63 = L8_63.COMP_DMZ_ADDRESSING_IPADDRESS_NIL
    return L8_63
  end
  L8_63 = _UPVALUE2_
  L8_63 = L8_63.ipAddressCheck
  L9_64 = IPV4_ADDRESS_FAMILY
  L10_65 = A1_56
  L8_63 = L8_63(L9_64, L10_65)
  L7_62 = L8_63
  L8_63 = _UPVALUE0_
  L8_63 = L8_63.ERROR
  if L7_62 == L8_63 then
    L8_63 = _UPVALUE1_
    L8_63 = L8_63.COMP_DMZ_ADDRESSING_IPADDRESS_INVALID
    return L8_63
  end
  L8_63, L9_64, L10_65, L11_66 = nil, nil, nil, nil
  L12_67 = _UPVALUE3_
  L12_67 = L12_67.ipAddressGet
  L14_69 = L12_67()
  L10_65 = L14_69
  L11_66 = L13_68
  L8_63 = L12_67
  L12_67 = _UPVALUE0_
  L12_67 = L12_67.SUCCESS
  if L8_63 ~= L12_67 then
    L12_67 = _UPVALUE0_
    L12_67 = L12_67.LAN_ADDRESSING_IPADDRESS_GET_FAIL
    return L12_67
  end
  L12_67 = _UPVALUE3_
  L12_67 = L12_67.subnetMaskGet
  L14_69 = L12_67()
  L9_64 = L14_69
  L11_66 = L13_68
  L8_63 = L12_67
  L12_67 = _UPVALUE0_
  L12_67 = L12_67.SUCCESS
  if L8_63 ~= L12_67 then
    L12_67 = _UPVALUE0_
    L12_67 = L12_67.LAN_ADDRESSING_SUBNET_GET_FAIL
    return L12_67
  end
  L12_67 = _UPVALUE2_
  L12_67 = L12_67.ipv4SingleMaskCheck
  L13_68 = A1_56
  L14_69 = L10_65
  L15_70 = L9_64
  L12_67 = L12_67(L13_68, L14_69, L15_70)
  L7_62 = L12_67
  L12_67 = _UPVALUE0_
  L12_67 = L12_67.ERROR
  if L7_62 ~= L12_67 then
    L12_67 = _UPVALUE1_
    L12_67 = L12_67.COMP_DMZ_ADDRESSING_IPADDRESS_INLAN_SUBNET
    return L12_67
  end
  L12_67 = NIL
  if A2_57 == L12_67 then
    L12_67 = _UPVALUE1_
    L12_67 = L12_67.COMP_DMZ_ADDRESSING_SUBNETMASK_NIL
    return L12_67
  end
  L12_67 = _UPVALUE2_
  L12_67 = L12_67.ipAddressCheck
  L13_68 = IPV4_ADDRESS_FAMILY
  L14_69 = A2_57
  L12_67 = L12_67(L13_68, L14_69)
  L7_62 = L12_67
  L12_67 = _UPVALUE0_
  L12_67 = L12_67.ERROR
  if L7_62 == L12_67 then
    L12_67 = _UPVALUE1_
    L12_67 = L12_67.COMP_DMZ_ADDRESSING_SUBNETMASK_INVALID
    return L12_67
  end
  L12_67 = NIL
  if A3_58 ~= L12_67 then
    L12_67 = _UPVALUE2_
    L12_67 = L12_67.ipAddressCheck
    L13_68 = IPV4_ADDRESS_FAMILY
    L14_69 = A3_58
    L12_67 = L12_67(L13_68, L14_69)
    L7_62 = L12_67
    L12_67 = _UPVALUE0_
    L12_67 = L12_67.ERROR
    if L7_62 == L12_67 then
      L12_67 = _UPVALUE1_
      L12_67 = L12_67.COMP_DMZ_ADDRESSING_GATEWAY_INVALID
      return L12_67
    end
    L12_67 = _UPVALUE2_
    L12_67 = L12_67.ipv4SingleMaskCheck
    L13_68 = A1_56
    L14_69 = A3_58
    L15_70 = A2_57
    L12_67 = L12_67(L13_68, L14_69, L15_70)
    L7_62 = L12_67
    L12_67 = _UPVALUE0_
    L12_67 = L12_67.ERROR
    if L7_62 == L12_67 then
      L12_67 = _UPVALUE1_
      L12_67 = L12_67.COMP_DMZ_ADDRESSING_GATEWAY_NOTIN_NETWORK
      return L12_67
    end
  end
  L12_67 = NIL
  if A4_59 == L12_67 then
    L12_67 = _UPVALUE1_
    L12_67 = L12_67.COMP_DMZ_ADDRESSING_DHCPTYPE_NIL
    return L12_67
  end
  L12_67 = dhcpWorkType
  L12_67 = L12_67.none
  if A4_59 ~= L12_67 then
    L12_67 = dhcpWorkType
    L12_67 = L12_67.server
    if A4_59 ~= L12_67 then
      L12_67 = dhcpWorkType
      L12_67 = L12_67.relay
      if A4_59 ~= L12_67 then
        L12_67 = _UPVALUE1_
        L12_67 = L12_67.COMP_DMZ_ADDRESSING_DHCPTYPE_INVALID
        return L12_67
      end
    end
  end
  L12_67, L13_68 = nil, nil
  L14_69 = dhcpWorkType
  L14_69 = L14_69.none
  if A4_59 == L14_69 then
    L12_67 = DISABLE
    L13_68 = DISABLE
  else
    L14_69 = dhcpWorkType
    L14_69 = L14_69.server
    if A4_59 == L14_69 then
      L12_67 = ENABLE
      L13_68 = DISABLE
    else
      L14_69 = dhcpWorkType
      L14_69 = L14_69.relay
      if A4_59 == L14_69 then
        L12_67 = DISABLE
        L13_68 = ENABLE
      end
    end
  end
  L14_69 = NIL
  if A5_60 == L14_69 then
    L14_69 = _UPVALUE1_
    L14_69 = L14_69.COMP_DMZ_ADDRESSING_DNS_PROXY_NIL
    return L14_69
  end
  L14_69 = _UPVALUE2_
  L14_69 = L14_69.isBoolean
  L15_70 = A5_60
  L14_69 = L14_69(L15_70)
  L7_62 = L14_69
  L14_69 = _UPVALUE0_
  L14_69 = L14_69.ERROR
  if L7_62 == L14_69 then
    L14_69 = _UPVALUE1_
    L14_69 = L14_69.COMP_DMZ_ADDRESSING_DNS_PROXY_INVALID
    return L14_69
  end
  L14_69 = DISABLE
  if L13_68 == L14_69 then
    A6_61 = DEFAULTADDRESS
  end
  L14_69 = NIL
  if A6_61 ~= L14_69 then
    L14_69 = _UPVALUE2_
    L14_69 = L14_69.ipAddressCheck
    L15_70 = IPV4_ADDRESS_FAMILY
    L16_71 = A6_61
    L14_69 = L14_69(L15_70, L16_71)
    L7_62 = L14_69
    L14_69 = _UPVALUE0_
    L14_69 = L14_69.ERROR
    if L7_62 == L14_69 then
      L14_69 = _UPVALUE1_
      L14_69 = L14_69.COMP_DMZ_ADDRESSING_RELAY_ADDRESS_INVALID
      return L14_69
    end
  end
  L14_69 = {}
  L15_70 = addressingTable
  L16_71 = "."
  L17_72 = attribute
  L17_72 = L17_72.ipAddress
  L15_70 = L15_70 .. L16_71 .. L17_72
  L14_69[L15_70] = A1_56
  L15_70 = addressingTable
  L16_71 = "."
  L17_72 = attribute
  L17_72 = L17_72.subnetMask
  L15_70 = L15_70 .. L16_71 .. L17_72
  L14_69[L15_70] = A2_57
  L15_70 = db
  L15_70 = L15_70.update
  L16_71 = addressingTable
  L17_72 = L14_69
  L18_73 = A0_55
  L15_70 = L15_70(L16_71, L17_72, L18_73)
  L16_71 = NIL
  if L15_70 == L16_71 then
    L16_71 = _UPVALUE0_
    L16_71 = L16_71.FAILURE
    L17_72 = A0_55
    return L16_71, L17_72
  end
  L16_71 = {}
  L17_72 = dhcpTable
  L18_73 = "."
  L19_74 = attribute
  L19_74 = L19_74.dhcpEnabled
  L17_72 = L17_72 .. L18_73 .. L19_74
  L16_71[L17_72] = L12_67
  L17_72 = dhcpTable
  L18_73 = "."
  L19_74 = attribute
  L19_74 = L19_74.gateway
  L17_72 = L17_72 .. L18_73 .. L19_74
  L16_71[L17_72] = A3_58
  L17_72 = dhcpTable
  L18_73 = "."
  L19_74 = attribute
  L19_74 = L19_74.dnsProxy
  L17_72 = L17_72 .. L18_73 .. L19_74
  L16_71[L17_72] = A5_60
  L17_72 = db
  L17_72 = L17_72.getAttribute
  L18_73 = dhcpTable
  L19_74 = attribute
  L19_74 = L19_74.interfaceName
  L20_75 = DMZ_NAME
  L17_72 = L17_72(L18_73, L19_74, L20_75, ROWID)
  L18_73 = db
  L18_73 = L18_73.update
  L19_74 = dhcpTable
  L20_75 = L16_71
  L18_73 = L18_73(L19_74, L20_75, L17_72)
  L19_74 = NIL
  if L18_73 == L19_74 then
    L19_74 = _UPVALUE0_
    L19_74 = L19_74.FAILURE
    L20_75 = A0_55
    return L19_74, L20_75
  end
  L19_74 = {}
  L20_75 = dhcpRelayTable
  L20_75 = L20_75 .. "." .. attribute.DhcpRelayStatus
  L19_74[L20_75] = L13_68
  L20_75 = dhcpRelayTable
  L20_75 = L20_75 .. "." .. attribute.dhcpRelay
  L19_74[L20_75] = A6_61
  L20_75 = db
  L20_75 = L20_75.getAttribute
  L20_75 = L20_75(dhcpRelayTable, attribute.LogicalIfName, DMZ_NAME, ROWID)
  if L18_73 == NIL then
    return _UPVALUE0_.FAILURE, A0_55
  end
  return _UPVALUE0_.SUCCESS, A0_55
end
function dmzAddressCreate(A0_76, A1_77, A2_78, A3_79, A4_80, A5_81)
  local L7_82
  L7_82 = _UPVALUE0_
  L7_82 = L7_82.NOT_SUPPORTED
  return L7_82, cookie
end
function dmzAddressDelete(A0_83)
  local L2_84
  L2_84 = _UPVALUE0_
  L2_84 = L2_84.NOT_SUPPORTED
  return L2_84, A0_83
end
