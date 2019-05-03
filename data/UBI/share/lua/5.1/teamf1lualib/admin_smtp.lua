local L0_0
L0_0 = module
L0_0("com.teamf1.core.admin.smtp", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/smtpClient_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
ENABLE = "1"
DISABLE = "0"
AUTH_TYPE1 = "-1"
AUTH_TYPE2 = "0"
AUTH_TYPE3 = "1"
UNIT1 = "0"
UNIT2 = "1"
UNIT3 = "2"
UNIT4 = "3"
;({}).key = "_ROWID_"
;({}).keyvalue = "1"
;({}).keyvalue2 = "4"
;({}).logId = "logId"
;({}).emailLog = "mailLogs"
;({}).emailServer = "emailServer"
;({}).smtpPort = "smtpPort"
;({}).fromAddress = "fromAddr"
;({}).toAddress = "toAddr"
;({}).toAddress2 = "toAddr2"
;({}).toAddress3 = "toAddr3"
;({}).auth = "auth"
;({}).userName = "userName"
;({}).passWord = "passWord"
;({}).respondIdentd = "respondIdentd"
;({}).unit = "unit"
;({}).day = "dayOfWeek"
;({}).time = "time"
;({}).hour = "hour"
;({}).minute = "minute"
;({}).command = "command"
;({}).interval = "interval"
;({}).dayOfMonth = "dayOfMonth"
;({}).month = "month"
;({}).tlsSupport = "tlsSupport"
function logIdGet()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyvalue, _UPVALUE1_.logId)
  if L0_1 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_1
end
function logIdGetNext(A0_2)
  return _UPVALUE0_.NOT_SUPPORTED
end
function logIdSet(A0_3, A1_4)
  if A1_4 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.keyvalue, _UPVALUE2_.logId, A1_4) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_3
  end
  return _UPVALUE0_.SUCCESS, A0_3
end
function isEmailLogEnabled()
  local L0_5
  L0_5 = db
  L0_5 = L0_5.getAttribute
  L0_5 = L0_5(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyvalue, _UPVALUE1_.emailLog)
  if L0_5 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_5
end
function isemailLogEnabledNext(A0_6)
  local L2_7, L3_8
  L2_7 = _UPVALUE0_
  L2_7 = L2_7.NOT_SUPPORTED
  L3_8 = rowId
  return L2_7, L3_8, emailLog
end
function emailLogEnable(A0_9)
  if db.setAttribute(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyvalue, _UPVALUE1_.emailLog, ENABLE) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_9
  end
  return _UPVALUE2_.SUCCESS, A0_9
end
function emailLogDisable(A0_10)
  if db.setAttribute(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyvalue, _UPVALUE1_.emailLog, DISABLE) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_10
  end
  return _UPVALUE2_.SUCCESS, A0_10
end
function emailServerGet()
  local L0_11
  L0_11 = db
  L0_11 = L0_11.getAttribute
  L0_11 = L0_11(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyvalue, _UPVALUE1_.emailServer)
  if L0_11 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_11
end
function emailServerGetNext(A0_12)
  return _UPVALUE0_.SUCCESS
end
function emailServerSet(A0_13, A1_14)
  local L2_15, L3_16, L4_17, L5_18
  if A1_14 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_15, L3_16, L4_17 = isEmailLogEnabled()
  if L4_17 == ENABLE then
    L5_18 = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.keyvalue, _UPVALUE2_.emailServer, A1_14)
  else
    return _UPVALUE0_.FAILURE
  end
  if L5_18 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_13
  end
  return _UPVALUE0_.SUCCESS, A0_13
end
function smtpPortGet()
  local L0_19
  L0_19 = db
  L0_19 = L0_19.getAttribute
  L0_19 = L0_19(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyvalue, _UPVALUE1_.smtpPort)
  if L0_19 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_19
end
function smtpPortGetNext(A0_20)
  return _UPVALUE0_.NOT_SUPPORTED
end
function smtpPortSet(A0_21, A1_22)
  local L2_23, L3_24, L4_25, L5_26, L6_27
  L6_27 = _UPVALUE0_
  L6_27 = L6_27.NIL
  if A1_22 == L6_27 then
    L6_27 = _UPVALUE0_
    L6_27 = L6_27.INVALID_ARGUMENT
    return L6_27
  end
  L6_27 = tonumber
  L6_27 = L6_27(A1_22)
  if L6_27 < 1 or L6_27 > 65536 then
    return _UPVALUE1_.SMTP_PORT_INVALID
  end
  L3_24, L2_23, L4_25 = isEmailLogEnabled()
  if L4_25 == ENABLE then
    L5_26 = db.setAttribute(_UPVALUE2_, _UPVALUE3_.key, _UPVALUE3_.keyvalue, _UPVALUE3_.smtpPort, L6_27)
  else
    return _UPVALUE0_.FAILURE
  end
  if L5_26 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_21
  end
  return _UPVALUE0_.SUCCESS, A0_21
