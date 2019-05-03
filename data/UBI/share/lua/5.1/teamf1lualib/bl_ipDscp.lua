local L0_0
L0_0 = module
L0_0("com.teamf1.bl.lanqos.dscptoqueuemapping", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/lanqos_dscpToQueueMapping")
L0_0 = {
  "Lowest",
  "Low",
  "Medium",
  "Highest"
}
function IPdscpListGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  L0_1, L1_2, L2_3, L4_5 = _UPVALUE0_.mapGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  L3_4 = _UPVALUE2_[tonumber(L4_5) + 1]
  return L0_1, L1_2, L2_3, L3_4
end
function IPdscpListGetNext(A0_6)
  local L1_7, L2_8, L3_9, L4_10, L5_11
  curCookie = A0_6["ipDscp.cookie"]
  if curCookie == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_7, L2_8, L3_9, L5_11 = _UPVALUE1_.mapGetNext(curCookie)
  if L1_7 ~= _UPVALUE0_.SUCCESS then
    return L1_7
  end
  L4_10 = _UPVALUE2_[tonumber(L5_11) + 1]
  return L1_7, L2_8, L3_9, L4_10
end
function IPdscpQueueSet(A0_12)
  local L1_13, L2_14, L3_15, L4_16
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for ipDscp page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L3_15 = A0_12["ipDscp.cookie"]
  L4_16 = A0_12["ipDscp.queue"]
  if L3_15 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L3_15 = tonumber(L3_15)
  L1_13, cookie = _UPVALUE2_.queueSet(L3_15, L4_16)
  if L1_13 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in ipDscp page" .. L1_13)
    _UPVALUE1_.abort()
    return L1_13
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_13, cookie
end
function IPdscpGroupGet()
  local L0_17, L1_18, L2_19, L3_20, L4_21, L5_22, L6_23
  L5_22 = {}
  L6_23 = nil
  L0_17, L1_18, L2_19, L4_21 = _UPVALUE0_.mapGet()
  if L0_17 == _UPVALUE1_.SUCCESS then
    L6_23 = 1
    L5_22[L6_23] = {}
    L5_22[L6_23].dscp = L2_19
    L3_20 = _UPVALUE2_[tonumber(L4_21) + 1]
    L5_22[L6_23].queue = L3_20
    L6_23 = L6_23 + 1
    while L0_17 == _UPVALUE1_.SUCCESS do
      L0_17, L1_18, L2_19, L4_21 = _UPVALUE0_.mapGetNext(L1_18)
      if L0_17 == _UPVALUE1_.SUCCESS then
        L5_22[L6_23] = {}
        L5_22[L6_23].dscp = L2_19
        L3_20 = _UPVALUE2_[tonumber(L4_21) + 1]
        L5_22[L6_23].queue = L3_20
        L6_23 = L6_23 + 1
      end
    end
    return _UPVALUE1_.SUCCESS, L5_22
  else
    return L0_17
  end
end
function ip2dscpRemarkGetAll()
  local L0_24, L1_25
  L0_24, L1_25 = _UPVALUE0_.dscpToQueueGetAll()
  if L0_24 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  for _FORV_5_, _FORV_6_ in pairs(L1_25) do
    _FORV_6_.ethQueue = _UPVALUE2_[tonumber(_FORV_6_.ethQueue) + 1]
  end
  return _UPVALUE1_.SUCCESS, L1_25
end
function ip2dscpRemarkGetInfo(A0_26)
  local L1_27, L2_28
  curCookie = A0_26["ipDscp.cookie"]
  if curCookie == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_27, L2_28 = _UPVALUE1_.dscpToQueueGetRow(curCookie)
  if L1_27 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  L2_28 = util.removePrefix(L2_28, "dscpMarkMap.")
  return _UPVALUE0_.SUCCESS, L2_28
end
