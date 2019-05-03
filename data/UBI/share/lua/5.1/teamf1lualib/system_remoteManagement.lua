local L0_0
L0_0 = module
L0_0("com.teamf1.core.system.remotemanagement", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/platform_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).key = "_ROWID_"
;({}).value = "1"
;({}).remoteMgmt = "0"
;({}).ssh = "2"
;({}).feature = "accessMgmtEnable"
;({}).useHttps = "accessMgmtEnable"
;({}).port = "port"
;({}).allowSsh = "accessMgmtEnable"
;({}).allowSnmp = "Status"
;({}).accessType = "accessType"
;({}).accessMgmtIP1 = "accessMgmtIP1"
;({}).accessMgmtIP2 = "accessMgmtIP2"
;({}).externalPing = "ExternalPing"
;({}).httpsMgmtEnable = "httpsMgmtEnable"
;({}).httpsMgmtPort = "httpsMgmtPort"
IP_RANGE = "1"
SINGLE_IP = "2"
function isfeatureEnabled()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.remoteMgmt, _UPVALUE1_.feature)
  if L0_1 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 0, L0_1
end
function isfeatureEnabledNext(A0_2)
  local L2_3
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.NOT_SUPPORTED
  return L2_3, A0_2
end
function featureEnable(A0_4)
  if db.setAttribute(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.remoteMgmt, _UPVALUE1_.feature, _UPVALUE2_) == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE, A0_4
  end
  return _UPVALUE3_.SUCCESS, A0_4
end
function featureDisable(A0_5)
  if db.setAttribute(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.remoteMgmt, _UPVALUE1_.feature, _UPVALUE2_) == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE, A0_5
  end
  return _UPVALUE3_.SUCCESS, A0_5
end
function isuseHttpsEnabled()
  local L0_6
  L0_6 = db
  L0_6 = L0_6.getAttribute
  L0_6 = L0_6(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.remoteMgmt, _UPVALUE1_.useHttps)
  if L0_6 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 0, L0_6
end
function isuseHttpsEnabledNext(A0_7)
  local L2_8
  L2_8 = _UPVALUE0_
  L2_8 = L2_8.NOT_SUPPORTED
  return L2_8, A0_7
end
function useHttpsEnable(A0_9)
  if db.setAttribute(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.remoteMgmt, _UPVALUE1_.useHttps, _UPVALUE2_) == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE, A0_9
  end
  return _UPVALUE3_.SUCCESS, A0_9
end
function useHttpsDisable(A0_10)
  if db.setAttribute(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.remoteMgmt, _UPVALUE1_.useHttps, _UPVALUE2_) == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE, A0_10
  end
  return _UPVALUE3_.SUCCESS, A0_10
end
function portGet()
  local L0_11
  L0_11 = db
  L0_11 = L0_11.getAttribute
  L0_11 = L0_11(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.remoteMgmt, _UPVALUE1_.port)
  if L0_11 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 0, L0_11
end
function portGetNext(A0_12)
  local L1_13
  L1_13 = db
  L1_13 = L1_13.getAttribute
  L1_13 = L1_13(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.ssh, _UPVALUE1_.port)
  if L1_13 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_12
  end
  return _UPVALUE2_.SUCCESS, A0_12, L1_13
end
function portSet(A0_14, A1_15)
  if A1_15 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_15) < _UPVALUE1_ or tonumber(A1_15) > _UPVALUE2_ then
    return _UPVALUE3_.INVALID_PORT_NUMBER
  end
  if db.setAttribute(_UPVALUE4_, _UPVALUE5_.key, _UPVALUE5_.remoteMgmt, _UPVALUE5_.port, A1_15) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_14
  end
  return _UPVALUE0_.SUCCESS, A0_14
end
function isallowSshEnabled(A0_16)
  local L1_17
  L1_17 = db
  L1_17 = L1_17.getAttribute
  L1_17 = L1_17(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.ssh, _UPVALUE1_.allowSsh)
  if L1_17 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L1_17
