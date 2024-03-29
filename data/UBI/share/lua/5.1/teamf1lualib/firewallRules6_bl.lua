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
L0_0("teamf1lualib/fwIpv6firewallRules")
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
L0_0 = L0_0("com.teamf1.core.wan.ipaliasing")
Ipv6firewallRulesTable = "FirewallRules6"
attribute = {}
attribute.ruleType = "RuleType"
attribute.status = "Status"
attribute.serviceName = "ServiceName"
attribute.action = "Action"
attribute.scheduleName = "ScheduleName"
attribute.sourceAddressType = "SourceAddressType"
attribute.sourceAddressStart = "SourceAddressStart"
attribute.sourceAddressEnd = "SourceAddressEnd"
attribute.sourceAddressPrefixLength = "SourceAddressPrefixLength"
attribute.destinationAddressType = "DestinationAddressType"
attribute.destinationAddressStart = "DestinationAddressStart"
attribute.destinationAddressEnd = "DestinationAddressEnd"
attribute.destinationAddressPrefixLength = "DestinationAddressPrefixLength"
attribute.logLevel = "LogLevel"
attribute.ipv6HeaderType = "Ipv6HeaderType"
attribute.logPrefix = "LogPrefix"
attribute.fromZoneType = "FromZoneType"
attribute.toZoneType = "ToZoneType"
attribute.connectionState = "ConnectionState"
attribute.protocol = "Protocol"
attribute.destinationPortStart = "DestinationPortStart"
attribute.destinationPortEnd = "DestinationPortEnd"
attribute.priorityId = "PriorityId"
IPFLAG = "4"
ENABLE = "1"
DISABLE = "0"
DEFAULT_ROWID = "1"
function ipAliasGetAll()
  local L0_1, L1_2
  L0_1, L1_2 = _UPVALUE0_.aliasGetAll()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  for _FORV_5_, _FORV_6_ in pairs(L1_2) do
    _FORV_6_[attribute.ipAliasName] = _FORV_6_.LogicalIfName .. " - " .. _FORV_6_.IPAddress
  end
  return L0_1, L1_2
end
function firewallRuleGet(A0_3)
  local L1_4, L2_5
  L2_5 = {}
  if A0_3 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_4, L2_5 = fw.core.firewallRules6.Ipv6.rowGet(A0_3)
  if L1_4 ~= _UPVALUE0_.SUCCESS then
    return L1_4, L2_5
  end
  return L1_4, L2_5
end
function servicesGetAll()
  local L0_6, L1_7
  L0_6 = _UPVALUE0_
  L0_6 = L0_6.FAILURE
  L1_7 = {}
  L0_6, L1_7 = fw.core.firewallRules6.Ipv6.servicesInfoGetAll()
  if L0_6 ~= _UPVALUE0_.SUCCESS then
    return L0_6, L1_7
  end
  return L0_6, L1_7
end
function getAllScheduleInfo()
  local L0_8, L1_9
  L0_8, L1_9 = fw.core.firewallRules6.Ipv6.schedulesInfoGetAll()
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
  local L0_12, L1_13, L2_14
  L0_12, L1_13, L2_14 = _UPVALUE0_.routingModeGet()
  if L0_12 ~= _UPVALUE1_.SUCCESS then
    return L0_12
  end
  return L0_12, L2_14
end
function ipModeSectionGet()
  local L0_15, L1_16
  L0_15, L1_16 = fw.core.firewallRules6.Ipv6.ModeInfo()
  if L0_15 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  return L0_15, L1_16
end
function ipv6DefPolicyGet()
  local L0_17, L1_18
  L0_17, L1_18 = fw.core.firewallRules6.Ipv6.ipv6OutBoundPolicyGet()
  if L1_18["fwDefaultOutBoundPolicy.DefaultPolicyStatus"] == "0" then
    L1_18["fwDefaultOutBoundPolicy.DefaultPolicyStatus"] = "2"
  end
  L1_18["firewallRulesIPv6.DefaultPolicyStatus"] = L1_18["fwDefaultOutBoundPolicy.DefaultPolicyStatus"]
  if L0_17 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  return L0_17, L1_18
