local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.channelAlgorithm5", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/config")
L0_0 = require
L0_0("teamf1lualib/channelplan_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.wlan.channelAlgorithm5")
;({}).channelPlanMode = 1
;({}).channelPlanFixedTime = 2
;({}).channelPlanInterval = 3
;({}).ignoreUnmanagedAps = 4
;({}).channelChangeThreshold = 5
;({}).channelConflictThreshold = 6
function channelAlgorithmGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7
  L0_1 = {}
  L1_2, L2_3, L3_4, L4_5 = nil, nil, nil, nil
  L5_6 = 1
  L6_7 = _UPVALUE0_
  L6_7 = L6_7.channelplanGet
  L0_1, L6_7 = nil, L6_7()
  L1_2 = L6_7
  L6_7 = {}
  if L0_1 ~= nil then
    for _FORV_10_, _FORV_11_ in pairs(L0_1) do
      L6_7[L5_6] = {}
      for _FORV_15_, _FORV_16_ in pairs(_UPVALUE1_) do
        L6_7[L5_6][_FORV_15_] = _FORV_11_[_FORV_16_]
      end
      L5_6 = L5_6 + 1
    end
  end
  return L1_2, L6_7
end
function channelAlgorithmSet(A0_8)
  local L1_9
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for channelAlgorithm5GHz page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  A0_8 = util.removePrefix(A0_8, "channelAlgo5.")
  for _FORV_5_, _FORV_6_ in pairs(A0_8) do
    if A0_8[_FORV_5_] == NIL then
      util.appendDebugOut("Set : Invalid Data")
      return _UPVALUE0_.BAD_PARAMETER
    end
    if _FORV_5_ ~= "channelPlanFixedTime" then
      A0_8[_FORV_5_] = tonumber(A0_8[_FORV_5_])
    end
  end
  L1_9 = _UPVALUE1_.channelplanSet(A0_8)
  if L1_9 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in channelAlgorithm5GHzpage page" .. L1_9)
  end
  return L1_9
end
