local L0_0
L0_0 = module
L0_0("com.teamf1.core.dhcp.serverLAN", package.seeall)
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
L0_0("teamf1lualib/dhcp_returnCodes")
L0_0 = require
L0_0("teamf1lualib/dhcp_leasedClientsLAN")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.dhcp_returnCodes")
serverTable = "dhcp"
subnetTable = "ifStatic"
;({}).ipAddress = "StaticIp"
;({}).subnetMask = "NetMask"
;({}).interfaceName = "logicalIfName"
;({}).LogicalIfName = "LogicalIfName"
;({}).domain = "domainName"
;({}).startIpAddress = "startAddress"
;({}).endIpAddress = "endAddress"
;({}).gateway = "defaultGw"
;({}).primaryDnsServer = "primaryDnsServer"
;({}).secondaryDnsServer = "secondaryDnsServer"
;({}).winsServer = "winsServer"
;({}).leaseTime = "leaseTime"
;({}).AddressFamily = "AddressFamily"
;({}).ifGateway = "Gateway"
;({}).dhcpEnabled = "dhcpEnabled"
;({}).enableDnsProxy = "enableDnsProxy"
leaseMinTime = 0
leaseMaxTime = 262800
LAN_NAME = "LAN"
DMZ_NAME = "DMZ"
VLAN_NAME = "VLAN"
defaultGateway = "0.0.0.0"
ENABLE = "1"
DISABLE = "0"
ROWID = "_ROWID_"
IPV4_ADDRESS_FAMILY = "2"
DEFAULT_LEASE_TIME = "24"
MIN_LENGTH_DOMAIN_NAME = 1
MAX_LENGTH_DOMAIN_NAME = 256
whereNst = ({}).interfaceName .. " ='" .. LAN_NAME .. "'"
where = ({}).LogicalIfName .. " ='" .. LAN_NAME .. "'"
whereSt = ({}).AddressFamily .. " = '" .. IPV4_ADDRESS_FAMILY .. "' and " .. where
function ipAddressGet()
  local L0_1, L1_2
  L0_1 = firstCookieGet
  L1_2 = serverTable
  L0_1 = L0_1(L1_2, whereNst)
  L1_2 = NIL
  if L0_1 == L1_2 then
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.INVALID_COOKIE
    return L1_2
  end
  L1_2 = db
  L1_2 = L1_2.getAttributeWhere
  L1_2 = L1_2(subnetTable, whereSt, _UPVALUE1_.ipAddress)
  if L1_2 == NIL then
    return _UPVALUE0_.FAILURE, L0_1
  end
  return _UPVALUE0_.SUCCESS, L0_1, L1_2
end
function ipAddressGetNext(A0_3)
  local L2_4
  L2_4 = _UPVALUE0_
  L2_4 = L2_4.NOT_SUPPORTED
  return L2_4, A0_3
end
function ipAddressSet(A0_5, A1_6)
  if checkCookieExists(A0_5, serverTable, whereNst) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if A1_6 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck(IPV4_ADDRESS_FAMILY, A1_6)
  if valid == _UPVALUE0_.ERROR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttributeWhere(subnetTable, whereSt, _UPVALUE2_.ipAddress, A1_6) == NIL then
    return _UPVALUE0_.FAILURE, A0_5
  end
  return _UPVALUE0_.SUCCESS, A0_5
end
function ipAddressDelete(A0_7)
  local L2_8
  L2_8 = _UPVALUE0_
  L2_8 = L2_8.NOT_SUPPORTED
  return L2_8, A0_7
end
function subnetMaskGet()
  local L0_9, L1_10, L2_11, L3_12
  L0_9 = firstCookieGet
  L1_10 = serverTable
  L2_11 = whereNst
  L0_9 = L0_9(L1_10, L2_11)
  L1_10 = NIL
  if L0_9 == L1_10 then
    L1_10 = _UPVALUE0_
    L1_10 = L1_10.INVALID_COOKIE
    return L1_10
  end
  L1_10 = db
  L1_10 = L1_10.getAttribute
  L2_11 = serverTable
  L3_12 = ROWID
  L1_10 = L1_10(L2_11, L3_12, L0_9, _UPVALUE1_.interfaceName)
  L2_11 = NIL
  if L1_10 == L2_11 then
    L2_11 = _UPVALUE0_
    L2_11 = L2_11.FAILURE
    L3_12 = L0_9
    return L2_11, L3_12
  end
  L2_11 = _UPVALUE1_
  L2_11 = L2_11.AddressFamily
  L3_12 = " = "
  L2_11 = L2_11 .. L3_12 .. IPV4_ADDRESS_FAMILY .. " and " .. where
  L3_12 = db
  L3_12 = L3_12.getAttributeWhere
  L3_12 = L3_12(subnetTable, L2_11, _UPVALUE1_.subnetMask)
  if L3_12 == NIL then
    return _UPVALUE0_.FAILURE, L0_9
  end
  return _UPVALUE0_.SUCCESS, L0_9, L3_12
