local L0_0, L1_1, L2_2, L3_3
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
L1_1 = "teamf1lualib/management_config"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/ipv6_mode_bl"
L0_0(L1_1)
L0_0, L1_1, L2_2, L3_3 = nil, nil, nil, nil
if PRODUCT_ID ~= "DSR-1000AC_Ax" and PRODUCT_ID ~= "DSR-500AC_Ax" and PRODUCT_ID ~= "DSR-500_Bx" and PRODUCT_ID ~= "DSR-1000_Bx" then
  require("teamf1lualib/vlan_on_wan_core")
  require("teamf1lualib/services_igmpProxy")
  L0_0 = require("com.teamf1.core.vlanOn.wan")
  L1_1 = require("com.teamf1.core.services.igmpproxy")
else
  require("teamf1lualib/wan_vlanOverWan")
  require("teamf1lualib/wan_ipAliasing")
  L2_2 = require("com.teamf1.core.wan.vlanOverWan")
  L3_3 = require("com.teamf1.core.wan.ipaliasing")
end
function ipv4Option1settingsSectionGet()
  local L0_4, L1_5, L2_6, L3_7, L4_8, L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, L21_25, L22_26, L23_27, L24_28, L25_29, L26_30, L27_31, L28_32, L29_33, L30_34, L31_35, L32_36, L33_37, L34_38, L35_39, L36_40, L37_41, L38_42, L39_43, L40_44, L41_45, L42_46, L43_47
  L10_14 = {}
  L11_15 = _UPVALUE0_
  L11_15 = L11_15.connectionTypeGet
  L12_16 = _UPVALUE1_
  L13_17 = _UPVALUE2_
  L13_17 = L11_15(L12_16, L13_17)
  L3_7 = L13_17
  L1_5 = L12_16
  L0_4 = L11_15
  L11_15 = _UPVALUE3_
  L11_15 = L11_15.SUCCESS
  if L0_4 ~= L11_15 then
    return L0_4
  end
  L11_15 = _UPVALUE4_
  L11_15 = L11_15.portGroupGet
  L12_16 = _UPVALUE1_
  L13_17 = _UPVALUE2_
  L18_22 = L11_15(L12_16, L13_17)
  L8_12 = L18_22
  L7_11 = L17_21
  L6_10 = L16_20
  L5_9 = L15_19
  L4_8 = L14_18
  L9_13 = L13_17
  L2_6 = L12_16
  L0_4 = L11_15
  L11_15 = _UPVALUE3_
  L11_15 = L11_15.SUCCESS
  if L0_4 ~= L11_15 then
    return L0_4
  end
  L11_15 = _UPVALUE5_
  L12_16 = tonumber
  L13_17 = L4_8
  L12_16 = L12_16(L13_17)
  L12_16 = L12_16 + 1
  L4_8 = L11_15[L12_16]
  L11_15 = _UPVALUE6_
  L12_16 = tonumber
  L13_17 = L6_10
  L12_16 = L12_16(L13_17)
  L12_16 = L12_16 + 1
  L6_10 = L11_15[L12_16]
  L11_15 = _UPVALUE7_
  L12_16 = tonumber
  L13_17 = L8_12
  L12_16 = L12_16(L13_17)
  L12_16 = L12_16 + 1
  L8_12 = L11_15[L12_16]
  L11_15 = _UPVALUE8_
  if L3_7 == L11_15 then
    L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
    L21_25 = _UPVALUE9_
    L21_25 = L21_25.dhcpGet
    L30_34 = L21_25()
    L20_24 = L30_34
    L19_23 = L29_33
    L18_22 = L28_32
    L17_21 = L27_31
    L16_20 = L26_30
    L15_19 = L25_29
    L14_18 = L24_28
    L13_17 = L23_27
    L11_15 = L22_26
    L0_4 = L21_25
    L21_25 = _UPVALUE3_
    L21_25 = L21_25.SUCCESS
    if L0_4 ~= L21_25 then
      return L0_4
    end
    L21_25 = _UPVALUE10_
    L12_16 = L21_25[2]
    L21_25 = _UPVALUE11_
    L22_26 = tonumber
    L23_27 = L17_21
    L22_26 = L22_26(L23_27)
    L22_26 = L22_26 + 1
    L17_21 = L21_25[L22_26]
    L10_14["ipv4Option1.returnCode"] = L0_4
    L10_14["ipv4Option1.cookie"] = L1_5
    L10_14["ipv4Option1.cookie1"] = L11_15
    L10_14["ipv4Option1.cookie2"] = L2_6
    L10_14["ipv4Option1.dhcp_wanPort"] = L13_17
    L10_14["ipv4Option1.dhcp_ipAddress"] = L14_18
    L10_14["ipv4Option1.dhcp_gateway"] = L15_19
    L10_14["ipv4Option1.dhcp_networkMask"] = L16_20
    L10_14["ipv4Option1.dhcp_useIspDns"] = L17_21
    L10_14["ipv4Option1.dhcp_primaryDNS"] = L18_22
    L10_14["ipv4Option1.dhcp_secondaryDNS"] = L19_23
    L10_14["ipv4Option1.dhcp_hostName"] = L20_24
    L10_14["ipv4Option1.macAddressType"] = L4_8
    L10_14["ipv4Option1.macAddress"] = L5_9
    L10_14["ipv4Option1.mtuType"] = L6_10
    L10_14["ipv4Option1.mtu"] = L7_11
    L10_14["ipv4Option1.speed"] = L8_12
    L10_14["ipv4Option1.modClientType"] = L12_16
    L21_25 = L0_4
    L22_26 = L10_14
    return L21_25, L22_26
  else
    L11_15 = _UPVALUE12_
    if L3_7 == L11_15 then
      L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22 = nil, nil, nil, nil, nil, nil, nil, nil
      L19_23 = _UPVALUE13_
      L19_23 = L19_23.staticGroupGet
      L20_24 = _UPVALUE1_
      L21_25 = _UPVALUE2_
      L26_30 = L19_23(L20_24, L21_25)
      L18_22 = L26_30
      L17_21 = L25_29
      L16_20 = L24_28
      L15_19 = L23_27
      L14_18 = L22_26
      L13_17 = L21_25
      L11_15 = L20_24
      L0_4 = L19_23
      L19_23 = _UPVALUE3_
      L19_23 = L19_23.SUCCESS
      if L0_4 ~= L19_23 then
        return L0_4
      end
      L19_23 = _UPVALUE10_
      L12_16 = L19_23[1]
      L10_14["ipv4Option1.returnCode"] = L0_4
      L10_14["ipv4Option1.cookie"] = L1_5
      L10_14["ipv4Option1.cookie1"] = L11_15
      L10_14["ipv4Option1.cookie2"] = L2_6
      L10_14["ipv4Option1.static_wanPort"] = L13_17
      L10_14["ipv4Option1.static_ipAddress"] = L14_18
      L10_14["ipv4Option1.static_gateway"] = L15_19
      L10_14["ipv4Option1.static_networkMask"] = L16_20
      L10_14["ipv4Option1.static_primaryDNS"] = L17_21
      L10_14["ipv4Option1.static_secondaryDNS"] = L18_22
      L19_23 = hostName
      L10_14["ipv4Option1.static_hostName"] = L19_23
      L10_14["ipv4Option1.macAddressType"] = L4_8
      L10_14["ipv4Option1.macAddress"] = L5_9
      L10_14["ipv4Option1.mtuType"] = L6_10
      L10_14["ipv4Option1.mtu"] = L7_11
      L10_14["ipv4Option1.speed"] = L8_12
      L10_14["ipv4Option1.modClientType"] = L12_16
      L19_23 = L0_4
      L20_24 = L10_14
      return L19_23, L20_24
    else
      L11_15 = _UPVALUE14_
      if L3_7 == L11_15 then
        L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, L21_25, L22_26, L23_27, L24_28, L25_29, L26_30, L27_31, L28_32, L29_33 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
        L30_34 = _UPVALUE15_
        L30_34 = L30_34.pptpClientGroupGet
        L25_29, L26_30, L27_31, L28_32, L29_33, L30_34 = nil, nil, nil, nil, nil, L30_34()
        L25_29, L26_30, L27_31, L28_32, L29_33, L31_35 = nil, nil, nil, nil, nil, L30_34()
        L25_29, L26_30, L27_31, L28_32, L29_33, L32_36 = nil, nil, nil, nil, nil, L30_34()
        L25_29, L26_30, L27_31, L28_32, L29_33, L33_37 = nil, nil, nil, nil, nil, L30_34()
        L25_29, L26_30, L27_31, L28_32, L29_33, L34_38 = nil, nil, nil, nil, nil, L30_34()
        L25_29, L26_30, L27_31, L28_32, L29_33, L35_39 = nil, nil, nil, nil, nil, L30_34()
        L25_29, L26_30, L27_31, L28_32, L29_33, L36_40 = nil, nil, nil, nil, nil, L30_34()
        L25_29, L26_30, L27_31, L28_32, L29_33, L37_41 = nil, nil, nil, nil, nil, L30_34()
        L25_29, L26_30, L27_31, L28_32, L29_33, L38_42 = nil, nil, nil, nil, nil, L30_34()
        L25_29, L26_30, L27_31, L28_32, L29_33, L39_43 = nil, nil, nil, nil, nil, L30_34()
        L25_29, L26_30, L27_31, L28_32, L29_33, L40_44 = nil, nil, nil, nil, nil, L30_34()
        L25_29, L26_30, L27_31, L28_32, L29_33, L41_45 = nil, nil, nil, nil, nil, L30_34()
        L25_29, L26_30, L27_31, L28_32, L29_33, L42_46 = nil, nil, nil, nil, nil, L30_34()
        L25_29, L26_30, L27_31, L28_32, L29_33, L43_47 = nil, nil, nil, nil, nil, L30_34()
        L24_28 = L43_47
        L23_27 = L42_46
        L22_26 = L41_45
        L21_25 = L40_44
        L20_24 = L39_43
        L19_23 = L38_42
        L18_22 = L37_41
        L17_21 = L36_40
        L16_20 = L35_39
        L15_19 = L34_38
        L14_18 = L33_37
        L13_17 = L32_36
        L11_15 = L31_35
        L0_4 = L30_34
        L30_34 = _UPVALUE3_
        L30_34 = L30_34.SUCCESS
        if L0_4 ~= L30_34 then
          return L0_4
        end
        L30_34 = _UPVALUE16_
        L31_35 = tonumber
        L32_36 = L16_20
        L31_35 = L31_35(L32_36)
        L31_35 = L31_35 + 1
        L16_20 = L30_34[L31_35]
        L30_34 = _UPVALUE11_
        L31_35 = tonumber
        L32_36 = L17_21
        L31_35 = L31_35(L32_36)
        L31_35 = L31_35 + 1
        L17_21 = L30_34[L31_35]
        L30_34 = _UPVALUE17_
        L31_35 = tonumber
        L32_36 = L24_28
        L31_35 = L31_35(L32_36)
        L31_35 = L31_35 + 1
        L24_28 = L30_34[L31_35]
        L30_34 = _UPVALUE18_
        if L28_32 == L30_34 then
          L30_34 = _UPVALUE10_
          L12_16 = L30_34[8]
        else
          L30_34 = _UPVALUE10_
          L12_16 = L30_34[4]
        end
        L10_14["ipv4Option1.returnCode"] = L0_4
        L10_14["ipv4Option1.cookie"] = L1_5
        L10_14["ipv4Option1.cookie1"] = L11_15
        L10_14["ipv4Option1.cookie2"] = L2_6
        L10_14["ipv4Option1.pptp_wanPort"] = L13_17
        L10_14["ipv4Option1.pptp_userName"] = L14_18
        L30_34 = _UPVALUE3_
        L30_34 = L30_34.NIL
        if L15_19 ~= L30_34 then
          L30_34 = util
          L30_34 = L30_34.mask
          L31_35 = L15_19
          L30_34 = L30_34(L31_35)
          L10_14["ipv4Option1.pptp_password"] = L30_34
        else
          L10_14["ipv4Option1.pptp_password"] = L15_19
        end
        L10_14["ipv4Option1.pptp_useDhcp"] = L16_20
        L10_14["ipv4Option1.pptp_useIspDns"] = L17_21
        L10_14["ipv4Option1.pptp_serverIPAddress"] = L18_22
        L10_14["ipv4Option1.pptp_staticIPAddress"] = L19_23
        L10_14["ipv4Option1.pptp_gateway"] = L20_24
        L10_14["ipv4Option1.pptp_netmask"] = L21_25
        L10_14["ipv4Option1.pptp_primaryDNS"] = L22_26
        L10_14["ipv4Option1.pptp_secondaryDNS"] = L23_27
        L10_14["ipv4Option1.pptp_reconnectMode"] = L24_28
        L10_14["ipv4Option1.pptp_maxIdleTime"] = L25_29
        L10_14["ipv4Option1.pptp_splitTunnel"] = L26_30
        L10_14["ipv4Option1.pptp_mppeEncryption"] = L27_31
        L10_14["ipv4Option1.pptp_dualAccess"] = L28_32
        L10_14["ipv4Option1.macAddressType"] = L4_8
        L10_14["ipv4Option1.macAddress"] = L5_9
        L10_14["ipv4Option1.mtuType"] = L6_10
        L10_14["ipv4Option1.mtu"] = L7_11
        L10_14["ipv4Option1.speed"] = L8_12
        L10_14["ipv4Option1.modClientType"] = L12_16
        L10_14["ipv4Option1.static_DNS_IP"] = L29_33
        L30_34 = L0_4
        L31_35 = L10_14
        return L30_34, L31_35
      else
        L11_15 = _UPVALUE19_
        if L3_7 == L11_15 then
          L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, L21_25, L22_26, L23_27, L24_28, L25_29, L26_30, L27_31, L28_32, L29_33 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
          L30_34 = _UPVALUE20_
          L30_34 = L30_34.l2tpClientGroupGet
          L25_29, L26_30, L27_31, L28_32, L29_33, L43_47 = L30_34()
          L24_28 = L43_47
          L23_27 = L42_46
          L22_26 = L41_45
          L21_25 = L40_44
          L20_24 = L39_43
          L19_23 = L38_42
          L18_22 = L37_41
          L17_21 = L36_40
          L16_20 = L35_39
          L15_19 = L34_38
          L14_18 = L33_37
          L13_17 = L32_36
          L11_15 = L31_35
          L0_4 = L30_34
          L30_34 = _UPVALUE3_
          L30_34 = L30_34.SUCCESS
          if L0_4 ~= L30_34 then
            return L0_4
          end
          L30_34 = _UPVALUE16_
          L31_35 = tonumber
          L32_36 = L16_20
          L31_35 = L31_35(L32_36)
          L31_35 = L31_35 + 1
          L16_20 = L30_34[L31_35]
          L30_34 = _UPVALUE11_
          L31_35 = tonumber
          L32_36 = L17_21
          L31_35 = L31_35(L32_36)
          L31_35 = L31_35 + 1
          L17_21 = L30_34[L31_35]
          L30_34 = _UPVALUE17_
          L31_35 = tonumber
          L32_36 = L24_28
          L31_35 = L31_35(L32_36)
          L31_35 = L31_35 + 1
          L24_28 = L30_34[L31_35]
          L30_34 = _UPVALUE18_
          if L27_31 == L30_34 then
            L30_34 = _UPVALUE10_
            L12_16 = L30_34[9]
          else
            L30_34 = _UPVALUE10_
            L12_16 = L30_34[5]
          end
          L10_14["ipv4Option1.returnCode"] = L0_4
          L10_14["ipv4Option1.cookie"] = L1_5
          L10_14["ipv4Option1.cookie1"] = L11_15
          L10_14["ipv4Option1.cookie2"] = L2_6
          L10_14["ipv4Option1.l2tp_wanPort"] = L13_17
          L10_14["ipv4Option1.l2tp_userName"] = L14_18
          L30_34 = _UPVALUE3_
          L30_34 = L30_34.NIL
          if L15_19 ~= L30_34 then
            L30_34 = util
            L30_34 = L30_34.mask
            L31_35 = L15_19
            L30_34 = L30_34(L31_35)
            L10_14["ipv4Option1.l2tp_password"] = L30_34
          else
            L10_14["ipv4Option1.l2tp_password"] = L15_19
          end
          L10_14["ipv4Option1.l2tp_useDhcp"] = L16_20
          L10_14["ipv4Option1.l2tp_useIspDns"] = L17_21
          L10_14["ipv4Option1.l2tp_serverIPAddress"] = L18_22
          L10_14["ipv4Option1.l2tp_staticIPAddress"] = L19_23
          L10_14["ipv4Option1.l2tp_gateway"] = L20_24
          L10_14["ipv4Option1.l2tp_netmask"] = L21_25
          L10_14["ipv4Option1.l2tp_primaryDNS"] = L22_26
          L10_14["ipv4Option1.l2tp_secondaryDNS"] = L23_27
          L10_14["ipv4Option1.l2tp_reconnectMode"] = L24_28
          L10_14["ipv4Option1.l2tp_maxIdleTime"] = L25_29
          L10_14["ipv4Option1.l2tp_splitTunnel"] = L26_30
          L10_14["ipv4Option1.l2tp_dualAccess"] = L27_31
          L30_34 = _UPVALUE3_
          L30_34 = L30_34.NIL
          if L28_32 ~= L30_34 then
            L30_34 = util
            L30_34 = L30_34.mask
            L31_35 = L28_32
            L30_34 = L30_34(L31_35)
            L10_14["ipv4Option1.l2tp_secret"] = L30_34
          else
            L10_14["ipv4Option1.l2tp_secret"] = L28_32
          end
          L10_14["ipv4Option1.macAddressType"] = L4_8
          L10_14["ipv4Option1.macAddress"] = L5_9
          L10_14["ipv4Option1.mtuType"] = L6_10
          L10_14["ipv4Option1.mtu"] = L7_11
          L10_14["ipv4Option1.speed"] = L8_12
          L10_14["ipv4Option1.modClientType"] = L12_16
          L10_14["ipv4Option1.static_DNS_IP"] = L29_33
          L30_34 = L0_4
          L31_35 = L10_14
          return L30_34, L31_35
        else
          L11_15 = _UPVALUE21_
          if L3_7 == L11_15 then
            L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, L21_25, L22_26, L23_27, L24_28, L25_29, L26_30, L27_31, L28_32, L29_33, L30_34, L31_35, L32_36, L33_37, L34_38, L35_39, L36_40, L37_41, L38_42, L39_43, L40_44, L41_45, L42_46, L43_47 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
            L0_4, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, L21_25, L22_26, L23_27, L24_28, L25_29, L26_30, L27_31, L28_32 = _UPVALUE22_.japanPPPoEConnectionGet(_UPVALUE1_, _UPVALUE23_)
            if L0_4 ~= _UPVALUE3_.SUCCESS then
              return L0_4
            end
            L0_4, L29_33, L30_34, L31_35, L32_36, L33_37, L34_38, L35_39, L36_40, L37_41, L38_42, L39_43, L40_44, L41_45, L42_46, L43_47 = _UPVALUE22_.japanPPPoEConnectionGet(_UPVALUE1_, _UPVALUE24_)
            if L0_4 ~= _UPVALUE3_.SUCCESS then
              return L0_4
            end
            L16_20 = _UPVALUE16_[tonumber(L16_20) + 1]
            L22_26 = _UPVALUE11_[tonumber(L22_26) + 1]
            L31_35 = _UPVALUE16_[tonumber(L31_35) + 1]
            L37_41 = _UPVALUE11_[tonumber(L37_41) + 1]
            L27_31 = _UPVALUE17_[tonumber(L27_31) + 1]
            L42_46 = _UPVALUE17_[tonumber(L42_46) + 1]
            L25_29 = _UPVALUE25_[tonumber(L25_29)]
            L40_44 = _UPVALUE25_[tonumber(L40_44)]
            if L41_45 == _UPVALUE26_ then
              L13_17 = _UPVALUE10_[3]
              L10_14["ipv4Option1.returnCode"] = L0_4
              L10_14["ipv4Option1.cookie"] = L1_5
              L10_14["ipv4Option1.cookie1"] = L11_15
              L10_14["ipv4Option1.cookie2"] = L2_6
              L10_14["ipv4Option1.pppoe_wanPort"] = L14_18
              L10_14["ipv4Option1.pppoe_profileName"] = L15_19
              L10_14["ipv4Option1.pppoe_useDhcp"] = L16_20
              L10_14["ipv4Option1.pppoe_ipAddress"] = L17_21
              L10_14["ipv4Option1.pppoe_networkMask"] = L18_22
              L10_14["ipv4Option1.pppoe_userName"] = L19_23
              if L20_24 ~= _UPVALUE3_.NIL then
                L10_14["ipv4Option1.pppoe_password"] = util.mask(L20_24)
              else
                L10_14["ipv4Option1.pppoe_password"] = L20_24
              end
              L10_14["ipv4Option1.pppoe_service"] = L21_25
              L10_14["ipv4Option1.pppoe_useIspDns"] = L22_26
              L10_14["ipv4Option1.pppoe_primaryDns"] = L23_27
              L10_14["ipv4Option1.pppoe_secondaryDns"] = L24_28
              L10_14["ipv4Option1.pppoe_authOpt"] = L25_29
              L10_14["ipv4Option1.pppoe_status"] = L26_30
              L10_14["ipv4Option1.pppoe_reconnectMode"] = L27_31
              L10_14["ipv4Option1.pppoe_idleTimeOutVal"] = L28_32
              L10_14["ipv4Option1.macAddressType"] = L4_8
              L10_14["ipv4Option1.macAddress"] = L5_9
              L10_14["ipv4Option1.mtuType"] = L6_10
              L10_14["ipv4Option1.mtu"] = L7_11
              L10_14["ipv4Option1.speed"] = L8_12
              L10_14["ipv4Option1.modClientType"] = L13_17
              return L0_4, L10_14
            else
              L13_17 = _UPVALUE10_[6]
              L10_14["ipv4Option1.returnCode"] = L0_4
              L10_14["ipv4Option1.cookie"] = L1_5
              L10_14["ipv4Option1.cookie1"] = L11_15
              L10_14["ipv4Option1.cookie2"] = L2_6
              L10_14["ipv4Option1.pppoe_wanPort"] = L14_18
              L10_14["ipv4Option1.pppoe_profileName"] = L15_19
              L10_14["ipv4Option1.pppoe_useDhcp"] = L16_20
              L10_14["ipv4Option1.pppoe_ipAddress"] = L17_21
              L10_14["ipv4Option1.pppoe_networkMask"] = L18_22
              L10_14["ipv4Option1.pppoe_userName"] = L19_23
              if L20_24 ~= _UPVALUE3_.NIL then
                L10_14["ipv4Option1.pppoe_password"] = util.mask(L20_24)
              else
                L10_14["ipv4Option1.pppoe_password"] = L20_24
              end
              L10_14["ipv4Option1.pppoe_service"] = L21_25
              L10_14["ipv4Option1.pppoe_useIspDns"] = L22_26
              L10_14["ipv4Option1.pppoe_primaryDns"] = L23_27
              L10_14["ipv4Option1.pppoe_secondaryDns"] = L24_28
              L10_14["ipv4Option1.pppoe_authOpt"] = L25_29
              L10_14["ipv4Option1.pppoe_status"] = L26_30
              L10_14["ipv4Option1.pppoe_reconnectMode"] = L27_31
              L10_14["ipv4Option1.pppoe_idleTimeOutVal"] = L28_32
              L10_14["ipv4Option1.pppoe_wanPort1"] = L29_33
              L10_14["ipv4Option1.pppoe_profileName1"] = L30_34
              L10_14["ipv4Option1.pppoe_useDhcp1"] = L31_35
              L10_14["ipv4Option1.pppoe_ipAddress1"] = L32_36
              L10_14["ipv4Option1.pppoe_networkMask1"] = L33_37
              L10_14["ipv4Option1.pppoe_userName1"] = L34_38
              if L35_39 ~= _UPVALUE3_.NIL then
                L10_14["ipv4Option1.pppoe_password1"] = util.mask(L35_39)
              else
                L10_14["ipv4Option1.pppoe_password1"] = L35_39
              end
              L10_14["ipv4Option1.pppoe_service1"] = L36_40
              L10_14["ipv4Option1.pppoe_useIspDns1"] = L37_41
              L10_14["ipv4Option1.pppoe_primaryDns1"] = L38_42
              L10_14["ipv4Option1.pppoe_secondaryDns1"] = L39_43
              L10_14["ipv4Option1.pppoe_authOpt1"] = L40_44
              L10_14["ipv4Option1.pppoe_status1"] = L41_45
              L10_14["ipv4Option1.pppoe_reconnectMode1"] = L42_46
              L10_14["ipv4Option1.pppoe_idleTimeOutVal1"] = L43_47
              L10_14["ipv4Option1.macAddressType"] = L4_8
              L10_14["ipv4Option1.macAddress"] = L5_9
              L10_14["ipv4Option1.mtuType"] = L6_10
              L10_14["ipv4Option1.mtu"] = L7_11
              L10_14["ipv4Option1.speed"] = L8_12
              L10_14["ipv4Option1.modClientType"] = L13_17
              return L0_4, L10_14
            end
          else
            L11_15 = _UPVALUE27_
            if L3_7 == L11_15 then
              L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, L21_25, L22_26, L23_27, L24_28, L25_29, L26_30, L27_31, L28_32, L29_33, L30_34, L31_35, L32_36 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
              L33_37 = _UPVALUE28_
              L33_37 = L33_37.russiaPPPoEConnectionGet
              L34_38 = _UPVALUE1_
              L23_27, L24_28, L25_29, L26_30, L27_31, L28_32, L29_33, L30_34, L31_35, L32_36, L33_37 = L0_4, L10_14, L40_44, _UPVALUE22_.japanPPPoEConnectionGet(_UPVALUE1_, _UPVALUE24_)
              L23_27, L24_28, L25_29, L26_30, L27_31, L28_32, L29_33, L30_34, L31_35, L32_36, L34_38 = L0_4, L10_14, L40_44, _UPVALUE22_.japanPPPoEConnectionGet(_UPVALUE1_, _UPVALUE24_)
              L23_27, L24_28, L25_29, L26_30, L27_31, L28_32, L29_33, L30_34, L31_35, L32_36, L35_39 = L0_4, L10_14, L40_44, _UPVALUE22_.japanPPPoEConnectionGet(_UPVALUE1_, _UPVALUE24_)
              L23_27, L24_28, L25_29, L26_30, L27_31, L28_32, L29_33, L30_34, L31_35, L32_36, L36_40 = L0_4, L10_14, L40_44, _UPVALUE22_.japanPPPoEConnectionGet(_UPVALUE1_, _UPVALUE24_)
              L23_27, L24_28, L25_29, L26_30, L27_31, L28_32, L29_33, L30_34, L31_35, L32_36, L37_41 = L0_4, L10_14, L40_44, _UPVALUE22_.japanPPPoEConnectionGet(_UPVALUE1_, _UPVALUE24_)
              L23_27, L24_28, L25_29, L26_30, L27_31, L28_32, L29_33, L30_34, L31_35, L32_36, L38_42 = L0_4, L10_14, L40_44, _UPVALUE22_.japanPPPoEConnectionGet(_UPVALUE1_, _UPVALUE24_)
              L23_27, L24_28, L25_29, L26_30, L27_31, L28_32, L29_33, L30_34, L31_35, L32_36, L39_43 = L0_4, L10_14, L40_44, _UPVALUE22_.japanPPPoEConnectionGet(_UPVALUE1_, _UPVALUE24_)
              L23_27, L24_28, L25_29, L26_30, L27_31, L28_32, L29_33, L30_34, L31_35, L32_36, L40_44 = L0_4, L10_14, L40_44, _UPVALUE22_.japanPPPoEConnectionGet(_UPVALUE1_, _UPVALUE24_)
              L23_27, L24_28, L25_29, L26_30, L27_31, L28_32, L29_33, L30_34, L31_35, L32_36, L41_45 = L0_4, L10_14, L40_44, _UPVALUE22_.japanPPPoEConnectionGet(_UPVALUE1_, _UPVALUE24_)
              L23_27, L24_28, L25_29, L26_30, L27_31, L28_32, L29_33, L30_34, L31_35, L32_36, L42_46 = L0_4, L10_14, L40_44, _UPVALUE22_.japanPPPoEConnectionGet(_UPVALUE1_, _UPVALUE24_)
              L23_27, L24_28, L25_29, L26_30, L27_31, L28_32, L29_33, L30_34, L31_35, L32_36, L43_47 = L0_4, L10_14, L40_44, _UPVALUE22_.japanPPPoEConnectionGet(_UPVALUE1_, _UPVALUE24_)
              L22_26 = L43_47
              L21_25 = L42_46
              L20_24 = L41_45
              L19_23 = L40_44
              L18_22 = L39_43
              L17_21 = L38_42
              L16_20 = L37_41
              L15_19 = L36_40
              L14_18 = L35_39
              L13_17 = L34_38
              L0_4 = L33_37
              L33_37 = _UPVALUE3_
              L33_37 = L33_37.SUCCESS
              if L0_4 ~= L33_37 then
                return L0_4
              end
              L33_37 = _UPVALUE16_
              L34_38 = tonumber
              L35_39 = L14_18
              L34_38 = L34_38(L35_39)
              L34_38 = L34_38 + 1
              L14_18 = L33_37[L34_38]
              L33_37 = _UPVALUE11_
              L34_38 = tonumber
              L35_39 = L20_24
              L34_38 = L34_38(L35_39)
              L34_38 = L34_38 + 1
              L20_24 = L33_37[L34_38]
              L33_37 = _UPVALUE16_
              L34_38 = tonumber
              L35_39 = L24_28
              L34_38 = L34_38(L35_39)
              L34_38 = L34_38 + 1
              L24_28 = L33_37[L34_38]
              L33_37 = _UPVALUE11_
              L34_38 = tonumber
              L35_39 = L28_32
              L34_38 = L34_38(L35_39)
              L34_38 = L34_38 + 1
              L28_32 = L33_37[L34_38]
              L33_37 = _UPVALUE17_
              L34_38 = tonumber
              L35_39 = L31_35
              L34_38 = L34_38(L35_39)
              L34_38 = L34_38 + 1
              L31_35 = L33_37[L34_38]
              L33_37 = _UPVALUE25_
              L34_38 = tonumber
              L35_39 = L23_27
              L34_38 = L34_38(L35_39)
              L23_27 = L33_37[L34_38]
              L33_37 = _UPVALUE10_
              L12_16 = L33_37[7]
              L10_14["ipv4Option1.returnCode"] = L0_4
              L10_14["ipv4Option1.cookie"] = L1_5
              L10_14["ipv4Option1.cookie1"] = L11_15
              L10_14["ipv4Option1.cookie2"] = L2_6
              L10_14["ipv4Option1.dual_wanPort"] = L13_17
              L10_14["ipv4Option1.dual_useDhcp"] = L14_18
              L10_14["ipv4Option1.dual_ipAddress"] = L15_19
              L10_14["ipv4Option1.dual_networkMask"] = L16_20
              L10_14["ipv4Option1.dual_userName"] = L17_21
              L33_37 = _UPVALUE3_
              L33_37 = L33_37.NIL
              if L18_22 ~= L33_37 then
                L33_37 = util
                L33_37 = L33_37.mask
                L34_38 = L18_22
                L33_37 = L33_37(L34_38)
                L10_14["ipv4Option1.dual_password"] = L33_37
              else
                L10_14["ipv4Option1.dual_password"] = L18_22
              end
              L10_14["ipv4Option1.dual_service"] = L19_23
              L10_14["ipv4Option1.dual_useIspDns"] = L20_24
              L10_14["ipv4Option1.dual_primaryDns"] = L21_25
              L10_14["ipv4Option1.dual_secondaryDns"] = L22_26
              L10_14["ipv4Option1.dual_authOpt"] = L23_27
              L10_14["ipv4Option1.dual_useDhcp2"] = L24_28
              L10_14["ipv4Option1.dual_ipAddress2"] = L25_29
              L10_14["ipv4Option1.dual_networkMask2"] = L26_30
              L10_14["ipv4Option1.dual_gateway2"] = L27_31
              L10_14["ipv4Option1.dual_useIspDns2"] = L28_32
              L10_14["ipv4Option1.dual_primaryDns2"] = L29_33
              L10_14["ipv4Option1.dual_secondaryDns2"] = L30_34
              L10_14["ipv4Option1.dual_reconnectMode"] = L31_35
              L10_14["ipv4Option1.dual_idleTimeOut"] = L32_36
              L10_14["ipv4Option1.macAddressType"] = L4_8
              L10_14["ipv4Option1.macAddress"] = L5_9
              L10_14["ipv4Option1.mtuType"] = L6_10
              L10_14["ipv4Option1.mtu"] = L7_11
              L10_14["ipv4Option1.speed"] = L8_12
              L10_14["ipv4Option1.modClientType"] = L12_16
              L33_37 = L0_4
              L34_38 = L10_14
              return L33_37, L34_38
            end
          end
        end
      end
    end
  end
