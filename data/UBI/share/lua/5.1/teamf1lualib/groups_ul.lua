local L0_0
L0_0 = module
L0_0("com.teamf1.ul.userdb.groups", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/user-management_groups")
L0_0 = require
L0_0("teamf1lualib/user-management_browserPolicies")
L0_0 = require
L0_0("teamf1lualib/user-management_networkPolicies")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
FALSE = false
NIL = nil
ROWID = "_ROWID_"
groupId = "GroupId"
browserpoliciesTable = "AccessControlUserGroupPolicyBrowser"
groupsTable = "UserGroups"
loginPolicyTable = "GroupAccessControl"
networkpoliciesTable = "AccessControlUserGroupPolicyIPAddress"
sslVpnTable = "USERDBDomains"
function ul_groupDelete(A0_1)
  local L1_2, L2_3, L3_4
  L1_2 = NIL
  if A0_1 == L1_2 then
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.INVALID_ARGUMENT
    return L1_2
  end
  L1_2 = A0_1
  L2_3 = db
  L2_3 = L2_3.getAttribute
  L3_4 = networkpoliciesTable
  L2_3 = L2_3(L3_4, groupId, A0_1, ROWID)
  L3_4 = db
  L3_4 = L3_4.getAttribute
  L3_4 = L3_4(browserpoliciesTable, groupId, A0_1, ROWID)
  returnCode, code = _UPVALUE1_.groupUsersDeleteCheck(A0_1)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    return returnCode, code
  end
  if db.getAttribute(sslVpnTable, groupId, L1_2, ROWID) ~= nil then
    returnCode, A0_1 = _UPVALUE1_.sslvpnUserDelete(L1_2)
    if returnCode ~= _UPVALUE0_.SUCCESS then
      return returnCode, A0_1
    end
  end
  if L2_3 ~= nil then
    returnCode, A0_1 = _UPVALUE2_.networkPolicyDelete(L2_3)
    if returnCode ~= _UPVALUE0_.SUCCESS then
      return returnCode, A0_1
    end
  end
  if L3_4 ~= nil then
    returnCode, A0_1 = _UPVALUE3_.browserPolicyDelete(L3_4)
    if returnCode ~= _UPVALUE0_.SUCCESS then
      return returnCode, A0_1
    end
  end
  returnCode, A0_1 = _UPVALUE1_.loginPolicyDelete(L1_2)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    return returnCode, A0_1
  end
  returnCode, A0_1 = _UPVALUE1_.groupDelete(L1_2)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    return returnCode, A0_1
  end
  return _UPVALUE0_.SUCCESS, A0_1
end
function ul_groupCreate(A0_5, A1_6, A2_7, A3_8, A4_9)
  local L5_10, L6_11
  if A0_5 == nil or A1_6 == nil then
    L5_10 = _UPVALUE0_
    L5_10 = L5_10.BAD_PARAMETER
    return L5_10
  end
  L5_10, L6_11 = nil, nil
  L5_10, L6_11 = _UPVALUE1_.groupCreate(A0_5, A1_6, A2_7, A3_8, A4_9)
  if L5_10 ~= _UPVALUE0_.SUCCESS then
    return L5_10
  end
  return _UPVALUE0_.SUCCESS, L6_11
end
