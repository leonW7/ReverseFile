local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.controllerstatus", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/controllerstatus_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function controllerStatusGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
  L0_1, L5_6, L1_2, L2_3, L3_4, L4_5 = _UPVALUE0_.controllerStatusGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  if L3_4 == 0 then
    L3_4 = "No"
  else
    L3_4 = "Yes"
  end
  return L0_1, L5_6, L1_2, L2_3, L3_4, L4_5
end
