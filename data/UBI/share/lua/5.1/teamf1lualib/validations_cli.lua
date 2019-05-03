require("validationsLuaLib")
validations = {}
function validations.checkStringLength(A0_0, A1_1, A2_2, A3_3)
  A0_0 = tonumber(A0_0)
  A1_1 = tonumber(A1_1)
  if A2_2 == "" then
    return "ERROR", "ERR_EMPTY_VALUE_ENTERED", A3_3, ""
  end
  if A0_0 <= string.len(A2_2) and A1_1 >= string.len(A2_2) then
    return "OK", "", A3_3, ""
  else
    return "ERROR", "ERR_STRING_LENGTH", A3_3, ""
  end
end
function validations.ipRangeValidate(A0_4, A1_5, A2_6)
  flag, statusCode = validations.ipAddressValidate(A0_4, "", A2_6)
  if flag == "OK" or flag == 0 then
    flag, statusCode = validations.ipAddressValidate(A1_5, "", A2_6)
  end
  if flag == "OK" or flag == 0 then
    ipTable1 = validations.split(A0_4, ".")
    ipTable2 = validations.split(A1_5, ".")
    for _FORV_7_, _FORV_8_ in pairs(ipTable1) do
      if tonumber(ipTable1[_FORV_7_]) < tonumber(ipTable2[_FORV_7_]) then
        return 0, "", A2_6, ""
      end
      if tonumber(ipTable1[_FORV_7_]) > tonumber(ipTable2[_FORV_7_]) then
        return 1, "ERR_START_IP_GREATER", A2_6, ""
      end
    end
    if 0 + 1 == 4 then
      return 0, "", A2_6, ""
    end
  end
  return flag, statusCode, A2_6, ""
end
function validations.passwordMatch(A0_7, A1_8, A2_9)
  local L3_10, L4_11, L5_12
  if A0_7 == "" or A1_8 == "" then
    L3_10 = 1
    L4_11 = "ERR_PASSWORD_EMPTY"
    L5_12 = A2_9
    return L3_10, L4_11, L5_12
  end
  if A0_7 == A1_8 then
    L3_10 = 0
    L4_11 = ""
    return L3_10, L4_11
  else
    L3_10 = 1
    L4_11 = "ERR_PASSWORD_MISMATCH"
    L5_12 = A2_9
    return L3_10, L4_11, L5_12
  end
end
function validations.split(A0_13, A1_14)
  local L2_15, L3_16, L5_17
  if A1_14 == "" then
    L2_15 = false
    return L2_15
  end
  L2_15 = 0
  L3_16 = {}
  for _FORV_7_, _FORV_8_ in function()
    return string.find(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, true)
  end, nil, nil do
    table.insert(L3_16, string.sub(A0_13, L2_15, _FORV_7_ - 1))
    L2_15 = _FORV_8_ + 1
  end
  L5_17(L3_16, string.sub(A0_13, L2_15))
  return L3_16
end
function validations.split1(A0_18, A1_19)
  local L2_20, L3_21, L5_22
  if A1_19 == "" then
    L2_20 = false
    return L2_20
  end
  L2_20 = 0
  L3_21 = {}
  for _FORV_7_, _FORV_8_ in function()
    return string.find(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, true)
  end, nil, nil do
    table.insert(L3_21, string.sub(A0_18, L2_20, _FORV_7_ - 1))
    L2_20 = _FORV_8_ + 1
  end
  L5_22(L3_21, string.sub(A0_18, L2_20))
  return L3_21
end
function validations.rangeValidate(A0_23, A1_24, A2_25, A3_26, A4_27)
  local L5_28, L6_29, L7_30
  L5_28 = 0
  L6_29 = "OK"
  L7_30 = 0
  if A2_25 == nil or A2_25 == "" then
    return "ERROR", "ERR_EMPTY_VALUE_ENTERED", A4_27
  elseif validations.hasTypeValidate(A2_25, "%a%s") == 1 then
    return 1, "INVALID_VALUE_ERR_ALPHABET", A4_27, ""
  elseif validations.hasTypeValidate(A2_25, "%p") == 1 then
    return "ERROR", "INVALID_VALUE_ERR_SPCLCHAR", A4_27, ""
  end
  A2_25 = tonumber(A2_25)
  if A3_26 ~= "" then
    if validations.hasTypeValidate(A3_26, "%a%s") == 1 then
      return "ERROR", "INVALID_VALUE_ERR_ALPHABET", A4_27, ""
    elseif validations.hasTypeValidate(A3_26, "%p") == 1 then
      return "ERROR", "INVALID_VALUE_ERR_SPCLCHAR", A4_27, ""
    end
    A3_26 = tonumber(A3_26)
    if A1_24 < A2_25 or A0_23 > A2_25 then
      return 1, "ERR_BOUND_1", A4_27, ""
    elseif A1_24 < A3_26 or A0_23 > A3_26 then
      return 1, "ERR_BOUND_2", A4_27, ""
    elseif A2_25 > A3_26 then
      return 1, "ERR_START_GREATER_THAN_END", A4_27, ""
    else
      L5_28 = 0
    end
  elseif A1_24 < A2_25 or A0_23 > A2_25 then
    return "ERROR", "ERR_BOUND_INVALID_RANGE", A4_27, ""
  else
    L5_28 = "OK"
    L6_29 = "OK"
  end
  return L5_28, L6_29, A4_27, ""
end
function validations.hasTypeValidate(A0_31, A1_32, A2_33, A3_34)
  local L4_35, L5_36
  L4_35 = 0
  L5_36 = 0
  if A0_31 == nil then
    return 1, "ERR_EMPTY_VALUE_ENTERED"
  end
  if A2_33 ~= nil then
    for _FORV_9_, _FORV_10_ in string.gfind(A0_31, "[" .. A1_32 .. "]") do
      if _FORV_9_ ~= A2_33 then
        L5_36 = 1
      else
        L4_35 = L4_35 + 1
      end
    end
    if L4_35 ~= A3_34 and A3_34 ~= nil then
      L5_36 = 1
    end
  elseif string.find(A0_31, "[" .. A1_32 .. "]") then
    L5_36 = 1
  else
    L5_36 = 0
  end
  return L5_36
end
function validations.ipClassType(A0_37, A1_38)
  local L2_39, L3_40, L4_41
  if A0_37 == nil then
    L2_39 = 1
    L3_40 = "ERR_EMPTY_VALUE_ENTERED"
    L4_41 = A1_38
    return L2_39, L3_40, L4_41
  end
  L2_39 = ""
  if A0_37 >= 0 and A0_37 <= 127 then
    L2_39 = "A"
  elseif A0_37 >= 128 and A0_37 <= 191 then
    L2_39 = "B"
  elseif A0_37 >= 192 and A0_37 <= 223 then
    L2_39 = "C"
  elseif A0_37 >= 224 and A0_37 <= 239 then
    L2_39 = "D"
  elseif A0_37 >= 240 and A0_37 <= 255 then
    L2_39 = "E"
  else
    L2_39 = "X"
  end
  return L2_39
end
function validations.checkSubnetOctetValues(A0_42, A1_43)
  local L2_44, L3_45, L4_46, L5_47, L6_48
  L2_44 = 0
  for L6_48, _FORV_7_ in L3_45(L4_46) do
    if A0_42[L6_48] == "" then
      return 1, "INVALID_SUBNET_EMPTY_OCTET_" .. L6_48, A1_43
    end
    A0_42[L6_48] = tonumber(A0_42[L6_48])
    if A0_42[L6_48] == 0 or A0_42[L6_48] == 128 or A0_42[L6_48] == 192 or A0_42[L6_48] == 224 or A0_42[L6_48] == 240 or A0_42[L6_48] == 248 or A0_42[L6_48] == 252 or A0_42[L6_48] == 254 or A0_42[L6_48] == 255 then
      L2_44 = 0
    else
      L2_44 = 1
      return L2_44, "ERR_INVALIDSUBNET_OCTET_" .. L6_48, A1_43
    end
  end
  return L3_45, L4_46, L5_47
