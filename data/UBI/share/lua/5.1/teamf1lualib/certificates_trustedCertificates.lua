local L0_0
L0_0 = module
L0_0("com.teamf1.core.certificates.trustedcertificates", package.seeall)
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
L0_0("x509Lib")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
trustedcertificatesTable = "cert"
;({}).subjectName = "subjectName"
;({}).certificateName = "name"
;({}).issuerName = "issuerName"
;({}).expiryTime = "expiryTime"
;({}).serialNumber = "serialNumber"
;({}).format = "format"
;({}).certType = "certType"
;({}).certData = "certData"
function subjectNameGet()
  local L0_1, L1_2
  L0_1 = db
  L0_1 = L0_1.getNextRowId
  L1_2 = _UPVALUE0_
  L0_1 = L0_1(L1_2, trustedcertificatesTable)
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(trustedcertificatesTable, _UPVALUE1_, L0_1, _UPVALUE2_.subjectName)
  if L1_2 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_1, L1_2
end
function subjectNameGetNext(A0_3)
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
  L2_5 = trustedcertificatesTable
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
  L1_4 = L1_4(L2_5, trustedcertificatesTable)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if L1_4 == L2_5 then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.NOT_EXIST
    return L2_5
  end
  L2_5 = db
  L2_5 = L2_5.getAttribute
  L2_5 = L2_5(trustedcertificatesTable, _UPVALUE1_, L1_4, _UPVALUE2_.subjectName)
  if L2_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L2_5
end
function subjectNameSet(A0_6, A1_7)
  local L3_8
  L3_8 = _UPVALUE0_
  L3_8 = L3_8.NOT_SUPPORTED
  return L3_8, A0_6
end
function subjectNameDelete(A0_9, A1_10)
  local L3_11
  L3_11 = _UPVALUE0_
  L3_11 = L3_11.NOT_SUPPORTED
  return L3_11, A0_9
end
function certificateNameGet()
  local L0_12, L1_13
  L0_12 = db
  L0_12 = L0_12.getNextRowId
  L1_13 = _UPVALUE0_
  L0_12 = L0_12(L1_13, trustedcertificatesTable)
  L1_13 = db
  L1_13 = L1_13.getAttribute
  L1_13 = L1_13(trustedcertificatesTable, _UPVALUE1_, L0_12, _UPVALUE2_.certificateName)
  if L1_13 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_12, L1_13
end
function certificateNameGetNext(A0_14)
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
  L1_15 = L1_15.existsRow
  L2_16 = trustedcertificatesTable
  L1_15 = L1_15(L2_16, _UPVALUE1_, A0_14)
  L2_16 = _UPVALUE0_
  L2_16 = L2_16.FALSE
  if L1_15 == L2_16 then
    L1_15 = _UPVALUE0_
    L1_15 = L1_15.INVALID_ARGUMENT
    return L1_15
  end
  L1_15 = db
  L1_15 = L1_15.getNextRowId
  L2_16 = A0_14
  L1_15 = L1_15(L2_16, trustedcertificatesTable)
  L2_16 = _UPVALUE0_
  L2_16 = L2_16.NIL
  if L1_15 == L2_16 then
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.NOT_EXIST
    return L2_16
  end
  L2_16 = db
  L2_16 = L2_16.getAttribute
  L2_16 = L2_16(trustedcertificatesTable, _UPVALUE1_, L1_15, _UPVALUE2_.certificateName)
  if L2_16 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_15
  end
  return _UPVALUE0_.SUCCESS, L1_15, L2_16
end
function certificateNameSet(A0_17, A1_18)
  local L3_19
  L3_19 = _UPVALUE0_
  L3_19 = L3_19.NOT_SUPPORTED
  return L3_19, A0_17
