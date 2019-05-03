local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17
L0_0 = require
L1_1 = "teamf1lualib/util"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/db"
L0_0(L1_1)
L0_0 = "0.0.0.0"
function L1_1(A0_18)
  local L1_19
  L1_19 = A0_18 - 1
  L1_19 = 2 ^ L1_19
  return L1_19
end
bit = L1_1
function L1_1(A0_20, A1_21)
  local L2_22
  L2_22 = A1_21 + A1_21
  L2_22 = A0_20 % L2_22
  L2_22 = A1_21 <= L2_22
  return L2_22
end
hasbit = L1_1
function L1_1(A0_23, A1_24)
  return hasbit(A0_23, A1_24) and A0_23 or A0_23 + A1_24
end
setbit = L1_1
function L1_1(A0_25, A1_26)
  return hasbit(A0_25, A1_26) and A0_25 - A1_26 or A0_25
end
clearbit = L1_1
function L1_1(A0_27, A1_28)
  local L2_29, L3_30, L4_31, L5_32, L6_33, L7_34, L8_35, L9_36, L10_37, L11_38, L12_39, L13_40, L14_41, L15_42
  L2_29 = assert
  L3_30 = type
  L4_31 = A0_27
  L3_30 = L3_30(L4_31)
  L3_30 = L3_30 == "table"
  L2_29(L3_30)
  L2_29 = assert
  L3_30 = type
  L4_31 = A1_28
  L3_30 = L3_30(L4_31)
  L3_30 = L3_30 == "function"
  L2_29(L3_30)
  L2_29, L3_30, L4_31, L5_32 = nil, nil, nil, nil
  L6_33 = {}
  for L10_37, L11_38 in L7_34(L8_35) do
    L6_33[L10_37] = L12_39
    for L15_42, _FORV_16_ in L12_39(L13_40) do
      if A1_28(L15_42) then
        L6_33[L10_37][L15_42] = _FORV_16_
      end
    end
  end
  return L6_33
end
filterTable = L1_1
function L1_1(A0_43, A1_44)
  local L2_45, L3_46, L4_47, L5_48, L6_49, L7_50, L8_51, L9_52, L10_53
  if A0_43 == nil or A1_44 == nil then
    return A0_43
  end
  L2_45, L3_46, L4_47, L5_48 = nil, nil, nil, nil
  for L9_52, L10_53 in L6_49(L7_50) do
    for _FORV_14_, _FORV_15_ in pairs(L10_53) do
      if not A0_43[L9_52] then
        A0_43[L9_52] = {}
      end
      A0_43[L9_52][_FORV_14_] = _FORV_15_
    end
  end
  return A0_43
end
tableAppend = L1_1
function L1_1(A0_54, A1_55)
  local L2_56, L3_57, L4_58, L5_59, L6_60, L7_61, L8_62, L9_63, L10_64, L11_65
  if A0_54 == nil or A1_55 == nil then
    return A0_54
  end
  L2_56, L3_57, L4_58, L5_59 = nil, nil, nil, nil
  L6_60 = 0
  for L10_64, L11_65 in L7_61(L8_62) do
    L6_60 = L6_60 + 1
    for _FORV_15_, _FORV_16_ in pairs(L11_65) do
      if not A0_54[L10_64] then
        A0_54[L10_64] = {}
      end
      A0_54[L10_64][_FORV_15_] = _FORV_16_
    end
  end
  A0_54[L7_61] = L8_62
  L7_61.serverName = ""
  L7_61.serverPort = "514"
  L7_61.facilityId = "255"
  L7_61.severity = "0"
  L7_61.Enable = "0"
  L7_61.serverId = "8"
  L7_61._ROWID_ = "9"
  A0_54[L7_61] = L8_62
  L7_61.serverName = ""
  L7_61.serverPort = "514"
  L7_61.facilityId = "255"
  L7_61.severity = "0"
  L7_61.Enable = "0"
  L7_61.serverId = "9"
  L7_61._ROWID_ = "10"
  return A0_54
end
tableAppendSyslogInfo = L1_1
function L1_1(A0_66, A1_67)
  local L2_68, L3_69, L4_70, L5_71, L6_72, L7_73, L8_74, L9_75, L10_76, L11_77, L12_78
  if A0_66 == nil or A1_67 == nil then
    return A0_66
  end
  L2_68, L3_69, L4_70, L5_71 = nil, nil, nil, nil
  L6_72 = 0
  L7_73 = "0"
  for L11_77, L12_78 in L8_74(L9_75) do
    L6_72 = L6_72 + 1
    for _FORV_16_, _FORV_17_ in pairs(L12_78) do
      if not A0_66[L11_77] then
        A0_66[L11_77] = {}
      end
      A0_66[L11_77][_FORV_16_] = _FORV_17_
      if A0_66[L11_77].facility == "Local0-wireless" then
        A0_66[L11_77].facilityId = "16"
        if tonumber(A0_66[L11_77].emergency) == 9 then
          A0_66[L11_77].emergency = "1"
        elseif tonumber(A0_66[L11_77].emergency) == 12 then
          A0_66[L11_77].emergency = "4"
        elseif tonumber(A0_66[L11_77].emergency) == 13 then
          A0_66[L11_77].emergency = "5"
        elseif tonumber(A0_66[L11_77].emergency) == 8 then
          A0_66[L11_77].emergency = "0"
        end
        if tonumber(A0_66[L11_77].alert) == 9 then
          A0_66[L11_77].alert = "1"
        elseif tonumber(A0_66[L11_77].alert) == 12 then
          A0_66[L11_77].alert = "4"
        elseif tonumber(A0_66[L11_77].alert) == 13 then
          A0_66[L11_77].alert = "5"
        elseif tonumber(A0_66[L11_77].alert) == 8 then
          A0_66[L11_77].alert = "0"
        end
        if tonumber(A0_66[L11_77].critical) == 9 then
          A0_66[L11_77].critical = "1"
        elseif tonumber(A0_66[L11_77].critical) == 12 then
          A0_66[L11_77].critical = "4"
        elseif tonumber(A0_66[L11_77].critical) == 13 then
          A0_66[L11_77].critical = "5"
        elseif tonumber(A0_66[L11_77].critical) == 8 then
          A0_66[L11_77].critical = "0"
        end
        if tonumber(A0_66[L11_77].error) == 9 then
          A0_66[L11_77].error = "1"
        elseif tonumber(A0_66[L11_77].error) == 12 then
          A0_66[L11_77].error = "4"
        elseif tonumber(A0_66[L11_77].error) == 13 then
          A0_66[L11_77].error = "5"
        elseif tonumber(A0_66[L11_77].error) == 8 then
          A0_66[L11_77].error = "0"
        end
        if tonumber(A0_66[L11_77].warning) == 9 then
          A0_66[L11_77].warning = "1"
        elseif tonumber(A0_66[L11_77].warning) == 12 then
          A0_66[L11_77].warning = "4"
        elseif tonumber(A0_66[L11_77].warning) == 13 then
          A0_66[L11_77].warning = "5"
        elseif tonumber(A0_66[L11_77].warning) == 8 then
          A0_66[L11_77].warning = "0"
        end
        if tonumber(A0_66[L11_77].notice) == 9 then
          A0_66[L11_77].notice = "1"
        elseif tonumber(A0_66[L11_77].notice) == 12 then
          A0_66[L11_77].notice = "4"
        elseif tonumber(A0_66[L11_77].notice) == 13 then
          A0_66[L11_77].notice = "5"
        elseif tonumber(A0_66[L11_77].notice) == 8 then
          A0_66[L11_77].notice = "0"
        end
        if tonumber(A0_66[L11_77].information) == 9 then
          A0_66[L11_77].information = "1"
        elseif tonumber(A0_66[L11_77].information) == 12 then
          A0_66[L11_77].information = "4"
        elseif tonumber(A0_66[L11_77].information) == 13 then
          A0_66[L11_77].information = "5"
        elseif tonumber(A0_66[L11_77].information) == 8 then
          A0_66[L11_77].information = "0"
        end
        if tonumber(A0_66[L11_77].debug) == 9 then
          A0_66[L11_77].debug = "1"
        elseif tonumber(A0_66[L11_77].debug) == 12 then
          A0_66[L11_77].debug = "4"
        elseif tonumber(A0_66[L11_77].debug) == 13 then
          A0_66[L11_77].debug = "5"
        elseif tonumber(A0_66[L11_77].debug) == 8 then
          A0_66[L11_77].debug = "0"
        end
      end
      if A0_66[L11_77].facility == "Local2-Networking" or A0_66[L11_77].facility == "Local3-VPN" or A0_66[L11_77].facility == "Local4-WCF" or A0_66[L11_77].facility == "Local5-Firewall" then
        L7_73 = "1"
      end
    end
  end
  L11_77 = "Local4-WCF"
  L12_78 = "Local5-Firewall"
  L11_77 = "19"
  L12_78 = "20"
  if L7_73 == "0" then
    while L10_76 < 5 do
      L11_77 = L6_72 + L10_76
      L12_78 = {}
      A0_66[L11_77] = L12_78
      L11_77 = L6_72 + L10_76
      L11_77 = A0_66[L11_77]
      L12_78 = L8_74[L10_76]
      L11_77.facility = L12_78
      L11_77 = L6_72 + L10_76
      L11_77 = A0_66[L11_77]
      L12_78 = L9_75[L10_76]
      L11_77.facilityId = L12_78
      L11_77 = L6_72 + L10_76
      L11_77 = A0_66[L11_77]
      L11_77.emergency = "0"
      L11_77 = L6_72 + L10_76
      L11_77 = A0_66[L11_77]
      L11_77.alert = "0"
      L11_77 = L6_72 + L10_76
      L11_77 = A0_66[L11_77]
      L11_77.critical = "0"
      L11_77 = L6_72 + L10_76
      L11_77 = A0_66[L11_77]
      L11_77.error = "0"
      L11_77 = L6_72 + L10_76
      L11_77 = A0_66[L11_77]
      L11_77.warning = "0"
      L11_77 = L6_72 + L10_76
      L11_77 = A0_66[L11_77]
      L11_77.notice = "0"
      L11_77 = L6_72 + L10_76
      L11_77 = A0_66[L11_77]
      L11_77.information = "0"
      L11_77 = L6_72 + L10_76
      L11_77 = A0_66[L11_77]
      L11_77.debug = "0"
    end
  end
  return A0_66
end
tableLogAppend = L1_1
function L1_1(A0_79, A1_80)
  local L2_81, L3_82, L4_83, L5_84, L6_85, L7_86, L8_87, L9_88, L10_89, L11_90
  if A0_79 == nil or A1_80 == nil then
    return A0_79
  end
  L2_81, L3_82, L4_83, L5_84 = nil, nil, nil, nil
  L6_85 = 0
  for L10_89, L11_90 in L7_86(L8_87) do
    L6_85 = L6_85 + 1
    for _FORV_15_, _FORV_16_ in pairs(L11_90) do
      if not A0_79[L10_89] then
        A0_79[L10_89] = {}
      end
      A0_79[L10_89][_FORV_15_] = _FORV_16_
    end
  end
  A0_79[L7_86] = L8_87
  L7_86.ospfEnable = "0"
  L7_86.LogicalIfName = "L2TPoverIPSEC"
  L7_86.areaId = ""
  L7_86.priority = "1"
  L7_86.helloInterval = "10"
  L7_86.deadInterval = "40"
  L7_86.cost = "10"
  L7_86.authType = "None"
  L7_86.textAuthKey = ""
  L7_86.md5KeyId = ""
  L7_86.md5AuthKey = ""
  return A0_79
end
tableAppendOspf = L1_1
function L1_1(A0_91, A1_92)
  local L2_93, L3_94, L4_95, L5_96, L6_97, L7_98, L8_99, L9_100, L10_101, L11_102
  if A0_91 == nil or A1_92 == nil then
    return A0_91
  end
  L2_93, L3_94, L4_95, L5_96 = nil, nil, nil, nil
  L6_97 = 0
  for L10_101, L11_102 in L7_98(L8_99) do
    for _FORV_15_, _FORV_16_ in pairs(L11_102) do
      if not A0_91[L10_101] then
        A0_91[L10_101] = {}
      end
      A0_91[L10_101][_FORV_15_] = _FORV_16_
    end
    A0_91[L10_101].areaId = "0"
  end
  return A0_91
end
tableAppendOspf6 = L1_1
function L1_1(A0_103, A1_104)
  local L2_105, L3_106, L4_107, L5_108, L6_109, L7_110, L8_111, L9_112, L10_113
  if A0_103 == nil or A1_104 == nil then
    return A0_103
  end
  L2_105, L3_106, L4_107, L5_108 = nil, nil, nil, nil
  for L9_112, L10_113 in L6_109(L7_110) do
    for _FORV_14_, _FORV_15_ in pairs(L10_113) do
      if not A0_103[L9_112] then
        A0_103[L9_112] = {}
      end
      A0_103[L9_112][_FORV_14_] = _FORV_15_
    end
    A0_103[L9_112].PppoeSessions = "1"
  end
  return A0_103
end
tableAppendPppoe6 = L1_1
function L1_1(A0_114)
  local L1_115, L2_116, L3_117, L4_118, L5_119, L6_120, L7_121, L8_122, L9_123, L10_124, L11_125, L12_126, L13_127, L14_128, L15_129, L16_130, L17_131, L18_132, L19_133, L20_134, L21_135
  L1_115 = {}
  L2_116, L3_117, L4_118, L5_119, L6_120 = nil, nil, nil, nil, nil
  L2_116 = A0_114.Users
  L3_117 = A0_114.UserGroups
  for L10_124, L11_125 in L7_121(L8_122) do
    for L15_129, L16_130 in L12_126(L13_127) do
      if L17_131 == L18_132 then
        L4_118 = L16_130.Capabilities
        L5_119 = L17_131
        for L20_134, L21_135 in L17_131(L18_132) do
          if tonumber(L21_135) == 3 or tonumber(L21_135) == 4 then
            L6_120 = #L1_115
            L1_115[L6_120 + 1] = {}
            L1_115[L6_120 + 1].username = L11_125.UserName
            L1_115[L6_120 + 1].TrafficOverview = "1"
            L1_115[L6_120 + 1].DiscoveredAPs = "1"
            L1_115[L6_120 + 1].OptionPorts = "1"
            L1_115[L6_120 + 1].BandwidthUsage = "1"
            L1_115[L6_120 + 1].WLANStatistics = "1"
            L1_115[L6_120 + 1].VPNs = "1"
            L1_115[L6_120 + 1].CPUUtilization = "1"
            L1_115[L6_120 + 1].MemoryUtilization = "1"
            L1_115[L6_120 + 1].ActiveInfo = "1"
            break
          end
        end
      end
    end
  end
  return L1_115
end
tableCreateDashboardCustomization = L1_1
function L1_1(A0_136)
  local L1_137, L2_138, L3_139, L4_140
  L1_137 = {}
  L2_138 = 0
  L3_139 = 1
  L4_140 = 1
  for _FORV_8_, _FORV_9_ in pairs(A0_136) do
    L2_138 = L2_138 + 1
  end
  if L2_138 == 0 then
    return A0_136
  end
  if A0_136[1].DomainName == "SSLVPN" and A0_136[1].GroupId == "1" then
    L4_140 = 2
    L2_138 = L2_138 - 1
  end
  while L2_138 >= 0 do
    L1_137[L3_139] = {}
    L1_137[L3_139] = A0_136[L4_140]
    L3_139 = L3_139 + 1
    L4_140 = L4_140 + 1
    L2_138 = L2_138 - 1
  end
  return L1_137
end
removeDefaultDomain = L1_1
function L1_1(A0_141)
  local L1_142
  L1_142 = A0_141[1]
  L1_142.destPort = "16992"
  L1_142 = A0_141[2]
  L1_142.destPort = "16993"
  L1_142 = A0_141[3]
  L1_142.destPort = "16994"
  L1_142 = A0_141[4]
  L1_142.destPort = "16995"
  L1_142 = A0_141[5]
  L1_142.destPort = "9971"
  return A0_141
end
tableModifyIntelAmt = L1_1
function L1_1(A0_143)
  local L1_144, L2_145, L3_146
  L3_146 = {}
  table2 = L3_146
  L3_146 = 1
  for _FORV_7_, _FORV_8_ in pairs(A0_143) do
    table2[_FORV_7_] = {}
    table2[_FORV_7_].enable = A0_143[_FORV_7_].enable
    table2[_FORV_7_].configurationName = A0_143[_FORV_7_].configurationName
    table2[_FORV_7_].title = A0_143[_FORV_7_].title
    table2[_FORV_7_].BackGroundColor = A0_143[_FORV_7_].BackGroundColor
    table2[_FORV_7_].CustomColor = A0_143[_FORV_7_].CustomColor
    table2[_FORV_7_].headerImage = A0_143[_FORV_7_].headerImage
    table2[_FORV_7_].pageBackgroundImgConfigRow = "1"
    table2[_FORV_7_].pageBackgroundStyleSelector = "2"
    table2[_FORV_7_].headerBackground = A0_143[_FORV_7_].headerBackground
    table2[_FORV_7_].headerBackColor = A0_143[_FORV_7_].headerBackColor
    table2[_FORV_7_].headerCustomColor = A0_143[_FORV_7_].headerCustomColor
    table2[_FORV_7_].headerFont = A0_143[_FORV_7_].headerFont
    table2[_FORV_7_].headerFontSize = A0_143[_FORV_7_].headerFontSize
    table2[_FORV_7_].headerCaption = A0_143[_FORV_7_].headerCaption
    table2[_FORV_7_].headerFontColor = A0_143[_FORV_7_].headerFontColor
    table2[_FORV_7_].LoginBoxTitle = A0_143[_FORV_7_].LoginBoxTitle
    table2[_FORV_7_].welcomeMessage = A0_143[_FORV_7_].welcomeMessage
    table2[_FORV_7_].errorMessage = A0_143[_FORV_7_].errorMessage
    table2[_FORV_7_].messagesFontColor = A0_143[_FORV_7_].messagesFontColor
    table2[_FORV_7_].AdEnable = A0_143[_FORV_7_].AdEnable
    table2[_FORV_7_].AdContent = A0_143[_FORV_7_].AdContent
    table2[_FORV_7_].AdPlace = A0_143[_FORV_7_].AdPlace
    table2[_FORV_7_].AdFont = A0_143[_FORV_7_].AdFont
    table2[_FORV_7_].AdFontSize = A0_143[_FORV_7_].AdFontSize
    table2[_FORV_7_].AdFontColor = A0_143[_FORV_7_].AdFontColor
    table2[_FORV_7_].FooterEnable = A0_143[_FORV_7_].FooterEnable
    table2[_FORV_7_].FooterContent = A0_143[_FORV_7_].FooterContent
    table2[_FORV_7_].FooterFontColor = A0_143[_FORV_7_].FooterFontColor
    if A0_143[_FORV_7_].profileId ~= nil then
      table2[_FORV_7_].profileId = A0_143[_FORV_7_].profileId
    else
      table2[_FORV_7_].profileId = L3_146
      L3_146 = L3_146 + 1
    end
  end
  return table2
