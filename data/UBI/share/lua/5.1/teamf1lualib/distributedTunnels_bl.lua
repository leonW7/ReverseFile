local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.distributedTunnels", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/distributedtunnels_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).clients = 1
;({}).idleTimeOut = 2
;({}).tunnelTimeOut = 3
;({}).replications = 4
function distributedTunnelsGet()
  local L0_1, L1_2, L2_3
  L2_3 = {}
  L0_1, L1_2 = _UPVALUE0_.distributedtunnelsGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  for _FORV_6_, _FORV_7_ in pairs(_UPVALUE2_) do
    _UPVALUE2_[_FORV_6_] = L1_2[1][_FORV_7_]
  end
  return L0_1, _UPVALUE2_
end
function distributedTunnelsSet(A0_4)
  local L1_5, L2_6
  L2_6 = ACCESS_LEVEL
  if L2_6 ~= 0 then
    L2_6 = util
    L2_6 = L2_6.appendDebugOut
    L2_6("Detected Unauthorized access for lanQos page")
    L2_6 = _UPVALUE0_
    L2_6 = L2_6.UNAUTHORIZED
    return L2_6
  end
  L2_6 = util
  L2_6 = L2_6.removePrefix
  L2_6 = L2_6(A0_4, "distributedTunnel.")
  A0_4 = L2_6
  L2_6 = {}
  L2_6[1] = tonumber(A0_4.clients)
  L2_6[2] = tonumber(A0_4.idleTimeOut)
  L2_6[3] = tonumber(A0_4.tunnelTimeOut)
  L2_6[4] = tonumber(A0_4.replications)
  L1_5 = _UPVALUE1_.distributedtunnelsSet(L2_6)
  if L1_5 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in apWidsSecurity page" .. L1_5)
  end
  return _UPVALUE0_.SUCCESS
end
