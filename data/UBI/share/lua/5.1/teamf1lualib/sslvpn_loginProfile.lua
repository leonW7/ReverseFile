local L0_0
L0_0 = module
L0_0("com.teamf1.core.sslvpn.loginprofile", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/captiveportal_validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/captivePortal_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
loginprofileTable = "LoginProfiles"
captivePortalVlanTable = "CaptivePortalVlan"
captivePortalSSIDTable = "CaptivePortalSSID"
sslvpnPortalLayoutTable = "SSLVPNPortalLayout"
attribute = {}
attribute.profileId = "profileId"
attribute.profileName = "configurationName"
attribute.pageTitle = "title"
attribute.pageBackgroundType = "pageBackgroundStyleSelector"
attribute.pageBackgroundImgIndex = "pageBackgroundImgConfigRow"
attribute.pageBackgroundColor = "BackGroundColor"
attribute.pageCustomColor = "CustomColor"
attribute.headerBackgroundType = "headerBackground"
attribute.headerBackgroundImgIndex = "headerImage"
attribute.headerBackgroundColor = "headerBackColor"
attribute.headerBackgroundCustomColor = "headerCustomColor"
attribute.headerCaptionFontFace = "headerFont"
attribute.headerCaptionFontSize = "headerFontSize"
attribute.headerCaption = "headerCaption"
attribute.headerCaptionFontColor = "headerFontColor"
attribute.loginSectionTitle = "LoginBoxTitle"
attribute.welcomeMessage = "welcomeMessage"
attribute.errorMessage = "errorMessage"
attribute.messagesFontColor = "messagesFontColor"
attribute.showAdvertisement = "AdEnable"
attribute.advertisementContent = "AdContent"
attribute.advertisementAlignment = "AdPlace"
attribute.advertisementFontType = "AdFont"
attribute.advertisementFontSize = "AdFontSize"
attribute.advertisementFontColor = "AdFontColor"
attribute.showFooter = "FooterEnable"
attribute.footerContent = "FooterContent"
attribute.footerFontColor = "FooterFontColor"
attribute.sslvpnProfileName = "profileName"
attribute.vlanId = "vlanId"
attribute.ssid = "ssid"
attribute.portalLayoutName = "PortalLayoutName"
attribute.profileStatus = "profileStatus"
ENABLE = "1"
DISABLE = "0"
ROWID = "_ROWID_"
FALSE = false
NIL = nil
MAX_INDEX = 6
MIN_INDEX = 1
HEADER_MAX_INDEX = 12
HEADER_MIN_INDEX = 1
MAXLEN_PROFILE = 32
MINLEN_PROFILE = 1
MAXLEN_TITLE = 32
MINLEN_TITLE = 1
MAXLEN_CUSTOM_COLOR = 6
MINLEN_CUSTOM_COLOR = 0
MAXLEN_MSG = 64
MINLEN_MSG = 1
MAXLEN_HEADER = 64
MINLEN_HEADER = 1
MAXLEN_FOOTER = 64
MINLEN_FOOTER = 1
MAX_COLOR_INDEX = 5
MIN_COLOR_INDEX = 1
TAHOMA = 1
TIMES_NEW_ROMAN = 2
VERDANA = 3
ARIAL = 4
SMALL = 1
MEDIUM = 2
BIG = 3
WHITE = 1
RED = 2
GREEN = 3
BLUE = 4
CUSTOM = 5
BLACK = 5
RED_FONT_IDX = 1
BLACK_FONT_IDX = 2
GREEN_FONT_IDX = 3
BLUE_FONT_IDX = 4
MAX_COLOR_IDX = 4
MIN_COLOR_IDX = 1
RIGHT = 1
LEFT = 2
IMAGE = 1
COLOR = 2
MAX_FONT_INDEX = 4
MIN_FONT_INDEX = 1
MAX_FONTSIZE = 3
MIN_FONTSIZE = 1
MAXLEN_ADVT = 64
MINLEN_ADVT = 1
function profileIdGet()
  local L0_1, L1_2, L2_3
  L0_1 = getFirstCookie
  L1_2 = ROWID
  L2_3 = loginprofileTable
  L1_2 = L0_1(L1_2, L2_3)
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.SUCCESS
  if L0_1 ~= L2_3 then
    return L0_1
  end
  L2_3 = L1_2
  return _UPVALUE0_.SUCCESS, L1_2, L2_3
end
function profileIdGetNext(A0_4)
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
  L4_8 = loginprofileTable
  L2_6 = L1_5(L2_6, L3_7, L4_8)
  L3_7 = _UPVALUE0_
  L3_7 = L3_7.SUCCESS
  if L1_5 ~= L3_7 then
    return L1_5
  end
  L3_7 = getNextValidCookie
  L4_8 = ROWID
  L5_9 = L2_6
  L4_8 = L3_7(L4_8, L5_9, loginprofileTable)
  L5_9 = _UPVALUE0_
  L5_9 = L5_9.SUCCESS
  if L3_7 ~= L5_9 then
    return L3_7
  end
  L5_9 = db
  L5_9 = L5_9.getAttribute
  L5_9 = L5_9(loginprofileTable, ROWID, L4_8, attribute.profileId)
  if L5_9 == NIL then
    return _UPVALUE0_.FAILURE, L2_6
  end
  return _UPVALUE0_.SUCCESS, L4_8, L5_9
end
function profileIdCreate(A0_10, A1_11)
  if A0_10 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if cookieValidate(ROWID, A0_10, loginprofileTable) ~= _UPVALUE0_.SUCCESS then
    return cookieValidate(ROWID, A0_10, loginprofileTable)
  end
  if A1_11 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  return _UPVALUE0_.NOT_SUPPORTED
end
function profileIdDelete(A0_12, A1_13)
  local L2_14, L3_15
  L2_14 = NIL
  if A0_12 == L2_14 then
    L2_14 = _UPVALUE0_
    L2_14 = L2_14.INVALID_ARGUMENT
    return L2_14
  end
  L2_14 = cookieValidate
  L3_15 = ROWID
  L3_15 = L2_14(L3_15, A0_12, loginprofileTable)
  if L2_14 ~= _UPVALUE0_.SUCCESS then
    return L2_14
  end
  if A1_13 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.deleteRow(loginprofileTable, ROWID, L3_15) == NIL then
    return _UPVALUE0_.FAILURE, L3_15
  end
  return _UPVALUE0_.SUCCESS, L3_15
end
function profileNameGet()
  local L0_16, L1_17, L2_18
  L0_16 = getFirstCookie
  L1_17 = ROWID
  L2_18 = loginprofileTable
  L1_17 = L0_16(L1_17, L2_18)
  L2_18 = _UPVALUE0_
  L2_18 = L2_18.SUCCESS
  if L0_16 ~= L2_18 then
    return L0_16
  end
  L2_18 = db
  L2_18 = L2_18.getAttribute
  L2_18 = L2_18(loginprofileTable, ROWID, L1_17, attribute.profileName)
  if L2_18 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_17, L2_18
end
function profileNameGetNext(A0_19)
  local L1_20, L2_21, L3_22, L4_23, L5_24
  L1_20 = NIL
  if A0_19 == L1_20 then
    L1_20 = _UPVALUE0_
    L1_20 = L1_20.INVALID_ARGUMENT
    return L1_20
  end
  L1_20 = cookieValidate
  L2_21 = ROWID
  L3_22 = A0_19
  L4_23 = loginprofileTable
  L2_21 = L1_20(L2_21, L3_22, L4_23)
  L3_22 = _UPVALUE0_
  L3_22 = L3_22.SUCCESS
  if L1_20 ~= L3_22 then
    return L1_20
  end
  L3_22 = getNextValidCookie
  L4_23 = ROWID
  L5_24 = L2_21
  L4_23 = L3_22(L4_23, L5_24, loginprofileTable)
  L5_24 = _UPVALUE0_
  L5_24 = L5_24.SUCCESS
  if L3_22 ~= L5_24 then
    return L3_22
  end
  L5_24 = db
  L5_24 = L5_24.getAttribute
  L5_24 = L5_24(loginprofileTable, ROWID, L4_23, attribute.profileName)
  if L5_24 == NIL then
    return _UPVALUE0_.FAILURE, L2_21
  end
  return _UPVALUE0_.SUCCESS, L4_23, L5_24
end
function profileNameSet(A0_25, A1_26)
  local L2_27, L3_28
  L2_27 = NIL
  if A0_25 == L2_27 then
    L2_27 = _UPVALUE0_
    L2_27 = L2_27.INVALID_ARGUMENT
    return L2_27
  end
  L2_27 = cookieValidate
  L3_28 = ROWID
  L3_28 = L2_27(L3_28, A0_25, loginprofileTable)
  if L2_27 ~= _UPVALUE0_.SUCCESS then
    return L2_27
  end
  if A1_26 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_26) > MAXLEN_PROFILE or string.len(A1_26) < MINLEN_PROFILE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_28, attribute.profileName, A1_26) == NIL then
    return _UPVALUE0_.FAILURE, L3_28
  end
  return _UPVALUE0_.SUCCESS, L3_28
end
function pageTitleGet()
  local L0_29, L1_30, L2_31
  L0_29 = getFirstCookie
  L1_30 = ROWID
  L2_31 = loginprofileTable
  L1_30 = L0_29(L1_30, L2_31)
  L2_31 = _UPVALUE0_
  L2_31 = L2_31.SUCCESS
  if L0_29 ~= L2_31 then
    return L0_29
  end
  L2_31 = db
  L2_31 = L2_31.getAttribute
  L2_31 = L2_31(loginprofileTable, ROWID, L1_30, attribute.pageTitle)
  if L2_31 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_30, L2_31
end
function pageTitleGetNext(A0_32)
  local L1_33, L2_34, L3_35, L4_36, L5_37
  L1_33 = NIL
  if A0_32 == L1_33 then
    L1_33 = _UPVALUE0_
    L1_33 = L1_33.INVALID_ARGUMENT
    return L1_33
  end
  L1_33 = cookieValidate
  L2_34 = ROWID
  L3_35 = A0_32
  L4_36 = loginprofileTable
  L2_34 = L1_33(L2_34, L3_35, L4_36)
  L3_35 = _UPVALUE0_
  L3_35 = L3_35.SUCCESS
  if L1_33 ~= L3_35 then
    return L1_33
  end
  L3_35 = getNextValidCookie
  L4_36 = ROWID
  L5_37 = L2_34
  L4_36 = L3_35(L4_36, L5_37, loginprofileTable)
  L5_37 = _UPVALUE0_
  L5_37 = L5_37.SUCCESS
  if L3_35 ~= L5_37 then
    return L3_35
  end
  L5_37 = db
  L5_37 = L5_37.getAttribute
  L5_37 = L5_37(loginprofileTable, ROWID, L4_36, attribute.pageTitle)
  if L5_37 == NIL then
    return _UPVALUE0_.FAILURE, L2_34
  end
  return _UPVALUE0_.SUCCESS, L4_36, L5_37
end
function pageTitleSet(A0_38, A1_39)
  local L2_40, L3_41
  L2_40 = NIL
  if A0_38 == L2_40 then
    L2_40 = _UPVALUE0_
    L2_40 = L2_40.INVALID_ARGUMENT
    return L2_40
  end
  L2_40 = cookieValidate
  L3_41 = ROWID
  L3_41 = L2_40(L3_41, A0_38, loginprofileTable)
  if L2_40 ~= _UPVALUE0_.SUCCESS then
    return L2_40
  end
  if A1_39 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_39) > MAXLEN_TITLE or string.len(A1_39) < MINLEN_TITLE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_41, attribute.pageTitle, A1_39) == NIL then
    return _UPVALUE0_.FAILURE, L3_41
  end
  return _UPVALUE0_.SUCCESS, L3_41
end
function pageBackgroundTypeGet()
  local L0_42, L1_43, L2_44
  L0_42 = getFirstCookie
  L1_43 = ROWID
  L2_44 = loginprofileTable
  L1_43 = L0_42(L1_43, L2_44)
  L2_44 = _UPVALUE0_
  L2_44 = L2_44.SUCCESS
  if L0_42 ~= L2_44 then
    return L0_42
  end
  L2_44 = db
  L2_44 = L2_44.getAttribute
  L2_44 = L2_44(loginprofileTable, ROWID, L1_43, attribute.pageBackgroundType)
  if L2_44 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_43, L2_44
end
function pageBackgroundTypeGetNext(A0_45)
  local L1_46, L2_47, L3_48, L4_49, L5_50
  L1_46 = NIL
  if A0_45 == L1_46 then
    L1_46 = _UPVALUE0_
    L1_46 = L1_46.INVALID_ARGUMENT
    return L1_46
  end
  L1_46 = cookieValidate
  L2_47 = ROWID
  L3_48 = A0_45
  L4_49 = loginprofileTable
  L2_47 = L1_46(L2_47, L3_48, L4_49)
  L3_48 = _UPVALUE0_
  L3_48 = L3_48.SUCCESS
  if L1_46 ~= L3_48 then
    return L1_46
  end
  L3_48 = getNextValidCookie
  L4_49 = ROWID
  L5_50 = L2_47
  L4_49 = L3_48(L4_49, L5_50, loginprofileTable)
  L5_50 = _UPVALUE0_
  L5_50 = L5_50.SUCCESS
  if L3_48 ~= L5_50 then
    return L3_48
  end
  L5_50 = db
  L5_50 = L5_50.getAttribute
  L5_50 = L5_50(loginprofileTable, ROWID, L4_49, attribute.pageBackgroundType)
  if L5_50 == NIL then
    return _UPVALUE0_.FAILURE, L2_47
  end
  return _UPVALUE0_.SUCCESS, L4_49, L5_50
end
function pageBackgroundTypeSet(A0_51, A1_52)
  local L2_53, L3_54
  L2_53 = NIL
  if A0_51 == L2_53 then
    L2_53 = _UPVALUE0_
    L2_53 = L2_53.INVALID_ARGUMENT
    return L2_53
  end
  L2_53 = cookieValidate
  L3_54 = ROWID
  L3_54 = L2_53(L3_54, A0_51, loginprofileTable)
  if L2_53 ~= _UPVALUE0_.SUCCESS then
    return L2_53
  end
  if A1_52 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_52) ~= IMAGE and tonumber(A1_52) ~= COLOR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_54, attribute.pageBackgroundType, A1_52) == NIL then
    return _UPVALUE0_.FAILURE, L3_54
  end
  return _UPVALUE0_.SUCCESS, L3_54
end
function pageBackgroundImgIndexGet()
  local L0_55, L1_56, L2_57
  L0_55 = getFirstCookie
  L1_56 = ROWID
  L2_57 = loginprofileTable
  L1_56 = L0_55(L1_56, L2_57)
  L2_57 = _UPVALUE0_
  L2_57 = L2_57.SUCCESS
  if L0_55 ~= L2_57 then
    return L0_55
  end
  L2_57 = db
  L2_57 = L2_57.getAttribute
  L2_57 = L2_57(loginprofileTable, ROWID, L1_56, attribute.pageBackgroundImgIndex)
  if L2_57 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_56, L2_57
