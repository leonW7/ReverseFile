local L0_0
L0_0 = module
L0_0("com.teamf1.core.user-management.users", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/userdb_validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/userdb_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
usersTable = "Users"
groupsTable = "UserGroups"
loginPolicyTable = "GroupAccessControl"
sslvpnActiveUsersTable = "SSLVPNActiveUsers"
loginSessionTable = "loginSession"
captiveportalSessionTable = "CaptivePortalSession"
userDashboardCustomizationTable = "userDashboardCustomization"
OpenvpnSessionTable = "OpenvpnSession"
attribute = {}
attribute.name = "UserName"
attribute.firstName = "FirstName"
attribute.lastName = "LastName"
attribute.groupName = "GroupName"
attribute.password = "Password"
attribute.idleTimeout = "GroupTimeOut"
attribute.userTimeout = "UserTimeOut"
attribute.loginStatus = "loginStatus"
attribute.groupId = "GroupId"
attribute.login = "DenyLogin"
attribute.wanLogin = "DenyLoginFromWan"
attribute.userId = "UserId"
attribute.multiLogin = "multiLogSup"
attribute.isPwdChange = "enableChangePasswd"
attribute.capabilities = "Capabilities"
attribute.username = "username"
attribute.trafficOverview = "TrafficOverview"
attribute.discoveredAPs = "DiscoveredAPs"
attribute.optionPorts = "OptionPorts"
attribute.bandwidthUsage = "BandwidthUsage"
attribute.wlanStatistics = "WLANStatistics"
attribute.vpns = "VPNs"
attribute.cpuUtilization = "CPUUtilization"
attribute.memoryUtilization = "MemoryUtilization"
attribute.activeInfo = "ActiveInfo"
attribute.loginState = "loginState"
attribute.cookie = "Cookie"
attribute.defaultUser = "DefaultUser"
ROWID = "_ROWID_"
FALSE = false
NIL = nil
DISABLED_LAN_DISABLED_WAN = "Disabled (LAN) Disabled (Option)"
ENABLED_LAN_ENABLED_WAN = "Enabled (LAN) Enabled (Option)"
ENABLED_LAN_DISABLED_WAN = "Enabled (LAN) Disabled (Option)"
if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-1000" or UNIT_NAME == "DSR-1000N" then
elseif UNIT_NAME == "DSR-500AC" or UNIT_NAME == "DSR-500" or UNIT_NAME == "DSR-500N" then
elseif UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-250N" then
elseif UNIT_NAME == "DSR-150" or UNIT_NAME == "DSR-150N" then
end
function nameGet()
  local L0_1, L1_2, L2_3
  L0_1 = getFirstCookie
  L1_2 = ROWID
  L2_3 = usersTable
  L1_2 = L0_1(L1_2, L2_3)
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.SUCCESS
  if L0_1 ~= L2_3 then
    L2_3 = _UPVALUE0_
    L2_3 = L2_3.NOT_EXIST
    return L2_3
  end
  L2_3 = db
  L2_3 = L2_3.getAttribute
  L2_3 = L2_3(usersTable, ROWID, L1_2, attribute.name)
  if L2_3 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_2, L2_3
end
function nameGetNext(A0_4)
  local L1_5, L2_6, L3_7, L4_8, L5_9
  L1_5 = NIL
  if A0_4 == L1_5 then
    L1_5 = _UPVALUE0_
    L1_5 = L1_5.INVALID_ARGUMENT
    return L1_5
  end
  L1_5 = cookieValidate
  L2_6 = ROWID
  L3_7 = A0_4
  L4_8 = usersTable
  L2_6 = L1_5(L2_6, L3_7, L4_8)
  L3_7 = _UPVALUE0_
  L3_7 = L3_7.SUCCESS
  if L1_5 ~= L3_7 then
    return L1_5
  end
  L3_7 = getNextValidCookie
  L4_8 = ROWID
  L5_9 = A0_4
  L4_8 = L3_7(L4_8, L5_9, usersTable)
  L5_9 = _UPVALUE0_
  L5_9 = L5_9.SUCCESS
  if L3_7 ~= L5_9 then
    return L3_7
  end
  L5_9 = db
  L5_9 = L5_9.getAttribute
  L5_9 = L5_9(usersTable, ROWID, L4_8, attribute.name)
  if L5_9 == NIL then
    return _UPVALUE0_.FAILURE, A0_4
  end
  return _UPVALUE0_.SUCCESS, L4_8, L5_9
end
function nameSet(A0_10, A1_11)
  if A0_10 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if cookieValidate(ROWID, A0_10, usersTable) ~= _UPVALUE0_.SUCCESS then
    return cookieValidate(ROWID, A0_10, usersTable)
  end
  if A1_11 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_11) > _UPVALUE1_ or string.len(A1_11) < _UPVALUE2_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(usersTable, ROWID, A0_10, attribute.name, A1_11) == NIL then
    return _UPVALUE0_.FAILURE, A0_10
  end
  return _UPVALUE0_.SUCCESS, A0_10
end
function nameDelete(A0_12, A1_13)
  if A0_12 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if cookieValidate(ROWID, A0_12, usersTable) ~= _UPVALUE0_.SUCCESS then
    return cookieValidate(ROWID, A0_12, usersTable)
  end
  if A1_13 == _UPVALUE1_ or A1_13 == _UPVALUE2_ then
    return _UPVALUE0_.DEFAULT_USER_DELETE_ERROR
  end
  if db.deleteRow(usersTable, ROWID, A0_12) == NIL then
    return _UPVALUE0_.FAILURE, A0_12
  end
  return _UPVALUE0_.SUCCESS, A0_12
end
function firstNameGet()
  local L0_14, L1_15, L2_16
  L0_14 = getFirstCookie
  L1_15 = ROWID
  L2_16 = usersTable
  L1_15 = L0_14(L1_15, L2_16)
  L2_16 = _UPVALUE0_
  L2_16 = L2_16.SUCCESS
  if L0_14 ~= L2_16 then
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.NOT_EXIST
    return L2_16
  end
  L2_16 = db
  L2_16 = L2_16.getAttribute
  L2_16 = L2_16(usersTable, ROWID, L1_15, attribute.firstName)
  if L2_16 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_15, L2_16
end
function firstNameGetNext(A0_17)
  local L1_18, L2_19, L3_20, L4_21, L5_22
  L1_18 = NIL
  if A0_17 == L1_18 then
    L1_18 = _UPVALUE0_
    L1_18 = L1_18.INVALID_ARGUMENT
    return L1_18
  end
  L1_18 = cookieValidate
  L2_19 = ROWID
  L3_20 = A0_17
  L4_21 = usersTable
  L2_19 = L1_18(L2_19, L3_20, L4_21)
  L3_20 = _UPVALUE0_
  L3_20 = L3_20.SUCCESS
  if L1_18 ~= L3_20 then
    return L1_18
  end
  L3_20 = getNextValidCookie
  L4_21 = ROWID
  L5_22 = A0_17
  L4_21 = L3_20(L4_21, L5_22, usersTable)
  L5_22 = _UPVALUE0_
  L5_22 = L5_22.SUCCESS
  if L3_20 ~= L5_22 then
    return L3_20
  end
  L5_22 = db
  L5_22 = L5_22.getAttribute
  L5_22 = L5_22(usersTable, ROWID, L4_21, attribute.firstName)
  if L5_22 == NIL then
    return _UPVALUE0_.FAILURE, A0_17
  end
  return _UPVALUE0_.SUCCESS, L4_21, L5_22
end
function firstNameSet(A0_23, A1_24)
  if A0_23 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if cookieValidate(ROWID, A0_23, usersTable) ~= _UPVALUE0_.SUCCESS then
    return cookieValidate(ROWID, A0_23, usersTable)
  end
  if A1_24 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_24) > _UPVALUE1_ or string.len(A1_24) < _UPVALUE2_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(usersTable, ROWID, A0_23, attribute.firstName, A1_24) == NIL then
    return _UPVALUE0_.FAILURE, A0_23
  end
  return _UPVALUE0_.SUCCESS, A0_23
end
function lastNameGet()
  local L0_25, L1_26, L2_27
  L0_25 = getFirstCookie
  L1_26 = ROWID
  L2_27 = usersTable
  L1_26 = L0_25(L1_26, L2_27)
  L2_27 = _UPVALUE0_
  L2_27 = L2_27.SUCCESS
  if L0_25 ~= L2_27 then
    L2_27 = _UPVALUE0_
    L2_27 = L2_27.NOT_EXIST
    return L2_27
  end
  L2_27 = db
  L2_27 = L2_27.getAttribute
  L2_27 = L2_27(usersTable, ROWID, L1_26, attribute.lastName)
  if L2_27 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_26, L2_27
end
function lastNameGetNext(A0_28)
  local L1_29, L2_30, L3_31, L4_32, L5_33
  L1_29 = NIL
  if A0_28 == L1_29 then
    L1_29 = _UPVALUE0_
    L1_29 = L1_29.INVALID_ARGUMENT
    return L1_29
  end
  L1_29 = cookieValidate
  L2_30 = ROWID
  L3_31 = A0_28
  L4_32 = usersTable
  L2_30 = L1_29(L2_30, L3_31, L4_32)
  L3_31 = _UPVALUE0_
  L3_31 = L3_31.SUCCESS
  if L1_29 ~= L3_31 then
    return L1_29
  end
  L3_31 = getNextValidCookie
  L4_32 = ROWID
  L5_33 = A0_28
  L4_32 = L3_31(L4_32, L5_33, usersTable)
  L5_33 = _UPVALUE0_
  L5_33 = L5_33.SUCCESS
  if L3_31 ~= L5_33 then
    return L3_31
  end
  L5_33 = db
  L5_33 = L5_33.getAttribute
  L5_33 = L5_33(usersTable, ROWID, L4_32, attribute.lastName)
  if L5_33 == NIL then
    return _UPVALUE0_.FAILURE, L4_32
  end
  return _UPVALUE0_.SUCCESS, L4_32, L5_33