end
function validations.isEqual(A0_49, A1_50)
  local L2_51, L3_52
  L2_51 = 0
  if A0_49 == A1_50 then
    L3_52 = 1
    return L3_52
  else
    L3_52 = 0
    return L3_52
  end
end
function validations.subnetCheck(A0_53, A1_54, A2_55)
  for _FORV_6_, _FORV_7_ in pairs(A1_54) do
    A1_54[_FORV_6_] = tonumber(A1_54[_FORV_6_])
  end
  if A1_54[1] ~= 255 then
    return 1, "INVALID_SUBNET_ERR1_OCTET_1", A2_55
  else
    class = validations.ipClassType(A0_53, A2_55)
    if class == "A" then
      if validations.isEqual(A1_54[2], 255) ~= 1 then
        if validations.isEqual(A1_54[3], 0) ~= 1 then
          return 1, "INVALID_SUBNET_ERR4_OCTET_3", A2_55
        end
        if validations.isEqual(A1_54[4], 0) ~= 1 then
          return 1, "INVALID_SUBNET_ERR5_OCTET_4", A2_55
        end
      elseif validations.isEqual(A1_54[3], 255) ~= 1 and validations.isEqual(A1_54[4], 0) ~= 1 then
        return 1, "INVALID_SUBNET_ERR5_OCTET_4", A2_55
      end
    elseif class == "B" then
      if validations.isEqual(A1_54[2], 255) ~= 1 then
        return 1, "INVALID_SUBNET_ERR6_OCTET_2", A2_55
      end
      if validations.isEqual(A1_54[3], 255) ~= 1 and validations.isEqual(A1_54[4], 0) ~= 1 then
        return 1, "INVALID_SUBNET_ERR5_OCTET_4", A2_55
      end
    elseif class == "C" then
      if validations.isEqual(A1_54[2], 255) ~= 1 then
        return 1, "INVALID_SUBNET_ERR7_OCTET_2", A2_55
      end
      if validations.isEqual(A1_54[3], 255) ~= 1 then
        return 1, "INVALID_SUBNET_ERR8_OCTET_3", A2_55
      end
    else
      return 1, "INVALID_IPCLASS_ERR9", A2_55
    end
  end
  return 0, "", A2_55
end
function validations.ipAddressValidate(A0_56, A1_57, A2_58, A3_59)
  local L4_60, L5_61, L6_62, L7_63, L8_64, L9_65, L10_66
  L4_60 = 0
  L5_61 = ""
  L6_62 = 0
  if A0_56 == "" and A3_59 == "skip" or A0_56 == nil then
    L10_66 = ""
    return L7_63, L8_64, L9_65, L10_66
  end
  ipTable = L7_63
  if L7_63 ~= 4 then
    L10_66 = ""
    return L7_63, L8_64, L9_65, L10_66
  end
  if L7_63 == 1 then
    L10_66 = ""
    return L7_63, L8_64, L9_65, L10_66
  else
    L10_66 = "."
    if L7_63 == 1 then
      L10_66 = ""
      return L7_63, L8_64, L9_65, L10_66
    else
      for L10_66, _FORV_11_ in L7_63(L8_64) do
        if ipTable[L10_66] == "" then
          return 1, "INVALID_IP_EMPTY_OCTET_" .. L10_66, A2_58, ""
        elseif L10_66 == 1 then
          L4_60, L5_61 = validations.rangeValidate(1, 223, tonumber(ipTable[L10_66]), "")
          if L4_60 == "ERROR" then
            return L4_60, "INVALID_IP_OCTET_" .. L10_66, A2_58, ""
          end
        elseif L10_66 == 4 then
          L4_60, L5_61 = validations.rangeValidate(0, 254, tonumber(ipTable[L10_66]), "")
          if L4_60 == "ERROR" then
            return L4_60, "INVALID_IP_OCTET_" .. L10_66, A2_58, ""
          end
        else
          L4_60, L5_61 = validations.rangeValidate(0, 255, tonumber(ipTable[L10_66]), "")
          if L4_60 == "ERROR" then
            return L4_60, "INVALID_IP_OCTET_" .. L10_66, A2_58, ""
          end
        end
      end
    end
  end
  if A1_57 ~= "" then
    if L7_63 == 1 then
      L10_66 = ""
      return L7_63, L8_64, L9_65, L10_66
    else
      L10_66 = "."
      if L7_63 == 1 then
        L10_66 = ""
        return L7_63, L8_64, L9_65, L10_66
      else
        subnetTable = L7_63
        A2_58 = L9_65
        L5_61 = L8_64
        flag = L7_63
        if L7_63 == 1 then
          L10_66 = ""
          return L7_63, L8_64, L9_65, L10_66
        end
      end
    end
  end
  L10_66 = ""
  return L7_63, L8_64, L9_65, L10_66
end
function validations.macAddressValidate(A0_67, A1_68)
  local L2_69, L3_70, L4_71, L5_72, L6_73, L7_74
  L2_69 = 0
  L3_70 = ""
  macTable = L4_71
  if L4_71 ~= 6 then
    L7_74 = ""
    return L4_71, L5_72, L6_73, L7_74
  end
  L7_74 = ":"
  L2_69 = L4_71
  if L2_69 == 1 then
    L7_74 = ""
    return L4_71, L5_72, L6_73, L7_74
  elseif L2_69 == 0 then
    for L7_74, _FORV_8_ in L4_71(L5_72) do
      if macTable[L7_74] == nil or macTable[L7_74] == "" then
        return 1, "ERR_MAC_EMPTY_VALUE_OCTET_" .. L7_74, A1_68, ""
      elseif string.len(macTable[L7_74]) ~= 2 then
        return 1, "ERR_TWOCHAR_OCTET_" .. L7_74, A1_68, ""
      elseif validations.hasTypeValidate(macTable[L7_74], "g-z") == 1 then
        return 1, "ERR_ONLYHEX_OCTET_" .. L7_74, A1_68, ""
      else
        L2_69 = 0
      end
    end
  end
  L7_74 = ""
  return L4_71, L5_72, L6_73, L7_74
end
function validations.leaseTimeValidate(A0_75, A1_76)
  local L2_77
  L2_77 = 0
  if A0_75 == "" then
    return 1, "ERR_LEASETIME_EMPTY_VALUE", A1_76, ""
  end
  if validations.hasTypeValidate(A0_75, "%a%s") == 1 then
    return 1, "INVALID_LEASETIME_ERR_ALPHA", A1_76, ""
  elseif validations.hasTypeValidate(A0_75, "%p") == 1 then
    return 1, "INVALID_LEASETIME_ERR_SPCLCHAR", A1_76, ""
  else
    A0_75 = tonumber(A0_75)
    L2_77, errMsg = validations.rangeValidate(1, 262800, A0_75, "", A1_76)
    if L2_77 == 1 or L2_77 == "ERROR" then
      return 1, "ERR_LEASETIME_INVALIDRANGEVALUE", A1_76, ""
    end
  end
  return L2_77, errMsg, A1_76, ""