end
function fromAddressGet()
  local L0_28
  L0_28 = db
  L0_28 = L0_28.getAttribute
  L0_28 = L0_28(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyvalue, _UPVALUE1_.fromAddress)
  if L0_28 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_28
end
function fromAddressGetNext(A0_29)
  return _UPVALUE0_.NOT_SUPPORTED
end
function fromAddressSet(A0_30, A1_31)
  local L2_32, L3_33, L4_34, L5_35
  if A1_31 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L3_33, L2_32, L4_34 = isEmailLogEnabled()
  if L4_34 == ENABLE then
    L5_35 = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.keyvalue, _UPVALUE2_.fromAddress, A1_31)
  else
    return _UPVALUE0_.FAILURE
  end
  if L5_35 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_30
  end
  return _UPVALUE0_.SUCCESS, A0_30
end
function toAddressGet()
  local L0_36
  L0_36 = db
  L0_36 = L0_36.getAttribute
  L0_36 = L0_36(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyvalue, _UPVALUE1_.toAddress)
  if L0_36 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_36
end
function toAddressGetNext(A0_37)
  local L2_38, L3_39
  L2_38 = _UPVALUE0_
  L2_38 = L2_38.NOT_SUPPORTED
  L3_39 = rowId
  return L2_38, L3_39, toAddress
end
function toAddressSet(A0_40, A1_41)
  local L2_42, L3_43, L4_44, L5_45
  if A1_41 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L3_43, L2_42, L4_44 = isEmailLogEnabled()
  if L4_44 == ENABLE then
    L5_45 = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.keyvalue, _UPVALUE2_.toAddress, A1_41)
  else
    return _UPVALUE0_.FAILURE
  end
  if L5_45 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_40
  end
  return _UPVALUE0_.SUCCESS, A0_40
end
function toAddress2Get()
  local L0_46
  L0_46 = db
  L0_46 = L0_46.getAttribute
  L0_46 = L0_46(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyvalue, _UPVALUE1_.toAddress2)
  if L0_46 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_46
end
function toAddress2GetNext(A0_47)
  local L2_48, L3_49
  L2_48 = _UPVALUE0_
  L2_48 = L2_48.NOT_SUPPORTED
  L3_49 = rowId
  return L2_48, L3_49, toAddress2
end
function toAddress2Set(A0_50, A1_51)
  local L2_52, L3_53, L4_54, L5_55
  if A1_51 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L3_53, L2_52, L4_54 = isEmailLogEnabled()
  if L4_54 == ENABLE then
    L5_55 = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.keyvalue, _UPVALUE2_.toAddress2, A1_51)
  else
    return _UPVALUE0_.FAILURE
  end
  if L5_55 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_50
  end
  return _UPVALUE0_.SUCCESS, A0_50
end
function toAddress3Get()
  local L0_56
  L0_56 = db
  L0_56 = L0_56.getAttribute
  L0_56 = L0_56(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyvalue, _UPVALUE1_.toAddress3)
  if L0_56 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_56
end
function toAddress3GetNext(A0_57)
  local L2_58, L3_59
  L2_58 = _UPVALUE0_
  L2_58 = L2_58.NOT_SUPPORTED
  L3_59 = rowId
  return L2_58, L3_59, toAddress3
end
function toAddress3Set(A0_60, A1_61)
  local L2_62, L3_63, L4_64, L5_65
  if A1_61 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L3_63, L2_62, L4_64 = isEmailLogEnabled()
  if L4_64 == ENABLE then
    L5_65 = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.keyvalue, _UPVALUE2_.toAddress3, A1_61)
  else
    return _UPVALUE0_.FAILURE
  end
  if L5_65 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_60
  end
  return _UPVALUE0_.SUCCESS, A0_60
end
function authGet()
  local L0_66
  L0_66 = db
  L0_66 = L0_66.getAttribute
  L0_66 = L0_66(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyvalue, _UPVALUE1_.auth)
  if L0_66 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_66
end
function authGetNext(A0_67)
  local L2_68, L3_69
  L2_68 = _UPVALUE0_
  L2_68 = L2_68.NOT_SUPPORTED
  L3_69 = rowId
  return L2_68, L3_69, auth
end
function authSet(A0_70, A1_71)
  local L2_72, L3_73, L4_74, L5_75
  if A1_71 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_71 ~= AUTH_TYPE1 and A1_71 ~= AUTH_TYPE2 and A1_71 ~= AUTH_TYPE3 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L3_73, L2_72, L4_74 = isEmailLogEnabled()
  if L4_74 == ENABLE then
    L5_75 = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.keyvalue, _UPVALUE2_.auth, A1_71)
  else
    return _UPVALUE0_.FAILURE
  end
  if L5_75 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_70
  end
  return _UPVALUE0_.SUCCESS, A0_70
end
function userNameGet()
  local L0_76
  L0_76 = db
  L0_76 = L0_76.getAttribute
  L0_76 = L0_76(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyvalue, _UPVALUE1_.userName)
  if L0_76 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_76
