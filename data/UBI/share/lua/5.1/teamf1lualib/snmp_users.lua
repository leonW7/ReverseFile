local L0_0
L0_0 = module
L0_0("com.teamf1.core.snmp.users", package.seeall)
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
SECURITY_LEVEL1 = "0"
SECURITY_LEVEL2 = "1"
SECURITY_LEVEL3 = "2"
AUTH_ALG1 = "MD5"
AUTH_ALG2 = "SHA"
SECURITY_ALG1 = "DES"
SECURITY_ALG2 = "AES"
MD5_PWD_SIZE = 16
SHA1_PWD_SIZE = 20
DES_PWD_SIZE = 8
AES_PWD_SIZE = 16
AUTH_PWD_MAX_SIZE = 16
PRIVACY_PWD_MAX_SIZE = 8
usersTable = "snmpv3Users"
;({}).key = "_ROWID_"
;({}).userName = "userName"
;({}).privilege = "accessType"
;({}).securityLevel = "securityLevel"
;({}).authAlgorithm = "authAlgo"
;({}).authPassword = "authPassword"
;({}).privacyAlgorithm = "privAlgo"
;({}).privacyPassword = "privPassword"
function userNameGet()
  local L0_1, L1_2, L2_3
  L0_1 = cookieGet
  L1_2 = usersTable
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.key
  L1_2 = L0_1(L1_2, L2_3)
  if L1_2 == nil then
    L2_3 = FAILURE
    return L2_3
  end
  L2_3 = db
  L2_3 = L2_3.getAttribute
  L2_3 = L2_3(usersTable, _UPVALUE0_.key, L1_2, _UPVALUE0_.userName)
  if L2_3 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_2, L2_3
end
function userNameGetNext(A0_4)
  local L1_5, L2_6, L3_7
  if A0_4 == nil then
    L1_5 = _UPVALUE0_
    L1_5 = L1_5.INVALID_ARGUMENT
    return L1_5
  end
  L1_5 = cookieGetNext
  L2_6 = usersTable
  L3_7 = _UPVALUE1_
  L3_7 = L3_7.key
  L2_6 = L1_5(L2_6, L3_7, A0_4)
  if L2_6 == nil then
    L3_7 = TABLE_IS_FULL
    return L3_7
  end
  L3_7 = db
  L3_7 = L3_7.getAttribute
  L3_7 = L3_7(usersTable, _UPVALUE1_.key, L2_6, _UPVALUE1_.userName)
  if L3_7 == nil then
    return _UPVALUE0_.FAILURE, L2_6
  end
  return _UPVALUE0_.SUCCESS, L2_6, L3_7
end
function userNameSet(A0_8, A1_9)
  local L3_10
  L3_10 = _UPVALUE0_
  L3_10 = L3_10.NOT_SUPPORTED
  return L3_10, A0_8
end
function userNameDelete(A0_11, A1_12)
  local L3_13
  L3_13 = _UPVALUE0_
  L3_13 = L3_13.NOT_SUPPORTED
  return L3_13, A0_11
end
function privilegeGet()
  local L0_14, L1_15, L2_16
  L0_14 = cookieGet
  L1_15 = usersTable
  L2_16 = _UPVALUE0_
  L2_16 = L2_16.key
  L1_15 = L0_14(L1_15, L2_16)
  if L1_15 == nil then
    L2_16 = FAILURE
    return L2_16
  end
  L2_16 = db
  L2_16 = L2_16.getAttribute
  L2_16 = L2_16(usersTable, _UPVALUE0_.key, L1_15, _UPVALUE0_.privilege)
  if L2_16 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_15, L2_16
