local L0_0
L0_0 = module
L0_0("com.teamf1.bl.portalInfo", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/sslvpn_portalLayout")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/sslvpn_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function portalInfoGet(A0_1)
  local L1_2, L2_3, L3_4
  L3_4, L1_2, L2_3 = _UPVALUE0_.currentPortalInfoGet(A0_1)
  if L3_4 ~= _UPVALUE1_.SUCCESS then
    return L3_4
  end
  return _UPVALUE1_.SUCCESS, L1_2, L2_3
end
