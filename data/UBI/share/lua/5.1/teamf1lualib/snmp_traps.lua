local L0_0
L0_0 = module
L0_0("com.teamf1.core.snmp.traps", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/cookie")
L0_0 = require
L0_0("teamf1lualib/snmp_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.snmp.returnCodes")
trapsTable = "snmpTrap"
;({}).key = "_ROWID_"
;({}).ipAddress = "ipAddr"
;({}).port = "port"
;({}).community = "commName"
;({}).authType = "snmpVersion"
function ipAddressGet()
  local L0_1, L1_2, L2_3
  L0_1 = cookieGet
  L1_2 = trapsTable
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.key
  L1_2 = L0_1(L1_2, L2_3)
  if L1_2 == nil then
    L2_3 = _UPVALUE1_
    L2_3 = L2_3.FAILURE
    return L2_3
  end
  L2_3 = db
  L2_3 = L2_3.getAttribute
  L2_3 = L2_3(trapsTable, _UPVALUE0_.key, L1_2, _UPVALUE0_.ipAddress)
  if L2_3 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_2, L2_3
end
function ipAddressGetNext(A0_4)
  local L1_5, L2_6, L3_7
  if A0_4 == nil then
    L1_5 = _UPVALUE0_
    L1_5 = L1_5.INVALID_ARGUMENT
    return L1_5
  end
  L1_5 = cookieGetNext
  L2_6 = trapsTable
  L3_7 = _UPVALUE1_
  L3_7 = L3_7.key
  L2_6 = L1_5(L2_6, L3_7, A0_4)
  if L2_6 == nil then
    L3_7 = _UPVALUE0_
    L3_7 = L3_7.TABLE_IS_FULL
    return L3_7
  end
  L3_7 = db
  L3_7 = L3_7.getAttribute
  L3_7 = L3_7(trapsTable, _UPVALUE1_.key, L2_6, _UPVALUE1_.ipAddress)
  if L3_7 == nil then
    return _UPVALUE0_.FAILURE, L2_6
  end
  return _UPVALUE0_.SUCCESS, L2_6, L3_7
end
function ipAddressSet(A0_8, A1_9)
  if A0_8 == nil then
    return INVALID_ARGUMENT
  end
  if db.existsRow(trapsTable, _UPVALUE0_.key, A0_8) == false then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if A1_9 == nil then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  valid = _UPVALUE2_.ipAddressCheck("2", A1_9)
  if valid ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttribute(trapsTable, _UPVALUE0_.key, A0_8, _UPVALUE0_.ipAddress, A1_9) == nil then
    return _UPVALUE1_.FAILURE, A0_8
  end
  return _UPVALUE1_.SUCCESS, A0_8
end
function ipAddressDelete(A0_10, A1_11)
  return _UPVALUE0_.NOT_SUPPORTED
end
function portGet()
  local L0_12, L1_13, L2_14
  L0_12 = cookieGet
  L1_13 = trapsTable
  L2_14 = _UPVALUE0_
  L2_14 = L2_14.key
  L1_13 = L0_12(L1_13, L2_14)
  if L1_13 == nil then
    L2_14 = _UPVALUE1_
    L2_14 = L2_14.FAILURE
    return L2_14
  end
  L2_14 = db
  L2_14 = L2_14.getAttribute
  L2_14 = L2_14(trapsTable, _UPVALUE0_.key, L1_13, _UPVALUE0_.port)
  if L2_14 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_13, L2_14
end
function portGetNext(A0_15)
  local L1_16, L2_17, L3_18
  if A0_15 == nil then
    L1_16 = _UPVALUE0_
    L1_16 = L1_16.INVALID_ARGUMENT
    return L1_16
  end
  L1_16 = cookieGetNext
  L2_17 = trapsTable
  L3_18 = _UPVALUE1_
  L3_18 = L3_18.key
  L2_17 = L1_16(L2_17, L3_18, A0_15)
  if L2_17 == nil then
    L3_18 = _UPVALUE0_
    L3_18 = L3_18.TABLE_IS_FULL
    return L3_18
  end
  L3_18 = db
  L3_18 = L3_18.getAttribute
  L3_18 = L3_18(trapsTable, _UPVALUE1_.key, L2_17, _UPVALUE1_.port)
  if L3_18 == nil then
    return _UPVALUE0_.FAILURE, L2_17
  end
  return _UPVALUE0_.SUCCESS, L2_17, L3_18
end
function portSet(A0_19, A1_20)
  local L2_21
  if A0_19 == nil then
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.INVALID_ARGUMENT
    return L2_21
  end
  L2_21 = db
  L2_21 = L2_21.existsRow
  L2_21 = L2_21(trapsTable, _UPVALUE1_.key, A0_19)
  if L2_21 == false then
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.INVALID_ARGUMENT
    return L2_21
  end
  if A1_20 == nil then
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.INVALID_ARGUMENT
    return L2_21
  end
  L2_21 = tonumber
  L2_21 = L2_21(A1_20)
  if L2_21 < 1 or L2_21 > 65535 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(trapsTable, _UPVALUE1_.key, A0_19, _UPVALUE1_.port, L2_21) == nil then
    return _UPVALUE0_.FAILURE, A0_19
  end
  return _UPVALUE0_.SUCCESS, A0_19
end
function communityGet()
  local L0_22, L1_23, L2_24
  L0_22 = cookieGet
  L1_23 = trapsTable
  L2_24 = _UPVALUE0_
  L2_24 = L2_24.key
  L1_23 = L0_22(L1_23, L2_24)
  if L1_23 == nil then
    L2_24 = _UPVALUE1_
    L2_24 = L2_24.FAILURE
    return L2_24
  end
  L2_24 = db
  L2_24 = L2_24.getAttribute
  L2_24 = L2_24(trapsTable, _UPVALUE0_.key, L1_23, _UPVALUE0_.community)
  if L2_24 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_23, L2_24
end
function communityGetNext(A0_25)
  local L1_26, L2_27, L3_28
  if A0_25 == nil then
    L1_26 = _UPVALUE0_
    L1_26 = L1_26.INVALID_ARGUMENT
    return L1_26
  end
  L1_26 = cookieGetNext
  L2_27 = trapsTable
  L3_28 = _UPVALUE1_
  L3_28 = L3_28.key
  L2_27 = L1_26(L2_27, L3_28, A0_25)
  if L2_27 == nil then
    L3_28 = _UPVALUE0_
    L3_28 = L3_28.TABLE_IS_FULL
    return L3_28
  end
  L3_28 = db
  L3_28 = L3_28.getAttribute
  L3_28 = L3_28(trapsTable, _UPVALUE1_.key, L2_27, _UPVALUE1_.community)
  if L3_28 == nil then
    return _UPVALUE0_.FAILURE, L2_27
  end
  return _UPVALUE0_.SUCCESS, L2_27, L3_28
end
function communitySet(A0_29, A1_30)
  if A0_29 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(trapsTable, _UPVALUE1_.key, A0_29) == false then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_30 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(trapsTable, _UPVALUE1_.key, A0_29, _UPVALUE1_.community, A1_30) == nil then
    return _UPVALUE0_.FAILURE, A0_29
  end
  return _UPVALUE0_.SUCCESS, A0_29
end
function authTypeGet()
  local L0_31, L1_32, L2_33
  L0_31 = cookieGet
  L1_32 = trapsTable
  L2_33 = _UPVALUE0_
  L2_33 = L2_33.key
  L1_32 = L0_31(L1_32, L2_33)
  if L1_32 == nil then
    L2_33 = _UPVALUE1_
    L2_33 = L2_33.FAILURE
    return L2_33
  end
  L2_33 = db
  L2_33 = L2_33.getAttribute
  L2_33 = L2_33(trapsTable, _UPVALUE0_.key, L1_32, _UPVALUE0_.authType)
  if L2_33 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_32, L2_33
end
function authTypeGetNext(A0_34)
  local L1_35, L2_36, L3_37
  if A0_34 ~= nil then
    L1_35 = tonumber
    L2_36 = A0_34
    L1_35 = L1_35(L2_36)
  elseif L1_35 == nil then
    L1_35 = _UPVALUE0_
    L1_35 = L1_35.INVALID_ARGUMENT
    return L1_35
  end
  L1_35 = cookieGetNext
  L2_36 = trapsTable
  L3_37 = _UPVALUE1_
  L3_37 = L3_37.key
  L2_36 = L1_35(L2_36, L3_37, A0_34)
  if L2_36 == nil then
    L3_37 = _UPVALUE0_
    L3_37 = L3_37.TABLE_IS_FULL
    return L3_37
  end
  L3_37 = db
  L3_37 = L3_37.getAttribute
  L3_37 = L3_37(trapsTable, _UPVALUE1_.key, L2_36, _UPVALUE1_.authType)
  if L3_37 == nil then
    return _UPVALUE0_.FAILURE, L2_36
  end
  return _UPVALUE0_.SUCCESS, L2_36, L3_37
end
function authTypeSet(A0_38, A1_39)
  if A0_38 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(trapsTable, _UPVALUE1_.key, A0_38) == false then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_39 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_39 ~= "v1" and A1_39 ~= "v2c" and A1_39 ~= "v3" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(trapsTable, _UPVALUE1_.key, A0_38, _UPVALUE1_.authType, A1_39) == nil then
    return _UPVALUE0_.FAILURE, A0_38
  end
  return _UPVALUE0_.SUCCESS, A0_38
end
function trapServerListGet()
  local L0_40, L1_41, L2_42, L3_43, L4_44, L5_45, L6_46
  L0_40 = {}
  L1_41 = cookieGet
  L2_42 = trapsTable
  L3_43 = _UPVALUE0_
  L3_43 = L3_43.key
  L2_42 = L1_41(L2_42, L3_43)
  if L2_42 == nil then
    L3_43 = _UPVALUE1_
    L3_43 = L3_43.FAILURE
    return L3_43
  end
  L3_43 = db
  L3_43 = L3_43.getRow
  L4_44 = trapsTable
  L5_45 = _UPVALUE0_
  L5_45 = L5_45.key
  L6_46 = L2_42
  L3_43 = L3_43(L4_44, L5_45, L6_46)
  L0_40 = L3_43
  if L0_40 == nil then
    L3_43 = _UPVALUE1_
    L3_43 = L3_43.FAILURE
    return L3_43
  end
  L3_43, L4_44, L5_45, L6_46 = nil, nil, nil, nil
  L3_43 = L0_40[trapsTable .. "." .. _UPVALUE0_.ipAddress]
  L4_44 = L0_40[trapsTable .. "." .. _UPVALUE0_.port]
  L5_45 = L0_40[trapsTable .. "." .. _UPVALUE0_.community]
  L6_46 = L0_40[trapsTable .. "." .. _UPVALUE0_.authType]
  if L3_43 == nil or L4_44 == nil or L5_45 == nil or L6_46 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L2_42, L3_43, L4_44, L5_45, L6_46
end
function trapServerListGetNext(A0_47)
  local L1_48, L2_49, L3_50, L4_51, L5_52, L6_53, L7_54
  if A0_47 == nil then
    L1_48 = _UPVALUE0_
    L1_48 = L1_48.INVALID_ARGUMENT
    return L1_48
  end
  L1_48 = cookieGetNext
  L2_49 = trapsTable
  L3_50 = _UPVALUE1_
  L3_50 = L3_50.key
  L4_51 = A0_47
  L2_49 = L1_48(L2_49, L3_50, L4_51)
  if L2_49 == nil then
    L3_50 = _UPVALUE0_
    L3_50 = L3_50.TABLE_IS_FULL
    return L3_50
  end
  L3_50 = {}
  L4_51 = db
  L4_51 = L4_51.getRow
  L5_52 = trapsTable
  L6_53 = _UPVALUE1_
  L6_53 = L6_53.key
  L7_54 = L2_49
  L4_51 = L4_51(L5_52, L6_53, L7_54)
  L3_50 = L4_51
  if L3_50 == nil then
    L4_51 = _UPVALUE0_
    L4_51 = L4_51.FAILURE
    return L4_51
  end
  L4_51, L5_52, L6_53, L7_54 = nil, nil, nil, nil
  L4_51 = L3_50[trapsTable .. "." .. _UPVALUE1_.ipAddress]
  L5_52 = L3_50[trapsTable .. "." .. _UPVALUE1_.port]
  L6_53 = L3_50[trapsTable .. "." .. _UPVALUE1_.community]
  L7_54 = L3_50[trapsTable .. "." .. _UPVALUE1_.authType]
  if L4_51 == nil or L5_52 == nil or L6_53 == nil or L7_54 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, rowId, L4_51, L5_52, L6_53, L7_54
end
function trapServerListGetCur(A0_55)
  local L1_56, L2_57, L3_58, L4_59, L5_60
  if A0_55 == nil then
    L1_56 = _UPVALUE0_
    L1_56 = L1_56.FAILURE
    return L1_56
  end
  L1_56 = {}
  L2_57 = db
  L2_57 = L2_57.getRow
  L3_58 = trapsTable
  L4_59 = _UPVALUE1_
  L4_59 = L4_59.key
  L5_60 = A0_55
  L2_57 = L2_57(L3_58, L4_59, L5_60)
  L1_56 = L2_57
  if L1_56 == nil then
    L2_57 = _UPVALUE0_
    L2_57 = L2_57.FAILURE
    return L2_57
  end
  L2_57, L3_58, L4_59, L5_60 = nil, nil, nil, nil
  L2_57 = L1_56[trapsTable .. "." .. _UPVALUE1_.ipAddress]
  L3_58 = L1_56[trapsTable .. "." .. _UPVALUE1_.port]
  L4_59 = L1_56[trapsTable .. "." .. _UPVALUE1_.community]
  L5_60 = L1_56[trapsTable .. "." .. _UPVALUE1_.authType]
  if L2_57 == nil or L3_58 == nil or L4_59 == nil or L5_60 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_55, L2_57, L3_58, L4_59, L5_60
end
function trapServerListGetAll()
  local L0_61
  L0_61 = {}
  L0_61 = db.getTable(trapsTable, false)
  if L0_61 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_61
end
function trapServerListSet(A0_62, A1_63, A2_64, A3_65, A4_66)
  local L5_67, L6_68, L7_69
  if A0_62 == nil then
    L5_67 = _UPVALUE0_
    L5_67 = L5_67.INVALID_ARGUMENT
    return L5_67
  end
  L5_67 = db
  L5_67 = L5_67.getAttribute
  L6_68 = trapsTable
  L7_69 = _UPVALUE1_
  L7_69 = L7_69.key
  L5_67 = L5_67(L6_68, L7_69, A0_62, _UPVALUE1_.ipAddress)
  L6_68 = db
  L6_68 = L6_68.existsRow
  L7_69 = trapsTable
  L6_68 = L6_68(L7_69, _UPVALUE1_.ipAddress, A1_63)
  L7_69 = _UPVALUE0_
  L7_69 = L7_69.FALSE
  if L6_68 ~= L7_69 and A1_63 ~= L5_67 then
    L6_68 = _UPVALUE2_
    L6_68 = L6_68.ENTRY_ALREADY_EXIST
    return L6_68
  end
  if A1_63 == nil then
    L6_68 = _UPVALUE0_
    L6_68 = L6_68.INVALID_ARGUMENT
    return L6_68
  end
  L6_68 = _UPVALUE3_
  L6_68 = L6_68.ipAddressCheck
  L7_69 = "2"
  L6_68 = L6_68(L7_69, A1_63)
  valid = L6_68
  L6_68 = valid
  L7_69 = _UPVALUE0_
  L7_69 = L7_69.SUCCESS
  if L6_68 ~= L7_69 then
    L6_68 = _UPVALUE2_
    L6_68 = L6_68.SNMP_TRAP_IPADDRESS_INVALID
    return L6_68
  end
  if A2_64 == nil then
    L6_68 = _UPVALUE0_
    L6_68 = L6_68.INVALID_ARGUMENT
    return L6_68
  end
  L6_68 = tonumber
  L7_69 = A2_64
  L6_68 = L6_68(L7_69)
  if L6_68 < 1 or L6_68 > 65535 then
    L7_69 = _UPVALUE2_
    L7_69 = L7_69.SNMP_TRAP_PORT_INVALID
    return L7_69
  end
  if A3_65 == nil then
    L7_69 = _UPVALUE0_
    L7_69 = L7_69.INVALID_ARGUMENT
    return L7_69
  end
  if A4_66 == nil then
    L7_69 = _UPVALUE0_
    L7_69 = L7_69.INVALID_ARGUMENT
    return L7_69
  end
  if A4_66 ~= "v1" and A4_66 ~= "v2c" and A4_66 ~= "v3" then
    L7_69 = _UPVALUE0_
    L7_69 = L7_69.INVALID_ARGUMENT
    return L7_69
  end
  L7_69 = {}
  L7_69[trapsTable .. "." .. _UPVALUE1_.ipAddress] = A1_63
  L7_69[trapsTable .. "." .. _UPVALUE1_.port] = L6_68
  L7_69[trapsTable .. "." .. _UPVALUE1_.community] = A3_65
  L7_69[trapsTable .. "." .. _UPVALUE1_.authType] = A4_66
  if db.update(trapsTable, L7_69, A0_62) == nil then
    return _UPVALUE0_.FAILURE, A0_62
  end
  return _UPVALUE0_.SUCCESS, A0_62
end
function trapServerListCreate(A0_70, A1_71, A2_72, A3_73)
  local L4_74, L5_75, L6_76, L7_77
  L4_74 = db
  L4_74 = L4_74.existsRow
  L5_75 = trapsTable
  L6_76 = _UPVALUE0_
  L6_76 = L6_76.ipAddress
  L7_77 = A0_70
  L4_74 = L4_74(L5_75, L6_76, L7_77)
  L5_75 = _UPVALUE1_
  L5_75 = L5_75.FALSE
  if L4_74 ~= L5_75 then
    L4_74 = _UPVALUE2_
    L4_74 = L4_74.ENTRY_ALREADY_EXIST
    return L4_74
  end
  L4_74 = db
  L4_74 = L4_74.getTable
  L5_75 = trapsTable
  L6_76 = false
  L4_74 = L4_74(L5_75, L6_76)
  L5_75 = nil
  L6_76 = PRODUCT_ID
  if L6_76 ~= "DSR-1000AC_Ax" then
    L6_76 = PRODUCT_ID
    if L6_76 ~= "DSR-500AC_Ax" then
      L6_76 = PRODUCT_ID
      if L6_76 ~= "DSR-1000_Bx" then
        L6_76 = PRODUCT_ID
        if L6_76 ~= "DSR-500_Bx" then
          L6_76 = PRODUCT_ID
          if L6_76 ~= "DSR-1000_Ax" then
            L6_76 = PRODUCT_ID
          end
        end
      end
    end
  else
    if L6_76 == "DSR-1000N_Ax" then
      L5_75 = 32
  end
  else
    L6_76 = UNIT_NAME
    if L6_76 ~= "DSR-500" then
      L6_76 = UNIT_NAME
    else
      if L6_76 == "DSR-500N" then
        L5_75 = 16
    end
    else
      L5_75 = 8
    end
  end
  if L4_74 ~= nil then
    L6_76 = #L4_74
    L7_77 = L5_75 - 1
    if L6_76 > L7_77 then
      L6_76 = _UPVALUE1_
      L6_76 = L6_76.MAX_LIMIT_REACHED
      return L6_76
    end
  end
  if A0_70 == nil then
    L6_76 = _UPVALUE1_
    L6_76 = L6_76.INVALID_ARGUMENT
    return L6_76
  end
  L6_76 = _UPVALUE3_
  L6_76 = L6_76.ipAddressCheck
  L7_77 = "2"
  L6_76 = L6_76(L7_77, A0_70)
  valid = L6_76
  L6_76 = valid
  L7_77 = _UPVALUE1_
  L7_77 = L7_77.SUCCESS
  if L6_76 ~= L7_77 then
    L6_76 = _UPVALUE2_
    L6_76 = L6_76.SNMP_TRAP_IPADDRESS_INVALID
    return L6_76
  end
  if A1_71 == nil then
    L6_76 = _UPVALUE1_
    L6_76 = L6_76.INVALID_ARGUMENT
    return L6_76
  end
  L6_76 = tonumber
  L7_77 = A1_71
  L6_76 = L6_76(L7_77)
  if L6_76 < 1 or L6_76 > 65535 then
    L7_77 = _UPVALUE2_
    L7_77 = L7_77.SNMP_TRAP_PORT_INVALID
    return L7_77
  end
  if A2_72 == nil then
    L7_77 = _UPVALUE1_
    L7_77 = L7_77.INVALID_ARGUMENT
    return L7_77
  end
  if A3_73 == nil then
    L7_77 = _UPVALUE1_
    L7_77 = L7_77.INVALID_ARGUMENT
    return L7_77
  end
  if A3_73 ~= "v1" and A3_73 ~= "v2c" and A3_73 ~= "v3" then
    L7_77 = _UPVALUE1_
    L7_77 = L7_77.INVALID_ARGUMENT
    return L7_77
  end
  L7_77 = {}
  L7_77[trapsTable .. "." .. _UPVALUE0_.ipAddress] = A0_70
  L7_77[trapsTable .. "." .. _UPVALUE0_.port] = A1_71
  L7_77[trapsTable .. "." .. _UPVALUE0_.community] = A2_72
  L7_77[trapsTable .. "." .. _UPVALUE0_.authType] = A3_73
  if db.insert(trapsTable, L7_77) == nil then
    return _UPVALUE1_.FAILURE, cookie
  end
  return _UPVALUE1_.SUCCESS, cookie
end
function trapServerListDelete(A0_78)
  if A0_78 == nil or tonumber(A0_78) == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(trapsTable, _UPVALUE1_.key, A0_78) == false then
    return _UPVALUE0_.FAILURE
  end
  if db.deleteRow(trapsTable, _UPVALUE1_.key, A0_78) == nil then
    return _UPVALUE0_.FAILURE, A0_78
  end
  return _UPVALUE0_.SUCCESS, A0_78
end
function trapServerListDeleteAll()
  if db.deleteAllRows(trapsTable) == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
