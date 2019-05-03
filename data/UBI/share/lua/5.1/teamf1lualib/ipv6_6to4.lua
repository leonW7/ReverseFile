local L0_0
L0_0 = module
L0_0("com.teamf1.core.ipv6.sixToFour", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/ipv6_mode")
L0_0 = require
L0_0("teamf1lualib/returnCodes_ipv6_nimf")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
sixToFourTbl = "sixToFourTunnel"
;({}).feature = "tunnelStatus"
;({}).ipv6Mode = "netWorkMode"
STATUS_ENABLE = 1
STATUS_DISABLE = 0
function isfeatureEnabled()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(sixToFourTbl, "_ROWID_", "1", _UPVALUE0_.feature)
  if L0_1 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L0_1
end
function isfeatureEnabledNext(A0_2)
  return _UPVALUE0_.NOT_SUPPORTED
end
function featureEnable()
  local L0_3, L1_4, L2_5
  L0_3 = _UPVALUE0_
  L0_3 = L0_3.ipv6ModeGet
  L2_5 = L0_3()
  if tonumber(L2_5) ~= 3 then
    return _UPVALUE1_.IPV6MODE_NOT_ENABLED
  end
  if db.setAttribute(sixToFourTbl, "_ROWID_", "1", _UPVALUE2_.feature, STATUS_ENABLE) == _UPVALUE3_.FALSE then
    return _UPVALUE3_.FAILURE, cookie
  end
  return _UPVALUE3_.SUCCESS, cookie
end
function featureDisable()
  local L0_6, L1_7, L2_8
  L0_6 = _UPVALUE0_
  L0_6 = L0_6.ipv6ModeGet
  L2_8 = L0_6()
  if tonumber(L2_8) ~= 3 then
    return _UPVALUE1_.IPV6MODE_NOT_ENABLED
  end
  if db.setAttribute(sixToFourTbl, "_ROWID_", "1", _UPVALUE2_.feature, STATUS_DISABLE) == _UPVALUE3_.FALSE then
    return _UPVALUE3_.FAILURE, cookie
  end
  return _UPVALUE3_.SUCCESS, cookie
end
