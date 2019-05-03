local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wan.routingmode", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wan_routingMode")
L0_0 = require
L0_0("teamf1lualib/wan_configurablePort")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function routingModeSectionGet()
  local L0_1, L1_2, L2_3
  L2_3 = {}
  L0_1, L1_2, L2_3 = _UPVALUE0_.routingModeGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3
end
function routingModeSectionSet(A0_4)
  local L1_5, L2_6
  L1_5 = ACCESS_LEVEL
  if L1_5 ~= 0 then
    L1_5 = util
    L1_5 = L1_5.appendDebugOut
    L2_6 = "Detected Unauthorized access for page routingMode"
    L1_5(L2_6)
    L1_5 = _UPVALUE0_
    L1_5 = L1_5.UNAUTHORIZED
    return L1_5
  end
  L1_5 = A0_4["routingMode.cookie"]
  L2_6 = A0_4["routingMode.routeMode"]
  if L1_5 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L2_6 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid routingMode")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.routingModeSet(L1_5, L2_6)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page routingMode" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode, L1_5
  end
  if L2_6 == "2" then
    returnCode = _UPVALUE2_.pptpL2tpModeSet()
    if returnCode ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in configuring values in page routingMode" .. returnCode)
      _UPVALUE1_.abort()
      return returnCode
    end
  end
  returnCode = _UPVALUE2_.accessManagementUpdate()
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page routingMode" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode, L1_5
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function routingBridgeModeSectionGet()
  local L0_7, L1_8, L2_9, L3_10
  L0_7, L1_8, L2_9 = _UPVALUE0_.routingBridgeModeGet()
  if L0_7 ~= _UPVALUE1_.SUCCESS then
    return L0_7
  end
  if L2_9.routeMode == nil or L2_9.routeMode == "" or L2_9.routeMode == "" then
    return _UPVALUE1_.FAILURE
  end
  return L0_7, L1_8, L2_9
end
function routingBridgeModeSectionSet(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page routingMode")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L7_18 = A0_11["routingMode.cookie"]
  if L7_18 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  A0_11["routingMode.routeMode"] = tonumber(A0_11["routingMode.routeMode"])
  A0_11["routingMode.wan1RoutingMode"] = tonumber(A0_11["routingMode.wan1RoutingMode"])
  A0_11["routingMode.wan2RoutingMode"] = tonumber(A0_11["routingMode.wan2RoutingMode"])
  if A0_11["routingMode.routeMode"] == nil or tonumber(A0_11["routingMode.routeMode"]) < 1 or tonumber(A0_11["routingMode.routeMode"]) > 3 then
    util.appendDebugOut("Set : Invalid routingMode")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_12 = A0_11["routingMode.routeMode"]
  if L1_12 == 1 then
    if A0_11["routingMode.wan1RoutingMode"] == nil or 0 > A0_11["routingMode.wan1RoutingMode"] or A0_11["routingMode.wan1RoutingMode"] > 1 then
      util.appendDebugOut("Set : Invalid Routing Interface")
      return _UPVALUE0_.BAD_PARAMETER
    end
    L2_13 = A0_11["routingMode.wan1RoutingMode"]
    L8_19 = _UPVALUE1_.dmzStatusCheck()
    if L8_19 ~= "DMZ" and (A0_11["routingMode.wan2RoutingMode"] == nil or 0 > A0_11["routingMode.wan2RoutingMode"] or A0_11["routingMode.wan2RoutingMode"] > 1) then
      util.appendDebugOut("Set : Invalid Routing Interface")
      return _UPVALUE0_.BAD_PARAMETER
    end
    L3_14 = A0_11["routingMode.wan2RoutingMode"]
  elseif L1_12 == 3 then
    if A0_11["routingMode.wan1RoutingMode"] == nil or 0 > A0_11["routingMode.wan1RoutingMode"] or A0_11["routingMode.wan1RoutingMode"] > 1 then
      util.appendDebugOut("Set : Invalid Routing Interface")
      return _UPVALUE0_.BAD_PARAMETER
    end
    L2_13 = A0_11["routingMode.wan1RoutingMode"]
    if A0_11["routingMode.dmzIP"] == nil or A0_11["routingMode.dmzIP"] == "" then
      util.appendDebugOut("Set : Invalid Routing Interface")
      return _UPVALUE0_.BAD_PARAMETER
    end
    L4_15 = A0_11["routingMode.dmzIP"]
    if A0_11["routingMode.bridgeVlanIpAddr"] == nil or A0_11["routingMode.bridgeVlanIpAddr"] == "" then
      util.appendDebugOut("Set : Invalid Routing Interface")
      return _UPVALUE0_.BAD_PARAMETER
    end
    L5_16 = A0_11["routingMode.bridgeVlanIpAddr"]
    if A0_11["routingMode.subnetMask"] == nil or A0_11["routingMode.subnetMask"] == "" then
      util.appendDebugOut("Set : Invalid Routing Interface")
      return _UPVALUE0_.BAD_PARAMETER
    end
    L6_17 = A0_11["routingMode.subnetMask"]
  end
  _UPVALUE2_.start()
  returnCode, cookie = _UPVALUE1_.routingBridgeModeSet(L7_18, L1_12, L2_13, L3_14, L4_15, L5_16, L6_17)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page routingMode" .. returnCode)
    _UPVALUE2_.abort()
    return returnCode, L7_18
  end
  returnCode = _UPVALUE1_.accessManagementUpdate()
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page routingMode" .. returnCode)
    _UPVALUE2_.abort()
    return returnCode, L7_18
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function dmzPortStatus()
  local L0_20
  L0_20 = _UPVALUE0_.dmzStatusCheck()
  return L0_20
end
function configurablePortGet()
  local L0_21, L1_22, L2_23
  L0_21 = _UPVALUE0_
  L0_21 = L0_21.configPortUsageGet
  L2_23 = L0_21()
  if L0_21 ~= _UPVALUE1_.SUCCESS then
    return L0_21
  end
  return L0_21, L2_23
end
function routingModeSnmpSectionGet()
  local L0_24, L1_25
  L0_24 = _UPVALUE0_
  L0_24 = L0_24.routingModeSnmpGet
  L1_25 = L0_24()
  return L0_24, L1_25
end
