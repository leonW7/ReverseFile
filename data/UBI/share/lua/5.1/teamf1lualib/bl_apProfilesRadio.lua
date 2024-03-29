local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.approfileradio", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/approfileradio_web")
L0_0 = require
L0_0("teamf1lualib/approfileradioconfig_web")
L0_0 = require
L0_0("teamf1lualib/wlan_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).profileId = 1
;({}).profileName = 2
;({}).hwType = 3
;({}).radioMode = 4
;({}).radioStatus = 5
;({}).rfScanStatus = 6
;({}).initialPower = 7
;({}).maxClients = 8
;({}).radioIndex = 9
;({}).supportedChannels = 10
;({}).minimumPower = 11
;({}).STATE = 1
;({}).RTSTHRESHOLD = 2
;({}).LOADBALANCING = 3
;({}).LOADUTILIZATION = 4
;({}).MAXCLIENTS = 5
;({}).RFSCANOTHERCHANNELS = 6
;({}).RFSCANSENTRY = 7
;({}).OPERTINGMODE = 8
;({}).DTIMPERIOD = 9
;({}).BEACONINTERVAL = 10
;({}).AUTOCHANNEL = 11
;({}).AUTOPOWER = 12
;({}).INITIALPOWER = 13
;({}).APSDMODE = 14
;({}).RFSCANINTERVAL = 15
;({}).FRAGTHRESHOLD = 16
;({}).RFSCANSENTRYCHANNEL_A = 17
;({}).RFSCANSENTRYCHANNEL_B = 18
;({}).SHORTRETRIES = 19
;({}).RFSCANDURATION = 20
;({}).LONGRETRIES = 21
;({}).RATELIMITING = 22
;({}).TRANSITLIFETIME = 23
;({}).RATELIMITPKTS = 24
;({}).RECIEVELIFETIME = 25
;({}).RATELIMITPKTSBURST = 26
;({}).STATIONISOLATION = 27
;({}).CHANNELBANDWIDTH = 28
;({}).PRIMARYCHANNEL = 29
;({}).PROTECTION = 30
;({}).SGI = 31
;({}).STBC = 32
;({}).RRM = 33
;({}).NOACK = 34
;({}).MULTICASTTXRATE = 35
;({}).radioSupported = 36
;({}).totalEligibleChannels = 37
;({}).totalBasicRatesCount = 38
;({}).MINIMUMPOWER = 39
function apProfileRadioGet()
  local L0_1, L1_2, L2_3, L3_4
  L2_3 = {}
  L3_4 = 1
  L0_1, L1_2 = _UPVALUE0_.approfileradioGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in configuring values in apProfileRadio page" .. L0_1)
    return L0_1
  end
  for _FORV_7_, _FORV_8_ in pairs(L1_2) do
    L2_3[L3_4] = {}
    for _FORV_12_, _FORV_13_ in pairs(_UPVALUE2_) do
      if _FORV_13_ == _UPVALUE3_ then
        if _FORV_8_[_FORV_13_] == _UPVALUE4_ then
          L2_3[L3_4][_FORV_12_] = _UPVALUE5_
        else
          L2_3[L3_4][_FORV_12_] = _UPVALUE6_
        end
      elseif _FORV_13_ == _UPVALUE7_ then
        if _FORV_8_[_FORV_13_] == _UPVALUE4_ then
          L2_3[L3_4][_FORV_12_] = _UPVALUE8_
        else
          L2_3[L3_4][_FORV_12_] = _UPVALUE9_
        end
      else
        L2_3[L3_4][_FORV_12_] = _FORV_8_[_FORV_13_]
      end
    end
    L3_4 = L3_4 + 1
  end
  return L0_1, L2_3
end
function apProfileRadioCurrentGet(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14, L10_15, L11_16, L12_17, L13_18, L14_19
  L3_8 = {}
  L4_9 = 1
  L5_10, L6_11 = nil, nil
  L7_12 = {}
  L8_13 = {}
  L5_10 = A0_5.profileId
  L6_11 = A0_5.radioIndex
  if L5_10 ~= L9_14 then
  elseif L6_11 == L9_14 then
    L9_14(L10_15)
    return L9_14
  end
  L5_10 = L9_14
  L6_11 = L9_14
  L8_13 = L12_17
  L7_12 = L11_16
  L2_7 = L10_15
  L1_6 = L9_14
  if L1_6 ~= L9_14 then
    L9_14(L10_15)
    return L9_14
  end
  for L12_17, L13_18 in L9_14(L10_15) do
    L14_19 = L2_7[L13_18]
    L3_8[L12_17] = L14_19
  end
  for L12_17, L13_18 in L9_14(L10_15) do
    L14_19 = L2_7[L13_18]
    L3_8[L12_17] = L14_19
  end
  if L9_14 == L10_15 then
    return L9_14
  end
  for L14_19 in L11_16(L12_17, L13_18) do
    if tonumber(L14_19) == 1 then
      L9_14.AMODE = _UPVALUE4_
    elseif tonumber(L14_19) == 2 then
      L9_14.BGMODE = _UPVALUE4_
    elseif tonumber(L14_19) == 3 then
      L9_14.ANMODE = _UPVALUE4_
    elseif tonumber(L14_19) == 4 then
      L9_14.BGNMODE = _UPVALUE4_
    elseif tonumber(L14_19) == 5 then
      L9_14.fiveAMODE = _UPVALUE4_
    elseif tonumber(L14_19) == 6 then
      L9_14.twoBgMODE = _UPVALUE4_
    elseif tonumber(L14_19) == 7 then
      L9_14.ANACMODE = _UPVALUE4_
    elseif tonumber(L14_19) == 8 then
      L9_14.NACMODE = _UPVALUE4_
    end
  end
  L14_19 = L8_13
  return L11_16, L12_17, L13_18, L14_19, L9_14
end
function apProfileRadioSet(A0_20)
  local L1_21, L2_22, L3_23, L4_24, L5_25, L6_26, L7_27, L8_28, L9_29, L10_30, L11_31, L12_32, L13_33, L14_34, L15_35
  L3_23 = {}
  L4_24 = {}
  L5_25 = {}
  L6_26 = {}
  L7_27 = {}
  L8_28 = {}
  L9_29 = ""
  L10_30 = ""
  if L11_31 ~= 0 then
    L11_31(L12_32)
    return L11_31
  end
  if L11_31 == L12_32 then
    L11_31(L12_32)
    return L11_31
  end
  A0_20.profileId = L11_31
  if L11_31 == L12_32 then
    L11_31(L12_32)
    return L11_31
  end
  A0_20.radioIndex = L11_31
  for L14_34, L15_35 in L11_31(L12_32) do
    if L14_34 ~= _UPVALUE2_ and L14_34 ~= _UPVALUE3_ and L14_34 ~= _UPVALUE4_ and L14_34 ~= _UPVALUE5_ and L14_34 ~= _UPVALUE6_ and L14_34 ~= _UPVALUE7_ and L14_34 ~= _UPVALUE8_ and L14_34 ~= _UPVALUE9_ and L14_34 ~= _UPVALUE10_ and L14_34 ~= _UPVALUE11_ and L14_34 ~= _UPVALUE12_ then
      if A0_20[L14_34] == _UPVALUE0_.NIL then
        util.appendDebugOut("Set : Invalid Data")
        return _UPVALUE0_.BAD_PARAMETER
      else
        A0_20[L14_34] = tonumber(A0_20[L14_34])
      end
    end
  end
  if L11_31 == L12_32 then
    if L11_31 == L12_32 then
      return L11_31
    else
      A0_20.LOADUTILIZATION = L11_31
    end
  end
  if L11_31 == L12_32 then
    if L11_31 ~= L12_32 then
    else
      if L11_31 == L12_32 then
        return L11_31
    end
    else
      A0_20.RATELIMITPKTS = L11_31
      A0_20.RATELIMITPKTSBURST = L11_31
    end
  end
  if L11_31 == L12_32 then
    if L11_31 ~= L12_32 then
    else
      if L11_31 == L12_32 then
        return L11_31
    end
    else
      A0_20.RFSCANSENTRYCHANNEL_A = L11_31
      A0_20.RFSCANSENTRYCHANNEL_B = L11_31
    end
  end
  if L11_31 == L12_32 then
    if L11_31 == L12_32 then
      return L11_31
    else
      A0_20.RFSCANINTERVAL = L11_31
    end
  end
  if L11_31 ~= L12_32 then
  elseif L11_31 == L12_32 then
    if L11_31 == L12_32 then
      return L11_31
    else
      A0_20.RFSCANDURATION = L11_31
    end
  end
  if L11_31 == L12_32 then
    if L11_31 == L12_32 then
      return L11_31
    end
  end
  if L11_31 ~= L12_32 then
    eligiblieChannel = L12_32
    L1_21 = L11_31
    if L1_21 ~= L11_31 then
      return L11_31
    end
    for L14_34, L15_35 in L11_31(L12_32) do
      L15_35[2] = 0
    end
    if L11_31 ~= "string" then
      for L14_34, L15_35 in L11_31(L12_32) do
        for _FORV_19_, _FORV_20_ in pairs(eligiblieChannel) do
          if _FORV_20_[1] == tonumber(L15_35) then
            _FORV_20_[2] = 1
            break
          end
        end
      end
    else
      for L14_34, L15_35 in L11_31(L12_32) do
        if L15_35[1] == tonumber(A0_20.autoEligibleChannels) then
          L15_35[2] = 1
          break
        end
      end
    end
    for L14_34, L15_35 in L11_31(L12_32) do
      if L9_29 == "" then
        L9_29 = L15_35[1] .. "," .. L15_35[2]
      else
        L9_29 = L9_29 .. "," .. L15_35[1] .. "," .. L15_35[2]
      end
    end
  end
  if L11_31 == L12_32 then
    return L11_31
  end
  if L11_31 == L12_32 then
    return L11_31
  end
  L14_34 = L11_31(L12_32, L13_33)
  L6_26 = L14_34
  L8_28 = L13_33
  L7_27 = L12_32
  L1_21 = L11_31
  if L1_21 ~= L11_31 then
    return L11_31
  end
  for L14_34, L15_35 in L11_31(L12_32) do
    L15_35[1] = L15_35[1] * 10
    L15_35[2] = 0
    L15_35[3] = 0
  end
  if L11_31 ~= "string" then
    for L14_34, L15_35 in L11_31(L12_32) do
      for _FORV_19_, _FORV_20_ in pairs(L6_26) do
        if _FORV_20_[1] == tonumber(L15_35) * 10 then
          _FORV_20_[2] = 1
          break
        end
      end
    end
  else
    for L14_34, L15_35 in L11_31(L12_32) do
      if L15_35[1] == tonumber(A0_20.basicRateSets) * 10 then
        L15_35[2] = 1
        break
      end
    end
  end
  if L11_31 ~= "string" then
    for L14_34, L15_35 in L11_31(L12_32) do
      for _FORV_19_, _FORV_20_ in pairs(L6_26) do
        if _FORV_20_[1] == tonumber(L15_35) * 10 then
          _FORV_20_[3] = 1
          break
        end
      end
    end
  else
    for L14_34, L15_35 in L11_31(L12_32) do
      if L15_35[1] == tonumber(A0_20.supportRateSets) * 10 then
        L15_35[3] = 1
        break
      end
    end
  end
  for L14_34, L15_35 in L11_31(L12_32) do
    if L10_30 == "" then
      L10_30 = L15_35[1] .. "," .. L15_35[2] .. "," .. L15_35[3]
    else
      L10_30 = L10_30 .. "," .. L15_35[1] .. "," .. L15_35[2] .. "," .. L15_35[3]
    end
  end
  A0_20.channelsTable = L9_29
  A0_20.ratesTable = L10_30
  L1_21 = L11_31
  if L1_21 ~= L11_31 then
    if L1_21 == L11_31 then
      return L11_31
    else
      return L1_21
    end
  end
  return L1_21
end
function apProfileEligibleChannelGet(A0_36)
  local L1_37, L2_38, L3_39, L4_40, L5_41, L6_42, L7_43
  L2_38 = {}
  if A0_36 == L3_39 then
    return L3_39
  end
  for L6_42, L7_43 in L3_39(L4_40) do
    if L7_43 == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
    A0_36[L6_42] = tonumber(L7_43)
  end
  L2_38 = L4_40
  L1_37 = L3_39
  if L1_37 ~= L3_39 then
    L3_39(L4_40)
    return L3_39
  end
  return L3_39, L4_40
end