end
tableModifyCaptivePortalPageDetails = L1_1
function L1_1(A0_147, A1_148)
  local L2_149, L3_150, L4_151, L5_152, L6_153
  for L5_152, L6_153 in L2_149(L3_150) do
    if A1_148[L5_152] ~= nil then
      for _FORV_10_, _FORV_11_ in pairs(L6_153) do
        A0_147[L5_152][_FORV_10_] = A1_148[L5_152][_FORV_10_]
      end
    end
  end
  return A0_147
end
tableAppendThreeg = L1_1
function L1_1(A0_154, A1_155)
  local L2_156, L3_157, L4_158, L5_159, L6_160
  for L5_159, L6_160 in L2_156(L3_157) do
    if A1_155[L5_159] ~= nil then
      for _FORV_10_, _FORV_11_ in pairs(L6_160) do
        A0_154[L5_159][_FORV_10_] = A1_155[L5_159][_FORV_10_]
      end
    end
  end
  return A0_154
end
tableAppendDDNS = L1_1
function L1_1(A0_161, A1_162)
  local L2_163, L3_164, L4_165, L5_166, L6_167
  for L5_166, L6_167 in L2_163(L3_164) do
    if A1_162[L5_166] ~= nil then
      for _FORV_10_, _FORV_11_ in pairs(L6_167) do
        A0_161[L5_166][_FORV_10_] = A1_162[L5_166][_FORV_10_]
      end
    end
  end
  return A0_161
end
tableAppendDhcpv6c = L1_1
function L1_1(A0_168, A1_169)
  local L2_170, L3_171, L4_172, L5_173, L6_174
  for L5_173, L6_174 in L2_170(L3_171) do
    if A1_169[L5_173] ~= nil then
      for _FORV_10_, _FORV_11_ in pairs(L6_174) do
        A0_168[L5_173][_FORV_10_] = A1_169[L5_173][_FORV_10_]
      end
    end
  end
  return A0_168
end
tableAppendOpenvpnCertificates = L1_1
function L1_1(A0_175, A1_176)
  local L2_177, L3_178, L4_179, L5_180, L6_181
  for L5_180, L6_181 in L2_177(L3_178) do
    if A1_176[L5_180] ~= nil then
      for _FORV_10_, _FORV_11_ in pairs(L6_181) do
        A0_175[L5_180][_FORV_10_] = A1_176[L5_180][_FORV_10_]
      end
    end
  end
  return A0_175
end
tableAppendOpenvpn = L1_1
function L1_1(A0_182, A1_183)
  local L2_184, L3_185, L4_186, L5_187, L6_188, L7_189
  for L5_187, L6_188 in L2_184(L3_185) do
    if L7_189 ~= nil then
      for _FORV_10_, _FORV_11_ in L7_189(L6_188) do
        A0_182[L5_187][_FORV_10_] = A1_183[L5_187][_FORV_10_]
      end
      if L7_189 == "1" then
        if L7_189 >= 0 then
          A0_182[L5_187].UseCount = tostring(L7_189)
        end
        A0_182[L5_187].DefaultPortal = "0"
      end
    end
  end
  return A0_182
end
tableAppendSSLVPNPortalLayout = L1_1
function L1_1(A0_190, A1_191)
  local L2_192, L3_193, L4_194, L5_195, L6_196
  for L5_195, L6_196 in L2_192(L3_193) do
    if A1_191[L5_195] ~= nil then
      for _FORV_10_, _FORV_11_ in pairs(L6_196) do
        A0_190[L5_195][_FORV_10_] = A1_191[L5_195][_FORV_10_]
      end
    end
  end
  return A0_190
end
tableAppendaccessMgmt = L1_1
function L1_1(A0_197, A1_198)
  local L2_199, L3_200, L4_201, L5_202, L6_203
  for L5_202, L6_203 in L2_199(L3_200) do
    if A1_198[L5_202] ~= nil then
      for _FORV_10_, _FORV_11_ in pairs(L6_203) do
        if A1_198[L5_202][_FORV_10_] ~= nil then
          A0_197[L5_202][_FORV_10_] = A1_198[L5_202][_FORV_10_]
        end
      end
      if A1_198[L5_202].PingReplyOnLan == "0" then
        A0_197[L5_202].PingReplyOnLan = "1"
      end
      if A1_198[L5_202].BlockSpoof == "1" then
        A0_197[L5_202].BlockSpoof = "0"
      end
    end
  end
  return A0_197
end
tableAppendAttackChecks = L1_1
function L1_1(A0_204, A1_205)
  local L2_206, L3_207, L4_208, L5_209, L6_210
  if A1_205 == nil then
    return A0_204
  else
    for L5_209, L6_210 in L2_206(L3_207) do
      if A1_205[L5_209] ~= nil then
        for _FORV_10_, _FORV_11_ in pairs(L6_210) do
          if A1_205[L5_209][_FORV_10_] ~= nil then
            A0_204[L5_209][_FORV_10_] = A1_205[L5_209][_FORV_10_]
          end
        end
        if A1_205[L5_209].status == "1" then
          A0_204[L5_209].status = "0"
        end
      end
    end
    return A0_204
  end
end
tableAppendInterVlan = L1_1
function L1_1(A0_211, A1_212)
  for _FORV_5_, _FORV_6_ in pairs(A1_212) do
    if A1_212[_FORV_5_].Policy == "1" and A1_212[_FORV_5_].ProfileName == A0_211 then
      return true
    end
  end
  return false
end
check_inbound_direction = L1_1
function L1_1(A0_213, A1_214)
  local L2_215, L3_216, L4_217, L5_218, L6_219, L7_220, L8_221
  L2_215 = {}
  L3_216 = 1
  for L7_220, L8_221 in L4_217(L5_218) do
    if A0_213[L7_220].MatchType == "2" and check_inbound_direction(A0_213[L7_220].ProfileName, A1_214) then
    else
      L2_215[L3_216] = {}
      for _FORV_12_, _FORV_13_ in pairs(L8_221) do
        L2_215[L3_216][_FORV_12_] = _FORV_13_
      end
      L3_216 = L3_216 + 1
    end
  end
  return L2_215
end
tableRemoveTrafficSelector = L1_1
function L1_1(A0_222)
  for _FORV_4_, _FORV_5_ in pairs(A0_222) do
    if _FORV_5_.OtherSessionTimeoutDuration == "1" then
      _FORV_5_.OtherSessionTimeoutDuration = "5"
    end
  end
  return A0_222
end
tableAppendGlobalSettings = L1_1
function L1_1(A0_223, A1_224)
  local L2_225, L3_226, L4_227, L5_228, L6_229
  for L5_228, L6_229 in L2_225(L3_226) do
    if A1_224[L5_228] ~= nil then
      for _FORV_10_, _FORV_11_ in pairs(L6_229) do
        A0_223[L5_228][_FORV_10_] = A1_224[L5_228][_FORV_10_]
      end
      A0_223[L5_228].Policy = "0"
    end
  end
  return A0_223
end
tableAppendBandwidthProfile = L1_1
function L1_1(A0_230, A1_231)
  local L2_232, L3_233, L4_234, L5_235, L6_236
  for L5_235, L6_236 in L2_232(L3_233) do
    if A1_231[L5_235] ~= nil then
      for _FORV_10_, _FORV_11_ in pairs(L6_236) do
        A0_230[L5_235][_FORV_10_] = A1_231[L5_235][_FORV_10_]
      end
      A0_230[L5_235].SubnetMask = "255.255.255.255"
    end
  end
  return A0_230
end
tableAppendTrafficSelector = L1_1
function L1_1(A0_237, A1_238)
  local L2_239, L3_240, L4_241, L5_242, L6_243
  for L5_242, L6_243 in L2_239(L3_240) do
    if A1_238[L5_242] ~= nil then
      for _FORV_10_, _FORV_11_ in pairs(L6_243) do
        if A1_238[L5_242][_FORV_10_] ~= nil then
          A0_237[L5_242][_FORV_10_] = A1_238[L5_242][_FORV_10_]
        end
      end
      if A1_238[L5_242].Enable == "0" then
        A0_237[L5_242].Enable = "1"
        A0_237[L5_242].NATInterfaces = ""
        A0_237[L5_242].RoutedInterfaces = "WAN1,WAN2"
      end
    end
  end
  return A0_237
end
tableAppendNatTable = L1_1
function L1_1(A0_244, A1_245)
  local L2_246, L3_247, L4_248, L5_249, L6_250
  for L5_249, L6_250 in L2_246(L3_247) do
    if A1_245[L5_249] ~= nil then
      for _FORV_10_, _FORV_11_ in pairs(L6_250) do
        A0_244[L5_249][_FORV_10_] = A1_245[L5_249][_FORV_10_]
      end
      A0_244[L5_249].AssociatingEnabled = "0"
    end
  end
  return A0_244
end
tableAppendIpMacDhcp = L1_1
function L1_1(A0_251, A1_252)
  local L2_253, L3_254, L4_255, L5_256, L6_257
  for L5_256, L6_257 in L2_253(L3_254) do
    if A1_252[L5_256] ~= nil then
      for _FORV_10_, _FORV_11_ in pairs(L6_257) do
        A0_251[L5_256][_FORV_10_] = A1_252[L5_256][_FORV_10_]
      end
      A0_251[L5_256].EncryptionAlgorithm = clearbit(A0_251[L5_256].EncryptionAlgorithm, bit(7))
      A0_251[L5_256].EncryptionAlgorithm = clearbit(A0_251[L5_256].EncryptionAlgorithm, bit(8))
      if A0_251[L5_256].EncryptionAlgorithm == 0 then
        A0_251[L5_256].EncryptionAlgorithm = setbit(A0_251[L5_256].EncryptionAlgorithm, bit(4))
      end
    end
  end
  return A0_251
end
aesCcmGcmIpsecVPNPolicy = L1_1
function L1_1(A0_258)
  for _FORV_4_, _FORV_5_ in pairs(A0_258) do
    if tonumber(A0_258[_FORV_4_].SALifeTimeType) == 0 and tonumber(A0_258[_FORV_4_].SALifeTime) > 604800 then
      A0_258[_FORV_4_].SALifeTime = 604800
    end
  end
  return A0_258
end
tableModifyIpsecPhase2SALifeTime = L1_1
function L1_1(A0_259)
  for _FORV_4_, _FORV_5_ in pairs(A0_259) do
    if tonumber(A0_259[_FORV_4_].SALifeTime) > 604800 then
      A0_259[_FORV_4_].SALifeTime = 604800
    end
  end
  return A0_259
end
tableModifyIpsecPhase1SALifeTime = L1_1
function L1_1(A0_260)
  for _FORV_4_, _FORV_5_ in pairs(A0_260) do
    if tonumber(A0_260[_FORV_4_].NatKeepAliveTime) > 3600 then
      A0_260[_FORV_4_].NatKeepAliveTime = 3600
    elseif tonumber(A0_260[_FORV_4_].NatKeepAliveTime) < 5 then
      A0_260[_FORV_4_].NatKeepAliveTime = 5
    end
  end
  return A0_260
end
tableModifyNATKeepAliveFrequency = L1_1
function L1_1(A0_261, A1_262)
  local L2_263, L3_264, L4_265, L5_266, L6_267
  for L5_266, L6_267 in L2_263(L3_264) do
    if A1_262[L5_266] ~= nil then
      for _FORV_10_, _FORV_11_ in pairs(L6_267) do
        A0_261[L5_266][_FORV_10_] = A1_262[L5_266][_FORV_10_]
      end
      if A1_262[L5_266].EncryptionAlgorithm == "1" then
        A0_261[L5_266].EncryptionAlgorithm = 1
      end
      if A1_262[L5_266].EncryptionAlgorithm == "2" then
        A0_261[L5_266].EncryptionAlgorithm = 2
      end
      if A1_262[L5_266].EncryptionAlgorithm == "3" then
        A0_261[L5_266].EncryptionAlgorithm = 4
      end
      if A1_262[L5_266].EncryptionAlgorithm == "4" then
        A0_261[L5_266].EncryptionAlgorithm = 8
      end
      if A1_262[L5_266].EncryptionAlgorithm == "5" then
        A0_261[L5_266].EncryptionAlgorithm = 16
      end
      if A1_262[L5_266].EncryptionAlgorithm == "6" then
        A0_261[L5_266].EncryptionAlgorithm = 32
      end
      if A1_262[L5_266].EncryptionAlgorithm == "7" then
        A0_261[L5_266].EncryptionAlgorithm = 64
      end
      if A1_262[L5_266].AuthAlgorithm == "1" then
        A0_261[L5_266].AuthAlgorithm = 1
      end
      if A1_262[L5_266].AuthAlgorithm == "2" then
        A0_261[L5_266].AuthAlgorithm = 2
      end
      if A1_262[L5_266].AuthAlgorithm == "3" then
        A0_261[L5_266].AuthAlgorithm = 4
      end
      if A1_262[L5_266].AuthAlgorithm == "4" then
        A0_261[L5_266].AuthAlgorithm = 8
      end
      if A1_262[L5_266].AuthAlgorithm == "5" then
        A0_261[L5_266].AuthAlgorithm = 16
      end
    end
  end
  return A0_261
end
tableAppendIpsecIKEPolicy = L1_1
function L1_1(A0_268, A1_269)
  local L2_270, L3_271, L4_272, L5_273, L6_274
  for L5_273, L6_274 in L2_270(L3_271) do
    if A1_269[L5_273] ~= nil then
      for _FORV_10_, _FORV_11_ in pairs(L6_274) do
        A0_268[L5_273][_FORV_10_] = A1_269[L5_273][_FORV_10_]
      end
    end
  end
  if L2_270 ~= "DSR-250" then
  elseif L2_270 == "DSR-150N" then
    L2_270.ProfileName = "Default"
    L2_270.isEnable = "1"
    L2_270.ProfileName = "Default"
    L2_270.isEnable = "1"
    A0_268[3] = L2_270
    L2_270.ProfileName = "Default"
    L2_270.isEnable = "1"
    L2_270.authserver = "192.168.1.4"
    L2_270.authport = "1812"
    L2_270.authsecret = "sharedsecret"
    L2_270.authtimeout = "1"
    L2_270.authretries = "2"
  end
  return A0_268
end
addThirdRadiusClient = L1_1
function L1_1(A0_275, A1_276)
  local L2_277, L3_278, L4_279, L5_280, L6_281
  for L5_280, L6_281 in L2_277(L3_278) do
    if A1_276[L5_280] ~= nil then
      for _FORV_10_, _FORV_11_ in pairs(L6_281) do
        A0_275[L5_280][_FORV_10_] = A1_276[L5_280][_FORV_10_]
      end
      if A1_276[L5_280].EncryptionAlgorithm == "0" then
        A0_275[L5_280].EncryptionAlgorithm = 1
      end
      if A1_276[L5_280].EncryptionAlgorithm == "1" then
        A0_275[L5_280].EncryptionAlgorithm = 2
      end
      if A1_276[L5_280].EncryptionAlgorithm == "2" then
        A0_275[L5_280].EncryptionAlgorithm = 4
      end
      if A1_276[L5_280].EncryptionAlgorithm == "3" or A1_276[L5_280].EncryptionAlgorithm == 3 then
        A0_275[L5_280].EncryptionAlgorithm = 8
      end
      if A1_276[L5_280].EncryptionAlgorithm == "4" then
        A0_275[L5_280].EncryptionAlgorithm = 16
      end
      if A1_276[L5_280].EncryptionAlgorithm == "5" then
        A0_275[L5_280].EncryptionAlgorithm = 32
      end
      if A1_276[L5_280].EncryptionAlgorithm == "6" then
        A0_275[L5_280].EncryptionAlgorithm = 64
      end
      if A1_276[L5_280].EncryptionAlgorithm == "7" then
        A0_275[L5_280].EncryptionAlgorithm = 128
      end
      if A1_276[L5_280].EncryptionAlgorithm == "8" then
        A0_275[L5_280].EncryptionAlgorithm = 256
      end
      if A0_275[L5_280].EncryptionAlgorithm == "9" then
        A1_276[L5_280].EncryptionAlgorithm = 512
      end
      if A1_276[L5_280].EncryptionAlgorithm == "10" then
        A0_275[L5_280].EncryptionAlgorithm = 1024
      end
      if A1_276[L5_280].EncryptionAlgorithm == "11" then
        A0_275[L5_280].EncryptionAlgorithm = 2048
      end
      if A1_276[L5_280].EncryptionAlgorithm == "12" then
        A0_275[L5_280].EncryptionAlgorithm = 4096
      end
      if A1_276[L5_280].AuthAlgorithm == "0" then
        A0_275[L5_280].AuthAlgorithm = 1
      end
      if A1_276[L5_280].AuthAlgorithm == "1" then
        A0_275[L5_280].AuthAlgorithm = 2
      end
      if A1_276[L5_280].AuthAlgorithm == "2" or A1_276[L5_280].AuthAlgorithm == 2 then
        A0_275[L5_280].AuthAlgorithm = 4
      end
      if A1_276[L5_280].AuthAlgorithm == "3" then
        A0_275[L5_280].AuthAlgorithm = 8
      end
      if A1_276[L5_280].AuthAlgorithm == "4" then
        A0_275[L5_280].AuthAlgorithm = 16
      end
      if A1_276[L5_280].AuthAlgorithm == "5" then
        A0_275[L5_280].AuthAlgorithm = 32
      end
      if A1_276[L5_280].AuthAlgorithm == "6" then
        A0_275[L5_280].AuthAlgorithm = 64
      end
    end
  end
  return A0_275
end
tableAppendIpsecVPNPolicy = L1_1
function L1_1(A0_282, A1_283)
  local L2_284, L3_285, L4_286, L5_287, L6_288
  if A1_283 == nil then
    return A0_282
  end
  for L5_287, L6_288 in L2_284(L3_285) do
    for _FORV_10_, _FORV_11_ in pairs(L6_288) do
      if _FORV_10_ == "LogicalIfName" then
        if unit_name == "DSR-1000" or unit_name == "DSR-1000N" or unit_name == "DSR-1000AC" then
          A0_282[L5_287][_FORV_10_] = "WAN3"
        else
          A0_282[L5_287][_FORV_10_] = "WAN2"
        end
      else
        A0_282[L5_287][_FORV_10_] = A1_283[L5_287][_FORV_10_]
      end
    end
  end
  return A0_282
end
tableThreeg = L1_1
function L1_1(A0_289, A1_290)
  local L2_291, L3_292, L4_293, L5_294, L6_295
  if L2_291 ~= "DSR-1000" then
  elseif L2_291 == "DSR-1000N" then
    if L2_291 ~= nil then
      if L2_291 == "threeg" then
        L2_291.ConnectionType = "dhcpc"
      end
      for L5_294, L6_295 in L2_291(L3_292) do
        if A1_290[L5_294] ~= nil then
          for _FORV_10_, _FORV_11_ in pairs(L6_295) do
            A0_289[L5_294][_FORV_10_] = A1_290[L5_294][_FORV_10_]
          end
        end
      end
    end
  end
  return A0_289
