local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wireless.statistics", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wireless_statistics")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function wirelessStatisticsSectionGetAll()
  local L0_1, L1_2
  L0_1 = _UPVALUE0_
  L0_1 = L0_1.statisticsGetAll
  L1_2 = L0_1()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    L1_2 = {}
    return L0_1, L1_2
  end
  return _UPVALUE1_.SUCCESS, L1_2
end
