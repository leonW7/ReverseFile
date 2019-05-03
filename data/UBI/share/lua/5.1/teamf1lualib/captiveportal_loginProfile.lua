local L0_0
L0_0 = module
L0_0("com.teamf1.core.captiveportal.loginprofile", package.seeall)
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
L0_0("teamf1lualib/system_productData")
L0_0 = require
L0_0("captivePortalLib")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
loginprofileTable = "CaptivePortalPageDetails"
captivePortalVlanTable = "CaptivePortalVlan"
captivePortalSSIDTable = "CaptivePortalSSID"
sslvpnPortalLayoutTable = "SSLVPNPortalLayout"
pageBackgroundImageTable = "pageBackgroundImage"
headerBackgroundImageTable = "ImageDetails"
loginImageDetailsTable = "LoginImageDetails"
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
attribute.mobileRedirection = "MobileRedirection"
attribute.sslvpnProfileName = "profileName"
attribute.vlanId = "vlanId"
attribute.ssid = "ssid"
attribute.portalLayoutName = "PortalLayoutName"
attribute.profileStatus = "profileStatus"
attribute.bgImageName = "imageName"
attribute.bgEnableStatus = "enableStatus"
attribute.hdImageName = "name"
attribute.hdValue = "value"
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
MAX_LOGIN_PROFILE = 10
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
else
end
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
  if #db.getTable(loginprofileTable) >= MAX_LOGIN_PROFILE then
    return _UPVALUE1_.LOGIN_PROFILES_AT_MAX_NUMBERS
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
function isMobileRedirectionEnabled()
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
  L2_332 = L2_332(loginprofileTable, ROWID, L1_331, attribute.mobileRedirection)
  if L2_332 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_331, L2_332
end
function mobileRedirectionEnable(A0_333)
  local L1_334, L2_335
  L1_334 = NIL
  if A0_333 == L1_334 then
    L1_334 = _UPVALUE0_
    L1_334 = L1_334.INVALID_ARGUMENT
    return L1_334
  end
  L1_334 = cookieValidate
  L2_335 = ROWID
  L2_335 = L1_334(L2_335, A0_333, loginprofileTable)
  if L1_334 ~= _UPVALUE0_.SUCCESS then
    return L1_334
  end
  if db.setAttribute(loginprofileTable, ROWID, L2_335, attribute.mobileRedirection, ENABLE) == NIL then
    return _UPVALUE0_.FAILURE, L2_335
  end
  return _UPVALUE0_.SUCCESS, L2_335
end
function mobileRedirectionDisable(A0_336)
  local L1_337, L2_338
  L1_337 = NIL
  if A0_336 == L1_337 then
    L1_337 = _UPVALUE0_
    L1_337 = L1_337.INVALID_ARGUMENT
    return L1_337
  end
  L1_337 = cookieValidate
  L2_338 = ROWID
  L2_338 = L1_337(L2_338, A0_336, loginprofileTable)
  if L1_337 ~= _UPVALUE0_.SUCCESS then
    return L1_337
  end
  if db.setAttribute(loginprofileTable, ROWID, L2_338, attribute.mobileRedirection, DISABLE) == NIL then
    return _UPVALUE0_.FAILURE, L2_338
  end
  return _UPVALUE0_.SUCCESS, L2_338
end
function isshowFooterEnabled()
  local L0_339, L1_340, L2_341
  L0_339 = getFirstCookie
  L1_340 = ROWID
  L2_341 = loginprofileTable
  L1_340 = L0_339(L1_340, L2_341)
  L2_341 = _UPVALUE0_
  L2_341 = L2_341.SUCCESS
  if L0_339 ~= L2_341 then
    return L0_339
  end
  L2_341 = db
  L2_341 = L2_341.getAttribute
  L2_341 = L2_341(loginprofileTable, ROWID, L1_340, attribute.showFooter)
  if L2_341 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_340, L2_341
end
function isshowFooterEnabledNext(A0_342)
  local L1_343, L2_344, L3_345, L4_346, L5_347
  L1_343 = NIL
  if A0_342 == L1_343 then
    L1_343 = _UPVALUE0_
    L1_343 = L1_343.INVALID_ARGUMENT
    return L1_343
  end
  L1_343 = cookieValidate
  L2_344 = ROWID
  L3_345 = A0_342
  L4_346 = loginprofileTable
  L2_344 = L1_343(L2_344, L3_345, L4_346)
  L3_345 = _UPVALUE0_
  L3_345 = L3_345.SUCCESS
  if L1_343 ~= L3_345 then
    return L1_343
  end
  L3_345 = getNextValidCookie
  L4_346 = ROWID
  L5_347 = L2_344
  L4_346 = L3_345(L4_346, L5_347, loginprofileTable)
  L5_347 = _UPVALUE0_
  L5_347 = L5_347.SUCCESS
  if L3_345 ~= L5_347 then
    return L3_345
  end
  L5_347 = db
  L5_347 = L5_347.getAttribute
  L5_347 = L5_347(loginprofileTable, ROWID, L4_346, attribute.showFooter)
  if L5_347 == NIL then
    return _UPVALUE0_.FAILURE, L2_344
  end
  return _UPVALUE0_.SUCCESS, L4_346, L5_347
end
function showFooterEnable(A0_348)
  local L1_349, L2_350
  L1_349 = NIL
  if A0_348 == L1_349 then
    L1_349 = _UPVALUE0_
    L1_349 = L1_349.INVALID_ARGUMENT
    return L1_349
  end
  L1_349 = cookieValidate
  L2_350 = ROWID
  L2_350 = L1_349(L2_350, A0_348, loginprofileTable)
  if L1_349 ~= _UPVALUE0_.SUCCESS then
    return L1_349
  end
  if db.setAttribute(loginprofileTable, ROWID, L2_350, attribute.showFooter, ENABLE) == NIL then
    return _UPVALUE0_.FAILURE, L2_350
  end
  return _UPVALUE0_.SUCCESS, L2_350
end
function showFooterDisable(A0_351)
  local L1_352, L2_353
  L1_352 = NIL
  if A0_351 == L1_352 then
    L1_352 = _UPVALUE0_
    L1_352 = L1_352.INVALID_ARGUMENT
    return L1_352
  end
  L1_352 = cookieValidate
  L2_353 = ROWID
  L2_353 = L1_352(L2_353, A0_351, loginprofileTable)
  if L1_352 ~= _UPVALUE0_.SUCCESS then
    return L1_352
  end
  if db.setAttribute(loginprofileTable, ROWID, L2_353, attribute.showFooter, DISABLE) == NIL then
    return _UPVALUE0_.FAILURE, L2_353
  end
  return _UPVALUE0_.SUCCESS, L2_353
end
function footerContentGet()
  local L0_354, L1_355, L2_356
  L0_354 = getFirstCookie
  L1_355 = ROWID
  L2_356 = loginprofileTable
  L1_355 = L0_354(L1_355, L2_356)
  L2_356 = _UPVALUE0_
  L2_356 = L2_356.SUCCESS
  if L0_354 ~= L2_356 then
    return L0_354
  end
  L2_356 = db
  L2_356 = L2_356.getAttribute
  L2_356 = L2_356(loginprofileTable, ROWID, L1_355, attribute.footerContent)
  if L2_356 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_355, L2_356
end
function footerContentGetNext(A0_357)
  local L1_358, L2_359, L3_360, L4_361, L5_362
  L1_358 = NIL
  if A0_357 == L1_358 then
    L1_358 = _UPVALUE0_
    L1_358 = L1_358.INVALID_ARGUMENT
    return L1_358
  end
  L1_358 = cookieValidate
  L2_359 = ROWID
  L3_360 = A0_357
  L4_361 = loginprofileTable
  L2_359 = L1_358(L2_359, L3_360, L4_361)
  L3_360 = _UPVALUE0_
  L3_360 = L3_360.SUCCESS
  if L1_358 ~= L3_360 then
    return L1_358
  end
  L3_360 = getNextValidCookie
  L4_361 = ROWID
  L5_362 = L2_359
  L4_361 = L3_360(L4_361, L5_362, loginprofileTable)
  L5_362 = _UPVALUE0_
  L5_362 = L5_362.SUCCESS
  if L3_360 ~= L5_362 then
    return L3_360
  end
  L5_362 = db
  L5_362 = L5_362.getAttribute
  L5_362 = L5_362(loginprofileTable, ROWID, L4_361, attribute.footerContent)
  if L5_362 == NIL then
    return _UPVALUE0_.FAILURE, L2_359
  end
  return _UPVALUE0_.SUCCESS, L4_361, L5_362
end
function footerContentSet(A0_363, A1_364)
  local L2_365, L3_366
  L2_365 = NIL
  if A0_363 == L2_365 then
    L2_365 = _UPVALUE0_
    L2_365 = L2_365.INVALID_ARGUMENT
    return L2_365
  end
  L2_365 = cookieValidate
  L3_366 = ROWID
  L3_366 = L2_365(L3_366, A0_363, loginprofileTable)
  if L2_365 ~= _UPVALUE0_.SUCCESS then
    return L2_365
  end
  if A1_364 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_364) > MAXLEN_FOOTER or string.len(A1_364) < MINLEN_FOOTER then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_366, attribute.footerContent, A1_364) == NIL then
    return _UPVALUE0_.FAILURE, L3_366
  end
  return _UPVALUE0_.SUCCESS, L3_366
