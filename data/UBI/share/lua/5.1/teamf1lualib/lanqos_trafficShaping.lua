local L0_0
L0_0 = module
L0_0("com.teamf1.core.lanqos.trafficshaping", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/lanqos_qosOnLan")
L0_0 = require
L0_0("teamf1lualib/lanqos_cookie")
L0_0 = require
L0_0("teamf1lualib/qos_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
trafficshapingTable = "PortRateControl"
;({}).port = "portName"
;({}).shape = "portRatePct"
function portGet()
  local L0_1, L1_2, L2_3
  L1_2, L2_3 = cookieGet(trafficshapingTable, _UPVALUE0_)
  if _UPVALUE1_.SUCCESS ~= L1_2 then
    return _UPVALUE1_.FAILURE
  end
  L0_1 = db.getAttribute(trafficshapingTable, _UPVALUE0_, L2_3, _UPVALUE2_.port)
  if L0_1 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L2_3, L0_1
end
function portGetNext(A0_4)
  local L1_5, L2_6
  if A0_4 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L1_5, A0_4 = cookieGetNext(trafficshapingTable, _UPVALUE1_, A0_4)
  if _UPVALUE0_.SUCCESS ~= L1_5 then
    return L1_5
  end
  L2_6 = db.getAttribute(trafficshapingTable, _UPVALUE1_, A0_4, _UPVALUE2_.port)
  if L2_6 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_4
  end
  return _UPVALUE0_.SUCCESS, A0_4, L2_6
end
function portSet(A0_7, A1_8)
  local L3_9
  L3_9 = _UPVALUE0_
  L3_9 = L3_9.NOT_SUPPORTED
  return L3_9, A0_7
end
function portDelete(A0_10, A1_11)
  local L3_12
  L3_12 = _UPVALUE0_
  L3_12 = L3_12.NOT_SUPPORTED
  return L3_12, A0_10
end
function shapeGet()
  local L0_13, L1_14, L2_15
  L1_14, L2_15 = cookieGet(trafficshapingTable, _UPVALUE0_)
  if _UPVALUE1_.SUCCESS ~= L1_14 then
    return _UPVALUE1_.FAILURE
  end
  L0_13 = db.getAttribute(trafficshapingTable, _UPVALUE0_, L2_15, _UPVALUE2_.shape)
  if L0_13 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L2_15, L0_13
end
function shapeGetNext(A0_16)
  local L1_17, L2_18
  if A0_16 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L1_17, A0_16 = cookieGetNext(trafficshapingTable, _UPVALUE1_, A0_16)
  if _UPVALUE0_.SUCCESS ~= L1_17 then
    return L1_17
  end
  L2_18 = db.getAttribute(trafficshapingTable, _UPVALUE1_, A0_16, _UPVALUE2_.shape)
  if L2_18 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_16
  end
  return _UPVALUE0_.SUCCESS, A0_16, L2_18
end
function shapeSet(A0_19, A1_20)
  local L2_21, L3_22, L4_23, L5_24, L6_25, L7_26
  L7_26 = _UPVALUE0_
  L7_26 = L7_26.NIL
  if A1_20 == L7_26 then
    L7_26 = _UPVALUE0_
    L7_26 = L7_26.INVALID_ARGUMENT
    return L7_26
  end
  L7_26 = tonumber
  L7_26 = L7_26(A1_20)
  if L7_26 < _UPVALUE1_ or L7_26 > _UPVALUE2_ or math.mod(L7_26, _UPVALUE3_) ~= 0 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A0_19 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L3_22, L4_23, L5_24 = _UPVALUE4_.isfeatureEnabled()
  if _UPVALUE0_.SUCCESS ~= L3_22 or _UPVALUE5_ ~= L5_24 then
    return _UPVALUE6_.LANQOS_DISABLED
  end
  L2_21 = db.existsRow(trafficshapingTable, _UPVALUE7_, A0_19)
  if not L2_21 then
    return _UPVALUE6_.TRAFFIC_SHAPING_INVALID_COOKIE
  end
  L6_25 = db.setAttribute(trafficshapingTable, _UPVALUE7_, A0_19, _UPVALUE8_.shape, A1_20)
  if not L6_25 then
    return _UPVALUE0_.FAILURE, A0_19
  end
  return _UPVALUE0_.SUCCESS, A0_19
end
function portRateGet()
  local L0_27, L1_28, L2_29, L3_30, L4_31, L5_32
  L4_31, L5_32 = cookieGet(trafficshapingTable, _UPVALUE0_)
  if _UPVALUE1_.SUCCESS ~= L4_31 then
    return _UPVALUE1_.FAILURE
  end
  L3_30 = db.getRow(trafficshapingTable, _UPVALUE0_, L5_32)
  if L3_30 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  L1_28 = L3_30[trafficshapingTable .. "." .. _UPVALUE2_.port]
  L2_29 = L3_30[trafficshapingTable .. "." .. _UPVALUE2_.shape]
  return _UPVALUE1_.SUCCESS, L5_32, L1_28, L2_29
end
function portRateGetNext(A0_33)
  local L1_34, L2_35
  L2_35 = {}
  if A0_33 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L1_34, A0_33 = cookieGetNext(trafficshapingTable, _UPVALUE1_, A0_33)
  if _UPVALUE0_.SUCCESS ~= L1_34 then
    return L1_34
  end
  L2_35 = db.getRow(trafficshapingTable, _UPVALUE1_, A0_33)
  if L2_35 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  port = L2_35[trafficshapingTable .. "." .. _UPVALUE2_.port]
  shape = L2_35[trafficshapingTable .. "." .. _UPVALUE2_.shape]
  return _UPVALUE0_.SUCCESS, A0_33, port, shape
end
function portRateSet(A0_36, A1_37, A2_38)
  local L4_39
  L4_39 = _UPVALUE0_
  L4_39 = L4_39.NOT_SUPPORTED
  return L4_39, A0_36
end
function portRateCreate(A0_40, A1_41)
  local L3_42
  L3_42 = _UPVALUE0_
  L3_42 = L3_42.NOT_SUPPORTED
  return L3_42, _UPVALUE1_
end
function portRateDelete(A0_43)
  local L2_44
  L2_44 = _UPVALUE0_
  L2_44 = L2_44.NOT_SUPPORTED
  return L2_44, A0_43
end
function trafficShapingGetAll()
  local L0_45
  L0_45 = db
  L0_45 = L0_45.getTable
  L0_45 = L0_45(trafficshapingTable, false)
  if L0_45 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_45
end
function portRateCurGet(A0_46)
  local L1_47, L2_48, L3_49, L4_50
  if A0_46 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L1_47 = db.existsRow(trafficshapingTable, _UPVALUE1_, A0_46)
  if not L1_47 then
    return _UPVALUE0_.TRAFFIC_SHAPING_INVALID_COOKIE
  end
  L4_50 = db.getRow(trafficshapingTable, _UPVALUE1_, A0_46)
  if L4_50 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L2_48 = L4_50[trafficshapingTable .. "." .. _UPVALUE2_.port]
  L3_49 = L4_50[trafficshapingTable .. "." .. _UPVALUE2_.shape]
  return _UPVALUE0_.SUCCESS, A0_46, L2_48, L3_49
end
