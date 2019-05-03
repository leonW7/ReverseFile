local L0_0
L0_0 = module
L0_0("com.teamf1.core.sslvpn.resouceconfig", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/sslvpn_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.sslvpn.returnCodes")
;({}).resourceName = "ResourceName"
;({}).serviceType = "ServiceType"
;({}).objectType = "ObjectType"
;({}).objectAddress = "ObjectAddress"
;({}).maskLength = "MaskLength"
;({}).startPort = "StartPort"
;({}).endPort = "EndPort"
;({}).icmp = "IcmpBlock"
;({}).accessMgmt = "accessMgmtEnable"
function resourceNameGet()
  local L0_1, L1_2
  L0_1 = db
  L0_1 = L0_1.getNextRowId
  L1_2 = _UPVALUE0_
  L0_1 = L0_1(L1_2, _UPVALUE1_)
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(_UPVALUE1_, _UPVALUE2_, L0_1, _UPVALUE3_.resourceName)
  if L1_2 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_1, L1_2
end
function resourceNameGetNext(A0_3)
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
  L2_5 = _UPVALUE1_
  L1_4 = L1_4(L2_5, _UPVALUE2_, A0_3)
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
  L1_4 = L1_4(L2_5, _UPVALUE1_)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if L1_4 == L2_5 then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.NOT_EXIST
    return L2_5
  end
  L2_5 = db
  L2_5 = L2_5.getAttribute
  L2_5 = L2_5(_UPVALUE1_, _UPVALUE2_, L1_4, _UPVALUE3_.resourceName)
  if L2_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L2_5
end
function resourceNameSet(A0_6, A1_7)
  local L3_8
  L3_8 = _UPVALUE0_
  L3_8 = L3_8.NOT_SUPPORTED
  return L3_8, A0_6
end
function resourceNameDelete(A0_9, A1_10)
  local L3_11
  L3_11 = _UPVALUE0_
  L3_11 = L3_11.NOT_SUPPORTED
  return L3_11, A0_9
end
function serviceTypeGet()
  local L0_12, L1_13, L2_14, L3_15
  L0_12 = resourceNameGet
  L2_14 = L0_12()
  L3_15 = db
  L3_15 = L3_15.getAttribute
  L3_15 = L3_15(_UPVALUE0_, _UPVALUE1_.resourceName, L2_14, _UPVALUE1_.serviceType)
  if L3_15 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L1_13, L3_15
end
function serviceTypeGetNext(A0_16)
  local L1_17, L2_18, L3_19, L4_20
  L1_17 = _UPVALUE0_
  L1_17 = L1_17.NIL
  if A0_16 ~= L1_17 then
    L1_17 = tonumber
    L2_18 = A0_16
    L1_17 = L1_17(L2_18)
    L2_18 = _UPVALUE0_
    L2_18 = L2_18.NIL
  elseif L1_17 == L2_18 then
    L1_17 = _UPVALUE0_
    L1_17 = L1_17.INVALID_ARGUMENT
    return L1_17
  end
  L1_17 = db
  L1_17 = L1_17.existsRow
  L2_18 = _UPVALUE1_
  L3_19 = _UPVALUE2_
  L4_20 = A0_16
  L1_17 = L1_17(L2_18, L3_19, L4_20)
  L2_18 = _UPVALUE0_
  L2_18 = L2_18.FALSE
  if L1_17 == L2_18 then
    L1_17 = _UPVALUE0_
    L1_17 = L1_17.INVALID_ARGUMENT
    return L1_17
  end
  L1_17 = resourceNameGetNext
  L2_18 = A0_16
  L3_19 = L1_17(L2_18)
  L4_20 = db
  L4_20 = L4_20.getAttribute
  L4_20 = L4_20(_UPVALUE3_, _UPVALUE4_.resourceName, L3_19, _UPVALUE4_.serviceType)
  if L4_20 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L2_18, L4_20
end
function serviceTypeSet(A0_21, A1_22)
  local L3_23
  L3_23 = _UPVALUE0_
  L3_23 = L3_23.NOT_SUPPORTED
  return L3_23, A0_21
end
function objectTypeGet()
  local L0_24, L1_25
  L0_24 = db
  L0_24 = L0_24.getNextRowId
  L1_25 = _UPVALUE0_
  L0_24 = L0_24(L1_25, _UPVALUE1_)
  L1_25 = db
  L1_25 = L1_25.getAttribute
  L1_25 = L1_25(_UPVALUE1_, _UPVALUE2_, L0_24, _UPVALUE3_.objectType)
  if L1_25 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_24, L1_25
end
function objectTypeGetNext(A0_26)
  local L1_27, L2_28
  L1_27 = _UPVALUE0_
  L1_27 = L1_27.NIL
  if A0_26 ~= L1_27 then
    L1_27 = tonumber
    L2_28 = A0_26
    L1_27 = L1_27(L2_28)
    L2_28 = _UPVALUE0_
    L2_28 = L2_28.NIL
  elseif L1_27 == L2_28 then
    L1_27 = _UPVALUE0_
    L1_27 = L1_27.INVALID_ARGUMENT
    return L1_27
  end
  L1_27 = db
  L1_27 = L1_27.existsRow
  L2_28 = _UPVALUE1_
  L1_27 = L1_27(L2_28, _UPVALUE2_, A0_26)
  L2_28 = _UPVALUE0_
  L2_28 = L2_28.FALSE
  if L1_27 == L2_28 then
    L1_27 = _UPVALUE0_
    L1_27 = L1_27.INVALID_ARGUMENT
    return L1_27
  end
  L1_27 = db
  L1_27 = L1_27.getNextRowId
  L2_28 = A0_26
  L1_27 = L1_27(L2_28, _UPVALUE1_)
  L2_28 = _UPVALUE0_
  L2_28 = L2_28.NIL
  if L1_27 == L2_28 then
    L2_28 = _UPVALUE0_
    L2_28 = L2_28.NOT_EXIST
    return L2_28
  end
  L2_28 = db
  L2_28 = L2_28.getAttribute
  L2_28 = L2_28(_UPVALUE1_, _UPVALUE2_, L1_27, _UPVALUE3_.objectType)
  if L2_28 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_27
  end
  return _UPVALUE0_.SUCCESS, L1_27, L2_28
end
function objectTypeSet(A0_29, A1_30)
  if A0_29 == _UPVALUE0_.NIL or tonumber(A0_29) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_29) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_30 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_30) ~= _UPVALUE3_ and tonumber(A1_30) ~= _UPVALUE4_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_29, _UPVALUE5_.objectType, A1_30) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_29
  end
  return _UPVALUE0_.SUCCESS, A0_29
