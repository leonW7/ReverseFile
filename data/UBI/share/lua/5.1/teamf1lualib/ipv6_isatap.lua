local L0_0
L0_0 = module
L0_0("com.teamf1.core.ipv6.isatap", package.seeall)
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
L0_0("teamf1lualib/returnCodes_isatap")
L0_0 = require
L0_0("teamf1lualib/returnCodes_ipv6_nimf")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
isatapTable = "isatapTunnel"
ifStaticTable = "ifStatic"
;({}).feature = "isatapTunnelStatus"
;({}).prefix = "isatapPrefix"
;({}).useLanAsEndpoint = "useLanAddress"
;({}).endPointAddress = "localIPv4Address"
;({}).transportIfName = "transportIfName"
;({}).ipv6Mode = "netWorkMode"
;({}).logicalIfName = "LogicalIfName"
;({}).addrFamily = "AddressFamily"
;({}).ipAddr = "StaticIp"
STATUS_ENABLE = 1
STATUS_DISABLE = 0
function isfeatureEnabled()
  local L0_1, L1_2
  L0_1 = db
  L0_1 = L0_1.getNextRowId
  L1_2 = 0
  L0_1 = L0_1(L1_2, isatapTable)
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.NIL
  if L0_1 == L1_2 then
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.FAILURE
    return L1_2
  end
  L1_2 = tonumber
  L1_2 = L1_2(L0_1)
  if L1_2 == _UPVALUE0_.NIL then
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.INVALID_ARGUMENT
    return L1_2
  end
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(isatapTable, "_ROWID_", L0_1, _UPVALUE1_.feature)
  if L1_2 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_1, L1_2
end
function isfeatureEnabledNext(A0_3)
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
  L1_4 = nil
  L2_5 = db
  L2_5 = L2_5.getNextRowId
  L2_5 = L2_5(A0_3, isatapTable)
  L1_4 = L2_5
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if L1_4 == L2_5 then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.TABLE_IS_FULL
    return L2_5, A0_3
  end
  L2_5 = db
  L2_5 = L2_5.getAttribute
  L2_5 = L2_5(isatapTable, "_ROWID_", L1_4, _UPVALUE1_.feature)
  if L2_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L2_5
end
function featureEnable(A0_6)
  local L1_7, L2_8, L3_9, L4_10
  L1_7 = _UPVALUE0_
  L1_7 = L1_7.ipv6ModeGet
  L3_9 = L1_7()
  L4_10 = tonumber
  L4_10 = L4_10(L3_9)
  if L4_10 ~= 3 then
    L4_10 = _UPVALUE1_
    L4_10 = L4_10.NOT_SUPPORTED
    return L4_10
  end
  L4_10 = _UPVALUE1_
  L4_10 = L4_10.NIL
  if A0_6 ~= L4_10 then
    L4_10 = tonumber
    L4_10 = L4_10(A0_6)
  elseif L4_10 == _UPVALUE1_.NIL then
    L4_10 = _UPVALUE1_
    L4_10 = L4_10.INVALID_ARGUMENT
    return L4_10
  end
  L4_10 = "_ROWID_ = "
  L4_10 = L4_10 .. A0_6
  if db.setAttributeWhere(isatapTable, L4_10, _UPVALUE2_.feature, STATUS_ENABLE) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_6
  end
  return _UPVALUE1_.SUCCESS, A0_6
end
function featureDisable(A0_11)
  local L1_12, L2_13, L3_14, L4_15
  L1_12 = _UPVALUE0_
  L1_12 = L1_12.ipv6ModeGet
  L3_14 = L1_12()
  L4_15 = tonumber
  L4_15 = L4_15(L3_14)
  if L4_15 ~= 3 then
    L4_15 = _UPVALUE1_
    L4_15 = L4_15.NOT_SUPPORTED
    return L4_15
  end
  L4_15 = _UPVALUE1_
  L4_15 = L4_15.NIL
  if A0_11 ~= L4_15 then
    L4_15 = tonumber
    L4_15 = L4_15(A0_11)
  elseif L4_15 == _UPVALUE1_.NIL then
    L4_15 = _UPVALUE1_
    L4_15 = L4_15.INVALID_ARGUMENT
    return L4_15
  end
  L4_15 = "_ROWID_ = "
  L4_15 = L4_15 .. A0_11
  if db.setAttributeWhere(isatapTable, L4_15, _UPVALUE2_.feature, STATUS_DISABLE) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_11
  end
  return _UPVALUE1_.SUCCESS, A0_11
end
function prefixGet()
  local L0_16, L1_17
  L0_16 = db
  L0_16 = L0_16.getNextRowId
  L1_17 = 0
  L0_16 = L0_16(L1_17, isatapTable)
  L1_17 = _UPVALUE0_
  L1_17 = L1_17.NIL
  if L0_16 == L1_17 then
    L1_17 = _UPVALUE0_
    L1_17 = L1_17.EMPTY_TABLE
    return L1_17
  end
  L1_17 = tonumber
  L1_17 = L1_17(L0_16)
  if L1_17 == _UPVALUE0_.NIL then
    L1_17 = _UPVALUE0_
    L1_17 = L1_17.INVALID_ARGUMENT
    return L1_17
  end
  L1_17 = db
  L1_17 = L1_17.getAttribute
  L1_17 = L1_17(isatapTable, "_ROWID_", L0_16, _UPVALUE1_.prefix)
  if L1_17 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_16, L1_17
