local L0_0
L0_0 = module
L0_0("com.teamf1.bl.lanqos.queuemanagement", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/lanqos_queueManagement")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function portQueueAlgorithmGet()
  local L0_1, L1_2, L2_3
  L0_1, L1_2, L2_3 = _UPVALUE0_.portQueueStatusGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  if L2_3 ~= _UPVALUE2_ then
    return _UPVALUE1_.FAILURE
  end
  return L0_1, L1_2, _UPVALUE3_
end
