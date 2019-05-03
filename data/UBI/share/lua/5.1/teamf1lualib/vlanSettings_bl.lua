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
L0_0("teamf1lualib/vlan_vlan")
L0_0 = require
L0_0("teamf1lualib/ipv6_mode")
L0_0 = require
L0_0("teamf1lualib/vlan_captivePortal")
L0_0 = require
L0_0("teamf1lualib/dhcp_serverVLAN")
L0_0 = require
L0_0("teamf1lualib/ipv6_dhcpv6ServerVlan")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/dhcp_serverDMZ")
L0_0 = require
L0_0("teamf1lualib/dhcp_serverLAN")
L0_0 = require
L0_0("teamf1lualib/captiveportal_loginProfile")
L0_0 = require
L0_0("validationsLuaLib")
L0_0 = require
L0_0("teamf1lualib/vlan_returnCodes")
L0_0 = require
L0_0("teamf1lualib/captiveportal_loginProfileSla")
L0_0 = "sessionLimitProfiles"
lanSettingsPageName = "lanSettings"
RELAY_STATUS = "lanSettings.DhcpRelayStatus"
SERVER_STATUS = "lanSettings.dhcpEnabled"
ENABLE = "1"
DISABLE = "0"
SERVER_ATTRIBUTE = lanSettingsPageName .. ".dhcpType"
;({}).interfaceName = "LogicalIfName"
;({}).vlanId = "vlanId"
vlanTable = "vlan"
intervlanTable = "interVLANRouting"
subnetTable = "ifStatic"
dhcpTable = "dhcp"
dhcpRelayTable = "DhcpRelay"
networkInterfaceTable = "networkInterface"
captiveportalTable = "CaptivePortalVlan"
dhcpv6sTable = "dhcpv6s"
dhcpWorkType = {}
dhcpWorkType.none = "None"
dhcpWorkType.server = "Server"
dhcpWorkType.relay = "Relay"
vlanTypeList = {
  "None",
  "Server",
  "Relay"
}
captivePortalTypeList = {
  "Free",
  "SLA",
  "Permanent",
  "Temporary",
  "Billing"
}
authTypeList = {
  "local",
  "radius",
  "ldap",
  "pop3",
  "activeDirectory",
  "ntDomain"
}
authSubTypeList = {
  "pap",
  "chap",
  "ms-chap",
  "ms-chapv2"
}
interVLanAccessTypeFREE = "0"
interVLanAccessTypeSLA = "1"
interVLanAccessTypePermanent = "2"
interVLanAccessTypeTemporary = "3"
interVLanAccessTypeBilling = "4"
ROWID = "_ROWID_"
DUAL_STACK_MODE = 3
function vlanSettingsCaptivePortalProfileGetAll()
  local L0_1, L1_2
  L0_1 = _UPVALUE0_
  L0_1 = L0_1.loginProfilesGetAll
  L1_2 = L0_1()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2
end
function vlanSettingsCaptivePortalSlaProfileGetAll()
  local L0_3, L1_4
  L0_3 = _UPVALUE0_
  L0_3 = L0_3.loginProfilesSlaGetAll
  L1_4 = L0_3()
  if L0_3 ~= _UPVALUE1_.SUCCESS then
    return L0_3
  end
  return L0_3, L1_4
end
function vlanSettingsCaptivePortalPaymentProfileGetAll()
  local L0_5, L1_6
  L0_5 = _UPVALUE0_
  L0_5 = L0_5.loginPaymentProfilesGetAll
  L1_6 = L0_5()
  if L0_5 ~= _UPVALUE1_.SUCCESS then
    return L0_5
  end
  return L0_5, L1_6
end
function vlanSettingsGetAll()
  local L0_7, L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L13_20, L14_21, L15_22, L16_23, L17_24, L18_25, L19_26, L20_27, L21_28, L22_29, L23_30, L24_31
  L0_7 = _UPVALUE0_
  L0_7 = L0_7.dhcpServerVLANGetAll
  L1_8 = L0_7()
  L2_9 = _UPVALUE1_
  L2_9 = L2_9.SUCCESS
  if L0_7 ~= L2_9 then
    return L0_7
  end
  L2_9 = {}
  for L6_13, L7_14 in L3_10(L4_11) do
    L2_9[L6_13] = L8_15
    for L11_18, L12_19 in L8_15(L9_16) do
      L13_20[L11_18] = L12_19
    end
  end
  if L3_10 ~= L5_12 then
    return L3_10
  end
  for L9_16, L10_17 in L6_13(L7_14) do
    L5_12[L9_16] = L11_18
    for L14_21, L15_22 in L11_18(L12_19) do
      L16_23[L14_21] = L15_22
    end
  end
  if L6_13 ~= L8_15 then
    return L6_13
  end
  for L12_19, L13_20 in L9_16(L10_17) do
    L8_15[L12_19] = L14_21
    for L17_24, L18_25 in L14_21(L15_22) do
      L23_30 = lanSettingsPageName
      L23_30 = "."
      L24_31 = dhcpRelayTable
      L23_30 = lanSettingsPageName
      L23_30 = "."
      L24_31 = intervlanTable
      L23_30 = lanSettingsPageName
      L23_30 = "."
      L24_31 = subnetTable
      L23_30 = lanSettingsPageName
      L23_30 = "."
      L24_31 = dhcpTable
      L23_30 = lanSettingsPageName
      L23_30 = "."
      L24_31 = vlanTable
      L19_26[L17_24] = L18_25
    end
  end
  for L12_19, L13_20 in L9_16(L10_17) do
    for L20_27, L21_28 in L17_24(L18_25) do
      if L20_27 == L22_29 then
      else
      end
    end
    if L15_22 == L17_24 then
      if L14_21 == L17_24 then
      end
    elseif L15_22 == L17_24 then
    elseif L14_21 == L17_24 then
    end
    L17_24[L18_25] = L16_23
    if L16_23 == L18_25 then
      for L22_29, L23_30 in L19_26(L20_27) do
        L24_31 = L2_9[L18_25]
        if L24_31[lanSettingsPageName .. "." .. _UPVALUE4_.interfaceName] == L17_24 then
          for _FORV_28_, _FORV_29_ in pairs(L23_30) do
            L8_15[L12_19][_FORV_28_] = _FORV_29_
          end
        end
      end
    end
    for L23_30, L24_31 in L20_27(L21_28) do
      if L5_12[L18_25][lanSettingsPageName .. "." .. _UPVALUE4_.vlanId] == L19_26 then
        for _FORV_29_, _FORV_30_ in pairs(L24_31) do
          L8_15[L12_19][_FORV_29_] = _FORV_30_
        end
      end
    end
  end
  return L9_16, L10_17
