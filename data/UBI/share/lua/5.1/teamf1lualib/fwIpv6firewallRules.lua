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
fw.core.firewallRules6 = {}
fw.core.firewallRules6.Ipv6 = {}
Ipv6firewallRulesTable = "FirewallRules6"
;({}).ruleType = "RuleType"
;({}).status = "Status"
;({}).serviceName = "ServiceName"
;({}).action = "Action"
;({}).scheduleName = "ScheduleName"
;({}).sourceAddressType = "SourceAddressType"
;({}).sourceAddressStart = "SourceAddressStart"
;({}).sourceAddressEnd = "SourceAddressEnd"
;({}).sourceAddressPrefixLength = "SourceAddressPrefixLength"
;({}).destinationAddressType = "DestinationAddressType"
;({}).destinationAddressStart = "DestinationAddressStart"
;({}).destinationAddressEnd = "DestinationAddressEnd"
;({}).destinationAddressPrefixLength = "DestinationAddressPrefixLength"
;({}).logLevel = "LogLevel"
;({}).ipv6HeaderType = "Ipv6HeaderType"
;({}).logPrefix = "LogPrefix"
;({}).fromZoneType = "FromZoneType"
;({}).toZoneType = "ToZoneType"
;({}).connectionState = "ConnectionState"
;({}).protocol = "Protocol"
;({}).priorityStr = "PriorityStr"
;({}).destinationPortStart = "DestinationPortStart"
;({}).destinationPortEnd = "DestinationPortEnd"
;({}).priorityId = "PriorityId"
;({}).Ipv6DefaultPolicyStatus = "DefaultPolicyStatus"
;({}).netWorkMode = "netWorkMode"
function fw.core.firewallRules6.Ipv6.serviceNameGet()
  local L0_1, L1_2, L2_3
  L1_2, L0_1 = getFirstCookie(Ipv6firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_2 then
    return L1_2
  end
  L2_3 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE0_, L0_1, _UPVALUE1_.serviceName)
  if ruleName == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_1, L2_3
end
function fw.core.firewallRules6.Ipv6.ModeInfo()
  local L0_4, L1_5
  L1_5 = db.getAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.netWorkMode) or ""
  if L1_5 == _UPVALUE4_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L1_5
end
function fw.core.firewallRules6.Ipv6.ipv6OutBoundPolicyGet()
  local L0_6, L1_7
  L1_7 = db.getRow(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_ + 1)
  if L1_7 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L1_7
end
function fw.core.firewallRules6.Ipv6.ipv6OutBoundPolicySet(A0_8)
  local L1_9, L2_10, L3_11
  L3_11 = db.getRow(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_ + 1)
  if L3_11 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  L3_11[_UPVALUE0_ .. "." .. _UPVALUE4_.Ipv6DefaultPolicyStatus] = A0_8
  L2_10 = db.update(_UPVALUE0_, L3_11, _UPVALUE2_ + 1)
  if not L2_10 then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_11
end
function fw.core.firewallRules6.Ipv6.serviceNameGetNext(A0_12)
  local L1_13, L2_14, L3_15
  if A0_12 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_13, L3_15 = getNextCookie(Ipv6firewallRulesTable, _UPVALUE1_, A0_12)
  if returnCodes.SUCCESS ~= L1_13 then
    return L1_13
  end
  L2_14 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE1_, L3_15, _UPVALUE2_.serviceName)
  if L2_14 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_15, L2_14
end
function fw.core.firewallRules6.Ipv6.serviceNameSet(A0_16, A1_17)
  local L2_18, L3_19, L4_20
  if A0_16 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_18 = db.existsRow(Ipv6firewallRulesTable, _UPVALUE1_, A0_16)
  if not L2_18 then
    return returnCodes.COOKIEFAIL
  end
  if A1_17 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_18 = db.existsRow("Services", "ServiceName", A1_17)
  if not L2_18 then
    return returnCodes.INVALID_ARGUMENT
  end
  L4_20 = db.setAttribute(Ipv6firewallRulesTable, _UPVALUE1_, A0_16, _UPVALUE2_.serviceName, A1_17)
  if not L4_20 then
    return returnCodes.FAILURE, A0_16
  end
  return returnCodes.SUCCESS, A0_16
end
function fw.core.firewallRules6.Ipv6.actionGet()
  local L0_21, L1_22, L2_23
  L1_22, L0_21 = getFirstCookie(Ipv6firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_22 then
    return L1_22
  end
  L2_23 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE0_, L0_21, _UPVALUE1_.action)
  if L2_23 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_21, L2_23
end
function fw.core.firewallRules6.Ipv6.actionGetNext(A0_24)
  local L1_25, L2_26, L3_27
  if A0_24 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_25, L3_27 = getNextCookie(Ipv6firewallRulesTable, _UPVALUE1_, A0_24)
  if returnCodes.SUCCESS ~= L1_25 then
    return L1_25
  end
  L2_26 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE1_, L3_27, _UPVALUE2_.action)
  if L2_26 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_27, L2_26
end
function fw.core.firewallRules6.Ipv6.actionSet(A0_28, A1_29)
  local L2_30, L3_31, L4_32
  if A0_28 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_30 = db.existsRow(Ipv6firewallRulesTable, _UPVALUE1_, A0_28)
  if not L2_30 then
    return returnCodes.COOKIEFAIL
  end
  L2_30 = fw_actionValidation(A1_29)
  if not L2_30 then
    return returnCodes.INVALID_ARGUMENT
  end
  L4_32 = db.setAttribute(Ipv6firewallRulesTable, _UPVALUE1_, A0_28, _UPVALUE2_.action, A1_29)
  if not L4_32 then
    return returnCodes.FAILURE, A0_28
  end
  return returnCodes.SUCCESS, A0_28
end
function fw.core.firewallRules6.Ipv6.scheduleNameGet()
  local L0_33, L1_34, L2_35
  L1_34, L0_33 = getFirstCookie(Ipv6firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_34 then
    return L1_34
  end
  L2_35 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE0_, L0_33, _UPVALUE1_.scheduleName)
  if L2_35 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_33, L2_35
