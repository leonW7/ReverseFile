local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/fwValidations")
L0_0 = "1"
fw.core.portTriggering = {}
fw.core.portTriggerStatus = {}
if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-1000N" or UNIT_NAME == "DSR-1000" then
elseif UNIT_NAME == "DSR-500AC" or UNIT_NAME == "DSR-500N" or UNIT_NAME == "DSR-500" then
elseif UNIT_NAME == "DSR-250N" or UNIT_NAME == "DSR-250" then
else
end
portTriggeringTable = "PortTriggering"
;({}).ruleName = "RuleName"
;({}).ruleStatus = "RuleStatus"
;({}).interface = "Interface"
;({}).protocol = "Protocol"
;({}).outgoingPortStart = "OutgoingPortStart"
;({}).outgoingPortEnd = "OutgoingPortEnd"
;({}).incomingPortStart = "IncomingPortStart"
;({}).incomingPortEnd = "IncomingPortEnd"
portTriggerStatusTable = "portTriggerStatus"
;({}).lanIpAddr = "LanIpAddr"
;({}).openPortRangeStart = "OpenPortRangeStart"
;({}).openPortRangeEnd = "OpenPortRangeEnd"
;({}).timeRemaining = "TimeRemaining"
function fw.core.portTriggering.ruleNameGet()
  local L0_1, L1_2, L2_3
  L1_2, L0_1 = getFirstCookie(portTriggeringTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_2 then
    return L1_2
  end
  L2_3 = db.getAttribute(portTriggeringTable, _UPVALUE0_, L0_1, _UPVALUE1_.ruleName)
  if L2_3 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_1, L2_3
end
function fw.core.portTriggering.ruleNameGetNext(A0_4)
  local L1_5, L2_6, L3_7
  if A0_4 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_5, L3_7 = getNextCookie(portTriggeringTable, _UPVALUE1_, A0_4)
  if returnCodes.SUCCESS ~= L1_5 then
    return L1_5
  end
  L2_6 = db.getAttribute(portTriggeringTable, _UPVALUE1_, L3_7, _UPVALUE2_.ruleName)
  if L2_6 == _UPVALUE0_ then
    return returnCodes.FAILURE, L3_7
  end
  return returnCodes.SUCCESS, L3_7, L2_6
end
function fw.core.portTriggering.ruleNameSet(A0_8, A1_9)
  local L2_10, L3_11, L4_12
  if A0_8 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_10 = db.existsRow(portTriggeringTable, _UPVALUE1_, A0_8)
  if not L2_10 then
    return returnCodes.COOKIEFAIL
  end
  L2_10 = fw_textValidation(A1_9)
  if L2_10 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A0_8
  end
  L4_12 = db.setAttribute(portTriggeringTable, _UPVALUE1_, A0_8, _UPVALUE2_.ruleName, A1_9)
  if not L4_12 then
    return returnCodes.FAILURE, A0_8
  end
  return returnCodes.SUCCESS, A0_8
end
function fw.core.portTriggering.ruleStatusGet()
  local L0_13, L1_14, L2_15
  L1_14, L0_13 = getFirstCookie(portTriggeringTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_14 then
    return L1_14
  end
  L2_15 = db.getAttribute(portTriggeringTable, _UPVALUE0_, L0_13, _UPVALUE1_.ruleStatus)
  if L2_15 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_13, L2_15
end
function fw.core.portTriggering.ruleStatusGetNext(A0_16)
  local L1_17, L2_18, L3_19
  if A0_16 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_17, L3_19 = getNextCookie(portTriggeringTable, _UPVALUE1_, A0_16)
  if returnCodes.SUCCESS ~= L1_17 then
    return L1_17
  end
  L2_18 = db.getAttribute(portTriggeringTable, _UPVALUE1_, L3_19, _UPVALUE2_.ruleStatus)
  if L2_18 == _UPVALUE0_ then
    return returnCodes.FAILURE, L3_19
  end
  return returnCodes.SUCCESS, L3_19, L2_18
end
function fw.core.portTriggering.ruleStatusSet(A0_20, A1_21)
  local L2_22, L3_23, L4_24
  if A0_20 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_22 = db.existsRow(portTriggeringTable, _UPVALUE1_, A0_20)
  if not L2_22 then
    return returnCodes.COOKIEFAIL
  end
  L2_22 = booleanCheck(A1_21)
  if L2_22 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A0_20
  end
  L4_24 = db.setAttribute(portTriggeringTable, _UPVALUE1_, A0_20, _UPVALUE2_.ruleStatus, A1_21)
  if not L4_24 then
    return returnCodes.FAILURE, A0_20
  end
  return returnCodes.SUCCESS, A0_20
end
function fw.core.portTriggering.interfaceGet()
  local L0_25, L1_26, L2_27
  L1_26, L0_25 = getFirstCookie(portTriggeringTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_26 then
    return L1_26
  end
  L2_27 = db.getAttribute(portTriggeringTable, _UPVALUE0_, L0_25, _UPVALUE1_.interface)
  if L2_27 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_25, L2_27
end
function fw.core.portTriggering.interfaceGetNext(A0_28)
  local L1_29, L2_30, L3_31
  if A0_28 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_29, L3_31 = getNextCookie(portTriggeringTable, _UPVALUE1_, A0_28)
  if returnCodes.SUCCESS ~= L1_29 then
    return L1_29
  end
  L2_30 = db.getAttribute(portTriggeringTable, _UPVALUE1_, L3_31, _UPVALUE2_.interface)
  if L2_30 == _UPVALUE0_ then
    return returnCodes.FAILURE, L3_31
  end
  return returnCodes.SUCCESS, L3_31, L2_30
end
function fw.core.portTriggering.interfaceSet(A0_32, A1_33)
  local L2_34, L3_35, L4_36
  if A0_32 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_34 = db.existsRow(portTriggeringTable, _UPVALUE1_, A0_32)
  if not L2_34 then
    return returnCodes.COOKIEFAIL
  end
  if A1_33 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, A0_32
  end
  if A1_33 ~= _UPVALUE2_.SECURE and A1_33 ~= _UPVALUE2_.PUBLIC then
    return returnCodes.INVALID_ARGUMENT, A0_32
  end
  L4_36 = db.setAttribute(portTriggeringTable, _UPVALUE1_, A0_32, _UPVALUE3_.interface, A1_33)
  if not L4_36 then
    return returnCodes.FAILURE, A0_32
  end
  return returnCodes.SUCCESS, A0_32
end
function fw.core.portTriggering.protocolGet()
  local L0_37, L1_38, L2_39
  L1_38, L0_37 = getFirstCookie(portTriggeringTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_38 then
    return L1_38
  end
  L2_39 = db.getAttribute(portTriggeringTable, _UPVALUE0_, L0_37, _UPVALUE1_.protocol)
  if L2_39 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_37, L2_39
end
function fw.core.portTriggering.protocolGetNext(A0_40)
  local L1_41, L2_42, L3_43
  if A0_40 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_41, L3_43 = getNextCookie(portTriggeringTable, _UPVALUE1_, A0_40)
  if returnCodes.SUCCESS ~= L1_41 then
    return L1_41
  end
  L2_42 = db.getAttribute(portTriggeringTable, _UPVALUE1_, L3_43, _UPVALUE2_.protocol)
  if L2_42 == _UPVALUE0_ then
    return returnCodes.FAILURE, L3_43
  end
  return returnCodes.SUCCESS, L3_43, L2_42
end
function fw.core.portTriggering.protocolSet(A0_44, A1_45)
  local L2_46, L3_47, L4_48
  if A0_44 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_46 = db.existsRow(portTriggeringTable, _UPVALUE1_, A0_44)
  if not L2_46 then
    return returnCodes.COOKIEFAIL
  end
  if A1_45 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, A0_44
  end
  if A1_45 ~= _UPVALUE2_.TCP and A1_45 ~= _UPVALUE2_.UDP then
    return returnCodes.INVALID_ARGUMENT, A0_44
  end
  L4_48 = db.setAttribute(portTriggeringTable, _UPVALUE1_, A0_44, _UPVALUE3_.protocol, A1_45)
  if not L4_48 then
    return returnCodes.FAILURE, A0_44
  end
  return returnCodes.SUCCESS, A0_44
end
function fw.core.portTriggering.outgoingPortStartGet()
  local L0_49, L1_50, L2_51
  L1_50, L0_49 = getFirstCookie(portTriggeringTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_50 then
    return L1_50
  end
  L2_51 = db.getAttribute(portTriggeringTable, _UPVALUE0_, L0_49, _UPVALUE1_.outgoingPortStart)
  if L2_51 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_49, L2_51
end
function fw.core.portTriggering.outgoingPortStartGetNext(A0_52)
  local L1_53, L2_54, L3_55
  if A0_52 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_53, L3_55 = getNextCookie(portTriggeringTable, _UPVALUE1_, A0_52)
  if returnCodes.SUCCESS ~= L1_53 then
    return L1_53
  end
  L2_54 = db.getAttribute(portTriggeringTable, _UPVALUE1_, L3_55, _UPVALUE2_.outgoingPortStart)
  if ruleName == _UPVALUE0_ then
    return returnCodes.FAILURE, L3_55
  end
  return returnCodes.SUCCESS, L3_55, L2_54
end
function fw.core.portTriggering.outgoingPortStartSet(A0_56, A1_57)
  local L2_58, L3_59, L4_60, L5_61, L6_62
  if A0_56 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_58 = db.existsRow(portTriggeringTable, _UPVALUE1_, A0_56)
  if not L2_58 then
    return returnCodes.COOKIEFAIL
  end
  L6_62 = db.getAttribute(portTriggeringTable, _UPVALUE1_, A0_56, _UPVALUE2_.outgoingPortEnd)
  L5_61, L6_62, L2_58 = fw_portValidation(_UPVALUE3_, _UPVALUE4_, A1_57, L6_62)
  if L2_58 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A0_56
  end
  L4_60 = db.setAttribute(portTriggeringTable, _UPVALUE1_, A0_56, _UPVALUE2_.outgoingPortStart, L5_61)
  if not L4_60 then
    return returnCodes.FAILURE, A0_56
  end
  return returnCodes.SUCCESS, A0_56
end
function fw.core.portTriggering.outgoingPortEndGet()
  local L0_63, L1_64, L2_65
  L1_64, L0_63 = getFirstCookie(portTriggeringTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_64 then
    return L1_64
  end
  L2_65 = db.getAttribute(portTriggeringTable, _UPVALUE0_, L0_63, _UPVALUE1_.outgoingPortEnd)
  if L2_65 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_63, L2_65
end
function fw.core.portTriggering.outgoingPortEndGetNext(A0_66)
  local L1_67, L2_68, L3_69
  if A0_66 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_67, L3_69 = getNextCookie(portTriggeringTable, _UPVALUE1_, A0_66)
  if returnCodes.SUCCESS ~= L1_67 then
    return L1_67
  end
  L2_68 = db.getAttribute(portTriggeringTable, _UPVALUE1_, L3_69, _UPVALUE2_.outgoingPortEnd)
  if L2_68 == _UPVALUE0_ then
    return returnCodes.FAILURE, L3_69
  end
  return returnCodes.SUCCESS, L3_69, L2_68
end
function fw.core.portTriggering.outgoingPortEndSet(A0_70, A1_71)
  local L2_72, L3_73, L4_74, L5_75, L6_76
  if A0_70 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_72 = db.existsRow(portTriggeringTable, _UPVALUE1_, A0_70)
  if not L2_72 then
    return returnCodes.COOKIEFAIL
  end
  L5_75 = db.getAttribute(portTriggeringTable, _UPVALUE1_, A0_70, _UPVALUE2_.outgoingPortStart)
  L5_75, L6_76, L2_72 = fw_portValidation(_UPVALUE3_, _UPVALUE4_, L5_75, A1_71)
  if L2_72 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A0_70
  end
  L4_74 = db.setAttribute(portTriggeringTable, _UPVALUE1_, A0_70, _UPVALUE2_.outgoingPortEnd, L6_76)
  if not L4_74 then
    return returnCodes.FAILURE, A0_70
  end
  return returnCodes.SUCCESS, A0_70
end
function fw.core.portTriggering.incomingPortStartGet()
  local L0_77, L1_78, L2_79
  L1_78, L0_77 = getFirstCookie(portTriggeringTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_78 then
    return L1_78
  end
  L2_79 = db.getAttribute(portTriggeringTable, _UPVALUE0_, L0_77, _UPVALUE1_.incomingPortStart)
  if L2_79 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_77, L2_79
end
function fw.core.portTriggering.incomingPortStartGetNext(A0_80)
  local L1_81, L2_82, L3_83
  if A0_80 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_81, L3_83 = getNextCookie(portTriggeringTable, _UPVALUE1_, A0_80)
  if returnCodes.SUCCESS ~= L1_81 then
    return L1_81
  end
  L2_82 = db.getAttribute(portTriggeringTable, _UPVALUE1_, L3_83, _UPVALUE2_.incomingPortStart)
  if L2_82 == _UPVALUE0_ then
    return returnCodes.FAILURE, L3_83
  end
  return returnCodes.SUCCESS, L3_83, L2_82
end
function fw.core.portTriggering.incomingPortStartSet(A0_84, A1_85)
  local L2_86, L3_87, L4_88, L5_89, L6_90
  if A0_84 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_86 = db.existsRow(portTriggeringTable, _UPVALUE1_, A0_84)
  if not L2_86 then
    return returnCodes.COOKIEFAIL
  end
  L6_90 = db.getAttribute(portTriggeringTable, _UPVALUE1_, A0_84, _UPVALUE2_.incomingPortEnd)
  L5_89, L6_90, L2_86 = fw_portValidation(_UPVALUE3_, _UPVALUE4_, A1_85, L6_90)
  if L2_86 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A0_84
  end
  L4_88 = db.setAttribute(portTriggeringTable, _UPVALUE1_, A0_84, _UPVALUE2_.incomingPortStart, L5_89)
  if not L4_88 then
    return returnCodes.FAILURE, A0_84
  end
  return returnCodes.SUCCESS, A0_84
end
function fw.core.portTriggering.incomingPortEndGet()
  local L0_91, L1_92, L2_93
  L1_92, L0_91 = getFirstCookie(portTriggeringTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_92 then
    return L1_92
  end
  L2_93 = db.getAttribute(portTriggeringTable, _UPVALUE0_, L0_91, _UPVALUE1_.incomingPortEnd)
  if L2_93 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_91, L2_93
end
function fw.core.portTriggering.incomingPortEndGetNext(A0_94)
  local L1_95, L2_96, L3_97
  if A0_94 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_95, L3_97 = getNextCookie(portTriggeringTable, _UPVALUE1_, A0_94)
  if returnCodes.SUCCESS ~= L1_95 then
    return L1_95
  end
  L2_96 = db.getAttribute(portTriggeringTable, _UPVALUE1_, L3_97, _UPVALUE2_.incomingPortEnd)
  if L2_96 == _UPVALUE0_ then
    return returnCodes.FAILURE, L3_97
  end
  return returnCodes.SUCCESS, L3_97, L2_96
end
function fw.core.portTriggering.incomingPortEndSet(A0_98, A1_99)
  local L2_100, L3_101, L4_102, L5_103, L6_104
  if A0_98 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_100 = db.existsRow(portTriggeringTable, _UPVALUE1_, A0_98)
  if not L2_100 then
    return returnCodes.COOKIEFAIL
  end
  L5_103 = db.getAttribute(portTriggeringTable, _UPVALUE1_, A0_98, _UPVALUE2_.incomingPortStart)
  L5_103, L6_104, L2_100 = fw_portValidation(_UPVALUE3_, _UPVALUE4_, L5_103, A1_99)
  if L2_100 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A0_98
  end
  L4_102 = db.setAttribute(portTriggeringTable, _UPVALUE1_, A0_98, _UPVALUE2_.incomingPortEnd, L6_104)
  if not L4_102 then
    return returnCodes.FAILURE, A0_98
  end
  return returnCodes.SUCCESS, A0_98
end
function fw.core.portTriggering.add(A0_105, A1_106, A2_107, A3_108, A4_109, A5_110, A6_111, A7_112)
  local L8_113, L9_114, L10_115, L11_116, L12_117, L13_118, L14_119, L15_120
  L9_114 = {}
  L10_115, L11_116, L12_117, L13_118, L14_119, L15_120 = nil, nil, nil, nil, nil, nil
  L8_113, L10_115 = fw_textValidation(A0_105, _UPVALUE0_, _UPVALUE0_)
  if L8_113 ~= returnCodes.SUCCESS then
    return L10_115, cookie
  end
  L8_113 = db.existsRow(portTriggeringTable, _UPVALUE1_, A0_105)
  if L8_113 then
    return fwReturnCodes.COMP_FIREWALL_APPLICATION_RULE_NAME_ALREADY_EXIT
  end
  L8_113 = booleanCheck(A1_106)
  if L8_113 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, cookie
  end
  if A2_107 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, cookie
  end
  if #db.getRowsWhere(portTriggeringTable, " ruleName is NOT NULL") >= _UPVALUE2_ then
    return returnCodes.EXCEED_MAX_PORTTRIGGER_LIMIT
  end
  if A2_107 ~= _UPVALUE3_.SECURE and A2_107 ~= _UPVALUE3_.PUBLIC then
    return returnCodes.INVALID_ARGUMENT, cookie
  end
  if A3_108 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, cookie
  end
  if A3_108 ~= _UPVALUE4_.TCP and A3_108 ~= _UPVALUE4_.UDP then
    return returnCodes.INVALID_ARGUMENT, cookie
  end
  L12_117, L13_118, L8_113 = fw_portValidation(_UPVALUE5_, _UPVALUE6_, A4_109, A5_110)
  if L8_113 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, cookie
  end
  L14_119, L15_120, L8_113 = fw_portValidation(_UPVALUE5_, _UPVALUE6_, A6_111, A7_112)
  if L8_113 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, cookie
  end
  L9_114[portTriggeringTable .. "." .. _UPVALUE7_.ruleName] = A0_105
  L9_114[portTriggeringTable .. "." .. _UPVALUE7_.ruleStatus] = A1_106
  L9_114[portTriggeringTable .. "." .. _UPVALUE7_.interface] = A2_107
  L9_114[portTriggeringTable .. "." .. _UPVALUE7_.protocol] = A3_108
  L9_114[portTriggeringTable .. "." .. _UPVALUE7_.outgoingPortStart] = L12_117
  L9_114[portTriggeringTable .. "." .. _UPVALUE7_.outgoingPortEnd] = L13_118
  L9_114[portTriggeringTable .. "." .. _UPVALUE7_.incomingPortStart] = L14_119
  L9_114[portTriggeringTable .. "." .. _UPVALUE7_.incomingPortEnd] = L15_120
  L8_113 = db.insert(portTriggeringTable, L9_114)
  if not L8_113 then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, A0_105
end
function fw.core.portTriggering.edit(A0_121, A1_122, A2_123, A3_124, A4_125, A5_126, A6_127, A7_128, A8_129)
  local L9_130, L10_131, L11_132, L12_133, L13_134, L14_135, L15_136, L16_137
  L10_131 = {}
  L11_132, L12_133, L13_134, L14_135, L15_136, L16_137 = nil, nil, nil, nil, nil, nil
  if A8_129 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L9_130 = db.existsRow(portTriggeringTable, "_ROWID_", A8_129)
  if not L9_130 then
    return returnCodes.COOKIEFAIL
  end
  L9_130 = fw_textValidation(A0_121, _UPVALUE0_, _UPVALUE0_)
  if L9_130 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A8_129
  end
  L9_130 = booleanCheck(A1_122)
  if L9_130 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A8_129
  end
  if A2_123 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, A8_129
  end
  if A2_123 ~= _UPVALUE1_.SECURE and A2_123 ~= _UPVALUE1_.PUBLIC then
    return returnCodes.INVALID_ARGUMENT, A8_129
  end
  if A3_124 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, A8_129
  end
  if A3_124 ~= _UPVALUE2_.TCP and A3_124 ~= _UPVALUE2_.UDP then
    return returnCodes.INVALID_ARGUMENT, A8_129
  end
  L13_134, L14_135, L9_130 = fw_portValidation(_UPVALUE3_, _UPVALUE4_, A4_125, A5_126)
  if L9_130 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A8_129
  end
  L15_136, L16_137, L9_130 = fw_portValidation(_UPVALUE3_, _UPVALUE4_, A6_127, A7_128)
  if L9_130 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A8_129
  end
  L10_131[portTriggeringTable .. "." .. _UPVALUE5_.ruleName] = A0_121
  L10_131[portTriggeringTable .. "." .. _UPVALUE5_.ruleStatus] = A1_122
  L10_131[portTriggeringTable .. "." .. _UPVALUE5_.interface] = A2_123
  L10_131[portTriggeringTable .. "." .. _UPVALUE5_.protocol] = A3_124
  L10_131[portTriggeringTable .. "." .. _UPVALUE5_.outgoingPortStart] = L13_134
  L10_131[portTriggeringTable .. "." .. _UPVALUE5_.outgoingPortEnd] = L14_135
  L10_131[portTriggeringTable .. "." .. _UPVALUE5_.incomingPortStart] = L15_136
  L10_131[portTriggeringTable .. "." .. _UPVALUE5_.incomingPortEnd] = L16_137
  L12_133 = db.update(portTriggeringTable, L10_131, A8_129)
  if not L12_133 then
    return returnCodes.FAILURE, A8_129
  end
  return returnCodes.SUCCESS, A8_129
end
function fw.core.portTriggering.delete(A0_138)
  local L1_139, L2_140, L3_141
  if A0_138 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_139 = db.existsRow(portTriggeringTable, "_ROWID_", A0_138)
  if not L1_139 then
    return returnCodes.COOKIEFAIL
  end
  L3_141 = db.deleteRow(portTriggeringTable, "_ROWID_", A0_138)
  if not L3_141 then
    return returnCodes.FAILURE, A0_138
  end
  return returnCodes.SUCCESS, A0_138
end
function fw.core.portTriggering.deleteAll()
  local L0_142
  L0_142 = db.deleteAllRows(portTriggeringTable)
  if not L0_142 then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS
end
function fw.core.portTriggering.Get()
  local L0_143, L1_144, L2_145, L3_146, L4_147, L5_148, L6_149, L7_150, L8_151, L9_152, L10_153
  L10_153 = {}
  L1_144, L0_143 = getFirstCookie(portTriggeringTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_144 then
    return L1_144
  end
  L10_153 = db.getRow(portTriggeringTable, _UPVALUE0_, L0_143)
  if L10_153 == _UPVALUE1_ then
    return returnCodes.FAILURE
  end
  L2_145 = L10_153[portTriggeringTable .. "." .. _UPVALUE2_.ruleName]
  L3_146 = L10_153[portTriggeringTable .. "." .. _UPVALUE2_.ruleStatus]
  L4_147 = L10_153[portTriggeringTable .. "." .. _UPVALUE2_.interface]
  L5_148 = L10_153[portTriggeringTable .. "." .. _UPVALUE2_.protocol]
  L6_149 = L10_153[portTriggeringTable .. "." .. _UPVALUE2_.outgoingPortStart]
  L7_150 = L10_153[portTriggeringTable .. "." .. _UPVALUE2_.outgoingPortEnd]
  L8_151 = L10_153[portTriggeringTable .. "." .. _UPVALUE2_.incomingPortStart]
  L9_152 = L10_153[portTriggeringTable .. "." .. _UPVALUE2_.incomingPortEnd]
  return returnCodes.SUCCESS, L0_143, L2_145, L3_146, L4_147, L5_148, L6_149, L7_150, L8_151, L9_152
end
function fw.core.portTriggering.GetNext(A0_154)
  local L1_155, L2_156, L3_157, L4_158, L5_159, L6_160, L7_161, L8_162, L9_163, L10_164
  L10_164 = {}
  if A0_154 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_155, rowId = getNextCookie(portTriggeringTable, _UPVALUE1_, A0_154)
  if returnCodes.SUCCESS ~= L1_155 then
    return L1_155
  end
  L10_164 = db.getRow(portTriggeringTable, _UPVALUE1_, rowId)
  if L10_164 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  L2_156 = L10_164[portTriggeringTable .. "." .. _UPVALUE2_.ruleName]
  L3_157 = L10_164[portTriggeringTable .. "." .. _UPVALUE2_.ruleStatus]
  L4_158 = L10_164[portTriggeringTable .. "." .. _UPVALUE2_.interface]
  L5_159 = L10_164[portTriggeringTable .. "." .. _UPVALUE2_.protocol]
  L6_160 = L10_164[portTriggeringTable .. "." .. _UPVALUE2_.outgoingPortStart]
  L7_161 = L10_164[portTriggeringTable .. "." .. _UPVALUE2_.outgoingPortEnd]
  L8_162 = L10_164[portTriggeringTable .. "." .. _UPVALUE2_.incomingPortStart]
  L9_163 = L10_164[portTriggeringTable .. "." .. _UPVALUE2_.incomingPortEnd]
  return returnCodes.SUCCESS, L2_156, L3_157, L4_158, L5_159, L6_160, L7_161, L8_162, L9_163
end
function fw.core.portTriggering.GetAll()
  local L0_165
  L0_165 = db
  L0_165 = L0_165.getTable
  L0_165 = L0_165(portTriggeringTable, false)
  if L0_165 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_165
end
function fw.core.portTriggering.rowGet(A0_166)
  local L1_167, L2_168, L3_169, L4_170, L5_171, L6_172, L7_173, L8_174, L9_175, L10_176
  L10_176 = {}
  L10_176 = db.getRow(portTriggeringTable, "_ROWID_", A0_166)
  if L10_176 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  L2_168 = L10_176[portTriggeringTable .. "." .. _UPVALUE1_.ruleName]
  L3_169 = L10_176[portTriggeringTable .. "." .. _UPVALUE1_.ruleStatus]
  L4_170 = L10_176[portTriggeringTable .. "." .. _UPVALUE1_.interface]
  L5_171 = L10_176[portTriggeringTable .. "." .. _UPVALUE1_.protocol]
  L6_172 = L10_176[portTriggeringTable .. "." .. _UPVALUE1_.outgoingPortStart]
  L7_173 = L10_176[portTriggeringTable .. "." .. _UPVALUE1_.outgoingPortEnd]
  L8_174 = L10_176[portTriggeringTable .. "." .. _UPVALUE1_.incomingPortStart]
  L9_175 = L10_176[portTriggeringTable .. "." .. _UPVALUE1_.incomingPortEnd]
  return returnCodes.SUCCESS, A0_166, L2_168, L3_169, L4_170, L5_171, L6_172, L7_173, L8_174, L9_175
end
function fw.core.portTriggerStatus.networkIpAddrGet()
  local L0_177, L1_178, L2_179
  L1_178, L0_177 = getFirstCookie(portTriggerStatusTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_178 then
    return L1_178
  end
  L2_179 = db.getAttribute(portTriggerStatusTable, _UPVALUE0_, L0_177, _UPVALUE1_.lanIpAddr)
  if L2_179 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_177, L2_179
end
function fw.core.portTriggerStatus.networkIpAddrGetNext(A0_180)
  local L1_181, L2_182, L3_183
  if A0_180 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_181, L3_183 = getNextCookie(portTriggerStatusTable, _UPVALUE1_, A0_180)
  if returnCodes.SUCCESS ~= L1_181 then
    return L1_181
  end
  L2_182 = db.getAttribute(portTriggerStatusTable, _UPVALUE1_, L3_183, _UPVALUE2_.lanIpAddr)
  if L2_182 == _UPVALUE0_ then
    return returnCodes.FAILURE, L3_183
  end
  return returnCodes.SUCCESS, L3_183, L2_182
end
function fw.core.portTriggerStatus.openPortRangeStartGet()
  local L0_184, L1_185, L2_186
  L1_185, L0_184 = getFirstCookie(portTriggerStatusTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_185 then
    return L1_185
  end
  L2_186 = db.getAttribute(portTriggerStatusTable, _UPVALUE0_, L0_184, _UPVALUE1_.openPortRangeStart)
  if L2_186 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_184, L2_186
end
function fw.core.portTriggerStatus.openPortRangeStartGetNext(A0_187)
  local L1_188, L2_189, L3_190
  if A0_187 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_188, L3_190 = getNextCookie(portTriggerStatusTable, _UPVALUE1_, A0_187)
  if returnCodes.SUCCESS ~= L1_188 then
    return L1_188
  end
  L2_189 = db.getAttribute(portTriggerStatusTable, _UPVALUE1_, L3_190, _UPVALUE2_.openPortRangeStart)
  if L2_189 == _UPVALUE0_ then
    return returnCodes.FAILURE, L3_190
  end
  return returnCodes.SUCCESS, L3_190, L2_189
end
function fw.core.portTriggerStatus.openPortRangeEndGet()
  local L0_191, L1_192, L2_193
  L1_192, L0_191 = getFirstCookie(portTriggerStatusTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_192 then
    return L1_192
  end
  L2_193 = db.getAttribute(portTriggerStatusTable, _UPVALUE0_, L0_191, _UPVALUE1_.openPortRangeEnd)
  if L2_193 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_191, L2_193
end
function fw.core.portTriggerStatus.openPortRangeEndGetNext(A0_194)
  local L1_195, L2_196, L3_197
  if A0_194 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_195, L3_197 = getNextCookie(portTriggerStatusTable, _UPVALUE1_, A0_194)
  if returnCodes.SUCCESS ~= L1_195 then
    return L1_195
  end
  L2_196 = db.getAttribute(portTriggerStatusTable, _UPVALUE1_, L3_197, _UPVALUE2_.openPortRangeEnd)
  if L2_196 == _UPVALUE0_ then
    return returnCodes.FAILURE, L3_197
  end
  return returnCodes.SUCCESS, L3_197, L2_196
end
function fw.core.portTriggerStatus.timeRemainingGet()
  local L0_198, L1_199, L2_200
  L1_199, L0_198 = getFirstCookie(portTriggerStatusTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_199 then
    return L1_199
  end
  L2_200 = db.getAttribute(portTriggerStatusTable, _UPVALUE0_, L0_198, _UPVALUE1_.timeRemaining)
  if L2_200 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_198, L2_200
end
function fw.core.portTriggerStatus.timeRemainingGetNext(A0_201)
  local L1_202, L2_203, L3_204
  if A0_201 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_202, L3_204 = getNextCookie(portTriggerStatusTable, _UPVALUE1_, A0_201)
  if returnCodes.SUCCESS ~= L1_202 then
    return L1_202
  end
  L2_203 = db.getAttribute(portTriggerStatusTable, _UPVALUE1_, L3_204, _UPVALUE2_.timeRemaining)
  if L2_203 == _UPVALUE0_ then
    return returnCodes.FAILURE, L3_204
  end
  return returnCodes.SUCCESS, L3_204, L2_203
end
function fw.core.portTriggerStatus.Get()
  local L0_205, L1_206, L2_207, L3_208, L4_209, L5_210, L6_211
  L6_211 = {}
  L1_206, L0_205 = getFirstCookie(portTriggerStatusTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_206 then
    return L1_206
  end
  L6_211 = db.getRow(portTriggerStatusTable, _UPVALUE0_, L0_205)
  if L6_211 == _UPVALUE1_ then
    return returnCodes.FAILURE
  end
  L2_207 = L6_211[portTriggerStatusTable .. "." .. _UPVALUE2_.lanIpAddr]
  L3_208 = L6_211[portTriggerStatusTable .. "." .. _UPVALUE2_.openPortRangeStart]
  L4_209 = L6_211[portTriggerStatusTable .. "." .. _UPVALUE2_.openPortRangeEnd]
  L5_210 = L6_211[portTriggerStatusTable .. "." .. _UPVALUE2_.timeRemaining]
  return returnCodes.SUCCESS, L0_205, L2_207, L3_208, L4_209, L5_210
end
function fw.core.portTriggerStatus.GetNext(A0_212)
  local L1_213, L2_214, L3_215, L4_216, L5_217, L6_218
  L6_218 = {}
  if A0_212 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_213, rowId = getNextCookie(portTriggerStatusTable, _UPVALUE1_, A0_212)
  if returnCodes.SUCCESS ~= L1_213 then
    return L1_213
  end
  L6_218 = db.getRow(portTriggerStatusTable, _UPVALUE1_, rowId)
  if L6_218 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  L2_214 = L6_218[portTriggerStatusTable .. "." .. _UPVALUE2_.lanIpAddr]
  L3_215 = L6_218[portTriggerStatusTable .. "." .. _UPVALUE2_.openPortRangeStart]
  L4_216 = L6_218[portTriggerStatusTable .. "." .. _UPVALUE2_.openPortRangeEnd]
  L5_217 = L6_218[portTriggerStatusTable .. "." .. _UPVALUE2_.timeRemaining]
  return returnCodes.SUCCESS, rowId, L2_214, L3_215, L4_216, L5_217
end
function fw.core.portTriggerStatus.rowGet(A0_219)
  local L1_220, L2_221, L3_222, L4_223, L5_224, L6_225
  L6_225 = {}
  L6_225 = db.getRow(portTriggerStatusTable, _UPVALUE0_, A0_219)
  if L6_225 == _UPVALUE1_ then
    return returnCodes.FAILURE
  end
  L2_221 = L6_225[portTriggerStatusTable .. "." .. _UPVALUE2_.lanIpAddr]
  L3_222 = L6_225[portTriggerStatusTable .. "." .. _UPVALUE2_.openPortRangeStart]
  L4_223 = L6_225[portTriggerStatusTable .. "." .. _UPVALUE2_.openPortRangeEnd]
  L5_224 = L6_225[portTriggerStatusTable .. "." .. _UPVALUE2_.timeRemaining]
  return returnCodes.SUCCESS, A0_219, L2_221, L3_222, L4_223, L5_224
end
function fw.core.portTriggerStatus.GetAll()
  local L0_226
  L0_226 = db
  L0_226 = L0_226.getTable
  L0_226 = L0_226(portTriggerStatusTable, false)
  if L0_226 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_226
end
function fw.core.portTriggering.snmpDelete(A0_227)
  local L1_228, L2_229, L3_230
  L2_229 = db.getAttribute(portTriggeringTable, _UPVALUE0_.ruleName, A0_227, "_ROWID_")
  if L2_229 == _UPVALUE1_ then
    return returnCodes.FAILURE
  end
  L1_228, L3_230 = fw.core.portTriggering.delete(L2_229)
  if L1_228 ~= returnCodes.SUCCESS then
    return returnCodes.FAILURE, curCookie
  end
  return returnCodes.SUCCESS, curCookie
end
