local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wanqos.cos2dscp", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wanqos_cos2dscp")
L0_0 = "1"
function isCos2dscpMarkingEnabled()
  local L0_1, L1_2, L2_3
  L0_1, L1_2, L2_3 = _UPVALUE0_.isfeatureEnabled()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3
end
function cos2dscpMarkingSet(A0_4)
  local L1_5, L2_6, L3_7
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for cosDscpMarking page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L3_7 = A0_4["cosDscpMarking.status"]
  if L3_7 == nil then
    util.appendDebugOut("Set : Invalid table")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  if L3_7 == _UPVALUE2_ then
    L1_5, L2_6 = _UPVALUE3_.featureEnable()
  elseif L3_7 == _UPVALUE4_ then
    L1_5, L2_6 = _UPVALUE3_.featureDisable()
  end
  if L1_5 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in cosDscpMarking page" .. L1_5)
    _UPVALUE1_.abort()
    return L1_5
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_5, L2_6
end
function cosToDscpRemarkListGet()
  local L0_8, L1_9, L2_10, L3_11
  L0_8, L1_9, L3_11, L2_10 = _UPVALUE0_.cosToDscpRemarkGet()
  if L0_8 ~= _UPVALUE1_.SUCCESS then
    return L0_8
  end
  return L0_8, L1_9, L3_11, L2_10
end
function cosToDscpRemarkListGetNext(A0_12)
  local L1_13, L2_14, L3_15, L4_16, L5_17
  L5_17 = A0_12["cosDscpMarking.cookie"]
  if L5_17 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_13, L2_14, L4_16, L3_15 = _UPVALUE1_.cosToDscpRemarkGetNext(L5_17)
  if L1_13 ~= _UPVALUE0_.SUCCESS then
    return L1_13
  end
  return L1_13, L2_14, L4_16, L3_15
end
function cosToDscpRemarkSet(A0_18)
  local L1_19, L2_20, L3_21
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for cosDscpMarking page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L2_20 = A0_18["cosDscpMarking.cookie"]
  L3_21 = A0_18["cosDscpMarking.dscp"]
  if L2_20 == nil then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L3_21 == nil then
    util.appendDebugOut("Set : Invalid dscp")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L2_20 = tonumber(L2_20)
  L3_21 = tonumber(L3_21)
  L1_19, cookie = _UPVALUE2_.dscpSet(L2_20, L3_21)
  if L1_19 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in cosDscpMarking page" .. L1_19)
    _UPVALUE1_.abort()
    return L1_19
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_19, cookie
end
function cosToDscpRemarkGroupGet()
  local L0_22, L1_23, L2_24, L3_25, L4_26, L5_27
  L4_26 = {}
  L5_27 = nil
  L0_22, L1_23, L2_24, L3_25 = _UPVALUE0_.cosToDscpRemarkGet()
  if L0_22 == _UPVALUE1_.SUCCESS then
    L5_27 = 1
    L4_26[L5_27] = {}
    L4_26[L5_27].cos = L2_24
    L4_26[L5_27].dscp = L3_25
    L5_27 = L5_27 + 1
    while L0_22 == _UPVALUE1_.SUCCESS do
      L0_22, L1_23, L2_24, L3_25 = _UPVALUE0_.cosToDscpRemarkGetNext(L1_23)
      if L0_22 == _UPVALUE1_.SUCCESS then
        L4_26[L5_27] = {}
        L4_26[L5_27].cos = L2_24
        L4_26[L5_27].dscp = L3_25
        L5_27 = L5_27 + 1
      end
    end
    return _UPVALUE1_.SUCCESS, L4_26
  else
    return L0_22
  end
end
function cos2dscpRemarkGetAll()
  local L0_28, L1_29
  L0_28, L1_29 = _UPVALUE0_.cos2dscpGetAll()
  if L0_28 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_29
end
function cos2dscpRemarkGetInfo(A0_30)
  local L1_31, L2_32
  curCookie = A0_30["cosDscpMarking.cookie"]
  if curCookie == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_31, L2_32 = _UPVALUE1_.cos2dscpGetRow(curCookie)
  if L1_31 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  L2_32 = util.removePrefix(L2_32, "cosMarkMap.")
  return _UPVALUE0_.SUCCESS, L2_32
end