end
tableAppendThreegNimfConf = L1_1
function L1_1(A0_296, A1_297)
  local L2_298, L3_299, L4_300, L5_301, L6_302
  for L5_301, L6_302 in L2_298(L3_299) do
    if A1_297[L5_301] ~= nil then
      for _FORV_10_, _FORV_11_ in pairs(L6_302) do
        A0_296[L5_301][_FORV_10_] = A1_297[L5_301][_FORV_10_]
      end
    end
  end
  return A0_296
end
tableAppendBwMonStat = L1_1
function L1_1(A0_303, A1_304)
  local L2_305, L3_306, L4_307, L5_308, L6_309, L7_310, L8_311, L9_312, L10_313, L11_314, L12_315, L13_316
  if A0_303 == nil or A1_304 == nil then
    return A0_303
  end
  L2_305, L3_306, L4_307, L5_308, L6_309 = nil, nil, nil, nil, nil
  L7_310 = 0
  for L11_314, L12_315 in L8_311(L9_312) do
    L7_310 = L7_310 + 1
  end
  for L12_315, L13_316 in L9_312(L10_313) do
    A0_303[L8_311] = {}
    for _FORV_17_, _FORV_18_ in pairs(L13_316) do
      A0_303[L8_311][_FORV_17_] = _FORV_18_
    end
  end
  return A0_303
end
tableAppendRoute = L1_1
function L1_1(A0_317, A1_318)
  local L2_319, L3_320, L4_321, L5_322, L6_323, L7_324, L8_325, L9_326, L10_327, L11_328, L12_329, L13_330
  L2_319 = 1
  A0_317 = L3_320
  for L6_323, L7_324 in L3_320(L4_321) do
    for L11_328, L12_329 in L8_325(L9_326) do
      if L11_328 == "enable" then
        L13_330 = A1_318[L6_323]
        L13_330 = L13_330[L11_328]
        if L13_330 == "1" then
          L13_330 = {}
          A0_317[L2_319] = L13_330
          L13_330 = A0_317[L2_319]
          L13_330.IninterfaceName = A1_318[L6_323].interfaceName
          L13_330 = A0_317[L2_319]
          L13_330.OutinterfaceName = "WAN"
          L13_330 = A0_317[L2_319]
          L13_330.vlanName = A1_318[L6_323].vlanName
          L13_330 = A0_317[L2_319]
          L13_330.vlanId = A1_318[L6_323].vlanId
          L13_330 = A0_317[L2_319]
          L13_330.enable = A1_318[L6_323].enable
          L13_330 = A1_318[L6_323]
          L13_330 = L13_330.vlanName
          if A1_318[L6_323].vlanId == "1" then
            A0_317[L2_319].PolicyName = "LAN_WAN"
          else
            A0_317[L2_319].PolicyName = "VLAN-" .. L13_330 .. "_WAN"
          end
          L2_319 = L2_319 + 1
        end
      end
    end
  end
  return A0_317
end
mergeCaptivePortalPolicy = L1_1
function L1_1(A0_331)
  local L1_332, L2_333
  table1 = {}
  for _FORV_6_, _FORV_7_ in pairs(A0_331) do
    table1[_FORV_6_] = {}
    table1[_FORV_6_].enable = A0_331[_FORV_6_].enable
    table1[_FORV_6_].authMode = "Local"
    table1[_FORV_6_].authType = "0"
    table1[_FORV_6_].redirectionType = "0"
  end
  return table1
end
mergeCaptivePortal = L1_1
function L1_1(A0_334, A1_335)
  local L2_336, L3_337, L4_338, L5_339, L6_340, L7_341, L8_342, L9_343, L10_344
  if A0_334 == nil or A1_335 == nil then
    return A0_334
  end
  L2_336, L3_337, L4_338, L5_339 = nil, nil, nil, nil
  for L9_343, L10_344 in L6_340(L7_341) do
    for _FORV_14_, _FORV_15_ in pairs(L10_344) do
      if _FORV_14_ == "MyIp" then
        if A1_335[L9_343][_FORV_14_] == _UPVALUE0_ then
          A0_334 = tableAppend(A0_334, A1_335)
        elseif A1_335[L9_343][_FORV_14_] == nil or A1_335[L9_343][_FORV_14_] == "" then
          A0_334[L9_343].DualAccess = 1
          A0_334[L9_343].GetIpFromIsp = 1
          A0_334[L9_343].StaticIp = "0.0.0.0"
          A0_334[L9_343].NetMask = "0.0.0.0"
        else
          A0_334[L9_343].DualAccess = 0
          A0_334[L9_343].GetIpFromIsp = 0
          A0_334[L9_343].StaticIp = A1_335[L9_343][_FORV_14_]
          A0_334[L9_343].NetMask = "255.255.255.0"
        end
      end
    end
  end
  return A0_334
end
tableDualAccess = L1_1
function L1_1(A0_345, A1_346)
  local L2_347, L3_348, L4_349, L5_350, L6_351, L7_352, L8_353, L9_354, L10_355, L11_356, L12_357
  L2_347 = 1
  L3_348 = 3
  L4_349 = #A1_346
  if L4_349 == 1 then
    L4_349 = A1_346[1]
    L4_349 = L4_349.LogicalIfName
    if L4_349 == "WAN1" then
      L4_349, L5_350, L6_351, L7_352 = nil, nil, nil, nil
      for L11_356, L12_357 in L8_353(L9_354) do
        for _FORV_16_, _FORV_17_ in pairs(L12_357) do
          if not A0_345[L11_356] then
            A0_345[L11_356] = {}
          end
          A0_345[L11_356][_FORV_16_] = _FORV_17_
        end
      end
    else
      L4_349 = A1_346[2]
      L4_349 = L4_349.LogicalIfName
      if L4_349 == "WAN2" then
        L4_349, L5_350, L6_351, L7_352 = nil, nil, nil, nil
        for L11_356, L12_357 in L8_353(L9_354) do
          for _FORV_16_, _FORV_17_ in pairs(L12_357) do
            if not A0_345[3] then
              A0_345[3] = {}
            end
            A0_345[3][_FORV_16_] = _FORV_17_
          end
        end
      end
    end
  else
    L4_349 = #A1_346
    if L4_349 == 2 then
      L4_349 = A1_346[1]
      L4_349 = L4_349.LogicalIfName
      if L4_349 == "WAN1" then
        L4_349, L5_350, L6_351, L7_352 = nil, nil, nil, nil
        for L11_356, L12_357 in L8_353(L9_354) do
          if L11_356 == 1 then
            for _FORV_16_, _FORV_17_ in pairs(L12_357) do
              if not A0_345[L2_347] then
                A0_345[L2_347] = {}
              end
              A0_345[L2_347][_FORV_16_] = _FORV_17_
            end
          end
        end
        L2_347 = L2_347 + 1
      else
        L4_349 = A1_346[1]
        L4_349 = L4_349.LogicalIfName
        if L4_349 == "WAN2" then
          L4_349, L5_350, L6_351, L7_352 = nil, nil, nil, nil
          for L11_356, L12_357 in L8_353(L9_354) do
            if L11_356 == 1 then
              for _FORV_16_, _FORV_17_ in pairs(L12_357) do
                if not A0_345[3] then
                  A0_345[L3_348] = {}
                end
                A0_345[L3_348][_FORV_16_] = _FORV_17_
              end
            end
          end
          L3_348 = L3_348 + 1
        end
      end
      L4_349 = A1_346[2]
      L4_349 = L4_349.LogicalIfName
      if L4_349 == "WAN1" then
        L4_349, L5_350, L6_351, L7_352 = nil, nil, nil, nil
        for L11_356, L12_357 in L8_353(L9_354) do
          if L11_356 == 2 then
            for _FORV_16_, _FORV_17_ in pairs(L12_357) do
              if not A0_345[L2_347] then
                A0_345[L2_347] = {}
              end
              A0_345[L2_347][_FORV_16_] = _FORV_17_
            end
          end
        end
      else
        L4_349 = A1_346[2]
        L4_349 = L4_349.LogicalIfName
        if L4_349 == "WAN2" then
          L4_349, L5_350, L6_351, L7_352 = nil, nil, nil, nil
          for L11_356, L12_357 in L8_353(L9_354) do
            if L11_356 == 2 then
              for _FORV_16_, _FORV_17_ in pairs(L12_357) do
                if not A0_345[L3_348] then
                  A0_345[L3_348] = {}
                end
                A0_345[L3_348][_FORV_16_] = _FORV_17_
              end
            end
          end
        end
      end
    else
      L4_349 = #A1_346
      if L4_349 == 3 then
        L4_349 = A1_346[1]
        L4_349 = L4_349.LogicalIfName
        if L4_349 == "WAN1" then
          L4_349, L5_350, L6_351, L7_352 = nil, nil, nil, nil
          for L11_356, L12_357 in L8_353(L9_354) do
            if L11_356 == 1 then
              for _FORV_16_, _FORV_17_ in pairs(L12_357) do
                if not A0_345[L2_347] then
                  A0_345[L2_347] = {}
                end
                A0_345[L2_347][_FORV_16_] = _FORV_17_
              end
            end
          end
          L2_347 = L2_347 + 1
        else
          L4_349 = A1_346[1]
          L4_349 = L4_349.LogicalIfName
          if L4_349 == "WAN2" then
            L4_349, L5_350, L6_351, L7_352 = nil, nil, nil, nil
            for L11_356, L12_357 in L8_353(L9_354) do
              if L11_356 == 1 then
                for _FORV_16_, _FORV_17_ in pairs(L12_357) do
                  if not A0_345[3] then
                    A0_345[L3_348] = {}
                  end
                  A0_345[L3_348][_FORV_16_] = _FORV_17_
                end
              end
            end
            L3_348 = L3_348 + 1
          end
        end
        L4_349 = A1_346[2]
        L4_349 = L4_349.LogicalIfName
        if L4_349 == "WAN1" then
          L4_349, L5_350, L6_351, L7_352 = nil, nil, nil, nil
          for L11_356, L12_357 in L8_353(L9_354) do
            if L11_356 == 2 then
              for _FORV_16_, _FORV_17_ in pairs(L12_357) do
                if not A0_345[L2_347] then
                  A0_345[L2_347] = {}
                end
                A0_345[L2_347][_FORV_16_] = _FORV_17_
              end
            end
          end
          L2_347 = L2_347 + 1
        else
          L4_349 = A1_346[2]
          L4_349 = L4_349.LogicalIfName
          if L4_349 == "WAN2" then
            L4_349, L5_350, L6_351, L7_352 = nil, nil, nil, nil
            for L11_356, L12_357 in L8_353(L9_354) do
              if L11_356 == 2 then
                for _FORV_16_, _FORV_17_ in pairs(L12_357) do
                  if not A0_345[L3_348] then
                    A0_345[L3_348] = {}
                  end
                  A0_345[L3_348][_FORV_16_] = _FORV_17_
                end
              end
            end
            L3_348 = L3_348 + 1
          end
        end
        L4_349 = A1_346[3]
        L4_349 = L4_349.LogicalIfName
        if L4_349 == "WAN1" then
          L4_349, L5_350, L6_351, L7_352 = nil, nil, nil, nil
          for L11_356, L12_357 in L8_353(L9_354) do
            if L11_356 == 3 then
              for _FORV_16_, _FORV_17_ in pairs(L12_357) do
                if not A0_345[L2_347] then
                  A0_345[L2_347] = {}
                end
                A0_345[L2_347][_FORV_16_] = _FORV_17_
              end
            end
          end
        else
          L4_349 = A1_346[3]
          L4_349 = L4_349.LogicalIfName
          if L4_349 == "WAN2" then
            L4_349, L5_350, L6_351, L7_352 = nil, nil, nil, nil
            for L11_356, L12_357 in L8_353(L9_354) do
              if L11_356 == 3 then
                for _FORV_16_, _FORV_17_ in pairs(L12_357) do
                  if not A0_345[L3_348] then
                    A0_345[L3_348] = {}
                  end
                  A0_345[L3_348][_FORV_16_] = _FORV_17_
                end
              end
            end
          end
        end
      else
        L4_349 = #A1_346
        if L4_349 == 4 then
          L4_349 = A1_346[1]
          L4_349 = L4_349.LogicalIfName
          if L4_349 == "WAN1" then
            L4_349, L5_350, L6_351, L7_352 = nil, nil, nil, nil
            for L11_356, L12_357 in L8_353(L9_354) do
              if L11_356 == 1 then
                for _FORV_16_, _FORV_17_ in pairs(L12_357) do
                  if not A0_345[L2_347] then
                    A0_345[L2_347] = {}
                  end
                  A0_345[L2_347][_FORV_16_] = _FORV_17_
                end
              end
            end
            L2_347 = L2_347 + 1
          else
            L4_349 = A1_346[1]
            L4_349 = L4_349.LogicalIfName
            if L4_349 == "WAN2" then
              L4_349, L5_350, L6_351, L7_352 = nil, nil, nil, nil
              for L11_356, L12_357 in L8_353(L9_354) do
                if L11_356 == 1 then
                  for _FORV_16_, _FORV_17_ in pairs(L12_357) do
                    if not A0_345[3] then
                      A0_345[L3_348] = {}
                    end
                    A0_345[L3_348][_FORV_16_] = _FORV_17_
                  end
                end
              end
              L3_348 = L3_348 + 1
            end
          end
          L4_349 = A1_346[2]
          L4_349 = L4_349.LogicalIfName
          if L4_349 == "WAN1" then
            L4_349, L5_350, L6_351, L7_352 = nil, nil, nil, nil
            for L11_356, L12_357 in L8_353(L9_354) do
              if L11_356 == 2 then
                for _FORV_16_, _FORV_17_ in pairs(L12_357) do
                  if not A0_345[L2_347] then
                    A0_345[L2_347] = {}
                  end
                  A0_345[L2_347][_FORV_16_] = _FORV_17_
                end
              end
            end
            L2_347 = L2_347 + 1
          else
            L4_349 = A1_346[2]
            L4_349 = L4_349.LogicalIfName
            if L4_349 == "WAN2" then
              L4_349, L5_350, L6_351, L7_352 = nil, nil, nil, nil
              for L11_356, L12_357 in L8_353(L9_354) do
                if L11_356 == 2 then
                  for _FORV_16_, _FORV_17_ in pairs(L12_357) do
                    if not A0_345[L3_348] then
                      A0_345[L3_348] = {}
                    end
                    A0_345[L3_348][_FORV_16_] = _FORV_17_
                  end
                end
              end
              L3_348 = L3_348 + 1
            end
          end
          L4_349 = A1_346[3]
          L4_349 = L4_349.LogicalIfName
          if L4_349 == "WAN1" then
            L4_349, L5_350, L6_351, L7_352 = nil, nil, nil, nil
            for L11_356, L12_357 in L8_353(L9_354) do
              if L11_356 == 3 then
                for _FORV_16_, _FORV_17_ in pairs(L12_357) do
                  if not A0_345[L2_347] then
                    A0_345[L2_347] = {}
                  end
                  A0_345[L2_347][_FORV_16_] = _FORV_17_
                end
              end
            end
            L2_347 = L2_347 + 1
          else
            L4_349 = A1_346[3]
            L4_349 = L4_349.LogicalIfName
            if L4_349 == "WAN2" then
              L4_349, L5_350, L6_351, L7_352 = nil, nil, nil, nil
              for L11_356, L12_357 in L8_353(L9_354) do
                if L11_356 == 3 then
                  for _FORV_16_, _FORV_17_ in pairs(L12_357) do
                    if not A0_345[L3_348] then
                      A0_345[L3_348] = {}
                    end
                    A0_345[L3_348][_FORV_16_] = _FORV_17_
                  end
                end
              end
              L3_348 = L3_348 + 1
            end
          end
          L4_349 = A1_346[4]
          L4_349 = L4_349.LogicalIfName
          if L4_349 == "WAN1" then
            L4_349, L5_350, L6_351, L7_352 = nil, nil, nil, nil
            for L11_356, L12_357 in L8_353(L9_354) do
              if L11_356 == 4 then
                for _FORV_16_, _FORV_17_ in pairs(L12_357) do
                  if not A0_345[L2_347] then
                    A0_345[L2_347] = {}
                  end
                  A0_345[L2_347][_FORV_16_] = _FORV_17_
                end
              end
            end
          else
            L4_349 = A1_346[4]
            L4_349 = L4_349.LogicalIfName
            if L4_349 == "WAN2" then
              L4_349, L5_350, L6_351, L7_352 = nil, nil, nil, nil
              for L11_356, L12_357 in L8_353(L9_354) do
                if L11_356 == 4 then
                  for _FORV_16_, _FORV_17_ in pairs(L12_357) do
                    if not A0_345[L3_348] then
                      A0_345[L3_348] = {}
                    end
                    A0_345[L3_348][_FORV_16_] = _FORV_17_
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  return A0_345
end
tableAppendProfile = L1_1
function L1_1(A0_358, A1_359)
  local L3_360, L4_361
  if A0_358 == nil then
    return A0_358
  end
  L3_360 = 0
  L4_361 = 0
  if tonumber(A1_359) < 87 then
    for _FORV_8_, _FORV_9_ in pairs(A0_358) do
      L4_361 = L4_361 + 1
      if A0_358[_FORV_8_].interfaceName == "bdgWAN1" then
        L3_360 = 1
      end
    end
  elseif tonumber(A1_359) >= 87 then
    for _FORV_8_, _FORV_9_ in pairs(A0_358) do
      L4_361 = L4_361 + 1
      if A0_358[_FORV_8_].interfaceName == "eth1" then
        L3_360 = 1
      end
    end
  end
  if L3_360 == 1 then
    return A0_358
  else
    A0_358[L4_361 + 1] = {}
    A0_358[L4_361 + 1]._ROWID_ = L4_361 + 1
    if 0 == 1 then
      A0_358[L4_361 + 1].interfaceName = "bdgWAN1"
    else
      A0_358[L4_361 + 1].interfaceName = "eth1"
    end
    A0_358[L4_361 + 1].duplex = "1"
    A0_358[L4_361 + 1].poe = "0"
    A0_358[L4_361 + 1].vlanEnabled = "0"
    A0_358[L4_361 + 1].vlanId = "1"
    A0_358[L4_361 + 1].trunkPort = "0"
    A0_358[L4_361 + 1 + 1] = {}
    A0_358[L4_361 + 1 + 1]._ROWID_ = L4_361 + 1 + 1
    if 0 == 1 then
      A0_358[L4_361 + 1 + 1].interfaceName = "bdgWAN2"
    else
      A0_358[L4_361 + 1 + 1].interfaceName = "eth2"
    end
    A0_358[L4_361 + 1 + 1].duplex = "1"
    A0_358[L4_361 + 1 + 1].poe = "0"
    A0_358[L4_361 + 1 + 1].vlanEnabled = "0"
    A0_358[L4_361 + 1 + 1].vlanId = "1"
    A0_358[L4_361 + 1 + 1].trunkPort = "0"
  end
  return A0_358