end
function isallowSshEnabledNext(A0_18)
  local L2_19
  L2_19 = _UPVALUE0_
  L2_19 = L2_19.NOT_SUPPORTED
  return L2_19, A0_18
end
function allowSshEnable(A0_20)
  if db.setAttribute(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.ssh, _UPVALUE1_.allowSsh, _UPVALUE2_) == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE, A0_20
  end
  return _UPVALUE3_.SUCCESS, A0_20
end
function allowSshDisable(A0_21)
  if db.setAttribute(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.ssh, _UPVALUE1_.allowSsh, _UPVALUE2_) == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE, A0_21
  end
  return _UPVALUE3_.SUCCESS, A0_21
end
function isallowSnmpEnabled()
  local L0_22
  L0_22 = db
  L0_22 = L0_22.getAttribute
  L0_22 = L0_22(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.value, _UPVALUE1_.allowSnmp)
  if L0_22 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_22
end
function isallowSnmpEnabledNext(A0_23)
  local L2_24
  L2_24 = _UPVALUE0_
  L2_24 = L2_24.NOT_SUPPORTED
  return L2_24, rowId
end
function allowSnmpEnable(A0_25)
  if db.setAttribute(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.value, _UPVALUE1_.allowSnmp, _UPVALUE2_) == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE, A0_25
  end
  return _UPVALUE3_.SUCCESS, A0_25
end
function allowSnmpDisable(A0_26)
  if db.setAttribute(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.value, _UPVALUE1_.allowSnmp, _UPVALUE2_) == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE, A0_26
  end
  return _UPVALUE3_.SUCCESS, A0_26
end
function accessTypeGet(A0_27)
  local L1_28
  L1_28 = db
  L1_28 = L1_28.getAttribute
  L1_28 = L1_28(_UPVALUE0_, _UPVALUE1_.key, A0_27, _UPVALUE1_.accessType)
  if L1_28 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L1_28
end
function accessTypeGetNext(A0_29)
  local L1_30
  L1_30 = db
  L1_30 = L1_30.getAttribute
  L1_30 = L1_30(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.ssh, _UPVALUE1_.accessType)
  if L1_30 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_29
  end
  return _UPVALUE2_.SUCCESS, A0_29, L1_30
end
function accessTypeSet(A0_31, A1_32)
  if A1_32 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_32) ~= 0 and tonumber(A1_32) ~= 1 and tonumber(A1_32) ~= 2 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, A0_31, _UPVALUE2_.accessType, A1_32)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_31
  end
  return _UPVALUE0_.SUCCESS, A0_31
end
function ipAddress1Get(A0_33)
  local L1_34
  L1_34 = db
  L1_34 = L1_34.getAttribute
  L1_34 = L1_34(_UPVALUE0_, _UPVALUE1_.key, A0_33, _UPVALUE1_.accessMgmtIP1)
  if L1_34 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L1_34
end
function ipAddress1GetNext(A0_35)
  local L1_36
  L1_36 = db
  L1_36 = L1_36.getAttribute
  L1_36 = L1_36(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.ssh, _UPVALUE1_.accessMgmtIP1)
  if L1_36 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_35
  end
  return _UPVALUE2_.SUCCESS, A0_35, L1_36