end
function fw.core.firewallRules6.Ipv6.scheduleNameGetNext(A0_36)
  local L1_37, L2_38, L3_39
  if A0_36 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_37, L3_39 = getNextCookie(Ipv6firewallRulesTable, _UPVALUE1_, A0_36)
  if returnCodes.SUCCESS ~= L1_37 then
    return L1_37
  end
  L2_38 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE1_, L3_39, _UPVALUE2_.scheduleName)
  if L2_38 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_39, L2_38
end
function fw.core.firewallRules6.Ipv6.scheduleNameSet(A0_40, A1_41)
  local L2_42, L3_43, L4_44
  if A0_40 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_42 = db.existsRow(Ipv6firewallRulesTable, _UPVALUE1_, A0_40)
  if not L2_42 then
    return returnCodes.COOKIEFAIL
  end
  action = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE1_, A0_40, _UPVALUE2_.action)
  if action == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  if action == "DROP_BY_SCHED_MATCH" or action == "ACCEPT_BY_SCHED_MATCH" then
    if A1_41 == _UPVALUE0_ then
      return returnCodes.INVALID_ARGUMENT
    end
    L2_42 = db.existsRow("Schedule", "ScheduleName", A1_41)
    if not L2_42 then
      return returnCodes.COOKIEFAIL
    end
  end
  L4_44 = db.setAttribute(Ipv6firewallRulesTable, _UPVALUE1_, A0_40, _UPVALUE2_.scheduleName, A1_41)
  if not L4_44 then
    return returnCodes.FAILURE, A0_40
  end
  return returnCodes.SUCCESS, A0_40
end
function fw.core.firewallRules6.Ipv6.sourceAddressTypeGet()
  local L0_45, L1_46, L2_47
  L1_46, L0_45 = getFirstCookie(Ipv6firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_46 then
    return L1_46
  end
  L2_47 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE0_, L0_45, _UPVALUE1_.sourceAddressType)
  if L2_47 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_45, L2_47
end
function fw.core.firewallRules6.Ipv6.sourceAddressTypeGetNext(A0_48)
  local L1_49, L2_50, L3_51
  if A0_48 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_49, L3_51 = getNextCookie(Ipv6firewallRulesTable, _UPVALUE1_, A0_48)
  if returnCodes.SUCCESS ~= L1_49 then
    return L1_49
  end
  L2_50 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE1_, L3_51, _UPVALUE2_.sourceAddressType)
  if L2_50 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_51, L2_50
end
function fw.core.firewallRules6.Ipv6.sourceAddressTypeSet(A0_52, A1_53)
  local L2_54, L3_55, L4_56
  if A0_52 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_54 = db.existsRow(Ipv6firewallRulesTable, _UPVALUE1_, A0_52)
  if not L2_54 then
    return returnCodes.COOKIEFAIL
  end
  if A1_53 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, A0_52
  end
  L4_56 = db.setAttribute(Ipv6firewallRulesTable, _UPVALUE1_, A0_52, _UPVALUE2_.sourceAddressType, A1_53)
  if not L4_56 then
    return returnCodes.FAILURE, A0_52
  end
  return returnCodes.SUCCESS, A0_52
end
function fw.core.firewallRules6.Ipv6.sourceAddressstartGet()
  local L0_57, L1_58, L2_59
  L1_58, L0_57 = getFirstCookie(Ipv6firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_58 then
    return L1_58
  end
  L2_59 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE0_, L0_57, _UPVALUE1_.sourceAddressStart)
  if ruleName == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_57, L2_59
end
function fw.core.firewallRules6.Ipv6.sourceAddressstartGetNext(A0_60)
  local L1_61, L2_62, L3_63
  if A0_60 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_61, L3_63 = getNextCookie(Ipv6firewallRulesTable, _UPVALUE1_, A0_60)
  if returnCodes.SUCCESS ~= L1_61 then
    return L1_61
  end
  L2_62 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE1_, L3_63, _UPVALUE2_.sourceAddressStart)
  if L2_62 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_63, L2_62
end
function fw.core.firewallRules6.Ipv6.sourceAddressstartSet(A0_64, A1_65)
  local L2_66, L3_67, L4_68
  if A0_64 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_66 = db.existsRow(Ipv6firewallRulesTable, _UPVALUE1_, A0_64)
  if not L2_66 then
    return returnCodes.COOKIEFAIL
  end
  if A1_65 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, A0_64
  end
  L4_68 = db.setAttribute(Ipv6firewallRulesTable, _UPVALUE1_, A0_64, _UPVALUE2_.sourceAddressStart, A1_65)
  if not L4_68 then
    return returnCodes.FAILURE, A0_64
  end
  return returnCodes.SUCCESS, A0_64
end
function fw.core.firewallRules6.Ipv6.sourceAddressEndGet()
  local L0_69, L1_70, L2_71
  L1_70, L0_69 = getFirstCookie(Ipv6firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_70 then
    return L1_70
  end
  L2_71 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE0_, L0_69, _UPVALUE1_.sourceAddressEnd)
  if L2_71 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_69, L2_71
end
function fw.core.firewallRules6.Ipv6.sourceAddressEndGetNext(A0_72)
  local L1_73, L2_74, L3_75
  if A0_72 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_73, L3_75 = getNextCookie(Ipv6firewallRulesTable, _UPVALUE1_, A0_72)
  if returnCodes.SUCCESS ~= L1_73 then
    return L1_73
  end
  L2_74 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE1_, L3_75, _UPVALUE2_.sourceAddressEnd)
  if L2_74 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_75, L2_74
end
function fw.core.firewallRules6.Ipv6.sourceAddressEndSet(A0_76, A1_77)
  local L2_78, L3_79, L4_80
  if A0_76 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_78 = db.existsRow(Ipv6firewallRulesTable, _UPVALUE1_, A0_76)
  if not L2_78 then
    return returnCodes.COOKIEFAIL
  end
  if A1_77 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, A0_76
  end
  L4_80 = db.setAttribute(Ipv6firewallRulesTable, _UPVALUE1_, A0_76, _UPVALUE2_.sourceAddressEnd, A1_77)
  if not L4_80 then
    return returnCodes.FAILURE, A0_76
  end
  return returnCodes.SUCCESS, A0_76
