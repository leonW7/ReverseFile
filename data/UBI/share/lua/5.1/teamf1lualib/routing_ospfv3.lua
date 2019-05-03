local L0_0
L0_0 = module
L0_0("com.teamf1.core.routing.ospf", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/ospf_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).feature = "feature"
;({}).interface = "LogicalIfName"
;({}).configure = "ospf6Enable"
;({}).priority = "priority"
;({}).helloInterval = "helloInterval"
;({}).deadInterval = "deadInterval"
;({}).cost = "cost"
;({}).area = "areaId"
function isfeatureEnabled()
  local L1_1, L2_2
  L1_1 = _UPVALUE0_
  L1_1 = L1_1.NOT_SUPPORTED
  L2_2 = 0
  return L1_1, L2_2, 0
end
function isfeatureEnabledNext(A0_3)
  local L2_4, L3_5
  L2_4 = _UPVALUE0_
  L2_4 = L2_4.NOT_SUPPORTED
  L3_5 = 0
  return L2_4, L3_5, 0
end
function featureEnable(A0_6)
  local L2_7, L3_8
  L2_7 = _UPVALUE0_
  L2_7 = L2_7.NOT_SUPPORTED
  L3_8 = 0
  return L2_7, L3_8, 0
end
function featureDisable(A0_9)
  local L2_10, L3_11
  L2_10 = _UPVALUE0_
  L2_10 = L2_10.NOT_SUPPORTED
  L3_11 = 0
  return L2_10, L3_11, 0
end
function interfaceGet()
  local L0_12, L1_13
  L1_13 = db
  L1_13 = L1_13.getNextRowId
  L1_13 = L1_13(_UPVALUE0_, _UPVALUE1_)
  L0_12 = L1_13
  L1_13 = db
  L1_13 = L1_13.getAttribute
  L1_13 = L1_13(_UPVALUE1_, _UPVALUE2_, L0_12, _UPVALUE3_.interface)
  if L1_13 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_12, L1_13
end
function interfaceGetNext(A0_14)
  local L1_15, L2_16
  L1_15 = _UPVALUE0_
  L1_15 = L1_15.NIL
  if A0_14 == L1_15 then
    L1_15 = _UPVALUE0_
    L1_15 = L1_15.INVALID_ARGUMENT
    return L1_15
  end
  L1_15 = tonumber
  L2_16 = A0_14
  L1_15 = L1_15(L2_16)
  L2_16 = _UPVALUE0_
  L2_16 = L2_16.NIL
  if L1_15 == L2_16 then
    L1_15 = _UPVALUE0_
    L1_15 = L1_15.INVALID_ARGUMENT
    return L1_15
  end
  L1_15 = db
  L1_15 = L1_15.existsRow
  L2_16 = _UPVALUE1_
  L1_15 = L1_15(L2_16, _UPVALUE2_, A0_14)
  L2_16 = _UPVALUE0_
  L2_16 = L2_16.FALSE
  if L1_15 == L2_16 then
    L1_15 = _UPVALUE0_
    L1_15 = L1_15.NOT_EXIST
    return L1_15
  end
  L1_15 = nil
  L2_16 = db
  L2_16 = L2_16.getNextRowId
  L2_16 = L2_16(A0_14, _UPVALUE1_)
  L1_15 = L2_16
  L2_16 = _UPVALUE0_
  L2_16 = L2_16.NIL
  if L1_15 == L2_16 then
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.NOT_EXIST
    return L2_16
  end
  L2_16 = db
  L2_16 = L2_16.getAttribute
  L2_16 = L2_16(_UPVALUE1_, _UPVALUE2_, L1_15, _UPVALUE3_.interface)
  if L2_16 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_15
  end
  return _UPVALUE0_.SUCCESS, L1_15, L2_16
end
function interfaceSet(A0_17, A1_18)
  local L3_19, L4_20
  L3_19 = _UPVALUE0_
  L3_19 = L3_19.NOT_SUPPORTED
  L4_20 = 0
  return L3_19, L4_20, 0
