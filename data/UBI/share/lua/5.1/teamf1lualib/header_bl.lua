local L0_0
L0_0 = module
L0_0("com.teamf1.bl.maintenance", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/system_maintenance")
L0_0 = require
L0_0("teamf1lualib/system_productData")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function headerContenetGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
  L0_1, L1_2, L2_3, L3_4, L4_5 = _UPVALUE0_.currentFirmwareGetAll()
  L0_1, L1_2, L5_6 = _UPVALUE1_.serialNumberGet()
  if L0_1 ~= _UPVALUE2_.SUCCESS then
    return L0_1
  end
  return _UPVALUE2_.SUCCESS, L1_2, L2_3, L3_4, L4_5, L5_6
end
function currentLoginUserNameGet(A0_7)
  local L1_8, L2_9, L3_10
  L1_8, L2_9, L3_10 = _UPVALUE0_.currentUserNameGet(A0_7)
  if L1_8 ~= _UPVALUE1_.SUCCESS then
    return L1_8
  end
  return _UPVALUE1_.SUCCESS, L2_9, L3_10
end
function openvpnCurrentLoginUserNameGet(A0_11)
  local L1_12, L2_13, L3_14
  L1_12, L2_13, L3_14 = _UPVALUE0_.openvpnCurrentUserNameGet(A0_11)
  if L1_12 ~= _UPVALUE1_.SUCCESS then
    return L1_12
  end
  return _UPVALUE1_.SUCCESS, L2_13, L3_14
end
