local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7
L0_0 = module
L1_1 = "com.teamf1.bl.captiveportal.loginprofiles"
L2_2 = package
L2_2 = L2_2.seeall
L0_0(L1_1, L2_2)
L0_0 = require
L1_1 = "teamf1lualib/db"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/util"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/validations"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/returnCodes"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/captiveportal_loginProfile"
L0_0(L1_1)
L0_0 = HIGH_SEC
if L0_0 == "HIGH" then
  L0_0 = require
  L1_1 = "teamf1lualib/sslvpn_loginProfile"
  L0_0(L1_1)
end
L0_0 = require
L1_1 = "teamf1lualib/management_config"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/system_productData"
L0_0(L1_1)
L0_0 = require
L1_1 = "com.teamf1.core.returnCodes"
L0_0 = L0_0(L1_1)
L1_1 = require
L2_2 = "com.teamf1.core.validations"
L1_1 = L1_1(L2_2)
L2_2 = require
L3_3 = "com.teamf1.core.config"
L2_2 = L2_2(L3_3)
L3_3 = require
L4_4 = "com.teamf1.core.captiveportal.loginprofile"
L3_3 = L3_3(L4_4)
L4_4 = nil
L5_5 = HIGH_SEC
if L5_5 == "HIGH" then
  L5_5 = require
  L6_6 = "com.teamf1.core.sslvpn.loginprofile"
  L5_5 = L5_5(L6_6)
  L4_4 = L5_5