end
function vlanSettingsGet(A0_32)
  local L1_33, L2_34, L3_35, L4_36, L5_37, L6_38, L7_39, L8_40, L9_41, L10_42, L11_43, L12_44, L13_45, L14_46, L15_47, L16_48, L17_49, L18_50, L19_51, L20_52, L21_53, L22_54, L23_55, L24_56, L25_57, L26_58, L27_59, L28_60, L29_61, L30_62, L31_63, L32_64, L33_65, L34_66, L35_67, L36_68, L37_69, L38_70, L39_71, L40_72, L41_73, L42_74, L43_75, L44_76, L45_77
  L38_70 = _UPVALUE0_
  L38_70 = L38_70.vlanGet
  L39_71 = A0_32
  L8_40, L9_41, L38_70 = nil, nil, L38_70(L39_71)
  L8_40, L9_41, L39_71 = nil, nil, L38_70(L39_71)
  L8_40, L9_41, L40_72 = nil, nil, L38_70(L39_71)
  L8_40, L9_41, L41_73 = nil, nil, L38_70(L39_71)
  L8_40, L9_41, L42_74 = nil, nil, L38_70(L39_71)
  L7_39 = L45_77
  L6_38 = L44_76
  L5_37 = L43_75
  L4_36 = L42_74
  L3_35 = L41_73
  L2_34 = L40_72
  A0_32 = L39_71
  L1_33 = L38_70
  L38_70 = _UPVALUE1_
  L38_70 = L38_70.SUCCESS
  if L1_33 ~= L38_70 then
    return L1_33
  end
  L38_70 = _UPVALUE2_
  L38_70 = L38_70.captiveType
  L39_71 = L2_34
  L39_71 = L38_70(L39_71)
  A0_32 = L39_71
  L1_33 = L38_70
  L38_70 = _UPVALUE1_
  L38_70 = L38_70.SUCCESS
  if L1_33 ~= L38_70 then
  else
    L38_70 = nil
    L39_71 = _UPVALUE2_
    L39_71 = L39_71.captivePortalGet
    L40_72 = A0_32
    L21_53, L42_74 = L38_70(L39_71)
    L20_52 = L45_77
    L19_51 = L44_76
    L18_50 = L43_75
    L17_49 = L42_74
    L38_70 = L41_73
    L36_68 = L40_72
    L34_66 = L39_71
    L39_71 = _UPVALUE1_
    L39_71 = L39_71.SUCCESS
    if L34_66 ~= L39_71 then
      return L34_66
    end
  end
  L38_70 = nil
  if L2_34 == "1" then
    L38_70 = "LAN"
  else
    L39_71 = "LAN"
    L40_72 = L2_34
    L38_70 = L39_71 .. L40_72
  end
  L39_71 = _UPVALUE3_
  L39_71 = L39_71.typeFind
  L40_72 = L38_70
  L40_72 = L39_71(L40_72)
  A0_32 = L40_72
  L1_33 = L39_71
  L39_71 = _UPVALUE1_
  L39_71 = L39_71.SUCCESS
  if L1_33 ~= L39_71 then
    return L1_33
  end
  L39_71 = _UPVALUE3_
  L39_71 = L39_71.dhcpServerVLANGet
  L40_72 = A0_32
  L12_44, L13_45, L14_46, L15_47, L16_48, L42_74 = L39_71(L40_72)
  L11_43 = L45_77
  L10_42 = L44_76
  L2_34 = L43_75
  L6_38 = L42_74
  L5_37 = L41_73
  L37_69 = L40_72
  L35_67 = L39_71
  L39_71 = _UPVALUE1_
  L39_71 = L39_71.SUCCESS
  if L35_67 ~= L39_71 then
    return L35_67
  end
  L39_71 = ipv6ModeGet
  L40_72 = L39_71()
  L41_73 = tonumber
  L42_74 = L40_72
  L41_73 = L41_73(L42_74)
  L42_74 = DUAL_STACK_MODE
  if L41_73 == L42_74 then
    L41_73 = _UPVALUE4_
    L41_73 = L41_73.ipv6VlanSectionGet
    L42_74 = L2_34
    L25_57, L26_58, L27_59, L28_60, L29_61, L30_62, L31_63, L32_64, L33_65, L42_74 = L39_71(L40_72)
    L24_56 = L45_77
    L23_55 = L44_76
    L22_54 = L43_75
    L37_69 = L42_74
    L1_33 = L41_73
    L41_73 = _UPVALUE1_
    L41_73 = L41_73.SUCCESS
    if L1_33 ~= L41_73 then
      return L1_33
    end
  end
  L41_73 = nil
  if L17_49 == "Permanent" then
    L41_73 = "1"
  else
    L41_73 = "0"
  end
  L42_74 = nil
  for _FORV_46_, _FORV_47_ in L43_75(L44_76) do
    if _FORV_47_ == L18_50 then
      L42_74 = _FORV_46_
    end
  end
  for _FORV_47_, _FORV_48_ in L44_76(L45_77) do
  end
  for _FORV_48_, _FORV_49_ in L45_77(vlanTypeList) do
  end
  L45_77.vlanId = L2_34
  L45_77.vlanName = L3_35
  L45_77.interVlanRouting = L4_36
  L45_77.ipAddress = L5_37
  L45_77.subnetMask = L6_38
  L45_77.dhcpType = tostring(L44_76)
  L45_77.dnsProxy = L8_40
  L45_77.dhcpRelayIpAddress = L9_41
  L45_77.startIpAddress = L10_42
  L45_77.endIpAddress = L11_43
  L45_77.gateway = L12_44
  L45_77.primaryDnsServer = L13_45
  L45_77.secondaryDnsServer = L14_46
  L45_77.domainName = L15_47
  L45_77.leaseTime = L16_48
  L45_77.captivePortalType = tostring(L41_73)
  L45_77.authenticationType = tostring(L42_74)
  L45_77.authenticationSubType = tostring(L43_75)
  L45_77.loginProfile = L20_52
  L45_77.vlanIPv6 = L22_54
  L45_77.prefix = L23_55
  L45_77.prefixLength = L24_56
  L45_77.dhcpv6Server = L25_57
  L45_77.dhcpv6ServerMode = L26_58
  L45_77.dhcpv6DomainName = L27_59
  L45_77.dhcpv6ServerPreference = L28_60
  L45_77.dhcpv6ServerDnsType = L29_61
  L45_77.ipV6primaryDnsServer = L30_62
  L45_77.ipV6secondaryDnsServer = L31_63
  L45_77.ipv6LeaseTime = L32_64
  L45_77.prefixDelegation = L33_65
  if L21_53 == _UPVALUE1_.NIL then
    L45_77.redirectType = "0"
  else
    L45_77.redirectType = tostring(L21_53)
  end
  return L1_33, A0_32, L45_77
end
function ipv6ModeGet()
  local L0_78, L1_79, L2_80
  L0_78 = _UPVALUE0_
  L0_78 = L0_78.ipv6ModeGet
  L2_80 = L0_78()
  return _UPVALUE1_.SUCCESS, L2_80
end
function vlanSettingsGetNext(A0_81)
  local L1_82, L2_83, L3_84, L4_85, L5_86, L6_87
  L1_82 = A0_81["vlan.cookie"]
  if L1_82 == nil then
    L2_83 = util
    L2_83 = L2_83.appendDebugOut
    L3_84 = "GetNext : Invalid Cookie"
    L2_83(L3_84)
    L2_83 = _UPVALUE0_
    L2_83 = L2_83.BAD_PARAMETER
    return L2_83
  end
  L2_83 = _UPVALUE1_
  L2_83 = L2_83.vlanGetNext
  L3_84 = L1_82
  ipAddress, subnetMask, dhcpType, dnsProxy, dhcpRelayIpAddress, L2_83 = nil, nil, nil, nil, nil, L2_83(L3_84)
  ipAddress, subnetMask, dhcpType, dnsProxy, dhcpRelayIpAddress, L3_84 = nil, nil, nil, nil, nil, L2_83(L3_84)
  ipAddress, subnetMask, dhcpType, dnsProxy, dhcpRelayIpAddress, L4_85 = nil, nil, nil, nil, nil, L2_83(L3_84)
  ipAddress, subnetMask, dhcpType, dnsProxy, dhcpRelayIpAddress, L5_86 = nil, nil, nil, nil, nil, L2_83(L3_84)
  ipAddress, subnetMask, dhcpType, dnsProxy, dhcpRelayIpAddress, L6_87 = nil, nil, nil, nil, nil, L2_83(L3_84)
  interVlanRouting = L6_87
  name = L5_86
  vlanId = L4_85
  cookie = L3_84
  returnCode = L2_83
  L2_83 = returnCode
  L3_84 = _UPVALUE0_
  L3_84 = L3_84.SUCCESS
  if L2_83 ~= L3_84 then
    L2_83 = returnCode
    return L2_83
  end
  L2_83 = _UPVALUE2_
  L2_83 = L2_83.captiveType
  L3_84 = vlanId
  L3_84 = L2_83(L3_84)
  L4_85 = _UPVALUE2_
  L4_85 = L4_85.captivePortalGetNext
  L5_86 = L3_84
  captivePortalType, authenticationType, authenticationSubType, loginProfile, L6_87 = L2_83(L3_84)
  cookie1 = L6_87
  vlanId = L5_86
  returnCode1 = L4_85
  L4_85 = returnCode1
  L5_86 = _UPVALUE0_
  L5_86 = L5_86.SUCCESS
  if L4_85 ~= L5_86 then
    L4_85 = returnCode1
    return L4_85
  end
  L4_85 = "LAN"
  L5_86 = vlanId
  L4_85 = L4_85 .. L5_86
  L5_86 = _UPVALUE3_
  L5_86 = L5_86.typeFind
  L6_87 = L4_85
  L6_87 = L5_86(L6_87)
  returnCode2, cookie2, ipAddress, subnetMask, vlanId, startIpAddress, endIpAddress, gateway, primaryDnsServer, secondaryDnsServer, domainName, leaseTime = _UPVALUE3_.dhcpServerVLANGet(L6_87)
  if returnCode2 ~= _UPVALUE0_.SUCCESS then
    return returnCode2
  end
  return returnCode, cookie, vlanId, name, interVlanRouting, ipAddress, subnetMask, dhcpType, dnsProxy, dhcpRelayIpAddress, startIpAddress, endIpAddress, gateway, primaryDnsServer, secondaryDnsServer, domainName, leaseTime, captivePortalType, authenticationType, authenticationSubType, loginProfile