end
function validations.mtuValidate(A0_78, A1_79, A2_80)
  local L3_81, L4_82
  L3_81 = "OK"
  L4_82 = ""
  if A0_78 == "" then
    return "ERROR", "ERR_MTU_EMPTY_VALUE", A2_80, ""
  end
  if validations.hasTypeValidate(A0_78, "%a%s") == 1 then
    return "ERROR", "INVALID_MTUSIZE_ERR_ALPHA", A2_80, ""
  elseif validations.hasTypeValidate(A0_78, "%p") == 1 then
    return "ERROR", "INVALID_MTUSIZE_ERR_SPCLCHAR", A2_80, ""
  end
  if A1_79 == "noLogin" then
    L3_81, errMsg = validations.rangeValidate(1200, 1500, tonumber(A0_78), "", "")
  elseif A1_79 == "login" then
    L3_81, errMsg = validations.rangeValidate(1200, 1496, tonumber(A0_78), "", "")
  end
  if L3_81 == 1 or L3_81 == "ERROR" then
    return "ERROR", "ERR_MTUSIZE_INVALIDRANGEVALUE", A2_80, ""
  end
  return L3_81, errMsg, A2_80, ""
end
function validations.join(A0_83, A1_84)
  local L2_85, L3_86, L4_87, L5_88, L6_89, L7_90
  if not A0_83 then
    L2_85 = ""
    return L2_85
  end
  L2_85 = {}
  for L6_89, L7_90 in L3_86(L4_87) do
    if L6_89 >= 2 then
      L2_85 = L2_85 .. A1_84 .. L7_90
    else
      L2_85 = L7_90
    end
  end
  return L2_85
end
function validations.portRangeValidate(A0_91, A1_92, A2_93, A3_94, A4_95)
  local L5_96
  L5_96 = "OK"
  if A2_93 == "" then
    return "ERROR", "ERR_PORT_EMPTY_VALUE", A4_95, ""
  end
  if validations.hasTypeValidate(A2_93, "%a%s") == 1 then
    return 1, "INVALID_PORT1_ERR_ALPHA", A4_95, ""
  elseif validations.hasTypeValidate(A2_93, "%p") == 1 then
    return "ERROR", "INVALID_PORT1_ERR_SPCLCHAR", A4_95, ""
  end
  if A3_94 ~= "" then
    if validations.hasTypeValidate(A3_94, "%a%s") == 1 then
      return "ERROR", "INVALID_PORT2_ERR_ALPHA", A4_95, ""
    elseif validations.hasTypeValidate(A3_94, "%p") == 1 then
      return "ERROR", "INVALID_PORT2_ERR_SPCLCHAR", A4_95, ""
    end
  end
  if A3_94 ~= "" then
    L5_96, errMsg = validations.rangeValidate(A0_91, A1_92, tonumber(A2_93), tonumber(A3_94))
    if L5_96 == 1 or L5_96 == "ERROR" then
      if errMsg == "ERR_START_GREATER_THAN_END" then
        return "ERROR", "ERR_PORT1_GREATERTHAN_PORT2", A4_95, ""
      end
      return "ERROR", errMsg, A4_95, ""
    end
  else
    L5_96, errMsg = validations.rangeValidate(A0_91, A1_92, tonumber(A2_93), "")
    if L5_96 == 1 or L5_96 == "ERROR" then
      if errMsg == "ERR_RANGE" then
        return "ERROR", "ERR_PORT1_INVALID", A4_95, ""
      end
      return "ERROR", errMsg, A4_95, ""
    end
  end
  return L5_96, errMsg, A4_95, ""
end
function validations.numericValidate(A0_97, A1_98)
  if A0_97 == "" then
    return 1, "ERR_EMPTY_VALUE_ENTERED", A1_98
  elseif validations.hasTypeValidate(A0_97, "%a%s") == 1 then
    return 1, "INVALID_VALUE_ERR_ALPHA", A1_98
  elseif validations.hasTypeValidate(A0_97, "%p") == 1 then
    return 1, "INVALID_VALUE_ERR_SPCLCHAR", A1_98
  end
  return 0, ""
end
function validations.checkboxValidate(A0_99, A1_100, A2_101)
  local L3_102, L4_103, L5_104, L6_105
  if A0_99 == A1_100 then
    L3_102 = 0
    L4_103 = ""
    L5_104 = ""
    L6_105 = ""
    return L3_102, L4_103, L5_104, L6_105
  else
    L3_102 = 0
    L4_103 = ""
    L5_104 = ""
    L6_105 = A2_101
    return L3_102, L4_103, L5_104, L6_105
  end
end
function validations.checkboxValidate1(A0_106, A1_107, A2_108)
  local L3_109, L4_110, L5_111, L6_112
  if A0_106 ~= A1_107 then
    L3_109 = 0
    L4_110 = ""
    L5_111 = ""
    L6_112 = ""
    return L3_109, L4_110, L5_111, L6_112
  else
    L3_109 = 0
    L4_110 = ""
    L5_111 = ""
    L6_112 = A2_108
    return L3_109, L4_110, L5_111, L6_112
  end
end
function validations.idleTimeChk(A0_113)
  local L1_114
  L1_114 = 0
  if A0_113 == "" then
    return 1, "ERR_IDLETIME_EMPTY_VALUE"
  end
  if validations.hasTypeValidate(A0_113, "%a%s") == 1 then
    return 1, "INVALID_IDLETIME_ERR_ALPHA", field
  elseif validations.hasTypeValidate(A0_113, "%p") == 1 then
    return 1, "INVALID_IDLETIME_ERR_SPCLCHAR", field
  end
  L1_114, errMsg, field = validations.rangeValidate(5, 999, tonumber(A0_113), "", field)
  if L1_114 == 1 then
    return 1, "ERR_IDLETIME_INVALIDRANGEVALUE"
  else
    return L1_114, errMsg
  end
end
function validations.adInterval(A0_115)
  local L1_116
  L1_116 = "OK"
  if A0_115 == "" then
    return "ERROR", "ERR_ADV_INV_EMPTY_VALUE"
  end
  if validations.hasTypeValidate(A0_115, "%a%s") == 1 then
    return "ERROR", "INVALID_ADV_INV_ERR_ALPHA"
  elseif validations.hasTypeValidate(A0_115, "%p") == 1 then
    return "ERROR", "INVALID_ADVINTERVAL_ERR_SPCLCHAR", field
  end
  L1_116, errMsg, field = validations.rangeValidate(10, 1800, tonumber(A0_115), "", field)
  if L1_116 == 1 or L1_116 == "ERROR" then
    return 1, "ERR_ADV_INV_INVALIDRANGEVALUE"
  else
    return L1_116, errMsg
  end
end
function validations.mtuChk(A0_117)
  local L1_118
  L1_118 = 0
  if A0_117 == "" then
    return 1, "ERR_EMPTY_VALUE_ENTERED"
  end
  if validations.hasTypeValidate(A0_117, "%a%s") == 1 then
    return 1, "INVALID_RADVDMTU_ERR_ALPHA", field
  elseif validations.hasTypeValidate(A0_117, "%p") == 1 then
    return 1, "INVALID_RADVDMTU_ERR_SPCLCHAR", field
  end
  if A0_117 == "0" or A0_117 == 0 then
    L1_118 = 0
    errMsg = ""
  else
    L1_118, errMsg, field = validations.rangeValidate(1280, 1500, tonumber(A0_117), "", field)
  end
  if L1_118 == 1 or L1_118 == "ERROR" then
    return 1, "ERR_RADVDMTU_INVALIDRANGEVALUE"
  else
    return L1_118, errMsg
  end
