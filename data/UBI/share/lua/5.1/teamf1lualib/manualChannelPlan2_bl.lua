local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.manualChannelPlan2GHz", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/manualchannelplan2_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).APMAC = 1
;({}).location = 2
;({}).currentChannel = 3
;({}).newChannel = 4
function manualchannelPlan2Get()
  local L0_1, L1_2, L2_3, L3_4
  L2_3 = {}
  L3_4 = 1
  L0_1, channelMode, currentStatus, L1_2 = _UPVALUE0_.manualchannelplan2Get()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  if L1_2 ~= _UPVALUE1_.NIL then
    for _FORV_7_, _FORV_8_ in pairs(L1_2) do
      L2_3[L3_4] = {}
      for _FORV_12_, _FORV_13_ in pairs(_UPVALUE2_) do
        L2_3[L3_4][_FORV_12_] = _FORV_8_[_FORV_13_]
      end
      L3_4 = L3_4 + 1
    end
  end
  return L0_1, channelMode, currentStatus, L2_3
end
function manualChannelPlan2Apply()
  local L0_5
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for manualChannelPlan2-4GHz page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L0_5 = _UPVALUE1_.manualchannelplan2Apply()
  if L0_5 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in manualChannelPlan2-4GHz page" .. L0_5)
  end
  return L0_5
end
function manualChannelPlan2Clear()
  local L0_6
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for manualChannelPlan2-4GHz page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L0_6 = _UPVALUE1_.manualchannelplan2Clear()
  if L0_6 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in manualChannelPlan2-4GHz page" .. L0_6)
  end
  return L0_6
end
function manualChannelPlan2Start()
  local L0_7
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for manualChannelPlan2-4GHz page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L0_7 = _UPVALUE1_.manualchannelplan2Start()
  if L0_7 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in manualChannelPlan2-4GHz page" .. L0_7)
  end
  return L0_7
end
