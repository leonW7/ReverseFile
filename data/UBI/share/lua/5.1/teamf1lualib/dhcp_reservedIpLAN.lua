local L0_0
L0_0 = module
L0_0("com.teamf1.core.dhcp.reservediplan", package.seeall)
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
L0_0("teamf1lualib/lan_addressing")
L0_0 = require
L0_0("teamf1lualib/dhcp_returnCodes")
L0_0 = require
L0_0("teamf1lualib/vlan_vlan")
L0_0 = require
L0_0("validationsLuaLib")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.vlan.vlan")
reservedipTable = "DhcpfixedIpAddress"
ipMacBindingTable = "IPMACBinding"
;({}).macAddress = "MacAddr"
;({}).ipAddress = "IpAddr"
;({}).interfaceType = "LogicalIfName"
;({}).name = "Name"
;({}).ipMacBinding = "AssociatingEnabled"
;({}).sourceMACAddress = "SourceMACAddress"
;({}).ipMacIPAddress = "IPAddress"
;({}).logStatus = "LogStatus"
LAN_NAME = "LAN"
DMZ_NAME = "DMZ"
ROWID = "_ROWID_"
where = ({}).interfaceType .. " = '" .. LAN_NAME .. "'"
WAN2_NAME = "WAN2"
WAN1_NAME = "WAN1"
subnetTable = "ifStatic"
;({}).subnet = {}
;({}).subnet.ipAddress = "StaticIp"
;({}).subnet.subnetMask = "NetMask"
;({}).subnet.LogicalIfName = "LogicalIfName"
;({}).subnet.AddressFamily = "AddressFamily"
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
function IpMacReservationLANGet(A0_25)
  local L1_26, L2_27, L3_28, L4_29, L5_30, L6_31
  L1_26 = db
  L1_26 = L1_26.getRow
  L2_27 = reservedipTable
  L3_28 = ROWID
  L4_29 = A0_25
  L1_26 = L1_26(L2_27, L3_28, L4_29)
  L2_27 = "0"
  L3_28 = NIL
  if L1_26 == L3_28 then
    L3_28 = _UPVALUE0_
    L3_28 = L3_28.FAILURE
    L4_29 = A0_25
    return L3_28, L4_29
  end
  L3_28 = reservedipTable
  L4_29 = "."
  L5_30 = _UPVALUE1_
  L5_30 = L5_30.macAddress
  L3_28 = L3_28 .. L4_29 .. L5_30
  L3_28 = L1_26[L3_28]
  L4_29 = reservedipTable
  L5_30 = "."
  L6_31 = _UPVALUE1_
  L6_31 = L6_31.ipAddress
  L4_29 = L4_29 .. L5_30 .. L6_31
  L4_29 = L1_26[L4_29]
  L5_30 = _UPVALUE1_
  L5_30 = L5_30.sourceMACAddress
  L6_31 = " = '"
  L5_30 = L5_30 .. L6_31 .. L3_28 .. "' AND " .. _UPVALUE1_.ipMacIPAddress .. " = '" .. L4_29 .. "'"
  L6_31 = db
  L6_31 = L6_31.existsRowWhere
  L6_31 = L6_31(ipMacBindingTable, L5_30)
  if L6_31 then
    L2_27 = db.getAttribute(ipMacBindingTable, ROWID, L6_31, _UPVALUE1_.logStatus)
  end
  return _UPVALUE0_.SUCCESS, A0_25, L1_26[reservedipTable .. "." .. _UPVALUE1_.macAddress], L1_26[reservedipTable .. "." .. _UPVALUE1_.ipAddress], L1_26[reservedipTable .. "." .. _UPVALUE1_.interfaceType], L1_26[reservedipTable .. "." .. _UPVALUE1_.name], L1_26[reservedipTable .. "." .. _UPVALUE1_.ipMacBinding], L2_27
end
function IpMacReservationLANGetNext(A0_32)
  local L1_33
  L1_33 = nextCookieGet
  L1_33 = L1_33(A0_32, reservedipTable, where)
  if L1_33 == FALSE then
    if L1_33(A0_32, reservedipTable, where) == NIL then
      return _UPVALUE0_.NEXT_ROWID_INVALID
    else
      return _UPVALUE0_.INVALID_COOKIE
    end
  end
  if db.getRow(reservedipTable, ROWID, L1_33) == NIL then
    return _UPVALUE0_.FAILURE, A0_32
  end
  return _UPVALUE0_.SUCCESS, A0_32, db.getRow(reservedipTable, ROWID, L1_33)[reservedipTable .. "." .. _UPVALUE1_.macAddress], db.getRow(reservedipTable, ROWID, L1_33)[reservedipTable .. "." .. _UPVALUE1_.ipAddress], db.getRow(reservedipTable, ROWID, L1_33)[reservedipTable .. "." .. _UPVALUE1_.interfaceType], db.getRow(reservedipTable, ROWID, L1_33)[reservedipTable .. "." .. _UPVALUE1_.name], db.getRow(reservedipTable, ROWID, L1_33)[reservedipTable .. "." .. _UPVALUE1_.ipMacBinding]
end
function IpMacReservationLANGetAll()
  local L0_34, L1_35, L2_36, L3_37
  L0_34 = "0"
  L1_35 = _UPVALUE0_
  L1_35 = L1_35.interfaceType
  L2_36 = " LIKE '"
  L3_37 = LAN_NAME
  L1_35 = L1_35 .. L2_36 .. L3_37 .. "%'"
  L2_36 = db
  L2_36 = L2_36.getRowsWhere
  L3_37 = reservedipTable
  L2_36 = L2_36(L3_37, L1_35)
  L3_37 = NIL
  if L2_36 == L3_37 then
    L3_37 = _UPVALUE1_
    L3_37 = L3_37.FAILURE
    return L3_37
  end
  L3_37 = tonumber
  L3_37 = L3_37(L2_36[reservedipTable .. "." .. _UPVALUE0_.ipMacBinding])
  if L3_37 == 1 then
    L3_37 = reservedipTable
    L3_37 = L3_37 .. "." .. _UPVALUE0_.name
    L3_37 = L2_36[L3_37]
    if db.getRowWhere(ipMacBindingTable, "Name='" .. L3_37 .. "'") == NIL then
      return _UPVALUE1_.FAILURE
    else
      L0_34 = db.getRowWhere(ipMacBindingTable, "Name='" .. L3_37 .. "'")[ipMacBindingTable .. "." .. _UPVALUE0_.logStatus]
    end
  end
  L3_37 = _UPVALUE1_
  L3_37 = L3_37.SUCCESS
  return L3_37, L2_36, L0_34
