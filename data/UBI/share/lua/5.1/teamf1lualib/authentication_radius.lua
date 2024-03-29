local L0_0
L0_0 = module
L0_0("com.teamf1.core.authentication.radius", package.seeall)
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
L0_0("teamf1lualib/accounting_core")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
radClientTable = "radiusClient"
ifStaticTbl = "ifstatic"
radAuthRouteTable = "radAuthTbl"
radiusTable = "radiusClient"
serverCheck = "serverCheck"
userdbDomainTable = "USERDBDomains"
userGroupsTable = "UserGroups"
serviceRouteTable = "ServicesRouteMgmt"
wanModeTbl = "WanMode"
radiusAuthConfTbl = "radAuthConf"
attribute = {}
attribute.profile = "ProfileName"
attribute.feature = "isEnable"
attribute.primaryServer = "authserver"
attribute.primaryPort = "authport"
attribute.primarySecret = "authsecret"
attribute.primaryTimeout = "authtimeout"
attribute.primaryMaxRetries = "authretries"
attribute.secondaryServer = "authserver"
attribute.secondaryPort = "authport"
attribute.secondarySecret = "authsecret"
attribute.secondaryTimeout = "authtimeout"
attribute.secondaryMaxRetries = "authretries"
attribute.tertiaryServer = "authserver"
attribute.tertiaryPort = "authport"
attribute.tertiarySecret = "authsecret"
attribute.tertiaryTimeout = "authtimeout"
attribute.tertiaryMaxRetries = "authretries"
attribute.authType = "authType"
attribute.checkNow = "checkNow"
attribute.updateFromWeb = "updateFromWeb"
attribute.response = "response"
attribute.primaryServerStatus = "firstServerStatus"
attribute.secondaryServerStatus = "secondServerStatus"
attribute.tertiaryServerStatus = "thirdServerStatus"
attribute.groupId = "GroupId"
attribute.authenticationType = "AuthenticationType"
attribute.authProfile = "AuthProfile"
attribute.serviceInterface = "serviceInterface"
attribute.serverIPAddress = "serverIPAddress"
attribute.primaryAccServer = "acctserver"
attribute.primaryAccPort = "acctport"
attribute.primaryAccSecret = "acctsecret"
attribute.secondaryAccServer = "acctserver"
attribute.secondaryAccPort = "acctport"
attribute.secondaryAccSecret = "acctsecret"
attribute.tertiaryAccServer = "acctserver"
attribute.tertiaryAccPort = "acctport"
attribute.tertiaryAccSecret = "acctsecret"
attribute.logicalIface = "LogicalIfName"
attribute.staticIp = "StaticIp"
attribute.netmask = "NetMask"
attribute.routeIp = "routeIp"
attribute.routeIface = "routeIface"
attribute.serverIp = "serverIp"
attribute.authserver = "authserver"
attribute.wanMode = "Wanmode"
attribute.nasIfaceName = "nasIface"
INVALID = -1
NIL = nil
FALSE = false
ENABLE = 1
DISABLE = 0
PROFILE_LENGTH_MAX = 128
PROFILE_LENGTH_MIN = 0
PORT_MAX = 65536
PORT_MIN = 0
ROWID = "_ROWID_"
FIRST_COOKIE = "1"
SECOND_COOKIE = "2"
THIRD_COOKIE = "3"
MAX_RETRIES = 999
MIN_RETRIES = 1
MAX_TIME = 999
MIN_TIME = 1
MAX_SECRET_LEN = 64
MIN_SECRET_LEN = 0
IPV4_ADDRESS_FAMILY = "2"
function isfeatureEnabled()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(radiusTable, ROWID, FIRST_COOKIE, attribute.feature)
  if L0_1 == NIL then
    return _UPVALUE0_.FAILURE
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
  L0_5 = L0_5(radiusTable, ROWID, FIRST_COOKIE, attribute.profile)
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
  L2_9 = NIL
  if A0_7 == L2_9 then
    L2_9 = _UPVALUE0_
    L2_9 = L2_9.INVALID_ARGUMENT
    return L2_9
  end
  L2_9 = cookieValidate
  L3_10 = ROWID
  L3_10 = L2_9(L3_10, A0_7, radiusTable)
  if L2_9 ~= _UPVALUE0_.SUCCESS then
    return L2_9
  end
  if A1_8 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_8) > PROFILE_LENGTH_MAX or string.len(A1_8) < PROFILE_LENGTH_MIN then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(radiusTable, ROWID, FIRST_COOKIE, attribute.profile, A1_8) == NIL then
    return _UPVALUE0_.FAILURE, L3_10
  end
  if db.setAttribute(radiusTable, ROWID, SECOND_COOKIE, attribute.profile, A1_8) == NIL then
    return _UPVALUE0_.FAILURE, L3_10
  end
  if db.setAttribute(radiusTable, ROWID, THIRD_COOKIE, attribute.profile, A1_8) == NIL then
    return _UPVALUE0_.FAILURE, L3_10
  end
  return _UPVALUE0_.SUCCESS, L3_10
end
function primaryServerGet()
  local L0_11
  L0_11 = db
  L0_11 = L0_11.getAttribute
  L0_11 = L0_11(radiusTable, ROWID, FIRST_COOKIE, attribute.primaryServer)
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
  L2_15 = NIL
  if A0_13 == L2_15 then
    L2_15 = _UPVALUE0_
    L2_15 = L2_15.INVALID_ARGUMENT
    return L2_15
  end
  L2_15 = cookieValidate
  L3_16 = ROWID
  L3_16 = L2_15(L3_16, A0_13, radiusTable)
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
  if db.setAttribute(radiusTable, ROWID, L3_16, attribute.primaryServer, A1_14) == NIL then
    return _UPVALUE0_.FAILURE, L3_16
  end
  return _UPVALUE0_.SUCCESS, L3_16
end
function primaryPortGet()
  local L0_17
  L0_17 = db
  L0_17 = L0_17.getAttribute
  L0_17 = L0_17(radiusTable, ROWID, FIRST_COOKIE, attribute.primaryPort)
  if L0_17 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_17
end
function primaryPortGetNext(A0_18)
  return _UPVALUE0_.NOT_SUPPORTED
end
function primaryPortSet(A0_19, A1_20)
  local L2_21, L3_22
  L2_21 = NIL
  if A0_19 == L2_21 then
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.INVALID_ARGUMENT
    return L2_21
  end
  L2_21 = cookieValidate
  L3_22 = ROWID
  L3_22 = L2_21(L3_22, A0_19, radiusTable)
  if L2_21 ~= _UPVALUE0_.SUCCESS then
    return L2_21
  end
  if A1_20 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_20) < PORT_MIN or tonumber(A1_20) > PORT_MAX then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(radiusTable, ROWID, L3_22, attribute.primaryPort, A1_20) == NIL then
    return _UPVALUE0_.FAILURE, L3_22
  end
  return _UPVALUE0_.SUCCESS, L3_22
end
function primarySecretGet()
  local L0_23
  L0_23 = db
  L0_23 = L0_23.getAttribute
  L0_23 = L0_23(radiusTable, ROWID, FIRST_COOKIE, attribute.primarySecret)
  if L0_23 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_23
end
function primarySecretGetNext(A0_24)
  return _UPVALUE0_.NOT_SUPPORTED
end
function primarySecretSet(A0_25, A1_26)
  local L2_27, L3_28
  L2_27 = NIL
  if A0_25 == L2_27 then
    L2_27 = _UPVALUE0_
    L2_27 = L2_27.INVALID_ARGUMENT
    return L2_27
  end
  L2_27 = cookieValidate
  L3_28 = ROWID
  L3_28 = L2_27(L3_28, A0_25, radiusTable)
  if L2_27 ~= _UPVALUE0_.SUCCESS then
    return L2_27
  end
  if A1_26 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_26) > MAX_SECRET_LEN or string.len(A1_26) < MIN_SECRET_LEN then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(radiusTable, ROWID, L3_28, attribute.primarySecret, A1_26) == NIL then
    return _UPVALUE0_.FAILURE, L3_28
  end
  return _UPVALUE0_.SUCCESS, L3_28
end
function primaryTimeoutGet()
  local L0_29
  L0_29 = db
  L0_29 = L0_29.getAttribute
  L0_29 = L0_29(radiusTable, ROWID, FIRST_COOKIE, attribute.primaryTimeout)
  if L0_29 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_29
end
function primaryTimeoutGetNext(A0_30)
  return _UPVALUE0_.NOT_SUPPORTED
end
function primaryTimeoutSet(A0_31, A1_32)
  local L2_33, L3_34
  L2_33 = NIL
  if A0_31 == L2_33 then
    L2_33 = _UPVALUE0_
    L2_33 = L2_33.INVALID_ARGUMENT
    return L2_33
  end
  L2_33 = cookieValidate
  L3_34 = ROWID
  L3_34 = L2_33(L3_34, A0_31, radiusTable)
  if L2_33 ~= _UPVALUE0_.SUCCESS then
    return L2_33
  end
  if A1_32 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_32) < MIN_TIME or tonumber(A1_32) > MAX_TIME then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(radiusTable, ROWID, L3_34, attribute.primaryTimeout, A1_32) == NIL then
    return _UPVALUE0_.FAILURE, L3_34
  end
  return _UPVALUE0_.SUCCESS, L3_34
end
function primaryMaxRetriesGet()
  local L0_35
  L0_35 = db
  L0_35 = L0_35.getAttribute
  L0_35 = L0_35(radiusTable, ROWID, FIRST_COOKIE, attribute.primaryMaxRetries)
  if L0_35 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_35