end
function validations.routerLifeTime(A0_119)
  local L1_120
  L1_120 = 0
  if A0_119 == "" then
    return 1, "ERR_EMPTY_VALUE_ENTERED"
  end
  if validations.hasTypeValidate(A0_119, "%a%s") == 1 then
    return 1, "INVALID_ROUTERLIFETIME_ERR_ALPHA", field
  elseif validations.hasTypeValidate(A0_119, "%p") == 1 then
    return 1, "INVALID_ROUTERLIFETIME_ERR_SPCLCHAR", field
  end
  if A0_119 == "0" then
    L1_120 = 0
    errMsg = ""
  else
    L1_120, errMsg, field = validations.rangeValidate(50, 9000, tonumber(A0_119), "", field)
  end
  if L1_120 == 1 or L1_120 == "ERROR" then
    return 1, "ERR_ROUTERLIFETIME_INVALIDRANGEVALUE"
  else
    return L1_120, errMsg
  end
end
function validations.bandWidthRate(A0_121, A1_122)
  local L2_123
  L2_123 = 0
  if A0_121 == "" then
    return 1, "ERR_EMPTY_VALUE_ENTERED", A1_122
  end
  if validations.hasTypeValidate(A0_121, "%a%s") == 1 then
    return 1, "INVALID_BANDWIDTH_ERR_ALPHA", A1_122, ""
  elseif validations.hasTypeValidate(A0_121, "%p") == 1 then
    return 1, "INVALID_BANDWIDTH_ERR_SPCLCHAR", A1_122, ""
  end
  L2_123, errMsg, A1_122 = validations.rangeValidate(100, 1000000, tonumber(A0_121), "", A1_122)
  if L2_123 == 1 or L2_123 == "ERROR" then
    return 1, "ERR_BANDWIDTH_INVALIDRANGEVALUE", A1_122, ""
  else
    return L2_123, errMsg, A1_122, ""
  end
end
function validations.idleTimeOut(A0_124)
  local L1_125
  L1_125 = 0
  if A0_124 == "" then
    return 1, "ERR_EMPTY_VALUE_ENTERED"
  end
  if validations.hasTypeValidate(A0_124, "%a%s") == 1 then
    return 1, "INVALID_IDLETIMEOUT_ERR_ALPHA", field
  elseif validations.hasTypeValidate(A0_124, "%p") == 1 then
    return 1, "INVALID_IDLETIMEOUT_ERR_SPCLCHAR", field
  end
  L1_125, errMsg, field = validations.rangeValidate(1, 999, tonumber(A0_124), "", field)
  if L1_125 == 1 or L1_125 == "ERROR" then
    return 1, "ERR_IDLETIMEOUT_INVALIDRANGEVALUE"
  else
    return L1_125, errMsg
  end
end
function validations.preShrKeyChk(A0_126, A1_127)
  local L2_128
  L2_128 = 0
  if A0_126 == "" then
    return 1, "ERR_PRESHAREKEY_EMPTY_VALUE", A1_127, ""
  end
  preShareKeyLen = string.len(A0_126)
  L2_128, errMsg, A1_127 = validations.rangeValidate(8, 64, tonumber(preShareKeyLen), "", A1_127)
  if L2_128 == "ERROR" then
    return 1, "ERR_PRESHAREKEY_INVALID_KEY_LEN", A1_127, ""
  else
    return L2_128, "OK", A1_127, ""
  end
end
function validations.resTime(A0_129, A1_130)
  local L2_131
  L2_131 = 0
  if A0_129 == "" then
    return 1, "ERR_EMPTY_VALUE_ENTERED", A1_130, ""
  end
  if validations.hasTypeValidate(A0_129, "%a%s") == 1 then
    return 1, "INVALID_MAXQUERRYTIME_ERR_ALPHA", A1_130, ""
  elseif validations.hasTypeValidate(A0_129, "%p") == 1 then
    return 1, "INVALID_MAXQUERRYTIME_ERR_SPCLCHAR", A1_130, ""
  end
  L2_131, errMsg, A1_130 = validations.rangeValidate(5000, 99999999, tonumber(A0_129), "", A1_130)
  if L2_131 == "ERROR" or L2_131 == 1 then
    return 1, "ERR_MAXQUERRYTIME_INVALIDRANGEVALUE", A1_130, ""
  else
    return L2_131, errMsg, A1_130, ""
  end
end
function validations.robustness(A0_132, A1_133)
  local L2_134
  L2_134 = 0
  if A0_132 == "" then
    return 1, "ERR_EMPTY_VALUE_ENTERED", A1_133, ""
  end
  if validations.hasTypeValidate(A0_132, "%a%s") == 1 then
    return 1, "INVALID_ROBVARIABLE_ERR_ALPHA", A1_133, ""
  elseif validations.hasTypeValidate(A0_132, "%p") == 1 then
    return 1, "INVALID_ROBVARIABLE_ERR_SPCLCHAR", A1_133, ""
  end
  L2_134, errMsg, A1_133 = validations.rangeValidate(2, 99, tonumber(A0_132), "", A1_133)
  if L2_134 == "ERROR" or L2_134 == 1 then
    return 1, "ERR_ROBVARIABLE_INVALIDRANGEVALUE", A1_133, ""
  else
    return L2_134, errMsg, A1_133, ""
  end
end
function validations.qurInterval(A0_135, A1_136)
  local L2_137
  L2_137 = 0
  if A0_135 == "" then
    return 1, "ERR_EMPTY_VALUE_ENTERED", A1_136, ""
  end
  if validations.hasTypeValidate(A0_135, "%a%s") == 1 then
    return 1, "INVALID_QUERRYINV_ERR_ALPHA", A1_136, ""
  elseif validations.hasTypeValidate(A0_135, "%p") == 1 then
    return 1, "INVALID_QUERRYINV_ERR_SPCLCHAR", A1_136, ""
  end
  L2_137, errMsg, A1_136 = validations.rangeValidate(100, 99999, tonumber(A0_135), "", A1_136)
  if L2_137 == "ERROR" or L2_137 == 1 then
    return 1, "ERR_QUERRYINV_INVALIDRANGEVALUE", A1_136, ""
  else
    return L2_137, errMsg, A1_136, ""
  end
end
function validations.detPeriod(A0_138, A1_139)
  local L2_140
  L2_140 = 0
  if A0_138 == "" then
    return 1, "ERR_EMPTY_VALUE_ENTERED", A1_139, ""
  end
  if validations.hasTypeValidate(A0_138, "%a%s") == 1 then
    return 1, "INVALID_DETPERIOD_ERR_ALPHA", A1_139, ""
  elseif validations.hasTypeValidate(A0_138, "%p") == 1 then
    return 1, "INVALID_DETPERIOD_ERR_SPCLCHAR", A1_139, ""
  end
  L2_140, errMsg, A1_139 = validations.rangeValidate(10, 999, tonumber(A0_138), "", A1_139)
  if L2_140 == 1 or L2_140 == "ERROR" then
    return 1, "ERR_DETPERIOD_INVALIDRANGEVALUE", A1_139, ""
  else
    return L2_140, errMsg, A1_139, ""
  end
