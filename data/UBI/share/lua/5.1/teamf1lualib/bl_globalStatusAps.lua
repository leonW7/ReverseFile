local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.apglobalstatus", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/apglobalstatus_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).totalAPs = 1
;({}).managedAPs = 2
;({}).standaloneAPs = 3
;({}).rogueAPs = 4
;({}).discoveredAPs = 5
;({}).connectionFailedAPs = 6
;({}).authenticationFailedAPs = 7
;({}).unknownAPs = 8
;({}).rogueAPMitigationLimit = 9
;({}).rogueAPMitigationCount = 10
;({}).managedAPsinPeerGroup = 11
;({}).WLANUtilization = 12
;({}).totalClients = 13
;({}).authenticatedClients = 14
;({}).dotAClients = 15
;({}).dotB_GClients = 16
;({}).dotNClients = 17
;({}).maxAssociatedClients = 18
;({}).detectedClients = 19
;({}).maxDetectedClients = 20
;({}).maxPreAuthHistoryEntries = 21
;({}).totalPreAuthHistoryEntries = 22
;({}).maxRoamHistoryEntries = 23
;({}).totalRoamHistoryEntries = 24
function globalApsStatusGet()
  local L0_1, L1_2, L2_3
  L0_1 = {}
  L1_2, L2_3 = nil, nil
  L1_2, L2_3 = _UPVALUE0_.apglobalstatusGet()
  if L1_2 ~= _UPVALUE1_.SUCCESS then
    return L1_2
  end
  for _FORV_6_, _FORV_7_ in pairs(_UPVALUE2_) do
    L0_1[_FORV_6_] = L2_3[_FORV_7_]
  end
  return L1_2, L0_1
end
function globalClientsStatusGet()
  local L0_4, L1_5, L2_6
  L1_5 = {}
  L2_6 = nil
  L0_4, L2_6 = _UPVALUE0_.apglobalstatusGet()
  if L0_4 ~= _UPVALUE1_.SUCCESS then
    return L0_4
  end
  for _FORV_6_, _FORV_7_ in pairs(_UPVALUE2_) do
    L1_5[_FORV_6_] = L2_6[_FORV_7_]
  end
  return L0_4, L1_5
end