end
function interfaceDelete(A0_21, A1_22)
  local L3_23, L4_24
  L3_23 = _UPVALUE0_
  L3_23 = L3_23.NOT_SUPPORTED
  L4_24 = 0
  return L3_23, L4_24, 0
end
function isconfigureEnabled()
  local L0_25, L1_26
  L1_26 = db
  L1_26 = L1_26.getNextRowId
  L1_26 = L1_26(_UPVALUE0_, _UPVALUE1_)
  L0_25 = L1_26
  L1_26 = db
  L1_26 = L1_26.getAttribute
  L1_26 = L1_26(_UPVALUE1_, _UPVALUE2_, L0_25, _UPVALUE3_.configure)
  if L1_26 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_25, L1_26
end
function isconfigureEnabledNext(A0_27)
  local L1_28, L2_29
  L1_28 = _UPVALUE0_
  L1_28 = L1_28.NIL
  if A0_27 == L1_28 then
    L1_28 = _UPVALUE0_
    L1_28 = L1_28.INVALID_ARGUMENT
    return L1_28
  end
  L1_28 = tonumber
  L2_29 = A0_27
  L1_28 = L1_28(L2_29)
  L2_29 = _UPVALUE0_
  L2_29 = L2_29.NIL
  if L1_28 == L2_29 then
    L1_28 = _UPVALUE0_
    L1_28 = L1_28.INVALID_ARGUMENT
    return L1_28
  end
  L1_28 = db
  L1_28 = L1_28.existsRow
  L2_29 = _UPVALUE1_
  L1_28 = L1_28(L2_29, _UPVALUE2_, A0_27)
  L2_29 = _UPVALUE0_
  L2_29 = L2_29.FALSE
  if L1_28 == L2_29 then
    L1_28 = _UPVALUE0_
    L1_28 = L1_28.NOT_EXIST
    return L1_28
  end
  L1_28 = nil
  L2_29 = db
  L2_29 = L2_29.getNextRowId
  L2_29 = L2_29(A0_27, _UPVALUE1_)
  L1_28 = L2_29
  L2_29 = _UPVALUE0_
  L2_29 = L2_29.NIL
  if L1_28 == L2_29 then
    L2_29 = _UPVALUE0_
    L2_29 = L2_29.NOT_EXIST
    return L2_29
  end
  L2_29 = db
  L2_29 = L2_29.getAttribute
  L2_29 = L2_29(_UPVALUE1_, _UPVALUE2_, L1_28, _UPVALUE3_.configure)
  if L2_29 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_28
  end
  return _UPVALUE0_.SUCCESS, L1_28, L2_29
end
function configureEnable(A0_30)
  if A0_30 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_30) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_30) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.NOT_EXIST
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_30, _UPVALUE3_.configure, _UPVALUE4_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_30
  end
  return _UPVALUE0_.SUCCESS, A0_30
end
function configureDisable(A0_31)
  if A0_31 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_31) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_31) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.NOT_EXIST
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_31, _UPVALUE3_.configure, _UPVALUE4_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_31
  end
  return _UPVALUE0_.SUCCESS, A0_31
end
function priorityGet()
  local L0_32, L1_33
  L1_33 = db
  L1_33 = L1_33.getNextRowId
  L1_33 = L1_33(_UPVALUE0_, _UPVALUE1_)
  L0_32 = L1_33
  L1_33 = db
  L1_33 = L1_33.getAttribute
  L1_33 = L1_33(_UPVALUE1_, _UPVALUE2_, L0_32, _UPVALUE3_.priority)
  if L1_33 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_32, L1_33