end
function footerFontColorGet()
  local L0_367, L1_368, L2_369
  L0_367 = getFirstCookie
  L1_368 = ROWID
  L2_369 = loginprofileTable
  L1_368 = L0_367(L1_368, L2_369)
  L2_369 = _UPVALUE0_
  L2_369 = L2_369.SUCCESS
  if L0_367 ~= L2_369 then
    return L0_367
  end
  L2_369 = db
  L2_369 = L2_369.getAttribute
  L2_369 = L2_369(loginprofileTable, ROWID, L1_368, attribute.footerFontColor)
  if L2_369 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_368, L2_369
end
function footerFontColorGetNext(A0_370)
  local L1_371, L2_372, L3_373, L4_374, L5_375
  L1_371 = NIL
  if A0_370 == L1_371 then
    L1_371 = _UPVALUE0_
    L1_371 = L1_371.INVALID_ARGUMENT
    return L1_371
  end
  L1_371 = cookieValidate
  L2_372 = ROWID
  L3_373 = A0_370
  L4_374 = loginprofileTable
  L2_372 = L1_371(L2_372, L3_373, L4_374)
  L3_373 = _UPVALUE0_
  L3_373 = L3_373.SUCCESS
  if L1_371 ~= L3_373 then
    return L1_371
  end
  L3_373 = getNextValidCookie
  L4_374 = ROWID
  L5_375 = L2_372
  L4_374 = L3_373(L4_374, L5_375, loginprofileTable)
  L5_375 = _UPVALUE0_
  L5_375 = L5_375.SUCCESS
  if L3_373 ~= L5_375 then
    return L3_373
  end
  L5_375 = db
  L5_375 = L5_375.getAttribute
  L5_375 = L5_375(loginprofileTable, ROWID, L4_374, attribute.footerFontColor)
  if L5_375 == NIL then
    return _UPVALUE0_.FAILURE, L2_372
  end
  return _UPVALUE0_.SUCCESS, L4_374, L5_375
end
function footerFontColorSet(A0_376, A1_377)
  local L2_378, L3_379
  L2_378 = NIL
  if A0_376 == L2_378 then
    L2_378 = _UPVALUE0_
    L2_378 = L2_378.INVALID_ARGUMENT
    return L2_378
  end
  L2_378 = cookieValidate
  L3_379 = ROWID
  L3_379 = L2_378(L3_379, A0_376, loginprofileTable)
  if L2_378 ~= _UPVALUE0_.SUCCESS then
    return L2_378
  end
  if A1_377 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_377) ~= WHITE and tonumber(A1_377) ~= RED and tonumber(A1_377) ~= GREEN and tonumber(A1_377) ~= BLUE and tonumber(A1_377) ~= BLACK then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(loginprofileTable, ROWID, L3_379, attribute.footerFontColor, A1_377) == NIL then
    return _UPVALUE0_.FAILURE, L3_379
  end
  return _UPVALUE0_.SUCCESS, L3_379
end
function loginProfileGet()
  local L0_380, L1_381
  L0_380 = getFirstCookie
  L1_381 = ROWID
  L1_381 = L0_380(L1_381, loginprofileTable)
  if L0_380 ~= _UPVALUE0_.SUCCESS then
    return L0_380
  end
  if db.getRow(loginprofileTable, ROWID, L1_381) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_381, db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.profileId], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.profileName], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.pageTitle], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.pageBackgroundType], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.pageBackgroundImgIndex], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.pageBackgroundColor], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.pageCustomColor], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.headerBackgroundType], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.headerBackgroundImgIndex], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.headerBackgroundColor], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.headerBackgroundCustomColor], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.headerCaptionFontFace], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.headerCaptionFontSize], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.headerCaption], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.headerCaptionFontColor], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.loginSectionTitle], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.errorMessage], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.messagesFontColor], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.showAdvertisement], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.advertisementContent], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.advertisementAlignment], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.advertisementFontType], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.advertisementFontSize], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.advertisementFontColor], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.showFooter], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.footerContent], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.footerFontColor], db.getRow(loginprofileTable, ROWID, L1_381)[loginprofileTable .. "." .. attribute.mobileRedirection]
end
function loginProfileGetNext(A0_382)
  local L1_383, L2_384, L3_385, L4_386
  L1_383 = NIL
  if A0_382 == L1_383 then
    L1_383 = _UPVALUE0_
    L1_383 = L1_383.INVALID_ARGUMENT
    return L1_383
  end
  L1_383 = cookieValidate
  L2_384 = ROWID
  L3_385 = A0_382
  L4_386 = loginprofileTable
  L2_384 = L1_383(L2_384, L3_385, L4_386)
  L3_385 = _UPVALUE0_
  L3_385 = L3_385.SUCCESS
  if L1_383 ~= L3_385 then
    return L1_383
  end
  L3_385 = getNextValidCookie
  L4_386 = ROWID
  L4_386 = L3_385(L4_386, L2_384, loginprofileTable)
  if L3_385 ~= _UPVALUE0_.SUCCESS then
    return L3_385
  end
  if db.getRow(loginprofileTable, ROWID, L4_386) == NIL then
    return _UPVALUE0_.FAILURE, L2_384
  end
  return _UPVALUE0_.SUCCESS, L4_386, db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.profileId], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.profileName], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.pageTitle], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.pageBackgroundType], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.pageBackgroundImgIndex], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.pageBackgroundColor], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.pageCustomColor], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.headerBackgroundType], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.headerBackgroundImgIndex], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.headerBackgroundColor], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.headerBackgroundCustomColor], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.headerCaptionFontFace], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.headerCaptionFontSize], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.headerCaption], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.headerCaptionFontColor], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.loginSectionTitle], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.errorMessage], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.messagesFontColor], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.showAdvertisement], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.advertisementContent], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.advertisementAlignment], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.advertisementFontType], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.advertisementFontSize], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.advertisementFontColor], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.showFooter], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.footerContent], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.footerFontColor], db.getRow(loginprofileTable, ROWID, L4_386)[loginprofileTable .. "." .. attribute.mobileRedirection]
