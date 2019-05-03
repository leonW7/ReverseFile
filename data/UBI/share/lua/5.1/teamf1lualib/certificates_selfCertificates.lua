local L0_0
L0_0 = module
L0_0("com.teamf1.core.certificates.selfcertificates", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/x509_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
selfcertificatesTable = "x509SelfCertReq"
;({}).requestName = "requestName"
;({}).subjectName = "subjectName"
;({}).hashAlgo = "hashAlgo"
;({}).signatureAlgo = "signatureAlgo"
;({}).signatureKeyLen = "signatureKeyLength"
;({}).ipAddress = "ipAddress"
;({}).domainName = "domainName"
;({}).emailAddress = "emailAddress"
;({}).certData = "selfCertData"
;({}).keyData = "selfKeyData"
;({}).appType = "appType"
;({}).requestStatus = "requestStatus"
;({}).dbUpdateFlag = "dbUpdateFlag"
function requestNameGet()
  local L0_1, L1_2
  L0_1 = db
  L0_1 = L0_1.getNextRowId
  L1_2 = _UPVALUE0_
  L0_1 = L0_1(L1_2, selfcertificatesTable)
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(selfcertificatesTable, _UPVALUE1_, L0_1, _UPVALUE2_.requestName)
  if L1_2 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_1, L1_2
end
function requestNameGetNext(A0_3)
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
  L2_5 = selfcertificatesTable
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
  L1_4 = L1_4(L2_5, selfcertificatesTable)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if L1_4 == L2_5 then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.NOT_EXIST
    return L2_5
  end
  L2_5 = db
  L2_5 = L2_5.getAttribute
  L2_5 = L2_5(selfcertificatesTable, _UPVALUE1_, L1_4, _UPVALUE2_.requestName)
  if L2_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L2_5
end
function requestNameSet(A0_6, A1_7)
  if A0_6 == _UPVALUE0_.NIL or tonumber(A0_6) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(selfcertificatesTable, _UPVALUE1_, A0_6) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_7 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(selfcertificatesTable, _UPVALUE1_, A0_6, _UPVALUE2_.requestName, A1_7) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_6
  end
  return _UPVALUE0_.SUCCESS, A0_6
end
function requestNameDelete(A0_8, A1_9)
  local L3_10
  L3_10 = _UPVALUE0_
  L3_10 = L3_10.NOT_SUPPORTED
  return L3_10, A0_8
end
function subjectNameGet()
  local L0_11, L1_12
  L0_11 = db
  L0_11 = L0_11.getNextRowId
  L1_12 = _UPVALUE0_
  L0_11 = L0_11(L1_12, selfcertificatesTable)
  L1_12 = db
  L1_12 = L1_12.getAttribute
  L1_12 = L1_12(selfcertificatesTable, _UPVALUE1_, L0_11, _UPVALUE2_.subjectName)
  if L1_12 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_11, L1_12
end
function subjectNameGetNext(A0_13)
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
  L2_15 = selfcertificatesTable
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
  L1_14 = L1_14(L2_15, selfcertificatesTable)
  L2_15 = _UPVALUE0_
  L2_15 = L2_15.NIL
  if L1_14 == L2_15 then
    L2_15 = _UPVALUE0_
    L2_15 = L2_15.NOT_EXIST
    return L2_15
  end
  L2_15 = db
  L2_15 = L2_15.getAttribute
  L2_15 = L2_15(selfcertificatesTable, _UPVALUE1_, L1_14, _UPVALUE2_.subjectName)
  if L2_15 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_14
  end
  return _UPVALUE0_.SUCCESS, L1_14, L2_15
end
function subjectNameSet(A0_16, A1_17)
  if A0_16 == _UPVALUE0_.NIL or tonumber(A0_16) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(selfcertificatesTable, _UPVALUE1_, A0_16) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_17 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(selfcertificatesTable, _UPVALUE1_, A0_16, _UPVALUE2_.subjectName, A1_17) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_16
  end
  return _UPVALUE0_.SUCCESS, A0_16
end
function subjectNameDelete(A0_18, A1_19)
  local L3_20
  L3_20 = _UPVALUE0_
  L3_20 = L3_20.NOT_SUPPORTED
  return L3_20, A0_18
end
function hashAlgoGet()
  local L0_21, L1_22
  L0_21 = db
  L0_21 = L0_21.getNextRowId
  L1_22 = _UPVALUE0_
  L0_21 = L0_21(L1_22, selfcertificatesTable)
  L1_22 = db
  L1_22 = L1_22.getAttribute
  L1_22 = L1_22(selfcertificatesTable, _UPVALUE1_, L0_21, _UPVALUE2_.hashAlgo)
  if L1_22 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_21, L1_22
end
function hashAlgoGetNext(A0_23)
  local L1_24, L2_25
  L1_24 = _UPVALUE0_
  L1_24 = L1_24.NIL
  if A0_23 ~= L1_24 then
    L1_24 = tonumber
    L2_25 = A0_23
    L1_24 = L1_24(L2_25)
    L2_25 = _UPVALUE0_
    L2_25 = L2_25.NIL
  elseif L1_24 == L2_25 then
    L1_24 = _UPVALUE0_
    L1_24 = L1_24.INVALID_ARGUMENT
    return L1_24
  end
  L1_24 = db
  L1_24 = L1_24.existsRow
  L2_25 = selfcertificatesTable
  L1_24 = L1_24(L2_25, _UPVALUE1_, A0_23)
  L2_25 = _UPVALUE0_
  L2_25 = L2_25.FALSE
  if L1_24 == L2_25 then
    L1_24 = _UPVALUE0_
    L1_24 = L1_24.INVALID_ARGUMENT
    return L1_24
  end
  L1_24 = db
  L1_24 = L1_24.getNextRowId
  L2_25 = A0_23
  L1_24 = L1_24(L2_25, selfcertificatesTable)
  L2_25 = _UPVALUE0_
  L2_25 = L2_25.NIL
  if L1_24 == L2_25 then
    L2_25 = _UPVALUE0_
    L2_25 = L2_25.NOT_EXIST
    return L2_25
  end
  L2_25 = db
  L2_25 = L2_25.getAttribute
  L2_25 = L2_25(selfcertificatesTable, _UPVALUE1_, L1_24, _UPVALUE2_.hashAlgo)
  if L2_25 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_24
  end
  return _UPVALUE0_.SUCCESS, L1_24, L2_25
end
function hashAlgoSet(A0_26, A1_27)
  if A0_26 == _UPVALUE0_.NIL or tonumber(A0_26) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(selfcertificatesTable, _UPVALUE1_, A0_26) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_27 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_27) ~= _UPVALUE2_ and tonumber(A1_27) ~= _UPVALUE3_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(selfcertificatesTable, _UPVALUE1_, A0_26, _UPVALUE4_.hashAlgo, A1_27) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_26
  end
  return _UPVALUE0_.SUCCESS, A0_26
end
function signatureAlgoGet()
  local L0_28, L1_29
  L0_28 = db
  L0_28 = L0_28.getNextRowId
  L1_29 = _UPVALUE0_
  L0_28 = L0_28(L1_29, selfcertificatesTable)
  L1_29 = db
  L1_29 = L1_29.getAttribute
  L1_29 = L1_29(selfcertificatesTable, _UPVALUE1_, L0_28, _UPVALUE2_.signatureAlgo)
  if L1_29 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_28, L1_29
