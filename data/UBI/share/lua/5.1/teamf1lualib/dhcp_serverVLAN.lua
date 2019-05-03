local L0_0
L0_0 = module
L0_0("com.teamf1.core.dhcp.serverVLAN", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/ipv6_mode")
L0_0 = require
L0_0("teamf1lualib/vlan_validation")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/dhcp_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.ipv6.mode")
serverTable = "dhcp"
subnetTable = "ifStatic"
networkInterfaceTable = "networkInterface"
bridgeTable = "bridgeTable"
;({}).ipAddress = "StaticIp"
;({}).subnetMask = "NetMask"
;({}).interfaceName = "logicalIfName"
;({}).networkInterface = "LogicalIfName"
;({}).domain = "domainName"
;({}).startIpAddress = "startAddress"
;({}).endIpAddress = "endAddress"
;({}).gateway = "defaultGw"
;({}).primaryDnsServer = "primaryDnsServer"
;({}).secondaryDnsServer = "secondaryDnsServer"
;({}).winsServer = "winsServer"
;({}).leaseTime = "leaseTime"
;({}).AddressFamily = "AddressFamily"
;({}).addressFamily = "addressFamily"
;({}).ifGateway = "Gateway"
;({}).dhcpEnabled = "dhcpEnabled"
;({}).enableDnsProxy = "enableDnsProxy"
;({}).bridgeIndex = "bridgeIndex"
;({}).portName = "portName"
MAX_LENGTH_DOMAIN_NAME = 256
DEFAULT_LEASE_TIME = "24"
DefaultVlan = "1"
vlanMinNumber = 1
vlanMaxNumber = 4093
leaseMinTime = 0
leaseMaxTime = 262800
LAN_NAME = "LAN"
DMZ_NAME = "DMZ"
VLAN_NAME = "VLAN"
BDG_NAME = "bdg"
WAN1_NAME = "WAN1"
WAN2_NAME = "WAN2"
defaultGateway = "0.0.0.0"
defaultIp = "0.0.0.0"
ENABLE = "1"
DISABLE = "0"
ROWID = "_ROWID_"
IPV4_ADDRESS_FAMILY = "2"
where = ({}).interfaceName .. " != '" .. DMZ_NAME .. "'"
;({}).networkInterfaceName = "interfaceName"
;({}).VirtualIfName = "VirtualIfName"
;({}).ConnectionType = "ConnectionType"
;({}).ConnectionType6 = "ConnectionType6"
;({}).ifType = "ifType"
;({}).MTU = "MTU"
;({}).ipAddr = "ipaddr"
;({}).subnetmask = "subnetmask"
;({}).gatewayNetwork = "gateway"
;({}).IfStatus = "IfStatus"
;({}).refreshInterval = "refreshInterval"
;({}).autoRefreshFlag = "autoRefreshFlag"
;({}).capabilities = "capabilities"
;({}).restartFwForMe = "restartFwForMe"
;({}).ifGroupId = "ifGroupId"
;({}).dns1 = "dns1"
;({}).dns2 = "dns2"
;({}).DHCP = "DHCP"
BRIDGE_CONNECTION = "bridge"
STATIC_CONNECTION = "ifStatic"
DEFAULT_MTU = "1500"
REFRESH_TIME = "5"
DefaultVlan = "1"
COOKIE = "cookie"
DEFAULT_GATEWAY = "0.0.0.0"
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" then
elseif PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-500_Bx" then
else
end
function ipAddressGet()
  local L0_1, L1_2, L2_3, L3_4
  L0_1 = firstCookieGet
  L1_2 = serverTable
  L2_3 = where
  L0_1 = L0_1(L1_2, L2_3)
  L1_2 = NIL
  if L0_1 == L1_2 then
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.INVALID_COOKIE
    return L1_2
  end
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L2_3 = serverTable
  L3_4 = ROWID
  L1_2 = L1_2(L2_3, L3_4, L0_1, _UPVALUE1_.interfaceName)
  L2_3 = NIL
  if L1_2 == L2_3 then
    L2_3 = _UPVALUE0_
    L2_3 = L2_3.FAILURE
    L3_4 = L0_1
    return L2_3, L3_4
  end
  L2_3 = _UPVALUE1_
  L2_3 = L2_3.AddressFamily
  L3_4 = " = '"
  L2_3 = L2_3 .. L3_4 .. IPV4_ADDRESS_FAMILY .. "' and " .. _UPVALUE1_.networkInterface .. " = '" .. L1_2 .. "'"
  L3_4 = db
  L3_4 = L3_4.getAttributeWhere
  L3_4 = L3_4(subnetTable, L2_3, _UPVALUE1_.ipAddress)
  if L3_4 == NIL then
    return _UPVALUE0_.FAILURE, L0_1
  end
  return _UPVALUE0_.SUCCESS, L0_1, L3_4
end
function ipAddressGetNext(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10
  L1_6 = nextCookieGet
  L2_7 = A0_5
  L3_8 = serverTable
  L4_9 = where
  L2_7 = L1_6(L2_7, L3_8, L4_9)
  L3_8 = FALSE
  if L1_6 == L3_8 then
    L3_8 = NIL
    if L2_7 == L3_8 then
      L3_8 = _UPVALUE0_
      L3_8 = L3_8.NEXT_ROWID_INVALID
      return L3_8
    else
      L3_8 = _UPVALUE0_
      L3_8 = L3_8.INVALID_COOKIE
      return L3_8
    end
  end
  L3_8 = db
  L3_8 = L3_8.getAttribute
  L4_9 = serverTable
  L5_10 = ROWID
  L3_8 = L3_8(L4_9, L5_10, L1_6, _UPVALUE1_.interfaceName)
  L4_9 = NIL
  if L3_8 == L4_9 then
    L4_9 = _UPVALUE0_
    L4_9 = L4_9.FAILURE
    L5_10 = L1_6
    return L4_9, L5_10
  end
  L4_9 = _UPVALUE1_
  L4_9 = L4_9.AddressFamily
  L5_10 = " = '"
  L4_9 = L4_9 .. L5_10 .. IPV4_ADDRESS_FAMILY .. "' and " .. _UPVALUE1_.networkInterface .. " = '" .. L3_8 .. "'"
  L5_10 = db
  L5_10 = L5_10.getAttributeWhere
  L5_10 = L5_10(subnetTable, L4_9, _UPVALUE1_.ipAddress)
  if L5_10 == NIL then
    return _UPVALUE0_.FAILURE, L1_6
  end
  return _UPVALUE0_.SUCCESS, L1_6, L5_10
end
function ipAddressSet(A0_11, A1_12)
  local L2_13, L3_14
  L2_13 = checkCookieExists
  L3_14 = A0_11
  L2_13 = L2_13(L3_14, serverTable, where)
  L3_14 = FALSE
  if L2_13 == L3_14 then
    L2_13 = _UPVALUE0_
    L2_13 = L2_13.INVALID_COOKIE
    return L2_13
  end
  L2_13 = NIL
  if A1_12 == L2_13 then
    L2_13 = _UPVALUE0_
    L2_13 = L2_13.INVALID_ARGUMENT
    return L2_13
  end
  L2_13 = _UPVALUE1_
  L2_13 = L2_13.ipAddressCheck
  L3_14 = IPV4_ADDRESS_FAMILY
  L2_13 = L2_13(L3_14, A1_12)
  valid = L2_13
  L2_13 = valid
  L3_14 = _UPVALUE0_
  L3_14 = L3_14.ERROR
  if L2_13 == L3_14 then
    L2_13 = _UPVALUE0_
    L2_13 = L2_13.INVALID_ARGUMENT
    return L2_13
  end
  L2_13 = db
  L2_13 = L2_13.getAttribute
  L3_14 = serverTable
  L2_13 = L2_13(L3_14, ROWID, A0_11, _UPVALUE2_.interfaceName)
  L3_14 = NIL
  if L2_13 == L3_14 then
    L3_14 = _UPVALUE0_
    L3_14 = L3_14.FAILURE
    return L3_14, A0_11
  end
  L3_14 = _UPVALUE2_
  L3_14 = L3_14.AddressFamily
  L3_14 = L3_14 .. " = '" .. IPV4_ADDRESS_FAMILY .. "' and " .. _UPVALUE2_.networkInterface .. " = '" .. L2_13 .. "'"
  if db.setAttributeWhere(subnetTable, L3_14, _UPVALUE2_.ipAddress, A1_12) == NIL then
    return _UPVALUE0_.FAILURE, A0_11
  end
  return _UPVALUE0_.SUCCESS, A0_11
end
function ipAddressDelete(A0_15)
  local L2_16
  L2_16 = _UPVALUE0_
  L2_16 = L2_16.NOT_SUPPORTED
  return L2_16, A0_15
end
function subnetMaskGet()
  local L0_17, L1_18, L2_19, L3_20, L4_21
  L0_17 = firstCookieGet
  L1_18 = serverTable
  L2_19 = where
  L0_17 = L0_17(L1_18, L2_19)
  L1_18 = NIL
  if L0_17 == L1_18 then
    L1_18 = _UPVALUE0_
    L1_18 = L1_18.INVALID_COOKIE
    return L1_18
  end
  L1_18 = db
  L1_18 = L1_18.getAttribute
  L2_19 = serverTable
  L3_20 = ROWID
  L4_21 = L0_17
  L1_18 = L1_18(L2_19, L3_20, L4_21, _UPVALUE1_.interfaceName)
  L2_19 = NIL
  if L1_18 == L2_19 then
    L2_19 = _UPVALUE0_
    L2_19 = L2_19.FAILURE
    L3_20 = L0_17
    return L2_19, L3_20
  end
  L2_19 = db
  L2_19 = L2_19.getAttribute
  L3_20 = serverTable
  L4_21 = ROWID
  L2_19 = L2_19(L3_20, L4_21, L0_17, _UPVALUE1_.interfaceName)
  L3_20 = NIL
  if L2_19 == L3_20 then
    L3_20 = _UPVALUE0_
    L3_20 = L3_20.FAILURE
    L4_21 = L0_17
    return L3_20, L4_21
  end
  L3_20 = _UPVALUE1_
  L3_20 = L3_20.AddressFamily
  L4_21 = " = '"
  L3_20 = L3_20 .. L4_21 .. IPV4_ADDRESS_FAMILY .. "' and " .. _UPVALUE1_.networkInterface .. " = '" .. L2_19 .. "'"
  L4_21 = db
  L4_21 = L4_21.getAttributeWhere
  L4_21 = L4_21(subnetTable, L3_20, _UPVALUE1_.subnetMask)
  if L4_21 == NIL then
    return _UPVALUE0_.FAILURE, L0_17
  end
  return _UPVALUE0_.SUCCESS, L0_17, L4_21
end
function subnetMaskGetNext(A0_22)
  local L1_23, L2_24, L3_25, L4_26, L5_27
  L1_23 = nextCookieGet
  L2_24 = A0_22
  L3_25 = serverTable
  L4_26 = where
  L2_24 = L1_23(L2_24, L3_25, L4_26)
  L3_25 = FALSE
  if L1_23 == L3_25 then
    L3_25 = NIL
    if L2_24 == L3_25 then
      L3_25 = _UPVALUE0_
      L3_25 = L3_25.NEXT_ROWID_INVALID
      return L3_25
    else
      L3_25 = _UPVALUE0_
      L3_25 = L3_25.INVALID_COOKIE
      return L3_25
    end
  end
  L3_25 = db
  L3_25 = L3_25.getAttribute
  L4_26 = serverTable
  L5_27 = ROWID
  L3_25 = L3_25(L4_26, L5_27, L1_23, _UPVALUE1_.interfaceName)
  L4_26 = NIL
  if L3_25 == L4_26 then
    L4_26 = _UPVALUE0_
    L4_26 = L4_26.FAILURE
    L5_27 = L1_23
    return L4_26, L5_27
  end
  L4_26 = _UPVALUE1_
  L4_26 = L4_26.AddressFamily
  L5_27 = " = '"
  L4_26 = L4_26 .. L5_27 .. IPV4_ADDRESS_FAMILY .. "' and " .. _UPVALUE1_.networkInterface .. " = '" .. L3_25 .. "'"
  L5_27 = db
  L5_27 = L5_27.getAttributeWhere
  L5_27 = L5_27(subnetTable, L4_26, _UPVALUE1_.subnetMask)
  if L5_27 == NIL then
    return _UPVALUE0_.FAILURE, L1_23
  end
  return _UPVALUE0_.SUCCESS, L1_23, L5_27
end
function subnetMaskSet(A0_28, A1_29)
  local L2_30, L3_31
  L2_30 = checkCookieExists
  L3_31 = A0_28
  L2_30 = L2_30(L3_31, serverTable, where)
  L3_31 = FALSE
  if L2_30 == L3_31 then
    L2_30 = _UPVALUE0_
    L2_30 = L2_30.INVALID_COOKIE
    return L2_30
  end
  L2_30 = NIL
  if A1_29 == L2_30 then
    L2_30 = _UPVALUE0_
    L2_30 = L2_30.INVALID_ARGUMENT
    return L2_30
  end
  L2_30 = _UPVALUE1_
  L2_30 = L2_30.ipAddressCheck
  L3_31 = IPV4_ADDRESS_FAMILY
  L2_30 = L2_30(L3_31, A1_29)
  valid = L2_30
  L2_30 = valid
  L3_31 = _UPVALUE0_
  L3_31 = L3_31.ERROR
  if L2_30 == L3_31 then
    L2_30 = _UPVALUE0_
    L2_30 = L2_30.INVALID_ARGUMENT
    return L2_30
  end
  L2_30 = db
  L2_30 = L2_30.getAttribute
  L3_31 = serverTable
  L2_30 = L2_30(L3_31, ROWID, A0_28, _UPVALUE2_.interfaceName)
  L3_31 = NIL
  if L2_30 == L3_31 then
    L3_31 = _UPVALUE0_
    L3_31 = L3_31.FAILURE
    return L3_31, A0_28
  end
  L3_31 = _UPVALUE2_
  L3_31 = L3_31.AddressFamily
  L3_31 = L3_31 .. " = '" .. IPV4_ADDRESS_FAMILY .. "' and " .. _UPVALUE2_.networkInterface .. " = '" .. L2_30 .. "'"
  if db.setAttributeWhere(subnetTable, L3_31, _UPVALUE2_.subnetMask, A1_29) == NIL then
    return _UPVALUE0_.FAILURE, A0_28
  end
  return _UPVALUE0_.SUCCESS, A0_28
end
function typeFind(A0_32)
  local L1_33
  L1_33 = NIL
  if A0_32 == L1_33 then
    L1_33 = _UPVALUE0_
    L1_33 = L1_33.INVALID_ARGUMENT
    return L1_33
  end
  L1_33 = db
  L1_33 = L1_33.getAttribute
  L1_33 = L1_33(serverTable, _UPVALUE1_.interfaceName, A0_32, ROWID)
  if L1_33 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_33
end
function typeGet()
  local L1_34
  L1_34 = _UPVALUE0_
  L1_34 = L1_34.NOT_SUPPORTED
  return L1_34, cookie
end
function typeGetNext(A0_35)
  local L2_36
  L2_36 = _UPVALUE0_
  L2_36 = L2_36.NOT_SUPPORTED
  return L2_36, A0_35
end
function typeSet(A0_37, A1_38)
  local L3_39
  L3_39 = _UPVALUE0_
  L3_39 = L3_39.NOT_SUPPORTED
  return L3_39, A0_37
end
function vlanIdGet()
  local L0_40, L1_41, L2_42
  L0_40 = firstCookieGet
  L1_41 = serverTable
  L2_42 = where
  L0_40 = L0_40(L1_41, L2_42)
  L1_41 = NIL
  if L0_40 == L1_41 then
    L1_41 = _UPVALUE0_
    L1_41 = L1_41.INVALID_COOKIE
    return L1_41
  end
  L1_41 = db
  L1_41 = L1_41.getAttribute
  L2_42 = serverTable
  L1_41 = L1_41(L2_42, ROWID, L0_40, _UPVALUE1_.interfaceName)
  L2_42 = NIL
  if L1_41 == L2_42 then
    L2_42 = _UPVALUE0_
    L2_42 = L2_42.FAILURE
    return L2_42, L0_40
  end
  L2_42 = string
  L2_42 = L2_42.match
  L2_42 = L2_42(L1_41, "%d+")
  if L2_42 == NIL then
    return _UPVALUE0_.FAILURE, L0_40
  end
  return _UPVALUE0_.SUCCESS, L0_40, L2_42
end
function vlanIdGetNext(A0_43)
  local L1_44, L2_45, L3_46, L4_47
  L1_44 = nextCookieGet
  L2_45 = A0_43
  L3_46 = serverTable
  L4_47 = where
  L2_45 = L1_44(L2_45, L3_46, L4_47)
  L3_46 = FALSE
  if L1_44 == L3_46 then
    L3_46 = NIL
    if L2_45 == L3_46 then
      L3_46 = _UPVALUE0_
      L3_46 = L3_46.NEXT_ROWID_INVALID
      return L3_46
    else
      L3_46 = _UPVALUE0_
      L3_46 = L3_46.INVALID_COOKIE
      return L3_46
    end
  end
  L3_46 = db
  L3_46 = L3_46.getAttribute
  L4_47 = serverTable
  L3_46 = L3_46(L4_47, ROWID, L1_44, _UPVALUE1_.interfaceName)
  L4_47 = NIL
  if L3_46 == L4_47 then
    L4_47 = _UPVALUE0_
    L4_47 = L4_47.FAILURE
    return L4_47, L1_44
  end
  L4_47 = string
  L4_47 = L4_47.match
  L4_47 = L4_47(L3_46, "%d+")
  if L4_47 == NIL then
    return _UPVALUE0_.FAILURE, A0_43
  end
  return _UPVALUE0_.SUCCESS, L1_44, L4_47
end
function vlanIdSet(A0_48, A1_49)
  local L3_50
  L3_50 = _UPVALUE0_
  L3_50 = L3_50.NOT_SUPPORTED
  return L3_50, rowId
end
function domainGet()
  local L0_51, L1_52
  L0_51 = firstCookieGet
  L1_52 = serverTable
  L0_51 = L0_51(L1_52, where)
  L1_52 = NIL
  if L0_51 == L1_52 then
    L1_52 = _UPVALUE0_
    L1_52 = L1_52.INVALID_COOKIE
    return L1_52
  end
  L1_52 = db
  L1_52 = L1_52.getAttribute
  L1_52 = L1_52(serverTable, ROWID, L0_51, _UPVALUE1_.domain)
  if L1_52 == NIL then
    return _UPVALUE0_.FAILURE, L0_51
  end
  return _UPVALUE0_.SUCCESS, L0_51, L1_52
end
function domainGetNext(A0_53)
  local L1_54, L2_55, L3_56
  L1_54 = nextCookieGet
  L2_55 = A0_53
  L3_56 = serverTable
  L2_55 = L1_54(L2_55, L3_56, where)
  L3_56 = FALSE
  if L1_54 == L3_56 then
    L3_56 = NIL
    if L2_55 == L3_56 then
      L3_56 = _UPVALUE0_
      L3_56 = L3_56.NEXT_ROWID_INVALID
      return L3_56
    else
      L3_56 = _UPVALUE0_
      L3_56 = L3_56.INVALID_COOKIE
      return L3_56
    end
  end
  L3_56 = db
  L3_56 = L3_56.getAttribute
  L3_56 = L3_56(serverTable, ROWID, L1_54, _UPVALUE1_.domain)
  if L3_56 == NIL then
    return _UPVALUE0_.FAILURE, A0_53
  end
  return _UPVALUE0_.SUCCESS, A0_53, L3_56
end
function domainSet(A0_57, A1_58)
  if checkCookieExists(A0_57, serverTable, where) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if A1_58 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(serverTable, ROWID, A0_57, _UPVALUE1_.domain, A1_58) == NIL then
    return _UPVALUE0_.FAILURE, A0_57
  end
  return _UPVALUE0_.SUCCESS, A0_57
end
function startIpAddressGet()
  local L0_59, L1_60
  L0_59 = firstCookieGet
  L1_60 = serverTable
  L0_59 = L0_59(L1_60, where)
  L1_60 = NIL
  if L0_59 == L1_60 then
    L1_60 = _UPVALUE0_
    L1_60 = L1_60.INVALID_COOKIE
    return L1_60
  end
  L1_60 = db
  L1_60 = L1_60.getAttribute
  L1_60 = L1_60(serverTable, ROWID, L0_59, _UPVALUE1_.startIpAddress)
  if L1_60 == NIL then
    return _UPVALUE0_.FAILURE, L0_59
  end
  return _UPVALUE0_.SUCCESS, L0_59, L1_60
end
function startIpAddressGetNext(A0_61)
  local L1_62, L2_63, L3_64
  L1_62 = nextCookieGet
  L2_63 = A0_61
  L3_64 = serverTable
  L2_63 = L1_62(L2_63, L3_64, where)
  L3_64 = FALSE
  if L1_62 == L3_64 then
    L3_64 = NIL
    if L2_63 == L3_64 then
      L3_64 = _UPVALUE0_
      L3_64 = L3_64.NEXT_ROWID_INVALID
      return L3_64
    else
      L3_64 = _UPVALUE0_
      L3_64 = L3_64.INVALID_COOKIE
      return L3_64
    end
  end
  L3_64 = db
  L3_64 = L3_64.getAttribute
  L3_64 = L3_64(serverTable, ROWID, L1_62, _UPVALUE1_.startIpAddress)
  if L3_64 == NIL then
    return _UPVALUE0_.FAILURE, L1_62
  end
  return _UPVALUE0_.SUCCESS, L1_62, L3_64
end
function startIpAddressSet(A0_65, A1_66)
  if checkCookieExists(A0_65, serverTable, where) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if A1_66 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck(IPV4_ADDRESS_FAMILY, A1_66)
  if valid == _UPVALUE0_.ERROR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(serverTable, ROWID, A0_65, _UPVALUE2_.startIpAddress, A1_66) == NIL then
    return _UPVALUE0_.FAILURE, A0_65
  end
  return _UPVALUE0_.SUCCESS, A0_65
end
function endIpAddressGet()
  local L0_67, L1_68
  L0_67 = firstCookieGet
  L1_68 = serverTable
  L0_67 = L0_67(L1_68, where)
  L1_68 = NIL
  if L0_67 == L1_68 then
    L1_68 = _UPVALUE0_
    L1_68 = L1_68.INVALID_COOKIE
    return L1_68
  end
  L1_68 = db
  L1_68 = L1_68.getAttribute
  L1_68 = L1_68(serverTable, ROWID, L0_67, _UPVALUE1_.endIpAddress)
  if L1_68 == NIL then
    return _UPVALUE0_.FAILURE, L0_67
  end
  return _UPVALUE0_.SUCCESS, L0_67, L1_68
end
function endIpAddressGetNext(A0_69)
  local L1_70, L2_71, L3_72
  L1_70 = nextCookieGet
  L2_71 = A0_69
  L3_72 = serverTable
  L2_71 = L1_70(L2_71, L3_72, where)
  L3_72 = FALSE
  if L1_70 == L3_72 then
    L3_72 = NIL
    if L2_71 == L3_72 then
      L3_72 = _UPVALUE0_
      L3_72 = L3_72.NEXT_ROWID_INVALID
      return L3_72
    else
      L3_72 = _UPVALUE0_
      L3_72 = L3_72.INVALID_COOKIE
      return L3_72
    end
  end
  L3_72 = db
  L3_72 = L3_72.getAttribute
  L3_72 = L3_72(serverTable, ROWID, L1_70, _UPVALUE1_.endIpAddress)
  if L3_72 == NIL then
    return _UPVALUE0_.FAILURE, L1_70
  end
  return _UPVALUE0_.SUCCESS, L1_70, L3_72
end
function endIpAddressSet(A0_73, A1_74)
  if checkCookieExists(A0_73, serverTable, where) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if A1_74 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck(IPV4_ADDRESS_FAMILY, A1_74)
  if valid == _UPVALUE0_.ERROR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(serverTable, ROWID, A0_73, _UPVALUE2_.endIpAddress, A1_74) == NIL then
    return _UPVALUE0_.FAILURE, A0_73
  end
  return _UPVALUE0_.SUCCESS, A0_73
end
function gatewayGet()
  local L0_75, L1_76
  L0_75 = firstCookieGet
  L1_76 = serverTable
  L0_75 = L0_75(L1_76, where)
  L1_76 = NIL
  if L0_75 == L1_76 then
    L1_76 = _UPVALUE0_
    L1_76 = L1_76.INVALID_COOKIE
    return L1_76
  end
  L1_76 = db
  L1_76 = L1_76.getAttribute
  L1_76 = L1_76(serverTable, ROWID, L0_75, _UPVALUE1_.gateway)
  if L1_76 == NIL then
    return _UPVALUE0_.FAILURE, L0_75
  end
  return _UPVALUE0_.SUCCESS, L0_75, L1_76
end
function gatewayGetNext(A0_77)
  local L1_78, L2_79, L3_80
  L1_78 = nextCookieGet
  L2_79 = A0_77
  L3_80 = serverTable
  L2_79 = L1_78(L2_79, L3_80, where)
  L3_80 = FALSE
  if L1_78 == L3_80 then
    L3_80 = NIL
    if L2_79 == L3_80 then
      L3_80 = _UPVALUE0_
      L3_80 = L3_80.NEXT_ROWID_INVALID
      return L3_80
    else
      L3_80 = _UPVALUE0_
      L3_80 = L3_80.INVALID_COOKIE
      return L3_80
    end
  end
  L3_80 = db
  L3_80 = L3_80.getAttribute
  L3_80 = L3_80(serverTable, ROWID, L1_78, _UPVALUE1_.gateway)
  if L3_80 == NIL then
    return _UPVALUE0_.FAILURE, L1_78
  end
  return _UPVALUE0_.SUCCESS, L1_78, L3_80
end
function gatewaySet(A0_81, A1_82)
  local L2_83, L3_84, L4_85, L5_86
  L2_83 = checkCookieExists
  L3_84 = A0_81
  L4_85 = serverTable
  L5_86 = where
  L2_83 = L2_83(L3_84, L4_85, L5_86)
  L3_84 = FALSE
  if L2_83 == L3_84 then
    L2_83 = _UPVALUE0_
    L2_83 = L2_83.INVALID_COOKIE
    return L2_83
  end
  L2_83 = NIL
  if A1_82 == L2_83 then
    L2_83 = _UPVALUE0_
    L2_83 = L2_83.INVALID_ARGUMENT
    return L2_83
  end
  L2_83 = nil
  L3_84 = _UPVALUE1_
  L3_84 = L3_84.ipAddressCheck
  L4_85 = IPV4_ADDRESS_FAMILY
  L5_86 = A1_82
  L3_84 = L3_84(L4_85, L5_86)
  L2_83 = L3_84
  L3_84 = _UPVALUE0_
  L3_84 = L3_84.ERROR
  if L2_83 == L3_84 then
    L3_84 = _UPVALUE0_
    L3_84 = L3_84.INVALID_ARGUMENT
    return L3_84
  end
  L3_84 = db
  L3_84 = L3_84.getAttribute
  L4_85 = serverTable
  L5_86 = ROWID
  L3_84 = L3_84(L4_85, L5_86, A0_81, _UPVALUE2_.interfaceName)
  interFaceName = L3_84
  L3_84 = _UPVALUE2_
  L3_84 = L3_84.AddressFamily
  L4_85 = " = '"
  L5_86 = IPV4_ADDRESS_FAMILY
  L3_84 = L3_84 .. L4_85 .. L5_86 .. "' and " .. _UPVALUE2_.networkInterface .. " = '" .. interFaceName .. "'"
  L4_85 = db
  L4_85 = L4_85.getAttributeWhere
  L5_86 = subnetTable
  L4_85 = L4_85(L5_86, L3_84, _UPVALUE2_.ipAddress)
  L5_86 = NIL
  if L4_85 == L5_86 then
    L5_86 = _UPVALUE0_
    L5_86 = L5_86.FAILURE
    return L5_86, A0_81
  end
  L5_86 = db
  L5_86 = L5_86.getAttributeWhere
  L5_86 = L5_86(subnetTable, L3_84, _UPVALUE2_.subnetMask)
  if L5_86 == NIL then
    return _UPVALUE0_.FAILURE, A0_81
  end
  L2_83 = _UPVALUE1_.ipv4SingleMaskCheck(L4_85, L5_86, A1_82)
  if L2_83 == _UPVALUE0_.ERROR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(serverTable, ROWID, A0_81, _UPVALUE2_.gateway, A1_82) == NIL then
    return _UPVALUE0_.FAILURE, A0_81
  end
  return _UPVALUE0_.SUCCESS, A0_81
end
function primaryDnsServerGet()
  local L0_87, L1_88
  L0_87 = firstCookieGet
  L1_88 = serverTable
  L0_87 = L0_87(L1_88, where)
  L1_88 = NIL
  if L0_87 == L1_88 then
    L1_88 = _UPVALUE0_
    L1_88 = L1_88.INVALID_COOKIE
    return L1_88
  end
  L1_88 = db
  L1_88 = L1_88.getAttribute
  L1_88 = L1_88(serverTable, ROWID, L0_87, _UPVALUE1_.primaryDnsServer)
  if L1_88 == NIL then
    return _UPVALUE0_.FAILURE, L0_87
  end
  return _UPVALUE0_.SUCCESS, L0_87, L1_88
end
function primaryDnsServerGetNext(A0_89)
  local L1_90, L2_91, L3_92
  L1_90 = nextCookieGet
  L2_91 = A0_89
  L3_92 = serverTable
  L2_91 = L1_90(L2_91, L3_92, where)
  L3_92 = FALSE
  if L1_90 == L3_92 then
    L3_92 = NIL
    if L2_91 == L3_92 then
      L3_92 = _UPVALUE0_
      L3_92 = L3_92.NEXT_ROWID_INVALID
      return L3_92
    else
      L3_92 = _UPVALUE0_
      L3_92 = L3_92.INVALID_COOKIE
      return L3_92
    end
  end
  L3_92 = db
  L3_92 = L3_92.getAttribute
  L3_92 = L3_92(serverTable, ROWID, L1_90, _UPVALUE1_.primaryDnsServer)
  if L3_92 == NIL then
    return _UPVALUE0_.FAILURE, L1_90
  end
  return _UPVALUE0_.SUCCESS, L1_90, L3_92
end
function primaryDnsServerSet(A0_93, A1_94)
  local L2_95
  L2_95 = checkCookieExists
  L2_95 = L2_95(A0_93, serverTable, where)
  if L2_95 == FALSE then
    L2_95 = _UPVALUE0_
    L2_95 = L2_95.INVALID_COOKIE
    return L2_95
  end
  L2_95 = NIL
  if A1_94 == L2_95 then
    L2_95 = _UPVALUE0_
    L2_95 = L2_95.INVALID_ARGUMENT
    return L2_95
  end
  L2_95 = nil
  L2_95 = _UPVALUE1_.ipAddressCheck(IPV4_ADDRESS_FAMILY, A1_94)
  if L2_95 == _UPVALUE0_.ERROR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(serverTable, ROWID, A0_93, _UPVALUE2_.primaryDnsServer, A1_94) == NIL then
    return _UPVALUE0_.FAILURE, A0_93
  end
  return _UPVALUE0_.SUCCESS, A0_93
end
function secondaryDnsServerGet()
  local L0_96, L1_97
  L0_96 = firstCookieGet
  L1_97 = serverTable
  L0_96 = L0_96(L1_97, where)
  L1_97 = NIL
  if L0_96 == L1_97 then
    L1_97 = _UPVALUE0_
    L1_97 = L1_97.INVALID_COOKIE
    return L1_97
  end
  L1_97 = db
  L1_97 = L1_97.getAttribute
  L1_97 = L1_97(serverTable, ROWID, L0_96, _UPVALUE1_.secondaryDnsServer)
  if L1_97 == NIL then
    return _UPVALUE0_.FAILURE, L0_96
  end
  return _UPVALUE0_.SUCCESS, L0_96, L1_97
end
function secondaryDnsServerGetNext(A0_98)
  local L1_99, L2_100, L3_101
  L1_99 = nextCookieGet
  L2_100 = A0_98
  L3_101 = serverTable
  L2_100 = L1_99(L2_100, L3_101, where)
  L3_101 = FALSE
  if L1_99 == L3_101 then
    L3_101 = NIL
    if L2_100 == L3_101 then
      L3_101 = _UPVALUE0_
      L3_101 = L3_101.NEXT_ROWID_INVALID
      return L3_101
    else
      L3_101 = _UPVALUE0_
      L3_101 = L3_101.INVALID_COOKIE
      return L3_101
    end
  end
  L3_101 = db
  L3_101 = L3_101.getAttribute
  L3_101 = L3_101(serverTable, ROWID, L1_99, _UPVALUE1_.secondaryDnsServer)
  if L3_101 == NIL then
    return _UPVALUE0_.FAILURE, L1_99
  end
  return _UPVALUE0_.SUCCESS, L1_99, L3_101
end
function secondaryDnsServerSet(A0_102, A1_103)
  local L2_104
  L2_104 = checkCookieExists
  L2_104 = L2_104(A0_102, serverTable, where)
  if L2_104 == FALSE then
    L2_104 = _UPVALUE0_
    L2_104 = L2_104.INVALID_COOKIE
    return L2_104
  end
  L2_104 = NIL
  if A1_103 == L2_104 then
    L2_104 = _UPVALUE0_
    L2_104 = L2_104.INVALID_ARGUMENT
    return L2_104
  end
  L2_104 = nil
  L2_104 = _UPVALUE1_.ipAddressCheck(IPV4_ADDRESS_FAMILY, primaryDnsServer)
  if L2_104 == _UPVALUE0_.ERROR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(serverTable, ROWID, A0_102, _UPVALUE2_.secondaryDnsServer, A1_103) == NIL then
    return _UPVALUE0_.FAILURE, A0_102
  end
  return _UPVALUE0_.SUCCESS, A0_102
end
function leaseTimeGet()
  local L0_105, L1_106
  L0_105 = firstCookieGet
  L1_106 = serverTable
  L0_105 = L0_105(L1_106, where)
  L1_106 = NIL
  if L0_105 == L1_106 then
    L1_106 = _UPVALUE0_
    L1_106 = L1_106.INVALID_COOKIE
    return L1_106
  end
  L1_106 = db
  L1_106 = L1_106.getAttribute
  L1_106 = L1_106(serverTable, ROWID, L0_105, _UPVALUE1_.leaseTime)
  if L1_106 == NIL then
    return _UPVALUE0_.FAILURE, L0_105
  end
  return _UPVALUE0_.SUCCESS, L0_105, L1_106
end
function leaseTimeGetNext(A0_107)
  local L1_108, L2_109, L3_110
  L1_108 = nextCookieGet
  L2_109 = A0_107
  L3_110 = serverTable
  L2_109 = L1_108(L2_109, L3_110, where)
  L3_110 = FALSE
  if L1_108 == L3_110 then
    L3_110 = NIL
    if L2_109 == L3_110 then
      L3_110 = _UPVALUE0_
      L3_110 = L3_110.NEXT_ROWID_INVALID
      return L3_110
    else
      L3_110 = _UPVALUE0_
      L3_110 = L3_110.INVALID_COOKIE
      return L3_110
    end
  end
  L3_110 = db
  L3_110 = L3_110.getAttribute
  L3_110 = L3_110(serverTable, ROWID, L1_108, _UPVALUE1_.leaseTime)
  if L3_110 == NIL then
    return _UPVALUE0_.FAILURE, L1_108
  end
  return _UPVALUE0_.SUCCESS, L1_108, L3_110
end
function leaseTimeSet(A0_111, A1_112)
  if checkCookieExists(A0_111, serverTable, where) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if A1_112 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_112) < leaseMinTime or tonumber(A1_112) > leaseMaxTime then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(serverTable, ROWID, A0_111, _UPVALUE1_.leaseTime, A1_112) == NIL then
    return _UPVALUE0_.FAILURE, A0_111
  end
  return _UPVALUE0_.SUCCESS, A0_111
end
function dhcpServerVLANGet(A0_113)
  local L1_114, L2_115, L3_116, L4_117
  L1_114 = NIL
  if A0_113 == L1_114 then
    L1_114 = _UPVALUE0_
    L1_114 = L1_114.INVALID_COOKIE
    return L1_114
  end
  L1_114 = db
  L1_114 = L1_114.getRow
  L2_115 = serverTable
  L3_116 = ROWID
  L4_117 = A0_113
  L1_114 = L1_114(L2_115, L3_116, L4_117)
  L2_115 = NIL
  if L1_114 == L2_115 then
    L2_115 = _UPVALUE0_
    L2_115 = L2_115.FAILURE
    L3_116 = A0_113
    return L2_115, L3_116
  end
  L2_115 = db
  L2_115 = L2_115.getAttribute
  L3_116 = serverTable
  L4_117 = ROWID
  L2_115 = L2_115(L3_116, L4_117, A0_113, _UPVALUE1_.interfaceName)
  L3_116 = NIL
  if L2_115 == L3_116 then
    L3_116 = _UPVALUE0_
    L3_116 = L3_116.FAILURE
    L4_117 = A0_113
    return L3_116, L4_117
  end
  L3_116 = string
  L3_116 = L3_116.match
  L4_117 = L2_115
  L3_116 = L3_116(L4_117, "%d+")
  L4_117 = NIL
  if L3_116 == L4_117 then
    L3_116 = "1"
  end
  L4_117 = _UPVALUE1_
  L4_117 = L4_117.AddressFamily
  L4_117 = L4_117 .. " = '" .. IPV4_ADDRESS_FAMILY .. "' and " .. _UPVALUE1_.networkInterface .. " = '" .. L2_115 .. "'"
  if db.getRowWhere(subnetTable, L4_117) == NIL then
    return _UPVALUE0_.FAILURE, A0_113
  end
  return _UPVALUE0_.SUCCESS, A0_113, db.getRowWhere(subnetTable, L4_117)[subnetTable .. "." .. _UPVALUE1_.ipAddress], db.getRowWhere(subnetTable, L4_117)[subnetTable .. "." .. _UPVALUE1_.subnetMask], L3_116, L1_114[serverTable .. "." .. _UPVALUE1_.startIpAddress], L1_114[serverTable .. "." .. _UPVALUE1_.endIpAddress], L1_114[serverTable .. "." .. _UPVALUE1_.gateway], L1_114[serverTable .. "." .. _UPVALUE1_.primaryDnsServer], L1_114[serverTable .. "." .. _UPVALUE1_.secondaryDnsServer], L1_114[serverTable .. "." .. _UPVALUE1_.domain], L1_114[serverTable .. "." .. _UPVALUE1_.leaseTime]
end
function dhcpServerVLANGetAll()
  local L0_118, L1_119, L2_120, L3_121
  L0_118 = db
  L0_118 = L0_118.getRowsWhere
  L1_119 = serverTable
  L2_120 = where
  L0_118 = L0_118(L1_119, L2_120)
  L1_119 = NIL
  if L0_118 == L1_119 then
    L1_119 = _UPVALUE0_
    L1_119 = L1_119.FAILURE
    return L1_119
  end
  L1_119 = _UPVALUE1_
  L1_119 = L1_119.AddressFamily
  L2_120 = " = '"
  L3_121 = IPV4_ADDRESS_FAMILY
  L1_119 = L1_119 .. L2_120 .. L3_121 .. "' and " .. _UPVALUE1_.networkInterface .. " != '" .. DMZ_NAME .. "'" .. " and " .. _UPVALUE1_.networkInterface .. " != '" .. WAN1_NAME .. "'" .. " and " .. _UPVALUE1_.networkInterface .. " != '" .. WAN2_NAME .. "'"
  L2_120 = db
  L2_120 = L2_120.getRowsWhere
  L3_121 = subnetTable
  L2_120 = L2_120(L3_121, L1_119)
  L3_121 = NIL
  if L2_120 == L3_121 then
    L3_121 = _UPVALUE0_
    L3_121 = L3_121.FAILURE
    return L3_121
  end
  L3_121 = merge2DTable
  L3_121 = L3_121(L0_118, L2_120)
  if L3_121 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L3_121
end
function dhcpServerVLANGetNext(A0_122)
  local L1_123, L2_124, L3_125, L4_126, L5_127, L6_128
  L1_123 = nextCookieGet
  L2_124 = A0_122
  L3_125 = serverTable
  L4_126 = where
  L2_124 = L1_123(L2_124, L3_125, L4_126)
  L3_125 = FALSE
  if L1_123 == L3_125 then
    L3_125 = NIL
    if L2_124 == L3_125 then
      L3_125 = _UPVALUE0_
      L3_125 = L3_125.NEXT_ROWID_INVALID
      return L3_125
    else
      L3_125 = _UPVALUE0_
      L3_125 = L3_125.INVALID_COOKIE
      return L3_125
    end
  end
  L3_125 = db
  L3_125 = L3_125.getRow
  L4_126 = serverTable
  L5_127 = ROWID
  L6_128 = L1_123
  L3_125 = L3_125(L4_126, L5_127, L6_128)
  L4_126 = NIL
  if L3_125 == L4_126 then
    L4_126 = _UPVALUE0_
    L4_126 = L4_126.FAILURE
    L5_127 = L1_123
    return L4_126, L5_127
  end
  L4_126 = db
  L4_126 = L4_126.getAttribute
  L5_127 = serverTable
  L6_128 = ROWID
  L4_126 = L4_126(L5_127, L6_128, L1_123, _UPVALUE1_.interfaceName)
  L5_127 = NIL
  if L4_126 == L5_127 then
    L5_127 = _UPVALUE0_
    L5_127 = L5_127.FAILURE
    L6_128 = L1_123
    return L5_127, L6_128
  end
  L5_127 = string
  L5_127 = L5_127.match
  L6_128 = L4_126
  L5_127 = L5_127(L6_128, "%d+")
  L6_128 = NIL
  if L5_127 == L6_128 then
    L5_127 = "1"
  end
  L6_128 = _UPVALUE1_
  L6_128 = L6_128.AddressFamily
  L6_128 = L6_128 .. " = '" .. IPV4_ADDRESS_FAMILY .. "' and " .. _UPVALUE1_.networkInterface .. " = '" .. L4_126 .. "'"
  if db.getRowWhere(subnetTable, L6_128) == NIL then
    return _UPVALUE0_.FAILURE, L1_123
  end
  return _UPVALUE0_.SUCCESS, L1_123, db.getRowWhere(subnetTable, L6_128)[subnetTable .. "." .. _UPVALUE1_.ipAddress], db.getRowWhere(subnetTable, L6_128)[subnetTable .. "." .. _UPVALUE1_.subnetMask], L5_127, L3_125[serverTable .. "." .. _UPVALUE1_.startIpAddress], L3_125[serverTable .. "." .. _UPVALUE1_.endIpAddress], L3_125[serverTable .. "." .. _UPVALUE1_.gateway], L3_125[serverTable .. "." .. _UPVALUE1_.primaryDnsServer], L3_125[serverTable .. "." .. _UPVALUE1_.secondaryDnsServer], L3_125[serverTable .. "." .. _UPVALUE1_.domain], L3_125[serverTable .. "." .. _UPVALUE1_.leaseTime]
end
function dhcpServerVLANSet(A0_129, A1_130, A2_131, A3_132, A4_133, A5_134, A6_135, A7_136, A8_137, A9_138, A10_139, A11_140)
  local L12_141, L13_142, L14_143, L15_144, L16_145, L17_146, L18_147, L19_148, L20_149, L21_150, L22_151, L23_152
  L12_141 = checkCookieExists
  L13_142 = A0_129
  L14_143 = serverTable
  L15_144 = where
  L12_141 = L12_141(L13_142, L14_143, L15_144)
  L13_142 = FALSE
  if L12_141 == L13_142 then
    L12_141 = _UPVALUE0_
    L12_141 = L12_141.INVALID_COOKIE
    return L12_141
  end
  L12_141 = nil
  L13_142 = NIL
  if A1_130 == L13_142 then
    L13_142 = _UPVALUE1_
    L13_142 = L13_142.COMP_DHCP_SERVER_VLAN_IPADDESS_NIL
    return L13_142
  end
  L13_142 = _UPVALUE2_
  L13_142 = L13_142.ipAddressCheck
  L14_143 = IPV4_ADDRESS_FAMILY
  L15_144 = A1_130
  L13_142 = L13_142(L14_143, L15_144)
  L12_141 = L13_142
  L13_142 = _UPVALUE0_
  L13_142 = L13_142.ERROR
  if L12_141 == L13_142 then
    L13_142 = _UPVALUE1_
    L13_142 = L13_142.COMP_DHCP_SERVER_VLAN_IPADDESS_INVALID
    return L13_142
  end
  L13_142 = NIL
  if A9_138 ~= L13_142 then
    L13_142 = string
    L13_142 = L13_142.len
    L14_143 = A9_138
    L13_142 = L13_142(L14_143)
    L14_143 = MAX_LENGTH_DOMAIN_NAME
    if L13_142 > L14_143 then
      L13_142 = _UPVALUE1_
      L13_142 = L13_142.COMP_DOMAIN_NAME_LENGTH_INVALID
      return L13_142
    end
  end
  L13_142 = NIL
  if A2_131 == L13_142 then
    L13_142 = _UPVALUE1_
    L13_142 = L13_142.COMP_DHCP_SERVER_VLAN_SUBNET_NIL
    return L13_142
  end
  L13_142 = _UPVALUE2_
  L13_142 = L13_142.ipAddressCheck
  L14_143 = IPV4_ADDRESS_FAMILY
  L15_144 = A2_131
  L13_142 = L13_142(L14_143, L15_144)
  L12_141 = L13_142
  L13_142 = _UPVALUE0_
  L13_142 = L13_142.ERROR
  if L12_141 == L13_142 then
    L13_142 = _UPVALUE1_
    L13_142 = L13_142.COMP_DHCP_SERVER_VLAN_SUBNET_INVALID
    return L13_142
  end
  L13_142 = NIL
  if A4_133 ~= L13_142 and A4_133 ~= "" and A11_140 == "Server" then
    L13_142 = _UPVALUE2_
    L13_142 = L13_142.ipAddressCheck
    L14_143 = IPV4_ADDRESS_FAMILY
    L15_144 = A4_133
    L13_142 = L13_142(L14_143, L15_144)
    L12_141 = L13_142
    L13_142 = _UPVALUE0_
    L13_142 = L13_142.ERROR
    if L12_141 == L13_142 then
      L13_142 = _UPVALUE1_
      L13_142 = L13_142.COMP_DHCP_SERVER_VLAN_STARTADDRESS_INVALID
      return L13_142
    end
    L13_142 = _UPVALUE2_
    L13_142 = L13_142.ipv4SingleMaskCheck
    L14_143 = A1_130
    L15_144 = A4_133
    L16_145 = A2_131
    L13_142 = L13_142(L14_143, L15_144, L16_145)
    L12_141 = L13_142
    L13_142 = _UPVALUE0_
    L13_142 = L13_142.ERROR
    if L12_141 == L13_142 then
      L13_142 = _UPVALUE1_
      L13_142 = L13_142.COMP_DHCP_SERVER_VLAN_STARTADDRESS_NOTIN_NETWORK
      return L13_142
    end
  end
  L13_142 = NIL
  if A5_134 ~= L13_142 and A5_134 ~= "" and A11_140 == "Server" then
    L13_142 = _UPVALUE2_
    L13_142 = L13_142.ipAddressCheck
    L14_143 = IPV4_ADDRESS_FAMILY
    L15_144 = A5_134
    L13_142 = L13_142(L14_143, L15_144)
    L12_141 = L13_142
    L13_142 = _UPVALUE0_
    L13_142 = L13_142.ERROR
    if L12_141 == L13_142 then
      L13_142 = _UPVALUE1_
      L13_142 = L13_142.COMP_DHCP_SERVER_VLAN_ENDADDRESS_INVALID
      return L13_142
    end
    L13_142 = _UPVALUE2_
    L13_142 = L13_142.ipv4SingleMaskCheck
    L14_143 = A1_130
    L15_144 = A5_134
    L16_145 = A2_131
    L13_142 = L13_142(L14_143, L15_144, L16_145)
    L12_141 = L13_142
    L13_142 = _UPVALUE0_
    L13_142 = L13_142.ERROR
    if L12_141 == L13_142 then
      L13_142 = _UPVALUE1_
      L13_142 = L13_142.COMP_DHCP_SERVER_VLAN_ENDADDRESS_NOTIN_NETWORK
      return L13_142
    end
  end
  L13_142 = NIL
  if A6_135 ~= L13_142 and A6_135 ~= "" then
    L13_142 = _UPVALUE2_
    L13_142 = L13_142.ipAddressCheck
    L14_143 = IPV4_ADDRESS_FAMILY
    L15_144 = A6_135
    L13_142 = L13_142(L14_143, L15_144)
    L12_141 = L13_142
    L13_142 = _UPVALUE0_
    L13_142 = L13_142.ERROR
    if L12_141 == L13_142 then
      L13_142 = _UPVALUE1_
      L13_142 = L13_142.COMP_DHCP_SERVER_VLAN_GATEWAY_INVALID
      return L13_142
    end
    L13_142 = _UPVALUE2_
    L13_142 = L13_142.ipv4SingleMaskCheck
    L14_143 = A1_130
    L15_144 = A6_135
    L16_145 = A2_131
    L13_142 = L13_142(L14_143, L15_144, L16_145)
    L12_141 = L13_142
    L13_142 = _UPVALUE0_
    L13_142 = L13_142.ERROR
    if L12_141 == L13_142 then
      L13_142 = _UPVALUE1_
      L13_142 = L13_142.COMP_DHCP_SERVER_VLAN_GATEWAY_NOTIN_NETWORK
      return L13_142
    end
  end
  L13_142 = NIL
  if A7_136 ~= L13_142 and A7_136 ~= "" then
    L13_142 = _UPVALUE2_
    L13_142 = L13_142.ipAddressCheck
    L14_143 = IPV4_ADDRESS_FAMILY
    L15_144 = A7_136
    L13_142 = L13_142(L14_143, L15_144)
    L12_141 = L13_142
    L13_142 = _UPVALUE0_
    L13_142 = L13_142.ERROR
    if L12_141 == L13_142 then
      L13_142 = _UPVALUE1_
      L13_142 = L13_142.COMP_DHCP_SERVER_VLAN_PRIMARYDNS_INVALID
      return L13_142
    end
  end
  L13_142 = NIL
  if A8_137 ~= L13_142 and A8_137 ~= "" then
    L13_142 = _UPVALUE2_
    L13_142 = L13_142.ipAddressCheck
    L14_143 = IPV4_ADDRESS_FAMILY
    L15_144 = A8_137
    L13_142 = L13_142(L14_143, L15_144)
    L12_141 = L13_142
    L13_142 = _UPVALUE0_
    L13_142 = L13_142.ERROR
    if L12_141 == L13_142 then
      L13_142 = _UPVALUE1_
      L13_142 = L13_142.COMP_DHCP_SERVER_VLAN_SECONDARYDNS_INVALID
      return L13_142
    end
  end
  L13_142 = NIL
  if A10_139 == L13_142 then
    A10_139 = DEFAULT_LEASE_TIME
  end
  L13_142 = tonumber
  L14_143 = A10_139
  L13_142 = L13_142(L14_143)
  L14_143 = leaseMinTime
  if not (L13_142 < L14_143) then
    L14_143 = leaseMaxTime
  elseif L13_142 > L14_143 then
    L14_143 = _UPVALUE1_
    L14_143 = L14_143.COMP_DHCP_SERVER_VLAN_LEASETIME_INVALID
    return L14_143
  end
  L14_143 = {}
  L15_144 = serverTable
  L16_145 = "."
  L17_146 = _UPVALUE3_
  L17_146 = L17_146.domain
  L15_144 = L15_144 .. L16_145 .. L17_146
  L14_143[L15_144] = A9_138
  L15_144 = serverTable
  L16_145 = "."
  L17_146 = _UPVALUE3_
  L17_146 = L17_146.startIpAddress
  L15_144 = L15_144 .. L16_145 .. L17_146
  L14_143[L15_144] = A4_133
  L15_144 = serverTable
  L16_145 = "."
  L17_146 = _UPVALUE3_
  L17_146 = L17_146.endIpAddress
  L15_144 = L15_144 .. L16_145 .. L17_146
  L14_143[L15_144] = A5_134
  L15_144 = serverTable
  L16_145 = "."
  L17_146 = _UPVALUE3_
  L17_146 = L17_146.gateway
  L15_144 = L15_144 .. L16_145 .. L17_146
  L14_143[L15_144] = A6_135
  L15_144 = serverTable
  L16_145 = "."
  L17_146 = _UPVALUE3_
  L17_146 = L17_146.primaryDnsServer
  L15_144 = L15_144 .. L16_145 .. L17_146
  L14_143[L15_144] = A7_136
  L15_144 = serverTable
  L16_145 = "."
  L17_146 = _UPVALUE3_
  L17_146 = L17_146.secondaryDnsServer
  L15_144 = L15_144 .. L16_145 .. L17_146
  L14_143[L15_144] = A8_137
  L15_144 = serverTable
  L16_145 = "."
  L17_146 = _UPVALUE3_
  L17_146 = L17_146.leaseTime
  L15_144 = L15_144 .. L16_145 .. L17_146
  L14_143[L15_144] = A10_139
  L15_144 = db
  L15_144 = L15_144.update
  L16_145 = serverTable
  L17_146 = L14_143
  L18_147 = A0_129
  L15_144 = L15_144(L16_145, L17_146, L18_147)
  L16_145 = NIL
  if L15_144 == L16_145 then
    L16_145 = _UPVALUE0_
    L16_145 = L16_145.FAILURE
    L17_146 = A0_129
    return L16_145, L17_146
  end
  L16_145 = {}
  L17_146 = subnetTable
  L18_147 = "."
  L19_148 = _UPVALUE3_
  L19_148 = L19_148.ipAddress
  L17_146 = L17_146 .. L18_147 .. L19_148
  L16_145[L17_146] = A1_130
  L17_146 = subnetTable
  L18_147 = "."
  L19_148 = _UPVALUE3_
  L19_148 = L19_148.subnetMask
  L17_146 = L17_146 .. L18_147 .. L19_148
  L16_145[L17_146] = A2_131
  L17_146 = subnetTable
  L18_147 = "."
  L19_148 = _UPVALUE3_
  L19_148 = L19_148.ifGateway
  L17_146 = L17_146 .. L18_147 .. L19_148
  L18_147 = defaultGateway
  L16_145[L17_146] = L18_147
  L17_146 = db
  L17_146 = L17_146.getAttribute
  L18_147 = serverTable
  L19_148 = ROWID
  L20_149 = A0_129
  L21_150 = _UPVALUE3_
  L21_150 = L21_150.interfaceName
  L17_146 = L17_146(L18_147, L19_148, L20_149, L21_150)
  L18_147 = NIL
  if L17_146 == L18_147 then
    L18_147 = _UPVALUE0_
    L18_147 = L18_147.FAILURE
    L19_148 = A0_129
    return L18_147, L19_148
  end
  L18_147 = _UPVALUE3_
  L18_147 = L18_147.AddressFamily
  L19_148 = " = '"
  L20_149 = IPV4_ADDRESS_FAMILY
  L21_150 = "' and "
  L22_151 = _UPVALUE3_
  L22_151 = L22_151.networkInterface
  L23_152 = " = '"
  L18_147 = L18_147 .. L19_148 .. L20_149 .. L21_150 .. L22_151 .. L23_152 .. L17_146 .. "'"
  L19_148 = db
  L19_148 = L19_148.getAttributeWhere
  L20_149 = subnetTable
  L21_150 = L18_147
  L22_151 = ROWID
  L19_148 = L19_148(L20_149, L21_150, L22_151)
  L20_149 = _UPVALUE3_
  L20_149 = L20_149.ipAddress
  L21_150 = " = '"
  L22_151 = A1_130
  L23_152 = "' and "
  L20_149 = L20_149 .. L21_150 .. L22_151 .. L23_152 .. ROWID .. "!='" .. L19_148 .. "'"
  L21_150 = db
  L21_150 = L21_150.existsRowWhere
  L22_151 = subnetTable
  L23_152 = L20_149
  L21_150 = L21_150(L22_151, L23_152)
  status = L21_150
  L21_150 = status
  if L21_150 then
    L21_150 = _UPVALUE1_
    L21_150 = L21_150.COMP_DHCP_SERVER_VLAN_IPADDRESS_EXISTS
    return L21_150
  end
  L21_150 = db
  L21_150 = L21_150.update
  L22_151 = subnetTable
  L23_152 = L16_145
  L21_150 = L21_150(L22_151, L23_152, L19_148)
  L22_151 = NIL
  if L21_150 == L22_151 then
    L22_151 = _UPVALUE0_
    L22_151 = L22_151.FAILURE
    L23_152 = A0_129
    return L22_151, L23_152
  end
  L22_151 = {}
  L23_152 = networkInterfaceTable
  L23_152 = L23_152 .. "." .. _UPVALUE3_.ipAddr
  L22_151[L23_152] = A1_130
  L23_152 = networkInterfaceTable
  L23_152 = L23_152 .. "." .. _UPVALUE3_.subnetmask
  L22_151[L23_152] = A2_131
  L23_152 = db
  L23_152 = L23_152.getAttribute
  L23_152 = L23_152(networkInterfaceTable, _UPVALUE3_.networkInterfaceName, BDG_NAME .. A3_132, ROWID)
  if db.update(networkInterfaceTable, L22_151, L23_152) == NIL then
    return _UPVALUE0_.FAILURE, A0_129
  end
  return _UPVALUE0_.SUCCESS, A0_129
end
function dhcpServerVLANCreate(A0_153, A1_154, A2_155, A3_156, A4_157, A5_158, A6_159, A7_160, A8_161, A9_162, A10_163)
  local L11_164, L12_165, L13_166, L14_167, L15_168, L16_169, L17_170, L18_171, L19_172, L20_173, L21_174, L22_175, L23_176, L24_177, L25_178, L26_179, L27_180, L28_181
  L12_165 = NIL
  if A0_153 == L12_165 then
    L12_165 = _UPVALUE0_
    L12_165 = L12_165.COMP_DHCP_SERVER_VLAN_IPADDESS_NIL
    return L12_165
  end
  L12_165 = "1"
  L13_166 = _UPVALUE1_
  L13_166 = L13_166.ipv6ModeGet
  L15_168 = L13_166()
  L16_169 = DefaultVlan
  if A2_155 == L16_169 then
    L16_169 = _UPVALUE2_
    L16_169 = L16_169.NOT_SUPPORTED
    L17_170 = cookie
    return L16_169, L17_170
  end
  L16_169 = NIL
  if A8_161 ~= L16_169 then
    L16_169 = string
    L16_169 = L16_169.len
    L17_170 = A8_161
    L16_169 = L16_169(L17_170)
    L17_170 = MAX_LENGTH_DOMAIN_NAME
    if L16_169 > L17_170 then
      L16_169 = _UPVALUE0_
      L16_169 = L16_169.COMP_DHCP_SERVER_VLAN_DOMAIN_NAME_LENGTH_INVALID
      return L16_169
    end
  end
  L16_169 = _UPVALUE3_
  L16_169 = L16_169.ipAddressCheck
  L17_170 = IPV4_ADDRESS_FAMILY
  L18_171 = A0_153
  L16_169 = L16_169(L17_170, L18_171)
  L11_164 = L16_169
  L16_169 = _UPVALUE2_
  L16_169 = L16_169.ERROR
  if L11_164 == L16_169 then
    L16_169 = _UPVALUE0_
    L16_169 = L16_169.COMP_DHCP_SERVER_VLAN_IPADDESS_INVALID
    return L16_169
  end
  L16_169 = NIL
  if A1_154 == L16_169 then
    L16_169 = _UPVALUE0_
    L16_169 = L16_169.COMP_DHCP_SERVER_VLAN_SUBNET_NIL
    return L16_169
  end
  L16_169 = _UPVALUE3_
  L16_169 = L16_169.ipAddressCheck
  L17_170 = IPV4_ADDRESS_FAMILY
  L18_171 = A1_154
  L16_169 = L16_169(L17_170, L18_171)
  L11_164 = L16_169
  L16_169 = _UPVALUE2_
  L16_169 = L16_169.ERROR
  if L11_164 == L16_169 then
    L16_169 = _UPVALUE0_
    L16_169 = L16_169.COMP_DHCP_SERVER_VLAN_SUBNET_INVALID
    return L16_169
  end
  L16_169 = NIL
  if A2_155 == L16_169 then
    L16_169 = _UPVALUE0_
    L16_169 = L16_169.COMP_DHCP_SERVER_VLAN_VLANID_NIL
    return L16_169
  else
    L16_169 = tonumber
    L17_170 = A2_155
    L16_169 = L16_169(L17_170)
    L17_170 = vlanMinNumber
    if not (L16_169 < L17_170) then
      L17_170 = vlanMaxNumber
    elseif L16_169 > L17_170 then
      L17_170 = _UPVALUE0_
      L17_170 = L17_170.COMP_DHCP_SERVER_VLAN_VLANID_INVALID
      return L17_170
    end
    L17_170 = LAN_NAME
    L18_171 = A2_155
    L17_170 = L17_170 .. L18_171
    interfaceType = L17_170
  end
  L16_169 = db
  L16_169 = L16_169.existsRow
  L17_170 = serverTable
  L18_171 = _UPVALUE4_
  L18_171 = L18_171.interfaceName
  L19_172 = interfaceType
  L16_169 = L16_169(L17_170, L18_171, L19_172)
  if L16_169 then
    L17_170 = _UPVALUE0_
    L17_170 = L17_170.COMP_DHCP_SERVER_VLAN_VLANID_EXISTS
    return L17_170
  end
  L17_170 = db
  L17_170 = L17_170.existsRow
  L18_171 = subnetTable
  L19_172 = _UPVALUE4_
  L19_172 = L19_172.ipAddress
  L20_173 = A0_153
  L17_170 = L17_170(L18_171, L19_172, L20_173)
  L16_169 = L17_170
  if L16_169 then
    L17_170 = _UPVALUE0_
    L17_170 = L17_170.COMP_DHCP_SERVER_VLAN_IPADDRESS_EXISTS
    return L17_170
  end
  L17_170 = NIL
  if A3_156 ~= L17_170 and A3_156 ~= "" and A10_163 == "Server" then
    L17_170 = _UPVALUE3_
    L17_170 = L17_170.ipAddressCheck
    L18_171 = IPV4_ADDRESS_FAMILY
    L19_172 = A3_156
    L17_170 = L17_170(L18_171, L19_172)
    L11_164 = L17_170
    L17_170 = _UPVALUE2_
    L17_170 = L17_170.ERROR
    if L11_164 == L17_170 then
      L17_170 = _UPVALUE0_
      L17_170 = L17_170.COMP_DHCP_SERVER_VLAN_STARTADDRESS_INVALID
      return L17_170
    end
    L17_170 = _UPVALUE3_
    L17_170 = L17_170.ipv4SingleMaskCheck
    L18_171 = A0_153
    L19_172 = A3_156
    L20_173 = A1_154
    L17_170 = L17_170(L18_171, L19_172, L20_173)
    L11_164 = L17_170
    L17_170 = _UPVALUE2_
    L17_170 = L17_170.ERROR
    if L11_164 == L17_170 then
      L17_170 = _UPVALUE0_
      L17_170 = L17_170.COMP_DHCP_SERVER_VLAN_STARTADDRESS_NOTIN_NETWORK
      return L17_170
    end
  end
  L17_170 = NIL
  if A4_157 ~= L17_170 and A4_157 ~= "" and A10_163 == "Server" then
    L17_170 = _UPVALUE3_
    L17_170 = L17_170.ipAddressCheck
    L18_171 = IPV4_ADDRESS_FAMILY
    L19_172 = A4_157
    L17_170 = L17_170(L18_171, L19_172)
    L11_164 = L17_170
    L17_170 = _UPVALUE2_
    L17_170 = L17_170.ERROR
    if L11_164 == L17_170 then
      L17_170 = _UPVALUE0_
      L17_170 = L17_170.COMP_DHCP_SERVER_VLAN_ENDADDRESS_INVALID
      return L17_170
    end
    L17_170 = _UPVALUE3_
    L17_170 = L17_170.ipv4SingleMaskCheck
    L18_171 = A0_153
    L19_172 = A4_157
    L20_173 = A1_154
    L17_170 = L17_170(L18_171, L19_172, L20_173)
    L11_164 = L17_170
    L17_170 = _UPVALUE2_
    L17_170 = L17_170.ERROR
    if L11_164 == L17_170 then
      L17_170 = _UPVALUE0_
      L17_170 = L17_170.COMP_DHCP_SERVER_VLAN_ENDADDRESS_NOTIN_NETWORK
      return L17_170
    end
  end
  L17_170 = NIL
  if A5_158 ~= L17_170 and A5_158 ~= "" then
    L17_170 = _UPVALUE3_
    L17_170 = L17_170.ipAddressCheck
    L18_171 = IPV4_ADDRESS_FAMILY
    L19_172 = A5_158
    L17_170 = L17_170(L18_171, L19_172)
    L11_164 = L17_170
    L17_170 = _UPVALUE2_
    L17_170 = L17_170.ERROR
    if L11_164 == L17_170 then
      L17_170 = _UPVALUE0_
      L17_170 = L17_170.COMP_DHCP_SERVER_VLAN_GATEWAY_INVALID
      return L17_170
    end
    L17_170 = _UPVALUE3_
    L17_170 = L17_170.ipv4SingleMaskCheck
    L18_171 = A0_153
    L19_172 = A5_158
    L20_173 = A1_154
    L17_170 = L17_170(L18_171, L19_172, L20_173)
    L11_164 = L17_170
    L17_170 = _UPVALUE2_
    L17_170 = L17_170.ERROR
    if L11_164 == L17_170 then
      L17_170 = _UPVALUE0_
      L17_170 = L17_170.COMP_DHCP_SERVER_VLAN_GATEWAY_NOTIN_NETWORK
      return L17_170
    end
  end
  L17_170 = NIL
  if A6_159 ~= L17_170 and A6_159 ~= "" then
    L17_170 = _UPVALUE3_
    L17_170 = L17_170.ipAddressCheck
    L18_171 = IPV4_ADDRESS_FAMILY
    L19_172 = A6_159
    L17_170 = L17_170(L18_171, L19_172)
    L11_164 = L17_170
    L17_170 = _UPVALUE2_
    L17_170 = L17_170.ERROR
    if L11_164 == L17_170 then
      L17_170 = _UPVALUE0_
      L17_170 = L17_170.COMP_DHCP_SERVER_VLAN_PRIMARYDNS_INVALID
      return L17_170
    end
  end
  L17_170 = NIL
  if A7_160 ~= L17_170 and A7_160 ~= "" then
    L17_170 = _UPVALUE3_
    L17_170 = L17_170.ipAddressCheck
    L18_171 = IPV4_ADDRESS_FAMILY
    L19_172 = A7_160
    L17_170 = L17_170(L18_171, L19_172)
    L11_164 = L17_170
    L17_170 = _UPVALUE2_
    L17_170 = L17_170.ERROR
    if L11_164 == L17_170 then
      L17_170 = _UPVALUE0_
      L17_170 = L17_170.COMP_DHCP_SERVER_VLAN_SECONDARYDNS_INVALID
      return L17_170
    end
  end
  L17_170 = NIL
  if A9_162 == L17_170 then
    A9_162 = DEFAULT_LEASE_TIME
  end
  L17_170 = tonumber
  L18_171 = A9_162
  L17_170 = L17_170(L18_171)
  L18_171 = leaseMinTime
  if not (L17_170 < L18_171) then
    L18_171 = leaseMaxTime
  elseif L17_170 > L18_171 then
    L18_171 = _UPVALUE0_
    L18_171 = L18_171.COMP_DHCP_SERVER_VLAN_LEASETIME_INVALID
    return L18_171
  end
  L18_171 = {}
  L19_172 = bridgeTable
  L20_173 = "."
  L21_174 = _UPVALUE4_
  L21_174 = L21_174.networkInterfaceName
  L19_172 = L19_172 .. L20_173 .. L21_174
  L20_173 = BDG_NAME
  L21_174 = A2_155
  L20_173 = L20_173 .. L21_174
  L18_171[L19_172] = L20_173
  L19_172 = bridgeTable
  L20_173 = "."
  L21_174 = _UPVALUE4_
  L21_174 = L21_174.bridgeIndex
  L19_172 = L19_172 .. L20_173 .. L21_174
  L20_173 = tonumber
  L21_174 = A2_155
  L20_173 = L20_173(L21_174)
  L18_171[L19_172] = L20_173
  L19_172 = db
  L19_172 = L19_172.insert
  L20_173 = bridgeTable
  L21_174 = L18_171
  L19_172 = L19_172(L20_173, L21_174)
  L20_173 = NIL
  if L19_172 == L20_173 then
    L20_173 = _UPVALUE2_
    L20_173 = L20_173.FAILURE
    L21_174 = cookie
    return L20_173, L21_174
  end
  L20_173 = tonumber
  L21_174 = L15_168
  L20_173 = L20_173(L21_174)
  if L20_173 == 3 then
    L12_165 = "3"
  end
  L20_173 = _UPVALUE4_
  L20_173 = L20_173.portName
  L21_174 = " ='dummy'"
  L20_173 = L20_173 .. L21_174
  L21_174 = db
  L21_174 = L21_174.getRowsWhere
  L22_175 = "vlan"
  L23_176 = L20_173
  L21_174 = L21_174(L22_175, L23_176)
  if L21_174 ~= nil then
    L22_175 = #L21_174
    L23_176 = _UPVALUE5_
    if L22_175 >= L23_176 then
      L22_175 = _UPVALUE2_
      L22_175 = L22_175.MAX_LIMIT_REACHED
      return L22_175
    end
  end
  L22_175 = {}
  L23_176 = networkInterfaceTable
  L24_177 = "."
  L25_178 = _UPVALUE4_
  L25_178 = L25_178.networkInterfaceName
  L23_176 = L23_176 .. L24_177 .. L25_178
  L24_177 = BDG_NAME
  L25_178 = A2_155
  L24_177 = L24_177 .. L25_178
  L22_175[L23_176] = L24_177
  L23_176 = networkInterfaceTable
  L24_177 = "."
  L25_178 = _UPVALUE4_
  L25_178 = L25_178.networkInterface
  L23_176 = L23_176 .. L24_177 .. L25_178
  L24_177 = LAN_NAME
  L25_178 = A2_155
  L24_177 = L24_177 .. L25_178
  L22_175[L23_176] = L24_177
  L23_176 = networkInterfaceTable
  L24_177 = "."
  L25_178 = _UPVALUE4_
  L25_178 = L25_178.VirtualIfName
  L23_176 = L23_176 .. L24_177 .. L25_178
  L24_177 = BDG_NAME
  L25_178 = A2_155
  L24_177 = L24_177 .. L25_178
  L22_175[L23_176] = L24_177
  L23_176 = networkInterfaceTable
  L24_177 = "."
  L25_178 = _UPVALUE4_
  L25_178 = L25_178.ConnectionType
  L23_176 = L23_176 .. L24_177 .. L25_178
  L24_177 = STATIC_CONNECTION
  L22_175[L23_176] = L24_177
  L23_176 = networkInterfaceTable
  L24_177 = "."
  L25_178 = _UPVALUE4_
  L25_178 = L25_178.ConnectionType6
  L23_176 = L23_176 .. L24_177 .. L25_178
  L22_175[L23_176] = ""
  L23_176 = networkInterfaceTable
  L24_177 = "."
  L25_178 = _UPVALUE4_
  L25_178 = L25_178.ifType
  L23_176 = L23_176 .. L24_177 .. L25_178
  L24_177 = BRIDGE_CONNECTION
  L22_175[L23_176] = L24_177
  L23_176 = networkInterfaceTable
  L24_177 = "."
  L25_178 = _UPVALUE4_
  L25_178 = L25_178.MTU
  L23_176 = L23_176 .. L24_177 .. L25_178
  L24_177 = DEFAULT_MTU
  L22_175[L23_176] = L24_177
  L23_176 = networkInterfaceTable
  L24_177 = "."
  L25_178 = _UPVALUE4_
  L25_178 = L25_178.ipAddr
  L23_176 = L23_176 .. L24_177 .. L25_178
  L22_175[L23_176] = A0_153
  L23_176 = networkInterfaceTable
  L24_177 = "."
  L25_178 = _UPVALUE4_
  L25_178 = L25_178.subnetmask
  L23_176 = L23_176 .. L24_177 .. L25_178
  L22_175[L23_176] = A1_154
  L23_176 = networkInterfaceTable
  L24_177 = "."
  L25_178 = _UPVALUE4_
  L25_178 = L25_178.dns1
  L23_176 = L23_176 .. L24_177 .. L25_178
  L24_177 = DEFAULT_GATEWAY
  L22_175[L23_176] = L24_177
  L23_176 = networkInterfaceTable
  L24_177 = "."
  L25_178 = _UPVALUE4_
  L25_178 = L25_178.dns2
  L23_176 = L23_176 .. L24_177 .. L25_178
  L24_177 = DEFAULT_GATEWAY
  L22_175[L23_176] = L24_177
  L23_176 = networkInterfaceTable
  L24_177 = "."
  L25_178 = _UPVALUE4_
  L25_178 = L25_178.DHCP
  L23_176 = L23_176 .. L24_177 .. L25_178
  L24_177 = DISABLE
  L22_175[L23_176] = L24_177
  L23_176 = networkInterfaceTable
  L24_177 = "."
  L25_178 = _UPVALUE4_
  L25_178 = L25_178.gatewayNetwork
  L23_176 = L23_176 .. L24_177 .. L25_178
  L24_177 = DEFAULT_GATEWAY
  L22_175[L23_176] = L24_177
  L23_176 = networkInterfaceTable
  L24_177 = "."
  L25_178 = _UPVALUE4_
  L25_178 = L25_178.IfStatus
  L23_176 = L23_176 .. L24_177 .. L25_178
  L24_177 = ENABLE
  L22_175[L23_176] = L24_177
  L23_176 = networkInterfaceTable
  L24_177 = "."
  L25_178 = _UPVALUE4_
  L25_178 = L25_178.refreshInterval
  L23_176 = L23_176 .. L24_177 .. L25_178
  L24_177 = REFRESH_TIME
  L22_175[L23_176] = L24_177
  L23_176 = networkInterfaceTable
  L24_177 = "."
  L25_178 = _UPVALUE4_
  L25_178 = L25_178.autoRefreshFlag
  L23_176 = L23_176 .. L24_177 .. L25_178
  L24_177 = DISABLE
  L22_175[L23_176] = L24_177
  L23_176 = networkInterfaceTable
  L24_177 = "."
  L25_178 = _UPVALUE4_
  L25_178 = L25_178.capabilities
  L23_176 = L23_176 .. L24_177 .. L25_178
  L22_175[L23_176] = L12_165
  L23_176 = networkInterfaceTable
  L24_177 = "."
  L25_178 = _UPVALUE4_
  L25_178 = L25_178.restartFwForMe
  L23_176 = L23_176 .. L24_177 .. L25_178
  L24_177 = ENABLE
  L22_175[L23_176] = L24_177
  L23_176 = networkInterfaceTable
  L24_177 = "."
  L25_178 = _UPVALUE4_
  L25_178 = L25_178.ifGroupId
  L23_176 = L23_176 .. L24_177 .. L25_178
  L24_177 = ENABLE
  L22_175[L23_176] = L24_177
  L23_176 = db
  L23_176 = L23_176.insert
  L24_177 = networkInterfaceTable
  L25_178 = L22_175
  L26_179 = false
  L23_176 = L23_176(L24_177, L25_178, L26_179)
  L24_177 = NIL
  if L23_176 == L24_177 then
    L24_177 = _UPVALUE2_
    L24_177 = L24_177.FAILURE
    L25_178 = cookie
    return L24_177, L25_178
  end
  L24_177 = {}
  L25_178 = subnetTable
  L26_179 = "."
  L27_180 = _UPVALUE4_
  L27_180 = L27_180.networkInterface
  L25_178 = L25_178 .. L26_179 .. L27_180
  L26_179 = interfaceType
  L24_177[L25_178] = L26_179
  L25_178 = subnetTable
  L26_179 = "."
  L27_180 = _UPVALUE4_
  L27_180 = L27_180.ipAddress
  L25_178 = L25_178 .. L26_179 .. L27_180
  L24_177[L25_178] = A0_153
  L25_178 = subnetTable
  L26_179 = "."
  L27_180 = _UPVALUE4_
  L27_180 = L27_180.subnetMask
  L25_178 = L25_178 .. L26_179 .. L27_180
  L24_177[L25_178] = A1_154
  L25_178 = subnetTable
  L26_179 = "."
  L27_180 = _UPVALUE4_
  L27_180 = L27_180.AddressFamily
  L25_178 = L25_178 .. L26_179 .. L27_180
  L26_179 = IPV4_ADDRESS_FAMILY
  L24_177[L25_178] = L26_179
  L25_178 = subnetTable
  L26_179 = "."
  L27_180 = _UPVALUE4_
  L27_180 = L27_180.ifGateway
  L25_178 = L25_178 .. L26_179 .. L27_180
  L26_179 = defaultGateway
  L24_177[L25_178] = L26_179
  L25_178 = db
  L25_178 = L25_178.insert
  L26_179 = subnetTable
  L27_180 = L24_177
  L25_178 = L25_178(L26_179, L27_180)
  L26_179 = NIL
  if L25_178 == L26_179 then
    L26_179 = _UPVALUE2_
    L26_179 = L26_179.FAILURE
    L27_180 = cookie
    return L26_179, L27_180
  end
  L26_179 = {}
  L27_180 = serverTable
  L28_181 = "."
  L27_180 = L27_180 .. L28_181 .. _UPVALUE4_.dhcpEnabled
  L28_181 = ENABLE
  L26_179[L27_180] = L28_181
  L27_180 = serverTable
  L28_181 = "."
  L27_180 = L27_180 .. L28_181 .. _UPVALUE4_.interfaceName
  L28_181 = interfaceType
  L26_179[L27_180] = L28_181
  L27_180 = serverTable
  L28_181 = "."
  L27_180 = L27_180 .. L28_181 .. _UPVALUE4_.domain
  L26_179[L27_180] = A8_161
  L27_180 = serverTable
  L28_181 = "."
  L27_180 = L27_180 .. L28_181 .. _UPVALUE4_.startIpAddress
  L26_179[L27_180] = A3_156
  L27_180 = serverTable
  L28_181 = "."
  L27_180 = L27_180 .. L28_181 .. _UPVALUE4_.endIpAddress
  L26_179[L27_180] = A4_157
  L27_180 = serverTable
  L28_181 = "."
  L27_180 = L27_180 .. L28_181 .. _UPVALUE4_.gateway
  L26_179[L27_180] = A5_158
  L27_180 = serverTable
  L28_181 = "."
  L27_180 = L27_180 .. L28_181 .. _UPVALUE4_.primaryDnsServer
  L26_179[L27_180] = A6_159
  L27_180 = serverTable
  L28_181 = "."
  L27_180 = L27_180 .. L28_181 .. _UPVALUE4_.secondaryDnsServer
  L26_179[L27_180] = A7_160
  L27_180 = serverTable
  L28_181 = "."
  L27_180 = L27_180 .. L28_181 .. _UPVALUE4_.leaseTime
  L26_179[L27_180] = A9_162
  L27_180 = serverTable
  L28_181 = "."
  L27_180 = L27_180 .. L28_181 .. _UPVALUE4_.enableDnsProxy
  L28_181 = ENABLE
  L26_179[L27_180] = L28_181
  L27_180 = db
  L27_180 = L27_180.insert
  L28_181 = serverTable
  L27_180 = L27_180(L28_181, L26_179)
  L28_181 = db
  L28_181 = L28_181.getAttribute
  L28_181 = L28_181(serverTable, _UPVALUE4_.interfaceName, interfaceType, ROWID)
  if L27_180 == NIL then
    return _UPVALUE2_.FAILURE, L28_181
  end
  return _UPVALUE2_.SUCCESS, L28_181
end
function dhcpServerVLANDelete(A0_182)
  local L1_183
  L1_183 = db
  L1_183 = L1_183.getAttribute
  L1_183 = L1_183(serverTable, ROWID, A0_182, _UPVALUE0_.interfaceName)
  L1_183 = string.match(L1_183, "%d+")
  if db.deleteRow(bridgeTable, _UPVALUE0_.networkInterfaceName, BDG_NAME .. L1_183) == NIL then
    return _UPVALUE1_.FAILURE, A0_182
  end
  if db.deleteRow(serverTable, ROWID, A0_182) == NIL then
    return _UPVALUE1_.FAILURE, A0_182
  end
  return _UPVALUE1_.SUCCESS, A0_182
end
function dhcpServerVLANDeleteAll()
  local L0_184
  L0_184 = _UPVALUE0_
  L0_184 = L0_184.interfaceName
  L0_184 = L0_184 .. " != '" .. DMZ_NAME .. "'" .. " and " .. _UPVALUE0_.interfaceName .. " != '" .. LAN_NAME .. "'"
  if db.deleteRowWhere(serverTable, L0_184) == NIL then
    return _UPVALUE1_.FAILURE, cookie
  end
  L0_184 = _UPVALUE0_.networkInterfaceName .. " != '" .. BDG_NAME .. "1'"
  if db.deleteRowWhere(bridgeTable, L0_184) == NIL then
    return _UPVALUE1_.FAILURE, cookie
  end
  return _UPVALUE1_.SUCCESS, cookie
end