end
function loginProfileSet(A0_387, A1_388, A2_389, A3_390, A4_391, A5_392, A6_393, A7_394, A8_395, A9_396, A10_397, A11_398, A12_399, A13_400, A14_401, A15_402, A16_403, A17_404, A18_405, A19_406, A20_407, A21_408, A22_409, A23_410, A24_411, A25_412, A26_413, A27_414, A28_415, A29_416)
  local L30_417, L31_418, L32_419, L33_420, L34_421, L35_422, L36_423, L37_424, L38_425, L39_426
  L30_417 = NIL
  if A0_387 == L30_417 then
    L30_417 = _UPVALUE0_
    L30_417 = L30_417.INVALID_ARGUMENT
    return L30_417
  end
  L30_417 = cookieValidate
  L31_418 = ROWID
  L32_419 = A0_387
  L33_420 = loginprofileTable
  L31_418 = L30_417(L31_418, L32_419, L33_420)
  L32_419 = _UPVALUE0_
  L32_419 = L32_419.SUCCESS
  if L30_417 ~= L32_419 then
    return L30_417
  end
  L32_419 = NIL
  if A2_389 == L32_419 or A2_389 == "" then
    L32_419 = _UPVALUE1_
    L32_419 = L32_419.LOGIN_PROFILE_NAME_NIL
    return L32_419
  end
  L32_419 = string
  L32_419 = L32_419.len
  L33_420 = A2_389
  L32_419 = L32_419(L33_420)
  L33_420 = MAXLEN_PROFILE
  if not (L32_419 > L33_420) then
    L33_420 = MINLEN_PROFILE
  elseif L32_419 < L33_420 then
    L33_420 = _UPVALUE1_
    L33_420 = L33_420.LOGIN_PROFILE_NAME_INVALID
    return L33_420
  end
  L33_420 = NIL
  if A3_390 == L33_420 or A3_390 == "" then
    L33_420 = _UPVALUE1_
    L33_420 = L33_420.LOGIN_PROFILE_TITLE_NIL
    return L33_420
  end
  L33_420 = string
  L33_420 = L33_420.len
  L34_421 = A3_390
  L33_420 = L33_420(L34_421)
  L34_421 = MAXLEN_TITLE
  if not (L33_420 > L34_421) then
    L34_421 = MINLEN_TITLE
  elseif L33_420 < L34_421 then
    L34_421 = _UPVALUE1_
    L34_421 = L34_421.LOGIN_PROFILE_TITLE_INVALID
    return L34_421
  end
  L34_421 = NIL
  if A4_391 == L34_421 or A4_391 == "" then
    L34_421 = _UPVALUE1_
    L34_421 = L34_421.LOGIN_PROFILE_PAGE_BACKGROUND_NIL
    return L34_421
  end
  L34_421 = tonumber
  L35_422 = A4_391
  L34_421 = L34_421(L35_422)
  L35_422 = IMAGE
  if L34_421 ~= L35_422 then
    L35_422 = COLOR
    if L34_421 ~= L35_422 then
      L35_422 = _UPVALUE1_
      L35_422 = L35_422.LOGIN_PROFILE_PAGE_BACKGROUND_INVALID
      return L35_422
    end
  end
  if A5_392 == "" and A6_393 == "" then
    L35_422 = _UPVALUE1_
    L35_422 = L35_422.LOGIN_PROFILE_PAGE_BACKGROUND_COLOR_NIL
    return L35_422
  end
  L35_422 = NIL
  if A5_392 ~= L35_422 and A5_392 ~= "" then
    L35_422 = tonumber
    L36_423 = A5_392
    L35_422 = L35_422(L36_423)
    L36_423 = MIN_INDEX
    if not (L35_422 < L36_423) then
      L36_423 = MAX_INDEX
    elseif L35_422 > L36_423 then
      L36_423 = _UPVALUE1_
      L36_423 = L36_423.LOGIN_PROFILE_PAGE_BACKGROUND_INDEX_INVALID
      return L36_423
    end
  end
  L35_422 = NIL
  if A6_393 ~= L35_422 and A6_393 ~= "" then
    L35_422 = tonumber
    L36_423 = A6_393
    L35_422 = L35_422(L36_423)
    L36_423 = MIN_COLOR_INDEX
    if not (L35_422 < L36_423) then
      L36_423 = MAX_COLOR_INDEX
    elseif L35_422 > L36_423 then
      L36_423 = _UPVALUE1_
      L36_423 = L36_423.LOGIN_PROFILE_PAGE_BACKGROUND_COLOR_INVALID
      return L36_423
    end
  end
  L35_422 = NIL
  if A7_394 ~= L35_422 and A7_394 ~= "" then
    L35_422 = string
    L35_422 = L35_422.len
    L36_423 = A7_394
    L35_422 = L35_422(L36_423)
    L36_423 = MAXLEN_CUSTOM_COLOR
    if not (L35_422 > L36_423) then
      L36_423 = MINLEN_CUSTOM_COLOR
    elseif L35_422 < L36_423 then
      L36_423 = _UPVALUE1_
      L36_423 = L36_423.LOGIN_PROFILE_CUSTOM_COLOR_NIL
      return L36_423
    end
  end
  L35_422 = NIL
  if A8_395 == L35_422 or A8_395 == "" then
    L35_422 = _UPVALUE1_
    L35_422 = L35_422.LOGIN_PROFILE_HEADER_BACKGROUND_NIL
    return L35_422
  end
  L35_422 = tonumber
  L36_423 = A8_395
  L35_422 = L35_422(L36_423)
  L36_423 = IMAGE
  if L35_422 ~= L36_423 then
    L36_423 = COLOR
    if L35_422 ~= L36_423 then
      L36_423 = _UPVALUE1_
      L36_423 = L36_423.LOGIN_PROFILE_HEADER_BACKGROUND_TYPE_INVALID
      return L36_423
    end
  end
  if A9_396 == "" and A10_397 == "" then
    L36_423 = _UPVALUE1_
    L36_423 = L36_423.LOGIN_PROFILE_HEADER_BACKGROUND_TYPE_INVALID
    return L36_423
  end
  L36_423 = NIL
  if A9_396 ~= L36_423 and A9_396 ~= "" then
    L36_423 = tonumber
    L37_424 = A9_396
    L36_423 = L36_423(L37_424)
    L37_424 = HEADER_MIN_INDEX
    if not (L36_423 < L37_424) then
      L37_424 = HEADER_MAX_INDEX
    elseif L36_423 > L37_424 then
      L37_424 = _UPVALUE1_
      L37_424 = L37_424.LOGIN_PROFILE_HEADER_BACKGROUND_IMAGE_INDEX_INVALID
      return L37_424
    end
  end
  L36_423 = NIL
  if A10_397 ~= L36_423 and A10_397 ~= "" then
    L36_423 = tonumber
    L37_424 = A10_397
    L36_423 = L36_423(L37_424)
    L37_424 = WHITE
    if L36_423 ~= L37_424 then
      L37_424 = RED
      if L36_423 ~= L37_424 then
        L37_424 = GREEN
        if L36_423 ~= L37_424 then
          L37_424 = BLUE
          if L36_423 ~= L37_424 then
            L37_424 = CUSTOM
            if L36_423 ~= L37_424 then
              L37_424 = _UPVALUE1_
              L37_424 = L37_424.LOGIN_PROFILE_HEADER_BACKGROUND_COLOR_INVALID
              return L37_424
            end
          end
        end
      end
    end
  end
  L36_423 = NIL
  if A11_398 ~= L36_423 and A11_398 ~= "" then
    L36_423 = string
    L36_423 = L36_423.len
    L37_424 = A11_398
    L36_423 = L36_423(L37_424)
    L37_424 = MAXLEN_CUSTOM_COLOR
    if not (L36_423 > L37_424) then
      L37_424 = MINLEN_CUSTOM_COLOR
    elseif L36_423 < L37_424 then
      L37_424 = _UPVALUE1_
      L37_424 = L37_424.LOGIN_PROFILE_HEADER_CUSTOM_COLOR_INVALID
      return L37_424
    end
  end
  L36_423 = NIL
  if A12_399 == L36_423 or A12_399 == "" then
    L36_423 = _UPVALUE1_
    L36_423 = L36_423.LOGIN_PROFILE_HEADER_FONT_NIL
    return L36_423
  end
  L36_423 = tonumber
  L37_424 = A12_399
  L36_423 = L36_423(L37_424)
  L37_424 = MIN_FONT_INDEX
  if not (L36_423 < L37_424) then
    L37_424 = MAX_FONT_INDEX
  elseif L36_423 > L37_424 then
    L37_424 = _UPVALUE1_
    L37_424 = L37_424.LOGIN_PROFILE_HEADER_FONT_INVALID
    return L37_424
  end
  L37_424 = NIL
  if A13_400 == L37_424 or A13_400 == "" then
    L37_424 = _UPVALUE1_
    L37_424 = L37_424.LOGIN_PROFILE_HEADER_FONTSIZE_NIL
    return L37_424
  end
  L37_424 = tonumber
  L38_425 = A13_400
  L37_424 = L37_424(L38_425)
  L38_425 = MIN_FONTSIZE
  if not (L37_424 < L38_425) then
    L38_425 = MAX_FONTSIZE
  elseif L37_424 > L38_425 then
    L38_425 = _UPVALUE1_
    L38_425 = L38_425.LOGIN_PROFILE_HEADER_FONTSIZE_INVALID
    return L38_425
  end
  L38_425 = NIL
  if A14_401 == L38_425 then
    L38_425 = _UPVALUE1_
    L38_425 = L38_425.LOGIN_PROFILE_HEADER_CAPTION_NIL
    return L38_425
  end
  if A14_401 ~= "" then
    L38_425 = string
    L38_425 = L38_425.len
    L39_426 = A14_401
    L38_425 = L38_425(L39_426)
    L39_426 = MAXLEN_HEADER
    if not (L38_425 > L39_426) then
      L39_426 = MINLEN_HEADER
    elseif L38_425 < L39_426 then
      L39_426 = _UPVALUE1_
      L39_426 = L39_426.LOGIN_PROFILE_HEADER_CAPTION_INVALID
      return L39_426
    end
  end
  L38_425 = NIL
  if A15_402 == L38_425 or A15_402 == "" then
    L38_425 = _UPVALUE1_
    L38_425 = L38_425.LOGIN_PROFILE_HEADER_FONT_COLOR_NIL
    return L38_425
  end
  L38_425 = tonumber
  L39_426 = A15_402
  L38_425 = L38_425(L39_426)
  L39_426 = MIN_COLOR_IDX
  if not (L38_425 < L39_426) then
    L39_426 = MAX_COLOR_IDX
  elseif L38_425 > L39_426 then
    L39_426 = _UPVALUE1_
    L39_426 = L39_426.LOGIN_PROFILE_HEADER_FONT_COLOR_INVALID
    return L39_426
  end
  L39_426 = NIL
  if A16_403 == L39_426 then
    L39_426 = _UPVALUE1_
    L39_426 = L39_426.LOGIN_PROFILE_TITLE_NIL
    return L39_426
  end
  if A16_403 ~= "" then
    L39_426 = string
    L39_426 = L39_426.len
    L39_426 = L39_426(A16_403)
    if L39_426 > MAXLEN_TITLE or L39_426 < MINLEN_TITLE then
      return _UPVALUE1_.LOGIN_PROFILE_TITLE_INVALID
    end
  end
  L39_426 = NIL
  if A17_404 == L39_426 then
    L39_426 = _UPVALUE1_
    L39_426 = L39_426.LOGIN_PROFILE_WELCOME_MSG_NIL
    return L39_426
  end
  if A17_404 ~= "" then
    L39_426 = string
    L39_426 = L39_426.len
    L39_426 = L39_426(A17_404)
    if L39_426 > MAXLEN_MSG or L39_426 < MINLEN_MSG then
      return _UPVALUE1_.LOGIN_PROFILE_WELCOME_MSG_INVALID
    end
  end
  L39_426 = NIL
  if A18_405 == L39_426 then
    L39_426 = _UPVALUE1_
    L39_426 = L39_426.LOGIN_PROFILE_ERROR_MSG_NIL
    return L39_426
  end
  if A18_405 ~= "" then
    L39_426 = string
    L39_426 = L39_426.len
    L39_426 = L39_426(A18_405)
    if L39_426 > MAXLEN_MSG or L39_426 < MINLEN_MSG then
      return _UPVALUE1_.LOGIN_PROFILE_ERROR_MSG_INVALID
    end
  end
  L39_426 = UNIT_NAME
  if L39_426 ~= "DSR-1000AC" then
    L39_426 = UNIT_NAME
    if L39_426 ~= "DSR-500AC" then
      L39_426 = NIL
      if A20_407 ~= L39_426 and A20_407 ~= "" then
        L39_426 = _UPVALUE2_
        L39_426 = L39_426.isBoolean
        L39_426 = L39_426(A20_407)
        valid = L39_426
        L39_426 = valid
        if L39_426 ~= _UPVALUE0_.SUCCESS then
          L39_426 = _UPVALUE1_
          L39_426 = L39_426.LOGIN_PROFILE_ADVT_INVALID
          return L39_426
        end
        L39_426 = tonumber
        L39_426 = L39_426(A20_407)
        if L39_426 == 1 then
          L39_426 = NIL
          if A21_408 == L39_426 then
            L39_426 = _UPVALUE1_
            L39_426 = L39_426.LOGIN_PROFILE_ADVT_CONTENT_NIL
            return L39_426
          end
          L39_426 = string
          L39_426 = L39_426.len
          L39_426 = L39_426(A21_408)
          if L39_426 > MAXLEN_ADVT or L39_426 < MINLEN_ADVT then
            return _UPVALUE1_.LOGIN_PROFILE_ADVT_CONTENT_INVALID
          end
          if A22_409 == NIL then
            return _UPVALUE1_.LOGIN_PROFILE_ADVT_ALIGN_NIL
          end
          if tonumber(A22_409) ~= RIGHT and tonumber(A22_409) ~= LEFT then
            return _UPVALUE1_.LOGIN_PROFILE_ADVT_ALIGN_INVALID
          end
          if A23_410 == NIL then
            return _UPVALUE1_.LOGIN_PROFILE_ADVT_FONT_NIL
          end
          if tonumber(A23_410) ~= TAHOMA and tonumber(A23_410) ~= TIMES_NEW_ROMAN and tonumber(A23_410) ~= VERDANA and tonumber(A23_410) ~= ARIAL then
            return _UPVALUE1_.LOGIN_PROFILE_ADVT_FONT_TYPE_INVALID
          end
          if A24_411 == NIL then
            return _UPVALUE1_.LOGIN_PROFILE_ADVT_FONTSIZE_NIL
          end
          if tonumber(A24_411) ~= SMALL and tonumber(A24_411) ~= MEDIUM and tonumber(A24_411) ~= BIG then
            return _UPVALUE1_.LOGIN_PROFILE_ADVT_FONTSIZE_INVALID
          end
          if A25_412 == NIL then
            return _UPVALUE1_.LOGIN_PROFILE_ADVT_FONT_COLOR_NIL
          end
          if tonumber(A25_412) ~= RED_FONT_IDX and tonumber(A25_412) ~= BLACK_FONT_IDX and tonumber(A25_412) ~= GREEN_FONT_IDX and tonumber(A25_412) ~= BLUE_FONT_IDX then
            return _UPVALUE1_.LOGIN_PROFILE_ADVT_FONT_COLOR_INVALID
          end
        end
      end
    end
  end
  L39_426 = NIL
  if A26_413 == L39_426 or A26_413 == "" then
    L39_426 = _UPVALUE1_
    L39_426 = L39_426.LOGIN_PROFILE_SHOW_FOOTER_NIL
    return L39_426
  end
  L39_426 = _UPVALUE2_
  L39_426 = L39_426.isBoolean
  L39_426 = L39_426(A26_413)
  valid = L39_426
  L39_426 = valid
  if L39_426 ~= _UPVALUE0_.SUCCESS then
    L39_426 = _UPVALUE1_
    L39_426 = L39_426.LOGIN_PROFILE_SHOW_FOOTER_INVALID
    return L39_426
  end
  L39_426 = ENABLE
  if A26_413 == L39_426 then
    L39_426 = NIL
    if A27_414 == L39_426 or A27_414 == "" then
      L39_426 = _UPVALUE1_
      L39_426 = L39_426.LOGIN_PROFILE_FOOTER_CONTENT_NIL
      return L39_426
    end
    L39_426 = string
    L39_426 = L39_426.len
    L39_426 = L39_426(A27_414)
    if L39_426 > MAXLEN_FOOTER or L39_426 < MINLEN_FOOTER then
      return _UPVALUE1_.LOGIN_PROFILE_FOOTER_CONTENT_INVALID
    end
    if A28_415 == NIL or A28_415 == "" then
      return _UPVALUE1_.LOGIN_PROFILE_FOOTER_FONT_COLOR_NIL
    end
    if tonumber(A28_415) ~= WHITE and tonumber(A28_415) ~= RED and tonumber(A28_415) ~= GREEN and tonumber(A28_415) ~= BLUE and tonumber(A28_415) ~= BLACK then
      return _UPVALUE1_.LOGIN_PROFILE_FOOTER_FONT_COLOR_INVALID
    end
  end
  L39_426 = NIL
  if A29_416 == L39_426 or A29_416 == "" then
    L39_426 = _UPVALUE1_
    L39_426 = L39_426.LOGIN_PROFILE_MOBILE_REDIRECTION_NIL
    return L39_426
  end
  L39_426 = _UPVALUE2_
  L39_426 = L39_426.isBoolean
  L39_426 = L39_426(A29_416)
  valid = L39_426
  L39_426 = valid
  if L39_426 ~= _UPVALUE0_.SUCCESS then
    L39_426 = _UPVALUE1_
    L39_426 = L39_426.LOGIN_PROFILE_MOBILE_REDIRECTION_INVALID
    return L39_426
  end
  L39_426 = {}
  L39_426[loginprofileTable .. "." .. attribute.profileName] = A2_389
  L39_426[loginprofileTable .. "." .. attribute.pageTitle] = A3_390
  L39_426[loginprofileTable .. "." .. attribute.pageBackgroundType] = A4_391
  L39_426[loginprofileTable .. "." .. attribute.pageBackgroundImgIndex] = A5_392
  L39_426[loginprofileTable .. "." .. attribute.pageBackgroundColor] = A6_393
  L39_426[loginprofileTable .. "." .. attribute.pageCustomColor] = A7_394
  L39_426[loginprofileTable .. "." .. attribute.headerBackgroundType] = A8_395
  L39_426[loginprofileTable .. "." .. attribute.headerBackgroundImgIndex] = A9_396
  L39_426[loginprofileTable .. "." .. attribute.headerBackgroundColor] = A10_397
  L39_426[loginprofileTable .. "." .. attribute.headerBackgroundCustomColor] = A11_398
  L39_426[loginprofileTable .. "." .. attribute.headerCaptionFontFace] = A12_399
  L39_426[loginprofileTable .. "." .. attribute.headerCaptionFontSize] = A13_400
  L39_426[loginprofileTable .. "." .. attribute.headerCaption] = A14_401
  L39_426[loginprofileTable .. "." .. attribute.headerCaptionFontColor] = A15_402
  L39_426[loginprofileTable .. "." .. attribute.loginSectionTitle] = A16_403
  L39_426[loginprofileTable .. "." .. attribute.welcomeMessage] = A17_404
  L39_426[loginprofileTable .. "." .. attribute.errorMessage] = A18_405
  L39_426[loginprofileTable .. "." .. attribute.messagesFontColor] = A19_406
  L39_426[loginprofileTable .. "." .. attribute.showAdvertisement] = A20_407
  L39_426[loginprofileTable .. "." .. attribute.advertisementContent] = A21_408
  L39_426[loginprofileTable .. "." .. attribute.advertisementAlignment] = A22_409
  L39_426[loginprofileTable .. "." .. attribute.advertisementFontType] = A23_410
  L39_426[loginprofileTable .. "." .. attribute.advertisementFontSize] = A24_411
  L39_426[loginprofileTable .. "." .. attribute.advertisementFontColor] = A25_412
  L39_426[loginprofileTable .. "." .. attribute.showFooter] = A26_413
  L39_426[loginprofileTable .. "." .. attribute.footerContent] = A27_414
  L39_426[loginprofileTable .. "." .. attribute.footerFontColor] = A28_415
  L39_426[loginprofileTable .. "." .. attribute.mobileRedirection] = A29_416
  if db.update(loginprofileTable, L39_426, L31_418) == NIL then
    return _UPVALUE0_.FAILURE, L31_418
  end
  return _UPVALUE0_.SUCCESS, L31_418
