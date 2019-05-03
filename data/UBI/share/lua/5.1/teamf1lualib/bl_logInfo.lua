local L0_0
L0_0 = module
L0_0("com.teamf1.bl.view.logging", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/logging_view")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/remoteLogs_bl")
L0_0 = require
L0_0("teamf1lualib/smtpClient_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.logging.view")
function logEncInfoGet()
  local L0_1, L1_2, L2_3
  L2_3 = {}
  L0_1, L1_2, category, L2_3 = _UPVALUE0_.logEncValuesGet()
  if L2_3 == nil then
    L2_3 = {}
  end
  return _UPVALUE1_.SUCCESS, L0_1, L1_2, category, L2_3
end
function logEncInfoSaveToFile()
  local L0_4
  L0_4 = _UPVALUE0_
  L0_4 = L0_4.FAILURE
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for logInfo page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L0_4 = _UPVALUE1_.logEncValuesSaveToFile()
  return L0_4
end
function logEncLogDelete(A0_5)
  local L1_6
  L1_6 = _UPVALUE0_
  L1_6 = L1_6.BAD_PARAMETER
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for logInfo page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_6 = _UPVALUE1_.logEncLogValuesDelete(A0_5)
  return L1_6
end
function logEncLogDeleteAll()
  local L0_7
  L0_7 = _UPVALUE0_
  L0_7 = L0_7.BAD_PARAMETER
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for logInfo page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L0_7 = _UPVALUE1_.logEncLogValuesDeleteAll()
  return L0_7
end
function logEncLogSend(A0_8)
  local L1_9, L2_10, L3_11, L4_12, L5_13
  L1_9 = _UPVALUE0_
  L1_9 = L1_9.BAD_PARAMETER
  L2_10, L3_11, L4_12, L5_13 = nil, nil, nil, nil
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for logInfo page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_8 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L2_10, L3_11, L4_12, L5_13 = _UPVALUE1_.remoteLoggingGet()
  if L2_10 == _UPVALUE0_.NIL then
    return L2_10
  end
  if L5_13 ~= _UPVALUE2_ then
    return _UPVALUE3_.EMAIL_LOGS_INACTIVE
  end
  L1_9 = _UPVALUE4_.logEncLogValuesSend(A0_8)
  if L1_9 == _UPVALUE0_.SUCCESS then
    L1_9 = _UPVALUE4_.logEncLogValuesDelete(A0_8)
    if L1_9 ~= _UPVALUE0_.SUCCESS then
      return _UPVALUE3_.LOGGING_EMAIL_PASSED_CLEAR_FAILED
    else
      return _UPVALUE3_.LOGGING_EMAIL_PASSED
    end
  else
    return _UPVALUE3_.LOGGING_EMAIL_FAILED
  end
end
function logEncLogSendAll()
  local L0_14, L1_15, L2_16, L3_17, L4_18
  L0_14 = _UPVALUE0_
  L0_14 = L0_14.BAD_PARAMETER
  L1_15, L2_16, L3_17, L4_18 = nil, nil, nil, nil
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for logInfo page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_15, L2_16, L3_17, L4_18 = _UPVALUE1_.remoteLoggingGet()
  if L1_15 == _UPVALUE0_.NIL then
    return L1_15
  end
  if L4_18 ~= _UPVALUE2_ then
    return _UPVALUE3_.EMAIL_LOGS_INACTIVE
  end
  L0_14 = _UPVALUE4_.logEncLogValuesSend(-1)
  if L0_14 == _UPVALUE0_.SUCCESS then
    L0_14 = _UPVALUE4_.logEncLogValuesDeleteAll()
    if L0_14 ~= _UPVALUE0_.SUCCESS then
      return _UPVALUE3_.LOGGING_EMAIL_PASSED_CLEAR_FAILED
    else
      return _UPVALUE3_.LOGGING_EMAIL_PASSED
    end
  else
    return _UPVALUE3_.LOGGING_EMAIL_FAILED
  end
end
function logEncInfoSet(A0_19)
  local L1_20, L2_21, L3_22, L4_23
  L1_20 = _UPVALUE0_
  L1_20 = L1_20.BAD_PARAMETER
  L2_21 = _UPVALUE0_
  L2_21 = L2_21.NIL
  L3_22 = _UPVALUE0_
  L3_22 = L3_22.NIL
  L4_23 = _UPVALUE0_
  L4_23 = L4_23.NIL
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for logInfo page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L2_21 = A0_19["logInfo.facility"]
  L4_23 = A0_19["logInfo.severity"]
  L3_22 = A0_19["logInfo.category"]
  if L2_21 == _UPVALUE0_.NIL or L4_23 == _UPVALUE0_.NIL or L3_22 == _UPVALUE0_.NIL then
    return L1_20
  end
  L1_20 = _UPVALUE1_.logEncValuesSet(L2_21, L4_23, L3_22)
  return L1_20
end
function logInfoGet()
  local L0_24, L1_25
  L0_24 = {}
  L1_25 = "syslog"
  returnCode, L0_24 = _UPVALUE0_.logTypeGet(L1_25)
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, L0_24
end
function logInfoClear()
  local L0_26, L1_27
  L0_26 = {}
  L1_27 = "syslog"
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for logInfo page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  returnCode, L0_26 = _UPVALUE1_.logDelete(L1_27)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    return returnCode
  end
  return returnCode, L0_26
end
function logInfoSend()
  local L0_28, L1_29, L2_30, L3_31, L4_32, L5_33
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for logInfo page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_29, L2_30, L3_31, L4_32 = _UPVALUE1_.remoteLoggingGet()
  if L1_29 == _UPVALUE0_.NIL then
    return L1_29
  end
  if L4_32 ~= _UPVALUE2_ then
    return _UPVALUE3_.EMAIL_LOGS_INACTIVE
  end
  L0_28 = db.getAttribute(_UPVALUE4_, _UPVALUE5_, _UPVALUE6_, _UPVALUE7_)
  if L0_28 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L0_28 = L0_28 .. " " .. DB_FILE_NAME
  L5_33 = os.execute(L0_28)
  if L5_33 == _UPVALUE0_.SUCCESS then
    L1_29 = logInfoClear()
    if L1_29 == SUCCESS then
      return _UPVALUE3_.LOGGING_EMAIL_PASSED_CLEAR_FAILED
    else
      return _UPVALUE3_.LOGGING_EMAIL_PASSED
    end
  else
    return _UPVALUE3_.LOGGING_EMAIL_FAILED
  end
end
