local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/fwValidations")
L0_0 = "1"
fw.core.services = {}
servicesTable = "Services"
;({}).serviceName = "ServiceName"
;({}).protocol = "Protocol"
;({}).destinationPortStart = "DestinationPortStart"
;({}).destinationPortEnd = "DestinationPortEnd"
;({}).typeOfService = "TypeOfService"
;({}).isDefault = "IsDefault"
;({}).multiPort = "MultiPort"
;({}).portType = "PortType"
;({}).sourcePortStart = "SourcePortStart"
;({}).sourcePortEnd = "SourcePortEnd"
;({}).sourcemultiPort = "SourceMultiPort"
function fw.core.services.serviceNameGet()
  local L0_1, L1_2, L2_3
  L1_2, L0_1 = getFirstCookie(servicesTable, _UPVALUE0_, _UPVALUE1_)
  if returnCodes.SUCCESS ~= L1_2 then
    return L1_2
  end
  L2_3 = db.getAttribute(servicesTable, _UPVALUE0_, L0_1, _UPVALUE2_.serviceName)
  if L2_3 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_1, L2_3
end
function fw.core.services.serviceNameGetNext(A0_4)
  local L1_5, L2_6, L3_7
  if A0_4 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_5, L3_7 = getNextCookie(servicesTable, _UPVALUE1_, A0_4)
  if returnCodes.SUCCESS ~= L1_5 then
    return L1_5
  end
  L2_6 = db.getAttribute(servicesTable, _UPVALUE1_, L3_7, _UPVALUE2_.serviceName)
  if L2_6 == _UPVALUE0_ then
    return returnCodes.FAILURE, L3_7
  end
  return returnCodes.SUCCESS, L3_7, L2_6
end
function fw.core.services.serviceNameSet(A0_8, A1_9)
  local L2_10, L3_11, L4_12
  if A0_8 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_10 = db.existsRow(servicesTable, _UPVALUE1_, A0_8)
  if not L2_10 then
    return returnCodes.COOKIEFAIL
  end
  L2_10, L3_11 = fw_textValidation(A1_9, _UPVALUE0_, _UPVALUE0_)
  if L2_10 ~= returnCodes.SUCCESS then
    return L3_11, A0_8
  end
  L4_12 = db.setAttribute(servicesTable, _UPVALUE1_, A0_8, _UPVALUE2_.serviceName, A1_9)
  if not L4_12 then
    return returnCodes.FAILURE, A0_8
  end
  return returnCodes.SUCCESS, A0_8
end
function fw.core.services.protocolGet()
  local L0_13, L1_14, L2_15
  L1_14, L0_13 = getFirstCookie(servicesTable, _UPVALUE0_, _UPVALUE1_)
  if returnCodes.SUCCESS ~= L1_14 then
    return L1_14
  end
  L2_15 = db.getAttribute(servicesTable, _UPVALUE0_, L0_13, _UPVALUE2_.protocol)
  if L2_15 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_13, L2_15
end
function fw.core.services.protocolGetNext(A0_16)
  local L1_17, L2_18, L3_19
  if A0_16 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_17, L3_19 = getNextCookie(servicesTable, _UPVALUE1_, A0_16)
  if returnCodes.SUCCESS ~= L1_17 then
    return L1_17
  end
  L2_18 = db.getAttribute(servicesTable, _UPVALUE1_, L3_19, _UPVALUE2_.protocol)
  if L2_18 == _UPVALUE0_ then
    return returnCodes.FAILURE, L3_19
  end
  return returnCodes.SUCCESS, L3_19, L2_18
end
function fw.core.services.protocolSet(A0_20, A1_21)
  local L2_22, L3_23, L4_24
  if A0_20 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_22 = db.existsRow(servicesTable, _UPVALUE1_, A0_20)
  if not L2_22 then
    return returnCodes.COOKIEFAIL
  end
  if A1_21 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, A0_20
  end
  if A1_21 ~= _UPVALUE2_.TCP and A1_21 ~= _UPVALUE2_.UDP and A1_21 ~= _UPVALUE2_.BOTH and A1_21 ~= _UPVALUE2_.ICMP and A1_21 ~= _UPVALUE2_.ICMPV6 then
    return returnCodes.INVALID_ARGUMENT, A0_20
  end
  L4_24 = db.setAttribute(servicesTable, _UPVALUE1_, A0_20, _UPVALUE3_.protocol, A1_21)
  if not L4_24 then
    return returnCodes.FAILURE, A0_20
  end
  return returnCodes.SUCCESS, A0_20
