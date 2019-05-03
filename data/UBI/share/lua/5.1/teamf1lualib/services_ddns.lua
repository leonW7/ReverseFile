local L0_0
L0_0 = module
L0_0("com.teamf1.core.services.ddns", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/ddns_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
ENABLE = "1"
DISABLE = "0"
SERVICE_NONE = "0"
SERVICE_DDNS = "1"
SERVICE_DLINKDNS = "3"
SERVICE_ORAY = "4"
OPTION2 = "2"
OPTION1 = "1"
WAN3 = "3"
SERVICE_DISABLE = "1"
SERVICE_DYNDNS = "2"
SERVICE_DLINKDDNS = "3"
SERVICE_FREEDNS = "4"
SERVICE_ZONEEDIT = "5"
SERVICE_NOIP = "6"
SERVICE_3322ORG = "7"
SERVICE_EASYDNS = "8"
SERVICE_TZOCOM = "9"
SERVICE_DYNSIP = "10"
SERVICE_CUSTOM = "11"
SERVICE_ORAY = "12"
SERVICE_DYNAMICUPDATE = "13"
serviceTbl = {
  "0",
  "1",
  "3",
  "6",
  "7",
  "8",
  "9",
  "10",
  "2",
  "11",
  "12",
  "4",
  "5"
}
KEY_FILE = "nsupdate.key."
KEY_LOC = "/flash/tmp/ddns/key/"
ddnsTable = "ddns"
ddnsStatusTable = "ddnsStatus"
attribute = {}
attribute.key = "_ROWID_"
attribute.keyvalue = "1"
attribute.wanPort = "interfaceName"
attribute.service = "ddnsService"
attribute.ddnsServer = "server"
attribute.userName = "username"
attribute.password = "password"
attribute.domainName = "hostname"
attribute.zoneName = "zonename"
attribute.userType = "orayType"
attribute.server = "orayDomain"
attribute.ddnsType = "ddnsType"
attribute.wildCards = "wildflag"
attribute.exIpCheck = "ipcheck"
attribute.periodicUpdate = "timePeriod"
attribute.ddnsUrl = "ddnsUrl"
attribute.ddnsOptUrl = "ddnsOptUrl"
attribute.ddnsKey = "key"
attribute.status = "Status"
function wanPortGet()
  local L0_1, L1_2
  L0_1 = db
  L0_1 = L0_1.getNextRowId
  L1_2 = "0"
  L0_1 = L0_1(L1_2, ddnsTable)
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(ddnsTable, attribute.key, L0_1, attribute.wanPort)
  if L1_2 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L1_2
end
function wanPortGetNext(A0_3)
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
  L1_4 = L1_4.getNextRowId
  L2_5 = A0_3
  L1_4 = L1_4(L2_5, ddnsTable)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if L1_4 == L2_5 then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.TABLE_IS_FULL
    return L2_5
  end
  L2_5 = db
  L2_5 = L2_5.getAttribute
  L2_5 = L2_5(ddnsTable, attribute.key, L1_4, attribute.wanPort)
  if L2_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L2_5
end
function wanPortSet(A0_6, A1_7)
  local L3_8
  L3_8 = _UPVALUE0_
  L3_8 = L3_8.NOT_SUPPORTED
  return L3_8, A0_6
end
function wanPortDelete(A0_9, A1_10)
  local L3_11
  L3_11 = _UPVALUE0_
  L3_11 = L3_11.NOT_SUPPORTED
  return L3_11, A0_9
end
function serviceGet()
  local L0_12, L1_13
  L0_12 = db
  L0_12 = L0_12.getNextRowId
  L1_13 = "0"
  L0_12 = L0_12(L1_13, ddnsTable)
  L1_13 = db
  L1_13 = L1_13.getAttribute
  L1_13 = L1_13(ddnsTable, attribute.key, L0_12, attribute.service)
  if L1_13 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L1_13
end
function serviceGetNext(A0_14)
  local L1_15, L2_16
  L1_15 = _UPVALUE0_
  L1_15 = L1_15.NIL
  if A0_14 ~= L1_15 then
    L1_15 = tonumber
    L2_16 = A0_14
    L1_15 = L1_15(L2_16)
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.NIL
  elseif L1_15 == L2_16 then
    L1_15 = _UPVALUE0_
    L1_15 = L1_15.INVALID_ARGUMENT
    return L1_15
  end
  L1_15 = db
  L1_15 = L1_15.getNextRowId
  L2_16 = A0_14
  L1_15 = L1_15(L2_16, ddnsTable)
  L2_16 = _UPVALUE0_
  L2_16 = L2_16.NIL
  if L1_15 == L2_16 then
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.TABLE_IS_FULL
    return L2_16
  end
  L2_16 = db
  L2_16 = L2_16.getAttribute
  L2_16 = L2_16(ddnsTable, attribute.key, L1_15, attribute.service)
  if L2_16 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_15
  end
  return _UPVALUE0_.SUCCESS, L1_15, L2_16
end
function serviceSet(A0_17, A1_18)
  if A0_17 == _UPVALUE0_.NIL or tonumber(A0_17) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(ddnsTable, attribute.key, A0_17) == false then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_18 == _UPVALUE0_.NIL then
    return _UPVALUE1_.SERVICE_INVALID
  end
  if A1_18 ~= SERVICE_DDNS and A1_18 ~= SERVICE_ORAY and A1_18 ~= SERVICE_DLINKDNS and A1_18 ~= SERVICE_NONE then
    return _UPVALUE1_.SERVICE_INVALID
  end
  if db.setAttribute(ddnsTable, attribute.key, A0_17, attribute.service, A1_18) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_17
  end
  return _UPVALUE0_.SUCCESS, A0_17
end
function serverGet()
  local L0_19, L1_20
  L0_19 = db
  L0_19 = L0_19.getNextRowId
  L1_20 = "0"
  L0_19 = L0_19(L1_20, ddnsStatusTable)
  L1_20 = db
  L1_20 = L1_20.getAttribute
  L1_20 = L1_20(ddnsStatusTable, attribute.key, L0_19, attribute.server)
  if L1_20 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L1_20
end
function serverGetNext(A0_21)
  local L1_22, L2_23, L3_24
  L2_23 = _UPVALUE0_
  L2_23 = L2_23.NIL
  if A0_21 ~= L2_23 then
    L2_23 = tonumber
    L3_24 = A0_21
    L2_23 = L2_23(L3_24)
    L3_24 = _UPVALUE0_
    L3_24 = L3_24.NIL
  elseif L2_23 == L3_24 then
    L2_23 = _UPVALUE0_
    L2_23 = L2_23.INVALID_ARGUMENT
    return L2_23
  end
  L2_23 = db
  L2_23 = L2_23.getNextRowId
  L3_24 = A0_21
  L2_23 = L2_23(L3_24, ddnsTable)
  L3_24 = _UPVALUE0_
  L3_24 = L3_24.NIL
  if L2_23 == L3_24 then
    L3_24 = _UPVALUE0_
    L3_24 = L3_24.TABLE_IS_FULL
    return L3_24
  end
  L3_24 = db
  L3_24 = L3_24.getAttribute
  L3_24 = L3_24(ddnsStatusTable, attribute.key, L2_23, attribute.server)
  if L3_24 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L2_23
  end
  return _UPVALUE0_.SUCCESS, L2_23, L3_24
end
function serverSet(A0_25, A1_26)
  if A0_25 == _UPVALUE0_.NIL or tonumber(A0_25) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(ddnsTable, attribute.key, A0_25) == false then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_26 == _UPVALUE0_.NIL then
    return _UPVALUE1_.SERVER_INVALID
  end
  valid = _UPVALUE2_.ipAddressCheck("2", A1_26)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE1_.SERVER_INVALID
  end
  if db.setAttribute(ddnsTable, attribute.key, A0_25, attribute.server, A1_26) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_25
  end
  return _UPVALUE0_.SUCCESS, A0_25
end
function userNameGet()
  local L0_27, L1_28
  L0_27 = db
  L0_27 = L0_27.getNextRowId
  L1_28 = "0"
  L0_27 = L0_27(L1_28, ddnsTable)
  L1_28 = db
  L1_28 = L1_28.getAttribute
  L1_28 = L1_28(ddnsTable, attribute.key, L0_27, attribute.userName)
  if L1_28 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L1_28
end
function userNameGetNext(A0_29)
  local L1_30, L2_31
  L1_30 = _UPVALUE0_
  L1_30 = L1_30.NIL
  if A0_29 ~= L1_30 then
    L1_30 = tonumber
    L2_31 = A0_29
    L1_30 = L1_30(L2_31)
    L2_31 = _UPVALUE0_
    L2_31 = L2_31.NIL
  elseif L1_30 == L2_31 then
    L1_30 = _UPVALUE0_
    L1_30 = L1_30.INVALID_ARGUMENT
    return L1_30
  end
  L1_30 = db
  L1_30 = L1_30.getNextRowId
  L2_31 = A0_29
  L1_30 = L1_30(L2_31, ddnsTable)
  L2_31 = _UPVALUE0_
  L2_31 = L2_31.NIL
  if L1_30 == L2_31 then
    L2_31 = _UPVALUE0_
    L2_31 = L2_31.TABLE_IS_FULL
    return L2_31
  end
  L2_31 = db
  L2_31 = L2_31.getAttribute
  L2_31 = L2_31(ddnsTable, attribute.key, L1_30, attribute.userName)
  if L2_31 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_30
  end
  return _UPVALUE0_.SUCCESS, L1_30, L2_31
end
function userNameSet(A0_32, A1_33)
  local L2_34
  if A0_32 == _UPVALUE0_.NIL or tonumber(A0_32) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(ddnsTable, attribute.key, A0_32) == false then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_33 == _UPVALUE0_.NIL then
    return _UPVALUE1_.USERNAME_INVALID
  end
  if db.setAttribute(ddnsTable, attribute.key, A0_32, attribute.userName, A1_33) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_32
  end
  return _UPVALUE0_.SUCCESS, A0_32
end
function passwordGet()
  local L0_35, L1_36
  L0_35 = db
  L0_35 = L0_35.getNextRowId
  L1_36 = "0"
  L0_35 = L0_35(L1_36, ddnsTable)
  L1_36 = db
  L1_36 = L1_36.getAttribute
  L1_36 = L1_36(ddnsTable, attribute.key, L0_35, attribute.password)
  if L1_36 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L1_36
end
function passwordGetNext(A0_37)
  local L1_38, L2_39, L3_40
  L2_39 = _UPVALUE0_
  L2_39 = L2_39.NIL
  if A0_37 ~= L2_39 then
    L2_39 = tonumber
    L3_40 = A0_37
    L2_39 = L2_39(L3_40)
    L3_40 = _UPVALUE0_
    L3_40 = L3_40.NIL
  elseif L2_39 == L3_40 then
    L2_39 = _UPVALUE0_
    L2_39 = L2_39.INVALID_ARGUMENT
    return L2_39
  end
  L2_39 = db
  L2_39 = L2_39.existsRow
  L3_40 = ddnsTable
  L2_39 = L2_39(L3_40, attribute.key, A0_37)
  if L2_39 == false then
    L2_39 = _UPVALUE0_
    L2_39 = L2_39.INVALID_ARGUMENT
    return L2_39
  end
  L2_39 = db
  L2_39 = L2_39.getNextRowId
  L3_40 = A0_37
  L2_39 = L2_39(L3_40, ddnsTable)
  L3_40 = _UPVALUE0_
  L3_40 = L3_40.NIL
  if L2_39 == L3_40 then
    L3_40 = _UPVALUE0_
    L3_40 = L3_40.TABLE_IS_FULL
    return L3_40
  end
  L3_40 = db
  L3_40 = L3_40.getAttribute
  L3_40 = L3_40(ddnsTable, attribute.key, L2_39, attribute.password)
  if L3_40 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L2_39
  end
  return _UPVALUE0_.SUCCESS, L2_39, L3_40
end
function passwordSet(A0_41, A1_42)
  local L2_43
  if A0_41 == _UPVALUE0_.NIL or tonumber(A0_41) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(ddnsTable, attribute.key, A0_41) == false then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_42 == _UPVALUE0_.NIL then
    return _UPVALUE1_.PASSWORD_INVALID
  end
  if db.setAttribute(ddnsTable, attribute.key, A0_41, attribute.password, A1_42) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_41
  end
  return _UPVALUE0_.SUCCESS, A0_41
end
function userTypeGet()
  local L0_44, L1_45
  L0_44 = db
  L0_44 = L0_44.getNextRowId
  L1_45 = "0"
  L0_44 = L0_44(L1_45, ddnsStatusTable)
  L1_45 = db
  L1_45 = L1_45.getAttribute
  L1_45 = L1_45(ddnsStatusTable, attribute.key, L0_44, attribute.userType)
  if L1_45 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L1_45
end
function userTypeGetNext(A0_46)
  local L1_47, L2_48, L3_49
  L2_48 = _UPVALUE0_
  L2_48 = L2_48.NIL
  if A0_46 ~= L2_48 then
    L2_48 = tonumber
    L3_49 = A0_46
    L2_48 = L2_48(L3_49)
    L3_49 = _UPVALUE0_
    L3_49 = L3_49.NIL
  elseif L2_48 == L3_49 then
    L2_48 = _UPVALUE0_
    L2_48 = L2_48.INVALID_ARGUMENT
    return L2_48
  end
  L2_48 = db
  L2_48 = L2_48.existsRow
  L3_49 = ddnsStatusTable
  L2_48 = L2_48(L3_49, attribute.key, A0_46)
  if L2_48 == false then
    L2_48 = _UPVALUE0_
    L2_48 = L2_48.INVALID_ARGUMENT
    return L2_48
  end
  L2_48 = db
  L2_48 = L2_48.getNextRowId
  L3_49 = A0_46
  L2_48 = L2_48(L3_49, ddnsStatusTable)
  L3_49 = _UPVALUE0_
  L3_49 = L3_49.NIL
  if L2_48 == L3_49 then
    L3_49 = _UPVALUE0_
    L3_49 = L3_49.TABLE_IS_FULL
    return L3_49
  end
  L3_49 = db
  L3_49 = L3_49.getAttribute
  L3_49 = L3_49(ddnsStatusTable, attribute.key, L2_48, attribute.userType)
  if L3_49 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L2_48
  end
  return _UPVALUE0_.SUCCESS, L2_48, L3_49
end
function userTypeSet(A0_50, A1_51)
  local L3_52
  L3_52 = _UPVALUE0_
  L3_52 = L3_52.NOT_SUPPORTED
  return L3_52, A0_50
end
function domainNameGet()
  local L0_53, L1_54
  L0_53 = db
  L0_53 = L0_53.getNextRowId
  L1_54 = "0"
  L0_53 = L0_53(L1_54, ddnsTable)
  L1_54 = db
  L1_54 = L1_54.getAttribute
  L1_54 = L1_54(ddnsTable, attribute.key, L0_53, attribute.domainName)
  if L1_54 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L1_54
end
function domainNameGetNext(A0_55)
  local L1_56, L2_57, L3_58
  L2_57 = _UPVALUE0_
  L2_57 = L2_57.NIL
  if A0_55 ~= L2_57 then
    L2_57 = tonumber
    L3_58 = A0_55
    L2_57 = L2_57(L3_58)
    L3_58 = _UPVALUE0_
    L3_58 = L3_58.NIL
  elseif L2_57 == L3_58 then
    L2_57 = _UPVALUE0_
    L2_57 = L2_57.INVALID_ARGUMENT
    return L2_57
  end
  L2_57 = db
  L2_57 = L2_57.getNextRowId
  L3_58 = A0_55
  L2_57 = L2_57(L3_58, ddnsTable)
  L3_58 = _UPVALUE0_
  L3_58 = L3_58.NIL
  if L2_57 == L3_58 then
    L3_58 = _UPVALUE0_
    L3_58 = L3_58.TABLE_IS_FULL
    return L3_58
  end
  L3_58 = db
  L3_58 = L3_58.getAttribute
  L3_58 = L3_58(ddnsStatusTable, attribute.key, L2_57, attribute.domainName)
  if L3_58 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L2_57
  end
  return _UPVALUE0_.SUCCESS, L2_57, L3_58
end
function domainNameSet(A0_59, A1_60)
  if A0_59 == _UPVALUE0_.NIL or tonumber(A0_59) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(ddnsTable, attribute.key, A0_59) == false then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_60 == _UPVALUE0_.NIL then
    return _UPVALUE1_.DOMAIN_NAME_INVALID
  end
  if db.setAttribute(ddnsTable, attribute.key, A0_59, attribute.domainName, A1_60) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_59
  end
  return _UPVALUE0_.SUCCESS, A0_59
end
function statusGet()
  local L0_61, L1_62
  L0_61 = db
  L0_61 = L0_61.getNextRowId
  L1_62 = "0"
  L0_61 = L0_61(L1_62, ddnsStatusTable)
  L1_62 = db
  L1_62 = L1_62.getAttribute
  L1_62 = L1_62(ddnsStatusTable, attribute.key, L0_61, attribute.status)
  if L1_62 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L1_62
end
function statusGetNext(A0_63)
  local L1_64, L2_65, L3_66
  L2_65 = _UPVALUE0_
  L2_65 = L2_65.NIL
  if A0_63 ~= L2_65 then
    L2_65 = tonumber
    L3_66 = A0_63
    L2_65 = L2_65(L3_66)
    L3_66 = _UPVALUE0_
    L3_66 = L3_66.NIL
  elseif L2_65 == L3_66 then
    L2_65 = _UPVALUE0_
    L2_65 = L2_65.INVALID_ARGUMENT
    return L2_65
  end
  L2_65 = db
  L2_65 = L2_65.getNextRowId
  L3_66 = A0_63
  L2_65 = L2_65(L3_66, ddnsStatusTable)
  L3_66 = _UPVALUE0_
  L3_66 = L3_66.NIL
  if L2_65 == L3_66 then
    L3_66 = _UPVALUE0_
    L3_66 = L3_66.TABLE_IS_FULL
    return L3_66
  end
  L3_66 = db
  L3_66 = L3_66.getAttribute
  L3_66 = L3_66(ddnsStatusTable, attribute.key, L2_65, attribute.status)
  if L3_66 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L2_65
  end
  return _UPVALUE0_.SUCCESS, L2_65, L3_66
end
function statusSet(A0_67, A1_68)
  local L3_69
  L3_69 = _UPVALUE0_
  L3_69 = L3_69.NOT_SUPPORTED
  return L3_69, A0_67
end
function iswildCardsEnabled()
  local L0_70, L1_71
  L0_70 = db
  L0_70 = L0_70.getNextRowId
  L1_71 = "0"
  L0_70 = L0_70(L1_71, ddnsTable)
  L1_71 = db
  L1_71 = L1_71.getAttribute
  L1_71 = L1_71(ddnsTable, attribute.key, L0_70, attribute.wildCards)
  if L1_71 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L1_71
end
function iswildCardsEnabledNext(A0_72)
  local L1_73, L2_74, L3_75
  L2_74 = _UPVALUE0_
  L2_74 = L2_74.NIL
  if A0_72 ~= L2_74 then
    L2_74 = tonumber
    L3_75 = A0_72
    L2_74 = L2_74(L3_75)
    L3_75 = _UPVALUE0_
    L3_75 = L3_75.NIL
  elseif L2_74 == L3_75 then
    L2_74 = _UPVALUE0_
    L2_74 = L2_74.INVALID_ARGUMENT
    return L2_74
  end
  L2_74 = db
  L2_74 = L2_74.getNextRowId
  L3_75 = A0_72
  L2_74 = L2_74(L3_75, ddnsTable)
  L3_75 = _UPVALUE0_
  L3_75 = L3_75.NIL
  if L2_74 == L3_75 then
    L3_75 = _UPVALUE0_
    L3_75 = L3_75.TABLE_IS_FULL
    return L3_75
  end
  L3_75 = db
  L3_75 = L3_75.getAttribute
  L3_75 = L3_75(ddnsTable, attribute.key, L2_74, attribute.wildCards)
  if L3_75 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L2_74
  end
  return _UPVALUE0_.SUCCESS, L2_74, L3_75
end
function wildCardsEnable(A0_76)
  local L1_77
  if A0_76 == _UPVALUE0_.NIL or tonumber(A0_76) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(ddnsTable, attribute.key, A0_76) == false then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(ddnsTable, attribute.key, A0_76, attribute.wildCards, ENABLE) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_76
  end
  return _UPVALUE0_.SUCCESS, A0_76
end
function wildCardsDisable(A0_78)
  if A0_78 == _UPVALUE0_.NIL or tonumber(A0_78) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(ddnsTable, attribute.key, A0_78) == false then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(ddnsTable, attribute.key, A0_78, attribute.wildCards, DISABLE) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_78
  end
  return _UPVALUE0_.SUCCESS, A0_78
end
function isperiodicUpdateEnabled()
  local L0_79, L1_80
  L0_79 = db
  L0_79 = L0_79.getNextRowId
  L1_80 = "0"
  L0_79 = L0_79(L1_80, ddnsTable)
  L1_80 = db
  L1_80 = L1_80.getAttribute
  L1_80 = L1_80(ddnsTable, attribute.key, L0_79, attribute.periodicUpdate)
  if L1_80 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L1_80
end
function isperiodicUpdateEnabledNext(A0_81)
  local L1_82, L2_83, L3_84
  L2_83 = _UPVALUE0_
  L2_83 = L2_83.NIL
  if A0_81 ~= L2_83 then
    L2_83 = tonumber
    L3_84 = A0_81
    L2_83 = L2_83(L3_84)
    L3_84 = _UPVALUE0_
    L3_84 = L3_84.NIL
  elseif L2_83 == L3_84 then
    L2_83 = _UPVALUE0_
    L2_83 = L2_83.INVALID_ARGUMENT
    return L2_83
  end
  L2_83 = db
  L2_83 = L2_83.getNextRowId
  L3_84 = A0_81
  L2_83 = L2_83(L3_84, ddnsTable)
  L3_84 = _UPVALUE0_
  L3_84 = L3_84.NIL
  if L2_83 == L3_84 then
    L3_84 = _UPVALUE0_
    L3_84 = L3_84.TABLE_IS_FULL
    return L3_84
  end
  L3_84 = db
  L3_84 = L3_84.getAttribute
  L3_84 = L3_84(ddnsTable, attribute.key, L2_83, attribute.periodicUpdate)
  if L3_84 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L2_83
  end
  return _UPVALUE0_.SUCCESS, L2_83, L3_84
end
function periodicUpdateEnable(A0_85)
  if A0_85 == _UPVALUE0_.NIL or tonumber(A0_85) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(ddnsTable, attribute.key, A0_85) == false then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(ddnsTable, attribute.key, A0_85, attribute.periodicUpdate, ENABLE) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_85
  end
  return _UPVALUE0_.SUCCESS, A0_85
end
function periodicUpdateDisable(A0_86)
  if A0_86 == _UPVALUE0_.NIL or tonumber(A0_86) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(ddnsTable, attribute.key, A0_86) == false then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(ddnsTable, attribute.key, A0_86, attribute.periodicUpdate, DISABLE) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_86
  end
  return _UPVALUE0_.SUCCESS, A0_86
end
function ddnsConfigGet()
  local L0_87, L1_88, L2_89, L3_90, L4_91, L5_92, L6_93, L7_94, L8_95, L9_96
  L0_87 = {}
  L1_88 = {}
  L2_89 = db
  L2_89 = L2_89.getNextRowId
  L3_90 = "0"
  L4_91 = ddnsTable
  L2_89 = L2_89(L3_90, L4_91)
  L3_90 = db
  L3_90 = L3_90.getRow
  L4_91 = ddnsTable
  L5_92 = attribute
  L5_92 = L5_92.key
  L6_93 = L2_89
  L3_90 = L3_90(L4_91, L5_92, L6_93)
  L0_87 = L3_90
  L3_90 = _UPVALUE0_
  L3_90 = L3_90.NIL
  if L0_87 == L3_90 then
    L3_90 = _UPVALUE0_
    L3_90 = L3_90.FAILURE
    return L3_90
  end
  L3_90, L4_91, L5_92, L6_93, L7_94, L8_95, L9_96 = nil, nil, nil, nil, nil, nil, nil
  L3_90 = L0_87[ddnsTable .. "." .. attribute.wanPort]
  L4_91 = L0_87[ddnsTable .. "." .. attribute.service]
  L7_94 = L0_87[ddnsTable .. "." .. attribute.domainName]
  L5_92 = L0_87[ddnsTable .. "." .. attribute.userName]
  L6_93 = L0_87[ddnsTable .. "." .. attribute.password]
  L8_95 = L0_87[ddnsTable .. "." .. attribute.wildCards]
  L9_96 = L0_87[ddnsTable .. "." .. attribute.periodicUpdate]
  if L3_90 == _UPVALUE0_.NIL or L4_91 == _UPVALUE0_.NIL or L5_92 == _UPVALUE0_.NIL or L6_93 == _UPVALUE0_.NIL or L7_94 == _UPVALUE0_.NIL or L8_95 == _UPVALUE0_.NIL or L9_96 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L3_90, L4_91, L5_92, L6_93, L7_94, L8_95, L9_96
end
function ddnsConfigGetNext(A0_97)
  local L1_98, L2_99, L3_100, L4_101, L5_102, L6_103, L7_104, L8_105, L9_106, L10_107, L11_108, L12_109
  L1_98 = _UPVALUE0_
  L1_98 = L1_98.NIL
  if A0_97 ~= L1_98 then
    L1_98 = tonumber
    L2_99 = A0_97
    L1_98 = L1_98(L2_99)
    L2_99 = _UPVALUE0_
    L2_99 = L2_99.NIL
  elseif L1_98 == L2_99 then
    L1_98 = _UPVALUE0_
    L1_98 = L1_98.INVALID_ARGUMENT
    return L1_98
  end
  L1_98 = db
  L1_98 = L1_98.existsRow
  L2_99 = ddnsTable
  L3_100 = attribute
  L3_100 = L3_100.key
  L4_101 = A0_97
  L1_98 = L1_98(L2_99, L3_100, L4_101)
  if L1_98 == false then
    L1_98 = _UPVALUE0_
    L1_98 = L1_98.INVALID_ARGUMENT
    return L1_98
  end
  L1_98 = db
  L1_98 = L1_98.existsRow
  L2_99 = ddnsStatusTable
  L3_100 = attribute
  L3_100 = L3_100.key
  L4_101 = A0_97
  L1_98 = L1_98(L2_99, L3_100, L4_101)
  if L1_98 == false then
    L1_98 = _UPVALUE0_
    L1_98 = L1_98.INVALID_ARGUMENT
    return L1_98
  end
  L1_98 = db
  L1_98 = L1_98.getNextRowId
  L2_99 = A0_97
  L3_100 = ddnsTable
  L1_98 = L1_98(L2_99, L3_100)
  L2_99 = _UPVALUE0_
  L2_99 = L2_99.NIL
  if L1_98 == L2_99 then
    L2_99 = _UPVALUE0_
    L2_99 = L2_99.TABLE_IS_FULL
    return L2_99
  end
  L2_99 = db
  L2_99 = L2_99.getRow
  L3_100 = ddnsTable
  L4_101 = attribute
  L4_101 = L4_101.key
  L5_102 = L1_98
  L2_99 = L2_99(L3_100, L4_101, L5_102)
  L3_100 = _UPVALUE0_
  L3_100 = L3_100.NIL
  if L2_99 == L3_100 then
    L3_100 = FAILURE
    return L3_100
  end
  L3_100, L4_101, L5_102, L6_103, L7_104, L8_105, L9_106, L10_107, L11_108, L12_109 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L3_100 = L2_99[ddnsTable .. "." .. attribute.wanPort]
  L4_101 = L2_99[ddnsTable .. "." .. attribute.service]
  L9_106 = L2_99[ddnsTable .. "." .. attribute.domainName]
  L6_103 = L2_99[ddnsTable .. "." .. attribute.userName]
  L7_104 = L2_99[ddnsTable .. "." .. attribute.password]
  L11_108 = L2_99[ddnsTable .. "." .. attribute.wildCards]
  L12_109 = L2_99[ddnsTable .. "." .. attribute.periodicUpdate]
  if L3_100 == _UPVALUE0_.NIL or L4_101 == _UPVALUE0_.NIL or L6_103 == _UPVALUE0_.NIL or L7_104 == _UPVALUE0_.NIL or L9_106 == _UPVALUE0_.NIL or L11_108 == _UPVALUE0_.NIL or L12_109 == _UPVALUE0_.NIL then
    return FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_98, L3_100, L4_101, L6_103, L7_104, L9_106, L11_108, L12_109
end
function ddnsConfigSet(A0_110, A1_111, A2_112, A3_113, A4_114, A5_115, A6_116, A7_117, A8_118, A9_119, A10_120, A11_121, A12_122, A13_123)
  local L14_124, L15_125, L16_126
  L15_125 = {}
  L16_126 = _UPVALUE0_
  L16_126 = L16_126.NIL
  if A0_110 ~= L16_126 then
    L16_126 = tonumber
    L16_126 = L16_126(A0_110)
  elseif L16_126 == _UPVALUE0_.NIL then
    L16_126 = _UPVALUE0_
    L16_126 = L16_126.INVALID_ARGUMENT
    return L16_126
  end
  L16_126 = _UPVALUE0_
  L16_126 = L16_126.NIL
  if A1_111 ~= L16_126 then
    L16_126 = SERVICE_DISABLE
    if A1_111 ~= L16_126 then
      L16_126 = SERVICE_DYNDNS
      if A1_111 ~= L16_126 then
        L16_126 = SERVICE_DLINKDNS
        if A1_111 ~= L16_126 then
          L16_126 = SERVICE_FREEDNS
          if A1_111 ~= L16_126 then
            L16_126 = SERVICE_ZONEEDIT
            if A1_111 ~= L16_126 then
              L16_126 = SERVICE_NOIP
              if A1_111 ~= L16_126 then
                L16_126 = SERVICE_3322ORG
                if A1_111 ~= L16_126 then
                  L16_126 = SERVICE_EASYDNS
                  if A1_111 ~= L16_126 then
                    L16_126 = SERVICE_TZOCOM
                    if A1_111 ~= L16_126 then
                      L16_126 = SERVICE_DYNSIP
                      if A1_111 ~= L16_126 then
                        L16_126 = SERVICE_CUSTOM
                        if A1_111 ~= L16_126 then
                          L16_126 = SERVICE_ORAY
                          if A1_111 ~= L16_126 then
                            L16_126 = SERVICE_DYNAMICUPDATE
                            if A1_111 ~= L16_126 then
                              L16_126 = _UPVALUE1_
                              L16_126 = L16_126.SERVICE_INVALID
                              return L16_126
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    L16_126 = ddnsTable
    L16_126 = L16_126 .. "." .. attribute.service
    L15_125[L16_126] = serviceTbl[tonumber(A1_111)]
  else
    L16_126 = _UPVALUE0_
    L16_126 = L16_126.INVALID_ARGUMENT
    return L16_126
  end
  L16_126 = _UPVALUE0_
  L16_126 = L16_126.NIL
  if A2_112 ~= L16_126 then
    L16_126 = ddnsTable
    L16_126 = L16_126 .. "." .. attribute.ddnsServer
    L15_125[L16_126] = A2_112
  else
    L16_126 = ddnsTable
    L16_126 = L16_126 .. "." .. attribute.ddnsServer
    L15_125[L16_126] = "NOSERVER"
  end
  L16_126 = _UPVALUE0_
  L16_126 = L16_126.NIL
  if A3_113 ~= L16_126 then
    L16_126 = ddnsTable
    L16_126 = L16_126 .. "." .. attribute.userName
    L15_125[L16_126] = A3_113
  else
    L16_126 = ddnsTable
    L16_126 = L16_126 .. "." .. attribute.userName
    L15_125[L16_126] = "NOUSER"
  end
  L16_126 = _UPVALUE0_
  L16_126 = L16_126.NIL
  if A4_114 ~= L16_126 then
    L16_126 = ddnsTable
    L16_126 = L16_126 .. "." .. attribute.password
    L15_125[L16_126] = A4_114
  else
    L16_126 = ddnsTable
    L16_126 = L16_126 .. "." .. attribute.password
    L15_125[L16_126] = "NOPASSWD"
  end
  L16_126 = _UPVALUE0_
  L16_126 = L16_126.NIL
  if A5_115 ~= L16_126 then
    L16_126 = ddnsTable
    L16_126 = L16_126 .. "." .. attribute.domainName
    L15_125[L16_126] = A5_115
  else
    L16_126 = ddnsTable
    L16_126 = L16_126 .. "." .. attribute.domainName
    L15_125[L16_126] = "NOHOST"
  end
  L16_126 = _UPVALUE0_
  L16_126 = L16_126.NIL
  if A6_116 ~= L16_126 then
    L16_126 = ddnsTable
    L16_126 = L16_126 .. "." .. attribute.zoneName
    L15_125[L16_126] = A6_116
  else
    L16_126 = ddnsTable
    L16_126 = L16_126 .. "." .. attribute.zoneName
    L15_125[L16_126] = "NOZONE"
  end
  L16_126 = _UPVALUE0_
  L16_126 = L16_126.NIL
  if A7_117 ~= L16_126 then
    L16_126 = ddnsTable
    L16_126 = L16_126 .. "." .. attribute.ddnsType
    L15_125[L16_126] = A7_117
  else
    L16_126 = ddnsTable
    L16_126 = L16_126 .. "." .. attribute.ddnsType
    L15_125[L16_126] = 0
  end
  L16_126 = _UPVALUE0_
  L16_126 = L16_126.NIL
  if A8_118 ~= L16_126 then
    L16_126 = _UPVALUE2_
    L16_126 = L16_126.isBoolean
    L16_126 = L16_126(A8_118)
    L14_124 = L16_126
    L16_126 = _UPVALUE0_
    L16_126 = L16_126.SUCCESS
    if L14_124 ~= L16_126 then
      L16_126 = _UPVALUE0_
      L16_126 = L16_126.INVALID_ARGUMENT
      return L16_126
    end
    L16_126 = ddnsTable
    L16_126 = L16_126 .. "." .. attribute.wildCards
    L15_125[L16_126] = A8_118
  else
    L16_126 = ddnsTable
    L16_126 = L16_126 .. "." .. attribute.wildCards
    L15_125[L16_126] = 0
  end
  L16_126 = _UPVALUE0_
  L16_126 = L16_126.NIL
  if A9_119 ~= L16_126 then
    L16_126 = _UPVALUE2_
    L16_126 = L16_126.isBoolean
    L16_126 = L16_126(A9_119)
    L14_124 = L16_126
    L16_126 = _UPVALUE0_
    L16_126 = L16_126.SUCCESS
    if L14_124 ~= L16_126 then
      L16_126 = _UPVALUE0_
      L16_126 = L16_126.INVALID_ARGUMENT
      return L16_126
    end
    L16_126 = ddnsTable
    L16_126 = L16_126 .. "." .. attribute.exIpCheck
    L15_125[L16_126] = A9_119
  else
    L16_126 = ddnsTable
    L16_126 = L16_126 .. "." .. attribute.exIpCheck
    L15_125[L16_126] = 1
  end
  L16_126 = _UPVALUE0_
  L16_126 = L16_126.NIL
  if A10_120 ~= L16_126 then
    L16_126 = ddnsTable
    L16_126 = L16_126 .. "." .. attribute.periodicUpdate
    L15_125[L16_126] = A10_120
  else
    L16_126 = ddnsTable
    L16_126 = L16_126 .. "." .. attribute.periodicUpdate
    L15_125[L16_126] = 0
  end
  L16_126 = _UPVALUE0_
  L16_126 = L16_126.NIL
  if A11_121 ~= L16_126 then
    L16_126 = ddnsTable
    L16_126 = L16_126 .. "." .. attribute.ddnsUrl
    L15_125[L16_126] = A11_121
  else
    L16_126 = ddnsTable
    L16_126 = L16_126 .. "." .. attribute.ddnsUrl
    L15_125[L16_126] = "NOURL"
  end
  L16_126 = _UPVALUE0_
  L16_126 = L16_126.NIL
  if A12_122 ~= L16_126 and A12_122 ~= "" then
    L16_126 = ddnsTable
    L16_126 = L16_126 .. "." .. attribute.ddnsOptUrl
    L15_125[L16_126] = A12_122
  else
    L16_126 = ddnsTable
    L16_126 = L16_126 .. "." .. attribute.ddnsOptUrl
    L15_125[L16_126] = "NOOPTURL"
  end
  L16_126 = db
  L16_126 = L16_126.getAttribute
  L16_126 = L16_126(ddnsTable, attribute.key, A0_110, attribute.wanPort)
  if A13_123 ~= _UPVALUE0_.NIL then
    os.execute("mkdir -p " .. KEY_LOC)
    os.execute("mv -f /tmp/" .. A13_123 .. " " .. KEY_LOC .. KEY_FILE .. L16_126)
    L15_125[ddnsTable .. "." .. attribute.ddnsKey] = 1
  else
    os.execute("rm -f " .. KEY_LOC .. KEY_FILE .. L16_126)
    L15_125[ddnsTable .. "." .. attribute.ddnsKey] = 0
  end
  if db.update(ddnsTable, L15_125, A0_110) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_110
  end
  return _UPVALUE0_.SUCCESS, A0_110
end
function ddnsConfigCreate(A0_127, A1_128, A2_129, A3_130, A4_131, A5_132, A6_133, A7_134, A8_135, A9_136)
  local L11_137
  L11_137 = _UPVALUE0_
  L11_137 = L11_137.NOT_SUPPORTED
  return L11_137, rowid
end
function ddnsConfigDelete(A0_138)
  local L2_139
  L2_139 = _UPVALUE0_
  L2_139 = L2_139.NOT_SUPPORTED
  return L2_139, A0_138
end
function ddnsOption2GetAll()
  local L0_140, L1_141
  L0_140 = {}
  L1_141 = {}
  L0_140 = db.getRow(ddnsTable, attribute.key, OPTION2)
  if L0_140 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L1_141 = db.getRow(ddnsStatusTable, attribute.key, OPTION2)
  if L1_141 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L0_140 = ddnsTblModify(L0_140)
  return _UPVALUE0_.SUCCESS, 1, L0_140, L1_141
end
function ddnsOption1GetAll()
  local L0_142, L1_143
  L0_142 = {}
  L1_143 = {}
  L0_142 = db.getRow(ddnsTable, attribute.key, OPTION1)
  if L0_142 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L1_143 = db.getRow(ddnsStatusTable, attribute.key, OPTION1)
  if L1_143 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L0_142 = ddnsTblModify(L0_142)
  return _UPVALUE0_.SUCCESS, 1, L0_142, L1_143
end
function ddnsWan3GetAll()
  local L0_144, L1_145
  L0_144 = {}
  L1_145 = {}
  L0_144 = db.getRow(ddnsTable, attribute.key, WAN3)
  if L0_144 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L1_145 = db.getRow(ddnsStatusTable, attribute.key, WAN3)
  if L1_145 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L0_144 = ddnsTblModify(L0_144)
  return _UPVALUE0_.SUCCESS, 1, L0_144, L1_145
end
function ddnsTblModify(A0_146)
  local L1_147
  L1_147 = _UPVALUE0_
  L1_147 = L1_147[tonumber(A0_146["ddns.ddnsService"])]
  L1_147 = L1_147 or "1"
  A0_146["ddns.ddnsService"] = L1_147
  L1_147 = A0_146["ddns.ddnsService"]
  if L1_147 == "1" then
    A0_146 = {}
    A0_146["ddns.interfaceName"], A0_146["ddns.ddnsService"] = A0_146["ddns.interfaceName"], "1"
    return A0_146
  end
  if L1_147 ~= "11" and L1_147 ~= "13" then
    A0_146["ddns.server"] = nil
  end
  if L1_147 ~= "13" then
    A0_146["ddns.zonename"] = nil
  end
  if L1_147 == "13" then
    A0_146["ddns.username"] = nil
    A0_146["ddns.password"] = nil
  end
  if L1_147 ~= "11" then
    A0_146["ddns.ddnsUrl"] = nil
    A0_146["ddns.ddnsOptUrl"] = nil
  elseif A0_146["ddns.ddnsOptUrl"] == "NOOPTURL" then
    A0_146["ddns.ddnsOptUrl"] = nil
  end
  if L1_147 == "12" then
    A0_146["ddns.hostname"] = nil
    A0_146["ddns.timePeriod"] = nil
  end
  return A0_146
end
