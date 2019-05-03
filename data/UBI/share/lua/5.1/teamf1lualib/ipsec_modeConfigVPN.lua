local L0_0
L0_0 = module
L0_0("com.teamf1.core.ipsec.modeconfigvpn", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vipsecure_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.vipsecure.returnCodes")
modeconfigvpnTable = "IpsecModeConfigVpnPolicy"
;({}).recordName = "ModeConfigRecordName"
;({}).firstPoolStartIP = "FirstPoolStartIP"
;({}).firstPoolEndIP = "FirstPoolEndIP"
;({}).secondPoolStartIP = "SecondPoolStartIP"
;({}).secondPoolEndIP = "SecondPoolEndIP"
;({}).thirdPoolStartIP = "ThirdPoolStartIP"
;({}).thirdPoolEndIP = "ThirdPoolEndIP"
;({}).WINSServerPrimaryIP = "WINSServerPrimaryIP"
;({}).WINSServerSecondaryIP = "WINSServerSecondaryIP"
;({}).DNSServerPrimaryIP = "DNSServerPrimaryIP"
;({}).DNSServerSecondaryIP = "DNSServerSecondaryIP"
;({}).encryptionAlgo = "EncryptionAlgorithm"
;({}).encryptionKeyLen = "KeyLength"
;({}).authenticationAlgo = "AuthAlgorithm"
;({}).localNetworkType = "LocalNetworkType"
;({}).localStartAddress = "LocalStartAddress"
;({}).localEndAddress = "LocalEndAddress"
;({}).localSubnetmask = "LocalSubnetMask"
;({}).localPrefixLength = "LocalPrefixLength"
;({}).saLifeTime = "SALifeTime"
;({}).saLifeTimeType = "SALifeTimeType"
;({}).pfsKeyGroup = "PFSKeyGroup"
;({}).addressFamily = "AddressFamily"
;({}).refCount = "RefCount"
ROW_ID = "_ROWID_"
ENABLE = "1"
DISABLE = "0"
DES = 2
THREEDES = 4
AES128 = 8
AES192 = 16
AES256 = 32
BLOWFISH = 64
CAST128 = 128
MD5 = 2
SHA1 = 4
SHA2224 = 8
SHA2256 = 16
SHA2384 = 32
SHA2512 = 64
ANY = 0
SINGLE = 1
RANGE = 2
SUBNET = 3
DHGROUP1 = 1
DHGROUP2 = 2
DHGROUP5 = 5
IPV4 = 2
IPV6 = 10
function recordNameGet()
  local L0_1, L1_2
  L0_1 = db
  L0_1 = L0_1.getNextRowId
  L1_2 = "0"
  L0_1 = L0_1(L1_2, modeconfigvpnTable)
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(modeconfigvpnTable, ROW_ID, L0_1, _UPVALUE0_.recordName)
  if L1_2 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_1, L1_2
end
function recordNameGetNext(A0_3)
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
  L2_5 = modeconfigvpnTable
  L1_4 = L1_4(L2_5, ROW_ID, A0_3)
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
  L1_4 = L1_4(L2_5, modeconfigvpnTable)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if L1_4 == L2_5 then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.NOT_EXIST
    return L2_5
  end
  L2_5 = db
  L2_5 = L2_5.getAttribute
  L2_5 = L2_5(modeconfigvpnTable, ROW_ID, L1_4, _UPVALUE1_.recordName)
  if L2_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L2_5
end
function recordNameSet(A0_6, A1_7)
  if A0_6 == _UPVALUE0_.NIL or tonumber(A0_6) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigvpnTable, ROW_ID, A0_6) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_7 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigvpnTable, ROW_ID, A0_6, _UPVALUE1_.recordName, A1_7) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_6
  end
  return _UPVALUE0_.SUCCESS, A0_6
end
function recordNameDelete(A0_8, A1_9)
  local L3_10
  L3_10 = _UPVALUE0_
  L3_10 = L3_10.NOT_SUPPORTED
  return L3_10, A0_8
end
function firstPoolStartIPGet()
  local L0_11, L1_12
  L0_11 = db
  L0_11 = L0_11.getNextRowId
  L1_12 = "0"
  L0_11 = L0_11(L1_12, modeconfigvpnTable)
  L1_12 = db
  L1_12 = L1_12.getAttribute
  L1_12 = L1_12(modeconfigvpnTable, ROW_ID, L0_11, _UPVALUE0_.firstPoolStartIP)
  if L1_12 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_11, L1_12
end
function firstPoolStartIPGetNext(A0_13)
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
  L2_15 = modeconfigvpnTable
  L1_14 = L1_14(L2_15, ROW_ID, A0_13)
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
  L1_14 = L1_14(L2_15, modeconfigvpnTable)
  L2_15 = _UPVALUE0_
  L2_15 = L2_15.NIL
  if L1_14 == L2_15 then
    L2_15 = _UPVALUE0_
    L2_15 = L2_15.NOT_EXIST
    return L2_15
  end
  L2_15 = db
  L2_15 = L2_15.getAttribute
  L2_15 = L2_15(modeconfigvpnTable, ROW_ID, L1_14, _UPVALUE1_.firstPoolStartIP)
  if L2_15 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_14
  end
  return _UPVALUE0_.SUCCESS, L1_14, L2_15
end
function firstPoolStartIPSet(A0_16, A1_17)
  if A0_16 == _UPVALUE0_.NIL or tonumber(A0_16) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigvpnTable, ROW_ID, A0_16) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_17 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck("2", A1_17)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigvpnTable, ROW_ID, A0_16, _UPVALUE2_.firstPoolStartIP, A1_17) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_16
  end
  return _UPVALUE0_.SUCCESS, A0_16
end
function firstPoolEndIPGet()
  local L0_18, L1_19
  L0_18 = db
  L0_18 = L0_18.getNextRowId
  L1_19 = "0"
  L0_18 = L0_18(L1_19, modeconfigvpnTable)
  L1_19 = db
  L1_19 = L1_19.getAttribute
  L1_19 = L1_19(modeconfigvpnTable, ROW_ID, L0_18, _UPVALUE0_.firstPoolEndIP)
  if L1_19 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_18, L1_19
end
function firstPoolEndIPGetNext(A0_20)
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
  L2_22 = modeconfigvpnTable
  L1_21 = L1_21(L2_22, ROW_ID, A0_20)
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
  L1_21 = L1_21(L2_22, modeconfigvpnTable)
  L2_22 = _UPVALUE0_
  L2_22 = L2_22.NIL
  if L1_21 == L2_22 then
    L2_22 = _UPVALUE0_
    L2_22 = L2_22.NOT_EXIST
    return L2_22
  end
  L2_22 = db
  L2_22 = L2_22.getAttribute
  L2_22 = L2_22(modeconfigvpnTable, ROW_ID, L1_21, _UPVALUE1_.firstPoolEndIP)
  if L2_22 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_21
  end
  return _UPVALUE0_.SUCCESS, L1_21, L2_22
end
function firstPoolEndIPSet(A0_23, A1_24)
  if A0_23 == _UPVALUE0_.NIL or tonumber(A0_23) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigvpnTable, ROW_ID, A0_23) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_24 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck("2", A1_24)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigvpnTable, ROW_ID, A0_23, _UPVALUE2_.firstPoolEndIP, A1_24) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_23
  end
  return _UPVALUE0_.SUCCESS, A0_23
end
function secondPoolStartIPGet()
  local L0_25, L1_26
  L0_25 = db
  L0_25 = L0_25.getNextRowId
  L1_26 = "0"
  L0_25 = L0_25(L1_26, modeconfigvpnTable)
  L1_26 = db
  L1_26 = L1_26.getAttribute
  L1_26 = L1_26(modeconfigvpnTable, ROW_ID, L0_25, _UPVALUE0_.secondPoolStartIP)
  if L1_26 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_25, L1_26
end
function secondPoolStartIPGetNext(A0_27)
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
  L2_29 = modeconfigvpnTable
  L1_28 = L1_28(L2_29, ROW_ID, A0_27)
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
  L1_28 = L1_28(L2_29, modeconfigvpnTable)
  L2_29 = _UPVALUE0_
  L2_29 = L2_29.NIL
  if L1_28 == L2_29 then
    L2_29 = _UPVALUE0_
    L2_29 = L2_29.NOT_EXIST
    return L2_29
  end
  L2_29 = db
  L2_29 = L2_29.getAttribute
  L2_29 = L2_29(modeconfigvpnTable, ROW_ID, L1_28, _UPVALUE1_.secondPoolStartIP)
  if L2_29 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_28
  end
  return _UPVALUE0_.SUCCESS, L1_28, L2_29
end
function secondPoolStartIPSet(A0_30, A1_31)
  if A0_30 == _UPVALUE0_.NIL or tonumber(A0_30) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigvpnTable, ROW_ID, A0_30) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_31 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck("2", A1_31)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigvpnTable, ROW_ID, A0_30, _UPVALUE2_.secondPoolStartIP, A1_31) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_30
  end
  return _UPVALUE0_.SUCCESS, A0_30
end
function secondPoolEndIPGet()
  local L0_32, L1_33
  L0_32 = db
  L0_32 = L0_32.getNextRowId
  L1_33 = "0"
  L0_32 = L0_32(L1_33, modeconfigvpnTable)
  L1_33 = db
  L1_33 = L1_33.getAttribute
  L1_33 = L1_33(modeconfigvpnTable, ROW_ID, L0_32, _UPVALUE0_.secondPoolEndIP)
  if L1_33 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_32, L1_33
end
function secondPoolEndIPGetNext(A0_34)
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
  L2_36 = modeconfigvpnTable
  L1_35 = L1_35(L2_36, ROW_ID, A0_34)
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
  L1_35 = L1_35(L2_36, modeconfigvpnTable)
  L2_36 = _UPVALUE0_
  L2_36 = L2_36.NIL
  if L1_35 == L2_36 then
    L2_36 = _UPVALUE0_
    L2_36 = L2_36.NOT_EXIST
    return L2_36
  end
  L2_36 = db
  L2_36 = L2_36.getAttribute
  L2_36 = L2_36(modeconfigvpnTable, ROW_ID, L1_35, _UPVALUE1_.secondPoolEndIP)
  if L2_36 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_35
  end
  return _UPVALUE0_.SUCCESS, L1_35, L2_36
end
function secondPoolEndIPSet(A0_37, A1_38)
  if A0_37 == _UPVALUE0_.NIL or tonumber(A0_37) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigvpnTable, ROW_ID, A0_37) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_38 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck("2", A1_38)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigvpnTable, ROW_ID, A0_37, _UPVALUE2_.secondPoolEndIP, A1_38) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_37
  end
  return _UPVALUE0_.SUCCESS, A0_37
end
function thirdPoolStartIPGet()
  local L0_39, L1_40
  L0_39 = db
  L0_39 = L0_39.getNextRowId
  L1_40 = "0"
  L0_39 = L0_39(L1_40, modeconfigvpnTable)
  L1_40 = db
  L1_40 = L1_40.getAttribute
  L1_40 = L1_40(modeconfigvpnTable, ROW_ID, L0_39, _UPVALUE0_.thirdPoolStartIP)
  if L1_40 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_39, L1_40
