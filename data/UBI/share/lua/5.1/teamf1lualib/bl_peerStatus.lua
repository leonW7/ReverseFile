local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.peerstatus", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/peerstatus_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).status = 1
;({}).totalCount = 2
;({}).successCount = 3
;({}).failureCount = 4
;({}).peerIpAddress = 1
;({}).configRequestStatus = 2
function peerRequeustStatusGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  L2_3 = {}
  L3_4 = {}
  L4_5 = 1
  L0_1, L1_2, peerSyncTbl = _UPVALUE0_.peerstatusGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  for _FORV_8_, _FORV_9_ in pairs(_UPVALUE2_) do
    L2_3[_FORV_8_] = L1_2[_FORV_9_]
  end
  if peerSyncTbl ~= _UPVALUE1_.NIL then
    for _FORV_8_, _FORV_9_ in pairs(peerSyncTbl) do
      L3_4[L4_5] = {}
      for _FORV_13_, _FORV_14_ in pairs(_UPVALUE3_) do
        L3_4[L4_5][_FORV_13_] = _FORV_9_[_FORV_14_]
      end
      L4_5 = L4_5 + 1
    end
  end
  return L0_1, L2_3, L3_4
end
function peerConfigSyncStatusGet()
  local L0_6, L1_7, L2_8, L3_9
  L1_7 = {}
  L2_8 = nil
  L3_9 = 1
  L0_6, L2_8 = _UPVALUE0_.peerstatusGet()
  if L0_6 ~= _UPVALUE1_.SUCCESS then
    return L0_6
  end
  for _FORV_7_, _FORV_8_ in pairs(L2_8) do
    L1_7[L3_9] = {}
    for _FORV_12_, _FORV_13_ in pairs(_UPVALUE2_) do
      L1_7[L3_9][_FORV_12_] = _FORV_8_[_FORV_13_]
    end
    L3_9 = L3_9 + 1
  end
  if L0_6 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in configuring values in peerConfiguration page" .. L0_6)
  end
  return L0_6, L1_7
end
function peerConfigSyncStatusSet(A0_10)
  local L1_11, L2_12
  L2_12 = {}
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for lanQos page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_10["peerStatus.peerIpAddress"] == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L2_12.peerIpAddress = A0_10["peerStatus.peerIpAddress"]
  L1_11 = _UPVALUE1_.peerstatusConfigPush(L2_12)
  if L1_11 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in peerStatus page" .. L1_11)
  end
  return L1_11
end
function peerConfigSyncAllStatusSet()
  local L0_13
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for lanQos page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L0_13 = _UPVALUE1_.peerstatusConfigPushAll()
  if L0_13 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in peerStatus page" .. L0_13)
  end
  return L0_13
end
