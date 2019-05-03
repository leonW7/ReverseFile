local L0_0
L0_0 = module
L0_0("com.teamf1.core.authentication.ldap", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/user-management_groups")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/auth_validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/auth_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
ldapTable = "LDAPSettings"
serverCheck = "serverCheck"
userdbDomainTable = "USERDBDomains"
userGroupsTable = "UserGroups"
attribute = {}
attribute.feature = "feature"
attribute.profile = "ProfileName"
attribute.primaryServer = "AuthenticationServer"
attribute.secondaryServer = "SecondAuthenticationServer"
attribute.tertiaryServer = "ThirdAuthenticationServer"
attribute.primaryDomain = "LDAPBaseDN"
attribute.secondaryDomain = "SecondLDAPBaseDN"
attribute.tertiaryDomain = "ThirdLDAPBaseDN"
attribute.timeout = "TimeOut"
attribute.maxRetries = "Retries"
attribute.attribute1 = "LDAPAttribute1"
attribute.attribute2 = "LDAPAttribute2"
attribute.attribute3 = "LDAPAttribute3"
attribute.attribute4 = "LDAPAttribute4"
attribute.primaryAdminUser = "FirstAdminAccount"
attribute.primaryAdminPassword = "FirstAdminPasswd"
attribute.secondaryAdminUser = "SecondAdminAccount"
attribute.secondrayAdminPassword = "SecondAdminPasswd"
attribute.tertiaryAdminUser = "ThirdAdminAccount"
attribute.tertiaryAdminPassword = "ThirdAdminPasswd"
attribute.authType = "authType"
attribute.checkNow = "checkNow"
attribute.updateFromWeb = "updateFromWeb"
attribute.response = "response"
attribute.primaryServerStatus = "firstServerStatus"
attribute.secondaryServerStatus = "secondServerStatus"
attribute.tertiaryServerStatus = "thirdServerStatus"
attribute.authenticationType = "AuthenticationType"
attribute.authProfile = "AuthProfile"
NIL = nil
FALSE = false
ENABLE = 1
DISABLE = 0
LENGTH_MAX = 128
LENGTH_MIN = 0
PORT_MAX = 65536
PORT_MIN = 1
ROWID = "_ROWID_"
MAX_RETRIES = 9
MIN_RETRIES = 0
MAX_TIME = 999
MIN_TIME = 0
FIRST_COOKIE = "1"
SECOND_COOKIE = "2"
ATTRIB_LENGTH_MAX = 32
ATTRIB_LENGTH_MIN = 0
IPV4_ADDRESS_FAMILY = "2"
function isfeatureEnabled()
  local L1_1
  L1_1 = _UPVALUE0_
  L1_1 = L1_1.NOT_SUPPORTED
  return L1_1
end
function isfeatureEnabledNext(A0_2)
  return _UPVALUE0_.NOT_SUPPORTED
end
function featureEnable(A0_3)
  return _UPVALUE0_.NOT_SUPPORTED
end
function featureDisable(A0_4)
  return _UPVALUE0_.NOT_SUPPORTED
end
function profileGet()
  local L0_5
  L0_5 = db
  L0_5 = L0_5.getAttribute
  L0_5 = L0_5(ldapTable, ROWID, FIRST_COOKIE, attribute.profile)
  if L0_5 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_5
end
function profileGetNext(A0_6)
  return _UPVALUE0_.NOT_SUPPORTED
end
function profileSet(A0_7, A1_8)
  local L2_9, L3_10
  L2_9 = cookieValidate
  L3_10 = ROWID
  L3_10 = L2_9(L3_10, A0_7, ldapTable)
  if L2_9 ~= _UPVALUE0_.SUCCESS then
    return L2_9
  end
  if A1_8 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_8) > LENGTH_MAX or string.len(A1_8) < LENGTH_MIN then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(ldapTable, ROWID, L3_10, attribute.profile, A1_8) == NIL then
    return _UPVALUE0_.FAILURE, L3_10
  end
  return _UPVALUE0_.SUCCESS, L3_10
end
function primaryServerGet()
  local L0_11
  L0_11 = db
  L0_11 = L0_11.getAttribute
  L0_11 = L0_11(ldapTable, ROWID, FIRST_COOKIE, attribute.primaryServer)
  if L0_11 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_11
end
function primaryServerGetNext(A0_12)
  return _UPVALUE0_.NOT_SUPPORTED
end
function primaryServerSet(A0_13, A1_14)
  local L2_15, L3_16
  L2_15 = cookieValidate
  L3_16 = ROWID
  L3_16 = L2_15(L3_16, A0_13, ldapTable)
  if L2_15 ~= _UPVALUE0_.SUCCESS then
    return L2_15
  end
  if A1_14 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck(IPV4_ADDRESS_FAMILY, A1_14)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(ldapTable, ROWID, L3_16, attribute.primaryServer, A1_14) == NIL then
    return _UPVALUE0_.FAILURE, L3_16
  end
  return _UPVALUE0_.SUCCESS, L3_16
end
function secondaryServerGet()
  local L0_17
  L0_17 = db
  L0_17 = L0_17.getAttribute
  L0_17 = L0_17(ldapTable, ROWID, FIRST_COOKIE, attribute.secondaryServer)
  if L0_17 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_17
end
function secondaryServerGetNext(A0_18)
  return _UPVALUE0_.NOT_SUPPORTED
end
function secondaryServerSet(A0_19, A1_20)
  local L2_21, L3_22
  L2_21 = cookieValidate
  L3_22 = ROWID
  L3_22 = L2_21(L3_22, A0_19, ldapTable)
  if L2_21 ~= _UPVALUE0_.SUCCESS then
    return L2_21
  end
  if A1_20 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck(IPV4_ADDRESS_FAMILY, A1_20)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(ldapTable, ROWID, L3_22, attribute.secondaryServer, A1_20) == NIL then
    return _UPVALUE0_.FAILURE, L3_22
  end
  return _UPVALUE0_.SUCCESS, L3_22
end
function tertiaryServerGet()
  local L0_23
  L0_23 = db
  L0_23 = L0_23.getAttribute
  L0_23 = L0_23(ldapTable, ROWID, FIRST_COOKIE, attribute.tertiaryServer)
  if L0_23 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_23
end
function tertiaryServerGetNext(A0_24)
  return _UPVALUE0_.NOT_SUPPORTED
