local L0_0
L0_0 = module
L0_0("com.teamf1.bl.network.trafficSelector", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/bandwidthProfiles_bl")
L0_0 = require
L0_0("teamf1lualib/trafficSelectorConfig")
L0_0 = require
L0_0("teamf1lualib/bandwidthProfilesConfig")
L0_0 = require
L0_0("teamf1lualib/bandwidthProfilesReturnCodes")
L0_0 = require
L0_0("teamf1lualib/trafficSelectorReturnCodes")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function trafficSelectorInfoGet()
  local L0_1, L1_2, L2_3
  L0_1 = _UPVALUE0_
  L0_1 = L0_1.FAILURE
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.NIL
  L2_3 = {}
  L0_1, L2_3, L1_2 = _UPVALUE1_.trafficSelectorInfoGetAll()
  if L0_1 ~= _UPVALUE0_.SUCCESS then
    return L0_1, L2_3, L1_2
  end
  return L0_1, L2_3, L1_2
end
function trafficSelectorsDelete(A0_4)
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
  L1_5 = _UPVALUE2_.deleteAvailableTrafficSelectors(A0_4)
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
function trafficSelectorGet(A0_6)
  local L1_7, L2_8
  L1_7 = {}
  L2_8 = _UPVALUE0_
  L2_8 = L2_8.FAILURE
  if A0_6 == _UPVALUE0_.NIL then
    L2_8 = _UPVALUE0_.BAD_PARAMETER
    return L2_8, L1_7
  end
  L2_8, L1_7 = _UPVALUE1_.trafficSelectorValuesGet(A0_6)
  if L2_8 ~= _UPVALUE0_.SUCCESS then
    return L2_8, L1_7
  end
  return L2_8, L1_7
end
function bandwidthProfilesGetAll()
  local L0_9, L1_10
  L0_9 = {}
  L1_10 = _UPVALUE0_
  L1_10 = L1_10.FAILURE
  L1_10, L0_9 = _UPVALUE1_.bandwidthProfileInfoGetAll()
  if L1_10 ~= _UPVALUE0_.SUCCESS then
    return L1_10, L0_9
  end
  return L1_10, L0_9
end
function servicesGetAll()
  local L0_11, L1_12
  L0_11 = _UPVALUE0_
  L0_11 = L0_11.FAILURE
  L1_12 = {}
  L0_11, L1_12 = _UPVALUE1_.servicesInfoGetAll()
  if L0_11 ~= _UPVALUE0_.SUCCESS then
    return L0_11, L1_12
  end
  return L0_11, L1_12
end
function configPortInfoGet()
  local L0_13, L1_14
  L0_13 = _UPVALUE0_
  L0_13 = L0_13.NIL
  L1_14 = _UPVALUE0_
  L1_14 = L1_14.FAILURE
  L1_14, L0_13 = _UPVALUE1_.configPortValueGet()
  if L1_14 ~= _UPVALUE0_.SUCCESS then
    return L1_14, L0_13
  end
  return L1_14, L0_13
end
function bwProfileStatusInfoGet()
  local L0_15, L1_16
  L0_15 = _UPVALUE0_
  L0_15 = L0_15.NIL
  L1_16 = _UPVALUE0_
  L1_16 = L1_16.FAILURE
  L1_16, L0_15 = _UPVALUE1_.bwProfileStatusvalueGet()
  if L1_16 ~= _UPVALUE0_.SUCCESS then
    return L1_16, L0_15
  end
  return L1_16, L0_15
end
function dot11InterfaceUnusedRowsInfoGet()
  local L0_17, L1_18
  L0_17 = _UPVALUE0_
  L0_17 = L0_17.NIL
  L1_18 = _UPVALUE0_
  L1_18 = L1_18.FAILURE
  L1_18, L0_17 = _UPVALUE1_.dot11InterfaceUnusedRowsGet()
  if L1_18 ~= _UPVALUE0_.SUCCESS then
    return L1_18, L0_17
  end
  return L1_18, L0_17
end
function portMgmtGetAll()
  local L0_19, L1_20
  L0_19 = _UPVALUE0_
  L0_19 = L0_19.FAILURE
  L1_20 = {}
  L0_19, L1_20 = _UPVALUE1_.PortMgmtInfoGetAll()
  if L0_19 ~= _UPVALUE0_.SUCCESS then
    return L0_19, L1_20
  end
  return L0_19, L1_20
end
function vlanInfoGet()
  local L0_21, L1_22
  L0_21 = {}
  L1_22 = _UPVALUE0_
  L1_22 = L1_22.FAILURE
  L1_22, L0_21 = _UPVALUE1_.vlanInfoGet()
  if L1_22 ~= _UPVALUE0_.SUCCESS then
    return L1_22, L0_21
  end
  return L1_22, L0_21
end
function trafficSelectorCreate(A0_23)
  local L1_24, L2_25, L3_26, L4_27, L5_28, L6_29, L7_30, L8_31, L9_32, L10_33, L11_34
  L1_24 = _UPVALUE0_
  L1_24 = L1_24.FAILURE
  L2_25 = A0_23["TrafficSelector.ProfileName"]
  L3_26 = A0_23["TrafficSelector.ServiceName"]
  L4_27 = A0_23["TrafficSelector.MatchType"]
  L5_28 = A0_23["TrafficSelector.IPAddress"]
  L6_29 = A0_23["TrafficSelector.SubnetMask"]
  L7_30 = A0_23["TrafficSelector.MACAddress"]
  L8_31 = A0_23["TrafficSelector.PortName"]
  L9_32 = A0_23["TrafficSelector.VapName"]
  L10_33 = A0_23["TrafficSelector.VlanId"]
  L11_34 = ACCESS_LEVEL
  if L11_34 ~= 0 then
    L11_34 = util
    L11_34 = L11_34.appendDebugOut
    L11_34("Detected Unauthorized access for page")
    L11_34 = _UPVALUE0_
    L11_34 = L11_34.UNAUTHORIZED
    return L11_34
  end
  L11_34 = A0_23["TrafficSelector.ProfileName"]
  if L11_34 == _UPVALUE0_.NIL then
    L11_34 = _UPVALUE0_
    L11_34 = L11_34.BAD_PARAMETER
    return L11_34
  end
  L2_25 = A0_23["TrafficSelector.ProfileName"]
  L11_34 = A0_23["TrafficSelector.ServiceName"]
  if L11_34 == _UPVALUE0_.NIL then
    L11_34 = _UPVALUE0_
    L11_34 = L11_34.BAD_PARAMETER
    return L11_34
  end
  L3_26 = A0_23["TrafficSelector.ServiceName"]
  L11_34 = A0_23["TrafficSelector.MatchType"]
  if L11_34 == _UPVALUE0_.NIL then
    L11_34 = _UPVALUE0_
    L11_34 = L11_34.BAD_PARAMETER
    return L11_34
  end
  L4_27 = A0_23["TrafficSelector.MatchType"]
  if L4_27 == "1" then
    L11_34 = A0_23["TrafficSelector.IPAddress"]
    if L11_34 == _UPVALUE0_.NIL then
      L11_34 = _UPVALUE0_
      L11_34 = L11_34.BAD_PARAMETER
      return L11_34
    end
    L11_34 = A0_23["TrafficSelector.IPAddress"]
    if L11_34 == "0.0.0.0" then
      L11_34 = _UPVALUE1_
      L11_34 = L11_34.TS_INVALID_IP
      return L11_34
    end
    L5_28 = A0_23["TrafficSelector.IPAddress"]
    L11_34 = A0_23["TrafficSelector.SubnetMask"]
    if L11_34 == _UPVALUE0_.NIL then
      L11_34 = _UPVALUE0_
      L11_34 = L11_34.BAD_PARAMETER
      return L11_34
    end
    L6_29 = A0_23["TrafficSelector.SubnetMask"]
  end
  if L4_27 == "2" then
    L11_34 = A0_23["TrafficSelector.MACAddress"]
    if L11_34 == _UPVALUE0_.NIL then
      L11_34 = _UPVALUE0_
      L11_34 = L11_34.BAD_PARAMETER
      return L11_34
    end
    L7_30 = A0_23["TrafficSelector.MACAddress"]
  end
  if L4_27 == "3" then
    L11_34 = A0_23["TrafficSelector.PortName"]
    if L11_34 == _UPVALUE0_.NIL then
      L11_34 = _UPVALUE0_
      L11_34 = L11_34.BAD_PARAMETER
      return L11_34
    end
    L8_31 = A0_23["TrafficSelector.PortName"]
  end
  if L4_27 == "4" then
    L11_34 = A0_23["TrafficSelector.VlanId"]
    if L11_34 == _UPVALUE0_.NIL then
      L11_34 = _UPVALUE0_
      L11_34 = L11_34.BAD_PARAMETER
      return L11_34
    end
    L8_31 = A0_23["TrafficSelector.VlanId"]
  end
  if L4_27 == "6" then
    L11_34 = A0_23["TrafficSelector.VapName"]
    if L11_34 == _UPVALUE0_.NIL then
      L11_34 = _UPVALUE0_
      L11_34 = L11_34.BAD_PARAMETER
      return L11_34
    end
    L9_32 = A0_23["TrafficSelector.VapName"]
  end
  L11_34 = db
  L11_34 = L11_34.getTable
  L11_34 = L11_34("TrafficSelector")
  for _FORV_15_, _FORV_16_ in pairs(L11_34) do
    if L11_34[_FORV_15_] ~= nil and L11_34[_FORV_15_]["TrafficSelector.ServiceName"] == L3_26 and L11_34[_FORV_15_]["TrafficSelector.ProfileName"] == L2_25 and tonumber(L11_34[_FORV_15_]["TrafficSelector.MatchType"]) == tonumber(L4_27) then
      if L4_27 == "1" then
        if L11_34[_FORV_15_]["TrafficSelector.IPAddress"] == L5_28 and L11_34[_FORV_15_]["TrafficSelector.SubnetMask"] == L6_29 then
          return _UPVALUE1_.TRAFFIC_SELECTOR_ENTRY_EXIST
        end
      elseif L4_27 == "2" then
        if L11_34[_FORV_15_]["TrafficSelector.MACAddress"] == L7_30 then
          return _UPVALUE1_.TRAFFIC_SELECTOR_ENTRY_EXIST
        end
      elseif L4_27 == "3" then
        if L11_34[_FORV_15_]["TrafficSelector.PortName"] == L8_31 then
          return _UPVALUE1_.TRAFFIC_SELECTOR_ENTRY_EXIST
        end
      elseif L4_27 == "4" then
        if tonumber(L11_34[_FORV_15_]["TrafficSelector.VlanId"]) == tonumber(L10_33) then
          return _UPVALUE1_.TRAFFIC_SELECTOR_ENTRY_EXIST
        end
      elseif L4_27 == "6" and L11_34[_FORV_15_]["TrafficSelector.VapName"] == L9_32 then
        return _UPVALUE1_.TRAFFIC_SELECTOR_ENTRY_EXIST
      end
    end
  end
  _UPVALUE2_.start()
  L1_24 = _UPVALUE3_.trafficSelectorAdd(L2_25, L3_26, L4_27, L5_28, L6_29, L7_30, L8_31, L9_32, L10_33)
  if L1_24 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in deleting the traffic Selectors.")
    _UPVALUE2_.abort()
    return L1_24
  end
  L1_24 = _UPVALUE0_.SUCCESS
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return L1_24
end
function trafficSelectorEdit(A0_35)
  local L1_36, L2_37, L3_38, L4_39, L5_40, L6_41, L7_42, L8_43, L9_44, L10_45, L11_46, L12_47
  L1_36 = _UPVALUE0_
  L1_36 = L1_36.FAILURE
  L2_37 = A0_35["TrafficSelector.cookie"]
  L3_38 = A0_35["TrafficSelector.ProfileName"]
  L4_39 = A0_35["TrafficSelector.ServiceName"]
  L5_40 = A0_35["TrafficSelector.MatchType"]
  L6_41 = A0_35["TrafficSelector.IPAddress"]
  L7_42 = A0_35["TrafficSelector.SubnetMask"]
  L8_43 = A0_35["TrafficSelector.MACAddress"]
  L9_44 = A0_35["TrafficSelector.PortName"]
  L10_45 = A0_35["TrafficSelector.VapName"]
  L11_46 = A0_35["TrafficSelector.VlanId"]
  L12_47 = ACCESS_LEVEL
  if L12_47 ~= 0 then
    L12_47 = util
    L12_47 = L12_47.appendDebugOut
    L12_47("Detected Unauthorized access for page")
    L12_47 = _UPVALUE0_
    L12_47 = L12_47.UNAUTHORIZED
    return L12_47
  end
  L12_47 = A0_35["TrafficSelector.cookie"]
  if L12_47 == _UPVALUE0_.NIL then
    L12_47 = _UPVALUE0_
    L12_47 = L12_47.BAD_PARAMETER
    return L12_47
  end
  L2_37 = A0_35["TrafficSelector.cookie"]
  L12_47 = A0_35["TrafficSelector.ProfileName"]
  if L12_47 == _UPVALUE0_.NIL then
    L12_47 = _UPVALUE0_
    L12_47 = L12_47.BAD_PARAMETER
    return L12_47
  end
  L3_38 = A0_35["TrafficSelector.ProfileName"]
  L12_47 = A0_35["TrafficSelector.ServiceName"]
  if L12_47 == _UPVALUE0_.NIL then
    L12_47 = _UPVALUE0_
    L12_47 = L12_47.BAD_PARAMETER
    return L12_47
  end
  L4_39 = A0_35["TrafficSelector.ServiceName"]
  L12_47 = A0_35["TrafficSelector.MatchType"]
  if L12_47 == _UPVALUE0_.NIL then
    L12_47 = _UPVALUE0_
    L12_47 = L12_47.BAD_PARAMETER
    return L12_47
  end
  L5_40 = A0_35["TrafficSelector.MatchType"]
  if L5_40 == "1" then
    L12_47 = A0_35["TrafficSelector.IPAddress"]
    if L12_47 == _UPVALUE0_.NIL then
      L12_47 = _UPVALUE0_
      L12_47 = L12_47.BAD_PARAMETER
      return L12_47
    end
    L12_47 = A0_35["TrafficSelector.IPAddress"]
    if L12_47 == "0.0.0.0" then
      L12_47 = _UPVALUE1_
      L12_47 = L12_47.TS_INVALID_IP
      return L12_47
    end
    L6_41 = A0_35["TrafficSelector.IPAddress"]
    L12_47 = A0_35["TrafficSelector.SubnetMask"]
    if L12_47 == _UPVALUE0_.NIL then
      L12_47 = _UPVALUE0_
      L12_47 = L12_47.BAD_PARAMETER
      return L12_47
    end
    L7_42 = A0_35["TrafficSelector.SubnetMask"]
  end
  if L5_40 == "2" then
    L12_47 = A0_35["TrafficSelector.MACAddress"]
    if L12_47 == _UPVALUE0_.NIL then
      L12_47 = _UPVALUE0_
      L12_47 = L12_47.BAD_PARAMETER
      return L12_47
    end
    L8_43 = A0_35["TrafficSelector.MACAddress"]
  end
  if L5_40 == "3" then
    L12_47 = A0_35["TrafficSelector.PortName"]
    if L12_47 == _UPVALUE0_.NIL then
      L12_47 = _UPVALUE0_
      L12_47 = L12_47.BAD_PARAMETER
      return L12_47
    end
    L9_44 = A0_35["TrafficSelector.PortName"]
  end
  if L5_40 == "4" then
    L12_47 = A0_35["TrafficSelector.VlanId"]
    if L12_47 == _UPVALUE0_.NIL then
      L12_47 = _UPVALUE0_
      L12_47 = L12_47.BAD_PARAMETER
      return L12_47
    end
    L9_44 = A0_35["TrafficSelector.VlanId"]
  end
  if L5_40 == "6" then
    L12_47 = A0_35["TrafficSelector.VapName"]
    if L12_47 == _UPVALUE0_.NIL then
      L12_47 = _UPVALUE0_
      L12_47 = L12_47.BAD_PARAMETER
      return L12_47
    end
    L10_45 = A0_35["TrafficSelector.VapName"]
  end
  L12_47 = db
  L12_47 = L12_47.getTable
  L12_47 = L12_47("TrafficSelector")
  for _FORV_16_, _FORV_17_ in pairs(L12_47) do
    if L12_47[_FORV_16_] ~= nil and tonumber(L12_47[_FORV_16_]["TrafficSelector._ROWID_"]) ~= tonumber(L2_37) and L12_47[_FORV_16_]["TrafficSelector.ServiceName"] == L4_39 and L12_47[_FORV_16_]["TrafficSelector.ProfileName"] == L3_38 and tonumber(L12_47[_FORV_16_]["TrafficSelector.MatchType"]) == tonumber(L5_40) then
      if L5_40 == "1" then
        if L12_47[_FORV_16_]["TrafficSelector.IPAddress"] == L6_41 and L12_47[_FORV_16_]["TrafficSelector.SubnetMask"] == L7_42 then
          return _UPVALUE1_.TRAFFIC_SELECTOR_ENTRY_EXIST
        end
      elseif L5_40 == "2" then
        if L12_47[_FORV_16_]["TrafficSelector.MACAddress"] == L8_43 then
          return _UPVALUE1_.TRAFFIC_SELECTOR_ENTRY_EXIST
        end
      elseif L5_40 == "3" then
        if L12_47[_FORV_16_]["TrafficSelector.PortName"] == L9_44 then
          return _UPVALUE1_.TRAFFIC_SELECTOR_ENTRY_EXIST
        end
      elseif L5_40 == "4" then
        if tonumber(L12_47[_FORV_16_]["TrafficSelector.VlanId"]) == tonumber(L11_46) then
          return _UPVALUE1_.TRAFFIC_SELECTOR_ENTRY_EXIST
        end
      elseif L5_40 == "6" and L12_47[_FORV_16_]["TrafficSelector.VapName"] == L10_45 then
        return _UPVALUE1_.TRAFFIC_SELECTOR_ENTRY_EXIST
      end
    end
  end
  _UPVALUE2_.start()
  L1_36 = _UPVALUE3_.trafficSelectorEdit(L3_38, L4_39, L5_40, L6_41, L7_42, L8_43, L9_44, L10_45, L11_46, L2_37)
  if L1_36 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in deleting the traffic Selectors.")
    _UPVALUE2_.abort()
    return L1_36
  end
  L1_36 = _UPVALUE0_.SUCCESS
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return L1_36
end
function qosTrafficSelectorDelete(A0_48)
  local L1_49, L2_50
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for traffic selector PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_49 = A0_48["TrafficSelector.cookie"]
  if L1_49 == _UPVALUE0_.NIL then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L2_50, cookie = _UPVALUE2_.qosTrafficSelectorDelete(L1_49)
  if L2_50 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in traffic selector page " .. L2_50)
    _UPVALUE1_.abort()
    return L2_50
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L2_50, cookie
end
