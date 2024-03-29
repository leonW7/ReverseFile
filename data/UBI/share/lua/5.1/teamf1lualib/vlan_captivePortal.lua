local L0_0
L0_0 = module
L0_0("com.teamf1.core.vlan.captiveportal", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vlan_validation")
L0_0 = require
L0_0("teamf1lualib/captivePortal_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.captivePortal_returnCodes")
captiveportalTable = "CaptivePortalVlan"
captiveTable = "captiveportal"
;({}).vlanId = "vlanId"
;({}).name = "ifName"
;({}).captivePortalType = "accessType"
;({}).authenticationType = "authServerId"
;({}).loginProfile = "profileId"
;({}).redirectType = "redirectType"
;({}).captivePortalName = "captivePortalName"
;({}).authenticationSubTypeName = "authenticationSubTypeName"
;({}).authenticationTypeName = "authenticationTypeName"
;({}).profileName = "profileName"
;({}).enable = "enable"
;({}).redirect = "enableRedirect"
;({}).url = "url"
;({}).paymentGwPaypal = "paymentGwPaypal"
;({}).paymentGwPaypalTest = "paymentGwPaypalTest"
;({}).Paypal = "Paypal"
;({}).PaypalTest = "PaypalTest"
;({}).ipaddress = "ipAddress"
authType = {}
authType.Free = "Free"
authType.SLA = "SLA"
authType.permanent = "Permanent"
authType.temporary = "Temporary"
authType.Billing = "Billing"
authServer = {}
authServer.Local = "local"
authServer.radius = "radius"
authServer.ldap = "ldap"
authServer.pop3 = "pop3"
authServer.activeDirectory = "activeDirectory"
authServer.ntDomain = "ntDomain"
authServer.radiusType = {}
authServer.radiusType.pap = "pap"
authServer.radiusType.chap = "chap"
authServer.radiusType.mschap = "ms-chap"
authServer.radiusType.mschapv1 = "ms-chapv2"
serverValue = {}
serverValue[authServer.Local] = "0"
serverValue[authServer.ldap] = "20"
serverValue[authServer.pop3] = "50"
serverValue[authServer.radiusType.pap] = "11"
serverValue[authServer.radiusType.chap] = "12"
serverValue[authServer.radiusType.mschap] = "13"
serverValue[authServer.radiusType.mschapv1] = "14"
serverValue[authServer.activeDirectory] = "30"
serverValue[authServer.ntDomain] = "40"
authTypeValue = {}
authTypeValue[authType.Free] = "0"
authTypeValue[authType.SLA] = "1"
authTypeValue[authType.permanent] = "2"
authTypeValue[authType.temporary] = "3"
authTypeValue[authType.Billing] = "4"
loginProfileTable = "CaptivePortalPageDetails"
attributes = {}
attributes.name = "configurationName"
attributes.profileId = "profileId"
attributes.paymentGwServer = "paymentGwServer"
attributes.paymentGateway = "paymentGateway"
loginProfileSlaTable = "slaProfile"
attributesSla = {}
attributesSla.name = "slaProfileName"
attributesSla.profileId = "_ROWID_"
ENABLE = "1"
DISABLE = "0"
vlanMinNumber = 1
vlanMaxNumber = 4096
BDG_NAME = "bdg"
ROWID = "_ROWID_"
REDIRECT2 = "2"
REDIRECT1 = "0"
function vlanIdGet()
  local L0_1, L1_2
  L0_1 = firstCookieGet
  L1_2 = captiveportalTable
  L0_1 = L0_1(L1_2)
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(captiveportalTable, ROWID, L0_1, _UPVALUE0_.vlanId)
  if L1_2 == NIL then
    return _UPVALUE1_.FAILURE, L0_1
  end
  return _UPVALUE1_.SUCCESS, L0_1, L1_2
end
function vlanIdGetNext(A0_3)
  local L1_4, L2_5, L3_6
  L1_4 = nextCookieGet
  L2_5 = A0_3
  L3_6 = captiveportalTable
  L2_5 = L1_4(L2_5, L3_6)
  L3_6 = FALSE
  if L1_4 == L3_6 then
    L3_6 = NIL
    if L2_5 == L3_6 then
      L3_6 = _UPVALUE0_
      L3_6 = L3_6.NEXT_ROWID_INVALID
      return L3_6
    else
      L3_6 = _UPVALUE0_
      L3_6 = L3_6.INVALID_COOKIE
      return L3_6
    end
  end
  L3_6 = db
  L3_6 = L3_6.getAttribute
  L3_6 = L3_6(captiveportalTable, ROWID, L1_4, _UPVALUE1_.vlanId)
  if L3_6 == NIL then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L3_6
end
function vlanIdSet(A0_7, A1_8)
  local L3_9
  L3_9 = _UPVALUE0_
  L3_9 = L3_9.NOT_SUPPORTED
  return L3_9, A0_7
end
function vlanIdDelete(A0_10, A1_11)
  if checkCookieExists(A0_10, captiveportalTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIES
  end
  if db.deleteRow(captiveportalTable, ROWID, A0_10) == NIL then
    return _UPVALUE0_.FAILURE, A0_10
  end
  return _UPVALUE0_.SUCCESS, A0_10
end
function captivePortalTypeGet()
  local L0_12, L1_13, L2_14
  L0_12 = firstCookieGet
  L1_13 = captiveportalTable
  L0_12 = L0_12(L1_13)
  L1_13 = db
  L1_13 = L1_13.getAttribute
  L2_14 = captiveportalTable
  L1_13 = L1_13(L2_14, ROWID, L0_12, _UPVALUE0_.captivePortalType)
  L2_14 = nil
  for _FORV_6_, _FORV_7_ in pairs(authTypeValue) do
    if _FORV_7_ == L1_13 then
      L2_14 = _FORV_6_
      break
    end
  end
  if L2_14 == NIL then
    return _UPVALUE1_.FAILURE, L0_12
  end
  return _UPVALUE1_.SUCCESS, L0_12, L2_14
end
function captivePortalTypeGetNext(A0_15)
  local L1_16, L2_17, L3_18, L4_19
  L1_16 = nextCookieGet
  L2_17 = A0_15
  L3_18 = captiveportalTable
  L2_17 = L1_16(L2_17, L3_18)
  L3_18 = FALSE
  if L1_16 == L3_18 then
    L3_18 = NIL
    if L2_17 == L3_18 then
      L3_18 = _UPVALUE0_
      L3_18 = L3_18.NEXT_ROWID_INVALID
      return L3_18
    else
      L3_18 = _UPVALUE0_
      L3_18 = L3_18.INVALID_COOKIE
      return L3_18
    end
  end
  L3_18 = db
  L3_18 = L3_18.getAttribute
  L4_19 = captiveportalTable
  L3_18 = L3_18(L4_19, ROWID, L1_16, _UPVALUE1_.captivePortalType)
  L4_19 = nil
  for _FORV_8_, _FORV_9_ in pairs(authTypeValue) do
    if _FORV_9_ == L3_18 then
      L4_19 = _FORV_8_
      break
    end
  end
  if L4_19 == NIL then
    return _UPVALUE0_.FAILURE, A0_15
  end
  return _UPVALUE0_.SUCCESS, A0_15, L4_19
end
function captivePortalTypeSet(A0_20, A1_21)
  local L2_22
  L2_22 = checkCookieExists
  L2_22 = L2_22(A0_20, captiveportalTable)
  if L2_22 == FALSE then
    L2_22 = _UPVALUE0_
    L2_22 = L2_22.INVALID_COOKIES
    return L2_22
  end
  L2_22 = NIL
  if A1_21 == L2_22 then
    L2_22 = _UPVALUE0_
    L2_22 = L2_22.INVALID_ARGUMENT
    return L2_22
  end
  L2_22 = authType
  L2_22 = L2_22.Free
  if A1_21 ~= L2_22 then
    L2_22 = authType
    L2_22 = L2_22.permanent
    if A1_21 ~= L2_22 then
      L2_22 = authType
      L2_22 = L2_22.SLA
      if A1_21 ~= L2_22 then
        L2_22 = authType
        L2_22 = L2_22.temporary
        if A1_21 ~= L2_22 then
          L2_22 = _UPVALUE0_
          L2_22 = L2_22.INVALID_ARGUMENT
          return L2_22
        end
      end
    end
  end
  L2_22 = nil
  for _FORV_6_, _FORV_7_ in pairs(authTypeValue) do
    if _FORV_6_ == A1_21 then
      L2_22 = _FORV_7_
      break
    end
  end
  if db.setAttribute(captiveportalTable, ROWID, A0_20, _UPVALUE1_.captivePortalType, L2_22) == NIL then
    return _UPVALUE0_.FAILURE, A0_20
  end
  return _UPVALUE0_.SUCCESS, A0_20
end
function authenticationTypeGet()
  local L0_23, L1_24, L2_25
  L0_23 = firstCookieGet
  L1_24 = captiveportalTable
  L0_23 = L0_23(L1_24)
  L1_24 = db
  L1_24 = L1_24.getAttribute
  L2_25 = captiveportalTable
  L1_24 = L1_24(L2_25, ROWID, L0_23, _UPVALUE0_.authenticationType)
  L2_25 = nil
  for _FORV_6_, _FORV_7_ in pairs(serverValue) do
    if _FORV_7_ == L1_24 then
      L2_25 = _FORV_6_
      break
    end
  end
  if L2_25 == authServer.radiusType.pap or L2_25 == authServer.radiusType.chap or L2_25 == authServer.radiusType.mschap or L2_25 == authServer.radiusType.mschapv1 then
    L2_25 = authServer.radius
  end
  if L2_25 == NIL then
    return _UPVALUE1_.FAILURE, L0_23
  end
  return _UPVALUE1_.SUCCESS, L0_23, L2_25
end
function authenticationTypeGetNext(A0_26)
  local L1_27, L2_28, L3_29, L4_30
  L1_27 = nextCookieGet
  L2_28 = A0_26
  L3_29 = captiveportalTable
  L2_28 = L1_27(L2_28, L3_29)
  L3_29 = FALSE
  if L1_27 == L3_29 then
    L3_29 = NIL
    if L2_28 == L3_29 then
      L3_29 = _UPVALUE0_
      L3_29 = L3_29.NEXT_ROWID_INVALID
      return L3_29
    else
      L3_29 = _UPVALUE0_
      L3_29 = L3_29.INVALID_COOKIE
      return L3_29
    end
  end
  L3_29 = db
  L3_29 = L3_29.getAttribute
  L4_30 = captiveportalTable
  L3_29 = L3_29(L4_30, ROWID, L1_27, _UPVALUE1_.authenticationType)
  L4_30 = nil
  for _FORV_8_, _FORV_9_ in pairs(serverValue) do
    if _FORV_9_ == L3_29 then
      L4_30 = _FORV_8_
      break
    end
  end
  if L4_30 == authServer.radiusType.pap or L4_30 == authServer.radiusType.chap or L4_30 == authServer.radiusType.mschap or L4_30 == authServer.radiusType.mschapv1 then
    L4_30 = authServer.radius
  end
  if L4_30 == NIL then
    return _UPVALUE0_.FAILURE, L1_27
  end
  return _UPVALUE0_.SUCCESS, L1_27, L4_30
end
function authenticationTypeSet(A0_31, A1_32)
  local L2_33
  L2_33 = checkCookieExists
  L2_33 = L2_33(A0_31, captiveportalTable)
  if L2_33 == FALSE then
    L2_33 = _UPVALUE0_
    L2_33 = L2_33.INVALID_COOKIES
    return L2_33
  end
  L2_33 = NIL
  if A1_32 == L2_33 then
    L2_33 = _UPVALUE0_
    L2_33 = L2_33.INVALID_ARGUMENT
    return L2_33
  end
  L2_33 = authServer
  L2_33 = L2_33.Local
  if A1_32 ~= L2_33 then
    L2_33 = authServer
    L2_33 = L2_33.radius
    if A1_32 ~= L2_33 then
      L2_33 = authServer
      L2_33 = L2_33.ldap
      if A1_32 ~= L2_33 then
        L2_33 = authServer
        L2_33 = L2_33.pop3
        if A1_32 ~= L2_33 then
          L2_33 = _UPVALUE0_
          L2_33 = L2_33.INVALID_ARGUMENT
          return L2_33
        end
      end
    end
  end
  L2_33 = nil
  for _FORV_6_, _FORV_7_ in pairs(serverValue) do
    if _FORV_6_ == A1_32 then
      L2_33 = _FORV_7_
      break
    end
  end
  if L2_33 == NIL then
    L2_33 = serverValue[authServer.radiusType.pap]
  end
  if db.setAttribute(captiveportalTable, ROWID, A0_31, _UPVALUE1_.authenticationType, L2_33) == NIL then
    return _UPVALUE0_.FAILURE, A0_31
  end
  return _UPVALUE0_.SUCCESS, A0_31
end
function authenticationSubTypeGet()
  local L0_34, L1_35, L2_36
  L0_34 = firstCookieGet
  L1_35 = captiveportalTable
  L0_34 = L0_34(L1_35)
  L1_35 = db
  L1_35 = L1_35.getAttribute
  L2_36 = captiveportalTable
  L1_35 = L1_35(L2_36, ROWID, L0_34, _UPVALUE0_.authenticationType)
  L2_36 = NIL
  if L1_35 == L2_36 then
    L2_36 = _UPVALUE1_
    L2_36 = L2_36.FAILURE
    return L2_36, L0_34
  end
  L2_36 = nil
  for _FORV_6_, _FORV_7_ in pairs(serverValue) do
    if _FORV_7_ == L1_35 then
      L2_36 = _FORV_6_
      break
    end
  end
  if L2_36 == authServer.Local or L2_36 == authServer.ldap or L2_36 == authServer.pop3 then
    L2_36 = NIL
  end
  return _UPVALUE1_.SUCCESS, L0_34, L2_36
end
function authenticationSubTypeGetNext(A0_37)
  local L1_38, L2_39, L3_40, L4_41
  L1_38 = nextCookieGet
  L2_39 = A0_37
  L3_40 = captiveportalTable
  L2_39 = L1_38(L2_39, L3_40)
  L3_40 = FALSE
  if L1_38 == L3_40 then
    L3_40 = NIL
    if L2_39 == L3_40 then
      L3_40 = _UPVALUE0_
      L3_40 = L3_40.NEXT_ROWID_INVALID
      return L3_40
    else
      L3_40 = _UPVALUE0_
      L3_40 = L3_40.INVALID_COOKIE
      return L3_40
    end
  end
  L3_40 = db
  L3_40 = L3_40.getAttribute
  L4_41 = captiveportalTable
  L3_40 = L3_40(L4_41, ROWID, L1_38, _UPVALUE1_.authenticationType)
  L4_41 = NIL
  if L3_40 == L4_41 then
    L4_41 = _UPVALUE0_
    L4_41 = L4_41.FAILURE
    return L4_41, L1_38
  end
  L4_41 = nil
  for _FORV_8_, _FORV_9_ in pairs(serverValue) do
    if _FORV_9_ == L3_40 then
      authenticationType = _FORV_8_
      break
    end
  end
  if L4_41 == authServer.Local or L4_41 == authServer.ldap or L4_41 == authServer.pop3 then
    L4_41 = NIL
  end
  return _UPVALUE0_.SUCCESS, L1_38, L4_41
end
function authenticationSubTypeSet(A0_42, A1_43)
  local L2_44
  L2_44 = checkCookieExists
  L2_44 = L2_44(A0_42, captiveportalTable)
  if L2_44 == FALSE then
    L2_44 = _UPVALUE0_
    L2_44 = L2_44.INVALID_COOKIES
    return L2_44
  end
  L2_44 = NIL
  if A1_43 == L2_44 then
    L2_44 = _UPVALUE0_
    L2_44 = L2_44.INVALID_ARGUMENT
    return L2_44
  end
  L2_44 = authServer
  L2_44 = L2_44.radiusType
  L2_44 = L2_44.pap
  if A1_43 ~= L2_44 then
    L2_44 = authServer
    L2_44 = L2_44.radiusType
    L2_44 = L2_44.chap
    if A1_43 ~= L2_44 then
      L2_44 = authServer
      L2_44 = L2_44.radiusType
      L2_44 = L2_44.mschap
      if A1_43 ~= L2_44 then
        L2_44 = authServer
        L2_44 = L2_44.radiusType
        L2_44 = L2_44.mschapv1
        if A1_43 ~= L2_44 then
          L2_44 = _UPVALUE0_
          L2_44 = L2_44.INVALID_ARGUMENT
          return L2_44
        end
      end
    end
  end
  L2_44 = nil
  for _FORV_7_, _FORV_8_ in pairs(serverValue) do
    if _FORV_7_ == A1_43 then
      L2_44 = _FORV_8_
      break
    end
  end
  if db.setAttribute(captiveportalTable, ROWID, A0_42, _UPVALUE1_.authenticationType, L2_44) == NIL then
    return _UPVALUE0_.FAILURE, A0_42
  end
  return _UPVALUE0_.SUCCESS, A0_42
end
function loginProfileGet()
  local L0_45, L1_46, L2_47
  L0_45 = firstCookieGet
  L1_46 = captiveportalTable
  L0_45 = L0_45(L1_46)
  L1_46 = db
  L1_46 = L1_46.getAttribute
  L2_47 = captiveportalTable
  L1_46 = L1_46(L2_47, ROWID, L0_45, _UPVALUE0_.loginProfile)
  L2_47 = db
  L2_47 = L2_47.getAttribute
  L2_47 = L2_47(loginProfileTable, attributes.profileId, L1_46, attributes.name)
  if L2_47 == NIL then
    return _UPVALUE1_.FAILURE, L0_45
  end
  return _UPVALUE1_.SUCCESS, L0_45, L2_47
end
function loginProfileGetNext(A0_48)
  local L1_49, L2_50, L3_51, L4_52
  L1_49 = nextCookieGet
  L2_50 = A0_48
  L3_51 = captiveportalTable
  L2_50 = L1_49(L2_50, L3_51)
  L3_51 = FALSE
  if L1_49 == L3_51 then
    L3_51 = NIL
    if L2_50 == L3_51 then
      L3_51 = _UPVALUE0_
      L3_51 = L3_51.NEXT_ROWID_INVALID
      return L3_51
    else
      L3_51 = _UPVALUE0_
      L3_51 = L3_51.INVALID_COOKIE
      return L3_51
    end
  end
  L3_51 = db
  L3_51 = L3_51.getAttribute
  L4_52 = captiveportalTable
  L3_51 = L3_51(L4_52, ROWID, A0_48, _UPVALUE1_.loginProfile)
  L4_52 = db
  L4_52 = L4_52.getAttribute
  L4_52 = L4_52(loginProfileTable, attributes.profileId, L3_51, attributes.name)
  if L4_52 == NIL then
    return _UPVALUE0_.FAILURE, L1_49
  end
  return _UPVALUE0_.SUCCESS, L1_49, L4_52
end
function loginProfileSet(A0_53, A1_54)
  local L2_55
  L2_55 = checkCookieExists
  L2_55 = L2_55(A0_53, captiveportalTable)
  if L2_55 == FALSE then
    L2_55 = _UPVALUE0_
    L2_55 = L2_55.INVALID_COOKIES
    return L2_55
  end
  L2_55 = NIL
  if A1_54 == L2_55 then
    L2_55 = _UPVALUE0_
    L2_55 = L2_55.INVALID_ARGUMENT
    return L2_55
  end
  L2_55 = db
  L2_55 = L2_55.getAttribute
  L2_55 = L2_55(loginProfileTable, attributes.name, A1_54, attributes.profileId)
  if L2_55 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(captiveportalTable, ROWID, A0_53, _UPVALUE1_.loginProfile, L2_55) == NIL then
    return _UPVALUE0_.FAILURE, A0_53
  end
  return _UPVALUE0_.SUCCESS, A0_53
end
function captivePortalGet(A0_56)
  local L1_57, L2_58, L3_59, L4_60, L5_61, L6_62, L7_63, L8_64, L9_65
  L1_57 = db
  L1_57 = L1_57.getRow
  L2_58 = captiveportalTable
  L3_59 = ROWID
  L1_57 = L1_57(L2_58, L3_59, L4_60)
  L2_58 = NIL
  if L1_57 == L2_58 then
    L2_58 = _UPVALUE0_
    L2_58 = L2_58.FAILURE
    L3_59 = A0_56
    return L2_58, L3_59
  end
  L2_58 = captiveportalTable
  L3_59 = "."
  L2_58 = L2_58 .. L3_59 .. L4_60
  L2_58 = L1_57[L2_58]
  L3_59 = nil
  for L7_63, L8_64 in L4_60(L5_61) do
    if L8_64 == L2_58 then
      L3_59 = L7_63
      break
    end
  end
  L7_63 = _UPVALUE1_
  L7_63 = L7_63.redirectType
  L7_63 = nil
  for _FORV_11_, _FORV_12_ in L8_64(L9_65) do
    if _FORV_12_ == L4_60 then
      break
    end
  end
  if L6_62 ~= L8_64 then
  elseif L6_62 == L8_64 then
    L7_63 = L6_62
  end
  if L8_64 == NIL then
    return _UPVALUE0_.FAILURE, A0_56
  end
  return _UPVALUE0_.SUCCESS, A0_56, L1_57[captiveportalTable .. "." .. _UPVALUE1_.vlanId], L3_59, L6_62, L7_63, L8_64, L5_61
end
function captivePortalGetNext(A0_66)
  local L1_67, L2_68, L3_69, L4_70, L5_71, L6_72, L7_73, L8_74, L9_75
  L1_67 = nextCookieGet
  L2_68 = A0_66
  L3_69 = captiveportalTable
  L2_68 = L1_67(L2_68, L3_69)
  L3_69 = FALSE
  if L1_67 == L3_69 then
    L3_69 = NIL
    if L2_68 == L3_69 then
      L3_69 = _UPVALUE0_
      L3_69 = L3_69.NEXT_ROWID_INVALID
      return L3_69
    else
      L3_69 = _UPVALUE0_
      L3_69 = L3_69.INVALID_COOKIE
      return L3_69
    end
  end
  L3_69 = db
  L3_69 = L3_69.getRow
  L4_70 = captiveportalTable
  L5_71 = ROWID
  L3_69 = L3_69(L4_70, L5_71, L6_72)
  L4_70 = NIL
  if L3_69 == L4_70 then
    L4_70 = _UPVALUE0_
    L4_70 = L4_70.FAILURE
    L5_71 = L1_67
    return L4_70, L5_71
  end
  L4_70 = captiveportalTable
  L5_71 = "."
  L4_70 = L4_70 .. L5_71 .. L6_72
  L4_70 = L3_69[L4_70]
  L5_71 = nil
  for L9_75, _FORV_10_ in L6_72(L7_73) do
    if _FORV_10_ == L4_70 then
      L5_71 = L9_75
      break
    end
  end
  for _FORV_12_, _FORV_13_ in L9_75(serverValue) do
    if _FORV_13_ == L6_72 then
      break
    end
  end
  if L7_73 ~= L9_75 then
  elseif L7_73 == L9_75 then
  end
  if L5_71 ~= authType.SLA and db.getAttribute(loginProfileTable, attributes.profileId, L9_75, attributes.name) == NIL then
    return _UPVALUE0_.FAILURE, A0_66
  end
  return _UPVALUE0_.SUCCESS, L1_67, L3_69[captiveportalTable .. "." .. _UPVALUE1_.vlanId], L5_71, L7_73, L8_74, profileName
end
function captivePortalGetAll()
  local L0_76, L1_77, L2_78, L3_79, L4_80, L5_81, L6_82, L7_83, L8_84, L9_85, L10_86
  L0_76 = db
  L0_76 = L0_76.getTable
  L0_76 = L0_76(L1_77)
  if L0_76 == L1_77 then
    return L1_77, L2_78
  end
  for L4_80, L5_81 in L1_77(L2_78) do
    for L9_85, L10_86 in L6_82(L7_83) do
      if L9_85 == captiveportalTable .. "." .. _UPVALUE1_.captivePortalType then
        for _FORV_14_, _FORV_15_ in pairs(authTypeValue) do
          if _FORV_15_ == L10_86 then
            L5_81[captiveportalTable .. "." .. _UPVALUE1_.captivePortalName] = _FORV_14_
            break
          end
        end
      end
      if L9_85 == captiveportalTable .. "." .. _UPVALUE1_.authenticationType then
        for _FORV_16_, _FORV_17_ in pairs(serverValue) do
          if _FORV_17_ == L10_86 then
            L5_81[captiveportalTable .. "." .. _UPVALUE1_.authenticationTypeName] = _FORV_16_
            break
          end
        end
        if L5_81[captiveportalTable .. "." .. _UPVALUE1_.authenticationTypeName] == authServer.radiusType.pap or L5_81[captiveportalTable .. "." .. _UPVALUE1_.authenticationTypeName] == authServer.radiusType.chap or L5_81[captiveportalTable .. "." .. _UPVALUE1_.authenticationTypeName] == authServer.radiusType.mschap or L5_81[captiveportalTable .. "." .. _UPVALUE1_.authenticationTypeName] == authServer.radiusType.mschapv1 then
          L5_81[captiveportalTable .. "." .. _UPVALUE1_.authenticationSubTypeName] = L5_81[captiveportalTable .. "." .. _UPVALUE1_.authenticationTypeName]
          L5_81[captiveportalTable .. "." .. _UPVALUE1_.authenticationTypeName] = authServer.radius
        end
      end
      if L9_85 == captiveportalTable .. "." .. _UPVALUE1_.loginProfile and (L10_86 ~= "" or L10_86 ~= NIL) then
        L5_81[captiveportalTable .. "." .. _UPVALUE1_.profileName] = db.getAttribute(loginProfileTable, attributes.profileId, L10_86, attributes.name)
      end
    end
  end
  return L1_77, L2_78
end
function captivePortalSet(A0_87, A1_88, A2_89, A3_90, A4_91, A5_92, A6_93)
  local L7_94, L8_95, L9_96, L10_97, L11_98, L12_99, L13_100
  L7_94 = checkCookieExists
  L8_95 = A0_87
  L7_94 = L7_94(L8_95, L9_96)
  L8_95 = FALSE
  if L7_94 == L8_95 then
    L7_94 = _UPVALUE0_
    L7_94 = L7_94.INVALID_COOKIES
    return L7_94
  end
  L7_94 = NIL
  if A1_88 == L7_94 then
    L7_94 = _UPVALUE1_
    L7_94 = L7_94.COMP_CAPTIVEPORTAL_VLAN_VLANID_NIL
    return L7_94
  end
  L7_94 = tonumber
  L8_95 = A1_88
  L7_94 = L7_94(L8_95)
  L8_95 = vlanMinNumber
  if not (L7_94 < L8_95) then
    L8_95 = vlanMaxNumber
  elseif L7_94 > L8_95 then
    L8_95 = _UPVALUE1_
    L8_95 = L8_95.COMP_CAPTIVEPORTAL_VLAN_VLANID_INVALID
    return L8_95
  end
  L8_95 = NIL
  if A2_89 == L8_95 then
    L8_95 = _UPVALUE1_
    L8_95 = L8_95.COMP_CAPTIVEPORTAL_VLAN_CAPTIVEPORTALTYPE_NIL
    return L8_95
  end
  L8_95 = authType
  L8_95 = L8_95.Free
  if A2_89 ~= L8_95 then
    L8_95 = authType
    L8_95 = L8_95.permanent
    if A2_89 ~= L8_95 then
      L8_95 = _UPVALUE1_
      L8_95 = L8_95.COMP_CAPTIVEPORTAL_VLAN_CAPTIVEPORTALTYPE_INVALID
      return L8_95
    end
  end
  L8_95 = nil
  for L12_99, L13_100 in L9_96(L10_97) do
    if L12_99 == A2_89 then
      L8_95 = L13_100
      break
    end
  end
  if A2_89 ~= L9_96 then
    if A3_90 ~= L9_96 then
      if A3_90 ~= L9_96 then
        if A3_90 ~= L9_96 then
          if A3_90 ~= L9_96 then
            if A3_90 ~= L9_96 then
              if A3_90 ~= L9_96 then
                return L9_96
              end
            end
          end
        end
      end
    end
  end
  if A3_90 == L9_96 then
    if L9_96 ~= nil then
    elseif L10_97 == 0 then
      return L10_97
    end
  elseif A3_90 == L9_96 then
    if L9_96 ~= nil then
    elseif L10_97 == 0 then
      return L10_97
    end
  elseif A3_90 == L9_96 then
    if L9_96 ~= nil then
    elseif L10_97 == 0 then
      return L10_97
    end
  elseif A3_90 == L9_96 then
    if L9_96 ~= nil then
    elseif L10_97 == 0 then
      return L10_97
    end
  elseif A3_90 == L9_96 then
    if L9_96 ~= nil then
    elseif L10_97 == 0 then
      return L10_97
    end
  end
  if A3_90 == L9_96 then
    if A4_91 ~= L9_96 then
      if A4_91 ~= L9_96 then
        if A4_91 ~= L9_96 then
          if A4_91 ~= L9_96 then
            return L9_96
          end
        end
      end
    end
    A3_90 = A4_91
  end
  for L13_100, _FORV_14_ in L10_97(L11_98) do
    if L13_100 == A3_90 then
      break
    end
  end
  if A5_92 == L11_98 then
    return L11_98
  end
  L13_100 = attributes
  L13_100 = L13_100.name
  if L10_97 == L11_98 then
    return L11_98
  end
  if A6_93 == L11_98 then
    return L11_98
  end
  if A1_88 == "1" then
  else
    L13_100 = "LAN"
  end
  L13_100 = "LogicalIfName = '"
  L13_100 = L13_100 .. L12_99 .. "' AND AddressFamily='2'"
  L11_98[captiveportalTable .. "." .. _UPVALUE2_.captivePortalType] = L8_95
  L11_98[captiveportalTable .. "." .. _UPVALUE2_.authenticationType] = L9_96
  L11_98[captiveportalTable .. "." .. _UPVALUE2_.loginProfile] = L10_97
  L11_98[captiveportalTable .. "." .. _UPVALUE2_.redirectType] = A6_93
  L11_98[captiveportalTable .. "." .. _UPVALUE2_.ipaddress] = db.getAttributeWhere("ifStatic", L13_100, "StaticIp")
  if db.update(captiveportalTable, L11_98, A0_87) == NIL then
    return _UPVALUE0_.FAILURE, A0_87
  end
  return _UPVALUE0_.SUCCESS, A0_87
end
function captivePortalCreate(A0_101, A1_102, A2_103, A3_104, A4_105, A5_106)
  local L6_107, L7_108, L8_109, L9_110, L10_111, L11_112, L12_113, L13_114, L14_115, L15_116
  L6_107 = NIL
  if A0_101 == L6_107 then
    L6_107 = _UPVALUE0_
    L6_107 = L6_107.COMP_CAPTIVEPORTAL_VLAN_VLANID_NIL
    return L6_107
  end
  L6_107 = tonumber
  L7_108 = A0_101
  L6_107 = L6_107(L7_108)
  L7_108 = vlanMinNumber
  if not (L6_107 < L7_108) then
    L7_108 = vlanMaxNumber
  elseif L6_107 > L7_108 then
    L7_108 = _UPVALUE0_
    L7_108 = L7_108.COMP_CAPTIVEPORTAL_VLAN_VLANID_INVALID
    return L7_108
  end
  L7_108 = NIL
  if A1_102 == L7_108 then
    L7_108 = _UPVALUE0_
    L7_108 = L7_108.COMP_CAPTIVEPORTAL_VLAN_CAPTIVEPORTALTYPE_NIL
    return L7_108
  end
  L7_108 = authType
  L7_108 = L7_108.Free
  if A1_102 ~= L7_108 then
    L7_108 = authType
    L7_108 = L7_108.permanent
    if A1_102 ~= L7_108 then
      L7_108 = _UPVALUE0_
      L7_108 = L7_108.COMP_CAPTIVEPORTAL_VLAN_CAPTIVEPORTALTYPE_INVALID
      return L7_108
    end
  end
  L7_108 = nil
  for L11_112, L12_113 in L8_109(L9_110) do
    if L11_112 == A1_102 then
      L7_108 = L12_113
      break
    end
  end
  if A1_102 ~= L8_109 then
    if A2_103 ~= L8_109 then
      if A2_103 ~= L8_109 then
        if A2_103 ~= L8_109 then
          if A2_103 ~= L8_109 then
            if A2_103 ~= L8_109 then
              if A2_103 ~= L8_109 then
                return L8_109
              end
            end
          end
        end
      end
    end
  end
  if A2_103 == L8_109 then
    if L8_109 ~= nil then
    elseif L9_110 == 0 then
      return L9_110
    end
  elseif A2_103 == L8_109 then
    if L8_109 ~= nil then
    elseif L9_110 == 0 then
      return L9_110
    end
  elseif A2_103 == L8_109 then
    if L8_109 ~= nil then
    elseif L9_110 == 0 then
      return L9_110
    end
  elseif A2_103 == L8_109 then
    if L8_109 ~= nil then
    elseif L9_110 == 0 then
      return L9_110
    end
  elseif A2_103 == L8_109 then
    if L8_109 ~= nil then
    elseif L9_110 == 0 then
      return L9_110
    end
  end
  if A2_103 == L8_109 then
    if A3_104 ~= L8_109 then
      if A3_104 ~= L8_109 then
        if A3_104 ~= L8_109 then
          if A3_104 ~= L8_109 then
            return L8_109
          end
        end
      end
    end
    A2_103 = A3_104
  end
  for L12_113, L13_114 in L9_110(L10_111) do
    if L12_113 == A2_103 then
      break
    end
  end
  if A4_105 == L10_111 then
    return L10_111
  end
  L12_113 = attributes
  L12_113 = L12_113.name
  L13_114 = A4_105
  L14_115 = attributes
  L14_115 = L14_115.profileId
  if L9_110 == L10_111 then
    return L10_111
  end
  if A5_106 == L10_111 then
    return L10_111
  end
  L12_113 = "."
  L13_114 = _UPVALUE1_
  L13_114 = L13_114.vlanId
  L10_111[L11_112] = A0_101
  L12_113 = "."
  L13_114 = _UPVALUE1_
  L13_114 = L13_114.name
  L12_113 = BDG_NAME
  L13_114 = A0_101
  L12_113 = L12_113 .. L13_114
  L10_111[L11_112] = L12_113
  if A0_101 == "1" then
  else
    L12_113 = "LAN"
    L13_114 = A0_101
  end
  L12_113 = "LogicalIfName = '"
  L13_114 = L11_112
  L14_115 = "' AND AddressFamily = '2'"
  L12_113 = L12_113 .. L13_114 .. L14_115
  L13_114 = db
  L13_114 = L13_114.getAttributeWhere
  L14_115 = "ifStatic"
  L15_116 = L12_113
  L13_114 = L13_114(L14_115, L15_116, "StaticIp")
  L14_115 = captiveportalTable
  L15_116 = "."
  L14_115 = L14_115 .. L15_116 .. _UPVALUE1_.captivePortalType
  L10_111[L14_115] = L7_108
  L14_115 = captiveportalTable
  L15_116 = "."
  L14_115 = L14_115 .. L15_116 .. _UPVALUE1_.authenticationType
  L10_111[L14_115] = L8_109
  L14_115 = captiveportalTable
  L15_116 = "."
  L14_115 = L14_115 .. L15_116 .. _UPVALUE1_.loginProfile
  L10_111[L14_115] = L9_110
  L14_115 = captiveportalTable
  L15_116 = "."
  L14_115 = L14_115 .. L15_116 .. _UPVALUE1_.redirectType
  L10_111[L14_115] = A5_106
  L14_115 = captiveportalTable
  L15_116 = "."
  L14_115 = L14_115 .. L15_116 .. _UPVALUE1_.ipaddress
  L10_111[L14_115] = L13_114
  L14_115 = db
  L14_115 = L14_115.insert
  L15_116 = captiveportalTable
  L14_115 = L14_115(L15_116, L10_111)
  L15_116 = db
  L15_116 = L15_116.getAttribute
  L15_116 = L15_116(captiveportalTable, _UPVALUE1_.vlanId, A0_101, ROWID)
  if L14_115 == NIL then
    return _UPVALUE2_.FAILURE, L15_116
  end
  return _UPVALUE2_.SUCCESS, L15_116
end
function captivePortalDelete(A0_117)
  if checkCookieExists(A0_117, captiveportalTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIES
  end
  if db.deleteRow(captiveportalTable, ROWID, A0_117) == NIL then
    return _UPVALUE0_.FAILURE, A0_117
  end
  if db.getTable(captiveportalTable) then
  else
  end
  if 0 == 0 then
    captivePortalDisable()
  end
  return _UPVALUE0_.SUCCESS, A0_117
end
function captivePortalDeleteAll()
  if db.deleteAllRows(captiveportalTable) == NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  if db.getTable(captiveportalTable) then
  else
  end
  if 0 == 0 then
    captivePortalDisable()
  end
  return _UPVALUE0_.SUCCESS, cookie
end
function captiveType(A0_118)
  local L1_119, L2_120
  L1_119 = NIL
  if A0_118 == L1_119 then
    L1_119 = _UPVALUE0_
    L1_119 = L1_119.FAILURE
    return L1_119
  end
  L1_119 = db
  L1_119 = L1_119.getAttribute
  L2_120 = captiveportalTable
  L1_119 = L1_119(L2_120, _UPVALUE1_.vlanId, A0_118, ROWID)
  L2_120 = db
  L2_120 = L2_120.getAttribute
  L2_120 = L2_120(captiveportalTable, _UPVALUE1_.vlanId, A0_118, _UPVALUE1_.redirectType)
  if L1_119 == NIL or tonumber(L2_120) == 3 then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_119
end
function captivePortalEnable()
  if db.setAttribute(captiveTable, ROWID, "1", _UPVALUE0_.enable, ENABLE) == NIL then
    return _UPVALUE1_.FAILURE, cookie
  end
  return _UPVALUE1_.SUCCESS, cookie
end
function captivePortalBillingEnable(A0_121)
  local L1_122, L2_123, L3_124, L4_125
  L1_122 = NIL
  if A0_121 == L1_122 then
    L1_122 = _UPVALUE0_
    L1_122 = L1_122.BAD_PARAMETER
    return L1_122
  end
  L1_122, L2_123, L3_124 = nil, nil, nil
  L4_125 = attributes
  L4_125 = L4_125.name
  L4_125 = L4_125 .. " = '" .. A0_121 .. "'"
  L2_123 = db.getAttributeWhere(loginProfileTable, L4_125, attributes.paymentGwServer)
  if L2_123 == NIL then
    return _UPVALUE0_.FAILURE
  end
  L3_124 = db.getAttribute(_UPVALUE1_, ROWID, L2_123, attributes.paymentGateway)
  if L3_124 == NIL then
    return _UPVALUE0_.FAILURE
  end
  if L3_124 == _UPVALUE2_ then
    L1_122 = db.setAttribute(_UPVALUE3_, ROWID, "1", _UPVALUE4_.PaypalTest, ENABLE)
  elseif L3_124 == _UPVALUE5_ then
    L1_122 = db.setAttribute(_UPVALUE3_, ROWID, "1", _UPVALUE4_.Paypal, ENABLE)
  else
    return _UPVALUE0_.FAILURE
  end
  if (L3_124 == _UPVALUE5_ or L3_124 == _UPVALUE2_) and L1_122 == NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, cookie
end
function captivePortalDisable()
  local L0_126, L1_127, L2_128, L3_129
  L3_129 = "SELECT *, _ROWID_ AS _ROWID_ FROM "
  L3_129 = L3_129 .. _UPVALUE0_ .. " WHERE " .. _UPVALUE1_.captivePortalType .. "!='" .. DISABLE .. "'"
  L2_128 = db.getTable(_UPVALUE0_, false, L3_129)
  if L2_128 == NIL then
    return _UPVALUE2_.FAILURE
  end
  L1_127 = #L2_128
  if tonumber(L1_127) == 0 or tonumber(L1_127) == 1 then
    L0_126 = db.setAttribute(captiveTable, ROWID, "1", _UPVALUE1_.enable, DISABLE)
    if L0_126 == NIL then
      return _UPVALUE2_.FAILURE, cookie
    end
  end
  return _UPVALUE2_.SUCCESS, cookie
end
function captivePortalBillingDisable(A0_130)
  local L1_131, L2_132, L3_133, L4_134, L5_135, L6_136, L7_137, L8_138, L9_139
  L7_137 = 0
  L8_138 = 0
  L9_139 = "SELECT *, _ROWID_ AS _ROWID_ FROM "
  L9_139 = L9_139 .. _UPVALUE0_ .. " WHERE " .. _UPVALUE1_.captivePortalType .. "= '4'"
  L5_135 = db.getTable(_UPVALUE0_, false, L9_139)
  if L5_135 == NIL then
    return _UPVALUE2_.FAILURE
  end
  L2_132 = #L5_135
  if tonumber(L2_132) == 0 then
    L1_131 = db.setAttribute(_UPVALUE3_, ROWID, "1", _UPVALUE1_.PaypalTest, DISABLE)
    if L1_131 == NIL then
      return _UPVALUE2_.FAILURE, cookie
    end
    L1_131 = db.setAttribute(_UPVALUE3_, ROWID, "1", _UPVALUE1_.Paypal, DISABLE)
    if L1_131 == NIL then
      return _UPVALUE2_.FAILURE, cookie
    end
  else
    for _FORV_13_, _FORV_14_ in pairs(L5_135) do
      L9_139 = _UPVALUE1_.vlanId .. "='" .. _FORV_14_.vlanId .. "'"
      L6_136 = db.getAttributeWhere(captiveportalTable, L9_139, _UPVALUE1_.loginProfile)
      if L6_136 == NIL then
        return _UPVALUE2_.FAILURE
      end
      L9_139 = attributes.profileId .. " = '" .. L6_136 .. "'"
      L3_133 = db.getAttributeWhere(loginProfileTable, L9_139, attributes.paymentGwServer)
      if L3_133 == NIL then
        return _UPVALUE2_.FAILURE
      end
      L4_134 = db.getAttribute(_UPVALUE4_, ROWID, L3_133, attributes.paymentGateway)
      if L4_134 == NIL then
        return _UPVALUE2_.FAILURE
      end
      if L4_134 == _UPVALUE5_ then
        L8_138 = 1
      elseif L4_134 == _UPVALUE6_ then
        L7_137 = 1
      end
    end
    if L8_138 == 0 then
      L1_131 = db.setAttribute(_UPVALUE3_, ROWID, "1", _UPVALUE1_.PaypalTest, DISABLE)
    elseif L7_137 == 0 then
      L1_131 = db.setAttribute(_UPVALUE3_, ROWID, "1", _UPVALUE1_.Paypal, DISABLE)
    end
    if (L8_138 == 0 or L7_137 == 0) and L1_131 == NIL then
      return _UPVALUE2_.FAILURE, cookie
    end
  end
  return _UPVALUE2_.SUCCESS, cookie
end
function authenticationTypeGetCurrent(A0_140)
  local L1_141, L2_142
  L1_141 = db
  L1_141 = L1_141.getAttribute
  L2_142 = captiveportalTable
  L1_141 = L1_141(L2_142, _UPVALUE0_.vlanId, A0_140, _UPVALUE0_.authenticationType)
  L2_142 = nil
  for _FORV_6_, _FORV_7_ in pairs(serverValue) do
    if _FORV_7_ == L1_141 then
      L2_142 = _FORV_6_
      break
    end
  end
  if L2_142 == authServer.radiusType.pap or L2_142 == authServer.radiusType.chap or L2_142 == authServer.radiusType.mschap or L2_142 == authServer.radiusType.mschapv1 then
    L2_142 = authServer.radius
  end
  if L2_142 == NIL then
    L2_142 = "none"
  end
  return _UPVALUE1_.SUCCESS, cookie, L2_142
end
