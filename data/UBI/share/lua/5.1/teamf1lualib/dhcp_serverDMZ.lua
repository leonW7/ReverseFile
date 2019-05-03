local L0_0
L0_0 = module
L0_0("com.teamf1.core.dhcp.serverDMZ", package.seeall)
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
whereNst = ({}).interfaceName .. " ='" .. DMZ_NAME .. "'"
where = ({}).LogicalIfName .. " ='" .. DMZ_NAME .. "'"
whereSt = ({}).AddressFamily .. " = '" .. IPV4_ADDRESS_FAMILY .. "' and " .. where
MAX_LENGTH_DOMAIN_NAME = 256
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
  if checkCookieExists(A0_35, serverTable, whereNst) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if A1_36 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck(IPV4_ADDRESS_FAMILY, A1_36)
  if valid == _UPVALUE0_.ERROR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(serverTable, ROWID, A0_35, _UPVALUE2_.startIpAddress, A1_36) == NIL then
    return _UPVALUE0_.FAILURE, A0_35
  end
  return _UPVALUE0_.SUCCESS, A0_35
end
function endIpAddressGet()
  local L0_37, L1_38
  L0_37 = firstCookieGet
  L1_38 = serverTable
  L0_37 = L0_37(L1_38, whereNst)
  L1_38 = NIL
  if L0_37 == L1_38 then
    L1_38 = _UPVALUE0_
    L1_38 = L1_38.INVALID_COOKIE
    return L1_38
  end
  L1_38 = db
  L1_38 = L1_38.getAttribute
  L1_38 = L1_38(serverTable, ROWID, L0_37, _UPVALUE1_.endIpAddress)
  if L1_38 == NIL then
    return _UPVALUE0_.FAILURE, L0_37
  end
  return _UPVALUE0_.SUCCESS, L0_37, L1_38
end
function endIpAddressGetNext(A0_39)
  local L2_40
  L2_40 = _UPVALUE0_
  L2_40 = L2_40.NOT_SUPPORTED
  return L2_40, A0_39
end
function endIpAddressSet(A0_41, A1_42)
  if checkCookieExists(A0_41, serverTable, whereNst) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if A1_42 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck(IPV4_ADDRESS_FAMILY, A1_42)
  if valid == _UPVALUE0_.ERROR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(serverTable, ROWID, A0_41, _UPVALUE2_.endIpAddress, A1_42) == NIL then
    return _UPVALUE0_.FAILURE, A0_41
  end
  return _UPVALUE0_.SUCCESS, A0_41
end
function gatewayGet()
  local L0_43, L1_44
  L0_43 = firstCookieGet
  L1_44 = serverTable
  L0_43 = L0_43(L1_44, whereNst)
  L1_44 = NIL
  if L0_43 == L1_44 then
    L1_44 = _UPVALUE0_
    L1_44 = L1_44.INVALID_COOKIE
    return L1_44
  end
  L1_44 = db
  L1_44 = L1_44.getAttribute
  L1_44 = L1_44(serverTable, ROWID, L0_43, _UPVALUE1_.gateway)
  if L1_44 == NIL then
    return _UPVALUE0_.FAILURE, L0_43
  end
  return _UPVALUE0_.SUCCESS, L0_43, L1_44
end
function gatewayGetNext(A0_45)
  local L2_46
  L2_46 = _UPVALUE0_
  L2_46 = L2_46.NOT_SUPPORTED
  return L2_46, A0_45