end
function lastNameSet(A0_34, A1_35)
  if A0_34 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if cookieValidate(ROWID, A0_34, usersTable) ~= _UPVALUE0_.SUCCESS then
    return cookieValidate(ROWID, A0_34, usersTable)
  end
  if A1_35 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_35) > _UPVALUE1_ or string.len(A1_35) < _UPVALUE2_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(usersTable, ROWID, A0_34, attribute.lastName, A1_35) == NIL then
    return _UPVALUE0_.FAILURE, A0_34
  end
  return _UPVALUE0_.SUCCESS, A0_34
end
function groupNameGet()
  local L0_36, L1_37, L2_38, L3_39
  L0_36 = getFirstCookie
  L1_37 = ROWID
  L2_38 = usersTable
  L1_37 = L0_36(L1_37, L2_38)
  L2_38 = _UPVALUE0_
  L2_38 = L2_38.SUCCESS
  if L0_36 ~= L2_38 then
    L2_38 = _UPVALUE0_
    L2_38 = L2_38.NOT_EXIST
    return L2_38
  end
  L2_38 = db
  L2_38 = L2_38.getAttribute
  L3_39 = usersTable
  L2_38 = L2_38(L3_39, ROWID, L1_37, attribute.groupId)
  L3_39 = NIL
  if L2_38 == L3_39 then
    L3_39 = _UPVALUE0_
    L3_39 = L3_39.FAILURE
    return L3_39
  end
  L3_39 = db
  L3_39 = L3_39.getAttribute
  L3_39 = L3_39(groupsTable, attribute.groupId, L2_38, attribute.groupName)
  if L3_39 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_37, L3_39
end
function groupNameGetNext(A0_40)
  local L1_41, L2_42, L3_43, L4_44, L5_45, L6_46
  L1_41 = NIL
  if A0_40 == L1_41 then
    L1_41 = _UPVALUE0_
    L1_41 = L1_41.INVALID_ARGUMENT
    return L1_41
  end
  L1_41 = cookieValidate
  L2_42 = ROWID
  L3_43 = A0_40
  L4_44 = usersTable
  L2_42 = L1_41(L2_42, L3_43, L4_44)
  L3_43 = _UPVALUE0_
  L3_43 = L3_43.SUCCESS
  if L1_41 ~= L3_43 then
    return L1_41
  end
  L3_43 = getNextValidCookie
  L4_44 = ROWID
  L5_45 = A0_40
  L6_46 = usersTable
  L4_44 = L3_43(L4_44, L5_45, L6_46)
  L5_45 = _UPVALUE0_
  L5_45 = L5_45.SUCCESS
  if L3_43 ~= L5_45 then
    return L3_43
  end
  L5_45 = db
  L5_45 = L5_45.getAttribute
  L6_46 = usersTable
  L5_45 = L5_45(L6_46, ROWID, L4_44, attribute.groupId)
  L6_46 = NIL
  if L5_45 == L6_46 then
    L6_46 = _UPVALUE0_
    L6_46 = L6_46.FAILURE
    return L6_46
  end
  L6_46 = db
  L6_46 = L6_46.getAttribute
  L6_46 = L6_46(groupsTable, attribute.groupId, L5_45, attribute.groupName)
  if L6_46 == NIL then
    return _UPVALUE0_.FAILURE, A0_40
  end
  return _UPVALUE0_.SUCCESS, L4_44, L6_46
end
function groupNameSet(A0_47, A1_48)
  return _UPVALUE0_.NOT_SUPPORTED
end
function passwordGet()
  local L0_49
  L0_49 = db
  L0_49 = L0_49.getAttribute
  L0_49 = L0_49(usersTable, ROWID, cookie, attribute.password)
  if L0_49 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, cookie, L0_49
end
function passwordGetNext(A0_50)
  local L1_51, L2_52, L3_53, L4_54, L5_55
  L1_51 = NIL
  if A0_50 == L1_51 then
    L1_51 = _UPVALUE0_
    L1_51 = L1_51.INVALID_ARGUMENT
    return L1_51
  end
  L1_51 = cookieValidate
  L2_52 = ROWID
  L3_53 = A0_50
  L4_54 = usersTable
  L2_52 = L1_51(L2_52, L3_53, L4_54)
  L3_53 = _UPVALUE0_
  L3_53 = L3_53.SUCCESS
  if L1_51 ~= L3_53 then
    return L1_51
  end
  L3_53 = getNextValidCookie
  L4_54 = ROWID
  L5_55 = A0_50
  L4_54 = L3_53(L4_54, L5_55, usersTable)
  L5_55 = _UPVALUE0_
  L5_55 = L5_55.SUCCESS
  if L3_53 ~= L5_55 then
    return L3_53
  end
  L5_55 = db
  L5_55 = L5_55.getAttribute
  L5_55 = L5_55(usersTable, ROWID, L4_54, attribute.password)
  if L5_55 == NIL then
    return _UPVALUE0_.FAILURE, A0_50
  end
  return _UPVALUE0_.SUCCESS, L4_54, L5_55
end
function passwordSet(A0_56, A1_57)
  if A0_56 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if cookieValidate(ROWID, A0_56, usersTable) ~= _UPVALUE0_.SUCCESS then
    return cookieValidate(ROWID, A0_56, usersTable)
  end
  if A1_57 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_57) > _UPVALUE1_ or string.len(A1_57) < _UPVALUE2_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(usersTable, ROWID, A0_56, attribute.password, A1_57) == NIL then
    return _UPVALUE0_.FAILURE, A0_56
  end
  return _UPVALUE0_.SUCCESS, A0_56
end
function idleTimeoutGet()
  local L0_58, L1_59, L2_60, L3_61
  L0_58 = getFirstCookie
  L1_59 = ROWID
  L2_60 = usersTable
  L1_59 = L0_58(L1_59, L2_60)
  L2_60 = _UPVALUE0_
  L2_60 = L2_60.SUCCESS
  if L0_58 ~= L2_60 then
    L2_60 = _UPVALUE0_
    L2_60 = L2_60.NOT_EXIST
    return L2_60
  end
  L2_60 = db
  L2_60 = L2_60.getAttribute
  L3_61 = usersTable
  L2_60 = L2_60(L3_61, ROWID, L1_59, attribute.groupId)
  L3_61 = NIL
  if L2_60 == L3_61 then
    L3_61 = _UPVALUE0_
    L3_61 = L3_61.FAILURE
    return L3_61
  end
  L3_61 = db
  L3_61 = L3_61.getAttribute
  L3_61 = L3_61(groupsTable, attribute.groupId, L2_60, attribute.idleTimeout)
  if L3_61 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_59, L3_61
end
function idleTimeoutGetNext(A0_62)
  local L1_63, L2_64, L3_65, L4_66, L5_67, L6_68
  L1_63 = NIL
  if A0_62 == L1_63 then
    L1_63 = _UPVALUE0_
    L1_63 = L1_63.INVALID_ARGUMENT
    return L1_63
  end
  L1_63 = cookieValidate
  L2_64 = ROWID
  L3_65 = A0_62
  L4_66 = usersTable
  L2_64 = L1_63(L2_64, L3_65, L4_66)
  L3_65 = _UPVALUE0_
  L3_65 = L3_65.SUCCESS
  if L1_63 ~= L3_65 then
    return L1_63
  end
  L3_65 = getNextValidCookie
  L4_66 = ROWID
  L5_67 = A0_62
  L6_68 = usersTable
  L4_66 = L3_65(L4_66, L5_67, L6_68)
  L5_67 = _UPVALUE0_
  L5_67 = L5_67.SUCCESS
  if L3_65 ~= L5_67 then
    return L3_65
  end
  L5_67 = db
  L5_67 = L5_67.getAttribute
  L6_68 = usersTable
  L5_67 = L5_67(L6_68, ROWID, L4_66, attribute.groupId)
  L6_68 = NIL
  if L5_67 == L6_68 then
    L6_68 = _UPVALUE0_
    L6_68 = L6_68.FAILURE
    return L6_68
  end
  L6_68 = db
  L6_68 = L6_68.getAttribute
  L6_68 = L6_68(groupsTable, attribute.groupId, L5_67, attribute.idleTimeout)
  if L6_68 == NIL then
    return _UPVALUE0_.FAILURE, A0_62
  end
  return _UPVALUE0_.SUCCESS, L4_66, L6_68
end
function idleTimeoutSet(A0_69, A1_70)
  return _UPVALUE0_.NOT_SUPPORTED
end
function loginStatusGet()
  local L0_71, L1_72, L2_73, L3_74
  L0_71 = getFirstCookie
  L1_72 = ROWID
  L2_73 = usersTable
  L1_72 = L0_71(L1_72, L2_73)
  L2_73 = _UPVALUE0_
  L2_73 = L2_73.SUCCESS
  if L0_71 ~= L2_73 then
    L2_73 = _UPVALUE0_
    L2_73 = L2_73.NOT_EXIST
    return L2_73
  end
  L2_73 = db
  L2_73 = L2_73.getAttribute
  L3_74 = usersTable
  L2_73 = L2_73(L3_74, ROWID, L1_72, attribute.groupId)
  L3_74 = NIL
  if L2_73 == L3_74 then
    L3_74 = _UPVALUE0_
    L3_74 = L3_74.FAILURE
    return L3_74
  end
  L3_74 = db
  L3_74 = L3_74.getAttribute
  L3_74 = L3_74(loginPolicyTable, attribute.groupId, L2_73, attribute.login)
  if L3_74 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_72, L3_74
