local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/fwValidations")
L0_0 = require
L0_0("teamf1lualib/fwPriorityMap")
L0_0 = "1"
fw.core.firewallRules = {}
fw.core.firewallRules.Ipv4 = {}
fw.firewallRules = {}
fw.firewallRules.Ipv4 = {}
fw.firewallRules.Ipv4.SecureToInSecure = {}
fw.firewallRules.Ipv4.InSecureToSecure = {}
fw.firewallRules.Ipv4.PublicToInSecure = {}
fw.firewallRules.Ipv4.InSecureToPublic = {}
fw.firewallRules.Ipv4.SecureToSecure = {}
fw.firewallRules.Ipv4.SecureToPublic = {}
fw.firewallRules.Ipv4.PublicToSecure = {}
ConfigPortTable = "ConfigPort"
NAT_TABLE = "NatTable"
Ipv4firewallRulesTable = "FirewallRules"
Ipv4DefaultfirewallRulesTable = "fwDefaultOutBoundPolicy"
VlanTable = "vlan"
ifStaticTable = "ifStatic"
;({}).ipModeField = "Ipmode"
;({}).defaultStatusField = "DefaultPolicyStatus"
;({}).ruleType = "RuleType"
;({}).status = "Status"
;({}).serviceName = "ServiceName"
;({}).typeOfService = "TypeOfService"
;({}).action = "Action"
;({}).scheduleName = "ScheduleName"
;({}).sourceAddressType = "SourceAddressType"
;({}).sourceAddressStart = "SourceAddressStart"
;({}).sourceAddressEnd = "SourceAddressEnd"
;({}).logStatus = "LogLevel"
;({}).destinationAddressType = "DestinationAddressType"
;({}).destinationAddressStart = "DestinationAddressStart"
;({}).destinationAddressEnd = "DestinationAddressEnd"
;({}).snatAddressType = "SNATAddressType"
;({}).snatAddress = "SNATAddress"
;({}).snatInterface = "SNATInterface"
;({}).destinationPublicInterface = "DestinationPublicInterface"
;({}).destinationPublicAddress = "DestinationPublicAddress"
;({}).dnatAddress = "DNATAddress"
;({}).dnatPortEnable = "DNATPortEnable"
;({}).dnatPort = "DNATPort"
;({}).fromZoneType = "FromZoneType"
;({}).toZoneType = "ToZoneType"
;({}).priorityId = "PriorityId"
;({}).fromZoneVlanId = "FromZoneVlanId"
;({}).toZoneVlanId = "ToZoneVlanId"
;({}).fromZoneVlanName = "FromZoneVlanName"
;({}).toZoneVlanName = "ToZoneVlanName"
;({}).LogicalIfName = "LogicalIfName"
;({}).Enable = "Enable"
;({}).vlanId = "vlanId"
;({}).vlanName = "vlanName"
if UNIT_NAME == "DSR-150" or UNIT_NAME == "DSR-150N" then
elseif UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-250N" then
elseif UNIT_NAME == "DSR-500AC" or UNIT_NAME == "DSR-500" or UNIT_NAME == "DSR-500N" then
elseif UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-1000" or UNIT_NAME == "DSR-1000N" then
end
function fw.core.firewallRules.Ipv4.interfaceInfoGet(A0_1)
  local L1_2, L2_3, L3_4
  L2_3 = {}
  L3_4 = nil
  L3_4 = "AddressFamily='2' and LogicalIfName='" .. A0_1 .. "'"
  L2_3 = db.getRowWhere(ifStaticTable, L3_4)
  if L2_3 == nil then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L2_3["ifStatic.StaticIp"], L2_3["ifStatic.NetMask"]
end
function fw.core.firewallRules.Ipv4.vlanNameGet(A0_5)
  local L1_6, L2_7
  L2_7 = db.getAttribute(VlanTable, _UPVALUE0_.vlanId, A0_5, _UPVALUE0_.vlanName)
  if L2_7 == _UPVALUE1_ then
    return returnCodes.FAILURE, A0_5
  end
  return returnCodes.SUCCESS, L2_7
end
function fw.core.firewallRules.Ipv4.vlanIDGet(A0_8)
  local L1_9, L2_10
  L2_10 = db.getAttribute(VlanTable, _UPVALUE0_.vlanName, A0_8, _UPVALUE0_.vlanId)
  if L2_10 == _UPVALUE1_ then
    return returnCodes.FAILURE, A0_8
  end
  return returnCodes.SUCCESS, L2_10
end
function fw.core.firewallRules.Ipv4.defaultPolicyGet()
  local L0_11, L1_12
  L1_12 = db.getAttribute(Ipv4DefaultfirewallRulesTable, _UPVALUE0_.ipModeField, "1", _UPVALUE0_.defaultStatusField, action)
  if L1_12 == _UPVALUE1_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L1_12
end
function fw.core.firewallRules.Ipv4.defaultPolicyNext(A0_13)
  local L1_14
end
function fw.core.firewallRules.Ipv4.defaultPolicySet(A0_15)
  local L1_16, L2_17, L3_18
  if A0_15 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L3_18 = db.setAttribute(Ipv4DefaultfirewallRulesTable, _UPVALUE1_.ipModeField, "1", _UPVALUE1_.defaultStatusField, A0_15)
  if not L3_18 then
    return returnCodes.FAILURE, cookie
  end
  return returnCodes.SUCCESS, cookie
end
function fw.core.firewallRules.Ipv4.ruleTypeGet()
  local L0_19, L1_20, L2_21
  L1_20, L0_19 = getFirstCookie(Ipv4firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_20 then
    return L1_20
  end
  L2_21 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE0_, L0_19, _UPVALUE1_.ruleType)
  if L2_21 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_19, L2_21
end
function fw.core.firewallRules.Ipv4.ruleTypeGetNext(A0_22)
  local L1_23, L2_24, L3_25
  if A0_22 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_23, L3_25 = getNextCookie(Ipv4firewallRulesTable, _UPVALUE1_, A0_22)
  if returnCodes.SUCCESS ~= L1_23 then
    return L1_23
  end
  L2_24 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, L3_25, _UPVALUE2_.ruleType)
  if L2_24 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_25, L2_24
end
function fw.core.firewallRules.Ipv4.ruleTypeSet(A0_26, A1_27)
  local L2_28, L3_29, L4_30
  if A0_26 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_28 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_26)
  if not L2_28 then
    return returnCodes.COOKIEFAIL
  end
  if A1_27 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, A0_26
  end
  L4_30 = db.setAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_26, _UPVALUE2_.ruleType, A1_27)
  if not L4_30 then
    return returnCodes.FAILURE, A0_26
  end
  return returnCodes.SUCCESS, A0_26
end
function fw.core.firewallRules.Ipv4.ruleStatusGet()
  local L0_31, L1_32, L2_33
  L1_32, L0_31 = getFirstCookie(Ipv4firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_32 then
    return L1_32
  end
  L2_33 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE0_, L0_31, _UPVALUE1_.status)
  if L2_33 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_31, L2_33
end
function fw.core.firewallRules.Ipv4.ruleTypeGetNext(A0_34)
  local L1_35, L2_36, L3_37
  if A0_34 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_35, L3_37 = getNextCookie(Ipv4firewallRulesTable, _UPVALUE1_, A0_34)
  if returnCodes.SUCCESS ~= L1_35 then
    return L1_35
  end
  L2_36 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, L3_37, _UPVALUE2_.status)
  if L2_36 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_37, L2_36
end
function fw.core.firewallRules.Ipv4.ruleStatusEnable(A0_38)
  local L1_39, L2_40, L3_41
  if A0_38 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_39 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_38)
  if not L1_39 then
    return returnCodes.COOKIEFAIL
  end
  L3_41 = db.setAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_38, _UPVALUE2_.status, _UPVALUE3_)
  if not L3_41 then
    return returnCodes.FAILURE, A0_38
  end
  return returnCodes.SUCCESS, A0_38
end
function fw.core.firewallRules.Ipv4.ruleStatusDisable(A0_42)
  local L1_43, L2_44, L3_45
  if A0_42 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_43 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_42)
  if not L1_43 then
    return returnCodes.COOKIEFAIL
  end
  L3_45 = db.setAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_42, _UPVALUE2_.status, _UPVALUE3_)
  if not L3_45 then
    return returnCodes.FAILURE, A0_42
  end
  return returnCodes.SUCCESS, A0_42
end
function fw.core.firewallRules.Ipv4.serviceNameGet()
  local L0_46, L1_47, L2_48
  L1_47, L0_46 = getFirstCookie(Ipv4firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_47 then
    return L1_47
  end
  L2_48 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE0_, L0_46, _UPVALUE1_.serviceName)
  if L2_48 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_46, L2_48
end
function fw.core.firewallRules.Ipv4.serviceNameGetNext(A0_49)
  local L1_50, L2_51, L3_52
  if A0_49 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_50, L3_52 = getNextCookie(Ipv4firewallRulesTable, _UPVALUE1_, A0_49)
  if returnCodes.SUCCESS ~= L1_50 then
    return L1_50
  end
  L2_51 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, L3_52, _UPVALUE2_.serviceName)
  if L2_51 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_52, L2_51
end
function fw.core.firewallRules.Ipv4.serviceNameSet(A0_53, A1_54)
  local L2_55, L3_56, L4_57
  if A0_53 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_55 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_53)
  if not L2_55 then
    return returnCodes.COOKIEFAIL
  end
  if A1_54 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_55 = db.existsRow("Services", "ServiceName", A1_54)
  if not L2_55 then
    return returnCodes.INVALID_ARGUMENT
  end
  L4_57 = db.setAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_53, _UPVALUE2_.serviceName, A1_54)
  if not L4_57 then
    return returnCodes.FAILURE, A0_53
  end
  return returnCodes.SUCCESS, A0_53
end
function fw.core.firewallRules.Ipv4.typeOfServiceGet()
  local L0_58, L1_59, L2_60
  L1_59, L0_58 = getFirstCookie(Ipv4firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_59 then
    return L1_59
  end
  L2_60 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE0_, L0_58, _UPVALUE1_.typeOfService)
  if L2_60 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_58, L2_60
end
function fw.core.firewallRules.Ipv4.ruleTypeGetNext(A0_61)
  local L1_62, L2_63, L3_64
  if A0_61 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_62, L3_64 = getNextCookie(Ipv4firewallRulesTable, _UPVALUE1_, A0_61)
  if returnCodes.SUCCESS ~= L1_62 then
    return L1_62
  end
  L2_63 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, L3_64, _UPVALUE2_.typeOfService)
  if L2_63 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_64, L2_63
end
function fw.core.firewallRules.Ipv4.typeOfServiceSet(A0_65, A1_66)
  local L2_67, L3_68, L4_69, L5_70
  if A0_65 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_67 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_65)
  if not L2_67 then
    return returnCodes.COOKIEFAIL
  end
  L5_70 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_65, _UPVALUE2_.ruleType)
  if L5_70 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  if L5_70 == "SECURE_INSECURE" or L5_70 == "PUBLIC_INSECURE" then
    L2_67 = fw_qosPriorityValidation(A1_66)
    if not L2_67 then
      return returnCodes.INVALID_ARGUMENT
    end
  end
  L4_69 = db.setAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_65, _UPVALUE2_.typeOfService, A1_66)
  if not L4_69 then
    return returnCodes.FAILURE, A0_65
  end
  return returnCodes.SUCCESS, A0_65