end
function privilegeGetNext(A0_17)
  local L1_18, L2_19, L3_20
  if A0_17 == nil then
    L1_18 = _UPVALUE0_
    L1_18 = L1_18.returnCodes
    L1_18 = L1_18.INVALID_ARGUMENT
    return L1_18
  end
  L1_18 = cookieGetNext
  L2_19 = usersTable
  L3_20 = _UPVALUE1_
  L3_20 = L3_20.key
  L2_19 = L1_18(L2_19, L3_20, A0_17)
  if L2_19 == nil then
    L3_20 = TABLE_IS_FULL
    return L3_20
  end
  L3_20 = db
  L3_20 = L3_20.getAttribute
  L3_20 = L3_20(usersTable, _UPVALUE1_.key, L2_19, _UPVALUE1_.privilege)
  if L3_20 == nil then
    return _UPVALUE0_.FAILURE, L2_19
  end
  return _UPVALUE0_.SUCCESS, L2_19, L3_20
end
function privilegeSet(A0_21, A1_22)
  local L3_23
  L3_23 = _UPVALUE0_
  L3_23 = L3_23.NOT_SUPPORTED
  return L3_23, A0_21
end
function securityLevelGet()
  local L0_24, L1_25, L2_26
  L0_24 = cookieGet
  L1_25 = usersTable
  L2_26 = _UPVALUE0_
  L2_26 = L2_26.key
  L1_25 = L0_24(L1_25, L2_26)
  if L1_25 == nil then
    L2_26 = FAILURE
    return L2_26
  end
  L2_26 = db
  L2_26 = L2_26.getAttribute
  L2_26 = L2_26(usersTable, _UPVALUE0_.key, L1_25, _UPVALUE0_.securityLevel)
  if L2_26 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_25, L2_26
end
function securityLevelGetNext(A0_27)
  local L1_28, L2_29, L3_30
  if A0_27 == nil then
    L1_28 = _UPVALUE0_
    L1_28 = L1_28.returnCodes
    L1_28 = L1_28.INVALID_ARGUMENT
    return L1_28
  end
  L1_28 = cookieGetNext
  L2_29 = usersTable
  L3_30 = _UPVALUE1_
  L3_30 = L3_30.key
  L2_29 = L1_28(L2_29, L3_30, A0_27)
  if L2_29 == nil then
    L3_30 = _UPVALUE0_
    L3_30 = L3_30.TABLE_IS_FULL
    return L3_30
  end
  L3_30 = db
  L3_30 = L3_30.getAttribute
  L3_30 = L3_30(usersTable, _UPVALUE1_.key, L2_29, _UPVALUE1_.securityLevel)
  if L3_30 == nil then
    return _UPVALUE0_.FAILURE, L2_29
  end
  return _UPVALUE0_.SUCCESS, L2_29, L3_30
end
function securityLevelSet(A0_31, A1_32)
  if A0_31 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(usersTable, _UPVALUE1_.key, A0_31) == false then
    return _UPVALUE0_.returnCodes.INVALID_ARGUMENT
  end
  if A1_32 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_32 ~= SECURITY_LEVEL1 and A1_32 ~= SECURITY_LEVEL2 and A1_32 ~= SECURITY_LEVEL3 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(usersTable, _UPVALUE1_.key, A0_31, _UPVALUE1_.securityLevel, A1_32) == nil then
    return _UPVALUE0_.FAILURE, A0_31
  end
  return _UPVALUE0_.SUCCESS, A0_31
end
function authAlgorithmGet()
  local L0_33, L1_34, L2_35
  L0_33 = cookieGet
  L1_34 = usersTable
  L2_35 = _UPVALUE0_
  L2_35 = L2_35.key
  L1_34 = L0_33(L1_34, L2_35)
  if L1_34 == nil then
    L2_35 = FAILURE
    return L2_35
  end
  L2_35 = db
  L2_35 = L2_35.getAttribute
  L2_35 = L2_35(usersTable, _UPVALUE0_.key, L1_34, _UPVALUE0_.authAlgorithm)
  if L2_35 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_34, L2_35
