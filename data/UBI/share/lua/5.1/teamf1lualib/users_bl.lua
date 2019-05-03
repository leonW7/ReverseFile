local L0_0
L0_0 = module
L0_0("com.teamf1.bl.userdb.users", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/user-management_users")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/errorMap")
L0_0 = require
L0_0("teamf1lualib/userdb_returnCodes")
L0_0 = false
FALSE = L0_0
L0_0 = nil
NIL = L0_0
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
userDBStatusFile = "/tmp/gUserdbStatus.txt"
errorStatusFile = "/tmp/errorStatusForUserDB.txt"
SAMPLE_CSV = "/var/sample.csv"
function userProfileGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8
  L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8 = _UPVALUE0_.userGet()
  if L0_1 ~= SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8
end
function userProfileGetNext(A0_9)
  local L1_10, L2_11, L3_12, L4_13, L5_14, L6_15, L7_16, L8_17, L9_18
  L1_10 = A0_9["users.cookie"]
  if L1_10 == nil then
    L2_11 = util
    L2_11 = L2_11.appendDebugOut
    L3_12 = "GetNext : Invalid Cookie"
    L2_11(L3_12)
    L2_11 = _UPVALUE0_
    L2_11 = L2_11.BAD_PARAMETER
    return L2_11
  end
  L2_11, L3_12, L4_13, L5_14, L6_15, L7_16, L8_17, L9_18 = nil, nil, nil, nil, nil, nil, nil, nil
  L2_11, L3_12, L4_13, L5_14, L6_15, L7_16, L8_17, L9_18 = _UPVALUE1_.userGetNext(L1_10)
  if L2_11 ~= SUCCESS then
    return L2_11
  end
  return L2_11, L3_12, L4_13, L5_14, L6_15, L7_16, L8_17, L9_18
end
function dashboardUsersSet(A0_19)
  local L1_20, L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27, L9_28, L10_29, L11_30, L12_31
  L1_20 = A0_19["dashboard.trafficOverview"]
  L2_21 = A0_19["dashboard.discoveredAPs"]
  L3_22 = A0_19["dashboard.optionPorts"]
  L4_23 = A0_19["dashboard.bandwidthUsage"]
  L5_24 = A0_19["dashboard.wlanStatistics"]
  L6_25 = A0_19["dashboard.vpns"]
  L7_26 = A0_19["dashboard.cpuUtilization"]
  L8_27 = A0_19["dashboard.memoryUtilization"]
  L9_28 = A0_19["dashboard.activeInfo"]
  L10_29 = "ipaddr = '"
  L11_30 = SAPI
  L11_30 = L11_30.Request
  L11_30 = L11_30.servervariable
  L12_31 = "REMOTE_ADDR"
  L11_30 = L11_30(L12_31)
  L12_31 = "' AND Cookie = '"
  L10_29 = L10_29 .. L11_30 .. L12_31 .. cgilua.cookies.get("TeamF1Login") .. "'"
  L11_30 = db
  L11_30 = L11_30.getAttributeWhere
  L12_31 = "loginSession"
  L11_30 = L11_30(L12_31, L10_29, "username")
  curCookie = L11_30
  L11_30 = curCookie
  if L11_30 == nil then
    L11_30 = util
    L11_30 = L11_30.appendDebugOut
    L12_31 = "Set : Invalid Cookie"
    L11_30(L12_31)
    L11_30 = _UPVALUE0_
    L11_30 = L11_30.BAD_PARAMETER
    return L11_30
  end
  L11_30, L12_31 = nil, nil
  _UPVALUE1_.start()
  L11_30, L12_31 = _UPVALUE2_.userDashboardCustomizationSet(curCookie, L1_20, L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27, L9_28)
  if L11_30 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page Users " .. L11_30)
    _UPVALUE1_.abort()
    return L11_30, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L12_31