end
function prefixGetNext(A0_18)
  local L1_19, L2_20
  L1_19 = _UPVALUE0_
  L1_19 = L1_19.NIL
  if A0_18 ~= L1_19 then
    L1_19 = tonumber
    L2_20 = A0_18
    L1_19 = L1_19(L2_20)
    L2_20 = _UPVALUE0_
    L2_20 = L2_20.NIL
  elseif L1_19 == L2_20 then
    L1_19 = _UPVALUE0_
    L1_19 = L1_19.INVALID_ARGUMENT
    return L1_19
  end
  L1_19 = nil
  L2_20 = db
  L2_20 = L2_20.getNextRowId
  L2_20 = L2_20(A0_18, isatapTable)
  L1_19 = L2_20
  L2_20 = _UPVALUE0_
  L2_20 = L2_20.NIL
  if L1_19 == L2_20 then
    L2_20 = _UPVALUE0_
    L2_20 = L2_20.TABLE_IS_FULL
    return L2_20, A0_18
  end
  L2_20 = db
  L2_20 = L2_20.getAttribute
  L2_20 = L2_20(isatapTable, "_ROWID_", L1_19, _UPVALUE1_.prefix)
  if L2_20 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_19
  end
  return _UPVALUE0_.SUCCESS, L1_19, L2_20
end
function prefixSet(A0_21, A1_22)
  local L2_23, L3_24, L4_25, L5_26, L6_27
  L2_23 = _UPVALUE0_
  L2_23 = L2_23.ipv6ModeGet
  L4_25 = L2_23()
  L5_26 = tonumber
  L6_27 = L4_25
  L5_26 = L5_26(L6_27)
  if L5_26 ~= 3 then
    L5_26 = _UPVALUE1_
    L5_26 = L5_26.NOT_SUPPORTED
    return L5_26
  end
  L5_26 = nil
  L6_27 = _UPVALUE1_
  L6_27 = L6_27.NIL
  if A0_21 ~= L6_27 then
    L6_27 = tonumber
    L6_27 = L6_27(A0_21)
  elseif L6_27 == _UPVALUE1_.NIL then
    L6_27 = _UPVALUE1_
    L6_27 = L6_27.INVALID_ARGUMENT
    return L6_27
  end
  L6_27 = _UPVALUE1_
  L6_27 = L6_27.NIL
  if A1_22 == L6_27 then
    L6_27 = _UPVALUE1_
    L6_27 = L6_27.INVALID_ARGUMENT
    return L6_27
  end
  L6_27 = "_ROWID_ = "
  L6_27 = L6_27 .. A0_21
  if db.setAttributeWhere(isatapTable, L6_27, _UPVALUE2_.prefix, A1_22) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_21
  end
  return _UPVALUE1_.SUCCESS, A0_21
end
function prefixDelete(A0_28)
  local L2_29
  L2_29 = _UPVALUE0_
  L2_29 = L2_29.NOT_SUPPORTED
  return L2_29, A0_28
end
function isuseLanAsEndpointEnabled()
  local L0_30, L1_31
  L0_30 = db
  L0_30 = L0_30.getNextRowId
  L1_31 = 0
  L0_30 = L0_30(L1_31, isatapTable)
  L1_31 = _UPVALUE0_
  L1_31 = L1_31.NIL
  if L0_30 == L1_31 then
    L1_31 = EMPTY_TABLE
    return L1_31
  end
  L1_31 = tonumber
  L1_31 = L1_31(L0_30)
  if L1_31 == _UPVALUE0_.NIL then
    L1_31 = _UPVALUE0_
    L1_31 = L1_31.INVALID_ARGUMENT
    return L1_31
  end
  L1_31 = db
  L1_31 = L1_31.getAttribute
  L1_31 = L1_31(isatapTable, "_ROWID_", L0_30, _UPVALUE1_.useLanAsEndpoint)
  if L1_31 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_30, L1_31
end
function isuseLanAsEndpointEnabledNext(A0_32)
  local L1_33, L2_34
  L1_33 = _UPVALUE0_
  L1_33 = L1_33.NIL
  if A0_32 ~= L1_33 then
    L1_33 = tonumber
    L2_34 = A0_32
    L1_33 = L1_33(L2_34)
    L2_34 = _UPVALUE0_
    L2_34 = L2_34.NIL
  elseif L1_33 == L2_34 then
    L1_33 = _UPVALUE0_
    L1_33 = L1_33.INVALID_ARGUMENT
    return L1_33
  end
  L1_33 = nil
  L2_34 = db
  L2_34 = L2_34.getNextRowId
  L2_34 = L2_34(A0_32, isatapTable)
  L1_33 = L2_34
  L2_34 = _UPVALUE0_
  L2_34 = L2_34.NIL
  if L1_33 == L2_34 then
    L2_34 = _UPVALUE0_
    L2_34 = L2_34.TABLE_IS_FULL
    return L2_34, A0_32
  end
  L2_34 = db
  L2_34 = L2_34.getAttribute
  L2_34 = L2_34(isatapTable, "_ROWID_", L1_33, _UPVALUE1_.useLanAsEndpoint)
  if L2_34 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_33
  end
  return _UPVALUE0_.SUCCESS, L1_33, L2_34