end
function loginStatusGetNext(A0_75)
  local L1_76, L2_77, L3_78, L4_79, L5_80, L6_81
  L1_76 = NIL
  if A0_75 == L1_76 then
    L1_76 = _UPVALUE0_
    L1_76 = L1_76.INVALID_ARGUMENT
    return L1_76
  end
  L1_76 = cookieValidate
  L2_77 = ROWID
  L3_78 = A0_75
  L4_79 = usersTable
  L2_77 = L1_76(L2_77, L3_78, L4_79)
  L3_78 = _UPVALUE0_
  L3_78 = L3_78.SUCCESS
  if L1_76 ~= L3_78 then
    return L1_76
  end
  L3_78 = getNextValidCookie
  L4_79 = ROWID
  L5_80 = A0_75
  L6_81 = usersTable
  L4_79 = L3_78(L4_79, L5_80, L6_81)
  L5_80 = _UPVALUE0_
  L5_80 = L5_80.SUCCESS
  if L3_78 ~= L5_80 then
    return L3_78
  end
  L5_80 = db
  L5_80 = L5_80.getAttribute
  L6_81 = usersTable
  L5_80 = L5_80(L6_81, ROWID, L4_79, attribute.groupId)
  L6_81 = NIL
  if L5_80 == L6_81 then
    L6_81 = _UPVALUE0_
    L6_81 = L6_81.FAILURE
    return L6_81
  end
  L6_81 = db
  L6_81 = L6_81.getAttribute
  L6_81 = L6_81(loginPolicyTable, attribute.groupId, L5_80, attribute.login)
  if L6_81 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L4_79, L6_81
end
function loginStatusSet(A0_82, A1_83)
  return _UPVALUE0_.NOT_SUPPORTED
end
function userGet()
  local L0_84, L1_85, L2_86
  L0_84 = getFirstCookie
  L1_85 = ROWID
  L2_86 = usersTable
  L1_85 = L0_84(L1_85, L2_86)
  L2_86 = _UPVALUE0_
  L2_86 = L2_86.SUCCESS
  if L0_84 ~= L2_86 then
    L2_86 = _UPVALUE0_
    L2_86 = L2_86.NOT_EXIST
    return L2_86
  end
  L2_86 = db
  L2_86 = L2_86.getAttribute
  L2_86 = L2_86(usersTable, ROWID, L1_85, attribute.groupId)
  if L2_86 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getRow(usersTable, ROWID, L1_85) == NIL then
    return _UPVALUE0_.FAILURE
  end
  if db.getRow(groupsTable, attribute.groupId, L2_86) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_85, db.getRow(usersTable, ROWID, L1_85)[usersTable .. "." .. attribute.name], db.getRow(usersTable, ROWID, L1_85)[usersTable .. "." .. attribute.firstName], db.getRow(usersTable, ROWID, L1_85)[usersTable .. "." .. attribute.lastName], db.getRow(groupsTable, attribute.groupId, L2_86)[groupsTable .. "." .. attribute.groupName], db.getRow(usersTable, ROWID, L1_85)[usersTable .. "." .. attribute.password], db.getRow(groupsTable, attribute.groupId, L2_86)[groupsTable .. "." .. attribute.idleTimeout]
end
function userGetNext(A0_87)
  local L1_88, L2_89, L3_90, L4_91, L5_92
  L1_88 = NIL
  if A0_87 == L1_88 then
    L1_88 = _UPVALUE0_
    L1_88 = L1_88.INVALID_ARGUMENT
    return L1_88
  end
  L1_88 = cookieValidate
  L2_89 = ROWID
  L3_90 = A0_87
  L4_91 = usersTable
  L2_89 = L1_88(L2_89, L3_90, L4_91)
  L3_90 = _UPVALUE0_
  L3_90 = L3_90.SUCCESS
  if L1_88 ~= L3_90 then
    return L1_88
  end
  L3_90 = getNextValidCookie
  L4_91 = ROWID
  L5_92 = A0_87
  L4_91 = L3_90(L4_91, L5_92, usersTable)
  L5_92 = _UPVALUE0_
  L5_92 = L5_92.SUCCESS
  if L3_90 ~= L5_92 then
    return L3_90
  end
  L5_92 = db
  L5_92 = L5_92.getAttribute
  L5_92 = L5_92(usersTable, ROWID, L4_91, attribute.groupId)
  if L5_92 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getRow(usersTable, ROWID, L4_91) == NIL then
    return _UPVALUE0_.FAILURE
  end
  if db.getRow(groupsTable, attribute.groupId, L5_92) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L4_91, db.getRow(usersTable, ROWID, L4_91)[usersTable .. "." .. attribute.name], db.getRow(usersTable, ROWID, L4_91)[usersTable .. "." .. attribute.firstName], db.getRow(usersTable, ROWID, L4_91)[usersTable .. "." .. attribute.lastName], db.getRow(groupsTable, attribute.groupId, L5_92)[groupsTable .. "." .. attribute.groupName], db.getRow(usersTable, ROWID, L4_91)[usersTable .. "." .. attribute.password], db.getRow(groupsTable, attribute.groupId, L5_92)[groupsTable .. "." .. attribute.idleTimeout]