end
function userNameGetNext(A0_77)
  local L2_78, L3_79
  L2_78 = _UPVALUE0_
  L2_78 = L2_78.NOT_SUPPORTED
  L3_79 = rowId
  return L2_78, L3_79, userName
end
function userNameSet(A0_80, A1_81)
  local L2_82, L3_83, L4_84, L5_85, L6_86
  if A1_81 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L3_83, L2_82, L6_86 = isEmailLogEnabled()
  if L6_86 == ENABLE then
    L3_83, L2_82, L4_84 = authGet()
    if L4_84 == AUTH_TYPE2 or L4_84 == AUTH_TYPE3 then
      L5_85 = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.keyvalue, _UPVALUE2_.userName, A1_81)
    else
      return _UPVALUE0_.FAILURE
    end
  else
    return _UPVALUE0_.FAILURE
  end
  if L5_85 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_80
  end
  return _UPVALUE0_.SUCCESS, A0_80
end
function passWordGet()
  local L0_87
  L0_87 = db
  L0_87 = L0_87.getAttribute
  L0_87 = L0_87(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyvalue, _UPVALUE1_.passWord)
  if L0_87 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_87
end
function passWordGetNext(A0_88)
  local L2_89, L3_90
  L2_89 = _UPVALUE0_
  L2_89 = L2_89.NOT_SUPPORTED
  L3_90 = rowId
  return L2_89, L3_90, passWord
end
function passWordSet(A0_91, A1_92)
  local L2_93, L3_94, L4_95, L5_96, L6_97
  if A1_92 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L3_94, L2_93, L6_97 = isEmailLogEnabled()
  if L6_97 == ENABLE then
    L3_94, L2_93, L4_95 = authGet()
    if L4_95 == AUTH_TYPE2 or L4_95 == AUTH_TYPE3 then
      L5_96 = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.keyvalue, _UPVALUE2_.passWord, A1_92)
    else
      return _UPVALUE0_.FAILURE
    end
  else
    return _UPVALUE0_.FAILURE
  end
  if L5_96 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_91
  end
  return _UPVALUE0_.SUCCESS, A0_91
end
function isRespondIdentdEnabled()
  local L0_98
  L0_98 = db
  L0_98 = L0_98.getAttribute
  L0_98 = L0_98(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyvalue, _UPVALUE1_.respondIdentd)
  if L0_98 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_98
end
function isrespondIdentdEnabledNext(A0_99)
  local L2_100, L3_101
  L2_100 = _UPVALUE0_
  L2_100 = L2_100.NOT_SUPPORTED
  L3_101 = rowId
  return L2_100, L3_101, respondIdentd
end
function respondIdentdEnable(A0_102)
  local L1_103, L2_104, L3_105, L4_106
  L2_104, L1_103, L3_105 = isEmailLogEnabled()
  if L3_105 == ENABLE then
    L4_106 = db.setAttribute(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyvalue, _UPVALUE1_.respondIdentd, ENABLE)
  else
    return _UPVALUE2_.FAILURE
  end
  if L4_106 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_102
  end
  return _UPVALUE2_.SUCCESS, A0_102
end
function respondIdentdDisable(A0_107)
  local L1_108, L2_109, L3_110, L4_111
  L2_109, L1_108, L3_110 = isEmailLogEnabled()
  if L3_110 == ENABLE then
    L4_111 = db.setAttribute(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyvalue, _UPVALUE1_.respondIdentd, DISABLE)
  else
    return _UPVALUE2_.FAILURE
  end
  if L4_111 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_107
  end
  return _UPVALUE2_.SUCCESS, A0_107
end
function unitGet()
  local L0_112
  L0_112 = db
  L0_112 = L0_112.getAttribute
  L0_112 = L0_112(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyvalue2, _UPVALUE1_.unit)
  if L0_112 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_112
end
function unitGetNext(A0_113)
  local L2_114, L3_115
  L2_114 = _UPVALUE0_
  L2_114 = L2_114.NOT_SUPPORTED
  L3_115 = rowId
  return L2_114, L3_115, unit
end
function unitSet(A0_116, A1_117)
  local L2_118, L3_119, L4_120, L5_121
  if A1_117 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_117 ~= UNIT1 and A1_117 ~= UNIT2 and A1_117 ~= UNIT3 and A1_117 ~= UNIT4 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L3_119, L2_118, L4_120 = isEmailLogEnabled()
  if L4_120 == ENABLE then
    L5_121 = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.keyvalue2, _UPVALUE2_.unit, A1_117)
  else
    return _UPVALUE0_.FAILURE
  end
  if L5_121 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_116
  end
  return _UPVALUE0_.SUCCESS, A0_116
end
function dayGet()
  local L0_122
  L0_122 = db
  L0_122 = L0_122.getAttribute
  L0_122 = L0_122(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyvalue2, _UPVALUE1_.day)
  if L0_122 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_122