end
function issuerNameGet()
  local L0_20, L1_21
  L0_20 = db
  L0_20 = L0_20.getNextRowId
  L1_21 = _UPVALUE0_
  L0_20 = L0_20(L1_21, trustedcertificatesTable)
  L1_21 = db
  L1_21 = L1_21.getAttribute
  L1_21 = L1_21(trustedcertificatesTable, _UPVALUE1_, L0_20, _UPVALUE2_.issuerName)
  if L1_21 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_20, L1_21
end
function issuerNameGetNext(A0_22)
  local L1_23, L2_24
  L1_23 = _UPVALUE0_
  L1_23 = L1_23.NIL
  if A0_22 ~= L1_23 then
    L1_23 = tonumber
    L2_24 = A0_22
    L1_23 = L1_23(L2_24)
    L2_24 = _UPVALUE0_
    L2_24 = L2_24.NIL
  elseif L1_23 == L2_24 then
    L1_23 = _UPVALUE0_
    L1_23 = L1_23.INVALID_ARGUMENT
    return L1_23
  end
  L1_23 = db
  L1_23 = L1_23.existsRow
  L2_24 = trustedcertificatesTable
  L1_23 = L1_23(L2_24, _UPVALUE1_, A0_22)
  L2_24 = _UPVALUE0_
  L2_24 = L2_24.FALSE
  if L1_23 == L2_24 then
    L1_23 = _UPVALUE0_
    L1_23 = L1_23.INVALID_ARGUMENT
    return L1_23
  end
  L1_23 = db
  L1_23 = L1_23.getNextRowId
  L2_24 = A0_22
  L1_23 = L1_23(L2_24, trustedcertificatesTable)
  L2_24 = _UPVALUE0_
  L2_24 = L2_24.NIL
  if L1_23 == L2_24 then
    L2_24 = _UPVALUE0_
    L2_24 = L2_24.NOT_EXIST
    return L2_24
  end
  L2_24 = db
  L2_24 = L2_24.getAttribute
  L2_24 = L2_24(trustedcertificatesTable, _UPVALUE1_, L1_23, _UPVALUE2_.issuerName)
  if L2_24 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_23
  end
  return _UPVALUE0_.SUCCESS, L1_23, L2_24
end
function issuerNameSet(A0_25, A1_26)
  local L3_27
  L3_27 = _UPVALUE0_
  L3_27 = L3_27.NOT_SUPPORTED
  return L3_27, A0_25
end
function expiryTimeGet()
  local L0_28, L1_29
  L0_28 = db
  L0_28 = L0_28.getNextRowId
  L1_29 = _UPVALUE0_
  L0_28 = L0_28(L1_29, trustedcertificatesTable)
  L1_29 = db
  L1_29 = L1_29.getAttribute
  L1_29 = L1_29(trustedcertificatesTable, _UPVALUE1_, L0_28, _UPVALUE2_.expiryTime)
  if L1_29 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_28, L1_29
end
function expiryTimeGetNext(A0_30)
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
  L2_32 = trustedcertificatesTable
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
  L1_31 = L1_31(L2_32, trustedcertificatesTable)
  L2_32 = _UPVALUE0_
  L2_32 = L2_32.NIL
  if L1_31 == L2_32 then
    L2_32 = _UPVALUE0_
    L2_32 = L2_32.NOT_EXIST
    return L2_32
  end
  L2_32 = db
  L2_32 = L2_32.getAttribute
  L2_32 = L2_32(trustedcertificatesTable, _UPVALUE1_, L1_31, _UPVALUE2_.expiryTime)
  if L2_32 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_31
  end
  return _UPVALUE0_.SUCCESS, L1_31, L2_32
end
function expiryTimeSet(A0_33, A1_34)
  local L3_35
  L3_35 = _UPVALUE0_
  L3_35 = L3_35.NOT_SUPPORTED
  return L3_35, A0_33
end
function serialNumberGet()
  local L0_36, L1_37
  L0_36 = db
  L0_36 = L0_36.getNextRowId
  L1_37 = _UPVALUE0_
  L0_36 = L0_36(L1_37, trustedcertificatesTable)
  L1_37 = db
  L1_37 = L1_37.getAttribute
  L1_37 = L1_37(trustedcertificatesTable, _UPVALUE1_, L0_36, _UPVALUE2_.serialNumber)
  if L1_37 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_36, L1_37
