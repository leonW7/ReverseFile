local L0_0
L0_0 = module
L0_0("com.teamf1.core.user-management.networkpolicies", package.seeall)
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
networkpoliciesTable = "AccessControlUserGroupPolicyIPAddress"
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
attribute.policyId = "_ROWID_"
attribute.networkPolicyType = "LoginFromIP"
attribute.addressType = "AddressType"
attribute.address = "Address"
attribute.maskLength = "MaskLength"
FALSE = false
NIL = nil
IPV4_ADDRESS_FAMILY = "2"
ROWID = "_ROWID_"
DISABLED = "0"
ENABLED = "1"
function policyIdGet()
  local L0_1, L1_2, L2_3
  L0_1 = getFirstCookie
  L1_2 = ROWID
  L2_3 = networkpoliciesTable
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
  L2_3 = L2_3(networkpoliciesTable, attribute.groupId, L1_2, attribute.policyId)
  if L2_3 == NIL then
    return _UPVALUE0_.FAILURE
  end
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
  L4_8 = networkpoliciesTable
  L2_6 = L1_5(L2_6, L3_7, L4_8)
  L3_7 = _UPVALUE0_
  L3_7 = L3_7.SUCCESS
  if L1_5 ~= L3_7 then
    return L1_5
  end
  L3_7 = getNextValidCookie
  L4_8 = ROWID
  L5_9 = A0_4
  L4_8 = L3_7(L4_8, L5_9, networkpoliciesTable)
  L5_9 = _UPVALUE0_
  L5_9 = L5_9.SUCCESS
  if L3_7 ~= L5_9 then
    return L3_7
  end
  L5_9 = L4_8
  return _UPVALUE0_.SUCCESS, L4_8, L5_9
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
  L3_15 = L2_14(L3_15, L4_16, networkpoliciesTable)
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
  if db.setAttribute(loginPolicyTable, attribute.groupId, L4_16, attribute.loginPolicy, loginPolicy) == NIL then
    return _UPVALUE0_.FAILURE, A0_12
  end
  if db.deleteRow(networkpoliciesTable, ROWID, A0_12) == NIL then
    return _UPVALUE0_.FAILURE, A0_12
  end
  return _UPVALUE0_.SUCCESS, A0_12
end
function nameGet()
  local L0_17, L1_18, L2_19, L3_20
  L0_17 = getFirstCookie
  L1_18 = ROWID
  L2_19 = networkpoliciesTable
  L1_18 = L0_17(L1_18, L2_19)
  L2_19 = _UPVALUE0_
  L2_19 = L2_19.SUCCESS
  if L0_17 ~= L2_19 then
    L2_19 = _UPVALUE0_
    L2_19 = L2_19.NOT_EXIST
    return L2_19
  end
  L2_19 = db
  L2_19 = L2_19.getAttribute
  L3_20 = networkpoliciesTable
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
  L4_25 = networkpoliciesTable
  L2_23 = L1_22(L2_23, L3_24, L4_25)
  L3_24 = _UPVALUE0_
  L3_24 = L3_24.SUCCESS
  if L1_22 ~= L3_24 then
    return L1_22
  end
  L3_24 = getNextValidCookie
  L4_25 = ROWID
  L5_26 = A0_21
  L6_27 = networkpoliciesTable
  L4_25 = L3_24(L4_25, L5_26, L6_27)
  L5_26 = _UPVALUE0_
  L5_26 = L5_26.SUCCESS
  if L3_24 ~= L5_26 then
    return L3_24
  end
  L5_26 = db
  L5_26 = L5_26.getAttribute
  L6_27 = networkpoliciesTable
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
function policyTypeGet()
  local L0_30, L1_31, L2_32, L3_33
  L0_30 = getFirstCookie
  L1_31 = ROWID
  L2_32 = networkpoliciesTable
  L1_31 = L0_30(L1_31, L2_32)
  L2_32 = _UPVALUE0_
  L2_32 = L2_32.SUCCESS
  if L0_30 ~= L2_32 then
    L2_32 = _UPVALUE0_
    L2_32 = L2_32.NOT_EXIST
    return L2_32
  end
  L2_32 = db
  L2_32 = L2_32.getAttribute
  L3_33 = networkpoliciesTable
  L2_32 = L2_32(L3_33, attribute.policyId, L1_31, attribute.groupId)
  L3_33 = NIL
  if L2_32 == L3_33 then
    L3_33 = _UPVALUE0_
    L3_33 = L3_33.FAILURE
    return L3_33
  end
  L3_33 = db
  L3_33 = L3_33.getAttribute
  L3_33 = L3_33(loginPolicyTable, attribute.groupId, L2_32, attribute.networkPolicyType)
  if L3_33 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_31, L3_33
