local L0_0
L0_0 = module
L0_0("com.teamf1.core.authentication.activedirectory", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
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
activedirectoryTable = "ActiveDirectorySettings"
serverCheck = "serverCheck"
attribute = {}
attribute.feature = "feature"
attribute.profile = "ProfileName"
attribute.primaryServer = "AuthenticationServer"
attribute.secondaryServer = "SecondAuthenticationServer"
attribute.tertiaryServer = "ThirdAuthenticationServer"
attribute.primaryDomain = "ActiveDirectoryDomain"
attribute.secondaryDomain = "SecondActiveDirectoryDomain"
attribute.tertiaryDomain = "ThirdActiveDirectoryDomain"
attribute.priAdminAccount = "FirstAdminAccount"
attribute.priAdminPassword = "FirstAdminPasswd"
attribute.priServerHostName = "FirstServerHostname"
attribute.secAdminAccount = "SecondAdminAccount"
attribute.secAdminPassword = "SecondAdminPasswd"
attribute.secServerHostName = "SecondServerHostname"
attribute.terAdminAccount = "ThirdAdminAccount"
attribute.terAdminPassword = "ThirdAdminPasswd"
attribute.terServerHostName = "ThirdServerHostname"
attribute.timeout = "TimeOut"
attribute.maxRetries = "Retries"
attribute.authType = "authType"
attribute.checkNow = "checkNow"
attribute.updateFromWeb = "updateFromWeb"
attribute.response = "response"
attribute.primaryServerStatus = "firstServerStatus"
attribute.secondaryServerStatus = "secondServerStatus"
attribute.tertiaryServerStatus = "thirdServerStatus"
USERDBDomains_attribute = {}
USERDBDomains_attribute.authServer = "AuthenticationServer"
USERDBDomains_attribute.secAuthServer = "SecondAuthenticationServer"
USERDBDomains_attribute.triAuthServer = "ThirdAuthenticationServer"
USERDBDomains_attribute.actDirDomain = "ActiveDirectoryDomain"
USERDBDomains_attribute.secActDirDomain = "SecondActiveDirectoryDomain"
USERDBDomains_attribute.triActDirDomain = "ThirdActiveDirectoryDomain"
USERDBDomains_attribute.retries = "Retries"
USERDBDomains_attribute.timeOut = "TimeOut"
USERDBDomains_attribute.authType = "AuthenticationType"
USERDBDomains_attribute.authProfile = "AuthProfile"
USERDBDomains_attribute.activDir = "active-directory"
USERDBDomains_attribute.portalLayoutName = "PortalLayoutName"
NIL = nil
FALSE = false
PROFILE_LENGTH_MAX = 128
PROFILE_LENGTH_MIN = 0
PORT_MAX = 65536
PORT_MIN = 1
ROWID = "_ROWID_"
FIRST_COOKIE = "1"
MAX_RETRIES = 9
MIN_RETRIES = 0
MAX_TIME = 999
MIN_TIME = 0
IPV4_ADDRESS_FAMILY = "2"
ACTIVE_DEFAULT_AUTH_PROFILE = "Default"
FIFTH_COOKIE = "5"
function isfeatureEnabled()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getRow
  L0_1 = L0_1(activedirectoryTable, ROWID, FIRST_COOKIE)
  if L0_1 == NIL then
    return _UPVALUE0_.NOT_EXIST
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_1
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
  L0_5 = L0_5(activedirectoryTable, ROWID, FIRST_COOKIE, attribute.profile)
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
  L3_10 = L2_9(L3_10, A0_7, activedirectoryTable)
  if L2_9 ~= _UPVALUE0_.SUCCESS then
    return L2_9
  end
  if A1_8 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_8) > PROFILE_LENGTH_MAX or string.len(A1_8) < PROFILE_LENGTH_MIN then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(activedirectoryTable, ROWID, L3_10, attribute.profile, A1_8) == NIL then
    return _UPVALUE0_.FAILURE, L3_10
  end
  return _UPVALUE0_.SUCCESS, L3_10