end
function fw.core.firewallRules6.Ipv6.sourceAddressPrefixLengthGet()
  local L0_81, L1_82, L2_83
  L1_82, L0_81 = getFirstCookie(Ipv6firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_82 then
    return L1_82
  end
  L2_83 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE0_, L0_81, _UPVALUE1_.sourceAddressPrefixLength)
  if ruleName == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_81, L2_83
end
function fw.core.firewallRules6.Ipv6.sourceAddressPrefixLengthGetNext(A0_84)
  local L1_85, L2_86, L3_87
  if A0_84 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_85, L3_87 = getNextCookie(Ipv6firewallRulesTable, _UPVALUE1_, A0_84)
  if returnCodes.SUCCESS ~= L1_85 then
    return L1_85
  end
  L2_86 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE1_, L3_87, _UPVALUE2_.sourceAddressPrefixLength)
  if L2_86 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_87, L2_86
end
function fw.core.firewallRules6.Ipv6.sourceAddressPrefixLengthSet(A0_88, A1_89)
  local L2_90, L3_91, L4_92
  if A0_88 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_90 = db.existsRow(Ipv6firewallRulesTable, _UPVALUE1_, A0_88)
  if not L2_90 then
    return returnCodes.COOKIEFAIL
  end
  L4_92 = db.setAttribute(Ipv6firewallRulesTable, _UPVALUE1_, A0_88, _UPVALUE2_.sourceAddressPrefixLength, A1_89)
  if not L4_92 then
    return returnCodes.FAILURE, A0_88
  end
  return returnCodes.SUCCESS, A0_88
end
function fw.core.firewallRules6.Ipv6.destinationAddressTypeGet()
  local L0_93, L1_94, L2_95
  L1_94, L0_93 = getFirstCookie(Ipv6firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_94 then
    return L1_94
  end
  L2_95 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE0_, L0_93, _UPVALUE1_.destinationAddressType)
  if L2_95 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_93, L2_95
end
function fw.core.firewallRules6.Ipv6.destinationAddressTypeGetNext(A0_96)
  local L1_97, L2_98, L3_99
  if A0_96 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_97, L3_99 = getNextCookie(Ipv6firewallRulesTable, _UPVALUE1_, A0_96)
  if returnCodes.SUCCESS ~= L1_97 then
    return L1_97
  end
  L2_98 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE1_, L3_99, _UPVALUE2_.destinationAddressType)
  if L2_98 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_99, L2_98
end
function fw.core.firewallRules6.Ipv6.destinationAddressTypeSet(A0_100, A1_101)
  local L2_102, L3_103, L4_104
  if A0_100 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_102 = db.existsRow(Ipv6firewallRulesTable, _UPVALUE1_, A0_100)
  if not L2_102 then
    return returnCodes.COOKIEFAIL
  end
  if A1_101 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, A0_100
  end
  L4_104 = db.setAttribute(Ipv6firewallRulesTable, _UPVALUE1_, A0_100, _UPVALUE2_.destinationAddressType, A1_101)
  if not L4_104 then
    return returnCodes.FAILURE, A0_100
  end
  return returnCodes.SUCCESS, A0_100
end
function fw.core.firewallRules6.Ipv6.destinationAddressStartGet()
  local L0_105, L1_106, L2_107
  L1_106, L0_105 = getFirstCookie(Ipv6firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_106 then
    return L1_106
  end
  L2_107 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE0_, L0_105, _UPVALUE1_.destinationAddressStart)
  if L2_107 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_105, L2_107
end
function fw.core.firewallRules6.Ipv6.destinationAddressStartGetNext(A0_108)
  local L1_109, L2_110, L3_111
  if A0_108 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_109, L3_111 = getNextCookie(Ipv6firewallRulesTable, _UPVALUE1_, A0_108)
  if returnCodes.SUCCESS ~= L1_109 then
    return L1_109
  end
  L2_110 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE1_, L3_111, _UPVALUE2_.destinationAddressStart)
  if L2_110 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_111, L2_110
end
function fw.core.firewallRules6.Ipv6.destinationAddressStartSet(A0_112, A1_113)
  local L2_114, L3_115, L4_116
  if A0_112 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_114 = db.existsRow(Ipv6firewallRulesTable, _UPVALUE1_, A0_112)
  if not L2_114 then
    return returnCodes.COOKIEFAIL
  end
  if A1_113 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, A0_112
  end
  L4_116 = db.setAttribute(Ipv6firewallRulesTable, _UPVALUE1_, A0_112, _UPVALUE2_.destinationAddressStart, A1_113)
  if not L4_116 then
    return returnCodes.FAILURE, A0_112
  end
  return returnCodes.SUCCESS, A0_112
end
function fw.core.firewallRules6.Ipv6.destinationAddressEndGet()
  local L0_117, L1_118, L2_119
  L1_118, L0_117 = getFirstCookie(Ipv6firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_118 then
    return L1_118
  end
  L2_119 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE0_, L0_117, _UPVALUE1_.destinationAddressEnd)
  if L2_119 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_117, L2_119
end
function fw.core.firewallRules6.Ipv6.destinationAddressEndGetNext(A0_120)
  local L1_121, L2_122, L3_123
  if A0_120 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_121, L3_123 = getNextCookie(Ipv6firewallRulesTable, _UPVALUE1_, A0_120)
  if returnCodes.SUCCESS ~= L1_121 then
    return L1_121
  end
  L2_122 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE1_, L3_123, _UPVALUE2_.destinationAddressEnd)
  if L2_122 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_123, L2_122
end
function fw.core.firewallRules6.Ipv6.destinationAddressEndSet(A0_124, A1_125)
  local L2_126, L3_127, L4_128
  if A0_124 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_126 = db.existsRow(Ipv6firewallRulesTable, _UPVALUE1_, A0_124)
  if not L2_126 then
    return returnCodes.COOKIEFAIL
  end
  if A1_125 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, A0_124
  end
  L4_128 = db.setAttribute(Ipv6firewallRulesTable, _UPVALUE1_, A0_124, _UPVALUE2_.destinationAddressEnd, A1_125)
  if not L4_128 then
    return returnCodes.FAILURE, A0_124
  end
  return returnCodes.SUCCESS, A0_124
