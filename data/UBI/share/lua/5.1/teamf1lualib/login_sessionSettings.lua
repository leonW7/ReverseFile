local L0_0
L0_0 = module
L0_0("com.teamf1.core.login.login_sessionSettings", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).adminCapability = "3"
;({}).guestCapabaility = "4"
;({}).sessionTimeout = "SessionTimeout"
;({}).groupCapabality = "GroupCapability"
SESSION_TIMEOUT_MIN = 0
SESSION_TIMEOUT_MAX = 999
TIMEOUT_FLOAT_CHECK = 1
function sessionSettingsGet()
  local L0_1, L1_2
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L1_2 = _UPVALUE0_
  L0_1 = L0_1(L1_2, _UPVALUE1_.groupCapabality, _UPVALUE1_.adminCapability, _UPVALUE1_.sessionTimeout)
  L1_2 = _UPVALUE2_
  L1_2 = L1_2.NIL
  if L0_1 == L1_2 then
    L1_2 = _UPVALUE2_
    L1_2 = L1_2.FAILURE
    return L1_2
  end
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(_UPVALUE0_, _UPVALUE1_.groupCapabality, _UPVALUE1_.guestCapabaility, _UPVALUE1_.sessionTimeout)
  if L1_2 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_1, L1_2
end
function sessionSettingsSet(A0_3, A1_4)
  local L2_5
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if A0_3 ~= L2_5 then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.NIL
  elseif A1_4 == L2_5 then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.INVALID_ARGUMENT
    return L2_5
  end
  L2_5 = tonumber
  L2_5 = L2_5(A0_3)
  if not (L2_5 < SESSION_TIMEOUT_MIN) then
    L2_5 = tonumber
    L2_5 = L2_5(A0_3)
    if not (L2_5 > SESSION_TIMEOUT_MAX) then
      L2_5 = tonumber
      L2_5 = L2_5(A0_3)
      L2_5 = L2_5 % TIMEOUT_FLOAT_CHECK
    end
  elseif L2_5 ~= SESSION_TIMEOUT_MIN then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.ADMIN_SESSION_TIMEOUT_INVALID
    return L2_5
  end
  L2_5 = tonumber
  L2_5 = L2_5(A1_4)
  if not (L2_5 < SESSION_TIMEOUT_MIN) then
    L2_5 = tonumber
    L2_5 = L2_5(A1_4)
    if not (L2_5 > SESSION_TIMEOUT_MAX) then
      L2_5 = tonumber
      L2_5 = L2_5(A1_4)
      L2_5 = L2_5 % TIMEOUT_FLOAT_CHECK
    end
  elseif L2_5 ~= SESSION_TIMEOUT_MIN then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.GUEST_SESSION_TIMEOUT_INVALID
    return L2_5
  end
  L2_5 = nil
  L2_5 = db.setAttribute(_UPVALUE1_, _UPVALUE2_.groupCapabality, _UPVALUE2_.adminCapability, _UPVALUE2_.sessionTimeout, A0_3)
  if L2_5 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE
  end
  L2_5 = db.setAttribute(_UPVALUE1_, _UPVALUE2_.groupCapabality, _UPVALUE2_.guestCapabaility, _UPVALUE2_.sessionTimeout, A1_4)
  if L2_5 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function adminSessionSettingsSet(A0_6)
  local L1_7
  L1_7 = _UPVALUE0_
  L1_7 = L1_7.NIL
  if A0_6 == L1_7 then
    L1_7 = _UPVALUE0_
    L1_7 = L1_7.INVALID_ARGUMENT
    return L1_7
  end
  L1_7 = nil
  L1_7 = db.setAttribute(_UPVALUE1_, _UPVALUE2_.groupCapabality, _UPVALUE2_.adminCapability, _UPVALUE2_.sessionTimeout, A0_6)
  if L1_7 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function guestSessionSettingsSet(A0_8)
  local L1_9
  L1_9 = _UPVALUE0_
  L1_9 = L1_9.NIL
  if A0_8 == L1_9 then
    L1_9 = _UPVALUE0_
    L1_9 = L1_9.INVALID_ARGUMENT
    return L1_9
  end
  L1_9 = nil
  L1_9 = db.setAttribute(_UPVALUE1_, _UPVALUE2_.groupCapabality, _UPVALUE2_.guestCapabaility, _UPVALUE2_.sessionTimeout, A0_8)
  if L1_9 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
