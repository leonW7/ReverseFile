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
L0_0("teamf1lualib/threeg_createSms")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function createSmsGet()
  local L0_1, L1_2
  L0_1, L1_2 = _UPVALUE0_.createSmsGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1, L1_2
  end
  return _UPVALUE1_.SUCCESS, L1_2
end
function createSmsSet(A0_3)
  local L1_4, L2_5, L3_6
  L1_4 = A0_3["createSms.receiver"]
  L2_5 = A0_3["createSms.text"]
  L3_6 = _UPVALUE0_
  L3_6 = L3_6.NIL
  if L1_4 ~= L3_6 then
    L3_6 = _UPVALUE0_
    L3_6 = L3_6.NIL
  elseif L2_5 == L3_6 then
    L3_6 = util
    L3_6 = L3_6.appendDebugOut
    L3_6("Set : Invalid Cookie")
    L3_6 = _UPVALUE0_
    L3_6 = L3_6.BAD_PARAMETER
    return L3_6
  end
  L3_6 = nil
  L3_6 = _UPVALUE1_.createSmsSet(L1_4, L2_5)
  if L3_6 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page sessionSettings" .. L3_6)
    return L3_6
  end
  return _UPVALUE0_.SUCCESS
end