end
function ipAddress1Set(A0_37, A1_38)
  local L2_39
  L2_39 = _UPVALUE0_
  L2_39 = L2_39.NIL
  if A1_38 == L2_39 then
    L2_39 = _UPVALUE0_
    L2_39 = L2_39.INVALID_ARGUMENT
    return L2_39
  end
  L2_39 = _UPVALUE1_
  L2_39 = L2_39.ipAddressCheck
  L2_39 = L2_39("2", A1_38)
  valid = L2_39
  L2_39 = valid
  if L2_39 ~= _UPVALUE0_.SUCCESS then
    L2_39 = _UPVALUE2_
    L2_39 = L2_39.INVALID_FROM_IPADDRESS
    return L2_39
  end
  L2_39 = db
  L2_39 = L2_39.setAttribute
  L2_39 = L2_39(_UPVALUE3_, _UPVALUE4_.key, _UPVALUE4_.remoteMgmt, _UPVALUE4_.accessMgmtIP1, A1_38)
  if L2_39 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_37
  end
  L2_39 = db.setAttribute(_UPVALUE3_, _UPVALUE4_.key, _UPVALUE4_.ssh, _UPVALUE4_.accessMgmtIP1, A1_38)
  if L2_39 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_37
  end
  return _UPVALUE0_.SUCCESS, A0_37
end
function ipAddress2Get(A0_40)
  local L1_41
  L1_41 = db
  L1_41 = L1_41.getAttribute
  L1_41 = L1_41(_UPVALUE0_, _UPVALUE1_.key, A0_40, _UPVALUE1_.accessMgmtIP2)
  if L1_41 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L1_41
end
function ipAddress2GetNext(A0_42)
  local L1_43
  L1_43 = db
  L1_43 = L1_43.getAttribute
  L1_43 = L1_43(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.ssh, _UPVALUE1_.accessMgmtIP2)
  if L1_43 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_42
  end
  return _UPVALUE2_.SUCCESS, A0_42, L1_43
end
function ipAddress2Set(A0_44, A1_45)
  local L2_46
  L2_46 = _UPVALUE0_
  L2_46 = L2_46.NIL
  if A1_45 == L2_46 then
    L2_46 = _UPVALUE0_
    L2_46 = L2_46.INVALID_ARGUMENT
    return L2_46
  end
  L2_46 = _UPVALUE1_
  L2_46 = L2_46.ipAddressCheck
  L2_46 = L2_46("2", A1_45)
  valid = L2_46
  L2_46 = valid
  if L2_46 ~= _UPVALUE0_.SUCCESS then
    L2_46 = _UPVALUE2_
    L2_46 = L2_46.INVALID_TO_IPADDRESS
    return L2_46
  end
  L2_46 = db
  L2_46 = L2_46.setAttribute
  L2_46 = L2_46(_UPVALUE3_, _UPVALUE4_.key, _UPVALUE4_.remoteMgmt, _UPVALUE4_.accessMgmtIP2, A1_45)
  if L2_46 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_44
  end
  L2_46 = db.setAttribute(_UPVALUE3_, _UPVALUE4_.key, _UPVALUE4_.ssh, _UPVALUE4_.accessMgmtIP2, A1_45)
  if L2_46 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_44
  end
  return _UPVALUE0_.SUCCESS, A0_44
end
function isrespondToPingEnabled()
  local L0_47
  L0_47 = db
  L0_47 = L0_47.getAttribute
  L0_47 = L0_47(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.value, _UPVALUE1_.externalPing)
  if L0_47 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_47
end
function isrespondToPingEnabledNext(A0_48)
  local L2_49
  L2_49 = _UPVALUE0_
  L2_49 = L2_49.NOT_SUPPORTED
  return L2_49, A0_48
end
function respondToPingEnable(A0_50)
  if db.setAttribute(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.value, _UPVALUE1_.externalPing, _UPVALUE2_) == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE, A0_50
  end
  if db.setAttribute(_UPVALUE4_, _UPVALUE1_.key, _UPVALUE1_.value, _UPVALUE1_.externalPing, _UPVALUE2_) == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE, A0_50
  end
  return _UPVALUE3_.SUCCESS, A0_50
end
function respondToPingDisable(A0_51)
  if db.setAttribute(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.value, _UPVALUE1_.externalPing, _UPVALUE2_) == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE, A0_51
  end
  if db.setAttribute(_UPVALUE4_, _UPVALUE1_.key, _UPVALUE1_.value, _UPVALUE1_.externalPing, _UPVALUE2_) == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE, A0_51
  end
  return _UPVALUE3_.SUCCESS, A0_51