end
function fw.core.services.destinationPortStartGet()
  local L0_25, L1_26, L2_27
  L1_26, L0_25 = getFirstCookie(servicesTable, _UPVALUE0_, _UPVALUE1_)
  if returnCodes.SUCCESS ~= L1_26 then
    return L1_26
  end
  L2_27 = db.getAttribute(servicesTable, _UPVALUE0_, L0_25, _UPVALUE2_.destinationPortStart)
  if L2_27 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_25, L2_27
end
function fw.core.services.destinationPortStartGetNext(A0_28)
  local L1_29, L2_30, L3_31
  if A0_28 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_29, L3_31 = getNextCookie(servicesTable, _UPVALUE1_, A0_28)
  if returnCodes.SUCCESS ~= L1_29 then
    return L1_29
  end
  L2_30 = db.getAttribute(servicesTable, _UPVALUE1_, L3_31, _UPVALUE2_.destinationPortStart)
  if L2_30 == _UPVALUE0_ then
    return returnCodes.FAILURE, L3_31
  end
  return returnCodes.SUCCESS, L3_31, L2_30
end
function fw.core.services.destinationPortStartSet(A0_32, A1_33)
  local L2_34, L3_35, L4_36, L5_37, L6_38, L7_39
  if A0_32 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_34 = db.existsRow(servicesTable, _UPVALUE1_, A0_32)
  if not L2_34 then
    return returnCodes.COOKIEFAIL
  end
  L5_37 = db.getAttribute(servicesTable, _UPVALUE1_, A0_32, _UPVALUE2_.portType)
  if L5_37 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  if L5_37 == _UPVALUE3_.PORT_RANGE then
    L6_38 = db.getAttribute(servicesTable, _UPVALUE1_, A0_32, _UPVALUE2_.protocol)
    if L6_38 == _UPVALUE0_ then
      return returnCodes.FAILURE
    end
    if L6_38 == _UPVALUE4_.ICMP or L6_38 == _UPVALUE4_.ICMPV6 then
      if L6_38 == _UPVALUE4_.ICMPV6 then
        icmpType, L2_34 = fw_portValidation(_UPVALUE5_, _UPVALUE6_, A1_33)
      else
        icmpType, L2_34 = fw_portValidation(_UPVALUE7_, _UPVALUE8_, A1_33)
      end
      if L2_34 ~= returnCodes.SUCCESS then
        return returnCodes.INVALID_ARGUMENT, A0_32
      end
    else
      L7_39 = db.getAttribute(servicesTable, _UPVALUE1_, A0_32, _UPVALUE2_.destinationPortEnd)
      if L7_39 == _UPVALUE0_ then
        return returnCodes.FAILURE
      end
      destinationStartPort, L7_39, L2_34 = fw_portValidation(_UPVALUE9_, _UPVALUE10_, A1_33, L7_39)
      if L2_34 ~= returnCodes.SUCCESS then
        return returnCodes.INVALID_ARGUMENT, A0_32
      end
    end
  else
    return returnCodes.INVALID_ARGUMENT, A0_32
  end
  L4_36 = db.setAttribute(servicesTable, _UPVALUE1_, A0_32, _UPVALUE2_.destinationPortStart, A1_33)
  if not L4_36 then
    return returnCodes.FAILURE, A0_32
  end
  return returnCodes.SUCCESS, A0_32
end
function fw.core.services.destinationPortEndGet()
  local L0_40, L1_41, L2_42
  L1_41, L0_40 = getFirstCookie(servicesTable, _UPVALUE0_, _UPVALUE1_)
  if returnCodes.SUCCESS ~= L1_41 then
    return L1_41
  end
  L2_42 = db.getAttribute(servicesTable, _UPVALUE0_, L0_40, _UPVALUE2_.destinationPortEnd)
  if L2_42 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_40, L2_42
end
function fw.core.services.destinationPortEndGetNext(A0_43)
  local L1_44, L2_45, L3_46
  if A0_43 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_44, L3_46 = getNextCookie(servicesTable, _UPVALUE1_, A0_43)
  if returnCodes.SUCCESS ~= L1_44 then
    return L1_44
  end
  L2_45 = db.getAttribute(servicesTable, _UPVALUE1_, L3_46, _UPVALUE2_.destinationPortEnd)
  if L2_45 == _UPVALUE0_ then
    return returnCodes.FAILURE, L3_46
  end
  return returnCodes.SUCCESS, L3_46, L2_45