end
function gatewaySet(A0_47, A1_48)
  local L2_49, L3_50, L4_51
  L2_49 = checkCookieExists
  L3_50 = A0_47
  L4_51 = serverTable
  L2_49 = L2_49(L3_50, L4_51, whereNst)
  L3_50 = FALSE
  if L2_49 == L3_50 then
    L2_49 = _UPVALUE0_
    L2_49 = L2_49.INVALID_COOKIE
    return L2_49
  end
  L2_49 = NIL
  if A1_48 == L2_49 then
    L2_49 = _UPVALUE0_
    L2_49 = L2_49.INVALID_ARGUMENT
    return L2_49
  end
  L2_49 = nil
  L3_50 = _UPVALUE1_
  L3_50 = L3_50.ipAddressCheck
  L4_51 = IPV4_ADDRESS_FAMILY
  L3_50 = L3_50(L4_51, A1_48)
  L2_49 = L3_50
  L3_50 = _UPVALUE0_
  L3_50 = L3_50.ERROR
  if L2_49 == L3_50 then
    L3_50 = _UPVALUE0_
    L3_50 = L3_50.INVALID_ARGUMENT
    return L3_50
  end
  L3_50 = db
  L3_50 = L3_50.getAttributeWhere
  L4_51 = subnetTable
  L3_50 = L3_50(L4_51, whereSt, _UPVALUE2_.ipAddress)
  L4_51 = NIL
  if L3_50 == L4_51 then
    L4_51 = _UPVALUE0_
    L4_51 = L4_51.FAILURE
    return L4_51, A0_47
  end
  L4_51 = db
  L4_51 = L4_51.getAttributeWhere
  L4_51 = L4_51(subnetTable, whereSt, _UPVALUE2_.subnetMask)
  if L4_51 == NIL then
    return _UPVALUE0_.FAILURE, A0_47
  end
  L2_49 = _UPVALUE1_.ipv4SingleMaskCheck(L3_50, A1_48, L4_51)
  if L2_49 == _UPVALUE0_.ERROR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(serverTable, ROWID, A0_47, _UPVALUE2_.gateway, A1_48) == NIL then
    return _UPVALUE0_.FAILURE, A0_47
  end
  return _UPVALUE0_.SUCCESS, A0_47
end
function primaryDnsServerGet()
  local L0_52, L1_53
  L0_52 = firstCookieGet
  L1_53 = serverTable
  L0_52 = L0_52(L1_53, whereNst)
  L1_53 = NIL
  if L0_52 == L1_53 then
    L1_53 = _UPVALUE0_
    L1_53 = L1_53.INVALID_COOKIE
    return L1_53
  end
  L1_53 = db
  L1_53 = L1_53.getAttribute
  L1_53 = L1_53(serverTable, ROWID, L0_52, _UPVALUE1_.primaryDnsServer)
  if L1_53 == NIL then
    return _UPVALUE0_.FAILURE, L0_52
  end
  return _UPVALUE0_.SUCCESS, L0_52, L1_53
end
function primaryDnsServerGetNext(A0_54)
  local L2_55
  L2_55 = _UPVALUE0_
  L2_55 = L2_55.NOT_SUPPORTED
  return L2_55, A0_54
end
function primaryDnsServerSet(A0_56, A1_57)
  local L2_58
  L2_58 = checkCookieExists
  L2_58 = L2_58(A0_56, serverTable, whereNst)
  if L2_58 == FALSE then
    L2_58 = _UPVALUE0_
    L2_58 = L2_58.INVALID_COOKIE
    return L2_58
  end
  L2_58 = NIL
  if A1_57 == L2_58 then
    L2_58 = _UPVALUE0_
    L2_58 = L2_58.INVALID_ARGUMENT
    return L2_58
  end
  L2_58 = nil
  L2_58 = _UPVALUE1_.ipAddressCheck(IPV4_ADDRESS_FAMILY, A1_57)
  if L2_58 == _UPVALUE0_.ERROR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(serverTable, ROWID, A0_56, _UPVALUE2_.primaryDnsServer, A1_57) == NIL then
    return _UPVALUE0_.FAILURE, A0_56
  end
  return _UPVALUE0_.SUCCESS, A0_56
end
function secondaryDnsServerGet()
  local L0_59, L1_60
  L0_59 = firstCookieGet
  L1_60 = serverTable
  L0_59 = L0_59(L1_60, whereNst)
  L1_60 = NIL
  if L0_59 == L1_60 then
    L1_60 = _UPVALUE0_
    L1_60 = L1_60.INVALID_COOKIE
    return L1_60
  end
  L1_60 = db
  L1_60 = L1_60.getAttribute
  L1_60 = L1_60(serverTable, ROWID, L0_59, _UPVALUE1_.secondaryDnsServer)
  if L1_60 == NIL then
    return _UPVALUE0_.FAILURE, L0_59
  end
  return _UPVALUE0_.SUCCESS, L0_59, L1_60
