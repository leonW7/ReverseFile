local L0_0
L0_0 = module
L0_0("com.teamf1.bl.system.management", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/system_management")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.system.management")
;({}).name = "name"
;({}).cookie = "cookie"
function systemSettingSet(A0_1)
  local L1_2, L2_3
  L1_2 = ACCESS_LEVEL
  if L1_2 ~= 0 then
    L1_2 = util
    L1_2 = L1_2.appendDebugOut
    L2_3 = "Detected unauthorized access for adminSettings"
    L1_2(L2_3)
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.UNAUTHORIZED
    return L1_2
  end
  L1_2 = _UPVALUE1_
  L2_3 = "."
  L1_2 = L1_2 .. L2_3 .. _UPVALUE2_.name
  L1_2 = A0_1[L1_2]
  L2_3 = _UPVALUE1_
  L2_3 = L2_3 .. "." .. _UPVALUE2_.cookie
  L2_3 = A0_1[L2_3]
  if L2_3 == _UPVALUE0_.NIL then
    util.appenDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L1_2 == _UPVALUE0_.NIL then
    util.appenDebugOut("GetNext : Invalid system name ")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE3_.start()
  returnCode, cookie = _UPVALUE4_.systemnameSet(L2_3, L1_2)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in adminSetting page" .. returnCode)
    _UPVALUE3_.abort()
    return returnCode
  end
  _UPVALUE3_.complete()
  _UPVALUE3_.save()
  return returnCode, cookie
end
function systemSettingGet()
  local L0_4, L1_5
  returnCode, L0_4, L1_5 = _UPVALUE0_.systemnameGet()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, L0_4, L1_5
end