end
L5_5 = require
L6_6 = "com.teamf1.core.system.productdata"
L5_5 = L5_5(L6_6)
L6_6, L7_7 = nil, nil
L6_6, L7_7, COUNTRY_CODE = L5_5.countryCodeGet()
ENABLE = "1"
DISABLE = "0"
NIL = nil
INT_TAHOMA = 1
INT_TIMES_NEW_ROMAN = 2
INT_VERDANA = 3
INT_ARIAL = 4
INT_SMALL = 1
INT_MEDIUM = 2
INT_BIG = 3
INT_WHITE = 1
INT_RED = 2
INT_GREEN = 3
INT_BLUE = 4
INT_CUSTOM = 5
INT_BLACK = 5
INT_RED_FONT_IDX = 1
INT_BLACK_FONT_IDX = 2
INT_GREEN_FONT_IDX = 3
INT_BLUE_FONT_IDX = 4
INT_RIGHT = 1
INT_LEFT = 2
IMAGE_TYPE = 1
COLOR_TYPE = 2
function profileGet()
  local L0_8, L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16, L9_17, L10_18, L11_19, L12_20, L13_21, L14_22, L15_23, L16_24, L17_25, L18_26, L19_27, L20_28, L21_29, L22_30, L23_31, L24_32, L25_33, L26_34, L27_35, L28_36, L29_37, L30_38
  L30_38 = _UPVALUE1_
  L30_38 = L30_38.loginProfileGet
  _UPVALUE0_, L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16, L9_17, L10_18, L11_19, L12_20, L13_21, L14_22, L15_23, L16_24, L17_25, L18_26, L19_27, L20_28, L21_29, L22_30, L23_31, L24_32, L25_33, L26_34, L27_35, L28_36, L29_37, L30_38 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, L30_38()
  L0_8 = L30_38
  L30_38 = SUCCESS
  if L0_8 ~= L30_38 then
    return L0_8
  end
  L30_38 = tonumber
  L30_38 = L30_38(L6_14)
  if L30_38 == INT_WHITE then
    L6_14 = WHITE
  else
    L30_38 = tonumber
    L30_38 = L30_38(L6_14)
    if L30_38 == INT_RED then
      L6_14 = RED
    else
      L30_38 = tonumber
      L30_38 = L30_38(L6_14)
      if L30_38 == INT_GREEN then
        L6_14 = GREEN
      else
        L30_38 = tonumber
        L30_38 = L30_38(L6_14)
        if L30_38 == INT_BLUE then
          L6_14 = BLUE
        else
          L30_38 = tonumber
          L30_38 = L30_38(L6_14)
          if L30_38 == INT_CUSTOM then
            L6_14 = CUSTOM
          end
        end
      end
    end
  end
  L30_38 = tonumber
  L30_38 = L30_38(L10_18)
  if L30_38 == INT_WHITE then
    L10_18 = WHITE
  else
    L30_38 = tonumber
    L30_38 = L30_38(L10_18)
    if L30_38 == INT_RED then
      L10_18 = RED
    else
      L30_38 = tonumber
      L30_38 = L30_38(L10_18)
      if L30_38 == INT_GREEN then
        L10_18 = GREEN
      else
        L30_38 = tonumber
        L30_38 = L30_38(L10_18)
        if L30_38 == INT_BLUE then
          L10_18 = BLUE
        else
          L30_38 = tonumber
          L30_38 = L30_38(L10_18)
          if L30_38 == INT_CUSTOM then
            L10_18 = CUSTOM
          end
        end
      end
    end
  end
  L30_38 = tonumber
  L30_38 = L30_38(L15_23)
  if L30_38 == INT_BLACK then
    L15_23 = BLACK
  else
    L30_38 = tonumber
    L30_38 = L30_38(L15_23)
    if L30_38 == INT_RED then
      L15_23 = RED
    else
      L30_38 = tonumber
      L30_38 = L30_38(L15_23)
      if L30_38 == INT_GREEN then
        L15_23 = GREEN
      else
        L30_38 = tonumber
        L30_38 = L30_38(L15_23)
        if L30_38 == INT_BLUE then
          L15_23 = BLUE
        end
      end
    end
  end
  L30_38 = tonumber
  L30_38 = L30_38(L25_33)
  if L30_38 == INT_WHITE then
    L25_33 = WHITE
  else
    L30_38 = tonumber
    L30_38 = L30_38(L25_33)
    if L30_38 == INT_RED then
      L25_33 = RED
    else
      L30_38 = tonumber
      L30_38 = L30_38(L25_33)
      if L30_38 == INT_GREEN then
        L25_33 = GREEN
      else
        L30_38 = tonumber
        L30_38 = L30_38(L25_33)
        if L30_38 == INT_BLUE then
          L25_33 = BLUE
        end
      end
    end
  end
  L30_38 = tonumber
  L30_38 = L30_38(L28_36)
  if L30_38 == INT_WHITE then
    L28_36 = WHITE
  else
    L30_38 = tonumber
    L30_38 = L30_38(L28_36)
    if L30_38 == INT_RED then
      L28_36 = RED
    else
      L30_38 = tonumber
      L30_38 = L30_38(L28_36)
      if L30_38 == INT_GREEN then
        L28_36 = GREEN
      else
        L30_38 = tonumber
        L30_38 = L30_38(L28_36)
        if L30_38 == INT_BLUE then
          L28_36 = BLUE
        else
          L30_38 = tonumber
          L30_38 = L30_38(L28_36)
          if L30_38 == INT_BLACK then
            L28_36 = BLACK
          end
        end
      end
    end
  end
  L30_38 = tonumber
  L30_38 = L30_38(L12_20)
  if L30_38 == INT_VERDANA then
    L12_20 = VERDANA
  else
    L30_38 = tonumber
    L30_38 = L30_38(L12_20)
    if L30_38 == INT_TIMES_NEW_ROMAN then
      L12_20 = TIMES_NEW_ROMAN
    else
      L30_38 = tonumber
      L30_38 = L30_38(L12_20)
      if L30_38 == INT_TAHOMA then
        L12_20 = TAHOMA
      else
        L30_38 = tonumber
        L30_38 = L30_38(L12_20)
        if L30_38 == INT_ARIAL then
          L12_20 = ARIAL
        end
      end
    end
  end
  L30_38 = tonumber
  L30_38 = L30_38(L23_31)
  if L30_38 == INT_VERDANA then
    L23_31 = VERDANA
  else
    L30_38 = tonumber
    L30_38 = L30_38(L23_31)
    if L30_38 == INT_TIMES_NEW_ROMAN then
      L23_31 = TIMES_NEW_ROMAN
    else
      L30_38 = tonumber
      L30_38 = L30_38(L23_31)
      if L30_38 == INT_TAHOMA then
        L23_31 = TAHOMA
      else
        L30_38 = tonumber
        L30_38 = L30_38(L23_31)
        if L30_38 == INT_ARIAL then
          L23_31 = ARIAL
        end
      end
    end
  end
  L30_38 = tonumber
  L30_38 = L30_38(L24_32)
  if L30_38 == INT_BIG then
    L24_32 = BIG
  else
    L30_38 = tonumber
    L30_38 = L30_38(L24_32)
    if L30_38 == INT_MEDIUM then
      L24_32 = MEDIUM
    else
      L30_38 = tonumber
      L30_38 = L30_38(L24_32)
      if L30_38 == INT_SMALL then
        L24_32 = SMALL
      end
    end
  end
  L30_38 = tonumber
  L30_38 = L30_38(L13_21)
  if L30_38 == INT_BIG then
    L13_21 = BIG
  else
    L30_38 = tonumber
    L30_38 = L30_38(L13_21)
    if L30_38 == INT_MEDIUM then
      L13_21 = MEDIUM
    else
      L30_38 = tonumber
      L30_38 = L30_38(L13_21)
      if L30_38 == INT_SMALL then
        L13_21 = SMALL
      end
    end
  end
  L30_38 = tonumber
  L30_38 = L30_38(L22_30)
  if L30_38 == INT_RIGHT then
    L22_30 = RIGHT
  else
    L30_38 = tonumber
    L30_38 = L30_38(L22_30)
    if L30_38 == INT_LEFT then
      L22_30 = LEFT
    end
  end
  L30_38 = {}
  L30_38["loginProfiles.cookie"] = _UPVALUE0_
  L30_38["loginProfiles.profileId"] = L1_9
  L30_38["loginProfiles.profileName"] = L2_10
  L30_38["loginProfiles.pageTitle"] = L3_11
  L30_38["loginProfiles.pageBackgroundType"] = L4_12
  L30_38["loginProfiles.pageBackgroundImgIndex"] = L5_13
  L30_38["loginProfiles.pageBackgroundColor"] = L6_14
  L30_38["loginProfiles.pageCustomColor"] = L7_15
  L30_38["loginProfiles.headerBackgroundType"] = L8_16
  L30_38["loginProfiles.headerBackgroundImgIndex"] = L9_17
  L30_38["loginProfiles.headerBackgroundColor"] = L10_18
  L30_38["loginProfiles.headerBackgroundCustomColor"] = L11_19
  L30_38["loginProfiles.headerCaptionFontFace"] = L12_20
  L30_38["loginProfiles.headerCaptionFontSize"] = L13_21
  L30_38["loginProfiles.headerCaption"] = L14_22
  L30_38["loginProfiles.headerCaptionFontColor"] = L15_23
  L30_38["loginProfiles.loginSectionTitle"] = L16_24
  L30_38["loginProfiles.welcomeMessage"] = L17_25
  L30_38["loginProfiles.errorMessage"] = L18_26
  L30_38["loginProfiles.messagesFontColor"] = L19_27
  L30_38["loginProfiles.showAdvertisement"] = L20_28
  L30_38["loginProfiles.advertisementContent"] = L21_29
  L30_38["loginProfiles.advertisementAlignment"] = L22_30
  L30_38["loginProfiles.advertisementFontType"] = L23_31
  L30_38["loginProfiles.advertisementFontSize"] = L24_32
  L30_38["loginProfiles.advertisementFontColor"] = L25_33
  L30_38["loginProfiles.showFooter"] = L26_34
  L30_38["loginProfiles.footerContent"] = L27_35
  L30_38["loginProfiles.footerFontColor"] = L28_36
  L30_38["loginProfiles.mobileRedirection"] = L29_37
  return L0_8, L30_38