end
function ipv4Option1settingsSectionSet(A0_48)
  local L1_49, L2_50, L3_51, L4_52, L5_53, L6_54, L7_55, L8_56, L9_57, L10_58, L11_59, L12_60, L13_61, L14_62, L15_63, L16_64, L17_65, L18_66, L19_67, L20_68, L21_69, L22_70, L23_71, L24_72, L25_73, L26_74, L27_75, L28_76, L29_77, L30_78, L31_79, L32_80, L33_81, L34_82, L35_83, L36_84, L37_85, L38_86, L39_87, L40_88, L41_89, L42_90, L43_91, L44_92, L45_93, L46_94
  L1_49 = {}
  L2_50 = ACCESS_LEVEL
  if L2_50 ~= 0 then
    L2_50 = util
    L2_50 = L2_50.appendDebugOut
    L3_51 = "Detected Unauthorized access for page ipv4Option1settings"
    L2_50(L3_51)
    L2_50 = _UPVALUE0_
    L2_50 = L2_50.UNAUTHORIZED
    return L2_50
  end
  L2_50 = A0_48["ipv4Option1.cookie"]
  L3_51 = A0_48["ipv4Option1.clientType"]
  L4_52 = A0_48["ipv4Option1.macAddressType"]
  L5_53 = A0_48["ipv4Option1.macAddress"]
  L6_54 = A0_48["ipv4Option1.mtuType"]
  L7_55 = A0_48["ipv4Option1.mtu"]
  L8_56 = A0_48["ipv4Option1.speed"]
  L9_57 = A0_48["ipv4Option1.vlanWan1Status"]
  L10_58 = A0_48["ipv4Option1.hvlanWan1Status"]
  L11_59 = A0_48["ipv4Option1.vlanId"]
  L12_60 = A0_48["ipv4Option1.hdvlanId"]
  L13_61 = _UPVALUE1_
  L14_62 = _UPVALUE0_
  L14_62 = L14_62.NIL
  if L2_50 == L14_62 then
    L14_62 = util
    L14_62 = L14_62.appendDebugOut
    L15_63 = "Set : Invalid Cookie"
    L14_62(L15_63)
    L14_62 = _UPVALUE0_
    L14_62 = L14_62.BAD_PARAMETER
    return L14_62
  end
  L14_62 = _UPVALUE0_
  L14_62 = L14_62.NIL
  if L9_57 ~= L14_62 then
    L14_62 = _UPVALUE0_
    L14_62 = L14_62.NIL
  elseif L10_58 == L14_62 then
    L14_62 = util
    L14_62 = L14_62.appendDebugOut
    L15_63 = "Set : Invalid Cookie"
    L14_62(L15_63)
    L14_62 = _UPVALUE0_
    L14_62 = L14_62.BAD_PARAMETER
    return L14_62
  end
  L14_62 = tonumber
  L15_63 = L9_57
  L14_62 = L14_62(L15_63)
  if L14_62 == 1 then
    L14_62 = _UPVALUE0_
    L14_62 = L14_62.NIL
    if L11_59 == L14_62 then
      L14_62 = util
      L14_62 = L14_62.appendDebugOut
      L15_63 = "Set : Invalid Cookie"
      L14_62(L15_63)
      L14_62 = _UPVALUE0_
      L14_62 = L14_62.BAD_PARAMETER
      return L14_62
    end
    L14_62 = UNIT_NAME
    if L14_62 ~= "DSR-150" then
      L14_62 = UNIT_NAME
    elseif L14_62 == "DSR-150N" then
      L14_62 = tonumber
      L15_63 = L11_59
      L14_62 = L14_62(L15_63)
      if L14_62 ~= 13 then
        L14_62 = tonumber
        L15_63 = L11_59
        L14_62 = L14_62(L15_63)
      elseif L14_62 == 4093 then
        L14_62 = util
        L14_62 = L14_62.appendDebugOut
        L15_63 = "Set : Reserved Vlan ID"
        L14_62(L15_63)
        L14_62 = _UPVALUE0_
        L14_62 = L14_62.RESERVED_VLANID_DMZ
        return L14_62
      end
    end
    L14_62 = UNIT_NAME
    if L14_62 ~= "DSR-250" then
      L14_62 = UNIT_NAME
    elseif L14_62 == "DSR-250N" then
      L14_62 = tonumber
      L15_63 = L11_59
      L14_62 = L14_62(L15_63)
      if L14_62 == 4093 then
        L14_62 = util
        L14_62 = L14_62.appendDebugOut
        L15_63 = "Set : Reserved Vlan ID"
        L14_62(L15_63)
        L14_62 = _UPVALUE0_
        L14_62 = L14_62.RESERVED_VLANID_DMZ
        return L14_62
      end
    end
  else
    L11_59 = A0_48["ipv4Option1.hdvlanId"]
  end
  L14_62 = _UPVALUE0_
  L14_62 = L14_62.NIL
  if L3_51 == L14_62 then
    L14_62 = util
    L14_62 = L14_62.appendDebugOut
    L15_63 = "Set : Invalid clientType"
    L14_62(L15_63)
    L14_62 = _UPVALUE0_
    L14_62 = L14_62.BAD_PARAMETER
    return L14_62
  end
  L14_62 = _UPVALUE0_
  L14_62 = L14_62.NIL
  if L4_52 == L14_62 then
    L14_62 = util
    L14_62 = L14_62.appendDebugOut
    L15_63 = "Set : Invalid macAddressType"
    L14_62(L15_63)
    L14_62 = _UPVALUE0_
    L14_62 = L14_62.BAD_PARAMETER
    return L14_62
  end
  L14_62 = _UPVALUE0_
  L14_62 = L14_62.NIL
  if L6_54 == L14_62 then
    L14_62 = util
    L14_62 = L14_62.appendDebugOut
    L15_63 = "Set : Invalid mtuType"
    L14_62(L15_63)
    L14_62 = _UPVALUE0_
    L14_62 = L14_62.BAD_PARAMETER
    return L14_62
  end
  L14_62 = _UPVALUE0_
  L14_62 = L14_62.NIL
  if L8_56 == L14_62 then
    L14_62 = util
    L14_62 = L14_62.appendDebugOut
    L15_63 = "Set : Invalid speed"
    L14_62(L15_63)
    L14_62 = _UPVALUE0_
    L14_62 = L14_62.BAD_PARAMETER
    return L14_62
  end
  L14_62 = _UPVALUE2_
  L14_62 = L14_62[1]
  if L6_54 == L14_62 then
    L14_62 = _UPVALUE0_
    L14_62 = L14_62.NIL
    if L7_55 == L14_62 then
      L14_62 = util
      L14_62 = L14_62.appendDebugOut
      L15_63 = "Set : Invalid mtu"
      L14_62(L15_63)
      L14_62 = _UPVALUE0_
      L14_62 = L14_62.BAD_PARAMETER
      return L14_62
    end
  end
  L14_62 = _UPVALUE3_
  L14_62 = L14_62[3]
  if L4_52 == L14_62 then
    L14_62 = _UPVALUE0_
    L14_62 = L14_62.NIL
    if L5_53 == L14_62 then
      L14_62 = util
      L14_62 = L14_62.appendDebugOut
      L15_63 = "Set : Invalid macAddress"
      L14_62(L15_63)
      L14_62 = _UPVALUE0_
      L14_62 = L14_62.BAD_PARAMETER
      return L14_62
    end
  end
  L14_62, L15_63, L16_64, L17_65, L18_66, L19_67 = nil, nil, nil, nil, nil, nil
  L20_68 = _UPVALUE4_
  L20_68 = L20_68[1]
  if L3_51 == L20_68 then
    L19_67 = _UPVALUE5_
  else
    L20_68 = _UPVALUE4_
    L20_68 = L20_68[2]
    if L3_51 == L20_68 then
      L19_67 = _UPVALUE6_
    else
      L20_68 = _UPVALUE4_
      L20_68 = L20_68[3]
      if L3_51 ~= L20_68 then
        L20_68 = _UPVALUE4_
        L20_68 = L20_68[6]
      else
        if L3_51 == L20_68 then
          L19_67 = _UPVALUE7_
      end
      else
        L20_68 = _UPVALUE4_
        L20_68 = L20_68[4]
        if L3_51 ~= L20_68 then
          L20_68 = _UPVALUE4_
          L20_68 = L20_68[8]
        else
          if L3_51 == L20_68 then
            L19_67 = _UPVALUE8_
        end
        else
          L20_68 = _UPVALUE4_
          L20_68 = L20_68[5]
          if L3_51 ~= L20_68 then
            L20_68 = _UPVALUE4_
            L20_68 = L20_68[9]
          else
            if L3_51 == L20_68 then
              L19_67 = _UPVALUE9_
          end
          else
            L20_68 = _UPVALUE4_
            L20_68 = L20_68[7]
            if L3_51 == L20_68 then
              L19_67 = _UPVALUE10_
            end
          end
        end
      end
    end
  end
  L20_68 = _UPVALUE11_
  L20_68 = L20_68.ipModeSectionGet
  L22_70 = L20_68()
  if L23_71 == 3 then
    L26_74 = "Pppoe6"
    L26_74 = _UPVALUE0_
    L26_74 = L26_74.NIL
    if L25_73 == L26_74 then
      L26_74 = _UPVALUE0_
      L26_74 = L26_74.FAILURE
      return L26_74
    end
    L26_74 = tonumber
    L26_74 = L26_74(L27_75)
    if L26_74 == 2 then
      L26_74 = _UPVALUE4_
      L26_74 = L26_74[3]
      if L3_51 ~= L26_74 then
        L26_74 = _UPVALUE0_
        L26_74 = L26_74.CONFIGURED_PPPOE_COMMON_SESSION
        return L26_74
      end
    end
    L26_74 = tonumber
    L26_74 = L26_74(L27_75)
    if L26_74 == 2 then
      L26_74 = _UPVALUE4_
      L26_74 = L26_74[3]
      if L3_51 == L26_74 then
        L26_74 = A0_48["ipv4Option1.reconnectMode"]
        if L26_74 == L27_75 then
          return L27_75
        end
      end
    end
  end
  for L26_74, L27_75 in L23_71(L24_72) do
    if L27_75 == L4_52 then
      L4_52 = L26_74 - 1
      break
    end
  end
  for L26_74, L27_75 in L23_71(L24_72) do
    if L27_75 == L6_54 then
      L6_54 = L26_74 - 1
      break
    end
  end
  for L26_74, L27_75 in L23_71(L24_72) do
    if L27_75 == L8_56 then
      L8_56 = L26_74 - 1
      break
    end
  end
  if L23_71 ~= L24_72 then
    L13_61 = _UPVALUE14_
  elseif L23_71 == 1 then
    if L23_71 ~= L24_72 then
      L13_61 = _UPVALUE14_
    end
  end
  if L23_71 ~= "DSR-1000AC" then
  elseif L23_71 == "DSR-1000_Bx" then
    L23_71()
  end
  if L13_61 == L23_71 then
    if L23_71 ~= "DSR-1000AC" then
      if L23_71 ~= "DSR-500AC" then
        if L23_71 ~= "DSR-500_Bx" then
          if L23_71 ~= "DSR-1000_Bx" then
            L23_71()
            if L23_71 ~= "DSR-250" then
            elseif L23_71 == "DSR-150N" then
              if L23_71 == 1 then
                L14_62 = L23_71
                if L14_62 ~= L23_71 then
                  L26_74 = L14_62
                  L23_71(L24_72)
                  L23_71()
                  return L23_71, L24_72
                end
              end
            end
            L14_62 = L23_71
            if L14_62 ~= L23_71 then
              L23_71(L24_72)
              L23_71()
              return L23_71, L24_72
            end
            L14_62 = L23_71
            if L14_62 ~= L23_71 then
              L23_71(L24_72)
              L23_71()
              return L23_71, L24_72
            end
            L23_71()
            L23_71()
          end
        end
      end
    else
      L26_74 = "WAN1"
      L14_62 = L23_71
      if L14_62 ~= L23_71 then
        L23_71(L24_72)
        L23_71()
        return L23_71, L24_72
      end
    end
  end
  if L23_71 ~= "DSR-1000AC" then
    if L23_71 ~= "DSR-500AC" then
      if L23_71 ~= "DSR-500_Bx" then
        if L23_71 ~= "DSR-1000_Bx" then
          L23_71()
        end
      end
    end
  end
  if L3_51 == L23_71 then
    L26_74 = A0_48["ipv4Option1.hostName"]
    if L27_75 ~= "DSR-1000AC" then
      if L27_75 ~= "DSR-500AC" then
        if L27_75 ~= "DSR-500_Bx" then
          if L27_75 ~= "DSR-1000_Bx" then
            if L23_71 == L27_75 then
              L27_75(L28_76)
              return L27_75
            end
            if L23_71 == L27_75 then
              if L24_72 == L27_75 then
                L27_75(L28_76)
                return L27_75
              end
              if L25_73 == L27_75 then
                L27_75(L28_76)
                return L27_75
              end
            end
          end
        end
      end
    else
      if L23_71 == L27_75 then
        L27_75(L28_76)
        L27_75()
        return L27_75
      end
      if L23_71 == L27_75 then
        if L24_72 == L27_75 then
          L27_75(L28_76)
          L27_75()
          return L27_75
        end
        if L25_73 == L27_75 then
          L27_75(L28_76)
          L27_75()
          return L27_75
        end
      end
    end
    for L30_78, L31_79 in L27_75(L28_76) do
      if L31_79 == L23_71 then
        break
      end
    end
    L30_78 = L24_72
    L31_79 = L25_73
    L32_80 = L26_74
    L16_64 = L28_76
    L14_62 = L27_75
  elseif L3_51 == L23_71 then
    L26_74 = A0_48["ipv4Option1.primaryDNS"]
    if L23_71 == L28_76 then
      L28_76(L29_77)
      return L28_76
    end
    if L24_72 == L28_76 then
      L28_76(L29_77)
      return L28_76
    end
    if L25_73 == L28_76 then
      L28_76(L29_77)
      return L28_76
    end
    if L26_74 == L28_76 then
      L28_76(L29_77)
      return L28_76
    end
    if L27_75 == L28_76 then
      L28_76(L29_77)
      return L28_76
    end
    L30_78 = L23_71
    L31_79 = L25_73
    if L28_76 == L29_77 then
      return L29_77
    end
    L30_78 = L23_71
    L31_79 = L25_73
    if L28_76 == L29_77 then
      return L29_77
    end
    L30_78 = L23_71
    L31_79 = L25_73
    if L28_76 == L29_77 then
      return L29_77
    end
    L30_78 = L23_71
    L31_79 = L25_73
    if L28_76 == L29_77 then
      return L29_77
    end
    L30_78 = _UPVALUE20_
    L31_79 = L23_71
    L32_80 = L24_72
    L33_81 = L25_73
    L34_82 = L26_74
    L35_83 = L27_75
    L30_78 = L29_77(L30_78, L31_79, L32_80, L33_81, L34_82, L35_83)
    L16_64 = L30_78
    L14_62 = L29_77
  else
    if L3_51 ~= L23_71 then
    else
      if L3_51 == L23_71 then
        L26_74 = A0_48["ipv4Option1.useIspDns"]
        L30_78 = A0_48["ipv4Option1.netmask"]
        L31_79 = A0_48["ipv4Option1.primaryDNS"]
        L32_80 = A0_48["ipv4Option1.secondaryDNS"]
        L33_81 = A0_48["ipv4Option1.reconnectMode"]
        L34_82 = A0_48["ipv4Option1.maxIdleTime"]
        L35_83 = A0_48["ipv4Option1.splitTunnel"]
        if L3_51 == L39_87 then
        else
        end
        if L27_75 == L39_87 then
          L39_87(L40_88)
          return L39_87
        end
        if L23_71 == L39_87 then
          L39_87(L40_88)
          return L39_87
        end
        if L24_72 == L39_87 then
          L39_87(L40_88)
          return L39_87
        end
        if L33_81 == L39_87 then
          L39_87(L40_88)
          return L39_87
        end
        if L35_83 == L39_87 then
          L39_87(L40_88)
          return L39_87
        end
        if L36_84 == L39_87 then
          L39_87(L40_88)
          return L39_87
        end
        if L25_73 == L39_87 then
          if L28_76 == L39_87 then
            L39_87(L40_88)
            return L39_87
          end
          if L29_77 == L39_87 then
            L39_87(L40_88)
            return L39_87
          end
          if L30_78 == L39_87 then
            L39_87(L40_88)
            return L39_87
          end
        end
        if L26_74 == L39_87 then
          if L31_79 == L39_87 then
            L39_87(L40_88)
            return L39_87
          end
          if L32_80 == L39_87 then
            L39_87(L40_88)
            return L39_87
          end
        end
        if L33_81 == L39_87 then
          if L34_82 == L39_87 then
            L39_87(L40_88)
            return L39_87
          end
        end
        for L42_90, L43_91 in L39_87(L40_88) do
          if L43_91 == L25_73 then
            break
          end
        end
        for L42_90, L43_91 in L39_87(L40_88) do
          if L43_91 == L26_74 then
            L26_74 = L42_90 - 1
            break
          end
        end
        for L42_90, L43_91 in L39_87(L40_88) do
          if L43_91 == L33_81 then
            L33_81 = L42_90 - 1
            break
          end
        end
        if L39_87 ~= "DSR-1000AC" then
        elseif L39_87 == "DSR-1000_Bx" then
          L14_62 = L39_87
          if L14_62 ~= L39_87 then
            return L14_62
          end
        end
        L45_93 = L27_75
        L46_94 = L28_76
        L16_64 = L40_88
        L14_62 = L39_87
    end
    else
      if L3_51 ~= L23_71 then
      else
        if L3_51 == L23_71 then
          L26_74 = A0_48["ipv4Option1.useIspDns"]
          L30_78 = A0_48["ipv4Option1.netmask"]
          L31_79 = A0_48["ipv4Option1.primaryDNS"]
          L32_80 = A0_48["ipv4Option1.secondaryDNS"]
          L33_81 = A0_48["ipv4Option1.reconnectMode"]
          L34_82 = A0_48["ipv4Option1.maxIdleTime"]
          L35_83 = A0_48["ipv4Option1.splitTunnel"]
          if L3_51 == L39_87 then
          else
          end
          if L27_75 == L39_87 then
            L39_87(L40_88)
            return L39_87
          end
          if L23_71 == L39_87 then
            L39_87(L40_88)
            return L39_87
          end
          if L24_72 == L39_87 then
            L39_87(L40_88)
            return L39_87
          end
          if L33_81 == L39_87 then
            L39_87(L40_88)
            return L39_87
          end
          if L35_83 == L39_87 then
            L39_87(L40_88)
            return L39_87
          end
          if L25_73 == L39_87 then
            if L28_76 == L39_87 then
              L39_87(L40_88)
              return L39_87
            end
            if L29_77 == L39_87 then
              L39_87(L40_88)
              return L39_87
            end
            if L30_78 == L39_87 then
              L39_87(L40_88)
              return L39_87
            end
          end
          if L26_74 == L39_87 then
            if L31_79 == L39_87 then
              L39_87(L40_88)
              return L39_87
            end
            if L32_80 == L39_87 then
              L39_87(L40_88)
              return L39_87
            end
          end
          if L33_81 == L39_87 then
            if L34_82 == L39_87 then
              L39_87(L40_88)
              return L39_87
            end
          end
          for L42_90, L43_91 in L39_87(L40_88) do
            if L43_91 == L25_73 then
              break
            end
          end
          for L42_90, L43_91 in L39_87(L40_88) do
            if L43_91 == L26_74 then
              L26_74 = L42_90 - 1
              break
            end
          end
          for L42_90, L43_91 in L39_87(L40_88) do
            if L43_91 == L33_81 then
              L33_81 = L42_90 - 1
              break
            end
          end
          if L39_87 ~= "DSR-1000AC" then
          elseif L39_87 == "DSR-1000_Bx" then
            L14_62 = L39_87
            if L14_62 ~= L39_87 then
              return L14_62
            end
          end
          L45_93 = L27_75
          L46_94 = L28_76
          L16_64 = L40_88
          L14_62 = L39_87
      end
      elseif L3_51 == L23_71 then
        L26_74 = A0_48["ipv4Option1.userName"]
        L30_78 = A0_48["ipv4Option1.domainName"]
        L31_79 = A0_48["ipv4Option1.useIspDns"]
        L32_80 = A0_48["ipv4Option1.primaryDns"]
        L33_81 = A0_48["ipv4Option1.secondaryDns"]
        L34_82 = A0_48["ipv4Option1.reconnectMode"]
        L35_83 = A0_48["ipv4Option1.idleTimeOutVal"]
        if L23_71 == L36_84 then
          L36_84(L37_85)
          return L36_84
        end
        if L26_74 == L36_84 then
          L36_84(L37_85)
          return L36_84
        end
        if L27_75 == L36_84 then
          L36_84(L37_85)
          return L36_84
        end
        if L29_77 == L36_84 then
          L36_84(L37_85)
          return L36_84
        end
        if L34_82 == L36_84 then
          L36_84(L37_85)
          return L36_84
        end
        if L31_79 == L36_84 then
          L36_84(L37_85)
          return L36_84
        end
        if L23_71 == L36_84 then
          if L24_72 == L36_84 then
            L36_84(L37_85)
            return L36_84
          end
          if L25_73 == L36_84 then
            L36_84(L37_85)
            return L36_84
          end
        end
        if L31_79 == L36_84 then
          if L32_80 == L36_84 then
            L36_84(L37_85)
            return L36_84
          end
          if L33_81 == L36_84 then
            L36_84(L37_85)
            return L36_84
          end
        end
        if L34_82 == L36_84 then
          if L35_83 == L36_84 then
            L36_84(L37_85)
            return L36_84
          end
        end
        for L39_87, L40_88 in L36_84(L37_85) do
          if L40_88 == L23_71 then
            break
          end
        end
        for L39_87, L40_88 in L36_84(L37_85) do
          if L40_88 == L31_79 then
            L31_79 = L39_87 - 1
            break
          end
        end
        for L39_87, L40_88 in L36_84(L37_85) do
          if L40_88 == L34_82 then
            L34_82 = L39_87 - 1
            break
          end
        end
        for L39_87, L40_88 in L36_84(L37_85) do
          if L40_88 == L29_77 then
            break
          end
        end
        L45_93 = L29_77
        L46_94 = L31_79
        L16_64 = L38_86
        L14_62 = L37_85
      elseif L3_51 == L23_71 then
        L26_74 = A0_48["ipv4Option1.userName"]
        L30_78 = A0_48["ipv4Option1.primaryDns"]
        L31_79 = A0_48["ipv4Option1.secondaryDns"]
        L32_80 = A0_48["ipv4Option1.authenticationOptions"]
        L33_81 = A0_48["ipv4Option1.reconnectMode"]
        L34_82 = A0_48["ipv4Option1.idleTimeOutVal"]
        L35_83 = A0_48["ipv4Option1.useDhcp1"]
        L45_93 = A0_48["ipv4Option1.reconnectMode1"]
        L46_94 = A0_48["ipv4Option1.idleTimeOutVal1"]
        if L23_71 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid useDhcp")
          return _UPVALUE0_.BAD_PARAMETER
        end
        if L26_74 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid userName")
          return _UPVALUE0_.BAD_PARAMETER
        end
        if L27_75 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid password")
          return _UPVALUE0_.BAD_PARAMETER
        end
        if L32_80 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid authenticationOptions")
          return _UPVALUE0_.BAD_PARAMETER
        end
        if L33_81 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid reconnectMode")
          return _UPVALUE0_.BAD_PARAMETER
        end
        if L29_77 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid useIspDns")
          return _UPVALUE0_.BAD_PARAMETER
        end
        if L23_71 == _UPVALUE25_[1] then
          if L24_72 == _UPVALUE0_.NIL then
            util.appendDebugOut("Set : Invalid ipAddress")
            return _UPVALUE0_.BAD_PARAMETER
          end
          if L25_73 == _UPVALUE0_.NIL then
            util.appendDebugOut("Set : Invalid networkMask")
            return _UPVALUE0_.BAD_PARAMETER
          end
        end
        if L29_77 == _UPVALUE18_[1] then
          if L30_78 == _UPVALUE0_.NIL then
            util.appendDebugOut("Set : Invalid primaryDns")
            return _UPVALUE0_.BAD_PARAMETER
          end
          if L31_79 == _UPVALUE0_.NIL then
            util.appendDebugOut("Set : Invalid secondaryDns")
            return _UPVALUE0_.BAD_PARAMETER
          end
        end
        if L33_81 == _UPVALUE12_[2] and L34_82 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid idleTimeout")
          return _UPVALUE0_.BAD_PARAMETER
        end
        if L35_83 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid useDhcp1")
          return _UPVALUE0_.BAD_PARAMETER
        end
        if L38_86 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid userName1")
          return _UPVALUE0_.BAD_PARAMETER
        end
        if L39_87 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid password1")
          return _UPVALUE0_.BAD_PARAMETER
        end
        if L44_92 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid authenticationOptions1")
          return _UPVALUE0_.BAD_PARAMETER
        end
        if L45_93 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid reconnectMode1")
          return _UPVALUE0_.BAD_PARAMETER
        end
        if L41_89 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid useIspDns1")
          return _UPVALUE0_.BAD_PARAMETER
        end
        if L35_83 == _UPVALUE25_[1] then
          if L36_84 == _UPVALUE0_.NIL then
            util.appendDebugOut("Set : Invalid ipAddress1")
            return _UPVALUE0_.BAD_PARAMETER
          end
          if L37_85 == _UPVALUE0_.NIL then
            util.appendDebugOut("Set : Invalid networkMask1")
            return _UPVALUE0_.BAD_PARAMETER
          end
        end
        if L41_89 == _UPVALUE18_[1] then
          if L42_90 == _UPVALUE0_.NIL then
            util.appendDebugOut("Set : Invalid primaryDns1")
            return _UPVALUE0_.BAD_PARAMETER
          end
          if L43_91 == _UPVALUE0_.NIL then
            util.appendDebugOut("Set : Invalid secondaryDns1")
            return _UPVALUE0_.BAD_PARAMETER
          end
        end
        if L45_93 == _UPVALUE12_[2] and L46_94 == _UPVALUE0_.NIL then
          util.appendDebugOut("Set : Invalid idleTimeout1")
          return _UPVALUE0_.BAD_PARAMETER
        end
        for _FORV_50_, _FORV_51_ in pairs(_UPVALUE25_) do
          if _FORV_51_ == L23_71 then
            break
          end
        end
        for _FORV_50_, _FORV_51_ in pairs(_UPVALUE18_) do
          if _FORV_51_ == L29_77 then
            break
          end
        end
        for _FORV_50_, _FORV_51_ in pairs(_UPVALUE12_) do
          if _FORV_51_ == L33_81 then
            L33_81 = _FORV_50_ - 1
            break
          end
        end
        for _FORV_50_, _FORV_51_ in pairs(_UPVALUE29_) do
          if _FORV_51_ == L32_80 then
            L32_80 = _FORV_50_
            break
          end
        end
        for _FORV_50_, _FORV_51_ in pairs(_UPVALUE25_) do
          if _FORV_51_ == L35_83 then
            L35_83 = _FORV_50_ - 1
            break
          end
        end
        for _FORV_50_, _FORV_51_ in pairs(_UPVALUE18_) do
          if _FORV_51_ == L41_89 then
            break
          end
        end
        for _FORV_50_, _FORV_51_ in pairs(_UPVALUE12_) do
          if _FORV_51_ == L45_93 then
            L45_93 = _FORV_50_ - 1
            break
          end
        end
        for _FORV_50_, _FORV_51_ in pairs(_UPVALUE29_) do
          if _FORV_51_ == L44_92 then
            break
          end
        end
        L14_62, L16_64 = _UPVALUE32_.japanPPPoEConnectionSet(_UPVALUE20_, _UPVALUE33_, L23_71, L24_72, L25_73, L26_74, L27_75, L28_76, L29_77, L30_78, L31_79, L32_80, L33_81, L34_82)
        if L14_62 ~= _UPVALUE0_.SUCCESS then
          util.appendDebugOut("Error in configuring values in page ipv4Option1settings" .. L14_62)
          _UPVALUE15_.abort()
          return L14_62
        end
        L14_62, L18_66 = _UPVALUE32_.japanPPPoEConnectionSet(_UPVALUE20_, _UPVALUE34_, L35_83, L36_84, L37_85, L38_86, L39_87, L40_88, L41_89, L42_90, L43_91, L44_92, L45_93, L46_94)
      elseif L3_51 == L23_71 then
        L26_74 = A0_48["ipv4Option1.userName"]
        L30_78 = A0_48["ipv4Option1.primaryDns"]
        L31_79 = A0_48["ipv4Option1.secondaryDns"]
        L32_80 = A0_48["ipv4Option1.authenticationOptions"]
        L33_81 = A0_48["ipv4Option1.reconnectMode"]
        L34_82 = A0_48["ipv4Option1.idleTimeOut"]
        L35_83 = A0_48["ipv4Option1.useDhcp2"]
        if L23_71 == L42_90 then
          L42_90(L43_91)
          return L42_90
        end
        if L26_74 == L42_90 then
          L42_90(L43_91)
          return L42_90
        end
        if L27_75 == L42_90 then
          L42_90(L43_91)
          return L42_90
        end
        if L32_80 == L42_90 then
          L42_90(L43_91)
          return L42_90
        end
        if L33_81 == L42_90 then
          L42_90(L43_91)
          return L42_90
        end
        if L29_77 == L42_90 then
          L42_90(L43_91)
          return L42_90
        end
        if L35_83 == L42_90 then
          L42_90(L43_91)
          return L42_90
        end
        if L39_87 == L42_90 then
          L42_90(L43_91)
          return L42_90
        end
        if L23_71 == L42_90 then
          if L24_72 == L42_90 then
            L42_90(L43_91)
            return L42_90
          end
          if L25_73 == L42_90 then
            L42_90(L43_91)
            return L42_90
          end
        end
        if L29_77 == L42_90 then
          if L30_78 == L42_90 then
            L42_90(L43_91)
            return L42_90
          end
          if L31_79 == L42_90 then
            L42_90(L43_91)
            return L42_90
          end
        end
        if L35_83 == L42_90 then
          if L36_84 == L42_90 then
            L42_90(L43_91)
            return L42_90
          end
          if L37_85 == L42_90 then
            L42_90(L43_91)
            return L42_90
          end
        end
        if L39_87 == L42_90 then
          if L40_88 == L42_90 then
            L42_90(L43_91)
            return L42_90
          end
          if L41_89 == L42_90 then
            L42_90(L43_91)
            return L42_90
          end
        end
        if L33_81 == L42_90 then
          if L34_82 == L42_90 then
            L42_90(L43_91)
            return L42_90
          end
        end
        for L45_93, L46_94 in L42_90(L43_91) do
          if L46_94 == L23_71 then
            break
          end
        end
        for L45_93, L46_94 in L42_90(L43_91) do
          if L46_94 == L29_77 then
            break
          end
        end
        for L45_93, L46_94 in L42_90(L43_91) do
          if L46_94 == L33_81 then
            L33_81 = L45_93 - 1
            break
          end
        end
        for L45_93, L46_94 in L42_90(L43_91) do
          if L46_94 == L32_80 then
            L32_80 = L45_93
            break
          end
        end
        for L45_93, L46_94 in L42_90(L43_91) do
          if L46_94 == L39_87 then
            break
          end
        end
        for L45_93, L46_94 in L42_90(L43_91) do
          if L46_94 == L35_83 then
            L35_83 = L45_93 - 1
            break
          end
        end
        L45_93 = L24_72
        L46_94 = L25_73
        L16_64 = L43_91
        L14_62 = L42_90
      end
    end
  end
  if L14_62 ~= L23_71 then
    L23_71(L24_72)
    L23_71()
    return L23_71, L24_72
  end
  L26_74 = L19_67
  L1_49 = L25_73
  L15_63 = L24_72
  L14_62 = L23_71
  if L14_62 ~= L23_71 then
    L23_71(L24_72)
    L23_71()
    return L23_71, L24_72
  end
  L26_74 = L4_52
  L30_78 = L8_56
  L31_79 = L1_49
  L17_65 = L24_72
  L14_62 = L23_71
  if L14_62 ~= L23_71 then
    L23_71(L24_72)
    L23_71()
    return L23_71, L24_72
  end
  if L23_71 ~= "DSR-1000AC" then
    if L23_71 ~= "DSR-500AC" then
      if L23_71 ~= "DSR-500_Bx" then
        if L23_71 ~= "DSR-1000_Bx" then
          L18_66 = L24_72
          L14_62 = L23_71
          if L14_62 ~= L23_71 then
            L23_71(L24_72)
            L23_71()
            return L23_71, L24_72
          end
        end
      end
    end
  end
  L23_71()
  L23_71()
  L26_74 = L23_71
  L26_74 = util
  L26_74 = L26_74.appendDebugOut
  L26_74(L27_75)
  L26_74 = _UPVALUE0_
  L26_74 = L26_74.SUCCESS
  return L26_74, L27_75
