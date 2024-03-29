local L0_0
L0_0 = module
L0_0("com.teamf1.core.sslvpn.portallayout", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/user-management_groups")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/sslvpn_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.sslvpn.returnCodes")
portallayoutTable = "SSLVPNPortalLayout"
loginProfileTable = "LoginProfiles"
;({}).portalLayoutName = "PortalLayoutName"
;({}).defaultPortal = "DefaultPortal"
;({}).siteTitle = "PortalSiteTitle"
;({}).bannerTitle = "BannerTitle"
;({}).bannerMessage = "BannerMessage"
;({}).portalBanner = "DisplayBanner"
;({}).HTTPMetaTags = "EnableHTTPMetaTags"
;({}).activeXWebCacheCleaner = "EnableActiveXWebCacheCleaner"
;({}).VPNTunnel = "EnableVPNTunnel"
;({}).portForwarding = "EnablePortForwarding"
;({}).useCount = "UseCount"
;({}).portalURL = "PortalURL"
;({}).profileName = "profileName"
;({}).loginProfileName = "configurationName"
;({}).logicalIfname = "LogicalIfName"
;({}).interface = "WAN1"
;({}).ipAddr = "ipaddr"
;({}).accessMgmt = "accessMgmtEnable"
;({}).serviceType = "serviceType"
;({}).port = "port"
SERVICE_REMOTE = "0"
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
else
end
function portalLayoutNameGet()
  local L0_1, L1_2
  L0_1 = db
  L0_1 = L0_1.getNextRowId
  L1_2 = _UPVALUE0_
  L0_1 = L0_1(L1_2, portallayoutTable)
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(portallayoutTable, _UPVALUE1_, L0_1, _UPVALUE2_.portalLayoutName)
  if L1_2 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_1, L1_2
end
function portalLayoutNameGetNext(A0_3)
  local L1_4, L2_5
  L1_4 = _UPVALUE0_
  L1_4 = L1_4.NIL
  if A0_3 ~= L1_4 then
    L1_4 = tonumber
    L2_5 = A0_3
    L1_4 = L1_4(L2_5)
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.NIL
  elseif L1_4 == L2_5 then
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.INVALID_ARGUMENT
    return L1_4
  end
  L1_4 = db
  L1_4 = L1_4.existsRow
  L2_5 = portallayoutTable
  L1_4 = L1_4(L2_5, _UPVALUE1_, A0_3)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.FALSE
  if L1_4 == L2_5 then
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.INVALID_ARGUMENT
    return L1_4
  end
  L1_4 = db
  L1_4 = L1_4.getNextRowId
  L2_5 = A0_3
  L1_4 = L1_4(L2_5, portallayoutTable)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if L1_4 == L2_5 then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.NOT_EXIST
    return L2_5
  end
  L2_5 = db
  L2_5 = L2_5.getAttribute
  L2_5 = L2_5(portallayoutTable, _UPVALUE1_, L1_4, _UPVALUE2_.portalLayoutName)
  if L2_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L2_5
end
function portalLayoutNameSet(A0_6, A1_7)
  if A0_6 == _UPVALUE0_.NIL or tonumber(A0_6) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(portallayoutTable, _UPVALUE1_, A0_6) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_7 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(portallayoutTable, _UPVALUE1_, A0_6, _UPVALUE2_.portalLayoutName, A1_7) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_6
  end
  return _UPVALUE0_.SUCCESS, A0_6
end
function portalLayoutNameDelete(A0_8, A1_9)
  local L3_10
  L3_10 = _UPVALUE0_
  L3_10 = L3_10.NOT_SUPPORTED
  return L3_10, A0_8
end
function defaultPortalGet()
  local L0_11, L1_12
  L0_11 = db
  L0_11 = L0_11.getNextRowId
  L1_12 = _UPVALUE0_
  L0_11 = L0_11(L1_12, portallayoutTable)
  L1_12 = db
  L1_12 = L1_12.getAttribute
  L1_12 = L1_12(portallayoutTable, _UPVALUE1_, L0_11, _UPVALUE2_.defaultPortal)
  if L1_12 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_11, L1_12
end
function defaultPortalGetNext(A0_13)
  local L1_14, L2_15
  L1_14 = _UPVALUE0_
  L1_14 = L1_14.NIL
  if A0_13 ~= L1_14 then
    L1_14 = tonumber
    L2_15 = A0_13
    L1_14 = L1_14(L2_15)
    L2_15 = _UPVALUE0_
    L2_15 = L2_15.NIL
  elseif L1_14 == L2_15 then
    L1_14 = _UPVALUE0_
    L1_14 = L1_14.INVALID_ARGUMENT
    return L1_14
  end
  L1_14 = db
  L1_14 = L1_14.existsRow
  L2_15 = portallayoutTable
  L1_14 = L1_14(L2_15, _UPVALUE1_, A0_13)
  L2_15 = _UPVALUE0_
  L2_15 = L2_15.FALSE
  if L1_14 == L2_15 then
    L1_14 = _UPVALUE0_
    L1_14 = L1_14.INVALID_ARGUMENT
    return L1_14
  end
  L1_14 = db
  L1_14 = L1_14.getNextRowId
  L2_15 = A0_13
  L1_14 = L1_14(L2_15, portallayoutTable)
  L2_15 = _UPVALUE0_
  L2_15 = L2_15.NIL
  if L1_14 == L2_15 then
    L2_15 = _UPVALUE0_
    L2_15 = L2_15.NOT_EXIST
    return L2_15
  end
  L2_15 = db
  L2_15 = L2_15.getAttribute
  L2_15 = L2_15(portallayoutTable, _UPVALUE1_, L1_14, _UPVALUE2_.defaultPortal)
  if L2_15 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_14
  end
  return _UPVALUE0_.SUCCESS, L1_14, L2_15
end
function defaultPortalSet(A0_16, A1_17)
  if A0_16 == _UPVALUE0_.NIL or tonumber(A0_16) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(portallayoutTable, _UPVALUE1_, A0_16) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_17 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_17) ~= 0 and tonumber(A1_17) ~= 1 and tonumber(A1_17) ~= 2 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(portallayoutTable, _UPVALUE1_, A0_16, _UPVALUE2_.defaultPortal, A1_17) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_16
  end
  return _UPVALUE0_.SUCCESS, A0_16
end
function siteTitleGet()
  local L0_18, L1_19
  L0_18 = db
  L0_18 = L0_18.getNextRowId
  L1_19 = _UPVALUE0_
  L0_18 = L0_18(L1_19, portallayoutTable)
  L1_19 = db
  L1_19 = L1_19.getAttribute
  L1_19 = L1_19(portallayoutTable, _UPVALUE1_, L0_18, _UPVALUE2_.siteTitle)
  if L1_19 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_18, L1_19
end
function siteTitleGetNext(A0_20)
  local L1_21, L2_22
  L1_21 = _UPVALUE0_
  L1_21 = L1_21.NIL
  if A0_20 ~= L1_21 then
    L1_21 = tonumber
    L2_22 = A0_20
    L1_21 = L1_21(L2_22)
    L2_22 = _UPVALUE0_
    L2_22 = L2_22.NIL
  elseif L1_21 == L2_22 then
    L1_21 = _UPVALUE0_
    L1_21 = L1_21.INVALID_ARGUMENT
    return L1_21
  end
  L1_21 = db
  L1_21 = L1_21.existsRow
  L2_22 = portallayoutTable
  L1_21 = L1_21(L2_22, _UPVALUE1_, A0_20)
  L2_22 = _UPVALUE0_
  L2_22 = L2_22.FALSE
  if L1_21 == L2_22 then
    L1_21 = _UPVALUE0_
    L1_21 = L1_21.INVALID_ARGUMENT
    return L1_21
  end
  L1_21 = db
  L1_21 = L1_21.getNextRowId
  L2_22 = A0_20
  L1_21 = L1_21(L2_22, portallayoutTable)
  L2_22 = _UPVALUE0_
  L2_22 = L2_22.NIL
  if L1_21 == L2_22 then
    L2_22 = _UPVALUE0_
    L2_22 = L2_22.NOT_EXIST
    return L2_22
  end
  L2_22 = db
  L2_22 = L2_22.getAttribute
  L2_22 = L2_22(portallayoutTable, _UPVALUE1_, L1_21, _UPVALUE2_.siteTitle)
  if L2_22 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_21
  end
  return _UPVALUE0_.SUCCESS, L1_21, L2_22
end
function siteTitleSet(A0_23, A1_24)
  if A0_23 == _UPVALUE0_.NIL or tonumber(A0_23) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(portallayoutTable, _UPVALUE1_, A0_23) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_24 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(portallayoutTable, _UPVALUE1_, A0_23, _UPVALUE2_.siteTitle, A1_24) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_23
  end
  return _UPVALUE0_.SUCCESS, A0_23
end
function bannerTitleGet()
  local L0_25, L1_26
  L0_25 = db
  L0_25 = L0_25.getNextRowId
  L1_26 = _UPVALUE0_
  L0_25 = L0_25(L1_26, portallayoutTable)
  L1_26 = db
  L1_26 = L1_26.getAttribute
  L1_26 = L1_26(portallayoutTable, _UPVALUE1_, L0_25, _UPVALUE2_.bannerTitle)
  if L1_26 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_25, L1_26
end
function bannerTitleGetNext(A0_27)
  local L1_28, L2_29
  L1_28 = _UPVALUE0_
  L1_28 = L1_28.NIL
  if A0_27 ~= L1_28 then
    L1_28 = tonumber
    L2_29 = A0_27
    L1_28 = L1_28(L2_29)
    L2_29 = _UPVALUE0_
    L2_29 = L2_29.NIL
  elseif L1_28 == L2_29 then
    L1_28 = _UPVALUE0_
    L1_28 = L1_28.INVALID_ARGUMENT
    return L1_28
  end
  L1_28 = db
  L1_28 = L1_28.existsRow
  L2_29 = portallayoutTable
  L1_28 = L1_28(L2_29, _UPVALUE1_, A0_27)
  L2_29 = _UPVALUE0_
  L2_29 = L2_29.FALSE
  if L1_28 == L2_29 then
    L1_28 = _UPVALUE0_
    L1_28 = L1_28.INVALID_ARGUMENT
    return L1_28
  end
  L1_28 = db
  L1_28 = L1_28.getNextRowId
  L2_29 = A0_27
  L1_28 = L1_28(L2_29, portallayoutTable)
  L2_29 = _UPVALUE0_
  L2_29 = L2_29.NIL
  if L1_28 == L2_29 then
    L2_29 = _UPVALUE0_
    L2_29 = L2_29.NOT_EXIST
    return L2_29
  end
  L2_29 = db
  L2_29 = L2_29.getAttribute
  L2_29 = L2_29(portallayoutTable, _UPVALUE1_, L1_28, _UPVALUE2_.bannerTitle)
  if L2_29 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_28
  end
  return _UPVALUE0_.SUCCESS, L1_28, L2_29
end
function bannerTitleSet(A0_30, A1_31)
  if A0_30 == _UPVALUE0_.NIL or tonumber(A0_30) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(portallayoutTable, _UPVALUE1_, A0_30) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_31 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(portallayoutTable, _UPVALUE1_, A0_30, _UPVALUE2_.bannerTitle, A1_31) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_30
  end
  return _UPVALUE0_.SUCCESS, A0_30