end
function thirdPoolStartIPGetNext(A0_41)
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
  L2_43 = modeconfigvpnTable
  L1_42 = L1_42(L2_43, ROW_ID, A0_41)
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
  L1_42 = L1_42(L2_43, modeconfigvpnTable)
  L2_43 = _UPVALUE0_
  L2_43 = L2_43.NIL
  if L1_42 == L2_43 then
    L2_43 = _UPVALUE0_
    L2_43 = L2_43.NOT_EXIST
    return L2_43
  end
  L2_43 = db
  L2_43 = L2_43.getAttribute
  L2_43 = L2_43(modeconfigvpnTable, ROW_ID, L1_42, _UPVALUE1_.thirdPoolStartIP)
  if L2_43 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_42
  end
  return _UPVALUE0_.SUCCESS, L1_42, L2_43
end
function thirdPoolStartIPSet(A0_44, A1_45)
  if A0_44 == _UPVALUE0_.NIL or tonumber(A0_44) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigvpnTable, ROW_ID, A0_44) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_45 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck("2", A1_45)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigvpnTable, ROW_ID, A0_44, _UPVALUE2_.thirdPoolStartIP, A1_45) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_44
  end
  return _UPVALUE0_.SUCCESS, A0_44
end
function thirdPoolEndIPGet()
  local L0_46, L1_47
  L0_46 = db
  L0_46 = L0_46.getNextRowId
  L1_47 = "0"
  L0_46 = L0_46(L1_47, modeconfigvpnTable)
  L1_47 = db
  L1_47 = L1_47.getAttribute
  L1_47 = L1_47(modeconfigvpnTable, ROW_ID, L0_46, _UPVALUE0_.thirdPoolEndIP)
  if L1_47 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_46, L1_47
end
function thirdPoolEndIPGetNext(A0_48)
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
  L2_50 = modeconfigvpnTable
  L1_49 = L1_49(L2_50, ROW_ID, A0_48)
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
  L1_49 = L1_49(L2_50, modeconfigvpnTable)
  L2_50 = _UPVALUE0_
  L2_50 = L2_50.NIL
  if L1_49 == L2_50 then
    L2_50 = _UPVALUE0_
    L2_50 = L2_50.NOT_EXIST
    return L2_50
  end
  L2_50 = db
  L2_50 = L2_50.getAttribute
  L2_50 = L2_50(modeconfigvpnTable, ROW_ID, L1_49, _UPVALUE1_.thirdPoolEndIP)
  if L2_50 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_49
  end
  return _UPVALUE0_.SUCCESS, L1_49, L2_50
end
function thirdPoolEndIPSet(A0_51, A1_52)
  if A0_51 == _UPVALUE0_.NIL or tonumber(A0_51) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigvpnTable, ROW_ID, A0_51) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_52 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck("2", A1_52)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigvpnTable, ROW_ID, A0_51, _UPVALUE2_.thirdPoolEndIP, A1_52) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_51
  end
  return _UPVALUE0_.SUCCESS, A0_51
end
function WINSServerPrimaryIPGet()
  local L0_53, L1_54
  L0_53 = db
  L0_53 = L0_53.getNextRowId
  L1_54 = "0"
  L0_53 = L0_53(L1_54, modeconfigvpnTable)
  L1_54 = db
  L1_54 = L1_54.getAttribute
  L1_54 = L1_54(modeconfigvpnTable, ROW_ID, L0_53, _UPVALUE0_.WINSServerPrimaryIP)
  if L1_54 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_53, L1_54
end
function WINSServerPrimaryIPGetNext(A0_55)
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
  L2_57 = modeconfigvpnTable
  L1_56 = L1_56(L2_57, ROW_ID, A0_55)
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
  L1_56 = L1_56(L2_57, modeconfigvpnTable)
  L2_57 = _UPVALUE0_
  L2_57 = L2_57.NIL
  if L1_56 == L2_57 then
    L2_57 = _UPVALUE0_
    L2_57 = L2_57.NOT_EXIST
    return L2_57
  end
  L2_57 = db
  L2_57 = L2_57.getAttribute
  L2_57 = L2_57(modeconfigvpnTable, ROW_ID, L1_56, _UPVALUE1_.WINSServerPrimaryIP)
  if L2_57 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_56
  end
  return _UPVALUE0_.SUCCESS, L1_56, L2_57
end
function WINSServerPrimaryIPSet(A0_58, A1_59)
  if A0_58 == _UPVALUE0_.NIL or tonumber(A0_58) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigvpnTable, ROW_ID, A0_58) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_59 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck("2", A1_59)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigvpnTable, ROW_ID, A0_58, _UPVALUE2_.WINSServerPrimaryIP, A1_59) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_58
  end
  return _UPVALUE0_.SUCCESS, A0_58
end
function WINSServerSecondaryIPGet()
  local L0_60, L1_61
  L0_60 = db
  L0_60 = L0_60.getNextRowId
  L1_61 = "0"
  L0_60 = L0_60(L1_61, modeconfigvpnTable)
  L1_61 = db
  L1_61 = L1_61.getAttribute
  L1_61 = L1_61(modeconfigvpnTable, ROW_ID, L0_60, _UPVALUE0_.WINSServerSecondaryIP)
  if L1_61 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_60, L1_61
end
function WINSServerSecondaryIPGetNext(A0_62)
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
  L2_64 = modeconfigvpnTable
  L1_63 = L1_63(L2_64, ROW_ID, A0_62)
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
  L1_63 = L1_63(L2_64, modeconfigvpnTable)
  L2_64 = _UPVALUE0_
  L2_64 = L2_64.NIL
  if L1_63 == L2_64 then
    L2_64 = _UPVALUE0_
    L2_64 = L2_64.NOT_EXIST
    return L2_64
  end
  L2_64 = db
  L2_64 = L2_64.getAttribute
  L2_64 = L2_64(modeconfigvpnTable, ROW_ID, L1_63, _UPVALUE1_.WINSServerSecondaryIP)
  if L2_64 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_63
  end
  return _UPVALUE0_.SUCCESS, L1_63, L2_64
end
function WINSServerSecondaryIPSet(A0_65, A1_66)
  if A0_65 == _UPVALUE0_.NIL or tonumber(A0_65) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigvpnTable, ROW_ID, A0_65) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_66 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck("2", A1_66)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigvpnTable, ROW_ID, A0_65, _UPVALUE2_.WINSServerSecondaryIP, A1_66) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_65
  end
  return _UPVALUE0_.SUCCESS, A0_65
end
function DNSServerPrimaryIPGet()
  local L0_67, L1_68
  L0_67 = db
  L0_67 = L0_67.getNextRowId
  L1_68 = "0"
  L0_67 = L0_67(L1_68, modeconfigvpnTable)
  L1_68 = db
  L1_68 = L1_68.getAttribute
  L1_68 = L1_68(modeconfigvpnTable, ROW_ID, L0_67, _UPVALUE0_.DNSServerPrimaryIP)
  if L1_68 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_67, L1_68
end
function DNSServerPrimaryIPGetNext(A0_69)
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
  L2_71 = modeconfigvpnTable
  L1_70 = L1_70(L2_71, ROW_ID, A0_69)
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
  L1_70 = L1_70(L2_71, modeconfigvpnTable)
  L2_71 = _UPVALUE0_
  L2_71 = L2_71.NIL
  if L1_70 == L2_71 then
    L2_71 = _UPVALUE0_
    L2_71 = L2_71.NOT_EXIST
    return L2_71
  end
  L2_71 = db
  L2_71 = L2_71.getAttribute
  L2_71 = L2_71(modeconfigvpnTable, ROW_ID, L1_70, _UPVALUE1_.DNSServerPrimaryIP)
  if L2_71 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_70
  end
  return _UPVALUE0_.SUCCESS, L1_70, L2_71
end
function DNSServerPrimaryIPSet(A0_72, A1_73)
  if A0_72 == _UPVALUE0_.NIL or tonumber(A0_72) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigvpnTable, ROW_ID, A0_72) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_73 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck("2", A1_73)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigvpnTable, ROW_ID, A0_72, _UPVALUE2_.DNSServerPrimaryIP, A1_73) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_72
  end
  return _UPVALUE0_.SUCCESS, A0_72
end
function DNSServerSecondaryIPGet()
  local L0_74, L1_75
  L0_74 = db
  L0_74 = L0_74.getNextRowId
  L1_75 = "0"
  L0_74 = L0_74(L1_75, modeconfigvpnTable)
  L1_75 = db
  L1_75 = L1_75.getAttribute
  L1_75 = L1_75(modeconfigvpnTable, ROW_ID, L0_74, _UPVALUE0_.DNSServerSecondaryIP)
  if L1_75 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_74, L1_75
end
function DNSServerSecondaryIPGetNext(A0_76)
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
  L2_78 = modeconfigvpnTable
  L1_77 = L1_77(L2_78, ROW_ID, A0_76)
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
  L1_77 = L1_77(L2_78, modeconfigvpnTable)
  L2_78 = _UPVALUE0_
  L2_78 = L2_78.NIL
  if L1_77 == L2_78 then
    L2_78 = _UPVALUE0_
    L2_78 = L2_78.NOT_EXIST
    return L2_78
  end
  L2_78 = db
  L2_78 = L2_78.getAttribute
  L2_78 = L2_78(modeconfigvpnTable, ROW_ID, L1_77, _UPVALUE1_.DNSServerSecondaryIP)
  if L2_78 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_77
  end
  return _UPVALUE0_.SUCCESS, L1_77, L2_78
end
function DNSServerSecondaryIPSet(A0_79, A1_80)
  if A0_79 == _UPVALUE0_.NIL or tonumber(A0_79) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigvpnTable, ROW_ID, A0_79) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_80 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck("2", A1_80)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigvpnTable, ROW_ID, A0_79, _UPVALUE2_.DNSServerSecondaryIP, A1_80) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_79
  end
  return _UPVALUE0_.SUCCESS, A0_79
end
function encryptionAlgoGet()
  local L0_81, L1_82
  L0_81 = db
  L0_81 = L0_81.getNextRowId
  L1_82 = "0"
  L0_81 = L0_81(L1_82, modeconfigvpnTable)
  L1_82 = db
  L1_82 = L1_82.getAttribute
  L1_82 = L1_82(modeconfigvpnTable, ROW_ID, L0_81, _UPVALUE0_.encryptionAlgo)
  if L1_82 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_81, L1_82
