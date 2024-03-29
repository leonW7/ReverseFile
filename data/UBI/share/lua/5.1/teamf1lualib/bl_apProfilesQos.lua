local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.approfileqos", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/approfileqos_web")
L0_0 = require
L0_0("teamf1lualib/approfileqosconfig_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).profileId = 1
;({}).profileName = 2
;({}).radioMode = 3
;({}).radioName = 4
;({}).template = 5
;({}).apQosReturnCodes = 1
;({}).wmmMode = 2
;({}).apDataAIFS = 3
;({}).apDataCwMin = 4
;({}).apDataCwMax = 5
;({}).apDataMaxBurst = 6
;({}).apData1AIFS = 7
;({}).apData1CwMin = 8
;({}).apData1CwMax = 9
;({}).apData1MaxBurst = 10
;({}).apData2AIFS = 11
;({}).apData2CwMin = 12
;({}).apData2CwMax = 13
;({}).apData2MaxBurst = 14
;({}).apData3AIFS = 15
;({}).apData3CwMin = 16
;({}).apData3CwMax = 17
;({}).apData3MaxBurst = 18
;({}).stationDataAIFS = 19
;({}).stationDataCwMin = 20
;({}).stationDataCwMax = 21
;({}).stationDataTXOPLimit = 22
;({}).stationData1AIFS = 23
;({}).stationData1CwMin = 24
;({}).stationData1CwMax = 25
;({}).stationData1TXOPLimit = 26
;({}).stationData2AIFS = 27
;({}).stationData2CwMin = 28
;({}).stationData2CwMax = 29
;({}).stationData2TXOPLimit = 30
;({}).stationData3AIFS = 31
;({}).stationData3CwMin = 32
;({}).stationData3CwMax = 33
;({}).stationData3TXOPLimit = 34
function apProfileQosGet()
  local L0_1, L1_2, L2_3, L3_4
  L2_3 = {}
  L3_4 = 1
  L0_1, L1_2 = _UPVALUE0_.approfileQosGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in configuring values in apProfilesQos page" .. L0_1)
    return _UPVALUE1_
  end
  for _FORV_7_, _FORV_8_ in pairs(L1_2) do
    L2_3[L3_4] = {}
    for _FORV_12_, _FORV_13_ in pairs(_UPVALUE2_) do
      if _FORV_12_ == _UPVALUE3_ then
        L2_3[L3_4][_FORV_12_] = _UPVALUE4_[_FORV_8_[_FORV_13_] + _UPVALUE5_]
      else
        L2_3[L3_4][_FORV_12_] = _FORV_8_[_FORV_13_]
      end
    end
    L3_4 = L3_4 + 1
  end
  return L0_1, L2_3
end
function apProfileQosCurrentGet(A0_5)
  local L1_6, L2_7, L3_8
  L3_8 = {}
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for apProfilesQos page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_5.profileId == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if A0_5.radioMode == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_6, L2_7 = _UPVALUE1_.approfileqosConfigGet(A0_5)
  if L1_6 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in apProfilesQos page" .. L1_6)
    return _UPVALUE0_.FAILURE
  end
  for _FORV_7_, _FORV_8_ in pairs(_UPVALUE2_) do
    L3_8[_FORV_7_] = L2_7[_FORV_8_]
  end
  return L1_6, L3_8
end
function apProfileQosSet(A0_9)
  local L1_10, L2_11, L3_12
  L3_12 = {}
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for apProfilesQos page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_9.profileId == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  A0_9.profileId = tonumber(A0_9.profileId)
  if A0_9.radioMode == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  A0_9.radioMode = tonumber(A0_9.radioMode)
  if A0_9.template == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  A0_9.template = tonumber(A0_9.template)
  if A0_9.template == _UPVALUE1_ then
    for _FORV_7_, _FORV_8_ in pairs(A0_9) do
      if _FORV_8_ == _UPVALUE0_.NIL then
        util.appendDebugOut("Set : Invalid Data")
        return _UPVALUE0_.BAD_PARAMETER
      else
        A0_9[_FORV_7_] = tonumber(A0_9[_FORV_7_])
      end
    end
  else
    if A0_9.wmmMode == _UPVALUE0_.NIL then
      util.appendDebugOut("Set : Invalid Data")
      return _UPVALUE0_.BAD_PARAMETER
    end
    A0_9.wmmMode = tonumber(A0_9.wmmMode)
  end
  A0_9.template = _UPVALUE2_[A0_9.template]
  L1_10 = _UPVALUE3_.approfileqosConfigSet(A0_9)
  if L1_10 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in apProfilesQos page" .. L1_10)
    return _UPVALUE0_.FAILURE
  end
  return L1_10
end
