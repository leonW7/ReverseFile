local L0_0
L0_0 = module
L0_0("com.teamf1.bl.lanqos.costoqueuemapping", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/lanqos_CosToQueueMapping")
L0_0 = {
  "Lowest",
  "Low",
  "Medium",
  "Highest"
}
function dot1pListGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  L0_1, L1_2, L2_3, L4_5 = _UPVALUE0_.trustModeGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  L3_4 = _UPVALUE2_[tonumber(L4_5) + 1]
  return L0_1, L1_2, L2_3, L3_4
end
function dot1pListGetNext(A0_6)
  local L1_7, L2_8, L3_9, L4_10, L5_11, L6_12
  L6_12 = A0_6["priority802.cookie"]
  if L6_12 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_7, L2_8, L3_9, L5_11 = _UPVALUE1_.trustModeGetNext(L6_12)
  if L1_7 ~= _UPVALUE0_.SUCCESS then
    return L1_7
  end
  L4_10 = _UPVALUE2_[tonumber(L5_11) + 1]
  return L1_7, L2_8, L3_9, L4_10
end
function dot1pPrioritySet(A0_13)
  local L1_14, L2_15, L3_16, L4_17
  L3_16 = A0_13["priority802.cookie"]
  L4_17 = A0_13["priority802.queue"]
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for priority802 page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if L3_16 == nil then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L4_17 == nil then
    util.appendDebugOut("Set : Invalid queue")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L3_16 = tonumber(L3_16)
  _UPVALUE1_.start()
  L1_14, cookie = _UPVALUE2_.queueSet(L3_16, L4_17)
  if L1_14 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in priority802 page" .. L1_14)
    _UPVALUE1_.abort()
    return L1_14
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_14, cookie
end
function dot1pPriorityListGet()
  local L0_18, L1_19, L2_20, L3_21, L4_22, L5_23, L6_24
  L5_23 = {}
  L6_24 = nil
  L0_18, L1_19, L2_20, L4_22 = _UPVALUE0_.trustModeGet()
  if L0_18 == _UPVALUE1_.SUCCESS then
    L6_24 = 1
    L5_23[L6_24] = {}
    L5_23[L6_24].cos = L2_20
    L3_21 = _UPVALUE2_[tonumber(L4_22) + 1]
    L5_23[L6_24].queue = L3_21
    L6_24 = L6_24 + 1
    while L0_18 == _UPVALUE1_.SUCCESS do
      L0_18, L1_19, L2_20, L4_22 = _UPVALUE0_.trustModeGetNext(L1_19)
      if L0_18 == _UPVALUE1_.SUCCESS then
        L5_23[L6_24] = {}
        L5_23[L6_24].cos = L2_20
        L3_21 = _UPVALUE2_[tonumber(L4_22) + 1]
        L5_23[L6_24].queue = L3_21
        L6_24 = L6_24 + 1
      end
    end
    return _UPVALUE1_.SUCCESS, L5_23
  else
    return L0_18
  end
end
function ip2dscpRemarkGetAll()
  local L0_25, L1_26
  L0_25, cos2queueTable = _UPVALUE0_.cosToQueueGetAll()
  if L0_25 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  for _FORV_5_, _FORV_6_ in pairs(cos2queueTable) do
    _FORV_6_.ethQueue = _UPVALUE2_[tonumber(_FORV_6_.ethQueue) + 1]
  end
  return _UPVALUE1_.SUCCESS, cos2queueTable
end
function cos2queueRemarkGetInfo(A0_27)
  local L1_28, L2_29
  curCookie = A0_27["priority802.cookie"]
  if curCookie == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_28, L2_29 = _UPVALUE1_.cosToQueueGetRow(curCookie)
  if L1_28 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  L2_29 = util.removePrefix(L2_29, "cosMarkMap.")
  return _UPVALUE0_.SUCCESS, L2_29
end