end
function remoteManagementSetupGet()
  local L0_52, L1_53, L2_54, L3_55, L4_56, L5_57, L6_58, L7_59, L8_60
  L0_52 = db
  L0_52 = L0_52.getAttribute
  L1_53 = _UPVALUE0_
  L2_54 = _UPVALUE1_
  L2_54 = L2_54.key
  L3_55 = _UPVALUE1_
  L3_55 = L3_55.remoteMgmt
  L4_56 = _UPVALUE1_
  L4_56 = L4_56.feature
  L0_52 = L0_52(L1_53, L2_54, L3_55, L4_56)
  L1_53 = db
  L1_53 = L1_53.getAttribute
  L2_54 = _UPVALUE0_
  L3_55 = _UPVALUE1_
  L3_55 = L3_55.key
  L4_56 = _UPVALUE1_
  L4_56 = L4_56.remoteMgmt
  L5_57 = _UPVALUE1_
  L5_57 = L5_57.useHttps
  L1_53 = L1_53(L2_54, L3_55, L4_56, L5_57)
  L2_54 = db
  L2_54 = L2_54.getAttribute
  L3_55 = _UPVALUE0_
  L4_56 = _UPVALUE1_
  L4_56 = L4_56.key
  L5_57 = _UPVALUE1_
  L5_57 = L5_57.remoteMgmt
  L6_58 = _UPVALUE1_
  L6_58 = L6_58.port
  L2_54 = L2_54(L3_55, L4_56, L5_57, L6_58)
  L3_55 = db
  L3_55 = L3_55.getAttribute
  L4_56 = _UPVALUE0_
  L5_57 = _UPVALUE1_
  L5_57 = L5_57.key
  L6_58 = _UPVALUE1_
  L6_58 = L6_58.ssh
  L7_59 = _UPVALUE1_
  L7_59 = L7_59.allowSsh
  L3_55 = L3_55(L4_56, L5_57, L6_58, L7_59)
  L4_56 = db
  L4_56 = L4_56.getAttribute
  L5_57 = _UPVALUE2_
  L6_58 = _UPVALUE1_
  L6_58 = L6_58.key
  L7_59 = _UPVALUE1_
  L7_59 = L7_59.value
  L8_60 = _UPVALUE1_
  L8_60 = L8_60.allowSnmp
  L4_56 = L4_56(L5_57, L6_58, L7_59, L8_60)
  L5_57 = db
  L5_57 = L5_57.getAttribute
  L6_58 = _UPVALUE0_
  L7_59 = _UPVALUE1_
  L7_59 = L7_59.key
  L8_60 = _UPVALUE1_
  L8_60 = L8_60.remoteMgmt
  L5_57 = L5_57(L6_58, L7_59, L8_60, _UPVALUE1_.accessType)
  L6_58 = db
  L6_58 = L6_58.getAttribute
  L7_59 = _UPVALUE0_
  L8_60 = _UPVALUE1_
  L8_60 = L8_60.key
  L6_58 = L6_58(L7_59, L8_60, _UPVALUE1_.remoteMgmt, _UPVALUE1_.accessMgmtIP1)
  L7_59 = db
  L7_59 = L7_59.getAttribute
  L8_60 = _UPVALUE0_
  L7_59 = L7_59(L8_60, _UPVALUE1_.key, _UPVALUE1_.remoteMgmt, _UPVALUE1_.accessMgmtIP2)
  L8_60 = db
  L8_60 = L8_60.getAttribute
  L8_60 = L8_60(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.remoteMgmt, _UPVALUE1_.accessMgmtIP1)
  if L0_52 == _UPVALUE3_.NIL or L1_53 == _UPVALUE3_.NIL or L2_54 == _UPVALUE3_.NIL or L3_55 == _UPVALUE3_.NIL or L4_56 == _UPVALUE3_.NIL or L5_57 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L0_52, L1_53, L2_54, L3_55, L4_56, L5_57, L6_58, L7_59, L8_60