end
function policyTypeGetNext(A0_34)
  local L1_35, L2_36, L3_37, L4_38, L5_39, L6_40
  L1_35 = NIL
  if A0_34 == L1_35 then
    L1_35 = _UPVALUE0_
    L1_35 = L1_35.INVALID_ARGUMENT
    return L1_35
  end
  L1_35 = cookieValidate
  L2_36 = ROWID
  L3_37 = A0_34
  L4_38 = networkpoliciesTable
  L2_36 = L1_35(L2_36, L3_37, L4_38)
  L3_37 = _UPVALUE0_
  L3_37 = L3_37.SUCCESS
  if L1_35 ~= L3_37 then
    return L1_35
  end
  L3_37 = getNextValidCookie
  L4_38 = ROWID
  L5_39 = A0_34
  L6_40 = networkpoliciesTable
  L4_38 = L3_37(L4_38, L5_39, L6_40)
  L5_39 = _UPVALUE0_
  L5_39 = L5_39.SUCCESS
  if L3_37 ~= L5_39 then
    return L3_37
  end
  L5_39 = db
  L5_39 = L5_39.getAttribute
  L6_40 = networkpoliciesTable
  L5_39 = L5_39(L6_40, attribute.policyId, L4_38, attribute.groupId)
  L6_40 = NIL
  if L5_39 == L6_40 then
    L6_40 = _UPVALUE0_
    L6_40 = L6_40.FAILURE
    return L6_40
  end
  L6_40 = db
  L6_40 = L6_40.getAttribute
  L6_40 = L6_40(loginPolicyTable, attribute.groupId, L5_39, attribute.networkPolicyType)
  if L6_40 == NIL then
    return _UPVALUE0_.FAILURE, A0_34
  end
  return _UPVALUE0_.SUCCESS, L4_38, L6_40
end
function policyTypeSet(A0_41, A1_42)
  local L2_43, L3_44, L4_45
  L2_43 = NIL
  if A0_41 == L2_43 then
    L2_43 = _UPVALUE0_
    L2_43 = L2_43.INVALID_ARGUMENT
    return L2_43
  end
  L2_43 = cookieValidate
  L3_44 = ROWID
  L4_45 = A0_41
  L3_44 = L2_43(L3_44, L4_45, networkpoliciesTable)
  L4_45 = _UPVALUE0_
  L4_45 = L4_45.SUCCESS
  if L2_43 ~= L4_45 then
    return L2_43
  end
  L4_45 = NIL
  if A1_42 == L4_45 then
    L4_45 = _UPVALUE0_
    L4_45 = L4_45.INVALID_ARGUMENT
    return L4_45
  end
  L4_45 = _UPVALUE1_
  if A1_42 ~= L4_45 then
    L4_45 = _UPVALUE2_
    if A1_42 ~= L4_45 then
      L4_45 = _UPVALUE0_
      L4_45 = L4_45.INVALID_ARGUMENT
      return L4_45
    end
  end
  L4_45 = db
  L4_45 = L4_45.getAttribute
  L4_45 = L4_45(networkpoliciesTable, attribute.policyId, A0_41, attribute.groupId)
  if L4_45 == NIL then
    return _UPVALUE0_.FAILURE
  end
  if db.setAttribute(loginPolicyTable, attribute.groupId, L4_45, attribute.networkPolicyType, A1_42) == NIL then
    return _UPVALUE0_.FAILURE, A0_41
  end
  return _UPVALUE0_.SUCCESS, A0_41
end
function addressTypeGet()
  local L0_46, L1_47, L2_48
  L0_46 = getFirstCookie
  L1_47 = ROWID
  L2_48 = networkpoliciesTable
  L1_47 = L0_46(L1_47, L2_48)
  L2_48 = _UPVALUE0_
  L2_48 = L2_48.SUCCESS
  if L0_46 ~= L2_48 then
    L2_48 = _UPVALUE0_
    L2_48 = L2_48.NOT_EXIST
    return L2_48
  end
  L2_48 = db
  L2_48 = L2_48.getAttribute
  L2_48 = L2_48(networkpoliciesTable, attribute.policyId, L1_47, attribute.addressType)
  if L2_48 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_47, L2_48
