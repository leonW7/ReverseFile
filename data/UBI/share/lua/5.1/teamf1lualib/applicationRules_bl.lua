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
L0_0("teamf1lualib/fwApplicationRules")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
protocolList = {"TCP", "UDP"}
interfaceList = {"LAN", "DMZ"}
function applicationRulesGetAll()
  local L0_1, L1_2
  L0_1, L1_2 = fw.core.portTriggering.GetAll()
  for _FORV_5_, _FORV_6_ in pairs(L1_2) do
    if _FORV_6_.Protocol == "6" then
      _FORV_6_.Protocol = "TCP"
    elseif _FORV_6_.Protocol == "17" then
      _FORV_6_.Protocol = "UDP"
    else
      _FORV_6_.Protocol = "BOTH"
    end
    if _FORV_6_.Interface == "SECURE" then
      _FORV_6_.Interface = "LAN"
    elseif _FORV_6_.Interface == "PUBLIC" then
      _FORV_6_.Interface = "DMZ"
    else
      _FORV_6_.Interface = "WAN"
    end
  end
  if L0_1 ~= _UPVALUE0_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2
end
function applicationRulesGet(A0_3)
  local L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10, L8_11, L9_12, L10_13, L11_14, L12_15, L13_16
  L11_14 = fw
  L11_14 = L11_14.core
  L11_14 = L11_14.portTriggering
  L11_14 = L11_14.rowGet
  L12_15 = A0_3
  L3_6, L4_7, L5_8, L6_9, L7_10, L8_11, L9_12, L11_14 = nil, nil, nil, nil, nil, nil, nil, L11_14(L12_15)
  L3_6, L4_7, L5_8, L6_9, L7_10, L8_11, L9_12, L12_15 = nil, nil, nil, nil, nil, nil, nil, L11_14(L12_15)
  L3_6, L4_7, L5_8, L6_9, L7_10, L8_11, L9_12, L13_16 = nil, nil, nil, nil, nil, nil, nil, L11_14(L12_15)
  L2_5 = L13_16
  L10_13 = L12_15
  L1_4 = L11_14
  L11_14 = nil
  if L5_8 == "6" then
    L11_14 = "1"
  else
    L11_14 = "2"
  end
  L12_15 = nil
  if L4_7 == "SECURE" then
    L12_15 = "1"
  elseif L4_7 == "PUBLIC" then
    L12_15 = "2"
  else
    L12_15 = "3"
  end
  L13_16 = _UPVALUE0_
  L13_16 = L13_16.SUCCESS
  if L1_4 ~= L13_16 then
    return L1_4
  end
  L13_16 = {}
  L13_16.ruleName = L2_5
  L13_16.ruleStatus = L3_6
  L13_16.interface = L12_15
  L13_16.protocol = L11_14
  L13_16.outgoingPortStart = L6_9
  L13_16.outgoingPortEnd = L7_10
  L13_16.incomingPortStart = L8_11
  L13_16.incomingPortEnd = L9_12
  return L1_4, L10_13, L13_16
end
function applicationRulesGetNext(A0_17)
  local L1_18, L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26, L10_27, L11_28, L12_29, L13_30, L14_31
  L1_18 = A0_17["applicationRules.cookie"]
  if L1_18 == nil then
    L2_19 = util
    L2_19 = L2_19.appendDebugOut
    L3_20 = "GetNext : Invalid Cookie"
    L2_19(L3_20)
    L2_19 = _UPVALUE0_
    L2_19 = L2_19.BAD_PARAMETER
    return L2_19
  end
  L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26, L10_27, L11_28 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L12_29 = fw
  L12_29 = L12_29.core
  L12_29 = L12_29.portTriggering
  L12_29 = L12_29.GetNext
  L13_30 = L11_28
  L4_21, L5_22, L6_23, L7_24, L8_25, L9_26, L10_27, L12_29 = nil, nil, nil, nil, nil, nil, nil, L12_29(L13_30)
  L4_21, L5_22, L6_23, L7_24, L8_25, L9_26, L10_27, L13_30 = nil, nil, nil, nil, nil, nil, nil, L12_29(L13_30)
  L4_21, L5_22, L6_23, L7_24, L8_25, L9_26, L10_27, L14_31 = nil, nil, nil, nil, nil, nil, nil, L12_29(L13_30)
  L3_20 = L14_31
  L11_28 = L13_30
  L2_19 = L12_29
  L12_29 = _UPVALUE0_
  L12_29 = L12_29.SUCCESS
  if L2_19 ~= L12_29 then
    return L2_19
  end
  L12_29 = nil
  if L6_23 == "6" then
    L12_29 = "1"
  else
    L12_29 = "2"
  end
  L13_30 = nil
  if L5_22 == "SECURE" then
    L13_30 = "1"
  elseif L5_22 == "PUBLIC" then
    L13_30 = "2"
  else
    L13_30 = "3"
  end
  L14_31 = _UPVALUE0_
  L14_31 = L14_31.SUCCESS
  if L2_19 ~= L14_31 then
    return L2_19
  end
  L14_31 = {}
  L14_31.ruleName = L3_20
  L14_31.ruleStatus = L4_21
  L14_31.interface = L13_30
  L14_31.protocol = L12_29
  L14_31.outgoingPortStart = L7_24
  L14_31.outgoingPortEnd = L8_25
  L14_31.incomingPortStart = L9_26
  L14_31.incomingPortEnd = L10_27
  return L2_19, L11_28, L14_31