end
function primaryServerGet()
  local L0_11
  L0_11 = db
  L0_11 = L0_11.getAttribute
  L0_11 = L0_11(activedirectoryTable, ROWID, FIRST_COOKIE, attribute.primaryServer)
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
  L3_16 = L2_15(L3_16, A0_13, activedirectoryTable)
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
  if db.setAttribute(activedirectoryTable, ROWID, L3_16, attribute.primaryServer, A1_14) == NIL then
    return _UPVALUE0_.FAILURE, L3_16
  end
  return _UPVALUE0_.SUCCESS, L3_16
end
function secondaryServerGet()
  local L0_17
  L0_17 = db
  L0_17 = L0_17.getAttribute
  L0_17 = L0_17(activedirectoryTable, ROWID, FIRST_COOKIE, attribute.secondaryServer)
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
  L3_22 = L2_21(L3_22, A0_19, activedirectoryTable)
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
  if db.setAttribute(activedirectoryTable, ROWID, L3_22, attribute.secondaryServer, A1_20) == NIL then
    return _UPVALUE0_.FAILURE, L3_22
  end
  return _UPVALUE0_.SUCCESS, L3_22
end
function tertiaryServerGet()
  local L0_23
  L0_23 = db
  L0_23 = L0_23.getAttribute
  L0_23 = L0_23(activedirectoryTable, ROWID, FIRST_COOKIE, attribute.tertiaryServer)
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
  L3_28 = L2_27(L3_28, A0_25, activedirectoryTable)
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
  if db.setAttribute(activedirectoryTable, ROWID, L3_28, attribute.tertiaryServer, A1_26) == NIL then
    return _UPVALUE0_.FAILURE, L3_28
  end
  return _UPVALUE0_.SUCCESS, L3_28
end
function primaryDomainGet()
  local L0_29
  L0_29 = db
  L0_29 = L0_29.getAttribute
  L0_29 = L0_29(activedirectoryTable, ROWID, FIRST_COOKIE, attribute.primaryDomain)
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
  L3_34 = L2_33(L3_34, A0_31, activedirectoryTable)
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
  if db.setAttribute(activedirectoryTable, ROWID, L3_34, attribute.primaryDomain, A1_32) == NIL then
    return _UPVALUE0_.FAILURE, L3_34
  end
  return _UPVALUE0_.SUCCESS, L3_34
end
function secondaryDomainGet()
  local L0_35
  L0_35 = db
  L0_35 = L0_35.getAttribute
  L0_35 = L0_35(activedirectoryTable, ROWID, FIRST_COOKIE, attribute.secondaryDomain)
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
  L3_40 = L2_39(L3_40, A0_37, activedirectoryTable)
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
  if db.setAttribute(activedirectoryTable, ROWID, L3_40, attribute.secondaryDomain, A1_38) == NIL then
    return _UPVALUE0_.FAILURE, L3_40
  end
  return _UPVALUE0_.SUCCESS, L3_40
end
function tertiaryDomainGet()
  local L0_41
  L0_41 = db
  L0_41 = L0_41.getAttribute
  L0_41 = L0_41(activedirectoryTable, ROWID, FIRST_COOKIE, attribute.tertiaryDomain)
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
  L3_46 = L2_45(L3_46, A0_43, activedirectoryTable)
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
  if db.setAttribute(activedirectoryTable, ROWID, L3_46, attribute.tertiaryDomain, A1_44) == NIL then
    return _UPVALUE0_.FAILURE, L3_46
  end
  return _UPVALUE0_.SUCCESS, L3_46
end
function timeoutGet()
  local L0_47
  L0_47 = db
  L0_47 = L0_47.getAttribute
  L0_47 = L0_47(activedirectoryTable, ROWID, FIRST_COOKIE, attribute.timeout)
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
  L3_52 = L2_51(L3_52, A0_49, activedirectoryTable)
  if L2_51 ~= _UPVALUE0_.SUCCESS then
    return L2_51
  end
  if A1_50 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_50) < MIN_TIME or tonumber(A1_50) > MAX_TIME then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(activedirectoryTable, ROWID, L3_52, attribute.timeout, A1_50) == NIL then
    return _UPVALUE0_.FAILURE, L3_52
  end
  return _UPVALUE0_.SUCCESS, L3_52