end
function signatureAlgoGetNext(A0_30)
  local L1_31, L2_32
  L1_31 = _UPVALUE0_
  L1_31 = L1_31.NIL
  if A0_30 ~= L1_31 then
    L1_31 = tonumber
    L2_32 = A0_30
    L1_31 = L1_31(L2_32)
    L2_32 = _UPVALUE0_
    L2_32 = L2_32.NIL
  elseif L1_31 == L2_32 then
    L1_31 = _UPVALUE0_
    L1_31 = L1_31.INVALID_ARGUMENT
    return L1_31
  end
  L1_31 = db
  L1_31 = L1_31.existsRow
  L2_32 = selfcertificatesTable
  L1_31 = L1_31(L2_32, _UPVALUE1_, A0_30)
  L2_32 = _UPVALUE0_
  L2_32 = L2_32.FALSE
  if L1_31 == L2_32 then
    L1_31 = _UPVALUE0_
    L1_31 = L1_31.INVALID_ARGUMENT
    return L1_31
  end
  L1_31 = db
  L1_31 = L1_31.getNextRowId
  L2_32 = A0_30
  L1_31 = L1_31(L2_32, selfcertificatesTable)
  L2_32 = _UPVALUE0_
  L2_32 = L2_32.NIL
  if L1_31 == L2_32 then
    L2_32 = _UPVALUE0_
    L2_32 = L2_32.NOT_EXIST
    return L2_32
  end
  L2_32 = db
  L2_32 = L2_32.getAttribute
  L2_32 = L2_32(selfcertificatesTable, _UPVALUE1_, L1_31, _UPVALUE2_.signatureAlgo)
  if L2_32 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_31
  end
  return _UPVALUE0_.SUCCESS, L1_31, L2_32
end
function signatureAlgoSet(A0_33, A1_34)
  if A0_33 == _UPVALUE0_.NIL or tonumber(A0_33) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(selfcertificatesTable, _UPVALUE1_, A0_33) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_34 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_34) ~= _UPVALUE2_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(selfcertificatesTable, _UPVALUE1_, A0_33, _UPVALUE3_.signatureAlgo, A1_34) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_33
  end
  return _UPVALUE0_.SUCCESS, A0_33
end
function signatureKeyLenGet()
  local L0_35, L1_36
  L0_35 = db
  L0_35 = L0_35.getNextRowId
  L1_36 = _UPVALUE0_
  L0_35 = L0_35(L1_36, selfcertificatesTable)
  L1_36 = db
  L1_36 = L1_36.getAttribute
  L1_36 = L1_36(selfcertificatesTable, _UPVALUE1_, L0_35, _UPVALUE2_.signatureKeyLen)
  if L1_36 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_35, L1_36
end
function signatureKeyLenGetNext(A0_37)
  local L1_38, L2_39
  L1_38 = _UPVALUE0_
  L1_38 = L1_38.NIL
  if A0_37 ~= L1_38 then
    L1_38 = tonumber
    L2_39 = A0_37
    L1_38 = L1_38(L2_39)
    L2_39 = _UPVALUE0_
    L2_39 = L2_39.NIL
  elseif L1_38 == L2_39 then
    L1_38 = _UPVALUE0_
    L1_38 = L1_38.INVALID_ARGUMENT
    return L1_38
  end
  L1_38 = db
  L1_38 = L1_38.existsRow
  L2_39 = selfcertificatesTable
  L1_38 = L1_38(L2_39, _UPVALUE1_, A0_37)
  L2_39 = _UPVALUE0_
  L2_39 = L2_39.FALSE
  if L1_38 == L2_39 then
    L1_38 = _UPVALUE0_
    L1_38 = L1_38.INVALID_ARGUMENT
    return L1_38
  end
  L1_38 = db
  L1_38 = L1_38.getNextRowId
  L2_39 = A0_37
  L1_38 = L1_38(L2_39, selfcertificatesTable)
  L2_39 = _UPVALUE0_
  L2_39 = L2_39.NIL
  if L1_38 == L2_39 then
    L2_39 = _UPVALUE0_
    L2_39 = L2_39.NOT_EXIST
    return L2_39
  end
  L2_39 = db
  L2_39 = L2_39.getAttribute
  L2_39 = L2_39(selfcertificatesTable, _UPVALUE1_, L1_38, _UPVALUE2_.signatureKeyLen)
  if L2_39 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_38
  end
  return _UPVALUE0_.SUCCESS, L1_38, L2_39
end
function signatureKeyLenSet(A0_40, A1_41)
  if A0_40 == _UPVALUE0_.NIL or tonumber(A0_40) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(selfcertificatesTable, _UPVALUE1_, A0_40) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_41 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_41) ~= _UPVALUE2_ and tonumber(A1_41) ~= _UPVALUE3_ and tonumber(A1_41) ~= _UPVALUE4_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(selfcertificatesTable, _UPVALUE1_, A0_40, _UPVALUE5_.signatureKeyLen, A1_41) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_40
  end
  return _UPVALUE0_.SUCCESS, A0_40
end
function ipAddressGet()
  local L0_42, L1_43
  L0_42 = db
  L0_42 = L0_42.getNextRowId
  L1_43 = _UPVALUE0_
  L0_42 = L0_42(L1_43, selfcertificatesTable)
  L1_43 = db
  L1_43 = L1_43.getAttribute
  L1_43 = L1_43(selfcertificatesTable, _UPVALUE1_, L0_42, _UPVALUE2_.ipAddress)
  if L1_43 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_42, L1_43
end
function ipAddressGetNext(A0_44)
  local L1_45, L2_46
  L1_45 = _UPVALUE0_
  L1_45 = L1_45.NIL
  if A0_44 ~= L1_45 then
    L1_45 = tonumber
    L2_46 = A0_44
    L1_45 = L1_45(L2_46)
    L2_46 = _UPVALUE0_
    L2_46 = L2_46.NIL
  elseif L1_45 == L2_46 then
    L1_45 = _UPVALUE0_
    L1_45 = L1_45.INVALID_ARGUMENT
    return L1_45
  end
  L1_45 = db
  L1_45 = L1_45.existsRow
  L2_46 = selfcertificatesTable
  L1_45 = L1_45(L2_46, _UPVALUE1_, A0_44)
  L2_46 = _UPVALUE0_
  L2_46 = L2_46.FALSE
  if L1_45 == L2_46 then
    L1_45 = _UPVALUE0_
    L1_45 = L1_45.INVALID_ARGUMENT
    return L1_45
  end
  L1_45 = db
  L1_45 = L1_45.getNextRowId
  L2_46 = A0_44
  L1_45 = L1_45(L2_46, selfcertificatesTable)
  L2_46 = _UPVALUE0_
  L2_46 = L2_46.NIL
  if L1_45 == L2_46 then
    L2_46 = _UPVALUE0_
    L2_46 = L2_46.NOT_EXIST
    return L2_46
  end
  L2_46 = db
  L2_46 = L2_46.getAttribute
  L2_46 = L2_46(selfcertificatesTable, _UPVALUE1_, L1_45, _UPVALUE2_.ipAddress)
  if L2_46 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_45
  end
  return _UPVALUE0_.SUCCESS, L1_45, L2_46
end
function ipAddressSet(A0_47, A1_48)
  if A0_47 == _UPVALUE0_.NIL or tonumber(A0_47) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(selfcertificatesTable, _UPVALUE1_, A0_47) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_48 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE2_.ipAddressCheck("2", A1_48)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(selfcertificatesTable, _UPVALUE1_, A0_47, _UPVALUE3_.ipAddress, A1_48) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_47
  end
  return _UPVALUE0_.SUCCESS, A0_47
end
function domainNameGet()
  local L0_49, L1_50
  L0_49 = db
  L0_49 = L0_49.getNextRowId
  L1_50 = _UPVALUE0_
  L0_49 = L0_49(L1_50, selfcertificatesTable)
  L1_50 = db
  L1_50 = L1_50.getAttribute
  L1_50 = L1_50(selfcertificatesTable, _UPVALUE1_, L0_49, _UPVALUE2_.domainName)
  if L1_50 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_49, L1_50
end
function domainNameGetNext(A0_51)
  local L1_52, L2_53
  L1_52 = _UPVALUE0_
  L1_52 = L1_52.NIL
  if A0_51 ~= L1_52 then
    L1_52 = tonumber
    L2_53 = A0_51
    L1_52 = L1_52(L2_53)
    L2_53 = _UPVALUE0_
    L2_53 = L2_53.NIL
  elseif L1_52 == L2_53 then
    L1_52 = _UPVALUE0_
    L1_52 = L1_52.INVALID_ARGUMENT
    return L1_52
  end
  L1_52 = db
  L1_52 = L1_52.existsRow
  L2_53 = selfcertificatesTable
  L1_52 = L1_52(L2_53, _UPVALUE1_, A0_51)
  L2_53 = _UPVALUE0_
  L2_53 = L2_53.FALSE
  if L1_52 == L2_53 then
    L1_52 = _UPVALUE0_
    L1_52 = L1_52.INVALID_ARGUMENT
    return L1_52
  end
  L1_52 = db
  L1_52 = L1_52.getNextRowId
  L2_53 = A0_51
  L1_52 = L1_52(L2_53, selfcertificatesTable)
  L2_53 = _UPVALUE0_
  L2_53 = L2_53.NIL
  if L1_52 == L2_53 then
    L2_53 = _UPVALUE0_
    L2_53 = L2_53.NOT_EXIST
    return L2_53
  end
  L2_53 = db
  L2_53 = L2_53.getAttribute
  L2_53 = L2_53(selfcertificatesTable, _UPVALUE1_, L1_52, _UPVALUE2_.domainName)
  if L2_53 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_52
  end
  return _UPVALUE0_.SUCCESS, L1_52, L2_53
