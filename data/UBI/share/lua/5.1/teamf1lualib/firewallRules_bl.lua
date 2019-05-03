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
L0_0("teamf1lualib/fwIpv4firewallRules")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/fwPriorityMap")
L0_0 = require
L0_0("teamf1lualib/vlan_vlan")
L0_0 = require
L0_0("teamf1lualib/fwSchedules")
L0_0 = require
L0_0("teamf1lualib/wan_routingMode")
L0_0 = require
L0_0("teamf1lualib/fwCustomServices")
L0_0 = require
L0_0("teamf1lualib/wan_ipAliasing")
L0_0 = require
L0_0("validationsLuaLib")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.wan.ipaliasing")
Ipv4firewallRulesTable = "FirewallRules"
attribute = {}
attribute.ruleType = "RuleType"
attribute.status = "Status"
attribute.serviceName = "ServiceName"
attribute.typeOfService = "TypeOfService"
attribute.action = "Action"
attribute.scheduleName = "ScheduleName"
attribute.sourceAddressType = "SourceAddressType"
attribute.sourceAddressStart = "SourceAddressStart"
attribute.sourceAddressEnd = "SourceAddressEnd"
attribute.logStatus = "LogLevel"
attribute.destinationAddressType = "DestinationAddressType"
attribute.destinationAddressStart = "DestinationAddressStart"
attribute.destinationAddressEnd = "DestinationAddressEnd"
attribute.snatAddressType = "SNATAddressType"
attribute.snatAddress = "SNATAddress"
attribute.snatInterface = "SNATInterface"
attribute.destinationPublicInterface = "DestinationPublicInterface"
attribute.destinationPublicAddress = "DestinationPublicAddress"
attribute.dnatAddress = "DNATAddress"
attribute.dnatPortEnable = "DNATPortEnable"
attribute.dnatPort = "DNATPort"
attribute.fromZoneType = "FromZoneType"
attribute.toZoneType = "ToZoneType"
attribute.priorityId = "PriorityId"
attribute.fromZoneVlanId = "FromZoneVlanId"
attribute.toZoneVlanId = "ToZoneVlanId"
attribute.fromZoneVlanName = "FromZoneVlanName"
attribute.toZoneVlanName = "ToZoneVlanName"
attribute.ipAliasName = "ipAliasing"
OTHER = "OTHER"
IPFLAG = "4"
ENABLE = "1"
DISABLE = "0"
DEFAULT_ROWID = "1"
function ipAliasGetAll()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  L4_5 = {}
  L0_1, L1_2 = _UPVALUE0_.aliasGetAll()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  if UNIT_NAME ~= "DSR-250N" and UNIT_NAME ~= "DSR-250" and UNIT_NAME ~= "DSR-150N" and UNIT_NAME ~= "DSR-150" then
    L0_1, L2_3, L3_4 = _UPVALUE2_.routingBridgeModeGet()
  else
    L0_1, L2_3, L3_4 = _UPVALUE2_.routingModeGet()
  end
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  if tonumber(L3_4[_UPVALUE3_]) == 1 or tonumber(L3_4[_UPVALUE3_]) == 6 then
    for _FORV_9_, _FORV_10_ in pairs(L1_2) do
      if _FORV_10_.LogicalIfName == _UPVALUE4_ and tonumber(L3_4[_UPVALUE5_]) == 1 or _FORV_10_.LogicalIfName == _UPVALUE6_ and tonumber(L3_4[_UPVALUE7_]) == 1 then
        L4_5[1] = {}
        L4_5[1][attribute.ipAliasName] = _FORV_10_.LogicalIfName .. " - " .. _FORV_10_.IPAddress
        L4_5[1].IPAddress = _FORV_10_.IPAddress
      end
    end
  end
  return L0_1, L4_5
end
function serviceNameGetAll()
  local L0_6, L1_7
  L0_6 = fw
  L0_6 = L0_6.core
  L0_6 = L0_6.services
  L0_6 = L0_6.GetAll
  L1_7 = L0_6()
  if L0_6 ~= _UPVALUE0_.SUCCESS then
    return L0_6
  end
  return L0_6, L1_7
end
function getAllScheduleInfo()
  local L0_8, L1_9
  L0_8, L1_9 = fw.core.schedules.GetAll()
  if L0_8 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  return L0_8, L1_9
end
function getAllVLanInfo()
  local L0_10, L1_11
  L0_10, L1_11 = _UPVALUE0_.vlanIdNameGetAll()
  if L0_10 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  return L0_10, L1_11
end
function routingModeGet()
  local L0_12, L1_13, L2_14, L3_15
  if UNIT_NAME ~= "DSR-250N" and UNIT_NAME ~= "DSR-250" and UNIT_NAME ~= "DSR-150N" and UNIT_NAME ~= "DSR-150" then
    L0_12, L1_13, L3_15 = _UPVALUE0_.routingBridgeModeGet()
  else
    L0_12, L1_13, L3_15 = _UPVALUE0_.routingModeGet()
  end
  L2_14 = L3_15.routeMode
  if L0_12 ~= _UPVALUE1_.SUCCESS then
    return L0_12
  end
  return L0_12, L2_14
end
function configPortGet()
  return (fw.core.firewallRules.Ipv4.configPortIfNameGet())
end
function natModeGet()
  return (fw.core.firewallRules.Ipv4.natModeInfoGet())
end
function dNatAddressRangeCheck(A0_16, A1_17, A2_18)
  local L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25
  L6_22 = 0
  L7_23 = UNIT_NAME
  if L7_23 ~= "DSR-250N" then
    L7_23 = UNIT_NAME
    if L7_23 ~= "DSR-250" then
      L7_23 = UNIT_NAME
      if L7_23 ~= "DSR-150N" then
        L7_23 = UNIT_NAME
        if L7_23 ~= "DSR-150" then
          L7_23 = _UPVALUE0_
          L7_23 = L7_23.routingBridgeModeGet
          L9_25 = L7_23()
          L5_21 = L9_25
          L4_20 = L8_24
          L3_19 = L7_23
        end
      end
    end
  else
    L7_23 = _UPVALUE0_
    L7_23 = L7_23.routingModeGet
    L9_25 = L7_23()
    L5_21 = L9_25
    L4_20 = L8_24
    L3_19 = L7_23
  end
  L7_23 = _UPVALUE1_
  L7_23 = L7_23.SUCCESS
  if L3_19 ~= L7_23 then
    return L3_19
  end
  L7_23 = _UPVALUE2_
  if A1_17 == L7_23 then
    L7_23 = tonumber
    L8_24 = _UPVALUE3_
    L8_24 = L5_21[L8_24]
    L7_23 = L7_23(L8_24)
    if L7_23 == 1 then
      L6_22 = 1
    end
  else
    L7_23 = _UPVALUE4_
    if A1_17 == L7_23 then
      L7_23 = tonumber
      L8_24 = _UPVALUE5_
      L8_24 = L5_21[L8_24]
      L7_23 = L7_23(L8_24)
      if L7_23 == 1 then
        L6_22 = 1
      end
    else
      L7_23 = _UPVALUE6_
      if A1_17 == L7_23 then
        L7_23 = tonumber
        L8_24 = _UPVALUE3_
        L8_24 = L5_21[L8_24]
        L7_23 = L7_23(L8_24)
        if L7_23 ~= 1 then
          L7_23 = tonumber
          L8_24 = _UPVALUE5_
          L8_24 = L5_21[L8_24]
          L7_23 = L7_23(L8_24)
        elseif L7_23 == 1 then
          L6_22 = 1
        end
      end
    end
  end
  if L6_22 == 1 then
    L7_23 = fw
    L7_23 = L7_23.core
    L7_23 = L7_23.firewallRules
    L7_23 = L7_23.Ipv4
    L7_23 = L7_23.interfaceInfoGet
    L8_24 = A2_18
    L9_25 = L7_23(L8_24)
    if L7_23 ~= _UPVALUE1_.SUCCESS then
      return _UPVALUE1_.BAD_PARAMETER, 0
    end
    L3_19, message = _UPVALUE7_.ipv4SingleMaskCheck(L8_24, A0_16, L9_25)
    if L3_19 ~= _UPVALUE1_.SUCCESS then
      util.appendDebugOut(message .. L3_19)
      return _UPVALUE1_.FW_DEST_NAT_IP_ERROR
    end
  end
  L7_23 = _UPVALUE1_
  L7_23 = L7_23.SUCCESS
  return L7_23