end
function tertiaryServerSet(A0_25, A1_26)
  local L2_27, L3_28
  L2_27 = cookieValidate
  L3_28 = ROWID
  L3_28 = L2_27(L3_28, A0_25, ldapTable)
  if L2_27 ~= _UPVALUE0_.SUCCESS then
    return L2_27
  end
  if A1_26 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck(IPV4_ADDRESS_FAMILY, A1_26)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(ldapTable, ROWID, L3_28, attribute.tertiaryServer, A1_26) == NIL then
    return _UPVALUE0_.FAILURE, L3_28
  end
  return _UPVALUE0_.SUCCESS, L3_28
end
function primaryDomainGet()
  local L0_29
  L0_29 = db
  L0_29 = L0_29.getAttribute
  L0_29 = L0_29(ldapTable, ROWID, FIRST_COOKIE, attribute.primaryDomain)
  if L0_29 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_29
end
function primaryDomainGetNext(A0_30)
  return _UPVALUE0_.NOT_SUPPORTED
end
function primaryDomainSet(A0_31, A1_32)
  local L2_33, L3_34
  L2_33 = cookieValidate
  L3_34 = ROWID
  L3_34 = L2_33(L3_34, A0_31, ldapTable)
  if L2_33 ~= _UPVALUE0_.SUCCESS then
    return L2_33
  end
  if A1_32 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.fqdnCheck(A1_32)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(ldapTable, ROWID, L3_34, attribute.primaryDomain, A1_32) == NIL then
    return _UPVALUE0_.FAILURE, L3_34
  end
  return _UPVALUE0_.SUCCESS, L3_34
end
function secondaryDomainGet()
  local L0_35
  L0_35 = db
  L0_35 = L0_35.getAttribute
  L0_35 = L0_35(ldapTable, ROWID, FIRST_COOKIE, attribute.secondaryDomain)
  if L0_35 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_35
end
function secondaryDomainGetNext(A0_36)
  return _UPVALUE0_.NOT_SUPPORTED
end
function secondaryDomainSet(A0_37, A1_38)
  local L2_39, L3_40
  L2_39 = cookieValidate
  L3_40 = ROWID
  L3_40 = L2_39(L3_40, A0_37, ldapTable)
  if L2_39 ~= _UPVALUE0_.SUCCESS then
    return L2_39
  end
  if A1_38 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.fqdnCheck(A1_38)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(ldapTable, ROWID, L3_40, attribute.secondaryDomain, A1_38) == NIL then
    return _UPVALUE0_.FAILURE, L3_40
  end
  return _UPVALUE0_.SUCCESS, L3_40
end
function tertiaryDomainGet()
  local L0_41
  L0_41 = db
  L0_41 = L0_41.getAttribute
  L0_41 = L0_41(ldapTable, ROWID, FIRST_COOKIE, attribute.tertiaryDomain)
  if L0_41 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_41
end
function tertiaryDomainGetNext(A0_42)
  return _UPVALUE0_.NOT_SUPPORTED
end
function tertiaryDomainSet(A0_43, A1_44)
  local L2_45, L3_46
  L2_45 = cookieValidate
  L3_46 = ROWID
  L3_46 = L2_45(L3_46, A0_43, ldapTable)
  if L2_45 ~= _UPVALUE0_.SUCCESS then
    return L2_45
  end
  if A1_44 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.fqdnCheck(A1_44)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(ldapTable, ROWID, L3_46, attribute.tertiaryDomain, A1_44) == NIL then
    return _UPVALUE0_.FAILURE, L3_46
  end
  return _UPVALUE0_.SUCCESS, L3_46
end
function timeoutGet()
  local L0_47
  L0_47 = db
  L0_47 = L0_47.getAttribute
  L0_47 = L0_47(ldapTable, ROWID, FIRST_COOKIE, attribute.timeout)
  if L0_47 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_47
end
function timeoutGetNext(A0_48)
  return _UPVALUE0_.NOT_SUPPORTED
end
function timeoutSet(A0_49, A1_50)
  local L2_51, L3_52
  L2_51 = cookieValidate
  L3_52 = ROWID
  L3_52 = L2_51(L3_52, A0_49, ldapTable)
  if L2_51 ~= _UPVALUE0_.SUCCESS then
    return L2_51
  end
  if A1_50 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_50) < MIN_TIME or tonumber(A1_50) > MAX_TIME then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(ldapTable, ROWID, L3_52, attribute.timeout, A1_50) == NIL then
    return _UPVALUE0_.FAILURE, L3_52
  end
  return _UPVALUE0_.SUCCESS, L3_52
end
function maxRetriesGet()
  local L0_53
  L0_53 = db
  L0_53 = L0_53.getAttribute
  L0_53 = L0_53(ldapTable, ROWID, FIRST_COOKIE, attribute.maxRetries)
  if L0_53 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_53
end
function maxRetriesGetNext(A0_54)
  return _UPVALUE0_.NOT_SUPPORTED
end
function maxRetriesSet(A0_55, A1_56)
  local L2_57, L3_58
  L2_57 = cookieValidate
  L3_58 = ROWID
  L3_58 = L2_57(L3_58, A0_55, ldapTable)
  if L2_57 ~= _UPVALUE0_.SUCCESS then
    return L2_57
  end
  if A1_56 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_56) < MIN_RETRIES or tonumber(A1_56) > MAX_RETRIES then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(ldapTable, ROWID, L3_58, attribute.maxRetries, A1_56) == NIL then
    return _UPVALUE0_.FAILURE, L3_58
  end
  return _UPVALUE0_.SUCCESS, L3_58
end
function attribute1Get()
  local L0_59
  L0_59 = db
  L0_59 = L0_59.getAttribute
  L0_59 = L0_59(ldapTable, ROWID, FIRST_COOKIE, attribute.attribute1)
  if L0_59 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_59
end
function attribute1GetNext(A0_60)
  return _UPVALUE0_.NOT_SUPPORTED
end
function attribute1Set(A0_61, A1_62)
  local L2_63, L3_64
  L2_63 = cookieValidate
  L3_64 = ROWID
  L3_64 = L2_63(L3_64, A0_61, ldapTable)
  if L2_63 ~= _UPVALUE0_.SUCCESS then
    return L2_63
  end
  if A1_62 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(ldapTable, ROWID, L3_64, attribute.attribute1, A1_62) == NIL then
    return _UPVALUE0_.FAILURE, L3_64
  end
  return _UPVALUE0_.SUCCESS, L3_64