end
function authAlgorithmGetNext(A0_36)
  local L1_37, L2_38, L3_39
  if A0_36 == nil then
    L1_37 = _UPVALUE0_
    L1_37 = L1_37.INVALID_ARGUMENT
    return L1_37
  end
  L1_37 = cookieGetNext
  L2_38 = usersTable
  L3_39 = _UPVALUE1_
  L3_39 = L3_39.key
  L2_38 = L1_37(L2_38, L3_39, A0_36)
  if L2_38 == nil then
    L3_39 = _UPVALUE0_
    L3_39 = L3_39.TABLE_IS_FULL
    return L3_39
  end
  L3_39 = db
  L3_39 = L3_39.getAttribute
  L3_39 = L3_39(usersTable, _UPVALUE1_.key, L2_38, _UPVALUE1_.authAlgorithm)
  if L3_39 == nil then
    return _UPVALUE0_.FAILURE, L2_38
  end
  return _UPVALUE0_.SUCCESS, L2_38, L3_39
end
function authAlgorithmSet(A0_40, A1_41)
  local L2_42
  if A0_40 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(usersTable, _UPVALUE1_.key, A0_40) == false then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_41 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_41 ~= AUTH_ALG1 and A1_41 ~= AUTH_ALG2 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(usersTable, _UPVALUE1_.key, A0_40, _UPVALUE1_.securityLevel) == SECURITY_LEVEL2 or db.getAttribute(usersTable, _UPVALUE1_.key, A0_40, _UPVALUE1_.securityLevel) == SECURITY_LEVEL3 then
    L2_42 = db.setAttribute(usersTable, _UPVALUE1_.key, A0_40, _UPVALUE1_.authAlgorithm, A1_41)
  else
    return _UPVALUE0_.FAILURE
  end
  if L2_42 == nil then
    return _UPVALUE0_.FAILURE, A0_40
  end
  return _UPVALUE0_.SUCCESS, A0_40
end
function authPasswordGet()
  local L0_43, L1_44, L2_45
  L0_43 = cookieGet
  L1_44 = usersTable
  L2_45 = _UPVALUE0_
  L2_45 = L2_45.key
  L1_44 = L0_43(L1_44, L2_45)
  if L1_44 == nil then
    L2_45 = FAILURE
    return L2_45
  end
  L2_45 = db
  L2_45 = L2_45.getAttribute
  L2_45 = L2_45(usersTable, _UPVALUE0_.key, L1_44, _UPVALUE0_.authPassword)
  if L2_45 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_44, L2_45
end
function authPasswordGetNext(A0_46)
  local L1_47, L2_48, L3_49
  if A0_46 == nil then
    L1_47 = _UPVALUE0_
    L1_47 = L1_47.INVALID_ARGUMENT
    return L1_47
  end
  L1_47 = cookieGetNext
  L2_48 = usersTable
  L3_49 = _UPVALUE1_
  L3_49 = L3_49.key
  L2_48 = L1_47(L2_48, L3_49, A0_46)
  if L2_48 == nil then
    L3_49 = _UPVALUE0_
    L3_49 = L3_49.TABLE_IS_FULL
    return L3_49
  end
  L3_49 = db
  L3_49 = L3_49.getAttribute
  L3_49 = L3_49(usersTable, _UPVALUE1_.key, L2_48, _UPVALUE1_.authPassword)
  if L3_49 == nil then
    return _UPVALUE0_.FAILURE, L2_48
  end
  return _UPVALUE0_.SUCCESS, L2_48, L3_49
end
function authPasswordSet(A0_50, A1_51)
  local L2_52
  if A0_50 == nil then
    L2_52 = _UPVALUE0_
    L2_52 = L2_52.INVALID_ARGUMENT
    return L2_52
  end
  L2_52 = string
  L2_52 = L2_52.len
  L2_52 = L2_52(A1_51)
  if L2_52 < AUTH_PWD_MAX_SIZE then
    L2_52 = _UPVALUE0_
    L2_52 = L2_52.INVALID_ARGUMENT
    return L2_52
  end
  L2_52 = db
  L2_52 = L2_52.existsRow
  L2_52 = L2_52(usersTable, _UPVALUE1_.key, A0_50)
  if L2_52 == false then
    L2_52 = _UPVALUE0_
    L2_52 = L2_52.INVALID_ARGUMENT
    return L2_52
  end
  if A1_51 == nil then
    L2_52 = _UPVALUE0_
    L2_52 = L2_52.INVALID_ARGUMENT
    return L2_52
  end
  L2_52 = nil
  if db.getAttribute(usersTable, _UPVALUE1_.key, A0_50, _UPVALUE1_.securityLevel) == SECURITY_LEVEL2 or db.getAttribute(usersTable, _UPVALUE1_.key, A0_50, _UPVALUE1_.securityLevel) == SECURITY_LEVEL3 then
    L2_52 = db.setAttribute(usersTable, _UPVALUE1_.key, A0_50, _UPVALUE1_.authPassword, A1_51)
  else
    return _UPVALUE0_.FAILURE
  end
  if L2_52 == nil then
    return _UPVALUE0_.FAILURE, A0_50
  end
  return _UPVALUE0_.SUCCESS, A0_50
