local L0_0
L0_0 = module
L0_0("com.teamf1.core.captiveportal.billing", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/captiveportal_validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/captivePortal_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
billingTable = "tempCPUserProfiles"
attribute = {}
attribute.profile = "ProfileName"
attribute.description = "ProfileDesc"
attribute.multiLogin = "MultiLogin"
attribute.customizedAccount = "ModifyAccount"
attribute.batchGeneration = "BatchGen"
attribute.sessionTimeout = "IdleTimeout"
attribute.alertLimit = "AlertValue"
attribute.alertType = "AlertType"
attribute.timed = "ValidDurationCheck"
attribute.timeLimit = "StartTimeValue"
attribute.startType = "DurationType"
attribute.customStartTime = "BeginDate"
attribute.customizeTime = "ModifyDuration"
attribute.maxTrafficUsage = "MaxUsageTrafficValue"
attribute.trafficUsageType = "MaxUsageTrafficType"
attribute.maxUsageTime = "MaxUsageTimeValue"
attribute.usageTimeType = "MaxUsageTimeType"
attribute.customizeUsage = "ModifyUsage"
attribute.profileId = "ProfileId"
attribute.showAlert = "ShowAlert"
attribute.timeType = "StartTimeType"
attribute.maxUsageTimeCheck = "MaxUsageTimeCheck"
attribute.maxTrafficUsageCheck = "MaxUsageTrafficCheck"
attribute.setPriceEnable = "setPriceEnable"
attribute.price = "price"
attribute.currency = "currency"
attribute.billingProfileIds = "billingProfileIds"
attribute.externalPaymentGW = "externalPaymentGW"
ENABLE = "1"
DISABLE = "0"
NIL = nil
FALSE = false
ROWID = "_ROWID_"
HR = 0
DAY = 1
GB = 2
MB = 3
INTIGER_MB = 2
INTIGER_GB = 3
MAXLEN_PROFILE = 32
MINLEN_PROFILE = 1
MAXLEN_DESC = 944
MINLEN_DESC = 1
CUSTOM_TIME_LEN = 19
ACCOUNT_CREATION = 0
ACCOUNT_LOGIN = 1
CUSTOM_START = 2
MAX_MB = 1023
MIN_MB = 0
MAX_GB = 100
MIN_GB = 0
MAX_DAYS = 365
MIN_DAYS = 0
MAX_HOURS = 23
MIN_HOURS = 0
MAX_TIMEOUT = 60
MIN_TIMEOUT = 0
MAX_BILLING_PROFILE = 14
function profileGet()
  local L0_1, L1_2, L2_3
  L0_1 = getFirstCookie
  L1_2 = ROWID
  L2_3 = billingTable
  L1_2 = L0_1(L1_2, L2_3)
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.SUCCESS
  if L0_1 ~= L2_3 then
    return L0_1
  end
  L2_3 = db
  L2_3 = L2_3.getAttribute
  L2_3 = L2_3(billingTable, ROWID, L1_2, attribute.profile)
  if L2_3 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_2, L2_3
end
function profileGetNext(A0_4)
  local L1_5, L2_6, L3_7, L4_8, L5_9
  L1_5 = NIL
  if A0_4 == L1_5 then
    L1_5 = _UPVALUE0_
    L1_5 = L1_5.INVALID_ARGUMENT
    return L1_5
  end
  L1_5 = cookieValidate
  L2_6 = ROWID
  L3_7 = A0_4
  L4_8 = billingTable
  L2_6 = L1_5(L2_6, L3_7, L4_8)
  L3_7 = _UPVALUE0_
  L3_7 = L3_7.SUCCESS
  if L1_5 ~= L3_7 then
    return L1_5
  end
  L3_7 = getNextValidCookie
  L4_8 = ROWID
  L5_9 = L2_6
  L4_8 = L3_7(L4_8, L5_9, billingTable)
  L5_9 = _UPVALUE0_
  L5_9 = L5_9.SUCCESS
  if L3_7 ~= L5_9 then
    return L3_7
  end
  L5_9 = db
  L5_9 = L5_9.getAttribute
  L5_9 = L5_9(billingTable, ROWID, L4_8, attribute.profile)
  if L5_9 == NIL then
    return _UPVALUE0_.FAILURE, L2_6
  end
  return _UPVALUE0_.SUCCESS, L4_8, L5_9
end
function profileSet(A0_10, A1_11)
  local L2_12, L3_13
  L2_12 = NIL
  if A0_10 == L2_12 then
    L2_12 = _UPVALUE0_
    L2_12 = L2_12.INVALID_ARGUMENT
    return L2_12
  end
  L2_12 = cookieValidate
  L3_13 = ROWID
  L3_13 = L2_12(L3_13, A0_10, billingTable)
  if L2_12 ~= _UPVALUE0_.SUCCESS then
    return L2_12
  end
  if A1_11 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_11) > MAXLEN_PROFILE or string.len(A1_11) < MINLEN_PROFILE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(billingTable, ROWID, L3_13, attribute.profile, A1_11) == NIL then
    return _UPVALUE0_.FAILURE, L3_13
  end
  return _UPVALUE0_.SUCCESS, L3_13
end
function profileDelete(A0_14, A1_15)
  local L2_16, L3_17
  L2_16 = NIL
  if A0_14 == L2_16 then
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.INVALID_ARGUMENT
    return L2_16
  end
  L2_16 = cookieValidate
  L3_17 = ROWID
  L3_17 = L2_16(L3_17, A0_14, billingTable)
  if L2_16 ~= _UPVALUE0_.SUCCESS then
    return L2_16
  end
  if db.deleteRow(billingTable, ROWID, L3_17) == NIL then
    return _UPVALUE0_.FAILURE, L3_17
  end
  return _UPVALUE0_.SUCCESS, L3_17
end
function descriptionGet()
  local L0_18, L1_19, L2_20
  L0_18 = getFirstCookie
  L1_19 = ROWID
  L2_20 = billingTable
  L1_19 = L0_18(L1_19, L2_20)
  L2_20 = _UPVALUE0_
  L2_20 = L2_20.SUCCESS
  if L0_18 ~= L2_20 then
    return L0_18
  end
  L2_20 = db
  L2_20 = L2_20.getAttribute
  L2_20 = L2_20(billingTable, ROWID, L1_19, attribute.description)
  if L2_20 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_19, L2_20
end
function descriptionGetNext(A0_21)
  local L1_22, L2_23, L3_24, L4_25, L5_26
  L1_22 = NIL
  if A0_21 == L1_22 then
    L1_22 = _UPVALUE0_
    L1_22 = L1_22.INVALID_ARGUMENT
    return L1_22
  end
  L1_22 = cookieValidate
  L2_23 = ROWID
  L3_24 = A0_21
  L4_25 = billingTable
  L2_23 = L1_22(L2_23, L3_24, L4_25)
  L3_24 = _UPVALUE0_
  L3_24 = L3_24.SUCCESS
  if L1_22 ~= L3_24 then
    return L1_22
  end
  L3_24 = getNextValidCookie
  L4_25 = L2_23
  L5_26 = billingTable
  L4_25 = L3_24(L4_25, L5_26)
  L5_26 = _UPVALUE0_
  L5_26 = L5_26.SUCCESS
  if L3_24 ~= L5_26 then
    return L3_24
  end
  L5_26 = db
  L5_26 = L5_26.getAttribute
  L5_26 = L5_26(billingTable, ROWID, L4_25, attribute.description)
  if L5_26 == NIL then
    return _UPVALUE0_.FAILURE, L2_23
  end
  return _UPVALUE0_.SUCCESS, L4_25, L5_26
end
function descriptionSet(A0_27, A1_28)
  local L2_29, L3_30
  L2_29 = NIL
  if A0_27 == L2_29 then
    L2_29 = _UPVALUE0_
    L2_29 = L2_29.INVALID_ARGUMENT
    return L2_29
  end
  L2_29 = cookieValidate
  L3_30 = ROWID
  L3_30 = L2_29(L3_30, A0_27, billingTable)
  if L2_29 ~= _UPVALUE0_.SUCCESS then
    return L2_29
  end
  if A1_28 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_28) > MAXLEN_DESC or string.len(A1_28) < MINLEN_DESC then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(billingTable, ROWID, L3_30, attribute.description, A1_28) == NIL then
    return _UPVALUE0_.FAILURE, L3_30
  end
  return _UPVALUE0_.SUCCESS, L3_30
end
function ismultiLoginEnabled()
  local L0_31, L1_32, L2_33
  L0_31 = getFirstCookie
  L1_32 = ROWID
  L2_33 = billingTable
  L1_32 = L0_31(L1_32, L2_33)
  L2_33 = _UPVALUE0_
  L2_33 = L2_33.SUCCESS
  if L0_31 ~= L2_33 then
    return L0_31
  end
  L2_33 = db
  L2_33 = L2_33.getAttribute
  L2_33 = L2_33(billingTable, ROWID, L1_32, attribute.multiLogin)
  if L2_33 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_32, L2_33
end
function ismultiLoginEnabledNext(A0_34)
  local L1_35, L2_36, L3_37, L4_38, L5_39
  L1_35 = NIL
  if A0_34 == L1_35 then
    L1_35 = _UPVALUE0_
    L1_35 = L1_35.INVALID_ARGUMENT
    return L1_35
  end
  L1_35 = cookieValidate
  L2_36 = ROWID
  L3_37 = A0_34
  L4_38 = billingTable
  L2_36 = L1_35(L2_36, L3_37, L4_38)
  L3_37 = _UPVALUE0_
  L3_37 = L3_37.SUCCESS
  if L1_35 ~= L3_37 then
    return L1_35
  end
  L3_37 = getNextValidCookie
  L4_38 = ROWID
  L5_39 = L2_36
  L4_38 = L3_37(L4_38, L5_39, billingTable)
  L5_39 = _UPVALUE0_
  L5_39 = L5_39.SUCCESS
  if L3_37 ~= L5_39 then
    return L3_37
  end
  L5_39 = db
  L5_39 = L5_39.getAttribute
  L5_39 = L5_39(billingTable, ROWID, L4_38, attribute.multiLogin)
  if L5_39 == NIL then
    return _UPVALUE0_.FAILURE, L2_36
  end
  return _UPVALUE0_.SUCCESS, L4_38, L5_39
end
function multiLoginEnable(A0_40)
  local L1_41, L2_42
  L1_41 = NIL
  if A0_40 == L1_41 then
    L1_41 = _UPVALUE0_
    L1_41 = L1_41.INVALID_ARGUMENT
    return L1_41
  end
  L1_41 = cookieValidate
  L2_42 = ROWID
  L2_42 = L1_41(L2_42, A0_40, billingTable)
  if L1_41 ~= _UPVALUE0_.SUCCESS then
    return L1_41
  end
  if db.setAttribute(billingTable, ROWID, L2_42, attribute.multiLogin, ENABLE) == NIL then
    return _UPVALUE0_.FAILURE, L2_42
  end
  return _UPVALUE0_.SUCCESS, L2_42
end
function multiLoginDisable(A0_43)
  local L1_44, L2_45
  L1_44 = NIL
  if A0_43 == L1_44 then
    L1_44 = _UPVALUE0_
    L1_44 = L1_44.INVALID_ARGUMENT
    return L1_44
  end
  L1_44 = cookieValidate
  L2_45 = ROWID
  L2_45 = L1_44(L2_45, A0_43, billingTable)
  if L1_44 ~= _UPVALUE0_.SUCCESS then
    return L1_44
  end
  if db.setAttribute(billingTable, ROWID, L2_45, attribute.multiLogin, DISABLE) == NIL then
    return _UPVALUE0_.FAILURE, L2_45
  end
  return _UPVALUE0_.SUCCESS, L2_45
end
function iscustomizedAccountEnabled()
  local L0_46, L1_47, L2_48
  L0_46 = getFirstCookie
  L1_47 = ROWID
  L2_48 = billingTable
  L1_47 = L0_46(L1_47, L2_48)
  L2_48 = _UPVALUE0_
  L2_48 = L2_48.SUCCESS
  if L0_46 ~= L2_48 then
    return L0_46
  end
  L2_48 = db
  L2_48 = L2_48.getAttribute
  L2_48 = L2_48(billingTable, ROWID, L1_47, attribute.customizedAccount)
  if L2_48 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_47, L2_48
end
function iscustomizedAccountEnabledNext(A0_49)
  local L1_50, L2_51, L3_52, L4_53, L5_54
  L1_50 = NIL
  if A0_49 == L1_50 then
    L1_50 = _UPVALUE0_
    L1_50 = L1_50.INVALID_ARGUMENT
    return L1_50
  end
  L1_50 = cookieValidate
  L2_51 = ROWID
  L3_52 = A0_49
  L4_53 = billingTable
  L2_51 = L1_50(L2_51, L3_52, L4_53)
  L3_52 = _UPVALUE0_
  L3_52 = L3_52.SUCCESS
  if L1_50 ~= L3_52 then
    return L1_50
  end
  L3_52 = getNextValidCookie
  L4_53 = ROWID
  L5_54 = L2_51
  L4_53 = L3_52(L4_53, L5_54, billingTable)
  L5_54 = _UPVALUE0_
  L5_54 = L5_54.SUCCESS
  if L3_52 ~= L5_54 then
    return L3_52
  end
  L5_54 = db
  L5_54 = L5_54.getAttribute
  L5_54 = L5_54(billingTable, ROWID, L4_53, attribute.customizedAccount)
  if L5_54 == NIL then
    return _UPVALUE0_.FAILURE, L2_51
  end
  return _UPVALUE0_.SUCCESS, L4_53, L5_54
end
function customizedAccountEnable(A0_55)
  local L1_56, L2_57
  L1_56 = NIL
  if A0_55 == L1_56 then
    L1_56 = _UPVALUE0_
    L1_56 = L1_56.INVALID_ARGUMENT
    return L1_56
  end
  L1_56 = cookieValidate
  L2_57 = ROWID
  L2_57 = L1_56(L2_57, A0_55, billingTable)
  if L1_56 ~= _UPVALUE0_.SUCCESS then
    return L1_56
  end
  if db.setAttribute(billingTable, ROWID, L2_57, attribute.customizedAccount, ENABLE) == NIL then
    return _UPVALUE0_.FAILURE, L2_57
  end
  return _UPVALUE0_.SUCCESS, L2_57
end
function customizedAccountDisable(A0_58)
  local L1_59, L2_60
  L1_59 = NIL
  if A0_58 == L1_59 then
    L1_59 = _UPVALUE0_
    L1_59 = L1_59.INVALID_ARGUMENT
    return L1_59
  end
  L1_59 = cookieValidate
  L2_60 = ROWID
  L2_60 = L1_59(L2_60, A0_58, billingTable)
  if L1_59 ~= _UPVALUE0_.SUCCESS then
    return L1_59
  end
  if db.setAttribute(billingTable, ROWID, L2_60, attribute.customizedAccount, DISABLE) == NIL then
    return _UPVALUE0_.FAILURE, L2_60
  end
  return _UPVALUE0_.SUCCESS, L2_60
end
function isbatchGenerationEnabled()
  local L0_61, L1_62, L2_63
  L0_61 = getFirstCookie
  L1_62 = ROWID
  L2_63 = billingTable
  L1_62 = L0_61(L1_62, L2_63)
  L2_63 = _UPVALUE0_
  L2_63 = L2_63.SUCCESS
  if L0_61 ~= L2_63 then
    return L0_61
  end
  L2_63 = db
  L2_63 = L2_63.getAttribute
  L2_63 = L2_63(billingTable, ROWID, L1_62, attribute.batchGeneration)
  if L2_63 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_62, L2_63
end
function isbatchGenerationEnabledNext(A0_64)
  local L1_65, L2_66, L3_67, L4_68, L5_69
  L1_65 = NIL
  if A0_64 == L1_65 then
    L1_65 = _UPVALUE0_
    L1_65 = L1_65.INVALID_ARGUMENT
    return L1_65
  end
  L1_65 = cookieValidate
  L2_66 = ROWID
  L3_67 = A0_64
  L4_68 = billingTable
  L2_66 = L1_65(L2_66, L3_67, L4_68)
  L3_67 = _UPVALUE0_
  L3_67 = L3_67.SUCCESS
  if L1_65 ~= L3_67 then
    return L1_65
  end
  L3_67 = getNextValidCookie
  L4_68 = ROWID
  L5_69 = L2_66
  L4_68 = L3_67(L4_68, L5_69, billingTable)
  L5_69 = _UPVALUE0_
  L5_69 = L5_69.SUCCESS
  if L3_67 ~= L5_69 then
    return L3_67
  end
  L5_69 = db
  L5_69 = L5_69.getAttribute
  L5_69 = L5_69(billingTable, ROWID, L4_68, attribute.batchGeneration)
  if L5_69 == NIL then
    return _UPVALUE0_.FAILURE, L2_66
  end
  return _UPVALUE0_.SUCCESS, L4_68, L5_69
