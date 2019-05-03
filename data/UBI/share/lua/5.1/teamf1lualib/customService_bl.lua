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
L0_0("teamf1lualib/fwCustomServicesUl")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
servicesTable = "Services"
attribute = {}
attribute.serviceName = "ServiceName"
attribute.protocol = "Protocol"
attribute.destinationPortStart = "DestinationPortStart"
attribute.destinationPortEnd = "DestinationPortEnd"
attribute.typeOfService = "TypeOfService"
attribute.isDefault = "IsDefault"
attribute.multiPort = "MultiPort"
attribute.portType = "PortType"
attribute.portRangeAndValue = "portRange"
attribute.sourcePortStart = "SourcePortStart"
attribute.sourcePortEnd = "SourcePortEnd"
attribute.sourcemultiPort = "SourceMultiPort"
attribute.sourceportRangeAndValue = "sourceportRange"
attribute.destinationportRangeAndValue = "destinationportRange"
servicePageName = "customServices"
protocolTypeList = {
  "TCP",
  "UDP",
  "BOTH",
  "ICMP",
  "ICMPV6"
}
portTypeList = {"PORT_RANGE", "MULTI_PORT"}
function customServicesGetAll()
  local L0_1, L1_2
  L0_1, L1_2 = fw.core.services.customGetAll()
  if L0_1 ~= _UPVALUE0_.SUCCESS then
    return L0_1
  end
  for _FORV_5_, _FORV_6_ in pairs(L1_2) do
    if _FORV_6_[servicesTable .. "." .. attribute.protocol] == "1" then
      _FORV_6_[servicesTable .. "." .. attribute.protocol] = "ICMP"
    elseif _FORV_6_[servicesTable .. "." .. attribute.protocol] == "58" then
      _FORV_6_[servicesTable .. "." .. attribute.protocol] = "ICMPV6"
    elseif _FORV_6_[servicesTable .. "." .. attribute.protocol] == "6" then
      _FORV_6_[servicesTable .. "." .. attribute.protocol] = "TCP"
    elseif _FORV_6_[servicesTable .. "." .. attribute.protocol] == "17" then
      _FORV_6_[servicesTable .. "." .. attribute.protocol] = "UDP"
    else
      _FORV_6_[servicesTable .. "." .. attribute.protocol] = "BOTH"
    end
    if _FORV_6_[servicesTable .. "." .. attribute.portType] == "0" then
      _FORV_6_[servicesTable .. "." .. attribute.portType] = "PORT_RANGE"
      if _FORV_6_[servicesTable .. "." .. attribute.protocol] == "ICMP" or _FORV_6_[servicesTable .. "." .. attribute.protocol] == "ICMPV6" then
        _FORV_6_[servicesTable .. "." .. attribute.destinationportRangeAndValue] = _FORV_6_[servicesTable .. "." .. attribute.destinationPortStart]
      else
        if _FORV_6_[servicesTable .. "." .. attribute.sourcePortStart] == "0" then
          _FORV_6_[servicesTable .. "." .. attribute.sourcePortStart] = ""
        end
        if _FORV_6_[servicesTable .. "." .. attribute.sourcePortEnd] == "0" then
          _FORV_6_[servicesTable .. "." .. attribute.sourcePortEnd] = ""
        end
        if _FORV_6_[servicesTable .. "." .. attribute.destinationPortStart] == "0" then
          _FORV_6_[servicesTable .. "." .. attribute.destinationPortStart] = ""
        end
        if _FORV_6_[servicesTable .. "." .. attribute.destinationPortEnd] == "0" then
          _FORV_6_[servicesTable .. "." .. attribute.destinationPortEnd] = ""
        end
        _FORV_6_[servicesTable .. "." .. attribute.sourceportRangeAndValue] = _FORV_6_[servicesTable .. "." .. attribute.sourcePortStart] .. "-" .. _FORV_6_[servicesTable .. "." .. attribute.sourcePortEnd]
        _FORV_6_[servicesTable .. "." .. attribute.destinationportRangeAndValue] = _FORV_6_[servicesTable .. "." .. attribute.destinationPortStart] .. "-" .. _FORV_6_[servicesTable .. "." .. attribute.destinationPortEnd]
      end
    else
      if _FORV_6_[servicesTable .. "." .. attribute.sourcemultiPort] == "0" then
        _FORV_6_[servicesTable .. "." .. attribute.sourcemultiPort] = ""
      end
      if _FORV_6_[servicesTable .. "." .. attribute.multiPort] == "0" then
        _FORV_6_[servicesTable .. "." .. attribute.multiPort] = ""
      end
      _FORV_6_[servicesTable .. "." .. attribute.portType] = "MULTI_PORT"
      _FORV_6_[servicesTable .. "." .. attribute.sourceportRangeAndValue] = _FORV_6_[servicesTable .. "." .. attribute.sourcemultiPort]
      _FORV_6_[servicesTable .. "." .. attribute.destinationportRangeAndValue] = _FORV_6_[servicesTable .. "." .. attribute.multiPort]
    end
  end
  return L0_1, L1_2