end
function bannerMessageGet()
  local L0_32, L1_33
  L0_32 = db
  L0_32 = L0_32.getNextRowId
  L1_33 = _UPVALUE0_
  L0_32 = L0_32(L1_33, portallayoutTable)
  L1_33 = db
  L1_33 = L1_33.getAttribute
  L1_33 = L1_33(portallayoutTable, _UPVALUE1_, L0_32, _UPVALUE2_.bannerMessage)
  if L1_33 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_32, L1_33
end
function bannerMessageGetNext(A0_34)
  local L1_35, L2_36
  L1_35 = _UPVALUE0_
  L1_35 = L1_35.NIL
  if A0_34 ~= L1_35 then
    L1_35 = tonumber
    L2_36 = A0_34
    L1_35 = L1_35(L2_36)
    L2_36 = _UPVALUE0_
    L2_36 = L2_36.NIL
  elseif L1_35 == L2_36 then
    L1_35 = _UPVALUE0_
    L1_35 = L1_35.INVALID_ARGUMENT
    return L1_35
  end
  L1_35 = db
  L1_35 = L1_35.existsRow
  L2_36 = portallayoutTable
  L1_35 = L1_35(L2_36, _UPVALUE1_, A0_34)
  L2_36 = _UPVALUE0_
  L2_36 = L2_36.FALSE
  if L1_35 == L2_36 then
    L1_35 = _UPVALUE0_
    L1_35 = L1_35.INVALID_ARGUMENT
    return L1_35
  end
  L1_35 = db
  L1_35 = L1_35.getNextRowId
  L2_36 = A0_34
  L1_35 = L1_35(L2_36, portallayoutTable)
  L2_36 = _UPVALUE0_
  L2_36 = L2_36.NIL
  if L1_35 == L2_36 then
    L2_36 = _UPVALUE0_
    L2_36 = L2_36.NOT_EXIST
    return L2_36
  end
  L2_36 = db
  L2_36 = L2_36.getAttribute
  L2_36 = L2_36(portallayoutTable, _UPVALUE1_, L1_35, _UPVALUE2_.bannerMessage)
  if L2_36 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_35
  end
  return _UPVALUE0_.SUCCESS, L1_35, L2_36
end
function bannerMessageSet(A0_37, A1_38)
  if A0_37 == _UPVALUE0_.NIL or tonumber(A0_37) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(portallayoutTable, _UPVALUE1_, A0_37) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_38 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(portallayoutTable, _UPVALUE1_, A0_37, _UPVALUE2_.bannerMessage, A1_38) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_37
  end
  return _UPVALUE0_.SUCCESS, A0_37
end
function isportalBannerEnabled()
  local L0_39, L1_40
  L0_39 = db
  L0_39 = L0_39.getNextRowId
  L1_40 = _UPVALUE0_
  L0_39 = L0_39(L1_40, portallayoutTable)
  L1_40 = db
  L1_40 = L1_40.getAttribute
  L1_40 = L1_40(portallayoutTable, _UPVALUE1_, L0_39, _UPVALUE2_.portalBanner)
  if L1_40 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_39, L1_40
end
function isportalBannerEnabledNext(A0_41)
  local L1_42, L2_43
  L1_42 = _UPVALUE0_
  L1_42 = L1_42.NIL
  if A0_41 ~= L1_42 then
    L1_42 = tonumber
    L2_43 = A0_41
    L1_42 = L1_42(L2_43)
    L2_43 = _UPVALUE0_
    L2_43 = L2_43.NIL
  elseif L1_42 == L2_43 then
    L1_42 = _UPVALUE0_
    L1_42 = L1_42.INVALID_ARGUMENT
    return L1_42
  end
  L1_42 = db
  L1_42 = L1_42.existsRow
  L2_43 = portallayoutTable
  L1_42 = L1_42(L2_43, _UPVALUE1_, A0_41)
  L2_43 = _UPVALUE0_
  L2_43 = L2_43.FALSE
  if L1_42 == L2_43 then
    L1_42 = _UPVALUE0_
    L1_42 = L1_42.INVALID_ARGUMENT
    return L1_42
  end
  L1_42 = db
  L1_42 = L1_42.getNextRowId
  L2_43 = A0_41
  L1_42 = L1_42(L2_43, portallayoutTable)
  L2_43 = _UPVALUE0_
  L2_43 = L2_43.NIL
  if L1_42 == L2_43 then
    L2_43 = _UPVALUE0_
    L2_43 = L2_43.NOT_EXIST
    return L2_43
  end
  L2_43 = db
  L2_43 = L2_43.getAttribute
  L2_43 = L2_43(portallayoutTable, _UPVALUE1_, L1_42, _UPVALUE2_.portalBanner)
  if L2_43 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_42
  end
  return _UPVALUE0_.SUCCESS, L1_42, L2_43
