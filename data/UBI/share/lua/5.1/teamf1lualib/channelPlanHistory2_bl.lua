local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.channelPlanHistory2", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/config")
L0_0 = require
L0_0("teamf1lualib/channelPlanHistory2_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.wlan.channelPlanHistory2")
;({}).macAddr = 1
;({}).location = 2
;({}).iteration = 3
;({}).channel = 4
function channelPlan2HistoryGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7
  L5_6 = {}
  L6_7 = 1
  L0_1, L1_2, L2_3, L3_4, L5_6 = _UPVALUE0_.channelplan2HistoryGet()
  if L5_6 ~= nil then
    for _FORV_11_, _FORV_12_ in pairs(L5_6) do
      ({})[L6_7] = {}
      for _FORV_16_, _FORV_17_ in pairs(_UPVALUE1_) do
        ({})[L6_7][_FORV_16_] = _FORV_12_[_FORV_17_]
      end
      L6_7 = L6_7 + 1
    end
  end
  if L0_1 ~= _UPVALUE2_.SUCCESS then
    return L0_1, L4_5
  end
  return L0_1, L1_2, L2_3, L3_4, L5_6
end
