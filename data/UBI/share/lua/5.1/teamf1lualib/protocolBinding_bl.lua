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
L0_0("teamf1lualib/fwProtocolBinding")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/fwCustomServices")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
statueType = {"Disable", "Enable"}
optionType = {
  "Dedicated WAN",
  "Configurable WAN",
  "WAN3 (3G Internet)"
}
;({}).serviceName = "ServiceName"
;({}).ruleStatus = "Enabled"
;({}).localGatewayType = "LocalGatewayType"
;({}).sourceNetworkType = "SourceNetworkType"
;({}).sourceNetworkStart = "SourceNetworkStart"
;({}).sourceNetworkEnd = "SourceNetworkEnd"
;({}).destinationNetworkType = "DestinationNetworkType"
;({}).destinationNetworkStart = "DestinationNetworkStart"
;({}).destinationNetworkEnd = "DestinationNetworkEnd"
;({}).sourceNetwork = "sourceNetwork"
;({}).destinationNetwork = "destinationNetwork"
PROTOCOL_COOKIE = "protocolBinding.cookie"
DISABLED = "0"
ENABLED = "1"
function serviceNameGetAll()
  local L0_1, L1_2
  L0_1 = fw
  L0_1 = L0_1.core
  L0_1 = L0_1.services
  L0_1 = L0_1.GetAll
  L1_2 = L0_1()
  if L0_1 ~= _UPVALUE0_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2
end
function networkTypeMapPb(A0_3)
  local L1_4
  if A0_3 == "1" then
    A0_3 = "0"
  elseif A0_3 == "2" then
    A0_3 = "1"
  elseif A0_3 == "3" then
    A0_3 = "2"
  end
  return A0_3
