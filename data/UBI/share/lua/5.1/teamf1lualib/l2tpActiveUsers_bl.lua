local L0_0
L0_0 = module
L0_0("com.teamf1.bl.vpn.l2tp_users", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vpn_l2tpServer")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function l2tpActiveUsersSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  L0_1, L1_2, L2_3, L3_4, L4_5 = _UPVALUE0_.l2tpUserGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3, L3_4, L4_5
end
function l2tpActiveUsersSectionGetNext(A0_6)
  local L1_7, L2_8, L3_9, L4_10, L5_11, L6_12
  L1_7 = A0_6["l2tpActiveUsers.cookie"]
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
  L2_8, L3_9, L4_10, L5_11, L6_12 = _UPVALUE1_.l2tpUserGetNext(L1_7)
  if L2_8 ~= _UPVALUE0_.SUCCESS then
    return L2_8
  end
  return L2_8, L3_9, L4_10, L5_11, L6_12
end
function l2tpActiveUsersSectionGetAll()
  local L0_13, L1_14
  L1_14 = {}
  L0_13, L1_14 = _UPVALUE0_.l2tpUserGetAll()
  if L0_13 ~= _UPVALUE1_.SUCCESS then
    return L0_13
  end
  return L0_13, L1_14
end
function file_exists(A0_15)
  if io.open(A0_15, "rb") then
    io.open(A0_15, "rb"):close()
  end
  return io.open(A0_15, "rb") ~= nil
end
function lines_from(A0_16)
  if not file_exists(A0_16) then
    return {}
  end
  lines = {}
  for _FORV_4_ in io.lines(A0_16) do
    lines[#lines + 1] = _FORV_4_
  end
  return lines
end
