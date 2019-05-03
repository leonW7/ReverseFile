local L0_0
L0_0 = module
L0_0("com.teamf1.bl.sslvpn_portallayout", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/sslvpn_portalLayout")
L0_0 = require
L0_0("teamf1lualib/captiveportal_loginProfile")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function sslVpnPortalLayoutsSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15
  L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15 = _UPVALUE0_.portalGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15
end
function sslVpnPortalLayoutsSectionGetNext(A0_16)
  local L1_17, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26, L11_27, L12_28, L13_29, L14_30, L15_31, L16_32
  L1_17 = A0_16["sslVpnPortalLayouts.cookie"]
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
  L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26, L11_27, L12_28, L13_29, L14_30, L15_31, L16_32 = _UPVALUE1_.portalGetNext(L1_17)
  if L2_18 ~= _UPVALUE0_.SUCCESS then
    return L2_18
  end
  return L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26, L11_27, L12_28, L13_29, L14_30, L15_31, L16_32
end
function sslVpnPortalLayoutsSectionSet(A0_33)
  local L1_34, L2_35, L3_36, L4_37, L5_38, L6_39, L7_40, L8_41, L9_42, L10_43, L11_44, L12_45, L13_46, L14_47, L15_48, L16_49
  L1_34 = ACCESS_LEVEL
  if L1_34 ~= 0 then
    L1_34 = util
    L1_34 = L1_34.appendDebugOut
    L2_35 = "Detected Unauthorized access for page sslVpnPortalLayouts"
    L1_34(L2_35)
    L1_34 = _UPVALUE0_
    L1_34 = L1_34.UNAUTHORIZED
    return L1_34
  end
  L1_34 = A0_33["sslVpnPortalLayouts.cookie"]
  L2_35 = A0_33["sslVpnPortalLayouts.portalLayoutName"]
  L3_36 = _UPVALUE1_
  L4_37 = A0_33["sslVpnPortalLayouts.siteTitle"]
  L5_38 = A0_33["sslVpnPortalLayouts.bannerTitle"]
  L6_39 = A0_33["sslVpnPortalLayouts.bannerMessage"]
  L7_40 = A0_33["sslVpnPortalLayouts.portalBanner"]
  L8_41 = A0_33["sslVpnPortalLayouts.HTTPMetaTags"]
  L9_42 = A0_33["sslVpnPortalLayouts.activeXWebCacheCleaner"]
  L10_43 = A0_33["sslVpnPortalLayouts.VPNTunnel"]
  L11_44 = A0_33["sslVpnPortalLayouts.portForwarding"]
  L12_45 = A0_33["sslVpnPortalLayouts.profileName"]
  L13_46 = A0_33["sslVpnPortalLayouts.sslAuthType"]
  L14_47 = A0_33["sslVpnPortalLayouts.groupName"]
  L15_48 = _UPVALUE0_
  L15_48 = L15_48.NIL
  if L1_34 == L15_48 then
    L15_48 = util
    L15_48 = L15_48.appendDebugOut
    L16_49 = "Set : Invalid Cookie"
    L15_48(L16_49)
    L15_48 = _UPVALUE0_
    L15_48 = L15_48.BAD_PARAMETER
    return L15_48
  end
  L15_48, L16_49 = nil, nil
  _UPVALUE2_.start()
  L15_48, L16_49 = _UPVALUE3_.portalSet(L1_34, L2_35, L3_36, L4_37, L5_38, L6_39, L7_40, L8_41, L9_42, L10_43, L11_44, L12_45, L13_46, L14_47)
  if L15_48 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page sslVpnPortalLayouts" .. L15_48)
    _UPVALUE2_.abort()
    return L15_48, L1_34
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return _UPVALUE0_.SUCCESS, L16_49
end
function sslVpnPortalLayoutsSectionCreate(A0_50)
  local L1_51, L2_52, L3_53, L4_54, L5_55, L6_56, L7_57, L8_58, L9_59, L10_60, L11_61, L12_62, L13_63, L14_64, L15_65
  L1_51 = ACCESS_LEVEL
  if L1_51 ~= 0 then
    L1_51 = util
    L1_51 = L1_51.appendDebugOut
    L2_52 = "Detected Unauthorized access for page sslVpnPortalLayouts"
    L1_51(L2_52)
    L1_51 = _UPVALUE0_
    L1_51 = L1_51.UNAUTHORIZED
    return L1_51
  end
  L1_51 = A0_50["sslVpnPortalLayouts.portalLayoutName"]
  L2_52 = _UPVALUE1_
  L3_53 = A0_50["sslVpnPortalLayouts.siteTitle"]
  L4_54 = A0_50["sslVpnPortalLayouts.bannerTitle"]
  L5_55 = A0_50["sslVpnPortalLayouts.bannerMessage"]
  L6_56 = A0_50["sslVpnPortalLayouts.portalBanner"]
  L7_57 = A0_50["sslVpnPortalLayouts.HTTPMetaTags"]
  L8_58 = A0_50["sslVpnPortalLayouts.activeXWebCacheCleaner"]
  L9_59 = A0_50["sslVpnPortalLayouts.VPNTunnel"]
  L10_60 = A0_50["sslVpnPortalLayouts.portForwarding"]
  L11_61 = A0_50["sslVpnPortalLayouts.profileName"]
  L12_62 = A0_50["sslVpnPortalLayouts.sslAuthType"]
  L13_63 = A0_50["sslVpnPortalLayouts.groupName"]
  L14_64 = _UPVALUE0_
  L14_64 = L14_64.NIL
  if L1_51 == L14_64 then
    L14_64 = util
    L14_64 = L14_64.appendDebugOut
    L15_65 = "Set : Invalid portalLayoutName"
    L14_64(L15_65)
    L14_64 = _UPVALUE0_
    L14_64 = L14_64.BAD_PARAMETER
    return L14_64
  end
  L14_64 = _UPVALUE0_
  L14_64 = L14_64.NIL
  if L12_62 == L14_64 then
    L14_64 = util
    L14_64 = L14_64.appendDebugOut
    L15_65 = "Set : Invalid ssl authtype"
    L14_64(L15_65)
    L14_64 = _UPVALUE0_
    L14_64 = L14_64.BAD_PARAMETER
    return L14_64
  end
  L14_64, L15_65 = nil, nil
  _UPVALUE2_.start()
  L14_64, L15_65 = _UPVALUE3_.portalCreate(L1_51, L2_52, L3_53, L4_54, L5_55, L6_56, L7_57, L8_58, L9_59, L10_60, L11_61, L12_62, L13_63)
  if L14_64 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page sslVpnPortalLayouts" .. L14_64)
    _UPVALUE2_.abort()
    return L14_64
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return _UPVALUE0_.SUCCESS, L15_65
end
function sslVpnPortalLayoutsSectionDelete(A0_66)
  local L1_67, L2_68
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for sslVpnPortalLayouts PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_67 = A0_66["sslVpnPortalLayouts.cookie"]
  if L1_67 == _UPVALUE0_.NIL then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L2_68, cookie = _UPVALUE2_.portalDelete(L1_67)
  if L2_68 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in sslVpnPortalLayouts page " .. L2_68)
    _UPVALUE1_.abort()
    return L2_68
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L2_68, cookie
end
function sslVpnPortalLayoutsSectionGetAll()
  local L0_69, L1_70
  L1_70 = {}
  L0_69, L1_70 = _UPVALUE0_.portalGetAll()
  if L1_70 == _UPVALUE1_.NIL then
    L1_70 = {}
  end
  if L0_69 ~= _UPVALUE1_.SUCCESS then
    return L0_69, L1_70
  end
  return L0_69, L1_70
end
function sslVpnPortalLayoutsSectionDeleteAll()
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for sslVpnPortalLayouts PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.portalDeleteAll()
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in sslVpnPortalLayouts page " .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
function sslVpnPortalLayoutsSectionGetCur(A0_71)
  local L1_72, L2_73, L3_74, L4_75, L5_76, L6_77, L7_78, L8_79, L9_80, L10_81, L11_82, L12_83, L13_84, L14_85, L15_86
  L1_72, L2_73, L3_74, L4_75, L5_76, L6_77, L7_78, L8_79, L9_80, L10_81, L11_82, L12_83, L13_84, L14_85, L15_86 = _UPVALUE0_.portalGetCur(A0_71)
  if L1_72 ~= _UPVALUE1_.SUCCESS then
    return L1_72
  end
  return L1_72, L2_73, L3_74, L4_75, L5_76, L6_77, L7_78, L8_79, L9_80, L10_81, L11_82, L12_83, L13_84, L14_85, L15_86
end
function loginProfilesGet()
  local L0_87, L1_88
  L0_87, L1_88 = _UPVALUE0_.loginProfilesGetAll()
  if L0_87 ~= _UPVALUE1_.SUCCESS then
    return L0_87
  end
  return L0_87, L1_88
end
function sslVpnPortalLayoutsSectionDefaultsGet()
  local L0_89, L1_90, L2_91, L3_92, L4_93, L5_94, L6_95, L7_96, L8_97, L9_98
  L0_89 = _UPVALUE0_
  L1_90 = _UPVALUE0_
  L2_91 = _UPVALUE0_
  L3_92 = _UPVALUE0_
  L4_93 = _UPVALUE0_
  L5_94 = L0_89
  L6_95 = L1_90
  L7_96 = L2_91
  L8_97 = L3_92
  L9_98 = L4_93
  return L5_94, L6_95, L7_96, L8_97, L9_98
end
function sslDomainLocalGetAll()
  local L0_99, L1_100
  L0_99, L1_100 = _UPVALUE0_.sslDomainLocalGetAll()
  if L0_99 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_100
end
function sslDomainGetCur(A0_101)
  local L1_102, L2_103, L3_104, L4_105
  L2_103 = A0_101
  if L2_103 == nil then
    L3_104 = util
    L3_104 = L3_104.appendDebugOut
    L4_105 = "GetNext : Invalid Cookie"
    L3_104(L4_105)
    L3_104 = _UPVALUE0_
    L3_104 = L3_104.BAD_PARAMETER
    return L3_104
  end
  L3_104, L4_105 = nil, nil
  L1_102, L3_104, L4_105 = _UPVALUE1_.sslDomainGetCur(L2_103)
  if L1_102 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  if L3_104 == _UPVALUE0_.NIL then
    L3_104 = "local"
  end
  return _UPVALUE0_.SUCCESS, L3_104, L4_105
end