end
function encryptionAlgoGetNext(A0_83)
  local L1_84, L2_85
  L1_84 = _UPVALUE0_
  L1_84 = L1_84.NIL
  if A0_83 ~= L1_84 then
    L1_84 = tonumber
    L2_85 = A0_83
    L1_84 = L1_84(L2_85)
    L2_85 = _UPVALUE0_
    L2_85 = L2_85.NIL
  elseif L1_84 == L2_85 then
    L1_84 = _UPVALUE0_
    L1_84 = L1_84.INVALID_ARGUMENT
    return L1_84
  end
  L1_84 = db
  L1_84 = L1_84.existsRow
  L2_85 = modeconfigvpnTable
  L1_84 = L1_84(L2_85, ROW_ID, A0_83)
  L2_85 = _UPVALUE0_
  L2_85 = L2_85.FALSE
  if L1_84 == L2_85 then
    L1_84 = _UPVALUE0_
    L1_84 = L1_84.INVALID_ARGUMENT
    return L1_84
  end
  L1_84 = db
  L1_84 = L1_84.getNextRowId
  L2_85 = A0_83
  L1_84 = L1_84(L2_85, modeconfigvpnTable)
  L2_85 = _UPVALUE0_
  L2_85 = L2_85.NIL
  if L1_84 == L2_85 then
    L2_85 = _UPVALUE0_
    L2_85 = L2_85.NOT_EXIST
    return L2_85
  end
  L2_85 = db
  L2_85 = L2_85.getAttribute
  L2_85 = L2_85(modeconfigvpnTable, ROW_ID, L1_84, _UPVALUE1_.encryptionAlgo)
  if L2_85 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_84
  end
  return _UPVALUE0_.SUCCESS, L1_84, L2_85
end
function encryptionAlgoSet(A0_86, A1_87)
  if A0_86 == _UPVALUE0_.NIL or tonumber(A0_86) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigvpnTable, ROW_ID, A0_86) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_87 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_87) ~= DES and tonumber(A1_87) ~= THREEDES and tonumber(A1_87) ~= AES128 and tonumber(A1_87) ~= AES192 and tonumber(A1_87) ~= AES256 and tonumber(A1_87) ~= BLOWFISH and tonumber(A1_87) ~= CAST128 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigvpnTable, ROW_ID, A0_86, _UPVALUE1_.encryptionAlgo, A1_87) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_86
  end
  return _UPVALUE0_.SUCCESS, A0_86
end
function encryptionKeyLenGet()
  local L0_88, L1_89
  L0_88 = db
  L0_88 = L0_88.getNextRowId
  L1_89 = "0"
  L0_88 = L0_88(L1_89, modeconfigvpnTable)
  L1_89 = db
  L1_89 = L1_89.getAttribute
  L1_89 = L1_89(modeconfigvpnTable, ROW_ID, L0_88, _UPVALUE0_.encryptionKeyLen)
  if L1_89 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_88, L1_89
end
function encryptionKeyLenGetNext(A0_90)
  local L1_91, L2_92
  L1_91 = _UPVALUE0_
  L1_91 = L1_91.NIL
  if A0_90 ~= L1_91 then
    L1_91 = tonumber
    L2_92 = A0_90
    L1_91 = L1_91(L2_92)
    L2_92 = _UPVALUE0_
    L2_92 = L2_92.NIL
  elseif L1_91 == L2_92 then
    L1_91 = _UPVALUE0_
    L1_91 = L1_91.INVALID_ARGUMENT
    return L1_91
  end
  L1_91 = db
  L1_91 = L1_91.existsRow
  L2_92 = modeconfigvpnTable
  L1_91 = L1_91(L2_92, ROW_ID, A0_90)
  L2_92 = _UPVALUE0_
  L2_92 = L2_92.FALSE
  if L1_91 == L2_92 then
    L1_91 = _UPVALUE0_
    L1_91 = L1_91.INVALID_ARGUMENT
    return L1_91
  end
  L1_91 = db
  L1_91 = L1_91.getNextRowId
  L2_92 = A0_90
  L1_91 = L1_91(L2_92, modeconfigvpnTable)
  L2_92 = _UPVALUE0_
  L2_92 = L2_92.NIL
  if L1_91 == L2_92 then
    L2_92 = _UPVALUE0_
    L2_92 = L2_92.NOT_EXIST
    return L2_92
  end
  L2_92 = db
  L2_92 = L2_92.getAttribute
  L2_92 = L2_92(modeconfigvpnTable, ROW_ID, L1_91, _UPVALUE1_.encryptionKeyLen)
  if L2_92 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_91
  end
  return _UPVALUE0_.SUCCESS, L1_91, L2_92
end
function encryptionKeyLenSet(A0_93, A1_94)
  if A0_93 == _UPVALUE0_.NIL or tonumber(A0_93) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigvpnTable, ROW_ID, A0_93) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_94 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigvpnTable, ROW_ID, A0_93, _UPVALUE1_.encryptionKeyLen, A1_94) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_93
  end
  return _UPVALUE0_.SUCCESS, A0_93
end
function authenticationAlgoGet()
  local L0_95, L1_96
  L0_95 = db
  L0_95 = L0_95.getNextRowId
  L1_96 = "0"
  L0_95 = L0_95(L1_96, modeconfigvpnTable)
  L1_96 = db
  L1_96 = L1_96.getAttribute
  L1_96 = L1_96(modeconfigvpnTable, ROW_ID, L0_95, _UPVALUE0_.authenticationAlgo)
  if L1_96 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_95, L1_96
end
function authenticationAlgoGetNext(A0_97)
  local L1_98, L2_99
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
  L2_99 = modeconfigvpnTable
  L1_98 = L1_98(L2_99, ROW_ID, A0_97)
  L2_99 = _UPVALUE0_
  L2_99 = L2_99.FALSE
  if L1_98 == L2_99 then
    L1_98 = _UPVALUE0_
    L1_98 = L1_98.INVALID_ARGUMENT
    return L1_98
  end
  L1_98 = db
  L1_98 = L1_98.getNextRowId
  L2_99 = A0_97
  L1_98 = L1_98(L2_99, modeconfigvpnTable)
  L2_99 = _UPVALUE0_
  L2_99 = L2_99.NIL
  if L1_98 == L2_99 then
    L2_99 = _UPVALUE0_
    L2_99 = L2_99.NOT_EXIST
    return L2_99
  end
  L2_99 = db
  L2_99 = L2_99.getAttribute
  L2_99 = L2_99(modeconfigvpnTable, ROW_ID, L1_98, _UPVALUE1_.authenticationAlgo)
  if L2_99 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_98
  end
  return _UPVALUE0_.SUCCESS, L1_98, L2_99
end
function authenticationAlgoSet(A0_100, A1_101)
  if A0_100 == _UPVALUE0_.NIL or tonumber(A0_100) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigvpnTable, ROW_ID, A0_100) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_101 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_101) ~= MD5 and tonumber(A1_101) ~= SHA1 and tonumber(A1_101) ~= SHA2224 and tonumber(A1_101) ~= SHA2256 and tonumber(A1_101) ~= SHA2384 and tonumber(A1_101) ~= SHA2512 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigvpnTable, ROW_ID, A0_100, _UPVALUE1_.authenticationAlgo, A1_101) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_100
  end
  return _UPVALUE0_.SUCCESS, A0_100
end
function localNetworkTypeGet()
  local L0_102, L1_103
  L0_102 = db
  L0_102 = L0_102.getNextRowId
  L1_103 = "0"
  L0_102 = L0_102(L1_103, modeconfigvpnTable)
  L1_103 = db
  L1_103 = L1_103.getAttribute
  L1_103 = L1_103(modeconfigvpnTable, ROW_ID, L0_102, _UPVALUE0_.localNetworkType)
  if L1_103 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_102, L1_103
end
function localNetworkTypeGetNext(A0_104)
  local L1_105, L2_106
  L1_105 = _UPVALUE0_
  L1_105 = L1_105.NIL
  if A0_104 ~= L1_105 then
    L1_105 = tonumber
    L2_106 = A0_104
    L1_105 = L1_105(L2_106)
    L2_106 = _UPVALUE0_
    L2_106 = L2_106.NIL
  elseif L1_105 == L2_106 then
    L1_105 = _UPVALUE0_
    L1_105 = L1_105.INVALID_ARGUMENT
    return L1_105
  end
  L1_105 = db
  L1_105 = L1_105.existsRow
  L2_106 = modeconfigvpnTable
  L1_105 = L1_105(L2_106, ROW_ID, A0_104)
  L2_106 = _UPVALUE0_
  L2_106 = L2_106.FALSE
  if L1_105 == L2_106 then
    L1_105 = _UPVALUE0_
    L1_105 = L1_105.INVALID_ARGUMENT
    return L1_105
  end
  L1_105 = db
  L1_105 = L1_105.getNextRowId
  L2_106 = A0_104
  L1_105 = L1_105(L2_106, modeconfigvpnTable)
  L2_106 = _UPVALUE0_
  L2_106 = L2_106.NIL
  if L1_105 == L2_106 then
    L2_106 = _UPVALUE0_
    L2_106 = L2_106.NOT_EXIST
    return L2_106
  end
  L2_106 = db
  L2_106 = L2_106.getAttribute
  L2_106 = L2_106(modeconfigvpnTable, ROW_ID, L1_105, _UPVALUE1_.localNetworkType)
  if L2_106 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_105
  end
  return _UPVALUE0_.SUCCESS, L1_105, L2_106
end
function localNetworkTypeSet(A0_107, A1_108)
  if A0_107 == _UPVALUE0_.NIL or tonumber(A0_107) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigvpnTable, ROW_ID, A0_107) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_108 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_108) ~= ANY and tonumber(A1_108) ~= SINGLE and tonumber(A1_108) ~= RANGE and tonumber(A1_108) ~= SUBNET then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigvpnTable, ROW_ID, A0_107, _UPVALUE1_.localNetworkType, A1_108) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_107
  end
  return _UPVALUE0_.SUCCESS, A0_107
end
function localStartAddressGet()
  local L0_109, L1_110
  L0_109 = db
  L0_109 = L0_109.getNextRowId
  L1_110 = "0"
  L0_109 = L0_109(L1_110, modeconfigvpnTable)
  L1_110 = db
  L1_110 = L1_110.getAttribute
  L1_110 = L1_110(modeconfigvpnTable, ROW_ID, L0_109, _UPVALUE0_.localStartAddress)
  if L1_110 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_109, L1_110
end
function localStartAddressGetNext(A0_111)
  local L1_112, L2_113
  L1_112 = _UPVALUE0_
  L1_112 = L1_112.NIL
  if A0_111 ~= L1_112 then
    L1_112 = tonumber
    L2_113 = A0_111
    L1_112 = L1_112(L2_113)
    L2_113 = _UPVALUE0_
    L2_113 = L2_113.NIL
  elseif L1_112 == L2_113 then
    L1_112 = _UPVALUE0_
    L1_112 = L1_112.INVALID_ARGUMENT
    return L1_112
  end
  L1_112 = db
  L1_112 = L1_112.existsRow
  L2_113 = modeconfigvpnTable
  L1_112 = L1_112(L2_113, ROW_ID, A0_111)
  L2_113 = _UPVALUE0_
  L2_113 = L2_113.FALSE
  if L1_112 == L2_113 then
    L1_112 = _UPVALUE0_
    L1_112 = L1_112.INVALID_ARGUMENT
    return L1_112
  end
  L1_112 = db
  L1_112 = L1_112.getNextRowId
  L2_113 = A0_111
  L1_112 = L1_112(L2_113, modeconfigvpnTable)
  L2_113 = _UPVALUE0_
  L2_113 = L2_113.NIL
  if L1_112 == L2_113 then
    L2_113 = _UPVALUE0_
    L2_113 = L2_113.NOT_EXIST
    return L2_113
  end
  L2_113 = db
  L2_113 = L2_113.getAttribute
  L2_113 = L2_113(modeconfigvpnTable, ROW_ID, L1_112, _UPVALUE1_.localStartAddress)
  if L2_113 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_112
  end
  return _UPVALUE0_.SUCCESS, L1_112, L2_113