end
function useLanAsEndpointEnable(A0_35)
  local L1_36, L2_37, L3_38, L4_39, L5_40
  L1_36 = _UPVALUE0_
  L1_36 = L1_36.ipv6ModeGet
  L3_38 = L1_36()
  L4_39 = tonumber
  L5_40 = L3_38
  L4_39 = L4_39(L5_40)
  if L4_39 ~= 3 then
    L4_39 = _UPVALUE1_
    L4_39 = L4_39.NOT_SUPPORTED
    return L4_39
  end
  L4_39 = _UPVALUE1_
  L4_39 = L4_39.NIL
  if A0_35 ~= L4_39 then
    L4_39 = tonumber
    L5_40 = A0_35
    L4_39 = L4_39(L5_40)
    L5_40 = _UPVALUE1_
    L5_40 = L5_40.NIL
  elseif L4_39 == L5_40 then
    L4_39 = _UPVALUE1_
    L4_39 = L4_39.INVALID_ARGUMENT
    return L4_39
  end
  L4_39, L5_40 = nil, nil
  L4_39, L5_40 = db.setAttribute(isatapTable, "_ROWID_", A0_35, _UPVALUE2_.useLanAsEndpoint, STATUS_ENABLE)
  if L4_39 == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_35
  end
  return _UPVALUE1_.SUCCESS, A0_35
end
function useLanAsEndpointDisable(A0_41)
  local L1_42, L2_43, L3_44, L4_45, L5_46
  L1_42 = _UPVALUE0_
  L1_42 = L1_42.ipv6ModeGet
  L3_44 = L1_42()
  L4_45 = tonumber
  L5_46 = L3_44
  L4_45 = L4_45(L5_46)
  if L4_45 ~= 3 then
    L4_45 = _UPVALUE1_
    L4_45 = L4_45.NOT_SUPPORTED
    return L4_45
  end
  L4_45 = _UPVALUE1_
  L4_45 = L4_45.NIL
  if A0_41 ~= L4_45 then
    L4_45 = tonumber
    L5_46 = A0_41
    L4_45 = L4_45(L5_46)
    L5_46 = _UPVALUE1_
    L5_46 = L5_46.NIL
  elseif L4_45 == L5_46 then
    L4_45 = _UPVALUE1_
    L4_45 = L4_45.INVALID_ARGUMENT
    return L4_45
  end
  L4_45 = "_ROWID_ = "
  L5_46 = A0_41
  L4_45 = L4_45 .. L5_46
  L5_46 = nil
  L5_46, status = db.setAttributeWhere(isatapTable, L4_45, _UPVALUE2_.useLanAsEndpoint, STATUS_DISABLE)
  if L5_46 == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_41
  end
  return _UPVALUE1_.SUCCESS, A0_41
end
function endPointAddressGet()
  local L0_47, L1_48
  L0_47 = db
  L0_47 = L0_47.getNextRowId
  L1_48 = 0
  L0_47 = L0_47(L1_48, isatapTable)
  L1_48 = _UPVALUE0_
  L1_48 = L1_48.NIL
  if L0_47 == L1_48 then
    L1_48 = _UPVALUE0_
    L1_48 = L1_48.EMPTY_TABLE
    return L1_48
  end
  L1_48 = tonumber
  L1_48 = L1_48(L0_47)
  if L1_48 == _UPVALUE0_.NIL then
    L1_48 = _UPVALUE0_
    L1_48 = L1_48.INVALID_ARGUMENT
    return L1_48
  end
  L1_48 = db
  L1_48 = L1_48.getAttribute
  L1_48 = L1_48(isatapTable, "_ROWID_", L0_47, _UPVALUE1_.endPointAddress)
  if L1_48 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_47, L1_48
end
function endPointAddressGetNext(A0_49)
  local L1_50, L2_51
  L1_50 = _UPVALUE0_
  L1_50 = L1_50.NIL
  if A0_49 ~= L1_50 then
    L1_50 = tonumber
    L2_51 = A0_49
    L1_50 = L1_50(L2_51)
    L2_51 = _UPVALUE0_
    L2_51 = L2_51.NIL
  elseif L1_50 == L2_51 then
    L1_50 = _UPVALUE0_
    L1_50 = L1_50.INVALID_ARGUMENT
    return L1_50
  end
  L1_50 = nil
  L2_51 = db
  L2_51 = L2_51.getNextRowId
  L2_51 = L2_51(A0_49, isatapTable)
  L1_50 = L2_51
  L2_51 = _UPVALUE0_
  L2_51 = L2_51.NIL
  if L1_50 == L2_51 then
    L2_51 = _UPVALUE0_
    L2_51 = L2_51.TABLE_IS_FULL
    return L2_51, A0_49
  end
  L2_51 = db
  L2_51 = L2_51.getAttribute
  L2_51 = L2_51(isatapTable, "_ROWID_", L1_50, _UPVALUE1_.endPointAddress)
  if L2_51 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_50
  end
  return _UPVALUE0_.SUCCESS, L1_50, L2_51