end
function dayGetNext(A0_123)
  local L2_124, L3_125
  L2_124 = _UPVALUE0_
  L2_124 = L2_124.NOT_SUPPORTED
  L3_125 = rowId
  return L2_124, L3_125, day
end
function daySet(A0_126, A1_127)
  local L2_128, L3_129, L4_130, L5_131, L6_132
  if A1_127 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L3_129, L2_128, L4_130 = isEmailLogEnabled()
  if L4_130 == ENABLE then
    L3_129, L2_128, L6_132 = unitGet()
    if L6_132 == UNIT3 then
      L5_131 = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.keyvalue2, _UPVALUE2_.day, A1_127)
    else
      return _UPVALUE0_.FAILURE
    end
  else
    return _UPVALUE0_.FAILURE
  end
  if L5_131 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_126
  end
  return _UPVALUE0_.SUCCESS, A0_126
end
function timeGet()
  local L0_133
  L0_133 = db
  L0_133 = L0_133.getAttribute
  L0_133 = L0_133(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyvalue2, _UPVALUE1_.time)
  if L0_133 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_133
end
function timeGetNext(A0_134)
  local L2_135, L3_136
  L2_135 = _UPVALUE0_
  L2_135 = L2_135.NOT_SUPPORTED
  L3_136 = rowId
  return L2_135, L3_136, time
end
function timeSet(A0_137, A1_138)
  local L2_139, L3_140, L4_141, L5_142, L6_143
  if A1_138 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L3_140, L2_139, L4_141 = isEmailLogEnabled()
  if L4_141 == ENABLE then
    L3_140, L2_139, L6_143 = unitGet()
    if L6_143 == UNIT3 or L6_143 == UNIT2 then
      L5_142 = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.keyvalue2, _UPVALUE2_.time, A1_138)
    else
      return _UPVALUE0_.FAILURE
    end
  else
    return _UPVALUE0_.FAILURE
  end
  if L5_142 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_137
  end
  return _UPVALUE0_.SUCCESS, A0_137
end
function smtpGet()
  local L0_144, L1_145, L2_146, L3_147, L4_148, L5_149, L6_150
  L3_147 = {}
  L4_148 = {}
  L5_149 = {}
  L6_150 = nil
  if db.getRow("emailLogs", "_ROWID_", "1") == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  logId = db.getRow("emailLogs", "_ROWID_", "1")["emailLogs.logId"]
  emailLog = db.getRow("emailLogs", "_ROWID_", "1")["emailLogs.mailLogs"]
  if logId == _UPVALUE0_.NIL or emailLog == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  if db.getRow(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.keyvalue) == _UPVALUE0_.NIL then
    if emailLog == "0" then
      return _UPVALUE0_.SUCCESS, 1, logId, emailLog
    else
      return _UPVALUE0_.FAILURE
    end
  end
  L6_150 = db.getAttribute(_UPVALUE3_, _UPVALUE4_, _UPVALUE5_, _UPVALUE6_)
  if L6_150 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L6_150 = L6_150 .. " " .. DB_FILE_NAME .. " " .. "all"
  emailServer = db.getRow(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.keyvalue)[_UPVALUE1_ .. "." .. _UPVALUE2_.emailServer]
  smtpPort = db.getRow(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.keyvalue)[_UPVALUE1_ .. "." .. _UPVALUE2_.smtpPort]
  fromAddress = db.getRow(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.keyvalue)[_UPVALUE1_ .. "." .. _UPVALUE2_.fromAddress]
  toAddress = db.getRow(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.keyvalue)[_UPVALUE1_ .. "." .. _UPVALUE2_.toAddress]
  toAddress2 = db.getRow(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.keyvalue)[_UPVALUE1_ .. "." .. _UPVALUE2_.toAddress2]
  toAddress3 = db.getRow(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.keyvalue)[_UPVALUE1_ .. "." .. _UPVALUE2_.toAddress3]
  auth = db.getRow(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.keyvalue)[_UPVALUE1_ .. "." .. _UPVALUE2_.auth]
  userName = db.getRow(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.keyvalue)[_UPVALUE1_ .. "." .. _UPVALUE2_.userName]
  passWord = db.getRow(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.keyvalue)[_UPVALUE1_ .. "." .. _UPVALUE2_.passWord]
  respondIdentd = db.getRow(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.keyvalue)[_UPVALUE1_ .. "." .. _UPVALUE2_.respondIdentd]
  tlsSupport = db.getRow(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.keyvalue)[_UPVALUE1_ .. "." .. _UPVALUE2_.tlsSupport]
  if db.getRow(_UPVALUE7_, _UPVALUE2_.command, L6_150) ~= _UPVALUE0_.NIL then
    unit = db.getRow(_UPVALUE7_, _UPVALUE2_.command, L6_150)[_UPVALUE7_ .. "." .. _UPVALUE2_.unit]
    day = db.getRow(_UPVALUE7_, _UPVALUE2_.command, L6_150)[_UPVALUE7_ .. "." .. _UPVALUE2_.day]
    hour = db.getRow(_UPVALUE7_, _UPVALUE2_.command, L6_150)[_UPVALUE7_ .. "." .. _UPVALUE2_.hour]
    minute = db.getRow(_UPVALUE7_, _UPVALUE2_.command, L6_150)[_UPVALUE7_ .. "." .. _UPVALUE2_.minute]
    if tonumber(hour) ~= -1 then
      if tonumber(hour) >= 12 then
        hour = tonumber(hour) - 12
        ampm = " PM"
      else
        ampm = " AM"
      end
      if tonumber(hour) < 10 then
        custHour = "0" .. hour
      else
        custHour = hour
      end
      if tonumber(minute) < 10 then
        custMin = "0" .. minute
      else
        custMin = minute
      end
      time = custHour .. ":" .. custMin .. ampm
    end
  else
    unit = "0"
  end
  if emailServer == _UPVALUE0_.NIL or smtpPort == _UPVALUE0_.NIL or fromAddress == _UPVALUE0_.NIL or toAddress == _UPVALUE0_.NIL or toAddress2 == _UPVALUE0_.NIL or auth == _UPVALUE0_.NIL or respondIdentd == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, logId, emailLog, emailServer, smtpPort, fromAddress, toAddress, toAddress2, toAddress3, auth, userName, passWord, respondIdentd, unit, day, time, tlsSupport
