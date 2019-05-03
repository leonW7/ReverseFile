local L0_0
L0_0 = module
L0_0("com.teamf1.bl.captiveportal.sla", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/captiveportal_sla")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function captivePortalSlaGet()
  local L0_1, L1_2
  L1_2, L0_1 = _UPVALUE0_.slaGet()
  if L1_2 ~= _UPVALUE1_.SUCCESS then
    return L1_2
  end
  return L1_2, L0_1
end
function captivePortalSlaGetNext(A0_3)
  local L1_4, L2_5, L3_6
  L1_4 = A0_3["captivePortalSla.cookie"]
  if L1_4 == nil then
    L2_5 = util
    L2_5 = L2_5.appendDebugOut
    L3_6 = "GetNext : Invalid Cookie"
    L2_5(L3_6)
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.BAD_PARAMETER
    return L2_5
  end
  L2_5, L3_6 = nil, nil
  L2_5, L3_6 = _UPVALUE1_.slaGetNext(L1_4)
  if L2_5 ~= SUCCESS then
    return L2_5
  end
  return L2_5
end
function captivePortalSlaSet(A0_7)
  local L1_8, L2_9, L3_10
  L1_8 = ACCESS_LEVEL
  if L1_8 ~= 0 then
    L1_8 = util
    L1_8 = L1_8.appendDebugOut
    L2_9 = "Detected Unauthorized access for page captivePortalSla"
    L1_8(L2_9)
    L1_8 = _UPVALUE0_
    L1_8 = L1_8.UNAUTHORIZED
    return L1_8
  end
  L1_8 = A0_7["captivePortal.sla"]
  if L1_8 == nil then
    L2_9 = util
    L2_9 = L2_9.appendDebugOut
    L3_10 = "GetNext : Invalid Cookie"
    L2_9(L3_10)
    L2_9 = _UPVALUE0_
    L2_9 = L2_9.BAD_PARAMETER
    return L2_9
  end
  L2_9, L3_10 = nil, nil
  _UPVALUE1_.start()
  L2_9 = _UPVALUE2_.slaSet(L1_8)
  if L2_9 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page captivePortalSla " .. L2_9)
    _UPVALUE1_.abort()
    return L2_9, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L3_10
end
function captivePortalSlaDefaultsGet()
  local L1_11
  L1_11 = _UPVALUE0_
  L1_11 = L1_11.NOT_SUPPORTED
  return L1_11
end
