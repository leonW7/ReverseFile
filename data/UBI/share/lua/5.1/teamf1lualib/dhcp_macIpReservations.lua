local L0_0
L0_0 = module
L0_0("com.teamf1.core.dhcp.macipreservations", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/vlan_validation")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/dhcp_returnCodes")
L0_0 = require
L0_0("teamf1lualib/dhcp_reservedIpLAN")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.dhcp.reservediplan")
macipreservationsTable = "IPMACBinding"
reservedipTable = "DhcpfixedIpAddress"
;({}).macAddress = "SourceMACAddress"
;({}).ipAddress = "IPAddress"
;({}).hostName = "Name"
;({}).logStatus = "LogStatus"
;({}).MacAddr = "MacAddr"
;({}).associatingEnabled = "AssociatingEnabled"
;({}).dhcpFixedTblMacAddress = "MacAddr"
;({}).dhcpFixedTblIpAddress = "IpAddr"
ROWID = "_ROWID_"
ENABLE = "1"
DISABLE = "0"
IPV4_ADDRESS_FAMILY = "2"
LAN_NAME = "LAN"
function macAddressGet()
  local L0_1, L1_2
  L0_1 = firstCookieGet
  L1_2 = macipreservationsTable
  L0_1 = L0_1(L1_2)
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(macipreservationsTable, ROWID, L0_1, _UPVALUE0_.macAddress)
  if L1_2 == NIL then
    return _UPVALUE1_.FAILURE, L0_1
  end
  return _UPVALUE1_.SUCCESS, L0_1, L1_2
end
function macAddressGetNext(A0_3)
  local L1_4, L2_5, L3_6
  L1_4 = nextCookieGet
  L2_5 = A0_3
  L3_6 = macipreservationsTable
  L2_5 = L1_4(L2_5, L3_6)
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
  L3_6 = L3_6(macipreservationsTable, ROWID, L1_4, _UPVALUE1_.macAddress)
  if L3_6 == NIL then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L3_6
end
function macAddressSet(A0_7, A1_8)
  local L2_9
  L2_9 = checkCookieExists
  L2_9 = L2_9(A0_7, macipreservationsTable)
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
  if db.setAttribute(macipreservationsTable, ROWID, A0_7, _UPVALUE2_.macAddress, A1_8) == NIL then
    return _UPVALUE0_.FAILURE, A0_7
  end
  return _UPVALUE0_.SUCCESS, A0_7