end
function objectTypeDelete(A0_31, A1_32)
  local L3_33
  L3_33 = _UPVALUE0_
  L3_33 = L3_33.NOT_SUPPORTED
  return L3_33, A0_31
end
function objectAddressGet()
  local L0_34, L1_35
  L0_34 = db
  L0_34 = L0_34.getNextRowId
  L1_35 = _UPVALUE0_
  L0_34 = L0_34(L1_35, _UPVALUE1_)
  L1_35 = db
  L1_35 = L1_35.getAttribute
  L1_35 = L1_35(_UPVALUE1_, _UPVALUE2_, L0_34, _UPVALUE3_.objectAddress)
  if L1_35 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_34, L1_35
end
function objectAddressGetNext(A0_36)
  local L1_37, L2_38
  L1_37 = _UPVALUE0_
  L1_37 = L1_37.NIL
  if A0_36 ~= L1_37 then
    L1_37 = tonumber
    L2_38 = A0_36
    L1_37 = L1_37(L2_38)
    L2_38 = _UPVALUE0_
    L2_38 = L2_38.NIL
  elseif L1_37 == L2_38 then
    L1_37 = _UPVALUE0_
    L1_37 = L1_37.INVALID_ARGUMENT
    return L1_37
  end
  L1_37 = db
  L1_37 = L1_37.existsRow
  L2_38 = _UPVALUE1_
  L1_37 = L1_37(L2_38, _UPVALUE2_, A0_36)
  L2_38 = _UPVALUE0_
  L2_38 = L2_38.FALSE
  if L1_37 == L2_38 then
    L1_37 = _UPVALUE0_
    L1_37 = L1_37.INVALID_ARGUMENT
    return L1_37
  end
  L1_37 = db
  L1_37 = L1_37.getNextRowId
  L2_38 = A0_36
  L1_37 = L1_37(L2_38, _UPVALUE1_)
  L2_38 = _UPVALUE0_
  L2_38 = L2_38.NIL
  if L1_37 == L2_38 then
    L2_38 = _UPVALUE0_
    L2_38 = L2_38.NOT_EXIST
    return L2_38
  end
  L2_38 = db
  L2_38 = L2_38.getAttribute
  L2_38 = L2_38(_UPVALUE1_, _UPVALUE2_, L1_37, _UPVALUE3_.objectAddress)
  if L2_38 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_37
  end
  return _UPVALUE0_.SUCCESS, L1_37, L2_38
end
function objectAddressSet(A0_39, A1_40)
  local L2_41
  L2_41 = _UPVALUE0_
  L2_41 = L2_41.NIL
  if A0_39 ~= L2_41 then
    L2_41 = tonumber
    L2_41 = L2_41(A0_39)
  elseif L2_41 == _UPVALUE0_.NIL then
    L2_41 = _UPVALUE0_
    L2_41 = L2_41.INVALID_ARGUMENT
    return L2_41
  end
  L2_41 = db
  L2_41 = L2_41.existsRow
  L2_41 = L2_41(_UPVALUE1_, _UPVALUE2_, A0_39)
  if L2_41 == _UPVALUE0_.FALSE then
    L2_41 = _UPVALUE0_
    L2_41 = L2_41.INVALID_ARGUMENT
    return L2_41
  end
  L2_41 = nil
  if A1_40 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_41 = _UPVALUE3_.ipAddressCheck("2", A1_40)
  if L2_41 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_39, _UPVALUE4_.objectAddress, A1_40) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_39
  end
  return _UPVALUE0_.SUCCESS, A0_39
end
function objectAddressDelete(A0_42, A1_43)
  local L3_44
  L3_44 = _UPVALUE0_
  L3_44 = L3_44.NOT_SUPPORTED
  return L3_44, A0_42