end
function endPointAddressSet(A0_52, A1_53)
  local L2_54, L3_55, L4_56, L5_57, L6_58, L7_59, L8_60, L9_61, L10_62, L11_63
  L2_54 = _UPVALUE0_
  L2_54 = L2_54.ipv6ModeGet
  L4_56 = L2_54()
  L5_57 = tonumber
  L6_58 = L4_56
  L5_57 = L5_57(L6_58)
  if L5_57 ~= 3 then
    L5_57 = _UPVALUE1_
    L5_57 = L5_57.NOT_SUPPORTED
    return L5_57
  end
  L5_57 = nil
  L6_58 = _UPVALUE1_
  L6_58 = L6_58.NIL
  if A0_52 ~= L6_58 then
    L6_58 = tonumber
    L7_59 = A0_52
    L6_58 = L6_58(L7_59)
    L7_59 = _UPVALUE1_
    L7_59 = L7_59.NIL
  elseif L6_58 == L7_59 then
    L6_58 = _UPVALUE1_
    L6_58 = L6_58.INVALID_ARGUMENT
    return L6_58
  end
  L6_58 = _UPVALUE1_
  L6_58 = L6_58.NIL
  if A1_53 == L6_58 then
    L6_58 = _UPVALUE1_
    L6_58 = L6_58.INVALID_ARGUMENT
    return L6_58
  end
  L6_58 = isuseLanAsEndpointEnabledNext
  L7_59 = A0_52 - 1
  L8_60 = L6_58(L7_59)
  L9_61 = tonumber
  L10_62 = L8_60
  L9_61 = L9_61(L10_62)
  if L9_61 == 1 then
    L9_61 = _UPVALUE1_
    L9_61 = L9_61.NOT_SUPPORTED
    return L9_61
  end
  L9_61, L10_62 = nil, nil
  L11_63 = "_ROWID_ = "
  L11_63 = L11_63 .. A0_52
  L9_61, L10_62 = db.setAttributeWhere(isatapTable, L11_63, _UPVALUE2_.endPointAddress, A1_53)
  if L9_61 == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_52
  end
  return _UPVALUE1_.SUCCESS, A0_52
end
function tunnelGet()
  local L0_64, L1_65, L2_66, L3_67, L4_68, L5_69
  L0_64 = db
  L0_64 = L0_64.getNextRowId
  L1_65 = 0
  L2_66 = isatapTable
  L0_64 = L0_64(L1_65, L2_66)
  L1_65 = _UPVALUE0_
  L1_65 = L1_65.NIL
  if L0_64 == L1_65 then
    L1_65 = _UPVALUE0_
    L1_65 = L1_65.FAILURE
    return L1_65
  end
  L1_65 = tonumber
  L2_66 = L0_64
  L1_65 = L1_65(L2_66)
  L2_66 = _UPVALUE0_
  L2_66 = L2_66.NIL
  if L1_65 == L2_66 then
    L1_65 = _UPVALUE0_
    L1_65 = L1_65.INVALID_ARGUMENT
    return L1_65
  end
  L1_65 = {}
  L2_66 = "_ROWID_ = "
  L3_67 = L0_64
  L2_66 = L2_66 .. L3_67
  L3_67 = db
  L3_67 = L3_67.getRowWhere
  L4_68 = isatapTable
  L5_69 = L2_66
  L3_67 = L3_67(L4_68, L5_69)
  L1_65 = L3_67
  L3_67 = isatapTable
  L4_68 = "."
  L5_69 = _UPVALUE1_
  L5_69 = L5_69.prefix
  L3_67 = L3_67 .. L4_68 .. L5_69
  L3_67 = L1_65[L3_67]
  L4_68 = isatapTable
  L5_69 = "."
  L4_68 = L4_68 .. L5_69 .. _UPVALUE1_.useLanAsEndpoint
  L4_68 = L1_65[L4_68]
  L5_69 = isatapTable
  L5_69 = L5_69 .. "." .. _UPVALUE1_.endPointAddress
  L5_69 = L1_65[L5_69]
  if L3_67 == _UPVALUE0_.NIL or L4_68 == _UPVALUE0_.NIL or L5_69 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_64, L3_67, L4_68, L5_69