end
function profileGetNext(A0_39)
  local L1_40, L2_41, L3_42, L4_43, L5_44, L6_45, L7_46, L8_47, L9_48, L10_49, L11_50, L12_51, L13_52, L14_53, L15_54, L16_55, L17_56, L18_57, L19_58, L20_59, L21_60, L22_61, L23_62, L24_63, L25_64, L26_65, L27_66, L28_67, L29_68, L30_69, L31_70
  L1_40 = A0_39["loginProfile.cookie"]
  if L1_40 == nil then
    L2_41 = util
    L2_41 = L2_41.appendDebugOut
    L3_42 = "GetNext : Invalid Cookie"
    L2_41(L3_42)
    L2_41 = _UPVALUE0_
    L2_41 = L2_41.BAD_PARAMETER
    return L2_41
  end
  L2_41, L3_42, L4_43, L5_44, L6_45, L7_46, L8_47, L9_48, L10_49, L11_50, L12_51, L13_52, L14_53, L15_54, L16_55, L17_56, L18_57, L19_58, L20_59, L21_60, L22_61, L23_62, L24_63, L25_64, L26_65, L27_66, L28_67, L29_68, L30_69, L31_70 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L2_41, L3_42, L4_43, L5_44, L6_45, L7_46, L8_47, L9_48, L10_49, L11_50, L12_51, L13_52, L14_53, L15_54, L16_55, L17_56, L18_57, L19_58, L20_59, L21_60, L22_61, L23_62, L24_63, L25_64, L26_65, L27_66, L28_67, L29_68, L30_69, L31_70 = _UPVALUE1_.loginProfileGetNext(L1_40)
  if L2_41 ~= SUCCESS then
    return L2_41
  end
  if tonumber(L9_48) == INT_WHITE then
    L9_48 = WHITE
  elseif tonumber(L9_48) == INT_RED then
    L9_48 = RED
  elseif tonumber(L9_48) == INT_GREEN then
    L9_48 = GREEN
  elseif tonumber(L9_48) == INT_BLUE then
    L9_48 = BLUE
  elseif tonumber(L9_48) == INT_CUSTOM then
    L9_48 = CUSTOM
  end
  if tonumber(L13_52) == INT_WHITE then
    L13_52 = WHITE
  elseif tonumber(L13_52) == INT_RED then
    L13_52 = RED
  elseif tonumber(L13_52) == INT_GREEN then
    L13_52 = GREEN
  elseif tonumber(L13_52) == INT_BLUE then
    L13_52 = BLUE
  elseif tonumber(L13_52) == INT_CUSTOM then
    L13_52 = CUSTOM
  end
  if tonumber(L18_57) == INT_BLACK then
    L18_57 = BLACK
  elseif tonumber(L18_57) == INT_RED then
    L18_57 = RED
  elseif tonumber(L18_57) == INT_GREEN then
    L18_57 = GREEN
  elseif tonumber(L18_57) == INT_BLUE then
    L18_57 = BLUE
  end
  if tonumber(L28_67) == INT_WHITE then
    L28_67 = WHITE
  elseif tonumber(L28_67) == INT_RED then
    L28_67 = RED
  elseif tonumber(L28_67) == INT_GREEN then
    L28_67 = GREEN
  elseif tonumber(L28_67) == INT_BLUE then
    L28_67 = BLUE
  end
  if tonumber(L31_70) == INT_WHITE then
    L31_70 = WHITE
  elseif tonumber(L31_70) == INT_RED then
    L31_70 = RED
  elseif tonumber(L31_70) == INT_GREEN then
    L31_70 = GREEN
  elseif tonumber(L31_70) == INT_BLUE then
    L31_70 = BLUE
  elseif tonumber(L31_70) == INT_BLACK then
    L31_70 = BLACK
  end
  if tonumber(L15_54) == INT_VERDANA then
    L15_54 = VERDANA
  elseif tonumber(L15_54) == INT_TIMES_NEW_ROMAN then
    L15_54 = TIMES_NEW_ROMAN
  elseif tonumber(L15_54) == INT_TAHOMA then
    L15_54 = TAHOMA
  elseif tonumber(L15_54) == INT_ARIAL then
    L15_54 = ARIAL
  end
  if tonumber(L26_65) == INT_VERDANA then
    L26_65 = VERDANA
  elseif tonumber(L26_65) == INT_TIMES_NEW_ROMAN then
    L26_65 = TIMES_NEW_ROMAN
  elseif tonumber(L26_65) == INT_TAHOMA then
    L26_65 = TAHOMA
  elseif tonumber(L26_65) == INT_ARIAL then
    L26_65 = ARIAL
  end
  if tonumber(L27_66) == INT_BIG then
    L27_66 = BIG
  elseif tonumber(L27_66) == INT_MEDIUM then
    L27_66 = MEDIUM
  elseif tonumber(L27_66) == INT_SMALL then
    L27_66 = SMALL
  end
  if tonumber(L16_55) == INT_BIG then
    L16_55 = BIG
  elseif tonumber(L16_55) == INT_MEDIUM then
    L16_55 = MEDIUM
  elseif tonumber(L16_55) == INT_SMALL then
    L16_55 = SMALL
  end
  if tonumber(L25_64) == INT_RIGHT then
    L25_64 = RIGHT
  elseif tonumber(L25_64) == INT_LEFT then
    L25_64 = LEFT
  end
  return L2_41, L3_42, L4_43, L5_44, L6_45, L7_46, L8_47, L9_48, L10_49, L11_50, L12_51, L13_52, L14_53, L15_54, L16_55, L17_56, L18_57, L19_58, L20_59, L21_60, L22_61, L23_62, L24_63, L25_64, L26_65, L27_66, L28_67, L29_68, L30_69, L31_70