end
function remoteManagementSetupGetNext(A0_61)
  local L1_62, L2_63, L3_64, L4_65, L5_66, L6_67, L7_68, L8_69
  L1_62 = db
  L1_62 = L1_62.getAttribute
  L2_63 = _UPVALUE0_
  L3_64 = _UPVALUE1_
  L3_64 = L3_64.key
  L4_65 = _UPVALUE1_
  L4_65 = L4_65.remoteMgmt
  L5_66 = _UPVALUE1_
  L5_66 = L5_66.feature
  L1_62 = L1_62(L2_63, L3_64, L4_65, L5_66)
  L2_63 = db
  L2_63 = L2_63.getAttribute
  L3_64 = _UPVALUE0_
  L4_65 = _UPVALUE1_
  L4_65 = L4_65.key
  L5_66 = _UPVALUE1_
  L5_66 = L5_66.remoteMgmt
  L6_67 = _UPVALUE1_
  L6_67 = L6_67.useHttps
  L2_63 = L2_63(L3_64, L4_65, L5_66, L6_67)
  L3_64 = db
  L3_64 = L3_64.getAttribute
  L4_65 = _UPVALUE0_
  L5_66 = _UPVALUE1_
  L5_66 = L5_66.key
  L6_67 = _UPVALUE1_
  L6_67 = L6_67.remoteMgmt
  L7_68 = _UPVALUE1_
  L7_68 = L7_68.port
  L3_64 = L3_64(L4_65, L5_66, L6_67, L7_68)
  L4_65 = db
  L4_65 = L4_65.getAttribute
  L5_66 = _UPVALUE0_
  L6_67 = _UPVALUE1_
  L6_67 = L6_67.key
  L7_68 = _UPVALUE1_
  L7_68 = L7_68.ssh
  L8_69 = _UPVALUE1_
  L8_69 = L8_69.allowSsh
  L4_65 = L4_65(L5_66, L6_67, L7_68, L8_69)
  L5_66 = db
  L5_66 = L5_66.getAttribute
  L6_67 = _UPVALUE2_
  L7_68 = _UPVALUE1_
  L7_68 = L7_68.key
  L8_69 = _UPVALUE1_
  L8_69 = L8_69.value
  L5_66 = L5_66(L6_67, L7_68, L8_69, _UPVALUE1_.allowSnmp)
  L6_67 = db
  L6_67 = L6_67.getAttribute
  L7_68 = _UPVALUE0_
  L8_69 = _UPVALUE1_
  L8_69 = L8_69.key
  L6_67 = L6_67(L7_68, L8_69, _UPVALUE1_.ssh, _UPVALUE1_.accessType)
  L7_68 = db
  L7_68 = L7_68.getAttribute
  L8_69 = _UPVALUE0_
  L7_68 = L7_68(L8_69, _UPVALUE1_.key, _UPVALUE1_.ssh, _UPVALUE1_.accessMgmtIP1)
  L8_69 = db
  L8_69 = L8_69.getAttribute
  L8_69 = L8_69(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.ssh, _UPVALUE1_.accessMgmtIP2)
  if L1_62 == _UPVALUE3_.NIL or L2_63 == _UPVALUE3_.NIL or L3_64 == _UPVALUE3_.NIL or L4_65 == _UPVALUE3_.NIL or L5_66 == _UPVALUE3_.NIL or L6_67 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L1_62, L2_63, L3_64, L4_65, L5_66, L6_67, L7_68, L8_69