end
function subnetMaskGetNext(A0_13)
  local L2_14
  L2_14 = _UPVALUE0_
  L2_14 = L2_14.NOT_SUPPORTED
  return L2_14, A0_13
end
function subnetMaskSet(A0_15, A1_16)
  if checkCookieExists(A0_15, serverTable, whereNst) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if A1_16 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck(IPV4_ADDRESS_FAMILY, A1_16)
  if valid == _UPVALUE0_.ERROR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttributeWhere(subnetTable, whereSt, _UPVALUE2_.subnetMask, A1_16) == NIL then
    return _UPVALUE0_.FAILURE, A0_15
  end
  return _UPVALUE0_.SUCCESS, A0_15
end
function typeFind(A0_17)
  local L1_18
  L1_18 = NIL
  if A0_17 == L1_18 then
    L1_18 = _UPVALUE0_
    L1_18 = L1_18.INVALID_ARGUMENT
    return L1_18
  end
  L1_18 = db
  L1_18 = L1_18.getAttribute
  L1_18 = L1_18(serverTable, _UPVALUE1_.interfaceName, A0_17, ROWID)
  if L1_18 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_18
end
function typeGet()
  local L1_19
  L1_19 = _UPVALUE0_
  L1_19 = L1_19.NOT_SUPPORTED
  return L1_19, cookie
end
function typeGetNext(A0_20)
  local L2_21
  L2_21 = _UPVALUE0_
  L2_21 = L2_21.NOT_SUPPORTED
  return L2_21, A0_20
end
function typeSet(A0_22, A1_23)
  local L3_24
  L3_24 = _UPVALUE0_
  L3_24 = L3_24.NOT_SUPPORTED
  return L3_24, A0_22
end
function domainGet()
  local L0_25, L1_26
  L0_25 = firstCookieGet
  L1_26 = serverTable
  L0_25 = L0_25(L1_26, whereNst)
  L1_26 = NIL
  if L0_25 == L1_26 then
    L1_26 = _UPVALUE0_
    L1_26 = L1_26.INVALID_COOKIE
    return L1_26
  end
  L1_26 = db
  L1_26 = L1_26.getAttribute
  L1_26 = L1_26(serverTable, ROWID, L0_25, _UPVALUE1_.domain)
  if L1_26 == NIL then
    return _UPVALUE0_.FAILURE, L0_25
  end
  return _UPVALUE0_.SUCCESS, L0_25, L1_26
end
function domainGetNext(A0_27)
  local L2_28
  L2_28 = _UPVALUE0_
  L2_28 = L2_28.NOT_SUPPORTED
  return L2_28, A0_27
end
function domainSet(A0_29, A1_30)
  if checkCookieExists(A0_29, serverTable, whereNst) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if A1_30 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(serverTable, ROWID, A0_29, _UPVALUE1_.domain, A1_30) == NIL then
    return _UPVALUE0_.FAILURE, A0_29
  end
  return _UPVALUE0_.SUCCESS, A0_29
end
function startIpAddressGet()
  local L0_31, L1_32
  L0_31 = firstCookieGet
  L1_32 = serverTable
  L0_31 = L0_31(L1_32, whereNst)
  L1_32 = NIL
  if L0_31 == L1_32 then
    L1_32 = _UPVALUE0_
    L1_32 = L1_32.INVALID_COOKIE
    return L1_32
  end
  L1_32 = db
  L1_32 = L1_32.getAttribute
  L1_32 = L1_32(serverTable, ROWID, L0_31, _UPVALUE1_.startIpAddress)
  if L1_32 == NIL then
    return _UPVALUE0_.FAILURE, L0_31
  end
  return _UPVALUE0_.SUCCESS, L0_31, L1_32
end
function startIpAddressGetNext(A0_33)
  local L2_34
  L2_34 = _UPVALUE0_
  L2_34 = L2_34.NOT_SUPPORTED
  return L2_34, A0_33