end
function tunnelGetNext(A0_70)
  local L1_71, L2_72, L3_73, L4_74, L5_75, L6_76
  L1_71 = _UPVALUE0_
  L1_71 = L1_71.NIL
  if A0_70 ~= L1_71 then
    L1_71 = tonumber
    L2_72 = A0_70
    L1_71 = L1_71(L2_72)
    L2_72 = _UPVALUE0_
    L2_72 = L2_72.NIL
  elseif L1_71 == L2_72 then
    L1_71 = _UPVALUE0_
    L1_71 = L1_71.INVALID_ARGUMENT
    return L1_71
  end
  L1_71 = nil
  L2_72 = db
  L2_72 = L2_72.getNextRowId
  L3_73 = A0_70
  L4_74 = isatapTable
  L2_72 = L2_72(L3_73, L4_74)
  L1_71 = L2_72
  L2_72 = _UPVALUE0_
  L2_72 = L2_72.NIL
  if L1_71 == L2_72 then
    L2_72 = _UPVALUE0_
    L2_72 = L2_72.FAILURE
    L3_73 = A0_70
    return L2_72, L3_73
  end
  L2_72 = {}
  L3_73 = "_ROWID_ = "
  L4_74 = L1_71
  L3_73 = L3_73 .. L4_74
  L4_74 = db
  L4_74 = L4_74.getRowWhere
  L5_75 = isatapTable
  L6_76 = L3_73
  L4_74 = L4_74(L5_75, L6_76)
  L2_72 = L4_74
  L4_74 = isatapTable
  L5_75 = "."
  L6_76 = _UPVALUE1_
  L6_76 = L6_76.prefix
  L4_74 = L4_74 .. L5_75 .. L6_76
  L4_74 = L2_72[L4_74]
  L5_75 = isatapTable
  L6_76 = "."
  L5_75 = L5_75 .. L6_76 .. _UPVALUE1_.useLanAsEndpoint
  L5_75 = L2_72[L5_75]
  L6_76 = isatapTable
  L6_76 = L6_76 .. "." .. _UPVALUE1_.endPointAddress
  L6_76 = L2_72[L6_76]
  if L4_74 == _UPVALUE0_.NIL or L5_75 == _UPVALUE0_.NIL or L6_76 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_71
  end
  return _UPVALUE0_.SUCCESS, L1_71, L4_74, L5_75, L6_76
end
function tunnelGetCur(A0_77)
  local L1_78, L2_79, L3_80, L4_81, L5_82
  L1_78 = _UPVALUE0_
  L1_78 = L1_78.NIL
  if A0_77 ~= L1_78 then
    L1_78 = tonumber
    L2_79 = A0_77
    L1_78 = L1_78(L2_79)
    L2_79 = _UPVALUE0_
    L2_79 = L2_79.NIL
  elseif L1_78 == L2_79 then
    L1_78 = _UPVALUE0_
    L1_78 = L1_78.INVALID_ARGUMENT
    return L1_78
  end
  L1_78 = {}
  L2_79 = "_ROWID_ = "
  L3_80 = A0_77
  L2_79 = L2_79 .. L3_80
  L3_80 = db
  L3_80 = L3_80.getRowWhere
  L4_81 = isatapTable
  L5_82 = L2_79
  L3_80 = L3_80(L4_81, L5_82)
  L1_78 = L3_80
  L3_80 = isatapTable
  L4_81 = "."
  L5_82 = _UPVALUE1_
  L5_82 = L5_82.prefix
  L3_80 = L3_80 .. L4_81 .. L5_82
  L3_80 = L1_78[L3_80]
  L4_81 = isatapTable
  L5_82 = "."
  L4_81 = L4_81 .. L5_82 .. _UPVALUE1_.useLanAsEndpoint
  L4_81 = L1_78[L4_81]
  L5_82 = isatapTable
  L5_82 = L5_82 .. "." .. _UPVALUE1_.endPointAddress
  L5_82 = L1_78[L5_82]
  if L3_80 == _UPVALUE0_.NIL or L4_81 == _UPVALUE0_.NIL or L5_82 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_77
  end
  return _UPVALUE0_.SUCCESS, A0_77, L3_80, L4_81, L5_82
