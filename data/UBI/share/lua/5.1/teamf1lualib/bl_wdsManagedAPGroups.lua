local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.wdsgroup", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wdsgroups_web")
L0_0 = require
L0_0("teamf1lualib/wlan_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function wdsMangedGroupGet()
  local L0_1, L1_2, L2_3
  L1_2, L0_1 = _UPVALUE0_.wdsgroupsGet()
  if L1_2 ~= _UPVALUE1_.SUCCESS then
    return L1_2
  end
  for _FORV_6_, _FORV_7_ in pairs(L0_1) do
    if _FORV_7_.wdsgroupsSTPENABLE == _UPVALUE2_ then
      _FORV_7_.wdsgroupsSTPENABLE = _UPVALUE3_
    else
      _FORV_7_.wdsgroupsSTPENABLE = _UPVALUE4_
    end
  end
  return L1_2, L0_1
end
function wdsManagedApGroupDelete(A0_4)
  local L1_5, L2_6, L3_7
  L3_7 = {}
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for wdsManagedAPGroups page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L2_6 = A0_4.checkbox
  if L2_6 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L3_7.wdsgroupsGROUPID = tonumber(L2_6)
  L1_5 = _UPVALUE1_.wdsgroupsDelete(L3_7)
  if L1_5 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in wdsManagedAPGroups page" .. L1_5)
    return L1_5
  end
  return L1_5
end
function wdsManagedApGroupAdd(A0_8)
  local L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16, L9_17, L10_18
  L3_11 = {}
  L4_12, L5_13 = nil, nil
  if L6_14 ~= 0 then
    L6_14(L7_15)
    return L6_14
  end
  L3_11 = L7_15
  L1_9 = L6_14
  if L1_9 ~= L6_14 then
    L6_14(L7_15)
    return L1_9
  end
  L4_12 = #L3_11
  if L4_12 == 0 then
    L2_10 = _UPVALUE1_
  elseif L4_12 == L6_14 then
    return L6_14
  else
    for L9_17, L10_18 in L6_14(L7_15) do
      L5_13 = L10_18.wdsgroupsGROUPID
    end
  end
  if L2_10 == L6_14 then
    if L5_13 == L6_14 then
      L2_10 = _UPVALUE2_
    else
      L2_10 = _UPVALUE1_
    end
  end
  for L9_17, L10_18 in L6_14(L7_15) do
    if L9_17 ~= _UPVALUE4_ then
      if L10_18 == _UPVALUE0_.NIL then
        util.appendDebugOut("Set : Invalid Data")
        return _UPVALUE0_.BAD_PARAMETER
      elseif tonumber(L10_18) ~= _UPVALUE0_.NIL then
        A0_8[L9_17] = tonumber(A0_8[L9_17])
      end
    elseif string.len(L10_18) < _UPVALUE5_ or string.len(L10_18) > _UPVALUE6_ then
      return _UPVALUE3_.WDS_PASSWORD_LENGTH
    end
  end
  A0_8.wdsgroupsGROUPID = L2_10
  L1_9 = L6_14
  if L1_9 ~= L6_14 then
    L6_14(L7_15)
    return L1_9
  end
  return L1_9
end
function wdsManagedApGroupEdit(A0_19)
  local L1_20, L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27, L9_28, L10_29
  L3_22 = {}
  L4_23, L5_24 = nil, nil
  if L6_25 ~= 0 then
    L6_25(L7_26)
    return L6_25
  end
  for L9_28, L10_29 in L6_25(L7_26) do
    if L9_28 ~= _UPVALUE1_ then
      if L10_29 == _UPVALUE0_.NIL then
        util.appendDebugOut("Set : Invalid Data")
        return _UPVALUE0_.BAD_PARAMETER
      elseif tonumber(L10_29) ~= _UPVALUE0_.NIL then
        A0_19[L9_28] = tonumber(A0_19[L9_28])
      end
    elseif string.len(L10_29) < _UPVALUE2_ or string.len(L10_29) > _UPVALUE3_ then
      return _UPVALUE4_.WDS_PASSWORD_LENGTH
    end
  end
  L1_20 = L6_25
  if L1_20 ~= L6_25 then
    L6_25(L7_26)
    return L1_20
  end
  return L1_20
end
function wdsManagedApGroupDeleteAll(A0_30)
  local L1_31, L2_32, L3_33, L4_34
  L3_33 = {}
  L4_34 = 1
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for wdsManagedAPGroups page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_30[L4_34] == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  while A0_30[L4_34] ~= _UPVALUE0_.NIL do
    L2_32 = A0_30[L4_34]
    L3_33.wdsgroupsGROUPID = tonumber(L2_32)
    L1_31 = _UPVALUE1_.wdsgroupsDelete(L3_33)
    if L1_31 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in configuring values in wdsManagedAPGroups page" .. L1_31)
      return L1_31
    end
    L4_34 = L4_34 + 1
  end
  return L1_31
end
function wdsManagedApGroupPushConfig()
  local L0_35
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for wdsManagedAPGroups page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L0_35 = _UPVALUE1_.wdsgroupsPushConfig()
  if L0_35 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in wdsManagedAPGroups page" .. L0_35)
    return L0_35
  end
  return L0_35
end
