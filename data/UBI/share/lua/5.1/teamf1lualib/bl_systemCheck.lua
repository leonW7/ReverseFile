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
L0_0 = L0_0("com.teamf1.core.diagnostics.network")
function systemCheckGet(A0_1)
  local L1_2, L2_3, L3_4
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page ntdomainServer")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L2_3 = A0_1["systemCheck.status"]
  if L2_3 == _UPVALUE0_.NIL then
    util.appenDebugOut("GetNext : Invalid Status ")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L2_3 ~= "ipv4" and L2_3 ~= "ipv6" then
    util.appendDebugOut("Get : Invalid Status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L2_3 == "ipv4" then
    returnCode, L1_2, L3_4 = _UPVALUE1_.ipv4RouteTableGet()
  else
    returnCode, L1_2, L3_4 = _UPVALUE1_.ipv6RouteTableGet()
  end
  if returnCode ~= _UPVALUE0_.SUCCESS then
    return returnCode
  end
  return returnCode, L1_2, L3_4
end