end
function maskLengthGet()
  local L0_45, L1_46
  L0_45 = db
  L0_45 = L0_45.getNextRowId
  L1_46 = _UPVALUE0_
  L0_45 = L0_45(L1_46, _UPVALUE1_)
  L1_46 = db
  L1_46 = L1_46.getAttribute
  L1_46 = L1_46(_UPVALUE1_, _UPVALUE2_, L0_45, _UPVALUE3_.maskLength)
  if L1_46 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_45, L1_46
end
function maskLengthGetNext(A0_47)
  local L1_48, L2_49
  L1_48 = _UPVALUE0_
  L1_48 = L1_48.NIL
  if A0_47 ~= L1_48 then
    L1_48 = tonumber
    L2_49 = A0_47
    L1_48 = L1_48(L2_49)
    L2_49 = _UPVALUE0_
    L2_49 = L2_49.NIL
  elseif L1_48 == L2_49 then
    L1_48 = _UPVALUE0_
    L1_48 = L1_48.INVALID_ARGUMENT
    return L1_48
  end
  L1_48 = db
  L1_48 = L1_48.existsRow
  L2_49 = _UPVALUE1_
  L1_48 = L1_48(L2_49, _UPVALUE2_, A0_47)
  L2_49 = _UPVALUE0_
  L2_49 = L2_49.FALSE
  if L1_48 == L2_49 then
    L1_48 = _UPVALUE0_
    L1_48 = L1_48.INVALID_ARGUMENT
    return L1_48
  end
  L1_48 = db
  L1_48 = L1_48.getNextRowId
  L2_49 = A0_47
  L1_48 = L1_48(L2_49, _UPVALUE1_)
  L2_49 = _UPVALUE0_
  L2_49 = L2_49.NIL
  if L1_48 == L2_49 then
    L2_49 = _UPVALUE0_
    L2_49 = L2_49.NOT_EXIST
    return L2_49
  end
  L2_49 = db
  L2_49 = L2_49.getAttribute
  L2_49 = L2_49(_UPVALUE1_, _UPVALUE2_, L1_48, _UPVALUE3_.maskLength)
  if L2_49 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_48
  end
  return _UPVALUE0_.SUCCESS, L1_48, L2_49
end
function maskLengthSet(A0_50, A1_51)
  if A0_50 == _UPVALUE0_.NIL or tonumber(A0_50) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_50) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_51 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_51) < _UPVALUE3_ or tonumber(A1_51) > _UPVALUE4_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_50, _UPVALUE5_.maskLength, A1_51) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_50
  end
  return _UPVALUE0_.SUCCESS, A0_50
end
function maskLengthDelete(A0_52, A1_53)
  local L3_54
  L3_54 = _UPVALUE0_
  L3_54 = L3_54.NOT_SUPPORTED
  return L3_54, A0_52
end
function startPortGet()
  local L0_55, L1_56
  L0_55 = db
  L0_55 = L0_55.getNextRowId
  L1_56 = _UPVALUE0_
  L0_55 = L0_55(L1_56, _UPVALUE1_)
  L1_56 = db
  L1_56 = L1_56.getAttribute
  L1_56 = L1_56(_UPVALUE1_, _UPVALUE2_, L0_55, _UPVALUE3_.startPort)
  if L1_56 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_55, L1_56
end
function startPortGetNext(A0_57)
  local L1_58, L2_59
  L1_58 = _UPVALUE0_
  L1_58 = L1_58.NIL
  if A0_57 ~= L1_58 then
    L1_58 = tonumber
    L2_59 = A0_57
    L1_58 = L1_58(L2_59)
    L2_59 = _UPVALUE0_
    L2_59 = L2_59.NIL
  elseif L1_58 == L2_59 then
    L1_58 = _UPVALUE0_
    L1_58 = L1_58.INVALID_ARGUMENT
    return L1_58
  end
  L1_58 = db
  L1_58 = L1_58.existsRow
  L2_59 = _UPVALUE1_
  L1_58 = L1_58(L2_59, _UPVALUE2_, A0_57)
  L2_59 = _UPVALUE0_
  L2_59 = L2_59.FALSE
  if L1_58 == L2_59 then
    L1_58 = _UPVALUE0_
    L1_58 = L1_58.INVALID_ARGUMENT
    return L1_58
  end
  L1_58 = db
  L1_58 = L1_58.getNextRowId
  L2_59 = A0_57
  L1_58 = L1_58(L2_59, _UPVALUE1_)
  L2_59 = _UPVALUE0_
  L2_59 = L2_59.NIL
  if L1_58 == L2_59 then
    L2_59 = _UPVALUE0_
    L2_59 = L2_59.NOT_EXIST
    return L2_59
  end
  L2_59 = db
  L2_59 = L2_59.getAttribute
  L2_59 = L2_59(_UPVALUE1_, _UPVALUE2_, L1_58, _UPVALUE3_.startPort)
  if L2_59 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_58
  end
  return _UPVALUE0_.SUCCESS, L1_58, L2_59
end
function startPortSet(A0_60, A1_61)
  if A0_60 == _UPVALUE0_.NIL or tonumber(A0_60) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_60) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_61 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_61) < _UPVALUE3_ or tonumber(A1_61) > _UPVALUE4_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_60, _UPVALUE5_.startPort, A1_61) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_60
  end
  return _UPVALUE0_.SUCCESS, A0_60
end
function startPortDelete(A0_62, A1_63)
  local L3_64
  L3_64 = _UPVALUE0_
  L3_64 = L3_64.NOT_SUPPORTED
  return L3_64, A0_62