end
function batchGenerationEnable(A0_70)
  local L1_71, L2_72
  L1_71 = NIL
  if A0_70 == L1_71 then
    L1_71 = _UPVALUE0_
    L1_71 = L1_71.INVALID_ARGUMENT
    return L1_71
  end
  L1_71 = cookieValidate
  L2_72 = ROWID
  L2_72 = L1_71(L2_72, A0_70, billingTable)
  if L1_71 ~= _UPVALUE0_.SUCCESS then
    return L1_71
  end
  if db.setAttribute(billingTable, ROWID, L2_72, attribute.batchGeneration, ENABLE) == NIL then
    return _UPVALUE0_.FAILURE, L2_72
  end
  return _UPVALUE0_.SUCCESS, L2_72
end
function batchGenerationDisable(A0_73)
  local L1_74, L2_75
  L1_74 = NIL
  if A0_73 == L1_74 then
    L1_74 = _UPVALUE0_
    L1_74 = L1_74.INVALID_ARGUMENT
    return L1_74
  end
  L1_74 = cookieValidate
  L2_75 = ROWID
  L2_75 = L1_74(L2_75, A0_73, billingTable)
  if L1_74 ~= _UPVALUE0_.SUCCESS then
    return L1_74
  end
  if db.setAttribute(billingTable, ROWID, L2_75, attribute.batchGeneration, DISABLE) == NIL then
    return _UPVALUE0_.FAILURE, L2_75
  end
  return _UPVALUE0_.SUCCESS, L2_75
end
function sessionTimeoutGet()
  local L0_76, L1_77, L2_78
  L0_76 = getFirstCookie
  L1_77 = ROWID
  L2_78 = billingTable
  L1_77 = L0_76(L1_77, L2_78)
  L2_78 = _UPVALUE0_
  L2_78 = L2_78.SUCCESS
  if L0_76 ~= L2_78 then
    return L0_76
  end
  L2_78 = db
  L2_78 = L2_78.getAttribute
  L2_78 = L2_78(billingTable, ROWID, L1_77, attribute.sessionTimeout)
  if L2_78 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_77, L2_78
end
function sessionTimeoutGetNext(A0_79)
  local L1_80, L2_81, L3_82, L4_83, L5_84
  L1_80 = NIL
  if A0_79 == L1_80 then
    L1_80 = _UPVALUE0_
    L1_80 = L1_80.INVALID_ARGUMENT
    return L1_80
  end
  L1_80 = cookieValidate
  L2_81 = ROWID
  L3_82 = A0_79
  L4_83 = billingTable
  L2_81 = L1_80(L2_81, L3_82, L4_83)
  L3_82 = _UPVALUE0_
  L3_82 = L3_82.SUCCESS
  if L1_80 ~= L3_82 then
    return L1_80
  end
  L3_82 = getNextValidCookie
  L4_83 = ROWID
  L5_84 = L2_81
  L4_83 = L3_82(L4_83, L5_84, billingTable)
  L5_84 = _UPVALUE0_
  L5_84 = L5_84.SUCCESS
  if L3_82 ~= L5_84 then
    return L3_82
  end
  L5_84 = db
  L5_84 = L5_84.getAttribute
  L5_84 = L5_84(billingTable, ROWID, L4_83, attribute.sessionTimeout)
  if L5_84 == NIL then
    return _UPVALUE0_.FAILURE, L2_81
  end
  return _UPVALUE0_.SUCCESS, L4_83, L5_84
end
function sessionTimeoutSet(A0_85, A1_86)
  local L2_87, L3_88
  L2_87 = NIL
  if A0_85 == L2_87 then
    L2_87 = _UPVALUE0_
    L2_87 = L2_87.INVALID_ARGUMENT
    return L2_87
  end
  L2_87 = cookieValidate
  L3_88 = ROWID
  L3_88 = L2_87(L3_88, A0_85, billingTable)
  if L2_87 ~= _UPVALUE0_.SUCCESS then
    return L2_87
  end
  if A1_86 == "" or A1_86 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_86) < MIN_TIMEOUT or tonumber(A1_86) > MAX_TIMEOUT then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(billingTable, ROWID, L3_88, attribute.sessionTimeout, A1_86) == NIL then
    return _UPVALUE0_.FAILURE, L3_88
  end
  return _UPVALUE0_.SUCCESS, L3_88
end
function alertLimitGet()
  local L0_89, L1_90, L2_91
  L0_89 = getFirstCookie
  L1_90 = ROWID
  L2_91 = billingTable
  L1_90 = L0_89(L1_90, L2_91)
  L2_91 = _UPVALUE0_
  L2_91 = L2_91.SUCCESS
  if L0_89 ~= L2_91 then
    return L0_89
  end
  L2_91 = db
  L2_91 = L2_91.getAttribute
  L2_91 = L2_91(billingTable, ROWID, L1_90, attribute.alertLimit)
  if L2_91 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_90, L2_91
end
function alertLimitGetNext(A0_92)
  local L1_93, L2_94, L3_95, L4_96, L5_97
  L1_93 = NIL
  if A0_92 == L1_93 then
    L1_93 = _UPVALUE0_
    L1_93 = L1_93.INVALID_ARGUMENT
    return L1_93
  end
  L1_93 = cookieValidate
  L2_94 = ROWID
  L3_95 = A0_92
  L4_96 = billingTable
  L2_94 = L1_93(L2_94, L3_95, L4_96)
  L3_95 = _UPVALUE0_
  L3_95 = L3_95.SUCCESS
  if L1_93 ~= L3_95 then
    return L1_93
  end
  L3_95 = getNextValidCookie
  L4_96 = ROWID
  L5_97 = L2_94
  L4_96 = L3_95(L4_96, L5_97, billingTable)
  L5_97 = _UPVALUE0_
  L5_97 = L5_97.SUCCESS
  if L3_95 ~= L5_97 then
    return L3_95
  end
  L5_97 = db
  L5_97 = L5_97.getAttribute
  L5_97 = L5_97(billingTable, ROWID, L4_96, attribute.alertLimit)
  if L5_97 == NIL then
    return _UPVALUE0_.FAILURE, L2_94
  end
  return _UPVALUE0_.SUCCESS, L4_96, L5_97
end
function alertLimitSet(A0_98, A1_99)
  local L2_100, L3_101
  L2_100 = NIL
  if A0_98 == L2_100 then
    L2_100 = _UPVALUE0_
    L2_100 = L2_100.INVALID_ARGUMENT
    return L2_100
  end
  L2_100 = cookieValidate
  L3_101 = ROWID
  L3_101 = L2_100(L3_101, A0_98, billingTable)
  if L2_100 ~= _UPVALUE0_.SUCCESS then
    return L2_100
  end
  if A1_99 == NIL or A1_99 == "" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  A1_99 = tonumber(A1_99)
  if db.getAttribute(billingTable, ROWID, L3_101, attribute.alertType) == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  elseif db.getAttribute(billingTable, ROWID, L3_101, attribute.alertType) == HR then
    if A1_99 < MIN_HOURS or A1_99 > MAX_HOURS then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
  elseif db.getAttribute(billingTable, ROWID, L3_101, attribute.alertType) == DAY then
    if A1_99 < MIN_DAYS or A1_99 > MAX_DAYS then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
  elseif db.getAttribute(billingTable, ROWID, L3_101, attribute.alertType) == GB then
    if A1_99 < MIN_GB or A1_99 > MAX_GB then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
  elseif db.getAttribute(billingTable, ROWID, L3_101, attribute.alertType) == MB and (A1_99 < MIN_MB or A1_99 > MAX_MB) then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(billingTable, ROWID, L3_101, attribute.alertLimit, A1_99) == NIL then
    return _UPVALUE0_.FAILURE, L3_101
  end
  return _UPVALUE0_.SUCCESS, L3_101
end
function alertTypeGet()
  local L0_102, L1_103, L2_104
  L0_102 = getFirstCookie
  L1_103 = ROWID
  L2_104 = billingTable
  L1_103 = L0_102(L1_103, L2_104)
  L2_104 = _UPVALUE0_
  L2_104 = L2_104.SUCCESS
  if L0_102 ~= L2_104 then
    return L0_102
  end
  L2_104 = db
  L2_104 = L2_104.getAttribute
  L2_104 = L2_104(billingTable, ROWID, L1_103, attribute.alertType)
  if L2_104 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_103, L2_104
end
function alertTypeGetNext(A0_105)
  local L1_106, L2_107, L3_108, L4_109, L5_110
  L1_106 = NIL
  if A0_105 == L1_106 then
    L1_106 = _UPVALUE0_
    L1_106 = L1_106.INVALID_ARGUMENT
    return L1_106
  end
  L1_106 = cookieValidate
  L2_107 = ROWID
  L3_108 = A0_105
  L4_109 = billingTable
  L2_107 = L1_106(L2_107, L3_108, L4_109)
  L3_108 = _UPVALUE0_
  L3_108 = L3_108.SUCCESS
  if L1_106 ~= L3_108 then
    return L1_106
  end
  L3_108 = getNextValidCookie
  L4_109 = ROWID
  L5_110 = L2_107
  L4_109 = L3_108(L4_109, L5_110, billingTable)
  L5_110 = _UPVALUE0_
  L5_110 = L5_110.SUCCESS
  if L3_108 ~= L5_110 then
    return L3_108
  end
  L5_110 = db
  L5_110 = L5_110.getAttribute
  L5_110 = L5_110(billingTable, ROWID, L4_109, attribute.alertType)
  if L5_110 == NIL then
    return _UPVALUE0_.FAILURE, L2_107
  end
  return _UPVALUE0_.SUCCESS, L4_109, L5_110
end
function alertTypeSet(A0_111, A1_112)
  local L2_113, L3_114
  L2_113 = NIL
  if A0_111 == L2_113 then
    L2_113 = _UPVALUE0_
    L2_113 = L2_113.INVALID_ARGUMENT
    return L2_113
  end
  L2_113 = cookieValidate
  L3_114 = ROWID
  L3_114 = L2_113(L3_114, A0_111, billingTable)
  if L2_113 ~= _UPVALUE0_.SUCCESS then
    return L2_113
  end
  if A1_112 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_112 ~= HR and A1_112 ~= DAY and A1_112 ~= MB and A1_112 ~= GB then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(billingTable, ROWID, L3_114, attribute.alertType, A1_112) == NIL then
    return _UPVALUE0_.FAILURE, L3_114
  end
  return _UPVALUE0_.SUCCESS, L3_114
end
function istimedEnabled()
  local L0_115, L1_116, L2_117
  L0_115 = getFirstCookie
  L1_116 = ROWID
  L2_117 = billingTable
  L1_116 = L0_115(L1_116, L2_117)
  L2_117 = _UPVALUE0_
  L2_117 = L2_117.SUCCESS
  if L0_115 ~= L2_117 then
    return L0_115
  end
  L2_117 = db
  L2_117 = L2_117.getAttribute
  L2_117 = L2_117(billingTable, ROWID, L1_116, attribute.timed)
  if L2_117 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_116, L2_117
end
function istimedEnabledNext(A0_118)
  local L1_119, L2_120, L3_121, L4_122, L5_123
  L1_119 = NIL
  if A0_118 == L1_119 then
    L1_119 = _UPVALUE0_
    L1_119 = L1_119.INVALID_ARGUMENT
    return L1_119
  end
  L1_119 = cookieValidate
  L2_120 = ROWID
  L3_121 = A0_118
  L4_122 = billingTable
  L2_120 = L1_119(L2_120, L3_121, L4_122)
  L3_121 = _UPVALUE0_
  L3_121 = L3_121.SUCCESS
  if L1_119 ~= L3_121 then
    return L1_119
  end
  L3_121 = getNextValidCookie
  L4_122 = ROWID
  L5_123 = L2_120
  L4_122 = L3_121(L4_122, L5_123, billingTable)
  L5_123 = _UPVALUE0_
  L5_123 = L5_123.SUCCESS
  if L3_121 ~= L5_123 then
    return L3_121
  end
  L5_123 = db
  L5_123 = L5_123.getAttribute
  L5_123 = L5_123(billingTable, ROWID, L4_122, attribute.timed)
  if L5_123 == NIL then
    return _UPVALUE0_.FAILURE, L2_120
  end
  return _UPVALUE0_.SUCCESS, L4_122, L5_123
end
function timedEnable(A0_124)
  local L1_125, L2_126
  L1_125 = NIL
  if A0_124 == L1_125 then
    L1_125 = _UPVALUE0_
    L1_125 = L1_125.INVALID_ARGUMENT
    return L1_125
  end
  L1_125 = cookieValidate
  L2_126 = ROWID
  L2_126 = L1_125(L2_126, A0_124, billingTable)
  if L1_125 ~= _UPVALUE0_.SUCCESS then
    return L1_125
  end
  if db.setAttribute(billingTable, ROWID, L2_126, attribute.timed, ENABLE) == NIL then
    return _UPVALUE0_.FAILURE, L2_126
  end
  return _UPVALUE0_.SUCCESS, L2_126
end
function timedDisable(A0_127)
  local L1_128, L2_129
  L1_128 = NIL
  if A0_127 == L1_128 then
    L1_128 = _UPVALUE0_
    L1_128 = L1_128.INVALID_ARGUMENT
    return L1_128
  end
  L1_128 = cookieValidate
  L2_129 = ROWID
  L2_129 = L1_128(L2_129, A0_127, billingTable)
  if L1_128 ~= _UPVALUE0_.SUCCESS then
    return L1_128
  end
  if db.setAttribute(billingTable, ROWID, L2_129, attribute.timed, DISABLE) == NIL then
    return _UPVALUE0_.FAILURE, L2_129
  end
  return _UPVALUE0_.SUCCESS, L2_129
end
function timeLimitGet()
  local L0_130, L1_131, L2_132
  L0_130 = getFirstCookie
  L1_131 = ROWID
  L2_132 = billingTable
  L1_131 = L0_130(L1_131, L2_132)
  L2_132 = _UPVALUE0_
  L2_132 = L2_132.SUCCESS
  if L0_130 ~= L2_132 then
    return L0_130
  end
  L2_132 = db
  L2_132 = L2_132.getAttribute
  L2_132 = L2_132(billingTable, ROWID, L1_131, attribute.timeLimit)
  if L2_132 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_131, L2_132
end
function timeLimitGetNext(A0_133)
  local L1_134, L2_135, L3_136, L4_137, L5_138
  L1_134 = NIL
  if A0_133 == L1_134 then
    L1_134 = _UPVALUE0_
    L1_134 = L1_134.INVALID_ARGUMENT
    return L1_134
  end
  L1_134 = cookieValidate
  L2_135 = ROWID
  L3_136 = A0_133
  L4_137 = billingTable
  L2_135 = L1_134(L2_135, L3_136, L4_137)
  L3_136 = _UPVALUE0_
  L3_136 = L3_136.SUCCESS
  if L1_134 ~= L3_136 then
    return L1_134
  end
  L3_136 = getNextValidCookie
  L4_137 = ROWID
  L5_138 = L2_135
  L4_137 = L3_136(L4_137, L5_138, billingTable)
  L5_138 = _UPVALUE0_
  L5_138 = L5_138.SUCCESS
  if L3_136 ~= L5_138 then
    return L3_136
  end
  L5_138 = db
  L5_138 = L5_138.getAttribute
  L5_138 = L5_138(billingTable, ROWID, L4_137, attribute.timeLimit)
  if L5_138 == NIL then
    return _UPVALUE0_.FAILURE, L2_135
  end
  return _UPVALUE0_.SUCCESS, L4_137, L5_138
end
function timeLimitSet(A0_139, A1_140)
  local L2_141, L3_142
  L2_141 = NIL
  if A0_139 == L2_141 then
    L2_141 = _UPVALUE0_
    L2_141 = L2_141.INVALID_ARGUMENT
    return L2_141
  end
  L2_141 = cookieValidate
  L3_142 = ROWID
  L3_142 = L2_141(L3_142, A0_139, billingTable)
  if L2_141 ~= _UPVALUE0_.SUCCESS then
    return L2_141
  end
  if A1_140 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  A1_140 = tonumber(A1_140)
  if db.getAttribute(billingTable, ROWID, L3_142, attribute.timeType) == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  elseif db.getAttribute(billingTable, ROWID, L3_142, attribute.timeType) == HR then
    if A1_140 < MIN_HOURS or A1_140 > MAX_HOURS then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
  elseif db.getAttribute(billingTable, ROWID, L3_142, attribute.timeType) == DAY and (A1_140 < MIN_DAYS or A1_140 > MAX_DAYS) then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(billingTable, ROWID, L3_142, attribute.timeLimit, A1_140) == NIL then
    return _UPVALUE0_.FAILURE, L3_142
  end
  return _UPVALUE0_.SUCCESS, L3_142
end
function startTypeGet()
  local L0_143, L1_144, L2_145
  L0_143 = getFirstCookie
  L1_144 = ROWID
  L2_145 = billingTable
  L1_144 = L0_143(L1_144, L2_145)
  L2_145 = _UPVALUE0_
  L2_145 = L2_145.SUCCESS
  if L0_143 ~= L2_145 then
    return L0_143
  end
  L2_145 = db
  L2_145 = L2_145.getAttribute
  L2_145 = L2_145(billingTable, ROWID, L1_144, attribute.startType)
  if L2_145 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_144, L2_145
