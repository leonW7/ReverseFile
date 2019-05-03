require("captivePortalLib")
require("loginLib")
require("teamf1lualib/db")
require("loginLuaLib")
captivePortal = {}
EXT_SERVER_DEF_IDLE_TIMEOUT = 10
EXT_SERVER_ID_RADIUS = 10
EXT_SERVER_ID_LDAP = 20
EXT_SERVER_ID_AD = 30
EXT_SERVER_ID_NTDOMAIN = 40
EXT_SERVER_ID_POP3 = 50
function captivePortal.getFromInterface()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
  L0_0 = {}
  L1_1 = db
  L1_1 = L1_1.getTable
  L2_2 = "vlanStatus"
  L1_1 = L1_1(L2_2)
  L2_2 = L1_1[1]
  L3_3 = L2_2["vlanStatus.VlanState"]
  if L3_3 == "0" then
    L4_4 = {}
    L0_0[1] = L4_4
    L4_4 = L0_0[1]
    L4_4["vlan.vlanName"] = "LAN"
    L4_4 = L0_0[1]
    L4_4["vlan.vlanId"] = "1"
  else
    L4_4 = 1
    L5_5 = "vlanName != 'Default' and vlanName != '' and portName = 'dummy'"
    L6_6 = db
    L6_6 = L6_6.getRowsWhere
    L6_6 = L6_6("vlan", L5_5)
    L0_0[1] = {}
    L0_0[1]["vlan.vlanName"] = "LAN"
    L0_0[1]["vlan.vlanId"] = "1"
    for _FORV_10_, _FORV_11_ in pairs(L6_6) do
      L4_4 = L4_4 + 1
      L0_0[L4_4] = {}
      L0_0[L4_4]["vlan.vlanName"] = "VLAN-" .. L6_6[_FORV_10_]["vlan.vlanName"]
      L0_0[L4_4]["vlan.vlanId"] = L6_6[_FORV_10_]["vlan.vlanId"]
    end
  end
  return L0_0
end
function captivePortal.getToInterface()
  local L0_7
  L0_7 = {}
  L0_7[1] = "WAN"
  if (db.getAttribute("ConfigPort", "_ROWID_", "1", "LogicalIfName") or "") == "DMZ" then
    L0_7[2] = "DMZ"
  end
  return L0_7
end
function captivePortal.isEnabled()
  local L0_8, L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16, L9_17, L10_18, L11_19, L12_20, L13_21, L14_22, L15_23, L16_24, L17_25
  L0_8 = db
  L0_8 = L0_8.getAttribute
  L1_9 = "CaptivePortal"
  L2_10 = "_ROWID_"
  L3_11 = "1"
  L4_12 = "enable"
  L0_8 = L0_8(L1_9, L2_10, L3_11, L4_12)
  L1_9 = 0
  L2_10 = 0
  if L0_8 == "1" then
    L0_8 = "0"
    L3_11 = SAPI
    L3_11 = L3_11.Request
    L3_11 = L3_11.servervariable
    L4_12 = "HTTP_HOST"
    L3_11 = L3_11(L4_12)
    L4_12 = db
    L4_12 = L4_12.getTable
    L5_13 = "CaptivePortalVlan"
    L6_14 = false
    L4_12 = L4_12(L5_13, L6_14)
    L5_13 = 0
    L6_14 = 0
    for L10_18, L11_19 in L7_15(L8_16) do
      L5_13 = L5_13 + 1
      L12_20 = L4_12[L5_13]
      L2_10 = L12_20.vlanId
      L1_9 = L12_20.profileId
      L13_21 = L12_20.vlanId
      if L13_21 == "1" then
        L12_20.vlanId = ""
      end
      L13_21 = "LAN"
      L14_22 = L12_20.vlanId
      L13_21 = L13_21 .. L14_22
      L14_22 = "LogicalIfName='"
      L15_23 = L13_21
      L16_24 = "' and AddressFamily = 2"
      L14_22 = L14_22 .. L15_23 .. L16_24
      L15_23 = db
      L15_23 = L15_23.getRowWhere
      L16_24 = "ifStatic"
      L17_25 = L14_22
      L15_23 = L15_23(L16_24, L17_25)
      if L15_23 == nil then
        L16_24 = {}
        L15_23 = L16_24
      end
      L6_14 = L6_14 + 1
      L16_24 = L15_23["ifStatic.StaticIp"]
      L17_25 = L15_23["ifStatic.NetMask"]
      L0_8 = captivePortalLib.subnetCheck(L3_11, L16_24, L17_25)
      if L0_8 == "1" then
        return L0_8, L1_9, L2_10
      end
    end
  end
  L3_11 = L0_8
  L4_12 = L1_9
  L5_13 = L2_10
  return L3_11, L4_12, L5_13
end
function captivePortal.getLoginStatus()
  local L0_26, L1_27, L2_28
  L0_26 = SAPI
  L0_26 = L0_26.Request
  L0_26 = L0_26.servervariable
  L1_27 = "REMOTE_ADDR"
  L0_26 = L0_26(L1_27)
  L1_27 = captivePortalLib
  L1_27 = L1_27.macAddrGet
  L2_28 = L0_26
  L1_27 = L1_27(L2_28)
  L2_28 = "ipAddr = '"
  L2_28 = L2_28 .. L0_26 .. "'" .. " and macAddr = '" .. L1_27 .. "'"
  if db.getRowWhere("CaptivePortalSession", L2_28) ~= nil then
  else
  end
  return "0"
end
function captivePortal.ExternalAuthLdap(A0_29, A1_30, A2_31)
  local L3_32, L4_33, L5_34, L6_35, L7_36, L8_37, L9_38, L10_39, L11_40, L12_41, L13_42, L14_43
  L3_32 = "39,40,41,42,43"
  L4_33 = db
  L4_33 = L4_33.getString
  L5_34 = L3_32
  L4_33 = L4_33(L5_34)
  L3_32 = L4_33
  L4_33 = nil
  L5_34 = "rowid=1"
  L6_35 = db
  L6_35 = L6_35.getRowWhere
  L7_36 = "LDAPSettings"
  L8_37 = L5_34
  L6_35 = L6_35(L7_36, L8_37)
  if L6_35 ~= nil then
    L7_36 = L6_35["LDAPSettings.AuthenticationServer"]
    L8_37 = L6_35["LDAPSettings.SecondAuthenticationServer"]
    L9_38 = L6_35["LDAPSettings.ThirdAuthenticationServer"]
    L10_39 = L6_35["LDAPSettings.LDAPBaseDN"]
    L11_40 = L6_35["LDAPSettings.SecondLDAPBaseDN"]
    L12_41 = L6_35["LDAPSettings.ThirdLDAPBaseDN"]
    L13_42 = L6_35["LDAPSettings.TimeOut"]
    L14_43 = L6_35["LDAPSettings.Retries"]
    if L13_42 == nil or L13_42 == "" then
      L13_42 = NULL
    end
    if L14_43 == nil or L14_43 == "" then
      L14_43 = NULL
    end
    L4_33 = captivePortalLib.ldapLogon(A0_29, A1_30, L7_36, L10_39, NULL, NULL, L13_42, L14_43)
    if L4_33 == 0 then
      return 0, L3_32["40"] or "i18nHTMLMissing"
    elseif L4_33 == 1 or L4_33 == 2 then
      return 2, A2_31
    elseif L4_33 == 3 or L4_33 == 4 then
      if L8_37 ~= "" and L8_37 ~= nil then
        L4_33 = captivePortalLib.ldapLogon(A0_29, A1_30, L8_37, L11_40, NULL, NULL, L13_42, L14_43)
        if L4_33 == 0 then
          return 0, L3_32["40"] or "i18nHTMLMissing"
        elseif L4_33 == 1 or L4_33 == 2 then
          return 2, A2_31
        elseif L4_33 == 3 or L4_33 == 4 then
          if L9_38 ~= "" and L9_38 ~= nil then
            L4_33 = captivePortalLib.ldapLogon(A0_29, A1_30, L9_38, L12_41, NULL, NULL, L13_42, L14_43)
            if L4_33 == 0 then
              return 0, L3_32["40"] or "i18nHTMLMissing"
            elseif L4_33 == 1 or L4_33 == 2 then
              return 2, A2_31
            elseif L4_33 == 3 or L4_33 == 4 then
              if L4_33 == 3 then
                return 2, A2_31
              else
                return 2, A2_31
              end
            end
          elseif L4_33 == 3 then
            return 2, A2_31
          else
            return 2, A2_31
          end
        end
      elseif L9_38 ~= "" and L9_38 ~= nil then
        L4_33 = captivePortalLib.ldapLogon(A0_29, A1_30, L9_38, L12_41, NULL, NULL, L13_42, L14_43)
        if L4_33 == 0 then
          return 0, L3_32["40"] or "i18nHTMLMissing"
        elseif L4_33 == 1 or L4_33 == 2 then
          return 2, A2_31
        elseif L4_33 == 3 or L4_33 == 4 then
          if L4_33 == 3 then
            return 2, A2_31
          else
            return 2, A2_31
          end
        end
      elseif L4_33 == 3 then
        return 2, A2_31
      else
        return 2, A2_31
      end
    end
  else
    L7_36 = 2
    L8_37 = A2_31
    return L7_36, L8_37
  end
end
function captivePortal.ExternalAuthNtDomain(A0_44, A1_45, A2_46)
  local L3_47, L4_48, L5_49, L6_50, L7_51, L8_52, L9_53, L10_54, L11_55, L12_56, L13_57, L14_58
  L3_47 = "39,40,41,42,43"
  L4_48 = db
  L4_48 = L4_48.getString
  L5_49 = L3_47
  L4_48 = L4_48(L5_49)
  L3_47 = L4_48
  L4_48 = nil
  L5_49 = "rowid=1"
  L6_50 = db
  L6_50 = L6_50.getRowWhere
  L7_51 = "NTDomainSettings"
  L8_52 = L5_49
  L6_50 = L6_50(L7_51, L8_52)
  if L6_50 ~= nil then
    L7_51 = L6_50["NTDomainSettings.AuthenticationServer"]
    L8_52 = L6_50["NTDomainSettings.SecondAuthenticationServer"]
    L9_53 = L6_50["NTDomainSettings.ThirdAuthenticationServer"]
    L10_54 = L6_50["NTDomainSettings.NTDomainWorkGroup"]
    L11_55 = L6_50["NTDomainSettings.NTDomainSecondWorkGroup"]
    L12_56 = L6_50["NTDomainSettings.ThirdNTDomainWorkGroup"]
    L13_57 = L6_50["NTDomainSettings.TimeOut"]
    L14_58 = L6_50["NTDomainSettings.Retries"]
    if L13_57 == nil or L13_57 == "" then
      L13_57 = NULL
    end
    if L14_58 == nil or L14_58 == "" then
      L14_58 = NULL
    end
    L4_48 = captivePortalLib.ntDomainLogon(A0_44, A1_45, L7_51, L10_54, L13_57, L14_58)
    if L4_48 == 0 then
      return 0, L3_47["40"] or "i18nHTMLMissing"
    elseif L4_48 == 1 or L4_48 == 2 then
      return 2, A2_46
    elseif L4_48 == 3 or L4_48 == 4 then
      if L8_52 ~= "" and L8_52 ~= nil then
        L4_48 = captivePortalLib.ntDomainLogon(A0_44, A1_45, L8_52, L11_55, L13_57, L14_58)
        if L4_48 == 0 then
          return 0, L3_47["40"] or "i18nHTMLMissing"
        elseif L4_48 == 1 or L4_48 == 2 then
          return 2, A2_46
        elseif L4_48 == 3 or L4_48 == 4 then
          if L9_53 ~= "" and L9_53 ~= nil then
            L4_48 = captivePortalLib.ntDomainLogon(A0_44, A1_45, L9_53, L12_56, L13_57, L14_58)
            if L4_48 == 0 then
              return 0, L3_47["40"] or "i18nHTMLMissing"
            elseif L4_48 == 1 or L4_48 == 2 then
              return 2, A2_46
            elseif L4_48 == 3 or L4_48 == 4 then
              if L4_48 == 3 then
                return 2, A2_46
              else
                return 2, A2_46
              end
            end
          elseif L4_48 == 3 then
            return 2, A2_46
          else
            return 2, A2_46
          end
        end
      elseif L9_53 ~= "" and L9_53 ~= nil then
        L4_48 = captivePortalLib.ntDomainLogon(A0_44, A1_45, L9_53, L12_56, L13_57, L14_58)
        if L4_48 == 0 then
          return 0, L3_47["40"] or "i18nHTMLMissing"
        elseif L4_48 == 1 or L4_48 == 2 then
          return 2, A2_46
        elseif L4_48 == 3 or L4_48 == 4 then
          if L4_48 == 3 then
            return 2, A2_46
          else
            return 2, A2_46
          end
        end
      elseif L4_48 == 3 then
        return 2, A2_46
      else
        return 2, A2_46
      end
    end
  else
    L7_51 = 2
    L8_52 = A2_46
    return L7_51, L8_52
  end