end
function natModeGetRows()
  return (fw.core.firewallRules.Ipv4.natModeInfoGetRows())
end
function firewallRuleGetAll()
  local L0_26, L1_27, L2_28
  L1_27 = L2_28()
  L0_26 = L2_28
  if L0_26 ~= L2_28 then
    return L0_26
  end
  vlanIdNameInfo = L2_28()
  L0_26 = L2_28
  if L0_26 ~= L2_28 then
    return L2_28
  end
  for _FORV_5_, _FORV_6_ in L2_28(L1_27) do
    if _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.fromZoneType] == "INSECURE" then
      _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.fromZoneType] = "WAN"
    elseif _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.fromZoneType] == "PUBLIC" then
      _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.fromZoneType] = "DMZ"
    elseif _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.fromZoneType] == "SECURE" then
      if _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.fromZoneVlanId] == "0" then
        _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.fromZoneType] = "LAN"
      else
        for _FORV_10_, _FORV_11_ in pairs(vlanIdNameInfo) do
          if _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.fromZoneVlanId] == _FORV_11_.vlanId then
            _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.fromZoneType] = _FORV_11_.vlanName
          end
        end
      end
    end
    if _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.toZoneType] == "INSECURE" then
      _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.toZoneType] = "WAN"
    elseif _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.toZoneType] == "PUBLIC" then
      _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.toZoneType] = "DMZ"
    elseif _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.toZoneType] == "SECURE" then
      if _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.toZoneVlanId] == "0" then
        _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.toZoneType] = "LAN"
      else
        for _FORV_10_, _FORV_11_ in pairs(vlanIdNameInfo) do
          if _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.toZoneVlanId] == _FORV_11_.vlanId then
            _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.toZoneType] = _FORV_11_.vlanName
          end
        end
      end
    end
    if _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.sourceAddressType] == "1" then
      _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.sourceAddressType] = _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.sourceAddressStart]
    elseif _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.sourceAddressType] == "2" then
      _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.sourceAddressType] = _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.sourceAddressStart] .. " - " .. _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.sourceAddressEnd]
    end
    if _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.destinationAddressType] == "1" then
      _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.destinationAddressType] = _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.destinationAddressStart]
    elseif _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.destinationAddressType] == "2" then
      _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.destinationAddressType] = _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.destinationAddressStart] .. " - " .. _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.destinationAddressEnd]
    end
    if _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.destinationPublicInterface] == "WAN1" then
      _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.destinationPublicInterface] = "WAN1"
    elseif _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.destinationPublicInterface] == "WAN2" then
      _FORV_6_[Ipv4firewallRulesTable .. "." .. attribute.destinationPublicInterface] = "WAN2"
    end
  end
  L0_26 = priorityStrGet()
  return L0_26, L1_27, L2_28
end
function firewallRuleGet(A0_29)
  local L1_30, L2_31, L3_32, L4_33, L5_34, L6_35, L7_36, L8_37, L9_38, L10_39, L11_40, L12_41, L13_42, L14_43, L15_44, L16_45, L17_46, L18_47, L19_48, L20_49, L21_50, L22_51, L23_52, L24_53, L25_54, L26_55, L27_56, L28_57, L29_58, L30_59, L31_60, L32_61
  L24_53 = fw
  L24_53 = L24_53.core
  L24_53 = L24_53.firewallRules
  L24_53 = L24_53.Ipv4
  L24_53 = L24_53.rowGet
  L9_38, L10_39, L11_40, L12_41, L13_42, L14_43, L15_44, L16_45, L17_46, L18_47, L19_48, L20_49, L21_50, fromZoneVlanId, toZoneVlanId, priorityId, DNATPortEnable, DNATPort, L24_53 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, L24_53(L25_54)
  L8_37 = L32_61
  L7_36 = L31_60
  L6_35 = L30_59
  L5_34 = L29_58
  L4_33 = L28_57
  L3_32 = L27_56
  L2_31 = L26_55
  L22_51 = L25_54
  L1_30 = L24_53
  L24_53 = _UPVALUE0_
  L24_53 = L24_53.SUCCESS
  if L1_30 ~= L24_53 then
    return L1_30
  end
  L24_53 = nil
  for L28_57, L29_58 in L25_54(L26_55) do
    if L29_58 == L5_34 then
      L24_53 = L30_59
    end
  end
  if L14_43 == "1" then
  else
    for L31_60, L32_61 in L28_57(L29_58) do
      if L32_61 == L16_45 then
        L16_45 = tostring(L31_60)
      end
    end
    if L14_43 == "10" and L15_44 ~= nil then
      L16_45 = L28_57 .. L29_58 .. L30_59 .. L31_60
    end
  end
  if L17_46 == "WAN1" or L17_46 == "WAN2" or L17_46 == "WAN3" then
    for L32_61, _FORV_33_ in L29_58(L30_59) do
      if _FORV_33_ == L17_46 then
      end
    end
  else
    for _FORV_34_, _FORV_35_ in L31_60(L32_61) do
    end
  end
  L29_58["firewallRules.serviceName"] = L2_31
  L29_58["firewallRules.ruleStatus"] = L3_32
  L29_58["firewallRules.typeOfService"] = L4_33
  L29_58["firewallRules.action"] = L24_53
  L29_58["firewallRules.scheduleName"] = L6_35
  L29_58["firewallRules.sourceAddressType"] = L30_59
  if L7_36 == "0" then
    L29_58["firewallRules.sourceAddressStart"] = nil
    L29_58["firewallRules.sourceAddressEnd"] = nil
  elseif L7_36 == "1" then
    L29_58["firewallRules.sourceAddressStart"] = L8_37
    L29_58["firewallRules.sourceAddressEnd"] = nil
  else
    L29_58["firewallRules.sourceAddressStart"] = L8_37
    L29_58["firewallRules.sourceAddressEnd"] = L9_38
  end
  L29_58["firewallRules.logStatus"] = L10_39
  if L11_40 ~= nil and L11_40 ~= "" then
    L29_58["firewallRules.destinationAddressType"] = L30_59
  end
  if L11_40 == "0" then
    L29_58["firewallRules.destinationAddressStart"] = nil
    L29_58["firewallRules.destinationAddressEnd"] = nil
  elseif L11_40 == "1" then
    L29_58["firewallRules.destinationAddressStart"] = L12_41
    L29_58["firewallRules.destinationAddressEnd"] = nil
  else
    L29_58["firewallRules.destinationAddressStart"] = L12_41
    L29_58["firewallRules.destinationAddressEnd"] = L13_42
  end
  L29_58["firewallRules.sNATAddressType"] = L25_54
  L29_58["firewallRules.sNATAddress"] = L26_55
  L29_58["firewallRules.sNATInterface"] = L16_45
  L29_58["firewallRules.destinationPublicInterface"] = L28_57
  L29_58["firewallRules.dnatAddress"] = L19_48
  L29_58["firewallRules.fromZoneType"] = L20_49
  L29_58["firewallRules.toZoneType"] = L21_50
  L29_58["firewallRules.fromZoneVlanId"] = L30_59
  L29_58["firewallRules.toZoneVlanId"] = L30_59
  L29_58["firewallRules.priorityId"] = L30_59
  if L30_59 ~= "0" then
    L29_58["firewallRules.fromZoneType"] = "SECURE_VLAN"
  end
  if L30_59 ~= "0" then
    L29_58["firewallRules.toZoneType"] = "SECURE_VLAN"
  end
  L29_58["firewallRules.DNATPortEnable"] = L30_59
  L29_58["firewallRules.DNATPort"] = L30_59
  if L30_59 == "SECURE_VLAN" then
    if L30_59 ~= nil then
      L29_58["firewallRules.toZonetype_Name"] = L31_60
      resturnStatus = L30_59
    end
  end
  vlanIdNameInfo = L31_60
  L1_30 = L30_59
  if L1_30 ~= L30_59 then
    return L30_59
  end
  return L30_59, L31_60, L32_61, vlanIdNameInfo
