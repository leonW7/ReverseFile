local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.wdslinkgroup", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wdsgroups_web")
L0_0 = require
L0_0("teamf1lualib/wdsaplinks_web")
L0_0 = require
L0_0("teamf1lualib/wlan_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function wdsMangedApsLinksGet()
  local L0_1, L1_2, L2_3
  L1_2, L0_1 = _UPVALUE0_.wdsaplinksGet()
  if L1_2 ~= _UPVALUE1_.SUCCESS then
    return L1_2
  end
  for _FORV_6_, _FORV_7_ in pairs(L0_1) do
    if _FORV_7_.wdsaplinksSRCAPHWTYPE == _UPVALUE2_ then
      _FORV_7_.wdsaplinksSRCAPHWTYPE = _UPVALUE3_
    elseif _FORV_7_.wdsaplinksSRCAPHWTYPE == _UPVALUE4_ then
      _FORV_7_.wdsaplinksSRCAPHWTYPE = _UPVALUE5_
    elseif _FORV_7_.wdsaplinksSRCAPHWTYPE == _UPVALUE6_ then
      _FORV_7_.wdsaplinksSRCAPHWTYPE = _UPVALUE7_
    elseif _FORV_7_.wdsaplinksSRCAPHWTYPE == _UPVALUE8_ then
      _FORV_7_.wdsaplinksSRCAPHWTYPE = _UPVALUE9_
    else
      _FORV_7_.wdsaplinksSRCAPHWTYPE = _UPVALUE10_
    end
  end
  for _FORV_6_, _FORV_7_ in pairs(L0_1) do
    if _FORV_7_.wdsaplinksDESTAPHWTYPE == _UPVALUE2_ then
      _FORV_7_.wdsaplinksDESTAPHWTYPE = _UPVALUE3_
    elseif _FORV_7_.wdsaplinksDESTAPHWTYPE == _UPVALUE4_ then
      _FORV_7_.wdsaplinksDESTAPHWTYPE = _UPVALUE5_
    elseif _FORV_7_.wdsaplinksDESTAPHWTYPE == _UPVALUE6_ then
      _FORV_7_.wdsaplinksDESTAPHWTYPE = _UPVALUE7_
    elseif _FORV_7_.wdsaplinksDESTAPHWTYPE == _UPVALUE8_ then
      _FORV_7_.wdsaplinksDESTAPHWTYPE = _UPVALUE9_
    else
      _FORV_7_.wdsaplinksDESTAPHWTYPE = _UPVALUE10_
    end
  end
  return L1_2, L0_1
end
function wdsMangedApsLinksAdd(A0_4)
  local L1_5, L2_6, L3_7, L4_8, L5_9, L6_10
  if L2_6 ~= 0 then
    L2_6(L3_7)
    return L2_6
  end
  for L5_9, L6_10 in L2_6(L3_7) do
    if L6_10 == _UPVALUE0_.NIL then
      util.appendDebugOut("Set : Invalid Data")
      return _UPVALUE0_.BAD_PARAMETER
    elseif tonumber(L6_10) ~= _UPVALUE0_.NIL then
      A0_4[L5_9] = tonumber(L6_10)
    end
  end
  L1_5 = L2_6
  if L1_5 ~= L2_6 then
    L2_6(L3_7)
    return L1_5
  end
  return L1_5
end
function wdsMangedApsLinksEdit(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17
  if L2_13 ~= 0 then
    L2_13(L3_14)
    return L2_13
  end
  for L5_16, L6_17 in L2_13(L3_14) do
    if L6_17 == _UPVALUE0_.NIL then
      util.appendDebugOut("Set : Invalid Data")
      return _UPVALUE0_.BAD_PARAMETER
    elseif tonumber(L6_17) ~= _UPVALUE0_.NIL then
      A0_11[L5_16] = tonumber(L6_17)
    end
  end
  L1_12 = L2_13
  if L1_12 ~= L2_13 then
    L2_13(L3_14)
    return L1_12
  end
  return L1_12
end
function wdsMangedApsLinksDelete(A0_18)
  local L1_19, L2_20, L3_21, L4_22, L5_23, L6_24
  if L2_20 ~= 0 then
    L2_20(L3_21)
    return L2_20
  end
  for L5_23, L6_24 in L2_20(L3_21) do
    if L6_24 == _UPVALUE0_.NIL then
      util.appendDebugOut("Set : Invalid Data")
      return _UPVALUE0_.BAD_PARAMETER
    elseif tonumber(L6_24) ~= _UPVALUE0_.NIL then
      A0_18[L5_23] = tonumber(L6_24)
    end
  end
  L1_19 = L2_20
  if L1_19 ~= L2_20 then
    L2_20(L3_21)
    return L1_19
  end
  return L1_19
end
