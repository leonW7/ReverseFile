local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22
L0_0 = module
L1_1 = "com.teamf1.bl.wan.ipv4_option1"
L2_2 = package
L2_2 = L2_2.seeall
L0_0(L1_1, L2_2)
L0_0 = require
L1_1 = "teamf1lualib/db"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/util"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/validations"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/returnCodes"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/wan_pptp"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/wan_l2tp"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/wan_static"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/wan_dhcp"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/wan_client"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/wan_pppoe"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/wan_japanese_multiple_pppoe"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/wan_russian_dual_pppoe"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/wan_port"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/wan_configurablePort"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/dhcp_serverDMZ"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/dmz_addressing"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/management_config"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/wan_threeg"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/wan_routingMode"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/ipv6_mode_bl"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/vlan_vlan"
L0_0(L1_1)
L0_0 = require
L1_1 = "com.teamf1.core.validations"
L0_0 = L0_0(L1_1)
L1_1 = require
L2_2 = "com.teamf1.core.wan.client"
L1_1 = L1_1(L2_2)
L2_2 = require
L3_3 = "com.teamf1.core.wan.dhcp"
L2_2 = L2_2(L3_3)
L3_3 = require
L4_4 = "com.teamf1.core.wan.l2tp"
L3_3 = L3_3(L4_4)
L4_4 = require
L5_5 = "com.teamf1.core.wan.port"
L4_4 = L4_4(L5_5)
L5_5 = require
L6_6 = "com.teamf1.core.wan.pptp"
L5_5 = L5_5(L6_6)
L6_6 = require
L7_7 = "com.teamf1.core.wan.static"
L6_6 = L6_6(L7_7)
L7_7 = require
L8_8 = "com.teamf1.core.wan.japanese_multiple_pppoe"
L7_7 = L7_7(L8_8)
L8_8 = require
L9_9 = "com.teamf1.core.wan.pppoe"
L8_8 = L8_8(L9_9)
L9_9 = require
L10_10 = "com.teamf1.core.wan.russian_dual_pppoe"
L9_9 = L9_9(L10_10)
L10_10 = require
L11_11 = "com.teamf1.core.dhcp.serverDMZ"
L10_10 = L10_10(L11_11)
L11_11 = require
L12_12 = "com.teamf1.core.dmz.addressing"
L11_11 = L11_11(L12_12)
L12_12 = require
L13_13 = "com.teamf1.core.wan.configurableport"
L12_12 = L12_12(L13_13)
L13_13 = require
L14_14 = "com.teamf1.core.returnCodes"
L13_13 = L13_13(L14_14)
L14_14 = require
L15_15 = "com.teamf1.core.config"
L14_14 = L14_14(L15_15)
L15_15 = require
L16_16 = "com.teamf1.core.wan.threeg"
L15_15 = L15_15(L16_16)
L16_16 = require
L17_17 = "com.teamf1.core.wan.routingmode"
L16_16 = L16_16(L17_17)
L17_17 = require
L18_18 = "com.teamf1.bl.ipv6.mode"
L17_17 = L17_17(L18_18)
L18_18 = require
L19_19 = "com.teamf1.core.vlan.vlan"
L18_18 = L18_18(L19_19)
L19_19, L20_20, L21_21, L22_22 = nil, nil, nil, nil
if PRODUCT_ID ~= "DSR-1000AC_Ax" and PRODUCT_ID ~= "DSR-500AC_Ax" and PRODUCT_ID ~= "DSR-500_Bx" and PRODUCT_ID ~= "DSR-1000_Bx" then
  require("teamf1lualib/vlan_on_wan_core")
  require("teamf1lualib/services_igmpProxy")
  L19_19 = require("com.teamf1.core.vlanOn.wan")
  L20_20 = require("com.teamf1.core.services.igmpproxy")
else
  require("teamf1lualib/wan_vlanOverWan")
  require("teamf1lualib/wan_ipAliasing")
  L21_21 = require("com.teamf1.core.wan.vlanOverWan")
  L22_22 = require("com.teamf1.core.wan.ipaliasing")
end
function ipv4Option2settingsSectionGet()
  local L0_23, L1_24, L2_25, L3_26, L4_27, L5_28
  L4_27 = {}
  L5_28 = {}
  L0_23, L1_24, L2_25 = _UPVALUE0_.configPortUsageGet()
  if L0_23 ~= _UPVALUE1_.SUCCESS then
    return L0_23
  end
  if L2_25 == _UPVALUE2_ then
    L3_26 = _UPVALUE3_[1]
  elseif L2_25 == _UPVALUE4_ then
    L3_26 = _UPVALUE3_[2]
  elseif L2_25 == _UPVALUE5_ then
    L3_26 = _UPVALUE3_[3]
  end
  L0_23, L4_27 = option2settingsSectionGet()
  if L0_23 ~= _UPVALUE1_.SUCCESS then
    return L0_23
  end
  L0_23, L5_28 = dmzsettingsSectionGet()
  if L0_23 ~= _UPVALUE1_.SUCCESS then
    return L0_23
  end
  return L0_23, L4_27, L5_28, L3_26
end
function option2settingsVlanOnWANSectionSet(A0_29)
  local L1_30, L2_31, L3_32, L4_33, L5_34
  L1_30 = _UPVALUE0_
  L1_30 = L1_30.FAILURE
  L2_31 = A0_29["ipv4Option2.vlanWan2Status"]
  L3_32 = A0_29["ipv4Option2.vlanId"]
  L4_33 = A0_29["ipv4Option2.hdvlanId"]
  L5_34 = A0_29["ipv4Option2.hvlanWan2Status"]
  if L2_31 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if tonumber(L2_31) == 1 then
    if L3_32 == _UPVALUE0_.NIL then
      util.appendDebugOut("Set : Invalid Cookie")
      return _UPVALUE0_.BAD_PARAMETER
    end
  else
    L3_32 = A0_29["ipv4Option2.hdvlanId"]
  end
  if tonumber(L5_34) ~= tonumber(L2_31) then
  else
  end
  if _UPVALUE2_ == _UPVALUE2_ then
    if PRODUCT_ID ~= "DSR-1000AC_Ax" and PRODUCT_ID ~= "DSR-500AC_Ax" and PRODUCT_ID ~= "DSR-500_Bx" and PRODUCT_ID ~= "DSR-1000_Bx" then
      L1_30 = _UPVALUE3_.vlan_on_WAN2_Config(L2_31)
      if L1_30 ~= _UPVALUE0_.SUCCESS then
        util.appendDebugOut("Error in configuring values in page ipv4Option2settings" .. L1_30)
        _UPVALUE4_.abort()
        return L1_30, curCookie
      end
      L1_30 = _UPVALUE3_.vlan_on_WAN2_Config_Add_Edit(L2_31, L3_32)
      if L1_30 ~= _UPVALUE0_.SUCCESS then
        util.appendDebugOut("Error in configuring values in page ipv4Option2settings" .. L1_30)
        _UPVALUE4_.abort()
        return L1_30, curCookie
      end
    else
      L1_30 = _UPVALUE5_.vlanOverWanConfig(L2_31, L3_32, "WAN2")
      if L1_30 ~= _UPVALUE0_.SUCCESS then
        util.appendDebugOut("Error in configuring values in page ipv4Option1settings" .. L1_30)
        _UPVALUE4_.abort()
        return L1_30, curCookie
      end
    end
  end
  L1_30 = _UPVALUE0_.SUCCESS
  return L1_30