end
function startTypeGetNext(A0_146)
  local L1_147, L2_148, L3_149, L4_150, L5_151
  L1_147 = NIL
  if A0_146 == L1_147 then
    L1_147 = _UPVALUE0_
    L1_147 = L1_147.INVALID_ARGUMENT
    return L1_147
  end
  L1_147 = cookieValidate
  L2_148 = ROWID
  L3_149 = A0_146
  L4_150 = billingTable
  L2_148 = L1_147(L2_148, L3_149, L4_150)
  L3_149 = _UPVALUE0_
  L3_149 = L3_149.SUCCESS
  if L1_147 ~= L3_149 then
    return L1_147
  end
  L3_149 = getNextValidCookie
  L4_150 = ROWID
  L5_151 = L2_148
  L4_150 = L3_149(L4_150, L5_151, billingTable)
  L5_151 = _UPVALUE0_
  L5_151 = L5_151.SUCCESS
  if L3_149 ~= L5_151 then
    return L3_149
  end
  L5_151 = db
  L5_151 = L5_151.getAttribute
  L5_151 = L5_151(billingTable, ROWID, L4_150, attribute.startType)
  if L5_151 == NIL then
    return _UPVALUE0_.FAILURE, L2_148
  end
  return _UPVALUE0_.SUCCESS, L4_150, L5_151
end
function startTypeSet(A0_152, A1_153)
  local L2_154, L3_155
  L2_154 = NIL
  if A0_152 == L2_154 then
    L2_154 = _UPVALUE0_
    L2_154 = L2_154.INVALID_ARGUMENT
    return L2_154
  end
  L2_154 = cookieValidate
  L3_155 = ROWID
  L3_155 = L2_154(L3_155, A0_152, billingTable)
  if L2_154 ~= _UPVALUE0_.SUCCESS then
    return L2_154
  end
  if A1_153 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_153 ~= ACCOUNT_CREATION and A1_153 ~= ACCOUNT_LOGIN and A1_153 ~= CUSTOM_START then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(billingTable, ROWID, L3_155, attribute.startType, A1_153) == NIL then
    return _UPVALUE0_.FAILURE, L3_155
  end
  return _UPVALUE0_.SUCCESS, L3_155
end
function customStartTimeGet()
  local L0_156, L1_157, L2_158
  L0_156 = getFirstCookie
  L1_157 = ROWID
  L2_158 = billingTable
  L1_157 = L0_156(L1_157, L2_158)
  L2_158 = _UPVALUE0_
  L2_158 = L2_158.SUCCESS
  if L0_156 ~= L2_158 then
    return L0_156
  end
  L2_158 = db
  L2_158 = L2_158.getAttribute
  L2_158 = L2_158(billingTable, ROWID, L1_157, attribute.customStartTime)
  if L2_158 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_157, L2_158
end
function customStartTimeGetNext(A0_159)
  local L1_160, L2_161, L3_162, L4_163, L5_164
  L1_160 = NIL
  if A0_159 == L1_160 then
    L1_160 = _UPVALUE0_
    L1_160 = L1_160.INVALID_ARGUMENT
    return L1_160
  end
  L1_160 = cookieValidate
  L2_161 = ROWID
  L3_162 = A0_159
  L4_163 = billingTable
  L2_161 = L1_160(L2_161, L3_162, L4_163)
  L3_162 = _UPVALUE0_
  L3_162 = L3_162.SUCCESS
  if L1_160 ~= L3_162 then
    return L1_160
  end
  L3_162 = getNextValidCookie
  L4_163 = ROWID
  L5_164 = L2_161
  L4_163 = L3_162(L4_163, L5_164, billingTable)
  L5_164 = _UPVALUE0_
  L5_164 = L5_164.SUCCESS
  if L3_162 ~= L5_164 then
    return L3_162
  end
  L5_164 = db
  L5_164 = L5_164.getAttribute
  L5_164 = L5_164(billingTable, ROWID, L4_163, attribute.customStartTime)
  if L5_164 == NIL then
    return _UPVALUE0_.FAILURE, L2_161
  end
  return _UPVALUE0_.SUCCESS, L4_163, L5_164
end
function customStartTimeSet(A0_165, A1_166)
  local L2_167, L3_168, L4_169, L5_170, L6_171, L7_172, L8_173, L9_174, L10_175, L11_176, L12_177, L13_178, L14_179
  L2_167 = NIL
  if A0_165 == L2_167 then
    L2_167 = _UPVALUE0_
    L2_167 = L2_167.INVALID_ARGUMENT
    return L2_167
  end
  L2_167 = cookieValidate
  L3_168 = ROWID
  L4_169 = A0_165
  L5_170 = billingTable
  L3_168 = L2_167(L3_168, L4_169, L5_170)
  L4_169 = _UPVALUE0_
  L4_169 = L4_169.SUCCESS
  if L2_167 ~= L4_169 then
    return L2_167
  end
  L4_169 = NIL
  if A1_166 == L4_169 then
    L4_169 = _UPVALUE0_
    L4_169 = L4_169.INVALID_ARGUMENT
    return L4_169
  end
  L4_169 = string
  L4_169 = L4_169.len
  L5_170 = A1_166
  L4_169 = L4_169(L5_170)
  L5_170 = CUSTOM_TIME_LEN
  if L4_169 ~= L5_170 then
    L5_170 = _UPVALUE0_
    L5_170 = L5_170.INVALID_ARGUMENT
    return L5_170
  end
  L5_170 = util
  L5_170 = L5_170.split
  L6_171 = A1_166
  L7_172 = " "
  L5_170 = L5_170(L6_171, L7_172)
  L6_171 = util
  L6_171 = L6_171.split
  L7_172 = L5_170[1]
  L8_173 = "/"
  L6_171 = L6_171(L7_172, L8_173)
  L7_172 = util
  L7_172 = L7_172.split
  L8_173 = L5_170[2]
  L9_174 = ":"
  L7_172 = L7_172(L8_173, L9_174)
  L8_173 = L6_171[1]
  L9_174 = L6_171[2]
  L10_175 = L6_171[3]
  L11_176 = L5_170[2]
  L12_177 = L5_170[3]
  L13_178 = L7_172[1]
  L14_179 = L7_172[2]
  if L12_177 == "AM" then
  elseif L12_177 == "PM" then
    L13_178 = tonumber(L13_178) + 12
  end
  A1_166 = L10_175 .. "/" .. L8_173 .. "/" .. L9_174 .. "@" .. L13_178 .. ":" .. L14_179
  if db.setAttribute(billingTable, ROWID, L3_168, attribute.customStartTime, A1_166) == NIL then
    return _UPVALUE0_.FAILURE, L3_168
  end
  return _UPVALUE0_.SUCCESS, L3_168
end
function iscustomizeTimeEnabled()
  local L0_180, L1_181, L2_182
  L0_180 = getFirstCookie
  L1_181 = ROWID
  L2_182 = billingTable
  L1_181 = L0_180(L1_181, L2_182)
  L2_182 = _UPVALUE0_
  L2_182 = L2_182.SUCCESS
  if L0_180 ~= L2_182 then
    return L0_180
  end
  L2_182 = db
  L2_182 = L2_182.getAttribute
  L2_182 = L2_182(billingTable, ROWID, L1_181, attribute.customizeTime)
  if L2_182 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_181, L2_182
end
function iscustomizeTimeEnabledNext(A0_183)
  local L1_184, L2_185, L3_186, L4_187, L5_188
  L1_184 = NIL
  if A0_183 == L1_184 then
    L1_184 = _UPVALUE0_
    L1_184 = L1_184.INVALID_ARGUMENT
    return L1_184
  end
  L1_184 = cookieValidate
  L2_185 = ROWID
  L3_186 = A0_183
  L4_187 = billingTable
  L2_185 = L1_184(L2_185, L3_186, L4_187)
  L3_186 = _UPVALUE0_
  L3_186 = L3_186.SUCCESS
  if L1_184 ~= L3_186 then
    return L1_184
  end
  L3_186 = getNextValidCookie
  L4_187 = ROWID
  L5_188 = L2_185
  L4_187 = L3_186(L4_187, L5_188, billingTable)
  L5_188 = _UPVALUE0_
  L5_188 = L5_188.SUCCESS
  if L3_186 ~= L5_188 then
    return L3_186
  end
  L5_188 = db
  L5_188 = L5_188.getAttribute
  L5_188 = L5_188(billingTable, ROWID, L4_187, attribute.customizeTime)
  if L5_188 == NIL then
    return _UPVALUE0_.FAILURE, L2_185
  end
  return _UPVALUE0_.SUCCESS, L4_187, L5_188
end
function customizeTimeEnable(A0_189)
  local L1_190, L2_191
  L1_190 = NIL
  if A0_189 == L1_190 then
    L1_190 = _UPVALUE0_
    L1_190 = L1_190.INVALID_ARGUMENT
    return L1_190
  end
  L1_190 = cookieValidate
  L2_191 = ROWID
  L2_191 = L1_190(L2_191, A0_189, billingTable)
  if L1_190 ~= _UPVALUE0_.SUCCESS then
    return L1_190
  end
  if db.setAttribute(billingTable, ROWID, L2_191, attribute.customizeTime, ENABLE) == NIL then
    return _UPVALUE0_.FAILURE, L2_191
  end
  return _UPVALUE0_.SUCCESS, L2_191
end
function customizeTimeDisable(A0_192)
  local L1_193, L2_194
  L1_193 = NIL
  if A0_192 == L1_193 then
    L1_193 = _UPVALUE0_
    L1_193 = L1_193.INVALID_ARGUMENT
    return L1_193
  end
  L1_193 = cookieValidate
  L2_194 = ROWID
  L2_194 = L1_193(L2_194, A0_192, billingTable)
  if L1_193 ~= _UPVALUE0_.SUCCESS then
    return L1_193
  end
  if db.setAttribute(billingTable, ROWID, L2_194, attribute.customizeTime, DISABLE) == NIL then
    return _UPVALUE0_.FAILURE, L2_194
  end
  return _UPVALUE0_.SUCCESS, L2_194
end
function maxTrafficUsageGet()
  local L0_195, L1_196, L2_197
  L0_195 = getFirstCookie
  L1_196 = ROWID
  L2_197 = billingTable
  L1_196 = L0_195(L1_196, L2_197)
  L2_197 = _UPVALUE0_
  L2_197 = L2_197.SUCCESS
  if L0_195 ~= L2_197 then
    return L0_195
  end
  L2_197 = db
  L2_197 = L2_197.getAttribute
  L2_197 = L2_197(billingTable, ROWID, L1_196, attribute.maxTrafficUsage)
  if L2_197 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_196, L2_197
end
function maxTrafficUsageGetNext(A0_198)
  local L1_199, L2_200, L3_201, L4_202, L5_203
  L1_199 = NIL
  if A0_198 == L1_199 then
    L1_199 = _UPVALUE0_
    L1_199 = L1_199.INVALID_ARGUMENT
    return L1_199
  end
  L1_199 = cookieValidate
  L2_200 = ROWID
  L3_201 = A0_198
  L4_202 = billingTable
  L2_200 = L1_199(L2_200, L3_201, L4_202)
  L3_201 = _UPVALUE0_
  L3_201 = L3_201.SUCCESS
  if L1_199 ~= L3_201 then
    return L1_199
  end
  L3_201 = getNextValidCookie
  L4_202 = ROWID
  L5_203 = L2_200
  L4_202 = L3_201(L4_202, L5_203, billingTable)
  L5_203 = _UPVALUE0_
  L5_203 = L5_203.SUCCESS
  if L3_201 ~= L5_203 then
    return L3_201
  end
  L5_203 = db
  L5_203 = L5_203.getAttribute
  L5_203 = L5_203(billingTable, ROWID, L4_202, attribute.maxTrafficUsage)
  if L5_203 == NIL then
    return _UPVALUE0_.FAILURE, L2_200
  end
  return _UPVALUE0_.SUCCESS, L4_202, L5_203
end
function maxTrafficUsageSet(A0_204, A1_205)
  local L2_206, L3_207, L4_208
  L2_206 = NIL
  if A0_204 == L2_206 then
    L2_206 = _UPVALUE0_
    L2_206 = L2_206.INVALID_ARGUMENT
    return L2_206
  end
  L2_206 = cookieValidate
  L3_207 = ROWID
  L4_208 = A0_204
  L3_207 = L2_206(L3_207, L4_208, billingTable)
  L4_208 = _UPVALUE0_
  L4_208 = L4_208.SUCCESS
  if L2_206 ~= L4_208 then
    return L2_206
  end
  L4_208 = NIL
  if A1_205 == L4_208 then
    L4_208 = _UPVALUE0_
    L4_208 = L4_208.INVALID_ARGUMENT
    return L4_208
  end
  L4_208 = tonumber
  L4_208 = L4_208(A1_205)
  A1_205 = L4_208
  L4_208 = db
  L4_208 = L4_208.getAttribute
  L4_208 = L4_208(billingTable, ROWID, L3_207, attribute.trafficUsageType)
  L4_208 = tonumber(L4_208)
  if L4_208 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  elseif L4_208 == INTIGER_MB then
    if A1_205 < MIN_MB or A1_205 > MAX_MB then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
  elseif L4_208 == INTIGER_GB and (A1_205 < MIN_GB or A1_205 > MAX_GB) then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(billingTable, ROWID, L3_207, attribute.maxTrafficUsage, A1_205) == NIL then
    return _UPVALUE0_.FAILURE, L3_207
  end
  return _UPVALUE0_.SUCCESS, L3_207
end
function trafficUsageTypeGet()
  local L0_209, L1_210, L2_211
  L0_209 = getFirstCookie
  L1_210 = ROWID
  L2_211 = billingTable
  L1_210 = L0_209(L1_210, L2_211)
  L2_211 = _UPVALUE0_
  L2_211 = L2_211.SUCCESS
  if L0_209 ~= L2_211 then
    return L0_209
  end
  L2_211 = db
  L2_211 = L2_211.getAttribute
  L2_211 = L2_211(billingTable, ROWID, L1_210, attribute.trafficUsageType)
  if L2_211 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_210, L2_211
end
function trafficUsageTypeGetNext(A0_212)
  local L1_213, L2_214, L3_215, L4_216, L5_217
  L1_213 = NIL
  if A0_212 == L1_213 then
    L1_213 = _UPVALUE0_
    L1_213 = L1_213.INVALID_ARGUMENT
    return L1_213
  end
  L1_213 = cookieValidate
  L2_214 = ROWID
  L3_215 = A0_212
  L4_216 = billingTable
  L2_214 = L1_213(L2_214, L3_215, L4_216)
  L3_215 = _UPVALUE0_
  L3_215 = L3_215.SUCCESS
  if L1_213 ~= L3_215 then
    return L1_213
  end
  L3_215 = getNextValidCookie
  L4_216 = ROWID
  L5_217 = L2_214
  L4_216 = L3_215(L4_216, L5_217, billingTable)
  L5_217 = _UPVALUE0_
  L5_217 = L5_217.SUCCESS
  if L3_215 ~= L5_217 then
    return L3_215
  end
  L5_217 = db
  L5_217 = L5_217.getAttribute
  L5_217 = L5_217(billingTable, ROWID, L4_216, attribute.trafficUsageType)
  if L5_217 == NIL then
    return _UPVALUE0_.FAILURE, L2_214
  end
  return _UPVALUE0_.SUCCESS, L4_216, L5_217
end
function trafficUsageTypeSet(A0_218, A1_219)
  local L2_220, L3_221
  L2_220 = NIL
  if A0_218 == L2_220 then
    L2_220 = _UPVALUE0_
    L2_220 = L2_220.INVALID_ARGUMENT
    return L2_220
  end
  L2_220 = cookieValidate
  L3_221 = ROWID
  L3_221 = L2_220(L3_221, A0_218, billingTable)
  if L2_220 ~= _UPVALUE0_.SUCCESS then
    return L2_220
  end
  if A1_219 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  A1_219 = tonumber(A1_219)
  if A1_219 ~= MB and A1_219 ~= GB then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(billingTable, ROWID, L3_221, attribute.trafficUsageType, A1_219) == NIL then
    return _UPVALUE0_.FAILURE, L3_221
  end
  return _UPVALUE0_.SUCCESS, L3_221
end
function maxUsageTimeGet()
  local L0_222, L1_223, L2_224
  L0_222 = getFirstCookie
  L1_223 = ROWID
  L2_224 = billingTable
  L1_223 = L0_222(L1_223, L2_224)
  L2_224 = _UPVALUE0_
  L2_224 = L2_224.SUCCESS
  if L0_222 ~= L2_224 then
    return L0_222
  end
  L2_224 = db
  L2_224 = L2_224.getAttribute
  L2_224 = L2_224(billingTable, ROWID, L1_223, attribute.maxUsageTime)
  if L2_224 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_223, L2_224
