module("com.teamf1.core.external.auth", package.seeall)
require("teamf1lualib/db")
require("teamf1lualib/util")
require("teamf1lualib/validations")
require("teamf1lualib/auth_validations")
require("teamf1lualib/returnCodes")
require("teamf1lualib/auth_returnCodes")
require("externalAuthLib")
EXT_SERVER_DEF_IDLE_TIMEOUT = 10
EXT_SERVER_ID_RADIUS = 10
EXT_SERVER_ID_LDAP = 20
EXT_SERVER_ID_AD = 30
EXT_SERVER_ID_NTDOMAIN = 40
EXT_SERVER_ID_POP3 = 50
function ExternalAuthLdap(A0_0, A1_1, A2_2)
  local L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15
  L3_3 = {
    L4_4,
    L5_5,
    L6_6,
    L7_7,
    L8_8
  }
  L4_4 = "12131"
  L5_5 = "12286"
  L6_6 = "12734"
  L7_7 = "20442"
  L8_8 = "20443"
  L4_4 = I18N
  L4_4 = L4_4.translate
  L5_5 = L3_3
  L4_4 = L4_4(L5_5)
  L5_5 = nil
  L6_6 = "rowid=1"
  L7_7 = db
  L7_7 = L7_7.getRowWhere
  L8_8 = "LDAPSettings"
  L9_9 = L6_6
  L7_7 = L7_7(L8_8, L9_9)
  if L7_7 ~= nil then
    L8_8 = L7_7["LDAPSettings.AuthenticationServer"]
    L9_9 = L7_7["LDAPSettings.SecondAuthenticationServer"]
    L10_10 = L7_7["LDAPSettings.ThirdAuthenticationServer"]
    L11_11 = L7_7["LDAPSettings.LDAPBaseDN"]
    L12_12 = L7_7["LDAPSettings.SecondLDAPBaseDN"]
    L13_13 = L7_7["LDAPSettings.ThirdLDAPBaseDN"]
    L14_14 = L7_7["LDAPSettings.TimeOut"]
    L15_15 = L7_7["LDAPSettings.Retries"]
    if L14_14 == nil or L14_14 == "" then
      L14_14 = NULL
    end
    if L15_15 == nil or L15_15 == "" then
      L15_15 = NULL
    end
    L5_5 = externalAuthLib.ldapLogon(A0_0, A1_1, L8_8, L11_11, NULL, NULL, L14_14, L15_15)
    if L5_5 == 0 then
      return 0, L4_4["12286"]
    elseif L5_5 == 1 or L5_5 == 2 then
      return 2, A2_2
    elseif L5_5 == 3 or L5_5 == 4 then
      if L9_9 ~= "" and L9_9 ~= nil then
        L5_5 = externalAuthLib.ldapLogon(A0_0, A1_1, L9_9, L12_12, NULL, NULL, L14_14, L15_15)
        if L5_5 == 0 then
          return 0, L4_4["12286"]
        elseif L5_5 == 1 or L5_5 == 2 then
          return 2, A2_2
        elseif L5_5 == 3 or L5_5 == 4 then
          if L10_10 ~= "" and L10_10 ~= nil then
            L5_5 = externalAuthLib.ldapLogon(A0_0, A1_1, L10_10, L13_13, NULL, NULL, L14_14, L15_15)
            if L5_5 == 0 then
              return 0, L4_4["12286"]
            elseif L5_5 == 1 or L5_5 == 2 then
              return 2, A2_2
            elseif L5_5 == 3 or L5_5 == 4 then
              if L5_5 == 3 then
                return 2, A2_2
              else
                return 2, A2_2
              end
            end
          elseif L5_5 == 3 then
            return 2, A2_2
          else
            return 2, A2_2
          end
        end
      elseif L10_10 ~= "" and L10_10 ~= nil then
        L5_5 = externalAuthLib.ldapLogon(A0_0, A1_1, L10_10, L13_13, NULL, NULL, L14_14, L15_15)
        if L5_5 == 0 then
          return 0, L4_4["12286"]
        elseif L5_5 == 1 or L5_5 == 2 then
          return 2, A2_2
        elseif L5_5 == 3 or L5_5 == 4 then
          if L5_5 == 3 then
            return 2, A2_2
          else
            return 2, A2_2
          end
        end
      elseif L5_5 == 3 then
        return 2, A2_2
      else
        return 2, A2_2
      end
    end
  end
