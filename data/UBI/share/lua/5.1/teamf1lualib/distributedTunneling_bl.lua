local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.distributedTunneling", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/distributedtunnelingstatus_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).pcktsTransmitted = 1
;({}).roamedClients = 2
;({}).tunnelClients = 3
;({}).tunnelClientDenials = 4
function distributedTunnelingStatusGet()
  local L0_1, L1_2, L2_3
  L2_3 = {}
  L0_1, L1_2 = _UPVALUE0_.distributedtunnelingstatusGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  for _FORV_6_, _FORV_7_ in pairs(_UPVALUE2_) do
    _UPVALUE2_[_FORV_6_] = L1_2[_FORV_7_]
  end
  return L0_1, _UPVALUE2_
end
function distributedTunnelingStatusClear()
  local L0_4
  L0_4 = ACCESS_LEVEL
  if L0_4 ~= 0 then
    L0_4 = util
    L0_4 = L0_4.appendDebugOut
    L0_4("Detected Unauthorized access for page Users")
    L0_4 = _UPVALUE0_
    L0_4 = L0_4.UNAUTHORIZED
    return L0_4
  end
  L0_4 = nil
  L0_4 = _UPVALUE1_.distributedtunnelingstatusClear()
  if L0_4 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Clearing values in distributedtunnelingstatus  page" .. L0_4)
  end
  return L0_4
end
