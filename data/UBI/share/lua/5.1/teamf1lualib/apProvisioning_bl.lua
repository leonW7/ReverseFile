local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.apProvisioning", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/approvisioningshow_web")
L0_0 = require
L0_0("teamf1lualib/approvisioningconfig_web")
L0_0 = require
L0_0("teamf1lualib/wlan_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).apMac = 1
;({}).apIp = 2
;({}).primaryIp = 3
;({}).backupIp = 4
;({}).newPrimaryIp = 5
;({}).newBackupIp = 6
;({}).status = 7
;({}).msg = 1
;({}).apMac = 2
;({}).apIp = 3
;({}).age = 4
;({}).primaryIp = 5
;({}).backupIp = 6
;({}).mutualAuthMode = 7
;({}).unManagedMode = 8
;({}).status = 9
;({}).certificationProfileTransmitStatus = 10
;({}).newPrimaryIp = 11
;({}).newBackupIp = 12
;({}).apProfile = 13
function apProvisioningSectionGet()
  local L0_1, L1_2, L2_3, L3_4
  L2_3 = {}
  L3_4 = 1
  L0_1, L1_2 = _UPVALUE0_.approvisioningshowGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  if L1_2 ~= nil then
    for _FORV_7_, _FORV_8_ in pairs(L1_2) do
      L2_3[L3_4] = {}
      for _FORV_12_, _FORV_13_ in pairs(_UPVALUE2_) do
        L2_3[L3_4][_FORV_12_] = _FORV_8_[_FORV_13_]
      end
      L3_4 = L3_4 + 1
    end
    return L0_1, L2_3
  else
    return L0_1
  end
end
function apProvisioningSectionDelete(A0_5)
  local L1_6
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for apProvisioning page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_6 = _UPVALUE1_.approvisioningshowDelete(A0_5)
  if L1_6 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in apProvisioning page" .. L1_6)
  end
  return L1_6
end
function apProvisioningSectionDeleteAll()
  local L0_7
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for apProvisioning page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L0_7 = _UPVALUE1_.approvisioningshowDeleteAll()
  if L0_7 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in apProvisioning page" .. L0_7)
  end
  return L0_7
end
function doApProvisioning(A0_8)
  local L1_9
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for apProvisioning page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_9 = _UPVALUE1_.approvisioningshowProvision(A0_8)
  if L1_9 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in apProvisioning page" .. L1_9)
  end
  return L1_9
end
function apProvisioningSet(A0_10)
  local L1_11
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for apProvisioning page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  A0_10 = util.removePrefix(A0_10, "apProvisioning.")
  for _FORV_5_, _FORV_6_ in pairs(A0_10) do
    if A0_10[_FORV_5_] == NIL then
      util.appendDebugOut("Set : Invalid Data")
      return _UPVALUE0_.BAD_PARAMETER
    end
  end
  L1_11 = _UPVALUE1_.approvisioningconfigSet(A0_10)
  if L1_11 ~= _UPVALUE0_.SUCCESS then
    if L1_11 == _UPVALUE2_ then
      return _UPVALUE3_.FAILED_TO_SET_PRIMARY_IP
    elseif L1_11 == _UPVALUE4_ then
      return _UPVALUE3_.FAILED_TO_SET_SECONDARY_IP
    else
      return L1_11
    end
  end
  return L1_11
end
function apProvisioningGet(A0_12)
  local L1_13, L2_14, L3_15
  L3_15 = {}
  L1_13, L2_14 = _UPVALUE0_.approvisioningconfigGet(A0_12)
  if L1_13 ~= _UPVALUE1_.SUCCESS then
    return L1_13
  end
  for _FORV_7_, _FORV_8_ in pairs(_UPVALUE2_) do
    L3_15[_FORV_7_] = L2_14[_FORV_8_]
  end
  return L1_13, L3_15
end