end
function userSet(A0_93, A1_94, A2_95, A3_96, A4_97, A5_98, A6_99, A7_100, A8_101, A9_102, A10_103, A11_104)
  local L12_105, L13_106, L14_107, L15_108, L16_109, L17_110, L18_111, L19_112, L20_113, L21_114, L22_115, L23_116, L24_117, L25_118, L26_119, L27_120, L28_121, L29_122, L30_123
  L13_106 = NIL
  if A0_93 == L13_106 then
    L13_106 = _UPVALUE0_
    L13_106 = L13_106.INVALID_ARGUMENT
    return L13_106
  end
  L13_106 = cookieValidate
  L14_107 = attribute
  L14_107 = L14_107.userId
  L15_108 = A0_93
  L16_109 = usersTable
  L14_107 = L13_106(L14_107, L15_108, L16_109)
  L15_108 = _UPVALUE0_
  L15_108 = L15_108.SUCCESS
  if L13_106 ~= L15_108 then
    return L13_106
  end
  L15_108 = NIL
  if A1_94 == L15_108 or A1_94 == "" then
    L15_108 = _UPVALUE1_
    L15_108 = L15_108.USERS_USERNAME_NIL
    return L15_108
  end
  L15_108 = string
  L15_108 = L15_108.len
  L16_109 = A1_94
  L15_108 = L15_108(L16_109)
  L16_109 = _UPVALUE2_
  if not (L15_108 > L16_109) then
    L16_109 = _UPVALUE3_
  elseif L15_108 < L16_109 then
    L16_109 = _UPVALUE1_
    L16_109 = L16_109.USERS_USERNAME_INVALID
    return L16_109
  end
  L16_109 = NIL
  if A2_95 == L16_109 or A2_95 == "" then
    L16_109 = _UPVALUE1_
    L16_109 = L16_109.USERS_FIRSTNAME_NIL
    return L16_109
  end
  L16_109 = string
  L16_109 = L16_109.len
  L17_110 = A2_95
  L16_109 = L16_109(L17_110)
  L17_110 = _UPVALUE2_
  if not (L16_109 > L17_110) then
    L17_110 = _UPVALUE3_
  elseif L16_109 < L17_110 then
    L17_110 = _UPVALUE1_
    L17_110 = L17_110.USERS_FIRSTNAME_INVALID
    return L17_110
  end
  L17_110 = NIL
  if A3_96 == L17_110 or A3_96 == "" then
    L17_110 = _UPVALUE1_
    L17_110 = L17_110.USERS_LASTNAME_NIL
    return L17_110
  end
  L17_110 = string
  L17_110 = L17_110.len
  L18_111 = A3_96
  L17_110 = L17_110(L18_111)
  L18_111 = _UPVALUE2_
  if not (L17_110 > L18_111) then
    L18_111 = _UPVALUE3_
  elseif L17_110 < L18_111 then
    L18_111 = _UPVALUE1_
    L18_111 = L18_111.USERS_LASTNAME_INVALID
    return L18_111
  end
  L18_111 = NIL
  if A4_97 == L18_111 or A4_97 == "" then
    L18_111 = _UPVALUE1_
    L18_111 = L18_111.USERS_GROUPNAME_NIL
    return L18_111
  end
  L18_111 = string
  L18_111 = L18_111.len
  L19_112 = A4_97
  L18_111 = L18_111(L19_112)
  L19_112 = _UPVALUE2_
  if not (L18_111 > L19_112) then
    L19_112 = _UPVALUE3_
  elseif L18_111 < L19_112 then
    L19_112 = _UPVALUE1_
    L19_112 = L19_112.USERS_GROUPNAME_INVALID
    return L19_112
  end
  L19_112 = NIL
  if A9_102 ~= L19_112 then
    L19_112 = _UPVALUE4_
    if A9_102 == L19_112 then
      L19_112 = NIL
      if A5_98 ~= L19_112 and A5_98 ~= "" then
        L19_112 = NIL
      elseif A10_103 == L19_112 or A10_103 == "" then
        L19_112 = _UPVALUE1_
        L19_112 = L19_112.USERS_PASSWORD_NIL
        return L19_112
      end
      L19_112 = NIL
      if A11_104 == L19_112 or A11_104 == "" then
        L19_112 = _UPVALUE1_
        L19_112 = L19_112.USERS_CUR_LOGGED_ADMIN_PASSWORD_NIL
        return L19_112
      end
      L19_112 = cgilua
      L19_112 = L19_112.cookies
      L19_112 = L19_112.get
      L20_113 = "TeamF1Login"
      L19_112 = L19_112(L20_113)
      L20_113 = _UPVALUE0_
      L20_113 = L20_113.NIL
      if L19_112 ~= L20_113 then
        L20_113 = db
        L20_113 = L20_113.escape
        L21_114 = L19_112
        L20_113 = L20_113(L21_114)
        L19_112 = L20_113
      end
      L20_113 = "ipaddr = '"
      L21_114 = SAPI
      L21_114 = L21_114.Request
      L21_114 = L21_114.servervariable
      L22_115 = "REMOTE_ADDR"
      L21_114 = L21_114(L22_115)
      L22_115 = "' AND Cookie = '"
      L23_116 = L19_112
      L20_113 = L20_113 .. L21_114 .. L22_115 .. L23_116 .. L24_117
      L21_114 = db
      L21_114 = L21_114.getAttributeWhere
      L22_115 = loginSessionTable
      L23_116 = L20_113
      L21_114 = L21_114(L22_115, L23_116, L24_117)
      L22_115 = _UPVALUE0_
      L22_115 = L22_115.NIL
      if L21_114 == L22_115 then
        L22_115 = _UPVALUE1_
        L22_115 = L22_115.USERDB_USER_SESSION_NOT_FOUND
        return L22_115
      end
      L22_115 = db
      L22_115 = L22_115.getAttribute
      L23_116 = usersTable
      L22_115 = L22_115(L23_116, L24_117, L25_118, L26_119)
      L23_116 = _UPVALUE0_
      L23_116 = L23_116.NIL
      if L22_115 ~= L23_116 then
        if L22_115 ~= A11_104 then
          L23_116 = _UPVALUE1_
          L23_116 = L23_116.USERDB_WRONG_ADMIN_PASSWORD
          return L23_116
        end
      else
        L23_116 = _UPVALUE1_
        L23_116 = L23_116.USERDB_USER_SESSION_NOT_FOUND
        return L23_116
      end
      if A5_98 ~= A10_103 then
        L23_116 = _UPVALUE1_
        L23_116 = L23_116.USERDB_CURRENT_CONFIG_PASSWORD_NOT_MATCH
        return L23_116
      end
      L23_116 = db
      L23_116 = L23_116.getAttribute
      L23_116 = L23_116(L24_117, L25_118, L26_119, L27_120)
      if A5_98 == L23_116 then
        return L24_117
      end
      if not (L24_117 > L25_118) then
      elseif L24_117 < L25_118 then
        return L25_118
      end
    end
  end
  L19_112 = _UPVALUE0_
  L19_112 = L19_112.NIL
  if A7_100 ~= L19_112 then
    L19_112 = _UPVALUE7_
    L19_112 = L19_112.isBoolean
    L20_113 = A7_100
    L19_112 = L19_112(L20_113)
    L12_105 = L19_112
    L19_112 = _UPVALUE0_
    L19_112 = L19_112.SUCCESS
    if L12_105 ~= L19_112 then
      L19_112 = _UPVALUE0_
      L19_112 = L19_112.INVALID_ARGUMENT
      return L19_112
    end
  end
  L19_112 = _UPVALUE0_
  L19_112 = L19_112.NIL
  if A8_101 ~= L19_112 then
    L19_112 = _UPVALUE7_
    L19_112 = L19_112.isBoolean
    L20_113 = A8_101
    L19_112 = L19_112(L20_113)
    L12_105 = L19_112
    L19_112 = _UPVALUE0_
    L19_112 = L19_112.SUCCESS
    if L12_105 ~= L19_112 then
      L19_112 = _UPVALUE0_
      L19_112 = L19_112.INVALID_ARGUMENT
      return L19_112
    end
  end
  L19_112 = db
  L19_112 = L19_112.getAttribute
  L20_113 = usersTable
  L21_114 = attribute
  L21_114 = L21_114.name
  L22_115 = A1_94
  L23_116 = attribute
  L23_116 = L23_116.groupId
  L19_112 = L19_112(L20_113, L21_114, L22_115, L23_116)
  L20_113 = db
  L20_113 = L20_113.getAttribute
  L21_114 = groupsTable
  L22_115 = attribute
  L22_115 = L22_115.groupId
  L23_116 = L19_112
  L20_113 = L20_113(L21_114, L22_115, L23_116, L24_117)
  L21_114 = 0
  L22_115 = 0
  L23_116 = NIL
  if L20_113 ~= L23_116 then
    L23_116 = util
    L23_116 = L23_116.split
    L23_116 = L23_116(L24_117, L25_118)
    for L27_120, L28_121 in L24_117(L25_118) do
      L29_122 = tonumber
      L30_123 = L28_121
      L29_122 = L29_122(L30_123)
      L30_123 = _UPVALUE8_
      if L29_122 ~= L30_123 then
        L29_122 = tonumber
        L30_123 = L28_121
        L29_122 = L29_122(L30_123)
        L30_123 = _UPVALUE9_
      elseif L29_122 == L30_123 then
        L21_114 = 1
      end
    end
  end
  L23_116 = db
  L23_116 = L23_116.getAttribute
  L23_116 = L23_116(L24_117, L25_118, L26_119, L27_120)
  if L23_116 ~= L24_117 then
    for L29_122, L30_123 in L26_119(L27_120) do
      if tonumber(L30_123) == _UPVALUE8_ or tonumber(L30_123) == _UPVALUE9_ then
        L22_115 = 1
      end
    end
    if L24_117 ~= 1 then
      A8_101 = _UPVALUE11_
    end
  end
  if L21_114 == 1 and L22_115 == 0 then
    if L24_117 == L25_118 then
      return L25_118, L26_119
    end
  end
  if L21_114 == 0 and L22_115 == 1 then
    L24_117[L25_118] = A1_94
    L24_117[L25_118] = "1"
    L24_117[L25_118] = "1"
    L24_117[L25_118] = "1"
    L24_117[L25_118] = "1"
    L24_117[L25_118] = "1"
    L24_117[L25_118] = "1"
    L24_117[L25_118] = "1"
    L24_117[L25_118] = "1"
    L24_117[L25_118] = "1"
    if L25_118 == L26_119 then
      return L26_119, L27_120
    end
  end
  if L24_117 == L25_118 then
    return L25_118
  end
  L29_122 = ROWID
  if L25_118 == L26_119 then
    return L26_119
  end
  L29_122 = attribute
  L29_122 = L29_122.firstName
  L26_119[L27_120] = A2_95
  L29_122 = attribute
  L29_122 = L29_122.lastName
  L26_119[L27_120] = A3_96
  if A9_102 == L27_120 then
    L29_122 = attribute
    L29_122 = L29_122.password
    L26_119[L27_120] = A5_98
  end
  L29_122 = attribute
  L29_122 = L29_122.multiLogin
  L26_119[L27_120] = A8_101
  L29_122 = attribute
  L29_122 = L29_122.isPwdChange
  L26_119[L27_120] = A7_100
  L29_122 = attribute
  L29_122 = L29_122.groupId
  L26_119[L27_120] = L24_117
  L29_122 = L26_119
  L30_123 = L25_118
  if L27_120 == L28_121 then
    L29_122 = A0_93
    return L28_121, L29_122
  end
  L29_122 = A0_93
  return L28_121, L29_122
end
function userDashboardCustomizationSet(A0_124, A1_125, A2_126, A3_127, A4_128, A5_129, A6_130, A7_131, A8_132, A9_133)
  local L10_134, L11_135, L12_136
  L10_134 = NIL
  if A0_124 == L10_134 then
    L10_134 = _UPVALUE0_
    L10_134 = L10_134.INVALID_ARGUMENT
    return L10_134
  end
  L10_134 = cookieValidate
  L11_135 = attribute
  L11_135 = L11_135.username
  L12_136 = A0_124
  L10_134 = L10_134(L11_135, L12_136, userDashboardCustomizationTable)
  L11_135 = _UPVALUE0_
  L11_135 = L11_135.SUCCESS
  if L10_134 ~= L11_135 then
    return L10_134
  end
  L11_135 = {}
  L12_136 = userDashboardCustomizationTable
  L12_136 = L12_136 .. "." .. attribute.trafficOverview
  L11_135[L12_136] = A1_125
  L12_136 = userDashboardCustomizationTable
  L12_136 = L12_136 .. "." .. attribute.discoveredAPs
  L11_135[L12_136] = A2_126
  L12_136 = userDashboardCustomizationTable
  L12_136 = L12_136 .. "." .. attribute.optionPorts
  L11_135[L12_136] = A3_127
  L12_136 = userDashboardCustomizationTable
  L12_136 = L12_136 .. "." .. attribute.bandwidthUsage
  L11_135[L12_136] = A4_128
  L12_136 = userDashboardCustomizationTable
  L12_136 = L12_136 .. "." .. attribute.wlanStatistics
  L11_135[L12_136] = A5_129
  L12_136 = userDashboardCustomizationTable
  L12_136 = L12_136 .. "." .. attribute.vpns
  L11_135[L12_136] = A6_130
  L12_136 = userDashboardCustomizationTable
  L12_136 = L12_136 .. "." .. attribute.cpuUtilization
  L11_135[L12_136] = A7_131
  L12_136 = userDashboardCustomizationTable
  L12_136 = L12_136 .. "." .. attribute.memoryUtilization
  L11_135[L12_136] = A8_132
  L12_136 = userDashboardCustomizationTable
  L12_136 = L12_136 .. "." .. attribute.activeInfo
  L11_135[L12_136] = A9_133
  L12_136 = db
  L12_136 = L12_136.getAttribute
  L12_136 = L12_136(userDashboardCustomizationTable, attribute.username, A0_124, ROWID)
  if db.update(userDashboardCustomizationTable, L11_135, L12_136) == NIL then
    return _UPVALUE0_.FAILURE, A0_124
  end
  return _UPVALUE0_.SUCCESS, A0_124