end
function pageBackgroundImgIndexGetNext(A0_58)
  local L1_59, L2_60, L3_61, L4_62, L5_63
  L1_59 = NIL
  if A0_58 == L1_59 then
    L1_59 = _UPVALUE0_
    L1_59 = L1_59.INVALID_ARGUMENT
    return L1_59
  end
  L1_59 = cookieValidate
  L2_60 = ROWID
  L3_61 = A0_58
  L4_62 = loginprofileTable
  L2_60 = L1_59(L2_60, L3_61, L4_62)
  L3_61 = _UPVALUE0_
  L3_61 = L3_61.SUCCESS
  if L1_59 ~= L3_61 then
    return L1_59
  end
  L3_61 = getNextValidCookie
  L4_62 = ROWID
  L5_63 = L2_60
  L4_62 = L3_61(L4_62, L5_63, loginprofileTable)
  L5_63 = _UPVALUE0_
  L5_63 = L5_63.SUCCESS
  if L3_61 ~= L5_63 then
    return L3_61
  end
  L5_63 = db
  L5_63 = L5_63.getAttribute
  L5_63 = L5_63(loginprofileTable, ROWID, L4_62, attribute.pageBackgroundImgIndex)
  if L5_63 == NIL then
    return _UPVALUE0_.FAILURE, L2_60
  end
  return _UPVALUE0_.SUCCESS, L4_62, L5_63
end
function pageBackgroundImgIndexSet(A0_64, A1_65)
  local L2_66, L3_67
  L2_66 = NIL
  if A0_64 == L2_66 then
    L2_66 = _UPVALUE0_
    L2_66 = L2_66.INVALID_ARGUMENT
    return L2_66
  end
  L2_66 = cookieValidate
  L3_67 = ROWID
  L3_67 = L2_66(L3_67, A0_64, loginprofileTable)
  if L2_66 ~= _UPVALUE0_.SUCCESS then
    return L2_66
  end
  if A1_65 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_65) < MIN_INDEX or tonumber(A1_65) > MAX_INDEX then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_67, attribute.pageBackgroundImgIndex, A1_65) == NIL then
    return _UPVALUE0_.FAILURE, L3_67
  end
  return _UPVALUE0_.SUCCESS, L3_67
end
function pageBackgroundColorGet()
  local L0_68, L1_69, L2_70
  L0_68 = getFirstCookie
  L1_69 = ROWID
  L2_70 = loginprofileTable
  L1_69 = L0_68(L1_69, L2_70)
  L2_70 = _UPVALUE0_
  L2_70 = L2_70.SUCCESS
  if L0_68 ~= L2_70 then
    return L0_68
  end
  L2_70 = db
  L2_70 = L2_70.getAttribute
  L2_70 = L2_70(loginprofileTable, ROWID, L1_69, attribute.pageBackgroundColor)
  if L2_70 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_69, L2_70
end
function pageBackgroundColorGetNext(A0_71)
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
  L4_75 = loginprofileTable
  L2_73 = L1_72(L2_73, L3_74, L4_75)
  L3_74 = _UPVALUE0_
  L3_74 = L3_74.SUCCESS
  if L1_72 ~= L3_74 then
    return L1_72
  end
  L3_74 = getNextValidCookie
  L4_75 = ROWID
  L5_76 = L2_73
  L4_75 = L3_74(L4_75, L5_76, loginprofileTable)
  L5_76 = _UPVALUE0_
  L5_76 = L5_76.SUCCESS
  if L3_74 ~= L5_76 then
    return L3_74
  end
  L5_76 = db
  L5_76 = L5_76.getAttribute
  L5_76 = L5_76(loginprofileTable, ROWID, L4_75, attribute.pageBackgroundColor)
  if L5_76 == NIL then
    return _UPVALUE0_.FAILURE, L2_73
  end
  return _UPVALUE0_.SUCCESS, L4_75, L5_76
end
function pageBackgroundColorSet(A0_77, A1_78)
  local L2_79, L3_80
  L2_79 = NIL
  if A0_77 == L2_79 then
    L2_79 = _UPVALUE0_
    L2_79 = L2_79.INVALID_ARGUMENT
    return L2_79
  end
  L2_79 = cookieValidate
  L3_80 = ROWID
  L3_80 = L2_79(L3_80, A0_77, loginprofileTable)
  if L2_79 ~= _UPVALUE0_.SUCCESS then
    return L2_79
  end
  if A1_78 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_78) < MIN_COLOR_INDEX or tonumber(A1_78) > MAX_COLOR_INDEX then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_80, attribute.pageBackgroundColor, A1_78) == NIL then
    return _UPVALUE0_.FAILURE, L3_80
  end
  return _UPVALUE0_.SUCCESS, L3_80
end
function pageCustomColorGet()
  local L0_81, L1_82, L2_83
  L0_81 = getFirstCookie
  L1_82 = ROWID
  L2_83 = loginprofileTable
  L1_82 = L0_81(L1_82, L2_83)
  L2_83 = _UPVALUE0_
  L2_83 = L2_83.SUCCESS
  if L0_81 ~= L2_83 then
    return L0_81
  end
  L2_83 = db
  L2_83 = L2_83.getAttribute
  L2_83 = L2_83(loginprofileTable, ROWID, L1_82, attribute.pageCustomColor)
  if L2_83 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_82, L2_83
end
function pageCustomColorGetNext(A0_84)
  local L1_85, L2_86, L3_87, L4_88, L5_89
  L1_85 = NIL
  if A0_84 == L1_85 then
    L1_85 = _UPVALUE0_
    L1_85 = L1_85.INVALID_ARGUMENT
    return L1_85
  end
  L1_85 = cookieValidate
  L2_86 = ROWID
  L3_87 = A0_84
  L4_88 = loginprofileTable
  L2_86 = L1_85(L2_86, L3_87, L4_88)
  L3_87 = _UPVALUE0_
  L3_87 = L3_87.SUCCESS
  if L1_85 ~= L3_87 then
    return L1_85
  end
  L3_87 = getNextValidCookie
  L4_88 = ROWID
  L5_89 = L2_86
  L4_88 = L3_87(L4_88, L5_89, loginprofileTable)
  L5_89 = _UPVALUE0_
  L5_89 = L5_89.SUCCESS
  if L3_87 ~= L5_89 then
    return L3_87
  end
  L5_89 = db
  L5_89 = L5_89.getAttribute
  L5_89 = L5_89(loginprofileTable, ROWID, L4_88, attribute.pageCustomColor)
  if L5_89 == NIL then
    return _UPVALUE0_.FAILURE, L2_86
  end
  return _UPVALUE0_.SUCCESS, L4_88, L5_89
end
function pageCustomColorSet(A0_90, A1_91)
  local L2_92, L3_93
  L2_92 = NIL
  if A0_90 == L2_92 then
    L2_92 = _UPVALUE0_
    L2_92 = L2_92.INVALID_ARGUMENT
    return L2_92
  end
  L2_92 = cookieValidate
  L3_93 = ROWID
  L3_93 = L2_92(L3_93, A0_90, loginprofileTable)
  if L2_92 ~= _UPVALUE0_.SUCCESS then
    return L2_92
  end
  if A1_91 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_91) > MAXLEN_CUSTOM_COLOR or string.len(A1_91) < MINLEN_CUSTOM_COLOR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_93, attribute.pageCustomColor, A1_91) == NIL then
    return _UPVALUE0_.FAILURE, L3_93
  end
  return _UPVALUE0_.SUCCESS, L3_93
end
function headerBackgroundTypeGet()
  local L0_94, L1_95, L2_96
  L0_94 = getFirstCookie
  L1_95 = ROWID
  L2_96 = loginprofileTable
  L1_95 = L0_94(L1_95, L2_96)
  L2_96 = _UPVALUE0_
  L2_96 = L2_96.SUCCESS
  if L0_94 ~= L2_96 then
    return L0_94
  end
  L2_96 = db
  L2_96 = L2_96.getAttribute
  L2_96 = L2_96(loginprofileTable, ROWID, L1_95, attribute.headerBackgroundType)
  if L2_96 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_95, L2_96
end
function headerBackgroundTypeGetNext(A0_97)
  local L1_98, L2_99, L3_100, L4_101, L5_102
  L1_98 = NIL
  if A0_97 == L1_98 then
    L1_98 = _UPVALUE0_
    L1_98 = L1_98.INVALID_ARGUMENT
    return L1_98
  end
  L1_98 = cookieValidate
  L2_99 = ROWID
  L3_100 = A0_97
  L4_101 = loginprofileTable
  L2_99 = L1_98(L2_99, L3_100, L4_101)
  L3_100 = _UPVALUE0_
  L3_100 = L3_100.SUCCESS
  if L1_98 ~= L3_100 then
    return L1_98
  end
  L3_100 = getNextValidCookie
  L4_101 = ROWID
  L5_102 = L2_99
  L4_101 = L3_100(L4_101, L5_102, loginprofileTable)
  L5_102 = _UPVALUE0_
  L5_102 = L5_102.SUCCESS
  if L3_100 ~= L5_102 then
    return L3_100
  end
  L5_102 = db
  L5_102 = L5_102.getAttribute
  L5_102 = L5_102(loginprofileTable, ROWID, L4_101, attribute.headerBackgroundType)
  if L5_102 == NIL then
    return _UPVALUE0_.FAILURE, L2_99
  end
  return _UPVALUE0_.SUCCESS, L4_101, L5_102
end
function headerBackgroundTypeSet(A0_103, A1_104)
  local L2_105, L3_106
  L2_105 = NIL
  if A0_103 == L2_105 then
    L2_105 = _UPVALUE0_
    L2_105 = L2_105.INVALID_ARGUMENT
    return L2_105
  end
  L2_105 = cookieValidate
  L3_106 = ROWID
  L3_106 = L2_105(L3_106, A0_103, loginprofileTable)
  if L2_105 ~= _UPVALUE0_.SUCCESS then
    return L2_105
  end
  if A1_104 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_104) ~= 1 and tonumber(A1_104) ~= 2 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_106, attribute.headerBackgroundType, A1_104) == NIL then
    return _UPVALUE0_.FAILURE, L3_106
  end
  return _UPVALUE0_.SUCCESS, L3_106
end
function headerBackgroundImgIndexGet()
  local L0_107, L1_108, L2_109
  L0_107 = getFirstCookie
  L1_108 = ROWID
  L2_109 = loginprofileTable
  L1_108 = L0_107(L1_108, L2_109)
  L2_109 = _UPVALUE0_
  L2_109 = L2_109.SUCCESS
  if L0_107 ~= L2_109 then
    return L0_107
  end
  L2_109 = db
  L2_109 = L2_109.getAttribute
  L2_109 = L2_109(loginprofileTable, ROWID, L1_108, attribute.headerBackgroundImgIndex)
  if L2_109 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_108, L2_109
end
function headerBackgroundImgIndexGetNext(A0_110)
  local L1_111, L2_112, L3_113, L4_114, L5_115
  L1_111 = NIL
  if A0_110 == L1_111 then
    L1_111 = _UPVALUE0_
    L1_111 = L1_111.INVALID_ARGUMENT
    return L1_111
  end
  L1_111 = cookieValidate
  L2_112 = ROWID
  L3_113 = A0_110
  L4_114 = loginprofileTable
  L2_112 = L1_111(L2_112, L3_113, L4_114)
  L3_113 = _UPVALUE0_
  L3_113 = L3_113.SUCCESS
  if L1_111 ~= L3_113 then
    return L1_111
  end
  L3_113 = getNextValidCookie
  L4_114 = ROWID
  L5_115 = L2_112
  L4_114 = L3_113(L4_114, L5_115, loginprofileTable)
  L5_115 = _UPVALUE0_
  L5_115 = L5_115.SUCCESS
  if L3_113 ~= L5_115 then
    return L3_113
  end
  L5_115 = db
  L5_115 = L5_115.getAttribute
  L5_115 = L5_115(loginprofileTable, ROWID, L4_114, attribute.headerBackgroundImgIndex)
  if L5_115 == NIL then
    return _UPVALUE0_.FAILURE, L2_112
  end
  return _UPVALUE0_.SUCCESS, L4_114, L5_115
end
function headerBackgroundImgIndexSet(A0_116, A1_117)
  local L2_118, L3_119
  L2_118 = NIL
  if A0_116 == L2_118 then
    L2_118 = _UPVALUE0_
    L2_118 = L2_118.INVALID_ARGUMENT
    return L2_118
  end
  L2_118 = cookieValidate
  L3_119 = ROWID
  L3_119 = L2_118(L3_119, A0_116, loginprofileTable)
  if L2_118 ~= _UPVALUE0_.SUCCESS then
    return L2_118
  end
  if A1_117 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_117) < HEADER_MIN_INDEX or tonumber(A1_117) > HEADER_MAX_INDEX then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_119, attribute.headerBackgroundImgIndex, A1_117) == NIL then
    return _UPVALUE0_.FAILURE, L3_119
  end
  return _UPVALUE0_.SUCCESS, L3_119
end
function headerBackgroundColorGet()
  local L0_120, L1_121, L2_122
  L0_120 = getFirstCookie
  L1_121 = ROWID
  L2_122 = loginprofileTable
  L1_121 = L0_120(L1_121, L2_122)
  L2_122 = _UPVALUE0_
  L2_122 = L2_122.SUCCESS
  if L0_120 ~= L2_122 then
    return L0_120
  end
  L2_122 = db
  L2_122 = L2_122.getAttribute
  L2_122 = L2_122(loginprofileTable, ROWID, L1_121, attribute.headerBackgroundColor)
  if L2_122 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_121, L2_122
end
function headerBackgroundColorGetNext(A0_123)
  local L1_124, L2_125, L3_126, L4_127, L5_128
  L1_124 = NIL
  if A0_123 == L1_124 then
    L1_124 = _UPVALUE0_
    L1_124 = L1_124.INVALID_ARGUMENT
    return L1_124
  end
  L1_124 = cookieValidate
  L2_125 = ROWID
  L3_126 = A0_123
  L4_127 = loginprofileTable
  L2_125 = L1_124(L2_125, L3_126, L4_127)
  L3_126 = _UPVALUE0_
  L3_126 = L3_126.SUCCESS
  if L1_124 ~= L3_126 then
    return L1_124
  end
  L3_126 = getNextValidCookie
  L4_127 = ROWID
  L5_128 = L2_125
  L4_127 = L3_126(L4_127, L5_128, loginprofileTable)
  L5_128 = _UPVALUE0_
  L5_128 = L5_128.SUCCESS
  if L3_126 ~= L5_128 then
    return L3_126
  end
  L5_128 = db
  L5_128 = L5_128.getAttribute
  L5_128 = L5_128(loginprofileTable, ROWID, L4_127, attribute.headerBackgroundColor)
  if L5_128 == NIL then
    return _UPVALUE0_.FAILURE, L2_125
  end
  return _UPVALUE0_.SUCCESS, L4_127, L5_128
end
function headerBackgroundColorSet(A0_129, A1_130)
  local L2_131, L3_132
  L2_131 = NIL
  if A0_129 == L2_131 then
    L2_131 = _UPVALUE0_
    L2_131 = L2_131.INVALID_ARGUMENT
    return L2_131
  end
  L2_131 = cookieValidate
  L3_132 = ROWID
  L3_132 = L2_131(L3_132, A0_129, loginprofileTable)
  if L2_131 ~= _UPVALUE0_.SUCCESS then
    return L2_131
  end
  if A1_130 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_130) ~= WHITE and tonumber(A1_130) ~= RED and tonumber(A1_130) ~= GREEN and tonumber(A1_130) ~= BLUE and tonumber(A1_130) ~= CUSTOM then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_132, attribute.headerBackgroundColor, A1_130) == NIL then
    return _UPVALUE0_.FAILURE, L3_132
  end
  return _UPVALUE0_.SUCCESS, L3_132
end
function headerBackgroundCustomColorGet()
  local L0_133, L1_134, L2_135
  L0_133 = getFirstCookie
  L1_134 = ROWID
  L2_135 = loginprofileTable
  L1_134 = L0_133(L1_134, L2_135)
  L2_135 = _UPVALUE0_
  L2_135 = L2_135.SUCCESS
  if L0_133 ~= L2_135 then
    return L0_133
  end
  L2_135 = db
  L2_135 = L2_135.getAttribute
  L2_135 = L2_135(loginprofileTable, ROWID, L1_134, attribute.headerBackgroundCustomColor)
  if L2_135 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_134, L2_135