end
function primaryMaxRetriesGetNext(A0_36)
  return _UPVALUE0_.NOT_SUPPORTED
end
function primaryMaxRetriesSet(A0_37, A1_38)
  local L2_39, L3_40
  L2_39 = NIL
  if A0_37 == L2_39 then
    L2_39 = _UPVALUE0_
    L2_39 = L2_39.INVALID_ARGUMENT
    return L2_39
  end
  L2_39 = cookieValidate
  L3_40 = ROWID
  L3_40 = L2_39(L3_40, A0_37, radiusTable)
  if L2_39 ~= _UPVALUE0_.SUCCESS then
    return L2_39
  end
  if A1_38 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_38) < MIN_RETRIES or tonumber(A1_38) > MAX_RETRIES then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(radiusTable, ROWID, L3_40, attribute.primaryMaxRetries, A1_38) == NIL then
    return _UPVALUE0_.FAILURE, L3_40
  end
  return _UPVALUE0_.SUCCESS, L3_40
end
function secondaryServerGet()
  local L0_41
  L0_41 = db
  L0_41 = L0_41.getAttribute
  L0_41 = L0_41(radiusTable, ROWID, SECOND_COOKIE, attribute.secondaryServer)
  if L0_41 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_41
end
function secondaryServerGetNext(A0_42)
  return _UPVALUE0_.NOT_SUPPORTED
end
function secondaryServerSet(A0_43, A1_44)
  local L2_45, L3_46
  L2_45 = NIL
  if A0_43 == L2_45 then
    L2_45 = _UPVALUE0_
    L2_45 = L2_45.INVALID_ARGUMENT
    return L2_45
  end
  L2_45 = cookieValidate
  L3_46 = ROWID
  L3_46 = L2_45(L3_46, A0_43, radiusTable)
  if L2_45 ~= _UPVALUE0_.SUCCESS then
    return L2_45
  end
  if A1_44 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck(IPV4_ADDRESS_FAMILY, A1_44)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(radiusTable, ROWID, L3_46, attribute.secondaryServer, A1_44) == NIL then
    return _UPVALUE0_.FAILURE, L3_46
  end
  return _UPVALUE0_.SUCCESS, L3_46
end
function secondaryPortGet()
  local L0_47
  L0_47 = db
  L0_47 = L0_47.getAttribute
  L0_47 = L0_47(radiusTable, ROWID, SECOND_COOKIE, attribute.secondaryPort)
  if L0_47 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_47
end
function secondaryPortGetNext(A0_48)
  return _UPVALUE0_.NOT_SUPPORTED
end
function secondaryPortSet(A0_49, A1_50)
  local L2_51, L3_52
  L2_51 = NIL
  if A0_49 == L2_51 then
    L2_51 = _UPVALUE0_
    L2_51 = L2_51.INVALID_ARGUMENT
    return L2_51
  end
  L2_51 = cookieValidate
  L3_52 = ROWID
  L3_52 = L2_51(L3_52, A0_49, radiusTable)
  if L2_51 ~= _UPVALUE0_.SUCCESS then
    return L2_51
  end
  if A1_50 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_50) < PORT_MIN or tonumber(A1_50) > PORT_MAX then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(radiusTable, ROWID, L3_52, attribute.secondaryPort, A1_50) == NIL then
    return _UPVALUE0_.FAILURE, L3_52
  end
  return _UPVALUE0_.SUCCESS, L3_52
end
function secondarySecretGet()
  local L0_53
  L0_53 = db
  L0_53 = L0_53.getAttribute
  L0_53 = L0_53(radiusTable, ROWID, SECOND_COOKIE, attribute.secondarySecret)
  if L0_53 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_53
end
function secondarySecretGetNext(A0_54)
  return _UPVALUE0_.NOT_SUPPORTED
end
function secondarySecretSet(A0_55, A1_56)
  local L2_57, L3_58
  L2_57 = NIL
  if A0_55 == L2_57 then
    L2_57 = _UPVALUE0_
    L2_57 = L2_57.INVALID_ARGUMENT
    return L2_57
  end
  L2_57 = cookieValidate
  L3_58 = ROWID
  L3_58 = L2_57(L3_58, A0_55, radiusTable)
  if L2_57 ~= _UPVALUE0_.SUCCESS then
    return L2_57
  end
  if A1_56 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_56) > MAX_SECRET_LEN or string.len(A1_56) < MIN_SECRET_LEN then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(radiusTable, ROWID, L3_58, attribute.secondarySecret, A1_56) == NIL then
    return _UPVALUE0_.FAILURE, L3_58
  end
  return _UPVALUE0_.SUCCESS, L3_58
end
function secondaryTimeoutGet()
  local L0_59
  L0_59 = db
  L0_59 = L0_59.getAttribute
  L0_59 = L0_59(radiusTable, ROWID, SECOND_COOKIE, attribute.secondaryTimeout)
  if L0_59 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_59
end
function secondaryTimeoutGetNext(A0_60)
  return _UPVALUE0_.NOT_SUPPORTED
end
function secondaryTimeoutSet(A0_61, A1_62)
  local L2_63, L3_64
  L2_63 = NIL
  if A0_61 == L2_63 then
    L2_63 = _UPVALUE0_
    L2_63 = L2_63.INVALID_ARGUMENT
    return L2_63
  end
  L2_63 = cookieValidate
  L3_64 = ROWID
  L3_64 = L2_63(L3_64, A0_61, radiusTable)
  if L2_63 ~= _UPVALUE0_.SUCCESS then
    return L2_63
  end
  if A1_62 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_62) < MIN_TIME or tonumber(A1_62) > MAX_TIME then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(radiusTable, ROWID, L3_64, attribute.secondaryTimeout, A1_62) == NIL then
    return _UPVALUE0_.FAILURE, L3_64
  end
  return _UPVALUE0_.SUCCESS, L3_64
end
function secondaryMaxRetriesGet()
  local L0_65
  L0_65 = db
  L0_65 = L0_65.getAttribute
  L0_65 = L0_65(radiusTable, ROWID, SECOND_COOKIE, attribute.secondaryMaxRetries)
  if L0_65 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_65
end
function secondaryMaxRetriesGetNext(A0_66)
  return _UPVALUE0_.NOT_SUPPORTED
end
function secondaryMaxRetriesSet(A0_67, A1_68)
  local L2_69, L3_70
  L2_69 = NIL
  if A0_67 == L2_69 then
    L2_69 = _UPVALUE0_
    L2_69 = L2_69.INVALID_ARGUMENT
    return L2_69
  end
  L2_69 = cookieValidate
  L3_70 = ROWID
  L3_70 = L2_69(L3_70, A0_67, radiusTable)
  if L2_69 ~= _UPVALUE0_.SUCCESS then
    return L2_69
  end
  if A1_68 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_68) < MIN_RETRIES or tonumber(A1_68) > MAX_RETRIES then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(radiusTable, ROWID, L3_70, attribute.secondaryMaxRetries, A1_68) == NIL then
    return _UPVALUE0_.FAILURE, L3_70
  end
  return _UPVALUE0_.SUCCESS, L3_70
end
function tertiaryServerGet()
  local L0_71
  L0_71 = db
  L0_71 = L0_71.getAttribute
  L0_71 = L0_71(radiusTable, ROWID, THIRD_COOKIE, attribute.tertiaryServer)
  if L0_71 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_71
end
function tertiaryServerGetNext(A0_72)
  return _UPVALUE0_.NOT_SUPPORTED
end
function tertiaryServerSet(A0_73, A1_74)
  local L2_75, L3_76
  L2_75 = NIL
  if A0_73 == L2_75 then
    L2_75 = _UPVALUE0_
    L2_75 = L2_75.INVALID_ARGUMENT
    return L2_75
  end
  L2_75 = cookieValidate
  L3_76 = ROWID
  L3_76 = L2_75(L3_76, A0_73, radiusTable)
  if L2_75 ~= _UPVALUE0_.SUCCESS then
    return L2_75
  end
  if A1_74 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck(IPV4_ADDRESS_FAMILY, A1_74)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(radiusTable, ROWID, L3_76, attribute.tertiaryServer, A1_74) == NIL then
    return _UPVALUE0_.FAILURE, L3_76
  end
  return _UPVALUE0_.SUCCESS, L3_76
end
function tertiaryPortGet()
  local L0_77
  L0_77 = db
  L0_77 = L0_77.getAttribute
  L0_77 = L0_77(radiusTable, ROWID, THIRD_COOKIE, attribute.tertiaryPort)
  if L0_77 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_77
end
function tertiaryPortGetNext(A0_78)
  return _UPVALUE0_.NOT_SUPPORTED
end
function tertiaryPortSet(A0_79, A1_80)
  local L2_81, L3_82
  L2_81 = NIL
  if A0_79 == L2_81 then
    L2_81 = _UPVALUE0_
    L2_81 = L2_81.INVALID_ARGUMENT
    return L2_81
  end
  L2_81 = cookieValidate
  L3_82 = ROWID
  L3_82 = L2_81(L3_82, A0_79, radiusTable)
  if L2_81 ~= _UPVALUE0_.SUCCESS then
    return L2_81
  end
  if A1_80 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_80) < PORT_MIN or tonumber(A1_80) > PORT_MAX then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(radiusTable, ROWID, L3_82, attribute.tertiaryPort, A1_80) == NIL then
    return _UPVALUE0_.FAILURE, L3_82
  end
  return _UPVALUE0_.SUCCESS, L3_82