end
function loginProfileCreate(A0_427, A1_428, A2_429, A3_430, A4_431, A5_432, A6_433, A7_434, A8_435, A9_436, A10_437, A11_438, A12_439, A13_440, A14_441, A15_442, A16_443, A17_444, A18_445, A19_446, A20_447, A21_448, A22_449, A23_450, A24_451, A25_452, A26_453, A27_454, A28_455)
  local L29_456, L30_457, L31_458, L32_459, L33_460, L34_461, L35_462, L36_463, L37_464, L38_465, L39_466, L40_467, L41_468, L42_469
  L30_457 = db
  L30_457 = L30_457.getTable
  L31_458 = loginprofileTable
  L30_457 = L30_457(L31_458)
  L29_456 = L30_457
  if L29_456 ~= nil then
    L30_457 = #L29_456
    L31_458 = _UPVALUE0_
    if L30_457 >= L31_458 then
      L30_457 = _UPVALUE1_
      L30_457 = L30_457.MAX_LIMIT_REACHED
      return L30_457
    end
  end
  L30_457 = db
  L30_457 = L30_457.existsRow
  L31_458 = loginprofileTable
  L32_459 = attribute
  L32_459 = L32_459.profileName
  L33_460 = A1_428
  L30_457 = L30_457(L31_458, L32_459, L33_460)
  if L30_457 then
    L31_458 = _UPVALUE2_
    L31_458 = L31_458.LOGIN_PROFILES_NAME_EXISTS
    return L31_458
  end
  L31_458 = NIL
  if A1_428 == L31_458 or A1_428 == "" then
    L31_458 = _UPVALUE2_
    L31_458 = L31_458.LOGIN_PROFILE_NAME_NIL
    return L31_458
  end
  L31_458 = string
  L31_458 = L31_458.len
  L32_459 = A1_428
  L31_458 = L31_458(L32_459)
  L32_459 = MAXLEN_PROFILE
  if not (L31_458 > L32_459) then
    L32_459 = MINLEN_PROFILE
  elseif L31_458 < L32_459 then
    L32_459 = _UPVALUE2_
    L32_459 = L32_459.LOGIN_PROFILE_NAME_INVALID
    return L32_459
  end
  L32_459 = NIL
  if A2_429 == L32_459 or A2_429 == "" then
    L32_459 = _UPVALUE2_
    L32_459 = L32_459.LOGIN_PROFILE_TITLE_NIL
    return L32_459
  end
  L32_459 = string
  L32_459 = L32_459.len
  L33_460 = A2_429
  L32_459 = L32_459(L33_460)
  L33_460 = MAXLEN_TITLE
  if not (L32_459 > L33_460) then
    L33_460 = MINLEN_TITLE
  elseif L32_459 < L33_460 then
    L33_460 = _UPVALUE2_
    L33_460 = L33_460.LOGIN_PROFILE_TITLE_INVALID
    return L33_460
  end
  L33_460 = NIL
  if A3_430 == L33_460 or A3_430 == "" then
    L33_460 = _UPVALUE2_
    L33_460 = L33_460.LOGIN_PROFILE_PAGE_BACKGROUND_NIL
    return L33_460
  end
  L33_460 = tonumber
  L34_461 = A3_430
  L33_460 = L33_460(L34_461)
  L34_461 = IMAGE
  if L33_460 ~= L34_461 then
    L34_461 = COLOR
    if L33_460 ~= L34_461 then
      L34_461 = _UPVALUE2_
      L34_461 = L34_461.LOGIN_PROFILE_PAGE_BACKGROUND_INVALID
      return L34_461
    end
  end
  if A4_431 == "" and A5_432 == "" then
    L34_461 = _UPVALUE2_
    L34_461 = L34_461.LOGIN_PROFILE_PAGE_BACKGROUND_COLOR_NIL
    return L34_461
  end
  L34_461 = NIL
  if A4_431 ~= L34_461 and A4_431 ~= "" then
    L34_461 = tonumber
    L35_462 = A4_431
    L34_461 = L34_461(L35_462)
    L35_462 = MIN_INDEX
    if not (L34_461 < L35_462) then
      L35_462 = MAX_INDEX
    elseif L34_461 > L35_462 then
      L35_462 = _UPVALUE2_
      L35_462 = L35_462.LOGIN_PROFILE_PAGE_BACKGROUND_INDEX_INVALID
      return L35_462
    end
  end
  L34_461 = NIL
  if A5_432 ~= L34_461 and A5_432 ~= "" then
    L34_461 = tonumber
    L35_462 = A5_432
    L34_461 = L34_461(L35_462)
    L35_462 = MIN_COLOR_INDEX
    if not (L34_461 < L35_462) then
      L35_462 = MAX_COLOR_INDEX
    elseif L34_461 > L35_462 then
      L35_462 = _UPVALUE2_
      L35_462 = L35_462.LOGIN_PROFILE_PAGE_BACKGROUND_COLOR_INVALID
      return L35_462
    end
  end
  L34_461 = NIL
  if A6_433 ~= L34_461 and A6_433 ~= "" then
    L34_461 = string
    L34_461 = L34_461.len
    L35_462 = A6_433
    L34_461 = L34_461(L35_462)
    L35_462 = MAXLEN_CUSTOM_COLOR
    if not (L34_461 > L35_462) then
      L35_462 = MINLEN_CUSTOM_COLOR
    elseif L34_461 < L35_462 then
      L35_462 = _UPVALUE2_
      L35_462 = L35_462.LOGIN_PROFILE_CUSTOM_COLOR_NIL
      return L35_462
    end
  end
  L34_461 = NIL
  if A7_434 == L34_461 or A7_434 == "" then
    L34_461 = _UPVALUE2_
    L34_461 = L34_461.LOGIN_PROFILE_HEADER_BACKGROUND_NIL
    return L34_461
  end
  L34_461 = tonumber
  L35_462 = A7_434
  L34_461 = L34_461(L35_462)
  L35_462 = IMAGE
  if L34_461 ~= L35_462 then
    L35_462 = COLOR
    if L34_461 ~= L35_462 then
      L35_462 = _UPVALUE2_
      L35_462 = L35_462.LOGIN_PROFILE_HEADER_BACKGROUND_TYPE_INVALID
      return L35_462
    end
  end
  if A8_435 == "" and A9_436 == "" then
    L35_462 = _UPVALUE2_
    L35_462 = L35_462.LOGIN_PROFILE_HEADER_BACKGROUND_TYPE_INVALID
    return L35_462
  end
  L35_462 = NIL
  if A8_435 ~= L35_462 and A8_435 ~= "" then
    L35_462 = tonumber
    L36_463 = A8_435
    L35_462 = L35_462(L36_463)
    L36_463 = HEADER_MIN_INDEX
    if not (L35_462 < L36_463) then
      L36_463 = HEADER_MAX_INDEX
    elseif L35_462 > L36_463 then
      L36_463 = _UPVALUE2_
      L36_463 = L36_463.LOGIN_PROFILE_HEADER_BACKGROUND_IMAGE_INDEX_INVALID
      return L36_463
    end
  end
  L35_462 = NIL
  if A9_436 ~= L35_462 and A9_436 ~= "" then
    L35_462 = tonumber
    L36_463 = A9_436
    L35_462 = L35_462(L36_463)
    L36_463 = WHITE
    if L35_462 ~= L36_463 then
      L36_463 = RED
      if L35_462 ~= L36_463 then
        L36_463 = GREEN
        if L35_462 ~= L36_463 then
          L36_463 = BLUE
          if L35_462 ~= L36_463 then
            L36_463 = CUSTOM
            if L35_462 ~= L36_463 then
              L36_463 = _UPVALUE2_
              L36_463 = L36_463.LOGIN_PROFILE_HEADER_BACKGROUND_COLOR_INVALID
              return L36_463
            end
          end
        end
      end
    end
  end
  L35_462 = NIL
  if A10_437 ~= L35_462 and A10_437 ~= "" then
    L35_462 = string
    L35_462 = L35_462.len
    L36_463 = A10_437
    L35_462 = L35_462(L36_463)
    L36_463 = MAXLEN_CUSTOM_COLOR
    if not (L35_462 > L36_463) then
      L36_463 = MINLEN_CUSTOM_COLOR
    elseif L35_462 < L36_463 then
      L36_463 = _UPVALUE2_
      L36_463 = L36_463.LOGIN_PROFILE_HEADER_CUSTOM_COLOR_INVALID
      return L36_463
    end
  end
  L35_462 = NIL
  if A11_438 == L35_462 or A11_438 == "" then
    L35_462 = _UPVALUE2_
    L35_462 = L35_462.LOGIN_PROFILE_HEADER_FONT_NIL
    return L35_462
  end
  L35_462 = tonumber
  L36_463 = A11_438
  L35_462 = L35_462(L36_463)
  L36_463 = MIN_FONT_INDEX
  if not (L35_462 < L36_463) then
    L36_463 = MAX_FONT_INDEX
  elseif L35_462 > L36_463 then
    L36_463 = _UPVALUE2_
    L36_463 = L36_463.LOGIN_PROFILE_HEADER_FONT_INVALID
    return L36_463
  end
  L36_463 = NIL
  if A12_439 == L36_463 or A12_439 == "" then
    L36_463 = _UPVALUE2_
    L36_463 = L36_463.LOGIN_PROFILE_HEADER_FONTSIZE_NIL
    return L36_463
  end
  L36_463 = tonumber
  L37_464 = A12_439
  L36_463 = L36_463(L37_464)
  L37_464 = MIN_FONTSIZE
  if not (L36_463 < L37_464) then
    L37_464 = MAX_FONTSIZE
  elseif L36_463 > L37_464 then
    L37_464 = _UPVALUE2_
    L37_464 = L37_464.LOGIN_PROFILE_HEADER_FONTSIZE_INVALID
    return L37_464
  end
  L37_464 = NIL
  if A13_440 == L37_464 then
    L37_464 = _UPVALUE2_
    L37_464 = L37_464.LOGIN_PROFILE_HEADER_CAPTION_NIL
    return L37_464
  end
  if A13_440 ~= "" then
    L37_464 = string
    L37_464 = L37_464.len
    L38_465 = A13_440
    L37_464 = L37_464(L38_465)
    L38_465 = MAXLEN_HEADER
    if not (L37_464 > L38_465) then
      L38_465 = MINLEN_HEADER
    elseif L37_464 < L38_465 then
      L38_465 = _UPVALUE2_
      L38_465 = L38_465.LOGIN_PROFILE_HEADER_CAPTION_INVALID
      return L38_465
    end
  end
  L37_464 = NIL
  if A14_441 == L37_464 or A14_441 == "" then
    L37_464 = _UPVALUE2_
    L37_464 = L37_464.LOGIN_PROFILE_HEADER_FONT_COLOR_NIL
    return L37_464
  end
  L37_464 = tonumber
  L38_465 = A14_441
  L37_464 = L37_464(L38_465)
  L38_465 = MIN_COLOR_IDX
  if not (L37_464 < L38_465) then
    L38_465 = MAX_COLOR_IDX
  elseif L37_464 > L38_465 then
    L38_465 = _UPVALUE2_
    L38_465 = L38_465.LOGIN_PROFILE_HEADER_FONT_COLOR_INVALID
    return L38_465
  end
  L38_465 = NIL
  if A15_442 == L38_465 then
    L38_465 = _UPVALUE2_
    L38_465 = L38_465.LOGIN_PROFILE_TITLE_NIL
    return L38_465
  end
  if A15_442 ~= "" then
    L38_465 = string
    L38_465 = L38_465.len
    L39_466 = A15_442
    L38_465 = L38_465(L39_466)
    L39_466 = MAXLEN_TITLE
    if not (L38_465 > L39_466) then
      L39_466 = MINLEN_TITLE
    elseif L38_465 < L39_466 then
      L39_466 = _UPVALUE2_
      L39_466 = L39_466.LOGIN_PROFILE_TITLE_INVALID
      return L39_466
    end
  end
  L38_465 = NIL
  if A16_443 == L38_465 then
    L38_465 = _UPVALUE2_
    L38_465 = L38_465.LOGIN_PROFILE_WELCOME_MSG_NIL
    return L38_465
  end
  if A16_443 ~= "" then
    L38_465 = string
    L38_465 = L38_465.len
    L39_466 = A16_443
    L38_465 = L38_465(L39_466)
    L39_466 = MAXLEN_MSG
    if not (L38_465 > L39_466) then
      L39_466 = MINLEN_MSG
    elseif L38_465 < L39_466 then
      L39_466 = _UPVALUE2_
      L39_466 = L39_466.LOGIN_PROFILE_WELCOME_MSG_INVALID
      return L39_466
    end
  end
  L38_465 = NIL
  if A17_444 == L38_465 then
    L38_465 = _UPVALUE2_
    L38_465 = L38_465.LOGIN_PROFILE_ERROR_MSG_NIL
    return L38_465
  end
  if A17_444 ~= "" then
    L38_465 = string
    L38_465 = L38_465.len
    L39_466 = A17_444
    L38_465 = L38_465(L39_466)
    L39_466 = MAXLEN_MSG
    if not (L38_465 > L39_466) then
      L39_466 = MINLEN_MSG
    elseif L38_465 < L39_466 then
      L39_466 = _UPVALUE2_
      L39_466 = L39_466.LOGIN_PROFILE_ERROR_MSG_INVALID
      return L39_466
    end
  end
  L38_465 = UNIT_NAME
  if L38_465 ~= "DSR-1000AC" then
    L38_465 = UNIT_NAME
    if L38_465 ~= "DSR-500AC" then
      L38_465 = NIL
      if A19_446 ~= L38_465 and A19_446 ~= "" then
        L38_465 = _UPVALUE3_
        L38_465 = L38_465.isBoolean
        L39_466 = A19_446
        L38_465 = L38_465(L39_466)
        valid = L38_465
        L38_465 = valid
        L39_466 = _UPVALUE1_
        L39_466 = L39_466.SUCCESS
        if L38_465 ~= L39_466 then
          L38_465 = _UPVALUE2_
          L38_465 = L38_465.LOGIN_PROFILE_ADVT_INVALID
          return L38_465
        end
        L38_465 = tonumber
        L39_466 = A19_446
        L38_465 = L38_465(L39_466)
        if L38_465 == 1 then
          L38_465 = NIL
          if A20_447 == L38_465 then
            L38_465 = _UPVALUE2_
            L38_465 = L38_465.LOGIN_PROFILE_ADVT_CONTENT_NIL
            return L38_465
          end
          L38_465 = string
          L38_465 = L38_465.len
          L39_466 = A20_447
          L38_465 = L38_465(L39_466)
          L39_466 = MAXLEN_ADVT
          if not (L38_465 > L39_466) then
            L39_466 = MINLEN_ADVT
          elseif L38_465 < L39_466 then
            L39_466 = _UPVALUE2_
            L39_466 = L39_466.LOGIN_PROFILE_ADVT_CONTENT_INVALID
            return L39_466
          end
          L39_466 = NIL
          if A21_448 == L39_466 then
            L39_466 = _UPVALUE2_
            L39_466 = L39_466.LOGIN_PROFILE_ADVT_ALIGN_NIL
            return L39_466
          end
          L39_466 = tonumber
          L40_467 = A21_448
          L39_466 = L39_466(L40_467)
          L40_467 = RIGHT
          if L39_466 ~= L40_467 then
            L40_467 = LEFT
            if L39_466 ~= L40_467 then
              L40_467 = _UPVALUE2_
              L40_467 = L40_467.LOGIN_PROFILE_ADVT_ALIGN_INVALID
              return L40_467
            end
          end
          L40_467 = NIL
          if A22_449 == L40_467 then
            L40_467 = _UPVALUE2_
            L40_467 = L40_467.LOGIN_PROFILE_ADVT_FONT_NIL
            return L40_467
          end
          L40_467 = tonumber
          L41_468 = A22_449
          L40_467 = L40_467(L41_468)
          L41_468 = TAHOMA
          if L40_467 ~= L41_468 then
            L41_468 = TIMES_NEW_ROMAN
            if L40_467 ~= L41_468 then
              L41_468 = VERDANA
              if L40_467 ~= L41_468 then
                L41_468 = ARIAL
                if L40_467 ~= L41_468 then
                  L41_468 = _UPVALUE2_
                  L41_468 = L41_468.LOGIN_PROFILE_ADVT_FONT_TYPE_INVALID
                  return L41_468
                end
              end
            end
          end
          L41_468 = NIL
          if A23_450 == L41_468 then
            L41_468 = _UPVALUE2_
            L41_468 = L41_468.LOGIN_PROFILE_ADVT_FONTSIZE_NIL
            return L41_468
          end
          L41_468 = tonumber
          L42_469 = A23_450
          L41_468 = L41_468(L42_469)
          L42_469 = SMALL
          if L41_468 ~= L42_469 then
            L42_469 = MEDIUM
            if L41_468 ~= L42_469 then
              L42_469 = BIG
              if L41_468 ~= L42_469 then
                L42_469 = _UPVALUE2_
                L42_469 = L42_469.LOGIN_PROFILE_ADVT_FONTSIZE_INVALID
                return L42_469
              end
            end
          end
          L42_469 = NIL
          if A24_451 == L42_469 then
            L42_469 = _UPVALUE2_
            L42_469 = L42_469.LOGIN_PROFILE_ADVT_FONT_COLOR_NIL
            return L42_469
          end
          L42_469 = tonumber
          L42_469 = L42_469(A24_451)
          if L42_469 ~= RED_FONT_IDX and L42_469 ~= BLACK_FONT_IDX and L42_469 ~= GREEN_FONT_IDX and L42_469 ~= BLUE_FONT_IDX then
            return _UPVALUE2_.LOGIN_PROFILE_ADVT_FONT_COLOR_INVALID
          end
        end
      end
    end
  end
  L38_465 = NIL
  if A25_452 == L38_465 or A25_452 == "" then
    L38_465 = _UPVALUE2_
    L38_465 = L38_465.LOGIN_PROFILE_SHOW_FOOTER_NIL
    return L38_465
  end
  L38_465 = _UPVALUE3_
  L38_465 = L38_465.isBoolean
  L39_466 = A25_452
  L38_465 = L38_465(L39_466)
  valid = L38_465
  L38_465 = valid
  L39_466 = _UPVALUE1_
  L39_466 = L39_466.SUCCESS
  if L38_465 ~= L39_466 then
    L38_465 = _UPVALUE2_
    L38_465 = L38_465.LOGIN_PROFILE_SHOW_FOOTER_INVALID
    return L38_465
  end
  L38_465 = ENABLE
  if A25_452 == L38_465 then
    L38_465 = NIL
    if A26_453 == L38_465 or A26_453 == "" then
      L38_465 = _UPVALUE2_
      L38_465 = L38_465.LOGIN_PROFILE_FOOTER_CONTENT_NIL
      return L38_465
    end
    L38_465 = string
    L38_465 = L38_465.len
    L39_466 = A26_453
    L38_465 = L38_465(L39_466)
    L39_466 = MAXLEN_FOOTER
    if not (L38_465 > L39_466) then
      L39_466 = MINLEN_FOOTER
    elseif L38_465 < L39_466 then
      L39_466 = _UPVALUE2_
      L39_466 = L39_466.LOGIN_PROFILE_FOOTER_CONTENT_INVALID
      return L39_466
    end
    L39_466 = NIL
    if A27_454 == L39_466 or A27_454 == "" then
      L39_466 = _UPVALUE2_
      L39_466 = L39_466.LOGIN_PROFILE_FOOTER_FONT_COLOR_NIL
      return L39_466
    end
    L39_466 = tonumber
    L40_467 = A27_454
    L39_466 = L39_466(L40_467)
    L40_467 = WHITE
    if L39_466 ~= L40_467 then
      L40_467 = RED
      if L39_466 ~= L40_467 then
        L40_467 = GREEN
        if L39_466 ~= L40_467 then
          L40_467 = BLUE
          if L39_466 ~= L40_467 then
            L40_467 = BLACK
            if L39_466 ~= L40_467 then
              L40_467 = _UPVALUE2_
              L40_467 = L40_467.LOGIN_PROFILE_FOOTER_FONT_COLOR_INVALID
              return L40_467
            end
          end
        end
      end
    end
  end
  L38_465 = NIL
  if A28_455 == L38_465 or A28_455 == "" then
    L38_465 = _UPVALUE2_
    L38_465 = L38_465.LOGIN_PROFILE_MOBILE_REDIRECTION_NIL
    return L38_465
  end
  L38_465 = _UPVALUE3_
  L38_465 = L38_465.isBoolean
  L39_466 = A28_455
  L38_465 = L38_465(L39_466)
  valid = L38_465
  L38_465 = valid
  L39_466 = _UPVALUE1_
  L39_466 = L39_466.SUCCESS
  if L38_465 ~= L39_466 then
    L38_465 = _UPVALUE2_
    L38_465 = L38_465.LOGIN_PROFILE_MOBILE_REDIRECTION_INVALID
    return L38_465
  end
  L38_465 = getMaxProfileId
  L39_466 = loginprofileTable
  L40_467 = attribute
  L40_467 = L40_467.profileId
  L39_466 = L38_465(L39_466, L40_467)
  L40_467 = _UPVALUE1_
  L40_467 = L40_467.SUCCESS
  if L38_465 ~= L40_467 then
    return L38_465
  end
  L39_466 = L39_466 + 1
  L40_467 = {}
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.profileId
  L40_467[L41_468] = L39_466
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.profileName
  L40_467[L41_468] = A1_428
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.pageTitle
  L40_467[L41_468] = A2_429
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.pageBackgroundType
  L40_467[L41_468] = A3_430
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.pageBackgroundImgIndex
  L40_467[L41_468] = A4_431
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.pageBackgroundColor
  L40_467[L41_468] = A5_432
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.pageCustomColor
  L40_467[L41_468] = A6_433
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.headerBackgroundType
  L40_467[L41_468] = A7_434
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.headerBackgroundImgIndex
  L40_467[L41_468] = A8_435
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.headerBackgroundColor
  L40_467[L41_468] = A9_436
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.headerBackgroundCustomColor
  L40_467[L41_468] = A10_437
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.headerCaptionFontFace
  L40_467[L41_468] = A11_438
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.headerCaptionFontSize
  L40_467[L41_468] = A12_439
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.headerCaption
  L40_467[L41_468] = A13_440
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.headerCaptionFontColor
  L40_467[L41_468] = A14_441
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.loginSectionTitle
  L40_467[L41_468] = A15_442
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.welcomeMessage
  L40_467[L41_468] = A16_443
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.errorMessage
  L40_467[L41_468] = A17_444
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.messagesFontColor
  L40_467[L41_468] = A18_445
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.showAdvertisement
  L40_467[L41_468] = A19_446
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.advertisementContent
  L40_467[L41_468] = A20_447
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.advertisementAlignment
  L40_467[L41_468] = A21_448
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.advertisementFontType
  L40_467[L41_468] = A22_449
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.advertisementFontSize
  L40_467[L41_468] = A23_450
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.advertisementFontColor
  L40_467[L41_468] = A24_451
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.showFooter
  L40_467[L41_468] = A25_452
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.footerContent
  L40_467[L41_468] = A26_453
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.footerFontColor
  L40_467[L41_468] = A27_454
  L41_468 = loginprofileTable
  L42_469 = "."
  L41_468 = L41_468 .. L42_469 .. attribute.mobileRedirection
  L40_467[L41_468] = A28_455
  L41_468 = db
  L41_468 = L41_468.insert
  L42_469 = loginprofileTable
  L41_468 = L41_468(L42_469, L40_467)
  L42_469 = NIL
  if L41_468 == L42_469 then
    L42_469 = _UPVALUE1_
    L42_469 = L42_469.FAILURE
    return L42_469
  end
  L42_469 = db
  L42_469 = L42_469.getAttribute
  L42_469 = L42_469(loginprofileTable, attribute.profileName, A1_428, ROWID)
  if L42_469 == NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L42_469
