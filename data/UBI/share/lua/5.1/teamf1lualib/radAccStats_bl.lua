local L0_0
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/radAccStats_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.radius.accounting.stastictics", package.seeall)
returnCodes = require("com.teamf1.core.returnCodes")
;({}).serverIp = 1
;({}).roundTripTime = 2
;({}).accRequest = 3
;({}).accreTransimission = 4
;({}).accResponse = 5
;({}).malformedAccResponse = 6
;({}).badAuthenticators = 7
;({}).pendingRequest = 8
;({}).timeouts = 9
;({}).unknoenType = 10
;({}).packetDropped = 11
function radiusAccServerStasticsGet()
  local L0_1, L1_2, L2_3, L3_4
  L2_3 = {}
  L3_4 = 1
  L0_1, L1_2 = _UPVALUE0_.wlanRadStatsGet()
  if L0_1 ~= returnCodes.SUCCESS then
    return L0_1
  end
  for _FORV_7_, _FORV_8_ in pairs(L1_2) do
    L2_3[L3_4] = {}
    for _FORV_12_, _FORV_13_ in pairs(_UPVALUE1_) do
      L2_3[L3_4][_FORV_12_] = _FORV_8_[_FORV_13_]
    end
    L3_4 = L3_4 + 1
  end
  return L0_1, L2_3
end