end
function secondaryDnsServerGetNext(A0_61)
  local L2_62
  L2_62 = _UPVALUE0_
  L2_62 = L2_62.NOT_SUPPORTED
  return L2_62, A0_61
end
function secondaryDnsServerSet(A0_63, A1_64)
  local L2_65
  L2_65 = checkCookieExists
  L2_65 = L2_65(A0_63, serverTable, whereNst)
  if L2_65 == FALSE then
    L2_65 = _UPVALUE0_
    L2_65 = L2_65.INVALID_COOKIE
    return L2_65
  end
  L2_65 = NIL
  if A1_64 == L2_65 then
    L2_65 = _UPVALUE0_
    L2_65 = L2_65.INVALID_ARGUMENT
    return L2_65
  end
  L2_65 = nil
  L2_65 = _UPVALUE1_.ipAddressCheck(IPV4_ADDRESS_FAMILY, primaryDnsServer)
  if L2_65 == _UPVALUE0_.ERROR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(serverTable, ROWID, A0_63, _UPVALUE2_.secondaryDnsServer, A1_64) == NIL then
    return _UPVALUE0_.FAILURE, A0_63
  end
  return _UPVALUE0_.SUCCESS, A0_63
end
function winsServerGet()
  local L0_66, L1_67
  L0_66 = firstCookieGet
  L1_67 = serverTable
  L0_66 = L0_66(L1_67, whereNst)
  L1_67 = NIL
  if L0_66 == L1_67 then
    L1_67 = _UPVALUE0_
    L1_67 = L1_67.INVALID_COOKIE
    return L1_67
  end
  L1_67 = db
  L1_67 = L1_67.getAttribute
  L1_67 = L1_67(serverTable, ROWID, L0_66, _UPVALUE1_.winsServer)
  if L1_67 == NIL then
    return _UPVALUE0_.FAILURE, L0_66
  end
  return _UPVALUE0_.SUCCESS, L0_66, L1_67
end
function winsServerGetNext(A0_68)
  local L2_69
  L2_69 = _UPVALUE0_
  L2_69 = L2_69.NOT_SUPPORTED
  return L2_69, A0_68
end
function winsServerSet(A0_70, A1_71)
  local L2_72
  L2_72 = checkCookieExists
  L2_72 = L2_72(A0_70, serverTable, whereNst)
  if L2_72 == FALSE then
    L2_72 = _UPVALUE0_
    L2_72 = L2_72.INVALID_COOKIE
    return L2_72
  end
  L2_72 = NIL
  if A1_71 == L2_72 then
    L2_72 = _UPVALUE0_
    L2_72 = L2_72.INVALID_ARGUMENT
    return L2_72
  end
  L2_72 = nil
  L2_72 = _UPVALUE1_.ipAddressCheck(IPV4_ADDRESS_FAMILY, A1_71)
  if L2_72 == _UPVALUE0_.ERROR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(serverTable, ROWID, A0_70, _UPVALUE2_.winsServer, A1_71) == NIL then
    return _UPVALUE0_.FAILURE, A0_70
  end
  return _UPVALUE0_.SUCCESS, A0_70
end
function leaseTimeGet()
  local L0_73, L1_74
  L0_73 = firstCookieGet
  L1_74 = serverTable
  L0_73 = L0_73(L1_74, whereNst)
  L1_74 = NIL
  if L0_73 == L1_74 then
    L1_74 = _UPVALUE0_
    L1_74 = L1_74.INVALID_COOKIE
    return L1_74
  end
  L1_74 = db
  L1_74 = L1_74.getAttribute
  L1_74 = L1_74(serverTable, ROWID, L0_73, _UPVALUE1_.leaseTime)
  if L1_74 == NIL then
    return _UPVALUE0_.FAILURE, L0_73
  end
  return _UPVALUE0_.SUCCESS, L0_73, L1_74