end
function maxRetriesGet()
  local L0_53
  L0_53 = db
  L0_53 = L0_53.getAttribute
  L0_53 = L0_53(activedirectoryTable, ROWID, FIRST_COOKIE, attribute.maxRetries)
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
  L3_58 = L2_57(L3_58, A0_55, activedirectoryTable)
  if L2_57 ~= _UPVALUE0_.SUCCESS then
    return L2_57
  end
  if A1_56 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_56) < MIN_RETRIES or tonumber(A1_56) > MAX_RETRIES then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(activedirectoryTable, ROWID, L3_58, attribute.maxRetries, A1_56) == NIL then
    return _UPVALUE0_.FAILURE, L3_58
  end
  return _UPVALUE0_.SUCCESS, L3_58
end
function serverGet()
  if db.getRow(activedirectoryTable, ROWID, FIRST_COOKIE) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, db.getRow(activedirectoryTable, ROWID, FIRST_COOKIE)[activedirectoryTable .. "." .. attribute.profile], db.getRow(activedirectoryTable, ROWID, FIRST_COOKIE)[activedirectoryTable .. "." .. attribute.primaryServer], db.getRow(activedirectoryTable, ROWID, FIRST_COOKIE)[activedirectoryTable .. "." .. attribute.secondaryServer], db.getRow(activedirectoryTable, ROWID, FIRST_COOKIE)[activedirectoryTable .. "." .. attribute.tertiaryServer], db.getRow(activedirectoryTable, ROWID, FIRST_COOKIE)[activedirectoryTable .. "." .. attribute.primaryDomain], db.getRow(activedirectoryTable, ROWID, FIRST_COOKIE)[activedirectoryTable .. "." .. attribute.secondaryDomain], db.getRow(activedirectoryTable, ROWID, FIRST_COOKIE)[activedirectoryTable .. "." .. attribute.tertiaryDomain], db.getRow(activedirectoryTable, ROWID, FIRST_COOKIE)[activedirectoryTable .. "." .. attribute.timeout], db.getRow(activedirectoryTable, ROWID, FIRST_COOKIE)[activedirectoryTable .. "." .. attribute.maxRetries], db.getRow(activedirectoryTable, ROWID, FIRST_COOKIE)[activedirectoryTable .. "." .. attribute.priAdminAccount], db.getRow(activedirectoryTable, ROWID, FIRST_COOKIE)[activedirectoryTable .. "." .. attribute.priAdminPassword], db.getRow(activedirectoryTable, ROWID, FIRST_COOKIE)[activedirectoryTable .. "." .. attribute.priServerHostName], db.getRow(activedirectoryTable, ROWID, FIRST_COOKIE)[activedirectoryTable .. "." .. attribute.secAdminAccount], db.getRow(activedirectoryTable, ROWID, FIRST_COOKIE)[activedirectoryTable .. "." .. attribute.secAdminPassword], db.getRow(activedirectoryTable, ROWID, FIRST_COOKIE)[activedirectoryTable .. "." .. attribute.secServerHostName], db.getRow(activedirectoryTable, ROWID, FIRST_COOKIE)[activedirectoryTable .. "." .. attribute.terAdminAccount], db.getRow(activedirectoryTable, ROWID, FIRST_COOKIE)[activedirectoryTable .. "." .. attribute.terAdminPassword], db.getRow(activedirectoryTable, ROWID, FIRST_COOKIE)[activedirectoryTable .. "." .. attribute.terServerHostName]
end
function serverGetNext(A0_59)
  return _UPVALUE0_.NOT_SUPPORTED
