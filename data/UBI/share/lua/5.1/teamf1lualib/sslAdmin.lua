local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/sslvpn")
L0_0 = require
L0_0("sslvpnLuaLib")
L0_0 = require
L0_0("loginLuaLib")
L0_0 = {}
sslAdmin = L0_0
L0_0 = "SSLVPNPortalLayout"
function sslAdmin.disAssociateUserFromVsignCredential(A0_1)
  local L1_2, L2_3
  L1_2 = true
  L2_3 = db
  L2_3 = L2_3.existsRow
  L2_3 = L2_3("vsign2fctrCredMgmt", "userName", A0_1)
  if L2_3 == nil then
    return true
  end
  if L2_3 then
    L1_2 = db.setAttribute("vsign2fctrCredMgmt", "_ROWID_", L2_3, "userName", "")
  end
  return L1_2
end
function sslAdmin.deleteSSLVPNPoliciesOfOwner(A0_4, A1_5)
  local L2_6, L3_7, L4_8, L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21
  L2_6 = true
  L3_7 = "PolicyType = '"
  L4_8 = A0_4
  L5_9 = "' AND PolicyOwnerName = '"
  L3_7 = L3_7 .. L4_8 .. L5_9 .. L6_10 .. L7_11
  L4_8 = db
  L4_8 = L4_8.getRowsWhere
  L5_9 = "SSLVPNPolicy"
  L4_8 = L4_8(L5_9, L6_10)
  if L4_8 == nil then
    L5_9 = true
    return L5_9
  end
  L5_9 = 0
  for L9_13, L10_14 in L6_10(L7_11) do
    L5_9 = L5_9 + 1
    L11_15 = L4_8[L5_9]
    L12_16 = L11_15["SSLVPNPolicy.PolicyName"]
    L13_17 = "PolicyType = '"
    L14_18 = A0_4
    L15_19 = "' AND PolicyOwnerName = '"
    L16_20 = A1_5
    L17_21 = "' AND PolicyName = '"
    L13_17 = L13_17 .. L14_18 .. L15_19 .. L16_20 .. L17_21 .. L12_16 .. "'"
    L14_18 = db
    L14_18 = L14_18.existsRowWhere
    L15_19 = "SSLVPNPolicy"
    L16_20 = L13_17
    L14_18 = L14_18(L15_19, L16_20)
    L15_19 = {}
    if L14_18 then
      L15_19["SSLVPNPolicy._ROWID_"] = L14_18
      L16_20 = db
      L16_20 = L16_20.getAttribute
      L17_21 = "SSLVPNPolicy"
      L16_20 = L16_20(L17_21, "_ROWID_", L14_18, "DestinationObjectType")
      if L16_20 == "1" then
        L17_21 = db
        L17_21 = L17_21.getAttribute
        L17_21 = L17_21("SSLVPNPolicy", "_ROWID_", L14_18, "ResourceName")
        L2_6 = sslvpn.updateResource(L17_21, "delete")
      else
        L2_6 = true
      end
      if L2_6 then
        L17_21 = db
        L17_21 = L17_21.delete
        L17_21 = L17_21("SSLVPNPolicy", L15_19)
        L2_6 = L17_21
      end
    end
    if not L2_6 then
      break
    end
  end
  return L2_6
end
function sslAdmin.domainConfig(A0_22, A1_23, A2_24)
  local L3_25, L4_26, L5_27, L6_28, L7_29, L8_30
  L3_25 = ACCESS_LEVEL
  if L3_25 ~= 0 then
    L3_25 = "ACCESS_DENIED"
    L4_26 = "10187"
    return L3_25, L4_26
  end
  L3_25 = ""
  L4_26 = ""
  L5_27 = false
  L6_28 = {}
  L7_29, L8_30 = nil, nil
  if A2_24 == "add" then
    A0_22["USERDBDomains.PortalLayoutName"] = "None"
    A0_22["USERDBDomains.AuthenticationType"] = "local"
    A0_22["USERDBDomains.AuthProfile"] = "Default"
    A0_22["USERDBDomains.Retries"] = "5"
    A0_22["USERDBDomains.TimeOut"] = "30"
    A0_22["USERDBDomains.AuthenticationPort"] = "0"
    A0_22["USERDBDomains.SecondAuthenticationPort"] = "0"
    A0_22["USERDBDomains.ThirdAuthenticationPort"] = "0"
    A0_22["USERDBDomains.SSLEnable"] = 0
    A0_22["USERDBDomains.SecondSSLEnable"] = 0
    A0_22["USERDBDomains.ThirdSSLEnable"] = 0
    A0_22["USERDBDomains.DefaultDomain"] = 0
    L5_27 = true
  else
    groupId = db.getAttribute("UserGroups", "_ROWID_", A1_23, "GroupId")
    if groupId == nil then
      printCLIError("Group Id is invalid.")
      return false
    end
    L3_25 = db.getAttribute("USERDBDomains", "GroupId", groupId, "_ROWID_")
    L5_27 = true
  end
  if L5_27 and db.typeAndRangeValidate(A0_22) then
    if A2_24 == "add" then
      L5_27 = db.insert("USERDBDomains", A0_22)
    elseif A2_24 == "edit" then
      L5_27 = db.update("USERDBDomains", A0_22, L3_25)
    elseif A2_24 == "delete" then
      L5_27 = false
    end
  end
  return L5_27
end
function sslAdmin.deleteDomains(A0_31)
  local L1_32, L2_33, L3_34, L4_35, L5_36, L6_37, L7_38, L8_39
  L1_32 = false
  L2_33 = db
  L2_33 = L2_33.existsRow
  L3_34 = "USERDBDomains"
  L4_35 = "GroupId"
  L5_36 = A0_31
  L2_33 = L2_33(L3_34, L4_35, L5_36)
  if not L2_33 then
    L2_33 = true
    return L2_33
  end
  L2_33 = db
  L2_33 = L2_33.getAttribute
  L3_34 = "USERDBDomains"
  L4_35 = "GroupId"
  L5_36 = A0_31
  L6_37 = "_ROWID_"
  L2_33 = L2_33(L3_34, L4_35, L5_36, L6_37)
  L3_34 = {}
  L4_35 = {}
  L3_34["USERDBDomains._ROWID_"] = L2_33
  L5_36 = db
  L5_36 = L5_36.getAttribute
  L6_37 = "USERDBDomains"
  L7_38 = "GroupId"
  L8_39 = A0_31
  L5_36 = L5_36(L6_37, L7_38, L8_39, "PortalLayoutName")
  L6_37 = db
  L6_37 = L6_37.getAttribute
  L7_38 = "SSLVPNPortalLayout"
  L8_39 = "PortalLayoutName"
  L6_37 = L6_37(L7_38, L8_39, L5_36, "_ROWID_")
  if L5_36 == "None" then
    L7_38 = db
    L7_38 = L7_38.delete
    L8_39 = "USERDBDomains"
    L7_38 = L7_38(L8_39, L3_34)
    L1_32 = L7_38
    L7_38 = true
    return L7_38
  end
  L7_38 = db
  L7_38 = L7_38.getAttribute
  L8_39 = "SSLVPNPortalLayout"
  L7_38 = L7_38(L8_39, "DefaultPortal", "2", "PortalLayoutName")
  if L7_38 == nil then
    L8_39 = db
    L8_39 = L8_39.getAttribute
    L8_39 = L8_39("SSLVPNPortalLayout", "DefaultPortal", "1", "PortalLayoutName")
    L7_38 = L8_39
  end
  if L7_38 == L5_36 then
    L8_39 = tonumber
    L8_39 = L8_39(db.getAttribute("SSLVPNPortalLayout", "_ROWID_", L6_37, "UseCount"))
    if L8_39 == 1 then
      L8_39 = db
      L8_39 = L8_39.rollback
      L8_39()
      L8_39 = false
      return L8_39
    end
  end
  L8_39 = db
  L8_39 = L8_39.getAttribute
  L8_39 = L8_39("SSLVPNPortalLayout", "_ROWID_", L6_37, "UseCount")
  L1_32 = db.setAttribute("SSLVPNPortalLayout", "_ROWID_", L6_37, "UseCount", tonumber(L8_39) - 1)
  L1_32 = L1_32 and db.delete("USERDBDomains", L3_34)
  return L1_32
