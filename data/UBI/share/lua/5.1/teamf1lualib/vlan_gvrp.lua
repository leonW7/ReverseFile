local L0_0
L0_0 = module
L0_0("com.teamf1.core.vlan.gvrp", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vlan_returnCodes")
L0_0 = require
L0_0("teamf1lualib/vlan_validation")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
gvrpTable = "wirelessCtrlGVRP"
attribute = {}
attribute.feature = "gvrpConfig"
ENABLE = "1"
DISABLE = "0"
ROWID = "_ROWID_"
function isfeatureEnabled()
  local L0_1, L1_2
  L0_1 = firstCookieGet
  L1_2 = gvrpTable
  L0_1 = L0_1(L1_2)
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(gvrpTable, ROWID, L0_1, attribute.feature)
  if L1_2 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_1, L1_2
end
function isfeatureEnabledNext(A0_3)
  local L2_4
  L2_4 = _UPVALUE0_
  L2_4 = L2_4.NOT_SUPPORTED
  return L2_4, A0_3
end
function featureEnableSet(A0_5)
  if checkCookieExists(A0_5, gvrpTable) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if db.setAttribute(gvrpTable, ROWID, A0_5, attribute.feature, ENABLE) == NIL then
    return _UPVALUE0_.FAILURE, A0_5
  end
  return _UPVALUE0_.SUCCESS, A0_5
end
function featureDisableSet(A0_6)
  if checkCookieExists(A0_6, gvrpTable) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if db.setAttribute(gvrpTable, ROWID, A0_6, attribute.feature, DISABLE) == NIL then
    return _UPVALUE0_.FAILURE, A0_6
  end
  return _UPVALUE0_.SUCCESS, A0_6
end