end
function addressTypeGetNext(A0_49)
  local L1_50, L2_51, L3_52, L4_53, L5_54
  L1_50 = NIL
  if A0_49 == L1_50 then
    L1_50 = _UPVALUE0_
    L1_50 = L1_50.INVALID_ARGUMENT
    return L1_50
  end
  L1_50 = cookieValidate
  L2_51 = ROWID
  L3_52 = A0_49
  L4_53 = networkpoliciesTable
  L2_51 = L1_50(L2_51, L3_52, L4_53)
  L3_52 = _UPVALUE0_
  L3_52 = L3_52.SUCCESS
  if L1_50 ~= L3_52 then
    return L1_50
  end
  L3_52 = getNextValidCookie
  L4_53 = ROWID
  L5_54 = A0_49
  L4_53 = L3_52(L4_53, L5_54, networkpoliciesTable)
  L5_54 = _UPVALUE0_
  L5_54 = L5_54.SUCCESS
  if L3_52 ~= L5_54 then
    return L3_52
  end
  L5_54 = db
  L5_54 = L5_54.getAttribute
  L5_54 = L5_54(networkpoliciesTable, attribute.policyId, L4_53, attribute.addressType)
  if L5_54 == NIL then
    return _UPVALUE0_.FAILURE, A0_49
  end
  return _UPVALUE0_.SUCCESS, L4_53, L5_54
end
function addressTypeSet(A0_55, A1_56)
  if A0_55 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if cookieValidate(ROWID, A0_55, networkpoliciesTable) ~= _UPVALUE0_.SUCCESS then
    return cookieValidate(ROWID, A0_55, networkpoliciesTable)
  end
  if A1_56 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_56 ~= _UPVALUE1_ and A1_56 ~= _UPVALUE2_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(networkpoliciesTable, attribute.policyId, A0_55, attribute.addressType, A1_56) == NIL then
    return _UPVALUE0_.FAILURE, A0_55
  end
  return _UPVALUE0_.SUCCESS, A0_55
end
function addressGet()
  local L0_57, L1_58, L2_59
  L0_57 = getFirstCookie
  L1_58 = ROWID
  L2_59 = networkpoliciesTable
  L1_58 = L0_57(L1_58, L2_59)
  L2_59 = _UPVALUE0_
  L2_59 = L2_59.SUCCESS
  if L0_57 ~= L2_59 then
    L2_59 = _UPVALUE0_
    L2_59 = L2_59.NOT_EXIST
    return L2_59
  end
  L2_59 = db
  L2_59 = L2_59.getAttribute
  L2_59 = L2_59(networkpoliciesTable, ROWID, L1_58, attribute.address)
  if L2_59 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_58, L2_59
end
function addressGetNext(A0_60)
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
  L4_64 = networkpoliciesTable
  L2_62 = L1_61(L2_62, L3_63, L4_64)
  L3_63 = _UPVALUE0_
  L3_63 = L3_63.SUCCESS
  if L1_61 ~= L3_63 then
    return L1_61
  end
  L3_63 = getNextValidCookie
  L4_64 = ROWID
  L5_65 = A0_60
  L4_64 = L3_63(L4_64, L5_65, networkpoliciesTable)
  L5_65 = _UPVALUE0_
  L5_65 = L5_65.SUCCESS
  if L3_63 ~= L5_65 then
    return L3_63
  end
  L5_65 = db
  L5_65 = L5_65.getAttribute
  L5_65 = L5_65(networkpoliciesTable, ROWID, L4_64, attribute.address)
  if L5_65 == NIL then
    return _UPVALUE0_.FAILURE, A0_60
  end
  return _UPVALUE0_.SUCCESS, L4_64, L5_65
end
function addressSet(A0_66, A1_67)
  if A0_66 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if cookieValidate(ROWID, A0_66, networkpoliciesTable) ~= _UPVALUE0_.SUCCESS then
    return cookieValidate(ROWID, A0_66, networkpoliciesTable)
  end
  if A1_67 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck(IPV4_ADDRESS_FAMILY, A1_67)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(networkpoliciesTable, attribute.policyId, A0_66, attribute.address, A1_67) == NIL then
    return _UPVALUE0_.FAILURE, A0_66
  end
  return _UPVALUE0_.SUCCESS, A0_66
end
function maskLengthGet()
  local L0_68, L1_69, L2_70
  L0_68 = getFirstCookie
  L1_69 = ROWID
  L2_70 = networkpoliciesTable
  L1_69 = L0_68(L1_69, L2_70)
  L2_70 = _UPVALUE0_
  L2_70 = L2_70.SUCCESS
  if L0_68 ~= L2_70 then
    L2_70 = _UPVALUE0_
    L2_70 = L2_70.NOT_EXIST
    return L2_70
  end
  L2_70 = db
  L2_70 = L2_70.getAttribute
  L2_70 = L2_70(networkpoliciesTable, ROWID, L1_69, attribute.maskLength)
  if L2_70 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_69, L2_70