end
function sslAdmin.userConfigXML(A0_40, A1_41, A2_42)
  local L3_43, L4_44, L5_45, L6_46, L7_47
  L3_43 = "ADMIN_REQD,USER_WRONG_USER_PASSWORD,USER_SESSION_NOT_FOUND,11830,SSLVPN_USER_CONFIG_FAILED"
  L4_44 = db
  L4_44 = L4_44.getString
  L5_45 = L3_43
  L4_44 = L4_44(L5_45)
  L3_43 = L4_44
  L4_44 = ACCESS_LEVEL
  if L4_44 ~= 0 then
    L4_44 = "ACCESS_DENIED"
    L5_45 = L3_43.ADMIN_REQD
    L5_45 = L5_45 or "i18nHTMLMissing"
    return L4_44, L5_45
  end
  L4_44 = db
  L4_44 = L4_44.beginTransaction
  L4_44()
  L4_44 = false
  L5_45 = ""
  L6_46 = A0_40["Users.UserName"]
  if A2_42 == "add" then
    L7_47 = A0_40["USERDBUsers.UserType"]
    if L7_47 == "0" then
      L7_47 = db
      L7_47 = L7_47.getAttribute
      L7_47 = L7_47("USERDBGroups", "USERDBGroups.GroupName", A0_40["USERDBUsers.GroupName"], "DomainName")
      if L7_47 ~= nil and db.getAttribute("USERDBDomains", "USERDBDomains.DomainName", L7_47, "AuthenticationType") ~= nil and db.getAttribute("USERDBDomains", "USERDBDomains.DomainName", L7_47, "AuthenticationType") ~= "local" then
        A0_40["USERDBUsers.UserType"] = "1"
      end
    end
    L7_47 = A0_40["USERDBUsers.UserType"]
    if L7_47 == "4" then
      A0_40["USERDBUsers.DenyLogin"] = 1
      A0_40["USERDBUsers.DenyLoginFromWan"] = 1
    end
  elseif A2_42 == "edit" then
    L7_47 = db
    L7_47 = L7_47.getAttribute
    L7_47 = L7_47("USERDBUsers", "_ROWID_", A1_41, "UserName")
    L5_45 = L7_47
    L7_47 = A0_40["USERDBUsers.PasswordEdit"]
    if L7_47 == "1" then
      L7_47 = A0_40["USERDBUsers.MyPassword"]
      if L7_47 ~= nil then
        L7_47 = "LoginAddress = '"
        L7_47 = L7_47 .. SAPI.Request.servervariable("REMOTE_ADDR") .. "' AND Cookie = '" .. cgi.sessionId .. "'"
        if db.getRowWhere("SSLVPNActiveUsers", L7_47) ~= nil then
          if db.getAttribute("USERDBUsers", "UserName", db.getRowWhere("SSLVPNActiveUsers", L7_47)["SSLVPNActiveUsers.UserName"], "Password") ~= A0_40["USERDBUsers.MyPassword"] then
            db.rollback()
            return "ERROR", L3_43.USER_WRONG_USER_PASSWORD or "i18nHTMLMissing"
          end
        else
          db.rollback()
          return "ERROR", L3_43.USER_SESSION_NOT_FOUND or "i18nHTMLMissing"
        end
      end
    end
  end
  L7_47 = db
  L7_47 = L7_47.typeAndRangeValidate
  L7_47 = L7_47(A0_40)
  if L7_47 then
    if A2_42 == "add" then
      L7_47 = db
      L7_47 = L7_47.insert
      L7_47 = L7_47(DBTable, A0_40)
      L4_44 = L7_47
    elseif A2_42 == "edit" then
      L7_47 = db
      L7_47 = L7_47.update
      L7_47 = L7_47(DBTable, A0_40, A1_41)
      L4_44 = L7_47
    elseif A2_42 == "delete" then
      L4_44 = false
    end
  end
  if L4_44 and A2_42 == "edit" and L5_45 ~= L6_46 then
    L7_47 = db
    L7_47 = L7_47.existsRow
    L7_47 = L7_47("SSLVPNUserLoginPolicyDefinedBrowser", "UserName", L5_45)
    if L7_47 and L4_44 then
      L7_47 = db
      L7_47 = L7_47.setAttribute
      L7_47 = L7_47("SSLVPNUserLoginPolicyDefinedBrowser", "UserName", L5_45, "UserName", L6_46)
      L4_44 = L7_47
    end
    L7_47 = db
    L7_47 = L7_47.existsRow
    L7_47 = L7_47("SSLVPNUserLoginPolicyDefinedAddress", "UserName", L5_45)
    if L7_47 and L4_44 then
      L7_47 = db
      L7_47 = L7_47.setAttribute
      L7_47 = L7_47("SSLVPNUserLoginPolicyDefinedAddress", "UserName", L5_45, "UserName", L6_46)
      L4_44 = L7_47
    end
    L7_47 = db
    L7_47 = L7_47.existsRow
    L7_47 = L7_47("SSLVPNPolicy", "PolicyOwnerName", L5_45)
    if L7_47 and L4_44 then
      L7_47 = db
      L7_47 = L7_47.setAttribute
      L7_47 = L7_47("SSLVPNPolicy", "PolicyOwnerName", L5_45, "PolicyOwnerName", L6_46)
      L4_44 = L7_47
    end
    L7_47 = db
    L7_47 = L7_47.existsRow
    L7_47 = L7_47("vsign2fctrCredMgmt", "UserName", L5_45)
    if L7_47 and L4_44 then
      L7_47 = db
      L7_47 = L7_47.setAttribute
      L7_47 = L7_47("vsign2fctrCredMgmt", "UserName", L5_45, "UserName", L6_46)
      L4_44 = L7_47
    end
  end
  if L4_44 then
    L7_47 = db
    L7_47 = L7_47.commitTransaction
    L7_47(true)
    L7_47 = "OK"
    return L7_47, L3_43["11830"] or "i18nHTMLMissing"
  else
    L7_47 = db
    L7_47 = L7_47.rollback
    L7_47()
    L7_47 = "ERROR"
    return L7_47, L3_43.SSLVPN_USER_CONFIG_FAILED or "i18nHTMLMissing"
  end