end
function serialNumberGetNext(A0_38)
  local L1_39, L2_40
  L1_39 = _UPVALUE0_
  L1_39 = L1_39.NIL
  if A0_38 ~= L1_39 then
    L1_39 = tonumber
    L2_40 = A0_38
    L1_39 = L1_39(L2_40)
    L2_40 = _UPVALUE0_
    L2_40 = L2_40.NIL
  elseif L1_39 == L2_40 then
    L1_39 = _UPVALUE0_
    L1_39 = L1_39.INVALID_ARGUMENT
    return L1_39
  end
  L1_39 = db
  L1_39 = L1_39.existsRow
  L2_40 = trustedcertificatesTable
  L1_39 = L1_39(L2_40, _UPVALUE1_, A0_38)
  L2_40 = _UPVALUE0_
  L2_40 = L2_40.FALSE
  if L1_39 == L2_40 then
    L1_39 = _UPVALUE0_
    L1_39 = L1_39.INVALID_ARGUMENT
    return L1_39
  end
  L1_39 = db
  L1_39 = L1_39.getNextRowId
  L2_40 = A0_38
  L1_39 = L1_39(L2_40, trustedcertificatesTable)
  L2_40 = _UPVALUE0_
  L2_40 = L2_40.NIL
  if L1_39 == L2_40 then
    L2_40 = _UPVALUE0_
    L2_40 = L2_40.NOT_EXIST
    return L2_40
  end
  L2_40 = db
  L2_40 = L2_40.getAttribute
  L2_40 = L2_40(trustedcertificatesTable, _UPVALUE1_, L1_39, _UPVALUE2_.serialNumber)
  if L2_40 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_39
  end
  return _UPVALUE0_.SUCCESS, L1_39, L2_40
end
function serialNumberSet(A0_41, A1_42)
  local L3_43
  L3_43 = _UPVALUE0_
  L3_43 = L3_43.NOT_SUPPORTED
  return L3_43, A0_41
end
function formatGet()
  local L0_44, L1_45
  L0_44 = db
  L0_44 = L0_44.getNextRowId
  L1_45 = _UPVALUE0_
  L0_44 = L0_44(L1_45, trustedcertificatesTable)
  L1_45 = db
  L1_45 = L1_45.getAttribute
  L1_45 = L1_45(trustedcertificatesTable, _UPVALUE1_, L0_44, _UPVALUE2_.format)
  if L1_45 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_44, L1_45
end
function formatGetNext(A0_46)
  local L1_47, L2_48
  L1_47 = _UPVALUE0_
  L1_47 = L1_47.NIL
  if A0_46 ~= L1_47 then
    L1_47 = tonumber
    L2_48 = A0_46
    L1_47 = L1_47(L2_48)
    L2_48 = _UPVALUE0_
    L2_48 = L2_48.NIL
  elseif L1_47 == L2_48 then
    L1_47 = _UPVALUE0_
    L1_47 = L1_47.INVALID_ARGUMENT
    return L1_47
  end
  L1_47 = db
  L1_47 = L1_47.existsRow
  L2_48 = trustedcertificatesTable
  L1_47 = L1_47(L2_48, _UPVALUE1_, A0_46)
  L2_48 = _UPVALUE0_
  L2_48 = L2_48.FALSE
  if L1_47 == L2_48 then
    L1_47 = _UPVALUE0_
    L1_47 = L1_47.INVALID_ARGUMENT
    return L1_47
  end
  L1_47 = db
  L1_47 = L1_47.getNextRowId
  L2_48 = A0_46
  L1_47 = L1_47(L2_48, trustedcertificatesTable)
  L2_48 = _UPVALUE0_
  L2_48 = L2_48.NIL
  if L1_47 == L2_48 then
    L2_48 = _UPVALUE0_
    L2_48 = L2_48.NOT_EXIST
    return L2_48
  end
  L2_48 = db
  L2_48 = L2_48.getAttribute
  L2_48 = L2_48(trustedcertificatesTable, _UPVALUE1_, L1_47, _UPVALUE2_.format)
  if L2_48 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_47
  end
  return _UPVALUE0_.SUCCESS, L1_47, L2_48
