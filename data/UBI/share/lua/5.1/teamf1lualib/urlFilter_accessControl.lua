local L0_0
L0_0 = module
L0_0("com.teamf1.core.filter.accessControl", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/filter_content")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wcf_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.filter.content")
urlFilteringAccessControlTbl = "urlFilteringAccessControl"
urlFilteringACLPoliciesTbl = "urlFilteringAccessControlPolicy"
;({}).enable = "enable"
;({}).action = "action"
;({}).policyName = "policyName"
;({}).policyType = "policyType"
;({}).ipAddress = "ipAddress"
;({}).startIpAddress = "startIpAddress"
;({}).endIpAddress = "endIpAddress"
;({}).interfaceName = "interfaceName"
;({}).ROWID = "_ROWID_"
util.setDebugStatus(true)
function isfeatureEnabled()
  local L0_1, L1_2, L2_3
  L2_3 = {}
  L2_3 = db.getTable(urlFilteringAccessControlTbl, false)
  for _FORV_6_, _FORV_7_ in pairs(L2_3) do
    L0_1 = _FORV_7_[_UPVALUE0_.enable]
    L1_2 = _FORV_7_[_UPVALUE0_.action]
  end
  return _UPVALUE1_.SUCCESS, L0_1, L1_2
end
function policyGet()
  local L0_4
  L0_4 = {}
  L0_4 = accessControlVlansGet()
  return L0_4