end
function tunnelSet(A0_83, A1_84, A2_85, A3_86)
  local L4_87, L5_88, L6_89, L7_90, L8_91, L9_92, L10_93, L11_94, L12_95, L13_96, L14_97
  L4_87 = _UPVALUE0_
  L4_87 = L4_87.ipv6ModeGet
  L6_89 = L4_87()
  L7_90 = tonumber
  L8_91 = L6_89
  L7_90 = L7_90(L8_91)
  if L7_90 ~= 3 then
    L7_90 = _UPVALUE1_
    L7_90 = L7_90.IPV6MODE_NOT_ENABLED
    return L7_90
  end
  L7_90 = nil
  L8_91 = _UPVALUE2_
  L8_91 = L8_91.NIL
  if A0_83 ~= L8_91 then
    L8_91 = tonumber
    L9_92 = A0_83
    L8_91 = L8_91(L9_92)
    L9_92 = _UPVALUE2_
    L9_92 = L9_92.NIL
  elseif L8_91 == L9_92 then
    L8_91 = _UPVALUE2_
    L8_91 = L8_91.INVALID_COOKIE
    return L8_91
  end
  L8_91 = _UPVALUE2_
  L8_91 = L8_91.NIL
  if A1_84 == L8_91 then
    L8_91 = _UPVALUE3_
    L8_91 = L8_91.PREFIX_IS_NIL
    return L8_91
  end
  L8_91 = _UPVALUE4_
  L8_91 = L8_91.ipAddressCheck
  L9_92 = 10
  L10_93 = A1_84
  L8_91 = L8_91(L9_92, L10_93)
  L7_90 = L8_91
  L8_91 = _UPVALUE2_
  L8_91 = L8_91.SUCCESS
  if L7_90 ~= L8_91 then
    L8_91 = _UPVALUE3_
    L8_91 = L8_91.INVALID_PREFIX
    return L8_91
  end
  L8_91 = _UPVALUE2_
  L8_91 = L8_91.NIL
  if A2_85 == L8_91 then
    L8_91 = _UPVALUE3_
    L8_91 = L8_91.USELAN_IS_NIL
    return L8_91
  end
  L8_91 = _UPVALUE4_
  L8_91 = L8_91.isBoolean
  L9_92 = A2_85
  L8_91 = L8_91(L9_92)
  L7_90 = L8_91
  L8_91 = _UPVALUE2_
  L8_91 = L8_91.SUCCESS
  if L7_90 ~= L8_91 then
    L8_91 = _UPVALUE3_
    L8_91 = L8_91.INVALID_USELAN
    return L8_91
  end
  L8_91 = tonumber
  L9_92 = A2_85
  L8_91 = L8_91(L9_92)
  if L8_91 == 0 then
    L8_91 = _UPVALUE2_
    L8_91 = L8_91.NIL
    if A3_86 == L8_91 then
      L8_91 = _UPVALUE3_
      L8_91 = L8_91.USELAN_NOT_ENABLED
      return L8_91
    end
  end
  L8_91 = tonumber
  L9_92 = A2_85
  L8_91 = L8_91(L9_92)
  if L8_91 == 1 then
    L8_91 = _UPVALUE5_
    L8_91 = L8_91.logicalIfName
    L9_92 = " = '"
    L10_93 = _UPVALUE6_
    L11_94 = "' and "
    L12_95 = _UPVALUE5_
    L12_95 = L12_95.addrFamily
    L13_96 = " = '"
    L14_97 = _UPVALUE7_
    L8_91 = L8_91 .. L9_92 .. L10_93 .. L11_94 .. L12_95 .. L13_96 .. L14_97 .. "'"
    L9_92 = db
    L9_92 = L9_92.getAttributeWhere
    L10_93 = ifStaticTable
    L11_94 = L8_91
    L12_95 = _UPVALUE5_
    L12_95 = L12_95.ipAddr
    L9_92 = L9_92(L10_93, L11_94, L12_95)
    A3_86 = L9_92
    L9_92 = _UPVALUE2_
    L9_92 = L9_92.NIL
    if A3_86 == L9_92 then
      L9_92 = _UPVALUE2_
      L9_92 = L9_92.FAILURE
      return L9_92
    end
  end
  L8_91 = _UPVALUE5_
  L8_91 = L8_91.endPointAddress
  L9_92 = "=='"
  L10_93 = A3_86
  L11_94 = "' and _ROWID_ !='"
  L12_95 = A0_83
  L13_96 = "'"
  L8_91 = L8_91 .. L9_92 .. L10_93 .. L11_94 .. L12_95 .. L13_96
  L9_92 = db
  L9_92 = L9_92.getRowWhere
  L10_93 = isatapTable
  L11_94 = L8_91
  L9_92 = L9_92(L10_93, L11_94)
  L10_93 = _UPVALUE2_
  L10_93 = L10_93.NIL
  if L9_92 ~= L10_93 then
    L10_93 = _UPVALUE3_
    L10_93 = L10_93.DUPLICATE_ADDRESS
    return L10_93
  end
  L10_93 = _UPVALUE5_
  L10_93 = L10_93.prefix
  L11_94 = "=='"
  L12_95 = A1_84
  L13_96 = "' and _ROWID_ !='"
  L14_97 = A0_83
  L10_93 = L10_93 .. L11_94 .. L12_95 .. L13_96 .. L14_97 .. "'"
  L11_94 = db
  L11_94 = L11_94.getRowWhere
  L12_95 = isatapTable
  L13_96 = L10_93
  L11_94 = L11_94(L12_95, L13_96)
  L12_95 = _UPVALUE2_
  L12_95 = L12_95.NIL
  if L11_94 ~= L12_95 then
    L12_95 = _UPVALUE3_
    L12_95 = L12_95.DUPLICATE_PREFIX
    return L12_95
  end
  L12_95 = {}
  L13_96 = isatapTable
  L14_97 = "."
  L13_96 = L13_96 .. L14_97 .. _UPVALUE5_.prefix
  L12_95[L13_96] = A1_84
  L13_96 = isatapTable
  L14_97 = "."
  L13_96 = L13_96 .. L14_97 .. _UPVALUE5_.useLanAsEndpoint
  L12_95[L13_96] = A2_85
  L13_96 = isatapTable
  L14_97 = "."
  L13_96 = L13_96 .. L14_97 .. _UPVALUE5_.endPointAddress
  L12_95[L13_96] = A3_86
  L13_96 = isatapTable
  L14_97 = "."
  L13_96 = L13_96 .. L14_97 .. _UPVALUE5_.transportIfName
  L12_95[L13_96] = "LAN"
  L13_96, L14_97 = nil, nil
  L13_96, L14_97 = db.update(isatapTable, L12_95, A0_83)
  if L14_97 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_83
  end
  return _UPVALUE2_.SUCCESS, A0_83