end
function fw.core.services.destinationPortEndSet(A0_47, A1_48)
  local L2_49, L3_50, L4_51, L5_52, L6_53, L7_54
  if A0_47 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_49 = db.existsRow(servicesTable, _UPVALUE1_, A0_47)
  if not L2_49 then
    return returnCodes.COOKIEFAIL
  end
  L5_52 = db.getAttribute(servicesTable, _UPVALUE1_, A0_47, _UPVALUE2_.portType)
  if L5_52 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  if L5_52 == _UPVALUE3_.PORT_RANGE then
    L6_53 = db.getAttribute(servicesTable, _UPVALUE1_, A0_47, _UPVALUE2_.protocol)
    if L6_53 == _UPVALUE0_ then
      return returnCodes.FAILURE
    end
    if L6_53 ~= _UPVALUE4_.ICMP or L6_53 ~= _UPVALUE4_.ICMPV6 then
      L7_54 = db.getAttribute(servicesTable, _UPVALUE1_, A0_47, _UPVALUE2_.destinationPortStart)
      if L7_54 == _UPVALUE0_ then
        return returnCodes.FAILURE
      end
      L7_54, A1_48, L2_49 = fw_portValidation(_UPVALUE5_, _UPVALUE6_, L7_54, A1_48)
      if L2_49 ~= returnCodes.SUCCESS then
        return returnCodes.INVALID_ARGUMENT, A0_47
      end
    else
      return returnCodes.INVALID_ARGUMENT, A0_47
    end
  else
    return returnCodes.INVALID_ARGUMENT, A0_47
  end
  L4_51 = db.setAttribute(servicesTable, _UPVALUE1_, A0_47, _UPVALUE2_.destinationPortEnd, A1_48)
  if not L4_51 then
    return returnCodes.FAILURE, A0_47
  end
  return returnCodes.SUCCESS, A0_47
end
function fw.core.services.typeOfServiceGet()
  local L1_55
  L1_55 = returnCodes
  L1_55 = L1_55.NOT_SUPPORTED
  return L1_55, cookie
end
function fw.core.services.typeOfServiceGetNext(A0_56)
  local L2_57
  L2_57 = returnCodes
  L2_57 = L2_57.NOT_SUPPORTED
  return L2_57, A0_56
end
function fw.core.services.typeOfServiceSet(A0_58, A1_59)
  local L3_60
  L3_60 = returnCodes
  L3_60 = L3_60.NOT_SUPPORTED
  return L3_60, A0_58
end
function fw.core.services.isDefaultGet()
  local L1_61
  L1_61 = returnCodes
  L1_61 = L1_61.NOT_SUPPORTED
  return L1_61, cookie
end
function fw.core.services.isDefaultGetNext(A0_62)
  local L2_63
  L2_63 = returnCodes
  L2_63 = L2_63.NOT_SUPPORTED
  return L2_63, A0_62
end
function fw.core.services.isDefaultSet(A0_64, A1_65)
  local L3_66
  L3_66 = returnCodes
  L3_66 = L3_66.NOT_SUPPORTED
  return L3_66, A0_64
end
function fw.core.services.multiportGet()
  local L0_67, L1_68, L2_69
  L1_68, L0_67 = getFirstCookie(servicesTable, _UPVALUE0_, _UPVALUE1_)
  if returnCodes.SUCCESS ~= L1_68 then
    return L1_68
  end
  L2_69 = db.getAttribute(servicesTable, _UPVALUE0_, L0_67, _UPVALUE2_.multiPort)
  if L2_69 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_67, L2_69
end
function fw.core.services.multiportGetNext(A0_70)
  local L1_71, L2_72, L3_73
  if A0_70 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_71, L3_73 = getNextCookie(servicesTable, _UPVALUE1_, A0_70)
  if returnCodes.SUCCESS ~= L1_71 then
    return L1_71
  end
  L2_72 = db.getAttribute(servicesTable, _UPVALUE1_, L3_73, _UPVALUE2_.multiPort)
  if L2_72 == _UPVALUE0_ then
    return returnCodes.FAILURE, L3_73
  end
  return returnCodes.SUCCESS, L3_73, L2_72