end
function policyGetCur(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13
  L7_12 = {}
  L8_13 = db
  L8_13 = L8_13.getRow
  L8_13 = L8_13(urlFilteringACLPoliciesTbl, _UPVALUE0_.ROWID, A0_5)
  L7_12 = L8_13
  L8_13 = urlFilteringACLPoliciesTbl
  L8_13 = L8_13 .. "."
  L7_12 = util.removePrefix(L7_12, L8_13)
  L1_6 = L7_12[_UPVALUE0_.policyName]
  L2_7 = L7_12[_UPVALUE0_.policyType]
  L3_8 = L7_12[_UPVALUE0_.ipAddress]
  L4_9 = L7_12[_UPVALUE0_.startIpAddress]
  L5_10 = L7_12[_UPVALUE0_.endIpAddress]
  L6_11 = L7_12[_UPVALUE0_.interfaceName]
  return _UPVALUE1_.SUCCESS, L1_6, L2_7, L3_8, L4_9, L5_10, L6_11
end
function policyGetAll()
  local L0_14
  L0_14 = {}
  L0_14 = db.getTable(urlFilteringACLPoliciesTbl, false)
  return _UPVALUE0_.SUCCESS, L0_14
end
function policyDelete(A0_15)
  local L1_16, L2_17, L3_18, L4_19, L5_20, L6_21
  L5_20 = _UPVALUE0_
  L5_20 = L5_20.isfeatureEnabled
  L4_19, L5_20 = nil, L5_20()
  L4_19, L6_21 = nil, L5_20()
  L3_18 = L6_21
  L2_17 = L5_20
  L5_20 = _UPVALUE1_
  L5_20 = L5_20.SUCCESS
  if L5_20 == L2_17 then
    L5_20 = _UPVALUE2_
  elseif L5_20 ~= L4_19 then
    L5_20 = _UPVALUE3_
    L5_20 = L5_20.WCFSTATUS_DISABLED
    return L5_20
  end
  L5_20, L6_21 = nil, nil
  L2_17, L5_20, L6_21 = isfeatureEnabled()
  if _UPVALUE1_.SUCCESS ~= L2_17 or _UPVALUE2_ ~= L5_20 then
    return _UPVALUE3_.ACLSTATUS_DISABLED
  end
  L1_16 = db.deleteRow(urlFilteringACLPoliciesTbl, _UPVALUE4_.ROWID, A0_15)
  if not L1_16 then
    return _UPVALUE1_.FAILURE, cookie
  end
  return _UPVALUE1_.SUCCESS, A0_15
end
function policyDeleteAll()
  local L0_22, L1_23, L2_24, L3_25, L4_26, L5_27
  L4_26 = _UPVALUE0_
  L4_26 = L4_26.isfeatureEnabled
  L3_25, L4_26 = nil, L4_26()
  L3_25, L5_27 = nil, L4_26()
  L2_24 = L5_27
  L1_23 = L4_26
  L4_26 = _UPVALUE1_
  L4_26 = L4_26.SUCCESS
  if L4_26 == L1_23 then
    L4_26 = _UPVALUE2_
  elseif L4_26 ~= L3_25 then
    L4_26 = _UPVALUE3_
    L4_26 = L4_26.WCFSTATUS_DISABLED
    return L4_26
  end
  L4_26, L5_27 = nil, nil
  L1_23, L4_26, L5_27 = isfeatureEnabled()
  if _UPVALUE1_.SUCCESS ~= L1_23 or _UPVALUE2_ ~= L4_26 then
    return _UPVALUE3_.ACLSTATUS_DISABLED
  end
  L0_22 = db.deleteAllRows(urlFilteringACLPoliciesTbl)
  if not L0_22 then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS
end
function policyCreate(A0_28, A1_29, A2_30, A3_31, A4_32, A5_33)
  local L6_34, L7_35, L8_36, L9_37, L10_38, L11_39, L12_40, L13_41, L14_42
  L8_36 = {}
  L9_37 = urlFilteringACLPoliciesTbl
  L10_38 = "."
  L9_37 = L9_37 .. L10_38
  L10_38 = db
  L10_38 = L10_38.existsRow
  L11_39 = urlFilteringACLPoliciesTbl
  L12_40 = _UPVALUE0_
  L12_40 = L12_40.policyName
  L13_41 = A0_28
  L10_38 = L10_38(L11_39, L12_40, L13_41)
  if L10_38 then
    L10_38 = util
    L10_38 = L10_38.appendDebugOut
    L11_39 = " policyName "
    L12_40 = A0_28
    L13_41 = " already Exists"
    L11_39 = L11_39 .. L12_40 .. L13_41
    L10_38(L11_39)
    L10_38 = _UPVALUE1_
    L10_38 = L10_38.POLICY_NAME_ALRDY_EXISTS
    return L10_38
  end
  L10_38 = _UPVALUE0_
  L10_38 = L10_38.policyName
  L8_36[L10_38] = A0_28
  L10_38 = _UPVALUE0_
  L10_38 = L10_38.policyType
  L8_36[L10_38] = A1_29
  L10_38 = _UPVALUE0_
  L10_38 = L10_38.ipAddress
  L11_39 = A2_30 or _UPVALUE2_
  L8_36[L10_38] = L11_39
  L10_38 = _UPVALUE0_
  L10_38 = L10_38.startIpAddress
  L11_39 = A3_31 or _UPVALUE2_
  L8_36[L10_38] = L11_39
  L10_38 = _UPVALUE0_
  L10_38 = L10_38.endIpAddress
  L11_39 = A4_32 or _UPVALUE2_
  L8_36[L10_38] = L11_39
  L10_38 = _UPVALUE0_
  L10_38 = L10_38.interfaceName
  L11_39 = A5_33 or _UPVALUE2_
  L8_36[L10_38] = L11_39
  L10_38 = util
  L10_38 = L10_38.addPrefix
  L11_39 = L8_36
  L12_40 = L9_37
  L10_38 = L10_38(L11_39, L12_40)
  L8_36 = L10_38
  L10_38, L11_39, L12_40 = nil, nil, nil
  L13_41 = _UPVALUE3_
  L13_41 = L13_41.isfeatureEnabled
  L12_40, L13_41 = nil, L13_41()
  L12_40, L14_42 = nil, L13_41()
  L11_39 = L14_42
  L10_38 = L13_41
  L13_41 = _UPVALUE4_
  L13_41 = L13_41.SUCCESS
  if L13_41 == L10_38 then
    L13_41 = _UPVALUE5_
  elseif L13_41 ~= L12_40 then
    L13_41 = _UPVALUE1_
    L13_41 = L13_41.WCFSTATUS_DISABLED
    return L13_41
  end
  L13_41, L14_42 = nil, nil
  L10_38, L13_41, L14_42 = isfeatureEnabled()
  if _UPVALUE4_.SUCCESS ~= L10_38 or _UPVALUE5_ ~= L13_41 then
    return _UPVALUE1_.ACLSTATUS_DISABLED
  end
  L7_35 = db.insert(urlFilteringACLPoliciesTbl, L8_36)
  if not L7_35 then
    return _UPVALUE4_.FAILURE
  end
  L6_34 = db.getAttribute(urlFilteringACLPoliciesTbl, _UPVALUE0_.policyName, A0_28, _UPVALUE0_.ROWID)
  if L6_34 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L6_34
end
function policySet(A0_43, A1_44, A2_45, A3_46, A4_47, A5_48, A6_49)
  local L7_50, L8_51, L9_52, L10_53, L11_54, L12_55, L13_56, L14_57
  L8_51 = urlFilteringACLPoliciesTbl
  L9_52 = "."
  L8_51 = L8_51 .. L9_52
  L9_52 = {}
  L10_53 = db
  L10_53 = L10_53.existsRow
  L11_54 = urlFilteringACLPoliciesTbl
  L12_55 = _UPVALUE0_
  L12_55 = L12_55.ROWID
  L13_56 = A0_43
  L10_53 = L10_53(L11_54, L12_55, L13_56)
  L7_50 = L10_53
  if not L7_50 then
    L10_53 = _UPVALUE1_
    L10_53 = L10_53.INVALID_ACL_POLICY_COOKIE
    return L10_53
  end
  L10_53 = _UPVALUE0_
  L10_53 = L10_53.policyName
  L9_52[L10_53] = A1_44
  L10_53 = _UPVALUE0_
  L10_53 = L10_53.policyType
  L9_52[L10_53] = A2_45
  L10_53 = _UPVALUE0_
  L10_53 = L10_53.ipAddress
  L11_54 = A3_46 or _UPVALUE2_
  L9_52[L10_53] = L11_54
  L10_53 = _UPVALUE0_
  L10_53 = L10_53.startIpAddress
  L11_54 = A4_47 or _UPVALUE2_
  L9_52[L10_53] = L11_54
  L10_53 = _UPVALUE0_
  L10_53 = L10_53.endIpAddress
  L11_54 = A5_48 or _UPVALUE2_
  L9_52[L10_53] = L11_54
  L10_53 = _UPVALUE0_
  L10_53 = L10_53.interfaceName
  L11_54 = A6_49 or _UPVALUE2_
  L9_52[L10_53] = L11_54
  L10_53 = util
  L10_53 = L10_53.addPrefix
  L11_54 = L9_52
  L12_55 = L8_51
  L10_53 = L10_53(L11_54, L12_55)
  L9_52 = L10_53
  L10_53, L11_54, L12_55 = nil, nil, nil
  L13_56 = _UPVALUE3_
  L13_56 = L13_56.isfeatureEnabled
  L12_55, L13_56 = nil, L13_56()
  L12_55, L14_57 = nil, L13_56()
  L11_54 = L14_57
  L10_53 = L13_56
  L13_56 = _UPVALUE4_
  L13_56 = L13_56.SUCCESS
  if L13_56 == L10_53 then
    L13_56 = _UPVALUE5_
  elseif L13_56 ~= L12_55 then
    L13_56 = _UPVALUE1_
    L13_56 = L13_56.WCFSTATUS_DISABLED
    return L13_56
  end
  L13_56, L14_57 = nil, nil
  L10_53, L13_56, L14_57 = isfeatureEnabled()
  if _UPVALUE4_.SUCCESS ~= L10_53 or _UPVALUE5_ ~= L13_56 then
    return _UPVALUE1_.ACLSTATUS_DISABLED
  end
  L7_50 = db.update(urlFilteringACLPoliciesTbl, L9_52, A0_43)
  if not L7_50 then
    return _UPVALUE4_.FAILURE, A0_43
  end
  return _UPVALUE4_.SUCCESS, A0_43
end
function accessControlSet(A0_58, A1_59)
  local L2_60, L3_61, L4_62, L5_63, L6_64, L7_65, L8_66
  L3_61 = _UPVALUE0_
  L4_62 = {}
  L5_63 = urlFilteringAccessControlTbl
  L6_64 = "."
  L5_63 = L5_63 .. L6_64
  L6_64 = _UPVALUE1_
  L6_64 = L6_64.enable
  L4_62[L6_64] = A0_58
  L6_64 = _UPVALUE2_
  L6_64 = L6_64.NIL
  if A1_59 ~= L6_64 then
    L6_64 = _UPVALUE1_
    L6_64 = L6_64.action
    L4_62[L6_64] = A1_59
  end
  L6_64 = util
  L6_64 = L6_64.addPrefix
  L7_65 = L4_62
  L8_66 = L5_63
  L6_64 = L6_64(L7_65, L8_66)
  L4_62 = L6_64
  L6_64, L7_65, L8_66 = nil, nil, nil
  L6_64, L7_65, L8_66 = _UPVALUE3_.isfeatureEnabled()
  if _UPVALUE2_.SUCCESS ~= L6_64 or _UPVALUE4_ ~= L8_66 then
    return _UPVALUE5_.WCFSTATUS_DISABLED
  end
  L2_60 = db.existsRow(urlFilteringAccessControlTbl, _UPVALUE1_.ROWID, L3_61)
  if not L2_60 then
    L2_60 = db.insert(urlFilteringAccessControlTbl, L4_62)
  else
    L2_60 = db.update(urlFilteringAccessControlTbl, L4_62, L3_61)
  end
  if not L2_60 then
    return _UPVALUE2_.FAILURE, L3_61
  end
  return _UPVALUE2_.SUCCESS, L3_61
end
function accessControlVlansGet()
  local L0_67, L1_68
  L0_67 = "ZoneType = 'SECURE'"
  L1_68 = {}
  L1_68 = db.getRowsWhere("Zones", L0_67)
  return L1_68
end
function policyValidate(A0_69, A1_70, A2_71, A3_72, A4_73, A5_74)
  local L6_75, L7_76, L8_77, L9_78, L10_79
  L8_77 = _UPVALUE0_
  L8_77 = L8_77.FAILURE
  L9_78 = {}
  L6_75 = L10_79
  if L6_75 ~= L10_79 then
    L10_79("policyValidate : Invalid Policy Type")
    return L10_79
  end
  if A1_70 == L10_79 then
    L7_76 = L10_79(2, A2_71)
    L6_75 = L10_79
    if L6_75 ~= L10_79 then
      L10_79("policyValidate : SINGLE_IP: Invalid IpAddress")
      return L10_79
    end
    if L10_79 then
      L10_79("policyValidate : Single IP : already exists")
      return L10_79
    end
  end
  if A1_70 == L10_79 then
    L7_76 = L10_79(2, A3_72)
    L6_75 = L10_79
    if L6_75 ~= L10_79 then
      L10_79("policyValidate : IP_RANGE: Invalid " .. "startIpAddress")
      return L10_79
    end
    L7_76 = L10_79(2, A4_73)
    L6_75 = L10_79
    if L6_75 ~= L10_79 then
      L10_79("policyValidate : IP_RANGE: Invalid " .. "endIpAddress")
      return L10_79
    end
    L7_76 = L10_79(A3_72, A4_73)
    L6_75 = L10_79
    if L6_75 ~= L10_79 then
      L10_79("policyValidate : IP_RANGE: Invalid Ip Range")
      return L10_79
    end
    if db.existsRowWhere(urlFilteringACLPoliciesTbl, L10_79) then
      util.appendDebugOut("policyValidate : IP_RANGE: already Exists")
      return _UPVALUE4_.ACL_POLICY_NETWORK_ALRDY_EXISTS
    end
  end
  if A1_70 == L10_79 then
    L9_78 = L10_79
    for _FORV_13_, _FORV_14_ in L10_79(L9_78) do
      if A5_74 == _FORV_14_["Zones.ZoneLogicalIfName"] then
        L8_77 = _UPVALUE0_.SUCCESS
        break
      end
    end
    if L8_77 ~= L10_79 then
      L10_79("policyValidate : INTERFACE : Invalid interface")
      return L10_79
    end
    if L10_79 then
      L10_79("policyValidate : INTERFACE: already exists")
      return L10_79
    end
  end
  return L10_79
end
function accessControlValidate(A0_80, A1_81)
  local L2_82
  L2_82 = _UPVALUE0_.isBoolean(A0_80)
  if L2_82 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("accessControlValidate : Invalid acl enable cookie")
    return _UPVALUE2_.INVALID_ACL_ENABLE
  end
  if A0_80 == ENABLE then
    L2_82 = _UPVALUE0_.isBoolean(A1_81)
    if L2_82 ~= _UPVALUE1_.SUCCESS then
      util.appendDebugOut("accessControlValidate : Invalid acl action")
      return _UPVALUE2_.INVALID_ACL_ACTION
    end
  end
  return _UPVALUE1_.SUCCESS
end