end
function maskLengthGetNext(A0_71)
  local L1_72, L2_73, L3_74, L4_75, L5_76
  L1_72 = NIL
  if A0_71 == L1_72 then
    L1_72 = _UPVALUE0_
    L1_72 = L1_72.INVALID_ARGUMENT
    return L1_72
  end
  L1_72 = cookieValidate
  L2_73 = ROWID
  L3_74 = A0_71
  L4_75 = networkpoliciesTable
  L2_73 = L1_72(L2_73, L3_74, L4_75)
  L3_74 = _UPVALUE0_
  L3_74 = L3_74.SUCCESS
  if L1_72 ~= L3_74 then
    return L1_72
  end
  L3_74 = getNextValidCookie
  L4_75 = ROWID
  L5_76 = A0_71
  L4_75 = L3_74(L4_75, L5_76, networkpoliciesTable)
  L5_76 = _UPVALUE0_
  L5_76 = L5_76.SUCCESS
  if L3_74 ~= L5_76 then
    return L3_74
  end
  L5_76 = db
  L5_76 = L5_76.getAttribute
  L5_76 = L5_76(networkpoliciesTable, ROWID, L4_75, attribute.maskLength)
  if L5_76 == NIL then
    return _UPVALUE0_.FAILURE, A0_71
  end
  return _UPVALUE0_.SUCCESS, L4_75, L5_76
end
function maskLengthSet(A0_77, A1_78)
  if A0_77 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if cookieValidate(ROWID, A0_77, networkpoliciesTable) ~= _UPVALUE0_.SUCCESS then
    return cookieValidate(ROWID, A0_77, networkpoliciesTable)
  end
  if A1_78 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck(IPV4_ADDRESS_FAMILY, A1_78)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(networkpoliciesTable, attribute.policyId, A0_77, attribute.maskLength, A1_78) == NIL then
    return _UPVALUE0_.FAILURE, A0_77
  end
  return _UPVALUE0_.SUCCESS, A0_77
end
function networkPolicyGet()
  local L0_79, L1_80, L2_81
  L0_79 = getFirstCookie
  L1_80 = ROWID
  L2_81 = networkpoliciesTable
  L1_80 = L0_79(L1_80, L2_81)
  L2_81 = _UPVALUE0_
  L2_81 = L2_81.SUCCESS
  if L0_79 ~= L2_81 then
    L2_81 = _UPVALUE0_
    L2_81 = L2_81.NOT_EXIST
    return L2_81
  end
  L2_81 = db
  L2_81 = L2_81.getAttribute
  L2_81 = L2_81(networkpoliciesTable, ROWID, L1_80, attribute.groupId)
  if L2_81 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getRow(networkpoliciesTable, attribute.policyId, L1_80) == NIL then
    return _UPVALUE0_.FAILURE
  end
  if db.getRow(groupsTable, attribute.policyId, L2_81) == NIL then
    return _UPVALUE0_.FAILURE
  end
  if db.getRow(loginPolicyTable, attribute.policyId, L2_81) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_80, L1_80, db.getRow(groupsTable, attribute.policyId, L2_81)[groupsTable .. "." .. attribute.name], db.getRow(loginPolicyTable, attribute.policyId, L2_81)[loginPolicyTable .. "." .. attribute.networkPolicyType], db.getRow(networkpoliciesTable, attribute.policyId, L1_80)[networkpoliciesTable .. "." .. attribute.addressType], db.getRow(networkpoliciesTable, attribute.policyId, L1_80)[networkpoliciesTable .. "." .. attribute.address], db.getRow(networkpoliciesTable, attribute.policyId, L1_80)[networkpoliciesTable .. "." .. attribute.maskLength]