end
function domainNameSet(A0_54, A1_55)
  if A0_54 == _UPVALUE0_.NIL or tonumber(A0_54) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(selfcertificatesTable, _UPVALUE1_, A0_54) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_55 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(selfcertificatesTable, _UPVALUE1_, A0_54, _UPVALUE2_.domainName, A1_55) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_54
  end
  return _UPVALUE0_.SUCCESS, A0_54
end
function emailAddressGet()
  local L0_56, L1_57
  L0_56 = db
  L0_56 = L0_56.getNextRowId
  L1_57 = _UPVALUE0_
  L0_56 = L0_56(L1_57, selfcertificatesTable)
  L1_57 = db
  L1_57 = L1_57.getAttribute
  L1_57 = L1_57(selfcertificatesTable, _UPVALUE1_, L0_56, _UPVALUE2_.emailAddress)
  if L1_57 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_56, L1_57
end
function emailAddressGetNext(A0_58)
  local L1_59, L2_60
  L1_59 = _UPVALUE0_
  L1_59 = L1_59.NIL
  if A0_58 ~= L1_59 then
    L1_59 = tonumber
    L2_60 = A0_58
    L1_59 = L1_59(L2_60)
    L2_60 = _UPVALUE0_
    L2_60 = L2_60.NIL
  elseif L1_59 == L2_60 then
    L1_59 = _UPVALUE0_
    L1_59 = L1_59.INVALID_ARGUMENT
    return L1_59
  end
  L1_59 = db
  L1_59 = L1_59.existsRow
  L2_60 = selfcertificatesTable
  L1_59 = L1_59(L2_60, _UPVALUE1_, A0_58)
  L2_60 = _UPVALUE0_
  L2_60 = L2_60.FALSE
  if L1_59 == L2_60 then
    L1_59 = _UPVALUE0_
    L1_59 = L1_59.INVALID_ARGUMENT
    return L1_59
  end
  L1_59 = db
  L1_59 = L1_59.getNextRowId
  L2_60 = A0_58
  L1_59 = L1_59(L2_60, selfcertificatesTable)
  L2_60 = _UPVALUE0_
  L2_60 = L2_60.NIL
  if L1_59 == L2_60 then
    L2_60 = _UPVALUE0_
    L2_60 = L2_60.NOT_EXIST
    return L2_60
  end
  L2_60 = db
  L2_60 = L2_60.getAttribute
  L2_60 = L2_60(selfcertificatesTable, _UPVALUE1_, L1_59, _UPVALUE2_.emailAddress)
  if L2_60 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_59
  end
  return _UPVALUE0_.SUCCESS, L1_59, L2_60
end
function emailAddressSet(A0_61, A1_62)
  if A0_61 == _UPVALUE0_.NIL or tonumber(A0_61) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(selfcertificatesTable, _UPVALUE1_, A0_61) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_62 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(selfcertificatesTable, _UPVALUE1_, A0_61, _UPVALUE2_.emailAddress, A1_62) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_61
  end
  return _UPVALUE0_.SUCCESS, A0_61
end
function certDataGet()
  local L0_63, L1_64
  L0_63 = db
  L0_63 = L0_63.getNextRowId
  L1_64 = _UPVALUE0_
  L0_63 = L0_63(L1_64, selfcertificatesTable)
  L1_64 = db
  L1_64 = L1_64.getAttribute
  L1_64 = L1_64(selfcertificatesTable, _UPVALUE1_, L0_63, _UPVALUE2_.certData)
  if L1_64 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_63, L1_64
end
function certDataGetNext(A0_65)
  local L1_66, L2_67
  L1_66 = _UPVALUE0_
  L1_66 = L1_66.NIL
  if A0_65 ~= L1_66 then
    L1_66 = tonumber
    L2_67 = A0_65
    L1_66 = L1_66(L2_67)
    L2_67 = _UPVALUE0_
    L2_67 = L2_67.NIL
  elseif L1_66 == L2_67 then
    L1_66 = _UPVALUE0_
    L1_66 = L1_66.INVALID_ARGUMENT
    return L1_66
  end
  L1_66 = db
  L1_66 = L1_66.existsRow
  L2_67 = selfcertificatesTable
  L1_66 = L1_66(L2_67, _UPVALUE1_, A0_65)
  L2_67 = _UPVALUE0_
  L2_67 = L2_67.FALSE
  if L1_66 == L2_67 then
    L1_66 = _UPVALUE0_
    L1_66 = L1_66.INVALID_ARGUMENT
    return L1_66
  end
  L1_66 = db
  L1_66 = L1_66.getNextRowId
  L2_67 = A0_65
  L1_66 = L1_66(L2_67, selfcertificatesTable)
  L2_67 = _UPVALUE0_
  L2_67 = L2_67.NIL
  if L1_66 == L2_67 then
    L2_67 = _UPVALUE0_
    L2_67 = L2_67.NOT_EXIST
    return L2_67
  end
  L2_67 = db
  L2_67 = L2_67.getAttribute
  L2_67 = L2_67(selfcertificatesTable, _UPVALUE1_, L1_66, _UPVALUE2_.certData)
  if L2_67 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_66
  end
  return _UPVALUE0_.SUCCESS, L1_66, L2_67
end
function certDataSet(A0_68, A1_69)
  local L3_70
  L3_70 = _UPVALUE0_
  L3_70 = L3_70.NOT_SUPPORTED
  return L3_70, A0_68
end
function keyDataGet()
  local L0_71, L1_72
  L0_71 = db
  L0_71 = L0_71.getNextRowId
  L1_72 = _UPVALUE0_
  L0_71 = L0_71(L1_72, selfcertificatesTable)
  L1_72 = db
  L1_72 = L1_72.getAttribute
  L1_72 = L1_72(selfcertificatesTable, _UPVALUE1_, L0_71, _UPVALUE2_.keyData)
  if L1_72 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_71, L1_72
end
function keyDataGetNext(A0_73)
  local L1_74, L2_75
  L1_74 = _UPVALUE0_
  L1_74 = L1_74.NIL
  if A0_73 ~= L1_74 then
    L1_74 = tonumber
    L2_75 = A0_73
    L1_74 = L1_74(L2_75)
    L2_75 = _UPVALUE0_
    L2_75 = L2_75.NIL
  elseif L1_74 == L2_75 then
    L1_74 = _UPVALUE0_
    L1_74 = L1_74.INVALID_ARGUMENT
    return L1_74
  end
  L1_74 = db
  L1_74 = L1_74.existsRow
  L2_75 = selfcertificatesTable
  L1_74 = L1_74(L2_75, _UPVALUE1_, A0_73)
  L2_75 = _UPVALUE0_
  L2_75 = L2_75.FALSE
  if L1_74 == L2_75 then
    L1_74 = _UPVALUE0_
    L1_74 = L1_74.INVALID_ARGUMENT
    return L1_74
  end
  L1_74 = db
  L1_74 = L1_74.getNextRowId
  L2_75 = A0_73
  L1_74 = L1_74(L2_75, selfcertificatesTable)
  L2_75 = _UPVALUE0_
  L2_75 = L2_75.NIL
  if L1_74 == L2_75 then
    L2_75 = _UPVALUE0_
    L2_75 = L2_75.NOT_EXIST
    return L2_75
  end
  L2_75 = db
  L2_75 = L2_75.getAttribute
  L2_75 = L2_75(selfcertificatesTable, _UPVALUE1_, L1_74, _UPVALUE2_.keyData)
  if L2_75 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_74
  end
  return _UPVALUE0_.SUCCESS, L1_74, L2_75