end
function startIpAddressSet(A0_35, A1_36)
  local L2_37, L3_38
  L2_37 = checkCookieExists
  L3_38 = A0_35
  L2_37 = L2_37(L3_38, serverTable, whereNst)
  L3_38 = FALSE
  if L2_37 == L3_38 then
    L2_37 = _UPVALUE0_
    L2_37 = L2_37.INVALID_COOKIE
    return L2_37
  end
  L2_37 = NIL
  if A1_36 == L2_37 then
    L2_37 = _UPVALUE0_
    L2_37 = L2_37.INVALID_ARGUMENT
    return L2_37
  end
  L2_37 = _UPVALUE1_
  L2_37 = L2_37.ipAddressCheck
  L3_38 = IPV4_ADDRESS_FAMILY
  L2_37 = L2_37(L3_38, A1_36)
  valid = L2_37
  L2_37 = valid
  L3_38 = _UPVALUE0_
  L3_38 = L3_38.ERROR
  if L2_37 == L3_38 then
    L2_37 = _UPVALUE0_
    L2_37 = L2_37.INVALID_ARGUMENT
    return L2_37
  end
  L2_37 = db
  L2_37 = L2_37.setAttribute
  L3_38 = serverTable
  L2_37 = L2_37(L3_38, ROWID, A0_35, _UPVALUE2_.startIpAddress, A1_36)
  L3_38 = NIL
  if L2_37 == L3_38 then
    L3_38 = _UPVALUE0_
    L3_38 = L3_38.FAILURE
    return L3_38, A0_35
  end
  L3_38 = _UPVALUE3_
  L3_38 = L3_38.clientLANDeleteAll
  L3_38 = L3_38()
  if L3_38 ~= _UPVALUE0_.SUCCESS then
    return L3_38, A0_35
  end
  return _UPVALUE0_.SUCCESS, A0_35
end
function endIpAddressGet()
  local L0_39, L1_40
  L0_39 = firstCookieGet
  L1_40 = serverTable
  L0_39 = L0_39(L1_40, whereNst)
  L1_40 = NIL
  if L0_39 == L1_40 then
    L1_40 = _UPVALUE0_
    L1_40 = L1_40.INVALID_COOKIE
    return L1_40
  end
  L1_40 = db
  L1_40 = L1_40.getAttribute
  L1_40 = L1_40(serverTable, ROWID, L0_39, _UPVALUE1_.endIpAddress)
  if L1_40 == NIL then
    return _UPVALUE0_.FAILURE, L0_39
  end
  return _UPVALUE0_.SUCCESS, L0_39, L1_40
end
function endIpAddressGetNext(A0_41)
  local L2_42
  L2_42 = _UPVALUE0_
  L2_42 = L2_42.NOT_SUPPORTED
  return L2_42, A0_41
end
function endIpAddressSet(A0_43, A1_44)
  local L2_45, L3_46
  L2_45 = checkCookieExists
  L3_46 = A0_43
  L2_45 = L2_45(L3_46, serverTable, whereNst)
  L3_46 = FALSE
  if L2_45 == L3_46 then
    L2_45 = _UPVALUE0_
    L2_45 = L2_45.INVALID_COOKIE
    return L2_45
  end
  L2_45 = NIL
  if A1_44 == L2_45 then
    L2_45 = _UPVALUE0_
    L2_45 = L2_45.INVALID_ARGUMENT
    return L2_45
  end
  L2_45 = _UPVALUE1_
  L2_45 = L2_45.ipAddressCheck
  L3_46 = IPV4_ADDRESS_FAMILY
  L2_45 = L2_45(L3_46, A1_44)
  valid = L2_45
  L2_45 = valid
  L3_46 = _UPVALUE0_
  L3_46 = L3_46.ERROR
  if L2_45 == L3_46 then
    L2_45 = _UPVALUE0_
    L2_45 = L2_45.INVALID_ARGUMENT
    return L2_45
  end
  L2_45 = db
  L2_45 = L2_45.setAttribute
  L3_46 = serverTable
  L2_45 = L2_45(L3_46, ROWID, A0_43, _UPVALUE2_.endIpAddress, A1_44)
  L3_46 = NIL
  if L2_45 == L3_46 then
    L3_46 = _UPVALUE0_
    L3_46 = L3_46.FAILURE
    return L3_46, A0_43
  end
  L3_46 = _UPVALUE3_
  L3_46 = L3_46.clientLANDeleteAll
  L3_46 = L3_46()
  if L3_46 ~= _UPVALUE0_.SUCCESS then
    return L3_46, A0_43
  end
  return _UPVALUE0_.SUCCESS, A0_43
end
function gatewayGet()
  local L0_47, L1_48
  L0_47 = firstCookieGet
  L1_48 = serverTable
  L0_47 = L0_47(L1_48, whereNst)
  L1_48 = NIL
  if L0_47 == L1_48 then
    L1_48 = _UPVALUE0_
    L1_48 = L1_48.INVALID_COOKIE
    return L1_48
  end
  L1_48 = db
  L1_48 = L1_48.getAttribute
  L1_48 = L1_48(serverTable, ROWID, L0_47, _UPVALUE1_.gateway)
  if L1_48 == NIL then
    return _UPVALUE0_.FAILURE, L0_47
  end
  return _UPVALUE0_.SUCCESS, L0_47, L1_48
end
function gatewayGetNext(A0_49)
  local L2_50
  L2_50 = _UPVALUE0_
  L2_50 = L2_50.NOT_SUPPORTED
  return L2_50, A0_49