end
function applicationRulesSet(A0_32)
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
  L1_33 = A0_32["applicationRules.cookie"]
  L2_34 = A0_32["applicationRules.ruleName"]
  L3_35 = A0_32["applicationRules.ruleStatus"]
  L4_36 = interfaceList
  L5_37 = tonumber
  L6_38 = A0_32["applicationRules.interface"]
  L5_37 = L5_37(L6_38)
  L4_36 = L4_36[L5_37]
  L5_37 = protocolList
  L6_38 = tonumber
  L7_39 = A0_32["applicationRules.protocol"]
  L6_38 = L6_38(L7_39)
  L5_37 = L5_37[L6_38]
  L6_38 = A0_32["applicationRules.outgoingPortStart"]
  L7_39 = A0_32["applicationRules.outgoingPortEnd"]
  L8_40 = A0_32["applicationRules.incomingPortStart"]
  L9_41 = A0_32["applicationRules.incomingPortEnd"]
  if L3_35 == nil or L5_37 == nil or L4_36 == nil then
    L10_42 = util
    L10_42 = L10_42.appendDebugOut
    L11_43 = "GetNext : Invalid Cookie"
    L10_42(L11_43)
    L10_42 = _UPVALUE0_
    L10_42 = L10_42.BAD_PARAMETER
    return L10_42
  end
  L10_42 = nil
  if L5_37 ~= "TCP" and L5_37 ~= "BOTH" and L5_37 ~= "UDP" then
    L11_43 = _UPVALUE0_
    L11_43 = L11_43.INVALID_ARGUMENT
    return L11_43
  end
  L11_43 = nil
  if L5_37 == "TCP" then
    L11_43 = "6"
  elseif L5_37 == "UDP" then
    L11_43 = "17"
  else
    L11_43 = "256"
  end
  if L4_36 ~= "LAN" and L4_36 ~= "DMZ" and L4_36 ~= "WAN" then
    L12_44 = _UPVALUE0_
    L12_44 = L12_44.INVALID_ARGUMENT
    return L12_44
  end
  L12_44 = nil
  if L4_36 == "LAN" then
    L12_44 = "SECURE"
  elseif L4_36 == "DMZ" then
    L12_44 = "PUBLIC"
  else
    L12_44 = "INSECURE"
  end
  _UPVALUE1_.start()
  L10_42, L1_33 = fw.core.portTriggering.edit(L2_34, L3_35, L12_44, L11_43, L6_38, L7_39, L8_40, L9_41, L1_33)
  if L10_42 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L10_42)
    _UPVALUE1_.abort()
    return L10_42, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L1_33
end
function applicationRulesDelete(A0_45)
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
  L1_46 = A0_45["applicationRules.cookie"]
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
  L2_47, cookie = fw.core.portTriggering.delete(L1_46)
  if L2_47 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L2_47)
    _UPVALUE1_.abort()
    return L2_47, L1_46
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function applicationRulesDefaultsGet()
  local L0_48, L1_49, L2_50, L3_51, L4_52, L5_53, L6_54, L7_55, L9_56, L10_57, L11_58, L12_59, L13_60, L14_61, L15_62, L16_63, L17_64
  L3_51 = "TCP"
  L2_50 = "LAN"
  L9_56 = _UPVALUE0_
  L9_56 = L9_56.SUCCESS
  L10_57 = 0
  L11_58 = L0_48
  L12_59 = L1_49
  L13_60 = L2_50
  L14_61 = L3_51
  L15_62 = L4_52
  L16_63 = L5_53
  L17_64 = L6_54
  return L9_56, L10_57, L11_58, L12_59, L13_60, L14_61, L15_62, L16_63, L17_64, L7_55