end
function formatSet(A0_49, A1_50)
  local L3_51
  L3_51 = _UPVALUE0_
  L3_51 = L3_51.NOT_SUPPORTED
  return L3_51, A0_49
end
function certTypeGet()
  local L0_52, L1_53
  L0_52 = db
  L0_52 = L0_52.getNextRowId
  L1_53 = _UPVALUE0_
  L0_52 = L0_52(L1_53, trustedcertificatesTable)
  L1_53 = db
  L1_53 = L1_53.getAttribute
  L1_53 = L1_53(trustedcertificatesTable, _UPVALUE1_, L0_52, _UPVALUE2_.certType)
  if L1_53 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_52, L1_53
end
function certTypeGetNext(A0_54)
  local L1_55, L2_56
  L1_55 = _UPVALUE0_
  L1_55 = L1_55.NIL
  if A0_54 ~= L1_55 then
    L1_55 = tonumber
    L2_56 = A0_54
    L1_55 = L1_55(L2_56)
    L2_56 = _UPVALUE0_
    L2_56 = L2_56.NIL
  elseif L1_55 == L2_56 then
    L1_55 = _UPVALUE0_
    L1_55 = L1_55.INVALID_ARGUMENT
    return L1_55
  end
  L1_55 = db
  L1_55 = L1_55.existsRow
  L2_56 = trustedcertificatesTable
  L1_55 = L1_55(L2_56, _UPVALUE1_, A0_54)
  L2_56 = _UPVALUE0_
  L2_56 = L2_56.FALSE
  if L1_55 == L2_56 then
    L1_55 = _UPVALUE0_
    L1_55 = L1_55.INVALID_ARGUMENT
    return L1_55
  end
  L1_55 = db
  L1_55 = L1_55.getNextRowId
  L2_56 = A0_54
  L1_55 = L1_55(L2_56, trustedcertificatesTable)
  L2_56 = _UPVALUE0_
  L2_56 = L2_56.NIL
  if L1_55 == L2_56 then
    L2_56 = _UPVALUE0_
    L2_56 = L2_56.NOT_EXIST
    return L2_56
  end
  L2_56 = db
  L2_56 = L2_56.getAttribute
  L2_56 = L2_56(trustedcertificatesTable, _UPVALUE1_, L1_55, _UPVALUE2_.certType)
  if L2_56 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_55
  end
  return _UPVALUE0_.SUCCESS, L1_55, L2_56
end
function certTypeSet(A0_57, A1_58)
  local L3_59
  L3_59 = _UPVALUE0_
  L3_59 = L3_59.NOT_SUPPORTED
  return L3_59, A0_57
end
function certDataGet()
  local L0_60, L1_61
  L0_60 = db
  L0_60 = L0_60.getNextRowId
  L1_61 = _UPVALUE0_
  L0_60 = L0_60(L1_61, trustedcertificatesTable)
  L1_61 = db
  L1_61 = L1_61.getAttribute
  L1_61 = L1_61(trustedcertificatesTable, _UPVALUE1_, L0_60, _UPVALUE2_.certData)
  if L1_61 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_60, L1_61
end
function certDataGetNext(A0_62)
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
  L2_64 = trustedcertificatesTable
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
  L1_63 = L1_63(L2_64, trustedcertificatesTable)
  L2_64 = _UPVALUE0_
  L2_64 = L2_64.NIL
  if L1_63 == L2_64 then
    L2_64 = _UPVALUE0_
    L2_64 = L2_64.NOT_EXIST
    return L2_64
  end
  L2_64 = db
  L2_64 = L2_64.getAttribute
  L2_64 = L2_64(trustedcertificatesTable, _UPVALUE1_, L1_63, _UPVALUE2_.certData)
  if L2_64 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_63
  end
  return _UPVALUE0_.SUCCESS, L1_63, L2_64
