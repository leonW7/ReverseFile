local L0_0
L0_0 = module
L0_0("com.teamf1.bl.sslvpn.resource", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/sslvpn_resource")
L0_0 = require
L0_0("teamf1lualib/sslvpn_resourceConfig")
L0_0 = require
L0_0("teamf1lualib/sslvpn_portForwarding")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function sslvpnResourcesSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  L0_1, L1_2, L2_3, L3_4, L4_5 = _UPVALUE0_.resourceConfigGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  if L3_4 == _UPVALUE2_ then
    L3_4 = _UPVALUE3_[1]
  elseif L3_4 == _UPVALUE4_ then
    L3_4 = _UPVALUE3_[2]
  elseif L3_4 == _UPVALUE5_ then
    L3_4 = _UPVALUE3_[3]
  end
  return L0_1, L1_2, L2_3, L3_4, L4_5
end
function sslvpnResourcesSectionGetNext(A0_6)
  local L1_7, L2_8, L3_9, L4_10, L5_11, L6_12
  L1_7 = A0_6["sslvpnResources.cookie"]
  L2_8 = _UPVALUE0_
  L2_8 = L2_8.NIL
  if L1_7 == L2_8 then
    L2_8 = util
    L2_8 = L2_8.appendDebugOut
    L3_9 = "GetNext : Invalid Cookie"
    L2_8(L3_9)
    L2_8 = _UPVALUE0_
    L2_8 = L2_8.BAD_PARAMETER
    return L2_8
  end
  L2_8, L3_9, L4_10, L5_11, L6_12 = nil, nil, nil, nil, nil
  L2_8, L3_9, L4_10, L5_11, L6_12 = _UPVALUE1_.resourceConfigGetNext(L1_7)
  if L2_8 ~= _UPVALUE0_.SUCCESS then
    return L2_8
  end
  if L5_11 == _UPVALUE2_ then
    L5_11 = _UPVALUE3_[1]
  elseif L5_11 == _UPVALUE4_ then
    L5_11 = _UPVALUE3_[2]
  elseif L5_11 == _UPVALUE5_ then
    L5_11 = _UPVALUE3_[3]
  end
  return L2_8, L3_9, L4_10, L5_11, L6_12
end
function sslvpnResourcesSectionGetCur(A0_13)
  local L1_14, L2_15, L3_16, L4_17, L5_18, L6_19, L7_20, L8_21, L9_22
  L9_22, L1_14, L3_16, L4_17, L5_18, L6_19, L7_20, L8_21 = _UPVALUE0_.resourceConfigurationGetCur(A0_13)
  L2_15 = _UPVALUE1_.curServiceTypeGet(L1_14)
  if L9_22 ~= _UPVALUE2_.SUCCESS then
    return L9_22
  end
  if L2_15 == _UPVALUE3_ then
    L2_15 = _UPVALUE4_[1]
  elseif L2_15 == _UPVALUE5_ then
    L2_15 = _UPVALUE4_[2]
  elseif L2_15 == _UPVALUE6_ then
    L2_15 = _UPVALUE4_[3]
  end
  if L3_16 == _UPVALUE7_ then
    L3_16 = "1"
  elseif L3_16 == _UPVALUE8_ then
    L3_16 = "0"
  end
  return _UPVALUE2_.SUCCESS, A0_13, L1_14, L2_15, L3_16, L4_17, L5_18, L6_19, L7_20, L8_21
end
function sslvpnResourcesSectionGetAll()
  local L0_23, L1_24
  L1_24 = {}
  L0_23, L1_24 = _UPVALUE0_.resourceConfigurationGetAll()
  if L1_24 == _UPVALUE1_.NIL then
    L1_24 = {}
  end
  for _FORV_5_, _FORV_6_ in pairs(L1_24) do
    L1_24[_FORV_5_].ServiceType = _UPVALUE2_.curServiceTypeGet(L1_24[_FORV_5_].ResourceName)
  end
  if L0_23 ~= _UPVALUE1_.SUCCESS then
    return L0_23, L1_24
  end
  return L0_23, L1_24
end
function sslvpnResourcesSectionSet(A0_25)
  local L1_26, L2_27, L3_28, L4_29, L5_30, L6_31, L7_32, L8_33, L9_34, L10_35, L11_36
  L1_26 = ACCESS_LEVEL
  if L1_26 ~= 0 then
    L1_26 = util
    L1_26 = L1_26.appendDebugOut
    L2_27 = "Detected Unauthorized access for page sslvpnResources"
    L1_26(L2_27)
    L1_26 = _UPVALUE0_
    L1_26 = L1_26.UNAUTHORIZED
    return L1_26
  end
  L1_26 = A0_25["sslvpnResources.cookie"]
  L2_27 = A0_25["sslvpnResources.resourceName"]
  L3_28 = A0_25["sslvpnResources.serviceType"]
  L4_29 = A0_25["sslvpnResources.icmp"]
  L5_30 = A0_25["sslvpnResources.objectType"]
  L6_31 = A0_25["sslvpnResources.objectAddress"]
  L7_32 = A0_25["sslvpnResources.maskLength"]
  L8_33 = A0_25["sslvpnResources.startPort"]
  L9_34 = A0_25["sslvpnResources.endPort"]
  L10_35 = _UPVALUE0_
  L10_35 = L10_35.NIL
  if L2_27 == L10_35 then
    L10_35 = util
    L10_35 = L10_35.appendDebugOut
    L11_36 = "Set : Invalid resourceName"
    L10_35(L11_36)
    L10_35 = _UPVALUE0_
    L10_35 = L10_35.BAD_PARAMETER
    return L10_35
  end
  L10_35 = _UPVALUE0_
  L10_35 = L10_35.NIL
  if L3_28 == L10_35 then
    L10_35 = util
    L10_35 = L10_35.appendDebugOut
    L11_36 = "Set : Invalid serviceType"
    L10_35(L11_36)
    L10_35 = _UPVALUE0_
    L10_35 = L10_35.BAD_PARAMETER
    return L10_35
  end
  L10_35 = _UPVALUE0_
  L10_35 = L10_35.NIL
  if L5_30 == L10_35 then
    L10_35 = util
    L10_35 = L10_35.appendDebugOut
    L11_36 = "Set : Invalid objectType"
    L10_35(L11_36)
    L10_35 = _UPVALUE0_
    L10_35 = L10_35.BAD_PARAMETER
    return L10_35
  end
  L10_35 = _UPVALUE0_
  L10_35 = L10_35.NIL
  if L8_33 == L10_35 then
    L10_35 = util
    L10_35 = L10_35.appendDebugOut
    L11_36 = "Set : Invalid startPort"
    L10_35(L11_36)
    L10_35 = _UPVALUE0_
    L10_35 = L10_35.BAD_PARAMETER
    return L10_35
  end
  L10_35 = _UPVALUE0_
  L10_35 = L10_35.NIL
  if L9_34 == L10_35 then
    L10_35 = util
    L10_35 = L10_35.appendDebugOut
    L11_36 = "Set : Invalid endPort"
    L10_35(L11_36)
    L10_35 = _UPVALUE0_
    L10_35 = L10_35.BAD_PARAMETER
    return L10_35
  end
  L10_35 = _UPVALUE0_
  L10_35 = L10_35.NIL
  if L6_31 == L10_35 then
    L10_35 = util
    L10_35 = L10_35.appendDebugOut
    L11_36 = "Set : Invalid objectAddress"
    L10_35(L11_36)
    L10_35 = _UPVALUE0_
    L10_35 = L10_35.BAD_PARAMETER
    return L10_35
  end
  L10_35 = _UPVALUE0_
  L10_35 = L10_35.NIL
  if L1_26 == L10_35 then
    L10_35 = util
    L10_35 = L10_35.appendDebugOut
    L11_36 = "Set : Invalid Cookie"
    L10_35(L11_36)
    L10_35 = _UPVALUE0_
    L10_35 = L10_35.BAD_PARAMETER
    return L10_35
  end
  L10_35, L11_36 = nil, nil
  if L3_28 == _UPVALUE1_[1] then
    L3_28 = _UPVALUE2_
  elseif L3_28 == _UPVALUE1_[2] then
    L3_28 = _UPVALUE3_
  elseif L3_28 == _UPVALUE1_[3] then
    L3_28 = _UPVALUE4_
  end
  if L4_29 == "0" then
    L4_29 = _UPVALUE5_
  elseif L4_29 == "1" then
    L4_29 = _UPVALUE6_
  end
  _UPVALUE7_.start()
  L10_35, L11_36 = _UPVALUE8_.resourceConfigurationSet(L1_26, L2_27, L3_28, L5_30, L6_31, L7_32, L8_33, L9_34, L4_29)
  if L10_35 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page sslvpnResources" .. L10_35)
    _UPVALUE7_.abort()
    return L10_35
  end
  _UPVALUE7_.complete()
  _UPVALUE7_.save()
  return _UPVALUE0_.SUCCESS, L11_36
end
function sslvpnResourcesSectionCreate(A0_37)
  local L1_38, L2_39, L3_40, L4_41, L5_42, L6_43, L7_44, L8_45, L9_46, L10_47
  L1_38 = ACCESS_LEVEL
  if L1_38 ~= 0 then
    L1_38 = util
    L1_38 = L1_38.appendDebugOut
    L2_39 = "Detected Unauthorized access for page sslvpnResources"
    L1_38(L2_39)
    L1_38 = _UPVALUE0_
    L1_38 = L1_38.UNAUTHORIZED
    return L1_38
  end
  L1_38 = A0_37["sslvpnResources.resourceName"]
  L2_39 = A0_37["sslvpnResources.serviceType"]
  L3_40 = A0_37["sslvpnResources.icmp"]
  L4_41 = A0_37["sslvpnResources.objectType"]
  L5_42 = A0_37["sslvpnResources.objectAddress"]
  L6_43 = A0_37["sslvpnResources.maskLength"]
  L7_44 = A0_37["sslvpnResources.startPort"]
  L8_45 = A0_37["sslvpnResources.endPort"]
  L9_46 = _UPVALUE0_
  L9_46 = L9_46.NIL
  if L1_38 == L9_46 then
    L9_46 = util
    L9_46 = L9_46.appendDebugOut
    L10_47 = "Set : Invalid resourceName"
    L9_46(L10_47)
    L9_46 = _UPVALUE0_
    L9_46 = L9_46.BAD_PARAMETER
    return L9_46
  end
  L9_46 = _UPVALUE0_
  L9_46 = L9_46.NIL
  if L2_39 == L9_46 then
    L9_46 = util
    L9_46 = L9_46.appendDebugOut
    L10_47 = "Set : Invalid serviceType"
    L9_46(L10_47)
    L9_46 = _UPVALUE0_
    L9_46 = L9_46.BAD_PARAMETER
    return L9_46
  end
  L9_46 = _UPVALUE0_
  L9_46 = L9_46.NIL
  if L4_41 == L9_46 then
    L9_46 = util
    L9_46 = L9_46.appendDebugOut
    L10_47 = "Set : Invalid objectType"
    L9_46(L10_47)
    L9_46 = _UPVALUE0_
    L9_46 = L9_46.BAD_PARAMETER
    return L9_46
  end
  L9_46 = _UPVALUE0_
  L9_46 = L9_46.NIL
  if L7_44 == L9_46 then
    L9_46 = util
    L9_46 = L9_46.appendDebugOut
    L10_47 = "Set : Invalid startPort"
    L9_46(L10_47)
    L9_46 = _UPVALUE0_
    L9_46 = L9_46.BAD_PARAMETER
    return L9_46
  end
  L9_46 = _UPVALUE0_
  L9_46 = L9_46.NIL
  if L8_45 == L9_46 then
    L9_46 = util
    L9_46 = L9_46.appendDebugOut
    L10_47 = "Set : Invalid endPort"
    L9_46(L10_47)
    L9_46 = _UPVALUE0_
    L9_46 = L9_46.BAD_PARAMETER
    return L9_46
  end
  L9_46 = _UPVALUE0_
  L9_46 = L9_46.NIL
  if L5_42 == L9_46 then
    L9_46 = util
    L9_46 = L9_46.appendDebugOut
    L10_47 = "Set : Invalid objectAddress"
    L9_46(L10_47)
    L9_46 = _UPVALUE0_
    L9_46 = L9_46.BAD_PARAMETER
    return L9_46
  end
  L9_46, L10_47 = nil, nil
  if L2_39 == _UPVALUE1_[1] then
    L2_39 = _UPVALUE2_
  elseif L2_39 == _UPVALUE1_[2] then
    L2_39 = _UPVALUE3_
  elseif L2_39 == _UPVALUE1_[3] then
    L2_39 = _UPVALUE4_
  end
  if L3_40 == "0" then
    L3_40 = _UPVALUE5_
  elseif L3_40 == "1" then
    L3_40 = _UPVALUE6_
  end
  _UPVALUE7_.start()
  L9_46, L10_47 = _UPVALUE8_.resourceConfigCreate(L1_38, L2_39)
  if L9_46 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page sslvpnResources" .. L9_46)
    _UPVALUE7_.abort()
    return L9_46
  end
  L9_46, L10_47 = _UPVALUE9_.resourceConfigurationCreate(L1_38, L4_41, L5_42, L6_43, L7_44, L8_45, L3_40)
  if L9_46 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page sslvpnResources" .. L9_46)
    _UPVALUE7_.abort()
    return L9_46
  end
  _UPVALUE7_.complete()
  _UPVALUE7_.save()
  return _UPVALUE0_.SUCCESS, L10_47
end
function sslvpnResourcesSectionDelete(A0_48)
  local L1_49, L2_50
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for sslvpnResources PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_49 = A0_48["sslvpnResources.cookie"]
  if L1_49 == _UPVALUE0_.NIL then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L2_50, resourceName, count = _UPVALUE2_.curResourceNameGet(L1_49)
  if L2_50 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in sslvpnResources page " .. L2_50)
    _UPVALUE1_.abort()
    return L2_50
  end
  if count == 1 then
    L2_50 = _UPVALUE3_.useCountCheck(resourceName)
    if L2_50 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in Delete Opetation in sslvpnResources page " .. L2_50)
      _UPVALUE1_.abort()
      return L2_50
    end
    L2_50, cookie = _UPVALUE3_.resourceDelete(resourceName)
    if L2_50 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in Delete Opetation in sslvpnResources page " .. L2_50)
      _UPVALUE1_.abort()
      return L2_50
    end
  else
    L2_50, cookie = _UPVALUE2_.resourceConfigurationDelete(L1_49)
    if L2_50 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in Delete Opetation in sslvpnResources page " .. L2_50)
      _UPVALUE1_.abort()
      return L2_50
    end
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L2_50, cookie
end
function sslvpnResourcesSectionDeleteAll()
  local L0_51, L1_52
  L1_52 = ACCESS_LEVEL
  if L1_52 ~= 0 then
    L1_52 = util
    L1_52 = L1_52.appendDebugOut
    L1_52("Detected Unauthorized access for sslvpnResources PAGE")
    L1_52 = _UPVALUE0_
    L1_52 = L1_52.UNAUTHORIZED
    return L1_52
  end
  L1_52 = _UPVALUE1_
  L1_52 = L1_52.start
  L1_52()
  L1_52 = _UPVALUE2_
  L1_52 = L1_52.useCountCheckAll
  L1_52 = L1_52()
  if L1_52 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in DeleteAll Opetation in sslvpnResources page " .. L1_52)
    _UPVALUE1_.abort()
    return L1_52
  end
  L1_52 = _UPVALUE3_.resourceConfigurationDeleteAll()
  if L1_52 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in DeleteAll Opetation in sslvpnResources page " .. L1_52)
    _UPVALUE1_.abort()
    return L1_52
  end
  L1_52 = _UPVALUE2_.resourceConfigDeleteAll()
  if L1_52 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in DeleteAll Opetation in sslvpnResources page " .. L1_52)
    _UPVALUE1_.abort()
    return L1_52
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_52
end
function sslvpnResourcesConfigSectionGet()
  local L0_53, L1_54, L2_55, L3_56, L4_57, L5_58, L6_59, L7_60, L8_61, L9_62
  L0_53, L1_54, L2_55, L3_56, L4_57, L5_58, L6_59, L7_60, L8_61, L9_62 = _UPVALUE0_.resourceConfigurationGet()
  if L0_53 ~= _UPVALUE1_.SUCCESS then
    return L0_53
  end
  if L3_56 == _UPVALUE2_ then
    L3_56 = _UPVALUE3_[1]
  elseif L3_56 == _UPVALUE4_ then
    L3_56 = _UPVALUE3_[2]
  elseif L3_56 == _UPVALUE5_ then
    L3_56 = _UPVALUE3_[3]
  end
  L4_57 = _UPVALUE6_[tonumber(L4_57)]
  if L9_62 == _UPVALUE7_ then
    L9_62 = _UPVALUE8_[2]
  else
    L9_62 = _UPVALUE8_[1]
  end
  return L0_53, L1_54, L2_55, L3_56, L4_57, L5_58, L6_59, L7_60, L8_61, L9_62
end
function sslvpnResourcesConfigSectionGetNext(A0_63)
  local L1_64, L2_65, L3_66, L4_67, L5_68, L6_69, L7_70, L8_71, L9_72, L10_73, L11_74
  L1_64 = A0_63["sslvpnResourcesConfig.cookie"]
  L2_65 = _UPVALUE0_
  L2_65 = L2_65.NIL
  if L1_64 == L2_65 then
    L2_65 = util
    L2_65 = L2_65.appendDebugOut
    L3_66 = "GetNext : Invalid Cookie"
    L2_65(L3_66)
    L2_65 = _UPVALUE0_
    L2_65 = L2_65.BAD_PARAMETER
    return L2_65
  end
  L2_65, L3_66, L4_67, L5_68, L6_69, L7_70, L8_71, L9_72, L10_73, L11_74 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L2_65, L3_66, L4_67, L5_68, L6_69, L7_70, L8_71, L9_72, L10_73, L11_74 = _UPVALUE1_.resourceConfigurationGetNext(L1_64)
  if L2_65 ~= _UPVALUE0_.SUCCESS then
    return L2_65
  end
  if L5_68 == _UPVALUE2_ then
    L5_68 = _UPVALUE3_[1]
  elseif L5_68 == _UPVALUE4_ then
    L5_68 = _UPVALUE3_[2]
  elseif L5_68 == _UPVALUE5_ then
    L5_68 = _UPVALUE3_[3]
  end
  L6_69 = _UPVALUE6_[tonumber(L6_69)]
  if L11_74 == _UPVALUE7_ then
    L11_74 = _UPVALUE8_[2]
  else
    L11_74 = _UPVALUE8_[1]
  end
  return L2_65, L3_66, L4_67, L5_68, L6_69, L7_70, L8_71, L9_72, L10_73, L11_74
end
function sslvpnResourcesConfigSectionCreate(A0_75)
  local L1_76, L2_77, L3_78, L4_79, L5_80, L6_81, L7_82, L8_83, L9_84, L10_85
  L1_76 = ACCESS_LEVEL
  if L1_76 ~= 0 then
    L1_76 = util
    L1_76 = L1_76.appendDebugOut
    L2_77 = "Detected Unauthorized access for page sslvpnResources"
    L1_76(L2_77)
    L1_76 = _UPVALUE0_
    L1_76 = L1_76.UNAUTHORIZED
    return L1_76
  end
  L1_76 = A0_75["sslvpnResourcesConfig.resourceName"]
  L2_77 = A0_75["sslvpnResourcesConfig.serviceType"]
  L3_78 = A0_75["sslvpnResourcesConfig.objectType"]
  L4_79 = A0_75["sslvpnResourcesConfig.objectAddress"]
  L5_80 = A0_75["sslvpnResourcesConfig.maskLength"]
  L6_81 = A0_75["sslvpnResourcesConfig.startPort"]
  L7_82 = A0_75["sslvpnResourcesConfig.endPort"]
  L8_83 = A0_75["sslvpnResourcesConfig.icmp"]
  L9_84 = _UPVALUE0_
  L9_84 = L9_84.NIL
  if L1_76 == L9_84 then
    L9_84 = util
    L9_84 = L9_84.appendDebugOut
    L10_85 = "Set : Invalid resourceName"
    L9_84(L10_85)
    L9_84 = _UPVALUE0_
    L9_84 = L9_84.BAD_PARAMETER
    return L9_84
  end
  L9_84 = _UPVALUE0_
  L9_84 = L9_84.NIL
  if L2_77 == L9_84 then
    L9_84 = util
    L9_84 = L9_84.appendDebugOut
    L10_85 = "Set : Invalid serviceType"
    L9_84(L10_85)
    L9_84 = _UPVALUE0_
    L9_84 = L9_84.BAD_PARAMETER
    return L9_84
  end
  L9_84 = _UPVALUE0_
  L9_84 = L9_84.NIL
  if L3_78 == L9_84 then
    L9_84 = util
    L9_84 = L9_84.appendDebugOut
    L10_85 = "Set : Invalid objectType"
    L9_84(L10_85)
    L9_84 = _UPVALUE0_
    L9_84 = L9_84.BAD_PARAMETER
    return L9_84
  end
  L9_84 = _UPVALUE0_
  L9_84 = L9_84.NIL
  if L4_79 == L9_84 then
    L9_84 = util
    L9_84 = L9_84.appendDebugOut
    L10_85 = "Set : Invalid objectAddress"
    L9_84(L10_85)
    L9_84 = _UPVALUE0_
    L9_84 = L9_84.BAD_PARAMETER
    return L9_84
  end
  L9_84 = _UPVALUE0_
  L9_84 = L9_84.NIL
  if L6_81 == L9_84 then
    L9_84 = util
    L9_84 = L9_84.appendDebugOut
    L10_85 = "Set : Invalid startPort"
    L9_84(L10_85)
    L9_84 = _UPVALUE0_
    L9_84 = L9_84.BAD_PARAMETER
    return L9_84
  end
  L9_84 = _UPVALUE0_
  L9_84 = L9_84.NIL
  if L7_82 == L9_84 then
    L9_84 = util
    L9_84 = L9_84.appendDebugOut
    L10_85 = "Set : Invalid endPort"
    L9_84(L10_85)
    L9_84 = _UPVALUE0_
    L9_84 = L9_84.BAD_PARAMETER
    return L9_84
  end
  L9_84 = _UPVALUE0_
  L9_84 = L9_84.NIL
  if L8_83 == L9_84 then
    L9_84 = util
    L9_84 = L9_84.appendDebugOut
    L10_85 = "Set : Invalid icmp"
    L9_84(L10_85)
    L9_84 = _UPVALUE0_
    L9_84 = L9_84.BAD_PARAMETER
    return L9_84
  end
  L9_84 = _UPVALUE1_
  L9_84 = L9_84[2]
  if L3_78 == L9_84 then
    L9_84 = _UPVALUE0_
    L9_84 = L9_84.NIL
    if L5_80 == L9_84 then
      L9_84 = util
      L9_84 = L9_84.appendDebugOut
      L10_85 = "Set : Invalid maskLength"
      L9_84(L10_85)
      L9_84 = _UPVALUE0_
      L9_84 = L9_84.BAD_PARAMETER
      return L9_84
    end
  end
  L9_84, L10_85 = nil, nil
  if L2_77 == _UPVALUE2_[1] then
    L2_77 = _UPVALUE3_
  elseif L2_77 == _UPVALUE2_[2] then
    L2_77 = _UPVALUE4_
  elseif L2_77 == _UPVALUE2_[3] then
    L2_77 = _UPVALUE5_
  end
  for _FORV_14_, _FORV_15_ in pairs(_UPVALUE1_) do
    if _FORV_15_ == L3_78 then
      L3_78 = _FORV_14_
      break
    end
  end
  if L8_83 == _UPVALUE6_[2] then
    L8_83 = _UPVALUE7_
  else
    L8_83 = _UPVALUE8_
  end
  _UPVALUE9_.start()
  L9_84, L10_85 = _UPVALUE10_.resourceConfigurationCreate(L1_76, L2_77, L3_78, objectAddres, L5_80, L6_81, L7_82, L8_83)
  if L9_84 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page sslvpnResources" .. L9_84)
    _UPVALUE9_.abort()
    return L9_84
  end
  _UPVALUE9_.complete()
  _UPVALUE9_.save()
  return _UPVALUE0_.SUCCESS, L10_85
end
function sslvpnResourcesConfigSectionDelete(A0_86)
  local L1_87, L2_88
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for sslvpnResources PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_87 = A0_86["sslvpnResourcesConfig.cookie"]
  if L1_87 == _UPVALUE0_.NIL then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L2_88, cookie = _UPVALUE2_.resourceConfigurationDelete(L1_87)
  if L2_88 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in sslvpnResources page " .. L2_88)
    _UPVALUE1_.abort()
    return L2_88
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L2_88, cookie
end
function appsMapSectionGet()
  local L0_89, L1_90, L2_91, L3_92
  L0_89, L1_90, L2_91, L3_92 = _UPVALUE0_.appsMapGet()
  if L0_89 ~= _UPVALUE1_.SUCCESS then
    return L0_89
  end
  return L0_89, L1_90, L2_91, L3_92
end
function appsMapSectionGetNext(A0_93)
  local L1_94, L2_95, L3_96, L4_97, L5_98
  L1_94 = A0_93["appsMap.cookie"]
  L2_95 = _UPVALUE0_
  L2_95 = L2_95.NIL
  if L1_94 == L2_95 then
    L2_95 = util
    L2_95 = L2_95.appendDebugOut
    L3_96 = "GetNext : Invalid Cookie"
    L2_95(L3_96)
    L2_95 = _UPVALUE0_
    L2_95 = L2_95.BAD_PARAMETER
    return L2_95
  end
  L2_95, L3_96, L4_97, L5_98 = nil, nil, nil, nil
  L2_95, L3_96, L4_97, L5_98 = _UPVALUE1_.appsMapGetNext(L1_94)
  if L2_95 ~= _UPVALUE0_.SUCCESS then
    return L2_95
  end
  return L2_95, L3_96, L4_97, L5_98
end
function appsMapSectionGetCur(A0_99)
  local L1_100, L2_101, L3_102
  L1_100, A0_99, L2_101, L3_102 = _UPVALUE0_.appsMapGetCur(A0_99)
  if L1_100 ~= _UPVALUE1_.SUCCESS then
    return L1_100
  end
  return L1_100, A0_99, L2_101, L3_102
end
function appsMapSectionGetAll()
  local L0_103, L1_104
  L1_104 = {}
  L0_103, L1_104 = _UPVALUE0_.appsMapGetAll()
  if L0_103 ~= _UPVALUE1_.SUCCESS then
    return L0_103
  end
  return L0_103, L1_104
end
function appsMapSectionSet(A0_105)
  local L1_106, L2_107, L3_108, L4_109, L5_110
  L1_106 = ACCESS_LEVEL
  if L1_106 ~= 0 then
    L1_106 = util
    L1_106 = L1_106.appendDebugOut
    L2_107 = "Detected Unauthorized access for page sslvpnResources"
    L1_106(L2_107)
    L1_106 = _UPVALUE0_
    L1_106 = L1_106.UNAUTHORIZED
    return L1_106
  end
  L1_106 = A0_105["appsMap.cookie"]
  L2_107 = A0_105["appsMap.appsMapServerIp"]
  L3_108 = A0_105["appsMap.appsMapPort"]
  L4_109 = _UPVALUE0_
  L4_109 = L4_109.NIL
  if L1_106 == L4_109 then
    L4_109 = util
    L4_109 = L4_109.appendDebugOut
    L5_110 = "Set : Invalid Cookie"
    L4_109(L5_110)
    L4_109 = _UPVALUE0_
    L4_109 = L4_109.BAD_PARAMETER
    return L4_109
  end
  L4_109 = _UPVALUE0_
  L4_109 = L4_109.NIL
  if L2_107 == L4_109 then
    L4_109 = util
    L4_109 = L4_109.appendDebugOut
    L5_110 = "Set : Invalid appsMapServerIp"
    L4_109(L5_110)
    L4_109 = _UPVALUE0_
    L4_109 = L4_109.BAD_PARAMETER
    return L4_109
  end
  L4_109 = _UPVALUE0_
  L4_109 = L4_109.NIL
  if L3_108 == L4_109 then
    L4_109 = util
    L4_109 = L4_109.appendDebugOut
    L5_110 = "Set : Invalid appsMapPort"
    L4_109(L5_110)
    L4_109 = _UPVALUE0_
    L4_109 = L4_109.BAD_PARAMETER
    return L4_109
  end
  L4_109, L5_110 = nil, nil
  _UPVALUE1_.start()
  L4_109, L5_110 = _UPVALUE2_.appsMapSet(L1_106, L2_107, L3_108)
  if L4_109 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page sslvpnResources" .. L4_109)
    _UPVALUE1_.abort()
    return L4_109, L1_106
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L5_110
end
function appsMapSectionCreate(A0_111)
  local L1_112, L2_113, L3_114, L4_115
  L1_112 = ACCESS_LEVEL
  if L1_112 ~= 0 then
    L1_112 = util
    L1_112 = L1_112.appendDebugOut
    L2_113 = "Detected Unauthorized access for page sslvpnResources"
    L1_112(L2_113)
    L1_112 = _UPVALUE0_
    L1_112 = L1_112.UNAUTHORIZED
    return L1_112
  end
  L1_112 = A0_111["appsMap.appsMapServerIp"]
  L2_113 = A0_111["appsMap.appsMapPort"]
  L3_114 = _UPVALUE0_
  L3_114 = L3_114.NIL
  if L1_112 == L3_114 then
    L3_114 = util
    L3_114 = L3_114.appendDebugOut
    L4_115 = "Set : Invalid appsMapServerIp"
    L3_114(L4_115)
    L3_114 = _UPVALUE0_
    L3_114 = L3_114.BAD_PARAMETER
    return L3_114
  end
  L3_114 = _UPVALUE0_
  L3_114 = L3_114.NIL
  if L2_113 == L3_114 then
    L3_114 = util
    L3_114 = L3_114.appendDebugOut
    L4_115 = "Set : Invalid appsMapPort"
    L3_114(L4_115)
    L3_114 = _UPVALUE0_
    L3_114 = L3_114.BAD_PARAMETER
    return L3_114
  end
  L3_114, L4_115 = nil, nil
  _UPVALUE1_.start()
  L3_114, L4_115 = _UPVALUE2_.appsMapCreate(L1_112, L2_113)
  if L3_114 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page sslvpnResources" .. L3_114)
    _UPVALUE1_.abort()
    return L3_114
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L4_115
end
function appsMapSectionDelete(A0_116)
  local L1_117, L2_118
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for sslvpnResources PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_117 = A0_116["appsMap.cookie"]
  if L1_117 == _UPVALUE0_.NIL then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L2_118, cookie = _UPVALUE2_.appsMapDelete(L1_117)
  if L2_118 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in sslvpnResources page " .. L2_118)
    _UPVALUE1_.abort()
    return L2_118
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L2_118, cookie
end
function appsMapSectionDeleteAll()
  local L0_119, L1_120
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for sslvpnResources PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  _UPVALUE1_.start()
  L1_120 = _UPVALUE2_.appsMapDeleteAll()
  if L1_120 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in sslvpnResources page " .. L1_120)
    _UPVALUE1_.abort()
    return L1_120
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_120
end
function fqdnMapSectionGet()
  local L0_121, L1_122, L2_123, L3_124
  L0_121, L1_122, L2_123, L3_124 = _UPVALUE0_.fqdnMapGet()
  if L0_121 ~= _UPVALUE1_.SUCCESS then
    return L0_121
  end
  return L0_121, L1_122, L2_123, L3_124
end
function fqdnMapSectionGetNext(A0_125)
  local L1_126, L2_127, L3_128, L4_129, L5_130
  L1_126 = A0_125["fqdnMap.cookie"]
  L2_127 = _UPVALUE0_
  L2_127 = L2_127.NIL
  if L1_126 == L2_127 then
    L2_127 = util
    L2_127 = L2_127.appendDebugOut
    L3_128 = "GetNext : Invalid Cookie"
    L2_127(L3_128)
    L2_127 = _UPVALUE0_
    L2_127 = L2_127.BAD_PARAMETER
    return L2_127
  end
  L2_127, L3_128, L4_129, L5_130 = nil, nil, nil, nil
  L2_127, L3_128, L4_129, L5_130 = _UPVALUE1_.fqdnMapGetNext(L1_126)
  if L2_127 ~= _UPVALUE0_.SUCCESS then
    return L2_127
  end
  return L2_127, L3_128, L4_129, L5_130
end
function fqdnMapSectionGetCur(A0_131)
  local L1_132, L2_133, L3_134
  L1_132, A0_131, L2_133, L3_134 = _UPVALUE0_.fqdnMapGetCur(A0_131)
  if L1_132 ~= _UPVALUE1_.SUCCESS then
    return L1_132
  end
  return L1_132, A0_131, L2_133, L3_134
end
function fqdnMapSectionGetAll()
  local L0_135, L1_136
  L1_136 = {}
  L0_135, L1_136 = _UPVALUE0_.fqdnMapGetAll()
  if L0_135 ~= _UPVALUE1_.SUCCESS then
    return L0_135
  end
  return L0_135, L1_136
end
function fqdnMapSectionSet(A0_137)
  local L1_138, L2_139, L3_140, L4_141, L5_142
  L1_138 = ACCESS_LEVEL
  if L1_138 ~= 0 then
    L1_138 = util
    L1_138 = L1_138.appendDebugOut
    L2_139 = "Detected Unauthorized access for page sslvpnResources"
    L1_138(L2_139)
    L1_138 = _UPVALUE0_
    L1_138 = L1_138.UNAUTHORIZED
    return L1_138
  end
  L1_138 = A0_137["fqdnMap.cookie"]
  L2_139 = A0_137["fqdnMap.FQDNMapServerIp"]
  L3_140 = A0_137["fqdnMap.FQDNMapFQDNName"]
  L4_141 = _UPVALUE0_
  L4_141 = L4_141.NIL
  if L1_138 == L4_141 then
    L4_141 = util
    L4_141 = L4_141.appendDebugOut
    L5_142 = "Set : Invalid Cookie"
    L4_141(L5_142)
    L4_141 = _UPVALUE0_
    L4_141 = L4_141.BAD_PARAMETER
    return L4_141
  end
  L4_141 = _UPVALUE0_
  L4_141 = L4_141.NIL
  if L2_139 == L4_141 then
    L4_141 = util
    L4_141 = L4_141.appendDebugOut
    L5_142 = "Set : Invalid FQDNMapServerIp"
    L4_141(L5_142)
    L4_141 = _UPVALUE0_
    L4_141 = L4_141.BAD_PARAMETER
    return L4_141
  end
  L4_141 = _UPVALUE0_
  L4_141 = L4_141.NIL
  if L3_140 == L4_141 then
    L4_141 = util
    L4_141 = L4_141.appendDebugOut
    L5_142 = "Set : Invalid FQDNMapFQDNName"
    L4_141(L5_142)
    L4_141 = _UPVALUE0_
    L4_141 = L4_141.BAD_PARAMETER
    return L4_141
  end
  L4_141, L5_142 = nil, nil
  _UPVALUE1_.start()
  L4_141, L5_142 = _UPVALUE2_.fqdnMapSet(L1_138, L2_139, L3_140)
  if L4_141 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page sslvpnResources" .. L4_141)
    _UPVALUE1_.abort()
    return L4_141, L1_138
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L5_142
end
function fqdnMapSectionCreate(A0_143)
  local L1_144, L2_145, L3_146, L4_147
  L1_144 = ACCESS_LEVEL
  if L1_144 ~= 0 then
    L1_144 = util
    L1_144 = L1_144.appendDebugOut
    L2_145 = "Detected Unauthorized access for page sslvpnResources"
    L1_144(L2_145)
    L1_144 = _UPVALUE0_
    L1_144 = L1_144.UNAUTHORIZED
    return L1_144
  end
  L1_144 = A0_143["fqdnMap.FQDNMapServerIp"]
  L2_145 = A0_143["fqdnMap.FQDNMapFQDNName"]
  L3_146 = _UPVALUE0_
  L3_146 = L3_146.NIL
  if L1_144 == L3_146 then
    L3_146 = util
    L3_146 = L3_146.appendDebugOut
    L4_147 = "Set : Invalid FQDNMapServerIp"
    L3_146(L4_147)
    L3_146 = _UPVALUE0_
    L3_146 = L3_146.BAD_PARAMETER
    return L3_146
  end
  L3_146 = _UPVALUE0_
  L3_146 = L3_146.NIL
  if L2_145 == L3_146 then
    L3_146 = util
    L3_146 = L3_146.appendDebugOut
    L4_147 = "Set : Invalid FQDNMapFQDNName"
    L3_146(L4_147)
    L3_146 = _UPVALUE0_
    L3_146 = L3_146.BAD_PARAMETER
    return L3_146
  end
  L3_146, L4_147 = nil, nil
  _UPVALUE1_.start()
  L3_146, L4_147 = _UPVALUE2_.fqdnMapCreate(L1_144, L2_145)
  if L3_146 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page sslvpnResources" .. L3_146)
    _UPVALUE1_.abort()
    return L3_146
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L4_147
end
function fqdnMapSectionDelete(A0_148)
  local L1_149, L2_150
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for sslvpnResources PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_149 = A0_148["fqdnMap.cookie"]
  if L1_149 == _UPVALUE0_.NIL then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L2_150, cookie = _UPVALUE2_.fqdnMapDelete(L1_149)
  if L2_150 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in sslvpnResources page " .. L2_150)
    _UPVALUE1_.abort()
    return L2_150
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L2_150, cookie
end
function fqdnMapSectionDeleteAll()
  local L0_151
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for sslvpnResources PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  _UPVALUE1_.start()
  L0_151 = _UPVALUE2_.fqdnMapDeleteAll()
  if L0_151 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in sslvpnResources page " .. L0_151)
    _UPVALUE1_.abort()
    return L0_151
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L0_151
end
