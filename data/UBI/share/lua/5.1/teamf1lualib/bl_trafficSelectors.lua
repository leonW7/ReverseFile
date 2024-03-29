local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wanqos.trafficselector", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/fwCustomServices")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/wanqos_trafficSelector")
L0_0 = require
L0_0("teamf1lualib/qos_returnCodes")
L0_0 = require
L0_0("teamf1lualib/wanqos_bandwidthMonitor")
L0_0 = require
L0_0("teamf1lualib/vlan_vlan")
L0_0 = "IP"
function availBwProfileListGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  L0_1 = {}
  L1_2 = 1
  L2_3, L3_4, L4_5 = nil, nil, nil
  L2_3, L3_4, L4_5 = bwProfile.profileGet()
  if L2_3 == _UPVALUE0_.SUCCESS then
    L0_1[L1_2] = L4_5
    L1_2 = L1_2 + 1
    while L2_3 == _UPVALUE0_.SUCCESS do
      L2_3, L3_4, L4_5 = bwProfile.profileGetNext(L3_4)
      if L2_3 == _UPVALUE0_.SUCCESS then
        L0_1[L1_2] = L4_5
        L1_2 = L1_2 + 1
      end
    end
    return _UPVALUE0_.SUCCESS, L0_1
  else
    return L2_3
  end
end
function availServicesListGet()
  local L0_6, L1_7, L2_8, L3_9, L4_10
  L0_6 = {}
  L1_7 = 1
  L2_8, L3_9, L4_10 = nil, nil, nil
  L2_8, L3_9, L4_10 = firewall.servicesGet()
  if L2_8 == _UPVALUE0_.SUCCESS then
    L0_6[L1_7] = L4_10
    L1_7 = L1_7 + 1
    while L2_8 == _UPVALUE0_.SUCCESS do
      L2_8, L3_9, L4_10 = firewall.servicesGetNext(L3_9)
      if L2_8 == _UPVALUE0_.SUCCESS then
        L0_6[L1_7] = L4_10
        L1_7 = L1_7 + 1
      end
    end
    return _UPVALUE0_.SUCCESS, L0_6
  else
    return L2_8
  end
end
function availVlansListGet()
  local L0_11, L1_12, L2_13, L3_14, L4_15
  L0_11 = {}
  L1_12 = 1
  L2_13, L3_14, L4_15 = nil, nil, nil
  L2_13, L3_14, L4_15 = _UPVALUE0_.vlanIdGet()
  if L2_13 == _UPVALUE1_.SUCCESS then
    L0_11[L1_12] = L4_15
    L1_12 = L1_12 + 1
    while L2_13 == _UPVALUE1_.SUCCESS do
      L2_13, L3_14, L4_15 = _UPVALUE0_.vlanIdGetNext(L3_14)
      if L2_13 == _UPVALUE1_.SUCCESS then
        L0_11[L1_12] = L4_15
        L1_12 = L1_12 + 1
      end
    end
    return _UPVALUE1_.SUCCESS, L0_11
  else
    return L2_13
  end
end
function optionTrafficShappingProfileGet()
  local L0_16, L1_17, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26, L11_27
  L1_17, L0_16, L10_26, L9_25, L2_18, L5_21, L3_19, L4_20, L7_23, L6_22, L8_24 = _UPVALUE0_.trafficSelectorProfileGet()
  if L1_17 ~= _UPVALUE1_.SUCCESS then
    return L1_17
  end
  if L5_21 == _UPVALUE2_ then
    L11_27 = _UPVALUE2_ .. ": " .. L3_19
  elseif L5_21 == _UPVALUE3_ then
    L11_27 = _UPVALUE3_ .. ": " .. L4_20
  elseif L5_21 == _UPVALUE4_ then
    L11_27 = _UPVALUE4_ .. ": " .. L6_22
  elseif L5_21 == _UPVALUE5_ then
    L11_27 = "Port Name" .. ": " .. L7_23
  elseif L5_21 == _UPVALUE6_ then
    L11_27 = _UPVALUE6_ .. ": " .. L8_24
  end
  for _FORV_15_, _FORV_16_ in pairs(_UPVALUE7_) do
    if _FORV_16_ == L5_21 then
      L5_21 = _FORV_15_
      break
    end
  end
  return L1_17, L0_16, L10_26, L9_25, L2_18, L5_21, L3_19, L4_20, L7_23, L6_22, L8_24, L11_27