end
function captivePortal.ExternalAuthActiveDirectory(A0_59, A1_60, A2_61)
  local L3_62, L4_63, L5_64, L6_65, L7_66, L8_67, L9_68, L10_69, L11_70
  L3_62 = "39,40,41,42,43"
  L4_63 = db
  L4_63 = L4_63.getString
  L5_64 = L3_62
  L4_63 = L4_63(L5_64)
  L3_62 = L4_63
  L4_63 = nil
  L5_64 = "rowid=1"
  L6_65 = db
  L6_65 = L6_65.getRowWhere
  L7_66 = "ActiveDirectorySettings"
  L8_67 = L5_64
  L6_65 = L6_65(L7_66, L8_67)
  if L6_65 ~= nil then
    L7_66 = L6_65["ActiveDirectorySettings.ActiveDirectoryDomain"]
    L8_67 = L6_65["ActiveDirectorySettings.SecondActiveDirectoryDomain"]
    L9_68 = L6_65["ActiveDirectorySettings.ThirdActiveDirectoryDomain"]
    L10_69 = tonumber
    L11_70 = L6_65["ActiveDirectorySettings.TimeOut"]
    L10_69 = L10_69(L11_70)
    L11_70 = tonumber
    L11_70 = L11_70(L6_65["ActiveDirectorySettings.Retries"])
    L4_63 = captivePortalLib.activeDirectoryLogon(A0_59, A1_60, L7_66, NULL, L10_69, L11_70)
    if L4_63 == 0 then
      return 0, L3_62["40"] or "i18nHTMLMissing"
    elseif L4_63 == 1 or L4_63 == 2 then
      return 2, A2_61
    elseif L4_63 == 3 or L4_63 == 4 then
      if L8_67 ~= "" and L8_67 ~= nil then
        L4_63 = captivePortalLib.activeDirectoryLogon(A0_59, A1_60, L8_67, NULL, L10_69, L11_70)
        if L4_63 == 0 then
          return 0, L3_62["40"] or "i18nHTMLMissing"
        elseif L4_63 == 1 or L4_63 == 2 then
          return 2, A2_61
        elseif L4_63 == 3 or L4_63 == 4 then
          if L9_68 ~= "" and L9_68 ~= nil then
            L4_63 = captivePortalLib.activeDirectoryLogon(A0_59, A1_60, L9_68, NULL, L10_69, L11_70)
            if L4_63 == 0 then
              return 0, L3_62["40"] or "i18nHTMLMissing"
            elseif L4_63 == 1 or L4_63 == 2 then
              return 2, A2_61
            elseif L4_63 == 3 or L4_63 == 4 then
              if L4_63 == 3 then
                return 2, A2_61
              else
                return 2, A2_61
              end
            end
          elseif L4_63 == 3 then
            return 2, A2_61
          else
            return 2, A2_61
          end
        end
      elseif L9_68 ~= "" and L9_68 ~= nil then
        L4_63 = captivePortalLib.activeDirectoryLogon(A0_59, A1_60, L9_68, NULL, L10_69, L11_70)
        if L4_63 == 0 then
          return 0, L3_62["40"] or "i18nHTMLMissing"
        elseif L4_63 == 1 or L4_63 == 2 then
          return 2, A2_61
        elseif L4_63 == 3 or L4_63 == 4 then
          if L4_63 == 3 then
            return 2, A2_61
          else
            return 2, A2_61
          end
        end
      elseif L4_63 == 3 then
        return 2, A2_61
      else
        return 2, A2_61
      end
    end
  else
    L7_66 = 2
    L8_67 = A2_61
    return L7_66, L8_67
  end
end
function captivePortal.ExternalAuthPop3(A0_71, A1_72, A2_73)
  local L3_74, L4_75, L5_76, L6_77, L7_78, L8_79, L9_80, L10_81, L11_82, L12_83, L13_84, L14_85, L15_86, L16_87, L17_88, L18_89, L19_90, L20_91
  L3_74 = "39,40,41,42,43"
  L4_75 = db
  L4_75 = L4_75.getString
  L5_76 = L3_74
  L4_75 = L4_75(L5_76)
  L3_74 = L4_75
  L4_75 = nil
  L5_76 = "rowid=1"
  L6_77 = db
  L6_77 = L6_77.getRowWhere
  L7_78 = "POPProfiles"
  L8_79 = L5_76
  L6_77 = L6_77(L7_78, L8_79)
  if L6_77 ~= nil then
    L7_78 = L6_77["POPProfiles.Server"]
    L8_79 = L6_77["POPProfiles.SecondServer"]
    L9_80 = L6_77["POPProfiles.ThirdServer"]
    L10_81 = L6_77["POPProfiles.AuthenticationPort"]
    L11_82 = L6_77["POPProfiles.SecondAuthenticationPort"]
    L12_83 = L6_77["POPProfiles.ThirdAuthenticationPort"]
    L13_84 = L6_77["POPProfiles.SSLEnable"]
    L14_85 = L6_77["POPProfiles.SecondSSLEnable"]
    L15_86 = L6_77["POPProfiles.ThirdSSLEnable"]
    L16_87 = L6_77["POPProfiles.CAFile"]
    L17_88 = L6_77["POPProfiles.SecondCAFile"]
    L18_89 = L6_77["POPProfiles.ThirdCAFile"]
    L19_90 = L6_77["POPProfiles.Timeout"]
    L20_91 = L6_77["POPProfiles.Retries"]
    if L19_90 == nil or L19_90 == "" then
      L19_90 = NULL
    end
    if L20_91 == nil or L20_91 == "" then
      L20_91 = NULL
    end
    if L13_84 == "1" then
      L16_87 = "/flash/tmp/caFiles/" .. L16_87
    else
      L16_87 = NULL
    end
    L4_75 = captivePortalLib.mpopLogon(A0_71, A1_72, L7_78, L10_81, L13_84, L16_87, L19_90, L20_91)
    if L4_75 == 0 then
      return 0, L3_74["40"] or "i18nHTMLMissing"
    elseif L4_75 == 1 or L4_75 == 2 then
      return 2, A2_73
    elseif L4_75 == 3 or L4_75 == 4 then
      if L8_79 ~= "" and L8_79 ~= nil then
        if L14_85 == "1" then
          L17_88 = "/flash/tmp/caFiles/" .. L17_88
        else
          L17_88 = NULL
        end
        L4_75 = captivePortalLib.mpopLogon(A0_71, A1_72, L8_79, L11_82, L14_85, L17_88, L19_90, L20_91)
        if L4_75 == 0 then
          return 0, L3_74["40"] or "i18nHTMLMissing"
        elseif L4_75 == 1 or L4_75 == 2 then
          return 2, A2_73
        elseif L4_75 == 3 or L4_75 == 4 then
          if L9_80 ~= "" and L9_80 ~= nil then
            if L15_86 == "1" then
              L18_89 = "/flash/tmp/caFiles/" .. L18_89
            else
              L18_89 = NULL
            end
            L4_75 = captivePortalLib.mpopLogon(A0_71, A1_72, L9_80, L12_83, L15_86, L18_89, L19_90, L20_91)
            if L4_75 == 0 then
              return 0, L3_74["40"] or "i18nHTMLMissing"
            elseif L4_75 == 1 or L4_75 == 2 then
              return 2, A2_73
            elseif L4_75 == 3 or L4_75 == 4 then
              if L4_75 == 3 then
                return 2, A2_73
              else
                return 2, A2_73
              end
            end
          elseif L4_75 == 3 then
            return 2, A2_73
          else
            return 2, A2_73
          end
        end
      elseif L9_80 ~= "" and L9_80 ~= nil then
        if L15_86 == "1" then
          L18_89 = "/flash/tmp/caFiles/" .. L18_89
        else
          L18_89 = NULL
        end
        L4_75 = captivePortalLib.mpopLogon(A0_71, A1_72, L9_80, L12_83, L15_86, L18_89, L19_90, L20_91)
        if L4_75 == 0 then
          return 0, L3_74["40"] or "i18nHTMLMissing"
        elseif L4_75 == 1 or L4_75 == 2 then
          return 2, A2_73
        elseif L4_75 == 3 or L4_75 == 4 then
          if L4_75 == 3 then
            return 2, A2_73
          else
            return 2, A2_73
          end
        end
      elseif L4_75 == 3 then
        return 2, A2_73
      else
        return 2, A2_73
      end
    end
  else
    L7_78 = 2
    L8_79 = A2_73
    return L7_78, L8_79
  end
end
function captivePortal.ExternalAuthRadius(A0_92, A1_93, A2_94, A3_95)
  local L4_96, L5_97, L6_98, L7_99, L8_100
  L4_96 = "39,40"
  L5_97 = db
  L5_97 = L5_97.getString
  L6_98 = L4_96
  L5_97 = L5_97(L6_98)
  L4_96 = L5_97
  L5_97, L6_98 = nil, nil
  L7_99 = captivePortalLib
  L7_99 = L7_99.authenticate
  L8_100 = A0_92
  L8_100 = L7_99(L8_100, A1_93, A2_94)
  if L7_99 == 0 then
    if db.getRow("CaptivePortalSession", "UserName", A0_92) ~= nil then
      L7_99 = 1
      L5_97 = L4_96["39"] or "i18nHTMLMissing"
    else
      L7_99 = 0
      L5_97 = L4_96["40"] or "i18nHTMLMissing"
    end
  else
    L7_99 = 2
    L5_97 = A3_95
  end
  return L7_99, L5_97, L8_100