end
function tertiarySecretGet()
  local L0_83
  L0_83 = db
  L0_83 = L0_83.getAttribute
  L0_83 = L0_83(radiusTable, ROWID, THIRD_COOKIE, attribute.tertiarySecret)
  if L0_83 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_83
end
function tertiarySecretGetNext(A0_84)
  return _UPVALUE0_.NOT_SUPPORTED
end
function tertiarySecretSet(A0_85, A1_86)
  local L2_87, L3_88
  L2_87 = NIL
  if A0_85 == L2_87 then
    L2_87 = _UPVALUE0_
    L2_87 = L2_87.INVALID_ARGUMENT
    return L2_87
  end
  L2_87 = cookieValidate
  L3_88 = ROWID
  L3_88 = L2_87(L3_88, A0_85, radiusTable)
  if L2_87 ~= _UPVALUE0_.SUCCESS then
    return L2_87
  end
  if A1_86 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_86) > MAX_SECRET_LEN or string.len(A1_86) < MIN_SECRET_LEN then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(radiusTable, ROWID, L3_88, attribute.tertiarySecret, A1_86) == NIL then
    return _UPVALUE0_.FAILURE, L3_88
  end
  return _UPVALUE0_.SUCCESS, L3_88
end
function tertiaryTimeoutGet()
  local L0_89
  L0_89 = db
  L0_89 = L0_89.getAttribute
  L0_89 = L0_89(radiusTable, ROWID, THIRD_COOKIE, attribute.tertiaryTimeout)
  if L0_89 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_89
end
function tertiaryTimeoutGetNext(A0_90)
  return _UPVALUE0_.NOT_SUPPORTED
end
function tertiaryTimeoutSet(A0_91, A1_92)
  local L2_93, L3_94
  L2_93 = NIL
  if A0_91 == L2_93 then
    L2_93 = _UPVALUE0_
    L2_93 = L2_93.INVALID_ARGUMENT
    return L2_93
  end
  L2_93 = cookieValidate
  L3_94 = ROWID
  L3_94 = L2_93(L3_94, A0_91, radiusTable)
  if L2_93 ~= _UPVALUE0_.SUCCESS then
    return L2_93
  end
  if A1_92 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_92) < MIN_TIME or tonumber(A1_92) > MAX_TIME then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(radiusTable, ROWID, L3_94, attribute.tertiaryTimeout, A1_92) == NIL then
    return _UPVALUE0_.FAILURE, L3_94
  end
  return _UPVALUE0_.SUCCESS, L3_94
end
function tertiaryMaxRetriesGet()
  local L0_95
  L0_95 = db
  L0_95 = L0_95.getAttribute
  L0_95 = L0_95(radiusTable, ROWID, THIRD_COOKIE, attribute.tertiaryMaxRetries)
  if L0_95 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_95
end
function tertiaryMaxRetriesGetNext(A0_96)
  return _UPVALUE0_.NOT_SUPPORTED
end
function tertiaryMaxRetriesSet(A0_97, A1_98)
  local L2_99, L3_100
  L2_99 = NIL
  if A0_97 == L2_99 then
    L2_99 = _UPVALUE0_
    L2_99 = L2_99.INVALID_ARGUMENT
    return L2_99
  end
  L2_99 = cookieValidate
  L3_100 = ROWID
  L3_100 = L2_99(L3_100, A0_97, radiusTable)
  if L2_99 ~= _UPVALUE0_.SUCCESS then
    return L2_99
  end
  if A1_98 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_98) < MIN_RETRIES or tonumber(A1_98) > MAX_RETRIES then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(radiusTable, ROWID, L3_100, attribute.tertiaryMaxRetries, A1_98) == NIL then
    return _UPVALUE0_.FAILURE, L3_100
  end
  return _UPVALUE0_.SUCCESS, L3_100
end
function serverGet()
  local L0_101, L1_102, L2_103, L3_104, L4_105, L5_106
  L0_101 = db
  L0_101 = L0_101.getRow
  L1_102 = radiusTable
  L2_103 = ROWID
  L3_104 = FIRST_COOKIE
  L0_101 = L0_101(L1_102, L2_103, L3_104)
  L1_102 = NIL
  if L0_101 == L1_102 then
    L1_102 = _UPVALUE0_
    L1_102 = L1_102.FAILURE
    return L1_102
  end
  L1_102 = db
  L1_102 = L1_102.getRow
  L2_103 = radiusTable
  L3_104 = ROWID
  L4_105 = SECOND_COOKIE
  L1_102 = L1_102(L2_103, L3_104, L4_105)
  L2_103 = NIL
  if L1_102 == L2_103 then
    L2_103 = _UPVALUE0_
    L2_103 = L2_103.FAILURE
    return L2_103
  end
  L2_103 = db
  L2_103 = L2_103.getRow
  L3_104 = radiusTable
  L4_105 = ROWID
  L5_106 = THIRD_COOKIE
  L2_103 = L2_103(L3_104, L4_105, L5_106)
  L3_104 = NIL
  if L2_103 == L3_104 then
    L3_104 = _UPVALUE0_
    L3_104 = L3_104.FAILURE
    return L3_104
  end
  L3_104 = db
  L3_104 = L3_104.getRow
  L4_105 = radiusAuthConfTbl
  L5_106 = ROWID
  L3_104 = L3_104(L4_105, L5_106, FIRST_COOKIE)
  L4_105 = nil
  L5_106 = NIL
  if L3_104 == L5_106 then
    L4_105 = _UPVALUE1_
  else
    L5_106 = radiusAuthConfTbl
    L5_106 = L5_106 .. "." .. attribute.nasIfaceName
    L4_105 = L3_104[L5_106]
  end
  L5_106 = db
  L5_106 = L5_106.getAttribute
  L5_106 = L5_106(wanModeTbl, ROWID, FIRST_COOKIE, attribute.wanMode)
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, L0_101[radiusTable .. "." .. attribute.profile], L0_101[radiusTable .. "." .. attribute.primaryServer], L0_101[radiusTable .. "." .. attribute.primaryPort], L0_101[radiusTable .. "." .. attribute.primarySecret], L0_101[radiusTable .. "." .. attribute.primaryTimeout], L0_101[radiusTable .. "." .. attribute.primaryMaxRetries], L1_102[radiusTable .. "." .. attribute.secondaryServer], L1_102[radiusTable .. "." .. attribute.secondaryPort], L1_102[radiusTable .. "." .. attribute.secondarySecret], L1_102[radiusTable .. "." .. attribute.secondaryTimeout], L1_102[radiusTable .. "." .. attribute.secondaryMaxRetries], L2_103[radiusTable .. "." .. attribute.tertiaryServer], L2_103[radiusTable .. "." .. attribute.tertiaryPort], L2_103[radiusTable .. "." .. attribute.tertiarySecret], L2_103[radiusTable .. "." .. attribute.tertiaryTimeout], L2_103[radiusTable .. "." .. attribute.tertiaryMaxRetries], L4_105, L5_106
end
function accServerGet()
  if db.getRow(radiusTable, ROWID, FIRST_COOKIE) == NIL then
    return _UPVALUE0_.FAILURE
  end
  if db.getRow(radiusTable, ROWID, SECOND_COOKIE) == NIL then
    return _UPVALUE0_.FAILURE
  end
  if db.getRow(radiusTable, ROWID, THIRD_COOKIE) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, FIRST_COOKIE, db.getRow(radiusTable, ROWID, FIRST_COOKIE)[radiusTable .. "." .. attribute.profile], db.getRow(radiusTable, ROWID, FIRST_COOKIE)[radiusTable .. "." .. attribute.primaryAccServer], db.getRow(radiusTable, ROWID, FIRST_COOKIE)[radiusTable .. "." .. attribute.primaryAccPort], db.getRow(radiusTable, ROWID, FIRST_COOKIE)[radiusTable .. "." .. attribute.primaryAccSecret], db.getRow(radiusTable, ROWID, SECOND_COOKIE)[radiusTable .. "." .. attribute.secondaryAccServer], db.getRow(radiusTable, ROWID, SECOND_COOKIE)[radiusTable .. "." .. attribute.secondaryAccPort], db.getRow(radiusTable, ROWID, SECOND_COOKIE)[radiusTable .. "." .. attribute.secondaryAccSecret], db.getRow(radiusTable, ROWID, THIRD_COOKIE)[radiusTable .. "." .. attribute.tertiaryAccServer], db.getRow(radiusTable, ROWID, THIRD_COOKIE)[radiusTable .. "." .. attribute.tertiaryAccPort], db.getRow(radiusTable, ROWID, THIRD_COOKIE)[radiusTable .. "." .. attribute.tertiaryAccSecret]
end
function serverGetNext(A0_107)
  return _UPVALUE0_.NOT_SUPPORTED