end
function loginProfileDelete(A0_470)
  local L1_471, L2_472, L3_473, L4_474, L5_475, L6_476
  L1_471 = NIL
  if A0_470 == L1_471 then
    L1_471 = _UPVALUE0_
    L1_471 = L1_471.INVALID_ARGUMENT
    return L1_471
  end
  L1_471 = cookieValidate
  L2_472 = ROWID
  L3_473 = A0_470
  L4_474 = loginprofileTable
  L2_472 = L1_471(L2_472, L3_473, L4_474)
  L3_473 = _UPVALUE0_
  L3_473 = L3_473.SUCCESS
  if L1_471 ~= L3_473 then
    return L1_471
  end
  L3_473 = _UPVALUE1_
  if L2_472 == L3_473 then
    L3_473 = _UPVALUE2_
    L3_473 = L3_473.LOGIN_PROFILE_DEFAULT_GROUP_DEL_ERROR
    return L3_473
  end
  L3_473 = db
  L3_473 = L3_473.getAttribute
  L4_474 = loginprofileTable
  L5_475 = ROWID
  L6_476 = L2_472
  L3_473 = L3_473(L4_474, L5_475, L6_476, attribute.profileId)
  L4_474 = db
  L4_474 = L4_474.getAttribute
  L5_475 = captivePortalVlanTable
  L6_476 = attribute
  L6_476 = L6_476.profileId
  L4_474 = L4_474(L5_475, L6_476, L3_473, attribute.vlanId)
  L5_475 = db
  L5_475 = L5_475.getAttribute
  L6_476 = loginprofileTable
  L5_475 = L5_475(L6_476, attribute.profileId, L3_473, attribute.profileName)
  L6_476 = nil
  if HIGH_SEC == "HIGH" then
    L6_476 = db.getRow(sslvpnPortalLayoutTable, attribute.sslvpnProfileName, L5_475)
    if L4_474 ~= nil or L6_476 ~= nil then
      return _UPVALUE2_.LOGIN_PROFILE_USED_GROUP_DEL_ERROR
    end
  elseif L4_474 ~= nil then
    return _UPVALUE2_.LOGIN_PROFILE_USED_GROUP_DEL_ERROR
  end
  if db.deleteRow(loginprofileTable, ROWID, L2_472) == NIL then
    return _UPVALUE0_.FAILURE, L2_472
  end
  return _UPVALUE0_.SUCCESS, L2_472