end
function localStartAddressSet(A0_114, A1_115)
  if A0_114 == _UPVALUE0_.NIL or tonumber(A0_114) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigvpnTable, ROW_ID, A0_114) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_115 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck("2", A1_115)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigvpnTable, ROW_ID, A0_114, _UPVALUE2_.localStartAddress, A1_115) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_114
  end
  return _UPVALUE0_.SUCCESS, A0_114
end
function localEndAddressGet()
  local L0_116, L1_117
  L0_116 = db
  L0_116 = L0_116.getNextRowId
  L1_117 = "0"
  L0_116 = L0_116(L1_117, modeconfigvpnTable)
  L1_117 = db
  L1_117 = L1_117.getAttribute
  L1_117 = L1_117(modeconfigvpnTable, ROW_ID, L0_116, _UPVALUE0_.localEndAddress)
  if L1_117 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_116, L1_117
end
function localEndAddressGetNext(A0_118)
  local L1_119, L2_120
  L1_119 = _UPVALUE0_
  L1_119 = L1_119.NIL
  if A0_118 ~= L1_119 then
    L1_119 = tonumber
    L2_120 = A0_118
    L1_119 = L1_119(L2_120)
    L2_120 = _UPVALUE0_
    L2_120 = L2_120.NIL
  elseif L1_119 == L2_120 then
    L1_119 = _UPVALUE0_
    L1_119 = L1_119.INVALID_ARGUMENT
    return L1_119
  end
  L1_119 = db
  L1_119 = L1_119.existsRow
  L2_120 = modeconfigvpnTable
  L1_119 = L1_119(L2_120, ROW_ID, A0_118)
  L2_120 = _UPVALUE0_
  L2_120 = L2_120.FALSE
  if L1_119 == L2_120 then
    L1_119 = _UPVALUE0_
    L1_119 = L1_119.INVALID_ARGUMENT
    return L1_119
  end
  L1_119 = db
  L1_119 = L1_119.getNextRowId
  L2_120 = A0_118
  L1_119 = L1_119(L2_120, modeconfigvpnTable)
  L2_120 = _UPVALUE0_
  L2_120 = L2_120.NIL
  if L1_119 == L2_120 then
    L2_120 = _UPVALUE0_
    L2_120 = L2_120.NOT_EXIST
    return L2_120
  end
  L2_120 = db
  L2_120 = L2_120.getAttribute
  L2_120 = L2_120(modeconfigvpnTable, ROW_ID, L1_119, _UPVALUE1_.localEndAddress)
  if L2_120 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_119
  end
  return _UPVALUE0_.SUCCESS, L1_119, L2_120
end
function localEndAddressSet(A0_121, A1_122)
  if A0_121 == _UPVALUE0_.NIL or tonumber(A0_121) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigvpnTable, ROW_ID, A0_121) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_122 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck("2", A1_122)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigvpnTable, ROW_ID, A0_121, _UPVALUE2_.localEndAddress, A1_122) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_121
  end
  return _UPVALUE0_.SUCCESS, A0_121
end
function localSubnetmaskGet()
  local L0_123, L1_124
  L0_123 = db
  L0_123 = L0_123.getNextRowId
  L1_124 = "0"
  L0_123 = L0_123(L1_124, modeconfigvpnTable)
  L1_124 = db
  L1_124 = L1_124.getAttribute
  L1_124 = L1_124(modeconfigvpnTable, ROW_ID, L0_123, _UPVALUE0_.localSubnetmask)
  if L1_124 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_123, L1_124
end
function localSubnetmaskGetNext(A0_125)
  local L1_126, L2_127
  L1_126 = _UPVALUE0_
  L1_126 = L1_126.NIL
  if A0_125 ~= L1_126 then
    L1_126 = tonumber
    L2_127 = A0_125
    L1_126 = L1_126(L2_127)
    L2_127 = _UPVALUE0_
    L2_127 = L2_127.NIL
  elseif L1_126 == L2_127 then
    L1_126 = _UPVALUE0_
    L1_126 = L1_126.INVALID_ARGUMENT
    return L1_126
  end
  L1_126 = db
  L1_126 = L1_126.existsRow
  L2_127 = modeconfigvpnTable
  L1_126 = L1_126(L2_127, ROW_ID, A0_125)
  L2_127 = _UPVALUE0_
  L2_127 = L2_127.FALSE
  if L1_126 == L2_127 then
    L1_126 = _UPVALUE0_
    L1_126 = L1_126.INVALID_ARGUMENT
    return L1_126
  end
  L1_126 = db
  L1_126 = L1_126.getNextRowId
  L2_127 = A0_125
  L1_126 = L1_126(L2_127, modeconfigvpnTable)
  L2_127 = _UPVALUE0_
  L2_127 = L2_127.NIL
  if L1_126 == L2_127 then
    L2_127 = _UPVALUE0_
    L2_127 = L2_127.NOT_EXIST
    return L2_127
  end
  L2_127 = db
  L2_127 = L2_127.getAttribute
  L2_127 = L2_127(modeconfigvpnTable, ROW_ID, L1_126, _UPVALUE1_.localSubnetmask)
  if L2_127 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_126
  end
  return _UPVALUE0_.SUCCESS, L1_126, L2_127
end
function localSubnetmaskSet(A0_128, A1_129)
  if A0_128 == _UPVALUE0_.NIL or tonumber(A0_128) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigvpnTable, ROW_ID, A0_128) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_129 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck("2", A1_129)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigvpnTable, ROW_ID, A0_128, _UPVALUE2_.localSubnetmask, A1_129) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_128
  end
  return _UPVALUE0_.SUCCESS, A0_128
end
function localPrefixLengthGet()
  local L0_130, L1_131
  L0_130 = db
  L0_130 = L0_130.getNextRowId
  L1_131 = "0"
  L0_130 = L0_130(L1_131, modeconfigvpnTable)
  L1_131 = db
  L1_131 = L1_131.getAttribute
  L1_131 = L1_131(modeconfigvpnTable, ROW_ID, L0_130, _UPVALUE0_.localPrefixLength)
  if L1_131 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_130, L1_131
end
function localPrefixLengthGetNext(A0_132)
  local L1_133, L2_134
  L1_133 = _UPVALUE0_
  L1_133 = L1_133.NIL
  if A0_132 ~= L1_133 then
    L1_133 = tonumber
    L2_134 = A0_132
    L1_133 = L1_133(L2_134)
    L2_134 = _UPVALUE0_
    L2_134 = L2_134.NIL
  elseif L1_133 == L2_134 then
    L1_133 = _UPVALUE0_
    L1_133 = L1_133.INVALID_ARGUMENT
    return L1_133
  end
  L1_133 = db
  L1_133 = L1_133.existsRow
  L2_134 = modeconfigvpnTable
  L1_133 = L1_133(L2_134, ROW_ID, A0_132)
  L2_134 = _UPVALUE0_
  L2_134 = L2_134.FALSE
  if L1_133 == L2_134 then
    L1_133 = _UPVALUE0_
    L1_133 = L1_133.INVALID_ARGUMENT
    return L1_133
  end
  L1_133 = db
  L1_133 = L1_133.getNextRowId
  L2_134 = A0_132
  L1_133 = L1_133(L2_134, modeconfigvpnTable)
  L2_134 = _UPVALUE0_
  L2_134 = L2_134.NIL
  if L1_133 == L2_134 then
    L2_134 = _UPVALUE0_
    L2_134 = L2_134.NOT_EXIST
    return L2_134
  end
  L2_134 = db
  L2_134 = L2_134.getAttribute
  L2_134 = L2_134(modeconfigvpnTable, ROW_ID, L1_133, _UPVALUE1_.localPrefixLength)
  if L2_134 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_133
  end
  return _UPVALUE0_.SUCCESS, L1_133, L2_134
end
function localPrefixLengthSet(A0_135, A1_136)
  if A0_135 == _UPVALUE0_.NIL or tonumber(A0_135) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigvpnTable, ROW_ID, A0_135) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_136 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigvpnTable, ROW_ID, A0_135, _UPVALUE1_.localPrefixLength, A1_136) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_135
  end
  return _UPVALUE0_.SUCCESS, A0_135
end
function saLifeTimeGet()
  local L0_137, L1_138
  L0_137 = db
  L0_137 = L0_137.getNextRowId
  L1_138 = "0"
  L0_137 = L0_137(L1_138, modeconfigvpnTable)
  L1_138 = db
  L1_138 = L1_138.getAttribute
  L1_138 = L1_138(modeconfigvpnTable, ROW_ID, L0_137, _UPVALUE0_.saLifeTime)
  if L1_138 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_137, L1_138
end
function saLifeTimeGetNext(A0_139)
  local L1_140, L2_141
  L1_140 = _UPVALUE0_
  L1_140 = L1_140.NIL
  if A0_139 ~= L1_140 then
    L1_140 = tonumber
    L2_141 = A0_139
    L1_140 = L1_140(L2_141)
    L2_141 = _UPVALUE0_
    L2_141 = L2_141.NIL
  elseif L1_140 == L2_141 then
    L1_140 = _UPVALUE0_
    L1_140 = L1_140.INVALID_ARGUMENT
    return L1_140
  end
  L1_140 = db
  L1_140 = L1_140.existsRow
  L2_141 = modeconfigvpnTable
  L1_140 = L1_140(L2_141, ROW_ID, A0_139)
  L2_141 = _UPVALUE0_
  L2_141 = L2_141.FALSE
  if L1_140 == L2_141 then
    L1_140 = _UPVALUE0_
    L1_140 = L1_140.INVALID_ARGUMENT
    return L1_140
  end
  L1_140 = db
  L1_140 = L1_140.getNextRowId
  L2_141 = A0_139
  L1_140 = L1_140(L2_141, modeconfigvpnTable)
  L2_141 = _UPVALUE0_
  L2_141 = L2_141.NIL
  if L1_140 == L2_141 then
    L2_141 = _UPVALUE0_
    L2_141 = L2_141.NOT_EXIST
    return L2_141
  end
  L2_141 = db
  L2_141 = L2_141.getAttribute
  L2_141 = L2_141(modeconfigvpnTable, ROW_ID, L1_140, _UPVALUE1_.saLifeTime)
  if L2_141 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_140
  end
  return _UPVALUE0_.SUCCESS, L1_140, L2_141
end
function saLifeTimeSet(A0_142, A1_143)
  if A0_142 == _UPVALUE0_.NIL or tonumber(A0_142) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigvpnTable, ROW_ID, A0_142) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_143 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigvpnTable, ROW_ID, A0_142, _UPVALUE1_.saLifeTime, A1_143) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_142
  end
  return _UPVALUE0_.SUCCESS, A0_142