end
function ExternalAuthNtDomain(A0_16, A1_17, A2_18)
  local L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26, L11_27, L12_28, L13_29, L14_30, L15_31
  L3_19 = {
    L4_20,
    L5_21,
    L6_22,
    L7_23,
    L8_24
  }
  L4_20 = "12131"
  L5_21 = "12286"
  L6_22 = "12734"
  L7_23 = "20442"
  L8_24 = "20443"
  L4_20 = I18N
  L4_20 = L4_20.translate
  L5_21 = L3_19
  L4_20 = L4_20(L5_21)
  L5_21 = nil
  L6_22 = "rowid=1"
  L7_23 = db
  L7_23 = L7_23.getRowWhere
  L8_24 = "NTDomainSettings"
  L9_25 = L6_22
  L7_23 = L7_23(L8_24, L9_25)
  if L7_23 ~= nil then
    L8_24 = L7_23["NTDomainSettings.AuthenticationServer"]
    L9_25 = L7_23["NTDomainSettings.SecondAuthenticationServer"]
    L10_26 = L7_23["NTDomainSettings.ThirdAuthenticationServer"]
    L11_27 = L7_23["NTDomainSettings.NTDomainWorkGroup"]
    L12_28 = L7_23["NTDomainSettings.NTDomainSecondWorkGroup"]
    L13_29 = L7_23["NTDomainSettings.ThirdNTDomainWorkGroup"]
    L14_30 = L7_23["NTDomainSettings.TimeOut"]
    L15_31 = L7_23["NTDomainSettings.Retries"]
    if L14_30 == nil or L14_30 == "" then
      L14_30 = NULL
    end
    if L15_31 == nil or L15_31 == "" then
      L15_31 = NULL
    end
    L5_21 = externalAuthLib.ntDomainLogon(A0_16, A1_17, L8_24, L11_27, L14_30, L15_31)
    if L5_21 == 0 then
      return 0, L4_20["12286"]
    elseif L5_21 == 1 or L5_21 == 2 then
      return 2, A2_18
    elseif L5_21 == 3 or L5_21 == 4 then
      if L9_25 ~= "" and L9_25 ~= nil then
        L5_21 = externalAuthLib.ntDomainLogon(A0_16, A1_17, L9_25, L12_28, L14_30, L15_31)
        if L5_21 == 0 then
          return 0, L4_20["12286"]
        elseif L5_21 == 1 or L5_21 == 2 then
          return 2, A2_18
        elseif L5_21 == 3 or L5_21 == 4 then
          if L10_26 ~= "" and L10_26 ~= nil then
            L5_21 = externalAuthLib.ntDomainLogon(A0_16, A1_17, L10_26, L13_29, L14_30, L15_31)
            if L5_21 == 0 then
              return 0, L4_20["12286"]
            elseif L5_21 == 1 or L5_21 == 2 then
              return 2, A2_18
            elseif L5_21 == 3 or L5_21 == 4 then
              if L5_21 == 3 then
                return 2, A2_18
              else
                return 2, A2_18
              end
            end
          elseif L5_21 == 3 then
            return 2, A2_18
          else
            return 2, A2_18
          end
        end
      elseif L10_26 ~= "" and L10_26 ~= nil then
        L5_21 = externalAuthLib.ntDomainLogon(A0_16, A1_17, L10_26, L13_29, L14_30, L15_31)
        if L5_21 == 0 then
          return 0, L4_20["12286"]
        elseif L5_21 == 1 or L5_21 == 2 then
          return 2, A2_18
        elseif L5_21 == 3 or L5_21 == 4 then
          if L5_21 == 3 then
            return 2, A2_18
          else
            return 2, A2_18
          end
        end
      elseif L5_21 == 3 then
        return 2, A2_18
      else
        return 2, A2_18
      end
    end
  end
