local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/routing_static_routes")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/vlan_vlan")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.routing.static_routes")
ENABLE = "1"
DISABLE = "0"
ACTIVE_STATUS = "Yes"
DEACTIVE_STATUS = "No"
static_routesTable = "route"
attribute = {}
attribute.routeName = "routeName"
attribute.active = "active"
attribute.private = "private"
attribute.destinationIpAddress = "dstIpAddr"
attribute.subnetMask = "ipSNetMask"
attribute.interface = "interfaceName"
attribute.gatewayIpAddress = "gwIpAddr"
attribute.metric = "metric"
WAN_NAME = "WAN"
OPTION_NAME = "Option"
function staticRoutingGetExtraPhyName()
  local L0_1, L1_2
  L0_1, L1_2 = _UPVALUE0_.staticRouteGetExtraPhyInterfaceName()
  return L0_1, L1_2
end
function getAllVlanId()
  local L0_3, L1_4
  L0_3, L1_4 = _UPVALUE0_.vlanIdGetAll()
  if L0_3 ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return L0_3, L1_4
end
function vlanNameByIdGet(A0_5)
  local L1_6, L2_7
  L1_6, L2_7 = _UPVALUE0_.vlanNameByIdGet(A0_5)
  if L1_6 ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return L1_6, L2_7
end
function staticRoutingSectionGetAll()
  local L0_8, L1_9
  L0_8 = _UPVALUE0_
  L0_8 = L0_8.staticRouteGetAll
  L1_9 = L0_8()
  if L0_8 ~= _UPVALUE1_.SUCCESS then
    return L0_8
  end
  for _FORV_5_, _FORV_6_ in pairs(L1_9) do
    if _FORV_6_[static_routesTable .. "." .. attribute.active] == ENABLE then
      _FORV_6_[static_routesTable .. "." .. attribute.active] = ACTIVE_STATUS
    elseif _FORV_6_[static_routesTable .. "." .. attribute.active] == DISABLE then
      _FORV_6_[static_routesTable .. "." .. attribute.active] = DEACTIVE_STATUS
    end
    if _FORV_6_[static_routesTable .. "." .. attribute.private] == ENABLE then
      _FORV_6_[static_routesTable .. "." .. attribute.private] = ACTIVE_STATUS
    elseif _FORV_6_[static_routesTable .. "." .. attribute.private] == DISABLE then
      _FORV_6_[static_routesTable .. "." .. attribute.private] = DEACTIVE_STATUS
    end
  end
  return L0_8, L1_9
end
function staticRoutingSectionGet(A0_10)
  local L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18, L9_19, L10_20
  L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18, L9_19, L10_20 = _UPVALUE0_.staticRouteGet(A0_10)
  if L1_11 ~= _UPVALUE1_.SUCCESS then
    return L1_11
  end
  return L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18, L9_19, L10_20
end
function staticRoutingSectionGetNext(A0_21)
  local L1_22, L2_23, L3_24, L4_25, L5_26, L6_27, L7_28, L8_29, L9_30, L10_31, L11_32
  L1_22 = A0_21["staticRouting.cookie"]
  L2_23 = _UPVALUE0_
  L2_23 = L2_23.NIL
  if L1_22 == L2_23 then
    L2_23 = util
    L2_23 = L2_23.appendDebugOut
    L3_24 = "GetNext : Invalid Cookie"
    L2_23(L3_24)
    L2_23 = _UPVALUE0_
    L2_23 = L2_23.BAD_PARAMETER
    return L2_23
  end
  L2_23, L3_24, L4_25, L5_26, L6_27, L7_28, L8_29, L9_30, L10_31, L11_32 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L2_23, L3_24, L4_25, L5_26, L6_27, L7_28, L8_29, L9_30, L10_31, L11_32 = _UPVALUE1_.staticRouteGetNext(L1_22)
  if L2_23 ~= _UPVALUE0_.SUCCESS then
    return L2_23
  end
  if string.sub(L9_30, 1, 3) == _UPVALUE2_ then
    L9_30 = L9_30 .. " >VLAN"
  end
  return L2_23, L3_24, L4_25, L5_26, L6_27, L7_28, L8_29, L9_30, L10_31, L11_32