end
function customServicesGet(A0_3)
  local L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10, L8_11, L9_12, L10_13, L11_14, L12_15, L13_16, L14_17, L15_18, L16_19, L17_20
  L12_15 = fw
  L12_15 = L12_15.core
  L12_15 = L12_15.services
  L12_15 = L12_15.rowGet
  L13_16 = A0_3
  L6_9, L7_10, L8_11, L9_12, L10_13, L12_15 = nil, nil, nil, nil, nil, L12_15(L13_16)
  L6_9, L7_10, L8_11, L9_12, L10_13, L13_16 = nil, nil, nil, nil, nil, L12_15(L13_16)
  L6_9, L7_10, L8_11, L9_12, L10_13, L17_20 = nil, nil, nil, nil, nil, L12_15(L13_16)
  L5_8 = L17_20
  L4_7 = L16_19
  L3_6 = L15_18
  L2_5 = L14_17
  L11_14 = L13_16
  L1_4 = L12_15
  L12_15 = _UPVALUE0_
  L12_15 = L12_15.SUCCESS
  if L1_4 ~= L12_15 then
    return L1_4
  end
  L12_15 = tonumber
  L13_16 = L9_12
  L12_15 = L12_15(L13_16)
  if L12_15 == 0 then
    L9_12 = ""
  end
  L12_15 = tonumber
  L13_16 = L10_13
  L12_15 = L12_15(L13_16)
  if L12_15 == 0 then
    L10_13 = ""
  end
  L12_15 = tonumber
  L13_16 = L5_8
  L12_15 = L12_15(L13_16)
  if L12_15 == 0 and L3_6 ~= "1" then
    L5_8 = ""
  end
  L12_15 = tonumber
  L13_16 = L6_9
  L12_15 = L12_15(L13_16)
  if L12_15 == 0 then
    L6_9 = ""
  end
  L12_15 = nil
  if L3_6 == "1" then
    L12_15 = "ICMP"
  elseif L3_6 == "58" then
    L12_15 = "ICMPV6"
  elseif L3_6 == "6" then
    L12_15 = "TCP"
  elseif L3_6 == "17" then
    L12_15 = "UDP"
  else
    L12_15 = "BOTH"
  end
  L13_16 = nil
  for L17_20, _FORV_18_ in L14_17(L15_18) do
    if _FORV_18_ == L12_15 then
      L13_16 = tostring(L17_20)
    end
  end
  if L4_7 == "0" then
  else
  end
  if L12_15 == "ICMP" then
    icmpType = L5_8
    L5_8 = ""
  end
  if L12_15 == "ICMPV6" then
    icmpV6Type = L5_8
    L5_8 = ""
  end
  L17_20 = A0_3
  return L16_19, L17_20, L2_5, L13_16, L15_18, L5_8, L6_9, L7_10, icmpType, icmpV6Type, L8_11, L9_12, L10_13
