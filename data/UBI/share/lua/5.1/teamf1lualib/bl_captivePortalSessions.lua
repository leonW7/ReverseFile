local L0_0
L0_0 = module
L0_0("com.teamf1.bl.captiveportal.sessions", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/captiveportal_sessions")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/vlan_captivePortalBlockedClients")
L0_0 = require
L0_0("captivePortalLib")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function captivePortalSessionGet()
  local L0_1, L1_2, L2_3, L3_4
  L0_1, L1_2, L2_3, L3_4 = _UPVALUE0_.sessionGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3, L3_4
end
function captivePortalSessionGetNext(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10
  L5_10 = A0_5["captivePortalSessions.cookie"]
  if L5_10 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_6, L2_7, L3_8, L4_9 = _UPVALUE1_.sessionGetNext(L5_10)
  if L1_6 ~= _UPVALUE0_.SUCCESS then
    return L1_6
  end
  return L1_6, L2_7, L3_8, L4_9
end
function captivePortalSessionDisconnect(A0_11)
  local L1_12, L2_13, L3_14, L4_15
  L4_15 = A0_11["captivePortalSessions.cookie"]
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page DUMMY PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if L4_15 == nil then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L1_12, L2_13, L3_14 = _UPVALUE2_.sessionDelete(L4_15)
  if L1_12 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L1_12)
    _UPVALUE1_.abort()
    return L1_12
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_12, L2_13, L3_14
end
function captivePortalSessionListGet()
  local L0_16, L1_17, L2_18, L3_19, L4_20, L5_21
  L4_20 = {}
  L5_21 = nil
  L0_16, L1_17, L2_18, L3_19 = _UPVALUE0_.sessionGet()
  if L0_16 == _UPVALUE1_.SUCCESS then
    L5_21 = 1
    L4_20[L5_21] = {}
    L4_20[L5_21].user = L2_18
    L4_20[L5_21].ipAddress = L3_19
    L5_21 = L5_21 + 1
    while L0_16 == _UPVALUE1_.SUCCESS do
      L0_16, L1_17, L2_18, L3_19 = _UPVALUE0_.sessionGetNext(L1_17)
      if L0_16 == _UPVALUE1_.SUCCESS then
        L4_20[L5_21] = {}
        L4_20[L5_21].user = L2_18
        L4_20[L5_21].ipAddress = L3_19
        L5_21 = L5_21 + 1
      end
    end
    return _UPVALUE1_.SUCCESS, L4_20
  else
    return L0_16
  end
end
function blockedDevice(A0_22)
  local L1_23, L2_24, L3_25, L4_26, L5_27, L6_28
  L3_25 = A0_22["captivePortalSessions.cookie"]
  L4_26 = A0_22["captivePortalSessions.ipAddress"]
  L5_27 = "Blocked"
  L6_28 = nil
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page DUMMY PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if L4_26 == nil then
    util.appendDebugOut("Set : Invalid ipAddress")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L3_25 == nil then
    util.appendDebugOut("Set : Invalid cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L2_24 = captivePortalLib.macAddrGet(L4_26)
  if L2_24 == nil then
    return _UPVALUE0_.FAILURE
  end
  _UPVALUE1_.start()
  L1_23, L6_28 = _UPVALUE2_.blockedClientCreate(L2_24, L5_27)
  if L1_23 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L1_23)
    _UPVALUE1_.abort()
    return L1_23
  end
  L1_23 = captivePortalSessionDisconnect(A0_22)
  if L1_23 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L1_23)
    _UPVALUE1_.abort()
    return L1_23
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_23, L6_28
end
function sessionGetAll()
  local L0_29, L1_30
  L0_29, L1_30 = _UPVALUE0_.captivePortalSessionGetAll()
  if L0_29 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_30
end