end
function captivePortal.RunTimeAuthenticate(A0_101, A1_102, A2_103)
  local L3_104, L4_105, L5_106, L6_107, L7_108, L8_109, L9_110, L10_111, L11_112, L12_113, L13_114, L14_115, L15_116, L16_117, L17_118, L18_119
  L3_104 = "45,46"
  L4_105 = db
  L4_105 = L4_105.getString
  L5_106 = L3_104
  L4_105 = L4_105(L5_106)
  L3_104 = L4_105
  L4_105 = A0_101["CaptivePortalSession.UserName"]
  L5_106 = A0_101["CaptivePortalSession.Password"]
  L6_107 = A0_101["Login.userAgent"]
  L7_108, L8_109, L9_110 = nil, nil, nil
  L10_111 = "vlanId ="
  L11_112 = A1_102
  L10_111 = L10_111 .. L11_112
  L11_112 = "UserName ='"
  L12_113 = L4_105
  L13_114 = "' and Password = '"
  L14_115 = L5_106
  L15_116 = "'"
  L11_112 = L11_112 .. L12_113 .. L13_114 .. L14_115 .. L15_116
  L12_113 = db
  L12_113 = L12_113.getRowWhere
  L13_114 = "CaptivePortalVlan"
  L14_115 = L10_111
  L12_113 = L12_113(L13_114, L14_115)
  L13_114 = db
  L13_114 = L13_114.getRowWhere
  L14_115 = "tempUsers"
  L15_116 = L11_112
  L13_114 = L13_114(L14_115, L15_116)
  L14_115 = L12_113["CaptivePortalVlan.accessType"]
  if L14_115 == "3" then
    if L13_114 ~= nil then
      L14_115 = L13_114["tempUsers.BeginDate"]
      if L14_115 ~= "0" then
        L14_115 = captivePortal
        L14_115 = L14_115.accountBeginDateCheck
        L15_116 = L13_114["tempUsers.BeginDate"]
        L14_115 = L14_115(L15_116)
        valid = L14_115
        L14_115 = valid
        if not L14_115 then
          L7_108 = 2
          L14_115 = L3_104["45"]
          L8_109 = L14_115 or "i18nHTMLMissing"
          L14_115 = L7_108
          L15_116 = L8_109
          L16_117 = L9_110
          return L14_115, L15_116, L16_117
        end
      end
      L14_115 = L13_114["tempUsers.ExpirationDate"]
      if L14_115 ~= "0" then
        L14_115 = captivePortal
        L14_115 = L14_115.accountExpirationDateCheck
        L15_116 = L13_114["tempUsers.ExpirationDate"]
        L14_115 = L14_115(L15_116)
        valid = L14_115
        L14_115 = valid
        if not L14_115 then
          L7_108 = 2
          L14_115 = L3_104["46"]
          L8_109 = L14_115 or "i18nHTMLMissing"
          L14_115 = L7_108
          L15_116 = L8_109
          L16_117 = L9_110
          return L14_115, L15_116, L16_117
        end
      end
      L14_115 = db
      L14_115 = L14_115.getAttribute
      L15_116 = "tempCPUserProfiles"
      L16_117 = "ProfileId"
      L17_118 = L13_114["tempUsers.ProfileId"]
      L18_119 = "MultiLogin"
      L14_115 = L14_115(L15_116, L16_117, L17_118, L18_119)
      multiLog = L14_115
      L14_115 = db
      L14_115 = L14_115.getAttribute
      L15_116 = "tempCPUserProfiles"
      L16_117 = "ProfileId"
      L17_118 = L13_114["tempUsers.ProfileId"]
      L18_119 = "IdleTimeout"
      L14_115 = L14_115(L15_116, L16_117, L17_118, L18_119)
      L9_110 = L14_115
      L14_115 = multiLog
      if L14_115 == "0" then
        L14_115 = captivePortal
        L14_115 = L14_115.CPSessionCheck
        L15_116 = L4_105
        L15_116 = L14_115(L15_116)
        L8_109 = L15_116
        L7_108 = L14_115
        if L7_108 == 1 then
          L14_115 = L7_108
          L15_116 = L8_109
          return L14_115, L15_116
        end
      end
      L14_115 = "tempUsers"
      L15_116 = captivePortal
      L15_116 = L15_116.loginPolsVer
      L16_117 = L14_115
      L17_118 = L6_107
      L18_119 = L4_105
      L16_117 = L15_116(L16_117, L17_118, L18_119)
      L8_109 = L16_117
      L7_108 = L15_116
      if L7_108 == 0 then
        L7_108 = 5
      end
    else
      L7_108 = 2
      L14_115 = db
      L14_115 = L14_115.getAttribute
      L15_116 = "CaptivePortalPageDetails"
      L16_117 = "profileId"
      L17_118 = A2_103
      L18_119 = "errorMessage"
      L14_115 = L14_115(L15_116, L16_117, L17_118, L18_119)
      L8_109 = L14_115
    end
    L14_115 = L7_108
    L15_116 = L8_109
    L16_117 = L9_110
    return L14_115, L15_116, L16_117
  else
    L14_115 = L12_113["CaptivePortalVlan.accessType"]
    if L14_115 == "2" then
      L14_115 = L12_113["CaptivePortalVlan.authServerId"]
      if L14_115 ~= "0" then
        L14_115 = tonumber
        L15_116 = L12_113["CaptivePortalVlan.authServerId"]
        L14_115 = L14_115(L15_116)
        L15_116 = db
        L15_116 = L15_116.getAttribute
        L16_117 = "CaptivePortalPageDetails"
        L17_118 = "profileId"
        L18_119 = A2_103
        L15_116 = L15_116(L16_117, L17_118, L18_119, "errorMessage")
        L16_117 = L14_115 % 10
        L14_115 = L14_115 - L16_117
        L17_118 = EXT_SERVER_ID_RADIUS
        if L14_115 == L17_118 then
          L17_118 = captivePortal
          L17_118 = L17_118.ExternalAuthRadius
          L18_119 = L4_105
          return L17_118(L18_119, L5_106, L16_117, L15_116)
        else
          L17_118 = EXT_SERVER_ID_LDAP
          if L14_115 == L17_118 then
            L17_118 = captivePortal
            L17_118 = L17_118.ExternalAuthLdap
            L18_119 = L4_105
            L18_119 = L17_118(L18_119, L5_106, L15_116)
            return L17_118, L18_119, EXT_SERVER_DEF_IDLE_TIMEOUT
          else
            L17_118 = EXT_SERVER_ID_POP3
            if L14_115 == L17_118 then
              L17_118 = captivePortal
              L17_118 = L17_118.ExternalAuthPop3
              L18_119 = L4_105
              L18_119 = L17_118(L18_119, L5_106, L15_116)
              return L17_118, L18_119, EXT_SERVER_DEF_IDLE_TIMEOUT
            else
              L17_118 = EXT_SERVER_ID_AD
              if L14_115 == L17_118 then
                L17_118 = captivePortal
                L17_118 = L17_118.ExternalAuthActiveDirectory
                L18_119 = L4_105
                L18_119 = L17_118(L18_119, L5_106, L15_116)
                return L17_118, L18_119, EXT_SERVER_DEF_IDLE_TIMEOUT
              else
                L17_118 = EXT_SERVER_ID_NTDOMAIN
                if L14_115 == L17_118 then
                  L17_118 = captivePortal
                  L17_118 = L17_118.ExternalAuthNtDomain
                  L18_119 = L4_105
                  L18_119 = L17_118(L18_119, L5_106, L15_116)
                  return L17_118, L18_119, EXT_SERVER_DEF_IDLE_TIMEOUT
                end
              end
            end
          end
        end
      else
        L12_113 = nil
        L14_115 = "UserName = '"
        L15_116 = L4_105
        L16_117 = "'"
        L17_118 = " and Password = '"
        L18_119 = L5_106
        L10_111 = L14_115 .. L15_116 .. L16_117 .. L17_118 .. L18_119 .. "'"
        L14_115 = db
        L14_115 = L14_115.getAttribute
        L15_116 = "Users"
        L16_117 = "UserName"
        L17_118 = L4_105
        L18_119 = "UserTimeOut"
        L14_115 = L14_115(L15_116, L16_117, L17_118, L18_119)
        L9_110 = L14_115
        L14_115 = loginLib
        L14_115 = L14_115.userAuthenticate
        L15_116 = L4_105
        L16_117 = L5_106
        L14_115 = L14_115(L15_116, L16_117)
        L7_108 = L14_115
        if L7_108 == "1" then
          L14_115 = captivePortal
          L14_115 = L14_115.isCaptivePortalUser
          L15_116 = L4_105
          L14_115 = L14_115(L15_116)
          if L14_115 then
            L14_115 = db
            L14_115 = L14_115.getAttribute
            L15_116 = "Users"
            L16_117 = "UserName"
            L17_118 = L4_105
            L18_119 = "multiLogSup"
            L14_115 = L14_115(L15_116, L16_117, L17_118, L18_119)
            if L14_115 == "0" then
              L14_115 = captivePortal
              L14_115 = L14_115.CPSessionCheck
              L15_116 = L4_105
              L15_116 = L14_115(L15_116)
              L8_109 = L15_116
              L7_108 = L14_115
              if L7_108 == 1 then
                L14_115 = L7_108
                L15_116 = L8_109
                return L14_115, L15_116
              end
            end
            L14_115 = "Users"
            L15_116 = captivePortal
            L15_116 = L15_116.loginPolsVer
            L16_117 = L14_115
            L17_118 = L6_107
            L18_119 = L4_105
            L16_117 = L15_116(L16_117, L17_118, L18_119)
            L8_109 = L16_117
            L7_108 = L15_116
            L15_116 = L7_108
            L16_117 = L8_109
            L17_118 = L9_110
            return L15_116, L16_117, L17_118
          end
        end
        L7_108 = 2
        L14_115 = db
        L14_115 = L14_115.getAttribute
        L15_116 = "CaptivePortalPageDetails"
        L16_117 = "profileId"
        L17_118 = A2_103
        L18_119 = "errorMessage"
        L14_115 = L14_115(L15_116, L16_117, L17_118, L18_119)
        L8_109 = L14_115
        L14_115 = L7_108
        L15_116 = L8_109
        return L14_115, L15_116
      end
    end
  end
end
function captivePortal.RunTimelogin(A0_120, A1_121, A2_122, A3_123)
  local L4_124, L5_125, L6_126, L7_127, L8_128, L9_129, L10_130, L11_131, L12_132, L13_133, L14_134, L15_135, L16_136, L17_137, L18_138, L19_139
  L4_124 = "44,40"
  L5_125 = db
  L5_125 = L5_125.getString
  L6_126 = L4_124
  L5_125 = L5_125(L6_126)
  L4_124 = L5_125
  L5_125 = "CaptivePortalSession"
  L6_126 = SAPI
  L6_126 = L6_126.Request
  L6_126 = L6_126.servervariable
  L7_127 = "REMOTE_ADDR"
  L6_126 = L6_126(L7_127)
  L7_127 = A0_120["CaptivePortalSession.UserName"]
  L8_128 = db
  L8_128 = L8_128.getAttribute
  L9_129 = "intervlanrouting"
  L10_130 = "vlanId"
  L11_131 = A2_122
  L12_132 = "accessType"
  L8_128 = L8_128(L9_129, L10_130, L11_131, L12_132)
  L8_128 = L8_128 or "-1"
  L9_129 = nil
  L10_130 = "bdg"
  L11_131 = A2_122
  L10_130 = L10_130 .. L11_131
  L11_131 = "CPAccInfoIP"
  L12_132 = ""
  L13_133 = ""
  L14_134 = {}
  CPAccTableIP = L14_134
  A0_120["CaptivePortalSession.idleTimeout"] = A3_123
  A0_120["CaptivePortalSession.ifName"] = L10_130
  A0_120["CaptivePortalSession.ipAddr"] = L6_126
  L14_134 = captivePortalLib
  L14_134 = L14_134.macAddrGet
  L15_135 = L6_126
  L14_134 = L14_134(L15_135)
  A0_120["CaptivePortalSession.macAddr"] = L14_134
  L14_134 = A0_120["CaptivePortalSession.macAddr"]
  if L14_134 == "0" then
    L14_134 = "ERROR"
    L15_135 = L4_124["44"]
    L15_135 = L15_135 or "i18nHTMLMissing"
    return L14_134, L15_135
  end
  L14_134 = db
  L14_134 = L14_134.execute
  L15_135 = "ATTACH '/tmp/cpAcc.db' as cpAccDB"
  L14_134(L15_135)
  L14_134 = db
  L14_134 = L14_134.beginTransaction
  L14_134()
  L14_134 = db
  L14_134 = L14_134.getAttribute
  L15_135 = "CaptivePortalSession"
  L16_136 = "ipAddr"
  L17_137 = L6_126
  L18_138 = "_ROWID_"
  L14_134 = L14_134(L15_135, L16_136, L17_137, L18_138)
  if L14_134 ~= nil then
    L15_135 = db
    L15_135 = L15_135.deleteRow
    L16_136 = L5_125
    L17_137 = "ipAddr"
    L18_138 = L6_126
    L15_135(L16_136, L17_137, L18_138)
  end
  L15_135 = db
  L15_135 = L15_135.insert
  L16_136 = L5_125
  L17_137 = A0_120
  L15_135 = L15_135(L16_136, L17_137)
  L16_136 = db
  L16_136 = L16_136.getAttribute
  L17_137 = "CaptivePortalPageDetails"
  L18_138 = "profileId"
  L19_139 = A1_121
  L16_136 = L16_136(L17_137, L18_138, L19_139, "errorMessage")
  if L15_135 and L8_128 == "3" then
    L17_137 = "CPAccInfoIP"
    L18_138 = ""
    L19_139 = ""
    CPAccTableIP = {}
    L19_139 = "ipAddress = '" .. A0_120["CaptivePortalSession.ipAddr"] .. "' AND UserName = '" .. A0_120["CaptivePortalSession.UserName"] .. "'"
    L18_138 = db.getRowWhere("CPAccInfoIP", L19_139)
    if L18_138 == nil then
      CPAccTableIP["CPAccInfoIP.UserName"] = A0_120["CaptivePortalSession.UserName"]
      CPAccTableIP["CPAccInfoIP.ipAddress"] = A0_120["CaptivePortalSession.ipAddr"]
      CPAccTableIP["CPAccInfoIP.currentTimeUsage"] = "0"
    end
    if L18_138 == nil then
      L15_135 = db.insert(L17_137, CPAccTableIP)
    end
  end
  if L15_135 then
    L17_137 = db
    L17_137 = L17_137.commitTransaction
    L18_138 = true
    L17_137(L18_138)
    L17_137 = db
    L17_137 = L17_137.execute
    L18_138 = "DETACH cpAccDB"
    L17_137(L18_138)
    L17_137 = "OK"
    L18_138 = L4_124["40"]
    L18_138 = L18_138 or "i18nHTMLMissing"
    return L17_137, L18_138
  else
    L17_137 = db
    L17_137 = L17_137.rollback
    L17_137()
    L17_137 = db
    L17_137 = L17_137.execute
    L18_138 = "DETACH cpAccDB"
    L17_137(L18_138)
    L17_137 = "ERROR"
    L18_138 = L16_136
    return L17_137, L18_138
  end
end
function captivePortal.slaRunTimelogin(A0_140)
  local L1_141, L2_142, L3_143, L4_144, L5_145, L6_146, L7_147, L8_148, L9_149, L10_150
  L1_141 = {L2_142, L3_143}
  L2_142 = "11329"
  L3_143 = "12286"
  L2_142 = I18N
  L2_142 = L2_142.translate
  L3_143 = L1_141
  L2_142 = L2_142(L3_143)
  L3_143 = "CaptivePortalSession"
  L4_144 = SAPI
  L4_144 = L4_144.Request
  L4_144 = L4_144.servervariable
  L5_145 = "REMOTE_ADDR"
  L4_144 = L4_144(L5_145)
  L5_145 = captivePortalLib
  L5_145 = L5_145.slaUser
  L5_145 = L5_145()
  L6_146 = "10"
  L7_147 = {}
  L7_147["CaptivePortalSession.UserName"] = L5_145
  L7_147["CaptivePortalSession.idleTimeout"] = L6_146
  L8_148 = "bdg"
  L9_149 = A0_140
  L8_148 = L8_148 .. L9_149
  L7_147["CaptivePortalSession.ifName"] = L8_148
  L7_147["CaptivePortalSession.ipAddr"] = L4_144
  L8_148 = captivePortalLib
  L8_148 = L8_148.macAddrGet
  L9_149 = L4_144
  L8_148 = L8_148(L9_149)
  L7_147["CaptivePortalSession.macAddr"] = L8_148
  L8_148 = L7_147["CaptivePortalSession.macAddr"]
  if L8_148 == "0" then
    L8_148 = "ERROR"
    L9_149 = L2_142["11329"]
    return L8_148, L9_149
  end
  L8_148 = db
  L8_148 = L8_148.beginTransaction
  L8_148()
  L8_148 = db
  L8_148 = L8_148.getAttribute
  L9_149 = "CaptivePortalSession"
  L10_150 = "ipAddr"
  L8_148 = L8_148(L9_149, L10_150, L4_144, "_ROWID_")
  if L8_148 ~= nil then
    L9_149 = db
    L9_149 = L9_149.deleteRow
    L10_150 = L3_143
    L9_149(L10_150, "ipAddr", L4_144)
  end
  L9_149 = db
  L9_149 = L9_149.insert
  L10_150 = L3_143
  L9_149 = L9_149(L10_150, L7_147)
  L10_150 = db
  L10_150 = L10_150.getAttribute
  L10_150 = L10_150("CaptivePortalPageDetails", "profileId", 1, "errorMessage")
  if L9_149 then
    db.commitTransaction(true)
    return "OK", L2_142["12286"]
  else
    db.rollback()
    return "ERROR", L10_150
  end
