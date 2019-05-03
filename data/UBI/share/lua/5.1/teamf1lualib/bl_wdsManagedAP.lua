local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.wdsapgroup", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wdsgroups_web")
L0_0 = require
L0_0("teamf1lualib/wdsmanagedaps_web")
L0_0 = require
L0_0("teamf1lualib/wlan_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function wdsMangedApsGet()
  local L0_1, L1_2, L2_3
  L1_2, L0_1 = _UPVALUE0_.wdsmanagedapsGet()
  if L1_2 ~= _UPVALUE1_.SUCCESS then
    return L1_2
  end
  for _FORV_6_, _FORV_7_ in pairs(L0_1) do
    if _FORV_7_.wdsmanagedapsAPHWTYPE == _UPVALUE2_ then
      _FORV_7_.wdsmanagedapsAPHWTYPE = _UPVALUE3_
    elseif _FORV_7_.wdsmanagedapsAPHWTYPE == _UPVALUE4_ then
      _FORV_7_.wdsmanagedapsAPHWTYPE = _UPVALUE5_
    elseif _FORV_7_.wdsmanagedapsAPHWTYPE == _UPVALUE6_ then
      _FORV_7_.wdsmanagedapsAPHWTYPE = _UPVALUE7_
    elseif _FORV_7_.wdsmanagedapsAPHWTYPE == _UPVALUE8_ then
      _FORV_7_.wdsmanagedapsAPHWTYPE = _UPVALUE9_
    else
      _FORV_7_.wdsmanagedapsAPHWTYPE = _UPVALUE10_
    end
  end
  return L1_2, L0_1
end
function wdsMangedApsEdit(A0_4)
  local L1_5, L2_6, L3_7, L4_8, L5_9, L6_10, L7_11, L8_12
  L3_7 = {}
  if L4_8 ~= 0 then
    L4_8(L5_9)
    return L4_8
  end
  for L7_11, L8_12 in L4_8(L5_9) do
    if L8_12 == _UPVALUE0_.NIL then
      util.appendDebugOut("Set : Invalid Data")
      return _UPVALUE0_.BAD_PARAMETER
    elseif tonumber(L8_12) ~= _UPVALUE0_.NIL then
      A0_4[L7_11] = tonumber(L8_12)
    end
  end
  L1_5 = L4_8
  if L1_5 ~= L4_8 then
    L4_8(L5_9)
    return L1_5
  end
  return L1_5
end
function wdsMangedApsAdd(A0_13)
  local L1_14, L2_15, L3_16, L4_17, L5_18, L6_19, L7_20, L8_21
  L3_16 = {}
  if L4_17 ~= 0 then
    L4_17(L5_18)
    return L4_17
  end
  for L7_20, L8_21 in L4_17(L5_18) do
    if L8_21 == _UPVALUE0_.NIL then
      util.appendDebugOut("Set : Invalid Data")
      return _UPVALUE0_.BAD_PARAMETER
    elseif tonumber(L8_21) ~= _UPVALUE0_.NIL then
      A0_13[L7_20] = tonumber(L8_21)
    end
  end
  L1_14 = L4_17
  if L1_14 ~= L4_17 then
    L4_17(L5_18)
    return L1_14
  end
  return L1_14
end
function wdsMangedApsDelete(A0_22)
  local L1_23, L2_24, L3_25, L4_26, L5_27, L6_28, L7_29, L8_30
  L3_25 = {}
  if L4_26 ~= 0 then
    L4_26(L5_27)
    return L4_26
  end
  for L7_29, L8_30 in L4_26(L5_27) do
    if L8_30 == _UPVALUE0_.NIL then
      util.appendDebugOut("Set : Invalid Data")
      return _UPVALUE0_.BAD_PARAMETER
    elseif tonumber(L8_30) ~= _UPVALUE0_.NIL then
      A0_22[L7_29] = tonumber(L8_30)
    end
  end
  L1_23 = L4_26
  if L1_23 ~= L4_26 then
    L4_26(L5_27)
    return L1_23
  end
  return L1_23
end
function wdsMangedApsDeleteAll()
  local L0_31, L1_32, L2_33, L3_34, L4_35, L5_36, L6_37
  L1_32 = {}
  if L2_33 ~= 0 then
    L2_33(L3_34)
    return L2_33
  end
  L1_32 = L3_34
  L0_31 = L2_33
  if L0_31 ~= L2_33 then
    L2_33(L3_34)
    return L0_31
  end
  for L5_36, L6_37 in L2_33(L3_34) do
    L0_31 = _UPVALUE1_.wdsmanagedapsDelete(L6_37)
    if L0_31 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in configuring values in wdsManagedAP page" .. L0_31)
      return L0_31
    end
  end
  return L0_31
end
