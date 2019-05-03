local L0_0
L0_0 = module
L0_0("com.teamf1.bl.simCardAuth", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/threeg_simCardAuth")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function simCardAuthGet()
  local L0_1, L1_2, L2_3, L3_4
  L0_1, L1_2, L2_3, L3_4 = _UPVALUE0_.simCardAuthStatusGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1, L1_2, L2_3, L3_4
  end
  return _UPVALUE1_.SUCCESS, L1_2, L2_3, L3_4
end
function simCardPinCheck(A0_5)
  local L1_6, L2_7
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page simCardAuthentication")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L2_7 = A0_5["simCardSettings.pinCode"]
  L1_6 = _UPVALUE1_.simCardPinAuth(L2_7)
  if L1_6 ~= _UPVALUE0_.SUCCESS then
    return L1_6
  end
  return _UPVALUE0_.SIM_UNLOCKED_RESAVE_WAN_SETTINGS
end