end
function fw.core.firewallRules.Ipv4.actionGet()
  local L0_71, L1_72, L2_73
  L1_72, L0_71 = getFirstCookie(Ipv4firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_72 then
    return L1_72
  end
  L2_73 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE0_, L0_71, _UPVALUE1_.action)
  if L2_73 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_71, L2_73
end
function fw.core.firewallRules.Ipv4.actionGetNext(A0_74)
  local L1_75, L2_76, L3_77
  if A0_74 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_75, L3_77 = getNextCookie(Ipv4firewallRulesTable, _UPVALUE1_, A0_74)
  if returnCodes.SUCCESS ~= L1_75 then
    return L1_75
  end
  L2_76 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, L3_77, _UPVALUE2_.action)
  if L2_76 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_77, L2_76
end
function fw.core.firewallRules.Ipv4.actionSet(A0_78, A1_79)
  local L2_80, L3_81, L4_82
  if A0_78 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_80 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_78)
  if not L2_80 then
    return returnCodes.COOKIEFAIL
  end
  L2_80 = fw_actionValidation(A1_79)
  if not L2_80 then
    return returnCodes.INVALID_ARGUMENT
  end
  L4_82 = db.setAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_78, _UPVALUE2_.action, A1_79)
  if not L4_82 then
    return returnCodes.FAILURE, A0_78
  end
  return returnCodes.SUCCESS, A0_78
end
function fw.core.firewallRules.Ipv4.scheduleNameGet()
  local L0_83, L1_84, L2_85
  L1_84, L0_83 = getFirstCookie(Ipv4firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_84 then
    return L1_84
  end
  L2_85 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE0_, L0_83, _UPVALUE1_.scheduleName)
  if L2_85 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_83, L2_85
end
function fw.core.firewallRules.Ipv4.ruleTypeGetNext(A0_86)
  local L1_87, L2_88, L3_89
  if A0_86 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_87, L3_89 = getNextCookie(Ipv4firewallRulesTable, _UPVALUE1_, A0_86)
  if returnCodes.SUCCESS ~= L1_87 then
    return L1_87
  end
  L2_88 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, L3_89, _UPVALUE2_.scheduleName)
  if L2_88 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_89, L2_88
end
function fw.core.firewallRules.Ipv4.scheduleNameSet(A0_90, A1_91)
  local L2_92, L3_93, L4_94, L5_95
  if A0_90 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_92 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_90)
  if not L2_92 then
    return returnCodes.COOKIEFAIL
  end
  L5_95 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_90, _UPVALUE2_.action)
  if L5_95 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  if L5_95 == "DROP_BY_SCHED_MATCH" or L5_95 == "ACCEPT_BY_SCHED_MATCH" then
    if A1_91 == _UPVALUE0_ then
      return returnCodes.INVALID_ARGUMENT
    end
    L2_92 = db.existsRow("Schedule", "ScheduleName", A1_91)
    if not L2_92 then
      return returnCodes.COOKIEFAIL
    end
  end
  L4_94 = db.setAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_90, _UPVALUE2_.scheduleName, A1_91)
  if not L4_94 then
    return returnCodes.FAILURE, A0_90
  end
  return returnCodes.SUCCESS, A0_90
end
function fw.core.firewallRules.Ipv4.sourceAddressTypeGet()
  local L0_96, L1_97, L2_98
  L1_97, L0_96 = getFirstCookie(Ipv4firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_97 then
    return L1_97
  end
  L2_98 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE0_, L0_96, _UPVALUE1_.sourceAddressType)
  if L2_98 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_96, L2_98
end
function fw.core.firewallRules.Ipv4.sourceAddressTypeGetNext(A0_99)
  local L1_100, L2_101, L3_102
  if A0_99 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_100, L3_102 = getNextCookie(Ipv4firewallRulesTable, _UPVALUE1_, A0_99)
  if returnCodes.SUCCESS ~= L1_100 then
    return L1_100
  end
  L2_101 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, L3_102, _UPVALUE2_.sourceAddressType)
  if L2_101 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_102, L2_101
end
function fw.core.firewallRules.Ipv4.sourceAddressTypeSet(A0_103, A1_104)
  local L2_105, L3_106, L4_107
  if A0_103 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_105 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_103)
  if not L2_105 then
    return returnCodes.COOKIEFAIL
  end
  if A1_104 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, A0_103
  end
  L4_107 = db.setAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_103, _UPVALUE2_.sourceAddressType, A1_104)
  if not L4_107 then
    return returnCodes.FAILURE, A0_103
  end
  return returnCodes.SUCCESS, A0_103
end
function fw.core.firewallRules.Ipv4.sourceAddressStartGet()
  local L0_108, L1_109, L2_110
  L1_109, L0_108 = getFirstCookie(Ipv4firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_109 then
    return L1_109
  end
  L2_110 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE0_, L0_108, _UPVALUE1_.sourceAddressStart)
  if L2_110 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_108, L2_110
end
function fw.core.firewallRules.Ipv4.sourceAddressStartGetNext(A0_111)
  local L1_112, L2_113, L3_114
  if A0_111 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_112, L3_114 = getNextCookie(Ipv4firewallRulesTable, _UPVALUE1_, A0_111)
  if returnCodes.SUCCESS ~= L1_112 then
    return L1_112
  end
  L2_113 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, L3_114, _UPVALUE2_.sourceAddressStart)
  if L2_113 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_114, L2_113
end
function fw.core.firewallRules.Ipv4.sourceAddressStartSet(A0_115, A1_116)
  local L2_117, L3_118, L4_119
  if A0_115 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_117 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_115)
  if not L2_117 then
    return returnCodes.COOKIEFAIL
  end
  if A1_116 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, A0_115
  end
  L4_119 = db.setAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_115, _UPVALUE2_.sourceAddressStart, A1_116)
  if not L4_119 then
    return returnCodes.FAILURE, A0_115
  end
  return returnCodes.SUCCESS, A0_115
end
function fw.core.firewallRules.Ipv4.sourceAddressEndGet()
  local L0_120, L1_121, L2_122
  L1_121, L0_120 = getFirstCookie(Ipv4firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_121 then
    return L1_121
  end
  L2_122 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE0_, L0_120, _UPVALUE1_.sourceAddressEnd)
  if L2_122 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_120, L2_122
end
function fw.core.firewallRules.Ipv4.sourceAddressEndGetNext(A0_123)
  local L1_124, L2_125, L3_126
  if A0_123 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_124, L3_126 = getNextCookie(Ipv4firewallRulesTable, _UPVALUE1_, A0_123)
  if returnCodes.SUCCESS ~= L1_124 then
    return L1_124
  end
  L2_125 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, L3_126, _UPVALUE2_.sourceAddressEnd)
  if L2_125 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_126, L2_125
end
function fw.core.firewallRules.Ipv4.sourceAddressEndSet(A0_127, A1_128)
  local L2_129, L3_130, L4_131
  if A0_127 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_129 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_127)
  if not L2_129 then
    return returnCodes.COOKIEFAIL
  end
  if A1_128 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, A0_127
  end
  L4_131 = db.setAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_127, _UPVALUE2_.sourceAddressEnd, A1_128)
  if not L4_131 then
    return returnCodes.FAILURE, A0_127
  end
  return returnCodes.SUCCESS, A0_127
end
function fw.core.firewallRules.Ipv4.logLevelGet()
  local L0_132, L1_133, L2_134
  L1_133, L0_132 = getFirstCookie(Ipv4firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_133 then
    return L1_133
  end
  L2_134 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE0_, L0_132, _UPVALUE1_.logStatus)
  if L2_134 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_132, L2_134
end
function fw.core.firewallRules.Ipv4.logLevelGetNext(A0_135)
  local L1_136, L2_137, L3_138
  if A0_135 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_136, L3_138 = getNextCookie(Ipv4firewallRulesTable, _UPVALUE1_, A0_135)
  if returnCodes.SUCCESS ~= L1_136 then
    return L1_136
  end
  L2_137 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, L3_138, _UPVALUE2_.logStatus)
  if L2_137 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_138, L2_137
end
function fw.core.firewallRules.Ipv4.logLevelSet(A0_139, A1_140)
  local L2_141, L3_142, L4_143
  if A0_139 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_141 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_139)
  if not L2_141 then
    return returnCodes.COOKIEFAIL
  end
  L2_141 = booleanCheck(A1_140)
  if L2_141 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A0_139
  end
  L4_143 = db.setAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_139, _UPVALUE2_.logStatus, A1_140)
  if not L4_143 then
    return returnCodes.FAILURE, A0_139
  end
  return returnCodes.SUCCESS, A0_139
end
function fw.core.firewallRules.Ipv4.destinationAddressTypeGet()
  local L0_144, L1_145, L2_146
  L1_145, L0_144 = getFirstCookie(Ipv4firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_145 then
    return L1_145
  end
  L2_146 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE0_, L0_144, _UPVALUE1_.destinationAddressType)
  if L2_146 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_144, L2_146
end
function fw.core.firewallRules.Ipv4.destinationAddressTypeGetNext(A0_147)
  local L1_148, L2_149, L3_150
  if A0_147 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_148, L3_150 = getNextCookie(Ipv4firewallRulesTable, _UPVALUE1_, A0_147)
  if returnCodes.SUCCESS ~= L1_148 then
    return L1_148
  end
  L2_149 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, L3_150, _UPVALUE2_.destinationAddressType)
  if L2_149 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_150, L2_149
end
function fw.core.firewallRules.Ipv4.destinationAddressTypeSet(A0_151, A1_152)
  local L2_153, L3_154, L4_155
  if A0_151 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_153 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_151)
  if not L2_153 then
    return returnCodes.COOKIEFAIL
  end
  if A1_152 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, A0_151
  end
  L4_155 = db.setAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_151, _UPVALUE2_.destinationAddressType, A1_152)
  if not L4_155 then
    return returnCodes.FAILURE, A0_151
  end
  return returnCodes.SUCCESS, A0_151
end
function fw.core.firewallRules.Ipv4.destinationAddressStartGet()
  local L0_156, L1_157, L2_158
  L1_157, L0_156 = getFirstCookie(Ipv4firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_157 then
    return L1_157
  end
  L2_158 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE0_, L0_156, _UPVALUE1_.destinationAddressStart)
  if L2_158 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_156, L2_158
end
function fw.core.firewallRules.Ipv4.destinationAddressStartGetNext(A0_159)
  local L1_160, L2_161, L3_162
  if A0_159 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_160, L3_162 = getNextCookie(Ipv4firewallRulesTable, _UPVALUE1_, A0_159)
  if returnCodes.SUCCESS ~= L1_160 then
    return L1_160
  end
  L2_161 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, L3_162, _UPVALUE2_.destinationAddressStart)
  if L2_161 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_162, L2_161
end
function fw.core.firewallRules.Ipv4.destinationAddressStartSet(A0_163, A1_164)
  local L2_165, L3_166, L4_167
  if A0_163 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_165 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_163)
  if not L2_165 then
    return returnCodes.COOKIEFAIL
  end
  if A1_164 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, A0_163
  end
  L4_167 = db.setAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_163, _UPVALUE2_.destinationAddressStart, A1_164)
  if not L4_167 then
    return returnCodes.FAILURE, A0_163
  end
  return returnCodes.SUCCESS, A0_163
end
function fw.core.firewallRules.Ipv4.destinationAddressEndGet()
  local L0_168, L1_169, L2_170
  L1_169, L0_168 = getFirstCookie(Ipv4firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_169 then
    return L1_169
  end
  L2_170 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE0_, L0_168, _UPVALUE1_.destinationAddressEnd)
  if L2_170 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_168, L2_170