end
function fw.core.firewallRules6.Ipv6.destinationAddressPrefixLengthGet()
  local L0_129, L1_130, L2_131
  L1_130, L0_129 = getFirstCookie(Ipv6firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_130 then
    return L1_130
  end
  L2_131 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE0_, L0_129, _UPVALUE1_.destinationAddressPrefixLength)
  if L2_131 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_129, L2_131
end
function fw.core.firewallRules6.Ipv6.destinationAddressPrefixLengthGetNext(A0_132)
  local L1_133, L2_134, L3_135
  if A0_132 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_133, L3_135 = getNextCookie(Ipv6firewallRulesTable, _UPVALUE1_, A0_132)
  if returnCodes.SUCCESS ~= L1_133 then
    return L1_133
  end
  L2_134 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE1_, L3_135, _UPVALUE2_.destinationAddressPrefixLength)
  if L2_134 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_135, L2_134
end
function fw.core.firewallRules6.Ipv6.destinationAddressPrefixLengthSet(A0_136, A1_137)
  local L2_138, L3_139, L4_140
  if A0_136 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_138 = db.existsRow(Ipv6firewallRulesTable, _UPVALUE1_, A0_136)
  if not L2_138 then
    return returnCodes.COOKIEFAIL
  end
  L4_140 = db.setAttribute(Ipv6firewallRulesTable, _UPVALUE1_, A0_136, _UPVALUE2_.destinationAddressPrefixLength, A1_137)
  if not L4_140 then
    return returnCodes.FAILURE, A0_136
  end
  return returnCodes.SUCCESS, A0_136
end
function fw.core.firewallRules6.Ipv6.logLevelGet()
  local L0_141, L1_142, L2_143
  L1_142, L0_141 = getFirstCookie(Ipv6firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_142 then
    return L1_142
  end
  L2_143 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE0_, L0_141, _UPVALUE1_.logLevel)
  if L2_143 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_141, L2_143
end
function fw.core.firewallRules6.Ipv6.logLevelGetNext(A0_144)
  local L1_145, L2_146, L3_147
  if A0_144 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_145, L3_147 = getNextCookie(Ipv6firewallRulesTable, _UPVALUE1_, A0_144)
  if returnCodes.SUCCESS ~= L1_145 then
    return L1_145
  end
  L2_146 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE1_, L3_147, _UPVALUE2_.logLevel)
  if L2_146 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_147, L2_146
end
function fw.core.firewallRules6.Ipv6.logLevelSet(A0_148, A1_149)
  local L2_150, L3_151, L4_152
  if A0_148 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_150 = db.existsRow(Ipv6firewallRulesTable, _UPVALUE1_, A0_148)
  if not L2_150 then
    return returnCodes.COOKIEFAIL
  end
  L2_150 = booleanCheck(A1_149)
  if L2_150 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A0_148
  end
  L4_152 = db.setAttribute(Ipv6firewallRulesTable, _UPVALUE1_, A0_148, _UPVALUE2_.logLevel, A1_149)
  if not L4_152 then
    return returnCodes.FAILURE, A0_148
  end
  return returnCodes.SUCCESS, A0_148
end
function fw.core.firewallRules6.Ipv6.fromZoneTypeGet()
  local L0_153, L1_154, L2_155
  L1_154, L0_153 = getFirstCookie(Ipv6firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_154 then
    return L1_154
  end
  L2_155 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE0_, L0_153, _UPVALUE1_.fromZoneType)
  if L2_155 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_153, L2_155
end
function fw.core.firewallRules6.Ipv6.fromZoneTypeGetNext(A0_156)
  local L1_157, L2_158, L3_159
  if A0_156 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_157, L3_159 = getNextCookie(Ipv6firewallRulesTable, _UPVALUE1_, A0_156)
  if returnCodes.SUCCESS ~= L1_157 then
    return L1_157
  end
  L2_158 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE1_, L3_159, _UPVALUE2_.fromZoneType)
  if L2_158 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_159, L2_158
end
function fw.core.firewallRules6.Ipv6.fromZoneTypeSet(A0_160, A1_161)
  local L2_162, L3_163, L4_164, L5_165
  if A0_160 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_162 = db.existsRow(Ipv6firewallRulesTable, _UPVALUE1_, A0_160)
  if not L2_162 then
    return returnCodes.COOKIEFAIL
  end
  L5_165 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE1_, A0_160, _UPVALUE2_.toZoneType)
  if ruleType == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  L2_162 = fw_zoneTypeValidation(A1_161, L5_165)
  if not L2_162 then
    return returnCodes.INVALID_ARGUMENT
  end
  L4_164 = db.setAttribute(Ipv6firewallRulesTable, _UPVALUE1_, A0_160, _UPVALUE2_.fromZoneType, A1_161)
  if not L4_164 then
    return returnCodes.FAILURE, A0_160
  end
  return returnCodes.SUCCESS, A0_160
end
function fw.core.firewallRules6.Ipv6.toZoneTypeGet()
  local L0_166, L1_167, L2_168
  L1_167, L0_166 = getFirstCookie(Ipv6firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_167 then
    return L1_167
  end
  L2_168 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE0_, L0_166, _UPVALUE1_.toZoneType)
  if L2_168 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_166, L2_168
end
function fw.core.firewallRules6.Ipv6.toZoneTypeGetNext(A0_169)
  local L1_170, L2_171, L3_172
  if A0_169 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_170, L3_172 = getNextCookie(Ipv6firewallRulesTable, _UPVALUE1_, A0_169)
  if returnCodes.SUCCESS ~= L1_170 then
    return L1_170
  end
  L2_171 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE1_, L3_172, _UPVALUE2_.toZoneType)
  if L2_171 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_172, L2_171