end
function attribute2Get()
  local L0_65
  L0_65 = db
  L0_65 = L0_65.getAttribute
  L0_65 = L0_65(ldapTable, ROWID, FIRST_COOKIE, attribute.attribute2)
  if L0_65 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_65
end
function attribute2GetNext(A0_66)
  return _UPVALUE0_.NOT_SUPPORTED
end
function attribute2Set(A0_67, A1_68)
  local L2_69, L3_70
  L2_69 = cookieValidate
  L3_70 = ROWID
  L3_70 = L2_69(L3_70, A0_67, ldapTable)
  if L2_69 ~= _UPVALUE0_.SUCCESS then
    return L2_69
  end
  if A1_68 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_68) > ATTRIB_LENGTH_MAX or string.len(A1_68) < ATTRIB_LENGTH_MIN then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(ldapTable, ROWID, L3_70, attribute.attribute2, A1_68) == NIL then
    return _UPVALUE0_.FAILURE, L3_70
  end
  return _UPVALUE0_.SUCCESS, L3_70
end
function attribute3Get()
  local L0_71
  L0_71 = db
  L0_71 = L0_71.getAttribute
  L0_71 = L0_71(ldapTable, ROWID, FIRST_COOKIE, attribute.attribute3)
  if L0_71 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_71
end
function attribute3GetNext(A0_72)
  return _UPVALUE0_.NOT_SUPPORTED
end
function attribute3Set(A0_73, A1_74)
  local L2_75, L3_76
  L2_75 = cookieValidate
  L3_76 = ROWID
  L3_76 = L2_75(L3_76, A0_73, ldapTable)
  if L2_75 ~= _UPVALUE0_.SUCCESS then
    return L2_75
  end
  if A1_74 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_74) > ATTRIB_LENGTH_MAX or string.len(A1_74) < ATTRIB_LENGTH_MIN then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(ldapTable, ROWID, L3_76, attribute.attribute3, A1_74) == NIL then
    return _UPVALUE0_.FAILURE, L3_76
  end
  return _UPVALUE0_.SUCCESS, L3_76
end
function attribute4Get()
  local L0_77
  L0_77 = db
  L0_77 = L0_77.getAttribute
  L0_77 = L0_77(ldapTable, ROWID, FIRST_COOKIE, attribute.attribute4)
  if L0_77 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_77
end
function attribute4GetNext(A0_78)
  return _UPVALUE0_.NOT_SUPPORTED
end
function attribute4Set(A0_79, A1_80)
  local L2_81, L3_82
  L2_81 = cookieValidate
  L3_82 = ROWID
  L3_82 = L2_81(L3_82, A0_79, ldapTable)
  if L2_81 ~= _UPVALUE0_.SUCCESS then
    return L2_81
  end
  if A1_80 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_80) > ATTRIB_LENGTH_MAX or string.len(A1_80) < ATTRIB_LENGTH_MIN then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(ldapTable, ROWID, L3_82, attribute.attribute4, A1_80) == NIL then
    return _UPVALUE0_.FAILURE, L3_82
  end
  return _UPVALUE0_.SUCCESS, L3_82
end
function primaryAdminUserGet()
  local L0_83
  L0_83 = db
  L0_83 = L0_83.getAttribute
  L0_83 = L0_83(ldapTable, ROWID, FIRST_COOKIE, attribute.primaryAdminUser)
  if L0_83 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_83
end
function primaryAdminUserGetNext(A0_84)
  return _UPVALUE0_.NOT_SUPPORTED
end
function primaryAdminUserSet(A0_85, A1_86)
  local L2_87, L3_88
  L2_87 = cookieValidate
  L3_88 = ROWID
  L3_88 = L2_87(L3_88, A0_85, ldapTable)
  if L2_87 ~= _UPVALUE0_.SUCCESS then
    return L2_87
  end
  if A1_86 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_86) > LENGTH_MAX or string.len(A1_86) < LENGTH_MIN then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(ldapTable, ROWID, L3_88, attribute.primaryAdminUser, A1_86) == NIL then
    return _UPVALUE0_.FAILURE, L3_88
  end
  return _UPVALUE0_.SUCCESS, L3_88
end
function primaryAdminPasswordGet()
  local L0_89
  L0_89 = db
  L0_89 = L0_89.getAttribute
  L0_89 = L0_89(ldapTable, ROWID, FIRST_COOKIE, attribute.primaryAdminPassword)
  if L0_89 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_89
end
function primaryAdminPasswordGetNext(A0_90)
  return _UPVALUE0_.NOT_SUPPORTED
end
function primaryAdminPasswordSet(A0_91, A1_92)
  local L2_93, L3_94
  L2_93 = cookieValidate
  L3_94 = ROWID
  L3_94 = L2_93(L3_94, A0_91, ldapTable)
  if L2_93 ~= _UPVALUE0_.SUCCESS then
    return L2_93
  end
  if A1_92 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_92) > LENGTH_MAX or string.len(A1_92) < LENGTH_MIN then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(ldapTable, ROWID, L3_94, attribute.primaryAdminPassword, A1_92) == NIL then
    return _UPVALUE0_.FAILURE, L3_94
  end
  return _UPVALUE0_.SUCCESS, L3_94
end
function secondaryAdminUserGet()
  local L0_95
  L0_95 = db
  L0_95 = L0_95.getAttribute
  L0_95 = L0_95(ldapTable, ROWID, FIRST_COOKIE, attribute.secondaryAdminUser)
  if L0_95 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_95
end
function secondaryAdminUserGetNext(A0_96)
  return _UPVALUE0_.NOT_SUPPORTED
end
function secondaryAdminUserSet(A0_97, A1_98)
  local L2_99, L3_100
  L2_99 = cookieValidate
  L3_100 = ROWID
  L3_100 = L2_99(L3_100, A0_97, ldapTable)
  if L2_99 ~= _UPVALUE0_.SUCCESS then
    return L2_99
  end
  if A1_98 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_98) > LENGTH_MAX or string.len(A1_98) < LENGTH_MIN then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(ldapTable, ROWID, L3_100, attribute.secondaryAdminUser, A1_98) == NIL then
    return _UPVALUE0_.FAILURE, L3_100
  end
  return _UPVALUE0_.SUCCESS, L3_100
end
function secondrayAdminPasswordGet()
  local L0_101
  L0_101 = db
  L0_101 = L0_101.getAttribute
  L0_101 = L0_101(ldapTable, ROWID, FIRST_COOKIE, attribute.secondrayAdminPassword)
  if L0_101 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_101