end
function endPortGet()
  local L0_65, L1_66
  L0_65 = db
  L0_65 = L0_65.getNextRowId
  L1_66 = _UPVALUE0_
  L0_65 = L0_65(L1_66, _UPVALUE1_)
  L1_66 = db
  L1_66 = L1_66.getAttribute
  L1_66 = L1_66(_UPVALUE1_, _UPVALUE2_, L0_65, _UPVALUE3_.endPort)
  if L1_66 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_65, L1_66
end
function endPortGetNext(A0_67)
  local L1_68, L2_69
  L1_68 = _UPVALUE0_
  L1_68 = L1_68.NIL
  if A0_67 ~= L1_68 then
    L1_68 = tonumber
    L2_69 = A0_67
    L1_68 = L1_68(L2_69)
    L2_69 = _UPVALUE0_
    L2_69 = L2_69.NIL
  elseif L1_68 == L2_69 then
    L1_68 = _UPVALUE0_
    L1_68 = L1_68.INVALID_ARGUMENT
    return L1_68
  end
  L1_68 = db
  L1_68 = L1_68.existsRow
  L2_69 = _UPVALUE1_
  L1_68 = L1_68(L2_69, _UPVALUE2_, A0_67)
  L2_69 = _UPVALUE0_
  L2_69 = L2_69.FALSE
  if L1_68 == L2_69 then
    L1_68 = _UPVALUE0_
    L1_68 = L1_68.INVALID_ARGUMENT
    return L1_68
  end
  L1_68 = db
  L1_68 = L1_68.getNextRowId
  L2_69 = A0_67
  L1_68 = L1_68(L2_69, _UPVALUE1_)
  L2_69 = _UPVALUE0_
  L2_69 = L2_69.NIL
  if L1_68 == L2_69 then
    L2_69 = _UPVALUE0_
    L2_69 = L2_69.NOT_EXIST
    return L2_69
  end
  L2_69 = db
  L2_69 = L2_69.getAttribute
  L2_69 = L2_69(_UPVALUE1_, _UPVALUE2_, L1_68, _UPVALUE3_.endPort)
  if L2_69 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_68
  end
  return _UPVALUE0_.SUCCESS, L1_68, L2_69
end
function endPortSet(A0_70, A1_71)
  if A0_70 == _UPVALUE0_.NIL or tonumber(A0_70) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_70) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_71 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_71) < _UPVALUE3_ or tonumber(A1_71) > _UPVALUE4_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_70, _UPVALUE5_.endPort, A1_71) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_70
  end
  return _UPVALUE0_.SUCCESS, A0_70
end
function endPortDelete(A0_72, A1_73)
  local L3_74
  L3_74 = _UPVALUE0_
  L3_74 = L3_74.NOT_SUPPORTED
  return L3_74, A0_72
end
function icmpGet()
  local L0_75, L1_76
  L0_75 = db
  L0_75 = L0_75.getNextRowId
  L1_76 = _UPVALUE0_
  L0_75 = L0_75(L1_76, _UPVALUE1_)
  L1_76 = db
  L1_76 = L1_76.getAttribute
  L1_76 = L1_76(_UPVALUE1_, _UPVALUE2_, L0_75, _UPVALUE3_.icmp)
  if L1_76 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_75, L1_76
end
function icmpGetNext(A0_77)
  local L1_78, L2_79
  L1_78 = _UPVALUE0_
  L1_78 = L1_78.NIL
  if A0_77 ~= L1_78 then
    L1_78 = tonumber
    L2_79 = A0_77
    L1_78 = L1_78(L2_79)
    L2_79 = _UPVALUE0_
    L2_79 = L2_79.NIL
  elseif L1_78 == L2_79 then
    L1_78 = _UPVALUE0_
    L1_78 = L1_78.INVALID_ARGUMENT
    return L1_78
  end
  L1_78 = db
  L1_78 = L1_78.existsRow
  L2_79 = _UPVALUE1_
  L1_78 = L1_78(L2_79, _UPVALUE2_, A0_77)
  L2_79 = _UPVALUE0_
  L2_79 = L2_79.FALSE
  if L1_78 == L2_79 then
    L1_78 = _UPVALUE0_
    L1_78 = L1_78.INVALID_ARGUMENT
    return L1_78
  end
  L1_78 = db
  L1_78 = L1_78.getNextRowId
  L2_79 = A0_77
  L1_78 = L1_78(L2_79, _UPVALUE1_)
  L2_79 = _UPVALUE0_
  L2_79 = L2_79.NIL
  if L1_78 == L2_79 then
    L2_79 = _UPVALUE0_
    L2_79 = L2_79.NOT_EXIST
    return L2_79
  end
  L2_79 = db
  L2_79 = L2_79.getAttribute
  L2_79 = L2_79(_UPVALUE1_, _UPVALUE2_, L1_78, _UPVALUE3_.icmp)
  if L2_79 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_78
  end
  return _UPVALUE0_.SUCCESS, L1_78, L2_79
end
function icmpSet(A0_80, A1_81)
  if A0_80 == _UPVALUE0_.NIL or tonumber(A0_80) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_80) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_81 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_81 ~= _UPVALUE3_ and A1_81 ~= _UPVALUE4_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_80, _UPVALUE5_.icmp, A1_81) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_80
  end
  return _UPVALUE0_.SUCCESS, A0_80
