module(com.teamf1.bl.captiveportal.sessions, seeall)
require("teamf1lualib/db")
require("teamf1lualib/util")
require("teamf1lualib/validations")
require("teamf1lualib/returnCodes")
require("teamf1lualib/captiveportal_sessions")
require("teamf1lualib/config")
function sessionGet()
  local L0_0, L1_1, L2_2, L3_3
  L0_0, L1_1, L2_2, L3_3 = captiveportal_sessions.sessionGet()
  if L0_0 ~= SUCCESS then
    return L0_0
  end
  return L0_0, L1_1, L2_2, L3_3
end
function sessionGetNext(A0_4)
  local L1_5, L2_6, L3_7, L4_8, L5_9
  L1_5 = A0_4["captivePortalSessions.cookie"]
  if L1_5 == nil then
    L2_6 = util
    L2_6 = L2_6.appendDebugOut
    L3_7 = "GetNext : Invalid Cookie"
    L2_6(L3_7)
    L2_6 = returnCodes
    L2_6 = L2_6.BAD_PARAMETER
    return L2_6
  end
  L2_6, L3_7, L4_8, L5_9 = nil, nil, nil, nil
  L2_6, L3_7, L4_8, L5_9 = captiveportal_sessions.sessionGetNext(L1_5)
  if L2_6 ~= SUCCESS then
    return L2_6
  end
  return L2_6, L3_7, L4_8, L5_9
end
function sessionSet(A0_10)
  local L1_11, L2_12, L3_13, L4_14, L5_15
  L1_11 = ACCESS_LEVEL
  if L1_11 ~= 0 then
    L1_11 = util
    L1_11 = L1_11.appendDebugOut
    L2_12 = "Detected Unauthorized access for page captivePortalSessions"
    L1_11(L2_12)
    L1_11 = returnCodes
    L1_11 = L1_11.UNAUTHORIZED
    return L1_11
  end
  L1_11 = A0_10["captivePortalSessions.cookie"]
  L2_12 = A0_10["captivePortalSessions.user"]
  L3_13 = A0_10["captivePortalSessions.ipAddress"]
  if L1_11 == nil then
    L4_14 = util
    L4_14 = L4_14.appendDebugOut
    L5_15 = "Set : Invalid Cookie"
    L4_14(L5_15)
    L4_14 = returnCodes
    L4_14 = L4_14.BAD_PARAMETER
    return L4_14
  end
  if L2_12 == nil or L3_13 == nil then
    L4_14 = util
    L4_14 = L4_14.appendDebugOut
    L5_15 = "GetNext : Invalid Cookie"
    L4_14(L5_15)
    L4_14 = returnCodes
    L4_14 = L4_14.BAD_PARAMETER
    return L4_14
  end
  L4_14, L5_15 = nil, nil
  config.start()
  L4_14, L5_15 = captiveportal_sessions.sessionSet(L1_11, L2_12, L3_13)
  if L4_14 ~= returnCodes.SUCCESS then
    util.appendDebugOut("Error in configuring values in page captivePortalSessions " .. L4_14)
    config.abort()
    return L4_14, L1_11
  end
  config.complete()
  config.save()
  return returnCodes.SUCCESS, L5_15
end
function sessionCreate(A0_16)
  local L1_17, L2_18, L3_19, L4_20
  L1_17 = ACCESS_LEVEL
  if L1_17 ~= 0 then
    L1_17 = util
    L1_17 = L1_17.appendDebugOut
    L2_18 = "Detected Unauthorized access for page captivePortalSessions"
    L1_17(L2_18)
    L1_17 = returnCodes
    L1_17 = L1_17.UNAUTHORIZED
    return L1_17
  end
  L1_17 = A0_16["captivePortalSessions.user"]
  L2_18 = A0_16["captivePortalSessions.ipAddress"]
  if L1_17 == nil or L2_18 == nil then
    L3_19 = util
    L3_19 = L3_19.appendDebugOut
    L4_20 = "GetNext : Invalid Cookie"
    L3_19(L4_20)
    L3_19 = returnCodes
    L3_19 = L3_19.BAD_PARAMETER
    return L3_19
  end
  L3_19, L4_20 = nil, nil
  config.start()
  L3_19, L4_20 = captiveportal_sessions.sessionCreate(L1_17, L2_18)
  if L3_19 ~= returnCodes.SUCCESS then
    util.appendDebugOut("Error in configuring values in page captivePortalSessions " .. L3_19)
    config.abort()
    return L3_19, 0
  end
  config.complete()
  config.save()
  return returnCodes.SUCCESS, L4_20
end
function sessionDelete(A0_21)
  local L1_22, L2_23
  L1_22 = ACCESS_LEVEL
  if L1_22 ~= 0 then
    L1_22 = util
    L1_22 = L1_22.appendDebugOut
    L2_23 = "Detected Unauthorized access for page captivePortalSessions"
    L1_22(L2_23)
    L1_22 = returnCodes
    L1_22 = L1_22.UNAUTHORIZED
    return L1_22
  end
  L1_22 = A0_21["captivePortalSessions.cookie"]
  if L1_22 == nil then
    L2_23 = util
    L2_23 = L2_23.appendDebugOut
    L2_23("Delete : Invalid Cookie")
    L2_23 = returnCodes
    L2_23 = L2_23.BAD_PARAMETER
    return L2_23
  end
  L2_23 = nil
  config.start()
  L2_23, cookie = captiveportal_sessions.sessionDelete(L1_22)
  if L2_23 ~= returnCodes.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page captivePortalSessions " .. L2_23)
    config.abort()
    return L2_23, L1_22
  end
  config.complete()
  config.save()
  return returnCodes.SUCCESS, cookie
end
function userDefaultsGet()
  local L1_24
  L1_24 = returnCodes
  L1_24 = L1_24.NOT_SUPPORTED
  return L1_24
end
