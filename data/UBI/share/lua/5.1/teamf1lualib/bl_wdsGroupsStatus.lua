local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.wdsgroupstatus", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wdsgroupstatus_web")
L0_0 = require
L0_0("teamf1lualib/wlan_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function wdsGroupStatusGet()
  local L0_1, L1_2, L2_3
  L1_2, L0_1 = _UPVALUE0_.wdsgroupstatusGet()
  if L1_2 ~= _UPVALUE1_.SUCCESS then
    return L1_2
  end
  return L1_2, L0_1
end
