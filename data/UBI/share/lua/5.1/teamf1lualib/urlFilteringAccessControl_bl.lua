local L0_0
L0_0 = module
L0_0("com.teamf1.bl.filter.accessControl", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/urlFilter_accessControl")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/wcf_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
util.setDebugStatus(false)
function urlFilteringAccessControlSectionGet()
  local L0_1, L1_2, L2_3
  L0_1, L1_2, L2_3 = _UPVALUE0_.isfeatureEnabled()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3
end
function urlFilteringACLPolicySectionGet()
  local L0_4
  L0_4 = {}
  L0_4 = _UPVALUE0_.policyGet()
  return L0_4
end
function urlFilteringACLPolicySectionGetCur(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12
  L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12 = _UPVALUE0_.policyGetCur(A0_5)
  if L1_6 ~= _UPVALUE1_.SUCCESS then
    return L1_6
  end
  return L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12
end
function urlFilteringACLPolicySectionGetAll()
  local L0_13, L1_14
  L1_14 = {}
  L0_13, L1_14 = _UPVALUE0_.policyGetAll()
  if L0_13 ~= _UPVALUE1_.SUCCESS then
    return L0_13
  end
  return L0_13, L1_14
end
function urlFilteringACLPolicySectionDelete(A0_15)
  local L1_16, L2_17
  L1_16 = ACCESS_LEVEL
  if L1_16 ~= 0 then
    L1_16 = util
    L1_16 = L1_16.appendDebugOut
    L2_17 = "urlFilteringACLPolicySectionDelete : Detected "
    L2_17 = L2_17 .. "Unauthorized access for page " .. "urlFilteringAccessControl"
    L1_16(L2_17)
    L1_16 = _UPVALUE0_
    L1_16 = L1_16.UNAUTHORIZED
    return L1_16
  end
  L1_16 = A0_15["urlFilteringACLPolicy.cookie"]
  L2_17 = _UPVALUE0_
  L2_17 = L2_17.NIL
  if L1_16 == L2_17 then
    L2_17 = util
    L2_17 = L2_17.appendDebugOut
    L2_17("urlFilteringACLPolicySectionDelete : Invalid " .. "Cookie")
    L2_17 = _UPVALUE0_
    L2_17 = L2_17.BAD_PARAMETER
    return L2_17
  end
  L2_17 = nil
  _UPVALUE1_.start()
  L2_17, cookie = _UPVALUE2_.policyDelete(L1_16)
  if L2_17 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("urlFilteringACLPolicySectionDelete : Error in " .. "Delete Operation in page " .. "urlFilteringAccessControl" .. L2_17)
    _UPVALUE1_.abort()
    return L2_17, L1_16
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function urlFilteringACLPolicySectionDeleteAll()
  local L0_18
  L0_18 = ACCESS_LEVEL
  if L0_18 ~= 0 then
    L0_18 = util
    L0_18 = L0_18.appendDebugOut
    L0_18("urlFilteringACLPolicySectionDeleteAll : " .. "Detected Unauthorized access for page " .. "urlFilteringAccessControl")
    L0_18 = _UPVALUE0_
    L0_18 = L0_18.UNAUTHORIZED
    return L0_18
  end
  L0_18 = nil
  _UPVALUE1_.start()
  L0_18 = _UPVALUE2_.policyDeleteAll()
  if L0_18 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("urlFilteringACLPolicySectionDeleteAll : " .. "Error in Delete Operation in page " .. "urlFilteringAccessControl" .. L0_18)
    _UPVALUE1_.abort()
    return L0_18
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function urlFilteringACLPolicySectionCreate(A0_19)
  local L1_20, L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27
  L1_20 = ACCESS_LEVEL
  if L1_20 ~= 0 then
    L1_20 = util
    L1_20 = L1_20.appendDebugOut
    L2_21 = "urlFilteringACLPolicySectionCreate : "
    L3_22 = "Detected Unauthorized access for page "
    L4_23 = "urlFilteringAccessControl"
    L2_21 = L2_21 .. L3_22 .. L4_23
    L1_20(L2_21)
    L1_20 = _UPVALUE0_
    L1_20 = L1_20.UNAUTHORIZED
    return L1_20
  end
  L1_20, L2_21, L3_22, L4_23, L5_24, L6_25 = nil, nil, nil, nil, nil, nil
  L1_20 = A0_19["urlFilteringACLPolicy.policyName"]
  L2_21 = A0_19["urlFilteringACLPolicy.policyType"]
  L3_22 = A0_19["urlFilteringACLPolicy.ipAddress"]
  L4_23 = A0_19["urlFilteringACLPolicy.startIpAddress"]
  L5_24 = A0_19["urlFilteringACLPolicy.endIpAddress"]
  L6_25 = A0_19["urlFilteringACLPolicy.interfaceName"]
  L7_26 = _UPVALUE0_
  L7_26 = L7_26.NIL
  if L1_20 == L7_26 then
    L7_26 = util
    L7_26 = L7_26.appendDebugOut
    L8_27 = "urlFilteringACLPolicySectionCreate : "
    L8_27 = L8_27 .. "Invalid Cookie"
    L7_26(L8_27)
    L7_26 = _UPVALUE1_
    L7_26 = L7_26.INVALID_ACL_POLICY_NAME
    return L7_26
  end
  L7_26 = _UPVALUE0_
  L7_26 = L7_26.NIL
  if L2_21 == L7_26 then
    L7_26 = util
    L7_26 = L7_26.appendDebugOut
    L8_27 = "urlFilteringACLPolicySectionCreate : "
    L8_27 = L8_27 .. "Invalid Policy Type"
    L7_26(L8_27)
    L7_26 = _UPVALUE1_
    L7_26 = L7_26.INVALID_ACL_POLICY_TYPE
    return L7_26
  end
  L7_26 = _UPVALUE2_
  if L2_21 == L7_26 then
    L7_26 = _UPVALUE0_
    L7_26 = L7_26.NIL
    if L3_22 == L7_26 then
      L7_26 = util
      L7_26 = L7_26.appendDebugOut
      L8_27 = "urlFilteringACLPolicySectionCreate : "
      L8_27 = L8_27 .. "Invalid Single IP"
      L7_26(L8_27)
      L7_26 = _UPVALUE1_
      L7_26 = L7_26.INVALID_ACL_IP_ADDRESS
      return L7_26
    end
    L7_26 = _UPVALUE0_
    L4_23 = L7_26.NIL
    L7_26 = _UPVALUE0_
    L5_24 = L7_26.NIL
    L7_26 = _UPVALUE0_
    L6_25 = L7_26.NIL
  end
  L7_26 = _UPVALUE3_
  if L2_21 == L7_26 then
    L7_26 = _UPVALUE0_
    L7_26 = L7_26.NIL
    if L4_23 ~= L7_26 then
      L7_26 = _UPVALUE0_
      L7_26 = L7_26.NIL
    elseif L5_24 == L7_26 then
      L7_26 = util
      L7_26 = L7_26.appendDebugOut
      L8_27 = "urlFilteringACLPolicySectionCreate : "
      L8_27 = L8_27 .. "Invalid IP Range"
      L7_26(L8_27)
      L7_26 = _UPVALUE1_
      L7_26 = L7_26.INVALID_ACL_IP_ADDRESS
      return L7_26
    end
    L7_26 = _UPVALUE0_
    L3_22 = L7_26.NIL
    L7_26 = _UPVALUE0_
    L6_25 = L7_26.NIL
  end
  L7_26 = _UPVALUE4_
  if L2_21 == L7_26 then
    L7_26 = _UPVALUE0_
    L7_26 = L7_26.NIL
    if L6_25 == L7_26 then
      L7_26 = util
      L7_26 = L7_26.appendDebugOut
      L8_27 = "urlFilteringACLPolicySectionCreate : "
      L8_27 = L8_27 .. "Invalid interface"
      L7_26(L8_27)
      L7_26 = _UPVALUE1_
      L7_26 = L7_26.INVALID_ACL_INTERFACE
      return L7_26
    end
    L7_26 = _UPVALUE0_
    L3_22 = L7_26.NIL
    L7_26 = _UPVALUE0_
    L4_23 = L7_26.NIL
    L7_26 = _UPVALUE0_
    L5_24 = L7_26.NIL
  end
  L7_26, L8_27 = nil, nil
  L7_26 = _UPVALUE5_.policyValidate(L1_20, L2_21, L3_22, L4_23, L5_24, L6_25)
  if L7_26 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("urlFilteringACLPolicySectionSet : " .. "Invalid Policy Configuration")
    return L7_26
  end
  _UPVALUE6_.start()
  L7_26, L8_27 = _UPVALUE5_.policyCreate(L1_20, L2_21, L3_22, L4_23, L5_24, L6_25)
  if L7_26 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("urlFilteringACLPolicySectionCreate : " .. "Error in configuring values in page " .. "urlFilteringAccessControl" .. L7_26)
    _UPVALUE6_.abort()
    return L7_26, 0
  end
  _UPVALUE6_.complete()
  _UPVALUE6_.save()
  return _UPVALUE0_.SUCCESS, L8_27
end
function urlFilteringACLPolicySectionSet(A0_28)
  local L1_29, L2_30, L3_31, L4_32, L5_33, L6_34, L7_35, L8_36, L9_37
  L1_29 = ACCESS_LEVEL
  if L1_29 ~= 0 then
    L1_29 = util
    L1_29 = L1_29.appendDebugOut
    L2_30 = "urlFilteringACLPolicySectionSet : "
    L3_31 = "Detected Unauthorized access for page "
    L4_32 = "urlFilteringAccessControl"
    L2_30 = L2_30 .. L3_31 .. L4_32
    L1_29(L2_30)
    L1_29 = _UPVALUE0_
    L1_29 = L1_29.UNAUTHORIZED
    return L1_29
  end
  L1_29 = A0_28["urlFilteringACLPolicy.cookie"]
  L2_30 = _UPVALUE0_
  L2_30 = L2_30.NIL
  if L1_29 == L2_30 then
    L2_30 = util
    L2_30 = L2_30.appendDebugOut
    L3_31 = "urlFilteringACLPolicySectionSet : Invalid Cookie"
    L2_30(L3_31)
    L2_30 = _UPVALUE0_
    L2_30 = L2_30.BAD_PARAMETER
    return L2_30
  end
  L2_30, L3_31, L4_32, L5_33, L6_34, L7_35 = nil, nil, nil, nil, nil, nil
  L2_30 = A0_28["urlFilteringACLPolicy.policyName"]
  L3_31 = A0_28["urlFilteringACLPolicy.policyType"]
  L4_32 = A0_28["urlFilteringACLPolicy.ipAddress"]
  L5_33 = A0_28["urlFilteringACLPolicy.startIpAddress"]
  L6_34 = A0_28["urlFilteringACLPolicy.endIpAddress"]
  L7_35 = A0_28["urlFilteringACLPolicy.interfaceName"]
  L8_36 = _UPVALUE0_
  L8_36 = L8_36.NIL
  if L2_30 == L8_36 then
    L8_36 = util
    L8_36 = L8_36.appendDebugOut
    L9_37 = "urlFilteringACLPolicySectionSet : "
    L9_37 = L9_37 .. "Invalid PolicyName"
    L8_36(L9_37)
    L8_36 = _UPVALUE1_
    L8_36 = L8_36.INVALID_ACL_POLICY_NAME
    return L8_36
  end
  L8_36 = _UPVALUE0_
  L8_36 = L8_36.NIL
  if L3_31 == L8_36 then
    L8_36 = util
    L8_36 = L8_36.appendDebugOut
    L9_37 = "urlFilteringACLPolicySectionSet : "
    L9_37 = L9_37 .. "Invalid Policy Type"
    L8_36(L9_37)
    L8_36 = _UPVALUE1_
    L8_36 = L8_36.INVALID_ACL_POLICY_TYPE
    return L8_36
  end
  L8_36 = _UPVALUE2_
  if L3_31 == L8_36 then
    L8_36 = _UPVALUE0_
    L8_36 = L8_36.NIL
    if L4_32 == L8_36 then
      L8_36 = util
      L8_36 = L8_36.appendDebugOut
      L9_37 = "urlFilteringACLPolicySectionSet : "
      L9_37 = L9_37 .. "Invalid Single IP"
      L8_36(L9_37)
      L8_36 = _UPVALUE1_
      L8_36 = L8_36.INVALID_ACL_IP_ADDRESS
      return L8_36
    end
    L8_36 = _UPVALUE0_
    L5_33 = L8_36.NIL
    L8_36 = _UPVALUE0_
    L6_34 = L8_36.NIL
    L8_36 = _UPVALUE0_
    L7_35 = L8_36.NIL
  end
  L8_36 = _UPVALUE3_
  if L3_31 == L8_36 then
    L8_36 = _UPVALUE0_
    L8_36 = L8_36.NIL
    if L5_33 ~= L8_36 then
      L8_36 = _UPVALUE0_
      L8_36 = L8_36.NIL
    elseif L6_34 == L8_36 then
      L8_36 = util
      L8_36 = L8_36.appendDebugOut
      L9_37 = "urlFilteringACLPolicySectionSet : "
      L9_37 = L9_37 .. "Invalid IP Range"
      L8_36(L9_37)
      L8_36 = _UPVALUE1_
      L8_36 = L8_36.INVALID_ACL_IP_ADDRESS
      return L8_36
    end
    L8_36 = _UPVALUE0_
    L4_32 = L8_36.NIL
    L8_36 = _UPVALUE0_
    L7_35 = L8_36.NIL
  end
  L8_36 = _UPVALUE4_
  if L3_31 == L8_36 then
    L8_36 = _UPVALUE0_
    L8_36 = L8_36.NIL
    if L7_35 == L8_36 then
      L8_36 = util
      L8_36 = L8_36.appendDebugOut
      L9_37 = "urlFilteringACLPolicySectionSet : "
      L9_37 = L9_37 .. "Invalid interface"
      L8_36(L9_37)
      L8_36 = _UPVALUE1_
      L8_36 = L8_36.INVALID_ACL_INTERFACE
      return L8_36
    end
    L8_36 = _UPVALUE0_
    L4_32 = L8_36.NIL
    L8_36 = _UPVALUE0_
    L5_33 = L8_36.NIL
    L8_36 = _UPVALUE0_
    L6_34 = L8_36.NIL
  end
  L8_36, L9_37 = nil, nil
  L8_36 = _UPVALUE5_.policyValidate(L2_30, L3_31, L4_32, L5_33, L6_34, L7_35)
  if L8_36 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("urlFilteringACLPolicySectionSet : " .. "Invalid Policy Configuration")
    return L8_36
  end
  _UPVALUE6_.start()
  L8_36, L9_37 = _UPVALUE5_.policySet(L1_29, L2_30, L3_31, L4_32, L5_33, L6_34, L7_35)
  if L8_36 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("urlFilteringACLPolicySectionSet : " .. "Error in configuring values in page " .. "urlFilteringAccessControl" .. L8_36)
    _UPVALUE6_.abort()
    return L8_36, L1_29
  end
  _UPVALUE6_.complete()
  _UPVALUE6_.save()
  return _UPVALUE0_.SUCCESS, L9_37
end
function urlFilteringAccessControlSectionSet(A0_38)
  local L1_39, L2_40, L3_41, L4_42
  L1_39 = ACCESS_LEVEL
  if L1_39 ~= 0 then
    L1_39 = util
    L1_39 = L1_39.appendDebugOut
    L2_40 = "urlFilteringAccessControlSectionSet : "
    L3_41 = "Detected Unauthorized access for page "
    L4_42 = "urlFilteringAccessControl"
    L2_40 = L2_40 .. L3_41 .. L4_42
    L1_39(L2_40)
    L1_39 = _UPVALUE0_
    L1_39 = L1_39.UNAUTHORIZED
    return L1_39
  end
  L1_39 = A0_38["urlFilteringAccessControl.enable"]
  L2_40 = A0_38["urlFilteringAccessControl.action"]
  L3_41 = _UPVALUE0_
  L3_41 = L3_41.NIL
  if L1_39 == L3_41 then
    L3_41 = util
    L3_41 = L3_41.appendDebugOut
    L4_42 = "urlFilteringAccessControlSectionSet : "
    L4_42 = L4_42 .. "Invalid url Filtering enable cookie"
    L3_41(L4_42)
    L3_41 = _UPVALUE1_
    L3_41 = L3_41.INVALID_ACL_ENABLE
    return L3_41
  end
  L3_41 = _UPVALUE2_
  if L1_39 == L3_41 then
    L3_41 = _UPVALUE0_
    L3_41 = L3_41.NIL
    if L2_40 == L3_41 then
      L3_41 = util
      L3_41 = L3_41.appendDebugOut
      L4_42 = "urlFilteringAccessControlSectionSet : "
      L4_42 = L4_42 .. "Invalid url Filtering policy action"
      L3_41(L4_42)
      L3_41 = _UPVALUE1_
      L3_41 = L3_41.INVALID_ACL_ACTION
      return L3_41
    end
  end
  L3_41, L4_42 = nil, nil
  L3_41 = _UPVALUE3_.accessControlValidate(L1_39, L2_40)
  if L3_41 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("urlFilteringAccessControlSectionSet : " .. "Invalid url Filtering Acess Control Conf")
  end
  _UPVALUE4_.start()
  L3_41, L4_42 = _UPVALUE3_.accessControlSet(L1_39, L2_40)
  if L3_41 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("urlFilteringAccessControlSectionSet : " .. "Error in configuring values in page " .. "urlFilteringAccessControl" .. L3_41)
    _UPVALUE4_.abort()
    return L3_41, L4_42
  end
  _UPVALUE4_.complete()
  _UPVALUE4_.save()
  return _UPVALUE0_.SUCCESS, L4_42
end
