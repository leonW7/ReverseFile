local L0_0
L0_0 = module
L0_0("com.teamf1.bl.ipv6.ipv6_wanclients.static_routes", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/ipv6_wanclients_static_routes")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function staticRoutingSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10
  L0_1 = _UPVALUE0_
  L0_1 = L0_1.staticRouteGet
  L8_9 = L0_1()
  L9_10 = _UPVALUE1_
  L9_10 = L9_10.SUCCESS
  if L0_1 ~= L9_10 then
    return L0_1
  end
  L9_10 = {}
  L9_10["ipv6StaticRouting.routeName"] = L2_3
  L9_10["ipv6StaticRouting.active"] = L3_4
  L9_10["ipv6StaticRouting.destinationIpAddress"] = L4_5
  L9_10["ipv6StaticRouting.prefixLength"] = L5_6
  L9_10["ipv6StaticRouting.interface"] = L6_7
  L9_10["ipv6StaticRouting.gatewayIpAddress"] = L7_8
  L9_10["ipv6StaticRouting.metric"] = L8_9
  return L0_1, L1_2, L9_10
end
function staticRoutingSectionGetNext(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20, L10_21, L11_22
  L1_12 = A0_11["ipv6StaticRouting.cookie"]
  if L1_12 == nil then
    L2_13 = util
    L2_13 = L2_13.appendDebugOut
    L3_14 = "GetNext : Invalid Cookie"
    L2_13(L3_14)
    L2_13 = _UPVALUE0_
    L2_13 = L2_13.BAD_PARAMETER
    return L2_13
  end
  L2_13 = _UPVALUE1_
  L2_13 = L2_13.staticRouteGetNext
  L3_14 = L1_12
  L10_21 = L2_13(L3_14)
  L11_22 = _UPVALUE0_
  L11_22 = L11_22.SUCCESS
  if L2_13 ~= L11_22 then
    return L2_13
  end
  L11_22 = {}
  L11_22["ipv6StaticRouting.routeName"] = L4_15
  L11_22["ipv6StaticRouting.active"] = L5_16
  L11_22["ipv6StaticRouting.destinationIpAddress"] = L6_17
  L11_22["ipv6StaticRouting.prefixLength"] = L7_18
  L11_22["ipv6StaticRouting.interface"] = L8_19
  L11_22["ipv6StaticRouting.gatewayIpAddress"] = L9_20
  L11_22["ipv6StaticRouting.metric"] = L10_21
  return L2_13, L1_12, L11_22
end
function staticRoutingSectionGetCur(A0_23)
  local L1_24, L2_25, L3_26, L4_27, L5_28, L6_29, L7_30, L8_31, L9_32, L10_33
  if A0_23 == nil then
    L1_24 = util
    L1_24 = L1_24.appendDebugOut
    L2_25 = "GetNext : Invalid Cookie"
    L1_24(L2_25)
    L1_24 = _UPVALUE0_
    L1_24 = L1_24.BAD_PARAMETER
    return L1_24
  end
  L1_24 = _UPVALUE1_
  L1_24 = L1_24.staticRouteGetCur
  L2_25 = A0_23
  L9_32 = L1_24(L2_25)
  L10_33 = _UPVALUE0_
  L10_33 = L10_33.SUCCESS
  if L1_24 ~= L10_33 then
    return L1_24
  end
  L10_33 = {}
  L10_33["ipv6StaticRouting.routeName"] = L3_26
  L10_33["ipv6StaticRouting.active"] = L4_27
  L10_33["ipv6StaticRouting.destinationIpAddress"] = L5_28
  L10_33["ipv6StaticRouting.prefixLength"] = L6_29
  L10_33["ipv6StaticRouting.interface"] = L7_30
  L10_33["ipv6StaticRouting.gatewayIpAddress"] = L8_31
  L10_33["ipv6StaticRouting.metric"] = L9_32
  return L1_24, A0_23, L10_33
end
function staticRoutingSectionSet(A0_34)
  local L1_35, L2_36, L3_37, L4_38, L5_39, L6_40, L7_41, L8_42
  L1_35 = ACCESS_LEVEL
  if L1_35 ~= 0 then
    L1_35 = util
    L1_35 = L1_35.appendDebugOut
    L2_36 = "Detected Unauthorized access for page ipv6StaticRouting"
    L1_35(L2_36)
    L1_35 = _UPVALUE0_
    L1_35 = L1_35.UNAUTHORIZED
    return L1_35
  end
  L1_35 = A0_34["ipv6StaticRouting.cookie"]
  L2_36 = A0_34["ipv6StaticRouting.routeName"]
  L3_37 = A0_34["ipv6StaticRouting.active"]
  L4_38 = A0_34["ipv6StaticRouting.destinationIpAddress"]
  L5_39 = A0_34["ipv6StaticRouting.prefixLength"]
  L6_40 = A0_34["ipv6StaticRouting.interface"]
  L7_41 = A0_34["ipv6StaticRouting.gatewayIpAddress"]
  L8_42 = A0_34["ipv6StaticRouting.metric"]
  if L1_35 == nil then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L2_36 == nil or L3_37 == nil or L4_38 == nil or L5_39 == nil or L6_40 == nil or L7_41 == nil or L8_42 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.staticRouteSet(L1_35, L2_36, L3_37, L4_38, L5_39, L6_40, L7_41, L8_42)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page ipv6StaticRouting" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode, L1_35
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function staticRoutingSectionCreate(A0_43)
  local L1_44, L2_45, L3_46, L4_47, L5_48, L6_49, L7_50, L8_51, L9_52
  L1_44 = ACCESS_LEVEL
  if L1_44 ~= 0 then
    L1_44 = util
    L1_44 = L1_44.appendDebugOut
    L2_45 = "Detected Unauthorized access for page ipv6StaticRouting"
    L1_44(L2_45)
    L1_44 = _UPVALUE0_
    L1_44 = L1_44.UNAUTHORIZED
    return L1_44
  end
  L1_44 = A0_43["ipv6StaticRouting.routeName"]
  L2_45 = A0_43["ipv6StaticRouting.active"]
  L3_46 = A0_43["ipv6StaticRouting.destinationIpAddress"]
  L4_47 = A0_43["ipv6StaticRouting.prefixLength"]
  L5_48 = A0_43["ipv6StaticRouting.interface"]
  L6_49 = A0_43["ipv6StaticRouting.gatewayIpAddress"]
  L7_50 = A0_43["ipv6StaticRouting.metric"]
  if L1_44 == nil or L2_45 == nil or L3_46 == nil or L4_47 == nil or L5_48 == nil or L6_49 == nil or L7_50 == nil then
    L8_51 = util
    L8_51 = L8_51.appendDebugOut
    L9_52 = "GetNext : Invalid Cookie"
    L8_51(L9_52)
    L8_51 = _UPVALUE0_
    L8_51 = L8_51.BAD_PARAMETER
    return L8_51
  end
  L8_51 = _UPVALUE1_
  L8_51 = L8_51.start
  L8_51()
  L8_51 = _UPVALUE2_
  L8_51 = L8_51.staticRouteCreate
  L9_52 = L1_44
  L9_52 = L8_51(L9_52, L2_45, L3_46, L4_47, L5_48, L6_49, L7_50)
  if L8_51 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page ipv6StaticRouting" .. L8_51)
    _UPVALUE1_.abort()
    return L8_51, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L9_52
end
function staticRoutingSectionDelete(A0_53)
  local L1_54, L2_55, L3_56
  L1_54 = ACCESS_LEVEL
  if L1_54 ~= 0 then
    L1_54 = util
    L1_54 = L1_54.appendDebugOut
    L2_55 = "Detected Unauthorized access for page ipv6StaticRouting"
    L1_54(L2_55)
    L1_54 = _UPVALUE0_
    L1_54 = L1_54.UNAUTHORIZED
    return L1_54
  end
  L1_54 = A0_53["ipv6StaticRouting.cookie"]
  if L1_54 == nil then
    L2_55 = util
    L2_55 = L2_55.appendDebugOut
    L3_56 = "Set : Invalid Cookie"
    L2_55(L3_56)
    L2_55 = _UPVALUE0_
    L2_55 = L2_55.BAD_PARAMETER
    return L2_55
  end
  L2_55 = _UPVALUE1_
  L2_55 = L2_55.start
  L2_55()
  L2_55 = _UPVALUE2_
  L2_55 = L2_55.staticRouteDelete
  L3_56 = L1_54
  L3_56 = L2_55(L3_56)
  if L2_55 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page ipv6StaticRouting" .. L2_55)
    _UPVALUE1_.abort()
    return L2_55, L1_54
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L3_56
end
function staticRoutingSectionGetAll()
  local L0_57, L1_58
  L0_57 = _UPVALUE0_
  L0_57 = L0_57.staticRoutesGetAll
  L1_58 = L0_57()
  if L0_57 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in Get All Operaion in page ipv6StaticRouting" .. L0_57)
    return L0_57
  end
  return _UPVALUE1_.SUCCESS, L1_58
end
function staticRoutingSectionDeleteAll(A0_59)
  local L1_60, L2_61, L3_62, L4_63, L5_64, L6_65, L7_66
  L1_60 = ACCESS_LEVEL
  if L1_60 ~= 0 then
    L1_60 = util
    L1_60 = L1_60.appendDebugOut
    L2_61 = "Detected Unauthorized access for page ipv6StaticRouting"
    L1_60(L2_61)
    L1_60 = _UPVALUE0_
    L1_60 = L1_60.UNAUTHORIZED
    return L1_60
  end
  L1_60, L2_61 = nil, nil
  L3_62()
  for L6_65, L7_66 in L3_62(L4_63) do
    L1_60, L2_61 = _UPVALUE2_.staticRouteDelete(L7_66)
    if L1_60 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in Delete Operaion in page ipv6StaticRouting" .. L1_60)
      _UPVALUE1_.abort()
      return L1_60
    end
  end
  L3_62()
  L3_62()
  return L3_62
end