end
function ipv6DefPolicySet(A0_19)
  local L1_20, L2_21
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_19["firewallRulesIPv6.DefaultPolicyStatus"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  if A0_19["firewallRulesIPv6.DefaultPolicyStatus"] == "2" then
    A0_19["firewallRulesIPv6.DefaultPolicyStatus"] = "0"
  end
  A0_19["fwDefaultOutBoundPolicy.DefaultPolicyStatus"] = A0_19["firewallRulesIPv6.DefaultPolicyStatus"]
  L2_21 = A0_19["firewallRulesIPv6.DefaultPolicyStatus"]
  _UPVALUE1_.start()
  L1_20 = fw.core.firewallRules6.Ipv6.ipv6OutBoundPolicySet(L2_21)
  if L1_20 ~= _UPVALUE0_.SUCCESS then
    _UPVALUE1_.abort()
    return _UPVALUE0_.FAILURE
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_20
end
function firewallRuleGetAll()
  local L0_22, L1_23
  L0_22, L1_23 = fw.core.firewallRules6.Ipv6.GetAll()
  if L0_22 ~= _UPVALUE0_.SUCCESS then
    return L0_22
  end
  for _FORV_5_, _FORV_6_ in pairs(L1_23) do
    if _FORV_6_[Ipv6firewallRulesTable .. "." .. attribute.fromZoneType] == "INSECURE" then
      _FORV_6_[Ipv6firewallRulesTable .. "." .. attribute.fromZoneType] = "WAN"
    elseif _FORV_6_[Ipv6firewallRulesTable .. "." .. attribute.fromZoneType] == "PUBLIC" then
      _FORV_6_[Ipv6firewallRulesTable .. "." .. attribute.fromZoneType] = "DMZ"
    elseif _FORV_6_[Ipv6firewallRulesTable .. "." .. attribute.fromZoneType] == "SECURE" then
      _FORV_6_[Ipv6firewallRulesTable .. "." .. attribute.fromZoneType] = "LAN"
    end
    if _FORV_6_[Ipv6firewallRulesTable .. "." .. attribute.toZoneType] == "INSECURE" then
      _FORV_6_[Ipv6firewallRulesTable .. "." .. attribute.toZoneType] = "WAN"
    elseif _FORV_6_[Ipv6firewallRulesTable .. "." .. attribute.toZoneType] == "PUBLIC" then
      _FORV_6_[Ipv6firewallRulesTable .. "." .. attribute.toZoneType] = "DMZ"
    elseif _FORV_6_[Ipv6firewallRulesTable .. "." .. attribute.toZoneType] == "SECURE" then
      _FORV_6_[Ipv6firewallRulesTable .. "." .. attribute.toZoneType] = "LAN"
    end
    if _FORV_6_[Ipv6firewallRulesTable .. "." .. attribute.sourceAddressType] == "1" then
      _FORV_6_[Ipv6firewallRulesTable .. "." .. attribute.sourceAddressType] = _FORV_6_[Ipv6firewallRulesTable .. "." .. attribute.sourceAddressStart]
    elseif _FORV_6_[Ipv6firewallRulesTable .. "." .. attribute.sourceAddressType] == "2" then
      _FORV_6_[Ipv6firewallRulesTable .. "." .. attribute.sourceAddressType] = _FORV_6_[Ipv6firewallRulesTable .. "." .. attribute.sourceAddressStart] .. "-" .. _FORV_6_[Ipv6firewallRulesTable .. "." .. attribute.sourceAddressEnd]
    end
    if _FORV_6_[Ipv6firewallRulesTable .. "." .. attribute.destinationAddressType] == "1" then
      _FORV_6_[Ipv6firewallRulesTable .. "." .. attribute.destinationAddressType] = _FORV_6_[Ipv6firewallRulesTable .. "." .. attribute.destinationAddressStart]
    elseif _FORV_6_[Ipv6firewallRulesTable .. "." .. attribute.destinationAddressType] == "2" then
      _FORV_6_[Ipv6firewallRulesTable .. "." .. attribute.destinationAddressType] = _FORV_6_[Ipv6firewallRulesTable .. "." .. attribute.destinationAddressStart] .. "-" .. _FORV_6_[Ipv6firewallRulesTable .. "." .. attribute.destinationAddressEnd]
    end
  end
  return L0_22, L1_23
end
function firewallRuleGetNext(A0_24)
  local L1_25, L2_26, L3_27, L4_28, L5_29, L6_30, L7_31, L8_32, L9_33, L10_34, L11_35, L12_36, L13_37, L14_38, L15_39, L16_40, L17_41, L18_42, L19_43, L20_44, L21_45, L22_46
  L1_25 = A0_24["firewallRulesIpv6.cookie"]
  if L1_25 == nil then
    L2_26 = util
    L2_26 = L2_26.appendDebugOut
    L3_27 = "GetNext : Invalid Cookie"
    L2_26(L3_27)
    L2_26 = _UPVALUE0_
    L2_26 = L2_26.BAD_PARAMETER
    return L2_26
  end
  L2_26, L3_27, L4_28, L5_29, L6_30, L7_31, L8_32, L9_33, L10_34, L11_35, L12_36, L13_37, L14_38, L15_39, L16_40, L17_41, L18_42, L19_43, L20_44, L21_45 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L22_46 = fw
  L22_46 = L22_46.core
  L22_46 = L22_46.firewallRules6
  L22_46 = L22_46.Ipv6
  L22_46 = L22_46.GetNext
  L21_45, L3_27, L4_28, L5_29, L6_30, L7_31, L8_32, L9_33, L10_34, L11_35, L12_36, L13_37, L14_38, L15_39, L16_40, L17_41, L18_42, L19_43, L20_44, L22_46 = L1_25, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, L22_46(L1_25)
  L2_26 = L22_46
  L22_46 = _UPVALUE0_
  L22_46 = L22_46.SUCCESS
  if L2_26 ~= L22_46 then
    return L2_26
  end
  L22_46 = {}
  L22_46["firewallRules.serviceName"] = L3_27
  L22_46["firewallRules.ruleStatus"] = L4_28
  L22_46["firewallRules.typeOfService"] = L5_29
  L22_46["firewallRules.action"] = L6_30
  L22_46["firewallRules.scheduleName"] = L7_31
  L22_46["firewallRules.sourceAddressType"] = L8_32
  L22_46["firewallRules.sourceAddressStart"] = L9_33
  L22_46["firewallRules.sourceAddressEnd"] = L10_34
  L22_46["firewallRules.logStatus"] = L11_35
  L22_46["firewallRules.destinationAddressType"] = L12_36
  L22_46["firewallRules.destinationAddressStart"] = L13_37
  L22_46["firewallRules.destinationAddressEnd"] = L14_38
  L22_46["firewallRules.sNATAddressType"] = sNATAddressType
  L22_46["firewallRules.sNATInterface"] = sNATInterface
  L22_46["firewallRules.destinationPublicInterface"] = L17_41
  L22_46["firewallRules.dnatAddress"] = L18_42
  L22_46["firewallRules.fromZoneType"] = L19_43
  L22_46["firewallRules.toZoneType"] = L20_44
  return L2_26, L21_45, L22_46
end
function firewallRuleSet(A0_47)
  local L1_48, L2_49, L3_50, L4_51, L5_52, L6_53, L7_54, L8_55, L9_56, L10_57, L11_58, L12_59, L13_60, L14_61, L15_62
  L1_48 = ACCESS_LEVEL
  if L1_48 ~= 0 then
    L1_48 = util
    L1_48 = L1_48.appendDebugOut
    L2_49 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_48(L2_49)
    L1_48 = _UPVALUE0_
    L1_48 = L1_48.UNAUTHORIZED
    return L1_48
  end
  L1_48 = A0_47["FirewallRules6.cookie"]
  L2_49 = _UPVALUE0_
  L2_49 = L2_49.NIL
  if L1_48 == L2_49 then
    L2_49 = _UPVALUE0_
    L2_49 = L2_49.BAD_PARAMETER
    return L2_49
  end
  L2_49 = A0_47["FirewallRules6.FromZoneType"]
  L3_50 = _UPVALUE0_
  L3_50 = L3_50.NIL
  if L2_49 == L3_50 then
    L3_50 = _UPVALUE0_
    L3_50 = L3_50.BAD_PARAMETER
    return L3_50
  end
  L3_50 = A0_47["FirewallRules6.ToZoneType"]
  L4_51 = _UPVALUE0_
  L4_51 = L4_51.NIL
  if L3_50 == L4_51 then
    L4_51 = _UPVALUE0_
    L4_51 = L4_51.BAD_PARAMETER
    return L4_51
  end
  L4_51 = A0_47["FirewallRules6.ServiceName"]
  L5_52 = _UPVALUE0_
  L5_52 = L5_52.NIL
  if L4_51 == L5_52 then
    L5_52 = _UPVALUE0_
    L5_52 = L5_52.BAD_PARAMETER
    return L5_52
  end
  L5_52 = A0_47["FirewallRules6.Action"]
  L6_53 = _UPVALUE0_
  L6_53 = L6_53.NIL
  if L5_52 == L6_53 then
    L6_53 = _UPVALUE0_
    L6_53 = L6_53.BAD_PARAMETER
    return L6_53
  end
  L6_53 = A0_47["FirewallRules6.ScheduleName"]
  if L5_52 == "DROP_BY_SCHED_MATCH" or L5_52 == "ACCEPT_BY_SCHED_MATCH" then
    L7_54 = _UPVALUE0_
    L7_54 = L7_54.NIL
    if L6_53 == L7_54 then
      L7_54 = _UPVALUE0_
      L7_54 = L7_54.BAD_PARAMETER
      return L7_54
    end
  end
  L7_54 = A0_47["FirewallRules6.SourceAddressType"]
  L8_55 = _UPVALUE0_
  L8_55 = L8_55.NIL
  if L7_54 == L8_55 then
    L8_55 = _UPVALUE0_
    L8_55 = L8_55.BAD_PARAMETER
    return L8_55
  end
  L8_55 = A0_47["FirewallRules6.SourceAddressStart"]
  L9_56 = A0_47["FirewallRules6.SourceAddressEnd"]
  L10_57 = ""
  if L7_54 == "1" then
    L11_58 = _UPVALUE0_
    L11_58 = L11_58.NIL
    if L8_55 == L11_58 then
      L11_58 = _UPVALUE0_
      L11_58 = L11_58.BAD_PARAMETER
      return L11_58
    end
  end
  if L7_54 == "2" then
    L11_58 = _UPVALUE0_
    L11_58 = L11_58.NIL
    if L8_55 == L11_58 then
      L11_58 = _UPVALUE0_
      L11_58 = L11_58.BAD_PARAMETER
      return L11_58
    end
    L11_58 = _UPVALUE0_
    L11_58 = L11_58.NIL
    if L9_56 == L11_58 then
      L11_58 = _UPVALUE0_
      L11_58 = L11_58.BAD_PARAMETER
      return L11_58
    end
  end
  L11_58 = A0_47["FirewallRules6.DestinationAddressType"]
  L12_59 = _UPVALUE0_
  L12_59 = L12_59.NIL
  if L11_58 == L12_59 then
    L12_59 = _UPVALUE0_
    L12_59 = L12_59.BAD_PARAMETER
    return L12_59
  end
  L12_59 = A0_47["FirewallRules6.DestinationAddressStart"]
  L13_60 = A0_47["FirewallRules6.DestinationAddressEnd"]
  L14_61 = ""
  if L11_58 == "1" then
    L15_62 = _UPVALUE0_
    L15_62 = L15_62.NIL
    if L12_59 == L15_62 then
      L15_62 = _UPVALUE0_
      L15_62 = L15_62.BAD_PARAMETER
      return L15_62
    end
  end
  if L11_58 == "2" then
    L15_62 = _UPVALUE0_
    L15_62 = L15_62.NIL
    if L12_59 == L15_62 then
      L15_62 = _UPVALUE0_
      L15_62 = L15_62.BAD_PARAMETER
      return L15_62
    end
    L15_62 = _UPVALUE0_
    L15_62 = L15_62.NIL
    if L13_60 == L15_62 then
      L15_62 = _UPVALUE0_
      L15_62 = L15_62.BAD_PARAMETER
      return L15_62
    end
  end
  L15_62 = A0_47["FirewallRules6.LogLevel"]
  if L15_62 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  returnCode = fw.core.firewallRules6.Ipv6.Edit(L2_49, L3_50, L4_51, L5_52, L6_53, L7_54, L8_55, L9_56, L10_57, L11_58, L12_59, L13_60, L14_61, L15_62, L1_48)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. returnCode)
    _UPVALUE1_.abort()
    return _UPVALUE0_.FAILURE
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function firewallRuleCreate(A0_63)
  local L1_64, L2_65, L3_66, L4_67, L5_68, L6_69, L7_70, L8_71, L9_72, L10_73, L11_74, L12_75, L13_76, L14_77
  L1_64 = ACCESS_LEVEL
  if L1_64 ~= 0 then
    L1_64 = util
    L1_64 = L1_64.appendDebugOut
    L2_65 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_64(L2_65)
    L1_64 = _UPVALUE0_
    L1_64 = L1_64.UNAUTHORIZED
    return L1_64
  end
  L1_64 = A0_63["FirewallRules6.FromZoneType"]
  L2_65 = _UPVALUE0_
  L2_65 = L2_65.NIL
  if L1_64 == L2_65 then
    L2_65 = _UPVALUE0_
    L2_65 = L2_65.BAD_PARAMETER
    return L2_65
  end
  L2_65 = A0_63["FirewallRules6.ToZoneType"]
  L3_66 = _UPVALUE0_
  L3_66 = L3_66.NIL
  if L2_65 == L3_66 then
    L3_66 = _UPVALUE0_
    L3_66 = L3_66.BAD_PARAMETER
    return L3_66
  end
  L3_66 = A0_63["FirewallRules6.ServiceName"]
  L4_67 = _UPVALUE0_
  L4_67 = L4_67.NIL
  if L3_66 == L4_67 then
    L4_67 = _UPVALUE0_
    L4_67 = L4_67.BAD_PARAMETER
    return L4_67
  end
  L4_67 = A0_63["FirewallRules6.Action"]
  L5_68 = _UPVALUE0_
  L5_68 = L5_68.NIL
  if L4_67 == L5_68 then
    L5_68 = _UPVALUE0_
    L5_68 = L5_68.BAD_PARAMETER
    return L5_68
  end
  L5_68 = A0_63["FirewallRules6.ScheduleName"]
  if L4_67 == "DROP_BY_SCHED_MATCH" or L4_67 == "ACCEPT_BY_SCHED_MATCH" then
    L6_69 = _UPVALUE0_
    L6_69 = L6_69.NIL
    if L5_68 == L6_69 then
      L6_69 = _UPVALUE0_
      L6_69 = L6_69.BAD_PARAMETER
      return L6_69
    end
  end
  L6_69 = A0_63["FirewallRules6.SourceAddressType"]
  L7_70 = _UPVALUE0_
  L7_70 = L7_70.NIL
  if L6_69 == L7_70 then
    L7_70 = _UPVALUE0_
    L7_70 = L7_70.BAD_PARAMETER
    return L7_70
  end
  L7_70 = A0_63["FirewallRules6.SourceAddressStart"]
  L8_71 = A0_63["FirewallRules6.SourceAddressEnd"]
  L9_72 = ""
  if L6_69 == "1" then
    L10_73 = _UPVALUE0_
    L10_73 = L10_73.NIL
    if L7_70 == L10_73 then
      L10_73 = _UPVALUE0_
      L10_73 = L10_73.BAD_PARAMETER
      return L10_73
    end
  end
  if L6_69 == "2" then
    L10_73 = _UPVALUE0_
    L10_73 = L10_73.NIL
    if L7_70 == L10_73 then
      L10_73 = _UPVALUE0_
      L10_73 = L10_73.BAD_PARAMETER
      return L10_73
    end
    L10_73 = _UPVALUE0_
    L10_73 = L10_73.NIL
    if L8_71 == L10_73 then
      L10_73 = _UPVALUE0_
      L10_73 = L10_73.BAD_PARAMETER
      return L10_73
    end
  end
  L10_73 = A0_63["FirewallRules6.DestinationAddressType"]
  L11_74 = _UPVALUE0_
  L11_74 = L11_74.NIL
  if L10_73 == L11_74 then
    L11_74 = _UPVALUE0_
    L11_74 = L11_74.BAD_PARAMETER
    return L11_74
  end
  L11_74 = A0_63["FirewallRules6.DestinationAddressStart"]
  L12_75 = A0_63["FirewallRules6.DestinationAddressEnd"]
  L13_76 = ""
  if L10_73 == "1" then
    L14_77 = _UPVALUE0_
    L14_77 = L14_77.NIL
    if L11_74 == L14_77 then
      L14_77 = _UPVALUE0_
      L14_77 = L14_77.BAD_PARAMETER
      return L14_77
    end
  end
  if L10_73 == "2" then
    L14_77 = _UPVALUE0_
    L14_77 = L14_77.NIL
    if L11_74 == L14_77 then
      L14_77 = _UPVALUE0_
      L14_77 = L14_77.BAD_PARAMETER
      return L14_77
    end
    L14_77 = _UPVALUE0_
    L14_77 = L14_77.NIL
    if L12_75 == L14_77 then
      L14_77 = _UPVALUE0_
      L14_77 = L14_77.BAD_PARAMETER
      return L14_77
    end
  end
  L14_77 = A0_63["FirewallRules6.LogLevel"]
  if L14_77 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  returnCode = fw.core.firewallRules6.Ipv6.Add(L1_64, L2_65, L3_66, L4_67, L5_68, L6_69, L7_70, L8_71, L9_72, L10_73, L11_74, L12_75, L13_76, L14_77)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. returnCode)
    _UPVALUE1_.abort()
    return _UPVALUE0_.FAILURE
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function firewallRulesMove(A0_78)
  local L1_79, L2_80, L3_81, L4_82
  L2_80 = A0_78["firewallRulesIpv6.toMovePriority"]
  L3_81 = A0_78["firewallRulesIpv6.cookie"]
  L4_82 = {}
  L4_82[DEFAULT_ROWID] = tostring(L3_81)
  _UPVALUE0_.start()
  L1_79 = moveRules(L4_82, L2_80, ipmode.ipv6)
  if L1_79 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in configuring values in firewall page" .. L1_79)
    _UPVALUE0_.abort()
    return _UPVALUE1_.FAILURE
  end
  _UPVALUE0_.complete()
  _UPVALUE0_.save()
  return _UPVALUE1_.SUCCESS