end
function priorityGetNext(A0_34)
  local L1_35, L2_36
  L1_35 = _UPVALUE0_
  L1_35 = L1_35.NIL
  if A0_34 == L1_35 then
    L1_35 = _UPVALUE0_
    L1_35 = L1_35.INVALID_ARGUMENT
    return L1_35
  end
  L1_35 = tonumber
  L2_36 = A0_34
  L1_35 = L1_35(L2_36)
  L2_36 = _UPVALUE0_
  L2_36 = L2_36.NIL
  if L1_35 == L2_36 then
    L1_35 = _UPVALUE0_
    L1_35 = L1_35.INVALID_ARGUMENT
    return L1_35
  end
  L1_35 = db
  L1_35 = L1_35.existsRow
  L2_36 = _UPVALUE1_
  L1_35 = L1_35(L2_36, _UPVALUE2_, A0_34)
  L2_36 = _UPVALUE0_
  L2_36 = L2_36.FALSE
  if L1_35 == L2_36 then
    L1_35 = _UPVALUE0_
    L1_35 = L1_35.NOT_EXIST
    return L1_35
  end
  L1_35 = nil
  L2_36 = db
  L2_36 = L2_36.getNextRowId
  L2_36 = L2_36(A0_34, _UPVALUE1_)
  L1_35 = L2_36
  L2_36 = _UPVALUE0_
  L2_36 = L2_36.NIL
  if L1_35 == L2_36 then
    L2_36 = _UPVALUE0_
    L2_36 = L2_36.NOT_EXIST
    return L2_36
  end
  L2_36 = db
  L2_36 = L2_36.getAttribute
  L2_36 = L2_36(_UPVALUE1_, _UPVALUE2_, L1_35, _UPVALUE3_.priority)
  if L2_36 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_35
  end
  return _UPVALUE0_.SUCCESS, L1_35, L2_36
end
function prioritySet(A0_37, A1_38)
  if A0_37 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_37) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_37) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.NOT_EXIST
  end
  if A1_38 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_38) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_38) < _UPVALUE3_ or tonumber(A1_38) > _UPVALUE4_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_37, _UPVALUE5_.configure) == _UPVALUE6_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_37, _UPVALUE5_.priority, A1_38) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_37
  end
  return _UPVALUE0_.SUCCESS, A0_37
end
function helloIntervalGet()
  local L0_39, L1_40
  L1_40 = db
  L1_40 = L1_40.getNextRowId
  L1_40 = L1_40(_UPVALUE0_, _UPVALUE1_)
  L0_39 = L1_40
  L1_40 = db
  L1_40 = L1_40.getAttribute
  L1_40 = L1_40(_UPVALUE1_, _UPVALUE2_, L0_39, _UPVALUE3_.helloInterval)
  if L1_40 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_39, L1_40
end
function helloIntervalGetNext(A0_41)
  local L1_42, L2_43
  L1_42 = _UPVALUE0_
  L1_42 = L1_42.NIL
  if A0_41 == L1_42 then
    L1_42 = _UPVALUE0_
    L1_42 = L1_42.INVALID_ARGUMENT
    return L1_42
  end
  L1_42 = tonumber
  L2_43 = A0_41
  L1_42 = L1_42(L2_43)
  L2_43 = _UPVALUE0_
  L2_43 = L2_43.NIL
  if L1_42 == L2_43 then
    L1_42 = _UPVALUE0_
    L1_42 = L1_42.INVALID_ARGUMENT
    return L1_42
  end
  L1_42 = db
  L1_42 = L1_42.existsRow
  L2_43 = _UPVALUE1_
  L1_42 = L1_42(L2_43, _UPVALUE2_, A0_41)
  L2_43 = _UPVALUE0_
  L2_43 = L2_43.FALSE
  if L1_42 == L2_43 then
    L1_42 = _UPVALUE0_
    L1_42 = L1_42.NOT_EXIST
    return L1_42
  end
  L1_42 = nil
  L2_43 = db
  L2_43 = L2_43.getNextRowId
  L2_43 = L2_43(A0_41, _UPVALUE1_)
  L1_42 = L2_43
  L2_43 = _UPVALUE0_
  L2_43 = L2_43.NIL
  if L1_42 == L2_43 then
    L2_43 = _UPVALUE0_
    L2_43 = L2_43.NOT_EXIST
    return L2_43
  end
  L2_43 = db
  L2_43 = L2_43.getAttribute
  L2_43 = L2_43(_UPVALUE1_, _UPVALUE2_, L1_42, _UPVALUE3_.helloInterval)
  if L2_43 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_42
  end
  return _UPVALUE0_.SUCCESS, L1_42, L2_43
