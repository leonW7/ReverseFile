local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.wdsapstatus", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wdsapstatus_web")
L0_0 = require
L0_0("teamf1lualib/wlan_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function wdsAPStatusGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8
  L0_1 = L4_5
  L1_2 = L3_4
  if L1_2 ~= L3_4 then
    return L1_2
  end
  for L6_7, L7_8 in L3_4(L4_5) do
    for _FORV_11_, _FORV_12_ in pairs(L7_8) do
      if _UPVALUE2_ == _FORV_11_ then
        L7_8[_UPVALUE2_] = _UPVALUE3_[_FORV_12_ + _UPVALUE4_]
      elseif _UPVALUE5_ == _FORV_11_ then
        L7_8[_UPVALUE5_] = _UPVALUE6_[_FORV_12_ + _UPVALUE4_]
      elseif _UPVALUE7_ == _FORV_11_ then
        L7_8[_UPVALUE7_] = _UPVALUE8_[_FORV_12_ + _UPVALUE4_]
      elseif _UPVALUE9_ == _FORV_11_ then
        L7_8[_UPVALUE9_] = _UPVALUE10_[_FORV_12_ + _UPVALUE4_]
      elseif _UPVALUE11_ == _FORV_11_ then
        L7_8[_UPVALUE11_] = _UPVALUE12_[_FORV_12_ + _UPVALUE4_]
      elseif _UPVALUE13_ == _FORV_11_ then
        L7_8[_UPVALUE13_] = _UPVALUE14_[_FORV_12_ + _UPVALUE4_]
      end
    end
  end
  return L3_4, L4_5
end