end
function IpMacReservationLANSet(A0_38, A1_39, A2_40, A3_41, A4_42, A5_43)
  local L6_44, L7_45, L8_46, L9_47, L10_48, L11_49, L12_50, L13_51, L14_52, L15_53, L16_54, L17_55, L18_56, L19_57, L20_58, L21_59, L22_60, L23_61, L24_62, L25_63, L26_64, L27_65, L28_66, L29_67, L30_68, L31_69, L32_70, L33_71, L34_72
  L15_53 = db
  L15_53 = L15_53.getAttribute
  L16_54 = reservedipTable
  L17_55 = ROWID
  L18_56 = A0_38
  L19_57 = _UPVALUE0_
  L19_57 = L19_57.ipAddress
  L15_53 = L15_53(L16_54, L17_55, L18_56, L19_57)
  L11_49 = L15_53
  L15_53 = db
  L15_53 = L15_53.getAttribute
  L16_54 = reservedipTable
  L17_55 = ROWID
  L18_56 = A0_38
  L19_57 = _UPVALUE0_
  L19_57 = L19_57.macAddress
  L15_53 = L15_53(L16_54, L17_55, L18_56, L19_57)
  L12_50 = L15_53
  L15_53 = _UPVALUE0_
  L15_53 = L15_53.sourceMACAddress
  L16_54 = " = '"
  L17_55 = L12_50
  L18_56 = "' AND "
  L19_57 = _UPVALUE0_
  L19_57 = L19_57.ipMacIPAddress
  L20_58 = " = '"
  L21_59 = L11_49
  L22_60 = "'"
  L14_52 = L15_53 .. L16_54 .. L17_55 .. L18_56 .. L19_57 .. L20_58 .. L21_59 .. L22_60
  L15_53 = db
  L15_53 = L15_53.existsRowWhere
  L16_54 = ipMacBindingTable
  L17_55 = L14_52
  L15_53 = L15_53(L16_54, L17_55)
  isIPMacBindingRow = L15_53
  if A4_42 == "1" then
    L15_53 = isIPMacBindingRow
    if L15_53 == false then
      L15_53 = db
      L15_53 = L15_53.getTable
      L16_54 = ipMacBindingTable
      L15_53 = L15_53(L16_54)
      count = L15_53
      L15_53 = count
      L15_53 = #L15_53
      L16_54 = RESERVED_IP_MAXLIMIT
      if L15_53 >= L16_54 then
        L15_53 = _UPVALUE1_
        L15_53 = L15_53.COMP_DHCP_IPMACBINDING_LAN_IPADDRESS_MAX_REACHED
        return L15_53
      end
    end
  end
  L15_53 = _UPVALUE2_
  L15_53 = L15_53.NIL
  if A0_38 ~= L15_53 then
    L15_53 = tonumber
    L16_54 = A0_38
    L15_53 = L15_53(L16_54)
    L16_54 = _UPVALUE2_
    L16_54 = L16_54.NIL
  elseif L15_53 == L16_54 then
    L15_53 = _UPVALUE2_
    L15_53 = L15_53.INVALID_ARGUMENT
    return L15_53
  end
  L15_53 = db
  L15_53 = L15_53.existsRow
  L16_54 = reservedipTable
  L17_55 = ROWID
  L18_56 = A0_38
  L15_53 = L15_53(L16_54, L17_55, L18_56)
  L16_54 = _UPVALUE2_
  L16_54 = L16_54.FALSE
  if L15_53 == L16_54 then
    L15_53 = _UPVALUE2_
    L15_53 = L15_53.INVALID_ARGUMENT
    return L15_53
  end
  L15_53 = NIL
  if A1_39 == L15_53 then
    L15_53 = _UPVALUE1_
    L15_53 = L15_53.COMP_DHCP_RESERVEDIP_LAN_MACADDRESS_NIL
    return L15_53
  end
  L15_53 = _UPVALUE0_
  L15_53 = L15_53.sourceMACAddress
  L16_54 = " = '"
  L17_55 = A1_39
  L18_56 = "' AND "
  L19_57 = _UPVALUE0_
  L19_57 = L19_57.ipMacIPAddress
  L20_58 = " = '"
  L21_59 = A2_40
  L22_60 = "'"
  L15_53 = L15_53 .. L16_54 .. L17_55 .. L18_56 .. L19_57 .. L20_58 .. L21_59 .. L22_60
  L16_54 = db
  L16_54 = L16_54.existsRowWhere
  L17_55 = ipMacBindingTable
  L18_56 = L15_53
  L16_54 = L16_54(L17_55, L18_56)
  L18_56 = A1_39
  L17_55 = A1_39.lower
  L19_57 = A1_39
  L17_55 = L17_55(L18_56, L19_57)
  L18_56 = where
  L19_57 = " and lower("
  L20_58 = reservedipTable
  L21_59 = "."
  L22_60 = _UPVALUE0_
  L22_60 = L22_60.macAddress
  L23_61 = ")='"
  L24_62 = L17_55
  L25_63 = "' and "
  L26_64 = ROWID
  L27_65 = "!='"
  L18_56 = L18_56 .. L19_57 .. L20_58 .. L21_59 .. L22_60 .. L23_61 .. L24_62 .. L25_63 .. L26_64 .. L27_65 .. L28_66 .. L29_67
  L19_57 = db
  L19_57 = L19_57.existsRowWhere
  L20_58 = reservedipTable
  L21_59 = L18_56
  L19_57 = L19_57(L20_58, L21_59)
  if L19_57 then
    L20_58 = _UPVALUE1_
    L20_58 = L20_58.COMP_DHCP_RESERVEDIP_LAN_MACADDRESS_EXISTS
    return L20_58
  end
  L20_58 = _UPVALUE3_
  L20_58 = L20_58.isMacAddress
  L21_59 = A1_39
  L20_58 = L20_58(L21_59)
  L10_48 = L20_58
  L20_58 = _UPVALUE2_
  L20_58 = L20_58.ERROR
  if L10_48 == L20_58 then
    L20_58 = _UPVALUE1_
    L20_58 = L20_58.COMP_DHCP_RESERVEDIP_LAN_MACADDRESS_INVALID
    return L20_58
  end
  L20_58 = NIL
  if A2_40 == L20_58 then
    L20_58 = _UPVALUE1_
    L20_58 = L20_58.COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_NIL
    return L20_58
  end
  L20_58 = _UPVALUE0_
  L20_58 = L20_58.ipAddress
  L21_59 = " = '"
  L22_60 = A2_40
  L23_61 = "' and "
  L24_62 = ROWID
  L25_63 = "!='"
  L26_64 = A0_38
  L27_65 = "'"
  L20_58 = L20_58 .. L21_59 .. L22_60 .. L23_61 .. L24_62 .. L25_63 .. L26_64 .. L27_65
  L21_59 = db
  L21_59 = L21_59.existsRowWhere
  L22_60 = reservedipTable
  L23_61 = L20_58
  L21_59 = L21_59(L22_60, L23_61)
  if L21_59 then
    L22_60 = _UPVALUE1_
    L22_60 = L22_60.COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_EXISTS
    return L22_60
  end
  L22_60 = util
  L22_60 = L22_60.split
  L23_61 = A2_40
  L24_62 = "."
  L22_60 = L22_60(L23_61, L24_62)
  L6_44 = L22_60
  if L6_44 ~= nil then
    L22_60 = tonumber
    L23_61 = L6_44[1]
    L22_60 = L22_60(L23_61)
    if L22_60 ~= 224 then
      L22_60 = tonumber
      L23_61 = L6_44[1]
      L22_60 = L22_60(L23_61)
      if not (L22_60 > 224) then
        L22_60 = tonumber
        L23_61 = L6_44[1]
        L22_60 = L22_60(L23_61)
      end
    end
  elseif L22_60 == 0 or A2_40 == "0.0.0.0" then
    L22_60 = _UPVALUE1_
    L22_60 = L22_60.COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_INVALID
    return L22_60
  end
  L22_60 = validationsLuaLib
  L22_60 = L22_60.ipv4AddrAsciiToNum
  L23_61 = A2_40
  L23_61 = L22_60(L23_61)
  L7_45 = L23_61
  L10_48 = L22_60
  if L10_48 == -1 then
    L22_60 = _UPVALUE1_
    L22_60 = L22_60.COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_INVALID
    return L22_60
  end
  if A4_42 == "1" and L16_54 == false then
    L22_60 = db
    L22_60 = L22_60.getRow
    L23_61 = reservedipTable
    L24_62 = _UPVALUE4_
    L25_63 = A0_38
    L22_60 = L22_60(L23_61, L24_62, L25_63)
    if L22_60 == nil then
      L23_61 = _UPVALUE2_
      L23_61 = L23_61.FAILURE
      return L23_61
    end
    L23_61, L24_62, L25_63 = nil, nil, nil
    L23_61 = L22_60["DhcpfixedIpAddress.Name"]
    L24_62 = L22_60["DhcpfixedIpAddress.IpAddr"]
    L25_63 = L22_60["DhcpfixedIpAddress.MacAddr"]
    L26_64 = _UPVALUE0_
    L26_64 = L26_64.sourceMACAddress
    L27_65 = " != '"
    L31_69 = " != '"
    L32_70 = L24_62
    L26_64 = L26_64 .. L27_65 .. L28_66 .. L29_67 .. L30_68 .. L31_69 .. L32_70 .. L33_71 .. L34_72 .. " != '" .. L23_61 .. "'"
    L27_65 = db
    L27_65 = L27_65.getRowsWhere
    L27_65 = L27_65(L28_66, L29_67)
    if L27_65 ~= nil then
      for L31_69, L32_70 in L28_66(L29_67) do
        for _FORV_36_, _FORV_37_ in L33_71(L34_72) do
          if _FORV_36_ == "IPMACBinding.SourceMACAddress" and _FORV_37_ == A1_39 then
            return _UPVALUE1_.COMP_DHCP_RESERVEDIP_LAN_MACADDRESS_EXISTS
          end
          if _FORV_36_ == "IPMACBinding.IPAddress" and _FORV_37_ == A2_40 then
            return _UPVALUE1_.COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_EXISTS
          end
        end
      end
    end
  end
  L22_60 = nil
  L23_61 = 0
  L24_62 = 0
  L25_63 = "LAN"
  L26_64 = _UPVALUE0_
  L26_64 = L26_64.subnet
  L26_64 = L26_64.AddressFamily
  L27_65 = "='2' and "
  L31_69 = "' and "
  L32_70 = _UPVALUE0_
  L32_70 = L32_70.subnet
  L32_70 = L32_70.LogicalIfName
  L26_64 = L26_64 .. L27_65 .. L28_66 .. L29_67 .. L30_68 .. L31_69 .. L32_70 .. L33_71 .. L34_72 .. "' and " .. _UPVALUE0_.subnet.LogicalIfName .. "!='" .. DMZ_NAME .. "'"
  L27_65 = db
  L27_65 = L27_65.getRowsWhere
  L27_65 = L27_65(L28_66, L29_67)
  for L31_69, L32_70 in L28_66(L29_67) do
    L10_48 = _UPVALUE3_.ipv4SingleMaskCheck(A2_40, L33_71, L34_72)
    if L10_48 == _UPVALUE2_.SUCCESS then
      L23_61 = 1
      L25_63 = L32_70[subnetTable .. "." .. _UPVALUE0_.subnet.LogicalIfName]
      L22_60 = _UPVALUE3_.ipv4AddressesCompare(A2_40, L33_71)
      if L22_60 == 2 then
        L24_62 = 1
      end
    end
  end
  if L23_61 == 0 then
    return L28_66
  end
  if L24_62 == 1 then
    return L28_66
  end
  L31_69 = L25_63
  if L28_66 == L29_67 then
    return L29_67, L30_68
  end
  L31_69 = _UPVALUE0_
  L31_69 = L31_69.dhcp
  L31_69 = L31_69.startAddress
  L9_47 = L28_66[L29_67]
  L31_69 = _UPVALUE0_
  L31_69 = L31_69.dhcp
  L31_69 = L31_69.endAddress
  L8_46 = L28_66[L29_67]
  L31_69 = L9_47
  L32_70 = L8_46
  L10_48 = L29_67
  if L10_48 == -1 then
    return L29_67
  end
  if A5_43 == L29_67 then
    return L29_67
  end
  L31_69 = reservedipTable
  L32_70 = "."
  L31_69 = L31_69 .. L32_70 .. L33_71
  L29_67[L31_69] = A1_39
  L31_69 = reservedipTable
  L32_70 = "."
  L31_69 = L31_69 .. L32_70 .. L33_71
  L29_67[L31_69] = A2_40
  L31_69 = reservedipTable
  L32_70 = "."
  L31_69 = L31_69 .. L32_70 .. L33_71
  L29_67[L31_69] = A3_41
  L31_69 = reservedipTable
  L32_70 = "."
  L31_69 = L31_69 .. L32_70 .. L33_71
  L29_67[L31_69] = A4_42
  L31_69 = reservedipTable
  L32_70 = "."
  L31_69 = L31_69 .. L32_70 .. L33_71
  L29_67[L31_69] = L25_63
  L31_69 = db
  L31_69 = L31_69.getAttribute
  L32_70 = reservedipTable
  L31_69 = L31_69(L32_70, L33_71, L34_72, _UPVALUE0_.ipAddress)
  ipMac_IPAddress = L31_69
  L31_69 = db
  L31_69 = L31_69.getAttribute
  L32_70 = reservedipTable
  L31_69 = L31_69(L32_70, L33_71, L34_72, _UPVALUE0_.ipMacBinding)
  oldstatus = L31_69
  if L16_54 and A4_42 == "0" then
    L31_69 = reservedipTable
    L32_70 = "."
    L31_69 = L31_69 .. L32_70 .. L33_71
    L29_67[L31_69] = "1"
  end
  L31_69 = ipMacBindingTable
  L32_70 = "."
  L31_69 = L31_69 .. L32_70 .. L33_71
  L30_68[L31_69] = A3_41
  L31_69 = ipMacBindingTable
  L32_70 = "."
  L31_69 = L31_69 .. L32_70 .. L33_71
  L30_68[L31_69] = A1_39
  L31_69 = ipMacBindingTable
  L32_70 = "."
  L31_69 = L31_69 .. L32_70 .. L33_71
  L30_68[L31_69] = A2_40
  L31_69 = ipMacBindingTable
  L32_70 = "."
  L31_69 = L31_69 .. L32_70 .. L33_71
  L30_68[L31_69] = A4_42
  if A4_42 == "1" then
    L31_69 = db
    L31_69 = L31_69.getAttribute
    L32_70 = ipMacBindingTable
    L31_69 = L31_69(L32_70, L33_71, L34_72, ROWID)
    if L31_69 then
      L32_70 = ipMacBindingTable
      L32_70 = L32_70 .. L33_71 .. L34_72
      L30_68[L32_70] = A5_43
      L32_70 = db
      L32_70 = L32_70.update
      L32_70 = L32_70(L33_71, L34_72, L31_69)
      L21_59 = L32_70
    else
      L32_70 = ipMacBindingTable
      L32_70 = L32_70 .. L33_71 .. L34_72
      L30_68[L32_70] = A5_43
      if L16_54 then
        L32_70 = db
        L32_70 = L32_70.update
        L32_70 = L32_70(L33_71, L34_72, L16_54)
        L21_59 = L32_70
      else
        L32_70 = db
        L32_70 = L32_70.insert
        L32_70 = L32_70(L33_71, L34_72)
        L21_59 = L32_70
      end
    end
    L32_70 = NIL
    if L21_59 == L32_70 then
      L32_70 = _UPVALUE2_
      L32_70 = L32_70.FAILURE
      return L32_70, L33_71
    end
  end
  L31_69 = oldstatus
  if L31_69 == "1" and A4_42 == "0" then
    L31_69 = db
    L31_69 = L31_69.getAttribute
    L32_70 = ipMacBindingTable
    L31_69 = L31_69(L32_70, L33_71, L34_72, ROWID)
    if L31_69 then
      L32_70 = reservedipTable
      L32_70 = L32_70 .. L33_71 .. L34_72
      L29_67[L32_70] = "0"
      L32_70 = db
      L32_70 = L32_70.deleteRow
      L32_70 = L32_70(L33_71, L34_72, L31_69)
      L21_59 = L32_70
    end
  end
  L31_69 = NIL
  if L21_59 == L31_69 then
    L31_69 = _UPVALUE2_
    L31_69 = L31_69.FAILURE
    L32_70 = A0_38
    return L31_69, L32_70
  end
  L31_69 = db
  L31_69 = L31_69.update
  L32_70 = reservedipTable
  L31_69 = L31_69(L32_70, L33_71, L34_72)
  L32_70 = NIL
  if L31_69 == L32_70 then
    L32_70 = _UPVALUE2_
    L32_70 = L32_70.FAILURE
    return L32_70, L33_71
  end
  L32_70 = _UPVALUE2_
  L32_70 = L32_70.SUCCESS
  return L32_70, L33_71