end
function leaseTimeGetNext(A0_75)
  local L2_76
  L2_76 = _UPVALUE0_
  L2_76 = L2_76.NOT_SUPPORTED
  return L2_76, A0_75
end
function leaseTimeSet(A0_77, A1_78)
  if checkCookieExists(A0_77, serverTable, whereNst) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if A1_78 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_78) < leaseMinTime or tonumber(A1_78) > leaseMaxTime then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(serverTable, ROWID, A0_77, _UPVALUE1_.leaseTime, A1_78) == NIL then
    return _UPVALUE0_.FAILURE, A0_77
  end
  return _UPVALUE0_.SUCCESS, A0_77
end
function dhcpServerDMZGet()
  local L0_79
  L0_79 = firstCookieGet
  L0_79 = L0_79(serverTable, whereNst)
  if L0_79 == NIL then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if db.getRow(serverTable, ROWID, L0_79) == NIL then
    return _UPVALUE0_.FAILURE, L0_79
  end
  if db.getRowWhere(subnetTable, whereSt) == NIL then
    return _UPVALUE0_.FAILURE, L0_79
  end
  return _UPVALUE0_.SUCCESS, L0_79, db.getRowWhere(subnetTable, whereSt)[subnetTable .. "." .. _UPVALUE1_.ipAddress], db.getRowWhere(subnetTable, whereSt)[subnetTable .. "." .. _UPVALUE1_.subnetMask], db.getRow(serverTable, ROWID, L0_79)[serverTable .. "." .. _UPVALUE1_.startIpAddress], db.getRow(serverTable, ROWID, L0_79)[serverTable .. "." .. _UPVALUE1_.endIpAddress], db.getRow(serverTable, ROWID, L0_79)[serverTable .. "." .. _UPVALUE1_.gateway], db.getRow(serverTable, ROWID, L0_79)[serverTable .. "." .. _UPVALUE1_.primaryDnsServer], db.getRow(serverTable, ROWID, L0_79)[serverTable .. "." .. _UPVALUE1_.secondaryDnsServer], db.getRow(serverTable, ROWID, L0_79)[serverTable .. "." .. _UPVALUE1_.domain], db.getRow(serverTable, ROWID, L0_79)[serverTable .. "." .. _UPVALUE1_.winsServer], db.getRow(serverTable, ROWID, L0_79)[serverTable .. "." .. _UPVALUE1_.leaseTime]
end
function dhcpServerDMZGetNext(A0_80)
  local L2_81
  L2_81 = _UPVALUE0_
  L2_81 = L2_81.NOT_SUPPORTED
  return L2_81, A0_80