end
function maxUsageTimeGetNext(A0_225)
  local L1_226, L2_227, L3_228, L4_229, L5_230
  L1_226 = NIL
  if A0_225 == L1_226 then
    L1_226 = _UPVALUE0_
    L1_226 = L1_226.INVALID_ARGUMENT
    return L1_226
  end
  L1_226 = cookieValidate
  L2_227 = ROWID
  L3_228 = A0_225
  L4_229 = billingTable
  L2_227 = L1_226(L2_227, L3_228, L4_229)
  L3_228 = _UPVALUE0_
  L3_228 = L3_228.SUCCESS
  if L1_226 ~= L3_228 then
    return L1_226
  end
  L3_228 = getNextValidCookie
  L4_229 = ROWID
  L5_230 = L2_227
  L4_229 = L3_228(L4_229, L5_230, billingTable)
  L5_230 = _UPVALUE0_
  L5_230 = L5_230.SUCCESS
  if L3_228 ~= L5_230 then
    return L3_228
  end
  L5_230 = db
  L5_230 = L5_230.getAttribute
  L5_230 = L5_230(billingTable, ROWID, L4_229, attribute.maxUsageTime)
  if L5_230 == NIL then
    return _UPVALUE0_.FAILURE, L2_227
  end
  return _UPVALUE0_.SUCCESS, L4_229, L5_230
end
function maxUsageTimeSet(A0_231, A1_232)
  local L2_233, L3_234
  L2_233 = NIL
  if A0_231 == L2_233 then
    L2_233 = _UPVALUE0_
    L2_233 = L2_233.INVALID_ARGUMENT
    return L2_233
  end
  L2_233 = cookieValidate
  L3_234 = ROWID
  L3_234 = L2_233(L3_234, A0_231, billingTable)
  if L2_233 ~= _UPVALUE0_.SUCCESS then
    return L2_233
  end
  if A1_232 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  A1_232 = tonumber(A1_232)
  if db.getAttribute(billingTable, ROWID, L3_234, attribute.usageTimeType) == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  elseif db.getAttribute(billingTable, ROWID, L3_234, attribute.usageTimeType) == HR then
    if A1_232 < MIN_HOURS or A1_232 > MAX_HOURS then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
  elseif db.getAttribute(billingTable, ROWID, L3_234, attribute.usageTimeType) == DAY and (A1_232 < MIN_DAYS or A1_232 > MAX_DAYS) then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(billingTable, ROWID, L3_234, attribute.maxUsageTime, A1_232) == NIL then
    return _UPVALUE0_.FAILURE, L3_234
  end
  return _UPVALUE0_.SUCCESS, L3_234
end
function usageTimeTypeGet()
  local L0_235, L1_236, L2_237
  L0_235 = getFirstCookie
  L1_236 = ROWID
  L2_237 = billingTable
  L1_236 = L0_235(L1_236, L2_237)
  L2_237 = _UPVALUE0_
  L2_237 = L2_237.SUCCESS
  if L0_235 ~= L2_237 then
    return L0_235
  end
  L2_237 = db
  L2_237 = L2_237.getAttribute
  L2_237 = L2_237(billingTable, ROWID, L1_236, attribute.usageTimeType)
  if L2_237 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_236, L2_237
end
function usageTimeTypeGetNext(A0_238)
  local L1_239, L2_240, L3_241, L4_242, L5_243
  L1_239 = NIL
  if A0_238 == L1_239 then
    L1_239 = _UPVALUE0_
    L1_239 = L1_239.INVALID_ARGUMENT
    return L1_239
  end
  L1_239 = cookieValidate
  L2_240 = ROWID
  L3_241 = A0_238
  L4_242 = billingTable
  L2_240 = L1_239(L2_240, L3_241, L4_242)
  L3_241 = _UPVALUE0_
  L3_241 = L3_241.SUCCESS
  if L1_239 ~= L3_241 then
    return L1_239
  end
  L3_241 = getNextValidCookie
  L4_242 = ROWID
  L5_243 = L2_240
  L4_242 = L3_241(L4_242, L5_243, billingTable)
  L5_243 = _UPVALUE0_
  L5_243 = L5_243.SUCCESS
  if L3_241 ~= L5_243 then
    return L3_241
  end
  L5_243 = db
  L5_243 = L5_243.getAttribute
  L5_243 = L5_243(billingTable, ROWID, L4_242, attribute.usageTimeType)
  if L5_243 == NIL then
    return _UPVALUE0_.FAILURE, L2_240
  end
  return _UPVALUE0_.SUCCESS, L4_242, L5_243
end
function usageTimeTypeSet(A0_244, A1_245)
  local L2_246, L3_247
  L2_246 = NIL
  if A0_244 == L2_246 then
    L2_246 = _UPVALUE0_
    L2_246 = L2_246.INVALID_ARGUMENT
    return L2_246
  end
  L2_246 = cookieValidate
  L3_247 = ROWID
  L3_247 = L2_246(L3_247, A0_244, billingTable)
  if L2_246 ~= _UPVALUE0_.SUCCESS then
    return L2_246
  end
  if A1_245 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_245 ~= HR and A1_245 ~= DAY then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(billingTable, ROWID, L3_247, attribute.usageTimeType, A1_245) == NIL then
    return _UPVALUE0_.FAILURE, L3_247
  end
  return _UPVALUE0_.SUCCESS, L3_247
end
function iscustomizeUsageEnabled()
  local L0_248, L1_249, L2_250
  L0_248 = getFirstCookie
  L1_249 = ROWID
  L2_250 = billingTable
  L1_249 = L0_248(L1_249, L2_250)
  L2_250 = _UPVALUE0_
  L2_250 = L2_250.SUCCESS
  if L0_248 ~= L2_250 then
    return L0_248
  end
  L2_250 = db
  L2_250 = L2_250.getAttribute
  L2_250 = L2_250(billingTable, ROWID, L1_249, attribute.customizeUsage)
  if L2_250 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_249, L2_250
end
function iscustomizeUsageEnabledNext(A0_251)
  local L1_252, L2_253, L3_254, L4_255, L5_256
  L1_252 = NIL
  if A0_251 == L1_252 then
    L1_252 = _UPVALUE0_
    L1_252 = L1_252.INVALID_ARGUMENT
    return L1_252
  end
  L1_252 = cookieValidate
  L2_253 = ROWID
  L3_254 = A0_251
  L4_255 = billingTable
  L2_253 = L1_252(L2_253, L3_254, L4_255)
  L3_254 = _UPVALUE0_
  L3_254 = L3_254.SUCCESS
  if L1_252 ~= L3_254 then
    return L1_252
  end
  L3_254 = getNextValidCookie
  L4_255 = ROWID
  L5_256 = L2_253
  L4_255 = L3_254(L4_255, L5_256, billingTable)
  L5_256 = _UPVALUE0_
  L5_256 = L5_256.SUCCESS
  if L3_254 ~= L5_256 then
    return L3_254
  end
  L5_256 = db
  L5_256 = L5_256.getAttribute
  L5_256 = L5_256(billingTable, ROWID, L4_255, attribute.customizeUsage)
  if L5_256 == NIL then
    return _UPVALUE0_.FAILURE, L2_253
  end
  return _UPVALUE0_.SUCCESS, L4_255, L5_256
end
function customizeUsageEnable(A0_257)
  local L1_258, L2_259
  L1_258 = NIL
  if A0_257 == L1_258 then
    L1_258 = _UPVALUE0_
    L1_258 = L1_258.INVALID_ARGUMENT
    return L1_258
  end
  L1_258 = cookieValidate
  L2_259 = ROWID
  L2_259 = L1_258(L2_259, A0_257, billingTable)
  if L1_258 ~= _UPVALUE0_.SUCCESS then
    return L1_258
  end
  if db.setAttribute(billingTable, ROWID, L2_259, attribute.customizeUsage, ENABLE) == NIL then
    return _UPVALUE0_.FAILURE, L2_259
  end
  return _UPVALUE0_.SUCCESS, L2_259
end
function customizeUsageDisable(A0_260)
  local L1_261, L2_262
  L1_261 = NIL
  if A0_260 == L1_261 then
    L1_261 = _UPVALUE0_
    L1_261 = L1_261.INVALID_ARGUMENT
    return L1_261
  end
  L1_261 = cookieValidate
  L2_262 = ROWID
  L2_262 = L1_261(L2_262, A0_260, billingTable)
  if L1_261 ~= _UPVALUE0_.SUCCESS then
    return L1_261
  end
  if db.setAttribute(billingTable, ROWID, L2_262, attribute.customizeUsage, DISABLE) == NIL then
    return _UPVALUE0_.FAILURE, L2_262
  end
  return _UPVALUE0_.SUCCESS, L2_262
end
function ismaxUsageTimeCheckEnabled()
  local L0_263, L1_264, L2_265
  L0_263 = getFirstCookie
  L1_264 = ROWID
  L2_265 = billingTable
  L1_264 = L0_263(L1_264, L2_265)
  L2_265 = _UPVALUE0_
  L2_265 = L2_265.SUCCESS
  if L0_263 ~= L2_265 then
    return L0_263
  end
  L2_265 = db
  L2_265 = L2_265.getAttribute
  L2_265 = L2_265(billingTable, ROWID, L1_264, attribute.maxUsageTimeCheck)
  if L2_265 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_264, L2_265
end
function ismaxUsageTimeCheckEnabledNext(A0_266)
  local L1_267, L2_268, L3_269, L4_270, L5_271
  L1_267 = NIL
  if A0_266 == L1_267 then
    L1_267 = _UPVALUE0_
    L1_267 = L1_267.INVALID_ARGUMENT
    return L1_267
  end
  L1_267 = cookieValidate
  L2_268 = ROWID
  L3_269 = A0_266
  L4_270 = billingTable
  L2_268 = L1_267(L2_268, L3_269, L4_270)
  L3_269 = _UPVALUE0_
  L3_269 = L3_269.SUCCESS
  if L1_267 ~= L3_269 then
    return L1_267
  end
  L3_269 = getNextValidCookie
  L4_270 = ROWID
  L5_271 = L2_268
  L4_270 = L3_269(L4_270, L5_271, billingTable)
  L5_271 = _UPVALUE0_
  L5_271 = L5_271.SUCCESS
  if L3_269 ~= L5_271 then
    return L3_269
  end
  L5_271 = db
  L5_271 = L5_271.getAttribute
  L5_271 = L5_271(billingTable, ROWID, L4_270, attribute.maxUsageTimeCheck)
  if L5_271 == NIL then
    return _UPVALUE0_.FAILURE, L2_268
  end
  return _UPVALUE0_.SUCCESS, L4_270, L5_271
end
function maxUsageTimeCheckEnable(A0_272)
  local L1_273, L2_274
  L1_273 = NIL
  if A0_272 == L1_273 then
    L1_273 = _UPVALUE0_
    L1_273 = L1_273.INVALID_ARGUMENT
    return L1_273
  end
  L1_273 = cookieValidate
  L2_274 = ROWID
  L2_274 = L1_273(L2_274, A0_272, billingTable)
  if L1_273 ~= _UPVALUE0_.SUCCESS then
    return L1_273
  end
  if db.setAttribute(billingTable, ROWID, L2_274, attribute.maxUsageTimeCheck, ENABLE) == NIL then
    return _UPVALUE0_.FAILURE, L2_274
  end
  return _UPVALUE0_.SUCCESS, L2_274
end
function maxUsageTimeCheckDisable(A0_275)
  local L1_276, L2_277
  L1_276 = NIL
  if A0_275 == L1_276 then
    L1_276 = _UPVALUE0_
    L1_276 = L1_276.INVALID_ARGUMENT
    return L1_276
  end
  L1_276 = cookieValidate
  L2_277 = ROWID
  L2_277 = L1_276(L2_277, A0_275, billingTable)
  if L1_276 ~= _UPVALUE0_.SUCCESS then
    return L1_276
  end
  if db.setAttribute(billingTable, ROWID, L2_277, attribute.maxUsageTimeCheck, DISABLE) == nil then
    return _UPVALUE0_.FAILURE, L2_277
  end
  return _UPVALUE0_.SUCCESS, L2_277
end
function ismaxTrafficUsageCheckEnabled()
  local L0_278, L1_279, L2_280
  L0_278 = getFirstCookie
  L1_279 = ROWID
  L2_280 = billingTable
  L1_279 = L0_278(L1_279, L2_280)
  L2_280 = _UPVALUE0_
  L2_280 = L2_280.SUCCESS
  if L0_278 ~= L2_280 then
    return L0_278
  end
  L2_280 = db
  L2_280 = L2_280.getAttribute
  L2_280 = L2_280(billingTable, ROWID, L1_279, attribute.maxTrafficUsageCheck)
  if L2_280 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_279, L2_280
end
function ismaxTrafficUsageCheckEnabledNext(A0_281)
  local L1_282, L2_283, L3_284, L4_285, L5_286
  L1_282 = NIL
  if A0_281 == L1_282 then
    L1_282 = _UPVALUE0_
    L1_282 = L1_282.INVALID_ARGUMENT
    return L1_282
  end
  L1_282 = cookieValidate
  L2_283 = ROWID
  L3_284 = A0_281
  L4_285 = billingTable
  L2_283 = L1_282(L2_283, L3_284, L4_285)
  L3_284 = _UPVALUE0_
  L3_284 = L3_284.SUCCESS
  if L1_282 ~= L3_284 then
    return L1_282
  end
  L3_284 = getNextValidCookie
  L4_285 = ROWID
  L5_286 = L2_283
  L4_285 = L3_284(L4_285, L5_286, billingTable)
  L5_286 = _UPVALUE0_
  L5_286 = L5_286.SUCCESS
  if L3_284 ~= L5_286 then
    return L3_284
  end
  L5_286 = db
  L5_286 = L5_286.getAttribute
  L5_286 = L5_286(billingTable, ROWID, L4_285, attribute.maxTrafficUsageCheck)
  if L5_286 == NIL then
    return _UPVALUE0_.FAILURE, L2_283
  end
  return _UPVALUE0_.SUCCESS, L4_285, L5_286
end
function maxTrafficUsageCheckEnable(A0_287)
  local L1_288, L2_289
  L1_288 = NIL
  if A0_287 == L1_288 then
    L1_288 = _UPVALUE0_
    L1_288 = L1_288.INVALID_ARGUMENT
    return L1_288
  end
  L1_288 = cookieValidate
  L2_289 = ROWID
  L2_289 = L1_288(L2_289, A0_287, billingTable)
  if L1_288 ~= _UPVALUE0_.SUCCESS then
    return L1_288
  end
  if db.setAttribute(billingTable, ROWID, L2_289, attribute.maxTrafficUsageCheck, ENABLE) == nil then
    return _UPVALUE0_.FAILURE, L2_289
  end
  return _UPVALUE0_.SUCCESS, L2_289
end
function maxTrafficUsageCheckDisable(A0_290)
  local L1_291, L2_292
  L1_291 = NIL
  if A0_290 == L1_291 then
    L1_291 = _UPVALUE0_
    L1_291 = L1_291.INVALID_ARGUMENT
    return L1_291
  end
  L1_291 = cookieValidate
  L2_292 = ROWID
  L2_292 = L1_291(L2_292, A0_290, billingTable)
  if L1_291 ~= _UPVALUE0_.SUCCESS then
    return L1_291
  end
  if db.setAttribute(billingTable, ROWID, L2_292, attribute.maxTrafficUsageCheck, DISABLE) == NIL then
    return _UPVALUE0_.FAILURE, L2_292
  end
  return _UPVALUE0_.SUCCESS, L2_292
end
function timeTypeGet()
  local L0_293, L1_294, L2_295
  L0_293 = getFirstCookie
  L1_294 = ROWID
  L2_295 = billingTable
  L1_294 = L0_293(L1_294, L2_295)
  L2_295 = _UPVALUE0_
  L2_295 = L2_295.SUCCESS
  if L0_293 ~= L2_295 then
    return L0_293
  end
  L2_295 = db
  L2_295 = L2_295.getAttribute
  L2_295 = L2_295(billingTable, ROWID, L1_294, attribute.timeType)
  if L2_295 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_294, L2_295
end
function timeTypeGetNext(A0_296)
  local L1_297, L2_298, L3_299, L4_300, L5_301
  L1_297 = NIL
  if A0_296 == L1_297 then
    L1_297 = _UPVALUE0_
    L1_297 = L1_297.INVALID_ARGUMENT
    return L1_297
  end
  L1_297 = cookieValidate
  L2_298 = ROWID
  L3_299 = A0_296
  L4_300 = billingTable
  L2_298 = L1_297(L2_298, L3_299, L4_300)
  L3_299 = _UPVALUE0_
  L3_299 = L3_299.SUCCESS
  if L1_297 ~= L3_299 then
    return L1_297
  end
  L3_299 = getNextValidCookie
  L4_300 = ROWID
  L5_301 = L2_298
  L4_300 = L3_299(L4_300, L5_301, billingTable)
  L5_301 = _UPVALUE0_
  L5_301 = L5_301.SUCCESS
  if L3_299 ~= L5_301 then
    return L3_299
  end
  L5_301 = db
  L5_301 = L5_301.getAttribute
  L5_301 = L5_301(billingTable, ROWID, L4_300, attribute.timeType)
  if L5_301 == NIL then
    return _UPVALUE0_.FAILURE, L2_298
  end
  return _UPVALUE0_.SUCCESS, L4_300, L5_301