end
function loginProfilesGetAll()
  local L0_477, L1_478, L2_479, L3_480, L4_481, L5_482, L6_483, L7_484, L8_485, L9_486
  L0_477 = db
  L0_477 = L0_477.getTable
  L0_477 = L0_477(L1_478)
  if L1_478 == L2_479 then
    return L1_478
  end
  for L4_481, L5_482 in L1_478(L2_479) do
    L6_483 = ""
    profileStatus = L6_483
    L6_483 = "profileId = "
    L7_484 = L0_477[L4_481]
    L8_485 = loginprofileTable
    L9_486 = "."
    L8_485 = L8_485 .. L9_486 .. attribute.profileId
    L7_484 = L7_484[L8_485]
    L8_485 = " and accessType > 1 "
    L6_483 = L6_483 .. L7_484 .. L8_485
    L7_484 = db
    L7_484 = L7_484.getRowsWhere
    L8_485 = captivePortalVlanTable
    L9_486 = L6_483
    L7_484 = L7_484(L8_485, L9_486)
    L8_485 = L0_477[L4_481]
    L9_486 = loginprofileTable
    L9_486 = L9_486 .. "." .. attribute.profileName
    L8_485 = L8_485[L9_486]
    L9_486 = {}
    if HIGH_SEC == "HIGH" then
      L9_486 = db.getRows(sslvpnPortalLayoutTable, attribute.sslvpnProfileName, L8_485)
    end
    if #L7_484 ~= 0 or #L9_486 ~= 0 then
      for _FORV_13_, _FORV_14_ in pairs(L7_484) do
        if profileStatus == "" then
          profileStatus = "VLAN" .. _FORV_14_[captivePortalVlanTable .. "." .. attribute.vlanId]
        else
          profileStatus = profileStatus .. ",VLAN" .. _FORV_14_[captivePortalVlanTable .. "." .. attribute.vlanId]
        end
      end
      if HIGH_SEC == "HIGH" and #L9_486 ~= 0 then
        for _FORV_13_, _FORV_14_ in pairs(L9_486) do
          if profileStatus == "" then
            profileStatus = _FORV_14_[sslvpnPortalLayoutTable .. "." .. attribute.portalLayoutName]
          else
            profileStatus = profileStatus .. "," .. _FORV_14_[sslvpnPortalLayoutTable .. "." .. attribute.portalLayoutName]
          end
        end
      end
    elseif HIGH_SEC == "HIGH" and #L9_486 ~= 0 then
      for _FORV_13_, _FORV_14_ in pairs(L9_486) do
        if profileStatus == "" then
          profileStatus = _FORV_14_[sslvpnPortalLayoutTable .. "." .. attribute.portalLayoutName]
        else
          profileStatus = profileStatus .. "," .. _FORV_14_[sslvpnPortalLayoutTable .. "." .. attribute.portalLayoutName]
        end
      end
    else
      profileStatus = "Not In Use"
    end
    L0_477[L4_481][loginprofileTable .. "." .. attribute.profileStatus] = profileStatus
  end
  return L1_478, L2_479