end
function secondrayAdminPasswordGetNext(A0_102)
  return _UPVALUE0_.NOT_SUPPORTED
end
function secondrayAdminPasswordSet(A0_103, A1_104)
  local L2_105, L3_106
  L2_105 = cookieValidate
  L3_106 = ROWID
  L3_106 = L2_105(L3_106, A0_103, ldapTable)
  if L2_105 ~= _UPVALUE0_.SUCCESS then
    return L2_105
  end
  if A1_104 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_104) > LENGTH_MAX or string.len(A1_104) < LENGTH_MIN then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(ldapTable, ROWID, L3_106, attribute.secondrayAdminPassword, A1_104) == NIL then
    return _UPVALUE0_.FAILURE, L3_106
  end
  return _UPVALUE0_.SUCCESS, L3_106
end
function tertiaryAdminUserGet()
  local L0_107
  L0_107 = db
  L0_107 = L0_107.getAttribute
  L0_107 = L0_107(ldapTable, ROWID, FIRST_COOKIE, attribute.tertiaryAdminUser)
  if L0_107 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_107
end
function tertiaryAdminUserGetNext(A0_108)
  return _UPVALUE0_.NOT_SUPPORTED
end
function tertiaryAdminUserSet(A0_109, A1_110)
  local L2_111, L3_112
  L2_111 = cookieValidate
  L3_112 = ROWID
  L3_112 = L2_111(L3_112, A0_109, ldapTable)
  if L2_111 ~= _UPVALUE0_.SUCCESS then
    return L2_111
  end
  if A1_110 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_110) > LENGTH_MAX or string.len(A1_110) < LENGTH_MIN then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(ldapTable, ROWID, L3_112, attribute.tertiaryAdminUser, A1_110) == NIL then
    return _UPVALUE0_.FAILURE, L3_112
  end
  return _UPVALUE0_.SUCCESS, L3_112
end
function tertiaryAdminPasswordGet()
  local L0_113
  L0_113 = db
  L0_113 = L0_113.getAttribute
  L0_113 = L0_113(ldapTable, ROWID, FIRST_COOKIE, attribute.tertiaryAdminPassword)
  if L0_113 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_113
end
function tertiaryAdminPasswordGetNext(A0_114)
  return _UPVALUE0_.NOT_SUPPORTED
end
function tertiaryAdminPasswordSet(A0_115, A1_116)
  local L2_117, L3_118
  L2_117 = cookieValidate
  L3_118 = ROWID
  L3_118 = L2_117(L3_118, A0_115, ldapTable)
  if L2_117 ~= _UPVALUE0_.SUCCESS then
    return L2_117
  end
  if A1_116 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_116) > LENGTH_MAX or string.len(A1_116) < LENGTH_MIN then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(ldapTable, ROWID, L3_118, attribute.tertiaryAdminPassword, A1_116) == NIL then
    return _UPVALUE0_.FAILURE, L3_118
  end
  return _UPVALUE0_.SUCCESS, L3_118
end
function serverGet()
  if db.getRow(ldapTable, ROWID, FIRST_COOKIE) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, db.getRow(ldapTable, ROWID, FIRST_COOKIE)[ldapTable .. "." .. attribute.profile], db.getRow(ldapTable, ROWID, FIRST_COOKIE)[ldapTable .. "." .. attribute.primaryServer], db.getRow(ldapTable, ROWID, FIRST_COOKIE)[ldapTable .. "." .. attribute.secondaryServer], db.getRow(ldapTable, ROWID, FIRST_COOKIE)[ldapTable .. "." .. attribute.tertiaryServer], db.getRow(ldapTable, ROWID, FIRST_COOKIE)[ldapTable .. "." .. attribute.primaryDomain], db.getRow(ldapTable, ROWID, FIRST_COOKIE)[ldapTable .. "." .. attribute.secondaryDomain], db.getRow(ldapTable, ROWID, FIRST_COOKIE)[ldapTable .. "." .. attribute.tertiaryDomain], db.getRow(ldapTable, ROWID, FIRST_COOKIE)[ldapTable .. "." .. attribute.timeout], db.getRow(ldapTable, ROWID, FIRST_COOKIE)[ldapTable .. "." .. attribute.maxRetries], db.getRow(ldapTable, ROWID, FIRST_COOKIE)[ldapTable .. "." .. attribute.attribute1], db.getRow(ldapTable, ROWID, FIRST_COOKIE)[ldapTable .. "." .. attribute.attribute2], db.getRow(ldapTable, ROWID, FIRST_COOKIE)[ldapTable .. "." .. attribute.attribute3], db.getRow(ldapTable, ROWID, FIRST_COOKIE)[ldapTable .. "." .. attribute.attribute4], db.getRow(ldapTable, ROWID, FIRST_COOKIE)[ldapTable .. "." .. attribute.primaryAdminUser], db.getRow(ldapTable, ROWID, FIRST_COOKIE)[ldapTable .. "." .. attribute.primaryAdminPassword], db.getRow(ldapTable, ROWID, FIRST_COOKIE)[ldapTable .. "." .. attribute.secondaryAdminUser], db.getRow(ldapTable, ROWID, FIRST_COOKIE)[ldapTable .. "." .. attribute.secondrayAdminPassword], db.getRow(ldapTable, ROWID, FIRST_COOKIE)[ldapTable .. "." .. attribute.tertiaryAdminUser], db.getRow(ldapTable, ROWID, FIRST_COOKIE)[ldapTable .. "." .. attribute.tertiaryAdminPassword]
end
function serverGetNext(A0_119)
  return _UPVALUE0_.NOT_SUPPORTED
