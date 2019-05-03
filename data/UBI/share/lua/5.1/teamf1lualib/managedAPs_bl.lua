local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.managedAps", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wlanassociatedclients_web")
L0_0 = require
L0_0("teamf1lualib/managedapshow_web")
L0_0 = require
L0_0("teamf1lualib/managedapchannelandpower_web")
L0_0 = require
L0_0("teamf1lualib/managedapdebug_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).managedapshowMACADDRESS = 1
;({}).managedapshowRADIO = 2
;({}).managedapshowRADIOPHYMODE = 3
;({}).managedapshowCHANNEL = 4
;({}).managedapshowCHANNELSTATUS = 5
;({}).managedapshowPOWER = 6
;({}).managedapshowPOWERSTATUS = 7
;({}).managedapshowLOCATION = 8
;({}).managedapshowDEBUG = 9
;({}).managedapshowDEBUGSTATUS = 10
;({}).managedapchannelandpowerRADIOPHYMODE = 1
;({}).managedapchannelandpowerCHANNEL = 2
;({}).managedapchannelandpowerCHANNELSTATUS = 3
;({}).managedapchannelandpowerPOWER = 4
;({}).managedapchannelandpowerPOWERSTATUS = 5
;({}).managedapdebugLOCATION = 1
;({}).managedapdebugIPADDRESS = 2
;({}).managedapdebugSTATUS = 3
;({}).managedapdebugDEBUG = 4
function managedAPsGet()
  local L0_1, L1_2, L2_3, L3_4
  L2_3 = {}
  L3_4 = 1
  L0_1, L1_2 = _UPVALUE0_.managedapshowGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  for _FORV_7_, _FORV_8_ in pairs(L1_2) do
    L2_3[L3_4] = {}
    for _FORV_12_, _FORV_13_ in pairs(_UPVALUE2_) do
      L2_3[L3_4][_FORV_12_] = _FORV_8_[_FORV_13_]
    end
    L3_4 = L3_4 + 1
  end
  return L0_1, L2_3
end
function managedAPsChannelPowerGet(A0_5, A1_6)
  local L2_7, L3_8, L4_9, L5_10
  L4_9 = {}
  L5_10 = 1
  if A0_5 == _UPVALUE0_.NIL or A1_6 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_7, managedAPsChannelPowerInfo = _UPVALUE1_.managedapchannelandpowerGet(A0_5, tonumber(A1_6))
  if L2_7 ~= _UPVALUE0_.SUCCESS then
    return L2_7
  end
  for _FORV_9_, _FORV_10_ in pairs(_UPVALUE2_) do
    L4_9[_FORV_9_] = managedAPsChannelPowerInfo[_FORV_10_]
  end
  return L2_7, L4_9
end
function managedAPsChannelPowerSet(A0_11, A1_12, A2_13, A3_14)
  local L4_15
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for managedValidAPs page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_11 == _UPVALUE0_.NIL or A1_12 == _UPVALUE0_.NIL or A2_13 == _UPVALUE0_.NIL or A3_14 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L4_15 = _UPVALUE1_.managedapchannelandpowerSet(A0_11, tonumber(A1_12), tonumber(A2_13), tonumber(A3_14))
  if L4_15 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in managedValidAPs page" .. L4_15)
  end
  return L4_15
end
function managedAPDebugGet(A0_16)
  local L1_17, L2_18, L3_19, L4_20
  L3_19 = {}
  L4_20 = 1
  if A0_16 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L1_17, L2_18 = _UPVALUE1_.managedapdebugGet(A0_16)
  if L1_17 ~= _UPVALUE0_.SUCCESS then
    return L1_17
  end
  for _FORV_8_, _FORV_9_ in pairs(_UPVALUE2_) do
    L3_19[_FORV_8_] = L2_18[_FORV_9_]
  end
  return L1_17, L3_19
end
function managedAPDebugSet(A0_21, A1_22, A2_23)
  local L3_24
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for managedValidAPs page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_21 == _UPVALUE0_.NIL or A1_22 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L3_24 = _UPVALUE1_.managedapdebugSet(A0_21, tonumber(A1_22), A2_23)
  if L3_24 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in managedValidAPs page" .. L3_24)
  end
  return L3_24
end