end
function saLifeTimeTypeGet()
  local L0_144, L1_145
  L0_144 = db
  L0_144 = L0_144.getNextRowId
  L1_145 = "0"
  L0_144 = L0_144(L1_145, modeconfigvpnTable)
  L1_145 = db
  L1_145 = L1_145.getAttribute
  L1_145 = L1_145(modeconfigvpnTable, ROW_ID, L0_144, _UPVALUE0_.saLifeTimeType)
  if L1_145 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_144, L1_145
end
function saLifeTimeTypeGetNext(A0_146)
  local L1_147, L2_148
  L1_147 = _UPVALUE0_
  L1_147 = L1_147.NIL
  if A0_146 ~= L1_147 then
    L1_147 = tonumber
    L2_148 = A0_146
    L1_147 = L1_147(L2_148)
    L2_148 = _UPVALUE0_
    L2_148 = L2_148.NIL
  elseif L1_147 == L2_148 then
    L1_147 = _UPVALUE0_
    L1_147 = L1_147.INVALID_ARGUMENT
    return L1_147
  end
  L1_147 = db
  L1_147 = L1_147.existsRow
  L2_148 = modeconfigvpnTable
  L1_147 = L1_147(L2_148, ROW_ID, A0_146)
  L2_148 = _UPVALUE0_
  L2_148 = L2_148.FALSE
  if L1_147 == L2_148 then
    L1_147 = _UPVALUE0_
    L1_147 = L1_147.INVALID_ARGUMENT
    return L1_147
  end
  L1_147 = db
  L1_147 = L1_147.getNextRowId
  L2_148 = A0_146
  L1_147 = L1_147(L2_148, modeconfigvpnTable)
  L2_148 = _UPVALUE0_
  L2_148 = L2_148.NIL
  if L1_147 == L2_148 then
    L2_148 = _UPVALUE0_
    L2_148 = L2_148.NOT_EXIST
    return L2_148
  end
  L2_148 = db
  L2_148 = L2_148.getAttribute
  L2_148 = L2_148(modeconfigvpnTable, ROW_ID, L1_147, _UPVALUE1_.saLifeTimeType)
  if L2_148 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_147
  end
  return _UPVALUE0_.SUCCESS, L1_147, L2_148
end
function saLifeTimeTypeSet(A0_149, A1_150)
  if A0_149 == _UPVALUE0_.NIL or tonumber(A0_149) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigvpnTable, ROW_ID, A0_149) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_150 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_150) ~= 0 and tonumber(A1_150) ~= 1 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigvpnTable, ROW_ID, A0_149, _UPVALUE1_.saLifeTimeType, A1_150) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_149
  end
  return _UPVALUE0_.SUCCESS, A0_149
end
function pfsKeyGroupGet()
  local L0_151, L1_152
  L0_151 = db
  L0_151 = L0_151.getNextRowId
  L1_152 = "0"
  L0_151 = L0_151(L1_152, modeconfigvpnTable)
  L1_152 = db
  L1_152 = L1_152.getAttribute
  L1_152 = L1_152(modeconfigvpnTable, ROW_ID, L0_151, _UPVALUE0_.pfsKeyGroup)
  if L1_152 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_151, L1_152
end
function pfsKeyGroupGetNext(A0_153)
  local L1_154, L2_155
  L1_154 = _UPVALUE0_
  L1_154 = L1_154.NIL
  if A0_153 ~= L1_154 then
    L1_154 = tonumber
    L2_155 = A0_153
    L1_154 = L1_154(L2_155)
    L2_155 = _UPVALUE0_
    L2_155 = L2_155.NIL
  elseif L1_154 == L2_155 then
    L1_154 = _UPVALUE0_
    L1_154 = L1_154.INVALID_ARGUMENT
    return L1_154
  end
  L1_154 = db
  L1_154 = L1_154.existsRow
  L2_155 = modeconfigvpnTable
  L1_154 = L1_154(L2_155, ROW_ID, A0_153)
  L2_155 = _UPVALUE0_
  L2_155 = L2_155.FALSE
  if L1_154 == L2_155 then
    L1_154 = _UPVALUE0_
    L1_154 = L1_154.INVALID_ARGUMENT
    return L1_154
  end
  L1_154 = db
  L1_154 = L1_154.getNextRowId
  L2_155 = A0_153
  L1_154 = L1_154(L2_155, modeconfigvpnTable)
  L2_155 = _UPVALUE0_
  L2_155 = L2_155.NIL
  if L1_154 == L2_155 then
    L2_155 = _UPVALUE0_
    L2_155 = L2_155.NOT_EXIST
    return L2_155
  end
  L2_155 = db
  L2_155 = L2_155.getAttribute
  L2_155 = L2_155(modeconfigvpnTable, ROW_ID, L1_154, _UPVALUE1_.pfsKeyGroup)
  if L2_155 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_154
  end
  return _UPVALUE0_.SUCCESS, L1_154, L2_155
end
function pfsKeyGroupSet(A0_156, A1_157)
  if A0_156 == _UPVALUE0_.NIL or tonumber(A0_156) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigvpnTable, ROW_ID, A0_156) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_157 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_157) ~= DHGROUP1 and tonumber(A1_157) ~= DHGROUP2 and tonumber(A1_157) ~= DHGROUP5 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigvpnTable, ROW_ID, A0_156, _UPVALUE1_.pfsKeyGroup, A1_157) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_156
  end
  return _UPVALUE0_.SUCCESS, A0_156
end
function addressFamilyGet()
  local L0_158, L1_159
  L0_158 = db
  L0_158 = L0_158.getNextRowId
  L1_159 = "0"
  L0_158 = L0_158(L1_159, modeconfigvpnTable)
  L1_159 = db
  L1_159 = L1_159.getAttribute
  L1_159 = L1_159(modeconfigvpnTable, ROW_ID, L0_158, _UPVALUE0_.addressFamily)
  if L1_159 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_158, L1_159
end
function addressFamilyGetNext(A0_160)
  local L1_161, L2_162
  L1_161 = _UPVALUE0_
  L1_161 = L1_161.NIL
  if A0_160 ~= L1_161 then
    L1_161 = tonumber
    L2_162 = A0_160
    L1_161 = L1_161(L2_162)
    L2_162 = _UPVALUE0_
    L2_162 = L2_162.NIL
  elseif L1_161 == L2_162 then
    L1_161 = _UPVALUE0_
    L1_161 = L1_161.INVALID_ARGUMENT
    return L1_161
  end
  L1_161 = db
  L1_161 = L1_161.existsRow
  L2_162 = modeconfigvpnTable
  L1_161 = L1_161(L2_162, ROW_ID, A0_160)
  L2_162 = _UPVALUE0_
  L2_162 = L2_162.FALSE
  if L1_161 == L2_162 then
    L1_161 = _UPVALUE0_
    L1_161 = L1_161.INVALID_ARGUMENT
    return L1_161
  end
  L1_161 = db
  L1_161 = L1_161.getNextRowId
  L2_162 = A0_160
  L1_161 = L1_161(L2_162, modeconfigvpnTable)
  L2_162 = _UPVALUE0_
  L2_162 = L2_162.NIL
  if L1_161 == L2_162 then
    L2_162 = _UPVALUE0_
    L2_162 = L2_162.NOT_EXIST
    return L2_162
  end
  L2_162 = db
  L2_162 = L2_162.getAttribute
  L2_162 = L2_162(modeconfigvpnTable, ROW_ID, L1_161, _UPVALUE1_.addressFamily)
  if L2_162 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_161
  end
  return _UPVALUE0_.SUCCESS, L1_161, L2_162
end
function addressFamilySet(A0_163, A1_164)
  if A0_163 == _UPVALUE0_.NIL or tonumber(A0_163) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigvpnTable, ROW_ID, A0_163) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_164 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_164) ~= IPV4 and tonumber(A1_164) ~= IPV6 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigvpnTable, ROW_ID, A0_163, _UPVALUE1_.addressFamily, A1_164) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_163
  end
  return _UPVALUE0_.SUCCESS, A0_163
end
function refCountGet()
  local L0_165, L1_166
  L0_165 = db
  L0_165 = L0_165.getNextRowId
  L1_166 = "0"
  L0_165 = L0_165(L1_166, modeconfigvpnTable)
  L1_166 = db
  L1_166 = L1_166.getAttribute
  L1_166 = L1_166(modeconfigvpnTable, ROW_ID, L0_165, _UPVALUE0_.refCount)
  if L1_166 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_165, L1_166
end
function refCountGetNext(A0_167)
  local L1_168, L2_169
  L1_168 = _UPVALUE0_
  L1_168 = L1_168.NIL
  if A0_167 ~= L1_168 then
    L1_168 = tonumber
    L2_169 = A0_167
    L1_168 = L1_168(L2_169)
    L2_169 = _UPVALUE0_
    L2_169 = L2_169.NIL
  elseif L1_168 == L2_169 then
    L1_168 = _UPVALUE0_
    L1_168 = L1_168.INVALID_ARGUMENT
    return L1_168
  end
  L1_168 = db
  L1_168 = L1_168.existsRow
  L2_169 = modeconfigvpnTable
  L1_168 = L1_168(L2_169, ROW_ID, A0_167)
  L2_169 = _UPVALUE0_
  L2_169 = L2_169.FALSE
  if L1_168 == L2_169 then
    L1_168 = _UPVALUE0_
    L1_168 = L1_168.INVALID_ARGUMENT
    return L1_168
  end
  L1_168 = db
  L1_168 = L1_168.getNextRowId
  L2_169 = A0_167
  L1_168 = L1_168(L2_169, modeconfigvpnTable)
  L2_169 = _UPVALUE0_
  L2_169 = L2_169.NIL
  if L1_168 == L2_169 then
    L2_169 = _UPVALUE0_
    L2_169 = L2_169.NOT_EXIST
    return L2_169
  end
  L2_169 = db
  L2_169 = L2_169.getAttribute
  L2_169 = L2_169(modeconfigvpnTable, ROW_ID, L1_168, _UPVALUE1_.refCount)
  if L2_169 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_168
  end
  return _UPVALUE0_.SUCCESS, L1_168, L2_169
end
function refCountSet(A0_170, A1_171)
  local L3_172
  L3_172 = _UPVALUE0_
  L3_172 = L3_172.NOT_SUPPORTED
  return L3_172, A0_170
end
function ipsecModeConfigVpnGet()
  local L0_173, L1_174
  L0_173 = db
  L0_173 = L0_173.getNextRowId
  L1_174 = "0"
  L0_173 = L0_173(L1_174, modeconfigvpnTable)
  L1_174 = db
  L1_174 = L1_174.getRow
  L1_174 = L1_174(modeconfigvpnTable, ROW_ID, L0_173)
  if L1_174 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_173, L1_174