end
function userProfileSet(A0_32)
  local L1_33, L2_34, L3_35, L4_36, L5_37, L6_38, L7_39, L8_40, L9_41, L10_42, L11_43, L12_44, L13_45, L14_46
  L1_33 = ACCESS_LEVEL
  if L1_33 ~= 0 then
    L1_33 = util
    L1_33 = L1_33.appendDebugOut
    L2_34 = "Detected Unauthorized access for page Users"
    L1_33(L2_34)
    L1_33 = _UPVALUE0_
    L1_33 = L1_33.UNAUTHORIZED
    return L1_33
  end
  L1_33 = A0_32["userTable.cookie"]
  L2_34 = A0_32["userTable.userName"]
  L3_35 = A0_32["userTable.firstName"]
  L4_36 = A0_32["userTable.lastName"]
  L5_37 = A0_32["userTable.groupName"]
  L6_38 = A0_32["userTable.password"]
  L7_39 = A0_32["userTable.confirmPassword"]
  L8_40 = A0_32["userTable.curAdminPwd"]
  L9_41 = A0_32["userTable.editPwd"]
  L10_42 = A0_32["userTable.idleTimeout"]
  L11_43 = A0_32["userTable.isPwdChange"]
  L12_44 = A0_32["userTable.multiLogin"]
  if L1_33 == nil then
    L13_45 = util
    L13_45 = L13_45.appendDebugOut
    L14_46 = "Set : Invalid Cookie"
    L13_45(L14_46)
    L13_45 = _UPVALUE0_
    L13_45 = L13_45.BAD_PARAMETER
    return L13_45
  end
  if L2_34 == nil or L3_35 == nil or L4_36 == nil or L5_37 == nil or L9_41 == nil then
    L13_45 = util
    L13_45 = L13_45.appendDebugOut
    L14_46 = "GetNext : Invalid Cookie"
    L13_45(L14_46)
    L13_45 = _UPVALUE0_
    L13_45 = L13_45.BAD_PARAMETER
    return L13_45
  end
  if L9_41 == "1" then
    L13_45 = _UPVALUE0_
    L13_45 = L13_45.NIL
    if L6_38 ~= L13_45 then
      L13_45 = _UPVALUE0_
      L13_45 = L13_45.NIL
      if L7_39 ~= L13_45 then
        L13_45 = _UPVALUE0_
        L13_45 = L13_45.NIL
      end
    elseif L8_40 == L13_45 then
      L13_45 = util
      L13_45 = L13_45.appendDebugOut
      L14_46 = "GetNext : Invalid Cookie"
      L13_45(L14_46)
      L13_45 = _UPVALUE0_
      L13_45 = L13_45.BAD_PARAMETER
      return L13_45
    end
  end
  L13_45, L14_46 = nil, nil
  _UPVALUE1_.start()
  L13_45, L14_46 = _UPVALUE2_.userSet(L1_33, L2_34, L3_35, L4_36, L5_37, L6_38, L10_42, L11_43, L12_44, L9_41, L7_39, L8_40)
  if L13_45 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page Users " .. L13_45)
    _UPVALUE1_.abort()
    return L13_45, L1_33
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L14_46
end
function userProfileCreate(A0_47)
  local L1_48, L2_49, L3_50, L4_51, L5_52, L6_53, L7_54, L8_55, L9_56, L10_57
  L1_48 = ACCESS_LEVEL
  if L1_48 ~= 0 then
    L1_48 = util
    L1_48 = L1_48.appendDebugOut
    L2_49 = "Detected Unauthorized access for page Users"
    L1_48(L2_49)
    L1_48 = _UPVALUE0_
    L1_48 = L1_48.UNAUTHORIZED
    return L1_48
  end
  L1_48 = A0_47["userTable.userName"]
  L2_49 = A0_47["userTable.firstName"]
  L3_50 = A0_47["userTable.lastName"]
  L4_51 = A0_47["userTable.groupName"]
  L5_52 = A0_47["userTable.password"]
  L6_53 = A0_47["userTable.idleTimeout"]
  L7_54 = A0_47["userTable.isPwdChange"]
  L8_55 = A0_47["userTable.multiLogin"]
  if L1_48 == nil or L2_49 == nil or L3_50 == nil or L4_51 == nil or L5_52 == nil then
    L9_56 = util
    L9_56 = L9_56.appendDebugOut
    L10_57 = "GetNext : Invalid Cookie"
    L9_56(L10_57)
    L9_56 = _UPVALUE0_
    L9_56 = L9_56.BAD_PARAMETER
    return L9_56
  end
  L9_56, L10_57 = nil, nil
  _UPVALUE1_.start()
  L9_56, L10_57 = _UPVALUE2_.userCreate(L1_48, L2_49, L3_50, L4_51, L5_52, L6_53, L7_54, L8_55)
  if L9_56 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page Users Page" .. L9_56)
    _UPVALUE1_.abort()
    return L9_56, 0
  end
  L9_56, L10_57 = _UPVALUE2_.dashboardManageUserCreate(L1_48, L4_51)
  if L9_56 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page Users Page" .. L9_56)
    _UPVALUE1_.abort()
    return L9_56, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L10_57