end
function fw.core.firewallRules6.Ipv6.toZoneTypeSet(A0_173, A1_174)
  local L2_175, L3_176, L4_177
  if A0_173 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_175 = db.existsRow(Ipv6firewallRulesTable, _UPVALUE1_, A0_173)
  if not L2_175 then
    return returnCodes.COOKIEFAIL
  end
  A1_174 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE1_, A0_173, _UPVALUE2_.toZoneType)
  if ruleType == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  L2_175 = fw_zoneTypeValidation(fromZoneType, A1_174)
  if not L2_175 then
    return returnCodes.INVALID_ARGUMENT
  end
  L4_177 = db.setAttribute(Ipv6firewallRulesTable, _UPVALUE1_, A0_173, _UPVALUE2_.toZoneType, A1_174)
  if not L4_177 then
    return returnCodes.FAILURE, A0_173
  end
  return returnCodes.SUCCESS, A0_173
end
function fw.core.firewallRules6.Ipv6.Edit(A0_178, A1_179, A2_180, A3_181, A4_182, A5_183, A6_184, A7_185, A8_186, A9_187, A10_188, A11_189, A12_190, A13_191, A14_192)
  local L15_193, L16_194, L17_195, L18_196, L19_197, L20_198, L21_199
  L15_193 = returnCodes
  L15_193 = L15_193.NIL
  L16_194 = returnCodes
  L16_194 = L16_194.NIL
  L17_195 = returnCodes
  L17_195 = L17_195.NIL
  L18_196 = returnCodes
  L18_196 = L18_196.NIL
  L19_197 = returnCodes
  L19_197 = L19_197.NIL
  L20_198 = {}
  L21_199 = db
  L21_199 = L21_199.existsRow
  L21_199 = L21_199(Ipv6firewallRulesTable, _UPVALUE0_, tonumber(A14_192))
  L15_193 = L21_199
  if not L15_193 then
    L21_199 = returnCodes
    L21_199 = L21_199.COOKIEFAIL
    return L21_199
  end
  L21_199 = db
  L21_199 = L21_199.existsRow
  L21_199 = L21_199(_UPVALUE1_, _UPVALUE2_.serviceName, A2_180)
  L15_193 = L21_199
  if not L15_193 then
    L21_199 = returnCodes
    L21_199 = L21_199.INVALID_ARGUMENT
    return L21_199
  end
  L21_199 = _UPVALUE3_
  if A3_181 ~= L21_199 then
    L21_199 = _UPVALUE4_
  elseif A3_181 == L21_199 then
    L21_199 = db
    L21_199 = L21_199.existsRow
    L21_199 = L21_199(_UPVALUE5_, _UPVALUE2_.scheduleName, A4_182)
    L15_193 = L21_199
    if not L15_193 then
      L21_199 = returnCodes
      L21_199 = L21_199.INVALID_ARGUMENT
      return L21_199
    end
  end
  L21_199 = fw_zoneTypeValidation
  L21_199 = L21_199(A0_178, A1_179)
  L15_193 = L21_199
  if not L15_193 then
    L21_199 = returnCodes
    L21_199 = L21_199.INVALID_ARGUMENT
    return L21_199
  end
  L21_199 = A0_178
  L18_196 = L21_199 .. "_" .. A1_179
  L21_199 = nil
  L21_199 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE0_, A14_192, "RuleType")
  if L21_199 == _UPVALUE6_ then
    return returnCodes.FAILURE
  end
  if L21_199 ~= "SECURE_INSECURE" and L18_196 == "SECURE_INSECURE" then
    if #db.getRowsWhere(Ipv6firewallRulesTable, _UPVALUE7_ .. " and RuleType == 'SECURE_INSECURE'") >= 300 then
      return returnCodes.EXCEED_OUTBOUND_LIMIT
    end
  elseif L21_199 ~= "INSECURE_SECURE" and L18_196 == "INSECURE_SECURE" and 300 <= #db.getRowsWhere(Ipv6firewallRulesTable, _UPVALUE7_ .. " and RuleType == 'INSECURE_SECURE'") then
    return returnCodes.EXCEED_INBOUND_LIMIT
  end
  L20_198 = db.getRow(Ipv6firewallRulesTable, _UPVALUE0_, tonumber(A14_192))
  L20_198[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.fromZoneType] = A0_178
  L20_198[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.toZoneType] = A1_179
  L20_198[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.ruleType] = L18_196
  L20_198[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.serviceName] = A2_180
  L20_198[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.action] = A3_181
  if A3_181 == _UPVALUE3_ or A3_181 == _UPVALUE4_ then
    L20_198[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.scheduleName] = A4_182
  end
  L20_198[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.sourceAddressType] = A5_183
  L20_198[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.sourceAddressStart] = A6_184
  L20_198[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.sourceAddressEnd] = A7_185
  L20_198[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.sourceAddressPrefixLength] = A8_186
  L20_198[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.destinationAddressType] = A9_187
  L20_198[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.destinationAddressStart] = A10_188
  L20_198[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.destinationAddressEnd] = A11_189
  L20_198[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.destinationAddressPrefixLength] = A12_190
  L20_198[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.logLevel] = A13_191
  L19_197 = L20_198[Ipv6firewallRulesTable .. "." .. _UPVALUE8_]
  L15_193 = db.update(Ipv6firewallRulesTable, L20_198, L19_197)
  if not L15_193 then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS
