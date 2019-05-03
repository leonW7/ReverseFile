local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.aphwcapability", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/aphwcapability_web")
L0_0 = require
L0_0("teamf1lualib/aphwradiocapability_web")
L0_0 = require
L0_0("teamf1lualib/wlan_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).hwType = 1
;({}).description = 2
;({}).radioCount = 3
;({}).imageType = 4
;({}).radioMode = 1
;({}).aModeStatus = 2
;({}).radioDescription = 3
;({}).bgModeStatus = 4
;({}).vapCount = 5
;({}).nModeStatus = 6
;({}).acModeStatus = 7
function apHwtypeSupported()
  local L0_1, L1_2, L2_3, L3_4
  L1_2 = {}
  L2_3 = {}
  L3_4 = 1
  L0_1, L1_2 = _UPVALUE0_.aphwcapabilityGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in Getting values for the apHwCapability page" .. L0_1)
    return _UPVALUE2_.COMMUNICATION_FAILED
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
function apHwRadioGet(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10
  L3_8 = {}
  L4_9 = nil
  L5_10 = 1
  if A0_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_6, L4_9, L2_7 = _UPVALUE1_.aphwradiocapabilityGet(A0_5)
  if L1_6 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Getting values for the validAps page" .. L1_6)
    return _UPVALUE2_.COMMUNICATION_FAILED
  end
  for _FORV_9_, _FORV_10_ in pairs(L2_7) do
    L3_8[L5_10] = {}
    for _FORV_14_, _FORV_15_ in pairs(_UPVALUE3_) do
      L3_8[L5_10][_FORV_14_] = _FORV_10_[_FORV_15_]
    end
    L5_10 = L5_10 + 1
  end
  return L1_6, L4_9, L3_8
end
