local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.managedaplist", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/managedaplist_web")
L0_0 = require
L0_0("teamf1lualib/neighboraps_web")
L0_0 = require
L0_0("teamf1lualib/neighborclients_web")
L0_0 = require
L0_0("teamf1lualib/vapdetails_web")
L0_0 = require
L0_0("teamf1lualib/apdetails_web")
L0_0 = require
L0_0("teamf1lualib/apradiodetails_web")
L0_0 = require
L0_0("teamf1lualib/managedapstatistics_web")
L0_0 = require
L0_0("teamf1lualib/radiostatistics_web")
L0_0 = require
L0_0("teamf1lualib/apvapstatistics_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).apMacAddr = 1
;({}).ipAddr = 2
;({}).model = 3
;({}).firmwareVersion = 4
;({}).apLocation = 5
;({}).apStatus = 6
;({}).apConfigStatus = 7
;({}).apMacAddr = 1
;({}).ssid = 2
;({}).rssi = 3
;({}).status = 4
;({}).age = 5
;({}).radio = 6
;({}).macAddress = 1
;({}).rssi = 2
;({}).channel = 3
;({}).discoveryReason = 4
;({}).age = 5
;({}).radio = 6
;({}).vapId = 1
;({}).vapMode = 2
;({}).bssid = 3
;({}).ssid = 4
;({}).clients = 5
;({}).channel = 1
;({}).authenticatedClients = 2
;({}).channelBandwidth = 3
;({}).transmitPower = 4
;({}).fixedChannelIndicator = 5
;({}).fixedPowerIndicator = 6
;({}).manualChannelAdjustmentStatus = 7
;({}).manualPowerAdjustmentStatus = 8
;({}).WLANUtilization = 9
;({}).totalNeighbors = 10
;({}).radioResourceMgmt = 11
;({}).totalSupportedChannels = 12
;({}).supportedChannelsList = 13
;({}).supportedChannel = 1
;({}).detectionEnabled = 2
;({}).detectionStatus = 3
;({}).timeStamp = 4
;({}).ipAddress = 1
;({}).managingController = 2
;({}).ipSubnetMask = 3
;({}).controllerMacAddress = 4
;({}).status = 5
;({}).controllerIPAddress = 6
;({}).softwareVersion = 7
;({}).profile = 8
;({}).codeDownloadStatus = 9
;({}).discoveryReason = 10
;({}).configurationStatus = 11
;({}).protocol = 12
;({}).vendorID = 13
;({}).authenticatedClients = 14
;({}).partNumber = 15
;({}).systemUptime = 16
;({}).serialNumber = 17
;({}).age = 18
;({}).hardwareType = 19
;({}).radioIndex = 1
;({}).radioMode1 = 2
;({}).radioMode2 = 3
;({}).location = 4
;({}).hwType = 5
;({}).macAddress = 1
;({}).location = 2
;({}).radioIndex = 3
;({}).radioMode1 = 4
;({}).radioMode2 = 5
;({}).hwType = 6
;({}).WLANPKTSRCVD = 1
;({}).WLANPKTSSENT = 2
;({}).WLANBYTESRCVD = 3
;({}).WLANBYTESSENT = 4
;({}).WLANPKTSRCVDDROP = 5
;({}).WLANPKTSSENTDROP = 6
;({}).WLANBYTESRCVDDROP = 7
;({}).WLANBYTESSENTDROP = 8
;({}).ETHERNETPKTSRCVD = 9
;({}).ETHERNETPKTSSENT = 10
;({}).ETHERNETBYTESRCVD = 11
;({}).ETHERNETBYTESSENT = 12
;({}).MULTICASTPKTSRCVD = 13
;({}).TOTALRCVDERRORS = 14
;({}).TOTALSENTERRORS = 15
;({}).ARPRQSTSCONVERTED = 16
;({}).FILTEREDARPREQ = 17
;({}).BROADCASEARPREQ = 18
;({}).PKTSRCVD = 1
;({}).PKTSTX = 2
;({}).BYTESRCVD = 3
;({}).BYTESTX = 4
;({}).PKTSRCVDDROPPED = 5
;({}).PKTSTXDROPPED = 6
;({}).BYTESRCVDDROPPED = 7
;({}).BYTESTXDROPPED = 8
;({}).FRAGMENTSRCVD = 9
;({}).FRAGMENTSTX = 10
;({}).MULTICASTFRAMESRCVD = 11
;({}).MULTICASTFRAMESTX = 12
;({}).DUPLICATEFRAMECOUNT = 13
;({}).FAILEDTRANSMITCOUNT = 14
;({}).TRANSMITRETRYCOUNT = 15
;({}).MULTIPLERETRYCOUNT = 16
;({}).RTSSUCCESSCOUNT = 17
;({}).RTSFAILURECOUNT = 18
;({}).ACKFAILURECOUNT = 19
;({}).FCSERRORCOUNT = 20
;({}).FRAMESTRANSMITTED = 21
;({}).WEPUNDECRYPTABLECOUNT = 22
;({}).location = 1
;({}).radioIndex = 2
;({}).radio1 = 3
;({}).radio2 = 4
;({}).hwType = 5
;({}).PKTSRCVD = 1
;({}).PKTSTX = 2
;({}).BYTESRCVD = 3
;({}).BYTESTX = 4
;({}).PKTSRCVDDROPPED = 5
;({}).PKTSTXDROPPED = 6
;({}).BYTESRCVDDROPPED = 7
;({}).BYTESTXDROPPED = 8
;({}).ASSOCIATIONFAILURES = 9
;({}).AUTHENTICATIONFAILURES = 10
;({}).location = 1
;({}).radioIndex = 2
;({}).vapId = 3
;({}).radio1 = 4
;({}).radio2 = 5
;({}).hwType = 6
function managedApsListGet()
  local L0_1, L1_2, L2_3, L3_4
  L3_4 = {}
  L1_2, L0_1 = _UPVALUE0_.managedaplistGet()
  if L1_2 ~= _UPVALUE1_.SUCCESS then
    return L1_2
  end
  L2_3 = 1
  if L0_1 ~= _UPVALUE1_.NIL then
    for _FORV_7_, _FORV_8_ in pairs(L0_1) do
      L3_4[L2_3] = {}
      for _FORV_12_, _FORV_13_ in pairs(_UPVALUE2_) do
        L3_4[L2_3][_FORV_12_] = _FORV_8_[_FORV_13_]
      end
      L2_3 = L2_3 + 1
    end
  end
  return L1_2, L3_4
end
function managedApDelete(A0_5)
  local L1_6, L2_7
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for managedAps page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L2_7 = A0_5["managedAps.checkbox"]
  if L2_7 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_6 = _UPVALUE1_.managedaplistDelete(L2_7)
  if L1_6 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in managedAps page" .. L1_6)
  end
  return L1_6
end
function managedApDeleteAll()
  local L0_8
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for managedAps page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L0_8 = _UPVALUE1_.managedaplistDeleteAll()
  if L0_8 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in managedAps page" .. L0_8)
  end
  return L0_8
end
function neighbourApsListGet(A0_9)
  local L1_10, L2_11, L3_12, L4_13, L5_14
  L5_14 = {}
  L4_13 = A0_9.configRowId
  if L4_13 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L2_11, L1_10 = _UPVALUE1_.neighborapsGet(L4_13)
  if L2_11 ~= _UPVALUE0_.SUCCESS then
    return L2_11
  end
  L3_12 = 1
  for _FORV_9_, _FORV_10_ in pairs(L1_10) do
    L5_14[L3_12] = {}
    for _FORV_14_, _FORV_15_ in pairs(_UPVALUE2_) do
      L5_14[L3_12][_FORV_14_] = _FORV_10_[_FORV_15_]
    end
    L3_12 = L3_12 + 1
  end
  return L2_11, L5_14
end
function neighbourClientsListGet(A0_15)
  local L1_16, L2_17, L3_18, L4_19, L5_20
  L5_20 = {}
  L4_19 = A0_15.configRowId
  if L4_19 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L2_17, L1_16 = _UPVALUE1_.neighborclientsGet(L4_19)
  if L2_17 ~= _UPVALUE0_.SUCCESS then
    return L2_17
  end
  L3_18 = 1
  for _FORV_9_, _FORV_10_ in pairs(L1_16) do
    L5_20[L3_18] = {}
    for _FORV_14_, _FORV_15_ in pairs(_UPVALUE2_) do
      L5_20[L3_18][_FORV_14_] = _FORV_10_[_FORV_15_]
    end
    L3_18 = L3_18 + 1
  end
  return L2_17, L5_20
end
function vapDetailsGet(A0_21)
  local L1_22, L2_23, L3_24, L4_25, L5_26, L6_27, L7_28, L8_29
  L7_28 = {}
  L8_29 = {}
  L4_25 = A0_21.ModelName
  if L4_25 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L5_26 = A0_21.radioIndex
  if L5_26 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L5_26 = tonumber(L5_26)
  L2_23, L6_27, L1_22 = _UPVALUE1_.vapdetailsGet(L4_25, L5_26)
  if L2_23 ~= _UPVALUE0_.SUCCESS then
    return L2_23
  end
  for _FORV_12_, _FORV_13_ in pairs(_UPVALUE2_) do
    L7_28[_FORV_12_] = L6_27[_FORV_13_]
  end
  L3_24 = 1
  for _FORV_12_, _FORV_13_ in pairs(L1_22) do
    L8_29[L3_24] = {}
    for _FORV_17_, _FORV_18_ in pairs(_UPVALUE3_) do
      L8_29[L3_24][_FORV_17_] = _FORV_13_[_FORV_18_]
    end
    L3_24 = L3_24 + 1
  end
  return L2_23, L8_29, L7_28
end
function managedApsDetailGet(A0_30)
  local L1_31, L2_32, L3_33
  L3_33 = {}
  apMacAddress = A0_30.ModelName
  if apMacAddress == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L2_32, L1_31 = _UPVALUE1_.apdetailsGet(_UPVALUE2_, apMacAddress)
  if L2_32 ~= _UPVALUE0_.SUCCESS then
    return L2_32
  end
  for _FORV_7_, _FORV_8_ in pairs(_UPVALUE3_) do
    if _FORV_8_ == _UPVALUE4_ then
      L3_33[_FORV_7_] = _UPVALUE5_[_UPVALUE6_ + L1_31[_FORV_8_]]
    elseif _FORV_8_ == _UPVALUE7_ then
      L3_33[_FORV_7_] = _UPVALUE8_[_UPVALUE6_ + L1_31[_FORV_8_]]
    elseif _FORV_8_ == _UPVALUE9_ then
      L3_33[_FORV_7_] = _UPVALUE10_[_UPVALUE6_ + L1_31[_FORV_8_]]
    elseif _FORV_8_ == _UPVALUE11_ then
      L3_33[_FORV_7_] = _UPVALUE12_[_UPVALUE6_ + L1_31[_FORV_8_]]
    elseif _FORV_8_ == _UPVALUE13_ then
      L3_33[_FORV_7_] = _UPVALUE10_[_UPVALUE6_ + L1_31[_FORV_8_]]
    else
      L3_33[_FORV_7_] = L1_31[_FORV_8_]
    end
  end
  return L2_32, L3_33
end
function radiosDetailGet(A0_34)
  local L1_35, L2_36, L3_37, L4_38, L5_39, L6_40, L7_41, L8_42, L9_43
  L3_37 = {}
  L4_38, L5_39 = nil, nil
  L6_40 = {}
  L7_41 = nil
  L8_42 = {}
  L9_43 = 1
  apMacAddress = A0_34.ModelName
  if apMacAddress == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L7_41 = A0_34.radioIndex
  if L7_41 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L7_41 = tonumber(L7_41)
  L2_36, L5_39, L1_35, L4_38 = _UPVALUE1_.apradiodetailsGet(apMacAddress, L7_41)
  if L2_36 ~= _UPVALUE0_.SUCCESS then
    return L2_36
  end
  for _FORV_13_, _FORV_14_ in pairs(_UPVALUE2_) do
    L6_40[_FORV_13_] = L5_39[_FORV_14_]
  end
  for _FORV_13_, _FORV_14_ in pairs(_UPVALUE3_) do
    if _UPVALUE4_ == _FORV_14_ then
      L3_37[_FORV_13_] = _UPVALUE5_[L1_35[_FORV_14_]]
    elseif _UPVALUE6_ == _FORV_14_ then
      L3_37[_FORV_13_] = _UPVALUE7_[L1_35[_FORV_14_] + _UPVALUE8_]
    elseif _UPVALUE9_ == _FORV_14_ then
      L3_37[_FORV_13_] = _UPVALUE7_[L1_35[_FORV_14_] + _UPVALUE8_]
    elseif _UPVALUE10_ == _FORV_14_ then
      L3_37[_FORV_13_] = _UPVALUE11_[L1_35[_FORV_14_] + _UPVALUE8_]
    else
      L3_37[_FORV_13_] = L1_35[_FORV_14_]
    end
  end
  for _FORV_13_, _FORV_14_ in pairs(L4_38) do
    L8_42[L9_43] = {}
    for _FORV_18_, _FORV_19_ in pairs(_UPVALUE12_) do
      if _FORV_19_ == _UPVALUE13_ then
        L8_42[L9_43][_FORV_18_] = _UPVALUE7_[_FORV_14_[_FORV_19_] + _UPVALUE8_]
      elseif _FORV_19_ == _UPVALUE14_ then
        L8_42[L9_43][_FORV_18_] = _UPVALUE7_[_FORV_14_[_FORV_19_] + _UPVALUE8_]
      else
        L8_42[L9_43][_FORV_18_] = _FORV_14_[_FORV_19_]
      end
    end
    L9_43 = L9_43 + 1
  end
  return L2_36, L6_40, L3_37, L8_42
end
function managedApReset(A0_44)
  local L1_45, L2_46
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for managedAps page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L2_46 = A0_44["managedAps.checkbox"]
  if L2_46 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_45 = _UPVALUE1_.managedaplistResetDissAssoc(_UPVALUE2_, L2_46)
  if L1_45 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in managedAps page" .. L1_45)
  end
  return L1_45
end
function managedApDisassociate(A0_47)
  local L1_48, L2_49
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for managedAps page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L2_49 = A0_47["managedAps.checkbox"]
  if L2_49 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_48 = _UPVALUE1_.managedaplistResetDissAssoc(_UPVALUE2_, L2_49)
  if L1_48 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in managedAps page" .. L1_48)
  end
  return L1_48
end
function managedApStatistic(A0_50)
  local L1_51, L2_52, L3_53, L4_54
  L3_53 = {}
  L4_54 = nil
  L2_52 = A0_50.ModelName
  if L2_52 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_51, L4_54 = _UPVALUE1_.managedapstatisticsGet(L2_52)
  if L1_51 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in managedAps page" .. L1_51)
    return L1_51
  end
  for _FORV_8_, _FORV_9_ in pairs(_UPVALUE2_) do
    L3_53[_FORV_8_] = L4_54[_FORV_9_]
  end
  return L1_51, L3_53
end
function radioStatsGet(A0_55)
  local L1_56, L2_57, L3_58, L4_59, L5_60, L6_61, L7_62
  L5_60 = {}
  L6_61 = {}
  L7_62 = nil
  L2_57 = A0_55.ModelName
  if L2_57 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L3_58 = A0_55.radioIndex
  if L3_58 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L3_58 = tonumber(L3_58)
  L1_56, L7_62, L4_59 = _UPVALUE1_.radiostatisticsGet(L2_57, L3_58)
  if L1_56 ~= _UPVALUE0_.SUCCESS then
    return L1_56
  end
  for _FORV_11_, _FORV_12_ in pairs(_UPVALUE2_) do
    L6_61[_FORV_11_] = L7_62[_FORV_12_]
  end
  for _FORV_11_, _FORV_12_ in pairs(_UPVALUE3_) do
    L5_60[_FORV_11_] = L4_59[_FORV_12_]
  end
  return L1_56, L6_61, L5_60
end
function apVapStatsGet(A0_63)
  local L1_64, L2_65, L3_66, L4_67, L5_68, L6_69, L7_70, L8_71, L9_72
  L7_70 = {}
  L8_71 = {}
  L9_72 = nil
  L2_65 = A0_63.ModelName
  if L2_65 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L3_66 = A0_63.radioIndex
  if L3_66 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L4_67 = A0_63.vapId
  if L3_66 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L3_66 = tonumber(L3_66)
  L4_67 = tonumber(L4_67)
  L1_64, L9_72, L5_68, L6_69 = _UPVALUE1_.apvapstatisticsGet(L2_65, L3_66, L4_67)
  if L1_64 ~= _UPVALUE0_.SUCCESS then
    return L1_64
  end
  for _FORV_13_, _FORV_14_ in pairs(_UPVALUE2_) do
    L8_71[_FORV_13_] = L9_72[_FORV_14_]
  end
  for _FORV_13_, _FORV_14_ in pairs(_UPVALUE3_) do
    L7_70[_FORV_13_] = L6_69[_FORV_14_]
  end
  return L1_64, L8_71, L7_70, L5_68
end
function managedApsClear(A0_73)
  local L1_74, L2_75, L3_76
  L2_75 = {}
  L3_76 = nil
  if A0_73 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_74 = _UPVALUE1_.neighborapsDelete(A0_73)
  if L1_74 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in managedAps page" .. L1_74)
    return L1_74
  end
  return L1_74
end