end
function tunnelCreate(A0_98, A1_99, A2_100)
  local L3_101, L4_102, L5_103, L6_104, L7_105, L8_106, L9_107, L10_108, L11_109, L12_110, L13_111, L14_112, L15_113
  L3_101 = _UPVALUE0_
  L3_101 = L3_101.ipv6ModeGet
  L5_103 = L3_101()
  L6_104 = tonumber
  L7_105 = L5_103
  L6_104 = L6_104(L7_105)
  if L6_104 ~= 3 then
    L6_104 = _UPVALUE1_
    L6_104 = L6_104.IPV6MODE_NOT_ENABLED
    return L6_104
  end
  L6_104 = nil
  L7_105 = _UPVALUE2_
  L7_105 = L7_105.NIL
  if A0_98 == L7_105 then
    L7_105 = _UPVALUE3_
    L7_105 = L7_105.PREFIX_IS_NIL
    return L7_105
  end
  L7_105 = _UPVALUE4_
  L7_105 = L7_105.ipAddressCheck
  L8_106 = 10
  L9_107 = A0_98
  L7_105 = L7_105(L8_106, L9_107)
  L6_104 = L7_105
  L7_105 = _UPVALUE2_
  L7_105 = L7_105.SUCCESS
  if L6_104 ~= L7_105 then
    L7_105 = _UPVALUE3_
    L7_105 = L7_105.INVALID_PREFIX
    return L7_105
  end
  L7_105 = _UPVALUE2_
  L7_105 = L7_105.NIL
  if A1_99 == L7_105 then
    L7_105 = _UPVALUE3_
    L7_105 = L7_105.USELAN_IS_NIL
    return L7_105
  end
  L7_105 = _UPVALUE4_
  L7_105 = L7_105.isBoolean
  L8_106 = A1_99
  L7_105 = L7_105(L8_106)
  L6_104 = L7_105
  L7_105 = _UPVALUE2_
  L7_105 = L7_105.SUCCESS
  if L6_104 ~= L7_105 then
    L7_105 = _UPVALUE3_
    L7_105 = L7_105.INVALID_USELAN
    return L7_105
  end
  L7_105 = tonumber
  L8_106 = A1_99
  L7_105 = L7_105(L8_106)
  if L7_105 == 0 then
    L7_105 = _UPVALUE2_
    L7_105 = L7_105.NIL
    if A2_100 == L7_105 then
      L7_105 = _UPVALUE3_
      L7_105 = L7_105.USELAN_NOT_ENABLED
      return L7_105
    end
  end
  L7_105 = tonumber
  L8_106 = A1_99
  L7_105 = L7_105(L8_106)
  if L7_105 == 1 then
    L7_105 = _UPVALUE5_
    L7_105 = L7_105.logicalIfName
    L8_106 = " = '"
    L9_107 = _UPVALUE6_
    L10_108 = "' and "
    L11_109 = _UPVALUE5_
    L11_109 = L11_109.addrFamily
    L12_110 = " = '"
    L13_111 = _UPVALUE7_
    L14_112 = "'"
    L7_105 = L7_105 .. L8_106 .. L9_107 .. L10_108 .. L11_109 .. L12_110 .. L13_111 .. L14_112
    L8_106 = db
    L8_106 = L8_106.getAttributeWhere
    L9_107 = ifStaticTable
    L10_108 = L7_105
    L11_109 = _UPVALUE5_
    L11_109 = L11_109.ipAddr
    L8_106 = L8_106(L9_107, L10_108, L11_109)
    A2_100 = L8_106
    L8_106 = _UPVALUE2_
    L8_106 = L8_106.NIL
    if A2_100 == L8_106 then
      L8_106 = _UPVALUE2_
      L8_106 = L8_106.FAILURE
      return L8_106
    end
  end
  L7_105 = tonumber
  L8_106 = A1_99
  L7_105 = L7_105(L8_106)
  if L7_105 == 0 then
    L7_105 = _UPVALUE4_
    L7_105 = L7_105.ipAddressCheck
    L8_106 = 2
    L9_107 = A2_100
    L7_105 = L7_105(L8_106, L9_107)
    L6_104 = L7_105
    L7_105 = _UPVALUE2_
    L7_105 = L7_105.SUCCESS
    if L6_104 ~= L7_105 then
      L7_105 = _UPVALUE3_
      L7_105 = L7_105.INVALID_ENDPOINTADDR
      return L7_105
    end
  end
  L7_105 = _UPVALUE5_
  L7_105 = L7_105.endPointAddress
  L8_106 = "=='"
  L9_107 = A2_100
  L10_108 = "'"
  L7_105 = L7_105 .. L8_106 .. L9_107 .. L10_108
  L8_106 = db
  L8_106 = L8_106.getRowWhere
  L9_107 = isatapTable
  L10_108 = L7_105
  L8_106 = L8_106(L9_107, L10_108)
  L9_107 = _UPVALUE2_
  L9_107 = L9_107.NIL
  if L8_106 ~= L9_107 then
    L9_107 = _UPVALUE3_
    L9_107 = L9_107.DUPLICATE_ADDRESS
    return L9_107
  end
  L9_107 = _UPVALUE5_
  L9_107 = L9_107.prefix
  L10_108 = "=='"
  L11_109 = A0_98
  L12_110 = "'"
  L9_107 = L9_107 .. L10_108 .. L11_109 .. L12_110
  L10_108 = db
  L10_108 = L10_108.getRowWhere
  L11_109 = isatapTable
  L12_110 = L9_107
  L10_108 = L10_108(L11_109, L12_110)
  L11_109 = _UPVALUE2_
  L11_109 = L11_109.NIL
  if L10_108 ~= L11_109 then
    L11_109 = _UPVALUE3_
    L11_109 = L11_109.DUPLICATE_PREFIX
    return L11_109
  end
  L11_109 = db
  L11_109 = L11_109.tableSize
  L12_110 = isatapTable
  L11_109 = L11_109(L12_110)
  L11_109 = L11_109 + 1
  L12_110 = {}
  L13_111 = isatapTable
  L14_112 = "."
  L15_113 = _UPVALUE5_
  L15_113 = L15_113.prefix
  L13_111 = L13_111 .. L14_112 .. L15_113
  L12_110[L13_111] = A0_98
  L13_111 = isatapTable
  L14_112 = "."
  L15_113 = _UPVALUE5_
  L15_113 = L15_113.useLanAsEndpoint
  L13_111 = L13_111 .. L14_112 .. L15_113
  L12_110[L13_111] = A1_99
  L13_111 = isatapTable
  L14_112 = "."
  L15_113 = _UPVALUE5_
  L15_113 = L15_113.endPointAddress
  L13_111 = L13_111 .. L14_112 .. L15_113
  L12_110[L13_111] = A2_100
  L13_111 = isatapTable
  L14_112 = "."
  L15_113 = _UPVALUE5_
  L15_113 = L15_113.transportIfName
  L13_111 = L13_111 .. L14_112 .. L15_113
  L12_110[L13_111] = "LAN"
  L13_111, L14_112 = nil, nil
  L15_113 = db
  L15_113 = L15_113.insert
  L14_112, L15_113 = isatapTable, L15_113(isatapTable, L12_110)
  L13_111 = L15_113
  L15_113 = _UPVALUE2_
  L15_113 = L15_113.NIL
  if L14_112 == L15_113 then
    L15_113 = _UPVALUE2_
    L15_113 = L15_113.FAILURE
    return L15_113
  end
  L15_113 = db
  L15_113 = L15_113.getAttribute
  L15_113 = L15_113(isatapTable, _UPVALUE5_.prefix, A0_98, "_ROWID_")
  return _UPVALUE2_.SUCCESS, L15_113
