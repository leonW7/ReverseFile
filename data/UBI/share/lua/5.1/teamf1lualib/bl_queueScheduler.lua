local L0_0
L0_0 = module
L0_0("com.teamf1.bl.lanqos.schedule", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/lanqos_schedule")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function queueSchedulerGet()
  local L0_1, L1_2, L2_3
  L0_1, L1_2, L2_3 = _UPVALUE0_.schedulerGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3
end
function queueSchedulerSet(A0_4)
  local L1_5, L2_6, L3_7
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for queueScheduler page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L3_7 = A0_4["queueScheduler.algorithm"]
  if L3_7 == nil then
    util.appendDebugOut("Set : Invalid Algorithm")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L3_7 = tonumber(L3_7)
  L1_5, L2_6 = _UPVALUE2_.schedulerSet(L3_7)
  if L1_5 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in queueScheduler page" .. L1_5)
    _UPVALUE1_.abort()
    return L1_5
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_5, L2_6
end