end
function applicationRulesCreate(A0_65)
  local L1_66, L2_67, L3_68, L4_69, L5_70, L6_71, L7_72, L8_73, L9_74, L10_75, L11_76, L12_77
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
  L1_66 = A0_65["applicationRules.ruleName"]
  L2_67 = A0_65["applicationRules.ruleStatus"]
  L3_68 = interfaceList
  L4_69 = tonumber
  L5_70 = A0_65["applicationRules.interface"]
  L4_69 = L4_69(L5_70)
  L3_68 = L3_68[L4_69]
  L4_69 = protocolList
  L5_70 = tonumber
  L6_71 = A0_65["applicationRules.protocol"]
  L5_70 = L5_70(L6_71)
  L4_69 = L4_69[L5_70]
  L5_70 = A0_65["applicationRules.outgoingPortStart"]
  L6_71 = A0_65["applicationRules.outgoingPortEnd"]
  L7_72 = A0_65["applicationRules.incomingPortStart"]
  L8_73 = A0_65["applicationRules.incomingPortEnd"]
  if L2_67 == nil or L4_69 == nil or L3_68 == nil then
    L9_74 = util
    L9_74 = L9_74.appendDebugOut
    L10_75 = "GetNext : Invalid Cookie"
    L9_74(L10_75)
    L9_74 = _UPVALUE0_
    L9_74 = L9_74.BAD_PARAMETER
    return L9_74
  end
  L9_74, L10_75 = nil, nil
  if L4_69 ~= "TCP" and L4_69 ~= "BOTH" and L4_69 ~= "UDP" then
    L11_76 = _UPVALUE0_
    L11_76 = L11_76.INVALID_ARGUMENT
    return L11_76
  end
  L11_76 = nil
  if L4_69 == "TCP" then
    L11_76 = "6"
  elseif L4_69 == "UDP" then
    L11_76 = "17"
  else
    L11_76 = "BOTH"
  end
  if L3_68 ~= "LAN" and L3_68 ~= "DMZ" and L3_68 ~= "WAN" then
    L12_77 = _UPVALUE0_
    L12_77 = L12_77.INVALID_ARGUMENT
    return L12_77
  end
  L12_77 = nil
  if L3_68 == "LAN" then
    L12_77 = "SECURE"
  elseif L3_68 == "DMZ" then
    L12_77 = "PUBLIC"
  else
    L12_77 = "INSECURE"
  end
  _UPVALUE1_.start()
  L9_74, L10_75 = fw.core.portTriggering.add(L1_66, L2_67, L12_77, L11_76, L5_70, L6_71, L7_72, L8_73)
  if L9_74 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L9_74)
    _UPVALUE1_.abort()
    return L9_74, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L10_75
end
function applicationRulesDeleteAll()
  local L0_78
  L0_78 = ACCESS_LEVEL
  if L0_78 ~= 0 then
    L0_78 = util
    L0_78 = L0_78.appendDebugOut
    L0_78("Detected Unauthorized access for page DUMMY PAGE")
    L0_78 = _UPVALUE0_
    L0_78 = L0_78.UNAUTHORIZED
    return L0_78
  end
  L0_78 = nil
  _UPVALUE1_.start()
  L0_78 = fw.core.portTriggering.deleteAll()
  if L0_78 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L0_78)
    _UPVALUE1_.abort()
    return L0_78
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function snmpApplicationRulesDelete(A0_79)
  local L1_80, L2_81
  _UPVALUE0_.start()
  L1_80, L2_81 = fw.core.portTriggering.snmpDelete(A0_79)
  if L1_80 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L1_80)
    _UPVALUE0_.abort()
    return L1_80.FAILURE
  end
  _UPVALUE0_.complete()
  _UPVALUE0_.save()
  return _UPVALUE1_.SUCCESS
end
