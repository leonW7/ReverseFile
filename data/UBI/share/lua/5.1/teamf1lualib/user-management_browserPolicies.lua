local L0_0
L0_0 = module
L0_0("com.teamf1.core.user-management.browserpolicies", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/userdb_validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/user-management_groups")
L0_0 = require
L0_0("teamf1lualib/userdb_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
browserpoliciesTable = "AccessControlUserGroupPolicyBrowser"
groupsTable = "UserGroups"
loginPolicyTable = "GroupAccessControl"
attribute = {}
attribute.groupId = "GroupId"
attribute.name = "GroupName"
attribute.description = "Description"
attribute.login = "DenyLogin"
attribute.wanLogin = "DenyLoginFromWan"
attribute.timeOut = "GroupTimeOut"
attribute.lockOut = "LockoutEnable"
attribute.maxLockOut = "MaxLockoutAttempts"
attribute.lockPeriod = "LockPeriod"
attribute.ipLogin = "LoginFromIP"
attribute.browserLogin = "LoginFromBrowser"
attribute.defaultGroup = "DefaultGroup"
attribute.capabilities = "Capabilities"
attribute.browser = "ClientBrowserName"
attribute.browserPolicyType = "LoginFromBrowser"
attribute.policyId = "_ROWID_"
ROWID = "_ROWID_"
FALSE = false
NIL = nil
NAME_MAXLEN = 32
NAME_MINLEN = 0
function policyIdGet()
  local L0_1, L1_2, L2_3
  L0_1 = getFirstCookie
  L1_2 = ROWID
  L2_3 = browserpoliciesTable
  L1_2 = L0_1(L1_2, L2_3)
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.SUCCESS
  if L0_1 ~= L2_3 then
    return L0_1
  end
  L2_3 = L1_2
  return _UPVALUE0_.SUCCESS, L1_2, L2_3
end
function policyIdGetNext(A0_4)
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
  L4_8 = browserpoliciesTable
  L2_6 = L1_5(L2_6, L3_7, L4_8)
  L3_7 = _UPVALUE0_
  L3_7 = L3_7.SUCCESS
  if L1_5 ~= L3_7 then
    return L1_5
  end
  L3_7 = getNextValidCookie
  L4_8 = ROWID
  L5_9 = A0_4
  L4_8 = L3_7(L4_8, L5_9, browserpoliciesTable)
  L5_9 = _UPVALUE0_
  L5_9 = L5_9.SUCCESS
  if L3_7 ~= L5_9 then
    return L3_7
  end
  L5_9 = L4_8
  return _UPVALUE0_.SUCCESS, A0_4, L5_9
end
function policyIdSet(A0_10, A1_11)
  return _UPVALUE0_.NOT_SUPPORTED
end
function policyIdDelete(A0_12, A1_13)
  local L2_14, L3_15, L4_16
  L2_14 = NIL
  if A0_12 == L2_14 then
    L2_14 = _UPVALUE0_
    L2_14 = L2_14.INVALID_ARGUMENT
    return L2_14
  end
  L2_14 = cookieValidate
  L3_15 = ROWID
  L4_16 = A0_12
  L3_15 = L2_14(L3_15, L4_16, browserpoliciesTable)
  L4_16 = _UPVALUE0_
  L4_16 = L4_16.SUCCESS
  if L2_14 ~= L4_16 then
    return L2_14
  end
  L4_16 = db
  L4_16 = L4_16.getAttribute
  L4_16 = L4_16(groupsTable, attribute.policyId, A0_12, attribute.groupId)
  if L4_16 == NIL then
    return _UPVALUE0_.FAILURE, A0_12
  end
  if db.setAttribute(loginPolicyTable, attribute.groupId, L4_16, attribute.browserLogin, _UPVALUE1_) == NIL then
    return _UPVALUE0_.FAILURE, A0_12
  end
  if db.deleteRow(browserpoliciesTable, ROWID, A0_12) == NIL then
    return _UPVALUE0_.FAILURE, A0_12
  end
  return _UPVALUE0_.SUCCESS, A0_12
end
function nameGet()
  local L0_17, L1_18, L2_19, L3_20
  L0_17 = getFirstCookie
  L1_18 = ROWID
  L2_19 = browserpoliciesTable
  L1_18 = L0_17(L1_18, L2_19)
  L2_19 = _UPVALUE0_
  L2_19 = L2_19.SUCCESS
  if L0_17 ~= L2_19 then
    return L0_17
  end
  L2_19 = db
  L2_19 = L2_19.getAttribute
  L3_20 = browserpoliciesTable
  L2_19 = L2_19(L3_20, attribute.policyId, L1_18, attribute.groupId)
  L3_20 = NIL
  if L2_19 == L3_20 then
    L3_20 = _UPVALUE0_
    L3_20 = L3_20.FAILURE
    return L3_20
  end
  L3_20 = db
  L3_20 = L3_20.getAttribute
  L3_20 = L3_20(groupsTable, attribute.groupId, L2_19, attribute.name)
  if L3_20 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_18, L3_20
end
function nameGetNext(A0_21)
  local L1_22, L2_23, L3_24, L4_25, L5_26, L6_27
  L1_22 = NIL
  if A0_21 == L1_22 then
    L1_22 = _UPVALUE0_
    L1_22 = L1_22.INVALID_ARGUMENT
    return L1_22
  end
  L1_22 = cookieValidate
  L2_23 = ROWID
  L3_24 = A0_21
  L4_25 = browserpoliciesTable
  L2_23 = L1_22(L2_23, L3_24, L4_25)
  L3_24 = _UPVALUE0_
  L3_24 = L3_24.SUCCESS
  if L1_22 ~= L3_24 then
    return L1_22
  end
  L3_24 = getNextValidCookie
  L4_25 = ROWID
  L5_26 = A0_21
  L6_27 = browserpoliciesTable
  L4_25 = L3_24(L4_25, L5_26, L6_27)
  L5_26 = _UPVALUE0_
  L5_26 = L5_26.SUCCESS
  if L3_24 ~= L5_26 then
    return L3_24
  end
  L5_26 = db
  L5_26 = L5_26.getAttribute
  L6_27 = browserpoliciesTable
  L5_26 = L5_26(L6_27, attribute.policyId, L4_25, attribute.groupId)
  L6_27 = NIL
  if L5_26 == L6_27 then
    L6_27 = _UPVALUE0_
    L6_27 = L6_27.FAILURE
    return L6_27
  end
  L6_27 = db
  L6_27 = L6_27.getAttribute
  L6_27 = L6_27(groupsTable, attribute.groupId, L5_26, attribute.name)
  if L6_27 == NIL then
    return _UPVALUE0_.FAILURE, A0_21
  end
  return _UPVALUE0_.SUCCESS, L4_25, L6_27
end
function nameSet(A0_28, A1_29)
  return _UPVALUE0_.NOT_SUPPORTED
end
function browserGet()
  local L0_30, L1_31, L2_32
  L0_30 = getFirstCookie
  L1_31 = ROWID
  L2_32 = browserpoliciesTable
  L1_31 = L0_30(L1_31, L2_32)
  L2_32 = _UPVALUE0_
  L2_32 = L2_32.SUCCESS
  if L0_30 ~= L2_32 then
    return L0_30
  end
  L2_32 = db
  L2_32 = L2_32.getAttribute
  L2_32 = L2_32(browserpoliciesTable, attribute.policyId, L1_31, attribute.browser)
  if L2_32 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_31, L2_32
end
function browserGetNext(A0_33)
  local L1_34, L2_35, L3_36, L4_37, L5_38
  L1_34 = NIL
  if A0_33 == L1_34 then
    L1_34 = _UPVALUE0_
    L1_34 = L1_34.INVALID_ARGUMENT
    return L1_34
  end
  L1_34 = cookieValidate
  L2_35 = ROWID
  L3_36 = A0_33
  L4_37 = browserpoliciesTable
  L2_35 = L1_34(L2_35, L3_36, L4_37)
  L3_36 = _UPVALUE0_
  L3_36 = L3_36.SUCCESS
  if L1_34 ~= L3_36 then
    return L1_34
  end
  L3_36 = getNextValidCookie
  L4_37 = ROWID
  L5_38 = A0_33
  L4_37 = L3_36(L4_37, L5_38, browserpoliciesTable)
  L5_38 = _UPVALUE0_
  L5_38 = L5_38.SUCCESS
  if L3_36 ~= L5_38 then
    return L3_36
  end
  L5_38 = db
  L5_38 = L5_38.getAttribute
  L5_38 = L5_38(browserpoliciesTable, attribute.policyId, L4_37, attribute.browser)
  if L5_38 == NIL then
    return _UPVALUE0_.FAILURE, A0_33
  end
  return _UPVALUE0_.SUCCESS, L4_37, L5_38
end
function browserSet(A0_39, A1_40)
  if A0_39 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if cookieValidate(ROWID, A0_39, browserpoliciesTable) ~= _UPVALUE0_.SUCCESS then
    return cookieValidate(ROWID, A0_39, browserpoliciesTable)
  end
  if A1_40 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_40 ~= _UPVALUE1_ and A1_40 ~= _UPVALUE2_ and A1_40 ~= _UPVALUE3_ and A1_40 ~= _UPVALUE4_ and A1_40 ~= _UPVALUE5_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(browserpoliciesTable, attribute.policyId, A0_39, attribute.browser, A1_40) == NIL then
    return _UPVALUE0_.FAILURE, A0_39
  end
  return _UPVALUE0_.SUCCESS, A0_39
end
function policyTypeGet()
  local L0_41, L1_42, L2_43, L3_44
  L0_41 = getFirstCookie
  L1_42 = ROWID
  L2_43 = browserpoliciesTable
  L1_42 = L0_41(L1_42, L2_43)
  L2_43 = _UPVALUE0_
  L2_43 = L2_43.SUCCESS
  if L0_41 ~= L2_43 then
    return L0_41
  end
  L2_43 = db
  L2_43 = L2_43.getAttribute
  L3_44 = browserpoliciesTable
  L2_43 = L2_43(L3_44, attribute.policyId, L1_42, attribute.groupId)
  L3_44 = NIL
  if L2_43 == L3_44 then
    L3_44 = _UPVALUE0_
    L3_44 = L3_44.FAILURE
    return L3_44
  end
  L3_44 = db
  L3_44 = L3_44.getAttribute
  L3_44 = L3_44(loginPolicyTable, attribute.groupId, L2_43, attribute.browserPolicyType)
  if L3_44 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_42, L3_44
end
function policyTypeGetNext(A0_45)
  local L1_46, L2_47, L3_48, L4_49, L5_50, L6_51
  L1_46 = NIL
  if A0_45 == L1_46 then
    L1_46 = _UPVALUE0_
    L1_46 = L1_46.INVALID_ARGUMENT
    return L1_46
  end
  L1_46 = cookieValidate
  L2_47 = ROWID
  L3_48 = A0_45
  L4_49 = browserpoliciesTable
  L2_47 = L1_46(L2_47, L3_48, L4_49)
  L3_48 = _UPVALUE0_
  L3_48 = L3_48.SUCCESS
  if L1_46 ~= L3_48 then
    return L1_46
  end
  L3_48 = getNextValidCookie
  L4_49 = ROWID
  L5_50 = A0_45
  L6_51 = browserpoliciesTable
  L4_49 = L3_48(L4_49, L5_50, L6_51)
  L5_50 = _UPVALUE0_
  L5_50 = L5_50.SUCCESS
  if L3_48 ~= L5_50 then
    return L3_48
  end
  L5_50 = db
  L5_50 = L5_50.getAttribute
  L6_51 = browserpoliciesTable
  L5_50 = L5_50(L6_51, attribute.policyId, L4_49, attribute.groupId)
  L6_51 = NIL
  if L5_50 == L6_51 then
    L6_51 = _UPVALUE0_
    L6_51 = L6_51.FAILURE
    return L6_51
  end
  L6_51 = db
  L6_51 = L6_51.getAttribute
  L6_51 = L6_51(loginPolicyTable, attribute.groupId, L5_50, attribute.browserPolicyType)
  if L6_51 == NIL then
    return _UPVALUE0_.FAILURE, A0_45
  end
  return _UPVALUE0_.SUCCESS, L4_49, L6_51
end
function policyTypeSet(A0_52, A1_53)
  local L2_54, L3_55, L4_56
  L2_54 = NIL
  if A0_52 == L2_54 then
    L2_54 = _UPVALUE0_
    L2_54 = L2_54.INVALID_ARGUMENT
    return L2_54
  end
  L2_54 = cookieValidate
  L3_55 = ROWID
  L4_56 = A0_52
  L3_55 = L2_54(L3_55, L4_56, browserpoliciesTable)
  L4_56 = _UPVALUE0_
  L4_56 = L4_56.SUCCESS
  if L2_54 ~= L4_56 then
    return L2_54
  end
  L4_56 = NIL
  if A1_53 == L4_56 then
    L4_56 = _UPVALUE0_
    L4_56 = L4_56.INVALID_ARGUMENT
    return L4_56
  end
  L4_56 = _UPVALUE1_
  if A1_53 ~= L4_56 then
    L4_56 = _UPVALUE2_
    if A1_53 ~= L4_56 then
      L4_56 = _UPVALUE0_
      L4_56 = L4_56.INVALID_ARGUMENT
      return L4_56
    end
  end
  L4_56 = _UPVALUE1_
  if A1_53 == L4_56 then
    A1_53 = _UPVALUE3_
  else
    L4_56 = _UPVALUE2_
    if A1_53 == L4_56 then
      A1_53 = _UPVALUE4_
    end
  end
  L4_56 = db
  L4_56 = L4_56.getAttribute
  L4_56 = L4_56(browserpoliciesTable, attribute.policyId, A0_52, attribute.groupId)
  if L4_56 == NIL then
    return _UPVALUE0_.FAILURE
  end
  if db.setAttribute(loginPolicyTable, attribute.groupId, L4_56, attribute.browserPolicyType, A1_53) == NIL then
    return _UPVALUE0_.FAILURE, A0_52
  end
  return _UPVALUE0_.SUCCESS, A0_52
end
function browserPolicyGet()
  local L0_57, L1_58, L2_59
  L0_57 = getFirstCookie
  L1_58 = ROWID
  L2_59 = browserpoliciesTable
  L1_58 = L0_57(L1_58, L2_59)
  L2_59 = _UPVALUE0_
  L2_59 = L2_59.SUCCESS
  if L0_57 ~= L2_59 then
    return L0_57
  end
  L2_59 = db
  L2_59 = L2_59.getAttribute
  L2_59 = L2_59(browserpoliciesTable, ROWID, L1_58, attribute.groupId)
  if L2_59 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getRow(browserpoliciesTable, attribute.policyId, L1_58) == NIL then
    return _UPVALUE0_.FAILURE
  end
  if db.getRow(groupsTable, attribute.groupId, L2_59) == NIL then
    return _UPVALUE0_.FAILURE
  end
  if db.getRow(loginPolicyTable, attribute.groupId, L2_59) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_58, db.getRow(browserpoliciesTable, attribute.policyId, L1_58)[browserpoliciesTable .. "." .. attribute.policyId], db.getRow(groupsTable, attribute.groupId, L2_59)[groupsTable .. "." .. attribute.name], db.getRow(browserpoliciesTable, attribute.policyId, L1_58)[browserpoliciesTable .. "." .. attribute.browser], db.getRow(loginPolicyTable, attribute.groupId, L2_59)[loginPolicyTable .. "." .. attribute.browserPolicyType]
end
function browserPolicyGetNext(A0_60)
  local L1_61, L2_62, L3_63, L4_64, L5_65
  L1_61 = NIL
  if A0_60 == L1_61 then
    L1_61 = _UPVALUE0_
    L1_61 = L1_61.INVALID_ARGUMENT
    return L1_61
  end
  L1_61 = cookieValidate
  L2_62 = ROWID
  L3_63 = A0_60
  L4_64 = browserpoliciesTable
  L2_62 = L1_61(L2_62, L3_63, L4_64)
  L3_63 = _UPVALUE0_
  L3_63 = L3_63.SUCCESS
  if L1_61 ~= L3_63 then
    return L1_61
  end
  L3_63 = getNextValidCookie
  L4_64 = ROWID
  L5_65 = A0_60
  L4_64 = L3_63(L4_64, L5_65, browserpoliciesTable)
  L5_65 = _UPVALUE0_
  L5_65 = L5_65.SUCCESS
  if L3_63 ~= L5_65 then
    return L3_63
  end
  L5_65 = db
  L5_65 = L5_65.getAttribute
  L5_65 = L5_65(browserpoliciesTable, ROWID, L4_64, attribute.groupId)
  if L5_65 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getRow(browserpoliciesTable, ROWID, A0_60) == NIL then
    return _UPVALUE0_.FAILURE
  end
  if db.getRow(groupsTable, attribute.groupId, L5_65) == NIL then
    return _UPVALUE0_.FAILURE
  end
  if db.getRow(loginPolicyTable, attribute.groupId, L5_65) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L4_64, db.getRow(browserpoliciesTable, ROWID, A0_60)[browserpoliciesTable .. "." .. attribute.policyId], db.getRow(groupsTable, attribute.groupId, L5_65)[groupsTable .. "." .. attribute.name], db.getRow(browserpoliciesTable, ROWID, A0_60)[browserpoliciesTable .. "." .. attribute.browser], db.getRow(loginPolicyTable, attribute.groupId, L5_65)[loginPolicyTable .. "." .. attribute.browserPolicyType]
end
function browserPolicySet(A0_66, A1_67, A2_68, A3_69, A4_70)
  local L5_71, L6_72, L7_73, L8_74
  L5_71 = NIL
  if A0_66 == L5_71 then
    L5_71 = _UPVALUE0_
    L5_71 = L5_71.INVALID_ARGUMENT
    return L5_71
  end
  L5_71 = NIL
  if A1_67 == L5_71 then
    L5_71 = _UPVALUE1_
    L5_71 = L5_71.BROWSER_POLICY_ID_NIL
    return L5_71
  end
  L5_71 = cookieValidate
  L6_72 = ROWID
  L7_73 = A0_66
  L8_74 = browserpoliciesTable
  L6_72 = L5_71(L6_72, L7_73, L8_74)
  L7_73 = _UPVALUE0_
  L7_73 = L7_73.SUCCESS
  if L5_71 ~= L7_73 then
    return L5_71
  end
  L7_73 = NIL
  if A2_68 == L7_73 or A2_68 == "" then
    L7_73 = _UPVALUE1_
    L7_73 = L7_73.BROWSER_GROUPNAME_NIL
    return L7_73
  end
  L7_73 = string
  L7_73 = L7_73.len
  L8_74 = A2_68
  L7_73 = L7_73(L8_74)
  L8_74 = NAME_MAXLEN
  if not (L7_73 > L8_74) then
    L8_74 = NAME_MINLEN
  elseif L7_73 < L8_74 then
    L8_74 = _UPVALUE1_
    L8_74 = L8_74.BROWSER_GROUPNAME_INVALID
    return L8_74
  end
  L8_74 = NIL
  if A3_69 == L8_74 or A3_69 == "" then
    L8_74 = _UPVALUE1_
    L8_74 = L8_74.BROWSER_NAME_NIL
    return L8_74
  end
  L8_74 = _UPVALUE2_
  if A3_69 ~= L8_74 then
    L8_74 = _UPVALUE3_
    if A3_69 ~= L8_74 then
      L8_74 = _UPVALUE4_
      if A3_69 ~= L8_74 then
        L8_74 = _UPVALUE5_
        if A3_69 ~= L8_74 then
          L8_74 = _UPVALUE6_
          if A3_69 ~= L8_74 then
            L8_74 = _UPVALUE1_
            L8_74 = L8_74.BROWSER_NAME_INVALID
            return L8_74
          end
        end
      end
    end
  end
  L8_74 = NIL
  if A4_70 == L8_74 or A4_70 == "" then
    L8_74 = _UPVALUE1_
    L8_74 = L8_74.BROWSER_POLICY_TYPE_NIL
    return L8_74
  end
  L8_74 = _UPVALUE7_
  if A4_70 ~= L8_74 then
    L8_74 = _UPVALUE8_
    if A4_70 ~= L8_74 then
      L8_74 = _UPVALUE1_
      L8_74 = L8_74.BROWSER_POLICY_TYPE_INVALID
      return L8_74
    end
  end
  L8_74 = db
  L8_74 = L8_74.getAttribute
  L8_74 = L8_74(groupsTable, attribute.name, A2_68, attribute.groupId)
  if L8_74 == NIL then
    return _UPVALUE0_.FAILURE, A0_66
  end
  if db.setAttribute(loginPolicyTable, attribute.groupId, L8_74, attribute.browserPolicyType, A4_70) == NIL then
    return _UPVALUE0_.FAILURE, A0_66
  end
  return _UPVALUE0_.SUCCESS, A0_66
end
function browserPolicyCreate(A0_75, A1_76, A2_77)
  local L3_78, L4_79, L5_80, L6_81, L7_82, L8_83, L9_84
  L3_78 = NIL
  if A1_76 == L3_78 or A1_76 == "" then
    L3_78 = _UPVALUE0_
    L3_78 = L3_78.BROWSER_GROUPNAME_NIL
    return L3_78
  end
  L3_78 = NIL
  if A2_77 == L3_78 or A2_77 == "" then
    L3_78 = _UPVALUE0_
    L3_78 = L3_78.BROWSER_NAME_NIL
    return L3_78
  end
  L3_78 = _UPVALUE1_
  if A2_77 ~= L3_78 then
    L3_78 = _UPVALUE2_
    if A2_77 ~= L3_78 then
      L3_78 = _UPVALUE3_
      if A2_77 ~= L3_78 then
        L3_78 = _UPVALUE4_
        if A2_77 ~= L3_78 then
          L3_78 = _UPVALUE5_
          if A2_77 ~= L3_78 then
            L3_78 = _UPVALUE0_
            L3_78 = L3_78.BROWSER_NAME_INVALID
            return L3_78
          end
        end
      end
    end
  end
  L3_78 = string
  L3_78 = L3_78.len
  L4_79 = A1_76
  L3_78 = L3_78(L4_79)
  L4_79 = NAME_MAXLEN
  if not (L3_78 > L4_79) then
    L4_79 = NAME_MINLEN
  elseif L3_78 < L4_79 then
    L4_79 = _UPVALUE0_
    L4_79 = L4_79.BROWSER_GROUPNAME_INVALID
    return L4_79
  end
  L4_79 = db
  L4_79 = L4_79.getAttribute
  L5_80 = groupsTable
  L6_81 = attribute
  L6_81 = L6_81.name
  L7_82 = A1_76
  L8_83 = attribute
  L8_83 = L8_83.groupId
  L4_79 = L4_79(L5_80, L6_81, L7_82, L8_83)
  L5_80 = NIL
  if L4_79 == L5_80 then
    L5_80 = _UPVALUE0_
    L5_80 = L5_80.BROWSER_GROUPID_INVALID
    return L5_80
  end
  L5_80 = attribute
  L5_80 = L5_80.groupId
  L6_81 = "='"
  L7_82 = L4_79
  L8_83 = "' and "
  L9_84 = attribute
  L9_84 = L9_84.browser
  L5_80 = L5_80 .. L6_81 .. L7_82 .. L8_83 .. L9_84 .. "='" .. A2_77 .. "'"
  L6_81 = db
  L6_81 = L6_81.existsRowWhere
  L7_82 = browserpoliciesTable
  L8_83 = L5_80
  L6_81 = L6_81(L7_82, L8_83)
  if L6_81 then
    L7_82 = _UPVALUE0_
    L7_82 = L7_82.BROWSER_GROUPID_ALREADY_EXISTS
    return L7_82
  end
  L7_82 = {}
  L8_83 = browserpoliciesTable
  L9_84 = "."
  L8_83 = L8_83 .. L9_84 .. attribute.groupId
  L7_82[L8_83] = L4_79
  L8_83 = browserpoliciesTable
  L9_84 = "."
  L8_83 = L8_83 .. L9_84 .. attribute.browser
  L7_82[L8_83] = A2_77
  L8_83 = db
  L8_83 = L8_83.insert
  L9_84 = browserpoliciesTable
  L8_83 = L8_83(L9_84, L7_82)
  L9_84 = NIL
  if L8_83 == L9_84 then
    L9_84 = _UPVALUE6_
    L9_84 = L9_84.FAILURE
    return L9_84
  end
  L9_84 = db
  L9_84 = L9_84.getAttribute
  L9_84 = L9_84(browserpoliciesTable, attribute.groupId, L4_79, ROWID)
  return _UPVALUE6_.SUCCESS, L9_84
end
function browserPolicyDelete(A0_85)
  local L1_86, L2_87, L3_88
  L1_86 = NIL
  if A0_85 == L1_86 then
    L1_86 = _UPVALUE0_
    L1_86 = L1_86.INVALID_ARGUMENT
    return L1_86
  end
  L1_86 = cookieValidate
  L2_87 = ROWID
  L3_88 = A0_85
  L2_87 = L1_86(L2_87, L3_88, browserpoliciesTable)
  L3_88 = _UPVALUE0_
  L3_88 = L3_88.SUCCESS
  if L1_86 ~= L3_88 then
    return L1_86
  end
  L3_88 = db
  L3_88 = L3_88.getAttribute
  L3_88 = L3_88(browserpoliciesTable, attribute.policyId, A0_85, attribute.groupId)
  if L3_88 == NIL then
    return _UPVALUE0_.FAILURE, A0_85
  end
  if db.setAttribute(loginPolicyTable, attribute.groupId, L3_88, attribute.browserLogin, _UPVALUE1_) == NIL then
    return _UPVALUE0_.FAILURE, A0_85
  end
  if db.deleteRow(browserpoliciesTable, ROWID, A0_85) == NIL then
    return _UPVALUE0_.FAILURE, A0_85
  end
  return _UPVALUE0_.SUCCESS, A0_85
end
function allBrowserPolicyDelete(A0_89)
  local L1_90, L2_91, L3_92
  L1_90 = NIL
  if A0_89 == L1_90 then
    L1_90 = _UPVALUE0_
    L1_90 = L1_90.INVALID_ARGUMENT
    return L1_90
  end
  L1_90 = cookieValidate
  L2_91 = ROWID
  L3_92 = A0_89
  L2_91 = L1_90(L2_91, L3_92, browserpoliciesTable)
  L3_92 = _UPVALUE0_
  L3_92 = L3_92.SUCCESS
  if L1_90 ~= L3_92 then
    return L1_90
  end
  L3_92 = db
  L3_92 = L3_92.getAttribute
  L3_92 = L3_92(browserpoliciesTable, attribute.policyId, A0_89, attribute.groupId)
  if L3_92 == NIL then
    return _UPVALUE0_.FAILURE, A0_89
  end
  if db.setAttribute(loginPolicyTable, attribute.groupId, L3_92, attribute.browserLogin, _UPVALUE1_) == NIL then
    return _UPVALUE0_.FAILURE, A0_89
  end
  if db.deleteRow(browserpoliciesTable, ROWID, A0_89) == NIL then
    return _UPVALUE0_.FAILURE, A0_89
  end
  return _UPVALUE0_.SUCCESS, A0_89
end
function groupBrowserPolicyGet(A0_93)
  local L1_94, L2_95, L3_96, L4_97, L5_98, L6_99, L7_100, L8_101, L9_102, L10_103, L11_104, L12_105, L13_106, L14_107
  L1_94 = ""
  L2_95 = _UPVALUE0_
  L2_95 = L2_95.NIL
  if A0_93 == L2_95 then
    L2_95 = _UPVALUE0_
    L2_95 = L2_95.BAD_PARAMETER
    return L2_95
  end
  L2_95 = db
  L2_95 = L2_95.getAttribute
  L3_96 = browserpoliciesTable
  L4_97 = ROWID
  L2_95 = L2_95(L3_96, L4_97, L5_98, L6_99)
  L3_96 = attribute
  L3_96 = L3_96.groupId
  L4_97 = "='"
  L3_96 = L3_96 .. L4_97 .. L5_98 .. L6_99
  L4_97 = db
  L4_97 = L4_97.getRowsWhere
  L4_97 = L4_97(L5_98, L6_99)
  for L8_101, L9_102 in L5_98(L6_99) do
    for L13_106, L14_107 in L10_103(L11_104) do
      if L13_106 == "AccessControlUserGroupPolicyBrowser.ClientBrowserName" then
        if L14_107 == "MSIE" then
          L14_107 = "Internet Explorer"
        end
        L1_94 = L1_94 .. "," .. L14_107
      end
    end
  end
  L1_94 = L5_98
  if L1_94 == L5_98 then
    return L5_98
  end
  return L5_98, L6_99
end
function groupBrowserPolicySelectiveDelete(A0_108, A1_109)
  local L2_110, L3_111
  L2_110 = _UPVALUE0_
  L2_110 = L2_110.NIL
  if A0_108 == L2_110 then
    L2_110 = _UPVALUE0_
    L2_110 = L2_110.BAD_PARAMETER
    return L2_110
  end
  L2_110 = db
  L2_110 = L2_110.getAttribute
  L3_111 = browserpoliciesTable
  L2_110 = L2_110(L3_111, ROWID, A0_108, attribute.groupId)
  L3_111 = attribute
  L3_111 = L3_111.groupId
  L3_111 = L3_111 .. "='" .. L2_110 .. "' and " .. attribute.browser .. "='" .. A1_109 .. "'"
  if db.deleteRowWhere(browserpoliciesTable, L3_111) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function groupBrowserExists(A0_112)
  local L1_113, L2_114
  L1_113 = _UPVALUE0_
  L1_113 = L1_113.NIL
  if A0_112 == L1_113 then
    L1_113 = _UPVALUE0_
    L1_113 = L1_113.BAD_PARAMETER
    return L1_113
  end
  L1_113 = db
  L1_113 = L1_113.getAttribute
  L2_114 = browserpoliciesTable
  L1_113 = L1_113(L2_114, ROWID, A0_112, attribute.groupId)
  L2_114 = _UPVALUE0_
  L2_114 = L2_114.NIL
  if L1_113 == L2_114 then
    L2_114 = _UPVALUE0_
    L2_114 = L2_114.ERROR
    return L2_114
  end
  L2_114 = attribute
  L2_114 = L2_114.groupId
  L2_114 = L2_114 .. "='" .. L1_113 .. "'"
  if #db.getRowsWhere(browserpoliciesTable, L2_114) == 1 then
  end
end
function groupNameGetForBrowser(A0_115)
  local L1_116, L2_117, L3_118
  L1_116 = _UPVALUE0_
  L1_116 = L1_116.NIL
  if A0_115 == L1_116 then
    L1_116 = _UPVALUE0_
    L1_116 = L1_116.BAD_PARAMETER
    return L1_116
  end
  L1_116 = db
  L1_116 = L1_116.getAttribute
  L2_117 = browserpoliciesTable
  L3_118 = ROWID
  L1_116 = L1_116(L2_117, L3_118, A0_115, attribute.groupId)
  L2_117 = attribute
  L2_117 = L2_117.groupId
  L3_118 = "='"
  L2_117 = L2_117 .. L3_118 .. L1_116 .. "'"
  L3_118 = db
  L3_118 = L3_118.getAttributeWhere
  L3_118 = L3_118(groupsTable, L2_117, attribute.name)
  if L3_118 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L3_118
end
function groupGetAll()
  local L0_119, L1_120, L2_121
  L0_119 = db
  L0_119 = L0_119.getTable
  L1_120 = browserpoliciesTable
  L0_119 = L0_119(L1_120)
  L1_120 = db
  L1_120 = L1_120.getTable
  L2_121 = groupsTable
  L1_120 = L1_120(L2_121)
  L2_121 = {}
  rowNum = 1
  for _FORV_6_, _FORV_7_ in pairs(L1_120) do
    if _FORV_7_[groupsTable .. "." .. attribute.name] ~= "Temp-CP" then
      count = 0
      for _FORV_11_, _FORV_12_ in pairs(L0_119) do
        if _FORV_7_[groupsTable .. "." .. attribute.groupId] == _FORV_12_[browserpoliciesTable .. "." .. attribute.groupId] then
          count = 1
        end
      end
      if count == 0 then
        L2_121[rowNum] = {}
        L2_121[rowNum] = _FORV_7_
        rowNum = rowNum + 1
      end
    end
  end
  return _UPVALUE0_.SUCCESS, L2_121
end
