local L0_0
L0_0 = module
L0_0("com.teamf1.core.ipv6_wanclients.static_routes", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/ipv6_mode")
L0_0 = require
L0_0("teamf1lualib/returnCodes_ipv6_nimf")
L0_0 = require
L0_0("teamf1lualib/returnCodes_route6")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
static_routesTable = "route6"
;({}).routeName = "routeName"
;({}).active = "active"
;({}).destinationIpAddress = "dstIpAddr"
;({}).prefixLength = "prefix"
;({}).interface = "interfaceName"
;({}).gatewayIpAddress = "gwIpAddr"
;({}).metric = "metric"
;({}).LogicalIfName = "LogicalIfName"
;({}).AddressFamily = "AddressFamily"
;({}).StaticIp = "StaticIp"
;({}).PrefixLength = "PrefixLength"
attributesIpv6 = {}
attributesIpv6.addressFamily = "addressFamily"
attributesIpv6.ipv6PrefixLen = "ipv6PrefixLen"
attributesIpv6.ipAddress = "ipAddress"
attributesIpv6.LogicalIfName = "LogicalIfName"
;({}).ipv6Mode = "netWorkMode"
IPV6_ADDRESS_FAMILY = "10"
if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-1000" or UNIT_NAME == "DSR-1000N" then
elseif UNIT_NAME == "DSR-500AC" or UNIT_NAME == "DSR-500" or UNIT_NAME == "DSR-500N" then
elseif UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-250N" then
else
end
function routeNameGet()
  local L0_1, L1_2
  L0_1 = db
  L0_1 = L0_1.getNextRowId
  L1_2 = 0
  L0_1 = L0_1(L1_2, static_routesTable)
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.NIL
  if L0_1 == L1_2 then
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.FAILURE
    return L1_2
  end
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(static_routesTable, "_ROWID_", L0_1, _UPVALUE1_.routeName)
  if L1_2 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_1, L1_2
end
function routeNameGetNext(A0_3)
  local L1_4, L2_5
  L1_4 = _UPVALUE0_
  L1_4 = L1_4.NIL
  if A0_3 ~= L1_4 then
    L1_4 = tonumber
    L2_5 = A0_3
    L1_4 = L1_4(L2_5)
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.NIL
  elseif L1_4 == L2_5 then
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.INVALID_ARGUMENT
    return L1_4
  end
  L1_4 = db
  L1_4 = L1_4.getNextRowId
  L2_5 = A0_3
  L1_4 = L1_4(L2_5, static_routesTable)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if L1_4 == L2_5 then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.FAILURE
    return L2_5
  end
  L2_5 = db
  L2_5 = L2_5.getAttribute
  L2_5 = L2_5(static_routesTable, "_ROWID_", L1_4, _UPVALUE1_.routeName)
  if L2_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L2_5
end
function routeNameSet(A0_6, A1_7)
  local L2_8, L3_9, L4_10
  L2_8 = _UPVALUE0_
  L2_8 = L2_8.ipv6ModeGet
  L4_10 = L2_8()
  if tonumber(L4_10) ~= 3 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if A0_6 == _UPVALUE1_.NIL or tonumber(A0_6) == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if A1_7 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttribute(static_routesTable, "_ROWID_", A0_6, _UPVALUE2_.routeName, A1_7) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_6
  end
  return _UPVALUE1_.SUCCESS, A0_6
end
function routeNameDelete(A0_11, A1_12)
  local L3_13
  L3_13 = _UPVALUE0_
  L3_13 = L3_13.NOT_SUPPORTED
  return L3_13, A0_11
end
function activeGet()
  local L0_14, L1_15
  L0_14 = db
  L0_14 = L0_14.getNextRowId
  L1_15 = 0
  L0_14 = L0_14(L1_15, static_routesTable)
  L1_15 = _UPVALUE0_
  L1_15 = L1_15.NIL
  if L0_14 == L1_15 then
    L1_15 = _UPVALUE0_
    L1_15 = L1_15.FAILURE
    return L1_15
  end
  L1_15 = db
  L1_15 = L1_15.getAttribute
  L1_15 = L1_15(static_routesTable, "_ROWID_", L0_14, _UPVALUE1_.active)
  if L1_15 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_14, L1_15
end
function activeGetNext(A0_16)
  local L1_17, L2_18
  L1_17 = _UPVALUE0_
  L1_17 = L1_17.NIL
  if A0_16 ~= L1_17 then
    L1_17 = tonumber
    L2_18 = A0_16
    L1_17 = L1_17(L2_18)
    L2_18 = _UPVALUE0_
    L2_18 = L2_18.NIL
  elseif L1_17 == L2_18 then
    L1_17 = _UPVALUE0_
    L1_17 = L1_17.INVALID_ARGUMENT
    return L1_17
  end
  L1_17 = db
  L1_17 = L1_17.getNextRowId
  L2_18 = A0_16
  L1_17 = L1_17(L2_18, static_routesTable)
  L2_18 = _UPVALUE0_
  L2_18 = L2_18.NIL
  if L1_17 == L2_18 then
    L2_18 = _UPVALUE0_
    L2_18 = L2_18.FAILURE
    return L2_18
  end
  L2_18 = db
  L2_18 = L2_18.getAttribute
  L2_18 = L2_18(static_routesTable, "_ROWID_", L1_17, _UPVALUE1_.active)
  if L2_18 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_17
  end
  return _UPVALUE0_.SUCCESS, L1_17, L2_18
end
function activeSet(A0_19, A1_20)
  local L2_21, L3_22, L4_23
  L2_21 = _UPVALUE0_
  L2_21 = L2_21.ipv6ModeGet
  L4_23 = L2_21()
  if tonumber(L4_23) ~= 3 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if A0_19 == _UPVALUE1_.NIL or tonumber(A0_19) == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if A1_20 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttribute(static_routesTable, "_ROWID_", A0_19, _UPVALUE2_.active, A1_20) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_19
  end
  return _UPVALUE1_.SUCCESS, A0_19
end
function destinationIpAddressGet()
  local L0_24, L1_25
  L0_24 = db
  L0_24 = L0_24.getNextRowId
  L1_25 = 0
  L0_24 = L0_24(L1_25, static_routesTable)
  L1_25 = _UPVALUE0_
  L1_25 = L1_25.NIL
  if L0_24 == L1_25 then
    L1_25 = _UPVALUE0_
    L1_25 = L1_25.FAILURE
    return L1_25
  end
  L1_25 = db
  L1_25 = L1_25.getAttribute
  L1_25 = L1_25(static_routesTable, "_ROWID_", L0_24, _UPVALUE1_.destinationIpAddress)
  if L1_25 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_24, L1_25
end
function destinationIpAddressGetNext(A0_26)
  local L1_27, L2_28
  L1_27 = _UPVALUE0_
  L1_27 = L1_27.NIL
  if A0_26 ~= L1_27 then
    L1_27 = tonumber
    L2_28 = A0_26
    L1_27 = L1_27(L2_28)
    L2_28 = _UPVALUE0_
    L2_28 = L2_28.NIL
  elseif L1_27 == L2_28 then
    L1_27 = _UPVALUE0_
    L1_27 = L1_27.INVALID_ARGUMENT
    return L1_27
  end
  L1_27 = db
  L1_27 = L1_27.getNextRowId
  L2_28 = A0_26
  L1_27 = L1_27(L2_28, static_routesTable)
  L2_28 = _UPVALUE0_
  L2_28 = L2_28.NIL
  if L1_27 == L2_28 then
    L2_28 = _UPVALUE0_
    L2_28 = L2_28.FAILURE
    return L2_28
  end
  L2_28 = db
  L2_28 = L2_28.getAttribute
  L2_28 = L2_28(static_routesTable, "_ROWID_", L1_27, _UPVALUE1_.destinationIpAddress)
  if L2_28 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_27
  end
  return _UPVALUE0_.SUCCESS, L1_27, L2_28
end
function destinationIpAddressSet(A0_29, A1_30)
  local L2_31, L3_32, L4_33, L5_34
  L2_31 = _UPVALUE0_
  L2_31 = L2_31.ipv6ModeGet
  L4_33 = L2_31()
  L5_34 = tonumber
  L5_34 = L5_34(L4_33)
  if L5_34 ~= 3 then
    L5_34 = _UPVALUE1_
    L5_34 = L5_34.NOT_SUPPORTED
    return L5_34
  end
  L5_34 = nil
  if A0_29 == _UPVALUE1_.NIL or tonumber(A0_29) == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if A1_30 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  L5_34 = _UPVALUE2_.ipAddressCheck(10, A1_30)
  if L5_34 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttribute(static_routesTable, "_ROWID_", A0_29, _UPVALUE3_.destinationIpAddress, A1_30) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_29
  end
  return _UPVALUE1_.SUCCESS, A0_29
end
function prefixLengthGet()
  local L0_35, L1_36
  L0_35 = db
  L0_35 = L0_35.getNextRowId
  L1_36 = 0
  L0_35 = L0_35(L1_36, static_routesTable)
  L1_36 = _UPVALUE0_
  L1_36 = L1_36.NIL
  if L0_35 == L1_36 then
    L1_36 = _UPVALUE0_
    L1_36 = L1_36.FAILURE
    return L1_36
  end
  L1_36 = db
  L1_36 = L1_36.getAttribute
  L1_36 = L1_36(static_routesTable, "_ROWID_", L0_35, _UPVALUE1_.prefixLength)
  if L1_36 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_35, L1_36
end
function prefixLengthGetNext(A0_37)
  local L1_38, L2_39
  L1_38 = _UPVALUE0_
  L1_38 = L1_38.NIL
  if A0_37 ~= L1_38 then
    L1_38 = tonumber
    L2_39 = A0_37
    L1_38 = L1_38(L2_39)
    L2_39 = _UPVALUE0_
    L2_39 = L2_39.NIL
  elseif L1_38 == L2_39 then
    L1_38 = _UPVALUE0_
    L1_38 = L1_38.INVALID_ARGUMENT
    return L1_38
  end
  L1_38 = db
  L1_38 = L1_38.getNextRowId
  L2_39 = A0_37
  L1_38 = L1_38(L2_39, static_routesTable)
  L2_39 = _UPVALUE0_
  L2_39 = L2_39.NIL
  if L1_38 == L2_39 then
    L2_39 = _UPVALUE0_
    L2_39 = L2_39.FAILURE
    return L2_39
  end
  L2_39 = db
  L2_39 = L2_39.getAttribute
  L2_39 = L2_39(static_routesTable, "_ROWID_", L1_38, _UPVALUE1_.prefixLength)
  if L2_39 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_38
  end
  return _UPVALUE0_.SUCCESS, L1_38, L2_39
end
function prefixLengthSet(A0_40, A1_41)
  local L2_42, L3_43, L4_44
  L2_42 = _UPVALUE0_
  L2_42 = L2_42.ipv6ModeGet
  L4_44 = L2_42()
  if tonumber(L4_44) ~= 3 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if A0_40 == _UPVALUE1_.NIL or tonumber(A0_40) == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if A1_41 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if tonumber(A1_41) < 0 or tonumber(A1_41) > 128 then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttribute(static_routesTable, "_ROWID_", A0_40, _UPVALUE2_.prefixLength, A1_41) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_40
  end
  return _UPVALUE1_.SUCCESS, A0_40
end
function interfaceGet()
  local L0_45, L1_46
  L0_45 = db
  L0_45 = L0_45.getNextRowId
  L1_46 = 0
  L0_45 = L0_45(L1_46, static_routesTable)
  L1_46 = _UPVALUE0_
  L1_46 = L1_46.NIL
  if L0_45 == L1_46 then
    L1_46 = _UPVALUE0_
    L1_46 = L1_46.FAILURE
    return L1_46
  end
  L1_46 = db
  L1_46 = L1_46.getAttribute
  L1_46 = L1_46(static_routesTable, "_ROWID_", L0_45, _UPVALUE1_.interface)
  if L1_46 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_45, L1_46
end
function interfaceGetNext(A0_47)
  local L1_48, L2_49
  L1_48 = _UPVALUE0_
  L1_48 = L1_48.NIL
  if A0_47 ~= L1_48 then
    L1_48 = tonumber
    L2_49 = A0_47
    L1_48 = L1_48(L2_49)
    L2_49 = _UPVALUE0_
    L2_49 = L2_49.NIL
  elseif L1_48 == L2_49 then
    L1_48 = _UPVALUE0_
    L1_48 = L1_48.INVALID_ARGUMENT
    return L1_48
  end
  L1_48 = db
  L1_48 = L1_48.getNextRowId
  L2_49 = A0_47
  L1_48 = L1_48(L2_49, static_routesTable)
  L2_49 = _UPVALUE0_
  L2_49 = L2_49.NIL
  if L1_48 == L2_49 then
    L2_49 = _UPVALUE0_
    L2_49 = L2_49.FAILURE
    return L2_49
  end
  L2_49 = db
  L2_49 = L2_49.getAttribute
  L2_49 = L2_49(static_routesTable, "_ROWID_", L1_48, _UPVALUE1_.interface)
  if L2_49 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_48
  end
  return _UPVALUE0_.SUCCESS, L1_48, L2_49
end
function interfaceSet(A0_50, A1_51)
  local L2_52, L3_53, L4_54
  L2_52 = _UPVALUE0_
  L2_52 = L2_52.ipv6ModeGet
  L4_54 = L2_52()
  if tonumber(L4_54) ~= 3 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if A0_50 == _UPVALUE1_.NIL or tonumber(A0_50) == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if A1_51 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if A1_51 ~= "WAN1" and A1_51 ~= "WAN2" then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttribute(static_routesTable, "_ROWID_", A0_50, _UPVALUE2_.interface, A1_51) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_50
  end
  return _UPVALUE1_.SUCCESS, A0_50
end
function interfaceDelete(A0_55, A1_56)
  local L3_57
  L3_57 = _UPVALUE0_
  L3_57 = L3_57.NOT_SUPPORTED
  return L3_57, A0_55
end
function gatewayIpAddressGet()
  local L0_58, L1_59
  L0_58 = db
  L0_58 = L0_58.getNextRowId
  L1_59 = 0
  L0_58 = L0_58(L1_59, static_routesTable)
  L1_59 = _UPVALUE0_
  L1_59 = L1_59.NIL
  if L0_58 == L1_59 then
    L1_59 = _UPVALUE0_
    L1_59 = L1_59.FAILURE
    return L1_59
  end
  L1_59 = db
  L1_59 = L1_59.getAttribute
  L1_59 = L1_59(static_routesTable, "_ROWID_", L0_58, _UPVALUE1_.gatewayIpAddress)
  if L1_59 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_58, L1_59
end
function gatewayIpAddressGetNext(A0_60)
  local L1_61, L2_62
  L1_61 = _UPVALUE0_
  L1_61 = L1_61.NIL
  if A0_60 ~= L1_61 then
    L1_61 = tonumber
    L2_62 = A0_60
    L1_61 = L1_61(L2_62)
    L2_62 = _UPVALUE0_
    L2_62 = L2_62.NIL
  elseif L1_61 == L2_62 then
    L1_61 = _UPVALUE0_
    L1_61 = L1_61.INVALID_ARGUMENT
    return L1_61
  end
  L1_61 = db
  L1_61 = L1_61.getNextRowId
  L2_62 = A0_60
  L1_61 = L1_61(L2_62, static_routesTable)
  L2_62 = _UPVALUE0_
  L2_62 = L2_62.NIL
  if L1_61 == L2_62 then
    L2_62 = _UPVALUE0_
    L2_62 = L2_62.FAILURE
    return L2_62
  end
  L2_62 = db
  L2_62 = L2_62.getAttribute
  L2_62 = L2_62(static_routesTable, "_ROWID_", L1_61, _UPVALUE1_.gatewayIpAddress)
  if L2_62 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_61
  end
  return _UPVALUE0_.SUCCESS, L1_61, L2_62
end
function gatewayIpAddressSet(A0_63, A1_64)
  local L2_65, L3_66, L4_67, L5_68
  L2_65 = _UPVALUE0_
  L2_65 = L2_65.ipv6ModeGet
  L4_67 = L2_65()
  L5_68 = tonumber
  L5_68 = L5_68(L4_67)
  if L5_68 ~= 3 then
    L5_68 = _UPVALUE1_
    L5_68 = L5_68.NOT_SUPPORTED
    return L5_68
  end
  L5_68 = nil
  if A0_63 == _UPVALUE1_.NIL or tonumber(A0_63) == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if A1_64 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  L5_68 = _UPVALUE2_.ipAddressCheck(10, A1_64)
  if L5_68 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttribute(static_routesTable, "_ROWID_", A0_63, _UPVALUE3_.gatewayIpAddress, A1_64) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_63
  end
  return _UPVALUE1_.SUCCESS, A0_63
end
function metricGet()
  local L0_69, L1_70
  L0_69 = db
  L0_69 = L0_69.getNextRowId
  L1_70 = 0
  L0_69 = L0_69(L1_70, static_routesTable)
  L1_70 = _UPVALUE0_
  L1_70 = L1_70.NIL
  if L0_69 == L1_70 then
    L1_70 = _UPVALUE0_
    L1_70 = L1_70.FAILURE
    return L1_70
  end
  L1_70 = db
  L1_70 = L1_70.getAttribute
  L1_70 = L1_70(static_routesTable, "_ROWID_", L0_69, _UPVALUE1_.metric)
  if L1_70 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_69, L1_70
end
function metricGetNext(A0_71)
  local L1_72, L2_73
  L1_72 = _UPVALUE0_
  L1_72 = L1_72.NIL
  if A0_71 ~= L1_72 then
    L1_72 = tonumber
    L2_73 = A0_71
    L1_72 = L1_72(L2_73)
    L2_73 = _UPVALUE0_
    L2_73 = L2_73.NIL
  elseif L1_72 == L2_73 then
    L1_72 = _UPVALUE0_
    L1_72 = L1_72.INVALID_ARGUMENT
    return L1_72
  end
  L1_72 = db
  L1_72 = L1_72.getNextRowId
  L2_73 = A0_71
  L1_72 = L1_72(L2_73, static_routesTable)
  L2_73 = _UPVALUE0_
  L2_73 = L2_73.NIL
  if L1_72 == L2_73 then
    L2_73 = _UPVALUE0_
    L2_73 = L2_73.FAILURE
    return L2_73
  end
  L2_73 = db
  L2_73 = L2_73.getAttribute
  L2_73 = L2_73(static_routesTable, "_ROWID_", L1_72, _UPVALUE1_.metric)
  if L2_73 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_72
  end
  return _UPVALUE0_.SUCCESS, L1_72, L2_73
end
function metricSet(A0_74, A1_75)
  local L2_76, L3_77, L4_78
  L2_76 = _UPVALUE0_
  L2_76 = L2_76.ipv6ModeGet
  L4_78 = L2_76()
  if tonumber(L4_78) ~= 3 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if A0_74 == _UPVALUE1_.NIL or tonumber(A0_74) == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if A1_75 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if tonumber(A1_75) < 2 or tonumber(A1_75) > 15 then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttribute(static_routesTable, "_ROWID_", A0_74, _UPVALUE2_.metric, A1_75) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_74
  end
  return _UPVALUE1_.SUCCESS, A0_74
end
function staticRouteGet()
  local L0_79, L1_80, L2_81, L3_82, L4_83, L5_84, L6_85, L7_86, L8_87
  L0_79 = db
  L0_79 = L0_79.getNextRowId
  L1_80 = 0
  L2_81 = static_routesTable
  L0_79 = L0_79(L1_80, L2_81)
  L1_80 = _UPVALUE0_
  L1_80 = L1_80.NIL
  if L0_79 == L1_80 then
    L1_80 = _UPVALUE0_
    L1_80 = L1_80.FAILURE
    return L1_80
  end
  L1_80 = db
  L1_80 = L1_80.getRow
  L2_81 = static_routesTable
  L3_82 = "_ROWID_"
  L4_83 = L0_79
  L1_80 = L1_80(L2_81, L3_82, L4_83)
  L2_81 = _UPVALUE0_
  L2_81 = L2_81.NIL
  if L1_80 == L2_81 then
    L2_81 = _UPVALUE0_
    L2_81 = L2_81.FAILURE
    L3_82 = L0_79
    return L2_81, L3_82
  end
  L2_81 = static_routesTable
  L3_82 = "."
  L4_83 = _UPVALUE1_
  L4_83 = L4_83.routeName
  L2_81 = L2_81 .. L3_82 .. L4_83
  L2_81 = L1_80[L2_81]
  L3_82 = static_routesTable
  L4_83 = "."
  L5_84 = _UPVALUE1_
  L5_84 = L5_84.active
  L3_82 = L3_82 .. L4_83 .. L5_84
  L3_82 = L1_80[L3_82]
  L4_83 = static_routesTable
  L5_84 = "."
  L6_85 = _UPVALUE1_
  L6_85 = L6_85.destinationIpAddress
  L4_83 = L4_83 .. L5_84 .. L6_85
  L4_83 = L1_80[L4_83]
  L5_84 = static_routesTable
  L6_85 = "."
  L7_86 = _UPVALUE1_
  L7_86 = L7_86.prefixLength
  L5_84 = L5_84 .. L6_85 .. L7_86
  L5_84 = L1_80[L5_84]
  L6_85 = static_routesTable
  L7_86 = "."
  L8_87 = _UPVALUE1_
  L8_87 = L8_87.interface
  L6_85 = L6_85 .. L7_86 .. L8_87
  L6_85 = L1_80[L6_85]
  L7_86 = static_routesTable
  L8_87 = "."
  L7_86 = L7_86 .. L8_87 .. _UPVALUE1_.gatewayIpAddress
  L7_86 = L1_80[L7_86]
  L8_87 = static_routesTable
  L8_87 = L8_87 .. "." .. _UPVALUE1_.metric
  L8_87 = L1_80[L8_87]
  return _UPVALUE0_.SUCCESS, L0_79, L2_81, L3_82, L4_83, L5_84, L6_85, L7_86, L8_87
end
function staticRouteGetCur(A0_88)
  local L1_89, L2_90, L3_91, L4_92, L5_93, L6_94, L7_95, L8_96
  L1_89 = _UPVALUE0_
  L1_89 = L1_89.NIL
  if A0_88 ~= L1_89 then
    L1_89 = tonumber
    L2_90 = A0_88
    L1_89 = L1_89(L2_90)
    L2_90 = _UPVALUE0_
    L2_90 = L2_90.NIL
  elseif L1_89 == L2_90 then
    L1_89 = _UPVALUE0_
    L1_89 = L1_89.INVALID_ARGUMENT
    return L1_89
  end
  L1_89 = db
  L1_89 = L1_89.getRow
  L2_90 = static_routesTable
  L3_91 = "_ROWID_"
  L4_92 = A0_88
  L1_89 = L1_89(L2_90, L3_91, L4_92)
  L2_90 = _UPVALUE0_
  L2_90 = L2_90.NIL
  if L1_89 == L2_90 then
    L2_90 = _UPVALUE0_
    L2_90 = L2_90.FAILURE
    L3_91 = A0_88
    return L2_90, L3_91
  end
  L2_90 = static_routesTable
  L3_91 = "."
  L4_92 = _UPVALUE1_
  L4_92 = L4_92.routeName
  L2_90 = L2_90 .. L3_91 .. L4_92
  L2_90 = L1_89[L2_90]
  L3_91 = static_routesTable
  L4_92 = "."
  L5_93 = _UPVALUE1_
  L5_93 = L5_93.active
  L3_91 = L3_91 .. L4_92 .. L5_93
  L3_91 = L1_89[L3_91]
  L4_92 = static_routesTable
  L5_93 = "."
  L6_94 = _UPVALUE1_
  L6_94 = L6_94.destinationIpAddress
  L4_92 = L4_92 .. L5_93 .. L6_94
  L4_92 = L1_89[L4_92]
  L5_93 = static_routesTable
  L6_94 = "."
  L7_95 = _UPVALUE1_
  L7_95 = L7_95.prefixLength
  L5_93 = L5_93 .. L6_94 .. L7_95
  L5_93 = L1_89[L5_93]
  L6_94 = static_routesTable
  L7_95 = "."
  L8_96 = _UPVALUE1_
  L8_96 = L8_96.interface
  L6_94 = L6_94 .. L7_95 .. L8_96
  L6_94 = L1_89[L6_94]
  L7_95 = static_routesTable
  L8_96 = "."
  L7_95 = L7_95 .. L8_96 .. _UPVALUE1_.gatewayIpAddress
  L7_95 = L1_89[L7_95]
  L8_96 = static_routesTable
  L8_96 = L8_96 .. "." .. _UPVALUE1_.metric
  L8_96 = L1_89[L8_96]
  return _UPVALUE0_.SUCCESS, A0_88, L2_90, L3_91, L4_92, L5_93, L6_94, L7_95, L8_96
end
function staticRouteGetNext(A0_97)
  local L1_98, L2_99, L3_100, L4_101, L5_102, L6_103, L7_104, L8_105, L9_106
  L1_98 = _UPVALUE0_
  L1_98 = L1_98.NIL
  if A0_97 ~= L1_98 then
    L1_98 = tonumber
    L2_99 = A0_97
    L1_98 = L1_98(L2_99)
    L2_99 = _UPVALUE0_
    L2_99 = L2_99.NIL
  elseif L1_98 == L2_99 then
    L1_98 = _UPVALUE0_
    L1_98 = L1_98.INVALID_ARGUMENT
    return L1_98
  end
  L1_98 = db
  L1_98 = L1_98.getNextRowId
  L2_99 = A0_97
  L3_100 = static_routesTable
  L1_98 = L1_98(L2_99, L3_100)
  L2_99 = _UPVALUE0_
  L2_99 = L2_99.NIL
  if L1_98 == L2_99 then
    L2_99 = _UPVALUE0_
    L2_99 = L2_99.FAILURE
    return L2_99
  end
  L2_99 = db
  L2_99 = L2_99.getRow
  L3_100 = static_routesTable
  L4_101 = "_ROWID_"
  L5_102 = L1_98
  L2_99 = L2_99(L3_100, L4_101, L5_102)
  L3_100 = _UPVALUE0_
  L3_100 = L3_100.NIL
  if L2_99 == L3_100 then
    L3_100 = _UPVALUE0_
    L3_100 = L3_100.FAILURE
    L4_101 = L1_98
    return L3_100, L4_101
  end
  L3_100 = static_routesTable
  L4_101 = "."
  L5_102 = _UPVALUE1_
  L5_102 = L5_102.routeName
  L3_100 = L3_100 .. L4_101 .. L5_102
  L3_100 = L2_99[L3_100]
  L4_101 = static_routesTable
  L5_102 = "."
  L6_103 = _UPVALUE1_
  L6_103 = L6_103.active
  L4_101 = L4_101 .. L5_102 .. L6_103
  L4_101 = L2_99[L4_101]
  L5_102 = static_routesTable
  L6_103 = "."
  L7_104 = _UPVALUE1_
  L7_104 = L7_104.destinationIpAddress
  L5_102 = L5_102 .. L6_103 .. L7_104
  L5_102 = L2_99[L5_102]
  L6_103 = static_routesTable
  L7_104 = "."
  L8_105 = _UPVALUE1_
  L8_105 = L8_105.prefixLength
  L6_103 = L6_103 .. L7_104 .. L8_105
  L6_103 = L2_99[L6_103]
  L7_104 = static_routesTable
  L8_105 = "."
  L9_106 = _UPVALUE1_
  L9_106 = L9_106.interface
  L7_104 = L7_104 .. L8_105 .. L9_106
  L7_104 = L2_99[L7_104]
  L8_105 = static_routesTable
  L9_106 = "."
  L8_105 = L8_105 .. L9_106 .. _UPVALUE1_.gatewayIpAddress
  L8_105 = L2_99[L8_105]
  L9_106 = static_routesTable
  L9_106 = L9_106 .. "." .. _UPVALUE1_.metric
  L9_106 = L2_99[L9_106]
  return _UPVALUE0_.SUCCESS, L1_98, L3_100, L4_101, L5_102, L6_103, L7_104, L8_105, L9_106
end
function staticRouteSet(A0_107, A1_108, A2_109, A3_110, A4_111, A5_112, A6_113, A7_114)
  local L8_115, L9_116, L10_117, L11_118, L12_119, L13_120, L14_121, L15_122, L16_123
  L8_115 = _UPVALUE0_
  L8_115 = L8_115.ipv6ModeGet
  L10_117 = L8_115()
  L11_118 = tonumber
  L12_119 = L10_117
  L11_118 = L11_118(L12_119)
  if L11_118 ~= 3 then
    L11_118 = _UPVALUE1_
    L11_118 = L11_118.IPV6MODE_NOT_ENABLED
    return L11_118
  end
  L11_118 = nil
  L12_119 = _UPVALUE2_
  L12_119 = L12_119.NIL
  if A0_107 ~= L12_119 then
    L12_119 = tonumber
    L13_120 = A0_107
    L12_119 = L12_119(L13_120)
    L13_120 = _UPVALUE2_
    L13_120 = L13_120.NIL
  elseif L12_119 == L13_120 then
    L12_119 = _UPVALUE2_
    L12_119 = L12_119.INVALID_ARGUMENT
    L13_120 = A0_107
    return L12_119, L13_120
  end
  L12_119 = _UPVALUE2_
  L12_119 = L12_119.NIL
  if A1_108 == L12_119 then
    L12_119 = _UPVALUE3_
    L12_119 = L12_119.ROUTE6_NAME_NIL
    return L12_119
  end
  L12_119 = _UPVALUE2_
  L12_119 = L12_119.NIL
  if A2_109 == L12_119 then
    L12_119 = _UPVALUE3_
    L12_119 = L12_119.ROUTE6_ACTIVE_NIL
    return L12_119
  end
  L12_119 = _UPVALUE2_
  L12_119 = L12_119.NIL
  if A3_110 == L12_119 then
    L12_119 = _UPVALUE3_
    L12_119 = L12_119.ROUTE6_DEST_IP_NIL
    return L12_119
  end
  L12_119 = _UPVALUE4_
  L12_119 = L12_119.ipAddressCheck
  L13_120 = 10
  L14_121 = A3_110
  L12_119 = L12_119(L13_120, L14_121)
  L11_118 = L12_119
  L12_119 = _UPVALUE2_
  L12_119 = L12_119.SUCCESS
  if L11_118 ~= L12_119 then
    L12_119 = _UPVALUE3_
    L12_119 = L12_119.INVALID_ROUTE6_DEST_IP
    return L12_119
  end
  L12_119 = _UPVALUE2_
  L12_119 = L12_119.NIL
  if A4_111 == L12_119 then
    L12_119 = _UPVALUE3_
    L12_119 = L12_119.ROUTE6_PREFIXLENGTH_NIL
    return L12_119
  end
  L12_119 = tonumber
  L13_120 = A4_111
  L12_119 = L12_119(L13_120)
  if L12_119 < 0 or L12_119 > 128 then
    L13_120 = _UPVALUE3_
    L13_120 = L13_120.INVALID_ROUTE6_PREFIXLENGTH
    return L13_120
  end
  L13_120 = _UPVALUE2_
  L13_120 = L13_120.NIL
  if A5_112 == L13_120 then
    L13_120 = _UPVALUE3_
    L13_120 = L13_120.ROUTE6_INTERFACE_NIL
    return L13_120
  end
  if A5_112 ~= "LAN" and A5_112 ~= "WAN1" and A5_112 ~= "WAN2" and A5_112 ~= "sit0-WAN1" and A5_112 ~= "sit0-WAN2" then
    L13_120 = _UPVALUE3_
    L13_120 = L13_120.INVALID_ROUTE6_INTERFACE
    return L13_120
  end
  L13_120 = _UPVALUE2_
  L13_120 = L13_120.NIL
  if A6_113 == L13_120 then
    L13_120 = _UPVALUE3_
    L13_120 = L13_120.ROUTE6_GW_NIL
    return L13_120
  end
  L13_120 = _UPVALUE4_
  L13_120 = L13_120.ipAddressCheck
  L14_121 = 10
  L13_120 = L13_120(L14_121, L15_122)
  L11_118 = L13_120
  L13_120 = _UPVALUE2_
  L13_120 = L13_120.SUCCESS
  if L11_118 ~= L13_120 then
    L13_120 = _UPVALUE3_
    L13_120 = L13_120.INVALID_ROUTE6_GW
    return L13_120
  end
  L13_120 = _UPVALUE2_
  L13_120 = L13_120.NIL
  if A7_114 == L13_120 then
    L13_120 = _UPVALUE3_
    L13_120 = L13_120.ROUTE6_METRIC_NIL
    return L13_120
  end
  L13_120 = tonumber
  L14_121 = A7_114
  L13_120 = L13_120(L14_121)
  if L13_120 < 2 or L13_120 > 15 then
    L14_121 = _UPVALUE3_
    L14_121 = L14_121.INVALID_ROUTE6_METRIC
    return L14_121
  end
  L14_121 = db
  L14_121 = L14_121.getTable
  L14_121 = L14_121(L15_122)
  for _FORV_18_, _FORV_19_ in L15_122(L16_123) do
    if _FORV_19_[static_routesTable .. "." .. _UPVALUE5_.destinationIpAddress] == A3_110 and _FORV_19_[static_routesTable .. "." .. _UPVALUE5_.metric] == A7_114 and _FORV_19_[static_routesTable .. "." .. _UPVALUE6_] ~= A0_107 then
      return _UPVALUE3_.INVALID_ROUTE6_DEST_IP_DEST_IP_ALREADY_EXIST
    end
  end
  if L16_123 > 0 then
    for _FORV_20_, _FORV_21_ in pairs(L15_122) do
      if L16_123 == _UPVALUE2_.SUCCESS then
        break
      end
    end
    if L16_123 == _UPVALUE2_.FAILURE then
      return _UPVALUE3_.GATEWAY_NOT_IN_INTERFACE_NETWORK
    end
  elseif L16_123 == 0 then
    return L16_123
  end
  L16_123[static_routesTable .. "." .. _UPVALUE5_.routeName] = A1_108
  L16_123[static_routesTable .. "." .. _UPVALUE5_.active] = A2_109
  L16_123[static_routesTable .. "." .. _UPVALUE5_.destinationIpAddress] = A3_110
  L16_123[static_routesTable .. "." .. _UPVALUE5_.prefixLength] = A4_111
  L16_123[static_routesTable .. "." .. _UPVALUE5_.interface] = A5_112
  L16_123[static_routesTable .. "." .. _UPVALUE5_.gatewayIpAddress] = A6_113
  L16_123[static_routesTable .. "." .. _UPVALUE5_.metric] = A7_114
  if db.update(static_routesTable, L16_123, A0_107) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_107
  end
  return _UPVALUE2_.SUCCESS, A0_107
end
function staticRouteCreate(A0_124, A1_125, A2_126, A3_127, A4_128, A5_129, A6_130)
  local L7_131, L8_132, L9_133, L10_134, L11_135, L12_136, L13_137, L14_138, L15_139, L16_140, L17_141, L18_142, L19_143, L20_144
  L7_131 = _UPVALUE0_
  L7_131 = L7_131.ipv6ModeGet
  L9_133 = L7_131()
  L10_134 = tonumber
  L11_135 = L9_133
  L10_134 = L10_134(L11_135)
  if L10_134 ~= 3 then
    L10_134 = _UPVALUE1_
    L10_134 = L10_134.IPV6MODE_NOT_ENABLED
    return L10_134
  end
  L10_134 = nil
  L11_135 = _UPVALUE2_
  L11_135 = L11_135.NIL
  if A0_124 == L11_135 then
    L11_135 = _UPVALUE3_
    L11_135 = L11_135.ROUTE6_NAME_NIL
    return L11_135
  end
  L11_135 = _UPVALUE2_
  L11_135 = L11_135.NIL
  if A1_125 == L11_135 then
    L11_135 = _UPVALUE3_
    L11_135 = L11_135.ROUTE6_ACTIVE_NIL
    return L11_135
  end
  L11_135 = _UPVALUE2_
  L11_135 = L11_135.NIL
  if A2_126 == L11_135 then
    L11_135 = _UPVALUE3_
    L11_135 = L11_135.ROUTE6_DEST_IP_NIL
    return L11_135
  end
  L11_135 = _UPVALUE4_
  L11_135 = L11_135.ipAddressCheck
  L12_136 = 10
  L13_137 = A2_126
  L11_135 = L11_135(L12_136, L13_137)
  L10_134 = L11_135
  L11_135 = _UPVALUE2_
  L11_135 = L11_135.SUCCESS
  if L10_134 ~= L11_135 then
    L11_135 = _UPVALUE3_
    L11_135 = L11_135.INVALID_ROUTE6_DEST_IP
    return L11_135
  end
  L11_135 = _UPVALUE2_
  L11_135 = L11_135.NIL
  if A3_127 == L11_135 then
    L11_135 = _UPVALUE3_
    L11_135 = L11_135.ROUTE6_PREFIXLENGTH_NIL
    return L11_135
  end
  L11_135 = tonumber
  L12_136 = A3_127
  L11_135 = L11_135(L12_136)
  if L11_135 < 0 or L11_135 > 128 then
    L12_136 = _UPVALUE3_
    L12_136 = L12_136.INVALID_ROUTE6_PREFIXLENGTH
    return L12_136
  end
  L12_136 = _UPVALUE2_
  L12_136 = L12_136.NIL
  if A4_128 == L12_136 then
    L12_136 = _UPVALUE3_
    L12_136 = L12_136.ROUTE6_INTERFACE_NIL
    return L12_136
  end
  if A4_128 ~= "LAN" and A4_128 ~= "WAN1" and A4_128 ~= "WAN2" and A4_128 ~= "sit0-WAN1" and A4_128 ~= "sit0-WAN2" then
    L12_136 = _UPVALUE3_
    L12_136 = L12_136.INVALID_ROUTE6_INTERFACE
    return L12_136
  end
  L12_136 = _UPVALUE2_
  L12_136 = L12_136.NIL
  if A5_129 == L12_136 then
    L12_136 = _UPVALUE3_
    L12_136 = L12_136.ROUTE6_GW_NIL
    return L12_136
  end
  L12_136 = _UPVALUE4_
  L12_136 = L12_136.ipAddressCheck
  L13_137 = 10
  L12_136 = L12_136(L13_137, L14_138)
  L10_134 = L12_136
  L12_136 = _UPVALUE2_
  L12_136 = L12_136.SUCCESS
  if L10_134 ~= L12_136 then
    L12_136 = _UPVALUE3_
    L12_136 = L12_136.INVALID_ROUTE6_GW
    return L12_136
  end
  L12_136 = _UPVALUE2_
  L12_136 = L12_136.NIL
  if A6_130 == L12_136 then
    L12_136 = _UPVALUE3_
    L12_136 = L12_136.ROUTE6_METRIC_NIL
    return L12_136
  end
  L12_136 = tonumber
  L13_137 = A6_130
  L12_136 = L12_136(L13_137)
  if L12_136 < 2 or L12_136 > 15 then
    L13_137 = _UPVALUE3_
    L13_137 = L13_137.INVALID_ROUTE6_METRIC
    return L13_137
  end
  L13_137 = db
  L13_137 = L13_137.getTable
  L13_137 = L13_137(L14_138)
  for L17_141, L18_142 in L14_138(L15_139) do
    L19_143 = static_routesTable
    L20_144 = "."
    L19_143 = L19_143 .. L20_144 .. _UPVALUE5_.routeName
    L19_143 = L18_142[L19_143]
    if L19_143 == A0_124 then
      L19_143 = _UPVALUE3_
      L19_143 = L19_143.INVALID_ROUTE6_DEST_IP_DEST_IP_ALREADY_EXIST
      return L19_143
    end
    L19_143 = static_routesTable
    L20_144 = "."
    L19_143 = L19_143 .. L20_144 .. _UPVALUE5_.destinationIpAddress
    L19_143 = L18_142[L19_143]
    if L19_143 == A2_126 then
      L19_143 = static_routesTable
      L20_144 = "."
      L19_143 = L19_143 .. L20_144 .. _UPVALUE5_.metric
      L19_143 = L18_142[L19_143]
      if L19_143 == A6_130 then
        L19_143 = _UPVALUE3_
        L19_143 = L19_143.INVALID_ROUTE6_DEST_IP_DEST_IP_ALREADY_EXIST
        return L19_143
      end
    end
  end
  L19_143 = "' and "
  L20_144 = attributesIpv6
  L20_144 = L20_144.addressFamily
  if L15_139 > 0 then
    for L19_143, L20_144 in L16_140(L17_141) do
      if L15_139 == _UPVALUE2_.SUCCESS then
        break
      end
    end
    if L15_139 == L16_140 then
      return L16_140
    end
  elseif L15_139 == 0 then
    return L15_139
  end
  L15_139[L16_140] = A0_124
  L15_139[L16_140] = A1_125
  L15_139[L16_140] = A2_126
  L15_139[L16_140] = A3_127
  L15_139[L16_140] = A4_128
  L15_139[L16_140] = A5_129
  L15_139[L16_140] = A6_130
  L19_143 = " !='WAN1PPPOE2'"
  L19_143 = L16_140
  if L17_141 ~= nil then
    L19_143 = _UPVALUE8_
    if L18_142 >= L19_143 then
      return L18_142
    end
  end
  L19_143 = static_routesTable
  L20_144 = L15_139
  L19_143 = L18_142(L19_143, L20_144)
  L20_144 = _UPVALUE2_
  L20_144 = L20_144.NIL
  if L18_142 == L20_144 then
    L20_144 = _UPVALUE2_
    L20_144 = L20_144.FAILURE
    return L20_144, cookie
  end
  L20_144 = db
  L20_144 = L20_144.getAttribute
  L20_144 = L20_144(static_routesTable, _UPVALUE5_.routeName, A0_124, "_ROWID_")
  return _UPVALUE2_.SUCCESS, L20_144
end
function staticRouteDelete(A0_145)
  local L1_146, L2_147, L3_148
  L1_146 = _UPVALUE0_
  L1_146 = L1_146.ipv6ModeGet
  L3_148 = L1_146()
  if tonumber(L3_148) ~= 3 then
    return _UPVALUE1_.IPV6MODE_NOT_ENABLED
  end
  if A0_145 == _UPVALUE2_.NIL or tonumber(A0_145) == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if db.deleteRow(static_routesTable, "_ROWID_", A0_145) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_145
  end
  return _UPVALUE2_.SUCCESS, A0_145
end
function staticRoutesGetAll()
  local L0_149
  L0_149 = db
  L0_149 = L0_149.getTable
  L0_149 = L0_149(static_routesTable, false)
  if L0_149 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_149
end
function staticRoutesDeleteAll()
  if db.deleteAllRows(static_routesTable) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