end
function fw.core.services.multiportSet(A0_74, A1_75)
  local L2_76, L3_77, L4_78
  if A0_74 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_76 = db.existsRow(servicesTable, _UPVALUE1_, A0_74)
  if not L2_76 then
    return returnCodes.COOKIEFAIL
  end
  portType = db.getAttribute(servicesTable, _UPVALUE1_, A0_74, _UPVALUE2_.portType)
  if portType == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  if portType == _UPVALUE3_.MULTI_PORT then
    L2_76 = fw_multiPortValidation(_UPVALUE4_, _UPVALUE5_, A1_75)
    if L2_76 ~= returnCodes.SUCCESS then
      return returnCodes.INVALID_ARGUMENT, A0_74
    end
  else
    return returnCodes.INVALID_ARGUMENT, A0_74
  end
  L4_78 = db.setAttribute(servicesTable, _UPVALUE1_, A0_74, _UPVALUE2_.multiPort, A1_75)
  if not L4_78 then
    return returnCodes.FAILURE, A0_74
  end
  return returnCodes.SUCCESS, A0_74
end
function fw.core.services.portTypeGet()
  local L0_79, L1_80, L2_81
  L1_80, L0_79 = getFirstCookie(servicesTable, _UPVALUE0_, _UPVALUE1_)
  if returnCodes.SUCCESS ~= L1_80 then
    return L1_80
  end
  L2_81 = db.getAttribute(servicesTable, _UPVALUE0_, L0_79, _UPVALUE2_.portType)
  if L2_81 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_79, L2_81
end
function fw.core.services.portTypeGetNext(A0_82)
  local L1_83, L2_84, L3_85
  if A0_82 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_83, L3_85 = getNextCookie(servicesTable, _UPVALUE1_, A0_82)
  if returnCodes.SUCCESS ~= L1_83 then
    return L1_83
  end
  L2_84 = db.getAttribute(servicesTable, _UPVALUE1_, L3_85, _UPVALUE2_.portType)
  if L2_84 == _UPVALUE0_ then
    return returnCodes.FAILURE, L3_85
  end
  return returnCodes.SUCCESS, L3_85, L2_84
end
function fw.core.services.portTypeSet(A0_86, A1_87)
  local L2_88, L3_89, L4_90
  if A0_86 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_88 = db.existsRow(servicesTable, _UPVALUE1_, A0_86)
  if not L2_88 then
    return returnCodes.COOKIEFAIL
  end
  if A1_87 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, A0_86
  end
  if A1_87 ~= _UPVALUE2_.PORT_RANGE and A1_87 ~= _UPVALUE2_.MULTI_PORT then
    return returnCodes.INVALID_ARGUMENT, A0_86
  end
  L4_90 = db.setAttribute(servicesTable, _UPVALUE1_, A0_86, _UPVALUE3_.portType, A1_87)
  if not L4_90 then
    return returnCodes.FAILURE, A0_86
  end
  return returnCodes.SUCCESS, A0_86