end
function resourceConfigurationGet()
  local L0_82, L1_83, L2_84, L3_85, L4_86, L5_87, L6_88, L7_89, L8_90, L9_91
  L0_82 = db
  L0_82 = L0_82.getNextRowId
  L1_83 = _UPVALUE0_
  L2_84 = _UPVALUE1_
  L0_82 = L0_82(L1_83, L2_84)
  L1_83 = db
  L1_83 = L1_83.getRow
  L2_84 = _UPVALUE1_
  L3_85 = _UPVALUE2_
  L4_86 = L0_82
  L1_83 = L1_83(L2_84, L3_85, L4_86)
  L2_84 = _UPVALUE3_
  L2_84 = L2_84.NIL
  if L1_83 == L2_84 then
    L2_84 = _UPVALUE3_
    L2_84 = L2_84.FAILURE
    return L2_84
  end
  L2_84, L3_85, L4_86, L5_87, L6_88, L7_89, L8_90, L9_91 = nil, nil, nil, nil, nil, nil, nil, nil
  L2_84 = L1_83[_UPVALUE1_ .. "." .. _UPVALUE4_.resourceName]
  L3_85 = db.getAttribute(_UPVALUE5_, _UPVALUE4_.resourceName, L2_84, _UPVALUE4_.serviceType)
  L4_86 = L1_83[_UPVALUE1_ .. "." .. _UPVALUE4_.objectType]
  L5_87 = L1_83[_UPVALUE1_ .. "." .. _UPVALUE4_.objectAddress]
  L6_88 = L1_83[_UPVALUE1_ .. "." .. _UPVALUE4_.maskLength]
  L7_89 = L1_83[_UPVALUE1_ .. "." .. _UPVALUE4_.startPort]
  L8_90 = L1_83[_UPVALUE1_ .. "." .. _UPVALUE4_.endPort]
  L9_91 = L1_83[_UPVALUE1_ .. "." .. _UPVALUE4_.icmp]
  return _UPVALUE3_.SUCCESS, L0_82, L2_84, L3_85, L4_86, L5_87, L6_88, L7_89, L8_90, L9_91
end
function resourceConfigurationGetNext(A0_92)
  local L1_93, L2_94, L3_95, L4_96, L5_97, L6_98, L7_99, L8_100, L9_101, L10_102
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
  L2_94 = _UPVALUE1_
  L3_95 = _UPVALUE2_
  L4_96 = A0_92
  L1_93 = L1_93(L2_94, L3_95, L4_96)
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
  L3_95 = _UPVALUE1_
  L1_93 = L1_93(L2_94, L3_95)
  L2_94 = _UPVALUE0_
  L2_94 = L2_94.NIL
  if L1_93 == L2_94 then
    L2_94 = _UPVALUE0_
    L2_94 = L2_94.NOT_EXIST
    return L2_94
  end
  L2_94 = db
  L2_94 = L2_94.getRow
  L3_95 = _UPVALUE1_
  L4_96 = _UPVALUE2_
  L5_97 = L1_93
  L2_94 = L2_94(L3_95, L4_96, L5_97)
  L3_95 = _UPVALUE0_
  L3_95 = L3_95.NIL
  if L2_94 == L3_95 then
    L3_95 = _UPVALUE0_
    L3_95 = L3_95.FAILURE
    return L3_95
  end
  L3_95, L4_96, L5_97, L6_98, L7_99, L8_100, L9_101, L10_102 = nil, nil, nil, nil, nil, nil, nil, nil
  L3_95 = L2_94[_UPVALUE1_ .. "." .. _UPVALUE3_.resourceName]
  L4_96 = db.getAttribute(_UPVALUE4_, _UPVALUE3_.resourceName, L3_95, _UPVALUE3_.serviceType)
  L5_97 = L2_94[_UPVALUE1_ .. "." .. _UPVALUE3_.objectType]
  L6_98 = L2_94[_UPVALUE1_ .. "." .. _UPVALUE3_.objectAddress]
  L7_99 = L2_94[_UPVALUE1_ .. "." .. _UPVALUE3_.maskLength]
  L8_100 = L2_94[_UPVALUE1_ .. "." .. _UPVALUE3_.startPort]
  L9_101 = L2_94[_UPVALUE1_ .. "." .. _UPVALUE3_.endPort]
  L10_102 = L2_94[_UPVALUE1_ .. "." .. _UPVALUE3_.icmp]
  return _UPVALUE0_.SUCCESS, L1_93, L3_95, L4_96, L5_97, L6_98, L7_99, L8_100, L9_101, L10_102