end
function fw.core.firewallRules6.Ipv6.Add(A0_200, A1_201, A2_202, A3_203, A4_204, A5_205, A6_206, A7_207, A8_208, A9_209, A10_210, A11_211, A12_212, A13_213)
  local L14_214, L15_215, L16_216, L17_217, L18_218, L19_219, L20_220
  L14_214 = returnCodes
  L14_214 = L14_214.NIL
  L15_215 = returnCodes
  L15_215 = L15_215.NIL
  L16_216 = returnCodes
  L16_216 = L16_216.NIL
  L17_217 = returnCodes
  L17_217 = L17_217.NIL
  L18_218 = returnCodes
  L18_218 = L18_218.NIL
  L19_219 = {}
  L20_220 = db
  L20_220 = L20_220.existsRow
  L20_220 = L20_220(_UPVALUE0_, _UPVALUE1_.serviceName, A2_202)
  L14_214 = L20_220
  if not L14_214 then
    L20_220 = returnCodes
    L20_220 = L20_220.INVALID_ARGUMENT
    return L20_220
  end
  L20_220 = _UPVALUE2_
  if A3_203 ~= L20_220 then
    L20_220 = _UPVALUE3_
  elseif A3_203 == L20_220 then
    L20_220 = db
    L20_220 = L20_220.existsRow
    L20_220 = L20_220(_UPVALUE4_, _UPVALUE1_.scheduleName, A4_204)
    L14_214 = L20_220
    if not L14_214 then
      L20_220 = returnCodes
      L20_220 = L20_220.INVALID_ARGUMENT
      return L20_220
    end
  end
  L20_220 = fw_zoneTypeValidation
  L20_220 = L20_220(A0_200, A1_201)
  L14_214 = L20_220
  if not L14_214 then
    L20_220 = returnCodes
    L20_220 = L20_220.INVALID_ARGUMENT
    return L20_220
  end
  L20_220 = A0_200
  L18_218 = L20_220 .. "_" .. A1_201
  L20_220 = db
  L20_220 = L20_220.getRowsWhere
  L20_220 = L20_220(Ipv6firewallRulesTable, _UPVALUE5_)
  if #L20_220 >= 600 then
    return returnCodes.EXCEED_MAX_LIMIT
  elseif L18_218 == "SECURE_INSECURE" then
    L20_220 = db.getRowsWhere(Ipv6firewallRulesTable, _UPVALUE5_ .. " and RuleType == 'SECURE_INSECURE'")
    if #L20_220 >= 300 then
      return returnCodes.EXCEED_OUTBOUND_LIMIT
    end
  elseif L18_218 == "INSECURE_SECURE" then
    L20_220 = db.getRowsWhere(Ipv6firewallRulesTable, _UPVALUE5_ .. " and RuleType == 'INSECURE_SECURE'")
    if #L20_220 >= 300 then
      return returnCodes.EXCEED_INBOUND_LIMIT
    end
  end
  L19_219 = db.getDefaults(_UPVALUE6_, Ipv6firewallRulesTable)
  L19_219[Ipv6firewallRulesTable .. "." .. _UPVALUE1_.status] = _UPVALUE7_
  L19_219[Ipv6firewallRulesTable .. "." .. _UPVALUE1_.fromZoneType] = A0_200
  L19_219[Ipv6firewallRulesTable .. "." .. _UPVALUE1_.toZoneType] = A1_201
  L19_219[Ipv6firewallRulesTable .. "." .. _UPVALUE1_.ruleType] = L18_218
  L19_219[Ipv6firewallRulesTable .. "." .. _UPVALUE1_.serviceName] = A2_202
  L19_219[Ipv6firewallRulesTable .. "." .. _UPVALUE1_.action] = A3_203
  if A3_203 == _UPVALUE2_ or A3_203 == _UPVALUE3_ then
    L19_219[Ipv6firewallRulesTable .. "." .. _UPVALUE1_.scheduleName] = A4_204
  end
  L19_219[Ipv6firewallRulesTable .. "." .. _UPVALUE1_.sourceAddressType] = A5_205
  L19_219[Ipv6firewallRulesTable .. "." .. _UPVALUE1_.sourceAddressStart] = A6_206
  L19_219[Ipv6firewallRulesTable .. "." .. _UPVALUE1_.sourceAddressEnd] = A7_207
  L19_219[Ipv6firewallRulesTable .. "." .. _UPVALUE1_.sourceAddressPrefixLength] = A8_208
  L19_219[Ipv6firewallRulesTable .. "." .. _UPVALUE1_.destinationAddressType] = A9_209
  L19_219[Ipv6firewallRulesTable .. "." .. _UPVALUE1_.destinationAddressStart] = A10_210
  L19_219[Ipv6firewallRulesTable .. "." .. _UPVALUE1_.destinationAddressEnd] = A11_211
  L19_219[Ipv6firewallRulesTable .. "." .. _UPVALUE1_.destinationAddressPrefixLength] = A12_212
  L19_219[Ipv6firewallRulesTable .. "." .. _UPVALUE1_.logLevel] = A13_213
  L15_215 = newPriorityGet(ipmode.ipv6)
  L16_216 = L15_215
  L19_219[Ipv6firewallRulesTable .. "." .. _UPVALUE1_.priorityId] = L15_215
  L14_214 = db.insert(Ipv6firewallRulesTable, L19_219)
  if not L14_214 then
    return returnCodes.FAILURE
  end
  L14_214, errCode = updatePriorityMap(L16_216, ipmode.ipv6)
  if L14_214 == _UPVALUE8_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS
end
function fw.core.firewallRules6.Ipv6.delete(A0_221)
  local L1_222, L2_223, L3_224
  if A0_221 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_222 = db.existsRow(Ipv6firewallRulesTable, _UPVALUE1_, tonumber(A0_221))
  if not L1_222 then
    return returnCodes.COOKIEFAIL
  end
  L3_224 = db.deleteRow(Ipv6firewallRulesTable, _UPVALUE1_, tonumber(A0_221))
  if not L3_224 then
    return returnCodes.FAILURE, A0_221
  end
  L3_224, errCode = rearrangePriorityIndex(A0_221, ipmode.ipv6)
  if L3_224 ~= returnCodes.SUCCESS then
    return returnCodes.FAILURE, A0_221
  end
  return returnCodes.SUCCESS, A0_221
end
function fw.core.firewallRules6.Ipv6.deleteAll()
  local L0_225, L1_226
  L1_226 = db.deleteRowWhere(Ipv6firewallRulesTable, _UPVALUE0_)
  if not L1_226 then
    return returnCodes.FAILURE, cookie
  end
  L1_226, errCode = resetPriorityMap(ipmode.ipv6)
  if L1_226 ~= returnCodes.SUCCESS then
    return returnCodes.FAILURE, cookie
  end
  return returnCodes.SUCCESS, cookie