end
function helloIntervalSet(A0_44, A1_45)
  if A0_44 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_44) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_44) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.NOT_EXIST
  end
  if A1_45 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_45) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_45) < _UPVALUE3_ or tonumber(A1_45) > _UPVALUE4_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_44, _UPVALUE5_.configure) == _UPVALUE6_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_44, _UPVALUE5_.helloInterval, A1_45) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_44
  end
  return _UPVALUE0_.SUCCESS, A0_44
end
function deadIntervalGet()
  local L0_46, L1_47
  L1_47 = db
  L1_47 = L1_47.getNextRowId
  L1_47 = L1_47(_UPVALUE0_, _UPVALUE1_)
  L0_46 = L1_47
  L1_47 = db
  L1_47 = L1_47.getAttribute
  L1_47 = L1_47(_UPVALUE1_, _UPVALUE2_, L0_46, _UPVALUE3_.deadInterval)
  if L1_47 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_46, L1_47
end
function deadIntervalGetNext(A0_48)
  local L1_49, L2_50
  L1_49 = _UPVALUE0_
  L1_49 = L1_49.NIL
  if A0_48 == L1_49 then
    L1_49 = _UPVALUE0_
    L1_49 = L1_49.INVALID_ARGUMENT
    return L1_49
  end
  L1_49 = tonumber
  L2_50 = A0_48
  L1_49 = L1_49(L2_50)
  L2_50 = _UPVALUE0_
  L2_50 = L2_50.NIL
  if L1_49 == L2_50 then
    L1_49 = _UPVALUE0_
    L1_49 = L1_49.INVALID_ARGUMENT
    return L1_49
  end
  L1_49 = db
  L1_49 = L1_49.existsRow
  L2_50 = _UPVALUE1_
  L1_49 = L1_49(L2_50, _UPVALUE2_, A0_48)
  L2_50 = _UPVALUE0_
  L2_50 = L2_50.FALSE
  if L1_49 == L2_50 then
    L1_49 = _UPVALUE0_
    L1_49 = L1_49.NOT_EXIST
    return L1_49
  end
  L1_49 = nil
  L2_50 = db
  L2_50 = L2_50.getNextRowId
  L2_50 = L2_50(A0_48, _UPVALUE1_)
  L1_49 = L2_50
  L2_50 = _UPVALUE0_
  L2_50 = L2_50.NIL
  if L1_49 == L2_50 then
    L2_50 = _UPVALUE0_
    L2_50 = L2_50.NOT_EXIST
    return L2_50
  end
  L2_50 = db
  L2_50 = L2_50.getAttribute
  L2_50 = L2_50(_UPVALUE1_, _UPVALUE2_, L1_49, _UPVALUE3_.deadInterval)
  if L2_50 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_49
  end
  return _UPVALUE0_.SUCCESS, L1_49, L2_50
end
function deadIntervalSet(A0_51, A1_52)
  if A0_51 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_51) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_51) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.NOT_EXIST
  end
  if A1_52 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_52) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_52) < _UPVALUE3_ or tonumber(A1_52) > _UPVALUE4_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_51, _UPVALUE5_.configure) == _UPVALUE6_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_51, _UPVALUE5_.deadInterval, A1_52) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_51
  end
  return _UPVALUE0_.SUCCESS, A0_51
end
function costGet()
  local L0_53, L1_54
  L1_54 = db
  L1_54 = L1_54.getNextRowId
  L1_54 = L1_54(_UPVALUE0_, _UPVALUE1_)
  L0_53 = L1_54
  L1_54 = db
  L1_54 = L1_54.getAttribute
  L1_54 = L1_54(_UPVALUE1_, _UPVALUE2_, L0_53, _UPVALUE3_.cost)
  if L1_54 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_53, L1_54
