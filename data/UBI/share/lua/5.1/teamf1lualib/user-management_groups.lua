local L0_0
L0_0 = module
L0_0("com.teamf1.core.user-management.groups", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/userdb_validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/userdb_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
groupsTable = "UserGroups"
loginPolicyTable = "GroupAccessControl"
browserpoliciesTable = "AccessControlUserGroupPolicyBrowser"
networkpoliciesTable = "AccessControlUserGroupPolicyIPAddress"
sslVpnTable = "USERDBDomains"
ldapTable = "LDAPSettings"
ntdomainTable = "NTDomainSettings"
radiusTable = "radiusClient"
adServerTable = "ActiveDirectorySettings"
popTable = "POPProfiles"
sslPortalLayoutTable = "SSLVPNPortalLayout"
usersTable = "Users"
openvpngroupsTable = "OpenVpnUserGroups"
attribute = {}
attribute.groupId = "GroupId"
attribute.name = "GroupName"
attribute.description = "Description"
attribute.login = "DenyLogin"
attribute.wanLogin = "DenyLoginFromWan"
attribute.timeOut = "GroupTimeOut"
attribute.usertimeOut = "UserTimeOut"
attribute.lockOut = "LockoutEnable"
attribute.maxLockOut = "MaxLockoutAttempts"
attribute.lockPeriod = "LockPeriod"
attribute.ipLogin = "LoginFromIP"
attribute.browserLogin = "LoginFromBrowser"
attribute.defaultGroup = "DefaultGroup"
attribute.capabilities = "Capabilities"
attribute.policyId = "_ROWID_"
attribute.networkPolicyType = "LoginFromIP"
attribute.addressType = "AddressType"
attribute.address = "Address"
attribute.maskLength = "MaskLength"
attribute.browser = "ClientBrowserName"
attribute.browserPolicyType = "LoginFromBrowser"
attribute.domain = "DomainName"
attribute.portal = "PortalLayoutName"
attribute.authType = "AuthenticationType"
attribute.profile = "AuthProfile"
attribute.primaryServer = "AuthenticationServer"
attribute.secondaryServer = "SecondAuthenticationServer"
attribute.tertiaryServer = "ThirdAuthenticationServer"
attribute.authTimeOut = "TimeOut"
attribute.retries = "Retries"
attribute.radiusPrimarySecret = "AuthenticationRadiusSecret"
attribute.radiusSecondarySecret = "SecondAuthenticationRadiusSecret"
attribute.radiusTertiarySecret = "ThirdAuthenticationRadiusSecret"
attribute.primaryPort = "AuthenticationPort"
attribute.secondaryPort = "SecondAuthenticationPort"
attribute.tertiaryPort = "ThirdAuthenticationPort"
attribute.ntPrimaryDomain = "NTDomainWorkGroup"
attribute.ntSecondaryDomain = "NTDomainSecondWorkGroup"
attribute.ntTertiaryDomain = "ThirdNTDomainWorkGroup"
attribute.ldapPrimaryDomain = "LDAPBaseDN"
attribute.ldapSecondaryDomain = "SecondLDAPBaseDN"
attribute.ldapTertiaryDomain = "ThirdLDAPBaseDN"
attribute.adPrimaryDomain = "ActiveDirectoryDomain"
attribute.adSecondaryDomain = "SecondActiveDirectoryDomain"
attribute.adTertiaryDomain = "ThirdActiveDirectoryDomain"
attribute.primarySSL = "SSLEnable"
attribute.primaryCAfile = "CAFile"
attribute.secondarySSL = "SecondSSLEnable"
attribute.secondaryCAfile = "SecondCAFile"
attribute.tertiarySSL = "ThirdSSLEnable"
attribute.tertiaryCAfile = "ThirdCAFile"
attribute.defaultDomain = "DefaultDomain"
attribute.useCount = "UseCount"
attribute.GroupName = "GroupName"
groupTimeOut = 10
lockOut = 1
maxLockOut = 3
lockPeriod = 60
ipLogin = 0
browserLogin = 0
FALSE = false
NIL = nil
ALLOW = "allow"
DENY = "deny"
NAME_MAXLEN = 32
NAME_MINLEN = 0
DESC_MAXLEN = 946
DESC_MINLEN = 0
ROWID = "_ROWID_"
if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-1000" or UNIT_NAME == "DSR-1000N" then
elseif UNIT_NAME == "DSR-500AC" or UNIT_NAME == "DSR-500" or UNIT_NAME == "DSR-500N" then
elseif UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-250N" then
else
end
function nameGet()
  local L0_1, L1_2, L2_3
  L0_1 = getFirstCookie
  L1_2 = attribute
  L1_2 = L1_2.groupId
  L2_3 = groupsTable
  L1_2 = L0_1(L1_2, L2_3)
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.SUCCESS
  if L0_1 ~= L2_3 then
    return L0_1
  end
  L2_3 = db
  L2_3 = L2_3.getAttribute
  L2_3 = L2_3(groupsTable, attribute.groupId, L1_2, attribute.name)
  if L2_3 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_2, L2_3
end
function nameGetNext(A0_4)
  local L1_5, L2_6, L3_7, L4_8, L5_9, L6_10
  L1_5 = NIL
  if A0_4 == L1_5 then
    L1_5 = _UPVALUE0_
    L1_5 = L1_5.INVALID_ARGUMENT
    return L1_5
  end
  L1_5 = cookieValidate
  L2_6 = attribute
  L2_6 = L2_6.groupId
  L3_7 = A0_4
  L4_8 = groupsTable
  L2_6 = L1_5(L2_6, L3_7, L4_8)
  L3_7 = _UPVALUE0_
  L3_7 = L3_7.SUCCESS
  if L1_5 ~= L3_7 then
    return L1_5
  end
  L3_7 = getNextValidCookie
  L4_8 = attribute
  L4_8 = L4_8.groupId
  L5_9 = A0_4
  L6_10 = groupsTable
  L4_8 = L3_7(L4_8, L5_9, L6_10)
  L5_9 = _UPVALUE0_
  L5_9 = L5_9.SUCCESS
  if L3_7 ~= L5_9 then
    return L3_7
  end
  L5_9 = L4_8
  L6_10 = db
  L6_10 = L6_10.getAttribute
  L6_10 = L6_10(groupsTable, attribute.groupId, L5_9, attribute.name)
  if L6_10 == NIL then
    return _UPVALUE0_.FAILURE, A0_4
  end
  return _UPVALUE0_.SUCCESS, L4_8, L6_10
end
function nameSet(A0_11, A1_12)
  local L2_13, L3_14, L4_15, L5_16
  L2_13 = NIL
  if A0_11 == L2_13 then
    L2_13 = _UPVALUE0_
    L2_13 = L2_13.INVALID_ARGUMENT
    return L2_13
  end
  L2_13 = cookieValidate
  L3_14 = attribute
  L3_14 = L3_14.groupId
  L4_15 = A0_11
  L5_16 = groupsTable
  L3_14 = L2_13(L3_14, L4_15, L5_16)
  L4_15 = _UPVALUE0_
  L4_15 = L4_15.SUCCESS
  if L2_13 ~= L4_15 then
    return L2_13
  end
  L4_15 = NIL
  if A1_12 == L4_15 then
    L4_15 = _UPVALUE0_
    L4_15 = L4_15.INVALID_ARGUMENT
    return L4_15
  end
  L4_15 = string
  L4_15 = L4_15.len
  L5_16 = A1_12
  L4_15 = L4_15(L5_16)
  L5_16 = NAME_MAXLEN
  if not (L4_15 > L5_16) then
    L5_16 = NAME_MINLEN
  elseif L4_15 < L5_16 then
    L5_16 = _UPVALUE0_
    L5_16 = L5_16.INVALID_ARGUMENT
    return L5_16
  end
  L5_16 = A0_11
  if db.setAttribute(groupsTable, attribute.groupId, L5_16, attribute.name, A1_12) == NIL then
    return _UPVALUE0_.FAILURE, A0_11
  end
  return _UPVALUE0_.SUCCESS, A0_11
end
function nameDelete(A0_17, A1_18)
  local L2_19, L3_20, L4_21, L5_22
  L2_19 = NIL
  if A0_17 == L2_19 then
    L2_19 = _UPVALUE0_
    L2_19 = L2_19.INVALID_ARGUMENT
    return L2_19
  end
  L2_19 = cookieValidate
  L3_20 = attribute
  L3_20 = L3_20.groupId
  L4_21 = A0_17
  L5_22 = groupsTable
  L3_20 = L2_19(L3_20, L4_21, L5_22)
  L4_21 = _UPVALUE0_
  L4_21 = L4_21.SUCCESS
  if L2_19 ~= L4_21 then
    return L2_19
  end
  L4_21 = A0_17
  L5_22 = _UPVALUE1_
  if L4_21 ~= L5_22 then
    L5_22 = _UPVALUE2_
  elseif L4_21 == L5_22 then
    L5_22 = _UPVALUE0_
    L5_22 = L5_22.ERROR
    return L5_22
  end
  L5_22 = db
  L5_22 = L5_22.getAttribute
  L5_22 = L5_22(groupsTable, attribute.groupId, L4_21, ROWID)
  if db.deleteRow(groupsTable, ROWID, L5_22) == NIL then
    return _UPVALUE0_.FAILURE, A0_17
  end
  return _UPVALUE0_.SUCCESS, A0_17
end
function descriptionGet()
  local L0_23, L1_24, L2_25
  L0_23 = getFirstCookie
  L1_24 = attribute
  L1_24 = L1_24.groupId
  L2_25 = groupsTable
  L1_24 = L0_23(L1_24, L2_25)
  L2_25 = _UPVALUE0_
  L2_25 = L2_25.SUCCESS
  if L0_23 ~= L2_25 then
    return L0_23
  end
  L2_25 = db
  L2_25 = L2_25.getAttribute
  L2_25 = L2_25(groupsTable, attribute.groupId, L1_24, attribute.description)
  if L2_25 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_24, L2_25
end
function descriptionGetNext(A0_26)
  local L1_27, L2_28, L3_29, L4_30, L5_31, L6_32
  L1_27 = NIL
  if A0_26 == L1_27 then
    L1_27 = _UPVALUE0_
    L1_27 = L1_27.INVALID_ARGUMENT
    return L1_27
  end
  L1_27 = cookieValidate
  L2_28 = attribute
  L2_28 = L2_28.groupId
  L3_29 = A0_26
  L4_30 = groupsTable
  L2_28 = L1_27(L2_28, L3_29, L4_30)
  L3_29 = _UPVALUE0_
  L3_29 = L3_29.SUCCESS
  if L1_27 ~= L3_29 then
    return L1_27
  end
  L3_29 = getNextValidCookie
  L4_30 = attribute
  L4_30 = L4_30.groupId
  L5_31 = A0_26
  L6_32 = groupsTable
  L4_30 = L3_29(L4_30, L5_31, L6_32)
  L5_31 = _UPVALUE0_
  L5_31 = L5_31.SUCCESS
  if L3_29 ~= L5_31 then
    return L3_29
  end
  L5_31 = L4_30
  L6_32 = db
  L6_32 = L6_32.getAttribute
  L6_32 = L6_32(groupsTable, attribute.groupId, L5_31, attribute.description)
  if L6_32 == NIL then
    return _UPVALUE0_.FAILURE, A0_26
  end
  return _UPVALUE0_.SUCCESS, L4_30, L6_32
end
function descriptionSet(A0_33, A1_34)
  local L2_35, L3_36, L4_37, L5_38
  L2_35 = NIL
  if A0_33 == L2_35 then
    L2_35 = _UPVALUE0_
    L2_35 = L2_35.INVALID_ARGUMENT
    return L2_35
  end
  L2_35 = cookieValidate
  L3_36 = attribute
  L3_36 = L3_36.groupId
  L4_37 = A0_33
  L5_38 = groupsTable
  L3_36 = L2_35(L3_36, L4_37, L5_38)
  L4_37 = _UPVALUE0_
  L4_37 = L4_37.SUCCESS
  if L2_35 ~= L4_37 then
    return L2_35
  end
  L4_37 = NIL
  if A1_34 == L4_37 then
    L4_37 = _UPVALUE0_
    L4_37 = L4_37.INVALID_ARGUMENT
    return L4_37
  end
  L4_37 = string
  L4_37 = L4_37.len
  L5_38 = A1_34
  L4_37 = L4_37(L5_38)
  L5_38 = DESC_MAXLEN
  if not (L4_37 > L5_38) then
    L5_38 = DESC_MINLEN
  elseif L4_37 < L5_38 then
    L5_38 = _UPVALUE0_
    L5_38 = L5_38.INVALID_ARGUMENT
    return L5_38
  end
  L5_38 = A0_33
  if db.setAttribute(groupsTable, attribute.groupId, L5_38, attribute.description, A1_34) == NIL then
    return _UPVALUE0_.FAILURE, A0_33
  end
  return _UPVALUE0_.SUCCESS, A0_33
end
function loginGet()
  local L0_39, L1_40, L2_41
  L0_39 = getFirstCookie
  L1_40 = attribute
  L1_40 = L1_40.groupId
  L2_41 = groupsTable
  L1_40 = L0_39(L1_40, L2_41)
  L2_41 = _UPVALUE0_
  L2_41 = L2_41.SUCCESS
  if L0_39 ~= L2_41 then
    return L0_39
  end
  L2_41 = db
  L2_41 = L2_41.getAttribute
  L2_41 = L2_41(loginPolicyTable, attribute.groupId, L1_40, attribute.login)
  if L2_41 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_40, L2_41
end
function loginGetNext(A0_42)
  local L1_43, L2_44, L3_45, L4_46, L5_47, L6_48
  L1_43 = NIL
  if A0_42 == L1_43 then
    L1_43 = _UPVALUE0_
    L1_43 = L1_43.INVALID_ARGUMENT
    return L1_43
  end
  L1_43 = cookieValidate
  L2_44 = attribute
  L2_44 = L2_44.groupId
  L3_45 = A0_42
  L4_46 = loginPolicyTable
  L2_44 = L1_43(L2_44, L3_45, L4_46)
  L3_45 = _UPVALUE0_
  L3_45 = L3_45.SUCCESS
  if L1_43 ~= L3_45 then
    return L1_43
  end
  L3_45 = getNextValidCookie
  L4_46 = attribute
  L4_46 = L4_46.groupId
  L5_47 = A0_42
  L6_48 = loginPolicyTable
  L4_46 = L3_45(L4_46, L5_47, L6_48)
  L5_47 = _UPVALUE0_
  L5_47 = L5_47.SUCCESS
  if L3_45 ~= L5_47 then
    return L3_45
  end
  L5_47 = L4_46
  L6_48 = db
  L6_48 = L6_48.getAttribute
  L6_48 = L6_48(loginPolicyTable, attribute.groupId, L5_47, attribute.login)
  if L6_48 == NIL then
    return _UPVALUE0_.FAILURE, A0_42
  end
  return _UPVALUE0_.SUCCESS, L4_46, L6_48
end
function loginSet(A0_49, A1_50)
  local L2_51, L3_52, L4_53
  L2_51 = NIL
  if A0_49 == L2_51 then
    L2_51 = _UPVALUE0_
    L2_51 = L2_51.INVALID_ARGUMENT
    return L2_51
  end
  L2_51 = cookieValidate
  L3_52 = attribute
  L3_52 = L3_52.groupId
  L4_53 = A0_49
  L3_52 = L2_51(L3_52, L4_53, loginPolicyTable)
  L4_53 = _UPVALUE0_
  L4_53 = L4_53.SUCCESS
  if L2_51 ~= L4_53 then
    return L2_51
  end
  L4_53 = NIL
  if A1_50 == L4_53 then
    L4_53 = _UPVALUE0_
    L4_53 = L4_53.INVALID_ARGUMENT
    return L4_53
  end
  L4_53 = _UPVALUE1_
  if A1_50 ~= L4_53 then
    L4_53 = _UPVALUE2_
    if A1_50 ~= L4_53 then
      L4_53 = _UPVALUE0_
      L4_53 = L4_53.INVALID_ARGUMENT
      return L4_53
    end
  end
  L4_53 = A0_49
  if L4_53 == _UPVALUE3_ and A1_50 == _UPVALUE2_ then
    return _UPVALUE0_.ERROR
  end
  if db.setAttribute(loginPolicyTable, attribute.groupId, L4_53, attribute.login, A1_50) == NIL then
    return _UPVALUE0_.FAILURE, A0_49
  end
  return _UPVALUE0_.SUCCESS, A0_49
end
function iswanLoginEnabled()
  local L0_54, L1_55, L2_56
  L0_54 = getFirstCookie
  L1_55 = attribute
  L1_55 = L1_55.groupId
  L2_56 = loginPolicyTable
  L1_55 = L0_54(L1_55, L2_56)
  L2_56 = _UPVALUE0_
  L2_56 = L2_56.SUCCESS
  if L0_54 ~= L2_56 then
    return L0_54
  end
  L2_56 = db
  L2_56 = L2_56.getAttribute
  L2_56 = L2_56(loginPolicyTable, attribute.groupId, L1_55, attribute.wanLogin)
  if L2_56 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_55, L2_56
end
function iswanLoginEnabledNext(A0_57)
  local L1_58, L2_59, L3_60, L4_61, L5_62, L6_63
  L1_58 = NIL
  if A0_57 == L1_58 then
    L1_58 = _UPVALUE0_
    L1_58 = L1_58.INVALID_ARGUMENT
    return L1_58
  end
  L1_58 = cookieValidate
  L2_59 = attribute
  L2_59 = L2_59.groupId
  L3_60 = A0_57
  L4_61 = loginPolicyTable
  L2_59 = L1_58(L2_59, L3_60, L4_61)
  L3_60 = _UPVALUE0_
  L3_60 = L3_60.SUCCESS
  if L1_58 ~= L3_60 then
    return L1_58
  end
  L3_60 = getNextValidCookie
  L4_61 = attribute
  L4_61 = L4_61.groupId
  L5_62 = A0_57
  L6_63 = loginPolicyTable
  L4_61 = L3_60(L4_61, L5_62, L6_63)
  L5_62 = _UPVALUE0_
  L5_62 = L5_62.SUCCESS
  if L3_60 ~= L5_62 then
    return L3_60
  end
  L5_62 = L4_61
  L6_63 = db
  L6_63 = L6_63.getAttribute
  L6_63 = L6_63(loginPolicyTable, attribute.groupId, L5_62, attribute.wanLogin)
  if L6_63 == NIL then
    return _UPVALUE0_.FAILURE, A0_57
  end
  return _UPVALUE0_.SUCCESS, L4_61, L6_63
end
function wanLoginEnable(A0_64)
  local L1_65, L2_66, L3_67
  L1_65 = NIL
  if A0_64 == L1_65 then
    L1_65 = _UPVALUE0_
    L1_65 = L1_65.INVALID_ARGUMENT
    return L1_65
  end
  L1_65 = cookieValidate
  L2_66 = attribute
  L2_66 = L2_66.groupId
  L3_67 = A0_64
  L2_66 = L1_65(L2_66, L3_67, groupsTable)
  L3_67 = _UPVALUE0_
  L3_67 = L3_67.SUCCESS
  if L1_65 ~= L3_67 then
    return L1_65
  end
  L3_67 = A0_64
  if db.setAttribute(loginPolicyTable, attribute.groupId, L3_67, attribute.wanLogin, _UPVALUE1_) == NIL then
    return _UPVALUE0_.FAILURE, A0_64
  end
  return _UPVALUE0_.SUCCESS, A0_64
end
function wanLoginDisable(A0_68)
  local L1_69, L2_70, L3_71
  L1_69 = NIL
  if A0_68 == L1_69 then
    L1_69 = _UPVALUE0_
    L1_69 = L1_69.INVALID_ARGUMENT
    return L1_69
  end
  L1_69 = cookieValidate
  L2_70 = attribute
  L2_70 = L2_70.groupId
  L3_71 = A0_68
  L2_70 = L1_69(L2_70, L3_71, groupsTable)
  L3_71 = _UPVALUE0_
  L3_71 = L3_71.SUCCESS
  if L1_69 ~= L3_71 then
    return L1_69
  end
  L3_71 = A0_68
  if L3_71 == _UPVALUE1_ then
    return _UPVALUE0_.ERROR
  end
  if db.setAttribute(loginPolicyTable, attribute.groupId, L3_71, attribute.wanLogin, _UPVALUE2_) == NIL then
    return _UPVALUE0_.FAILURE, A0_68
  end
  return _UPVALUE0_.SUCCESS, A0_68
end
function groupGet()
  local L0_72, L1_73
  L0_72 = getFirstCookie
  L1_73 = attribute
  L1_73 = L1_73.groupId
  L1_73 = L0_72(L1_73, groupsTable)
  if L0_72 ~= _UPVALUE0_.SUCCESS then
    return L0_72
  end
  if db.getRow(groupsTable, attribute.groupId, L1_73) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_73, db.getRow(groupsTable, attribute.groupId, L1_73)[groupsTable .. "." .. attribute.name], db.getRow(groupsTable, attribute.groupId, L1_73)[groupsTable .. "." .. attribute.description]
end
function groupGetNext(A0_74)
  local L1_75, L2_76, L3_77, L4_78, L5_79
  L1_75 = NIL
  if A0_74 == L1_75 then
    L1_75 = _UPVALUE0_
    L1_75 = L1_75.INVALID_ARGUMENT
    return L1_75
  end
  L1_75 = cookieValidate
  L2_76 = attribute
  L2_76 = L2_76.groupId
  L3_77 = A0_74
  L4_78 = groupsTable
  L2_76 = L1_75(L2_76, L3_77, L4_78)
  L3_77 = _UPVALUE0_
  L3_77 = L3_77.SUCCESS
  if L1_75 ~= L3_77 then
    return L1_75
  end
  L3_77 = getNextValidCookie
  L4_78 = attribute
  L4_78 = L4_78.groupId
  L5_79 = A0_74
  L4_78 = L3_77(L4_78, L5_79, groupsTable)
  L5_79 = _UPVALUE0_
  L5_79 = L5_79.SUCCESS
  if L3_77 ~= L5_79 then
    return L3_77
  end
  L5_79 = L4_78
  if db.getRow(groupsTable, attribute.groupId, L5_79) == NIL then
    return _UPVALUE0_.FAILURE, A0_74
  end
  return _UPVALUE0_.SUCCESS, L4_78, db.getRow(groupsTable, attribute.groupId, L5_79)[groupsTable .. "." .. attribute.name], db.getRow(groupsTable, attribute.groupId, L5_79)[groupsTable .. "." .. attribute.description]
end
function groupSet(A0_80, A1_81, A2_82, A3_83, A4_84, A5_85)
  local L6_86, L7_87, L8_88, L9_89, L10_90, L11_91, L12_92, L13_93, L14_94, L15_95, L16_96, L17_97, L18_98, L19_99, L20_100, L21_101, L22_102, L23_103
  L6_86 = NIL
  if A0_80 == L6_86 then
    L6_86 = _UPVALUE0_
    L6_86 = L6_86.INVALID_ARGUMENT
    return L6_86
  end
  L6_86 = cookieValidate
  L7_87 = attribute
  L7_87 = L7_87.groupId
  L8_88 = A0_80
  L9_89 = groupsTable
  L7_87 = L6_86(L7_87, L8_88, L9_89)
  L8_88 = _UPVALUE0_
  L8_88 = L8_88.SUCCESS
  if L6_86 ~= L8_88 then
    return L6_86
  end
  L8_88 = NIL
  if A1_81 == L8_88 or A1_81 == "" then
    L8_88 = _UPVALUE1_
    L8_88 = L8_88.GROUPS_GROUPNAME_NIL
    return L8_88
  end
  L8_88 = string
  L8_88 = L8_88.len
  L9_89 = A1_81
  L8_88 = L8_88(L9_89)
  L9_89 = NAME_MAXLEN
  if not (L8_88 > L9_89) then
    L9_89 = NAME_MINLEN
  elseif L8_88 < L9_89 then
    L9_89 = _UPVALUE1_
    L9_89 = L9_89.GROUPS_GROUPNAME_INVALID
    return L9_89
  end
  L9_89 = NIL
  if A2_82 == L9_89 or A2_82 == "" then
    L9_89 = _UPVALUE1_
    L9_89 = L9_89.GROUPS_DESC_NIL
    return L9_89
  end
  L9_89 = string
  L9_89 = L9_89.len
  L10_90 = A2_82
  L9_89 = L9_89(L10_90)
  L10_90 = DESC_MAXLEN
  if not (L9_89 > L10_90) then
    L10_90 = DESC_MINLEN
  elseif L9_89 < L10_90 then
    L10_90 = _UPVALUE1_
    L10_90 = L10_90.GROUPS_DESC_INVALID
    return L10_90
  end
  L10_90 = NIL
  if A4_84 == L10_90 or A4_84 == "" then
    L10_90 = _UPVALUE1_
    L10_90 = L10_90.GROUPS_IDLE_TIMEOUT_NIL
    return L10_90
  end
  L10_90 = tonumber
  L11_91 = A4_84
  L10_90 = L10_90(L11_91)
  L11_91 = _UPVALUE2_
  if not (L10_90 < L11_91) then
    L11_91 = _UPVALUE3_
  elseif L10_90 > L11_91 then
    L11_91 = _UPVALUE1_
    L11_91 = L11_91.GROUPS_IDLE_TIMEOUT_INVALID
    return L11_91
  end
  L11_91 = A0_80
  L12_92 = db
  L12_92 = L12_92.getAttribute
  L13_93 = groupsTable
  L14_94 = attribute
  L14_94 = L14_94.groupId
  L12_92 = L12_92(L13_93, L14_94, L15_95, L16_96)
  L13_93 = NIL
  if L12_92 == L13_93 then
    L13_93 = _UPVALUE1_
    L13_93 = L13_93.GROUPS_GROUPID_INVALID
    return L13_93
  end
  L13_93 = {}
  L14_94 = groupsTable
  L14_94 = L14_94 .. L15_95 .. L16_96
  L13_93[L14_94] = A2_82
  L14_94 = groupsTable
  L14_94 = L14_94 .. L15_95 .. L16_96
  L13_93[L14_94] = A4_84
  L14_94 = groupsTable
  L14_94 = L14_94 .. L15_95 .. L16_96
  L13_93[L14_94] = A3_83
  if A5_85 ~= nil then
    L14_94 = groupsTable
    L14_94 = L14_94 .. L15_95 .. L16_96
    L13_93[L14_94] = A1_81
  end
  L14_94 = db
  L14_94 = L14_94.update
  L14_94 = L14_94(L15_95, L16_96, L17_97)
  for L18_98 in L15_95(L16_96, L17_97) do
    if L19_99 == 13 then
      L21_101 = attribute
      L21_101 = L21_101.name
      L22_102 = A1_81
      if L19_99 then
      else
        L21_101 = attribute
        L21_101 = L21_101.groupId
        L21_101 = {}
        L22_102 = openvpngroupsTable
        L23_103 = "."
        L22_102 = L22_102 .. L23_103 .. attribute.name
        L21_101[L22_102] = A1_81
        L22_102 = openvpngroupsTable
        L23_103 = "."
        L22_102 = L22_102 .. L23_103 .. attribute.groupId
        L21_101[L22_102] = L20_100
        L22_102 = db
        L22_102 = L22_102.insert
        L23_103 = openvpngroupsTable
        L22_102(L23_103, L21_101)
      end
    end
  end
  if L17_97 ~= L18_98 then
    for L21_101, L22_102 in L18_98(L19_99) do
      L23_103 = usersTable
      L23_103 = L23_103 .. "." .. attribute.usertimeOut
      L15_95[L23_103] = A4_84
      L23_103 = usersTable
      L23_103 = L23_103 .. "." .. "_ROWID_"
      L23_103 = L22_102[L23_103]
      if db.update(usersTable, L15_95, L23_103) == NIL then
        return _UPVALUE0_.FAILURE, A0_80
      end
    end
  end
  if L14_94 == L18_98 then
    return L18_98, L19_99
  end
  return L18_98, L19_99
end
function groupCreate(A0_104, A1_105, A2_106, A3_107, A4_108)
  local L5_109, L6_110, L7_111, L8_112, L9_113, L10_114, L11_115, L12_116, L13_117, L14_118, L15_119, L16_120, L17_121, L18_122, L19_123, L20_124, L21_125
  L5_109 = attribute
  L5_109 = L5_109.GroupName
  L6_110 = " !='Temp-CP'"
  L5_109 = L5_109 .. L6_110
  L6_110 = db
  L6_110 = L6_110.getRowsWhere
  L7_111 = groupsTable
  L8_112 = L5_109
  L6_110 = L6_110(L7_111, L8_112)
  if L6_110 ~= nil then
    L7_111 = #L6_110
    L8_112 = _UPVALUE0_
    if L7_111 >= L8_112 then
      L7_111 = _UPVALUE1_
      L7_111 = L7_111.MAX_LIMIT_REACHED
      return L7_111
    end
  end
  L7_111 = NIL
  if A0_104 == L7_111 or A0_104 == "" then
    L7_111 = _UPVALUE2_
    L7_111 = L7_111.GROUPS_GROUPNAME_NIL
    return L7_111
  end
  L7_111 = _UPVALUE3_
  if A0_104 == L7_111 then
    L7_111 = _UPVALUE2_
    L7_111 = L7_111.GROUP_NONE_NOT_ALLOWED
    return L7_111
  end
  L7_111 = string
  L7_111 = L7_111.len
  L8_112 = A0_104
  L7_111 = L7_111(L8_112)
  L8_112 = NAME_MAXLEN
  if not (L7_111 > L8_112) then
    L8_112 = NAME_MINLEN
  elseif L7_111 < L8_112 then
    L8_112 = _UPVALUE2_
    L8_112 = L8_112.GROUPS_GROUPNAME_INVALID
    return L8_112
  end
  L8_112 = NIL
  if A1_105 == L8_112 or A1_105 == "" then
    L8_112 = _UPVALUE2_
    L8_112 = L8_112.GROUPS_DESC_NIL
    return L8_112
  end
  L8_112 = string
  L8_112 = L8_112.len
  L9_113 = A1_105
  L8_112 = L8_112(L9_113)
  L9_113 = DESC_MAXLEN
  if not (L8_112 > L9_113) then
    L9_113 = DESC_MINLEN
  elseif L8_112 < L9_113 then
    L9_113 = _UPVALUE2_
    L9_113 = L9_113.GROUPS_DESC_INVALID
    return L9_113
  end
  L9_113 = NIL
  if A3_107 == L9_113 or A3_107 == "" then
    L9_113 = _UPVALUE2_
    L9_113 = L9_113.GROUPS_IDLE_TIMEOUT_NIL
    return L9_113
  end
  L9_113 = tonumber
  L10_114 = A3_107
  L9_113 = L9_113(L10_114)
  L10_114 = _UPVALUE4_
  if not (L9_113 < L10_114) then
    L10_114 = _UPVALUE5_
  elseif L9_113 > L10_114 then
    L10_114 = _UPVALUE2_
    L10_114 = L10_114.GROUPS_IDLE_TIMEOUT_INVALID
    return L10_114
  end
  L10_114 = getMaxId
  L11_115 = groupsTable
  L12_116 = attribute
  L12_116 = L12_116.groupId
  L11_115 = L10_114(L11_115, L12_116)
  L12_116 = _UPVALUE1_
  L12_116 = L12_116.SUCCESS
  if L10_114 ~= L12_116 then
    return L10_114
  end
  L11_115 = L11_115 + 1
  L12_116 = db
  L12_116 = L12_116.existsRow
  L13_117 = groupsTable
  L14_118 = attribute
  L14_118 = L14_118.name
  L15_119 = A0_104
  L12_116 = L12_116(L13_117, L14_118, L15_119)
  L13_117 = FALSE
  if L12_116 ~= L13_117 then
    L13_117 = _UPVALUE2_
    L13_117 = L13_117.GROUP_ALREADY_EXISTS
    return L13_117
  end
  L13_117 = {}
  L14_118 = groupsTable
  L15_119 = "."
  L16_120 = attribute
  L16_120 = L16_120.name
  L14_118 = L14_118 .. L15_119 .. L16_120
  L13_117[L14_118] = A0_104
  L14_118 = groupsTable
  L15_119 = "."
  L16_120 = attribute
  L16_120 = L16_120.description
  L14_118 = L14_118 .. L15_119 .. L16_120
  L13_117[L14_118] = A1_105
  L14_118 = groupsTable
  L15_119 = "."
  L16_120 = attribute
  L16_120 = L16_120.groupId
  L14_118 = L14_118 .. L15_119 .. L16_120
  L13_117[L14_118] = L11_115
  L14_118 = groupsTable
  L15_119 = "."
  L16_120 = attribute
  L16_120 = L16_120.timeOut
  L14_118 = L14_118 .. L15_119 .. L16_120
  L13_117[L14_118] = A3_107
  L14_118 = groupsTable
  L15_119 = "."
  L16_120 = attribute
  L16_120 = L16_120.capabilities
  L14_118 = L14_118 .. L15_119 .. L16_120
  L13_117[L14_118] = A2_106
  L14_118 = groupsTable
  L15_119 = "."
  L16_120 = attribute
  L16_120 = L16_120.defaultGroup
  L14_118 = L14_118 .. L15_119 .. L16_120
  L15_119 = _UPVALUE6_
  L13_117[L14_118] = L15_119
  L14_118 = NIL
  if A4_108 ~= L14_118 and A4_108 ~= "" then
    L14_118 = groupsTable
    L15_119 = "."
    L16_120 = attribute
    L16_120 = L16_120.domain
    L14_118 = L14_118 .. L15_119 .. L16_120
    L13_117[L14_118] = A0_104
  end
  L14_118 = db
  L14_118 = L14_118.insert
  L15_119 = groupsTable
  L16_120 = L13_117
  L14_118 = L14_118(L15_119, L16_120)
  L15_119 = NIL
  if L14_118 ~= L15_119 then
    L15_119 = openvpngetMaxId
    L16_120 = openvpngroupsTable
    L17_121 = attribute
    L17_121 = L17_121.groupId
    L16_120 = L15_119(L16_120, L17_121)
    L16_120 = L16_120 + 1
    L17_121 = {}
    for L21_125 in L18_122(L19_123, L20_124) do
      if tonumber(L21_125) == 13 then
        L17_121[openvpngroupsTable .. "." .. attribute.name] = A0_104
        L17_121[openvpngroupsTable .. "." .. attribute.groupId] = L16_120
        db.insert(openvpngroupsTable, L17_121)
      end
    end
  end
  L15_119 = NIL
  if L14_118 == L15_119 then
    L15_119 = _UPVALUE1_
    L15_119 = L15_119.FAILURE
    return L15_119
  end
  L15_119 = db
  L15_119 = L15_119.getAttribute
  L16_120 = groupsTable
  L17_121 = attribute
  L17_121 = L17_121.name
  L15_119 = L15_119(L16_120, L17_121, L18_122, L19_123)
  L16_120 = _UPVALUE1_
  L16_120 = L16_120.SUCCESS
  L17_121 = L15_119
  return L16_120, L17_121
end
function groupDelete(A0_126)
  local L1_127, L2_128, L3_129, L4_130, L5_131, L6_132
  L1_127 = NIL
  if A0_126 == L1_127 then
    L1_127 = _UPVALUE0_
    L1_127 = L1_127.INVALID_ARGUMENT
    return L1_127
  end
  L1_127 = cookieValidate
  L2_128 = attribute
  L2_128 = L2_128.groupId
  L3_129 = A0_126
  L4_130 = groupsTable
  L2_128 = L1_127(L2_128, L3_129, L4_130)
  L3_129 = _UPVALUE0_
  L3_129 = L3_129.SUCCESS
  if L1_127 ~= L3_129 then
    return L1_127
  end
  L3_129 = A0_126
  L4_130 = _UPVALUE1_
  if L3_129 ~= L4_130 then
    L4_130 = _UPVALUE2_
  elseif L3_129 == L4_130 then
    L4_130 = _UPVALUE3_
    L4_130 = L4_130.GROUPS_DEFAULT_GROUPS_ERROR
    return L4_130
  end
  L4_130 = db
  L4_130 = L4_130.getAttribute
  L5_131 = groupsTable
  L6_132 = attribute
  L6_132 = L6_132.groupId
  L4_130 = L4_130(L5_131, L6_132, L3_129, ROWID)
  L5_131 = NIL
  if L4_130 == L5_131 then
    L5_131 = _UPVALUE0_
    L5_131 = L5_131.FAILURE
    return L5_131
  end
  L5_131 = db
  L5_131 = L5_131.getAttribute
  L6_132 = groupsTable
  L5_131 = L5_131(L6_132, attribute.groupId, L3_129, attribute.name)
  L6_132 = db
  L6_132 = L6_132.getAttribute
  L6_132 = L6_132(openvpngroupsTable, attribute.name, L5_131, ROWID)
  if db.deleteRow(groupsTable, ROWID, L4_130) ~= NIL and L6_132 ~= nil then
    db.deleteRow(openvpngroupsTable, ROWID, L6_132)
  end
  if db.deleteRow(groupsTable, ROWID, L4_130) == NIL then
    return _UPVALUE0_.FAILURE, A0_126
  end
  return _UPVALUE0_.SUCCESS, A0_126
end
function loginPolicyGet()
  local L0_133, L1_134
  L0_133 = getFirstCookie
  L1_134 = attribute
  L1_134 = L1_134.groupId
  L1_134 = L0_133(L1_134, loginPolicyTable)
  if L0_133 ~= _UPVALUE0_.SUCCESS then
    return L0_133
  end
  if db.getRow(groupsTable, attribute.groupId, L1_134) == NIL then
    return _UPVALUE0_.FAILURE
  end
  if db.getRow(loginPolicyTable, attribute.groupId, L1_134) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_134, db.getRow(groupsTable, attribute.groupId, L1_134)[groupsTable .. "." .. attribute.name], db.getRow(groupsTable, attribute.groupId, L1_134)[groupsTable .. "." .. attribute.description], db.getRow(loginPolicyTable, attribute.groupId, L1_134)[loginPolicyTable .. "." .. attribute.login], db.getRow(loginPolicyTable, attribute.groupId, L1_134)[loginPolicyTable .. "." .. attribute.wanLogin]
end
function loginPolicyGetNext(A0_135)
  local L1_136, L2_137, L3_138, L4_139
  L1_136 = NIL
  if A0_135 == L1_136 then
    L1_136 = _UPVALUE0_
    L1_136 = L1_136.INVALID_ARGUMENT
    return L1_136
  end
  L1_136 = cookieValidate
  L2_137 = attribute
  L2_137 = L2_137.groupId
  L3_138 = A0_135
  L4_139 = loginPolicyTable
  L2_137 = L1_136(L2_137, L3_138, L4_139)
  L3_138 = _UPVALUE0_
  L3_138 = L3_138.SUCCESS
  if L1_136 ~= L3_138 then
    return L1_136
  end
  L3_138 = getNextValidCookie
  L4_139 = attribute
  L4_139 = L4_139.groupId
  L4_139 = L3_138(L4_139, A0_135, loginPolicyTable)
  if L3_138 ~= _UPVALUE0_.SUCCESS then
    return L3_138
  end
  if db.getRow(groupsTable, attribute.groupId, L4_139) == NIL then
    return _UPVALUE0_.FAILURE
  end
  if db.getRow(loginPolicyTable, attribute.groupId, L4_139) == NIL then
    return _UPVALUE0_.FAILURE, A0_135
  end
  return _UPVALUE0_.SUCCESS, L4_139, db.getRow(groupsTable, attribute.groupId, L4_139)[groupsTable .. "." .. attribute.name], db.getRow(groupsTable, attribute.groupId, L4_139)[groupsTable .. "." .. attribute.description], db.getRow(loginPolicyTable, attribute.groupId, L4_139)[loginPolicyTable .. "." .. attribute.login], db.getRow(loginPolicyTable, attribute.groupId, L4_139)[loginPolicyTable .. "." .. attribute.wanLogin]
end
function loginPolicySet(A0_140, A1_141, A2_142, A3_143, A4_144)
  local L5_145, L6_146, L7_147, L8_148, L9_149, L10_150
  L5_145 = NIL
  if A0_140 == L5_145 then
    L5_145 = _UPVALUE0_
    L5_145 = L5_145.INVALID_ARGUMENT
    return L5_145
  end
  L5_145 = cookieValidate
  L6_146 = attribute
  L6_146 = L6_146.groupId
  L7_147 = A0_140
  L8_148 = loginPolicyTable
  L6_146 = L5_145(L6_146, L7_147, L8_148)
  L7_147 = _UPVALUE0_
  L7_147 = L7_147.SUCCESS
  if L5_145 ~= L7_147 then
    return L5_145
  end
  L7_147 = NIL
  if A1_141 == L7_147 or A1_141 == "" then
    L7_147 = _UPVALUE1_
    L7_147 = L7_147.GROUPS_GROUPNAME_NIL
    return L7_147
  end
  L7_147 = string
  L7_147 = L7_147.len
  L8_148 = A1_141
  L7_147 = L7_147(L8_148)
  L8_148 = NAME_MAXLEN
  if not (L7_147 > L8_148) then
    L8_148 = NAME_MINLEN
  elseif L7_147 < L8_148 then
    L8_148 = _UPVALUE1_
    L8_148 = L8_148.GROUPS_GROUPNAME_INVALID
    return L8_148
  end
  L8_148 = NIL
  if A3_143 == L8_148 or A3_143 == "" then
    L8_148 = _UPVALUE1_
    L8_148 = L8_148.GROUPS_LOGIN_NIL
    return L8_148
  end
  L8_148 = _UPVALUE2_
  if A3_143 ~= L8_148 then
    L8_148 = _UPVALUE3_
    if A3_143 ~= L8_148 then
      L8_148 = _UPVALUE1_
      L8_148 = L8_148.GROUPS_LOGIN_INVALID
      return L8_148
    end
  end
  L8_148 = NIL
  if A4_144 == L8_148 or A4_144 == "" then
    L8_148 = _UPVALUE1_
    L8_148 = L8_148.GROUPS_WANLOGIN_NIL
    return L8_148
  end
  L8_148 = _UPVALUE4_
  L8_148 = L8_148.isBoolean
  L9_149 = A4_144
  L8_148 = L8_148(L9_149)
  valid = L8_148
  L8_148 = valid
  L9_149 = _UPVALUE0_
  L9_149 = L9_149.SUCCESS
  if L8_148 ~= L9_149 then
    L8_148 = _UPVALUE1_
    L8_148 = L8_148.GROUPS_WANLOGIN_INVALID
    return L8_148
  end
  L8_148 = A0_140
  L9_149 = _UPVALUE5_
  if L8_148 == L9_149 then
    L9_149 = _UPVALUE3_
    if A3_143 == L9_149 then
      L9_149 = _UPVALUE1_
      L9_149 = L9_149.DEFAULT_GROUPS_LOGIN_DENY_ERROR
      return L9_149
    end
  end
  L9_149 = db
  L9_149 = L9_149.getAttribute
  L10_150 = loginPolicyTable
  L9_149 = L9_149(L10_150, attribute.groupId, L8_148, ROWID)
  L10_150 = {}
  L10_150[loginPolicyTable .. "." .. attribute.login] = A3_143
  L10_150[loginPolicyTable .. "." .. attribute.wanLogin] = A4_144
  if db.update(loginPolicyTable, L10_150, L9_149) == NIL then
    return _UPVALUE0_.FAILURE, A0_140
  end
  return _UPVALUE0_.SUCCESS, A0_140
end
function loginPolicyCreate(A0_151, A1_152, A2_153, A3_154)
  local L4_155, L5_156, L6_157, L7_158, L8_159, L9_160
  L4_155 = NIL
  if A0_151 == L4_155 or A0_151 == "" then
    L4_155 = _UPVALUE0_
    L4_155 = L4_155.GROUPS_GROUPNAME_NIL
    return L4_155
  end
  L4_155 = string
  L4_155 = L4_155.len
  L5_156 = A0_151
  L4_155 = L4_155(L5_156)
  L5_156 = NAME_MAXLEN
  if not (L4_155 > L5_156) then
    L5_156 = NAME_MINLEN
  elseif L4_155 < L5_156 then
    L5_156 = _UPVALUE0_
    L5_156 = L5_156.GROUPS_GROUPNAME_INVALID
    return L5_156
  end
  L5_156 = db
  L5_156 = L5_156.getAttribute
  L6_157 = groupsTable
  L7_158 = attribute
  L7_158 = L7_158.name
  L8_159 = A0_151
  L9_160 = attribute
  L9_160 = L9_160.groupId
  L5_156 = L5_156(L6_157, L7_158, L8_159, L9_160)
  L6_157 = NIL
  if L5_156 == L6_157 then
    L6_157 = _UPVALUE1_
    L6_157 = L6_157.INVALID_ARGUMENT
    return L6_157
  end
  L6_157 = db
  L6_157 = L6_157.getAttribute
  L7_158 = groupsTable
  L8_159 = attribute
  L8_159 = L8_159.groupId
  L9_160 = L5_156
  L6_157 = L6_157(L7_158, L8_159, L9_160, attribute.capabilities)
  L7_158 = _UPVALUE2_
  if L6_157 == L7_158 then
    A2_153 = _UPVALUE3_
    A3_154 = _UPVALUE3_
  else
    L7_158 = NIL
    if A2_153 == L7_158 or A2_153 == "" then
      A2_153 = _UPVALUE4_
    end
    L7_158 = NIL
    if A3_154 == L7_158 or A3_154 == "" then
      A3_154 = _UPVALUE4_
    end
  end
  L7_158 = _UPVALUE5_
  if L5_156 == L7_158 then
    L7_158 = _UPVALUE3_
    if A2_153 == L7_158 then
      L7_158 = _UPVALUE0_
      L7_158 = L7_158.GROUPS_DEFAULT_GROUPS_ERROR
      return L7_158
    end
  end
  L7_158 = {}
  L8_159 = loginPolicyTable
  L9_160 = "."
  L8_159 = L8_159 .. L9_160 .. attribute.login
  L7_158[L8_159] = A2_153
  L8_159 = loginPolicyTable
  L9_160 = "."
  L8_159 = L8_159 .. L9_160 .. attribute.wanLogin
  L7_158[L8_159] = A3_154
  L8_159 = loginPolicyTable
  L9_160 = "."
  L8_159 = L8_159 .. L9_160 .. attribute.groupId
  L7_158[L8_159] = L5_156
  L8_159 = loginPolicyTable
  L9_160 = "."
  L8_159 = L8_159 .. L9_160 .. attribute.timeOut
  L9_160 = timeOut
  L7_158[L8_159] = L9_160
  L8_159 = loginPolicyTable
  L9_160 = "."
  L8_159 = L8_159 .. L9_160 .. attribute.lockOut
  L9_160 = lockOut
  L7_158[L8_159] = L9_160
  L8_159 = loginPolicyTable
  L9_160 = "."
  L8_159 = L8_159 .. L9_160 .. attribute.maxLockOut
  L9_160 = maxLockOut
  L7_158[L8_159] = L9_160
  L8_159 = loginPolicyTable
  L9_160 = "."
  L8_159 = L8_159 .. L9_160 .. attribute.lockPeriod
  L9_160 = lockPeriod
  L7_158[L8_159] = L9_160
  L8_159 = loginPolicyTable
  L9_160 = "."
  L8_159 = L8_159 .. L9_160 .. attribute.ipLogin
  L9_160 = ipLogin
  L7_158[L8_159] = L9_160
  L8_159 = loginPolicyTable
  L9_160 = "."
  L8_159 = L8_159 .. L9_160 .. attribute.browserLogin
  L9_160 = browserLogin
  L7_158[L8_159] = L9_160
  L8_159 = db
  L8_159 = L8_159.insert
  L9_160 = loginPolicyTable
  L8_159 = L8_159(L9_160, L7_158)
  L9_160 = NIL
  if L8_159 == L9_160 then
    L9_160 = _UPVALUE1_
    L9_160 = L9_160.FAILURE
    return L9_160
  end
  L9_160 = db
  L9_160 = L9_160.getAttribute
  L9_160 = L9_160(groupsTable, attribute.name, A0_151, attribute.groupId)
  if L9_160 == NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L9_160
end
function loginPolicyDelete(A0_161)
  if A0_161 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if cookieValidate(attribute.groupId, A0_161, loginPolicyTable) ~= _UPVALUE0_.SUCCESS then
    return cookieValidate(attribute.groupId, A0_161, loginPolicyTable)
  end
  if groupId == _UPVALUE1_ or groupId == _UPVALUE2_ then
    return _UPVALUE3_.GROUPS_DEFAULT_GROUPS_ERROR
  end
  if db.deleteRow(loginPolicyTable, attribute.groupId, A0_161) == NIL then
    return _UPVALUE0_.FAILURE, A0_161
  end
  return _UPVALUE0_.SUCCESS, A0_161
end
function groupGetAll()
  local L0_162
  L0_162 = db
  L0_162 = L0_162.getTable
  L0_162 = L0_162(groupsTable)
  if next(L0_162) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_162
end
function groupLoginGetAll()
  local L0_163, L1_164
  L0_163 = "select UserGroups.GroupId,UserGroups.GroupName, GroupAccessControl.DenyLogin from UserGroups, GroupAccessControl where UserGroups.GroupId=GroupAccessControl.GroupId"
  L1_164 = db
  L1_164 = L1_164.getTable
  L1_164 = L1_164(groupsTable, nil, L0_163)
  if next(L1_164) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_164
end
function groupBrowserGetAll()
  local L0_165, L1_166
  L0_165 = "select UserGroups.GroupId, UserGroups.GroupName, GroupAccessControl.LoginFromBrowser, AccessControlUserGroupPolicyBrowser.ClientBrowserName, AccessControlUserGroupPolicyBrowser._ROWID_  from UserGroups, GroupAccessControl, AccessControlUserGroupPolicyBrowser where UserGroups.GroupId=GroupAccessControl.GroupId and GroupAccessControl.GroupId=AccessControlUserGroupPolicyBrowser.GroupId"
  L1_166 = db
  L1_166 = L1_166.getTable
  L1_166 = L1_166(groupsTable, nil, L0_165)
  if next(L1_166) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_166
end
function groupNetworkGetAll()
  local L0_167, L1_168
  L0_167 = "select UserGroups.GroupId, UserGroups.GroupName, GroupAccessControl.LoginFromIP, AccessControlUserGroupPolicyIPAddress.AddressType, AccessControlUserGroupPolicyIPAddress.Address, AccessControlUserGroupPolicyIPAddress.MaskLength, AccessControlUserGroupPolicyIPAddress._ROWID_ from UserGroups, GroupAccessControl, AccessControlUserGroupPolicyIPAddress where UserGroups.GroupId=GroupAccessControl.GroupId and GroupAccessControl.GroupId=AccessControlUserGroupPolicyIPAddress.GroupId"
  L1_168 = db
  L1_168 = L1_168.getTable
  L1_168 = L1_168(groupsTable, nil, L0_167)
  if next(L1_168) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_168
end
function groupGetRow(A0_169)
  local L1_170, L2_171, L3_172, L4_173
  L1_170 = db
  L1_170 = L1_170.getRow
  L2_171 = groupsTable
  L3_172 = attribute
  L3_172 = L3_172.groupId
  L4_173 = A0_169
  L1_170 = L1_170(L2_171, L3_172, L4_173)
  L2_171 = NIL
  if L1_170 == L2_171 then
    L2_171 = _UPVALUE0_
    L2_171 = L2_171.FAILURE
    return L2_171
  end
  L2_171 = attribute
  L2_171 = L2_171.domain
  L3_172 = "='"
  L4_173 = L1_170["UserGroups.GroupName"]
  L2_171 = L2_171 .. L3_172 .. L4_173 .. "'"
  L3_172 = db
  L3_172 = L3_172.getRowWhere
  L4_173 = sslVpnTable
  L3_172 = L3_172(L4_173, L2_171)
  L4_173 = {}
  L4_173["groups.groupId"] = L1_170["UserGroups.GroupId"]
  L4_173["groups.name"] = L1_170["UserGroups.GroupName"]
  L4_173["groups.description"] = L1_170["UserGroups.Description"]
  L4_173["groups.timeOut"] = L1_170["UserGroups.GroupTimeOut"]
  L4_173["groups.capabilities"] = L1_170["UserGroups.Capabilities"]
  if L3_172 ~= NIL then
    L4_173["groups.authType"] = L3_172[sslVpnTable .. "." .. attribute.authType]
    L4_173["groups.AuthProfile"] = L3_172[sslVpnTable .. "." .. attribute.profile]
    L4_173["groups.SSLProfileName"] = L3_172[sslVpnTable .. "." .. attribute.portal]
  end
  return _UPVALUE0_.SUCCESS, A0_169, L4_173
end
function groupLoginGetRow(A0_174)
  local L1_175, L2_176, L3_177
  L1_175 = "select UserGroups.GroupId, UserGroups.GroupName, GroupAccessControl.DenyLogin, GroupAccessControl.DenyLoginFromWan from UserGroups, GroupAccessControl where UserGroups.GroupId = GroupAccessControl.GroupId and UserGroups."
  L2_176 = attribute
  L2_176 = L2_176.groupId
  L3_177 = " = '"
  L1_175 = L1_175 .. L2_176 .. L3_177 .. A0_174 .. "'"
  L2_176 = db
  L2_176 = L2_176.getTable
  L3_177 = groupsTable
  L2_176 = L2_176(L3_177, nil, L1_175)
  L3_177 = next
  L3_177 = L3_177(L2_176)
  if L3_177 == NIL then
    L3_177 = _UPVALUE0_
    L3_177 = L3_177.FAILURE
    return L3_177
  end
  L3_177 = {}
  L3_177["login.groupId"] = L2_176[1]["UserGroups.GroupId"]
  L3_177["login.groupName"] = L2_176[1]["UserGroups.GroupName"]
  L3_177["login.denyLogin"] = L2_176[1]["UserGroups.DenyLogin"]
  L3_177["login.denyWanLogin"] = L2_176[1]["UserGroups.DenyLoginFromWan"]
  return _UPVALUE0_.SUCCESS, A0_174, L3_177
end
function groupBrowserGetRow(A0_178)
  local L1_179, L2_180, L3_181
  L1_179 = "select UserGroups.GroupId, UserGroups.GroupName, GroupAccessControl.LoginFromBrowser, AccessControlUserGroupPolicyBrowser.ClientBrowserName, AccessControlUserGroupPolicyBrowser._ROWID_ from UserGroups, GroupAccessControl, AccessControlUserGroupPolicyBrowser where UserGroups.GroupId=GroupAccessControl.GroupId and GroupAccessControl.GroupId=AccessControlUserGroupPolicyBrowser.GroupId and AccessControlUserGroupPolicyBrowser."
  L2_180 = ROWID
  L3_181 = " = '"
  L1_179 = L1_179 .. L2_180 .. L3_181 .. A0_178 .. "'"
  L2_180 = db
  L2_180 = L2_180.getTable
  L3_181 = groupsTable
  L2_180 = L2_180(L3_181, nil, L1_179)
  L3_181 = next
  L3_181 = L3_181(L2_180)
  if L3_181 == NIL then
    L3_181 = _UPVALUE0_
    L3_181 = L3_181.FAILURE
    return L3_181
  end
  L3_181 = {}
  L3_181["browser.groupId"] = L2_180[1]["UserGroups.GroupId"]
  L3_181["browser.groupName"] = L2_180[1]["UserGroups.GroupName"]
  L3_181["browser.browserLogin"] = L2_180[1]["UserGroups.LoginFromBrowser"]
  L3_181["browser.browserName"] = L2_180[1]["UserGroups.ClientBrowserName"]
  L3_181["browser.rowid"] = L2_180[1]["UserGroups._ROWID_"]
  return _UPVALUE0_.SUCCESS, A0_178, L3_181
end
function groupNetworkGetRow(A0_182)
  local L1_183, L2_184, L3_185
  L1_183 = "select UserGroups.GroupId, UserGroups.GroupName, GroupAccessControl.LoginFromIP, AccessControlUserGroupPolicyIPAddress.AddressType, AccessControlUserGroupPolicyIPAddress.Address, AccessControlUserGroupPolicyIPAddress.MaskLength, AccessControlUserGroupPolicyIPAddress._ROWID_ from UserGroups, GroupAccessControl, AccessControlUserGroupPolicyIPAddress where UserGroups.GroupId=GroupAccessControl.GroupId and GroupAccessControl.GroupId=AccessControlUserGroupPolicyIPAddress.GroupId and AccessControlUserGroupPolicyIPAddress."
  L2_184 = ROWID
  L3_185 = " = '"
  L1_183 = L1_183 .. L2_184 .. L3_185 .. A0_182 .. "'"
  L2_184 = db
  L2_184 = L2_184.getTable
  L3_185 = groupsTable
  L2_184 = L2_184(L3_185, nil, L1_183)
  L3_185 = next
  L3_185 = L3_185(L2_184)
  if L3_185 == NIL then
    L3_185 = _UPVALUE0_
    L3_185 = L3_185.FAILURE
    return L3_185
  end
  L3_185 = {}
  L3_185["network.groupId"] = L2_184[1]["UserGroups.GroupId"]
  L3_185["network.groupName"] = L2_184[1]["UserGroups.GroupName"]
  L3_185["network.ipLogin"] = L2_184[1]["UserGroups.LoginFromIP"]
  L3_185["network.ipAddressType"] = L2_184[1]["UserGroups.AddressType"]
  L3_185["network.ipAddress"] = L2_184[1]["UserGroups.Address"]
  L3_185["network.maskLength"] = L2_184[1]["UserGroups.MaskLength"]
  L3_185["network.rowid"] = L2_184[1]["UserGroups._ROWID_"]
  return _UPVALUE0_.SUCCESS, A0_182, L3_185
end
function groupDeleteAll()
  local L0_186, L1_187, L2_188, L3_189, L4_190, L5_191, L6_192, L7_193, L8_194, L9_195, L10_196, L11_197
  L0_186 = db
  L0_186 = L0_186.getTable
  L1_187 = groupsTable
  L0_186 = L0_186(L1_187)
  L1_187 = #L0_186
  if L1_187 == 3 then
    L1_187 = _UPVALUE0_
    L1_187 = L1_187.GROUP_ACTIVE_USERS_DELETE_ERROR
    return L1_187
  end
  L1_187 = attribute
  L1_187 = L1_187.groupId
  L2_188 = " NOT IN (SELECT "
  L3_189 = attribute
  L3_189 = L3_189.groupId
  L4_190 = " FROM "
  L5_191 = groupsTable
  L6_192 = " WHERE "
  L7_193 = attribute
  L7_193 = L7_193.groupId
  L8_194 = " = '1' or "
  L9_195 = attribute
  L9_195 = L9_195.groupId
  L10_196 = " = '2' or "
  L11_197 = attribute
  L11_197 = L11_197.groupId
  L1_187 = L1_187 .. L2_188 .. L3_189 .. L4_190 .. L5_191 .. L6_192 .. L7_193 .. L8_194 .. L9_195 .. L10_196 .. L11_197 .. " = '3')"
  L2_188 = db
  L2_188 = L2_188.deleteRowWhere
  L3_189 = groupsTable
  L4_190 = L1_187
  L2_188 = L2_188(L3_189, L4_190)
  L3_189 = db
  L3_189 = L3_189.deleteAllRows
  L4_190 = openvpngroupsTable
  L3_189(L4_190)
  L3_189 = NIL
  if L2_188 == L3_189 then
    L3_189 = _UPVALUE1_
    L3_189 = L3_189.FAILURE
    L4_190 = cookie
    return L3_189, L4_190
  end
  L3_189 = db
  L3_189 = L3_189.deleteRowWhere
  L4_190 = loginPolicyTable
  L5_191 = L1_187
  L3_189 = L3_189(L4_190, L5_191)
  L4_190 = NIL
  if L3_189 == L4_190 then
    L4_190 = _UPVALUE1_
    L4_190 = L4_190.FAILURE
    L5_191 = cookie
    return L4_190, L5_191
  end
  L4_190 = db
  L4_190 = L4_190.getRowsWhere
  L5_191 = usersTable
  L6_192 = L1_187
  L4_190 = L4_190(L5_191, L6_192)
  L5_191 = next
  L6_192 = L4_190
  L5_191 = L5_191(L6_192)
  L6_192 = NIL
  if L5_191 ~= L6_192 then
    L5_191 = _UPVALUE0_
    L5_191 = L5_191.GROUP_ACTIVE_USERS_DELETE_ERROR
    L6_192 = cookie
    return L5_191, L6_192
  end
  L5_191 = db
  L5_191 = L5_191.getTable
  L6_192 = browserpoliciesTable
  L5_191 = L5_191(L6_192)
  L6_192 = next
  L7_193 = L5_191
  L6_192 = L6_192(L7_193)
  L7_193 = NIL
  if L6_192 ~= L7_193 then
    L6_192 = db
    L6_192 = L6_192.deleteAllRows
    L7_193 = browserpoliciesTable
    L6_192 = L6_192(L7_193)
    L7_193 = NIL
    if L6_192 == L7_193 then
      L7_193 = _UPVALUE1_
      L7_193 = L7_193.FAILURE
      L8_194 = cookie
      return L7_193, L8_194
    end
  end
  L6_192 = db
  L6_192 = L6_192.getTable
  L7_193 = networkpoliciesTable
  L6_192 = L6_192(L7_193)
  L7_193 = next
  L8_194 = L6_192
  L7_193 = L7_193(L8_194)
  L8_194 = NIL
  if L7_193 ~= L8_194 then
    L7_193 = db
    L7_193 = L7_193.deleteAllRows
    L8_194 = networkpoliciesTable
    L7_193 = L7_193(L8_194)
    L8_194 = NIL
    if L7_193 == L8_194 then
      L8_194 = _UPVALUE1_
      L8_194 = L8_194.FAILURE
      L9_195 = cookie
      return L8_194, L9_195
    end
  end
  L7_193 = HIGH_SEC
  if L7_193 == "HIGH" then
    L7_193 = db
    L7_193 = L7_193.getTable
    L8_194 = sslVpnTable
    L7_193 = L7_193(L8_194)
    L8_194 = next
    L9_195 = L7_193
    L8_194 = L8_194(L9_195)
    L9_195 = NIL
    if L8_194 ~= L9_195 then
      L8_194 = db
      L8_194 = L8_194.deleteAllRows
      L9_195 = sslVpnTable
      L8_194 = L8_194(L9_195)
      L9_195 = NIL
      if L8_194 == L9_195 then
        L9_195 = _UPVALUE1_
        L9_195 = L9_195.FAILURE
        L10_196 = cookie
        return L9_195, L10_196
      end
    end
    L8_194 = db
    L8_194 = L8_194.getTable
    L9_195 = sslPortalLayoutTable
    L8_194 = L8_194(L9_195)
    L9_195 = {}
    L10_196 = next
    L11_197 = L8_194
    L10_196 = L10_196(L11_197)
    L11_197 = NIL
    if L10_196 ~= L11_197 then
      L10_196 = 0
      L11_197 = 0
      for _FORV_15_, _FORV_16_ in pairs(L8_194) do
        L11_197 = L11_197 + 1
        if _FORV_16_[sslPortalLayoutTable .. "." .. attribute.authType] == _UPVALUE2_ then
          L9_195[sslPortalLayoutTable .. "." .. attribute.useCount] = L10_196
          if db.update(sslPortalLayoutTable, L9_195, L11_197) == NIL then
            return _UPVALUE1_.FAILURE, cookie
          end
        end
      end
    end
  end
  L7_193 = _UPVALUE1_
  L7_193 = L7_193.SUCCESS
  L8_194 = cookie
  return L7_193, L8_194
end
function groupBrowserPolicyDeleteAll()
  local L0_198, L1_199, L2_200, L3_201, L4_202
  L0_198 = db
  L0_198 = L0_198.deleteAllRows
  L1_199 = browserpoliciesTable
  L0_198 = L0_198(L1_199)
  L1_199 = NIL
  if L0_198 == L1_199 then
    L1_199 = _UPVALUE0_
    L1_199 = L1_199.FAILURE
    L2_200 = cookie
    return L1_199, L2_200
  end
  L1_199 = db
  L1_199 = L1_199.getTable
  L2_200 = loginPolicyTable
  L1_199 = L1_199(L2_200)
  L2_200 = {}
  L3_201 = next
  L4_202 = L1_199
  L3_201 = L3_201(L4_202)
  L4_202 = NIL
  if L3_201 ~= L4_202 then
    L3_201 = "0"
    L4_202 = 0
    for _FORV_8_, _FORV_9_ in pairs(L1_199) do
      L4_202 = L4_202 + 1
      L2_200[loginPolicyTable .. "." .. attribute.browserLogin] = L3_201
      if db.update(loginPolicyTable, L2_200, L4_202) == NIL then
        return _UPVALUE0_.FAILURE, cookie
      end
    end
  end
  L3_201 = _UPVALUE0_
  L3_201 = L3_201.SUCCESS
  L4_202 = cookie
  return L3_201, L4_202
end
function groupIpPolicyDeleteAll()
  local L0_203, L1_204, L2_205, L3_206, L4_207
  L0_203 = db
  L0_203 = L0_203.deleteAllRows
  L1_204 = networkpoliciesTable
  L0_203 = L0_203(L1_204)
  L1_204 = NIL
  if L0_203 == L1_204 then
    L1_204 = _UPVALUE0_
    L1_204 = L1_204.FAILURE
    L2_205 = cookie
    return L1_204, L2_205
  end
  L1_204 = db
  L1_204 = L1_204.getTable
  L2_205 = loginPolicyTable
  L1_204 = L1_204(L2_205)
  L2_205 = {}
  L3_206 = next
  L4_207 = L1_204
  L3_206 = L3_206(L4_207)
  L4_207 = NIL
  if L3_206 ~= L4_207 then
    L3_206 = "0"
    L4_207 = 0
    for _FORV_8_, _FORV_9_ in pairs(L1_204) do
      L4_207 = L4_207 + 1
      L2_205[loginPolicyTable .. "." .. attribute.ipLogin] = L3_206
      if db.update(loginPolicyTable, L2_205, L4_207) == NIL then
        return _UPVALUE0_.FAILURE, cookie
      end
    end
  end
  L3_206 = _UPVALUE0_
  L3_206 = L3_206.SUCCESS
  L4_207 = cookie
  return L3_206, L4_207
end
function sslVpnPolicyCreate(A0_208, A1_209, A2_210)
  local L3_211, L4_212, L5_213, L6_214
  L3_211 = NIL
  if A0_208 == L3_211 or A0_208 == "" then
    L3_211 = _UPVALUE0_
    L3_211 = L3_211.SSLVPN_USERNAME_NIL
    return L3_211
  end
  L3_211 = NIL
  if A1_209 == L3_211 or A1_209 == "" then
    L3_211 = _UPVALUE0_
    L3_211 = L3_211.SSLVPN_AUTH_TYPE_NIL
    return L3_211
  end
  L3_211 = _UPVALUE1_
  if A1_209 ~= L3_211 then
    L3_211 = _UPVALUE2_
    if A1_209 ~= L3_211 then
      L3_211 = _UPVALUE3_
      if A1_209 ~= L3_211 then
        L3_211 = _UPVALUE4_
        if A1_209 ~= L3_211 then
          L3_211 = _UPVALUE5_
          if A1_209 ~= L3_211 then
            L3_211 = _UPVALUE6_
            if A1_209 ~= L3_211 then
              L3_211 = _UPVALUE7_
              if A1_209 ~= L3_211 then
                L3_211 = _UPVALUE8_
                if A1_209 ~= L3_211 then
                  L3_211 = _UPVALUE9_
                  if A1_209 ~= L3_211 then
                    L3_211 = _UPVALUE10_
                    L3_211 = L3_211.SSLVPN_AUTHTYPE_INVALID
                    return L3_211
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L3_211 = nil
  L4_212 = _UPVALUE1_
  if A1_209 == L4_212 then
    L4_212 = db
    L4_212 = L4_212.getAttribute
    L5_213 = groupsTable
    L6_214 = attribute
    L6_214 = L6_214.name
    L4_212 = L4_212(L5_213, L6_214, A0_208, attribute.groupId)
    L3_211 = L4_212
    L4_212 = NIL
    if L3_211 == L4_212 then
      L4_212 = _UPVALUE0_
      L4_212 = L4_212.SSLVPN_GROUP_INVALID
      return L4_212
    end
  end
  L4_212 = {}
  L5_213 = sslVpnTable
  L6_214 = "."
  L5_213 = L5_213 .. L6_214 .. attribute.groupId
  L6_214 = tonumber
  L6_214 = L6_214(L3_211)
  L4_212[L5_213] = L6_214
  L5_213 = sslVpnTable
  L6_214 = "."
  L5_213 = L5_213 .. L6_214 .. attribute.domain
  L4_212[L5_213] = A0_208
  L5_213 = sslVpnTable
  L6_214 = "."
  L5_213 = L5_213 .. L6_214 .. attribute.portal
  L4_212[L5_213] = A2_210
  L5_213 = sslVpnTable
  L6_214 = "."
  L5_213 = L5_213 .. L6_214 .. attribute.profile
  L6_214 = _UPVALUE11_
  L4_212[L5_213] = L6_214
  L5_213 = sslVpnTable
  L6_214 = "."
  L5_213 = L5_213 .. L6_214 .. attribute.primarySSL
  L6_214 = _UPVALUE12_
  L4_212[L5_213] = L6_214
  L5_213 = sslVpnTable
  L6_214 = "."
  L5_213 = L5_213 .. L6_214 .. attribute.secondarySSL
  L6_214 = _UPVALUE12_
  L4_212[L5_213] = L6_214
  L5_213 = sslVpnTable
  L6_214 = "."
  L5_213 = L5_213 .. L6_214 .. attribute.tertiarySSL
  L6_214 = _UPVALUE12_
  L4_212[L5_213] = L6_214
  L5_213 = sslVpnTable
  L6_214 = "."
  L5_213 = L5_213 .. L6_214 .. attribute.defaultDomain
  L6_214 = _UPVALUE12_
  L4_212[L5_213] = L6_214
  L5_213 = sslVpnTable
  L6_214 = "."
  L5_213 = L5_213 .. L6_214 .. attribute.primaryPort
  L6_214 = _UPVALUE13_
  L4_212[L5_213] = L6_214
  L5_213 = sslVpnTable
  L6_214 = "."
  L5_213 = L5_213 .. L6_214 .. attribute.secondaryPort
  L6_214 = _UPVALUE13_
  L4_212[L5_213] = L6_214
  L5_213 = sslVpnTable
  L6_214 = "."
  L5_213 = L5_213 .. L6_214 .. attribute.tertiaryPort
  L6_214 = _UPVALUE13_
  L4_212[L5_213] = L6_214
  L5_213 = _UPVALUE1_
  if A1_209 == L5_213 then
    L5_213 = sslVpnTable
    L6_214 = "."
    L5_213 = L5_213 .. L6_214 .. attribute.authType
    L6_214 = _UPVALUE1_
    L4_212[L5_213] = L6_214
    L5_213 = sslVpnTable
    L6_214 = "."
    L5_213 = L5_213 .. L6_214 .. attribute.profile
    L6_214 = _UPVALUE11_
    L4_212[L5_213] = L6_214
    L5_213 = sslVpnTable
    L6_214 = "."
    L5_213 = L5_213 .. L6_214 .. attribute.authTimeOut
    L6_214 = _UPVALUE14_
    L4_212[L5_213] = L6_214
    L5_213 = sslVpnTable
    L6_214 = "."
    L5_213 = L5_213 .. L6_214 .. attribute.retries
    L6_214 = _UPVALUE15_
    L4_212[L5_213] = L6_214
  else
    L5_213 = _UPVALUE2_
    if A1_209 ~= L5_213 then
      L5_213 = _UPVALUE3_
      if A1_209 ~= L5_213 then
        L5_213 = _UPVALUE4_
        if A1_209 ~= L5_213 then
          L5_213 = _UPVALUE5_
        end
      end
    else
      if A1_209 == L5_213 then
        L5_213 = db
        L5_213 = L5_213.getTable
        L6_214 = radiusTable
        L5_213 = L5_213(L6_214)
        L6_214 = next
        L6_214 = L6_214(L5_213)
        if L6_214 == NIL then
          L6_214 = _UPVALUE0_
          L6_214 = L6_214.SSLVPN_USER_RADIUS_NOT_ENABLED
          return L6_214
        end
        L6_214 = sslVpnTable
        L6_214 = L6_214 .. "." .. attribute.primaryServer
        L4_212[L6_214] = L5_213[_UPVALUE16_]["radiusClient.authserver"]
        L6_214 = sslVpnTable
        L6_214 = L6_214 .. "." .. attribute.secondaryServer
        L4_212[L6_214] = L5_213[_UPVALUE17_]["radiusClient.authserver"]
        L6_214 = sslVpnTable
        L6_214 = L6_214 .. "." .. attribute.tertiaryServer
        L4_212[L6_214] = L5_213[_UPVALUE18_]["radiusClient.authserver"]
        L6_214 = sslVpnTable
        L6_214 = L6_214 .. "." .. attribute.authTimeOut
        L4_212[L6_214] = tonumber(L5_213[_UPVALUE16_]["radiusClient.authtimeout"])
        L6_214 = sslVpnTable
        L6_214 = L6_214 .. "." .. attribute.retries
        L4_212[L6_214] = tonumber(L5_213[_UPVALUE16_]["radiusClient.authretries"])
        L6_214 = sslVpnTable
        L6_214 = L6_214 .. "." .. attribute.radiusPrimarySecret
        L4_212[L6_214] = L5_213[_UPVALUE16_]["radiusClient.authsecret"]
        L6_214 = sslVpnTable
        L6_214 = L6_214 .. "." .. attribute.radiusSecondarySecret
        L4_212[L6_214] = L5_213[_UPVALUE17_]["radiusClient.authsecret"]
        L6_214 = sslVpnTable
        L6_214 = L6_214 .. "." .. attribute.radiusTertiarySecret
        L4_212[L6_214] = L5_213[_UPVALUE18_]["radiusClient.authsecret"]
        L6_214 = sslVpnTable
        L6_214 = L6_214 .. "." .. attribute.primaryPort
        L4_212[L6_214] = tonumber(L5_213[_UPVALUE16_]["radiusClient.authport"])
        L6_214 = sslVpnTable
        L6_214 = L6_214 .. "." .. attribute.secondaryPort
        L4_212[L6_214] = tonumber(L5_213[_UPVALUE17_]["radiusClient.authport"])
        L6_214 = sslVpnTable
        L6_214 = L6_214 .. "." .. attribute.tertiaryPort
        L4_212[L6_214] = tonumber(L5_213[_UPVALUE18_]["radiusClient.authport"])
        L6_214 = _UPVALUE2_
        if A1_209 == L6_214 then
          L6_214 = sslVpnTable
          L6_214 = L6_214 .. "." .. attribute.authType
          L4_212[L6_214] = _UPVALUE2_
        else
          L6_214 = _UPVALUE3_
          if A1_209 == L6_214 then
            L6_214 = sslVpnTable
            L6_214 = L6_214 .. "." .. attribute.authType
            L4_212[L6_214] = _UPVALUE3_
          else
            L6_214 = _UPVALUE4_
            if A1_209 == L6_214 then
              L6_214 = sslVpnTable
              L6_214 = L6_214 .. "." .. attribute.authType
              L4_212[L6_214] = _UPVALUE4_
            else
              L6_214 = _UPVALUE5_
              if A1_209 == L6_214 then
                L6_214 = sslVpnTable
                L6_214 = L6_214 .. "." .. attribute.authType
                L4_212[L6_214] = _UPVALUE5_
              end
            end
          end
        end
    end
    else
      L5_213 = _UPVALUE7_
      if A1_209 == L5_213 then
        L5_213 = db
        L5_213 = L5_213.getTable
        L6_214 = ntdomainTable
        L5_213 = L5_213(L6_214)
        L6_214 = next
        L6_214 = L6_214(L5_213)
        if L6_214 == NIL then
          L6_214 = _UPVALUE0_
          L6_214 = L6_214.SSLVPN_USER_NT_DOMAIN_NOT_ENABLED
          return L6_214
        end
        L6_214 = sslVpnTable
        L6_214 = L6_214 .. "." .. attribute.authType
        L4_212[L6_214] = _UPVALUE7_
        L6_214 = sslVpnTable
        L6_214 = L6_214 .. "." .. attribute.primaryServer
        L4_212[L6_214] = L5_213[_UPVALUE16_]["NTDomainSettings.AuthenticationServer"]
        L6_214 = sslVpnTable
        L6_214 = L6_214 .. "." .. attribute.secondaryServer
        L4_212[L6_214] = L5_213[_UPVALUE16_]["NTDomainSettings.SecondAuthenticationServer"]
        L6_214 = sslVpnTable
        L6_214 = L6_214 .. "." .. attribute.tertiaryServer
        L4_212[L6_214] = L5_213[_UPVALUE16_]["NTDomainSettings.ThirdAuthenticationServer"]
        L6_214 = sslVpnTable
        L6_214 = L6_214 .. "." .. attribute.authTimeOut
        L4_212[L6_214] = L5_213[_UPVALUE16_]["NTDomainSettings.TimeOut"]
        L6_214 = sslVpnTable
        L6_214 = L6_214 .. "." .. attribute.retries
        L4_212[L6_214] = L5_213[_UPVALUE16_]["NTDomainSettings.Retries"]
        L6_214 = sslVpnTable
        L6_214 = L6_214 .. "." .. attribute.ntPrimaryDomain
        L4_212[L6_214] = L5_213[_UPVALUE16_]["NTDomainSettings.NTDomainWorkGroup"]
        L6_214 = sslVpnTable
        L6_214 = L6_214 .. "." .. attribute.ntSecondaryDomain
        L4_212[L6_214] = L5_213[_UPVALUE16_]["NTDomainSettings.NTDomainSecondWorkGroup"]
        L6_214 = sslVpnTable
        L6_214 = L6_214 .. "." .. attribute.ntTertiaryDomain
        L4_212[L6_214] = L5_213[_UPVALUE16_]["NTDomainSettings.ThirdNTDomainWorkGroup"]
      else
        L5_213 = _UPVALUE8_
        if A1_209 == L5_213 then
          L5_213 = db
          L5_213 = L5_213.getTable
          L6_214 = adServerTable
          L5_213 = L5_213(L6_214)
          L6_214 = next
          L6_214 = L6_214(L5_213)
          if L6_214 == NIL then
            L6_214 = _UPVALUE0_
            L6_214 = L6_214.SSLVPN_USER_AD_SERVER_NOT_ENABLED
            return L6_214
          end
          L6_214 = sslVpnTable
          L6_214 = L6_214 .. "." .. attribute.authType
          L4_212[L6_214] = _UPVALUE8_
          L6_214 = sslVpnTable
          L6_214 = L6_214 .. "." .. attribute.primaryServer
          L4_212[L6_214] = L5_213[_UPVALUE16_]["ActiveDirectorySettings.AuthenticationServer"]
          L6_214 = sslVpnTable
          L6_214 = L6_214 .. "." .. attribute.secondaryServer
          L4_212[L6_214] = L5_213[_UPVALUE16_]["ActiveDirectorySettings.SecondAuthenticationServer"]
          L6_214 = sslVpnTable
          L6_214 = L6_214 .. "." .. attribute.tertiaryServer
          L4_212[L6_214] = L5_213[_UPVALUE16_]["ActiveDirectorySettings.ThirdAuthenticationServer"]
          L6_214 = sslVpnTable
          L6_214 = L6_214 .. "." .. attribute.authTimeOut
          L4_212[L6_214] = L5_213[_UPVALUE16_]["ActiveDirectorySettings.TimeOut"]
          L6_214 = sslVpnTable
          L6_214 = L6_214 .. "." .. attribute.retries
          L4_212[L6_214] = L5_213[_UPVALUE16_]["ActiveDirectorySettings.Retries"]
          L6_214 = sslVpnTable
          L6_214 = L6_214 .. "." .. attribute.adPrimaryDomain
          L4_212[L6_214] = L5_213[_UPVALUE16_]["ActiveDirectorySettings.ActiveDirectoryDomain"]
          L6_214 = sslVpnTable
          L6_214 = L6_214 .. "." .. attribute.adSecondaryDomain
          L4_212[L6_214] = L5_213[_UPVALUE16_]["ActiveDirectorySettings.SecondActiveDirectoryDomain"]
          L6_214 = sslVpnTable
          L6_214 = L6_214 .. "." .. attribute.adTertiaryDomain
          L4_212[L6_214] = L5_213[_UPVALUE16_]["ActiveDirectorySettings.ThirdActiveDirectoryDomain"]
        else
          L5_213 = _UPVALUE6_
          if A1_209 == L5_213 then
            L5_213 = db
            L5_213 = L5_213.getTable
            L6_214 = ldapTable
            L5_213 = L5_213(L6_214)
            L6_214 = next
            L6_214 = L6_214(L5_213)
            if L6_214 == NIL then
              L6_214 = _UPVALUE0_
              L6_214 = L6_214.SSLVPN_USER_LDAP_SERVER_NOT_ENABLED
              return L6_214
            end
            L6_214 = sslVpnTable
            L6_214 = L6_214 .. "." .. attribute.authType
            L4_212[L6_214] = _UPVALUE6_
            L6_214 = sslVpnTable
            L6_214 = L6_214 .. "." .. attribute.primaryServer
            L4_212[L6_214] = L5_213[_UPVALUE16_]["LDAPSettings.AuthenticationServer"]
            L6_214 = sslVpnTable
            L6_214 = L6_214 .. "." .. attribute.secondaryServer
            L4_212[L6_214] = L5_213[_UPVALUE16_]["LDAPSettings.SecondAuthenticationServer"]
            L6_214 = sslVpnTable
            L6_214 = L6_214 .. "." .. attribute.tertiaryServer
            L4_212[L6_214] = L5_213[_UPVALUE16_]["LDAPSettings.ThirdAuthenticationServer"]
            L6_214 = sslVpnTable
            L6_214 = L6_214 .. "." .. attribute.authTimeOut
            L4_212[L6_214] = L5_213[_UPVALUE16_]["LDAPSettings.TimeOut"]
            L6_214 = sslVpnTable
            L6_214 = L6_214 .. "." .. attribute.retries
            L4_212[L6_214] = L5_213[_UPVALUE16_]["LDAPSettings.Retries"]
            L6_214 = sslVpnTable
            L6_214 = L6_214 .. "." .. attribute.ldapPrimaryDomain
            L4_212[L6_214] = L5_213[_UPVALUE16_]["LDAPSettings.LDAPBaseDN"]
            L6_214 = sslVpnTable
            L6_214 = L6_214 .. "." .. attribute.ldapSecondaryDomain
            L4_212[L6_214] = L5_213[_UPVALUE16_]["LDAPSettings.SecondLDAPBaseDN"]
            L6_214 = sslVpnTable
            L6_214 = L6_214 .. "." .. attribute.ldapTertiaryDomain
            L4_212[L6_214] = L5_213[_UPVALUE16_]["LDAPSettings.ThirdLDAPBaseDN"]
          else
            L5_213 = _UPVALUE9_
            if A1_209 == L5_213 then
              L5_213 = db
              L5_213 = L5_213.getTable
              L6_214 = popTable
              L5_213 = L5_213(L6_214)
              L6_214 = next
              L6_214 = L6_214(L5_213)
              if L6_214 == NIL then
                L6_214 = _UPVALUE0_
                L6_214 = L6_214.SSLVPN_USER_POP3_SERVER_NOT_ENABLED
                return L6_214
              end
              L6_214 = sslVpnTable
              L6_214 = L6_214 .. "." .. attribute.authType
              L4_212[L6_214] = _UPVALUE9_
              L6_214 = sslVpnTable
              L6_214 = L6_214 .. "." .. attribute.primaryServer
              L4_212[L6_214] = L5_213[_UPVALUE16_]["POPProfiles.Server"]
              L6_214 = sslVpnTable
              L6_214 = L6_214 .. "." .. attribute.secondaryServer
              L4_212[L6_214] = L5_213[_UPVALUE16_]["POPProfiles.SecondServer"]
              L6_214 = sslVpnTable
              L6_214 = L6_214 .. "." .. attribute.tertiaryServer
              L4_212[L6_214] = L5_213[_UPVALUE16_]["POPProfiles.ThirdServer"]
              L6_214 = sslVpnTable
              L6_214 = L6_214 .. "." .. attribute.authTimeOut
              L4_212[L6_214] = L5_213[_UPVALUE16_]["POPProfiles.Timeout"]
              L6_214 = sslVpnTable
              L6_214 = L6_214 .. "." .. attribute.retries
              L4_212[L6_214] = L5_213[_UPVALUE16_]["POPProfiles.Retries"]
              L6_214 = sslVpnTable
              L6_214 = L6_214 .. "." .. attribute.primaryCAfile
              L4_212[L6_214] = L5_213[_UPVALUE16_]["POPProfiles.CAFile"]
              L6_214 = sslVpnTable
              L6_214 = L6_214 .. "." .. attribute.secondaryCAfile
              L4_212[L6_214] = L5_213[_UPVALUE16_]["POPProfiles.SecondCAFile"]
              L6_214 = sslVpnTable
              L6_214 = L6_214 .. "." .. attribute.tertiaryCAfile
              L4_212[L6_214] = L5_213[_UPVALUE16_]["POPProfiles.ThirdCAFile"]
              L6_214 = sslVpnTable
              L6_214 = L6_214 .. "." .. attribute.primaryPort
              L4_212[L6_214] = L5_213[_UPVALUE16_]["POPProfiles.AuthenticationPort"]
              L6_214 = sslVpnTable
              L6_214 = L6_214 .. "." .. attribute.secondaryPort
              L4_212[L6_214] = L5_213[_UPVALUE16_]["POPProfiles.SecondAuthenticationPort"]
              L6_214 = sslVpnTable
              L6_214 = L6_214 .. "." .. attribute.tertiaryPort
              L4_212[L6_214] = L5_213[_UPVALUE16_]["POPProfiles.ThirdAuthenticationPort"]
              L6_214 = sslVpnTable
              L6_214 = L6_214 .. "." .. attribute.primarySSL
              L4_212[L6_214] = L5_213[_UPVALUE16_]["POPProfiles.SSLEnable"]
              L6_214 = sslVpnTable
              L6_214 = L6_214 .. "." .. attribute.secondarySSL
              L4_212[L6_214] = L5_213[_UPVALUE16_]["POPProfiles.SecondSSLEnable"]
              L6_214 = sslVpnTable
              L6_214 = L6_214 .. "." .. attribute.tertiarySSL
              L4_212[L6_214] = L5_213["POPProfiles.ThirdSSLEnable"]
            end
          end
        end
      end
    end
  end
  L5_213 = db
  L5_213 = L5_213.insert
  L6_214 = sslVpnTable
  L5_213 = L5_213(L6_214, L4_212)
  L6_214 = NIL
  if L5_213 == L6_214 then
    L6_214 = _UPVALUE10_
    L6_214 = L6_214.FAILURE
    return L6_214
  end
  L6_214 = db
  L6_214 = L6_214.existsRow
  L6_214 = L6_214(sslPortalLayoutTable, attribute.portal, A2_210)
  if L6_214 then
    L6_214 = db
    L6_214 = L6_214.getAttribute
    L6_214 = L6_214(sslPortalLayoutTable, attribute.portal, A2_210, attribute.useCount)
    if L6_214 == NIL then
      return _UPVALUE0_.SSLVPN_USER_PORTAL_INVALID
    end
    L6_214 = tonumber(L6_214) + 1
    if db.setAttribute(sslPortalLayoutTable, attribute.portal, A2_210, attribute.useCount, L6_214) == NIL then
      return _UPVALUE10_.FAILURE
    end
  end
  L6_214 = _UPVALUE10_
  L6_214 = L6_214.SUCCESS
  return L6_214
end
function sslVpnPolicySet(A0_215, A1_216)
  local L2_217, L3_218, L4_219
  L2_217 = NIL
  if A0_215 == L2_217 or A0_215 == "" then
    L2_217 = _UPVALUE0_
    L2_217 = L2_217.NIL
    return L2_217
  end
  L2_217 = NIL
  if A1_216 == L2_217 or A1_216 == "" then
    L2_217 = _UPVALUE1_
    L2_217 = L2_217.SSLVPN_AUTH_TYPE_NIL
    return L2_217
  end
  L2_217 = _UPVALUE2_
  if A1_216 ~= L2_217 then
    L2_217 = _UPVALUE3_
    if A1_216 ~= L2_217 then
      L2_217 = _UPVALUE4_
      if A1_216 ~= L2_217 then
        L2_217 = _UPVALUE5_
        if A1_216 ~= L2_217 then
          L2_217 = _UPVALUE6_
          if A1_216 ~= L2_217 then
            L2_217 = _UPVALUE7_
            if A1_216 ~= L2_217 then
              L2_217 = _UPVALUE8_
              if A1_216 ~= L2_217 then
                L2_217 = _UPVALUE9_
                if A1_216 ~= L2_217 then
                  L2_217 = _UPVALUE10_
                  if A1_216 ~= L2_217 then
                    L2_217 = _UPVALUE0_
                    L2_217 = L2_217.SSLVPN_AUTHTYPE_INVALID
                    return L2_217
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L2_217 = sslVpnTable
  L3_218 = "."
  L4_219 = ROWID
  L2_217 = L2_217 .. L3_218 .. L4_219
  L2_217 = A0_215[L2_217]
  L3_218 = nil
  L4_219 = _UPVALUE2_
  if A1_216 == L4_219 then
    L4_219 = db
    L4_219 = L4_219.getAttribute
    L4_219 = L4_219(groupsTable, attribute.name, name, attribute.groupId)
    L3_218 = L4_219
    L4_219 = NIL
    if L3_218 == L4_219 then
      L4_219 = _UPVALUE1_
      L4_219 = L4_219.SSLVPN_GROUP_INVALID
      return L4_219
    end
  end
  L4_219 = sslVpnTable
  L4_219 = L4_219 .. "." .. attribute.groupId
  A0_215[L4_219] = tonumber(L3_218)
  L4_219 = sslVpnTable
  L4_219 = L4_219 .. "." .. attribute.profile
  A0_215[L4_219] = _UPVALUE11_
  L4_219 = sslVpnTable
  L4_219 = L4_219 .. "." .. attribute.primarySSL
  A0_215[L4_219] = _UPVALUE12_
  L4_219 = sslVpnTable
  L4_219 = L4_219 .. "." .. attribute.secondarySSL
  A0_215[L4_219] = _UPVALUE12_
  L4_219 = sslVpnTable
  L4_219 = L4_219 .. "." .. attribute.tertiarySSL
  A0_215[L4_219] = _UPVALUE12_
  L4_219 = sslVpnTable
  L4_219 = L4_219 .. "." .. attribute.defaultDomain
  A0_215[L4_219] = _UPVALUE12_
  L4_219 = sslVpnTable
  L4_219 = L4_219 .. "." .. attribute.primaryPort
  A0_215[L4_219] = _UPVALUE13_
  L4_219 = sslVpnTable
  L4_219 = L4_219 .. "." .. attribute.secondaryPort
  A0_215[L4_219] = _UPVALUE13_
  L4_219 = sslVpnTable
  L4_219 = L4_219 .. "." .. attribute.tertiaryPort
  A0_215[L4_219] = _UPVALUE13_
  L4_219 = _UPVALUE2_
  if A1_216 == L4_219 then
    L4_219 = sslVpnTable
    L4_219 = L4_219 .. "." .. attribute.authType
    A0_215[L4_219] = _UPVALUE2_
    L4_219 = sslVpnTable
    L4_219 = L4_219 .. "." .. attribute.profile
    A0_215[L4_219] = _UPVALUE11_
    L4_219 = sslVpnTable
    L4_219 = L4_219 .. "." .. attribute.authTimeOut
    A0_215[L4_219] = _UPVALUE14_
    L4_219 = sslVpnTable
    L4_219 = L4_219 .. "." .. attribute.retries
    A0_215[L4_219] = _UPVALUE15_
  else
    L4_219 = _UPVALUE3_
    if A1_216 ~= L4_219 then
      L4_219 = _UPVALUE4_
      if A1_216 ~= L4_219 then
        L4_219 = _UPVALUE5_
        if A1_216 ~= L4_219 then
          L4_219 = _UPVALUE6_
        end
      end
    else
      if A1_216 == L4_219 then
        L4_219 = db
        L4_219 = L4_219.getTable
        L4_219 = L4_219(radiusTable)
        if next(L4_219) == NIL then
          return _UPVALUE1_.SSLVPN_USER_RADIUS_NOT_ENABLED
        end
        A0_215[sslVpnTable .. "." .. attribute.primaryServer] = L4_219[_UPVALUE16_]["radiusClient.authserver"]
        A0_215[sslVpnTable .. "." .. attribute.secondaryServer] = L4_219[_UPVALUE17_]["radiusClient.authserver"]
        A0_215[sslVpnTable .. "." .. attribute.tertiaryServer] = L4_219[_UPVALUE18_]["radiusClient.authserver"]
        A0_215[sslVpnTable .. "." .. attribute.authTimeOut] = tonumber(L4_219[_UPVALUE16_]["radiusClient.authtimeout"])
        A0_215[sslVpnTable .. "." .. attribute.retries] = tonumber(L4_219[_UPVALUE16_]["radiusClient.authretries"])
        A0_215[sslVpnTable .. "." .. attribute.radiusPrimarySecret] = L4_219[_UPVALUE16_]["radiusClient.authsecret"]
        A0_215[sslVpnTable .. "." .. attribute.radiusSecondarySecret] = L4_219[_UPVALUE17_]["radiusClient.authsecret"]
        A0_215[sslVpnTable .. "." .. attribute.radiusTertiarySecret] = L4_219[_UPVALUE18_]["radiusClient.authsecret"]
        A0_215[sslVpnTable .. "." .. attribute.primaryPort] = tonumber(L4_219[_UPVALUE16_]["radiusClient.authport"])
        A0_215[sslVpnTable .. "." .. attribute.secondaryPort] = tonumber(L4_219[_UPVALUE17_]["radiusClient.authport"])
        A0_215[sslVpnTable .. "." .. attribute.tertiaryPort] = tonumber(L4_219[_UPVALUE18_]["radiusClient.authport"])
        if A1_216 == _UPVALUE3_ then
          A0_215[sslVpnTable .. "." .. attribute.authType] = _UPVALUE3_
        elseif A1_216 == _UPVALUE4_ then
          A0_215[sslVpnTable .. "." .. attribute.authType] = _UPVALUE4_
        elseif A1_216 == _UPVALUE5_ then
          A0_215[sslVpnTable .. "." .. attribute.authType] = _UPVALUE5_
        elseif A1_216 == _UPVALUE6_ then
          A0_215[sslVpnTable .. "." .. attribute.authType] = _UPVALUE6_
        end
    end
    else
      L4_219 = _UPVALUE8_
      if A1_216 == L4_219 then
        L4_219 = db
        L4_219 = L4_219.getTable
        L4_219 = L4_219(ntdomainTable)
        if next(L4_219) == NIL then
          return _UPVALUE1_.SSLVPN_USER_NT_DOMAIN_NOT_ENABLED
        end
        A0_215[sslVpnTable .. "." .. attribute.authType] = _UPVALUE8_
        A0_215[sslVpnTable .. "." .. attribute.primaryServer] = L4_219[_UPVALUE16_]["NTDomainSettings.AuthenticationServer"]
        A0_215[sslVpnTable .. "." .. attribute.secondaryServer] = L4_219[_UPVALUE16_]["NTDomainSettings.SecondAuthenticationServer"]
        A0_215[sslVpnTable .. "." .. attribute.tertiaryServer] = L4_219[_UPVALUE16_]["NTDomainSettings.ThirdAuthenticationServer"]
        A0_215[sslVpnTable .. "." .. attribute.authTimeOut] = L4_219[_UPVALUE16_]["NTDomainSettings.TimeOut"]
        A0_215[sslVpnTable .. "." .. attribute.retries] = L4_219[_UPVALUE16_]["NTDomainSettings.Retries"]
        A0_215[sslVpnTable .. "." .. attribute.ntPrimaryDomain] = L4_219[_UPVALUE16_]["NTDomainSettings.NTDomainWorkGroup"]
        A0_215[sslVpnTable .. "." .. attribute.ntSecondaryDomain] = L4_219[_UPVALUE16_]["NTDomainSettings.NTDomainSecondWorkGroup"]
        A0_215[sslVpnTable .. "." .. attribute.ntTertiaryDomain] = L4_219[_UPVALUE16_]["NTDomainSettings.ThirdNTDomainWorkGroup"]
      else
        L4_219 = _UPVALUE9_
        if A1_216 == L4_219 then
          L4_219 = db
          L4_219 = L4_219.getTable
          L4_219 = L4_219(adServerTable)
          if next(L4_219) == NIL then
            return _UPVALUE1_.SSLVPN_USER_AD_SERVER_NOT_ENABLED
          end
          A0_215[sslVpnTable .. "." .. attribute.authType] = _UPVALUE9_
          A0_215[sslVpnTable .. "." .. attribute.primaryServer] = L4_219[_UPVALUE16_]["ActiveDirectorySettings.AuthenticationServer"]
          A0_215[sslVpnTable .. "." .. attribute.secondaryServer] = L4_219[_UPVALUE16_]["ActiveDirectorySettings.SecondAuthenticationServer"]
          A0_215[sslVpnTable .. "." .. attribute.tertiaryServer] = L4_219[_UPVALUE16_]["ActiveDirectorySettings.ThirdAuthenticationServer"]
          A0_215[sslVpnTable .. "." .. attribute.authTimeOut] = L4_219[_UPVALUE16_]["ActiveDirectorySettings.TimeOut"]
          A0_215[sslVpnTable .. "." .. attribute.retries] = L4_219[_UPVALUE16_]["ActiveDirectorySettings.Retries"]
          A0_215[sslVpnTable .. "." .. attribute.adPrimaryDomain] = L4_219[_UPVALUE16_]["ActiveDirectorySettings.ActiveDirectoryDomain"]
          A0_215[sslVpnTable .. "." .. attribute.adSecondaryDomain] = L4_219[_UPVALUE16_]["ActiveDirectorySettings.SecondActiveDirectoryDomain"]
          A0_215[sslVpnTable .. "." .. attribute.adTertiaryDomain] = L4_219[_UPVALUE16_]["ActiveDirectorySettings.ThirdActiveDirectoryDomain"]
        else
          L4_219 = _UPVALUE7_
          if A1_216 == L4_219 then
            L4_219 = db
            L4_219 = L4_219.getTable
            L4_219 = L4_219(ldapTable)
            if next(L4_219) == NIL then
              return _UPVALUE1_.SSLVPN_USER_LDAP_SERVER_NOT_ENABLED
            end
            A0_215[sslVpnTable .. "." .. attribute.authType] = _UPVALUE7_
            A0_215[sslVpnTable .. "." .. attribute.primaryServer] = L4_219[_UPVALUE16_]["LDAPSettings.AuthenticationServer"]
            A0_215[sslVpnTable .. "." .. attribute.secondaryServer] = L4_219[_UPVALUE16_]["LDAPSettings.SecondAuthenticationServer"]
            A0_215[sslVpnTable .. "." .. attribute.tertiaryServer] = L4_219[_UPVALUE16_]["LDAPSettings.ThirdAuthenticationServer"]
            A0_215[sslVpnTable .. "." .. attribute.authTimeOut] = L4_219[_UPVALUE16_]["LDAPSettings.TimeOut"]
            A0_215[sslVpnTable .. "." .. attribute.retries] = L4_219[_UPVALUE16_]["LDAPSettings.Retries"]
            A0_215[sslVpnTable .. "." .. attribute.ldapPrimaryDomain] = L4_219[_UPVALUE16_]["LDAPSettings.LDAPBaseDN"]
            A0_215[sslVpnTable .. "." .. attribute.ldapSecondaryDomain] = L4_219[_UPVALUE16_]["LDAPSettings.SecondLDAPBaseDN"]
            A0_215[sslVpnTable .. "." .. attribute.ldapTertiaryDomain] = L4_219[_UPVALUE16_]["LDAPSettings.ThirdLDAPBaseDN"]
          else
            L4_219 = _UPVALUE10_
            if A1_216 == L4_219 then
              L4_219 = db
              L4_219 = L4_219.getTable
              L4_219 = L4_219(popTable)
              if next(L4_219) == NIL then
                return _UPVALUE1_.SSLVPN_USER_POP3_SERVER_NOT_ENABLED
              end
              A0_215[sslVpnTable .. "." .. attribute.authType] = _UPVALUE10_
              A0_215[sslVpnTable .. "." .. attribute.primaryServer] = L4_219[_UPVALUE16_]["POPProfiles.Server"]
              A0_215[sslVpnTable .. "." .. attribute.secondaryServer] = L4_219[_UPVALUE16_]["POPProfiles.SecondServer"]
              A0_215[sslVpnTable .. "." .. attribute.tertiaryServer] = L4_219[_UPVALUE16_]["POPProfiles.ThirdServer"]
              A0_215[sslVpnTable .. "." .. attribute.authTimeOut] = L4_219[_UPVALUE16_]["POPProfiles.Timeout"]
              A0_215[sslVpnTable .. "." .. attribute.retries] = L4_219[_UPVALUE16_]["POPProfiles.Retries"]
              A0_215[sslVpnTable .. "." .. attribute.primaryCAfile] = L4_219[_UPVALUE16_]["POPProfiles.CAFile"]
              A0_215[sslVpnTable .. "." .. attribute.secondaryCAfile] = L4_219[_UPVALUE16_]["POPProfiles.SecondCAFile"]
              A0_215[sslVpnTable .. "." .. attribute.tertiaryCAfile] = L4_219[_UPVALUE16_]["POPProfiles.ThirdCAFile"]
              A0_215[sslVpnTable .. "." .. attribute.primaryPort] = L4_219[_UPVALUE16_]["POPProfiles.AuthenticationPort"]
              A0_215[sslVpnTable .. "." .. attribute.secondaryPort] = L4_219[_UPVALUE16_]["POPProfiles.SecondAuthenticationPort"]
              A0_215[sslVpnTable .. "." .. attribute.tertiaryPort] = L4_219[_UPVALUE16_]["POPProfiles.ThirdAuthenticationPort"]
              A0_215[sslVpnTable .. "." .. attribute.primarySSL] = L4_219[_UPVALUE16_]["POPProfiles.SSLEnable"]
              A0_215[sslVpnTable .. "." .. attribute.secondarySSL] = L4_219[_UPVALUE16_]["POPProfiles.SecondSSLEnable"]
              A0_215[sslVpnTable .. "." .. attribute.tertiarySSL] = L4_219["POPProfiles.ThirdSSLEnable"]
            end
          end
        end
      end
    end
  end
  L4_219 = db
  L4_219 = L4_219.update
  L4_219 = L4_219(sslVpnTable, A0_215, L2_217)
  if L4_219 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function sslLayoutGetAll()
  local L0_220
  L0_220 = db
  L0_220 = L0_220.getTable
  L0_220 = L0_220(sslPortalLayoutTable)
  if next(L0_220) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_220
end
function sslvpnUserDelete(A0_221)
  local L1_222, L2_223
  L1_222 = NIL
  if A0_221 == L1_222 then
    L1_222 = _UPVALUE0_
    L1_222 = L1_222.INVALID_ARGUMENT
    return L1_222
  end
  L1_222 = db
  L1_222 = L1_222.getAttribute
  L2_223 = sslVpnTable
  L1_222 = L1_222(L2_223, attribute.groupId, A0_221, attribute.portal)
  L2_223 = NIL
  if L1_222 == L2_223 then
    L2_223 = _UPVALUE0_
    L2_223 = L2_223.FAILURE
    return L2_223
  end
  L2_223 = db
  L2_223 = L2_223.existsRow
  L2_223 = L2_223(sslPortalLayoutTable, attribute.portal, L1_222)
  if L2_223 then
    L2_223 = db
    L2_223 = L2_223.getAttribute
    L2_223 = L2_223(sslPortalLayoutTable, attribute.portal, L1_222, attribute.useCount)
    if L2_223 == NIL then
      return _UPVALUE0_.FAILURE
    end
    L2_223 = tonumber(L2_223) - 1
    if db.setAttribute(sslPortalLayoutTable, attribute.portal, L1_222, attribute.useCount, L2_223) == NIL then
      return _UPVALUE0_.FAILURE
    end
  end
  L2_223 = db
  L2_223 = L2_223.deleteRow
  L2_223 = L2_223(sslVpnTable, attribute.groupId, A0_221)
  if L2_223 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_221
end
function groupUsersDeleteCheck(A0_224)
  local L1_225, L2_226
  L1_225 = NIL
  if A0_224 == L1_225 then
    L1_225 = _UPVALUE0_
    L1_225 = L1_225.INVALID_ARGUMENT
    return L1_225
  end
  L1_225 = attribute
  L1_225 = L1_225.groupId
  L2_226 = " = "
  L1_225 = L1_225 .. L2_226 .. A0_224
  L2_226 = db
  L2_226 = L2_226.getRowsWhere
  L2_226 = L2_226(usersTable, L1_225)
  if next(L2_226) ~= NIL then
    return _UPVALUE1_.GROUP_ACTIVE_USERS_DELETE_ERROR
  end
  return _UPVALUE0_.SUCCESS, A0_224
end
function getGroupcapabilities(A0_227, A1_228)
  local L2_229
  L2_229 = db
  L2_229 = L2_229.getAttribute
  L2_229 = L2_229(groupsTable, ROWID, A1_228, attribute.capabilities)
  for _FORV_10_ in string.gmatch(A0_227, "%d") do
    ({})[1] = _FORV_10_
  end
  for _FORV_10_ in string.gmatch(L2_229, "%d") do
    ({})[1] = _FORV_10_
  end
  if #{} >= #{} then
    for _FORV_11_ = 1, #{} do
      if ({})[_FORV_11_] ~= ({})[_FORV_11_] then
        return 1
      end
    end
  else
    for _FORV_11_ = 1, #{} do
      if ({})[_FORV_11_] ~= ({})[_FORV_11_] then
        return 1
      end
    end
  end
  return 1
end