end
function headerBackgroundCustomColorGetNext(A0_136)
  local L1_137, L2_138, L3_139, L4_140, L5_141
  L1_137 = NIL
  if A0_136 == L1_137 then
    L1_137 = _UPVALUE0_
    L1_137 = L1_137.INVALID_ARGUMENT
    return L1_137
  end
  L1_137 = cookieValidate
  L2_138 = ROWID
  L3_139 = A0_136
  L4_140 = loginprofileTable
  L2_138 = L1_137(L2_138, L3_139, L4_140)
  L3_139 = _UPVALUE0_
  L3_139 = L3_139.SUCCESS
  if L1_137 ~= L3_139 then
    return L1_137
  end
  L3_139 = getNextValidCookie
  L4_140 = ROWID
  L5_141 = L2_138
  L4_140 = L3_139(L4_140, L5_141, loginprofileTable)
  L5_141 = _UPVALUE0_
  L5_141 = L5_141.SUCCESS
  if L3_139 ~= L5_141 then
    return L3_139
  end
  L5_141 = db
  L5_141 = L5_141.getAttribute
  L5_141 = L5_141(loginprofileTable, ROWID, L4_140, attribute.headerBackgroundCustomColor)
  if L5_141 == NIL then
    return _UPVALUE0_.FAILURE, L2_138
  end
  return _UPVALUE0_.SUCCESS, L4_140, L5_141
end
function headerBackgroundCustomColorSet(A0_142, A1_143)
  local L2_144, L3_145
  L2_144 = NIL
  if A0_142 == L2_144 then
    L2_144 = _UPVALUE0_
    L2_144 = L2_144.INVALID_ARGUMENT
    return L2_144
  end
  L2_144 = cookieValidate
  L3_145 = ROWID
  L3_145 = L2_144(L3_145, A0_142, loginprofileTable)
  if L2_144 ~= _UPVALUE0_.SUCCESS then
    return L2_144
  end
  if A1_143 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_143) > MAXLEN_CUSTOM_COLOR or string.len(A1_143) < MINLEN_CUSTOM_COLOR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_145, attribute.headerBackgroundCustomColor, A1_143) == NIL then
    return _UPVALUE0_.FAILURE, L3_145
  end
  return _UPVALUE0_.SUCCESS, L3_145
end
function headerCaptionFontFaceGet()
  local L0_146, L1_147, L2_148
  L0_146 = getFirstCookie
  L1_147 = ROWID
  L2_148 = loginprofileTable
  L1_147 = L0_146(L1_147, L2_148)
  L2_148 = _UPVALUE0_
  L2_148 = L2_148.SUCCESS
  if L0_146 ~= L2_148 then
    return L0_146
  end
  L2_148 = db
  L2_148 = L2_148.getAttribute
  L2_148 = L2_148(loginprofileTable, ROWID, L1_147, attribute.headerCaptionFontFace)
  if L2_148 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_147, L2_148
end
function headerCaptionFontFaceGetNext(A0_149)
  local L1_150, L2_151, L3_152, L4_153, L5_154
  L1_150 = NIL
  if A0_149 == L1_150 then
    L1_150 = _UPVALUE0_
    L1_150 = L1_150.INVALID_ARGUMENT
    return L1_150
  end
  L1_150 = cookieValidate
  L2_151 = ROWID
  L3_152 = A0_149
  L4_153 = loginprofileTable
  L2_151 = L1_150(L2_151, L3_152, L4_153)
  L3_152 = _UPVALUE0_
  L3_152 = L3_152.SUCCESS
  if L1_150 ~= L3_152 then
    return L1_150
  end
  L3_152 = getNextValidCookie
  L4_153 = ROWID
  L5_154 = L2_151
  L4_153 = L3_152(L4_153, L5_154, loginprofileTable)
  L5_154 = _UPVALUE0_
  L5_154 = L5_154.SUCCESS
  if L3_152 ~= L5_154 then
    return L3_152
  end
  L5_154 = db
  L5_154 = L5_154.getAttribute
  L5_154 = L5_154(loginprofileTable, ROWID, L4_153, attribute.headerCaptionFontFace)
  if L5_154 == NIL then
    return _UPVALUE0_.FAILURE, L2_151
  end
  return _UPVALUE0_.SUCCESS, L4_153, L5_154
end
function headerCaptionFontFaceSet(A0_155, A1_156)
  local L2_157, L3_158
  L2_157 = NIL
  if A0_155 == L2_157 then
    L2_157 = _UPVALUE0_
    L2_157 = L2_157.INVALID_ARGUMENT
    return L2_157
  end
  L2_157 = cookieValidate
  L3_158 = ROWID
  L3_158 = L2_157(L3_158, A0_155, loginprofileTable)
  if L2_157 ~= _UPVALUE0_.SUCCESS then
    return L2_157
  end
  if A1_156 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_156) < MIN_FONT_INDEX or tonumber(A1_156) > MAX_FONT_INDEX then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_158, attribute.headerCaptionFontFace, A1_156) == NIL then
    return _UPVALUE0_.FAILURE, L3_158
  end
  return _UPVALUE0_.SUCCESS, L3_158
end
function headerCaptionFontSizeGet()
  local L0_159, L1_160, L2_161
  L0_159 = getFirstCookie
  L1_160 = ROWID
  L2_161 = loginprofileTable
  L1_160 = L0_159(L1_160, L2_161)
  L2_161 = _UPVALUE0_
  L2_161 = L2_161.SUCCESS
  if L0_159 ~= L2_161 then
    return L0_159
  end
  L2_161 = db
  L2_161 = L2_161.getAttribute
  L2_161 = L2_161(loginprofileTable, ROWID, L1_160, attribute.headerCaptionFontSize)
  if L2_161 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_160, L2_161
end
function headerCaptionFontSizeGetNext(A0_162)
  local L1_163, L2_164, L3_165, L4_166, L5_167
  L1_163 = NIL
  if A0_162 == L1_163 then
    L1_163 = _UPVALUE0_
    L1_163 = L1_163.INVALID_ARGUMENT
    return L1_163
  end
  L1_163 = cookieValidate
  L2_164 = ROWID
  L3_165 = A0_162
  L4_166 = loginprofileTable
  L2_164 = L1_163(L2_164, L3_165, L4_166)
  L3_165 = _UPVALUE0_
  L3_165 = L3_165.SUCCESS
  if L1_163 ~= L3_165 then
    return L1_163
  end
  L3_165 = getNextValidCookie
  L4_166 = ROWID
  L5_167 = L2_164
  L4_166 = L3_165(L4_166, L5_167, loginprofileTable)
  L5_167 = _UPVALUE0_
  L5_167 = L5_167.SUCCESS
  if L3_165 ~= L5_167 then
    return L3_165
  end
  L5_167 = db
  L5_167 = L5_167.getAttribute
  L5_167 = L5_167(loginprofileTable, ROWID, L4_166, attribute.headerCaptionFontSize)
  if L5_167 == NIL then
    return _UPVALUE0_.FAILURE, L2_164
  end
  return _UPVALUE0_.SUCCESS, L4_166, L5_167
end
function headerCaptionFontSizeSet(A0_168, A1_169)
  local L2_170, L3_171
  L2_170 = NIL
  if A0_168 == L2_170 then
    L2_170 = _UPVALUE0_
    L2_170 = L2_170.INVALID_ARGUMENT
    return L2_170
  end
  L2_170 = cookieValidate
  L3_171 = ROWID
  L3_171 = L2_170(L3_171, A0_168, loginprofileTable)
  if L2_170 ~= _UPVALUE0_.SUCCESS then
    return L2_170
  end
  if A1_169 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_169) < MIN_FONTSIZE or tonumber(A1_169) > MAX_FONTSIZE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_171, attribute.headerCaptionFontSize, A1_169) == NIL then
    return _UPVALUE0_.FAILURE, L3_171
  end
  return _UPVALUE0_.SUCCESS, L3_171
end
function headerCaptionGet()
  local L0_172, L1_173, L2_174
  L0_172 = getFirstCookie
  L1_173 = ROWID
  L2_174 = loginprofileTable
  L1_173 = L0_172(L1_173, L2_174)
  L2_174 = _UPVALUE0_
  L2_174 = L2_174.SUCCESS
  if L0_172 ~= L2_174 then
    return L0_172
  end
  L2_174 = db
  L2_174 = L2_174.getAttribute
  L2_174 = L2_174(loginprofileTable, ROWID, L1_173, attribute.headerCaption)
  if L2_174 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_173, L2_174
end
function headerCaptionGetNext(A0_175)
  local L1_176, L2_177, L3_178, L4_179, L5_180
  L1_176 = NIL
  if A0_175 == L1_176 then
    L1_176 = _UPVALUE0_
    L1_176 = L1_176.INVALID_ARGUMENT
    return L1_176
  end
  L1_176 = cookieValidate
  L2_177 = ROWID
  L3_178 = A0_175
  L4_179 = loginprofileTable
  L2_177 = L1_176(L2_177, L3_178, L4_179)
  L3_178 = _UPVALUE0_
  L3_178 = L3_178.SUCCESS
  if L1_176 ~= L3_178 then
    return L1_176
  end
  L3_178 = getNextValidCookie
  L4_179 = ROWID
  L5_180 = L2_177
  L4_179 = L3_178(L4_179, L5_180, loginprofileTable)
  L5_180 = _UPVALUE0_
  L5_180 = L5_180.SUCCESS
  if L3_178 ~= L5_180 then
    return L3_178
  end
  L5_180 = db
  L5_180 = L5_180.getAttribute
  L5_180 = L5_180(loginprofileTable, ROWID, L4_179, attribute.headerCaption)
  if L5_180 == NIL then
    return _UPVALUE0_.FAILURE, L2_177
  end
  return _UPVALUE0_.SUCCESS, L4_179, L5_180
end
function headerCaptionSet(A0_181, A1_182)
  local L2_183, L3_184
  L2_183 = NIL
  if A0_181 == L2_183 then
    L2_183 = _UPVALUE0_
    L2_183 = L2_183.INVALID_ARGUMENT
    return L2_183
  end
  L2_183 = cookieValidate
  L3_184 = ROWID
  L3_184 = L2_183(L3_184, A0_181, loginprofileTable)
  if L2_183 ~= _UPVALUE0_.SUCCESS then
    return L2_183
  end
  if A1_182 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_182) > MAXLEN_HEADER or string.len(A1_182) < MINLEN_HEADER then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_184, attribute.headerCaption, A1_182) == NIL then
    return _UPVALUE0_.FAILURE, L3_184
  end
  return _UPVALUE0_.SUCCESS, L3_184
end
function headerCaptionFontColorGet()
  local L0_185, L1_186, L2_187
  L0_185 = getFirstCookie
  L1_186 = ROWID
  L2_187 = loginprofileTable
  L1_186 = L0_185(L1_186, L2_187)
  L2_187 = _UPVALUE0_
  L2_187 = L2_187.SUCCESS
  if L0_185 ~= L2_187 then
    return L0_185
  end
  L2_187 = db
  L2_187 = L2_187.getAttribute
  L2_187 = L2_187(loginprofileTable, ROWID, L1_186, attribute.headerCaptionFontColor)
  if L2_187 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_186, L2_187
end
function headerCaptionFontColorGetNext(A0_188)
  local L1_189, L2_190, L3_191, L4_192, L5_193
  L1_189 = NIL
  if A0_188 == L1_189 then
    L1_189 = _UPVALUE0_
    L1_189 = L1_189.INVALID_ARGUMENT
    return L1_189
  end
  L1_189 = cookieValidate
  L2_190 = ROWID
  L3_191 = A0_188
  L4_192 = loginprofileTable
  L2_190 = L1_189(L2_190, L3_191, L4_192)
  L3_191 = _UPVALUE0_
  L3_191 = L3_191.SUCCESS
  if L1_189 ~= L3_191 then
    return L1_189
  end
  L3_191 = getNextValidCookie
  L4_192 = ROWID
  L5_193 = L2_190
  L4_192 = L3_191(L4_192, L5_193, loginprofileTable)
  L5_193 = _UPVALUE0_
  L5_193 = L5_193.SUCCESS
  if L3_191 ~= L5_193 then
    return L3_191
  end
  L5_193 = db
  L5_193 = L5_193.getAttribute
  L5_193 = L5_193(loginprofileTable, ROWID, L4_192, attribute.headerCaptionFontColor)
  if L5_193 == NIL then
    return _UPVALUE0_.FAILURE, L2_190
  end
  return _UPVALUE0_.SUCCESS, L4_192, L5_193
end
function headerCaptionFontColorSet(A0_194, A1_195)
  local L2_196, L3_197
  L2_196 = NIL
  if A0_194 == L2_196 then
    L2_196 = _UPVALUE0_
    L2_196 = L2_196.INVALID_ARGUMENT
    return L2_196
  end
  L2_196 = cookieValidate
  L3_197 = ROWID
  L3_197 = L2_196(L3_197, A0_194, loginprofileTable)
  if L2_196 ~= _UPVALUE0_.SUCCESS then
    return L2_196
  end
  if A1_195 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_195) < MIN_COLOR_IDX or tonumber(A1_195) > MAX_COLOR_IDX then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_197, attribute.headerCaptionFontColor, A1_195) == NIL then
    return _UPVALUE0_.FAILURE, L3_197
  end
  return _UPVALUE0_.SUCCESS, L3_197
end
function loginSectionTitleGet()
  local L0_198, L1_199, L2_200
  L0_198 = getFirstCookie
  L1_199 = ROWID
  L2_200 = loginprofileTable
  L1_199 = L0_198(L1_199, L2_200)
  L2_200 = _UPVALUE0_
  L2_200 = L2_200.SUCCESS
  if L0_198 ~= L2_200 then
    return L0_198
  end
  L2_200 = db
  L2_200 = L2_200.getAttribute
  L2_200 = L2_200(loginprofileTable, ROWID, L1_199, attribute.loginSectionTitle)
  if L2_200 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_199, L2_200
end
function loginSectionTitleGetNext(A0_201)
  local L1_202, L2_203, L3_204, L4_205, L5_206
  L1_202 = NIL
  if A0_201 == L1_202 then
    L1_202 = _UPVALUE0_
    L1_202 = L1_202.INVALID_ARGUMENT
    return L1_202
  end
  L1_202 = cookieValidate
  L2_203 = ROWID
  L3_204 = A0_201
  L4_205 = loginprofileTable
  L2_203 = L1_202(L2_203, L3_204, L4_205)
  L3_204 = _UPVALUE0_
  L3_204 = L3_204.SUCCESS
  if L1_202 ~= L3_204 then
    return L1_202
  end
  L3_204 = getNextValidCookie
  L4_205 = ROWID
  L5_206 = L2_203
  L4_205 = L3_204(L4_205, L5_206, loginprofileTable)
  L5_206 = _UPVALUE0_
  L5_206 = L5_206.SUCCESS
  if L3_204 ~= L5_206 then
    return L3_204
  end
  L5_206 = db
  L5_206 = L5_206.getAttribute
  L5_206 = L5_206(loginprofileTable, ROWID, L4_205, attribute.loginSectionTitle)
  if L5_206 == NIL then
    return _UPVALUE0_.FAILURE, L2_203
  end
  return _UPVALUE0_.SUCCESS, L4_205, L5_206
