local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.approfilessid", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/approfilessid_web")
L0_0 = require
L0_0("teamf1lualib/networkprofileslist_web")
L0_0 = require
L0_0("teamf1lualib/captivePortal_networkProfiles_bl")
L0_0 = require
L0_0("teamf1lualib/wlan_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).vapId = 1
;({}).ssidStatus = 2
;({}).networkId = 3
;({}).networkName = 4
;({}).vlanId = 5
;({}).hideSsid = 6
;({}).security = 7
;({}).redirect = 8
;({}).vlanName = 9
;({}).capitivePortal = 10
;({}).networkId = 1
;({}).networkName = 2
;({}).hwType = 1
;({}).radioIndex = 2
;({}).radioMode2 = 3
;({}).radioMode1 = 4
function apProfileSsidGet(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21
  L4_5 = {}
  L5_6 = 1
  L6_7, L7_8 = nil, nil
  L8_9 = {}
  L6_7 = A0_1.profileId
  L7_8 = A0_1.radioIndex
  if L6_7 ~= L9_10 then
  elseif L7_8 == L9_10 then
    L9_10(L10_11)
    return L9_10
  end
  L6_7 = L9_10
  L7_8 = L9_10
  L2_3 = L11_12
  L3_4 = L10_11
  L1_2 = L9_10
  if L1_2 ~= L9_10 then
    L9_10(L10_11)
    return L9_10
  end
  for L12_13, L13_14 in L9_10(L10_11) do
    L14_15 = L3_4[L13_14]
    L8_9[L12_13] = L14_15
  end
  for L12_13, L13_14 in L9_10(L10_11) do
    L14_15 = {}
    L4_5[L5_6] = L14_15
    L14_15 = _UPVALUE3_
    L14_15 = L14_15.networkProfileCaptivePortalGet
    L15_16 = _UPVALUE4_
    L15_16 = L13_14[L15_16]
    L20_21 = L14_15(L15_16)
    L2_3[L12_13][_UPVALUE5_] = _UPVALUE6_[tonumber(L20_21)]
    for _FORV_27_, _FORV_28_ in pairs(_UPVALUE7_) do
      if _FORV_28_ == _UPVALUE8_ then
        if L13_14[_FORV_28_] == _UPVALUE9_ then
          L4_5[L5_6][_FORV_27_] = _UPVALUE10_
        else
          L4_5[L5_6][_FORV_27_] = _UPVALUE11_
        end
      elseif _FORV_28_ == _UPVALUE12_ then
        if L13_14[_FORV_28_] == _UPVALUE9_ then
          L4_5[L5_6][_FORV_27_] = _UPVALUE10_
        else
          L4_5[L5_6][_FORV_27_] = _UPVALUE11_
        end
      else
        L4_5[L5_6][_FORV_27_] = L13_14[_FORV_28_]
      end
    end
    L5_6 = L5_6 + 1
  end
  return L9_10, L10_11, L11_12
end
function apProfileSsidStatusSet(A0_22)
  local L1_23, L2_24, L3_25, L4_26, L5_27, L6_28
  if L2_24 ~= 0 then
    L2_24(L3_25)
    return L2_24
  end
  for L5_27, L6_28 in L2_24(L3_25) do
    if L6_28 == _UPVALUE0_.NIL then
      util.appendDebugOut("Set : Invalid Data")
      return _UPVALUE0_.BAD_PARAMETER
    else
      A0_22[L5_27] = tonumber(L6_28)
    end
  end
  L1_23 = L2_24
  if L1_23 ~= L2_24 then
    L2_24(L3_25)
  end
  return L1_23
end
function apProfileSsidNetworkIdSet(A0_29)
  local L1_30, L2_31, L3_32, L4_33, L5_34, L6_35
  if L2_31 ~= 0 then
    L2_31(L3_32)
    return L2_31
  end
  for L5_34, L6_35 in L2_31(L3_32) do
    if L6_35 == _UPVALUE0_.NIL then
      util.appendDebugOut("Set : Invalid Data")
      return _UPVALUE0_.BAD_PARAMETER
    else
      A0_29[L5_34] = tonumber(L6_35)
    end
  end
  L1_30 = L2_31
  if L1_30 ~= L2_31 then
    if L2_31 == L1_30 then
      return L2_31
    elseif L2_31 == L1_30 then
      return L2_31
    elseif L2_31 == L1_30 then
      return L2_31
    else
      return L1_30
    end
  end
  return L1_30
end
function networkProileListGet()
  local L0_36, L1_37, L2_38, L3_39
  L2_38 = {}
  L3_39 = 1
  L0_36, L1_37 = _UPVALUE0_.networkprofileslistGet()
  if L0_36 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in configuring values in apProfileSSID page" .. L0_36)
    return _UPVALUE1_
  end
  for _FORV_7_, _FORV_8_ in pairs(L1_37) do
    L2_38[L3_39] = {}
    for _FORV_12_, _FORV_13_ in pairs(_UPVALUE2_) do
      L2_38[L3_39][_FORV_12_] = _FORV_8_[_FORV_13_]
    end
    L3_39 = L3_39 + 1
  end
  return L0_36, L2_38
end