end
function fw.core.firewallRules.Ipv4.destinationAddressEndGetNext(A0_171)
  local L1_172, L2_173, L3_174
  if A0_171 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_172, L3_174 = getNextCookie(Ipv4firewallRulesTable, _UPVALUE1_, A0_171)
  if returnCodes.SUCCESS ~= L1_172 then
    return L1_172
  end
  L2_173 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, L3_174, _UPVALUE2_.destinationAddressEnd)
  if L2_173 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_174, L2_173
end
function fw.core.firewallRules.Ipv4.destinationAddressEndSet(A0_175, A1_176)
  local L2_177, L3_178, L4_179
  if A0_175 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_177 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_175)
  if not L2_177 then
    return returnCodes.COOKIEFAIL
  end
  if A1_176 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, A0_175
  end
  L4_179 = db.setAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_175, _UPVALUE2_.destinationAddressEnd, A1_176)
  if not L4_179 then
    return returnCodes.FAILURE, A0_175
  end
  return returnCodes.SUCCESS, A0_175
end
function fw.core.firewallRules.Ipv4.snatAddressTypeGet()
  local L0_180, L1_181, L2_182
  L1_181, L0_180 = getFirstCookie(Ipv4firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_181 then
    return L1_181
  end
  L2_182 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE0_, L0_180, _UPVALUE1_.snatAddressType)
  if L2_182 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_180, L2_182
end
function fw.core.firewallRules.Ipv4.snatAddressTypeGetNext(A0_183)
  local L1_184, L2_185, L3_186
  if A0_183 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_184, L3_186 = getNextCookie(Ipv4firewallRulesTable, _UPVALUE1_, A0_183)
  if returnCodes.SUCCESS ~= L1_184 then
    return L1_184
  end
  L2_185 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, L3_186, _UPVALUE2_.snatAddressType)
  if L2_185 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_186, L2_185
end
function fw.core.firewallRules.Ipv4.snatAddressTypeSet(A0_187, A1_188)
  local L2_189, L3_190, L4_191
  if A0_187 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_189 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_187)
  if not L2_189 then
    return returnCodes.COOKIEFAIL
  end
  L4_191 = db.setAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_187, _UPVALUE2_.snatAddressType, A1_188)
  if not L4_191 then
    return returnCodes.FAILURE, A0_187
  end
  return returnCodes.SUCCESS, A0_187
end
function fw.core.firewallRules.Ipv4.snatAddressGet()
  local L0_192, L1_193, L2_194
  L1_193, L0_192 = getFirstCookie(Ipv4firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_193 then
    return L1_193
  end
  L2_194 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE0_, L0_192, _UPVALUE1_.snatAddress)
  if L2_194 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_192, L2_194
end
function fw.core.firewallRules.Ipv4.snatAddressGetNext(A0_195)
  local L1_196, L2_197, L3_198
  if A0_195 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_196, L3_198 = getNextCookie(Ipv4firewallRulesTable, _UPVALUE1_, A0_195)
  if returnCodes.SUCCESS ~= L1_196 then
    return L1_196
  end
  L2_197 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, L3_198, _UPVALUE2_.snatAddress)
  if L2_197 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_198, L2_197
end
function fw.core.firewallRules.Ipv4.snatAddressSet(A0_199, A1_200)
  local L2_201, L3_202, L4_203
  if A0_199 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_201 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_199)
  if not L2_201 then
    return returnCodes.COOKIEFAIL
  end
  L4_203 = db.setAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_199, _UPVALUE2_.snatAddress, A1_200)
  if not L4_203 then
    return returnCodes.FAILURE, A0_199
  end
  return returnCodes.SUCCESS, A0_199
end
function fw.core.firewallRules.Ipv4.snatInterfaceGet()
  local L0_204, L1_205, L2_206
  L1_205, L0_204 = getFirstCookie(Ipv4firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_205 then
    return L1_205
  end
  L2_206 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE0_, L0_204, _UPVALUE1_.name)
  if L2_206 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_204, L2_206
end
function fw.core.firewallRules.Ipv4.snatInterfaceGetNext(A0_207)
  local L1_208, L2_209, L3_210
  if A0_207 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_208, L3_210 = getNextCookie(Ipv4firewallRulesTable, _UPVALUE1_, A0_207)
  if returnCodes.SUCCESS ~= L1_208 then
    return L1_208
  end
  L2_209 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, L3_210, _UPVALUE2_.snatInterface)
  if L2_209 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_210, L2_209
end
function fw.core.firewallRules.Ipv4.snatInterfaceSet(A0_211, A1_212)
  local L2_213, L3_214, L4_215
  if A0_211 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_213 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_211)
  if not L2_213 then
    return returnCodes.COOKIEFAIL
  end
  L4_215 = db.setAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_211, _UPVALUE2_.snatInterface, A1_212)
  if not L4_215 then
    return returnCodes.FAILURE, A0_211
  end
  return returnCodes.SUCCESS, A0_211
end
function fw.core.firewallRules.Ipv4.destinationPublicInterfaceGet(A0_216)
  local L1_217, L2_218, L3_219
  L2_218, L1_217 = getFirstCookie(Ipv4firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L2_218 then
    return L2_218
  end
  L3_219 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE0_, L1_217, _UPVALUE1_.destinationPublicInterface)
  if L3_219 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L1_217, L3_219
end
function fw.core.firewallRules.Ipv4.destinationPublicInterfaceGetNext(A0_220)
  local L1_221, L2_222, L3_223
  if A0_220 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_221, L3_223 = getNextCookie(Ipv4firewallRulesTable, _UPVALUE1_, A0_220)
  if returnCodes.SUCCESS ~= L1_221 then
    return L1_221
  end
  L2_222 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, L3_223, _UPVALUE2_.destinationPublicInterface)
  if L2_222 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_223, L2_222
end
function fw.core.firewallRules.Ipv4.destinationPublicInterfaceSet(A0_224, A1_225)
  local L2_226, L3_227, L4_228, L5_229
  if A0_224 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_226 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_224)
  if not L2_226 then
    return returnCodes.COOKIEFAIL
  end
  L5_229 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_224, _UPVALUE2_.ruleType)
  if L5_229 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  if (L5_229 == "INSECURE_SECURE" or L5_229 == "INSECURE_PUBLIC") and A1_225 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L4_228 = db.setAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_224, _UPVALUE2_.destinationPublicInterface, A1_225)
  if not L4_228 then
    return returnCodes.FAILURE, A0_224
  end
  return returnCodes.SUCCESS, A0_224
end
function fw.core.firewallRules.Ipv4.destinationPublicAddressGet()
  local L0_230, L1_231, L2_232
  L1_231, L0_230 = getFirstCookie(Ipv4firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_231 then
    return L1_231
  end
  L2_232 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE0_, L0_230, _UPVALUE1_.destinationPublicAddress)
  if L2_232 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_230, L2_232
end
function fw.core.firewallRules.Ipv4.destinationPublicAddressGetNext(A0_233)
  local L1_234, L2_235, L3_236
  if A0_233 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_234, L3_236 = getNextCookie(Ipv4firewallRulesTable, _UPVALUE1_, A0_233)
  if returnCodes.SUCCESS ~= L1_234 then
    return L1_234
  end
  L2_235 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, L3_236, _UPVALUE2_.destinationPublicAddress)
  if L2_235 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_236, L2_235
end
function fw.core.firewallRules.Ipv4.destinationPublicAddressSet(A0_237, A1_238)
  local L2_239, L3_240, L4_241
  if A0_237 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_239 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_237)
  if not L2_239 then
    return returnCodes.COOKIEFAIL
  end
  if A1_238 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, A0_237
  end
  L4_241 = db.setAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_237, _UPVALUE2_.destinationPublicAddress, A1_238)
  if not L4_241 then
    return returnCodes.FAILURE, A0_237
  end
  return returnCodes.SUCCESS, A0_237
end
function fw.core.firewallRules.Ipv4.dnatAddressGet()
  local L0_242, L1_243, L2_244
  L1_243, L0_242 = getFirstCookie(Ipv4firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_243 then
    return L1_243
  end
  L2_244 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE0_, L0_242, _UPVALUE1_.dnatAddress)
  if L2_244 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_242, L2_244
end
function fw.core.firewallRules.Ipv4.ruleTypeGetNext(A0_245)
  local L1_246, L2_247, L3_248
  if A0_245 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_246, L3_248 = getNextCookie(Ipv4firewallRulesTable, _UPVALUE1_, A0_245)
  if returnCodes.SUCCESS ~= L1_246 then
    return L1_246
  end
  L2_247 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, L3_248, _UPVALUE2_.dnatAddress)
  if L2_247 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_248, L2_247
end
function fw.core.firewallRules.Ipv4.dnatAddressSet(A0_249, A1_250)
  local L2_251, L3_252, L4_253, L5_254
  if A0_249 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_251 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_249)
  if not L2_251 then
    return returnCodes.COOKIEFAIL
  end
  L5_254 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_249, _UPVALUE2_.ruleType)
  if L5_254 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  if L5_254 == "INSECURE_SECURE" or L5_254 == "INSECURE_PUBLIC" then
    if dNATAddress == _UPVALUE0_ then
      return returnCodes.INVALID_ARGUMENT
    end
    L2_251 = ipv4Check(dNATAddress)
    if not L2_251 then
      return returnCodes.INVALID_ARGUMENT
    end
  end
  L4_253 = db.setAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_249, _UPVALUE2_.dnatAddress, A1_250)
  if not L4_253 then
    return returnCodes.FAILURE, A0_249
  end
  return returnCodes.SUCCESS, A0_249
end
function fw.core.firewallRules.Ipv4.dnatPortEnableGet()
  local L0_255, L1_256, L2_257
  L1_256, L0_255 = getFirstCookie(Ipv4firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_256 then
    return L1_256
  end
  L2_257 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE0_, L0_255, _UPVALUE1_.dnatPortEnable)
  if L2_257 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_255, L2_257
end
function fw.core.firewallRules.Ipv4.dnatPortEnableGetNext(A0_258)
  local L1_259, L2_260, L3_261
  if A0_258 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_259, L3_261 = getNextCookie(Ipv4firewallRulesTable, _UPVALUE1_, A0_258)
  if returnCodes.SUCCESS ~= L1_259 then
    return L1_259
  end
  L2_260 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, L3_261, _UPVALUE2_.dnatPortEnable)
  if L2_260 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_261, L2_260
end
function fw.core.firewallRules.Ipv4.dnatPortEnableSet(A0_262, A1_263)
  local L2_264, L3_265, L4_266
  if A0_262 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_264 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_262)
  if not L2_264 then
    return returnCodes.COOKIEFAIL
  end
  if A1_263 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, A0_262
  end
  L4_266 = db.setAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_262, _UPVALUE2_.dnatPortEnable, A1_263)
  if not L4_266 then
    return returnCodes.FAILURE, A0_262
  end
  return returnCodes.SUCCESS, A0_262
end
function fw.core.firewallRules.Ipv4.dnatPortGet()
  local L0_267, L1_268, L2_269
  L1_268, L0_267 = getFirstCookie(Ipv4firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_268 then
    return L1_268
  end
  L2_269 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE0_, L0_267, _UPVALUE1_.dnatPort)
  if L2_269 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_267, L2_269
