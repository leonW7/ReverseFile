local L0_0
L0_0 = module
L0_0("com.teamf1.bl.system.deviceInfo", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/stats_db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/system_maintenance")
L0_0 = require
L0_0("teamf1lualib/system_productData")
L0_0 = require
L0_0("teamf1lualib/system_management")
L0_0 = require
L0_0("teamf1lualib/wan_multiwan")
L0_0 = require
L0_0("teamf1lualib/ipv6_wanclients_static")
L0_0 = require
L0_0("teamf1lualib/wan_client")
L0_0 = require
L0_0("teamf1lualib/wan_status")
L0_0 = require
L0_0("teamf1lualib/ipv6_mode")
L0_0 = require
L0_0("teamf1lualib/wan_pptp")
L0_0 = require
L0_0("teamf1lualib/wan_l2tp")
L0_0 = require
L0_0("teamf1lualib/wan_japanese_multiple_pppoe")
L0_0 = require
L0_0("teamf1lualib/wan_routingMode")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/lan_addressing")
L0_0 = require
L0_0("teamf1lualib/wan_configurablePort")
L0_0 = require
L0_0("teamf1lualib/dmz_addressing")
L0_0 = require
L0_0("teamf1lualib/wan_russian_dual_pppoe")
L0_0 = require
L0_0("teamf1lualib/wireless_status")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
STATS_DB_FILE_NAME = "/tmp/stats.db"
;({}).ipv6PrefixLen = "ipv6PrefixLen"
;({}).ipAddress = "ipAddress"
;({}).subnetMask = "subnetMask"
;({}).Primary = "Primary"
;({}).Secondary = "Secondary"
;({}).pairwiseCiphers = "pairwiseCiphers"
;({}).authMethods = "authMethods"
;({}).groupCipher = "groupCipher"
;({}).wepAuth = "wepAuth"
;({}).ssid = "ssid"
;({}).security = "security"
;({}).encryption = "encryption"
;({}).authentication = "authentication"
function systemInfoGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7
  L0_1, L1_2, L2_3, firmwareDate = _UPVALUE0_.currentFirmwareGetAll()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  L0_1, L1_2, L3_4 = _UPVALUE2_.systemnameGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  L0_1, L1_2, L4_5 = _UPVALUE3_.serialNumberGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  L0_1, L1_2, L6_7 = _UPVALUE3_.hardwareVersionGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  L0_1, L1_2, L5_6 = _UPVALUE4_.configPortUsageGet()
  return _UPVALUE1_.SUCCESS, L1_2, L3_4, L2_3, L6_7, L4_5, L5_6
end
function portInformationGet()
  local L0_8, L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16, L9_17, L10_18, L11_19, L12_20, L13_21, L14_22, L15_23, L16_24, L17_25, L18_26, L19_27, L20_28, L21_29, L22_30, L23_31, L24_32, L25_33, L26_34, L27_35, L28_36, L29_37, L30_38, L31_39, L32_40, L33_41, L34_42, L35_43, L36_44, L37_45, L38_46, L39_47, L40_48, L41_49, L42_50, L43_51, L44_52, L45_53, L46_54, L47_55, L48_56, L49_57, L50_58, L51_59, L52_60, L53_61, L54_62, L55_63, L56_64, L57_65, L58_66, L59_67, L60_68, L61_69, L62_70, L63_71, L64_72, L65_73, L66_74, L67_75, L68_76, L69_77, L70_78, L71_79, L72_80, L73_81, L74_82, L75_83, L76_84, L77_85, L78_86, L79_87, L80_88, L81_89, L82_90, L83_91, L84_92, L85_93, L86_94, L87_95, L88_96, L89_97, L90_98, L91_99, L92_100, L93_101, L94_102, L95_103, L96_104, L97_105, L98_106, L99_107
  L0_8 = "/pfrm2.0/bin/nimfStatus"
  if L0_8 ~= nil then
    L1_9 = util
    L1_9 = L1_9.appendDebugOut
    L2_10 = "Exec = "
    L3_11 = os
    L3_11 = L3_11.execute
    L4_12 = L0_8
    L5_13 = " "
    L6_14 = STATS_DB_FILE_NAME
    L7_15 = " WAN1 2"
    L4_12 = L4_12 .. L5_13 .. L6_14 .. L7_15
    L3_11 = L3_11(L4_12)
    L2_10 = L2_10 .. L3_11
    L1_9(L2_10)
    L1_9 = util
    L1_9 = L1_9.appendDebugOut
    L2_10 = "Exec = "
    L3_11 = os
    L3_11 = L3_11.execute
    L4_12 = L0_8
    L5_13 = " "
    L6_14 = STATS_DB_FILE_NAME
    L7_15 = " WAN1 10"
    L4_12 = L4_12 .. L5_13 .. L6_14 .. L7_15
    L3_11 = L3_11(L4_12)
    L2_10 = L2_10 .. L3_11
    L1_9(L2_10)
    L1_9 = util
    L1_9 = L1_9.appendDebugOut
    L2_10 = "Exec = "
    L3_11 = os
    L3_11 = L3_11.execute
    L4_12 = L0_8
    L5_13 = " "
    L6_14 = STATS_DB_FILE_NAME
    L7_15 = " WAN2 2"
    L4_12 = L4_12 .. L5_13 .. L6_14 .. L7_15
    L3_11 = L3_11(L4_12)
    L2_10 = L2_10 .. L3_11
    L1_9(L2_10)
    L1_9 = util
    L1_9 = L1_9.appendDebugOut
    L2_10 = "Exec = "
    L3_11 = os
    L3_11 = L3_11.execute
    L4_12 = L0_8
    L5_13 = " "
    L6_14 = STATS_DB_FILE_NAME
    L7_15 = " WAN2 10"
    L4_12 = L4_12 .. L5_13 .. L6_14 .. L7_15
    L3_11 = L3_11(L4_12)
    L2_10 = L2_10 .. L3_11
    L1_9(L2_10)
    L1_9 = util
    L1_9 = L1_9.appendDebugOut
    L2_10 = "Exec = "
    L3_11 = os
    L3_11 = L3_11.execute
    L4_12 = L0_8
    L5_13 = " "
    L6_14 = STATS_DB_FILE_NAME
    L7_15 = " WAN3 2"
    L4_12 = L4_12 .. L5_13 .. L6_14 .. L7_15
    L3_11 = L3_11(L4_12)
    L2_10 = L2_10 .. L3_11
    L1_9(L2_10)
    L1_9 = util
    L1_9 = L1_9.appendDebugOut
    L2_10 = "Exec = "
    L3_11 = os
    L3_11 = L3_11.execute
    L4_12 = L0_8
    L5_13 = " "
    L6_14 = STATS_DB_FILE_NAME
    L7_15 = " WAN3 10"
    L4_12 = L4_12 .. L5_13 .. L6_14 .. L7_15
    L3_11 = L3_11(L4_12)
    L2_10 = L2_10 .. L3_11
    L1_9(L2_10)
  end
  L0_8 = "/pfrm2.0/bin/linkStatusDetect"
  if L0_8 ~= nil then
    L1_9 = util
    L1_9 = L1_9.appendDebugOut
    L2_10 = "Exec = "
    L3_11 = os
    L3_11 = L3_11.execute
    L4_12 = L0_8
    L5_13 = " "
    L6_14 = DB_FILE_NAME
    L7_15 = " WAN1"
    L4_12 = L4_12 .. L5_13 .. L6_14 .. L7_15
    L3_11 = L3_11(L4_12)
    L2_10 = L2_10 .. L3_11
    L1_9(L2_10)
    L1_9 = util
    L1_9 = L1_9.appendDebugOut
    L2_10 = "Exec = "
    L3_11 = os
    L3_11 = L3_11.execute
    L4_12 = L0_8
    L5_13 = " "
    L6_14 = DB_FILE_NAME
    L7_15 = " WAN2"
    L4_12 = L4_12 .. L5_13 .. L6_14 .. L7_15
    L3_11 = L3_11(L4_12)
    L2_10 = L2_10 .. L3_11
    L1_9(L2_10)
    L1_9 = util
    L1_9 = L1_9.appendDebugOut
    L2_10 = "Exec = "
    L3_11 = os
    L3_11 = L3_11.execute
    L4_12 = L0_8
    L5_13 = " "
    L6_14 = DB_FILE_NAME
    L7_15 = " DMZ"
    L4_12 = L4_12 .. L5_13 .. L6_14 .. L7_15
    L3_11 = L3_11(L4_12)
    L2_10 = L2_10 .. L3_11
    L1_9(L2_10)
    L1_9 = util
    L1_9 = L1_9.appendDebugOut
    L2_10 = "Exec = "
    L3_11 = os
    L3_11 = L3_11.execute
    L4_12 = L0_8
    L5_13 = " "
    L6_14 = DB_FILE_NAME
    L7_15 = " WAN3"
    L4_12 = L4_12 .. L5_13 .. L6_14 .. L7_15
    L3_11 = L3_11(L4_12)
    L2_10 = L2_10 .. L3_11
    L1_9(L2_10)
  end
  L1_9 = _UPVALUE0_
  L1_9 = L1_9.ipv6ModeGet
  L3_11 = L1_9()
  L4_12 = _UPVALUE1_
  if L3_11 == L4_12 then
    L0_8 = "/pfrm2.0/bin/iprouteIPv6GwAdd"
    if L0_8 ~= nil then
      L4_12 = util
      L4_12 = L4_12.appendDebugOut
      L5_13 = "Exec = "
      L6_14 = os
      L6_14 = L6_14.execute
      L7_15 = L0_8
      L8_16 = " "
      L9_17 = DB_FILE_NAME
      L7_15 = L7_15 .. L8_16 .. L9_17
      L6_14 = L6_14(L7_15)
      L5_13 = L5_13 .. L6_14
      L4_12(L5_13)
    end
  end
  L4_12, L5_13, L6_14, L7_15, L8_16, L9_17 = nil, nil, nil, nil, nil, nil
  L10_18 = {}
  L11_19 = {}
  L12_20 = {}
  L13_21 = {}
  L14_22, L15_23, L16_24, L17_25, L18_26, L19_27, L20_28, L21_29, L22_30, L23_31, L24_32, L25_33, L26_34, L27_35, L28_36, L29_37, L30_38, L31_39, L32_40, L33_41, L34_42, L35_43, L36_44, L37_45, L38_46, L39_47, L40_48, L41_49, L42_50, L43_51, L44_52, L45_53, L46_54, L47_55, L48_56, L49_57, L50_58, L51_59, L52_60, L53_61, L54_62, L55_63, L56_64, L57_65, L58_66, L59_67, L60_68, L61_69, L62_70, L63_71, L64_72, L65_73, L66_74, L67_75, L68_76, L69_77, L70_78, L71_79, L72_80, L73_81, L74_82, L75_83, L76_84, L77_85, L78_86, L79_87, L80_88, L81_89, L82_90, L83_91, L84_92, L85_93, L86_94, L87_95, L88_96, L89_97, L90_98, L91_99, L92_100, L93_101 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L94_102 = _UPVALUE2_
  L94_102 = L94_102.macAddressGet
  L95_103 = _UPVALUE3_
  L95_103 = L94_102(L95_103)
  L11_19[1] = L95_103
  L1_9 = L94_102
  L94_102 = _UPVALUE4_
  L94_102 = L94_102.configPortUsageGet
  L96_104 = L94_102()
  L65_73 = L96_104
  L2_10 = L95_103
  L1_9 = L94_102
  L94_102 = _UPVALUE5_
  L94_102 = L94_102.SUCCESS
  if L1_9 ~= L94_102 then
    return L1_9
  end
  if L65_73 == "WAN2" then
    L94_102 = _UPVALUE2_
    L94_102 = L94_102.macAddressGet
    L95_103 = _UPVALUE6_
    L95_103 = L94_102(L95_103)
    L12_20[1] = L95_103
    L1_9 = L94_102
  elseif L65_73 == "DMZ" then
    L94_102 = _UPVALUE2_
    L94_102 = L94_102.macAddressGet
    L95_103 = _UPVALUE7_
    L95_103 = L94_102(L95_103)
    L12_20[1] = L95_103
    L1_9 = L94_102
  end
  L94_102 = _UPVALUE2_
  L94_102 = L94_102.macAddressGet
  L95_103 = _UPVALUE8_
  L95_103 = L94_102(L95_103)
  L10_18[1] = L95_103
  L1_9 = L94_102
  L94_102 = _UPVALUE9_
  L94_102 = L94_102.connectionTypeGet
  L95_103 = _UPVALUE3_
  L96_104 = _UPVALUE10_
  L96_104 = L94_102(L95_103, L96_104)
  L14_22 = L96_104
  L2_10 = L95_103
  L1_9 = L94_102
  if L65_73 == "WAN2" then
    L94_102 = _UPVALUE9_
    L94_102 = L94_102.connectionTypeGet
    L95_103 = _UPVALUE6_
    L96_104 = _UPVALUE10_
    L96_104 = L94_102(L95_103, L96_104)
    L15_23 = L96_104
    L2_10 = L95_103
    L1_9 = L94_102
    L94_102 = _UPVALUE11_
    if L15_23 == L94_102 then
      L94_102 = _UPVALUE12_
      L94_102 = L94_102.isdualAccessEnabledNext
      L95_103 = "1"
      L96_104 = L94_102(L95_103)
      L62_70 = L96_104
      L2_10 = L95_103
      L1_9 = L94_102
      if L62_70 == "1" then
        L15_23 = _UPVALUE13_
      end
    end
    L94_102 = _UPVALUE14_
    if L15_23 == L94_102 then
      L94_102 = _UPVALUE2_
      L94_102 = L94_102.macAddressGet
      L95_103 = _UPVALUE6_
      L95_103 = L94_102(L95_103)
      L12_20[1] = L95_103
      L1_9 = L94_102
      L94_102 = _UPVALUE15_
      L95_103 = nil
      L25_33 = L95_103
      L1_9 = L94_102
    end
    L94_102 = _UPVALUE16_
    if L15_23 == L94_102 then
      L94_102 = _UPVALUE17_
      L94_102 = L94_102.isdualAccessEnabledNext
      L95_103 = "1"
      L96_104 = L94_102(L95_103)
      L62_70 = L96_104
      L2_10 = L95_103
      L1_9 = L94_102
      if L62_70 == "1" then
        L15_23 = _UPVALUE18_
      end
    end
    L94_102 = _UPVALUE19_
    if L15_23 == L94_102 then
      L94_102, L95_103 = nil, nil
      L96_104 = _UPVALUE20_
      L96_104 = L96_104.statusGet
      L97_105 = _UPVALUE6_
      L98_106 = _UPVALUE21_
      L99_107 = L96_104(L97_105, L98_106)
      L63_71 = L99_107
      L94_102 = L98_106
      L2_10 = L97_105
      L1_9 = L96_104
      L96_104 = _UPVALUE20_
      L96_104 = L96_104.statusGet
      L97_105 = _UPVALUE6_
      L98_106 = _UPVALUE22_
      L99_107 = L96_104(L97_105, L98_106)
      L64_72 = L99_107
      L95_103 = L98_106
      L2_10 = L97_105
      L1_9 = L96_104
      if L63_71 == "1" and L64_72 == "1" then
        L15_23 = _UPVALUE23_
      end
    end
    L94_102 = connectionTypeToString
    L95_103 = L15_23
    L94_102 = L94_102(L95_103)
    L15_23 = L94_102
  end
  L94_102 = _UPVALUE11_
  if L14_22 == L94_102 then
    L94_102 = _UPVALUE12_
    L94_102 = L94_102.isdualAccessEnabled
    L96_104 = L94_102()
    L62_70 = L96_104
    L2_10 = L95_103
    L1_9 = L94_102
    if L62_70 == "1" then
      L14_22 = _UPVALUE13_
    end
  end
  L94_102 = _UPVALUE16_
  if L14_22 == L94_102 then
    L94_102 = _UPVALUE17_
    L94_102 = L94_102.isdualAccessEnabled
    L96_104 = L94_102()
    L62_70 = L96_104
    L2_10 = L95_103
    L1_9 = L94_102
    if L62_70 == "1" then
      L14_22 = _UPVALUE18_
    end
  end
  L94_102 = _UPVALUE19_
  if L14_22 == L94_102 then
    L94_102, L95_103 = nil, nil
    L96_104 = _UPVALUE20_
    L96_104 = L96_104.statusGet
    L97_105 = _UPVALUE3_
    L98_106 = _UPVALUE21_
    L99_107 = L96_104(L97_105, L98_106)
    L63_71 = L99_107
    L94_102 = L98_106
    L2_10 = L97_105
    L1_9 = L96_104
    L96_104 = _UPVALUE20_
    L96_104 = L96_104.statusGet
    L97_105 = _UPVALUE3_
    L98_106 = _UPVALUE22_
    L99_107 = L96_104(L97_105, L98_106)
    L64_72 = L99_107
    L95_103 = L98_106
    L2_10 = L97_105
    L1_9 = L96_104
    if L63_71 == "1" and L64_72 == "1" then
      L14_22 = _UPVALUE23_
    end
  end
  L94_102 = connectionTypeToString
  L95_103 = L14_22
  L94_102 = L94_102(L95_103)
  L14_22 = L94_102
  L94_102 = _UPVALUE1_
  if L3_11 == L94_102 then
    L94_102 = _UPVALUE9_
    L94_102 = L94_102.connectionTypeGet
    L95_103 = _UPVALUE3_
    L96_104 = _UPVALUE24_
    L96_104 = L94_102(L95_103, L96_104)
    L54_62 = L96_104
    L2_10 = L95_103
    L1_9 = L94_102
    if L65_73 == "WAN2" then
      L94_102 = _UPVALUE9_
      L94_102 = L94_102.connectionTypeGet
      L95_103 = _UPVALUE6_
      L96_104 = _UPVALUE10_
      L96_104 = L94_102(L95_103, L96_104)
      L15_23 = L96_104
      L2_10 = L95_103
      L1_9 = L94_102
      L94_102 = _UPVALUE9_
      L94_102 = L94_102.connectionTypeGet
      L95_103 = _UPVALUE6_
      L96_104 = _UPVALUE24_
      L96_104 = L94_102(L95_103, L96_104)
      L55_63 = L96_104
      L2_10 = L95_103
      L1_9 = L94_102
      L94_102 = _UPVALUE14_
      if L15_23 == L94_102 then
        L55_63 = _UPVALUE15_
      end
      L94_102 = _UPVALUE5_
      L94_102 = L94_102.NIL
      if L55_63 == L94_102 then
        L55_63 = _UPVALUE25_
      else
        L94_102 = connectionType6ToString
        L95_103 = L55_63
        L94_102 = L94_102(L95_103)
        L55_63 = L94_102
      end
    end
    L94_102 = _UPVALUE5_
    L94_102 = L94_102.NIL
    if L54_62 == L94_102 then
      L54_62 = _UPVALUE25_
    else
      L94_102 = connectionType6ToString
      L95_103 = L54_62
      L94_102 = L94_102(L95_103)
      L54_62 = L94_102
    end
  end
  L94_102 = _UPVALUE9_
  L94_102 = L94_102.connectionTypeGet
  L95_103 = _UPVALUE26_
  L96_104 = _UPVALUE10_
  L96_104 = L94_102(L95_103, L96_104)
  L16_24 = L96_104
  L2_10 = L95_103
  L1_9 = L94_102
  L94_102 = connectionTypeToString
  L95_103 = L16_24
  L94_102 = L94_102(L95_103)
  L16_24 = L94_102
  L94_102 = _UPVALUE9_
  L94_102 = L94_102.connectionTypeGet
  L95_103 = _UPVALUE26_
  L96_104 = _UPVALUE24_
  L96_104 = L94_102(L95_103, L96_104)
  L58_66 = L96_104
  L2_10 = L95_103
  L1_9 = L94_102
  L94_102 = connectionTypeToString
  L95_103 = L58_66
  L94_102 = L94_102(L95_103)
  L58_66 = L94_102
  L94_102 = _UPVALUE27_
  if L16_24 == L94_102 then
    L94_102 = _UPVALUE2_
    L94_102 = L94_102.macAddressGet
    L95_103 = _UPVALUE26_
    L95_103 = L94_102(L95_103)
    L13_21[1] = L95_103
    L1_9 = L94_102
  end
  L94_102 = _UPVALUE2_
  L94_102 = L94_102.optionStatusGet
  L95_103 = _UPVALUE3_
  L95_103 = L94_102(L95_103)
  L17_25 = L95_103
  L1_9 = L94_102
  L91_99 = L17_25
  L94_102 = optionStatusToString
  L95_103 = L17_25
  L96_104 = L14_22
  L97_105 = _UPVALUE3_
  L94_102 = L94_102(L95_103, L96_104, L97_105)
  L17_25 = L94_102
  L94_102 = _UPVALUE2_
  L94_102 = L94_102.connectionStatusGet
  L95_103 = _UPVALUE3_
  L96_104 = _UPVALUE10_
  L95_103 = L94_102(L95_103, L96_104)
  L20_28 = L95_103
  L1_9 = L94_102
  if L65_73 == "WAN2" then
    L94_102 = _UPVALUE2_
    L94_102 = L94_102.optionStatusGet
    L95_103 = _UPVALUE6_
    L95_103 = L94_102(L95_103)
    L18_26 = L95_103
    L1_9 = L94_102
    L92_100 = L18_26
    L94_102 = optionStatusToString
    L95_103 = L18_26
    L96_104 = L15_23
    L97_105 = _UPVALUE6_
    L94_102 = L94_102(L95_103, L96_104, L97_105)
    L18_26 = L94_102
    L94_102 = _UPVALUE2_
    L94_102 = L94_102.connectionStatusGet
    L95_103 = _UPVALUE6_
    L96_104 = _UPVALUE10_
    L95_103 = L94_102(L95_103, L96_104)
    L21_29 = L95_103
    L1_9 = L94_102
  end
  L94_102 = _UPVALUE2_
  L94_102 = L94_102.optionStatusGet
  L95_103 = _UPVALUE26_
  L95_103 = L94_102(L95_103)
  L19_27 = L95_103
  L1_9 = L94_102
  L93_101 = L19_27
  L94_102 = optionStatusToString
  L95_103 = L19_27
  L96_104 = L16_24
  L97_105 = _UPVALUE26_
  L94_102 = L94_102(L95_103, L96_104, L97_105)
  L19_27 = L94_102
  L94_102 = _UPVALUE2_
  L94_102 = L94_102.connectionStatusGet
  L95_103 = _UPVALUE26_
  L96_104 = _UPVALUE10_
  L95_103 = L94_102(L95_103, L96_104)
  L22_30 = L95_103
  L1_9 = L94_102
  L94_102 = _UPVALUE1_
  if L3_11 == L94_102 then
    L94_102 = _UPVALUE2_
    L94_102 = L94_102.connectionStatusGet
    L95_103 = _UPVALUE3_
    L96_104 = _UPVALUE24_
    L95_103 = L94_102(L95_103, L96_104)
    L23_31 = L95_103
    L1_9 = L94_102
    if L65_73 == "WAN2" then
      L94_102 = _UPVALUE14_
      if L15_23 ~= L94_102 then
        L94_102 = _UPVALUE2_
        L94_102 = L94_102.connectionStatusGet
        L95_103 = _UPVALUE6_
        L96_104 = _UPVALUE24_
        L95_103 = L94_102(L95_103, L96_104)
        L25_33 = L95_103
        L1_9 = L94_102
      end
    end
    L94_102 = _UPVALUE2_
    L94_102 = L94_102.connectionStatusGet
    L95_103 = _UPVALUE26_
    L96_104 = _UPVALUE24_
    L95_103 = L94_102(L95_103, L96_104)
    L24_32 = L95_103
    L1_9 = L94_102
  else
    L23_31 = _UPVALUE25_
    if L65_73 == "WAN2" then
      L94_102 = _UPVALUE14_
      if L15_23 ~= L94_102 then
        L25_33 = _UPVALUE25_
      end
    end
    L24_32 = _UPVALUE25_
  end
  L94_102 = UNIT_NAME
  if L94_102 ~= "DSR-250N" then
    L94_102 = UNIT_NAME
    if L94_102 ~= "DSR-250" then
      L94_102 = UNIT_NAME
      if L94_102 ~= "DSR-150N" then
        L94_102 = UNIT_NAME
        if L94_102 ~= "DSR-150" then
          L94_102 = _UPVALUE28_
          L94_102 = L94_102.routingBridgeModeGet
          L96_104 = L94_102()
          L27_35 = L96_104
          L2_10 = L95_103
          L1_9 = L94_102
        end
      end
    end
  else
    L94_102 = _UPVALUE28_
    L94_102 = L94_102.routingModeGet
    L96_104 = L94_102()
    L27_35 = L96_104
    L2_10 = L95_103
    L1_9 = L94_102
  end
  if nil ~= L27_35 then
    L27_35 = L27_35.routeMode
    if L27_35 == "1" then
      L26_34 = _UPVALUE29_
    else
      L26_34 = _UPVALUE30_
    end
  else
    L26_34 = _UPVALUE30_
  end
  L94_102 = _UPVALUE2_
  L94_102 = L94_102.linkStateGet
  L95_103 = _UPVALUE3_
  L96_104 = _UPVALUE10_
  L95_103 = L94_102(L95_103, L96_104)
  L56_64 = L95_103
  L1_9 = L94_102
  L94_102 = _UPVALUE2_
  L94_102 = L94_102.ipAddressInfoGet
  L95_103 = _UPVALUE3_
  L96_104 = _UPVALUE10_
  L95_103 = L94_102(L95_103, L96_104)
  L28_36 = L95_103
  L1_9 = L94_102
  if L65_73 == "WAN2" then
    L94_102 = _UPVALUE2_
    L94_102 = L94_102.linkStateGet
    L95_103 = _UPVALUE6_
    L96_104 = _UPVALUE10_
    L95_103 = L94_102(L95_103, L96_104)
    L57_65 = L95_103
    L1_9 = L94_102
    L94_102 = _UPVALUE2_
    L94_102 = L94_102.ipAddressInfoGet
    L95_103 = _UPVALUE6_
    L96_104 = _UPVALUE10_
    L95_103 = L94_102(L95_103, L96_104)
    L30_38 = L95_103
    L1_9 = L94_102
    L94_102 = ipAddressDisplay
    L95_103 = L15_23
    L96_104 = L30_38
    L97_105 = _UPVALUE6_
    L98_106 = L57_65
    L95_103 = L94_102(L95_103, L96_104, L97_105, L98_106)
    L73_81 = L95_103
    L37_45 = L94_102
    L94_102 = _UPVALUE31_
    if L15_23 == L94_102 then
      L94_102 = db
      L94_102 = L94_102.getRow
      L95_103 = "Pptp"
      L96_104 = "LogicalIfName"
      L97_105 = _UPVALUE6_
      L94_102 = L94_102(L95_103, L96_104, L97_105)
      L95_103 = L94_102["Pptp.GetIpFromIsp"]
      L96_104 = tonumber
      L97_105 = L95_103
      L96_104 = L96_104(L97_105)
      if L96_104 == 0 then
        L96_104 = L94_102["Pptp.Gateway"]
        L7_15 = L96_104 or ""
        L96_104 = L94_102["Pptp.NetMask"]
        L96_104 = L96_104 or ""
        mask = L96_104
        L96_104 = L94_102["Pptp.StaticIp"]
        L96_104 = L96_104 or ""
        ip = L96_104
        L96_104 = L94_102["Pptp.StaticDNS"]
        L8_16 = L96_104 or ""
        L96_104 = "0.0.0.0"
        L9_17 = L96_104 or ""
        L96_104 = L37_45
        L97_105 = ", "
        L98_106 = ip
        L99_107 = " / "
        L37_45 = L96_104 .. L97_105 .. L98_106 .. L99_107 .. mask .. " (Physical)"
      else
        L96_104 = io
        L96_104 = L96_104.open
        L97_105 = "/var/russia_pptp.conf"
        L98_106 = "r"
        L96_104 = L96_104(L97_105, L98_106)
        rPptp_file = L96_104
        L96_104, L97_105, L98_106 = nil, nil, nil
        L99_107 = rPptp_file
        if L99_107 then
          L99_107 = rPptp_file
          L99_107 = L99_107.read
          L99_107 = L99_107(L99_107, "*line")
          L7_15 = L99_107 or ""
          L99_107 = rPptp_file
          L99_107 = L99_107.read
          L99_107 = L99_107(L99_107, "*line")
          L97_105 = L99_107 or ""
          L99_107 = rPptp_file
          L99_107 = L99_107.read
          L99_107 = L99_107(L99_107, "*line")
          L98_106 = L99_107 or ""
          L99_107 = rPptp_file
          L99_107 = L99_107.read
          L99_107 = L99_107(L99_107, "*line")
          L8_16 = L99_107 or ""
          L99_107 = rPptp_file
          L99_107 = L99_107.read
          L99_107 = L99_107(L99_107, "*line")
          L9_17 = L99_107 or ""
          L99_107 = L37_45
          L37_45 = L99_107 .. ", " .. L98_106 .. " / " .. L97_105 .. " (Physical)"
          L99_107 = rPptp_file
          L99_107 = L99_107.close
          L99_107(L99_107)
        else
          L7_15 = "0.0.0.0"
          L97_105 = "0.0.0.0"
          L98_106 = "0.0.0.0"
          L8_16 = "0.0.0.0"
          L9_17 = "0.0.0.0"
          L99_107 = L37_45
          L37_45 = L99_107 .. ", 0.0.0.0 / 0.0.0.0 (Physical)"
        end
      end
    else
      L94_102 = _UPVALUE32_
      if L15_23 == L94_102 then
        L94_102 = db
        L94_102 = L94_102.getRow
        L95_103 = "L2tp"
        L96_104 = "LogicalIfName"
        L97_105 = _UPVALUE6_
        L94_102 = L94_102(L95_103, L96_104, L97_105)
        L95_103 = L94_102["L2tp.GetIpFromIsp"]
        L96_104 = tonumber
        L97_105 = L95_103
        L96_104 = L96_104(L97_105)
        if L96_104 == 0 then
          L96_104 = L94_102["L2tp.Gateway"]
          L7_15 = L96_104 or ""
          L96_104 = L94_102["L2tp.NetMask"]
          L96_104 = L96_104 or ""
          mask = L96_104
          L96_104 = L94_102["L2tp.StaticIp"]
          L96_104 = L96_104 or ""
          ip = L96_104
          L96_104 = L94_102["L2tp.StaticDNS"]
          L8_16 = L96_104 or ""
          L96_104 = "0.0.0.0"
          L9_17 = L96_104 or ""
          L96_104 = L37_45
          L97_105 = ", "
          L98_106 = ip
          L99_107 = " / "
          L37_45 = L96_104 .. L97_105 .. L98_106 .. L99_107 .. mask .. " (Physical)"
        else
          L96_104 = io
          L96_104 = L96_104.open
          L97_105 = "/var/russia_l2tp.conf"
          L98_106 = "r"
          L96_104 = L96_104(L97_105, L98_106)
          rL2tp_file = L96_104
          L96_104, L97_105, L98_106 = nil, nil, nil
          L99_107 = rL2tp_file
          if L99_107 then
            L99_107 = rL2tp_file
            L99_107 = L99_107.read
            L99_107 = L99_107(L99_107, "*line")
            L7_15 = L99_107 or ""
            L99_107 = rL2tp_file
            L99_107 = L99_107.read
            L99_107 = L99_107(L99_107, "*line")
            L97_105 = L99_107 or ""
            L99_107 = rL2tp_file
            L99_107 = L99_107.read
            L99_107 = L99_107(L99_107, "*line")
            L98_106 = L99_107 or ""
            L99_107 = rL2tp_file
            L99_107 = L99_107.read
            L99_107 = L99_107(L99_107, "*line")
            L8_16 = L99_107 or ""
            L99_107 = rL2tp_file
            L99_107 = L99_107.read
            L99_107 = L99_107(L99_107, "*line")
            L9_17 = L99_107 or ""
            L99_107 = L37_45
            L37_45 = L99_107 .. ", " .. L98_106 .. " / " .. L97_105 .. " (Physical)"
            L99_107 = rL2tp_file
            L99_107 = L99_107.close
            L99_107(L99_107)
          else
            L7_15 = "0.0.0.0"
            L97_105 = "0.0.0.0"
            L98_106 = "0.0.0.0"
            L8_16 = "0.0.0.0"
            L9_17 = "0.0.0.0"
            L99_107 = L37_45
            L37_45 = L99_107 .. ", 0.0.0.0 / 0.0.0.0 (Physical)"
          end
        end
      end
    end
    L12_20[2] = L37_45
  else
    L94_102 = _UPVALUE2_
    L94_102 = L94_102.ipAddressInfoGet
    L95_103 = _UPVALUE7_
    L96_104 = _UPVALUE10_
    L95_103 = L94_102(L95_103, L96_104)
    L68_76 = L95_103
    L1_9 = L94_102
    L94_102 = ipAddressDisplay
    L95_103 = ""
    L96_104 = L68_76
    L94_102 = L94_102(L95_103, L96_104)
    L12_20[2] = L94_102
  end
  L94_102 = _UPVALUE2_
  L94_102 = L94_102.ipAddressInfoGet
  L95_103 = _UPVALUE8_
  L96_104 = _UPVALUE10_
  L95_103 = L94_102(L95_103, L96_104)
  L34_42 = L95_103
  L1_9 = L94_102
  L94_102 = ipAddressDisplay
  L95_103 = L14_22
  L96_104 = L28_36
  L97_105 = _UPVALUE3_
  L98_106 = L56_64
  L95_103 = L94_102(L95_103, L96_104, L97_105, L98_106)
  L72_80 = L95_103
  L36_44 = L94_102
  L94_102 = _UPVALUE31_
  if L14_22 == L94_102 then
    L94_102 = db
    L94_102 = L94_102.getRow
    L95_103 = "Pptp"
    L96_104 = "LogicalIfName"
    L97_105 = _UPVALUE3_
    L94_102 = L94_102(L95_103, L96_104, L97_105)
    L95_103 = L94_102["Pptp.GetIpFromIsp"]
    L96_104 = tonumber
    L97_105 = L95_103
    L96_104 = L96_104(L97_105)
    if L96_104 == 0 then
      L96_104 = L94_102["Pptp.Gateway"]
      L4_12 = L96_104 or ""
      L96_104 = L94_102["Pptp.NetMask"]
      L96_104 = L96_104 or ""
      mask = L96_104
      L96_104 = L94_102["Pptp.StaticIp"]
      L96_104 = L96_104 or ""
      ip = L96_104
      L96_104 = L94_102["Pptp.StaticDNS"]
      L5_13 = L96_104 or ""
      L96_104 = "0.0.0.0"
      L6_14 = L96_104 or ""
      L96_104 = L36_44
      L97_105 = ", "
      L98_106 = ip
      L99_107 = " / "
      L36_44 = L96_104 .. L97_105 .. L98_106 .. L99_107 .. mask .. " (Physical)"
    else
      L96_104 = io
      L96_104 = L96_104.open
      L97_105 = "/var/russia_pptp.conf"
      L98_106 = "r"
      L96_104 = L96_104(L97_105, L98_106)
      rPptp_file = L96_104
      L96_104, L97_105, L98_106 = nil, nil, nil
      L99_107 = rPptp_file
      if L99_107 then
        L99_107 = rPptp_file
        L99_107 = L99_107.read
        L99_107 = L99_107(L99_107, "*line")
        L4_12 = L99_107 or ""
        L99_107 = rPptp_file
        L99_107 = L99_107.read
        L99_107 = L99_107(L99_107, "*line")
        L97_105 = L99_107 or ""
        L99_107 = rPptp_file
        L99_107 = L99_107.read
        L99_107 = L99_107(L99_107, "*line")
        L98_106 = L99_107 or ""
        L99_107 = rPptp_file
        L99_107 = L99_107.read
        L99_107 = L99_107(L99_107, "*line")
        L5_13 = L99_107 or ""
        L99_107 = rPptp_file
        L99_107 = L99_107.read
        L99_107 = L99_107(L99_107, "*line")
        L6_14 = L99_107 or ""
        L99_107 = L36_44
        L36_44 = L99_107 .. ", " .. L98_106 .. " / " .. L97_105 .. " (Physical)"
        L99_107 = rPptp_file
        L99_107 = L99_107.close
        L99_107(L99_107)
      else
        L4_12 = "0.0.0.0"
        L97_105 = "0.0.0.0"
        L98_106 = "0.0.0.0"
        L5_13 = "0.0.0.0"
        L6_14 = "0.0.0.0"
        L99_107 = L36_44
        L36_44 = L99_107 .. ", 0.0.0.0 / 0.0.0.0 (Physical)"
      end
    end
  else
    L94_102 = _UPVALUE32_
    if L14_22 == L94_102 then
      L94_102 = db
      L94_102 = L94_102.getRow
      L95_103 = "L2tp"
      L96_104 = "LogicalIfName"
      L97_105 = _UPVALUE3_
      L94_102 = L94_102(L95_103, L96_104, L97_105)
      L95_103 = L94_102["L2tp.GetIpFromIsp"]
      L96_104 = tonumber
      L97_105 = L95_103
      L96_104 = L96_104(L97_105)
      if L96_104 == 0 then
        L96_104 = L94_102["L2tp.Gateway"]
        L4_12 = L96_104 or ""
        L96_104 = L94_102["L2tp.NetMask"]
        L96_104 = L96_104 or ""
        mask = L96_104
        L96_104 = L94_102["L2tp.StaticIp"]
        L96_104 = L96_104 or ""
        ip = L96_104
        L96_104 = L94_102["L2tp.StaticDNS"]
        L5_13 = L96_104 or ""
        L6_14 = "0.0.0.0"
        L96_104 = L36_44
        L97_105 = ", "
        L98_106 = ip
        L99_107 = " / "
        L36_44 = L96_104 .. L97_105 .. L98_106 .. L99_107 .. mask .. " (Physical)"
      else
        L96_104 = io
        L96_104 = L96_104.open
        L97_105 = "/var/russia_l2tp.conf"
        L98_106 = "r"
        L96_104 = L96_104(L97_105, L98_106)
        rL2tp_file = L96_104
        L96_104, L97_105, L98_106 = nil, nil, nil
        L99_107 = rL2tp_file
        if L99_107 then
          L99_107 = rL2tp_file
          L99_107 = L99_107.read
          L99_107 = L99_107(L99_107, "*line")
          L4_12 = L99_107 or ""
          L99_107 = rL2tp_file
          L99_107 = L99_107.read
          L99_107 = L99_107(L99_107, "*line")
          L97_105 = L99_107 or ""
          L99_107 = rL2tp_file
          L99_107 = L99_107.read
          L99_107 = L99_107(L99_107, "*line")
          L98_106 = L99_107 or ""
          L99_107 = rL2tp_file
          L99_107 = L99_107.read
          L99_107 = L99_107(L99_107, "*line")
          L5_13 = L99_107 or ""
          L99_107 = rL2tp_file
          L99_107 = L99_107.read
          L99_107 = L99_107(L99_107, "*line")
          L6_14 = L99_107 or ""
          L99_107 = L36_44
          L36_44 = L99_107 .. ", " .. L98_106 .. " / " .. L97_105 .. " (Physical)"
          L99_107 = rL2tp_file
          L99_107 = L99_107.close
          L99_107(L99_107)
        else
          L4_12 = "0.0.0.0"
          L97_105 = "0.0.0.0"
          L98_106 = "0.0.0.0"
          L5_13 = "0.0.0.0"
          L6_14 = "0.0.0.0"
          L99_107 = L36_44
          L36_44 = L99_107 .. ", 0.0.0.0 / 0.0.0.0 (Physical)"
        end
      end
    end
  end
  L11_19[2] = L36_44
  L94_102 = _UPVALUE2_
  L94_102 = L94_102.linkStateGet
  L95_103 = _UPVALUE26_
  L96_104 = _UPVALUE10_
  L95_103 = L94_102(L95_103, L96_104)
  L59_67 = L95_103
  L1_9 = L94_102
  L94_102 = _UPVALUE2_
  L94_102 = L94_102.ipAddressInfoGet
  L95_103 = _UPVALUE26_
  L96_104 = _UPVALUE10_
  L95_103 = L94_102(L95_103, L96_104)
  L32_40 = L95_103
  L1_9 = L94_102
  L94_102 = ipAddressDisplay
  L95_103 = L16_24
  L96_104 = L32_40
  L97_105 = _UPVALUE26_
  L98_106 = L59_67
  L95_103 = L94_102(L95_103, L96_104, L97_105, L98_106)
  L74_82 = L95_103
  option3ipAddrStr4 = L94_102
  L94_102 = option3ipAddrStr4
  L13_21[2] = L94_102
  L94_102 = _UPVALUE1_
  if L3_11 == L94_102 then
    if L54_62 == "PPPoE over IPv6" then
      L94_102 = _UPVALUE2_
      L94_102 = L94_102.ipAddressInfoGet
      L95_103 = _UPVALUE33_
      L96_104 = _UPVALUE24_
      L95_103 = L94_102(L95_103, L96_104)
      L29_37 = L95_103
      L1_9 = L94_102
    else
      L94_102 = _UPVALUE2_
      L94_102 = L94_102.ipAddressInfoGet
      L95_103 = _UPVALUE3_
      L96_104 = _UPVALUE24_
      L95_103 = L94_102(L95_103, L96_104)
      L29_37 = L95_103
      L1_9 = L94_102
    end
    if L65_73 == "WAN2" then
      L94_102 = _UPVALUE14_
      if L15_23 ~= L94_102 then
        L94_102 = _UPVALUE9_
        L94_102 = L94_102.connectionTypeGet
        L95_103 = _UPVALUE6_
        L96_104 = _UPVALUE10_
        L96_104 = L94_102(L95_103, L96_104)
        L15_23 = L96_104
        L2_10 = L95_103
        L1_9 = L94_102
        if L55_63 == "PPPoE over IPv6" then
          L94_102 = _UPVALUE2_
          L94_102 = L94_102.ipAddressInfoGet
          L95_103 = _UPVALUE34_
          L96_104 = _UPVALUE24_
          L95_103 = L94_102(L95_103, L96_104)
          L31_39 = L95_103
          L1_9 = L94_102
        else
          L94_102 = _UPVALUE2_
          L94_102 = L94_102.ipAddressInfoGet
          L95_103 = _UPVALUE6_
          L96_104 = _UPVALUE24_
          L95_103 = L94_102(L95_103, L96_104)
          L31_39 = L95_103
          L1_9 = L94_102
        end
        L94_102 = _UPVALUE35_
        L95_103 = "."
        L96_104 = _UPVALUE36_
        L96_104 = L96_104.ipv6PrefixLen
        L94_102 = L94_102 .. L95_103 .. L96_104
        L61_69 = L31_39[L94_102]
        L94_102 = ipAddressDisplay6
        L95_103 = L31_39
        L95_103 = L94_102(L95_103)
        L61_69 = L95_103
        option2ipAddrStr6 = L94_102
      end
    elseif L65_73 == "DMZ" then
      L94_102 = _UPVALUE2_
      L94_102 = L94_102.ipAddressInfoGet
      L95_103 = _UPVALUE7_
      L96_104 = _UPVALUE24_
      L95_103 = L94_102(L95_103, L96_104)
      L69_77 = L95_103
      L1_9 = L94_102
      L94_102 = ipAddressDisplay6
      L95_103 = L69_77
      L94_102 = L94_102(L95_103)
      L70_78 = L94_102
    end
    L94_102 = _UPVALUE2_
    L94_102 = L94_102.ipAddressInfoGet
    L95_103 = _UPVALUE8_
    L96_104 = _UPVALUE24_
    L95_103 = L94_102(L95_103, L96_104)
    L35_43 = L95_103
    L1_9 = L94_102
    L94_102 = ipAddressDisplay6
    L95_103 = L29_37
    L95_103 = L94_102(L95_103)
    L60_68 = L95_103
    option1ipAddrStr6 = L94_102
    L94_102 = _UPVALUE2_
    L94_102 = L94_102.ipAddressInfoGet
    L95_103 = _UPVALUE26_
    L96_104 = _UPVALUE24_
    L95_103 = L94_102(L95_103, L96_104)
    L33_41 = L95_103
    L1_9 = L94_102
    L94_102 = _UPVALUE35_
    L95_103 = "."
    L96_104 = _UPVALUE36_
    L96_104 = L96_104.ipv6PrefixLen
    L94_102 = L94_102 .. L95_103 .. L96_104
    L66_74 = L33_41[L94_102]
    L94_102 = ipAddressDisplay6
    L95_103 = L33_41
    L95_103 = L94_102(L95_103)
    L66_74 = L95_103
    option3ipAddrStr6 = L94_102
    L94_102 = ipAddressDisplay6
    L95_103 = L35_43
    L94_102 = L94_102(L95_103)
    L39_47 = L94_102
  end
  L94_102 = option1ipAddrStr6
  L11_19[3] = L94_102
  if L65_73 == "WAN2" then
    L94_102 = option2ipAddrStr6
    L12_20[3] = L94_102
  elseif L65_73 == "DMZ" then
    L12_20[3] = L70_78
  end
  L94_102 = option3ipAddrStr6
  L13_21[3] = L94_102
  if L65_73 == "WAN2" then
    L94_102 = _UPVALUE31_
    if L15_23 == L94_102 then
      L94_102 = db
      L94_102 = L94_102.getAttribute
      L95_103 = "Pptp"
      L96_104 = "LogicalIfName"
      L97_105 = _UPVALUE6_
      L98_106 = "GetIpFromIsp"
      L94_102 = L94_102(L95_103, L96_104, L97_105, L98_106)
      L95_103 = ""
      L96_104 = io
      L96_104 = L96_104.open
      L97_105 = "/var/russia_pptp.conf"
      L98_106 = "r"
      L96_104 = L96_104(L97_105, L98_106)
      isFile = L96_104
      L96_104 = isFile
      if L96_104 then
        L95_103 = "UP"
        L96_104 = isFile
        L97_105 = L96_104
        L96_104 = L96_104.close
        L96_104(L97_105)
      else
        L95_103 = "DOWN"
      end
      L96_104 = tonumber
      L97_105 = L94_102
      L96_104 = L96_104(L97_105)
      if L96_104 == 0 then
        L95_103 = "DOWN"
        if L57_65 == "LINK UP" then
          L95_103 = "UP"
        end
      end
      L96_104 = L18_26
      L97_105 = ", "
      L98_106 = L95_103
      L99_107 = " (Physical)"
      L18_26 = L96_104 .. L97_105 .. L98_106 .. L99_107
    else
      L94_102 = _UPVALUE32_
      if L15_23 == L94_102 then
        L94_102 = ""
        L95_103 = db
        L95_103 = L95_103.getAttribute
        L96_104 = "L2tp"
        L97_105 = "LogicalIfName"
        L98_106 = _UPVALUE6_
        L99_107 = "GetIpFromIsp"
        L95_103 = L95_103(L96_104, L97_105, L98_106, L99_107)
        L96_104 = io
        L96_104 = L96_104.open
        L97_105 = "/var/russia_l2tp.conf"
        L98_106 = "r"
        L96_104 = L96_104(L97_105, L98_106)
        isFile = L96_104
        L96_104 = isFile
        if L96_104 then
          L94_102 = "UP"
          L96_104 = isFile
          L97_105 = L96_104
          L96_104 = L96_104.close
          L96_104(L97_105)
        else
          L94_102 = "DOWN"
        end
        L96_104 = tonumber
        L97_105 = L95_103
        L96_104 = L96_104(L97_105)
        if L96_104 == 0 then
          L94_102 = "DOWN"
          if L57_65 == "LINK UP" then
            L94_102 = "UP"
          end
        end
        L96_104 = L18_26
        L97_105 = ", "
        L98_106 = L94_102
        L99_107 = " (Physical)"
        L18_26 = L96_104 .. L97_105 .. L98_106 .. L99_107
      end
    end
    L12_20[4] = L18_26
  else
    L94_102 = _UPVALUE37_
    L12_20[4] = L94_102
  end
  if L65_73 == "WAN2" then
    L12_20[5] = L55_63
    L12_20[6] = L25_33
    L12_20[7] = L61_69
    L12_20[8] = L26_34
    L12_20[9] = L15_23
    L12_20[10] = L21_29
    L12_20[11] = L57_65
  end
  L94_102 = _UPVALUE31_
  if L14_22 == L94_102 then
    L94_102 = ""
    L95_103 = db
    L95_103 = L95_103.getAttribute
    L96_104 = "Pptp"
    L97_105 = "LogicalIfName"
    L98_106 = _UPVALUE3_
    L99_107 = "GetIpFromIsp"
    L95_103 = L95_103(L96_104, L97_105, L98_106, L99_107)
    L96_104 = io
    L96_104 = L96_104.open
    L97_105 = "/var/russia_pptp.conf"
    L98_106 = "r"
    L96_104 = L96_104(L97_105, L98_106)
    isFile = L96_104
    L96_104 = isFile
    if L96_104 then
      L94_102 = "UP"
      L96_104 = isFile
      L97_105 = L96_104
      L96_104 = L96_104.close
      L96_104(L97_105)
    else
      L94_102 = "DOWN"
    end
    L96_104 = tonumber
    L97_105 = L95_103
    L96_104 = L96_104(L97_105)
    if L96_104 == 0 then
      L94_102 = "DOWN"
      if L56_64 == "LINK UP" then
        L94_102 = "UP"
      end
    end
    L96_104 = L17_25
    L97_105 = ", "
    L98_106 = L94_102
    L99_107 = " (Physical)"
    L17_25 = L96_104 .. L97_105 .. L98_106 .. L99_107
  else
    L94_102 = _UPVALUE32_
    if L14_22 == L94_102 then
      L94_102 = ""
      L95_103 = db
      L95_103 = L95_103.getAttribute
      L96_104 = "L2tp"
      L97_105 = "LogicalIfName"
      L98_106 = _UPVALUE3_
      L99_107 = "GetIpFromIsp"
      L95_103 = L95_103(L96_104, L97_105, L98_106, L99_107)
      L96_104 = io
      L96_104 = L96_104.open
      L97_105 = "/var/russia_l2tp.conf"
      L98_106 = "r"
      L96_104 = L96_104(L97_105, L98_106)
      isFile = L96_104
      L96_104 = isFile
      if L96_104 then
        L94_102 = "UP"
        L96_104 = isFile
        L97_105 = L96_104
        L96_104 = L96_104.close
        L96_104(L97_105)
      else
        L94_102 = "DOWN"
      end
      L96_104 = tonumber
      L97_105 = L95_103
      L96_104 = L96_104(L97_105)
      if L96_104 == 0 then
        L94_102 = "DOWN"
        if L56_64 == "LINK UP" then
          L94_102 = "UP"
        end
      end
      L96_104 = L17_25
      L97_105 = ", "
      L98_106 = L94_102
      L99_107 = " (Physical)"
      L17_25 = L96_104 .. L97_105 .. L98_106 .. L99_107
    end
  end
  L11_19[4] = L17_25
  L11_19[5] = L54_62
  L11_19[6] = L23_31
  L11_19[7] = L60_68
  L11_19[8] = L26_34
  L11_19[9] = L14_22
  L11_19[10] = L20_28
  L11_19[11] = L56_64
  L13_21[4] = L19_27
  L13_21[5] = L58_66
  L13_21[6] = L24_32
  L13_21[7] = L66_74
  L13_21[8] = L26_34
  L13_21[9] = L16_24
  L13_21[10] = L22_30
  L13_21[11] = L59_67
  L94_102 = _UPVALUE38_
  L94_102 = L94_102.multiWanModeGet
  L96_104 = L94_102()
  L42_50 = L96_104
  L2_10 = L95_103
  L1_9 = L94_102
  L94_102 = wanModeDisplay
  L95_103 = L42_50
  L94_102 = L94_102(L95_103)
  L42_50 = L94_102
  L11_19[12] = L42_50
  L13_21[12] = L42_50
  L94_102 = _UPVALUE2_
  L94_102 = L94_102.gatewayRoutesGet
  L95_103 = _UPVALUE3_
  L95_103 = L94_102(L95_103)
  L40_48 = L95_103
  L1_9 = L94_102
  L94_102, L95_103, L96_104 = nil, nil, nil
  L96_104 = "LogicalIfName = 'WAN1'"
  L97_105 = db
  L97_105 = L97_105.getAttributeWhere
  L98_106 = "Pppoe6"
  L99_107 = L96_104
  L97_105 = L97_105(L98_106, L99_107, "PppoeSessions")
  L94_102 = L97_105
  L97_105 = tonumber
  L98_106 = L94_102
  L97_105 = L97_105(L98_106)
  if L97_105 == 2 then
    L97_105 = db
    L97_105 = L97_105.getAttributeWhere
    L98_106 = "defaultRouters"
    L99_107 = "LogicalIfName = 'WAN1' and addressFamily=10"
    L97_105 = L97_105(L98_106, L99_107, "nextHopGateway")
    L98_106 = _UPVALUE5_
    L98_106 = L98_106.EMPTY
    if L97_105 ~= L98_106 then
      L98_106 = _UPVALUE5_
      L98_106 = L98_106.NIL
    elseif L97_105 == L98_106 then
      L98_106 = io
      L98_106 = L98_106.open
      L99_107 = "/tmp/pppoe6CommonSessionGW.WAN1"
      L98_106 = L98_106(L99_107, "r")
      file = L98_106
      L98_106 = file
      if L98_106 then
        L98_106 = file
        L99_107 = L98_106
        L98_106 = L98_106.read
        L98_106 = L98_106(L99_107, "*all")
        L95_103 = L98_106 or ""
        L98_106 = L40_48
        L99_107 = ","
        L40_48 = L98_106 .. L99_107 .. L95_103
        L98_106 = file
        L99_107 = L98_106
        L98_106 = L98_106.close
        L98_106(L99_107)
      end
    end
  end
  L97_105 = gatewayDisplay
  L98_106 = L40_48
  L99_107 = L14_22
  L97_105 = L97_105(L98_106, L99_107, L72_80, _UPVALUE3_)
  L40_48 = L97_105
  L97_105 = _UPVALUE2_
  L97_105 = L97_105.gatewayRoutesGet
  L98_106 = _UPVALUE26_
  L98_106 = L97_105(L98_106)
  L46_54 = L98_106
  L1_9 = L97_105
  L97_105 = gatewayDisplay
  L98_106 = L46_54
  L99_107 = L16_24
  L97_105 = L97_105(L98_106, L99_107, L74_82, _UPVALUE26_)
  L46_54 = L97_105
  if L65_73 == "WAN2" then
    L12_20[12] = L42_50
    L97_105 = _UPVALUE2_
    L97_105 = L97_105.gatewayRoutesGet
    L98_106 = _UPVALUE6_
    L98_106 = L97_105(L98_106)
    L41_49 = L98_106
    L1_9 = L97_105
    L97_105, L98_106, L99_107 = nil, nil, nil
    L99_107 = "LogicalIfName = 'WAN2'"
    L97_105 = db.getAttributeWhere("Pppoe6", L99_107, "PppoeSessions")
    if tonumber(L97_105) == 2 and (db.getAttributeWhere("defaultRouters", "LogicalIfName = 'WAN2' and addressFamily=10", "nextHopGateway") == _UPVALUE5_.EMPTY or db.getAttributeWhere("defaultRouters", "LogicalIfName = 'WAN2' and addressFamily=10", "nextHopGateway") == _UPVALUE5_.NIL) then
      file = io.open("/tmp/pppoe6CommonSessionGW.WAN2", "r")
      if file then
        L98_106 = file:read("*all") or ""
        L41_49 = L41_49 .. "," .. L98_106
        file:close()
      end
    end
    L41_49 = gatewayDisplay(L41_49, L15_23, L73_81, _UPVALUE6_)
    if L15_23 == _UPVALUE31_ then
      L41_49 = L41_49 .. ", " .. L7_15 .. " (Physical)"
      L12_20[13] = L41_49 or ""
    elseif L15_23 == _UPVALUE32_ then
      L41_49 = L41_49 .. ", " .. L7_15 .. " (Physical)"
      L12_20[13] = L41_49 or ""
    else
      L12_20[13] = L41_49 or ""
    end
    L1_9, L51_59, L49_57, L77_85, L78_86 = _UPVALUE2_.dnsServersGet(_UPVALUE6_, _UPVALUE10_)
    if L3_11 == _UPVALUE1_ then
      L1_9, L79_87, L80_88, L81_89, L82_90 = _UPVALUE2_.dnsServersGet(_UPVALUE6_, _UPVALUE24_)
      if L51_59 == "" or L51_59 == _UPVALUE5_.NIL then
        L51_59 = L79_87 or ""
      elseif L79_87 ~= _UPVALUE5_.NIL and L79_87 ~= "" then
        L51_59 = L51_59 .. "," .. L79_87
      end
      if L80_88 == "" or L80_88 == _UPVALUE5_.NIL then
        L80_88 = L80_88 or ""
      elseif L80_88 ~= _UPVALUE5_.NIL and L80_88 ~= "" then
        L49_57 = L49_57 .. "," .. L80_88
      end
    end
    L51_59 = primaryDnsDisplay(L15_23, L51_59, L77_85, _UPVALUE6_)
    L49_57 = SecondaryDnsDisplay(L15_23, L49_57, L78_86, _UPVALUE6_)
    if L15_23 == _UPVALUE31_ then
      L51_59 = L51_59 .. ", " .. L8_16 .. " (Physical)"
      L12_20[14] = L51_59 or ""
    elseif L15_23 == _UPVALUE32_ then
      L51_59 = L51_59 .. ", " .. L8_16 .. " (Physical)"
      L12_20[14] = L51_59 or ""
    else
      L12_20[14] = L51_59 or ""
    end
    if L15_23 == _UPVALUE31_ then
      L49_57 = L49_57 .. ", " .. L9_17 .. " (Physical)"
      L12_20[15] = L49_57 or ""
    elseif L15_23 == _UPVALUE32_ then
      L49_57 = L49_57 .. ", " .. L9_17 .. " (Physical)"
      L12_20[15] = L49_57 or ""
    else
      L12_20[15] = L49_57 or ""
    end
  end
  L97_105 = _UPVALUE31_
  if L14_22 == L97_105 then
    L97_105 = L40_48
    L98_106 = ", "
    L99_107 = L4_12
    L40_48 = L97_105 .. L98_106 .. L99_107 .. " (Physical)"
    L97_105 = L40_48 or ""
    L11_19[13] = L97_105
  else
    L97_105 = _UPVALUE32_
    if L14_22 == L97_105 then
      L97_105 = L40_48
      L98_106 = ", "
      L99_107 = L4_12
      L40_48 = L97_105 .. L98_106 .. L99_107 .. " (Physical)"
      L97_105 = L40_48 or ""
      L11_19[13] = L97_105
    else
      L97_105 = L40_48 or ""
      L11_19[13] = L97_105
    end
  end
  L97_105 = _UPVALUE2_
  L97_105 = L97_105.dnsServersGet
  L98_106 = _UPVALUE3_
  L99_107 = _UPVALUE10_
  L75_83, L76_84, L97_105 = " (Physical)", ", ", L97_105(L98_106, L99_107)
  L75_83, L76_84, L98_106 = " (Physical)", ", ", L97_105(L98_106, L99_107)
  L75_83, L76_84, L99_107 = " (Physical)", ", ", L97_105(L98_106, L99_107)
  L48_56 = L99_107
  L43_51 = L98_106
  L1_9 = L97_105
  L97_105 = L46_54 or ""
  L13_21[13] = L97_105
  L97_105 = UNIT_NAME
  if L97_105 ~= "DSR-1000" then
    L97_105 = UNIT_NAME
    if L97_105 ~= "DSR-1000N" then
      L97_105 = PRODUCT_ID
      if L97_105 ~= "DSR-1000AC_Ax" then
        L97_105 = PRODUCT_ID
      end
    end
  elseif L97_105 == "DSR-1000_Bx" then
    L97_105 = _UPVALUE2_
    L97_105 = L97_105.dnsServersGet
    L98_106 = _UPVALUE26_
    L99_107 = _UPVALUE10_
    option3ThirdDns, option3FourthDns, L99_107 = L97_105(L98_106, L99_107)
    L53_61 = L99_107
    L52_60 = L98_106
    L1_9 = L97_105
  end
  L97_105 = _UPVALUE1_
  if L3_11 == L97_105 then
    L97_105 = _UPVALUE2_
    L97_105 = L97_105.dnsServersGet
    L98_106 = _UPVALUE3_
    L99_107 = _UPVALUE24_
    L85_93, L86_94, L99_107 = L97_105(L98_106, L99_107)
    L84_92 = L99_107
    L83_91 = L98_106
    L1_9 = L97_105
    if L43_51 ~= "" then
      L97_105 = _UPVALUE5_
      L97_105 = L97_105.NIL
    else
      if L43_51 == L97_105 then
        L43_51 = L83_91 or ""
    end
    else
      L97_105 = _UPVALUE5_
      L97_105 = L97_105.NIL
      if L83_91 ~= L97_105 and L83_91 ~= "" then
        L97_105 = L43_51
        L98_106 = ","
        L99_107 = L83_91
        L43_51 = L97_105 .. L98_106 .. L99_107
      end
    end
    if L84_92 ~= "" then
      L97_105 = _UPVALUE5_
      L97_105 = L97_105.NIL
    else
      if L84_92 == L97_105 then
        L84_92 = L84_92 or ""
    end
    else
      L97_105 = _UPVALUE5_
      L97_105 = L97_105.NIL
      if L84_92 ~= L97_105 and L84_92 ~= "" then
        L97_105 = L48_56
        L98_106 = ","
        L99_107 = L84_92
        L48_56 = L97_105 .. L98_106 .. L99_107
      end
    end
  end
  L97_105 = _UPVALUE1_
  if L3_11 == L97_105 then
    L97_105 = UNIT_NAME
    if L97_105 ~= "DSR-1000" then
      L97_105 = UNIT_NAME
      if L97_105 ~= "DSR-1000N" then
        L97_105 = PRODUCT_ID
        if L97_105 ~= "DSR-1000AC_Ax" then
          L97_105 = PRODUCT_ID
        end
      end
    elseif L97_105 == "DSR-1000_Bx" then
      L97_105 = _UPVALUE2_
      L97_105 = L97_105.dnsServersGet
      L98_106 = _UPVALUE26_
      L99_107 = _UPVALUE24_
      L89_97, L90_98, L99_107 = L97_105(L98_106, L99_107)
      L88_96 = L99_107
      L87_95 = L98_106
      L1_9 = L97_105
    end
    if L52_60 ~= "" then
      L97_105 = _UPVALUE5_
      L97_105 = L97_105.NIL
    else
      if L52_60 == L97_105 then
        L52_60 = L87_95 or ""
    end
    else
      L97_105 = _UPVALUE5_
      L97_105 = L97_105.NIL
      if L87_95 ~= L97_105 and L87_95 ~= "" then
        L97_105 = L52_60
        L98_106 = ","
        L99_107 = L87_95
        L52_60 = L97_105 .. L98_106 .. L99_107
      end
    end
    if L88_96 ~= "" then
      L97_105 = _UPVALUE5_
      L97_105 = L97_105.NIL
    else
      if L88_96 == L97_105 then
        L88_96 = L88_96 or ""
    end
    else
      L97_105 = _UPVALUE5_
      L97_105 = L97_105.NIL
      if L88_96 ~= L97_105 and L88_96 ~= "" then
        L97_105 = L53_61
        L98_106 = ","
        L99_107 = L88_96
        L53_61 = L97_105 .. L98_106 .. L99_107
      end
    end
  end
  L97_105 = primaryDnsDisplay
  L98_106 = L14_22
  L99_107 = L43_51
  L97_105 = L97_105(L98_106, L99_107, L75_83, _UPVALUE3_)
  L43_51 = L97_105
  L97_105 = SecondaryDnsDisplay
  L98_106 = L14_22
  L99_107 = L48_56
  L97_105 = L97_105(L98_106, L99_107, L76_84, _UPVALUE3_)
  L48_56 = L97_105
  L97_105 = _UPVALUE31_
  if L14_22 == L97_105 then
    L97_105 = L43_51
    L98_106 = ", "
    L99_107 = L5_13
    L43_51 = L97_105 .. L98_106 .. L99_107 .. " (Physical)"
    L97_105 = L43_51 or ""
    L11_19[14] = L97_105
  else
    L97_105 = _UPVALUE32_
    if L14_22 == L97_105 then
      L97_105 = L43_51
      L98_106 = ", "
      L99_107 = L5_13
      L43_51 = L97_105 .. L98_106 .. L99_107 .. " (Physical)"
      L97_105 = L43_51 or ""
      L11_19[14] = L97_105
    else
      L97_105 = L43_51 or ""
      L11_19[14] = L97_105
    end
  end
  L97_105 = _UPVALUE31_
  if L14_22 == L97_105 then
    L97_105 = L48_56
    L98_106 = ", "
    L99_107 = L6_14
    L48_56 = L97_105 .. L98_106 .. L99_107 .. " (Physical)"
    L97_105 = L48_56 or ""
    L11_19[15] = L97_105
  else
    L97_105 = _UPVALUE32_
    if L14_22 == L97_105 then
      L97_105 = L48_56
      L98_106 = ", "
      L99_107 = L6_14
      L48_56 = L97_105 .. L98_106 .. L99_107 .. " (Physical)"
      L97_105 = L48_56 or ""
      L11_19[15] = L97_105
    else
      L97_105 = L48_56 or ""
      L11_19[15] = L97_105
    end
  end
  L97_105 = primaryDnsDisplay
  L98_106 = L16_24
  L99_107 = L52_60
  L97_105 = L97_105(L98_106, L99_107, option3ThirdDns, _UPVALUE26_)
  L52_60 = L97_105
  L97_105 = SecondaryDnsDisplay
  L98_106 = L16_24
  L99_107 = L53_61
  L97_105 = L97_105(L98_106, L99_107, option3FourthDns, _UPVALUE26_)
  L53_61 = L97_105
  L97_105 = L52_60 or ""
  L13_21[14] = L97_105
  L97_105 = L53_61 or ""
  L13_21[15] = L97_105
  L97_105 = _UPVALUE39_
  L97_105 = L97_105.dhcpTypeGet
  L99_107 = L97_105()
  L50_58 = L99_107
  L2_10 = L98_106
  L1_9 = L97_105
  L97_105 = ipAddressDisplay
  L98_106 = ""
  L99_107 = L34_42
  L97_105 = L97_105(L98_106, L99_107)
  L71_79 = L97_105
  L97_105 = _UPVALUE40_
  if L50_58 == L97_105 then
    L44_52 = _UPVALUE30_
    L45_53 = _UPVALUE30_
  else
    L97_105 = _UPVALUE41_
    if L50_58 == L97_105 then
      L44_52 = _UPVALUE29_
      L45_53 = _UPVALUE30_
    else
      L97_105 = _UPVALUE42_
      if L50_58 == L97_105 then
        L44_52 = _UPVALUE30_
        L45_53 = _UPVALUE29_
      end
    end
  end
  L97_105 = L71_79 or ""
  L10_18[2] = L97_105
  L10_18[3] = L39_47
  L97_105 = _UPVALUE37_
  L10_18[4] = L97_105
  L10_18[5] = L44_52
  L10_18[6] = L45_53
  L97_105 = _UPVALUE43_
  if L65_73 == L97_105 then
    L97_105 = _UPVALUE44_
    L97_105 = L97_105.dhcpTypeGet
    L99_107 = L97_105()
    L50_58 = L99_107
    L2_10 = L98_106
    L1_9 = L97_105
    L97_105 = _UPVALUE40_
    if L50_58 == L97_105 then
      L44_52 = _UPVALUE30_
      L45_53 = _UPVALUE30_
    else
      L97_105 = _UPVALUE41_
      if L50_58 == L97_105 then
        L44_52 = _UPVALUE29_
        L45_53 = _UPVALUE30_
      else
        L97_105 = _UPVALUE42_
        if L50_58 == L97_105 then
          L44_52 = _UPVALUE30_
          L45_53 = _UPVALUE29_
        end
      end
    end
    L12_20[16] = L44_52
    L12_20[17] = L45_53
  end
  L97_105 = _UPVALUE5_
  L97_105 = L97_105.SUCCESS
  L98_106 = L10_18
  L99_107 = L11_19
  return L97_105, L98_106, L99_107, L12_20, L13_21, L65_73
end
function wanDhcpStatus(A0_108)
  local L1_109
  L1_109 = _UPVALUE0_.wanDhcpStatusGet(A0_108, _UPVALUE1_)
  return L1_109
end
function connectionTypeToString(A0_110)
  local L1_111
  L1_111 = _UPVALUE0_
  if A0_110 == L1_111 then
    A0_110 = _UPVALUE1_
  else
    L1_111 = _UPVALUE2_
    if A0_110 == L1_111 then
      A0_110 = _UPVALUE3_
    else
      L1_111 = _UPVALUE4_
      if A0_110 == L1_111 then
        A0_110 = _UPVALUE5_
      else
        L1_111 = _UPVALUE6_
        if A0_110 == L1_111 then
          A0_110 = _UPVALUE7_
        else
          L1_111 = _UPVALUE8_
          if A0_110 == L1_111 then
            A0_110 = _UPVALUE9_
          else
            L1_111 = _UPVALUE10_
            if A0_110 == L1_111 then
              A0_110 = _UPVALUE11_
            else
              L1_111 = _UPVALUE12_
              if A0_110 == L1_111 then
                A0_110 = _UPVALUE13_
              else
                L1_111 = _UPVALUE14_
                if A0_110 == L1_111 then
                  A0_110 = _UPVALUE15_
                else
                  L1_111 = _UPVALUE16_
                  if A0_110 == L1_111 then
                    A0_110 = _UPVALUE17_
                  else
                    L1_111 = _UPVALUE18_
                    if A0_110 == L1_111 then
                      A0_110 = _UPVALUE19_
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  return A0_110
end
function connectionType6ToString(A0_112)
  local L1_113
  L1_113 = _UPVALUE0_
  L1_113 = L1_113.NIL
  if A0_112 ~= L1_113 then
    L1_113 = _UPVALUE1_
    if A0_112 == L1_113 then
      A0_112 = "Dynamic IP (DHCPv6)"
    else
      L1_113 = _UPVALUE2_
      if A0_112 == L1_113 then
        A0_112 = "Static IPv6"
      else
        L1_113 = _UPVALUE3_
        if A0_112 == L1_113 then
          A0_112 = "PPPoE over IPv6"
        elseif A0_112 == "" then
          A0_112 = _UPVALUE4_
        end
      end
    end
  end
  return A0_112
end
function ipAddressDisplay(A0_114, A1_115, A2_116, A3_117)
  local L4_118, L5_119, L6_120, L7_121, L8_122, L9_123, L10_124, L11_125, L12_126, L13_127, L14_128, L15_129, L16_130, L17_131, L18_132, L19_133, L20_134, L21_135, L22_136, L23_137, L24_138, L25_139, L26_140, L27_141, L28_142
  L4_118 = ""
  L5_119 = ""
  if A0_114 ~= L6_120 then
    if A1_115 then
      for L10_124, L11_125 in L7_121(L8_122) do
        L12_126 = A1_115[L6_120]
        L13_127 = L4_118
        L14_128 = _UPVALUE1_
        L15_129 = "."
        L16_130 = _UPVALUE2_
        L16_130 = L16_130.ipAddress
        L14_128 = L14_128 .. L15_129 .. L16_130
        L14_128 = L12_126[L14_128]
        L15_129 = " / "
        L16_130 = _UPVALUE1_
        L17_131 = "."
        L18_132 = _UPVALUE2_
        L18_132 = L18_132.subnetMask
        L16_130 = L16_130 .. L17_131 .. L18_132
        L16_130 = L12_126[L16_130]
        L4_118 = L13_127 .. L14_128 .. L15_129 .. L16_130
        L13_127 = #A1_115
        if L6_120 ~= L13_127 then
          L13_127 = L4_118
          L14_128 = ", "
          L4_118 = L13_127 .. L14_128
        end
      end
    end
  elseif A0_114 == L6_120 then
    if A1_115 then
      i = L6_120
      for L9_123, L10_124 in L6_120(L7_121) do
        L11_125 = i
        L11_125 = L11_125 + 1
        i = L11_125
        L11_125 = i
        L11_125 = A1_115[L11_125]
        L12_126 = L4_118
        L13_127 = _UPVALUE1_
        L14_128 = "."
        L15_129 = _UPVALUE2_
        L15_129 = L15_129.ipAddress
        L13_127 = L13_127 .. L14_128 .. L15_129
        L13_127 = L11_125[L13_127]
        L14_128 = " ("
        L15_129 = _UPVALUE2_
        L15_129 = L15_129.Primary
        L16_130 = ")"
        L4_118 = L12_126 .. L13_127 .. L14_128 .. L15_129 .. L16_130
        L12_126 = i
        L13_127 = #A1_115
        if L12_126 ~= L13_127 then
          L12_126 = L4_118
          L13_127 = ", "
          L4_118 = L12_126 .. L13_127
        end
      end
    end
    if A2_116 == L8_122 then
      L10_124 = "r"
    elseif A2_116 == L8_122 then
      L10_124 = "r"
    end
    if L7_121 then
      L10_124 = "*all"
      L6_120 = L8_122 or ""
      L10_124 = L6_120
      L11_125 = " ("
      L12_126 = "Secondary"
      L13_127 = ")"
      L4_118 = L8_122 .. L9_123 .. L10_124 .. L11_125 .. L12_126 .. L13_127
      L8_122(L9_123)
    end
  end
  if A0_114 == L6_120 then
    L10_124, L11_125, L12_126, L13_127, L14_128, L15_129, L16_130, L17_131, L18_132, L19_133, L20_134, L21_135, L22_136, L23_137, L24_138, L25_139, L26_140 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
    L27_141 = _UPVALUE6_
    L27_141 = L27_141.russiaPPPoEConnectionGet
    L28_142 = A2_116
    L10_124, L11_125, L12_126, L13_127, L14_128, L15_129, L16_130, L17_131, L18_132, L19_133, L20_134, L21_135, L22_136, L23_137, L24_138, L25_139, L26_140, L27_141 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, L27_141(L28_142)
    L10_124, L11_125, L12_126, L13_127, L14_128, L15_129, L16_130, L17_131, L18_132, L19_133, L20_134, L21_135, L22_136, L23_137, L24_138, L25_139, L26_140, L28_142 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, L27_141(L28_142)
    L27_141 = ""
    L28_142 = ""
    if L18_132 == "1" then
      if io.open("/var/russia_dualPppoe.conf", "r") then
        L5_119 = io.open("/var/russia_dualPppoe.conf", "r"):read("*line") or ""
        L28_142 = io.open("/var/russia_dualPppoe.conf", "r"):read("*line") or ""
        L27_141 = io.open("/var/russia_dualPppoe.conf", "r"):read("*line") or ""
      else
        L27_141 = "0.0.0.0"
        L28_142 = "0.0.0.0"
        L5_119 = "0.0.0.0"
      end
      L4_118 = L4_118 .. ", " .. L27_141 .. " / " .. L28_142 .. " (" .. "Physical" .. ")"
    elseif L18_132 == "0" and A3_117 == "LINK UP" then
      if L19_133 ~= nil and L20_134 ~= nil and L21_135 ~= nil then
        L27_141 = L19_133
        L28_142 = L20_134
        L5_119 = L21_135
      else
        L27_141 = "0.0.0.0"
        L28_142 = "0.0.0.0"
        L5_119 = "0.0.0.0"
      end
      L4_118 = L4_118 .. ", " .. L27_141 .. " / " .. L28_142 .. " (" .. "Physical" .. ")"
    end
  end
  return L6_120, L7_121
end
function ipAddressDisplay6(A0_143)
  local L1_144, L2_145
  L1_144 = ""
  L2_145 = ""
  i = 0
  if A0_143 then
    for _FORV_6_, _FORV_7_ in pairs(A0_143) do
      i = i + 1
      if A0_143[i][_UPVALUE0_ .. "." .. _UPVALUE1_.ipAddress] ~= nil and A0_143[i][_UPVALUE0_ .. "." .. _UPVALUE1_.ipAddress] ~= "" then
        L1_144 = L1_144 .. A0_143[i][_UPVALUE0_ .. "." .. _UPVALUE1_.ipAddress] .. " / " .. A0_143[i][_UPVALUE0_ .. "." .. _UPVALUE1_.ipv6PrefixLen]
      end
      L2_145 = A0_143[i][_UPVALUE0_ .. "." .. _UPVALUE1_.ipv6PrefixLen]
      if i ~= #A0_143 and A0_143[i][_UPVALUE0_ .. "." .. _UPVALUE1_.ipAddress] ~= nil and A0_143[i][_UPVALUE0_ .. "." .. _UPVALUE1_.ipAddress] ~= "" then
        L1_144 = L1_144 .. ", "
      end
    end
  end
  return L1_144, L2_145
end
function optionStatusToString(A0_146, A1_147, A2_148)
  local L3_149, L4_150, L5_151, L6_152
  if A0_146 == "1" then
    A0_146 = _UPVALUE0_
  elseif A0_146 == "2" then
    A0_146 = "UP(IPv6)"
  elseif A0_146 == "3" then
    A0_146 = "UP(IPv4 and IPv6)"
  elseif A0_146 == "0" then
    A0_146 = _UPVALUE1_
  end
  L3_149 = _UPVALUE2_
  if A1_147 == L3_149 then
    L3_149 = ""
    L4_150 = L3_149
    L5_151 = A0_146
    L6_152 = " ("
    L3_149 = L4_150 .. L5_151 .. L6_152 .. _UPVALUE3_.Primary .. ")"
    L4_150 = nil
    L5_151 = _UPVALUE4_
    if A2_148 == L5_151 then
      L5_151 = io
      L5_151 = L5_151.open
      L6_152 = "/var/wan101Ip"
      L5_151 = L5_151(L6_152, "r")
      L4_150 = L5_151
    else
      L5_151 = _UPVALUE5_
      if A2_148 == L5_151 then
        L5_151 = io
        L5_151 = L5_151.open
        L6_152 = "/var/wan201Ip"
        L5_151 = L5_151(L6_152, "r")
        L4_150 = L5_151
      end
    end
    if L4_150 then
      L5_151 = L3_149
      L6_152 = ","
      L3_149 = L5_151 .. L6_152 .. _UPVALUE0_ .. " (" .. _UPVALUE3_.Secondary .. ")"
      L6_152 = L4_150
      L5_151 = L4_150.close
      L5_151(L6_152)
    else
      L5_151 = L3_149
      L6_152 = ","
      L3_149 = L5_151 .. L6_152 .. _UPVALUE1_ .. " (" .. _UPVALUE3_.Secondary .. ")"
    end
    A0_146 = L3_149
  end
  L3_149 = _UPVALUE6_
  if A1_147 == L3_149 then
    L3_149 = _UPVALUE7_
    L3_149 = L3_149.isgetIPFromIsp2Enabled
    L4_150 = A2_148
    L5_151 = L3_149(L4_150)
    L6_152 = ""
    if L5_151 == "1" then
      if io.open("/var/russia_dualPppoe.conf", "r") then
        L6_152 = _UPVALUE0_
      else
        L6_152 = _UPVALUE1_
      end
    elseif L5_151 == "0" then
      if A0_146 == _UPVALUE0_ then
        L6_152 = _UPVALUE0_
      else
        L6_152 = _UPVALUE1_
      end
    end
    A0_146 = A0_146 .. ", " .. L6_152 .. " (" .. "Physical" .. ")"
  end
  return A0_146
end
function wanModeDisplay(A0_153)
  local L1_154, L2_155, L3_156
  L1_154 = ""
  L2_155, L3_156 = nil, nil
  if A0_153 == "2" then
    L2_155, L3_156, L1_154 = _UPVALUE0_.primaryWanPortGet()
  else
    L2_155, L3_156, L1_154 = _UPVALUE0_.defaultWanPortGet()
  end
  if L1_154 ~= _UPVALUE1_.NIL then
    if L1_154 == _UPVALUE2_ then
      L1_154 = ": " .. _UPVALUE2_
    elseif L1_154 == _UPVALUE3_ then
      L1_154 = ": " .. _UPVALUE3_
    elseif L1_154 == _UPVALUE4_ then
      L1_154 = ": " .. _UPVALUE4_
    end
  else
    L1_154 = ""
  end
  if A0_153 == "2" then
    A0_153 = "Auto-Rollover using port" .. L1_154
  elseif A0_153 == "1" then
    A0_153 = "Load Balancing - Round Robin"
  elseif A0_153 == "3" then
    A0_153 = "Load Balancing - SpillOver"
  elseif A0_153 == "0" then
    A0_153 = "Use only single port" .. L1_154
  end
  return A0_153
end
function gatewayDisplay(A0_157, A1_158, A2_159, A3_160)
  local L4_161, L5_162
  L4_161 = _UPVALUE0_
  if A1_158 == L4_161 then
    L4_161 = A0_157
    L5_162 = " ("
    A0_157 = L4_161 .. L5_162 .. "Primary" .. ")"
    L4_161 = nil
    L5_162 = _UPVALUE1_
    if A3_160 == L5_162 then
      L5_162 = io
      L5_162 = L5_162.open
      L5_162 = L5_162("/var/wan101Gw", "r")
      L4_161 = L5_162
    else
      L5_162 = _UPVALUE2_
      if A3_160 == L5_162 then
        L5_162 = io
        L5_162 = L5_162.open
        L5_162 = L5_162("/var/wan201Gw", "r")
        L4_161 = L5_162
      end
    end
    if L4_161 then
      L5_162 = L4_161.read
      L5_162 = L5_162(L4_161, "*all")
      L5_162 = L5_162 or ""
      A0_157 = A0_157 .. ", " .. L5_162 .. " (" .. "Secondary" .. ")"
      L4_161:close()
    end
  end
  L4_161 = _UPVALUE3_
  if A1_158 == L4_161 then
    L4_161 = A0_157
    L5_162 = ", "
    A0_157 = L4_161 .. L5_162 .. A2_159 .. " (" .. "Physical" .. ")"
  end
  return A0_157
end
function primaryDnsDisplay(A0_163, A1_164, A2_165, A3_166)
  local L4_167, L5_168
  L4_167 = _UPVALUE0_
  if A0_163 == L4_167 then
    L4_167 = A1_164
    L5_168 = " ("
    A1_164 = L4_167 .. L5_168 .. "Primary" .. ")"
    L4_167 = nil
    L5_168 = _UPVALUE1_
    if A3_166 == L5_168 then
      L5_168 = io
      L5_168 = L5_168.open
      L5_168 = L5_168("/var/wan101Dns", "r")
      L4_167 = L5_168
    else
      L5_168 = _UPVALUE2_
      if A3_166 == L5_168 then
        L5_168 = io
        L5_168 = L5_168.open
        L5_168 = L5_168("/var/wan201Dns", "r")
        L4_167 = L5_168
      end
    end
    if L4_167 then
      L5_168 = L4_167.read
      L5_168 = L5_168(L4_167, "*line")
      L5_168 = L5_168 or ""
      A1_164 = A1_164 .. ", " .. L5_168 .. " (" .. "Secondary" .. ")"
      L4_167:close()
    end
  end
  L4_167 = _UPVALUE3_
  if A0_163 == L4_167 then
    L4_167 = ""
    if A2_165 ~= nil and A2_165 ~= "" and L4_167 == "" then
      L5_168 = L4_167
      L4_167 = L5_168 .. A2_165
    else
    end
    L5_168 = A1_164
    A1_164 = L5_168 .. ", " .. L4_167 .. " (" .. "Physical" .. ")"
  end
  return A1_164
end
function SecondaryDnsDisplay(A0_169, A1_170, A2_171, A3_172)
  local L4_173, L5_174
  L4_173 = _UPVALUE0_
  if A0_169 == L4_173 then
    L4_173 = A1_170
    L5_174 = " ("
    A1_170 = L4_173 .. L5_174 .. "Primary" .. ")"
    L4_173 = nil
    L5_174 = _UPVALUE1_
    if A3_172 == L5_174 then
      L5_174 = io
      L5_174 = L5_174.open
      L5_174 = L5_174("/var/wan101Dns", "r")
      L4_173 = L5_174
    else
      L5_174 = _UPVALUE2_
      if A3_172 == L5_174 then
        L5_174 = io
        L5_174 = L5_174.open
        L5_174 = L5_174("/var/wan201Dns", "r")
        L4_173 = L5_174
      end
    end
    if L4_173 then
      L5_174 = nil
      i = 1
      while true do
        L5_174 = L4_173:read("*line")
        if i == 2 then
          break
        end
        i = i + 1
      end
      A1_170 = A1_170 .. ", " .. L5_174 .. " (" .. "Secondary" .. ")"
      L4_173:close()
    end
  end
  L4_173 = _UPVALUE3_
  if A0_169 == L4_173 then
    L4_173 = ""
    if A2_171 ~= nil and A2_171 ~= "" and L4_173 == "" then
      L5_174 = L4_173
      L4_173 = L5_174 .. A2_171
    else
    end
    L5_174 = A1_170
    A1_170 = L5_174 .. ", " .. L4_173 .. " (" .. "Physical" .. ")"
  end
  return A1_170
end
function checkListFirmwareInfoGet()
  local L0_175, L1_176, L2_177, L3_178, L4_179, L5_180, L6_181, L7_182, L8_183, L9_184, L10_185, L11_186, L12_187, L13_188, L14_189, L15_190, L16_191, L17_192
  L6_181 = _UPVALUE0_
  L6_181 = L6_181.checkListInfoGet
  L11_186 = L6_181()
  L5_180 = L11_186
  L4_179 = L10_185
  L3_178 = L9_184
  L2_177 = L8_183
  L1_176 = L7_182
  L0_175 = L6_181
  L6_181, L7_182, L8_183, L9_184 = nil, nil, nil, nil
  L10_185 = _UPVALUE0_
  L10_185 = L10_185.queryLinkInfoGet
  L13_188 = L10_185()
  L9_184 = L13_188
  L8_183 = L12_187
  L7_182 = L11_186
  L6_181 = L10_185
  L10_185, L11_186, L12_187, L13_188, L14_189, L15_190, L16_191, L17_192 = nil, nil, nil, nil, nil, nil, nil, nil
  L10_185, L11_186 = _UPVALUE0_.wlanInfoGet()
  L12_187 = _UPVALUE0_.wlanDomainInfoGet()
  L13_188, L14_189, L15_190, L16_191, L17_192 = _UPVALUE0_.macAddrInfoGet()
  if L0_175 ~= _UPVALUE1_.SUCCESS then
    return L0_175
  end
  return L0_175, L1_176, L2_177, L3_178, L4_179, L5_180, L6_181, L7_182, L8_183, L10_185, L11_186, L12_187, L9_184, L13_188, L14_189, L15_190, L16_191, L17_192
end
function dashBoardWanStatusGet()
  local L0_193, L1_194, L2_195, L3_196
  L3_196, L0_193 = _UPVALUE0_.optionStatusGet(_UPVALUE1_)
  L3_196, L1_194 = _UPVALUE0_.optionStatusGet(_UPVALUE2_)
  if UNIT_NAME == "DSR-1000" or UNIT_NAME == "DSR-1000N" or PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" then
    L3_196, L2_195 = _UPVALUE0_.optionStatusGet(_UPVALUE3_)
    if L3_196 ~= _UPVALUE4_.SUCCESS then
      return L3_196
    end
  end
  if L0_193 == "0" or L0_193 == _UPVALUE4_.NIL then
    L0_193 = _UPVALUE5_
  else
    L0_193 = _UPVALUE6_
  end
  if L1_194 == "0" or L1_194 == _UPVALUE4_.NIL then
    L1_194 = _UPVALUE5_
  else
    L1_194 = _UPVALUE6_
  end
  if L2_195 == "0" or L2_195 == _UPVALUE4_.NIL then
    L2_195 = _UPVALUE5_
  else
    L2_195 = _UPVALUE6_
  end
  return L3_196, L0_193, L1_194, L2_195
end
function radioInfoGet()
  local L0_197, L1_198, L2_199, L3_200, L4_201, L5_202, L6_203
  L6_203 = _UPVALUE0_
  L6_203 = L6_203.configPortUsageGet
  cookie, L5_202, L6_203 = nil, nil, L6_203()
  L0_197 = L6_203
  L6_203 = {}
  if PRODUCT_ID ~= "DSR-1000AC_Ax" then
    L0_197, L1_198, L2_199, L4_201 = _UPVALUE1_.radioGet()
    return L0_197, L1_198, L2_199, L4_201, L5_202
  else
    L0_197, L6_203 = _UPVALUE1_.radioGet()
    return L0_197, L6_203, L5_202
  end
end
function profileInfoGet()
  local L0_204, L1_205
  L0_204 = _UPVALUE0_
  L0_204 = L0_204.profileGetAll
  L1_205 = L0_204()
  return L0_204, L1_205
end
function dhcpStatusChangeWrap(A0_206, A1_207, A2_208)
  local L3_209, L4_210
  L3_209 = ACCESS_LEVEL
  if L3_209 ~= 0 then
    L3_209 = util
    L3_209 = L3_209.appendDebugOut
    L4_210 = "Detected Unauthorized access for deviceInfo PAGE"
    L3_209(L4_210)
    L3_209 = _UPVALUE0_
    L3_209 = L3_209.UNAUTHORIZED
    return L3_209
  end
  L3_209 = nil
  L4_210 = _UPVALUE1_
  L4_210 = L4_210.start
  L4_210()
  L4_210 = A1_207 or "WAN1"
  logIfName = L4_210
  L4_210 = A2_208 or "2"
  addressFamily = L4_210
  L4_210 = _UPVALUE2_
  L4_210 = L4_210.ipv6ModeGet
  L4_210 = L4_210()
  if L4_210() == _UPVALUE3_ then
    addressFamily = "10"
  end
  L4_210 = _UPVALUE4_.dhcpStatusChange(A0_206, logIfName, addressFamily)
  if L4_210 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error.")
    _UPVALUE1_.abort()
    return L4_210
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L4_210
end
function wanStatusChangeWrap(A0_211, A1_212, A2_213)
  local L3_214, L4_215
  L3_214 = ACCESS_LEVEL
  if L3_214 ~= 0 then
    L3_214 = util
    L3_214 = L3_214.appendDebugOut
    L4_215 = "Detected Unauthorized access for deviceInfo PAGE"
    L3_214(L4_215)
    L3_214 = _UPVALUE0_
    L3_214 = L3_214.UNAUTHORIZED
    return L3_214
  end
  L3_214 = nil
  L4_215 = _UPVALUE1_
  L4_215 = L4_215.start
  L4_215()
  L4_215 = A1_212 or "WAN1"
  logIfName = L4_215
  L4_215 = A2_213 or "2"
  addressFamily = L4_215
  L4_215 = _UPVALUE2_
  L4_215 = L4_215.ipv6ModeGet
  L4_215 = L4_215()
  if L4_215() == _UPVALUE3_ then
    addressFamily = "10"
  end
  L4_215 = _UPVALUE4_.wanStatusChange(A0_211, logIfName, addressFamily)
  if L4_215 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error.")
    _UPVALUE1_.abort()
    return L4_215
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L4_215
end
function dmzInfoGet()
  local L0_216, L1_217, L2_218, L3_219, L4_220, L5_221
  L0_216 = {}
  L1_217, L2_218, L3_219, L4_220, L5_221 = nil, nil, nil, nil, nil
  L1_217, L2_218, L3_219 = _UPVALUE0_.configPortUsageGet()
  L1_217, L0_216[1] = _UPVALUE1_.macAddressGet(_UPVALUE2_)
  L1_217, L4_220 = _UPVALUE1_.ipAddressInfoGet(_UPVALUE2_, _UPVALUE3_)
  L0_216[2] = ipAddressDisplay("", L4_220)
  L1_217, L2_218, L5_221 = _UPVALUE4_.dhcpTypeGet()
  if L5_221 == _UPVALUE5_ then
  elseif L5_221 == _UPVALUE7_ then
  elseif L5_221 == _UPVALUE9_ then
  end
  L0_216[4], L0_216[3] = _UPVALUE8_, _UPVALUE6_
  return _UPVALUE10_.SUCCESS, L0_216, L3_219
end