end
function networkPolicyGetNext(A0_82)
  local L1_83, L2_84, L3_85, L4_86, L5_87
  L1_83 = NIL
  if A0_82 == L1_83 then
    L1_83 = _UPVALUE0_
    L1_83 = L1_83.INVALID_ARGUMENT
    return L1_83
  end
  L1_83 = cookieValidate
  L2_84 = ROWID
  L3_85 = A0_82
  L4_86 = networkpoliciesTable
  L2_84 = L1_83(L2_84, L3_85, L4_86)
  L3_85 = _UPVALUE0_
  L3_85 = L3_85.SUCCESS
  if L1_83 ~= L3_85 then
    return L1_83
  end
  L3_85 = getNextValidCookie
  L4_86 = ROWID
  L5_87 = A0_82
  L4_86 = L3_85(L4_86, L5_87, networkpoliciesTable)
  L5_87 = _UPVALUE0_
  L5_87 = L5_87.SUCCESS
  if L3_85 ~= L5_87 then
    return L3_85
  end
  L5_87 = db
  L5_87 = L5_87.getAttribute
  L5_87 = L5_87(networkpoliciesTable, ROWID, L4_86, attribute.groupId)
  if L5_87 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getRow(networkpoliciesTable, attribute.policyId, L4_86) == NIL then
    return _UPVALUE0_.FAILURE
  end
  if db.getRow(groupsTable, attribute.policyId, L5_87) == NIL then
    return _UPVALUE0_.FAILURE
  end
  if db.getRow(loginPolicyTable, attribute.policyId, L5_87) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L4_86, L4_86, db.getRow(groupsTable, attribute.policyId, L5_87)[groupsTable .. "." .. attribute.name], db.getRow(loginPolicyTable, attribute.policyId, L5_87)[loginPolicyTable .. "." .. attribute.networkPolicyType], db.getRow(networkpoliciesTable, attribute.policyId, L4_86)[networkpoliciesTable .. "." .. attribute.addressType], db.getRow(networkpoliciesTable, attribute.policyId, L4_86)[networkpoliciesTable .. "." .. attribute.address], db.getRow(networkpoliciesTable, attribute.policyId, L4_86)[networkpoliciesTable .. "." .. attribute.maskLength]
end
function networkPolicySet(A0_88, A1_89, A2_90, A3_91, A4_92, A5_93, A6_94)
  local L7_95, L8_96, L9_97
  L7_95 = NIL
  if A0_88 == L7_95 then
    L7_95 = _UPVALUE0_
    L7_95 = L7_95.INVALID_ARGUMENT
    return L7_95
  end
  L7_95 = cookieValidate
  L8_96 = ROWID
  L9_97 = A0_88
  L8_96 = L7_95(L8_96, L9_97, networkpoliciesTable)
  L9_97 = _UPVALUE0_
  L9_97 = L9_97.SUCCESS
  if L7_95 ~= L9_97 then
    return L7_95
  end
  L9_97 = NIL
  if A2_90 == L9_97 or A2_90 == "" then
    L9_97 = _UPVALUE1_
    L9_97 = L9_97.NETWORK_GROUPNAME_NIL
    return L9_97
  end
  L9_97 = NIL
  if A3_91 == L9_97 or A3_91 == "" then
    L9_97 = _UPVALUE1_
    L9_97 = L9_97.NETWORK_POLICY_TYPE_NIL
    return L9_97
  end
  L9_97 = _UPVALUE2_
  if A3_91 ~= L9_97 then
    L9_97 = _UPVALUE3_
    if A3_91 ~= L9_97 then
      L9_97 = _UPVALUE1_
      L9_97 = L9_97.NETWORK_POLICY_TYPE_INVALID
      return L9_97
    end
  end
  L9_97 = NIL
  if A4_92 == L9_97 or A4_92 == "" then
    L9_97 = _UPVALUE1_
    L9_97 = L9_97.NETWORK_ADDRESS_TYPE_NIL
    return L9_97
  end
  L9_97 = _UPVALUE4_
  if A4_92 ~= L9_97 then
    L9_97 = _UPVALUE5_
    if A4_92 ~= L9_97 then
      L9_97 = _UPVALUE1_
      L9_97 = L9_97.NETWORK_ADDRESS_TYPE_INVALID
      return L9_97
    end
  end
  L9_97 = NIL
  if A5_93 == L9_97 or A5_93 == "" then
    L9_97 = _UPVALUE1_
    L9_97 = L9_97.NETWORK_ADDRESS_NIL
    return L9_97
  end
  L9_97 = _UPVALUE6_
  L9_97 = L9_97.ipAddressCheck
  L9_97 = L9_97(IPV4_ADDRESS_FAMILY, A5_93)
  valid = L9_97
  L9_97 = valid
  if L9_97 ~= _UPVALUE0_.SUCCESS then
    L9_97 = _UPVALUE1_
    L9_97 = L9_97.NETWORK_ADDRESS_INVALID
    return L9_97
  end
  L9_97 = db
  L9_97 = L9_97.getAttribute
  L9_97 = L9_97(groupsTable, attribute.name, A2_90, attribute.groupId)
  if L9_97 == NIL then
    return _UPVALUE0_.FAILURE, A1_89
  end
  if A6_94 ~= NIL and A6_94 ~= "" then
    if tonumber(A6_94) < _UPVALUE7_ or tonumber(A6_94) > _UPVALUE8_ then
      return _UPVALUE1_.NETWORK_MASKLENGTH_INVALID
    end
  elseif (A6_94 == NIL or A6_94 == "") and A4_92 == _UPVALUE9_ then
    A6_94 = _UPVALUE8_
  end
  if db.setAttribute(loginPolicyTable, attribute.groupId, L9_97, attribute.networkPolicyType, A3_91) == NIL then
    return _UPVALUE0_.FAILURE, A0_88
  end
  return _UPVALUE0_.SUCCESS, A0_88
