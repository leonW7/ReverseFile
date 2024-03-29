local L0_0
L0_0 = module
L0_0("com.teamf1.core.ipv6.teredo", package.seeall)
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
;({}).tunnelStatus = "tunnelStatus"
;({}).serverName = "serverName"
;({}).secodndaryServerName = "secodndaryServerName"
;({}).ipv6Mode = "netWorkMode"
function teredoConfigGet()
  local L0_1, L1_2, L2_3
  if db.getRow(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_) == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  L0_1 = db.getRow(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_)[_UPVALUE0_ .. "." .. _UPVALUE4_.tunnelStatus]
  L1_2 = db.getRow(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_)[_UPVALUE0_ .. "." .. _UPVALUE4_.serverName]
  L2_3 = db.getRow(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_)[_UPVALUE0_ .. "." .. _UPVALUE4_.secodndaryServerName]
  return _UPVALUE3_.SUCCESS, L0_1, L1_2, L2_3
end
function teredoConfigSet(A0_4, A1_5, A2_6)
  local L3_7, L4_8, L5_9, L6_10
  L3_7 = _UPVALUE0_
  L3_7 = L3_7.ipv6ModeGet
  L5_9 = L3_7()
  L6_10 = {}
  if tonumber(L5_9) ~= 3 then
    return _UPVALUE1_.IPV6MODE_NOT_ENABLED
  end
  if A0_4 == _UPVALUE2_ then
    L6_10[_UPVALUE3_ .. "." .. _UPVALUE4_.tunnelStatus] = A0_4
    L6_10[_UPVALUE3_ .. "." .. _UPVALUE4_.serverName] = A1_5
    L6_10[_UPVALUE3_ .. "." .. _UPVALUE4_.secodndaryServerName] = A2_6
  else
    L6_10[_UPVALUE3_ .. "." .. _UPVALUE4_.tunnelStatus] = A0_4
  end
  valid = db.update(_UPVALUE3_, L6_10, _UPVALUE5_)
  if not valid then
    return _UPVALUE6_.FAILURE
  end
  return _UPVALUE6_.SUCCESS, cookie
end
