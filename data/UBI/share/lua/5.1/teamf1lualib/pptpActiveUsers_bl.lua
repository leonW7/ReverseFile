local L0_0
L0_0 = module
L0_0("com.teamf1.bl.vpn.pptp_users", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vpn_pptpServer")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function pptpActiveUsersSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  L0_1, L1_2, L2_3, L3_4, L4_5 = _UPVALUE0_.pptpUserGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3, L3_4, L4_5
end
function pptpActiveUsersSectionGetNext(A0_6)
  local L1_7, L2_8, L3_9, L4_10, L5_11, L6_12
  L1_7 = inputTable
  L1_7 = L1_7["pptpActiveUsers.cookie"]
  L2_8 = _UPVALUE0_
  L2_8 = L2_8.NIL
  if L1_7 == L2_8 then
    L2_8 = util
    L2_8 = L2_8.appendDebugOut
    L3_9 = "GetNext : Invalid Cookie"
    L2_8(L3_9)
    L2_8 = _UPVALUE0_
    L2_8 = L2_8.BAD_PARAMETER
    return L2_8
  end
  L2_8, L3_9, L4_10, L5_11, L6_12 = nil, nil, nil, nil, nil
  L2_8, L3_9, L4_10, L5_11, L6_12 = _UPVALUE1_.pptpUserGet(L1_7)
  if L2_8 ~= _UPVALUE0_.SUCCESS then
    return L2_8
  end
  return L2_8, L3_9, L4_10, L5_11, L6_12
end
function pptpActiveUsersSectionGetAll()
  local L0_13, L1_14
  L1_14 = {}
  L0_13, L1_14 = _UPVALUE0_.pptpUserGetAll()
  if L0_13 ~= _UPVALUE1_.SUCCESS then
    return L0_13
  end
  return L0_13, L1_14
end
