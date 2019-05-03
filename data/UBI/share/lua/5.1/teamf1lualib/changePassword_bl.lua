local L0_0
L0_0 = module
L0_0("com.teamf1.bl.changePwd", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/sslvpn_currentUsers")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/sslvpn_returnCodes")
L0_0 = require
L0_0("teamf1lualib/sslAdmin")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function changePasswordSet(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7
  L1_2 = ACCESS_LEVEL
  if L1_2 ~= 2 then
    L1_2 = util
    L1_2 = L1_2.appendDebugOut
    L2_3 = "Detected Unauthorized access for page changePassword page"
    L1_2(L2_3)
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.UNAUTHORIZED
    return L1_2
  end
  L1_2 = A0_1["changePassword.cookie"]
  L2_3 = A0_1["changePassword.oldPassword"]
  L3_4 = A0_1["changePassword.newPassword"]
  L4_5 = A0_1["changePassword.reTypePassword"]
  L5_6 = A0_1["changePassword.ipAddr"]
  L6_7 = _UPVALUE0_
  L6_7 = L6_7.NIL
  if L1_2 == L6_7 then
    L6_7 = util
    L6_7 = L6_7.appendDebugOut
    L6_7("Set : Invalid Cookie")
    L6_7 = _UPVALUE0_
    L6_7 = L6_7.BAD_PARAMETER
    return L6_7
  end
  L6_7 = _UPVALUE0_
  L6_7 = L6_7.NIL
  if L2_3 == L6_7 then
    L6_7 = util
    L6_7 = L6_7.appendDebugOut
    L6_7("Set : Invalid old password")
    L6_7 = _UPVALUE0_
    L6_7 = L6_7.BAD_PARAMETER
    return L6_7
  end
  L6_7 = _UPVALUE0_
  L6_7 = L6_7.NIL
  if L3_4 == L6_7 then
    L6_7 = util
    L6_7 = L6_7.appendDebugOut
    L6_7("Set : Invalid new password")
    L6_7 = _UPVALUE0_
    L6_7 = L6_7.BAD_PARAMETER
    return L6_7
  end
  L6_7 = _UPVALUE0_
  L6_7 = L6_7.NIL
  if L4_5 == L6_7 then
    L6_7 = util
    L6_7 = L6_7.appendDebugOut
    L6_7("Set : Invalid repeat password")
    L6_7 = _UPVALUE0_
    L6_7 = L6_7.BAD_PARAMETER
    return L6_7
  end
  L6_7 = _UPVALUE0_
  L6_7 = L6_7.NIL
  if L5_6 == L6_7 then
    L6_7 = util
    L6_7 = L6_7.appendDebugOut
    L6_7("Set : Invalid IPADDRESS")
    L6_7 = _UPVALUE0_
    L6_7 = L6_7.BAD_PARAMETER
    return L6_7
  end
  if L3_4 ~= L4_5 then
    L6_7 = _UPVALUE1_
    L6_7 = L6_7.PASSWORD_NOTSAME
    return L6_7
  end
  L6_7 = _UPVALUE2_
  L6_7 = L6_7.start
  L6_7()
  L6_7 = _UPVALUE3_
  L6_7 = L6_7.changePassword
  L6_7 = L6_7(L1_2, L5_6, L2_3, L3_4, L4_5)
  if L6_7 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page changePassword" .. L6_7)
    _UPVALUE2_.abort()
    return L6_7
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  if sslAdmin.logout(L1_2, L5_6) ~= 0 then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