end
function userDBDomainTabUpdate(A0_60, A1_61)
  local L2_62, L3_63, L4_64, L5_65, L6_66
  L2_62 = {}
  L3_63 = _UPVALUE0_
  L3_63 = L3_63.FAILURE
  L4_64 = false
  L5_65, L6_66 = nil, nil
  L5_65 = A0_60[_UPVALUE1_ .. "." .. USERDBDomains_attribute.portalLayoutName]
  if db.existsRow(_UPVALUE2_, USERDBDomains_attribute.portalLayoutName, L5_65) ~= _UPVALUE0_.FALSE then
    L6_66 = A0_60[_UPVALUE1_ .. "." .. ROWID]
    A0_60[_UPVALUE1_ .. "." .. USERDBDomains_attribute.authServer] = A1_61[activedirectoryTable .. "." .. attribute.primaryServer]
    A0_60[_UPVALUE1_ .. "." .. USERDBDomains_attribute.secAuthServer] = A1_61[activedirectoryTable .. "." .. attribute.secondaryServer]
    A0_60[_UPVALUE1_ .. "." .. USERDBDomains_attribute.triAuthServer] = A1_61[activedirectoryTable .. "." .. attribute.tertiaryServer]
    A0_60[_UPVALUE1_ .. "." .. USERDBDomains_attribute.actDirDomain] = A1_61[activedirectoryTable .. "." .. attribute.primaryDomain]
    A0_60[_UPVALUE1_ .. "." .. USERDBDomains_attribute.secActDirDomain] = A1_61[activedirectoryTable .. "." .. attribute.secondaryDomain]
    A0_60[_UPVALUE1_ .. "." .. USERDBDomains_attribute.triActDirDomain] = A1_61[activedirectoryTable .. "." .. attribute.tertiaryDomain]
    A0_60[_UPVALUE1_ .. "." .. USERDBDomains_attribute.retries] = A1_61[activedirectoryTable .. "." .. attribute.timeout]
    A0_60[_UPVALUE1_ .. "." .. USERDBDomains_attribute.timeOut] = A1_61[activedirectoryTable .. "." .. attribute.maxRetries]
    L4_64 = db.update(_UPVALUE1_, A0_60, L6_66)
    if L4_64 == _UPVALUE0_.NIL then
      return _UPVALUE0_.FAILURE, cookie
    end
  end
  L3_63 = _UPVALUE0_.SUCCESS
  return L3_63