end
function resourceConfigurationSet(A0_103, A1_104, A2_105, A3_106, A4_107, A5_108, A6_109, A7_110, A8_111)
  local L9_112, L10_113, L11_114
  L9_112 = _UPVALUE0_
  L9_112 = L9_112.NIL
  if A0_103 ~= L9_112 then
    L9_112 = tonumber
    L10_113 = A0_103
    L9_112 = L9_112(L10_113)
    L10_113 = _UPVALUE0_
    L10_113 = L10_113.NIL
  elseif L9_112 == L10_113 then
    L9_112 = _UPVALUE0_
    L9_112 = L9_112.INVALID_ARGUMENT
    return L9_112
  end
  L9_112 = db
  L9_112 = L9_112.existsRow
  L10_113 = _UPVALUE1_
  L11_114 = _UPVALUE2_
  L9_112 = L9_112(L10_113, L11_114, A0_103)
  L10_113 = _UPVALUE0_
  L10_113 = L10_113.FALSE
  if L9_112 == L10_113 then
    L9_112 = _UPVALUE0_
    L9_112 = L9_112.INVALID_ARGUMENT
    return L9_112
  end
  L9_112 = nil
  L10_113 = {}
  L11_114 = _UPVALUE0_
  L11_114 = L11_114.NIL
  if A1_104 == L11_114 then
    L11_114 = _UPVALUE0_
    L11_114 = L11_114.INVALID_ARGUMENT
    return L11_114
  end
  L11_114 = string
  L11_114 = L11_114.find
  L11_114 = L11_114(A1_104, "'")
  if L11_114 ~= _UPVALUE0_.NIL then
    return _UPVALUE3_.RESOURCE_NAME_SPECIAL_CHARACTER
  end
  L10_113[_UPVALUE1_ .. "." .. _UPVALUE4_.resourceName] = A1_104
  if A3_106 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A3_106) ~= _UPVALUE5_ and tonumber(A3_106) ~= _UPVALUE6_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L10_113[_UPVALUE1_ .. "." .. _UPVALUE4_.objectType] = A3_106
  if A4_107 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L11_114 = _UPVALUE7_.ipAddressCheck("2", A4_107)
  if L11_114 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE3_.SSLVPN_OBJECTADDRESS_INVALID
  end
  L10_113[_UPVALUE1_ .. "." .. _UPVALUE4_.objectAddress] = A4_107
  if tonumber(A3_106) == _UPVALUE6_ then
    if A5_108 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if tonumber(A5_108) < _UPVALUE8_ or tonumber(A5_108) > _UPVALUE9_ then
      return _UPVALUE3_.SSLVPN_OBJECT_NETWORKMASK_INVALID
    end
  else
    A5_108 = 32
  end
  L10_113[_UPVALUE1_ .. "." .. _UPVALUE4_.maskLength] = A5_108
  if A6_109 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A6_109) < _UPVALUE10_ or tonumber(A6_109) > _UPVALUE11_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L10_113[_UPVALUE1_ .. "." .. _UPVALUE4_.startPort] = A6_109
  if A7_110 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A7_110) < _UPVALUE10_ or tonumber(A7_110) > _UPVALUE11_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L10_113[_UPVALUE1_ .. "." .. _UPVALUE4_.endPort] = A7_110
  if A8_111 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A8_111 ~= _UPVALUE12_ and A8_111 ~= _UPVALUE13_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L10_113[_UPVALUE1_ .. "." .. _UPVALUE4_.icmp] = A8_111
  if db.update(_UPVALUE1_, L10_113, A0_103) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, 0
  end
  return _UPVALUE0_.SUCCESS, A0_103
