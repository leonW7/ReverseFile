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
L0_0 = L0_0("com.teamf1.core.logging.configuration")
;({}).eventLogBit = "BandwidthLimitLogs"
;({}).cookie = "cookie"
;({}).captivePortalLog = "captivePortalLogs"
function bwLimitSet(A0_1)
  local L1_2, L2_3
  L1_2 = ACCESS_LEVEL
  if L1_2 ~= 0 then
    L1_2 = util
    L1_2 = L1_2.appendDebugOut
    L2_3 = "Detected unauthorized access for eventLogs page"
    L1_2(L2_3)
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.UNAUTHORIZED
    return L1_2
  end
  L1_2 = _UPVALUE1_
  L2_3 = "."
  L1_2 = L1_2 .. L2_3 .. _UPVALUE2_.eventLogBit
  L1_2 = A0_1[L1_2]
  L2_3 = _UPVALUE1_
  L2_3 = L2_3 .. "." .. _UPVALUE2_.cookie
  L2_3 = A0_1[L2_3]
  if L2_3 == _UPVALUE0_.NIL then
    util.appenDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L1_2 == _UPVALUE0_.NIL then
    util.appenDebugOut("GetNext : Invalid bit map ")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE3_.start()
  returnCode, cookie = _UPVALUE4_.eventLogBitmapSet(L2_3, L1_2)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in eventLogs page" .. returnCode)
    _UPVALUE3_.abort()
    return returnCode
  end
  _UPVALUE3_.complete()
  _UPVALUE3_.save()
  return returnCode, cookie
end
function bwLimitGet()
  local L0_4, L1_5
  returnCode, L0_4, L1_5 = _UPVALUE0_.eventLogBitmapGet()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, L0_4, L1_5
end
function captivePortalGet()
  local L0_6, L1_7
  returnCode, L0_6, L1_7 = _UPVALUE0_.captivePortalLogGet()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, L0_6, L1_7
end
function captivePortalSet(A0_8)
  local L1_9
  L1_9 = ACCESS_LEVEL
  if L1_9 ~= 0 then
    L1_9 = util
    L1_9 = L1_9.appendDebugOut
    L1_9("Detected unauthorized access for eventLogs page")
    L1_9 = _UPVALUE0_
    L1_9 = L1_9.UNAUTHORIZED
    return L1_9
  end
  L1_9 = _UPVALUE1_
  L1_9 = L1_9 .. "." .. _UPVALUE2_.captivePortalLog
  L1_9 = A0_8[L1_9]
  _UPVALUE3_.start()
  returnCode, cookie = _UPVALUE4_.captivePortalLogSet(eventCookie, L1_9)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in eventLogs page" .. returnCode)
    _UPVALUE3_.abort()
    return returnCode
  end
  _UPVALUE3_.complete()
  _UPVALUE3_.save()
  return returnCode, cookie
end