end
function customServicesGetNext(A0_21)
  local L1_22, L2_23, L3_24, L4_25, L5_26, L6_27, L7_28, L8_29, L9_30, L10_31, L11_32
  L1_22 = A0_21["customServices.cookie"]
  L2_23 = print
  L3_24 = L1_22
  L2_23(L3_24)
  if L1_22 == nil then
    L2_23 = util
    L2_23 = L2_23.appendDebugOut
    L3_24 = "GetNext : Invalid Cookie"
    L2_23(L3_24)
    L2_23 = _UPVALUE0_
    L2_23 = L2_23.BAD_PARAMETER
    return L2_23
  end
  L2_23, L3_24, L4_25, L5_26, L6_27, L7_28, L8_29, L9_30 = nil, nil, nil, nil, nil, nil, nil, nil
  L10_31 = print
  L11_32 = L1_22
  L10_31(L11_32)
  L10_31 = fw
  L10_31 = L10_31.core
  L10_31 = L10_31.services
  L10_31 = L10_31.GetNext
  L11_32 = L1_22
  L4_25, L5_26, L6_27, L7_28, L8_29, L10_31 = nil, nil, nil, nil, nil, L10_31(L11_32)
  L4_25, L5_26, L6_27, L7_28, L8_29, L11_32 = nil, nil, nil, nil, nil, L10_31(L11_32)
  L3_24 = L11_32
  L2_23 = L10_31
  L10_31 = _UPVALUE0_
  L10_31 = L10_31.SUCCESS
  if L2_23 ~= L10_31 then
    return L2_23
  end
  L10_31 = nil
  if L4_25 == "1" then
    L10_31 = "ICMP"
  elseif L4_25 == "58" then
    L10_31 = "ICMPV6"
  elseif L4_25 == "6" then
    L10_31 = "TCP"
  elseif L4_25 == "17" then
    L10_31 = "UDP"
  else
    L10_31 = "BOTH"
  end
  L11_32 = nil
  if L5_26 == "0" then
    L11_32 = "PORT_RANGE"
  else
    L11_32 = "MULTI_PORT"
  end
  return L2_23, L3_24, L10_31, L11_32, L6_27, L7_28, L8_29