end
function serverSet(A0_108, A1_109, A2_110, A3_111, A4_112, A5_113, A6_114, A7_115, A8_116, A9_117, A10_118, A11_119, A12_120, A13_121, A14_122, A15_123, A16_124, A17_125)
  local L18_126, L19_127, L20_128, L21_129, L22_130, L23_131, L24_132, L25_133, L26_134, L27_135, L28_136, L29_137, L30_138, L31_139, L32_140, L33_141, L34_142, L35_143, L36_144, L37_145, L38_146, L39_147, L40_148, L41_149, L42_150, L43_151, L44_152, L45_153, L46_154, L47_155, L48_156, L49_157, L50_158, L51_159
  L18_126 = {}
  L19_127 = {}
  L20_128 = {}
  L21_129 = nil
  L22_130 = NIL
  if A0_108 == L22_130 then
    L22_130 = _UPVALUE0_
    L22_130 = L22_130.INVALID_ARGUMENT
    return L22_130
  end
  L22_130 = cookieValidate
  L23_131 = ROWID
  L24_132 = A0_108
  L25_133 = radiusTable
  L23_131 = L22_130(L23_131, L24_132, L25_133)
  L24_132 = _UPVALUE0_
  L24_132 = L24_132.SUCCESS
  if L22_130 ~= L24_132 then
    return L22_130
  end
  L24_132 = NIL
  if A1_109 == L24_132 then
    L24_132 = _UPVALUE1_
    L24_132 = L24_132.RADIUS_SERVER_PROFILE_NIL
    return L24_132
  end
  L24_132 = NIL
  if A2_110 == L24_132 then
    L24_132 = _UPVALUE1_
    L24_132 = L24_132.RADIUS_SERVER_PRIMARY_SERVER_NIL
    return L24_132
  end
  L24_132 = _UPVALUE2_
  L24_132 = L24_132.ipAddressCheck
  L25_133 = IPV4_ADDRESS_FAMILY
  L26_134 = A2_110
  L24_132 = L24_132(L25_133, L26_134)
  L21_129 = L24_132
  L24_132 = _UPVALUE0_
  L24_132 = L24_132.SUCCESS
  if L21_129 ~= L24_132 then
    L24_132 = _UPVALUE1_
    L24_132 = L24_132.RADIUS_SERVER_PRIMARY_IPADDRESS_INVALID
    return L24_132
  end
  L24_132 = NIL
  if A3_111 == L24_132 then
    L24_132 = _UPVALUE1_
    L24_132 = L24_132.RADIUS_SERVER_PRIMARY_PORT_NIL
    return L24_132
  end
  L24_132 = tonumber
  L25_133 = A3_111
  L24_132 = L24_132(L25_133)
  L25_133 = PORT_MIN
  if not (L24_132 < L25_133) then
    L25_133 = PORT_MAX
  elseif L24_132 > L25_133 then
    L25_133 = _UPVALUE1_
    L25_133 = L25_133.RADIUS_SERVER_PRIMARY_PORT_INVALID
    return L25_133
  end
  L25_133 = NIL
  if A4_112 == L25_133 then
    L25_133 = _UPVALUE1_
    L25_133 = L25_133.RADIUS_SERVER_PRIMARY_SECRET_NIL
    return L25_133
  end
  L25_133 = string
  L25_133 = L25_133.len
  L26_134 = A4_112
  L25_133 = L25_133(L26_134)
  L26_134 = MAX_SECRET_LEN
  if not (L25_133 > L26_134) then
    L26_134 = MIN_SECRET_LEN
  elseif L25_133 < L26_134 then
    L26_134 = _UPVALUE1_
    L26_134 = L26_134.RADIUS_SERVER_PRIMARY_SECRET_INVALID
    return L26_134
  end
  L26_134 = NIL
  if A5_113 == L26_134 then
    L26_134 = _UPVALUE1_
    L26_134 = L26_134.RADIUS_SERVER_PRIMARY_TIMEOUT_NIL
    return L26_134
  end
  L26_134 = tonumber
  L27_135 = A5_113
  L26_134 = L26_134(L27_135)
  L27_135 = MIN_TIME
  if not (L26_134 < L27_135) then
    L27_135 = MAX_TIME
  elseif L26_134 > L27_135 then
    L27_135 = _UPVALUE1_
    L27_135 = L27_135.RADIUS_SERVER_PRIMARY_TIMEOUT_INVALID
    return L27_135
  end
  L27_135 = NIL
  if A6_114 == L27_135 then
    L27_135 = _UPVALUE1_
    L27_135 = L27_135.RADIUS_SERVER_PRIMARY_MAX_RETRIES_NIL
    return L27_135
  end
  L27_135 = tonumber
  L28_136 = A6_114
  L27_135 = L27_135(L28_136)
  L28_136 = MIN_RETRIES
  if not (L27_135 < L28_136) then
    L28_136 = MAX_RETRIES
  elseif L27_135 > L28_136 then
    L28_136 = _UPVALUE1_
    L28_136 = L28_136.RADIUS_SERVER_PRIMARY_MAX_RETRIES_INVALID
    return L28_136
  end
  L28_136 = NIL
  if A7_115 == L28_136 then
    L28_136 = _UPVALUE1_
    L28_136 = L28_136.RADIUS_SERVER_SECONDARY_SERVER_NIL
    return L28_136
  end
  L28_136 = _UPVALUE2_
  L28_136 = L28_136.ipAddressCheck
  L29_137 = IPV4_ADDRESS_FAMILY
  L30_138 = A7_115
  L28_136 = L28_136(L29_137, L30_138)
  L21_129 = L28_136
  L28_136 = _UPVALUE0_
  L28_136 = L28_136.SUCCESS
  if L21_129 ~= L28_136 then
    L28_136 = _UPVALUE1_
    L28_136 = L28_136.RADIUS_SERVER_SECONDARY_IPADDRESS_INVALID
    return L28_136
  end
  L28_136 = NIL
  if A8_116 == L28_136 then
    L28_136 = _UPVALUE1_
    L28_136 = L28_136.RADIUS_SERVER_SECONDARY_PORT_NIL
    return L28_136
  end
  L28_136 = tonumber
  L29_137 = A8_116
  L28_136 = L28_136(L29_137)
  L29_137 = PORT_MIN
  if not (L28_136 < L29_137) then
    L29_137 = PORT_MAX
  elseif L28_136 > L29_137 then
    L29_137 = _UPVALUE1_
    L29_137 = L29_137.RADIUS_SERVER_SECONDARY_PORT_INVALID
    return L29_137
  end
  L29_137 = NIL
  if A9_117 == L29_137 then
    L29_137 = _UPVALUE1_
    L29_137 = L29_137.RADIUS_SERVER_SECONDARY_SECRET_NIL
    return L29_137
  end
  L29_137 = string
  L29_137 = L29_137.len
  L30_138 = A9_117
  L29_137 = L29_137(L30_138)
  L30_138 = MAX_SECRET_LEN
  if not (L29_137 > L30_138) then
    L30_138 = MIN_SECRET_LEN
  elseif L29_137 < L30_138 then
    L30_138 = _UPVALUE1_
    L30_138 = L30_138.RADIUS_SERVER_SECONDARY_SECRET_INVALID
    return L30_138
  end
  L30_138 = NIL
  if A10_118 == L30_138 then
    L30_138 = _UPVALUE1_
    L30_138 = L30_138.RADIUS_SERVER_SECONDARY_TIMEOUT_NIL
    return L30_138
  end
  L30_138 = tonumber
  L31_139 = A10_118
  L30_138 = L30_138(L31_139)
  L31_139 = MIN_TIME
  if not (L30_138 < L31_139) then
    L31_139 = MAX_TIME
  elseif L30_138 > L31_139 then
    L31_139 = _UPVALUE1_
    L31_139 = L31_139.RADIUS_SERVER_SECONDARY_TIMEOUT_INVALID
    return L31_139
  end
  L31_139 = NIL
  if A11_119 == L31_139 then
    L31_139 = _UPVALUE1_
    L31_139 = L31_139.RADIUS_SERVER_SECONDARY_MAXRETRIES_NIL
    return L31_139
  end
  L31_139 = tonumber
  L32_140 = A11_119
  L31_139 = L31_139(L32_140)
  L32_140 = MIN_RETRIES
  if not (L31_139 < L32_140) then
    L32_140 = MAX_RETRIES
  elseif L31_139 > L32_140 then
    L32_140 = _UPVALUE1_
    L32_140 = L32_140.RADIUS_SERVER_SECONDARY_MAXRETRIES_INVALID
    return L32_140
  end
  L32_140 = NIL
  if A12_120 == L32_140 then
    L32_140 = _UPVALUE1_
    L32_140 = L32_140.RADIUS_SERVER_TERTIARY_SERVER_NIL
    return L32_140
  end
  L32_140 = _UPVALUE2_
  L32_140 = L32_140.ipAddressCheck
  L33_141 = IPV4_ADDRESS_FAMILY
  L34_142 = A12_120
  L32_140 = L32_140(L33_141, L34_142)
  L21_129 = L32_140
  L32_140 = _UPVALUE0_
  L32_140 = L32_140.SUCCESS
  if L21_129 ~= L32_140 then
    L32_140 = _UPVALUE1_
    L32_140 = L32_140.RADIUS_SERVER_TERTIARY_SERVER_INVALID
    return L32_140
  end
  L32_140 = NIL
  if A13_121 == L32_140 then
    L32_140 = _UPVALUE1_
    L32_140 = L32_140.RADIUS_SERVER_TERTIARY_PORT_NIL
    return L32_140
  end
  L32_140 = tonumber
  L33_141 = A13_121
  L32_140 = L32_140(L33_141)
  L33_141 = PORT_MIN
  if not (L32_140 < L33_141) then
    L33_141 = PORT_MAX
  elseif L32_140 > L33_141 then
    L33_141 = _UPVALUE1_
    L33_141 = L33_141.RADIUS_SERVER_TERTIARY_PORT_INVALID
    return L33_141
  end
  L33_141 = NIL
  if A14_122 == L33_141 then
    L33_141 = _UPVALUE1_
    L33_141 = L33_141.RADIUS_SERVER_TERTIARY_SECRET_NIL
    return L33_141
  end
  L33_141 = string
  L33_141 = L33_141.len
  L34_142 = A14_122
  L33_141 = L33_141(L34_142)
  L34_142 = MAX_SECRET_LEN
  if not (L33_141 > L34_142) then
    L34_142 = MIN_SECRET_LEN
  elseif L33_141 < L34_142 then
    L34_142 = _UPVALUE1_
    L34_142 = L34_142.RADIUS_SERVER_TERTIARY_SECRET_INVALID
    return L34_142
  end
  L34_142 = NIL
  if A15_123 == L34_142 then
    L34_142 = _UPVALUE1_
    L34_142 = L34_142.RADIUS_SERVER_TERTIARY_TIMEOUT_NIL
    return L34_142
  end
  L34_142 = tonumber
  L35_143 = A15_123
  L34_142 = L34_142(L35_143)
  L35_143 = MIN_TIME
  if not (L34_142 < L35_143) then
    L35_143 = MAX_TIME
  elseif L34_142 > L35_143 then
    L35_143 = _UPVALUE1_
    L35_143 = L35_143.RADIUS_SERVER_TERTIARY_TIMEOUT_INVALID
    return L35_143
  end
  L35_143 = NIL
  if A16_124 == L35_143 then
    L35_143 = _UPVALUE1_
    L35_143 = L35_143.RADIUS_SERVER_TERTIARY_MAX_RETRIES_NIL
    return L35_143
  end
  L35_143 = tonumber
  L36_144 = A16_124
  L35_143 = L35_143(L36_144)
  L36_144 = MIN_RETRIES
  if not (L35_143 < L36_144) then
    L36_144 = MAX_RETRIES
  elseif L35_143 > L36_144 then
    L36_144 = _UPVALUE1_
    L36_144 = L36_144.RADIUS_SERVER_TERTIARY_MAX_RETRIES_INVALID
    return L36_144
  end
  L36_144 = db
  L36_144 = L36_144.getAttribute
  L37_145 = wanModeTbl
  L38_146 = ROWID
  L39_147 = FIRST_COOKIE
  L40_148 = attribute
  L40_148 = L40_148.wanMode
  L36_144 = L36_144(L37_145, L38_146, L39_147, L40_148)
  L37_145 = tonumber
  L38_146 = L36_144
  L37_145 = L37_145(L38_146)
  L38_146 = _UPVALUE3_
  if L37_145 ~= L38_146 then
    L37_145 = tonumber
    L38_146 = L36_144
    L37_145 = L37_145(L38_146)
    L38_146 = _UPVALUE4_
  elseif L37_145 == L38_146 then
    L37_145 = _UPVALUE0_
    L37_145 = L37_145.NIL
    if A17_125 == L37_145 then
      L37_145 = _UPVALUE0_
      L37_145 = L37_145.INVALID_ARGUMENT
      return L37_145
    end
  end
  L37_145 = {}
  L38_146 = radiusTable
  L39_147 = "."
  L40_148 = attribute
  L40_148 = L40_148.profile
  L38_146 = L38_146 .. L39_147 .. L40_148
  L37_145[L38_146] = A1_109
  L38_146 = radiusTable
  L39_147 = "."
  L40_148 = attribute
  L40_148 = L40_148.primaryServer
  L38_146 = L38_146 .. L39_147 .. L40_148
  L37_145[L38_146] = A2_110
  L38_146 = radiusTable
  L39_147 = "."
  L40_148 = attribute
  L40_148 = L40_148.primaryPort
  L38_146 = L38_146 .. L39_147 .. L40_148
  L37_145[L38_146] = A3_111
  L38_146 = radiusTable
  L39_147 = "."
  L40_148 = attribute
  L40_148 = L40_148.primarySecret
  L38_146 = L38_146 .. L39_147 .. L40_148
  L37_145[L38_146] = A4_112
  L38_146 = radiusTable
  L39_147 = "."
  L40_148 = attribute
  L40_148 = L40_148.primaryTimeout
  L38_146 = L38_146 .. L39_147 .. L40_148
  L37_145[L38_146] = A5_113
  L38_146 = radiusTable
  L39_147 = "."
  L40_148 = attribute
  L40_148 = L40_148.primaryMaxRetries
  L38_146 = L38_146 .. L39_147 .. L40_148
  L37_145[L38_146] = A6_114
  L38_146 = {}
  L39_147 = radiusTable
  L40_148 = "."
  L41_149 = attribute
  L41_149 = L41_149.secondaryServer
  L39_147 = L39_147 .. L40_148 .. L41_149
  L38_146[L39_147] = A7_115
  L39_147 = radiusTable
  L40_148 = "."
  L41_149 = attribute
  L41_149 = L41_149.secondaryPort
  L39_147 = L39_147 .. L40_148 .. L41_149
  L38_146[L39_147] = A8_116
  L39_147 = radiusTable
  L40_148 = "."
  L41_149 = attribute
  L41_149 = L41_149.secondarySecret
  L39_147 = L39_147 .. L40_148 .. L41_149
  L38_146[L39_147] = A9_117
  L39_147 = radiusTable
  L40_148 = "."
  L41_149 = attribute
  L41_149 = L41_149.secondaryTimeout
  L39_147 = L39_147 .. L40_148 .. L41_149
  L38_146[L39_147] = A10_118
  L39_147 = radiusTable
  L40_148 = "."
  L41_149 = attribute
  L41_149 = L41_149.secondaryMaxRetries
  L39_147 = L39_147 .. L40_148 .. L41_149
  L38_146[L39_147] = A11_119
  L39_147 = {}
  L40_148 = radiusTable
  L41_149 = "."
  L42_150 = attribute
  L42_150 = L42_150.tertiaryServer
  L40_148 = L40_148 .. L41_149 .. L42_150
  L39_147[L40_148] = A12_120
  L40_148 = radiusTable
  L41_149 = "."
  L42_150 = attribute
  L42_150 = L42_150.tertiaryPort
  L40_148 = L40_148 .. L41_149 .. L42_150
  L39_147[L40_148] = A13_121
  L40_148 = radiusTable
  L41_149 = "."
  L42_150 = attribute
  L42_150 = L42_150.tertiarySecret
  L40_148 = L40_148 .. L41_149 .. L42_150
  L39_147[L40_148] = A14_122
  L40_148 = radiusTable
  L41_149 = "."
  L42_150 = attribute
  L42_150 = L42_150.tertiaryTimeout
  L40_148 = L40_148 .. L41_149 .. L42_150
  L39_147[L40_148] = A15_123
  L40_148 = radiusTable
  L41_149 = "."
  L42_150 = attribute
  L42_150 = L42_150.tertiaryMaxRetries
  L40_148 = L40_148 .. L41_149 .. L42_150
  L39_147[L40_148] = A16_124
  L40_148 = db
  L40_148 = L40_148.update
  L41_149 = radiusTable
  L42_150 = L37_145
  L43_151 = FIRST_COOKIE
  L40_148 = L40_148(L41_149, L42_150, L43_151)
  L41_149 = NIL
  if L40_148 == L41_149 then
    L41_149 = _UPVALUE0_
    L41_149 = L41_149.FAILURE
    return L41_149
  end
  L41_149 = authenticateVlanServerUpdate
  L42_150 = A2_110
  L43_151 = FIRST_COOKIE
  L41_149(L42_150, L43_151)
  L41_149 = db
  L41_149 = L41_149.update
  L42_150 = radiusTable
  L43_151 = L38_146
  L44_152 = SECOND_COOKIE
  L41_149 = L41_149(L42_150, L43_151, L44_152)
  L42_150 = NIL
  if L41_149 == L42_150 then
    L42_150 = _UPVALUE0_
    L42_150 = L42_150.FAILURE
    return L42_150
  end
  L42_150 = authenticateVlanServerUpdate
  L43_151 = A7_115
  L44_152 = SECOND_COOKIE
  L42_150(L43_151, L44_152)
  L42_150 = db
  L42_150 = L42_150.update
  L43_151 = radiusTable
  L44_152 = L39_147
  L45_153 = THIRD_COOKIE
  L42_150 = L42_150(L43_151, L44_152, L45_153)
  L43_151 = NIL
  if L42_150 == L43_151 then
    L43_151 = _UPVALUE0_
    L43_151 = L43_151.FAILURE
    return L43_151
  end
  L43_151 = authenticateVlanServerUpdate
  L44_152 = A12_120
  L45_153 = THIRD_COOKIE
  L43_151(L44_152, L45_153)
  L43_151 = HIGH_SEC
  L44_152 = _UPVALUE5_
  if L43_151 == L44_152 then
    L43_151 = {}
    L44_152 = ""
    L45_153 = ""
    L46_154 = "("
    L50_158 = "' OR "
    L51_159 = attribute
    L51_159 = L51_159.authenticationType
    L46_154 = L46_154 .. L47_155 .. L48_156 .. L49_157 .. L50_158 .. L51_159 .. " = '" .. _UPVALUE7_ .. "' OR " .. attribute.authenticationType .. " = '" .. _UPVALUE8_ .. "' OR " .. attribute.authenticationType .. " = '" .. _UPVALUE9_ .. "' ) AND " .. attribute.authProfile .. " = '" .. A1_109 .. "'"
    L43_151 = L47_155
    if L43_151 ~= L47_155 then
      for L50_158, L51_159 in L47_155(L48_156) do
        L40_148, L45_153 = _UPVALUE10_.sslVpnPolicySet(L51_159, L51_159[userdbDomainTable .. "." .. attribute.authenticationType])
        if L40_148 == _UPVALUE0_.NIL then
          return _UPVALUE0_.FAILURE
        end
      end
    end
  end
  L43_151 = db
  L43_151 = L43_151.getRow
  L44_152 = serviceRouteTable
  L45_153 = attribute
  L45_153 = L45_153.serviceInterface
  L46_154 = "1"
  L43_151 = L43_151(L44_152, L45_153, L46_154)
  L18_126 = L43_151
  if L18_126 ~= nil then
    L43_151 = serviceRouteTable
    L44_152 = "."
    L45_153 = attribute
    L45_153 = L45_153.serverIPAddress
    L43_151 = L43_151 .. L44_152 .. L45_153
    L18_126[L43_151] = A2_110
    L43_151 = db
    L43_151 = L43_151.update
    L44_152 = serviceRouteTable
    L45_153 = L18_126
    L46_154 = serviceRouteTable
    L46_154 = L46_154 .. L47_155 .. L48_156
    L46_154 = L18_126[L46_154]
    L43_151 = L43_151(L44_152, L45_153, L46_154)
    if L43_151 == nil then
      L44_152 = _UPVALUE0_
      L44_152 = L44_152.FAILURE
      return L44_152
    end
  end
  L43_151 = db
  L43_151 = L43_151.getRow
  L44_152 = serviceRouteTable
  L45_153 = attribute
  L45_153 = L45_153.serviceInterface
  L46_154 = "2"
  L43_151 = L43_151(L44_152, L45_153, L46_154)
  L19_127 = L43_151
  if L19_127 ~= nil then
    L43_151 = serviceRouteTable
    L44_152 = "."
    L45_153 = attribute
    L45_153 = L45_153.serverIPAddress
    L43_151 = L43_151 .. L44_152 .. L45_153
    L19_127[L43_151] = A7_115
    L43_151 = db
    L43_151 = L43_151.update
    L44_152 = serviceRouteTable
    L45_153 = L19_127
    L46_154 = serviceRouteTable
    L46_154 = L46_154 .. L47_155 .. L48_156
    L46_154 = L19_127[L46_154]
    L43_151 = L43_151(L44_152, L45_153, L46_154)
    if L43_151 == nil then
      L44_152 = _UPVALUE0_
      L44_152 = L44_152.FAILURE
      return L44_152
    end
  end
  L43_151 = db
  L43_151 = L43_151.getRow
  L44_152 = serviceRouteTable
  L45_153 = attribute
  L45_153 = L45_153.serviceInterface
  L46_154 = "3"
  L43_151 = L43_151(L44_152, L45_153, L46_154)
  L20_128 = L43_151
  if L20_128 ~= nil then
    L43_151 = serviceRouteTable
    L44_152 = "."
    L45_153 = attribute
    L45_153 = L45_153.serverIPAddress
    L43_151 = L43_151 .. L44_152 .. L45_153
    L20_128[L43_151] = A12_120
    L43_151 = db
    L43_151 = L43_151.update
    L44_152 = serviceRouteTable
    L45_153 = L20_128
    L46_154 = serviceRouteTable
    L46_154 = L46_154 .. L47_155 .. L48_156
    L46_154 = L20_128[L46_154]
    L43_151 = L43_151(L44_152, L45_153, L46_154)
    if L43_151 == nil then
      L44_152 = _UPVALUE0_
      L44_152 = L44_152.FAILURE
      return L44_152
    end
  end
  L43_151 = {}
  L44_152 = radiusAuthConfTbl
  L45_153 = "."
  L46_154 = attribute
  L46_154 = L46_154.nasIfaceName
  L44_152 = L44_152 .. L45_153 .. L46_154
  L43_151[L44_152] = A17_125
  L44_152 = db
  L44_152 = L44_152.existsRow
  L45_153 = radiusAuthConfTbl
  L46_154 = ROWID
  L44_152 = L44_152(L45_153, L46_154, L47_155)
  if L44_152 then
    L44_152 = db
    L44_152 = L44_152.update
    L45_153 = radiusAuthConfTbl
    L46_154 = L43_151
    L44_152 = L44_152(L45_153, L46_154, L47_155)
    L21_129 = L44_152
  else
    L44_152 = db
    L44_152 = L44_152.insert
    L45_153 = radiusAuthConfTbl
    L46_154 = L43_151
    L44_152 = L44_152(L45_153, L46_154)
    L21_129 = L44_152
  end
  if not L21_129 then
    L44_152 = _UPVALUE0_
    L44_152 = L44_152.FAILURE
    return L44_152
  end
  L44_152 = _UPVALUE0_
  L44_152 = L44_152.SUCCESS
  L45_153 = L23_131
  return L44_152, L45_153
