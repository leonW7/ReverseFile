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
L0_0 = L0_0("com.teamf1.bl.admin.smtp")
function ipsecVpnLogsGet()
  local L0_1, L1_2
  L1_2 = "ipsec"
  returnCode, L0_1 = _UPVALUE0_.logTypeGet(L1_2)
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, L0_1
end
function ipsecVpnLogsSend()
  local L0_3, L1_4, L2_5, L3_6, L4_7, L5_8
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for logInfo page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_4, L2_5, L3_6, L4_7 = _UPVALUE1_.remoteLoggingGet()
  if L1_4 == _UPVALUE0_.NIL then
    return L1_4
  end
  if L4_7 ~= _UPVALUE2_ then
    return _UPVALUE3_.EMAIL_LOGS_INACTIVE
  end
  L0_3 = db.getAttribute(_UPVALUE4_, _UPVALUE5_, _UPVALUE6_, _UPVALUE7_)
  if L0_3 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L0_3 = L0_3 .. " " .. DB_FILE_NAME .. " " .. _UPVALUE8_
  L5_8 = os.execute(L0_3)
  if L5_8 == _UPVALUE0_.SUCCESS then
    L1_4 = ipsecVpnLogsClear()
    if L1_4 == SUCCESS then
      return _UPVALUE3_.LOGGING_EMAIL_PASSED_CLEAR_FAILED
    else
      return _UPVALUE3_.LOGGING_EMAIL_PASSED
    end
  else
    return _UPVALUE3_.LOGGING_EMAIL_FAILED
  end
end
function ipsecVpnLogsClear()
  local L0_9, L1_10
  L0_9 = {}
  L1_10 = "ipsec"
  returnCode, L0_9 = _UPVALUE0_.logDelete(L1_10)
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, L0_9
end