end
function ipv4Option2settingsSectionSet(A0_35)
  local L1_36, L2_37, L3_38, L4_39, L5_40, L6_41, L7_42, L8_43
  L1_36 = ACCESS_LEVEL
  if L1_36 ~= 0 then
    L1_36 = util
    L1_36 = L1_36.appendDebugOut
    L2_37 = "Detected Unauthorized access for page ipv4Option2settings"
    L1_36(L2_37)
    L1_36 = _UPVALUE0_
    L1_36 = L1_36.UNAUTHORIZED
    return L1_36
  end
  L1_36 = A0_35["ipv4Option2.cookie"]
  L2_37 = A0_35["ipv4Option2.configPortUsage"]
  L3_38 = _UPVALUE0_
  L3_38 = L3_38.NIL
  if L1_36 == L3_38 then
    L3_38 = util
    L3_38 = L3_38.appendDebugOut
    L4_39 = "Set : Invalid Cookie"
    L3_38(L4_39)
    L3_38 = _UPVALUE0_
    L3_38 = L3_38.BAD_PARAMETER
    return L3_38
  end
  L3_38 = _UPVALUE0_
  L3_38 = L3_38.NIL
  if L2_37 == L3_38 then
    L3_38 = util
    L3_38 = L3_38.appendDebugOut
    L4_39 = "Set : Invalid configPortUsage"
    L3_38(L4_39)
    L3_38 = _UPVALUE0_
    L3_38 = L3_38.BAD_PARAMETER
    return L3_38
  end
  if L2_37 == "1" then
    L3_38 = "WAN2"
    interfaceName = L3_38
  elseif L2_37 == "2" then
    L3_38 = "DMZ"
    interfaceName = L3_38
  elseif L2_37 == "3" then
    L3_38 = "LAN"
    interfaceName = L3_38
  end
  L3_38 = _UPVALUE1_
  L3_38 = L3_38.start
  L3_38()
  L3_38, L4_39, L5_40 = nil, nil, nil
  L6_41 = _UPVALUE2_
  L6_41 = L6_41.configPortUsageGet
  L8_43 = L6_41()
  if L6_41 ~= _UPVALUE0_.SUCCESS then
    return L6_41
  end
  if UNIT_NAME ~= "DSR-250N" and UNIT_NAME ~= "DSR-250" and UNIT_NAME ~= "DSR-150N" and UNIT_NAME ~= "DSR-150" then
    L6_41 = option2settingsVlanOnWANSectionSet(A0_35)
    if L6_41 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in configuring vlan on wan feature in page ipv4Option2settings" .. L6_41)
      _UPVALUE1_.abort()
      return L6_41, L7_42
    end
  end
  if UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-250N" or UNIT_NAME == "DSR-150" or UNIT_NAME == "DSR-150N" then
    if interfaceName == "LAN" or interfaceName == "DMZ" then
      where = "action =1 AND waninterface = 'WAN2'"
      returnCode = _UPVALUE2_.wanmodeCheck()
      if returnCode ~= _UPVALUE0_.SUCCESS then
        return returnCode
      end
      if db.existsRow("ifStaticIPAlias", "LogicalIfName", "WAN2") then
        return _UPVALUE0_.IPALIAS_WAN2_INUSE
      end
      if db.existsRowWhere("bandwidthmanagement", where) then
        return _UPVALUE0_.BANDWIDTH_MGMT_WAN2_INUSE
      end
    end
    returnCode, cookie = _UPVALUE3_.portMappingSet(interfaceName)
    if returnCode ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in configuring values in page dmzSettings.html" .. returnCode)
      _UPVALUE1_.abort()
      return returnCode, curCookie
    end
  end
  if L2_37 == _UPVALUE4_[1] then
    L5_40 = _UPVALUE5_
    L6_41, L7_42 = option2settingsSectionSet(A0_35)
    if L6_41 ~= _UPVALUE0_.SUCCESS then
      return L6_41
    end
    L6_41, L7_42 = _UPVALUE2_.configPortUsageSet(L1_36, L5_40)
    if L6_41 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in configuring values in page ipv4Option2settings" .. L6_41)
      _UPVALUE1_.abort()
      return L6_41, L7_42
    end
  elseif L2_37 == _UPVALUE4_[2] then
    L5_40 = _UPVALUE6_
    L6_41, L7_42 = _UPVALUE2_.configPortUsageSet(L1_36, L5_40)
    if L6_41 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in configuring values in page ipv4Option2settings" .. L6_41)
      _UPVALUE1_.abort()
      return L6_41, L7_42
    end
    A0_35["ipv4Option2.vlanWan2Status"] = "0"
  end
  if UNIT_NAME ~= "DSR-250N" and UNIT_NAME ~= "DSR-250" and UNIT_NAME ~= "DSR-150N" and UNIT_NAME ~= "DSR-150" then
    L6_41 = _UPVALUE2_.dummyUpdate(L8_43)
    if L6_41 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in configuring values in page ipv4Option2settings" .. L6_41)
      _UPVALUE1_.abort()
      return L6_41
    end
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L7_42
end
function option2settingsSectionGet()
  local L0_44, L1_45, L2_46, L3_47, L4_48, L5_49, L6_50, L7_51, L8_52, L9_53, L10_54, L11_55, L12_56, L13_57, L14_58, L15_59, L16_60, L17_61, L18_62, L19_63, L20_64, L21_65, L22_66, L23_67, L24_68, L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L31_75, L32_76, L33_77, L34_78, L35_79, L36_80, L37_81, L38_82, L39_83, L40_84, L41_85, L42_86, L43_87
  L10_54 = {}
  L11_55 = _UPVALUE0_
  L11_55 = L11_55.connectionTypeGet
  L12_56 = _UPVALUE1_
  L13_57 = _UPVALUE2_
  L13_57 = L11_55(L12_56, L13_57)
  L3_47 = L13_57
  L1_45 = L12_56
  L0_44 = L11_55
  L11_55 = _UPVALUE3_
  L11_55 = L11_55.SUCCESS
  if L0_44 ~= L11_55 then
    return L0_44
  end
  L11_55 = _UPVALUE4_
  L11_55 = L11_55.portGroupGet
  L12_56 = _UPVALUE1_
  L13_57 = _UPVALUE2_
  L18_62 = L11_55(L12_56, L13_57)
  L8_52 = L18_62
  L7_51 = L17_61
  L6_50 = L16_60
  L5_49 = L15_59
  L4_48 = L14_58
  L9_53 = L13_57
  L2_46 = L12_56
  L0_44 = L11_55
  L11_55 = _UPVALUE3_
  L11_55 = L11_55.SUCCESS
  if L0_44 ~= L11_55 then
    return L0_44
  end
  L11_55 = _UPVALUE5_
  L12_56 = tonumber
  L13_57 = L4_48
  L12_56 = L12_56(L13_57)
  L12_56 = L12_56 + 1
  L4_48 = L11_55[L12_56]
  L11_55 = _UPVALUE6_
  L12_56 = tonumber
  L13_57 = L6_50
  L12_56 = L12_56(L13_57)
  L12_56 = L12_56 + 1
  L6_50 = L11_55[L12_56]
  L11_55 = _UPVALUE7_
  L12_56 = tonumber
  L13_57 = L8_52
  L12_56 = L12_56(L13_57)
  L12_56 = L12_56 + 1
  L8_52 = L11_55[L12_56]
  L11_55 = _UPVALUE8_
  if L3_47 == L11_55 then
    L11_55 = _UPVALUE9_
    L12_56, L13_57, L14_58, L15_59, L16_60, L17_61, L18_62, L19_63, L20_64, L21_65 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
    L22_66 = _UPVALUE10_
    L22_66 = L22_66.dhcpGetNext
    L23_67 = _UPVALUE9_
    L31_75 = L22_66(L23_67)
    L21_65 = L31_75
    L20_64 = L30_74
    L19_63 = L29_73
    L18_62 = L28_72
    L17_61 = L27_71
    L16_60 = L26_70
    L15_59 = L25_69
    L14_58 = L24_68
    L12_56 = L23_67
    L0_44 = L22_66
    L22_66 = _UPVALUE3_
    L22_66 = L22_66.SUCCESS
    if L0_44 ~= L22_66 then
      return L0_44
    end
    L22_66 = _UPVALUE11_
    L13_57 = L22_66[2]
    L22_66 = _UPVALUE12_
    L23_67 = tonumber
    L24_68 = L18_62
    L23_67 = L23_67(L24_68)
    L23_67 = L23_67 + 1
    L18_62 = L22_66[L23_67]
    L10_54["ipv4Option2.returnCode"] = L0_44
    L10_54["ipv4Option2.cookie"] = L1_45
    L10_54["ipv4Option2.cookie1"] = L12_56
    L10_54["ipv4Option2.cookie2"] = L2_46
    L10_54["ipv4Option2.dhcp_wanPort"] = L14_58
    L10_54["ipv4Option2.dhcp_ipAddress"] = L15_59
    L10_54["ipv4Option2.dhcp_gateway"] = L16_60
    L10_54["ipv4Option2.dhcp_networkMask"] = L17_61
    L10_54["ipv4Option2.dhcp_useIspDns"] = L18_62
    L10_54["ipv4Option2.dhcp_primaryDNS"] = L19_63
    L10_54["ipv4Option2.dhcp_secondaryDNS"] = L20_64
    L10_54["ipv4Option2.dhcp_hostName"] = L21_65
    L10_54["ipv4Option2.macAddressType"] = L4_48
    L10_54["ipv4Option2.macAddress"] = L5_49
    L10_54["ipv4Option2.mtuType"] = L6_50
    L10_54["ipv4Option2.mtu"] = L7_51
    L10_54["ipv4Option2.speed"] = L8_52
    L10_54["ipv4Option2.modClientType"] = L13_57
    L22_66 = L0_44
    L23_67 = L10_54
    return L22_66, L23_67
  else
    L11_55 = _UPVALUE13_
    if L3_47 == L11_55 then
      L11_55, L12_56, L13_57, L14_58, L15_59, L16_60, L17_61, L18_62 = nil, nil, nil, nil, nil, nil, nil, nil
      L19_63 = _UPVALUE14_
      L19_63 = L19_63.staticGroupGet
      L20_64 = _UPVALUE1_
      L21_65 = _UPVALUE2_
      L26_70 = L19_63(L20_64, L21_65)
      L18_62 = L26_70
      L17_61 = L25_69
      L16_60 = L24_68
      L15_59 = L23_67
      L14_58 = L22_66
      L13_57 = L21_65
      L11_55 = L20_64
      L0_44 = L19_63
      L19_63 = _UPVALUE3_
      L19_63 = L19_63.SUCCESS
      if L0_44 ~= L19_63 then
        return L0_44
      end
      L19_63 = _UPVALUE11_
      L12_56 = L19_63[1]
      L10_54["ipv4Option2.returnCode"] = L0_44
      L10_54["ipv4Option2.cookie"] = L1_45
      L10_54["ipv4Option2.cookie1"] = L11_55
      L10_54["ipv4Option2.cookie2"] = L2_46
      L10_54["ipv4Option2.static_wanPort"] = L13_57
      L10_54["ipv4Option2.static_ipAddress"] = L14_58
      L10_54["ipv4Option2.static_gateway"] = L15_59
      L10_54["ipv4Option2.static_networkMask"] = L16_60
      L10_54["ipv4Option2.static_primaryDNS"] = L17_61
      L10_54["ipv4Option2.static_secondaryDNS"] = L18_62
      L19_63 = hostName
      L10_54["ipv4Option2.static_hostName"] = L19_63
      L10_54["ipv4Option2.macAddressType"] = L4_48
      L10_54["ipv4Option2.macAddress"] = L5_49
      L10_54["ipv4Option2.mtuType"] = L6_50
      L10_54["ipv4Option2.mtu"] = L7_51
      L10_54["ipv4Option2.speed"] = L8_52
      L10_54["ipv4Option2.modClientType"] = L12_56
      L19_63 = L0_44
      L20_64 = L10_54
      return L19_63, L20_64
    else
      L11_55 = _UPVALUE15_
      if L3_47 == L11_55 then
        L11_55 = _UPVALUE9_
        L12_56, L13_57, L14_58, L15_59, L16_60, L17_61, L18_62, L19_63, L20_64, L21_65, L22_66, L23_67, L24_68, L25_69, L26_70, L27_71, L28_72, L29_73, L30_74 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
        L31_75 = _UPVALUE16_
        L31_75 = L31_75.pptpClientGroupGetNext
        L32_76 = L11_55
        L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L31_75 = nil, nil, nil, nil, nil, nil, L31_75(L32_76)
        L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L32_76 = nil, nil, nil, nil, nil, nil, L31_75(L32_76)
        L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L33_77 = nil, nil, nil, nil, nil, nil, L31_75(L32_76)
        L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L34_78 = nil, nil, nil, nil, nil, nil, L31_75(L32_76)
        L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L35_79 = nil, nil, nil, nil, nil, nil, L31_75(L32_76)
        L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L36_80 = nil, nil, nil, nil, nil, nil, L31_75(L32_76)
        L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L37_81 = nil, nil, nil, nil, nil, nil, L31_75(L32_76)
        L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L38_82 = nil, nil, nil, nil, nil, nil, L31_75(L32_76)
        L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L39_83 = nil, nil, nil, nil, nil, nil, L31_75(L32_76)
        L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L40_84 = nil, nil, nil, nil, nil, nil, L31_75(L32_76)
        L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L41_85 = nil, nil, nil, nil, nil, nil, L31_75(L32_76)
        L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L42_86 = nil, nil, nil, nil, nil, nil, L31_75(L32_76)
        L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L43_87 = nil, nil, nil, nil, nil, nil, L31_75(L32_76)
        L24_68 = L43_87
        L23_67 = L42_86
        L22_66 = L41_85
        L21_65 = L40_84
        L20_64 = L39_83
        L19_63 = L38_82
        L18_62 = L37_81
        L17_61 = L36_80
        L16_60 = L35_79
        L15_59 = L34_78
        L14_58 = L33_77
        L12_56 = L32_76
        L0_44 = L31_75
        L31_75 = _UPVALUE3_
        L31_75 = L31_75.SUCCESS
        if L0_44 ~= L31_75 then
          return L0_44
        end
        L31_75 = _UPVALUE17_
        L32_76 = tonumber
        L33_77 = L17_61
        L32_76 = L32_76(L33_77)
        L32_76 = L32_76 + 1
        L17_61 = L31_75[L32_76]
        L31_75 = _UPVALUE12_
        L32_76 = tonumber
        L33_77 = L18_62
        L32_76 = L32_76(L33_77)
        L32_76 = L32_76 + 1
        L18_62 = L31_75[L32_76]
        L31_75 = _UPVALUE18_
        L32_76 = tonumber
        L33_77 = L25_69
        L32_76 = L32_76(L33_77)
        L32_76 = L32_76 + 1
        L25_69 = L31_75[L32_76]
        L31_75 = _UPVALUE19_
        if L29_73 == L31_75 then
          L31_75 = _UPVALUE11_
          L13_57 = L31_75[8]
        else
          L31_75 = _UPVALUE11_
          L13_57 = L31_75[4]
        end
        L10_54["ipv4Option2.returnCode"] = L0_44
        L10_54["ipv4Option2.cookie"] = L1_45
        L10_54["ipv4Option2.cookie1"] = L12_56
        L10_54["ipv4Option2.cookie2"] = L2_46
        L10_54["ipv4Option2.pptp_wanPort"] = L14_58
        L10_54["ipv4Option2.pptp_userName"] = L15_59
        L31_75 = _UPVALUE3_
        L31_75 = L31_75.NIL
        if L16_60 ~= L31_75 then
          L31_75 = util
          L31_75 = L31_75.mask
          L32_76 = L16_60
          L31_75 = L31_75(L32_76)
          L10_54["ipv4Option2.pptp_password"] = L31_75
        else
          L10_54["ipv4Option2.pptp_password"] = L16_60
        end
        L10_54["ipv4Option2.pptp_useDhcp"] = L17_61
        L10_54["ipv4Option2.pptp_useIspDns"] = L18_62
        L10_54["ipv4Option2.pptp_serverIPAddress"] = L19_63
        L10_54["ipv4Option2.pptp_staticIPAddress"] = L20_64
        L10_54["ipv4Option2.pptp_gateway"] = L21_65
        L10_54["ipv4Option2.pptp_netmask"] = L22_66
        L10_54["ipv4Option2.pptp_primaryDNS"] = L23_67
        L10_54["ipv4Option2.pptp_secondaryDNS"] = L24_68
        L10_54["ipv4Option2.pptp_reconnectMode"] = L25_69
        L10_54["ipv4Option2.pptp_maxIdleTime"] = L26_70
        L10_54["ipv4Option2.pptp_splitTunnel"] = L27_71
        L10_54["ipv4Option2.pptp_mppeEncryption"] = L28_72
        L10_54["ipv4Option2.pptp_dualAccess"] = L29_73
        L10_54["ipv4Option2.macAddressType"] = L4_48
        L10_54["ipv4Option2.macAddress"] = L5_49
        L10_54["ipv4Option2.mtuType"] = L6_50
        L10_54["ipv4Option2.mtu"] = L7_51
        L10_54["ipv4Option2.speed"] = L8_52
        L10_54["ipv4Option2.modClientType"] = L13_57
        L10_54["ipv4Option2.static_DNS_IP"] = L30_74
        L31_75 = L0_44
        L32_76 = L10_54
        return L31_75, L32_76
      else
        L11_55 = _UPVALUE20_
        if L3_47 == L11_55 then
          L11_55 = _UPVALUE9_
          L12_56, L13_57, L14_58, L15_59, L16_60, L17_61, L18_62, L19_63, L20_64, L21_65, L22_66, L23_67, L24_68, L25_69, L26_70, L27_71, L28_72, L29_73, L30_74 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
          L31_75 = _UPVALUE21_
          L31_75 = L31_75.l2tpClientGroupGetNext
          L32_76 = L11_55
          L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L43_87 = L31_75(L32_76)
          L24_68 = L43_87
          L23_67 = L42_86
          L22_66 = L41_85
          L21_65 = L40_84
          L20_64 = L39_83
          L19_63 = L38_82
          L18_62 = L37_81
          L17_61 = L36_80
          L16_60 = L35_79
          L15_59 = L34_78
          L14_58 = L33_77
          L12_56 = L32_76
          L0_44 = L31_75
          L31_75 = _UPVALUE3_
          L31_75 = L31_75.SUCCESS
          if L0_44 ~= L31_75 then
            return L0_44
          end
          L31_75 = _UPVALUE17_
          L32_76 = tonumber
          L33_77 = L17_61
          L32_76 = L32_76(L33_77)
          L32_76 = L32_76 + 1
          L17_61 = L31_75[L32_76]
          L31_75 = _UPVALUE12_
          L32_76 = tonumber
          L33_77 = L18_62
          L32_76 = L32_76(L33_77)
          L32_76 = L32_76 + 1
          L18_62 = L31_75[L32_76]
          L31_75 = _UPVALUE18_
          L32_76 = tonumber
          L33_77 = L25_69
          L32_76 = L32_76(L33_77)
          L32_76 = L32_76 + 1
          L25_69 = L31_75[L32_76]
          L31_75 = _UPVALUE19_
          if L28_72 == L31_75 then
            L31_75 = _UPVALUE11_
            L13_57 = L31_75[9]
          else
            L31_75 = _UPVALUE11_
            L13_57 = L31_75[5]
          end
          L10_54["ipv4Option2.returnCode"] = L0_44
          L10_54["ipv4Option2.cookie"] = L1_45
          L10_54["ipv4Option2.cookie1"] = L12_56
          L10_54["ipv4Option2.cookie2"] = L2_46
          L10_54["ipv4Option2.l2tp_wanPort"] = L14_58
          L10_54["ipv4Option2.l2tp_userName"] = L15_59
          L31_75 = _UPVALUE3_
          L31_75 = L31_75.NIL
          if L16_60 ~= L31_75 then
            L31_75 = util
            L31_75 = L31_75.mask
            L32_76 = L16_60
            L31_75 = L31_75(L32_76)
            L10_54["ipv4Option2.l2tp_password"] = L31_75
          else
            L10_54["ipv4Option2.l2tp_password"] = L16_60
          end
          L10_54["ipv4Option2.l2tp_useDhcp"] = L17_61
          L10_54["ipv4Option2.l2tp_useIspDns"] = L18_62
          L10_54["ipv4Option2.l2tp_serverIPAddress"] = L19_63
          L10_54["ipv4Option2.l2tp_staticIPAddress"] = L20_64
          L10_54["ipv4Option2.l2tp_gateway"] = L21_65
          L10_54["ipv4Option2.l2tp_netmask"] = L22_66
          L10_54["ipv4Option2.l2tp_primaryDNS"] = L23_67
          L10_54["ipv4Option2.l2tp_secondaryDNS"] = L24_68
          L10_54["ipv4Option2.l2tp_reconnectMode"] = L25_69
          L10_54["ipv4Option2.l2tp_maxIdleTime"] = L26_70
          L10_54["ipv4Option2.l2tp_splitTunnel"] = L27_71
          L10_54["ipv4Option2.l2tp_dualAccess"] = L28_72
          L31_75 = _UPVALUE3_
          L31_75 = L31_75.NIL
          if L29_73 ~= L31_75 then
            L31_75 = util
            L31_75 = L31_75.mask
            L32_76 = L29_73
            L31_75 = L31_75(L32_76)
            L10_54["ipv4Option2.l2tp_secret"] = L31_75
          else
            L10_54["ipv4Option2.l2tp_secret"] = L29_73
          end
          L10_54["ipv4Option2.macAddressType"] = L4_48
          L10_54["ipv4Option2.macAddress"] = L5_49
          L10_54["ipv4Option2.mtuType"] = L6_50
          L10_54["ipv4Option2.mtu"] = L7_51
          L10_54["ipv4Option2.speed"] = L8_52
          L10_54["ipv4Option2.modClientType"] = L13_57
          L10_54["ipv4Option2.static_DNS_IP"] = L30_74
          L31_75 = L0_44
          L32_76 = L10_54
          return L31_75, L32_76
        else
          L11_55 = _UPVALUE22_
          if L3_47 == L11_55 then
            L11_55, L12_56, L13_57, L14_58, L15_59, L16_60, L17_61, L18_62, L19_63, L20_64, L21_65, L22_66, L23_67, L24_68, L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L31_75, L32_76, L33_77, L34_78, L35_79, L36_80, L37_81, L38_82, L39_83, L40_84, L41_85, L42_86, L43_87 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
            L0_44, L14_58, L15_59, L16_60, L17_61, L18_62, L19_63, L20_64, L21_65, L22_66, L23_67, L24_68, L25_69, L26_70, L27_71, L28_72 = _UPVALUE23_.japanPPPoEConnectionGet(_UPVALUE1_, _UPVALUE24_)
            if L0_44 ~= _UPVALUE3_.SUCCESS then
              return L0_44
            end
            L0_44, L29_73, L30_74, L31_75, L32_76, L33_77, L34_78, L35_79, L36_80, L37_81, L38_82, L39_83, L40_84, L41_85, L42_86, L43_87 = _UPVALUE23_.japanPPPoEConnectionGet(_UPVALUE1_, _UPVALUE25_)
            if L0_44 ~= _UPVALUE3_.SUCCESS then
              return L0_44
            end
            L16_60 = _UPVALUE17_[tonumber(L16_60) + 1]
            L22_66 = _UPVALUE12_[tonumber(L22_66) + 1]
            L31_75 = _UPVALUE17_[tonumber(L31_75) + 1]
            L37_81 = _UPVALUE12_[tonumber(L37_81) + 1]
            L27_71 = _UPVALUE18_[tonumber(L27_71) + 1]
            L42_86 = _UPVALUE18_[tonumber(L42_86) + 1]
            L25_69 = _UPVALUE26_[tonumber(L25_69)]
            L40_84 = _UPVALUE26_[tonumber(L40_84)]
            if L41_85 == _UPVALUE27_ then
              L13_57 = _UPVALUE11_[3]
              L10_54["ipv4Option2.returnCode"] = L0_44
              L10_54["ipv4Option2.cookie"] = L1_45
              L10_54["ipv4Option2.cookie1"] = L11_55
              L10_54["ipv4Option2.cookie2"] = L2_46
              L10_54["ipv4Option2.pppoe_wanPort"] = L14_58
              L10_54["ipv4Option2.pppoe_profileName"] = L15_59
              L10_54["ipv4Option2.pppoe_useDhcp"] = L16_60
              L10_54["ipv4Option2.pppoe_ipAddress"] = L17_61
              L10_54["ipv4Option2.pppoe_networkMask"] = L18_62
              L10_54["ipv4Option2.pppoe_userName"] = L19_63
              if L20_64 ~= _UPVALUE3_.NIL then
                L10_54["ipv4Option2.pppoe_password"] = util.mask(L20_64)
              else
                L10_54["ipv4Option2.pppoe_password"] = L20_64
              end
              L10_54["ipv4Option2.pppoe_service"] = L21_65
              L10_54["ipv4Option2.pppoe_useIspDns"] = L22_66
              L10_54["ipv4Option2.pppoe_primaryDns"] = L23_67
              L10_54["ipv4Option2.pppoe_secondaryDns"] = L24_68
              L10_54["ipv4Option2.pppoe_authOpt"] = L25_69
              L10_54["ipv4Option2.pppoe_status"] = L26_70
              L10_54["ipv4Option2.pppoe_reconnectMode"] = L27_71
              L10_54["ipv4Option2.pppoe_idleTimeOutVal"] = L28_72
              L10_54["ipv4Option2.macAddressType"] = L4_48
              L10_54["ipv4Option2.macAddress"] = L5_49
              L10_54["ipv4Option2.mtuType"] = L6_50
              L10_54["ipv4Option2.mtu"] = L7_51
              L10_54["ipv4Option2.speed"] = L8_52
              L10_54["ipv4Option2.modClientType"] = L13_57
              return L0_44, L10_54
            else
              L13_57 = _UPVALUE11_[6]
              L10_54["ipv4Option2.returnCode"] = L0_44
              L10_54["ipv4Option2.cookie"] = L1_45
              L10_54["ipv4Option2.cookie1"] = L11_55
              L10_54["ipv4Option2.cookie2"] = L2_46
              L10_54["ipv4Option2.pppoe_wanPort"] = L14_58
              L10_54["ipv4Option2.pppoe_profileName"] = L15_59
              L10_54["ipv4Option2.pppoe_useDhcp"] = L16_60
              L10_54["ipv4Option2.pppoe_ipAddress"] = L17_61
              L10_54["ipv4Option2.pppoe_networkMask"] = L18_62
              L10_54["ipv4Option2.pppoe_userName"] = L19_63
              if L20_64 ~= _UPVALUE3_.NIL then
                L10_54["ipv4Option2.pppoe_password"] = util.mask(L20_64)
              else
                L10_54["ipv4Option2.pppoe_password"] = L20_64
              end
              L10_54["ipv4Option2.pppoe_service"] = L21_65
              L10_54["ipv4Option2.pppoe_useIspDns"] = L22_66
              L10_54["ipv4Option2.pppoe_primaryDns"] = L23_67
              L10_54["ipv4Option2.pppoe_secondaryDns"] = L24_68
              L10_54["ipv4Option2.pppoe_authOpt"] = L25_69
              L10_54["ipv4Option2.pppoe_status"] = L26_70
              L10_54["ipv4Option2.pppoe_reconnectMode"] = L27_71
              L10_54["ipv4Option2.pppoe_idleTimeOutVal"] = L28_72
              L10_54["ipv4Option2.pppoe_wanPort1"] = L29_73
              L10_54["ipv4Option2.pppoe_profileName1"] = L30_74
              L10_54["ipv4Option2.pppoe_useDhcp1"] = L31_75
              L10_54["ipv4Option2.pppoe_ipAddress1"] = L32_76
              L10_54["ipv4Option2.pppoe_networkMask1"] = L33_77
              L10_54["ipv4Option2.pppoe_userName1"] = L34_78
              if L35_79 ~= _UPVALUE3_.NIL then
                L10_54["ipv4Option2.pppoe_password1"] = util.mask(L35_79)
              else
                L10_54["ipv4Option2.pppoe_password1"] = L35_79
              end
              L10_54["ipv4Option2.pppoe_service1"] = L36_80
              L10_54["ipv4Option2.pppoe_useIspDns1"] = L37_81
              L10_54["ipv4Option2.pppoe_primaryDns1"] = L38_82
              L10_54["ipv4Option2.pppoe_secondaryDns1"] = L39_83
              L10_54["ipv4Option2.pppoe_authOpt1"] = L40_84
              L10_54["ipv4Option2.pppoe_status1"] = L41_85
              L10_54["ipv4Option2.pppoe_reconnectMode1"] = L42_86
              L10_54["ipv4Option2.pppoe_idleTimeOutVal1"] = L43_87
              L10_54["ipv4Option2.macAddressType"] = L4_48
              L10_54["ipv4Option2.macAddress"] = L5_49
              L10_54["ipv4Option2.mtuType"] = L6_50
              L10_54["ipv4Option2.mtu"] = L7_51
              L10_54["ipv4Option2.speed"] = L8_52
              L10_54["ipv4Option2.modClientType"] = L13_57
              return L0_44, L10_54
            end
          else
            L11_55 = _UPVALUE28_
            if L3_47 == L11_55 then
              L11_55, L12_56, L13_57, L14_58, L15_59, L16_60, L17_61, L18_62, L19_63, L20_64, L21_65, L22_66, L23_67, L24_68, L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L31_75, L32_76 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
              L33_77 = _UPVALUE29_
              L33_77 = L33_77.russiaPPPoEConnectionGet
              L34_78 = _UPVALUE1_
              L23_67, L24_68, L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L31_75, L32_76, L33_77 = L0_44, L10_54, L40_84, _UPVALUE23_.japanPPPoEConnectionGet(_UPVALUE1_, _UPVALUE25_)
              L23_67, L24_68, L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L31_75, L32_76, L34_78 = L0_44, L10_54, L40_84, _UPVALUE23_.japanPPPoEConnectionGet(_UPVALUE1_, _UPVALUE25_)
              L23_67, L24_68, L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L31_75, L32_76, L35_79 = L0_44, L10_54, L40_84, _UPVALUE23_.japanPPPoEConnectionGet(_UPVALUE1_, _UPVALUE25_)
              L23_67, L24_68, L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L31_75, L32_76, L36_80 = L0_44, L10_54, L40_84, _UPVALUE23_.japanPPPoEConnectionGet(_UPVALUE1_, _UPVALUE25_)
              L23_67, L24_68, L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L31_75, L32_76, L37_81 = L0_44, L10_54, L40_84, _UPVALUE23_.japanPPPoEConnectionGet(_UPVALUE1_, _UPVALUE25_)
              L23_67, L24_68, L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L31_75, L32_76, L38_82 = L0_44, L10_54, L40_84, _UPVALUE23_.japanPPPoEConnectionGet(_UPVALUE1_, _UPVALUE25_)
              L23_67, L24_68, L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L31_75, L32_76, L39_83 = L0_44, L10_54, L40_84, _UPVALUE23_.japanPPPoEConnectionGet(_UPVALUE1_, _UPVALUE25_)
              L23_67, L24_68, L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L31_75, L32_76, L40_84 = L0_44, L10_54, L40_84, _UPVALUE23_.japanPPPoEConnectionGet(_UPVALUE1_, _UPVALUE25_)
              L23_67, L24_68, L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L31_75, L32_76, L41_85 = L0_44, L10_54, L40_84, _UPVALUE23_.japanPPPoEConnectionGet(_UPVALUE1_, _UPVALUE25_)
              L23_67, L24_68, L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L31_75, L32_76, L42_86 = L0_44, L10_54, L40_84, _UPVALUE23_.japanPPPoEConnectionGet(_UPVALUE1_, _UPVALUE25_)
              L23_67, L24_68, L25_69, L26_70, L27_71, L28_72, L29_73, L30_74, L31_75, L32_76, L43_87 = L0_44, L10_54, L40_84, _UPVALUE23_.japanPPPoEConnectionGet(_UPVALUE1_, _UPVALUE25_)
              L22_66 = L43_87
              L21_65 = L42_86
              L20_64 = L41_85
              L19_63 = L40_84
              L18_62 = L39_83
              L17_61 = L38_82
              L16_60 = L37_81
              L15_59 = L36_80
              L14_58 = L35_79
              L13_57 = L34_78
              L0_44 = L33_77
              L33_77 = _UPVALUE3_
              L33_77 = L33_77.SUCCESS
              if L0_44 ~= L33_77 then
                return L0_44
              end
              L33_77 = _UPVALUE17_
              L34_78 = tonumber
              L35_79 = L14_58
              L34_78 = L34_78(L35_79)
              L34_78 = L34_78 + 1
              L14_58 = L33_77[L34_78]
              L33_77 = _UPVALUE12_
              L34_78 = tonumber
              L35_79 = L20_64
              L34_78 = L34_78(L35_79)
              L34_78 = L34_78 + 1
              L20_64 = L33_77[L34_78]
              L33_77 = _UPVALUE17_
              L34_78 = tonumber
              L35_79 = L24_68
              L34_78 = L34_78(L35_79)
              L34_78 = L34_78 + 1
              L24_68 = L33_77[L34_78]
              L33_77 = _UPVALUE12_
              L34_78 = tonumber
              L35_79 = L28_72
              L34_78 = L34_78(L35_79)
              L34_78 = L34_78 + 1
              L28_72 = L33_77[L34_78]
              L33_77 = _UPVALUE18_
              L34_78 = tonumber
              L35_79 = L31_75
              L34_78 = L34_78(L35_79)
              L34_78 = L34_78 + 1
              L31_75 = L33_77[L34_78]
              L33_77 = _UPVALUE26_
              L34_78 = tonumber
              L35_79 = L23_67
              L34_78 = L34_78(L35_79)
              L23_67 = L33_77[L34_78]
              L33_77 = _UPVALUE11_
              L12_56 = L33_77[7]
              L10_54["ipv4Option2.returnCode"] = L0_44
              L10_54["ipv4Option2.cookie"] = L1_45
              L10_54["ipv4Option2.cookie1"] = L11_55
              L10_54["ipv4Option2.cookie2"] = L2_46
              L10_54["ipv4Option2.dual_wanPort"] = L13_57
              L10_54["ipv4Option2.dual_useDhcp"] = L14_58
              L10_54["ipv4Option2.dual_ipAddress"] = L15_59
              L10_54["ipv4Option2.dual_networkMask"] = L16_60
              L10_54["ipv4Option2.dual_userName"] = L17_61
              L33_77 = _UPVALUE3_
              L33_77 = L33_77.NIL
              if L18_62 ~= L33_77 then
                L33_77 = util
                L33_77 = L33_77.mask
                L34_78 = L18_62
                L33_77 = L33_77(L34_78)
                L10_54["ipv4Option2.dual_password"] = L33_77
              else
                L10_54["ipv4Option2.dual_password"] = L18_62
              end
              L10_54["ipv4Option2.dual_service"] = L19_63
              L10_54["ipv4Option2.dual_useIspDns"] = L20_64
              L10_54["ipv4Option2.dual_primaryDns"] = L21_65
              L10_54["ipv4Option2.dual_secondaryDns"] = L22_66
              L10_54["ipv4Option2.dual_authOpt"] = L23_67
              L10_54["ipv4Option2.dual_useDhcp2"] = L24_68
              L10_54["ipv4Option2.dual_ipAddress2"] = L25_69
              L10_54["ipv4Option2.dual_networkMask2"] = L26_70
              L10_54["ipv4Option2.dual_gateway2"] = L27_71
              L10_54["ipv4Option2.dual_useIspDns2"] = L28_72
              L10_54["ipv4Option2.dual_primaryDns2"] = L29_73
              L10_54["ipv4Option2.dual_secondaryDns2"] = L30_74
              L10_54["ipv4Option2.dual_reconnectMode"] = L31_75
              L10_54["ipv4Option2.dual_idleTimeOut"] = L32_76
              L10_54["ipv4Option2.macAddressType"] = L4_48
              L10_54["ipv4Option2.macAddress"] = L5_49
              L10_54["ipv4Option2.mtuType"] = L6_50
              L10_54["ipv4Option2.mtu"] = L7_51
              L10_54["ipv4Option2.speed"] = L8_52
              L10_54["ipv4Option2.modClientType"] = L12_56
              L33_77 = L0_44
              L34_78 = L10_54
              return L33_77, L34_78
            else
              L11_55 = _UPVALUE30_
              if L3_47 == L11_55 then
                L11_55, L12_56, L13_57, L14_58, L15_59, L16_60, L17_61, L18_62, L19_63, L20_64, L21_65, L22_66, L23_67, L24_68 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
                L25_69 = _UPVALUE31_
                L25_69 = L25_69.threegSettingsGet
                L26_70 = _UPVALUE1_
                L37_81 = L25_69(L26_70)
                L24_68 = L37_81
                L23_67 = L36_80
                L22_66 = L35_79
                L21_65 = L34_78
                L20_64 = L33_77
                L19_63 = L32_76
                L18_62 = L31_75
                L17_61 = L30_74
                L16_60 = L29_73
                L15_59 = L28_72
                L14_58 = L27_71
                L13_57 = L26_70
                L0_44 = L25_69
                L25_69 = _UPVALUE3_
                L25_69 = L25_69.SUCCESS
                if L0_44 ~= L25_69 then
                  return L0_44
                end
                L25_69 = _UPVALUE11_
                L12_56 = L25_69[10]
                if L22_66 == "0" then
                  L22_66 = "2"
                end
                L10_54["ipv4Option2.returnCode"] = L0_44
                L10_54["ipv4Option2.interfaceName"] = L13_57
                L25_69 = tostring
                L26_70 = tonumber
                L27_71 = L14_58
                L26_70 = L26_70(L27_71)
                L26_70 = L26_70 + 1
                L25_69 = L25_69(L26_70)
                L10_54["ipv4Option2.reconnectMode"] = L25_69
                L10_54["ipv4Option2.idleTime"] = L15_59
                L10_54["ipv4Option2.userName"] = L16_60
                L10_54["ipv4Option2.password"] = L17_61
                L10_54["ipv4Option2.dialNumber"] = L18_62
                L10_54["ipv4Option2.authType"] = L19_63
                L10_54["ipv4Option2.apnType"] = L20_64
                L10_54["ipv4Option2.apn"] = L21_65
                L10_54["ipv4Option2.dnsType"] = L22_66
                L10_54["ipv4Option2.primaryDNS"] = L23_67
                L10_54["ipv4Option2.secondaryDNS"] = L24_68
                L10_54["ipv4Option2.modClientType"] = L12_56
                L10_54["ipv4Option2.mtuType"] = L6_50
                L10_54["ipv4Option2.mtu"] = L7_51
                L25_69 = L0_44
                L26_70 = L10_54
                return L25_69, L26_70
              end
            end
          end
        end
      end
    end
  end