end
function gatewaySet(A0_51, A1_52)
  local L2_53, L3_54, L4_55
  L2_53 = checkCookieExists
  L3_54 = A0_51
  L4_55 = serverTable
  L2_53 = L2_53(L3_54, L4_55, whereNst)
  L3_54 = FALSE
  if L2_53 == L3_54 then
    L2_53 = _UPVALUE0_
    L2_53 = L2_53.INVALID_COOKIE
    return L2_53
  end
  L2_53 = NIL
  if A1_52 == L2_53 then
    L2_53 = _UPVALUE0_
    L2_53 = L2_53.INVALID_ARGUMENT
    return L2_53
  end
  L2_53 = nil
  L3_54 = _UPVALUE1_
  L3_54 = L3_54.ipAddressCheck
  L4_55 = IPV4_ADDRESS_FAMILY
  L3_54 = L3_54(L4_55, A1_52)
  L2_53 = L3_54
  L3_54 = _UPVALUE0_
  L3_54 = L3_54.ERROR
  if L2_53 == L3_54 then
    L3_54 = _UPVALUE0_
    L3_54 = L3_54.INVALID_ARGUMENT
    return L3_54
  end
  L3_54 = db
  L3_54 = L3_54.getAttributeWhere
  L4_55 = subnetTable
  L3_54 = L3_54(L4_55, whereSt, _UPVALUE2_.ipAddress)
  L4_55 = NIL
  if L3_54 == L4_55 then
    L4_55 = _UPVALUE0_
    L4_55 = L4_55.FAILURE
    return L4_55, A0_51
  end
  L4_55 = db
  L4_55 = L4_55.getAttributeWhere
  L4_55 = L4_55(subnetTable, whereSt, _UPVALUE2_.subnetMask)
  if L4_55 == NIL then
    return _UPVALUE0_.FAILURE, A0_51
  end
  L2_53 = _UPVALUE1_.ipv4SingleMaskCheck(L3_54, A1_52, L4_55)
  if L2_53 == _UPVALUE0_.ERROR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(serverTable, ROWID, A0_51, _UPVALUE2_.gateway, A1_52) == NIL then
    return _UPVALUE0_.FAILURE, A0_51
  end
  return _UPVALUE0_.SUCCESS, A0_51
end
function primaryDnsServerGet()
  local L0_56, L1_57
  L0_56 = firstCookieGet
  L1_57 = serverTable
  L0_56 = L0_56(L1_57, whereNst)
  L1_57 = NIL
  if L0_56 == L1_57 then
    L1_57 = _UPVALUE0_
    L1_57 = L1_57.INVALID_COOKIE
    return L1_57
  end
  L1_57 = db
  L1_57 = L1_57.getAttribute
  L1_57 = L1_57(serverTable, ROWID, L0_56, _UPVALUE1_.primaryDnsServer)
  if L1_57 == NIL then
    return _UPVALUE0_.FAILURE, L0_56
  end
  return _UPVALUE0_.SUCCESS, L0_56, L1_57
end
function primaryDnsServerGetNext(A0_58)
  local L2_59
  L2_59 = _UPVALUE0_
  L2_59 = L2_59.NOT_SUPPORTED
  return L2_59, A0_58
end
function primaryDnsServerSet(A0_60, A1_61)
  local L2_62
  L2_62 = checkCookieExists
  L2_62 = L2_62(A0_60, serverTable, whereNst)
  if L2_62 == FALSE then
    L2_62 = _UPVALUE0_
    L2_62 = L2_62.INVALID_COOKIE
    return L2_62
  end
  L2_62 = NIL
  if A1_61 == L2_62 then
    L2_62 = _UPVALUE0_
    L2_62 = L2_62.INVALID_ARGUMENT
    return L2_62
  end
  L2_62 = nil
  L2_62 = _UPVALUE1_.ipAddressCheck(IPV4_ADDRESS_FAMILY, A1_61)
  if L2_62 == _UPVALUE0_.ERROR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(serverTable, ROWID, A0_60, _UPVALUE2_.primaryDnsServer, A1_61) == NIL then
    return _UPVALUE0_.FAILURE, A0_60
  end
  return _UPVALUE0_.SUCCESS, A0_60
end
function secondaryDnsServerGet()
  local L0_63, L1_64
  L0_63 = firstCookieGet
  L1_64 = serverTable
  L0_63 = L0_63(L1_64, whereNst)
  L1_64 = NIL
  if L0_63 == L1_64 then
    L1_64 = _UPVALUE0_
    L1_64 = L1_64.INVALID_COOKIE
    return L1_64
  end
  L1_64 = db
  L1_64 = L1_64.getAttribute
  L1_64 = L1_64(serverTable, ROWID, L0_63, _UPVALUE1_.secondaryDnsServer)
  if L1_64 == NIL then
    return _UPVALUE0_.FAILURE, L0_63
  end
  return _UPVALUE0_.SUCCESS, L0_63, L1_64
end
function secondaryDnsServerGetNext(A0_65)
  local L2_66
  L2_66 = _UPVALUE0_
  L2_66 = L2_66.NOT_SUPPORTED
  return L2_66, A0_65