end
function certDataSet(A0_65, A1_66)
  local L3_67
  L3_67 = _UPVALUE0_
  L3_67 = L3_67.NOT_SUPPORTED
  return L3_67, A0_65
end
function trustedCertificateGet()
  local L0_68, L1_69, L2_70, L3_71, L4_72, L5_73, L6_74, L7_75, L8_76, L9_77
  L0_68 = db
  L0_68 = L0_68.getNextRowId
  L1_69 = _UPVALUE0_
  L2_70 = trustedcertificatesTable
  L0_68 = L0_68(L1_69, L2_70)
  L1_69 = db
  L1_69 = L1_69.getRow
  L2_70 = trustedcertificatesTable
  L3_71 = _UPVALUE1_
  L4_72 = L0_68
  L1_69 = L1_69(L2_70, L3_71, L4_72)
  L2_70 = _UPVALUE2_
  L2_70 = L2_70.NIL
  if L1_69 == L2_70 then
    L2_70 = _UPVALUE2_
    L2_70 = L2_70.FAILURE
    return L2_70
  end
  L2_70, L3_71, L4_72, L5_73, L6_74, L7_75, L8_76, L9_77 = nil, nil, nil, nil, nil, nil, nil, nil
  L2_70 = L1_69[trustedcertificatesTable .. "." .. _UPVALUE3_.subjectName]
  L3_71 = L1_69[trustedcertificatesTable .. "." .. _UPVALUE3_.certificateName]
  L4_72 = L1_69[trustedcertificatesTable .. "." .. _UPVALUE3_.issuerName]
  L5_73 = L1_69[trustedcertificatesTable .. "." .. _UPVALUE3_.expiryTime]
  L6_74 = L1_69[trustedcertificatesTable .. "." .. _UPVALUE3_.serialNumber]
  L7_75 = L1_69[trustedcertificatesTable .. "." .. _UPVALUE3_.format]
  L8_76 = L1_69[trustedcertificatesTable .. "." .. _UPVALUE3_.certType]
  L9_77 = L1_69[trustedcertificatesTable .. "." .. _UPVALUE3_.certData]
  return _UPVALUE2_.SUCCESS, L0_68, L2_70, L3_71, L4_72, L5_73, L6_74, L7_75, L8_76, L9_77