end
function protocolBindingGet(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14, L10_15, L11_16
  L1_6, L11_16, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14, L10_15 = fw.core.protocolBinding.rowGet(A0_5)
  if L1_6 ~= _UPVALUE0_.SUCCESS then
    return L1_6
  end
  return L1_6, L11_16, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14, L10_15
end
function protocolBindingGetAll()
  local L0_17, L1_18
  L0_17, L1_18 = fw.core.protocolBinding.GetAll()
  if L0_17 ~= _UPVALUE0_.SUCCESS then
    return L0_17
  end
  for _FORV_5_, _FORV_6_ in pairs(L1_18) do
    _FORV_6_[_UPVALUE1_.ruleStatus] = statueType[tonumber(_FORV_6_[_UPVALUE1_.ruleStatus]) + 1]
    _FORV_6_[_UPVALUE1_.localGatewayType] = optionType[tonumber(_FORV_6_[_UPVALUE1_.localGatewayType])]
    if _FORV_6_[_UPVALUE1_.sourceNetworkType] == "0" then
      _FORV_6_[_UPVALUE1_.sourceNetwork] = "Any"
    elseif _FORV_6_[_UPVALUE1_.sourceNetworkType] == "2" then
      _FORV_6_[_UPVALUE1_.sourceNetwork] = _FORV_6_[_UPVALUE1_.sourceNetworkStart] .. "-" .. _FORV_6_[_UPVALUE1_.sourceNetworkEnd]
    else
      _FORV_6_[_UPVALUE1_.sourceNetwork] = _FORV_6_[_UPVALUE1_.sourceNetworkStart]
    end
    if _FORV_6_[_UPVALUE1_.destinationNetworkType] == "0" then
      _FORV_6_[_UPVALUE1_.destinationNetwork] = "Any"
    elseif _FORV_6_[_UPVALUE1_.destinationNetworkType] == "2" then
      _FORV_6_[_UPVALUE1_.destinationNetwork] = _FORV_6_[_UPVALUE1_.destinationNetworkStart] .. "-" .. _FORV_6_[_UPVALUE1_.destinationNetworkEnd]
    else
      _FORV_6_[_UPVALUE1_.destinationNetwork] = _FORV_6_[_UPVALUE1_.destinationNetworkStart]
    end
  end
  return L0_17, L1_18
end
function protocolBindingGetNext(A0_19)
  local L1_20, L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27, L9_28, L10_29, L11_30, L12_31
  L1_20 = A0_19["protocolBinding.cookie"]
  if L1_20 == nil then
    L2_21 = util
    L2_21 = L2_21.appendDebugOut
    L3_22 = "GetNext : Invalid Cookie"
    L2_21(L3_22)
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.BAD_PARAMETER
    return L2_21
  end
  L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27, L9_28, L10_29, L11_30, L12_31 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L2_21, L12_31, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27, L9_28, L10_29, L11_30 = fw.core.protocolBinding.GetNext(L1_20)
  if L2_21 ~= _UPVALUE0_.SUCCESS then
    return L2_21
  end
  return L2_21, L12_31, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27, L9_28, L10_29, L11_30
end
function protocolBindingSet(A0_32)
  local L1_33, L2_34, L3_35, L4_36, L5_37, L6_38, L7_39, L8_40, L9_41, L10_42, L11_43, L12_44
  L1_33 = ACCESS_LEVEL
  if L1_33 ~= 0 then
    L1_33 = util
    L1_33 = L1_33.appendDebugOut
    L2_34 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_33(L2_34)
    L1_33 = _UPVALUE0_
    L1_33 = L1_33.UNAUTHORIZED
    return L1_33
  end
  L1_33 = A0_32["protocolBinding.cookie"]
  L2_34 = A0_32["protocolBinding.serviceName"]
  L3_35 = "1"
  L4_36 = A0_32["protocolBinding.localGatewayType"]
  L5_37 = networkTypeMapPb
  L6_38 = A0_32["protocolBinding.sourceNetworkType"]
  L5_37 = L5_37(L6_38)
  L6_38 = A0_32["protocolBinding.sourceNetworkStart"]
  L7_39 = A0_32["protocolBinding.sourceNetworkEnd"]
  L8_40 = networkTypeMapPb
  L9_41 = A0_32["protocolBinding.destinationNetworkType"]
  L8_40 = L8_40(L9_41)
  L9_41 = A0_32["protocolBinding.destinationNetworkStart"]
  L10_42 = A0_32["protocolBinding.destinationNetworkEnd"]
  if L1_33 == nil then
    L11_43 = util
    L11_43 = L11_43.appendDebugOut
    L12_44 = "Set : Invalid Cookie"
    L11_43(L12_44)
    L11_43 = _UPVALUE0_
    L11_43 = L11_43.BAD_PARAMETER
    return L11_43
  end
  if L2_34 == nil or L4_36 == nil or L5_37 == nil or L8_40 == nil then
    L11_43 = util
    L11_43 = L11_43.appendDebugOut
    L12_44 = "GetNext : Invalid Cookie"
    L11_43(L12_44)
    L11_43 = _UPVALUE0_
    L11_43 = L11_43.BAD_PARAMETER
    return L11_43
  end
  L11_43, L12_44 = nil, nil
  _UPVALUE1_.start()
  L11_43, L12_44 = fw.core.protocolBinding.edit(L2_34, L3_35, L4_36, L5_37, L6_38, L7_39, L8_40, L9_41, L10_42, L1_33)
  if L11_43 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L11_43)
    _UPVALUE1_.abort()
    return L11_43, L1_33
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L12_44
end
function protocolBindingDelete(A0_45)
  local L1_46, L2_47
  L1_46 = ACCESS_LEVEL
  if L1_46 ~= 0 then
    L1_46 = util
    L1_46 = L1_46.appendDebugOut
    L2_47 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_46(L2_47)
    L1_46 = _UPVALUE0_
    L1_46 = L1_46.UNAUTHORIZED
    return L1_46
  end
  L1_46 = PROTOCOL_COOKIE
  L1_46 = A0_45[L1_46]
  if L1_46 == nil then
    L2_47 = util
    L2_47 = L2_47.appendDebugOut
    L2_47("Delete : Invalid Cookie")
    L2_47 = _UPVALUE0_
    L2_47 = L2_47.BAD_PARAMETER
    return L2_47
  end
  L2_47 = nil
  _UPVALUE1_.start()
  L2_47, cookie = fw.core.protocolBinding.delete(L1_46)
  if L2_47 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L2_47)
    _UPVALUE1_.abort()
    return L2_47, L1_46
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function protocolBindingDefaultsGet()
  local L0_48, L1_49, L2_50, L3_51, L4_52, L5_53, L6_54, L7_55, L8_56, L10_57, L11_58, L12_59, L13_60, L14_61, L15_62, L16_63, L17_64, L18_65, L19_66
  L0_48 = "ANY"
  L2_50 = "1"
  L3_51 = "0"
  L6_54 = "0"
  L10_57 = _UPVALUE0_
  L10_57 = L10_57.SUCCESS
  L11_58 = 0
  L12_59 = L0_48
  L13_60 = L1_49
  L14_61 = L2_50
  L15_62 = L3_51
  L16_63 = L4_52
  L17_64 = L5_53
  L18_65 = L6_54
  L19_66 = L7_55
  return L10_57, L11_58, L12_59, L13_60, L14_61, L15_62, L16_63, L17_64, L18_65, L19_66, L8_56