end
function vlanSettingsSet(A0_88)
  local L1_89, L2_90, L3_91, L4_92, L5_93, L6_94, L7_95, L8_96, L9_97, L10_98, L11_99, L12_100, L13_101, L14_102, L15_103, L16_104, L17_105, L18_106, L19_107, L20_108, L21_109, L22_110, L23_111, L24_112, L25_113, L26_114, L27_115, L28_116, L29_117, L30_118, L31_119, L32_120, L33_121, L34_122, L35_123, L36_124, L37_125, L38_126, L39_127, L40_128, L41_129, L42_130, L43_131, L44_132, L45_133, L46_134, L47_135, L48_136, L49_137, L50_138, L51_139, L52_140
  L1_89 = ACCESS_LEVEL
  if L1_89 ~= 0 then
    L1_89 = util
    L1_89 = L1_89.appendDebugOut
    L2_90 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_89(L2_90)
    L1_89 = _UPVALUE0_
    L1_89 = L1_89.UNAUTHORIZED
    return L1_89
  end
  L1_89 = _UPVALUE1_
  L1_89 = L1_89.vlanStateGet
  L2_90 = L1_89()
  if L2_90 == "0" then
    L3_91 = _UPVALUE2_
    L3_91 = L3_91.COMP_VLAN_NOT_ABLE_TO_CONFIGURE_VLANSETTINGS
    return L3_91
  end
  L3_91 = A0_88["vlanSettings.cookie"]
  L4_92 = A0_88["vlanSettings.vlanId"]
  L5_93 = A0_88["vlanSettings.name"]
  L6_94 = A0_88["vlanSettings.interVlanRouting"]
  L7_95 = A0_88["vlanSettings.ipAddress"]
  L8_96 = A0_88["vlanSettings.subnetMask"]
  L9_97 = vlanTypeList
  L10_98 = tonumber
  L11_99 = A0_88["vlanSettings.dhcpType"]
  L10_98 = L10_98(L11_99)
  L9_97 = L9_97[L10_98]
  L10_98 = A0_88["vlanSettings.dnsProxy"]
  L11_99 = A0_88["vlanSettings.dhcpRelayIpAddress"]
  L12_100 = A0_88["vlanSettings.startIpAddress"]
  L13_101 = A0_88["vlanSettings.endIpAddress"]
  L14_102 = A0_88["vlanSettings.gateway"]
  L15_103 = A0_88["vlanSettings.primaryDnsServer"]
  L16_104 = A0_88["vlanSettings.secondaryDnsServer"]
  L17_105 = A0_88["vlanSettings.domainName"]
  L18_106 = A0_88["vlanSettings.leaseTime"]
  L19_107 = A0_88["vlanSettings.captivePortalType"]
  L20_108 = authTypeList
  L21_109 = tonumber
  L22_110 = A0_88["vlanSettings.authenticationType"]
  L21_109 = L21_109(L22_110)
  L20_108 = L20_108[L21_109]
  L21_109 = authSubTypeList
  L22_110 = tonumber
  L23_111 = A0_88["vlanSettings.authenticationSubType"]
  L22_110 = L22_110(L23_111)
  L21_109 = L21_109[L22_110]
  L22_110 = A0_88["vlanSettings.loginProfile"]
  L23_111 = A0_88["vlanSettings.redirectType"]
  L24_112 = A0_88["vlanSettings.vlanIPv6"]
  L25_113 = A0_88["vlanSettings.prefix"]
  L26_114 = A0_88["vlanSettings.prefixLength"]
  L27_115 = A0_88["vlanSettings.dhcpv6Server"]
  L28_116 = A0_88["vlanSettings.dhcpv6ServerMode"]
  L29_117 = A0_88["vlanSettings.dhcpv6DomainName"]
  L30_118 = A0_88["vlanSettings.dhcpv6ServerPreference"]
  L31_119 = A0_88["vlanSettings.dhcpv6ServerDnsType"]
  L32_120 = A0_88["vlanSettings.ipV6primaryDnsServer"]
  L33_121 = A0_88["vlanSettings.ipV6secondaryDnsServer"]
  L34_122 = A0_88["vlanSettings.ipv6LeaseTime"]
  L35_123 = A0_88["vlanSettings.prefixDelegation"]
  if L19_107 == "1" then
    L19_107 = "Permanent"
  else
    L19_107 = "Free"
  end
  if L3_91 == nil then
    L36_124 = util
    L36_124 = L36_124.appendDebugOut
    L37_125 = "Set : Invalid Cookie"
    L36_124(L37_125)
    L36_124 = _UPVALUE0_
    L36_124 = L36_124.BAD_PARAMETER
    return L36_124
  end
  if L7_95 == nil then
    L36_124 = util
    L36_124 = L36_124.appendDebugOut
    L37_125 = "Set : Invalid Cookie"
    L36_124(L37_125)
    L36_124 = _UPVALUE0_
    L36_124 = L36_124.BAD_PARAMETER
    return L36_124
  end
  if L8_96 == nil then
    L36_124 = util
    L36_124 = L36_124.appendDebugOut
    L37_125 = "Set : Invalid Cookie"
    L36_124(L37_125)
    L36_124 = _UPVALUE0_
    L36_124 = L36_124.BAD_PARAMETER
    return L36_124
  end
  L36_124 = db
  L36_124 = L36_124.getAttribute
  L37_125 = "fbwifi"
  L38_126 = "_ROWID_"
  L39_127 = "1"
  L40_128 = "enabled"
  L36_124 = L36_124(L37_125, L38_126, L39_127, L40_128)
  fbwifienable = L36_124
  if L19_107 ~= "Free" then
    L36_124 = fbwifienable
    if L36_124 == "1" then
      L36_124 = "CAPTIVEPORTAL_DEV_FBWIFI_CONFIGURED"
      return L36_124
    end
  end
  L36_124, L37_125 = nil, nil
  L38_126 = _UPVALUE3_
  L38_126 = L38_126.checkWanSubnetRange
  L39_127 = L7_95
  L40_128 = L8_96
  L38_126 = L38_126(L39_127, L40_128)
  L36_124 = L38_126
  L38_126 = _UPVALUE0_
  L38_126 = L38_126.SUCCESS
  if L36_124 == L38_126 then
    L38_126 = util
    L38_126 = L38_126.appendDebugOut
    L39_127 = "Set : Invalid ipaddress"
    L38_126(L39_127)
    L38_126 = PRODUCT_ID
    if L38_126 ~= "DSR-1000AC_Ax" then
      L38_126 = PRODUCT_ID
      if L38_126 ~= "DSR-1000_Bx" then
        L38_126 = PRODUCT_ID
        if L38_126 ~= "DSR-500_Bx" then
          L38_126 = PRODUCT_ID
          if L38_126 ~= "DSR-500AC_Ax" then
            L38_126 = UNIT_NAME
            if L38_126 ~= "DSR-1000N" then
              L38_126 = UNIT_NAME
              if L38_126 ~= "DSR-1000" then
                L38_126 = UNIT_NAME
                if L38_126 ~= "DSR-500N" then
                  L38_126 = UNIT_NAME
                end
              end
            end
          end
        end
      end
    else
      if L38_126 == "DSR-500" then
        L38_126 = _UPVALUE0_
        L38_126 = L38_126.WAN_ALREADY_CONFIGURED
        return L38_126
    end
    else
      L38_126 = _UPVALUE0_
      L38_126 = L38_126.WAN_ECONA_ALREADY_CONFIGURED
      return L38_126
    end
  end
  L38_126 = _UPVALUE3_
  L38_126 = L38_126.checkOpenVpnSubnetRange
  L39_127 = L7_95
  L40_128 = L8_96
  L38_126 = L38_126(L39_127, L40_128)
  L36_124 = L38_126
  L38_126 = _UPVALUE0_
  L38_126 = L38_126.SUCCESS
  if L36_124 == L38_126 then
    L38_126 = util
    L38_126 = L38_126.appendDebugOut
    L39_127 = "Set : Invalid ipaddress"
    L38_126(L39_127)
    L38_126 = _UPVALUE0_
    L38_126 = L38_126.OPENVPN_ALREADY_CONFIGURED
    return L38_126
  end
  L38_126 = _UPVALUE3_
  L38_126 = L38_126.checkDmzSubnetRange
  L39_127 = L7_95
  L40_128 = L8_96
  L38_126 = L38_126(L39_127, L40_128)
  L36_124 = L38_126
  L38_126 = _UPVALUE0_
  L38_126 = L38_126.SUCCESS
  if L36_124 == L38_126 then
    L38_126 = util
    L38_126 = L38_126.appendDebugOut
    L39_127 = "Set : Invalid ipaddress"
    L38_126(L39_127)
    L38_126 = _UPVALUE0_
    L38_126 = L38_126.DMZ_ALREADY_CONFIGURED
    return L38_126
  end
  L38_126 = _UPVALUE3_
  L38_126 = L38_126.checkIpSecSubnetRange
  L39_127 = L7_95
  L40_128 = L8_96
  L38_126 = L38_126(L39_127, L40_128)
  L36_124 = L38_126
  L38_126 = _UPVALUE0_
  L38_126 = L38_126.SUCCESS
  if L36_124 == L38_126 then
    L38_126 = util
    L38_126 = L38_126.appendDebugOut
    L39_127 = "Set : Invalid ipaddress"
    L38_126(L39_127)
    L38_126 = _UPVALUE0_
    L38_126 = L38_126.IPSEC_DHCP_ALREADY_CONFIGURED
    return L38_126
  end
  L38_126 = HIGH_SEC
  if L38_126 == "HIGH" then
    L38_126 = _UPVALUE3_
    L38_126 = L38_126.checkSslClientRange
    L39_127 = L7_95
    L40_128 = L8_96
    L38_126 = L38_126(L39_127, L40_128)
    L36_124 = L38_126
    L38_126 = _UPVALUE0_
    L38_126 = L38_126.SUCCESS
    if L36_124 == L38_126 then
      L38_126 = util
      L38_126 = L38_126.appendDebugOut
      L39_127 = "Set : Invalid ipaddress"
      L38_126(L39_127)
      L38_126 = _UPVALUE0_
      L38_126 = L38_126.SSLVPN_CLIENT_ALREADY_CONFIGURED
      return L38_126
    end
  end
  L38_126 = _UPVALUE3_
  L38_126 = L38_126.checkVlanSubnetRange
  L39_127 = L7_95
  L40_128 = L8_96
  L41_129 = L4_92
  L38_126 = L38_126(L39_127, L40_128, L41_129)
  L36_124 = L38_126
  L38_126 = _UPVALUE0_
  L38_126 = L38_126.SUCCESS
  if L36_124 == L38_126 then
    L38_126 = util
    L38_126 = L38_126.appendDebugOut
    L39_127 = "Set : Invalid ipaddress"
    L38_126(L39_127)
    L38_126 = _UPVALUE0_
    L38_126 = L38_126.LAN_VLAN_ALREADY_CONFIGURED
    return L38_126
  end
  L38_126 = _UPVALUE3_
  L38_126 = L38_126.checkPptpSeverSubnetRange
  L39_127 = L7_95
  L40_128 = L8_96
  L38_126 = L38_126(L39_127, L40_128)
  result = L38_126
  L38_126 = result
  L39_127 = _UPVALUE0_
  L39_127 = L39_127.SUCCESS
  if L38_126 == L39_127 then
    L38_126 = _UPVALUE0_
    L38_126 = L38_126.PPTP_SERVER_ALREADY_CONFIGURED
    return L38_126
  end
  L38_126 = _UPVALUE3_
  L38_126 = L38_126.checkL2tpSeverSubnetRange
  L39_127 = L7_95
  L40_128 = L8_96
  L38_126 = L38_126(L39_127, L40_128)
  result = L38_126
  L38_126 = result
  L39_127 = _UPVALUE0_
  L39_127 = L39_127.SUCCESS
  if L38_126 == L39_127 then
    L38_126 = _UPVALUE0_
    L38_126 = L38_126.L2TP_SERVER_ALREADY_CONFIGURED
    return L38_126
  end
  if L25_113 and L26_114 then
    L38_126 = _UPVALUE3_
    L38_126 = L38_126.ipv6AddressCheck
    L39_127 = L25_113
    L38_126 = L38_126(L39_127)
    L36_124 = L38_126
    L38_126 = _UPVALUE0_
    L38_126 = L38_126.SUCCESS
    if L36_124 ~= L38_126 then
      L38_126 = util
      L38_126 = L38_126.appendDebugOut
      L39_127 = "Set : Invalid ipaddress"
      L38_126(L39_127)
      return L36_124
    end
    L38_126 = _UPVALUE3_
    L38_126 = L38_126.checkVlanIPV6RangeCheck
    L39_127 = L25_113
    L40_128 = L26_114
    L41_129 = L4_92
    L38_126 = L38_126(L39_127, L40_128, L41_129)
    L36_124 = L38_126
    L38_126 = _UPVALUE0_
    L38_126 = L38_126.SUCCESS
    if L36_124 == L38_126 then
      L38_126 = util
      L38_126 = L38_126.appendDebugOut
      L39_127 = "Set : Invalid ipaddress"
      L38_126(L39_127)
      L38_126 = _UPVALUE0_
      L38_126 = L38_126.LAN_VLAN_IPV6_ADDRESS_ALREADY_CONFIGURED
      return L38_126
    end
  end
  L38_126 = "LAN"
  L39_127 = tonumber
  L40_128 = L4_92
  L39_127 = L39_127(L40_128)
  if L39_127 ~= 1 then
    L39_127 = L38_126
    L40_128 = L4_92
    L38_126 = L39_127 .. L40_128
  end
  L39_127 = db
  L39_127 = L39_127.getRow
  L40_128 = _UPVALUE4_
  L41_129 = _UPVALUE5_
  L42_130 = L38_126
  L39_127 = L39_127(L40_128, L41_129, L42_130)
  if L39_127 then
    L40_128 = _UPVALUE4_
    L41_129 = ".sourceType"
    L40_128 = L40_128 .. L41_129
    L40_128 = L39_127[L40_128]
    if L40_128 == "3" then
      L40_128 = _UPVALUE6_
      L40_128 = L40_128.start
      L40_128()
      L40_128 = db
      L40_128 = L40_128.deleteRow
      L41_129 = _UPVALUE4_
      L42_130 = _UPVALUE5_
      L43_131 = L38_126
      L40_128(L41_129, L42_130, L43_131)
      L40_128 = _UPVALUE6_
      L40_128 = L40_128.complete
      L40_128()
      L40_128 = _UPVALUE6_
      L40_128 = L40_128.save
      L40_128()
      L40_128 = os
      L40_128 = L40_128.execute
      L41_129 = "sleep 5"
      L40_128(L41_129)
    end
  end
  L40_128 = _UPVALUE6_
  L40_128 = L40_128.start
  L40_128()
  if L9_97 ~= "Server" then
    L41_129 = L7_95
    L40_128 = L7_95.match
    L42_130 = "^(%d+)%.(%d+)%.(%d+)%.(%d+)$"
    L43_131 = L40_128(L41_129, L42_130)
    L44_132 = L40_128
    L45_133 = "."
    L46_134 = L41_129
    L47_135 = "."
    L48_136 = L42_130
    L49_137 = ".100"
    L12_100 = L44_132 .. L45_133 .. L46_134 .. L47_135 .. L48_136 .. L49_137
    L44_132 = L40_128
    L45_133 = "."
    L46_134 = L41_129
    L47_135 = "."
    L48_136 = L42_130
    L49_137 = ".254"
    L13_101 = L44_132 .. L45_133 .. L46_134 .. L47_135 .. L48_136 .. L49_137
  end
  L40_128 = nil
  if L4_92 == "1" then
    L40_128 = "LAN"
  else
    L41_129 = "LAN"
    L42_130 = L4_92
    L40_128 = L41_129 .. L42_130
  end
  L41_129 = _UPVALUE3_
  L41_129 = L41_129.isDhcpReservedIPNotExist
  L42_130 = L40_128
  L43_131 = L7_95
  L44_132 = L8_96
  L45_133 = L12_100
  L46_134 = L13_101
  L41_129 = L41_129(L42_130, L43_131, L44_132, L45_133, L46_134)
  L36_124 = L41_129
  L41_129 = _UPVALUE0_
  L41_129 = L41_129.SUCCESS
  if L36_124 ~= L41_129 then
    L41_129 = util
    L41_129 = L41_129.appendDebugOut
    L42_130 = "Error in configuring values in page vlanSettings PAGE"
    L43_131 = L36_124
    L42_130 = L42_130 .. L43_131
    L41_129(L42_130)
    L41_129 = _UPVALUE6_
    L41_129 = L41_129.abort
    L41_129()
    return L36_124
  end
  L41_129 = _UPVALUE1_
  L41_129 = L41_129.vlanSet
  L42_130 = L3_91
  L43_131 = L4_92
  L44_132 = L5_93
  L45_133 = L6_94
  L46_134 = L7_95
  L47_135 = L8_96
  L48_136 = L9_97
  L49_137 = L10_98
  L50_138 = L11_99
  L42_130 = L41_129(L42_130, L43_131, L44_132, L45_133, L46_134, L47_135, L48_136, L49_137, L50_138)
  L37_125 = L42_130
  L36_124 = L41_129
  L41_129 = _UPVALUE0_
  L41_129 = L41_129.SUCCESS
  if L36_124 ~= L41_129 then
    L41_129 = util
    L41_129 = L41_129.appendDebugOut
    L42_130 = "Error in configuring values in page DUMMY PAGE"
    L43_131 = L36_124
    L42_130 = L42_130 .. L43_131
    L41_129(L42_130)
    L41_129 = _UPVALUE6_
    L41_129 = L41_129.abort
    L41_129()
    L41_129 = L36_124
    L42_130 = L3_91
    return L41_129, L42_130
  end
  L41_129 = nil
  if L4_92 == "1" then
    L41_129 = "LAN"
  else
    L42_130 = "LAN"
    L43_131 = L4_92
    L41_129 = L42_130 .. L43_131
  end
  L42_130 = _UPVALUE7_
  L42_130 = L42_130.typeFind
  L43_131 = L41_129
  L43_131 = L42_130(L43_131)
  L44_132 = _UPVALUE7_
  L44_132 = L44_132.dhcpServerVLANSet
  L45_133 = L43_131
  L46_134 = L7_95
  L47_135 = L8_96
  L48_136 = L4_92
  L49_137 = L12_100
  L50_138 = L13_101
  L51_139 = L14_102
  L52_140 = L15_103
  L45_133 = L44_132(L45_133, L46_134, L47_135, L48_136, L49_137, L50_138, L51_139, L52_140, L16_104, L17_105, L18_106, L9_97)
  L46_134 = _UPVALUE0_
  L46_134 = L46_134.SUCCESS
  if L44_132 ~= L46_134 then
    L46_134 = util
    L46_134 = L46_134.appendDebugOut
    L47_135 = "Error in configuring values in page DUMMY PAGE"
    L48_136 = L44_132
    L47_135 = L47_135 .. L48_136
    L46_134(L47_135)
    L46_134 = _UPVALUE6_
    L46_134 = L46_134.abort
    L46_134()
    L46_134 = L44_132
    L47_135 = L3_91
    return L46_134, L47_135
  end
  L46_134 = ipv6ModeGet
  L47_135 = L46_134()
  L48_136 = tonumber
  L49_137 = L47_135
  L48_136 = L48_136(L49_137)
  L49_137 = DUAL_STACK_MODE
  if L48_136 == L49_137 then
    L48_136 = _UPVALUE8_
    L48_136 = L48_136.dhcpv6ServerVLANSet
    L49_137 = L4_92
    L50_138 = L24_112
    L51_139 = L27_115
    L52_140 = L25_113
    L49_137 = L48_136(L49_137, L50_138, L51_139, L52_140, L26_114, L28_116, L29_117, L30_118, L31_119, L32_120, L33_121, L34_122, L35_123)
    L45_133 = L49_137
    L44_132 = L48_136
    L48_136 = _UPVALUE0_
    L48_136 = L48_136.SUCCESS
    if L44_132 ~= L48_136 then
      L48_136 = util
      L48_136 = L48_136.appendDebugOut
      L49_137 = "Error in configuring values in page DUMMY PAGE"
      L50_138 = L44_132
      L49_137 = L49_137 .. L50_138
      L48_136(L49_137)
      L48_136 = _UPVALUE6_
      L48_136 = L48_136.abort
      L48_136()
      L48_136 = L44_132
      L49_137 = L3_91
      return L48_136, L49_137
    end
  end
  L48_136 = _UPVALUE9_
  L48_136 = L48_136.captiveType
  L49_137 = L4_92
  L49_137 = L48_136(L49_137)
  L50_138 = NIL
  if L49_137 ~= L50_138 then
    if L19_107 == "Permanent" then
      L50_138 = _UPVALUE9_
      L50_138 = L50_138.captivePortalSet
      L51_139 = L49_137
      L52_140 = L4_92
      L51_139 = L50_138(L51_139, L52_140, L19_107, L20_108, L21_109, L22_110, L23_111)
      L52_140 = _UPVALUE0_
      L52_140 = L52_140.SUCCESS
      if L50_138 ~= L52_140 then
        L52_140 = util
        L52_140 = L52_140.appendDebugOut
        L52_140("Error in configuring values in page DUMMY PAGE" .. L44_132)
        L52_140 = _UPVALUE6_
        L52_140 = L52_140.abort
        L52_140()
        L52_140 = L50_138
        return L52_140, L3_91
      end
    else
      L50_138 = _UPVALUE9_
      L50_138 = L50_138.captivePortalDisable
      L51_139 = L50_138()
      L52_140 = _UPVALUE0_
      L52_140 = L52_140.SUCCESS
      if L50_138 ~= L52_140 then
        L52_140 = util
        L52_140 = L52_140.appendDebugOut
        L52_140("Error in configuring values in page DUMMY PAGE" .. L44_132)
        L52_140 = _UPVALUE6_
        L52_140 = L52_140.abort
        L52_140()
        L52_140 = L50_138
        return L52_140, L3_91
      end
      L52_140 = _UPVALUE9_
      L52_140 = L52_140.captivePortalDelete
      L52_140 = L52_140(L49_137)
      if L52_140 ~= _UPVALUE0_.SUCCESS then
        util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L44_132)
        _UPVALUE6_.abort()
        return L44_132, L3_91
      end
    end
  elseif L19_107 == "Permanent" then
    L50_138 = _UPVALUE9_
    L50_138 = L50_138.captivePortalEnable
    L51_139 = L50_138()
    L52_140 = _UPVALUE0_
    L52_140 = L52_140.SUCCESS
    if L50_138 ~= L52_140 then
      L52_140 = util
      L52_140 = L52_140.appendDebugOut
      L52_140("Error in configuring values in page DUMMY PAGE" .. L44_132)
      L52_140 = _UPVALUE6_
      L52_140 = L52_140.abort
      L52_140()
      L52_140 = L50_138
      return L52_140, L3_91
    end
    L52_140 = _UPVALUE9_
    L52_140 = L52_140.captivePortalCreate
    L52_140 = L52_140(L4_92, L19_107, L20_108, L21_109, L22_110, L23_111)
    if L52_140 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L44_132)
      _UPVALUE6_.abort()
      return L52_140, L3_91
    end
  end
  L50_138 = nil
  if L19_107 == "Free" then
    L51_139 = _UPVALUE1_
    L51_139 = L51_139.vlanIntervlanAccessTypeSet
    L52_140 = L3_91
    L51_139 = L51_139(L52_140, interVLanAccessTypeFREE)
    L50_138 = L51_139
  end
  if L19_107 == "Permanent" then
    L51_139 = _UPVALUE1_
    L51_139 = L51_139.vlanIntervlanAccessTypeSet
    L52_140 = L3_91
    L51_139 = L51_139(L52_140, interVLanAccessTypePermanent)
    L50_138 = L51_139
  end
  L51_139 = _UPVALUE0_
  L51_139 = L51_139.SUCCESS
  if L50_138 ~= L51_139 then
    L51_139 = util
    L51_139 = L51_139.appendDebugOut
    L52_140 = "Error in configuring values in page DUMMY PAGE"
    L52_140 = L52_140 .. L44_132
    L51_139(L52_140)
    L51_139 = _UPVALUE6_
    L51_139 = L51_139.abort
    L51_139()
    L51_139 = returnCode1
    L52_140 = L3_91
    return L51_139, L52_140
  end
  L51_139 = _UPVALUE1_
  L51_139 = L51_139.firewallRulesUpdate
  L52_140 = L4_92
  L51_139 = L51_139(L52_140, L7_95, L8_96)
  L44_132 = L51_139
  L51_139 = _UPVALUE0_
  L51_139 = L51_139.SUCCESS
  if L44_132 ~= L51_139 then
    L51_139 = util
    L51_139 = L51_139.appendDebugOut
    L52_140 = "Error in configuring values in page DUMMY PAGE"
    L52_140 = L52_140 .. L44_132
    L51_139(L52_140)
    L51_139 = _UPVALUE6_
    L51_139 = L51_139.abort
    L51_139()
    L51_139 = L44_132
    L52_140 = L3_91
    return L51_139, L52_140
  end
  if L39_127 then
    L51_139 = _UPVALUE4_
    L52_140 = ".sourceType"
    L51_139 = L51_139 .. L52_140
    L51_139 = L39_127[L51_139]
    if L51_139 == "3" then
      L39_127["sessionLimitProfiles.startIpAddr"] = L7_95
      L39_127["sessionLimitProfiles.netMask"] = L8_96
      L51_139 = db
      L51_139 = L51_139.insert
      L52_140 = _UPVALUE4_
      L51_139(L52_140, L39_127)
    end
  end
  L51_139 = _UPVALUE6_
  L51_139 = L51_139.complete
  L51_139()
  L51_139 = _UPVALUE6_
  L51_139 = L51_139.save
  L51_139()
  L51_139 = _UPVALUE0_
  L51_139 = L51_139.SUCCESS
  L52_140 = L45_133
  return L51_139, L52_140