end
function serverSet(A0_120, A1_121, A2_122, A3_123, A4_124, A5_125, A6_126, A7_127, A8_128, A9_129, A10_130, A11_131, A12_132, A13_133, A14_134, A15_135, A16_136, A17_137, A18_138, A19_139)
  local L20_140, L21_141, L22_142, L23_143, L24_144, L25_145, L26_146, L27_147, L28_148, L29_149, L30_150, L31_151, L32_152, L33_153, L34_154, L35_155
  L20_140 = NIL
  if A1_121 == L20_140 or A1_121 == "" then
    L20_140 = _UPVALUE0_
    L20_140 = L20_140.LDAP_SERVER_PROFILE_NIL
    return L20_140
  end
  L20_140 = string
  L20_140 = L20_140.len
  L21_141 = A1_121
  L20_140 = L20_140(L21_141)
  L21_141 = LENGTH_MAX
  if not (L20_140 > L21_141) then
    L21_141 = LENGTH_MIN
  elseif L20_140 < L21_141 then
    L21_141 = _UPVALUE0_
    L21_141 = L21_141.LDAP_SERVER_PROFILE_INVALID
    return L21_141
  end
  L21_141 = NIL
  if A2_122 == L21_141 or A2_122 == "" then
    L21_141 = _UPVALUE0_
    L21_141 = L21_141.LDAP_SERVER_PRIMARY_IPADDRESS_NIL
    return L21_141
  end
  L21_141 = _UPVALUE1_
  L21_141 = L21_141.ipAddressCheck
  L22_142 = IPV4_ADDRESS_FAMILY
  L23_143 = A2_122
  L21_141 = L21_141(L22_142, L23_143)
  valid = L21_141
  L21_141 = valid
  L22_142 = _UPVALUE2_
  L22_142 = L22_142.SUCCESS
  if L21_141 ~= L22_142 then
    L21_141 = _UPVALUE0_
    L21_141 = L21_141.LDAP_SERVER_PRIMARY_IPADDRESS_INVALID
    return L21_141
  end
  L21_141 = NIL
  if A3_123 ~= L21_141 and A3_123 ~= "" then
    L21_141 = _UPVALUE1_
    L21_141 = L21_141.ipAddressCheck
    L22_142 = IPV4_ADDRESS_FAMILY
    L23_143 = A3_123
    L21_141 = L21_141(L22_142, L23_143)
    valid = L21_141
    L21_141 = valid
    L22_142 = _UPVALUE2_
    L22_142 = L22_142.SUCCESS
    if L21_141 ~= L22_142 then
      L21_141 = _UPVALUE0_
      L21_141 = L21_141.LDAP_SERVER_SECONDARY_IPADDRESS_INVALID
      return L21_141
    end
  end
  L21_141 = NIL
  if A4_124 ~= L21_141 and A4_124 ~= "" then
    L21_141 = _UPVALUE1_
    L21_141 = L21_141.ipAddressCheck
    L22_142 = IPV4_ADDRESS_FAMILY
    L23_143 = A4_124
    L21_141 = L21_141(L22_142, L23_143)
    valid = L21_141
    L21_141 = valid
    L22_142 = _UPVALUE2_
    L22_142 = L22_142.SUCCESS
    if L21_141 ~= L22_142 then
      L21_141 = _UPVALUE0_
      L21_141 = L21_141.LDAP_SERVER_TERTIARY_IPADDRESS_INVALID
      return L21_141
    end
  end
  L21_141 = NIL
  if A5_125 == L21_141 or A5_125 == "" then
    L21_141 = _UPVALUE0_
    L21_141 = L21_141.LDAP_SERVER_PRIMARY_DOMAIN_NIL
    return L21_141
  end
  L21_141 = _UPVALUE1_
  L21_141 = L21_141.fqdnCheck
  L22_142 = A5_125
  L21_141 = L21_141(L22_142)
  valid = L21_141
  L21_141 = valid
  L22_142 = _UPVALUE2_
  L22_142 = L22_142.SUCCESS
  if L21_141 ~= L22_142 then
    L21_141 = _UPVALUE0_
    L21_141 = L21_141.LDAP_SERVER_PRIMARY_DOMAIN_INVALID
    return L21_141
  end
  L21_141 = NIL
  if A3_123 ~= L21_141 and A3_123 ~= "" then
    L21_141 = NIL
    if A6_126 == L21_141 or A6_126 == "" then
      L21_141 = _UPVALUE0_
      L21_141 = L21_141.LDAP_SERVER_SECONDARY_DOMAIN_NIL
      return L21_141
    end
    L21_141 = _UPVALUE1_
    L21_141 = L21_141.fqdnCheck
    L22_142 = A6_126
    L21_141 = L21_141(L22_142)
    valid = L21_141
    L21_141 = valid
    L22_142 = _UPVALUE2_
    L22_142 = L22_142.SUCCESS
    if L21_141 ~= L22_142 then
      L21_141 = _UPVALUE0_
      L21_141 = L21_141.LDAP_SERVER_SECONDARY_DOMAIN_INVALID
      return L21_141
    end
  end
  L21_141 = NIL
  if A4_124 ~= L21_141 and A4_124 ~= "" then
    L21_141 = NIL
    if A7_127 == L21_141 or A7_127 == "" then
      L21_141 = _UPVALUE0_
      L21_141 = L21_141.LDAP_SERVER_TERTIARY_DOMAIN_NIL
      return L21_141
    end
    L21_141 = _UPVALUE1_
    L21_141 = L21_141.fqdnCheck
    L22_142 = A7_127
    L21_141 = L21_141(L22_142)
    valid = L21_141
    L21_141 = valid
    L22_142 = _UPVALUE2_
    L22_142 = L22_142.SUCCESS
    if L21_141 ~= L22_142 then
      L21_141 = _UPVALUE0_
      L21_141 = L21_141.LDAP_SERVER_TERTIARY_DOMAIN_INVALID
      return L21_141
    end
  end
  L21_141 = NIL
  if A8_128 == L21_141 or A8_128 == "" then
    L21_141 = _UPVALUE0_
    L21_141 = L21_141.LDAP_SERVER_TIMEOUT_NIL
    return L21_141
  end
  L21_141 = tonumber
  L22_142 = A8_128
  L21_141 = L21_141(L22_142)
  L22_142 = MIN_TIME
  if not (L21_141 < L22_142) then
    L22_142 = MAX_TIME
  elseif L21_141 > L22_142 then
    L22_142 = _UPVALUE0_
    L22_142 = L22_142.LDAP_SERVER_TIMEOUT_INVALID
    return L22_142
  end
  L22_142 = NIL
  if A9_129 == L22_142 or A9_129 == "" then
    L22_142 = _UPVALUE0_
    L22_142 = L22_142.LDAP_SERVER_MAX_RETRIES_NIL
    return L22_142
  end
  L22_142 = tonumber
  L23_143 = A9_129
  L22_142 = L22_142(L23_143)
  L23_143 = MIN_RETRIES
  if not (L22_142 < L23_143) then
    L23_143 = MAX_RETRIES
  elseif L22_142 > L23_143 then
    L23_143 = _UPVALUE0_
    L23_143 = L23_143.LDAP_SERVER_MAX_RETRIES_INVALID
    return L23_143
  end
  L23_143 = NIL
  if A10_130 ~= L23_143 and A10_130 ~= "" then
    L23_143 = string
    L23_143 = L23_143.len
    L24_144 = A10_130
    L23_143 = L23_143(L24_144)
    L24_144 = ATTRIB_LENGTH_MAX
    if not (L23_143 > L24_144) then
      L24_144 = ATTRIB_LENGTH_MIN
    elseif L23_143 < L24_144 then
      L24_144 = _UPVALUE0_
      L24_144 = L24_144.LDAP_SERVER_ATTRIBUTE1_INVALID
      return L24_144
    end
  end
  L23_143 = NIL
  if A11_131 ~= L23_143 and A11_131 ~= "" then
    L23_143 = string
    L23_143 = L23_143.len
    L24_144 = A11_131
    L23_143 = L23_143(L24_144)
    L24_144 = ATTRIB_LENGTH_MAX
    if not (L23_143 > L24_144) then
      L24_144 = ATTRIB_LENGTH_MIN
    elseif L23_143 < L24_144 then
      L24_144 = _UPVALUE0_
      L24_144 = L24_144.LDAP_SERVER_ATTRIBUTE2_INVALID
      return L24_144
    end
  end
  L23_143 = NIL
  if A12_132 ~= L23_143 and A12_132 ~= "" then
    L23_143 = string
    L23_143 = L23_143.len
    L24_144 = A12_132
    L23_143 = L23_143(L24_144)
    L24_144 = ATTRIB_LENGTH_MAX
    if not (L23_143 > L24_144) then
      L24_144 = ATTRIB_LENGTH_MIN
    elseif L23_143 < L24_144 then
      L24_144 = _UPVALUE0_
      L24_144 = L24_144.LDAP_SERVER_ATTRIBUTE3_INVALID
      return L24_144
    end
  end
  L23_143 = NIL
  if A13_133 ~= L23_143 and A13_133 ~= "" then
    L23_143 = string
    L23_143 = L23_143.len
    L24_144 = A13_133
    L23_143 = L23_143(L24_144)
    L24_144 = ATTRIB_LENGTH_MAX
    if not (L23_143 > L24_144) then
      L24_144 = ATTRIB_LENGTH_MIN
    elseif L23_143 < L24_144 then
      L24_144 = _UPVALUE0_
      L24_144 = L24_144.LDAP_SERVER_ATTRIBUTE4_INVALID
      return L24_144
    end
  end
  L23_143 = NIL
  if A14_134 ~= L23_143 and A14_134 ~= "" then
    L23_143 = string
    L23_143 = L23_143.len
    L24_144 = A14_134
    L23_143 = L23_143(L24_144)
    L24_144 = LENGTH_MAX
    if not (L23_143 > L24_144) then
      L24_144 = LENGTH_MIN
    elseif L23_143 < L24_144 then
      L24_144 = _UPVALUE0_
      L24_144 = L24_144.LDAP_SERVER_PRIMARY_USER_INVALID
      return L24_144
    end
  end
  L23_143 = NIL
  if A14_134 ~= L23_143 and A14_134 ~= "" then
    L23_143 = NIL
    if A15_135 == L23_143 or A15_135 == "" then
      L23_143 = _UPVALUE0_
      L23_143 = L23_143.LDAP_SERVER_PRIMARY_PASSWORD_NIL
      return L23_143
    end
    L23_143 = string
    L23_143 = L23_143.len
    L24_144 = A15_135
    L23_143 = L23_143(L24_144)
    L24_144 = LENGTH_MAX
    if not (L23_143 > L24_144) then
      L24_144 = LENGTH_MIN
    elseif L23_143 < L24_144 then
      L24_144 = _UPVALUE0_
      L24_144 = L24_144.LDAP_SERVER_PRIMARY_PASSWORD_INVALID
      return L24_144
    end
  end
  L23_143 = NIL
  if A16_136 ~= L23_143 and A16_136 ~= "" then
    L23_143 = string
    L23_143 = L23_143.len
    L24_144 = A16_136
    L23_143 = L23_143(L24_144)
    L24_144 = LENGTH_MAX
    if not (L23_143 > L24_144) then
      L24_144 = LENGTH_MIN
    elseif L23_143 < L24_144 then
      L24_144 = _UPVALUE0_
      L24_144 = L24_144.LDAP_SERVER_SECONDARY_USER_INVALID
      return L24_144
    end
  end
  L23_143 = NIL
  if A16_136 ~= L23_143 and A16_136 ~= "" then
    L23_143 = NIL
    if A17_137 == L23_143 or A17_137 == "" then
      L23_143 = _UPVALUE0_
      L23_143 = L23_143.LDAP_SERVER_SECONDARY_PASSWORD_NIL
      return L23_143
    end
    L23_143 = string
    L23_143 = L23_143.len
    L24_144 = A17_137
    L23_143 = L23_143(L24_144)
    L24_144 = LENGTH_MAX
    if not (L23_143 > L24_144) then
      L24_144 = LENGTH_MIN
    elseif L23_143 < L24_144 then
      L24_144 = _UPVALUE0_
      L24_144 = L24_144.LDAP_SERVER_SECONDARY_PASSWORD_INVALID
      return L24_144
    end
  end
  L23_143 = NIL
  if A18_138 ~= L23_143 and A18_138 ~= "" then
    L23_143 = string
    L23_143 = L23_143.len
    L24_144 = A18_138
    L23_143 = L23_143(L24_144)
    L24_144 = LENGTH_MAX
    if not (L23_143 > L24_144) then
      L24_144 = LENGTH_MIN
    elseif L23_143 < L24_144 then
      L24_144 = _UPVALUE0_
      L24_144 = L24_144.LDAP_SERVER_TERTIARY_USER_INVALID
      return L24_144
    end
  end
  L23_143 = NIL
  if A18_138 ~= L23_143 and A18_138 ~= "" then
    L23_143 = NIL
    if A19_139 == L23_143 or A19_139 == "" then
      L23_143 = _UPVALUE0_
      L23_143 = L23_143.LDAP_SERVER_TERTIARY_PASSWORD_NIL
      return L23_143
    end
    L23_143 = string
    L23_143 = L23_143.len
    L24_144 = A19_139
    L23_143 = L23_143(L24_144)
    L24_144 = LENGTH_MAX
    if not (L23_143 > L24_144) then
      L24_144 = LENGTH_MIN
    elseif L23_143 < L24_144 then
      L24_144 = _UPVALUE0_
      L24_144 = L24_144.LDAP_SERVER_TERTIARY_PASSWORD_INVALID
      return L24_144
    end
  end
  L23_143 = {}
  L24_144 = ldapTable
  L25_145 = "."
  L26_146 = attribute
  L26_146 = L26_146.profile
  L24_144 = L24_144 .. L25_145 .. L26_146
  L23_143[L24_144] = A1_121
  L24_144 = ldapTable
  L25_145 = "."
  L26_146 = attribute
  L26_146 = L26_146.primaryServer
  L24_144 = L24_144 .. L25_145 .. L26_146
  L23_143[L24_144] = A2_122
  L24_144 = ldapTable
  L25_145 = "."
  L26_146 = attribute
  L26_146 = L26_146.secondaryServer
  L24_144 = L24_144 .. L25_145 .. L26_146
  L23_143[L24_144] = A3_123
  L24_144 = ldapTable
  L25_145 = "."
  L26_146 = attribute
  L26_146 = L26_146.tertiaryServer
  L24_144 = L24_144 .. L25_145 .. L26_146
  L23_143[L24_144] = A4_124
  L24_144 = ldapTable
  L25_145 = "."
  L26_146 = attribute
  L26_146 = L26_146.primaryDomain
  L24_144 = L24_144 .. L25_145 .. L26_146
  L23_143[L24_144] = A5_125
  L24_144 = ldapTable
  L25_145 = "."
  L26_146 = attribute
  L26_146 = L26_146.secondaryDomain
  L24_144 = L24_144 .. L25_145 .. L26_146
  L23_143[L24_144] = A6_126
  L24_144 = ldapTable
  L25_145 = "."
  L26_146 = attribute
  L26_146 = L26_146.tertiaryDomain
  L24_144 = L24_144 .. L25_145 .. L26_146
  L23_143[L24_144] = A7_127
  L24_144 = ldapTable
  L25_145 = "."
  L26_146 = attribute
  L26_146 = L26_146.timeout
  L24_144 = L24_144 .. L25_145 .. L26_146
  L23_143[L24_144] = A8_128
  L24_144 = ldapTable
  L25_145 = "."
  L26_146 = attribute
  L26_146 = L26_146.maxRetries
  L24_144 = L24_144 .. L25_145 .. L26_146
  L23_143[L24_144] = A9_129
  L24_144 = ldapTable
  L25_145 = "."
  L26_146 = attribute
  L26_146 = L26_146.attribute1
  L24_144 = L24_144 .. L25_145 .. L26_146
  L23_143[L24_144] = A10_130
  L24_144 = ldapTable
  L25_145 = "."
  L26_146 = attribute
  L26_146 = L26_146.attribute2
  L24_144 = L24_144 .. L25_145 .. L26_146
  L23_143[L24_144] = A11_131
  L24_144 = ldapTable
  L25_145 = "."
  L26_146 = attribute
  L26_146 = L26_146.attribute3
  L24_144 = L24_144 .. L25_145 .. L26_146
  L23_143[L24_144] = A12_132
  L24_144 = ldapTable
  L25_145 = "."
  L26_146 = attribute
  L26_146 = L26_146.attribute4
  L24_144 = L24_144 .. L25_145 .. L26_146
  L23_143[L24_144] = A13_133
  L24_144 = ldapTable
  L25_145 = "."
  L26_146 = attribute
  L26_146 = L26_146.primaryAdminUser
  L24_144 = L24_144 .. L25_145 .. L26_146
  L23_143[L24_144] = A14_134
  L24_144 = ldapTable
  L25_145 = "."
  L26_146 = attribute
  L26_146 = L26_146.primaryAdminPassword
  L24_144 = L24_144 .. L25_145 .. L26_146
  L23_143[L24_144] = A15_135
  L24_144 = ldapTable
  L25_145 = "."
  L26_146 = attribute
  L26_146 = L26_146.secondaryAdminUser
  L24_144 = L24_144 .. L25_145 .. L26_146
  L23_143[L24_144] = A16_136
  L24_144 = ldapTable
  L25_145 = "."
  L26_146 = attribute
  L26_146 = L26_146.secondrayAdminPassword
  L24_144 = L24_144 .. L25_145 .. L26_146
  L23_143[L24_144] = A17_137
  L24_144 = ldapTable
  L25_145 = "."
  L26_146 = attribute
  L26_146 = L26_146.tertiaryAdminUser
  L24_144 = L24_144 .. L25_145 .. L26_146
  L23_143[L24_144] = A18_138
  L24_144 = ldapTable
  L25_145 = "."
  L26_146 = attribute
  L26_146 = L26_146.tertiaryAdminPassword
  L24_144 = L24_144 .. L25_145 .. L26_146
  L23_143[L24_144] = A19_139
  L24_144 = cookieValidate
  L25_145 = ROWID
  L26_146 = FIRST_COOKIE
  L27_147 = ldapTable
  L25_145 = L24_144(L25_145, L26_146, L27_147)
  L26_146 = nil
  L27_147 = _UPVALUE2_
  L27_147 = L27_147.SUCCESS
  if L24_144 ~= L27_147 then
    L27_147 = db
    L27_147 = L27_147.insert
    L28_148 = ldapTable
    L29_149 = L23_143
    L27_147 = L27_147(L28_148, L29_149)
    L26_146 = L27_147
  else
    L27_147 = _UPVALUE2_
    L27_147 = L27_147.SUCCESS
    if L24_144 == L27_147 then
      L27_147 = db
      L27_147 = L27_147.update
      L28_148 = ldapTable
      L29_149 = L23_143
      L30_150 = FIRST_COOKIE
      L27_147 = L27_147(L28_148, L29_149, L30_150)
      L26_146 = L27_147
    end
  end
  L27_147 = NIL
  if L26_146 == L27_147 then
    L27_147 = _UPVALUE2_
    L27_147 = L27_147.FAILURE
    L28_148 = L25_145
    return L27_147, L28_148
  end
  L27_147 = HIGH_SEC
  L28_148 = _UPVALUE3_
  if L27_147 == L28_148 then
    L27_147 = {}
    L28_148 = ""
    L29_149 = ""
    L30_150 = attribute
    L30_150 = L30_150.authenticationType
    L34_154 = attribute
    L34_154 = L34_154.authProfile
    L35_155 = " = '"
    L30_150 = L30_150 .. L31_151 .. L32_152 .. L33_153 .. L34_154 .. L35_155 .. A1_121 .. "'"
    L27_147 = L31_151
    if L27_147 ~= L31_151 then
      for L34_154, L35_155 in L31_151(L32_152) do
        L26_146, L29_149 = _UPVALUE5_.sslVpnPolicySet(L35_155, L35_155[userdbDomainTable .. "." .. attribute.authenticationType])
        if L26_146 == _UPVALUE2_.NIL then
          return _UPVALUE2_.FAILURE
        end
      end
    end
  end
  L27_147 = _UPVALUE2_
  L27_147 = L27_147.SUCCESS
  L28_148 = L25_145
  return L27_147, L28_148