end
function ExternalAuthActiveDirectory(A0_32, A1_33, A2_34)
  local L3_35, L4_36, L5_37, L6_38, L7_39, L8_40, L9_41, L10_42, L11_43, L12_44
  L3_35 = {
    L4_36,
    L5_37,
    L6_38,
    L7_39,
    L8_40
  }
  L4_36 = "12131"
  L5_37 = "12286"
  L6_38 = "12734"
  L7_39 = "20442"
  L8_40 = "20443"
  L4_36 = I18N
  L4_36 = L4_36.translate
  L5_37 = L3_35
  L4_36 = L4_36(L5_37)
  L5_37 = nil
  L6_38 = "rowid=1"
  L7_39 = db
  L7_39 = L7_39.getRowWhere
  L8_40 = "ActiveDirectorySettings"
  L9_41 = L6_38
  L7_39 = L7_39(L8_40, L9_41)
  if L7_39 ~= nil then
    L8_40 = L7_39["ActiveDirectorySettings.ActiveDirectoryDomain"]
    L9_41 = L7_39["ActiveDirectorySettings.SecondActiveDirectoryDomain"]
    L10_42 = L7_39["ActiveDirectorySettings.ThirdActiveDirectoryDomain"]
    L11_43 = tonumber
    L12_44 = L7_39["ActiveDirectorySettings.TimeOut"]
    L11_43 = L11_43(L12_44)
    L12_44 = tonumber
    L12_44 = L12_44(L7_39["ActiveDirectorySettings.Retries"])
    L5_37 = externalAuthLib.activeDirectoryLogon(A0_32, A1_33, L8_40, NULL, L11_43, L12_44)
    if L5_37 == 0 then
      return 0, L4_36["12286"]
    elseif L5_37 == 1 or L5_37 == 2 then
      return 2, A2_34
    elseif L5_37 == 3 or L5_37 == 4 then
      if L9_41 ~= "" and L9_41 ~= nil then
        L5_37 = externalAuthLib.activeDirectoryLogon(A0_32, A1_33, L9_41, NULL, L11_43, L12_44)
        if L5_37 == 0 then
          return 0, L4_36["12286"]
        elseif L5_37 == 1 or L5_37 == 2 then
          return 2, A2_34
        elseif L5_37 == 3 or L5_37 == 4 then
          if L10_42 ~= "" and L10_42 ~= nil then
            L5_37 = externalAuthLib.activeDirectoryLogon(A0_32, A1_33, L10_42, NULL, L11_43, L12_44)
            if L5_37 == 0 then
              return 0, L4_36["12286"]
            elseif L5_37 == 1 or L5_37 == 2 then
              return 2, A2_34
            elseif L5_37 == 3 or L5_37 == 4 then
              if L5_37 == 3 then
                return 2, A2_34
              else
                return 2, A2_34
              end
            end
          elseif L5_37 == 3 then
            return 2, A2_34
          else
            return 2, A2_34
          end
        end
      elseif L10_42 ~= "" and L10_42 ~= nil then
        L5_37 = externalAuthLib.activeDirectoryLogon(A0_32, A1_33, L10_42, NULL, L11_43, L12_44)
        if L5_37 == 0 then
          return 0, L4_36["12286"]
        elseif L5_37 == 1 or L5_37 == 2 then
          return 2, A2_34
        elseif L5_37 == 3 or L5_37 == 4 then
          if L5_37 == 3 then
            return 2, A2_34
          else
            return 2, A2_34
          end
        end
      elseif L5_37 == 3 then
        return 2, A2_34
      else
        return 2, A2_34
      end
    end
  end