end
function privacyAlgorithmGet()
  local L0_53, L1_54, L2_55
  L0_53 = cookieGet
  L1_54 = usersTable
  L2_55 = _UPVALUE0_
  L2_55 = L2_55.key
  L1_54 = L0_53(L1_54, L2_55)
  if L1_54 == nil then
    L2_55 = FAILURE
    return L2_55
  end
  L2_55 = db
  L2_55 = L2_55.getAttribute
  L2_55 = L2_55(usersTable, _UPVALUE0_.key, L1_54, _UPVALUE0_.privacyAlgorithm)
  if L2_55 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_54, L2_55
end
function privacyAlgorithmGetNext(A0_56)
  local L1_57, L2_58, L3_59
  if A0_56 == nil then
    L1_57 = _UPVALUE0_
    L1_57 = L1_57.INVALID_ARGUMENT
    return L1_57
  end
  L1_57 = cookieGetNext
  L2_58 = usersTable
  L3_59 = _UPVALUE1_
  L3_59 = L3_59.key
  L2_58 = L1_57(L2_58, L3_59, A0_56)
  if L2_58 == nil then
    L3_59 = _UPVALUE0_
    L3_59 = L3_59.TABLE_IS_FULL
    return L3_59
  end
  L3_59 = db
  L3_59 = L3_59.getAttribute
  L3_59 = L3_59(usersTable, _UPVALUE1_.key, L2_58, _UPVALUE1_.privacyAlgorithm)
  if L3_59 == nil then
    return _UPVALUE0_.FAILURE, L2_58
  end
  return _UPVALUE0_.SUCCESS, L2_58, L3_59
end
function privacyAlgorithmSet(A0_60, A1_61)
  local L2_62
  if A0_60 == nil then
    L2_62 = _UPVALUE0_
    L2_62 = L2_62.INVALID_ARGUMENT
    return L2_62
  end
  L2_62 = db
  L2_62 = L2_62.existsRow
  L2_62 = L2_62(usersTable, _UPVALUE1_.key, A0_60)
  if L2_62 == false then
    L2_62 = _UPVALUE0_
    L2_62 = L2_62.INVALID_ARGUMENT
    return L2_62
  end
  if A1_61 == nil then
    L2_62 = _UPVALUE0_
    L2_62 = L2_62.INVALID_ARGUMENT
    return L2_62
  end
  L2_62 = SECURITY_ALG1
  if A1_61 ~= L2_62 then
    L2_62 = SECURITY_ALG2
    if A1_61 ~= L2_62 then
      L2_62 = _UPVALUE0_
      L2_62 = L2_62.INVALID_ARGUMENT
      return L2_62
    end
  end
  L2_62 = nil
  if db.getAttribute(usersTable, _UPVALUE1_.key, A0_60, _UPVALUE1_.securityLevel) == SECURITY_LEVEL3 then
    L2_62 = db.setAttribute(usersTable, _UPVALUE1_.key, A0_60, _UPVALUE1_.privacyAlgorithm, A1_61)
  else
    return _UPVALUE0_.FAILURE
  end
  if L2_62 == nil then
    return _UPVALUE0_.FAILURE, A0_60
  end
  return _UPVALUE0_.SUCCESS, A0_60
