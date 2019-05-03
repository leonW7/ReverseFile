local L0_0
L0_0 = module
L0_0("com.teamf1.bl.sslvpn.server_policy", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/sslvpn_server_policy")
L0_0 = require
L0_0("teamf1lualib/sslvpn_resource")
L0_0 = require
L0_0("teamf1lualib/user-management_groups")
L0_0 = require
L0_0("teamf1lualib/user-management_users")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.sslvpn.server_policy")
function sslVpnServerSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15
  L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15 = _UPVALUE0_.sslvpnPolicyGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  L5_6 = _UPVALUE2_[tonumber(L5_6)]
  if L14_15 == _UPVALUE3_ then
    L14_15 = _UPVALUE4_[2]
  else
    L14_15 = _UPVALUE4_[1]
  end
  if L7_8 == _UPVALUE5_[1] then
    L7_8 = _UPVALUE6_
  elseif L7_8 == _UPVALUE5_[2] then
    L7_8 = _UPVALUE7_
  elseif L7_8 == _UPVALUE5_[3] then
    L7_8 = _UPVALUE8_
  end
  if L3_4 == _UPVALUE9_ then
    L3_4 = _UPVALUE10_[1]
  elseif L3_4 == _UPVALUE11_ then
    L3_4 = _UPVALUE10_[2]
  elseif L3_4 == _UPVALUE12_ then
    L3_4 = _UPVALUE10_[3]
  end
  return L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15
end
function sslVpnServerSectionGetNext(A0_16)
  local L1_17, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26, L11_27, L12_28, L13_29, L14_30, L15_31, L16_32
  L1_17 = A0_16["sslVpnServer.cookie"]
  L2_18 = _UPVALUE0_
  L2_18 = L2_18.NIL
  if L1_17 == L2_18 then
    L2_18 = util
    L2_18 = L2_18.appendDebugOut
    L3_19 = "GetNext : Invalid Cookie"
    L2_18(L3_19)
    L2_18 = _UPVALUE0_
    L2_18 = L2_18.BAD_PARAMETER
    return L2_18
  end
  L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26, L11_27, L12_28, L13_29, L14_30, L15_31, L16_32 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26, L11_27, L12_28, L13_29, L14_30, L15_31, L16_32 = _UPVALUE1_.sslvpnPolicyGet()
  if L2_18 ~= _UPVALUE0_.SUCCESS then
    return L2_18
  end
  L7_23 = _UPVALUE2_[tonumber(L7_23)]
  if L16_32 == _UPVALUE3_ then
    L16_32 = _UPVALUE4_[2]
  else
    L16_32 = _UPVALUE4_[1]
  end
  if L9_25 == _UPVALUE5_[1] then
    L9_25 = _UPVALUE6_
  elseif L9_25 == _UPVALUE5_[2] then
    L9_25 = _UPVALUE7_
  elseif L9_25 == _UPVALUE5_[3] then
    L9_25 = _UPVALUE8_
  end
  if L5_21 == _UPVALUE9_ then
    L5_21 = _UPVALUE10_[1]
  elseif L5_21 == _UPVALUE11_ then
    L5_21 = _UPVALUE10_[2]
  elseif L5_21 == _UPVALUE12_ then
    L5_21 = _UPVALUE10_[3]
  end
  return L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26, L11_27, L12_28, L13_29, L14_30, L15_31, L16_32
end
function sslVpnServerSectionSet(A0_33)
  local L1_34, L2_35, L3_36, L4_37, L5_38, L6_39, L7_40, L8_41, L9_42, L10_43, L11_44, L12_45, L13_46, L14_47, L15_48
  L1_34 = ACCESS_LEVEL
  if L1_34 ~= 0 then
    L1_34 = util
    L1_34 = L1_34.appendDebugOut
    L2_35 = "Detected Unauthorized access for page sslVpnServer"
    L1_34(L2_35)
    L1_34 = _UPVALUE0_
    L1_34 = L1_34.UNAUTHORIZED
    return L1_34
  end
  L1_34 = A0_33["sslVpnServer.cookie"]
  L2_35 = A0_33["sslVpnServer.policyName"]
  L3_36 = A0_33["sslVpnServer.policyType"]
  L4_37 = A0_33["sslVpnServer.policyOwnerName"]
  L5_38 = A0_33["sslVpnServer.policyDestinationType"]
  L6_39 = A0_33["sslVpnServer.permission"]
  L7_40 = A0_33["sslVpnServer.serviceType"]
  L8_41 = A0_33["sslVpnServer.IPAddress"]
  L9_42 = A0_33["sslVpnServer.maskLength"]
  L10_43 = A0_33["sslVpnServer.resourceName"]
  L11_44 = A0_33["sslVpnServer.startPort"]
  L12_45 = A0_33["sslVpnServer.endPort"]
  L13_46 = A0_33["sslVpnServer.icmp"]
  L14_47 = _UPVALUE0_
  L14_47 = L14_47.NIL
  if L6_39 == L14_47 then
    L14_47 = util
    L14_47 = L14_47.appendDebugOut
    L15_48 = "Set : Invalid permission"
    L14_47(L15_48)
    L14_47 = _UPVALUE0_
    L14_47 = L14_47.BAD_PARAMETER
    return L14_47
  end
  L14_47 = _UPVALUE0_
  L14_47 = L14_47.NIL
  if L13_46 == L14_47 then
    L14_47 = util
    L14_47 = L14_47.appendDebugOut
    L15_48 = "Set : Invalid icmp"
    L14_47(L15_48)
    L14_47 = _UPVALUE0_
    L14_47 = L14_47.BAD_PARAMETER
    return L14_47
  end
  L14_47 = _UPVALUE1_
  L14_47 = L14_47[2]
  if L5_38 ~= L14_47 then
    L14_47 = _UPVALUE1_
    L14_47 = L14_47[3]
    if L5_38 ~= L14_47 then
      L14_47 = _UPVALUE1_
      L14_47 = L14_47[4]
    end
  elseif L5_38 == L14_47 then
    L14_47 = _UPVALUE0_
    L14_47 = L14_47.NIL
    if L11_44 == L14_47 then
      L14_47 = util
      L14_47 = L14_47.appendDebugOut
      L15_48 = "Set : Invalid startPort"
      L14_47(L15_48)
      L14_47 = _UPVALUE0_
      L14_47 = L14_47.BAD_PARAMETER
      return L14_47
    end
    L14_47 = _UPVALUE0_
    L14_47 = L14_47.NIL
    if L12_45 == L14_47 then
      L14_47 = util
      L14_47 = L14_47.appendDebugOut
      L15_48 = "Set : Invalid endPort"
      L14_47(L15_48)
      L14_47 = _UPVALUE0_
      L14_47 = L14_47.BAD_PARAMETER
      return L14_47
    end
    L14_47 = _UPVALUE1_
    L14_47 = L14_47[2]
    if L5_38 ~= L14_47 then
      L14_47 = _UPVALUE1_
      L14_47 = L14_47[3]
    elseif L5_38 == L14_47 then
      L14_47 = _UPVALUE0_
      L14_47 = L14_47.NIL
      if L8_41 == L14_47 then
        L14_47 = util
        L14_47 = L14_47.appendDebugOut
        L15_48 = "Set : Invalid IPAddress"
        L14_47(L15_48)
        L14_47 = _UPVALUE0_
        L14_47 = L14_47.BAD_PARAMETER
        return L14_47
      end
    end
    L14_47 = _UPVALUE1_
    L14_47 = L14_47[3]
    if L5_38 == L14_47 then
      L14_47 = _UPVALUE0_
      L14_47 = L14_47.NIL
      if L9_42 == L14_47 then
        L14_47 = util
        L14_47 = L14_47.appendDebugOut
        L15_48 = "Set : Invalid maskLength"
        L14_47(L15_48)
        L14_47 = _UPVALUE0_
        L14_47 = L14_47.BAD_PARAMETER
        return L14_47
      end
    end
  end
  L14_47 = _UPVALUE1_
  L14_47 = L14_47[1]
  if L5_38 == L14_47 then
    L14_47 = _UPVALUE0_
    L14_47 = L14_47.NIL
    if L10_43 == L14_47 then
      L14_47 = util
      L14_47 = L14_47.appendDebugOut
      L15_48 = "Set : Invalid resourceName"
      L14_47(L15_48)
      L14_47 = _UPVALUE0_
      L14_47 = L14_47.BAD_PARAMETER
      return L14_47
    end
  end
  L14_47, L15_48 = nil, nil
  for _FORV_19_, _FORV_20_ in pairs(_UPVALUE1_) do
    if _FORV_20_ == L5_38 then
      L5_38 = _FORV_19_
      break
    end
  end
  if L13_46 == _UPVALUE2_[2] then
    L13_46 = _UPVALUE3_
  else
    L13_46 = _UPVALUE4_
  end
  if L7_40 == _UPVALUE5_[1] then
    L7_40 = _UPVALUE6_
  elseif L7_40 == _UPVALUE5_[2] then
    L7_40 = _UPVALUE7_
  elseif L7_40 == _UPVALUE5_[3] then
    L7_40 = _UPVALUE8_
  end
  if L3_36 == _UPVALUE9_[1] then
    L3_36 = _UPVALUE10_
  elseif L3_36 == _UPVALUE9_[2] then
    L3_36 = _UPVALUE11_
  elseif L3_36 == _UPVALUE9_[3] then
    L3_36 = _UPVALUE12_
  end
  _UPVALUE13_.start()
  L14_47, L15_48 = _UPVALUE14_.sslvpnPolicySet(L1_34, L2_35, L3_36, L4_37, L5_38, L6_39, L7_40, L8_41, L9_42, L10_43, L11_44, L12_45, L13_46)
  if L14_47 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page sslVpnServer" .. L14_47)
    _UPVALUE13_.abort()
    return L14_47, L1_34
  end
  _UPVALUE13_.complete()
  _UPVALUE13_.save()
  return _UPVALUE0_.SUCCESS, L15_48
end
function sslVpnServerSectionCreate(A0_49)
  local L1_50, L2_51, L3_52, L4_53, L5_54, L6_55, L7_56, L8_57, L9_58, L10_59, L11_60, L12_61, L13_62, L14_63
  L1_50 = ACCESS_LEVEL
  if L1_50 ~= 0 then
    L1_50 = util
    L1_50 = L1_50.appendDebugOut
    L2_51 = "Detected Unauthorized access for page sslVpnServer"
    L1_50(L2_51)
    L1_50 = _UPVALUE0_
    L1_50 = L1_50.UNAUTHORIZED
    return L1_50
  end
  L1_50 = A0_49["sslVpnServer.policyName"]
  L2_51 = A0_49["sslVpnServer.policyType"]
  L3_52 = nil
  L4_53 = _UPVALUE1_
  L4_53 = L4_53[1]
  if L2_51 == L4_53 then
    L3_52 = _UPVALUE2_
  else
    L4_53 = _UPVALUE1_
    L4_53 = L4_53[2]
    if L2_51 == L4_53 then
      L3_52 = A0_49["sslVpnServer.policyOwnerName1"]
    else
      L4_53 = _UPVALUE1_
      L4_53 = L4_53[3]
      if L2_51 == L4_53 then
        L3_52 = A0_49["sslVpnServer.policyOwnerName2"]
      end
    end
  end
  L4_53 = A0_49["sslVpnServer.policyDestinationType"]
  L5_54 = A0_49["sslVpnServer.permission"]
  L6_55 = A0_49["sslVpnServer.serviceType"]
  L7_56 = A0_49["sslVpnServer.IPAddress"]
  L8_57 = A0_49["sslVpnServer.maskLength"]
  L9_58 = A0_49["sslVpnServer.resourceName"]
  L10_59 = A0_49["sslVpnServer.startPort"]
  L11_60 = A0_49["sslVpnServer.endPort"]
  L12_61 = A0_49["sslVpnServer.icmp"]
  L13_62 = _UPVALUE0_
  L13_62 = L13_62.NIL
  if L1_50 == L13_62 then
    L13_62 = util
    L13_62 = L13_62.appendDebugOut
    L14_63 = "Set : Invalid policyName"
    L13_62(L14_63)
    L13_62 = _UPVALUE0_
    L13_62 = L13_62.BAD_PARAMETER
    return L13_62
  end
  L13_62 = _UPVALUE0_
  L13_62 = L13_62.NIL
  if L2_51 == L13_62 then
    L13_62 = util
    L13_62 = L13_62.appendDebugOut
    L14_63 = "Set : Invalid policyType"
    L13_62(L14_63)
    L13_62 = _UPVALUE0_
    L13_62 = L13_62.BAD_PARAMETER
    return L13_62
  end
  L13_62 = _UPVALUE0_
  L13_62 = L13_62.NIL
  if L4_53 == L13_62 then
    L13_62 = util
    L13_62 = L13_62.appendDebugOut
    L14_63 = "Set : Invalid policyDestinationType"
    L13_62(L14_63)
    L13_62 = _UPVALUE0_
    L13_62 = L13_62.BAD_PARAMETER
    return L13_62
  end
  L13_62 = _UPVALUE0_
  L13_62 = L13_62.NIL
  if L5_54 == L13_62 then
    L13_62 = util
    L13_62 = L13_62.appendDebugOut
    L14_63 = "Set : Invalid permission"
    L13_62(L14_63)
    L13_62 = _UPVALUE0_
    L13_62 = L13_62.BAD_PARAMETER
    return L13_62
  end
  L13_62 = _UPVALUE0_
  L13_62 = L13_62.NIL
  if L12_61 == L13_62 then
    L13_62 = util
    L13_62 = L13_62.appendDebugOut
    L14_63 = "Set : Invalid icmp"
    L13_62(L14_63)
    L13_62 = _UPVALUE0_
    L13_62 = L13_62.BAD_PARAMETER
    return L13_62
  end
  L13_62 = _UPVALUE0_
  L13_62 = L13_62.NIL
  if L3_52 == L13_62 then
    L13_62 = util
    L13_62 = L13_62.appendDebugOut
    L14_63 = "Set : Invalid policyOwnerName"
    L13_62(L14_63)
    L13_62 = _UPVALUE0_
    L13_62 = L13_62.BAD_PARAMETER
    return L13_62
  end
  L13_62 = _UPVALUE3_
  L13_62 = L13_62[2]
  if L4_53 ~= L13_62 then
    L13_62 = _UPVALUE3_
    L13_62 = L13_62[3]
    if L4_53 ~= L13_62 then
      L13_62 = _UPVALUE3_
      L13_62 = L13_62[4]
    end
  elseif L4_53 == L13_62 then
    L13_62 = _UPVALUE0_
    L13_62 = L13_62.NIL
    if L10_59 == L13_62 then
      L13_62 = util
      L13_62 = L13_62.appendDebugOut
      L14_63 = "Set : Invalid startPort"
      L13_62(L14_63)
      L13_62 = _UPVALUE0_
      L13_62 = L13_62.BAD_PARAMETER
      return L13_62
    end
    L13_62 = _UPVALUE0_
    L13_62 = L13_62.NIL
    if L11_60 == L13_62 then
      L13_62 = util
      L13_62 = L13_62.appendDebugOut
      L14_63 = "Set : Invalid endPort"
      L13_62(L14_63)
      L13_62 = _UPVALUE0_
      L13_62 = L13_62.BAD_PARAMETER
      return L13_62
    end
    L13_62 = _UPVALUE3_
    L13_62 = L13_62[2]
    if L4_53 ~= L13_62 then
      L13_62 = _UPVALUE3_
      L13_62 = L13_62[3]
    elseif L4_53 == L13_62 then
      L13_62 = _UPVALUE0_
      L13_62 = L13_62.NIL
      if L7_56 == L13_62 then
        L13_62 = util
        L13_62 = L13_62.appendDebugOut
        L14_63 = "Set : Invalid IPAddress"
        L13_62(L14_63)
        L13_62 = _UPVALUE0_
        L13_62 = L13_62.BAD_PARAMETER
        return L13_62
      end
    end
    L13_62 = _UPVALUE3_
    L13_62 = L13_62[3]
    if L4_53 == L13_62 then
      L13_62 = _UPVALUE0_
      L13_62 = L13_62.NIL
      if L8_57 == L13_62 then
        L13_62 = util
        L13_62 = L13_62.appendDebugOut
        L14_63 = "Set : Invalid maskLength"
        L13_62(L14_63)
        L13_62 = _UPVALUE0_
        L13_62 = L13_62.BAD_PARAMETER
        return L13_62
      end
    end
  end
  L13_62 = _UPVALUE3_
  L13_62 = L13_62[1]
  if L4_53 == L13_62 then
    L13_62 = _UPVALUE0_
    L13_62 = L13_62.NIL
    if L9_58 == L13_62 then
      L13_62 = util
      L13_62 = L13_62.appendDebugOut
      L14_63 = "Set : Invalid resourceName"
      L13_62(L14_63)
      L13_62 = _UPVALUE0_
      L13_62 = L13_62.BAD_PARAMETER
      return L13_62
    end
  end
  L13_62, L14_63 = nil, nil
  for _FORV_18_, _FORV_19_ in pairs(_UPVALUE3_) do
    if _FORV_19_ == L4_53 then
      L4_53 = _FORV_18_
      break
    end
  end
  if L12_61 == _UPVALUE4_[2] then
    L12_61 = _UPVALUE5_
  else
    L12_61 = _UPVALUE6_
  end
  if L6_55 == _UPVALUE7_[1] then
    L6_55 = _UPVALUE8_
  elseif L6_55 == _UPVALUE7_[2] then
    L6_55 = _UPVALUE9_
  elseif L6_55 == _UPVALUE7_[3] then
    L6_55 = _UPVALUE10_
  end
  if L2_51 == _UPVALUE1_[1] then
    L2_51 = _UPVALUE2_
  elseif L2_51 == _UPVALUE1_[2] then
    L2_51 = _UPVALUE11_
  elseif L2_51 == _UPVALUE1_[3] then
    L2_51 = _UPVALUE12_
  end
  _UPVALUE13_.start()
  L13_62, L14_63 = _UPVALUE14_.sslvpnPolicyCreate(L1_50, L2_51, L3_52, L4_53, L5_54, L6_55, L7_56, L8_57, L9_58, L10_59, L11_60, L12_61)
  if L13_62 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page sslVpnServer" .. L13_62)
    _UPVALUE13_.abort()
    return L13_62
  end
  _UPVALUE13_.complete()
  _UPVALUE13_.save()
  return _UPVALUE0_.SUCCESS, L14_63
end
function sslVpnServerSectionDelete(A0_64)
  local L1_65, L2_66
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for sslVpnServer PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_65 = A0_64["sslVpnServer.cookie"]
  if L1_65 == _UPVALUE0_.NIL then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L2_66, cookie = _UPVALUE2_.sslvpnPolicyDelete(L1_65)
  if L2_66 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in sslVpnServer page " .. L2_66)
    _UPVALUE1_.abort()
    return L2_66
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L2_66, cookie
end
function sslVpnServerFeatureSet(A0_67)
  local L1_68, L2_69, L3_70, L4_71
  L1_68 = ACCESS_LEVEL
  if L1_68 ~= 0 then
    L1_68 = util
    L1_68 = L1_68.appendDebugOut
    L2_69 = "Detected Unauthorized access for page sslVpnServer"
    L1_68(L2_69)
    L1_68 = _UPVALUE0_
    L1_68 = L1_68.UNAUTHORIZED
    return L1_68
  end
  L1_68 = A0_67["sslVpnServer.feature"]
  L2_69 = _UPVALUE1_
  L3_70 = _UPVALUE0_
  L3_70 = L3_70.NIL
  if L1_68 == L3_70 then
    L3_70 = util
    L3_70 = L3_70.appendDebugOut
    L4_71 = "Set : Invalid feature"
    L3_70(L4_71)
    L3_70 = _UPVALUE0_
    L3_70 = L3_70.BAD_PARAMETER
    return L3_70
  end
  L3_70, L4_71 = nil, nil
  _UPVALUE2_.start()
  if L1_68 == _UPVALUE3_ then
    L3_70, L4_71 = _UPVALUE4_.featureEnable(L2_69)
  else
    L3_70, L4_71 = _UPVALUE4_.featureDisable(L2_69)
  end
  if L3_70 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page sslVpnServer" .. L3_70)
    _UPVALUE2_.abort()
    return L3_70
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return _UPVALUE0_.SUCCESS, L4_71
end
function sslVpnServerFeatureGet()
  local L0_72, L1_73, L2_74
  L0_72, L1_73, L2_74 = _UPVALUE0_.isfeatureEnabled()
  if L0_72 ~= _UPVALUE1_.SUCCESS then
    return L0_72
  end
  return L0_72, L1_73, L2_74
end
function sslVpnServerSectionGetAll()
  local L0_75, L1_76
  L1_76 = {}
  L0_75, L1_76 = _UPVALUE0_.sslvpnPolicyGetAll()
  if L1_76 == _UPVALUE1_.NIL then
    L1_76 = {}
  end
  if L0_75 ~= _UPVALUE1_.SUCCESS then
    return L0_75, L1_76
  end
  return L0_75, L1_76
end
function sslVpnServerSectionDeleteAll()
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for sslVpnServer PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.sslvpnPolicyDeleteAll()
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in sslVpnServer page " .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
function sslVpnServerSectionGetCur(A0_77)
  local L1_78, L2_79, L3_80, L4_81, L5_82, L6_83, L7_84, L8_85, L9_86, L10_87, L11_88, L12_89, L13_90, L14_91, L15_92
  L1_78, L2_79, L3_80, L4_81, L5_82, L6_83, L7_84, L8_85, L9_86, L10_87, L11_88, L12_89, L13_90, L14_91, L15_92 = _UPVALUE0_.sslvpnPolicyGetCur(A0_77)
  if L1_78 ~= _UPVALUE1_.SUCCESS then
    return L1_78
  end
  if L15_92 == _UPVALUE2_ then
    L15_92 = _UPVALUE3_[2]
  else
    L15_92 = _UPVALUE3_[1]
  end
  if L8_85 == _UPVALUE4_ then
    L8_85 = _UPVALUE5_[1]
  elseif L8_85 == _UPVALUE6_ then
    L8_85 = _UPVALUE5_[2]
  elseif L8_85 == _UPVALUE7_ then
    L8_85 = _UPVALUE5_[3]
  end
  if L4_81 == _UPVALUE8_ then
    L4_81 = _UPVALUE9_[1]
  elseif L4_81 == _UPVALUE10_ then
    L4_81 = _UPVALUE9_[2]
  elseif L4_81 == _UPVALUE11_ then
    L4_81 = _UPVALUE9_[3]
  end
  return L1_78, L2_79, L3_80, L4_81, L5_82, L6_83, L7_84, L8_85, L9_86, L10_87, L11_88, L12_89, L13_90, L14_91, L15_92
end
function groupsGet()
  local L0_93, L1_94
  L0_93, L1_94 = _UPVALUE0_.groupGetAll()
  if L0_93 ~= _UPVALUE1_.SUCCESS then
    return L0_93
  end
  return L0_93, L1_94
end
function usersGet()
  local L0_95, L1_96
  L0_95, L1_96 = _UPVALUE0_.usersGetAll()
  if L0_95 ~= _UPVALUE1_.SUCCESS then
    return L0_95
  end
  return L0_95, L1_96
end
function resourcesGet()
  local L0_97, L1_98
  L0_97, L1_98 = _UPVALUE0_.resourceConfigGetAll()
  if L1_98 == _UPVALUE1_.NIL then
    L1_98 = {}
  end
  if L0_97 ~= _UPVALUE1_.SUCCESS then
    return L0_97, L1_98
  end
  return L0_97, L1_98
end
function sslVpnServerSectionDefaultsGet()
  local L0_99, L1_100, L2_101, L3_102, L4_103, L5_104, L6_105, L7_106, L8_107, L9_108, L10_109, L11_110
  L0_99 = _UPVALUE0_
  L0_99 = L0_99[1]
  L1_100 = _UPVALUE1_
  L1_100 = L1_100[1]
  L2_101 = _UPVALUE2_
  L3_102 = _UPVALUE3_
  L3_102 = L3_102[1]
  L4_103 = _UPVALUE4_
  L5_104 = _UPVALUE5_
  L6_105 = L0_99
  L7_106 = L1_100
  L8_107 = L2_101
  L9_108 = L3_102
  L10_109 = L4_103
  L11_110 = L5_104
  return L6_105, L7_106, L8_107, L9_108, L10_109, L11_110
end