end
function fw.core.firewallRules.Ipv4.dnatPortGetNext(A0_270)
  local L1_271, L2_272, L3_273
  if A0_270 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_271, L3_273 = getNextCookie(Ipv4firewallRulesTable, _UPVALUE1_, A0_270)
  if returnCodes.SUCCESS ~= L1_271 then
    return L1_271
  end
  L2_272 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, L3_273, _UPVALUE2_.dnatPort)
  if L2_272 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_273, L2_272
end
function fw.core.firewallRules.Ipv4.dnatPortSet(A0_274, A1_275)
  local L2_276, L3_277, L4_278
  if A0_274 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_276 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_274)
  if not L2_276 then
    return returnCodes.COOKIEFAIL
  end
  if A1_275 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, A0_274
  end
  L4_278 = db.setAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_274, _UPVALUE2_.dnatPort, A1_275)
  if not L4_278 then
    return returnCodes.FAILURE, A0_274
  end
  return returnCodes.SUCCESS, A0_274
end
function fw.core.firewallRules.Ipv4.fromZoneTypeGet()
  local L0_279, L1_280, L2_281
  L1_280, L0_279 = getFirstCookie(Ipv4firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_280 then
    return L1_280
  end
  L2_281 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE0_, L0_279, _UPVALUE1_.fromZoneType)
  if L2_281 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_279, L2_281
end
function fw.core.firewallRules.Ipv4.fromZoneTypeGetNext(A0_282)
  local L1_283, L2_284, L3_285
  if A0_282 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_283, L3_285 = getNextCookie(Ipv4firewallRulesTable, _UPVALUE1_, A0_282)
  if returnCodes.SUCCESS ~= L1_283 then
    return L1_283
  end
  L2_284 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, L3_285, _UPVALUE2_.fromZoneType)
  if L2_284 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_285, L2_284
end
function fw.core.firewallRules.Ipv4.fromZoneTypeSet(A0_286, A1_287)
  local L2_288, L3_289, L4_290, L5_291
  if A0_286 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_288 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_286)
  if not L2_288 then
    return returnCodes.COOKIEFAIL
  end
  L5_291 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_286, _UPVALUE2_.toZoneType)
  if L5_291 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  L2_288 = fw_zoneTypeValidation(A1_287, L5_291)
  if not L2_288 then
    return returnCodes.INVALID_ARGUMENT
  end
  L4_290 = db.setAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_286, _UPVALUE2_.fromZoneType, A1_287)
  if not L4_290 then
    return returnCodes.FAILURE, A0_286
  end
  return returnCodes.SUCCESS, A0_286
end
function fw.core.firewallRules.Ipv4.toZoneTypeGet()
  local L0_292, L1_293, L2_294
  L1_293, L0_292 = getFirstCookie(Ipv4firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_293 then
    return L1_293
  end
  L2_294 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE0_, L0_292, _UPVALUE1_.toZoneType)
  if L2_294 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_292, L2_294
end
function fw.core.firewallRules.Ipv4.fromZoneTypeGetNext(A0_295)
  local L1_296, L2_297, L3_298
  if A0_295 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_296, L3_298 = getNextCookie(Ipv4firewallRulesTable, _UPVALUE1_, A0_295)
  if returnCodes.SUCCESS ~= L1_296 then
    return L1_296
  end
  L2_297 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, L3_298, _UPVALUE2_.toZoneType)
  if L2_297 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_298, L2_297
end
function fw.core.firewallRules.Ipv4.toZoneTypeSet(A0_299, A1_300)
  local L2_301, L3_302, L4_303, L5_304
  if A0_299 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_301 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_299)
  if not L2_301 then
    return returnCodes.COOKIEFAIL
  end
  L5_304 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_299, _UPVALUE2_.fromZoneType)
  if L5_304 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  L2_301 = fw_zoneTypeValidation(L5_304, A1_300)
  if not L2_301 then
    return returnCodes.INVALID_ARGUMENT
  end
  L4_303 = db.setAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_299, _UPVALUE2_.toZoneType, A1_300)
  if not L4_303 then
    return returnCodes.FAILURE, A0_299
  end
  return returnCodes.SUCCESS, A0_299
end
function fw.core.firewallRules.Ipv4.fromZoneVlanIdGet()
  local L0_305, L1_306, L2_307
  L1_306, L0_305 = getFirstCookie(Ipv4firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_306 then
    return L1_306
  end
  L2_307 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE0_, L0_305, _UPVALUE1_.fromZoneVlanId)
  if L2_307 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_305, L2_307
end
function fw.core.firewallRules.Ipv4.fromZoneVlanIdNext(A0_308)
  local L1_309, L2_310, L3_311
  if A0_308 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_309, L3_311 = getNextCookie(Ipv4firewallRulesTable, _UPVALUE1_, A0_308)
  if returnCodes.SUCCESS ~= L1_309 then
    return L1_309
  end
  L2_310 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, L3_311, _UPVALUE2_.fromZoneVlanId)
  if L2_310 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_311, L2_310
end
function fw.core.firewallRules.Ipv4.fromZoneVlanIdSet(A0_312, A1_313)
  local L2_314, L3_315, L4_316, L5_317
  if A0_312 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_314 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_312)
  if not L2_314 then
    return returnCodes.COOKIEFAIL
  end
  L5_317 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_312, _UPVALUE2_.fromZoneType)
  if L5_317 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  L4_316 = db.setAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_312, _UPVALUE2_.fromZoneVlanId, A1_313)
  if not L4_316 then
    return returnCodes.FAILURE, A0_312
  end
  return returnCodes.SUCCESS, A0_312
end
function fw.core.firewallRules.Ipv4.toZoneVlanIdGet()
  local L0_318, L1_319, L2_320
  L1_319, L0_318 = getFirstCookie(Ipv4firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_319 then
    return L1_319
  end
  L2_320 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE0_, L0_318, _UPVALUE1_.toZoneVlanId)
  if L2_320 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_318, L2_320
end
function fw.core.firewallRules.Ipv4.toZoneVlanIdNext(A0_321)
  local L1_322, L2_323, L3_324
  if A0_321 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_322, L3_324 = getNextCookie(Ipv4firewallRulesTable, _UPVALUE1_, A0_321)
  if returnCodes.SUCCESS ~= L1_322 then
    return L1_322
  end
  L2_323 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, L3_324, _UPVALUE2_.toZoneVlanId)
  if L2_323 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_324, L2_323
end
function fw.core.firewallRules.Ipv4.toZoneVlanIdSet(A0_325, A1_326)
  local L2_327, L3_328, L4_329, L5_330
  if A0_325 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_327 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_325)
  if not L2_327 then
    return returnCodes.COOKIEFAIL
  end
  toZoneType = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_325, _UPVALUE2_.toZoneType)
  if toZoneType == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  L4_329 = db.setAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A0_325, _UPVALUE2_.toZoneVlanId, A1_326)
  if not L4_329 then
    return returnCodes.FAILURE, A0_325
  end
  return returnCodes.SUCCESS, A0_325
