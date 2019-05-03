local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/threeg_inbox")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function inboxGetIdTbl(A0_1)
  local L1_2, L2_3
  L1_2, L2_3 = _UPVALUE0_.inboxGetIdTbl(A0_1)
  if L1_2 ~= _UPVALUE1_.SUCCESS then
    return L1_2, _UPVALUE1_.NIL
  end
  return _UPVALUE1_.SUCCESS, L2_3
end
function inboxGetAll()
  local L0_4, L1_5
  L0_4, L1_5 = _UPVALUE0_.inboxGetAll()
  if L0_4 ~= _UPVALUE1_.SUCCESS then
    return L0_4, _UPVALUE1_.NIL
  end
  return _UPVALUE1_.SUCCESS, L1_5
end
function inboxDelete(A0_6)
  local L1_7, L2_8
  L2_8 = A0_6["inbox.cookie"]
  if L2_8 == nil then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_7 = _UPVALUE1_.inboxDelete(L2_8)
  return L1_7
end
function inboxDeleteAll()
  local L0_9
  L0_9 = _UPVALUE0_.inboxDeleteAll()
  return L0_9
end