end
function option2settingsSectionSet(A0_88)
  local L1_89, L2_90, L3_91, L4_92, L5_93, L6_94, L7_95, L8_96, L9_97, L10_98, L11_99, L12_100, L13_101, L14_102, L15_103, L16_104, L17_105, L18_106, L19_107, L20_108, L21_109, L22_110, L23_111, L24_112, L25_113, L26_114, L27_115, L28_116, L29_117, L30_118, L31_119, L32_120, L33_121, L34_122, L35_123, L36_124, L37_125, L38_126, L39_127, L40_128, L41_129
  L1_89 = A0_88["ipv4Option2.cookie"]
  L2_90 = A0_88["ipv4Option2.clientType"]
  L3_91 = A0_88["ipv4Option2.macAddressType"]
  L4_92 = A0_88["ipv4Option2.macAddress"]
  L5_93 = A0_88["ipv4Option2.mtuType"]
  L6_94 = A0_88["ipv4Option2.mtu"]
  L7_95 = A0_88["ipv4Option2.speed"]
  L8_96 = {}
  L9_97 = _UPVALUE0_
  L9_97 = L9_97.NIL
  if L1_89 == L9_97 then
    L9_97 = util
    L9_97 = L9_97.appendDebugOut
    L10_98 = "Set : Invalid Cookie"
    L9_97(L10_98)
    L9_97 = _UPVALUE0_
    L9_97 = L9_97.BAD_PARAMETER
    return L9_97
  end
  L9_97 = _UPVALUE0_
  L9_97 = L9_97.NIL
  if L2_90 == L9_97 then
    L9_97 = util
    L9_97 = L9_97.appendDebugOut
    L10_98 = "Set : Invalid clientType"
    L9_97(L10_98)
    L9_97 = _UPVALUE0_
    L9_97 = L9_97.BAD_PARAMETER
    return L9_97
  end
  L9_97 = _UPVALUE0_
  L9_97 = L9_97.NIL
  if L5_93 == L9_97 then
    L9_97 = util
    L9_97 = L9_97.appendDebugOut
    L10_98 = "Set : Invalid mtuType"
    L9_97(L10_98)
    L9_97 = _UPVALUE0_
    L9_97 = L9_97.BAD_PARAMETER
    return L9_97
  end
  L9_97 = _UPVALUE1_
  L9_97 = L9_97[1]
  if L5_93 == L9_97 then
    L9_97 = _UPVALUE0_
    L9_97 = L9_97.NIL
    if L6_94 == L9_97 then
      L9_97 = util
      L9_97 = L9_97.appendDebugOut
      L10_98 = "Set : Invalid mtu"
      L9_97(L10_98)
      L9_97 = _UPVALUE0_
      L9_97 = L9_97.BAD_PARAMETER
      return L9_97
    end
  end
  L9_97 = _UPVALUE2_
  L9_97 = L9_97[3]
  if L3_91 == L9_97 then
    L9_97 = _UPVALUE0_
    L9_97 = L9_97.NIL
    if L4_92 == L9_97 then
      L9_97 = util
      L9_97 = L9_97.appendDebugOut
      L10_98 = "Set : Invalid macAddress"
      L9_97(L10_98)
      L9_97 = _UPVALUE0_
      L9_97 = L9_97.BAD_PARAMETER
      return L9_97
    end
  end
  L9_97, L10_98, L11_99, L12_100, L13_101, L14_102 = nil, nil, nil, nil, nil, nil
  L15_103 = _UPVALUE3_
  L15_103 = L15_103[1]
  if L2_90 == L15_103 then
    L14_102 = _UPVALUE4_
  else
    L15_103 = _UPVALUE3_
    L15_103 = L15_103[2]
    if L2_90 == L15_103 then
      L14_102 = _UPVALUE5_
    else
      L15_103 = _UPVALUE3_
      L15_103 = L15_103[3]
      if L2_90 ~= L15_103 then
        L15_103 = _UPVALUE3_
        L15_103 = L15_103[6]
      else
        if L2_90 == L15_103 then
          L14_102 = _UPVALUE6_
      end
      else
        L15_103 = _UPVALUE3_
        L15_103 = L15_103[4]
        if L2_90 ~= L15_103 then
          L15_103 = _UPVALUE3_
          L15_103 = L15_103[8]
        else
          if L2_90 == L15_103 then
            L14_102 = _UPVALUE7_
        end
        else
          L15_103 = _UPVALUE3_
          L15_103 = L15_103[5]
          if L2_90 ~= L15_103 then
            L15_103 = _UPVALUE3_
            L15_103 = L15_103[9]
          else
            if L2_90 == L15_103 then
              L14_102 = _UPVALUE8_
          end
          else
            L15_103 = _UPVALUE3_
            L15_103 = L15_103[7]
            if L2_90 == L15_103 then
              L14_102 = _UPVALUE9_
            else
              L15_103 = _UPVALUE3_
              L15_103 = L15_103[10]
              if L2_90 == L15_103 then
                L14_102 = _UPVALUE10_
              end
            end
          end
        end
      end
    end
  end
  L15_103 = _UPVALUE11_
  L15_103 = L15_103.ipModeSectionGet
  L17_105 = L15_103()
  if L18_106 == 3 then
    L21_109 = "Pppoe6"
    L21_109 = _UPVALUE0_
    L21_109 = L21_109.NIL
    if L20_108 == L21_109 then
      L21_109 = _UPVALUE0_
      L21_109 = L21_109.FAILURE
      return L21_109
    end
    L21_109 = tonumber
    L21_109 = L21_109(L22_110)
    if L21_109 == 2 then
      L21_109 = _UPVALUE3_
      L21_109 = L21_109[3]
      if L2_90 ~= L21_109 then
        L21_109 = _UPVALUE0_
        L21_109 = L21_109.CONFIGURED_PPPOE_COMMON_SESSION
        return L21_109
      end
    end
    L21_109 = tonumber
    L21_109 = L21_109(L22_110)
    if L21_109 == 2 then
      L21_109 = _UPVALUE3_
      L21_109 = L21_109[3]
      if L2_90 == L21_109 then
        L21_109 = A0_88["ipv4Option2.reconnectMode"]
        if L21_109 == L22_110 then
          return L22_110
        end
      end
    end
  end
  for L21_109, L22_110 in L18_106(L19_107) do
    if L22_110 == L3_91 then
      L3_91 = L21_109 - 1
      break
    end
  end
  for L21_109, L22_110 in L18_106(L19_107) do
    if L22_110 == L5_93 then
      L5_93 = L21_109 - 1
      break
    end
  end
  for L21_109, L22_110 in L18_106(L19_107) do
    if L22_110 == L7_95 then
      L7_95 = L21_109 - 1
      break
    end
  end
  if L2_90 == L18_106 then
    L21_109 = A0_88["ipv4Option2.hostName"]
    if L18_106 == L22_110 then
      L22_110(L23_111)
      return L22_110
    end
    if L18_106 == L22_110 then
      if L19_107 == L22_110 then
        L22_110(L23_111)
        return L22_110
      end
      if L20_108 == L22_110 then
        L22_110(L23_111)
        return L22_110
      end
    end
    for L25_113, L26_114 in L22_110(L23_111) do
      if L26_114 == L18_106 then
        break
      end
    end
    L25_113 = L19_107
    L26_114 = L20_108
    L27_115 = L21_109
    L11_99 = L23_111
    L9_97 = L22_110
  elseif L2_90 == L18_106 then
    L21_109 = A0_88["ipv4Option2.primaryDNS"]
    if L18_106 == L23_111 then
      L23_111(L24_112)
      return L23_111
    end
    if L19_107 == L23_111 then
      L23_111(L24_112)
      return L23_111
    end
    if L20_108 == L23_111 then
      L23_111(L24_112)
      return L23_111
    end
    if L21_109 == L23_111 then
      L23_111(L24_112)
      return L23_111
    end
    if L22_110 == L23_111 then
      L23_111(L24_112)
      return L23_111
    end
    L25_113 = L18_106
    L26_114 = L20_108
    if L23_111 == L24_112 then
      return L24_112
    end
    L25_113 = L18_106
    L26_114 = L20_108
    if L23_111 == L24_112 then
      return L24_112
    end
    L25_113 = L18_106
    L26_114 = L20_108
    L9_97 = L24_112
    if L9_97 == L24_112 then
      L25_113 = "Set : Invalid ipaddress"
      L24_112(L25_113)
      return L24_112
    end
    L25_113 = L18_106
    L26_114 = L20_108
    result = L24_112
    L25_113 = _UPVALUE0_
    L25_113 = L25_113.SUCCESS
    if L24_112 == L25_113 then
      return L24_112
    end
    L25_113 = L18_106
    L26_114 = L20_108
    result = L24_112
    L25_113 = _UPVALUE0_
    L25_113 = L25_113.SUCCESS
    if L24_112 == L25_113 then
      return L24_112
    end
    L25_113 = _UPVALUE16_
    L26_114 = L18_106
    L27_115 = L19_107
    L28_116 = L20_108
    L29_117 = L21_109
    L30_118 = L22_110
    L25_113 = L24_112(L25_113, L26_114, L27_115, L28_116, L29_117, L30_118)
    L11_99 = L25_113
    L9_97 = L24_112
  else
    if L2_90 ~= L18_106 then
    else
      if L2_90 == L18_106 then
        L21_109 = A0_88["ipv4Option2.useIspDns"]
        L25_113 = A0_88["ipv4Option2.netmask"]
        L26_114 = A0_88["ipv4Option2.primaryDNS"]
        L27_115 = A0_88["ipv4Option2.secondaryDNS"]
        L28_116 = A0_88["ipv4Option2.reconnectMode"]
        L29_117 = A0_88["ipv4Option2.maxIdleTime"]
        L30_118 = A0_88["ipv4Option2.splitTunnel"]
        if L2_90 == L34_122 then
        else
        end
        if L22_110 == L34_122 then
          L34_122(L35_123)
          return L34_122
        end
        if L18_106 == L34_122 then
          L34_122(L35_123)
          return L34_122
        end
        if L19_107 == L34_122 then
          L34_122(L35_123)
          return L34_122
        end
        if L28_116 == L34_122 then
          L34_122(L35_123)
          return L34_122
        end
        if L30_118 == L34_122 then
          L34_122(L35_123)
          return L34_122
        end
        if L31_119 == L34_122 then
          L34_122(L35_123)
          return L34_122
        end
        if L20_108 == L34_122 then
          if L23_111 == L34_122 then
            L34_122(L35_123)
            return L34_122
          end
          if L24_112 == L34_122 then
            L34_122(L35_123)
            return L34_122
          end
          if L25_113 == L34_122 then
            L34_122(L35_123)
            return L34_122
          end
        end
        if L21_109 == L34_122 then
          if L26_114 == L34_122 then
            L34_122(L35_123)
            return L34_122
          end
          if L27_115 == L34_122 then
            L34_122(L35_123)
            return L34_122
          end
        end
        if L28_116 == L34_122 then
          if L29_117 == L34_122 then
            L34_122(L35_123)
            return L34_122
          end
        end
        for L37_125, L38_126 in L34_122(L35_123) do
          if L38_126 == L20_108 then
            break
          end
        end
        for L37_125, L38_126 in L34_122(L35_123) do
          if L38_126 == L21_109 then
            L21_109 = L37_125 - 1
            break
          end
        end
        for L37_125, L38_126 in L34_122(L35_123) do
          if L38_126 == L28_116 then
            L28_116 = L37_125 - 1
            break
          end
        end
        if L34_122 ~= "DSR-1000AC_Ax" then
        elseif L34_122 == "DSR-1000_Bx" then
          L9_97 = L34_122
          if L9_97 ~= L34_122 then
            return L9_97
          end
        end
        L40_128 = L22_110
        L41_129 = L23_111
        L11_99 = L35_123
        L9_97 = L34_122
    end
    else
      if L2_90 ~= L18_106 then
      else
        if L2_90 == L18_106 then
          L21_109 = A0_88["ipv4Option2.useIspDns"]
          L25_113 = A0_88["ipv4Option2.netmask"]
          L26_114 = A0_88["ipv4Option2.primaryDNS"]
          L27_115 = A0_88["ipv4Option2.secondaryDNS"]
          L28_116 = A0_88["ipv4Option2.reconnectMode"]
          L29_117 = A0_88["ipv4Option2.maxIdleTime"]
          L30_118 = A0_88["ipv4Option2.splitTunnel"]
          if L2_90 == L34_122 then
          else
          end
          if L22_110 == L34_122 then
            L34_122(L35_123)
            return L34_122
          end
          if L31_119 == L34_122 then
            L34_122(L35_123)
            return L34_122
          end
          if L18_106 == L34_122 then
            L34_122(L35_123)
            return L34_122
          end
          if L19_107 == L34_122 then
            L34_122(L35_123)
            return L34_122
          end
          if L28_116 == L34_122 then
            L34_122(L35_123)
            return L34_122
          end
          if L30_118 == L34_122 then
            L34_122(L35_123)
            return L34_122
          end
          if L20_108 == L34_122 then
            if L23_111 == L34_122 then
              L34_122(L35_123)
              return L34_122
            end
            if L24_112 == L34_122 then
              L34_122(L35_123)
              return L34_122
            end
            if L25_113 == L34_122 then
              L34_122(L35_123)
              return L34_122
            end
          end
          if L21_109 == L34_122 then
            if L26_114 == L34_122 then
              L34_122(L35_123)
              return L34_122
            end
            if L27_115 == L34_122 then
              L34_122(L35_123)
              return L34_122
            end
          end
          if L28_116 == L34_122 then
            if L29_117 == L34_122 then
              L34_122(L35_123)
              return L34_122
            end
          end
          for L37_125, L38_126 in L34_122(L35_123) do
            if L38_126 == L20_108 then
              break
            end
          end
          for L37_125, L38_126 in L34_122(L35_123) do
            if L38_126 == L21_109 then
              L21_109 = L37_125 - 1
              break
            end
          end
          for L37_125, L38_126 in L34_122(L35_123) do
            if L38_126 == L28_116 then
              L28_116 = L37_125 - 1
              break
            end
          end
          if L34_122 ~= "DSR-1000AC_Ax" then
          elseif L34_122 == "DSR-1000_Bx" then
            L9_97 = L34_122
            if L9_97 ~= L34_122 then
              return L9_97
            end
          end
          L40_128 = L22_110
          L41_129 = L23_111
          L11_99 = L35_123
          L9_97 = L34_122
      end
      elseif L2_90 == L18_106 then
        L21_109 = A0_88["ipv4Option2.userName"]
        L25_113 = A0_88["ipv4Option2.domainName"]
        L26_114 = A0_88["ipv4Option2.useIspDns"]
        L27_115 = A0_88["ipv4Option2.primaryDns"]
        L28_116 = A0_88["ipv4Option2.secondaryDns"]
        L29_117 = A0_88["ipv4Option2.reconnectMode"]
        L30_118 = A0_88["ipv4Option2.idleTimeout"]
        if L18_106 == L31_119 then
          L31_119(L32_120)
          return L31_119
        end
        if L21_109 == L31_119 then
          L31_119(L32_120)
          return L31_119
        end
        if L22_110 == L31_119 then
          L31_119(L32_120)
          return L31_119
        end
        if L24_112 == L31_119 then
          L31_119(L32_120)
          return L31_119
        end
        if L29_117 == L31_119 then
          L31_119(L32_120)
          return L31_119
        end
        if L26_114 == L31_119 then
          L31_119(L32_120)
          return L31_119
        end
        if L18_106 == L31_119 then
          if L19_107 == L31_119 then
            L31_119(L32_120)
            return L31_119
          end
          if L20_108 == L31_119 then
            L31_119(L32_120)
            return L31_119
          end
        end
        if L26_114 == L31_119 then
          if L27_115 == L31_119 then
            L31_119(L32_120)
            return L31_119
          end
          if L28_116 == L31_119 then
            L31_119(L32_120)
            return L31_119
          end
        end
        if L29_117 == L31_119 then
          if L30_118 == L31_119 then
            L31_119(L32_120)
            return L31_119
          end
        end
        for L34_122, L35_123 in L31_119(L32_120) do
          if L35_123 == L18_106 then
            break
          end
        end
        for L34_122, L35_123 in L31_119(L32_120) do
          if L35_123 == L26_114 then
            L26_114 = L34_122 - 1
            break
          end
        end
        for L34_122, L35_123 in L31_119(L32_120) do
          if L35_123 == L29_117 then
            L29_117 = L34_122 - 1
            break
          end
        end
        for L34_122, L35_123 in L31_119(L32_120) do
          if L35_123 == L24_112 then
            break
          end
        end
        L40_128 = L24_112
        L41_129 = L26_114
        L11_99 = L33_121
        L9_97 = L32_120
      elseif L2_90 == L18_106 then
        L21_109 = A0_88["ipv4Option2.userName"]
        L25_113 = A0_88["ipv4Option2.primaryDns"]
        L26_114 = A0_88["ipv4Option2.secondaryDns"]
        L27_115 = A0_88["ipv4Option2.authenticationOptions"]
        L28_116 = A0_88["ipv4Option2.reconnectMode"]
        L29_117 = A0_88["ipv4Option2.idleTimeout"]
        L30_118 = A0_88["ipv4Option2.useDhcp1"]
        L40_128 = A0_88["ipv4Option2.reconnectMode1"]
        L41_129 = A0_88["ipv4Option2.idleTimeout1"]
        if L18_106 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid useDhcp")
          return _UPVALUE0_.BAD_PARAMETER
        end
        if L21_109 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid userName")
          return _UPVALUE0_.BAD_PARAMETER
        end
        if L22_110 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid password")
          return _UPVALUE0_.BAD_PARAMETER
        end
        if L27_115 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid authenticationOptions")
          return _UPVALUE0_.BAD_PARAMETER
        end
        if L28_116 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid reconnectMode")
          return _UPVALUE0_.BAD_PARAMETER
        end
        if L24_112 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid useIspDns")
          return _UPVALUE0_.BAD_PARAMETER
        end
        if L18_106 == _UPVALUE21_[1] then
          if L19_107 == _UPVALUE0_.NIL then
            util.appendDebugOut("Set : Invalid ipAddress")
            return _UPVALUE0_.BAD_PARAMETER
          end
          if L20_108 == _UPVALUE0_.NIL then
            util.appendDebugOut("Set : Invalid networkMask")
            return _UPVALUE0_.BAD_PARAMETER
          end
        end
        if L24_112 == _UPVALUE14_[1] then
          if L25_113 == _UPVALUE0_.NIL then
            util.appendDebugOut("Set : Invalid primaryDns")
            return _UPVALUE0_.BAD_PARAMETER
          end
          if L26_114 == _UPVALUE0_.NIL then
            util.appendDebugOut("Set : Invalid secondaryDns")
            return _UPVALUE0_.BAD_PARAMETER
          end
        end
        if L28_116 == _UPVALUE12_[2] and L29_117 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid idleTimeout")
          return _UPVALUE0_.BAD_PARAMETER
        end
        if L30_118 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid useDhcp1")
          return _UPVALUE0_.BAD_PARAMETER
        end
        if L33_121 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid userName1")
          return _UPVALUE0_.BAD_PARAMETER
        end
        if L34_122 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid password1")
          return _UPVALUE0_.BAD_PARAMETER
        end
        if L39_127 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid authenticationOptions1")
          return _UPVALUE0_.BAD_PARAMETER
        end
        if L40_128 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid reconnectMode1")
          return _UPVALUE0_.BAD_PARAMETER
        end
        if L36_124 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid useIspDns1")
          return _UPVALUE0_.BAD_PARAMETER
        end
        if L30_118 == _UPVALUE21_[1] then
          if L31_119 == _UPVALUE0_.NIL then
            util.appendDebugOut("Set : Invalid ipAddress1")
            return _UPVALUE0_.BAD_PARAMETER
          end
          if L32_120 == _UPVALUE0_.NIL then
            util.appendDebugOut("Set : Invalid networkMask1")
            return _UPVALUE0_.BAD_PARAMETER
          end
        end
        if L36_124 == _UPVALUE14_[1] then
          if L37_125 == _UPVALUE0_.NIL then
            util.appendDebugOut("Set : Invalid primaryDns1")
            return _UPVALUE0_.BAD_PARAMETER
          end
          if L38_126 == _UPVALUE0_.NIL then
            util.appendDebugOut("Set : Invalid secondaryDns1")
            return _UPVALUE0_.BAD_PARAMETER
          end
        end
        if L40_128 == _UPVALUE12_[2] and L41_129 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid idleTimeout1")
          return _UPVALUE0_.BAD_PARAMETER
        end
        for _FORV_45_, _FORV_46_ in pairs(_UPVALUE21_) do
          if _FORV_46_ == L18_106 then
            break
          end
        end
        for _FORV_45_, _FORV_46_ in pairs(_UPVALUE14_) do
          if _FORV_46_ == L24_112 then
            break
          end
        end
        for _FORV_45_, _FORV_46_ in pairs(_UPVALUE12_) do
          if _FORV_46_ == L28_116 then
            L28_116 = _FORV_45_ - 1
            break
          end
        end
        for _FORV_45_, _FORV_46_ in pairs(_UPVALUE25_) do
          if _FORV_46_ == L27_115 then
            L27_115 = _FORV_45_
            break
          end
        end
        for _FORV_45_, _FORV_46_ in pairs(_UPVALUE21_) do
          if _FORV_46_ == L30_118 then
            L30_118 = _FORV_45_ - 1
            break
          end
        end
        for _FORV_45_, _FORV_46_ in pairs(_UPVALUE14_) do
          if _FORV_46_ == L36_124 then
            break
          end
        end
        for _FORV_45_, _FORV_46_ in pairs(_UPVALUE12_) do
          if _FORV_46_ == L40_128 then
            L40_128 = _FORV_45_ - 1
            break
          end
        end
        for _FORV_45_, _FORV_46_ in pairs(_UPVALUE25_) do
          if _FORV_46_ == L39_127 then
            break
          end
        end
        L9_97, L11_99 = _UPVALUE28_.japanPPPoEConnectionSet(_UPVALUE16_, _UPVALUE29_, L18_106, L19_107, L20_108, L21_109, L22_110, L23_111, L24_112, L25_113, L26_114, L27_115, L28_116, L29_117)
        if L9_97 ~= _UPVALUE0_.SUCCESS then
          util.appendDebugOut("Error in configuring values in page ipv4Option1settings" .. L9_97)
          _UPVALUE30_.abort()
          return L9_97
        end
        L9_97, L13_101 = _UPVALUE28_.japanPPPoEConnectionSet(_UPVALUE16_, _UPVALUE31_, L30_118, L31_119, L32_120, L33_121, L34_122, L35_123, L36_124, L37_125, L38_126, L39_127, L40_128, L41_129)
      elseif L2_90 == L18_106 then
        L21_109 = A0_88["ipv4Option2.userName"]
        L25_113 = A0_88["ipv4Option2.primaryDns"]
        L26_114 = A0_88["ipv4Option2.secondaryDns"]
        L27_115 = A0_88["ipv4Option2.authenticationOptions"]
        L28_116 = A0_88["ipv4Option2.reconnectMode"]
        L29_117 = A0_88["ipv4Option2.idleTimeout"]
        L30_118 = A0_88["ipv4Option2.useDhcp2"]
        if L18_106 == L37_125 then
          L37_125(L38_126)
          return L37_125
        end
        if L21_109 == L37_125 then
          L37_125(L38_126)
          return L37_125
        end
        if L22_110 == L37_125 then
          L37_125(L38_126)
          return L37_125
        end
        if L27_115 == L37_125 then
          L37_125(L38_126)
          return L37_125
        end
        if L28_116 == L37_125 then
          L37_125(L38_126)
          return L37_125
        end
        if L24_112 == L37_125 then
          L37_125(L38_126)
          return L37_125
        end
        if L30_118 == L37_125 then
          L37_125(L38_126)
          return L37_125
        end
        if L34_122 == L37_125 then
          L37_125(L38_126)
          return L37_125
        end
        if L18_106 == L37_125 then
          if L19_107 == L37_125 then
            L37_125(L38_126)
            return L37_125
          end
          if L20_108 == L37_125 then
            L37_125(L38_126)
            return L37_125
          end
        end
        if L24_112 == L37_125 then
          if L25_113 == L37_125 then
            L37_125(L38_126)
            return L37_125
          end
          if L26_114 == L37_125 then
            L37_125(L38_126)
            return L37_125
          end
        end
        if L30_118 == L37_125 then
          if L31_119 == L37_125 then
            L37_125(L38_126)
            return L37_125
          end
          if L32_120 == L37_125 then
            L37_125(L38_126)
            return L37_125
          end
        end
        if L34_122 == L37_125 then
          if L35_123 == L37_125 then
            L37_125(L38_126)
            return L37_125
          end
          if L36_124 == L37_125 then
            L37_125(L38_126)
            return L37_125
          end
        end
        if L28_116 == L37_125 then
          if L29_117 == L37_125 then
            L37_125(L38_126)
            return L37_125
          end
        end
        for L40_128, L41_129 in L37_125(L38_126) do
          if L41_129 == L18_106 then
            break
          end
        end
        for L40_128, L41_129 in L37_125(L38_126) do
          if L41_129 == L24_112 then
            break
          end
        end
        for L40_128, L41_129 in L37_125(L38_126) do
          if L41_129 == L28_116 then
            L28_116 = L40_128 - 1
            break
          end
        end
        for L40_128, L41_129 in L37_125(L38_126) do
          if L41_129 == L27_115 then
            L27_115 = L40_128
            break
          end
        end
        for L40_128, L41_129 in L37_125(L38_126) do
          if L41_129 == L34_122 then
            break
          end
        end
        for L40_128, L41_129 in L37_125(L38_126) do
          if L41_129 == L30_118 then
            L30_118 = L40_128 - 1
            break
          end
        end
        L40_128 = L19_107
        L41_129 = L20_108
        L11_99 = L38_126
        L9_97 = L37_125
      elseif L2_90 == L18_106 then
        L21_109 = A0_88["ipv4Option2.userName"]
        L25_113 = A0_88["ipv4Option2.enableAPN"]
        L26_114 = A0_88["ipv4Option2.apn"]
        L27_115 = A0_88["ipv4Option2.dnsType"]
        L28_116 = A0_88["ipv4Option2.primaryDns"]
        L29_117 = A0_88["ipv4Option2.secondaryDns"]
        if L27_115 == "2" then
          L27_115 = "0"
        end
        L30_118 = tostring
        L30_118 = L30_118(L31_119)
        L30_118 = _UPVALUE33_
        L30_118 = L30_118.threegSettingsSet
        L40_128 = L27_115
        L41_129 = L28_116
        L30_118 = L30_118(L31_119, L32_120, L33_121, L34_122, L35_123, L36_124, L37_125, L38_126, L39_127, L40_128, L41_129, L29_117)
        L10_98 = L31_119
        L9_97 = L30_118
      end
    end
  end
  if L9_97 ~= L18_106 then
    L18_106(L19_107)
    L18_106()
    return L18_106, L19_107
  end
  L21_109 = L14_102
  L8_96 = L20_108
  L10_98 = L19_107
  L9_97 = L18_106
  if L9_97 ~= L18_106 then
    L18_106(L19_107)
    L18_106()
    return L18_106, L19_107
  end
  L21_109 = _UPVALUE16_
  L25_113 = L6_94
  L26_114 = L7_95
  L27_115 = L8_96
  L28_116 = L14_102
  L12_100 = L20_108
  L9_97 = L19_107
  if L9_97 ~= L19_107 then
    L21_109 = L9_97
    L19_107(L20_108)
    L19_107()
    return L19_107, L20_108
  end
  if L19_107 ~= "DSR-1000AC_Ax" then
    if L19_107 ~= "DSR-500AC_Ax" then
      if L19_107 ~= "DSR-500_Bx" then
        if L19_107 ~= "DSR-1000_Bx" then
          L21_109 = _UPVALUE16_
          L13_101 = L20_108
          L9_97 = L19_107
          if L9_97 ~= L19_107 then
            L21_109 = L9_97
            L19_107(L20_108)
            L19_107()
            return L19_107, L20_108
          end
        end
      end
    end
  end
  return L19_107, L20_108