end
function secondaryDnsServerSet(A0_67, A1_68)
  local L2_69
  L2_69 = checkCookieExists
  L2_69 = L2_69(A0_67, serverTable, whereNst)
  if L2_69 == FALSE then
    L2_69 = _UPVALUE0_
    L2_69 = L2_69.INVALID_COOKIE
    return L2_69
  end
  L2_69 = NIL
  if A1_68 == L2_69 then
    L2_69 = _UPVALUE0_
    L2_69 = L2_69.INVALID_ARGUMENT
    return L2_69
  end
  L2_69 = nil
  L2_69 = _UPVALUE1_.ipAddressCheck(IPV4_ADDRESS_FAMILY, A1_68)
  if L2_69 == _UPVALUE0_.ERROR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(serverTable, ROWID, A0_67, _UPVALUE2_.secondaryDnsServer, A1_68) == NIL then
    return _UPVALUE0_.FAILURE, A0_67
  end
  return _UPVALUE0_.SUCCESS, A0_67
end
function winsServerGet()
  local L0_70, L1_71
  L0_70 = firstCookieGet
  L1_71 = serverTable
  L0_70 = L0_70(L1_71, whereNst)
  L1_71 = NIL
  if L0_70 == L1_71 then
    L1_71 = _UPVALUE0_
    L1_71 = L1_71.INVALID_COOKIE
    return L1_71
  end
  L1_71 = db
  L1_71 = L1_71.getAttribute
  L1_71 = L1_71(serverTable, ROWID, L0_70, _UPVALUE1_.winsServer)
  if L1_71 == NIL then
    return _UPVALUE0_.FAILURE, L0_70
  end
  return _UPVALUE0_.SUCCESS, L0_70, L1_71
end
function winsServerGetNext(A0_72)
  local L2_73
  L2_73 = _UPVALUE0_
  L2_73 = L2_73.NOT_SUPPORTED
  return L2_73, A0_72
end
function winsServerSet(A0_74, A1_75)
  local L2_76
  L2_76 = checkCookieExists
  L2_76 = L2_76(A0_74, serverTable, whereNst)
  if L2_76 == FALSE then
    L2_76 = _UPVALUE0_
    L2_76 = L2_76.INVALID_COOKIE
    return L2_76
  end
  L2_76 = NIL
  if A1_75 == L2_76 then
    L2_76 = _UPVALUE0_
    L2_76 = L2_76.INVALID_ARGUMENT
    return L2_76
  end
  L2_76 = nil
  L2_76 = _UPVALUE1_.ipAddressCheck(IPV4_ADDRESS_FAMILY, A1_75)
  if L2_76 == _UPVALUE0_.ERROR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(serverTable, ROWID, A0_74, _UPVALUE2_.winsServer, A1_75) == NIL then
    return _UPVALUE0_.FAILURE, A0_74
  end
  return _UPVALUE0_.SUCCESS, A0_74
end
function leaseTimeGet()
  local L0_77, L1_78
  L0_77 = firstCookieGet
  L1_78 = serverTable
  L0_77 = L0_77(L1_78, whereNst)
  L1_78 = NIL
  if L0_77 == L1_78 then
    L1_78 = _UPVALUE0_
    L1_78 = L1_78.INVALID_COOKIE
    return L1_78
  end
  L1_78 = db
  L1_78 = L1_78.getAttribute
  L1_78 = L1_78(serverTable, ROWID, L0_77, _UPVALUE1_.leaseTime)
  if L1_78 == NIL then
    return _UPVALUE0_.FAILURE, L0_77
  end
  return _UPVALUE0_.SUCCESS, L0_77, L1_78
end
function leaseTimeGetNext(A0_79)
  local L2_80
  L2_80 = _UPVALUE0_
  L2_80 = L2_80.NOT_SUPPORTED
  return L2_80, A0_79
end
function leaseTimeSet(A0_81, A1_82)
  if checkCookieExists(A0_81, serverTable, whereNst) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if A1_82 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_82) < leaseMinTime or tonumber(A1_82) > leaseMaxTime then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(serverTable, ROWID, A0_81, _UPVALUE1_.leaseTime, A1_82) == NIL then
    return _UPVALUE0_.FAILURE, A0_81
  end
  return _UPVALUE0_.SUCCESS, A0_81
