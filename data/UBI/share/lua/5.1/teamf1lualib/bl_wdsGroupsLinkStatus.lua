local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.wdslinkstatus", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wdslinkstatus_web")
L0_0 = require
L0_0("teamf1lualib/wlan_returnCodes")
L0_0 = require
L0_0("teamf1lualib/global_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function wdsLinkStatusGet()
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
      elseif _UPVALUE4_ == L11_12 then
        L7_8[_UPVALUE4_] = _UPVALUE5_[L12_13 + _UPVALUE6_]
      elseif _UPVALUE7_ == L11_12 then
        L7_8[_UPVALUE7_] = _UPVALUE5_[L12_13 + _UPVALUE6_]
      elseif _UPVALUE8_ == L11_12 then
        L7_8[_UPVALUE8_] = _UPVALUE5_[L12_13 + _UPVALUE6_]
      elseif _UPVALUE9_ == L11_12 then
        L7_8[_UPVALUE9_] = _UPVALUE10_[L12_13 + _UPVALUE6_]
      elseif _UPVALUE11_ == L11_12 then
        L7_8[_UPVALUE11_] = _UPVALUE10_[L12_13 + _UPVALUE6_]
      end
    end
  end
  return L3_4, L4_5
end