end
function costGetNext(A0_55)
  local L1_56, L2_57
  L1_56 = _UPVALUE0_
  L1_56 = L1_56.NIL
  if A0_55 == L1_56 then
    L1_56 = _UPVALUE0_
    L1_56 = L1_56.INVALID_ARGUMENT
    return L1_56
  end
  L1_56 = tonumber
  L2_57 = A0_55
  L1_56 = L1_56(L2_57)
  L2_57 = _UPVALUE0_
  L2_57 = L2_57.NIL
  if L1_56 == L2_57 then
    L1_56 = _UPVALUE0_
    L1_56 = L1_56.INVALID_ARGUMENT
    return L1_56
  end
  L1_56 = db
  L1_56 = L1_56.existsRow
  L2_57 = _UPVALUE1_
  L1_56 = L1_56(L2_57, _UPVALUE2_, A0_55)
  L2_57 = _UPVALUE0_
  L2_57 = L2_57.FALSE
  if L1_56 == L2_57 then
    L1_56 = _UPVALUE0_
    L1_56 = L1_56.NOT_EXIST
    return L1_56
  end
  L1_56 = nil
  L2_57 = db
  L2_57 = L2_57.getNextRowId
  L2_57 = L2_57(A0_55, _UPVALUE1_)
  L1_56 = L2_57
  L2_57 = _UPVALUE0_
  L2_57 = L2_57.NIL
  if L1_56 == L2_57 then
    L2_57 = _UPVALUE0_
    L2_57 = L2_57.NOT_EXIST
    return L2_57
  end
  L2_57 = db
  L2_57 = L2_57.getAttribute
  L2_57 = L2_57(_UPVALUE1_, _UPVALUE2_, L1_56, _UPVALUE3_.cost)
  if L2_57 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_56
  end
  return _UPVALUE0_.SUCCESS, L1_56, L2_57
end
function costSet(A0_58, A1_59)
  if A0_58 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_58) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_58) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.NOT_EXIST
  end
  if A1_59 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_59) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_59) < _UPVALUE3_ or tonumber(A1_59) > _UPVALUE4_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_58, _UPVALUE5_.configure) == _UPVALUE6_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_58, _UPVALUE5_.cost, A1_59) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_58
  end
  return _UPVALUE0_.SUCCESS, A0_58
end
function routeGet()
  local L0_60, L1_61, L2_62, L3_63, L4_64, L5_65, L6_66, L7_67
  L0_60 = {}
  L1_61 = nil
  L2_62 = db
  L2_62 = L2_62.getNextRowId
  L3_63 = _UPVALUE0_
  L4_64 = _UPVALUE1_
  L2_62 = L2_62(L3_63, L4_64)
  L1_61 = L2_62
  L2_62 = _UPVALUE2_
  L2_62 = L2_62.NIL
  if L1_61 == L2_62 then
    L2_62 = _UPVALUE2_
    L2_62 = L2_62.NOT_EXIST
    return L2_62
  end
  L2_62 = db
  L2_62 = L2_62.getRow
  L3_63 = _UPVALUE1_
  L4_64 = _UPVALUE3_
  L5_65 = L1_61
  L2_62 = L2_62(L3_63, L4_64, L5_65)
  L0_60 = L2_62
  L2_62 = _UPVALUE2_
  L2_62 = L2_62.NIL
  if L0_60 == L2_62 then
    L2_62 = _UPVALUE2_
    L2_62 = L2_62.FAILURE
    return L2_62
  end
  L2_62 = _UPVALUE1_
  L3_63 = "."
  L4_64 = _UPVALUE4_
  L4_64 = L4_64.interface
  L2_62 = L2_62 .. L3_63 .. L4_64
  L2_62 = L0_60[L2_62]
  L3_63 = _UPVALUE1_
  L4_64 = "."
  L5_65 = _UPVALUE4_
  L5_65 = L5_65.configure
  L3_63 = L3_63 .. L4_64 .. L5_65
  L3_63 = L0_60[L3_63]
  L4_64 = _UPVALUE1_
  L5_65 = "."
  L6_66 = _UPVALUE4_
  L6_66 = L6_66.priority
  L4_64 = L4_64 .. L5_65 .. L6_66
  L4_64 = L0_60[L4_64]
  L5_65 = _UPVALUE1_
  L6_66 = "."
  L7_67 = _UPVALUE4_
  L7_67 = L7_67.helloInterval
  L5_65 = L5_65 .. L6_66 .. L7_67
  L5_65 = L0_60[L5_65]
  L6_66 = _UPVALUE1_
  L7_67 = "."
  L6_66 = L6_66 .. L7_67 .. _UPVALUE4_.deadInterval
  L6_66 = L0_60[L6_66]
  L7_67 = _UPVALUE1_
  L7_67 = L7_67 .. "." .. _UPVALUE4_.cost
  L7_67 = L0_60[L7_67]
  return _UPVALUE2_.SUCCESS, L1_61, L2_62, L3_63, L4_64, L5_65, L6_66, L7_67