end
function privacyPasswordGet()
  local L0_63, L1_64, L2_65
  L0_63 = cookieGet
  L1_64 = usersTable
  L2_65 = _UPVALUE0_
  L2_65 = L2_65.key
  L1_64 = L0_63(L1_64, L2_65)
  if L1_64 == nil then
    L2_65 = FAILURE
    return L2_65
  end
  L2_65 = db
  L2_65 = L2_65.getAttribute
  L2_65 = L2_65(usersTable, _UPVALUE0_.key, L1_64, _UPVALUE0_.privacyPassword)
  if L2_65 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_64, L2_65
end
function privacyPasswordGetNext(A0_66)
  local L1_67, L2_68, L3_69
  if A0_66 == nil then
    L1_67 = _UPVALUE0_
    L1_67 = L1_67.INVALID_ARGUMENT
    return L1_67
  end
  L1_67 = cookieGetNext
  L2_68 = usersTable
  L3_69 = _UPVALUE1_
  L3_69 = L3_69.key
  L2_68 = L1_67(L2_68, L3_69, A0_66)
  if L2_68 == nil then
    L3_69 = _UPVALUE0_
    L3_69 = L3_69.TABLE_IS_FULL
    return L3_69
  end
  L3_69 = db
  L3_69 = L3_69.getAttribute
  L3_69 = L3_69(usersTable, _UPVALUE1_.key, L2_68, _UPVALUE1_.privacyPassword)
  if L3_69 == nil then
    return _UPVALUE0_.FAILURE, L2_68
  end
  return _UPVALUE0_.SUCCESS, L2_68, L3_69
end
function privacyPasswordSet(A0_70, A1_71)
  local L2_72
  if A0_70 == nil then
    L2_72 = _UPVALUE0_
    L2_72 = L2_72.INVALID_ARGUMENT
    return L2_72
  end
  L2_72 = string
  L2_72 = L2_72.len
  L2_72 = L2_72(A1_71)
  if L2_72 < PRIVACY_PWD_MAX_SIZE then
    L2_72 = _UPVALUE0_
    L2_72 = L2_72.INVALID_ARGUMENT
    return L2_72
  end
  L2_72 = db
  L2_72 = L2_72.existsRow
  L2_72 = L2_72(usersTable, _UPVALUE1_.key, A0_70)
  if L2_72 == false then
    L2_72 = _UPVALUE0_
    L2_72 = L2_72.INVALID_ARGUMENT
    return L2_72
  end
  if A1_71 == nil then
    L2_72 = _UPVALUE0_
    L2_72 = L2_72.INVALID_ARGUMENT
    return L2_72
  end
  L2_72 = nil
  if db.getAttribute(usersTable, _UPVALUE1_.key, A0_70, _UPVALUE1_.securityLevel) == SECURITY_LEVEL3 then
    L2_72 = db.setAttribute(usersTable, _UPVALUE1_.key, A0_70, _UPVALUE1_.privacyPassword, A1_71)
  else
    return _UPVALUE0_.FAILURE
  end
  if L2_72 == nil then
    return _UPVALUE0_.FAILURE, A0_70
  end
  return _UPVALUE0_.SUCCESS, A0_70