end
function serverCreate(A0_156, A1_157, A2_158, A3_159, A4_160, A5_161, A6_162, A7_163, A8_164, A9_165, A10_166, A11_167, A12_168, A13_169, A14_170, A15_171, A16_172, A17_173, A18_174)
  return _UPVALUE0_.NOT_SUPPORTED
end
function serverDelete(A0_175)
  return _UPVALUE0_.NOT_SUPPORTED
end
function checkLdapServer()
  local L0_176
  L0_176 = db
  L0_176 = L0_176.getRow
  L0_176 = L0_176(serverCheck, ROWID, SECOND_COOKIE)
  if L0_176 == NIL then
    return _UPVALUE0_.SERVERCHECK_STATUS_GET_FAILED
  end
  return _UPVALUE1_.SUCCESS, L0_176
end
function serverCheckConfig(A0_177, A1_178)
  local L2_179, L3_180
  if A0_177 == "" then
    L2_179 = _UPVALUE0_
    L2_179 = L2_179.SERVERCHECK_AUTH_TYPE_NIL
    return L2_179
  end
  L2_179 = _UPVALUE1_
  if A0_177 ~= L2_179 then
    L2_179 = _UPVALUE2_
    if A0_177 ~= L2_179 then
      L2_179 = _UPVALUE3_
      if A0_177 ~= L2_179 then
        L2_179 = _UPVALUE4_
        if A0_177 ~= L2_179 then
          L2_179 = _UPVALUE5_
          if A0_177 ~= L2_179 then
            L2_179 = _UPVALUE0_
            L2_179 = L2_179.SERVERCHECK_AUTH_TYPE_INVALID
            return L2_179
          end
        end
      end
    end
  end
  if A1_178 == "" then
    L2_179 = _UPVALUE0_
    L2_179 = L2_179.SERVERCHECK_OPERATION_NIL
    return L2_179
  end
  L2_179 = _UPVALUE6_
  if A1_178 ~= L2_179 then
    L2_179 = _UPVALUE0_
    L2_179 = L2_179.SERVERCHECK_OPERATION_INVALID
    return L2_179
  end
  L2_179 = {}
  L3_180 = serverCheck
  L3_180 = L3_180 .. "." .. attribute.checkNow
  L2_179[L3_180] = _UPVALUE7_
  L3_180 = serverCheck
  L3_180 = L3_180 .. "." .. attribute.response
  L2_179[L3_180] = _UPVALUE8_
  L3_180 = serverCheck
  L3_180 = L3_180 .. "." .. attribute.updateFromWeb
  L2_179[L3_180] = _UPVALUE9_
  L3_180 = serverCheck
  L3_180 = L3_180 .. "." .. attribute.primaryServerStatus
  L2_179[L3_180] = _UPVALUE10_
  L3_180 = serverCheck
  L3_180 = L3_180 .. "." .. attribute.secondaryServerStatus
  L2_179[L3_180] = _UPVALUE11_
  L3_180 = serverCheck
  L3_180 = L3_180 .. "." .. attribute.tertiaryServerStatus
  L2_179[L3_180] = _UPVALUE12_
  L3_180 = db
  L3_180 = L3_180.getAttribute
  L3_180 = L3_180(serverCheck, attribute.authType, A0_177, ROWID)
  if L3_180 == NIL then
    return _UPVALUE13_.FAILURE
  end
  if db.update(serverCheck, L2_179, L3_180) == NIL then
    return _UPVALUE13_.FAILURE
  end
  return _UPVALUE13_.SUCCESS, L3_180