end
function userProfileDelete(A0_58)
  local L1_59, L2_60
  L1_59 = ACCESS_LEVEL
  if L1_59 ~= 0 then
    L1_59 = util
    L1_59 = L1_59.appendDebugOut
    L2_60 = "Detected Unauthorized access for page Users"
    L1_59(L2_60)
    L1_59 = _UPVALUE0_
    L1_59 = L1_59.UNAUTHORIZED
    return L1_59
  end
  L1_59 = A0_58["userTable.cookie"]
  if L1_59 == nil then
    L2_60 = util
    L2_60 = L2_60.appendDebugOut
    L2_60("Delete : Invalid Cookie")
    L2_60 = _UPVALUE0_
    L2_60 = L2_60.BAD_PARAMETER
    return L2_60
  end
  L2_60 = nil
  _UPVALUE1_.start()
  L2_60, cookie = _UPVALUE2_.dashboardManageUserDelete(L1_59)
  if L2_60 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page Users" .. L2_60)
    _UPVALUE1_.abort()
    return L2_60, L1_59
  end
  L2_60, cookie = _UPVALUE2_.userDelete(L1_59)
  if L2_60 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page Users" .. L2_60)
    _UPVALUE1_.abort()
    return L2_60, L1_59
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function userProfileDefaultsGet()
  local L1_61
  L1_61 = _UPVALUE0_
  L1_61 = L1_61.NOT_SUPPORTED
  return L1_61
end
function userProfileGetAll()
  local L0_62, L1_63
  L0_62 = _UPVALUE0_
  L0_62 = L0_62.usersGetAll
  L1_63 = L0_62()
  if L0_62 ~= _UPVALUE1_.SUCCESS then
    return L0_62
  end
  return _UPVALUE1_.SUCCESS, L1_63
end
function userProfileGetRow(A0_64)
  local L1_65, L2_66
  L2_66 = A0_64
  if L2_66 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_65, cookie, userTable = _UPVALUE1_.usersGetRow(L2_66)
  if L1_65 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, cookie, userTable