end
function accServerSet(A0_160, A1_161, A2_162, A3_163, A4_164, A5_165, A6_166, A7_167, A8_168, A9_169, A10_170)
  local L11_171, L12_172, L13_173, L14_174, L15_175, L16_176, L17_177, L18_178, L19_179, L20_180, L21_181, L22_182, L23_183, L24_184
  L11_171 = {}
  L12_172 = {}
  L13_173 = {}
  L14_174 = NIL
  if A0_160 == L14_174 then
    L14_174 = _UPVALUE0_
    L14_174 = L14_174.INVALID_ARGUMENT
    return L14_174
  end
  L14_174 = cookieValidate
  L15_175 = ROWID
  L16_176 = A0_160
  L17_177 = radiusTable
  L15_175 = L14_174(L15_175, L16_176, L17_177)
  L16_176 = _UPVALUE0_
  L16_176 = L16_176.SUCCESS
  if L14_174 ~= L16_176 then
    return L14_174
  end
  L16_176 = NIL
  if A1_161 == L16_176 then
    L16_176 = _UPVALUE1_
    L16_176 = L16_176.RADIUS_SERVER_PROFILE_NIL
    return L16_176
  end
  L16_176 = NIL
  if A2_162 == L16_176 then
    L16_176 = _UPVALUE1_
    L16_176 = L16_176.RADIUS_SERVER_PRIMARY_SERVER_NIL
    return L16_176
  end
  L16_176 = _UPVALUE2_
  L16_176 = L16_176.ipAddressCheck
  L17_177 = IPV4_ADDRESS_FAMILY
  L18_178 = A2_162
  L16_176 = L16_176(L17_177, L18_178)
  valid = L16_176
  L16_176 = valid
  L17_177 = _UPVALUE0_
  L17_177 = L17_177.SUCCESS
  if L16_176 ~= L17_177 then
    L16_176 = _UPVALUE1_
    L16_176 = L16_176.RADIUS_SERVER_PRIMARY_IPADDRESS_INVALID
    return L16_176
  end
  L16_176 = NIL
  if A3_163 == L16_176 then
    L16_176 = _UPVALUE1_
    L16_176 = L16_176.RADIUS_SERVER_PRIMARY_PORT_NIL
    return L16_176
  end
  L16_176 = tonumber
  L17_177 = A3_163
  L16_176 = L16_176(L17_177)
  L17_177 = PORT_MIN
  if not (L16_176 < L17_177) then
    L17_177 = PORT_MAX
  elseif L16_176 > L17_177 then
    L17_177 = _UPVALUE1_
    L17_177 = L17_177.RADIUS_SERVER_PRIMARY_PORT_INVALID
    return L17_177
  end
  L17_177 = NIL
  if A4_164 == L17_177 then
    L17_177 = _UPVALUE1_
    L17_177 = L17_177.RADIUS_SERVER_PRIMARY_SECRET_NIL
    return L17_177
  end
  L17_177 = string
  L17_177 = L17_177.len
  L18_178 = A4_164
  L17_177 = L17_177(L18_178)
  L18_178 = MAX_SECRET_LEN
  if not (L17_177 > L18_178) then
    L18_178 = MIN_SECRET_LEN
  elseif L17_177 < L18_178 then
    L18_178 = _UPVALUE1_
    L18_178 = L18_178.RADIUS_SERVER_PRIMARY_SECRET_INVALID
    return L18_178
  end
  L18_178 = NIL
  if A5_165 == L18_178 then
    L18_178 = _UPVALUE1_
    L18_178 = L18_178.RADIUS_SERVER_SECONDARY_SERVER_NIL
    return L18_178
  end
  L18_178 = _UPVALUE2_
  L18_178 = L18_178.ipAddressCheck
  L19_179 = IPV4_ADDRESS_FAMILY
  L20_180 = A5_165
  L18_178 = L18_178(L19_179, L20_180)
  valid = L18_178
  L18_178 = valid
  L19_179 = _UPVALUE0_
  L19_179 = L19_179.SUCCESS
  if L18_178 ~= L19_179 then
    L18_178 = _UPVALUE1_
    L18_178 = L18_178.RADIUS_SERVER_SECONDARY_IPADDRESS_INVALID
    return L18_178
  end
  L18_178 = NIL
  if A6_166 == L18_178 then
    L18_178 = _UPVALUE1_
    L18_178 = L18_178.RADIUS_SERVER_SECONDARY_PORT_NIL
    return L18_178
  end
  L18_178 = tonumber
  L19_179 = A6_166
  L18_178 = L18_178(L19_179)
  L19_179 = PORT_MIN
  if not (L18_178 < L19_179) then
    L19_179 = PORT_MAX
  elseif L18_178 > L19_179 then
    L19_179 = _UPVALUE1_
    L19_179 = L19_179.RADIUS_SERVER_SECONDARY_PORT_INVALID
    return L19_179
  end
  L19_179 = NIL
  if A7_167 == L19_179 then
    L19_179 = _UPVALUE1_
    L19_179 = L19_179.RADIUS_SERVER_SECONDARY_SECRET_NIL
    return L19_179
  end
  L19_179 = string
  L19_179 = L19_179.len
  L20_180 = A7_167
  L19_179 = L19_179(L20_180)
  L20_180 = MAX_SECRET_LEN
  if not (L19_179 > L20_180) then
    L20_180 = MIN_SECRET_LEN
  elseif L19_179 < L20_180 then
    L20_180 = _UPVALUE1_
    L20_180 = L20_180.RADIUS_SERVER_SECONDARY_SECRET_INVALID
    return L20_180
  end
  L20_180 = NIL
  if A8_168 == L20_180 then
    L20_180 = _UPVALUE1_
    L20_180 = L20_180.RADIUS_SERVER_TERTIARY_SERVER_NIL
    return L20_180
  end
  L20_180 = _UPVALUE2_
  L20_180 = L20_180.ipAddressCheck
  L21_181 = IPV4_ADDRESS_FAMILY
  L22_182 = A8_168
  L20_180 = L20_180(L21_181, L22_182)
  valid = L20_180
  L20_180 = valid
  L21_181 = _UPVALUE0_
  L21_181 = L21_181.SUCCESS
  if L20_180 ~= L21_181 then
    L20_180 = _UPVALUE1_
    L20_180 = L20_180.RADIUS_SERVER_TERTIARY_SERVER_INVALID
    return L20_180
  end
  L20_180 = NIL
  if A9_169 == L20_180 then
    L20_180 = _UPVALUE1_
    L20_180 = L20_180.RADIUS_SERVER_TERTIARY_PORT_NIL
    return L20_180
  end
  L20_180 = tonumber
  L21_181 = A9_169
  L20_180 = L20_180(L21_181)
  L21_181 = PORT_MIN
  if not (L20_180 < L21_181) then
    L21_181 = PORT_MAX
  elseif L20_180 > L21_181 then
    L21_181 = _UPVALUE1_
    L21_181 = L21_181.RADIUS_SERVER_TERTIARY_PORT_INVALID
    return L21_181
  end
  L21_181 = NIL
  if A10_170 == L21_181 then
    L21_181 = _UPVALUE1_
    L21_181 = L21_181.RADIUS_SERVER_TERTIARY_SECRET_NIL
    return L21_181
  end
  L21_181 = string
  L21_181 = L21_181.len
  L22_182 = A10_170
  L21_181 = L21_181(L22_182)
  L22_182 = MAX_SECRET_LEN
  if not (L21_181 > L22_182) then
    L22_182 = MIN_SECRET_LEN
  elseif L21_181 < L22_182 then
    L22_182 = _UPVALUE1_
    L22_182 = L22_182.RADIUS_SERVER_TERTIARY_SECRET_INVALID
    return L22_182
  end
  L22_182 = {}
  L23_183 = radiusTable
  L24_184 = "."
  L23_183 = L23_183 .. L24_184 .. attribute.profile
  L22_182[L23_183] = A1_161
  L23_183 = radiusTable
  L24_184 = "."
  L23_183 = L23_183 .. L24_184 .. attribute.primaryAccServer
  L22_182[L23_183] = A2_162
  L23_183 = radiusTable
  L24_184 = "."
  L23_183 = L23_183 .. L24_184 .. attribute.primaryAccPort
  L22_182[L23_183] = A3_163
  L23_183 = radiusTable
  L24_184 = "."
  L23_183 = L23_183 .. L24_184 .. attribute.primaryAccSecret
  L22_182[L23_183] = A4_164
  L23_183 = {}
  L24_184 = radiusTable
  L24_184 = L24_184 .. "." .. attribute.secondaryAccServer
  L23_183[L24_184] = A5_165
  L24_184 = radiusTable
  L24_184 = L24_184 .. "." .. attribute.secondaryAccPort
  L23_183[L24_184] = A6_166
  L24_184 = radiusTable
  L24_184 = L24_184 .. "." .. attribute.secondaryAccSecret
  L23_183[L24_184] = A7_167
  L24_184 = {}
  L24_184[radiusTable .. "." .. attribute.tertiaryAccServer] = A8_168
  L24_184[radiusTable .. "." .. attribute.tertiaryAccPort] = A9_169
  L24_184[radiusTable .. "." .. attribute.tertiaryAccSecret] = A10_170
  if db.update(radiusTable, L22_182, FIRST_COOKIE) == NIL then
    return _UPVALUE0_.FAILURE
  end
  _UPVALUE3_.accountingVlanServerRouteTblUpdate(A2_162, FIRST_COOKIE)
  if db.update(radiusTable, L23_183, SECOND_COOKIE) == NIL then
    return _UPVALUE0_.FAILURE
  end
  _UPVALUE3_.accountingVlanServerRouteTblUpdate(A5_165, SECOND_COOKIE)
  if db.update(radiusTable, L24_184, THIRD_COOKIE) == NIL then
    return _UPVALUE0_.FAILURE
  end
  _UPVALUE3_.accountingVlanServerRouteTblUpdate(A8_168, THIRD_COOKIE)
  L11_171 = db.getRow(serviceRouteTable, attribute.serviceInterface, "4")
  if L11_171 ~= nil then
    L11_171[serviceRouteTable .. "." .. attribute.serverIPAddress] = A2_162
    if db.update(serviceRouteTable, L11_171, L11_171[serviceRouteTable .. "." .. ROWID]) == nil then
      return _UPVALUE0_.FAILURE
    end
  end
  L12_172 = db.getRow(serviceRouteTable, attribute.serviceInterface, "5")
  if L12_172 ~= nil then
    L12_172[serviceRouteTable .. "." .. attribute.serverIPAddress] = A5_165
    if db.update(serviceRouteTable, L12_172, L12_172[serviceRouteTable .. "." .. ROWID]) == nil then
      return _UPVALUE0_.FAILURE
    end
  end
  L13_173 = db.getRow(serviceRouteTable, attribute.serviceInterface, "6")
  if L13_173 ~= nil then
    L13_173[serviceRouteTable .. "." .. attribute.serverIPAddress] = A8_168
    if db.update(serviceRouteTable, L13_173, L13_173[serviceRouteTable .. "." .. ROWID]) == nil then
      return _UPVALUE0_.FAILURE
    end
  end
  return _UPVALUE0_.SUCCESS, L15_175