end
function trustedCertificateGetNext(A0_78)
  local L1_79, L2_80, L3_81, L4_82, L5_83, L6_84, L7_85, L8_86, L9_87, L10_88
  L1_79 = _UPVALUE0_
  L1_79 = L1_79.NIL
  if A0_78 ~= L1_79 then
    L1_79 = tonumber
    L2_80 = A0_78
    L1_79 = L1_79(L2_80)
    L2_80 = _UPVALUE0_
    L2_80 = L2_80.NIL
  elseif L1_79 == L2_80 then
    L1_79 = _UPVALUE0_
    L1_79 = L1_79.INVALID_ARGUMENT
    return L1_79
  end
  L1_79 = db
  L1_79 = L1_79.existsRow
  L2_80 = trustedcertificatesTable
  L3_81 = _UPVALUE1_
  L4_82 = A0_78
  L1_79 = L1_79(L2_80, L3_81, L4_82)
  L2_80 = _UPVALUE0_
  L2_80 = L2_80.FALSE
  if L1_79 == L2_80 then
    L1_79 = _UPVALUE2_
    L1_79 = L1_79.X509_COOKIE_INVALID
    return L1_79
  end
  L1_79 = db
  L1_79 = L1_79.getNextRowId
  L2_80 = A0_78
  L3_81 = trustedcertificatesTable
  L1_79 = L1_79(L2_80, L3_81)
  L2_80 = _UPVALUE0_
  L2_80 = L2_80.NIL
  if L1_79 == L2_80 then
    L2_80 = _UPVALUE0_
    L2_80 = L2_80.NOT_EXIST
    return L2_80
  end
  L2_80 = db
  L2_80 = L2_80.getRow
  L3_81 = trustedcertificatesTable
  L4_82 = _UPVALUE1_
  L5_83 = L1_79
  L2_80 = L2_80(L3_81, L4_82, L5_83)
  L3_81 = _UPVALUE0_
  L3_81 = L3_81.NIL
  if L2_80 == L3_81 then
    L3_81 = _UPVALUE0_
    L3_81 = L3_81.FAILURE
    return L3_81
  end
  L3_81, L4_82, L5_83, L6_84, L7_85, L8_86, L9_87, L10_88 = nil, nil, nil, nil, nil, nil, nil, nil
  L3_81 = L2_80[trustedcertificatesTable .. "." .. _UPVALUE3_.subjectName]
  L4_82 = L2_80[trustedcertificatesTable .. "." .. _UPVALUE3_.certificateName]
  L5_83 = L2_80[trustedcertificatesTable .. "." .. _UPVALUE3_.issuerName]
  L6_84 = L2_80[trustedcertificatesTable .. "." .. _UPVALUE3_.expiryTime]
  L7_85 = L2_80[trustedcertificatesTable .. "." .. _UPVALUE3_.serialNumber]
  L8_86 = L2_80[trustedcertificatesTable .. "." .. _UPVALUE3_.format]
  L9_87 = L2_80[trustedcertificatesTable .. "." .. _UPVALUE3_.certType]
  L10_88 = L2_80[trustedcertificatesTable .. "." .. _UPVALUE3_.certData]
  return _UPVALUE0_.SUCCESS, L1_79, L3_81, L4_82, L5_83, L6_84, L7_85, L8_86, L9_87, L10_88
end
function trustedCertificateSet(A0_89, A1_90, A2_91, A3_92, A4_93, A5_94, A6_95, A7_96, A8_97)
  local L10_98
  L10_98 = _UPVALUE0_
  L10_98 = L10_98.NOT_SUPPORTED
  return L10_98, A0_89
end
function trustedCertificateCreate(A0_99, A1_100, A2_101, A3_102, A4_103, A5_104, A6_105, A7_106)
  local L9_107
  L9_107 = _UPVALUE0_
  L9_107 = L9_107.NOT_SUPPORTED
  return L9_107, 0
end
function trustedCertificateDelete(A0_108)
  local L1_109, L2_110, L3_111, L4_112, L5_113
  L1_109 = _UPVALUE0_
  L1_109 = L1_109.NIL
  if A0_108 ~= L1_109 then
    L1_109 = tonumber
    L2_110 = A0_108
    L1_109 = L1_109(L2_110)
    L2_110 = _UPVALUE0_
    L2_110 = L2_110.NIL
  elseif L1_109 == L2_110 then
    L1_109 = _UPVALUE0_
    L1_109 = L1_109.INVALID_ARGUMENT
    return L1_109
  end
  L1_109 = db
  L1_109 = L1_109.existsRow
  L2_110 = trustedcertificatesTable
  L3_111 = _UPVALUE1_
  L4_112 = A0_108
  L1_109 = L1_109(L2_110, L3_111, L4_112)
  L2_110 = _UPVALUE0_
  L2_110 = L2_110.FALSE
  if L1_109 == L2_110 then
    L1_109 = _UPVALUE0_
    L1_109 = L1_109.INVALID_ARGUMENT
    return L1_109
  end
  L1_109 = db
  L1_109 = L1_109.getAttribute
  L2_110 = "cert"
  L3_111 = "cert._ROWID_"
  L4_112 = A0_108
  L5_113 = "subjectName"
  L1_109 = L1_109(L2_110, L3_111, L4_112, L5_113)
  L2_110 = "issuerName = '"
  L3_111 = L1_109
  L4_112 = "' AND certType = 'self'"
  L2_110 = L2_110 .. L3_111 .. L4_112
  L3_111 = db
  L3_111 = L3_111.getRowsWhere
  L4_112 = "cert"
  L5_113 = L2_110
  L3_111 = L3_111(L4_112, L5_113)
  if L3_111 then
    L4_112 = #L3_111
    if L4_112 >= 1 then
      L4_112 = _UPVALUE2_
      L4_112 = L4_112.CANNTOT_DEL_USED_CERT
      return L4_112
    end
  end
  L4_112 = x509Lib
  L4_112 = L4_112.getCertHash
  L5_113 = A0_108
  L5_113 = L4_112(L5_113)
  if L4_112 == -1 then
    return _UPVALUE2_.X509_CANNOT_DEL_TRUSTED
  end
  _UPVALUE3_.execute("rm" .. " /var/certs/ca/" .. L5_113 .. ".0")
  _UPVALUE3_.execute("rm" .. " /var/certs/ca/" .. "CA" .. A0_108 .. ".crt")
  if db.deleteRow(trustedcertificatesTable, _UPVALUE1_, A0_108) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_108
  end
  return _UPVALUE0_.SUCCESS, A0_108
