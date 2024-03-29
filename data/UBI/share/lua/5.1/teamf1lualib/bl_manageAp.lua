local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.manageap", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/manageap_web")
L0_0 = require
L0_0("teamf1lualib/managedchannellist_web")
L0_0 = require
L0_0("teamf1lualib/wlan_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).apMode = 1
;({}).location = 2
;({}).macAddress = 15
;({}).page = 17
;({}).authPasswordEnable = 3
;({}).authPassword = 4
;({}).profile = 5
;({}).radio1Channel = 6
;({}).radio1Power = 7
;({}).radio2Channel = 8
;({}).radio2Power = 9
;({}).expectedSsid = 10
;({}).expectedChannel = 11
;({}).wdsMode = 12
;({}).security = 13
;({}).networkMode = 14
;({}).profileId = 1
;({}).hwType = 2
;({}).profileName = 3
;({}).radio2ChannelCount = 4
;({}).radio1ChannelCount = 5
;({}).radio2Channels = 6
;({}).radio1Channels = 7
function manageApAdd(A0_1)
  local L1_2, L2_3
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for managedAps page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  for _FORV_6_, _FORV_7_ in pairs(_UPVALUE1_) do
    if A0_1[_FORV_6_] == _UPVALUE0_.NIL then
      util.appendDebugOut("Set : Invalid Data")
      return _UPVALUE0_.BAD_PARAMETER
    elseif tonumber(A0_1[_FORV_6_]) ~= _UPVALUE0_.NIL and _FORV_7_ ~= _UPVALUE2_ then
      A0_1[_FORV_6_] = tonumber(A0_1[_FORV_6_])
    end
  end
  if _UPVALUE3_ == A0_1.apMode then
    for _FORV_6_, _FORV_7_ in pairs(_UPVALUE4_) do
      if _UPVALUE5_ == A0_1.authPasswordEnable and A0_1[_FORV_6_] == _UPVALUE0_.NIL then
        util.appendDebugOut("Set : Invalid Data")
        return _UPVALUE0_.BAD_PARAMETER
      elseif _FORV_6_ ~= _UPVALUE6_ and A0_1[_FORV_6_] == _UPVALUE0_.NIL then
        util.appendDebugOut("Set : Invalid Data")
        return _UPVALUE0_.BAD_PARAMETER
      elseif tonumber(A0_1[_FORV_6_]) ~= _UPVALUE0_.NIL then
        A0_1[_FORV_6_] = tonumber(A0_1[_FORV_6_])
      end
    end
  elseif _UPVALUE7_ == A0_1.apMode then
    for _FORV_6_, _FORV_7_ in pairs(_UPVALUE8_) do
      if A0_1[_FORV_6_] == _UPVALUE0_.NIL then
        util.appendDebugOut("Set : Invalid Data")
        return _UPVALUE0_.BAD_PARAMETER
      elseif tonumber(A0_1[_FORV_6_]) ~= _UPVALUE0_.NIL then
        A0_1[_FORV_6_] = tonumber(A0_1[_FORV_6_])
      end
    end
  end
  L1_2, L2_3 = _UPVALUE9_.manageapSet(A0_1)
  if L1_2 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in managedAps page" .. L1_2)
    return L1_2
  end
  if L2_3 == _UPVALUE10_ then
    return _UPVALUE11_.AP_PROMT_MESSAGE_MANAGED, L2_3
  else
    return L1_2, L2_3
  end
end
function manageApGet(A0_4)
  local L1_5, L2_6, L3_7, L4_8
  L3_7 = {}
  L4_8 = nil
  L4_8 = A0_4["validAps.cookie"]
  if L4_8 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_5, L2_6 = _UPVALUE1_.manageapGet(L4_8)
  if L1_5 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Getting values for the validAps page" .. L1_5)
  end
  for _FORV_8_, _FORV_9_ in pairs(_UPVALUE2_) do
    L3_7[_FORV_8_] = L2_6[_FORV_9_]
  end
  if _UPVALUE3_ == L3_7.apMode then
    for _FORV_8_, _FORV_9_ in pairs(_UPVALUE4_) do
      L3_7[_FORV_8_] = L2_6[_FORV_9_]
    end
  elseif _UPVALUE5_ == L3_7.apMode then
    for _FORV_8_, _FORV_9_ in pairs(_UPVALUE6_) do
      L3_7[_FORV_8_] = L2_6[_FORV_9_]
    end
  end
  return L1_5, L3_7
end
function apProfileChannelsGet()
  local L0_9, L1_10, L2_11, L3_12, L4_13, L5_14, L6_15, L7_16, L8_17, L9_18, L10_19, L11_20, L12_21, L13_22, L14_23, L15_24, L16_25
  L2_11 = {}
  L3_12 = {}
  L4_13 = nil
  L5_14 = 1
  L4_13 = L8_17
  L1_10 = L7_16
  L0_9 = L6_15
  if L0_9 ~= L6_15 then
    L6_15(L7_16)
    return L0_9
  end
  for L9_18, L10_19 in L6_15(L7_16) do
    L3_12[L5_14] = L11_20
    for L14_23, L15_24 in L11_20(L12_21) do
      L16_25 = _UPVALUE4_
      if L15_24 == L16_25 then
        L16_25 = {}
        L3_12[L5_14][L14_23] = {}
        if L10_19[L15_24] ~= "" then
          L16_25 = util.split(L10_19[L15_24], ",")
        end
        L3_12[L5_14][L14_23][1] = {}
        L3_12[L5_14][L14_23][1].value = 0
        L3_12[L5_14][L14_23][1].name = "Auto"
        for _FORV_21_, _FORV_22_ in pairs(L16_25) do
          L3_12[L5_14][L14_23][1 + 1] = {}
          L3_12[L5_14][L14_23][1 + 1].value = _FORV_22_
          L3_12[L5_14][L14_23][1 + 1].name = _FORV_22_
        end
      else
        L16_25 = _UPVALUE5_
        if L15_24 == L16_25 then
          L16_25 = {}
          L3_12[L5_14][L14_23] = {}
          L16_25 = util.split(L10_19[L15_24], ",")
          L3_12[L5_14][L14_23][1] = {}
          L3_12[L5_14][L14_23][1].value = 0
          L3_12[L5_14][L14_23][1].name = "Auto"
          for _FORV_21_, _FORV_22_ in pairs(L16_25) do
            L3_12[L5_14][L14_23][1 + 1] = {}
            L3_12[L5_14][L14_23][1 + 1].value = _FORV_22_
            L3_12[L5_14][L14_23][1 + 1].name = _FORV_22_
          end
        else
          L16_25 = L3_12[L5_14]
          L16_25[L14_23] = L10_19[L15_24]
        end
      end
    end
    L5_14 = L5_14 + 1
  end
  return L6_15, L7_16, L8_17
end
function apProfileChannelsCurGet(A0_26)
  local L1_27, L2_28, L3_29, L4_30, L5_31, L6_32
  L4_30 = {}
  L5_31 = {}
  L6_32 = nil
  rowId = 1
  if A0_26 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L2_28, L1_27, L3_29 = apProfileChannelsGet()
  if L2_28 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in validAps page" .. L2_28)
    return L2_28
  end
  for _FORV_10_, _FORV_11_ in pairs(L1_27) do
    if _FORV_11_.profileId == A0_26 then
      L5_31 = _FORV_11_
    end
  end
  L4_30[rowId] = {}
  L4_30[rowId].value = 0
  L4_30[rowId].name = "Any"
  L6_32 = util.split(L3_29, ",")
  for _FORV_10_, _FORV_11_ in pairs(L6_32) do
    rowId = rowId + 1
    L4_30[rowId] = {}
    L4_30[rowId].value = _FORV_11_
    L4_30[rowId].name = _FORV_11_
  end
  return L2_28, L5_31, L4_30
end