end
function dhcpServerLANGet()
  local L0_83
  L0_83 = firstCookieGet
  L0_83 = L0_83(serverTable, whereNst)
  if L0_83 == NIL then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if db.getRow(serverTable, ROWID, L0_83) == NIL then
    return _UPVALUE0_.FAILURE, L0_83
  end
  if db.getRowWhere(subnetTable, whereSt) == NIL then
    return _UPVALUE0_.FAILURE, L0_83
  end
  return _UPVALUE0_.SUCCESS, L0_83, db.getRowWhere(subnetTable, whereSt)[subnetTable .. "." .. _UPVALUE1_.ipAddress], db.getRowWhere(subnetTable, whereSt)[subnetTable .. "." .. _UPVALUE1_.subnetMask], db.getRow(serverTable, ROWID, L0_83)[serverTable .. "." .. _UPVALUE1_.startIpAddress], db.getRow(serverTable, ROWID, L0_83)[serverTable .. "." .. _UPVALUE1_.endIpAddress], db.getRow(serverTable, ROWID, L0_83)[serverTable .. "." .. _UPVALUE1_.gateway], db.getRow(serverTable, ROWID, L0_83)[serverTable .. "." .. _UPVALUE1_.primaryDnsServer], db.getRow(serverTable, ROWID, L0_83)[serverTable .. "." .. _UPVALUE1_.secondaryDnsServer], db.getRow(serverTable, ROWID, L0_83)[serverTable .. "." .. _UPVALUE1_.domain], db.getRow(serverTable, ROWID, L0_83)[serverTable .. "." .. _UPVALUE1_.winsServer], db.getRow(serverTable, ROWID, L0_83)[serverTable .. "." .. _UPVALUE1_.leaseTime]
end
function dhcpServerLANGetNext(A0_84)
  local L2_85
  L2_85 = _UPVALUE0_
  L2_85 = L2_85.NOT_SUPPORTED
  return L2_85, A0_84