end
function serverSet(A0_67, A1_68, A2_69, A3_70, A4_71, A5_72, A6_73, A7_74, A8_75, A9_76, A10_77, A11_78, A12_79, A13_80, A14_81, A15_82, A16_83, A17_84, A18_85)
  local L19_86, L20_87, L21_88, L22_89, L23_90, L24_91, L25_92, L26_93, L27_94, L28_95, L29_96, L30_97, L31_98, L32_99
  L20_87 = {}
  L21_88 = NIL
  if A1_68 == L21_88 or A1_68 == "" then
    L21_88 = _UPVALUE0_
    L21_88 = L21_88.AD_SERVER_PROFILE_NIL
    return L21_88
  end
  L21_88 = string
  L21_88 = L21_88.len
  L22_89 = A1_68
  L21_88 = L21_88(L22_89)
  L22_89 = PROFILE_LENGTH_MAX
  if not (L21_88 > L22_89) then
    L22_89 = PROFILE_LENGTH_MIN
  elseif L21_88 < L22_89 then
    L22_89 = _UPVALUE0_
    L22_89 = L22_89.AD_SERVER_PROFILE_INVALID
    return L22_89
  end
  L22_89 = NIL
  if A2_69 == L22_89 or A2_69 == "" then
    L22_89 = _UPVALUE0_
    L22_89 = L22_89.AD_SERVER_PRIMARY_SERVER_NIL
    return L22_89
  end
  L22_89 = _UPVALUE1_
  L22_89 = L22_89.ipAddressCheck
  L23_90 = IPV4_ADDRESS_FAMILY
  L24_91 = A2_69
  L22_89 = L22_89(L23_90, L24_91)
  valid = L22_89
  L22_89 = valid
  L23_90 = _UPVALUE2_
  L23_90 = L23_90.SUCCESS
  if L22_89 ~= L23_90 then
    L22_89 = _UPVALUE0_
    L22_89 = L22_89.AD_SERVER_PRIMARY_IPADDRESS_INVALID
    return L22_89
  end
  L22_89 = NIL
  if A3_70 ~= L22_89 and A3_70 ~= "" then
    L22_89 = _UPVALUE1_
    L22_89 = L22_89.ipAddressCheck
    L23_90 = IPV4_ADDRESS_FAMILY
    L24_91 = A3_70
    L22_89 = L22_89(L23_90, L24_91)
    valid = L22_89
    L22_89 = valid
    L23_90 = _UPVALUE2_
    L23_90 = L23_90.SUCCESS
    if L22_89 ~= L23_90 then
      L22_89 = _UPVALUE0_
      L22_89 = L22_89.AD_SERVER_SECONDARY_IPADDRESS_INVALID
      return L22_89
    end
  end
  L22_89 = NIL
  if A4_71 ~= L22_89 and A4_71 ~= "" then
    L22_89 = _UPVALUE1_
    L22_89 = L22_89.ipAddressCheck
    L23_90 = IPV4_ADDRESS_FAMILY
    L24_91 = A4_71
    L22_89 = L22_89(L23_90, L24_91)
    valid = L22_89
    L22_89 = valid
    L23_90 = _UPVALUE2_
    L23_90 = L23_90.SUCCESS
    if L22_89 ~= L23_90 then
      L22_89 = _UPVALUE0_
      L22_89 = L22_89.AD_SERVER_TERTIARY_IPADDRESS_INVALID
      return L22_89
    end
  end
  L22_89 = NIL
  if A5_72 == L22_89 or A5_72 == "" then
    L22_89 = _UPVALUE0_
    L22_89 = L22_89.AD_SERVER_PRIMARY_DOMAIN_NIL
    return L22_89
  end
  L22_89 = _UPVALUE1_
  L22_89 = L22_89.fqdnCheck
  L23_90 = A5_72
  L22_89 = L22_89(L23_90)
  valid = L22_89
  L22_89 = valid
  L23_90 = _UPVALUE2_
  L23_90 = L23_90.SUCCESS
  if L22_89 ~= L23_90 then
    L22_89 = _UPVALUE0_
    L22_89 = L22_89.AD_SERVER_PRIMARY_DOMAIN_INVALID
    return L22_89
  end
  L22_89 = NIL
  if A3_70 ~= L22_89 and A3_70 ~= "" then
    L22_89 = NIL
    if A6_73 == L22_89 or A6_73 == "" then
      L22_89 = _UPVALUE0_
      L22_89 = L22_89.AD_SERVER_SECONDARY_DOMAIN_NIL
      return L22_89
    end
    L22_89 = _UPVALUE1_
    L22_89 = L22_89.fqdnCheck
    L23_90 = A6_73
    L22_89 = L22_89(L23_90)
    valid = L22_89
    L22_89 = valid
    L23_90 = _UPVALUE2_
    L23_90 = L23_90.SUCCESS
    if L22_89 ~= L23_90 then
      L22_89 = _UPVALUE0_
      L22_89 = L22_89.AD_SERVER_SECONDARY_DOMAIN_INVALID
      return L22_89
    end
  end
  L22_89 = NIL
  if A4_71 ~= L22_89 and A4_71 ~= "" then
    L22_89 = NIL
    if A7_74 == L22_89 or A7_74 == "" then
      L22_89 = _UPVALUE0_
      L22_89 = L22_89.AD_SERVER_TERTIARY_DOMAIN_NIL
      return L22_89
    end
    L22_89 = _UPVALUE1_
    L22_89 = L22_89.fqdnCheck
    L23_90 = A7_74
    L22_89 = L22_89(L23_90)
    valid = L22_89
    L22_89 = valid
    L23_90 = _UPVALUE2_
    L23_90 = L23_90.SUCCESS
    if L22_89 ~= L23_90 then
      L22_89 = _UPVALUE0_
      L22_89 = L22_89.AD_SERVER_TERTIARY_DOMAIN_INVALID
      return L22_89
    end
  end
  L22_89 = NIL
  if A8_75 == L22_89 or A8_75 == "" then
    L22_89 = _UPVALUE0_
    L22_89 = L22_89.AD_SERVER_TIMEOUT_NIL
    return L22_89
  end
  L22_89 = tonumber
  L23_90 = A8_75
  L22_89 = L22_89(L23_90)
  L23_90 = MIN_TIME
  if not (L22_89 < L23_90) then
    L23_90 = MAX_TIME
  elseif L22_89 > L23_90 then
    L23_90 = _UPVALUE0_
    L23_90 = L23_90.AD_SERVER_TIMEOUT_INVALID
    return L23_90
  end
  L23_90 = NIL
  if A9_76 == L23_90 or A9_76 == "" then
    L23_90 = _UPVALUE0_
    L23_90 = L23_90.AD_SERVER_MAX_RETRIES_NIL
    return L23_90
  end
  L23_90 = tonumber
  L24_91 = A9_76
  L23_90 = L23_90(L24_91)
  L24_91 = MIN_RETRIES
  if not (L23_90 < L24_91) then
    L24_91 = MAX_RETRIES
  elseif L23_90 > L24_91 then
    L24_91 = _UPVALUE0_
    L24_91 = L24_91.AD_SERVER_MAX_RETRIES_INVALID
    return L24_91
  end
  L24_91 = NIL
  if A12_79 == L24_91 or A12_79 == "" then
    L24_91 = _UPVALUE0_
    L24_91 = L24_91.AD_SERVER_PRIMARY_HOSTNAME_NIL
    return L24_91
  end
  L24_91 = {}
  L25_92 = activedirectoryTable
  L26_93 = "."
  L27_94 = attribute
  L27_94 = L27_94.profile
  L25_92 = L25_92 .. L26_93 .. L27_94
  L24_91[L25_92] = A1_68
  L25_92 = activedirectoryTable
  L26_93 = "."
  L27_94 = attribute
  L27_94 = L27_94.primaryServer
  L25_92 = L25_92 .. L26_93 .. L27_94
  L24_91[L25_92] = A2_69
  L25_92 = activedirectoryTable
  L26_93 = "."
  L27_94 = attribute
  L27_94 = L27_94.secondaryServer
  L25_92 = L25_92 .. L26_93 .. L27_94
  L24_91[L25_92] = A3_70
  L25_92 = activedirectoryTable
  L26_93 = "."
  L27_94 = attribute
  L27_94 = L27_94.tertiaryServer
  L25_92 = L25_92 .. L26_93 .. L27_94
  L24_91[L25_92] = A4_71
  L25_92 = activedirectoryTable
  L26_93 = "."
  L27_94 = attribute
  L27_94 = L27_94.primaryDomain
  L25_92 = L25_92 .. L26_93 .. L27_94
  L24_91[L25_92] = A5_72
  L25_92 = activedirectoryTable
  L26_93 = "."
  L27_94 = attribute
  L27_94 = L27_94.secondaryDomain
  L25_92 = L25_92 .. L26_93 .. L27_94
  L24_91[L25_92] = A6_73
  L25_92 = activedirectoryTable
  L26_93 = "."
  L27_94 = attribute
  L27_94 = L27_94.tertiaryDomain
  L25_92 = L25_92 .. L26_93 .. L27_94
  L24_91[L25_92] = A7_74
  L25_92 = activedirectoryTable
  L26_93 = "."
  L27_94 = attribute
  L27_94 = L27_94.timeout
  L25_92 = L25_92 .. L26_93 .. L27_94
  L24_91[L25_92] = A8_75
  L25_92 = activedirectoryTable
  L26_93 = "."
  L27_94 = attribute
  L27_94 = L27_94.maxRetries
  L25_92 = L25_92 .. L26_93 .. L27_94
  L24_91[L25_92] = A9_76
  if A10_77 ~= nil then
    L25_92 = activedirectoryTable
    L26_93 = "."
    L27_94 = attribute
    L27_94 = L27_94.priAdminAccount
    L25_92 = L25_92 .. L26_93 .. L27_94
    L24_91[L25_92] = A10_77
  end
  if A11_78 ~= nil then
    L25_92 = activedirectoryTable
    L26_93 = "."
    L27_94 = attribute
    L27_94 = L27_94.priAdminPassword
    L25_92 = L25_92 .. L26_93 .. L27_94
    L24_91[L25_92] = A11_78
  end
  if A12_79 ~= nil then
    L25_92 = activedirectoryTable
    L26_93 = "."
    L27_94 = attribute
    L27_94 = L27_94.priServerHostName
    L25_92 = L25_92 .. L26_93 .. L27_94
    L24_91[L25_92] = A12_79
  end
  if A13_80 ~= nil then
    L25_92 = activedirectoryTable
    L26_93 = "."
    L27_94 = attribute
    L27_94 = L27_94.secAdminAccount
    L25_92 = L25_92 .. L26_93 .. L27_94
    L24_91[L25_92] = A13_80
  end
  if A14_81 ~= nil then
    L25_92 = activedirectoryTable
    L26_93 = "."
    L27_94 = attribute
    L27_94 = L27_94.secAdminPassword
    L25_92 = L25_92 .. L26_93 .. L27_94
    L24_91[L25_92] = A14_81
  end
  if A15_82 ~= nil then
    L25_92 = activedirectoryTable
    L26_93 = "."
    L27_94 = attribute
    L27_94 = L27_94.secServerHostName
    L25_92 = L25_92 .. L26_93 .. L27_94
    L24_91[L25_92] = A15_82
  end
  if A16_83 ~= nil then
    L25_92 = activedirectoryTable
    L26_93 = "."
    L27_94 = attribute
    L27_94 = L27_94.terAdminAccount
    L25_92 = L25_92 .. L26_93 .. L27_94
    L24_91[L25_92] = A16_83
  end
  if A17_84 ~= nil then
    L25_92 = activedirectoryTable
    L26_93 = "."
    L27_94 = attribute
    L27_94 = L27_94.terAdminPassword
    L25_92 = L25_92 .. L26_93 .. L27_94
    L24_91[L25_92] = A17_84
  end
  if A18_85 ~= nil then
    L25_92 = activedirectoryTable
    L26_93 = "."
    L27_94 = attribute
    L27_94 = L27_94.terServerHostName
    L25_92 = L25_92 .. L26_93 .. L27_94
    L24_91[L25_92] = A18_85
  end
  L25_92 = cookieValidate
  L26_93 = ROWID
  L27_94 = FIRST_COOKIE
  L26_93 = L25_92(L26_93, L27_94, L28_95)
  L27_94 = nil
  if L25_92 ~= L28_95 then
    L27_94 = L28_95
  elseif L25_92 == L28_95 then
    L31_98 = FIRST_COOKIE
    L27_94 = L28_95
  end
  if L27_94 == L28_95 then
    return L28_95, L29_96
  end
  L31_98 = "' AND "
  L32_99 = USERDBDomains_attribute
  L32_99 = L32_99.authProfile
  L19_86 = L28_95 .. L29_96 .. L30_97 .. L31_98 .. L32_99 .. " = '" .. ACTIVE_DEFAULT_AUTH_PROFILE .. "'"
  L20_87 = L28_95
  if L20_87 ~= L28_95 then
    for L31_98, L32_99 in L28_95(L29_96) do
      L27_94 = userDBDomainTabUpdate(L32_99, activedirectoryTable)
      if L27_94 == _UPVALUE2_.FAILURE then
        return _UPVALUE2_.FAILURE, L26_93
      end
    end
  end
  return L28_95, L29_96