end
function timeTypeSet(A0_302, A1_303)
  local L2_304, L3_305
  L2_304 = NIL
  if A0_302 == L2_304 then
    L2_304 = _UPVALUE0_
    L2_304 = L2_304.INVALID_ARGUMENT
    return L2_304
  end
  L2_304 = cookieValidate
  L3_305 = ROWID
  L3_305 = L2_304(L3_305, A0_302, billingTable)
  if L2_304 ~= _UPVALUE0_.SUCCESS then
    return L2_304
  end
  if A1_303 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_303 ~= HR and A1_303 ~= DAY then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(billingTable, ROWID, L3_305, attribute.timeType, A1_303) == nil then
    return _UPVALUE0_.FAILURE, L3_305
  end
  return _UPVALUE0_.SUCCESS, L3_305
end
function billingProfileGet()
  local L0_306, L1_307
  L0_306 = getFirstCookie
  L1_307 = ROWID
  L1_307 = L0_306(L1_307, billingTable)
  if L0_306 ~= _UPVALUE0_.SUCCESS then
    return L0_306
  end
  if db.getRow(billingTable, ROWID, L1_307) == NIL then
    return _UPVALUE0_.FAILURE, value
  end
  return _UPVALUE0_.SUCCESS, L1_307, db.getRow(billingTable, ROWID, L1_307)[billingTable .. "." .. attribute.profile], db.getRow(billingTable, ROWID, L1_307)[billingTable .. "." .. attribute.description], db.getRow(billingTable, ROWID, L1_307)[billingTable .. "." .. attribute.multiLogin], db.getRow(billingTable, ROWID, L1_307)[billingTable .. "." .. attribute.customizedAccount], db.getRow(billingTable, ROWID, L1_307)[billingTable .. "." .. attribute.batchGeneration], db.getRow(billingTable, ROWID, L1_307)[billingTable .. "." .. attribute.sessionTimeout], db.getRow(billingTable, ROWID, L1_307)[billingTable .. "." .. attribute.alertLimit], db.getRow(billingTable, ROWID, L1_307)[billingTable .. "." .. attribute.alertType], db.getRow(billingTable, ROWID, L1_307)[billingTable .. "." .. attribute.timed], db.getRow(billingTable, ROWID, L1_307)[billingTable .. "." .. attribute.timeLimit], db.getRow(billingTable, ROWID, L1_307)[billingTable .. "." .. attribute.startType], db.getRow(billingTable, ROWID, L1_307)[billingTable .. "." .. attribute.customStartTime], db.getRow(billingTable, ROWID, L1_307)[billingTable .. "." .. attribute.customizeTime], db.getRow(billingTable, ROWID, L1_307)[billingTable .. "." .. attribute.maxTrafficUsage], db.getRow(billingTable, ROWID, L1_307)[billingTable .. "." .. attribute.trafficUsageType], db.getRow(billingTable, ROWID, L1_307)[billingTable .. "." .. attribute.maxUsageTime], db.getRow(billingTable, ROWID, L1_307)[billingTable .. "." .. attribute.usageTimeType], db.getRow(billingTable, ROWID, L1_307)[billingTable .. "." .. attribute.customizeUsage], db.getRow(billingTable, ROWID, L1_307)[billingTable .. "." .. attribute.maxUsageTimeCheck], db.getRow(billingTable, ROWID, L1_307)[billingTable .. "." .. attribute.maxTrafficUsageCheck], db.getRow(billingTable, ROWID, L1_307)[billingTable .. "." .. attribute.timeType]
end
function billingProfileGetNext(A0_308)
  local L1_309, L2_310, L3_311, L4_312
  L1_309 = NIL
  if A0_308 == L1_309 then
    L1_309 = _UPVALUE0_
    L1_309 = L1_309.INVALID_ARGUMENT
    return L1_309
  end
  L1_309 = cookieValidate
  L2_310 = ROWID
  L3_311 = A0_308
  L4_312 = billingTable
  L2_310 = L1_309(L2_310, L3_311, L4_312)
  L3_311 = _UPVALUE0_
  L3_311 = L3_311.SUCCESS
  if L1_309 ~= L3_311 then
    return L1_309
  end
  L3_311 = getNextValidCookie
  L4_312 = ROWID
  L4_312 = L3_311(L4_312, L2_310, billingTable)
  if L3_311 ~= _UPVALUE0_.SUCCESS then
    return L3_311
  end
  if db.getRow(billingTable, ROWID, L4_312) == NIL then
    return _UPVALUE0_.FAILURE, L2_310
  end
  return _UPVALUE0_.SUCCESS, L4_312, db.getRow(billingTable, ROWID, L4_312)[billingTable .. "." .. attribute.profile], db.getRow(billingTable, ROWID, L4_312)[billingTable .. "." .. attribute.description], db.getRow(billingTable, ROWID, L4_312)[billingTable .. "." .. attribute.multiLogin], db.getRow(billingTable, ROWID, L4_312)[billingTable .. "." .. attribute.customizedAccount], db.getRow(billingTable, ROWID, L4_312)[billingTable .. "." .. attribute.batchGeneration], db.getRow(billingTable, ROWID, L4_312)[billingTable .. "." .. attribute.sessionTimeout], db.getRow(billingTable, ROWID, L4_312)[billingTable .. "." .. attribute.alertLimit], db.getRow(billingTable, ROWID, L4_312)[billingTable .. "." .. attribute.alertType], db.getRow(billingTable, ROWID, L4_312)[billingTable .. "." .. attribute.timed], db.getRow(billingTable, ROWID, L4_312)[billingTable .. "." .. attribute.timeLimit], db.getRow(billingTable, ROWID, L4_312)[billingTable .. "." .. attribute.startType], db.getRow(billingTable, ROWID, L4_312)[billingTable .. "." .. attribute.customStartTime], db.getRow(billingTable, ROWID, L4_312)[billingTable .. "." .. attribute.customizeTime], db.getRow(billingTable, ROWID, L4_312)[billingTable .. "." .. attribute.maxTrafficUsage], db.getRow(billingTable, ROWID, L4_312)[billingTable .. "." .. attribute.trafficUsageType], db.getRow(billingTable, ROWID, L4_312)[billingTable .. "." .. attribute.maxUsageTime], db.getRow(billingTable, ROWID, L4_312)[billingTable .. "." .. attribute.usageTimeType], db.getRow(billingTable, ROWID, L4_312)[billingTable .. "." .. attribute.customizeUsage], db.getRow(billingTable, ROWID, L4_312)[billingTable .. "." .. attribute.maxUsageTimeCheck], db.getRow(billingTable, ROWID, L4_312)[billingTable .. "." .. attribute.maxTrafficUsageCheck], db.getRow(billingTable, ROWID, L4_312)[billingTable .. "." .. attribute.timeType]