end
function userCreate(A0_137, A1_138, A2_139, A3_140, A4_141, A5_142, A6_143, A7_144)
  local L8_145, L9_146, L10_147, L11_148, L12_149, L13_150, L14_151, L15_152, L16_153, L17_154, L18_155, L19_156, L20_157, L21_158, L22_159, L23_160, L24_161, L25_162, L26_163, L27_164, L28_165
  L8_145 = NIL
  if A0_137 == L8_145 or A0_137 == "" then
    L8_145 = _UPVALUE0_
    L8_145 = L8_145.USERS_USERNAME_NIL
    return L8_145
  end
  L8_145 = string
  L8_145 = L8_145.len
  L9_146 = A0_137
  L8_145 = L8_145(L9_146)
  L9_146 = _UPVALUE1_
  if not (L8_145 > L9_146) then
    L9_146 = _UPVALUE2_
  elseif L8_145 < L9_146 then
    L9_146 = _UPVALUE0_
    L9_146 = L9_146.USERS_USERNAME_INVALID
    return L9_146
  end
  L9_146 = NIL
  if A1_138 == L9_146 or A1_138 == "" then
    L9_146 = _UPVALUE0_
    L9_146 = L9_146.USERS_FIRSTNAME_NIL
    return L9_146
  end
  L9_146 = string
  L9_146 = L9_146.len
  L10_147 = A1_138
  L9_146 = L9_146(L10_147)
  L10_147 = _UPVALUE1_
  if not (L9_146 > L10_147) then
    L10_147 = _UPVALUE2_
  elseif L9_146 < L10_147 then
    L10_147 = _UPVALUE0_
    L10_147 = L10_147.USERS_FIRSTNAME_INVALID
    return L10_147
  end
  L10_147 = NIL
  if A2_139 == L10_147 or A2_139 == "" then
    L10_147 = _UPVALUE0_
    L10_147 = L10_147.USERS_LASTNAME_NIL
    return L10_147
  end
  L10_147 = string
  L10_147 = L10_147.len
  L11_148 = A2_139
  L10_147 = L10_147(L11_148)
  L11_148 = _UPVALUE1_
  if not (L10_147 > L11_148) then
    L11_148 = _UPVALUE2_
  elseif L10_147 < L11_148 then
    L11_148 = _UPVALUE0_
    L11_148 = L11_148.USERS_LASTNAME_INVALID
    return L11_148
  end
  L11_148 = NIL
  if A3_140 == L11_148 or A3_140 == "" then
    L11_148 = _UPVALUE0_
    L11_148 = L11_148.USERS_GROUPNAME_NIL
    return L11_148
  end
  L11_148 = string
  L11_148 = L11_148.len
  L12_149 = A3_140
  L11_148 = L11_148(L12_149)
  L12_149 = _UPVALUE1_
  if not (L11_148 > L12_149) then
    L12_149 = _UPVALUE2_
  elseif L11_148 < L12_149 then
    L12_149 = _UPVALUE0_
    L12_149 = L12_149.USERS_GROUPNAME_INVALID
    return L12_149
  end
  L12_149 = NIL
  if A4_141 == L12_149 or A4_141 == "" then
    L12_149 = _UPVALUE0_
    L12_149 = L12_149.USERS_PASSWORD_NIL
    return L12_149
  end
  L12_149 = string
  L12_149 = L12_149.len
  L13_150 = A4_141
  L12_149 = L12_149(L13_150)
  L13_150 = _UPVALUE3_
  if not (L12_149 > L13_150) then
    L13_150 = _UPVALUE4_
  elseif L12_149 < L13_150 then
    L13_150 = _UPVALUE0_
    L13_150 = L13_150.USERS_PASSWORD_INVALID
    return L13_150
  end
  L13_150 = _UPVALUE5_
  L14_151 = _UPVALUE6_
  L15_152 = _UPVALUE7_
  L15_152 = L15_152.NIL
  if A6_143 ~= L15_152 then
    L15_152 = _UPVALUE8_
    L15_152 = L15_152.isBoolean
    L16_153 = A6_143
    L15_152 = L15_152(L16_153)
    valid = L15_152
    L15_152 = valid
    L16_153 = _UPVALUE7_
    L16_153 = L16_153.SUCCESS
    if L15_152 ~= L16_153 then
      L15_152 = _UPVALUE7_
      L15_152 = L15_152.INVALID_ARGUMENT
      return L15_152
    end
  end
  L15_152 = _UPVALUE7_
  L15_152 = L15_152.NIL
  if A7_144 ~= L15_152 then
    L15_152 = _UPVALUE8_
    L15_152 = L15_152.isBoolean
    L16_153 = A7_144
    L15_152 = L15_152(L16_153)
    valid = L15_152
    L15_152 = valid
    L16_153 = _UPVALUE7_
    L16_153 = L16_153.SUCCESS
    if L15_152 ~= L16_153 then
      L15_152 = _UPVALUE7_
      L15_152 = L15_152.INVALID_ARGUMENT
      return L15_152
    end
  end
  L15_152 = db
  L15_152 = L15_152.getAttribute
  L16_153 = groupsTable
  L17_154 = attribute
  L17_154 = L17_154.groupName
  L15_152 = L15_152(L16_153, L17_154, L18_155, L19_156)
  L16_153 = NIL
  if L15_152 ~= L16_153 then
    L16_153 = 0
    L17_154 = util
    L17_154 = L17_154.split
    L17_154 = L17_154(L18_155, L19_156)
    for L21_158, L22_159 in L18_155(L19_156) do
      L23_160 = _UPVALUE9_
      if L22_159 == L23_160 then
        L16_153 = 1
      end
    end
    if L16_153 == 1 then
      L13_150 = A7_144
      L14_151 = A6_143
    end
  end
  L16_153 = db
  L16_153 = L16_153.getAttribute
  L17_154 = groupsTable
  L16_153 = L16_153(L17_154, L18_155, L19_156, L20_157)
  L17_154 = NIL
  if L16_153 == L17_154 then
    L17_154 = _UPVALUE7_
    L17_154 = L17_154.INVALID_ARGUMENT
    return L17_154
  end
  L17_154 = db
  L17_154 = L17_154.getAttribute
  L21_158 = attribute
  L21_158 = L21_158.idleTimeout
  L17_154 = L17_154(L18_155, L19_156, L20_157, L21_158)
  if L17_154 == L18_155 then
    return L18_155
  end
  if L18_155 ~= nil then
    if L19_156 >= L20_157 then
      return L19_156
    end
  end
  L21_158 = attribute
  L21_158 = L21_158.groupName
  L22_159 = A3_140
  L23_160 = attribute
  L23_160 = L23_160.groupId
  L21_158 = usersTable
  L22_159 = attribute
  L22_159 = L22_159.groupId
  L23_160 = L19_156
  L21_158 = #L20_157
  L22_159 = _UPVALUE11_
  if L21_158 >= L22_159 then
    L21_158 = _UPVALUE0_
    L21_158 = L21_158.USER_GROUP_NUMBER_EXCEEDED
    return L21_158
  end
  L21_158 = getMaxId
  L22_159 = usersTable
  L23_160 = attribute
  L23_160 = L23_160.userId
  L22_159 = L21_158(L22_159, L23_160)
  L23_160 = _UPVALUE7_
  L23_160 = L23_160.SUCCESS
  if L21_158 ~= L23_160 then
    return L21_158
  end
  L22_159 = L22_159 + 1
  L23_160 = db
  L23_160 = L23_160.getAttribute
  L24_161 = groupsTable
  L23_160 = L23_160(L24_161, L25_162, L26_163, L27_164)
  L24_161 = 0
  if L23_160 == L25_162 then
    L23_160 = ""
  else
    captivePortalCheck = L25_162
    for L28_165, _FORV_29_ in L25_162(L26_163) do
      if _FORV_29_ == _UPVALUE9_ then
        L24_161 = 1
      end
    end
  end
  if L24_161 == 0 then
    L14_151 = _UPVALUE5_
    L13_150 = _UPVALUE5_
  end
  L28_165 = A0_137
  if L25_162 ~= L26_163 then
    return L26_163
  end
  L28_165 = "."
  L26_163[L27_164] = A0_137
  L28_165 = "."
  L26_163[L27_164] = A1_138
  L28_165 = "."
  L26_163[L27_164] = A2_139
  L28_165 = "."
  L26_163[L27_164] = L16_153
  L28_165 = "."
  L26_163[L27_164] = A4_141
  L28_165 = "."
  L26_163[L27_164] = L17_154
  L28_165 = "."
  L26_163[L27_164] = L13_150
  L28_165 = "."
  L26_163[L27_164] = L22_159
  L28_165 = "."
  L26_163[L27_164] = L14_151
  L28_165 = "."
  L28_165 = _UPVALUE12_
  L26_163[L27_164] = L28_165
  L28_165 = usersTable
  L28_165 = NIL
  if L27_164 == L28_165 then
    L28_165 = _UPVALUE7_
    L28_165 = L28_165.FAILURE
    return L28_165
  end
  L28_165 = db
  L28_165 = L28_165.getAttribute
  L28_165 = L28_165(usersTable, attribute.name, A0_137, ROWID)
  if L28_165 == NIL then
    return _UPVALUE7_.FAILURE
  end
  return _UPVALUE7_.SUCCESS, L28_165