end
function vlanSettingsDelete(A0_141)
  local L1_142, L2_143, L3_144, L4_145, L5_146, L6_147, L7_148, L8_149, L9_150, L10_151, L11_152
  L1_142 = ACCESS_LEVEL
  if L1_142 ~= 0 then
    L1_142 = util
    L1_142 = L1_142.appendDebugOut
    L2_143 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_142(L2_143)
    L1_142 = _UPVALUE0_
    L1_142 = L1_142.UNAUTHORIZED
    return L1_142
  end
  L1_142 = A0_141["vlanSettings.cookie"]
  if L1_142 == nil then
    L2_143 = util
    L2_143 = L2_143.appendDebugOut
    L3_144 = "Delete : Invalid Cookie"
    L2_143(L3_144)
    L2_143 = _UPVALUE0_
    L2_143 = L2_143.BAD_PARAMETER
    return L2_143
  end
  L2_143, L3_144 = nil, nil
  L4_145 = _UPVALUE1_
  L4_145 = L4_145.vlanTypeGet
  L5_146 = L1_142
  L5_146 = L4_145(L5_146)
  L6_147 = _UPVALUE2_
  L6_147 = L6_147.start
  L6_147()
  L6_147 = _UPVALUE1_
  L6_147 = L6_147.vlanDelete
  L7_148 = L1_142
  L7_148 = L6_147(L7_148)
  cookie = L7_148
  L2_143 = L6_147
  L6_147 = _UPVALUE0_
  L6_147 = L6_147.SUCCESS
  if L2_143 ~= L6_147 then
    L6_147 = util
    L6_147 = L6_147.appendDebugOut
    L7_148 = "Error in Delete Operaion in page DUMMY PAGE"
    L8_149 = L2_143
    L7_148 = L7_148 .. L8_149
    L6_147(L7_148)
    L6_147 = _UPVALUE2_
    L6_147 = L6_147.abort
    L6_147()
    L6_147 = L2_143
    L7_148 = L1_142
    return L6_147, L7_148
  end
  L6_147 = _UPVALUE3_
  L6_147 = L6_147.captiveType
  L7_148 = L5_146
  L7_148 = L6_147(L7_148)
  L8_149 = _UPVALUE0_
  L8_149 = L8_149.SUCCESS
  if L6_147 == L8_149 then
    L8_149 = _UPVALUE3_
    L8_149 = L8_149.captivePortalDelete
    L9_150 = L7_148
    L9_150 = L8_149(L9_150)
    L10_151 = _UPVALUE0_
    L10_151 = L10_151.SUCCESS
    if L8_149 ~= L10_151 then
      L10_151 = util
      L10_151 = L10_151.appendDebugOut
      L11_152 = "Error in Delete Operaion in page DUMMY PAGE"
      L11_152 = L11_152 .. L2_143
      L10_151(L11_152)
      L10_151 = _UPVALUE2_
      L10_151 = L10_151.abort
      L10_151()
      L10_151 = L2_143
      L11_152 = L1_142
      return L10_151, L11_152
    end
  end
  L8_149 = "LAN"
  L9_150 = L5_146
  L8_149 = L8_149 .. L9_150
  L9_150 = _UPVALUE4_
  L9_150 = L9_150.typeFind
  L10_151 = L8_149
  L10_151 = L9_150(L10_151)
  L11_152 = _UPVALUE0_
  L11_152 = L11_152.SUCCESS
  if L9_150 == L11_152 then
    L11_152 = _UPVALUE4_
    L11_152 = L11_152.dhcpServerVLANDelete
    L11_152 = L11_152(L10_151)
    if L11_152 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L11_152)
      _UPVALUE2_.abort()
      return L11_152, L1_142
    end
  end
  L11_152 = _UPVALUE5_
  L11_152 = L11_152.VlanIpv6ConfigDelete
  Ipv6Cookie, L11_152 = L5_146, L11_152(L5_146)
  L2_143 = L11_152
  L11_152 = _UPVALUE0_
  L11_152 = L11_152.SUCCESS
  if L2_143 ~= L11_152 then
    L11_152 = util
    L11_152 = L11_152.appendDebugOut
    L11_152("Error in Delete operaion in page DUMMY PAGE" .. L2_143)
    L11_152 = _UPVALUE2_
    L11_152 = L11_152.abort
    L11_152()
    L11_152 = L2_143
    return L11_152, L1_142
  end
  L11_152 = _UPVALUE2_
  L11_152 = L11_152.complete
  L11_152()
  L11_152 = _UPVALUE2_
  L11_152 = L11_152.save
  L11_152()
  L11_152 = _UPVALUE0_
  L11_152 = L11_152.SUCCESS
  return L11_152, cookie