end
function fw.core.firewallRules.Ipv4.add(A0_331, A1_332, A2_333, A3_334, A4_335, A5_336, A6_337, A7_338, A8_339, A9_340, A10_341, A11_342, A12_343, A13_344, A14_345, A15_346, A16_347, A17_348, A18_349, A19_350, A20_351, A21_352, A22_353, A23_354, A24_355)
  local L25_356, L26_357, L27_358, L28_359
  L26_357 = {}
  L27_358 = nil
  L28_359 = _UPVALUE0_
  if A1_332 == L28_359 then
    L28_359 = returnCodes
    L28_359 = L28_359.INVALID_ARGUMENT
    return L28_359
  end
  L28_359 = db
  L28_359 = L28_359.existsRow
  L28_359 = L28_359("Services", "ServiceName", A1_332)
  L25_356 = L28_359
  if not L25_356 then
    L28_359 = returnCodes
    L28_359 = L28_359.INVALID_ARGUMENT
    return L28_359
  end
  if A0_331 == "SECURE_INSECURE" or A0_331 == "PUBLIC_INSECURE" then
    L28_359 = fw_qosPriorityValidation
    L28_359 = L28_359(A2_333)
    L25_356 = L28_359
    if not L25_356 then
      L28_359 = returnCodes
      L28_359 = L28_359.INVALID_ARGUMENT
      return L28_359
    end
  end
  L28_359 = fw_actionValidation
  L28_359 = L28_359(A3_334)
  L25_356 = L28_359
  if not L25_356 then
    L28_359 = returnCodes
    L28_359 = L28_359.INVALID_ARGUMENT
    return L28_359
  end
  if A3_334 == "DROP_BY_SCHED_MATCH" or A3_334 == "ACCEPT_BY_SCHED_MATCH" then
    L28_359 = _UPVALUE0_
    if A4_335 == L28_359 then
      L28_359 = returnCodes
      L28_359 = L28_359.INVALID_ARGUMENT
      return L28_359
    end
    L28_359 = db
    L28_359 = L28_359.existsRow
    L28_359 = L28_359("Schedules", "ScheduleName", A4_335)
    L25_356 = L28_359
    if not L25_356 then
      L28_359 = returnCodes
      L28_359 = L28_359.INVALID_ARGUMENT
      return L28_359
    end
  end
  L28_359 = fw_networkRangeValidation
  L28_359 = L28_359(A5_336, A6_337, A7_338, ipmode.ipv4)
  L25_356 = L28_359
  if not L25_356 then
    L28_359 = returnCodes
    L28_359 = L28_359.INVALID_ARGUMENT
    return L28_359
  end
  L28_359 = _UPVALUE1_
  if A8_339 ~= L28_359 then
    L28_359 = _UPVALUE2_
    if A8_339 ~= L28_359 then
      L28_359 = returnCodes
      L28_359 = L28_359.INVALID_ARGUMENT
      return L28_359, cookie
    end
  end
  if A0_331 == "INSECURE_SECURE" or A0_331 == "INSECURE_PUBLIC" then
    L28_359 = db
    L28_359 = L28_359.getAttribute
    L28_359 = L28_359("NatTable", "_ROWID_", "1", "Enable")
    L27_358 = L28_359
  end
  if A0_331 ~= "INSECURE_SECURE" and A0_331 ~= "INSECURE_PUBLIC" then
    L28_359 = fw_networkRangeValidation
    L28_359 = L28_359(A9_340, A10_341, A11_342, ipmode.ipv4)
    L25_356 = L28_359
    if not L25_356 then
      L28_359 = returnCodes
      L28_359 = L28_359.INVALID_ARGUMENT
      return L28_359
    end
  else
    L28_359 = _UPVALUE3_
    if L27_358 ~= L28_359 then
      L28_359 = fw_networkRangeValidation
      L28_359 = L28_359(A9_340, A10_341, A11_342, ipmode.ipv4)
      L25_356 = L28_359
      if not L25_356 then
        L28_359 = returnCodes
        L28_359 = L28_359.INVALID_ARGUMENT
        return L28_359
      end
    end
  end
  if A0_331 == "SECURE_INSECURE" or A0_331 == "PUBLIC_INSECURE" then
    L28_359 = fw_snatAddressType
    L28_359 = L28_359(A12_343, A14_345, A13_344)
    L25_356 = L28_359
    if not L25_356 then
      L28_359 = returnCodes
      L28_359 = L28_359.INVALID_ARGUMENT
      return L28_359
    end
  end
  if A0_331 == "INSECURE_SECURE" or A0_331 == "INSECURE_PUBLIC" then
    L28_359 = _UPVALUE3_
    if L27_358 == L28_359 then
      L28_359 = _UPVALUE0_
      if A15_346 == L28_359 then
        L28_359 = returnCodes
        L28_359 = L28_359.INVALID_ARGUMENT
        return L28_359
      end
      if A15_346 ~= "WAN1" and A15_346 ~= "WAN2" and A15_346 ~= "WAN3" and A15_346 ~= "OTHER" then
        L28_359 = returnCodes
        L28_359 = L28_359.INVALID_ARGUMENT
        return L28_359
      end
      if A16_347 ~= nil then
        L28_359 = ipv4Check
        L28_359 = L28_359(A16_347)
        L25_356 = L28_359
        if not L25_356 then
          L28_359 = returnCodes
          L28_359 = L28_359.INVALID_ARGUMENT
          return L28_359
        end
      end
      L28_359 = _UPVALUE0_
      if A17_348 ~= L28_359 then
        L28_359 = ipv4Check
        L28_359 = L28_359(A17_348)
        L25_356 = L28_359
        if not L25_356 then
          L28_359 = returnCodes
          L28_359 = L28_359.INVALID_ARGUMENT
          return L28_359
        end
      end
    end
  end
  L28_359 = _UPVALUE0_
  if A23_354 == L28_359 then
    L28_359 = returnCodes
    L28_359 = L28_359.INVALID_ARGUMENT
    return L28_359
  end
  L28_359 = _UPVALUE0_
  if A24_355 == L28_359 then
    L28_359 = returnCodes
    L28_359 = L28_359.INVALID_ARGUMENT
    return L28_359
  end
  L28_359 = db
  L28_359 = L28_359.getRowsWhere
  L28_359 = L28_359(Ipv4firewallRulesTable, _UPVALUE4_)
  if L28_359 ~= nil and #L28_359 >= _UPVALUE5_ then
    return returnCodes.EXCEED_MAX_LIMIT
  elseif A0_331 == "SECURE_INSECURE" or A0_331 == "PUBLIC_INSECURE" then
    L28_359 = db.getRowsWhere(Ipv4firewallRulesTable, _UPVALUE4_ .. " and (ruleType == 'SECURE_INSECURE' or ruleType == 'PUBLIC_INSECURE')")
    if L28_359 ~= nil and #L28_359 >= _UPVALUE6_ then
      return returnCodes.EXCEED_OUTBOUND_LIMIT
    end
  elseif A0_331 == "INSECURE_SECURE" or A0_331 == "INSECURE_PUBLIC" then
    L28_359 = db.getRowsWhere(Ipv4firewallRulesTable, _UPVALUE4_ .. " and (ruleType == 'INSECURE_SECURE' or ruleType == 'INSECURE_PUBLIC')")
    if L28_359 ~= nil and #L28_359 >= _UPVALUE7_ then
      return returnCodes.EXCEED_INBOUND_LIMIT
    end
  end
  L26_357[Ipv4firewallRulesTable .. "." .. _UPVALUE8_.ruleType] = A0_331
  L26_357[Ipv4firewallRulesTable .. "." .. _UPVALUE8_.status] = _UPVALUE3_
  L26_357[Ipv4firewallRulesTable .. "." .. _UPVALUE8_.serviceName] = A1_332
  L26_357[Ipv4firewallRulesTable .. "." .. _UPVALUE8_.typeOfService] = A2_333
  L26_357[Ipv4firewallRulesTable .. "." .. _UPVALUE8_.action] = A3_334
  L26_357[Ipv4firewallRulesTable .. "." .. _UPVALUE8_.scheduleName] = A4_335
  L26_357[Ipv4firewallRulesTable .. "." .. _UPVALUE8_.sourceAddressType] = A5_336
  L26_357[Ipv4firewallRulesTable .. "." .. _UPVALUE8_.sourceAddressStart] = A6_337
  L26_357[Ipv4firewallRulesTable .. "." .. _UPVALUE8_.sourceAddressEnd] = A7_338
  L26_357[Ipv4firewallRulesTable .. "." .. _UPVALUE8_.logStatus] = A8_339
  L26_357[Ipv4firewallRulesTable .. "." .. _UPVALUE8_.destinationAddressType] = A9_340
  L26_357[Ipv4firewallRulesTable .. "." .. _UPVALUE8_.destinationAddressStart] = A10_341
  L26_357[Ipv4firewallRulesTable .. "." .. _UPVALUE8_.destinationAddressEnd] = A11_342
  L26_357[Ipv4firewallRulesTable .. "." .. _UPVALUE8_.snatAddressType] = A12_343
  L26_357[Ipv4firewallRulesTable .. "." .. _UPVALUE8_.snatAddress] = A13_344
  L26_357[Ipv4firewallRulesTable .. "." .. _UPVALUE8_.snatInterface] = A14_345
  L26_357[Ipv4firewallRulesTable .. "." .. _UPVALUE8_.destinationPublicInterface] = A15_346
  L26_357[Ipv4firewallRulesTable .. "." .. _UPVALUE8_.destinationPublicAddress] = A16_347
  L26_357[Ipv4firewallRulesTable .. "." .. _UPVALUE8_.dnatAddress] = A17_348
  L26_357[Ipv4firewallRulesTable .. "." .. _UPVALUE8_.dnatPortEnable] = A18_349
  L26_357[Ipv4firewallRulesTable .. "." .. _UPVALUE8_.dnatPort] = A19_350
  L26_357[Ipv4firewallRulesTable .. "." .. _UPVALUE8_.fromZoneType] = A20_351
  L26_357[Ipv4firewallRulesTable .. "." .. _UPVALUE8_.toZoneType] = A21_352
  L26_357[Ipv4firewallRulesTable .. "." .. _UPVALUE8_.priorityId] = A22_353
  L26_357[Ipv4firewallRulesTable .. "." .. _UPVALUE8_.fromZoneVlanId] = A23_354
  L26_357[Ipv4firewallRulesTable .. "." .. _UPVALUE8_.toZoneVlanId] = A24_355
  L25_356 = db.insert(Ipv4firewallRulesTable, L26_357)
  if not L25_356 then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, A22_353
end
function fw.firewallRules.Ipv4.add(A0_360, A1_361, A2_362, A3_363, A4_364, A5_365, A6_366, A7_367, A8_368, A9_369, A10_370, A11_371, A12_372, A13_373, A14_374, A15_375, A16_376, A17_377, A18_378, A19_379, A20_380, A21_381, A22_382)
  local L23_383, L24_384, L25_385, L26_386, L27_387
  L26_386 = A19_379
  L27_387 = "_"
  L26_386 = L26_386 .. L27_387 .. A20_380
  L27_387 = newPriorityGet
  L27_387 = L27_387(ipmode.ipv4)
  L25_385, L24_384 = fw.core.firewallRules.Ipv4.add(L26_386, A0_360, A1_361, A2_362, A3_363, A4_364, A5_365, A6_366, A7_367, A8_368, A9_369, A10_370, A11_371, A12_372, A13_373, A14_374, A15_375, A16_376, A17_377, A18_378, A19_379, A20_380, L27_387, A21_381, A22_382)
  if L25_385 ~= returnCodes.SUCCESS then
    return L25_385, cookie
  else
    L25_385, errCode = updatePriorityMap(L27_387, ipmode.ipv4)
  end
  if L25_385 then
    return L25_385, cookie
  end
  return returnCodes.SUCCESS, cookie
end
function fw.firewallRules.Ipv4.SecureToInSecure.add(A0_388, A1_389, A2_390, A3_391, A4_392, A5_393, A6_394, A7_395, A8_396, A9_397, A10_398, A11_399, A12_400, A13_401, A14_402, A15_403, A16_404)
  local L17_405, L18_406, L19_407
  L17_405 = fw_zoneTypeValidation(A14_402, A15_403)
  if not L17_405 then
    return returnCodes.INVALID_ARGUMENT
  end
  L19_407 = fw.firewallRules.Ipv4.add(A0_388, A1_389, A2_390, A3_391, A4_392, A5_393, A6_394, A7_395, A8_396, A9_397, A10_398, A11_399, A12_400, A13_401, nil, nil, nil, "0", nil, A14_402, A15_403, A16_404, _UPVALUE0_)
  if L19_407 then
    return L19_407, cookie
  end
  return returnCodes.SUCCESS, cookie
end
function fw.firewallRules.Ipv4.InSecureToSecure.add(A0_408, A1_409, A2_410, A3_411, A4_412, A5_413, A6_414, A7_415, A8_416, A9_417, A10_418, A11_419, A12_420, A13_421, A14_422, A15_423, A16_424, A17_425)
  local L18_426, L19_427, L20_428
  L18_426 = fw_zoneTypeValidation(A13_421, A14_422)
  if not L18_426 then
    return returnCodes.INVALID_ARGUMENT
  end
  L20_428 = fw.firewallRules.Ipv4.add(A0_408, nil, A1_409, A2_410, A3_411, A4_412, A5_413, A6_414, A7_415, A8_416, A9_417, nil, nil, nil, A10_418, A11_419, A12_420, A16_424, A17_425, A13_421, A14_422, _UPVALUE0_, A15_423)
  if L20_428 then
    return L20_428, cookie
  end
  return returnCodes.SUCCESS, cookie
end
function fw.firewallRules.Ipv4.SecureToPublic.add(A0_429, A1_430, A2_431, A3_432, A4_433, A5_434, A6_435, A7_436, A8_437, A9_438, A10_439, A11_440, A12_441)
  local L13_442, L14_443, L15_444
  L13_442 = fw_zoneTypeValidation(A10_439, A11_440)
  if not L13_442 then
    return returnCodes.INVALID_ARGUMENT
  end
  L15_444 = fw.firewallRules.Ipv4.add(A0_429, nil, A1_430, A2_431, A3_432, A4_433, A5_434, A6_435, A7_436, A8_437, A9_438, nil, nil, nil, nil, nil, nil, _UPVALUE0_, nil, A10_439, A11_440, A12_441, _UPVALUE0_)
  if L15_444 then
    return L15_444, cookie
  end
  return returnCodes.SUCCESS, cookie
end
function fw.firewallRules.Ipv4.PublicToSecure.add(A0_445, A1_446, A2_447, A3_448, A4_449, A5_450, A6_451, A7_452, A8_453, A9_454, A10_455, A11_456, A12_457)
  local L13_458, L14_459, L15_460
  L13_458 = fw_zoneTypeValidation(A10_455, A11_456)
  if not L13_458 then
    return returnCodes.INVALID_ARGUMENT
  end
  L15_460 = fw.firewallRules.Ipv4.add(A0_445, nil, A1_446, A2_447, A3_448, A4_449, A5_450, A6_451, A7_452, A8_453, A9_454, nil, nil, nil, nil, nil, nil, _UPVALUE0_, nil, A10_455, A11_456, _UPVALUE0_, A12_457)
  if L15_460 then
    return L15_460, cookie
  end
  return returnCodes.SUCCESS, cookie
end
function fw.firewallRules.Ipv4.PublicToInSecure.add(A0_461, A1_462, A2_463, A3_464, A4_465, A5_466, A6_467, A7_468, A8_469, A9_470, A10_471, A11_472, A12_473, A13_474, A14_475, A15_476)
  local L16_477, L17_478, L18_479
  L16_477 = fw_zoneTypeValidation(A14_475, A15_476)
  if not L16_477 then
    return returnCodes.INVALID_ARGUMENT
  end
  L18_479 = fw.firewallRules.Ipv4.add(A0_461, A1_462, A2_463, A3_464, A4_465, A5_466, A6_467, A7_468, A8_469, A9_470, A10_471, A11_472, A12_473, A13_474, nil, nil, nil, "0", nil, A14_475, A15_476, _UPVALUE0_, _UPVALUE0_)
  if L18_479 then
    return L18_479, cookie
  end
  return returnCodes.SUCCESS, cookie