end
function profileSet(A0_71)
  local L1_72, L2_73, L3_74, L4_75, L5_76, L6_77, L7_78, L8_79, L9_80, L10_81, L11_82, L12_83, L13_84, L14_85, L15_86, L16_87, L17_88, L18_89, L19_90, L20_91, L21_92, L22_93, L23_94, L24_95, L25_96, L26_97, L27_98, L28_99, L29_100, L30_101, L31_102
  L1_72 = ACCESS_LEVEL
  if L1_72 ~= 0 then
    L1_72 = util
    L1_72 = L1_72.appendDebugOut
    L2_73 = "Detected Unauthorized access for page loginProfiles"
    L1_72(L2_73)
    L1_72 = _UPVALUE0_
    L1_72 = L1_72.UNAUTHORIZED
    return L1_72
  end
  L1_72 = A0_71["profileTable.cookie"]
  L2_73 = A0_71["profileTable.cookie"]
  L3_74 = A0_71["profileTable.profileName"]
  L4_75 = A0_71["profileTable.pageTitle"]
  L5_76 = A0_71["profileTable.pageBackgroundType"]
  L6_77 = A0_71["profileTable.pageBackgroundImgIndex"]
  L7_78 = A0_71["profileTable.pageBackgroundColor"]
  L8_79 = A0_71["profileTable.pageCustomColor"]
  L9_80 = A0_71["profileTable.headerBackgroundType"]
  L10_81 = A0_71["profileTable.headerBackgroundImgIndex"]
  L11_82 = A0_71["profileTable.headerBackgroundColor"]
  L12_83 = A0_71["profileTable.headerBackgroundCustomColor"]
  L13_84 = A0_71["profileTable.headerCaptionFontFace"]
  L14_85 = A0_71["profileTable.headerCaptionFontSize"]
  L15_86 = A0_71["profileTable.headerCaption"]
  L16_87 = A0_71["profileTable.headerCaptionFontColor"]
  L17_88 = A0_71["profileTable.loginSectionTitle"]
  L18_89 = A0_71["profileTable.welcomeMessage"]
  L19_90 = A0_71["profileTable.errorMessage"]
  L20_91 = A0_71["profileTable.messagesFontColor"]
  L21_92 = A0_71["profileTable.showAdvertisement"]
  L22_93 = A0_71["profileTable.advertisementContent"]
  L23_94 = A0_71["profileTable.advertisementAlignment"]
  L24_95 = A0_71["profileTable.advertisementFontType"]
  L25_96 = A0_71["profileTable.advertisementFontSize"]
  L26_97 = A0_71["profileTable.advertisementFontColor"]
  L27_98 = A0_71["profileTable.showFooter"]
  L28_99 = A0_71["profileTable.footerContent"]
  L29_100 = A0_71["profileTable.footerFontColor"]
  L30_101 = A0_71["profileTable.mobileRedirection"]
  if L1_72 == nil then
    L31_102 = util
    L31_102 = L31_102.appendDebugOut
    L31_102("Set : Invalid Cookie")
    L31_102 = _UPVALUE0_
    L31_102 = L31_102.BAD_PARAMETER
    return L31_102
  end
  if L3_74 == nil or L4_75 == nil then
    L31_102 = util
    L31_102 = L31_102.appendDebugOut
    L31_102("GetNext : Invalid Cookie")
    L31_102 = _UPVALUE0_
    L31_102 = L31_102.BAD_PARAMETER
    return L31_102
  end
  L31_102 = nil
  _UPVALUE1_.start()
  L31_102, _UPVALUE2_ = _UPVALUE3_.loginProfileSet(L1_72, L2_73, L3_74, L4_75, L5_76, L6_77, L7_78, L8_79, L9_80, L10_81, L11_82, L12_83, L13_84, L14_85, L15_86, L16_87, L17_88, L18_89, L19_90, L20_91, L21_92, L22_93, L23_94, L24_95, L25_96, L26_97, L27_98, L28_99, L29_100, L30_101)
  if L31_102 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page CaptivePortal loginProfiles " .. L31_102)
    _UPVALUE1_.abort()
    return L31_102, L1_72
  end
  if COUNTRY_CODE ~= "RU" then
    if tonumber(L5_76) == IMAGE_TYPE then
      L7_78 = INT_WHITE
    end
    L31_102, _UPVALUE2_ = _UPVALUE4_.loginProfileSet(L1_72, L2_73, L3_74, L4_75, L5_76, L6_77, L7_78, L8_79, L9_80, L10_81, L11_82, L12_83, L13_84, L14_85, L15_86, L16_87, L17_88, L18_89, L19_90, L20_91, L21_92, L22_93, L23_94, L24_95, L25_96, L26_97, L27_98, L28_99, L29_100)
    if L31_102 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in configuring values in page SSLVPN loginProfiles " .. L31_102)
      _UPVALUE1_.abort()
      return L31_102, L1_72
    end
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, _UPVALUE2_
end
function profileCreate(A0_103)
  local L1_104, L2_105, L3_106, L4_107, L5_108, L6_109, L7_110, L8_111, L9_112, L10_113, L11_114, L12_115, L13_116, L14_117, L15_118, L16_119, L17_120, L18_121, L19_122, L20_123, L21_124, L22_125, L23_126, L24_127, L25_128, L26_129, L27_130, L28_131, L29_132, L30_133
  L1_104 = ACCESS_LEVEL
  if L1_104 ~= 0 then
    L1_104 = util
    L1_104 = L1_104.appendDebugOut
    L2_105 = "Detected Unauthorized access for page loginProfiles"
    L1_104(L2_105)
    L1_104 = _UPVALUE0_
    L1_104 = L1_104.UNAUTHORIZED
    return L1_104
  end
  L1_104 = A0_103["profileTable.profileId"]
  L2_105 = A0_103["profileTable.profileName"]
  L3_106 = A0_103["profileTable.pageTitle"]
  L4_107 = A0_103["profileTable.pageBackgroundType"]
  L5_108 = A0_103["profileTable.pageBackgroundImgIndex"]
  L6_109 = A0_103["profileTable.pageBackgroundColor"]
  L7_110 = A0_103["profileTable.pageCustomColor"]
  L8_111 = A0_103["profileTable.headerBackgroundType"]
  L9_112 = A0_103["profileTable.headerBackgroundImgIndex"]
  L10_113 = A0_103["profileTable.headerBackgroundColor"]
  L11_114 = A0_103["profileTable.headerBackgroundCustomColor"]
  L12_115 = A0_103["profileTable.headerCaptionFontFace"]
  L13_116 = A0_103["profileTable.headerCaptionFontSize"]
  L14_117 = A0_103["profileTable.headerCaption"]
  L15_118 = A0_103["profileTable.headerCaptionFontColor"]
  L16_119 = A0_103["profileTable.loginSectionTitle"]
  L17_120 = A0_103["profileTable.welcomeMessage"]
  L18_121 = A0_103["profileTable.errorMessage"]
  L19_122 = A0_103["profileTable.messagesFontColor"]
  L20_123 = A0_103["profileTable.showAdvertisement"]
  L21_124 = A0_103["profileTable.advertisementContent"]
  L22_125 = A0_103["profileTable.advertisementAlignment"]
  L23_126 = A0_103["profileTable.advertisementFontType"]
  L24_127 = A0_103["profileTable.advertisementFontSize"]
  L25_128 = A0_103["profileTable.advertisementFontColor"]
  L26_129 = A0_103["profileTable.showFooter"]
  L27_130 = A0_103["profileTable.footerContent"]
  L28_131 = A0_103["profileTable.footerFontColor"]
  L29_132 = A0_103["profileTable.mobileRedirection"]
  if L2_105 == nil or L3_106 == nil or L14_117 == nil or L16_119 == nil or L17_120 == nil or L18_121 == nil then
    L30_133 = util
    L30_133 = L30_133.appendDebugOut
    L30_133("GetNext : Invalid Cookie")
    L30_133 = _UPVALUE0_
    L30_133 = L30_133.BAD_PARAMETER
    return L30_133
  end
  L30_133 = nil
  _UPVALUE1_.start()
  L30_133, _UPVALUE2_ = _UPVALUE3_.loginProfileCreate(L1_104, L2_105, L3_106, L4_107, L5_108, L6_109, L7_110, L8_111, L9_112, L10_113, L11_114, L12_115, L13_116, L14_117, L15_118, L16_119, L17_120, L18_121, L19_122, L20_123, L21_124, L22_125, L23_126, L24_127, L25_128, L26_129, L27_130, L28_131, L29_132)
  if L30_133 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page Captive Portal loginProfiles Page " .. L30_133)
    _UPVALUE1_.abort()
    return L30_133, 0
  end
  if COUNTRY_CODE ~= "RU" then
    if tonumber(L4_107) == IMAGE_TYPE then
      L6_109 = INT_WHITE
    end
    L30_133, _UPVALUE2_ = _UPVALUE4_.loginProfileCreate(L1_104, L2_105, L3_106, L4_107, L5_108, L6_109, L7_110, L8_111, L9_112, L10_113, L11_114, L12_115, L13_116, L14_117, L15_118, L16_119, L17_120, L18_121, L19_122, L20_123, L21_124, L22_125, L23_126, L24_127, L25_128, L26_129, L27_130, L28_131)
    if L30_133 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in configuring values in page SSLVPN loginProfiles Page " .. L30_133)
      _UPVALUE1_.abort()
      return L30_133, 0
    end
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, _UPVALUE2_
end
function profileDelete(A0_134)
  local L1_135, L2_136
  L1_135 = ACCESS_LEVEL
  if L1_135 ~= 0 then
    L1_135 = util
    L1_135 = L1_135.appendDebugOut
    L2_136 = "Detected Unauthorized access for page loginProfiles"
    L1_135(L2_136)
    L1_135 = _UPVALUE0_
    L1_135 = L1_135.UNAUTHORIZED
    return L1_135
  end
  L1_135 = A0_134["profileTable.cookie"]
  if L1_135 == nil then
    L2_136 = util
    L2_136 = L2_136.appendDebugOut
    L2_136("Delete : Invalid Cookie")
    L2_136 = _UPVALUE0_
    L2_136 = L2_136.BAD_PARAMETER
    return L2_136
  end
  L2_136 = nil
  _UPVALUE1_.start()
  L2_136, _UPVALUE2_ = _UPVALUE3_.loginProfileDelete(L1_135)
  if L2_136 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page CaptivePortal loginProfiles Page" .. L2_136)
    _UPVALUE1_.abort()
    return L2_136, L1_135
  end
  if COUNTRY_CODE ~= "RU" then
    L2_136, _UPVALUE2_ = _UPVALUE4_.loginProfileDelete(L1_135)
    if L2_136 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in Delete Operaion in page SSLVPN loginProfiles Page" .. L2_136)
      _UPVALUE1_.abort()
      return L2_136, L1_135
    end
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, _UPVALUE2_
end
function profileDefaultsGet()
  local L1_137
  L1_137 = _UPVALUE0_
  L1_137 = L1_137.NOT_SUPPORTED
  return L1_137
