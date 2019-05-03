local L0_0
L0_0 = module
L0_0("com.teamf1.bl.admin.smtp", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/admin_smtp")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
attribute = {}
attribute.key = "_ROWID_"
attribute.keyvalue = "1"
UNIT_1 = "1"
UNIT_2 = "2"
UNIT_3 = "3"
UNIT_4 = "4"
UNIT_0 = "0"
AUTH_1 = "1"
AUTH_2 = "2"
AUTH_3 = "3"
AUTH_0 = "0"
AUTH_NEG = "-1"
function remoteLoggingGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16
  returnCode, cookie, logname, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, passWord, L11_12, L12_13, L13_14, L14_15, L15_16 = _UPVALUE0_.smtpGet()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, cookie, logname, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, passWord, L11_12, L12_13, L13_14, L14_15, L15_16
end
function remoteLoggingSet(A0_17)
  local L1_18, L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26, L10_27, L11_28, L12_29, L13_30, L14_31, L15_32, L16_33, L17_34
  L1_18 = ACCESS_LEVEL
  if L1_18 ~= 0 then
    L1_18 = util
    L1_18 = L1_18.appendDebugOut
    L2_19 = "Detected unauthorized access for remoteLogging "
    L1_18(L2_19)
    L1_18 = _UPVALUE0_
    L1_18 = L1_18.UNAUTHORIZED
    return L1_18
  end
  L1_18, L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26, L10_27, L11_28, L12_29, L13_30, L14_31, L15_32, L16_33 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L17_34 = A0_17["remoteLogging.cookie"]
  L1_18 = A0_17["remoteLogging.logId"]
  L2_19 = A0_17["remoteLogging.emailLog"]
  L3_20 = A0_17["remoteLogging.emailServer"]
  L4_21 = A0_17["remoteLogging.smtpPort"]
  L5_22 = A0_17["remoteLogging.fromAddress"]
  L6_23 = A0_17["remoteLogging.toAddress"]
  L7_24 = A0_17["remoteLogging.toAddress2"]
  L8_25 = A0_17["remoteLogging.toAddress3"]
  L9_26 = A0_17["remoteLogging.auth"]
  L16_33 = A0_17["remoteLogging.tlsSupport"]
  if L9_26 ~= AUTH_1 then
    L10_27 = A0_17["remoteLogging.userName"]
    L11_28 = A0_17["remoteLogging.password"]
  end
  if L9_26 == AUTH_1 and L16_33 == "1" then
    L16_33 = "0"
  end
  L12_29 = A0_17["remoteLogging.respondIdentd"]
  L13_30 = A0_17["remoteLogging.unit"]
  L15_32 = A0_17["remoteLogging.time"]
  if L17_34 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L1_18 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid log Id")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L2_19 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid mail Logs parameter")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L2_19 == "1" then
    if L3_20 == _UPVALUE0_.NIL or L3_20 == "" then
      util.appendDebugOut("Set : Invalid email server")
      return _UPVALUE0_.INVALID_EMAIL
    end
    if string.len(L3_20) >= 49 then
      util.appendDebugOut("Set : Invalid email server length")
      return _UPVALUE0_.EMAIL_SERVER_NAME_LENGTH
    end
    if L4_21 == _UPVALUE0_.NIL then
      util.appendDebugOut("Set : Invalid smtp Port")
      return _UPVALUE0_.BAD_PARAMETER
    end
    if L5_22 == _UPVALUE0_.NIL then
      util.appendDebugOut("Set : Invalid from Address")
      return _UPVALUE0_.BAD_PARAMETER
    end
    if L6_23 == _UPVALUE0_.NIL then
      util.appendDebugOut("Set : Invalid to Address")
      return _UPVALUE0_.BAD_PARAMETER
    end
    if L7_24 == _UPVALUE0_.NIL then
      util.appendDebugOut("Set : Invalid to Address2")
      return _UPVALUE0_.BAD_PARAMETER
    end
    if L8_25 == _UPVALUE0_.NIL then
      util.appendDebugOut("Set : Invalid to Address3")
      return _UPVALUE0_.BAD_PARAMETER
    end
    if L9_26 == _UPVALUE0_.NIL then
      util.appendDebugOut("Set : Invalid auth")
      return _UPVALUE0_.BAD_PARAMETER
    end
    if L9_26 == AUTH_1 then
      L9_26 = AUTH_NEG
    elseif L9_26 == AUTH_2 then
      L9_26 = AUTH_0
    elseif L9_26 == AUTH_3 then
      L9_26 = AUTH_1
    end
    if L9_26 ~= AUTH_NEG then
      if L10_27 == _UPVALUE0_.NIL then
        util.appendDebugOut("Set : Invalid username")
        return _UPVALUE0_.BAD_PARAMETER
      end
      if L11_28 == _UPVALUE0_.NIL then
        util.appendDebugOut("Set : Invalid password")
        return _UPVALUE0_.BAD_PARAMETER
      end
    end
    if L12_29 == _UPVALUE0_.NIL then
      util.appendDebugOut("Set : Invalid respondIdentd parameter")
      return _UPVALUE0_.BAD_PARAMETER
    end
    if L13_30 == _UPVALUE0_.NIL then
      util.appendDebugOut("Set : Invalid unit of time")
      return _UPVALUE0_.BAD_PARAMETER
    end
    if L13_30 == UNIT_1 then
      L13_30 = UNIT_0
    elseif L13_30 == UNIT_2 then
      L13_30 = UNIT_1
    elseif L13_30 == UNIT_3 then
      L13_30 = UNIT_2
    elseif L13_30 == UNIT_4 then
      L13_30 = UNIT_3
    end
    if L13_30 == UNIT_3 then
      L14_31 = A0_17["remoteLogging.day"]
      if L14_31 == _UPVALUE0_.NIL then
        util.appendDebugOut("Set : Invalid day of week")
        return _UPVALUE0_.BAD_PARAMETER
      end
    end
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.smtpSet(L17_34, L1_18, L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26, L10_27, L11_28, L12_29, L13_30, L14_31, L15_32, L16_33)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in remote Logging" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
