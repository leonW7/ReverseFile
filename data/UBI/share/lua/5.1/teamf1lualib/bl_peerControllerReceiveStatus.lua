local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.peercontrollerrecievestatus", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/peercontrollerrecievestatus_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).receivedStatus = 1
;({}).peerControllerIp = 2
;({}).timeStamp = 3
;({}).configType = 4
function peerConfigReciveStatusGet()
  local L0_1, L1_2, L2_3
  L2_3 = {}
  L0_1, L1_2 = _UPVALUE0_.peercontrollerrecievestatusGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in Getting values for the peerControllerReceiveStatus page" .. L0_1)
  end
  for _FORV_6_, _FORV_7_ in pairs(_UPVALUE2_) do
    L2_3[_FORV_6_] = L1_2[_FORV_7_]
  end
  return L0_1, L2_3
end
