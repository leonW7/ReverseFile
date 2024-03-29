local L0_0
L0_0 = module
L0_0("com.teamf1.bl.accounting", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/accounting_core")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function accountingSectionSet(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7
  L1_2 = ACCESS_LEVEL
  if L1_2 ~= 0 then
    L1_2 = util
    L1_2 = L1_2.appendDebugOut
    L2_3 = "Detected Unauthorized access for page accounting"
    L1_2(L2_3)
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.UNAUTHORIZED
    return L1_2
  end
  L1_2 = A0_1["userAccountingEnable.cookie"]
  L2_3 = A0_1["userAccountingEnable.captivePortal"]
  L3_4 = A0_1["userAccountingEnable.interimInterval"]
  L4_5 = A0_1["userAccountingEnable.routeIfaceName"]
  if L1_2 == nil or L2_3 == nil or L3_4 == nil then
    L5_6 = util
    L5_6 = L5_6.appendDebugOut
    L6_7 = "GetNext : Invalid Input configuration"
    L5_6(L6_7)
    L5_6 = _UPVALUE0_
    L5_6 = L5_6.BAD_PARAMETER
    return L5_6
  end
  L5_6, L6_7 = nil, nil
  _UPVALUE1_.start()
  L5_6, L6_7 = _UPVALUE2_.accountingSet(L1_2, L2_3, L3_4, L4_5)
  if L5_6 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page accounting" .. L5_6)
    _UPVALUE1_.abort()
    return L5_6, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L6_7
end
function accountingSectionGetAll()
  local L0_8, L1_9, L2_10, L3_11, L4_12, L5_13
  L5_13 = {}
  L0_8, L1_9, L2_10, L3_11, L4_12 = _UPVALUE0_.accountingGetAll()
  if L0_8 ~= _UPVALUE1_.SUCCESS then
    return L0_8
  end
  return L0_8, L1_9, L2_10, L3_11, L4_12
end
