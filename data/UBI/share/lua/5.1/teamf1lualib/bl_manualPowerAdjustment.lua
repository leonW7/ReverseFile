local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.manualpower", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/manualpowerplan_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).apMacAddress = 1
;({}).apLocation = 2
;({}).apRadio = 3
;({}).curPower = 4
;({}).planNewPower = 5
function powerAdjustmentGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  L3_4 = {}
  L4_5 = 1
  L0_1, L1_2, L2_3 = _UPVALUE0_.manualpowerplanGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in configuring values in manualPowerAdjustMent page" .. L0_1)
    return L0_1
  end
  for _FORV_8_, _FORV_9_ in pairs(L2_3) do
    L3_4[L4_5] = {}
    for _FORV_13_, _FORV_14_ in pairs(_UPVALUE2_) do
      L3_4[L4_5][_FORV_13_] = _FORV_9_[_FORV_14_]
    end
    L4_5 = L4_5 + 1
  end
  return L0_1, L1_2, L3_4
end
function powerPlanStart()
  local L0_6
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for manualPowerAdjustment page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L0_6 = _UPVALUE1_.manualpowerplanStart()
  if L0_6 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in manualPowerAdjustMent page" .. L0_6)
    return L0_6
  end
  return L0_6
end
function powerPlanApply()
  local L0_7
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for manualPowerAdjustment page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L0_7 = _UPVALUE1_.manualpowerplanApply()
  if L0_7 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in manualPowerAdjustMent page" .. L0_7)
    return L0_7
  end
  return L0_7
end
function powerPlanClear()
  local L0_8
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for manualPowerAdjustment page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L0_8 = _UPVALUE1_.manualpowerplanClear()
  if L0_8 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in manualPowerAdjustMent page" .. L0_8)
    return L0_8
  end
  return L0_8
end