end
function ExternalAuthPop3(A0_45, A1_46, A2_47)
  local L3_48, L4_49, L5_50, L6_51, L7_52, L8_53, L9_54, L10_55, L11_56, L12_57, L13_58, L14_59, L15_60, L16_61, L17_62, L18_63, L19_64, L20_65, L21_66
  L3_48 = {
    L4_49,
    L5_50,
    L6_51,
    L7_52,
    L8_53
  }
  L4_49 = "12131"
  L5_50 = "12286"
  L6_51 = "12734"
  L7_52 = "20442"
  L8_53 = "20443"
  L4_49 = I18N
  L4_49 = L4_49.translate
  L5_50 = L3_48
  L4_49 = L4_49(L5_50)
  L5_50 = nil
  L6_51 = "rowid=1"
  L7_52 = db
  L7_52 = L7_52.getRowWhere
  L8_53 = "POPProfiles"
  L9_54 = L6_51
  L7_52 = L7_52(L8_53, L9_54)
  if L7_52 ~= nil then
    L8_53 = L7_52["POPProfiles.Server"]
    L9_54 = L7_52["POPProfiles.SecondServer"]
    L10_55 = L7_52["POPProfiles.ThirdServer"]
    L11_56 = L7_52["POPProfiles.AuthenticationPort"]
    L12_57 = L7_52["POPProfiles.SecondAuthenticationPort"]
    L13_58 = L7_52["POPProfiles.ThirdAuthenticationPort"]
    L14_59 = L7_52["POPProfiles.SSLEnable"]
    L15_60 = L7_52["POPProfiles.SecondSSLEnable"]
    L16_61 = L7_52["POPProfiles.ThirdSSLEnable"]
    L17_62 = L7_52["POPProfiles.CAFile"]
    L18_63 = L7_52["POPProfiles.SecondCAFile"]
    L19_64 = L7_52["POPProfiles.ThirdCAFile"]
    L20_65 = L7_52["POPProfiles.Timeout"]
    L21_66 = L7_52["POPProfiles.Retries"]
    if L20_65 == nil or L20_65 == "" then
      L20_65 = NULL
    end
    if L21_66 == nil or L21_66 == "" then
      L21_66 = NULL
    end
    if L14_59 == "1" then
      L17_62 = "/flash/tmp/caFiles/" .. L17_62
    else
      L17_62 = NULL
    end
    L5_50 = externalAuthLib.mpopLogon(A0_45, A1_46, L8_53, L11_56, L14_59, L17_62, L20_65, L21_66)
    if L5_50 == 0 then
      return 0, L4_49["12286"]
    elseif L5_50 == 1 or L5_50 == 2 then
      return 2, A2_47
    elseif L5_50 == 3 or L5_50 == 4 then
      if L9_54 ~= "" and L9_54 ~= nil then
        if L15_60 == "1" then
          L18_63 = "/flash/tmp/caFiles/" .. L18_63
        else
          L18_63 = NULL
        end
        L5_50 = externalAuthLib.mpopLogon(A0_45, A1_46, L9_54, L12_57, L15_60, L18_63, L20_65, L21_66)
        if L5_50 == 0 then
          return 0, L4_49["12286"]
        elseif L5_50 == 1 or L5_50 == 2 then
          return 2, A2_47
        elseif L5_50 == 3 or L5_50 == 4 then
          if L10_55 ~= "" and L10_55 ~= nil then
            if L16_61 == "1" then
              L19_64 = "/flash/tmp/caFiles/" .. L19_64
            else
              L19_64 = NULL
            end
            L5_50 = externalAuthLib.mpopLogon(A0_45, A1_46, L10_55, L13_58, L16_61, L19_64, L20_65, L21_66)
            if L5_50 == 0 then
              return 0, L4_49["12286"]
            elseif L5_50 == 1 or L5_50 == 2 then
              return 2, A2_47
            elseif L5_50 == 3 or L5_50 == 4 then
              if L5_50 == 3 then
                return 2, A2_47
              else
                return 2, A2_47
              end
            end
          elseif L5_50 == 3 then
            return 2, A2_47
          else
            return 2, A2_47
          end
        end
      elseif L10_55 ~= "" and L10_55 ~= nil then
        if L16_61 == "1" then
          L19_64 = "/flash/tmp/caFiles/" .. L19_64
        else
          L19_64 = NULL
        end
        L5_50 = externalAuthLib.mpopLogon(A0_45, A1_46, L10_55, L13_58, L16_61, L19_64, L20_65, L21_66)
        if L5_50 == 0 then
          return 0, L4_49["12286"]
        elseif L5_50 == 1 or L5_50 == 2 then
          return 2, A2_47
        elseif L5_50 == 3 or L5_50 == 4 then
          if L5_50 == 3 then
            return 2, A2_47
          else
            return 2, A2_47
          end
        end
      elseif L5_50 == 3 then
        return 2, A2_47
      else
        return 2, A2_47
      end
    end
  end
end
function ExternalAuthRadius(A0_67, A1_68, A2_69, A3_70)
  local L4_71, L5_72, L6_73, L7_74, L8_75, L9_76
  L4_71 = {
    L5_72,
    L6_73,
    L7_74
  }
  L5_72 = "12131"
  L6_73 = "12286"
  L7_74 = "12734"
  L5_72 = I18N
  L5_72 = L5_72.translate
  L6_73 = L4_71
  L5_72 = L5_72(L6_73)
  L6_73, L7_74 = nil, nil
  L8_75 = externalAuthLib
  L8_75 = L8_75.authenticate
  L9_76 = A0_67
  L9_76 = L8_75(L9_76, A1_68, A2_69)
  if L8_75 == 0 then
    if db.getRow("openvpnSession", "UserName", A0_67) ~= nil then
      L8_75 = 1
      L6_73 = L5_72["12131"]
    else
      L8_75 = 0
      L6_73 = L5_72["12286"]
    end
  else
    L8_75 = 2
    L6_73 = A3_70
  end
  return L8_75, L6_73, L9_76
end