end
function userProfileDeleteAll(A0_67)
  local L1_68
  L1_68 = ACCESS_LEVEL
  if L1_68 ~= 0 then
    L1_68 = util
    L1_68 = L1_68.appendDebugOut
    L1_68("Detected Unauthorized access for page DUMMY PAGE")
    L1_68 = _UPVALUE0_
    L1_68 = L1_68.UNAUTHORIZED
    return L1_68
  end
  L1_68 = _UPVALUE0_
  L1_68 = L1_68.NIL
  if A0_67 ~= L1_68 then
    L1_68 = #A0_67
  elseif L1_68 == 0 then
    L1_68 = _UPVALUE0_
    L1_68 = L1_68.BAD_PARAMETER
    return L1_68
  end
  L1_68 = nil
  _UPVALUE1_.start()
  L1_68, cookie = _UPVALUE2_.usersDeleteAll(A0_67)
  if L1_68 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page Users" .. L1_68)
    _UPVALUE1_.abort()
    return L1_68
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, 0
end
function userDBUpload(A0_69, A1_70)
  local L2_71, L3_72, L4_73, L5_74, L6_75, L7_76, L8_77, L9_78, L10_79, L11_80, L12_81
  L2_71 = A0_69["GetUsersDb.GetUsersDbFile"]
  L2_71 = L2_71.filesize
  L3_72 = A0_69["GetUsersDb.GetUsersDbFile"]
  L3_72 = L3_72.file
  L4_73 = cgilua
  L4_73 = L4_73.cookies
  L4_73 = L4_73.get
  L5_74 = "TeamF1Login"
  L4_73 = L4_73(L5_74)
  L5_74 = ACCESS_LEVEL
  if L5_74 ~= 0 then
    L5_74 = util
    L5_74 = L5_74.appendDebugOut
    L6_75 = "Detected Unauthorized access for page getUserDb Server"
    L5_74(L6_75)
    L5_74 = _UPVALUE0_
    L5_74 = L5_74.UNAUTHORIZED
    return L5_74
  end
  L5_74 = _UPVALUE1_
  L5_74 = L5_74.start
  L5_74()
  L5_74 = _UPVALUE2_
  L5_74 = L5_74.userDBFileUpload
  L6_75 = A0_69
  L5_74 = L5_74(L6_75, L7_76)
  L6_75 = assert
  L10_79 = L7_76(L8_77, L9_78)
  L6_75 = L6_75(L7_76, L8_77, L9_78, L10_79, L11_80, L12_81, L7_76(L8_77, L9_78))
  for L10_79 in L7_76(L8_77) do
    countComma = L11_80
    for _FORV_14_ in L11_80(L12_81, "\"") do
      countComma = countComma + 1
    end
    if L11_80 == 10 then
      if #util.split(L10_79, ",") == 5 and util.split(L10_79, ",")[5] ~= _UPVALUE0_.NIL and util.split(L10_79, ",")[1] == util.split(L10_79, ",")[1]:gsub("%s+", "") and util.split(L10_79, ",")[2] == util.split(L10_79, ",")[2]:gsub("%s+", "") and util.split(L10_79, ",")[3] == util.split(L10_79, ",")[3]:gsub("%s+", "") and util.split(L10_79, ",")[4] == util.split(L10_79, ",")[4]:gsub("%s+", "") and util.split(L10_79, ",")[5] == util.split(L10_79, ",")[5]:gsub("%s+", "") then
        if util.split(L10_79, ",")[4] ~= _UPVALUE0_.NIL then
        end
      end
    end
  end
  if L5_74 ~= L7_76 then
    L7_76(L8_77)
    L7_76()
    return L5_74
  end
  L7_76()
  L7_76()
  return L5_74
end
function loggedInProfileGetRow()
  local L0_82, L1_83, L2_84
  L0_82, L2_84 = _UPVALUE0_.currentLoggedINSessionGet()
  L0_82, L1_83, userTable = _UPVALUE0_.usersGetRow(L2_84)
  if L0_82 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_83, userTable
end
function userProfileGet(A0_85)
  local L1_86, L2_87
  L2_87 = A0_85
  if L2_87 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_86, cookie, userTable = _UPVALUE1_.userByRowGet(L2_87)
  if L1_86 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, cookie, userTable
end
function isLoginCredChanged(A0_88, A1_89)
  local L2_90
  L2_90 = _UPVALUE0_.isLoginPasswordChanged(A0_88, A1_89)
  if L2_90 == _UPVALUE1_.PASSWORD_CHANGED or L2_90 == _UPVALUE1_.USERNAME_CHANGED then
    return _UPVALUE2_.SUCCESS
  end
  return L2_90
end
function groupNameGet(A0_91)
  local L1_92, L2_93
  L1_92 = _UPVALUE0_
  L1_92 = L1_92.NIL
  if A0_91 == L1_92 then
    L1_92 = _UPVALUE0_
    L1_92 = L1_92.BAD_PARAMETER
    return L1_92
  end
  L1_92 = _UPVALUE1_
  L1_92 = L1_92.getGroupName
  L2_93 = A0_91
  L2_93 = L1_92(L2_93)
  if L1_92 ~= _UPVALUE0_.SUCCESS then
    return L1_92
  end
  return L1_92, L2_93
end