end
function billingProfileSet(A0_313, A1_314, A2_315, A3_316, A4_317, A5_318, A6_319, A7_320, A8_321, A9_322, A10_323, A11_324, A12_325, A13_326, A14_327, A15_328, A16_329, A17_330, A18_331, A19_332, A20_333, A21_334, A22_335, A23_336, A24_337)
  local L25_338, L26_339, L27_340, L28_341, L29_342, L30_343, L31_344, L32_345, L33_346, L34_347, L35_348, L36_349, L37_350, L38_351, L39_352
  L25_338 = NIL
  if A0_313 == L25_338 then
    L25_338 = _UPVALUE0_
    L25_338 = L25_338.INVALID_ARGUMENT
    return L25_338
  end
  L25_338 = cookieValidate
  L26_339 = ROWID
  L27_340 = A0_313
  L28_341 = billingTable
  L26_339 = L25_338(L26_339, L27_340, L28_341)
  L27_340 = _UPVALUE0_
  L27_340 = L27_340.SUCCESS
  if L25_338 ~= L27_340 then
    return L25_338
  end
  L27_340 = NIL
  if A1_314 == L27_340 or A1_314 == "" then
    L27_340 = _UPVALUE1_
    L27_340 = L27_340.BILLING_PROFILENAME_NIL
    return L27_340
  end
  L27_340 = string
  L27_340 = L27_340.len
  L28_341 = A1_314
  L27_340 = L27_340(L28_341)
  L28_341 = MAXLEN_PROFILE
  if not (L27_340 > L28_341) then
    L28_341 = MINLEN_PROFILE
  elseif L27_340 < L28_341 then
    L28_341 = _UPVALUE1_
    L28_341 = L28_341.BILLING_PROFILENAME_INVALID
    return L28_341
  end
  L28_341 = NIL
  if A2_315 == L28_341 or A2_315 == "" then
    L28_341 = _UPVALUE1_
    L28_341 = L28_341.BILLING_DESC_NIL
    return L28_341
  end
  L28_341 = string
  L28_341 = L28_341.len
  L29_342 = A2_315
  L28_341 = L28_341(L29_342)
  L29_342 = MAXLEN_DESC
  if not (L28_341 > L29_342) then
    L29_342 = MINLEN_DESC
  elseif L28_341 < L29_342 then
    L29_342 = _UPVALUE1_
    L29_342 = L29_342.BILLING_DESC_INVALID
    return L29_342
  end
  L29_342 = NIL
  if A3_316 == L29_342 then
    L29_342 = _UPVALUE1_
    L29_342 = L29_342.BILLING_MULTILOGIN_NIL
    return L29_342
  end
  L29_342 = _UPVALUE2_
  L29_342 = L29_342.isBoolean
  L30_343 = A3_316
  L29_342 = L29_342(L30_343)
  valid = L29_342
  L29_342 = valid
  L30_343 = _UPVALUE0_
  L30_343 = L30_343.SUCCESS
  if L29_342 ~= L30_343 then
    L29_342 = _UPVALUE1_
    L29_342 = L29_342.BILLING_MULTILOGIN_INVALID
    return L29_342
  end
  L29_342 = NIL
  if A4_317 == L29_342 or A4_317 == "" then
    L29_342 = _UPVALUE1_
    L29_342 = L29_342.BILLING_CUSTOMIZED_ACCOUNT_NIL
    return L29_342
  end
  L29_342 = _UPVALUE2_
  L29_342 = L29_342.isBoolean
  L30_343 = A4_317
  L29_342 = L29_342(L30_343)
  valid = L29_342
  L29_342 = valid
  L30_343 = _UPVALUE0_
  L30_343 = L30_343.SUCCESS
  if L29_342 ~= L30_343 then
    L29_342 = _UPVALUE1_
    L29_342 = L29_342.BILLING_CUSTOMIZED_ACCOUNT_INVALID
    return L29_342
  end
  L29_342 = NIL
  if A5_318 == L29_342 or A5_318 == "" then
    L29_342 = _UPVALUE1_
    L29_342 = L29_342.BILLING_BATCH_GEN_NIL
    return L29_342
  end
  L29_342 = _UPVALUE2_
  L29_342 = L29_342.isBoolean
  L30_343 = A5_318
  L29_342 = L29_342(L30_343)
  valid = L29_342
  L29_342 = valid
  L30_343 = _UPVALUE0_
  L30_343 = L30_343.SUCCESS
  if L29_342 ~= L30_343 then
    L29_342 = _UPVALUE1_
    L29_342 = L29_342.BILLING_BATCH_GEN_INVALID
    return L29_342
  end
  if A6_319 ~= "" then
    L29_342 = NIL
  elseif A6_319 == L29_342 then
    L29_342 = _UPVALUE1_
    L29_342 = L29_342.BILLING_SESSION_TIMEOUT_NIL
    return L29_342
  end
  L29_342 = tonumber
  L30_343 = A6_319
  L29_342 = L29_342(L30_343)
  L30_343 = MIN_TIMEOUT
  if not (L29_342 < L30_343) then
    L29_342 = tonumber
    L30_343 = A6_319
    L29_342 = L29_342(L30_343)
    L30_343 = MAX_TIMEOUT
  elseif L29_342 > L30_343 then
    L29_342 = _UPVALUE1_
    L29_342 = L29_342.BILLING_SESSION_TIMEOUT_INVALID
    return L29_342
  end
  L29_342 = NIL
  if A9_322 == L29_342 or A9_322 == "" then
    L29_342 = NIL
    if A19_332 == L29_342 then
      L29_342 = NIL
      if A20_333 == L29_342 then
        L29_342 = _UPVALUE1_
        L29_342 = L29_342.BILLING_PROFILE_TIMED_NIL
        return L29_342
      end
    end
  end
  L29_342 = NIL
  if A8_321 == L29_342 or A8_321 == "" then
    L29_342 = _UPVALUE1_
    L29_342 = L29_342.BILLING_ALERT_TYPE_NIL
    return L29_342
  end
  L29_342 = tonumber
  L30_343 = A8_321
  L29_342 = L29_342(L30_343)
  A8_321 = L29_342
  L29_342 = HR
  if A8_321 ~= L29_342 then
    L29_342 = DAY
    if A8_321 ~= L29_342 then
      L29_342 = MB
      if A8_321 ~= L29_342 then
        L29_342 = GB
        if A8_321 ~= L29_342 then
          L29_342 = _UPVALUE1_
          L29_342 = L29_342.BILLING_ALERT_TYPE_INVALID
          return L29_342
        end
      end
    end
  end
  L29_342 = NIL
  if A7_320 == L29_342 or A7_320 == "" then
    L29_342 = _UPVALUE1_
    L29_342 = L29_342.BILLING_ALERT_LIMIT_NIL
    return L29_342
  end
  L29_342 = tonumber
  L30_343 = A7_320
  L29_342 = L29_342(L30_343)
  A7_320 = L29_342
  L29_342 = NIL
  if A8_321 == L29_342 or A8_321 == "" then
    L29_342 = _UPVALUE0_
    L29_342 = L29_342.INVALID_ARGUMENT
    return L29_342
  else
    L29_342 = HR
    if A8_321 == L29_342 then
      L29_342 = MIN_HOURS
      if not (A7_320 < L29_342) then
        L29_342 = MAX_HOURS
      elseif A7_320 > L29_342 then
        L29_342 = _UPVALUE1_
        L29_342 = L29_342.BILLING_ALERT_LIMIT_HOURS_INVALID
        return L29_342
      end
    else
      L29_342 = DAY
      if A8_321 == L29_342 then
        L29_342 = MIN_DAYS
        if not (A7_320 < L29_342) then
          L29_342 = MAX_DAYS
        elseif A7_320 > L29_342 then
          L29_342 = _UPVALUE1_
          L29_342 = L29_342.BILLING_ALERT_LIMIT_DAYS_INVALID
          return L29_342
        end
      else
        L29_342 = GB
        if A8_321 == L29_342 then
          L29_342 = MIN_GB
          if not (A7_320 < L29_342) then
            L29_342 = MAX_GB
          elseif A7_320 > L29_342 then
            L29_342 = _UPVALUE1_
            L29_342 = L29_342.BILLING_ALERT_LIMIT_GB_INVALID
            return L29_342
          end
        else
          L29_342 = MB
          if A8_321 == L29_342 then
            L29_342 = MIN_MB
            if not (A7_320 < L29_342) then
              L29_342 = MAX_MB
            elseif A7_320 > L29_342 then
              L29_342 = _UPVALUE1_
              L29_342 = L29_342.BILLING_ALERT_LIMIT_MB_INVALID
              return L29_342
            end
          end
        end
      end
    end
  end
  L29_342 = DISABLE
  if A7_320 ~= L29_342 then
    L29_342 = ENABLE
    showAlert = L29_342
  else
    L29_342 = DISABLE
    showAlert = L29_342
  end
  L29_342 = NIL
  if A9_322 ~= L29_342 and A9_322 ~= "" then
    L29_342 = _UPVALUE2_
    L29_342 = L29_342.isBoolean
    L30_343 = A9_322
    L29_342 = L29_342(L30_343)
    valid = L29_342
    L29_342 = valid
    L30_343 = _UPVALUE0_
    L30_343 = L30_343.SUCCESS
    if L29_342 ~= L30_343 then
      L29_342 = _UPVALUE1_
      L29_342 = L29_342.BILLING_PROFILE_TIMED_INVALID
      return L29_342
    end
  end
  L29_342 = ENABLE
  if A9_322 == L29_342 then
    L29_342 = NIL
    if A11_324 == L29_342 or A11_324 == "" then
      L29_342 = _UPVALUE1_
      L29_342 = L29_342.BILLING_START_TYPE_NIL
      return L29_342
    end
    L29_342 = tonumber
    L30_343 = A11_324
    L29_342 = L29_342(L30_343)
    A11_324 = L29_342
    L29_342 = ACCOUNT_CREATION
    if A11_324 ~= L29_342 then
      L29_342 = ACCOUNT_LOGIN
      if A11_324 ~= L29_342 then
        L29_342 = CUSTOM_START
        if A11_324 ~= L29_342 then
          L29_342 = _UPVALUE1_
          L29_342 = L29_342.BILLING_START_TYPE_INVALID
          return L29_342
        end
      end
    end
    L29_342 = ACCOUNT_CREATION
    if A11_324 ~= L29_342 then
      L29_342 = ACCOUNT_LOGIN
    else
      if A11_324 == L29_342 then
        L29_342 = NIL
        if A21_334 == L29_342 or A21_334 == "" then
          L29_342 = _UPVALUE1_
          L29_342 = L29_342.BILLING_TIME_TYPE_NIL
          return L29_342
        end
        L29_342 = HR
        if A21_334 ~= L29_342 then
          L29_342 = DAY
          if A21_334 ~= L29_342 then
            L29_342 = _UPVALUE1_
            L29_342 = L29_342.BILLING_TIME_TYPE_INVALID
            return L29_342
          end
        end
        L29_342 = NIL
        if A10_323 == L29_342 or A10_323 == "" then
          L29_342 = _UPVALUE1_
          L29_342 = L29_342.BILLING_TIME_LIMIT_NIL
          return L29_342
        end
    end
    else
      L29_342 = CUSTOM_START
      if A11_324 == L29_342 then
        L29_342 = NIL
        if A12_325 == L29_342 or A12_325 == "" then
          L29_342 = _UPVALUE1_
          L29_342 = L29_342.BILLING_CUSTOM_START_TIME_NIL
          return L29_342
        end
        L29_342 = string
        L29_342 = L29_342.len
        L30_343 = A12_325
        L29_342 = L29_342(L30_343)
        L30_343 = CUSTOM_TIME_LEN
        if L29_342 ~= L30_343 then
          L30_343 = _UPVALUE1_
          L30_343 = L30_343.BILLING_CUSTOM_START_TIME_INVALID
          return L30_343
        end
        L30_343 = util
        L30_343 = L30_343.split
        L31_344 = A12_325
        L32_345 = " "
        L30_343 = L30_343(L31_344, L32_345)
        L31_344 = util
        L31_344 = L31_344.split
        L32_345 = L30_343[1]
        L33_346 = "/"
        L31_344 = L31_344(L32_345, L33_346)
        L32_345 = util
        L32_345 = L32_345.split
        L33_346 = L30_343[2]
        L34_347 = ":"
        L32_345 = L32_345(L33_346, L34_347)
        L33_346 = L31_344[1]
        L34_347 = L31_344[2]
        L35_348 = L31_344[3]
        L36_349 = L30_343[2]
        L37_350 = L30_343[3]
        L38_351 = L32_345[1]
        L39_352 = L32_345[2]
        if L37_350 == "AM" then
        elseif L37_350 == "PM" then
          L38_351 = tonumber(L38_351) + 12
        end
        A12_325 = L35_348 .. "/" .. L33_346 .. "/" .. L34_347 .. "@" .. L38_351 .. ":" .. L39_352
      end
    end
    L29_342 = NIL
    if A13_326 == L29_342 or A13_326 == "" then
      L29_342 = _UPVALUE1_
      L29_342 = L29_342.BILLING_CUSTOMIZE_TIME_NIL
      return L29_342
    end
    L29_342 = _UPVALUE2_
    L29_342 = L29_342.isBoolean
    L30_343 = A13_326
    L29_342 = L29_342(L30_343)
    valid = L29_342
    L29_342 = valid
    L30_343 = _UPVALUE0_
    L30_343 = L30_343.SUCCESS
    if L29_342 ~= L30_343 then
      L29_342 = _UPVALUE1_
      L29_342 = L29_342.BILLING_CUSTOMIZE_TIME_INVALID
      return L29_342
    end
  end
  L29_342 = NIL
  if A20_333 ~= L29_342 and A20_333 ~= "" then
    L29_342 = _UPVALUE2_
    L29_342 = L29_342.isBoolean
    L30_343 = A20_333
    L29_342 = L29_342(L30_343)
    valid = L29_342
    L29_342 = valid
    L30_343 = _UPVALUE0_
    L30_343 = L30_343.SUCCESS
    if L29_342 ~= L30_343 then
      L29_342 = _UPVALUE1_
      L29_342 = L29_342.BILLING_MAX_TRAFFIC_USAGE_CHECK_INVALID
      return L29_342
    end
  end
  L29_342 = ENABLE
  if A20_333 == L29_342 then
    L29_342 = NIL
    if A14_327 == L29_342 or A14_327 == "" then
      L29_342 = _UPVALUE1_
      L29_342 = L29_342.BILLING_MAX_TRAFFIC_USAGE_CHECK_NIL
      return L29_342
    end
    L29_342 = NIL
    if A15_328 == L29_342 or A15_328 == "" then
      L29_342 = _UPVALUE1_
      L29_342 = L29_342.BILLING_MAX_TRAFFIC_USAGE_TYPE_NIL
      return L29_342
    end
    L29_342 = tonumber
    L30_343 = A15_328
    L29_342 = L29_342(L30_343)
    A15_328 = L29_342
    L29_342 = INTIGER_MB
    if A15_328 ~= L29_342 then
      L29_342 = INTIGER_GB
      if A15_328 ~= L29_342 then
        L29_342 = _UPVALUE1_
        L29_342 = L29_342.BILLING_MAX_TRAFFIC_USAGE_TYPE_INVALID
        return L29_342
      end
    end
  end
  L29_342 = NIL
  if A19_332 ~= L29_342 and A19_332 ~= "" then
    L29_342 = _UPVALUE2_
    L29_342 = L29_342.isBoolean
    L30_343 = A19_332
    L29_342 = L29_342(L30_343)
    valid = L29_342
    L29_342 = valid
    L30_343 = _UPVALUE0_
    L30_343 = L30_343.SUCCESS
    if L29_342 ~= L30_343 then
      L29_342 = _UPVALUE1_
      L29_342 = L29_342.BILLING_MAX_USAGE_TIME_CHECK_NIL
      return L29_342
    end
  end
  L29_342 = ENABLE
  if A19_332 == L29_342 then
    L29_342 = NIL
    if A16_329 == L29_342 or A16_329 == "" then
      L29_342 = _UPVALUE1_
      L29_342 = L29_342.BILLING_MAX_USAGE_TIME_NIL
      return L29_342
    end
    L29_342 = NIL
    if A17_330 == L29_342 or A17_330 == "" then
      L29_342 = _UPVALUE1_
      L29_342 = L29_342.BILLING_USAGE_TIME_TYPE_NIL
      return L29_342
    end
    L29_342 = tonumber
    L30_343 = A17_330
    L29_342 = L29_342(L30_343)
    A17_330 = L29_342
    L29_342 = HR
    if A17_330 ~= L29_342 then
      L29_342 = DAY
      if A17_330 ~= L29_342 then
        L29_342 = _UPVALUE1_
        L29_342 = L29_342.BILLING_USAGE_TIME_TYPE_INVALID
        return L29_342
      end
    end
  end
  L29_342 = NIL
  if A19_332 ~= L29_342 then
    L29_342 = NIL
    if A20_333 ~= L29_342 then
      L29_342 = NIL
      if A18_331 == L29_342 or A18_331 == "" then
        L29_342 = _UPVALUE1_
        L29_342 = L29_342.BILLING_CUSTOMIZE_USAGE_NIL
        return L29_342
      end
      L29_342 = _UPVALUE2_
      L29_342 = L29_342.isBoolean
      L30_343 = A18_331
      L29_342 = L29_342(L30_343)
      valid = L29_342
      L29_342 = valid
      L30_343 = _UPVALUE0_
      L30_343 = L30_343.SUCCESS
      if L29_342 ~= L30_343 then
        L29_342 = _UPVALUE1_
        L29_342 = L29_342.BILLING_CUSTOMIZE_USAGE_INVALID
        return L29_342
      end
    end
  end
  L29_342 = _UPVALUE2_
  L29_342 = L29_342.isBoolean
  L30_343 = A22_335
  L29_342 = L29_342(L30_343)
  valid = L29_342
  L29_342 = valid
  L30_343 = _UPVALUE0_
  L30_343 = L30_343.SUCCESS
  if L29_342 ~= L30_343 then
    L29_342 = _UPVALUE1_
    L29_342 = L29_342.BILLING_PROFILE_SETPRICE_INVALID
    return L29_342
  end
  L29_342 = db
  L29_342 = L29_342.getAttribute
  L30_343 = billingTable
  L31_344 = ROWID
  L32_345 = L26_339
  L33_346 = attribute
  L33_346 = L33_346.setPriceEnable
  L29_342 = L29_342(L30_343, L31_344, L32_345, L33_346)
  L30_343 = ENABLE
  if L29_342 == L30_343 then
    L30_343 = ENABLE
    if A22_335 ~= L30_343 then
      L30_343 = billingProfileInUse
      L31_344 = L26_339
      L31_344 = L30_343(L31_344)
      L32_345 = _UPVALUE0_
      L32_345 = L32_345.SUCCESS
      if L30_343 == L32_345 then
        if L31_344 then
          L32_345 = _UPVALUE1_
          L32_345 = L32_345.BILLING_PROFILE_IN_USE_CANT_CHANGE_PRICE_DISABLE
          return L32_345
        end
      else
        L32_345 = _UPVALUE0_
        L32_345 = L32_345.FAILURE
        return L32_345
      end
    end
  end
  L30_343 = ENABLE
  if A22_335 == L30_343 then
    if A23_336 == nil or A23_336 == "" then
      L30_343 = _UPVALUE1_
      L30_343 = L30_343.BILLING_PROFILE_PRICE_INVALID
      return L30_343
    end
    if A24_337 == nil or A24_337 == "" then
      L30_343 = _UPVALUE1_
      L30_343 = L30_343.BILLING_PROFILE_CURRENCY_INVALID
      return L30_343
    end
    L30_343 = priceValidation
    L31_344 = A23_336
    L30_343 = L30_343(L31_344)
    if not L30_343 then
      L31_344 = _UPVALUE1_
      L31_344 = L31_344.BILLING_PROFILE_PRICE_INVALID
      return L31_344
    end
    L31_344 = tonumber
    L32_345 = A24_337
    L31_344 = L31_344(L32_345)
    L32_345 = _UPVALUE3_
    if not (L31_344 < L32_345) then
      L31_344 = tonumber
      L32_345 = A24_337
      L31_344 = L31_344(L32_345)
      L32_345 = _UPVALUE4_
    elseif L31_344 > L32_345 then
      L31_344 = _UPVALUE1_
      L31_344 = L31_344.BILLING_PROFILE_CURRENCY_INVALID
      return L31_344
    end
    L31_344 = db
    L31_344 = L31_344.getAttribute
    L32_345 = billingTable
    L33_346 = ROWID
    L34_347 = L26_339
    L35_348 = attribute
    L35_348 = L35_348.currency
    L31_344 = L31_344(L32_345, L33_346, L34_347, L35_348)
    L32_345 = NIL
    if L31_344 ~= L32_345 then
      L32_345 = tonumber
      L33_346 = L31_344
      L32_345 = L32_345(L33_346)
      L33_346 = tonumber
      L34_347 = A24_337
      L33_346 = L33_346(L34_347)
      if L32_345 ~= L33_346 then
        L32_345 = billingProfileInUse
        L33_346 = L26_339
        L33_346 = L32_345(L33_346)
        L34_347 = _UPVALUE0_
        L34_347 = L34_347.SUCCESS
        if L32_345 == L34_347 then
          if L33_346 then
            L34_347 = _UPVALUE1_
            L34_347 = L34_347.BILLING_PROFILE_IN_USE_CANT_CHANGE_CURRENCY
            return L34_347
          end
        else
          L34_347 = _UPVALUE0_
          L34_347 = L34_347.FAILURE
          return L34_347
        end
      end
    end
  end
  L30_343 = {}
  L31_344 = billingTable
  L32_345 = "."
  L33_346 = attribute
  L33_346 = L33_346.profile
  L31_344 = L31_344 .. L32_345 .. L33_346
  L30_343[L31_344] = A1_314
  L31_344 = billingTable
  L32_345 = "."
  L33_346 = attribute
  L33_346 = L33_346.description
  L31_344 = L31_344 .. L32_345 .. L33_346
  L30_343[L31_344] = A2_315
  L31_344 = billingTable
  L32_345 = "."
  L33_346 = attribute
  L33_346 = L33_346.multiLogin
  L31_344 = L31_344 .. L32_345 .. L33_346
  L30_343[L31_344] = A3_316
  L31_344 = billingTable
  L32_345 = "."
  L33_346 = attribute
  L33_346 = L33_346.customizedAccount
  L31_344 = L31_344 .. L32_345 .. L33_346
  L30_343[L31_344] = A4_317
  L31_344 = billingTable
  L32_345 = "."
  L33_346 = attribute
  L33_346 = L33_346.batchGeneration
  L31_344 = L31_344 .. L32_345 .. L33_346
  L30_343[L31_344] = A5_318
  L31_344 = billingTable
  L32_345 = "."
  L33_346 = attribute
  L33_346 = L33_346.sessionTimeout
  L31_344 = L31_344 .. L32_345 .. L33_346
  L30_343[L31_344] = A6_319
  L31_344 = billingTable
  L32_345 = "."
  L33_346 = attribute
  L33_346 = L33_346.alertLimit
  L31_344 = L31_344 .. L32_345 .. L33_346
  L30_343[L31_344] = A7_320
  L31_344 = billingTable
  L32_345 = "."
  L33_346 = attribute
  L33_346 = L33_346.alertType
  L31_344 = L31_344 .. L32_345 .. L33_346
  L30_343[L31_344] = A8_321
  L31_344 = billingTable
  L32_345 = "."
  L33_346 = attribute
  L33_346 = L33_346.timed
  L31_344 = L31_344 .. L32_345 .. L33_346
  L30_343[L31_344] = A9_322
  L31_344 = billingTable
  L32_345 = "."
  L33_346 = attribute
  L33_346 = L33_346.timeLimit
  L31_344 = L31_344 .. L32_345 .. L33_346
  L30_343[L31_344] = A10_323
  L31_344 = billingTable
  L32_345 = "."
  L33_346 = attribute
  L33_346 = L33_346.startType
  L31_344 = L31_344 .. L32_345 .. L33_346
  L30_343[L31_344] = A11_324
  L31_344 = billingTable
  L32_345 = "."
  L33_346 = attribute
  L33_346 = L33_346.customStartTime
  L31_344 = L31_344 .. L32_345 .. L33_346
  L30_343[L31_344] = A12_325
  L31_344 = billingTable
  L32_345 = "."
  L33_346 = attribute
  L33_346 = L33_346.customizeTime
  L31_344 = L31_344 .. L32_345 .. L33_346
  L30_343[L31_344] = A13_326
  L31_344 = billingTable
  L32_345 = "."
  L33_346 = attribute
  L33_346 = L33_346.maxTrafficUsage
  L31_344 = L31_344 .. L32_345 .. L33_346
  L30_343[L31_344] = A14_327
  L31_344 = billingTable
  L32_345 = "."
  L33_346 = attribute
  L33_346 = L33_346.trafficUsageType
  L31_344 = L31_344 .. L32_345 .. L33_346
  L30_343[L31_344] = A15_328
  L31_344 = billingTable
  L32_345 = "."
  L33_346 = attribute
  L33_346 = L33_346.maxUsageTime
  L31_344 = L31_344 .. L32_345 .. L33_346
  L30_343[L31_344] = A16_329
  L31_344 = billingTable
  L32_345 = "."
  L33_346 = attribute
  L33_346 = L33_346.usageTimeType
  L31_344 = L31_344 .. L32_345 .. L33_346
  L30_343[L31_344] = A17_330
  L31_344 = billingTable
  L32_345 = "."
  L33_346 = attribute
  L33_346 = L33_346.customizeUsage
  L31_344 = L31_344 .. L32_345 .. L33_346
  L30_343[L31_344] = A18_331
  L31_344 = billingTable
  L32_345 = "."
  L33_346 = attribute
  L33_346 = L33_346.showAlert
  L31_344 = L31_344 .. L32_345 .. L33_346
  L32_345 = showAlert
  L30_343[L31_344] = L32_345
  L31_344 = billingTable
  L32_345 = "."
  L33_346 = attribute
  L33_346 = L33_346.timeType
  L31_344 = L31_344 .. L32_345 .. L33_346
  L30_343[L31_344] = A21_334
  L31_344 = billingTable
  L32_345 = "."
  L33_346 = attribute
  L33_346 = L33_346.maxUsageTimeCheck
  L31_344 = L31_344 .. L32_345 .. L33_346
  L30_343[L31_344] = A19_332
  L31_344 = billingTable
  L32_345 = "."
  L33_346 = attribute
  L33_346 = L33_346.maxTrafficUsageCheck
  L31_344 = L31_344 .. L32_345 .. L33_346
  L30_343[L31_344] = A20_333
  L31_344 = billingTable
  L32_345 = "."
  L33_346 = attribute
  L33_346 = L33_346.setPriceEnable
  L31_344 = L31_344 .. L32_345 .. L33_346
  L30_343[L31_344] = A22_335
  L31_344 = ENABLE
  if A22_335 == L31_344 then
    L31_344 = billingTable
    L32_345 = "."
    L33_346 = attribute
    L33_346 = L33_346.price
    L31_344 = L31_344 .. L32_345 .. L33_346
    L30_343[L31_344] = A23_336
    L31_344 = billingTable
    L32_345 = "."
    L33_346 = attribute
    L33_346 = L33_346.currency
    L31_344 = L31_344 .. L32_345 .. L33_346
    L30_343[L31_344] = A24_337
  end
  L31_344 = db
  L31_344 = L31_344.update
  L32_345 = billingTable
  L33_346 = L30_343
  L34_347 = L26_339
  L31_344 = L31_344(L32_345, L33_346, L34_347)
  L32_345 = NIL
  if L31_344 == L32_345 then
    L32_345 = _UPVALUE0_
    L32_345 = L32_345.FAILURE
    L33_346 = L26_339
    return L32_345, L33_346
  end
  L32_345 = _UPVALUE0_
  L32_345 = L32_345.SUCCESS
  L33_346 = L26_339
  return L32_345, L33_346