end
function fw.core.firewallRules6.Ipv6.Get()
  local L0_227, L1_228, L2_229, L3_230, L4_231, L5_232, L6_233, L7_234, L8_235, L9_236, L10_237, L11_238, L12_239, L13_240, L14_241, L15_242, L16_243, L17_244
  L17_244 = {}
  L1_228, L0_227 = getFirstCookie(Ipv6firewallRulesTable, _UPVALUE0_, _UPVALUE1_)
  if returnCodes.SUCCESS ~= L1_228 then
    return L1_228
  end
  L17_244 = db.getRow(Ipv6firewallRulesTable, _UPVALUE0_, L0_227)
  if L17_244 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  L2_229 = L17_244[Ipv6firewallRulesTable .. "." .. _UPVALUE3_.status]
  L3_230 = L17_244[Ipv6firewallRulesTable .. "." .. _UPVALUE3_.serviceName]
  L4_231 = L17_244[Ipv6firewallRulesTable .. "." .. _UPVALUE3_.action]
  L5_232 = L17_244[Ipv6firewallRulesTable .. "." .. _UPVALUE3_.scheduleName]
  L6_233 = L17_244[Ipv6firewallRulesTable .. "." .. _UPVALUE3_.sourceAddressType]
  L7_234 = L17_244[Ipv6firewallRulesTable .. "." .. _UPVALUE3_.sourceAddressStart]
  L8_235 = L17_244[Ipv6firewallRulesTable .. "." .. _UPVALUE3_.sourceAddressEnd]
  L9_236 = L17_244[Ipv6firewallRulesTable .. "." .. _UPVALUE3_.sourceAddressPrefixLength]
  L10_237 = L17_244[Ipv6firewallRulesTable .. "." .. _UPVALUE3_.destinationAddressType]
  L11_238 = L17_244[Ipv6firewallRulesTable .. "." .. _UPVALUE3_.destinationAddressStart]
  L12_239 = L17_244[Ipv6firewallRulesTable .. "." .. _UPVALUE3_.destinationAddressEnd]
  L13_240 = L17_244[Ipv6firewallRulesTable .. "." .. _UPVALUE3_.destinationAddressPrefixLength]
  L14_241 = L17_244[Ipv6firewallRulesTable .. "." .. _UPVALUE3_.logLevel]
  L15_242 = L17_244[Ipv6firewallRulesTable .. "." .. _UPVALUE3_.fromZoneType]
  L16_243 = L17_244[Ipv6firewallRulesTable .. "." .. _UPVALUE3_.toZoneType]
  return returnCodes.SUCCESS, L0_227, L2_229, L3_230, L4_231, L5_232, L6_233, L7_234, L8_235, L9_236, L10_237, L11_238, L12_239, L13_240, L13_240, L14_241, L15_242, L16_243
end
function fw.core.firewallRules6.Ipv6.GetNext(A0_245)
  local L1_246, L2_247, L3_248, L4_249, L5_250, L6_251, L7_252, L8_253, L9_254, L10_255, L11_256, L12_257, L13_258, L14_259, L15_260, L16_261, L17_262
  L17_262 = {}
  if A0_245 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_246, rowId = getNextCookie(Ipv6firewallRulesTable, _UPVALUE1_, A0_245)
  if returnCodes.SUCCESS ~= L1_246 then
    return L1_246
  end
  L17_262 = db.getRow(Ipv6firewallRulesTable, _UPVALUE1_, rowId)
  if L17_262 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  L2_247 = L17_262[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.status]
  L3_248 = L17_262[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.serviceName]
  L4_249 = L17_262[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.action]
  L5_250 = L17_262[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.scheduleName]
  L6_251 = L17_262[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.sourceAddressType]
  L7_252 = L17_262[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.sourceAddressStart]
  L8_253 = L17_262[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.sourceAddressEnd]
  L9_254 = L17_262[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.sourceAddressPrefixLength]
  L10_255 = L17_262[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.destinationAddressType]
  L11_256 = L17_262[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.destinationAddressStart]
  L12_257 = L17_262[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.destinationAddressEnd]
  L13_258 = L17_262[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.destinationAddressPrefixLength]
  L14_259 = L17_262[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.logLevel]
  L15_260 = L17_262[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.fromZoneType]
  L16_261 = L17_262[Ipv6firewallRulesTable .. "." .. _UPVALUE2_.toZoneType]
  return returnCodes.SUCCESS, rowId, L2_247, L3_248, L4_249, L5_250, L6_251, L7_252, L8_253, L9_254, L10_255, L11_256, L12_257, L13_258, L13_258, L14_259, L15_260, L16_261
end
function fw.core.firewallRules6.Ipv6.rowGet(A0_263)
  local L1_264, L2_265
  L2_265 = {}
  if A0_263 == "-1" then
    L2_265 = db.getDefaults(_UPVALUE0_, Ipv6firewallRulesTable)
    L2_265[Ipv6firewallRulesTable .. "." .. _UPVALUE1_.sourceAddressType] = "0"
    L2_265[Ipv6firewallRulesTable .. "." .. _UPVALUE1_.destinationAddressType] = "0"
    L2_265[Ipv6firewallRulesTable .. "." .. _UPVALUE1_.logLevel] = "1"
  else
    L2_265 = db.getRow(Ipv6firewallRulesTable, _UPVALUE2_, tonumber(A0_263))
  end
  if L2_265 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L2_265
end
function fw.core.firewallRules6.Ipv6.servicesInfoGetAll()
  local L0_266, L1_267
  L0_266 = {}
  L1_267 = returnCodes
  L1_267 = L1_267.FAILURE
  L0_266 = db.getTable(_UPVALUE0_)
  if L0_266 == returnCodes.NIL then
    return returnCodes.FAILURE, L0_266
  end
  L1_267 = returnCodes.SUCCESS
  return L1_267, L0_266
end
function fw.core.firewallRules6.Ipv6.schedulesInfoGetAll()
  local L0_268, L1_269
  L0_268 = {}
  L1_269 = returnCodes
  L1_269 = L1_269.FAILURE
  L0_268 = db.getTable(_UPVALUE0_)
  if L0_268 == returnCodes.NIL then
    return returnCodes.FAILURE, L0_268
  end
  L1_269 = returnCodes.SUCCESS
  return L1_269, L0_268