end
function userGet()
  local L0_73, L1_74, L2_75, L3_76, L4_77, L5_78, L6_79, L7_80, L8_81, L9_82
  L0_73 = {}
  L1_74 = cookieGet
  L2_75 = usersTable
  L3_76 = _UPVALUE0_
  L3_76 = L3_76.key
  L2_75 = L1_74(L2_75, L3_76)
  if L2_75 == nil then
    L3_76 = FAILURE
    return L3_76
  end
  L3_76 = db
  L3_76 = L3_76.getRow
  L4_77 = usersTable
  L5_78 = _UPVALUE0_
  L5_78 = L5_78.key
  L6_79 = L2_75
  L3_76 = L3_76(L4_77, L5_78, L6_79)
  L0_73 = L3_76
  if L0_73 == nil then
    L3_76 = _UPVALUE1_
    L3_76 = L3_76.FAILURE
    return L3_76
  end
  L3_76, L4_77, L5_78, L6_79, L7_80, L8_81, L9_82 = nil, nil, nil, nil, nil, nil, nil
  L3_76 = L0_73[usersTable .. "." .. _UPVALUE0_.userName]
  L4_77 = L0_73[usersTable .. "." .. _UPVALUE0_.privilege]
  L5_78 = L0_73[usersTable .. "." .. _UPVALUE0_.securityLevel]
  L6_79 = L0_73[usersTable .. "." .. _UPVALUE0_.authAlgorithm]
  L7_80 = L0_73[usersTable .. "." .. _UPVALUE0_.authPassword]
  L8_81 = L0_73[usersTable .. "." .. _UPVALUE0_.privacyAlgorithm]
  L9_82 = L0_73[usersTable .. "." .. _UPVALUE0_.privacyPassword]
  if L3_76 == nil or L4_77 == nil or L5_78 == nil or L6_79 == nil or L7_80 == nil or L8_81 == nil or L9_82 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L2_75, L3_76, L4_77, L5_78, L6_79, L7_80, L8_81, L9_82
end
function userGetNext(A0_83)
  local L1_84, L2_85, L3_86, L4_87, L5_88, L6_89, L7_90, L8_91, L9_92, L10_93
  if A0_83 == nil then
    L1_84 = _UPVALUE0_
    L1_84 = L1_84.INVALID_ARGUMENT
    return L1_84
  end
  L1_84 = cookieGetNext
  L2_85 = usersTable
  L3_86 = _UPVALUE1_
  L3_86 = L3_86.key
  L4_87 = A0_83
  L2_85 = L1_84(L2_85, L3_86, L4_87)
  if L2_85 == nil then
    L3_86 = _UPVALUE0_
    L3_86 = L3_86.TABLE_IS_FULL
    return L3_86
  end
  L3_86 = {}
  L4_87 = db
  L4_87 = L4_87.getRow
  L5_88 = usersTable
  L6_89 = _UPVALUE1_
  L6_89 = L6_89.key
  L7_90 = L2_85
  L4_87 = L4_87(L5_88, L6_89, L7_90)
  L3_86 = L4_87
  if L3_86 == nil then
    L4_87 = _UPVALUE0_
    L4_87 = L4_87.FAILURE
    return L4_87
  end
  L4_87, L5_88, L6_89, L7_90, L8_91, L9_92, L10_93 = nil, nil, nil, nil, nil, nil, nil
  L4_87 = L3_86[usersTable .. "." .. _UPVALUE1_.userName]
  L5_88 = L3_86[usersTable .. "." .. _UPVALUE1_.privilege]
  L6_89 = L3_86[usersTable .. "." .. _UPVALUE1_.securityLevel]
  L7_90 = L3_86[usersTable .. "." .. _UPVALUE1_.authAlgorithm]
  L8_91 = L3_86[usersTable .. "." .. _UPVALUE1_.authPassword]
  L9_92 = L3_86[usersTable .. "." .. _UPVALUE1_.privacyAlgorithm]
  L10_93 = L3_86[usersTable .. "." .. _UPVALUE1_.privacyPassword]
  if L4_87 == nil or L5_88 == nil or L6_89 == nil or L7_90 == nil or L8_91 == nil or L9_92 == nil or L10_93 == nil then
    return _UPVALUE0_.FAILURE, A0_83
  end
  return _UPVALUE0_.SUCCESS, rowId, L4_87, L5_88, L6_89, L7_90, L8_91, L9_92, L10_93
end
function userGetAll()
  local L0_94
  L0_94 = {}
  L0_94 = db.getTable(usersTable, false)
  if L0_94 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_94
