local L0_0
L0_0 = module
L0_0("com.teamf1.bl.vpn.openvpnSettings", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/openvpn_core")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/openvpn_returnCodes")
L0_0 = require
L0_0("teamf1lualib/omniSslClientConfig_bl")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
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
function openvpnConfigGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26, L26_27, L27_28, L28_29, L29_30, L30_31
  L27_28 = {}
  L28_29 = _UPVALUE0_
  L28_29 = L28_29.modeGet
  L29_30 = L28_29()
  L3_4 = L30_31
  L1_2 = L29_30
  L0_1 = L28_29
  L28_29 = _UPVALUE0_
  L28_29 = L28_29.isfeatureEnabled
  L29_30 = L28_29()
  L2_3 = L30_31
  L1_2 = L29_30
  L0_1 = L28_29
  if L2_3 == "0" then
    L27_28.feature = L2_3
    L28_29 = L0_1
    L29_30 = L1_2
    return L28_29, L29_30, L30_31
  end
  L28_29 = tonumber
  L29_30 = L3_4
  L28_29 = L28_29(L29_30)
  L29_30 = _UPVALUE1_
  L3_4 = L29_30[L30_31]
  if L28_29 == 0 then
    L29_30 = _UPVALUE0_
    L29_30 = L29_30.openVpnServerGet
    L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, userBasedAuth, L14_15, L17_18, L18_19, L23_24, L24_25, L25_26, L26_27, L29_30 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, L29_30()
    L1_2 = L30_31
    L0_1 = L29_30
    L29_30 = nil
    for _FORV_33_, _FORV_34_ in L30_31(authTypeList) do
      if _FORV_34_ == L17_18 then
        L29_30 = _FORV_33_
      end
    end
    for _FORV_34_, _FORV_35_ in pairs(authSubTypeList) do
    end
    if L0_1 ~= _UPVALUE2_.SUCCESS then
      return L0_1
    end
    L8_9 = _UPVALUE3_[tonumber(L8_9) + 1]
    L9_10 = _UPVALUE4_[tonumber(L9_10) + 1]
    L10_11 = _UPVALUE5_[tonumber(L10_11) + 1]
    L7_8 = _UPVALUE6_[tonumber(L7_8) + 1]
    L27_28.feature = L2_3
    L27_28.mode = L3_4
    L27_28.network = L4_5
    L27_28.networkMask = L5_6
    L27_28.port = L6_7
    L27_28.tunnelProtocol = L8_9
    L27_28.encryptionAlgorithm = L9_10
    L27_28.hashAlgorithm = L10_11
    L27_28.tunnelType = L7_8
    L27_28.clientToClient = L11_12
    L27_28.tlsEnabled = L12_13
    L0_1, L1_2, L13_14 = _UPVALUE0_.crlEnabledGet()
    L27_28.crlEnabled = L13_14
    L27_28.allowOnlyUserBasedAuth = allowOnlyUserBasedAuth
    L27_28.userBasedAuth = userBasedAuth
    L27_28.duplicateCN = L14_15
    L27_28.authenticationType = tostring(L29_30)
    L27_28.authenticationSubType = tostring(L30_31)
    L27_28.certVer = L23_24
    L27_28.serverClientCerts = tostring(L24_25)
    L27_28.tlsCertsName = tostring(L25_26)
    L27_28.crlCertsName = tostring(L26_27)
    return L0_1, L1_2, L27_28
  end
  if L28_29 == 1 then
    L29_30 = _UPVALUE0_
    L29_30 = L29_30.openVpnClientGet
    serverIpType, serverIp, L6_7, L8_9, L9_10, L10_11, L12_13, allowOnlyUserBasedAuth, userBasedAuth, userName, password, L15_16, L16_17, L23_24, L24_25, L25_26, L29_30 = tonumber(L8_9), tonumber(L9_10), tonumber(L10_11), tonumber(L7_8), L0_1, L1_2, L27_28, L29_30()
    L1_2 = L30_31
    L0_1 = L29_30
    L29_30 = tonumber
    L29_30 = L29_30(L30_31)
    L8_9 = _UPVALUE3_[L29_30 + 1]
    L9_10 = _UPVALUE4_[L30_31 + 1]
    L10_11 = _UPVALUE5_[tonumber(L10_11) + 1]
    L27_28.feature = L2_3
    L27_28.mode = L3_4
    L27_28.serverIp = serverIp
    L27_28.RemoteIpType = serverIpType
    L27_28.port = L6_7
    L27_28.tunnelProtocol = L8_9
    L27_28.encryptionAlgorithm = L9_10
    L27_28.hashAlgorithm = L10_11
    L27_28.tlsEnabled = L12_13
    L27_28.allowOnlyUserBasedAuth = allowOnlyUserBasedAuth
    L27_28.userBasedAuth = userBasedAuth
    L27_28.userName = userName
    L27_28.password = password
    L27_28.failoverRemoteIpType = L15_16
    if L16_17 == "None" then
      L16_17 = ""
    end
    L27_28.failoverserverIp = L16_17
    L27_28.certVer = L23_24
    L27_28.serverClientCerts = tostring(L24_25)
    L27_28.tlsCertsName = tostring(L25_26)
    return L0_1, L1_2, L27_28
  end
  if L28_29 == 2 then
    L29_30 = _UPVALUE0_
    L29_30 = L29_30.portGet
    L6_7, L29_30 = tonumber(L10_11), L29_30()
    L1_2 = L30_31
    L0_1 = L29_30
    L29_30 = _UPVALUE0_
    L29_30 = L29_30.tlsEnabledGet
    L12_13, L29_30 = L29_30()
    L1_2 = L30_31
    L0_1 = L29_30
    L29_30 = _UPVALUE0_
    L29_30 = L29_30.ptEnableGet
    L19_20, L20_21, L21_22, L22_23, L29_30 = L29_30()
    L1_2 = L30_31
    L0_1 = L29_30
    L27_28.feature = L2_3
    L27_28.mode = L3_4
    L27_28.port = L6_7
    L27_28.tlsEnabled = L12_13
    L27_28.ptEnable = L19_20
    L27_28.ptUserName = L20_21
    L27_28.ptPassword = L21_22
    L27_28.ptClusterId = L22_23
    L29_30 = L0_1
    return L29_30, L30_31, L27_28
  end