end
function serverCheckReset(A0_181)
  local L1_182, L2_183
  if A0_181 == "" then
    L1_182 = _UPVALUE0_
    L1_182 = L1_182.SERVERCHECK_AUTH_TYPE_NIL
    return L1_182
  end
  L1_182 = _UPVALUE1_
  if A0_181 ~= L1_182 then
    L1_182 = _UPVALUE2_
    if A0_181 ~= L1_182 then
      L1_182 = _UPVALUE3_
      if A0_181 ~= L1_182 then
        L1_182 = _UPVALUE4_
        if A0_181 ~= L1_182 then
          L1_182 = _UPVALUE5_
          if A0_181 ~= L1_182 then
            L1_182 = _UPVALUE0_
            L1_182 = L1_182.SERVERCHECK_AUTH_TYPE_INVALID
            return L1_182
          end
        end
      end
    end
  end
  L1_182 = {}
  L2_183 = serverCheck
  L2_183 = L2_183 .. "." .. attribute.checkNow
  L1_182[L2_183] = _UPVALUE6_
  L2_183 = serverCheck
  L2_183 = L2_183 .. "." .. attribute.response
  L1_182[L2_183] = _UPVALUE6_
  L2_183 = serverCheck
  L2_183 = L2_183 .. "." .. attribute.updateFromWeb
  L1_182[L2_183] = _UPVALUE6_
  L2_183 = serverCheck
  L2_183 = L2_183 .. "." .. attribute.primaryServerStatus
  L1_182[L2_183] = _UPVALUE7_
  L2_183 = serverCheck
  L2_183 = L2_183 .. "." .. attribute.secondaryServerStatus
  L1_182[L2_183] = _UPVALUE8_
  L2_183 = serverCheck
  L2_183 = L2_183 .. "." .. attribute.tertiaryServerStatus
  L1_182[L2_183] = _UPVALUE9_
  L2_183 = db
  L2_183 = L2_183.getAttribute
  L2_183 = L2_183(serverCheck, attribute.authType, A0_181, ROWID)
  if L2_183 == NIL then
    return _UPVALUE10_.FAILURE
  end
  if db.update(serverCheck, L1_182, L2_183) == NIL then
    return _UPVALUE10_.FAILURE
  end
  return _UPVALUE10_.SUCCESS, L2_183
end
function getCheckNow(A0_184)
  local L1_185
  L1_185 = db
  L1_185 = L1_185.getAttribute
  L1_185 = L1_185("serverCheck", "authType", A0_184, "checkNow")
  if L1_185 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_185
end