end
function resourceConfigurationCreate(A0_115, A1_116, A2_117, A3_118, A4_119, A5_120, A6_121)
  local L7_122, L8_123, L9_124, L10_125, L11_126, L12_127, L13_128, L14_129
  L8_123 = {}
  L9_124 = _UPVALUE0_
  L9_124 = L9_124.NIL
  if A0_115 == L9_124 then
    L9_124 = _UPVALUE0_
    L9_124 = L9_124.INVALID_ARGUMENT
    return L9_124
  end
  L9_124 = string
  L9_124 = L9_124.find
  L10_125 = A0_115
  L11_126 = "'"
  L9_124 = L9_124(L10_125, L11_126)
  L10_125 = _UPVALUE0_
  L10_125 = L10_125.NIL
  if L9_124 ~= L10_125 then
    L10_125 = _UPVALUE1_
    L10_125 = L10_125.RESOURCE_NAME_SPECIAL_CHARACTER
    return L10_125
  end
  L10_125 = _UPVALUE2_
  L11_126 = "."
  L12_127 = _UPVALUE3_
  L12_127 = L12_127.resourceName
  L10_125 = L10_125 .. L11_126 .. L12_127
  L8_123[L10_125] = A0_115
  L10_125 = _UPVALUE0_
  L10_125 = L10_125.NIL
  if A1_116 == L10_125 then
    L10_125 = _UPVALUE0_
    L10_125 = L10_125.INVALID_ARGUMENT
    return L10_125
  end
  L10_125 = tonumber
  L11_126 = A1_116
  L10_125 = L10_125(L11_126)
  L11_126 = _UPVALUE4_
  if L10_125 ~= L11_126 then
    L11_126 = _UPVALUE5_
    if L10_125 ~= L11_126 then
      L11_126 = _UPVALUE0_
      L11_126 = L11_126.INVALID_ARGUMENT
      return L11_126
    end
  end
  L11_126 = _UPVALUE2_
  L12_127 = "."
  L13_128 = _UPVALUE3_
  L13_128 = L13_128.objectType
  L11_126 = L11_126 .. L12_127 .. L13_128
  L8_123[L11_126] = A1_116
  L11_126 = _UPVALUE0_
  L11_126 = L11_126.NIL
  if A2_117 == L11_126 then
    L11_126 = _UPVALUE0_
    L11_126 = L11_126.INVALID_ARGUMENT
    return L11_126
  end
  L11_126 = _UPVALUE6_
  L11_126 = L11_126.ipAddressCheck
  L12_127 = "2"
  L13_128 = A2_117
  L11_126 = L11_126(L12_127, L13_128)
  L9_124 = L11_126
  L11_126 = _UPVALUE0_
  L11_126 = L11_126.SUCCESS
  if L9_124 ~= L11_126 then
    L11_126 = _UPVALUE1_
    L11_126 = L11_126.SSLVPN_OBJECTADDRESS_INVALID
    return L11_126
  end
  L11_126 = _UPVALUE2_
  L12_127 = "."
  L13_128 = _UPVALUE3_
  L13_128 = L13_128.objectAddress
  L11_126 = L11_126 .. L12_127 .. L13_128
  L8_123[L11_126] = A2_117
  L11_126 = _UPVALUE5_
  if L10_125 == L11_126 then
    L11_126 = _UPVALUE0_
    L11_126 = L11_126.NIL
    if A3_118 == L11_126 then
      L11_126 = _UPVALUE0_
      L11_126 = L11_126.INVALID_ARGUMENT
      return L11_126
    end
    L11_126 = tonumber
    L12_127 = A3_118
    L11_126 = L11_126(L12_127)
    L12_127 = _UPVALUE7_
    if not (L11_126 < L12_127) then
      L12_127 = _UPVALUE8_
    elseif L11_126 > L12_127 then
      L12_127 = _UPVALUE1_
      L12_127 = L12_127.SSLVPN_OBJECT_NETWORKMASK_INVALID
      return L12_127
    end
  else
    A3_118 = 32
  end
  L11_126 = _UPVALUE2_
  L12_127 = "."
  L13_128 = _UPVALUE3_
  L13_128 = L13_128.maskLength
  L11_126 = L11_126 .. L12_127 .. L13_128
  L8_123[L11_126] = A3_118
  L11_126 = _UPVALUE0_
  L11_126 = L11_126.NIL
  if A4_119 == L11_126 then
    L11_126 = _UPVALUE0_
    L11_126 = L11_126.INVALID_ARGUMENT
    return L11_126
  end
  L11_126 = tonumber
  L12_127 = A4_119
  L11_126 = L11_126(L12_127)
  L12_127 = _UPVALUE9_
  if not (L11_126 < L12_127) then
    L12_127 = _UPVALUE10_
  elseif L11_126 > L12_127 then
    L12_127 = _UPVALUE0_
    L12_127 = L12_127.INVALID_ARGUMENT
    return L12_127
  end
  L12_127 = _UPVALUE2_
  L13_128 = "."
  L14_129 = _UPVALUE3_
  L14_129 = L14_129.startPort
  L12_127 = L12_127 .. L13_128 .. L14_129
  L8_123[L12_127] = A4_119
  L12_127 = _UPVALUE0_
  L12_127 = L12_127.NIL
  if A5_120 == L12_127 then
    L12_127 = _UPVALUE0_
    L12_127 = L12_127.INVALID_ARGUMENT
    return L12_127
  end
  L12_127 = tonumber
  L13_128 = A5_120
  L12_127 = L12_127(L13_128)
  L13_128 = _UPVALUE9_
  if not (L12_127 < L13_128) then
    L13_128 = _UPVALUE10_
  elseif L12_127 > L13_128 then
    L13_128 = _UPVALUE0_
    L13_128 = L13_128.INVALID_ARGUMENT
    return L13_128
  end
  L13_128 = _UPVALUE2_
  L14_129 = "."
  L13_128 = L13_128 .. L14_129 .. _UPVALUE3_.endPort
  L8_123[L13_128] = A5_120
  L13_128 = _UPVALUE0_
  L13_128 = L13_128.NIL
  if A6_121 == L13_128 then
    L13_128 = _UPVALUE0_
    L13_128 = L13_128.INVALID_ARGUMENT
    return L13_128
  end
  L13_128 = _UPVALUE11_
  if A6_121 ~= L13_128 then
    L13_128 = _UPVALUE12_
    if A6_121 ~= L13_128 then
      L13_128 = _UPVALUE0_
      L13_128 = L13_128.INVALID_ARGUMENT
      return L13_128
    end
  end
  L13_128 = _UPVALUE2_
  L14_129 = "."
  L13_128 = L13_128 .. L14_129 .. _UPVALUE3_.icmp
  L8_123[L13_128] = A6_121
  L13_128 = db
  L13_128 = L13_128.insert
  L14_129 = _UPVALUE2_
  L13_128 = L13_128(L14_129, L8_123)
  L14_129 = _UPVALUE0_
  L14_129 = L14_129.NIL
  if L13_128 == L14_129 then
    L14_129 = _UPVALUE0_
    L14_129 = L14_129.FAILURE
    return L14_129, 0
  end
  L14_129 = db
  L14_129 = L14_129.getAttributeWhere
  L14_129 = L14_129(_UPVALUE2_, _UPVALUE3_.resourceName .. " ='" .. A0_115 .. "' AND " .. _UPVALUE3_.objectAddress .. " ='" .. A2_117 .. "' AND " .. _UPVALUE3_.startPort .. " ='" .. A4_119 .. "' AND " .. _UPVALUE3_.endPort .. " ='" .. A5_120 .. "'", _UPVALUE13_)
  return _UPVALUE0_.SUCCESS, L14_129