end
function networkPolicyCreate(A0_98, A1_99, A2_100, A3_101, A4_102)
  local L5_103, L6_104, L7_105, L8_106, L9_107, L10_108
  L5_103 = NIL
  if A1_99 == L5_103 or A1_99 == "" then
    L5_103 = _UPVALUE0_
    L5_103 = L5_103.NETWORK_GROUPNAME_NIL
    return L5_103
  end
  L5_103 = NIL
  if A2_100 == L5_103 or A2_100 == "" then
    L5_103 = _UPVALUE0_
    L5_103 = L5_103.NETWORK_ADDRESS_TYPE_NIL
    return L5_103
  end
  L5_103 = _UPVALUE1_
  if A2_100 ~= L5_103 then
    L5_103 = _UPVALUE2_
    if A2_100 ~= L5_103 then
      L5_103 = _UPVALUE0_
      L5_103 = L5_103.NETWORK_ADDRESS_INVALID
      return L5_103
    end
  end
  L5_103 = NIL
  if A3_101 == L5_103 or A3_101 == "" then
    L5_103 = _UPVALUE0_
    L5_103 = L5_103.NETWORK_ADDRESS_NIL
    return L5_103
  end
  L5_103 = _UPVALUE3_
  L5_103 = L5_103.ipAddressCheck
  L6_104 = IPV4_ADDRESS_FAMILY
  L7_105 = A3_101
  L5_103 = L5_103(L6_104, L7_105)
  valid = L5_103
  L5_103 = valid
  L6_104 = _UPVALUE4_
  L6_104 = L6_104.SUCCESS
  if L5_103 ~= L6_104 then
    L5_103 = _UPVALUE0_
    L5_103 = L5_103.NETWORK_ADDRESS_INVALID
    return L5_103
  end
  L5_103 = db
  L5_103 = L5_103.getAttribute
  L6_104 = groupsTable
  L7_105 = attribute
  L7_105 = L7_105.name
  L8_106 = A1_99
  L9_107 = attribute
  L9_107 = L9_107.groupId
  L5_103 = L5_103(L6_104, L7_105, L8_106, L9_107)
  L6_104 = NIL
  if L5_103 == L6_104 then
    L6_104 = _UPVALUE0_
    L6_104 = L6_104.NETWORK_GROUPID_INVALID
    L7_105 = A0_98
    return L6_104, L7_105
  end
  L6_104 = NIL
  if A4_102 ~= L6_104 and A4_102 ~= "" then
    L6_104 = tonumber
    L7_105 = A4_102
    L6_104 = L6_104(L7_105)
    L7_105 = _UPVALUE5_
    if not (L6_104 < L7_105) then
      L6_104 = tonumber
      L7_105 = A4_102
      L6_104 = L6_104(L7_105)
      L7_105 = _UPVALUE6_
    elseif L6_104 > L7_105 then
      L6_104 = _UPVALUE0_
      L6_104 = L6_104.NETWORK_MASKLENGTH_INVALID
      return L6_104
    end
  else
    L6_104 = NIL
    if A4_102 == L6_104 or A4_102 == "" then
      L6_104 = _UPVALUE7_
      if A2_100 == L6_104 then
        A4_102 = _UPVALUE6_
      end
    end
  end
  L6_104 = attribute
  L6_104 = L6_104.groupId
  L7_105 = "='"
  L8_106 = L5_103
  L9_107 = "' and "
  L10_108 = attribute
  L10_108 = L10_108.addressType
  L6_104 = L6_104 .. L7_105 .. L8_106 .. L9_107 .. L10_108 .. "='" .. A2_100 .. "' and " .. attribute.address .. "='" .. A3_101 .. "' and " .. attribute.maskLength .. "='" .. A4_102 .. "'"
  L7_105 = db
  L7_105 = L7_105.existsRowWhere
  L8_106 = networkpoliciesTable
  L9_107 = L6_104
  L7_105 = L7_105(L8_106, L9_107)
  if L7_105 then
    L8_106 = _UPVALUE0_
    L8_106 = L8_106.NETWORK_POLICY_EXISTS
    return L8_106
  end
  L8_106 = attribute
  L8_106 = L8_106.groupId
  L9_107 = "='"
  L10_108 = L5_103
  L6_104 = L8_106 .. L9_107 .. L10_108 .. "' and " .. attribute.address .. "='" .. A3_101 .. "'"
  L8_106 = db
  L8_106 = L8_106.existsRowWhere
  L9_107 = networkpoliciesTable
  L10_108 = L6_104
  L8_106 = L8_106(L9_107, L10_108)
  L7_105 = L8_106
  if L7_105 then
    L8_106 = _UPVALUE0_
    L8_106 = L8_106.NETWORK_POLICY_EXISTS
    return L8_106
  end
  L8_106 = {}
  L9_107 = networkpoliciesTable
  L10_108 = "."
  L9_107 = L9_107 .. L10_108 .. attribute.groupId
  L8_106[L9_107] = L5_103
  L9_107 = networkpoliciesTable
  L10_108 = "."
  L9_107 = L9_107 .. L10_108 .. attribute.addressType
  L8_106[L9_107] = A2_100
  L9_107 = networkpoliciesTable
  L10_108 = "."
  L9_107 = L9_107 .. L10_108 .. attribute.address
  L8_106[L9_107] = A3_101
  L9_107 = networkpoliciesTable
  L10_108 = "."
  L9_107 = L9_107 .. L10_108 .. attribute.maskLength
  L8_106[L9_107] = A4_102
  L9_107 = db
  L9_107 = L9_107.insert
  L10_108 = networkpoliciesTable
  L9_107 = L9_107(L10_108, L8_106, L5_103)
  L10_108 = NIL
  if L9_107 == L10_108 then
    L10_108 = _UPVALUE4_
    L10_108 = L10_108.FAILURE
    return L10_108
  end
  L10_108 = db
  L10_108 = L10_108.getAttribute
  L10_108 = L10_108(networkpoliciesTable, attribute.groupId, L5_103, ROWID)
  if L10_108 == NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L10_108
