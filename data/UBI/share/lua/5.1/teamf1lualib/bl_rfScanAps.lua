local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.rfscanaps", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/rfscanaplist_web")
L0_0 = require
L0_0("teamf1lualib/apdetails_web")
L0_0 = require
L0_0("teamf1lualib/global_web")
L0_0 = require
L0_0("teamf1lualib/wlanaprogueclassficationlist_web")
L0_0 = require
L0_0("teamf1lualib/managedaplist_web")
L0_0 = require
L0_0("teamf1lualib/wlan_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).macAddress = 1
;({}).ssid = 2
;({}).mode = 3
;({}).channel = 4
;({}).age = 5
;({}).apStatus = 6
;({}).BSSID = 1
;({}).SSID = 2
;({}).physicalMode = 3
;({}).channel = 4
;({}).securityMode = 5
;({}).status = 6
;({}).dotNMode = 7
;({}).initialStatus = 8
;({}).beaconInterval = 9
;({}).transmitRate = 10
;({}).highestSupportedRate = 11
;({}).widsRogueAPMitigation = 12
;({}).peerManagedAP = 13
;({}).age = 14
;({}).adhocNetwork = 15
;({}).discoveredAge = 16
;({}).description = 1
;({}).conditionDetected = 2
;({}).reportingMacAddress = 3
;({}).radio = 4
;({}).testConfig = 5
;({}).testResult = 6
;({}).firstTimeStamp = 7
;({}).lastTimeStamp = 8
function rfScansApsGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  L2_3 = {}
  L3_4 = 1
  L4_5 = false
  L0_1, L1_2 = _UPVALUE0_.rfscanaplistGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in configuring values in rfScanAps page" .. L0_1)
    return _UPVALUE1_
  end
  for _FORV_8_, _FORV_9_ in pairs(L1_2) do
    L2_3[L3_4] = {}
    for _FORV_13_, _FORV_14_ in pairs(_UPVALUE2_) do
      if _FORV_14_ == _UPVALUE3_ and not L4_5 and _FORV_9_[_FORV_14_] == _UPVALUE4_ then
        L4_5 = true
      end
      L2_3[L3_4][_FORV_13_] = _FORV_9_[_FORV_14_]
    end
    L3_4 = L3_4 + 1
  end
  return L0_1, L2_3, L4_5
end
function rfScanApsDetailGet(A0_6)
  local L1_7, L2_8, L3_9
  L3_9 = {}
  apMacAddress = A0_6.MAC
  if apMacAddress == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L2_8, L1_7 = _UPVALUE1_.apdetailsGet(_UPVALUE2_, apMacAddress)
  if L2_8 ~= _UPVALUE0_.SUCCESS then
    return L2_8
  end
  for _FORV_7_, _FORV_8_ in pairs(_UPVALUE3_) do
    if _FORV_8_ == _UPVALUE4_ then
      L3_9[_FORV_7_] = global_web.getAPRadioPhyMode(L1_7[_FORV_8_])
    elseif _FORV_8_ == _UPVALUE5_ then
      L3_9[_FORV_7_] = _UPVALUE6_[L1_7[_FORV_8_] + _UPVALUE7_]
    elseif _FORV_8_ == _UPVALUE8_ then
      L3_9[_FORV_7_] = _UPVALUE9_[L1_7[_FORV_8_]]
    elseif _FORV_8_ == _UPVALUE10_ then
      L3_9[_FORV_7_] = _UPVALUE11_[L1_7[_FORV_8_] + _UPVALUE7_]
    elseif _FORV_8_ == _UPVALUE12_ then
      L3_9[_FORV_7_] = _UPVALUE9_[L1_7[_FORV_8_]]
    elseif _FORV_8_ == _UPVALUE13_ then
      L3_9[_FORV_7_] = _UPVALUE14_[L1_7[_FORV_8_] + _UPVALUE7_]
    elseif _FORV_8_ == _UPVALUE15_ then
      L3_9[_FORV_7_] = _UPVALUE16_[L1_7[_FORV_8_] + _UPVALUE7_]
    elseif _FORV_8_ == _UPVALUE17_ then
      L3_9[_FORV_7_] = _UPVALUE18_[L1_7[_FORV_8_] + _UPVALUE7_]
    else
      L3_9[_FORV_7_] = L1_7[_FORV_8_]
    end
  end
  return L2_8, L3_9
end
function rfScanApsClassificationGet(A0_10)
  local L1_11, L2_12, L3_13, L4_14
  L3_13 = {}
  L4_14 = 1
  apMacAddress = A0_10.MAC
  if apMacAddress == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L2_12, L1_11 = _UPVALUE1_.wlanaprogueclassficationlistGet(apMacAddress)
  if L2_12 ~= _UPVALUE0_.SUCCESS then
    return L2_12
  end
  for _FORV_8_, _FORV_9_ in pairs(L1_11) do
    L3_13[L4_14] = {}
    for _FORV_13_, _FORV_14_ in pairs(_UPVALUE2_) do
      L3_13[L4_14][_FORV_13_] = _FORV_9_[_FORV_14_]
    end
    L4_14 = L4_14 + 1
  end
  return L2_12, L3_13
end
function rfScanApsDeleteAll()
  local L0_15
  L0_15 = _UPVALUE0_.rfScanDelAck(_UPVALUE1_)
  if L0_15 ~= _UPVALUE2_.SUCCESS then
    return _UPVALUE3_.RF_SCAN_DEL_ERROR
  end
  return L0_15
end
function rfScanApsAcknowledge(A0_16, A1_17)
  local L2_18
  if A0_16 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if A1_17 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if A1_17 ~= _UPVALUE1_ then
    return _UPVALUE2_.RF_SCAN_ACK_NOT_ROGUE
  end
  L2_18 = _UPVALUE3_.rfScanDelAck(_UPVALUE4_, A0_16)
  if L2_18 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE2_.RF_SCAN_ACK_ERROR
  end
  return _UPVALUE2_.RF_SCAN_ACK_SUCCESS
end
function rfScanApsAcknowledgeAll()
  local L0_19
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for rfScanAPs page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L0_19 = _UPVALUE1_.rfScanDelAck(_UPVALUE2_)
  if L0_19 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE3_.RF_SCAN_ACK_ERROR
  end
  return _UPVALUE3_.RF_SCAN_ACK_ALL_SUCCESS
end