end
function serverCreate(A0_100, A1_101, A2_102, A3_103, A4_104, A5_105, A6_106, A7_107, A8_108)
  return _UPVALUE0_.NOT_SUPPORTED
end
function serverDelete(A0_109)
  return _UPVALUE0_.NOT_SUPPORTED
end
function checkAdServer()
  local L0_110
  L0_110 = db
  L0_110 = L0_110.getRow
  L0_110 = L0_110(serverCheck, ROWID, FIFTH_COOKIE)
  if L0_110 == NIL then
    return _UPVALUE0_.SERVERCHECK_STATUS_GET_FAILED
  end
  return _UPVALUE1_.SUCCESS, L0_110
end
function serverCheckConfig(A0_111, A1_112)
  local L2_113, L3_114
  if A0_111 == "" then
    L2_113 = _UPVALUE0_
    L2_113 = L2_113.SERVERCHECK_AUTH_TYPE_NIL
    return L2_113
  end
  L2_113 = _UPVALUE1_
  if A0_111 ~= L2_113 then
    L2_113 = _UPVALUE2_
    if A0_111 ~= L2_113 then
      L2_113 = _UPVALUE3_
      if A0_111 ~= L2_113 then
        L2_113 = _UPVALUE4_
        if A0_111 ~= L2_113 then
          L2_113 = _UPVALUE5_
          if A0_111 ~= L2_113 then
            L2_113 = _UPVALUE0_
            L2_113 = L2_113.SERVERCHECK_AUTH_TYPE_INVALID
            return L2_113
          end
        end
      end
    end
  end
  if A1_112 == "" then
    L2_113 = _UPVALUE0_
    L2_113 = L2_113.SERVERCHECK_OPERATION_NIL
    return L2_113
  end
  L2_113 = _UPVALUE6_
  if A1_112 ~= L2_113 then
    L2_113 = _UPVALUE0_
    L2_113 = L2_113.SERVERCHECK_OPERATION_INVALID
    return L2_113
  end
  L2_113 = {}
  L3_114 = serverCheck
  L3_114 = L3_114 .. "." .. attribute.checkNow
  L2_113[L3_114] = _UPVALUE7_
  L3_114 = serverCheck
  L3_114 = L3_114 .. "." .. attribute.response
  L2_113[L3_114] = _UPVALUE8_
  L3_114 = serverCheck
  L3_114 = L3_114 .. "." .. attribute.updateFromWeb
  L2_113[L3_114] = _UPVALUE9_
  L3_114 = serverCheck
  L3_114 = L3_114 .. "." .. attribute.primaryServerStatus
  L2_113[L3_114] = _UPVALUE10_
  L3_114 = serverCheck
  L3_114 = L3_114 .. "." .. attribute.secondaryServerStatus
  L2_113[L3_114] = _UPVALUE11_
  L3_114 = serverCheck
  L3_114 = L3_114 .. "." .. attribute.tertiaryServerStatus
  L2_113[L3_114] = _UPVALUE12_
  L3_114 = db
  L3_114 = L3_114.getAttribute
  L3_114 = L3_114(serverCheck, attribute.authType, A0_111, ROWID)
  if L3_114 == NIL then
    return _UPVALUE13_.FAILURE
  end
  if db.update(serverCheck, L2_113, L3_114) == NIL then
    return _UPVALUE13_.FAILURE
  end
  return _UPVALUE13_.SUCCESS, L3_114
