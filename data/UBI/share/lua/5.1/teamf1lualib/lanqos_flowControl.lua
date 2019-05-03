local L0_0
L0_0 = module
L0_0("com.teamf1.core.lanqos.flowcontrol", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/lanqos_qosOnLan")
L0_0 = require
L0_0("teamf1lualib/lanqos_cookie")
L0_0 = require
L0_0("teamf1lualib/qos_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
flowcontrolTable = "FlowBasedPolicyTable"
;({}).flowName = "policyName"
;({}).service = "ServiceName"
;({}).sourceIpAddress = "srcIP"
;({}).destinationIpAddress = "dstIP"
;({}).rate = "ratePercentage"
;({}).serviceId = "serviceId"
;({}).dstPort = "dstPort"
;({}).dstPortEnd = "dstPortEnd"
;({}).protocol = "protocol"
;({}).description = "description"
;({}).servicesProtocol = "Protocol"
;({}).servicesDstPort = "DestinationPortStart"
;({}).servicesDstPortEnd = "DestinationPortEnd"
;({}).multiplePort = "MultiPort"
function flowNameGet()
  local L0_1, L1_2, L2_3
  L1_2, L0_1 = cookieGet(flowcontrolTable, _UPVALUE0_)
  if _UPVALUE1_.SUCCESS ~= L1_2 then
    return L1_2
  end
  L2_3 = db.getAttribute(flowcontrolTable, _UPVALUE0_, L0_1, _UPVALUE2_.flowName)
  if L2_3 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_1, L2_3
end
function flowNameGetNext(A0_4)
  local L1_5, L2_6
  if A0_4 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L1_5, A0_4 = cookieGetNext(flowcontrolTable, _UPVALUE1_, A0_4)
  if _UPVALUE0_.SUCCESS ~= L1_5 then
    return L1_5
  end
  L2_6 = db.getAttribute(flowcontrolTable, _UPVALUE1_, A0_4, _UPVALUE2_.flowName)
  if L2_6 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_4
  end
  return _UPVALUE0_.SUCCESS, A0_4, L2_6
end
function flowNameSet(A0_7, A1_8)
  local L3_9
  L3_9 = _UPVALUE0_
  L3_9 = L3_9.NOT_SUPPORTED
  return L3_9, A0_7
end
function serviceGet()
  local L0_10, L1_11, L2_12, L3_13
  L1_11, L0_10 = cookieGet(flowcontrolTable, _UPVALUE0_)
  if _UPVALUE1_.SUCCESS ~= L1_11 then
    return L1_11
  end
  L2_12 = db.getAttribute(flowcontrolTable, _UPVALUE0_, L0_10, _UPVALUE2_.serviceId)
  if L2_12 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  L3_13 = db.getAttribute(_UPVALUE3_, _UPVALUE4_, L2_12, _UPVALUE2_.service)
  if L3_13 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_10, L3_13
end
function serviceGetNext(A0_14)
  local L1_15, L2_16, L3_17, L4_18
  L4_18 = _UPVALUE0_
  L4_18 = L4_18.NIL
  if A0_14 == L4_18 then
    L4_18 = _UPVALUE0_
    L4_18 = L4_18.INVALID_ARGUMENT
    return L4_18
  end
  L4_18 = cookieGetNext
  A0_14, L4_18 = flowcontrolTable, L4_18(flowcontrolTable, _UPVALUE1_, A0_14)
  L1_15 = L4_18
  L4_18 = _UPVALUE0_
  L4_18 = L4_18.SUCCESS
  if L4_18 ~= L1_15 then
    return L1_15
  end
  L4_18 = db
  L4_18 = L4_18.getAttribute
  L4_18 = L4_18(flowcontrolTable, _UPVALUE1_, A0_14, _UPVALUE2_.serviceId)
  L2_16 = L4_18
  L4_18 = _UPVALUE0_
  L4_18 = L4_18.NIL
  if L2_16 == L4_18 then
    L4_18 = _UPVALUE0_
    L4_18 = L4_18.FAILURE
    return L4_18
  end
  L4_18 = db
  L4_18 = L4_18.getAttribute
  L4_18 = L4_18(_UPVALUE3_, _UPVALUE4_, L2_16, _UPVALUE2_.service)
  if L4_18 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_14, L4_18
end
function serviceSet(A0_19, A1_20)
  local L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27, L9_28, L10_29
  L6_25 = {}
  L7_26 = {}
  L8_27, L9_28, L10_29 = nil, nil, nil
  if A0_19 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_20 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_21 = db.existsRow(_UPVALUE1_, _UPVALUE2_.service, A1_20)
  if not L2_21 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_21 = db.existsRow(flowcontrolTable, _UPVALUE3_, A0_19)
  if not L2_21 then
    return _UPVALUE4_.FLOW_CONTROL_INVALID_COOKIE
  end
  L3_22, L4_23, L5_24 = _UPVALUE5_.isfeatureEnabled()
  if _UPVALUE0_.SUCCESS ~= L3_22 or _UPVALUE6_ ~= L5_24 then
    return _UPVALUE4_.LANQOS_DISABLED
  end
  L6_25 = db.getRow(_UPVALUE1_, _UPVALUE2_.service, A1_20)
  if L6_25 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_19
  end
  L8_27 = db.getAttribute(_UPVALUE1_, _UPVALUE2_.service, A1_20, _UPVALUE7_)
  if L8_27 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L7_26[flowcontrolTable .. "." .. _UPVALUE2_.serviceId] = L8_27
  L7_26[flowcontrolTable .. "." .. _UPVALUE2_.protocol] = L6_25[_UPVALUE1_ .. "." .. _UPVALUE2_.servicesProtocol]
  L7_26[flowcontrolTable .. "." .. _UPVALUE2_.dstPort] = L6_25[_UPVALUE1_ .. "." .. _UPVALUE2_.servicesDstPort]
  L7_26[flowcontrolTable .. "." .. _UPVALUE2_.dstPortEnd] = L6_25[_UPVALUE1_ .. "." .. _UPVALUE2_.servicesDstPortEnd]
  L10_29 = db.getAttribute(flowcontrolTable, _UPVALUE3_, A0_19, _UPVALUE7_)
  if L10_29 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L9_28 = db.update(flowcontrolTable, L7_26, L10_29)
  if not L9_28 then
    return _UPVALUE0_.FAILURE, A0_19
  end
  return _UPVALUE0_.SUCCESS, A0_19
end
function sourceIpAddressGet()
  local L0_30, L1_31, L2_32
  L1_31, L0_30 = cookieGet(flowcontrolTable, _UPVALUE0_)
  if _UPVALUE1_.SUCCESS ~= L1_31 then
    return L1_31
  end
  L2_32 = db.getAttribute(flowcontrolTable, _UPVALUE0_, L0_30, _UPVALUE2_.sourceIpAddress)
  if L2_32 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_30, L2_32
end
function sourceIpAddressGetNext(A0_33)
  local L1_34, L2_35
  if A0_33 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L1_34, A0_33 = cookieGetNext(flowcontrolTable, _UPVALUE1_, A0_33)
  if _UPVALUE0_.SUCCESS ~= L1_34 then
    return L1_34
  end
  L2_35 = db.getAttribute(flowcontrolTable, _UPVALUE1_, A0_33, _UPVALUE2_.sourceIpAddress)
  if L2_35 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_33
  end
  return _UPVALUE0_.SUCCESS, A0_33, L2_35
end
function sourceIpAddressSet(A0_36, A1_37)
  local L2_38, L3_39, L4_40, L5_41, L6_42, L7_43, L8_44, L9_45, L10_46, L11_47
  L7_43 = {}
  L8_44, L9_45, L10_46 = nil, nil, nil
  L11_47 = {}
  if A0_36 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_37 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_38 = _UPVALUE1_.ipAddressCheck(_UPVALUE2_, A1_37)
  if L2_38 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE3_.FLOW_CONTROL_SRC_IP_ADDRESS_INVALID
  end
  L2_38 = db.existsRow(flowcontrolTable, _UPVALUE4_, A0_36)
  if not L2_38 then
    return _UPVALUE3_.FLOW_CONTROL_INVALID_COOKIE
  end
  L3_39, L4_40, L5_41 = _UPVALUE5_.isfeatureEnabled()
  if _UPVALUE0_.SUCCESS ~= L3_39 or _UPVALUE6_ ~= L5_41 then
    return _UPVALUE3_.LANQOS_DISABLED
  end
  if db.getRow(flowcontrolTable, _UPVALUE4_, A0_36) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L8_44 = db.getRow(flowcontrolTable, _UPVALUE4_, A0_36)[flowcontrolTable .. "." .. _UPVALUE7_.destinationIpAddress]
  L9_45 = "IP SA:" .. A1_37 .. " " .. "IP DA:" .. L8_44
  L11_47[flowcontrolTable .. "." .. _UPVALUE7_.sourceIpAddress] = A1_37
  L11_47[flowcontrolTable .. "." .. _UPVALUE7_.description] = L9_45
  L10_46 = db.getAttribute(flowcontrolTable, _UPVALUE4_, A0_36, _UPVALUE8_)
  if L10_46 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L6_42 = db.update(flowcontrolTable, L11_47, L10_46)
  if not L6_42 then
    return _UPVALUE0_.FAILURE, A0_36
  end
  return _UPVALUE0_.SUCCESS, A0_36
end
function destinationIpAddressGet()
  local L0_48, L1_49, L2_50
  L1_49, L0_48 = cookieGet(flowcontrolTable, _UPVALUE0_)
  if _UPVALUE1_.SUCCESS ~= L1_49 then
    return L1_49
  end
  L2_50 = db.getAttribute(flowcontrolTable, _UPVALUE0_, L0_48, _UPVALUE2_.destinationIpAddress)
  if L2_50 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_48, L2_50
end
function destinationIpAddressGetNext(A0_51)
  local L1_52, L2_53
  if A0_51 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L1_52, A0_51 = cookieGetNext(flowcontrolTable, _UPVALUE1_, A0_51)
  if _UPVALUE0_.SUCCESS ~= L1_52 then
    return L1_52
  end
  L2_53 = db.getAttribute(flowcontrolTable, _UPVALUE1_, A0_51, _UPVALUE2_.destinationIpAddress)
  if L2_53 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_51
  end
  return _UPVALUE0_.SUCCESS, A0_51, L2_53
end
function destinationIpAddressSet(A0_54, A1_55)
  local L2_56, L3_57, L4_58, L5_59, L6_60, L7_61, L8_62, L9_63, L10_64, L11_65
  L7_61 = {}
  L8_62, L9_63, L10_64 = nil, nil, nil
  L11_65 = {}
  if A0_54 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_55 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_56 = _UPVALUE1_.ipAddressCheck(_UPVALUE2_, A1_55)
  if L2_56 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE3_.FLOW_CONTROL_DST_IP_ADDRESS_INVALID
  end
  L2_56 = db.existsRow(flowcontrolTable, _UPVALUE4_, A0_54)
  if not L2_56 then
    return _UPVALUE3_.FLOW_CONTROL_INVALID_COOKIE
  end
  L3_57, L4_58, L5_59 = _UPVALUE5_.isfeatureEnabled()
  if _UPVALUE0_.SUCCESS ~= L3_57 or _UPVALUE6_ ~= L5_59 then
    return _UPVALUE3_.LANQOS_DISABLED
  end
  L7_61 = db.getRow(flowcontrolTable, _UPVALUE4_, A0_54)
  if L7_61 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L8_62 = L7_61[flowcontrolTable .. "." .. _UPVALUE7_.sourceIpAddress]
  L9_63 = "IP SA:" .. L8_62 .. " " .. "IP DA:" .. A1_55
  L11_65[flowcontrolTable .. "." .. _UPVALUE7_.destinationIpAddress] = A1_55
  L11_65[flowcontrolTable .. "." .. _UPVALUE7_.description] = L9_63
  L10_64 = db.getAttribute(flowcontrolTable, _UPVALUE4_, A0_54, _UPVALUE8_)
  if L10_64 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L6_60 = db.update(flowcontrolTable, L11_65, L10_64)
  if not L6_60 then
    return _UPVALUE0_.FAILURE, A0_54
  end
  return _UPVALUE0_.SUCCESS, A0_54
end
function rateGet()
  local L0_66, L1_67, L2_68
  L1_67, L0_66 = cookieGet(flowcontrolTable, _UPVALUE0_)
  if _UPVALUE1_.SUCCESS ~= L1_67 then
    return L1_67
  end
  L2_68 = db.getAttribute(flowcontrolTable, _UPVALUE0_, L0_66, _UPVALUE2_.rate)
  if L2_68 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_66, L2_68
end
function rateGetNext(A0_69)
  local L1_70, L2_71
  if A0_69 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L1_70, A0_69 = cookieGetNext(flowcontrolTable, _UPVALUE1_, A0_69)
  if _UPVALUE0_.SUCCESS ~= L1_70 then
    return L1_70
  end
  L2_71 = db.getAttribute(flowcontrolTable, _UPVALUE1_, A0_69, _UPVALUE2_.rate)
  if L2_71 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_69
  end
  return _UPVALUE0_.SUCCESS, A0_69, L2_71
end
function rateSet(A0_72, A1_73)
  local L2_74, L3_75, L4_76, L5_77, L6_78, L7_79
  if A0_72 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_73 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_74 = db.existsRow(flowcontrolTable, _UPVALUE1_, A0_72)
  if not L2_74 then
    return _UPVALUE2_.FLOW_CONTROL_INVALID_COOKIE
  end
  if tonumber(A1_73) < _UPVALUE3_ or tonumber(A1_73) > _UPVALUE4_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L4_76, L5_77, L6_78 = _UPVALUE5_.isfeatureEnabled()
  if _UPVALUE0_.SUCCESS ~= L4_76 or _UPVALUE6_ ~= L6_78 then
    return _UPVALUE2_.LANQOS_DISABLED
  end
  L7_79 = db.setAttribute(flowcontrolTable, _UPVALUE1_, A0_72, _UPVALUE7_.rate, A1_73)
  if not L7_79 then
    return _UPVALUE0_.FAILURE, A0_72
  end
  return _UPVALUE0_.SUCCESS, A0_72
end
function flowGet()
  local L0_80, L1_81, L2_82, L3_83, L4_84, L5_85, L6_86, L7_87, L8_88
  L2_82 = {}
  L3_83, L4_84, L5_85, L6_86, L7_87, L8_88 = nil, nil, nil, nil, nil, nil
  L1_81, L0_80 = cookieGet(flowcontrolTable, _UPVALUE0_)
  if _UPVALUE1_.SUCCESS ~= L1_81 then
    return L1_81
  end
  L2_82 = db.getRow(flowcontrolTable, _UPVALUE0_, L0_80)
  if L2_82 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  L3_83 = L2_82[flowcontrolTable .. "." .. _UPVALUE2_.flowName]
  L4_84 = L2_82[flowcontrolTable .. "." .. _UPVALUE2_.serviceId]
  L5_85 = L2_82[flowcontrolTable .. "." .. _UPVALUE2_.sourceIpAddress]
  L6_86 = L2_82[flowcontrolTable .. "." .. _UPVALUE2_.destinationIpAddress]
  L7_87 = L2_82[flowcontrolTable .. "." .. _UPVALUE2_.rate]
  L8_88 = db.getAttribute(_UPVALUE3_, _UPVALUE4_, L4_84, _UPVALUE2_.service)
  if L8_88 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_80, L3_83, L8_88, L5_85, L6_86, L7_87
end
function flowGetNext(A0_89)
  local L1_90, L2_91, L3_92, L4_93, L5_94, L6_95, L7_96, L8_97
  L2_91 = {}
  L3_92, L4_93, L5_94, L6_95, L7_96, L8_97 = nil, nil, nil, nil, nil, nil
  if A0_89 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L1_90, A0_89 = cookieGetNext(flowcontrolTable, _UPVALUE1_, A0_89)
  if _UPVALUE0_.SUCCESS ~= L1_90 then
    return L1_90
  end
  L2_91 = db.getRow(flowcontrolTable, _UPVALUE1_, A0_89)
  if L2_91 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L3_92 = L2_91[flowcontrolTable .. "." .. _UPVALUE2_.flowName]
  L4_93 = L2_91[flowcontrolTable .. "." .. _UPVALUE2_.serviceId]
  L5_94 = L2_91[flowcontrolTable .. "." .. _UPVALUE2_.sourceIpAddress]
  L6_95 = L2_91[flowcontrolTable .. "." .. _UPVALUE2_.destinationIpAddress]
  L7_96 = L2_91[flowcontrolTable .. "." .. _UPVALUE2_.rate]
  L8_97 = db.getAttribute(_UPVALUE3_, _UPVALUE4_, L4_93, _UPVALUE2_.service)
  if L8_97 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_89, L3_92, L8_97, L5_94, L6_95, L7_96
end
function flowSet(A0_98, A1_99, A2_100, A3_101, A4_102)
  local L5_103, L6_104, L7_105, L8_106, L9_107, L10_108, L11_109, L12_110, L13_111, L14_112, L15_113, L16_114, L17_115
  L12_110 = {}
  L13_111 = nil
  L14_112 = {}
  L15_113, L16_114 = nil, nil
  L17_115 = _UPVALUE0_
  L17_115 = L17_115.NIL
  if A0_98 == L17_115 then
    L17_115 = _UPVALUE1_
    L17_115 = L17_115.FLOW_CONTROL_NIL_COOKIE
    return L17_115
  end
  L17_115 = _UPVALUE0_
  L17_115 = L17_115.NIL
  if A1_99 == L17_115 then
    L17_115 = _UPVALUE1_
    L17_115 = L17_115.FLOW_CONTROL_SERVICE_NIL
    return L17_115
  end
  L17_115 = db
  L17_115 = L17_115.existsRow
  L17_115 = L17_115(_UPVALUE2_, _UPVALUE3_.service, A1_99)
  L5_103 = L17_115
  if not L5_103 then
    L17_115 = _UPVALUE1_
    L17_115 = L17_115.FLOW_CONTROL_INVALID_SERVICE
    return L17_115
  end
  L17_115 = _UPVALUE0_
  L17_115 = L17_115.NIL
  if A2_100 == L17_115 then
    L17_115 = _UPVALUE1_
    L17_115 = L17_115.FLOW_CONTROL_SRC_IP_ADDRESS_NIL
    return L17_115
  end
  L17_115 = _UPVALUE4_
  L17_115 = L17_115.ipAddressCheck
  L17_115 = L17_115(_UPVALUE5_, A2_100)
  L5_103 = L17_115
  L17_115 = _UPVALUE0_
  L17_115 = L17_115.SUCCESS
  if L5_103 ~= L17_115 then
    L17_115 = _UPVALUE1_
    L17_115 = L17_115.FLOW_CONTROL_SRC_IP_ADDRESS_INVALID
    return L17_115
  end
  L17_115 = _UPVALUE0_
  L17_115 = L17_115.NIL
  if A3_101 == L17_115 then
    L17_115 = _UPVALUE1_
    L17_115 = L17_115.FLOW_CONTROL_DST_IP_ADDRESS_NIL
    return L17_115
  end
  L17_115 = _UPVALUE4_
  L17_115 = L17_115.ipAddressCheck
  L17_115 = L17_115(_UPVALUE5_, A3_101)
  L5_103 = L17_115
  L17_115 = _UPVALUE0_
  L17_115 = L17_115.SUCCESS
  if L5_103 ~= L17_115 then
    L17_115 = _UPVALUE1_
    L17_115 = L17_115.FLOW_CONTROL_DST_IP_ADDRESS_INVALID
    return L17_115
  end
  L17_115 = _UPVALUE0_
  L17_115 = L17_115.NIL
  if A4_102 ~= L17_115 then
    L17_115 = tonumber
    L17_115 = L17_115(A4_102)
  elseif L17_115 == _UPVALUE0_.NIL then
    L17_115 = _UPVALUE1_
    L17_115 = L17_115.FLOW_CONTROL_NIL_BWRATE
    return L17_115
  end
  L17_115 = tonumber
  L17_115 = L17_115(A4_102)
  if L17_115 < _UPVALUE6_ or L17_115 > _UPVALUE7_ then
    return _UPVALUE1_.FLOW_CONTROL_INVALID_BWRATE
  end
  if math.modf(L17_115) ~= 0 then
    return _UPVALUE1_.FLOW_CONTROL_INVALID_BWRATE
  end
  L5_103 = db.existsRow(flowcontrolTable, _UPVALUE8_, A0_98)
  if not L5_103 then
    return _UPVALUE1_.FLOW_CONTROL_INVALID_COOKIE
  end
  L8_106, L9_107, L10_108 = _UPVALUE9_.isfeatureEnabled()
  if _UPVALUE0_.SUCCESS ~= L8_106 or _UPVALUE10_ ~= L10_108 then
    return _UPVALUE1_.LANQOS_DISABLED
  end
  L12_110 = db.getRow(_UPVALUE2_, _UPVALUE3_.service, A1_99)
  if L12_110 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_98
  end
  L13_111 = db.getAttribute(_UPVALUE2_, _UPVALUE3_.service, A1_99, _UPVALUE11_)
  if L13_111 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L15_113 = "IP SA:" .. A2_100 .. " " .. "IP DA:" .. A3_101
  L14_112[flowcontrolTable .. "." .. _UPVALUE3_.serviceId] = L13_111
  L14_112[flowcontrolTable .. "." .. _UPVALUE3_.protocol] = L12_110[_UPVALUE2_ .. "." .. _UPVALUE3_.servicesProtocol]
  L14_112[flowcontrolTable .. "." .. _UPVALUE3_.dstPort] = L12_110[_UPVALUE2_ .. "." .. _UPVALUE3_.servicesDstPort]
  L14_112[flowcontrolTable .. "." .. _UPVALUE3_.dstPortEnd] = L12_110[_UPVALUE2_ .. "." .. _UPVALUE3_.servicesDstPortEnd]
  L14_112[flowcontrolTable .. "." .. _UPVALUE3_.sourceIpAddress] = A2_100
  L14_112[flowcontrolTable .. "." .. _UPVALUE3_.destinationIpAddress] = A3_101
  L14_112[flowcontrolTable .. "." .. _UPVALUE3_.rate] = A4_102
  L14_112[flowcontrolTable .. "." .. _UPVALUE3_.description] = L15_113
  L16_114 = db.getAttribute(flowcontrolTable, _UPVALUE8_, A0_98, _UPVALUE11_)
  if L16_114 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L11_109 = db.update(flowcontrolTable, L14_112, L16_114)
  if not L11_109 then
    return _UPVALUE0_.FAILURE, A0_98
  end
  return _UPVALUE0_.SUCCESS, A0_98
end
function flowCreate(A0_116, A1_117, A2_118, A3_119, A4_120)
  local L5_121, L6_122, L7_123, L8_124, L9_125, L10_126, L11_127, L12_128, L13_129, L14_130, L15_131, L16_132, L17_133, L18_134, L19_135, L20_136, L21_137
  L13_129 = {}
  L14_130 = nil
  L15_131 = {}
  L16_132, L17_133, L18_134, L19_135 = nil, nil, nil, nil
  L20_136 = {}
  L21_137 = nil
  if A0_116 == _UPVALUE0_.NIL then
    return _UPVALUE1_.FLOW_CONTROL_NAME_NIL
  end
  L7_123 = string.len(A0_116)
  if A0_116:match("%W") or L7_123 > _UPVALUE2_ then
    return _UPVALUE1_.FLOW_CONTROL_INVALID_NAME
  end
  if A1_117 == _UPVALUE0_.NIL then
    return _UPVALUE1_.FLOW_CONTROL_SERVICE_NIL
  end
  L6_122 = db.existsRow(_UPVALUE3_, _UPVALUE4_.service, A1_117)
  if not L6_122 then
    return _UPVALUE1_.FLOW_CONTROL_INVALID_SERVICE
  end
  if A2_118 == _UPVALUE0_.NIL then
    return _UPVALUE1_.FLOW_CONTROL_SRC_IP_ADDRESS_NIL
  end
  L6_122 = _UPVALUE5_.ipAddressCheck(_UPVALUE6_, A2_118)
  if L6_122 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE1_.FLOW_CONTROL_SRC_IP_ADDRESS_INVALID
  end
  if A3_119 == _UPVALUE0_.NIL then
    return _UPVALUE1_.FLOW_CONTROL_DST_IP_ADDRESS_NIL
  end
  L6_122 = _UPVALUE5_.ipAddressCheck(_UPVALUE6_, A3_119)
  if L6_122 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE1_.FLOW_CONTROL_DST_IP_ADDRESS_INVALID
  end
  if A4_120 == _UPVALUE0_.NIL or tonumber(A4_120) == _UPVALUE0_.NIL then
    return _UPVALUE1_.FLOW_CONTROL_NIL_BWRATE
  end
  L8_124 = tonumber(A4_120)
  if L8_124 < _UPVALUE7_ or L8_124 > _UPVALUE8_ then
    return _UPVALUE1_.FLOW_CONTROL_INVALID_BWRATE
  end
  if math.modf(L8_124) ~= 0 then
    return _UPVALUE1_.FLOW_CONTROL_INVALID_BWRATE
  end
  L6_122 = db.existsRow(flowcontrolTable, _UPVALUE9_, A0_116)
  if L6_122 then
    return _UPVALUE1_.FLOW_CONTROL_NAME_ALREADY_EXISTS
  end
  L9_125, L10_126, L11_127 = _UPVALUE10_.isfeatureEnabled()
  if _UPVALUE0_.SUCCESS ~= L9_125 or _UPVALUE11_ ~= L11_127 then
    return _UPVALUE1_.LANQOS_DISABLED
  end
  L13_129 = db.getRow(_UPVALUE3_, _UPVALUE4_.service, A1_117)
  if L13_129 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L5_121
  end
  L14_130 = db.getAttribute(_UPVALUE3_, _UPVALUE4_.service, A1_117, _UPVALUE12_)
  if L14_130 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L19_135 = L13_129[_UPVALUE3_ .. "." .. _UPVALUE4_.multiplePort]
  if L19_135 == _UPVALUE0_.NIL or L19_135 == "" then
    if L13_129[_UPVALUE3_ .. "." .. _UPVALUE4_.servicesDstPortEnd] == _UPVALUE0_.NIL or L13_129[_UPVALUE3_ .. "." .. _UPVALUE4_.servicesDstPortEnd] == "" then
      return _UPVALUE1_.SERVICE_ICMP_TYPE_NOT_ALLOWD
    end
    L17_133 = tonumber(L13_129[_UPVALUE3_ .. "." .. _UPVALUE4_.servicesDstPort])
    L18_134 = tonumber(L13_129[_UPVALUE3_ .. "." .. _UPVALUE4_.servicesDstPortEnd])
    if L18_134 ~= _UPVALUE13_ and L18_134 - L17_133 > _UPVALUE14_ then
      return _UPVALUE1_.SERVICE_MULTIPORT_NOT_ALLOW
    end
  else
    L20_136 = util.split(L19_135, ",")
    if #L20_136 > _UPVALUE15_ then
      return _UPVALUE1_.SERVICE_MULTIPORT_NOT_ALLOW
    end
    if #L20_136 == _UPVALUE15_ then
      if tonumber(L20_136[1]) > tonumber(L20_136[2]) then
        L17_133 = tonumber(L20_136[2])
        L18_134 = tonumber(L20_136[1])
      else
        L17_133 = tonumber(L20_136[1])
        L18_134 = tonumber(L20_136[2])
      end
      if L18_134 - L17_133 > 1 then
        return _UPVALUE1_.SERVICE_MULTIPORT_NOT_ALLOW
      end
      if L18_134 == L17_133 then
        L18_134 = _UPVALUE13_
      end
    else
      L17_133 = L20_136[1]
      L18_134 = _UPVALUE13_
    end
  end
  L16_132 = "IP SA:" .. A2_118 .. " " .. "IP DA:" .. A3_119
  L21_137 = _UPVALUE4_.description .. " = '" .. L16_132 .. "' and " .. _UPVALUE4_.serviceId .. " = '" .. L14_130 .. "'"
  L6_122 = db.existsRowWhere(flowcontrolTable, L21_137)
  if L6_122 then
    return _UPVALUE1_.FLOW_POLICY_CONFLICT
  end
  L15_131[flowcontrolTable .. "." .. _UPVALUE4_.serviceId] = L14_130
  L15_131[flowcontrolTable .. "." .. _UPVALUE4_.protocol] = L13_129[_UPVALUE3_ .. "." .. _UPVALUE4_.servicesProtocol]
  L15_131[flowcontrolTable .. "." .. _UPVALUE4_.dstPort] = L17_133
  L15_131[flowcontrolTable .. "." .. _UPVALUE4_.dstPortEnd] = L18_134
  L15_131[flowcontrolTable .. "." .. _UPVALUE4_.flowName] = A0_116
  L15_131[flowcontrolTable .. "." .. _UPVALUE4_.sourceIpAddress] = A2_118
  L15_131[flowcontrolTable .. "." .. _UPVALUE4_.destinationIpAddress] = A3_119
  L15_131[flowcontrolTable .. "." .. _UPVALUE4_.rate] = A4_120
  L15_131[flowcontrolTable .. "." .. _UPVALUE4_.description] = L16_132
  L12_128 = db.insert(flowcontrolTable, L15_131)
  if not L12_128 then
    return _UPVALUE0_.FAILURE, L5_121
  end
  L5_121 = A0_116
  return _UPVALUE0_.SUCCESS, L5_121
end
function flowDelete(A0_138)
  local L1_139, L2_140, L3_141, L4_142, L5_143
  if A0_138 == _UPVALUE0_.NIL then
    return _UPVALUE1_.FLOW_CONTROL_NIL_COOKIE
  end
  L1_139 = db.existsRow(flowcontrolTable, _UPVALUE2_, A0_138)
  if not L1_139 then
    return _UPVALUE1_.FLOW_CONTROL_INVALID_COOKIE
  end
  L2_140, L3_141, L4_142 = _UPVALUE3_.isfeatureEnabled()
  if _UPVALUE0_.SUCCESS ~= L2_140 or _UPVALUE4_ ~= L4_142 then
    return _UPVALUE1_.LANQOS_DISABLED
  end
  L5_143 = db.deleteRow(flowcontrolTable, _UPVALUE2_, A0_138)
  if not L5_143 then
    return _UPVALUE0_.FAILURE, A0_138
  end
  return _UPVALUE0_.SUCCESS, A0_138
end
function flowGetCur(A0_144)
  local L1_145, L2_146, L3_147, L4_148, L5_149
  if A0_144 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L1_145 = db.existsRow(flowcontrolTable, _UPVALUE1_, A0_144)
  if not L1_145 then
    return _UPVALUE2_.FLOW_CONTROL_INVALID_COOKIE
  end
  flowTbl = db.getRow(flowcontrolTable, _UPVALUE1_, A0_144)
  if flowTbl == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  flowName = flowTbl[flowcontrolTable .. "." .. _UPVALUE3_.flowName]
  serviceId = flowTbl[flowcontrolTable .. "." .. _UPVALUE3_.serviceId]
  sourceIpAddress = flowTbl[flowcontrolTable .. "." .. _UPVALUE3_.sourceIpAddress]
  destinationIpAddress = flowTbl[flowcontrolTable .. "." .. _UPVALUE3_.destinationIpAddress]
  rate = flowTbl[flowcontrolTable .. "." .. _UPVALUE3_.rate]
  service = db.getAttribute(_UPVALUE4_, _UPVALUE5_, serviceId, _UPVALUE3_.service)
  if service == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_144, flowName, service, sourceIpAddress, destinationIpAddress, rate
end
function flowcontrolGetAll()
  local L0_150
  L0_150 = db
  L0_150 = L0_150.getTable
  L0_150 = L0_150(flowcontrolTable)
  if L0_150 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_150
end