end
function validations.reConCount(A0_141, A1_142)
  local L2_143
  L2_143 = 0
  if A0_141 == "" then
    return 1, "ERR_EMPTY_VALUE_ENTERED", ""
  end
  if validations.hasTypeValidate(A0_141, "%a%s") == 1 then
    return 1, "INVALID_RECONNECT_ERR_ALPHA", A1_142, ""
  elseif validations.hasTypeValidate(A0_141, "%p") == 1 then
    return 1, "INVALID_RECONNECT_ERR_SPCLCHAR", A1_142, ""
  end
  L2_143, errMsg, A1_142 = validations.rangeValidate(3, 99, tonumber(A0_141), "", A1_142)
  if L2_143 == 1 or L2_143 == "ERROR" then
    return 1, "ERR_RECONNECT_INVALIDRANGEVALUE", A1_142, ""
  else
    return L2_143, errMsg, A1_142, ""
  end
end
function validations.ipv6AddrValidate(A0_144, A1_145, A2_146)
  local L3_147, L4_148, L5_149, L6_150
  L3_147 = 0
  L4_148 = 0
  L5_149 = 0
  L6_150 = ""
  if A0_144 == "" and A2_146 == "skip" then
    return "OK", "OK", A1_145, ""
  end
  if A0_144 == "" then
    return 1, "ERR_IPV6_EMPTY_VALUE", A1_145, ""
  end
  addrArr = validations.split(A0_144, ":")
  addrArrLen = #addrArr
  if #addrArr > 8 or addrArrLen == 1 or addrArrLen == 2 then
    return 1, "CHECK_NUMBER_OCTETS_IPV6", A1_145, ""
  end
  for _FORV_10_, _FORV_11_ in pairs(addrArr) do
    if _FORV_10_ < addrArrLen - 2 and addrArr[_FORV_10_] == "" and addrArr[_FORV_10_ + 1] == "" and addrArr[_FORV_10_ + 2] == "" then
      return 1, "CHECK_COLON_POSITION_IPV6", A1_145, ""
    end
    if validations.hasTypeValidate(addrArr[_FORV_10_], "g-z") == 1 or validations.hasTypeValidate(addrArr[_FORV_10_], "G-Z") == 1 then
      return 1, "INVALID_IPV6ADDR_CHAR", A1_145, ""
    end
    if string.len(addrArr[_FORV_10_]) > 4 then
      L3_147 = L3_147 + 1
    end
    if addrArr[_FORV_10_] == "" then
      L4_148 = L4_148 + 1
    end
  end
  if L4_148 > 2 then
    return 1, "INVALID_IPV6ADDR_CHECK_COLONS", A1_145, ""
  end
  if L3_147 > 1 then
    return 1, "CHECK_OCTET_IPV4_TYPE", A1_145, ""
  end
  if L3_147 == 1 then
    if string.len(addrArr[addrArrLen]) > 4 then
      L5_149, errMsg = validations.ipAddressValidate(addrArr[addrArrLen], "")
    else
      return 1, "INVALID_IPV4ADRR_NOT_AT_END", A1_145, ""
    end
  end
  if L5_149 == 1 then
    return L5_149, errMsg, A1_145, ""
  end
  if L4_148 == 1 and (addrArr[1] == "" or addrArr[addrArrLen] == "") then
    return 1, "INVALID_IPV6ADDR_CHECK_OCTECT_POSITION", A1_145, ""
  end
  if L3_147 == 1 and addrArrLen > 7 then
    return 1, "INVALID_IPV6ADDR_CHECK_NUMBER_OCTETS", A1_145, ""
  end
  if L4_148 ~= 2 or addrArr[1] == "" and addrArr[2] == "" or addrArr[addrArrLen - 1] == "" and addrArr[addrArrLen] == "" then
  else
    return 1, "INVALID_IPV6ADDR_CHECK_OCTET", A1_145, ""
  end
  return L5_149, "OK", A1_145, ""
end
function validations.ipv6AddressCheck(A0_151)
  if A0_151 == nil or A0_151 == "" or A0_151 == " " then
    return "Invalid Ipv6 Address"
  end
  if validationsLuaLib.ipAddressCheck("10", A0_151) ~= 0 then
    return validationsLuaLib.ipAddressCheck("10", A0_151)
  end
  if validationsLuaLib.ipv6AddressTypeCheck(A0_151) == "UNSPECIFIED" then
    return "Unspecified Address. Please enter a valid IPv6 address"
  elseif validationsLuaLib.ipv6AddressTypeCheck(A0_151) == "INVALID" then
    return "Invalid Address. Please enter a valid IPv6 address"
  elseif validationsLuaLib.ipv6AddressTypeCheck(A0_151) == "LOOPBACK" then
    return "Loop Back Address. Please enter a valid IPv6 address"
  elseif validationsLuaLib.ipv6AddressTypeCheck(A0_151) == "MULTICAST" or validationsLuaLib.ipv6AddressTypeCheck(A0_151) == "MULTICASTLINKLOCAL" or validationsLuaLib.ipv6AddressTypeCheck(A0_151) == "MULTICASTSITELOCAL" or validationsLuaLib.ipv6AddressTypeCheck(A0_151) == "MULTICASTORGANIZATIONLOCAL" or validationsLuaLib.ipv6AddressTypeCheck(A0_151) == "MULTICASTGLOBAL" then
    return "MULTICAST Address. Please enter a valid IPv6 address"
  end
  return "OK"
end
function validations.ipv6LoopBackCheck(A0_152)
  if A0_152 == nil or A0_152 == "" or A0_152 == " " then
    return "Invalid Ipv6 Address"
  end
  if validationsLuaLib.ipAddressCheck("10", A0_152) ~= 0 then
    return validationsLuaLib.ipAddressCheck("10", A0_152)
  end
  if validationsLuaLib.ip6AddressLoopCheck(A0_152) == 2 then
    return "Unspecified Address. Please enter a valid IPv6 address"
  elseif validationsLuaLib.ip6AddressLoopCheck(A0_152) == 1 then
    return "Loop Back Address. Please enter a valid IPv6 address"
  end
  return "OK"
end
function validations.ipv6Convert(A0_153)
  local L1_154, L2_155, L3_156, L4_157, L5_158, L6_159, L7_160
  if A0_153 == "" then
    L1_154 = 1
    L2_155 = "ERR_EMPTY_VALUE_ENTERED"
    return L1_154, L2_155
  end
  L1_154 = {}
  addrArr = L1_154
  L1_154 = validations
  L1_154 = L1_154.split
  L2_155 = A0_153
  L3_156 = ":"
  L1_154 = L1_154(L2_155, L3_156)
  addrArr = L1_154
  L1_154 = addrArr
  L1_154 = #L1_154
  addrArrLen = L1_154
  L1_154 = {}
  L2_155 = ""
  L3_156 = 8
  for L7_160 = 1, addrArrLen do
    if addrArr[L7_160] ~= "" then
      L1_154[L7_160] = addrArr[L7_160]
    end
    if addrArr[L7_160] == "" and L7_160 == 1 then
      s = addrArrLen
      while addrArr[s] ~= "" do
        if string.len(addrArr[s]) > 4 then
          L3_156 = 7
          L1_154[L3_156] = addrArr[s]
          L3_156 = L3_156 - 1
          s = s - 1
        else
          L1_154[L3_156] = addrArr[s]
          L3_156 = L3_156 - 1
          s = s - 1
        end
      end
      for _FORV_11_ = L3_156, 1, -1 do
        L1_154[_FORV_11_] = 0
      end
      L2_155 = _FOR_.join(L1_154, ":")
      return L2_155
    end
    if addrArr[L7_160] == "" and addrArr[L7_160 + 1] ~= "" then
      s = addrArrLen
      while addrArr[s] ~= "" do
        if string.len(addrArr[s]) > 4 then
          L3_156 = 7
          L1_154[L3_156] = addrArr[s]
          L3_156 = L3_156 - 1
          s = s - 1
        else
          L1_154[L3_156] = addrArr[s]
          L3_156 = L3_156 - 1
          s = s - 1
        end
      end
      for _FORV_11_ = L3_156, L7_160, -1 do
        L1_154[_FORV_11_] = 0
      end
      L2_155 = _FOR_.join(L1_154, ":")
      return L2_155
    end
    if addrArr[L7_160] == "" and addrArr[L7_160 + 1] == "" then
      for _FORV_11_ = L7_160, 8 do
        L1_154[_FORV_11_] = 0
      end
      L2_155 = _FOR_.join(L1_154, ":")
      return L2_155
    end
  end
  L2_155 = L4_157
  return L2_155