end
function serverCreate(A0_185, A1_186, A2_187, A3_188, A4_189, A5_190, A6_191, A7_192, A8_193, A9_194, A10_195, A11_196, A12_197, A13_198, A14_199, A15_200)
  return _UPVALUE0_.NOT_SUPPORTED
end
function checkRadiusServer()
  local L0_201
  L0_201 = db
  L0_201 = L0_201.getRow
  L0_201 = L0_201(serverCheck, ROWID, FIRST_COOKIE)
  if L0_201 == NIL then
    return _UPVALUE0_.SERVERCHECK_STATUS_GET_FAILED
  end
  return _UPVALUE1_.SUCCESS, L0_201
end
function serverCheckConfig(A0_202, A1_203)
  local L2_204, L3_205
  if A0_202 == "" then
    L2_204 = _UPVALUE0_
    L2_204 = L2_204.SERVERCHECK_AUTH_TYPE_NIL
    return L2_204
  end
  L2_204 = _UPVALUE1_
  if A0_202 ~= L2_204 then
    L2_204 = _UPVALUE2_
    if A0_202 ~= L2_204 then
      L2_204 = _UPVALUE3_
      if A0_202 ~= L2_204 then
        L2_204 = _UPVALUE4_
        if A0_202 ~= L2_204 then
          L2_204 = _UPVALUE5_
          if A0_202 ~= L2_204 then
            L2_204 = _UPVALUE0_
            L2_204 = L2_204.SERVERCHECK_AUTH_TYPE_INVALID
            return L2_204
          end
        end
      end
    end
  end
  if A1_203 == "" then
    L2_204 = _UPVALUE0_
    L2_204 = L2_204.SERVERCHECK_OPERATION_NIL
    return L2_204
  end
  L2_204 = _UPVALUE6_
  if A1_203 ~= L2_204 then
    L2_204 = _UPVALUE0_
    L2_204 = L2_204.SERVERCHECK_OPERATION_INVALID
    return L2_204
  end
  L2_204 = {}
  L3_205 = serverCheck
  L3_205 = L3_205 .. "." .. attribute.checkNow
  L2_204[L3_205] = _UPVALUE7_
  L3_205 = serverCheck
  L3_205 = L3_205 .. "." .. attribute.response
  L2_204[L3_205] = _UPVALUE8_
  L3_205 = serverCheck
  L3_205 = L3_205 .. "." .. attribute.updateFromWeb
  L2_204[L3_205] = _UPVALUE9_
  L3_205 = serverCheck
  L3_205 = L3_205 .. "." .. attribute.primaryServerStatus
  L2_204[L3_205] = _UPVALUE10_
  L3_205 = serverCheck
  L3_205 = L3_205 .. "." .. attribute.secondaryServerStatus
  L2_204[L3_205] = _UPVALUE11_
  L3_205 = serverCheck
  L3_205 = L3_205 .. "." .. attribute.tertiaryServerStatus
  L2_204[L3_205] = _UPVALUE12_
  L3_205 = db
  L3_205 = L3_205.getAttribute
  L3_205 = L3_205(serverCheck, attribute.authType, A0_202, ROWID)
  if L3_205 == NIL then
    return _UPVALUE13_.FAILURE
  end
  if db.update(serverCheck, L2_204, L3_205) == NIL then
    return _UPVALUE13_.FAILURE
  end
  return _UPVALUE13_.SUCCESS, L3_205