end
function dashboardManageUserCreate(A0_166, A1_167)
  local L2_168, L3_169, L4_170, L5_171, L6_172, L7_173, L8_174, L9_175, L10_176, L11_177, L12_178
  L3_169 = NIL
  if A0_166 == L3_169 or A0_166 == "" then
    L3_169 = _UPVALUE0_
    L3_169 = L3_169.USERS_USERNAME_NIL
    return L3_169
  end
  L3_169 = string
  L3_169 = L3_169.len
  L4_170 = A0_166
  L3_169 = L3_169(L4_170)
  L4_170 = _UPVALUE1_
  if not (L3_169 > L4_170) then
    L4_170 = _UPVALUE2_
  elseif L3_169 < L4_170 then
    L4_170 = _UPVALUE0_
    L4_170 = L4_170.USERS_USERNAME_INVALID
    return L4_170
  end
  L4_170 = NIL
  if A1_167 == L4_170 or A1_167 == "" then
    L4_170 = _UPVALUE0_
    L4_170 = L4_170.USERS_GROUPNAME_NIL
    return L4_170
  end
  L4_170 = string
  L4_170 = L4_170.len
  L5_171 = A1_167
  L4_170 = L4_170(L5_171)
  L5_171 = _UPVALUE1_
  if not (L4_170 > L5_171) then
    L5_171 = _UPVALUE2_
  elseif L4_170 < L5_171 then
    L5_171 = _UPVALUE0_
    L5_171 = L5_171.USERS_GROUPNAME_INVALID
    return L5_171
  end
  L5_171 = db
  L5_171 = L5_171.getAttribute
  L6_172 = groupsTable
  L7_173 = attribute
  L7_173 = L7_173.groupName
  L5_171 = L5_171(L6_172, L7_173, L8_174, L9_175)
  L6_172 = NIL
  if L5_171 == L6_172 then
    L6_172 = _UPVALUE3_
    L6_172 = L6_172.INVALID_ARGUMENT
    return L6_172
  end
  L6_172 = db
  L6_172 = L6_172.getAttribute
  L7_173 = groupsTable
  L6_172 = L6_172(L7_173, L8_174, L9_175, L10_176)
  L7_173 = NIL
  if L6_172 == L7_173 then
    L6_172 = ""
  end
  L7_173 = util
  L7_173 = L7_173.split
  L7_173 = L7_173(L8_174, L9_175)
  if L7_173 ~= nil then
    for L11_177, L12_178 in L8_174(L9_175) do
      if tonumber(L12_178) == _UPVALUE4_ or tonumber(L12_178) == _UPVALUE5_ then
        L2_168 = _UPVALUE6_
        break
      end
    end
  end
  if L8_174 ~= L2_168 then
    return L8_174
  end
  L11_177 = A0_166
  if L8_174 ~= L9_175 then
    return L9_175
  end
  L11_177 = "."
  L12_178 = attribute
  L12_178 = L12_178.username
  L9_175[L10_176] = A0_166
  L11_177 = "."
  L12_178 = attribute
  L12_178 = L12_178.trafficOverview
  L11_177 = _UPVALUE6_
  L9_175[L10_176] = L11_177
  L11_177 = "."
  L12_178 = attribute
  L12_178 = L12_178.discoveredAPs
  L11_177 = _UPVALUE6_
  L9_175[L10_176] = L11_177
  L11_177 = "."
  L12_178 = attribute
  L12_178 = L12_178.optionPorts
  L11_177 = _UPVALUE6_
  L9_175[L10_176] = L11_177
  L11_177 = "."
  L12_178 = attribute
  L12_178 = L12_178.bandwidthUsage
  L11_177 = _UPVALUE6_
  L9_175[L10_176] = L11_177
  L11_177 = "."
  L12_178 = attribute
  L12_178 = L12_178.wlanStatistics
  L11_177 = _UPVALUE6_
  L9_175[L10_176] = L11_177
  L11_177 = "."
  L12_178 = attribute
  L12_178 = L12_178.vpns
  L11_177 = _UPVALUE6_
  L9_175[L10_176] = L11_177
  L11_177 = "."
  L12_178 = attribute
  L12_178 = L12_178.cpuUtilization
  L11_177 = _UPVALUE6_
  L9_175[L10_176] = L11_177
  L11_177 = "."
  L12_178 = attribute
  L12_178 = L12_178.memoryUtilization
  L11_177 = _UPVALUE6_
  L9_175[L10_176] = L11_177
  L11_177 = "."
  L12_178 = attribute
  L12_178 = L12_178.activeInfo
  L11_177 = _UPVALUE6_
  L9_175[L10_176] = L11_177
  L11_177 = userDashboardCustomizationTable
  L12_178 = L9_175
  L11_177 = NIL
  if L10_176 == L11_177 then
    L11_177 = _UPVALUE3_
    L11_177 = L11_177.FAILURE
    return L11_177
  end
  L11_177 = _UPVALUE3_
  L11_177 = L11_177.SUCCESS
  return L11_177
end
function userDelete(A0_179)
  local L1_180, L2_181, L3_182
  L1_180 = NIL
  if A0_179 == L1_180 then
    L1_180 = _UPVALUE0_
    L1_180 = L1_180.INVALID_ARGUMENT
    return L1_180
  end
  L1_180 = cookieValidate
  L2_181 = attribute
  L2_181 = L2_181.userId
  L3_182 = A0_179
  L2_181 = L1_180(L2_181, L3_182, usersTable)
  L3_182 = _UPVALUE0_
  L3_182 = L3_182.SUCCESS
  if L1_180 ~= L3_182 then
    return L1_180
  end
  L3_182 = db
  L3_182 = L3_182.getAttribute
  L3_182 = L3_182(usersTable, ROWID, L2_181, attribute.name)
  if L3_182 == NIL then
    return _UPVALUE0_.FAILURE
  end
  if L3_182 == _UPVALUE1_ or L3_182 == _UPVALUE2_ then
    return _UPVALUE3_.DEFAULT_USER_DELETE_ERROR
  end
  if db.existsRow(sslvpnActiveUsersTable, attribute.name, L3_182) ~= FALSE then
    return _UPVALUE3_.USER_ACTIVE_DELETE_ERROR
  end
  if db.existsRow(captiveportalSessionTable, attribute.name, L3_182) ~= FALSE then
    return _UPVALUE3_.USER_ACTIVE_DELETE_ERROR
  end
  if db.existsRow(loginSessionTable, attribute.username, L3_182) ~= FALSE then
    return _UPVALUE3_.USER_ACTIVE_DELETE_ERROR
  end
  if db.deleteRow(usersTable, ROWID, L2_181) == NIL then
    return _UPVALUE0_.FAILURE, L2_181
  end
  return _UPVALUE0_.SUCCESS, L2_181
end
function dashboardManageUserDelete(A0_183)
  local L1_184, L2_185, L3_186, L4_187, L5_188, L6_189, L7_190, L8_191, L9_192, L10_193, L11_194, L12_195, L13_196, L14_197
  L1_184 = NIL
  if A0_183 == L1_184 then
    L1_184 = _UPVALUE0_
    L1_184 = L1_184.INVALID_ARGUMENT
    return L1_184
  end
  L1_184 = cookieValidate
  L2_185 = attribute
  L2_185 = L2_185.userId
  L3_186 = A0_183
  L4_187 = usersTable
  L2_185 = L1_184(L2_185, L3_186, L4_187)
  L3_186 = _UPVALUE0_
  L3_186 = L3_186.SUCCESS
  if L1_184 ~= L3_186 then
    return L1_184
  end
  L3_186 = db
  L3_186 = L3_186.getAttribute
  L4_187 = usersTable
  L5_188 = ROWID
  L6_189 = L2_185
  L7_190 = attribute
  L7_190 = L7_190.name
  L3_186 = L3_186(L4_187, L5_188, L6_189, L7_190)
  L4_187 = db
  L4_187 = L4_187.getAttribute
  L5_188 = usersTable
  L6_189 = ROWID
  L7_190 = L2_185
  L8_191 = attribute
  L8_191 = L8_191.groupId
  L4_187 = L4_187(L5_188, L6_189, L7_190, L8_191)
  L5_188 = NIL
  if L3_186 == L5_188 then
    L5_188 = _UPVALUE0_
    L5_188 = L5_188.FAILURE
    return L5_188
  end
  L5_188 = _UPVALUE1_
  if L3_186 ~= L5_188 then
    L5_188 = _UPVALUE2_
  elseif L3_186 == L5_188 then
    L5_188 = _UPVALUE3_
    L5_188 = L5_188.DEFAULT_USER_DELETE_ERROR
    return L5_188
  end
  L5_188 = db
  L5_188 = L5_188.existsRow
  L6_189 = loginSessionTable
  L7_190 = attribute
  L7_190 = L7_190.username
  L8_191 = L3_186
  L5_188 = L5_188(L6_189, L7_190, L8_191)
  L6_189 = FALSE
  if L5_188 ~= L6_189 then
    L6_189 = _UPVALUE3_
    L6_189 = L6_189.USER_ACTIVE_DELETE_ERROR
    return L6_189
  end
  L6_189 = db
  L6_189 = L6_189.getAttribute
  L7_190 = usersTable
  L8_191 = ROWID
  L9_192 = L2_185
  L6_189 = L6_189(L7_190, L8_191, L9_192, L10_193)
  L7_190 = _UPVALUE0_
  L7_190 = L7_190.NIL
  if L6_189 == L7_190 then
    L7_190 = _UPVALUE0_
    L7_190 = L7_190.FAILURE
    return L7_190
  end
  L7_190 = _UPVALUE4_
  L8_191 = db
  L8_191 = L8_191.getAttribute
  L9_192 = groupsTable
  L8_191 = L8_191(L9_192, L10_193, L11_194, L12_195)
  L9_192 = _UPVALUE0_
  L9_192 = L9_192.NIL
  if L8_191 == L9_192 then
    L9_192 = _UPVALUE0_
    L9_192 = L9_192.FAILURE
    return L9_192
  end
  L9_192 = util
  L9_192 = L9_192.split
  L9_192 = L9_192(L10_193, L11_194)
  if L9_192 ~= nil then
    for L13_196, L14_197 in L10_193(L11_194) do
      if tonumber(L14_197) == _UPVALUE5_ or tonumber(L14_197) == _UPVALUE6_ then
        L7_190 = _UPVALUE7_
        break
      end
    end
  end
  if L7_190 ~= L10_193 then
    return L10_193
  end
  L13_196 = L3_186
  L14_197 = ROWID
  if L10_193 == L11_194 then
    return L11_194
  end
  L13_196 = ROWID
  L14_197 = L10_193
  if L11_194 == L12_195 then
    L13_196 = L2_185
    return L12_195, L13_196
  end
  L13_196 = L2_185
  return L12_195, L13_196