end
function keyDataSet(A0_76, A1_77)
  local L3_78
  L3_78 = _UPVALUE0_
  L3_78 = L3_78.NOT_SUPPORTED
  return L3_78, A0_76
end
function appTypeGet()
  local L0_79, L1_80
  L0_79 = db
  L0_79 = L0_79.getNextRowId
  L1_80 = _UPVALUE0_
  L0_79 = L0_79(L1_80, selfcertificatesTable)
  L1_80 = db
  L1_80 = L1_80.getAttribute
  L1_80 = L1_80(selfcertificatesTable, _UPVALUE1_, L0_79, _UPVALUE2_.appType)
  if L1_80 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_79, L1_80
end
function appTypeGetNext(A0_81)
  local L1_82, L2_83
  L1_82 = _UPVALUE0_
  L1_82 = L1_82.NIL
  if A0_81 ~= L1_82 then
    L1_82 = tonumber
    L2_83 = A0_81
    L1_82 = L1_82(L2_83)
    L2_83 = _UPVALUE0_
    L2_83 = L2_83.NIL
  elseif L1_82 == L2_83 then
    L1_82 = _UPVALUE0_
    L1_82 = L1_82.INVALID_ARGUMENT
    return L1_82
  end
  L1_82 = db
  L1_82 = L1_82.existsRow
  L2_83 = selfcertificatesTable
  L1_82 = L1_82(L2_83, _UPVALUE1_, A0_81)
  L2_83 = _UPVALUE0_
  L2_83 = L2_83.FALSE
  if L1_82 == L2_83 then
    L1_82 = _UPVALUE0_
    L1_82 = L1_82.INVALID_ARGUMENT
    return L1_82
  end
  L1_82 = db
  L1_82 = L1_82.getNextRowId
  L2_83 = A0_81
  L1_82 = L1_82(L2_83, selfcertificatesTable)
  L2_83 = _UPVALUE0_
  L2_83 = L2_83.NIL
  if L1_82 == L2_83 then
    L2_83 = _UPVALUE0_
    L2_83 = L2_83.NOT_EXIST
    return L2_83
  end
  L2_83 = db
  L2_83 = L2_83.getAttribute
  L2_83 = L2_83(selfcertificatesTable, _UPVALUE1_, L1_82, _UPVALUE2_.appType)
  if L2_83 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_82
  end
  return _UPVALUE0_.SUCCESS, L1_82, L2_83
end
function appTypeSet(A0_84, A1_85)
  if A0_84 == _UPVALUE0_.NIL or tonumber(A0_84) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(selfcertificatesTable, _UPVALUE1_, A0_84) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_85 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_85 ~= _UPVALUE2_ and A1_85 ~= _UPVALUE3_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(selfcertificatesTable, _UPVALUE1_, A0_84, _UPVALUE4_.appType, A1_85) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_84
  end
  return _UPVALUE0_.SUCCESS, A0_84
end
function requestStatusGet()
  local L0_86, L1_87
  L0_86 = db
  L0_86 = L0_86.getNextRowId
  L1_87 = _UPVALUE0_
  L0_86 = L0_86(L1_87, selfcertificatesTable)
  L1_87 = db
  L1_87 = L1_87.getAttribute
  L1_87 = L1_87(selfcertificatesTable, _UPVALUE1_, L0_86, _UPVALUE2_.requestStatus)
  if L1_87 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_86, L1_87
end
function requestStatusGetNext(A0_88)
  local L1_89, L2_90
  L1_89 = _UPVALUE0_
  L1_89 = L1_89.NIL
  if A0_88 ~= L1_89 then
    L1_89 = tonumber
    L2_90 = A0_88
    L1_89 = L1_89(L2_90)
    L2_90 = _UPVALUE0_
    L2_90 = L2_90.NIL
  elseif L1_89 == L2_90 then
    L1_89 = _UPVALUE0_
    L1_89 = L1_89.INVALID_ARGUMENT
    return L1_89
  end
  L1_89 = db
  L1_89 = L1_89.existsRow
  L2_90 = selfcertificatesTable
  L1_89 = L1_89(L2_90, _UPVALUE1_, A0_88)
  L2_90 = _UPVALUE0_
  L2_90 = L2_90.FALSE
  if L1_89 == L2_90 then
    L1_89 = _UPVALUE0_
    L1_89 = L1_89.INVALID_ARGUMENT
    return L1_89
  end
  L1_89 = db
  L1_89 = L1_89.getNextRowId
  L2_90 = A0_88
  L1_89 = L1_89(L2_90, selfcertificatesTable)
  L2_90 = _UPVALUE0_
  L2_90 = L2_90.NIL
  if L1_89 == L2_90 then
    L2_90 = _UPVALUE0_
    L2_90 = L2_90.NOT_EXIST
    return L2_90
  end
  L2_90 = db
  L2_90 = L2_90.getAttribute
  L2_90 = L2_90(selfcertificatesTable, _UPVALUE1_, L1_89, _UPVALUE2_.requestStatus)
  if L2_90 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_89
  end
  return _UPVALUE0_.SUCCESS, L1_89, L2_90
end
function requestStatusSet(A0_91, A1_92)
  if A0_91 == _UPVALUE0_.NIL or tonumber(A0_91) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(selfcertificatesTable, _UPVALUE1_, A0_91) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_92 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(selfcertificatesTable, _UPVALUE1_, A0_91, _UPVALUE2_.requestStatus, A1_92) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_91
  end
  return _UPVALUE0_.SUCCESS, A0_91
end
function selfCertificateGet()
  local L0_93, L1_94, L2_95, L3_96, L4_97, L5_98, L6_99, L7_100, L8_101, L9_102, L10_103, L11_104, L12_105, L13_106
  L0_93 = db
  L0_93 = L0_93.getNextRowId
  L1_94 = _UPVALUE0_
  L2_95 = selfcertificatesTable
  L0_93 = L0_93(L1_94, L2_95)
  L1_94 = db
  L1_94 = L1_94.getRow
  L2_95 = selfcertificatesTable
  L3_96 = _UPVALUE1_
  L4_97 = L0_93
  L1_94 = L1_94(L2_95, L3_96, L4_97)
  L2_95 = _UPVALUE2_
  L2_95 = L2_95.NIL
  if L1_94 == L2_95 then
    L2_95 = _UPVALUE2_
    L2_95 = L2_95.FAILURE
    return L2_95
  end
  L2_95, L3_96, L4_97, L5_98, L6_99, L7_100, L8_101, L9_102, L10_103, L11_104, L12_105, L13_106 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L2_95 = L1_94[selfcertificatesTable .. "." .. _UPVALUE3_.requestName]
  L3_96 = L1_94[selfcertificatesTable .. "." .. _UPVALUE3_.subjectName]
  L4_97 = L1_94[selfcertificatesTable .. "." .. _UPVALUE3_.hashAlgo]
  L5_98 = L1_94[selfcertificatesTable .. "." .. _UPVALUE3_.signatureAlgo]
  L6_99 = L1_94[selfcertificatesTable .. "." .. _UPVALUE3_.signatureKeyLen]
  L7_100 = L1_94[selfcertificatesTable .. "." .. _UPVALUE3_.ipAddress]
  L8_101 = L1_94[selfcertificatesTable .. "." .. _UPVALUE3_.domainName]
  L9_102 = L1_94[selfcertificatesTable .. "." .. _UPVALUE3_.emailAddress]
  L10_103 = L1_94[selfcertificatesTable .. "." .. _UPVALUE3_.certData]
  L11_104 = L1_94[selfcertificatesTable .. "." .. _UPVALUE3_.keyData]
  L12_105 = L1_94[selfcertificatesTable .. "." .. _UPVALUE3_.appType]
  L13_106 = L1_94[selfcertificatesTable .. "." .. _UPVALUE3_.requestStatus]
  return _UPVALUE2_.SUCCESS, L0_93, L2_95, L3_96, L4_97, L5_98, L6_99, L7_100, L8_101, L9_102, L10_103, L11_104, L12_105, L13_106