end
function serverCheckReset(A0_206)
  local L1_207, L2_208
  if A0_206 == "" then
    L1_207 = _UPVALUE0_
    L1_207 = L1_207.SERVERCHECK_AUTH_TYPE_NIL
    return L1_207
  end
  L1_207 = _UPVALUE1_
  if A0_206 ~= L1_207 then
    L1_207 = _UPVALUE2_
    if A0_206 ~= L1_207 then
      L1_207 = _UPVALUE3_
      if A0_206 ~= L1_207 then
        L1_207 = _UPVALUE4_
        if A0_206 ~= L1_207 then
          L1_207 = _UPVALUE5_
          if A0_206 ~= L1_207 then
            L1_207 = _UPVALUE0_
            L1_207 = L1_207.SERVERCHECK_AUTH_TYPE_INVALID
            return L1_207
          end
        end
      end
    end
  end
  L1_207 = {}
  L2_208 = serverCheck
  L2_208 = L2_208 .. "." .. attribute.checkNow
  L1_207[L2_208] = _UPVALUE6_
  L2_208 = serverCheck
  L2_208 = L2_208 .. "." .. attribute.response
  L1_207[L2_208] = _UPVALUE6_
  L2_208 = serverCheck
  L2_208 = L2_208 .. "." .. attribute.updateFromWeb
  L1_207[L2_208] = _UPVALUE6_
  L2_208 = serverCheck
  L2_208 = L2_208 .. "." .. attribute.primaryServerStatus
  L1_207[L2_208] = _UPVALUE7_
  L2_208 = serverCheck
  L2_208 = L2_208 .. "." .. attribute.secondaryServerStatus
  L1_207[L2_208] = _UPVALUE8_
  L2_208 = serverCheck
  L2_208 = L2_208 .. "." .. attribute.tertiaryServerStatus
  L1_207[L2_208] = _UPVALUE9_
  L2_208 = db
  L2_208 = L2_208.getAttribute
  L2_208 = L2_208(serverCheck, attribute.authType, A0_206, ROWID)
  if L2_208 == NIL then
    return _UPVALUE10_.FAILURE
  end
  if db.update(serverCheck, L1_207, L2_208) == NIL then
    return _UPVALUE10_.FAILURE
  end
  return _UPVALUE10_.SUCCESS, L2_208