end
function staticRoutingSectionSet(A0_33)
  local L1_34, L2_35, L3_36, L4_37, L5_38, L6_39, L7_40, L8_41, L9_42, L10_43, L11_44, L12_45
  L1_34 = ACCESS_LEVEL
  if L1_34 ~= 0 then
    L1_34 = util
    L1_34 = L1_34.appendDebugOut
    L2_35 = "Detected Unauthorized access for page staticRouting"
    L1_34(L2_35)
    L1_34 = _UPVALUE0_
    L1_34 = L1_34.UNAUTHORIZED
    return L1_34
  end
  L1_34 = A0_33["staticRouting.cookie"]
  L2_35 = A0_33["staticRouting.routeName"]
  L3_36 = A0_33["staticRouting.active"]
  L4_37 = A0_33["staticRouting.private"]
  L5_38 = A0_33["staticRouting.destinationIpAddress"]
  L6_39 = A0_33["staticRouting.subnetMask"]
  L7_40 = A0_33["staticRouting.interface"]
  L8_41 = A0_33["staticRouting.gatewayIpAddress"]
  L9_42 = A0_33["staticRouting.metric"]
  L10_43 = _UPVALUE0_
  L10_43 = L10_43.NIL
  if L1_34 == L10_43 then
    L10_43 = util
    L10_43 = L10_43.appendDebugOut
    L11_44 = "Set : Invalid Cookie"
    L10_43(L11_44)
    L10_43 = _UPVALUE0_
    L10_43 = L10_43.BAD_PARAMETER
    return L10_43
  end
  L10_43 = _UPVALUE0_
  L10_43 = L10_43.NIL
  if L2_35 == L10_43 then
    L10_43 = util
    L10_43 = L10_43.appendDebugOut
    L11_44 = "Set : Invalid routeName"
    L10_43(L11_44)
    L10_43 = _UPVALUE0_
    L10_43 = L10_43.BAD_PARAMETER
    return L10_43
  end
  L10_43 = _UPVALUE0_
  L10_43 = L10_43.NIL
  if L3_36 == L10_43 then
    L10_43 = util
    L10_43 = L10_43.appendDebugOut
    L11_44 = "Set : Invalid active"
    L10_43(L11_44)
    L10_43 = _UPVALUE0_
    L10_43 = L10_43.BAD_PARAMETER
    return L10_43
  end
  L10_43 = _UPVALUE0_
  L10_43 = L10_43.NIL
  if L4_37 == L10_43 then
    L10_43 = util
    L10_43 = L10_43.appendDebugOut
    L11_44 = "Set : Invalid private"
    L10_43(L11_44)
    L10_43 = _UPVALUE0_
    L10_43 = L10_43.BAD_PARAMETER
    return L10_43
  end
  L10_43 = _UPVALUE0_
  L10_43 = L10_43.NIL
  if L5_38 == L10_43 then
    L10_43 = util
    L10_43 = L10_43.appendDebugOut
    L11_44 = "Set : Invalid destinationIpAddress"
    L10_43(L11_44)
    L10_43 = _UPVALUE0_
    L10_43 = L10_43.BAD_PARAMETER
    return L10_43
  end
  L10_43 = _UPVALUE0_
  L10_43 = L10_43.NIL
  if L7_40 == L10_43 then
    L10_43 = util
    L10_43 = L10_43.appendDebugOut
    L11_44 = "Set : Invalid interface"
    L10_43(L11_44)
    L10_43 = _UPVALUE0_
    L10_43 = L10_43.BAD_PARAMETER
    return L10_43
  end
  L10_43 = _UPVALUE0_
  L10_43 = L10_43.NIL
  if L8_41 == L10_43 then
    L10_43 = util
    L10_43 = L10_43.appendDebugOut
    L11_44 = "Set : Invalid gatewayIpAddress"
    L10_43(L11_44)
    L10_43 = _UPVALUE0_
    L10_43 = L10_43.BAD_PARAMETER
    return L10_43
  end
  L10_43 = _UPVALUE0_
  L10_43 = L10_43.NIL
  if L9_42 == L10_43 then
    L10_43 = util
    L10_43 = L10_43.appendDebugOut
    L11_44 = "Set : Invalid metric"
    L10_43(L11_44)
    L10_43 = _UPVALUE0_
    L10_43 = L10_43.BAD_PARAMETER
    return L10_43
  end
  L10_43, L11_44 = nil, nil
  L12_45 = {}
  L12_45 = util.split(L7_40, " ")
  L7_40 = L12_45[1]
  _UPVALUE1_.start()
  L10_43, L11_44 = _UPVALUE2_.staticRouteSet(L1_34, L2_35, L3_36, L4_37, L5_38, L6_39, L7_40, L8_41, L9_42)
  if L10_43 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page staticRouting" .. L10_43)
    _UPVALUE1_.abort()
    return L10_43, L1_34
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L11_44
end
function staticRoutingSectionCreate(A0_46)
  local L1_47, L2_48, L3_49, L4_50, L5_51, L6_52, L7_53, L8_54, L9_55, L10_56, L11_57
  L1_47 = ACCESS_LEVEL
  if L1_47 ~= 0 then
    L1_47 = util
    L1_47 = L1_47.appendDebugOut
    L2_48 = "Detected Unauthorized access for page staticRouting"
    L1_47(L2_48)
    L1_47 = _UPVALUE0_
    L1_47 = L1_47.UNAUTHORIZED
    return L1_47
  end
  L1_47 = A0_46["staticRouting.routeName"]
  L2_48 = A0_46["staticRouting.active"]
  L3_49 = A0_46["staticRouting.private"]
  L4_50 = A0_46["staticRouting.destinationIpAddress"]
  L5_51 = A0_46["staticRouting.subnetMask"]
  L6_52 = A0_46["staticRouting.interface"]
  L7_53 = A0_46["staticRouting.gatewayIpAddress"]
  L8_54 = A0_46["staticRouting.metric"]
  L9_55 = _UPVALUE0_
  L9_55 = L9_55.NIL
  if L1_47 == L9_55 then
    L9_55 = util
    L9_55 = L9_55.appendDebugOut
    L10_56 = "Set : Invalid routeName"
    L9_55(L10_56)
    L9_55 = _UPVALUE0_
    L9_55 = L9_55.BAD_PARAMETER
    return L9_55
  end
  L9_55 = _UPVALUE0_
  L9_55 = L9_55.NIL
  if L2_48 == L9_55 then
    L9_55 = util
    L9_55 = L9_55.appendDebugOut
    L10_56 = "Set : Invalid active"
    L9_55(L10_56)
    L9_55 = _UPVALUE0_
    L9_55 = L9_55.BAD_PARAMETER
    return L9_55
  end
  L9_55 = _UPVALUE0_
  L9_55 = L9_55.NIL
  if L3_49 == L9_55 then
    L9_55 = util
    L9_55 = L9_55.appendDebugOut
    L10_56 = "Set : Invalid private"
    L9_55(L10_56)
    L9_55 = _UPVALUE0_
    L9_55 = L9_55.BAD_PARAMETER
    return L9_55
  end
  L9_55 = _UPVALUE0_
  L9_55 = L9_55.NIL
  if L4_50 == L9_55 then
    L9_55 = util
    L9_55 = L9_55.appendDebugOut
    L10_56 = "Set : Invalid destinationIpAddress"
    L9_55(L10_56)
    L9_55 = _UPVALUE0_
    L9_55 = L9_55.BAD_PARAMETER
    return L9_55
  end
  L9_55 = _UPVALUE0_
  L9_55 = L9_55.NIL
  if L6_52 == L9_55 then
    L9_55 = util
    L9_55 = L9_55.appendDebugOut
    L10_56 = "Set : Invalid interface"
    L9_55(L10_56)
    L9_55 = _UPVALUE0_
    L9_55 = L9_55.BAD_PARAMETER
    return L9_55
  end
  L9_55 = _UPVALUE0_
  L9_55 = L9_55.NIL
  if L7_53 == L9_55 then
    L9_55 = util
    L9_55 = L9_55.appendDebugOut
    L10_56 = "Set : Invalid gatewayIpAddress"
    L9_55(L10_56)
    L9_55 = _UPVALUE0_
    L9_55 = L9_55.BAD_PARAMETER
    return L9_55
  end
  L9_55 = _UPVALUE0_
  L9_55 = L9_55.NIL
  if L8_54 == L9_55 then
    L9_55 = util
    L9_55 = L9_55.appendDebugOut
    L10_56 = "Set : Invalid metric"
    L9_55(L10_56)
    L9_55 = _UPVALUE0_
    L9_55 = L9_55.BAD_PARAMETER
    return L9_55
  end
  L9_55, L10_56 = nil, nil
  L11_57 = {}
  L11_57 = util.split(L6_52, " ")
  L6_52 = L11_57[1]
  _UPVALUE1_.start()
  L9_55, L10_56 = _UPVALUE2_.staticRouteCreate(L1_47, L2_48, L3_49, L4_50, L5_51, L6_52, L7_53, L8_54)
  if L9_55 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page staticRouting" .. L9_55)
    _UPVALUE1_.abort()
    return L9_55
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L10_56
end
function staticRoutingSectionDelete(A0_58)
  local L1_59, L2_60
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for staticRouting PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_59 = A0_58["staticRouting.cookie"]
  if L1_59 == _UPVALUE0_.NIL then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L2_60, cookie = _UPVALUE2_.staticRouteDelete(L1_59)
  if L2_60 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in staticRouting page " .. L2_60)
    _UPVALUE1_.abort()
    return L2_60
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L2_60, cookie
end
function staticRoutingSectionDeleteAll()
  local L0_61, L1_62
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for staticRouting PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  _UPVALUE1_.start()
  L1_62, cookie = _UPVALUE2_.staticRouteDeleteAll()
  if L1_62 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in staticRouting page " .. L1_62)
    _UPVALUE1_.abort()
    return L1_62
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_62, cookie
end
function staticRoutingSectionEnable(A0_63)
  local L1_64, L2_65
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for staticRouting PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_64 = A0_63["staticRouting.cookie"]
  if L1_64 == _UPVALUE0_.NIL then
    util.appendDebugOut("Enable : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L2_65, cookie = _UPVALUE2_.activeSet(L1_64, ENABLE)
  if L2_65 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in staticRouting page " .. L2_65)
    _UPVALUE1_.abort()
    return L2_65
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L2_65, cookie
end
function staticRoutingSectionDisable(A0_66)
  local L1_67, L2_68
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for staticRouting PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_67 = A0_66["staticRouting.cookie"]
  if L1_67 == _UPVALUE0_.NIL then
    util.appendDebugOut("Disable : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L2_68, cookie = _UPVALUE2_.activeSet(L1_67, DISABLE)
  if L2_68 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Disable Opetation in staticRouting page " .. L2_68)
    _UPVALUE1_.abort()
    return L2_68
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L2_68, cookie
end
function availableInterfacesGet()
  local L0_69, L1_70
  L0_69 = returnCode
  L1_70 = outputTable
  return L0_69, L1_70
end