end
function fw.firewallRules.Ipv4.InSecureToPublic.add(A0_480, A1_481, A2_482, A3_483, A4_484, A5_485, A6_486, A7_487, A8_488, A9_489, A10_490, A11_491, A12_492, A13_493, A14_494, A15_495, A16_496)
  local L17_497, L18_498, L19_499
  L17_497 = fw_zoneTypeValidation(A13_493, A14_494)
  if not L17_497 then
    return returnCodes.INVALID_ARGUMENT
  end
  L19_499 = fw.firewallRules.Ipv4.add(A0_480, nil, A1_481, A2_482, A3_483, A4_484, A5_485, A6_486, A7_487, A8_488, A9_489, nil, nil, nil, A10_490, A11_491, A12_492, A15_495, A16_496, A13_493, A14_494, _UPVALUE0_, _UPVALUE0_)
  if L19_499 then
    return L19_499, cookie
  end
  return returnCodes.SUCCESS, cookie
end
function fw.firewallRules.Ipv4.SecureToSecure.add(A0_500, A1_501, A2_502, A3_503, A4_504, A5_505, A6_506, A7_507, A8_508, A9_509, A10_510, A11_511, A12_512, A13_513)
  local L14_514, L15_515, L16_516
  L14_514 = fw_zoneTypeValidation(A10_510, A11_511)
  if not L14_514 then
    return returnCodes.INVALID_ARGUMENT
  end
  L16_516 = fw.firewallRules.Ipv4.add(A0_500, nil, A1_501, A2_502, A3_503, A4_504, A5_505, A6_506, A7_507, A8_508, A9_509, nil, nil, nil, nil, nil, nil, _UPVALUE0_, nil, A10_510, A11_511, A12_512, A13_513)
  if L16_516 then
    return L16_516, cookie
  end
  return returnCodes.SUCCESS, cookie
end
function fw.core.firewallRules.Ipv4.edit(A0_517, A1_518, A2_519, A3_520, A4_521, A5_522, A6_523, A7_524, A8_525, A9_526, A10_527, A11_528, A12_529, A13_530, A14_531, A15_532, A16_533, A17_534, A18_535, A19_536, A20_537, A21_538, A22_539, A23_540, A24_541, A25_542)
  local L26_543, L27_544, L28_545, L29_546
  L27_544 = {}
  L28_545 = nil
  L29_546 = _UPVALUE0_
  if A25_542 == L29_546 then
    L29_546 = returnCodes
    L29_546 = L29_546.INVALID_ARGUMENT
    return L29_546
  end
  L29_546 = db
  L29_546 = L29_546.existsRow
  L29_546 = L29_546(Ipv4firewallRulesTable, _UPVALUE1_, A25_542)
  L26_543 = L29_546
  if not L26_543 then
    L29_546 = returnCodes
    L29_546 = L29_546.COOKIEFAIL
    return L29_546
  end
  L29_546 = _UPVALUE2_
  if A9_526 ~= L29_546 then
    L29_546 = _UPVALUE3_
    if A9_526 ~= L29_546 then
      L29_546 = returnCodes
      L29_546 = L29_546.INVALID_ARGUMENT
      return L29_546, A25_542
    end
  end
  L29_546 = _UPVALUE4_
  if A1_518 ~= L29_546 then
    L29_546 = _UPVALUE5_
    if A1_518 ~= L29_546 then
      L29_546 = returnCodes
      L29_546 = L29_546.INVALID_ARGUMENT
      return L29_546
    end
  end
  L29_546 = _UPVALUE0_
  if A2_519 == L29_546 then
    L29_546 = returnCodes
    L29_546 = L29_546.INVALID_ARGUMENT
    return L29_546
  end
  L29_546 = db
  L29_546 = L29_546.existsRow
  L29_546 = L29_546("Services", "ServiceName", A2_519)
  L26_543 = L29_546
  if not L26_543 then
    L29_546 = returnCodes
    L29_546 = L29_546.INVALID_ARGUMENT
    return L29_546
  end
  if A0_517 == "SECURE_INSECURE" or A0_517 == "PUBLIC_INSECURE" then
    L29_546 = fw_qosPriorityValidation
    L29_546 = L29_546(A3_520)
    L26_543 = L29_546
    if not L26_543 then
      L29_546 = returnCodes
      L29_546 = L29_546.INVALID_ARGUMENT
      return L29_546
    end
  end
  L29_546 = fw_actionValidation
  L29_546 = L29_546(A4_521)
  L26_543 = L29_546
  if not L26_543 then
    L29_546 = returnCodes
    L29_546 = L29_546.INVALID_ARGUMENT
    return L29_546
  end
  if A4_521 == "DROP_BY_SCHED_MATCH" or A4_521 == "ACCEPT_BY_SCHED_MATCH" then
    L29_546 = _UPVALUE0_
    if A5_522 == L29_546 then
      L29_546 = returnCodes
      L29_546 = L29_546.INVALID_ARGUMENT
      return L29_546
    end
    L29_546 = db
    L29_546 = L29_546.existsRow
    L29_546 = L29_546("Schedules", "ScheduleName", A5_522)
    L26_543 = L29_546
    if not L26_543 then
      L29_546 = returnCodes
      L29_546 = L29_546.INVALID_ARGUMENT
      return L29_546
    end
  end
  L29_546 = fw_networkRangeValidation
  L29_546 = L29_546(A6_523, A7_524, A8_525, ipmode.ipv4)
  L26_543 = L29_546
  if not L26_543 then
    L29_546 = returnCodes
    L29_546 = L29_546.INVALID_ARGUMENT
    return L29_546
  end
  if A0_517 == "INSECURE_SECURE" or A0_517 == "INSECURE_PUBLIC" then
    L29_546 = db
    L29_546 = L29_546.getAttribute
    L29_546 = L29_546("NatTable", "_ROWID_", "1", "Enable")
    L28_545 = L29_546
  end
  L29_546 = returnCodes
  L29_546 = L29_546.NIL
  if L28_545 ~= L29_546 then
    L29_546 = _UPVALUE4_
    if L28_545 == L29_546 then
      L29_546 = returnCodes
      L29_546 = L29_546.NIL
      if A16_533 ~= L29_546 then
        L29_546 = db
        L29_546 = L29_546.getAttribute
        L29_546 = L29_546(NAT_TABLE, _UPVALUE6_, _UPVALUE7_, _UPVALUE8_)
        if L29_546 ~= returnCodes.NIL and (L29_546 == _UPVALUE9_ or L29_546 == A16_533) then
          L28_545 = _UPVALUE5_
        end
      end
    end
  end
  if A0_517 ~= "INSECURE_SECURE" and A0_517 ~= "INSECURE_PUBLIC" then
    L29_546 = fw_networkRangeValidation
    L29_546 = L29_546(A10_527, A11_528, A12_529, ipmode.ipv4)
    L26_543 = L29_546
    if not L26_543 then
      L29_546 = returnCodes
      L29_546 = L29_546.INVALID_ARGUMENT
      return L29_546
    end
  else
    L29_546 = _UPVALUE4_
    if L28_545 ~= L29_546 then
      L29_546 = fw_networkRangeValidation
      L29_546 = L29_546(A10_527, A11_528, A12_529, ipmode.ipv4)
      L26_543 = L29_546
      if not L26_543 then
        L29_546 = returnCodes
        L29_546 = L29_546.INVALID_ARGUMENT
        return L29_546
      end
    end
  end
  if A0_517 == "SECURE_INSECURE" or A0_517 == "PUBLIC_INSECURE" then
    L29_546 = fw_snatAddressType
    L29_546 = L29_546(A13_530, A15_532, A14_531)
    L26_543 = L29_546
    if not L26_543 then
      L29_546 = returnCodes
      L29_546 = L29_546.INVALID_ARGUMENT
      return L29_546
    end
  end
  if A0_517 == "INSECURE_SECURE" or A0_517 == "INSECURE_PUBLIC" then
    L29_546 = _UPVALUE4_
    if L28_545 == L29_546 then
      L29_546 = _UPVALUE0_
      if A16_533 == L29_546 then
        L29_546 = returnCodes
        L29_546 = L29_546.INVALID_ARGUMENT
        return L29_546
      end
      if A16_533 ~= "WAN1" and A16_533 ~= "WAN2" and A16_533 ~= "WAN3" and A16_533 ~= "OTHER" then
        L29_546 = returnCodes
        L29_546 = L29_546.INVALID_ARGUMENT
        return L29_546
      end
      if A17_534 ~= nil then
        L29_546 = ipv4Check
        L29_546 = L29_546(A17_534)
        L26_543 = L29_546
        if not L26_543 then
          L29_546 = returnCodes
          L29_546 = L29_546.INVALID_ARGUMENT
          return L29_546
        end
      end
      L29_546 = _UPVALUE10_
      if A4_521 ~= L29_546 then
        L29_546 = _UPVALUE0_
        if A18_535 == L29_546 then
          L29_546 = returnCodes
          L29_546 = L29_546.INVALID_ARGUMENT
          return L29_546
        end
        L29_546 = ipv4Check
        L29_546 = L29_546(A18_535)
        L26_543 = L29_546
        if not L26_543 then
          L29_546 = returnCodes
          L29_546 = L29_546.INVALID_ARGUMENT
          return L29_546
        end
      end
    end
  end
  L29_546 = _UPVALUE0_
  if A23_540 == L29_546 then
    L29_546 = returnCodes
    L29_546 = L29_546.INVALID_ARGUMENT
    return L29_546
  end
  L29_546 = _UPVALUE0_
  if A24_541 == L29_546 then
    L29_546 = returnCodes
    L29_546 = L29_546.INVALID_ARGUMENT
    return L29_546
  end
  if A18_535 == nil then
    A18_535 = ""
  end
  if A5_522 == nil then
    A5_522 = ""
  end
  L29_546 = nil
  L29_546 = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A25_542, "RuleType")
  if L29_546 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  if L29_546 ~= "SECURE_INSECURE" and L29_546 ~= "PUBLIC_INSECURE" and (A0_517 == "SECURE_INSECURE" or A0_517 == "PUBLIC_INSECURE") then
    if UNIT_NAME == "DSR-250N" or UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-150N" or UNIT_NAME == "DSR-150" then
      if #db.getRowsWhere(Ipv4firewallRulesTable, _UPVALUE11_ .. " and (ruleType == 'SECURE_INSECURE' or ruleType == 'PUBLIC_INSECURE')") >= 100 then
        return returnCodes.EXCEED_OUTBOUND_LIMIT
      end
    elseif #db.getRowsWhere(Ipv4firewallRulesTable, _UPVALUE11_ .. " and (ruleType == 'SECURE_INSECURE' or ruleType == 'PUBLIC_INSECURE')") >= 300 then
      return returnCodes.EXCEED_OUTBOUND_LIMIT
    end
  elseif L29_546 ~= "INSECURE_SECURE" and L29_546 ~= "INSECURE_PUBLIC" and (A0_517 == "INSECURE_SECURE" or A0_517 == "INSECURE_PUBLIC") then
    if UNIT_NAME == "DSR-250N" or UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-150N" or UNIT_NAME == "DSR-150" then
      if 100 <= #db.getRowsWhere(Ipv4firewallRulesTable, _UPVALUE11_ .. " and (ruleType == 'INSECURE_SECURE' or ruleType == 'INSECURE_PUBLIC')") then
        return returnCodes.EXCEED_INBOUND_LIMIT
      end
    elseif 300 <= #db.getRowsWhere(Ipv4firewallRulesTable, _UPVALUE11_ .. " and (ruleType == 'INSECURE_SECURE' or ruleType == 'INSECURE_PUBLIC')") then
      return returnCodes.EXCEED_INBOUND_LIMIT
    end
  end
  L27_544[Ipv4firewallRulesTable .. "." .. _UPVALUE12_.ruleType] = A0_517
  L27_544[Ipv4firewallRulesTable .. "." .. _UPVALUE12_.status] = A1_518
  L27_544[Ipv4firewallRulesTable .. "." .. _UPVALUE12_.serviceName] = A2_519
  L27_544[Ipv4firewallRulesTable .. "." .. _UPVALUE12_.typeOfService] = A3_520
  L27_544[Ipv4firewallRulesTable .. "." .. _UPVALUE12_.action] = A4_521
  L27_544[Ipv4firewallRulesTable .. "." .. _UPVALUE12_.scheduleName] = A5_522
  L27_544[Ipv4firewallRulesTable .. "." .. _UPVALUE12_.sourceAddressType] = A6_523
  L27_544[Ipv4firewallRulesTable .. "." .. _UPVALUE12_.sourceAddressStart] = A7_524
  L27_544[Ipv4firewallRulesTable .. "." .. _UPVALUE12_.sourceAddressEnd] = A8_525
  L27_544[Ipv4firewallRulesTable .. "." .. _UPVALUE12_.logStatus] = A9_526
  L27_544[Ipv4firewallRulesTable .. "." .. _UPVALUE12_.destinationAddressType] = A10_527
  L27_544[Ipv4firewallRulesTable .. "." .. _UPVALUE12_.destinationAddressStart] = A11_528
  L27_544[Ipv4firewallRulesTable .. "." .. _UPVALUE12_.destinationAddressEnd] = A12_529
  L27_544[Ipv4firewallRulesTable .. "." .. _UPVALUE12_.snatAddressType] = A13_530
  L27_544[Ipv4firewallRulesTable .. "." .. _UPVALUE12_.snatAddress] = A14_531
  L27_544[Ipv4firewallRulesTable .. "." .. _UPVALUE12_.snatInterface] = A15_532
  L27_544[Ipv4firewallRulesTable .. "." .. _UPVALUE12_.destinationPublicInterface] = A16_533
  L27_544[Ipv4firewallRulesTable .. "." .. _UPVALUE12_.destinationPublicAddress] = A17_534
  L27_544[Ipv4firewallRulesTable .. "." .. _UPVALUE12_.dnatAddress] = A18_535
  L27_544[Ipv4firewallRulesTable .. "." .. _UPVALUE12_.dnatPortEnable] = A19_536
  L27_544[Ipv4firewallRulesTable .. "." .. _UPVALUE12_.dnatPort] = A20_537
  L27_544[Ipv4firewallRulesTable .. "." .. _UPVALUE12_.fromZoneType] = A21_538
  L27_544[Ipv4firewallRulesTable .. "." .. _UPVALUE12_.toZoneType] = A22_539
  L27_544[Ipv4firewallRulesTable .. "." .. _UPVALUE12_.fromZoneVlanId] = A23_540
  L27_544[Ipv4firewallRulesTable .. "." .. _UPVALUE12_.toZoneVlanId] = A24_541
  rowId = db.getAttribute(Ipv4firewallRulesTable, _UPVALUE1_, A25_542, "_ROWID_")
  if rowId == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  status = db.update(Ipv4firewallRulesTable, L27_544, rowId)
  if not status then
    return returnCodes.FAILURE, A25_542
  end
  return returnCodes.SUCCESS, A25_542