end
function routeGetNext(A0_68)
  local L1_69, L2_70, L3_71, L4_72, L5_73, L6_74, L7_75, L8_76
  L1_69 = _UPVALUE0_
  L1_69 = L1_69.NIL
  if A0_68 == L1_69 then
    L1_69 = _UPVALUE0_
    L1_69 = L1_69.INVALID_ARGUMENT
    return L1_69
  end
  L1_69 = tonumber
  L2_70 = A0_68
  L1_69 = L1_69(L2_70)
  L2_70 = _UPVALUE0_
  L2_70 = L2_70.NIL
  if L1_69 == L2_70 then
    L1_69 = _UPVALUE0_
    L1_69 = L1_69.INVALID_ARGUMENT
    return L1_69
  end
  L1_69 = db
  L1_69 = L1_69.existsRow
  L2_70 = _UPVALUE1_
  L3_71 = _UPVALUE2_
  L4_72 = A0_68
  L1_69 = L1_69(L2_70, L3_71, L4_72)
  L2_70 = _UPVALUE0_
  L2_70 = L2_70.FALSE
  if L1_69 == L2_70 then
    L1_69 = _UPVALUE0_
    L1_69 = L1_69.NOT_EXIST
    return L1_69
  end
  L1_69 = nil
  L2_70 = db
  L2_70 = L2_70.getNextRowId
  L3_71 = A0_68
  L4_72 = _UPVALUE1_
  L2_70 = L2_70(L3_71, L4_72)
  L1_69 = L2_70
  L2_70 = _UPVALUE0_
  L2_70 = L2_70.NIL
  if L1_69 == L2_70 then
    L2_70 = _UPVALUE0_
    L2_70 = L2_70.NOT_EXIST
    return L2_70
  end
  L2_70 = {}
  L3_71 = db
  L3_71 = L3_71.getRow
  L4_72 = _UPVALUE1_
  L5_73 = _UPVALUE2_
  L6_74 = L1_69
  L3_71 = L3_71(L4_72, L5_73, L6_74)
  L2_70 = L3_71
  L3_71 = _UPVALUE0_
  L3_71 = L3_71.NIL
  if L2_70 == L3_71 then
    L3_71 = _UPVALUE0_
    L3_71 = L3_71.FAILURE
    L4_72 = A0_68
    return L3_71, L4_72
  end
  L3_71 = _UPVALUE1_
  L4_72 = "."
  L5_73 = _UPVALUE3_
  L5_73 = L5_73.interface
  L3_71 = L3_71 .. L4_72 .. L5_73
  L3_71 = L2_70[L3_71]
  L4_72 = _UPVALUE1_
  L5_73 = "."
  L6_74 = _UPVALUE3_
  L6_74 = L6_74.configure
  L4_72 = L4_72 .. L5_73 .. L6_74
  L4_72 = L2_70[L4_72]
  L5_73 = _UPVALUE1_
  L6_74 = "."
  L7_75 = _UPVALUE3_
  L7_75 = L7_75.priority
  L5_73 = L5_73 .. L6_74 .. L7_75
  L5_73 = L2_70[L5_73]
  L6_74 = _UPVALUE1_
  L7_75 = "."
  L8_76 = _UPVALUE3_
  L8_76 = L8_76.helloInterval
  L6_74 = L6_74 .. L7_75 .. L8_76
  L6_74 = L2_70[L6_74]
  L7_75 = _UPVALUE1_
  L8_76 = "."
  L7_75 = L7_75 .. L8_76 .. _UPVALUE3_.deadInterval
  L7_75 = L2_70[L7_75]
  L8_76 = _UPVALUE1_
  L8_76 = L8_76 .. "." .. _UPVALUE3_.cost
  L8_76 = L2_70[L8_76]
  return _UPVALUE0_.SUCCESS, L1_69, L3_71, L4_72, L5_73, L6_74, L7_75, L8_76