end
function firewallRuleGetNext(A0_62)
  local L1_63, L2_64, L3_65, L4_66, L5_67, L6_68, L7_69, L8_70, L9_71, L10_72, L11_73, L12_74, L13_75, L14_76, L15_77, L16_78, L17_79, L18_80, L19_81, L20_82, L21_83, L22_84
  L1_63 = A0_62["firewallRules.cookie"]
  if L1_63 == nil then
    L2_64 = util
    L2_64 = L2_64.appendDebugOut
    L3_65 = "GetNext : Invalid Cookie"
    L2_64(L3_65)
    L2_64 = _UPVALUE0_
    L2_64 = L2_64.BAD_PARAMETER
    return L2_64
  end
  L2_64, L3_65, L4_66, L5_67, L6_68, L7_69, L8_70, L9_71, L10_72, L11_73, L12_74, L13_75, L14_76, L15_77, L16_78, L17_79, L18_80, L19_81, L20_82, L21_83 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L22_84 = fw
  L22_84 = L22_84.core
  L22_84 = L22_84.firewallRules
  L22_84 = L22_84.Ipv4
  L22_84 = L22_84.GetNext
  L21_83, L3_65, L4_66, L5_67, L6_68, L7_69, L8_70, L9_71, L10_72, L11_73, L12_74, L13_75, L14_76, L15_77, L16_78, L17_79, L18_80, L19_81, L20_82, L22_84 = L1_63, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, L22_84(L1_63)
  L2_64 = L22_84
  L22_84 = _UPVALUE0_
  L22_84 = L22_84.SUCCESS
  if L2_64 ~= L22_84 then
    return L2_64
  end
  L22_84 = {}
  L22_84["firewallRules.serviceName"] = L3_65
  L22_84["firewallRules.ruleStatus"] = L4_66
  L22_84["firewallRules.typeOfService"] = L5_67
  L22_84["firewallRules.action"] = L6_68
  L22_84["firewallRules.scheduleName"] = L7_69
  L22_84["firewallRules.sourceAddressType"] = L8_70
  L22_84["firewallRules.sourceAddressStart"] = L9_71
  L22_84["firewallRules.sourceAddressEnd"] = L10_72
  L22_84["firewallRules.logStatus"] = L11_73
  L22_84["firewallRules.destinationAddressType"] = L12_74
  L22_84["firewallRules.destinationAddressStart"] = L13_75
  L22_84["firewallRules.destinationAddressEnd"] = L14_76
  L22_84["firewallRules.sNATAddressType"] = sNATAddressType
  L22_84["firewallRules.sNATInterface"] = sNATInterface
  L22_84["firewallRules.destinationPublicInterface"] = L17_79
  L22_84["firewallRules.dnatAddress"] = L18_80
  L22_84["firewallRules.fromZoneType"] = L19_81
  L22_84["firewallRules.toZoneType"] = L20_82
  return L2_64, L21_83, L22_84
