local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.apfirmware", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/apfirmwaredownload_web")
L0_0 = require
L0_0("teamf1lualib/apfirmwareconfig_web")
L0_0 = require
L0_0("teamf1lualib/apfirmwareglobalstatus_web")
L0_0 = require
L0_0("teamf1lualib/wlan_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).txnResult = 1
;({}).serverAddr = 2
;({}).filePath1 = 3
;({}).fileName1 = 4
;({}).filePath2 = 5
;({}).fileName2 = 6
;({}).filePath3 = 7
;({}).fileName3 = 8
;({}).filePath4 = 9
;({}).fileName4 = 10
;({}).groupsize = 11
;({}).imageType = 12
;({}).imageType = 1
;({}).macAddress = 2
;({}).ipAddress = 3
;({}).location = 4
function apFirmwareLocationGet()
  local L0_1, L1_2, L2_3
  L2_3 = {}
  L1_2, apFirmwareLocationInfo = _UPVALUE0_.apfirmwareDownloadGet()
  if L1_2 ~= _UPVALUE1_.SUCCESS then
    return L1_2
  end
  for _FORV_6_, _FORV_7_ in pairs(_UPVALUE2_) do
    L2_3[_FORV_6_] = apFirmwareLocationInfo[_FORV_7_]
  end
  return L1_2, L2_3
end
function apFirmwareLocationSet(A0_4)
  local L1_5, L2_6
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for apSoftwareDownload page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_5 = _UPVALUE1_.apfirmwareDownloadSet(A0_4)
  if L1_5 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in apSoftwareDownload page" .. L1_5)
    return L1_5
  end
  return L1_5
end
function manageApGet()
  local L0_7, L1_8, L2_9
  L2_9 = {}
  rowId = 1
  L1_8, L0_7 = _UPVALUE0_.apfirmwareconfigGet()
  if L1_8 ~= _UPVALUE1_.SUCCESS then
    if L1_8 == _UPVALUE2_.MANAGE_AP_NIL_FOR_UPGRADE then
      return _UPVALUE1_.SUCCESS
    else
      return L1_8
    end
  end
  for _FORV_6_, _FORV_7_ in pairs(L0_7) do
    L2_9[rowId] = {}
    for _FORV_11_, _FORV_12_ in pairs(_UPVALUE3_) do
      L2_9[rowId][_FORV_11_] = _FORV_7_[_FORV_12_]
    end
    rowId = rowId + 1
  end
  return L1_8, L2_9
end
function apFirmwareUpgradeStart(A0_10)
  local L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18, L9_19, L10_20, L11_21, L12_22, L13_23
  if L9_19 ~= 0 then
    L9_19(L10_20)
    return L9_19
  end
  L2_12 = #A0_10
  for L12_22, L13_23 in L9_19(L10_20) do
    if _UPVALUE1_ == tonumber(L13_23) then
      L2_12 = _UPVALUE1_
    end
  end
  if L2_12 ~= L9_19 then
    L4_14 = A0_10[1]
    L5_15 = A0_10[2]
    L6_16 = A0_10[3]
    L7_17 = A0_10[4]
    L8_18 = A0_10[5]
  end
  L12_22 = L5_15
  L13_23 = L6_16
  L3_13 = L10_20
  L1_11 = L9_19
  if L1_11 ~= L9_19 then
    L9_19(L10_20)
    return L1_11
  end
  return L1_11
end
function apFirmwareUpgradeAbort()
  local L0_24, L1_25
  L0_24, L1_25 = _UPVALUE0_.apfirmwareDownloadAbort()
  if L0_24 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in configuring values in apSoftwareDownload page" .. L0_24)
    return L0_24, L1_25
  end
  return L0_24, L1_25
end