end
function selfCertificateGetNext(A0_107)
  local L1_108, L2_109, L3_110, L4_111, L5_112, L6_113, L7_114, L8_115, L9_116, L10_117, L11_118, L12_119, L13_120, L14_121
  L1_108 = _UPVALUE0_
  L1_108 = L1_108.NIL
  if A0_107 ~= L1_108 then
    L1_108 = tonumber
    L2_109 = A0_107
    L1_108 = L1_108(L2_109)
    L2_109 = _UPVALUE0_
    L2_109 = L2_109.NIL
  elseif L1_108 == L2_109 then
    L1_108 = _UPVALUE0_
    L1_108 = L1_108.INVALID_ARGUMENT
    return L1_108
  end
  L1_108 = db
  L1_108 = L1_108.existsRow
  L2_109 = selfcertificatesTable
  L3_110 = _UPVALUE1_
  L4_111 = A0_107
  L1_108 = L1_108(L2_109, L3_110, L4_111)
  L2_109 = _UPVALUE0_
  L2_109 = L2_109.FALSE
  if L1_108 == L2_109 then
    L1_108 = _UPVALUE0_
    L1_108 = L1_108.INVALID_ARGUMENT
    return L1_108
  end
  L1_108 = db
  L1_108 = L1_108.getNextRowId
  L2_109 = A0_107
  L3_110 = selfcertificatesTable
  L1_108 = L1_108(L2_109, L3_110)
  L2_109 = _UPVALUE0_
  L2_109 = L2_109.NIL
  if L1_108 == L2_109 then
    L2_109 = _UPVALUE0_
    L2_109 = L2_109.NOT_EXIST
    return L2_109
  end
  L2_109 = db
  L2_109 = L2_109.getRow
  L3_110 = selfcertificatesTable
  L4_111 = _UPVALUE1_
  L5_112 = L1_108
  L2_109 = L2_109(L3_110, L4_111, L5_112)
  L3_110 = _UPVALUE0_
  L3_110 = L3_110.NIL
  if L2_109 == L3_110 then
    L3_110 = _UPVALUE0_
    L3_110 = L3_110.FAILURE
    return L3_110
  end
  L3_110, L4_111, L5_112, L6_113, L7_114, L8_115, L9_116, L10_117, L11_118, L12_119, L13_120, L14_121 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L3_110 = L2_109[selfcertificatesTable .. "." .. _UPVALUE2_.requestName]
  L4_111 = L2_109[selfcertificatesTable .. "." .. _UPVALUE2_.subjectName]
  L5_112 = L2_109[selfcertificatesTable .. "." .. _UPVALUE2_.hashAlgo]
  L6_113 = L2_109[selfcertificatesTable .. "." .. _UPVALUE2_.signatureAlgo]
  L7_114 = L2_109[selfcertificatesTable .. "." .. _UPVALUE2_.signatureKeyLen]
  L8_115 = L2_109[selfcertificatesTable .. "." .. _UPVALUE2_.ipAddress]
  L9_116 = L2_109[selfcertificatesTable .. "." .. _UPVALUE2_.domainName]
  L10_117 = L2_109[selfcertificatesTable .. "." .. _UPVALUE2_.emailAddress]
  L11_118 = L2_109[selfcertificatesTable .. "." .. _UPVALUE2_.certData]
  L12_119 = L2_109[selfcertificatesTable .. "." .. _UPVALUE2_.keyData]
  L13_120 = L2_109[selfcertificatesTable .. "." .. _UPVALUE2_.appType]
  L14_121 = L2_109[selfcertificatesTable .. "." .. _UPVALUE2_.requestStatus]
  return _UPVALUE0_.SUCCESS, L1_108, L3_110, L4_111, L5_112, L6_113, L7_114, L8_115, L9_116, L10_117, L11_118, L12_119, L13_120, L14_121
end
function selfCertificateSet(A0_122, A1_123, A2_124, A3_125, A4_126, A5_127, A6_128, A7_129, A8_130, A9_131, A10_132, A11_133)
  local L12_134
  L12_134 = _UPVALUE0_
  L12_134 = L12_134.NIL
  if A0_122 ~= L12_134 then
    L12_134 = tonumber
    L12_134 = L12_134(A0_122)
  elseif L12_134 == _UPVALUE0_.NIL then
    L12_134 = _UPVALUE0_
    L12_134 = L12_134.INVALID_ARGUMENT
    return L12_134
  end
  L12_134 = db
  L12_134 = L12_134.existsRow
  L12_134 = L12_134(selfcertificatesTable, _UPVALUE1_, A0_122)
  if L12_134 == _UPVALUE0_.FALSE then
    L12_134 = _UPVALUE2_
    L12_134 = L12_134.X509_COOKIE_INVALID
    return L12_134
  end
  L12_134 = {}
  if A1_123 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L12_134[selfcertificatesTable .. "." .. _UPVALUE3_.requestName] = A1_123
  if A2_124 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L12_134[selfcertificatesTable .. "." .. _UPVALUE3_.subjectName] = A2_124
  if A3_125 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A3_125) ~= _UPVALUE4_ and tonumber(A3_125) ~= _UPVALUE5_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L12_134[selfcertificatesTable .. "." .. _UPVALUE3_.hashAlgo] = A3_125
  if A4_126 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A4_126) ~= _UPVALUE6_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L12_134[selfcertificatesTable .. "." .. _UPVALUE3_.signatureAlgo] = A4_126
  if A5_127 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A5_127) ~= _UPVALUE7_ and tonumber(A5_127) ~= _UPVALUE8_ and tonumber(A5_127) ~= _UPVALUE9_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L12_134[selfcertificatesTable .. "." .. _UPVALUE3_.signatureKeyLen] = A5_127
  if A6_128 ~= _UPVALUE0_.NIL then
    valid = _UPVALUE10_.ipAddressCheck("2", A6_128)
    if valid ~= _UPVALUE0_.SUCCESS then
      return _UPVALUE2_.X509_IPADDRESS_INVALID
    end
    L12_134[selfcertificatesTable .. "." .. _UPVALUE3_.ipAddress] = A6_128
  end
  if A7_129 ~= _UPVALUE0_.NIL then
    L12_134[selfcertificatesTable .. "." .. _UPVALUE3_.domainName] = A7_129
  end
  if A8_130 ~= _UPVALUE0_.NIL then
    L12_134[selfcertificatesTable .. "." .. _UPVALUE3_.emailAddress] = A8_130
  end
  if A9_131 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L12_134[selfcertificatesTable .. "." .. _UPVALUE3_.certData] = A9_131
  if A10_132 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L12_134[selfcertificatesTable .. "." .. _UPVALUE3_.keyData] = A10_132
  if A11_133 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A11_133 ~= _UPVALUE11_ and A11_133 ~= _UPVALUE12_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L12_134[selfcertificatesTable .. "." .. _UPVALUE3_.appType] = A11_133
  if db.update(selfcertificatesTable, L12_134, A0_122) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_122
  end
  return _UPVALUE0_.SUCCESS, A0_122