end
function portalBannerEnable(A0_44)
  if A0_44 == _UPVALUE0_.NIL or tonumber(A0_44) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(portallayoutTable, _UPVALUE1_, A0_44) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(portallayoutTable, _UPVALUE1_, A0_44, _UPVALUE2_.portalBanner, _UPVALUE3_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_44
  end
  return _UPVALUE0_.SUCCESS, A0_44
end
function portalBannerDisable(A0_45)
  if A0_45 == _UPVALUE0_.NIL or tonumber(A0_45) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(portallayoutTable, _UPVALUE1_, A0_45) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(portallayoutTable, _UPVALUE1_, A0_45, _UPVALUE2_.portalBanner, _UPVALUE3_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_45
  end
  return _UPVALUE0_.SUCCESS, A0_45
end
function isHTTPMetaTagsEnabled()
  local L0_46, L1_47
  L0_46 = db
  L0_46 = L0_46.getNextRowId
  L1_47 = _UPVALUE0_
  L0_46 = L0_46(L1_47, portallayoutTable)
  L1_47 = db
  L1_47 = L1_47.getAttribute
  L1_47 = L1_47(portallayoutTable, _UPVALUE1_, L0_46, _UPVALUE2_.HTTPMetaTags)
  if L1_47 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_46, L1_47
end
function isHTTPMetaTagsEnabledNext(A0_48)
  local L1_49, L2_50
  L1_49 = _UPVALUE0_
  L1_49 = L1_49.NIL
  if A0_48 ~= L1_49 then
    L1_49 = tonumber
    L2_50 = A0_48
    L1_49 = L1_49(L2_50)
    L2_50 = _UPVALUE0_
    L2_50 = L2_50.NIL
  elseif L1_49 == L2_50 then
    L1_49 = _UPVALUE0_
    L1_49 = L1_49.INVALID_ARGUMENT
    return L1_49
  end
  L1_49 = db
  L1_49 = L1_49.existsRow
  L2_50 = portallayoutTable
  L1_49 = L1_49(L2_50, _UPVALUE1_, A0_48)
  L2_50 = _UPVALUE0_
  L2_50 = L2_50.FALSE
  if L1_49 == L2_50 then
    L1_49 = _UPVALUE0_
    L1_49 = L1_49.INVALID_ARGUMENT
    return L1_49
  end
  L1_49 = db
  L1_49 = L1_49.getNextRowId
  L2_50 = A0_48
  L1_49 = L1_49(L2_50, portallayoutTable)
  L2_50 = _UPVALUE0_
  L2_50 = L2_50.NIL
  if L1_49 == L2_50 then
    L2_50 = _UPVALUE0_
    L2_50 = L2_50.NOT_EXIST
    return L2_50
  end
  L2_50 = db
  L2_50 = L2_50.getAttribute
  L2_50 = L2_50(portallayoutTable, _UPVALUE1_, L1_49, _UPVALUE2_.HTTPMetaTags)
  if L2_50 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_49
  end
  return _UPVALUE0_.SUCCESS, L1_49, L2_50
end
function HTTPMetaTagsEnable(A0_51)
  if A0_51 == _UPVALUE0_.NIL or tonumber(A0_51) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(portallayoutTable, _UPVALUE1_, A0_51) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(portallayoutTable, _UPVALUE1_, A0_51, _UPVALUE2_.HTTPMetaTags, _UPVALUE3_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_51
  end
  return _UPVALUE0_.SUCCESS, A0_51
end
function HTTPMetaTagsDisable(A0_52)
  if A0_52 == _UPVALUE0_.NIL or tonumber(A0_52) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(portallayoutTable, _UPVALUE1_, A0_52) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(portallayoutTable, _UPVALUE1_, A0_52, _UPVALUE2_.HTTPMetaTags, _UPVALUE3_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_52
  end
  return _UPVALUE0_.SUCCESS, A0_52
end
function isactiveXWebCacheCleanerEnabled()
  local L0_53, L1_54
  L0_53 = db
  L0_53 = L0_53.getNextRowId
  L1_54 = _UPVALUE0_
  L0_53 = L0_53(L1_54, portallayoutTable)
  L1_54 = db
  L1_54 = L1_54.getAttribute
  L1_54 = L1_54(portallayoutTable, _UPVALUE1_, L0_53, _UPVALUE2_.activeXWebCacheCleaner)
  if L1_54 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_53, L1_54
end
function isactiveXWebCacheCleanerEnabledNext(A0_55)
  local L1_56, L2_57
  L1_56 = _UPVALUE0_
  L1_56 = L1_56.NIL
  if A0_55 ~= L1_56 then
    L1_56 = tonumber
    L2_57 = A0_55
    L1_56 = L1_56(L2_57)
    L2_57 = _UPVALUE0_
    L2_57 = L2_57.NIL
  elseif L1_56 == L2_57 then
    L1_56 = _UPVALUE0_
    L1_56 = L1_56.INVALID_ARGUMENT
    return L1_56
  end
  L1_56 = db
  L1_56 = L1_56.existsRow
  L2_57 = portallayoutTable
  L1_56 = L1_56(L2_57, _UPVALUE1_, A0_55)
  L2_57 = _UPVALUE0_
  L2_57 = L2_57.FALSE
  if L1_56 == L2_57 then
    L1_56 = _UPVALUE0_
    L1_56 = L1_56.INVALID_ARGUMENT
    return L1_56
  end
  L1_56 = db
  L1_56 = L1_56.getNextRowId
  L2_57 = A0_55
  L1_56 = L1_56(L2_57, portallayoutTable)
  L2_57 = _UPVALUE0_
  L2_57 = L2_57.NIL
  if L1_56 == L2_57 then
    L2_57 = _UPVALUE0_
    L2_57 = L2_57.NOT_EXIST
    return L2_57
  end
  L2_57 = db
  L2_57 = L2_57.getAttribute
  L2_57 = L2_57(portallayoutTable, _UPVALUE1_, L1_56, _UPVALUE2_.activeXWebCacheCleaner)
  if L2_57 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_56
  end
  return _UPVALUE0_.SUCCESS, L1_56, L2_57
end
function activeXWebCacheCleanerEnable(A0_58)
  if A0_58 == _UPVALUE0_.NIL or tonumber(A0_58) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(portallayoutTable, _UPVALUE1_, A0_58) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(portallayoutTable, _UPVALUE1_, A0_58, _UPVALUE2_.activeXWebCacheCleaner, _UPVALUE3_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_58
  end
  return _UPVALUE0_.SUCCESS, A0_58
end
function activeXWebCacheCleanerDisable(A0_59)
  if A0_59 == _UPVALUE0_.NIL or tonumber(A0_59) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(portallayoutTable, _UPVALUE1_, A0_59) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(portallayoutTable, _UPVALUE1_, A0_59, _UPVALUE2_.activeXWebCacheCleaner, _UPVALUE3_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_59
  end
  return _UPVALUE0_.SUCCESS, A0_59
end
function isVPNTunnelEnabled()
  local L0_60, L1_61
  L0_60 = db
  L0_60 = L0_60.getNextRowId
  L1_61 = _UPVALUE0_
  L0_60 = L0_60(L1_61, portallayoutTable)
  L1_61 = db
  L1_61 = L1_61.getAttribute
  L1_61 = L1_61(portallayoutTable, _UPVALUE1_, L0_60, _UPVALUE2_.VPNTunnel)
  if L1_61 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_60, L1_61
end
function isVPNTunnelEnabledNext(A0_62)
  local L1_63, L2_64
  L1_63 = _UPVALUE0_
  L1_63 = L1_63.NIL
  if A0_62 ~= L1_63 then
    L1_63 = tonumber
    L2_64 = A0_62
    L1_63 = L1_63(L2_64)
    L2_64 = _UPVALUE0_
    L2_64 = L2_64.NIL
  elseif L1_63 == L2_64 then
    L1_63 = _UPVALUE0_
    L1_63 = L1_63.INVALID_ARGUMENT
    return L1_63
  end
  L1_63 = db
  L1_63 = L1_63.existsRow
  L2_64 = portallayoutTable
  L1_63 = L1_63(L2_64, _UPVALUE1_, A0_62)
  L2_64 = _UPVALUE0_
  L2_64 = L2_64.FALSE
  if L1_63 == L2_64 then
    L1_63 = _UPVALUE0_
    L1_63 = L1_63.INVALID_ARGUMENT
    return L1_63
  end
  L1_63 = db
  L1_63 = L1_63.getNextRowId
  L2_64 = A0_62
  L1_63 = L1_63(L2_64, portallayoutTable)
  L2_64 = _UPVALUE0_
  L2_64 = L2_64.NIL
  if L1_63 == L2_64 then
    L2_64 = _UPVALUE0_
    L2_64 = L2_64.NOT_EXIST
    return L2_64
  end
  L2_64 = db
  L2_64 = L2_64.getAttribute
  L2_64 = L2_64(portallayoutTable, _UPVALUE1_, L1_63, _UPVALUE2_.VPNTunnel)
  if L2_64 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_63
  end
  return _UPVALUE0_.SUCCESS, L1_63, L2_64
end
function VPNTunnelEnable(A0_65)
  if A0_65 == _UPVALUE0_.NIL or tonumber(A0_65) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(portallayoutTable, _UPVALUE1_, A0_65) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(portallayoutTable, _UPVALUE1_, A0_65, _UPVALUE2_.VPNTunnel, _UPVALUE3_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_65
  end
  return _UPVALUE0_.SUCCESS, A0_65
end
function VPNTunnelDisable(A0_66)
  if A0_66 == _UPVALUE0_.NIL or tonumber(A0_66) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(portallayoutTable, _UPVALUE1_, A0_66) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(portallayoutTable, _UPVALUE1_, A0_66, _UPVALUE2_.VPNTunnel, _UPVALUE3_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_66
  end
  return _UPVALUE0_.SUCCESS, A0_66
end
function isportForwardingEnabled()
  local L0_67, L1_68
  L0_67 = db
  L0_67 = L0_67.getNextRowId
  L1_68 = _UPVALUE0_
  L0_67 = L0_67(L1_68, portallayoutTable)
  L1_68 = db
  L1_68 = L1_68.getAttribute
  L1_68 = L1_68(portallayoutTable, _UPVALUE1_, L0_67, _UPVALUE2_.portForwarding)
  if L1_68 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_67, L1_68
end
function isportForwardingEnabledNext(A0_69)
  local L1_70, L2_71
  L1_70 = _UPVALUE0_
  L1_70 = L1_70.NIL
  if A0_69 ~= L1_70 then
    L1_70 = tonumber
    L2_71 = A0_69
    L1_70 = L1_70(L2_71)
    L2_71 = _UPVALUE0_
    L2_71 = L2_71.NIL
  elseif L1_70 == L2_71 then
    L1_70 = _UPVALUE0_
    L1_70 = L1_70.INVALID_ARGUMENT
    return L1_70
  end
  L1_70 = db
  L1_70 = L1_70.existsRow
  L2_71 = portallayoutTable
  L1_70 = L1_70(L2_71, _UPVALUE1_, A0_69)
  L2_71 = _UPVALUE0_
  L2_71 = L2_71.FALSE
  if L1_70 == L2_71 then
    L1_70 = _UPVALUE0_
    L1_70 = L1_70.INVALID_ARGUMENT
    return L1_70
  end
  L1_70 = db
  L1_70 = L1_70.getNextRowId
  L2_71 = A0_69
  L1_70 = L1_70(L2_71, portallayoutTable)
  L2_71 = _UPVALUE0_
  L2_71 = L2_71.NIL
  if L1_70 == L2_71 then
    L2_71 = _UPVALUE0_
    L2_71 = L2_71.NOT_EXIST
    return L2_71
  end
  L2_71 = db
  L2_71 = L2_71.getAttribute
  L2_71 = L2_71(portallayoutTable, _UPVALUE1_, L1_70, _UPVALUE2_.portForwarding)
  if L2_71 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_70
  end
  return _UPVALUE0_.SUCCESS, L1_70, L2_71
end
function portForwardingEnable(A0_72)
  if A0_72 == _UPVALUE0_.NIL or tonumber(A0_72) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(portallayoutTable, _UPVALUE1_, A0_72) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(portallayoutTable, _UPVALUE1_, A0_72, _UPVALUE2_.portForwarding, _UPVALUE3_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_72
  end
  return _UPVALUE0_.SUCCESS, A0_72
end
function portForwardingDisable(A0_73)
  if A0_73 == _UPVALUE0_.NIL or tonumber(A0_73) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(portallayoutTable, _UPVALUE1_, A0_73) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(portallayoutTable, _UPVALUE1_, A0_73, _UPVALUE2_.portForwarding, _UPVALUE3_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_73
  end
  return _UPVALUE0_.SUCCESS, A0_73
end
function useCountGet()
  local L0_74, L1_75
  L0_74 = db
  L0_74 = L0_74.getNextRowId
  L1_75 = _UPVALUE0_
  L0_74 = L0_74(L1_75, portallayoutTable)
  L1_75 = db
  L1_75 = L1_75.getAttribute
  L1_75 = L1_75(portallayoutTable, _UPVALUE1_, L0_74, _UPVALUE2_.useCount)
  if L1_75 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_74, L1_75
end
function useCountGetNext(A0_76)
  local L1_77, L2_78
  L1_77 = _UPVALUE0_
  L1_77 = L1_77.NIL
  if A0_76 ~= L1_77 then
    L1_77 = tonumber
    L2_78 = A0_76
    L1_77 = L1_77(L2_78)
    L2_78 = _UPVALUE0_
    L2_78 = L2_78.NIL
  elseif L1_77 == L2_78 then
    L1_77 = _UPVALUE0_
    L1_77 = L1_77.INVALID_ARGUMENT
    return L1_77
  end
  L1_77 = db
  L1_77 = L1_77.existsRow
  L2_78 = portallayoutTable
  L1_77 = L1_77(L2_78, _UPVALUE1_, A0_76)
  L2_78 = _UPVALUE0_
  L2_78 = L2_78.FALSE
  if L1_77 == L2_78 then
    L1_77 = _UPVALUE0_
    L1_77 = L1_77.INVALID_ARGUMENT
    return L1_77
  end
  L1_77 = db
  L1_77 = L1_77.getNextRowId
  L2_78 = A0_76
  L1_77 = L1_77(L2_78, portallayoutTable)
  L2_78 = _UPVALUE0_
  L2_78 = L2_78.NIL
  if L1_77 == L2_78 then
    L2_78 = _UPVALUE0_
    L2_78 = L2_78.NOT_EXIST
    return L2_78
  end
  L2_78 = db
  L2_78 = L2_78.getAttribute
  L2_78 = L2_78(portallayoutTable, _UPVALUE1_, L1_77, _UPVALUE2_.useCount)
  if L2_78 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_77
  end
  return _UPVALUE0_.SUCCESS, L1_77, L2_78
end
function useCountSet(A0_79, A1_80)
  local L3_81
  L3_81 = _UPVALUE0_
  L3_81 = L3_81.NOT_SUPPORTED
  return L3_81, A0_79
end
function portalURLGet()
  local L0_82, L1_83
  L0_82 = db
  L0_82 = L0_82.getNextRowId
  L1_83 = _UPVALUE0_
  L0_82 = L0_82(L1_83, portallayoutTable)
  L1_83 = db
  L1_83 = L1_83.getAttribute
  L1_83 = L1_83(portallayoutTable, _UPVALUE1_, L0_82, _UPVALUE2_.portalURL)
  if L1_83 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_82, L1_83
end
function portalURLGetNext(A0_84)
  local L1_85, L2_86
  L1_85 = _UPVALUE0_
  L1_85 = L1_85.NIL
  if A0_84 ~= L1_85 then
    L1_85 = tonumber
    L2_86 = A0_84
    L1_85 = L1_85(L2_86)
    L2_86 = _UPVALUE0_
    L2_86 = L2_86.NIL
  elseif L1_85 == L2_86 then
    L1_85 = _UPVALUE0_
    L1_85 = L1_85.INVALID_ARGUMENT
    return L1_85
  end
  L1_85 = db
  L1_85 = L1_85.existsRow
  L2_86 = portallayoutTable
  L1_85 = L1_85(L2_86, _UPVALUE1_, A0_84)
  L2_86 = _UPVALUE0_
  L2_86 = L2_86.FALSE
  if L1_85 == L2_86 then
    L1_85 = _UPVALUE0_
    L1_85 = L1_85.INVALID_ARGUMENT
    return L1_85
  end
  L1_85 = db
  L1_85 = L1_85.getNextRowId
  L2_86 = A0_84
  L1_85 = L1_85(L2_86, portallayoutTable)
  L2_86 = _UPVALUE0_
  L2_86 = L2_86.NIL
  if L1_85 == L2_86 then
    L2_86 = _UPVALUE0_
    L2_86 = L2_86.NOT_EXIST
    return L2_86
  end
  L2_86 = db
  L2_86 = L2_86.getAttribute
  L2_86 = L2_86(portallayoutTable, _UPVALUE1_, L1_85, _UPVALUE2_.portalURL)
  if L2_86 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_85
  end
  return _UPVALUE0_.SUCCESS, L1_85, L2_86
end
function portalURLSet(A0_87, A1_88)
  local L3_89
  L3_89 = _UPVALUE0_
  L3_89 = L3_89.NOT_SUPPORTED
  return L3_89, A0_87
end
function profileNameGet()
  local L0_90, L1_91
  L0_90 = db
  L0_90 = L0_90.getNextRowId
  L1_91 = _UPVALUE0_
  L0_90 = L0_90(L1_91, portallayoutTable)
  L1_91 = db
  L1_91 = L1_91.getAttribute
  L1_91 = L1_91(portallayoutTable, _UPVALUE1_, L0_90, _UPVALUE2_.profileName)
  if L1_91 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_90, L1_91
end
function profileNameGetNext(A0_92)
  local L1_93, L2_94
  L1_93 = _UPVALUE0_
  L1_93 = L1_93.NIL
  if A0_92 ~= L1_93 then
    L1_93 = tonumber
    L2_94 = A0_92
    L1_93 = L1_93(L2_94)
    L2_94 = _UPVALUE0_
    L2_94 = L2_94.NIL
  elseif L1_93 == L2_94 then
    L1_93 = _UPVALUE0_
    L1_93 = L1_93.INVALID_ARGUMENT
    return L1_93
  end
  L1_93 = db
  L1_93 = L1_93.existsRow
  L2_94 = portallayoutTable
  L1_93 = L1_93(L2_94, _UPVALUE1_, A0_92)
  L2_94 = _UPVALUE0_
  L2_94 = L2_94.FALSE
  if L1_93 == L2_94 then
    L1_93 = _UPVALUE0_
    L1_93 = L1_93.INVALID_ARGUMENT
    return L1_93
  end
  L1_93 = db
  L1_93 = L1_93.getNextRowId
  L2_94 = A0_92
  L1_93 = L1_93(L2_94, portallayoutTable)
  L2_94 = _UPVALUE0_
  L2_94 = L2_94.NIL
  if L1_93 == L2_94 then
    L2_94 = _UPVALUE0_
    L2_94 = L2_94.NOT_EXIST
    return L2_94
  end
  L2_94 = db
  L2_94 = L2_94.getAttribute
  L2_94 = L2_94(portallayoutTable, _UPVALUE1_, L1_93, _UPVALUE2_.profileName)
  if L2_94 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_93
  end
  return _UPVALUE0_.SUCCESS, L1_93, L2_94
end
function profileNameSet(A0_95, A1_96)
  if A0_95 == _UPVALUE0_.NIL or tonumber(A0_95) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(portallayoutTable, _UPVALUE1_, A0_95) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_96 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(portallayoutTable, _UPVALUE1_, A0_95, _UPVALUE2_.profileName, A1_96) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_95
  end
  return _UPVALUE0_.SUCCESS, A0_95
end
function portalGet()
  local L0_97, L1_98, L2_99, L3_100, L4_101, L5_102, L6_103, L7_104, L8_105, L9_106, L10_107, L11_108, L12_109, L13_110, L14_111, L15_112
  L0_97 = db
  L0_97 = L0_97.getAttribute
  L1_98 = _UPVALUE0_
  L2_99 = _UPVALUE1_
  L3_100 = _UPVALUE2_
  L4_101 = _UPVALUE3_
  L4_101 = L4_101.accessMgmt
  L0_97 = L0_97(L1_98, L2_99, L3_100, L4_101)
  L1_98 = _UPVALUE4_
  if L0_97 == L1_98 then
    L1_98 = _UPVALUE5_
    L1_98 = L1_98.SSLVPN_REMOTEMANAGEMENT_DISABLED
    return L1_98
  end
  L1_98 = db
  L1_98 = L1_98.getNextRowId
  L2_99 = _UPVALUE2_
  L3_100 = portallayoutTable
  L1_98 = L1_98(L2_99, L3_100)
  L2_99 = db
  L2_99 = L2_99.getRow
  L3_100 = portallayoutTable
  L4_101 = _UPVALUE1_
  L5_102 = L1_98
  L2_99 = L2_99(L3_100, L4_101, L5_102)
  L3_100 = _UPVALUE6_
  L3_100 = L3_100.NIL
  if L2_99 == L3_100 then
    L3_100 = _UPVALUE6_
    L3_100 = L3_100.FAILURE
    return L3_100
  end
  L3_100, L4_101, L5_102, L6_103, L7_104, L8_105, L9_106, L10_107, L11_108, L12_109, L13_110, L14_111, L15_112 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L3_100 = L2_99[portallayoutTable .. "." .. _UPVALUE3_.portalLayoutName]
  L4_101 = L2_99[portallayoutTable .. "." .. _UPVALUE3_.defaultPortal]
  L5_102 = L2_99[portallayoutTable .. "." .. _UPVALUE3_.siteTitle]
  L6_103 = L2_99[portallayoutTable .. "." .. _UPVALUE3_.bannerTitle]
  L7_104 = L2_99[portallayoutTable .. "." .. _UPVALUE3_.bannerMessage]
  L8_105 = L2_99[portallayoutTable .. "." .. _UPVALUE3_.portalBanner]
  L9_106 = L2_99[portallayoutTable .. "." .. _UPVALUE3_.HTTPMetaTags]
  L10_107 = L2_99[portallayoutTable .. "." .. _UPVALUE3_.activeXWebCacheCleaner]
  L11_108 = L2_99[portallayoutTable .. "." .. _UPVALUE3_.VPNTunnel]
  L13_110 = L2_99[portallayoutTable .. "." .. _UPVALUE3_.useCount]
  L14_111 = L2_99[portallayoutTable .. "." .. _UPVALUE3_.portalURL]
  L12_109 = L2_99[portallayoutTable .. "." .. _UPVALUE3_.portForwarding]
  L15_112 = L2_99[portallayoutTable .. "." .. _UPVALUE3_.profileName]
  return _UPVALUE6_.SUCCESS, L1_98, L3_100, L4_101, L5_102, L6_103, L7_104, L8_105, L9_106, L10_107, L11_108, L12_109, L13_110, L14_111, L15_112
end
function portalGetCur(A0_113)
  local L1_114, L2_115, L3_116, L4_117, L5_118, L6_119, L7_120, L8_121, L9_122, L10_123, L11_124, L12_125, L13_126, L14_127
  L1_114 = db
  L1_114 = L1_114.getRow
  L2_115 = portallayoutTable
  L3_116 = _UPVALUE0_
  L4_117 = A0_113
  L1_114 = L1_114(L2_115, L3_116, L4_117)
  L2_115 = _UPVALUE1_
  L2_115 = L2_115.NIL
  if L1_114 == L2_115 then
    L2_115 = _UPVALUE1_
    L2_115 = L2_115.FAILURE
    return L2_115
  end
  L2_115, L3_116, L4_117, L5_118, L6_119, L7_120, L8_121, L9_122, L10_123, L11_124, L12_125, L13_126, L14_127 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L2_115 = L1_114[portallayoutTable .. "." .. _UPVALUE2_.portalLayoutName]
  L3_116 = L1_114[portallayoutTable .. "." .. _UPVALUE2_.defaultPortal]
  L4_117 = L1_114[portallayoutTable .. "." .. _UPVALUE2_.siteTitle]
  L5_118 = L1_114[portallayoutTable .. "." .. _UPVALUE2_.bannerTitle]
  L6_119 = L1_114[portallayoutTable .. "." .. _UPVALUE2_.bannerMessage]
  L7_120 = L1_114[portallayoutTable .. "." .. _UPVALUE2_.portalBanner]
  L8_121 = L1_114[portallayoutTable .. "." .. _UPVALUE2_.HTTPMetaTags]
  L9_122 = L1_114[portallayoutTable .. "." .. _UPVALUE2_.activeXWebCacheCleaner]
  L10_123 = L1_114[portallayoutTable .. "." .. _UPVALUE2_.VPNTunnel]
  L11_124 = L1_114[portallayoutTable .. "." .. _UPVALUE2_.portForwarding]
  L12_125 = L1_114[portallayoutTable .. "." .. _UPVALUE2_.useCount]
  L13_126 = L1_114[portallayoutTable .. "." .. _UPVALUE2_.portalURL]
  L14_127 = L1_114[portallayoutTable .. "." .. _UPVALUE2_.profileName]
  return _UPVALUE1_.SUCCESS, A0_113, L2_115, L3_116, L4_117, L5_118, L6_119, L7_120, L8_121, L9_122, L10_123, L11_124, L12_125, L13_126, L14_127
end
function portalGetNext(A0_128)
  local L1_129, L2_130, L3_131, L4_132, L5_133, L6_134, L7_135, L8_136, L9_137, L10_138, L11_139, L12_140, L13_141, L14_142, L15_143
  L1_129 = _UPVALUE0_
  L1_129 = L1_129.NIL
  if A0_128 ~= L1_129 then
    L1_129 = tonumber
    L2_130 = A0_128
    L1_129 = L1_129(L2_130)
    L2_130 = _UPVALUE0_
    L2_130 = L2_130.NIL
  elseif L1_129 == L2_130 then
    L1_129 = _UPVALUE0_
    L1_129 = L1_129.INVALID_ARGUMENT
    return L1_129
  end
  L1_129 = db
  L1_129 = L1_129.existsRow
  L2_130 = portallayoutTable
  L3_131 = _UPVALUE1_
  L4_132 = A0_128
  L1_129 = L1_129(L2_130, L3_131, L4_132)
  L2_130 = _UPVALUE0_
  L2_130 = L2_130.FALSE
  if L1_129 == L2_130 then
    L1_129 = _UPVALUE0_
    L1_129 = L1_129.INVALID_ARGUMENT
    return L1_129
  end
  L1_129 = db
  L1_129 = L1_129.getNextRowId
  L2_130 = A0_128
  L3_131 = portallayoutTable
  L1_129 = L1_129(L2_130, L3_131)
  L2_130 = _UPVALUE0_
  L2_130 = L2_130.NIL
  if L1_129 == L2_130 then
    L2_130 = _UPVALUE0_
    L2_130 = L2_130.NOT_EXIST
    return L2_130
  end
  L2_130 = db
  L2_130 = L2_130.getRow
  L3_131 = portallayoutTable
  L4_132 = _UPVALUE1_
  L5_133 = L1_129
  L2_130 = L2_130(L3_131, L4_132, L5_133)
  L3_131 = _UPVALUE0_
  L3_131 = L3_131.NIL
  if L2_130 == L3_131 then
    L3_131 = _UPVALUE0_
    L3_131 = L3_131.FAILURE
    return L3_131
  end
  L3_131, L4_132, L5_133, L6_134, L7_135, L8_136, L9_137, L10_138, L11_139, L12_140, L13_141, L14_142, L15_143 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L3_131 = L2_130[portallayoutTable .. "." .. _UPVALUE2_.portalLayoutName]
  L4_132 = L2_130[portallayoutTable .. "." .. _UPVALUE2_.defaultPortal]
  L5_133 = L2_130[portallayoutTable .. "." .. _UPVALUE2_.siteTitle]
  L6_134 = L2_130[portallayoutTable .. "." .. _UPVALUE2_.bannerTitle]
  L7_135 = L2_130[portallayoutTable .. "." .. _UPVALUE2_.bannerMessage]
  L8_136 = L2_130[portallayoutTable .. "." .. _UPVALUE2_.portalBanner]
  L9_137 = L2_130[portallayoutTable .. "." .. _UPVALUE2_.HTTPMetaTags]
  L10_138 = L2_130[portallayoutTable .. "." .. _UPVALUE2_.activeXWebCacheCleaner]
  L11_139 = L2_130[portallayoutTable .. "." .. _UPVALUE2_.VPNTunnel]
  L12_140 = L2_130[portallayoutTable .. "." .. _UPVALUE2_.portForwarding]
  L13_141 = L2_130[portallayoutTable .. "." .. _UPVALUE2_.useCount]
  L14_142 = L2_130[portallayoutTable .. "." .. _UPVALUE2_.portalURL]
  L15_143 = L2_130[portallayoutTable .. "." .. _UPVALUE2_.profileName]
  return _UPVALUE0_.SUCCESS, L1_129, L3_131, L4_132, L5_133, L6_134, L7_135, L8_136, L9_137, L10_138, L11_139, L12_140, L13_141, L14_142, L15_143
end
function portalGetAll()
  local L0_144, L1_145, L2_146, L3_147, L4_148, L5_149, L6_150, L7_151, L8_152, L9_153, L10_154, L11_155, L12_156, L13_157, L14_158, L15_159, L16_160
  L0_144 = db
  L0_144 = L0_144.getAttribute
  L1_145 = _UPVALUE0_
  L2_146 = _UPVALUE1_
  L3_147 = _UPVALUE2_
  L0_144 = L0_144(L1_145, L2_146, L3_147, L4_148)
  L1_145 = nil
  L2_146 = _UPVALUE4_
  if L0_144 == L2_146 then
    L2_146 = _UPVALUE5_
    L1_145 = L2_146.SSLVPN_REMOTEMANAGEMENT_DISABLED
  else
    L2_146 = _UPVALUE6_
    L1_145 = L2_146.SUCCESS
  end
  L2_146 = db
  L2_146 = L2_146.getAttribute
  L3_147 = _UPVALUE0_
  L2_146 = L2_146(L3_147, L4_148, L5_149, L6_150)
  L3_147 = {}
  L3_147 = L4_148
  for L7_151, L8_152 in L4_148(L5_149) do
    L9_153 = db
    L9_153 = L9_153.getRow
    L10_154 = "WanMode"
    L11_155 = "_ROWID_"
    L12_156 = "1"
    L9_153 = L9_153(L10_154, L11_155, L12_156)
    L10_154 = "WAN1"
    if L9_153 ~= nil then
      L11_155 = L9_153["WanMode.Wanmode"]
      if L11_155 ~= "0" then
        L11_155 = L9_153["WanMode.Wanmode"]
      elseif L11_155 == "2" then
        L10_154 = L9_153["WanMode.DedicatedLogicalIfName"]
      end
    end
    if L10_154 == nil then
      L10_154 = "WAN1"
    end
    L11_155 = db
    L11_155 = L11_155.getRowWhere
    L12_156 = "ipAddressTable"
    L13_157 = "LogicalIfName='"
    L14_158 = L10_154
    L15_159 = "' and addressFamily=2"
    L13_157 = L13_157 .. L14_158 .. L15_159
    L11_155 = L11_155(L12_156, L13_157)
    L12_156 = "0.0.0.0"
    if L11_155 ~= nil then
      L13_157 = L11_155["ipAddressTable.ipAddress"]
      L12_156 = L13_157 or ""
      if L12_156 == "0.0.0.0" then
        L13_157 = L9_153["WanMode.Wanmode"]
        if L13_157 == "2" then
          L10_154 = "WAN2"
          L13_157 = db
          L13_157 = L13_157.getRowWhere
          L14_158 = "ipAddressTable"
          L15_159 = "LogicalIfName='"
          L16_160 = L10_154
          L15_159 = L15_159 .. L16_160 .. "' and addressFamily=2"
          L13_157 = L13_157(L14_158, L15_159)
          L11_155 = L13_157
          L13_157 = L11_155["ipAddressTable.ipAddress"]
          L12_156 = L13_157 or ""
        end
      end
    end
    L13_157 = "https://"
    L14_158 = L12_156
    L15_159 = ":"
    L16_160 = L2_146
    L13_157 = L13_157 .. L14_158 .. L15_159 .. L16_160 .. "/portal/" .. L3_147[L7_151].PortalLayoutName
    L14_158 = ""
    L15_159 = ""
    L16_160 = L3_147[L7_151]
    L16_160 = L16_160.PortalLayoutName
    if #L16_160 > 32 then
      L15_159 = L3_147[L7_151].PortalLayoutName
      L14_158 = "https://" .. L12_156 .. ":" .. L2_146 .. "/portal/" .. L3_147[L7_151].PortalLayoutName
      L16_160 = string.sub(L16_160, 1, 16) .. "..."
    end
    L3_147[L7_151].PortalURL = "https://" .. L12_156 .. ":" .. L2_146 .. "/portal/" .. L16_160
  end
  if L3_147 == L4_148 then
    return L4_148
  end
  return L4_148, L5_149
end
function portalSet(A0_161, A1_162, A2_163, A3_164, A4_165, A5_166, A6_167, A7_168, A8_169, A9_170, A10_171, A11_172, A12_173, A13_174)
  local L14_175, L15_176, L16_177, L17_178, L18_179, L19_180, L20_181, L21_182, L22_183
  L14_175 = _UPVALUE0_
  L14_175 = L14_175.NIL
  if A0_161 ~= L14_175 then
    L14_175 = tonumber
    L15_176 = A0_161
    L14_175 = L14_175(L15_176)
    L15_176 = _UPVALUE0_
    L15_176 = L15_176.NIL
  elseif L14_175 == L15_176 then
    L14_175 = _UPVALUE0_
    L14_175 = L14_175.INVALID_ARGUMENT
    return L14_175
  end
  L14_175 = db
  L14_175 = L14_175.existsRow
  L15_176 = portallayoutTable
  L16_177 = _UPVALUE1_
  L17_178 = A0_161
  L14_175 = L14_175(L15_176, L16_177, L17_178)
  L15_176 = _UPVALUE0_
  L15_176 = L15_176.FALSE
  if L14_175 == L15_176 then
    L14_175 = _UPVALUE2_
    L14_175 = L14_175.SSLVPN_COOKIE_INVALID
    return L14_175
  end
  L14_175 = {}
  L15_176 = _UPVALUE0_
  L15_176 = L15_176.NIL
  if A1_162 == L15_176 then
    L15_176 = _UPVALUE0_
    L15_176 = L15_176.INVALID_ARGUMENT
    return L15_176
  end
  L15_176 = portallayoutTable
  L16_177 = "."
  L17_178 = _UPVALUE3_
  L17_178 = L17_178.portalLayoutName
  L15_176 = L15_176 .. L16_177 .. L17_178
  L14_175[L15_176] = A1_162
  L15_176 = _UPVALUE0_
  L15_176 = L15_176.NIL
  if A2_163 == L15_176 then
    L15_176 = _UPVALUE0_
    L15_176 = L15_176.INVALID_ARGUMENT
    return L15_176
  end
  L15_176 = tonumber
  L16_177 = A2_163
  L15_176 = L15_176(L16_177)
  if L15_176 ~= 0 and L15_176 ~= 1 and L15_176 ~= 2 then
    L16_177 = _UPVALUE0_
    L16_177 = L16_177.INVALID_ARGUMENT
    return L16_177
  end
  L16_177 = portallayoutTable
  L17_178 = "."
  L18_179 = _UPVALUE3_
  L18_179 = L18_179.defaultPortal
  L16_177 = L16_177 .. L17_178 .. L18_179
  L14_175[L16_177] = A2_163
  L16_177 = _UPVALUE0_
  L16_177 = L16_177.NIL
  if A3_164 ~= L16_177 then
    L16_177 = portallayoutTable
    L17_178 = "."
    L18_179 = _UPVALUE3_
    L18_179 = L18_179.siteTitle
    L16_177 = L16_177 .. L17_178 .. L18_179
    L14_175[L16_177] = A3_164
  end
  L16_177 = _UPVALUE0_
  L16_177 = L16_177.NIL
  if A4_165 ~= L16_177 then
    L16_177 = portallayoutTable
    L17_178 = "."
    L18_179 = _UPVALUE3_
    L18_179 = L18_179.bannerTitle
    L16_177 = L16_177 .. L17_178 .. L18_179
    L14_175[L16_177] = A4_165
  end
  L16_177 = _UPVALUE0_
  L16_177 = L16_177.NIL
  if A5_166 ~= L16_177 then
    L16_177 = portallayoutTable
    L17_178 = "."
    L18_179 = _UPVALUE3_
    L18_179 = L18_179.bannerMessage
    L16_177 = L16_177 .. L17_178 .. L18_179
    L14_175[L16_177] = A5_166
  end
  L16_177 = _UPVALUE0_
  L16_177 = L16_177.NIL
  if A6_167 == L16_177 then
    L16_177 = _UPVALUE0_
    L16_177 = L16_177.INVALID_ARGUMENT
    return L16_177
  end
  L16_177 = _UPVALUE4_
  L16_177 = L16_177.isBoolean
  L17_178 = A6_167
  L16_177 = L16_177(L17_178)
  valid = L16_177
  L16_177 = valid
  L17_178 = _UPVALUE0_
  L17_178 = L17_178.SUCCESS
  if L16_177 ~= L17_178 then
    L16_177 = _UPVALUE0_
    L16_177 = L16_177.INVALID_ARGUMENT
    return L16_177
  end
  L16_177 = portallayoutTable
  L17_178 = "."
  L18_179 = _UPVALUE3_
  L18_179 = L18_179.portalBanner
  L16_177 = L16_177 .. L17_178 .. L18_179
  L14_175[L16_177] = A6_167
  L16_177 = _UPVALUE0_
  L16_177 = L16_177.NIL
  if A7_168 == L16_177 then
    L16_177 = _UPVALUE0_
    L16_177 = L16_177.INVALID_ARGUMENT
    return L16_177
  end
  L16_177 = _UPVALUE4_
  L16_177 = L16_177.isBoolean
  L17_178 = A7_168
  L16_177 = L16_177(L17_178)
  valid = L16_177
  L16_177 = valid
  L17_178 = _UPVALUE0_
  L17_178 = L17_178.SUCCESS
  if L16_177 ~= L17_178 then
    L16_177 = _UPVALUE0_
    L16_177 = L16_177.INVALID_ARGUMENT
    return L16_177
  end
  L16_177 = portallayoutTable
  L17_178 = "."
  L18_179 = _UPVALUE3_
  L18_179 = L18_179.HTTPMetaTags
  L16_177 = L16_177 .. L17_178 .. L18_179
  L14_175[L16_177] = A7_168
  L16_177 = _UPVALUE0_
  L16_177 = L16_177.NIL
  if A8_169 == L16_177 then
    L16_177 = _UPVALUE0_
    L16_177 = L16_177.INVALID_ARGUMENT
    return L16_177
  end
  L16_177 = _UPVALUE4_
  L16_177 = L16_177.isBoolean
  L17_178 = A8_169
  L16_177 = L16_177(L17_178)
  valid = L16_177
  L16_177 = valid
  L17_178 = _UPVALUE0_
  L17_178 = L17_178.SUCCESS
  if L16_177 ~= L17_178 then
    L16_177 = _UPVALUE0_
    L16_177 = L16_177.INVALID_ARGUMENT
    return L16_177
  end
  L16_177 = portallayoutTable
  L17_178 = "."
  L18_179 = _UPVALUE3_
  L18_179 = L18_179.activeXWebCacheCleaner
  L16_177 = L16_177 .. L17_178 .. L18_179
  L14_175[L16_177] = A8_169
  L16_177 = _UPVALUE0_
  L16_177 = L16_177.NIL
  if A9_170 == L16_177 then
    L16_177 = _UPVALUE0_
    L16_177 = L16_177.INVALID_ARGUMENT
    return L16_177
  end
  L16_177 = _UPVALUE4_
  L16_177 = L16_177.isBoolean
  L17_178 = A9_170
  L16_177 = L16_177(L17_178)
  valid = L16_177
  L16_177 = valid
  L17_178 = _UPVALUE0_
  L17_178 = L17_178.SUCCESS
  if L16_177 ~= L17_178 then
    L16_177 = _UPVALUE0_
    L16_177 = L16_177.INVALID_ARGUMENT
    return L16_177
  end
  L16_177 = portallayoutTable
  L17_178 = "."
  L18_179 = _UPVALUE3_
  L18_179 = L18_179.VPNTunnel
  L16_177 = L16_177 .. L17_178 .. L18_179
  L14_175[L16_177] = A9_170
  L16_177 = _UPVALUE0_
  L16_177 = L16_177.NIL
  if A10_171 == L16_177 then
    L16_177 = _UPVALUE0_
    L16_177 = L16_177.INVALID_ARGUMENT
    return L16_177
  end
  L16_177 = _UPVALUE4_
  L16_177 = L16_177.isBoolean
  L17_178 = A10_171
  L16_177 = L16_177(L17_178)
  valid = L16_177
  L16_177 = valid
  L17_178 = _UPVALUE0_
  L17_178 = L17_178.SUCCESS
  if L16_177 ~= L17_178 then
    L16_177 = _UPVALUE0_
    L16_177 = L16_177.INVALID_ARGUMENT
    return L16_177
  end
  L16_177 = portallayoutTable
  L17_178 = "."
  L18_179 = _UPVALUE3_
  L18_179 = L18_179.portForwarding
  L16_177 = L16_177 .. L17_178 .. L18_179
  L14_175[L16_177] = A10_171
  L16_177 = _UPVALUE0_
  L16_177 = L16_177.NIL
  if A11_172 ~= L16_177 then
    L16_177 = db
    L16_177 = L16_177.getRowWhere
    L17_178 = loginProfileTable
    L18_179 = _UPVALUE3_
    L18_179 = L18_179.loginProfileName
    L19_180 = "='"
    L20_181 = A11_172
    L21_182 = "'"
    L18_179 = L18_179 .. L19_180 .. L20_181 .. L21_182
    L19_180 = false
    L16_177 = L16_177(L17_178, L18_179, L19_180)
    L17_178 = NIL
    if L16_177 == L17_178 then
      L17_178 = _UPVALUE0_
      L17_178 = L17_178.INVALID_ARGUMENT
      return L17_178
    end
    L17_178 = portallayoutTable
    L18_179 = "."
    L19_180 = _UPVALUE3_
    L19_180 = L19_180.profileName
    L17_178 = L17_178 .. L18_179 .. L19_180
    L14_175[L17_178] = A11_172
  else
    L16_177 = _UPVALUE0_
    L16_177 = L16_177.INVALID_ARGUMENT
    return L16_177
  end
  L16_177 = db
  L16_177 = L16_177.update
  L17_178 = portallayoutTable
  L18_179 = L14_175
  L19_180 = A0_161
  L16_177 = L16_177(L17_178, L18_179, L19_180)
  L17_178 = _UPVALUE0_
  L17_178 = L17_178.NIL
  if L16_177 == L17_178 then
    L17_178 = _UPVALUE0_
    L17_178 = L17_178.FAILURE
    L18_179 = A0_161
    return L17_178, L18_179
  end
  L17_178 = _UPVALUE0_
  L17_178 = L17_178.NIL
  if A12_173 == L17_178 then
    L17_178 = _UPVALUE0_
    L17_178 = L17_178.INVALID_ARGUMENT
    return L17_178
  end
  L17_178 = _UPVALUE5_
  if A12_173 == L17_178 then
    L17_178 = _UPVALUE0_
    L17_178 = L17_178.NIL
    if A13_174 == L17_178 then
      L17_178 = _UPVALUE0_
      L17_178 = L17_178.INVALID_ARGUMENT
      return L17_178
    end
  end
  L17_178 = _UPVALUE5_
  if A12_173 == L17_178 then
    L17_178 = _UPVALUE0_
    L17_178 = L17_178.TRUE
    L18_179, L19_180 = nil, nil
    L20_181 = db
    L20_181 = L20_181.existsRow
    L21_182 = _UPVALUE6_
    L21_182 = L21_182.sslVpnTable
    L22_183 = _UPVALUE3_
    L22_183 = L22_183.portalLayoutName
    L20_181 = L20_181(L21_182, L22_183, A1_162)
    if L20_181 then
      L20_181 = db
      L20_181 = L20_181.getAttribute
      L21_182 = _UPVALUE6_
      L21_182 = L21_182.sslVpnTable
      L22_183 = _UPVALUE3_
      L22_183 = L22_183.portalLayoutName
      L20_181 = L20_181(L21_182, L22_183, A1_162, _UPVALUE6_.attribute.domain)
      if L20_181 ~= A13_174 then
        L21_182 = db
        L21_182 = L21_182.setAttribute
        L22_183 = _UPVALUE6_
        L22_183 = L22_183.sslVpnTable
        L21_182 = L21_182(L22_183, _UPVALUE6_.attribute.domain, L20_181, _UPVALUE3_.portalLayoutName, _UPVALUE7_)
        L16_177 = L21_182
        if not L16_177 then
          L21_182 = _UPVALUE0_
          L21_182 = L21_182.FAILURE
          L22_183 = A0_161
          return L21_182, L22_183
        end
        L21_182 = _UPVALUE7_
        if A13_174 == L21_182 then
          L21_182 = _UPVALUE0_
          L18_179 = L21_182.TRUE
        end
      else
        L21_182 = _UPVALUE0_
        L17_178 = L21_182.FALSE
      end
    else
      L20_181 = _UPVALUE7_
      if A13_174 ~= L20_181 then
        L20_181 = _UPVALUE0_
        L19_180 = L20_181.TRUE
      end
    end
    if L17_178 then
      L20_181 = _UPVALUE7_
      if A13_174 ~= L20_181 then
        L20_181 = db
        L20_181 = L20_181.getAttribute
        L21_182 = _UPVALUE6_
        L21_182 = L21_182.sslVpnTable
        L22_183 = _UPVALUE6_
        L22_183 = L22_183.attribute
        L22_183 = L22_183.domain
        L20_181 = L20_181(L21_182, L22_183, A13_174, _UPVALUE3_.portalLayoutName)
        L21_182 = _UPVALUE7_
        if L20_181 ~= L21_182 then
          L21_182 = nil
          L22_183 = db
          L22_183 = L22_183.getAttribute
          L22_183 = L22_183(portallayoutTable, _UPVALUE3_.portalLayoutName, L20_181, _UPVALUE3_.useCount)
          L21_182 = L22_183
          L22_183 = _UPVALUE0_
          L22_183 = L22_183.NIL
          if L21_182 == L22_183 then
            L22_183 = _UPVALUE0_
            L22_183 = L22_183.FAILURE
            return L22_183, A0_161
          end
          L22_183 = tonumber
          L22_183 = L22_183(L21_182)
          L22_183 = L22_183 - 1
          if not db.setAttribute(portallayoutTable, _UPVALUE3_.portalLayoutName, L20_181, _UPVALUE3_.useCount, L22_183) then
            return _UPVALUE0_.FAILURE, A0_161
          end
        end
        L21_182 = db
        L21_182 = L21_182.setAttribute
        L22_183 = _UPVALUE6_
        L22_183 = L22_183.sslVpnTable
        L21_182 = L21_182(L22_183, _UPVALUE6_.attribute.domain, A13_174, _UPVALUE3_.portalLayoutName, A1_162)
        L16_177 = L21_182
        if not L16_177 then
          L21_182 = _UPVALUE0_
          L21_182 = L21_182.FAILURE
          L22_183 = A0_161
          return L21_182, L22_183
        end
      end
      L20_181 = db
      L20_181 = L20_181.getAttribute
      L21_182 = portallayoutTable
      L22_183 = _UPVALUE3_
      L22_183 = L22_183.portalLayoutName
      L20_181 = L20_181(L21_182, L22_183, A1_162, _UPVALUE3_.useCount)
      L21_182 = _UPVALUE0_
      L21_182 = L21_182.NIL
      if L20_181 == L21_182 then
        L21_182 = _UPVALUE0_
        L21_182 = L21_182.FAILURE
        L22_183 = A0_161
        return L21_182, L22_183
      end
      if L19_180 then
        L21_182 = tonumber
        L22_183 = L20_181
        L21_182 = L21_182(L22_183)
        L20_181 = L21_182 + 1
      end
      if L18_179 then
        L21_182 = tonumber
        L22_183 = L20_181
        L21_182 = L21_182(L22_183)
        L20_181 = L21_182 - 1
      end
      if L19_180 or L18_179 then
        L21_182 = db
        L21_182 = L21_182.setAttribute
        L22_183 = portallayoutTable
        L21_182 = L21_182(L22_183, _UPVALUE3_.portalLayoutName, A1_162, _UPVALUE3_.useCount, L20_181)
        L16_177 = L21_182
        if not L16_177 then
          L21_182 = _UPVALUE0_
          L21_182 = L21_182.FAILURE
          L22_183 = A0_161
          return L21_182, L22_183
        end
      end
    end
  end
  L17_178 = _UPVALUE0_
  L17_178 = L17_178.SUCCESS
  L18_179 = A0_161
  return L17_178, L18_179
end
function portalCreate(A0_184, A1_185, A2_186, A3_187, A4_188, A5_189, A6_190, A7_191, A8_192, A9_193, A10_194, A11_195, A12_196)
  local L13_197, L14_198, L15_199, L16_200, L17_201, L18_202, L19_203
  L13_197 = db
  L13_197 = L13_197.existsRow
  L14_198 = portallayoutTable
  L15_199 = _UPVALUE0_
  L15_199 = L15_199.portalLayoutName
  L16_200 = A0_184
  L13_197 = L13_197(L14_198, L15_199, L16_200)
  L14_198 = _UPVALUE1_
  L14_198 = L14_198.FALSE
  if L13_197 ~= L14_198 then
    L13_197 = _UPVALUE2_
    L13_197 = L13_197.PORTAL_ALREADY_EXIST
    return L13_197
  end
  L13_197 = {}
  L14_198 = _UPVALUE1_
  L14_198 = L14_198.NIL
  if A0_184 == L14_198 then
    L14_198 = _UPVALUE1_
    L14_198 = L14_198.INVALID_ARGUMENT
    return L14_198
  end
  L14_198 = _UPVALUE3_
  if A0_184 == L14_198 then
    L14_198 = _UPVALUE2_
    L14_198 = L14_198.NONE_NOT_ALLOWED
    return L14_198
  end
  L14_198 = portallayoutTable
  L15_199 = "."
  L16_200 = _UPVALUE0_
  L16_200 = L16_200.portalLayoutName
  L14_198 = L14_198 .. L15_199 .. L16_200
  L13_197[L14_198] = A0_184
  L14_198 = _UPVALUE1_
  L14_198 = L14_198.NIL
  if A1_185 == L14_198 then
    L14_198 = _UPVALUE1_
    L14_198 = L14_198.INVALID_ARGUMENT
    return L14_198
  end
  L14_198 = tonumber
  L15_199 = A1_185
  L14_198 = L14_198(L15_199)
  if L14_198 ~= 0 and L14_198 ~= 1 and L14_198 ~= 2 then
    L15_199 = _UPVALUE1_
    L15_199 = L15_199.INVALID_ARGUMENT
    return L15_199
  end
  L15_199 = portallayoutTable
  L16_200 = "."
  L17_201 = _UPVALUE0_
  L17_201 = L17_201.defaultPortal
  L15_199 = L15_199 .. L16_200 .. L17_201
  L13_197[L15_199] = A1_185
  L15_199 = _UPVALUE1_
  L15_199 = L15_199.NIL
  if A2_186 ~= L15_199 then
    L15_199 = portallayoutTable
    L16_200 = "."
    L17_201 = _UPVALUE0_
    L17_201 = L17_201.siteTitle
    L15_199 = L15_199 .. L16_200 .. L17_201
    L13_197[L15_199] = A2_186
  end
  L15_199 = _UPVALUE1_
  L15_199 = L15_199.NIL
  if A3_187 ~= L15_199 then
    L15_199 = portallayoutTable
    L16_200 = "."
    L17_201 = _UPVALUE0_
    L17_201 = L17_201.bannerTitle
    L15_199 = L15_199 .. L16_200 .. L17_201
    L13_197[L15_199] = A3_187
  end
  L15_199 = _UPVALUE1_
  L15_199 = L15_199.NIL
  if A4_188 ~= L15_199 then
    L15_199 = portallayoutTable
    L16_200 = "."
    L17_201 = _UPVALUE0_
    L17_201 = L17_201.bannerMessage
    L15_199 = L15_199 .. L16_200 .. L17_201
    L13_197[L15_199] = A4_188
  end
  L15_199 = _UPVALUE1_
  L15_199 = L15_199.NIL
  if A5_189 == L15_199 then
    L15_199 = _UPVALUE1_
    L15_199 = L15_199.INVALID_ARGUMENT
    return L15_199
  end
  L15_199 = _UPVALUE4_
  L15_199 = L15_199.isBoolean
  L16_200 = A5_189
  L15_199 = L15_199(L16_200)
  valid = L15_199
  L15_199 = valid
  L16_200 = _UPVALUE1_
  L16_200 = L16_200.SUCCESS
  if L15_199 ~= L16_200 then
    L15_199 = _UPVALUE1_
    L15_199 = L15_199.INVALID_ARGUMENT
    return L15_199
  end
  L15_199 = portallayoutTable
  L16_200 = "."
  L17_201 = _UPVALUE0_
  L17_201 = L17_201.portalBanner
  L15_199 = L15_199 .. L16_200 .. L17_201
  L13_197[L15_199] = A5_189
  L15_199 = _UPVALUE1_
  L15_199 = L15_199.NIL
  if A6_190 == L15_199 then
    L15_199 = _UPVALUE1_
    L15_199 = L15_199.INVALID_ARGUMENT
    return L15_199
  end
  L15_199 = _UPVALUE4_
  L15_199 = L15_199.isBoolean
  L16_200 = A6_190
  L15_199 = L15_199(L16_200)
  valid = L15_199
  L15_199 = valid
  L16_200 = _UPVALUE1_
  L16_200 = L16_200.SUCCESS
  if L15_199 ~= L16_200 then
    L15_199 = _UPVALUE1_
    L15_199 = L15_199.INVALID_ARGUMENT
    return L15_199
  end
  L15_199 = portallayoutTable
  L16_200 = "."
  L17_201 = _UPVALUE0_
  L17_201 = L17_201.HTTPMetaTags
  L15_199 = L15_199 .. L16_200 .. L17_201
  L13_197[L15_199] = A6_190
  L15_199 = _UPVALUE1_
  L15_199 = L15_199.NIL
  if A7_191 == L15_199 then
    L15_199 = _UPVALUE1_
    L15_199 = L15_199.INVALID_ARGUMENT
    return L15_199
  end
  L15_199 = _UPVALUE4_
  L15_199 = L15_199.isBoolean
  L16_200 = A7_191
  L15_199 = L15_199(L16_200)
  valid = L15_199
  L15_199 = valid
  L16_200 = _UPVALUE1_
  L16_200 = L16_200.SUCCESS
  if L15_199 ~= L16_200 then
    L15_199 = _UPVALUE1_
    L15_199 = L15_199.INVALID_ARGUMENT
    return L15_199
  end
  L15_199 = portallayoutTable
  L16_200 = "."
  L17_201 = _UPVALUE0_
  L17_201 = L17_201.activeXWebCacheCleaner
  L15_199 = L15_199 .. L16_200 .. L17_201
  L13_197[L15_199] = A7_191
  L15_199 = _UPVALUE1_
  L15_199 = L15_199.NIL
  if A8_192 == L15_199 then
    L15_199 = _UPVALUE1_
    L15_199 = L15_199.INVALID_ARGUMENT
    return L15_199
  end
  L15_199 = _UPVALUE4_
  L15_199 = L15_199.isBoolean
  L16_200 = A8_192
  L15_199 = L15_199(L16_200)
  valid = L15_199
  L15_199 = valid
  L16_200 = _UPVALUE1_
  L16_200 = L16_200.SUCCESS
  if L15_199 ~= L16_200 then
    L15_199 = _UPVALUE1_
    L15_199 = L15_199.INVALID_ARGUMENT
    return L15_199
  end
  L15_199 = portallayoutTable
  L16_200 = "."
  L17_201 = _UPVALUE0_
  L17_201 = L17_201.VPNTunnel
  L15_199 = L15_199 .. L16_200 .. L17_201
  L13_197[L15_199] = A8_192
  L15_199 = _UPVALUE1_
  L15_199 = L15_199.NIL
  if A9_193 == L15_199 then
    L15_199 = _UPVALUE1_
    L15_199 = L15_199.INVALID_ARGUMENT
    return L15_199
  end
  L15_199 = _UPVALUE4_
  L15_199 = L15_199.isBoolean
  L16_200 = A9_193
  L15_199 = L15_199(L16_200)
  valid = L15_199
  L15_199 = valid
  L16_200 = _UPVALUE1_
  L16_200 = L16_200.SUCCESS
  if L15_199 ~= L16_200 then
    L15_199 = _UPVALUE1_
    L15_199 = L15_199.INVALID_ARGUMENT
    return L15_199
  end
  L15_199 = portallayoutTable
  L16_200 = "."
  L17_201 = _UPVALUE0_
  L17_201 = L17_201.portForwarding
  L15_199 = L15_199 .. L16_200 .. L17_201
  L13_197[L15_199] = A9_193
  L15_199 = _UPVALUE1_
  L15_199 = L15_199.NIL
  if A10_194 ~= L15_199 then
    L15_199 = db
    L15_199 = L15_199.getRowWhere
    L16_200 = loginProfileTable
    L17_201 = _UPVALUE0_
    L17_201 = L17_201.loginProfileName
    L18_202 = "='"
    L19_203 = A10_194
    L17_201 = L17_201 .. L18_202 .. L19_203 .. "'"
    L18_202 = false
    L15_199 = L15_199(L16_200, L17_201, L18_202)
    L16_200 = NIL
    if L15_199 == L16_200 then
      L16_200 = _UPVALUE1_
      L16_200 = L16_200.INVALID_ARGUMENT
      return L16_200
    end
    L16_200 = portallayoutTable
    L17_201 = "."
    L18_202 = _UPVALUE0_
    L18_202 = L18_202.profileName
    L16_200 = L16_200 .. L17_201 .. L18_202
    L13_197[L16_200] = A10_194
  else
    L15_199 = _UPVALUE1_
    L15_199 = L15_199.INVALID_ARGUMENT
    return L15_199
  end
  L15_199 = db
  L15_199 = L15_199.getAttribute
  L16_200 = _UPVALUE5_
  L17_201 = _UPVALUE0_
  L17_201 = L17_201.logicalIfname
  L18_202 = _UPVALUE0_
  L18_202 = L18_202.interface
  L19_203 = _UPVALUE0_
  L19_203 = L19_203.ipAddr
  L15_199 = L15_199(L16_200, L17_201, L18_202, L19_203)
  L16_200 = portallayoutTable
  L17_201 = "."
  L18_202 = _UPVALUE0_
  L18_202 = L18_202.portalURL
  L16_200 = L16_200 .. L17_201 .. L18_202
  L17_201 = "https://"
  L18_202 = L15_199
  L19_203 = "/portal/"
  L17_201 = L17_201 .. L18_202 .. L19_203 .. A0_184
  L13_197[L16_200] = L17_201
  L16_200 = db
  L16_200 = L16_200.getTable
  L17_201 = portallayoutTable
  L16_200 = L16_200(L17_201)
  if L16_200 ~= nil then
    L17_201 = #L16_200
    L18_202 = _UPVALUE6_
    if L17_201 >= L18_202 then
      L17_201 = _UPVALUE1_
      L17_201 = L17_201.MAX_LIMIT_REACHED
      return L17_201
    end
  end
  L17_201 = db
  L17_201 = L17_201.insert
  L18_202 = portallayoutTable
  L19_203 = L13_197
  L17_201 = L17_201(L18_202, L19_203)
  L18_202 = _UPVALUE1_
  L18_202 = L18_202.NIL
  if L17_201 == L18_202 then
    L18_202 = _UPVALUE1_
    L18_202 = L18_202.FAILURE
    return L18_202
  end
  L18_202 = _UPVALUE1_
  L18_202 = L18_202.NIL
  if A11_195 == L18_202 then
    L18_202 = _UPVALUE1_
    L18_202 = L18_202.INVALID_ARGUMENT
    return L18_202
  end
  L18_202 = _UPVALUE7_
  if A11_195 == L18_202 then
    L18_202 = _UPVALUE1_
    L18_202 = L18_202.NIL
    if A12_196 == L18_202 then
      L18_202 = _UPVALUE1_
      L18_202 = L18_202.INVALID_ARGUMENT
      return L18_202
    end
  end
  L18_202 = _UPVALUE7_
  if A11_195 == L18_202 then
    L18_202 = _UPVALUE3_
    if A12_196 ~= L18_202 then
      L18_202 = db
      L18_202 = L18_202.getAttribute
      L19_203 = _UPVALUE8_
      L19_203 = L19_203.sslVpnTable
      L18_202 = L18_202(L19_203, _UPVALUE8_.attribute.domain, A12_196, _UPVALUE0_.portalLayoutName)
      L19_203 = _UPVALUE3_
      if L18_202 ~= L19_203 then
        L19_203 = db
        L19_203 = L19_203.getAttribute
        L19_203 = L19_203(portallayoutTable, _UPVALUE0_.portalLayoutName, L18_202, _UPVALUE0_.useCount)
        if L19_203 == _UPVALUE1_.NIL then
          return _UPVALUE1_.FAILURE
        end
        L19_203 = tonumber(L19_203) - 1
        L17_201 = db.setAttribute(portallayoutTable, _UPVALUE0_.portalLayoutName, L18_202, _UPVALUE0_.useCount, L19_203)
        if not L17_201 then
          return _UPVALUE1_.FAILURE
        end
      end
      L19_203 = db
      L19_203 = L19_203.setAttribute
      L19_203 = L19_203(_UPVALUE8_.sslVpnTable, _UPVALUE8_.attribute.domain, A12_196, _UPVALUE0_.portalLayoutName, A0_184)
      L17_201 = L19_203
      if not L17_201 then
        L19_203 = _UPVALUE1_
        L19_203 = L19_203.FAILURE
        return L19_203
      end
      L19_203 = db
      L19_203 = L19_203.getAttribute
      L19_203 = L19_203(portallayoutTable, _UPVALUE0_.portalLayoutName, A0_184, _UPVALUE0_.useCount)
      if L19_203 == _UPVALUE1_.NIL then
        return _UPVALUE1_.FAILURE
      end
      L19_203 = tonumber(L19_203) + 1
      L17_201 = db.setAttribute(portallayoutTable, _UPVALUE0_.portalLayoutName, A0_184, _UPVALUE0_.useCount, L19_203)
      if not L17_201 then
        return _UPVALUE1_.FAILURE
      end
    end
  else
    L18_202 = A0_184
    L19_203 = " "
    A12_196 = L18_202 .. L19_203 .. _UPVALUE9_
    L18_202 = _UPVALUE8_
    L18_202 = L18_202.sslVpnPolicyCreate
    L19_203 = A12_196
    L19_203 = L18_202(L19_203, A11_195, A0_184)
    if L18_202 ~= _UPVALUE1_.SUCCESS then
      util.appendDebugOut("Error in configuring sslVpnTable " .. L18_202)
      return L18_202
    end
  end
  L18_202 = db
  L18_202 = L18_202.getAttribute
  L19_203 = portallayoutTable
  L18_202 = L18_202(L19_203, _UPVALUE0_.portalLayoutName, A0_184, _UPVALUE10_)
  L19_203 = _UPVALUE1_
  L19_203 = L19_203.SUCCESS
  return L19_203, L18_202
end
function portalDelete(A0_204)
  local L1_205, L2_206, L3_207, L4_208, L5_209
  L1_205 = _UPVALUE0_
  L1_205 = L1_205.NIL
  if A0_204 ~= L1_205 then
    L1_205 = tonumber
    L2_206 = A0_204
    L1_205 = L1_205(L2_206)
    L2_206 = _UPVALUE0_
    L2_206 = L2_206.NIL
  elseif L1_205 == L2_206 then
    L1_205 = _UPVALUE0_
    L1_205 = L1_205.INVALID_ARGUMENT
    return L1_205
  end
  L1_205 = db
  L1_205 = L1_205.existsRow
  L2_206 = portallayoutTable
  L3_207 = _UPVALUE1_
  L4_208 = A0_204
  L1_205 = L1_205(L2_206, L3_207, L4_208)
  L2_206 = _UPVALUE0_
  L2_206 = L2_206.FALSE
  if L1_205 == L2_206 then
    L1_205 = _UPVALUE0_
    L1_205 = L1_205.INVALID_ARGUMENT
    return L1_205
  end
  L1_205 = nil
  L2_206 = db
  L2_206 = L2_206.getRow
  L3_207 = portallayoutTable
  L4_208 = _UPVALUE1_
  L5_209 = A0_204
  L2_206 = L2_206(L3_207, L4_208, L5_209)
  L3_207 = portallayoutTable
  L4_208 = "."
  L5_209 = _UPVALUE2_
  L5_209 = L5_209.portalLayoutName
  L3_207 = L3_207 .. L4_208 .. L5_209
  L3_207 = L2_206[L3_207]
  L4_208 = db
  L4_208 = L4_208.existsRow
  L5_209 = _UPVALUE3_
  L5_209 = L5_209.sslVpnTable
  L4_208 = L4_208(L5_209, _UPVALUE2_.portalLayoutName, L3_207)
  if L4_208 then
    L4_208 = db
    L4_208 = L4_208.getRow
    L5_209 = _UPVALUE3_
    L5_209 = L5_209.sslVpnTable
    L4_208 = L4_208(L5_209, _UPVALUE2_.portalLayoutName, L3_207)
    L5_209 = _UPVALUE3_
    L5_209 = L5_209.sslVpnTable
    L5_209 = L5_209 .. "." .. _UPVALUE1_
    L5_209 = L4_208[L5_209]
    if L4_208[_UPVALUE3_.sslVpnTable .. "." .. _UPVALUE3_.attribute.authType] ~= _UPVALUE4_ then
      L1_205 = db.deleteRow(_UPVALUE3_.sslVpnTable, _UPVALUE1_, L5_209)
    else
      L1_205 = db.setAttribute(_UPVALUE3_.sslVpnTable, _UPVALUE1_, L5_209, _UPVALUE2_.portalLayoutName, _UPVALUE5_)
    end
    if L1_205 == _UPVALUE0_.NIL then
      return _UPVALUE0_.FAILURE, A0_204
    end
  end
  L4_208 = db
  L4_208 = L4_208.deleteRow
  L5_209 = portallayoutTable
  L4_208 = L4_208(L5_209, _UPVALUE1_, A0_204)
  L1_205 = L4_208
  L4_208 = _UPVALUE0_
  L4_208 = L4_208.NIL
  if L1_205 == L4_208 then
    L4_208 = _UPVALUE0_
    L4_208 = L4_208.FAILURE
    L5_209 = A0_204
    return L4_208, L5_209
  end
  L4_208 = _UPVALUE0_
  L4_208 = L4_208.SUCCESS
  L5_209 = A0_204
  return L4_208, L5_209
end
function portalDeleteAll()
  local L0_210, L1_211, L2_212, L3_213, L4_214, L5_215, L6_216, L7_217, L8_218, L9_219, L10_220
  L0_210 = {}
  L1_211 = db
  L1_211 = L1_211.getTable
  L1_211 = L1_211(L2_212, L3_213)
  for L5_215, L6_216 in L2_212(L3_213) do
    L7_217 = L1_211[L5_215]
    L7_217 = L7_217._ROWID_
    if L7_217 ~= "1" then
      L7_217 = db
      L7_217 = L7_217.getRow
      L8_218 = portallayoutTable
      L9_219 = _UPVALUE0_
      L10_220 = L1_211[L5_215]
      L10_220 = L10_220._ROWID_
      L7_217 = L7_217(L8_218, L9_219, L10_220)
      L8_218 = portallayoutTable
      L9_219 = "."
      L10_220 = _UPVALUE1_
      L10_220 = L10_220.portalLayoutName
      L8_218 = L8_218 .. L9_219 .. L10_220
      L8_218 = L7_217[L8_218]
      L9_219 = db
      L9_219 = L9_219.existsRow
      L10_220 = _UPVALUE2_
      L10_220 = L10_220.sslVpnTable
      L9_219 = L9_219(L10_220, _UPVALUE1_.portalLayoutName, L8_218)
      if L9_219 then
        L9_219 = db
        L9_219 = L9_219.getRow
        L10_220 = _UPVALUE2_
        L10_220 = L10_220.sslVpnTable
        L9_219 = L9_219(L10_220, _UPVALUE1_.portalLayoutName, L8_218)
        L10_220 = _UPVALUE2_
        L10_220 = L10_220.sslVpnTable
        L10_220 = L10_220 .. "." .. _UPVALUE0_
        L10_220 = L9_219[L10_220]
        if L9_219[_UPVALUE2_.sslVpnTable .. "." .. _UPVALUE2_.attribute.authType] ~= _UPVALUE3_ then
          L0_210 = db.deleteRow(_UPVALUE2_.sslVpnTable, _UPVALUE0_, L10_220)
        else
          L0_210 = db.setAttribute(_UPVALUE2_.sslVpnTable, _UPVALUE0_, L10_220, _UPVALUE1_.portalLayoutName, _UPVALUE4_)
        end
        if L0_210 == _UPVALUE5_.NIL then
          return _UPVALUE5_.FAILURE
        end
      end
      L9_219 = db
      L9_219 = L9_219.deleteRow
      L10_220 = portallayoutTable
      L9_219 = L9_219(L10_220, _UPVALUE0_, L1_211[L5_215]._ROWID_)
      L0_210 = L9_219
      if not L0_210 then
        L9_219 = _UPVALUE5_
        L9_219 = L9_219.FAILURE
        return L9_219
      end
    end
  end
  return L2_212
end
function currentPortalInfoGet(A0_221)
  local L1_222, L2_223, L3_224
  L1_222 = db
  L1_222 = L1_222.getRow
  L2_223 = portallayoutTable
  L3_224 = _UPVALUE0_
  L3_224 = L3_224.portalLayoutName
  L1_222 = L1_222(L2_223, L3_224, A0_221)
  L2_223 = _UPVALUE1_
  L2_223 = L2_223.NIL
  if L1_222 == L2_223 then
    L2_223 = _UPVALUE1_
    L2_223 = L2_223.FAILURE
    return L2_223
  end
  L2_223, L3_224 = nil, nil
  L2_223 = L1_222[portallayoutTable .. "." .. _UPVALUE0_.VPNTunnel]
  L3_224 = L1_222[portallayoutTable .. "." .. _UPVALUE0_.portForwarding]
  return _UPVALUE1_.SUCCESS, L2_223, L3_224
end
function sslDomainGetCur(A0_225)
  local L1_226, L2_227, L3_228
  L1_226 = db
  L1_226 = L1_226.getAttribute
  L2_227 = portallayoutTable
  L3_228 = _UPVALUE0_
  L1_226 = L1_226(L2_227, L3_228, A0_225, _UPVALUE1_.portalLayoutName)
  L2_227 = _UPVALUE2_
  L2_227 = L2_227.NIL
  if L1_226 == L2_227 then
    L2_227 = _UPVALUE2_
    L2_227 = L2_227.FAILURE
    return L2_227
  end
  L2_227, L3_228 = nil, nil
  if db.existsRow(_UPVALUE3_.sslVpnTable, _UPVALUE1_.portalLayoutName, L1_226) then
    L2_227 = db.getRow(_UPVALUE3_.sslVpnTable, _UPVALUE1_.portalLayoutName, L1_226)[_UPVALUE3_.sslVpnTable .. "." .. _UPVALUE3_.attribute.authType]
    L3_228 = db.getRow(_UPVALUE3_.sslVpnTable, _UPVALUE1_.portalLayoutName, L1_226)[_UPVALUE3_.sslVpnTable .. "." .. _UPVALUE3_.attribute.domain]
  end
  return _UPVALUE2_.SUCCESS, L2_227, L3_228
end
function sslDomainLocalGetAll()
  local L0_229, L1_230, L2_231
  L1_230 = {}
  L2_231 = db
  L2_231 = L2_231.getTable
  L2_231 = L2_231(_UPVALUE0_.groupsTable)
  if not L2_231 then
    return _UPVALUE1_.FAILURE
  end
  for _FORV_7_, _FORV_8_ in pairs(L2_231) do
    if isSslVpnUser(_FORV_8_[_UPVALUE0_.groupsTable .. "." .. _UPVALUE0_.attribute.capabilities]) then
      L1_230[1] = _FORV_8_
    end
  end
  return _UPVALUE1_.SUCCESS, L1_230
end
function isSslVpnUser(A0_232)
  local L1_233
  L1_233 = {}
  L1_233 = util.split(A0_232, ",")
  for _FORV_5_, _FORV_6_ in pairs(L1_233) do
    if _FORV_6_ == "0" then
      return true
    end
  end
  return false
end