end
function openvpnConfigSet(A0_32)
  local L1_33, L2_34, L3_35, L4_36, L5_37, L6_38, L7_39, L8_40, L9_41, L10_42, L11_43, L12_44, L13_45, L14_46, L15_47, L16_48, L17_49, L18_50, L19_51, L20_52, L21_53, L22_54, L23_55, L24_56, L25_57, L26_58, L27_59, L28_60, L29_61, L30_62, L31_63, L32_64, L33_65, L34_66, L35_67, L36_68
  L1_33 = ACCESS_LEVEL
  if L1_33 ~= 0 then
    L1_33 = util
    L1_33 = L1_33.appendDebugOut
    L2_34 = "Detected Unauthorized access for page openVpnSettings"
    L1_33(L2_34)
    L1_33 = _UPVALUE0_
    L1_33 = L1_33.UNAUTHORIZED
    return L1_33
  end
  L1_33, L2_34 = nil, nil
  L3_35 = A0_32["openVpnSettings.feature"]
  L4_36 = A0_32["openVpnSettings.cookie"]
  L5_37 = A0_32["openVpnSettings.mode"]
  L6_38 = A0_32["openVpnSettings.network"]
  L7_39 = A0_32["openVpnSettings.networkMask"]
  L8_40 = A0_32["openVpnSettings.port"]
  L9_41 = A0_32["openVpnSettings.tunnelProtocol"]
  L10_42 = A0_32["openVpnSettings.encryptionAlgorithm"]
  L11_43 = A0_32["openVpnSettings.hashAlgorithm"]
  L12_44 = A0_32["openVpnSettings.tunnelType"]
  L13_45 = A0_32["openVpnSettings.clientToClient"]
  L14_46 = A0_32["openVpnSettings.serverIp"]
  L15_47 = A0_32["openVpnSettings.RemoteIpType"]
  L16_48 = A0_32["openVpnSettings.tlsEnabled"]
  L17_49 = A0_32["openVpnSettings.crlEnabled"]
  L18_50 = A0_32["openVpnSettings.userBasedAuth"]
  L19_51 = A0_32["openVpnSettings.userName"]
  L20_52 = A0_32["openVpnSettings.password"]
  L21_53 = A0_32["openVpnSettings.duplicateCN"]
  L22_54 = A0_32["openVpnSettings.failoverserverIpType"]
  L23_55 = A0_32["openVpnSettings.failoverserverIp"]
  L24_56 = authTypeList
  L25_57 = tonumber
  L26_58 = A0_32["openVpnSettings.authenticationType"]
  L25_57 = L25_57(L26_58)
  L24_56 = L24_56[L25_57]
  L25_57 = authSubTypeList
  L26_58 = tonumber
  L27_59 = A0_32["openVpnSettings.authenticationSubType"]
  L26_58 = L26_58(L27_59)
  L25_57 = L25_57[L26_58]
  L26_58 = A0_32["openVpnSettings.ptEnable"]
  L27_59 = A0_32["openVpnSettings.ptUserName"]
  L28_60 = A0_32["openVpnSettings.ptPassword"]
  L29_61 = A0_32["openVpnSettings.ptClusterId"]
  L30_62 = A0_32["openVpnSettings.certVerfication"]
  L31_63 = A0_32["openVpnSettings.serverClientCerts"]
  L32_64 = A0_32["openVpnSettings.tlsCertsSelection"]
  L33_65 = A0_32["openVpnSettings.crlCertsSelection"]
  if L26_58 == nil then
    L26_58 = 0
  end
  L34_66 = _UPVALUE1_
  if L3_35 == L34_66 then
    L34_66 = _UPVALUE2_
    L34_66 = L34_66[3]
    if L5_37 ~= L34_66 then
      L34_66 = _UPVALUE2_
      L34_66 = L34_66[1]
      if L5_37 == L34_66 then
        L34_66 = nil
        L35_67 = vpnMaskOctectCheck
        L36_68 = L7_39
        L35_67 = L35_67(L36_68)
        L36_68 = _UPVALUE0_
        L36_68 = L36_68.SUCCESS
        if L35_67 == L36_68 then
          L35_67 = _UPVALUE3_
          L35_67 = L35_67.OPENVPN_NETWORKMASK_INVALID
          return L35_67
        end
        L35_67 = _UPVALUE4_
        L35_67 = L35_67.checkWanSubnetRange
        L36_68 = L6_38
        L35_67 = L35_67(L36_68, L7_39)
        L34_66 = L35_67
        L35_67 = _UPVALUE0_
        L35_67 = L35_67.SUCCESS
        if L34_66 == L35_67 then
          L35_67 = UNIT_NAME
          if L35_67 ~= "DSR-150N" then
            L35_67 = UNIT_NAME
            if L35_67 ~= "DSR-150" then
              L35_67 = UNIT_NAME
              if L35_67 ~= "DSR-250N" then
                L35_67 = UNIT_NAME
              end
            end
          else
            if L35_67 == "DSR-250" then
              L35_67 = _UPVALUE0_
              L35_67 = L35_67.WAN_ECONA_ALREADY_CONFIGURED
              return L35_67
          end
          else
            L35_67 = _UPVALUE0_
            L35_67 = L35_67.WAN_ALREADY_CONFIGURED
            return L35_67
          end
        end
        L35_67 = HIGH_SEC
        if L35_67 == "HIGH" then
          L35_67 = _UPVALUE4_
          L35_67 = L35_67.checkSslClientRange
          L36_68 = L6_38
          L35_67 = L35_67(L36_68, L7_39)
          L34_66 = L35_67
          L35_67 = _UPVALUE0_
          L35_67 = L35_67.SUCCESS
          if L34_66 == L35_67 then
            L35_67 = _UPVALUE0_
            L35_67 = L35_67.SSLVPN_CLIENT_ALREADY_CONFIGURED
            return L35_67
          end
        end
        L35_67 = _UPVALUE4_
        L35_67 = L35_67.checkLanVlanSubnetRange
        L36_68 = L6_38
        L35_67 = L35_67(L36_68, L7_39)
        L34_66 = L35_67
        L35_67 = _UPVALUE0_
        L35_67 = L35_67.SUCCESS
        if L34_66 == L35_67 then
          L35_67 = _UPVALUE0_
          L35_67 = L35_67.LAN_VLAN_ALREADY_CONFIGURED
          return L35_67
        end
        L35_67 = _UPVALUE4_
        L35_67 = L35_67.checkDmzSubnetRange
        L36_68 = L6_38
        L35_67 = L35_67(L36_68, L7_39)
        L34_66 = L35_67
        L35_67 = _UPVALUE0_
        L35_67 = L35_67.SUCCESS
        if L34_66 == L35_67 then
          L35_67 = _UPVALUE0_
          L35_67 = L35_67.DMZ_ALREADY_CONFIGURED
          return L35_67
        end
      end
      if L30_62 == "0" and L18_50 == "0" then
        L34_66 = _UPVALUE3_
        L34_66 = L34_66.USERCERTENABLE
        return L34_66
      end
    else
      L34_66 = A0_32["openVpnSettings.uploadStatus"]
      if L34_66 ~= "Yes" then
        L34_66 = A0_32["openVpnSettings.ptEnable"]
        if L34_66 == 0 then
          L34_66 = _UPVALUE3_
          L34_66 = L34_66.UPLOAD_ACCESS_CLIENT_CRT
          return L34_66
        end
      end
    end
    L34_66 = _UPVALUE0_
    L34_66 = L34_66.NIL
    if L4_36 == L34_66 then
      L34_66 = util
      L34_66 = L34_66.appendDebugOut
      L35_67 = "Set : Invalid Cookie"
      L34_66(L35_67)
      L34_66 = _UPVALUE0_
      L34_66 = L34_66.BAD_PARAMETER
      return L34_66
    end
    L34_66 = _UPVALUE5_
    L34_66 = L34_66.start
    L34_66()
    L34_66 = _UPVALUE2_
    L34_66 = L34_66[1]
    if L5_37 == L34_66 then
      L34_66 = _UPVALUE0_
      L34_66 = L34_66.NIL
      if L6_38 ~= L34_66 then
        L34_66 = _UPVALUE0_
        L34_66 = L34_66.NIL
        if L7_39 ~= L34_66 then
          L34_66 = _UPVALUE0_
          L34_66 = L34_66.NIL
          if L9_41 ~= L34_66 then
            L34_66 = _UPVALUE0_
            L34_66 = L34_66.NIL
            if L8_40 ~= L34_66 then
              L34_66 = _UPVALUE0_
              L34_66 = L34_66.NIL
              if L12_44 ~= L34_66 then
                L34_66 = _UPVALUE0_
                L34_66 = L34_66.NIL
                if L10_42 ~= L34_66 then
                  L34_66 = _UPVALUE0_
                  L34_66 = L34_66.NIL
                end
              end
            end
          end
        end
      elseif L11_43 == L34_66 then
        L34_66 = util
        L34_66 = L34_66.appendDebugOut
        L35_67 = "GetNext : Invalid Cookie"
        L34_66(L35_67)
        L34_66 = _UPVALUE0_
        L34_66 = L34_66.BAD_PARAMETER
        return L34_66
      end
      L34_66 = "server"
      L35_67 = stringTonumber
      L36_68 = L9_41
      L36_68 = L35_67(L36_68, _UPVALUE6_)
      L9_41 = L36_68
      L1_33 = L35_67
      L35_67 = stringTonumber
      L36_68 = L10_42
      L36_68 = L35_67(L36_68, _UPVALUE7_)
      L10_42 = L36_68
      L1_33 = L35_67
      L35_67 = stringTonumber
      L36_68 = L11_43
      L36_68 = L35_67(L36_68, _UPVALUE8_)
      L11_43 = L36_68
      L1_33 = L35_67
      L35_67 = stringTonumber
      L36_68 = L12_44
      L36_68 = L35_67(L36_68, _UPVALUE9_)
      L12_44 = L36_68
      L1_33 = L35_67
      L35_67 = _UPVALUE9_
      L35_67 = L35_67[1]
      if L12_44 == L35_67 then
        L35_67 = _UPVALUE0_
        L35_67 = L35_67.NIL
        if L13_45 == L35_67 then
          L35_67 = util
          L35_67 = L35_67.appendDebugOut
          L36_68 = "GetNext : Invalid Cookie"
          L35_67(L36_68)
          L35_67 = _UPVALUE0_
          L35_67 = L35_67.BAD_PARAMETER
          return L35_67
        end
      end
      L35_67 = db
      L35_67 = L35_67.getAttribute
      L36_68 = "OpenVpn"
      L35_67 = L35_67(L36_68, "_ROWID_", "1", "serverClientCertsName")
      L36_68 = _UPVALUE10_
      L36_68 = L36_68.openVpnServerSet
      L2_34, L36_68 = L4_36, L36_68(L4_36, L6_38, L7_39, L8_40, L12_44, L9_41, L10_42, L11_43, L13_45, L16_48, L17_49, L18_50, L21_53, L24_56, L25_57, L26_58, L30_62, L31_63, L32_64, L33_65)
      L1_33 = L36_68
      L36_68 = _UPVALUE0_
      L36_68 = L36_68.SUCCESS
      if L1_33 ~= L36_68 then
        L36_68 = util
        L36_68 = L36_68.appendDebugOut
        L36_68("Error in configuring values in page openVpnSettings" .. L1_33)
        L36_68 = _UPVALUE5_
        L36_68 = L36_68.abort
        L36_68()
        L36_68 = L1_33
        return L36_68, L4_36
      end
      if L35_67 ~= L31_63 then
        L36_68 = nil
        L36_68 = _UPVALUE11_.omniSslConfigurationDeleteAll()
      end
    end
    L34_66 = _UPVALUE2_
    L34_66 = L34_66[2]
    if L5_37 == L34_66 then
      L34_66 = _UPVALUE0_
      L34_66 = L34_66.NIL
      if L15_47 ~= L34_66 then
        L34_66 = _UPVALUE0_
        L34_66 = L34_66.NIL
        if L14_46 ~= L34_66 then
          L34_66 = _UPVALUE0_
          L34_66 = L34_66.NIL
          if L8_40 ~= L34_66 then
            L34_66 = _UPVALUE0_
            L34_66 = L34_66.NIL
            if L9_41 ~= L34_66 then
              L34_66 = _UPVALUE0_
              L34_66 = L34_66.NIL
              if L10_42 ~= L34_66 then
                L34_66 = _UPVALUE0_
                L34_66 = L34_66.NIL
              end
            end
          end
        end
      elseif L11_43 == L34_66 then
        L34_66 = util
        L34_66 = L34_66.appendDebugOut
        L35_67 = "GetNext : Invalid Cookie"
        L34_66(L35_67)
        L34_66 = _UPVALUE0_
        L34_66 = L34_66.BAD_PARAMETER
        return L34_66
      end
      L34_66 = "client"
      L35_67 = stringTonumber
      L36_68 = L9_41
      L36_68 = L35_67(L36_68, _UPVALUE6_)
      L9_41 = L36_68
      L1_33 = L35_67
      L35_67 = stringTonumber
      L36_68 = L10_42
      L36_68 = L35_67(L36_68, _UPVALUE7_)
      L10_42 = L36_68
      L1_33 = L35_67
      L35_67 = stringTonumber
      L36_68 = L11_43
      L36_68 = L35_67(L36_68, _UPVALUE8_)
      L11_43 = L36_68
      L1_33 = L35_67
      L35_67 = _UPVALUE10_
      L35_67 = L35_67.openVpnClientSet
      L36_68 = L4_36
      L36_68 = L35_67(L36_68, L15_47, L14_46, L8_40, L9_41, L10_42, L11_43, L16_48, allowOnlyUserBasedAuth, L18_50, L19_51, L20_52, L22_54, L23_55, L26_58, L30_62, L31_63, L32_64)
      L2_34 = L36_68
      L1_33 = L35_67
      L35_67 = _UPVALUE0_
      L35_67 = L35_67.SUCCESS
      if L1_33 ~= L35_67 then
        L35_67 = util
        L35_67 = L35_67.appendDebugOut
        L36_68 = "Error in configuring values in page openVpnSettings"
        L36_68 = L36_68 .. L1_33
        L35_67(L36_68)
        L35_67 = _UPVALUE5_
        L35_67 = L35_67.abort
        L35_67()
        L35_67 = L1_33
        L36_68 = L4_36
        return L35_67, L36_68
      end
    end
    L34_66 = _UPVALUE2_
    L34_66 = L34_66[3]
    if L5_37 == L34_66 then
      L34_66 = _UPVALUE0_
      L34_66 = L34_66.NIL
      if L8_40 == L34_66 then
        L34_66 = util
        L34_66 = L34_66.appendDebugOut
        L35_67 = "GetNext : Invalid Cookie"
        L34_66(L35_67)
        L34_66 = _UPVALUE0_
        L34_66 = L34_66.BAD_PARAMETER
        return L34_66
      end
      L34_66 = util
      L34_66 = L34_66.fileExists
      L35_67 = "/var/certs/client.ovpn"
      L34_66 = L34_66(L35_67)
      if L34_66 then
        L34_66 = _UPVALUE10_
        L34_66 = L34_66.openvpnAccessCertsAdd
        L34_66 = L34_66()
        L1_33 = L34_66
        L34_66 = _UPVALUE0_
        L34_66 = L34_66.SUCCESS
        if L1_33 ~= L34_66 then
          L34_66 = util
          L34_66 = L34_66.appendDebugOut
          L35_67 = "Error in configuring values in page openVpnSettings"
          L36_68 = L1_33
          L35_67 = L35_67 .. L36_68
          L34_66(L35_67)
          L34_66 = _UPVALUE5_
          L34_66 = L34_66.abort
          L34_66()
          L34_66 = L1_33
          L35_67 = L4_36
          return L34_66, L35_67
        end
      end
      L34_66 = _UPVALUE10_
      L34_66 = L34_66.featureDisable
      L35_67 = L34_66()
      L2_34 = L35_67
      L1_33 = L34_66
      L34_66 = _UPVALUE0_
      L34_66 = L34_66.SUCCESS
      if L1_33 ~= L34_66 then
        L34_66 = util
        L34_66 = L34_66.appendDebugOut
        L35_67 = "Error in configuring values in page openVpnSettings"
        L36_68 = L1_33
        L35_67 = L35_67 .. L36_68
        L34_66(L35_67)
        L34_66 = _UPVALUE5_
        L34_66 = L34_66.abort
        L34_66()
        L34_66 = L1_33
        L35_67 = L4_36
        return L34_66, L35_67
      end
      L34_66 = _UPVALUE10_
      L34_66 = L34_66.openVpnAccessServerClientSet
      L35_67 = L4_36
      L36_68 = "2"
      L35_67 = L34_66(L35_67, L36_68, L8_40, L16_48, L26_58, L27_59, L28_60, L29_61)
      L2_34 = L35_67
      L1_33 = L34_66
    end
  else
    L34_66 = _UPVALUE5_
    L34_66 = L34_66.start
    L34_66()
    L34_66 = _UPVALUE10_
    L34_66 = L34_66.featureDisable
    L35_67 = L34_66()
    L2_34 = L35_67
    L1_33 = L34_66
    L34_66 = _UPVALUE0_
    L34_66 = L34_66.SUCCESS
    if L1_33 ~= L34_66 then
      L34_66 = util
      L34_66 = L34_66.appendDebugOut
      L35_67 = "Error in configuring values in page openVpnSettings"
      L36_68 = L1_33
      L35_67 = L35_67 .. L36_68
      L34_66(L35_67)
      L34_66 = _UPVALUE5_
      L34_66 = L34_66.abort
      L34_66()
      L34_66 = L1_33
      L35_67 = L4_36
      return L34_66, L35_67
    end
  end
  L34_66 = _UPVALUE0_
  L34_66 = L34_66.SUCCESS
  if L1_33 == L34_66 then
    L34_66, L35_67 = nil, nil
    L36_68 = db
    L36_68 = L36_68.existsRow
    L36_68 = L36_68(_UPVALUE12_, "loginState", "LOGGED_IN")
    L34_66 = L36_68
    if L34_66 then
      L36_68 = db
      L36_68 = L36_68.deleteAllRows
      L36_68 = L36_68(_UPVALUE12_)
      L35_67 = L36_68
      L36_68 = _UPVALUE0_
      L36_68 = L36_68.NIL
      if L35_67 == L36_68 then
        L36_68 = _UPVALUE5_
        L36_68 = L36_68.abort
        L36_68()
        L36_68 = _UPVALUE0_
        L36_68 = L36_68.FAILURE
        return L36_68
      end
    end
  end
  L34_66 = _UPVALUE0_
  L34_66 = L34_66.SUCCESS
  if L1_33 == L34_66 then
    L34_66, L35_67 = nil, nil
    L36_68 = db
    L36_68 = L36_68.getTable
    L36_68 = L36_68("openVPNActiveClients")
    L34_66 = L36_68
    L36_68 = #L34_66
    if L36_68 > 0 then
      L36_68 = db
      L36_68 = L36_68.deleteAllRows
      L36_68 = L36_68("openVPNActiveClients")
      L35_67 = L36_68
      L36_68 = _UPVALUE0_
      L36_68 = L36_68.NIL
      if L35_67 == L36_68 then
        L36_68 = _UPVALUE5_
        L36_68 = L36_68.abort
        L36_68()
        L36_68 = _UPVALUE0_
        L36_68 = L36_68.FAILURE
        return L36_68
      end
    end
  end
  L34_66 = _UPVALUE5_
  L34_66 = L34_66.complete
  L34_66()
  L34_66 = _UPVALUE5_
  L34_66 = L34_66.save
  L34_66()
  L34_66 = _UPVALUE0_
  L34_66 = L34_66.SUCCESS
  L35_67 = L2_34
  return L34_66, L35_67