end
function customServicesSet(A0_33)
  local L1_34, L2_35, L3_36, L4_37, L5_38, L6_39, L7_40, L8_41, L9_42, L10_43, L11_44, L12_45, L13_46, L14_47, L15_48
  L1_34 = ACCESS_LEVEL
  if L1_34 ~= 0 then
    L1_34 = util
    L1_34 = L1_34.appendDebugOut
    L2_35 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_34(L2_35)
    L1_34 = _UPVALUE0_
    L1_34 = L1_34.UNAUTHORIZED
    return L1_34
  end
  L1_34 = A0_33["customServices.cookie"]
  L2_35 = A0_33["customServices.serviceName"]
  L3_36 = protocolTypeList
  L4_37 = tonumber
  L5_38 = A0_33["customServices.protocol"]
  L4_37 = L4_37(L5_38)
  L3_36 = L3_36[L4_37]
  L4_37 = portTypeList
  L5_38 = tonumber
  L6_39 = A0_33["customServices.portType"]
  L5_38 = L5_38(L6_39)
  L4_37 = L4_37[L5_38]
  L5_38 = A0_33["customServices.multiPort"]
  L6_39 = A0_33["customServices.destinationPortStart"]
  L7_40 = A0_33["customServices.destinationPortEnd"]
  L8_41 = A0_33["customServices.icmpType"]
  L9_42 = A0_33["customServices.sourcemultiPort"]
  L10_43 = A0_33["customServices.sourcePortStart"]
  L11_44 = A0_33["customServices.sourcePortEnd"]
  if L1_34 == nil then
    L12_45 = util
    L12_45 = L12_45.appendDebugOut
    L13_46 = "Set : Invalid Cookie"
    L12_45(L13_46)
    L12_45 = _UPVALUE0_
    L12_45 = L12_45.BAD_PARAMETER
    return L12_45
  end
  if L3_36 == nil or L3_36 ~= "ICMP" and L3_36 ~= "ICMPV6" and L4_37 == nil then
    L12_45 = util
    L12_45 = L12_45.appendDebugOut
    L13_46 = "GetNext : Invalid Cookie"
    L12_45(L13_46)
    L12_45 = _UPVALUE0_
    L12_45 = L12_45.BAD_PARAMETER
    return L12_45
  end
  L12_45 = tonumber
  L13_46 = L5_38
  L12_45 = L12_45(L13_46)
  if L12_45 ~= 0 then
    L12_45 = tonumber
    L13_46 = L9_42
    L12_45 = L12_45(L13_46)
  elseif L12_45 == 0 then
    L12_45 = _UPVALUE0_
    L12_45 = L12_45.INVALID_PORT_NUMBER
    return L12_45
  end
  L12_45, L13_46 = nil, nil
  if L3_36 ~= "ICMP" and L3_36 ~= "ICMPV6" and L3_36 ~= "TCP" and L3_36 ~= "UDP" and L3_36 ~= "BOTH" then
    L14_47 = _UPVALUE0_
    L14_47 = L14_47.INVALID_ARGUMENT
    return L14_47
  end
  L14_47 = nil
  if L3_36 == "ICMP" then
    L14_47 = "1"
  elseif L3_36 == "ICMPV6" then
    L14_47 = "58"
  elseif L3_36 == "TCP" then
    L14_47 = "6"
  elseif L3_36 == "UDP" then
    L14_47 = "17"
  else
    L14_47 = "256"
  end
  if L4_37 ~= nil and L4_37 ~= "PORT_RANGE" and L4_37 ~= "MULTI_PORT" then
    L15_48 = _UPVALUE0_
    L15_48 = L15_48.INVALID_ARGUMENT
    return L15_48
  end
  L15_48 = nil
  if L4_37 == "PORT_RANGE" then
    L5_38 = ""
    L9_42 = ""
    L15_48 = "0"
    if L10_43 == "" or L10_43 == nil then
      L10_43 = "0"
      L11_44 = "0"
    end
    if L6_39 == "" or L6_39 == nil then
      L6_39 = "0"
      L7_40 = "0"
    end
  else
    L15_48 = "2"
    L10_43 = "0"
    L11_44 = "0"
    L6_39 = "0"
    L7_40 = "0"
    if L5_38 == "" or L5_38 == nil then
      L5_38 = "0"
    end
    if L9_42 == "" or L9_42 == nil then
      L9_42 = "0"
    end
  end
  if L3_36 == "ICMP" or L3_36 == "ICMPV6" then
    L15_48 = "0"
    L6_39 = L8_41
    L7_40 = "0"
    L10_43 = "0"
    L11_44 = "0"
    L5_38 = ""
    L9_42 = ""
  end
  _UPVALUE1_.start()
  L12_45, L13_46 = fw.ul.services.edit(L2_35, L14_47, L15_48, L5_38, L6_39, L7_40, L9_42, L10_43, L11_44, L1_34)
  if L12_45 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L12_45)
    _UPVALUE1_.abort()
    return L12_45, L1_34
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L13_46
end
function customServicesDelete(A0_49)
  local L1_50, L2_51
  L1_50 = ACCESS_LEVEL
  if L1_50 ~= 0 then
    L1_50 = util
    L1_50 = L1_50.appendDebugOut
    L2_51 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_50(L2_51)
    L1_50 = _UPVALUE0_
    L1_50 = L1_50.UNAUTHORIZED
    return L1_50
  end
  L1_50 = A0_49["customServices.cookie"]
  if L1_50 == nil then
    L2_51 = util
    L2_51 = L2_51.appendDebugOut
    L2_51("Delete : Invalid Cookie")
    L2_51 = _UPVALUE0_
    L2_51 = L2_51.BAD_PARAMETER
    return L2_51
  end
  L2_51 = nil
  _UPVALUE1_.start()
  L2_51, cookie = fw.ul.services.delete(L1_50)
  if L2_51 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L2_51)
    _UPVALUE1_.abort()
    return L2_51, L1_50
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function customServicesDefaultsGet()
  local L0_52, L1_53, L2_54, L3_55, L4_56, L5_57, L7_58, L8_59, L9_60, L10_61, L11_62, L12_63, L13_64
  L1_53 = "TCP"
  L2_54 = "PORT_RANGE"
  L7_58 = _UPVALUE0_
  L7_58 = L7_58.SUCCESS
  L8_59 = 0
  L9_60 = L0_52
  L10_61 = L1_53
  L11_62 = L2_54
  L12_63 = L3_55
  L13_64 = L4_56
  return L7_58, L8_59, L9_60, L10_61, L11_62, L12_63, L13_64, L5_57
