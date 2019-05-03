local L0_0
L0_0 = module
L0_0("com.teamf1.bl.logging.configuration", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/logging_configuration")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/admin_license")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.logging.configuration")
;({}).key = "_ROWID_"
;({}).keyValue = "1"
;({}).unicastTrafficLogBitmap = "UnicastTraffic"
;({}).broadcastOrMulticastLogBitmap = "BroadCastORMulticastTraffic"
;({}).ftpLogBitmap = "FtpLogs"
;({}).redirectedIcmpLogBitmap = "IcmpRedirectedLogs"
;({}).invalidPacketsLogBitmap = "logInvalidPacket"
;({}).bwLimitLogsBitMap = "bwLimitLogs"
;({}).cookie = "cookie"
;({}).categoryServerLogs = "categoryServerLogs"
function systemLogGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
  returnCode, cookie, L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, bwLimit = _UPVALUE0_.systemLogBitmapGet()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, cookie, L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, bwLimit
end
function systemLogSet(A0_7)
  local L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14, L8_15
  L1_8 = ACCESS_LEVEL
  if L1_8 ~= 0 then
    L1_8 = util
    L1_8 = L1_8.appendDebugOut
    L2_9 = "Detected unauthorized access for facilityLogs "
    L1_8(L2_9)
    L1_8 = _UPVALUE0_
    L1_8 = L1_8.UNAUTHORIZED
    return L1_8
  end
  L1_8 = _UPVALUE1_
  L2_9 = "."
  L3_10 = _UPVALUE2_
  L3_10 = L3_10.cookie
  L1_8 = L1_8 .. L2_9 .. L3_10
  L1_8 = A0_7[L1_8]
  L2_9 = _UPVALUE1_
  L3_10 = "."
  L4_11 = _UPVALUE2_
  L4_11 = L4_11.unicastTrafficLogBitmap
  L2_9 = L2_9 .. L3_10 .. L4_11
  L2_9 = A0_7[L2_9]
  L3_10 = _UPVALUE1_
  L4_11 = "."
  L5_12 = _UPVALUE2_
  L5_12 = L5_12.broadcastOrMulticastLogBitmap
  L3_10 = L3_10 .. L4_11 .. L5_12
  L3_10 = A0_7[L3_10]
  L4_11 = _UPVALUE1_
  L5_12 = "."
  L6_13 = _UPVALUE2_
  L6_13 = L6_13.ftpLogBitmap
  L4_11 = L4_11 .. L5_12 .. L6_13
  L4_11 = A0_7[L4_11]
  L5_12 = _UPVALUE1_
  L6_13 = "."
  L7_14 = _UPVALUE2_
  L7_14 = L7_14.redirectedIcmpLogBitmap
  L5_12 = L5_12 .. L6_13 .. L7_14
  L5_12 = A0_7[L5_12]
  L6_13 = _UPVALUE1_
  L7_14 = "."
  L8_15 = _UPVALUE2_
  L8_15 = L8_15.invalidPacketsLogBitmap
  L6_13 = L6_13 .. L7_14 .. L8_15
  L6_13 = A0_7[L6_13]
  L7_14 = _UPVALUE1_
  L8_15 = "."
  L7_14 = L7_14 .. L8_15 .. _UPVALUE2_.bwLimitLogsBitMap
  L7_14 = A0_7[L7_14]
  L8_15 = _UPVALUE1_
  L8_15 = L8_15 .. "." .. _UPVALUE2_.categoryServerLogs
  L8_15 = A0_7[L8_15]
  if L1_8 == _UPVALUE0_.NIL then
    util.appenDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L2_9 == _UPVALUE0_.NIL then
    util.appenDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L3_10 == _UPVALUE0_.NIL then
    util.appenDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L4_11 == _UPVALUE0_.NIL then
    util.appenDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L5_12 == _UPVALUE0_.NIL then
    util.appenDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L6_13 == _UPVALUE0_.NIL then
    util.appenDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L7_14 == _UPVALUE0_.NIL then
    util.appenDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if _UPVALUE3_.wcfLicenseStatusGet() and L8_15 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE4_.start()
  returnCode, cookie = _UPVALUE5_.systemLogBitmapSet(cookie, L2_9, L3_10, L4_11, L5_12, L6_13, L8_15, L7_14)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in system Logs page" .. returnCode)
    _UPVALUE4_.abort()
    return returnCode
  end
  _UPVALUE4_.complete()
  _UPVALUE4_.save()
  return returnCode, cookie
end