end
function serverCheckReset(A0_115)
  local L1_116, L2_117
  if A0_115 == "" then
    L1_116 = _UPVALUE0_
    L1_116 = L1_116.SERVERCHECK_AUTH_TYPE_NIL
    return L1_116
  end
  L1_116 = _UPVALUE1_
  if A0_115 ~= L1_116 then
    L1_116 = _UPVALUE2_
    if A0_115 ~= L1_116 then
      L1_116 = _UPVALUE3_
      if A0_115 ~= L1_116 then
        L1_116 = _UPVALUE4_
        if A0_115 ~= L1_116 then
          L1_116 = _UPVALUE5_
          if A0_115 ~= L1_116 then
            L1_116 = _UPVALUE0_
            L1_116 = L1_116.SERVERCHECK_AUTH_TYPE_INVALID
            return L1_116
          end
        end
      end
    end
  end
  L1_116 = {}
  L2_117 = serverCheck
  L2_117 = L2_117 .. "." .. attribute.checkNow
  L1_116[L2_117] = _UPVALUE6_
  L2_117 = serverCheck
  L2_117 = L2_117 .. "." .. attribute.response
  L1_116[L2_117] = _UPVALUE6_
  L2_117 = serverCheck
  L2_117 = L2_117 .. "." .. attribute.updateFromWeb
  L1_116[L2_117] = _UPVALUE6_
  L2_117 = serverCheck
  L2_117 = L2_117 .. "." .. attribute.primaryServerStatus
  L1_116[L2_117] = _UPVALUE7_
  L2_117 = serverCheck
  L2_117 = L2_117 .. "." .. attribute.secondaryServerStatus
  L1_116[L2_117] = _UPVALUE8_
  L2_117 = serverCheck
  L2_117 = L2_117 .. "." .. attribute.tertiaryServerStatus
  L1_116[L2_117] = _UPVALUE9_
  L2_117 = db
  L2_117 = L2_117.getAttribute
  L2_117 = L2_117(serverCheck, attribute.authType, A0_115, ROWID)
  if L2_117 == NIL then
    return _UPVALUE10_.FAILURE
  end
  if db.update(serverCheck, L1_116, L2_117) == NIL then
    return _UPVALUE10_.FAILURE
  end
  return _UPVALUE10_.SUCCESS, L2_117
end
function getCheckNow(A0_118)
  local L1_119
  L1_119 = db
  L1_119 = L1_119.getAttribute
  L1_119 = L1_119("serverCheck", "authType", A0_118, "checkNow")
  if L1_119 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_119
end
