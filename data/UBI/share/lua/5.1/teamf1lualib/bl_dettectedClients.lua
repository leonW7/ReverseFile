local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.detectedclients", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wlanassociateddetectedclients_web")
L0_0 = require
L0_0("teamf1lualib/wlandetectedclientdetails_web")
L0_0 = require
L0_0("teamf1lualib/clientroamhistoryshow_web")
L0_0 = require
L0_0("teamf1lualib/wlanclientstatistics_web")
L0_0 = require
L0_0("teamf1lualib/assocclientspreauthhistory_web")
L0_0 = require
L0_0("teamf1lualib/wlan_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).macAddress = 1
;({}).name = 2
;({}).status = 3
;({}).age = 4
;({}).createTime = 5
;({}).clientStatus = 1
;({}).authenticationStatus = 2
;({}).threatDetection = 3
;({}).threatMitigationStatus = 4
;({}).timeSinceEntryLastupdated = 5
;({}).timeSinceEntryCreate = 6
;({}).clientName = 7
;({}).RSSI = 8
;({}).signal = 9
;({}).noise = 10
;({}).probeReqRecorded = 11
;({}).probeCollectionInterval = 12
;({}).highestProbesDetected = 13
;({}).channel = 14
;({}).OUIDescription = 15
;({}).authMsgsRecorded = 16
;({}).authCollectionInterval = 17
;({}).highestAuthMsgs = 18
;({}).deAuthMsgsRecorded = 19
;({}).deAuthCollectionInterval = 20
;({}).highestDeAuthMsgs = 21
;({}).authenticationFailures = 22
;({}).probesDetected = 23
;({}).broadcastBSSIDProbes = 24
;({}).broadcastSSIDProbes = 25
;({}).specificBSSIDProbes = 26
;({}).specificSSIDProbes = 27
;({}).lastNonBroadcastBSSID = 28
;({}).lastNonBroadcastSSID = 29
;({}).threatMitigationSent = 30
;({}).apMacAddress = 1
;({}).radio = 2
;({}).vapMacAddress = 3
;({}).SSID = 4
;({}).status = 5
;({}).timeEvent = 6
;({}).PKTSRCVD = 1
;({}).PKTSSENT = 2
;({}).BYTESRCVD = 3
;({}).BYTESSENT = 4
;({}).PKTSRCVDDROP = 5
;({}).PKTSSENTDROP = 6
;({}).BYTESRCVDDROP = 7
;({}).BYTESSENTDROP = 8
;({}).FRAGSRCVD = 9
;({}).FRAGSSENT = 10
;({}).TRANSMITRETRIES = 11
;({}).TRANSMITRETRIESFAILED = 12
;({}).TSVIOLATEPKTSRCVD = 13
;({}).TSVIOLATEPKTSSENT = 14
;({}).DUPLICATESRECVD = 15
;({}).apMacAddress = 1
;({}).radio = 2
;({}).vapMac = 3
;({}).ssid = 4
;({}).age = 5
;({}).userName = 6
;({}).preAuthStatus = 7
function detectedClientsGet()
  local L0_1, L1_2, L2_3, L3_4
  L2_3 = {}
  L3_4 = 1
  L0_1, L1_2 = _UPVALUE0_.wlanassociateddetectedclientsGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in Getting values for the detected Clients page" .. L0_1)
    if _UPVALUE2_.NO_ASSOC_DETECTED_CLIENTS == L0_1 then
      return _UPVALUE1_.SUCCESS
    else
      return _UPVALUE1_.FAILURE
    end
  end
  for _FORV_7_, _FORV_8_ in pairs(L1_2) do
    L2_3[L3_4] = {}
    for _FORV_12_, _FORV_13_ in pairs(_UPVALUE3_) do
      L2_3[L3_4][_FORV_12_] = _FORV_8_[_FORV_13_]
    end
    L3_4 = L3_4 + 1
  end
  return L0_1, L2_3
end
function detectedClientsGet()
  local L0_5, L1_6, L2_7, L3_8
  L2_7 = {}
  L3_8 = 1
  L0_5, L1_6 = _UPVALUE0_.wlanassociateddetectedclientsGet()
  if L0_5 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in Getting values for the detected Clients page" .. L0_5)
    if _UPVALUE2_.NO_ASSOC_DETECTED_CLIENTS == L0_5 then
      return _UPVALUE1_.SUCCESS
    else
      return _UPVALUE1_.FAILURE
    end
  end
  for _FORV_7_, _FORV_8_ in pairs(L1_6) do
    L2_7[L3_8] = {}
    for _FORV_12_, _FORV_13_ in pairs(_UPVALUE3_) do
      L2_7[L3_8][_FORV_12_] = _FORV_8_[_FORV_13_]
    end
    L3_8 = L3_8 + 1
  end
  return L0_5, L2_7
end
function detectedClientsDetails(A0_9)
  local L1_10, L2_11, L3_12
  L3_12 = {}
  if A0_9 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_10, L2_11 = _UPVALUE1_.wlandetectedclientdetailsGet(A0_9)
  if L1_10 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in detectedClients page" .. L1_10)
    return L1_10
  end
  for _FORV_7_, _FORV_8_ in pairs(_UPVALUE2_) do
    L3_12[_FORV_7_] = L2_11[_FORV_8_]
  end
  return L1_10, L3_12
end
function wlanRoamDetails(A0_13)
  local L1_14, L2_15, L3_16, L4_17
  L3_16 = {}
  L4_17 = 1
  if A0_13 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_14, L2_15 = _UPVALUE1_.clientroamhistoryshowGet(A0_13)
  if L1_14 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in detectedClients page" .. L1_14)
    return L1_14
  end
  if #L2_15 ~= 0 then
    for _FORV_8_, _FORV_9_ in pairs(L2_15) do
      L3_16[L4_17] = {}
      for _FORV_13_, _FORV_14_ in pairs(_UPVALUE2_) do
        L3_16[L4_17][_FORV_13_] = _FORV_9_[_FORV_14_]
      end
      L4_17 = L4_17 + 1
    end
  end
  return L1_14, L3_16
end
function wlanRoamDelete(A0_18)
  local L1_19
  if A0_18 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_19 = _UPVALUE1_.clientroamhistoryDelete(A0_18)
  if L1_19 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in detectedClients page" .. L1_19)
    return L1_19
  end
  return L1_19
end
function wlanClientsStats(A0_20)
  local L1_21, L2_22, L3_23
  L3_23 = {}
  if A0_20 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_21, L2_22 = _UPVALUE1_.wlanclientstatisticsGet(A0_20)
  if L1_21 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in associatedClients page" .. L1_21)
    return L1_21
  end
  for _FORV_7_, _FORV_8_ in pairs(_UPVALUE2_) do
    L3_23[_FORV_7_] = L2_22[_FORV_8_]
  end
  return L1_21, L3_23
end
function preAuthHistory(A0_24)
  local L1_25, L2_26, L3_27, L4_28
  L1_25 = _UPVALUE0_
  L1_25 = L1_25.FAILURE
  L2_26 = nil
  L3_27 = 1
  L4_28 = {}
  if A0_24 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_25, L2_26 = _UPVALUE1_.assocclientspreauthhistoryGet(A0_24)
  if L1_25 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in associatedClients page" .. L1_25)
    return L1_25
  end
  if L2_26 ~= nil then
    for _FORV_8_, _FORV_9_ in pairs(L2_26) do
      L4_28[L3_27] = {}
      for _FORV_13_, _FORV_14_ in pairs(_UPVALUE2_) do
        L4_28[L3_27][_FORV_13_] = _FORV_9_[_FORV_14_]
      end
      L3_27 = L3_27 + 1
    end
  end
  return L1_25, L4_28
end
function wlanPreAuthDelete(A0_29)
  local L1_30
  if A0_29 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_30 = _UPVALUE1_.preAuthHistoryDelete(A0_29)
  if L1_30 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in detectedClients page" .. L1_30)
    return L1_30
  end
  return L1_30
end