end
function loginSectionTitleSet(A0_207, A1_208)
  local L2_209, L3_210
  L2_209 = NIL
  if A0_207 == L2_209 then
    L2_209 = _UPVALUE0_
    L2_209 = L2_209.INVALID_ARGUMENT
    return L2_209
  end
  L2_209 = cookieValidate
  L3_210 = ROWID
  L3_210 = L2_209(L3_210, A0_207, loginprofileTable)
  if L2_209 ~= _UPVALUE0_.SUCCESS then
    return L2_209
  end
  if A1_208 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_208) > MAXLEN_TITLE or string.len(A1_208) < MINLEN_TITLE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_210, attribute.loginSectionTitle, A1_208) == NIL then
    return _UPVALUE0_.FAILURE, L3_210
  end
  return _UPVALUE0_.SUCCESS, L3_210
end
function welcomeMessageGet()
  local L0_211, L1_212, L2_213
  L0_211 = getFirstCookie
  L1_212 = ROWID
  L2_213 = loginprofileTable
  L1_212 = L0_211(L1_212, L2_213)
  L2_213 = _UPVALUE0_
  L2_213 = L2_213.SUCCESS
  if L0_211 ~= L2_213 then
    return L0_211
  end
  L2_213 = db
  L2_213 = L2_213.getAttribute
  L2_213 = L2_213(loginprofileTable, ROWID, L1_212, attribute.welcomeMessage)
  if L2_213 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_212, L2_213
end
function welcomeMessageGetNext(A0_214)
  local L1_215, L2_216, L3_217, L4_218, L5_219
  L1_215 = NIL
  if A0_214 == L1_215 then
    L1_215 = _UPVALUE0_
    L1_215 = L1_215.INVALID_ARGUMENT
    return L1_215
  end
  L1_215 = cookieValidate
  L2_216 = ROWID
  L3_217 = A0_214
  L4_218 = loginprofileTable
  L2_216 = L1_215(L2_216, L3_217, L4_218)
  L3_217 = _UPVALUE0_
  L3_217 = L3_217.SUCCESS
  if L1_215 ~= L3_217 then
    return L1_215
  end
  L3_217 = getNextValidCookie
  L4_218 = ROWID
  L5_219 = L2_216
  L4_218 = L3_217(L4_218, L5_219, loginprofileTable)
  L5_219 = _UPVALUE0_
  L5_219 = L5_219.SUCCESS
  if L3_217 ~= L5_219 then
    return L3_217
  end
  L5_219 = db
  L5_219 = L5_219.getAttribute
  L5_219 = L5_219(loginprofileTable, ROWID, L4_218, attribute.welcomeMessage)
  if L5_219 == NIL then
    return _UPVALUE0_.FAILURE, L2_216
  end
  return _UPVALUE0_.SUCCESS, L4_218, L5_219
end
function welcomeMessageSet(A0_220, A1_221)
  local L2_222, L3_223
  L2_222 = NIL
  if A0_220 == L2_222 then
    L2_222 = _UPVALUE0_
    L2_222 = L2_222.INVALID_ARGUMENT
    return L2_222
  end
  L2_222 = cookieValidate
  L3_223 = ROWID
  L3_223 = L2_222(L3_223, A0_220, loginprofileTable)
  if L2_222 ~= _UPVALUE0_.SUCCESS then
    return L2_222
  end
  if A1_221 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_221) > MAXLEN_MSG or string.len(A1_221) < MINLEN_MSG then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_223, attribute.welcomeMessage, A1_221) == NIL then
    return _UPVALUE0_.FAILURE, L3_223
  end
  return _UPVALUE0_.SUCCESS, L3_223
end
function errorMessageGet()
  local L0_224, L1_225, L2_226
  L0_224 = getFirstCookie
  L1_225 = ROWID
  L2_226 = loginprofileTable
  L1_225 = L0_224(L1_225, L2_226)
  L2_226 = _UPVALUE0_
  L2_226 = L2_226.SUCCESS
  if L0_224 ~= L2_226 then
    return L0_224
  end
  L2_226 = db
  L2_226 = L2_226.getAttribute
  L2_226 = L2_226(loginprofileTable, ROWID, L1_225, attribute.errorMessage)
  if L2_226 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_225, L2_226
end
function errorMessageGetNext(A0_227)
  local L1_228, L2_229, L3_230, L4_231, L5_232
  L1_228 = NIL
  if A0_227 == L1_228 then
    L1_228 = _UPVALUE0_
    L1_228 = L1_228.INVALID_ARGUMENT
    return L1_228
  end
  L1_228 = cookieValidate
  L2_229 = ROWID
  L3_230 = A0_227
  L4_231 = loginprofileTable
  L2_229 = L1_228(L2_229, L3_230, L4_231)
  L3_230 = _UPVALUE0_
  L3_230 = L3_230.SUCCESS
  if L1_228 ~= L3_230 then
    return L1_228
  end
  L3_230 = getNextValidCookie
  L4_231 = ROWID
  L5_232 = L2_229
  L4_231 = L3_230(L4_231, L5_232, loginprofileTable)
  L5_232 = _UPVALUE0_
  L5_232 = L5_232.SUCCESS
  if L3_230 ~= L5_232 then
    return L3_230
  end
  L5_232 = db
  L5_232 = L5_232.getAttribute
  L5_232 = L5_232(loginprofileTable, ROWID, L4_231, attribute.errorMessage)
  if L5_232 == NIL then
    return _UPVALUE0_.FAILURE, L2_229
  end
  return _UPVALUE0_.SUCCESS, L4_231, L5_232
end
function errorMessageSet(A0_233, A1_234)
  local L2_235, L3_236
  L2_235 = NIL
  if A0_233 == L2_235 then
    L2_235 = _UPVALUE0_
    L2_235 = L2_235.INVALID_ARGUMENT
    return L2_235
  end
  L2_235 = cookieValidate
  L3_236 = ROWID
  L3_236 = L2_235(L3_236, A0_233, loginprofileTable)
  if L2_235 ~= _UPVALUE0_.SUCCESS then
    return L2_235
  end
  if A1_234 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_234) > MAXLEN_MSG or string.len(A1_234) < MINLEN_MSG then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_236, attribute.errorMessage, A1_234) == NIL then
    return _UPVALUE0_.FAILURE, L3_236
  end
  return _UPVALUE0_.SUCCESS, L3_236
end
function messagesFontColorGet()
  local L0_237, L1_238, L2_239
  L0_237 = getFirstCookie
  L1_238 = ROWID
  L2_239 = loginprofileTable
  L1_238 = L0_237(L1_238, L2_239)
  L2_239 = _UPVALUE0_
  L2_239 = L2_239.SUCCESS
  if L0_237 ~= L2_239 then
    return L0_237
  end
  L2_239 = db
  L2_239 = L2_239.getAttribute
  L2_239 = L2_239(loginprofileTable, ROWID, L1_238, attribute.messagesFontColor)
  if L2_239 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_238, L2_239
end
function messagesFontColorGetNext(A0_240)
  local L1_241, L2_242, L3_243, L4_244, L5_245
  L1_241 = NIL
  if A0_240 == L1_241 then
    L1_241 = _UPVALUE0_
    L1_241 = L1_241.INVALID_ARGUMENT
    return L1_241
  end
  L1_241 = cookieValidate
  L2_242 = ROWID
  L3_243 = A0_240
  L4_244 = loginprofileTable
  L2_242 = L1_241(L2_242, L3_243, L4_244)
  L3_243 = _UPVALUE0_
  L3_243 = L3_243.SUCCESS
  if L1_241 ~= L3_243 then
    return L1_241
  end
  L3_243 = getNextValidCookie
  L4_244 = ROWID
  L5_245 = L2_242
  L4_244 = L3_243(L4_244, L5_245, loginprofileTable)
  L5_245 = _UPVALUE0_
  L5_245 = L5_245.SUCCESS
  if L3_243 ~= L5_245 then
    return L3_243
  end
  L5_245 = db
  L5_245 = L5_245.getAttribute
  L5_245 = L5_245(loginprofileTable, ROWID, L4_244, attribute.messagesFontColor)
  if L5_245 == NIL then
    return _UPVALUE0_.FAILURE, L2_242
  end
  return _UPVALUE0_.SUCCESS, L4_244, L5_245
end
function messagesFontColorSet(A0_246, A1_247)
  local L2_248, L3_249
  L2_248 = NIL
  if A0_246 == L2_248 then
    L2_248 = _UPVALUE0_
    L2_248 = L2_248.INVALID_ARGUMENT
    return L2_248
  end
  L2_248 = cookieValidate
  L3_249 = ROWID
  L3_249 = L2_248(L3_249, A0_246, loginprofileTable)
  if L2_248 ~= _UPVALUE0_.SUCCESS then
    return L2_248
  end
  if A1_247 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_247) < MIN_COLOR_IDX or tonumber(A1_247) > MAX_COLOR_IDX then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_249, attribute.messagesFontColor, A1_247) == NIL then
    return _UPVALUE0_.FAILURE, L3_249
  end
  return _UPVALUE0_.SUCCESS, L3_249
end
function isshowAdvertisementEnabled()
  local L0_250, L1_251, L2_252
  L0_250 = getFirstCookie
  L1_251 = ROWID
  L2_252 = loginprofileTable
  L1_251 = L0_250(L1_251, L2_252)
  L2_252 = _UPVALUE0_
  L2_252 = L2_252.SUCCESS
  if L0_250 ~= L2_252 then
    return L0_250
  end
  L2_252 = db
  L2_252 = L2_252.getAttribute
  L2_252 = L2_252(loginprofileTable, ROWID, L1_251, attribute.showAdvertisement)
  if L2_252 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_251, L2_252
end
function isshowAdvertisementEnabledNext(A0_253)
  local L1_254, L2_255, L3_256, L4_257, L5_258
  L1_254 = NIL
  if A0_253 == L1_254 then
    L1_254 = _UPVALUE0_
    L1_254 = L1_254.INVALID_ARGUMENT
    return L1_254
  end
  L1_254 = cookieValidate
  L2_255 = ROWID
  L3_256 = A0_253
  L4_257 = loginprofileTable
  L2_255 = L1_254(L2_255, L3_256, L4_257)
  L3_256 = _UPVALUE0_
  L3_256 = L3_256.SUCCESS
  if L1_254 ~= L3_256 then
    return L1_254
  end
  L3_256 = getNextValidCookie
  L4_257 = ROWID
  L5_258 = L2_255
  L4_257 = L3_256(L4_257, L5_258, loginprofileTable)
  L5_258 = _UPVALUE0_
  L5_258 = L5_258.SUCCESS
  if L3_256 ~= L5_258 then
    return L3_256
  end
  L5_258 = db
  L5_258 = L5_258.getAttribute
  L5_258 = L5_258(loginprofileTable, ROWID, L4_257, attribute.showAdvertisement)
  if L5_258 == NIL then
    return _UPVALUE0_.FAILURE, L2_255
  end
  return _UPVALUE0_.SUCCESS, L4_257, L5_258
end
function showAdvertisementEnable(A0_259)
  local L1_260, L2_261
  L1_260 = NIL
  if A0_259 == L1_260 then
    L1_260 = _UPVALUE0_
    L1_260 = L1_260.INVALID_ARGUMENT
    return L1_260
  end
  L1_260 = cookieValidate
  L2_261 = ROWID
  L2_261 = L1_260(L2_261, A0_259, loginprofileTable)
  if L1_260 ~= _UPVALUE0_.SUCCESS then
    return L1_260
  end
  if db.setAttribute(loginprofileTable, ROWID, L2_261, attribute.showAdvertisement, ENABLE) == NIL then
    return _UPVALUE0_.FAILURE, L2_261
  end
  return _UPVALUE0_.SUCCESS, L2_261
end
function showAdvertisementDisable(A0_262)
  local L1_263, L2_264
  L1_263 = NIL
  if A0_262 == L1_263 then
    L1_263 = _UPVALUE0_
    L1_263 = L1_263.INVALID_ARGUMENT
    return L1_263
  end
  L1_263 = cookieValidate
  L2_264 = ROWID
  L2_264 = L1_263(L2_264, A0_262, loginprofileTable)
  if L1_263 ~= _UPVALUE0_.SUCCESS then
    return L1_263
  end
  if db.setAttribute(loginprofileTable, ROWID, L2_264, attribute.showAdvertisement, DISABLE) == NIL then
    return _UPVALUE0_.FAILURE, L2_264
  end
  return _UPVALUE0_.SUCCESS, L2_264
end
function advertisementContentGet()
  local L0_265, L1_266, L2_267
  L0_265 = getFirstCookie
  L1_266 = ROWID
  L2_267 = loginprofileTable
  L1_266 = L0_265(L1_266, L2_267)
  L2_267 = _UPVALUE0_
  L2_267 = L2_267.SUCCESS
  if L0_265 ~= L2_267 then
    return L0_265
  end
  L2_267 = db
  L2_267 = L2_267.getAttribute
  L2_267 = L2_267(loginprofileTable, ROWID, L1_266, attribute.advertisementContent)
  if L2_267 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_266, L2_267
end
function advertisementContentGetNext(A0_268)
  local L1_269, L2_270, L3_271, L4_272, L5_273
  L1_269 = NIL
  if A0_268 == L1_269 then
    L1_269 = _UPVALUE0_
    L1_269 = L1_269.INVALID_ARGUMENT
    return L1_269
  end
  L1_269 = cookieValidate
  L2_270 = ROWID
  L3_271 = A0_268
  L4_272 = loginprofileTable
  L2_270 = L1_269(L2_270, L3_271, L4_272)
  L3_271 = _UPVALUE0_
  L3_271 = L3_271.SUCCESS
  if L1_269 ~= L3_271 then
    return L1_269
  end
  L3_271 = getNextValidCookie
  L4_272 = ROWID
  L5_273 = L2_270
  L4_272 = L3_271(L4_272, L5_273, loginprofileTable)
  L5_273 = _UPVALUE0_
  L5_273 = L5_273.SUCCESS
  if L3_271 ~= L5_273 then
    return L3_271
  end
  L5_273 = db
  L5_273 = L5_273.getAttribute
  L5_273 = L5_273(loginprofileTable, ROWID, L4_272, attribute.advertisementContent)
  if L5_273 == NIL then
    return _UPVALUE0_.FAILURE, L2_270
  end
  return _UPVALUE0_.SUCCESS, L4_272, L5_273
end
function advertisementContentSet(A0_274, A1_275)
  local L2_276, L3_277
  L2_276 = NIL
  if A0_274 == L2_276 then
    L2_276 = _UPVALUE0_
    L2_276 = L2_276.INVALID_ARGUMENT
    return L2_276
  end
  L2_276 = cookieValidate
  L3_277 = ROWID
  L3_277 = L2_276(L3_277, A0_274, loginprofileTable)
  if L2_276 ~= _UPVALUE0_.SUCCESS then
    return L2_276
  end
  if A1_275 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_275) > MAXLEN_ADVT or string.len(A1_275) < MINLEN_ADVT then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_277, attribute.advertisementContent, A1_275) == NIL then
    return _UPVALUE0_.FAILURE, L3_277
  end
  return _UPVALUE0_.SUCCESS, L3_277
end
function advertisementAlignmentGet()
  local L0_278, L1_279, L2_280
  L0_278 = getFirstCookie
  L1_279 = ROWID
  L2_280 = loginprofileTable
  L1_279 = L0_278(L1_279, L2_280)
  L2_280 = _UPVALUE0_
  L2_280 = L2_280.SUCCESS
  if L0_278 ~= L2_280 then
    return L0_278
  end
  L2_280 = db
  L2_280 = L2_280.getAttribute
  L2_280 = L2_280(loginprofileTable, ROWID, L1_279, attribute.advertisementAlignment)
  if L2_280 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_279, L2_280