end
function fw.firewallRules.Ipv4.SecureToInSecure.edit(A0_547, A1_548, A2_549, A3_550, A4_551, A5_552, A6_553, A7_554, A8_555, A9_556, A10_557, A11_558, A12_559, A13_560, A14_561, A15_562, A16_563, A17_564, A18_565)
  local L19_566, L20_567, L21_568, L22_569
  L22_569 = fw_zoneTypeValidation
  L22_569 = L22_569(A15_562, A16_563)
  L19_566 = L22_569
  if not L19_566 then
    L22_569 = returnCodes
    L22_569 = L22_569.INVALID_ARGUMENT
    return L22_569
  end
  L22_569 = A15_562
  L22_569 = L22_569 .. "_" .. A16_563
  L21_568 = fw.core.firewallRules.Ipv4.edit(L22_569, A1_548, A0_547, A2_549, A3_550, A4_551, A5_552, A6_553, A7_554, A8_555, A9_556, A10_557, A11_558, A12_559, A13_560, A14_561, nil, nil, nil, "0", nil, A15_562, A16_563, A17_564, _UPVALUE0_, A18_565)
  if L21_568 ~= returnCodes.SUCCESS then
    return L21_568, A18_565
  end
  return returnCodes.SUCCESS, A18_565
end
function fw.firewallRules.Ipv4.InSecureToSecure.edit(A0_570, A1_571, A2_572, A3_573, A4_574, A5_575, A6_576, A7_577, A8_578, A9_579, A10_580, A11_581, A12_582, A13_583, A14_584, A15_585, A16_586, A17_587, A18_588, A19_589)
  local L20_590, L21_591, L22_592, L23_593
  L23_593 = fw_zoneTypeValidation
  L23_593 = L23_593(A14_584, A15_585)
  L20_590 = L23_593
  if not L20_590 then
    L23_593 = returnCodes
    L23_593 = L23_593.INVALID_ARGUMENT
    return L23_593
  end
  L23_593 = A14_584
  L23_593 = L23_593 .. "_" .. A15_585
  L22_592 = fw.core.firewallRules.Ipv4.edit(L23_593, A1_571, A0_570, nil, A2_572, A3_573, A4_574, A5_575, A6_576, A7_577, A8_578, A9_579, A10_580, nil, nil, nil, A11_581, A12_582, A13_583, A17_587, A18_588, A14_584, A15_585, _UPVALUE0_, A16_586, A19_589)
  if L22_592 then
    return L22_592, A19_589
  end
  return returnCodes.SUCCESS, A19_589
end
function fw.firewallRules.Ipv4.SecureToPublic.edit(A0_594, A1_595, A2_596, A3_597, A4_598, A5_599, A6_600, A7_601, A8_602, A9_603, A10_604, A11_605, A12_606, A13_607, A14_608)
  local L15_609, L16_610, L17_611, L18_612
  L18_612 = fw_zoneTypeValidation
  L18_612 = L18_612(A11_605, A12_606)
  L15_609 = L18_612
  if not L15_609 then
    L18_612 = returnCodes
    L18_612 = L18_612.INVALID_ARGUMENT
    return L18_612
  end
  L18_612 = A11_605
  L18_612 = L18_612 .. "_" .. A12_606
  L17_611 = fw.core.firewallRules.Ipv4.edit(L18_612, A1_595, A0_594, nil, A2_596, A3_597, A4_598, A5_599, A6_600, A7_601, A8_602, A9_603, A10_604, nil, nil, nil, nil, nil, nil, _UPVALUE0_, nil, A11_605, A12_606, A13_607, _UPVALUE0_, A14_608)
  if L17_611 then
    return L17_611, A14_608
  end
  return returnCodes.SUCCESS, A14_608
end
function fw.firewallRules.Ipv4.PublicToSecure.edit(A0_613, A1_614, A2_615, A3_616, A4_617, A5_618, A6_619, A7_620, A8_621, A9_622, A10_623, A11_624, A12_625, A13_626, A14_627)
  local L15_628, L16_629, L17_630, L18_631
  L18_631 = fw_zoneTypeValidation
  L18_631 = L18_631(A11_624, A12_625)
  L15_628 = L18_631
  if not L15_628 then
    L18_631 = returnCodes
    L18_631 = L18_631.INVALID_ARGUMENT
    return L18_631
  end
  L18_631 = A11_624
  L18_631 = L18_631 .. "_" .. A12_625
  L17_630 = fw.core.firewallRules.Ipv4.edit(L18_631, A1_614, A0_613, nil, A2_615, A3_616, A4_617, A5_618, A6_619, A7_620, A8_621, A9_622, A10_623, nil, nil, nil, nil, nil, nil, _UPVALUE0_, nil, A11_624, A12_625, _UPVALUE0_, A13_626, A14_627)
  if L17_630 then
    return L17_630, A14_627
  end
  return returnCodes.SUCCESS, A14_627
end
function fw.firewallRules.Ipv4.PublicToInSecure.edit(A0_632, A1_633, A2_634, A3_635, A4_636, A5_637, A6_638, A7_639, A8_640, A9_641, A10_642, A11_643, A12_644, A13_645, A14_646, A15_647, A16_648, A17_649)
  local L18_650, L19_651, L20_652, L21_653
  L21_653 = fw_zoneTypeValidation
  L21_653 = L21_653(A15_647, A16_648)
  L18_650 = L21_653
  if not L18_650 then
    L21_653 = returnCodes
    L21_653 = L21_653.INVALID_ARGUMENT
    return L21_653
  end
  L21_653 = A15_647
  L21_653 = L21_653 .. "_" .. A16_648
  L20_652 = fw.core.firewallRules.Ipv4.edit(L21_653, A1_633, A0_632, A2_634, A3_635, A4_636, A5_637, A6_638, A7_639, A8_640, A9_641, A10_642, A11_643, A12_644, A13_645, A14_646, nil, nil, nil, "0", nil, A15_647, A16_648, _UPVALUE0_, _UPVALUE0_, A17_649)
  if L20_652 then
    return L20_652, A17_649
  end
  return returnCodes.SUCCESS, A17_649
end
function fw.firewallRules.Ipv4.InSecureToPublic.edit(A0_654, A1_655, A2_656, A3_657, A4_658, A5_659, A6_660, A7_661, A8_662, A9_663, A10_664, A11_665, A12_666, A13_667, A14_668, A15_669, A16_670, A17_671, A18_672)
  local L19_673, L20_674, L21_675, L22_676
  L22_676 = fw_zoneTypeValidation
  L22_676 = L22_676(A14_668, A15_669)
  L19_673 = L22_676
  if not L19_673 then
    L22_676 = returnCodes
    L22_676 = L22_676.INVALID_ARGUMENT
    return L22_676
  end
  L22_676 = A14_668
  L22_676 = L22_676 .. "_" .. A15_669
  L21_675 = fw.core.firewallRules.Ipv4.edit(L22_676, A1_655, A0_654, nil, A2_656, A3_657, A4_658, A5_659, A6_660, A7_661, A8_662, A9_663, A10_664, nil, nil, nil, A11_665, A12_666, A13_667, A16_670, A17_671, A14_668, A15_669, _UPVALUE0_, _UPVALUE0_, A18_672)
  if L21_675 then
    return L21_675, A18_672
  end
  return returnCodes.SUCCESS, A18_672
end
function fw.firewallRules.Ipv4.SecureToSecure.edit(A0_677, A1_678, A2_679, A3_680, A4_681, A5_682, A6_683, A7_684, A8_685, A9_686, A10_687, A11_688, A12_689, A13_690, A14_691, A15_692)
  local L16_693, L17_694, L18_695, L19_696
  L19_696 = fw_zoneTypeValidation
  L19_696 = L19_696(A11_688, A12_689)
  L16_693 = L19_696
  if not L16_693 then
    L19_696 = returnCodes
    L19_696 = L19_696.INVALID_ARGUMENT
    return L19_696
  end
  L19_696 = A11_688
  L19_696 = L19_696 .. "_" .. A12_689
  L18_695 = fw.core.firewallRules.Ipv4.edit(L19_696, A1_678, A0_677, nil, A2_679, A3_680, A4_681, A5_682, A6_683, A7_684, A8_685, A9_686, A10_687, nil, nil, nil, nil, nil, nil, _UPVALUE0_, nil, A11_688, A12_689, A13_690, A14_691, A15_692)
  if L18_695 then
    return L18_695, A15_692
  end
  return returnCodes.SUCCESS, A15_692