end
function selfCertificateCreate(A0_135, A1_136, A2_137, A3_138, A4_139, A5_140, A6_141, A7_142, A8_143, A9_144, A10_145)
  local L11_146, L12_147, L13_148, L14_149, L15_150, L16_151, L17_152, L18_153, L19_154, L20_155
  L11_146 = db
  L11_146 = L11_146.getTable
  L12_147 = selfcertificatesTable
  L13_148 = false
  L11_146 = L11_146(L12_147, L13_148)
  L12_147 = nil
  L13_148 = UNIT_NAME
  if L13_148 ~= "DSR-1000AC" then
    L13_148 = UNIT_NAME
    if L13_148 ~= "DSR-1000N" then
      L13_148 = UNIT_NAME
    end
  else
    if L13_148 == "DSR-1000" then
      L12_147 = 25
  end
  else
    L13_148 = UNIT_NAME
    if L13_148 ~= "DSR-500AC" then
      L13_148 = UNIT_NAME
      if L13_148 ~= "DSR-500N" then
        L13_148 = UNIT_NAME
      end
    else
      if L13_148 == "DSR-500" then
        L12_147 = 20
    end
    else
      L13_148 = UNIT_NAME
      if L13_148 ~= "DSR-250N" then
        L13_148 = UNIT_NAME
      else
        if L13_148 == "DSR-250" then
          L12_147 = 15
      end
      else
        L12_147 = 10
      end
    end
  end
  if L11_146 ~= nil then
    L13_148 = #L11_146
    L14_149 = L12_147 - 1
    if L13_148 > L14_149 then
      L13_148 = _UPVALUE0_
      L13_148 = L13_148.MAX_LIMIT_REACHED
      return L13_148
    end
  end
  L13_148 = {}
  L14_149 = _UPVALUE0_
  L14_149 = L14_149.NIL
  if A0_135 == L14_149 then
    L14_149 = _UPVALUE0_
    L14_149 = L14_149.INVALID_ARGUMENT
    return L14_149
  end
  L14_149 = selfcertificatesTable
  L15_150 = "."
  L16_151 = _UPVALUE1_
  L16_151 = L16_151.requestName
  L14_149 = L14_149 .. L15_150 .. L16_151
  L13_148[L14_149] = A0_135
  L14_149 = _UPVALUE0_
  L14_149 = L14_149.NIL
  if A1_136 == L14_149 then
    L14_149 = _UPVALUE0_
    L14_149 = L14_149.INVALID_ARGUMENT
    return L14_149
  end
  L14_149 = string
  L14_149 = L14_149.find
  L15_150 = A1_136
  L16_151 = "="
  L15_150 = L14_149(L15_150, L16_151)
  L16_151 = _UPVALUE0_
  L16_151 = L16_151.NIL
  if L14_149 == L16_151 then
    L16_151 = _UPVALUE0_
    L16_151 = L16_151.NIL
    if L15_150 == L16_151 then
      L16_151 = "CN="
      L17_152 = A1_136
      A1_136 = L16_151 .. L17_152
    end
  end
  L16_151 = selfcertificatesTable
  L17_152 = "."
  L18_153 = _UPVALUE1_
  L18_153 = L18_153.subjectName
  L16_151 = L16_151 .. L17_152 .. L18_153
  L13_148[L16_151] = A1_136
  L16_151 = _UPVALUE0_
  L16_151 = L16_151.NIL
  if A2_137 == L16_151 then
    L16_151 = _UPVALUE0_
    L16_151 = L16_151.INVALID_ARGUMENT
    return L16_151
  end
  L16_151 = tonumber
  L17_152 = A2_137
  L16_151 = L16_151(L17_152)
  L17_152 = _UPVALUE2_
  if L16_151 ~= L17_152 then
    L17_152 = _UPVALUE3_
    if L16_151 ~= L17_152 then
      L17_152 = _UPVALUE0_
      L17_152 = L17_152.INVALID_ARGUMENT
      return L17_152
    end
  end
  L17_152 = selfcertificatesTable
  L18_153 = "."
  L19_154 = _UPVALUE1_
  L19_154 = L19_154.hashAlgo
  L17_152 = L17_152 .. L18_153 .. L19_154
  L13_148[L17_152] = A2_137
  L17_152 = _UPVALUE0_
  L17_152 = L17_152.NIL
  if A3_138 == L17_152 then
    L17_152 = _UPVALUE0_
    L17_152 = L17_152.INVALID_ARGUMENT
    return L17_152
  end
  L17_152 = tonumber
  L18_153 = A3_138
  L17_152 = L17_152(L18_153)
  L18_153 = _UPVALUE4_
  if L17_152 ~= L18_153 then
    L18_153 = _UPVALUE0_
    L18_153 = L18_153.INVALID_ARGUMENT
    return L18_153
  end
  L18_153 = selfcertificatesTable
  L19_154 = "."
  L20_155 = _UPVALUE1_
  L20_155 = L20_155.signatureAlgo
  L18_153 = L18_153 .. L19_154 .. L20_155
  L13_148[L18_153] = A3_138
  L18_153 = _UPVALUE0_
  L18_153 = L18_153.NIL
  if A4_139 == L18_153 then
    L18_153 = _UPVALUE0_
    L18_153 = L18_153.INVALID_ARGUMENT
    return L18_153
  end
  L18_153 = tonumber
  L19_154 = A4_139
  L18_153 = L18_153(L19_154)
  L19_154 = _UPVALUE5_
  if L18_153 ~= L19_154 then
    L19_154 = _UPVALUE6_
    if L18_153 ~= L19_154 then
      L19_154 = _UPVALUE7_
      if L18_153 ~= L19_154 then
        L19_154 = _UPVALUE0_
        L19_154 = L19_154.INVALID_ARGUMENT
        return L19_154
      end
    end
  end
  L19_154 = selfcertificatesTable
  L20_155 = "."
  L19_154 = L19_154 .. L20_155 .. _UPVALUE1_.signatureKeyLen
  L13_148[L19_154] = A4_139
  L19_154 = _UPVALUE0_
  L19_154 = L19_154.NIL
  if A5_140 == L19_154 then
    L19_154 = _UPVALUE0_
    L19_154 = L19_154.EMPTY
  else
    if A5_140 ~= L19_154 then
      L19_154 = selfcertificatesTable
      L20_155 = "."
      L19_154 = L19_154 .. L20_155 .. _UPVALUE1_.ipAddress
      L13_148[L19_154] = A5_140
  end
  else
    L19_154 = _UPVALUE8_
    L19_154 = L19_154.ipAddressCheck
    L20_155 = "2"
    L19_154 = L19_154(L20_155, A5_140)
    valid = L19_154
    L19_154 = valid
    L20_155 = _UPVALUE0_
    L20_155 = L20_155.SUCCESS
    if L19_154 ~= L20_155 then
      L19_154 = _UPVALUE9_
      L19_154 = L19_154.X509_IPADDRESS_INVALID
      return L19_154
    end
    L19_154 = selfcertificatesTable
    L20_155 = "."
    L19_154 = L19_154 .. L20_155 .. _UPVALUE1_.ipAddress
    L13_148[L19_154] = A5_140
  end
  L19_154 = _UPVALUE0_
  L19_154 = L19_154.NIL
  if A6_141 ~= L19_154 then
    L19_154 = selfcertificatesTable
    L20_155 = "."
    L19_154 = L19_154 .. L20_155 .. _UPVALUE1_.domainName
    L13_148[L19_154] = A6_141
  end
  L19_154 = _UPVALUE0_
  L19_154 = L19_154.NIL
  if A7_142 ~= L19_154 then
    L19_154 = selfcertificatesTable
    L20_155 = "."
    L19_154 = L19_154 .. L20_155 .. _UPVALUE1_.emailAddress
    L13_148[L19_154] = A7_142
  end
  L19_154 = _UPVALUE0_
  L19_154 = L19_154.NIL
  if A8_143 == L19_154 then
    L19_154 = _UPVALUE0_
    L19_154 = L19_154.INVALID_ARGUMENT
    return L19_154
  end
  L19_154 = _UPVALUE10_
  if A8_143 ~= L19_154 then
    L19_154 = _UPVALUE11_
    if A8_143 ~= L19_154 then
      L19_154 = _UPVALUE0_
      L19_154 = L19_154.INVALID_ARGUMENT
      return L19_154
    end
  end
  L19_154 = selfcertificatesTable
  L20_155 = "."
  L19_154 = L19_154 .. L20_155 .. _UPVALUE1_.appType
  L13_148[L19_154] = A8_143
  L19_154 = selfcertificatesTable
  L20_155 = "."
  L19_154 = L19_154 .. L20_155 .. _UPVALUE1_.dbUpdateFlag
  L13_148[L19_154] = A9_144
  L19_154 = selfcertificatesTable
  L20_155 = "."
  L19_154 = L19_154 .. L20_155 .. _UPVALUE1_.requestStatus
  L13_148[L19_154] = A10_145
  L19_154 = nil
  L20_155 = db
  L20_155 = L20_155.existsRow
  L20_155 = L20_155(selfcertificatesTable, _UPVALUE1_.subjectName, A1_136)
  if L20_155 then
    L20_155 = _UPVALUE9_
    L20_155 = L20_155.X509_SELF_CERT_ALREADY_EXIST
    return L20_155
  end
  L20_155 = db
  L20_155 = L20_155.existsRow
  L20_155 = L20_155(selfcertificatesTable, _UPVALUE1_.requestName, A0_135)
  if L20_155 then
    L20_155 = _UPVALUE9_
    L20_155 = L20_155.X509_SELF_CERT_REQ_ALREADY_EXIST
    return L20_155
  end
  L20_155 = db
  L20_155 = L20_155.insert
  L20_155 = L20_155(selfcertificatesTable, L13_148)
  L19_154 = L20_155
  L20_155 = _UPVALUE0_
  L20_155 = L20_155.NIL
  if L19_154 == L20_155 then
    L20_155 = _UPVALUE0_
    L20_155 = L20_155.FAILURE
    return L20_155, rowId
  end
  L20_155 = db
  L20_155 = L20_155.getAttributeWhere
  L20_155 = L20_155(selfcertificatesTable, _UPVALUE1_.requestName .. " ='" .. A0_135 .. "' AND " .. _UPVALUE1_.subjectName .. " ='" .. A1_136 .. "'", _UPVALUE12_)
  return _UPVALUE0_.SUCCESS, L20_155