end
function IpMacReservationLANCreate(A0_73, A1_74, A2_75, A3_76, A4_77, A5_78)
  local L6_79, L7_80, L8_81, L9_82, L10_83, L11_84, L12_85, L13_86, L14_87, L15_88, L16_89, L17_90, L18_91, L19_92, L20_93, L21_94, L22_95, L23_96, L24_97, L25_98, L26_99, L27_100, L28_101, L29_102, L30_103, L31_104, L32_105
  L10_83 = db
  L10_83 = L10_83.getTable
  L11_84 = reservedipTable
  L10_83 = L10_83(L11_84)
  L11_84 = #L10_83
  L12_85 = RESERVED_IP_MAXLIMIT
  if L11_84 >= L12_85 then
    L11_84 = _UPVALUE0_
    L11_84 = L11_84.COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_MAX_REACHED
    return L11_84
  end
  if A4_77 == "1" then
    L11_84 = db
    L11_84 = L11_84.getTable
    L12_85 = ipMacBindingTable
    L11_84 = L11_84(L12_85)
    L10_83 = L11_84
    L11_84 = #L10_83
    L12_85 = RESERVED_IP_MAXLIMIT
    if L11_84 >= L12_85 then
      L11_84 = _UPVALUE0_
      L11_84 = L11_84.COMP_DHCP_IPMACBINDING_LAN_IPADDRESS_MAX_REACHED
      return L11_84
    end
  end
  L11_84 = nil
  L12_85 = NIL
  if A0_73 == L12_85 then
    L12_85 = _UPVALUE0_
    L12_85 = L12_85.COMP_DHCP_RESERVEDIP_LAN_MACADDRESS_NIL
    return L12_85
  end
  L12_85 = _UPVALUE1_
  L12_85 = L12_85.isMacAddress
  L13_86 = A0_73
  L12_85 = L12_85(L13_86)
  L11_84 = L12_85
  L12_85 = _UPVALUE2_
  L12_85 = L12_85.ERROR
  if L11_84 == L12_85 then
    L12_85 = _UPVALUE0_
    L12_85 = L12_85.COMP_DHCP_RESERVEDIP_LAN_MACADDRESS_INVALID
    return L12_85
  end
  L12_85 = _UPVALUE3_
  L12_85 = L12_85.sourceMACAddress
  L13_86 = " = '"
  L14_87 = A0_73
  L15_88 = "' AND "
  L16_89 = _UPVALUE3_
  L16_89 = L16_89.ipMacIPAddress
  L17_90 = " = '"
  L18_91 = A1_74
  L19_92 = "'"
  L12_85 = L12_85 .. L13_86 .. L14_87 .. L15_88 .. L16_89 .. L17_90 .. L18_91 .. L19_92
  L13_86 = db
  L13_86 = L13_86.existsRowWhere
  L14_87 = ipMacBindingTable
  L15_88 = L12_85
  L13_86 = L13_86(L14_87, L15_88)
  if A4_77 == "1" and L13_86 == false then
    L14_87 = db
    L14_87 = L14_87.existsRow
    L15_88 = ipMacBindingTable
    L16_89 = _UPVALUE3_
    L16_89 = L16_89.sourceMACAddress
    L17_90 = A0_73
    L14_87 = L14_87(L15_88, L16_89, L17_90)
    if L14_87 then
      L15_88 = _UPVALUE0_
      L15_88 = L15_88.COMP_DHCP_RESERVEDIP_LAN_MACADDRESS_EXISTS
      return L15_88
    end
    L15_88 = db
    L15_88 = L15_88.existsRow
    L16_89 = ipMacBindingTable
    L17_90 = _UPVALUE3_
    L17_90 = L17_90.ipMacIPAddress
    L18_91 = A1_74
    L15_88 = L15_88(L16_89, L17_90, L18_91)
    L14_87 = L15_88
    if L14_87 then
      L15_88 = _UPVALUE0_
      L15_88 = L15_88.COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_EXISTS
      return L15_88
    end
  end
  L14_87 = reservedipTable
  L15_88 = "."
  L16_89 = _UPVALUE3_
  L16_89 = L16_89.name
  L17_90 = " ='"
  L18_91 = A3_76
  L19_92 = "'"
  L14_87 = L14_87 .. L15_88 .. L16_89 .. L17_90 .. L18_91 .. L19_92
  L15_88 = db
  L15_88 = L15_88.existsRowWhere
  L16_89 = reservedipTable
  L17_90 = L14_87
  L15_88 = L15_88(L16_89, L17_90)
  if L15_88 then
    L16_89 = _UPVALUE0_
    L16_89 = L16_89.COMP_DHCP_IPMACBINDING_NAME_EXISTS
    return L16_89
  end
  L17_90 = A0_73
  L16_89 = A0_73.lower
  L18_91 = A0_73
  L16_89 = L16_89(L17_90, L18_91)
  L17_90 = where
  L18_91 = " and lower("
  L19_92 = reservedipTable
  L20_93 = "."
  L21_94 = _UPVALUE3_
  L21_94 = L21_94.macAddress
  L22_95 = ")='"
  L23_96 = L16_89
  L24_97 = "'"
  L17_90 = L17_90 .. L18_91 .. L19_92 .. L20_93 .. L21_94 .. L22_95 .. L23_96 .. L24_97
  L18_91 = db
  L18_91 = L18_91.existsRowWhere
  L19_92 = reservedipTable
  L20_93 = L17_90
  L18_91 = L18_91(L19_92, L20_93)
  if L18_91 then
    L19_92 = _UPVALUE0_
    L19_92 = L19_92.COMP_DHCP_RESERVEDIP_LAN_MACADDRESS_EXISTS
    return L19_92
  end
  L19_92 = db
  L19_92 = L19_92.existsRow
  L20_93 = reservedipTable
  L21_94 = _UPVALUE3_
  L21_94 = L21_94.ipAddress
  L22_95 = A1_74
  L19_92 = L19_92(L20_93, L21_94, L22_95)
  if L19_92 then
    L20_93 = _UPVALUE0_
    L20_93 = L20_93.COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_EXISTS
    return L20_93
  end
  L20_93 = NIL
  if A1_74 == L20_93 then
    L20_93 = _UPVALUE0_
    L20_93 = L20_93.COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_NIL
    return L20_93
  end
  L20_93 = util
  L20_93 = L20_93.split
  L21_94 = A1_74
  L22_95 = "."
  L20_93 = L20_93(L21_94, L22_95)
  L6_79 = L20_93
  if L6_79 ~= nil then
    L20_93 = tonumber
    L21_94 = L6_79[1]
    L20_93 = L20_93(L21_94)
    if L20_93 ~= 224 then
      L20_93 = tonumber
      L21_94 = L6_79[1]
      L20_93 = L20_93(L21_94)
      if not (L20_93 > 224) then
        L20_93 = tonumber
        L21_94 = L6_79[1]
        L20_93 = L20_93(L21_94)
      end
    end
  elseif L20_93 == 0 or A1_74 == "0.0.0.0" then
    L20_93 = _UPVALUE0_
    L20_93 = L20_93.COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_INVALID
    return L20_93
  end
  L20_93 = validationsLuaLib
  L20_93 = L20_93.ipv4AddrAsciiToNum
  L21_94 = A1_74
  L21_94 = L20_93(L21_94)
  L7_80 = L21_94
  L11_84 = L20_93
  if L11_84 == -1 then
    L20_93 = _UPVALUE0_
    L20_93 = L20_93.COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_INVALID
    return L20_93
  end
  L20_93 = db
  L20_93 = L20_93.existsRow
  L21_94 = ipMacBindingTable
  L22_95 = _UPVALUE3_
  L22_95 = L22_95.sourceMACAddress
  L23_96 = L16_89
  L20_93 = L20_93(L21_94, L22_95, L23_96)
  if L20_93 then
    L20_93 = _UPVALUE0_
    L20_93 = L20_93.COMP_DHCP_RESERVEDIP_LAN_MACADDRESS_EXISTS
    return L20_93
  end
  L20_93 = nil
  L21_94 = 0
  L22_95 = 0
  L23_96 = "LAN"
  L24_97 = _UPVALUE3_
  L24_97 = L24_97.subnet
  L24_97 = L24_97.AddressFamily
  L25_98 = "='2' and "
  L29_102 = "' and "
  L30_103 = _UPVALUE3_
  L30_103 = L30_103.subnet
  L30_103 = L30_103.LogicalIfName
  L31_104 = "!='"
  L32_105 = WAN2_NAME
  L24_97 = L24_97 .. L25_98 .. L26_99 .. L27_100 .. L28_101 .. L29_102 .. L30_103 .. L31_104 .. L32_105 .. "' and " .. _UPVALUE3_.subnet.LogicalIfName .. "!='" .. DMZ_NAME .. "'"
  L25_98 = db
  L25_98 = L25_98.getRowsWhere
  L25_98 = L25_98(L26_99, L27_100)
  for L29_102, L30_103 in L26_99(L27_100) do
    L31_104, L32_105 = nil, nil
    L31_104 = L30_103[subnetTable .. "." .. _UPVALUE3_.subnet.ipAddress]
    L32_105 = L30_103[subnetTable .. "." .. _UPVALUE3_.subnet.subnetMask]
    L11_84 = _UPVALUE1_.ipv4SingleMaskCheck(A1_74, L31_104, L32_105)
    if L11_84 == _UPVALUE2_.SUCCESS then
      L21_94 = 1
      L23_96 = L30_103[subnetTable .. "." .. _UPVALUE3_.subnet.LogicalIfName]
      L20_93 = _UPVALUE1_.ipv4AddressesCompare(A1_74, L31_104)
      if L20_93 == 2 then
        L22_95 = 1
      end
      break
    end
  end
  if L21_94 == 0 then
    return L26_99
  end
  if L22_95 == 1 then
    return L26_99
  end
  L29_102 = L23_96
  if L26_99 == L27_100 then
    return L27_100, L28_101
  end
  L29_102 = _UPVALUE3_
  L29_102 = L29_102.dhcp
  L29_102 = L29_102.startAddress
  L9_82 = L26_99[L27_100]
  L29_102 = _UPVALUE3_
  L29_102 = L29_102.dhcp
  L29_102 = L29_102.endAddress
  L8_81 = L26_99[L27_100]
  L29_102 = L9_82
  L30_103 = L8_81
  L11_84 = L27_100
  if L11_84 == -1 then
    return L27_100
  end
  if A5_78 == L27_100 then
    return L27_100
  end
  L29_102 = reservedipTable
  L30_103 = "."
  L31_104 = _UPVALUE3_
  L31_104 = L31_104.macAddress
  L29_102 = L29_102 .. L30_103 .. L31_104
  L27_100[L29_102] = A0_73
  L29_102 = reservedipTable
  L30_103 = "."
  L31_104 = _UPVALUE3_
  L31_104 = L31_104.ipAddress
  L29_102 = L29_102 .. L30_103 .. L31_104
  L27_100[L29_102] = A1_74
  L29_102 = reservedipTable
  L30_103 = "."
  L31_104 = _UPVALUE3_
  L31_104 = L31_104.interfaceType
  L29_102 = L29_102 .. L30_103 .. L31_104
  L27_100[L29_102] = L23_96
  L29_102 = reservedipTable
  L30_103 = "."
  L31_104 = _UPVALUE3_
  L31_104 = L31_104.name
  L29_102 = L29_102 .. L30_103 .. L31_104
  L27_100[L29_102] = A3_76
  L29_102 = reservedipTable
  L30_103 = "."
  L31_104 = _UPVALUE3_
  L31_104 = L31_104.ipMacBinding
  L29_102 = L29_102 .. L30_103 .. L31_104
  L27_100[L29_102] = A4_77
  if L13_86 then
    L29_102 = reservedipTable
    L30_103 = "."
    L31_104 = _UPVALUE3_
    L31_104 = L31_104.ipMacBinding
    L29_102 = L29_102 .. L30_103 .. L31_104
    L27_100[L29_102] = "1"
  end
  L29_102 = db
  L29_102 = L29_102.insert
  L30_103 = reservedipTable
  L31_104 = L27_100
  L29_102 = L29_102(L30_103, L31_104)
  L30_103 = ipMacBindingTable
  L31_104 = "."
  L32_105 = _UPVALUE3_
  L32_105 = L32_105.name
  L30_103 = L30_103 .. L31_104 .. L32_105
  L28_101[L30_103] = A3_76
  L30_103 = ipMacBindingTable
  L31_104 = "."
  L32_105 = _UPVALUE3_
  L32_105 = L32_105.sourceMACAddress
  L30_103 = L30_103 .. L31_104 .. L32_105
  L28_101[L30_103] = A0_73
  L30_103 = ipMacBindingTable
  L31_104 = "."
  L32_105 = _UPVALUE3_
  L32_105 = L32_105.ipMacIPAddress
  L30_103 = L30_103 .. L31_104 .. L32_105
  L28_101[L30_103] = A1_74
  L30_103 = ipMacBindingTable
  L31_104 = "."
  L32_105 = _UPVALUE3_
  L32_105 = L32_105.ipMacBinding
  L30_103 = L30_103 .. L31_104 .. L32_105
  L28_101[L30_103] = A4_77
  if A4_77 == "1" and L13_86 == false then
    L30_103 = ipMacBindingTable
    L31_104 = "."
    L32_105 = _UPVALUE3_
    L32_105 = L32_105.logStatus
    L30_103 = L30_103 .. L31_104 .. L32_105
    L28_101[L30_103] = A5_78
    L30_103 = db
    L30_103 = L30_103.insert
    L31_104 = ipMacBindingTable
    L32_105 = L28_101
    L30_103 = L30_103(L31_104, L32_105)
    L29_102 = L30_103
  elseif A4_77 == "1" and L13_86 or L13_86 then
    L30_103 = ipMacBindingTable
    L31_104 = "."
    L32_105 = _UPVALUE3_
    L32_105 = L32_105.logStatus
    L30_103 = L30_103 .. L31_104 .. L32_105
    L28_101[L30_103] = A5_78
    L30_103 = db
    L30_103 = L30_103.update
    L31_104 = ipMacBindingTable
    L32_105 = L28_101
    L30_103 = L30_103(L31_104, L32_105, L13_86)
    L29_102 = L30_103
  end
  L30_103 = NIL
  if L29_102 == L30_103 then
    L30_103 = _UPVALUE2_
    L30_103 = L30_103.FAILURE
    L31_104 = cookie
    return L30_103, L31_104
  end
  L30_103 = _UPVALUE3_
  L30_103 = L30_103.ipAddress
  L31_104 = " = '"
  L32_105 = A1_74
  L30_103 = L30_103 .. L31_104 .. L32_105 .. "' and " .. _UPVALUE3_.macAddress .. " = '" .. A0_73 .. "'"
  L31_104 = db
  L31_104 = L31_104.getAttributeWhere
  L32_105 = reservedipTable
  L31_104 = L31_104(L32_105, L30_103, ROWID)
  L32_105 = NIL
  if L29_102 == L32_105 then
    L32_105 = _UPVALUE2_
    L32_105 = L32_105.FAILURE
    return L32_105, L31_104
  end
  L32_105 = _UPVALUE2_
  L32_105 = L32_105.SUCCESS
  return L32_105, L31_104