end
function fw.core.services.add(A0_91, A1_92, A2_93, A3_94, A4_95, A5_96, A6_97, A7_98, A8_99)
  local L9_100, L10_101, L11_102, L12_103, L13_104, L14_105, L15_106, L16_107, L17_108, L18_109
  L10_101 = {}
  L11_102, L12_103 = nil, nil
  L13_104 = _UPVALUE0_
  L14_105, L15_106, L16_107, L17_108, L18_109 = nil, nil, nil, nil, nil
  L9_100, L11_102 = fw_textValidation(A0_91, _UPVALUE1_, _UPVALUE1_)
  if L9_100 ~= returnCodes.SUCCESS then
    return L11_102, L13_104
  end
  L9_100 = db.existsRow(servicesTable, _UPVALUE2_, A0_91)
  if L9_100 then
    return fwReturnCodes.COMP_FIREWALL_SERVICE_NAME_ALREADY_EXIT
  end
  if A1_92 == _UPVALUE1_ then
    return returnCodes.INVALID_ARGUMENT, L13_104
  end
  if A1_92 ~= _UPVALUE3_.TCP and A1_92 ~= _UPVALUE3_.UDP and A1_92 ~= _UPVALUE3_.BOTH and A1_92 ~= _UPVALUE3_.ICMP and A1_92 ~= _UPVALUE3_.ICMPV6 then
    return returnCodes.INVALID_ARGUMENT, L13_104
  end
  if A2_93 == _UPVALUE1_ then
    return returnCodes.INVALID_ARGUMENT, L13_104
  end
  if A2_93 ~= _UPVALUE4_.PORT_RANGE and A2_93 ~= _UPVALUE4_.MULTI_PORT then
    return returnCodes.INVALID_ARGUMENT, L13_104
  end
  if A2_93 == _UPVALUE4_.PORT_RANGE then
    if A1_92 == _UPVALUE3_.ICMP or A1_92 == _UPVALUE3_.ICMPV6 then
      if A1_92 == _UPVALUE3_.ICMPV6 then
        L14_105, L9_100 = fw_portValidation(_UPVALUE5_, _UPVALUE6_, A4_95)
      else
        L14_105, L9_100 = fw_portValidation(_UPVALUE7_, _UPVALUE8_, A4_95)
      end
      if L9_100 ~= returnCodes.SUCCESS then
        return returnCodes.INVALID_ARGUMENT, L13_104
      end
    else
      if A4_95 ~= "0" then
        L17_108, L18_109, L9_100 = fw_portValidation(_UPVALUE9_, _UPVALUE10_, A4_95, A5_96)
        if L9_100 ~= returnCodes.SUCCESS then
          return returnCodes.INVALID_ARGUMENT, L13_104
        end
      end
      if A7_98 ~= "0" then
        L15_106, L16_107, L9_100 = fw_portValidation(_UPVALUE9_, _UPVALUE10_, A7_98, A8_99)
        if L9_100 ~= returnCodes.SUCCESS then
          return returnCodes.INVALID_ARGUMENT, L13_104
        end
      end
    end
  else
    if A3_94 ~= "0" then
      L9_100 = fw_multiPortValidation(_UPVALUE9_, _UPVALUE10_, A3_94)
      if L9_100 ~= returnCodes.SUCCESS then
        return returnCodes.INVALID_PORT_NUMBER, L13_104
      end
    end
    if A6_97 ~= "0" then
      L9_100 = fw_multiPortValidation(_UPVALUE9_, _UPVALUE10_, A6_97)
      if L9_100 ~= returnCodes.SUCCESS then
        return returnCodes.INVALID_PORT_NUMBER, L13_104
      end
    end
  end
  L10_101[servicesTable .. "." .. _UPVALUE11_.serviceName] = A0_91
  L10_101[servicesTable .. "." .. _UPVALUE11_.protocol] = A1_92
  L10_101[servicesTable .. "." .. _UPVALUE11_.portType] = A2_93
  if A1_92 == _UPVALUE3_.ICMP or A1_92 == _UPVALUE3_.ICMPV6 then
    L10_101[servicesTable .. "." .. _UPVALUE11_.destinationPortStart] = L14_105
  else
    L10_101[servicesTable .. "." .. _UPVALUE11_.destinationPortStart] = A4_95
  end
  L10_101[servicesTable .. "." .. _UPVALUE11_.destinationPortEnd] = A5_96
  L10_101[servicesTable .. "." .. _UPVALUE11_.sourcePortStart] = A7_98
  L10_101[servicesTable .. "." .. _UPVALUE11_.sourcePortEnd] = A8_99
  L10_101[servicesTable .. "." .. _UPVALUE11_.multiPort] = A3_94
  L10_101[servicesTable .. "." .. _UPVALUE11_.sourcemultiPort] = A6_97
  L10_101[servicesTable .. "." .. _UPVALUE11_.typeOfService] = _UPVALUE12_
  L10_101[servicesTable .. "." .. _UPVALUE11_.isDefault] = _UPVALUE12_
  L9_100 = db.insert(servicesTable, L10_101)
  if not L9_100 then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, A0_91