end
function ipsecModeConfigVpnGetNext(A0_175)
  local L1_176, L2_177
  L1_176 = _UPVALUE0_
  L1_176 = L1_176.NIL
  if A0_175 ~= L1_176 then
    L1_176 = tonumber
    L2_177 = A0_175
    L1_176 = L1_176(L2_177)
    L2_177 = _UPVALUE0_
    L2_177 = L2_177.NIL
  elseif L1_176 == L2_177 then
    L1_176 = _UPVALUE0_
    L1_176 = L1_176.INVALID_ARGUMENT
    return L1_176
  end
  L1_176 = db
  L1_176 = L1_176.existsRow
  L2_177 = modeconfigvpnTable
  L1_176 = L1_176(L2_177, ROW_ID, A0_175)
  L2_177 = _UPVALUE0_
  L2_177 = L2_177.FALSE
  if L1_176 == L2_177 then
    L1_176 = _UPVALUE0_
    L1_176 = L1_176.INVALID_ARGUMENT
    return L1_176
  end
  L1_176 = db
  L1_176 = L1_176.getNextRowId
  L2_177 = A0_175
  L1_176 = L1_176(L2_177, modeconfigvpnTable)
  L2_177 = _UPVALUE0_
  L2_177 = L2_177.NIL
  if L1_176 == L2_177 then
    L2_177 = _UPVALUE0_
    L2_177 = L2_177.NOT_EXIST
    return L2_177
  end
  L2_177 = db
  L2_177 = L2_177.getRow
  L2_177 = L2_177(modeconfigvpnTable, ROW_ID, L1_176)
  if L2_177 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_176, L2_177
end
function ipsecModeConfigVpnSet(A0_178, A1_179, A2_180, A3_181, A4_182, A5_183, A6_184, A7_185, A8_186, A9_187, A10_188, A11_189, A12_190, A13_191, A14_192, A15_193, A16_194, A17_195, A18_196, A19_197, A20_198, A21_199, A22_200, A23_201)
  local L24_202, L25_203
  L24_202 = _UPVALUE0_
  L24_202 = L24_202.NIL
  if A0_178 ~= L24_202 then
    L24_202 = tonumber
    L25_203 = A0_178
    L24_202 = L24_202(L25_203)
    L25_203 = _UPVALUE0_
    L25_203 = L25_203.NIL
  elseif L24_202 == L25_203 then
    L24_202 = _UPVALUE0_
    L24_202 = L24_202.INVALID_ARGUMENT
    return L24_202
  end
  L24_202 = db
  L24_202 = L24_202.existsRow
  L25_203 = modeconfigvpnTable
  L24_202 = L24_202(L25_203, ROW_ID, A0_178)
  L25_203 = _UPVALUE0_
  L25_203 = L25_203.FALSE
  if L24_202 == L25_203 then
    L24_202 = _UPVALUE0_
    L24_202 = L24_202.INVALID_ARGUMENT
    return L24_202
  end
  L24_202 = nil
  L25_203 = {}
  if A1_179 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L25_203[modeconfigvpnTable .. "." .. _UPVALUE1_.recordName] = A1_179
  if A2_180 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L24_202 = _UPVALUE2_.ipAddressCheck("2", A2_180)
  if L24_202 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE3_.VIPSECURE_FIRSTPOOLSTARTIP_INVALID
  end
  L25_203[modeconfigvpnTable .. "." .. _UPVALUE1_.firstPoolStartIP] = A2_180
  if A3_181 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L24_202 = _UPVALUE2_.ipAddressCheck("2", A3_181)
  if L24_202 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE3_.VIPSECURE_FIRSTPOOLENDIP_INVALID
  end
  L25_203[modeconfigvpnTable .. "." .. _UPVALUE1_.firstPoolEndIP] = A3_181
  if A4_182 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L24_202 = _UPVALUE2_.ipAddressCheck("2", A4_182)
  if L24_202 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE3_.VIPSECURE_SECONDPOOLSTARTIP_INVALID
  end
  L25_203[modeconfigvpnTable .. "." .. _UPVALUE1_.secondPoolStartIP] = A4_182
  if A5_183 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L24_202 = _UPVALUE2_.ipAddressCheck("2", A5_183)
  if L24_202 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE3_.VIPSECURE_SECONDPOOLENDIP_INVALID
  end
  L25_203[modeconfigvpnTable .. "." .. _UPVALUE1_.secondPoolEndIP] = A5_183
  if A6_184 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L24_202 = _UPVALUE2_.ipAddressCheck("2", A6_184)
  if L24_202 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE3_.VIPSECURE_THIRDPOOLSTARTIP_INVALID
  end
  L25_203[modeconfigvpnTable .. "." .. _UPVALUE1_.thirdPoolStartIP] = A6_184
  if A7_185 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L24_202 = _UPVALUE2_.ipAddressCheck("2", A7_185)
  if L24_202 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE3_.VIPSECURE_THIRDPOOLENDIP_INVALID
  end
  L25_203[modeconfigvpnTable .. "." .. _UPVALUE1_.thirdPoolEndIP] = A7_185
  if A8_186 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L24_202 = _UPVALUE2_.ipAddressCheck("2", A8_186)
  if L24_202 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE3_.VIPSECURE_WINSSERVER_PRIMARYIP_INVALID
  end
  L25_203[modeconfigvpnTable .. "." .. _UPVALUE1_.WINSServerPrimaryIP] = A8_186
  if A9_187 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L24_202 = _UPVALUE2_.ipAddressCheck("2", A9_187)
  if L24_202 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE3_.VIPSECURE_WINSSERVER_SECONDARYIP_INVALID
  end
  L25_203[modeconfigvpnTable .. "." .. _UPVALUE1_.WINSServerSecondaryIP] = A9_187
  if A10_188 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L24_202 = _UPVALUE2_.ipAddressCheck("2", A10_188)
  if L24_202 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE3_.VIPSECURE_DNSSERVER_PRIMARYIP_INVALID
  end
  L25_203[modeconfigvpnTable .. "." .. _UPVALUE1_.DNSServerPrimaryIP] = A10_188
  if A11_189 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L24_202 = _UPVALUE2_.ipAddressCheck("2", A11_189)
  if L24_202 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE3_.VIPSECURE_DNSSERVER_SECONDRYIP_INVALID
  end
  L25_203[modeconfigvpnTable .. "." .. _UPVALUE1_.DNSServerSecondaryIP] = A11_189
  if A12_190 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A12_190) ~= DES and tonumber(A12_190) ~= THREEDES and tonumber(A12_190) ~= AES128 and tonumber(A12_190) ~= AES192 and tonumber(A12_190) ~= AES256 and tonumber(A12_190) ~= BLOWFISH and tonumber(A12_190) ~= CAST128 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L25_203[modeconfigvpnTable .. "." .. _UPVALUE1_.encryptionAlgo] = A12_190
  if tonumber(A12_190) == BLOWFISH or tonumber(A12_190) == CAST128 then
    if A13_191 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    L25_203[modeconfigvpnTable .. "." .. _UPVALUE1_.encryptionKeyLen] = A13_191
  end
  if A14_192 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A14_192) ~= MD5 and tonumber(A14_192) ~= SHA1 and tonumber(A14_192) ~= SHA2224 and tonumber(A14_192) ~= SHA2256 and tonumber(A14_192) ~= SHA2384 and tonumber(A14_192) ~= SHA2512 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L25_203[modeconfigvpnTable .. "." .. _UPVALUE1_.authenticationAlgo] = A14_192
  if A15_193 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A15_193) ~= ANY and tonumber(A15_193) ~= SINGLE and tonumber(A15_193) ~= RANGE and tonumber(A15_193) ~= SUBNET then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L25_203[modeconfigvpnTable .. "." .. _UPVALUE1_.localNetworkType] = A15_193
  if A16_194 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L24_202 = _UPVALUE2_.ipAddressCheck("2", A16_194)
  if L24_202 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE3_.VIPSECURE_LOCALSTARTADDRESS_INVALID
  end
  L25_203[modeconfigvpnTable .. "." .. _UPVALUE1_.localStartAddress] = A16_194
  if A17_195 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L24_202 = _UPVALUE2_.ipAddressCheck("2", A17_195)
  if L24_202 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE3_.VIPSECURE_LOCALENDADDRESS_INVALID
  end
  L25_203[modeconfigvpnTable .. "." .. _UPVALUE1_.localEndAddress] = A17_195
  if A18_196 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L24_202 = _UPVALUE2_.ipAddressCheck("2", A18_196)
  if L24_202 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE3_.VIPSECURE_LOCALSUBNETMASK_INVALID
  end
  L25_203[modeconfigvpnTable .. "." .. _UPVALUE1_.localSubnetmask] = A18_196
  if A19_197 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L25_203[modeconfigvpnTable .. "." .. _UPVALUE1_.localPrefixLength] = A19_197
  if A20_198 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L25_203[modeconfigvpnTable .. "." .. _UPVALUE1_.saLifeTime] = A20_198
  if A21_199 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A21_199) ~= 0 and tonumber(A21_199) ~= 1 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L25_203[modeconfigvpnTable .. "." .. _UPVALUE1_.saLifeTimeType] = A21_199
  if A22_200 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A22_200) ~= DHGROUP1 and tonumber(A22_200) ~= DHGROUP2 and tonumber(A22_200) ~= DHGROUP5 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L25_203[modeconfigvpnTable .. "." .. _UPVALUE1_.pfsKeyGroup] = A22_200
  if A23_201 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A23_201) ~= IPV4 and tonumber(A23_201) ~= IPV6 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L25_203[modeconfigvpnTable .. "." .. _UPVALUE1_.addressFamily] = A23_201
  if db.update(modeconfigvpnTable, L25_203, A0_178) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_178
  end
  return _UPVALUE0_.SUCCESS, A0_178
