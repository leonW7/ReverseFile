local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.wdslinkstat", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wdslinkstats_web")
L0_0 = require
L0_0("teamf1lualib/wlan_returnCodes")
L0_0 = require
L0_0("teamf1lualib/global_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function wdsLinkStatGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13
  L0_1 = L4_5
  L1_2 = L3_4
  if L1_2 ~= L3_4 then
    return L1_2
  end
  for L6_7, L7_8 in L3_4(L4_5) do
    for L11_12, L12_13 in L8_9(L9_10) do
      if _UPVALUE2_ == L11_12 then
        L7_8[_UPVALUE2_] = global_web.getAPRadioPhyMode(L12_13)
      elseif _UPVALUE3_ == L11_12 then
        L7_8[_UPVALUE3_] = global_web.getAPRadioPhyMode(L12_13)
      end
    end
  end
  return L3_4, L4_5
end