end
function userGetCur(A0_95)
  local L1_96, L2_97, L3_98, L4_99, L5_100, L6_101, L7_102, L8_103
  if A0_95 == nil then
    L1_96 = FAILURE
    return L1_96
  end
  L1_96 = {}
  L2_97 = db
  L2_97 = L2_97.getRow
  L3_98 = usersTable
  L4_99 = _UPVALUE0_
  L4_99 = L4_99.key
  L5_100 = A0_95
  L2_97 = L2_97(L3_98, L4_99, L5_100)
  L1_96 = L2_97
  if L1_96 == nil then
    L2_97 = _UPVALUE1_
    L2_97 = L2_97.FAILURE
    return L2_97
  end
  L2_97, L3_98, L4_99, L5_100, L6_101, L7_102, L8_103 = nil, nil, nil, nil, nil, nil, nil
  L2_97 = L1_96[usersTable .. "." .. _UPVALUE0_.userName]
  L3_98 = L1_96[usersTable .. "." .. _UPVALUE0_.privilege]
  L4_99 = L1_96[usersTable .. "." .. _UPVALUE0_.securityLevel]
  L5_100 = L1_96[usersTable .. "." .. _UPVALUE0_.authAlgorithm]
  L6_101 = L1_96[usersTable .. "." .. _UPVALUE0_.authPassword]
  L7_102 = L1_96[usersTable .. "." .. _UPVALUE0_.privacyAlgorithm]
  L8_103 = L1_96[usersTable .. "." .. _UPVALUE0_.privacyPassword]
  return _UPVALUE1_.SUCCESS, A0_95, L2_97, L3_98, L4_99, L5_100, L6_101, L7_102, L8_103
end
function userSet(A0_104, A1_105, A2_106, A3_107, A4_108, A5_109)
  local L6_110
  L6_110 = {}
  if A0_104 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_105 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_105 ~= SECURITY_LEVEL1 and A1_105 ~= SECURITY_LEVEL2 and A1_105 ~= SECURITY_LEVEL3 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L6_110[usersTable .. "." .. _UPVALUE1_.securityLevel] = A1_105
  if A1_105 == SECURITY_LEVEL2 or A1_105 == SECURITY_LEVEL3 then
    if A2_106 == nil then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if A2_106 ~= AUTH_ALG1 and A2_106 ~= AUTH_ALG2 then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    L6_110[usersTable .. "." .. _UPVALUE1_.authAlgorithm] = A2_106
    if A3_107 == nil then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if A2_106 == AUTH_ALG1 then
      if string.len(A3_107) ~= MD5_PWD_SIZE then
        return _UPVALUE2_.MD5_AUTHPWD_INVALID
      end
    elseif A2_106 == AUTH_ALG2 and string.len(A3_107) ~= SHA1_PWD_SIZE then
      return _UPVALUE2_.SHA1_AUTHPWD_INVALID
    end
    L6_110[usersTable .. "." .. _UPVALUE1_.authPassword] = A3_107
  end
  if A1_105 == SECURITY_LEVEL3 then
    if A4_108 == nil then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if A4_108 ~= SECURITY_ALG1 and A4_108 ~= SECURITY_ALG2 then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    L6_110[usersTable .. "." .. _UPVALUE1_.privacyAlgorithm] = A4_108
    if A5_109 == nil then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if A4_108 == SECURITY_ALG1 then
      if string.len(A5_109) ~= DES_PWD_SIZE then
        return _UPVALUE2_.DES_PRIVACYPWD_INVALID
      end
    elseif A4_108 == SECURITY_ALG2 and string.len(A5_109) ~= AES_PWD_SIZE then
      return _UPVALUE2_.AES_PRIVACYPWD_INVALID
    end
    L6_110[usersTable .. "." .. _UPVALUE1_.privacyPassword] = A5_109
  end
  if db.update(usersTable, L6_110, A0_104) == nil then
    return _UPVALUE0_.FAILURE, A0_104
  end
  return _UPVALUE0_.SUCCESS, A0_104
end
function userCreate(A0_111, A1_112, A2_113, A3_114, A4_115, A5_116, A6_117)
  local L8_118
  L8_118 = _UPVALUE0_
  L8_118 = L8_118.NOT_SUPPORTED
  return L8_118, rowid
end
function userDelete(A0_119)
  local L2_120
  L2_120 = _UPVALUE0_
  L2_120 = L2_120.NOT_SUPPORTED
  return L2_120, A0_119
end