end
function networkPolicyDelete(A0_109)
  local L1_110, L2_111, L3_112
  L1_110 = NIL
  if A0_109 == L1_110 then
    L1_110 = _UPVALUE0_
    L1_110 = L1_110.INVALID_ARGUMENT
    return L1_110
  end
  L1_110 = cookieValidate
  L2_111 = ROWID
  L3_112 = A0_109
  L2_111 = L1_110(L2_111, L3_112, networkpoliciesTable)
  L3_112 = _UPVALUE0_
  L3_112 = L3_112.SUCCESS
  if L1_110 ~= L3_112 then
    return L1_110
  end
  L3_112 = db
  L3_112 = L3_112.getAttribute
  L3_112 = L3_112(networkpoliciesTable, attribute.policyId, A0_109, attribute.groupId)
  if L3_112 == NIL then
    return _UPVALUE1_.NETWORK_GROUPID_INVALID, A0_109
  end
  if db.setAttribute(loginPolicyTable, attribute.groupId, L3_112, attribute.networkPolicyType, _UPVALUE2_) == NIL then
    return _UPVALUE0_.FAILURE, A0_109
  end
  if db.deleteRow(networkpoliciesTable, attribute.policyId, A0_109) == NIL then
    return _UPVALUE0_.FAILURE, A0_109
  end
  return _UPVALUE0_.SUCCESS, A0_109
end
function groupIpPolicyGet(A0_113)
  local L1_114, L2_115, L3_116, L4_117
  L1_114 = _UPVALUE0_
  L1_114 = L1_114.NIL
  if A0_113 == L1_114 then
    L1_114 = _UPVALUE0_
    L1_114 = L1_114.BAD_PARAMETER
    return L1_114
  end
  L1_114 = db
  L1_114 = L1_114.getAttribute
  L2_115 = networkpoliciesTable
  L3_116 = ROWID
  L4_117 = A0_113
  L1_114 = L1_114(L2_115, L3_116, L4_117, attribute.groupId)
  L2_115 = attribute
  L2_115 = L2_115.groupId
  L3_116 = "='"
  L4_117 = L1_114
  L2_115 = L2_115 .. L3_116 .. L4_117 .. "'"
  L3_116 = db
  L3_116 = L3_116.getRowsWhere
  L4_117 = networkpoliciesTable
  L3_116 = L3_116(L4_117, L2_115)
  L4_117 = ""
  for _FORV_8_, _FORV_9_ in pairs(L3_116) do
    L4_117 = L4_117 .. "," .. _FORV_9_[networkpoliciesTable .. "." .. attribute.address]
    if _FORV_9_[networkpoliciesTable .. "." .. attribute.addressType] == "1" then
      L4_117 = L4_117 .. "/" .. _FORV_9_[networkpoliciesTable .. "." .. attribute.maskLength]
    end
  end
  L4_117 = string.sub(L4_117, 2)
  if L4_117 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L4_117