end
function tunnelDelete(A0_114)
  local L1_115, L2_116, L3_117, L4_118, L5_119, L6_120
  L1_115 = _UPVALUE0_
  L1_115 = L1_115.ipv6ModeGet
  L3_117 = L1_115()
  L4_118 = tonumber
  L5_119 = L3_117
  L4_118 = L4_118(L5_119)
  if L4_118 ~= 3 then
    L4_118 = _UPVALUE1_
    L4_118 = L4_118.IPV6MODE_NOT_ENABLED
    return L4_118
  end
  L4_118 = _UPVALUE2_
  L4_118 = L4_118.NIL
  if A0_114 ~= L4_118 then
    L4_118 = tonumber
    L5_119 = A0_114
    L4_118 = L4_118(L5_119)
    L5_119 = _UPVALUE2_
    L5_119 = L5_119.NIL
  elseif L4_118 == L5_119 then
    L4_118 = _UPVALUE2_
    L4_118 = L4_118.INVALID_ARGUMENT
    return L4_118
  end
  L4_118, L5_119 = nil, nil
  L6_120 = "_ROWID_ = "
  L6_120 = L6_120 .. A0_114
  L4_118, L5_119 = db.deleteRowWhere(isatapTable, L6_120)
  if L5_119 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_114
  end
  return _UPVALUE2_.SUCCESS, A0_114
end
function isatapTunnelsGetAll()
  local L0_121
  L0_121 = db
  L0_121 = L0_121.getTable
  L0_121 = L0_121(isatapTable, false)
  if L0_121 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_121
end
function isatapTunnelsDeleteAll()
  return _UPVALUE0_.SUCCESS
end