end
function advertisementAlignmentGetNext(A0_281)
  local L1_282, L2_283, L3_284, L4_285, L5_286
  L1_282 = NIL
  if A0_281 == L1_282 then
    L1_282 = _UPVALUE0_
    L1_282 = L1_282.INVALID_ARGUMENT
    return L1_282
  end
  L1_282 = cookieValidate
  L2_283 = ROWID
  L3_284 = A0_281
  L4_285 = loginprofileTable
  L2_283 = L1_282(L2_283, L3_284, L4_285)
  L3_284 = _UPVALUE0_
  L3_284 = L3_284.SUCCESS
  if L1_282 ~= L3_284 then
    return L1_282
  end
  L3_284 = getNextValidCookie
  L4_285 = ROWID
  L5_286 = L2_283
  L4_285 = L3_284(L4_285, L5_286, loginprofileTable)
  L5_286 = _UPVALUE0_
  L5_286 = L5_286.SUCCESS
  if L3_284 ~= L5_286 then
    return L3_284
  end
  L5_286 = db
  L5_286 = L5_286.getAttribute
  L5_286 = L5_286(loginprofileTable, ROWID, L4_285, attribute.advertisementAlignment)
  if L5_286 == NIL then
    return _UPVALUE0_.FAILURE, L2_283
  end
  return _UPVALUE0_.SUCCESS, L4_285, L5_286
end
function advertisementAlignmentSet(A0_287, A1_288)
  local L2_289, L3_290
  L2_289 = NIL
  if A0_287 == L2_289 then
    L2_289 = _UPVALUE0_
    L2_289 = L2_289.INVALID_ARGUMENT
    return L2_289
  end
  L2_289 = cookieValidate
  L3_290 = ROWID
  L3_290 = L2_289(L3_290, A0_287, loginprofileTable)
  if L2_289 ~= _UPVALUE0_.SUCCESS then
    return L2_289
  end
  if A1_288 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_288) ~= RIGHT and tonumber(A1_288) ~= LEFT then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_290, attribute.advertisementAlignment, A1_288) == NIL then
    return _UPVALUE0_.FAILURE, L3_290
  end
  return _UPVALUE0_.SUCCESS, L3_290
end
function advertisementFontTypeGet()
  local L0_291, L1_292, L2_293
  L0_291 = getFirstCookie
  L1_292 = ROWID
  L2_293 = loginprofileTable
  L1_292 = L0_291(L1_292, L2_293)
  L2_293 = _UPVALUE0_
  L2_293 = L2_293.SUCCESS
  if L0_291 ~= L2_293 then
    return L0_291
  end
  L2_293 = db
  L2_293 = L2_293.getAttribute
  L2_293 = L2_293(loginprofileTable, ROWID, L1_292, attribute.advertisementFontType)
  if L2_293 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_292, L2_293
end
function advertisementFontTypeGetNext(A0_294)
  local L1_295, L2_296, L3_297, L4_298, L5_299
  L1_295 = NIL
  if A0_294 == L1_295 then
    L1_295 = _UPVALUE0_
    L1_295 = L1_295.INVALID_ARGUMENT
    return L1_295
  end
  L1_295 = cookieValidate
  L2_296 = ROWID
  L3_297 = A0_294
  L4_298 = loginprofileTable
  L2_296 = L1_295(L2_296, L3_297, L4_298)
  L3_297 = _UPVALUE0_
  L3_297 = L3_297.SUCCESS
  if L1_295 ~= L3_297 then
    return L1_295
  end
  L3_297 = getNextValidCookie
  L4_298 = ROWID
  L5_299 = L2_296
  L4_298 = L3_297(L4_298, L5_299, loginprofileTable)
  L5_299 = _UPVALUE0_
  L5_299 = L5_299.SUCCESS
  if L3_297 ~= L5_299 then
    return L3_297
  end
  L5_299 = db
  L5_299 = L5_299.getAttribute
  L5_299 = L5_299(loginprofileTable, ROWID, L4_298, attribute.advertisementFontType)
  if L5_299 == NIL then
    return _UPVALUE0_.FAILURE, L2_296
  end
  return _UPVALUE0_.SUCCESS, L4_298, L5_299
end
function advertisementFontTypeSet(A0_300, A1_301)
  local L2_302, L3_303
  L2_302 = NIL
  if A0_300 == L2_302 then
    L2_302 = _UPVALUE0_
    L2_302 = L2_302.INVALID_ARGUMENT
    return L2_302
  end
  L2_302 = cookieValidate
  L3_303 = ROWID
  L3_303 = L2_302(L3_303, A0_300, loginprofileTable)
  if L2_302 ~= _UPVALUE0_.SUCCESS then
    return L2_302
  end
  if A1_301 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_301) ~= TAHOMA and tonumber(A1_301) ~= TIMES_NEW_ROMAN and tonumber(A1_301) ~= VERDANA and tonumber(A1_301) ~= ARIAL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_303, attribute.advertisementFontType, A1_301) == NIL then
    return _UPVALUE0_.FAILURE, L3_303
  end
  return _UPVALUE0_.SUCCESS, L3_303
end
function advertisementFontSizeGet()
  local L0_304, L1_305, L2_306
  L0_304 = getFirstCookie
  L1_305 = ROWID
  L2_306 = loginprofileTable
  L1_305 = L0_304(L1_305, L2_306)
  L2_306 = _UPVALUE0_
  L2_306 = L2_306.SUCCESS
  if L0_304 ~= L2_306 then
    return L0_304
  end
  L2_306 = db
  L2_306 = L2_306.getAttribute
  L2_306 = L2_306(loginprofileTable, ROWID, L1_305, attribute.advertisementFontSize)
  if L2_306 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_305, L2_306
end
function advertisementFontSizeGetNext(A0_307)
  local L1_308, L2_309, L3_310, L4_311, L5_312
  L1_308 = NIL
  if A0_307 == L1_308 then
    L1_308 = _UPVALUE0_
    L1_308 = L1_308.INVALID_ARGUMENT
    return L1_308
  end
  L1_308 = cookieValidate
  L2_309 = ROWID
  L3_310 = A0_307
  L4_311 = loginprofileTable
  L2_309 = L1_308(L2_309, L3_310, L4_311)
  L3_310 = _UPVALUE0_
  L3_310 = L3_310.SUCCESS
  if L1_308 ~= L3_310 then
    return L1_308
  end
  L3_310 = getNextValidCookie
  L4_311 = ROWID
  L5_312 = L2_309
  L4_311 = L3_310(L4_311, L5_312, loginprofileTable)
  L5_312 = _UPVALUE0_
  L5_312 = L5_312.SUCCESS
  if L3_310 ~= L5_312 then
    return L3_310
  end
  L5_312 = db
  L5_312 = L5_312.getAttribute
  L5_312 = L5_312(loginprofileTable, ROWID, L4_311, attribute.advertisementFontSize)
  if L5_312 == NIL then
    return _UPVALUE0_.FAILURE, L2_309
  end
  return _UPVALUE0_.SUCCESS, L4_311, L5_312
end
function advertisementFontSizeSet(A0_313, A1_314)
  local L2_315, L3_316
  L2_315 = NIL
  if A0_313 == L2_315 then
    L2_315 = _UPVALUE0_
    L2_315 = L2_315.INVALID_ARGUMENT
    return L2_315
  end
  L2_315 = cookieValidate
  L3_316 = ROWID
  L3_316 = L2_315(L3_316, A0_313, loginprofileTable)
  if L2_315 ~= _UPVALUE0_.SUCCESS then
    return L2_315
  end
  if A1_314 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_314) ~= SMALL and tonumber(A1_314) ~= MEDIUM and tonumber(A1_314) ~= BIG then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_316, attribute.advertisementFontSize, A1_314) == NIL then
    return _UPVALUE0_.FAILURE, L3_316
  end
  return _UPVALUE0_.SUCCESS, L3_316
end
function advertisementFontColorGet()
  local L0_317, L1_318, L2_319
  L0_317 = getFirstCookie
  L1_318 = ROWID
  L2_319 = loginprofileTable
  L1_318 = L0_317(L1_318, L2_319)
  L2_319 = _UPVALUE0_
  L2_319 = L2_319.SUCCESS
  if L0_317 ~= L2_319 then
    return L0_317
  end
  L2_319 = db
  L2_319 = L2_319.getAttribute
  L2_319 = L2_319(loginprofileTable, ROWID, L1_318, attribute.advertisementFontColor)
  if L2_319 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_318, L2_319
end
function advertisementFontColorGetNext(A0_320)
  local L1_321, L2_322, L3_323, L4_324, L5_325
  L1_321 = NIL
  if A0_320 == L1_321 then
    L1_321 = _UPVALUE0_
    L1_321 = L1_321.INVALID_ARGUMENT
    return L1_321
  end
  L1_321 = cookieValidate
  L2_322 = ROWID
  L3_323 = A0_320
  L4_324 = loginprofileTable
  L2_322 = L1_321(L2_322, L3_323, L4_324)
  L3_323 = _UPVALUE0_
  L3_323 = L3_323.SUCCESS
  if L1_321 ~= L3_323 then
    return L1_321
  end
  L3_323 = getNextValidCookie
  L4_324 = ROWID
  L5_325 = L2_322
  L4_324 = L3_323(L4_324, L5_325, loginprofileTable)
  L5_325 = _UPVALUE0_
  L5_325 = L5_325.SUCCESS
  if L3_323 ~= L5_325 then
    return L3_323
  end
  L5_325 = db
  L5_325 = L5_325.getAttribute
  L5_325 = L5_325(loginprofileTable, ROWID, L4_324, attribute.advertisementFontColor)
  if L5_325 == NIL then
    return _UPVALUE0_.FAILURE, L2_322
  end
  return _UPVALUE0_.SUCCESS, L4_324, L5_325
end
function advertisementFontColorSet(A0_326, A1_327)
  local L2_328, L3_329
  L2_328 = NIL
  if A0_326 == L2_328 then
    L2_328 = _UPVALUE0_
    L2_328 = L2_328.INVALID_ARGUMENT
    return L2_328
  end
  L2_328 = cookieValidate
  L3_329 = ROWID
  L3_329 = L2_328(L3_329, A0_326, loginprofileTable)
  if L2_328 ~= _UPVALUE0_.SUCCESS then
    return L2_328
  end
  if A1_327 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_327) ~= RED_FONT_IDX and tonumber(A1_327) ~= BLACK_FONT_IDX and tonumber(A1_327) ~= GREEN_FONT_IDX and tonumber(A1_327) ~= BLUE_FONT_IDX then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_329, attribute.advertisementFontColor, A1_327) == NIL then
    return _UPVALUE0_.FAILURE, L3_329
  end
  return _UPVALUE0_.SUCCESS, L3_329
end
function isshowFooterEnabled()
  local L0_330, L1_331, L2_332
  L0_330 = getFirstCookie
  L1_331 = ROWID
  L2_332 = loginprofileTable
  L1_331 = L0_330(L1_331, L2_332)
  L2_332 = _UPVALUE0_
  L2_332 = L2_332.SUCCESS
  if L0_330 ~= L2_332 then
    return L0_330
  end
  L2_332 = db
  L2_332 = L2_332.getAttribute
  L2_332 = L2_332(loginprofileTable, ROWID, L1_331, attribute.showFooter)
  if L2_332 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_331, L2_332
end
function isshowFooterEnabledNext(A0_333)
  local L1_334, L2_335, L3_336, L4_337, L5_338
  L1_334 = NIL
  if A0_333 == L1_334 then
    L1_334 = _UPVALUE0_
    L1_334 = L1_334.INVALID_ARGUMENT
    return L1_334
  end
  L1_334 = cookieValidate
  L2_335 = ROWID
  L3_336 = A0_333
  L4_337 = loginprofileTable
  L2_335 = L1_334(L2_335, L3_336, L4_337)
  L3_336 = _UPVALUE0_
  L3_336 = L3_336.SUCCESS
  if L1_334 ~= L3_336 then
    return L1_334
  end
  L3_336 = getNextValidCookie
  L4_337 = ROWID
  L5_338 = L2_335
  L4_337 = L3_336(L4_337, L5_338, loginprofileTable)
  L5_338 = _UPVALUE0_
  L5_338 = L5_338.SUCCESS
  if L3_336 ~= L5_338 then
    return L3_336
  end
  L5_338 = db
  L5_338 = L5_338.getAttribute
  L5_338 = L5_338(loginprofileTable, ROWID, L4_337, attribute.showFooter)
  if L5_338 == NIL then
    return _UPVALUE0_.FAILURE, L2_335
  end
  return _UPVALUE0_.SUCCESS, L4_337, L5_338
end
function showFooterEnable(A0_339)
  local L1_340, L2_341
  L1_340 = NIL
  if A0_339 == L1_340 then
    L1_340 = _UPVALUE0_
    L1_340 = L1_340.INVALID_ARGUMENT
    return L1_340
  end
  L1_340 = cookieValidate
  L2_341 = ROWID
  L2_341 = L1_340(L2_341, A0_339, loginprofileTable)
  if L1_340 ~= _UPVALUE0_.SUCCESS then
    return L1_340
  end
  if db.setAttribute(loginprofileTable, ROWID, L2_341, attribute.showFooter, ENABLE) == NIL then
    return _UPVALUE0_.FAILURE, L2_341
  end
  return _UPVALUE0_.SUCCESS, L2_341
end
function showFooterDisable(A0_342)
  local L1_343, L2_344
  L1_343 = NIL
  if A0_342 == L1_343 then
    L1_343 = _UPVALUE0_
    L1_343 = L1_343.INVALID_ARGUMENT
    return L1_343
  end
  L1_343 = cookieValidate
  L2_344 = ROWID
  L2_344 = L1_343(L2_344, A0_342, loginprofileTable)
  if L1_343 ~= _UPVALUE0_.SUCCESS then
    return L1_343
  end
  if db.setAttribute(loginprofileTable, ROWID, L2_344, attribute.showFooter, DISABLE) == NIL then
    return _UPVALUE0_.FAILURE, L2_344
  end
  return _UPVALUE0_.SUCCESS, L2_344
end
function footerContentGet()
  local L0_345, L1_346, L2_347
  L0_345 = getFirstCookie
  L1_346 = ROWID
  L2_347 = loginprofileTable
  L1_346 = L0_345(L1_346, L2_347)
  L2_347 = _UPVALUE0_
  L2_347 = L2_347.SUCCESS
  if L0_345 ~= L2_347 then
    return L0_345
  end
  L2_347 = db
  L2_347 = L2_347.getAttribute
  L2_347 = L2_347(loginprofileTable, ROWID, L1_346, attribute.footerContent)
  if L2_347 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_346, L2_347
end
function footerContentGetNext(A0_348)
  local L1_349, L2_350, L3_351, L4_352, L5_353
  L1_349 = NIL
  if A0_348 == L1_349 then
    L1_349 = _UPVALUE0_
    L1_349 = L1_349.INVALID_ARGUMENT
    return L1_349
  end
  L1_349 = cookieValidate
  L2_350 = ROWID
  L3_351 = A0_348
  L4_352 = loginprofileTable
  L2_350 = L1_349(L2_350, L3_351, L4_352)
  L3_351 = _UPVALUE0_
  L3_351 = L3_351.SUCCESS
  if L1_349 ~= L3_351 then
    return L1_349
  end
  L3_351 = getNextValidCookie
  L4_352 = ROWID
  L5_353 = L2_350
  L4_352 = L3_351(L4_352, L5_353, loginprofileTable)
  L5_353 = _UPVALUE0_
  L5_353 = L5_353.SUCCESS
  if L3_351 ~= L5_353 then
    return L3_351
  end
  L5_353 = db
  L5_353 = L5_353.getAttribute
  L5_353 = L5_353(loginprofileTable, ROWID, L4_352, attribute.footerContent)
  if L5_353 == NIL then
    return _UPVALUE0_.FAILURE, L2_350
  end
  return _UPVALUE0_.SUCCESS, L4_352, L5_353