end
function dmzsettingsSectionGet()
  local L0_130, L1_131, L2_132, L3_133, L4_134, L5_135, L6_136, L7_137, L8_138, L9_139, L10_140, L11_141, L12_142, L13_143, L14_144, L15_145, L16_146, L17_147, L18_148, L19_149, L20_150, L21_151, L22_152
  L0_130 = {}
  L1_131, L2_132, L3_133, L4_134, L5_135, L6_136, L7_137, L8_138 = nil, nil, nil, nil, nil, nil, nil, nil
  L9_139 = _UPVALUE0_
  L9_139 = L9_139.portGroupGet
  L10_140 = _UPVALUE1_
  L11_141 = _UPVALUE2_
  L16_146 = L9_139(L10_140, L11_141)
  L8_138 = L16_146
  L7_137 = L15_145
  L6_136 = L14_144
  L5_135 = L13_143
  L4_134 = L12_142
  L3_133 = L11_141
  L2_132 = L10_140
  L1_131 = L9_139
  L9_139 = _UPVALUE3_
  L9_139 = L9_139.SUCCESS
  if L1_131 ~= L9_139 then
    return L1_131
  end
  L9_139 = _UPVALUE4_
  L10_140 = tonumber
  L11_141 = L4_134
  L10_140 = L10_140(L11_141)
  L10_140 = L10_140 + 1
  L4_134 = L9_139[L10_140]
  L9_139 = _UPVALUE5_
  L10_140 = tonumber
  L11_141 = L6_136
  L10_140 = L10_140(L11_141)
  L10_140 = L10_140 + 1
  L6_136 = L9_139[L10_140]
  L9_139 = _UPVALUE6_
  L10_140 = tonumber
  L11_141 = L8_138
  L10_140 = L10_140(L11_141)
  L10_140 = L10_140 + 1
  L8_138 = L9_139[L10_140]
  L9_139, L10_140, L11_141, L12_142, L13_143, L14_144, L15_145, L16_146, L17_147, L18_148, L19_149, L20_150, L21_151, L22_152 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L1_131, L22_152, L9_139, L10_140, L16_146, L11_141, L12_142, L13_143 = _UPVALUE7_.dmzAddressGet()
  if L1_131 ~= _UPVALUE3_.SUCCESS then
    return L1_131
  end
  returnCode1, cookie1, L9_139, L10_140, L14_144, L15_145, L16_146, L17_147, L18_148, L19_149, L20_150, L21_151 = _UPVALUE8_.dhcpServerDMZGet()
  if returnCode1 ~= _UPVALUE3_.SUCCESS then
    return L1_131
  end
  if L11_141 == _UPVALUE9_ then
    L11_141 = _UPVALUE10_[2]
  elseif L11_141 == _UPVALUE11_ then
    L11_141 = _UPVALUE10_[3]
  else
    L11_141 = _UPVALUE10_[1]
  end
  L0_130["ipv4Option2.dmz_ipAddress"] = L9_139
  L0_130["ipv4Option2.dmz_subnetMask"] = L10_140
  L0_130["ipv4Option2.dmz_dhcpType"] = L11_141
  L0_130["ipv4Option2.dmz_dnsProxy"] = L12_142
  L0_130["ipv4Option2.dmz_dhcpRelay"] = L13_143
  L0_130["ipv4Option2.dmz_startIPAddress"] = L14_144
  L0_130["ipv4Option2.dmz_endIPAddress"] = L15_145
  L0_130["ipv4Option2.dmz_domainName"] = L19_149
  L0_130["ipv4Option2.dmz_gateWay"] = L16_146
  L0_130["ipv4Option2.dmz_primaryDnsServer"] = L17_147
  L0_130["ipv4Option2.dmz_secondaryDnsServer"] = L18_148
  L0_130["ipv4Option2.dmz_winsServer"] = L20_150
  L0_130["ipv4Option2.dmz_leaseTime"] = L21_151
  L0_130["ipv4Option2.macAddressType"] = L4_134
  L0_130["ipv4Option2.macAddress"] = L5_135
  L0_130["ipv4Option2.mtuType"] = L6_136
  L0_130["ipv4Option2.mtu"] = L7_137
  L0_130["ipv4Option2.speed"] = L8_138
  return L1_131, L0_130