end
function groupIpPolicySelectiveDelete(A0_118, A1_119)
  local L2_120, L3_121, L4_122
  L2_120 = _UPVALUE0_
  L2_120 = L2_120.NIL
  if A0_118 == L2_120 then
    L2_120 = _UPVALUE0_
    L2_120 = L2_120.BAD_PARAMETER
    return L2_120
  end
  L2_120 = _UPVALUE0_
  L2_120 = L2_120.NIL
  if A1_119 == L2_120 then
    L2_120 = _UPVALUE0_
    L2_120 = L2_120.BAD_PARAMETER
    return L2_120
  end
  L2_120 = db
  L2_120 = L2_120.getAttribute
  L3_121 = networkpoliciesTable
  L4_122 = ROWID
  L2_120 = L2_120(L3_121, L4_122, A0_118, attribute.groupId)
  L3_121 = util
  L3_121 = L3_121.split
  L4_122 = A1_119
  L3_121 = L3_121(L4_122, "/")
  L4_122 = nil
  if L3_121[2] == _UPVALUE0_.NIL then
    L4_122 = attribute.groupId .. "='" .. L2_120 .. "' and " .. attribute.address .. "='" .. L3_121[1] .. "' and " .. attribute.addressType .. "='0'"
  else
    L4_122 = attribute.groupId .. "='" .. L2_120 .. "' and " .. attribute.address .. "='" .. L3_121[1] .. "' and " .. attribute.addressType .. "='1'"
  end
  if db.deleteRowWhere(networkpoliciesTable, L4_122) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function groupNameGetForIpPolicy(A0_123)
  local L1_124, L2_125, L3_126
  L1_124 = _UPVALUE0_
  L1_124 = L1_124.NIL
  if A0_123 == L1_124 then
    L1_124 = _UPVALUE0_
    L1_124 = L1_124.BAD_PARAMETER
    return L1_124
  end
  L1_124 = db
  L1_124 = L1_124.getAttribute
  L2_125 = networkpoliciesTable
  L3_126 = ROWID
  L1_124 = L1_124(L2_125, L3_126, A0_123, attribute.groupId)
  L2_125 = attribute
  L2_125 = L2_125.groupId
  L3_126 = "='"
  L2_125 = L2_125 .. L3_126 .. L1_124 .. "'"
  L3_126 = db
  L3_126 = L3_126.getAttributeWhere
  L3_126 = L3_126(groupsTable, L2_125, attribute.name)
  if L3_126 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L3_126
end
function groupGetAll()
  local L0_127, L1_128, L2_129
  L0_127 = db
  L0_127 = L0_127.getTable
  L1_128 = networkpoliciesTable
  L0_127 = L0_127(L1_128)
  L1_128 = db
  L1_128 = L1_128.getTable
  L2_129 = groupsTable
  L1_128 = L1_128(L2_129)
  L2_129 = {}
  rowNum = 1
  for _FORV_6_, _FORV_7_ in pairs(L1_128) do
    if _FORV_7_[groupsTable .. "." .. attribute.name] ~= "Temp-CP" then
      count = 0
      for _FORV_11_, _FORV_12_ in pairs(L0_127) do
        if _FORV_7_[groupsTable .. "." .. attribute.groupId] == _FORV_12_[networkpoliciesTable .. "." .. attribute.groupId] then
          count = 1
        end
      end
      if count == 0 then
        L2_129[rowNum] = {}
        L2_129[rowNum] = _FORV_7_
        rowNum = rowNum + 1
      end
    end
  end
  return _UPVALUE0_.SUCCESS, L2_129
end
function groupIpPolicyExists(A0_130)
  local L1_131, L2_132
  L1_131 = _UPVALUE0_
  L1_131 = L1_131.NIL
  if A0_130 == L1_131 then
    L1_131 = _UPVALUE0_
    L1_131 = L1_131.BAD_PARAMETER
    return L1_131
  end
  L1_131 = db
  L1_131 = L1_131.getAttribute
  L2_132 = networkpoliciesTable
  L1_131 = L1_131(L2_132, ROWID, A0_130, attribute.groupId)
  L2_132 = _UPVALUE0_
  L2_132 = L2_132.NIL
  if L1_131 == L2_132 then
    L2_132 = _UPVALUE0_
    L2_132 = L2_132.ERROR
    return L2_132
  end
  L2_132 = attribute
  L2_132 = L2_132.groupId
  L2_132 = L2_132 .. "='" .. L1_131 .. "'"
  if #db.getRowsWhere(networkpoliciesTable, L2_132) == 1 then
  end
end