end
function validations.ipv6AddrCompare(A0_161, A1_162)
  local L2_163, L3_164, L4_165, L5_166, L6_167, L7_168, L8_169, L9_170, L10_171, L11_172, L12_173
  if A0_161 == A1_162 then
    L2_163 = 0
    return L2_163
  end
  L2_163 = 0
  L3_164 = {}
  L4_165 = validations
  L4_165 = L4_165.split
  L4_165 = L4_165(L5_166, L6_167)
  string1parts = L4_165
  L4_165 = validations
  L4_165 = L4_165.split
  L4_165 = L4_165(L5_166, L6_167)
  L3_164 = L4_165
  L4_165 = 1
  for L8_169 = 1, 8 do
    if L9_170 > 4 then
      if L9_170 <= 4 then
        ipv4parts = L9_170
        L12_173 = 10
        val1 = L9_170
        v6val1 = L9_170
        if L9_170 > L10_171 then
          return L9_170
        end
        if L9_170 < L10_171 then
          return L9_170
        end
        L12_173 = 10
        val2 = L9_170
        v6val2 = L9_170
        if L9_170 > L10_171 then
          return L9_170
        end
        if L9_170 < L10_171 then
          return L9_170
        end
      end
    elseif L9_170 > 4 then
      if L9_170 <= 4 then
        ipv4parts = L9_170
        L12_173 = 10
        val1 = L9_170
        v6val1 = L9_170
        if L9_170 > L10_171 then
          return L9_170
        end
        if L9_170 < L10_171 then
          return L9_170
        end
        L12_173 = 10
        val2 = L9_170
        v6val2 = L9_170
        if L9_170 > L10_171 then
          return L9_170
        end
        if L9_170 < L10_171 then
          return L9_170
        end
      end
    elseif L9_170 > 4 then
      if L9_170 > 4 then
        v4parts1 = L9_170
        v4parts2 = L9_170
        for L12_173 = 1, 4 do
          if tonumber(v4parts1[L12_173]) > tonumber(v4parts2[L12_173]) then
            return 1
          elseif tonumber(v4parts1[L12_173]) < tonumber(v4parts2[L12_173]) then
            return 2
          end
        end
      end
    elseif L9_170 > L10_171 then
      return L9_170
    elseif L9_170 < L10_171 then
      return L9_170
    else
      for L12_173 = 1, L10_171(L11_172) do
        string1Char = string.sub(string1parts[L8_169], L12_173, L12_173)
        string2Char = string.sub(L3_164[L8_169], L12_173, L12_173)
        if string1Char > string2Char then
          return 1
        elseif string1Char < string2Char then
          return 0
        end
      end
    end
  end
  return L5_166
end
function validations.v6AddrCom(A0_174, A1_175, A2_176)
  local L3_177
  L3_177 = 0
  errorFlag, statusCode = validations.ipv6AddrValidate(A0_174)
  if errorFlag == 0 or errorFlag == "OK" then
    errorFlag, statusCode = validations.ipv6AddrValidate(A1_175)
  end
  if errorFlag == 0 or errorFlag == "OK" then
    if A0_174 == "" or A1_175 == "" then
      return 1, "ERR_EMPTY_VALUE_ENTERED", A2_176, ""
    end
    check = validations.ipv6AddrCompare(A0_174, A1_175)
    if check == 1 then
      return 1, "FIRST_GREATER_THAN_SECOND_IP_V6", A2_176, ""
    elseif check == 3 then
      return 1, "BOTH_IP_EQUAL_V6", A2_176, ""
    end
    return 0, "OK", A2_176, ""
  end
  return errorFlag, statusCode, A2_176, ""
end
function validations.preLenChk(A0_178, A1_179)
  local L2_180
  L2_180 = 0
  if A0_178 == "" then
    return 1, "ERR_EMPTY_VALUE_ENTERED", A1_179, ""
  end
  if validations.hasTypeValidate(A0_178, "%a%s") == 1 then
    return 1, "INVALID_PREFIX_LENGTH_ERR_ALPHA", A1_179, ""
  elseif validations.hasTypeValidate(A0_178, "%p") == 1 then
    return 1, "INVALID_PREFIX_LENGTH_ERR_SPCLCHAR", A1_179, ""
  end
  L2_180, errMsg, A1_179 = validations.rangeValidate(0, 128, tonumber(A0_178), "", A1_179)
  if L2_180 == 1 or L2_180 == "ERROR" then
    return 1, "ERR_PREFIX_LENGTH_INVALIDRANGEVALUE", A1_179, ""
  else
    return L2_180, errMsg, A1_179, ""
  end
end
function validations.v6MetricChk(A0_181, A1_182)
  local L2_183
  L2_183 = 0
  if A0_181 == "" then
    return 1, "ERR_EMPTY_VALUE_ENTERED", A1_182, ""
  end
  if validations.hasTypeValidate(A0_181, "%a%s") == 1 then
    return 1, "INVALID_METRIC_ERR_ALPHA", A1_182, ""
  elseif validations.hasTypeValidate(A0_181, "%p") == 1 then
    return 1, "INVALID_METRIC_ERR_SPCLCHAR", A1_182, ""
  end
  L2_183, errMsg = validations.rangeValidate(2, 15, tonumber(A0_181), "", A1_182)
  if L2_183 == 1 or L2_183 == "ERROR" then
    return 1, "ERR_METRIC_INVALIDRANGEVALUE", A1_182, ""
  else
    return L2_183, errMsg, A1_182, ""
  end
end
function validations.v6RbnTimeChk(A0_184, A1_185)
  local L2_186
  L2_186 = 0
  if A0_184 == "" then
    return 1, "ERR_EMPTY_VALUE_ENTERED", A1_185, ""
  end
  if validations.hasTypeValidate(A0_184, "%a%s") == 1 then
    return 1, "INVALID_REBIND_TIME_ERR_ALPHA", A1_185, ""
  elseif validations.hasTypeValidate(A0_184, "%p") == 1 then
    return 1, "INVALID_REBIND_TIME_ERR_SPCLCHAR", A1_185, ""
  end
  L2_186, errMsg, A1_185 = validations.rangeValidate(0, 604800, tonumber(A0_184), "", A1_185)
  if L2_186 == 1 or L2_186 == "ERROR" then
    return 1, "ERR_BIND_TIME_INVALIDRANGEVALUE", A1_185, ""
  else
    return L2_186, errMsg, A1_185, ""
  end
end
function validations.logIpMask(A0_187)
  local L1_188
  L1_188 = 0
  if A0_187 == "" then
    return 1, "ERR_EMPTY_VALUE_ENTERED"
  end
  if validations.hasTypeValidate(A0_187, "%a%s") == 1 then
    return 1, "INVALID_LOGIN_MASK_ERR_ALPHA", field
  elseif validations.hasTypeValidate(A0_187, "%p") == 1 then
    return 1, "INVALID_LOGIN_MASK_ERR_SPCLCHAR", field
  end
  L1_188, errMsg, field = validations.rangeValidate(0, 32, tonumber(A0_187), "", field)
  if L1_188 == 1 or L1_188 == "ERROR" then
    return 1, "ERR_LOGIN_MASK_INVALIDRANGEVALUE"
  else
    return L1_188, errMsg
  end