end
function loginProfileGetRow(A0_487)
  local L1_488
  L1_488 = db
  L1_488 = L1_488.getRow
  L1_488 = L1_488(loginprofileTable, ROWID, A0_487)
  if L1_488 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_487, L1_488
end
function loginProfileDeleteAll()
  local L0_489, L1_490, L2_491, L3_492, L4_493, L5_494, L6_495, L7_496, L8_497, L9_498
  L0_489 = ROWID
  L1_490 = " NOT IN (SELECT "
  L2_491 = ROWID
  L6_495 = ROWID
  L7_496 = " = '1' )"
  L0_489 = L0_489 .. L1_490 .. L2_491 .. L3_492 .. L4_493 .. L5_494 .. L6_495 .. L7_496
  L1_490 = nil
  L2_491 = db
  L2_491 = L2_491.getTable
  L2_491 = L2_491(L3_492)
  for L6_495, L7_496 in L3_492(L4_493) do
    L8_497 = L2_491[L6_495]
    L9_498 = loginprofileTable
    L9_498 = L9_498 .. "." .. attribute.profileId
    L8_497 = L8_497[L9_498]
    profileId = L8_497
    L8_497 = profileId
    L9_498 = _UPVALUE0_
    if L8_497 ~= L9_498 then
      L8_497 = db
      L8_497 = L8_497.getAttribute
      L9_498 = captivePortalVlanTable
      L8_497 = L8_497(L9_498, attribute.profileId, profileId, attribute.vlanId)
      L9_498 = db
      L9_498 = L9_498.getAttribute
      L9_498 = L9_498(loginprofileTable, attribute.profileId, profileId, attribute.profileName)
      if HIGH_SEC == "HIGH" then
        L1_490 = db.getRow(sslvpnPortalLayoutTable, attribute.sslvpnProfileName, L9_498)
        if L8_497 ~= nil or L1_490 ~= nil then
          return _UPVALUE1_.LOGIN_PROFILE_USED_GROUP_DEL_ERROR
        end
      elseif L8_497 ~= nil then
        return _UPVALUE1_.LOGIN_PROFILE_USED_GROUP_DEL_ERROR
      end
    end
  end
  if L3_492 == L4_493 then
    return L4_493, L5_494
  end
  return L4_493, L5_494
