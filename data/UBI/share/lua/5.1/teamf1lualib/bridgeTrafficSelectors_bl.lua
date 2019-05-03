local L0_0
L0_0 = module
L0_0("com.teamf1.bl.network.bridgeTrafficSelectors", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/bridgeBandwidthProfiles_bl")
L0_0 = require
L0_0("teamf1lualib/bridgeTrafficSelectorsConfig")
L0_0 = require
L0_0("teamf1lualib/bridgeBandwidthProfilesConfig")
L0_0 = require
L0_0("teamf1lualib/bandwidthProfilesReturnCodes")
L0_0 = require
L0_0("teamf1lualib/trafficSelectorReturnCodes")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function bridgeTrafficSelectorInfoGet()
  local L0_1, L1_2, L2_3
  L0_1 = _UPVALUE0_
  L0_1 = L0_1.FAILURE
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.NIL
  L2_3 = {}
  L0_1, L2_3, L1_2 = _UPVALUE1_.bridgeTrafficSelectorInfoGetAll()
  if L0_1 ~= _UPVALUE0_.SUCCESS then
    return L0_1, L2_3, L1_2
  end
  return L0_1, L2_3, L1_2
end
function bridgeTrafficSelectorsDelete(A0_4)
  local L1_5
  L1_5 = _UPVALUE0_
  L1_5 = L1_5.FAILURE
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_4 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L1_5 = _UPVALUE2_.bridgeDeleteAvailableTrafficSelectors(A0_4)
  if L1_5 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in deleting the traffic Selectors.")
    _UPVALUE1_.abort()
    return L1_5
  end
  L1_5 = _UPVALUE0_.SUCCESS
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_5
end
function bridgeTrafficSelectorGet(A0_6)
  local L1_7, L2_8
  L1_7 = {}
  L2_8 = _UPVALUE0_
  L2_8 = L2_8.FAILURE
  if A0_6 == _UPVALUE0_.NIL then
    L2_8 = _UPVALUE0_.BAD_PARAMETER
    return L2_8, L1_7
  end
  L2_8, L1_7 = _UPVALUE1_.bridgeTrafficSelectorValuesGet(A0_6)
  if L2_8 ~= _UPVALUE0_.SUCCESS then
    return L2_8, L1_7
  end
  return L2_8, L1_7
end
function bridgeBandwidthProfilesGetAll()
  local L0_9, L1_10
  L0_9 = {}
  L1_10 = _UPVALUE0_
  L1_10 = L1_10.FAILURE
  L1_10, L0_9 = _UPVALUE1_.bridgeBandwidthProfileInfoGetAll()
  if L1_10 ~= _UPVALUE0_.SUCCESS then
    return L1_10, L0_9
  end
  return L1_10, L0_9
end
function bridgeServicesGetAll()
  local L0_11, L1_12
  L0_11 = _UPVALUE0_
  L0_11 = L0_11.FAILURE
  L1_12 = {}
  L0_11, L1_12 = _UPVALUE1_.bridgeServicesInfoGetAll()
  if L0_11 ~= _UPVALUE0_.SUCCESS then
    return L0_11, L1_12
  end
  return L0_11, L1_12
end
function bridgeBWProfileStatusInfoGet()
  local L0_13, L1_14
  L0_13 = _UPVALUE0_
  L0_13 = L0_13.NIL
  L1_14 = _UPVALUE0_
  L1_14 = L1_14.FAILURE
  L1_14, L0_13 = _UPVALUE1_.bridgeBWProfileStatusvalueGet()
  if L1_14 ~= _UPVALUE0_.SUCCESS then
    return L1_14, L0_13
  end
  return L1_14, L0_13
end
function bridgeTrafficSelectorCreate(A0_15)
  local L1_16, L2_17, L3_18, L4_19, L5_20, L6_21, L7_22, L8_23, L9_24, L10_25
  L1_16 = _UPVALUE0_
  L1_16 = L1_16.FAILURE
  L2_17 = A0_15["L2TrafficSelector.ProfileName"]
  L3_18 = A0_15["L2TrafficSelector.ServiceName"]
  L4_19 = A0_15["L2TrafficSelector.MatchType"]
  L5_20 = A0_15["L2TrafficSelector.IPAddress"]
  L6_21 = A0_15["L2TrafficSelector.SubnetMask"]
  L7_22 = A0_15["L2TrafficSelector.MACAddress"]
  L8_23 = A0_15["L2TrafficSelector.PortName"]
  L9_24 = A0_15["L2TrafficSelector.VapName"]
  L10_25 = A0_15["L2TrafficSelector.VlanId"]
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_15["L2TrafficSelector.ProfileName"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L2_17 = A0_15["L2TrafficSelector.ProfileName"]
  if A0_15["L2TrafficSelector.ServiceName"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L3_18 = A0_15["L2TrafficSelector.ServiceName"]
  if A0_15["L2TrafficSelector.MatchType"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L4_19 = A0_15["L2TrafficSelector.MatchType"]
  if L4_19 == "1" then
    if A0_15["L2TrafficSelector.IPAddress"] == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
    L5_20 = A0_15["L2TrafficSelector.IPAddress"]
    if A0_15["L2TrafficSelector.SubnetMask"] == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
    L6_21 = A0_15["L2TrafficSelector.SubnetMask"]
  end
  if L4_19 == "2" then
    if A0_15["L2TrafficSelector.MACAddress"] == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
    L7_22 = A0_15["L2TrafficSelector.MACAddress"]
  end
  if L4_19 == "3" then
    if A0_15["L2TrafficSelector.PortName"] == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
    L8_23 = A0_15["L2TrafficSelector.PortName"]
  end
  if L4_19 == "4" then
    if A0_15["L2TrafficSelector.VlanId"] == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
    L8_23 = A0_15["L2TrafficSelector.VlanId"]
  end
  if L4_19 == "6" then
    if A0_15["L2TrafficSelector.VapName"] == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
    L9_24 = A0_15["L2TrafficSelector.VapName"]
  end
  _UPVALUE1_.start()
  L1_16 = _UPVALUE2_.bridgeTrafficSelectorAdd(L2_17, L3_18, L4_19, L5_20, L6_21, L7_22, L8_23, L9_24, L10_25)
  if L1_16 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in deleting the traffic Selectors.")
    _UPVALUE1_.abort()
    return L1_16
  end
  L1_16 = _UPVALUE0_.SUCCESS
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_16
end
function bridgeTrafficSelectorEdit(A0_26)
  local L1_27, L2_28, L3_29, L4_30, L5_31, L6_32, L7_33, L8_34, L9_35, L10_36, L11_37
  L1_27 = _UPVALUE0_
  L1_27 = L1_27.FAILURE
  L2_28 = A0_26["L2TrafficSelector.cookie"]
  L3_29 = A0_26["L2TrafficSelector.ProfileName"]
  L4_30 = A0_26["L2TrafficSelector.ServiceName"]
  L5_31 = A0_26["L2TrafficSelector.MatchType"]
  L6_32 = A0_26["L2TrafficSelector.IPAddress"]
  L7_33 = A0_26["L2TrafficSelector.SubnetMask"]
  L8_34 = A0_26["L2TrafficSelector.MACAddress"]
  L9_35 = A0_26["L2TrafficSelector.PortName"]
  L10_36 = A0_26["L2TrafficSelector.VapName"]
  L11_37 = A0_26["L2TrafficSelector.VlanId"]
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_26["L2TrafficSelector.cookie"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L2_28 = A0_26["L2TrafficSelector.cookie"]
  if A0_26["L2TrafficSelector.ProfileName"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L3_29 = A0_26["L2TrafficSelector.ProfileName"]
  if A0_26["L2TrafficSelector.ServiceName"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L4_30 = A0_26["L2TrafficSelector.ServiceName"]
  if A0_26["L2TrafficSelector.MatchType"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L5_31 = A0_26["L2TrafficSelector.MatchType"]
  if L5_31 == "1" then
    if A0_26["L2TrafficSelector.IPAddress"] == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
    L6_32 = A0_26["L2TrafficSelector.IPAddress"]
    if A0_26["L2TrafficSelector.SubnetMask"] == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
    L7_33 = A0_26["L2TrafficSelector.SubnetMask"]
  end
  if L5_31 == "2" then
    if A0_26["L2TrafficSelector.MACAddress"] == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
    L8_34 = A0_26["L2TrafficSelector.MACAddress"]
  end
  if L5_31 == "3" then
    if A0_26["L2TrafficSelector.PortName"] == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
    L9_35 = A0_26["L2TrafficSelector.PortName"]
  end
  if L5_31 == "4" then
    if A0_26["L2TrafficSelector.VlanId"] == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
    L9_35 = A0_26["L2TrafficSelector.VlanId"]
  end
  if L5_31 == "6" then
    if A0_26["L2TrafficSelector.VapName"] == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
    L10_36 = A0_26["L2TrafficSelector.VapName"]
  end
  _UPVALUE1_.start()
  L1_27 = _UPVALUE2_.bridgeTrafficSelectorEdit(L3_29, L4_30, L5_31, L6_32, L7_33, L8_34, L9_35, L10_36, L11_37, L2_28)
  if L1_27 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in deleting the traffic Selectors.")
    _UPVALUE1_.abort()
    return L1_27
  end
  L1_27 = _UPVALUE0_.SUCCESS
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_27
end