end
function footerContentSet(A0_354, A1_355)
  local L2_356, L3_357
  L2_356 = NIL
  if A0_354 == L2_356 then
    L2_356 = _UPVALUE0_
    L2_356 = L2_356.INVALID_ARGUMENT
    return L2_356
  end
  L2_356 = cookieValidate
  L3_357 = ROWID
  L3_357 = L2_356(L3_357, A0_354, loginprofileTable)
  if L2_356 ~= _UPVALUE0_.SUCCESS then
    return L2_356
  end
  if A1_355 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_355) > MAXLEN_FOOTER or string.len(A1_355) < MINLEN_FOOTER then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_357, attribute.footerContent, A1_355) == NIL then
    return _UPVALUE0_.FAILURE, L3_357
  end
  return _UPVALUE0_.SUCCESS, L3_357
end
function footerFontColorGet()
  local L0_358, L1_359, L2_360
  L0_358 = getFirstCookie
  L1_359 = ROWID
  L2_360 = loginprofileTable
  L1_359 = L0_358(L1_359, L2_360)
  L2_360 = _UPVALUE0_
  L2_360 = L2_360.SUCCESS
  if L0_358 ~= L2_360 then
    return L0_358
  end
  L2_360 = db
  L2_360 = L2_360.getAttribute
  L2_360 = L2_360(loginprofileTable, ROWID, L1_359, attribute.footerFontColor)
  if L2_360 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_359, L2_360
end
function footerFontColorGetNext(A0_361)
  local L1_362, L2_363, L3_364, L4_365, L5_366
  L1_362 = NIL
  if A0_361 == L1_362 then
    L1_362 = _UPVALUE0_
    L1_362 = L1_362.INVALID_ARGUMENT
    return L1_362
  end
  L1_362 = cookieValidate
  L2_363 = ROWID
  L3_364 = A0_361
  L4_365 = loginprofileTable
  L2_363 = L1_362(L2_363, L3_364, L4_365)
  L3_364 = _UPVALUE0_
  L3_364 = L3_364.SUCCESS
  if L1_362 ~= L3_364 then
    return L1_362
  end
  L3_364 = getNextValidCookie
  L4_365 = ROWID
  L5_366 = L2_363
  L4_365 = L3_364(L4_365, L5_366, loginprofileTable)
  L5_366 = _UPVALUE0_
  L5_366 = L5_366.SUCCESS
  if L3_364 ~= L5_366 then
    return L3_364
  end
  L5_366 = db
  L5_366 = L5_366.getAttribute
  L5_366 = L5_366(loginprofileTable, ROWID, L4_365, attribute.footerFontColor)
  if L5_366 == NIL then
    return _UPVALUE0_.FAILURE, L2_363
  end
  return _UPVALUE0_.SUCCESS, L4_365, L5_366
end
function footerFontColorSet(A0_367, A1_368)
  local L2_369, L3_370
  L2_369 = NIL
  if A0_367 == L2_369 then
    L2_369 = _UPVALUE0_
    L2_369 = L2_369.INVALID_ARGUMENT
    return L2_369
  end
  L2_369 = cookieValidate
  L3_370 = ROWID
  L3_370 = L2_369(L3_370, A0_367, loginprofileTable)
  if L2_369 ~= _UPVALUE0_.SUCCESS then
    return L2_369
  end
  if A1_368 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_368) ~= WHITE and tonumber(A1_368) ~= RED and tonumber(A1_368) ~= GREEN and tonumber(A1_368) ~= BLUE and tonumber(A1_368) ~= BLACK then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_370, attribute.footerFontColor, A1_368) == NIL then
    return _UPVALUE0_.FAILURE, L3_370
  end
  return _UPVALUE0_.SUCCESS, L3_370
end
function loginProfileGet()
  local L0_371, L1_372
  L0_371 = getFirstCookie
  L1_372 = ROWID
  L1_372 = L0_371(L1_372, loginprofileTable)
  if L0_371 ~= _UPVALUE0_.SUCCESS then
    return L0_371
  end
  if db.getRow(loginprofileTable, ROWID, L1_372) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_372, db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.profileId], db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.profileName], db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.pageTitle], db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.pageBackgroundType], db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.pageBackgroundImgIndex], db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.pageBackgroundColor], db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.pageCustomColor], db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.headerBackgroundType], db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.headerBackgroundImgIndex], db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.headerBackgroundColor], db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.headerBackgroundCustomColor], db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.headerCaptionFontFace], db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.headerCaptionFontSize], db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.headerCaption], db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.headerCaptionFontColor], db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.loginSectionTitle], db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.errorMessage], db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.messagesFontColor], db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.showAdvertisement], db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.advertisementContent], db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.advertisementAlignment], db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.advertisementFontType], db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.advertisementFontSize], db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.advertisementFontColor], db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.showFooter], db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.footerContent], db.getRow(loginprofileTable, ROWID, L1_372)[loginprofileTable .. "." .. attribute.footerFontColor]
end
function loginProfileGetNext(A0_373)
  local L1_374, L2_375, L3_376, L4_377
  L1_374 = NIL
  if A0_373 == L1_374 then
    L1_374 = _UPVALUE0_
    L1_374 = L1_374.INVALID_ARGUMENT
    return L1_374
  end
  L1_374 = cookieValidate
  L2_375 = ROWID
  L3_376 = A0_373
  L4_377 = loginprofileTable
  L2_375 = L1_374(L2_375, L3_376, L4_377)
  L3_376 = _UPVALUE0_
  L3_376 = L3_376.SUCCESS
  if L1_374 ~= L3_376 then
    return L1_374
  end
  L3_376 = getNextValidCookie
  L4_377 = ROWID
  L4_377 = L3_376(L4_377, L2_375, loginprofileTable)
  if L3_376 ~= _UPVALUE0_.SUCCESS then
    return L3_376
  end
  if db.getRow(loginprofileTable, ROWID, L4_377) == NIL then
    return _UPVALUE0_.FAILURE, L2_375
  end
  return _UPVALUE0_.SUCCESS, L4_377, db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.profileId], db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.profileName], db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.pageTitle], db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.pageBackgroundType], db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.pageBackgroundImgIndex], db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.pageBackgroundColor], db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.pageCustomColor], db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.headerBackgroundType], db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.headerBackgroundImgIndex], db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.headerBackgroundColor], db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.headerBackgroundCustomColor], db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.headerCaptionFontFace], db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.headerCaptionFontSize], db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.headerCaption], db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.headerCaptionFontColor], db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.loginSectionTitle], db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.errorMessage], db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.messagesFontColor], db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.showAdvertisement], db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.advertisementContent], db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.advertisementAlignment], db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.advertisementFontType], db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.advertisementFontSize], db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.advertisementFontColor], db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.showFooter], db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.footerContent], db.getRow(loginprofileTable, ROWID, L4_377)[loginprofileTable .. "." .. attribute.footerFontColor]