end
function fw.core.firewallRules.Ipv4.delete(A0_697)
  local L1_698, L2_699, L3_700
  if A0_697 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_698 = db.existsRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_697)
  if not L1_698 then
    return returnCodes.COOKIEFAIL
  end
  L3_700 = db.deleteRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_697)
  if not L3_700 then
    return returnCodes.FAILURE, A0_697
  end
  L3_700, errCode = rearrangePriorityIndex(A0_697, ipmode.ipv4)
  if L3_700 ~= returnCodes.SUCCESS then
    return returnCodes.FAILURE, A0_697
  end
  return returnCodes.SUCCESS, A0_697
end
function fw.core.firewallRules.Ipv4.deleteAll()
  local L0_701, L1_702
  L1_702 = db.deleteRowWhere(Ipv4firewallRulesTable, _UPVALUE0_)
  if not L1_702 then
    return returnCodes.FAILURE, cookie
  end
  L1_702, errCode = resetPriorityMap(ipmode.ipv4)
  if L1_702 ~= returnCodes.SUCCESS then
    return returnCodes.FAILURE, cookie
  end
  return returnCodes.SUCCESS, cookie
end
function fw.core.firewallRules.Ipv4.Get()
  local L0_703, L1_704, L2_705, L3_706, L4_707, L5_708, L6_709, L7_710, L8_711, L9_712, L10_713, L11_714, L12_715, L13_716, L14_717, L15_718, L16_719, L17_720, L18_721, L19_722, L20_723, L21_724, L22_725, L23_726, L24_727, L25_728
  L25_728 = {}
  L1_704, L0_703 = getFirstCookie(Ipv4firewallRulesTable, _UPVALUE0_, _UPVALUE1_)
  if returnCodes.SUCCESS ~= L1_704 then
    return L1_704
  end
  L25_728 = db.getRow(Ipv4firewallRulesTable, _UPVALUE0_, L0_703)
  if L25_728 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  L2_705 = L25_728[Ipv4firewallRulesTable .. "." .. _UPVALUE3_.serviceName]
  L3_706 = L25_728[Ipv4firewallRulesTable .. "." .. _UPVALUE3_.status]
  L4_707 = L25_728[Ipv4firewallRulesTable .. "." .. _UPVALUE3_.typeOfService]
  L5_708 = L25_728[Ipv4firewallRulesTable .. "." .. _UPVALUE3_.action]
  L6_709 = L25_728[Ipv4firewallRulesTable .. "." .. _UPVALUE3_.scheduleName]
  L7_710 = L25_728[Ipv4firewallRulesTable .. "." .. _UPVALUE3_.sourceAddressType]
  L8_711 = L25_728[Ipv4firewallRulesTable .. "." .. _UPVALUE3_.sourceAddressStart]
  L9_712 = L25_728[Ipv4firewallRulesTable .. "." .. _UPVALUE3_.sourceAddressEnd]
  L10_713 = L25_728[Ipv4firewallRulesTable .. "." .. _UPVALUE3_.logStatus]
  L11_714 = L25_728[Ipv4firewallRulesTable .. "." .. _UPVALUE3_.destinationAddressType]
  L12_715 = L25_728[Ipv4firewallRulesTable .. "." .. _UPVALUE3_.destinationAddressStart]
  L13_716 = L25_728[Ipv4firewallRulesTable .. "." .. _UPVALUE3_.destinationAddressEnd]
  L14_717 = L25_728[Ipv4firewallRulesTable .. "." .. _UPVALUE3_.snatAddressType]
  L15_718 = L25_728[Ipv4firewallRulesTable .. "." .. _UPVALUE3_.snatAddress]
  L16_719 = L25_728[Ipv4firewallRulesTable .. "." .. _UPVALUE3_.snatInterface]
  L17_720 = L25_728[Ipv4firewallRulesTable .. "." .. _UPVALUE3_.destinationPublicInterface]
  L18_721 = L25_728[Ipv4firewallRulesTable .. "." .. _UPVALUE3_.destinationPublicAddress]
  L19_722 = L25_728[Ipv4firewallRulesTable .. "." .. _UPVALUE3_.dnatAddress]
  L20_723 = L25_728[Ipv4firewallRulesTable .. "." .. _UPVALUE3_.fromZoneType]
  L21_724 = L25_728[Ipv4firewallRulesTable .. "." .. _UPVALUE3_.toZoneType]
  L22_725 = L25_728[Ipv4firewallRulesTable .. "." .. _UPVALUE3_.fromZoneVlanId]
  L23_726 = L25_728[Ipv4firewallRulesTable .. "." .. _UPVALUE3_.toZoneVlanId]
  L24_727 = L25_728[Ipv4firewallRulesTable .. "." .. _UPVALUE3_.priorityId]
  return returnCodes.SUCCESS, L0_703, L2_705, L3_706, L4_707, L5_708, L6_709, L7_710, L8_711, L9_712, L10_713, L11_714, L12_715, L13_716, L14_717, L15_718, L16_719, L17_720, L18_721, L19_722, L20_723, L21_724, L22_725, L23_726, L24_727
end
function fw.core.firewallRules.Ipv4.GetNext(A0_729)
  local L1_730, L2_731, L3_732, L4_733, L5_734, L6_735, L7_736, L8_737, L9_738, L10_739, L11_740, L12_741, L13_742, L14_743, L15_744, L16_745, L17_746, L18_747, L19_748, L20_749, L21_750, L22_751, L23_752, L24_753, L25_754
  L25_754 = {}
  if A0_729 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_730, rowId = getNextCookie(Ipv4firewallRulesTable, _UPVALUE1_, A0_729)
  if returnCodes.SUCCESS ~= L1_730 then
    return L1_730
  end
  L25_754 = db.getRow(Ipv4firewallRulesTable, _UPVALUE1_, rowId)
  if L25_754 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  L2_731 = L25_754[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.serviceName]
  L3_732 = L25_754[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.status]
  L4_733 = L25_754[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.typeOfService]
  L5_734 = L25_754[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.action]
  L6_735 = L25_754[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.scheduleName]
  L7_736 = L25_754[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.sourceAddressType]
  L8_737 = L25_754[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.sourceAddressStart]
  L9_738 = L25_754[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.sourceAddressEnd]
  L10_739 = L25_754[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.logStatus]
  L11_740 = L25_754[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.serviceName]
  L12_741 = L25_754[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.destinationAddressStart]
  L13_742 = L25_754[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.destinationAddressEnd]
  L14_743 = L25_754[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.snatAddressType]
  L15_744 = L25_754[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.snatAddress]
  L16_745 = L25_754[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.snatInterface]
  L17_746 = L25_754[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.destinationPublicInterface]
  L18_747 = L25_754[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.destinationPublicAddress]
  L19_748 = L25_754[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.dnatAddress]
  L20_749 = L25_754[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.fromZoneType]
  L21_750 = L25_754[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.toZoneType]
  L22_751 = L25_754[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.fromZoneVlanId]
  L23_752 = L25_754[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.toZoneVlanId]
  L24_753 = L25_754[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.priorityId]
  return returnCodes.SUCCESS, rowId, L2_731, L3_732, L4_733, L5_734, L6_735, L7_736, L8_737, L9_738, L10_739, L11_740, L12_741, L13_742, L14_743, L15_744, L16_745, L17_746, L18_747, L19_748, L20_749, L21_750, L22_751, L23_752, L24_753
end
function fw.core.firewallRules.Ipv4.rowGet(A0_755)
  local L1_756, L2_757, L3_758, L4_759, L5_760, L6_761, L7_762, L8_763, L9_764, L10_765, L11_766, L12_767, L13_768, L14_769, L15_770, L16_771, L17_772, L18_773, L19_774, L20_775, L21_776, L22_777, L23_778, L24_779, L25_780, L26_781, L27_782
  L27_782 = {}
  if A0_755 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L27_782 = db.getRow(Ipv4firewallRulesTable, _UPVALUE1_, A0_755)
  if L27_782 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  L2_757 = L27_782[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.serviceName]
  L3_758 = L27_782[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.status]
  L4_759 = L27_782[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.typeOfService]
  L5_760 = L27_782[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.action]
  L6_761 = L27_782[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.scheduleName]
  L7_762 = L27_782[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.sourceAddressType]
  L8_763 = L27_782[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.sourceAddressStart]
  L9_764 = L27_782[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.sourceAddressEnd]
  L10_765 = L27_782[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.logStatus]
  L11_766 = L27_782[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.destinationAddressType]
  L12_767 = L27_782[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.destinationAddressStart]
  L13_768 = L27_782[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.destinationAddressEnd]
  L14_769 = L27_782[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.snatAddressType]
  L15_770 = L27_782[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.snatAddress]
  L16_771 = L27_782[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.snatInterface]
  L17_772 = L27_782[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.destinationPublicInterface]
  L18_773 = L27_782[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.destinationPublicAddress]
  L19_774 = L27_782[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.dnatAddress]
  L20_775 = L27_782[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.fromZoneType]
  L21_776 = L27_782[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.toZoneType]
  L22_777 = L27_782[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.fromZoneVlanId]
  L23_778 = L27_782[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.toZoneVlanId]
  L24_779 = L27_782[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.priorityId]
  L25_780 = L27_782[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.dnatPortEnable]
  L26_781 = L27_782[Ipv4firewallRulesTable .. "." .. _UPVALUE2_.dnatPort]
  return returnCodes.SUCCESS, A0_755, L2_757, L3_758, L4_759, L5_760, L6_761, L7_762, L8_763, L9_764, L10_765, L11_766, L12_767, L13_768, L14_769, L15_770, L16_771, L17_772, L18_773, L19_774, L20_775, L21_776, L22_777, L23_778, L24_779, L25_780, L26_781
end
function fw.core.firewallRules.Ipv4.GetAll()
  local L0_783
  L0_783 = db
  L0_783 = L0_783.getRowsWhere
  L0_783 = L0_783(Ipv4firewallRulesTable, _UPVALUE0_)
  if L0_783 == _UPVALUE1_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_783
end
function fw.core.firewallRules.Ipv4.DisableAll()
  if db.setAttributeWhere(Ipv4firewallRulesTable, _UPVALUE0_, _UPVALUE1_.status, _UPVALUE2_) == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS
end
function fw.core.firewallRules.Ipv4.EnableAll()
  if db.setAttributeWhere(Ipv4firewallRulesTable, _UPVALUE0_, _UPVALUE1_.status, _UPVALUE2_) == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS
end
function fw.core.firewallRules.Ipv4.configPortIfNameGet()
  return db.getAttribute(ConfigPortTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.LogicalIfName) or ""
end
function fw.core.firewallRules.Ipv4.natModeInfoGet()
  return db.getAttribute(NAT_TABLE, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.Enable) or ""
end
function fw.core.firewallRules.Ipv4.natModeInfoGetRows()
  local L0_784
  L0_784 = returnCodes
  L0_784 = L0_784.FAILURE
  L0_784 = db.getRow(NAT_TABLE, _UPVALUE0_, "1")
  return L0_784
end