end
function firewallRuleSet(A0_85)
  local L1_86, L2_87, L3_88, L4_89, L5_90, L6_91, L7_92, L8_93, L9_94, L10_95, L11_96, L12_97, L13_98, L14_99, L15_100, L16_101, L17_102, L18_103, L19_104, L20_105, L21_106, L22_107, L23_108, L24_109, L25_110, L26_111, L27_112, L28_113, L29_114, L30_115, L31_116, L32_117, L33_118, L34_119, L35_120, L36_121, L37_122
  L1_86 = routingModeGet
  L2_87 = L1_86()
  if A0_85 == nil then
    L3_88 = _UPVALUE0_
    L3_88 = L3_88.INVALID_ARGUMENT
    return L3_88
  end
  L3_88 = ACCESS_LEVEL
  if L3_88 ~= 0 then
    L3_88 = util
    L3_88 = L3_88.appendDebugOut
    L4_89 = "Detected Unauthorized access for page DUMMY PAGE"
    L3_88(L4_89)
    L3_88 = _UPVALUE0_
    L3_88 = L3_88.UNAUTHORIZED
    return L3_88
  end
  L3_88 = A0_85["firewallRules.cookie"]
  L4_89 = A0_85["firewallRules.serviceName"]
  L5_90 = A0_85["firewallRules.typeOfService"]
  L6_91 = _UPVALUE1_
  L7_92 = tonumber
  L8_93 = A0_85["firewallRules.action"]
  L7_92 = L7_92(L8_93)
  L6_91 = L6_91[L7_92]
  L7_92 = A0_85["firewallRules.scheduleName"]
  L8_93 = tostring
  L9_94 = tonumber
  L10_95 = A0_85["firewallRules.sourceAddressType"]
  L9_94 = L9_94(L10_95)
  L9_94 = L9_94 - 1
  L8_93 = L8_93(L9_94)
  L9_94 = A0_85["firewallRules.sourceAddressStart"]
  L10_95 = A0_85["firewallRules.sourceAddressEnd"]
  L11_96 = A0_85["firewallRules.logStatus"]
  L12_97 = nil
  L13_98 = A0_85["firewallRules.fromZoneType"]
  if L13_98 == "INSECURE" then
    L13_98 = ENABLE
    if L2_87 == L13_98 then
      L12_97 = nil
    end
  else
    L13_98 = tostring
    L14_99 = tonumber
    L15_100 = A0_85["firewallRules.destinationAddressType"]
    L14_99 = L14_99(L15_100)
    L14_99 = L14_99 - 1
    L13_98 = L13_98(L14_99)
    L12_97 = L13_98
  end
  L13_98 = A0_85["firewallRules.destinationAddressStart"]
  L14_99 = A0_85["firewallRules.destinationAddressEnd"]
  L15_100 = A0_85["firewallRules.fromZoneType"]
  L16_101 = A0_85["firewallRules.toZoneType"]
  L17_102 = A0_85["firewallRules.fromZoneVlanId"]
  L18_103 = A0_85["firewallRules.toZoneVlanId"]
  L19_104 = A0_85["firewallRules.dnatAddress"]
  L20_105 = A0_85["firewallRules.DNATPortEnable"]
  if L18_103 ~= nil then
    L21_106 = fw
    L21_106 = L21_106.core
    L21_106 = L21_106.firewallRules
    L21_106 = L21_106.Ipv4
    L21_106 = L21_106.vlanIDGet
    L22_107 = L18_103
    L22_107 = L21_106(L22_107)
    L18_103 = L22_107
    returnStatus = L21_106
  end
  L21_106 = nil
  if L4_89 ~= "ANY" then
    L22_107 = ENABLE
    if L20_105 == L22_107 then
      L21_106 = A0_85["firewallRules.DNATPort"]
    else
      L21_106 = DISABLE
    end
  else
    L21_106 = DISABLE
    L20_105 = DISABLE
  end
  L22_107, L23_108, L24_109 = nil, nil, nil
  L25_110 = A0_85["firewallRules.destinationPublicInterface"]
  if L25_110 ~= "1" then
    L25_110 = A0_85["firewallRules.destinationPublicInterface"]
    if L25_110 ~= "2" then
      L25_110 = A0_85["firewallRules.destinationPublicInterface"]
    end
  else
    if L25_110 == "3" then
      L25_110 = _UPVALUE2_
      L26_111 = tonumber
      L27_112 = A0_85["firewallRules.destinationPublicInterface"]
      L26_111 = L26_111(L27_112)
      L22_107 = L25_110[L26_111]
      L24_109 = L22_107
  end
  else
    L25_110 = A0_85["firewallRules.destinationPublicInterface"]
    if L25_110 ~= nil then
      L22_107 = OTHER
      L25_110 = util
      L25_110 = L25_110.split
      L26_111 = A0_85["firewallRules.destinationPublicInterface"]
      L27_112 = " - "
      L25_110 = L25_110(L26_111, L27_112)
      L23_108 = L25_110[2]
      L24_109 = L25_110[1]
    end
  end
  L25_110, L26_111, L27_112 = nil, nil, nil
  L28_113 = A0_85["firewallRules.sNATAddressType"]
  if L28_113 ~= nil then
    L28_113 = A0_85["firewallRules.sNATAddressType"]
    if L28_113 == "3" then
      A0_85["firewallRules.sNATAddressType"] = "1"
    end
    L28_113 = A0_85["firewallRules.sNATAddressType"]
    if L28_113 == "1" then
      L25_110 = "7"
    else
      L25_110 = "1"
    end
    if L25_110 == "1" then
      L26_111 = A0_85["firewallRules.sNATAddress"]
      L27_112 = nil
    else
      L28_113 = A0_85["firewallRules.sNATInterface"]
      if L28_113 ~= "1" then
        L28_113 = A0_85["firewallRules.sNATInterface"]
        if L28_113 ~= "2" then
          L28_113 = A0_85["firewallRules.sNATInterface"]
        end
      else
        if L28_113 == "3" then
          L28_113 = _UPVALUE2_
          L29_114 = tonumber
          L30_115 = A0_85["firewallRules.sNATInterface"]
          L29_114 = L29_114(L30_115)
          L27_112 = L28_113[L29_114]
          L25_110 = "7"
      end
      else
        L28_113 = A0_85["firewallRules.sNATInterface"]
        if L28_113 ~= nil then
          L25_110 = "10"
          L28_113 = util
          L28_113 = L28_113.split
          L29_114 = A0_85["firewallRules.sNATInterface"]
          L30_115 = " - "
          L28_113 = L28_113(L29_114, L30_115)
          L26_111 = L28_113[2]
          L27_112 = L28_113[1]
        end
      end
    end
  end
  L28_113 = A0_85["firewallRules.ruleStatus"]
  if L4_89 == nil or L6_91 == nil or L8_93 == nil or L15_100 == nil or L16_101 == nil then
    L29_114 = util
    L29_114 = L29_114.appendDebugOut
    L30_115 = "GetNext : Invalid Cookie"
    L29_114(L30_115)
    L29_114 = _UPVALUE0_
    L29_114 = L29_114.BAD_PARAMETER
    return L29_114
  end
  if L15_100 == "SECURE_VLAN" and L16_101 == "SECURE_VLAN" and L17_102 == L18_103 then
    L29_114 = _UPVALUE0_
    L29_114 = L29_114.FROM_ZONE_TO_ZONE_ERROR
    return L29_114
  end
  if L15_100 == "INSECURE" and L6_91 ~= "DROP" then
    L29_114 = nil
    if L16_101 == "PUBLIC" then
      L29_114 = "DMZ"
    elseif L16_101 == "SECURE" then
      L29_114 = "LAN"
    elseif L16_101 == "SECURE_VLAN" then
      L29_114 = "LAN"
      L30_115 = tonumber
      L30_115 = L30_115(L31_116)
      if L30_115 ~= 1 then
        L30_115 = L29_114
        L29_114 = L30_115 .. L31_116
      end
    end
    if L29_114 ~= nil and L19_104 ~= nil then
      L30_115 = tonumber
      L30_115 = L30_115(L31_116)
      if L30_115 ~= 1 then
        L30_115 = tonumber
        L30_115 = L30_115(L31_116)
      elseif L30_115 == 6 then
        L30_115 = dNatAddressRangeCheck
        L30_115 = L30_115(L31_116, L32_117, L33_118)
        if L30_115 ~= L31_116 then
          return L30_115
        end
      end
    end
  end
  if L15_100 == "SECURE_VLAN" then
    L15_100 = "SECURE"
  end
  if L16_101 == "SECURE_VLAN" then
    L16_101 = "SECURE"
  end
  if L15_100 == "SECURE" or L16_101 == "SECURE" then
    if L17_102 == nil then
      L17_102 = "0"
    end
    if L18_103 == nil then
      L18_103 = "0"
    end
  end
  L29_114, L30_115 = nil, nil
  if L17_102 ~= nil or L18_103 ~= nil then
    L30_115 = L32_117
    L29_114 = L31_116
  end
  if L18_103 ~= nil and L19_104 ~= nil then
    for L34_119, L35_120 in L31_116(L32_117) do
      L36_121 = L35_120["vlan.vlanId"]
      if L36_121 == L18_103 then
        L36_121 = _UPVALUE4_
        L36_121 = L36_121.ipv4SingleMaskCheck
        L37_122 = L35_120["ifStatic.StaticIp"]
        L37_122 = L36_121(L37_122, L19_104, L35_120["ifStatic.NetMask"])
        if L36_121 ~= _UPVALUE0_.SUCCESS then
          util.appendDebugOut(L37_122 .. L36_121)
          return _UPVALUE0_.BAD_PARAMETER
        end
      end
    end
  end
  if L17_102 ~= nil and L8_93 == "0" then
    for L34_119, L35_120 in L31_116(L32_117) do
      L36_121 = L35_120["vlan.vlanId"]
      if L36_121 == L17_102 then
        L36_121 = validationsLuaLib
        L36_121 = L36_121.ipAddressRangeGet
        L37_122 = L35_120["ifStatic.StaticIp"]
        L10_95, L36_121 = L35_120["ifStatic.NetMask"], L36_121(L37_122, L35_120["ifStatic.NetMask"])
        L10_95, L37_122 = L35_120["ifStatic.NetMask"], L36_121(L37_122, L35_120["ifStatic.NetMask"])
        L9_94 = L37_122
        L29_114 = L36_121
        L36_121 = _UPVALUE0_
        L36_121 = L36_121.SUCCESS
        if L29_114 == L36_121 then
          L36_121 = util
          L36_121 = L36_121.appendDebugOut
          L37_122 = "Failed to get ipAddressRange"
          L37_122 = L37_122 .. L29_114
          L36_121(L37_122)
          L36_121 = _UPVALUE0_
          L36_121 = L36_121.BAD_PARAMETER
          return L36_121
        end
      end
    end
  end
  if L18_103 ~= nil and L12_97 == "0" then
    for L34_119, L35_120 in L31_116(L32_117) do
      L36_121 = L35_120["vlan.vlanId"]
      if L36_121 == L18_103 then
        L36_121 = validationsLuaLib
        L36_121 = L36_121.ipAddressRangeGet
        L37_122 = L35_120["ifStatic.StaticIp"]
        L14_99, L36_121 = L35_120["ifStatic.NetMask"], L36_121(L37_122, L35_120["ifStatic.NetMask"])
        L14_99, L37_122 = L35_120["ifStatic.NetMask"], L36_121(L37_122, L35_120["ifStatic.NetMask"])
        L13_98 = L37_122
        L29_114 = L36_121
        L36_121 = _UPVALUE0_
        L36_121 = L36_121.SUCCESS
        if L29_114 == L36_121 then
          L36_121 = util
          L36_121 = L36_121.appendDebugOut
          L37_122 = "Failed to get ipAddressRange"
          L37_122 = L37_122 .. L29_114
          L36_121(L37_122)
          L36_121 = _UPVALUE0_
          L36_121 = L36_121.BAD_PARAMETER
          return L36_121
        end
      end
    end
  end
  if L15_100 == "SECURE" then
    if L16_101 == "SECURE" then
      L32_117()
      L34_119 = L28_113
      L35_120 = L6_91
      L36_121 = L7_92
      L37_122 = L8_93
      L3_88 = L33_118
      if L31_116 ~= L32_117 then
        L34_119 = L31_116
        L32_117(L33_118)
        L32_117()
        return L32_117, L33_118
      end
      L32_117()
      L32_117()
    elseif L16_101 == "INSECURE" then
      L32_117()
      L34_119 = L28_113
      L35_120 = L5_90
      L36_121 = L6_91
      L37_122 = L7_92
      L3_88 = L33_118
      if L31_116 ~= L32_117 then
        L34_119 = L31_116
        L32_117(L33_118)
        L32_117()
        return L32_117, L33_118
      end
      L32_117()
      L32_117()
    elseif L16_101 == "PUBLIC" then
      L32_117()
      L34_119 = L28_113
      L35_120 = L6_91
      L36_121 = L7_92
      L37_122 = L8_93
      L3_88 = L33_118
      if L31_116 ~= L32_117 then
        L34_119 = L31_116
        L32_117(L33_118)
        L32_117()
        return L32_117, L33_118
      end
      L32_117()
      L32_117()
    end
  elseif L15_100 == "INSECURE" then
    if L16_101 == "SECURE" then
      L32_117()
      L34_119 = L28_113
      L35_120 = L6_91
      L36_121 = L7_92
      L37_122 = L8_93
      L3_88 = L33_118
      if L31_116 ~= L32_117 then
        L34_119 = L31_116
        L32_117(L33_118)
        L32_117()
        return L32_117, L33_118
      end
      L32_117()
      L32_117()
    elseif L16_101 == "PUBLIC" then
      L32_117()
      L34_119 = L28_113
      L35_120 = L6_91
      L36_121 = L7_92
      L37_122 = L8_93
      L3_88 = L33_118
      if L31_116 ~= L32_117 then
        L34_119 = L31_116
        L32_117(L33_118)
        L32_117()
        return L32_117, L33_118
      end
      L32_117()
      L32_117()
    end
  elseif L15_100 == "PUBLIC" then
    if L16_101 == "SECURE" then
      L32_117()
      L34_119 = L28_113
      L35_120 = L6_91
      L36_121 = L7_92
      L37_122 = L8_93
      L3_88 = L33_118
      if L31_116 ~= L32_117 then
        L34_119 = L31_116
        L32_117(L33_118)
        L32_117()
        return L32_117, L33_118
      end
      L32_117()
      L32_117()
    elseif L16_101 == "INSECURE" then
      L32_117()
      L34_119 = L28_113
      L35_120 = L5_90
      L36_121 = L6_91
      L37_122 = L7_92
      L3_88 = L33_118
      if L31_116 ~= L32_117 then
        L34_119 = L31_116
        L32_117(L33_118)
        L32_117()
        return L32_117, L33_118
      end
      L32_117()
      L32_117()
    end
  end
  return L32_117, L33_118