end
function profilesGetAll()
  local L0_138, L1_139
  L0_138 = _UPVALUE0_
  L0_138 = L0_138.loginProfilesGetAll
  L1_139 = L0_138()
  if L0_138 ~= _UPVALUE1_.SUCCESS then
    return L0_138
  end
  L1_139 = util.removePrefix(L1_139, "CaptivePortalPageDetails.")
  return _UPVALUE1_.SUCCESS, L1_139
end
function profileGetRow(A0_140)
  local L1_141, L2_142
  L2_142 = A0_140
  if L2_142 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_141, _UPVALUE1_, profileTable = _UPVALUE2_.loginProfileGetRow(L2_142)
  if L1_141 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, _UPVALUE1_, profileTable
end
function profileDeleteAll()
  local L0_143
  L0_143 = ACCESS_LEVEL
  if L0_143 ~= 0 then
    L0_143 = util
    L0_143 = L0_143.appendDebugOut
    L0_143("Detected Unauthorized access for page DUMMY PAGE")
    L0_143 = _UPVALUE0_
    L0_143 = L0_143.UNAUTHORIZED
    return L0_143
  end
  L0_143 = nil
  _UPVALUE1_.start()
  L0_143, _UPVALUE2_ = _UPVALUE3_.loginProfileDeleteAll()
  if L0_143 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page CaptivePortal Login Profile" .. L0_143)
    _UPVALUE1_.abort()
    return L0_143
  end
  if COUNTRY_CODE ~= "RU" then
    L0_143, _UPVALUE2_ = _UPVALUE4_.loginProfileDeleteAll()
    if L0_143 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in Delete Operaion in page SSLVPN Login Profile" .. L0_143)
      _UPVALUE1_.abort()
      return L0_143
    end
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, 0
end
function backgroundImageUpload(A0_144)
  local L1_145, L2_146, L3_147, L4_148, L5_149, L6_150
  L1_145 = cgilua
  L1_145 = L1_145.cookies
  L1_145 = L1_145.get
  L2_146 = "TeamF1Login"
  L1_145 = L1_145(L2_146)
  L2_146 = A0_144["file.upload"]
  L2_146 = L2_146.filename
  L3_147 = A0_144["file.upload"]
  L3_147 = L3_147.filesize
  L4_148 = A0_144.imageIndex
  L5_149 = ACCESS_LEVEL
  if L5_149 ~= 0 then
    L5_149 = util
    L5_149 = L5_149.appendDebugOut
    L6_150 = "Detected Unauthorized access for page LOginProfile BG Image"
    L5_149(L6_150)
    L5_149 = _UPVALUE0_
    L5_149 = L5_149.UNAUTHORIZED
    return L5_149
  end
  L5_149 = _UPVALUE1_
  L5_149 = L5_149.start
  L5_149()
  L5_149 = _UPVALUE2_
  L5_149 = L5_149.backgroundImageUpload
  L6_150 = L1_145
  L6_150 = L5_149(L6_150, L2_146, L3_147, L4_148)
  if L5_149 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in BG Image upload" .. L5_149)
    _UPVALUE1_.abort()
    return L5_149
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L5_149, L6_150
end
function headerImageUpload(A0_151)
  local L1_152, L2_153, L3_154, L4_155, L5_156, L6_157
  L1_152 = cgilua
  L1_152 = L1_152.cookies
  L1_152 = L1_152.get
  L2_153 = "TeamF1Login"
  L1_152 = L1_152(L2_153)
  L2_153 = A0_151["file.upload"]
  L2_153 = L2_153.filename
  L3_154 = A0_151["file.upload"]
  L3_154 = L3_154.filesize
  L4_155 = A0_151.imageIndex
  L5_156 = ACCESS_LEVEL
  if L5_156 ~= 0 then
    L5_156 = util
    L5_156 = L5_156.appendDebugOut
    L6_157 = "Detected Unauthorized access for page LOginProfile BG Image"
    L5_156(L6_157)
    L5_156 = _UPVALUE0_
    L5_156 = L5_156.UNAUTHORIZED
    return L5_156
  end
  L5_156 = _UPVALUE1_
  L5_156 = L5_156.start
  L5_156()
  L5_156 = _UPVALUE2_
  L5_156 = L5_156.headerImageUpload
  L6_157 = L1_152
  L6_157 = L5_156(L6_157, L2_153, L3_154, L4_155)
  if L5_156 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in BG Image upload" .. L5_156)
    _UPVALUE1_.abort()
    return L5_156
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L5_156, L6_157
end
function pageBackgroundImageGetAll()
  local L0_158, L1_159
  L0_158, L1_159 = _UPVALUE0_.pageBackgroundImageGetAll()
  if L0_158 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  return L0_158, L1_159
end
function headerImageGetAll()
  local L0_160, L1_161
  L0_160, L1_161 = _UPVALUE0_.headerImageGetAll()
  if L0_160 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  return L0_160, L1_161
end
function profileDefaults()
  local L0_162, L1_163
  L0_162, L1_163 = _UPVALUE0_.loginProfileGetDefaults()
  if L0_162 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  return L0_162, L1_163
end