end
function captivePortal.RunTimelogout()
  local L0_151, L1_152, L2_153
  L0_151 = "CaptivePortalSession"
  L1_152 = SAPI
  L1_152 = L1_152.Request
  L1_152 = L1_152.servervariable
  L2_153 = "REMOTE_ADDR"
  L1_152 = L1_152(L2_153)
  L2_153 = db
  L2_153 = L2_153.getAttribute
  L2_153 = L2_153("CaptivePortalSession", "ipAddr", L1_152, "UserName")
  if L2_153 == nil then
    return "ERROR"
  end
  db.beginTransaction()
  if db.deleteRow(L0_151, "ipAddr", L1_152) then
    loginLuaLib.luaLoginEventHandler(L2_153 .. " user logged out successfully.", 6, "LOGIN")
    db.commitTransaction(true)
    return "OK", "12264"
  else
    db.rollback()
    return "ERROR", "12263"
  end
end
function captivePortal.Enable(A0_154)
  local L1_155, L2_156
  L1_155 = "CaptivePortal"
  L2_156 = A0_154["CaptivePortal.enable"]
  if L2_156 ~= db.getAttribute("CaptivePortal", "_ROWID_", "1", "enable") then
  end
  return "OK"
end
function captivePortal.Config(A0_157, A1_158, A2_159)
  local L3_160, L4_161, L5_162, L6_163
  L3_160 = ACCESS_LEVEL
  if L3_160 ~= 0 then
    L3_160 = "ACCESS_DENIED"
    L4_161 = "10187"
    return L3_160, L4_161
  end
  L3_160 = false
  L4_161 = ""
  if A2_159 == "add" then
    L5_162 = db
    L5_162 = L5_162.getRowsWhere
    L6_163 = "CaptivePortalVlan"
    L5_162 = L5_162(L6_163, "vlanId='" .. A0_157["CaptivePortalVlan.vlanId"] .. "'")
    L6_163 = #L5_162
    if L6_163 > 0 then
      L6_163 = "ERROR"
      return L6_163, "11791"
    end
    L6_163 = db
    L6_163 = L6_163.getTable
    L6_163 = L6_163("CaptivePortalVlan")
    if #L6_163 == 0 then
      captivePortal.enableConfig(1)
    end
    L3_160 = db.insert("CaptivePortalVlan", A0_157, A1_158)
    if L3_160 then
      L4_161 = "10395"
    else
      L4_161 = "10396"
    end
  elseif A2_159 == "edit" then
    L5_162 = db
    L5_162 = L5_162.update
    L6_163 = "CaptivePortalVlan"
    L5_162 = L5_162(L6_163, A0_157, A1_158)
    L3_160 = L5_162
    if L3_160 then
      L4_161 = "10399"
    else
      L4_161 = "10400"
    end
  elseif A2_159 == "delete" then
    L5_162 = " _ROWID_ = "
    L6_163 = A1_158
    L5_162 = L5_162 .. L6_163
    L6_163 = db
    L6_163 = L6_163.getAttribute
    L6_163 = L6_163("CaptivePortalVlan", "_ROWID_", A1_158, "vlanId")
    captivePortal.DeleteSessions(L6_163)
    L3_160 = db.deleteRowWhere("CaptivePortalVlan", L5_162)
    if L3_160 then
      L4_161 = "10399"
    else
      L4_161 = "10400"
    end
  end
  L5_162 = db
  L5_162 = L5_162.getTable
  L6_163 = "CaptivePortalVlan"
  L5_162 = L5_162(L6_163)
  L6_163 = captivePortal
  L6_163 = L6_163.enableConfig
  L6_163(#L5_162)
  if L3_160 then
    L6_163 = "OK"
    return L6_163, L4_161
  else
    L6_163 = "ERROR"
    return L6_163, L4_161
  end
end
function captivePortal.getRow(A0_164)
  local L1_165, L2_166, L3_167
  L1_165 = "rowid="
  L2_166 = A0_164
  L1_165 = L1_165 .. L2_166
  L2_166 = db
  L2_166 = L2_166.getRowWhere
  L3_167 = "CaptivePortalVlan"
  L2_166 = L2_166(L3_167, L1_165)
  L3_167 = L2_166["CaptivePortalVlan.vlanName"]
  if L3_167 ~= "LAN" then
    L2_166["CaptivePortalVlan.IninterfaceName"] = "VLAN-" .. L3_167
  else
    L2_166["CaptivePortalVlan.IninterfaceName"] = "LAN"
  end
  return L2_166
end
function captivePortal.getCpPolicies()
  local L0_168, L1_169, L2_170, L3_171, L4_172, L5_173, L6_174
  L0_168 = db
  L0_168 = L0_168.getTable
  L0_168 = L0_168(L1_169)
  for L4_172, L5_173 in L1_169(L2_170) do
    L6_174 = L5_173["CaptivePortalVlan.vlanName"]
    if L6_174 == "LAN" then
      L5_173["CaptivePortalVlan.IninterfaceName"] = "LAN"
    else
      L5_173["CaptivePortalVlan.IninterfaceName"] = "VLAN-" .. L6_174
    end
  end
  return L0_168
end
function captivePortal.delete(A0_175)
  local L1_176, L2_177, L3_178, L4_179, L5_180, L6_181, L7_182
  L1_176 = ACCESS_LEVEL
  if L1_176 ~= 0 then
    L1_176 = "ACCESS_DENIED"
    return L1_176, L2_177
  end
  L1_176 = db
  L1_176 = L1_176.beginTransaction
  L1_176()
  L1_176 = false
  for L5_180, L6_181 in L2_177(L3_178) do
    L7_182 = {}
    L7_182["CaptivePortalVlan._ROWID_"] = L6_181
    L1_176 = db.delete("CaptivePortalVlan", L7_182)
    if not L1_176 then
      break
    end
  end
  L3_178(L4_179)
  if L1_176 then
    L3_178(L4_179)
    return L3_178, L4_179
  else
    L3_178()
    return L3_178, L4_179
  end
end
function captivePortal.enable(A0_183)
  local L1_184, L2_185, L3_186, L4_187, L5_188, L6_189, L7_190, L8_191, L9_192
  L1_184 = ACCESS_LEVEL
  if L1_184 ~= 0 then
    L1_184 = "ACCESS_DENIED"
    return L1_184, L2_185
  end
  L1_184 = db
  L1_184 = L1_184.beginTransaction
  L1_184()
  L1_184 = false
  for L5_188, L6_189 in L2_185(L3_186) do
    L7_190 = "rowid = "
    L8_191 = L6_189
    L7_190 = L7_190 .. L8_191
    L8_191 = {}
    L9_192 = db
    L9_192 = L9_192.getRowWhere
    L9_192 = L9_192("CaptivePortalVlan", L7_190)
    L9_192["CaptivePortalVlan.enable"] = 1
    L1_184 = db.update("CaptivePortalVlan", L9_192, L9_192["CaptivePortalVlan._ROWID_"])
  end
  L3_186(L4_187)
  if L1_184 then
    L3_186(L4_187)
    return L3_186, L4_187
  else
    L3_186()
    return L3_186, L4_187
  end
end
function captivePortal.disable(A0_193)
  local L1_194, L2_195, L3_196, L4_197, L5_198, L6_199, L7_200, L8_201, L9_202
  L1_194 = ACCESS_LEVEL
  if L1_194 ~= 0 then
    L1_194 = "ACCESS_DENIED"
    return L1_194, L2_195
  end
  L1_194 = db
  L1_194 = L1_194.beginTransaction
  L1_194()
  L1_194 = false
  for L5_198, L6_199 in L2_195(L3_196) do
    L7_200 = "rowid = "
    L8_201 = L6_199
    L7_200 = L7_200 .. L8_201
    L8_201 = {}
    L9_202 = db
    L9_202 = L9_202.getRowWhere
    L9_202 = L9_202("CaptivePortalVlan", L7_200)
    L9_202["CaptivePortalVlan.enable"] = 0
    L1_194 = db.update("CaptivePortalVlan", L9_202, L9_202["CaptivePortalVlan._ROWID_"])
  end
  L3_196(L4_197)
  if L1_194 then
    L3_196(L4_197)
    return L3_196, L4_197
  else
    L3_196()
    return L3_196, L4_197
  end
end
function captivePortal.enableConfig(A0_203)
  local L1_204, L2_205
  L2_205 = {}
  if A0_203 > 0 then
    L2_205["CaptivePortal.enable"] = "1"
    captivePortal.Enable(L2_205)
  end
  if false then
    L2_205["CaptivePortal.enable"] = "0"
    captivePortal.Enable(L2_205)
  end
end
function captivePortal.changePassword(A0_206)
  local L1_207, L2_208, L3_209, L4_210, L5_211, L6_212, L7_213
  L1_207 = "60,61,62"
  L2_208 = db
  L2_208 = L2_208.getString
  L3_209 = L1_207
  L2_208 = L2_208(L3_209)
  L1_207 = L2_208
  L2_208 = "Users"
  L3_209 = SAPI
  L3_209 = L3_209.Request
  L3_209 = L3_209.servervariable
  L4_210 = "REMOTE_ADDR"
  L3_209 = L3_209(L4_210)
  L4_210 = db
  L4_210 = L4_210.getAttribute
  L5_211 = "CaptivePortalSession"
  L6_212 = "ipAddr"
  L7_213 = L3_209
  L4_210 = L4_210(L5_211, L6_212, L7_213, "UserName")
  L5_211 = A0_206["CaptivePortalSession.nPassword"]
  L6_212 = A0_206["CaptivePortalSession.cnfPassword"]
  L7_213 = false
  if L4_210 == nil then
    return ERROR, L1_207["60"] or "i18nHTMLMissing"
  end
  result = loginLib.passwordChangeVerify(L5_211, L6_212)
  if result == nil then
    return "ERROR", L1_207["62"] or "i18nHTMLMissing"
  end
  db.beginTransaction()
  if captivePortal.isCaptivePortalUser(L4_210) then
    L7_213 = db.setAttribute("Users", "UserName", L4_210, "Password", L5_211)
  end
  L7_213 = L7_213 and captivePortal.RunTimelogout()
  if L7_213 then
    db.commitTransaction(true)
    return "OK", L1_207["61"] or "i18nHTMLMissing"
  else
    db.rollback()
    return "ERROR", L1_207["62"] or "i18nHTMLMissing"
  end
end
function captivePortal.forcedLoginPart1(A0_214, A1_215, A2_216)
  local L3_217, L4_218, L5_219, L6_220, L7_221, L8_222, L9_223, L10_224, L11_225, L12_226
  L3_217 = "CaptivePortalSession"
  L4_218 = A0_214["CaptivePortalSession.UserName"]
  L5_219 = db
  L5_219 = L5_219.getAttribute
  L6_220 = "CaptivePortalSession"
  L7_221 = "UserName"
  L8_222 = L4_218
  L9_223 = "idleTimeout"
  L5_219 = L5_219(L6_220, L7_221, L8_222, L9_223)
  L6_220 = "64,44,63"
  L7_221 = db
  L7_221 = L7_221.getString
  L8_222 = L6_220
  L7_221 = L7_221(L8_222)
  L6_220 = L7_221
  L7_221 = L6_220["64"]
  L7_221 = L7_221 or "i18nHTMLMissing"
  L8_222 = SAPI
  L8_222 = L8_222.Request
  L8_222 = L8_222.servervariable
  L9_223 = "REMOTE_ADDR"
  L8_222 = L8_222(L9_223)
  L9_223 = captivePortalLib
  L9_223 = L9_223.macAddrGet
  L10_224 = L8_222
  L9_223 = L9_223(L10_224)
  L10_224 = db
  L10_224 = L10_224.getAttribute
  L11_225 = "CaptivePortalVlan"
  L12_226 = "vlanId"
  L10_224 = L10_224(L11_225, L12_226, A2_216, "accessType")
  if L9_223 == "0" then
    L11_225 = "ERROR"
    L12_226 = L6_220["44"]
    L12_226 = L12_226 or "i18nHTMLMissing"
    return L11_225, L12_226
  end
  L11_225 = db
  L11_225 = L11_225.beginTransaction
  L11_225()
  L11_225 = db
  L11_225 = L11_225.deleteRow
  L12_226 = L3_217
  L11_225 = L11_225(L12_226, "UserName", L4_218)
  L12_226 = L6_220["63"]
  L12_226 = L12_226 or "i18nHTMLMissing"
  if L11_225 then
    db.commitTransaction(true)
    return "OK", L12_226, L10_224, L5_219
  else
    db.rollback()
    return "ERROR", L12_226, L10_224
  end
end
function captivePortal.forcedLoginPart2(A0_227, A1_228, A2_229, A3_230)
  local L4_231, L5_232, L6_233, L7_234
  L4_231 = A0_227["CaptivePortalSession.UserName"]
  L5_232 = "64"
  L6_233 = db
  L6_233 = L6_233.getString
  L7_234 = L5_232
  L6_233 = L6_233(L7_234)
  L5_232 = L6_233
  L6_233 = L5_232["64"]
  L6_233 = L6_233 or "i18nHTMLMissing"
  L7_234 = db
  L7_234 = L7_234.beginTransaction
  L7_234()
  L7_234 = {}
  L7_234["CaptivePortalSession.UserName"] = L4_231
  valid, L6_233 = captivePortal.RunTimelogin(L7_234, A1_228, A2_229, A3_230)
  if valid then
    db.commitTransaction(true)
    return "OK", L6_233
  else
    db.rollback()
    return "ERROR", L6_233
  end
end
function captivePortal.usersDisconnect(A0_235)
  local L1_236, L2_237, L3_238, L4_239, L5_240, L6_241
  if A0_235 ~= nil then
    for L5_240, L6_241 in L2_237(L3_238) do
      L1_236 = db.deleteRow("CaptivePortalSession", "_ROWID_", L6_241)
      if not L1_236 then
        break
      end
    end
  end
  if L1_236 then
    return L2_237, L3_238
  else
    return L2_237, L3_238
  end
end
function captivePortal.vlanConfig(A0_242, A1_243)
  local L2_244, L3_245, L4_246, L5_247
  L2_244 = ACCESS_LEVEL
  if L2_244 ~= 0 then
    L2_244 = "ACCESS_DENIED"
    L3_245 = "10187"
    return L2_244, L3_245
  end
  L2_244 = db
  L2_244 = L2_244.beginTransaction
  L2_244()
  L2_244 = true
  if A1_243 == "edit" then
    L3_245 = A0_242["vlan.vlanId"]
    if L3_245 ~= nil then
      L3_245 = A0_242["vlan.vlanId"]
    elseif L3_245 == "1" then
      A0_242["vlan.vlanId"] = ""
    end
    L3_245 = A0_242["vlan.vlanId"]
    L4_246 = "LAN"
    L5_247 = L3_245
    L4_246 = L4_246 .. L5_247
    L5_247 = "LogicalIfName='"
    L5_247 = L5_247 .. L4_246 .. "' and AddressFamily = 2"
    if db.getRowWhere("ifStatic", L5_247)["ifStatic.StaticIp"] ~= A0_242["ifStatic.StaticIp"] or db.getRowWhere("ifStatic", L5_247)["ifStatic.NetMask"] ~= A0_242["ifStatic.NetMask"] then
      captivePortal.DeleteSessions(L3_245)
    end
  end
  if L2_244 then
    L3_245 = db
    L3_245 = L3_245.commitTransaction
    L3_245()
    L3_245 = "OK"
    L4_246 = "12265"
    return L3_245, L4_246
  else
    L3_245 = db
    L3_245 = L3_245.rollback
    L3_245()
    L3_245 = "ERROR"
    L4_246 = "12263"
    return L3_245, L4_246
  end
end
function captivePortal.DeleteSessions(A0_248)
  local L1_249, L2_250, L3_251, L4_252, L5_253, L6_254, L7_255, L8_256, L9_257, L10_258, L11_259, L12_260, L13_261, L14_262
  if A0_248 == "1" then
    A0_248 = ""
  end
  L1_249 = "LAN"
  L2_250 = A0_248
  L1_249 = L1_249 .. L2_250
  L2_250 = "LogicalIfName='"
  L3_251 = L1_249
  L4_252 = "' and AddressFamily = 2"
  L2_250 = L2_250 .. L3_251 .. L4_252
  L3_251 = db
  L3_251 = L3_251.getRowWhere
  L4_252 = "ifStatic"
  L5_253 = L2_250
  L3_251 = L3_251(L4_252, L5_253)
  L4_252 = L3_251["ifStatic.StaticIp"]
  L5_253 = L3_251["ifStatic.NetMask"]
  L6_254 = db
  L6_254 = L6_254.getTable
  L7_255 = "CaptivePortalSession"
  L6_254 = L6_254(L7_255, L8_256)
  L7_255 = 0
  if L6_254 ~= nil then
    for L11_259, L12_260 in L8_256(L9_257) do
      L7_255 = L7_255 + 1
      L13_261 = L6_254[L7_255]
      L14_262 = L13_261["CaptivePortalSession.ipAddr"]
      if captivePortalLib.subnetCheck(L14_262, L4_252, L5_253) == "1" then
        captivePortal.usersDisconnect(L13_261)
      end
    end
  end
end
function captivePortal.uploadHeaderImg(A0_263)
  local L1_264, L2_265, L3_266, L4_267, L5_268, L6_269, L7_270, L8_271
  L1_264 = ACCESS_LEVEL
  if L1_264 ~= 0 then
    L1_264 = "ACCESS_DENIED"
    L2_265 = "10187"
    return L1_264, L2_265
  end
  L1_264 = A0_263["ImageDetails.RowID"]
  L2_265 = cgilua
  L2_265 = L2_265.cookies
  L2_265 = L2_265.get
  L3_266 = "TeamF1Login"
  L2_265 = L2_265(L3_266)
  L3_266 = captivePortalLib
  L3_266 = L3_266.extensionGet
  L4_267 = A0_263["ImageDetails.name"]
  L4_267 = L4_267.filename
  L3_266 = L3_266(L4_267)
  L4_267 = "image"
  L5_268 = L1_264
  L6_269 = "."
  L7_270 = L3_266
  L4_267 = L4_267 .. L5_268 .. L6_269 .. L7_270
  L5_268 = A0_263["ImageDetails.name"]
  L5_268 = L5_268.filesize
  L6_269 = tonumber
  L7_270 = L5_268
  L6_269 = L6_269(L7_270)
  if L6_269 > 50000 then
    L6_269 = os
    L6_269 = L6_269.execute
    L7_270 = "/bin/rm -fr"
    L8_271 = " "
    L7_270 = L7_270 .. L8_271 .. "/tmp/" .. L2_265
    L6_269(L7_270)
    L6_269 = "ERROR"
    L7_270 = "10799"
    return L6_269, L7_270
  end
  L6_269 = db
  L6_269 = L6_269.getAttribute
  L7_270 = "ImageDetails"
  L8_271 = "_ROWID_"
  L6_269 = L6_269(L7_270, L8_271, L1_264, "name")
  L7_270 = os
  L7_270 = L7_270.execute
  L8_271 = "/bin/rm -rf"
  L8_271 = L8_271 .. " " .. "/flash/tmp/capPort/" .. L6_269
  L7_270(L8_271)
  L7_270 = nil
  L8_271 = db
  L8_271 = L8_271.beginTransaction
  L8_271()
  L8_271 = os
  L8_271 = L8_271.execute
  L8_271 = L8_271("/bin/mv" .. " " .. "/tmp/" .. L2_265 .. " /flash/tmp/capPort/" .. L4_267)
  L7_270 = L8_271
  L8_271 = {}
  L8_271["ImageDetails.name"] = L4_267
  L8_271["ImageDetails.value"] = "1"
  L7_270 = L7_270 and db.update("ImageDetails", L8_271, L1_264)
  if L7_270 then
    db.commitTransaction(true)
    return "OK", "11485"
  else
    db.rollback()
    return "ERROR", "11481"
  end
end
function captivePortal.cpProfileConfig(A0_272, A1_273, A2_274)
  local L3_275
  L3_275 = ACCESS_LEVEL
  if L3_275 ~= 0 then
    L3_275 = "ACCESS_DENIED"
    return L3_275, "10187"
  end
  L3_275 = util
  L3_275 = L3_275.appendDebugOut
  L3_275(util.tableToStringRec(A0_272))
  L3_275 = db
  L3_275 = L3_275.beginTransaction
  L3_275()
  L3_275 = nil
  if A2_274 == "add" then
    A0_272["CaptivePortalPageDetails.enable"] = "0"
    L3_275 = db.insert("CaptivePortalPageDetails", A0_272)
  end
  if A2_274 == "edit" then
    L3_275 = db.update("CaptivePortalPageDetails", A0_272, A1_273)
  end
  if L3_275 then
    db.commitTransaction(true)
    return "OK", "11485"
  else
    db.rollback()
    return "ERROR", "11481"
  end
end
function captivePortal.deleteProfiles(A0_276)
  local L1_277, L2_278, L3_279, L4_280, L5_281, L6_282, L7_283
  L1_277 = db
  L1_277 = L1_277.beginTransaction
  L1_277()
  L1_277 = nil
  if A0_276 ~= nil then
    for L5_281, L6_282 in L2_278(L3_279) do
      L7_283 = db
      L7_283 = L7_283.getAttribute
      L7_283 = L7_283("CaptivePortalPageDetails", "_ROWID_", L6_282, "profileId")
      if db.getAttribute("CaptivePortalVlan", "profileId", L7_283, "vlanId") ~= nil then
        db.rollback()
        return "ERROR", "20497"
      end
      L1_277 = db.deleteRow("CaptivePortalPageDetails", "_ROWID_", L6_282)
      if not L1_277 then
        break
      end
    end
  end
  if L1_277 then
    L2_278(L3_279)
    return L2_278, L3_279
  else
    L2_278()
    return L2_278, L3_279
  end
end
function captivePortal.modifyProfiles(A0_284, A1_285)
  local L2_286
  L2_286 = ACCESS_LEVEL
  if L2_286 ~= 0 then
    L2_286 = "ACCESS_DENIED"
    return L2_286, "10187"
  end
  L2_286 = util
  L2_286 = L2_286.appendDebugOut
  L2_286(util.tableToStringRec(A0_284))
  L2_286 = db
  L2_286 = L2_286.beginTransaction
  L2_286()
  L2_286 = nil
  if A1_285 == "enable" then
    L2_286 = db.setAttribute("CaptivePortalPageDetails", "enable", "1", "enable", "0")
    L2_286 = L2_286 and db.setAttribute("CaptivePortalPageDetails", "_ROWID_", A0_284["1"], "enable", "1")
  end
  if L2_286 then
    db.commitTransaction(true)
    return "OK", "11485"
  else
    db.rollback()
    return "ERROR", "11481"
  end
end
function captivePortal.isCaptivePortalUser(A0_287)
  local L1_288, L2_289, L3_290
  L1_288 = db
  L1_288 = L1_288.getAttribute
  L2_289 = "Users"
  L3_290 = "UserName"
  L1_288 = L1_288(L2_289, L3_290, A0_287, "GroupId")
  L2_289 = db
  L2_289 = L2_289.getRow
  L3_290 = "UserGroups"
  L2_289 = L2_289(L3_290, "GroupId", L1_288)
  L3_290 = util
  L3_290 = L3_290.split
  L3_290 = L3_290(L2_289["UserGroups.Capabilities"], ",")
  for _FORV_7_, _FORV_8_ in pairs(L3_290) do
    if _FORV_8_ == "10" then
      return true
    end
  end
  return false
end
function captivePortal.authMode(A0_291)
  if ACCESS_LEVEL ~= 0 then
    return "ACCESS_DENIED", "10187"
  end
  db.beginTransaction()
  if db.update("captivePortal", A0_291, 1) then
    db.commitTransaction(true)
    return "OK", "11485"
  else
    db.rollback()
    return "ERROR", "11481"
  end
end
function captivePortal.uploadBackgroundImg(A0_292)
  local L1_293, L2_294, L3_295, L4_296, L5_297, L6_298, L7_299, L8_300, L9_301
  L1_293 = {
    L2_294,
    L3_295,
    L4_296,
    L5_297
  }
  L2_294 = "10087"
  L3_295 = "10799"
  L4_296 = "11481"
  L5_297 = "11486"
  L2_294 = ACCESS_LEVEL
  if L2_294 ~= 0 then
    L2_294 = "10187"
    return L2_294
  end
  L2_294 = A0_292["pageBackgroundImage.RowID"]
  L3_295 = cgilua
  L3_295 = L3_295.cookies
  L3_295 = L3_295.get
  L4_296 = "TeamF1Login"
  L3_295 = L3_295(L4_296)
  L4_296 = captivePortalLib
  L4_296 = L4_296.extensionGet
  L5_297 = A0_292["pageBackgroundImage.imageName"]
  L5_297 = L5_297.filename
  L4_296 = L4_296(L5_297)
  L5_297 = "pageBackgroundImage"
  L6_298 = L2_294
  L7_299 = "."
  L8_300 = L4_296
  L5_297 = L5_297 .. L6_298 .. L7_299 .. L8_300
  L6_298 = A0_292["pageBackgroundImage.imageName"]
  L6_298 = L6_298.filesize
  L7_299 = tonumber
  L8_300 = L6_298
  L7_299 = L7_299(L8_300)
  if L7_299 > 50000 then
    L7_299 = os
    L7_299 = L7_299.execute
    L8_300 = "/bin/rm -fr"
    L9_301 = " "
    L8_300 = L8_300 .. L9_301 .. "/tmp/" .. L3_295
    L7_299(L8_300)
    L7_299 = "ERROR"
    L8_300 = "10799"
    return L7_299, L8_300
  end
  L7_299 = db
  L7_299 = L7_299.getAttribute
  L8_300 = "pageBackgroundImage"
  L9_301 = "_ROWID_"
  L7_299 = L7_299(L8_300, L9_301, L2_294, "imageName")
  L8_300 = os
  L8_300 = L8_300.execute
  L9_301 = "/bin/rm -rf"
  L9_301 = L9_301 .. " " .. "/flash/tmp/capPort/" .. L7_299
  L8_300(L9_301)
  L8_300 = nil
  L9_301 = db
  L9_301 = L9_301.beginTransaction
  L9_301()
  L9_301 = os
  L9_301 = L9_301.execute
  L9_301 = L9_301("/bin/mv" .. " " .. "/tmp/" .. L3_295 .. " /flash/tmp/capPort/" .. L5_297)
  L8_300 = L9_301
  L9_301 = {}
  L9_301["pageBackgroundImage.imageName"] = L5_297
  L9_301["pageBackgroundImage.enableStatus"] = "1"
  L8_300 = L8_300 and db.update("pageBackgroundImage", L9_301, L2_294)
  if L8_300 then
    db.commitTransaction(true)
    return "OK", "11486"
  else
    db.rollback()
    return "ERROR", "11481"
  end
end
function captivePortal.blockMACConfig(A0_302, A1_303, A2_304)
  local L3_305, L4_306
  L3_305 = ACCESS_LEVEL
  if L3_305 ~= 0 then
    L3_305 = "ACCESS_DENIED"
    L4_306 = "10187"
    return L3_305, L4_306
  end
  L3_305 = false
  if A1_303 == "ADD" then
    L4_306 = db
    L4_306 = L4_306.insert
    L4_306 = L4_306("blockMAC", A0_302)
    L3_305 = L4_306
  elseif A1_303 == "UPDATE" then
    L4_306 = db
    L4_306 = L4_306.update
    L4_306 = L4_306("blockMAC", A0_302, A2_304)
    L3_305 = L4_306
  elseif A1_303 == "DELETE" then
    L4_306 = {}
    L4_306["blockMAC._ROWID_"] = A2_304
    L3_305 = db.delete("blockMAC", L4_306)
  else
    L3_305 = false
  end
  if L3_305 then
    L4_306 = "OK"
    return L4_306, "11485"
  else
    L4_306 = "ERROR"
    return L4_306, "11481"
  end
end
function captivePortal.blockMAC(A0_307, A1_308)
  local L2_309, L3_310, L4_311, L5_312, L6_313, L7_314, L8_315, L9_316
  L2_309 = {}
  L3_310 = nil
  L4_311 = {}
  if A0_307 ~= nil then
    for L8_315, L9_316 in L5_312(L6_313) do
      if A1_308 == "ADD" then
        L4_311["blockMAC.sourceMACAddress"] = db.getAttribute("CaptivePortalSession", "_ROWID_", L9_316, "macAddr")
        L4_311["blockMAC.description"] = "Blocked"
        L3_310, status = captivePortal.blockMACConfig(L4_311, "ADD", "-1")
      elseif A1_308 == "DELETE" then
        L3_310, status = captivePortal.blockMACConfig(L4_311, "DELETE", L9_316)
      end
      if not L3_310 then
        break
      end
    end
  end
  if L3_310 then
    return L5_312, L6_313
  else
    return L5_312, L6_313
  end
end
function captivePortal.getBlockMACProfiles()
  local L0_317
  L0_317 = {}
  L0_317 = db.getTable("blockMAC")
  return L0_317
end
function captivePortal.getMacDetails(A0_318)
  local L1_319
  L1_319 = {}
  L1_319 = db.getRow("blockMAC", "_ROWID_", A0_318)
  return L1_319
end
function captivePortal.loginPolsVer(A0_320, A1_321, A2_322)
  local L3_323, L4_324, L5_325, L6_326, L7_327
  L3_323 = "40,41"
  L4_324 = db
  L4_324 = L4_324.getString
  L5_325 = L3_323
  L4_324 = L4_324(L5_325)
  L3_323 = L4_324
  L4_324 = db
  L4_324 = L4_324.getAttribute
  L5_325 = A0_320
  L6_326 = "UserName"
  L7_327 = A2_322
  L4_324 = L4_324(L5_325, L6_326, L7_327, "GroupId")
  L5_325 = db
  L5_325 = L5_325.getRow
  L6_326 = "GroupAccessControl"
  L7_327 = "GroupId"
  L5_325 = L5_325(L6_326, L7_327, L4_324)
  L6_326, L7_327 = nil, nil
  if L5_325 ~= nil and not login.loginBrowserPoliciesVerify(L5_325, A1_321) then
    L6_326 = 3
    L7_327 = L3_323["41"] or "i18nHTMLMissing"
    return L6_326, L7_327
  end
  L6_326 = 0
  L7_327 = L3_323["40"] or "i18nHTMLMissing"
  return L6_326, L7_327
end
function captivePortal.CPSessionCheck(A0_328)
  local L1_329, L2_330, L3_331, L4_332
  L1_329 = "13236"
  L2_330 = db
  L2_330 = L2_330.getString
  L3_331 = L1_329
  L2_330 = L2_330(L3_331)
  L1_329 = L2_330
  L2_330 = "UserName = '"
  L3_331 = A0_328
  L4_332 = "'"
  L2_330 = L2_330 .. L3_331 .. L4_332
  L3_331 = db
  L3_331 = L3_331.getRowWhere
  L4_332 = "CaptivePortalSession"
  L3_331 = L3_331(L4_332, L2_330)
  if L3_331 ~= nil then
    L4_332 = 1
    return L4_332, L1_329["13236"] or "i18nHTMLMissing"
  end
end
function captivePortal.cpTempUserProfileConfig(A0_333, A1_334, A2_335)
  local L3_336, L4_337, L5_338, L6_339, L7_340, L8_341, L9_342, L10_343, L11_344, L12_345, L13_346, L14_347, L15_348, L16_349, L17_350, L18_351, L19_352
  L3_336 = ACCESS_LEVEL
  if L3_336 ~= 0 then
    L3_336 = "ACCESS_DENIED"
    return L3_336, L4_337
  end
  L3_336 = util
  L3_336 = L3_336.appendDebugOut
  L19_352 = L4_337(L5_338)
  L3_336(L4_337, L5_338, L6_339, L7_340, L8_341, L9_342, L10_343, L11_344, L12_345, L13_346, L14_347, L15_348, L16_349, L17_350, L18_351, L19_352, L4_337(L5_338))
  L3_336 = db
  L3_336 = L3_336.execute
  L3_336(L4_337)
  L3_336 = db
  L3_336 = L3_336.beginTransaction
  L3_336()
  L3_336 = nil
  if A1_334 == "add" then
    L3_336 = L4_337
  end
  if A1_334 == "edit" then
    L7_340 = RowId
    L3_336 = L4_337
  end
  if A1_334 == "delete" then
    for L7_340, L8_341 in L4_337(L5_338) do
      L9_342 = "UserName IN (select UserName from tempusers where ProfileId=(select profileId from tempCPUserProfiles where _ROWID_="
      L10_343 = L8_341
      L11_344 = "))"
      L9_342 = L9_342 .. L10_343 .. L11_344
      L10_343 = db
      L10_343 = L10_343.getRowsWhere
      L11_344 = "CaptivePortalSession"
      L12_345 = L9_342
      L10_343 = L10_343(L11_344, L12_345)
      L11_344 = #L10_343
      if L11_344 > 0 then
        L11_344 = db
        L11_344 = L11_344.rollback
        L11_344()
        L11_344 = "ERROR"
        L12_345 = "20498"
        return L11_344, L12_345
      else
        L11_344 = db
        L11_344 = L11_344.getAttribute
        L12_345 = "tempCPUserProfiles"
        L13_346 = "_ROWID_"
        L11_344 = L11_344(L12_345, L13_346, L14_347, L15_348)
        L12_345 = "ProfileId="
        L13_346 = L11_344
        L12_345 = L12_345 .. L13_346
        L13_346 = db
        L13_346 = L13_346.getRows
        L13_346 = L13_346(L14_347, L15_348, L16_349)
        if L14_347 > 0 then
          for L17_350, L18_351 in L14_347(L15_348) do
            L19_352 = "UserName='"
            L19_352 = L19_352 .. L18_351["tempusers.UserName"] .. "'"
            db.deleteRowWhere("CPAccInfoIP", L19_352)
            db.deleteRowWhere("CPAccInfoUserAccount", L19_352)
            db.deleteRowWhere("CPAccConf", L19_352)
            db.deleteRowWhere("CPAccUserAccountExtend", L19_352)
          end
          L14_347(L15_348, L16_349)
        end
      end
    end
    L3_336 = L4_337
  end
  if L3_336 then
    L4_337(L5_338)
    L4_337(L5_338)
    return L4_337, L5_338
  else
    L4_337()
    L4_337(L5_338)
    return L4_337, L5_338
  end
end
function captivePortal.extendSession(A0_353, A1_354)
  local L2_355, L3_356, L4_357, L5_358
  L2_355 = ACCESS_LEVEL
  if L2_355 ~= 2 then
    L2_355 = ACCESS_LEVEL
    if L2_355 == 0 then
      L2_355 = ADMIN_AND_FRONTDESK
      if L2_355 == 0 then
        L2_355 = "ACCESS_DENIED"
        L3_356 = "20500"
        return L2_355, L3_356
      end
    end
  end
  L2_355 = db
  L2_355 = L2_355.beginTransaction
  L2_355()
  L2_355 = nil
  L3_356 = A0_353["tempUsers.MaxUsageTrafficValue"]
  if L3_356 ~= nil then
    L3_356 = A0_353["tempUsers.MaxUsageTrafficType"]
    if L3_356 == "2" then
      L3_356 = A0_353["tempUsers.MaxUsageTrafficValue"]
      A0_353["tempUsers.MaxUsageTrafficInfo"] = L3_356
    else
      L3_356 = A0_353["tempUsers.MaxUsageTrafficType"]
      if L3_356 == "3" then
        L3_356 = A0_353["tempUsers.MaxUsageTrafficValue"]
        L3_356 = L3_356 * 1024
        A0_353["tempUsers.MaxUsageTrafficInfo"] = L3_356
      end
    end
  end
  L3_356 = A0_353["tempUsers.MaxUsageTimeValue"]
  if L3_356 ~= nil then
    L3_356 = A0_353["tempUsers.MaxUsageTimeType"]
    if L3_356 == "0" then
      L3_356 = A0_353["tempUsers.MaxUsageTimeValue"]
      L3_356 = L3_356 * 3600
      A0_353["tempUsers.MaxUsageTimeInfo"] = L3_356
    else
      L3_356 = A0_353["tempUsers.MaxUsageTimeType"]
      if L3_356 == "1" then
        L3_356 = A0_353["tempUsers.MaxUsageTimeValue"]
        L3_356 = L3_356 * 3600
        L3_356 = L3_356 * 24
        A0_353["tempUsers.MaxUsageTimeInfo"] = L3_356
      end
    end
  end
  L3_356 = A0_353["tempUsers.ExpirationDate"]
  if L3_356 ~= nil then
    L3_356 = captivePortal
    L3_356 = L3_356.dateToDB
    L4_357 = A0_353["tempUsers.ExpirationDate"]
    L3_356 = L3_356(L4_357)
    A0_353["tempUsers.ExpirationDate"] = L3_356
  end
  L3_356 = captivePortal
  L3_356 = L3_356.tempUserConfig
  L4_357 = A0_353
  L5_358 = A1_354
  L3_356 = L3_356(L4_357, L5_358)
  L2_355 = L3_356
  if L2_355 then
    L3_356 = accountExtendWrapper
    L4_357 = A0_353
    L3_356 = L3_356(L4_357)
    L4_357 = cpAccountConfWrapper
    L5_358 = A0_353
    L4_357 = L4_357(L5_358)
    L5_358 = "UserName='"
    L5_358 = L5_358 .. A0_353["tempUsers.UserName"] .. "'"
    if A0_353["tempUsers.ExpirationDate"] ~= nil then
      L2_355 = db.setAttribute("CPAccConf", "UserName", A0_353["tempUsers.UserName"], "EndTime", A0_353["tempUsers.ExpirationDate"])
    end
    if L2_355 and db.getRowWhere("CPAccConf", L5_358) then
      L2_355 = db.update("CPAccConf", L4_357, db.getRowWhere("CPAccConf", L5_358)["CPAccConf._ROWID_"])
    end
    if L2_355 and db.getRowWhere("CPAccUserAccountExtend", L5_358) then
      L2_355 = db.update("CPAccUserAccountExtend", L3_356, db.getRowWhere("CPAccUserAccountExtend", L5_358)["CPAccUserAccountExtend._ROWID_"])
    else
      L2_355 = db.insert("CPAccUserAccountExtend", L3_356)
    end
  end
  if L2_355 then
    L3_356 = db
    L3_356 = L3_356.commitTransaction
    L4_357 = true
    L3_356(L4_357)
    L3_356 = "OK"
    return L3_356
  else
    L3_356 = db
    L3_356 = L3_356.rollback
    L3_356()
    L3_356 = "ERROR"
    return L3_356
  end
end
function cpAccountConfWrapper(A0_359)
  local L1_360
  L1_360 = {}
  MaxUsageTimeInfo = db.getAttribute("tempUsers", "Username", A0_359["tempUsers.UserName"], "MaxUsageTimeInfo")
  MaxUsageTrafficInfo = db.getAttribute("tempUsers", "Username", A0_359["tempUsers.UserName"], "MaxUsageTrafficInfo")
  L1_360["CPAccConf.UserName"] = A0_359["tempUsers.UserName"]
  L1_360["CPAccConf.MaxUsageTime"] = A0_359["tempUsers.MaxUsageTimeInfo"] or MaxUsageTimeInfo
  L1_360["CPAccConf.MaxUsageTraffic"] = A0_359["tempUsers.MaxUsageTrafficInfo"] or MaxUsageTrafficInfo
  L1_360["CPAccConf.EndTime"] = A0_359["tempUsers.ExpirationDate"] or "0"
  return L1_360
end
function accountExtendWrapper(A0_361)
  local L1_362
  L1_362 = {}
  MaxUsageTimeInfo = db.getAttribute("tempUsers", "Username", A0_361["tempUsers.UserName"], "MaxUsageTimeInfo")
  MaxUsageTrafficInfo = db.getAttribute("tempUsers", "Username", A0_361["tempUsers.UserName"], "MaxUsageTrafficInfo")
  L1_362["CPAccUserAccountExtend.UserName"] = A0_361["tempUsers.UserName"]
  L1_362["CPAccUserAccountExtend.extendTimeUsage"] = A0_361["tempUsers.MaxUsageTimeInfo"] or MaxUsageTimeInfo
  L1_362["CPAccUserAccountExtend.extendTrafficUsage"] = A0_361["tempUsers.MaxUsageTrafficInfo"] or MaxUsageTrafficInfo
  L1_362["CPAccUserAccountExtend.extendEndTime"] = A0_361["tempUsers.ExpirationDate"] or "0"
  return L1_362
end
function captivePortal.tempUserConfig(A0_363, A1_364, A2_365)
  local L3_366
  L3_366 = false
  L3_366 = db.update("tempUsers", A0_363, A1_364)
  if L3_366 then
    return "OK"
  else
    return "ERROR"
  end
end
function captivePortal.gentempUser(A0_367, A1_368)
  local L2_369, L3_370, L4_371, L5_372, L6_373, L7_374, L8_375, L9_376, L10_377, L11_378, L12_379, L13_380, L14_381
  L2_369 = ACCESS_LEVEL
  if L2_369 ~= 2 then
    L2_369 = ACCESS_LEVEL
    if L2_369 == 0 then
      L2_369 = ADMIN_AND_FRONTDESK
      if L2_369 == 0 then
        L2_369 = "ACCESS_DENIED"
        L3_370 = "20500"
        return L2_369, L3_370
      end
    end
  end
  L2_369 = ""
  L3_370 = {}
  CPAccTableUser = L3_370
  L3_370 = "CPAccInfoUserAccount"
  L4_371 = false
  L5_372 = db
  L5_372 = L5_372.execute
  L6_373 = "ATTACH '/tmp/cpAcc.db' as cpAccDB"
  L5_372(L6_373)
  L5_372 = "update tempUsers set Flag=0"
  L6_373 = db
  L6_373 = L6_373.execute
  L7_374 = L5_372
  L6_373 = L6_373(L7_374)
  L4_371 = L6_373
  if L4_371 then
    L6_373 = tempUsertableValidations
    L7_374 = A0_367
    L6_373 = L6_373(L7_374, L8_375)
    if L6_373 then
      L7_374 = A0_367["tempUsers.BatchGenValue"]
      L7_374 = L7_374 or 1
      for L11_378 = 1, L7_374 do
        L12_379 = captivePortalLib
        L12_379 = L12_379.genCreds
        L13_380 = L12_379()
        if L12_379 and L13_380 then
          L6_373["tempUsers.UserName"] = L12_379
          L6_373["tempUsers.Password"] = L13_380
          L6_373["tempUsers.Flag"] = "1"
          L14_381 = db
          L14_381 = L14_381.getAttribute
          L14_381 = L14_381("CPAccInfoUserAccount", "UserName", L12_379, "_ROWID_")
          L2_369 = L14_381
          if L2_369 == nil or L2_369 == "" then
            L14_381 = CPAccTableUser
            L14_381["CPAccInfoUserAccount.UserName"] = L12_379
            L14_381 = CPAccTableUser
            L14_381["CPAccInfoUserAccount.currentTimeUsage"] = "0"
            L14_381 = CPAccTableUser
            L14_381["CPAccInfoUserAccount.currentTrafficUsage"] = "0"
            L14_381 = db
            L14_381 = L14_381.insert
            L14_381 = L14_381(L3_370, CPAccTableUser)
            L4_371 = L14_381
          end
          if L4_371 then
            L14_381 = db
            L14_381 = L14_381.beginTransaction
            L14_381()
            L14_381 = db
            L14_381 = L14_381.insert
            L14_381 = L14_381("tempUsers", L6_373)
            L4_371 = L14_381
            if L4_371 then
              L14_381 = accountTableWrapper
              L14_381 = L14_381(L6_373)
              L4_371 = db.insert("CPAccConf", L14_381)
            end
            if L4_371 then
              L14_381 = db
              L14_381 = L14_381.commitTransaction
              L14_381(true)
            else
              L14_381 = db
              L14_381 = L14_381.rollback
              L14_381()
            end
          end
        else
          L4_371 = false
        end
      end
    end
  end
  if L4_371 then
    L6_373 = db
    L6_373 = L6_373.execute
    L7_374 = "DETACH cpAccDB"
    L6_373(L7_374)
    L6_373 = "OK"
    L7_374 = "11485"
    return L6_373, L7_374
  else
    L6_373 = db
    L6_373 = L6_373.execute
    L7_374 = "DETACH cpAccDB"
    L6_373(L7_374)
    L6_373 = "ERROR"
    L7_374 = "11481"
    return L6_373, L7_374
  end
end
function tempUsertableValidations(A0_382, A1_383)
  local L2_384, L3_385, L4_386, L5_387
  L2_384 = {}
  L2_384["tempUsers.ProfileId"] = A1_383
  L2_384["tempUsers.CstmAccName"] = " "
  L2_384["tempUsers.IdleTimeout"] = "0"
  L2_384["tempUsers.Limitchecks"] = "0"
  L2_384["tempUsers.LoginCheck"] = "0"
  L2_384["tempUsers.BeginDate"] = "0"
  L2_384["tempUsers.ExpirationDate"] = "0"
  L2_384["tempUsers.MaxUsageTimeInfo"] = "0"
  L2_384["tempUsers.MaxUsageTrafficInfo"] = "0"
  L3_385 = false
  L4_386 = db
  L4_386 = L4_386.getRow
  L5_387 = "tempCPUserProfiles"
  L4_386 = L4_386(L5_387, "ProfileId", A1_383)
  if L4_386 then
    L5_387 = L4_386["tempCPUserProfiles.IdleTimeout"]
    L5_387 = L5_387 * 60
    L2_384["tempUsers.IdleTimeout"] = L5_387
    L5_387 = A0_382["tempUsers.cstmAccName"]
    L2_384["tempUsers.CstmAccName"] = L5_387
    L5_387 = db
    L5_387 = L5_387.getAttribute
    L5_387 = L5_387("UserGroups", "GroupName", "Temp-CP", "GroupId")
    L2_384["tempUsers.GroupId"] = L5_387
    L5_387 = L4_386["tempCPUserProfiles.ValidDurationCheck"]
    if L5_387 == "1" then
      L5_387 = captivePortal
      L5_387 = L5_387.dateToDB
      L5_387 = L5_387(A0_382["tempUsers.ExpirationDate"])
      L2_384["tempUsers.ExpirationDate"] = L5_387
      L5_387 = L4_386["tempCPUserProfiles.ModifyDuration"]
      if L5_387 == "1" then
        L5_387 = L4_386["tempCPUserProfiles.DurationType"]
        if L5_387 ~= "2" then
          L5_387 = nil
          if A0_382["tempCPUserProfiles.StartTimeType"] == "0" then
            L5_387 = A0_382["tempCPUserProfiles.StartTimeValue"] * 60 * 60
          elseif A0_382["tempCPUserProfiles.StartTimeType"] == "1" then
            L5_387 = A0_382["tempCPUserProfiles.StartTimeValue"] * 60 * 60 * 24
          end
          if L4_386["tempCPUserProfiles.DurationType"] == "0" then
            L2_384["tempUsers.BeginDate"] = util.date().year .. "/" .. util.date().month .. "/" .. util.date().date .. "@" .. util.date().hours .. ":" .. util.date().minutes
          elseif L4_386["tempCPUserProfiles.DurationType"] == "1" then
            L2_384["tempUsers.LoginCheck"] = L5_387
          end
        else
          L5_387 = L4_386["tempCPUserProfiles.DurationType"]
          if L5_387 == "2" then
            L5_387 = captivePortal
            L5_387 = L5_387.dateToDB
            L5_387 = L5_387(A0_382["tempCPUserProfiles.BeginDate"])
            L2_384["tempUsers.BeginDate"] = L5_387
          end
        end
      else
        L5_387 = L4_386["tempCPUserProfiles.ModifyDuration"]
        if L5_387 == "0" then
          L5_387 = L4_386["tempCPUserProfiles.DurationType"]
          if L5_387 ~= "2" then
            L5_387 = nil
            if L4_386["tempCPUserProfiles.StartTimeType"] == "0" then
              L5_387 = L4_386["tempCPUserProfiles.StartTimeValue"] * 60 * 60
            elseif L4_386["tempCPUserProfiles.StartTimeType"] == "1" then
              L5_387 = L4_386["tempCPUserProfiles.StartTimeValue"] * 60 * 60 * 24
            end
            if L4_386["tempCPUserProfiles.DurationType"] == "0" then
              L2_384["tempUsers.BeginDate"] = L4_386["tempCPUserProfiles.BeginDate"]
            elseif L4_386["tempCPUserProfiles.DurationType"] == "1" then
              L2_384["tempUsers.LoginCheck"] = L5_387
            end
          else
            L5_387 = L4_386["tempCPUserProfiles.DurationType"]
            if L5_387 == "2" then
              L5_387 = L4_386["tempCPUserProfiles.BeginDate"]
              L2_384["tempUsers.BeginDate"] = L5_387
            end
          end
        end
      end
    end
    L5_387 = L4_386["tempCPUserProfiles.MaxUsageTimeCheck"]
    if L5_387 == "1" then
      L5_387 = L4_386["tempCPUserProfiles.ModifyUsage"]
      if L5_387 == "1" then
        L5_387 = A0_382["tempCPUserProfiles.MaxUsageTimeType"]
        if L5_387 == "0" then
          L5_387 = A0_382["tempCPUserProfiles.MaxUsageTimeValue"]
          L5_387 = L5_387 * 60
          L5_387 = L5_387 * 60
          L2_384["tempUsers.MaxUsageTimeInfo"] = L5_387
        else
          L5_387 = A0_382["tempCPUserProfiles.MaxUsageTimeType"]
          if L5_387 == "1" then
            L5_387 = A0_382["tempCPUserProfiles.MaxUsageTimeValue"]
            L5_387 = L5_387 * 60
            L5_387 = L5_387 * 60
            L5_387 = L5_387 * 24
            L2_384["tempUsers.MaxUsageTimeInfo"] = L5_387
          end
        end
      else
        L5_387 = L4_386["tempCPUserProfiles.ModifyUsage"]
        if L5_387 == "0" then
          L5_387 = L4_386["tempCPUserProfiles.MaxUsageTimeType"]
          if L5_387 == "0" then
            L5_387 = L4_386["tempCPUserProfiles.MaxUsageTimeValue"]
            L5_387 = L5_387 * 60
            L5_387 = L5_387 * 60
            L2_384["tempUsers.MaxUsageTimeInfo"] = L5_387
          else
            L5_387 = L4_386["tempCPUserProfiles.MaxUsageTimeType"]
            if L5_387 == "1" then
              L5_387 = L4_386["tempCPUserProfiles.MaxUsageTimeValue"]
              L5_387 = L5_387 * 60
              L5_387 = L5_387 * 60
              L5_387 = L5_387 * 24
              L2_384["tempUsers.MaxUsageTimeInfo"] = L5_387
            end
          end
        end
      end
    end
    L5_387 = L4_386["tempCPUserProfiles.MaxUsageTrafficCheck"]
    if L5_387 == "1" then
      L5_387 = L4_386["tempCPUserProfiles.ModifyUsage"]
      if L5_387 == "1" then
        L5_387 = A0_382["tempCPUserProfiles.MaxUsageTrafficType"]
        if L5_387 == "2" then
          L5_387 = A0_382["tempCPUserProfiles.MaxUsageTrafficValue"]
          L2_384["tempUsers.MaxUsageTrafficInfo"] = L5_387
        else
          L5_387 = A0_382["tempCPUserProfiles.MaxUsageTrafficType"]
          if L5_387 == "3" then
            L5_387 = A0_382["tempCPUserProfiles.MaxUsageTrafficValue"]
            L5_387 = L5_387 * 1024
            L2_384["tempUsers.MaxUsageTrafficInfo"] = L5_387
          end
        end
      else
        L5_387 = L4_386["tempCPUserProfiles.ModifyUsage"]
        if L5_387 == "0" then
          L5_387 = L4_386["tempCPUserProfiles.MaxUsageTrafficType"]
          if L5_387 == "2" then
            L5_387 = L4_386["tempCPUserProfiles.MaxUsageTrafficValue"]
            L2_384["tempUsers.MaxUsageTrafficInfo"] = L5_387
          else
            L5_387 = L4_386["tempCPUserProfiles.MaxUsageTrafficType"]
            if L5_387 == "3" then
              L5_387 = L4_386["tempCPUserProfiles.MaxUsageTrafficValue"]
              L5_387 = L5_387 * 1024
              L2_384["tempUsers.MaxUsageTrafficInfo"] = L5_387
            end
          end
        end
      end
    end
    return L2_384
  else
    L5_387 = nil
    return L5_387
  end
end
function accountTableWrapper(A0_388)
  local L1_389
  L1_389 = {}
  L1_389["CPAccConf.UserName"] = A0_388["tempUsers.UserName"]
  L1_389["CPAccConf.BeginEndTimeCheck"] = db.getAttribute("tempCPUserProfiles", "ProfileId", A0_388["tempUsers.ProfileId"], "ValidDurationCheck")
  L1_389["CPAccConf.SessionIdealTimeout"] = db.getAttribute("tempCPUserProfiles", "ProfileId", A0_388["tempUsers.ProfileId"], "IdleTimeout") * 60
  L1_389["CPAccConf.StartTime"] = A0_388["tempUsers.BeginDate"]
  L1_389["CPAccConf.EndTime"] = A0_388["tempUsers.ExpirationDate"]
  L1_389["CPAccConf.LoginCheck"] = A0_388["tempUsers.LoginCheck"]
  L1_389["CPAccConf.MaxUsageTime"] = A0_388["tempUsers.MaxUsageTimeInfo"]
  L1_389["CPAccConf.MaxUsageTraffic"] = A0_388["tempUsers.MaxUsageTrafficInfo"]
  return L1_389
end
function captivePortal.getBillingProfiles()
  local L0_390
  L0_390 = {}
  L0_390 = db.getTable("tempCPUserProfiles")
  return L0_390
end
function captivePortal.getBillingProfileDetails(A0_391)
  local L1_392
  L1_392 = {}
  L1_392 = db.getRow("tempCPUserProfiles", "rowid", A0_391)
  if L1_392 and L1_392["tempCPUserProfiles.ValidDurationCheck"] == "1" then
    if L1_392["tempCPUserProfiles.DurationType"] == "0" then
      L1_392["tempCPUserProfiles.StartCreatedType"] = L1_392["tempCPUserProfiles.StartTimeType"]
      L1_392["tempCPUserProfiles.StartCreatedTime"] = L1_392["tempCPUserProfiles.StartTimeValue"]
      L1_392["tempCPUserProfiles.BeginDate"] = ""
    elseif L1_392["tempCPUserProfiles.DurationType"] == "1" then
      L1_392["tempCPUserProfiles.StartLoginType"] = L1_392["tempCPUserProfiles.StartTimeType"]
      L1_392["tempCPUserProfiles.StartLoginTime"] = L1_392["tempCPUserProfiles.StartTimeValue"]
      L1_392["tempCPUserProfiles.BeginDate"] = ""
    else
      L1_392["tempCPUserProfiles.BeginDate"] = captivePortal.dateToGUI(L1_392["tempCPUserProfiles.BeginDate"])
    end
  end
  return L1_392
end
function captivePortal.bilingProfileConfig(A0_393, A1_394, A2_395)
  local L3_396
  L3_396 = ACCESS_LEVEL
  if L3_396 ~= 0 then
    L3_396 = "ACCESS_DENIED"
    return L3_396, "10187"
  end
  L3_396 = db
  L3_396 = L3_396.beginTransaction
  L3_396()
  L3_396 = nil
  if A0_393["tempCPUserProfiles.AlertValue"] == "0" then
    A0_393["tempCPUserProfiles.ShowAlert"] = "0"
  else
    A0_393["tempCPUserProfiles.ShowAlert"] = "1"
    A0_393["tempCPUserProfiles.AlertType"] = A0_393["tempCPUserProfiles.AlertType"]
    A0_393["tempCPUserProfiles.AlertValue"] = A0_393["tempCPUserProfiles.AlertValue"]
  end
  if A0_393["tempCPUserProfiles.ValidDurationCheck"] == "1" then
    A0_393["tempCPUserProfiles.StartTimeType"] = A0_393["tempCPUserProfiles.StartCreatedType"] or A0_393["tempCPUserProfiles.StartLoginType"] or ""
    A0_393["tempCPUserProfiles.StartTimeValue"] = A0_393["tempCPUserProfiles.StartCreatedTime"] or A0_393["tempCPUserProfiles.StartLoginTime"] or ""
    if A0_393["tempCPUserProfiles.DurationType"] == "2" then
      A0_393["tempCPUserProfiles.BeginDate"] = captivePortal.dateToDB(A0_393["tempCPUserProfiles.BeginDate"])
    else
      A0_393["tempCPUserProfiles.BeginDate"] = util.date().year .. "/" .. util.date().month .. "/" .. util.date().date .. "@" .. util.date().hours .. ":" .. util.date().minutes
    end
  end
  if A2_395 == "add" then
    L3_396 = db.insert("tempCPUserProfiles", A0_393)
  end
  if A2_395 == "edit" then
    L3_396 = db.update("tempCPUserProfiles", A0_393, A1_394)
  end
  if L3_396 then
    db.commitTransaction(true)
    return "OK", "11485"
  else
    db.rollback()
    return "ERROR", "11481"
  end
end
function lpad(A0_397, A1_398)
  return A0_397.rep(0, A1_398 - #A0_397) .. A0_397
end
function captivePortal.dateToDB(A0_399)
  local L1_400, L2_401, L3_402, L4_403, L5_404
  L1_400 = {}
  for L5_404 in L2_401(L3_402, L4_403) do
    valid = table.insert(L1_400, L5_404)
  end
  if L2_401 ~= 0 then
    L5_404 = L1_400[1]
    L5_404 = "/"
    return L2_401
  end
  return L2_401
end
function captivePortal.dateToGUI(A0_405)
  local L1_406, L2_407, L3_408, L4_409, L5_410
  L1_406 = {}
  for L5_410 in L2_407(L3_408, L4_409) do
    valid = table.insert(L1_406, L5_410)
  end
  if L2_407 ~= nil then
    L5_410 = "/"
    return L2_407
  end
  return L2_407
end
function captivePortal.trafficConv(A0_411)
  local L1_412, L2_413, L3_414, L4_415
  L1_412 = "2"
  L2_413 = A0_411 / 1024
  if L2_413 > 1 then
    L1_412 = "3"
    L3_414 = L1_412
    L4_415 = L2_413
    return L3_414, L4_415
  else
    L3_414 = L1_412
    L4_415 = A0_411
    return L3_414, L4_415
  end
end
function captivePortal.timeConv(A0_416)
  local L1_417, L2_418, L3_419, L4_420, L5_421
  L1_417 = "0"
  L2_418 = A0_416 / 3600
  L3_419 = L2_418 / 24
  if L3_419 > 1 then
    L1_417 = "1"
    L4_420 = L1_417
    L5_421 = L3_419
    return L4_420, L5_421
  else
    L4_420 = L1_417
    L5_421 = L2_418
    return L4_420, L5_421
  end
end
function captivePortal.getslaRules()
  local L0_422, L1_423, L2_424
  L0_422 = ""
  L1_423 = io
  L1_423 = L1_423.open
  L2_424 = "/flash/tmp/capPort/sla.txt"
  L1_423 = L1_423(L2_424, "r")
  while true do
    L2_424 = L1_423.read
    L2_424 = L2_424(L1_423, "*l")
    L2_424 = L2_424 and L2_424:match("^%s*(.*)")
    if L2_424 == null then
      break
    end
    if L0_422 ~= "" then
      L0_422 = L0_422 .. "\n" .. L2_424
    else
      L0_422 = L2_424
    end
  end
  L2_424 = L1_423.close
  L2_424(L1_423)
  return L0_422
end
function captivePortal.setslaRules(A0_425)
  valid = io.open("/flash/tmp/capPort/sla.txt", "w"):write(A0_425)
  io.open("/flash/tmp/capPort/sla.txt", "w"):close()
  if valid then
    return "OK", "11485"
  else
    return "ERROR", "11481"
  end
end
function captivePortal.getSelectedRows(A0_426)
  local L1_427, L2_428, L3_429, L4_430, L5_431, L6_432, L7_433
  L1_427 = 0
  L2_428 = nil
  for L6_432, L7_433 in L3_429(L4_430) do
    if L1_427 == 0 then
      L2_428 = "_ROWID_=" .. L7_433
    else
      L2_428 = L2_428 .. " or _ROWID_=" .. L7_433
    end
    L1_427 = L1_427 + 1
  end
  return L3_429
end
function captivePortal.getAllRows()
  local L0_434
  L0_434 = "Flag=1"
  return db.getRowsWhere("tempUsers", L0_434) or {}
end
function captivePortal.accountBeginDateCheck(A0_435)
  return captivePortal.datesVerfiy(A0_435, 1)
end
function captivePortal.accountExpirationDateCheck(A0_436)
  return captivePortal.datesVerfiy(A0_436, 2)
end
function captivePortal.datesVerfiy(A0_437, A1_438)
  local L2_439, L3_440, L4_441, L5_442, L6_443, L7_444, L8_445, L9_446
  L2_439 = {}
  L3_440 = util
  L3_440 = L3_440.date
  L3_440 = L3_440()
  L2_439 = L3_440
  L3_440 = {}
  L4_441 = L2_439.year
  L3_440[1] = L4_441
  L4_441 = L2_439.month
  L3_440[2] = L4_441
  L4_441 = L2_439.date
  L3_440[3] = L4_441
  L4_441 = L2_439.hours
  L3_440[4] = L4_441
  L4_441 = L2_439.minutes
  L3_440[5] = L4_441
  L4_441 = A0_437
  L5_442 = {}
  for L9_446 in L6_443(L7_444, L8_445) do
    table.insert(L5_442, L9_446)
  end
  if A1_438 == 1 then
    valid = L6_443
    return L6_443
  elseif A1_438 == 2 then
    valid = L6_443
    return L6_443
  end
end
function captivePortal.datesCompare(A0_447, A1_448)
  local L2_449, L3_450
  if A0_447 and A1_448 then
    L2_449 = A0_447[1]
    L3_450 = A1_448[1]
    if L2_449 == L3_450 then
      L2_449 = A0_447[2]
      L3_450 = A1_448[2]
      if L2_449 == L3_450 then
        L2_449 = A0_447[3]
        L3_450 = A1_448[3]
        if L2_449 == L3_450 then
          L2_449 = A0_447[4]
          L3_450 = A1_448[4]
          if L2_449 == L3_450 then
            L2_449 = A0_447[5]
            L3_450 = A1_448[5]
            if L2_449 > L3_450 then
              L2_449 = false
              return L2_449
            end
          else
            L2_449 = A0_447[4]
            L3_450 = A1_448[4]
            if L2_449 > L3_450 then
              L2_449 = false
              return L2_449
            end
          end
          L2_449 = true
          return L2_449
        end
      end
    else
      L2_449 = A0_447[1]
      L3_450 = A1_448[1]
      if not (L2_449 > L3_450) then
        L2_449 = A0_447[1]
        L3_450 = A1_448[1]
        if L2_449 == L3_450 then
          L2_449 = A0_447[2]
          L3_450 = A1_448[2]
        elseif not (L2_449 > L3_450) then
          L2_449 = A0_447[2]
          L3_450 = A1_448[2]
          if L2_449 == L3_450 then
            L2_449 = A0_447[3]
            L3_450 = A1_448[3]
          end
        end
      elseif L2_449 > L3_450 then
        L2_449 = false
        return L2_449
      end
    end
  else
    L2_449 = false
    return L2_449
  end
  L2_449 = true
  return L2_449
end
function captivePortal.getRedirectType()
  local L0_451, L1_452, L2_453
  L0_451 = captivePortal
  L0_451 = L0_451.isEnabled
  L2_453 = L0_451()
  return (db.getAttribute("CaptivePortalVlan", "vlanId", L2_453, "redirectType"))
end
function captivePortal.getCPprofileIdRow(A0_454)
  local L1_455
  L1_455 = ""
  L1_455 = db.getAttribute("CaptivePortalPageDetails", "profileId", A0_454, "_ROWID_")
  return L1_455
end