end
function resourceConfigurationDelete(A0_130)
  if A0_130 == _UPVALUE0_.NIL or tonumber(A0_130) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_130) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.deleteRow(_UPVALUE1_, _UPVALUE2_, A0_130) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_130
  end
  return _UPVALUE0_.SUCCESS, A0_130
end
function resourceConfigurationGetAll()
  local L0_131, L1_132, L2_133
  L0_131 = db
  L0_131 = L0_131.getAttribute
  L1_132 = _UPVALUE0_
  L2_133 = _UPVALUE1_
  L0_131 = L0_131(L1_132, L2_133, _UPVALUE2_, _UPVALUE3_.accessMgmt)
  L1_132 = nil
  L2_133 = _UPVALUE4_
  if L0_131 == L2_133 then
    L2_133 = _UPVALUE5_
    L1_132 = L2_133.SSLVPN_REMOTEMANAGEMENT_DISABLED
  else
    L2_133 = _UPVALUE6_
    L1_132 = L2_133.SUCCESS
  end
  L2_133 = db
  L2_133 = L2_133.getTable
  L2_133 = L2_133(_UPVALUE7_, _UPVALUE6_.FALSE)
  if L2_133 == _UPVALUE6_.NIL then
    return _UPVALUE6_.FAILURE
  end
  return L1_132, L2_133
end
function resourceConfigurationDeleteAll()
  if db.deleteAllRows(_UPVALUE0_) == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS
end
function curResourceNameGet(A0_134)
  local L1_135, L2_136, L3_137
  L1_135 = _UPVALUE0_
  L1_135 = L1_135.NIL
  if A0_134 ~= L1_135 then
    L1_135 = tonumber
    L2_136 = A0_134
    L1_135 = L1_135(L2_136)
    L2_136 = _UPVALUE0_
    L2_136 = L2_136.NIL
  elseif L1_135 == L2_136 then
    L1_135 = _UPVALUE0_
    L1_135 = L1_135.INVALID_ARGUMENT
    return L1_135
  end
  L1_135 = db
  L1_135 = L1_135.existsRow
  L2_136 = _UPVALUE1_
  L3_137 = _UPVALUE2_
  L1_135 = L1_135(L2_136, L3_137, A0_134)
  L2_136 = _UPVALUE0_
  L2_136 = L2_136.FALSE
  if L1_135 == L2_136 then
    L1_135 = _UPVALUE0_
    L1_135 = L1_135.INVALID_ARGUMENT
    return L1_135
  end
  L1_135 = db
  L1_135 = L1_135.getAttribute
  L2_136 = _UPVALUE1_
  L3_137 = _UPVALUE2_
  L1_135 = L1_135(L2_136, L3_137, A0_134, _UPVALUE3_.resourceName)
  L2_136 = _UPVALUE0_
  L2_136 = L2_136.NIL
  if L1_135 == L2_136 then
    L2_136 = _UPVALUE0_
    L2_136 = L2_136.FAILURE
    return L2_136
  end
  L2_136 = 0
  L3_137 = db
  L3_137 = L3_137.getTable
  L3_137 = L3_137(_UPVALUE1_, _UPVALUE0_.FALSE)
  for _FORV_7_, _FORV_8_ in pairs(L3_137) do
    if L3_137[_FORV_7_].ResourceName == L1_135 then
      L2_136 = L2_136 + 1
    end
  end
  return _UPVALUE0_.SUCCESS, L1_135, L2_136
end
function resourceConfigurationGetCur(A0_138)
  local L1_139, L2_140, L3_141, L4_142, L5_143, L6_144, L7_145, L8_146, L9_147
  L1_139 = db
  L1_139 = L1_139.getRow
  L2_140 = _UPVALUE0_
  L3_141 = _UPVALUE1_
  L4_142 = A0_138
  L1_139 = L1_139(L2_140, L3_141, L4_142)
  L2_140 = _UPVALUE2_
  L2_140 = L2_140.NIL
  if L1_139 == L2_140 then
    L2_140 = _UPVALUE2_
    L2_140 = L2_140.FAILURE
    return L2_140
  end
  L2_140, L3_141, L4_142, L5_143, L6_144, L7_145, L8_146, L9_147 = nil, nil, nil, nil, nil, nil, nil, nil
  L2_140 = L1_139[_UPVALUE0_ .. "." .. _UPVALUE3_.resourceName]
  L4_142 = L1_139[_UPVALUE0_ .. "." .. _UPVALUE3_.icmp]
  L5_143 = L1_139[_UPVALUE0_ .. "." .. _UPVALUE3_.objectType]
  L6_144 = L1_139[_UPVALUE0_ .. "." .. _UPVALUE3_.objectAddress]
  L7_145 = L1_139[_UPVALUE0_ .. "." .. _UPVALUE3_.maskLength]
  L8_146 = L1_139[_UPVALUE0_ .. "." .. _UPVALUE3_.startPort]
  L9_147 = L1_139[_UPVALUE0_ .. "." .. _UPVALUE3_.endPort]
  return _UPVALUE2_.SUCCESS, L2_140, L4_142, L5_143, L6_144, L7_145, L8_146, L9_147
end