end
function remoteManagementSetupSet(A0_70, A1_71, A2_72, A3_73, A4_74, A5_75, A6_76, A7_77, A8_78, A9_79)
  local L10_80, L11_81, L12_82, L13_83
  L10_80 = _UPVALUE0_
  L10_80 = L10_80.NIL
  if A1_71 == L10_80 then
    L10_80 = _UPVALUE0_
    L10_80 = L10_80.INVALID_ARGUMENT
    return L10_80
  end
  L10_80 = _UPVALUE1_
  L10_80 = L10_80.isBoolean
  L11_81 = A1_71
  L10_80 = L10_80(L11_81)
  valid = L10_80
  L10_80 = valid
  L11_81 = _UPVALUE0_
  L11_81 = L11_81.SUCCESS
  if L10_80 ~= L11_81 then
    L10_80 = _UPVALUE0_
    L10_80 = L10_80.FAILURE
    return L10_80
  end
  if A1_71 == "1" then
    L10_80 = _UPVALUE0_
    L10_80 = L10_80.NIL
    if A2_72 == L10_80 then
      L10_80 = _UPVALUE0_
      L10_80 = L10_80.INVALID_ARGUMENT
      return L10_80
    end
    L10_80 = _UPVALUE1_
    L10_80 = L10_80.isBoolean
    L11_81 = A2_72
    L10_80 = L10_80(L11_81)
    valid = L10_80
    L10_80 = valid
    L11_81 = _UPVALUE0_
    L11_81 = L11_81.SUCCESS
    if L10_80 ~= L11_81 then
      L10_80 = _UPVALUE0_
      L10_80 = L10_80.INVALID_ARGUMENT
      return L10_80
    end
    L10_80 = _UPVALUE0_
    L10_80 = L10_80.NIL
    if A3_73 == L10_80 then
      L10_80 = _UPVALUE0_
      L10_80 = L10_80.INVALID_ARGUMENT
      return L10_80
    end
    L10_80 = tonumber
    L11_81 = A3_73
    L10_80 = L10_80(L11_81)
    if L10_80 < 1 or L10_80 > 65535 then
      L11_81 = _UPVALUE2_
      L11_81 = L11_81.INVALID_PORT_NUMBER
      return L11_81
    end
  end
  L10_80 = _UPVALUE0_
  L10_80 = L10_80.NIL
  if A4_74 == L10_80 then
    L10_80 = _UPVALUE0_
    L10_80 = L10_80.INVALID_ARGUMENT
    return L10_80
  end
  L10_80 = _UPVALUE1_
  L10_80 = L10_80.isBoolean
  L11_81 = A4_74
  L10_80 = L10_80(L11_81)
  valid = L10_80
  L10_80 = valid
  L11_81 = _UPVALUE0_
  L11_81 = L11_81.SUCCESS
  if L10_80 ~= L11_81 then
    L10_80 = _UPVALUE0_
    L10_80 = L10_80.INVALID_ARGUMENT
    return L10_80
  end
  L10_80 = _UPVALUE0_
  L10_80 = L10_80.NIL
  if A5_75 == L10_80 then
    L10_80 = _UPVALUE0_
    L10_80 = L10_80.INVALID_ARGUMENT
    return L10_80
  end
  L10_80 = _UPVALUE1_
  L10_80 = L10_80.isBoolean
  L11_81 = A5_75
  L10_80 = L10_80(L11_81)
  valid = L10_80
  L10_80 = valid
  L11_81 = _UPVALUE0_
  L11_81 = L11_81.SUCCESS
  if L10_80 ~= L11_81 then
    L10_80 = _UPVALUE0_
    L10_80 = L10_80.INVALID_ARGUMENT
    return L10_80
  end
  L10_80 = _UPVALUE3_
  if A4_74 ~= L10_80 then
    L10_80 = _UPVALUE3_
  elseif A1_71 == L10_80 then
    L10_80 = _UPVALUE0_
    L10_80 = L10_80.NIL
    if A6_76 == L10_80 then
      L10_80 = _UPVALUE0_
      L10_80 = L10_80.INVALID_ARGUMENT
      return L10_80
    end
    L10_80 = tonumber
    L11_81 = A6_76
    L10_80 = L10_80(L11_81)
    if L10_80 ~= 0 and L10_80 ~= 1 and L10_80 ~= 2 then
      L11_81 = _UPVALUE0_
      L11_81 = L11_81.INVALID_ARGUMENT
      return L11_81
    end
    if A6_76 == "1" then
      L11_81 = _UPVALUE0_
      L11_81 = L11_81.NIL
      if A7_77 == L11_81 then
        L11_81 = _UPVALUE2_
        L11_81 = L11_81.INVALID_FROM_IPADDRESS
        return L11_81
      end
      L11_81 = _UPVALUE1_
      L11_81 = L11_81.ipAddressCheck
      L12_82 = "2"
      L13_83 = A7_77
      L11_81 = L11_81(L12_82, L13_83)
      valid = L11_81
      L11_81 = valid
      L12_82 = _UPVALUE0_
      L12_82 = L12_82.SUCCESS
      if L11_81 ~= L12_82 then
        L11_81 = _UPVALUE2_
        L11_81 = L11_81.INVALID_FROM_IPADDRESS
        return L11_81
      end
      L11_81 = _UPVALUE0_
      L11_81 = L11_81.NIL
      if A8_78 == L11_81 then
        L11_81 = _UPVALUE2_
        L11_81 = L11_81.INVALID_TO_IPADDRESS
        return L11_81
      end
      L11_81 = _UPVALUE1_
      L11_81 = L11_81.ipAddressCheck
      L12_82 = "2"
      L13_83 = A8_78
      L11_81 = L11_81(L12_82, L13_83)
      valid = L11_81
      L11_81 = valid
      L12_82 = _UPVALUE0_
      L12_82 = L12_82.SUCCESS
      if L11_81 ~= L12_82 then
        L11_81 = _UPVALUE2_
        L11_81 = L11_81.INVALID_TO_IPADDRESS
        return L11_81
      end
    end
    if A6_76 == "2" then
      L11_81 = _UPVALUE0_
      L11_81 = L11_81.NIL
      if A9_79 == L11_81 then
        L11_81 = _UPVALUE2_
        L11_81 = L11_81.INVALID_SELECTEDPC_IPADDRESS
        return L11_81
      end
      L11_81 = _UPVALUE1_
      L11_81 = L11_81.ipAddressCheck
      L12_82 = "2"
      L13_83 = A9_79
      L12_82 = L11_81(L12_82, L13_83)
      msg = L12_82
      valid = L11_81
      L11_81 = valid
      L12_82 = _UPVALUE0_
      L12_82 = L12_82.SUCCESS
      if L11_81 ~= L12_82 then
        L11_81 = _UPVALUE2_
        L11_81 = L11_81.INVALID_SELECTEDPC_IPADDRESS
        return L11_81
      end
    end
  end
  L10_80 = {}
  L11_81 = {}
  L12_82 = db
  L12_82 = L12_82.setAttribute
  L13_83 = _UPVALUE4_
  L12_82 = L12_82(L13_83, _UPVALUE5_.key, _UPVALUE5_.value, _UPVALUE5_.allowSnmp, A5_75)
  L13_83 = _UPVALUE0_
  L13_83 = L13_83.NIL
  if L12_82 == L13_83 then
    L13_83 = _UPVALUE0_
    L13_83 = L13_83.FAILURE
    return L13_83, A0_70
  end
  L13_83 = _UPVALUE6_
  if A4_74 == L13_83 then
    L13_83 = _UPVALUE6_
    if A1_71 == L13_83 then
      L13_83 = db
      L13_83 = L13_83.setAttribute
      L13_83 = L13_83(_UPVALUE7_, _UPVALUE5_.key, _UPVALUE5_.ssh, _UPVALUE5_.allowSsh, A4_74)
      if L13_83 == _UPVALUE0_.NIL then
        return _UPVALUE0_.FAILURE, A0_70
      end
      if db.setAttribute(_UPVALUE7_, _UPVALUE5_.key, _UPVALUE5_.remoteMgmt, _UPVALUE5_.feature, A1_71) == _UPVALUE0_.NIL then
        return _UPVALUE0_.FAILURE, A0_70
      end
    end
  else
    L13_83 = _UPVALUE7_
    L13_83 = L13_83 .. "." .. _UPVALUE5_.useHttps
    L10_80[L13_83] = A2_72
    L13_83 = _UPVALUE3_
    if A1_71 == L13_83 then
      L13_83 = _UPVALUE7_
      L13_83 = L13_83 .. "." .. _UPVALUE5_.port
      L10_80[L13_83] = A3_73
    end
    L13_83 = _UPVALUE7_
    L13_83 = L13_83 .. "." .. _UPVALUE5_.accessType
    L10_80[L13_83] = A6_76
    L13_83 = _UPVALUE7_
    L13_83 = L13_83 .. "." .. _UPVALUE5_.allowSsh
    L11_81[L13_83] = A4_74
    L13_83 = _UPVALUE7_
    L13_83 = L13_83 .. "." .. _UPVALUE5_.accessType
    L11_81[L13_83] = A6_76
    L13_83 = IP_RANGE
    if A6_76 == L13_83 then
      L13_83 = _UPVALUE7_
      L13_83 = L13_83 .. "." .. _UPVALUE5_.accessMgmtIP1
      L11_81[L13_83] = A7_77
      L13_83 = _UPVALUE7_
      L13_83 = L13_83 .. "." .. _UPVALUE5_.accessMgmtIP2
      L11_81[L13_83] = A8_78
      L13_83 = _UPVALUE7_
      L13_83 = L13_83 .. "." .. _UPVALUE5_.accessMgmtIP1
      L10_80[L13_83] = A7_77
      L13_83 = _UPVALUE7_
      L13_83 = L13_83 .. "." .. _UPVALUE5_.accessMgmtIP2
      L10_80[L13_83] = A8_78
    end
    L13_83 = SINGLE_IP
    if A6_76 == L13_83 then
      L13_83 = _UPVALUE7_
      L13_83 = L13_83 .. "." .. _UPVALUE5_.accessMgmtIP1
      L11_81[L13_83] = A9_79
      L13_83 = _UPVALUE7_
      L13_83 = L13_83 .. "." .. _UPVALUE5_.accessMgmtIP1
      L10_80[L13_83] = A9_79
    end
  end
  L13_83 = db
  L13_83 = L13_83.update
  L13_83 = L13_83(_UPVALUE7_, L10_80, _UPVALUE5_.remoteMgmt)
  if L13_83 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L13_83 = db.update(_UPVALUE7_, L11_81, _UPVALUE5_.ssh)
  if L13_83 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_70
end
function remoteManagementSetupCreate(A0_84, A1_85, A2_86, A3_87, A4_88, A5_89, A6_90, A7_91)
  local L9_92
  L9_92 = _UPVALUE0_
  L9_92 = L9_92.NOT_SUPPORTED
  return L9_92, cookie
end
function remoteManagementSetupDelete(A0_93)
  local L2_94
  L2_94 = _UPVALUE0_
  L2_94 = L2_94.NOT_SUPPORTED
  return L2_94, A0_93
end
function httpsMgmtTblUpdate(A0_95, A1_96)
  local L2_97
  L2_97 = {}
  L2_97 = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE2_)
  if L2_97 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  if A0_95 ~= nil then
    L2_97[_UPVALUE0_ .. "." .. _UPVALUE1_.httpsMgmtEnable] = A0_95
  end
  L2_97[_UPVALUE0_ .. "." .. _UPVALUE1_.httpsMgmtPort] = A1_96
  if db.update(_UPVALUE0_, L2_97, _UPVALUE2_) == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS
end
