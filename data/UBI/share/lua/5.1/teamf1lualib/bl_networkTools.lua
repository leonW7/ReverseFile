local L0_0
L0_0 = module
L0_0("com.teamf1.bl.diagnostics.network", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/diagnostics_network")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function pingCmdSet(A0_1)
  local L1_2, L2_3
  L1_2 = ACCESS_LEVEL
  if L1_2 ~= 0 then
    L1_2 = util
    L1_2 = L1_2.appendDebugOut
    L2_3 = "Detected unauthorized access for networkTools page"
    L1_2(L2_3)
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.UNAUTHORIZED
    return L1_2
  end
  L1_2 = A0_1["networkTools.IpAddress"]
  L2_3 = A0_1.ping
  if L1_2 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Ip Address")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L2_3 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid ping Status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L2_3 ~= "start" and L2_3 ~= "stop" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  _UPVALUE1_.start()
  returnCode, outputText = _UPVALUE2_.pingSet(L1_2, L2_3)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in network tools page" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  return returnCode, outputText
end
function traceRouteStatusSet(A0_4)
  local L1_5, L2_6
  L1_5 = ACCESS_LEVEL
  if L1_5 ~= 0 then
    L1_5 = util
    L1_5 = L1_5.appendDebugOut
    L2_6 = "Detected unauthorized access for network Tools page"
    L1_5(L2_6)
    L1_5 = _UPVALUE0_
    L1_5 = L1_5.UNAUTHORIZED
    return L1_5
  end
  L1_5 = A0_4["networkTools.IpAddress"]
  L2_6 = A0_4.traceroute
  if L1_5 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Ip Address")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L2_6 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Traceroute Status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L2_6 ~= "start" and L2_6 ~= "stop" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  _UPVALUE1_.start()
  returnCode, outputText = _UPVALUE2_.tracerouteSet(L1_5, L2_6)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in network tools page" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  return returnCode, outputText
end
function dnsLookupSectionSet(A0_7)
  local L1_8, L2_9
  L1_8 = ACCESS_LEVEL
  if L1_8 ~= 0 then
    L1_8 = util
    L1_8 = L1_8.appendDebugOut
    L2_9 = "Detected unauthorized access for networkTools page"
    L1_8(L2_9)
    L1_8 = _UPVALUE0_
    L1_8 = L1_8.UNAUTHORIZED
    return L1_8
  end
  L1_8 = A0_7["networkTools.domainName"]
  L2_9 = A0_7["dns.status"]
  if L1_8 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Domain Name")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L2_9 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid dnsLookup Status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L2_9 ~= "start" and L2_9 ~= "stop" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  _UPVALUE1_.start()
  returnCode, outputText = _UPVALUE2_.dnsLookupSet(L1_8, L2_9)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in network tools page" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  return returnCode, outputText
end
