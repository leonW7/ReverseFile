local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.controllerclients", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/controllerassociatedclients_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).macAddress = 1
;({}).ipAddress = 2
function controllerClientsGet()
  local L0_1, L1_2, L2_3, L3_4
  L2_3 = {}
  L3_4 = 1
  L0_1, L1_2 = _UPVALUE0_.controllerassociatedclientsGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in Getting values for the controllerAssociatedClients page" .. L0_1)
  end
  for _FORV_7_, _FORV_8_ in pairs(L1_2) do
    L2_3[L3_4] = {}
    for _FORV_12_, _FORV_13_ in pairs(_UPVALUE2_) do
      L2_3[L3_4][_FORV_12_] = _FORV_8_[_FORV_13_]
    end
    L3_4 = L3_4 + 1
  end
  return L0_1, L2_3
end
