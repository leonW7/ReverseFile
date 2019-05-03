local L0_0
L0_0 = module
L0_0("com.teamf1.bl.sslvpn.client_route", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/sslvpn_client_route")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function sslVpnClientRoutesSectionGet()
  local L0_1, L1_2, L2_3, L3_4
  L0_1, L1_2, L2_3, L3_4 = _UPVALUE0_.clientRouteGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3, L3_4
end
function sslVpnClientRoutesSectionGetNext(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10
  L1_6 = A0_5["sslVpnClientRoutes.cookie"]
  L2_7 = _UPVALUE0_
  L2_7 = L2_7.NIL
  if L1_6 == L2_7 then
    L2_7 = util
    L2_7 = L2_7.appendDebugOut
    L3_8 = "GetNext : Invalid Cookie"
    L2_7(L3_8)
    L2_7 = _UPVALUE0_
    L2_7 = L2_7.BAD_PARAMETER
    return L2_7
  end
  L2_7, L3_8, L4_9, L5_10 = nil, nil, nil, nil
  L2_7, L3_8, L4_9, L5_10 = _UPVALUE1_.clientRouteGetNext(L1_6)
  if L2_7 ~= _UPVALUE0_.SUCCESS then
    return L2_7
  end
  return L2_7, L3_8, L4_9, L5_10
end
function sslVpnClientRoutesSectionSet(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16
  L1_12 = ACCESS_LEVEL
  if L1_12 ~= 0 then
    L1_12 = util
    L1_12 = L1_12.appendDebugOut
    L2_13 = "Detected Unauthorized access for page sslVpnClientRoutes"
    L1_12(L2_13)
    L1_12 = _UPVALUE0_
    L1_12 = L1_12.UNAUTHORIZED
    return L1_12
  end
  L1_12 = A0_11["sslVpnClientRoutes.cookie"]
  L2_13 = A0_11["sslVpnClientRoutes.routeDstNetworkIP"]
  L3_14 = A0_11["sslVpnClientRoutes.routeSubnetmask"]
  L4_15 = _UPVALUE0_
  L4_15 = L4_15.NIL
  if L1_12 == L4_15 then
    L4_15 = util
    L4_15 = L4_15.appendDebugOut
    L5_16 = "Set : Invalid Cookie"
    L4_15(L5_16)
    L4_15 = _UPVALUE0_
    L4_15 = L4_15.BAD_PARAMETER
    return L4_15
  end
  L4_15 = _UPVALUE0_
  L4_15 = L4_15.NIL
  if L2_13 == L4_15 then
    L4_15 = util
    L4_15 = L4_15.appendDebugOut
    L5_16 = "Set : Invalid routeDstNetworkIP"
    L4_15(L5_16)
    L4_15 = _UPVALUE0_
    L4_15 = L4_15.BAD_PARAMETER
    return L4_15
  end
  L4_15 = _UPVALUE0_
  L4_15 = L4_15.NIL
  if L3_14 == L4_15 then
    L4_15 = util
    L4_15 = L4_15.appendDebugOut
    L5_16 = "Set : Invalid routeSubnetmask"
    L4_15(L5_16)
    L4_15 = _UPVALUE0_
    L4_15 = L4_15.BAD_PARAMETER
    return L4_15
  end
  L4_15, L5_16 = nil, nil
  _UPVALUE1_.start()
  L4_15, L5_16 = _UPVALUE2_.clientRouteSet(L1_12, L2_13, L3_14)
  if L4_15 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page sslVpnClientRoutes" .. L4_15)
    _UPVALUE1_.abort()
    return L4_15, L1_12
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L5_16
end
function sslVpnClientRoutesSectionCreate(A0_17)
  local L1_18, L2_19, L3_20, L4_21
  L1_18 = ACCESS_LEVEL
  if L1_18 ~= 0 then
    L1_18 = util
    L1_18 = L1_18.appendDebugOut
    L2_19 = "Detected Unauthorized access for page sslVpnClientRoutes"
    L1_18(L2_19)
    L1_18 = _UPVALUE0_
    L1_18 = L1_18.UNAUTHORIZED
    return L1_18
  end
  L1_18 = A0_17["sslVpnClientRoutes.routeDstNetworkIP"]
  L2_19 = A0_17["sslVpnClientRoutes.routeSubnetmask"]
  L3_20 = _UPVALUE0_
  L3_20 = L3_20.NIL
  if L1_18 == L3_20 then
    L3_20 = util
    L3_20 = L3_20.appendDebugOut
    L4_21 = "Set : Invalid routeDstNetworkIP"
    L3_20(L4_21)
    L3_20 = _UPVALUE0_
    L3_20 = L3_20.BAD_PARAMETER
    return L3_20
  end
  L3_20 = _UPVALUE0_
  L3_20 = L3_20.NIL
  if L2_19 == L3_20 then
    L3_20 = util
    L3_20 = L3_20.appendDebugOut
    L4_21 = "Set : Invalid routeSubnetmask"
    L3_20(L4_21)
    L3_20 = _UPVALUE0_
    L3_20 = L3_20.BAD_PARAMETER
    return L3_20
  end
  L3_20, L4_21 = nil, nil
  _UPVALUE1_.start()
  L3_20, L4_21 = _UPVALUE2_.clientRouteCreate(L1_18, L2_19)
  if L3_20 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page sslVpnClientRoutes" .. L3_20)
    _UPVALUE1_.abort()
    return L3_20
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L4_21
end
function sslVpnClientRoutesSectionDelete(A0_22)
  local L1_23, L2_24
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for sslVpnClientRoutes PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_23 = A0_22["sslVpnClientRoutes.cookie"]
  if L1_23 == _UPVALUE0_.NIL then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L2_24, cookie = _UPVALUE2_.clientRouteDelete(L1_23)
  if L2_24 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in sslVpnClientRoutes page " .. L2_24)
    _UPVALUE1_.abort()
    return L2_24
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L2_24, cookie
end
function sslVpnClientRoutesSectionGetAll()
  local L0_25, L1_26
  L1_26 = {}
  L0_25, L1_26 = _UPVALUE0_.clientRouteGetAll()
  if L1_26 == _UPVALUE1_.NIL then
    L1_26 = {}
  end
  if L0_25 ~= _UPVALUE1_.SUCCESS then
    return L0_25, L1_26
  end
  return L0_25, L1_26
end
function sslVpnClientRoutesSectionDeleteAll()
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for sslVpnClientRoutes PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.clientRouteDeleteAll()
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in sslVpnClientRoutes page " .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