end
function firewallRuleDelete(A0_123)
  local L1_124, L2_125
  L1_124 = ACCESS_LEVEL
  if L1_124 ~= 0 then
    L1_124 = util
    L1_124 = L1_124.appendDebugOut
    L2_125 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_124(L2_125)
    L1_124 = _UPVALUE0_
    L1_124 = L1_124.UNAUTHORIZED
    return L1_124
  end
  L1_124 = A0_123["firewallRules.cookie"]
  if L1_124 == nil then
    L2_125 = util
    L2_125 = L2_125.appendDebugOut
    L2_125("Delete : Invalid Cookie")
    L2_125 = _UPVALUE0_
    L2_125 = L2_125.BAD_PARAMETER
    return L2_125
  end
  L2_125 = nil
  _UPVALUE1_.start()
  L2_125, cookie = fw.core.firewallRules.Ipv4.delete(L1_124)
  if L2_125 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L2_125)
    _UPVALUE1_.abort()
    return L2_125, L1_124
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function firewallRuleDefaultsGet()
  local L0_126, L1_127, L3_128, L4_129, L5_130
  L0_126 = 1
  L1_127 = "PAP"
  L3_128 = _UPVALUE0_
  L3_128 = L3_128.SUCCESS
  L4_129 = 0
  L5_130 = L0_126
  return L3_128, L4_129, L5_130, L1_127