end
function validations.wanFailTimeChk(A0_189)
  local L1_190
  L1_190 = 0
  if A0_189 == "" then
    return 1, "ERR_EMPTY_VALUE_ENTERED"
  end
  if validations.hasTypeValidate(A0_189, "%a%s") == 1 then
    return 1, "INVALID_FAILOVER_ERR_ALPHA", field
  elseif validations.hasTypeValidate(A0_189, "%p") == 1 then
    return 1, "INVALID_FAILOVER_ERR_SPCLCHAR", field
  end
  L1_190, errMsg, field = validations.rangeValidate(2, 999, tonumber(A0_189), "", field)
  if L1_190 == 1 or L1_190 == "ERROR" then
    return 1, "ERR_FAILOVER_INVALIDRANGEVALUE"
  else
    return L1_190, errMsg
  end
end
function validations.wanRetry(A0_191)
  local L1_192
  L1_192 = 0
  if A0_191 == "" then
    return 1, "ERR_EMPTY_VALUE_ENTERED"
  end
  if validations.hasTypeValidate(A0_191, "%a%s") == 1 then
    return 1, "INVALID_RETRY_INV_ERR_ALPHA", field
  elseif validations.hasTypeValidate(A0_191, "%p") == 1 then
    return 1, "INVALID_RETRY_INV_ERR_SPCLCHAR", field
  end
  L1_192, errMsg, field = validations.rangeValidate(30, 999, tonumber(A0_191), "", field)
  if L1_192 == 1 or L1_192 == "ERROR" then
    return 1, "ERR_RETRY_INV_INVALIDRANGEVALUE"
  else
    return L1_192, errMsg
  end
end
function validations.tcpCheck(A0_193)
  local L1_194
  L1_194 = 0
  if A0_193 == "" then
    return 1, "ERR_EMPTY_VALUE_ENTERED"
  end
  if validations.hasTypeValidate(A0_193, "%a%s") == 1 then
    return 1, "INVALID_TCP_RANGE_ERR_ALPHA", field
  elseif validations.hasTypeValidate(A0_193, "%p") == 1 then
    return 1, "INVALID_TCP_RANGE_ERR_SPCLCHAR", field
  end
  L1_194, errMsg, field = validations.rangeValidate(0, 65535, tonumber(A0_193), "", field)
  if L1_194 == 1 or falg == "ERROR" then
    return 1, "ERR_TCP_INVALIDRANGEVALUE"
  else
    return L1_194, errMsg
  end
end
function validations.timeCheck(A0_195, A1_196, A2_197)
  local L3_198
  L3_198 = 0
  if A0_195 == "" then
    return 1, "ERR_EMPTY_VALUE_ENTERED", A2_197, ""
  end
  if validations.hasTypeValidate(A0_195, "%a%s") == 1 then
    return 1, "INVALID_TIME_ERR_ALPHA", A2_197, ""
  elseif validations.hasTypeValidate(A0_195, "%p") == 1 then
    return 1, "INVALID_TIME_ERR_SPCLCHAR", A2_197, ""
  end
  if A1_196 == "hour" then
    L3_198, errMsg, A2_197 = validations.rangeValidate(1, 12, tonumber(A0_195), "", A2_197)
    if L3_198 == 1 or L3_198 == "ERROR" then
      return 1, "ERR_INVALID_HOUR_SETTING", A2_197, ""
    end
  elseif A1_196 == "hour24" then
    L3_198, errMsg, A2_197 = validations.rangeValidate(0, 23, tonumber(A0_195), "", A2_197)
    if L3_198 == 1 or L3_198 == "ERROR" then
      return 1, "ERR_INVALID_HOUR24_SETTING", A2_197, ""
    end
  elseif A1_196 == "minute" then
    L3_198, errMsg, A2_197 = validations.rangeValidate(0, 59, tonumber(A0_195), "", A2_197)
    if L3_198 == 1 or L3_198 == "ERROR" then
      return 1, "ERR_INVALID_MINUTE_SETTING", A2_197, ""
    end
  elseif A1_196 == "month" then
    L3_198, errMsg, A2_197 = validations.rangeValidate(1, 12, tonumber(A0_195), "", A2_197)
    if L3_198 == 1 or L3_198 == "ERROR" then
      return 1, "ERR_INVALID_MONTH_SETTING", A2_197, ""
    end
  elseif A1_196 == "date" then
    L3_198, errMsg, A2_197 = validations.rangeValidate(1, 31, tonumber(A0_195), "", A2_197)
    if L3_198 == 1 or L3_198 == "ERROR" then
      return 1, "ERR_INVALID_DATE_SETTING", A2_197, ""
    end
  elseif A1_196 == "second" then
    L3_198, errMsg, A2_197 = validations.rangeValidate(0, 59, tonumber(A0_195), "", A2_197)
    if L3_198 == 1 or L3_198 == "ERROR" then
      return 1, "ERR_INVALID_SECOND_SETTING", A2_197, ""
    end
  end
  return L3_198, errMsg, A2_197, ""
end
function validations.mdCheck(A0_199, A1_200)
  local L2_201
  L2_201 = 0
  if A0_199 == "" then
    return 1, "ERR_EMPTY_VALUE_ENTERED", A1_200, ""
  end
  if validations.hasTypeValidate(A0_199, "%a%s") == 1 then
    return 1, "INVALID_MD5_KEY_ERR_ALPHA", A1_200, ""
  elseif validations.hasTypeValidate(A0_199, "%p") == 1 then
    return 1, "INVALID_MD5_KEY_ERR_SPCLCHAR", A1_200, ""
  end
  L2_201, errMsg, A1_200 = validations.rangeValidate(1, 255, tonumber(A0_199), "", A1_200)
  if L2_201 == 1 or L2_201 == "ERROR" then
    return 1, "ERR_MD5KEY_INVALIDRANGEVALUE", A1_200, ""
  else
    return L2_201, errMsg, A1_200, ""
  end
end
function validations.vpnSaLifeTime(A0_202, A1_203, A2_204)
  if A1_203 == "" then
    return 1, "ERR_SALIFE_EMPTY_VALUE", A2_204, ""
  end
  if validations.hasTypeValidate(A1_203, "%a%s") == 1 then
    return 1, "INVALID_SA_TIME_ERR_ALPHA", A2_204, ""
  elseif validations.hasTypeValidate(A1_203, "%p") == 1 then
    return 1, "INVALID_SA_TIME_ERR_SPCLCHAR", A2_204, ""
  end
  if A0_202 > tonumber(A1_203) then
    return 1, "ERR_SA_LIFE_TIME", A2_204, ""
  else
    return 0, "", A2_204, ""
  end
end
function validations.vpnKeyVal(A0_205, A1_206, A2_207)
  if lifeTime == "" then
    return 1, "ERR__VPN_KEY_EMPTY_VALUE", A2_207, ""
  end
  if srting.len(A1_206) ~= A0_205 then
    return 1, "VPN_INCORRECT_KEY_LENGTH", A2_207, ""
  else
    return 0, "OK", A2_207, ""
  end