end
function dmzsettinsSectionSet(A0_153)
  local L1_154, L2_155, L3_156, L4_157, L5_158, L6_159, L7_160, L8_161, L9_162, L10_163, L11_164, L12_165, L13_166, L14_167, L15_168, L16_169, L17_170, L18_171, L19_172, L20_173
  L1_154 = _UPVALUE0_
  L2_155 = A0_153["ipv4Option2.ipAddress"]
  L3_156 = A0_153["ipv4Option2.subnetMask"]
  L4_157 = A0_153["ipv4Option2.dhcpType"]
  L5_158 = A0_153["ipv4Option2.dnsProxy"]
  L6_159 = A0_153["ipv4Option2.dhcpRelay"]
  L7_160 = _UPVALUE1_
  L7_160 = L7_160.NIL
  if L1_154 == L7_160 then
    L7_160 = util
    L7_160 = L7_160.appendDebugOut
    L8_161 = "Set : Invalid Cookie"
    L7_160(L8_161)
    L7_160 = _UPVALUE1_
    L7_160 = L7_160.BAD_PARAMETER
    return L7_160
  end
  L7_160 = _UPVALUE1_
  L7_160 = L7_160.NIL
  if L2_155 ~= L7_160 then
    L7_160 = _UPVALUE1_
    L7_160 = L7_160.NIL
  elseif L3_156 == L7_160 then
    L7_160 = util
    L7_160 = L7_160.appendDebugOut
    L8_161 = "Set : Invalid ipAddress or subnetMask"
    L7_160(L8_161)
    L7_160 = _UPVALUE1_
    L7_160 = L7_160.BAD_PARAMETER
    return L7_160
  end
  L7_160 = _UPVALUE2_
  L7_160 = L7_160[1]
  if L4_157 == L7_160 then
    L4_157 = _UPVALUE3_
  else
    L7_160 = _UPVALUE2_
    L7_160 = L7_160[2]
    if L4_157 == L7_160 then
      L4_157 = _UPVALUE4_
    else
      L7_160 = _UPVALUE2_
      L7_160 = L7_160[3]
      if L4_157 == L7_160 then
        L4_157 = _UPVALUE5_
      end
    end
  end
  L7_160 = _UPVALUE6_
  L7_160 = L7_160.start
  L7_160()
  L7_160, L8_161 = nil, nil
  L9_162 = _UPVALUE7_
  L9_162 = L9_162.dmzAddressSet
  L10_163 = L1_154
  L11_164 = L2_155
  L12_165 = L3_156
  L13_166 = NIL
  L14_167 = L4_157
  L15_168 = L5_158
  L16_169 = L6_159
  L10_163 = L9_162(L10_163, L11_164, L12_165, L13_166, L14_167, L15_168, L16_169)
  L8_161 = L10_163
  L7_160 = L9_162
  L9_162 = _UPVALUE1_
  L9_162 = L9_162.SUCCESS
  if L7_160 ~= L9_162 then
    L9_162 = util
    L9_162 = L9_162.appendDebugOut
    L10_163 = "Error in configuring values in page ipv4Option2settings.html"
    L11_164 = L7_160
    L10_163 = L10_163 .. L11_164
    L9_162(L10_163)
    L9_162 = _UPVALUE6_
    L9_162 = L9_162.abort
    L9_162()
    L9_162 = L7_160
    L10_163 = L1_154
    return L9_162, L10_163
  end
  L9_162 = _UPVALUE4_
  if L4_157 == L9_162 then
    L9_162 = A0_153["ipv4Option2.startIPAddress"]
    L10_163 = A0_153["ipv4Option2.endIPAddress"]
    L11_164 = A0_153["ipv4Option2.domainName"]
    L12_165 = A0_153["ipv4Option2.gateWay"]
    L13_166 = A0_153["ipv4Option2.primaryDnsServer"]
    L14_167 = A0_153["ipv4Option2.secondaryDnsServer"]
    L15_168 = A0_153["ipv4Option2.winsServer"]
    L16_169 = A0_153["ipv4Option2.leaseTime"]
    L17_170 = _UPVALUE8_
    L17_170 = L17_170.typeFind
    L18_171 = _UPVALUE9_
    L18_171 = L17_170(L18_171)
    L19_172 = _UPVALUE1_
    L19_172 = L19_172.SUCCESS
    if L17_170 ~= L19_172 then
      L19_172 = util
      L19_172 = L19_172.appendDebugOut
      L20_173 = "Error in configuring values in page ipv4Option2settings.html"
      L20_173 = L20_173 .. L7_160
      L19_172(L20_173)
      L19_172 = _UPVALUE6_
      L19_172 = L19_172.abort
      L19_172()
      L19_172 = L7_160
      L20_173 = L1_154
      return L19_172, L20_173
    end
    L19_172, L20_173 = nil, nil
    L19_172, L20_173 = _UPVALUE8_.dhcpServerDMZSet(L18_171, L2_155, L3_156, L9_162, L10_163, L12_165, L13_166, L14_167, L11_164, L15_168, L16_169)
    if L19_172 ~= _UPVALUE1_.SUCCESS then
      util.appendDebugOut("Error in configuring values in page ipv4Option2settings.html" .. L7_160)
      _UPVALUE6_.abort()
      return L19_172, L18_171
    end
  end
  L9_162 = _UPVALUE1_
  L9_162 = L9_162.SUCCESS
  L10_163 = L8_161
  return L9_162, L10_163