end
function fw.core.services.edit(A0_110, A1_111, A2_112, A3_113, A4_114, A5_115, A6_116, A7_117, A8_118, A9_119)
  local L10_120, L11_121, L12_122, L13_123, L14_124, L15_125, L16_126, L17_127, L18_128, L19_129, L20_130
  L11_121 = {}
  L12_122, L13_123, L14_124, L15_125, L16_126, L17_127, L18_128, L19_129, L20_130 = nil, nil, nil, nil, nil, nil, nil, nil, nil
  L10_120, L12_122 = fw_textValidation(A0_110, _UPVALUE0_, _UPVALUE0_)
  if L10_120 ~= returnCodes.SUCCESS then
    return L12_122, A9_119
  end
  if A1_111 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, A9_119
  end
  if A1_111 ~= _UPVALUE1_.TCP and A1_111 ~= _UPVALUE1_.UDP and A1_111 ~= _UPVALUE1_.BOTH and A1_111 ~= _UPVALUE1_.ICMP and A1_111 ~= _UPVALUE1_.ICMPV6 then
    return returnCodes.INVALID_ARGUMENT, A9_119
  end
  if A2_112 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, A9_119
  end
  if A2_112 ~= _UPVALUE2_.PORT_RANGE and A2_112 ~= _UPVALUE2_.MULTI_PORT then
    return returnCodes.INVALID_ARGUMENT, A9_119
  end
  if A2_112 == _UPVALUE2_.PORT_RANGE then
    if A1_111 == _UPVALUE1_.ICMP or A1_111 == _UPVALUE1_.ICMPV6 then
      if A1_111 == _UPVALUE1_.ICMPV6 then
        L14_124, L10_120 = fw_portValidation(_UPVALUE3_, _UPVALUE4_, A4_114)
      else
        L14_124, L10_120 = fw_portValidation(_UPVALUE5_, _UPVALUE6_, A4_114)
      end
      if L10_120 ~= returnCodes.SUCCESS then
        return returnCodes.INVALID_ARGUMENT, A9_119
      end
    else
      if A4_114 ~= "0" then
        L19_129, L20_130, L10_120 = fw_portValidation(_UPVALUE7_, _UPVALUE8_, A4_114, A5_115)
        if L10_120 ~= returnCodes.SUCCESS then
          return returnCodes.INVALID_ARGUMENT, A9_119
        end
      end
      if A7_117 ~= "0" then
        L17_127, L18_128, L10_120 = fw_portValidation(_UPVALUE7_, _UPVALUE8_, A7_117, A8_118)
        if L10_120 ~= returnCodes.SUCCESS then
          return returnCodes.INVALID_ARGUMENT, A9_119
        end
      end
    end
  else
    if A3_113 ~= "0" then
      L10_120 = fw_multiPortValidation(_UPVALUE7_, _UPVALUE8_, A3_113)
      if L10_120 ~= returnCodes.SUCCESS then
        return returnCodes.INVALID_PORT_NUMBER, A9_119
      end
    end
    if A6_116 ~= "0" then
      L10_120 = fw_multiPortValidation(_UPVALUE7_, _UPVALUE8_, A6_116)
      if L10_120 ~= returnCodes.SUCCESS then
        return returnCodes.INVALID_PORT_NUMBER, A9_119
      end
    end
  end
  L11_121[servicesTable .. "." .. _UPVALUE9_.serviceName] = A0_110
  L11_121[servicesTable .. "." .. _UPVALUE9_.protocol] = A1_111
  L11_121[servicesTable .. "." .. _UPVALUE9_.portType] = A2_112
  if A1_111 == _UPVALUE1_.ICMP or A1_111 == _UPVALUE1_.ICMPV6 then
    L11_121[servicesTable .. "." .. _UPVALUE9_.destinationPortStart] = L14_124
  else
    L11_121[servicesTable .. "." .. _UPVALUE9_.destinationPortStart] = A4_114
  end
  L11_121[servicesTable .. "." .. _UPVALUE9_.destinationPortEnd] = A5_115
  L11_121[servicesTable .. "." .. _UPVALUE9_.multiPort] = A3_113
  L11_121[servicesTable .. "." .. _UPVALUE9_.sourcePortStart] = A7_117
  L11_121[servicesTable .. "." .. _UPVALUE9_.sourcePortEnd] = A8_118
  L11_121[servicesTable .. "." .. _UPVALUE9_.sourcemultiPort] = A6_116
  L15_125 = db.getAttribute(servicesTable, _UPVALUE10_, A9_119, "_ROWID_")
  if L15_125 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  L13_123 = db.update(servicesTable, L11_121, L15_125)
  if not L13_123 then
    return returnCodes.FAILURE, A9_119
  end
  return returnCodes.SUCCESS, A9_119
end
function fw.core.services.delete(A0_131)
  local L1_132
  L1_132 = db.deleteRow(servicesTable, _UPVALUE0_, A0_131)
  if not L1_132 then
    return returnCodes.FAILURE, A0_131
  end
  return returnCodes.SUCCESS, A0_131
end
function fw.core.services.deleteAll()
  local L0_133
  L0_133 = db.deleteRowWhere(servicesTable, _UPVALUE0_)
  if not L0_133 then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS
end
function fw.core.services.Get()
  local L0_134, L1_135, L2_136, L3_137, L4_138, L5_139, L6_140, L7_141, L8_142
  L8_142 = {}
  L1_135, L0_134 = getFirstCookie(servicesTable, _UPVALUE0_, _UPVALUE1_)
  if returnCodes.SUCCESS ~= L1_135 then
    return L1_135
  end
  L8_142 = db.getRow(servicesTable, _UPVALUE0_, L0_134)
  if L8_142 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  L2_136 = L8_142[servicesTable .. "." .. _UPVALUE3_.serviceName]
  L3_137 = L8_142[servicesTable .. "." .. _UPVALUE3_.protocol]
  L4_138 = L8_142[servicesTable .. "." .. _UPVALUE3_.portType]
  L5_139 = L8_142[servicesTable .. "." .. _UPVALUE3_.destinationPortStart]
  L6_140 = L8_142[servicesTable .. "." .. _UPVALUE3_.destinationPortEnd]
  L7_141 = L8_142[servicesTable .. "." .. _UPVALUE3_.multiPort]
  return returnCodes.SUCCESS, L0_134, L2_136, L3_137, L4_138, L5_139, L6_140, L7_141
end
function fw.core.services.GetNext(A0_143)
  local L1_144, L2_145, L3_146, L4_147, L5_148, L6_149, L7_150, L8_151
  L8_151 = {}
  if A0_143 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_144, rowId = getNextCookie(portTriggeringTable, _UPVALUE1_, A0_143)
  if returnCodes.SUCCESS ~= L1_144 then
    return L1_144
  end
  L8_151 = db.getRow(servicesTable, _UPVALUE1_, rowId)
  if L8_151 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  L2_145 = L8_151[servicesTable .. "." .. _UPVALUE2_.serviceName]
  L3_146 = L8_151[servicesTable .. "." .. _UPVALUE2_.protocol]
  L4_147 = L8_151[servicesTable .. "." .. _UPVALUE2_.portType]
  L5_148 = L8_151[servicesTable .. "." .. _UPVALUE2_.destinationPortStart]
  L6_149 = L8_151[servicesTable .. "." .. _UPVALUE2_.destinationPortEnd]
  L7_150 = L8_151[servicesTable .. "." .. _UPVALUE2_.multiPort]
  return returnCodes.SUCCESS, rowId, L2_145, L3_146, L4_147, L5_148, L6_149, L7_150
end
function fw.core.services.rowGet(A0_152)
  local L1_153, L2_154, L3_155, L4_156, L5_157, L6_158, L7_159, L8_160, L9_161, L10_162, L11_163
  L11_163 = {}
  if A0_152 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L11_163 = db.getRow(servicesTable, _UPVALUE1_, A0_152)
  if L11_163 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  L2_154 = L11_163[servicesTable .. "." .. _UPVALUE2_.serviceName]
  L3_155 = L11_163[servicesTable .. "." .. _UPVALUE2_.protocol]
  L4_156 = L11_163[servicesTable .. "." .. _UPVALUE2_.portType]
  L5_157 = L11_163[servicesTable .. "." .. _UPVALUE2_.destinationPortStart]
  L9_161 = L11_163[servicesTable .. "." .. _UPVALUE2_.destinationPortEnd]
  L10_162 = L11_163[servicesTable .. "." .. _UPVALUE2_.multiPort]
  L8_160 = L11_163[servicesTable .. "." .. _UPVALUE2_.sourcemultiPort]
  L6_158 = L11_163[servicesTable .. "." .. _UPVALUE2_.sourcePortStart]
  L7_159 = L11_163[servicesTable .. "." .. _UPVALUE2_.sourcePortEnd]
  return returnCodes.SUCCESS, A0_152, L2_154, L3_155, L4_156, L5_157, L9_161, L10_162, L8_160, L6_158, L7_159
end
function fw.core.services.customGetAll()
  local L0_164
  L0_164 = db
  L0_164 = L0_164.getRowsWhere
  L0_164 = L0_164(servicesTable, _UPVALUE0_)
  if L0_164 == _UPVALUE1_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_164
end
function fw.core.services.GetAll()
  local L0_165
  L0_165 = db
  L0_165 = L0_165.getTable
  L0_165 = L0_165(servicesTable, false)
  if L0_165 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_165
end
