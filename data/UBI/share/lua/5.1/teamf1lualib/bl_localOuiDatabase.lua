local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.localouidb", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/localOuiDatabase")
L0_0 = require
L0_0("teamf1lualib/wlan_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function localOuiDbGet()
  local L0_1, L1_2
  L0_1, L1_2 = _UPVALUE0_.localOuiDatabaseGetAll()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    if L0_1 == _UPVALUE2_.LOCAL_OUI_DB_NOT_EXIST then
      return _UPVALUE1_.SUCCESS
    else
      return L0_1
    end
  end
  return L0_1, L1_2
end
function localOuiDbAdd(A0_3)
  local L1_4, L2_5, L3_6
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for managedAps page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L2_5 = A0_3["localOuiDatabase.ouiValue"]
  L3_6 = A0_3["localOuiDatabase.ouiDescription"]
  if L3_6 == _UPVALUE0_.NIL or L2_5 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_4 = _UPVALUE1_.localOuiDatabaseAdd(L2_5, L3_6)
  if L1_4 ~= _UPVALUE0_.SUCCESS then
    return L1_4
  end
  return L1_4
end
function localOuiDbDelete(A0_7)
  local L1_8, L2_9
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for managedAps page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L2_9 = A0_7["localOuiDatabase.checkbox"]
  if L2_9 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_8 = _UPVALUE1_.localOuiDatabaseDel(L2_9)
  if L1_8 ~= _UPVALUE0_.SUCCESS then
    return L1_8
  end
  return L1_8
end
function localOuiDbDeleteAll(A0_10)
  local L1_11, L2_12, L3_13
  L3_13 = 1
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for managedAps page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L2_12 = A0_10["localOuiDatabase.cookie"][L3_13]
  if L2_12 == _UPVALUE0_.NIL then
    util.appendDebugOut("Delete : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  while A0_10["localOuiDatabase.cookie"][L3_13] ~= _UPVALUE0_.NIL do
    L2_12 = A0_10["localOuiDatabase.cookie"][L3_13]
    L1_11 = _UPVALUE1_.localOuiDatabaseDel(L2_12)
    L3_13 = L3_13 + 1
  end
  if L1_11 ~= _UPVALUE0_.SUCCESS then
    return L1_11
  end
  return L1_11
end