end
tableMergeethernet = L1_1
function L1_1(A0_362)
  if A0_362 == nil then
    return A0_362
  end
  for _FORV_4_, _FORV_5_ in pairs(A0_362) do
    if A0_362[_FORV_4_].VirtualIfName == "eth1" then
      A0_362[_FORV_4_].VirtualIfName = "bdgWAN1"
    end
    if A0_362[_FORV_4_].VirtualIfName == "eth2" then
      A0_362[_FORV_4_].VirtualIfName = "bdgWAN2"
    end
  end
  return A0_362
end
tableMergeDefaultIfGrpInfo = L1_1
function L1_1(A0_363)
  if A0_363 == nil then
    return A0_363
  end
  for _FORV_4_, _FORV_5_ in pairs(A0_363) do
    if A0_363[_FORV_4_].LogicalIfName == "WAN1" and A0_363[_FORV_4_].AddressFamily == "2" and A0_363[_FORV_4_].vlanTagEnable == "1" then
      A0_363[_FORV_4_].vlanTagEnable = "0"
      A0_363[_FORV_4_].vlanId = "0"
    end
    if A0_363[_FORV_4_].LogicalIfName == "WAN2" and A0_363[_FORV_4_].AddressFamily == "2" and A0_363[_FORV_4_].vlanTagEnable == "1" then
      A0_363[_FORV_4_].vlanTagEnable = "0"
      A0_363[_FORV_4_].vlanId = "0"
    end
  end
  return A0_363
end
tableUpdateVLANTrunk = L1_1
function L1_1(A0_364, A1_365)
  if A0_364 == nil or A1_365 == nil then
    return A0_364
  end
  for _FORV_5_, _FORV_6_ in pairs(A1_365) do
    if A1_365[_FORV_5_].PortNumber == "100" then
      A1_365[_FORV_5_] = nil
      A1_365[_FORV_5_] = table[_FORV_5_ + 1]
    end
  end
  for _FORV_5_, _FORV_6_ in pairs(A1_365) do
    if A1_365[_FORV_5_].PortNumber == "200" then
      A1_365[_FORV_5_] = nil
      A1_365[_FORV_5_] = table[_FORV_5_ + 1]
    end
  end
  return A1_365
end
tableMergeVlanPortMgmt = L1_1
function L1_1(A0_366, A1_367, A2_368)
  local L3_369, L4_370, L5_371, L6_372
  L3_369 = 0
  L4_370 = 0
  L5_371 = 0
  L6_372 = 0
  for _FORV_12_, _FORV_13_ in pairs(A2_368) do
    if A2_368[_FORV_12_].LogicalIfName == "WAN1" and A2_368[_FORV_12_].AddressFamily == "2" and A2_368[_FORV_12_].vlanTagEnable == "1" then
      L5_371 = 1
    end
    if A2_368[_FORV_12_].LogicalIfName == "WAN2" and A2_368[_FORV_12_].AddressFamily == "2" and A2_368[_FORV_12_].vlanTagEnable == "1" then
      L6_372 = 1
    end
  end
  if L5_371 == 0 and L6_372 == 0 then
    return A0_366
  end
  if L5_371 == 1 then
    for _FORV_12_, _FORV_13_ in pairs(A0_366) do
      if A0_366[_FORV_12_].LogicalIfName == "WAN1" then
        A0_366[_FORV_12_].VlanId = A2_368[_FORV_12_].vlanId
        A0_366[_FORV_12_].InterfaceName = "bdgWAN1"
        A0_366[_FORV_12_].VlanPortMode = 2
      end
    end
  end
  if L6_372 == 1 then
    for _FORV_12_, _FORV_13_ in pairs(A0_366) do
      if A0_366[_FORV_12_].LogicalIfName == "WAN2" then
        A0_366[_FORV_12_].VlanId = A2_368[_FORV_12_].vlanId
        A0_366[_FORV_12_].InterfaceName = "bdgWAN2"
        A0_366[_FORV_12_].VlanPortMode = 2
      end
    end
  end
  return A0_366
end
tableMergeVlanOverWan = L1_1
function L1_1(A0_373, A1_374, A2_375)
  local L3_376, L4_377, L5_378
  if A0_373 == nil or A1_374 == nil then
    return A0_373
  end
  L3_376 = 0
  L4_377 = 0
  L5_378 = 0
  for _FORV_10_, _FORV_11_ in pairs(A1_374) do
    L4_377 = L4_377 + 1
    if A1_374[_FORV_10_].portName == "port100" or A1_374[_FORV_10_].portName == "port200" then
      L3_376 = 1
    end
  end
  if L3_376 == 0 then
    for _FORV_10_, _FORV_11_ in pairs(A2_375) do
      if A2_375[_FORV_10_].LogicalIfName == "WAN1" and A2_375[_FORV_10_].AddressFamily == "2" and A2_375[_FORV_10_].vlanTagEnable == "1" then
        L5_378 = 1
        wan1VlanID = A2_375[_FORV_10_].vlanId
      end
      if A2_375[_FORV_10_].LogicalIfName == "WAN2" and A2_375[_FORV_10_].AddressFamily == "2" and A2_375[_FORV_10_].vlanTagEnable == "1" then
        wan2VlanID = A2_375[_FORV_10_].vlanId
      end
    end
  end
  if L3_376 == 1 or L5_378 == 0 and 1 == 0 then
    return A1_374
  else
    if L5_378 == 1 then
      A1_374[L4_377 + 1] = {}
      A1_374[L4_377 + 1].portName = "port5"
      A1_374[L4_377 + 1].vlanId = wan1VlanID
      A1_374[L4_377 + 1].vlanName = "vlanWan1"
      A1_374[L4_377 + 1].vlanInternal = "0"
      A1_374[L4_377 + 1 + 1] = {}
      A1_374[L4_377 + 1 + 1].portName = "port6"
      A1_374[L4_377 + 1 + 1].vlanId = wan1VlanID
      A1_374[L4_377 + 1 + 1].vlanName = "vlanWan1"
      A1_374[L4_377 + 1 + 1].vlanInternal = "0"
      A1_374[L4_377 + 1 + 2] = {}
      A1_374[L4_377 + 1 + 2].portName = "port100"
      A1_374[L4_377 + 1 + 2].vlanId = wan1VlanID
      A1_374[L4_377 + 1 + 2].vlanName = "vlanWan1"
      A1_374[L4_377 + 1 + 2].vlanInternal = "0"
    end
    if L5_378 == 2 then
      if L5_378 == 1 then
        A1_374[L4_377 + 1 + 3] = {}
        A1_374[L4_377 + 1 + 3].portName = "port5"
        A1_374[L4_377 + 1 + 3].vlanId = wan1VlanID
        A1_374[L4_377 + 1 + 3].vlanName = "vlanWan1"
        A1_374[L4_377 + 1 + 3].vlanInternal = "0"
      else
        A1_374[L4_377 + 1] = {}
        A1_374[L4_377 + 1].portName = "port200"
        A1_374[L4_377 + 1].vlanId = wan2VlanID
        A1_374[L4_377 + 1].vlanName = "vlanWan2"
        A1_374[L4_377 + 1].vlanInternal = "0"
      end
    end
  end
  return A1_374
end
tableMergevlan = L1_1
function L1_1(A0_379, A1_380)
  local L3_381
  if A0_379 == nil or A1_380 == nil then
    return A0_379
  end
  L3_381 = 0
  for _FORV_7_, _FORV_8_ in pairs(A1_380) do
    if A1_380[_FORV_7_].interfaceName == "bdgWAN1" then
      L3_381 = 1
    end
  end
  if L3_381 == 1 then
    return A1_380
  else
    A1_380[0 + 1 + 1] = {}
    A1_380[0 + 1 + 1]._ROWID_ = 0 + 1 + 1
    A1_380[0 + 1 + 1].interfaceName = "bdgWAN1"
    A1_380[0 + 1 + 1].bridgeIndex = "1"
    A1_380[0 + 1 + 1 + 1] = {}
    A1_380[0 + 1 + 1 + 1]._ROWID_ = 0 + 1 + 1 + 1
    A1_380[0 + 1 + 1 + 1].interfaceName = "bdgWAN2"
    A1_380[0 + 1 + 1 + 1].bridgeIndex = "1"
  end
  return A1_380
end
tableMergebridgeTable = L1_1
function L1_1(A0_382, A1_383, A2_384, A3_385)
  local L5_386
  if A0_382 == nil or A1_383 == nil then
    return A0_382
  end
  L5_386 = 0
  if tonumber(A2_384) == 87 and A3_385 then
    for _FORV_11_, _FORV_12_ in pairs(A3_385) do
    end
  end
  for _FORV_11_, _FORV_12_ in pairs(A1_383) do
    if A1_383[_FORV_11_].bridgeInterface == "bdgWAN1" then
      if 1 == 1 then
        A1_383[_FORV_11_].portEnabled = "1"
      else
        A1_383[_FORV_11_].portEnabled = "0"
      end
      L5_386 = 1
    end
    if A1_383[_FORV_11_].bridgeInterface == "bdgWAN2" then
      if 1 == 1 then
        A1_383[_FORV_11_].portEnabled = "1"
      else
        A1_383[_FORV_11_].portEnabled = "0"
      end
      L5_386 = 1
    end
  end
  if L5_386 == 1 then
    return A1_383
  else
    A1_383[0 + 1 + 1] = {}
    A1_383[0 + 1 + 1]._ROWID_ = 0 + 1 + 1
    A1_383[0 + 1 + 1].interfaceName = "eth1"
    A1_383[0 + 1 + 1].bridgeInterface = "bdgWAN1"
    A1_383[0 + 1 + 1].portEnabled = "0"
    A1_383[0 + 1 + 1].vlanEnabled = "0"
    A1_383[0 + 1 + 1].vlanId = "4094"
    A1_383[0 + 1 + 1].trunk = "1"
    A1_383[0 + 1 + 1 + 1] = {}
    A1_383[0 + 1 + 1 + 1]._ROWID_ = 0 + 1 + 1 + 1
    A1_383[0 + 1 + 1 + 1].interfaceName = "eth2"
    A1_383[0 + 1 + 1 + 1].bridgeInterface = "bdgWAN2"
    A1_383[0 + 1 + 1 + 1].portEnabled = "0"
    A1_383[0 + 1 + 1 + 1].vlanEnabled = "0"
    A1_383[0 + 1 + 1 + 1].vlanId = "4094"
    A1_383[0 + 1 + 1 + 1].trunk = "1"
  end
  return A1_383
end
tableMergebridgePorts = L1_1
function L1_1(A0_387, A1_388)
  local L4_389, L5_390
  if A0_387 == nil or A1_388 == nil then
    return A0_387
  end
  L4_389 = 0
  L5_390 = 0
  if unit_name == "DSR-1000" or unit_name == "DSR-1000N" or unit_name == "DSR-500" or unit_name == "DSR-500N" then
  else
  end
  for _FORV_9_, _FORV_10_ in pairs(A0_387) do
    if A0_387[_FORV_9_].LogicalIfName == "WAN2" then
      L5_390 = 1
    end
  end
  for _FORV_9_, _FORV_10_ in pairs(A1_388) do
    if A1_388[_FORV_9_].LogicalIfName == "WAN2" then
      L4_389 = 1
    end
  end
  if L4_389 == 1 or L5_390 == 0 then
    return A1_388
  else
    A1_388[0 + 1 + 1] = {}
    A1_388[0 + 1 + 1].tcpdumpEnabled = "0"
    A1_388[0 + 1 + 1].LogicalIfName = "WAN2"
  end
  return A1_388
end
tableAppendTcpdump = L1_1
function L1_1(A0_391, A1_392)
  local L2_393, L3_394, L4_395, L5_396, L6_397, L7_398, L8_399
  if A0_391 == nil or A1_392 == nil then
    return A0_391
  end
  L2_393 = 0
  L3_394 = 0
  L4_395 = 0
  L5_396 = 0
  L6_397 = 0
  for _FORV_10_, _FORV_11_ in L7_398(L8_399) do
    if A0_391[_FORV_10_].ServiceName == "RCMD" then
      A1_392[_FORV_10_].DestinationPortStart = "514"
    end
    if A0_391[_FORV_10_].ServiceName == "REXEC" then
      A1_392[_FORV_10_].DestinationPortStart = "512"
    end
    if A0_391[_FORV_10_].ServiceName == "RIP" then
      A1_392[_FORV_10_].DestinationPortStart = "520"
    end
    if A0_391[_FORV_10_].ServiceName == "NFS" then
      A1_392[_FORV_10_].Protocol = "256"
    end
  end
  for _FORV_13_, _FORV_14_ in pairs(A0_391) do
    if A0_391[_FORV_13_].ServiceName == "ICMPv6-TYPE-1" then
      L3_394 = 1
    end
  end
  for _FORV_13_, _FORV_14_ in pairs(A1_392) do
    L6_397 = L6_397 + 1
    if A1_392[_FORV_13_].ServiceName == "ICMPv6-TYPE-1" then
      L2_393 = 1
    end
  end
  for _FORV_13_, _FORV_14_ in pairs(A1_392[1]) do
    if _FORV_13_ == "PortType" or _FORV_13_ == "MultiPort" then
      L4_395 = 1
    end
  end
  for _FORV_13_, _FORV_14_ in pairs(A0_391[1]) do
    if _FORV_13_ == "PortType" or _FORV_13_ == "MultiPort" then
      L5_396 = 1
    end
  end
  if L4_395 == 0 and L5_396 == 1 then
    for _FORV_13_ = 1, #A1_392 do
      A1_392[_FORV_13_].PortType = "0"
      A1_392[_FORV_13_].MultiPort = ""
    end
  end
  if L2_393 == 1 or L3_394 == 0 then
    return A1_392
  else
    for _FORV_14_ = 1, L7_398 do
      A1_392[L6_397 + 1] = {}
      A1_392[L6_397 + 1].ServiceName = A0_391[L8_399].ServiceName
      A1_392[L6_397 + 1].Protocol = A0_391[L8_399].Protocol
      A1_392[L6_397 + 1].DestinationPortStart = A0_391[L8_399].DestinationPortStart
      A1_392[L6_397 + 1].DestinationPortEnd = A0_391[L8_399].DestinationPortEnd
      A1_392[L6_397 + 1].TypeOfService = A0_391[L8_399].TypeOfService
      A1_392[L6_397 + 1].IsDefault = A0_391[L8_399].IsDefault
      A1_392[L6_397 + 1].PortType = "0"
      A1_392[L6_397 + 1].MultiPort = ""
      A1_392[L6_397 + 1]._ROWID_ = L6_397 + 1
    end
  end
  for _FORV_14_, _FORV_15_ in pairs(A1_392) do
    if A1_392[_FORV_14_].ServiceName == "FTP" and A1_392[_FORV_14_].DestinationPortStart == "20" then
      A1_392[_FORV_14_].DestinationPortStart = "21"
      A1_392[_FORV_14_].DestinationPortEnd = "0"
    end
  end
  return A1_392
end
tableAppendServices = L1_1
function L1_1(A0_400, A1_401)
  local L4_402, L5_403
  if A0_400 == nil or A1_401 == nil then
    return A0_400
  end
  L4_402 = 0
  L5_403 = 0
  if unit_name == "DSR-1000" or unit_name == "DSR-1000N" or unit_name == "DSR-500" or unit_name == "DSR-500N" then
  else
  end
  for _FORV_9_, _FORV_10_ in pairs(A0_400) do
    if A0_400[_FORV_9_].ZoneLogicalIfName == "WAN2" then
      L5_403 = 1
    end
  end
  for _FORV_9_, _FORV_10_ in pairs(A1_401) do
    if A1_401[_FORV_9_].ZoneLogicalIfName == "WAN2" then
      L4_402 = 1
    end
  end
  if L4_402 == 1 or L5_403 == 0 then
    return A1_401
  else
    A1_401[0 + 1 + 1] = {}
    A1_401[0 + 1 + 1].ZoneType = "INSECURE"
    A1_401[0 + 1 + 1].ZoneLogicalIfName = "WAN2"
    if unit_name == "DSR-1000" or unit_name == "DSR-1000N" or unit_name == "DSR-500" or unit_name == "DSR-500N" then
      A1_401[0 + 1 + 1].LogicalIfNameMark = "1656"
    else
      A1_401[0 + 1 + 1].LogicalIfNameMark = "2184"
    end
    A1_401[0 + 1 + 1]._ROWID_ = 0 + 1 + 1
  end
  return A1_401
end
tableAppendZones = L1_1
function L1_1(A0_404, A1_405)
  local L2_406
  L2_406 = {}
  L2_406 = filterTable(A0_404, function(A0_407)
    local L1_408, L2_409, L3_410, L4_411
    for _FORV_8_, _FORV_9_ in pairs(_UPVALUE0_) do
      if _FORV_9_ == A0_407 then
        return true
      end
    end
    return false
  end)
  return L2_406
end
tableSubtract = L1_1
function L1_1(A0_412)
  local L2_413
  L2_413 = {}
  for _FORV_6_, _FORV_7_ in pairs(bridgePorts) do
    if _FORV_7_.interfaceName ~= "eth2" then
      L2_413[0 + 1] = bridgePorts[_FORV_6_]
    end
  end
  return L2_413