end
function optionTrafficShappingProfileGetNext(A0_28)
  local L1_29, L2_30, L3_31, L4_32, L5_33, L6_34, L7_35, L8_36, L9_37, L10_38, L11_39, L12_40, L13_41
  L2_30 = A0_28["trafficSelectors.cookie"]
  if L2_30 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L3_31, L1_29, L12_40, L11_39, L4_32, L7_35, L5_33, L6_34, L9_37, L8_36, L10_38 = _UPVALUE1_.trafficSelectorProfileGetNext(L2_30)
  if L3_31 ~= _UPVALUE0_.SUCCESS then
    return L3_31
  end
  if L7_35 == _UPVALUE2_ then
    L13_41 = _UPVALUE2_ .. ": " .. L5_33
  elseif L7_35 == _UPVALUE3_ then
    L13_41 = _UPVALUE3_ .. ": " .. L6_34
  elseif L7_35 == _UPVALUE4_ then
    L13_41 = _UPVALUE4_ .. ": " .. L8_36
  elseif L7_35 == _UPVALUE5_ then
    L13_41 = "Port Name" .. ": " .. L9_37
  elseif L7_35 == _UPVALUE6_ then
    L13_41 = _UPVALUE6_ .. ": " .. L10_38
  end
  for _FORV_17_, _FORV_18_ in pairs(_UPVALUE7_) do
    if _FORV_18_ == L7_35 then
      L7_35 = _FORV_17_
      break
    end
  end
  return L3_31, L1_29, L12_40, L11_39, L4_32, L7_35, L5_33, L6_34, L9_37, L8_36, L10_38, L13_41
end
function optionTrafficShappingProfileSet(A0_42)
  local L1_43, L2_44, L3_45, L4_46, L5_47, L6_48, L7_49, L8_50, L9_51, L10_52
  L1_43 = ACCESS_LEVEL
  if L1_43 ~= 0 then
    L1_43 = util
    L1_43 = L1_43.appendDebugOut
    L2_44 = "Detected Unauthorized access for trafficSelectors page"
    L1_43(L2_44)
    L1_43 = _UPVALUE0_
    L1_43 = L1_43.UNAUTHORIZED
    return L1_43
  end
  L1_43 = A0_42["trafficSelectors.cookie"]
  L2_44 = A0_42["trafficSelectors.service"]
  L3_45 = A0_42["trafficSelectors.ipAddress"]
  L4_46 = A0_42["trafficSelectors.macAddress"]
  L5_47 = A0_42["trafficSelectors.matchType"]
  L6_48 = A0_42["trafficSelectors.vlan"]
  L7_49 = A0_42["trafficSelectors.port"]
  L8_50 = A0_42["trafficSelectors.dscp"]
  L9_51 = A0_42["trafficSelectors.availableProfiles"]
  L10_52 = nil
  if L1_43 == nil then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L2_44 == nil or L5_47 == nil or L9_51 == nil then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L5_47 = _UPVALUE1_[tonumber(L5_47)]
  if L5_47 == _UPVALUE2_ and L3_45 == nil then
    util.appendDebugOut("Set : Invalid IP")
    return _UPVALUE0_.BAD_PARAMETER
  elseif L5_47 == _UPVALUE3_ and L4_46 == nil then
    util.appendDebugOut("Set : Invalid MAC")
    return _UPVALUE0_.BAD_PARAMETER
  elseif L5_47 == _UPVALUE4_ and L6_48 == nil then
    util.appendDebugOut("Set : Invalid VLAN")
    return _UPVALUE0_.BAD_PARAMETER
  elseif L5_47 == _UPVALUE5_ and L7_49 == nil then
    util.appendDebugOut("Set : Invalid PORT")
    return _UPVALUE0_.BAD_PARAMETER
  elseif L5_47 == _UPVALUE6_ and L8_50 == nil then
    util.appendDebugOut("Set : Invalid DSCP")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE7_.start()
  L10_52, cookie = _UPVALUE8_.trafficSelectorProfileSet(L1_43, L9_51, L2_44, L5_47, L3_45, L4_46, L7_49, L6_48, L8_50)
  if L10_52 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in trafficSelectors page" .. L10_52)
    _UPVALUE7_.abort()
    return L10_52
  end
  _UPVALUE7_.complete()
  _UPVALUE7_.save()
  return L10_52, cookie