end
function dummyPageSectionDefaultsGet()
  local L0_153, L1_154, L3_155, L4_156, L5_157
  L0_153 = 1
  L1_154 = "PAP"
  L3_155 = _UPVALUE0_
  L3_155 = L3_155.SUCCESS
  L4_156 = 0
  L5_157 = L0_153
  return L3_155, L4_156, L5_157, L1_154
end
function vlanSettingsCreate(A0_158)
  local L1_159, L2_160, L3_161, L4_162, L5_163, L6_164, L7_165, L8_166, L9_167, L10_168, L11_169, L12_170, L13_171, L14_172, L15_173, L16_174, L17_175, L18_176, L19_177, L20_178, L21_179, L22_180, L23_181, L24_182, L25_183, L26_184, L27_185, L28_186, L29_187, L30_188, L31_189, L32_190, L33_191, L34_192, L35_193, L36_194, L37_195, L38_196, L39_197, L40_198, L41_199, L42_200, L43_201, L44_202
  L1_159 = ACCESS_LEVEL
  if L1_159 ~= 0 then
    L1_159 = util
    L1_159 = L1_159.appendDebugOut
    L2_160 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_159(L2_160)
    L1_159 = _UPVALUE0_
    L1_159 = L1_159.UNAUTHORIZED
    return L1_159
  end
  L1_159 = _UPVALUE1_
  L1_159 = L1_159.vlanStateGet
  L2_160 = L1_159()
  if L2_160 == "0" then
    L3_161 = _UPVALUE2_
    L3_161 = L3_161.COMP_VLAN_NOT_ABLE_TO_CONFIGURE_VLANSETTINGS
    return L3_161
  end
  L3_161 = A0_158["vlanSettings.vlanId"]
  L4_162 = A0_158["vlanSettings.name"]
  L5_163 = A0_158["vlanSettings.interVlanRouting"]
  L6_164 = A0_158["vlanSettings.ipAddress"]
  L7_165 = A0_158["vlanSettings.subnetMask"]
  L8_166 = vlanTypeList
  L9_167 = tonumber
  L10_168 = A0_158["vlanSettings.dhcpType"]
  L9_167 = L9_167(L10_168)
  L8_166 = L8_166[L9_167]
  L9_167 = A0_158["vlanSettings.dnsProxy"]
  L10_168 = A0_158["vlanSettings.dhcpRelayIpAddress"]
  L11_169 = A0_158["vlanSettings.startIpAddress"]
  L12_170 = A0_158["vlanSettings.endIpAddress"]
  L13_171 = A0_158["vlanSettings.gateway"]
  L14_172 = A0_158["vlanSettings.primaryDnsServer"]
  L15_173 = A0_158["vlanSettings.secondaryDnsServer"]
  L16_174 = A0_158["vlanSettings.domainName"]
  L17_175 = A0_158["vlanSettings.leaseTime"]
  L18_176 = A0_158["vlanSettings.captivePortalType"]
  L19_177 = authTypeList
  L20_178 = tonumber
  L21_179 = A0_158["vlanSettings.authenticationType"]
  L20_178 = L20_178(L21_179)
  L19_177 = L19_177[L20_178]
  L20_178 = authSubTypeList
  L21_179 = tonumber
  L22_180 = A0_158["vlanSettings.authenticationSubType"]
  L21_179 = L21_179(L22_180)
  L20_178 = L20_178[L21_179]
  L21_179 = A0_158["vlanSettings.loginProfile"]
  L22_180 = A0_158["vlanSettings.redirectType"]
  L23_181 = A0_158["vlanSettings.vlanIPv6"]
  L24_182 = A0_158["vlanSettings.prefix"]
  L25_183 = A0_158["vlanSettings.prefixLength"]
  L26_184 = A0_158["vlanSettings.dhcpv6Server"]
  L27_185 = A0_158["vlanSettings.dhcpv6ServerMode"]
  L28_186 = A0_158["vlanSettings.dhcpv6DomainName"]
  L29_187 = A0_158["vlanSettings.dhcpv6ServerPreference"]
  L30_188 = A0_158["vlanSettings.dhcpv6ServerDnsType"]
  L31_189 = A0_158["vlanSettings.ipV6primaryDnsServer"]
  L32_190 = A0_158["vlanSettings.ipV6secondaryDnsServer"]
  L33_191 = A0_158["vlanSettings.ipv6LeaseTime"]
  L34_192 = A0_158["vlanSettings.prefixDelegation"]
  L35_193 = _UPVALUE0_
  L35_193 = L35_193.NIL
  if L18_176 == "1" then
    L18_176 = "Permanent"
  else
    L18_176 = "Free"
  end
  if L6_164 == nil then
    L36_194 = util
    L36_194 = L36_194.appendDebugOut
    L37_195 = "Set : Invalid Cookie"
    L36_194(L37_195)
    L36_194 = _UPVALUE0_
    L36_194 = L36_194.BAD_PARAMETER
    return L36_194
  end
  if L7_165 == nil then
    L36_194 = util
    L36_194 = L36_194.appendDebugOut
    L37_195 = "Set : Invalid Cookie"
    L36_194(L37_195)
    L36_194 = _UPVALUE0_
    L36_194 = L36_194.BAD_PARAMETER
    return L36_194
  end
  if L3_161 == nil then
    L36_194 = util
    L36_194 = L36_194.appendDebugOut
    L37_195 = "Set : Invalid Cookie"
    L36_194(L37_195)
    L36_194 = _UPVALUE0_
    L36_194 = L36_194.BAD_PARAMETER
    return L36_194
  end
  L36_194 = UNIT_NAME
  if L36_194 ~= "DSR-150" then
    L36_194 = UNIT_NAME
  elseif L36_194 == "DSR-150N" then
    L36_194 = tonumber
    L37_195 = L3_161
    L36_194 = L36_194(L37_195)
    if L36_194 > 15 then
      L36_194 = util
      L36_194 = L36_194.appendDebugOut
      L37_195 = "Set : Vlan ID not in range"
      L36_194(L37_195)
      L36_194 = _UPVALUE0_
      L36_194 = L36_194.VLANID_NOT_IN_RANGE
      return L36_194
    end
    L36_194 = tonumber
    L37_195 = L3_161
    L36_194 = L36_194(L37_195)
    if L36_194 == 13 then
      L36_194 = util
      L36_194 = L36_194.appendDebugOut
      L37_195 = "Set : Reserved Vlan ID"
      L36_194(L37_195)
      L36_194 = _UPVALUE0_
      L36_194 = L36_194.RESERVED_VLANID_DMZ
      return L36_194
    end
  end
  L36_194 = UNIT_NAME
  if L36_194 ~= "DSR-250N" then
    L36_194 = UNIT_NAME
    if L36_194 ~= "DSR-250" then
      L36_194 = UNIT_NAME
      if L36_194 ~= "DSR-150N" then
        L36_194 = UNIT_NAME
      end
    end
  elseif L36_194 == "DSR-150" then
    L36_194 = _UPVALUE1_
    L36_194 = L36_194.wanVlanIDConfiguredCheck
    L37_195 = L3_161
    L36_194 = L36_194(L37_195)
    L35_193 = L36_194
    L36_194 = _UPVALUE0_
    L36_194 = L36_194.SUCCESS
    if L35_193 ~= L36_194 then
      return L35_193
    end
  end
  L36_194 = db
  L36_194 = L36_194.getAttribute
  L37_195 = "fbwifi"
  L38_196 = "_ROWID_"
  L39_197 = "1"
  L40_198 = "enabled"
  L36_194 = L36_194(L37_195, L38_196, L39_197, L40_198)
  fbwifienable = L36_194
  if L18_176 ~= "Free" then
    L36_194 = fbwifienable
    if L36_194 == "1" then
      L36_194 = "CAPTIVEPORTAL_DEV_FBWIFI_CONFIGURED"
      return L36_194
    end
  end
  L36_194, L37_195 = nil, nil
  L38_196 = _UPVALUE3_
  L38_196 = L38_196.checkWanSubnetRange
  L39_197 = L6_164
  L40_198 = L7_165
  L38_196 = L38_196(L39_197, L40_198)
  L36_194 = L38_196
  L38_196 = _UPVALUE0_
  L38_196 = L38_196.SUCCESS
  if L36_194 == L38_196 then
    L38_196 = util
    L38_196 = L38_196.appendDebugOut
    L39_197 = "Set : Invalid ipaddress"
    L38_196(L39_197)
    L38_196 = PRODUCT_ID
    if L38_196 ~= "DSR-1000AC_Ax" then
      L38_196 = PRODUCT_ID
      if L38_196 ~= "DSR-1000_Bx" then
        L38_196 = PRODUCT_ID
        if L38_196 ~= "DSR-500_Bx" then
          L38_196 = PRODUCT_ID
          if L38_196 ~= "DSR-500AC_Ax" then
            L38_196 = UNIT_NAME
            if L38_196 ~= "DSR-1000N" then
              L38_196 = UNIT_NAME
              if L38_196 ~= "DSR-1000" then
                L38_196 = UNIT_NAME
                if L38_196 ~= "DSR-500N" then
                  L38_196 = UNIT_NAME
                end
              end
            end
          end
        end
      end
    else
      if L38_196 == "DSR-500" then
        L38_196 = _UPVALUE0_
        L38_196 = L38_196.WAN_ALREADY_CONFIGURED
        return L38_196
    end
    else
      L38_196 = _UPVALUE0_
      L38_196 = L38_196.WAN_ECONA_ALREADY_CONFIGURED
      return L38_196
    end
  end
  L38_196 = _UPVALUE3_
  L38_196 = L38_196.checkIpSecSubnetRange
  L39_197 = L6_164
  L40_198 = L7_165
  L38_196 = L38_196(L39_197, L40_198)
  L36_194 = L38_196
  L38_196 = _UPVALUE0_
  L38_196 = L38_196.SUCCESS
  if L36_194 == L38_196 then
    L38_196 = util
    L38_196 = L38_196.appendDebugOut
    L39_197 = "Set : Invalid ipaddress"
    L38_196(L39_197)
    L38_196 = _UPVALUE0_
    L38_196 = L38_196.IPSEC_DHCP_ALREADY_CONFIGURED
    return L38_196
  end
  L38_196 = _UPVALUE3_
  L38_196 = L38_196.checkOpenVpnSubnetRange
  L39_197 = L6_164
  L40_198 = L7_165
  L38_196 = L38_196(L39_197, L40_198)
  L36_194 = L38_196
  L38_196 = _UPVALUE0_
  L38_196 = L38_196.SUCCESS
  if L36_194 == L38_196 then
    L38_196 = util
    L38_196 = L38_196.appendDebugOut
    L39_197 = "Set : Invalid ipaddress"
    L38_196(L39_197)
    L38_196 = _UPVALUE0_
    L38_196 = L38_196.OPENVPN_ALREADY_CONFIGURED
    return L38_196
  end
  L38_196 = _UPVALUE3_
  L38_196 = L38_196.checkDmzSubnetRange
  L39_197 = L6_164
  L40_198 = L7_165
  L38_196 = L38_196(L39_197, L40_198)
  L36_194 = L38_196
  L38_196 = _UPVALUE0_
  L38_196 = L38_196.SUCCESS
  if L36_194 == L38_196 then
    L38_196 = util
    L38_196 = L38_196.appendDebugOut
    L39_197 = "Set : Invalid ipaddress"
    L38_196(L39_197)
    L38_196 = _UPVALUE0_
    L38_196 = L38_196.DMZ_ALREADY_CONFIGURED
    return L38_196
  end
  L38_196 = HIGH_SEC
  if L38_196 == "HIGH" then
    L38_196 = _UPVALUE3_
    L38_196 = L38_196.checkSslClientRange
    L39_197 = L6_164
    L40_198 = L7_165
    L38_196 = L38_196(L39_197, L40_198)
    L36_194 = L38_196
    L38_196 = _UPVALUE0_
    L38_196 = L38_196.SUCCESS
    if L36_194 == L38_196 then
      L38_196 = util
      L38_196 = L38_196.appendDebugOut
      L39_197 = "Set : Invalid ipaddress"
      L38_196(L39_197)
      L38_196 = _UPVALUE0_
      L38_196 = L38_196.SSLVPN_CLIENT_ALREADY_CONFIGURED
      return L38_196
    end
  end
  L38_196 = _UPVALUE3_
  L38_196 = L38_196.checkVlanSubnetRange
  L39_197 = L6_164
  L40_198 = L7_165
  L41_199 = L3_161
  L38_196 = L38_196(L39_197, L40_198, L41_199)
  L36_194 = L38_196
  L38_196 = _UPVALUE0_
  L38_196 = L38_196.SUCCESS
  if L36_194 == L38_196 then
    L38_196 = util
    L38_196 = L38_196.appendDebugOut
    L39_197 = "Set : Invalid ipaddress"
    L38_196(L39_197)
    L38_196 = _UPVALUE0_
    L38_196 = L38_196.LAN_VLAN_ALREADY_CONFIGURED
    return L38_196
  end
  L38_196 = _UPVALUE3_
  L38_196 = L38_196.checkPptpSeverSubnetRange
  L39_197 = L6_164
  L40_198 = L7_165
  L38_196 = L38_196(L39_197, L40_198)
  result = L38_196
  L38_196 = result
  L39_197 = _UPVALUE0_
  L39_197 = L39_197.SUCCESS
  if L38_196 == L39_197 then
    L38_196 = _UPVALUE0_
    L38_196 = L38_196.PPTP_SERVER_ALREADY_CONFIGURED
    return L38_196
  end
  L38_196 = _UPVALUE3_
  L38_196 = L38_196.checkL2tpSeverSubnetRange
  L39_197 = L6_164
  L40_198 = L7_165
  L38_196 = L38_196(L39_197, L40_198)
  result = L38_196
  L38_196 = result
  L39_197 = _UPVALUE0_
  L39_197 = L39_197.SUCCESS
  if L38_196 == L39_197 then
    L38_196 = _UPVALUE0_
    L38_196 = L38_196.L2TP_SERVER_ALREADY_CONFIGURED
    return L38_196
  end
  if L24_182 and L25_183 then
    L38_196 = _UPVALUE3_
    L38_196 = L38_196.ipv6AddressCheck
    L39_197 = L24_182
    L38_196 = L38_196(L39_197)
    L36_194 = L38_196
    L38_196 = _UPVALUE0_
    L38_196 = L38_196.SUCCESS
    if L36_194 ~= L38_196 then
      L38_196 = util
      L38_196 = L38_196.appendDebugOut
      L39_197 = "Set : Invalid ipaddress"
      L38_196(L39_197)
      return L36_194
    end
    L38_196 = _UPVALUE3_
    L38_196 = L38_196.checkVlanIPV6RangeCheck
    L39_197 = L24_182
    L40_198 = L25_183
    L41_199 = L3_161
    L38_196 = L38_196(L39_197, L40_198, L41_199)
    L36_194 = L38_196
    L38_196 = _UPVALUE0_
    L38_196 = L38_196.SUCCESS
    if L36_194 == L38_196 then
      L38_196 = util
      L38_196 = L38_196.appendDebugOut
      L39_197 = "Set : Invalid ipaddress"
      L38_196(L39_197)
      L38_196 = _UPVALUE0_
      L38_196 = L38_196.LAN_VLAN_IPV6_ADDRESS_ALREADY_CONFIGURED
      return L38_196
    end
  end
  L38_196 = tonumber
  L39_197 = L23_181
  L38_196 = L38_196(L39_197)
  if L38_196 ~= 0 then
    L38_196 = tonumber
    L39_197 = L23_181
    L38_196 = L38_196(L39_197)
    if L38_196 ~= 1 then
      L38_196 = _UPVALUE0_
      L38_196 = L38_196.FAILURE
      return L38_196
    end
  end
  if L8_166 ~= "Server" then
    L39_197 = L6_164
    L38_196 = L6_164.match
    L40_198 = "^(%d+)%.(%d+)%.(%d+)%.(%d+)$"
    L41_199 = L38_196(L39_197, L40_198)
    L42_200 = L38_196
    L43_201 = "."
    L44_202 = L39_197
    L11_169 = L42_200 .. L43_201 .. L44_202 .. "." .. L40_198 .. ".100"
    L42_200 = L38_196
    L43_201 = "."
    L44_202 = L39_197
    L12_170 = L42_200 .. L43_201 .. L44_202 .. "." .. L40_198 .. ".254"
  end
  L38_196 = _UPVALUE4_
  L38_196 = L38_196.start
  L38_196()
  L38_196 = _UPVALUE5_
  L38_196 = L38_196.dhcpServerVLANCreate
  L39_197 = L6_164
  L40_198 = L7_165
  L41_199 = L3_161
  L42_200 = L11_169
  L43_201 = L12_170
  L44_202 = L13_171
  L39_197 = L38_196(L39_197, L40_198, L41_199, L42_200, L43_201, L44_202, L14_172, L15_173, L16_174, L17_175, L8_166)
  L37_195 = L39_197
  L36_194 = L38_196
  L38_196 = _UPVALUE0_
  L38_196 = L38_196.SUCCESS
  if L36_194 ~= L38_196 then
    L38_196 = util
    L38_196 = L38_196.appendDebugOut
    L39_197 = "Error in configuring values in page DUMMY PAGE"
    L40_198 = L36_194
    L39_197 = L39_197 .. L40_198
    L38_196(L39_197)
    L38_196 = _UPVALUE4_
    L38_196 = L38_196.abort
    L38_196()
    L38_196 = L36_194
    L39_197 = curCookie
    return L38_196, L39_197
  end
  L38_196 = _UPVALUE6_
  L38_196 = L38_196.dhcpv6ServerVLANCreate
  L39_197 = L3_161
  L40_198 = L23_181
  L41_199 = L26_184
  L42_200 = L24_182
  L43_201 = L25_183
  L44_202 = L27_185
  L39_197 = L38_196(L39_197, L40_198, L41_199, L42_200, L43_201, L44_202, L28_186, L29_187, L30_188, L31_189, L32_190, L33_191, L34_192)
  L37_195 = L39_197
  L36_194 = L38_196
  L38_196 = _UPVALUE0_
  L38_196 = L38_196.SUCCESS
  if L36_194 ~= L38_196 then
    L38_196 = util
    L38_196 = L38_196.appendDebugOut
    L39_197 = "Error in configuring values in page DUMMY PAGE"
    L40_198 = L36_194
    L39_197 = L39_197 .. L40_198
    L38_196(L39_197)
    L38_196 = _UPVALUE4_
    L38_196 = L38_196.abort
    L38_196()
    L38_196 = L36_194
    L39_197 = curCookie
    return L38_196, L39_197
  end
  L38_196 = _UPVALUE1_
  L38_196 = L38_196.vlanCreate
  L39_197 = L3_161
  L40_198 = L4_162
  L41_199 = L23_181
  L42_200 = L5_163
  L43_201 = L6_164
  L44_202 = L7_165
  L39_197 = L38_196(L39_197, L40_198, L41_199, L42_200, L43_201, L44_202, L8_166, L9_167, L10_168)
  L37_195 = L39_197
  L36_194 = L38_196
  L38_196 = _UPVALUE0_
  L38_196 = L38_196.SUCCESS
  if L36_194 ~= L38_196 then
    L38_196 = util
    L38_196 = L38_196.appendDebugOut
    L39_197 = "Error in configuring values in page DUMMY PAGE"
    L40_198 = L36_194
    L39_197 = L39_197 .. L40_198
    L38_196(L39_197)
    L38_196 = _UPVALUE4_
    L38_196 = L38_196.abort
    L38_196()
    L38_196 = L36_194
    L39_197 = curCookie
    return L38_196, L39_197
  end
  if L18_176 == "Permanent" then
    L38_196 = _UPVALUE7_
    L38_196 = L38_196.captivePortalEnable
    L39_197 = L38_196()
    L40_198 = _UPVALUE0_
    L40_198 = L40_198.SUCCESS
    if L38_196 ~= L40_198 then
      L40_198 = util
      L40_198 = L40_198.appendDebugOut
      L41_199 = "Error in configuring values in page DUMMY PAGE"
      L42_200 = L36_194
      L41_199 = L41_199 .. L42_200
      L40_198(L41_199)
      L40_198 = _UPVALUE4_
      L40_198 = L40_198.abort
      L40_198()
      L40_198 = L38_196
      L41_199 = curCookie
      return L40_198, L41_199
    end
    L40_198 = _UPVALUE7_
    L40_198 = L40_198.captivePortalCreate
    L41_199 = L3_161
    L42_200 = L18_176
    L43_201 = L19_177
    L44_202 = L20_178
    L41_199 = L40_198(L41_199, L42_200, L43_201, L44_202, L21_179, L22_180)
    L42_200 = _UPVALUE0_
    L42_200 = L42_200.SUCCESS
    if L40_198 ~= L42_200 then
      L42_200 = util
      L42_200 = L42_200.appendDebugOut
      L43_201 = "Error in configuring values in page DUMMY PAGE"
      L44_202 = L36_194
      L43_201 = L43_201 .. L44_202
      L42_200(L43_201)
      L42_200 = _UPVALUE4_
      L42_200 = L42_200.abort
      L42_200()
      L42_200 = L40_198
      L43_201 = curCookie
      return L42_200, L43_201
    end
  end
  L38_196 = nil
  if L18_176 == "Free" then
    L39_197 = _UPVALUE1_
    L39_197 = L39_197.vlanIntervlanAccessTypeSet
    L40_198 = L37_195
    L41_199 = interVLanAccessTypeFREE
    L39_197 = L39_197(L40_198, L41_199)
    L38_196 = L39_197
  end
  if L18_176 == "Permanent" then
    L39_197 = _UPVALUE1_
    L39_197 = L39_197.vlanIntervlanAccessTypeSet
    L40_198 = L37_195
    L41_199 = interVLanAccessTypePermanent
    L39_197 = L39_197(L40_198, L41_199)
    L38_196 = L39_197
  end
  L39_197 = _UPVALUE0_
  L39_197 = L39_197.SUCCESS
  if L38_196 ~= L39_197 then
    L39_197 = util
    L39_197 = L39_197.appendDebugOut
    L40_198 = "Error in configuring values in page DUMMY PAGE"
    L41_199 = L36_194
    L40_198 = L40_198 .. L41_199
    L39_197(L40_198)
    L39_197 = _UPVALUE4_
    L39_197 = L39_197.abort
    L39_197()
    L39_197 = returnCode1
    L40_198 = curCookie
    return L39_197, L40_198
  end
  L39_197 = _UPVALUE4_
  L39_197 = L39_197.complete
  L39_197()
  L39_197 = _UPVALUE4_
  L39_197 = L39_197.save
  L39_197()
  L39_197 = _UPVALUE0_
  L39_197 = L39_197.SUCCESS
  L40_198 = L37_195
  return L39_197, L40_198