end
bridgePortsIfDelete = L1_1
function L1_1(A0_414, A1_415, A2_416, A3_417)
  local L4_418, L5_419, L6_420, L7_421, L8_422, L9_423, L10_424, L11_425, L12_426, L13_427, L14_428, L15_429, L16_430, L17_431, L18_432, L19_433
  A0_414 = nil
  L4_418 = {}
  A0_414 = L4_418
  L4_418, L5_419, L6_420, L7_421 = nil, nil, nil, nil
  L8_422 = {}
  L9_423 = 1
  L10_424 = 1
  L11_425 = 1
  L12_426 = 1
  L13_427 = {}
  L14_428 = {}
  L15_429 = {}
  L16_430 = {}
  L17_431 = {}
  L18_432 = {}
  L19_433 = {}
  L19_433["0"] = "SSLVPN"
  L19_433["1"] = "SSLVPN"
  L19_433["3"] = "ADMIN"
  L19_433["4"] = "GUEST"
  L19_433["5"] = "XAUTH"
  L19_433["7"] = "L2TP"
  L19_433["8"] = "PPTP"
  L19_433["10"] = "RUNTIME"
  L15_429["0"] = "0"
  L15_429["3"] = "0"
  L15_429["4"] = "0"
  L15_429["5"] = "0"
  L15_429["7"] = "0"
  L15_429["8"] = "0"
  L15_429["10"] = "0"
  L14_428["0"] = "0"
  L14_428["1"] = "0"
  L14_428["3"] = "0"
  L14_428["4"] = "0"
  L14_428["5"] = "0"
  L14_428["7"] = "0"
  L14_428["8"] = "0"
  L14_428["10"] = "0"
  for _FORV_23_, _FORV_24_ in pairs(A1_415) do
    if _FORV_24_.UserType ~= "0" and _FORV_24_.UserType ~= "1" and _FORV_24_.UserType ~= "9" and L15_429[_FORV_24_.UserType] == "0" then
      L16_430[L10_424] = {}
      L16_430[L10_424].GroupId = L10_424
      L16_430[L10_424].Capabilities = _FORV_24_.UserType
      if _FORV_24_.UserType == "3" or _FORV_24_.UserType == "4" then
        L16_430[L10_424].DefaultGroup = "1"
      else
        L16_430[L10_424].DefaultGroup = "0"
      end
      L16_430[L10_424].GroupTimeOut = "10"
      L16_430[L10_424].GroupName = L19_433[_FORV_24_.UserType]
      L14_428[_FORV_24_.UserType] = L10_424
      L18_432[L10_424] = {}
      L18_432[L10_424].GroupId = L10_424
      L18_432[L10_424].LoginTimeout = "5"
      L18_432[L10_424].LockoutEnable = "1"
      L18_432[L10_424].MaxLockoutAttempts = "3"
      L18_432[L10_424].LockPeriod = "60"
      L18_432[L10_424].LoginFromIP = "0"
      L18_432[L10_424].LoginFromBrowser = "0"
      if _FORV_24_.UserType == "4" then
        L18_432[L10_424].DenyLogin = "1"
        L18_432[L10_424].DenyLoginFromWan = "1"
      else
        L18_432[L10_424].DenyLogin = "0"
        L18_432[L10_424].DenyLoginFromWan = "0"
      end
      L10_424 = L10_424 + 1
      L15_429[_FORV_24_.UserType] = "1"
    end
    if _FORV_24_.UserType == "0" or _FORV_24_.UserType == "1" then
      sslGroupName = _FORV_24_.GroupName
      for _FORV_32_, _FORV_33_ in pairs(A2_416) do
        if _FORV_33_.GroupName == sslGroupName then
          sslDomainName = _FORV_33_.DomainName
          break
        end
      end
      if L13_427[sslGroupName] == nil then
        for _FORV_32_, _FORV_33_ in pairs(A3_417) do
          if _FORV_33_.DomainName == sslDomainName then
            L17_431[L11_425] = {}
            L17_431[L11_425].PortalLayoutName = A3_417[_FORV_32_].PortalLayoutName or ""
            L17_431[L11_425].AuthenticationType = A3_417[_FORV_32_].AuthenticationType or ""
            L17_431[L11_425].AuthenticationServer = A3_417[_FORV_32_].AuthenticationServer or ""
            L17_431[L11_425].SecondAuthenticationServer = A3_417[_FORV_32_].SecondAuthenticationServer or ""
            L17_431[L11_425].ThirdAuthenticationServer = A3_417[_FORV_32_].ThirdAuthenticationServer or ""
            L17_431[L11_425].TimeOut = A3_417[_FORV_32_].TimeOut or ""
            L17_431[L11_425].Retries = A3_417[_FORV_32_].Retries or ""
            L17_431[L11_425].AuthenticationRadiusSecret = A3_417[_FORV_32_].AuthenticationRadiusSecret or ""
            L17_431[L11_425].SecondAuthenticationRadiusSecret = A3_417[_FORV_32_].SecondAuthenticationRadiusSecret or ""
            L17_431[L11_425].NTDomainWorkGroup = A3_417[_FORV_32_].NTDomainWorkGroup or ""
            L17_431[L11_425].NTDomainSecondWorkGroup = A3_417[_FORV_32_].NTDomainSecondWorkGroup or ""
            L17_431[L11_425].LDAPBaseDN = A3_417[_FORV_32_].LDAPBaseDN or ""
            L17_431[L11_425].SecondLDAPBaseDN = A3_417[_FORV_32_].SecondLDAPBaseDN or ""
            L17_431[L11_425].ActiveDirectoryDomain = A3_417[_FORV_32_].ActiveDirectoryDomain or ""
            L17_431[L11_425].SecondActiveDirectoryDomain = A3_417[_FORV_32_].SecondActiveDirectoryDomain or ""
            L17_431[L11_425].DefaultDomain = A3_417[_FORV_32_].DefaultDomain or ""
            L17_431[L11_425].DomainName = sslGroupName
            L17_431[L11_425].GroupId = L10_424
            L17_431[L11_425]._ROWID_ = L11_425
            L11_425 = L11_425 + 1
            break
          end
        end
        L16_430[L10_424] = {}
        L16_430[L10_424].GroupId = L10_424
        L16_430[L10_424].Capabilities = "0"
        if _FORV_24_.UserType == "3" or _FORV_24_.UserType == "4" then
          L16_430[L10_424].DefaultGroup = "1"
        else
          L16_430[L10_424].DefaultGroup = "0"
        end
        L16_430[L10_424].GroupTimeOut = "10"
        L16_430[L10_424].GroupName = sslGroupName
        L16_430[L10_424].DomainName = sslGroupName
        if L17_431[L11_425 - 1].AuthenticationType == "ldap" then
          L16_430[L10_424].LDAPAttribute1 = _FORV_33_.LDAPAttribute1 or ""
          L16_430[L10_424].LDAPAttribute2 = _FORV_33_.LDAPAttribute2 or ""
          L16_430[L10_424].LDAPAttribute3 = _FORV_33_.LDAPAttribute3 or ""
          L16_430[L10_424].LDAPAttribute4 = _FORV_33_.LDAPAttribute4 or ""
        end
        L14_428[_FORV_24_.UserType] = L10_424
        L18_432[L10_424] = {}
        L18_432[L10_424].GroupId = L10_424
        L18_432[L10_424].LoginTimeout = "5"
        L18_432[L10_424].LockoutEnable = "1"
        L18_432[L10_424].MaxLockoutAttempts = "3"
        L18_432[L10_424].LockPeriod = "60"
        L18_432[L10_424].LoginFromIP = "0"
        L18_432[L10_424].LoginFromBrowser = "0"
        L18_432[L10_424].DenyLogin = "0"
        L18_432[L10_424].DenyLoginFromWan = "0"
        L13_427[sslGroupName] = L10_424
        L10_424 = L10_424 + 1
      else
        L14_428[_FORV_24_.UserType] = L13_427[sslGroupName]
      end
    end
    A0_414[L9_423] = {}
    A0_414[L9_423].UserName = _FORV_24_.UserName
    A0_414[L9_423].FirstName = _FORV_24_.FirstName
    A0_414[L9_423].LastName = _FORV_24_.LastName
    A0_414[L9_423].UserTimeOut = _FORV_24_.UserTimeOut
    A0_414[L9_423].AllowChangePassword = "0"
    A0_414[L9_423].Password = _FORV_24_.Password or ""
    A0_414[L9_423].DefaultUser = _FORV_24_.DefaultUser
    A0_414[L9_423].GroupId = L14_428[_FORV_24_.UserType]
    A0_414[L9_423].UserId = L9_423
    L9_423 = L9_423 + 1
  end
  return A0_414, L16_430, L17_431, L18_432
end
usersTableMigrate = L1_1
function L1_1(A0_434, A1_435)
  local L2_436, L3_437
  for _FORV_7_, _FORV_8_ in pairs(A0_434) do
    if _FORV_8_.GroupId == A1_435 then
      return _FORV_8_
    end
  end
end
groupOfDomain = L1_1
function L1_1(A0_438, A1_439)
  local L2_440, L3_441
  for _FORV_7_, _FORV_8_ in pairs(A0_438) do
    if _FORV_8_.authserver == A1_439 then
      return _FORV_8_.ProfileName
    end
  end
  return false
end
radiusProfileInUse = L1_1
function L1_1(A0_442, A1_443, A2_444)
  local L3_445, L4_446, L5_447, L6_448, L7_449, L8_450, L9_451, L10_452, L11_453, L12_454, L13_455, L14_456, L15_457, L16_458, L17_459
  L3_445 = {}
  L4_446 = {}
  L5_447 = {}
  L6_448 = {}
  L7_449 = {}
  L8_450 = {}
  L9_451 = 1
  L10_452 = 1
  L11_453 = 1
  L12_454 = 1
  L13_455 = 1
  L14_456, L15_457, L16_458, L17_459 = nil, nil, nil, nil
  for _FORV_21_, _FORV_22_ in pairs(A2_444) do
    L6_448[L11_453] = {}
    L6_448[L11_453].ProfileName = "Default"
    L6_448[L11_453].isEnable = "1"
    L6_448[L11_453].authserver = _FORV_22_.authserver
    L6_448[L11_453].authport = _FORV_22_.authport
    L6_448[L11_453].authtimeout = _FORV_22_.authtimout
    L6_448[L11_453].authretries = _FORV_22_.authretries
    L6_448[L11_453].authsecret = _FORV_22_.authsecret
    L11_453 = L11_453 + 1
  end
  if A0_442 ~= nil then
    for _FORV_21_, _FORV_22_ in pairs(A0_442) do
      L8_450[L13_455] = {}
      L5_447 = groupOfDomain(A1_443, _FORV_22_.GroupId)
      L8_450[L13_455].GroupId = _FORV_22_.GroupId
      L8_450[L13_455].DomainName = _FORV_22_.DomainName
      L8_450[L13_455].PortalLayoutName = _FORV_22_.PortalLayoutName
      L8_450[L13_455].AuthenticationType = _FORV_22_.AuthenticationType
      if _FORV_22_.AuthenticationType == "radius_pap" or _FORV_22_.AuthenticationType == "radius_chap" or _FORV_22_.AuthenticationType == "radius_mschap" or _FORV_22_.AuthenticationType == "radius_mschapv2" then
        L8_450[L13_455].AuthProfile = radiusProfileInUse(L6_448, _FORV_22_.AuthenticationServer) or radiusProfileInUse(L6_448, _FORV_22_.SecondAuthenticationServer) or radiusProfileInUse(L6_448, _FORV_22_.ThirdAuthenticationServer)
        if not L8_450[L13_455].AuthProfile then
          if _FORV_22_.AuthenticationServer ~= nil and _FORV_22_.AuthenticationServer ~= "" then
            L6_448[L11_453] = {}
            L6_448[L11_453].ProfileName = "Radius_Profile_" .. tostring(L11_453)
            L6_448[L11_453].isEnable = "0"
            L6_448[L11_453].authserver = _FORV_22_.AuthenticationServer
            L6_448[L11_453].authport = "1812"
            L6_448[L11_453].authsecret = _FORV_22_.AuthenticationRadiusSecret or "sharedsecret"
            L6_448[L11_453].authtimeout = _FORV_22_.TimeOut or "2"
            L6_448[L11_453].authretries = _FORV_22_.Retries or "1"
            L8_450[L13_455].AuthProfile = L6_448[L11_453].ProfileName
            L11_453 = L11_453 + 1
          end
          if _FORV_22_.SecondAuthenticationServer ~= nil and _FORV_22_.SecondAuthenticationServer ~= "" then
            L6_448[L11_453] = {}
            L6_448[L11_453].ProfileName = "Radius_Profile_" .. tostring(L11_453 - 1)
            L6_448[L11_453].isEnable = "0"
            L6_448[L11_453].authserver = _FORV_22_.SecondAuthenticationServer
            L6_448[L11_453].authport = "1812"
            L6_448[L11_453].authsecret = _FORV_22_.SecondAuthenticationRadiusSecret or "sharedsecret"
            L6_448[L11_453].authtimeout = _FORV_22_.TimeOut or "2"
            L6_448[L11_453].authretries = _FORV_22_.Retries or "1"
            L8_450[L13_455].AuthProfile = L6_448[L11_453].ProfileName
            L11_453 = L11_453 + 1
          end
          if _FORV_22_.ThirdAuthenticationServer ~= nil and _FORV_22_.ThirdAuthenticationServer ~= "" then
            L6_448[L11_453] = {}
            L6_448[L11_453].ProfileName = "Radius_Profile_" .. tostring(L11_453 - 2)
            L6_448[L11_453].isEnable = "0"
            L6_448[L11_453].authserver = _FORV_22_.ThirdAuthenticationServer
            L6_448[L11_453].authport = "1812"
            L6_448[L11_453].authsecret = "sharedsecret"
            L6_448[L11_453].authtimeout = _FORV_22_.TimeOut or "2"
            L6_448[L11_453].authretries = _FORV_22_.Retries or "1"
            L8_450[L13_455].AuthProfile = L6_448[L11_453].ProfileName
            L11_453 = L11_453 + 1
          end
        end
      elseif _FORV_22_.AuthenticationType == "ldap" then
        L3_445[L9_451] = {}
        L3_445[L9_451].ProfileName = "LDAP_Profile_" .. tostring(L9_451)
        L3_445[L9_451].AuthenticationServer = _FORV_22_.AuthenticationServer
        L3_445[L9_451].SecondAuthenticationServer = _FORV_22_.SecondAuthenticationServer or ""
        L3_445[L9_451].ThirdAuthenticationServer = _FORV_22_.ThirdAuthenticationServer or ""
        L3_445[L9_451].LDAPBaseDN = _FORV_22_.LDAPBaseDN or ""
        L3_445[L9_451].SecondLDAPBaseDN = _FORV_22_.SecondLDAPBaseDN or ""
        L3_445[L9_451].LDAPAttribute1 = L5_447.LDAPAttribute1 or ""
        L3_445[L9_451].LDAPAttribute2 = L5_447.LDAPAttribute2 or ""
        L3_445[L9_451].LDAPAttribute3 = L5_447.LDAPAttribute3 or ""
        L3_445[L9_451].LDAPAttribute4 = L5_447.LDAPAttribute4 or ""
        L3_445[L9_451].TimeOut = _FORV_22_.TimeOut or "10"
        L3_445[L9_451].Retries = _FORV_22_.Retries or "5"
        L8_450[L13_455].AuthProfile = L3_445[L9_451].ProfileName
        L9_451 = L9_451 + 1
      elseif _FORV_22_.AuthenticationType == "ntdomain" then
        L4_446[L12_454] = {}
        L4_446[L12_454].ProfileName = "NTDomain_Profile_" .. tostring(L12_454)
        L4_446[L12_454].AuthenticationServer = _FORV_22_.AuthenticationServer
        L4_446[L12_454].SecondAuthenticationServer = _FORV_22_.SecondAuthenticationServer or ""
        L4_446[L12_454].ThirdAuthenticationServer = _FORV_22_.ThirdAuthenticationServer or ""
        L4_446[L12_454].NTDomainWorkGroup = _FORV_22_.NTDomainWorkGroup or ""
        L4_446[L12_454].NTDomainSecondWorkGroup = _FORV_22_.NTDomainSecondWorkGroup or ""
        L4_446[L12_454].TimeOut = _FORV_22_.TimeOut or "10"
        L4_446[L12_454].Retries = _FORV_22_.Retries or "5"
        L8_450[L13_455].AuthProfile = L4_446[L12_454].ProfileName
        L12_454 = L12_454 + 1
      elseif _FORV_22_.AuthenticationType == "active-directory" then
        L7_449[L10_452] = {}
        L7_449[L10_452].ProfileName = "AD_Profile_" .. tostring(L10_452)
        L7_449[L10_452].AuthenticationServer = _FORV_22_.AuthenticationServer or ""
        L7_449[L10_452].SecondAuthenticationServer = _FORV_22_.SecondAuthenticationServer or ""
        L7_449[L10_452].ThirdAuthenticationServer = _FORV_22_.ThirdAuthenticationServer or ""
        L7_449[L10_452].ActiveDirectoryDomain = _FORV_22_.ActiveDirectoryDomain or ""
        L7_449[L10_452].SecondActiveDirectoryDomain = _FORV_22_.SecondActiveDirectoryDomain or ""
        L7_449[L10_452]["ActiveDirectorySettings.TimeOut"] = _FORV_22_["USERDBDomains.TimeOut"] or "10"
        L7_449[L10_452]["ActiveDirectorySettings.Retries"] = _FORV_22_["USERDBDomains.Retries"] or "5"
        L8_450[L13_455].AuthProfile = L7_449[L10_452].ProfileName
        L10_452 = L10_452 + 1
      end
      L8_450[L13_455].AuthenticationServer = _FORV_22_.AuthenticationServer or ""
      L8_450[L13_455].SecondAuthenticationServer = _FORV_22_.SecondAuthenticationServer or ""
      L8_450[L13_455].ThirdAuthenticationServer = _FORV_22_.ThirdAuthenticationServer or ""
      L8_450[L13_455].AuthenticationRadiusSecret = _FORV_22_.AuthenticationRadiusSecret or ""
      L8_450[L13_455].SecondAuthenticationRadiusSecret = _FORV_22_.SecondAuthenticationRadiusSecret or ""
      L8_450[L13_455].NTDomainWorkGroup = _FORV_22_.NTDomainWorkGroup or ""
      L8_450[L13_455].NTDomainSecondWorkGroup = _FORV_22_.NTDomainSecondWorkGroup or ""
      L8_450[L13_455].LDAPBaseDN = _FORV_22_.LDAPBaseDN or ""
      L8_450[L13_455].SecondLDAPBaseDN = _FORV_22_.SecondLDAPBaseDN or ""
      L8_450[L13_455].ActiveDirectoryDomain = _FORV_22_.ActiveDirectoryDomain or ""
      L8_450[L13_455].SecondActiveDirectoryDomain = _FORV_22_.SecondActiveDirectoryDomain or ""
      L8_450[L13_455].TimeOut = _FORV_22_.TimeOut or "10"
      L8_450[L13_455].Retries = _FORV_22_.Retries or "5"
      L13_455 = L13_455 + 1
    end
  end
  return L8_450, L6_448, L3_445, L4_446, L7_449
end
authTablesMigrate = L1_1
function L1_1(A0_460, A1_461)
  local L2_462, L3_463, L4_464
  L2_462 = 2
  L3_463 = 0
  L4_464 = 0
  for _FORV_8_, _FORV_9_ in pairs(A1_461) do
    if _FORV_9_.portName == "dummy" and _FORV_9_.vlanId ~= "1" then
      A0_460[L2_462] = {}
      A0_460[L2_462].vlanId = _FORV_9_.vlanId
      A0_460[L2_462].vlanName = _FORV_9_.vlanName
      A0_460[L2_462].interfaceName = "bdg" .. _FORV_9_.vlanId
      usb_table = util.getLuaVariable("USB")
      for _FORV_13_, _FORV_14_ in pairs(usb_table) do
        if _FORV_14_.StorageServer == "1" then
          L3_463 = 1
        end
        if _FORV_14_.PrintServer == "1" then
          L4_464 = 1
        end
      end
      if L3_463 == 1 then
        A0_460[L2_462].storageSharing = "1"
      else
        A0_460[L2_462].storageSharing = "0"
      end
      if L4_464 == 1 then
        A0_460[L2_462].printerSharing = "1"
      else
        A0_460[L2_462].printerSharing = "0"
      end
    end
    L2_462 = L2_462 + 1
  end
  if L3_463 == 1 then
    A0_460[1].storageSharing = "1"
  end
  if L4_464 == 1 then
    A0_460[1].printerSharing = "1"
  end
  return A0_460