end
function ipv4Option2settingsSectionDefaultsGet()
  local L0_174, L1_175, L2_176, L3_177, L4_178, L5_179, L6_180, L7_181, L8_182, L9_183, L10_184, L11_185, L12_186, L13_187
  L0_174 = _UPVALUE0_
  L1_175 = _UPVALUE1_
  L2_176 = _UPVALUE2_
  L2_176 = L2_176[2]
  L3_177 = _UPVALUE3_
  L3_177 = L3_177[2]
  L4_178 = _UPVALUE4_
  L5_179 = _UPVALUE5_
  L6_180 = _UPVALUE5_
  L7_181 = _UPVALUE1_
  L8_182 = _UPVALUE6_
  L9_183 = util
  L9_183 = L9_183.mask
  L10_184 = _UPVALUE7_
  L9_183 = L9_183(L10_184)
  L10_184 = _UPVALUE8_
  L11_185 = _UPVALUE9_
  L12_186 = _UPVALUE10_
  L13_187 = _UPVALUE11_
  return L0_174, L1_175, L2_176, L3_177, L4_178, L5_179, L6_180, L7_181, L8_182, L9_183, L10_184, L11_185, L12_186, L13_187
end
function ipv4Option2settingsSectionWanmodeCheck()
  return _UPVALUE0_.wanmodeCheck()
