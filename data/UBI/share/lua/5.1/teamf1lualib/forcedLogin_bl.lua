local L0_0
L0_0 = module
L0_0("com.teamf1.bl.system.forced_login", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/system_activeSessions")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.system.activesessions")
function forcedLoginSectionSet(A0_1)
  local L1_2, L2_3
  L1_2 = A0_1["Users.UserName"]
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.NIL
  if L1_2 == L2_3 then
    L2_3 = util
    L2_3 = L2_3.appendDebugOut
    L2_3("Set : Invalid userName")
    L2_3 = _UPVALUE0_
    L2_3 = L2_3.BAD_PARAMETER
    return L2_3
  end
  L2_3 = nil
  _UPVALUE1_.start()
  L2_3 = _UPVALUE2_.forcedLoginSet(L1_2)
  if L2_3 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page l2forcedLogin" .. L2_3)
    _UPVALUE1_.abort()
    return L2_3
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function openvpnForcedLoginSectionSet(A0_4)
  local L1_5, L2_6
  L1_5 = A0_4["Users.UserName"]
  L2_6 = _UPVALUE0_
  L2_6 = L2_6.NIL
  if L1_5 == L2_6 then
    L2_6 = util
    L2_6 = L2_6.appendDebugOut
    L2_6("Set : Invalid userName")
    L2_6 = _UPVALUE0_
    L2_6 = L2_6.BAD_PARAMETER
    return L2_6
  end
  L2_6 = nil
  _UPVALUE1_.start()
  L2_6 = _UPVALUE2_.openvpnForcedLoginSet(L1_5)
  if L2_6 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page " .. "openvpnforcedLogin" .. L2_6)
    _UPVALUE1_.abort()
    return L2_6
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function billingDeskforcedLoginSectionSet(A0_7)
  local L1_8, L2_9
  L1_8 = A0_7["Users.UserName"]
  L2_9 = _UPVALUE0_
  L2_9 = L2_9.NIL
  if L1_8 == L2_9 then
    L2_9 = util
    L2_9 = L2_9.appendDebugOut
    L2_9("Set : Invalid userName")
    L2_9 = _UPVALUE0_
    L2_9 = L2_9.BAD_PARAMETER
    return L2_9
  end
  L2_9 = nil
  _UPVALUE1_.start()
  L2_9 = _UPVALUE2_.billingDeskForcedLoginSet(L1_8)
  if L2_9 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page billingDeskforcedLogin" .. L2_9)
    _UPVALUE1_.abort()
    return L2_9
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