end
function firewallRuleCreate(A0_131)
  local L1_132, L2_133, L3_134, L4_135, L5_136, L6_137, L7_138, L8_139, L9_140, L10_141, L11_142, L12_143, L13_144, L14_145, L15_146, L16_147, L17_148, L18_149, L19_150, L20_151, L21_152, L22_153, L23_154, L24_155, L25_156, L26_157, L27_158, L28_159, L29_160, L30_161, L31_162, L32_163, L33_164, L34_165, L35_166
  L3_134 = ACCESS_LEVEL
  if L3_134 ~= 0 then
    L3_134 = util
    L3_134 = L3_134.appendDebugOut
    L4_135 = "Detected Unauthorized access for page DUMMY PAGE"
    L3_134(L4_135)
    L3_134 = _UPVALUE0_
    L3_134 = L3_134.UNAUTHORIZED
    return L3_134
  end
  L3_134 = routingModeGet
  L4_135 = L3_134()
  L2_133 = L4_135
  L1_132 = L3_134
  L3_134 = A0_131["firewallRules.serviceName"]
  L4_135 = A0_131["firewallRules.typeOfService"]
  L5_136 = _UPVALUE1_
  L6_137 = tonumber
  L7_138 = A0_131["firewallRules.action"]
  L6_137 = L6_137(L7_138)
  L5_136 = L5_136[L6_137]
  L6_137 = A0_131["firewallRules.scheduleName"]
  L7_138 = tostring
  L8_139 = tonumber
  L9_140 = A0_131["firewallRules.sourceAddressType"]
  L8_139 = L8_139(L9_140)
  L8_139 = L8_139 - 1
  L7_138 = L7_138(L8_139)
  L8_139 = A0_131["firewallRules.sourceAddressStart"]
  L9_140 = A0_131["firewallRules.sourceAddressEnd"]
  L10_141 = A0_131["firewallRules.logStatus"]
  L11_142 = nil
  L12_143 = A0_131["firewallRules.fromZoneType"]
  if L12_143 == "INSECURE" then
    L12_143 = ENABLE
    if L2_133 == L12_143 then
      L11_142 = nil
    end
  else
    L12_143 = tostring
    L13_144 = tonumber
    L14_145 = A0_131["firewallRules.destinationAddressType"]
    L13_144 = L13_144(L14_145)
    L13_144 = L13_144 - 1
    L12_143 = L12_143(L13_144)
    L11_142 = L12_143
  end
  L12_143 = A0_131["firewallRules.destinationAddressStart"]
  L13_144 = A0_131["firewallRules.destinationAddressEnd"]
  L14_145 = A0_131["firewallRules.fromZoneType"]
  L15_146 = A0_131["firewallRules.toZoneType"]
  L16_147 = A0_131["firewallRules.fromZoneVlanId"]
  L17_148 = A0_131["firewallRules.toZoneVlanId"]
  L18_149 = A0_131["firewallRules.dnatAddress"]
  L19_150 = A0_131["firewallRules.DNATPortEnable"]
  if L17_148 ~= nil then
    L20_151 = fw
    L20_151 = L20_151.core
    L20_151 = L20_151.firewallRules
    L20_151 = L20_151.Ipv4
    L20_151 = L20_151.vlanIDGet
    L21_152 = L17_148
    L21_152 = L20_151(L21_152)
    L17_148 = L21_152
    returnStatus = L20_151
  end
  L20_151 = nil
  if L3_134 ~= "ANY" then
    L21_152 = ENABLE
    if L19_150 == L21_152 then
      L20_151 = A0_131["firewallRules.DNATPort"]
    else
      L20_151 = DISABLE
    end
  else
    L20_151 = DISABLE
    L19_150 = DISABLE
  end
  L21_152, L22_153, L23_154 = nil, nil, nil
  L24_155 = A0_131["firewallRules.destinationPublicInterface"]
  if L24_155 ~= "1" then
    L24_155 = A0_131["firewallRules.destinationPublicInterface"]
    if L24_155 ~= "2" then
      L24_155 = A0_131["firewallRules.destinationPublicInterface"]
    end
  else
    if L24_155 == "3" then
      L24_155 = _UPVALUE2_
      L25_156 = tonumber
      L26_157 = A0_131["firewallRules.destinationPublicInterface"]
      L25_156 = L25_156(L26_157)
      L21_152 = L24_155[L25_156]
      L23_154 = L21_152
  end
  else
    L24_155 = A0_131["firewallRules.destinationPublicInterface"]
    if L24_155 ~= nil then
      L21_152 = OTHER
      L24_155 = util
      L24_155 = L24_155.split
      L25_156 = A0_131["firewallRules.destinationPublicInterface"]
      L26_157 = " - "
      L24_155 = L24_155(L25_156, L26_157)
      L22_153 = L24_155[2]
      L23_154 = L24_155[1]
    end
  end
  L24_155, L25_156, L26_157 = nil, nil, nil
  L27_158 = A0_131["firewallRules.sNATAddressType"]
  if L27_158 ~= nil then
    L27_158 = A0_131["firewallRules.sNATAddressType"]
    if L27_158 == "3" then
      A0_131["firewallRules.sNATAddressType"] = "1"
    end
    L27_158 = A0_131["firewallRules.sNATAddressType"]
    if L27_158 == "1" then
      L24_155 = "7"
    else
      L24_155 = "1"
    end
    if L24_155 == "1" then
      L25_156 = A0_131["firewallRules.sNATAddress"]
      L26_157 = nil
    else
      L27_158 = A0_131["firewallRules.sNATInterface"]
      if L27_158 ~= "1" then
        L27_158 = A0_131["firewallRules.sNATInterface"]
        if L27_158 ~= "2" then
          L27_158 = A0_131["firewallRules.sNATInterface"]
        end
      else
        if L27_158 == "3" then
          L27_158 = _UPVALUE2_
          L28_159 = tonumber
          L28_159 = L28_159(L29_160)
          L26_157 = L27_158[L28_159]
          L24_155 = "7"
      end
      else
        L27_158 = A0_131["firewallRules.sNATInterface"]
        if L27_158 ~= nil then
          L24_155 = "10"
          L27_158 = util
          L27_158 = L27_158.split
          L28_159 = A0_131["firewallRules.sNATInterface"]
          L27_158 = L27_158(L28_159, L29_160)
          L25_156 = L27_158[2]
          L26_157 = L27_158[1]
        end
      end
    end
  end
  if L3_134 == nil or L5_136 == nil or L7_138 == nil or L14_145 == nil or L15_146 == nil then
    L27_158 = util
    L27_158 = L27_158.appendDebugOut
    L28_159 = "GetNext : Invalid Cookie"
    L27_158(L28_159)
    L27_158 = _UPVALUE0_
    L27_158 = L27_158.BAD_PARAMETER
    return L27_158
  end
  if L14_145 == "SECURE_VLAN" and L15_146 == "SECURE_VLAN" and L16_147 == L17_148 then
    L27_158 = _UPVALUE0_
    L27_158 = L27_158.FROM_ZONE_TO_ZONE_ERROR
    return L27_158
  end
  if L14_145 == "INSECURE" and L5_136 ~= "DROP" then
    L27_158 = nil
    if L15_146 == "PUBLIC" then
      L27_158 = "DMZ"
    elseif L15_146 == "SECURE" then
      L27_158 = "LAN"
    elseif L15_146 == "SECURE_VLAN" then
      L27_158 = "LAN"
      L28_159 = tonumber
      L28_159 = L28_159(L29_160)
      if L28_159 ~= 1 then
        L28_159 = L27_158
        L27_158 = L28_159 .. L29_160
      end
    end
    if L27_158 ~= nil and L18_149 ~= nil then
      L28_159 = tonumber
      L28_159 = L28_159(L29_160)
      if L28_159 ~= 1 then
        L28_159 = tonumber
        L28_159 = L28_159(L29_160)
      elseif L28_159 == 6 then
        L28_159 = dNatAddressRangeCheck
        L28_159 = L28_159(L29_160, L30_161, L31_162)
        if L28_159 ~= L29_160 then
          return L28_159
        end
      end
    end
  end
  if L14_145 == "SECURE_VLAN" then
    L14_145 = "SECURE"
  end
  if L15_146 == "SECURE_VLAN" then
    L15_146 = "SECURE"
  end
  if L14_145 == "SECURE" or L15_146 == "SECURE" then
    if L16_147 == nil then
      L16_147 = "0"
    end
    if L17_148 == nil then
      L17_148 = "0"
    end
  end
  L27_158, L28_159 = nil, nil
  if L16_147 ~= nil or L17_148 ~= nil then
    L28_159 = L30_161
    L27_158 = L29_160
  end
  if L17_148 ~= nil and L18_149 ~= nil then
    for L32_163, L33_164 in L29_160(L30_161) do
      L34_165 = L33_164["vlan.vlanId"]
      if L34_165 == L17_148 then
        L34_165 = _UPVALUE4_
        L34_165 = L34_165.ipv4SingleMaskCheck
        L35_166 = L33_164["ifStatic.StaticIp"]
        L35_166 = L34_165(L35_166, L18_149, L33_164["ifStatic.NetMask"])
        if L34_165 ~= _UPVALUE0_.SUCCESS then
          util.appendDebugOut(L35_166 .. L34_165)
          return _UPVALUE0_.BAD_PARAMETER
        end
      end
    end
  end
  if L16_147 ~= nil and L7_138 == "0" then
    for L32_163, L33_164 in L29_160(L30_161) do
      L34_165 = L33_164["vlan.vlanId"]
      if L34_165 == L16_147 then
        L34_165 = validationsLuaLib
        L34_165 = L34_165.ipAddressRangeGet
        L35_166 = L33_164["ifStatic.StaticIp"]
        L9_140, L34_165 = L33_164["ifStatic.NetMask"], L34_165(L35_166, L33_164["ifStatic.NetMask"])
        L9_140, L35_166 = L33_164["ifStatic.NetMask"], L34_165(L35_166, L33_164["ifStatic.NetMask"])
        L8_139 = L35_166
        L27_158 = L34_165
        L34_165 = _UPVALUE0_
        L34_165 = L34_165.SUCCESS
        if L27_158 == L34_165 then
          L34_165 = util
          L34_165 = L34_165.appendDebugOut
          L35_166 = "Failed to get ipAddressRange"
          L35_166 = L35_166 .. L27_158
          L34_165(L35_166)
          L34_165 = _UPVALUE0_
          L34_165 = L34_165.BAD_PARAMETER
          return L34_165
        end
      end
    end
  end
  if L17_148 ~= nil and L11_142 == "0" then
    for L32_163, L33_164 in L29_160(L30_161) do
      L34_165 = L33_164["vlan.vlanId"]
      if L34_165 == L17_148 then
        L34_165 = validationsLuaLib
        L34_165 = L34_165.ipAddressRangeGet
        L35_166 = L33_164["ifStatic.StaticIp"]
        L13_144, L34_165 = L33_164["ifStatic.NetMask"], L34_165(L35_166, L33_164["ifStatic.NetMask"])
        L13_144, L35_166 = L33_164["ifStatic.NetMask"], L34_165(L35_166, L33_164["ifStatic.NetMask"])
        L12_143 = L35_166
        L27_158 = L34_165
        L34_165 = _UPVALUE0_
        L34_165 = L34_165.SUCCESS
        if L27_158 == L34_165 then
          L34_165 = util
          L34_165 = L34_165.appendDebugOut
          L35_166 = "Failed to get ipAddressRange"
          L35_166 = L35_166 .. L27_158
          L34_165(L35_166)
          L34_165 = _UPVALUE0_
          L34_165 = L34_165.BAD_PARAMETER
          return L34_165
        end
      end
    end
  end
  if L14_145 == "SECURE" then
    if L15_146 == "SECURE" then
      L31_162()
      L32_163 = L3_134
      L33_164 = L5_136
      L34_165 = L6_137
      L35_166 = L7_138
      L32_163 = L31_162(L32_163, L33_164, L34_165, L35_166, L8_139, L9_140, L10_141, L11_142, L12_143, L13_144, L14_145, L15_146, L16_147, L17_148)
      if L29_160 ~= L31_162 then
        L32_163 = "Error in configuring values in page DUMMY PAGE"
        L33_164 = L29_160
        L32_163 = L32_163 .. L33_164
        L31_162(L32_163)
        L31_162()
        L32_163 = 0
        return L31_162, L32_163
      end
      L31_162()
      L31_162()
    elseif L15_146 == "INSECURE" then
      L31_162()
      L32_163 = L3_134
      L33_164 = L4_135
      L34_165 = L5_136
      L35_166 = L6_137
      L32_163 = L31_162(L32_163, L33_164, L34_165, L35_166, L7_138, L8_139, L9_140, L10_141, L11_142, L12_143, L13_144, L24_155, L25_156, L26_157, L14_145, L15_146, L16_147)
      if L29_160 ~= L31_162 then
        L32_163 = "Error in configuring values in page DUMMY PAGE"
        L33_164 = L29_160
        L32_163 = L32_163 .. L33_164
        L31_162(L32_163)
        L31_162()
        L32_163 = 0
        return L31_162, L32_163
      end
      L31_162()
      L31_162()
    elseif L15_146 == "PUBLIC" then
      L31_162()
      L32_163 = L3_134
      L33_164 = L5_136
      L34_165 = L6_137
      L35_166 = L7_138
      L32_163 = L31_162(L32_163, L33_164, L34_165, L35_166, L8_139, L9_140, L10_141, L11_142, L12_143, L13_144, L14_145, L15_146, L16_147)
      if L29_160 ~= L31_162 then
        L32_163 = "Error in configuring values in page DUMMY PAGE"
        L33_164 = L29_160
        L32_163 = L32_163 .. L33_164
        L31_162(L32_163)
        L31_162()
        L32_163 = 0
        return L31_162, L32_163
      end
      L31_162()
      L31_162()
    end
  elseif L14_145 == "INSECURE" then
    if L15_146 == "SECURE" then
      L31_162()
      L32_163 = L3_134
      L33_164 = L5_136
      L34_165 = L6_137
      L35_166 = L7_138
      L32_163 = L31_162(L32_163, L33_164, L34_165, L35_166, L8_139, L9_140, L10_141, L11_142, L12_143, L13_144, L21_152, L22_153, L18_149, L14_145, L15_146, L17_148, L19_150, L20_151)
      if L29_160 ~= L31_162 then
        L32_163 = "Error in configuring values in page DUMMY PAGE"
        L33_164 = L29_160
        L32_163 = L32_163 .. L33_164
        L31_162(L32_163)
        L31_162()
        L32_163 = 0
        return L31_162, L32_163
      end
      L31_162()
      L31_162()
    elseif L15_146 == "PUBLIC" then
      L31_162()
      L32_163 = L3_134
      L33_164 = L5_136
      L34_165 = L6_137
      L35_166 = L7_138
      L32_163 = L31_162(L32_163, L33_164, L34_165, L35_166, L8_139, L9_140, L10_141, L11_142, L12_143, L13_144, L21_152, L22_153, L18_149, L14_145, L15_146, L19_150, L20_151)
      if L29_160 ~= L31_162 then
        L32_163 = "Error in configuring values in page DUMMY PAGE"
        L33_164 = L29_160
        L32_163 = L32_163 .. L33_164
        L31_162(L32_163)
        L31_162()
        L32_163 = 0
        return L31_162, L32_163
      end
      L31_162()
      L31_162()
    end
  elseif L14_145 == "PUBLIC" then
    if L15_146 == "SECURE" then
      L31_162()
      L32_163 = L3_134
      L33_164 = L5_136
      L34_165 = L6_137
      L35_166 = L7_138
      L32_163 = L31_162(L32_163, L33_164, L34_165, L35_166, L8_139, L9_140, L10_141, L11_142, L12_143, L13_144, L14_145, L15_146, L17_148)
      if L29_160 ~= L31_162 then
        L32_163 = "Error in configuring values in page DUMMY PAGE"
        L33_164 = L29_160
        L32_163 = L32_163 .. L33_164
        L31_162(L32_163)
        L31_162()
        L32_163 = 0
        return L31_162, L32_163
      end
      L31_162()
      L31_162()
    elseif L15_146 == "INSECURE" then
      L31_162()
      L32_163 = L3_134
      L33_164 = L4_135
      L34_165 = L5_136
      L35_166 = L6_137
      L32_163 = L31_162(L32_163, L33_164, L34_165, L35_166, L7_138, L8_139, L9_140, L10_141, L11_142, L12_143, L13_144, L24_155, L25_156, L26_157, L14_145, L15_146)
      if L29_160 ~= L31_162 then
        L32_163 = "Error in configuring values in page DUMMY PAGE"
        L33_164 = L29_160
        L32_163 = L32_163 .. L33_164
        L31_162(L32_163)
        L31_162()
        L32_163 = 0
        return L31_162, L32_163
      end
      L31_162()
      L31_162()
    end
  end
  L32_163 = L30_161
  return L31_162, L32_163