end
function routingModeStatusCheck()
  local L0_188
  L0_188 = _UPVALUE0_.routingModeStatus()
  return L0_188
end
function ipv4Option2vlanWAN2PortModeInfoGet()
  local L0_189, L1_190
  L0_189 = _UPVALUE0_
  L0_189 = L0_189.FAILURE
  L1_190 = {}
  if PRODUCT_ID ~= "DSR-1000AC_Ax" and PRODUCT_ID ~= "DSR-500AC_Ax" and PRODUCT_ID ~= "DSR-1000_Bx" and PRODUCT_ID ~= "DSR-500_Bx" then
    L0_189, L1_190 = _UPVALUE1_.vlan_on_WAN2_portModeInfoGet()
  else
    L0_189, L1_190 = _UPVALUE2_.vlanOverWanConfigGet("WAN2")
  end
  if L0_189 ~= _UPVALUE0_.SUCCESS then
    L1_190 = {}
  end
  return L1_190
end
function ipv4Option2vlanTabGet()
  local L0_191, L1_192
  L0_191 = _UPVALUE0_
  L0_191 = L0_191.FAILURE
  L1_192 = {}
  L0_191, L1_192 = _UPVALUE1_.vlan_dummy_table_InfoGet()
  if L0_191 ~= _UPVALUE0_.SUCCESS then
    L1_192 = {}
  end
  return L1_192
end
function ipv4Option2WANvlanTabGet()
  local L0_193, L1_194
  L0_193 = _UPVALUE0_
  L0_193 = L0_193.FAILURE
  L1_194 = {}
  L0_193, L1_194 = _UPVALUE1_.vlan_on_WAN2_InfoGet()
  return L1_194
end