end
function selfCertificateDelete(A0_156)
  if A0_156 == _UPVALUE0_.NIL or tonumber(A0_156) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(selfcertificatesTable, _UPVALUE1_, A0_156) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(selfcertificatesTable, "x509SelfCertReq._ROWID_", A0_156, "requestStatus") == "0" then
    if db.deleteRow(selfcertificatesTable, _UPVALUE1_, A0_156) == _UPVALUE0_.NIL then
      return _UPVALUE0_.FAILURE, A0_156
    end
    return _UPVALUE0_.SUCCESS, A0_156
  else
    return _UPVALUE2_.X509_CANNOT_DEL_USED_SELF_CERT_REQ
  end
end
function selfCertificateGetAll()
  local L0_157
  L0_157 = db
  L0_157 = L0_157.getTable
  L0_157 = L0_157(selfcertificatesTable, false)
  if L0_157 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_157
end
function selfCertificateDeleteAll()
  local L0_158
  L0_158 = db
  L0_158 = L0_158.getTable
  L0_158 = L0_158(selfcertificatesTable, false)
  for _FORV_4_, _FORV_5_ in pairs(L0_158) do
    if selfCertificateDelete(L0_158[_FORV_4_]._ROWID_) == _UPVALUE0_.NIL then
      return _UPVALUE0_.FAILURE
    end
  end
  return _UPVALUE0_.SUCCESS
end
function uploadSelfCert(A0_159, A1_160)
  local L2_161, L3_162, L4_163, L5_164, L6_165, L7_166, L8_167, L9_168, L10_169, L11_170, L12_171, L13_172, L14_173, L15_174, L16_175
  L2_161 = false
  L3_162 = util
  L3_162 = L3_162.appendDebugOut
  L4_163 = util
  L4_163 = L4_163.tableToStringRec
  L5_164 = A0_159
  L16_175 = L4_163(L5_164)
  L3_162(L4_163, L5_164, L6_165, L7_166, L8_167, L9_168, L10_169, L11_170, L12_171, L13_172, L14_173, L15_174, L16_175, L4_163(L5_164))
  L3_162 = A0_159["file.upload"]
  L3_162 = L3_162.filesize
  L4_163 = A0_159["file.upload"]
  L4_163 = L4_163.file
  L5_164 = os
  L5_164 = L5_164.execute
  L6_165 = "mv"
  L7_166 = " "
  L8_167 = "/tmp/"
  L9_168 = A1_160
  L10_169 = " /tmp/"
  L11_170 = "temp.crt"
  L6_165 = L6_165 .. L7_166 .. L8_167 .. L9_168 .. L10_169 .. L11_170
  L5_164 = L5_164(L6_165)
  L6_165 = {}
  L7_166 = nil
  L8_167 = util
  L8_167 = L8_167.fileToString
  L9_168 = "/tmp/temp.crt"
  L8_167 = L8_167(L9_168)
  L7_166 = L8_167
  L8_167 = x509Lib
  L8_167 = L8_167.certLoad
  L9_168 = L7_166
  L10_169 = "self"
  L14_173 = L8_167(L9_168, L10_169)
  L15_174 = os
  L15_174 = L15_174.execute
  L16_175 = "rm"
  L16_175 = L16_175 .. " /tmp/" .. "temp.crt"
  L15_174 = L15_174(L16_175)
  if L8_167 == -1 then
    L16_175 = _UPVALUE0_
    L16_175 = L16_175.X509_INVALID_SELF
    return L16_175
  elseif L8_167 == 27 then
    L16_175 = _UPVALUE0_
    L16_175 = L16_175.X509_INVALID_SELF_CA
    return L16_175
  elseif L8_167 == 26 then
    L16_175 = _UPVALUE0_
    L16_175 = L16_175.X509_INVALID_SELF_PURPOSE
    return L16_175
  end
  L6_165["cert.name"] = L9_168
  L6_165["cert.subjectName"] = L10_169
  L6_165["cert.issuerName"] = L11_170
  L6_165["cert.expiryTime"] = L12_171
  L6_165["cert.serialNumber"] = L13_172
  L6_165["cert.format"] = L14_173
  L6_165["cert.certType"] = "self"
  L6_165["cert.certData"] = L7_166
  L16_175 = "certType = 'self'"
  if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-1000N" or UNIT_NAME == "DSR-1000" then
  elseif UNIT_NAME == "DSR-500AC" or UNIT_NAME == "DSR-500N" or UNIT_NAME == "DSR-500" then
  elseif UNIT_NAME == "DSR-250N" or UNIT_NAME == "DSR-250" then
  else
  end
  if db.getRowsWhere("cert", L16_175) ~= nil and #db.getRowsWhere("cert", L16_175) > 10 - 1 then
    return _UPVALUE1_.MAX_LIMIT_REACHED
  end
  L15_174 = db.insert("cert", L6_165)
  if L15_174 then
    return _UPVALUE1_.SUCCESS
  else
    return _UPVALUE1_.FAILURE
  end
end
function activeSelfCertDelete(A0_176)
  local L1_177, L2_178, L3_179, L4_180
  L1_177 = 0
  L2_178 = A0_176["activeSelfCertificates.cookie"]
  L3_179 = {}
  L4_180 = db
  L4_180 = L4_180.getAttribute
  L4_180 = L4_180("cert", "cert._ROWID_", L2_178, "subjectName")
  if db.getAttribute("x509SelfCertReq", "subjectName", L4_180, "requestStatus") == "2" and db.getAttribute(selfcertificatesTable, _UPVALUE0_.subjectName, L4_180, _UPVALUE0_.appType) == "https" then
    L1_177 = 1
  end
  db.setAttribute("x509SelfCertReq", "subjectName", L4_180, "requestStatus", 0)
  selfCertReqRow = db.getRow("x509SelfCertReq", "subjectName", L4_180)
  if selfCertReqRow == _UPVALUE1_.NIL then
  end
  L3_179["cert._ROWID_"] = L2_178
  valid = db.delete("cert", L3_179)
  if valid then
    if selfCertReqRow["x509SelfCertReq.appType"] == "https" and db.getAttribute("x509SelfCertReq", "subjectName", L4_180, "requestStatus") == "2" then
      os.execute("rm -f /var/sslvpn/var/cert/server.crt")
      os.execute("rm -f /var/sslvpn/var/cert/server.key")
      os.execute("ln -s /var/certs/self/default/https.crt /var/sslvpn/var/cert/server.crt")
      os.execute("ln -s /var/certs/self/default/https.key /var/sslvpn/var/cert/server.key")
    end
    if db.getAttribute("x509SelfCertReq", "subjectName", L4_180, "requestStatus") == "2" then
      os.execute("rm -f" .. " /var/certs/self/" .. selfCertReqRow["x509SelfCertReq.appType"] .. ".crt")
      os.execute("rm -f" .. " /var/certs/self/" .. selfCertReqRow["x509SelfCertReq.appType"] .. ".key")
      os.execute("ln -s" .. " /var/cert/self/default/https.crt /var/certs/self/" .. selfCertReqRow["x509SelfCertReq.appType"] .. ".crt")
      os.execute("ln -s" .. " /var/cert/self/default/https.key /var/certs/self/" .. selfCertReqRow["x509SelfCertReq.appType"] .. ".key")
    end
    os.execute("rm -f" .. " /var/certs/self/" .. selfCertReqRow["x509SelfCertReq.appType"] .. L2_178 .. ".crt")
    os.execute("rm -f" .. " /var/certs/self/" .. selfCertReqRow["x509SelfCertReq.appType"] .. L2_178 .. ".key")
    if selfCertReqRow["x509SelfCertReq.appType"] == "https" and db.getAttribute("x509SelfCertReq", "subjectName", L4_180, "requestStatus") == "2" then
      httpsMgmtRow = db.getRow("httpsMgmt", "_ROWID_", "1")
      if httpsMgmtRow then
        if httpsMgmtRow["httpsMgmt.certEvent"] ~= "0" then
          httpsMgmtRow["httpsMgmt.certEvent"] = "0"
        elseif httpsMgmtRow["httpsMgmt.certEvent"] == "0" then
          httpsMgmtRow["httpsMgmt.certEvent"] = "1"
        end
        valid = db.update("httpsMgmt", httpsMgmtRow, "1")
      end
    end
    return _UPVALUE1_.SUCCESS, L1_177
  else
    return _UPVALUE1_.FAILURE
  end
