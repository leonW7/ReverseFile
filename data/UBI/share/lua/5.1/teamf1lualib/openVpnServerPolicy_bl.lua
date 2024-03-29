local L0_0
L0_0 = module
L0_0("com.teamf1.bl.vpn.openVpnServerPolicy", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/openvpn_server_policy")
L0_0 = require
L0_0("teamf1lualib/user-management_groups")
L0_0 = require
L0_0("teamf1lualib/user-management_users")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.openvpn.server_policy")
function openVpnServerPolicySectionSet(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15
  L1_2 = ACCESS_LEVEL
  if L1_2 ~= 0 then
    L1_2 = "Detected Unauthorized access for page "
    L2_3 = "openvpnVpnServerPolicy."
    L1_2 = L1_2 .. L2_3
    L2_3 = util
    L2_3 = L2_3.appendDebugOut
    L3_4 = L1_2
    L2_3(L3_4)
    L2_3 = _UPVALUE0_
    L2_3 = L2_3.UNAUTHORIZED
    return L2_3
  end
  L1_2 = A0_1["omniSSLServerPolicy.cookie"]
  L2_3 = A0_1["omniSSLServerPolicy.policyName"]
  L3_4 = A0_1["omniSSLServerPolicy.policyType"]
  L4_5 = A0_1["omniSSLServerPolicy.policyOwnerName"]
  L5_6 = A0_1["omniSSLServerPolicy.policyDestinationType"]
  L6_7 = A0_1["omniSSLServerPolicy.permission"]
  L7_8 = A0_1["omniSSLServerPolicy.IPAddress"]
  L8_9 = A0_1["omniSSLServerPolicy.maskLength"]
  L9_10 = A0_1["omniSSLServerPolicy.startPort"]
  L10_11 = A0_1["omniSSLServerPolicy.endPort"]
  L11_12 = A0_1["omniSSLServerPolicy.icmp"]
  L12_13 = _UPVALUE0_
  L12_13 = L12_13.NIL
  if L6_7 == L12_13 then
    L12_13 = util
    L12_13 = L12_13.appendDebugOut
    L13_14 = "Set : Invalid permission"
    L12_13(L13_14)
    L12_13 = _UPVALUE0_
    L12_13 = L12_13.BAD_PARAMETER
    return L12_13
  end
  L12_13 = _UPVALUE0_
  L12_13 = L12_13.NIL
  if L11_12 == L12_13 then
    L12_13 = util
    L12_13 = L12_13.appendDebugOut
    L13_14 = "Set : Invalid icmp"
    L12_13(L13_14)
    L12_13 = _UPVALUE0_
    L12_13 = L12_13.BAD_PARAMETER
    return L12_13
  end
  L12_13 = _UPVALUE1_
  L12_13 = L12_13[2]
  if L5_6 ~= L12_13 then
    L12_13 = _UPVALUE1_
    L12_13 = L12_13[3]
    if L5_6 ~= L12_13 then
      L12_13 = _UPVALUE1_
      L12_13 = L12_13[4]
    end
  elseif L5_6 == L12_13 then
    L12_13 = _UPVALUE0_
    L12_13 = L12_13.NIL
    if L9_10 == L12_13 then
      L12_13 = util
      L12_13 = L12_13.appendDebugOut
      L13_14 = "Set : Invalid startPort"
      L12_13(L13_14)
      L12_13 = _UPVALUE0_
      L12_13 = L12_13.BAD_PARAMETER
      return L12_13
    end
    L12_13 = _UPVALUE0_
    L12_13 = L12_13.NIL
    if L10_11 == L12_13 then
      L12_13 = util
      L12_13 = L12_13.appendDebugOut
      L13_14 = "Set : Invalid endPort"
      L12_13(L13_14)
      L12_13 = _UPVALUE0_
      L12_13 = L12_13.BAD_PARAMETER
      return L12_13
    end
    L12_13 = _UPVALUE1_
    L12_13 = L12_13[2]
    if L5_6 ~= L12_13 then
      L12_13 = _UPVALUE1_
      L12_13 = L12_13[3]
    elseif L5_6 == L12_13 then
      L12_13 = _UPVALUE0_
      L12_13 = L12_13.NIL
      if L7_8 == L12_13 then
        L12_13 = util
        L12_13 = L12_13.appendDebugOut
        L13_14 = "Set : Invalid IPAddress"
        L12_13(L13_14)
        L12_13 = _UPVALUE0_
        L12_13 = L12_13.BAD_PARAMETER
        return L12_13
      end
    end
    L12_13 = _UPVALUE1_
    L12_13 = L12_13[3]
    if L5_6 == L12_13 then
      L12_13 = _UPVALUE0_
      L12_13 = L12_13.NIL
      if L8_9 == L12_13 then
        L12_13 = util
        L12_13 = L12_13.appendDebugOut
        L13_14 = "Set : Invalid maskLength"
        L12_13(L13_14)
        L12_13 = _UPVALUE0_
        L12_13 = L12_13.BAD_PARAMETER
        return L12_13
      end
    end
  end
  L12_13, L13_14 = nil, nil
  for _FORV_17_, _FORV_18_ in L14_15(_UPVALUE1_) do
    if _FORV_18_ == L5_6 then
      L5_6 = _FORV_17_
      break
    end
  end
  if L11_12 == L14_15 then
    L11_12 = _UPVALUE3_
  else
    L11_12 = _UPVALUE4_
  end
  if L3_4 == L14_15 then
    L3_4 = _UPVALUE6_
  elseif L3_4 == L14_15 then
    L3_4 = _UPVALUE7_
  elseif L3_4 == L14_15 then
    L3_4 = _UPVALUE8_
  end
  L14_15()
  L13_14 = L14_15(L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12)
  L12_13 = L14_15
  if L12_13 ~= L14_15 then
    util.appendDebugOut(L14_15 .. L12_13)
    _UPVALUE9_.abort()
    return L12_13, L1_2
  end
  if L14_15 then
    L13_14 = L14_15(L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12)
    L12_13 = L14_15
    if L12_13 ~= L14_15 then
      util.appendDebugOut(L14_15 .. L12_13)
      _UPVALUE9_.abort()
      return L12_13, L1_2
    end
  end
  L14_15()
  L14_15()
  return L14_15, L13_14
end
function openVpnServerPolicySectionCreate(A0_16)
  local L1_17, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26, L11_27, L12_28, L13_29
  L1_17 = ACCESS_LEVEL
  if L1_17 ~= 0 then
    L1_17 = "Detected Unauthorized access for page OpenVpnServer."
    L2_18 = util
    L2_18 = L2_18.appendDebugOut
    L3_19 = L1_17
    L2_18(L3_19)
    L2_18 = _UPVALUE0_
    L2_18 = L2_18.UNAUTHORIZED
    return L2_18
  end
  L1_17 = A0_16["omniSSLServerPolicy.policyName"]
  L2_18 = A0_16["omniSSLServerPolicy.policyType"]
  L3_19 = nil
  L4_20 = _UPVALUE1_
  L4_20 = L4_20[1]
  if L2_18 == L4_20 then
    L3_19 = _UPVALUE2_
  else
    L4_20 = _UPVALUE1_
    L4_20 = L4_20[2]
    if L2_18 == L4_20 then
      L3_19 = A0_16["omniSSLServerPolicy.policyOwnerName1"]
    else
      L4_20 = _UPVALUE1_
      L4_20 = L4_20[3]
      if L2_18 == L4_20 then
        L3_19 = A0_16["omniSSLServerPolicy.policyOwnerName2"]
      end
    end
  end
  L4_20 = A0_16["omniSSLServerPolicy.policyDestinationType"]
  L5_21 = A0_16["omniSSLServerPolicy.permission"]
  L6_22 = A0_16["omniSSLServerPolicy.IPAddress"]
  L7_23 = A0_16["omniSSLServerPolicy.maskLength"]
  L8_24 = A0_16["omniSSLServerPolicy.startPort"]
  L9_25 = A0_16["omniSSLServerPolicy.endPort"]
  L10_26 = A0_16["omniSSLServerPolicy.icmp"]
  L11_27 = _UPVALUE0_
  L11_27 = L11_27.NIL
  if L1_17 == L11_27 then
    L11_27 = util
    L11_27 = L11_27.appendDebugOut
    L12_28 = "Set : Invalid policyName"
    L11_27(L12_28)
    L11_27 = _UPVALUE0_
    L11_27 = L11_27.BAD_PARAMETER
    return L11_27
  end
  L11_27 = _UPVALUE0_
  L11_27 = L11_27.NIL
  if L2_18 == L11_27 then
    L11_27 = util
    L11_27 = L11_27.appendDebugOut
    L12_28 = "Set : Invalid policyType"
    L11_27(L12_28)
    L11_27 = _UPVALUE0_
    L11_27 = L11_27.BAD_PARAMETER
    return L11_27
  end
  L11_27 = _UPVALUE0_
  L11_27 = L11_27.NIL
  if L4_20 == L11_27 then
    L11_27 = util
    L11_27 = L11_27.appendDebugOut
    L12_28 = "Set : Invalid policyDestinationType"
    L11_27(L12_28)
    L11_27 = _UPVALUE0_
    L11_27 = L11_27.BAD_PARAMETER
    return L11_27
  end
  L11_27 = _UPVALUE0_
  L11_27 = L11_27.NIL
  if L5_21 == L11_27 then
    L11_27 = util
    L11_27 = L11_27.appendDebugOut
    L12_28 = "Set : Invalid permission"
    L11_27(L12_28)
    L11_27 = _UPVALUE0_
    L11_27 = L11_27.BAD_PARAMETER
    return L11_27
  end
  L11_27 = _UPVALUE0_
  L11_27 = L11_27.NIL
  if L10_26 == L11_27 then
    L11_27 = util
    L11_27 = L11_27.appendDebugOut
    L12_28 = "Set : Invalid icmp"
    L11_27(L12_28)
    L11_27 = _UPVALUE0_
    L11_27 = L11_27.BAD_PARAMETER
    return L11_27
  end
  L11_27 = _UPVALUE0_
  L11_27 = L11_27.NIL
  if L3_19 == L11_27 then
    L11_27 = util
    L11_27 = L11_27.appendDebugOut
    L12_28 = "Set : Invalid policyOwnerName"
    L11_27(L12_28)
    L11_27 = _UPVALUE0_
    L11_27 = L11_27.BAD_PARAMETER
    return L11_27
  end
  L11_27 = _UPVALUE3_
  L11_27 = L11_27[2]
  if L4_20 ~= L11_27 then
    L11_27 = _UPVALUE3_
    L11_27 = L11_27[3]
    if L4_20 ~= L11_27 then
      L11_27 = _UPVALUE3_
      L11_27 = L11_27[4]
    end
  elseif L4_20 == L11_27 then
    L11_27 = _UPVALUE0_
    L11_27 = L11_27.NIL
    if L8_24 == L11_27 then
      L11_27 = util
      L11_27 = L11_27.appendDebugOut
      L12_28 = "Set : Invalid startPort"
      L11_27(L12_28)
      L11_27 = _UPVALUE0_
      L11_27 = L11_27.BAD_PARAMETER
      return L11_27
    end
    L11_27 = _UPVALUE0_
    L11_27 = L11_27.NIL
    if L9_25 == L11_27 then
      L11_27 = util
      L11_27 = L11_27.appendDebugOut
      L12_28 = "Set : Invalid endPort"
      L11_27(L12_28)
      L11_27 = _UPVALUE0_
      L11_27 = L11_27.BAD_PARAMETER
      return L11_27
    end
    L11_27 = _UPVALUE3_
    L11_27 = L11_27[2]
    if L4_20 ~= L11_27 then
      L11_27 = _UPVALUE3_
      L11_27 = L11_27[3]
    elseif L4_20 == L11_27 then
      L11_27 = _UPVALUE0_
      L11_27 = L11_27.NIL
      if L6_22 == L11_27 then
        L11_27 = util
        L11_27 = L11_27.appendDebugOut
        L12_28 = "Set : Invalid IPAddress"
        L11_27(L12_28)
        L11_27 = _UPVALUE0_
        L11_27 = L11_27.BAD_PARAMETER
        return L11_27
      end
    end
    L11_27 = _UPVALUE3_
    L11_27 = L11_27[3]
    if L4_20 == L11_27 then
      L11_27 = _UPVALUE0_
      L11_27 = L11_27.NIL
      if L7_23 == L11_27 then
        L11_27 = util
        L11_27 = L11_27.appendDebugOut
        L12_28 = "Set : Invalid maskLength"
        L11_27(L12_28)
        L11_27 = _UPVALUE0_
        L11_27 = L11_27.BAD_PARAMETER
        return L11_27
      end
    end
  end
  L11_27, L12_28 = nil, nil
  for _FORV_16_, _FORV_17_ in L13_29(_UPVALUE3_) do
    if _FORV_17_ == L4_20 then
      L4_20 = _FORV_16_
      break
    end
  end
  if L10_26 == L13_29 then
    L10_26 = _UPVALUE5_
  else
    L10_26 = _UPVALUE6_
  end
  if L2_18 == L13_29 then
    L2_18 = _UPVALUE2_
  elseif L2_18 == L13_29 then
    L2_18 = _UPVALUE7_
  elseif L2_18 == L13_29 then
    L2_18 = _UPVALUE8_
  end
  L13_29()
  L12_28 = L13_29(L1_17, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26)
  L11_27 = L13_29
  if L11_27 ~= L13_29 then
    util.appendDebugOut(L13_29 .. L11_27)
    _UPVALUE9_.abort()
    return L11_27
  end
  L13_29()
  L13_29()
  return L13_29, L12_28
end
function openVpnServerPolicySectionDelete(A0_30)
  local L1_31, L2_32, L3_33
  L3_33 = ACCESS_LEVEL
  if L3_33 ~= 0 then
    L3_33 = "Detected Unauthorized access for OpenVpnServer PAGE"
    util.appendDebugOut(L3_33)
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_31 = A0_30["omniSSLServerPolicy.cookie"]
  L3_33 = _UPVALUE0_
  L3_33 = L3_33.NIL
  if L1_31 == L3_33 then
    L3_33 = util
    L3_33 = L3_33.appendDebugOut
    L3_33("Delete : Invalid Cookie")
    L3_33 = _UPVALUE0_
    L3_33 = L3_33.BAD_PARAMETER
    return L3_33
  end
  L3_33 = _UPVALUE1_
  L3_33 = L3_33.start
  L3_33()
  L3_33 = _UPVALUE2_
  L3_33 = L3_33.openvpnPolicyDelete
  cookie, L3_33 = L1_31, L3_33(L1_31)
  L2_32 = L3_33
  L3_33 = _UPVALUE0_
  L3_33 = L3_33.SUCCESS
  if L2_32 ~= L3_33 then
    L3_33 = "Error in Delete Opetation in OpenVpnServer page "
    util.appendDebugOut(L3_33 .. L2_32)
    _UPVALUE1_.abort()
    return L2_32
  end
  L3_33 = _UPVALUE1_
  L3_33 = L3_33.complete
  L3_33()
  L3_33 = _UPVALUE1_
  L3_33 = L3_33.save
  L3_33()
  L3_33 = L2_32
  return L3_33, cookie
end
function openVpnServerPolicySectionGetAll()
  local L0_34, L1_35
  L1_35 = {}
  L0_34, L1_35 = _UPVALUE0_.openvpnPolicyGetAll()
  if L1_35 == _UPVALUE1_.NIL then
    L1_35 = {}
  end
  if L0_34 ~= _UPVALUE1_.SUCCESS then
    return L0_34, L1_35
  end
  return L0_34, L1_35
end
function openVpnServerPolicySectionDeleteAll()
  local L0_36
  L0_36 = ACCESS_LEVEL
  if L0_36 ~= 0 then
    L0_36 = "Detected Unauthorized access for OpenVpnServer PAGE"
    util.appendDebugOut(L0_36)
    return _UPVALUE0_.UNAUTHORIZED
  end
  L0_36 = _UPVALUE1_
  L0_36 = L0_36.start
  L0_36()
  L0_36 = _UPVALUE2_
  L0_36 = L0_36.openvpnPolicyDeleteAll
  cookie, L0_36 = _UPVALUE0_.UNAUTHORIZED, L0_36()
  returnCode = L0_36
  L0_36 = returnCode
  if L0_36 ~= _UPVALUE0_.SUCCESS then
    L0_36 = "Error in Delete Opetation in OpenVpnServer page "
    util.appendDebugOut(L0_36 .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  L0_36 = _UPVALUE1_
  L0_36 = L0_36.complete
  L0_36()
  L0_36 = _UPVALUE1_
  L0_36 = L0_36.save
  L0_36()
  L0_36 = returnCode
  return L0_36, cookie
end
function openVpnServerPolicySectionGetCur(A0_37)
  local L1_38, L2_39, L3_40, L4_41, L5_42, L6_43, L7_44, L8_45, L9_46, L10_47, L11_48, L12_49, L13_50
  L1_38, L2_39, L3_40, L4_41, L5_42, L6_43, L7_44, L8_45, L9_46, L10_47, L11_48, L12_49, L13_50 = _UPVALUE0_.openvpnPolicyGetCur(A0_37)
  if L1_38 ~= _UPVALUE1_.SUCCESS then
    return L1_38
  end
  if L13_50 == _UPVALUE2_ then
    L13_50 = _UPVALUE3_[2]
  else
    L13_50 = _UPVALUE3_[1]
  end
  if L4_41 == _UPVALUE4_ then
    L4_41 = _UPVALUE5_[1]
  elseif L4_41 == _UPVALUE6_ then
    L4_41 = _UPVALUE5_[2]
  elseif L4_41 == _UPVALUE7_ then
    L4_41 = _UPVALUE5_[3]
  end
  return L1_38, L2_39, L3_40, L4_41, L5_42, L6_43, L7_44, L8_45, L9_46, L10_47, L11_48, L12_49, L13_50
end
function groupsGet()
  local L0_51, L1_52
  L0_51, L1_52 = _UPVALUE0_.groupGetAll()
  if L0_51 ~= _UPVALUE1_.SUCCESS then
    return L0_51
  end
  return L0_51, L1_52
end
function usersGet()
  local L0_53, L1_54
  L0_53, L1_54 = _UPVALUE0_.openVpnUsersGetAll()
  if L1_54 == _UPVALUE1_.NIL then
    L1_54 = {}
  end
  if L0_53 ~= _UPVALUE1_.SUCCESS then
    return L0_53, L1_54
  end
  return L0_53, L1_54
end
function openVpnServerPolicySectionDefaultsGet()
  local L0_55, L1_56, L2_57, L3_58, L4_59, L5_60, L6_61, L7_62, L8_63, L9_64
  L0_55 = _UPVALUE0_
  L0_55 = L0_55[1]
  L1_56 = _UPVALUE1_
  L1_56 = L1_56[1]
  L2_57 = _UPVALUE2_
  L3_58 = _UPVALUE3_
  L4_59 = _UPVALUE4_
  L5_60 = L0_55
  L6_61 = L1_56
  L7_62 = L2_57
  L8_63 = L3_58
  L9_64 = L4_59
  return L5_60, L6_61, L7_62, L8_63, L9_64
end