end
function protocolBindingCreate(A0_67)
  local L1_68, L2_69, L3_70, L4_71, L5_72, L6_73, L7_74, L8_75, L9_76, L10_77, L11_78
  L1_68 = ACCESS_LEVEL
  if L1_68 ~= 0 then
    L1_68 = util
    L1_68 = L1_68.appendDebugOut
    L2_69 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_68(L2_69)
    L1_68 = _UPVALUE0_
    L1_68 = L1_68.UNAUTHORIZED
    return L1_68
  end
  L1_68 = A0_67["protocolBinding.serviceName"]
  L2_69 = "1"
  L3_70 = A0_67["protocolBinding.localGatewayType"]
  L4_71 = networkTypeMapPb
  L5_72 = A0_67["protocolBinding.sourceNetworkType"]
  L4_71 = L4_71(L5_72)
  L5_72 = A0_67["protocolBinding.sourceNetworkStart"]
  L6_73 = A0_67["protocolBinding.sourceNetworkEnd"]
  L7_74 = networkTypeMapPb
  L8_75 = A0_67["protocolBinding.destinationNetworkType"]
  L7_74 = L7_74(L8_75)
  L8_75 = A0_67["protocolBinding.destinationNetworkStart"]
  L9_76 = A0_67["protocolBinding.destinationNetworkEnd"]
  if L1_68 == nil or L3_70 == nil or L4_71 == nil or L7_74 == nil then
    L10_77 = util
    L10_77 = L10_77.appendDebugOut
    L11_78 = "GetNext : Invalid Cookie"
    L10_77(L11_78)
    L10_77 = _UPVALUE0_
    L10_77 = L10_77.BAD_PARAMETER
    return L10_77
  end
  L10_77, L11_78 = nil, nil
  _UPVALUE1_.start()
  L10_77, L11_78 = fw.core.protocolBinding.add(L1_68, L3_70, L4_71, L5_72, L6_73, L7_74, L8_75, L9_76)
  if L10_77 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L10_77)
    _UPVALUE1_.abort()
    return L10_77, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L11_78
end
function protocolBindingDeleteAll(A0_79)
  local L1_80, L2_81, L3_82, L4_83, L5_84, L6_85
  L1_80 = ACCESS_LEVEL
  if L1_80 ~= 0 then
    L1_80 = util
    L1_80 = L1_80.appendDebugOut
    L1_80(L2_81)
    L1_80 = _UPVALUE0_
    L1_80 = L1_80.UNAUTHORIZED
    return L1_80
  end
  L1_80 = _UPVALUE0_
  L1_80 = L1_80.NIL
  if A0_79 == L1_80 then
    L1_80 = _UPVALUE0_
    L1_80 = L1_80.BAD_PARAMETER
    return L1_80
  end
  L1_80 = nil
  L2_81()
  for L5_84, L6_85 in L2_81(L3_82) do
    L1_80, cookie = fw.core.protocolBinding.delete(L6_85)
    if L1_80 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L1_80)
      _UPVALUE1_.abort()
      return L1_80, curCookie
    end
  end
  L2_81()
  L2_81()
  return L2_81, L3_82
end
function protocolBindingDisable(A0_86)
  local L1_87, L2_88
  L1_87 = ACCESS_LEVEL
  if L1_87 ~= 0 then
    L1_87 = util
    L1_87 = L1_87.appendDebugOut
    L2_88 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_87(L2_88)
    L1_87 = _UPVALUE0_
    L1_87 = L1_87.UNAUTHORIZED
    return L1_87
  end
  L1_87 = PROTOCOL_COOKIE
  L1_87 = A0_86[L1_87]
  L2_88 = nil
  _UPVALUE1_.start()
  L2_88, curCookie = fw.core.protocolBinding.ruleStatusSet(L1_87, DISABLED)
  if L2_88 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L2_88)
    _UPVALUE1_.abort()
    return L2_88, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L1_87
end
function protocolBindingEnable(A0_89)
  local L1_90, L2_91
  L1_90 = ACCESS_LEVEL
  if L1_90 ~= 0 then
    L1_90 = util
    L1_90 = L1_90.appendDebugOut
    L2_91 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_90(L2_91)
    L1_90 = _UPVALUE0_
    L1_90 = L1_90.UNAUTHORIZED
    return L1_90
  end
  L1_90 = PROTOCOL_COOKIE
  L1_90 = A0_89[L1_90]
  L2_91 = nil
  _UPVALUE1_.start()
  L2_91, L1_90 = fw.core.protocolBinding.ruleStatusSet(L1_90, ENABLED)
  if L2_91 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L2_91)
    _UPVALUE1_.abort()
    return L2_91, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L1_90
end
function protocolBindingDisableAll()
  local L0_92
  L0_92 = ACCESS_LEVEL
  if L0_92 ~= 0 then
    L0_92 = util
    L0_92 = L0_92.appendDebugOut
    L0_92("Detected Unauthorized access for page DUMMY PAGE")
    L0_92 = _UPVALUE0_
    L0_92 = L0_92.UNAUTHORIZED
    return L0_92
  end
  L0_92 = nil
  _UPVALUE1_.start()
  L0_92, cookie = fw.core.protocolBinding.DisableAll()
  if L0_92 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L0_92)
    _UPVALUE1_.abort()
    return L0_92, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function protocolBindingEnableAll()
  local L0_93
  L0_93 = ACCESS_LEVEL
  if L0_93 ~= 0 then
    L0_93 = util
    L0_93 = L0_93.appendDebugOut
    L0_93("Detected Unauthorized access for page DUMMY PAGE")
    L0_93 = _UPVALUE0_
    L0_93 = L0_93.UNAUTHORIZED
    return L0_93
  end
  L0_93 = nil
  _UPVALUE1_.start()
  L0_93, cookie = fw.core.protocolBinding.EnableAll()
  if L0_93 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L0_93)
    _UPVALUE1_.abort()
    return L0_93, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