end
function optionTrafficShappingProfileCreate(A0_53)
  local L1_54, L2_55, L3_56, L4_57, L5_58, L6_59, L7_60, L8_61, L9_62
  L1_54 = ACCESS_LEVEL
  if L1_54 ~= 0 then
    L1_54 = util
    L1_54 = L1_54.appendDebugOut
    L2_55 = "Detected Unauthorized access for trafficSelectors page"
    L1_54(L2_55)
    L1_54 = _UPVALUE0_
    L1_54 = L1_54.UNAUTHORIZED
    return L1_54
  end
  L1_54 = A0_53["trafficSelectors.service"]
  L2_55 = A0_53["trafficSelectors.ipAddress"]
  L3_56 = A0_53["trafficSelectors.macAddress"]
  L4_57 = A0_53["trafficSelectors.matchType"]
  L5_58 = A0_53["trafficSelectors.vlan"]
  L6_59 = A0_53["trafficSelectors.port"]
  L7_60 = A0_53["trafficSelectors.dscp"]
  L8_61 = A0_53["trafficSelectors.availableProfiles"]
  L9_62 = nil
  if L8_61 == nil then
    return _UPVALUE1_.BWMONITOR_INVALID_PROFILENAME
  end
  if L1_54 == nil or L4_57 == nil then
    util.appendDebugOut("Create : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L4_57 = _UPVALUE2_[tonumber(L4_57)]
  if L4_57 == _UPVALUE3_ and L2_55 == nil then
    util.appendDebugOut("Create : Invalid IP")
    return _UPVALUE0_.BAD_PARAMETER
  elseif L4_57 == _UPVALUE4_ and L3_56 == nil then
    util.appendDebugOut("Create : Invalid MAC")
    return _UPVALUE0_.BAD_PARAMETER
  elseif L4_57 == _UPVALUE5_ and L5_58 == nil then
    util.appendDebugOut("Create : Invalid VLAN")
    return _UPVALUE0_.BAD_PARAMETER
  elseif L4_57 == _UPVALUE6_ and L6_59 == nil then
    util.appendDebugOut("Create : Invalid PORT")
    return _UPVALUE0_.BAD_PARAMETER
  elseif L4_57 == _UPVALUE7_ and L7_60 == nil then
    util.appendDebugOut("Create : Invalid DSCP")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE8_.start()
  L9_62, cookie = _UPVALUE9_.trafficSelectorProfileCreate(L8_61, L1_54, L4_57, L2_55, L3_56, L6_59, L5_58, L7_60)
  if L9_62 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in trafficSelectors page" .. L9_62)
    _UPVALUE8_.abort()
    return L9_62
  end
  _UPVALUE8_.complete()
  _UPVALUE8_.save()
  return L9_62, cookie
end
function optionTrafficShappingProfileDelete(A0_63)
  local L1_64, L2_65
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for trafficSelectors PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_64 = A0_63["trafficSelectors.cookie"]
  if L1_64 == nil then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L2_65, cookie = _UPVALUE2_.trafficSelectorProfileDelete(L1_64)
  if L2_65 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in trafficSelectors page " .. L2_65)
    _UPVALUE1_.abort()
    return L2_65
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L2_65, cookie
end
function optionTrafficShappingProfileListGet()
  local L0_66, L1_67, L2_68, L3_69, L4_70, L5_71, L6_72, L7_73, L8_74, L9_75, L10_76, L11_77, L12_78, L13_79
  L12_78 = 1
  L13_79 = {}
  L1_67, L0_66, L10_76, L9_75, L2_68, L5_71, L3_69, L4_70, L7_73, L6_72, L8_74 = _UPVALUE0_.trafficSelectorProfileGet()
  if L1_67 == _UPVALUE1_.SUCCESS then
    if L5_71 == _UPVALUE2_ then
      L11_77 = _UPVALUE2_ .. ": " .. L3_69
    elseif L5_71 == _UPVALUE3_ then
      L11_77 = _UPVALUE3_ .. ": " .. L4_70
    elseif L5_71 == _UPVALUE4_ then
      L11_77 = _UPVALUE4_ .. ": " .. L6_72
    elseif L5_71 == _UPVALUE5_ then
      L11_77 = "Port Name" .. ": " .. L7_73
    elseif L5_71 == _UPVALUE6_ then
      L11_77 = _UPVALUE6_ .. ": " .. L8_74
    end
    for _FORV_17_, _FORV_18_ in pairs(_UPVALUE7_) do
      if _FORV_18_ == L5_71 then
        L5_71 = _FORV_17_
        break
      end
    end
    L13_79[L12_78] = {}
    L13_79[L12_78].profile = L10_76
    L13_79[L12_78].availableProfiles = L9_75
    L13_79[L12_78].service = L2_68
    L13_79[L12_78].matchType = L5_71
    L13_79[L12_78].description = L11_77
    L13_79[L12_78].ipAddress = L3_69
    L13_79[L12_78].macAddress = L4_70
    L13_79[L12_78].port = L7_73
    L13_79[L12_78].vlan = L6_72
    L13_79[L12_78].dscp = L8_74
    L12_78 = L12_78 + 1
    while L1_67 == _UPVALUE1_.SUCCESS do
      L1_67, L0_66, L10_76, L9_75, L2_68, L5_71, L3_69, L4_70, L7_73, L6_72, L8_74 = _UPVALUE0_.trafficSelectorProfileGetNext(L0_66)
      if L1_67 == _UPVALUE1_.SUCCESS then
        if L5_71 == _UPVALUE2_ then
          L11_77 = _UPVALUE2_ .. ": " .. L3_69
        elseif L5_71 == _UPVALUE3_ then
          L11_77 = _UPVALUE3_ .. ": " .. L4_70
        elseif L5_71 == _UPVALUE4_ then
          L11_77 = _UPVALUE4_ .. ": " .. L6_72
        elseif L5_71 == _UPVALUE5_ then
          L11_77 = "Port Name" .. ": " .. L7_73
        elseif L5_71 == _UPVALUE6_ then
          L11_77 = _UPVALUE6_ .. ": " .. L8_74
        end
        for _FORV_17_, _FORV_18_ in pairs(_UPVALUE7_) do
          if _FORV_18_ == L5_71 then
            L5_71 = _FORV_17_
            break
          end
        end
        L13_79[L12_78] = {}
        L13_79[L12_78].profile = L10_76
        L13_79[L12_78].availableProfiles = L9_75
        L13_79[L12_78].service = L2_68
        L13_79[L12_78].matchType = L5_71
        L13_79[L12_78].description = L11_77
        L13_79[L12_78].ipAddress = L3_69
        L13_79[L12_78].macAddress = L4_70
        L13_79[L12_78].port = L7_73
        L13_79[L12_78].vlan = L6_72
        L13_79[L12_78].dscp = L8_74
        L12_78 = L12_78 + 1
      end
    end
    return _UPVALUE1_.SUCCESS, L13_79
  else
    return L1_67
  end
end
function optionTrafficShappingMultiPleProfileDelete(A0_80)
  local L1_81, L2_82, L3_83
  L3_83 = 1
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for trafficSelectors PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_81 = A0_80["trafficSelectors.cookie"][L3_83]
  if L1_81 == nil then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  while A0_80["trafficSelectors.cookie"][L3_83] ~= nil do
    L1_81 = A0_80["trafficSelectors.cookie"][L3_83]
    L2_82, cookie = _UPVALUE2_.trafficSelectorProfileDelete(L1_81)
    if L2_82 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in Delete Opetation in trafficSelectors page " .. L2_82)
      _UPVALUE1_.abort()
      return L2_82
    end
    L3_83 = L3_83 + 1
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L2_82, cookie
end
function trafficSelectorRuleGetAll()
  local L0_84, L1_85, L2_86, L3_87, L4_88
  L1_85 = {}
  L2_86, L3_87 = nil, nil
  L4_88 = 1
  L0_84, L3_87, L2_86 = _UPVALUE0_.trafficSelectorGetAll()
  if L0_84 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  for _FORV_8_, _FORV_9_ in pairs(L3_87) do
    L1_85[L4_88] = {}
    for _FORV_13_, _FORV_14_ in pairs(L2_86) do
      if _FORV_9_.QueueKey == _FORV_14_.QueueKey then
        L1_85[L4_88].queueName = _FORV_14_.QueueName
        break
      end
    end
    L1_85[L4_88].service = _FORV_9_.Service
    if _FORV_9_.SourceIP ~= _UPVALUE2_ and _FORV_9_.SourceIP ~= "" then
      L1_85[L4_88].description = "IP: " .. _FORV_9_.SourceIP
    elseif _FORV_9_.SourceMACAddress ~= _UPVALUE2_ and _FORV_9_.SourceMACAddress ~= "" then
      L1_85[L4_88].description = "MAC: " .. _FORV_9_.SourceMACAddress
    elseif _FORV_9_.OutOfBandInfo ~= _UPVALUE2_ and _FORV_9_.OutOfBandInfo ~= "" then
      L1_85[L4_88].description = "Port Name: " .. "Port" .. _FORV_9_.OutOfBandInfo
    elseif _FORV_9_.VLANIDCheck ~= _UPVALUE2_ and _FORV_9_.VLANIDCheck ~= "" then
      L1_85[L4_88].description = "VLAN: " .. _FORV_9_.VLANIDCheck
    elseif _FORV_9_.DSCPCheck ~= _UPVALUE2_ and _FORV_9_.DSCPCheck ~= "" then
      L1_85[L4_88].description = "DSCP: " .. _FORV_9_.DSCPCheck
    end
    L1_85[L4_88].keyName = _FORV_9_.ClassificationKey
    L4_88 = L4_88 + 1
  end
  return _UPVALUE1_.SUCCESS, L1_85
end
function trafficSelectorRuleGetRow(A0_89)
  local L1_90, L2_91, L3_92
  curCookie = A0_89["trafficSelectors.cookie"]
  if curCookie == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_90, L2_91, L3_92 = _UPVALUE1_.trafficSelectorGetRow(curCookie)
  if L1_90 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  L2_91 = util.removePrefix(L2_91, "qosClassification.")
  if L2_91.SourceIP ~= _UPVALUE2_ and L2_91.SourceIP ~= "" then
  elseif L2_91.SourceMACAddress ~= _UPVALUE2_ and L2_91.SourceMACAddress ~= "" then
  elseif L2_91.OutOfBandInfo ~= _UPVALUE2_ and L2_91.OutOfBandInfo ~= "" then
  elseif L2_91.VLANIDCheck ~= _UPVALUE2_ and L2_91.VLANIDCheck ~= "" then
  else
  end
  L3_92 = util.removePrefix(L3_92, "qosClassQueue.")
  L2_91.matchType, L2_91.profileName = "5", L3_92.QueueName
  return _UPVALUE0_.SUCCESS, L2_91
end
function bandwidthProfileGetAll()
  local L0_93, L1_94
  L0_93, L1_94 = _UPVALUE0_.bwProfileGetAll()
  if L0_93 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_94
end
function vlanGetAll()
  local L0_95, L1_96
  L0_95, L1_96 = _UPVALUE0_.vlanIdGetAll()
  if L0_95 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_96
end
function customServicesGetAll()
  local L0_97, L1_98
  L0_97, L1_98 = fw.core.services.GetAll()
  if L0_97 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_98
end