end
function billingProfileCreate(A0_353, A1_354, A2_355, A3_356, A4_357, A5_358, A6_359, A7_360, A8_361, A9_362, A10_363, A11_364, A12_365, A13_366, A14_367, A15_368, A16_369, A17_370, A18_371, A19_372, A20_373, A21_374, A22_375, A23_376)
  local L24_377, L25_378, L26_379, L27_380, L28_381, L29_382, L30_383, L31_384, L32_385, L33_386, L34_387, L35_388, L36_389, L37_390
  L24_377 = NIL
  if A0_353 == L24_377 or A0_353 == "" then
    L24_377 = _UPVALUE0_
    L24_377 = L24_377.BILLING_PROFILENAME_NIL
    return L24_377
  end
  L24_377 = db
  L24_377 = L24_377.getTable
  L25_378 = billingTable
  L24_377 = L24_377(L25_378)
  L25_378 = #L24_377
  L26_379 = MAX_BILLING_PROFILE
  if L25_378 > L26_379 then
    L25_378 = _UPVALUE0_
    L25_378 = L25_378.BILLING_PROFILES_AT_MAX_NUMBERS
    return L25_378
  end
  L25_378 = string
  L25_378 = L25_378.len
  L26_379 = A0_353
  L25_378 = L25_378(L26_379)
  L26_379 = MAXLEN_PROFILE
  if not (L25_378 > L26_379) then
    L26_379 = MINLEN_PROFILE
  elseif L25_378 < L26_379 then
    L26_379 = _UPVALUE0_
    L26_379 = L26_379.BILLING_PROFILENAME_INVALID
    return L26_379
  end
  L26_379 = NIL
  if A1_354 == L26_379 or A1_354 == "" then
    L26_379 = _UPVALUE0_
    L26_379 = L26_379.BILLING_DESC_NIL
    return L26_379
  end
  L26_379 = string
  L26_379 = L26_379.len
  L27_380 = A1_354
  L26_379 = L26_379(L27_380)
  L27_380 = MAXLEN_DESC
  if not (L26_379 > L27_380) then
    L27_380 = MINLEN_DESC
  elseif L26_379 < L27_380 then
    L27_380 = _UPVALUE0_
    L27_380 = L27_380.BILLING_DESC_INVALID
    return L27_380
  end
  L27_380 = NIL
  if A2_355 == L27_380 then
    L27_380 = _UPVALUE0_
    L27_380 = L27_380.BILLING_MULTILOGIN_NIL
    return L27_380
  end
  L27_380 = _UPVALUE1_
  L27_380 = L27_380.isBoolean
  L28_381 = A2_355
  L27_380 = L27_380(L28_381)
  valid = L27_380
  L27_380 = valid
  L28_381 = _UPVALUE2_
  L28_381 = L28_381.SUCCESS
  if L27_380 ~= L28_381 then
    L27_380 = _UPVALUE0_
    L27_380 = L27_380.BILLING_MULTILOGIN_INVALID
    return L27_380
  end
  L27_380 = NIL
  if A3_356 == L27_380 or A3_356 == "" then
    L27_380 = _UPVALUE0_
    L27_380 = L27_380.BILLING_CUSTOMIZED_ACCOUNT_NIL
    return L27_380
  end
  L27_380 = _UPVALUE1_
  L27_380 = L27_380.isBoolean
  L28_381 = A3_356
  L27_380 = L27_380(L28_381)
  valid = L27_380
  L27_380 = valid
  L28_381 = _UPVALUE2_
  L28_381 = L28_381.SUCCESS
  if L27_380 ~= L28_381 then
    L27_380 = _UPVALUE0_
    L27_380 = L27_380.BILLING_CUSTOMIZED_ACCOUNT_INVALID
    return L27_380
  end
  L27_380 = NIL
  if A4_357 == L27_380 or A4_357 == "" then
    L27_380 = _UPVALUE0_
    L27_380 = L27_380.BILLING_BATCH_GEN_NIL
    return L27_380
  end
  L27_380 = _UPVALUE1_
  L27_380 = L27_380.isBoolean
  L28_381 = A4_357
  L27_380 = L27_380(L28_381)
  valid = L27_380
  L27_380 = valid
  L28_381 = _UPVALUE2_
  L28_381 = L28_381.SUCCESS
  if L27_380 ~= L28_381 then
    L27_380 = _UPVALUE0_
    L27_380 = L27_380.BILLING_BATCH_GEN_INVALID
    return L27_380
  end
  if A5_358 ~= "" then
    L27_380 = NIL
  elseif A5_358 == L27_380 then
    L27_380 = _UPVALUE0_
    L27_380 = L27_380.BILLING_SESSION_TIMEOUT_NIL
    return L27_380
  end
  L27_380 = tonumber
  L28_381 = A5_358
  L27_380 = L27_380(L28_381)
  L28_381 = MIN_TIMEOUT
  if not (L27_380 < L28_381) then
    L27_380 = tonumber
    L28_381 = A5_358
    L27_380 = L27_380(L28_381)
    L28_381 = MAX_TIMEOUT
  elseif L27_380 > L28_381 then
    L27_380 = _UPVALUE0_
    L27_380 = L27_380.BILLING_SESSION_TIMEOUT_INVALID
    return L27_380
  end
  L27_380 = NIL
  if A8_361 == L27_380 or A8_361 == "" then
    L27_380 = NIL
    if A18_371 == L27_380 then
      L27_380 = NIL
      if A19_372 == L27_380 then
        L27_380 = _UPVALUE0_
        L27_380 = L27_380.BILLING_PROFILE_TIMED_NIL
        return L27_380
      end
    end
  end
  L27_380 = NIL
  if A7_360 == L27_380 or A7_360 == "" then
    L27_380 = _UPVALUE0_
    L27_380 = L27_380.BILLING_ALERT_TYPE_NIL
    return L27_380
  end
  L27_380 = tonumber
  L28_381 = A7_360
  L27_380 = L27_380(L28_381)
  A7_360 = L27_380
  L27_380 = HR
  if A7_360 ~= L27_380 then
    L27_380 = DAY
    if A7_360 ~= L27_380 then
      L27_380 = MB
      if A7_360 ~= L27_380 then
        L27_380 = GB
        if A7_360 ~= L27_380 then
          L27_380 = _UPVALUE0_
          L27_380 = L27_380.BILLING_ALERT_TYPE_INVALID
          return L27_380
        end
      end
    end
  end
  L27_380 = NIL
  if A6_359 == L27_380 or A6_359 == "" then
    L27_380 = _UPVALUE0_
    L27_380 = L27_380.BILLING_ALERT_LIMIT_NIL
    return L27_380
  end
  L27_380 = tonumber
  L28_381 = A6_359
  L27_380 = L27_380(L28_381)
  A6_359 = L27_380
  L27_380 = NIL
  if A7_360 == L27_380 or A7_360 == "" then
    L27_380 = _UPVALUE2_
    L27_380 = L27_380.INVALID_ARGUMENT
    return L27_380
  else
    L27_380 = HR
    if A7_360 == L27_380 then
      L27_380 = MIN_HOURS
      if not (A6_359 < L27_380) then
        L27_380 = MAX_HOURS
      elseif A6_359 > L27_380 then
        L27_380 = _UPVALUE0_
        L27_380 = L27_380.BILLING_ALERT_LIMIT_HOURS_INVALID
        return L27_380
      end
    else
      L27_380 = DAY
      if A7_360 == L27_380 then
        L27_380 = MIN_DAYS
        if not (A6_359 < L27_380) then
          L27_380 = MAX_DAYS
        elseif A6_359 > L27_380 then
          L27_380 = _UPVALUE0_
          L27_380 = L27_380.BILLING_ALERT_LIMIT_DAYS_INVALID
          return L27_380
        end
      else
        L27_380 = GB
        if A7_360 == L27_380 then
          L27_380 = MIN_GB
          if not (A6_359 < L27_380) then
            L27_380 = MAX_GB
          elseif A6_359 > L27_380 then
            L27_380 = _UPVALUE0_
            L27_380 = L27_380.BILLING_ALERT_LIMIT_GB_INVALID
            return L27_380
          end
        else
          L27_380 = MB
          if A7_360 == L27_380 then
            L27_380 = MIN_MB
            if not (A6_359 < L27_380) then
              L27_380 = MAX_MB
            elseif A6_359 > L27_380 then
              L27_380 = _UPVALUE0_
              L27_380 = L27_380.BILLING_ALERT_LIMIT_MB_INVALID
              return L27_380
            end
          end
        end
      end
    end
  end
  L27_380 = DISABLE
  if A6_359 ~= L27_380 then
    L27_380 = ENABLE
    showAlert = L27_380
  else
    L27_380 = DISABLE
    showAlert = L27_380
  end
  L27_380 = NIL
  if A8_361 ~= L27_380 and A8_361 ~= "" then
    L27_380 = _UPVALUE1_
    L27_380 = L27_380.isBoolean
    L28_381 = A8_361
    L27_380 = L27_380(L28_381)
    valid = L27_380
    L27_380 = valid
    L28_381 = _UPVALUE2_
    L28_381 = L28_381.SUCCESS
    if L27_380 ~= L28_381 then
      L27_380 = _UPVALUE0_
      L27_380 = L27_380.BILLING_PROFILE_TIMED_INVALID
      return L27_380
    end
  end
  L27_380 = ENABLE
  if A8_361 == L27_380 then
    L27_380 = NIL
    if A10_363 == L27_380 or A10_363 == "" then
      L27_380 = _UPVALUE0_
      L27_380 = L27_380.BILLING_START_TYPE_NIL
      return L27_380
    end
    L27_380 = tonumber
    L28_381 = A10_363
    L27_380 = L27_380(L28_381)
    A10_363 = L27_380
    L27_380 = ACCOUNT_CREATION
    if A10_363 ~= L27_380 then
      L27_380 = ACCOUNT_LOGIN
      if A10_363 ~= L27_380 then
        L27_380 = CUSTOM_START
        if A10_363 ~= L27_380 then
          L27_380 = _UPVALUE0_
          L27_380 = L27_380.BILLING_START_TYPE_INVALID
          return L27_380
        end
      end
    end
    L27_380 = ACCOUNT_CREATION
    if A10_363 ~= L27_380 then
      L27_380 = ACCOUNT_LOGIN
    else
      if A10_363 == L27_380 then
        L27_380 = NIL
        if A20_373 == L27_380 or A20_373 == "" then
          L27_380 = _UPVALUE0_
          L27_380 = L27_380.BILLING_TIME_TYPE_NIL
          return L27_380
        end
        L27_380 = HR
        if A20_373 ~= L27_380 then
          L27_380 = DAY
          if A20_373 ~= L27_380 then
            L27_380 = _UPVALUE0_
            L27_380 = L27_380.BILLING_TIME_TYPE_INVALID
            return L27_380
          end
        end
        L27_380 = NIL
        if A9_362 == L27_380 or A9_362 == "" then
          L27_380 = _UPVALUE0_
          L27_380 = L27_380.BILLING_TIME_LIMIT_NIL
          return L27_380
        end
        L27_380 = util
        L27_380 = L27_380.date
        L27_380 = L27_380()
        L28_381 = L27_380.year
        L29_382 = "/"
        L30_383 = L27_380.month
        L31_384 = "/"
        L32_385 = L27_380.date
        L33_386 = "@"
        L34_387 = L27_380.hours
        L35_388 = ":"
        L36_389 = L27_380.minutes
        L28_381 = L28_381 .. L29_382 .. L30_383 .. L31_384 .. L32_385 .. L33_386 .. L34_387 .. L35_388 .. L36_389
        A11_364 = L28_381
    end
    else
      L27_380 = CUSTOM_START
      if A10_363 == L27_380 then
        L27_380 = NIL
        if A11_364 == L27_380 or A11_364 == "" then
          L27_380 = _UPVALUE0_
          L27_380 = L27_380.BILLING_CUSTOM_START_TIME_NIL
          return L27_380
        end
        L27_380 = string
        L27_380 = L27_380.len
        L28_381 = A11_364
        L27_380 = L27_380(L28_381)
        L28_381 = CUSTOM_TIME_LEN
        if L27_380 ~= L28_381 then
          L28_381 = _UPVALUE0_
          L28_381 = L28_381.BILLING_CUSTOM_START_TIME_INVALID
          return L28_381
        end
        L28_381 = util
        L28_381 = L28_381.split
        L29_382 = A11_364
        L30_383 = " "
        L28_381 = L28_381(L29_382, L30_383)
        L29_382 = util
        L29_382 = L29_382.split
        L30_383 = L28_381[1]
        L31_384 = "/"
        L29_382 = L29_382(L30_383, L31_384)
        L30_383 = util
        L30_383 = L30_383.split
        L31_384 = L28_381[2]
        L32_385 = ":"
        L30_383 = L30_383(L31_384, L32_385)
        L31_384 = L29_382[1]
        L32_385 = L29_382[2]
        L33_386 = L29_382[3]
        L34_387 = L28_381[2]
        L35_388 = L28_381[3]
        L36_389 = L30_383[1]
        L37_390 = L30_383[2]
        if L35_388 == "AM" then
        elseif L35_388 == "PM" then
          L36_389 = tonumber(L36_389) + 12
        end
        A11_364 = L33_386 .. "/" .. L31_384 .. "/" .. L32_385 .. "@" .. L36_389 .. ":" .. L37_390
      end
    end
    L27_380 = NIL
    if A12_365 == L27_380 or A12_365 == "" then
      L27_380 = _UPVALUE0_
      L27_380 = L27_380.BILLING_CUSTOMIZE_TIME_NIL
      return L27_380
    end
    L27_380 = _UPVALUE1_
    L27_380 = L27_380.isBoolean
    L28_381 = A12_365
    L27_380 = L27_380(L28_381)
    valid = L27_380
    L27_380 = valid
    L28_381 = _UPVALUE2_
    L28_381 = L28_381.SUCCESS
    if L27_380 ~= L28_381 then
      L27_380 = _UPVALUE0_
      L27_380 = L27_380.BILLING_CUSTOMIZE_TIME_INVALID
      return L27_380
    end
  end
  L27_380 = NIL
  if A19_372 ~= L27_380 and A19_372 ~= "" then
    L27_380 = _UPVALUE1_
    L27_380 = L27_380.isBoolean
    L28_381 = A19_372
    L27_380 = L27_380(L28_381)
    valid = L27_380
    L27_380 = valid
    L28_381 = _UPVALUE2_
    L28_381 = L28_381.SUCCESS
    if L27_380 ~= L28_381 then
      L27_380 = _UPVALUE0_
      L27_380 = L27_380.BILLING_MAX_TRAFFIC_USAGE_CHECK_INVALID
      return L27_380
    end
  end
  L27_380 = ENABLE
  if A19_372 == L27_380 then
    L27_380 = NIL
    if A13_366 == L27_380 or A13_366 == "" then
      L27_380 = _UPVALUE0_
      L27_380 = L27_380.BILLING_MAX_TRAFFIC_USAGE_CHECK_NIL
      return L27_380
    end
    L27_380 = NIL
    if A14_367 == L27_380 or A14_367 == "" then
      L27_380 = _UPVALUE0_
      L27_380 = L27_380.BILLING_MAX_TRAFFIC_USAGE_TYPE_NIL
      return L27_380
    end
    L27_380 = tonumber
    L28_381 = A14_367
    L27_380 = L27_380(L28_381)
    A14_367 = L27_380
    L27_380 = INTIGER_MB
    if A14_367 ~= L27_380 then
      L27_380 = INTIGER_GB
      if A14_367 ~= L27_380 then
        L27_380 = _UPVALUE0_
        L27_380 = L27_380.BILLING_MAX_TRAFFIC_USAGE_TYPE_INVALID
        return L27_380
      end
    end
  end
  L27_380 = NIL
  if A18_371 ~= L27_380 and A18_371 ~= "" then
    L27_380 = _UPVALUE1_
    L27_380 = L27_380.isBoolean
    L28_381 = A18_371
    L27_380 = L27_380(L28_381)
    valid = L27_380
    L27_380 = valid
    L28_381 = _UPVALUE2_
    L28_381 = L28_381.SUCCESS
    if L27_380 ~= L28_381 then
      L27_380 = _UPVALUE0_
      L27_380 = L27_380.BILLING_MAX_USAGE_TIME_CHECK_NIL
      return L27_380
    end
  end
  L27_380 = ENABLE
  if A18_371 == L27_380 then
    L27_380 = NIL
    if A15_368 == L27_380 or A15_368 == "" then
      L27_380 = _UPVALUE0_
      L27_380 = L27_380.BILLING_MAX_USAGE_TIME_NIL
      return L27_380
    end
    L27_380 = NIL
    if A16_369 == L27_380 or A16_369 == "" then
      L27_380 = _UPVALUE0_
      L27_380 = L27_380.BILLING_USAGE_TIME_TYPE_NIL
      return L27_380
    end
    L27_380 = tonumber
    L28_381 = A16_369
    L27_380 = L27_380(L28_381)
    A16_369 = L27_380
    L27_380 = HR
    if A16_369 ~= L27_380 then
      L27_380 = DAY
      if A16_369 ~= L27_380 then
        L27_380 = _UPVALUE0_
        L27_380 = L27_380.BILLING_USAGE_TIME_TYPE_INVALID
        return L27_380
      end
    end
  end
  L27_380 = NIL
  if A18_371 ~= L27_380 then
    L27_380 = NIL
    if A19_372 ~= L27_380 then
      L27_380 = NIL
      if A17_370 == L27_380 or A17_370 == "" then
        L27_380 = _UPVALUE0_
        L27_380 = L27_380.BILLING_CUSTOMIZE_USAGE_NIL
        return L27_380
      end
      L27_380 = _UPVALUE1_
      L27_380 = L27_380.isBoolean
      L28_381 = A17_370
      L27_380 = L27_380(L28_381)
      valid = L27_380
      L27_380 = valid
      L28_381 = _UPVALUE2_
      L28_381 = L28_381.SUCCESS
      if L27_380 ~= L28_381 then
        L27_380 = _UPVALUE0_
        L27_380 = L27_380.BILLING_CUSTOMIZE_USAGE_INVALID
        return L27_380
      end
    end
  end
  L27_380 = getMaxProfileId
  L28_381 = billingTable
  L29_382 = attribute
  L29_382 = L29_382.profileId
  L28_381 = L27_380(L28_381, L29_382)
  L29_382 = _UPVALUE2_
  L29_382 = L29_382.SUCCESS
  if L27_380 ~= L29_382 then
    L29_382 = _UPVALUE2_
    L29_382 = L29_382.NOT_EXIST
    if L27_380 == L29_382 then
      L28_381 = 0
    else
      return L27_380
    end
  end
  L29_382 = _UPVALUE1_
  L29_382 = L29_382.isBoolean
  L30_383 = A21_374
  L29_382 = L29_382(L30_383)
  valid = L29_382
  L29_382 = valid
  L30_383 = _UPVALUE2_
  L30_383 = L30_383.SUCCESS
  if L29_382 ~= L30_383 then
    L29_382 = _UPVALUE0_
    L29_382 = L29_382.BILLING_PROFILE_SETPRICE_INVALID
    return L29_382
  end
  L29_382 = ENABLE
  if A21_374 == L29_382 then
    if A22_375 == nil or A22_375 == "" then
      L29_382 = _UPVALUE0_
      L29_382 = L29_382.BILLING_PROFILE_PRICE_INVALID
      return L29_382
    end
    if A23_376 == nil or A23_376 == "" then
      L29_382 = _UPVALUE0_
      L29_382 = L29_382.BILLING_PROFILE_CURRENCY_INVALID
      return L29_382
    end
    L29_382 = priceValidation
    L30_383 = A22_375
    L29_382 = L29_382(L30_383)
    if not L29_382 then
      L30_383 = _UPVALUE0_
      L30_383 = L30_383.BILLING_PROFILE_PRICE_INVALID
      return L30_383
    end
    L30_383 = tonumber
    L31_384 = A23_376
    L30_383 = L30_383(L31_384)
    L31_384 = _UPVALUE3_
    if not (L30_383 < L31_384) then
      L30_383 = tonumber
      L31_384 = A23_376
      L30_383 = L30_383(L31_384)
      L31_384 = _UPVALUE4_
    elseif L30_383 > L31_384 then
      L30_383 = _UPVALUE0_
      L30_383 = L30_383.BILLING_PROFILE_CURRENCY_INVALID
      return L30_383
    end
  end
  L29_382 = db
  L29_382 = L29_382.getRows
  L30_383 = "tempCPUserProfiles"
  L31_384 = "ProfileName"
  L32_385 = A0_353
  L29_382 = L29_382(L30_383, L31_384, L32_385)
  checkProfileName = L29_382
  L29_382 = checkProfileName
  if L29_382 ~= nil then
    L29_382 = checkProfileName
    L29_382 = #L29_382
    if L29_382 > 0 then
      L29_382 = _UPVALUE0_
      L29_382 = L29_382.NAME_ALREADY_EXIST
      return L29_382
    end
  end
  L28_381 = L28_381 + 1
  L29_382 = {}
  L30_383 = billingTable
  L31_384 = "."
  L32_385 = attribute
  L32_385 = L32_385.profileId
  L30_383 = L30_383 .. L31_384 .. L32_385
  L29_382[L30_383] = L28_381
  L30_383 = billingTable
  L31_384 = "."
  L32_385 = attribute
  L32_385 = L32_385.profile
  L30_383 = L30_383 .. L31_384 .. L32_385
  L29_382[L30_383] = A0_353
  L30_383 = billingTable
  L31_384 = "."
  L32_385 = attribute
  L32_385 = L32_385.description
  L30_383 = L30_383 .. L31_384 .. L32_385
  L29_382[L30_383] = A1_354
  L30_383 = billingTable
  L31_384 = "."
  L32_385 = attribute
  L32_385 = L32_385.multiLogin
  L30_383 = L30_383 .. L31_384 .. L32_385
  L29_382[L30_383] = A2_355
  L30_383 = billingTable
  L31_384 = "."
  L32_385 = attribute
  L32_385 = L32_385.customizedAccount
  L30_383 = L30_383 .. L31_384 .. L32_385
  L29_382[L30_383] = A3_356
  L30_383 = billingTable
  L31_384 = "."
  L32_385 = attribute
  L32_385 = L32_385.batchGeneration
  L30_383 = L30_383 .. L31_384 .. L32_385
  L29_382[L30_383] = A4_357
  L30_383 = billingTable
  L31_384 = "."
  L32_385 = attribute
  L32_385 = L32_385.sessionTimeout
  L30_383 = L30_383 .. L31_384 .. L32_385
  L29_382[L30_383] = A5_358
  L30_383 = billingTable
  L31_384 = "."
  L32_385 = attribute
  L32_385 = L32_385.alertLimit
  L30_383 = L30_383 .. L31_384 .. L32_385
  L29_382[L30_383] = A6_359
  L30_383 = billingTable
  L31_384 = "."
  L32_385 = attribute
  L32_385 = L32_385.alertType
  L30_383 = L30_383 .. L31_384 .. L32_385
  L29_382[L30_383] = A7_360
  L30_383 = billingTable
  L31_384 = "."
  L32_385 = attribute
  L32_385 = L32_385.timed
  L30_383 = L30_383 .. L31_384 .. L32_385
  L29_382[L30_383] = A8_361
  L30_383 = billingTable
  L31_384 = "."
  L32_385 = attribute
  L32_385 = L32_385.timeLimit
  L30_383 = L30_383 .. L31_384 .. L32_385
  L29_382[L30_383] = A9_362
  L30_383 = billingTable
  L31_384 = "."
  L32_385 = attribute
  L32_385 = L32_385.startType
  L30_383 = L30_383 .. L31_384 .. L32_385
  L29_382[L30_383] = A10_363
  L30_383 = billingTable
  L31_384 = "."
  L32_385 = attribute
  L32_385 = L32_385.customStartTime
  L30_383 = L30_383 .. L31_384 .. L32_385
  L29_382[L30_383] = A11_364
  L30_383 = billingTable
  L31_384 = "."
  L32_385 = attribute
  L32_385 = L32_385.customizeTime
  L30_383 = L30_383 .. L31_384 .. L32_385
  L29_382[L30_383] = A12_365
  L30_383 = billingTable
  L31_384 = "."
  L32_385 = attribute
  L32_385 = L32_385.maxTrafficUsage
  L30_383 = L30_383 .. L31_384 .. L32_385
  L29_382[L30_383] = A13_366
  L30_383 = billingTable
  L31_384 = "."
  L32_385 = attribute
  L32_385 = L32_385.trafficUsageType
  L30_383 = L30_383 .. L31_384 .. L32_385
  L29_382[L30_383] = A14_367
  L30_383 = billingTable
  L31_384 = "."
  L32_385 = attribute
  L32_385 = L32_385.maxUsageTime
  L30_383 = L30_383 .. L31_384 .. L32_385
  L29_382[L30_383] = A15_368
  L30_383 = billingTable
  L31_384 = "."
  L32_385 = attribute
  L32_385 = L32_385.usageTimeType
  L30_383 = L30_383 .. L31_384 .. L32_385
  L29_382[L30_383] = A16_369
  L30_383 = billingTable
  L31_384 = "."
  L32_385 = attribute
  L32_385 = L32_385.customizeUsage
  L30_383 = L30_383 .. L31_384 .. L32_385
  L29_382[L30_383] = A17_370
  L30_383 = billingTable
  L31_384 = "."
  L32_385 = attribute
  L32_385 = L32_385.showAlert
  L30_383 = L30_383 .. L31_384 .. L32_385
  L31_384 = showAlert
  L29_382[L30_383] = L31_384
  L30_383 = billingTable
  L31_384 = "."
  L32_385 = attribute
  L32_385 = L32_385.timeType
  L30_383 = L30_383 .. L31_384 .. L32_385
  L29_382[L30_383] = A20_373
  L30_383 = billingTable
  L31_384 = "."
  L32_385 = attribute
  L32_385 = L32_385.maxUsageTimeCheck
  L30_383 = L30_383 .. L31_384 .. L32_385
  L29_382[L30_383] = A18_371
  L30_383 = billingTable
  L31_384 = "."
  L32_385 = attribute
  L32_385 = L32_385.maxTrafficUsageCheck
  L30_383 = L30_383 .. L31_384 .. L32_385
  L29_382[L30_383] = A19_372
  L30_383 = billingTable
  L31_384 = "."
  L32_385 = attribute
  L32_385 = L32_385.setPriceEnable
  L30_383 = L30_383 .. L31_384 .. L32_385
  L29_382[L30_383] = A21_374
  L30_383 = ENABLE
  if A21_374 == L30_383 then
    L30_383 = billingTable
    L31_384 = "."
    L32_385 = attribute
    L32_385 = L32_385.price
    L30_383 = L30_383 .. L31_384 .. L32_385
    L29_382[L30_383] = A22_375
    L30_383 = billingTable
    L31_384 = "."
    L32_385 = attribute
    L32_385 = L32_385.currency
    L30_383 = L30_383 .. L31_384 .. L32_385
    L29_382[L30_383] = A23_376
  end
  L30_383 = db
  L30_383 = L30_383.insert
  L31_384 = billingTable
  L32_385 = L29_382
  L30_383 = L30_383(L31_384, L32_385)
  L31_384 = NIL
  if L30_383 == L31_384 then
    L31_384 = _UPVALUE2_
    L31_384 = L31_384.FAILURE
    L32_385 = cookie
    return L31_384, L32_385
  end
  L31_384 = _UPVALUE2_
  L31_384 = L31_384.SUCCESS
  L32_385 = cookie
  return L31_384, L32_385
