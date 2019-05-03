local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.detectedClientInfo", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/config")
L0_0 = require
L0_0("teamf1lualib/wlantriangulationlist_web")
L0_0 = require
L0_0("teamf1lualib/wlanrogueclassficationlist_web")
L0_0 = require
L0_0("teamf1lualib/assocclientspreauthhistory_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).apMac = 1
;({}).sentry = 2
;({}).radio = 3
;({}).rssi = 4
;({}).sigStrength = 5
;({}).noiseLevel = 6
;({}).age = 7
;({}).testId = 1
;({}).listCondition = 2
;({}).rogueMac = 3
;({}).radio = 4
;({}).testEnabled = 5
;({}).testResults = 6
;({}).timeFirstReported = 7
;({}).timeLastReported = 8
;({}).clientMac = 1
;({}).apMac = 2
;({}).radio = 3
;({}).vapMac = 4
;({}).ssid = 5
;({}).age = 6
;({}).userName = 7
;({}).preAuthStatus = 8
function triangulationInfoGet(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6
  L1_2 = {}
  L2_3, L3_4 = nil, nil
  L4_5 = 1
  L5_6 = _UPVALUE0_
  L5_6 = L5_6.wlantriangulationlistGet
  L3_4, L1_2, L5_6 = A0_1, nil, L5_6(A0_1)
  L2_3 = L5_6
  L5_6 = {}
  if L1_2 ~= nil then
    for _FORV_9_, _FORV_10_ in pairs(L1_2) do
      L5_6[L4_5] = {}
      for _FORV_14_, _FORV_15_ in pairs(_UPVALUE1_) do
        L5_6[L4_5][_FORV_14_] = _FORV_10_[_FORV_15_]
      end
      L4_5 = L4_5 + 1
    end
  end
  return L2_3, L5_6
end
function rogueClassificationInfoGet(A0_7)
  local L1_8, L2_9, L3_10, L4_11
  L1_8 = {}
  L2_9 = nil
  L3_10 = 1
  L4_11 = _UPVALUE0_
  L4_11 = L4_11.wlanrogueclassficationlistGet
  L1_8, L4_11 = A0_7, L4_11(A0_7)
  L2_9 = L4_11
  L4_11 = {}
  if L1_8 ~= nil then
    for _FORV_8_, _FORV_9_ in pairs(L1_8) do
      L4_11[L3_10] = {}
      for _FORV_13_, _FORV_14_ in pairs(_UPVALUE1_) do
        L4_11[L3_10][_FORV_13_] = _FORV_9_[_FORV_14_]
      end
      L3_10 = L3_10 + 1
    end
  end
  return L2_9, L4_11
end
function preAuthHistoryGet()
  local L0_12, L1_13, L2_14, L3_15
  L0_12 = {}
  L1_13 = nil
  L2_14 = 1
  L3_15 = _UPVALUE0_
  L3_15 = L3_15.assocclientspreauthhistoryGet
  L0_12, L3_15 = nil, L3_15()
  L1_13 = L3_15
  L3_15 = {}
  if L0_12 ~= nil then
    for _FORV_7_, _FORV_8_ in pairs(L0_12) do
      L3_15[L2_14] = {}
      for _FORV_12_, _FORV_13_ in pairs(_UPVALUE1_) do
        L3_15[L2_14][_FORV_12_] = _FORV_8_[_FORV_13_]
      end
      L2_14 = L2_14 + 1
    end
  end
  return L1_13, L3_15
end