end
function loginProfileSet(A0_378, A1_379, A2_380, A3_381, A4_382, A5_383, A6_384, A7_385, A8_386, A9_387, A10_388, A11_389, A12_390, A13_391, A14_392, A15_393, A16_394, A17_395, A18_396, A19_397, A20_398, A21_399, A22_400, A23_401, A24_402, A25_403, A26_404, A27_405, A28_406)
  local L29_407, L30_408, L31_409, L32_410, L33_411, L34_412, L35_413, L36_414, L37_415
  L29_407 = NIL
  if A0_378 == L29_407 then
    L29_407 = _UPVALUE0_
    L29_407 = L29_407.INVALID_ARGUMENT
    return L29_407
  end
  L29_407 = cookieValidate
  L30_408 = ROWID
  L31_409 = A0_378
  L32_410 = loginprofileTable
  L30_408 = L29_407(L30_408, L31_409, L32_410)
  L31_409 = _UPVALUE0_
  L31_409 = L31_409.SUCCESS
  if L29_407 ~= L31_409 then
    return L29_407
  end
  L31_409 = NIL
  if A2_380 == L31_409 or A2_380 == "" then
    L31_409 = _UPVALUE1_
    L31_409 = L31_409.LOGIN_PROFILE_NAME_NIL
    return L31_409
  end
  L31_409 = string
  L31_409 = L31_409.len
  L32_410 = A2_380
  L31_409 = L31_409(L32_410)
  L32_410 = MAXLEN_PROFILE
  if not (L31_409 > L32_410) then
    L32_410 = MINLEN_PROFILE
  elseif L31_409 < L32_410 then
    L32_410 = _UPVALUE1_
    L32_410 = L32_410.LOGIN_PROFILE_NAME_INVALID
    return L32_410
  end
  L32_410 = NIL
  if A3_381 == L32_410 or A3_381 == "" then
    L32_410 = _UPVALUE1_
    L32_410 = L32_410.LOGIN_PROFILE_TITLE_NIL
    return L32_410
  end
  L32_410 = string
  L32_410 = L32_410.len
  L33_411 = A3_381
  L32_410 = L32_410(L33_411)
  L33_411 = MAXLEN_TITLE
  if not (L32_410 > L33_411) then
    L33_411 = MINLEN_TITLE
  elseif L32_410 < L33_411 then
    L33_411 = _UPVALUE1_
    L33_411 = L33_411.LOGIN_PROFILE_TITLE_INVALID
    return L33_411
  end
  L33_411 = NIL
  if A4_382 == L33_411 or A4_382 == "" then
    L33_411 = _UPVALUE1_
    L33_411 = L33_411.LOGIN_PROFILE_PAGE_BACKGROUND_NIL
    return L33_411
  end
  if A6_384 == "" then
    L33_411 = _UPVALUE1_
    L33_411 = L33_411.LOGIN_PROFILE_PAGE_BACKGROUND_COLOR_NIL
    return L33_411
  end
  L33_411 = NIL
  if A6_384 ~= L33_411 and A6_384 ~= "" then
    L33_411 = tonumber
    L34_412 = A6_384
    L33_411 = L33_411(L34_412)
    L34_412 = MIN_COLOR_INDEX
    if not (L33_411 < L34_412) then
      L34_412 = MAX_COLOR_INDEX
    elseif L33_411 > L34_412 then
      L34_412 = _UPVALUE1_
      L34_412 = L34_412.LOGIN_PROFILE_PAGE_BACKGROUND_COLOR_INVALID
      return L34_412
    end
  end
  L33_411 = NIL
  if A7_385 ~= L33_411 and A7_385 ~= "" then
    L33_411 = string
    L33_411 = L33_411.len
    L34_412 = A7_385
    L33_411 = L33_411(L34_412)
    L34_412 = MAXLEN_CUSTOM_COLOR
    if not (L33_411 > L34_412) then
      L34_412 = MINLEN_CUSTOM_COLOR
    elseif L33_411 < L34_412 then
      L34_412 = _UPVALUE1_
      L34_412 = L34_412.LOGIN_PROFILE_CUSTOM_COLOR_NIL
      return L34_412
    end
  end
  L33_411 = NIL
  if A8_386 == L33_411 or A8_386 == "" then
    L33_411 = _UPVALUE1_
    L33_411 = L33_411.LOGIN_PROFILE_HEADER_BACKGROUND_NIL
    return L33_411
  end
  L33_411 = tonumber
  L34_412 = A8_386
  L33_411 = L33_411(L34_412)
  L34_412 = IMAGE
  if L33_411 ~= L34_412 then
    L34_412 = COLOR
    if L33_411 ~= L34_412 then
      L34_412 = _UPVALUE1_
      L34_412 = L34_412.LOGIN_PROFILE_HEADER_BACKGROUND_TYPE_INVALID
      return L34_412
    end
  end
  if A9_387 == "" and A10_388 == "" then
    L34_412 = _UPVALUE1_
    L34_412 = L34_412.LOGIN_PROFILE_HEADER_BACKGROUND_TYPE_INVALID
    return L34_412
  end
  L34_412 = NIL
  if A9_387 ~= L34_412 and A9_387 ~= "" then
    L34_412 = tonumber
    L35_413 = A9_387
    L34_412 = L34_412(L35_413)
    L35_413 = HEADER_MIN_INDEX
    if not (L34_412 < L35_413) then
      L35_413 = HEADER_MAX_INDEX
    elseif L34_412 > L35_413 then
      L35_413 = _UPVALUE1_
      L35_413 = L35_413.LOGIN_PROFILE_HEADER_BACKGROUND_IMAGE_INDEX_INVALID
      return L35_413
    end
  end
  L34_412 = NIL
  if A10_388 ~= L34_412 and A10_388 ~= "" then
    L34_412 = tonumber
    L35_413 = A10_388
    L34_412 = L34_412(L35_413)
    L35_413 = WHITE
    if L34_412 ~= L35_413 then
      L35_413 = RED
      if L34_412 ~= L35_413 then
        L35_413 = GREEN
        if L34_412 ~= L35_413 then
          L35_413 = BLUE
          if L34_412 ~= L35_413 then
            L35_413 = CUSTOM
            if L34_412 ~= L35_413 then
              L35_413 = _UPVALUE1_
              L35_413 = L35_413.LOGIN_PROFILE_HEADER_BACKGROUND_COLOR_INVALID
              return L35_413
            end
          end
        end
      end
    end
  end
  L34_412 = NIL
  if A11_389 ~= L34_412 and A11_389 ~= "" then
    L34_412 = string
    L34_412 = L34_412.len
    L35_413 = A11_389
    L34_412 = L34_412(L35_413)
    L35_413 = MAXLEN_CUSTOM_COLOR
    if not (L34_412 > L35_413) then
      L35_413 = MINLEN_CUSTOM_COLOR
    elseif L34_412 < L35_413 then
      L35_413 = _UPVALUE1_
      L35_413 = L35_413.LOGIN_PROFILE_HEADER_CUSTOM_COLOR_INVALID
      return L35_413
    end
  end
  L34_412 = NIL
  if A12_390 == L34_412 or A12_390 == "" then
    L34_412 = _UPVALUE1_
    L34_412 = L34_412.LOGIN_PROFILE_HEADER_FONT_NIL
    return L34_412
  end
  L34_412 = tonumber
  L35_413 = A12_390
  L34_412 = L34_412(L35_413)
  L35_413 = MIN_FONT_INDEX
  if not (L34_412 < L35_413) then
    L35_413 = MAX_FONT_INDEX
  elseif L34_412 > L35_413 then
    L35_413 = _UPVALUE1_
    L35_413 = L35_413.LOGIN_PROFILE_HEADER_FONT_INVALID
    return L35_413
  end
  L35_413 = NIL
  if A13_391 == L35_413 or A13_391 == "" then
    L35_413 = _UPVALUE1_
    L35_413 = L35_413.LOGIN_PROFILE_HEADER_FONTSIZE_NIL
    return L35_413
  end
  L35_413 = tonumber
  L36_414 = A13_391
  L35_413 = L35_413(L36_414)
  L36_414 = MIN_FONTSIZE
  if not (L35_413 < L36_414) then
    L36_414 = MAX_FONTSIZE
  elseif L35_413 > L36_414 then
    L36_414 = _UPVALUE1_
    L36_414 = L36_414.LOGIN_PROFILE_HEADER_FONTSIZE_INVALID
    return L36_414
  end
  L36_414 = NIL
  if A14_392 == L36_414 then
    L36_414 = _UPVALUE1_
    L36_414 = L36_414.LOGIN_PROFILE_HEADER_CAPTION_NIL
    return L36_414
  end
  if A14_392 ~= "" then
    L36_414 = string
    L36_414 = L36_414.len
    L37_415 = A14_392
    L36_414 = L36_414(L37_415)
    L37_415 = MAXLEN_HEADER
    if not (L36_414 > L37_415) then
      L37_415 = MINLEN_HEADER
    elseif L36_414 < L37_415 then
      L37_415 = _UPVALUE1_
      L37_415 = L37_415.LOGIN_PROFILE_HEADER_CAPTION_INVALID
      return L37_415
    end
  end
  L36_414 = NIL
  if A15_393 == L36_414 or A15_393 == "" then
    L36_414 = _UPVALUE1_
    L36_414 = L36_414.LOGIN_PROFILE_HEADER_FONT_COLOR_NIL
    return L36_414
  end
  L36_414 = tonumber
  L37_415 = A15_393
  L36_414 = L36_414(L37_415)
  L37_415 = MIN_COLOR_IDX
  if not (L36_414 < L37_415) then
    L37_415 = MAX_COLOR_IDX
  elseif L36_414 > L37_415 then
    L37_415 = _UPVALUE1_
    L37_415 = L37_415.LOGIN_PROFILE_HEADER_FONT_COLOR_INVALID
    return L37_415
  end
  L37_415 = NIL
  if A16_394 == L37_415 then
    L37_415 = _UPVALUE1_
    L37_415 = L37_415.LOGIN_PROFILE_TITLE_NIL
    return L37_415
  end
  if A16_394 ~= "" then
    L37_415 = string
    L37_415 = L37_415.len
    L37_415 = L37_415(A16_394)
    if L37_415 > MAXLEN_TITLE or L37_415 < MINLEN_TITLE then
      return _UPVALUE1_.LOGIN_PROFILE_TITLE_INVALID
    end
  end
  L37_415 = NIL
  if A17_395 == L37_415 then
    L37_415 = _UPVALUE1_
    L37_415 = L37_415.LOGIN_PROFILE_WELCOME_MSG_NIL
    return L37_415
  end
  if A17_395 ~= "" then
    L37_415 = string
    L37_415 = L37_415.len
    L37_415 = L37_415(A17_395)
    if L37_415 > MAXLEN_MSG or L37_415 < MINLEN_MSG then
      return _UPVALUE1_.LOGIN_PROFILE_WELCOME_MSG_INVALID
    end
  end
  L37_415 = NIL
  if A18_396 == L37_415 then
    L37_415 = _UPVALUE1_
    L37_415 = L37_415.LOGIN_PROFILE_ERROR_MSG_NIL
    return L37_415
  end
  if A18_396 ~= "" then
    L37_415 = string
    L37_415 = L37_415.len
    L37_415 = L37_415(A18_396)
    if L37_415 > MAXLEN_MSG or L37_415 < MINLEN_MSG then
      return _UPVALUE1_.LOGIN_PROFILE_ERROR_MSG_INVALID
    end
  end
  L37_415 = NIL
  if A20_398 ~= L37_415 and A20_398 ~= "" then
    L37_415 = _UPVALUE2_
    L37_415 = L37_415.isBoolean
    L37_415 = L37_415(A20_398)
    valid = L37_415
    L37_415 = valid
    if L37_415 ~= _UPVALUE0_.SUCCESS then
      L37_415 = _UPVALUE1_
      L37_415 = L37_415.LOGIN_PROFILE_ADVT_INVALID
      return L37_415
    end
    L37_415 = tonumber
    L37_415 = L37_415(A20_398)
    if L37_415 == 1 then
      L37_415 = NIL
      if A21_399 == L37_415 then
        L37_415 = _UPVALUE1_
        L37_415 = L37_415.LOGIN_PROFILE_ADVT_CONTENT_NIL
        return L37_415
      end
      L37_415 = string
      L37_415 = L37_415.len
      L37_415 = L37_415(A21_399)
      if L37_415 > MAXLEN_ADVT or L37_415 < MINLEN_ADVT then
        return _UPVALUE1_.LOGIN_PROFILE_ADVT_CONTENT_INVALID
      end
      if A22_400 == NIL then
        return _UPVALUE1_.LOGIN_PROFILE_ADVT_ALIGN_NIL
      end
      if tonumber(A22_400) ~= RIGHT and tonumber(A22_400) ~= LEFT then
        return _UPVALUE1_.LOGIN_PROFILE_ADVT_ALIGN_INVALID
      end
      if A23_401 == NIL then
        return _UPVALUE1_.LOGIN_PROFILE_ADVT_FONT_NIL
      end
      if tonumber(A23_401) ~= TAHOMA and tonumber(A23_401) ~= TIMES_NEW_ROMAN and tonumber(A23_401) ~= VERDANA and tonumber(A23_401) ~= ARIAL then
        return _UPVALUE1_.LOGIN_PROFILE_ADVT_FONT_TYPE_INVALID
      end
      if A24_402 == NIL then
        return _UPVALUE1_.LOGIN_PROFILE_ADVT_FONTSIZE_NIL
      end
      if tonumber(A24_402) ~= SMALL and tonumber(A24_402) ~= MEDIUM and tonumber(A24_402) ~= BIG then
        return _UPVALUE1_.LOGIN_PROFILE_ADVT_FONTSIZE_INVALID
      end
      if A25_403 == NIL then
        return _UPVALUE1_.LOGIN_PROFILE_ADVT_FONT_COLOR_NIL
      end
      if tonumber(A25_403) ~= RED_FONT_IDX and tonumber(A25_403) ~= BLACK_FONT_IDX and tonumber(A25_403) ~= GREEN_FONT_IDX and tonumber(A25_403) ~= BLUE_FONT_IDX then
        return _UPVALUE1_.LOGIN_PROFILE_ADVT_FONT_COLOR_INVALID
      end
    end
  end
  L37_415 = NIL
  if A26_404 == L37_415 or A26_404 == "" then
    L37_415 = _UPVALUE1_
    L37_415 = L37_415.LOGIN_PROFILE_SHOW_FOOTER_NIL
    return L37_415
  end
  L37_415 = _UPVALUE2_
  L37_415 = L37_415.isBoolean
  L37_415 = L37_415(A26_404)
  valid = L37_415
  L37_415 = valid
  if L37_415 ~= _UPVALUE0_.SUCCESS then
    L37_415 = _UPVALUE1_
    L37_415 = L37_415.LOGIN_PROFILE_SHOW_FOOTER_INVALID
    return L37_415
  end
  L37_415 = ENABLE
  if A26_404 == L37_415 then
    L37_415 = NIL
    if A27_405 == L37_415 or A27_405 == "" then
      L37_415 = _UPVALUE1_
      L37_415 = L37_415.LOGIN_PROFILE_FOOTER_CONTENT_NIL
      return L37_415
    end
    L37_415 = string
    L37_415 = L37_415.len
    L37_415 = L37_415(A27_405)
    if L37_415 > MAXLEN_FOOTER or L37_415 < MINLEN_FOOTER then
      return _UPVALUE1_.LOGIN_PROFILE_FOOTER_CONTENT_INVALID
    end
    if A28_406 == NIL or A28_406 == "" then
      return _UPVALUE1_.LOGIN_PROFILE_FOOTER_FONT_COLOR_NIL
    end
    if tonumber(A28_406) ~= WHITE and tonumber(A28_406) ~= RED and tonumber(A28_406) ~= GREEN and tonumber(A28_406) ~= BLUE and tonumber(A28_406) ~= BLACK then
      return _UPVALUE1_.LOGIN_PROFILE_FOOTER_FONT_COLOR_INVALID
    end
  end
  L37_415 = {}
  L37_415[loginprofileTable .. "." .. attribute.profileName] = A2_380
  L37_415[loginprofileTable .. "." .. attribute.pageTitle] = A3_381
  L37_415[loginprofileTable .. "." .. attribute.pageBackgroundColor] = A6_384
  L37_415[loginprofileTable .. "." .. attribute.pageCustomColor] = A7_385
  L37_415[loginprofileTable .. "." .. attribute.pageBackgroundType] = A4_382
  L37_415[loginprofileTable .. "." .. attribute.pageBackgroundImgIndex] = A5_383
  L37_415[loginprofileTable .. "." .. attribute.headerBackgroundType] = A8_386
  L37_415[loginprofileTable .. "." .. attribute.headerBackgroundImgIndex] = A9_387
  L37_415[loginprofileTable .. "." .. attribute.headerBackgroundColor] = A10_388
  L37_415[loginprofileTable .. "." .. attribute.headerBackgroundCustomColor] = A11_389
  L37_415[loginprofileTable .. "." .. attribute.headerCaptionFontFace] = A12_390
  L37_415[loginprofileTable .. "." .. attribute.headerCaptionFontSize] = A13_391
  L37_415[loginprofileTable .. "." .. attribute.headerCaption] = A14_392
  L37_415[loginprofileTable .. "." .. attribute.headerCaptionFontColor] = A15_393
  L37_415[loginprofileTable .. "." .. attribute.loginSectionTitle] = A16_394
  L37_415[loginprofileTable .. "." .. attribute.welcomeMessage] = A17_395
  L37_415[loginprofileTable .. "." .. attribute.errorMessage] = A18_396
  L37_415[loginprofileTable .. "." .. attribute.messagesFontColor] = A19_397
  L37_415[loginprofileTable .. "." .. attribute.showAdvertisement] = A20_398
  L37_415[loginprofileTable .. "." .. attribute.advertisementContent] = A21_399
  L37_415[loginprofileTable .. "." .. attribute.advertisementAlignment] = A22_400
  L37_415[loginprofileTable .. "." .. attribute.advertisementFontType] = A23_401
  L37_415[loginprofileTable .. "." .. attribute.advertisementFontSize] = A24_402
  L37_415[loginprofileTable .. "." .. attribute.advertisementFontColor] = A25_403
  L37_415[loginprofileTable .. "." .. attribute.showFooter] = A26_404
  L37_415[loginprofileTable .. "." .. attribute.footerContent] = A27_405
  L37_415[loginprofileTable .. "." .. attribute.footerFontColor] = A28_406
  if db.update(loginprofileTable, L37_415, L30_408) == NIL then
    return _UPVALUE0_.FAILURE, L30_408
  end
  return _UPVALUE0_.SUCCESS, L30_408