end
function ipv4Option1settingsSectionDefaultsGet()
  local L0_95, L1_96, L2_97, L3_98, L4_99, L5_100, L6_101, L7_102, L8_103, L9_104
  L0_95 = _UPVALUE0_
  L1_96 = _UPVALUE1_
  L2_97 = _UPVALUE2_
  L2_97 = L2_97[2]
  L3_98 = _UPVALUE3_
  L3_98 = L3_98[2]
  L4_99 = _UPVALUE4_
  L5_100 = _UPVALUE5_
  L6_101 = _UPVALUE5_
  L7_102 = _UPVALUE1_
  L8_103 = _UPVALUE6_
  L9_104 = util
  L9_104 = L9_104.mask
  L9_104 = L9_104(_UPVALUE7_)
  return L0_95, L1_96, L2_97, L3_98, L4_99, L5_100, L6_101, L7_102, L8_103, L9_104
end
function ipv4Option1vlanWAN1PortModeInfoGet()
  local L0_105, L1_106
  L0_105 = _UPVALUE0_
  L0_105 = L0_105.FAILURE
  L1_106 = {}
  if PRODUCT_ID ~= "DSR-1000AC_Ax" and PRODUCT_ID ~= "DSR-500AC_Ax" and PRODUCT_ID ~= "DSR-1000_Bx" and PRODUCT_ID ~= "DSR-500_Bx" then
    L0_105, L1_106 = _UPVALUE1_.vlan_on_WAN1_portModeInfoGet()
  else
    L0_105, L1_106 = _UPVALUE2_.vlanOverWanConfigGet("WAN1")
  end
  if L0_105 ~= _UPVALUE0_.SUCCESS then
    L1_106 = {}
  end
  return L1_106
end
function ipv4Option1vlanTabGet()
  local L0_107, L1_108
  L0_107 = _UPVALUE0_
  L0_107 = L0_107.FAILURE
  L1_108 = {}
  L0_107, L1_108 = _UPVALUE1_.vlan_dummy_table_InfoGet()
  if L0_107 ~= _UPVALUE0_.SUCCESS then
    L1_108 = {}
  end
  return L1_108
end
function ipv4Option1WANvlanTabGet()
  local L0_109, L1_110
  L0_109 = _UPVALUE0_
  L0_109 = L0_109.FAILURE
  L1_110 = {}
  L0_109, L1_110 = _UPVALUE1_.vlan_on_WAN1_InfoGet()
  return L1_110
end