end
function dhcpServerLANSet(A0_86, A1_87, A2_88, A3_89, A4_90, A5_91, A6_92, A7_93, A8_94, A9_95, A10_96)
  local L11_97, L12_98, L13_99, L14_100, L15_101, L16_102
  L11_97 = checkCookieExists
  L12_98 = A0_86
  L13_99 = serverTable
  L14_100 = whereNst
  L11_97 = L11_97(L12_98, L13_99, L14_100)
  L12_98 = FALSE
  if L11_97 == L12_98 then
    L11_97 = _UPVALUE0_
    L11_97 = L11_97.INVALID_COOKIE
    return L11_97
  end
  L11_97 = nil
  L12_98 = NIL
  if A1_87 == L12_98 then
    L12_98 = _UPVALUE1_
    L12_98 = L12_98.COMP_DHCP_SERVER_LAN_IPADDRESS_NIL
    return L12_98
  end
  if A8_94 ~= nil then
    L12_98 = string
    L12_98 = L12_98.len
    L13_99 = A8_94
    L12_98 = L12_98(L13_99)
    L13_99 = MAX_LENGTH_DOMAIN_NAME
    if L12_98 > L13_99 then
      L12_98 = _UPVALUE1_
      L12_98 = L12_98.COMP_DOMAIN_NAME_LENGTH_INVALID
      return L12_98
    end
  end
  L12_98 = _UPVALUE2_
  L12_98 = L12_98.ipAddressCheck
  L13_99 = IPV4_ADDRESS_FAMILY
  L14_100 = A1_87
  L12_98 = L12_98(L13_99, L14_100)
  L11_97 = L12_98
  L12_98 = _UPVALUE0_
  L12_98 = L12_98.ERROR
  if L11_97 == L12_98 then
    L12_98 = _UPVALUE1_
    L12_98 = L12_98.COMP_DHCP_SERVER_LAN_IPADDRESS_INVALID
    return L12_98
  end
  L12_98 = NIL
  if A2_88 == L12_98 then
    L12_98 = _UPVALUE1_
    L12_98 = L12_98.COMP_DHCP_SERVER_LAN_SUBNET_NIL
    return L12_98
  end
  L12_98 = _UPVALUE2_
  L12_98 = L12_98.ipAddressCheck
  L13_99 = IPV4_ADDRESS_FAMILY
  L14_100 = A2_88
  L12_98 = L12_98(L13_99, L14_100)
  L11_97 = L12_98
  L12_98 = _UPVALUE0_
  L12_98 = L12_98.ERROR
  if L11_97 == L12_98 then
    L12_98 = _UPVALUE1_
    L12_98 = L12_98.COMP_DHCP_SERVER_LAN_SUBNET_INVALID
    return L12_98
  end
  L12_98 = NIL
  if A3_89 ~= L12_98 then
    L12_98 = _UPVALUE2_
    L12_98 = L12_98.ipAddressCheck
    L13_99 = IPV4_ADDRESS_FAMILY
    L14_100 = A3_89
    L12_98 = L12_98(L13_99, L14_100)
    L11_97 = L12_98
    L12_98 = _UPVALUE0_
    L12_98 = L12_98.ERROR
    if L11_97 == L12_98 then
      L12_98 = _UPVALUE1_
      L12_98 = L12_98.COMP_DHCP_SERVER_LAN_STARTIP_INVALID
      return L12_98
    end
    L12_98 = _UPVALUE2_
    L12_98 = L12_98.ipv4SingleMaskCheck
    L13_99 = A1_87
    L14_100 = A3_89
    L15_101 = A2_88
    L12_98 = L12_98(L13_99, L14_100, L15_101)
    L11_97 = L12_98
    L12_98 = _UPVALUE0_
    L12_98 = L12_98.ERROR
    if L11_97 == L12_98 then
      L12_98 = _UPVALUE1_
      L12_98 = L12_98.COMP_DHCP_SERVER_LAN_STARTIP_NOTIN_NETWORK
      return L12_98
    end
  end
  L12_98 = NIL
  if A4_90 ~= L12_98 then
    L12_98 = _UPVALUE2_
    L12_98 = L12_98.ipAddressCheck
    L13_99 = IPV4_ADDRESS_FAMILY
    L14_100 = A4_90
    L12_98 = L12_98(L13_99, L14_100)
    L11_97 = L12_98
    L12_98 = _UPVALUE0_
    L12_98 = L12_98.ERROR
    if L11_97 == L12_98 then
      L12_98 = _UPVALUE1_
      L12_98 = L12_98.COMP_DHCP_SERVER_LAN_ENDIP_INVALID
      return L12_98
    end
    L12_98 = _UPVALUE2_
    L12_98 = L12_98.ipv4SingleMaskCheck
    L13_99 = A1_87
    L14_100 = A4_90
    L15_101 = A2_88
    L12_98 = L12_98(L13_99, L14_100, L15_101)
    L11_97 = L12_98
    L12_98 = _UPVALUE0_
    L12_98 = L12_98.ERROR
    if L11_97 == L12_98 then
      L12_98 = _UPVALUE1_
      L12_98 = L12_98.COMP_DHCP_SERVER_LAN_END_NOTIN_NETWORK
      return L12_98
    end
  end
  L12_98 = NIL
  if A5_91 ~= L12_98 then
    L12_98 = _UPVALUE2_
    L12_98 = L12_98.ipAddressCheck
    L13_99 = IPV4_ADDRESS_FAMILY
    L14_100 = A5_91
    L12_98 = L12_98(L13_99, L14_100)
    L11_97 = L12_98
    L12_98 = _UPVALUE0_
    L12_98 = L12_98.ERROR
    if L11_97 == L12_98 then
      L12_98 = _UPVALUE1_
      L12_98 = L12_98.COMP_DHCP_SERVER_LAN_GATEWAY_INVALID
      return L12_98
    end
    L12_98 = _UPVALUE2_
    L12_98 = L12_98.ipv4SingleMaskCheck
    L13_99 = A1_87
    L14_100 = A5_91
    L15_101 = A2_88
    L12_98 = L12_98(L13_99, L14_100, L15_101)
    L11_97 = L12_98
    L12_98 = _UPVALUE0_
    L12_98 = L12_98.ERROR
    if L11_97 == L12_98 then
      L12_98 = _UPVALUE1_
      L12_98 = L12_98.COMP_DHCP_SERVER_LAN_GATEWAY_NOTIN_NETWORK
      return L12_98
    end
  end
  L12_98 = NIL
  if A6_92 ~= L12_98 and A6_92 ~= "" then
    L12_98 = _UPVALUE2_
    L12_98 = L12_98.ipAddressCheck
    L13_99 = IPV4_ADDRESS_FAMILY
    L14_100 = A6_92
    L12_98 = L12_98(L13_99, L14_100)
    L11_97 = L12_98
    L12_98 = _UPVALUE0_
    L12_98 = L12_98.ERROR
    if L11_97 == L12_98 then
      L12_98 = _UPVALUE1_
      L12_98 = L12_98.COMP_DHCP_SERVER_LAN_PRIMARYDNS_INVALID
      return L12_98
    end
  end
  L12_98 = NIL
  if A7_93 ~= L12_98 and A7_93 ~= "" then
    L12_98 = _UPVALUE2_
    L12_98 = L12_98.ipAddressCheck
    L13_99 = IPV4_ADDRESS_FAMILY
    L14_100 = A7_93
    L12_98 = L12_98(L13_99, L14_100)
    L11_97 = L12_98
    L12_98 = _UPVALUE0_
    L12_98 = L12_98.ERROR
    if L11_97 == L12_98 then
      L12_98 = _UPVALUE1_
      L12_98 = L12_98.COMP_DHCP_SERVER_LAN_SECONDARYDNS_INVALID
      return L12_98
    end
  end
  L12_98 = NIL
  if A9_95 ~= L12_98 and A9_95 ~= "" then
    L12_98 = _UPVALUE2_
    L12_98 = L12_98.ipAddressCheck
    L13_99 = IPV4_ADDRESS_FAMILY
    L14_100 = A9_95
    L12_98 = L12_98(L13_99, L14_100)
    L11_97 = L12_98
    L12_98 = _UPVALUE0_
    L12_98 = L12_98.ERROR
    if L11_97 == L12_98 then
      L12_98 = _UPVALUE1_
      L12_98 = L12_98.COMP_DHCP_SERVER_LAN_WINSSERVER_INVALID
      return L12_98
    end
  end
  L12_98 = NIL
  if A10_96 == L12_98 then
    A10_96 = DEFAULT_LEASE_TIME
  end
  L12_98 = tonumber
  L13_99 = A10_96
  L12_98 = L12_98(L13_99)
  L13_99 = leaseMinTime
  if not (L12_98 < L13_99) then
    L13_99 = leaseMaxTime
  elseif L12_98 > L13_99 then
    L13_99 = _UPVALUE1_
    L13_99 = L13_99.COMP_DHCP_SERVER_LAN_LEASETIME_INVALID
    return L13_99
  end
  L13_99 = {}
  L14_100 = serverTable
  L15_101 = "."
  L16_102 = _UPVALUE3_
  L16_102 = L16_102.dhcpEnabled
  L14_100 = L14_100 .. L15_101 .. L16_102
  L15_101 = ENABLE
  L13_99[L14_100] = L15_101
  L14_100 = serverTable
  L15_101 = "."
  L16_102 = _UPVALUE3_
  L16_102 = L16_102.domain
  L14_100 = L14_100 .. L15_101 .. L16_102
  L13_99[L14_100] = A8_94
  L14_100 = serverTable
  L15_101 = "."
  L16_102 = _UPVALUE3_
  L16_102 = L16_102.startIpAddress
  L14_100 = L14_100 .. L15_101 .. L16_102
  L13_99[L14_100] = A3_89
  L14_100 = serverTable
  L15_101 = "."
  L16_102 = _UPVALUE3_
  L16_102 = L16_102.endIpAddress
  L14_100 = L14_100 .. L15_101 .. L16_102
  L13_99[L14_100] = A4_90
  L14_100 = serverTable
  L15_101 = "."
  L16_102 = _UPVALUE3_
  L16_102 = L16_102.gateway
  L14_100 = L14_100 .. L15_101 .. L16_102
  L13_99[L14_100] = A5_91
  L14_100 = serverTable
  L15_101 = "."
  L16_102 = _UPVALUE3_
  L16_102 = L16_102.primaryDnsServer
  L14_100 = L14_100 .. L15_101 .. L16_102
  L13_99[L14_100] = A6_92
  L14_100 = serverTable
  L15_101 = "."
  L16_102 = _UPVALUE3_
  L16_102 = L16_102.secondaryDnsServer
  L14_100 = L14_100 .. L15_101 .. L16_102
  L13_99[L14_100] = A7_93
  L14_100 = serverTable
  L15_101 = "."
  L16_102 = _UPVALUE3_
  L16_102 = L16_102.winsServer
  L14_100 = L14_100 .. L15_101 .. L16_102
  L13_99[L14_100] = A9_95
  L14_100 = serverTable
  L15_101 = "."
  L16_102 = _UPVALUE3_
  L16_102 = L16_102.leaseTime
  L14_100 = L14_100 .. L15_101 .. L16_102
  L13_99[L14_100] = A10_96
  L14_100 = db
  L14_100 = L14_100.update
  L15_101 = serverTable
  L16_102 = L13_99
  L14_100 = L14_100(L15_101, L16_102, A0_86)
  L15_101 = NIL
  if L14_100 == L15_101 then
    L15_101 = _UPVALUE0_
    L15_101 = L15_101.FAILURE
    L16_102 = A0_86
    return L15_101, L16_102
  end
  L15_101 = {}
  L16_102 = subnetTable
  L16_102 = L16_102 .. "." .. _UPVALUE3_.ipAddress
  L15_101[L16_102] = A1_87
  L16_102 = subnetTable
  L16_102 = L16_102 .. "." .. _UPVALUE3_.subnetMask
  L15_101[L16_102] = A2_88
  L16_102 = subnetTable
  L16_102 = L16_102 .. "." .. _UPVALUE3_.ifGateway
  L15_101[L16_102] = defaultGateway
  L16_102 = db
  L16_102 = L16_102.getAttributeWhere
  L16_102 = L16_102(subnetTable, whereSt, ROWID)
  if db.update(subnetTable, L15_101, L16_102) == NIL then
    return _UPVALUE0_.FAILURE, A0_86
  end
  return _UPVALUE0_.SUCCESS, A0_86
end
function dhcpServerLANCreate(A0_103, A1_104, A2_105, A3_106, A4_107, A5_108, A6_109, A7_110, A8_111, A9_112)
  local L11_113
  L11_113 = _UPVALUE0_
  L11_113 = L11_113.NOT_SUPPORTED
  return L11_113, cookie
end
function dhcpServerLANDelete(A0_114)
  local L2_115
  L2_115 = _UPVALUE0_
  L2_115 = L2_115.NOT_SUPPORTED
  return L2_115, A0_114
end