end
function loginProfileCreate(A0_416, A1_417, A2_418, A3_419, A4_420, A5_421, A6_422, A7_423, A8_424, A9_425, A10_426, A11_427, A12_428, A13_429, A14_430, A15_431, A16_432, A17_433, A18_434, A19_435, A20_436, A21_437, A22_438, A23_439, A24_440, A25_441, A26_442, A27_443)
  local L28_444, L29_445, L30_446, L31_447, L32_448, L33_449, L34_450, L35_451, L36_452
  L28_444 = NIL
  if A1_417 == L28_444 or A1_417 == "" then
    L28_444 = _UPVALUE0_
    L28_444 = L28_444.LOGIN_PROFILE_NAME_NIL
    return L28_444
  end
  L28_444 = string
  L28_444 = L28_444.len
  L29_445 = A1_417
  L28_444 = L28_444(L29_445)
  L29_445 = MAXLEN_PROFILE
  if not (L28_444 > L29_445) then
    L29_445 = MINLEN_PROFILE
  elseif L28_444 < L29_445 then
    L29_445 = _UPVALUE0_
    L29_445 = L29_445.LOGIN_PROFILE_NAME_INVALID
    return L29_445
  end
  L29_445 = NIL
  if A2_418 == L29_445 or A2_418 == "" then
    L29_445 = _UPVALUE0_
    L29_445 = L29_445.LOGIN_PROFILE_TITLE_NIL
    return L29_445
  end
  L29_445 = string
  L29_445 = L29_445.len
  L30_446 = A2_418
  L29_445 = L29_445(L30_446)
  L30_446 = MAXLEN_TITLE
  if not (L29_445 > L30_446) then
    L30_446 = MINLEN_TITLE
  elseif L29_445 < L30_446 then
    L30_446 = _UPVALUE0_
    L30_446 = L30_446.LOGIN_PROFILE_TITLE_INVALID
    return L30_446
  end
  L30_446 = NIL
  if A3_419 == L30_446 or A3_419 == "" then
    L30_446 = _UPVALUE0_
    L30_446 = L30_446.LOGIN_PROFILE_PAGE_BACKGROUND_NIL
    return L30_446
  end
  if A5_421 == "" then
    L30_446 = _UPVALUE0_
    L30_446 = L30_446.LOGIN_PROFILE_PAGE_BACKGROUND_COLOR_NIL
    return L30_446
  end
  L30_446 = NIL
  if A5_421 ~= L30_446 and A5_421 ~= "" then
    L30_446 = tonumber
    L31_447 = A5_421
    L30_446 = L30_446(L31_447)
    L31_447 = MIN_COLOR_INDEX
    if not (L30_446 < L31_447) then
      L31_447 = MAX_COLOR_INDEX
    elseif L30_446 > L31_447 then
      L31_447 = _UPVALUE0_
      L31_447 = L31_447.LOGIN_PROFILE_PAGE_BACKGROUND_COLOR_INVALID
      return L31_447
    end
  end
  L30_446 = NIL
  if A6_422 ~= L30_446 and A6_422 ~= "" then
    L30_446 = string
    L30_446 = L30_446.len
    L31_447 = A6_422
    L30_446 = L30_446(L31_447)
    L31_447 = MAXLEN_CUSTOM_COLOR
    if not (L30_446 > L31_447) then
      L31_447 = MINLEN_CUSTOM_COLOR
    elseif L30_446 < L31_447 then
      L31_447 = _UPVALUE0_
      L31_447 = L31_447.LOGIN_PROFILE_CUSTOM_COLOR_NIL
      return L31_447
    end
  end
  L30_446 = NIL
  if A7_423 == L30_446 or A7_423 == "" then
    L30_446 = _UPVALUE0_
    L30_446 = L30_446.LOGIN_PROFILE_HEADER_BACKGROUND_NIL
    return L30_446
  end
  L30_446 = tonumber
  L31_447 = A7_423
  L30_446 = L30_446(L31_447)
  L31_447 = IMAGE
  if L30_446 ~= L31_447 then
    L31_447 = COLOR
    if L30_446 ~= L31_447 then
      L31_447 = _UPVALUE0_
      L31_447 = L31_447.LOGIN_PROFILE_HEADER_BACKGROUND_TYPE_INVALID
      return L31_447
    end
  end
  if A8_424 == "" and A9_425 == "" then
    L31_447 = _UPVALUE0_
    L31_447 = L31_447.LOGIN_PROFILE_HEADER_BACKGROUND_TYPE_INVALID
    return L31_447
  end
  L31_447 = NIL
  if A8_424 ~= L31_447 and A8_424 ~= "" then
    L31_447 = tonumber
    L32_448 = A8_424
    L31_447 = L31_447(L32_448)
    L32_448 = HEADER_MIN_INDEX
    if not (L31_447 < L32_448) then
      L32_448 = HEADER_MAX_INDEX
    elseif L31_447 > L32_448 then
      L32_448 = _UPVALUE0_
      L32_448 = L32_448.LOGIN_PROFILE_HEADER_BACKGROUND_IMAGE_INDEX_INVALID
      return L32_448
    end
  end
  L31_447 = NIL
  if A9_425 ~= L31_447 and A9_425 ~= "" then
    L31_447 = tonumber
    L32_448 = A9_425
    L31_447 = L31_447(L32_448)
    L32_448 = WHITE
    if L31_447 ~= L32_448 then
      L32_448 = RED
      if L31_447 ~= L32_448 then
        L32_448 = GREEN
        if L31_447 ~= L32_448 then
          L32_448 = BLUE
          if L31_447 ~= L32_448 then
            L32_448 = CUSTOM
            if L31_447 ~= L32_448 then
              L32_448 = _UPVALUE0_
              L32_448 = L32_448.LOGIN_PROFILE_HEADER_BACKGROUND_COLOR_INVALID
              return L32_448
            end
          end
        end
      end
    end
  end
  L31_447 = NIL
  if A10_426 ~= L31_447 and A10_426 ~= "" then
    L31_447 = string
    L31_447 = L31_447.len
    L32_448 = A10_426
    L31_447 = L31_447(L32_448)
    L32_448 = MAXLEN_CUSTOM_COLOR
    if not (L31_447 > L32_448) then
      L32_448 = MINLEN_CUSTOM_COLOR
    elseif L31_447 < L32_448 then
      L32_448 = _UPVALUE0_
      L32_448 = L32_448.LOGIN_PROFILE_HEADER_CUSTOM_COLOR_INVALID
      return L32_448
    end
  end
  L31_447 = NIL
  if A11_427 == L31_447 or A11_427 == "" then
    L31_447 = _UPVALUE0_
    L31_447 = L31_447.LOGIN_PROFILE_HEADER_FONT_NIL
    return L31_447
  end
  L31_447 = tonumber
  L32_448 = A11_427
  L31_447 = L31_447(L32_448)
  L32_448 = MIN_FONT_INDEX
  if not (L31_447 < L32_448) then
    L32_448 = MAX_FONT_INDEX
  elseif L31_447 > L32_448 then
    L32_448 = _UPVALUE0_
    L32_448 = L32_448.LOGIN_PROFILE_HEADER_FONT_INVALID
    return L32_448
  end
  L32_448 = NIL
  if A12_428 == L32_448 or A12_428 == "" then
    L32_448 = _UPVALUE0_
    L32_448 = L32_448.LOGIN_PROFILE_HEADER_FONTSIZE_NIL
    return L32_448
  end
  L32_448 = tonumber
  L33_449 = A12_428
  L32_448 = L32_448(L33_449)
  L33_449 = MIN_FONTSIZE
  if not (L32_448 < L33_449) then
    L33_449 = MAX_FONTSIZE
  elseif L32_448 > L33_449 then
    L33_449 = _UPVALUE0_
    L33_449 = L33_449.LOGIN_PROFILE_HEADER_FONTSIZE_INVALID
    return L33_449
  end
  L33_449 = NIL
  if A13_429 == L33_449 then
    L33_449 = _UPVALUE0_
    L33_449 = L33_449.LOGIN_PROFILE_HEADER_CAPTION_NIL
    return L33_449
  end
  if A13_429 ~= "" then
    L33_449 = string
    L33_449 = L33_449.len
    L34_450 = A13_429
    L33_449 = L33_449(L34_450)
    L34_450 = MAXLEN_HEADER
    if not (L33_449 > L34_450) then
      L34_450 = MINLEN_HEADER
    elseif L33_449 < L34_450 then
      L34_450 = _UPVALUE0_
      L34_450 = L34_450.LOGIN_PROFILE_HEADER_CAPTION_INVALID
      return L34_450
    end
  end
  L33_449 = NIL
  if A14_430 == L33_449 or A14_430 == "" then
    L33_449 = _UPVALUE0_
    L33_449 = L33_449.LOGIN_PROFILE_HEADER_FONT_COLOR_NIL
    return L33_449
  end
  L33_449 = tonumber
  L34_450 = A14_430
  L33_449 = L33_449(L34_450)
  L34_450 = MIN_COLOR_IDX
  if not (L33_449 < L34_450) then
    L34_450 = MAX_COLOR_IDX
  elseif L33_449 > L34_450 then
    L34_450 = _UPVALUE0_
    L34_450 = L34_450.LOGIN_PROFILE_HEADER_FONT_COLOR_INVALID
    return L34_450
  end
  L34_450 = NIL
  if A15_431 == L34_450 then
    L34_450 = _UPVALUE0_
    L34_450 = L34_450.LOGIN_PROFILE_TITLE_NIL
    return L34_450
  end
  if A15_431 ~= "" then
    L34_450 = string
    L34_450 = L34_450.len
    L35_451 = A15_431
    L34_450 = L34_450(L35_451)
    L35_451 = MAXLEN_TITLE
    if not (L34_450 > L35_451) then
      L35_451 = MINLEN_TITLE
    elseif L34_450 < L35_451 then
      L35_451 = _UPVALUE0_
      L35_451 = L35_451.LOGIN_PROFILE_TITLE_INVALID
      return L35_451
    end
  end
  L34_450 = NIL
  if A16_432 == L34_450 then
    L34_450 = _UPVALUE0_
    L34_450 = L34_450.LOGIN_PROFILE_WELCOME_MSG_NIL
    return L34_450
  end
  if A16_432 ~= "" then
    L34_450 = string
    L34_450 = L34_450.len
    L35_451 = A16_432
    L34_450 = L34_450(L35_451)
    L35_451 = MAXLEN_MSG
    if not (L34_450 > L35_451) then
      L35_451 = MINLEN_MSG
    elseif L34_450 < L35_451 then
      L35_451 = _UPVALUE0_
      L35_451 = L35_451.LOGIN_PROFILE_WELCOME_MSG_INVALID
      return L35_451
    end
  end
  L34_450 = NIL
  if A17_433 == L34_450 then
    L34_450 = _UPVALUE0_
    L34_450 = L34_450.LOGIN_PROFILE_ERROR_MSG_NIL
    return L34_450
  end
  if A17_433 ~= "" then
    L34_450 = string
    L34_450 = L34_450.len
    L35_451 = A17_433
    L34_450 = L34_450(L35_451)
    L35_451 = MAXLEN_MSG
    if not (L34_450 > L35_451) then
      L35_451 = MINLEN_MSG
    elseif L34_450 < L35_451 then
      L35_451 = _UPVALUE0_
      L35_451 = L35_451.LOGIN_PROFILE_ERROR_MSG_INVALID
      return L35_451
    end
  end
  L34_450 = NIL
  if A19_435 ~= L34_450 and A19_435 ~= "" then
    L34_450 = _UPVALUE1_
    L34_450 = L34_450.isBoolean
    L35_451 = A19_435
    L34_450 = L34_450(L35_451)
    valid = L34_450
    L34_450 = valid
    L35_451 = _UPVALUE2_
    L35_451 = L35_451.SUCCESS
    if L34_450 ~= L35_451 then
      L34_450 = _UPVALUE0_
      L34_450 = L34_450.LOGIN_PROFILE_ADVT_INVALID
      return L34_450
    end
    L34_450 = tonumber
    L35_451 = A19_435
    L34_450 = L34_450(L35_451)
    if L34_450 == 1 then
      L34_450 = NIL
      if A20_436 == L34_450 then
        L34_450 = _UPVALUE0_
        L34_450 = L34_450.LOGIN_PROFILE_ADVT_CONTENT_NIL
        return L34_450
      end
      L34_450 = string
      L34_450 = L34_450.len
      L35_451 = A20_436
      L34_450 = L34_450(L35_451)
      L35_451 = MAXLEN_ADVT
      if not (L34_450 > L35_451) then
        L35_451 = MINLEN_ADVT
      elseif L34_450 < L35_451 then
        L35_451 = _UPVALUE0_
        L35_451 = L35_451.LOGIN_PROFILE_ADVT_CONTENT_INVALID
        return L35_451
      end
      L35_451 = NIL
      if A21_437 == L35_451 then
        L35_451 = _UPVALUE0_
        L35_451 = L35_451.LOGIN_PROFILE_ADVT_ALIGN_NIL
        return L35_451
      end
      L35_451 = tonumber
      L36_452 = A21_437
      L35_451 = L35_451(L36_452)
      L36_452 = RIGHT
      if L35_451 ~= L36_452 then
        L36_452 = LEFT
        if L35_451 ~= L36_452 then
          L36_452 = _UPVALUE0_
          L36_452 = L36_452.LOGIN_PROFILE_ADVT_ALIGN_INVALID
          return L36_452
        end
      end
      L36_452 = NIL
      if A22_438 == L36_452 then
        L36_452 = _UPVALUE0_
        L36_452 = L36_452.LOGIN_PROFILE_ADVT_FONT_NIL
        return L36_452
      end
      L36_452 = tonumber
      L36_452 = L36_452(A22_438)
      if L36_452 ~= TAHOMA and L36_452 ~= TIMES_NEW_ROMAN and L36_452 ~= VERDANA and L36_452 ~= ARIAL then
        return _UPVALUE0_.LOGIN_PROFILE_ADVT_FONT_TYPE_INVALID
      end
      if A23_439 == NIL then
        return _UPVALUE0_.LOGIN_PROFILE_ADVT_FONTSIZE_NIL
      end
      if tonumber(A23_439) ~= SMALL and tonumber(A23_439) ~= MEDIUM and tonumber(A23_439) ~= BIG then
        return _UPVALUE0_.LOGIN_PROFILE_ADVT_FONTSIZE_INVALID
      end
      if A24_440 == NIL then
        return _UPVALUE0_.LOGIN_PROFILE_ADVT_FONT_COLOR_NIL
      end
      if tonumber(A24_440) ~= RED_FONT_IDX and tonumber(A24_440) ~= BLACK_FONT_IDX and tonumber(A24_440) ~= GREEN_FONT_IDX and tonumber(A24_440) ~= BLUE_FONT_IDX then
        return _UPVALUE0_.LOGIN_PROFILE_ADVT_FONT_COLOR_INVALID
      end
    end
  end
  L34_450 = NIL
  if A25_441 == L34_450 or A25_441 == "" then
    L34_450 = _UPVALUE0_
    L34_450 = L34_450.LOGIN_PROFILE_SHOW_FOOTER_NIL
    return L34_450
  end
  L34_450 = _UPVALUE1_
  L34_450 = L34_450.isBoolean
  L35_451 = A25_441
  L34_450 = L34_450(L35_451)
  valid = L34_450
  L34_450 = valid
  L35_451 = _UPVALUE2_
  L35_451 = L35_451.SUCCESS
  if L34_450 ~= L35_451 then
    L34_450 = _UPVALUE0_
    L34_450 = L34_450.LOGIN_PROFILE_SHOW_FOOTER_INVALID
    return L34_450
  end
  L34_450 = ENABLE
  if A25_441 == L34_450 then
    L34_450 = NIL
    if A26_442 == L34_450 or A26_442 == "" then
      L34_450 = _UPVALUE0_
      L34_450 = L34_450.LOGIN_PROFILE_FOOTER_CONTENT_NIL
      return L34_450
    end
    L34_450 = string
    L34_450 = L34_450.len
    L35_451 = A26_442
    L34_450 = L34_450(L35_451)
    L35_451 = MAXLEN_FOOTER
    if not (L34_450 > L35_451) then
      L35_451 = MINLEN_FOOTER
    elseif L34_450 < L35_451 then
      L35_451 = _UPVALUE0_
      L35_451 = L35_451.LOGIN_PROFILE_FOOTER_CONTENT_INVALID
      return L35_451
    end
    L35_451 = NIL
    if A27_443 == L35_451 or A27_443 == "" then
      L35_451 = _UPVALUE0_
      L35_451 = L35_451.LOGIN_PROFILE_FOOTER_FONT_COLOR_NIL
      return L35_451
    end
    L35_451 = tonumber
    L36_452 = A27_443
    L35_451 = L35_451(L36_452)
    L36_452 = WHITE
    if L35_451 ~= L36_452 then
      L36_452 = RED
      if L35_451 ~= L36_452 then
        L36_452 = GREEN
        if L35_451 ~= L36_452 then
          L36_452 = BLUE
          if L35_451 ~= L36_452 then
            L36_452 = BLACK
            if L35_451 ~= L36_452 then
              L36_452 = _UPVALUE0_
              L36_452 = L36_452.LOGIN_PROFILE_FOOTER_FONT_COLOR_INVALID
              return L36_452
            end
          end
        end
      end
    end
  end
  L34_450 = {}
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.profileName
  L34_450[L35_451] = A1_417
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.pageTitle
  L34_450[L35_451] = A2_418
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.pageBackgroundColor
  L34_450[L35_451] = A5_421
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.pageCustomColor
  L34_450[L35_451] = A6_422
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.pageBackgroundType
  L34_450[L35_451] = A3_419
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.pageBackgroundImgIndex
  L34_450[L35_451] = A4_420
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.headerBackgroundType
  L34_450[L35_451] = A7_423
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.headerBackgroundImgIndex
  L34_450[L35_451] = A8_424
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.headerBackgroundColor
  L34_450[L35_451] = A9_425
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.headerBackgroundCustomColor
  L34_450[L35_451] = A10_426
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.headerCaptionFontFace
  L34_450[L35_451] = A11_427
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.headerCaptionFontSize
  L34_450[L35_451] = A12_428
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.headerCaption
  L34_450[L35_451] = A13_429
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.headerCaptionFontColor
  L34_450[L35_451] = A14_430
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.loginSectionTitle
  L34_450[L35_451] = A15_431
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.welcomeMessage
  L34_450[L35_451] = A16_432
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.errorMessage
  L34_450[L35_451] = A17_433
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.messagesFontColor
  L34_450[L35_451] = A18_434
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.showAdvertisement
  L34_450[L35_451] = A19_435
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.advertisementContent
  L34_450[L35_451] = A20_436
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.advertisementAlignment
  L34_450[L35_451] = A21_437
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.advertisementFontType
  L34_450[L35_451] = A22_438
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.advertisementFontSize
  L34_450[L35_451] = A23_439
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.advertisementFontColor
  L34_450[L35_451] = A24_440
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.showFooter
  L34_450[L35_451] = A25_441
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.footerContent
  L34_450[L35_451] = A26_442
  L35_451 = loginprofileTable
  L36_452 = "."
  L35_451 = L35_451 .. L36_452 .. attribute.footerFontColor
  L34_450[L35_451] = A27_443
  L35_451 = db
  L35_451 = L35_451.insert
  L36_452 = loginprofileTable
  L35_451 = L35_451(L36_452, L34_450)
  L36_452 = NIL
  if L35_451 == L36_452 then
    L36_452 = _UPVALUE2_
    L36_452 = L36_452.FAILURE
    return L36_452
  end
  L36_452 = db
  L36_452 = L36_452.getAttribute
  L36_452 = L36_452(loginprofileTable, attribute.profileName, A1_417, ROWID)
  if L36_452 == NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L36_452
end
function loginProfileDelete(A0_453)
  local L1_454, L2_455
  L1_454 = NIL
  if A0_453 == L1_454 then
    L1_454 = _UPVALUE0_
    L1_454 = L1_454.INVALID_ARGUMENT
    return L1_454
  end
  L1_454 = cookieValidate
  L2_455 = ROWID
  L2_455 = L1_454(L2_455, A0_453, loginprofileTable)
  if L1_454 ~= _UPVALUE0_.SUCCESS then
    return L1_454
  end
  if L2_455 == _UPVALUE1_ then
    return _UPVALUE2_.LOGIN_PROFILE_DEFAULT_GROUP_DEL_ERROR
  end
  if db.deleteRow(loginprofileTable, ROWID, L2_455) == NIL then
    return _UPVALUE0_.FAILURE, L2_455
  end
  return _UPVALUE0_.SUCCESS, L2_455
end
function loginProfilesGetAll()
  local L0_456
  L0_456 = db
  L0_456 = L0_456.getTable
  L0_456 = L0_456(loginprofileTable)
  if next(L0_456) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_456
end
function loginProfileGetRow(A0_457)
  local L1_458
  L1_458 = db
  L1_458 = L1_458.getRow
  L1_458 = L1_458(loginprofileTable, ROWID, A0_457)
  if L1_458 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_457, L1_458
end
function loginProfileDeleteAll()
  local L0_459
  L0_459 = ROWID
  L0_459 = L0_459 .. " NOT IN (SELECT " .. ROWID .. " FROM " .. loginprofileTable .. " WHERE " .. ROWID .. " = '1' )"
  if db.deleteRowWhere(loginprofileTable, L0_459) == NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, cookie
end