end
function trustedCertificateGetAll()
  local L0_114, L1_115
  L0_114 = "SELECT *, _ROWID_ AS _ROWID_ FROM cert WHERE certType = 'ca'"
  L1_115 = db
  L1_115 = L1_115.getTable
  L1_115 = L1_115(trustedcertificatesTable, false, L0_114)
  if L1_115 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_115
end
function trustedCertificateDeleteAll()
  local L0_116, L1_117, L2_118, L3_119, L4_120, L5_121, L6_122, L7_123, L8_124, L9_125, L10_126, L11_127
  L0_116 = db
  L0_116 = L0_116.getTable
  L0_116 = L0_116(L1_117, L2_118)
  for L4_120, L5_121 in L1_117(L2_118) do
    L6_122 = {}
    L7_123 = L0_116[L4_120]
    L7_123 = L7_123._ROWID_
    L6_122["cert._ROWID_"] = L7_123
    L7_123 = db
    L7_123 = L7_123.getAttribute
    L8_124 = "cert"
    L9_125 = "cert._ROWID_"
    L10_126 = L0_116[L4_120]
    L10_126 = L10_126._ROWID_
    L11_127 = "subjectName"
    L7_123 = L7_123(L8_124, L9_125, L10_126, L11_127)
    L8_124 = "issuerName = '"
    L9_125 = L7_123
    L10_126 = "' AND certType = 'self'"
    L8_124 = L8_124 .. L9_125 .. L10_126
    L9_125 = db
    L9_125 = L9_125.getRowsWhere
    L10_126 = "cert"
    L11_127 = L8_124
    L9_125 = L9_125(L10_126, L11_127)
    if L9_125 then
      L10_126 = #L9_125
      if L10_126 >= 1 then
        L10_126 = _UPVALUE0_
        L10_126 = L10_126.CANNTOT_DEL_USED_CERT
        return L10_126
      end
    end
    L10_126 = x509Lib
    L10_126 = L10_126.getCertHash
    L11_127 = L0_116[L4_120]
    L11_127 = L11_127._ROWID_
    L11_127 = L10_126(L11_127)
    if L10_126 == -1 then
      return _UPVALUE0_.X509_CANNOT_DEL_TRUSTED
    end
    _UPVALUE1_.execute("rm" .. " /var/certs/ca/" .. L11_127 .. ".0")
    _UPVALUE1_.execute("rm" .. " /var/certs/ca/" .. "CA" .. L0_116[L4_120]._ROWID_ .. ".crt")
    valid = db.delete("cert", L6_122)
  end
  if L1_117 then
    return L1_117
  else
    return L1_117
  end
end
;({}).execute = function(A0_128)
  return (os.execute(A0_128))
