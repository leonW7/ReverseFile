local L0_0
L0_0 = module
L0_0("com.teamf1.bl.lanqos.priority", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/lanqos_priority")
L0_0 = "1"
function advancedQosPolicyGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16
  returnCode, L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L15_16 = _UPVALUE0_.policyGet()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  L5_6 = _UPVALUE2_[tonumber(L5_6) + 1]
  for _FORV_19_, _FORV_20_ in pairs(_UPVALUE3_) do
    if L2_3 == _FORV_20_ then
      L2_3 = _FORV_19_
    end
  end
  return returnCode, L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L15_16
end
function advancedQosPolicyGetNext(A0_17)
  local L1_18, L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26, L10_27, L11_28, L12_29, L13_30, L14_31, L15_32, L16_33, L17_34
  L1_18 = A0_17["policyBasedQos.cookie"]
  if L1_18 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  returnCode, L5_22, L2_19, L3_20, L4_21, L6_23, L7_24, L8_25, L9_26, L10_27, L11_28, L12_29, L13_30, L14_31, L15_32, L17_34 = _UPVALUE1_.policyGetNext(L1_18)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    return returnCode
  end
  L7_24 = _UPVALUE2_[tonumber(L7_24) + 1]
  for _FORV_21_, _FORV_22_ in pairs(_UPVALUE3_) do
    if L3_20 == _FORV_22_ then
      L3_20 = _FORV_21_
    end
  end
  return returnCode, L5_22, L2_19, L3_20, L4_21, L6_23, L7_24, L8_25, L9_26, L10_27, L11_28, L12_29, L13_30, L14_31, L15_32, L17_34
end
function advancedQosPolicySet(A0_35)
  local L1_36, L2_37, L3_38, L4_39, L5_40, L6_41, L7_42, L8_43, L9_44, L10_45, L11_46, L12_47, L13_48, L14_49
  L9_44 = ACCESS_LEVEL
  if L9_44 ~= 0 then
    L9_44 = util
    L9_44 = L9_44.appendDebugOut
    L10_45 = "Detected Unauthorized access for policyBasedQos page"
    L9_44(L10_45)
    L9_44 = _UPVALUE0_
    L9_44 = L9_44.UNAUTHORIZED
    return L9_44
  end
  L9_44 = nil
  L10_45 = A0_35["policyBasedQos.cookie"]
  L11_46 = A0_35["policyBasedQos.policyType"]
  L12_47 = A0_35["policyBasedQos.port"]
  L13_48 = A0_35["policyBasedQos.queue"]
  L14_49 = A0_35["policyBasedQos.vlanId"]
  if L11_46 == _UPVALUE1_ then
    L1_36 = A0_35["policyBasedQos.macAddress"]
  elseif L11_46 == _UPVALUE2_ then
    L2_37 = A0_35["policyBasedQos.macAddress"]
  elseif L11_46 == _UPVALUE3_ then
    L3_38 = A0_35["policyBasedQos.ipAddress"]
  elseif L11_46 == _UPVALUE4_ then
    L4_39 = A0_35["policyBasedQos.ipAddress"]
  elseif L11_46 == _UPVALUE5_ then
    L5_40 = A0_35["policyBasedQos.portAddress"]
  elseif L11_46 == _UPVALUE6_ then
    L6_41 = A0_35["policyBasedQos.portAddress"]
  elseif L11_46 == _UPVALUE7_ then
    L7_42 = A0_35["policyBasedQos.portAddress"]
  elseif L11_46 == _UPVALUE8_ then
    L8_43 = A0_35["policyBasedQos.portAddress"]
  end
  if L10_45 == nil then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L11_46 == nil or L12_47 == nil or L13_48 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L11_46 == _UPVALUE9_ and L14_49 == nil then
    util.appendDebugOut("GetNext : Invalid vlanId")
    return _UPVALUE0_.BAD_PARAMETER
  elseif L11_46 == _UPVALUE2_ and L2_37 == nil then
    util.appendDebugOut("GetNext : Invalid destinationMacAddress")
    return _UPVALUE0_.BAD_PARAMETER
  elseif L11_46 == _UPVALUE1_ and L1_36 == nil then
    util.appendDebugOut("GetNext : Invalid sourceMacAddress")
    return _UPVALUE0_.BAD_PARAMETER
  elseif L11_46 == _UPVALUE4_ and L4_39 == nil then
    util.appendDebugOut("GetNext : Invalid destinationIpAddress")
    return _UPVALUE0_.BAD_PARAMETER
  elseif L11_46 == _UPVALUE3_ and L3_38 == nil then
    util.appendDebugOut("GetNext : Invalid sourceIpAddress")
    return _UPVALUE0_.BAD_PARAMETER
  elseif L11_46 == _UPVALUE6_ and L6_41 == nil then
    util.appendDebugOut("GetNext : Invalid destinationTcpPort")
    return _UPVALUE0_.BAD_PARAMETER
  elseif L11_46 == _UPVALUE5_ and L5_40 == nil then
    util.appendDebugOut("GetNext : Invalid sourceTcpPort")
    return _UPVALUE0_.BAD_PARAMETER
  elseif L11_46 == _UPVALUE8_ and L8_43 == nil then
    util.appendDebugOut("GetNext : Invalid destinationUdpPort")
    return _UPVALUE0_.BAD_PARAMETER
  elseif L11_46 == _UPVALUE7_ and L7_42 == nil then
    util.appendDebugOut("GetNext : Invalid sourceUdpPort")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE10_.start()
  returnCode, cookie = _UPVALUE11_.policyDelete(L10_45)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in policyBasedQos page " .. returnCode)
    _UPVALUE10_.abort()
    return returnCode
  end
  returnCode, cookie = _UPVALUE11_.policyCreate(L10_45, L11_46, L12_47, L14_49, L13_48, L1_36, L2_37, L3_38, L4_39, L5_40, L6_41, L7_42, L8_43)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in policyBasedQos page" .. returnCode)
    _UPVALUE10_.abort()
    return returnCode
  end
  _UPVALUE10_.complete()
  _UPVALUE10_.save()
  return returnCode, cookie
end
function advancedQosPolicyCreate(A0_50)
  local L1_51, L2_52, L3_53, L4_54, L5_55, L6_56, L7_57, L8_58, L9_59, L10_60, L11_61, L12_62, L13_63, L14_64
  L10_60 = ACCESS_LEVEL
  if L10_60 ~= 0 then
    L10_60 = util
    L10_60 = L10_60.appendDebugOut
    L11_61 = "Detected Unauthorized access for policyBasedQos page"
    L10_60(L11_61)
    L10_60 = _UPVALUE0_
    L10_60 = L10_60.UNAUTHORIZED
    return L10_60
  end
  L10_60 = A0_50["policyBasedQos.policyName"]
  L11_61 = A0_50["policyBasedQos.policyType"]
  L12_62 = A0_50["policyBasedQos.port"]
  L13_63 = A0_50["policyBasedQos.vlanId"]
  L14_64 = A0_50["policyBasedQos.queue"]
  if L11_61 == _UPVALUE1_ then
    L1_51 = A0_50["policyBasedQos.macAddress"]
  elseif L11_61 == _UPVALUE2_ then
    L2_52 = A0_50["policyBasedQos.macAddress"]
  elseif L11_61 == _UPVALUE3_ then
    L3_53 = A0_50["policyBasedQos.ipAddress"]
  elseif L11_61 == _UPVALUE4_ then
    L4_54 = A0_50["policyBasedQos.ipAddress"]
  elseif L11_61 == _UPVALUE5_ then
    L5_55 = A0_50["policyBasedQos.portAddress"]
  elseif L11_61 == _UPVALUE6_ then
    L6_56 = A0_50["policyBasedQos.portAddress"]
  elseif L11_61 == _UPVALUE7_ then
    L7_57 = A0_50["policyBasedQos.portAddress"]
  elseif L11_61 == _UPVALUE8_ then
    L8_58 = A0_50["policyBasedQos.portAddress"]
  end
  if L10_60 == nil then
    util.appendDebugOut("Set : Invalid policyName")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L11_61 == nil or L12_62 == nil or L14_64 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L11_61 == _UPVALUE9_ and L13_63 == nil then
    util.appendDebugOut("GetNext : Invalid vlanId")
    return _UPVALUE0_.BAD_PARAMETER
  elseif L11_61 == _UPVALUE2_ and L2_52 == nil then
    util.appendDebugOut("GetNext : Invalid destinationMacAddress")
    return _UPVALUE0_.BAD_PARAMETER
  elseif L11_61 == _UPVALUE1_ and L1_51 == nil then
    util.appendDebugOut("GetNext : Invalid sourceMacAddress")
    return _UPVALUE0_.BAD_PARAMETER
  elseif L11_61 == _UPVALUE4_ and L4_54 == nil then
    util.appendDebugOut("GetNext : Invalid destinationIpAddress")
    return _UPVALUE0_.BAD_PARAMETER
  elseif L11_61 == _UPVALUE3_ and L3_53 == nil then
    util.appendDebugOut("GetNext : Invalid sourceIpAddress")
    return _UPVALUE0_.BAD_PARAMETER
  elseif L11_61 == _UPVALUE6_ and L6_56 == nil then
    util.appendDebugOut("GetNext : Invalid destinationTcpPort")
    return _UPVALUE0_.BAD_PARAMETER
  elseif L11_61 == _UPVALUE5_ and L5_55 == nil then
    util.appendDebugOut("GetNext : Invalid sourceTcpPort")
    return _UPVALUE0_.BAD_PARAMETER
  elseif L11_61 == _UPVALUE8_ and L8_58 == nil then
    util.appendDebugOut("GetNext : Invalid destinationUdpPort")
    return _UPVALUE0_.BAD_PARAMETER
  elseif L11_61 == _UPVALUE7_ and L7_57 == nil then
    util.appendDebugOut("GetNext : Invalid sourceUdpPort")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE10_.start()
  returnCode, cookie = _UPVALUE11_.policyCreate(L10_60, L11_61, L12_62, L13_63, L14_64, L1_51, L2_52, L3_53, L4_54, L5_55, L6_56, L7_57, L8_58)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in policyBasedQos page" .. returnCode)
    _UPVALUE10_.abort()
    return returnCode
  end
  _UPVALUE10_.complete()
  _UPVALUE10_.save()
  return returnCode, cookie
end
function advancedQosPolicyDelete(A0_65)
  local L1_66, L2_67
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for policyBasedQos PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_66 = A0_65["policyBasedQos.cookie"]
  if L1_66 == nil then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L2_67, cookie = _UPVALUE2_.policyDelete(L1_66)
  if L2_67 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in policyBasedQos page " .. L2_67)
    _UPVALUE1_.abort()
    return L2_67
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L2_67, cookie
end
function advancedQosPolicyListGet()
  local L0_68, L1_69, L2_70, L3_71, L4_72, L5_73, L6_74, L7_75, L8_76, L9_77, L10_78, L11_79, L12_80, L13_81, L14_82, L15_83, L16_84, L17_85
  L17_85 = {}
  L14_82, L0_68, L1_69, L2_70, L3_71, L4_72, L5_73, L6_74, L7_75, L8_76, L9_77, L10_78, L11_79, L12_80, L13_81, L15_83 = _UPVALUE0_.policyGet()
  if L14_82 == _UPVALUE1_.SUCCESS then
    L16_84 = 1
    L5_73 = _UPVALUE2_[tonumber(L5_73) + 1]
    for _FORV_21_, _FORV_22_ in pairs(_UPVALUE3_) do
      if L2_70 == _FORV_22_ then
        L2_70 = _FORV_21_
      end
    end
    L17_85[L16_84] = {}
    L17_85[L16_84].policyName = L1_69
    L17_85[L16_84].policyType = L2_70
    L17_85[L16_84].port = L3_71
    L17_85[L16_84].vlanId = L4_72
    L17_85[L16_84].queue = L5_73
    L17_85[L16_84].sourceMacAddress = L6_74
    L17_85[L16_84].destinationMacAddress = L7_75
    L17_85[L16_84].sourceIpAddress = L8_76
    L17_85[L16_84].destinationIpAddress = L9_77
    L17_85[L16_84].sourceTcpPort = L10_78
    L17_85[L16_84].destinationTcpPort = L11_79
    L17_85[L16_84].sourceUdpPort = L12_80
    L17_85[L16_84].destinationUdpPort = L13_81
    L17_85[L16_84].description = L15_83
    L17_85[L16_84].cookie = L0_68
    L16_84 = L16_84 + 1
    while L14_82 == _UPVALUE1_.SUCCESS do
      L14_82, L0_68, L1_69, L2_70, L3_71, L4_72, L5_73, L6_74, L7_75, L8_76, L9_77, L10_78, L11_79, L12_80, L13_81, L15_83 = _UPVALUE0_.policyGetNext(L0_68)
      if L14_82 == _UPVALUE1_.SUCCESS then
        L5_73 = _UPVALUE2_[tonumber(L5_73) + 1]
        for _FORV_21_, _FORV_22_ in pairs(_UPVALUE3_) do
          if L2_70 == _FORV_22_ then
            L2_70 = _FORV_21_
          end
        end
        L17_85[L16_84] = {}
        L17_85[L16_84].policyName = L1_69
        L17_85[L16_84].policyType = L2_70
        L17_85[L16_84].port = L3_71
        L17_85[L16_84].vlanId = L4_72
        L17_85[L16_84].queue = L5_73
        L17_85[L16_84].sourceMacAddress = L6_74
        L17_85[L16_84].destinationMacAddress = L7_75
        L17_85[L16_84].sourceIpAddress = L8_76
        L17_85[L16_84].destinationIpAddress = L9_77
        L17_85[L16_84].sourceTcpPort = L10_78
        L17_85[L16_84].destinationTcpPort = L11_79
        L17_85[L16_84].sourceUdpPort = L12_80
        L17_85[L16_84].destinationUdpPort = L13_81
        L17_85[L16_84].description = L15_83
        L17_85[L16_84].cookie = L0_68
        L16_84 = L16_84 + 1
      end
    end
    return _UPVALUE1_.SUCCESS, L17_85
  else
    return L14_82
  end
end
function advancedQosMultiplePolicyDelete(A0_86)
  local L1_87, L2_88, L3_89, L4_90, L5_91, L6_92, L7_93, L8_94
  L3_89 = 1
  if L4_90 ~= 0 then
    L4_90(L5_91)
    return L4_90
  end
  if A0_86 ~= nil then
  elseif L4_90 == 0 then
    L4_90(L5_91)
    return L4_90
  end
  L4_90()
  for L7_93, L8_94 in L4_90(L5_91) do
    L2_88, cookie = _UPVALUE2_.policyDelete(L8_94)
    if L2_88 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in Delete Opetation in policyBasedQos page " .. L2_88)
      _UPVALUE1_.abort()
      return L2_88
    end
  end
  L4_90()
  L4_90()
  return L4_90, L5_91
end
function lanQosAdvancedPolicyGetAll()
  local L0_95, L1_96
  L0_95, L1_96 = _UPVALUE0_.lanQosPolicyGetAll()
  if L0_95 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  for _FORV_5_, _FORV_6_ in pairs(L1_96) do
    _FORV_6_.priority = _UPVALUE2_[tonumber(_FORV_6_.priority) + 1]
  end
  return _UPVALUE1_.SUCCESS, L1_96
end
function lanQosAdvancedPolicyGetInfo(A0_97)
  local L1_98, L2_99
  curCookie = A0_97["policyBasedQos.cookie"]
  if curCookie == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_98, L2_99 = _UPVALUE1_.lanQosPolicyGetRow(curCookie)
  if L1_98 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  L2_99 = util.removePrefix(L2_99, "advQosPolicyTable.")
  return _UPVALUE0_.SUCCESS, L2_99
end
function lanQosAdvancedPolicyDeleteAll()
  local L0_100, L1_101
  L0_100, L1_101 = _UPVALUE0_.lanQosPolicyDeleteAll()
  if not L0_100 then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_101
end