end
function firewallRulesMove(A0_167)
  local L1_168, L2_169, L3_170, L4_171
  L2_169 = A0_167["firewallRules.toMovePriority"]
  L3_170 = A0_167["firewallRules.cookie"]
  L4_171 = {}
  L4_171[DEFAULT_ROWID] = tostring(L3_170)
  _UPVALUE0_.start()
  L1_168 = moveRules(L4_171, L2_169, IPFLAG)
  if L1_168 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in configuring values in firewall page" .. L1_168)
    _UPVALUE0_.abort()
    return L1_168, 0
  end
  _UPVALUE0_.complete()
  _UPVALUE0_.save()
  return _UPVALUE1_.SUCCESS
end
function firewallRulesDefaultPolicyGet()
  local L0_172, L1_173, L2_174
  L0_172, L2_174 = fw.core.firewallRules.Ipv4.defaultPolicyGet()
  if L2_174 == "0" then
    L2_174 = "2"
  end
  if L0_172 ~= _UPVALUE0_.SUCCESS then
    return L0_172
  end
  return L0_172, L2_174
end
function firewallRulesDefaultPolicySet(A0_175)
  local L1_176, L2_177
  L1_176 = ACCESS_LEVEL
  if L1_176 ~= 0 then
    L1_176 = util
    L1_176 = L1_176.appendDebugOut
    L2_177 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_176(L2_177)
    L1_176 = _UPVALUE0_
    L1_176 = L1_176.UNAUTHORIZED
    return L1_176
  end
  L1_176 = tonumber
  L2_177 = A0_175["fwDefaultOutBoundPolicy.DefaultPolicyStatus"]
  L1_176 = L1_176(L2_177)
  if L1_176 == 2 then
    L1_176 = 0
  end
  L2_177 = nil
  _UPVALUE1_.start()
  L2_177, cookie = fw.core.firewallRules.Ipv4.defaultPolicySet(L1_176)
  if L2_177 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L2_177)
    _UPVALUE1_.abort()
    return L2_177, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function firewallRuleDeleteAll()
  local L0_178
  L0_178 = ACCESS_LEVEL
  if L0_178 ~= 0 then
    L0_178 = util
    L0_178 = L0_178.appendDebugOut
    L0_178("Detected Unauthorized access for page DUMMY PAGE")
    L0_178 = _UPVALUE0_
    L0_178 = L0_178.UNAUTHORIZED
    return L0_178
  end
  L0_178 = nil
  _UPVALUE1_.start()
  L0_178, cookie = fw.core.firewallRules.Ipv4.deleteAll()
  if L0_178 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L0_178)
    _UPVALUE1_.abort()
    return L0_178, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function firewallRuleDisable(A0_179)
  local L1_180
  L1_180 = ACCESS_LEVEL
  if L1_180 ~= 0 then
    L1_180 = util
    L1_180 = L1_180.appendDebugOut
    L1_180("Detected Unauthorized access for page DUMMY PAGE")
    L1_180 = _UPVALUE0_
    L1_180 = L1_180.UNAUTHORIZED
    return L1_180
  end
  L1_180 = A0_179["firewallRules.cookie"]
  _UPVALUE1_.start()
  returnCode, L1_180 = fw.core.firewallRules.Ipv4.ruleStatusDisable(L1_180)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function firewallRuleEnable(A0_181)
  local L1_182
  L1_182 = ACCESS_LEVEL
  if L1_182 ~= 0 then
    L1_182 = util
    L1_182 = L1_182.appendDebugOut
    L1_182("Detected Unauthorized access for page DUMMY PAGE")
    L1_182 = _UPVALUE0_
    L1_182 = L1_182.UNAUTHORIZED
    return L1_182
  end
  L1_182 = A0_181["firewallRules.cookie"]
  _UPVALUE1_.start()
  returnCode, L1_182 = fw.core.firewallRules.Ipv4.ruleStatusEnable(L1_182)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function firewallRuleDisableAll()
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page DUMMY PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  _UPVALUE1_.start()
  returnCode, cookie = fw.core.firewallRules.Ipv4.DisableAll()
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function firewallRuleEnableAll()
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page DUMMY PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  _UPVALUE1_.start()
  returnCode, cookie = fw.core.firewallRules.Ipv4.EnableAll()
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