end
function backgroundImageUpload(A0_499, A1_500, A2_501, A3_502)
  local L4_503, L5_504, L6_505, L7_506, L8_507
  L4_503 = NIL
  if A0_499 ~= L4_503 then
    L4_503 = NIL
    if A1_500 ~= L4_503 then
      L4_503 = NIL
      if A2_501 ~= L4_503 then
        L4_503 = NIL
      end
    end
  elseif A3_502 == L4_503 then
    L4_503 = _UPVALUE0_
    L4_503 = L4_503.INVALID_ARGUMENT
    return L4_503
  end
  L4_503 = tonumber
  L5_504 = A2_501
  L4_503 = L4_503(L5_504)
  if L4_503 > 50000 then
    L4_503 = os
    L4_503 = L4_503.remove
    L5_504 = "/tmp/"
    L6_505 = A0_499
    L5_504 = L5_504 .. L6_505
    L4_503(L5_504)
    L4_503 = _UPVALUE1_
    L4_503 = L4_503.LOGIN_PROFILE_IMAGE_SIZE_EXCEED
    return L4_503
  end
  L4_503 = captivePortalLib
  L4_503 = L4_503.extensionGet
  L5_504 = A1_500
  L4_503 = L4_503(L5_504)
  L5_504 = "pageBackgroundImage"
  L6_505 = A3_502
  L7_506 = "."
  L8_507 = L4_503
  L5_504 = L5_504 .. L6_505 .. L7_506 .. L8_507
  L6_505 = db
  L6_505 = L6_505.getAttribute
  L7_506 = "pageBackgroundImage"
  L8_507 = "_ROWID_"
  L6_505 = L6_505(L7_506, L8_507, A3_502, "imageName")
  L7_506 = os
  L7_506 = L7_506.remove
  L8_507 = "/flash/tmp/capPort/"
  L8_507 = L8_507 .. L6_505
  L7_506(L8_507)
  L7_506 = nil
  L8_507 = util
  L8_507 = L8_507.runShellCmd
  L8_507 = L8_507("mv" .. " " .. "/tmp/" .. A0_499 .. " /flash/tmp/capPort/" .. L5_504)
  L7_506 = L8_507
  L8_507 = {}
  L8_507[pageBackgroundImageTable .. "." .. attribute.bgImageName] = L5_504
  L8_507[pageBackgroundImageTable .. "." .. attribute.bgEnableStatus] = "1"
  L7_506 = L7_506 and db.update(pageBackgroundImageTable, L8_507, A3_502)
  if L7_506 then
    return _UPVALUE0_.SUCCESS, L5_504
  else
    return _UPVALUE0_.FAILURE
  end
end
function headerImageUpload(A0_508, A1_509, A2_510, A3_511)
  local L4_512, L5_513, L6_514, L7_515, L8_516, L9_517, L10_518, L11_519
  L4_512 = NIL
  if A0_508 ~= L4_512 then
    L4_512 = NIL
    if A1_509 ~= L4_512 then
      L4_512 = NIL
      if A2_510 ~= L4_512 then
        L4_512 = NIL
      end
    end
  elseif A3_511 == L4_512 then
    L4_512 = _UPVALUE0_
    L4_512 = L4_512.INVALID_ARGUMENT
    return L4_512
  end
  L4_512 = tonumber
  L5_513 = A2_510
  L4_512 = L4_512(L5_513)
  if L4_512 > 50000 then
    L4_512 = os
    L4_512 = L4_512.remove
    L5_513 = "/tmp/"
    L6_514 = A0_508
    L5_513 = L5_513 .. L6_514
    L4_512(L5_513)
    L4_512 = _UPVALUE1_
    L4_512 = L4_512.LOGIN_PROFILE_IMAGE_SIZE_EXCEED
    return L4_512
  end
  L4_512, L5_513 = nil, nil
  L6_514 = _UPVALUE2_
  L6_514 = L6_514.countryCodeGet
  L8_516 = L6_514()
  COUNTRY_CODE = L8_516
  L5_513 = L7_515
  L4_512 = L6_514
  L6_514 = captivePortalLib
  L6_514 = L6_514.extensionGet
  L7_515 = A1_509
  L6_514 = L6_514(L7_515)
  L7_515 = "image"
  L8_516 = A3_511
  L9_517 = "."
  L10_518 = L6_514
  L7_515 = L7_515 .. L8_516 .. L9_517 .. L10_518
  L8_516 = db
  L8_516 = L8_516.getAttribute
  L9_517 = headerBackgroundImageTable
  L10_518 = ROWID
  L11_519 = A3_511
  L8_516 = L8_516(L9_517, L10_518, L11_519, attribute.hdImageName)
  L9_517 = os
  L9_517 = L9_517.remove
  L10_518 = "/flash/tmp/capPort/"
  L11_519 = L8_516
  L10_518 = L10_518 .. L11_519
  L9_517(L10_518)
  L9_517 = COUNTRY_CODE
  if L9_517 ~= "RU" then
    L9_517 = os
    L9_517 = L9_517.remove
    L10_518 = "/flash/tmp/login/"
    L11_519 = L8_516
    L10_518 = L10_518 .. L11_519
    L9_517(L10_518)
  end
  L9_517 = nil
  L10_518 = util
  L10_518 = L10_518.runShellCmd
  L11_519 = "mv"
  L11_519 = L11_519 .. " " .. "/tmp/" .. A0_508 .. " /flash/tmp/capPort/" .. L7_515
  L10_518 = L10_518(L11_519)
  L9_517 = L10_518
  L10_518 = COUNTRY_CODE
  if L10_518 ~= "RU" and L9_517 then
    L10_518 = util
    L10_518 = L10_518.runShellCmd
    L11_519 = "ln -s "
    L11_519 = L11_519 .. "/flash/tmp/capPort/" .. L7_515 .. " /flash/tmp/login/" .. L7_515
    L10_518 = L10_518(L11_519)
    L9_517 = L10_518
  end
  L10_518 = {}
  L11_519 = headerBackgroundImageTable
  L11_519 = L11_519 .. "." .. attribute.hdImageName
  L10_518[L11_519] = L7_515
  L11_519 = headerBackgroundImageTable
  L11_519 = L11_519 .. "." .. attribute.hdValue
  L10_518[L11_519] = "1"
  if L9_517 then
    L11_519 = db
    L11_519 = L11_519.update
    L11_519 = L11_519(headerBackgroundImageTable, L10_518, A3_511)
    L9_517 = L11_519
  end
  L11_519 = COUNTRY_CODE
  if L11_519 ~= "RU" then
    L11_519 = {}
    L11_519[loginImageDetailsTable .. "." .. attribute.hdImageName] = L7_515
    L11_519[loginImageDetailsTable .. "." .. attribute.hdValue] = "1"
    L9_517 = L9_517 and db.update(loginImageDetailsTable, L11_519, A3_511)
  end
  if L9_517 then
    L11_519 = _UPVALUE0_
    L11_519 = L11_519.SUCCESS
    return L11_519, L7_515
  else
    L11_519 = _UPVALUE0_
    L11_519 = L11_519.FAILURE
    return L11_519
  end
end
function pageBackgroundImageGetAll()
  local L0_520
  L0_520 = db
  L0_520 = L0_520.getTable
  L0_520 = L0_520(pageBackgroundImageTable)
  if L0_520 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_520
end
function headerImageGetAll()
  local L0_521
  L0_521 = db
  L0_521 = L0_521.getTable
  L0_521 = L0_521(headerBackgroundImageTable)
  if L0_521 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_521
end
function loginProfileGetDefaults()
  local L0_522
  L0_522 = db
  L0_522 = L0_522.getDefaults
  L0_522 = L0_522(true, loginprofileTable)
  if L0_522 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_522
end