end
function fw.core.firewallRules6.Ipv6.GetAll()
  local L0_270, L1_271, L2_272, L3_273
  L0_270 = {}
  L1_271 = returnCodes
  L1_271 = L1_271.NIL
  L2_272 = returnCodes
  L2_272 = L2_272.NIL
  L3_273 = {}
  L3_273 = db.getRowsWhere(Ipv6firewallRulesTable, _UPVALUE0_)
  if L3_273 == _UPVALUE1_ then
    return returnCodes.FAILURE
  end
  L2_272 = db.getAttribute(_UPVALUE2_, _UPVALUE3_.ruleType, _UPVALUE4_, _UPVALUE3_.priorityStr) or ""
  if L2_272 == _UPVALUE1_ then
    return returnCodes.FAILURE
  end
  if L2_272 ~= "" then
    L1_271 = util.split(L2_272, ",")
    if L1_271 ~= _UPVALUE5_ and #L1_271 ~= 0 then
      for _FORV_8_, _FORV_9_ in pairs(L1_271) do
        for _FORV_13_, _FORV_14_ in pairs(L3_273) do
          tempVar = _FORV_14_[Ipv6firewallRulesTable .. "." .. _UPVALUE3_.priorityId]
          if tempVar == _FORV_9_ then
            L0_270[0 + 1] = _FORV_14_
            break
          end
        end
      end
    end
  end
  return returnCodes.SUCCESS, L0_270
end
function fw.core.firewallRules6.Ipv6.defaultPolicyGet()
  local L0_274, L1_275
  L1_275 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE0_.ruleType, _UPVALUE1_, _UPVALUE0_.action)
  if L1_275 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L1_275
end
function fw.core.firewallRules6.Ipv6.defaultPolicySet(A0_276)
  local L1_277, L2_278, L3_279
  if A0_276 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L3_279 = db.setAttribute(Ipv6firewallRulesTable, _UPVALUE1_.ruleType, _UPVALUE2_, _UPVALUE1_.action, A0_276)
  if not L3_279 then
    return returnCodes.FAILURE, cookie
  end
  return returnCodes.SUCCESS, cookie
end
function fw.core.firewallRules6.Ipv6.ruleTypeGet()
  local L0_280, L1_281, L2_282
  L1_281, L0_280 = getFirstCookie(Ipv6firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_281 then
    return L1_281
  end
  L2_282 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE0_, L0_280, _UPVALUE1_.ruleType)
  if L2_282 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_280, L2_282
end
function fw.core.firewallRules6.Ipv6.ruleTypeGetNext(A0_283)
  local L1_284, L2_285, L3_286
  if A0_283 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_284, L3_286 = getNextCookie(Ipv6firewallRulesTable, _UPVALUE1_, A0_283)
  if returnCodes.SUCCESS ~= L1_284 then
    return L1_284
  end
  L2_285 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE1_, L3_286, _UPVALUE2_.ruleType)
  if L2_285 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_286, L2_285
end
function fw.core.firewallRules6.Ipv6.ruleTypeSet(A0_287, A1_288)
  local L2_289, L3_290, L4_291
  if A0_287 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_289 = db.existsRow(Ipv6firewallRulesTable, _UPVALUE1_, A0_287)
  if not L2_289 then
    return returnCodes.COOKIEFAIL
  end
  if A1_288 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, A0_287
  end
  L4_291 = db.setAttribute(Ipv6firewallRulesTable, _UPVALUE1_, A0_287, _UPVALUE2_.ruleType, A1_288)
  if not L4_291 then
    return returnCodes.FAILURE, A0_287
  end
  return returnCodes.SUCCESS, A0_287
end
function fw.core.firewallRules6.Ipv6.ruleStatusGet()
  local L0_292, L1_293, L2_294
  L1_293, L0_292 = getFirstCookie(Ipv6firewallRulesTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_293 then
    return L1_293
  end
  L2_294 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE0_, L0_292, _UPVALUE1_.status)
  if L2_294 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_292, L2_294
end
function fw.core.firewallRules6.Ipv6.ruleTypeGetNext(A0_295)
  local L1_296, L2_297, L3_298
  if A0_295 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_296, L3_298 = getNextCookie(Ipv6firewallRulesTable, _UPVALUE1_, A0_295)
  if returnCodes.SUCCESS ~= L1_296 then
    return L1_296
  end
  L2_297 = db.getAttribute(Ipv6firewallRulesTable, _UPVALUE1_, L3_298, _UPVALUE2_.status)
  if L2_297 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_298, L2_297
end
function fw.core.firewallRules6.Ipv6.ruleStatusEnable(A0_299)
  local L1_300, L2_301, L3_302
  if A0_299 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_300 = db.existsRow(Ipv6firewallRulesTable, _UPVALUE1_, tonumber(A0_299))
  if not L1_300 then
    return returnCodes.COOKIEFAIL
  end
  L3_302 = db.setAttribute(Ipv6firewallRulesTable, _UPVALUE1_, A0_299, _UPVALUE2_.status, _UPVALUE3_)
  if not L3_302 then
    return returnCodes.FAILURE, A0_299
  end
  return returnCodes.SUCCESS, A0_299
end
function fw.core.firewallRules6.Ipv6.EnableAll()
  if db.setAttributeWhere(Ipv6firewallRulesTable, _UPVALUE0_, _UPVALUE1_.status, _UPVALUE2_) == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS
end
function fw.core.firewallRules6.Ipv6.ruleStatusDisable(A0_303)
  local L1_304, L2_305, L3_306
  if A0_303 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_304 = db.existsRow(Ipv6firewallRulesTable, _UPVALUE1_, tonumber(A0_303))
  if not L1_304 then
    return returnCodes.COOKIEFAIL
  end
  L3_306 = db.setAttribute(Ipv6firewallRulesTable, _UPVALUE1_, A0_303, _UPVALUE2_.status, _UPVALUE3_)
  if not L3_306 then
    return returnCodes.FAILURE, A0_303
  end
  return returnCodes.SUCCESS, A0_303
end
function fw.core.firewallRules6.Ipv6.DisableAll()
  if db.setAttributeWhere(Ipv6firewallRulesTable, _UPVALUE0_, _UPVALUE1_.status, _UPVALUE2_) == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS
end