end
function customServicesCreate(A0_65)
  local L1_66, L2_67, L3_68, L4_69, L5_70, L6_71, L7_72, L8_73, L9_74, L10_75, L11_76, L12_77, L13_78, L14_79
  L1_66 = ACCESS_LEVEL
  if L1_66 ~= 0 then
    L1_66 = util
    L1_66 = L1_66.appendDebugOut
    L2_67 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_66(L2_67)
    L1_66 = _UPVALUE0_
    L1_66 = L1_66.UNAUTHORIZED
    return L1_66
  end
  L1_66 = A0_65["customServices.serviceName"]
  L2_67 = protocolTypeList
  L3_68 = tonumber
  L4_69 = A0_65["customServices.protocol"]
  L3_68 = L3_68(L4_69)
  L2_67 = L2_67[L3_68]
  L3_68 = portTypeList
  L4_69 = tonumber
  L5_70 = A0_65["customServices.portType"]
  L4_69 = L4_69(L5_70)
  L3_68 = L3_68[L4_69]
  L4_69 = A0_65["customServices.multiPort"]
  L5_70 = A0_65["customServices.destinationPortStart"]
  L6_71 = A0_65["customServices.destinationPortEnd"]
  L7_72 = A0_65["customServices.icmpType"]
  L8_73 = A0_65["customServices.sourcemultiPort"]
  L9_74 = A0_65["customServices.sourcePortStart"]
  L10_75 = A0_65["customServices.sourcePortEnd"]
  if L1_66 == nil or L2_67 == nil then
    L11_76 = util
    L11_76 = L11_76.appendDebugOut
    L12_77 = "GetNext : Invalid Cookie"
    L11_76(L12_77)
    L11_76 = _UPVALUE0_
    L11_76 = L11_76.BAD_PARAMETER
    return L11_76
  end
  L11_76 = tonumber
  L12_77 = L4_69
  L11_76 = L11_76(L12_77)
  if L11_76 ~= 0 then
    L11_76 = tonumber
    L12_77 = L8_73
    L11_76 = L11_76(L12_77)
  elseif L11_76 == 0 then
    L11_76 = _UPVALUE0_
    L11_76 = L11_76.INVALID_PORT_NUMBER
    return L11_76
  end
  L11_76, L12_77, L13_78 = nil, nil, nil
  if L2_67 == "ICMP" then
    L13_78 = "1"
  elseif L2_67 == "ICMPV6" then
    L13_78 = "58"
  elseif L2_67 == "TCP" then
    L13_78 = "6"
  elseif L2_67 == "UDP" then
    L13_78 = "17"
  else
    L13_78 = "256"
  end
  L14_79 = nil
  if L3_68 == "PORT_RANGE" then
    L4_69 = ""
    L8_73 = ""
    L14_79 = "0"
    if L9_74 == "" or L9_74 == nil then
      L9_74 = "0"
      L10_75 = "0"
    end
    if L5_70 == "" or L5_70 == nil then
      L5_70 = "0"
      L6_71 = "0"
    end
  else
    L14_79 = "2"
    L9_74 = "0"
    L10_75 = "0"
    L5_70 = "0"
    L6_71 = "0"
    if L4_69 == "" or L4_69 == nil then
      L4_69 = "0"
    end
    if L8_73 == "" or L8_73 == nil then
      L8_73 = "0"
    end
  end
  if L2_67 == "ICMP" or L2_67 == "ICMPV6" then
    L14_79 = "0"
    L5_70 = L7_72
    L6_71 = "0"
    L9_74 = "0"
    L10_75 = "0"
    L4_69 = ""
    L8_73 = ""
  end
  _UPVALUE1_.start()
  L11_76, L12_77 = fw.core.services.add(L1_66, L13_78, L14_79, L4_69, L5_70, L6_71, L8_73, L9_74, L10_75)
  if L11_76 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L11_76)
    _UPVALUE1_.abort()
    return L11_76, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L12_77
end
function customServicesDeleteAll()
  local L0_80
  L0_80 = ACCESS_LEVEL
  if L0_80 ~= 0 then
    L0_80 = util
    L0_80 = L0_80.appendDebugOut
    L0_80("Detected Unauthorized access for page DUMMY PAGE")
    L0_80 = _UPVALUE0_
    L0_80 = L0_80.UNAUTHORIZED
    return L0_80
  end
  L0_80 = nil
  _UPVALUE1_.start()
  L0_80, cookie = fw.ul.services.deleteAll()
  if L0_80 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L0_80)
    _UPVALUE1_.abort()
    return L0_80, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