end
function sslAdmin.UsersPerDomain(A0_48, A1_49)
  local L2_50, L3_51, L4_52, L5_53, L6_54, L7_55
  L2_50 = "USER_NUMBER_EXCEEDED,11830"
  L3_51 = db
  L3_51 = L3_51.getString
  L4_52 = L2_50
  L3_51 = L3_51(L4_52)
  L2_50 = L3_51
  L3_51 = 0
  L4_52 = 0
  L5_53 = A1_49
  L6_54 = {}
  L7_55 = db
  L7_55 = L7_55.getAttribute
  L7_55 = L7_55("UserGroups", "GroupName", A0_48, "DomainName")
  if L7_55 ~= nil then
    L6_54 = db.getRows("UserGroups", "DomainName", L7_55)
    for _FORV_12_, _FORV_13_ in pairs(L6_54) do
      L4_52 = L4_52 + 1
      if db.getRows("Users", "GroupName", L6_54[L4_52]["USERDBGroups.GroupName"]) ~= nil then
        L3_51 = L3_51 + tonumber(#db.getRows("Users", "GroupName", L6_54[L4_52]["USERDBGroups.GroupName"]))
      end
      if L5_53 <= L3_51 then
        return "ERROR", L2_50.USER_NUMBER_EXCEEDED or "i18nHTMLMissing"
      end
    end
    return "OK", L2_50["11830"] or "i18nHTMLMissing"
  end
end
function sslAdmin.revalidate(A0_56, A1_57)
  local L2_58, L3_59, L4_60, L5_61, L6_62, L7_63, L8_64, L9_65
  if A0_56 == nil then
    L2_58 = util
    L2_58 = L2_58.appendDebugOut
    L3_59 = "PLEASE LOGIN - NOT LOGGED IN YET! - no cookie<br>"
    L2_58(L3_59)
    L2_58 = "NO_COOKIE"
    return L2_58
  else
    L2_58 = "LoginAddress = '"
    L3_59 = A1_57
    L4_60 = "' AND Cookie = '"
    L5_61 = A0_56
    L6_62 = "'"
    L2_58 = L2_58 .. L3_59 .. L4_60 .. L5_61 .. L6_62
    L3_59 = db
    L3_59 = L3_59.getRowWhere
    L4_60 = "SSLVPNActiveUsers"
    L5_61 = L2_58
    L3_59 = L3_59(L4_60, L5_61)
    L4_60 = timeLib
    L4_60 = L4_60.uptime
    L5_61 = L4_60()
    if L3_59 == nil then
      L6_62 = util
      L6_62 = L6_62.appendDebugOut
      L7_63 = "PLEASE RELOGIN - LOGIN EXPIRED! - someone else killed your expired session<br>"
      L6_62(L7_63)
      L6_62 = db
      L6_62 = L6_62.getAttribute
      L7_63 = "stringsMap"
      L8_64 = "stringId"
      L9_65 = "LOGIN_SESSION_EXPIRED"
      L6_62 = L6_62(L7_63, L8_64, L9_65, LANGUAGE)
      L6_62 = L6_62 or "NO_SESSION"
      statusMessage = L6_62
      L6_62 = "NO_SESSION"
      return L6_62
    else
      L6_62 = sslvpnLuaLib
      L6_62 = L6_62.sslLoginSessionValidate
      L7_63 = A0_56
      L8_64 = A1_57
      L8_64 = L6_62(L7_63, L8_64)
      if L6_62 == -1 then
        L9_65 = util
        L9_65 = L9_65.appendDebugOut
        L9_65("PLEASE RELOGIN - LOGIN EXPIRED! - you waited too long<br>")
        L9_65 = db
        L9_65 = L9_65.getAttribute
        L9_65 = L9_65("stringsMap", "stringId", "LOGIN_SESSION_EXPIRED", LANGUAGE)
        statusMessage = L9_65
        L9_65 = "EXPIRED_SESSION"
        return L9_65
      end
      L9_65 = L3_59["SSLVPNActiveUsers.SessionStatus"]
      if L9_65 ~= "ACTIVE" then
        statusMessage = db.getAttribute("stringsMap", "stringId", L9_65, LANGUAGE)
        return "EXPIRED_SESSION"
      end
      util.appendDebugOut("YOU ARE ALREADY LOGGED IN!<br>")
      db.setAttributeWhere("SSLVPNActiveUsers", L2_58, "LastAccessTime", L5_61)
      ACCESS_LEVEL = L8_64
      return "OK"
    end
  end
end
function sslAdmin.login(A0_66)
  local L1_67, L2_68, L3_69, L4_70, L5_71, L6_72, L7_73, L8_74, L9_75, L10_76, L11_77, L12_78, L13_79, L14_80, L15_81, L16_82, L17_83, L18_84, L19_85, L20_86, L21_87, L22_88, L23_89, L24_90, L25_91
  L1_67 = "SSLVPN_PORTAL_INFO_FIND_FAILED,USER_LOGIN_INVALID_PASSWORD,SSLVPN_USER_AUTH_FAILED,USER_AUTH_FAILED,USER_LOCKED"
  L2_68 = db
  L2_68 = L2_68.getString
  L3_69 = L1_67
  L2_68 = L2_68(L3_69)
  L1_67 = L2_68
  L2_68 = A0_66["Users.UserName"]
  L3_69 = A0_66["Users.Password"]
  L4_70 = A0_66["Login.userAgent"]
  L5_71 = A0_66["Login.Portal"]
  if L5_71 == nil then
    L6_72 = loginLuaLib
    L6_72 = L6_72.luaLoginEventHandler
    L7_73 = "Failed to find Portal Information"
    L8_74 = L2_68
    L9_75 = " user."
    L7_73 = L7_73 .. L8_74 .. L9_75
    L8_74 = 3
    L9_75 = "LOGIN"
    L6_72(L7_73, L8_74, L9_75)
    L6_72 = 3
    L7_73 = L1_67.SSLVPN_PORTAL_INFO_FIND_FAILED
    L7_73 = L7_73 or "i18nHTMLMissing"
    return L6_72, L7_73
  end
  L6_72 = db
  L6_72 = L6_72.getAttribute
  L7_73 = "USERDBDomains"
  L8_74 = "PortalLayoutName"
  L9_75 = L5_71
  L10_76 = "AuthenticationType"
  L6_72 = L6_72(L7_73, L8_74, L9_75, L10_76)
  L7_73 = false
  if L6_72 == nil then
    L8_74 = db
    L8_74 = L8_74.getAttribute
    L9_75 = "SSLVPNPortalLayout"
    L10_76 = "PortalLayoutName"
    L11_77 = L5_71
    L12_78 = "profileName"
    L8_74 = L8_74(L9_75, L10_76, L11_77, L12_78)
    L9_75 = db
    L9_75 = L9_75.getAttribute
    L10_76 = "LoginProfiles"
    L11_77 = "configurationName"
    L12_78 = L8_74
    L13_79 = "errorMessage"
    L9_75 = L9_75(L10_76, L11_77, L12_78, L13_79)
    if L9_75 ~= nil and L9_75 ~= "" and L9_75 ~= " " then
      L10_76 = -1
      L11_77 = L9_75
      return L10_76, L11_77
    else
      L10_76 = loginLuaLib
      L10_76 = L10_76.luaLoginEventHandler
      L11_77 = "Login - Invalid username or password."
      L12_78 = 4
      L13_79 = "LOGIN"
      L10_76(L11_77, L12_78, L13_79)
      L10_76 = -1
      L11_77 = L1_67.USER_LOGIN_INVALID_PASSWORD
      L11_77 = L11_77 or "i18nHTMLMissing"
      return L10_76, L11_77
    end
  elseif L6_72 ~= "local" then
    L8_74 = login
    L8_74 = L8_74.parseReferer
    L9_75 = os
    L9_75 = L9_75.getenv
    L10_76 = "HTTP_REFERER"
    L25_91 = L9_75(L10_76)
    L8_74 = L8_74(L9_75, L10_76, L11_77, L12_78, L13_79, L14_80, L15_81, L16_82, L17_83, L18_84, L19_85, L20_86, L21_87, L22_88, L23_89, L24_90, L25_91, L9_75(L10_76))
    L9_75 = db
    L9_75 = L9_75.getAttribute
    L10_76 = "USERDBDomains"
    L11_77 = "PortalLayoutName"
    L12_78 = L5_71
    L13_79 = "DomainName"
    L9_75 = L9_75(L10_76, L11_77, L12_78, L13_79)
    L10_76 = sslvpnLuaLib
    L10_76 = L10_76.sslLogin
    L11_77 = L2_68
    L12_78 = L3_69
    L13_79 = L9_75
    L14_80 = SAPI
    L14_80 = L14_80.Request
    L14_80 = L14_80.servervariable
    L15_81 = "REMOTE_ADDR"
    L14_80 = L14_80(L15_81)
    L15_81 = SAPI
    L15_81 = L15_81.Request
    L15_81 = L15_81.servervariable
    L16_82 = "SERVER_ADDR"
    L15_81 = L15_81(L16_82)
    L16_82 = L4_70
    L17_83 = SAPI
    L17_83 = L17_83.Request
    L17_83 = L17_83.servervariable
    L18_84 = "URL"
    L17_83 = L17_83(L18_84)
    L18_84 = L8_74
    L13_79 = L10_76(L11_77, L12_78, L13_79, L14_80, L15_81, L16_82, L17_83, L18_84)
    if L10_76 == -1 then
      L14_80 = db
      L14_80 = L14_80.getAttribute
      L15_81 = "SSLVPNPortalLayout"
      L16_82 = "PortalLayoutName"
      L17_83 = L5_71
      L18_84 = "profileName"
      L14_80 = L14_80(L15_81, L16_82, L17_83, L18_84)
      L15_81 = db
      L15_81 = L15_81.getAttribute
      L16_82 = "LoginProfiles"
      L17_83 = "configurationName"
      L18_84 = L14_80
      L19_85 = "errorMessage"
      L15_81 = L15_81(L16_82, L17_83, L18_84, L19_85)
      if L15_81 ~= nil and L15_81 ~= "" and L15_81 ~= " " then
        L16_82 = -1
        L17_83 = L15_81
        return L16_82, L17_83
      else
        L16_82 = loginLuaLib
        L16_82 = L16_82.luaLoginEventHandler
        L17_83 = "Login - Invalid username or password."
        L18_84 = 4
        L19_85 = "LOGIN"
        L16_82(L17_83, L18_84, L19_85)
        L16_82 = -1
        L17_83 = L1_67.USER_LOGIN_INVALID_PASSWORD
        L17_83 = L17_83 or "i18nHTMLMissing"
        return L16_82, L17_83
      end
    elseif L10_76 == 0 then
      L14_80 = cgilua
      L14_80 = L14_80.cookies
      L14_80 = L14_80.set
      L15_81 = "TeamF1Login"
      L16_82 = L11_77
      L14_80(L15_81, L16_82)
      ACCESS_LEVEL = L13_79
      L14_80 = db
      L14_80 = L14_80.setAttribute
      L15_81 = "UserLoginFailure"
      L16_82 = "UserName"
      L17_83 = L2_68
      L18_84 = "FailureCount"
      L19_85 = 0
      L14_80(L15_81, L16_82, L17_83, L18_84, L19_85)
      L14_80 = 0
      L15_81 = "OK"
      L16_82 = nil
      L17_83 = L11_77
      return L14_80, L15_81, L16_82, L17_83
    elseif L10_76 == -2 then
      L14_80 = 1
      L15_81 = L12_78
      L16_82 = A0_66
      return L14_80, L15_81, L16_82
    elseif L10_76 == -4 then
      L14_80 = cgilua
      L14_80 = L14_80.cookies
      L14_80 = L14_80.set
      L15_81 = "TeamF1Login"
      L16_82 = L11_77
      L14_80(L15_81, L16_82)
      ACCESS_LEVEL = L13_79
      L14_80 = 2
      L15_81 = L12_78
      return L14_80, L15_81
    else
      L14_80 = 3
      L15_81 = L12_78
      return L14_80, L15_81
    end
  else
    L8_74 = db
    L8_74 = L8_74.getRow
    L9_75 = "Users"
    L10_76 = "UserName"
    L11_77 = L2_68
    L8_74 = L8_74(L9_75, L10_76, L11_77)
    if L8_74 ~= nil then
      L9_75 = {}
    elseif L8_74 == L9_75 then
      L9_75 = sslvpnLuaLib
      L9_75 = L9_75.logFailedLogin
      L10_76 = L2_68
      L9_75 = L9_75(L10_76)
      L10_76 = loginLuaLib
      L10_76 = L10_76.luaLoginEventHandler
      L11_77 = "Login - Invalid username: "
      L12_78 = L2_68
      L13_79 = "."
      L11_77 = L11_77 .. L12_78 .. L13_79
      L12_78 = 3
      L13_79 = "LOGIN"
      L10_76(L11_77, L12_78, L13_79)
    end
    if L8_74 ~= nil then
      L9_75 = db
      L9_75 = L9_75.getAttribute
      L10_76 = "Users"
      L11_77 = "UserName"
      L12_78 = L2_68
      L13_79 = "GroupId"
      L9_75 = L9_75(L10_76, L11_77, L12_78, L13_79)
      L9_75 = L9_75 or ""
      L10_76 = db
      L10_76 = L10_76.getAttribute
      L11_77 = "GroupAccessControl"
      L12_78 = "GroupId"
      L13_79 = L9_75
      L14_80 = "LockoutEnable"
      L10_76 = L10_76(L11_77, L12_78, L13_79, L14_80)
      L11_77 = db
      L11_77 = L11_77.getAttribute
      L12_78 = "GroupAccessControl"
      L13_79 = "GroupId"
      L14_80 = L9_75
      L15_81 = "MaxLockoutAttempts"
      L11_77 = L11_77(L12_78, L13_79, L14_80, L15_81)
      L12_78 = db
      L12_78 = L12_78.getAttribute
      L13_79 = "UserGroups"
      L14_80 = "GroupId"
      L15_81 = L9_75
      L16_82 = "GroupName"
      L12_78 = L12_78(L13_79, L14_80, L15_81, L16_82)
      L13_79 = db
      L13_79 = L13_79.getAttribute
      L14_80 = "UserGroups"
      L15_81 = "GroupName"
      L16_82 = L12_78
      L17_83 = "DomainName"
      L13_79 = L13_79(L14_80, L15_81, L16_82, L17_83)
      L13_79 = L13_79 or ""
      L14_80 = db
      L14_80 = L14_80.getAttribute
      L15_81 = "USERDBDomains"
      L16_82 = "DomainName"
      L17_83 = L13_79
      L18_84 = "PortalLayoutName"
      L14_80 = L14_80(L15_81, L16_82, L17_83, L18_84)
      L15_81 = Page
      L16_82 = SSL_PORTAL_LOGIN_PAGE
      if L15_81 == L16_82 then
        L15_81 = A0_66["Login.PortalName"]
        if L15_81 == nil then
          L16_82 = loginLuaLib
          L16_82 = L16_82.luaLoginEventHandler
          L17_83 = "Login - Failed to find Portal Information."
          L18_84 = 3
          L19_85 = "LOGIN"
          L16_82(L17_83, L18_84, L19_85)
          L16_82 = 3
          L17_83 = L1_67.SSLVPN_PORTAL_INFO_FIND_FAILED
          L17_83 = L17_83 or "i18nHTMLMissing"
          return L16_82, L17_83
        elseif L15_81 ~= L14_80 then
          L16_82 = login
          L16_82 = L16_82.verifyUserType
          L17_83 = L2_68
          L18_84 = "3"
          L16_82 = L16_82(L17_83, L18_84)
          if L16_82 then
            L16_82 = loginLuaLib
            L16_82 = L16_82.luaLoginEventHandler
            L17_83 = "Login - Admin user authentication has failed for "
            L18_84 = L2_68
            L19_85 = " user."
            L17_83 = L17_83 .. L18_84 .. L19_85
            L18_84 = 3
            L19_85 = "LOGIN"
            L16_82(L17_83, L18_84, L19_85)
            L16_82 = 3
            L17_83 = "Admin user authentication has failed"
            return L16_82, L17_83
          else
            L16_82 = login
            L16_82 = L16_82.verifyUserType
            L17_83 = L2_68
            L18_84 = "4"
            L16_82 = L16_82(L17_83, L18_84)
            if L16_82 then
              L16_82 = loginLuaLib
              L16_82 = L16_82.luaLoginEventHandler
              L17_83 = "Login - Guest user authentication has failed for "
              L18_84 = L2_68
              L19_85 = " user."
              L17_83 = L17_83 .. L18_84 .. L19_85
              L18_84 = 3
              L19_85 = "LOGIN"
              L16_82(L17_83, L18_84, L19_85)
              L16_82 = 3
              L17_83 = "Guest User authentication Failed"
              return L16_82, L17_83
            else
              L16_82 = login
              L16_82 = L16_82.verifyUserType
              L17_83 = L2_68
              L18_84 = "0"
              L16_82 = L16_82(L17_83, L18_84)
              if L16_82 then
                L16_82 = loginLuaLib
                L16_82 = L16_82.luaLoginEventHandler
                L17_83 = "Login - User authentication Failed. Use the correct SSL portal URL to login for "
                L18_84 = L2_68
                L19_85 = " user."
                L17_83 = L17_83 .. L18_84 .. L19_85
                L18_84 = 3
                L19_85 = "LOGIN"
                L16_82(L17_83, L18_84, L19_85)
                L16_82 = 3
                L17_83 = L1_67.SSLVPN_USER_AUTH_FAILED
                L17_83 = L17_83 or "i18nHTMLMissing"
                return L16_82, L17_83
              end
            end
          end
        end
      else
        L15_81 = db
        L15_81 = L15_81.getAttribute
        L16_82 = "SSLVPNPortalLayout"
        L17_83 = "DefaultPortal"
        L18_84 = "2"
        L19_85 = "PortalLayoutName"
        L15_81 = L15_81(L16_82, L17_83, L18_84, L19_85)
        if L15_81 == nil then
          L16_82 = db
          L16_82 = L16_82.getAttribute
          L17_83 = "SSLVPNPortalLayout"
          L18_84 = "DefaultPortal"
          L19_85 = "1"
          L20_86 = "PortalLayoutName"
          L16_82 = L16_82(L17_83, L18_84, L19_85, L20_86)
          L15_81 = L16_82
        end
        if L15_81 ~= L14_80 then
          L16_82 = loginLuaLib
          L16_82 = L16_82.luaLoginEventHandler
          L17_83 = "Login - User authentication Failed. Only default portals users should be allowed to login."
          L18_84 = 4
          L19_85 = "LOGIN"
          L16_82(L17_83, L18_84, L19_85)
          L16_82 = 3
          L17_83 = L1_67.USER_AUTH_FAILED
          L17_83 = L17_83 or "i18nHTMLMissing"
          return L16_82, L17_83
        end
      end
      L15_81 = sslvpnLuaLib
      L15_81 = L15_81.sslLoginPolicyVerify
      L16_82 = L2_68
      L17_83 = SAPI
      L17_83 = L17_83.Request
      L17_83 = L17_83.servervariable
      L18_84 = "REMOTE_ADDR"
      L17_83 = L17_83(L18_84)
      L18_84 = SAPI
      L18_84 = L18_84.Request
      L18_84 = L18_84.servervariable
      L19_85 = "SERVER_ADDR"
      L18_84 = L18_84(L19_85)
      L19_85 = L4_70
      L16_82 = L15_81(L16_82, L17_83, L18_84, L19_85)
      if L15_81 == -1 then
        L17_83 = sslvpnLuaLib
        L17_83 = L17_83.errMap
        if L17_83 ~= nil then
          L17_83 = sslvpnLuaLib
          L17_83 = L17_83.errMap
          L18_84 = L16_82
          L18_84 = L17_83(L18_84)
          L16_82 = L18_84
          L15_81 = L17_83
        end
        L17_83 = 3
        L18_84 = L16_82
        return L17_83, L18_84
      end
      if L10_76 == "1" then
        L17_83 = io
        L17_83 = L17_83.open
        L18_84 = "/var/log/"
        L19_85 = L2_68
        L20_86 = ".lockTime"
        L18_84 = L18_84 .. L19_85 .. L20_86
        L19_85 = "r"
        L17_83 = L17_83(L18_84, L19_85)
        L18_84 = timeLib
        L18_84 = L18_84.uptime
        L19_85 = L18_84()
        if L17_83 ~= nil then
          L21_87 = L17_83
          L20_86 = L17_83.read
          L22_88 = "*line"
          L20_86 = L20_86(L21_87, L22_88)
          if L20_86 ~= nil then
            L21_87 = L19_85 - L20_86
            L22_88 = db
            L22_88 = L22_88.getAttribute
            L23_89 = "GroupAccessControl"
            L24_90 = "GroupId"
            L25_91 = L9_75
            L22_88 = L22_88(L23_89, L24_90, L25_91, "LockPeriod")
            L23_89 = tonumber
            L24_90 = L22_88
            L23_89 = L23_89(L24_90)
            if L21_87 < L23_89 then
              L23_89 = false
              result = L23_89
              L23_89 = L1_67.USER_LOCKED
              L23_89 = L23_89 or "i18nHTMLMissing"
              statusCode = L23_89
              L23_89 = loginLuaLib
              L23_89 = L23_89.luaLoginEventHandler
              L24_90 = statusCode
              L25_91 = 3
              L23_89(L24_90, L25_91, "LOGIN")
              L23_89 = -1
              L24_90 = statusCode
              return L23_89, L24_90
            else
              L23_89 = os
              L23_89 = L23_89.execute
              L24_90 = "rm -rf /var/log/"
              L25_91 = L2_68
              L24_90 = L24_90 .. L25_91 .. ".lockTime"
              L23_89(L24_90)
            end
          end
        end
      end
      L17_83 = login
      L17_83 = L17_83.parseReferer
      L18_84 = os
      L18_84 = L18_84.getenv
      L19_85 = "HTTP_REFERER"
      L25_91 = L18_84(L19_85)
      L17_83 = L17_83(L18_84, L19_85, L20_86, L21_87, L22_88, L23_89, L24_90, L25_91, L18_84(L19_85))
      L18_84 = sslvpnLuaLib
      L18_84 = L18_84.sslLogin
      L19_85 = L2_68
      L20_86 = L3_69
      L21_87 = L13_79
      L22_88 = SAPI
      L22_88 = L22_88.Request
      L22_88 = L22_88.servervariable
      L23_89 = "REMOTE_ADDR"
      L22_88 = L22_88(L23_89)
      L23_89 = SAPI
      L23_89 = L23_89.Request
      L23_89 = L23_89.servervariable
      L24_90 = "SERVER_ADDR"
      L23_89 = L23_89(L24_90)
      L24_90 = L4_70
      L25_91 = SAPI
      L25_91 = L25_91.Request
      L25_91 = L25_91.servervariable
      L25_91 = L25_91("URL")
      L21_87 = L18_84(L19_85, L20_86, L21_87, L22_88, L23_89, L24_90, L25_91, L17_83)
      if L18_84 == -1 then
        if L10_76 == "1" then
          L22_88 = "UserName = '"
          L23_89 = L2_68
          L24_90 = "'"
          L22_88 = L22_88 .. L23_89 .. L24_90
          L23_89 = db
          L23_89 = L23_89.existsRowWhere
          L24_90 = "UserLoginFailure"
          L25_91 = L22_88
          L23_89 = L23_89(L24_90, L25_91)
          L24_90 = db
          L24_90 = L24_90.getAttribute
          L25_91 = "UserLoginFailure"
          L24_90 = L24_90(L25_91, "UserName", L2_68, "FailureCount")
          L25_91 = {}
          L25_91["UserLoginFailure.UserName"] = L2_68
          if L24_90 ~= nil then
            L24_90 = L24_90 + 1
            if L11_77 == tostring(L24_90) then
              os.execute("/pfrm2.0/bin/timeShow > /var/log/" .. L2_68 .. ".lockTime")
              L24_90 = 0
            end
            L25_91["UserLoginFailure.FailureCount"] = L24_90
            if L23_89 then
              db.update("UserLoginFailure", L25_91, L23_89)
            end
          elseif L24_90 == nil then
            L25_91["UserLoginFailure.FailureCount"] = 1
            db.insert("UserLoginFailure", L25_91)
          end
        end
        L22_88 = login
        L22_88 = L22_88.verifyUserType
        L23_89 = L2_68
        L24_90 = "3"
        L22_88 = L22_88(L23_89, L24_90)
        if L22_88 then
          L22_88 = loginLuaLib
          L22_88 = L22_88.luaLoginEventHandler
          L23_89 = "Invalid Password for Admin User "
          L24_90 = L2_68
          L25_91 = "."
          L23_89 = L23_89 .. L24_90 .. L25_91
          L24_90 = 4
          L25_91 = "LOGIN"
          L22_88(L23_89, L24_90, L25_91)
          L22_88 = -1
          L23_89 = "Invalid Password for Admin User"
          return L22_88, L23_89
        else
          L22_88 = login
          L22_88 = L22_88.verifyUserType
          L23_89 = L2_68
          L24_90 = "4"
          L22_88 = L22_88(L23_89, L24_90)
          if L22_88 then
            L22_88 = loginLuaLib
            L22_88 = L22_88.luaLoginEventHandler
            L23_89 = "Invalid Password for Guest User "
            L24_90 = L2_68
            L25_91 = "."
            L23_89 = L23_89 .. L24_90 .. L25_91
            L24_90 = 4
            L25_91 = "LOGIN"
            L22_88(L23_89, L24_90, L25_91)
            L22_88 = -1
            L23_89 = "Invalid Password for Guest User"
            return L22_88, L23_89
          else
            L22_88 = login
            L22_88 = L22_88.verifyUserType
            L23_89 = L2_68
            L24_90 = "0"
            L22_88 = L22_88(L23_89, L24_90)
            if L22_88 then
              L22_88 = loginLuaLib
              L22_88 = L22_88.luaLoginEventHandler
              L23_89 = "Invalid Password for LOGIN User "
              L24_90 = L2_68
              L25_91 = "."
              L23_89 = L23_89 .. L24_90 .. L25_91
              L24_90 = 4
              L25_91 = "LOGIN"
              L22_88(L23_89, L24_90, L25_91)
              L22_88 = -1
              L23_89 = "Invalid Password for SSLVPN User"
              return L22_88, L23_89
            end
          end
        end
      elseif L18_84 == 0 then
        L22_88 = cgilua
        L22_88 = L22_88.cookies
        L22_88 = L22_88.set
        L23_89 = "TeamF1Login"
        L24_90 = L19_85
        L22_88(L23_89, L24_90)
        ACCESS_LEVEL = L21_87
        L22_88 = db
        L22_88 = L22_88.setAttribute
        L23_89 = "UserLoginFailure"
        L24_90 = "UserName"
        L25_91 = L2_68
        L22_88(L23_89, L24_90, L25_91, "FailureCount", 0)
        L22_88 = 0
        L23_89 = "OK"
        L24_90 = nil
        L25_91 = L19_85
        return L22_88, L23_89, L24_90, L25_91
      elseif L18_84 == -2 then
        L22_88 = 1
        L23_89 = L20_86
        L24_90 = A0_66
        return L22_88, L23_89, L24_90
      elseif L18_84 == -4 then
        L22_88 = cgilua
        L22_88 = L22_88.cookies
        L22_88 = L22_88.set
        L23_89 = "TeamF1Login"
        L24_90 = L19_85
        L22_88(L23_89, L24_90)
        ACCESS_LEVEL = L21_87
        L22_88 = 2
        L23_89 = L20_86
        return L22_88, L23_89
      else
        L22_88 = 3
        L23_89 = L20_86
        return L22_88, L23_89
      end
    end
  end
  if L7_73 == false then
    L8_74 = db
    L8_74 = L8_74.getAttribute
    L9_75 = "SSLVPNPortalLayout"
    L10_76 = "PortalLayoutName"
    L11_77 = L5_71
    L12_78 = "profileName"
    L8_74 = L8_74(L9_75, L10_76, L11_77, L12_78)
    L9_75 = db
    L9_75 = L9_75.getAttribute
    L10_76 = "LoginProfiles"
    L11_77 = "configurationName"
    L12_78 = L8_74
    L13_79 = "errorMessage"
    L9_75 = L9_75(L10_76, L11_77, L12_78, L13_79)
    if L9_75 == nil or L9_75 == "" or L9_75 == " " then
      L10_76 = L1_67.USER_LOGIN_INVALID_PASSWORD
      L9_75 = L10_76 or "i18nHTMLMissing"
    end
    L10_76 = -1
    L11_77 = L9_75
    return L10_76, L11_77
  end
  L8_74 = -1
  L9_75 = statusCode
  return L8_74, L9_75
end
function sslAdmin.loginxml(A0_92)
  local L1_93, L2_94, L3_95, L4_96, L5_97, L6_98, L7_99, L8_100, L9_101, L10_102, L11_103, L12_104, L13_105, L14_106, L15_107, L16_108
  L1_93 = "SSLVPN_PORTAL_INFO_FIND_FAILED,SSLVPN_USER_AUTH_FAILED,USER_AUTH_FAILED,USER_LOGIN_INVALID_PASSWORD"
  L2_94 = db
  L2_94 = L2_94.getString
  L3_95 = L1_93
  L2_94 = L2_94(L3_95)
  L1_93 = L2_94
  L2_94 = A0_92["Users.UserName"]
  L3_95 = A0_92["Users.Password"]
  L4_96 = A0_92["Login.userAgent"]
  L5_97 = db
  L5_97 = L5_97.getRow
  L6_98 = "Users"
  L7_99 = "UserName"
  L8_100 = L2_94
  L5_97 = L5_97(L6_98, L7_99, L8_100)
  if L5_97 ~= nil then
    L6_98 = {}
  elseif L5_97 == L6_98 then
    L6_98 = sslvpnLuaLib
    L6_98 = L6_98.logFailedLogin
    L7_99 = L2_94
    L6_98 = L6_98(L7_99)
  end
  L6_98 = false
  if L5_97 ~= nil then
    L7_99 = db
    L7_99 = L7_99.getAttribute
    L8_100 = "Users"
    L9_101 = "UserName"
    L10_102 = L2_94
    L11_103 = "GroupId"
    L7_99 = L7_99(L8_100, L9_101, L10_102, L11_103)
    L7_99 = L7_99 or ""
    L8_100 = db
    L8_100 = L8_100.getAttribute
    L9_101 = "UserGroups"
    L10_102 = "GroupId"
    L11_103 = L7_99
    L12_104 = "GroupName"
    L8_100 = L8_100(L9_101, L10_102, L11_103, L12_104)
    L9_101 = db
    L9_101 = L9_101.getAttribute
    L10_102 = "UserGroups"
    L11_103 = "GroupName"
    L12_104 = L8_100
    L13_105 = "DomainName"
    L9_101 = L9_101(L10_102, L11_103, L12_104, L13_105)
    L9_101 = L9_101 or ""
    L10_102 = db
    L10_102 = L10_102.getAttribute
    L11_103 = "USERDBDomains"
    L12_104 = "DomainName"
    L13_105 = L9_101
    L14_106 = "PortalLayoutName"
    L10_102 = L10_102(L11_103, L12_104, L13_105, L14_106)
    L11_103 = Page
    L12_104 = SSL_PORTAL_LOGIN_PAGE
    if L11_103 == L12_104 then
      L11_103 = A0_92["Login.PortalName"]
      if L11_103 == nil then
        L12_104 = 3
        L13_105 = L1_93.SSLVPN_PORTAL_INFO_FIND_FAILED
        L13_105 = L13_105 or "i18nHTMLMissing"
        return L12_104, L13_105
      elseif L11_103 ~= L10_102 then
        L12_104 = login
        L12_104 = L12_104.verifyUserType
        L13_105 = L2_94
        L14_106 = "3"
        L12_104 = L12_104(L13_105, L14_106)
        if L12_104 then
          L12_104 = 3
          L13_105 = "10185"
          return L12_104, L13_105
        else
          L12_104 = login
          L12_104 = L12_104.verifyUserType
          L13_105 = L2_94
          L14_106 = "4"
          L12_104 = L12_104(L13_105, L14_106)
          if L12_104 then
            L12_104 = 3
            L13_105 = "10894"
            return L12_104, L13_105
          else
            L12_104 = login
            L12_104 = L12_104.verifyUserType
            L13_105 = L2_94
            L14_106 = "0"
            L12_104 = L12_104(L13_105, L14_106)
            if L12_104 then
              L12_104 = 3
              L13_105 = L1_93.SSLVPN_USER_AUTH_FAILED
              L13_105 = L13_105 or "i18nHTMLMissing"
              return L12_104, L13_105
            end
          end
        end
      end
    else
      L11_103 = db
      L11_103 = L11_103.getAttribute
      L12_104 = "SSLVPNPortalLayout"
      L13_105 = "DefaultPortal"
      L14_106 = "2"
      L15_107 = "PortalLayoutName"
      L11_103 = L11_103(L12_104, L13_105, L14_106, L15_107)
      if L11_103 == nil then
        L12_104 = db
        L12_104 = L12_104.getAttribute
        L13_105 = "SSLVPNPortalLayout"
        L14_106 = "DefaultPortal"
        L15_107 = "1"
        L16_108 = "PortalLayoutName"
        L12_104 = L12_104(L13_105, L14_106, L15_107, L16_108)
        L11_103 = L12_104
      end
      if L11_103 ~= L10_102 then
        L12_104 = 3
        L13_105 = L1_93.USER_AUTH_FAILED
        L13_105 = L13_105 or "i18nHTMLMissing"
        return L12_104, L13_105
      end
    end
    L11_103 = sslvpnLuaLib
    L11_103 = L11_103.sslLoginPolicyVerify
    L12_104 = L2_94
    L13_105 = SAPI
    L13_105 = L13_105.Request
    L13_105 = L13_105.servervariable
    L14_106 = "REMOTE_ADDR"
    L13_105 = L13_105(L14_106)
    L14_106 = SAPI
    L14_106 = L14_106.Request
    L14_106 = L14_106.servervariable
    L15_107 = "SERVER_ADDR"
    L14_106 = L14_106(L15_107)
    L15_107 = L4_96
    L12_104 = L11_103(L12_104, L13_105, L14_106, L15_107)
    if L11_103 == -1 then
      L13_105 = 3
      L14_106 = L12_104
      return L13_105, L14_106
    end
    L13_105 = login
    L13_105 = L13_105.parseReferer
    L14_106 = os
    L14_106 = L14_106.getenv
    L15_107 = "HTTP_REFERER"
    L16_108 = L14_106(L15_107)
    L13_105 = L13_105(L14_106, L15_107, L16_108, L14_106(L15_107))
    L14_106 = sslvpnLuaLib
    L14_106 = L14_106.sslLogin
    L15_107 = L2_94
    L16_108 = L3_95
    L16_108 = L14_106(L15_107, L16_108, L9_101, SAPI.Request.servervariable("REMOTE_ADDR"), SAPI.Request.servervariable("SERVER_ADDR"), L4_96, SAPI.Request.servervariable("URL"), L13_105)
    if L14_106 == -1 then
      if login.verifyUserType(L2_94, "3") then
        return -1, "11040"
      elseif login.verifyUserType(L2_94, "4") then
        return -1, "11041"
      elseif login.verifyUserType(L2_94, "0") then
        return -1, "11042"
      end
    elseif L14_106 == 0 then
      ACCESS_LEVEL = L14_106(L15_107, L16_108, L9_101, SAPI.Request.servervariable("REMOTE_ADDR"), SAPI.Request.servervariable("SERVER_ADDR"), L4_96, SAPI.Request.servervariable("URL"), L13_105)
      return 0, "OK", nil, L15_107
    elseif L14_106 == -2 then
      return 1, L16_108, A0_92
    elseif L14_106 == -4 then
      cgilua.cookies.set("TeamF1Login", L15_107)
      ACCESS_LEVEL = L14_106(L15_107, L16_108, L9_101, SAPI.Request.servervariable("REMOTE_ADDR"), SAPI.Request.servervariable("SERVER_ADDR"), L4_96, SAPI.Request.servervariable("URL"), L13_105)
      return 2, L16_108
    else
      return 3, L16_108
    end
  end
  if L6_98 == false then
    L7_99 = L1_93.USER_LOGIN_INVALID_PASSWORD
    L7_99 = L7_99 or "i18nHTMLMissing"
    statusCode = L7_99
  end
  L7_99 = -1
  L8_100 = statusCode
  return L7_99, L8_100
end
function sslAdmin.forcedLogin(A0_109)
  local L1_110, L2_111, L3_112, L4_113, L5_114, L6_115, L7_116, L8_117, L9_118, L10_119, L11_120, L12_121, L13_122, L14_123, L15_124, L16_125, L17_126
  L1_110 = "USER_LOGIN_INVALID_PASSWORD,SSLVPN_PORTAL_INFO_FIND_FAILED"
  L2_111 = db
  L2_111 = L2_111.getString
  L3_112 = L1_110
  L2_111 = L2_111(L3_112)
  L1_110 = L2_111
  L2_111 = A0_109["Users.UserName"]
  L3_112 = A0_109["Users.Password"]
  L4_113 = A0_109["Login.userAgent"]
  L5_114 = A0_109["Login.Portal"]
  if L5_114 == nil then
    L6_115 = loginLuaLib
    L6_115 = L6_115.luaLoginEventHandler
    L7_116 = "Failed to find Portal Information."
    L8_117 = 3
    L9_118 = "LOGIN"
    L6_115(L7_116, L8_117, L9_118)
    L6_115 = 3
    L7_116 = L1_110.SSLVPN_PORTAL_INFO_FIND_FAILED
    L7_116 = L7_116 or "i18nHTMLMissing"
    return L6_115, L7_116
  end
  L6_115 = db
  L6_115 = L6_115.getAttribute
  L7_116 = "USERDBDomains"
  L8_117 = "PortalLayoutName"
  L9_118 = L5_114
  L10_119 = "AuthenticationType"
  L6_115 = L6_115(L7_116, L8_117, L9_118, L10_119)
  if L6_115 == nil then
    L7_116 = loginLuaLib
    L7_116 = L7_116.luaLoginEventHandler
    L8_117 = "Login - Invalid username or password."
    L9_118 = 3
    L10_119 = "LOGIN"
    L7_116(L8_117, L9_118, L10_119)
    L7_116 = -1
    L8_117 = L1_110.USER_LOGIN_INVALID_PASSWORD
    L8_117 = L8_117 or "i18nHTMLMissing"
    return L7_116, L8_117
  end
  L7_116, L8_117, L9_118 = nil, nil, nil
  L10_119 = false
  L11_120, L12_121, L13_122 = nil, nil, nil
  if L6_115 == "local" then
    L14_123 = db
    L14_123 = L14_123.getAttribute
    L15_124 = "Users"
    L16_125 = "UserName"
    L17_126 = L2_111
    L14_123 = L14_123(L15_124, L16_125, L17_126, "GroupId")
    L7_116 = L14_123 or ""
    L14_123 = db
    L14_123 = L14_123.getRow
    L15_124 = "Users"
    L16_125 = "UserName"
    L17_126 = L2_111
    L14_123 = L14_123(L15_124, L16_125, L17_126)
    L8_117 = L14_123
    if L8_117 ~= nil then
      L14_123 = {}
    elseif L8_117 == L14_123 then
      L14_123 = sslvpnLuaLib
      L14_123 = L14_123.logFailedLogin
      L15_124 = L2_111
      L14_123 = L14_123(L15_124)
      L15_124 = loginLuaLib
      L15_124 = L15_124.luaLoginEventHandler
      L16_125 = "Login - Invalid username: "
      L17_126 = L2_111
      L16_125 = L16_125 .. L17_126 .. "."
      L17_126 = 3
      L15_124(L16_125, L17_126, "LOGIN")
    end
    L14_123 = db
    L14_123 = L14_123.getAttribute
    L15_124 = "UserGroups"
    L16_125 = "GroupId"
    L17_126 = L7_116
    L14_123 = L14_123(L15_124, L16_125, L17_126, "GroupName")
    L11_120 = L14_123
    L14_123 = db
    L14_123 = L14_123.getAttribute
    L15_124 = "UserGroups"
    L16_125 = "GroupName"
    L17_126 = L11_120
    L14_123 = L14_123(L15_124, L16_125, L17_126, "DomainName")
    L12_121 = L14_123 or ""
    L14_123 = sslvpnLuaLib
    L14_123 = L14_123.sslLoginPolicyVerify
    L15_124 = L2_111
    L16_125 = SAPI
    L16_125 = L16_125.Request
    L16_125 = L16_125.servervariable
    L17_126 = "REMOTE_ADDR"
    L16_125 = L16_125(L17_126)
    L17_126 = SAPI
    L17_126 = L17_126.Request
    L17_126 = L17_126.servervariable
    L17_126 = L17_126("SERVER_ADDR")
    L15_124 = L14_123(L15_124, L16_125, L17_126, L4_113)
    L13_122 = L15_124
    L10_119 = L14_123
    if L10_119 == -1 then
      L14_123 = sslvpnLuaLib
      L14_123 = L14_123.errMap
      if L14_123 ~= nil then
        L14_123 = sslvpnLuaLib
        L14_123 = L14_123.errMap
        L15_124 = L13_122
        L15_124 = L14_123(L15_124)
        L13_122 = L15_124
        L10_119 = L14_123
      end
      L14_123 = 3
      L15_124 = L13_122
      return L14_123, L15_124
    end
  else
    L14_123 = db
    L14_123 = L14_123.getAttribute
    L15_124 = "USERDBDomains"
    L16_125 = "PortalLayoutName"
    L17_126 = L5_114
    L14_123 = L14_123(L15_124, L16_125, L17_126, "DomainName")
    L12_121 = L14_123
  end
  L14_123 = login
  L14_123 = L14_123.parseReferer
  L15_124 = os
  L15_124 = L15_124.getenv
  L16_125 = "HTTP_REFERER"
  L17_126 = L15_124(L16_125)
  L14_123 = L14_123(L15_124, L16_125, L17_126, L15_124(L16_125))
  L15_124 = sslvpnLuaLib
  L15_124 = L15_124.sslForcedLogin
  L16_125 = L2_111
  L17_126 = L3_112
  L17_126 = L15_124(L16_125, L17_126, L12_121, SAPI.Request.servervariable("REMOTE_ADDR"), SAPI.Request.servervariable("SERVER_ADDR"), L4_113, SAPI.Request.servervariable("URL"), L14_123)
  if L15_124 == -1 then
    loginLuaLib.luaLoginEventHandler("Login - Invalid username or password.", 3, "LOGIN")
    return -1, L1_110.USER_LOGIN_INVALID_PASSWORD or "i18nHTMLMissing"
  elseif L15_124 == 0 then
    cgilua.cookies.set("TeamF1Login", L16_125)
    ACCESS_LEVEL = L15_124(L16_125, L17_126, L12_121, SAPI.Request.servervariable("REMOTE_ADDR"), SAPI.Request.servervariable("SERVER_ADDR"), L4_113, SAPI.Request.servervariable("URL"), L14_123)
    return 0
  elseif L15_124 == -4 then
    cgilua.cookies.set("TeamF1Login", L16_125)
    ACCESS_LEVEL = L15_124(L16_125, L17_126, L12_121, SAPI.Request.servervariable("REMOTE_ADDR"), SAPI.Request.servervariable("SERVER_ADDR"), L4_113, SAPI.Request.servervariable("URL"), L14_123)
    return 2, L17_126
  else
    return 3, L17_126
  end
  if result == false then
    statusCode = L1_110.USER_LOGIN_INVALID_PASSWORD or "i18nHTMLMissing"
  end
  return -1, statusCode
end
function sslAdmin.forcedLoginXml(A0_127)
  local L1_128, L2_129, L3_130, L4_131, L5_132, L6_133, L7_134, L8_135, L9_136, L10_137, L11_138, L12_139, L13_140
  L1_128 = A0_127["Users.UserName"]
  L2_129 = A0_127["Users.Password"]
  L3_130 = A0_127["Login.userAgent"]
  L4_131 = db
  L4_131 = L4_131.getAttribute
  L5_132 = "Users"
  L6_133 = "UserName"
  L7_134 = L1_128
  L8_135 = "GroupId"
  L4_131 = L4_131(L5_132, L6_133, L7_134, L8_135)
  L4_131 = L4_131 or ""
  L5_132 = db
  L5_132 = L5_132.getRow
  L6_133 = "Users"
  L7_134 = "UserName"
  L8_135 = L1_128
  L5_132 = L5_132(L6_133, L7_134, L8_135)
  if L5_132 ~= nil then
    L6_133 = {}
  elseif L5_132 == L6_133 then
    L6_133 = sslvpnLuaLib
    L6_133 = L6_133.logFailedLogin
    L7_134 = L1_128
    L6_133 = L6_133(L7_134)
  end
  L6_133 = false
  if L5_132 ~= nil then
    L7_134 = db
    L7_134 = L7_134.getAttribute
    L8_135 = "UserGroups"
    L9_136 = "GroupId"
    L10_137 = L4_131
    L11_138 = "GroupName"
    L7_134 = L7_134(L8_135, L9_136, L10_137, L11_138)
    L8_135 = db
    L8_135 = L8_135.getAttribute
    L9_136 = "UserGroups"
    L10_137 = "GroupName"
    L11_138 = L7_134
    L12_139 = "DomainName"
    L8_135 = L8_135(L9_136, L10_137, L11_138, L12_139)
    L8_135 = L8_135 or ""
    L9_136 = sslvpnLuaLib
    L9_136 = L9_136.sslLoginPolicyVerify
    L10_137 = L1_128
    L11_138 = SAPI
    L11_138 = L11_138.Request
    L11_138 = L11_138.servervariable
    L12_139 = "REMOTE_ADDR"
    L11_138 = L11_138(L12_139)
    L12_139 = SAPI
    L12_139 = L12_139.Request
    L12_139 = L12_139.servervariable
    L13_140 = "SERVER_ADDR"
    L12_139 = L12_139(L13_140)
    L13_140 = L3_130
    L10_137 = L9_136(L10_137, L11_138, L12_139, L13_140)
    if L9_136 == -1 then
      L11_138 = 3
      L12_139 = L10_137
      return L11_138, L12_139
    end
    L11_138 = sslvpnLuaLib
    L11_138 = L11_138.sslForcedLogin
    L12_139 = L1_128
    L13_140 = L2_129
    L13_140 = L11_138(L12_139, L13_140, L8_135, SAPI.Request.servervariable("REMOTE_ADDR"), SAPI.Request.servervariable("SERVER_ADDR"), L3_130, SAPI.Request.servervariable("URL"))
    if L11_138 == -1 then
      return -1, "11061"
    elseif L11_138 == 0 then
      ACCESS_LEVEL = L11_138(L12_139, L13_140, L8_135, SAPI.Request.servervariable("REMOTE_ADDR"), SAPI.Request.servervariable("SERVER_ADDR"), L3_130, SAPI.Request.servervariable("URL"))
      return 0, "OK", nil, L12_139
    elseif L11_138 == -4 then
      ACCESS_LEVEL = L11_138(L12_139, L13_140, L8_135, SAPI.Request.servervariable("REMOTE_ADDR"), SAPI.Request.servervariable("SERVER_ADDR"), L3_130, SAPI.Request.servervariable("URL"))
      return 2, L13_140
    else
      return 3, L13_140
    end
  end
  L7_134 = result
  if L7_134 == false then
    L7_134 = "11061"
    statusCode = L7_134
  end
  L7_134 = -1
  L8_135 = statusCode
  return L7_134, L8_135
end
function sslAdmin.logout(A0_141, A1_142)
  local L2_143
  if A0_141 ~= nil then
    L2_143 = db
    L2_143 = L2_143.escape
    L2_143 = L2_143(A0_141)
    A0_141 = L2_143
    L2_143 = "LoginAddress = '"
    L2_143 = L2_143 .. A1_142 .. "' AND Cookie = '" .. A0_141 .. "'"
    ACCESS_LEVEL = 1
    db.deleteRowWhere("SSLVPNActiveUsers", L2_143)
    loginLuaLib.luaLoginEventHandler("Login - deleting the session for " .. A1_142 .. ".", 3, "LOGIN")
    cgilua.cookies.set("TeamF1Login", cgilua.cookies.get("TeamF1Login"), {expires = -1})
    return 0
  else
    L2_143 = 1
    return L2_143
  end
end
function sslAdmin.logoutxml(A0_144, A1_145)
  local L2_146
  if A0_144 ~= nil then
    L2_146 = db
    L2_146 = L2_146.escape
    L2_146 = L2_146(A0_144)
    A0_144 = L2_146
    L2_146 = "LoginAddress = '"
    L2_146 = L2_146 .. A1_145 .. "' AND Cookie = '" .. A0_144 .. "'"
    ACCESS_LEVEL = 1
    db.deleteRowWhere("SSLVPNActiveUsers", L2_146)
    return 0
  else
    L2_146 = 1
    return L2_146
  end
end
function sslAdmin.refererValidation(A0_147, A1_148, A2_149)
  local L3_150
  if A0_147 ~= nil and A1_148 ~= nil then
    L3_150 = "LoginAddress = '"
    L3_150 = L3_150 .. A1_148 .. "' AND Cookie = '" .. A0_147 .. "'"
    if db.getRowWhere("SSLVPNActiveUsers", L3_150) == nil then
      return true
    elseif db.getRowWhere("SSLVPNActiveUsers", L3_150)["SSLVPNActiveUsers.RefererValue"] ~= nil and db.getRowWhere("SSLVPNActiveUsers", L3_150)["SSLVPNActiveUsers.RefererValue"] ~= A2_149 then
      return false
    end
  end
  L3_150 = true
  return L3_150
end
function sslAdmin.portalListGet()
  local L0_151
  L0_151 = {}
  L0_151 = db.getTable("SSLVPNPortalLayout")
  return L0_151
end
function sslAdmin.portalNameValidate(A0_152)
  if A0_152 == nil then
    return 1
  end
  if db.existsRow(_UPVALUE0_, _UPVALUE1_, A0_152) == false then
    return 1
  end
  return 0
end
function sslAdmin.portalNameEscapeValidate(A0_153)
  if A0_153 == nil then
    return nil
  end
  A0_153 = db.escape(A0_153)
  return A0_153
end