end
tableAppendSharePortVlan = L1_1
function L1_1(A0_465, A1_466)
  for _FORV_6_, _FORV_7_ in pairs(A1_466) do
    for _FORV_11_, _FORV_12_ in pairs(A1_466) do
      A0_465[_FORV_11_] = {}
      A0_465[_FORV_11_].vlanId = _FORV_12_.vlanId
      A0_465[_FORV_11_].ifName = _FORV_12_.ifName
      A0_465[_FORV_11_].status = _FORV_12_.status
      if _FORV_12_.vlanId ~= "1" then
      else
      end
      ifStatic_table = util.getLuaVariable("ifStatic")
      for _FORV_16_, _FORV_17_ in pairs(ifStatic_table) do
        if _FORV_17_.LogicalIfName == "LAN" and _FORV_17_.AddressFamily == "2" then
          A0_465[_FORV_11_].StaticIp = _FORV_17_.StaticIp
        end
      end
    end
  end
  return A0_465
end
tableAppendinterVlan = L1_1
function L1_1(A0_467, A1_468)
  for _FORV_5_, _FORV_6_ in pairs(A1_468) do
    if _FORV_6_.RuleType == "DEFAULT_POLICY" and _FORV_6_.Action == "DROP" then
      A0_467[1].DefaultPolicyStatus = "0"
    end
  end
  fwIpv6Tbl = util.getLuaVariable("FirewallRules6")
  for _FORV_5_, _FORV_6_ in pairs(fwIpv6Tbl) do
    if _FORV_6_.RuleType == "DEFAULT_POLICY" and _FORV_6_.Action == "DROP" then
      A0_467[2].DefaultPolicyStatus = "0"
    end
  end
  return A0_467
end
tableAppenddefaultPolicy = L1_1
function L1_1(A0_469)
  for _FORV_4_, _FORV_5_ in pairs(A0_469) do
    if _FORV_5_.UserId ~= "1" and _FORV_5_.UserId ~= "2" then
      _FORV_5_.DefaultUser = "0"
    end
  end
  return A0_469
end
setDefaultColumnUser = L1_1
function L1_1(A0_470, A1_471)
  local L2_472, L3_473
  L2_472 = 1
  while true do
    L3_473 = A0_470[L2_472]
    if L3_473 then
      L3_473 = A0_470[L2_472]
      L3_473 = L3_473.LogicalIfName
      if L3_473 == A1_471 then
        L3_473 = A0_470[L2_472]
        L3_473 = L3_473.StaticIp
        return L3_473
      end
      L2_472 = L2_472 + 1
    end
  end
  L3_473 = ""
  return L3_473
end
getStaticIp = L1_1
function L1_1(A0_474, A1_475, A2_476)
  local L3_477, L4_478
  if A1_475 == nil then
    return A0_474
  end
  L3_477 = 1
  L4_478 = nil
  while A1_475[L3_477] do
    L4_478 = A1_475[L3_477].logicalIfName
    defaultGwAddress = getStaticIp(A2_476, L4_478)
    A1_475[L3_477].defaultGw = defaultGwAddress
    L3_477 = L3_477 + 1
  end
  return A1_475
end
dhcpGatewayModify = L1_1
function L1_1(A0_479)
  local L1_480, L2_481, L3_482, L4_483
  if A0_479 == nil then
    return A0_479
  end
  L1_480, L2_481 = nil, nil
  L3_482 = #A0_479
  L4_483 = {}
  if A0_479[L3_482] then
    L4_483[1] = {}
    for _FORV_8_, _FORV_9_ in pairs(A0_479[L3_482]) do
      if _FORV_8_ == "ProfileName" then
        L4_483[1][_FORV_8_] = "Default"
      else
        L4_483[1][_FORV_8_] = _FORV_9_
      end
    end
  end
  return L4_483
end
tableAuthProfile = L1_1
function L1_1(A0_484)
  local L1_485, L2_486, L3_487, L4_488, L5_489
  if A0_484 == nil then
    return A0_484
  end
  L1_485, L2_486 = nil, nil
  L3_487 = 1
  L4_488 = 1
  L5_489 = {}
  while A0_484[L3_487] do
    if tonumber(A0_484[L3_487].isEnable) == 1 then
      L5_489[L4_488] = {}
      for _FORV_9_, _FORV_10_ in pairs(A0_484[L3_487]) do
        if _FORV_9_ == "ProfileName" then
          _FORV_10_ = "Default"
        end
        L5_489[L4_488][_FORV_9_] = _FORV_10_
      end
      L4_488 = L4_488 + 1
      if L4_488 >= 4 then
        break
      end
    end
    L3_487 = L3_487 + 1
  end
  return L5_489
end
tableAuthProfileRadius = L1_1
function L1_1(A0_490, A1_491, A2_492, A3_493, A4_494)
  if A0_490 == nil then
    return A0_490
  end
  for _FORV_8_, _FORV_9_ in pairs(A0_490) do
    if A0_490[_FORV_8_].AuthenticationType == "ldap" then
      A0_490[_FORV_8_].AuthProfile = A1_491[1].ProfileName
      A0_490[_FORV_8_].AuthenticationServer = A1_491[1].AuthenticationServer
      A0_490[_FORV_8_].SecondAuthenticationServer = A1_491[1].SecondAuthenticationServer
      A0_490[_FORV_8_].ThirdAuthenticationServer = A1_491[1].ThirdAuthenticationServer
      A0_490[_FORV_8_].LDAPBaseDN = A1_491[1].LDAPBaseDN
      A0_490[_FORV_8_].SecondLDAPBaseDN = A1_491[1].SecondLDAPBaseDN
      A0_490[_FORV_8_].ThirdLDAPBaseDN = A1_491[1].ThirdLDAPBaseDN
      A0_490[_FORV_8_].TimeOut = A1_491[1].LDAPBaseDN
      A0_490[_FORV_8_].Retries = A1_491[1].Retries
    elseif A0_490[_FORV_8_].AuthenticationType == "ntdomain" then
      A0_490[_FORV_8_].AuthProfile = A2_492[1].ProfileName
      A0_490[_FORV_8_].AuthenticationServer = A2_492[1].AuthenticationServer
      A0_490[_FORV_8_].SecondAuthenticationServer = A2_492[1].SecondAuthenticationServer
      A0_490[_FORV_8_].ThirdAuthenticationServer = A2_492[1].ThirdAuthenticationServer
      A0_490[_FORV_8_].NTDomainWorkGroup = A2_492[1].NTDomainWorkGroup
      A0_490[_FORV_8_].NTDomainSecondWorkGroup = A2_492[1].NTDomainSecondWorkGroup
      A0_490[_FORV_8_].ThirdNTDomainWorkGroup = A2_492[1].ThirdNTDomainWorkGroup
      A0_490[_FORV_8_].TimeOut = A2_492[1].TimeOut
      A0_490[_FORV_8_].Retries = A2_492[1].Retries
    elseif A0_490[_FORV_8_].AuthenticationType == "active-directory" then
      A0_490[_FORV_8_].AuthProfile = A3_493[1].ProfileName
      A0_490[_FORV_8_].AuthenticationServer = A3_493[1].AuthenticationServer
      A0_490[_FORV_8_].SecondAuthenticationServer = A3_493[1].SecondAuthenticationServer
      A0_490[_FORV_8_].ThirdAuthenticationServer = A3_493[1].ThirdAuthenticationServer
      A0_490[_FORV_8_].ActiveDirectoryDomain = A3_493[1].ActiveDirectoryDomain
      A0_490[_FORV_8_].SecondActiveDirectoryDomain = A3_493[1].SecondActiveDirectoryDomain
      A0_490[_FORV_8_].ThirdActiveDirectoryDomain = A3_493[1].ThirdActiveDirectoryDomain
      A0_490[_FORV_8_].TimeOut = A3_493[1].TimeOut
      A0_490[_FORV_8_].Retries = A3_493[1].Retries
    elseif A0_490[_FORV_8_].AuthenticationType == "radius_pap" or A0_490[_FORV_8_].AuthenticationType == "radius_chap" or A0_490[_FORV_8_].AuthenticationType == "radius_mschap" or A0_490[_FORV_8_].AuthenticationType == "radius_mschapv2" then
      A0_490[_FORV_8_].AuthProfile = A4_494[1].ProfileName
      A0_490[_FORV_8_].AuthenticationServer = A4_494[1].authserver
      if A4_494[2] then
        A0_490[_FORV_8_].SecondAuthenticationServer = A4_494[2].authserver
      else
        A0_490[_FORV_8_].SecondAuthenticationServer = ""
      end
      if A4_494[3] then
        A0_490[_FORV_8_].ThirdAuthenticationServer = A4_494[3].authserver
      else
        A0_490[_FORV_8_].ThirdAuthenticationServer = ""
      end
      A0_490[_FORV_8_].AuthenticationRadiusSecret = A4_494[1].authsecret
      if A4_494[2] then
        A0_490[_FORV_8_].SecondAuthenticationRadiusSecret = A4_494[2].authsecret
      else
        A0_490[_FORV_8_].SecondAuthenticationRadiusSecret = ""
      end
      if A4_494[3] then
        A0_490[_FORV_8_].ThirdAuthenticationRadiusSecret = A4_494[3].authsecret
      else
        A0_490[_FORV_8_].ThirdAuthenticationRadiusSecret = ""
      end
      A0_490[_FORV_8_].AuthenticationPort = A4_494[1].authport
      if A4_494[2] then
        A0_490[_FORV_8_].SecondAuthenticationPort = A4_494[2].authport
      end
      if A4_494[3] then
        A0_490[_FORV_8_].ThirdAuthenticationPort = A4_494[3].authport
      end
      A0_490[_FORV_8_].TimeOut = A4_494[1].authtimeout
      A0_490[_FORV_8_].Retries = A4_494[1].authretries
    end
  end
  return A0_490
end
tableProfileUpdateUSERDBDomains = L1_1
function L1_1(A0_495, A1_496)
  for _FORV_5_, _FORV_6_ in pairs(A1_496) do
    if _FORV_6_ == A0_495 then
      return true
    end
  end
  return false
end
searchGroupId = L1_1
function L1_1(A0_497, A1_498, A2_499)
  local L3_500, L4_501, L5_502, L6_503, L7_504, L8_505, L9_506
  if A0_497 ~= nil and A1_498 ~= nil and A2_499 ~= nil then
    L3_500 = A2_499[1]
  elseif not L3_500 then
    return A0_497
  end
  L3_500 = A2_499[1]
  L3_500 = L3_500.LDAPAttribute1
  L4_501 = A2_499[1]
  L4_501 = L4_501.LDAPAttribute2
  L5_502 = A2_499[1]
  L5_502 = L5_502.LDAPAttribute3
  L6_503 = A2_499[1]
  L6_503 = L6_503.LDAPAttribute4
  L7_504 = {}
  L8_505 = 0
  L9_506 = nil
  for _FORV_13_, _FORV_14_ in pairs(A1_498) do
    if A1_498[_FORV_13_].AuthenticationType == "ldap" then
      L8_505 = L8_505 + 1
      L7_504[L8_505] = tonumber(A1_498[_FORV_13_].GroupId)
    end
  end
  for _FORV_13_, _FORV_14_ in pairs(A0_497) do
    L9_506 = searchGroupId(tonumber(A0_497[_FORV_13_].GroupId), L7_504)
    if L9_506 then
      A0_497[_FORV_13_].LDAPAttribute1 = L3_500
      A0_497[_FORV_13_].LDAPAttribute2 = L4_501
      A0_497[_FORV_13_].LDAPAttribute3 = L5_502
      A0_497[_FORV_13_].LDAPAttribute4 = L6_503
    end
  end
  return A0_497
end
tableProfileUpdateUserGroups = L1_1
function L1_1(A0_507, A1_508, A2_509, A3_510, A4_511)
  local L5_512
  L5_512 = {}
  for _FORV_9_, _FORV_10_ in pairs(A2_509) do
    if A2_509[_FORV_9_].enable == "1" then
      j = 0
      for _FORV_14_, _FORV_15_ in pairs(A1_508) do
        addedflag = 0
        if A1_508[_FORV_14_].enable == "1" then
          for _FORV_19_, _FORV_20_ in pairs(A0_507) do
            if A0_507[_FORV_19_].vlanId == A1_508[_FORV_14_].vlanId and A0_507[_FORV_19_].ifName then
              addedflag = 1
            end
          end
          if addedflag ~= 1 then
            j = j + 1
            L5_512[j] = {}
            L5_512[j].vlanId = A1_508[_FORV_14_].vlanId
            L5_512[j].ifName = "bdg" .. A1_508[_FORV_14_].vlanId
            L5_512[j].accessType = "2"
            if A2_509[_FORV_9_].authMode == "Local" then
              L5_512[j].authServerId = "0"
            elseif A2_509[_FORV_9_].authType == "1" then
              L5_512[j].authServerId = "11"
            elseif A2_509[_FORV_9_].authType == "2" then
              L5_512[j].authServerId = "12"
            end
            L5_512[j].profileId = A4_511
            L5_512[j].redirectType = A2_509[_FORV_9_].redirectionType
            ll = 1
            while A3_510[ll] do
              if A3_510[ll].vlanId == A1_508[_FORV_14_].vlanId then
                A3_510[ll].accessType = "2"
              end
              ll = ll + 1
            end
          end
        end
      end
    end
  end
  return L5_512, A3_510
end
tableCaptivePortalVLANmigrate = L1_1
function L1_1(A0_513, A1_514)
  i = 1
  maxgrpId = "0"
  while A1_514[i] do
    for _FORV_5_, _FORV_6_ in pairs(A1_514[i]) do
      if _FORV_5_ == "GroupId" and _FORV_6_ > maxgrpId then
        maxgrpId = _FORV_6_
      end
    end
    i = i + 1
  end
  A1_514[i] = {}
  A1_514[i].OID = "0"
  A1_514[i].GroupName = "Temp-CP"
  A1_514[i].DomainName = ""
  A1_514[i].GroupId = maxgrpId + 1
  A1_514[i].Description = "Temp-CP Group"
  A1_514[i]._ROWID_ = ""
  A1_514[i].UserIds = "3"
  A1_514[i].Capabilities = "11"
  A1_514[i].DefaultGroup = "1"
  A1_514[i].GroupTimeOut = "10"
  return A1_514
end
tableUserGroupsMigrate = L1_1
function L1_1(A0_515, A1_516)
  local L2_517, L3_518
  L2_517 = A0_515[1]
  L2_517 = L2_517.Timezone
  L3_518 = A1_516[1]
  L3_518 = L3_518.timezone
  if L2_517 ~= L3_518 then
    L2_517 = A0_515[1]
    L3_518 = A1_516[1]
    L3_518 = L3_518.timezone
    L2_517.Timezone = L3_518
  end
  return A0_515
end
tableUpdatemanualTimeTable = L1_1
function L1_1(A0_519)
  local L1_520
  L1_520 = #A0_519
  numofrows = L1_520
  L1_520 = numofrows
  L1_520 = L1_520 + 1
  A0_519[L1_520] = {}
  L1_520 = numofrows
  L1_520 = L1_520 + 1
  L1_520 = A0_519[L1_520]
  L1_520.dayOfWeek = "-1"
  L1_520 = numofrows
  L1_520 = L1_520 + 1
  L1_520 = A0_519[L1_520]
  L1_520.hour = "-1"
  L1_520 = numofrows
  L1_520 = L1_520 + 1
  L1_520 = A0_519[L1_520]
  L1_520.unit = "1"
  L1_520 = numofrows
  L1_520 = L1_520 + 1
  L1_520 = A0_519[L1_520]
  L1_520.minute = "0"
  L1_520 = numofrows
  L1_520 = L1_520 + 1
  L1_520 = A0_519[L1_520]
  L1_520.month = "-1"
  L1_520 = numofrows
  L1_520 = L1_520 + 1
  L1_520 = A0_519[L1_520]
  L1_520.interval = "12"
  L1_520 = numofrows
  L1_520 = L1_520 + 1
  L1_520 = A0_519[L1_520]
  L1_520.command = "/pfrm2.0/bin/CPAccountsCleanUp /tmp/system.db"
  L1_520 = numofrows
  L1_520 = L1_520 + 1
  L1_520 = A0_519[L1_520]
  L1_520.dayOfMonth = "-1"
  return A0_519
end
tableCrontabMigrate = L1_1
function L1_1(A0_521)
  for _FORV_4_, _FORV_5_ in pairs(A0_521) do
    A0_521[_FORV_4_].duplicateCN = "0"
    A0_521[_FORV_4_].allowOnlyUserBasedAuth = "0"
    A0_521[_FORV_4_].FailoverRemoteIpType = "0"
    A0_521[_FORV_4_].FailoverRemoteIp = "None"
    A0_521[_FORV_4_].UploadCaOnly = "0"
    A0_521[_FORV_4_].authServerId = "0"
  end
  return A0_521
end
openvpnTabModify = L1_1
function L1_1(A0_522)
  local L1_523
  L1_523 = #A0_522
  for _FORV_5_, _FORV_6_ in pairs(A0_522) do
    A0_522[L1_523 + 1] = {}
    A0_522[L1_523 + 1].dayOfWeek = "-1"
    A0_522[L1_523 + 1].hour = "-1"
    A0_522[L1_523 + 1].unit = "6"
    A0_522[L1_523 + 1].minute = "-1"
    A0_522[L1_523 + 1].month = "-1"
    A0_522[L1_523 + 1].interval = "15"
    A0_522[L1_523 + 1].command = "/pfrm2.0/bin/lua /pfrm2.0/share/lua/5.1/teamf1lualib/dashBoardHistoryScript.lua"
    A0_522[L1_523 + 1]._ROWID_ = "1"
    A0_522[L1_523 + 1].dayOfMonth = "-1"
    A0_522[L1_523 + 2] = {}
    A0_522[L1_523 + 2].dayOfWeek = "-1"
    A0_522[L1_523 + 2].hour = "-1"
    A0_522[L1_523 + 2].unit = "6"
    A0_522[L1_523 + 2].minute = "-1"
    A0_522[L1_523 + 2].month = "-1"
    A0_522[L1_523 + 2].interval = "15"
    A0_522[L1_523 + 2].command = "/pfrm2.0/bin/lua /pfrm2.0/share/lua/5.1/teamf1lualib/vpnHistoryScript.lua"
    A0_522[L1_523 + 2]._ROWID_ = "1"
    A0_522[L1_523 + 2].dayOfMonth = "-1"
  end
  return A0_522
end
crontabModify = L1_1
function L1_1(A0_524, A1_525)
  for _FORV_5_, _FORV_6_ in pairs(A0_524) do
    if A0_524[_FORV_5_].vlanId == "1" then
    else
    end
    for _FORV_11_, _FORV_12_ in pairs(A1_525) do
      if "LAN" .. A0_524[_FORV_5_].vlanId == A1_525[_FORV_11_].LogicalIfName and A1_525[_FORV_11_].AddressFamily == "2" then
        A0_524[_FORV_5_].ipAddress = A1_525[_FORV_11_].StaticIp
      end
    end
  end
  return A0_524