end
function vlanSettingsDeleteAll()
  local L0_203, L1_204, L2_205, L3_206, L4_207
  L0_203 = ACCESS_LEVEL
  if L0_203 ~= 0 then
    L0_203 = util
    L0_203 = L0_203.appendDebugOut
    L1_204 = "Detected Unauthorized access for page DUMMY PAGE"
    L0_203(L1_204)
    L0_203 = _UPVALUE0_
    L0_203 = L0_203.UNAUTHORIZED
    return L0_203
  end
  L0_203 = _UPVALUE1_
  L0_203 = L0_203.start
  L0_203()
  L0_203 = _UPVALUE2_
  L0_203 = L0_203.vlanDeleteAll
  L1_204 = L0_203()
  cookie = L1_204
  returnCode = L0_203
  L0_203 = returnCode
  L1_204 = _UPVALUE0_
  L1_204 = L1_204.SUCCESS
  if L0_203 ~= L1_204 then
    L0_203 = util
    L0_203 = L0_203.appendDebugOut
    L1_204 = "Error in Delete Operaion in page DUMMY PAGE"
    L2_205 = returnCode
    L1_204 = L1_204 .. L2_205
    L0_203(L1_204)
    L0_203 = _UPVALUE1_
    L0_203 = L0_203.abort
    L0_203()
    L0_203 = returnCode
    L1_204 = curCookie
    return L0_203, L1_204
  end
  L0_203 = _UPVALUE3_
  L0_203 = L0_203.captiveType
  L1_204 = vlanId
  L0_203 = L0_203(L1_204)
  L1_204 = _UPVALUE3_
  L1_204 = L1_204.captivePortalDeleteAll
  L2_205 = L1_204()
  L3_206 = returnCode
  L4_207 = _UPVALUE0_
  L4_207 = L4_207.SUCCESS
  if L3_206 ~= L4_207 then
    L3_206 = util
    L3_206 = L3_206.appendDebugOut
    L4_207 = "Error in Delete Operaion in page DUMMY PAGE"
    L4_207 = L4_207 .. returnCode
    L3_206(L4_207)
    L3_206 = _UPVALUE1_
    L3_206 = L3_206.abort
    L3_206()
    L3_206 = returnCode
    L4_207 = curCookie
    return L3_206, L4_207
  end
  L3_206 = _UPVALUE4_
  L3_206 = L3_206.dhcpServerVLANDeleteAll
  L4_207 = L3_206()
  if L3_206 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L3_206)
    _UPVALUE1_.abort()
    return L3_206, curCookie
  end
  L3_206, L4_207 = _UPVALUE5_.dhcpv6ServerVLANDeleteAll()
  if L3_206 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L3_206)
    _UPVALUE1_.abort()
    return L3_206, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L4_207