end
function activeSelfCertDeleteAll()
  local L0_181, L1_182, L2_183, L3_184, L4_185, L5_186, L6_187, L7_188, L8_189
  L0_181 = "SELECT *, _ROWID_ AS _ROWID_ FROM cert where certType='self'"
  L1_182 = db
  L1_182 = L1_182.getTable
  L1_182 = L1_182(L2_183, L3_184, L4_185)
  for L5_186, L6_187 in L2_183(L3_184) do
    L7_188 = L1_182[L5_186]
    L7_188 = L7_188._ROWID_
    L8_189 = {}
    L8_189["activeSelfCertificates.cookie"] = L7_188
    if activeSelfCertDelete(L8_189) ~= _UPVALUE0_.SUCCESS then
      return _UPVALUE0_.FAILURE
    end
  end
  return L2_183
end
function certDetailsGet(A0_190)
  local L1_191, L2_192, L3_193, L4_194, L5_195, L6_196
  L1_191 = _UPVALUE0_
  L1_191 = L1_191.NIL
  if A0_190 ~= L1_191 then
    L1_191 = tonumber
    L2_192 = A0_190
    L1_191 = L1_191(L2_192)
    L2_192 = _UPVALUE0_
    L2_192 = L2_192.NIL
  elseif L1_191 == L2_192 then
    L1_191 = _UPVALUE0_
    L1_191 = L1_191.INVALID_ARGUMENT
    return L1_191
  end
  L1_191 = db
  L1_191 = L1_191.getRow
  L2_192 = selfcertificatesTable
  L3_193 = _UPVALUE1_
  L4_194 = A0_190
  L1_191 = L1_191(L2_192, L3_193, L4_194)
  L2_192 = _UPVALUE0_
  L2_192 = L2_192.NIL
  if L1_191 == L2_192 then
    L2_192 = _UPVALUE0_
    L2_192 = L2_192.FAILURE
    return L2_192
  end
  L2_192, L3_193, L4_194, L5_195, L6_196 = nil, nil, nil, nil, nil
  L2_192 = L1_191[selfcertificatesTable .. "." .. _UPVALUE2_.subjectName]
  L3_193 = L1_191[selfcertificatesTable .. "." .. _UPVALUE2_.hashAlgo]
  L4_194 = L1_191[selfcertificatesTable .. "." .. _UPVALUE2_.signatureAlgo]
  L5_195 = L1_191[selfcertificatesTable .. "." .. _UPVALUE2_.signatureKeyLen]
  L6_196 = L1_191[selfcertificatesTable .. "." .. _UPVALUE2_.certData]
  return _UPVALUE0_.SUCCESS, A0_190, L2_192, L3_193, L4_194, L5_195, L6_196
end
function activeSelfCertDefault(A0_197)
  local L1_198, L2_199, L3_200, L4_201, L5_202, L6_203, L7_204
  L1_198 = A0_197["activeSelfCertificates.cookie"]
  L2_199 = db
  L2_199 = L2_199.getAttribute
  L3_200 = "cert"
  L4_201 = "cert._ROWID_"
  L5_202 = L1_198
  L6_203 = _UPVALUE0_
  L6_203 = L6_203.subjectName
  L2_199 = L2_199(L3_200, L4_201, L5_202, L6_203)
  L3_200 = 0
  L4_201 = db
  L4_201 = L4_201.getAttribute
  L5_202 = selfcertificatesTable
  L6_203 = _UPVALUE0_
  L6_203 = L6_203.subjectName
  L7_204 = L2_199
  L4_201 = L4_201(L5_202, L6_203, L7_204, _UPVALUE0_.requestStatus)
  L5_202 = db
  L5_202 = L5_202.getAttribute
  L6_203 = selfcertificatesTable
  L7_204 = _UPVALUE0_
  L7_204 = L7_204.subjectName
  L5_202 = L5_202(L6_203, L7_204, L2_199, _UPVALUE0_.appType)
  if L4_201 == "1" and L5_202 == "https" then
    L3_200 = 1
  end
  L6_203 = "requestStatus = 2"
  L7_204 = " AND appType = '"
  L6_203 = L6_203 .. L7_204 .. L5_202 .. "'"
  L7_204 = db
  L7_204 = L7_204.getRowsWhere
  L7_204 = L7_204(selfcertificatesTable, L6_203)
  if L7_204 then
    for _FORV_11_, _FORV_12_ in pairs(L7_204) do
      db.setAttribute(selfcertificatesTable, _UPVALUE0_.subjectName, _FORV_12_[selfcertificatesTable .. "." .. _UPVALUE0_.subjectName], _UPVALUE0_.requestStatus, 1)
    end
  end
  db.setAttribute(selfcertificatesTable, _UPVALUE0_.subjectName, L2_199, _UPVALUE0_.requestStatus, 0)
  selfCertReqRow = db.getRow(selfcertificatesTable, _UPVALUE0_.subjectName, L2_199)
  if selfCertReqRow == _UPVALUE1_.NIL then
  end
  if db.setAttribute(selfcertificatesTable, _UPVALUE0_.subjectName, L2_199, _UPVALUE0_.requestStatus, 2) ~= _UPVALUE1_.FALSE then
    if L5_202 == "https" then
      os.execute("rm -f /var/sslvpn/var/cert/server.crt")
      os.execute("rm -f /var/sslvpn/var/cert/server.key")
    end
    os.execute("rm -f /var/certs/self/" .. L5_202 .. ".crt")
    os.execute("rm -f /var/certs/self/" .. L5_202 .. ".key")
    os.execute("cp " .. "/var/certs/self/" .. L5_202 .. L1_198 .. ".crt " .. "/var/certs/self/" .. L5_202 .. ".crt")
    os.execute("cp " .. "/var/certs/self/" .. L5_202 .. L1_198 .. ".key " .. "/var/certs/self/" .. L5_202 .. ".key")
    if L5_202 == "https" then
      os.execute("ln -s /var/certs/self/https.crt /var/sslvpn/var/cert/server.crt")
      os.execute("ln -s /var/certs/self/https.key /var/sslvpn/var/cert/server.key")
      httpsMgmtRow = db.getRow("httpsMgmt", "_ROWID_", "1")
      if httpsMgmtRow then
        if httpsMgmtRow["httpsMgmt.certEvent"] ~= "0" then
          httpsMgmtRow["httpsMgmt.certEvent"] = "0"
        elseif httpsMgmtRow["httpsMgmt.certEvent"] == "0" then
          httpsMgmtRow["httpsMgmt.certEvent"] = "1"
        end
        valid1 = db.update("httpsMgmt", httpsMgmtRow, "1")
      end
    end
    return _UPVALUE1_.SUCCESS, L3_200
  else
    return _UPVALUE1_.FAILURE
  end
end
