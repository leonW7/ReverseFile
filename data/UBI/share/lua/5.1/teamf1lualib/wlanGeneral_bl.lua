local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.wlanGeneral", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/config")
L0_0 = require
L0_0("teamf1lualib/wlanglobalsettings_web")
L0_0 = require
L0_0("teamf1lualib/apvalidation_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.wlan.global")
;({}).txnResult = 1
;({}).controllerStatus = 2
;({}).controllerIp = 3
;({}).peerGrpId = 4
;({}).clientRoamTimeOut = 5
;({}).clientMacAuthMode = 6
;({}).adHocClientTimeOut = 7
;({}).apFailureTimeOut = 8
;({}).rfScanTimeOut = 9
;({}).detectedClientTimeOut = 10
;({}).tunnelMTU = 11
;({}).clusterPriority = 12
;({}).clientQOS = 13
;({}).country = 14
;({}).wlanglobalRadAuthServerName = 15
;({}).wlanglobalRadServerStatus = 16
;({}).wlanglobalRadAccServerName = 17
;({}).wlanglobalRadAccServerStatus = 18
;({}).wlanglobalRadAccServerEnable = 19
;({}).txnResult = 1
;({}).apMacValidation = 2
;({}).passPhraseRequired = 3
;({}).manageApWithPreviousCode = 4
function wlanGeneralGet()
  local L0_1, L1_2, L2_3, L3_4
  L2_3 = {}
  L3_4 = 1
  L0_1, L1_2 = _UPVALUE0_.wlanglobalsettingsGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  for _FORV_7_, _FORV_8_ in pairs(_UPVALUE2_) do
    L2_3[_FORV_7_] = L1_2[_FORV_8_]
  end
  return L0_1, L2_3
end
function wlanGeneralSet(A0_5)
  local L1_6, L2_7
  L2_7 = ACCESS_LEVEL
  if L2_7 ~= 0 then
    L2_7 = util
    L2_7 = L2_7.appendDebugOut
    L2_7("Detected Unauthorized access for wlanGeneral page")
    L2_7 = _UPVALUE0_
    L2_7 = L2_7.UNAUTHORIZED
    return L2_7
  end
  L2_7 = removePrefix
  L2_7 = L2_7(A0_5, "wlanGeneral.")
  A0_5 = L2_7
  L2_7 = {}
  for _FORV_6_, _FORV_7_ in pairs(A0_5) do
    L2_7[_FORV_6_] = A0_5[_FORV_6_]
  end
  for _FORV_6_, _FORV_7_ in pairs(_UPVALUE1_) do
    if _FORV_6_ ~= "controllerIp" and _FORV_6_ ~= "txnResult" and _FORV_6_ ~= "wlanglobalRadAccServerStatus" and _FORV_6_ ~= "wlanglobalRadServerStatus" and A0_5[_FORV_6_] == nil then
      util.appendDebugOut("Set : Invalid Data")
      return _UPVALUE0_.BAD_PARAMETER
    end
  end
  L1_6 = _UPVALUE2_.wlanglobalsettingsSet(A0_5)
  if L1_6 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in wlanGeneral page" .. L1_6)
  end
  L2_7 = removePrefix(L2_7, "apValidation.")
  for _FORV_6_, _FORV_7_ in pairs(_UPVALUE3_) do
    if _FORV_6_ ~= "txnResult" then
      if L2_7[_FORV_6_] == nil then
        util.appendDebugOut("Set : Invalid Data")
        return _UPVALUE0_.BAD_PARAMETER
      else
        L2_7[_FORV_6_] = tonumber(L2_7[_FORV_6_])
      end
    end
  end
  L1_6 = _UPVALUE4_.apvalidationSet(L2_7)
  if L1_6 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in wlanGeneral page" .. L1_6)
  end
  return L1_6
end
function apValidationGet()
  local L0_8, L1_9, L2_10, L3_11
  L2_10 = {}
  L3_11 = 1
  L0_8, L1_9 = _UPVALUE0_.apvalidationGet()
  if L0_8 ~= _UPVALUE1_.SUCCESS then
    return L0_8
  end
  for _FORV_7_, _FORV_8_ in pairs(_UPVALUE2_) do
    L2_10[_FORV_7_] = L1_9[_FORV_8_]
  end
  return L0_8, L2_10
end
function removePrefix(A0_12, A1_13)
  local L2_14, L3_15, L4_16, L5_17, L6_18
  L2_14 = {}
  for L6_18, _FORV_7_ in L3_15(L4_16) do
    newkey = string.gsub(L6_18, A1_13, "")
    if newkey ~= nil then
      L2_14[newkey] = _FORV_7_
    end
  end
  return L2_14
end