end
function dashboardManageUserDeleteAll()
  local L0_198, L1_199, L2_200, L3_201, L4_202, L5_203, L6_204, L7_205, L8_206, L9_207, L10_208, L11_209, L12_210, L13_211, L14_212, L15_213, L16_214
  L0_198 = db
  L0_198 = L0_198.getTable
  L0_198 = L0_198(L1_199, L2_200)
  if L0_198 == L1_199 then
    return L1_199
  end
  for L4_202, L5_203 in L1_199(L2_200) do
    L6_204 = attribute
    L6_204 = L6_204.name
    L6_204 = L5_203[L6_204]
    L7_205 = NIL
    if L6_204 == L7_205 then
      L7_205 = _UPVALUE0_
      L7_205 = L7_205.FAILURE
      return L7_205
    end
    L7_205 = db
    L7_205 = L7_205.getAttribute
    L8_206 = usersTable
    L9_207 = attribute
    L9_207 = L9_207.name
    L10_208 = L6_204
    L11_209 = attribute
    L11_209 = L11_209.groupId
    L7_205 = L7_205(L8_206, L9_207, L10_208, L11_209)
    L8_206 = _UPVALUE1_
    if L6_204 ~= L8_206 then
      L8_206 = _UPVALUE2_
      if L6_204 ~= L8_206 then
        L8_206 = db
        L8_206 = L8_206.existsRow
        L9_207 = loginSessionTable
        L10_208 = attribute
        L10_208 = L10_208.username
        L11_209 = L6_204
        L8_206 = L8_206(L9_207, L10_208, L11_209)
        L9_207 = FALSE
        if L8_206 ~= L9_207 then
          L9_207 = _UPVALUE3_
          L9_207 = L9_207.USER_ACTIVE_DELETE_ERROR
          return L9_207
        end
        L9_207 = db
        L9_207 = L9_207.getAttribute
        L10_208 = groupsTable
        L11_209 = attribute
        L11_209 = L11_209.groupId
        L9_207 = L9_207(L10_208, L11_209, L12_210, L13_211)
        L10_208 = _UPVALUE0_
        L10_208 = L10_208.NIL
        if L9_207 == L10_208 then
          L10_208 = _UPVALUE0_
          L10_208 = L10_208.FAILURE
          return L10_208
        end
        L10_208 = util
        L10_208 = L10_208.split
        L11_209 = L9_207
        L10_208 = L10_208(L11_209, L12_210)
        L11_209 = _UPVALUE4_
        if L10_208 ~= nil then
          for L15_213, L16_214 in L12_210(L13_211) do
            if tonumber(L16_214) == _UPVALUE5_ or tonumber(L16_214) == _UPVALUE6_ then
              L11_209 = _UPVALUE7_
              break
            end
          end
        end
        if L11_209 == L12_210 then
          L15_213 = L6_204
          L16_214 = ROWID
          if L12_210 == L13_211 then
            return L13_211
          end
          L15_213 = ROWID
          L16_214 = L12_210
          if L13_211 == L14_212 then
            return L14_212
          end
        end
      end
    end
  end
  return L1_199
end
function usersGetAll()
  local L0_215, L1_216
  L0_215 = "select Users.UserName, Users.UserId, UserGroups.GroupName, GroupAccessControl.DenyLogin,GroupAccessControl.DenyLoginFromWan from Users, UserGroups, GroupAccessControl where Users.GroupId = UserGroups.GroupId and UserGroups.GroupId=GroupAccessControl.GroupId"
  L1_216 = db
  L1_216 = L1_216.getTable
  L1_216 = L1_216(usersTable, nil, L0_215)
  if next(L1_216) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_216
end
function openVpnUsersGetAll()
  local L0_217, L1_218
  L0_217 = "select Users.UserName, Users.UserId, "
  L1_218 = "UserGroups.GroupName, "
  L0_217 = L0_217 .. L1_218 .. "GroupAccessControl.DenyLogin, " .. "GroupAccessControl.DenyLoginFromWan from Users, " .. "UserGroups, GroupAccessControl where " .. "Users.GroupId = UserGroups.GroupId and " .. "UserGroups.GroupId=GroupAccessControl.GroupId and " .. "UserGroups.Capabilities like '%13%'"
  L1_218 = db
  L1_218 = L1_218.getTable
  L1_218 = L1_218(usersTable, nil, L0_217)
  if next(L1_218) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_218
end
function usersGetRow(A0_219)
  local L1_220, L2_221, L3_222
  L1_220 = "select Users.UserName, Users.UserId, UserGroups.GroupName, Users.FirstName, Users.LastName, Users.Password, Users.multiLogSup, Users.enableChangePasswd, UserGroups.GroupTimeOut from Users, UserGroups where UserGroups.GroupId=Users.GroupId and Users.UserId = '"
  L2_221 = A0_219
  L3_222 = "'"
  L1_220 = L1_220 .. L2_221 .. L3_222
  L2_221 = db
  L2_221 = L2_221.getTable
  L3_222 = usersTable
  L2_221 = L2_221(L3_222, nil, L1_220)
  L3_222 = next
  L3_222 = L3_222(L2_221)
  if L3_222 == NIL then
    L3_222 = _UPVALUE0_
    L3_222 = L3_222.FAILURE
    return L3_222
  end
  L3_222 = {}
  L3_222.name = L2_221[1]["Users.UserName"]
  L3_222.userId = L2_221[1]["Users.UserId"]
  L3_222.groupName = L2_221[1]["Users.GroupName"]
  L3_222.firstName = L2_221[1]["Users.FirstName"]
  L3_222.lastName = L2_221[1]["Users.LastName"]
  L3_222.password = L2_221[1]["Users.Password"]
  L3_222.idleTimeout = L2_221[1]["Users.GroupTimeOut"]
  L3_222.multiLogin = L2_221[1]["Users.multiLogSup"]
  L3_222.isPwdChange = L2_221[1]["Users.enableChangePasswd"]
  if L3_222 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_219, L3_222
end
function usersDeleteAll(A0_223)
  local L1_224, L2_225, L3_226, L4_227, L5_228, L6_229, L7_230, L8_231, L9_232
  L1_224 = _UPVALUE0_
  L1_224 = L1_224.NIL
  if A0_223 ~= L1_224 then
    L1_224 = #A0_223
  elseif L1_224 == 0 then
    L1_224 = _UPVALUE0_
    L1_224 = L1_224.INVALID_ARGUMENT
    return L1_224
  end
  L1_224 = #A0_223
  if L1_224 == 2 then
    return L2_225
  end
  for L5_228, L6_229 in L2_225(L3_226) do
    L8_231 = attribute
    L8_231 = L8_231.userId
    L9_232 = L6_229
    L8_231 = L7_230(L8_231, L9_232, usersTable)
    L9_232 = _UPVALUE0_
    L9_232 = L9_232.SUCCESS
    if L7_230 ~= L9_232 then
      return L7_230
    end
    L9_232 = db
    L9_232 = L9_232.getAttribute
    L9_232 = L9_232(usersTable, ROWID, L8_231, attribute.name)
    if L9_232 == NIL then
      return _UPVALUE0_.FAILURE
    end
    if db.existsRow(sslvpnActiveUsersTable, attribute.name, L9_232) ~= FALSE then
      return _UPVALUE1_.USER_ACTIVE_DELETE_ERROR
    end
    if db.existsRow(captiveportalSessionTable, attribute.name, L9_232) ~= FALSE then
      return _UPVALUE1_.USER_ACTIVE_DELETE_ERROR
    end
  end
  if L2_225 ~= L3_226 then
    return L2_225
  end
  if L3_226 == L4_227 then
    return L4_227, L5_228
  end
  for L8_231, L9_232 in L5_228(L6_229) do
    if db.existsRow(loginSessionTable, attribute.name, L3_226[L8_231][attribute.name]) then
    end
    if L3_226[L8_231][attribute.defaultUser] ~= "1" and L4_227 == "0" then
      status = db.deleteRow(usersTable, ROWID, L3_226[L8_231]._ROWID_)
    end
  end
  if L5_228 == L6_229 then
    return L5_228, L6_229
  end
  return L5_228, L6_229