end
function firewallRuleDeleteAll()
  local L0_83
  L0_83 = ACCESS_LEVEL
  if L0_83 ~= 0 then
    L0_83 = util
    L0_83 = L0_83.appendDebugOut
    L0_83("Detected Unauthorized access for page DUMMY PAGE")
    L0_83 = _UPVALUE0_
    L0_83 = L0_83.UNAUTHORIZED
    return L0_83
  end
  L0_83 = nil
  _UPVALUE1_.start()
  L0_83, cookie = fw.core.firewallRules6.Ipv6.deleteAll()
  if L0_83 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L0_83)
    _UPVALUE1_.abort()
    return L0_83, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function firewallRuleDelete(A0_84)
  local L1_85, L2_86
  L1_85 = ACCESS_LEVEL
  if L1_85 ~= 0 then
    L1_85 = util
    L1_85 = L1_85.appendDebugOut
    L2_86 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_85(L2_86)
    L1_85 = _UPVALUE0_
    L1_85 = L1_85.UNAUTHORIZED
    return L1_85
  end
  L1_85 = A0_84["firewallRulesIpv6.checkbox"]
  if L1_85 == nil then
    L2_86 = util
    L2_86 = L2_86.appendDebugOut
    L2_86("Delete : Invalid Cookie")
    L2_86 = _UPVALUE0_
    L2_86 = L2_86.BAD_PARAMETER
    return L2_86
  end
  L2_86 = nil
  _UPVALUE1_.start()
  L2_86, cookie = fw.core.firewallRules6.Ipv6.delete(L1_85)
  if L2_86 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L2_86)
    _UPVALUE1_.abort()
    return L2_86, L1_85
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function firewallRuleDisable(A0_87)
  local L1_88
  L1_88 = ACCESS_LEVEL
  if L1_88 ~= 0 then
    L1_88 = util
    L1_88 = L1_88.appendDebugOut
    L1_88("Detected Unauthorized access for page DUMMY PAGE")
    L1_88 = _UPVALUE0_
    L1_88 = L1_88.UNAUTHORIZED
    return L1_88
  end
  L1_88 = A0_87["firewallRulesIpv6.checkbox"]
  _UPVALUE1_.start()
  returnCode, L1_88 = fw.core.firewallRules6.Ipv6.ruleStatusDisable(L1_88)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function firewallRuleEnable(A0_89)
  local L1_90
  L1_90 = ACCESS_LEVEL
  if L1_90 ~= 0 then
    L1_90 = util
    L1_90 = L1_90.appendDebugOut
    L1_90("Detected Unauthorized access for page DUMMY PAGE")
    L1_90 = _UPVALUE0_
    L1_90 = L1_90.UNAUTHORIZED
    return L1_90
  end
  L1_90 = A0_89["firewallRulesIpv6.checkbox"]
  _UPVALUE1_.start()
  returnCode, L1_90 = fw.core.firewallRules6.Ipv6.ruleStatusEnable(L1_90)
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
  returnCode, cookie = fw.core.firewallRules6.Ipv6.DisableAll()
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
  returnCode, cookie = fw.core.firewallRules6.Ipv6.EnableAll()
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