end
function routeGetCur(A0_77)
  local L1_78, L2_79, L3_80, L4_81, L5_82, L6_83, L7_84
  L1_78 = _UPVALUE0_
  L1_78 = L1_78.NIL
  if A0_77 == L1_78 then
    L1_78 = _UPVALUE0_
    L1_78 = L1_78.INVALID_ARGUMENT
    return L1_78
  end
  L1_78 = tonumber
  L2_79 = A0_77
  L1_78 = L1_78(L2_79)
  L2_79 = _UPVALUE0_
  L2_79 = L2_79.NIL
  if L1_78 == L2_79 then
    L1_78 = _UPVALUE0_
    L1_78 = L1_78.INVALID_ARGUMENT
    return L1_78
  end
  L1_78 = db
  L1_78 = L1_78.existsRow
  L2_79 = _UPVALUE1_
  L3_80 = _UPVALUE2_
  L4_81 = A0_77
  L1_78 = L1_78(L2_79, L3_80, L4_81)
  L2_79 = _UPVALUE0_
  L2_79 = L2_79.FALSE
  if L1_78 == L2_79 then
    L1_78 = _UPVALUE0_
    L1_78 = L1_78.NOT_EXIST
    return L1_78
  end
  L1_78 = {}
  L2_79 = db
  L2_79 = L2_79.getRow
  L3_80 = _UPVALUE1_
  L4_81 = _UPVALUE2_
  L5_82 = A0_77
  L2_79 = L2_79(L3_80, L4_81, L5_82)
  L1_78 = L2_79
  L2_79 = _UPVALUE0_
  L2_79 = L2_79.NIL
  if L1_78 == L2_79 then
    L2_79 = _UPVALUE0_
    L2_79 = L2_79.FAILURE
    L3_80 = A0_77
    return L2_79, L3_80
  end
  L2_79 = _UPVALUE1_
  L3_80 = "."
  L4_81 = _UPVALUE3_
  L4_81 = L4_81.interface
  L2_79 = L2_79 .. L3_80 .. L4_81
  L2_79 = L1_78[L2_79]
  L3_80 = _UPVALUE1_
  L4_81 = "."
  L5_82 = _UPVALUE3_
  L5_82 = L5_82.configure
  L3_80 = L3_80 .. L4_81 .. L5_82
  L3_80 = L1_78[L3_80]
  L4_81 = _UPVALUE1_
  L5_82 = "."
  L6_83 = _UPVALUE3_
  L6_83 = L6_83.priority
  L4_81 = L4_81 .. L5_82 .. L6_83
  L4_81 = L1_78[L4_81]
  L5_82 = _UPVALUE1_
  L6_83 = "."
  L7_84 = _UPVALUE3_
  L7_84 = L7_84.helloInterval
  L5_82 = L5_82 .. L6_83 .. L7_84
  L5_82 = L1_78[L5_82]
  L6_83 = _UPVALUE1_
  L7_84 = "."
  L6_83 = L6_83 .. L7_84 .. _UPVALUE3_.deadInterval
  L6_83 = L1_78[L6_83]
  L7_84 = _UPVALUE1_
  L7_84 = L7_84 .. "." .. _UPVALUE3_.cost
  L7_84 = L1_78[L7_84]
  return _UPVALUE0_.SUCCESS, A0_77, L2_79, L3_80, L4_81, L5_82, L6_83, L7_84