end
function userDBFileUpload(A0_233, A1_234)
  local L2_235, L3_236, L4_237, L5_238, L6_239, L7_240, L8_241
  L2_235 = false
  L3_236 = "/var/"
  L4_237 = "sample.csv"
  L5_238 = {}
  L5_238["GETUSERSDb.GetUsersDbFile"] = "/var/sample.csv"
  L6_239 = "mv "
  L7_240 = "/tmp/"
  L8_241 = A1_234
  L6_239 = L6_239 .. L7_240 .. L8_241 .. " /var/sample.csv"
  L7_240 = os
  L7_240 = L7_240.execute
  L8_241 = L6_239
  L7_240 = L7_240(L8_241)
  L8_241 = "/usr/bin/dos2unix"
  L8_241 = L8_241 .. " /var/sample.csv"
  if #db.getTable("GETUSERSDb") == 0 then
    L2_235 = db.insert("GETUSERSDb", L5_238)
  else
    L2_235 = db.setAttribute("GETUSERSDb", "_ROWID_", "1", "GetUsersDbFile", "/var/sample.csv")
  end
  if L2_235 ~= NIL then
    return _UPVALUE0_.SUCCESS, 0
  else
    return _UPVALUE0_.FAILURE, 0
  end
end
function usersDashboardGetRow(A0_242)
  local L1_243
  L1_243 = db
  L1_243 = L1_243.getRow
  L1_243 = L1_243(userDashboardCustomizationTable, attribute.username, A0_242)
  if L1_243 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L1_243 = util.removePrefix(L1_243, userDashboardCustomizationTable .. ".")
  return _UPVALUE0_.SUCCESS, L1_243
end
function currentLoggedINSessionGet()
  local L0_244, L1_245, L2_246, L3_247, L4_248
  L1_245 = cgilua
  L1_245 = L1_245.cookies
  L1_245 = L1_245.get
  L2_246 = "TeamF1Login"
  L1_245 = L1_245(L2_246)
  L2_246 = _UPVALUE0_
  L2_246 = L2_246.NIL
  if L1_245 ~= L2_246 then
    L2_246 = db
    L2_246 = L2_246.escape
    L3_247 = L1_245
    L2_246 = L2_246(L3_247)
    L1_245 = L2_246
  end
  L2_246 = "ipaddr = '"
  L3_247 = SAPI
  L3_247 = L3_247.Request
  L3_247 = L3_247.servervariable
  L4_248 = "REMOTE_ADDR"
  L3_247 = L3_247(L4_248)
  L4_248 = "' AND Cookie = '"
  L2_246 = L2_246 .. L3_247 .. L4_248 .. L1_245 .. "'"
  L3_247 = db
  L3_247 = L3_247.getAttributeWhere
  L4_248 = loginSessionTable
  L3_247 = L3_247(L4_248, L2_246, attribute.username)
  L4_248 = _UPVALUE0_
  L4_248 = L4_248.NIL
  if L3_247 == L4_248 then
    L4_248 = _UPVALUE1_
    L4_248 = L4_248.USERDB_USER_SESSION_NOT_FOUND
    return L4_248
  end
  L4_248 = db
  L4_248 = L4_248.getAttribute
  L4_248 = L4_248(usersTable, attribute.name, L3_247, ROWID)
  if L4_248 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L4_248
end
function userByRowGet(A0_249)
  local L1_250
  L1_250 = db
  L1_250 = L1_250.getRow
  L1_250 = L1_250(usersTable, attribute.userId, A0_249)
  if L1_250 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_249, L1_250
end
function isLoginPasswordChanged(A0_251, A1_252)
  local L2_253, L3_254, L4_255, L5_256, L6_257, L7_258
  L2_253 = cgilua
  L2_253 = L2_253.cookies
  L2_253 = L2_253.get
  L3_254 = "TeamF1Login"
  L2_253 = L2_253(L3_254)
  L3_254, L4_255 = nil, nil
  L5_256 = UNIT_NAME
  if L5_256 ~= "DSR-250N" then
    L5_256 = UNIT_NAME
    if L5_256 ~= "DSR-250" then
      L5_256 = UNIT_NAME
      if L5_256 ~= "DSR-150N" then
        L5_256 = UNIT_NAME
        if L5_256 ~= "DSR-150" then
          L5_256 = cgilua
          L5_256 = L5_256.cookies
          L5_256 = L5_256.get
          L6_257 = "TeamF1OmniSSLLogin"
          L5_256 = L5_256(L6_257)
          L3_254 = L5_256
        end
      end
    end
  end
  L5_256 = UNIT_NAME
  if L5_256 ~= "DSR-250N" then
    L5_256 = UNIT_NAME
    if L5_256 ~= "DSR-250" then
      L5_256 = UNIT_NAME
      if L5_256 ~= "DSR-150N" then
        L5_256 = UNIT_NAME
      end
    end
  elseif L5_256 == "DSR-150" then
    L5_256 = _UPVALUE0_
    L5_256 = L5_256.NIL
    if L2_253 ~= L5_256 then
      L5_256 = db
      L5_256 = L5_256.escape
      L6_257 = L2_253
      L5_256 = L5_256(L6_257)
      L2_253 = L5_256
    end
  end
  L5_256 = db
  L5_256 = L5_256.getAttribute
  L6_257 = loginSessionTable
  L7_258 = attribute
  L7_258 = L7_258.cookie
  L5_256 = L5_256(L6_257, L7_258, L2_253, attribute.username)
  L5_256 = L5_256 or ""
  L6_257 = UNIT_NAME
  if L6_257 ~= "DSR-250N" then
    L6_257 = UNIT_NAME
    if L6_257 ~= "DSR-250" then
      L6_257 = UNIT_NAME
      if L6_257 ~= "DSR-150N" then
        L6_257 = UNIT_NAME
        if L6_257 ~= "DSR-150" then
          L6_257 = _UPVALUE0_
          L6_257 = L6_257.NIL
          if L3_254 ~= L6_257 then
            L6_257 = db
            L6_257 = L6_257.getAttribute
            L7_258 = OpenvpnSessionTable
            L6_257 = L6_257(L7_258, Openvpnattribute.cookie, L3_254, Openvpnattribute.username)
            L4_255 = L6_257 or ""
          end
        end
      end
    end
  end
  L6_257 = usersTable
  L7_258 = "."
  L6_257 = L6_257 .. L7_258 .. attribute.password
  L6_257 = A0_251[L6_257]
  L7_258 = usersTable
  L7_258 = L7_258 .. "." .. attribute.name
  L7_258 = A1_252[L7_258]
  if UNIT_NAME ~= "DSR-250N" and UNIT_NAME ~= "DSR-250" and UNIT_NAME ~= "DSR-150N" and UNIT_NAME ~= "DSR-150" then
    if (L7_258 == L5_256 or L7_258 == L4_255) and (L6_257 ~= A1_252[usersTable .. "." .. attribute.password] or L7_258 ~= A1_252[usersTable .. "." .. attribute.name]) then
      if L6_257 ~= A1_252[usersTable .. "." .. attribute.password] then
        return _UPVALUE1_.PASSWORD_CHANGED
      end
      if L7_258 ~= A1_252[usersTable .. "." .. attribute.name] then
        return _UPVALUE1_.USERNAME_CHANGED
      end
    end
  elseif L7_258 == L5_256 and (L6_257 ~= A1_252[usersTable .. "." .. attribute.password] or L7_258 ~= A1_252[usersTable .. "." .. attribute.name]) then
    if L6_257 ~= A1_252[usersTable .. "." .. attribute.password] then
      return _UPVALUE1_.PASSWORD_CHANGED
    end
    if L7_258 ~= A1_252[usersTable .. "." .. attribute.name] then
      return _UPVALUE1_.USERNAME_CHANGED
    end
  end
  if db.existsRow(loginSessionTable, attribute.username, L7_258) then
    if L7_258 ~= L5_256 and L6_257 ~= A1_252[usersTable .. "." .. attribute.password] then
      db.setAttribute(loginSessionTable, attribute.username, L7_258, attribute.loginState, "EXPIRED_PWD_CHANGED")
    end
  elseif UNIT_NAME ~= "DSR-250N" and UNIT_NAME ~= "DSR-250" and UNIT_NAME ~= "DSR-150N" and UNIT_NAME ~= "DSR-150" and db.existsRow(OpenvpnSessionTable, attribute.username, L7_258) and L7_258 ~= L4_255 and L6_257 ~= A1_252[usersTable .. "." .. attribute.password] then
    db.setAttribute(OpenvpnSessionTable, attribute.username, L7_258, attribute.loginState, "EXPIRED_PWD_CHANGED")
  end
  return _UPVALUE1_.CREDENTIALS_UNCHANGED
end
function getGroupName(A0_259)
  local L1_260, L2_261
  L1_260 = db
  L1_260 = L1_260.getAttribute
  L2_261 = usersTable
  L1_260 = L1_260(L2_261, attribute.userId, A0_259, attribute.groupId)
  L2_261 = NIL
  if L1_260 == L2_261 then
    L2_261 = _UPVALUE0_
    L2_261 = L2_261.FAILURE
    return L2_261
  end
  L2_261 = db
  L2_261 = L2_261.getAttribute
  L2_261 = L2_261(groupsTable, attribute.groupId, L1_260, attribute.groupName)
  if L2_261 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L2_261
end