end
function IpMacReservationLANFromLeaseCreate(A0_106, A1_107, A2_108, A3_109, A4_110)
  local L5_111, L6_112, L7_113, L8_114, L9_115, L10_116, L11_117, L12_118, L13_119, L14_120, L15_121, L16_122, L17_123, L18_124, L19_125, L20_126, L21_127, L22_128, L23_129, L24_130, L25_131
  L5_111 = db
  L5_111 = L5_111.getTable
  L6_112 = reservedipTable
  L5_111 = L5_111(L6_112)
  L6_112 = #L5_111
  L7_113 = RESERVED_IP_MAXLIMIT
  if L6_112 >= L7_113 then
    L6_112 = _UPVALUE0_
    L6_112 = L6_112.COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_MAX_REACHED
    return L6_112
  end
  L6_112 = nil
  L7_113 = NIL
  if A0_106 == L7_113 then
    L7_113 = _UPVALUE0_
    L7_113 = L7_113.COMP_DHCP_RESERVEDIP_LAN_MACADDRESS_NIL
    return L7_113
  end
  L7_113 = _UPVALUE1_
  L7_113 = L7_113.isMacAddress
  L8_114 = A0_106
  L7_113 = L7_113(L8_114)
  L6_112 = L7_113
  L7_113 = _UPVALUE2_
  L7_113 = L7_113.ERROR
  if L6_112 == L7_113 then
    L7_113 = _UPVALUE0_
    L7_113 = L7_113.COMP_DHCP_RESERVEDIP_LAN_MACADDRESS_INVALID
    return L7_113
  end
  L8_114 = A0_106
  L7_113 = A0_106.lower
  L9_115 = A0_106
  L7_113 = L7_113(L8_114, L9_115)
  L8_114 = where
  L9_115 = " and lower("
  L10_116 = reservedipTable
  L11_117 = "."
  L12_118 = _UPVALUE3_
  L12_118 = L12_118.macAddress
  L13_119 = ")='"
  L14_120 = L7_113
  L15_121 = "'"
  L8_114 = L8_114 .. L9_115 .. L10_116 .. L11_117 .. L12_118 .. L13_119 .. L14_120 .. L15_121
  L9_115 = db
  L9_115 = L9_115.existsRowWhere
  L10_116 = reservedipTable
  L11_117 = L8_114
  L9_115 = L9_115(L10_116, L11_117)
  if L9_115 then
    L10_116 = _UPVALUE0_
    L10_116 = L10_116.COMP_DHCP_RESERVEDIP_LAN_MACADDRESS_EXISTS
    return L10_116
  end
  L10_116 = db
  L10_116 = L10_116.existsRow
  L11_117 = reservedipTable
  L12_118 = _UPVALUE3_
  L12_118 = L12_118.ipAddress
  L13_119 = A1_107
  L10_116 = L10_116(L11_117, L12_118, L13_119)
  if L10_116 then
    L11_117 = _UPVALUE0_
    L11_117 = L11_117.COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_EXISTS
    return L11_117
  end
  L11_117 = NIL
  if A1_107 == L11_117 then
    L11_117 = _UPVALUE0_
    L11_117 = L11_117.COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_NIL
    return L11_117
  end
  L11_117 = _UPVALUE1_
  L11_117 = L11_117.ipAddressCheck
  L12_118 = IPV4_ADDRESS_FAMILY
  L13_119 = A1_107
  L11_117 = L11_117(L12_118, L13_119)
  L6_112 = L11_117
  L11_117 = _UPVALUE2_
  L11_117 = L11_117.ERROR
  if L6_112 == L11_117 then
    L11_117 = _UPVALUE0_
    L11_117 = L11_117.COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_INVALID
    return L11_117
  end
  L11_117 = db
  L11_117 = L11_117.existsRow
  L12_118 = ipMacBindingTable
  L13_119 = _UPVALUE3_
  L13_119 = L13_119.sourceMACAddress
  L14_120 = L7_113
  L11_117 = L11_117(L12_118, L13_119, L14_120)
  if L11_117 then
    L11_117 = _UPVALUE0_
    L11_117 = L11_117.COMP_DHCP_RESERVEDIP_LAN_MACADDRESS_EXISTS
    return L11_117
  end
  L11_117 = nil
  L12_118 = 0
  L13_119 = 0
  L14_120 = "LAN"
  L15_121 = _UPVALUE3_
  L15_121 = L15_121.subnet
  L15_121 = L15_121.AddressFamily
  L16_122 = "='2' and "
  L20_126 = "' and "
  L21_127 = _UPVALUE3_
  L21_127 = L21_127.subnet
  L21_127 = L21_127.LogicalIfName
  L22_128 = "!='"
  L23_129 = WAN2_NAME
  L24_130 = "' and "
  L25_131 = _UPVALUE3_
  L25_131 = L25_131.subnet
  L25_131 = L25_131.LogicalIfName
  L15_121 = L15_121 .. L16_122 .. L17_123 .. L18_124 .. L19_125 .. L20_126 .. L21_127 .. L22_128 .. L23_129 .. L24_130 .. L25_131 .. "!='" .. DMZ_NAME .. "'"
  L16_122 = db
  L16_122 = L16_122.getRowsWhere
  L16_122 = L16_122(L17_123, L18_124)
  for L20_126, L21_127 in L17_123(L18_124) do
    L22_128, L23_129 = nil, nil
    L24_130 = subnetTable
    L25_131 = "."
    L24_130 = L24_130 .. L25_131 .. _UPVALUE3_.subnet.ipAddress
    L22_128 = L21_127[L24_130]
    L24_130 = subnetTable
    L25_131 = "."
    L24_130 = L24_130 .. L25_131 .. _UPVALUE3_.subnet.subnetMask
    L23_129 = L21_127[L24_130]
    L24_130 = _UPVALUE1_
    L24_130 = L24_130.ipv4SingleMaskCheck
    L25_131 = A1_107
    L24_130 = L24_130(L25_131, L22_128, L23_129)
    L6_112 = L24_130
    L24_130 = _UPVALUE2_
    L24_130 = L24_130.SUCCESS
    if L6_112 == L24_130 then
      L12_118 = 1
      L24_130 = subnetTable
      L25_131 = "."
      L24_130 = L24_130 .. L25_131 .. _UPVALUE3_.subnet.LogicalIfName
      L14_120 = L21_127[L24_130]
      L24_130 = _UPVALUE1_
      L24_130 = L24_130.ipv4AddressesCompare
      L25_131 = A1_107
      L24_130 = L24_130(L25_131, L22_128)
      L11_117 = L24_130
      if L11_117 == 2 then
        L13_119 = 1
      end
      break
    end
  end
  if L12_118 == 0 then
    return L17_123
  end
  if L13_119 == 1 then
    return L17_123
  end
  L20_126 = L14_120
  L20_126 = "."
  L21_127 = _UPVALUE3_
  L21_127 = L21_127.dhcp
  L21_127 = L21_127.startAddress
  L20_126 = "."
  L20_126 = dhcpTable
  L21_127 = "."
  L22_128 = _UPVALUE3_
  L22_128 = L22_128.dhcp
  L22_128 = L22_128.endAddress
  L20_126 = L20_126 .. L21_127 .. L22_128
  L20_126 = L17_123[L20_126]
  L21_127 = "."
  L20_126 = util
  L20_126 = L20_126.split
  L21_127 = A1_107
  L22_128 = "."
  L20_126 = L20_126(L21_127, L22_128)
  L21_127 = tonumber
  L22_128 = L18_124[3]
  L21_127 = L21_127(L22_128)
  L22_128 = tonumber
  L23_129 = L19_125[3]
  L22_128 = L22_128(L23_129)
  if L21_127 == L22_128 then
    L21_127 = tonumber
    L22_128 = L20_126[4]
    L21_127 = L21_127(L22_128)
    L22_128 = tonumber
    L23_129 = L18_124[4]
    L22_128 = L22_128(L23_129)
    if not (L21_127 < L22_128) then
      L21_127 = tonumber
      L22_128 = L20_126[4]
      L21_127 = L21_127(L22_128)
      L22_128 = tonumber
      L23_129 = L19_125[4]
      L22_128 = L22_128(L23_129)
    elseif L21_127 > L22_128 then
      L21_127 = _UPVALUE0_
      L21_127 = L21_127.COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_INDHCP_RANGE
      return L21_127
    end
  else
    L21_127 = tonumber
    L22_128 = L18_124[3]
    L21_127 = L21_127(L22_128)
    L22_128 = tonumber
    L23_129 = L19_125[3]
    L22_128 = L22_128(L23_129)
    if L21_127 > L22_128 then
      L21_127 = tonumber
      L22_128 = L20_126[3]
      L21_127 = L21_127(L22_128)
      L22_128 = tonumber
      L23_129 = L18_124[3]
      L22_128 = L22_128(L23_129)
      if L21_127 == L22_128 then
        L21_127 = tonumber
        L22_128 = L20_126[4]
        L21_127 = L21_127(L22_128)
        L22_128 = tonumber
        L23_129 = L18_124[4]
        L22_128 = L22_128(L23_129)
        if L21_127 < L22_128 then
          L21_127 = _UPVALUE0_
          L21_127 = L21_127.COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_INDHCP_RANGE
          return L21_127
        end
      else
        L21_127 = tonumber
        L22_128 = L20_126[3]
        L21_127 = L21_127(L22_128)
        L22_128 = tonumber
        L23_129 = L19_125[3]
        L22_128 = L22_128(L23_129)
        if L21_127 == L22_128 then
          L21_127 = tonumber
          L22_128 = L20_126[4]
          L21_127 = L21_127(L22_128)
          L22_128 = tonumber
          L23_129 = L19_125[4]
          L22_128 = L22_128(L23_129)
          if L21_127 > L22_128 then
            L21_127 = _UPVALUE0_
            L21_127 = L21_127.COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_INDHCP_RANGE
            return L21_127
          end
        end
      end
    end
  end
  L21_127 = {}
  L22_128 = {}
  L23_129 = reservedipTable
  L24_130 = "."
  L25_131 = _UPVALUE3_
  L25_131 = L25_131.macAddress
  L23_129 = L23_129 .. L24_130 .. L25_131
  L21_127[L23_129] = A0_106
  L23_129 = reservedipTable
  L24_130 = "."
  L25_131 = _UPVALUE3_
  L25_131 = L25_131.ipAddress
  L23_129 = L23_129 .. L24_130 .. L25_131
  L21_127[L23_129] = A1_107
  L23_129 = reservedipTable
  L24_130 = "."
  L25_131 = _UPVALUE3_
  L25_131 = L25_131.interfaceType
  L23_129 = L23_129 .. L24_130 .. L25_131
  L21_127[L23_129] = L14_120
  L23_129 = reservedipTable
  L24_130 = "."
  L25_131 = _UPVALUE3_
  L25_131 = L25_131.name
  L23_129 = L23_129 .. L24_130 .. L25_131
  L21_127[L23_129] = A3_109
  L23_129 = reservedipTable
  L24_130 = "."
  L25_131 = _UPVALUE3_
  L25_131 = L25_131.ipMacBinding
  L23_129 = L23_129 .. L24_130 .. L25_131
  L21_127[L23_129] = A4_110
  L23_129 = db
  L23_129 = L23_129.insert
  L24_130 = reservedipTable
  L25_131 = L21_127
  L23_129 = L23_129(L24_130, L25_131)
  L24_130 = _UPVALUE3_
  L24_130 = L24_130.ipAddress
  L25_131 = " = '"
  L24_130 = L24_130 .. L25_131 .. A1_107 .. "' and " .. _UPVALUE3_.macAddress .. " = '" .. A0_106 .. "'"
  L25_131 = db
  L25_131 = L25_131.getAttributeWhere
  L25_131 = L25_131(reservedipTable, L24_130, ROWID)
  if L23_129 == NIL then
    return _UPVALUE2_.FAILURE, L25_131
  end
  return _UPVALUE2_.SUCCESS, L25_131
