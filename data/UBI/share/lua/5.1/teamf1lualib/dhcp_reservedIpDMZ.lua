local L0_0
L0_0 = module
L0_0("com.teamf1.core.dhcp.reservedipdmz", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vlan_validation")
L0_0 = require
L0_0("teamf1lualib/dmz_addressing")
L0_0 = require
L0_0("teamf1lualib/dhcp_returnCodes")
L0_0 = require
L0_0("validationsLuaLib")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.dhcp_returnCodes")
reservedipTable = "DhcpfixedIpAddress"
;({}).macAddress = "MacAddr"
;({}).ipAddress = "IpAddr"
;({}).interfaceType = "LogicalIfName"
;({}).name = "Name"
;({}).ipMacBinding = "AssociatingEnabled"
LAN_NAME = "LAN"
DMZ_NAME = "DMZ"
ROWID = "_ROWID_"
where = ({}).interfaceType .. " = '" .. DMZ_NAME .. "'"
dhcpTable = "dhcp"
;({}).dhcp = {}
;({}).dhcp.logicalIfName = "logicalIfName"
;({}).dhcp.startAddress = "startAddress"
;({}).dhcp.endAddress = "endAddress"
function macAddressGet()
  local L0_1, L1_2
  L0_1 = firstCookieGet
  L1_2 = reservedipTable
  L0_1 = L0_1(L1_2, where)
  L1_2 = NIL
  if L0_1 == L1_2 then
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.INVALID_ARGUMENT
    return L1_2
  end
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(reservedipTable, ROWID, L0_1, _UPVALUE1_.macAddress)
  if L1_2 == NIL then
    return _UPVALUE0_.FAILURE, L0_1
  end
  return _UPVALUE0_.SUCCESS, L0_1, L1_2
end
function macAddressGetNext(A0_3)
  local L1_4, L2_5, L3_6
  L1_4 = nextCookieGet
  L2_5 = A0_3
  L3_6 = reservedipTable
  L2_5 = L1_4(L2_5, L3_6, where)
  L3_6 = FALSE
  if L1_4 == L3_6 then
    L3_6 = NIL
    if L2_5 == L3_6 then
      L3_6 = _UPVALUE0_
      L3_6 = L3_6.NEXT_ROWID_INVALID
      return L3_6
    else
      L3_6 = _UPVALUE0_
      L3_6 = L3_6.INVALID_COOKIE
      return L3_6
    end
  end
  L3_6 = db
  L3_6 = L3_6.getAttribute
  L3_6 = L3_6(reservedipTable, ROWID, L1_4, _UPVALUE1_.macAddress)
  if L3_6 == NIL then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L3_6
end
function macAddressSet(A0_7, A1_8)
  local L2_9
  L2_9 = checkCookieExists
  L2_9 = L2_9(A0_7, reservedipTable, where)
  if L2_9 == FALSE then
    L2_9 = _UPVALUE0_
    L2_9 = L2_9.INVALID_COOKIE
    return L2_9
  end
  L2_9 = NIL
  if A1_8 == L2_9 then
    L2_9 = _UPVALUE0_
    L2_9 = L2_9.INVALID_ARGUMENT
    return L2_9
  end
  L2_9 = nil
  L2_9 = _UPVALUE1_.isMacAddress(A1_8)
  if L2_9 == _UPVALUE0_.ERROR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(reservedipTable, ROWID, A0_7, _UPVALUE2_.macAddress, A1_8) == NIL then
    return _UPVALUE0_.FAILURE, A0_7
  end
  return _UPVALUE0_.SUCCESS, cookieie
end
function macAddressDelete(A0_10, A1_11)
  if checkCookieExists(A0_10, reservedipTable, where) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if db.deleteRow(reservedipTable, ROWID, A0_10) == NIL then
    return _UPVALUE0_.FAILURE, A0_10
  end
  return _UPVALUE0_.SUCCESS, A0_10
end
function ipAddressGet()
  local L0_12, L1_13
  L0_12 = firstCookieGet
  L1_13 = reservedipTable
  L0_12 = L0_12(L1_13, where)
  L1_13 = db
  L1_13 = L1_13.getAttribute
  L1_13 = L1_13(reservedipTable, ROWID, L0_12, _UPVALUE0_.ipAddress)
  if L1_13 == NIL then
    return _UPVALUE1_.FAILURE, L0_12
  end
  return _UPVALUE1_.SUCCESS, L0_12, L1_13
end
function ipAddressGetNext(A0_14)
  local L1_15, L2_16, L3_17
  L1_15 = nextCookieGet
  L2_16 = A0_14
  L3_17 = reservedipTable
  L2_16 = L1_15(L2_16, L3_17, where)
  L3_17 = FALSE
  if L1_15 == L3_17 then
    L3_17 = NIL
    if L2_16 == L3_17 then
      L3_17 = _UPVALUE0_
      L3_17 = L3_17.NEXT_ROWID_INVALID
      return L3_17
    else
      L3_17 = _UPVALUE0_
      L3_17 = L3_17.INVALID_COOKIE
      return L3_17
    end
  end
  L3_17 = db
  L3_17 = L3_17.getAttribute
  L3_17 = L3_17(reservedipTable, ROWID, L1_15, _UPVALUE1_.ipAddress)
  if L3_17 == NIL then
    return _UPVALUE0_.FAILURE, L1_15
  end
  return _UPVALUE0_.SUCCESS, L1_15, L3_17
end
function ipAddressSet(A0_18, A1_19)
  local L2_20
  L2_20 = checkCookieExists
  L2_20 = L2_20(A0_18, reservedipTable, where)
  if L2_20 == FALSE then
    L2_20 = _UPVALUE0_
    L2_20 = L2_20.INVALID_COOKIE
    return L2_20
  end
  L2_20 = NIL
  if A1_19 == L2_20 then
    L2_20 = _UPVALUE0_
    L2_20 = L2_20.INVALID_ARGUMENT
    return L2_20
  end
  L2_20 = nil
  L2_20 = _UPVALUE1_.ipAddressCheck(IPV4_ADDRESS_FAMILY, A1_19)
  if L2_20 == _UPVALUE0_.ERROR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(reservedipTable, ROWID, A0_18, _UPVALUE2_.ipAddress, A1_19) == NIL then
    return _UPVALUE0_.FAILURE, A0_18
  end
  return _UPVALUE0_.SUCCESS, A0_18
end
function interfaceTypeGet()
  local L1_21
  L1_21 = _UPVALUE0_
  L1_21 = L1_21.NOT_SUPPORTED
  return L1_21
end
function interfaceTypeGetNext(A0_22)
  return _UPVALUE0_.NOT_SUPPORTED
end
function interfaceTypeSet(A0_23, A1_24)
  return _UPVALUE0_.NOT_SUPPORTED
end
function IpMacReservationDMZGet(A0_25)
  if db.getRow(reservedipTable, ROWID, A0_25) == NIL then
    return _UPVALUE0_.FAILURE, A0_25
  end
  return _UPVALUE0_.SUCCESS, A0_25, db.getRow(reservedipTable, ROWID, A0_25)[reservedipTable .. "." .. _UPVALUE1_.macAddress], db.getRow(reservedipTable, ROWID, A0_25)[reservedipTable .. "." .. _UPVALUE1_.ipAddress], db.getRow(reservedipTable, ROWID, A0_25)[reservedipTable .. "." .. _UPVALUE1_.interfaceType]
end
function IpMacReservationDMZGetNext(A0_26)
  local L1_27
  L1_27 = nextCookieGet
  L1_27 = L1_27(A0_26, reservedipTable, where)
  if L1_27 == FALSE then
    if L1_27(A0_26, reservedipTable, where) == NIL then
      return _UPVALUE0_.NEXT_ROWID_INVALID
    else
      return _UPVALUE0_.INVALID_COOKIE
    end
  end
  if db.getRow(reservedipTable, ROWID, L1_27) == NIL then
    return _UPVALUE0_.FAILURE, A0_26
  end
  return _UPVALUE0_.SUCCESS, A0_26, db.getRow(reservedipTable, ROWID, L1_27)[reservedipTable .. "." .. _UPVALUE1_.macAddress], db.getRow(reservedipTable, ROWID, L1_27)[reservedipTable .. "." .. _UPVALUE1_.ipAddress], db.getRow(reservedipTable, ROWID, L1_27)[reservedipTable .. "." .. _UPVALUE1_.interfaceType]
end
function IpMacReservationDMZGetAll()
  local L0_28
  L0_28 = db
  L0_28 = L0_28.getRowsWhere
  L0_28 = L0_28(reservedipTable, where)
  if L0_28 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_28
end
function IpMacReservationDMZSet(A0_29, A1_30, A2_31)
  local L3_32, L4_33, L5_34, L6_35, L7_36, L8_37, L9_38, L10_39, L11_40, L12_41, L13_42, L14_43, L15_44, L16_45, L17_46, L18_47, L19_48, L20_49
  L8_37 = checkCookieExists
  L9_38 = A0_29
  L10_39 = reservedipTable
  L11_40 = where
  L8_37 = L8_37(L9_38, L10_39, L11_40)
  L9_38 = FALSE
  if L8_37 == L9_38 then
    L8_37 = _UPVALUE0_
    L8_37 = L8_37.INVALID_COOKIE
    return L8_37
  end
  L8_37 = NIL
  if A1_30 == L8_37 then
    L8_37 = _UPVALUE1_
    L8_37 = L8_37.COMP_DHCP_RESERVEDIP_DMZ_MACADDRESS_NIL
    return L8_37
  end
  L9_38 = A1_30
  L8_37 = A1_30.lower
  L10_39 = A1_30
  L8_37 = L8_37(L9_38, L10_39)
  L9_38 = where
  L10_39 = " and lower("
  L11_40 = reservedipTable
  L12_41 = "."
  L13_42 = _UPVALUE2_
  L13_42 = L13_42.macAddress
  L14_43 = ")='"
  L15_44 = L8_37
  L16_45 = "' and "
  L17_46 = ROWID
  L18_47 = "!='"
  L19_48 = A0_29
  L20_49 = "'"
  L9_38 = L9_38 .. L10_39 .. L11_40 .. L12_41 .. L13_42 .. L14_43 .. L15_44 .. L16_45 .. L17_46 .. L18_47 .. L19_48 .. L20_49
  L10_39 = db
  L10_39 = L10_39.existsRowWhere
  L11_40 = reservedipTable
  L12_41 = L9_38
  L10_39 = L10_39(L11_40, L12_41)
  if L10_39 then
    L11_40 = _UPVALUE1_
    L11_40 = L11_40.COMP_DHCP_RESERVEDIP_DMZ_MACADDRESS_EXISTS
    return L11_40
  end
  L11_40 = _UPVALUE3_
  L11_40 = L11_40.isMacAddress
  L12_41 = A1_30
  L11_40 = L11_40(L12_41)
  L7_36 = L11_40
  L11_40 = _UPVALUE0_
  L11_40 = L11_40.ERROR
  if L7_36 == L11_40 then
    L11_40 = _UPVALUE1_
    L11_40 = L11_40.COMP_DHCP_RESERVEDIP_DMZ_MACADDRESS_INVALID
    return L11_40
  end
  L11_40 = NIL
  if A2_31 == L11_40 then
    L11_40 = _UPVALUE1_
    L11_40 = L11_40.COMP_DHCP_RESERVEDIP_DMZ_IPADDRESS_NIL
    return L11_40
  end
  L11_40 = util
  L11_40 = L11_40.split
  L12_41 = A2_31
  L13_42 = "."
  L11_40 = L11_40(L12_41, L13_42)
  L3_32 = L11_40
  if L3_32 ~= nil then
    L11_40 = tonumber
    L12_41 = L3_32[1]
    L11_40 = L11_40(L12_41)
    if L11_40 ~= 224 then
      L11_40 = tonumber
      L12_41 = L3_32[1]
      L11_40 = L11_40(L12_41)
      if not (L11_40 > 224) then
        L11_40 = tonumber
        L12_41 = L3_32[1]
        L11_40 = L11_40(L12_41)
      end
    end
  elseif L11_40 == 0 or A2_31 == "0.0.0.0" then
    L11_40 = _UPVALUE1_
    L11_40 = L11_40.COMP_DHCP_RESERVEDIP_DMZ_IPADDRESS_INVALID
    return L11_40
  end
  L11_40 = validationsLuaLib
  L11_40 = L11_40.ipv4AddrAsciiToNum
  L12_41 = A2_31
  L12_41 = L11_40(L12_41)
  L4_33 = L12_41
  L7_36 = L11_40
  if L7_36 == -1 then
    L11_40 = _UPVALUE1_
    L11_40 = L11_40.COMP_DHCP_RESERVEDIP_DMZ_IPADDRESS_INVALID
    return L11_40
  end
  L11_40 = _UPVALUE2_
  L11_40 = L11_40.ipAddress
  L12_41 = " = '"
  L13_42 = A2_31
  L14_43 = "' and "
  L15_44 = ROWID
  L16_45 = "!='"
  L17_46 = A0_29
  L18_47 = "'"
  L11_40 = L11_40 .. L12_41 .. L13_42 .. L14_43 .. L15_44 .. L16_45 .. L17_46 .. L18_47
  L12_41 = db
  L12_41 = L12_41.existsRowWhere
  L13_42 = reservedipTable
  L14_43 = L11_40
  L12_41 = L12_41(L13_42, L14_43)
  if L12_41 then
    L13_42 = _UPVALUE1_
    L13_42 = L13_42.COMP_DHCP_RESERVEDIP_DMZ_IPADDRESS_EXISTS
    return L13_42
  end
  L13_42 = _UPVALUE4_
  L13_42 = L13_42.ipAddressGet
  L15_44 = L13_42()
  L16_45 = _UPVALUE0_
  L16_45 = L16_45.SUCCESS
  if L13_42 ~= L16_45 then
    L16_45 = _UPVALUE1_
    L16_45 = L16_45.COMP_DMZ_ADDRESSING_IPADDRESS_GET_FAIL
    return L16_45
  end
  L16_45 = _UPVALUE4_
  L16_45 = L16_45.subnetMaskGet
  L18_47 = L16_45()
  L19_48 = _UPVALUE0_
  L19_48 = L19_48.SUCCESS
  if L16_45 ~= L19_48 then
    L19_48 = _UPVALUE1_
    L19_48 = L19_48.COMP_DMZ_ADDRESSING_SUBNET_GET_FAIL
    return L19_48
  end
  L19_48 = _UPVALUE3_
  L19_48 = L19_48.ipv4SingleMaskCheck
  L20_49 = A2_31
  L19_48 = L19_48(L20_49, L15_44, L18_47)
  L7_36 = L19_48
  L19_48 = _UPVALUE0_
  L19_48 = L19_48.ERROR
  if L7_36 == L19_48 then
    L19_48 = _UPVALUE1_
    L19_48 = L19_48.COMP_DHCP_RESERVEDIP_DMZ_IPADDRESS_NOTIN_NETWORK
    return L19_48
  end
  L19_48 = _UPVALUE3_
  L19_48 = L19_48.ipv4AddressesCompare
  L20_49 = A2_31
  L19_48 = L19_48(L20_49, L15_44)
  L7_36 = L19_48
  if L7_36 == 2 then
    L19_48 = _UPVALUE1_
    L19_48 = L19_48.COMP_DHCP_RESERVEDIP_DMZ_IPADDRESS_SAME
    return L19_48
  end
  L19_48 = db
  L19_48 = L19_48.getRow
  L20_49 = dhcpTable
  L19_48 = L19_48(L20_49, _UPVALUE2_.dhcp.logicalIfName, DMZ_NAME)
  L20_49 = dhcpTable
  L20_49 = L20_49 .. "." .. _UPVALUE2_.dhcp.startAddress
  L6_35 = L19_48[L20_49]
  L20_49 = dhcpTable
  L20_49 = L20_49 .. "." .. _UPVALUE2_.dhcp.endAddress
  L5_34 = L19_48[L20_49]
  L20_49 = validationsLuaLib
  L20_49 = L20_49.ipv4AddrTokenAddrRangeCheck
  L20_49 = L20_49(A2_31, L6_35, L5_34)
  L7_36 = L20_49
  if L7_36 == -1 then
    L20_49 = _UPVALUE1_
    L20_49 = L20_49.COMP_DHCP_RESERVEDIP_DMZ_IPADDRESS_INDHCP_RANGE
    return L20_49
  end
  L20_49 = {}
  L20_49[reservedipTable .. "." .. _UPVALUE2_.macAddress] = A1_30
  L20_49[reservedipTable .. "." .. _UPVALUE2_.ipAddress] = A2_31
  if db.update(reservedipTable, L20_49, A0_29) == NIL then
    return _UPVALUE0_.FAILURE, A0_29
  end
  return _UPVALUE0_.SUCCESS, A0_29
end
function IpMacReservationDMZCreate(A0_50, A1_51, A2_52)
  local L3_53, L4_54, L5_55, L6_56, L7_57, L8_58, L9_59, L10_60, L11_61, L12_62, L13_63, L14_64, L15_65, L16_66, L17_67, L18_68, L19_69, L20_70, L21_71, L22_72, L23_73
  L8_58 = db
  L8_58 = L8_58.getTable
  L9_59 = reservedipTable
  L8_58 = L8_58(L9_59)
  L9_59 = #L8_58
  L10_60 = RESERVED_IP_MAXLIMIT
  if L9_59 >= L10_60 then
    L9_59 = _UPVALUE0_
    L9_59 = L9_59.COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_MAX_REACHED
    return L9_59
  end
  L9_59 = NIL
  if A0_50 == L9_59 then
    L9_59 = _UPVALUE0_
    L9_59 = L9_59.COMP_DHCP_RESERVEDIP_DMZ_MACADDRESS_NIL
    return L9_59
  end
  L9_59 = _UPVALUE1_
  L9_59 = L9_59.isMacAddress
  L10_60 = A0_50
  L9_59 = L9_59(L10_60)
  L7_57 = L9_59
  L9_59 = _UPVALUE2_
  L9_59 = L9_59.ERROR
  if L7_57 == L9_59 then
    L9_59 = _UPVALUE0_
    L9_59 = L9_59.COMP_DHCP_RESERVEDIP_DMZ_MACADDRESS_INVALID
    return L9_59
  end
  L9_59 = NIL
  if A1_51 == L9_59 then
    L9_59 = _UPVALUE0_
    L9_59 = L9_59.COMP_DHCP_RESERVEDIP_DMZ_IPADDRESS_NIL
    return L9_59
  end
  L9_59 = util
  L9_59 = L9_59.split
  L10_60 = A1_51
  L11_61 = "."
  L9_59 = L9_59(L10_60, L11_61)
  L3_53 = L9_59
  if L3_53 ~= nil then
    L9_59 = tonumber
    L10_60 = L3_53[1]
    L9_59 = L9_59(L10_60)
    if L9_59 ~= 224 then
      L9_59 = tonumber
      L10_60 = L3_53[1]
      L9_59 = L9_59(L10_60)
      if not (L9_59 > 224) then
        L9_59 = tonumber
        L10_60 = L3_53[1]
        L9_59 = L9_59(L10_60)
      end
    end
  elseif L9_59 == 0 or A1_51 == "0.0.0.0" then
    L9_59 = _UPVALUE0_
    L9_59 = L9_59.COMP_DHCP_RESERVEDIP_DMZ_IPADDRESS_INVALID
    return L9_59
  end
  L9_59 = validationsLuaLib
  L9_59 = L9_59.ipv4AddrAsciiToNum
  L10_60 = A1_51
  L10_60 = L9_59(L10_60)
  L4_54 = L10_60
  L7_57 = L9_59
  if L7_57 == -1 then
    L9_59 = _UPVALUE0_
    L9_59 = L9_59.COMP_DHCP_RESERVEDIP_DMZ_IPADDRESS_INVALID
    return L9_59
  end
  L10_60 = A0_50
  L9_59 = A0_50.lower
  L11_61 = A0_50
  L9_59 = L9_59(L10_60, L11_61)
  L10_60 = where
  L11_61 = " and lower("
  L12_62 = reservedipTable
  L13_63 = "."
  L14_64 = _UPVALUE3_
  L14_64 = L14_64.macAddress
  L15_65 = ")='"
  L16_66 = L9_59
  L17_67 = "'"
  L10_60 = L10_60 .. L11_61 .. L12_62 .. L13_63 .. L14_64 .. L15_65 .. L16_66 .. L17_67
  L11_61 = db
  L11_61 = L11_61.existsRowWhere
  L12_62 = reservedipTable
  L13_63 = L10_60
  L11_61 = L11_61(L12_62, L13_63)
  if L11_61 then
    L12_62 = _UPVALUE0_
    L12_62 = L12_62.COMP_DHCP_RESERVEDIP_DMZ_MACADDRESS_EXISTS
    return L12_62
  end
  L12_62 = db
  L12_62 = L12_62.existsRow
  L13_63 = reservedipTable
  L14_64 = _UPVALUE3_
  L14_64 = L14_64.ipAddress
  L15_65 = A1_51
  L12_62 = L12_62(L13_63, L14_64, L15_65)
  if L12_62 then
    L13_63 = _UPVALUE0_
    L13_63 = L13_63.COMP_DHCP_RESERVEDIP_DMZ_IPADDRESS_EXISTS
    return L13_63
  end
  L13_63 = NIL
  if A2_52 == L13_63 then
    L13_63 = _UPVALUE0_
    L13_63 = L13_63.COMP_DHCP_RESERVEDIP_DMZ_INTERFACE_NIL
    return L13_63
  end
  L13_63 = DMZ_NAME
  if A2_52 ~= L13_63 then
    L13_63 = _UPVALUE0_
    L13_63 = L13_63.COMP_DHCP_RESERVEDIP_DMZ_INTERFACE_INVALID
    return L13_63
  end
  L13_63 = _UPVALUE4_
  L13_63 = L13_63.ipAddressGet
  L15_65 = L13_63()
  L16_66 = _UPVALUE2_
  L16_66 = L16_66.SUCCESS
  if L13_63 ~= L16_66 then
    L16_66 = _UPVALUE0_
    L16_66 = L16_66.COMP_DMZ_ADDRESSING_IPADDRESS_GET_FAIL
    return L16_66
  end
  L16_66 = _UPVALUE4_
  L16_66 = L16_66.subnetMaskGet
  L18_68 = L16_66()
  L19_69 = _UPVALUE2_
  L19_69 = L19_69.SUCCESS
  if L16_66 ~= L19_69 then
    L19_69 = _UPVALUE0_
    L19_69 = L19_69.COMP_DMZ_ADDRESSING_SUBNET_GET_FAIL
    return L19_69
  end
  L19_69 = _UPVALUE1_
  L19_69 = L19_69.ipv4SingleMaskCheck
  L20_70 = A1_51
  L21_71 = L15_65
  L22_72 = L18_68
  L19_69 = L19_69(L20_70, L21_71, L22_72)
  L7_57 = L19_69
  L19_69 = _UPVALUE2_
  L19_69 = L19_69.ERROR
  if L7_57 == L19_69 then
    L19_69 = _UPVALUE0_
    L19_69 = L19_69.COMP_DHCP_RESERVEDIP_DMZ_IPADDRESS_NOTIN_NETWORK
    return L19_69
  end
  L19_69 = _UPVALUE1_
  L19_69 = L19_69.ipv4AddressesCompare
  L20_70 = A1_51
  L21_71 = L15_65
  L19_69 = L19_69(L20_70, L21_71)
  L7_57 = L19_69
  if L7_57 == 2 then
    L19_69 = _UPVALUE0_
    L19_69 = L19_69.COMP_DHCP_RESERVEDIP_DMZ_IPADDRESS_SAME
    return L19_69
  end
  L19_69 = db
  L19_69 = L19_69.getRow
  L20_70 = dhcpTable
  L21_71 = _UPVALUE3_
  L21_71 = L21_71.dhcp
  L21_71 = L21_71.logicalIfName
  L22_72 = DMZ_NAME
  L19_69 = L19_69(L20_70, L21_71, L22_72)
  L20_70 = dhcpTable
  L21_71 = "."
  L22_72 = _UPVALUE3_
  L22_72 = L22_72.dhcp
  L22_72 = L22_72.startAddress
  L20_70 = L20_70 .. L21_71 .. L22_72
  L6_56 = L19_69[L20_70]
  L20_70 = dhcpTable
  L21_71 = "."
  L22_72 = _UPVALUE3_
  L22_72 = L22_72.dhcp
  L22_72 = L22_72.endAddress
  L20_70 = L20_70 .. L21_71 .. L22_72
  L5_55 = L19_69[L20_70]
  L20_70 = validationsLuaLib
  L20_70 = L20_70.ipv4AddrTokenAddrRangeCheck
  L21_71 = A1_51
  L22_72 = L6_56
  L23_73 = L5_55
  L20_70 = L20_70(L21_71, L22_72, L23_73)
  L7_57 = L20_70
  if L7_57 == -1 then
    L20_70 = _UPVALUE0_
    L20_70 = L20_70.COMP_DHCP_RESERVEDIP_DMZ_IPADDRESS_INDHCP_RANGE
    return L20_70
  end
  L20_70 = {}
  L21_71 = reservedipTable
  L22_72 = "."
  L23_73 = _UPVALUE3_
  L23_73 = L23_73.macAddress
  L21_71 = L21_71 .. L22_72 .. L23_73
  L20_70[L21_71] = A0_50
  L21_71 = reservedipTable
  L22_72 = "."
  L23_73 = _UPVALUE3_
  L23_73 = L23_73.ipAddress
  L21_71 = L21_71 .. L22_72 .. L23_73
  L20_70[L21_71] = A1_51
  L21_71 = reservedipTable
  L22_72 = "."
  L23_73 = _UPVALUE3_
  L23_73 = L23_73.interfaceType
  L21_71 = L21_71 .. L22_72 .. L23_73
  L20_70[L21_71] = A2_52
  L21_71 = reservedipTable
  L22_72 = "."
  L23_73 = _UPVALUE3_
  L23_73 = L23_73.name
  L21_71 = L21_71 .. L22_72 .. L23_73
  L20_70[L21_71] = ""
  L21_71 = reservedipTable
  L22_72 = "."
  L23_73 = _UPVALUE3_
  L23_73 = L23_73.ipMacBinding
  L21_71 = L21_71 .. L22_72 .. L23_73
  L20_70[L21_71] = "0"
  L21_71 = db
  L21_71 = L21_71.insert
  L22_72 = reservedipTable
  L23_73 = L20_70
  L21_71 = L21_71(L22_72, L23_73)
  L22_72 = _UPVALUE3_
  L22_72 = L22_72.ipAddress
  L23_73 = " = '"
  L22_72 = L22_72 .. L23_73 .. A1_51 .. "' and " .. _UPVALUE3_.macAddress .. " = '" .. A0_50 .. "'"
  L23_73 = db
  L23_73 = L23_73.getAttributeWhere
  L23_73 = L23_73(reservedipTable, L22_72, ROWID)
  if L21_71 == NIL then
    return _UPVALUE2_.FAILURE, L23_73
  end
  return _UPVALUE2_.SUCCESS, L23_73
end
function IpMacReservationDMZDelete(A0_74)
  if checkCookieExists(A0_74, reservedipTable, where) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if db.deleteRow(reservedipTable, ROWID, A0_74) == NIL then
    return _UPVALUE0_.FAILURE, A0_74
  end
  return _UPVALUE0_.SUCCESS, A0_74
end
function IpMacReservationDMZDeleteAll()
  local L0_75
  L0_75 = _UPVALUE0_
  L0_75 = L0_75.interfaceType
  L0_75 = L0_75 .. " = '" .. DMZ_NAME .. "'"
  if db.deleteRowWhere(reservedipTable, L0_75) == NIL then
    return _UPVALUE1_.FAILURE, cookie
  end
  return _UPVALUE1_.SUCCESS, cookie
end
