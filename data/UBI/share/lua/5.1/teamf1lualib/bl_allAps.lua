local L0_0
L0_0 = require
L0_0("teamf1lualib/module")
L0_0 = module
L0_0(com.teamf1.bl.wlan.allaplist, package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/generic_returnCodes")
L0_0 = require
L0_0("teamf1lualib/allaplist_web")
L0_0 = require
L0_0 = L0_0(com.teamf1.core.generic.returnCodes)
;({}).apMacAddr = 1
;({}).ipAddr = 2
;({}).apType = 3
function allApsListGet()
  local L0_1, L1_2, L2_3, L3_4
  L2_3 = 1
  L3_4 = {}
  L1_2, L0_1 = _UPVALUE0_.allaplistGet()
  if L1_2 ~= _UPVALUE1_.SUCCESS then
    return L1_2
  end
  for _FORV_7_, _FORV_8_ in pairs(L0_1) do
    L3_4[L2_3] = {}
    for _FORV_12_, _FORV_13_ in pairs(_UPVALUE2_) do
      L3_4[L2_3][_FORV_12_] = _FORV_8_[_FORV_13_]
    end
    L2_3 = L2_3 + 1
  end
  return L1_2, L3_4
end