end
function uploadTrustedCert(A0_129)
  local L1_130, L2_131, L3_132, L4_133, L5_134, L6_135, L7_136, L8_137, L9_138, L10_139, L11_140, L12_141, L13_142, L14_143, L15_144, L16_145, L17_146, L18_147
  L1_130 = "SELECT * from "
  L2_131 = trustedcertificatesTable
  L3_132 = " where certType ='ca'"
  L1_130 = L1_130 .. L2_131 .. L3_132
  L2_131 = db
  L2_131 = L2_131.getTable
  L3_132 = trustedcertificatesTable
  L4_133 = false
  L5_134 = L1_130
  L2_131 = L2_131(L3_132, L4_133, L5_134)
  if L2_131 ~= nil then
    L3_132 = #L2_131
    L4_133 = _UPVALUE0_
    L4_133 = L4_133 - 1
    if L3_132 > L4_133 then
      L3_132 = _UPVALUE1_
      L3_132 = L3_132.MAX_LIMIT_REACHED
      return L3_132
    end
  end
  L3_132 = false
  L4_133 = util
  L4_133 = L4_133.appendDebugOut
  L5_134 = util
  L5_134 = L5_134.tableToStringRec
  L6_135 = A0_129
  L18_147 = L5_134(L6_135)
  L4_133(L5_134, L6_135, L7_136, L8_137, L9_138, L10_139, L11_140, L12_141, L13_142, L14_143, L15_144, L16_145, L17_146, L18_147, L5_134(L6_135))
  L4_133 = A0_129["file.upload"]
  L4_133 = L4_133.filesize
  L5_134 = A0_129["file.upload"]
  L5_134 = L5_134.filename
  L6_135 = A0_129["file.upload"]
  L6_135 = L6_135.file
  L7_136 = cgilua
  L7_136 = L7_136.cookies
  L7_136 = L7_136.get
  L8_137 = "TeamF1Login"
  L7_136 = L7_136(L8_137)
  L8_137 = _UPVALUE2_
  L8_137 = L8_137.execute
  L9_138 = "mv"
  L10_139 = " "
  L11_140 = "/tmp/"
  L12_141 = L7_136
  L13_142 = " /tmp/"
  L14_143 = "temp.crt"
  L9_138 = L9_138 .. L10_139 .. L11_140 .. L12_141 .. L13_142 .. L14_143
  L8_137 = L8_137(L9_138)
  L9_138 = {}
  L10_139 = nil
  L11_140 = util
  L11_140 = L11_140.fileToString
  L12_141 = "/tmp/temp.crt"
  L11_140 = L11_140(L12_141)
  L10_139 = L11_140
  L11_140 = x509Lib
  L11_140 = L11_140.certLoad
  L12_141 = L10_139
  L13_142 = "ca"
  L17_146 = L11_140(L12_141, L13_142)
  L18_147 = _UPVALUE2_
  L18_147 = L18_147.execute
  L18_147 = L18_147("rm" .. " /tmp/" .. "temp.crt")
  if L11_140 == -1 then
    return _UPVALUE1_.FAILURE
  end
  L9_138["cert.name"] = L12_141
  L9_138["cert.subjectName"] = L13_142
  L9_138["cert.issuerName"] = L14_143
  L9_138["cert.expiryTime"] = L15_144
  L9_138["cert.serialNumber"] = L16_145
  L9_138["cert.format"] = L17_146
  L9_138["cert.certType"] = "ca"
  L9_138["cert.certData"] = L10_139
  L18_147 = db.insert("cert", L9_138)
  if L18_147 then
    return _UPVALUE1_.SUCCESS
  else
    return _UPVALUE1_.FAILURE
  end
end
function selfCertificateGetAll()
  local L0_148, L1_149
  L0_148 = "SELECT *, _ROWID_ AS _ROWID_ FROM cert where certType='self'"
  L1_149 = db
  L1_149 = L1_149.getTable
  L1_149 = L1_149(trustedcertificatesTable, false, L0_148)
  if L1_149 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_149
end