end
function routeGetAll()
  local L0_85
  L0_85 = {}
  L0_85 = db.getTable(_UPVALUE0_, false)
  if L0_85 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_85
end
function routeSet(A0_86, A1_87, A2_88, A3_89, A4_90, A5_91)
  local L6_92
  L6_92 = _UPVALUE0_
  L6_92 = L6_92.NIL
  if A0_86 == L6_92 then
    L6_92 = _UPVALUE0_
    L6_92 = L6_92.INVALID_ARGUMENT
    return L6_92
  end
  L6_92 = tonumber
  L6_92 = L6_92(A0_86)
  if L6_92 == _UPVALUE0_.NIL then
    L6_92 = _UPVALUE0_
    L6_92 = L6_92.INVALID_ARGUMENT
    return L6_92
  end
  L6_92 = db
  L6_92 = L6_92.existsRow
  L6_92 = L6_92(_UPVALUE1_, _UPVALUE2_, A0_86)
  if L6_92 == _UPVALUE0_.FALSE then
    L6_92 = _UPVALUE0_
    L6_92 = L6_92.NOT_EXIST
    return L6_92
  end
  L6_92 = {}
  if A1_87 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L6_92[_UPVALUE1_ .. "." .. _UPVALUE3_.configure] = A1_87
  valid = _UPVALUE4_.isBoolean(A1_87)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L6_92[_UPVALUE1_ .. "." .. _UPVALUE3_.configure] = A1_87
  if A1_87 == _UPVALUE5_ then
    if A2_88 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if tonumber(A2_88) == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if tonumber(A2_88) < _UPVALUE6_ or tonumber(A2_88) > _UPVALUE7_ then
      return _UPVALUE8_.OSPFV3_INVALID_PRIORITY
    end
    L6_92[_UPVALUE1_ .. "." .. _UPVALUE3_.priority] = A2_88
    if A3_89 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if tonumber(A3_89) == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if tonumber(A3_89) < _UPVALUE9_ or tonumber(A3_89) > _UPVALUE10_ then
      return _UPVALUE8_.OSPF_INVALID_HELLO_INTERVAL
    end
    L6_92[_UPVALUE1_ .. "." .. _UPVALUE3_.helloInterval] = A3_89
    if A4_90 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if tonumber(A4_90) == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if tonumber(A4_90) < _UPVALUE11_ or tonumber(A4_90) > _UPVALUE12_ then
      return _UPVALUE8_.OSPF_INVALID_DEAD_INTERVAL
    end
    L6_92[_UPVALUE1_ .. "." .. _UPVALUE3_.deadInterval] = A4_90
    if A5_91 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if tonumber(A5_91) == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if tonumber(A5_91) < _UPVALUE13_ or tonumber(A5_91) > _UPVALUE14_ then
      return _UPVALUE8_.OSPF_INVALID_COST
    end
    L6_92[_UPVALUE1_ .. "." .. _UPVALUE3_.cost] = A5_91
  end
  status = db.update(_UPVALUE1_, L6_92, A0_86)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_86
  end
  return _UPVALUE0_.SUCCESS, A0_86
end
function routeCreate(A0_93, A1_94, A2_95, A3_96, A4_97, A5_98, A6_99, A7_100, A8_101, A9_102, A10_103)
  local L12_104, L13_105
  L12_104 = _UPVALUE0_
  L12_104 = L12_104.NOT_SUPPORTED
  L13_105 = 0
  return L12_104, L13_105, 0
end
function routeDelete(A0_106)
  local L2_107, L3_108
  L2_107 = _UPVALUE0_
  L2_107 = L2_107.NOT_SUPPORTED
  L3_108 = 0
  return L2_107, L3_108, 0
end
