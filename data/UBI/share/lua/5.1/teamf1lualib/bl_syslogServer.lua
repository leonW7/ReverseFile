local L0_0
L0_0 = module
L0_0("com.teamf1.bl.logging.syslog", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/logging_syslog")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function syslogServerStatusGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
  returnCode, L0_1, L1_2, L2_3, L3_4, L4_5, L5_6 = _UPVALUE0_.syslogServerGet()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
end
function syslogServerStatusGetNext(A0_7)
  local L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14
  L7_14 = A0_7["sysLogServer.cookie"]
  if L7_14 == _UPVALUE0_.NIL then
    util.appenDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  returnCode, L1_8, L2_9, L3_10, L4_11, L5_12, L6_13 = _UPVALUE1_.syslogServerGetNext(L7_14)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    return returnCode
  end
  return returnCode, L1_8, L2_9, L3_10, L4_11, L5_12, L6_13
end
function syslogServerStatusSet(A0_15)
  local L1_16, L2_17, L3_18, L4_19, L5_20, L6_21
  L1_16 = ACCESS_LEVEL
  if L1_16 ~= 0 then
    L1_16 = util
    L1_16 = L1_16.appendDebugOut
    L2_17 = "Detected unauthorized access for syslogServer "
    L1_16(L2_17)
    L1_16 = _UPVALUE0_
    L1_16 = L1_16.UNAUTHORIZED
    return L1_16
  end
  L1_16 = A0_15["sysLogServer.cookie"]
  L2_17 = A0_15["sysLogServer.serverId"]
  L3_18 = A0_15["sysLogServer.Enable"]
  L4_19 = A0_15["sysLogServer.serverName"]
  L5_20 = A0_15["sysLogServer.facilityId"]
  L6_21 = A0_15["sysLogServer.severity"]
  if L1_16 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set: Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L2_17 == _UPVALUE0_.NIL or L3_18 == _UPVALUE0_.NIL or L4_19 == _UPVALUE0_.NIL or L5_20 == _UPVALUE0_.NIL or L6_21 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Parameters")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.syslogServerSet(L1_16, L2_17, L3_18, L4_19, L5_20, L6_21)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in syslog Server" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
function syslogServerSectionGetAll()
  local L0_22, L1_23
  L0_22 = {}
  L1_23 = {}
  returnCode, L0_22 = _UPVALUE0_.syslogServerGetAll()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  i = 0
  for _FORV_5_, _FORV_6_ in pairs(L0_22) do
    L1_23["sysLogServer.serverName" .. i] = _FORV_6_["sysLogInfo.serverName"]
    L1_23["sysLogServer.facilityId" .. i] = _FORV_6_["sysLogInfo.facilityId"]
    L1_23["sysLogServer.severity" .. i] = _FORV_6_["sysLogInfo.severity"]
    L1_23["sysLogServer.Enable" .. i] = _FORV_6_["sysLogInfo.Enable"]
    i = i + 1
  end
  if L1_23 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return returnCode, L1_23
end
function syslogServerSectionSetAll(A0_24)
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected unauthorized access for syslogServer")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_24 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set: Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  returnCode = _UPVALUE2_.syslogServerSetAll(A0_24)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in syslog Server " .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, 1
end