end
captivePortalVlanTabModify = L1_1
function L1_1(A0_526, A1_527, A2_528, A3_529, A4_530)
  local L5_531, L6_532, L7_533, L8_534, L9_535, L10_536, L11_537, L12_538, L13_539, L14_540, L15_541, L16_542, L17_543, L18_544, L19_545
  L5_531 = 0
  L6_532 = 0
  L7_533 = {}
  L8_534 = {}
  L9_535 = {}
  for L13_539, L14_540 in L10_536(L11_537) do
    L9_535[L13_539] = L15_541
    for L18_544, L19_545 in L15_541(L16_542) do
      L9_535[L13_539][L18_544] = L19_545
    end
  end
  for L13_539, L14_540 in L10_536(L11_537) do
    m = L15_541
    L9_535[L15_541] = L16_542
    if L15_541 == "1" then
      imageName = L15_541
      L18_544 = "."
      L19_545 = imageName
      L19_545 = L19_545[2]
      L15_541.name = L16_542
      L15_541.value = "1"
      L18_544 = " /flash/tmp/capPort/"
      L19_545 = m
      L19_545 = L9_535[L19_545]
      L19_545 = L19_545.name
      L15_541(L16_542)
      L18_544 = " /flash/tmp/login/"
      L19_545 = m
      L19_545 = L9_535[L19_545]
      L19_545 = L19_545.name
      L15_541(L16_542)
    else
      L15_541.name = L16_542
      L15_541.value = "0"
    end
  end
  for L13_539, L14_540 in L10_536(L11_537) do
    if L15_541 == "1" then
      L18_544 = " /flash/tmp/login/"
      L19_545 = L9_535[L13_539]
      L19_545 = L19_545.name
      L15_541(L16_542)
    end
  end
  for L13_539, L14_540 in L10_536(L11_537) do
    L7_533[L13_539] = L15_541
    L8_534[L13_539] = L15_541
    for L18_544, L19_545 in L15_541(L16_542) do
      if L18_544 ~= "profileId" and L18_544 ~= "pageBackgroundImgConfigRow" and L18_544 ~= "pageBackgroundStyleSelector" and L18_544 ~= "BackGroundColor" then
        if L18_544 == "configurationName" then
          L7_533[L13_539][L18_544] = "CP-" .. L19_545
          L8_534[L13_539][L18_544] = "CP-" .. L19_545
        else
          L7_533[L13_539][L18_544] = L19_545
          L8_534[L13_539][L18_544] = L19_545
        end
      else
        L7_533[L13_539][L18_544] = L19_545
        if L18_544 == "pageBackgroundStyleSelector" and L19_545 == "1" then
          L7_533[L13_539].BackGroundColor = "1"
        end
        if L18_544 == "profileId" then
          L7_533[L13_539][L18_544] = L19_545
          if tonumber(L5_531) < tonumber(L19_545) then
            L5_531 = L19_545
          end
        end
        if L18_544 == "BackGroundColor" then
          L7_533[L13_539][L18_544] = L19_545
          if L19_545 == "" then
            L8_534[L13_539][L18_544] = "1"
          else
            L8_534[L13_539][L18_544] = L19_545
          end
        end
      end
    end
  end
  for L13_539, L14_540 in L10_536(L11_537) do
    m = L15_541
    if L13_539 > 6 then
      break
    end
    L7_533[L15_541] = L16_542
    L8_534[L15_541] = L16_542
    for L18_544, L19_545 in L15_541(L16_542) do
      if L18_544 == "headerImage" then
        L7_533[m][L18_544] = L19_545 + 6
        L8_534[m][L18_544] = L19_545 + 6
      elseif L18_544 == "configurationName" then
        L7_533[m][L18_544] = "SSLVPN-" .. L19_545
        L8_534[m][L18_544] = "SSLVPN-" .. L19_545
      else
        L7_533[m][L18_544] = L19_545
        L8_534[m][L18_544] = L19_545
      end
    end
    L5_531 = L5_531 + 1
    L15_541.profileId = L5_531
    L15_541.pageBackgroundImgConfigRow = "1"
    L15_541.pageBackgroundStyleSelector = "2"
  end
  for L13_539, L14_540 in L10_536(L11_537) do
    if L15_541 ~= nil then
      L14_540.profileName = L15_541
      profileNameFlag = L15_541
      for L18_544, L19_545 in L15_541(L16_542) do
        if L7_533[L18_544].configurationName == L14_540.profileName then
          profileNameFlag = true
        end
      end
      if not L15_541 then
        L14_540.profileNameFlag = "CP-default"
      end
    else
      L14_540.profileName = "SSLVPN"
    end
  end
  return L10_536, L11_537, L12_538
end
tableLoginProfilesMigrate = L1_1
function L1_1(A0_546, A1_547)
  for _FORV_5_, _FORV_6_ in pairs(A1_547) do
    if string.find(_FORV_6_.interfaceName, "vap") ~= nil and _FORV_6_.vapName ~= "unused" then
      for _FORV_10_, _FORV_11_ in pairs(A0_546) do
        if _FORV_11_.vapName == _FORV_6_.vapName then
          _FORV_11_.radioList = _FORV_6_.radioNo
          if unit_name == "DSR-150N" or unit_name == "DSR-250N" then
            _FORV_11_.maxClients = "64"
          elseif unit_name == "DSR-500N" or unit_name == "DSR-1000N" then
            _FORV_11_.maxClients = "128"
          elseif unit_name == "DSR-500AC" or unit_name == "DSR-1000AC" then
            _FORV_11_.maxClients = "127"
          end
        end
      end
    end
  end
  return A0_546