end
function billingProfileDelete(A0_391)
  local L1_392, L2_393
  L1_392 = NIL
  if A0_391 == L1_392 then
    L1_392 = _UPVALUE0_
    L1_392 = L1_392.INVALID_ARGUMENT
    return L1_392
  end
  L1_392 = cookieValidate
  L2_393 = ROWID
  L2_393 = L1_392(L2_393, A0_391, billingTable)
  if L1_392 ~= _UPVALUE0_.SUCCESS then
    return L1_392
  end
  if billingProfileInUse(L2_393) == _UPVALUE0_.SUCCESS then
    if billingProfileInUse(L2_393) then
      return _UPVALUE1_.BILLING_PROFILE_IN_USE
    end
  else
    return _UPVALUE0_.FAILURE
  end
  if db.deleteRow(billingTable, ROWID, L2_393) == NIL then
    return _UPVALUE0_.FAILURE, L2_393
  end
  return _UPVALUE0_.SUCCESS, L2_393
end
function billingProfilesGetAll()
  local L0_394
  L0_394 = db
  L0_394 = L0_394.getTable
  L0_394 = L0_394(billingTable)
  if next(L0_394) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_394
end
function billingProfileGetRow(A0_395)
  local L1_396
  L1_396 = db
  L1_396 = L1_396.getRow
  L1_396 = L1_396(billingTable, ROWID, A0_395)
  if L1_396 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_395, L1_396
end
function billingProfileDeleteAll()
  if anyBillingProfileInUse() == _UPVALUE0_.SUCCESS then
    if anyBillingProfileInUse() then
      return _UPVALUE1_.BILLING_PROFILE_IN_USE
    end
  else
    return _UPVALUE0_.FAILURE
  end
  if db.deleteAllRows(billingTable) == NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, cookie
end
function paymentGWProfilesGetAll()
  local L0_397, L1_398
  L0_397 = "SELECT *, _ROWID_ AS _ROWID_ FROM "
  L1_398 = billingTable
  L0_397 = L0_397 .. L1_398 .. " WHERE " .. attribute.setPriceEnable .. "='" .. ENABLE .. "'"
  L1_398 = db
  L1_398 = L1_398.getTable
  L1_398 = L1_398(billingTable, false, L0_397)
  if L1_398 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_398
end
function priceValidation(A0_399)
  local L1_400, L2_401, L3_402
  L1_400 = util
  L1_400 = L1_400.split
  L2_401 = A0_399
  L3_402 = "."
  L1_400 = L1_400(L2_401, L3_402)
  L2_401, L3_402 = nil, nil
  if L1_400 == nil or #L1_400 > 2 then
    return false
  end
  L2_401 = tonumber(L1_400[1])
  if L2_401 == nil then
    return false
  end
  if #L1_400 == 2 then
    if 2 < string.len(L1_400[2]) or 1 > string.len(L1_400[2]) then
      return false
    end
    L3_402 = tonumber(L1_400[2])
    if L3_402 == nil then
      return false
    end
    if L3_402 < 0 or L3_402 > 99 then
      return false
    end
  end
  return true
end
function billingProfileInUse(A0_403)
  local L1_404, L2_405, L3_406, L4_407, L5_408, L6_409, L7_410, L8_411, L9_412
  L1_404 = "SELECT *, _ROWID_ AS _ROWID_ FROM "
  L2_405 = _UPVALUE0_
  L3_406 = " WHERE "
  L7_410 = "'"
  L1_404 = L1_404 .. L2_405 .. L3_406 .. L4_407 .. L5_408 .. L6_409 .. L7_410
  L2_405 = db
  L2_405 = L2_405.getTable
  L3_406 = _UPVALUE0_
  L2_405 = L2_405(L3_406, L4_407, L5_408)
  L3_406 = NIL
  if L2_405 == L3_406 then
    L3_406 = _UPVALUE1_
    L3_406 = L3_406.FAILURE
    return L3_406
  end
  L3_406 = db
  L3_406 = L3_406.getAttribute
  L7_410 = attribute
  L7_410 = L7_410.profileId
  L3_406 = L3_406(L4_407, L5_408, L6_409, L7_410)
  if L3_406 == nil then
    return L4_407
  end
  for L7_410, L8_411 in L4_407(L5_408) do
    L9_412 = util
    L9_412 = L9_412.split
    L9_412 = L9_412(L8_411[attribute.billingProfileIds], ",")
    for _FORV_13_, _FORV_14_ in pairs(L9_412) do
      if L3_406 == _FORV_14_ then
        return _UPVALUE1_.SUCCESS, true
      end
    end
  end
  return L4_407, L5_408
end
function anyBillingProfileInUse()
  local L0_413, L1_414, L2_415, L3_416, L4_417, L5_418, L6_419, L7_420, L8_421, L9_422, L10_423, L11_424, L12_425
  L0_413 = "SELECT *, _ROWID_ AS _ROWID_ FROM "
  L1_414 = _UPVALUE0_
  L5_418 = ENABLE
  L6_419 = "'"
  L0_413 = L0_413 .. L1_414 .. L2_415 .. L3_416 .. L4_417 .. L5_418 .. L6_419
  L1_414 = db
  L1_414 = L1_414.getTable
  L1_414 = L1_414(L2_415, L3_416, L4_417)
  if L1_414 == L2_415 then
    return L2_415
  end
  for L5_418, L6_419 in L2_415(L3_416) do
    L7_420 = util
    L7_420 = L7_420.split
    L7_420 = L7_420(L8_421, L9_422)
    for L11_424, L12_425 in L8_421(L9_422) do
      if db.existsRow(billingTable, attribute.profileId, L12_425) then
        return _UPVALUE1_.SUCCESS, true
      end
    end
  end
  return L2_415, L3_416
end