end
function macAddressDelete(A0_10)
  if checkCookieExists(A0_10, macipreservationsTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if db.deleteRow(macipreservationsTable, ROWID, A0_10) == NIL then
    return _UPVALUE0_.FAILURE, A0_10
  end
  return _UPVALUE0_.SUCCESS, A0_10
end
function ipAddressGet()
  local L0_11, L1_12
  L0_11 = firstCookieGet
  L1_12 = macipreservationsTable
  L0_11 = L0_11(L1_12)
  L1_12 = db
  L1_12 = L1_12.getAttribute
  L1_12 = L1_12(macipreservationsTable, ROWID, L0_11, _UPVALUE0_.ipAddress)
  if L1_12 == NIL then
    return _UPVALUE1_.FAILURE, L0_11
  end
  return _UPVALUE1_.SUCCESS, L0_11, L1_12
end
function ipAddressGetNext(A0_13)
  local L1_14, L2_15, L3_16
  L1_14 = nextCookieGet
  L2_15 = A0_13
  L3_16 = macipreservationsTable
  L2_15 = L1_14(L2_15, L3_16)
  L3_16 = FALSE
  if L1_14 == L3_16 then
    L3_16 = NIL
    if L2_15 == L3_16 then
      L3_16 = _UPVALUE0_
      L3_16 = L3_16.NEXT_ROWID_INVALID
      return L3_16
    else
      L3_16 = _UPVALUE0_
      L3_16 = L3_16.INVALID_COOKIE
      return L3_16
    end
  end
  L3_16 = db
  L3_16 = L3_16.getAttribute
  L3_16 = L3_16(macipreservationsTable, ROWID, L1_14, _UPVALUE1_.ipAddress)
  if L3_16 == NIL then
    return _UPVALUE0_.FAILURE, L1_14
  end
  return _UPVALUE0_.SUCCESS, L1_14, L3_16
end
function ipAddressSet(A0_17, A1_18)
  local L2_19
  L2_19 = checkCookieExists
  L2_19 = L2_19(A0_17, macipreservationsTable)
  if L2_19 == FALSE then
    L2_19 = _UPVALUE0_
    L2_19 = L2_19.INVALID_COOKIE
    return L2_19
  end
  L2_19 = NIL
  if A1_18 == L2_19 then
    L2_19 = _UPVALUE0_
    L2_19 = L2_19.INVALID_ARGUMENT
    return L2_19
  end
  L2_19 = nil
  L2_19 = _UPVALUE1_.ipAddressCheck(IPV4_ADDRESS_FAMILY, A1_18)
  if L2_19 == _UPVALUE0_.ERROR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(macipreservationsTable, ROWID, A0_17, _UPVALUE2_.ipAddress, A1_18) == NIL then
    return _UPVALUE0_.FAILURE, A0_17
  end
  return _UPVALUE0_.SUCCESS, A0_17
end
function hostNameGet()
  local L0_20, L1_21
  L0_20 = firstCookieGet
  L1_21 = macipreservationsTable
  L0_20 = L0_20(L1_21)
  L1_21 = db
  L1_21 = L1_21.getAttribute
  L1_21 = L1_21(macipreservationsTable, ROWID, L0_20, _UPVALUE0_.hostName)
  if L1_21 == NIL then
    return _UPVALUE1_.FAILURE, L0_20
  end
  return _UPVALUE1_.SUCCESS, L0_20, L1_21
end
function hostNameGetNext(A0_22)
  local L1_23, L2_24, L3_25
  L1_23 = nextCookieGet
  L2_24 = A0_22
  L3_25 = macipreservationsTable
  L2_24 = L1_23(L2_24, L3_25)
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
  L3_25 = L3_25(macipreservationsTable, ROWID, L1_23, _UPVALUE1_.hostName)
  if L3_25 == NIL then
    return _UPVALUE0_.FAILURE, L1_23
  end
  return _UPVALUE0_.SUCCESS, L1_23, L3_25
end
function hostNameSet(A0_26, A1_27)
  if checkCookieExists(A0_26, macipreservationsTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if A1_27 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(macipreservationsTable, ROWID, A0_26, _UPVALUE1_.hostName, A1_27) == NIL then
    return _UPVALUE0_.FAILURE, A0_26
  end
  return _UPVALUE0_.SUCCESS, A0_26
end
function islogStatusEnabled()
  local L0_28, L1_29
  L0_28 = firstCookieGet
  L1_29 = macipreservationsTable
  L0_28 = L0_28(L1_29)
  L1_29 = db
  L1_29 = L1_29.getAttribute
  L1_29 = L1_29(macipreservationsTable, ROWID, L0_28, _UPVALUE0_.logStatus)
  if L1_29 == NIL then
    return _UPVALUE1_.FAILURE, L0_28
  end
  return _UPVALUE1_.SUCCESS, L0_28, L1_29
end
function islogStatusEnabledNext(A0_30)
  local L1_31, L2_32, L3_33
  L1_31 = nextCookieGet
  L2_32 = A0_30
  L3_33 = macipreservationsTable
  L2_32 = L1_31(L2_32, L3_33)
  L3_33 = FALSE
  if L1_31 == L3_33 then
    L3_33 = NIL
    if L2_32 == L3_33 then
      L3_33 = _UPVALUE0_
      L3_33 = L3_33.NEXT_ROWID_INVALID
      return L3_33
    else
      L3_33 = _UPVALUE0_
      L3_33 = L3_33.INVALID_COOKIE
      return L3_33
    end
  end
  L3_33 = db
  L3_33 = L3_33.getAttribute
  L3_33 = L3_33(macipreservationsTable, ROWID, L1_31, _UPVALUE1_.logStatus)
  if L3_33 == NIL then
    return _UPVALUE0_.FAILURE, L1_31
  end
  return _UPVALUE0_.SUCCESS, L1_31, L3_33
end
function logStatusEnable(A0_34)
  if checkCookieExists(A0_34, macipreservationsTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if db.setAttribute(macipreservationsTable, ROWID, A0_34, _UPVALUE1_.logStatus, ENABLE) == NIL then
    return _UPVALUE0_.FAILURE, A0_34
  end
  return _UPVALUE0_.SUCCESS, A0_34
end
function logStatusDisable(A0_35)
  if checkCookieExists(A0_35, macipreservationsTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if db.setAttribute(macipreservationsTable, ROWID, A0_35, _UPVALUE1_.logStatus, DISABLE) == NIL then
    return _UPVALUE0_.FAILURE, A0_35
  end
  return _UPVALUE0_.SUCCESS, A0_35
end
function macIpBindingGet(A0_36)
  if db.getRow(macipreservationsTable, ROWID, A0_36) == NIL then
    return _UPVALUE0_.FAILURE, A0_36
  end
  return _UPVALUE0_.SUCCESS, A0_36, db.getRow(macipreservationsTable, ROWID, A0_36)[macipreservationsTable .. "." .. _UPVALUE1_.macAddress], db.getRow(macipreservationsTable, ROWID, A0_36)[macipreservationsTable .. "." .. _UPVALUE1_.ipAddress], db.getRow(macipreservationsTable, ROWID, A0_36)[macipreservationsTable .. "." .. _UPVALUE1_.hostName], db.getRow(macipreservationsTable, ROWID, A0_36)[macipreservationsTable .. "." .. _UPVALUE1_.logStatus], db.getRow(macipreservationsTable, ROWID, A0_36)[macipreservationsTable .. "." .. _UPVALUE1_.associatingEnabled]
end
function macIpBindingGetNext(A0_37)
  local L1_38
  L1_38 = nextCookieGet
  L1_38 = L1_38(A0_37, macipreservationsTable)
  if L1_38 == FALSE then
    if L1_38(A0_37, macipreservationsTable) == NIL then
      return _UPVALUE0_.NEXT_ROWID_INVALID
    else
      return _UPVALUE0_.INVALID_COOKIE
    end
  end
  if db.getRow(macipreservationsTable, ROWID, L1_38) == NIL then
    return _UPVALUE0_.FAILURE, L1_38
  end
  return _UPVALUE0_.SUCCESS, L1_38, db.getRow(macipreservationsTable, ROWID, L1_38)[macipreservationsTable .. "." .. _UPVALUE1_.macAddress], db.getRow(macipreservationsTable, ROWID, L1_38)[macipreservationsTable .. "." .. _UPVALUE1_.ipAddress], db.getRow(macipreservationsTable, ROWID, L1_38)[macipreservationsTable .. "." .. _UPVALUE1_.hostName], db.getRow(macipreservationsTable, ROWID, L1_38)[macipreservationsTable .. "." .. _UPVALUE1_.logStatus], db.getRow(macipreservationsTable, ROWID, L1_38)[macipreservationsTable .. "." .. _UPVALUE1_.associatingEnabled]
end
function macIpBindingGetAll()
  local L0_39
  L0_39 = db
  L0_39 = L0_39.getTable
  L0_39 = L0_39(macipreservationsTable, false)
  if L0_39 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_39
end
function macIpBindingSet(A0_40, A1_41, A2_42, A3_43, A4_44, A5_45)
  local L6_46, L7_47, L8_48, L9_49, L10_50, L11_51, L12_52, L13_53, L14_54, L15_55, L16_56, L17_57
  L7_47 = checkCookieExists
  L8_48 = A0_40
  L9_49 = macipreservationsTable
  L7_47 = L7_47(L8_48, L9_49)
  L8_48 = FALSE
  if L7_47 == L8_48 then
    L7_47 = _UPVALUE0_
    L7_47 = L7_47.INVALID_COOKIE
    return L7_47
  end
  L7_47 = NIL
  if A1_41 == L7_47 then
    L7_47 = _UPVALUE1_
    L7_47 = L7_47.COMP_DHCP_IPMACBINDING_MACADDRESS_NIL
    return L7_47
  end
  L7_47 = _UPVALUE2_
  L7_47 = L7_47.isMacAddress
  L8_48 = A1_41
  L7_47 = L7_47(L8_48)
  L6_46 = L7_47
  L7_47 = _UPVALUE0_
  L7_47 = L7_47.ERROR
  if L6_46 == L7_47 then
    L7_47 = _UPVALUE1_
    L7_47 = L7_47.COMP_DHCP_IPMACBINDING_MACADDRESS_INVALID
    return L7_47
  end
  L7_47 = NIL
  if A2_42 == L7_47 then
    L7_47 = _UPVALUE1_
    L7_47 = L7_47.COMP_DHCP_IPMACBINDING_IPADDRESS_NIL
    return L7_47
  end
  L7_47 = _UPVALUE2_
  L7_47 = L7_47.ipAddressCheck
  L8_48 = IPV4_ADDRESS_FAMILY
  L9_49 = A2_42
  L7_47 = L7_47(L8_48, L9_49)
  L6_46 = L7_47
  L7_47 = _UPVALUE0_
  L7_47 = L7_47.ERROR
  if L6_46 == L7_47 then
    L7_47 = _UPVALUE1_
    L7_47 = L7_47.COMP_DHCP_IPMACBINDING_IPADDRESS_INVALID
    return L7_47
  end
  L7_47 = NIL
  if A3_43 == L7_47 then
    L7_47 = _UPVALUE1_
    L7_47 = L7_47.COMP_DHCP_IPMACBINDING_HOSTNAME_NIL
    return L7_47
  end
  L7_47 = NIL
  if A4_44 == L7_47 then
    L7_47 = _UPVALUE1_
    L7_47 = L7_47.COMP_DHCP_IPMACBINDING_LOGSTATUS_NIL
    return L7_47
  end
  L7_47 = _UPVALUE2_
  L7_47 = L7_47.isBoolean
  L8_48 = A4_44
  L7_47 = L7_47(L8_48)
  L6_46 = L7_47
  L7_47 = _UPVALUE0_
  L7_47 = L7_47.ERROR
  if L6_46 == L7_47 then
    L7_47 = _UPVALUE1_
    L7_47 = L7_47.COMP_DHCP_IPMACBINDING_LOGSTATUS_INVALID
    return L7_47
  end
  L7_47 = NIL
  if A5_45 == L7_47 then
    L7_47 = _UPVALUE1_
    L7_47 = L7_47.COMP_DHCP_IPMACBINDING_ASSOCSTATUS_NIL
    return L7_47
  end
  L7_47 = _UPVALUE2_
  L7_47 = L7_47.isBoolean
  L8_48 = A5_45
  L7_47 = L7_47(L8_48)
  L6_46 = L7_47
  L7_47 = _UPVALUE0_
  L7_47 = L7_47.ERROR
  if L6_46 == L7_47 then
    L7_47 = _UPVALUE1_
    L7_47 = L7_47.COMP_DHCP_IPMACBINDING_ASSOCSTATUS_INVALID
    return L7_47
  end
  L7_47 = nil
  L8_48 = db
  L8_48 = L8_48.getRow
  L9_49 = macipreservationsTable
  L10_50 = ROWID
  L11_51 = A0_40
  L8_48 = L8_48(L9_49, L10_50, L11_51)
  L9_49 = _UPVALUE3_
  L9_49 = L9_49.dhcpFixedTblMacAddress
  L10_50 = " = '"
  L11_51 = L8_48["IPMACBinding.SourceMACAddress"]
  L12_52 = "' AND "
  L13_53 = _UPVALUE3_
  L13_53 = L13_53.dhcpFixedTblIpAddress
  L14_54 = " = '"
  L15_55 = L8_48["IPMACBinding.IPAddress"]
  L16_56 = "'"
  L9_49 = L9_49 .. L10_50 .. L11_51 .. L12_52 .. L13_53 .. L14_54 .. L15_55 .. L16_56
  L10_50 = db
  L10_50 = L10_50.existsRowWhere
  L11_51 = reservedipTable
  L12_52 = L9_49
  L10_50 = L10_50(L11_51, L12_52)
  if L10_50 then
    L11_51 = db
    L11_51 = L11_51.getAttribute
    L12_52 = reservedipTable
    L13_53 = ROWID
    L14_54 = L10_50
    L15_55 = _UPVALUE3_
    L15_55 = L15_55.associatingEnabled
    L11_51 = L11_51(L12_52, L13_53, L14_54, L15_55)
    if L11_51 == "1" then
      L12_52 = _UPVALUE3_
      L12_52 = L12_52.dhcpFixedTblMacAddress
      L13_53 = " = '"
      L14_54 = A1_41
      L15_55 = "' AND "
      L16_56 = _UPVALUE3_
      L16_56 = L16_56.dhcpFixedTblIpAddress
      L17_57 = " = '"
      L12_52 = L12_52 .. L13_53 .. L14_54 .. L15_55 .. L16_56 .. L17_57 .. A2_42 .. "'"
      L13_53 = db
      L13_53 = L13_53.existsRowWhere
      L14_54 = reservedipTable
      L15_55 = L12_52
      L13_53 = L13_53(L14_54, L15_55)
      if L13_53 == false then
        L14_54 = db
        L14_54 = L14_54.setAttribute
        L15_55 = reservedipTable
        L16_56 = ROWID
        L17_57 = L10_50
        L15_55 = L14_54(L15_55, L16_56, L17_57, _UPVALUE3_.associatingEnabled, "0")
      end
    end
  end
  L12_52 = A1_41
  L11_51 = A1_41.lower
  L13_53 = A1_41
  L11_51 = L11_51(L12_52, L13_53)
  L12_52 = "lower("
  L13_53 = macipreservationsTable
  L14_54 = "."
  L15_55 = _UPVALUE3_
  L15_55 = L15_55.macAddress
  L16_56 = ")='"
  L17_57 = L11_51
  L12_52 = L12_52 .. L13_53 .. L14_54 .. L15_55 .. L16_56 .. L17_57 .. "' and " .. ROWID .. " != '" .. A0_40 .. "'"
  L13_53 = db
  L13_53 = L13_53.existsRowWhere
  L14_54 = macipreservationsTable
  L15_55 = L12_52
  L13_53 = L13_53(L14_54, L15_55)
  if L13_53 then
    L14_54 = _UPVALUE1_
    L14_54 = L14_54.COMP_DHCP_IPMACBINDING_MACADDRESS_EXISTS
    return L14_54
  end
  L14_54 = _UPVALUE3_
  L14_54 = L14_54.ipAddress
  L15_55 = " = '"
  L16_56 = A2_42
  L17_57 = "' and "
  L12_52 = L14_54 .. L15_55 .. L16_56 .. L17_57 .. ROWID .. " != '" .. A0_40 .. "'"
  L14_54 = db
  L14_54 = L14_54.existsRowWhere
  L15_55 = macipreservationsTable
  L16_56 = L12_52
  L14_54 = L14_54(L15_55, L16_56)
  if L14_54 then
    L15_55 = _UPVALUE1_
    L15_55 = L15_55.COMP_DHCP_IPMACBINDING_IPADDRESS_EXISTS
    return L15_55
  end
  L15_55 = _UPVALUE3_
  L15_55 = L15_55.dhcpFixedTblMacAddress
  L16_56 = " = '"
  L17_57 = A1_41
  L15_55 = L15_55 .. L16_56 .. L17_57 .. "' AND " .. _UPVALUE3_.dhcpFixedTblIpAddress .. " = '" .. A2_42 .. "'"
  L16_56 = db
  L16_56 = L16_56.existsRowWhere
  L17_57 = reservedipTable
  L16_56 = L16_56(L17_57, L15_55)
  if L16_56 then
    L17_57 = db
    L17_57 = L17_57.setAttributeWhere
    L17_57 = L17_57(reservedipTable, L15_55, _UPVALUE3_.associatingEnabled, "1")
    A5_45 = "1"
  end
  L17_57 = {}
  L17_57[macipreservationsTable .. "." .. _UPVALUE3_.macAddress] = A1_41
  L17_57[macipreservationsTable .. "." .. _UPVALUE3_.ipAddress] = A2_42
  L17_57[macipreservationsTable .. "." .. _UPVALUE3_.hostName] = A3_43
  L17_57[macipreservationsTable .. "." .. _UPVALUE3_.logStatus] = A4_44
  L17_57[macipreservationsTable .. "." .. _UPVALUE3_.associatingEnabled] = A5_45
  if db.update(macipreservationsTable, L17_57, A0_40) == NIL then
    return _UPVALUE0_.FAILURE, A0_40
  end
  return _UPVALUE0_.SUCCESS, A0_40
end
function macIpBindingCreate(A0_58, A1_59, A2_60, A3_61, A4_62)
  local L5_63, L6_64, L7_65, L8_66, L9_67, L10_68, L11_69, L12_70, L13_71, L14_72, L15_73
  L6_64 = db
  L6_64 = L6_64.getTable
  L7_65 = macipreservationsTable
  L6_64 = L6_64(L7_65)
  L7_65 = #L6_64
  L8_66 = RESERVED_IP_MAXLIMIT
  if L7_65 >= L8_66 then
    L7_65 = _UPVALUE0_
    L7_65 = L7_65.COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_MAX_REACHED
    return L7_65
  end
  L7_65 = NIL
  if A0_58 == L7_65 then
    L7_65 = _UPVALUE0_
    L7_65 = L7_65.COMP_DHCP_IPMACBINDING_MACADDRESS_NIL
    return L7_65
  end
  L7_65 = db
  L7_65 = L7_65.existsRow
  L8_66 = macipreservationsTable
  L9_67 = _UPVALUE1_
  L9_67 = L9_67.hostName
  L10_68 = A2_60
  L7_65 = L7_65(L8_66, L9_67, L10_68)
  L5_63 = L7_65
  if L5_63 then
    L7_65 = _UPVALUE0_
    L7_65 = L7_65.COMP_DHCP_IPMACBINDING_NAME_EXISTS
    return L7_65
  end
  L7_65 = _UPVALUE2_
  L7_65 = L7_65.isMacAddress
  L8_66 = A0_58
  L7_65 = L7_65(L8_66)
  L5_63 = L7_65
  L7_65 = _UPVALUE3_
  L7_65 = L7_65.ERROR
  if L5_63 == L7_65 then
    L7_65 = _UPVALUE0_
    L7_65 = L7_65.COMP_DHCP_IPMACBINDING_MACADDRESS_INVALID
    return L7_65
  end
  L7_65 = NIL
  if A1_59 == L7_65 then
    L7_65 = _UPVALUE0_
    L7_65 = L7_65.COMP_DHCP_IPMACBINDING_IPADDRESS_NIL
    return L7_65
  end
  L7_65 = _UPVALUE2_
  L7_65 = L7_65.ipAddressCheck
  L8_66 = IPV4_ADDRESS_FAMILY
  L9_67 = A1_59
  L7_65 = L7_65(L8_66, L9_67)
  L5_63 = L7_65
  L7_65 = _UPVALUE3_
  L7_65 = L7_65.ERROR
  if L5_63 == L7_65 then
    L7_65 = _UPVALUE0_
    L7_65 = L7_65.COMP_DHCP_IPMACBINDING_IPADDRESS_INVALID
    return L7_65
  end
  L7_65 = NIL
  if A2_60 == L7_65 then
    L7_65 = _UPVALUE0_
    L7_65 = L7_65.COMP_DHCP_IPMACBINDING_HOSTNAME_NIL
    return L7_65
  end
  L7_65 = NIL
  if A3_61 == L7_65 then
    L7_65 = _UPVALUE0_
    L7_65 = L7_65.COMP_DHCP_IPMACBINDING_LOGSTATUS_NIL
    return L7_65
  end
  L7_65 = _UPVALUE2_
  L7_65 = L7_65.isBoolean
  L8_66 = A3_61
  L7_65 = L7_65(L8_66)
  L5_63 = L7_65
  L7_65 = _UPVALUE3_
  L7_65 = L7_65.ERROR
  if L5_63 == L7_65 then
    L7_65 = _UPVALUE0_
    L7_65 = L7_65.COMP_DHCP_IPMACBINDING_LOGSTATUS_INVALID
    return L7_65
  end
  L7_65 = NIL
  if A4_62 == L7_65 then
    L7_65 = _UPVALUE0_
    L7_65 = L7_65.COMP_DHCP_IPMACBINDING_ASSOCSTATUS_NIL
    return L7_65
  end
  L7_65 = _UPVALUE2_
  L7_65 = L7_65.isBoolean
  L8_66 = A4_62
  L7_65 = L7_65(L8_66)
  L5_63 = L7_65
  L7_65 = _UPVALUE3_
  L7_65 = L7_65.ERROR
  if L5_63 == L7_65 then
    L7_65 = _UPVALUE0_
    L7_65 = L7_65.COMP_DHCP_IPMACBINDING_ASSOCSTATUS_INVALID
    return L7_65
  end
  L8_66 = A0_58
  L7_65 = A0_58.lower
  L9_67 = A0_58
  L7_65 = L7_65(L8_66, L9_67)
  L8_66 = "lower("
  L9_67 = macipreservationsTable
  L10_68 = "."
  L11_69 = _UPVALUE1_
  L11_69 = L11_69.macAddress
  L12_70 = ")='"
  L13_71 = L7_65
  L14_72 = "'"
  L8_66 = L8_66 .. L9_67 .. L10_68 .. L11_69 .. L12_70 .. L13_71 .. L14_72
  L9_67 = db
  L9_67 = L9_67.existsRowWhere
  L10_68 = macipreservationsTable
  L11_69 = L8_66
  L9_67 = L9_67(L10_68, L11_69)
  if L9_67 then
    L10_68 = _UPVALUE0_
    L10_68 = L10_68.COMP_DHCP_IPMACBINDING_MACADDRESS_EXISTS
    return L10_68
  end
  L10_68 = db
  L10_68 = L10_68.existsRow
  L11_69 = macipreservationsTable
  L12_70 = _UPVALUE1_
  L12_70 = L12_70.ipAddress
  L13_71 = A1_59
  L10_68 = L10_68(L11_69, L12_70, L13_71)
  if L10_68 then
    L11_69 = _UPVALUE0_
    L11_69 = L11_69.COMP_DHCP_IPMACBINDING_IPADDRESS_EXISTS
    return L11_69
  end
  L11_69 = _UPVALUE1_
  L11_69 = L11_69.dhcpFixedTblMacAddress
  L12_70 = " = '"
  L13_71 = A0_58
  L14_72 = "' AND "
  L15_73 = _UPVALUE1_
  L15_73 = L15_73.dhcpFixedTblIpAddress
  L11_69 = L11_69 .. L12_70 .. L13_71 .. L14_72 .. L15_73 .. " = '" .. A1_59 .. "'"
  L12_70 = db
  L12_70 = L12_70.existsRowWhere
  L13_71 = reservedipTable
  L14_72 = L11_69
  L12_70 = L12_70(L13_71, L14_72)
  if L12_70 then
    L13_71 = db
    L13_71 = L13_71.setAttributeWhere
    L14_72 = reservedipTable
    L15_73 = L11_69
    L14_72 = L13_71(L14_72, L15_73, _UPVALUE1_.associatingEnabled, "1")
    A4_62 = "1"
  end
  L13_71 = {}
  L14_72 = macipreservationsTable
  L15_73 = "."
  L14_72 = L14_72 .. L15_73 .. _UPVALUE1_.macAddress
  L13_71[L14_72] = A0_58
  L14_72 = macipreservationsTable
  L15_73 = "."
  L14_72 = L14_72 .. L15_73 .. _UPVALUE1_.ipAddress
  L13_71[L14_72] = A1_59
  L14_72 = macipreservationsTable
  L15_73 = "."
  L14_72 = L14_72 .. L15_73 .. _UPVALUE1_.hostName
  L13_71[L14_72] = A2_60
  L14_72 = macipreservationsTable
  L15_73 = "."
  L14_72 = L14_72 .. L15_73 .. _UPVALUE1_.logStatus
  L13_71[L14_72] = A3_61
  L14_72 = macipreservationsTable
  L15_73 = "."
  L14_72 = L14_72 .. L15_73 .. _UPVALUE1_.associatingEnabled
  L13_71[L14_72] = A4_62
  L14_72 = db
  L14_72 = L14_72.insert
  L15_73 = macipreservationsTable
  L14_72 = L14_72(L15_73, L13_71)
  L15_73 = db
  L15_73 = L15_73.getAttribute
  L15_73 = L15_73(macipreservationsTable, _UPVALUE1_.hostName, A2_60, ROWID)
  if L14_72 == NIL then
    return _UPVALUE3_.FAILURE, L15_73
  end
  return _UPVALUE3_.SUCCESS, L15_73
end
function macIpBindingDelete(A0_74)
  local L1_75, L2_76, L3_77
  L1_75 = checkCookieExists
  L2_76 = A0_74
  L3_77 = macipreservationsTable
  L1_75 = L1_75(L2_76, L3_77)
  L2_76 = FALSE
  if L1_75 == L2_76 then
    L1_75 = _UPVALUE0_
    L1_75 = L1_75.INVALID_COOKIE
    return L1_75
  end
  L1_75 = db
  L1_75 = L1_75.getAttribute
  L2_76 = macipreservationsTable
  L3_77 = ROWID
  L1_75 = L1_75(L2_76, L3_77, A0_74, _UPVALUE1_.macAddress)
  L2_76 = db
  L2_76 = L2_76.getAttribute
  L3_77 = macipreservationsTable
  L2_76 = L2_76(L3_77, ROWID, A0_74, _UPVALUE1_.ipAddress)
  L3_77 = _UPVALUE1_
  L3_77 = L3_77.dhcpFixedTblMacAddress
  L3_77 = L3_77 .. " = '" .. L1_75 .. "' AND " .. _UPVALUE1_.dhcpFixedTblIpAddress .. " = '" .. L2_76 .. "'"
  if db.existsRowWhere(reservedipTable, L3_77) then
  end
  if db.deleteRow(macipreservationsTable, ROWID, A0_74) == NIL then
    return _UPVALUE0_.FAILURE, A0_74
  end
  return _UPVALUE0_.SUCCESS, A0_74
end
function macIpBindingDeleteAll()
  if db.deleteAllRows(macipreservationsTable) == NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, cookie
end
