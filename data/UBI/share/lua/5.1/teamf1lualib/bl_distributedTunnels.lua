local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.apDistributedTunnels", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/apdistributedtunnelingstatus_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).apdistributedtunnelingstatusCLIENTSUSINGASHOMEAP = 1
;({}).apdistributedtunnelingstatusMULITCASTREPLICATIONS = 2
;({}).apdistributedtunnelingstatusCLIENTSUSINGASASSOCIATEAP = 3
;({}).apdistributedtunnelingstatusVLANWITHMCASTREPLICATIONS = 4
;({}).apdistributedtunnelingstatusDISTRIBUTEDTUNNELS = 5
function apDistributionTunnelsGet(A0_1)
  local L1_2, L2_3, L3_4
  L3_4 = {}
  L1_2, L2_3 = _UPVALUE0_.apdistributedtunnelingstatusGet(A0_1)
  if L1_2 ~= _UPVALUE1_.SUCCESS then
    return L1_2
  end
  for _FORV_7_, _FORV_8_ in pairs(_UPVALUE2_) do
    L3_4[_FORV_7_] = L2_3[_FORV_8_]
  end
  return L1_2, L3_4
end