end
function IpMacReservationLANDelete(A0_132)
  local L1_133, L2_134, L3_135, L4_136, L5_137
  L1_133 = _UPVALUE0_
  L1_133 = L1_133.NIL
  if A0_132 ~= L1_133 then
    L1_133 = tonumber
    L2_134 = A0_132
    L1_133 = L1_133(L2_134)
    L2_134 = _UPVALUE0_
    L2_134 = L2_134.NIL
  elseif L1_133 == L2_134 then
    L1_133 = _UPVALUE0_
    L1_133 = L1_133.INVALID_ARGUMENT
    return L1_133
  end
  L1_133 = db
  L1_133 = L1_133.existsRow
  L2_134 = reservedipTable
  L3_135 = ROWID
  L4_136 = A0_132
  L1_133 = L1_133(L2_134, L3_135, L4_136)
  L2_134 = _UPVALUE0_
  L2_134 = L2_134.FALSE
  if L1_133 == L2_134 then
    L1_133 = _UPVALUE0_
    L1_133 = L1_133.INVALID_ARGUMENT
    return L1_133
  end
  L1_133 = db
  L1_133 = L1_133.getRow
  L2_134 = reservedipTable
  L3_135 = ROWID
  L4_136 = A0_132
  L1_133 = L1_133(L2_134, L3_135, L4_136)
  L2_134 = reservedipTable
  L3_135 = "."
  L4_136 = _UPVALUE1_
  L4_136 = L4_136.ipMacBinding
  L2_134 = L2_134 .. L3_135 .. L4_136
  L2_134 = L1_133[L2_134]
  L3_135 = reservedipTable
  L4_136 = "."
  L5_137 = _UPVALUE1_
  L5_137 = L5_137.ipAddress
  L3_135 = L3_135 .. L4_136 .. L5_137
  L3_135 = L1_133[L3_135]
  L4_136 = db
  L4_136 = L4_136.deleteRow
  L5_137 = reservedipTable
  L4_136 = L4_136(L5_137, ROWID, A0_132)
  L5_137 = NIL
  if L4_136 == L5_137 then
    L5_137 = _UPVALUE0_
    L5_137 = L5_137.FAILURE
    return L5_137, A0_132
  end
  if L2_134 == "1" then
    L5_137 = db
    L5_137 = L5_137.getAttribute
    L5_137 = L5_137(ipMacBindingTable, _UPVALUE1_.ipMacIPAddress, L3_135, ROWID)
    if db.deleteRow(ipMacBindingTable, ROWID, L5_137) == NIL then
      return _UPVALUE0_.FAILURE, A0_132
    end
  end
  L5_137 = _UPVALUE0_
  L5_137 = L5_137.SUCCESS
  return L5_137, A0_132
end
function IpMacReservationLANDeleteAll()
  local L0_138
  L0_138 = _UPVALUE0_
  L0_138 = L0_138.interfaceType
  L0_138 = L0_138 .. " LIKE '" .. LAN_NAME .. "%'"
  if db.deleteRowWhere(reservedipTable, L0_138) == NIL then
    return _UPVALUE1_.FAILURE, cookie
  end
  if #db.getTable(ipMacBindingTable) >= 1 then
    L0_138 = _UPVALUE0_.ipMacBinding .. " LIKE '1%' "
    if db.deleteRowWhere(ipMacBindingTable, L0_138) == NIL then
      return _UPVALUE1_.FAILURE, cookie
    end
  end
  return _UPVALUE1_.SUCCESS, cookie
end
function reservedLANIpGet()
  local L0_139
  L0_139 = db
  L0_139 = L0_139.getRowsWhere
  L0_139 = L0_139(reservedipTable, where)
  if L0_139 == nil then
    L0_139 = {}
  end
  return L0_139
end