end
function smtpGetNext(A0_151)
  local L2_152, L3_153
  L2_152 = _UPVALUE0_
  L2_152 = L2_152.NOT_SUPPORTED
  L3_153 = rowId
  return L2_152, L3_153, smtp
end
function smtpSet(A0_154, A1_155, A2_156, A3_157, A4_158, A5_159, A6_160, A7_161, A8_162, A9_163, A10_164, A11_165, A12_166, A13_167, A14_168, A15_169, A16_170)
  local L17_171, L18_172, L19_173, L20_174, L21_175, L22_176, L23_177, L24_178
  L19_173 = _UPVALUE0_
  L19_173 = L19_173.NIL
  if A1_155 == L19_173 then
    L19_173 = _UPVALUE0_
    L19_173 = L19_173.INVALID_ARGUMENT
    return L19_173
  end
  L19_173 = _UPVALUE0_
  L19_173 = L19_173.NIL
  if A2_156 == L19_173 then
    L19_173 = _UPVALUE0_
    L19_173 = L19_173.INVALID_ARGUMENT
    return L19_173
  end
  L19_173 = _UPVALUE1_
  L19_173 = L19_173.isBoolean
  L20_174 = A2_156
  L19_173 = L19_173(L20_174)
  L17_171 = L19_173
  L19_173 = _UPVALUE0_
  L19_173 = L19_173.SUCCESS
  if L17_171 ~= L19_173 then
    L19_173 = _UPVALUE0_
    L19_173 = L19_173.INVALID_ARGUMENT
    return L19_173
  end
  L19_173 = ENABLE
  if A2_156 == L19_173 then
    L19_173 = _UPVALUE0_
    L19_173 = L19_173.NIL
    if A3_157 == L19_173 then
      L19_173 = _UPVALUE0_
      L19_173 = L19_173.INVALID_ARGUMENT
      return L19_173
    end
    L19_173 = _UPVALUE0_
    L19_173 = L19_173.NIL
    if A4_158 == L19_173 then
      L19_173 = _UPVALUE0_
      L19_173 = L19_173.INVALID_ARGUMENT
      return L19_173
    end
    L19_173 = tonumber
    L20_174 = A4_158
    L19_173 = L19_173(L20_174)
    if L19_173 < 1 or L19_173 > 65536 then
      L20_174 = _UPVALUE2_
      L20_174 = L20_174.SMTP_PORT_INVALID
      return L20_174
    end
    L20_174 = _UPVALUE0_
    L20_174 = L20_174.NIL
    if A5_159 == L20_174 then
      L20_174 = _UPVALUE0_
      L20_174 = L20_174.INVALID_ARGUMENT
      return L20_174
    end
    L20_174 = _UPVALUE0_
    L20_174 = L20_174.NIL
    if A6_160 == L20_174 then
      L20_174 = _UPVALUE0_
      L20_174 = L20_174.INVALID_ARGUMENT
      return L20_174
    end
    L20_174 = _UPVALUE0_
    L20_174 = L20_174.NIL
    if A7_161 == L20_174 then
      L20_174 = _UPVALUE0_
      L20_174 = L20_174.INVALID_ARGUMENT
      return L20_174
    end
    L20_174 = _UPVALUE0_
    L20_174 = L20_174.NIL
    if A8_162 == L20_174 then
      L20_174 = _UPVALUE0_
      L20_174 = L20_174.INVALID_ARGUMENT
      return L20_174
    end
    L20_174 = _UPVALUE0_
    L20_174 = L20_174.NIL
    if A9_163 == L20_174 then
      L20_174 = _UPVALUE0_
      L20_174 = L20_174.INVALID_ARGUMENT
      return L20_174
    end
    L20_174 = AUTH_TYPE1
    if A9_163 ~= L20_174 then
      L20_174 = AUTH_TYPE2
      if A9_163 ~= L20_174 then
        L20_174 = AUTH_TYPE3
        if A9_163 ~= L20_174 then
          L20_174 = _UPVALUE0_
          L20_174 = L20_174.INVALID_ARGUMENT
          return L20_174
        end
      end
    end
    L20_174 = AUTH_TYPE1
    if A9_163 ~= L20_174 then
      L20_174 = _UPVALUE0_
      L20_174 = L20_174.NIL
      if A10_164 == L20_174 then
        L20_174 = _UPVALUE0_
        L20_174 = L20_174.INVALID_ARGUMENT
        return L20_174
      end
      L20_174 = _UPVALUE0_
      L20_174 = L20_174.NIL
      if A11_165 == L20_174 then
        L20_174 = _UPVALUE0_
        L20_174 = L20_174.INVALID_ARGUMENT
        return L20_174
      end
    end
    L20_174 = _UPVALUE0_
    L20_174 = L20_174.NIL
    if A12_166 == L20_174 then
      L20_174 = _UPVALUE0_
      L20_174 = L20_174.INVALID_ARGUMENT
      return L20_174
    end
    L20_174 = _UPVALUE1_
    L20_174 = L20_174.isBoolean
    L21_175 = A12_166
    L20_174 = L20_174(L21_175)
    L17_171 = L20_174
    L20_174 = _UPVALUE0_
    L20_174 = L20_174.SUCCESS
    if L17_171 ~= L20_174 then
      L20_174 = _UPVALUE0_
      L20_174 = L20_174.INVALID_ARGUMENT
      return L20_174
    end
    L20_174 = _UPVALUE0_
    L20_174 = L20_174.NIL
    if A13_167 == L20_174 then
      L20_174 = _UPVALUE0_
      L20_174 = L20_174.INVALID_ARGUMENT
      return L20_174
    end
    L20_174 = UNIT1
    if A13_167 ~= L20_174 then
      L20_174 = UNIT2
      if A13_167 ~= L20_174 then
        L20_174 = UNIT3
        if A13_167 ~= L20_174 then
          L20_174 = UNIT4
          if A13_167 ~= L20_174 then
            L20_174 = _UPVALUE0_
            L20_174 = L20_174.INVALID_ARGUMENT
            return L20_174
          end
        end
      end
    end
    L20_174 = UNIT4
    if A13_167 == L20_174 then
      L20_174 = _UPVALUE0_
      L20_174 = L20_174.NIL
      if A14_168 == L20_174 then
        L20_174 = _UPVALUE0_
        L20_174 = L20_174.INVALID_ARGUMENT
        return L20_174
      end
    end
    if A15_169 ~= nil and A15_169 ~= "" then
      L20_174 = util
      L20_174 = L20_174.split
      L21_175 = A15_169
      L22_176 = " "
      L20_174 = L20_174(L21_175, L22_176)
      customtime = L20_174
      L20_174 = util
      L20_174 = L20_174.split
      L21_175 = customtime
      L21_175 = L21_175[1]
      L22_176 = ":"
      L20_174 = L20_174(L21_175, L22_176)
      customHrMin = L20_174
      L20_174 = customtime
      L20_174 = L20_174[2]
      if L20_174 == "AM" then
        L20_174 = tonumber
        L21_175 = customHrMin
        L21_175 = L21_175[1]
        L20_174 = L20_174(L21_175)
        customhour = L20_174
      else
        L20_174 = customtime
        L20_174 = L20_174[2]
        if L20_174 == "PM" then
          L20_174 = tonumber
          L21_175 = customHrMin
          L21_175 = L21_175[1]
          L20_174 = L20_174(L21_175)
          L20_174 = L20_174 + 12
          customhour = L20_174
        end
      end
      L20_174 = tonumber
      L21_175 = customHrMin
      L21_175 = L21_175[2]
      L20_174 = L20_174(L21_175)
      customMin = L20_174
    end
  end
  L19_173 = {}
  L20_174 = {}
  L21_175 = {}
  L22_176 = _UPVALUE3_
  L23_177 = "."
  L24_178 = _UPVALUE4_
  L24_178 = L24_178.logId
  L22_176 = L22_176 .. L23_177 .. L24_178
  L20_174[L22_176] = A1_155
  L22_176 = _UPVALUE3_
  L23_177 = "."
  L24_178 = _UPVALUE4_
  L24_178 = L24_178.emailLog
  L22_176 = L22_176 .. L23_177 .. L24_178
  L20_174[L22_176] = A2_156
  L22_176 = _UPVALUE5_
  L23_177 = "."
  L24_178 = _UPVALUE4_
  L24_178 = L24_178.emailServer
  L22_176 = L22_176 .. L23_177 .. L24_178
  L19_173[L22_176] = A3_157
  L22_176 = _UPVALUE5_
  L23_177 = "."
  L24_178 = _UPVALUE4_
  L24_178 = L24_178.smtpPort
  L22_176 = L22_176 .. L23_177 .. L24_178
  L19_173[L22_176] = A4_158
  L22_176 = _UPVALUE5_
  L23_177 = "."
  L24_178 = _UPVALUE4_
  L24_178 = L24_178.fromAddress
  L22_176 = L22_176 .. L23_177 .. L24_178
  L19_173[L22_176] = A5_159
  L22_176 = _UPVALUE5_
  L23_177 = "."
  L24_178 = _UPVALUE4_
  L24_178 = L24_178.toAddress
  L22_176 = L22_176 .. L23_177 .. L24_178
  L19_173[L22_176] = A6_160
  L22_176 = _UPVALUE5_
  L23_177 = "."
  L24_178 = _UPVALUE4_
  L24_178 = L24_178.toAddress2
  L22_176 = L22_176 .. L23_177 .. L24_178
  L19_173[L22_176] = A7_161
  L22_176 = _UPVALUE5_
  L23_177 = "."
  L24_178 = _UPVALUE4_
  L24_178 = L24_178.toAddress3
  L22_176 = L22_176 .. L23_177 .. L24_178
  L19_173[L22_176] = A8_162
  L22_176 = _UPVALUE5_
  L23_177 = "."
  L24_178 = _UPVALUE4_
  L24_178 = L24_178.auth
  L22_176 = L22_176 .. L23_177 .. L24_178
  L19_173[L22_176] = A9_163
  L22_176 = AUTH_TYPE1
  if A9_163 ~= L22_176 then
    L22_176 = _UPVALUE5_
    L23_177 = "."
    L24_178 = _UPVALUE4_
    L24_178 = L24_178.userName
    L22_176 = L22_176 .. L23_177 .. L24_178
    L19_173[L22_176] = A10_164
    L22_176 = _UPVALUE5_
    L23_177 = "."
    L24_178 = _UPVALUE4_
    L24_178 = L24_178.passWord
    L22_176 = L22_176 .. L23_177 .. L24_178
    L19_173[L22_176] = A11_165
  end
  L22_176 = _UPVALUE5_
  L23_177 = "."
  L24_178 = _UPVALUE4_
  L24_178 = L24_178.tlsSupport
  L22_176 = L22_176 .. L23_177 .. L24_178
  L19_173[L22_176] = A16_170
  L22_176 = _UPVALUE5_
  L23_177 = "."
  L24_178 = _UPVALUE4_
  L24_178 = L24_178.respondIdentd
  L22_176 = L22_176 .. L23_177 .. L24_178
  L19_173[L22_176] = A12_166
  L22_176 = _UPVALUE6_
  L23_177 = "."
  L24_178 = _UPVALUE4_
  L24_178 = L24_178.unit
  L22_176 = L22_176 .. L23_177 .. L24_178
  L21_175[L22_176] = A13_167
  L22_176 = _UPVALUE6_
  L23_177 = "."
  L24_178 = _UPVALUE4_
  L24_178 = L24_178.hour
  L22_176 = L22_176 .. L23_177 .. L24_178
  L23_177 = customhour
  L21_175[L22_176] = L23_177
  L22_176 = _UPVALUE6_
  L23_177 = "."
  L24_178 = _UPVALUE4_
  L24_178 = L24_178.minute
  L22_176 = L22_176 .. L23_177 .. L24_178
  L23_177 = customMin
  L21_175[L22_176] = L23_177
  L22_176 = db
  L22_176 = L22_176.getAttribute
  L23_177 = _UPVALUE7_
  L24_178 = _UPVALUE8_
  L22_176 = L22_176(L23_177, L24_178, _UPVALUE9_, _UPVALUE10_)
  L18_172 = L22_176
  L22_176 = _UPVALUE0_
  L22_176 = L22_176.NIL
  if L18_172 == L22_176 then
    L22_176 = _UPVALUE0_
    L22_176 = L22_176.FAILURE
    return L22_176
  end
  L22_176 = L18_172
  L23_177 = " "
  L24_178 = DB_FILE_NAME
  L18_172 = L22_176 .. L23_177 .. L24_178 .. " " .. "all"
  L22_176 = UNIT1
  if A13_167 ~= L22_176 then
    L22_176 = ENABLE
  else
    if A2_156 ~= L22_176 then
      L22_176 = db
      L22_176 = L22_176.deleteRow
      L23_177 = _UPVALUE6_
      L24_178 = _UPVALUE4_
      L24_178 = L24_178.command
      L22_176 = L22_176(L23_177, L24_178, L18_172)
      L17_171 = L22_176
      L22_176 = _UPVALUE0_
      L22_176 = L22_176.FALSE
      if L17_171 == L22_176 then
        L22_176 = _UPVALUE0_
        L22_176 = L22_176.FAILURE
        return L22_176
      end
  end
  else
    L22_176 = db
    L22_176 = L22_176.deleteRow
    L23_177 = _UPVALUE6_
    L24_178 = _UPVALUE4_
    L24_178 = L24_178.command
    L22_176 = L22_176(L23_177, L24_178, L18_172)
    L17_171 = L22_176
    L22_176 = _UPVALUE0_
    L22_176 = L22_176.FALSE
    if L17_171 == L22_176 then
      L22_176 = _UPVALUE0_
      L22_176 = L22_176.FAILURE
      return L22_176
    end
    L22_176 = _UPVALUE6_
    L23_177 = "."
    L24_178 = _UPVALUE4_
    L24_178 = L24_178.month
    L22_176 = L22_176 .. L23_177 .. L24_178
    L21_175[L22_176] = -1
    L22_176 = _UPVALUE6_
    L23_177 = "."
    L24_178 = _UPVALUE4_
    L24_178 = L24_178.dayOfMonth
    L22_176 = L22_176 .. L23_177 .. L24_178
    L21_175[L22_176] = -1
    L22_176 = _UPVALUE6_
    L23_177 = "."
    L24_178 = _UPVALUE4_
    L24_178 = L24_178.command
    L22_176 = L22_176 .. L23_177 .. L24_178
    L21_175[L22_176] = L18_172
    L22_176 = UNIT2
    if A13_167 == L22_176 then
      L22_176 = _UPVALUE6_
      L23_177 = "."
      L24_178 = _UPVALUE4_
      L24_178 = L24_178.hour
      L22_176 = L22_176 .. L23_177 .. L24_178
      L21_175[L22_176] = -1
    end
    L22_176 = UNIT4
    if A13_167 == L22_176 then
      L22_176 = _UPVALUE6_
      L23_177 = "."
      L24_178 = _UPVALUE4_
      L24_178 = L24_178.day
      L22_176 = L22_176 .. L23_177 .. L24_178
      L21_175[L22_176] = A14_168
    end
    L22_176 = db
    L22_176 = L22_176.insert
    L23_177 = _UPVALUE6_
    L24_178 = L21_175
    L22_176 = L22_176(L23_177, L24_178)
    L17_171 = L22_176
  end
  L22_176 = _UPVALUE0_
  L22_176 = L22_176.FALSE
  if L17_171 == L22_176 then
    L22_176 = _UPVALUE0_
    L22_176 = L22_176.FAILURE
    return L22_176
  end
  L22_176 = db
  L22_176 = L22_176.update
  L23_177 = _UPVALUE3_
  L24_178 = L20_174
  L22_176 = L22_176(L23_177, L24_178, _UPVALUE4_.keyvalue)
  L23_177 = _UPVALUE0_
  L23_177 = L23_177.FALSE
  if L22_176 == L23_177 then
    L23_177 = _UPVALUE0_
    L23_177 = L23_177.FAILURE
    return L23_177
  end
  L23_177 = ENABLE
  if A2_156 == L23_177 then
    L23_177 = db
    L23_177 = L23_177.getAttribute
    L24_178 = "emailLogs"
    L23_177 = L23_177(L24_178, "_ROWID_", "1", "entryName")
    L19_173["smtpServer.entryName"] = L23_177
    L24_178 = db
    L24_178 = L24_178.getAttribute
    L24_178 = L24_178("environment", "name", "LOG_FILE", "value")
    L19_173["smtpServer.logFile"] = L24_178
    L24_178 = db
    L24_178 = L24_178.existsRow
    L24_178 = L24_178("smtpServer", "entryName", L23_177)
    if L24_178 then
      L24_178 = db
      L24_178 = L24_178.getAttribute
      L24_178 = L24_178("smtpServer", "entryName", L23_177, "_ROWID_")
      L17_171 = db.update("smtpServer", L19_173, L24_178)
    else
      L24_178 = db
      L24_178 = L24_178.insert
      L24_178 = L24_178("smtpServer", L19_173)
      L17_171 = L24_178
    end
    L24_178 = _UPVALUE0_
    L24_178 = L24_178.FALSE
    if L22_176 == L24_178 then
      L24_178 = _UPVALUE0_
      L24_178 = L24_178.FAILURE
      return L24_178
    end
  end
  L23_177 = _UPVALUE0_
  L23_177 = L23_177.SUCCESS
  L24_178 = 1
  return L23_177, L24_178
end
function smtpCreate(A0_179, A1_180, A2_181, A3_182, A4_183, A5_184, A6_185, A7_186, A8_187, A9_188, A10_189, A11_190, A12_191, A13_192, A14_193)
  local L16_194
  L16_194 = _UPVALUE0_
  L16_194 = L16_194.NOT_SUPPORTED
  return L16_194, rowid
end
function smtpDelete(A0_195)
  local L2_196
  L2_196 = _UPVALUE0_
  L2_196 = L2_196.NOT_SUPPORTED
  return L2_196, A0_195
end