end
function validations.nameChk(A0_208)
  local L1_209, L2_210, L3_211, L4_212
  if A0_208 == "" then
    return L1_209, L2_210
  end
  nameLen = L1_209
  for L4_212 = 1, nameLen do
    nameChar = string.sub(A0_208, L4_212, 1)
    if nameChar == nil or nameChar == "\"" then
      return "ERROR", "INAVLID_CHARACTER_IN_NAME"
    end
  end
  return L1_209, L2_210
end
function validations.upnpAdvInv(A0_213, A1_214)
  local L2_215
  L2_215 = 0
  if A0_213 == "" then
    return 1, "ERR_EMPTY_VALUE_ENTERED", A1_214, ""
  end
  if validations.hasTypeValidate(A0_213, "%a%s") == 1 then
    return 1, "INVALID_UPNP_INV_ERR_ALPHA", A1_214, ""
  elseif validations.hasTypeValidate(A0_213, "%p") == 1 then
    return 1, "INVALID_UPNP_INV_ERR_SPCLCHAR", A1_214, ""
  end
  L2_215, errMsg, A1_214 = validations.rangeValidate(1, 86400, tonumber(A0_213), "", A1_214)
  if L2_215 == 1 or L2_215 == "ERROR" then
    return 1, "ERR_UPNP_ADV_INV_INVALIDRANGEVALUE", A1_214, ""
  else
    return L2_215, errMsg, A1_214, ""
  end
end
function validations.upnpAdvTime(A0_216, A1_217)
  local L2_218
  L2_218 = 0
  if A0_216 == "" then
    return 1, "ERR_EMPTY_VALUE_ENTERED", A1_217, ""
  end
  if validations.hasTypeValidate(A0_216, "%a%s") == 1 then
    return 1, "INVALID_AD_TIME_ERR_ALPHA", A1_217, ""
  elseif validations.hasTypeValidate(A0_216, "%p") == 1 then
    return 1, "INVALID_AD_TIME_ERR_SPCLCHAR", A1_217, ""
  end
  L2_218, errMsg, A1_217 = validations.rangeValidate(1, 255, tonumber(A0_216), "", A1_217)
  if L2_218 == 1 or L2_218 == "ERROR" then
    return 1, "ERR_UPNP_ADV_TIME_INVALIDRANGEVALUE", A1_217, ""
  else
    return L2_218, errMsg, A1_217, ""
  end
end
function validations.wlProfileAdv(A0_219)
  local L1_220
  L1_220 = 0
  if A0_219 == "" then
    return 1, "ERR_EMPTY_VALUE_ENTERED"
  end
  if validations.hasTypeValidate(A0_219, "%a%s") == 1 then
    return 1, "INVALID_PROFILE_ERR_ALPHA", field
  elseif validations.hasTypeValidate(A0_219, "%p") == 1 then
    return 1, "INVALID_PROFILE_ERR_SPCLCHAR", field
  end
  L1_220, errMsg, field = validations.rangeValidate(1, 36000, tonumber(A0_219), "", field)
  if L1_220 == 1 or L1_220 == "ERROR" then
    return 1, "ERR_INVALIDRANGEVALUE_WL"
  else
    return L1_220, errMsg
  end
end
function validations.wlRadius(A0_221, A1_222)
  local L2_223
  L2_223 = 0
  if A0_221 == "" then
    return 1, "ERR_EMPTY_VALUE_ENTERED", A1_222, ""
  end
  if validations.hasTypeValidate(A0_221, "%a%s") == 1 then
    return 1, "INVALID_RADIUS_ERR_ALPHA", A1_222, ""
  elseif validations.hasTypeValidate(A0_221, "%p") == 1 then
    return 1, "INVALID_RADIUS_ERR_SPCLCHAR", A1_222, ""
  end
  L2_223, errMsg, A1_222 = validations.rangeValidate(1, 999, tonumber(A0_221), "", A1_222)
  if L2_223 == 1 or L2_223 == "ERROR" then
    return 1, "ERR_INVALIDRANGEVALUE_RADIUS", A1_222, ""
  else
    return L2_223, errMsg, A1_222, ""
  end
end
function validations.isEmpty(A0_224, A1_225)
  local L2_226, L3_227, L4_228, L5_229
  if A0_224 == "" then
    L2_226 = "ERROR"
    L3_227 = "ERR_EMPTY_VALUE_ENTERED"
    L4_228 = A1_225
    L5_229 = ""
    return L2_226, L3_227, L4_228, L5_229
  else
    L2_226 = "OK"
    L3_227 = "OK"
    L4_228 = A1_225
    L5_229 = ""
    return L2_226, L3_227, L4_228, L5_229
  end
end
function validations.bridgeBandWidthRate(A0_230, A1_231)
  local L2_232
  L2_232 = 0
  if A0_230 == "" then
    return 1, "ERR_EMPTY_VALUE_ENTERED", A1_231
  end
  if validations.hasTypeValidate(A0_230, "%a%s") == 1 then
    return 1, "INVALID_BRIDGE_BANDWIDTH_ERR_ALPHA", A1_231, ""
  elseif validations.hasTypeValidate(A0_230, "%p") == 1 then
    return 1, "INVALID_BRIDGE_BANDWIDTH_ERR_SPCLCHAR", A1_231, ""
  end
  L2_232, errMsg, A1_231 = validations.rangeValidate(100, 1000000, tonumber(A0_230), "", A1_231)
  if L2_232 == 1 or L2_232 == "ERROR" then
    return 1, "ERR_BRIDGE_BANDWIDTH_INVALIDRANGEVALUE", A1_231, ""
  else
    return L2_232, errMsg, A1_231, ""
  end
end
function validations.is_ipv4_address(A0_233)
  local L1_234, L2_235, L3_236, L4_237, L5_238, L6_239, L7_240, L8_241, L9_242, L10_243, L11_244
  L1_234 = 4
  L2_235 = 0
  L3_236 = 255
  if A0_233 ~= nil then
    L4_237 = type
    L5_238 = A0_233
    L4_237 = L4_237(L5_238)
  elseif L4_237 ~= "string" then
    L4_237 = false
    return L4_237
  end
  L4_237 = "^(%d+)%.(%d+)%.(%d+)%.(%d+)$"
  L5_238 = {
    [7] = L6_239(L7_240, L8_241)
  }
  L11_244 = L6_239(L7_240, L8_241)
  ;({
    [7] = L6_239(L7_240, L8_241)
  })[1] = L6_239
  ;({
    [7] = L6_239(L7_240, L8_241)
  })[2] = L7_240
  ;({
    [7] = L6_239(L7_240, L8_241)
  })[3] = L8_241
  ;({
    [7] = L6_239(L7_240, L8_241)
  })[4] = L9_242
  ;({
    [7] = L6_239(L7_240, L8_241)
  })[5] = L10_243
  ;({
    [7] = L6_239(L7_240, L8_241)
  })[6] = L11_244
  if L5_238 == nil then
    return L6_239
  end
  if L6_239 ~= L1_234 then
    return L6_239
  end
  for L9_242, L10_243 in L6_239(L7_240) do
    L11_244 = tonumber
    L11_244 = L11_244(L10_243)
    print(L11_244)
    if L2_235 > L11_244 or L3_236 < L11_244 then
      return false
    end
  end
  return L6_239
end
function validations.is_fqdn_address(A0_245)
  local L1_246
  if A0_245 ~= nil then
    L1_246 = type
    L1_246 = L1_246(A0_245)
  elseif L1_246 ~= "string" then
    L1_246 = false
    return L1_246
  end
  L1_246 = "^[a-zA-Z0-9_%-%.]+[^.]$"
  if string.find(A0_245, L1_246) then
    return true
  end
  return false
end