end
tableMergeDot11Vap = L1_1
function L1_1(A0_548, A1_549)
  local L2_550, L3_551, L4_552, L8_553
  L2_550 = ""
  L3_551 = ""
  L4_552 = "LAN"
  L8_553 = "10"
  for _FORV_12_, _FORV_13_ in pairs(A1_549) do
    if _FORV_13_.portName == "dummy" and _FORV_13_.vlanId ~= nil and tonumber(_FORV_13_.vlanId) ~= 1 then
      interfaceName = L4_552 .. _FORV_13_.vlanId
      A0_548[#A0_548 + 1] = {}
      A0_548[#A0_548 + 1].StaticIp = L2_550
      A0_548[#A0_548 + 1].PrefixLength = "64"
      A0_548[#A0_548 + 1].IspName = "0"
      A0_548[#A0_548 + 1].LogicalIfName = interfaceName
      A0_548[#A0_548 + 1].NetMask = L2_550
      A0_548[#A0_548 + 1].PrimaryDns = L2_550
      A0_548[#A0_548 + 1].OID = "0"
      A0_548[#A0_548 + 1].Gateway = L2_550
      A0_548[#A0_548 + 1].AddressFamily = L8_553
      A0_548[#A0_548 + 1]._ROWID_ = #A0_548 + 1
      A0_548[#A0_548 + 1].SecondaryDns = L2_550
    end
  end
  return A0_548
end
tableIfstatic = L1_1
L1_1 = {}
L2_2 = {}
L3_3 = db
L3_3 = L3_3.connect
L4_4 = arg
L4_4 = L4_4[1]
L3_3(L4_4)
L3_3 = db
L3_3 = L3_3.execute
L4_4 = "ATTACH '/tmp/cpAcc.db' as cpAccDB"
L3_3(L4_4)
L3_3 = db
L3_3 = L3_3.getAttribute
L4_4 = "environment"
L5_5 = "name"
L3_3 = L3_3(L4_4, L5_5, L6_6, L7_7)
L4_4 = db
L4_4 = L4_4.getTable
L5_5 = "saveTables"
L4_4 = L4_4(L5_5, L6_6)
L5_5 = io
L5_5 = L5_5.popen
L5_5 = L5_5(L6_6)
if L5_5 then
  unit_name = L6_6
  L6_6(L7_7)
end
L6_6(L7_7)
for L9_9, L10_10 in L6_6(L7_7) do
  L11_11 = L10_10.tableName
  L12_12 = "true"
  L13_13 = util
  L13_13 = L13_13.getLuaVariable
  L14_14 = L11_11
  L13_13 = L13_13(L14_14)
  L1_1[L11_11] = L13_13
  if L12_12 == "true" then
    L13_13 = util
    L13_13 = L13_13.getLuaVariable
    L14_14 = "USERDBUsers"
    L13_13 = L13_13(L14_14)
    L1_1.USERDBUsers = L13_13
    L13_13 = util
    L13_13 = L13_13.getLuaVariable
    L14_14 = "USERDBGroups"
    L13_13 = L13_13(L14_14)
    L1_1.USERDBGroups = L13_13
    L12_12 = "false"
  end
  L13_13 = _G
  L13_13[L11_11] = nil
end
L6_6(L7_7)
if L6_6 ~= "DSR-1000N" then
elseif L6_6 == "DSR-500" then
  if L6_6 < 75 then
    if L6_6 >= 75 then
      L6_6(L7_7)
    end
  end
end
for L9_9, L10_10 in L6_6(L7_7) do
  L11_11 = L10_10.tableName
  L12_12 = util
  L12_12 = L12_12.getLuaVariable
  L13_13 = L11_11
  L12_12 = L12_12(L13_13)
  L13_13 = L1_1[L11_11]
  if L12_12 ~= nil then
    if L11_11 == "UserGroups" or L11_11 == "GroupAccessControl" or L11_11 == "USERDBDomains" then
      L14_14 = unit_name
      if L14_14 ~= "DSR-250N" then
        L14_14 = unit_name
      else
        if L14_14 == "DSR-250" then
          L14_14 = tonumber
          L14_14 = L14_14(L15_15)
          if L14_14 <= 39 then
            L14_14 = tonumber
            L14_14 = L14_14(L15_15)
          end
      end
      elseif not (L14_14 >= 40) then
        L14_14 = unit_name
        if L14_14 ~= "DSR-1000N" then
          L14_14 = unit_name
          if L14_14 ~= "DSR-1000" then
            L14_14 = unit_name
            if L14_14 ~= "DSR-500N" then
              L14_14 = unit_name
            end
          end
        elseif L14_14 == "DSR-500" then
          L14_14 = tonumber
          L14_14 = L14_14(L15_15)
          if L14_14 <= 37 then
            L14_14 = tonumber
            L14_14 = L14_14(L15_15)
          end
        end
      end
    end
  else
    if L14_14 >= 40 then
      L14_14 = print
      L14_14(L15_15)
  end
  else
    if L13_13 and L11_11 ~= "systemConfig" and L11_11 ~= "PppoeProfile" then
      if L11_11 == "ifStatic" then
        L14_14 = tonumber
        L14_14 = L14_14(L15_15)
      elseif L14_14 >= 115 then
        L14_14 = db
        L14_14 = L14_14.getColNames
        L14_14 = L14_14(L15_15)
        for _FORV_18_, _FORV_19_ in L15_15(L16_16) do
          if _FORV_18_ ~= "_ROWID_" then
            for _FORV_23_, _FORV_24_ in pairs(L12_12) do
              if not L12_12[_FORV_23_][_FORV_19_] and L13_13[_FORV_23_] and L13_13[_FORV_23_][_FORV_19_] then
                L12_12[_FORV_23_][_FORV_19_] = ""
              end
            end
          end
        end
        if L15_15 ~= 0 then
          L13_13 = L16_16
        end
        if L11_11 == "route" then
          if L15_15 == "\"29\"" then
            L12_12 = L15_15
          end
        elseif L11_11 == "tcpdump" then
          L12_12 = L15_15
        elseif L11_11 == "Services" then
          L12_12 = L15_15
        elseif L11_11 == "Zones" then
          L12_12 = L15_15
        elseif L11_11 == "Languages" then
          if L15_15 < 62 then
            L15_15.Status = "1"
          end
        else
          L12_12 = L15_15
        end
      end
    end
    if L11_11 == "VlanPortMgmt" then
      L14_14 = tableMergeVlanPortMgmt
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L11_11 == "bridgeTable" then
      L14_14 = tableMergebridgeTable
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "WanIfNameMap" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "WanIfNameMap" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "radAcctRouteTbl" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "radAcctRouteTbl" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "radAuthTbl" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "radAuthTbl" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "MulToUni" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "MulToUni" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if (L13_13 == nil or not L13_13) and L11_11 == "vlanOverWan" and L12_12 ~= nil then
      L14_14 = L1_1.NimfConf
      L12_12 = L15_15
    end
    if (L13_13 == nil or not L13_13) and L11_11 == "teredoTunnel" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if (L13_13 == nil or not L13_13) and L11_11 == "siteCategory" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if (L13_13 == nil or not L13_13) and L11_11 == "SessionSettings" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if (L13_13 == nil or not L13_13) and L11_11 == "autodialpptpvpn" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if (L13_13 == nil or not L13_13) and L11_11 == "autodiall2tpvpn" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L11_11 == "userDashboardCustomization" then
      L14_14 = tableCreateDashboardCustomization
      L14_14 = L14_14(L15_15)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "wanRestartonTrunkUpdate" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "wanRestartonTrunkUpdate" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "interVLANRouting" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "interVLANRouting" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L11_11 == "TrafficSelector" then
      L14_14 = tonumber
      L14_14 = L14_14(L15_15)
      if L14_14 <= 109 then
        L14_14 = L1_1.BandWidthProfile
        L12_12 = L15_15
      end
    end
    if L13_13 == nil and L11_11 == "wirelessCtrlCPUsersList" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "wirelessCtrlCPUsersList" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "advQosPolicyTable" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "advQosPolicyTable" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "FlowBasedPolicyTable" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "FlowBasedPolicyTable" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "ospf" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "ospf" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "ospf6" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "ospf6" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "L2Services" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "L2Services" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "L2FirewallDefaultPolicy" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "L2FirewallDefaultPolicy" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "L2FirewallRules" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "L2FirewallRules" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "L2BandWidthProfile" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "L2BandWidthProfile" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "L2TrafficSelector" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "L2TrafficSelector" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "L2BandWidthProfileStatus" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "L2BandWidthProfileStatus" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "L2BandWidthProfileSpeed" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "L2BandWidthProfileSpeed" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "L2DscpClassList" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "L2DscpClassList" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "AccessControlUserGroupPolicyBrowser" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "AccessControlUserGroupPolicyBrowser" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "AccessControlUserGroupIPAddress" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "AccessControlUserGroupIPAddress" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "CaptivePortal" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "CaptivePortal" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif L13_13 and L11_11 == "CaptivePortal" then
      L14_14 = tonumber
      L14_14 = L14_14(L15_15)
      if L14_14 < 59 then
        L14_14 = mergeCaptivePortal
        L14_14 = L14_14(L15_15)
        L12_12 = L14_14
      end
    end
    if L11_11 == "CaptivePortalVlan" then
      L14_14 = tonumber
      L14_14 = L14_14(L15_15)
      if L14_14 < 40 and L12_12 ~= nil and L13_13 ~= nil then
        L14_14 = mergeCaptivePortalPolicy
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    end
    if L11_11 == "ospf" then
      L14_14 = tonumber
      L14_14 = L14_14(L15_15)
      if L14_14 < 99 then
        L14_14 = tableAppendOspf
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    end
    if L13_13 == nil and L11_11 == "CaptivePortalPageDetails" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "CaptivePortalPageDetails" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif L13_13 and L11_11 == "CaptivePortalPageDetails" then
      L14_14 = tableModifyCaptivePortalPageDetails
      L14_14 = L14_14(L15_15)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "ImageDetails" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "ImageDetails" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "LoginImageDetails" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "LoginImageDetails" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "LoginProfiles" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "LoginProfiles" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "SslvpnEnable" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "SslvpnEnable" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "IntelAmt" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "IntelAmt" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "IntelAmtStart" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "IntelAmtStart" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "allowedNets" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "allowedNets" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "IntelAmtPorts" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "IntelAmtPorts" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif L13_13 and L11_11 == "IntelAmtPorts" then
      L14_14 = tableModifyIntelAmt
      L14_14 = L14_14(L15_15)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "DnsStaticHostsMapping" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "DnsStaticHostsMapping" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "ifStaticIPAlias" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "ifStaticIPAlias" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "dhcpv6sLANPrefixPool" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "dhcpv6sLANPrefixPool" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "FirewallRules6" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "FirewallRules6" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L13_13 == nil and L11_11 == "GRE" then
      if L12_12 ~= nil then
        L14_14 = tableAppend
        L14_14 = L14_14(L15_15, L16_16)
        L12_12 = L14_14
      end
    elseif not L13_13 and L11_11 == "GRE" and L12_12 ~= nil then
      L14_14 = tableAppend
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L11_11 == "dhcpv6c" then
      L14_14 = tableAppendDhcpv6c
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L11_11 == "accessMgmt" then
      L14_14 = tableAppendaccessMgmt
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L11_11 == "SSLVPNPortalLayout" then
      L14_14 = tableAppendSSLVPNPortalLayout
      L14_14 = L14_14(L15_15, L16_16)
      L12_12 = L14_14
    end
    if L11_11 == "CaptivePortalVlan" then
      L14_14 = tonumber
      L14_14 = L14_14(L15_15)
      if L14_14 < 116 then
        L14_14 = L1_1.CaptivePortalVlan
        table1_captivePortalVlan = L14_14
        L14_14 = L1_1.ifStatic
        ifstaticTbl = L14_14
        L14_14 = table1_captivePortalVlan
        if L14_14 ~= nil then
          L14_14 = captivePortalVlanTabModify
          L14_14 = L14_14(L15_15, L16_16)
          L12_12 = L14_14
          L2_2.CaptivePortalVlan = L12_12
        end
      end
    end
    L14_14 = io
    L14_14 = L14_14.open
    L14_14 = L14_14(L15_15, L16_16)
    if L14_14 then
      L16_16(L17_17)
    end
    if L16_16 ~= "DSR-1000" then
    else
      if L16_16 == "DSR-500N" then
        if L15_15 == "WW" or L15_15 == "RU" then
          if L16_16 < 49 then
            if L16_16 >= 49 then
              if L11_11 == "IpsecVPNPolicy" then
                L12_12 = L16_16
              end
              if L11_11 == "IpsecIKEPolicy" then
                L12_12 = L16_16
              end
            end
          end
        end
    end
    else
      if L15_15 == "WW" then
        if L16_16 < 49 then
        end
      else
        if not (L16_16 >= 49) then
          if L15_15 == "RU" then
            if L16_16 < 47 then
            end
          end
      end
      elseif L16_16 >= 47 then
        if L11_11 == "IpsecVPNPolicy" then
          L12_12 = L16_16
        end
        if L11_11 == "IpsecIKEPolicy" then
          L12_12 = L16_16
        end
      end
    end
    if L16_16 ~= "DSR-1000" then
    else
      if L16_16 == "DSR-500N" then
        if L15_15 == "WW" then
          if L16_16 < 72 then
            if L16_16 >= 72 and L11_11 == "IpsecVPNPolicy" then
              L12_12 = L16_16
            end
          end
        end
    end
    elseif L15_15 == "WW" then
      if L16_16 < 88 then
        if L16_16 >= 88 and L11_11 == "IpsecVPNPolicy" then
          L12_12 = L16_16
        end
      end
    end
    if L16_16 ~= "DSR-1000" then
    else
      if L16_16 == "DSR-500N" then
        if L15_15 == "WW" or L15_15 == "RU" then
          if L16_16 < 85 then
            if L16_16 >= 85 and L11_11 == "IpsecVPNPolicy" then
              for _FORV_19_, _FORV_20_ in L16_16(L17_17) do
                if L12_12[_FORV_19_] ~= nil and L12_12[_FORV_19_].TunnelOrTransport == "0" then
                  L12_12[_FORV_19_].L2tpIpsecPolicy = "1"
                end
              end
            end
          end
        end
    end
    else
      if L16_16 ~= "DSR-250" then
      else
        if L16_16 == "DSR-250N" then
          if L15_15 == "WW" or L15_15 == "RU" then
            if L16_16 < 66 then
              if L16_16 >= 66 and L11_11 == "IpsecVPNPolicy" then
                for _FORV_19_, _FORV_20_ in L16_16(L17_17) do
                  if L12_12[_FORV_19_] ~= nil and L12_12[_FORV_19_].TunnelOrTransport == "0" then
                    L12_12[_FORV_19_].L2tpIpsecPolicy = "1"
                  end
                end
              end
            end
          end
      end
      elseif L15_15 == "WW" or L15_15 == "RU" then
        if L16_16 < 63 then
          if L16_16 >= 63 and L11_11 == "IpsecVPNPolicy" then
            for _FORV_19_, _FORV_20_ in L16_16(L17_17) do
              if L12_12[_FORV_19_] ~= nil and L12_12[_FORV_19_].TunnelOrTransport == "0" then
                L12_12[_FORV_19_].L2tpIpsecPolicy = "1"
              end
            end
          end
        end
      end
    end
    if L16_16 ~= "DSR-1000" then
    else
      if L16_16 == "DSR-500N" then
        if L11_11 == "AttackChecks" then
          if L16_16 ~= "DSR-250N" then
          else
            if L16_16 == "DSR-250" then
          end
          else
            if not (L16_16 <= 49) then
              if L16_16 ~= "DSR-1000N" then
              elseif L16_16 == "DSR-500" then
              end
          end
          elseif L16_16 <= 62 then
            L12_12 = L16_16
          end
        end
    end
    elseif L11_11 == "AttackChecks" then
      if L16_16 ~= "DSR-250N" then
      else
        if L16_16 == "DSR-250" then
      end
      else
        if not (L16_16 <= 51) then
          if L16_16 ~= "DSR-1000N" then
          elseif L16_16 == "DSR-500" then
          end
      end
      elseif L16_16 <= 55 then
        L12_12 = L16_16
      end
    end
    if L16_16 ~= "DSR-150" then
    else
      if L16_16 == "DSR-150N" then
        if L11_11 == "BandWidthProfile" then
          if L16_16 <= 54 then
            L12_12 = L16_16
          end
        end
    end
    elseif L11_11 == "BandWidthProfile" then
      if L16_16 <= 57 then
        L12_12 = L16_16
      end
    end
    if L16_16 ~= "DSR-1000" then
    else
      if L16_16 == "DSR-500N" then
        if L11_11 == "TrafficSelector" then
          if L16_16 <= 70 then
            L12_12 = L16_16
          end
        end
    end
    else
      if L16_16 ~= "DSR-250" then
      else
        if L16_16 == "DSR-250N" then
          if L11_11 == "TrafficSelector" then
            if L16_16 <= 57 then
              L12_12 = L16_16
            end
          end
      end
      elseif L11_11 == "TrafficSelector" then
        if L16_16 <= 54 then
          L12_12 = L16_16
        end
      end
    end
    if L16_16 ~= "DSR-1000" then
    else
      if L16_16 == "DSR-500N" then
        if L11_11 == "NatTable" then
          if L16_16 <= 63 then
            L12_12 = L16_16
          end
        end
        if L11_11 == "GlobalSettings" then
          if L16_16 <= 67 then
            L12_12 = L16_16
          end
        end
    end
    else
      if L11_11 == "NatTable" then
        if L16_16 < 88 then
          L12_12 = L16_16
        end
      end
      if L11_11 == "GlobalSettings" then
        if L16_16 <= 52 then
          L12_12 = L16_16
        end
      end
    end
    if L11_11 == "DhcpfixedIpAddress" or L11_11 == "IPMACBinding" then
      if L16_16 <= 59 then
        L12_12 = L16_16
      end
    end
    if L11_11 == "interVLAN" then
      if L16_16 <= 95 then
        L12_12 = L16_16
      end
    end
    if L13_13 == nil and L11_11 == "Pppoe6" then
      if L12_12 ~= nil then
        L12_12 = L16_16
      end
    elseif not L13_13 and L11_11 == "Pppoe6" and L12_12 ~= nil then
      L12_12 = L16_16
    end
    if L13_13 == nil and L11_11 == "SharePortVlan" then
      if L12_12 ~= nil then
        table_vlan = L16_16
        L12_12 = L16_16
      end
    elseif not L13_13 and L11_11 == "SharePortVlan" and L12_12 ~= nil then
      table_vlan = L16_16
      L12_12 = L16_16
    end
    if L13_13 == nil and L11_11 == "interVLAN" then
      if L12_12 ~= nil then
        table_interVlanRouting = L16_16
        L12_12 = L16_16
      end
    elseif not L13_13 and L11_11 == "interVLAN" and L12_12 ~= nil then
      table_interVlanRouting = L16_16
      L12_12 = L16_16
    end
    if L13_13 == nil and L11_11 == "fwDefaultOutBoundPolicy" then
      if L12_12 ~= L16_16 then
        fwIpv4Tbl = L16_16
        L12_12 = L16_16
      end
    elseif not L13_13 and L11_11 == "fwDefaultOutBoundPolicy" then
      if L12_12 ~= L16_16 then
        fwIpv4Tbl = L16_16
        L12_12 = L16_16
      end
    end
    if L13_13 == L16_16 then
      if L11_11 == L16_16 then
        if L12_12 ~= L16_16 then
          L12_12 = L16_16
        end
      end
    elseif not L13_13 then
      if L11_11 == L16_16 then
        if L12_12 ~= L16_16 then
          L12_12 = L16_16
        end
      end
    end
    if L13_13 == L16_16 then
      if L11_11 == L16_16 then
        if L12_12 ~= L16_16 then
          L12_12 = L16_16
        end
      end
    elseif not L13_13 then
      if L11_11 == L16_16 then
        if L12_12 ~= L16_16 then
          L12_12 = L16_16
        end
      end
    end
    if L11_11 == L16_16 then
      if L12_12 ~= L16_16 then
        L12_12 = L16_16
      end
    end
    if L11_11 == L16_16 then
      if L12_12 ~= L16_16 then
        L12_12 = L16_16
      end
    end
    if L11_11 == L16_16 then
      L12_12 = L16_16
    end
    if L11_11 == L16_16 then
      L12_12 = L16_16
    end
    if L16_16 ~= "DSR-1000" then
    else
      if L16_16 == "DSR-500N" then
        if L11_11 == L16_16 then
          if L16_16 < L17_17 then
            L12_12 = L16_16
          end
        end
    end
    elseif L11_11 == L16_16 then
      if L16_16 < L17_17 then
        L12_12 = L16_16
      end
    end
    if L11_11 == L16_16 then
      L12_12 = L16_16
    end
    if L11_11 == "NimfConf" then
      L12_12 = L16_16
      L12_12 = L16_16
    end
    if L11_11 == L16_16 then
      if L13_13 ~= L16_16 then
        L12_12 = L16_16
      end
    end
    if L11_11 == L16_16 then
      L12_12 = L16_16
    end
    if L11_11 == L16_16 then
      L12_12 = L16_16
    end
    if L11_11 == L16_16 then
      L12_12 = L16_16
    end
    if L11_11 == "ifStatic" then
      if L16_16 < L17_17 then
        vlanTable = L16_16
        ifstaticTbl = L16_16
        L12_12 = L16_16
      end
    end
    if L11_11 == "PppoeProfile" then
      L12_12 = L16_16
    end
    if L11_11 == L16_16 then
      L12_12 = L17_17
    end
    if L16_16 ~= L17_17 then
    elseif L16_16 == "DSR-1000" then
      if L11_11 == L16_16 then
        if L16_16 < L17_17 then
          L12_12 = L16_16
        end
      end
    end
    if L11_11 == L16_16 then
      L12_12 = L17_17
    end
    if L11_11 == L16_16 then
      if L16_16 ~= "DSR-150N" then
        if L16_16 ~= "DSR-250N" then
          if L16_16 ~= "DSR-500N" then
            if L16_16 ~= "DSR-1000N" then
              if L16_16 ~= L17_17 then
              end
            end
          end
        end
      elseif L16_16 == L17_17 then
        L12_12 = tableMergeDot11Vap(L16_16, L17_17)
      end
    end
    if L16_16 ~= "DSR-1000" then
    else
      if L16_16 == "DSR-500N" then
        if L11_11 == L16_16 then
          if L16_16 ~= "DSR-250N" then
          else
            if L16_16 == "DSR-250" then
              if L16_16 <= L17_17 then
              end
          end
          else
            if not (L16_16 >= L17_17) then
              if L16_16 ~= "DSR-1000" then
              elseif L16_16 == "DSR-500" then
                if L16_16 <= L17_17 then
                end
              end
          end
          elseif L16_16 >= L17_17 then
            table_groups = L16_16
            table_domain = L16_16
            table_users = L16_16
            radius_tbl = L16_16
            table_domain, table_gacl = L16_16(L17_17, table_users, table_groups, table_domain)
            table_groups = L17_17
            L12_12 = L16_16
            ldap_tbl, ntdomain_tbl, ad_tbl = L16_16(L17_17, table_groups, radius_tbl)
            radius_tbl = L17_17
            domain_tbl = L16_16
          end
        end
        if L16_16 >= L17_17 then
          if L16_16 <= L17_17 then
            radius_tbl = L16_16
            domain_tbl = L16_16
            groups_tbl = L16_16
            ldap_tbl, ntdomain_tbl, ad_tbl = L16_16(L17_17, groups_tbl, radius_tbl)
            radius_tbl = L17_17
            domain_tbl = L16_16
          end
        end
    end
    elseif L11_11 == L16_16 then
      if L16_16 ~= "DSR-250N" then
      else
        if L16_16 == "DSR-250" then
          if L16_16 <= L17_17 then
          end
      end
      else
        if not (L16_16 >= L17_17) then
          if L16_16 ~= "DSR-1000" then
          elseif L16_16 == "DSR-1000N" then
            if L16_16 <= L17_17 then
            end
          end
      end
      elseif L16_16 >= L17_17 then
        table_groups = L16_16
        table_domain = L16_16
        table_users = L16_16
        table_domain, table_gacl = L16_16(L17_17, table_users, table_groups, table_domain)
        table_groups = L17_17
        L12_12 = L16_16
      end
    end
    if L11_11 ~= L16_16 then
    elseif L11_11 == L16_16 then
      L12_12 = L16_16
    end
    if L11_11 == L16_16 then
      L12_12 = L16_16
    end
    if L11_11 == L16_16 then
      L12_12 = L16_16
    end
    if L11_11 == L16_16 then
      L12_12 = L16_16
    end
    if L11_11 == L16_16 then
      L12_12 = L16_16
    end
    if L11_11 ~= L16_16 then
      if L11_11 ~= L16_16 then
        for _FORV_19_, _FORV_20_ in L16_16(L17_17) do
          for _FORV_24_, _FORV_25_ in pairs(L12_12[1]) do
            if not L12_12[_FORV_19_][_FORV_24_] and L11_11 ~= "IpsecVPNPolicy" and _FORV_24_ == "TypeofPolicy" then
              L12_12[_FORV_19_][_FORV_24_] = L12_12[1][_FORV_24_]
            end
          end
          if L11_11 ~= "route" and arg[3] ~= "\"29\"" and L11_11 ~= "Zones" and L11_11 ~= "NimfMtu" and L11_11 ~= "NimfMac" and L11_11 ~= "NimfConf" and L11_11 ~= "WanFailure" and L11_11 ~= "DefaultIfGrpInfo" and L11_11 ~= "UserGroups" and L11_11 ~= "dhcpv6c" and L11_11 ~= "tcpdump" and L11_11 ~= "accessMgmt" and L11_11 ~= "Services" and L11_11 ~= "radiusClient" and L11_11 ~= "ddns" and L11_11 ~= "ddnsStatus" and L11_11 ~= "BwMonStat" and L13_13 and not L13_13[_FORV_19_] and L11_11 ~= "PppoeProfile" and L11_11 ~= "LoginProfiles" and L11_11 ~= "ospf" and L11_11 ~= "OpenvpnCertificates" and L11_11 ~= "logEventEmailConfig" and L11_11 ~= "logConfig" and L11_11 ~= "userDashboardCustomization" and L11_11 ~= "sysLogInfo" and L11_11 ~= "Dhcpc" then
            L12_12[_FORV_19_] = nil
          end
        end
      end
    end
    if L16_16 >= L17_17 then
      L2_2[L11_11] = L12_12
      if L11_11 == L16_16 then
        if L16_16 ~= "DSR-250N" then
        else
          if L16_16 == "DSR-250" then
            if L16_16 <= L17_17 then
            end
        end
        else
          if not (L16_16 >= L17_17) then
            if L16_16 ~= "DSR-1000" then
            elseif L16_16 == "DSR-500" then
              if L16_16 <= L17_17 then
              end
            end
        end
        elseif L16_16 >= L17_17 then
          L2_2.UserGroups = L16_16
          L2_2.USERDBDomains = L16_16
          L2_2.GroupAccessControl = L16_16
        end
      end
      if L16_16 ~= "DSR-1000" then
      else
        if L16_16 == "DSR-500N" then
          if L11_11 == L16_16 then
            if L16_16 <= L17_17 then
              L2_2.USERDBDomains = L16_16
              L2_2[L16_16] = L17_17
              L2_2[L16_16] = L17_17
              L2_2[L16_16] = L17_17
              L2_2[L16_16] = L17_17
            end
          end
          if L11_11 == L16_16 then
            if L16_16 ~= "DSR-1000N" then
            elseif L16_16 == "DSR-500" then
              if L16_16 < L17_17 then
                if L16_16 >= L17_17 then
                  L2_2[L16_16] = L17_17
                  L2_2[L16_16] = L17_17
                  L2_2[L16_16] = L17_17
                  L2_2[L16_16] = L17_17
                  L2_2.USERDBDomains = L16_16
                  L2_2.UserGroups = L16_16
                end
              end
            end
          end
      end
      elseif L11_11 == "USERDBDomains" then
        if L16_16 ~= "DSR-250N" then
        elseif L16_16 == "DSR-250" then
          if L16_16 < L17_17 then
            if L16_16 >= L17_17 then
              L12_12 = L16_16
              L2_2.USERDBDomains = L12_12
            end
          end
        end
      end
    end
    if L11_11 == "CaptivePortalVlan" then
      if L16_16 ~= "DSR-1000N" then
      elseif L16_16 == "DSR-500" then
        if L16_16 < L17_17 then
          if L16_16 >= L17_17 then
            table_cp = L16_16
            table_cppagedetails = L16_16
            table_cpvlan = L16_16
            i = L16_16
            profileId = L16_16
            while true do
              if L16_16 then
                if L16_16 == "1" then
                  profileId = L16_16
                end
                i = L16_16
              end
            end
            new_intervlanTable = L16_16
            new_intervlanTable = L17_17
            L12_12 = L16_16
            L2_2.interVLANRouting = L16_16
            L2_2.CaptivePortalVlan = L12_12
          end
        end
      end
    end
    if L11_11 == L16_16 then
      ntpTable = L16_16
      L12_12 = L16_16
    end
    if L11_11 == "UserGroups" then
      if L16_16 ~= "DSR-1000N" then
      elseif L16_16 == "DSR-500" then
        if L16_16 < L17_17 then
          if L16_16 >= L17_17 then
            L12_12 = L16_16
            L2_2.UserGroups = L12_12
          end
        end
      end
    end
    if L11_11 == L16_16 then
      if L16_16 ~= "DSR-1000N" then
      elseif L16_16 == "DSR-500" then
        if L16_16 < L17_17 then
          if L16_16 >= L17_17 then
            table_cron = L16_16
            L12_12 = L16_16
            L2_2[L16_16] = L12_12
          end
        end
      end
    end
    if L11_11 == L16_16 then
      if L16_16 < L17_17 then
        table1_cron = L16_16
        L12_12 = L16_16
        L2_2[L16_16] = L12_12
      end
    end
    old_captivePortalPageDetails = L16_16
    old_SSLVPNPortalLayout = L16_16
    if L16_16 then
      old_LoginProfiles = L16_16
    else
      old_LoginProfiles = L12_12
    end
    old_ImageDetails = L16_16
    if L16_16 then
      old_LoginImageDetails = L16_16
    else
      old_LoginImageDetails = L12_12
    end
    if L11_11 == "IpsecIKEPolicy" then
      if L16_16 < L17_17 then
        L12_12 = L16_16
      end
    end
    if L11_11 == "IpsecVPNPolicy" then
      if L16_16 < L17_17 then
        L12_12 = L16_16
      end
    end
    if L11_11 == "IpsecIKEPolicy" then
      if L16_16 < L17_17 then
        L12_12 = L16_16
      end
    end
    if L11_11 == "LoginProfiles" then
      if L16_16 <= L17_17 then
        new_LoginProfiles = L16_16(L17_17, old_SSLVPNPortalLayout, old_LoginProfiles, old_ImageDetails, old_LoginImageDetails)
        new_cpPageDetails = L17_17
        new_cpImageDetails = L16_16
        L2_2.CaptivePortalPageDetails = L16_16
        L2_2.LoginImageDetails = L16_16
        L2_2.ImageDetails = L16_16
        L2_2.LoginProfiles = L16_16
        L2_2.SSLVPNPortalLayout = L16_16
      end
    end
    if L11_11 == L16_16 then
      if L16_16 < L17_17 then
        table1_openvpn = L16_16
        L12_12 = L16_16
        L2_2[L16_16] = L12_12
      end
    end
    if L11_11 == L16_16 then
      L12_12 = L16_16
    end
    if L13_13 == L16_16 then
      if L11_11 == L16_16 then
        if L12_12 ~= L16_16 then
          L12_12 = L16_16
        end
      end
    elseif not L13_13 then
      if L11_11 == L16_16 then
        if L12_12 ~= L16_16 then
          L12_12 = L16_16
        end
      end
    end
    if L13_13 == L16_16 then
      if L11_11 == L16_16 then
        if L12_12 ~= L16_16 then
          L12_12 = L16_16
        end
      end
    elseif not L13_13 then
      if L11_11 == L16_16 then
        if L12_12 ~= L16_16 then
          L12_12 = L16_16
        end
      end
    end
  end
end
for L10_10, L11_11 in L7_7(L8_8) do
  L12_12 = L11_11.tableName
  L13_13 = db
  L14_14 = "saveTable"
  L13_13 = L13_13[L14_14]
  L14_14 = L6_6
  L13_13(L14_14, L15_15, L16_16, L17_17, 1, 1)
end
L7_7()