end
function dhcpServerDMZSet(A0_82, A1_83, A2_84, A3_85, A4_86, A5_87, A6_88, A7_89, A8_90, A9_91, A10_92)
  local L11_93, L12_94, L13_95, L14_96, L15_97, L16_98
  L11_93 = checkCookieExists
  L12_94 = A0_82
  L13_95 = serverTable
  L14_96 = whereNst
  L11_93 = L11_93(L12_94, L13_95, L14_96)
  L12_94 = FALSE
  if L11_93 == L12_94 then
    L11_93 = _UPVALUE0_
    L11_93 = L11_93.INVALID_COOKIE
    return L11_93
  end
  L11_93 = nil
  L12_94 = NIL
  if A1_83 == L12_94 then
    L12_94 = _UPVALUE1_
    L12_94 = L12_94.COMP_DHCP_SERVER_DMZ_IPADDRESS_NIL
    return L12_94
  end
  L12_94 = _UPVALUE2_
  L12_94 = L12_94.ipAddressCheck
  L13_95 = IPV4_ADDRESS_FAMILY
  L14_96 = A1_83
  L12_94 = L12_94(L13_95, L14_96)
  L11_93 = L12_94
  L12_94 = _UPVALUE0_
  L12_94 = L12_94.ERROR
  if L11_93 == L12_94 then
    L12_94 = _UPVALUE1_
    L12_94 = L12_94.COMP_DHCP_SERVER_DMZ_IPADDRESS_INVALID
    return L12_94
  end
  L12_94 = NIL
  if A2_84 == L12_94 then
    L12_94 = _UPVALUE1_
    L12_94 = L12_94.COMP_DHCP_SERVER_DMZ_SUBNET_NIL
    return L12_94
  end
  L12_94 = _UPVALUE2_
  L12_94 = L12_94.ipAddressCheck
  L13_95 = IPV4_ADDRESS_FAMILY
  L14_96 = A2_84
  L12_94 = L12_94(L13_95, L14_96)
  L11_93 = L12_94
  L12_94 = _UPVALUE0_
  L12_94 = L12_94.ERROR
  if L11_93 == L12_94 then
    L12_94 = _UPVALUE1_
    L12_94 = L12_94.COMP_DHCP_SERVER_DMZ_SUBNET_INVALID
    return L12_94
  end
  if A8_90 ~= nil then
    L12_94 = string
    L12_94 = L12_94.len
    L13_95 = A8_90
    L12_94 = L12_94(L13_95)
    L13_95 = MAX_LENGTH_DOMAIN_NAME
    if L12_94 > L13_95 then
      L12_94 = _UPVALUE1_
      L12_94 = L12_94.COMP_DOMAIN_NAME_LENGTH_INVALID
      return L12_94
    end
  end
  L12_94 = NIL
  if A3_85 ~= L12_94 then
    L12_94 = _UPVALUE2_
    L12_94 = L12_94.ipAddressCheck
    L13_95 = IPV4_ADDRESS_FAMILY
    L14_96 = A3_85
    L12_94 = L12_94(L13_95, L14_96)
    L11_93 = L12_94
    L12_94 = _UPVALUE0_
    L12_94 = L12_94.ERROR
    if L11_93 == L12_94 then
      L12_94 = _UPVALUE1_
      L12_94 = L12_94.COMP_DHCP_SERVER_DMZ_STARTIP_INVALID
      return L12_94
    end
    L12_94 = _UPVALUE2_
    L12_94 = L12_94.ipv4SingleMaskCheck
    L13_95 = A1_83
    L14_96 = A3_85
    L15_97 = A2_84
    L12_94 = L12_94(L13_95, L14_96, L15_97)
    L11_93 = L12_94
    L12_94 = _UPVALUE0_
    L12_94 = L12_94.ERROR
    if L11_93 == L12_94 then
      L12_94 = _UPVALUE1_
      L12_94 = L12_94.COMP_DHCP_SERVER_DMZ_STARTIP_NOTIN_NETWORK
      return L12_94
    end
  end
  L12_94 = NIL
  if A4_86 ~= L12_94 then
    L12_94 = _UPVALUE2_
    L12_94 = L12_94.ipAddressCheck
    L13_95 = IPV4_ADDRESS_FAMILY
    L14_96 = A4_86
    L12_94 = L12_94(L13_95, L14_96)
    L11_93 = L12_94
    L12_94 = _UPVALUE0_
    L12_94 = L12_94.ERROR
    if L11_93 == L12_94 then
      L12_94 = _UPVALUE1_
      L12_94 = L12_94.COMP_DHCP_SERVER_DMZ_ENDIP_INVALID
      return L12_94
    end
    L12_94 = _UPVALUE2_
    L12_94 = L12_94.ipv4SingleMaskCheck
    L13_95 = A1_83
    L14_96 = A4_86
    L15_97 = A2_84
    L12_94 = L12_94(L13_95, L14_96, L15_97)
    L11_93 = L12_94
    L12_94 = _UPVALUE0_
    L12_94 = L12_94.ERROR
    if L11_93 == L12_94 then
      L12_94 = _UPVALUE1_
      L12_94 = L12_94.COMP_DHCP_SERVER_DMZ_ENDIP_NOTIN_NETWORK
      return L12_94
    end
  end
  L12_94 = NIL
  if A5_87 ~= L12_94 and A5_87 ~= "" then
    L12_94 = _UPVALUE2_
    L12_94 = L12_94.ipAddressCheck
    L13_95 = IPV4_ADDRESS_FAMILY
    L14_96 = A5_87
    L12_94 = L12_94(L13_95, L14_96)
    L11_93 = L12_94
    L12_94 = _UPVALUE0_
    L12_94 = L12_94.ERROR
    if L11_93 == L12_94 then
      L12_94 = _UPVALUE1_
      L12_94 = L12_94.COMP_DHCP_SERVER_DMZ_GATEWAY_INVALID
      return L12_94
    end
    L12_94 = _UPVALUE2_
    L12_94 = L12_94.ipv4SingleMaskCheck
    L13_95 = A1_83
    L14_96 = A5_87
    L15_97 = A2_84
    L12_94 = L12_94(L13_95, L14_96, L15_97)
    L11_93 = L12_94
    L12_94 = _UPVALUE0_
    L12_94 = L12_94.ERROR
    if L11_93 == L12_94 then
      L12_94 = _UPVALUE1_
      L12_94 = L12_94.COMP_DHCP_SERVER_DMZ_GATEWAY_NOTIN_NETWORK
      return L12_94
    end
  end
  L12_94 = NIL
  if A6_88 ~= L12_94 and A6_88 ~= "" then
    L12_94 = _UPVALUE2_
    L12_94 = L12_94.ipAddressCheck
    L13_95 = IPV4_ADDRESS_FAMILY
    L14_96 = A6_88
    L12_94 = L12_94(L13_95, L14_96)
    L11_93 = L12_94
    L12_94 = _UPVALUE0_
    L12_94 = L12_94.ERROR
    if L11_93 == L12_94 then
      L12_94 = _UPVALUE1_
      L12_94 = L12_94.COMP_DHCP_SERVER_DMZ_PRIMARYDNS_INVALID
      return L12_94
    end
  end
  L12_94 = NIL
  if A7_89 ~= L12_94 and A7_89 ~= "" then
    L12_94 = _UPVALUE2_
    L12_94 = L12_94.ipAddressCheck
    L13_95 = IPV4_ADDRESS_FAMILY
    L14_96 = A7_89
    L12_94 = L12_94(L13_95, L14_96)
    L11_93 = L12_94
    L12_94 = _UPVALUE0_
    L12_94 = L12_94.ERROR
    if L11_93 == L12_94 then
      L12_94 = _UPVALUE1_
      L12_94 = L12_94.COMP_DHCP_SERVER_DMZ_SECONDARYDNS_INVALID
      return L12_94
    end
  end
  L12_94 = NIL
  if A9_91 ~= L12_94 and A9_91 ~= "" then
    L12_94 = _UPVALUE2_
    L12_94 = L12_94.ipAddressCheck
    L13_95 = IPV4_ADDRESS_FAMILY
    L14_96 = A9_91
    L12_94 = L12_94(L13_95, L14_96)
    L11_93 = L12_94
    L12_94 = _UPVALUE0_
    L12_94 = L12_94.ERROR
    if L11_93 == L12_94 then
      L12_94 = _UPVALUE1_
      L12_94 = L12_94.COMP_DHCP_SERVER_DMZ_WINSSERVER_INVALID
      return L12_94
    end
  end
  L12_94 = NIL
  if A10_92 == L12_94 then
    A10_92 = DEFAULT_LEASE_TIME
  end
  L12_94 = tonumber
  L13_95 = A10_92
  L12_94 = L12_94(L13_95)
  L13_95 = leaseMinTime
  if not (L12_94 < L13_95) then
    L13_95 = leaseMaxTime
  elseif L12_94 > L13_95 then
    L13_95 = _UPVALUE1_
    L13_95 = L13_95.COMP_DHCP_SERVER_DMZ_LEASETIME_INVALID
    return L13_95
  end
  L13_95 = {}
  L14_96 = serverTable
  L15_97 = "."
  L16_98 = _UPVALUE3_
  L16_98 = L16_98.dhcpEnabled
  L14_96 = L14_96 .. L15_97 .. L16_98
  L15_97 = ENABLE
  L13_95[L14_96] = L15_97
  L14_96 = serverTable
  L15_97 = "."
  L16_98 = _UPVALUE3_
  L16_98 = L16_98.domain
  L14_96 = L14_96 .. L15_97 .. L16_98
  L13_95[L14_96] = A8_90
  L14_96 = serverTable
  L15_97 = "."
  L16_98 = _UPVALUE3_
  L16_98 = L16_98.startIpAddress
  L14_96 = L14_96 .. L15_97 .. L16_98
  L13_95[L14_96] = A3_85
  L14_96 = serverTable
  L15_97 = "."
  L16_98 = _UPVALUE3_
  L16_98 = L16_98.endIpAddress
  L14_96 = L14_96 .. L15_97 .. L16_98
  L13_95[L14_96] = A4_86
  L14_96 = serverTable
  L15_97 = "."
  L16_98 = _UPVALUE3_
  L16_98 = L16_98.gateway
  L14_96 = L14_96 .. L15_97 .. L16_98
  L13_95[L14_96] = A5_87
  L14_96 = serverTable
  L15_97 = "."
  L16_98 = _UPVALUE3_
  L16_98 = L16_98.primaryDnsServer
  L14_96 = L14_96 .. L15_97 .. L16_98
  L13_95[L14_96] = A6_88
  L14_96 = serverTable
  L15_97 = "."
  L16_98 = _UPVALUE3_
  L16_98 = L16_98.secondaryDnsServer
  L14_96 = L14_96 .. L15_97 .. L16_98
  L13_95[L14_96] = A7_89
  L14_96 = serverTable
  L15_97 = "."
  L16_98 = _UPVALUE3_
  L16_98 = L16_98.winsServer
  L14_96 = L14_96 .. L15_97 .. L16_98
  L13_95[L14_96] = A9_91
  L14_96 = serverTable
  L15_97 = "."
  L16_98 = _UPVALUE3_
  L16_98 = L16_98.leaseTime
  L14_96 = L14_96 .. L15_97 .. L16_98
  L13_95[L14_96] = A10_92
  L14_96 = db
  L14_96 = L14_96.update
  L15_97 = serverTable
  L16_98 = L13_95
  L14_96 = L14_96(L15_97, L16_98, A0_82)
  L15_97 = NIL
  if L14_96 == L15_97 then
    L15_97 = _UPVALUE0_
    L15_97 = L15_97.FAILURE
    L16_98 = A0_82
    return L15_97, L16_98
  end
  L15_97 = {}
  L16_98 = subnetTable
  L16_98 = L16_98 .. "." .. _UPVALUE3_.ipAddress
  L15_97[L16_98] = A1_83
  L16_98 = subnetTable
  L16_98 = L16_98 .. "." .. _UPVALUE3_.subnetMask
  L15_97[L16_98] = A2_84
  L16_98 = subnetTable
  L16_98 = L16_98 .. "." .. _UPVALUE3_.ifGateway
  L15_97[L16_98] = defaultGateway
  L16_98 = db
  L16_98 = L16_98.getAttributeWhere
  L16_98 = L16_98(subnetTable, whereSt, ROWID)
  if db.update(subnetTable, L15_97, L16_98) == NIL then
    return _UPVALUE0_.FAILURE, A0_82
  end
  return _UPVALUE0_.SUCCESS, A0_82
end
function dhcpServerDMZCreate(A0_99, A1_100, A2_101, A3_102, A4_103, A5_104, A6_105, A7_106, A8_107, A9_108)
  local L11_109
  L11_109 = _UPVALUE0_
  L11_109 = L11_109.NOT_SUPPORTED
  return L11_109, cookie
end
function dhcpServerDMZDelete(A0_110)
  local L2_111
  L2_111 = _UPVALUE0_
  L2_111 = L2_111.NOT_SUPPORTED
  return L2_111, A0_110
end