end
function stringTonumber(A0_69, A1_70)
  if A0_69 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  for _FORV_5_, _FORV_6_ in pairs(A1_70) do
    if _FORV_6_ == A0_69 then
      A0_69 = _FORV_5_ - 1
      return _UPVALUE0_.SUCCESS, A0_69
    end
  end
  return _UPVALUE0_.FAILURE
end
function verifyCertStatusGet(A0_71)
  if A0_71 == "1" then
    A0_71 = "server"
  elseif A0_71 == "2" then
    A0_71 = "client"
  end
  if _UPVALUE0_.verifyCertificatesStatus(A0_71) then
    return true
  else
    return false
  end
end
function openvpnCertsStatusGet()
  local L0_72, L1_73
  L0_72 = {}
  L1_73 = {}
  L0_72, L1_73 = _UPVALUE0_.certsEditGet()
  return L0_72, L1_73
end
function tlsDisplay()
  local L0_74
  L0_74 = false
  L0_74 = util.fileExists("/var/certs/ta.key") or util.fileExists("/var/certs/openvpn/ta.key")
  return L0_74
end
function crlDisplay()
  local L0_75
  L0_75 = false
  L0_75 = util.fileExists("/var/certs/crl.pem") or util.fileExists("/var/certs/openvpn/crl.pem")
  return L0_75
end
function vpnMaskOctectCheck(A0_76)
  local L1_77, L2_78, L3_79, L4_80, L5_81, L6_82, L7_83, L8_84
  L2_78 = _UPVALUE0_
  L2_78 = L2_78.split
  L3_79 = A0_76
  L2_78 = L2_78(L3_79, L4_80)
  L1_77 = L2_78
  L2_78 = 0
  L3_79 = _UPVALUE1_
  L3_79 = L3_79.ERROR
  if L4_80 == 4 then
    for L7_83, L8_84 in L4_80(L5_81) do
      if L8_84:match("%a") or L8_84:match("%W") then
        return _UPVALUE1_.ERROR
      elseif tonumber(L8_84) == 255 then
        L2_78 = L2_78 + 1
      end
    end
  else
    return L3_79
  end
  if L2_78 == 4 then
    L3_79 = L4_80.SUCCESS
    return L3_79
  end
  return L3_79
end
