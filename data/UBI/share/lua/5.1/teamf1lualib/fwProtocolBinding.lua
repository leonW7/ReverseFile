local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/fwValidations")
L0_0 = require
L0_0("teamf1lualib/fwProtocolBindingValidation")
L0_0 = "1"
fw.core.protocolBinding = {}
protocolBindingTable = "ProtocolBinding"
;({}).serviceName = "ServiceName"
;({}).ruleStatus = "Enabled"
;({}).localGatewayType = "LocalGatewayType"
;({}).sourceNetworkType = "SourceNetworkType"
;({}).sourceNetworkStart = "SourceNetworkStart"
;({}).sourceNetworkEnd = "SourceNetworkEnd"
;({}).destinationNetworkType = "DestinationNetworkType"
;({}).destinationNetworkStart = "DestinationNetworkStart"
;({}).destinationNetworkEnd = "DestinationNetworkEnd"
function fw.core.protocolBinding.serviceNameGet()
  local L0_1, L1_2, L2_3
  L1_2, L0_1 = getFirstCookie(protocolBindingTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_2 then
    return L1_2
  end
  L2_3 = db.getAttribute(protocolBindingTable, _UPVALUE0_, L0_1, _UPVALUE1_.serviceName)
  if L2_3 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_1, L2_3
end
function fw.core.protocolBinding.serviceNameGetNext(A0_4)
  local L1_5, L2_6, L3_7
  if A0_4 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_5, L3_7 = getNextCookie(protocolBindingTable, _UPVALUE1_, A0_4)
  if returnCodes.SUCCESS ~= L1_5 then
    return L1_5
  end
  L2_6 = db.getAttribute(protocolBindingTable, _UPVALUE1_, L3_7, _UPVALUE2_.serviceName)
  if L2_6 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_7, L2_6
end
function fw.core.protocolBinding.serviceNameSet(A0_8, A1_9)
  local L2_10, L3_11, L4_12
  if A0_8 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_10 = db.existsRow(protocolBindingTable, _UPVALUE1_, A0_8)
  if not L2_10 then
    return returnCodes.COOKIEFAIL
  end
  if A1_9 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_10 = db.existsRow("Services", "ServiceName", A1_9)
  if not L2_10 then
    return returnCodes.INVALID_ARGUMENT
  end
  L4_12 = db.setAttribute(protocolBindingTable, _UPVALUE1_, A0_8, _UPVALUE2_.serviceName, A1_9)
  if not L4_12 then
    return returnCodes.FAILURE, A0_8
  end
  return returnCodes.SUCCESS, A0_8
end
function fw.core.protocolBinding.ruleStatusGet()
  local L0_13, L1_14, L2_15
  L1_14, L0_13 = getFirstCookie(protocolBindingTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_14 then
    return L1_14
  end
  L2_15 = db.getAttribute(protocolBindingTable, _UPVALUE0_, L0_13, _UPVALUE1_.ruleStatus)
  if L2_15 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_13, L2_15
end
function fw.core.protocolBinding.ruleStatusGetNext(A0_16)
  local L1_17, L2_18, L3_19
  if A0_16 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_17, L3_19 = getNextCookie(protocolBindingTable, _UPVALUE1_, A0_16)
  if returnCodes.SUCCESS ~= L1_17 then
    return L1_17
  end
  L2_18 = db.getAttribute(protocolBindingTable, _UPVALUE1_, L3_19, _UPVALUE2_.ruleStatus)
  if L2_18 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_19, L2_18
end
function fw.core.protocolBinding.ruleStatusSet(A0_20, A1_21)
  local L2_22, L3_23, L4_24
  if A0_20 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_22 = db.existsRow(protocolBindingTable, _UPVALUE1_, A0_20)
  if not L2_22 then
    return returnCodes.COOKIEFAIL
  end
  L2_22 = booleanCheck(A1_21)
  if L2_22 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A0_20
  end
  L4_24 = db.setAttribute(protocolBindingTable, _UPVALUE1_, A0_20, _UPVALUE2_.ruleStatus, A1_21)
  if not L4_24 then
    return returnCodes.FAILURE, A0_20
  end
  return returnCodes.SUCCESS, A0_20
end
function fw.core.protocolBinding.localGatewayTypeGet()
  local L0_25, L1_26, L2_27
  L1_26, L0_25 = getFirstCookie(protocolBindingTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_26 then
    return L1_26
  end
  L2_27 = db.getAttribute(protocolBindingTable, _UPVALUE0_, L0_25, _UPVALUE1_.localGatewayType)
  if L2_27 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_25, L2_27
end
function fw.core.protocolBinding.localGatewayTypeGetNext(A0_28)
  local L1_29, L2_30, L3_31
  if A0_28 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_29, L3_31 = getNextCookie(protocolBindingTable, _UPVALUE1_, A0_28)
  if returnCodes.SUCCESS ~= L1_29 then
    return L1_29
  end
  L2_30 = db.getAttribute(protocolBindingTable, _UPVALUE1_, L3_31, _UPVALUE2_.localGatewayType)
  if L2_30 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_31, L2_30
end
function fw.core.protocolBinding.localGatewayTypeSet(A0_32, A1_33)
  local L2_34, L3_35, L4_36
  if A0_32 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_34 = db.existsRow(protocolBindingTable, _UPVALUE1_, A0_32)
  if not L2_34 then
    return returnCodes.COOKIEFAIL
  end
  if A1_33 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  if A1_33 ~= "1" and A1_33 ~= "2" and A1_33 ~= "3" then
    return returnCodes.INVALID_ARGUMENT
  end
  L4_36 = db.setAttribute(protocolBindingTable, _UPVALUE1_, A0_32, _UPVALUE2_.localGatewayType, A1_33)
  if not L4_36 then
    return returnCodes.FAILURE, A0_32
  end
  return returnCodes.SUCCESS, A0_32
end
function fw.core.protocolBinding.sourceNetworkTypeGet()
  local L0_37, L1_38, L2_39
  L1_38, L0_37 = getFirstCookie(protocolBindingTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_38 then
    return L1_38
  end
  L2_39 = db.getAttribute(protocolBindingTable, _UPVALUE0_, L0_37, _UPVALUE1_.sourceNetworkType)
  if L2_39 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_37, L2_39
end
function fw.core.protocolBinding.sourceNetworkTypeGetNext(A0_40)
  local L1_41, L2_42, L3_43
  if A0_40 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_41, L3_43 = getNextCookie(protocolBindingTable, _UPVALUE1_, A0_40)
  if returnCodes.SUCCESS ~= L1_41 then
    return L1_41
  end
  L2_42 = db.getAttribute(protocolBindingTable, _UPVALUE1_, L3_43, _UPVALUE2_.sourceNetworkType)
  if L2_42 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_43, L2_42
end
function fw.core.protocolBinding.sourceNetworkTypeSet(A0_44, A1_45)
  local L2_46, L3_47, L4_48
  if A0_44 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_46 = db.existsRow(protocolBindingTable, _UPVALUE1_, A0_44)
  if not L2_46 then
    return returnCodes.COOKIEFAIL
  end
  if A1_45 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L4_48 = db.setAttribute(protocolBindingTable, _UPVALUE1_, A0_44, _UPVALUE2_.sourceNetworkType, A1_45)
  if not L4_48 then
    return returnCodes.FAILURE, A0_44
  end
  return returnCodes.SUCCESS, A0_44
end
function fw.core.protocolBinding.sourceNetworkStartGet()
  local L0_49, L1_50, L2_51
  L1_50, L0_49 = getFirstCookie(protocolBindingTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_50 then
    return L1_50
  end
  L2_51 = db.getAttribute(protocolBindingTable, _UPVALUE0_, L0_49, _UPVALUE1_.sourceNetworkStart)
  if L2_51 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_49, L2_51
end
function fw.core.protocolBinding.sourceNetworkStartGetNext(A0_52)
  local L1_53, L2_54, L3_55
  if A0_52 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_53, L3_55 = getNextCookie(protocolBindingTable, _UPVALUE1_, A0_52)
  if returnCodes.SUCCESS ~= L1_53 then
    return L1_53
  end
  L2_54 = db.getAttribute(protocolBindingTable, _UPVALUE1_, L3_55, _UPVALUE2_.sourceNetworkStart)
  if L2_54 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_55, L2_54
end
function fw.core.protocolBinding.sourceNetworkStartSet(A0_56, A1_57)
  local L2_58, L3_59, L4_60
  if A0_56 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_58 = db.existsRow(protocolBindingTable, _UPVALUE1_, A0_56)
  if not L2_58 then
    return returnCodes.COOKIEFAIL
  end
  if A1_57 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L4_60 = db.setAttribute(protocolBindingTable, _UPVALUE1_, A0_56, _UPVALUE2_.sourceNetworkStart, A1_57)
  if not L4_60 then
    return returnCodes.FAILURE, A0_56
  end
  return returnCodes.SUCCESS, A0_56
end
function fw.core.protocolBinding.sourceNetworkEndGet()
  local L0_61, L1_62, L2_63
  L1_62, L0_61 = getFirstCookie(protocolBindingTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_62 then
    return L1_62
  end
  L2_63 = db.getAttribute(protocolBindingTable, _UPVALUE0_, L0_61, _UPVALUE1_.sourceNetworkEnd)
  if L2_63 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_61, L2_63
end
function fw.core.protocolBinding.sourceNetworkEndGetNext(A0_64)
  local L1_65, L2_66, L3_67
  if A0_64 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_65, L3_67 = getNextCookie(protocolBindingTable, _UPVALUE1_, A0_64)
  if returnCodes.SUCCESS ~= L1_65 then
    return L1_65
  end
  L2_66 = db.getAttribute(protocolBindingTable, _UPVALUE1_, L3_67, _UPVALUE2_.sourceNetworkEnd)
  if L2_66 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_67, L2_66
end
function fw.core.protocolBinding.sourceNetworkEndSet(A0_68, A1_69)
  local L2_70, L3_71, L4_72
  if A0_68 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_70 = db.existsRow(protocolBindingTable, _UPVALUE1_, A0_68)
  if not L2_70 then
    return returnCodes.COOKIEFAIL
  end
  if A1_69 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L4_72 = db.setAttribute(protocolBindingTable, _UPVALUE1_, A0_68, _UPVALUE2_.sourceNetworkEnd, A1_69)
  if not L4_72 then
    return returnCodes.FAILURE, A0_68
  end
  return returnCodes.SUCCESS, A0_68
end
function fw.core.protocolBinding.destinationNetworkTypeGet()
  local L0_73, L1_74, L2_75
  L1_74, L0_73 = getFirstCookie(protocolBindingTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_74 then
    return L1_74
  end
  L2_75 = db.getAttribute(protocolBindingTable, _UPVALUE0_, L0_73, _UPVALUE1_.destinationNetworkType)
  if L2_75 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_73, L2_75
end
function fw.core.protocolBinding.destinationNetworkTypeGetNext(A0_76)
  local L1_77, L2_78, L3_79
  if A0_76 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_77, L3_79 = getNextCookie(protocolBindingTable, _UPVALUE1_, A0_76)
  if returnCodes.SUCCESS ~= L1_77 then
    return L1_77
  end
  L2_78 = db.getAttribute(protocolBindingTable, _UPVALUE1_, L3_79, _UPVALUE2_.destinationNetworkType)
  if L2_78 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_79, L2_78
end
function fw.core.protocolBinding.destinationNetworkTypeSet(A0_80, A1_81)
  local L2_82, L3_83, L4_84
  if A0_80 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_82 = db.existsRow(protocolBindingTable, _UPVALUE1_, A0_80)
  if not L2_82 then
    return returnCodes.COOKIEFAIL
  end
  if A1_81 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L4_84 = db.setAttribute(protocolBindingTable, _UPVALUE1_, A0_80, _UPVALUE2_.destinationNetworkType, A1_81)
  if not L4_84 then
    return returnCodes.FAILURE, A0_80
  end
  return returnCodes.SUCCESS, A0_80
end
function fw.core.protocolBinding.destinationNetworkStartGet()
  local L0_85, L1_86, L2_87
  L1_86, L0_85 = getFirstCookie(protocolBindingTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_86 then
    return L1_86
  end
  L2_87 = db.getAttribute(protocolBindingTable, _UPVALUE0_, L0_85, _UPVALUE1_.destinationNetworkStart)
  if L2_87 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_85, L2_87
end
function fw.core.protocolBinding.destinationNetworkStartGetNext(A0_88)
  local L1_89, L2_90, L3_91
  if A0_88 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_89, L3_91 = getNextCookie(protocolBindingTable, _UPVALUE1_, A0_88)
  if returnCodes.SUCCESS ~= L1_89 then
    return L1_89
  end
  L2_90 = db.getAttribute(protocolBindingTable, _UPVALUE1_, L3_91, _UPVALUE2_.destinationNetworkStart)
  if L2_90 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_91, L2_90
end
function fw.core.protocolBinding.destinationNetworkStartSet(A0_92, A1_93)
  local L2_94, L3_95, L4_96
  if A0_92 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_94 = db.existsRow(protocolBindingTable, _UPVALUE1_, A0_92)
  if not L2_94 then
    return returnCodes.COOKIEFAIL
  end
  if A1_93 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L4_96 = db.setAttribute(protocolBindingTable, _UPVALUE1_, A0_92, _UPVALUE2_.destinationNetworkStart, A1_93)
  if not L4_96 then
    return returnCodes.FAILURE, A0_92
  end
  return returnCodes.SUCCESS, A0_92
end
function fw.core.protocolBinding.destinationNetworkEndGet()
  local L0_97, L1_98, L2_99
  L1_98, L0_97 = getFirstCookie(protocolBindingTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_98 then
    return L1_98
  end
  L2_99 = db.getAttribute(protocolBindingTable, _UPVALUE0_, L0_97, _UPVALUE1_.destinationNetworkEnd)
  if L2_99 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_97, L2_99
end
function fw.core.protocolBinding.destinationNetworkEndGetNext(A0_100)
  local L1_101, L2_102, L3_103
  if A0_100 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_101, L3_103 = getNextCookie(protocolBindingTable, _UPVALUE1_, A0_100)
  if returnCodes.SUCCESS ~= L1_101 then
    return L1_101
  end
  L2_102 = db.getAttribute(protocolBindingTable, _UPVALUE1_, L3_103, _UPVALUE2_.destinationNetworkEnd)
  if L2_102 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_103, L2_102
end
function fw.core.protocolBinding.destinationNetworkEndSet(A0_104, A1_105)
  local L2_106, L3_107, L4_108
  if A0_104 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_106 = db.existsRow(protocolBindingTable, _UPVALUE1_, A0_104)
  if not L2_106 then
    return returnCodes.COOKIEFAIL
  end
  if A1_105 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L4_108 = db.setAttribute(protocolBindingTable, _UPVALUE1_, A0_104, _UPVALUE2_.destinationNetworkEnd, A1_105)
  if not L4_108 then
    return returnCodes.FAILURE, A0_104
  end
  return returnCodes.SUCCESS, A0_104
end
function fw.core.protocolBinding.add(A0_109, A1_110, A2_111, A3_112, A4_113, A5_114, A6_115, A7_116)
  local L8_117, L9_118, L10_119
  L10_119 = {}
  if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
  else
  end
  if db.getTable(protocolBindingTable, false) ~= nil and #db.getTable(protocolBindingTable, false) > 32 - 1 then
    return returnCodes.MAX_LIMIT_REACHED
  end
  if A0_109 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L8_117 = db.existsRow("Services", "ServiceName", A0_109)
  if not L8_117 then
    return returnCodes.INVALID_ARGUMENT
  end
  if A1_110 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  if A1_110 ~= "1" and A1_110 ~= "2" and A1_110 ~= "3" then
    return returnCodes.INVALID_ARGUMENT
  end
  L8_117 = fw_networkRangeValidation(A2_111, A3_112, A4_113)
  if not L8_117 then
    return returnCodes.INVALID_ARGUMENT
  end
  L8_117 = fw_networkRangeValidation(A5_114, A6_115, A7_116)
  if not L8_117 then
    return returnCodes.INVALID_ARGUMENT
  end
  L10_119[protocolBindingTable .. "." .. _UPVALUE1_.serviceName] = A0_109
  L10_119[protocolBindingTable .. "." .. _UPVALUE1_.ruleStatus] = _UPVALUE2_
  L10_119[protocolBindingTable .. "." .. _UPVALUE1_.localGatewayType] = A1_110
  L10_119[protocolBindingTable .. "." .. _UPVALUE1_.sourceNetworkType] = A2_111
  L10_119[protocolBindingTable .. "." .. _UPVALUE1_.sourceNetworkStart] = A3_112
  L10_119[protocolBindingTable .. "." .. _UPVALUE1_.sourceNetworkEnd] = A4_113
  L10_119[protocolBindingTable .. "." .. _UPVALUE1_.destinationNetworkType] = A5_114
  L10_119[protocolBindingTable .. "." .. _UPVALUE1_.destinationNetworkStart] = A6_115
  L10_119[protocolBindingTable .. "." .. _UPVALUE1_.destinationNetworkEnd] = A7_116
  L8_117, L9_118 = protocolBindingRuleValidation(L10_119, "add", "-1")
  if not L8_117 then
    return L9_118
  end
  L8_117 = db.insert(protocolBindingTable, L10_119)
  if not L8_117 then
    return returnCodes.FAILURE
  end
  cookie = db.getAttribute(protocolBindingTable, _UPVALUE1_.serviceName, A0_109, _UPVALUE3_)
  if cookie == _UPVALUE0_ then
    return returnCodes.COOKIEFAIL
  end
  return returnCodes.SUCCESS, cookie
end
function fw.core.protocolBinding.edit(A0_120, A1_121, A2_122, A3_123, A4_124, A5_125, A6_126, A7_127, A8_128, A9_129)
  local L10_130, L11_131, L12_132, L13_133, L14_134
  L12_132 = {}
  L13_133, L14_134 = nil, nil
  if A9_129 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L10_130 = db.existsRow(protocolBindingTable, _UPVALUE1_, A9_129)
  if not L10_130 then
    return returnCodes.COOKIEFAIL
  end
  if A0_120 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L10_130 = db.existsRow("Services", "ServiceName", A0_120)
  if not L10_130 then
    return returnCodes.INVALID_ARGUMENT
  end
  L10_130 = booleanCheck(A1_121)
  if L10_130 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A9_129
  end
  if A1_121 ~= _UPVALUE2_ then
    return returnCodes.INVALID_ARGUMENT
  end
  if A2_122 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  if A2_122 ~= "1" and A2_122 ~= "2" and A2_122 ~= "3" then
    return returnCodes.INVALID_ARGUMENT
  end
  L10_130 = fw_networkRangeValidation(A3_123, A4_124, A5_125)
  if not L10_130 then
    return returnCodes.INVALID_ARGUMENT
  end
  L10_130 = fw_networkRangeValidation(A6_126, A7_127, A8_128)
  if not L10_130 then
    return returnCodes.INVALID_ARGUMENT
  end
  L12_132[protocolBindingTable .. "." .. _UPVALUE3_.serviceName] = A0_120
  L12_132[protocolBindingTable .. "." .. _UPVALUE3_.ruleStatus] = A1_121
  L12_132[protocolBindingTable .. "." .. _UPVALUE3_.localGatewayType] = A2_122
  L12_132[protocolBindingTable .. "." .. _UPVALUE3_.sourceNetworkType] = A3_123
  L12_132[protocolBindingTable .. "." .. _UPVALUE3_.sourceNetworkStart] = A4_124
  L12_132[protocolBindingTable .. "." .. _UPVALUE3_.sourceNetworkEnd] = A5_125
  L12_132[protocolBindingTable .. "." .. _UPVALUE3_.destinationNetworkType] = A6_126
  L12_132[protocolBindingTable .. "." .. _UPVALUE3_.destinationNetworkStart] = A7_127
  L12_132[protocolBindingTable .. "." .. _UPVALUE3_.destinationNetworkEnd] = A8_128
  L10_130, L11_131 = protocolBindingRuleValidation(L12_132, "edit", A9_129)
  if not L10_130 then
    return L11_131
  end
  L14_134 = db.update(protocolBindingTable, L12_132, A9_129)
  if not L14_134 then
    return returnCodes.FAILURE, A9_129
  end
  return returnCodes.SUCCESS, A9_129
end
function fw.core.protocolBinding.delete(A0_135)
  local L1_136, L2_137, L3_138
  if A0_135 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_136 = db.existsRow(protocolBindingTable, _UPVALUE1_, A0_135)
  if not L1_136 then
    return returnCodes.COOKIEFAIL
  end
  L3_138 = db.deleteRow(protocolBindingTable, _UPVALUE1_, A0_135)
  if not L3_138 then
    return returnCodes.FAILURE, A0_135
  end
  return returnCodes.SUCCESS, A0_135
end
function fw.core.protocolBinding.deleteAll()
  local L0_139
  L0_139 = db.deleteAllRows(protocolBindingTable)
  if not L0_139 then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS
end
function fw.core.protocolBinding.Get()
  local L0_140, L1_141, L2_142, L3_143, L4_144, L5_145, L6_146, L7_147, L8_148, L9_149, L10_150, L11_151
  L11_151 = {}
  L1_141, L0_140 = getFirstCookie(protocolBindingTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_141 then
    return L1_141
  end
  L11_151 = db.getRow(protocolBindingTable, _UPVALUE0_, L0_140)
  if L11_151 == _UPVALUE1_ then
    return returnCodes.FAILURE
  end
  L2_142 = L11_151[protocolBindingTable .. "." .. _UPVALUE2_.serviceName]
  L3_143 = L11_151[protocolBindingTable .. "." .. _UPVALUE2_.ruleStatus]
  L4_144 = L11_151[protocolBindingTable .. "." .. _UPVALUE2_.localGatewayType]
  L5_145 = L11_151[protocolBindingTable .. "." .. _UPVALUE2_.sourceNetworkType]
  L6_146 = L11_151[protocolBindingTable .. "." .. _UPVALUE2_.sourceNetworkStart]
  L7_147 = L11_151[protocolBindingTable .. "." .. _UPVALUE2_.sourceNetworkEnd]
  L8_148 = L11_151[protocolBindingTable .. "." .. _UPVALUE2_.destinationNetworkType]
  L9_149 = L11_151[protocolBindingTable .. "." .. _UPVALUE2_.destinationNetworkStart]
  L10_150 = L11_151[protocolBindingTable .. "." .. _UPVALUE2_.destinationNetworkEnd]
  return returnCodes.SUCCESS, L0_140, L2_142, L3_143, L4_144, L5_145, L6_146, L7_147, L8_148, L9_149, L10_150
end
function fw.core.protocolBinding.GetNext(A0_152)
  local L1_153, L2_154, L3_155, L4_156, L5_157, L6_158, L7_159, L8_160, L9_161, L10_162
  L10_162 = {}
  if A0_152 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_153, rowId = getNextCookie(protocolBindingTable, _UPVALUE1_, A0_152)
  if returnCodes.SUCCESS ~= L1_153 then
    return L1_153
  end
  L10_162 = db.getRow(protocolBindingTable, _UPVALUE1_, rowId)
  if L10_162 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  serviceName = L10_162[protocolBindingTable .. "." .. _UPVALUE2_.serviceName]
  L3_155 = L10_162[protocolBindingTable .. "." .. _UPVALUE2_.ruleStatus]
  localGatewayType = L10_162[protocolBindingTable .. "." .. _UPVALUE2_.localGatewayType]
  sourceNetworkType = L10_162[protocolBindingTable .. "." .. _UPVALUE2_.sourceNetworkType]
  sourceNetworkStart = L10_162[protocolBindingTable .. "." .. _UPVALUE2_.sourceNetworkStart]
  sourceNetworkEnd = L10_162[protocolBindingTable .. "." .. _UPVALUE2_.sourceNetworkEnd]
  destinationNetworkType = L10_162[protocolBindingTable .. "." .. _UPVALUE2_.destinationNetworkType]
  destinationNetworkStart = L10_162[protocolBindingTable .. "." .. _UPVALUE2_.destinationNetworkStart]
  destinationNetworkEnd = L10_162[protocolBindingTable .. "." .. _UPVALUE2_.destinationNetworkEnd]
  return returnCodes.SUCCESS, rowId, serviceName, L3_155, localGatewayType, sourceNetworkType, sourceNetworkStart, sourceNetworkEnd, destinationNetworkType, destinationNetworkStart, destinationNetworkEnd
end
function fw.core.protocolBinding.rowGet(A0_163)
  local L1_164, L2_165, L3_166, L4_167, L5_168, L6_169, L7_170, L8_171, L9_172, L10_173, L11_174
  L11_174 = {}
  if A0_163 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L11_174 = db.getRow(protocolBindingTable, _UPVALUE1_, A0_163)
  if L11_174 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  L2_165 = L11_174[protocolBindingTable .. "." .. _UPVALUE2_.serviceName]
  L3_166 = L11_174[protocolBindingTable .. "." .. _UPVALUE2_.ruleStatus]
  L4_167 = L11_174[protocolBindingTable .. "." .. _UPVALUE2_.localGatewayType]
  L5_168 = L11_174[protocolBindingTable .. "." .. _UPVALUE2_.sourceNetworkType]
  L6_169 = L11_174[protocolBindingTable .. "." .. _UPVALUE2_.sourceNetworkStart]
  L7_170 = L11_174[protocolBindingTable .. "." .. _UPVALUE2_.sourceNetworkEnd]
  L8_171 = L11_174[protocolBindingTable .. "." .. _UPVALUE2_.destinationNetworkType]
  L9_172 = L11_174[protocolBindingTable .. "." .. _UPVALUE2_.destinationNetworkStart]
  L10_173 = L11_174[protocolBindingTable .. "." .. _UPVALUE2_.destinationNetworkEnd]
  return returnCodes.SUCCESS, A0_163, L2_165, L3_166, L4_167, L5_168, L6_169, L7_170, L8_171, L9_172, L10_173
end
function fw.core.protocolBinding.GetAll()
  local L0_175
  L0_175 = db
  L0_175 = L0_175.getTable
  L0_175 = L0_175(protocolBindingTable, false)
  if L0_175 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_175
end
function fw.core.protocolBinding.EnableAll()
  local L0_176
  L0_176 = _UPVALUE0_
  L0_176 = L0_176.ruleStatus
  L0_176 = L0_176 .. "=='" .. _UPVALUE1_ .. "'"
  if db.setAttributeWhere(protocolBindingTable, L0_176, _UPVALUE0_.ruleStatus, _UPVALUE2_) == returnCodes.NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS
end
function fw.core.protocolBinding.DisableAll()
  local L0_177
  L0_177 = _UPVALUE0_
  L0_177 = L0_177.ruleStatus
  L0_177 = L0_177 .. "=='" .. _UPVALUE1_ .. "'"
  if db.setAttributeWhere(protocolBindingTable, L0_177, _UPVALUE0_.ruleStatus, _UPVALUE2_) == returnCodes.NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS
end