end
function getCheckNow(A0_209)
  local L1_210
  L1_210 = db
  L1_210 = L1_210.getAttribute
  L1_210 = L1_210("serverCheck", "authType", A0_209, "checkNow")
  if L1_210 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_210
end
function authenticateVlanServerUpdate(A0_211, A1_212)
  local L2_213, L3_214, L4_215, L5_216, L6_217, L7_218, L8_219, L9_220, L10_221, L11_222, L12_223, L13_224, L14_225, L15_226, L16_227
  L6_217 = attribute
  L6_217 = L6_217.logicalIface
  L7_218 = " LIKE 'LAN%' AND AddressFamily = 2"
  L6_217 = L6_217 .. L7_218
  L7_218 = db
  L7_218 = L7_218.getRowsWhere
  L8_219 = ifStaticTbl
  L7_218 = L7_218(L8_219, L9_220)
  if L7_218 == nil then
    L8_219 = _UPVALUE0_
    L8_219 = L8_219.FAILURE
    return L8_219
  end
  L8_219 = #L7_218
  if L8_219 ~= 0 then
    L8_219 = #L7_218
  elseif L8_219 == "" then
    L8_219 = _UPVALUE0_
    L8_219 = L8_219.FAILURE
    return L8_219
  end
  L8_219 = nil
  for L12_223, L13_224 in L9_220(L10_221) do
    L8_219 = 0
    L14_225 = ifStaticTbl
    L15_226 = "."
    L16_227 = attribute
    L16_227 = L16_227.staticIp
    L14_225 = L14_225 .. L15_226 .. L16_227
    L2_213 = L13_224[L14_225]
    L14_225 = ifStaticTbl
    L15_226 = "."
    L16_227 = attribute
    L16_227 = L16_227.netmask
    L14_225 = L14_225 .. L15_226 .. L16_227
    L3_214 = L13_224[L14_225]
    L14_225 = _UPVALUE1_
    L14_225 = L14_225.ipv4SingleMaskCheck
    L15_226 = L2_213
    L16_227 = A0_211
    L14_225 = L14_225(L15_226, L16_227, L3_214)
    L4_215 = L14_225
    L14_225 = _UPVALUE0_
    L14_225 = L14_225.SUCCESS
    if L4_215 == L14_225 then
      L14_225 = ifStaticTbl
      L15_226 = "."
      L16_227 = attribute
      L16_227 = L16_227.logicalIface
      L14_225 = L14_225 .. L15_226 .. L16_227
      L14_225 = L13_224[L14_225]
      L15_226 = _UPVALUE2_
      if L14_225 ~= L15_226 then
        L14_225, L15_226, L16_227 = nil, nil, nil
        L14_225 = L13_224[ifStaticTbl .. "." .. attribute.logicalIface]
        if L14_225 ~= _UPVALUE0_.NIL then
          L16_227 = _UPVALUE1_.split(L14_225, _UPVALUE2_)
          L15_226 = L16_227[2]
          L5_216 = L15_226
        end
      else
        L5_216 = "1"
      end
      L8_219 = 1
      break
    end
  end
  L12_223 = attribute
  L12_223 = L12_223.serverIp
  L9_220[L10_221] = A0_211
  if L8_219 == 1 then
    L12_223 = attribute
    L12_223 = L12_223.routeIp
    L9_220[L10_221] = L2_213
    L12_223 = attribute
    L12_223 = L12_223.routeIface
    L12_223 = L5_216
    L9_220[L10_221] = L11_222
  else
    L12_223 = attribute
    L12_223 = L12_223.routeIp
    L9_220[L10_221] = L11_222
    L12_223 = attribute
    L12_223 = L12_223.routeIface
    L9_220[L10_221] = L11_222
  end
  L12_223 = L9_220
  L13_224 = A1_212
  L10_221(L11_222, L12_223, L13_224)
  return L10_221
end
function authenticatingVlanServerDelete(A0_228)
  local L1_229, L2_230, L3_231, L4_232, L5_233, L6_234, L7_235
  L1_229 = db
  L1_229 = L1_229.getRowsWhere
  L5_233 = _UPVALUE0_
  L6_234 = A0_228
  L7_235 = "'"
  L1_229 = L1_229(L2_230, L3_231)
  for L5_233, L6_234 in L2_230(L3_231) do
    L7_235 = {}
    L7_235 = L1_229[L5_233]
    L7_235[radAuthRouteTable .. "." .. attribute.routeIp] = _UPVALUE1_
    L7_235[radAuthRouteTable .. "." .. attribute.routeIface] = _UPVALUE2_
    if db.update(radAuthRouteTable, L7_235, L7_235[radAuthRouteTable .. "." .. ROWID]) == nil then
      return _UPVALUE3_.FAILURE
    end
  end
  return L2_230
end
function authenticationTblUpdate(A0_236, A1_237, A2_238)
  local L3_239, L4_240, L5_241, L6_242, L7_243, L8_244, L9_245, L10_246, L11_247, L12_248, L13_249
  L5_241 = db
  L5_241 = L5_241.getTable
  L5_241 = L5_241(L6_242, L7_243)
  for L9_245, L10_246 in L6_242(L7_243) do
    L3_239 = 0
    L11_247 = {}
    L12_248 = _UPVALUE0_
    L12_248 = L12_248.ipv4SingleMaskCheck
    L13_249 = A0_236
    L12_248 = L12_248(L13_249, L10_246[attribute.authserver], A1_237)
    L4_240 = L12_248
    L12_248 = _UPVALUE1_
    L12_248 = L12_248.SUCCESS
    if L4_240 == L12_248 then
      L3_239 = 1
    end
    if L3_239 == 1 then
      L12_248 = radAuthRouteTable
      L13_249 = "."
      L12_248 = L12_248 .. L13_249 .. attribute.routeIp
      L11_247[L12_248] = A0_236
      L12_248 = radAuthRouteTable
      L13_249 = "."
      L12_248 = L12_248 .. L13_249 .. attribute.routeIface
      L13_249 = _UPVALUE2_
      L13_249 = L13_249 .. A2_238
      L11_247[L12_248] = L13_249
      L12_248 = db
      L12_248 = L12_248.update
      L13_249 = radAuthRouteTable
      L12_248(L13_249, L11_247, L10_246[ROWID])
    else
      L12_248 = attribute
      L12_248 = L12_248.serverIp
      L13_249 = " = '"
      L12_248 = L12_248 .. L13_249 .. L10_246[attribute.authserver] .. "' AND " .. attribute.routeIface .. " = '" .. _UPVALUE2_ .. A2_238 .. "'"
      L13_249 = db
      L13_249 = L13_249.getRowsWhere
      L13_249 = L13_249(radAuthRouteTable, L12_248)
      if L13_249 then
        for _FORV_17_, _FORV_18_ in pairs(L13_249) do
          L11_247[radAuthRouteTable .. "." .. attribute.routeIp] = _UPVALUE3_
          L11_247[radAuthRouteTable .. "." .. attribute.routeIface] = _UPVALUE4_
          db.update(radAuthRouteTable, L11_247, _FORV_18_[radAuthRouteTable .. "." .. ROWID])
        end
      end
    end
  end
  return L6_242
end