end
function ipsecModeConfigVpnCreate(A0_204, A1_205, A2_206, A3_207, A4_208, A5_209, A6_210, A7_211, A8_212, A9_213, A10_214, A11_215, A12_216, A13_217, A14_218, A15_219, A16_220, A17_221, A18_222, A19_223, A20_224, A21_225, A22_226)
  local L23_227, L24_228, L25_229, L26_230, L27_231, L28_232, L29_233, L30_234, L31_235, L32_236
  L24_228 = {}
  L25_229 = _UPVALUE0_
  L25_229 = L25_229.NIL
  if A0_204 == L25_229 then
    L25_229 = _UPVALUE0_
    L25_229 = L25_229.INVALID_ARGUMENT
    return L25_229
  end
  L25_229 = modeconfigvpnTable
  L26_230 = "."
  L27_231 = _UPVALUE1_
  L27_231 = L27_231.recordName
  L25_229 = L25_229 .. L26_230 .. L27_231
  L24_228[L25_229] = A0_204
  L25_229 = _UPVALUE0_
  L25_229 = L25_229.NIL
  if A1_205 == L25_229 then
    L25_229 = _UPVALUE0_
    L25_229 = L25_229.INVALID_ARGUMENT
    return L25_229
  end
  L25_229 = _UPVALUE2_
  L25_229 = L25_229.ipAddressCheck
  L26_230 = "2"
  L27_231 = A1_205
  L25_229 = L25_229(L26_230, L27_231)
  L23_227 = L25_229
  L25_229 = _UPVALUE0_
  L25_229 = L25_229.SUCCESS
  if L23_227 ~= L25_229 then
    L25_229 = _UPVALUE3_
    L25_229 = L25_229.VIPSECURE_FIRSTPOOLSTARTIP_INVALID
    return L25_229
  end
  L25_229 = modeconfigvpnTable
  L26_230 = "."
  L27_231 = _UPVALUE1_
  L27_231 = L27_231.firstPoolStartIP
  L25_229 = L25_229 .. L26_230 .. L27_231
  L24_228[L25_229] = A1_205
  L25_229 = _UPVALUE0_
  L25_229 = L25_229.NIL
  if A2_206 == L25_229 then
    L25_229 = _UPVALUE0_
    L25_229 = L25_229.INVALID_ARGUMENT
    return L25_229
  end
  L25_229 = _UPVALUE2_
  L25_229 = L25_229.ipAddressCheck
  L26_230 = "2"
  L27_231 = A2_206
  L25_229 = L25_229(L26_230, L27_231)
  L23_227 = L25_229
  L25_229 = _UPVALUE0_
  L25_229 = L25_229.SUCCESS
  if L23_227 ~= L25_229 then
    L25_229 = _UPVALUE3_
    L25_229 = L25_229.VIPSECURE_FIRSTPOOLENDIP_INVALID
    return L25_229
  end
  L25_229 = modeconfigvpnTable
  L26_230 = "."
  L27_231 = _UPVALUE1_
  L27_231 = L27_231.firstPoolEndIP
  L25_229 = L25_229 .. L26_230 .. L27_231
  L24_228[L25_229] = A2_206
  L25_229 = _UPVALUE0_
  L25_229 = L25_229.NIL
  if A3_207 == L25_229 then
    L25_229 = _UPVALUE0_
    L25_229 = L25_229.INVALID_ARGUMENT
    return L25_229
  end
  L25_229 = _UPVALUE2_
  L25_229 = L25_229.ipAddressCheck
  L26_230 = "2"
  L27_231 = A3_207
  L25_229 = L25_229(L26_230, L27_231)
  L23_227 = L25_229
  L25_229 = _UPVALUE0_
  L25_229 = L25_229.SUCCESS
  if L23_227 ~= L25_229 then
    L25_229 = _UPVALUE3_
    L25_229 = L25_229.VIPSECURE_SECONDPOOLSTARTIP_INVALID
    return L25_229
  end
  L25_229 = modeconfigvpnTable
  L26_230 = "."
  L27_231 = _UPVALUE1_
  L27_231 = L27_231.secondPoolStartIP
  L25_229 = L25_229 .. L26_230 .. L27_231
  L24_228[L25_229] = A3_207
  L25_229 = _UPVALUE0_
  L25_229 = L25_229.NIL
  if A4_208 == L25_229 then
    L25_229 = _UPVALUE0_
    L25_229 = L25_229.INVALID_ARGUMENT
    return L25_229
  end
  L25_229 = _UPVALUE2_
  L25_229 = L25_229.ipAddressCheck
  L26_230 = "2"
  L27_231 = A4_208
  L25_229 = L25_229(L26_230, L27_231)
  L23_227 = L25_229
  L25_229 = _UPVALUE0_
  L25_229 = L25_229.SUCCESS
  if L23_227 ~= L25_229 then
    L25_229 = _UPVALUE3_
    L25_229 = L25_229.VIPSECURE_SECONDPOOLENDIP_INVALID
    return L25_229
  end
  L25_229 = modeconfigvpnTable
  L26_230 = "."
  L27_231 = _UPVALUE1_
  L27_231 = L27_231.secondPoolEndIP
  L25_229 = L25_229 .. L26_230 .. L27_231
  L24_228[L25_229] = A4_208
  L25_229 = _UPVALUE0_
  L25_229 = L25_229.NIL
  if A5_209 == L25_229 then
    L25_229 = _UPVALUE0_
    L25_229 = L25_229.INVALID_ARGUMENT
    return L25_229
  end
  L25_229 = _UPVALUE2_
  L25_229 = L25_229.ipAddressCheck
  L26_230 = "2"
  L27_231 = A5_209
  L25_229 = L25_229(L26_230, L27_231)
  L23_227 = L25_229
  L25_229 = _UPVALUE0_
  L25_229 = L25_229.SUCCESS
  if L23_227 ~= L25_229 then
    L25_229 = _UPVALUE3_
    L25_229 = L25_229.VIPSECURE_THIRDPOOLSTARTIP_INVALID
    return L25_229
  end
  L25_229 = modeconfigvpnTable
  L26_230 = "."
  L27_231 = _UPVALUE1_
  L27_231 = L27_231.thirdPoolStartIP
  L25_229 = L25_229 .. L26_230 .. L27_231
  L24_228[L25_229] = A5_209
  L25_229 = _UPVALUE0_
  L25_229 = L25_229.NIL
  if A6_210 == L25_229 then
    L25_229 = _UPVALUE0_
    L25_229 = L25_229.INVALID_ARGUMENT
    return L25_229
  end
  L25_229 = _UPVALUE2_
  L25_229 = L25_229.ipAddressCheck
  L26_230 = "2"
  L27_231 = A6_210
  L25_229 = L25_229(L26_230, L27_231)
  L23_227 = L25_229
  L25_229 = _UPVALUE0_
  L25_229 = L25_229.SUCCESS
  if L23_227 ~= L25_229 then
    L25_229 = _UPVALUE3_
    L25_229 = L25_229.VIPSECURE_THIRDPOOLENDIP_INVALID
    return L25_229
  end
  L25_229 = modeconfigvpnTable
  L26_230 = "."
  L27_231 = _UPVALUE1_
  L27_231 = L27_231.thirdPoolEndIP
  L25_229 = L25_229 .. L26_230 .. L27_231
  L24_228[L25_229] = A6_210
  L25_229 = _UPVALUE0_
  L25_229 = L25_229.NIL
  if A7_211 == L25_229 then
    L25_229 = _UPVALUE0_
    L25_229 = L25_229.INVALID_ARGUMENT
    return L25_229
  end
  L25_229 = _UPVALUE2_
  L25_229 = L25_229.ipAddressCheck
  L26_230 = "2"
  L27_231 = A7_211
  L25_229 = L25_229(L26_230, L27_231)
  L23_227 = L25_229
  L25_229 = _UPVALUE0_
  L25_229 = L25_229.SUCCESS
  if L23_227 ~= L25_229 then
    L25_229 = _UPVALUE3_
    L25_229 = L25_229.VIPSECURE_WINSSERVER_PRIMARYIP_INVALID
    return L25_229
  end
  L25_229 = modeconfigvpnTable
  L26_230 = "."
  L27_231 = _UPVALUE1_
  L27_231 = L27_231.WINSServerPrimaryIP
  L25_229 = L25_229 .. L26_230 .. L27_231
  L24_228[L25_229] = A7_211
  L25_229 = _UPVALUE0_
  L25_229 = L25_229.NIL
  if A8_212 == L25_229 then
    L25_229 = _UPVALUE0_
    L25_229 = L25_229.INVALID_ARGUMENT
    return L25_229
  end
  L25_229 = _UPVALUE2_
  L25_229 = L25_229.ipAddressCheck
  L26_230 = "2"
  L27_231 = A8_212
  L25_229 = L25_229(L26_230, L27_231)
  L23_227 = L25_229
  L25_229 = _UPVALUE0_
  L25_229 = L25_229.SUCCESS
  if L23_227 ~= L25_229 then
    L25_229 = _UPVALUE3_
    L25_229 = L25_229.VIPSECURE_WINSSERVER_SECONDARYIP_INVALID
    return L25_229
  end
  L25_229 = modeconfigvpnTable
  L26_230 = "."
  L27_231 = _UPVALUE1_
  L27_231 = L27_231.WINSServerSecondaryIP
  L25_229 = L25_229 .. L26_230 .. L27_231
  L24_228[L25_229] = A8_212
  L25_229 = _UPVALUE0_
  L25_229 = L25_229.NIL
  if A9_213 == L25_229 then
    L25_229 = _UPVALUE0_
    L25_229 = L25_229.INVALID_ARGUMENT
    return L25_229
  end
  L25_229 = _UPVALUE2_
  L25_229 = L25_229.ipAddressCheck
  L26_230 = "2"
  L27_231 = A9_213
  L25_229 = L25_229(L26_230, L27_231)
  L23_227 = L25_229
  L25_229 = _UPVALUE0_
  L25_229 = L25_229.SUCCESS
  if L23_227 ~= L25_229 then
    L25_229 = _UPVALUE3_
    L25_229 = L25_229.VIPSECURE_DNSSERVER_PRIMARYIP_INVALID
    return L25_229
  end
  L25_229 = modeconfigvpnTable
  L26_230 = "."
  L27_231 = _UPVALUE1_
  L27_231 = L27_231.DNSServerPrimaryIP
  L25_229 = L25_229 .. L26_230 .. L27_231
  L24_228[L25_229] = A9_213
  L25_229 = _UPVALUE0_
  L25_229 = L25_229.NIL
  if A10_214 == L25_229 then
    L25_229 = _UPVALUE0_
    L25_229 = L25_229.INVALID_ARGUMENT
    return L25_229
  end
  L25_229 = _UPVALUE2_
  L25_229 = L25_229.ipAddressCheck
  L26_230 = "2"
  L27_231 = A10_214
  L25_229 = L25_229(L26_230, L27_231)
  L23_227 = L25_229
  L25_229 = _UPVALUE0_
  L25_229 = L25_229.SUCCESS
  if L23_227 ~= L25_229 then
    L25_229 = _UPVALUE3_
    L25_229 = L25_229.VIPSECURE_DNSSERVER_SECONDRYIP_INVALID
    return L25_229
  end
  L25_229 = modeconfigvpnTable
  L26_230 = "."
  L27_231 = _UPVALUE1_
  L27_231 = L27_231.DNSServerSecondaryIP
  L25_229 = L25_229 .. L26_230 .. L27_231
  L24_228[L25_229] = A10_214
  L25_229 = _UPVALUE0_
  L25_229 = L25_229.NIL
  if A11_215 == L25_229 then
    L25_229 = _UPVALUE0_
    L25_229 = L25_229.INVALID_ARGUMENT
    return L25_229
  end
  L25_229 = tonumber
  L26_230 = A11_215
  L25_229 = L25_229(L26_230)
  L26_230 = DES
  if L25_229 ~= L26_230 then
    L26_230 = THREEDES
    if L25_229 ~= L26_230 then
      L26_230 = AES128
      if L25_229 ~= L26_230 then
        L26_230 = AES192
        if L25_229 ~= L26_230 then
          L26_230 = AES256
          if L25_229 ~= L26_230 then
            L26_230 = BLOWFISH
            if L25_229 ~= L26_230 then
              L26_230 = CAST128
              if L25_229 ~= L26_230 then
                L26_230 = _UPVALUE0_
                L26_230 = L26_230.INVALID_ARGUMENT
                return L26_230
              end
            end
          end
        end
      end
    end
  end
  L26_230 = modeconfigvpnTable
  L27_231 = "."
  L28_232 = _UPVALUE1_
  L28_232 = L28_232.encryptionAlgo
  L26_230 = L26_230 .. L27_231 .. L28_232
  L24_228[L26_230] = A11_215
  L26_230 = BLOWFISH
  if L25_229 ~= L26_230 then
    L26_230 = CAST128
  elseif L25_229 == L26_230 then
    L26_230 = _UPVALUE0_
    L26_230 = L26_230.NIL
    if A12_216 == L26_230 then
      L26_230 = _UPVALUE0_
      L26_230 = L26_230.INVALID_ARGUMENT
      return L26_230
    end
    L26_230 = modeconfigvpnTable
    L27_231 = "."
    L28_232 = _UPVALUE1_
    L28_232 = L28_232.encryptionKeyLen
    L26_230 = L26_230 .. L27_231 .. L28_232
    L24_228[L26_230] = A12_216
  end
  L26_230 = _UPVALUE0_
  L26_230 = L26_230.NIL
  if A13_217 == L26_230 then
    L26_230 = _UPVALUE0_
    L26_230 = L26_230.INVALID_ARGUMENT
    return L26_230
  end
  L26_230 = tonumber
  L27_231 = A13_217
  L26_230 = L26_230(L27_231)
  L27_231 = MD5
  if L26_230 ~= L27_231 then
    L27_231 = SHA1
    if L26_230 ~= L27_231 then
      L27_231 = SHA2224
      if L26_230 ~= L27_231 then
        L27_231 = SHA2256
        if L26_230 ~= L27_231 then
          L27_231 = SHA2384
          if L26_230 ~= L27_231 then
            L27_231 = SHA2512
            if L26_230 ~= L27_231 then
              L27_231 = _UPVALUE0_
              L27_231 = L27_231.INVALID_ARGUMENT
              return L27_231
            end
          end
        end
      end
    end
  end
  L27_231 = modeconfigvpnTable
  L28_232 = "."
  L29_233 = _UPVALUE1_
  L29_233 = L29_233.authenticationAlgo
  L27_231 = L27_231 .. L28_232 .. L29_233
  L24_228[L27_231] = A13_217
  L27_231 = _UPVALUE0_
  L27_231 = L27_231.NIL
  if A14_218 == L27_231 then
    L27_231 = _UPVALUE0_
    L27_231 = L27_231.INVALID_ARGUMENT
    return L27_231
  end
  L27_231 = tonumber
  L28_232 = A14_218
  L27_231 = L27_231(L28_232)
  L28_232 = ANY
  if L27_231 ~= L28_232 then
    L28_232 = SINGLE
    if L27_231 ~= L28_232 then
      L28_232 = RANGE
      if L27_231 ~= L28_232 then
        L28_232 = SUBNET
        if L27_231 ~= L28_232 then
          L28_232 = _UPVALUE0_
          L28_232 = L28_232.INVALID_ARGUMENT
          return L28_232
        end
      end
    end
  end
  L28_232 = modeconfigvpnTable
  L29_233 = "."
  L30_234 = _UPVALUE1_
  L30_234 = L30_234.localNetworkType
  L28_232 = L28_232 .. L29_233 .. L30_234
  L24_228[L28_232] = A14_218
  L28_232 = _UPVALUE0_
  L28_232 = L28_232.NIL
  if A15_219 == L28_232 then
    L28_232 = _UPVALUE0_
    L28_232 = L28_232.INVALID_ARGUMENT
    return L28_232
  end
  L28_232 = _UPVALUE2_
  L28_232 = L28_232.ipAddressCheck
  L29_233 = "2"
  L30_234 = A15_219
  L28_232 = L28_232(L29_233, L30_234)
  L23_227 = L28_232
  L28_232 = _UPVALUE0_
  L28_232 = L28_232.SUCCESS
  if L23_227 ~= L28_232 then
    L28_232 = _UPVALUE3_
    L28_232 = L28_232.VIPSECURE_LOCALSTARTADDRESS_INVALID
    return L28_232
  end
  L28_232 = modeconfigvpnTable
  L29_233 = "."
  L30_234 = _UPVALUE1_
  L30_234 = L30_234.localStartAddress
  L28_232 = L28_232 .. L29_233 .. L30_234
  L24_228[L28_232] = A15_219
  L28_232 = _UPVALUE0_
  L28_232 = L28_232.NIL
  if A16_220 == L28_232 then
    L28_232 = _UPVALUE0_
    L28_232 = L28_232.INVALID_ARGUMENT
    return L28_232
  end
  L28_232 = _UPVALUE2_
  L28_232 = L28_232.ipAddressCheck
  L29_233 = "2"
  L30_234 = A16_220
  L28_232 = L28_232(L29_233, L30_234)
  L23_227 = L28_232
  L28_232 = _UPVALUE0_
  L28_232 = L28_232.SUCCESS
  if L23_227 ~= L28_232 then
    L28_232 = _UPVALUE3_
    L28_232 = L28_232.VIPSECURE_LOCALENDADDRESS_INVALID
    return L28_232
  end
  L28_232 = modeconfigvpnTable
  L29_233 = "."
  L30_234 = _UPVALUE1_
  L30_234 = L30_234.localEndAddress
  L28_232 = L28_232 .. L29_233 .. L30_234
  L24_228[L28_232] = A16_220
  L28_232 = _UPVALUE0_
  L28_232 = L28_232.NIL
  if A17_221 == L28_232 then
    L28_232 = _UPVALUE0_
    L28_232 = L28_232.INVALID_ARGUMENT
    return L28_232
  end
  L28_232 = _UPVALUE2_
  L28_232 = L28_232.ipAddressCheck
  L29_233 = "2"
  L30_234 = A17_221
  L28_232 = L28_232(L29_233, L30_234)
  L23_227 = L28_232
  L28_232 = _UPVALUE0_
  L28_232 = L28_232.SUCCESS
  if L23_227 ~= L28_232 then
    L28_232 = _UPVALUE3_
    L28_232 = L28_232.VIPSECURE_LOCALSUBNETMASK_INVALID
    return L28_232
  end
  L28_232 = modeconfigvpnTable
  L29_233 = "."
  L30_234 = _UPVALUE1_
  L30_234 = L30_234.localSubnetmask
  L28_232 = L28_232 .. L29_233 .. L30_234
  L24_228[L28_232] = A17_221
  L28_232 = _UPVALUE0_
  L28_232 = L28_232.NIL
  if A18_222 == L28_232 then
    L28_232 = _UPVALUE0_
    L28_232 = L28_232.INVALID_ARGUMENT
    return L28_232
  end
  L28_232 = modeconfigvpnTable
  L29_233 = "."
  L30_234 = _UPVALUE1_
  L30_234 = L30_234.localPrefixLength
  L28_232 = L28_232 .. L29_233 .. L30_234
  L24_228[L28_232] = A18_222
  L28_232 = _UPVALUE0_
  L28_232 = L28_232.NIL
  if A19_223 == L28_232 then
    L28_232 = _UPVALUE0_
    L28_232 = L28_232.INVALID_ARGUMENT
    return L28_232
  end
  L28_232 = modeconfigvpnTable
  L29_233 = "."
  L30_234 = _UPVALUE1_
  L30_234 = L30_234.saLifeTime
  L28_232 = L28_232 .. L29_233 .. L30_234
  L24_228[L28_232] = A19_223
  L28_232 = _UPVALUE0_
  L28_232 = L28_232.NIL
  if A20_224 == L28_232 then
    L28_232 = _UPVALUE0_
    L28_232 = L28_232.INVALID_ARGUMENT
    return L28_232
  end
  L28_232 = tonumber
  L29_233 = A20_224
  L28_232 = L28_232(L29_233)
  if L28_232 ~= 0 and L28_232 ~= 1 then
    L29_233 = _UPVALUE0_
    L29_233 = L29_233.INVALID_ARGUMENT
    return L29_233
  end
  L29_233 = modeconfigvpnTable
  L30_234 = "."
  L31_235 = _UPVALUE1_
  L31_235 = L31_235.saLifeTimeType
  L29_233 = L29_233 .. L30_234 .. L31_235
  L24_228[L29_233] = A20_224
  L29_233 = _UPVALUE0_
  L29_233 = L29_233.NIL
  if A21_225 == L29_233 then
    L29_233 = _UPVALUE0_
    L29_233 = L29_233.INVALID_ARGUMENT
    return L29_233
  end
  L29_233 = tonumber
  L30_234 = A21_225
  L29_233 = L29_233(L30_234)
  L30_234 = DHGROUP1
  if L29_233 ~= L30_234 then
    L30_234 = DHGROUP2
    if L29_233 ~= L30_234 then
      L30_234 = DHGROUP5
      if L29_233 ~= L30_234 then
        L30_234 = _UPVALUE0_
        L30_234 = L30_234.INVALID_ARGUMENT
        return L30_234
      end
    end
  end
  L30_234 = modeconfigvpnTable
  L31_235 = "."
  L32_236 = _UPVALUE1_
  L32_236 = L32_236.pfsKeyGroup
  L30_234 = L30_234 .. L31_235 .. L32_236
  L24_228[L30_234] = A21_225
  L30_234 = _UPVALUE0_
  L30_234 = L30_234.NIL
  if A22_226 == L30_234 then
    L30_234 = _UPVALUE0_
    L30_234 = L30_234.INVALID_ARGUMENT
    return L30_234
  end
  L30_234 = tonumber
  L31_235 = A22_226
  L30_234 = L30_234(L31_235)
  L31_235 = IPV4
  if L30_234 ~= L31_235 then
    L31_235 = IPV6
    if L30_234 ~= L31_235 then
      L31_235 = _UPVALUE0_
      L31_235 = L31_235.INVALID_ARGUMENT
      return L31_235
    end
  end
  L31_235 = modeconfigvpnTable
  L32_236 = "."
  L31_235 = L31_235 .. L32_236 .. _UPVALUE1_.addressFamily
  L24_228[L31_235] = A22_226
  L31_235 = db
  L31_235 = L31_235.insert
  L32_236 = modeconfigvpnTable
  L31_235 = L31_235(L32_236, L24_228)
  L32_236 = _UPVALUE0_
  L32_236 = L32_236.NIL
  if L31_235 == L32_236 then
    L32_236 = _UPVALUE0_
    L32_236 = L32_236.FAILURE
    return L32_236
  end
  L32_236 = db
  L32_236 = L32_236.getAttribute
  L32_236 = L32_236(modeconfigvpnTable, _UPVALUE1_.recordName, A0_204, ROW_ID)
  return _UPVALUE0_.SUCCESS, L32_236
end
function ipsecModeConfigVpnDelete(A0_237)
  if A0_237 == _UPVALUE0_.NIL or tonumber(A0_237) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigvpnTable, ROW_ID, A0_237) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.deleteRow(modeconfigvpnTable, ROW_ID, A0_237) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_237
  end
  return _UPVALUE0_.SUCCESS, A0_237
end