end
function vlanStatusGet()
  local L0_208, L1_209
  L0_208 = _UPVALUE0_
  L0_208 = L0_208.vlanStateGet
  L1_209 = L0_208()
  if L0_208 ~= _UPVALUE1_.SUCCESS then
    return L0_208
  end
  return L0_208, L1_209
end
function vlanStatusSet(A0_210)
  local L1_211, L2_212
  L1_211 = ACCESS_LEVEL
  if L1_211 ~= 0 then
    L1_211 = util
    L1_211 = L1_211.appendDebugOut
    L2_212 = "Detected Unauthorized access for page vlanSettings PAGE"
    L1_211(L2_212)
    L1_211 = _UPVALUE0_
    L1_211 = L1_211.UNAUTHORIZED
    return L1_211
  end
  L1_211 = A0_210["vlanSettings.cookie"]
  L2_212 = A0_210["vlanSettings.vlanStatus"]
  _UPVALUE1_.start()
  returnCode, curCookie = _UPVALUE2_.vlanStateSet(L1_211, L2_212)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page vlanSettings PAGE" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L1_211
end
function vlanSettingsGetAllInfo()
  local L0_213, L1_214, L2_215, L3_216, L4_217, L5_218, L6_219
  L0_213 = {}
  L1_214 = nil
  L0_213 = L3_216
  L1_214 = L2_215
  if L1_214 ~= L2_215 then
    return L1_214
  end
  for L5_218, L6_219 in L2_215(L3_216) do
    for _FORV_10_, _FORV_11_ in pairs(L6_219) do
    end
  end
  return L2_215, L3_216
end
