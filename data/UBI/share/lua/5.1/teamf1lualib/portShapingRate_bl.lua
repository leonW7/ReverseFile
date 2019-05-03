local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/lanqos_trafficShaping")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
portShappingPageName = "portShapping"
function portShapingRateGetAll()
  local L0_1, L1_2
  L0_1, L1_2 = _UPVALUE0_.trafficShapingGetAll()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2
end
function portShapingRateGet(A0_3)
  local L1_4, L2_5, L3_6, L4_7
  L1_4, L4_7, L2_5, L3_6 = _UPVALUE0_.portRateCurGet(A0_3)
  if L1_4 ~= _UPVALUE1_.SUCCESS then
    return L1_4
  end
  return L1_4, L4_7, L2_5, L3_6
end
function portShapingRateGetNext(A0_8)
  local L1_9, L2_10, L3_11, L4_12, L5_13
  L1_9 = A0_8["portShaping.cookie"]
  if L1_9 == nil then
    L2_10 = util
    L2_10 = L2_10.appendDebugOut
    L3_11 = "GetNext : Invalid Cookie"
    L2_10(L3_11)
    L2_10 = _UPVALUE0_
    L2_10 = L2_10.BAD_PARAMETER
    return L2_10
  end
  L2_10, L3_11, L4_12, L5_13 = nil, nil, nil, nil
  L2_10, L5_13, L3_11, L4_12 = _UPVALUE1_.lanqos_trafficShaping.portRateGet(L1_9)
  if L2_10 ~= _UPVALUE0_.SUCCESS then
    return L2_10
  end
  return L2_10, L5_13, L3_11, L4_12
end
function portShapingRateSet(A0_14)
  local L1_15, L2_16, L3_17, L4_18
  L1_15 = ACCESS_LEVEL
  if L1_15 ~= 0 then
    L1_15 = util
    L1_15 = L1_15.appendDebugOut
    L2_16 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_15(L2_16)
    L1_15 = _UPVALUE0_
    L1_15 = L1_15.UNAUTHORIZED
    return L1_15
  end
  L1_15 = A0_14["portShaping.cookie"]
  L2_16 = A0_14["portShaping.shape"]
  if L1_15 == nil then
    L3_17 = util
    L3_17 = L3_17.appendDebugOut
    L4_18 = "Set : Invalid Cookie"
    L3_17(L4_18)
    L3_17 = _UPVALUE0_
    L3_17 = L3_17.BAD_PARAMETER
    return L3_17
  end
  if L2_16 == nil then
    L3_17 = util
    L3_17 = L3_17.appendDebugOut
    L4_18 = "GetNext : Invalid Cookie"
    L3_17(L4_18)
    L3_17 = _UPVALUE0_
    L3_17 = L3_17.BAD_PARAMETER
    return L3_17
  end
  L3_17, L4_18 = nil, nil
  _UPVALUE1_.start()
  L3_17, L4_18 = _UPVALUE2_.shapeSet(L1_15, L2_16)
  if L3_17 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L3_17)
    _UPVALUE1_.abort()
    return L3_17, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L4_18
end
function portShapingRateDelete(A0_19)
  return _UPVALUE0_.NOT_SUPPORTED
end
function portShapingRateDefaultsGet()
  local L0_20, L1_21, L3_22, L4_23, L5_24
  L1_21 = 0
  L3_22 = _UPVALUE0_
  L3_22 = L3_22.SUCCESS
  L4_23 = 0
  L5_24 = L0_20
  return L3_22, L4_23, L5_24, L1_21
end
function portShapingRateCreate(A0_25)
  return _UPVALUE0_.NOT_SUPPORTED
end
