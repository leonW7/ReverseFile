local L0_0
L0_0 = module
L0_0("com.teamf1.bl.billingUser", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/frontDesk_core")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function getViewDetails(A0_1)
  return (_UPVALUE0_.viewAccountDetails(A0_1))
end
function curUserProfileGet(A0_2)
  local L1_3, L2_4
  L1_3 = _UPVALUE0_
  L1_3 = L1_3.viewProfileDetails
  L2_4 = A0_2
  L2_4 = L1_3(L2_4)
  return L1_3, L2_4
end
function extendSessionSet(A0_5)
  local L1_6, L2_7
  L1_6 = ACCESS_LEVEL
  if L1_6 ~= 2 then
    L1_6 = ACCESS_LEVEL
    if L1_6 == 0 then
      L1_6 = ADMIN_AND_FRONTDESK
      if L1_6 == 0 then
        L1_6 = util
        L1_6 = L1_6.appendDebugOut
        L2_7 = "Detected Unauthorized access for page billingDesk PAGE"
        L1_6(L2_7)
        L1_6 = _UPVALUE0_
        L1_6 = L1_6.UNAUTHORIZED
        return L1_6
      end
    end
  end
  L1_6 = A0_5["billingUsers.cookie"]
  if L1_6 == nil then
    L2_7 = util
    L2_7 = L2_7.appendDebugOut
    L2_7("Set : Invalid Cookie")
    L2_7 = _UPVALUE0_
    L2_7 = L2_7.BAD_PARAMETER
    return L2_7
  end
  L2_7 = nil
  _UPVALUE1_.start()
  L2_7 = _UPVALUE2_.extendSession(A0_5, L1_6)
  if L2_7 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page billingDesk PAGE" .. L2_7)
    _UPVALUE1_.abort()
    return L2_7, L1_6
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function billingUsersDelete(A0_8)
  local L1_9, L2_10
  L1_9 = ACCESS_LEVEL
  if L1_9 ~= 2 then
    L1_9 = ACCESS_LEVEL
    if L1_9 == 0 then
      L1_9 = ADMIN_AND_FRONTDESK
      if L1_9 == 0 then
        L1_9 = util
        L1_9 = L1_9.appendDebugOut
        L2_10 = "Detected Unauthorized access for page billingDesk PAGE"
        L1_9(L2_10)
        L1_9 = _UPVALUE0_
        L1_9 = L1_9.UNAUTHORIZED
        return L1_9
      end
    end
  end
  L1_9 = A0_8["billingsUsers.checkbox"]
  if L1_9 == nil then
    L2_10 = util
    L2_10 = L2_10.appendDebugOut
    L2_10("Delete : Invalid Cookie")
    L2_10 = _UPVALUE0_
    L2_10 = L2_10.BAD_PARAMETER
    return L2_10
  end
  L2_10 = nil
  db.execute("ATTACH '/tmp/cpAcc.db' as cpAccDB")
  _UPVALUE1_.start()
  L2_10 = _UPVALUE2_.tempUsersDelete(L1_9)
  if L2_10 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page billingDesk PAGE" .. L2_10)
    _UPVALUE1_.abort()
    db.execute("DETACH cpAccDB")
    return L2_10, L1_9
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  db.execute("DETACH cpAccDB")
  return _UPVALUE0_.SUCCESS, cookie
end
function billingUsersDeleteAll(A0_11)
  if ACCESS_LEVEL ~= 2 and ACCESS_LEVEL == 0 and ADMIN_AND_FRONTDESK == 0 then
    util.appendDebugOut("Detected Unauthorized access for page billingDesk PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  db.execute("ATTACH '/tmp/cpAcc.db' as cpAccDB")
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.tempUsersDeleteAll(A0_11)
  if returnCode == _UPVALUE0_.FAILURE then
    util.appendDebugOut("Error in Delete Operaion in temp users Delete" .. returnCode)
    _UPVALUE1_.abort()
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  db.execute("DETACH cpAccDB")
  return returnCode, curCookie
end
function getTempMultiloginRow(A0_12)
  if ACCESS_LEVEL ~= 2 and ACCESS_LEVEL == 0 and ADMIN_AND_FRONTDESK == 0 then
    util.appendDebugOut("Detected Unauthorized access for page billingDesk PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  return (_UPVALUE1_.getTempMultilogin(A0_12))
end
function latestLoginPart2(A0_13)
  if ACCESS_LEVEL ~= 2 and ACCESS_LEVEL == 0 and ADMIN_AND_FRONTDESK == 0 then
    util.appendDebugOut("Detected Unauthorized access for page billingDesk PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  return (_UPVALUE1_.latestLogin(A0_13))
end
