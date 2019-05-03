local L0_0
L0_0 = module
L0_0("com.teamf1.bl.routing.ospfv3", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/routing_ospfv3")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function ospfV3SectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8
  L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8 = _UPVALUE0_.routeGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8
end
function ospfV3SectionGetNext(A0_9)
  local L1_10, L2_11, L3_12, L4_13, L5_14, L6_15, L7_16, L8_17, L9_18
  L1_10 = A0_9["ospfV3.cookie"]
  L2_11 = _UPVALUE0_
  L2_11 = L2_11.NIL
  if L1_10 == L2_11 then
    L2_11 = util
    L2_11 = L2_11.appendDebugOut
    L3_12 = "GetNext : Invalid Cookie"
    L2_11(L3_12)
    L2_11 = _UPVALUE0_
    L2_11 = L2_11.BAD_PARAMETER
    return L2_11
  end
  L2_11, L3_12, L4_13, L5_14, L6_15, L7_16, L8_17, L9_18 = nil, nil, nil, nil, nil, nil, nil, nil
  L2_11, L3_12, L4_13, L5_14, L6_15, L7_16, L8_17, L9_18 = _UPVALUE1_.routeGetNext(L1_10)
  if L2_11 ~= _UPVALUE0_.SUCCESS then
    return L2_11
  end
  return L2_11, L3_12, L4_13, L5_14, L6_15, L7_16, L8_17, L9_18
end
function ospfV3SectionSet(A0_19)
  local L1_20, L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27
  L1_20 = ACCESS_LEVEL
  if L1_20 ~= 0 then
    L1_20 = util
    L1_20 = L1_20.appendDebugOut
    L2_21 = "Detected Unauthorized access for page ospfV3"
    L1_20(L2_21)
    L1_20 = _UPVALUE0_
    L1_20 = L1_20.UNAUTHORIZED
    return L1_20
  end
  L1_20 = A0_19["ospfV3.cookie"]
  L2_21 = A0_19["ospfV3.configure"]
  L3_22 = A0_19["ospfV3.priority"]
  L4_23 = A0_19["ospfV3.helloInterval"]
  L5_24 = A0_19["ospfV3.deadInterval"]
  L6_25 = A0_19["ospfV3.cost"]
  L7_26 = _UPVALUE0_
  L7_26 = L7_26.NIL
  if L1_20 == L7_26 then
    L7_26 = util
    L7_26 = L7_26.appendDebugOut
    L8_27 = "Set : Invalid Cookie"
    L7_26(L8_27)
    L7_26 = _UPVALUE0_
    L7_26 = L7_26.BAD_PARAMETER
    return L7_26
  end
  L7_26 = _UPVALUE1_
  if L2_21 == L7_26 then
    L7_26 = _UPVALUE0_
    L7_26 = L7_26.NIL
    if L3_22 == L7_26 then
      L7_26 = util
      L7_26 = L7_26.appendDebugOut
      L8_27 = "Set : Invalid priority"
      L7_26(L8_27)
      L7_26 = _UPVALUE0_
      L7_26 = L7_26.BAD_PARAMETER
      return L7_26
    end
    L7_26 = _UPVALUE0_
    L7_26 = L7_26.NIL
    if L4_23 == L7_26 then
      L7_26 = util
      L7_26 = L7_26.appendDebugOut
      L8_27 = "Set : Invalid helloInterval"
      L7_26(L8_27)
      L7_26 = _UPVALUE0_
      L7_26 = L7_26.BAD_PARAMETER
      return L7_26
    end
    L7_26 = _UPVALUE0_
    L7_26 = L7_26.NIL
    if L5_24 == L7_26 then
      L7_26 = util
      L7_26 = L7_26.appendDebugOut
      L8_27 = "Set : Invalid deadInterval"
      L7_26(L8_27)
      L7_26 = _UPVALUE0_
      L7_26 = L7_26.BAD_PARAMETER
      return L7_26
    end
    L7_26 = _UPVALUE0_
    L7_26 = L7_26.NIL
    if L6_25 == L7_26 then
      L7_26 = util
      L7_26 = L7_26.appendDebugOut
      L8_27 = "Set : Invalid cost"
      L7_26(L8_27)
      L7_26 = _UPVALUE0_
      L7_26 = L7_26.BAD_PARAMETER
      return L7_26
    end
  end
  L7_26, L8_27 = nil, nil
  _UPVALUE2_.start()
  L7_26, L8_27 = _UPVALUE3_.routeSet(L1_20, L2_21, L3_22, L4_23, L5_24, L6_25)
  if L7_26 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page ospfV3" .. L7_26)
    _UPVALUE2_.abort()
    return L7_26, L1_20
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return _UPVALUE0_.SUCCESS, L8_27
end
function ospfV3SectionGetCur(A0_28)
  local L1_29, L2_30, L3_31, L4_32, L5_33, L6_34, L7_35, L8_36
  L1_29 = _UPVALUE0_
  L1_29 = L1_29.NIL
  if A0_28 == L1_29 then
    L1_29 = util
    L1_29 = L1_29.appendDebugOut
    L2_30 = "GetNext : Invalid Cookie"
    L1_29(L2_30)
    L1_29 = _UPVALUE0_
    L1_29 = L1_29.BAD_PARAMETER
    return L1_29
  end
  L1_29, L2_30, L3_31, L4_32, L5_33, L6_34, L7_35, L8_36 = nil, nil, nil, nil, nil, nil, nil, nil
  L1_29, L2_30, L3_31, L4_32, L5_33, L6_34, L7_35, L8_36 = _UPVALUE1_.routeGetCur(A0_28)
  if L1_29 ~= _UPVALUE0_.SUCCESS then
    return L1_29
  end
  return L1_29, L2_30, L3_31, L4_32, L5_33, L6_34, L7_35, L8_36
end
function ospfV3SectionGetAll()
  local L0_37, L1_38
  L1_38 = {}
  L0_37, L1_38 = _UPVALUE0_.routeGetAll()
  if L0_37 ~= _UPVALUE1_.SUCCESS then
    return L0_37
  end
  return L0_37, L1_38
end
