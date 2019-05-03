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
;({}).configure = "ospfEnable"
;({}).areaId = "areaId"
;({}).priority = "priority"
;({}).helloInterval = "helloInterval"
;({}).deadInterval = "deadInterval"
;({}).cost = "cost"
;({}).authenticationType = "authType"
;({}).textAuthenticationKey = "textAuthKey"
;({}).md5KeyId = "md5KeyId"
;({}).md5AuthenticationKey = "md5AuthKey"
;({}).lanEnable = "lanEnable"
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
  return _UPVALUE0_.NOT_SUPPORTED
end
function interfaceDelete(A0_19, A1_20)
  local L3_21, L4_22
  L3_21 = _UPVALUE0_
  L3_21 = L3_21.NOT_SUPPORTED
  L4_22 = 0
  return L3_21, L4_22, 0
end
function isconfigureEnabled()
  local L0_23, L1_24
  L1_24 = db
  L1_24 = L1_24.getNextRowId
  L1_24 = L1_24(_UPVALUE0_, _UPVALUE1_)
  L0_23 = L1_24
  L1_24 = db
  L1_24 = L1_24.getAttribute
  L1_24 = L1_24(_UPVALUE1_, _UPVALUE2_, L0_23, _UPVALUE3_.configure)
  if L1_24 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_23, L1_24
end
function isconfigureEnabledNext(A0_25)
  local L1_26, L2_27
  L1_26 = _UPVALUE0_
  L1_26 = L1_26.NIL
  if A0_25 == L1_26 then
    L1_26 = _UPVALUE0_
    L1_26 = L1_26.INVALID_ARGUMENT
    return L1_26
  end
  L1_26 = tonumber
  L2_27 = A0_25
  L1_26 = L1_26(L2_27)
  L2_27 = _UPVALUE0_
  L2_27 = L2_27.NIL
  if L1_26 == L2_27 then
    L1_26 = _UPVALUE0_
    L1_26 = L1_26.INVALID_ARGUMENT
    return L1_26
  end
  L1_26 = db
  L1_26 = L1_26.existsRow
  L2_27 = _UPVALUE1_
  L1_26 = L1_26(L2_27, _UPVALUE2_, A0_25)
  L2_27 = _UPVALUE0_
  L2_27 = L2_27.FALSE
  if L1_26 == L2_27 then
    L1_26 = _UPVALUE0_
    L1_26 = L1_26.NOT_EXIST
    return L1_26
  end
  L1_26 = nil
  L2_27 = db
  L2_27 = L2_27.getNextRowId
  L2_27 = L2_27(A0_25, _UPVALUE1_)
  L1_26 = L2_27
  L2_27 = _UPVALUE0_
  L2_27 = L2_27.NIL
  if L1_26 == L2_27 then
    L2_27 = _UPVALUE0_
    L2_27 = L2_27.NOT_EXIST
    return L2_27
  end
  L2_27 = db
  L2_27 = L2_27.getAttribute
  L2_27 = L2_27(_UPVALUE1_, _UPVALUE2_, L1_26, _UPVALUE3_.configure)
  if L2_27 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_26
  end
  return _UPVALUE0_.SUCCESS, L1_26, L2_27
end
function configureEnable(A0_28)
  if A0_28 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_28) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_28) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.NOT_EXIST
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_28, _UPVALUE3_.configure, _UPVALUE4_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_28
  end
  return _UPVALUE0_.SUCCESS, A0_28
end
function configureDisable(A0_29)
  if A0_29 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_29) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_29) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.NOT_EXIST
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_29, _UPVALUE3_.configure, _UPVALUE4_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_29
  end
  return _UPVALUE0_.SUCCESS, A0_29
end
function areaIdGet()
  local L0_30, L1_31
  L1_31 = db
  L1_31 = L1_31.getNextRowId
  L1_31 = L1_31(_UPVALUE0_, _UPVALUE1_)
  L0_30 = L1_31
  L1_31 = db
  L1_31 = L1_31.getAttribute
  L1_31 = L1_31(_UPVALUE1_, _UPVALUE2_, L0_30, _UPVALUE3_.areaId)
  if L1_31 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_30, L1_31
end
function areaIdGetNext(A0_32)
  local L1_33, L2_34
  L1_33 = _UPVALUE0_
  L1_33 = L1_33.NIL
  if A0_32 == L1_33 then
    L1_33 = _UPVALUE0_
    L1_33 = L1_33.INVALID_ARGUMENT
    return L1_33
  end
  L1_33 = tonumber
  L2_34 = A0_32
  L1_33 = L1_33(L2_34)
  L2_34 = _UPVALUE0_
  L2_34 = L2_34.NIL
  if L1_33 == L2_34 then
    L1_33 = _UPVALUE0_
    L1_33 = L1_33.INVALID_ARGUMENT
    return L1_33
  end
  L1_33 = db
  L1_33 = L1_33.existsRow
  L2_34 = _UPVALUE1_
  L1_33 = L1_33(L2_34, _UPVALUE2_, A0_32)
  L2_34 = _UPVALUE0_
  L2_34 = L2_34.FALSE
  if L1_33 == L2_34 then
    L1_33 = _UPVALUE0_
    L1_33 = L1_33.NOT_EXIST
    return L1_33
  end
  L1_33 = nil
  L2_34 = db
  L2_34 = L2_34.getNextRowId
  L2_34 = L2_34(A0_32, _UPVALUE1_)
  L1_33 = L2_34
  L2_34 = _UPVALUE0_
  L2_34 = L2_34.NIL
  if L1_33 == L2_34 then
    L2_34 = _UPVALUE0_
    L2_34 = L2_34.NOT_EXIST
    return L2_34
  end
  L2_34 = db
  L2_34 = L2_34.getAttribute
  L2_34 = L2_34(_UPVALUE1_, _UPVALUE2_, L1_33, _UPVALUE3_.areaId)
  if L2_34 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_33
  end
  return _UPVALUE0_.SUCCESS, L1_33, L2_34
end
function areaIdSet(A0_35, A1_36)
  if A0_35 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_35) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_35) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.NOT_EXIST
  end
  if A1_36 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_36) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_36) < _UPVALUE3_ or tonumber(A1_36) > _UPVALUE4_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_35, _UPVALUE5_.configure) == _UPVALUE6_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_35, _UPVALUE5_.areaId, A1_36) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_35
  end
  return _UPVALUE0_.SUCCESS, A0_35
end
function priorityGet()
  local L0_37, L1_38
  L1_38 = db
  L1_38 = L1_38.getNextRowId
  L1_38 = L1_38(_UPVALUE0_, _UPVALUE1_)
  L0_37 = L1_38
  L1_38 = db
  L1_38 = L1_38.getAttribute
  L1_38 = L1_38(_UPVALUE1_, _UPVALUE2_, L0_37, _UPVALUE3_.priority)
  if L1_38 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_37, L1_38
end
function priorityGetNext(A0_39)
  local L1_40, L2_41
  L1_40 = _UPVALUE0_
  L1_40 = L1_40.NIL
  if A0_39 == L1_40 then
    L1_40 = _UPVALUE0_
    L1_40 = L1_40.INVALID_ARGUMENT
    return L1_40
  end
  L1_40 = tonumber
  L2_41 = A0_39
  L1_40 = L1_40(L2_41)
  L2_41 = _UPVALUE0_
  L2_41 = L2_41.NIL
  if L1_40 == L2_41 then
    L1_40 = _UPVALUE0_
    L1_40 = L1_40.INVALID_ARGUMENT
    return L1_40
  end
  L1_40 = db
  L1_40 = L1_40.existsRow
  L2_41 = _UPVALUE1_
  L1_40 = L1_40(L2_41, _UPVALUE2_, A0_39)
  L2_41 = _UPVALUE0_
  L2_41 = L2_41.FALSE
  if L1_40 == L2_41 then
    L1_40 = _UPVALUE0_
    L1_40 = L1_40.NOT_EXIST
    return L1_40
  end
  L1_40 = nil
  L2_41 = db
  L2_41 = L2_41.getNextRowId
  L2_41 = L2_41(A0_39, _UPVALUE1_)
  L1_40 = L2_41
  L2_41 = _UPVALUE0_
  L2_41 = L2_41.NIL
  if L1_40 == L2_41 then
    L2_41 = _UPVALUE0_
    L2_41 = L2_41.NOT_EXIST
    return L2_41
  end
  L2_41 = db
  L2_41 = L2_41.getAttribute
  L2_41 = L2_41(_UPVALUE1_, _UPVALUE2_, L1_40, _UPVALUE3_.priority)
  if L2_41 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_40
  end
  return _UPVALUE0_.SUCCESS, L1_40, L2_41
end
function prioritySet(A0_42, A1_43)
  if A0_42 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_42) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_42) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.NOT_EXIST
  end
  if A1_43 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_43) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_43) < _UPVALUE3_ or tonumber(A1_43) > _UPVALUE4_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_42, _UPVALUE5_.configure) == _UPVALUE6_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_42, _UPVALUE5_.priority, A1_43) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_42
  end
  return _UPVALUE0_.SUCCESS, A0_42
end
function helloIntervalGet()
  local L0_44, L1_45
  L1_45 = db
  L1_45 = L1_45.getNextRowId
  L1_45 = L1_45(_UPVALUE0_, _UPVALUE1_)
  L0_44 = L1_45
  L1_45 = db
  L1_45 = L1_45.getAttribute
  L1_45 = L1_45(_UPVALUE1_, _UPVALUE2_, L0_44, _UPVALUE3_.helloInterval)
  if L1_45 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_44, L1_45
end
function helloIntervalGetNext(A0_46)
  local L1_47, L2_48
  L1_47 = _UPVALUE0_
  L1_47 = L1_47.NIL
  if A0_46 == L1_47 then
    L1_47 = _UPVALUE0_
    L1_47 = L1_47.INVALID_ARGUMENT
    return L1_47
  end
  L1_47 = tonumber
  L2_48 = A0_46
  L1_47 = L1_47(L2_48)
  L2_48 = _UPVALUE0_
  L2_48 = L2_48.NIL
  if L1_47 == L2_48 then
    L1_47 = _UPVALUE0_
    L1_47 = L1_47.INVALID_ARGUMENT
    return L1_47
  end
  L1_47 = db
  L1_47 = L1_47.existsRow
  L2_48 = _UPVALUE1_
  L1_47 = L1_47(L2_48, _UPVALUE2_, A0_46)
  L2_48 = _UPVALUE0_
  L2_48 = L2_48.FALSE
  if L1_47 == L2_48 then
    L1_47 = _UPVALUE0_
    L1_47 = L1_47.NOT_EXIST
    return L1_47
  end
  L1_47 = nil
  L2_48 = db
  L2_48 = L2_48.getNextRowId
  L2_48 = L2_48(A0_46, _UPVALUE1_)
  L1_47 = L2_48
  L2_48 = _UPVALUE0_
  L2_48 = L2_48.NIL
  if L1_47 == L2_48 then
    L2_48 = _UPVALUE0_
    L2_48 = L2_48.NOT_EXIST
    return L2_48
  end
  L2_48 = db
  L2_48 = L2_48.getAttribute
  L2_48 = L2_48(_UPVALUE1_, _UPVALUE2_, L1_47, _UPVALUE3_.helloInterval)
  if L2_48 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_47
  end
  return _UPVALUE0_.SUCCESS, L1_47, L2_48
end
function helloIntervalSet(A0_49, A1_50)
  if A0_49 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_49) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_49) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.NOT_EXIST
  end
  if A1_50 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_50) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_50) < _UPVALUE3_ or tonumber(A1_50) > _UPVALUE4_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_49, _UPVALUE5_.configure) == _UPVALUE6_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_49, _UPVALUE5_.helloInterval, A1_50) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_49
  end
  return _UPVALUE0_.SUCCESS, A0_49
end
function deadIntervalGet()
  local L0_51, L1_52
  L1_52 = db
  L1_52 = L1_52.getNextRowId
  L1_52 = L1_52(_UPVALUE0_, _UPVALUE1_)
  L0_51 = L1_52
  L1_52 = db
  L1_52 = L1_52.getAttribute
  L1_52 = L1_52(_UPVALUE1_, _UPVALUE2_, L0_51, _UPVALUE3_.deadInterval)
  if L1_52 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_51, L1_52
end
function deadIntervalGetNext(A0_53)
  local L1_54, L2_55
  L1_54 = _UPVALUE0_
  L1_54 = L1_54.NIL
  if A0_53 == L1_54 then
    L1_54 = _UPVALUE0_
    L1_54 = L1_54.INVALID_ARGUMENT
    return L1_54
  end
  L1_54 = tonumber
  L2_55 = A0_53
  L1_54 = L1_54(L2_55)
  L2_55 = _UPVALUE0_
  L2_55 = L2_55.NIL
  if L1_54 == L2_55 then
    L1_54 = _UPVALUE0_
    L1_54 = L1_54.INVALID_ARGUMENT
    return L1_54
  end
  L1_54 = db
  L1_54 = L1_54.existsRow
  L2_55 = _UPVALUE1_
  L1_54 = L1_54(L2_55, _UPVALUE2_, A0_53)
  L2_55 = _UPVALUE0_
  L2_55 = L2_55.FALSE
  if L1_54 == L2_55 then
    L1_54 = _UPVALUE0_
    L1_54 = L1_54.NOT_EXIST
    return L1_54
  end
  L1_54 = nil
  L2_55 = db
  L2_55 = L2_55.getNextRowId
  L2_55 = L2_55(A0_53, _UPVALUE1_)
  L1_54 = L2_55
  L2_55 = _UPVALUE0_
  L2_55 = L2_55.NIL
  if L1_54 == L2_55 then
    L2_55 = _UPVALUE0_
    L2_55 = L2_55.NOT_EXIST
    return L2_55
  end
  L2_55 = db
  L2_55 = L2_55.getAttribute
  L2_55 = L2_55(_UPVALUE1_, _UPVALUE2_, L1_54, _UPVALUE3_.deadInterval)
  if L2_55 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_54
  end
  return _UPVALUE0_.SUCCESS, L1_54, L2_55
end
function deadIntervalSet(A0_56, A1_57)
  if A0_56 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_56) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_56) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.NOT_EXIST
  end
  if A1_57 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_57) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_57) < _UPVALUE3_ or tonumber(A1_57) > _UPVALUE4_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_56, _UPVALUE5_.configure) == _UPVALUE6_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_56, _UPVALUE5_.deadInterval, A1_57) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_56
  end
  return _UPVALUE0_.SUCCESS, A0_56
end
function costGet()
  local L0_58, L1_59
  L1_59 = db
  L1_59 = L1_59.getNextRowId
  L1_59 = L1_59(_UPVALUE0_, _UPVALUE1_)
  L0_58 = L1_59
  L1_59 = db
  L1_59 = L1_59.getAttribute
  L1_59 = L1_59(_UPVALUE1_, _UPVALUE2_, L0_58, _UPVALUE3_.cost)
  if L1_59 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_58, L1_59
end
function costGetNext(A0_60)
  local L1_61, L2_62
  L1_61 = _UPVALUE0_
  L1_61 = L1_61.NIL
  if A0_60 == L1_61 then
    L1_61 = _UPVALUE0_
    L1_61 = L1_61.INVALID_ARGUMENT
    return L1_61
  end
  L1_61 = tonumber
  L2_62 = A0_60
  L1_61 = L1_61(L2_62)
  L2_62 = _UPVALUE0_
  L2_62 = L2_62.NIL
  if L1_61 == L2_62 then
    L1_61 = _UPVALUE0_
    L1_61 = L1_61.INVALID_ARGUMENT
    return L1_61
  end
  L1_61 = db
  L1_61 = L1_61.existsRow
  L2_62 = _UPVALUE1_
  L1_61 = L1_61(L2_62, _UPVALUE2_, A0_60)
  L2_62 = _UPVALUE0_
  L2_62 = L2_62.FALSE
  if L1_61 == L2_62 then
    L1_61 = _UPVALUE0_
    L1_61 = L1_61.NOT_EXIST
    return L1_61
  end
  L1_61 = nil
  L2_62 = db
  L2_62 = L2_62.getNextRowId
  L2_62 = L2_62(A0_60, _UPVALUE1_)
  L1_61 = L2_62
  L2_62 = _UPVALUE0_
  L2_62 = L2_62.NIL
  if L1_61 == L2_62 then
    L2_62 = _UPVALUE0_
    L2_62 = L2_62.NOT_EXIST
    return L2_62
  end
  L2_62 = db
  L2_62 = L2_62.getAttribute
  L2_62 = L2_62(_UPVALUE1_, _UPVALUE2_, L1_61, _UPVALUE3_.cost)
  if L2_62 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_61
  end
  return _UPVALUE0_.SUCCESS, L1_61, L2_62
end
function costSet(A0_63, A1_64)
  if A0_63 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_63) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_63) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.NOT_EXIST
  end
  if A1_64 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_64) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_64) < _UPVALUE3_ or tonumber(A1_64) > _UPVALUE4_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_63, _UPVALUE5_.configure) == _UPVALUE6_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_63, _UPVALUE5_.cost, A1_64) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_63
  end
  return _UPVALUE0_.SUCCESS, A0_63
end
function authenticationTypeGet()
  local L0_65, L1_66
  L1_66 = db
  L1_66 = L1_66.getNextRowId
  L1_66 = L1_66(_UPVALUE0_, _UPVALUE1_)
  L0_65 = L1_66
  L1_66 = db
  L1_66 = L1_66.getAttribute
  L1_66 = L1_66(_UPVALUE1_, _UPVALUE2_, L0_65, _UPVALUE3_.authenticationType)
  if L1_66 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_65, L1_66
end
function authenticationTypeGetNext(A0_67)
  local L1_68, L2_69
  L1_68 = _UPVALUE0_
  L1_68 = L1_68.NIL
  if A0_67 == L1_68 then
    L1_68 = _UPVALUE0_
    L1_68 = L1_68.INVALID_ARGUMENT
    return L1_68
  end
  L1_68 = tonumber
  L2_69 = A0_67
  L1_68 = L1_68(L2_69)
  L2_69 = _UPVALUE0_
  L2_69 = L2_69.NIL
  if L1_68 == L2_69 then
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
    L1_68 = L1_68.NOT_EXIST
    return L1_68
  end
  L1_68 = nil
  L2_69 = db
  L2_69 = L2_69.getNextRowId
  L2_69 = L2_69(A0_67, _UPVALUE1_)
  L1_68 = L2_69
  L2_69 = _UPVALUE0_
  L2_69 = L2_69.NIL
  if L1_68 == L2_69 then
    L2_69 = _UPVALUE0_
    L2_69 = L2_69.NOT_EXIST
    return L2_69
  end
  L2_69 = db
  L2_69 = L2_69.getAttribute
  L2_69 = L2_69(_UPVALUE1_, _UPVALUE2_, L1_68, _UPVALUE3_.authenticationType)
  if L2_69 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_68
  end
  return _UPVALUE0_.SUCCESS, L1_68, L2_69
end
function authenticationTypeSet(A0_70, A1_71)
  if A0_70 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_70) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_70) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.NOT_EXIST
  end
  if A1_71 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_71 ~= _UPVALUE3_ and A1_71 ~= _UPVALUE4_ and A1_71 ~= _UPVALUE5_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_70, _UPVALUE6_.configure) == _UPVALUE7_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_70, _UPVALUE6_.authenticationType, A1_71) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_70
  end
  return _UPVALUE0_.SUCCESS, A0_70
end
function textAuthenticationKeyGet()
  local L0_72, L1_73
  L1_73 = db
  L1_73 = L1_73.getNextRowId
  L1_73 = L1_73(_UPVALUE0_, _UPVALUE1_)
  L0_72 = L1_73
  L1_73 = db
  L1_73 = L1_73.getAttribute
  L1_73 = L1_73(_UPVALUE1_, _UPVALUE2_, L0_72, _UPVALUE3_.textAuthenticationKey)
  if L1_73 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_72, L1_73
end
function textAuthenticationKeyGetNext(A0_74)
  local L1_75, L2_76
  L1_75 = _UPVALUE0_
  L1_75 = L1_75.NIL
  if A0_74 == L1_75 then
    L1_75 = _UPVALUE0_
    L1_75 = L1_75.INVALID_ARGUMENT
    return L1_75
  end
  L1_75 = tonumber
  L2_76 = A0_74
  L1_75 = L1_75(L2_76)
  L2_76 = _UPVALUE0_
  L2_76 = L2_76.NIL
  if L1_75 == L2_76 then
    L1_75 = _UPVALUE0_
    L1_75 = L1_75.INVALID_ARGUMENT
    return L1_75
  end
  L1_75 = db
  L1_75 = L1_75.existsRow
  L2_76 = _UPVALUE1_
  L1_75 = L1_75(L2_76, _UPVALUE2_, A0_74)
  L2_76 = _UPVALUE0_
  L2_76 = L2_76.FALSE
  if L1_75 == L2_76 then
    L1_75 = _UPVALUE0_
    L1_75 = L1_75.NOT_EXIST
    return L1_75
  end
  L1_75 = nil
  L2_76 = db
  L2_76 = L2_76.getNextRowId
  L2_76 = L2_76(A0_74, _UPVALUE1_)
  L1_75 = L2_76
  L2_76 = _UPVALUE0_
  L2_76 = L2_76.NIL
  if L1_75 == L2_76 then
    L2_76 = _UPVALUE0_
    L2_76 = L2_76.NOT_EXIST
    return L2_76
  end
  L2_76 = db
  L2_76 = L2_76.getAttribute
  L2_76 = L2_76(_UPVALUE1_, _UPVALUE2_, L1_75, _UPVALUE3_.textAuthenticationKey)
  if L2_76 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_75
  end
  return _UPVALUE0_.SUCCESS, L1_75, L2_76
end
function textAuthenticationKeySet(A0_77, A1_78)
  if A0_77 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_77) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_77) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.NOT_EXIST
  end
  if A1_78 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if _UPVALUE3_.stringLengthCheck(_UPVALUE4_, _UPVALUE5_, A1_78) == _UPVALUE0_.FAILURE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_77, _UPVALUE6_.configure) == _UPVALUE7_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_77, _UPVALUE6_.authenticationType) ~= _UPVALUE8_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_77, _UPVALUE6_.textAuthenticationKey, A1_78) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_77
  end
  return _UPVALUE0_.SUCCESS, A0_77
end
function md5KeyIdGet()
  local L0_79, L1_80
  L1_80 = db
  L1_80 = L1_80.getNextRowId
  L1_80 = L1_80(_UPVALUE0_, _UPVALUE1_)
  L0_79 = L1_80
  L1_80 = db
  L1_80 = L1_80.getAttribute
  L1_80 = L1_80(_UPVALUE1_, _UPVALUE2_, L0_79, _UPVALUE3_.md5KeyId)
  if L1_80 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_79, L1_80
end
function md5KeyIdGetNext(A0_81)
  local L1_82, L2_83
  L1_82 = _UPVALUE0_
  L1_82 = L1_82.NIL
  if A0_81 == L1_82 then
    L1_82 = _UPVALUE0_
    L1_82 = L1_82.INVALID_ARGUMENT
    return L1_82
  end
  L1_82 = tonumber
  L2_83 = A0_81
  L1_82 = L1_82(L2_83)
  L2_83 = _UPVALUE0_
  L2_83 = L2_83.NIL
  if L1_82 == L2_83 then
    L1_82 = _UPVALUE0_
    L1_82 = L1_82.INVALID_ARGUMENT
    return L1_82
  end
  L1_82 = db
  L1_82 = L1_82.existsRow
  L2_83 = _UPVALUE1_
  L1_82 = L1_82(L2_83, _UPVALUE2_, A0_81)
  L2_83 = _UPVALUE0_
  L2_83 = L2_83.FALSE
  if L1_82 == L2_83 then
    L1_82 = _UPVALUE0_
    L1_82 = L1_82.NOT_EXIST
    return L1_82
  end
  L1_82 = nil
  L2_83 = db
  L2_83 = L2_83.getNextRowId
  L2_83 = L2_83(A0_81, _UPVALUE1_)
  L1_82 = L2_83
  L2_83 = _UPVALUE0_
  L2_83 = L2_83.NIL
  if L1_82 == L2_83 then
    L2_83 = _UPVALUE0_
    L2_83 = L2_83.NOT_EXIST
    return L2_83
  end
  L2_83 = db
  L2_83 = L2_83.getAttribute
  L2_83 = L2_83(_UPVALUE1_, _UPVALUE2_, L1_82, _UPVALUE3_.md5KeyId)
  if L2_83 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_82
  end
  return _UPVALUE0_.SUCCESS, L1_82, L2_83
end
function md5KeyIdSet(A0_84, A1_85)
  if A0_84 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_84) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_84) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.NOT_EXIST
  end
  if A1_85 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_85) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_85) < _UPVALUE3_ or tonumber(A1_85) > _UPVALUE4_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_84, _UPVALUE5_.configure) == _UPVALUE6_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_84, _UPVALUE5_.authenticationType) ~= _UPVALUE7_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_84, _UPVALUE5_.md5KeyId, A1_85) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_84
  end
  return _UPVALUE0_.SUCCESS, A0_84
end
function md5AuthenticationKeyGet()
  local L0_86, L1_87
  L1_87 = db
  L1_87 = L1_87.getNextRowId
  L1_87 = L1_87(_UPVALUE0_, _UPVALUE1_)
  L0_86 = L1_87
  L1_87 = db
  L1_87 = L1_87.getAttribute
  L1_87 = L1_87(_UPVALUE1_, _UPVALUE2_, L0_86, _UPVALUE3_.md5AuthenticationKey)
  if L1_87 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_86, L1_87
end
function md5AuthenticationKeyGetNext(A0_88)
  local L1_89, L2_90
  L1_89 = _UPVALUE0_
  L1_89 = L1_89.NIL
  if A0_88 == L1_89 then
    L1_89 = _UPVALUE0_
    L1_89 = L1_89.INVALID_ARGUMENT
    return L1_89
  end
  L1_89 = tonumber
  L2_90 = A0_88
  L1_89 = L1_89(L2_90)
  L2_90 = _UPVALUE0_
  L2_90 = L2_90.NIL
  if L1_89 == L2_90 then
    L1_89 = _UPVALUE0_
    L1_89 = L1_89.INVALID_ARGUMENT
    return L1_89
  end
  L1_89 = db
  L1_89 = L1_89.existsRow
  L2_90 = _UPVALUE1_
  L1_89 = L1_89(L2_90, _UPVALUE2_, A0_88)
  L2_90 = _UPVALUE0_
  L2_90 = L2_90.FALSE
  if L1_89 == L2_90 then
    L1_89 = _UPVALUE0_
    L1_89 = L1_89.NOT_EXIST
    return L1_89
  end
  L1_89 = nil
  L2_90 = db
  L2_90 = L2_90.getNextRowId
  L2_90 = L2_90(A0_88, _UPVALUE1_)
  L1_89 = L2_90
  L2_90 = _UPVALUE0_
  L2_90 = L2_90.NIL
  if L1_89 == L2_90 then
    L2_90 = _UPVALUE0_
    L2_90 = L2_90.NOT_EXIST
    return L2_90
  end
  L2_90 = db
  L2_90 = L2_90.getAttribute
  L2_90 = L2_90(_UPVALUE1_, _UPVALUE2_, L1_89, _UPVALUE3_.md5AuthenticationKey)
  if L2_90 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_89
  end
  return _UPVALUE0_.SUCCESS, L1_89, L2_90
end
function md5AuthenticationKeySet(A0_91, A1_92)
  if A0_91 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_91) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_91) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.NOT_EXIST
  end
  if A1_92 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if _UPVALUE3_.stringLengthCheck(_UPVALUE4_, _UPVALUE5_, A1_92) == _UPVALUE0_.FAILURE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_91, _UPVALUE6_.configure) == _UPVALUE7_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_91, _UPVALUE6_.authenticationType) ~= _UPVALUE8_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_91, _UPVALUE6_.md5AuthenticationKey, A1_92) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_91
  end
  return _UPVALUE0_.SUCCESS, A0_91
end
function routeGet()
  local L0_93, L1_94, L2_95, L3_96, L4_97, L5_98, L6_99, L7_100, L8_101, L9_102, L10_103, L11_104, L12_105
  L1_94 = db
  L1_94 = L1_94.getNextRowId
  L2_95 = _UPVALUE0_
  L3_96 = _UPVALUE1_
  L1_94 = L1_94(L2_95, L3_96)
  L0_93 = L1_94
  L1_94 = _UPVALUE2_
  L1_94 = L1_94.NIL
  if L0_93 == L1_94 then
    L1_94 = _UPVALUE2_
    L1_94 = L1_94.NOT_EXIST
    return L1_94
  end
  L1_94 = {}
  L2_95 = db
  L2_95 = L2_95.getRow
  L3_96 = _UPVALUE1_
  L4_97 = _UPVALUE3_
  L5_98 = L0_93
  L2_95 = L2_95(L3_96, L4_97, L5_98)
  L1_94 = L2_95
  L2_95 = _UPVALUE2_
  L2_95 = L2_95.NIL
  if L1_94 == L2_95 then
    L2_95 = _UPVALUE2_
    L2_95 = L2_95.FAILURE
    return L2_95
  end
  L2_95 = _UPVALUE1_
  L3_96 = "."
  L4_97 = _UPVALUE4_
  L4_97 = L4_97.interface
  L2_95 = L2_95 .. L3_96 .. L4_97
  L2_95 = L1_94[L2_95]
  L3_96 = _UPVALUE1_
  L4_97 = "."
  L5_98 = _UPVALUE4_
  L5_98 = L5_98.configure
  L3_96 = L3_96 .. L4_97 .. L5_98
  L3_96 = L1_94[L3_96]
  L4_97 = _UPVALUE1_
  L5_98 = "."
  L6_99 = _UPVALUE4_
  L6_99 = L6_99.areaId
  L4_97 = L4_97 .. L5_98 .. L6_99
  L4_97 = L1_94[L4_97]
  L5_98 = _UPVALUE1_
  L6_99 = "."
  L7_100 = _UPVALUE4_
  L7_100 = L7_100.priority
  L5_98 = L5_98 .. L6_99 .. L7_100
  L5_98 = L1_94[L5_98]
  L6_99 = _UPVALUE1_
  L7_100 = "."
  L8_101 = _UPVALUE4_
  L8_101 = L8_101.helloInterval
  L6_99 = L6_99 .. L7_100 .. L8_101
  L6_99 = L1_94[L6_99]
  L7_100 = _UPVALUE1_
  L8_101 = "."
  L9_102 = _UPVALUE4_
  L9_102 = L9_102.deadInterval
  L7_100 = L7_100 .. L8_101 .. L9_102
  L7_100 = L1_94[L7_100]
  L8_101 = _UPVALUE1_
  L9_102 = "."
  L10_103 = _UPVALUE4_
  L10_103 = L10_103.cost
  L8_101 = L8_101 .. L9_102 .. L10_103
  L8_101 = L1_94[L8_101]
  L9_102 = _UPVALUE1_
  L10_103 = "."
  L11_104 = _UPVALUE4_
  L11_104 = L11_104.authenticationType
  L9_102 = L9_102 .. L10_103 .. L11_104
  L9_102 = L1_94[L9_102]
  L10_103 = _UPVALUE1_
  L11_104 = "."
  L12_105 = _UPVALUE4_
  L12_105 = L12_105.textAuthenticationKey
  L10_103 = L10_103 .. L11_104 .. L12_105
  L10_103 = L1_94[L10_103]
  L11_104 = _UPVALUE1_
  L12_105 = "."
  L11_104 = L11_104 .. L12_105 .. _UPVALUE4_.md5KeyId
  L11_104 = L1_94[L11_104]
  L12_105 = _UPVALUE1_
  L12_105 = L12_105 .. "." .. _UPVALUE4_.md5AuthenticationKey
  L12_105 = L1_94[L12_105]
  return _UPVALUE2_.SUCCESS, L0_93, L2_95, L3_96, L4_97, L5_98, L6_99, L7_100, L8_101, L9_102, L10_103, L11_104, L12_105
end
function routeGetNext(A0_106)
  local L1_107, L2_108, L3_109, L4_110, L5_111, L6_112, L7_113, L8_114, L9_115, L10_116, L11_117, L12_118, L13_119
  L1_107 = _UPVALUE0_
  L1_107 = L1_107.NIL
  if A0_106 == L1_107 then
    L1_107 = _UPVALUE0_
    L1_107 = L1_107.INVALID_ARGUMENT
    return L1_107
  end
  L1_107 = tonumber
  L2_108 = A0_106
  L1_107 = L1_107(L2_108)
  L2_108 = _UPVALUE0_
  L2_108 = L2_108.NIL
  if L1_107 == L2_108 then
    L1_107 = _UPVALUE0_
    L1_107 = L1_107.INVALID_ARGUMENT
    return L1_107
  end
  L1_107 = db
  L1_107 = L1_107.existsRow
  L2_108 = _UPVALUE1_
  L3_109 = _UPVALUE2_
  L4_110 = A0_106
  L1_107 = L1_107(L2_108, L3_109, L4_110)
  L2_108 = _UPVALUE0_
  L2_108 = L2_108.FALSE
  if L1_107 == L2_108 then
    L1_107 = _UPVALUE0_
    L1_107 = L1_107.NOT_EXIST
    return L1_107
  end
  L1_107 = {}
  L2_108 = nil
  L3_109 = db
  L3_109 = L3_109.getNextRowId
  L4_110 = A0_106
  L5_111 = _UPVALUE1_
  L3_109 = L3_109(L4_110, L5_111)
  L2_108 = L3_109
  L3_109 = _UPVALUE0_
  L3_109 = L3_109.NIL
  if L2_108 == L3_109 then
    L3_109 = _UPVALUE0_
    L3_109 = L3_109.NOT_EXIST
    return L3_109
  end
  L3_109 = db
  L3_109 = L3_109.getRow
  L4_110 = _UPVALUE1_
  L5_111 = _UPVALUE2_
  L6_112 = L2_108
  L3_109 = L3_109(L4_110, L5_111, L6_112)
  L1_107 = L3_109
  L3_109 = _UPVALUE0_
  L3_109 = L3_109.NIL
  if L1_107 == L3_109 then
    L3_109 = _UPVALUE0_
    L3_109 = L3_109.FAILURE
    L4_110 = A0_106
    return L3_109, L4_110
  end
  L3_109 = _UPVALUE1_
  L4_110 = "."
  L5_111 = _UPVALUE3_
  L5_111 = L5_111.interface
  L3_109 = L3_109 .. L4_110 .. L5_111
  L3_109 = L1_107[L3_109]
  L4_110 = _UPVALUE1_
  L5_111 = "."
  L6_112 = _UPVALUE3_
  L6_112 = L6_112.configure
  L4_110 = L4_110 .. L5_111 .. L6_112
  L4_110 = L1_107[L4_110]
  L5_111 = _UPVALUE1_
  L6_112 = "."
  L7_113 = _UPVALUE3_
  L7_113 = L7_113.areaId
  L5_111 = L5_111 .. L6_112 .. L7_113
  L5_111 = L1_107[L5_111]
  L6_112 = _UPVALUE1_
  L7_113 = "."
  L8_114 = _UPVALUE3_
  L8_114 = L8_114.priority
  L6_112 = L6_112 .. L7_113 .. L8_114
  L6_112 = L1_107[L6_112]
  L7_113 = _UPVALUE1_
  L8_114 = "."
  L9_115 = _UPVALUE3_
  L9_115 = L9_115.helloInterval
  L7_113 = L7_113 .. L8_114 .. L9_115
  L7_113 = L1_107[L7_113]
  L8_114 = _UPVALUE1_
  L9_115 = "."
  L10_116 = _UPVALUE3_
  L10_116 = L10_116.deadInterval
  L8_114 = L8_114 .. L9_115 .. L10_116
  L8_114 = L1_107[L8_114]
  L9_115 = _UPVALUE1_
  L10_116 = "."
  L11_117 = _UPVALUE3_
  L11_117 = L11_117.cost
  L9_115 = L9_115 .. L10_116 .. L11_117
  L9_115 = L1_107[L9_115]
  L10_116 = _UPVALUE1_
  L11_117 = "."
  L12_118 = _UPVALUE3_
  L12_118 = L12_118.authenticationType
  L10_116 = L10_116 .. L11_117 .. L12_118
  L10_116 = L1_107[L10_116]
  L11_117 = _UPVALUE1_
  L12_118 = "."
  L13_119 = _UPVALUE3_
  L13_119 = L13_119.textAuthenticationKey
  L11_117 = L11_117 .. L12_118 .. L13_119
  L11_117 = L1_107[L11_117]
  L12_118 = _UPVALUE1_
  L13_119 = "."
  L12_118 = L12_118 .. L13_119 .. _UPVALUE3_.md5KeyId
  L12_118 = L1_107[L12_118]
  L13_119 = _UPVALUE1_
  L13_119 = L13_119 .. "." .. _UPVALUE3_.md5AuthenticationKey
  L13_119 = L1_107[L13_119]
  return _UPVALUE0_.SUCCESS, L2_108, L3_109, L4_110, L5_111, L6_112, L7_113, L8_114, L9_115, L10_116, L11_117, L12_118, L13_119
end
function routeGetCur(A0_120)
  local L1_121, L2_122, L3_123, L4_124, L5_125, L6_126, L7_127, L8_128, L9_129, L10_130, L11_131, L12_132, L13_133
  L1_121 = tonumber
  L2_122 = A0_120
  L1_121 = L1_121(L2_122)
  L2_122 = _UPVALUE0_
  L2_122 = L2_122.NIL
  if L1_121 == L2_122 then
    L1_121 = _UPVALUE0_
    L1_121 = L1_121.INVALID_ARGUMENT
    return L1_121
  end
  L1_121 = db
  L1_121 = L1_121.existsRow
  L2_122 = _UPVALUE1_
  L3_123 = _UPVALUE2_
  L4_124 = A0_120
  L1_121 = L1_121(L2_122, L3_123, L4_124)
  L2_122 = _UPVALUE0_
  L2_122 = L2_122.FALSE
  if L1_121 == L2_122 then
    L1_121 = _UPVALUE0_
    L1_121 = L1_121.NOT_EXIST
    return L1_121
  end
  L1_121 = {}
  L2_122 = db
  L2_122 = L2_122.getRow
  L3_123 = _UPVALUE1_
  L4_124 = _UPVALUE2_
  L5_125 = A0_120
  L2_122 = L2_122(L3_123, L4_124, L5_125)
  L1_121 = L2_122
  L2_122 = _UPVALUE0_
  L2_122 = L2_122.NIL
  if L1_121 == L2_122 then
    L2_122 = _UPVALUE0_
    L2_122 = L2_122.FAILURE
    L3_123 = A0_120
    return L2_122, L3_123
  end
  L2_122 = _UPVALUE1_
  L3_123 = "."
  L4_124 = _UPVALUE3_
  L4_124 = L4_124.interface
  L2_122 = L2_122 .. L3_123 .. L4_124
  L2_122 = L1_121[L2_122]
  L3_123 = _UPVALUE1_
  L4_124 = "."
  L5_125 = _UPVALUE3_
  L5_125 = L5_125.configure
  L3_123 = L3_123 .. L4_124 .. L5_125
  L3_123 = L1_121[L3_123]
  L4_124 = _UPVALUE1_
  L5_125 = "."
  L6_126 = _UPVALUE3_
  L6_126 = L6_126.areaId
  L4_124 = L4_124 .. L5_125 .. L6_126
  L4_124 = L1_121[L4_124]
  L5_125 = _UPVALUE1_
  L6_126 = "."
  L7_127 = _UPVALUE3_
  L7_127 = L7_127.priority
  L5_125 = L5_125 .. L6_126 .. L7_127
  L5_125 = L1_121[L5_125]
  L6_126 = _UPVALUE1_
  L7_127 = "."
  L8_128 = _UPVALUE3_
  L8_128 = L8_128.helloInterval
  L6_126 = L6_126 .. L7_127 .. L8_128
  L6_126 = L1_121[L6_126]
  L7_127 = _UPVALUE1_
  L8_128 = "."
  L9_129 = _UPVALUE3_
  L9_129 = L9_129.deadInterval
  L7_127 = L7_127 .. L8_128 .. L9_129
  L7_127 = L1_121[L7_127]
  L8_128 = _UPVALUE1_
  L9_129 = "."
  L10_130 = _UPVALUE3_
  L10_130 = L10_130.cost
  L8_128 = L8_128 .. L9_129 .. L10_130
  L8_128 = L1_121[L8_128]
  L9_129 = _UPVALUE1_
  L10_130 = "."
  L11_131 = _UPVALUE3_
  L11_131 = L11_131.authenticationType
  L9_129 = L9_129 .. L10_130 .. L11_131
  L9_129 = L1_121[L9_129]
  L10_130 = _UPVALUE1_
  L11_131 = "."
  L12_132 = _UPVALUE3_
  L12_132 = L12_132.textAuthenticationKey
  L10_130 = L10_130 .. L11_131 .. L12_132
  L10_130 = L1_121[L10_130]
  L11_131 = _UPVALUE1_
  L12_132 = "."
  L13_133 = _UPVALUE3_
  L13_133 = L13_133.md5KeyId
  L11_131 = L11_131 .. L12_132 .. L13_133
  L11_131 = L1_121[L11_131]
  L12_132 = _UPVALUE1_
  L13_133 = "."
  L12_132 = L12_132 .. L13_133 .. _UPVALUE3_.md5AuthenticationKey
  L12_132 = L1_121[L12_132]
  L13_133 = _UPVALUE1_
  L13_133 = L13_133 .. "." .. _UPVALUE3_.lanEnable
  L13_133 = L1_121[L13_133]
  return _UPVALUE0_.SUCCESS, A0_120, L2_122, L3_123, L4_124, L5_125, L6_126, L7_127, L8_128, L9_129, L10_130, L11_131, L12_132, L13_133
end
function routeGetAll()
  local L0_134
  L0_134 = {}
  L0_134 = db.getTable(_UPVALUE0_, false)
  if L0_134 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_134
end
function routeSet(A0_135, A1_136, A2_137, A3_138, A4_139, A5_140, A6_141, A7_142, A8_143, A9_144, A10_145, A11_146)
  local L12_147, L13_148
  L12_147 = _UPVALUE0_
  L12_147 = L12_147.NIL
  if A0_135 == L12_147 then
    L12_147 = _UPVALUE0_
    L12_147 = L12_147.INVALID_ARGUMENT
    return L12_147
  end
  L12_147 = tonumber
  L13_148 = A0_135
  L12_147 = L12_147(L13_148)
  L13_148 = _UPVALUE0_
  L13_148 = L13_148.NIL
  if L12_147 == L13_148 then
    L12_147 = _UPVALUE0_
    L12_147 = L12_147.INVALID_ARGUMENT
    return L12_147
  end
  L12_147 = db
  L12_147 = L12_147.existsRow
  L13_148 = _UPVALUE1_
  L12_147 = L12_147(L13_148, _UPVALUE2_, A0_135)
  L13_148 = _UPVALUE0_
  L13_148 = L13_148.FALSE
  if L12_147 == L13_148 then
    L12_147 = _UPVALUE0_
    L12_147 = L12_147.NOT_EXIST
    return L12_147
  end
  L12_147 = {}
  L13_148 = _UPVALUE0_
  L13_148 = L13_148.NIL
  if A1_136 == L13_148 then
    L13_148 = _UPVALUE0_
    L13_148 = L13_148.INVALID_ARGUMENT
    return L13_148
  end
  L13_148 = _UPVALUE3_
  L13_148 = L13_148.isBoolean
  L13_148 = L13_148(A1_136)
  valid = L13_148
  L13_148 = valid
  if L13_148 ~= _UPVALUE0_.SUCCESS then
    L13_148 = _UPVALUE0_
    L13_148 = L13_148.INVALID_ARGUMENT
    return L13_148
  end
  L13_148 = _UPVALUE1_
  L13_148 = L13_148 .. "." .. _UPVALUE4_.configure
  L12_147[L13_148] = A1_136
  L13_148 = _UPVALUE5_
  if A1_136 == L13_148 then
    L13_148 = _UPVALUE0_
    L13_148 = L13_148.NIL
    if A2_137 == L13_148 then
      L13_148 = _UPVALUE0_
      L13_148 = L13_148.INVALID_ARGUMENT
      return L13_148
    end
    L13_148 = tonumber
    L13_148 = L13_148(A2_137)
    if L13_148 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if L13_148 < _UPVALUE6_ or L13_148 > _UPVALUE7_ then
      return _UPVALUE8_.OSPF_INVALID_AREA_ID
    end
    L12_147[_UPVALUE1_ .. "." .. _UPVALUE4_.areaId] = A2_137
    if A3_138 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if tonumber(A3_138) == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if tonumber(A3_138) < _UPVALUE9_ or tonumber(A3_138) > _UPVALUE10_ then
      return _UPVALUE8_.OSPF_INVALID_PRIORITY
    end
    L12_147[_UPVALUE1_ .. "." .. _UPVALUE4_.priority] = A3_138
    if A4_139 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if tonumber(A4_139) == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if tonumber(A4_139) < _UPVALUE11_ or tonumber(A4_139) > _UPVALUE12_ then
      return _UPVALUE8_.OSPF_INVALID_HELLO_INTERVAL
    end
    L12_147[_UPVALUE1_ .. "." .. _UPVALUE4_.helloInterval] = A4_139
    if A5_140 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if tonumber(A5_140) == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if tonumber(A5_140) < _UPVALUE13_ or tonumber(A5_140) > _UPVALUE14_ then
      return _UPVALUE8_.OSPF_INVALID_DEAD_INTERVAL
    end
    L12_147[_UPVALUE1_ .. "." .. _UPVALUE4_.deadInterval] = A5_140
    if A6_141 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if tonumber(A6_141) == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if tonumber(A6_141) < _UPVALUE15_ or tonumber(A6_141) > _UPVALUE16_ then
      return _UPVALUE8_.OSPF_INVALID_COST
    end
    L12_147[_UPVALUE1_ .. "." .. _UPVALUE4_.cost] = A6_141
    if A7_142 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if A7_142 ~= _UPVALUE17_ and A7_142 ~= _UPVALUE18_ and A7_142 ~= _UPVALUE19_ then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    L12_147[_UPVALUE1_ .. "." .. _UPVALUE4_.authenticationType] = A7_142
    if A7_142 == _UPVALUE18_ then
      if A8_143 == _UPVALUE0_.NIL then
        return _UPVALUE0_.INVALID_ARGUMENT
      end
      if _UPVALUE3_.stringLengthCheck(_UPVALUE20_, _UPVALUE21_, A8_143) == _UPVALUE0_.FAILURE then
        return _UPVALUE0_.INVALID_ARGUMENT
      end
      L12_147[_UPVALUE1_ .. "." .. _UPVALUE4_.textAuthenticationKey] = A8_143
    end
    if A7_142 == _UPVALUE19_ then
      if A9_144 == _UPVALUE0_.NIL then
        return _UPVALUE0_.INVALID_ARGUMENT
      end
      if tonumber(A9_144) == _UPVALUE0_.NIL then
        return _UPVALUE0_.INVALID_ARGUMENT
      end
      if tonumber(A9_144) < _UPVALUE22_ or tonumber(A9_144) > _UPVALUE23_ then
        return _UPVALUE8_.OSPF_INVALID_MD5_KEY_ID
      end
      L12_147[_UPVALUE1_ .. "." .. _UPVALUE4_.md5KeyId] = A9_144
      if A10_145 == _UPVALUE0_.NIL then
        return _UPVALUE0_.INVALID_ARGUMENT
      end
      if _UPVALUE3_.stringLengthCheck(_UPVALUE24_, _UPVALUE25_, A10_145) == _UPVALUE0_.FAILURE then
        return _UPVALUE0_.INVALID_ARGUMENT
      end
      L12_147[_UPVALUE1_ .. "." .. _UPVALUE4_.md5AuthenticationKey] = A10_145
    end
    if A11_146 ~= _UPVALUE0_.NIL then
      valid = _UPVALUE3_.isBoolean(A11_146)
      if valid ~= _UPVALUE0_.SUCCESS then
        return _UPVALUE0_.INVALID_ARGUMENT
      end
      L12_147[_UPVALUE1_ .. "." .. _UPVALUE4_.lanEnable] = A11_146
    end
  end
  L13_148 = nil
  L13_148 = db.update(_UPVALUE1_, L12_147, A0_135)
  if L13_148 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_135
  end
  return _UPVALUE0_.SUCCESS, A0_135
end
function routeCreate(A0_149, A1_150, A2_151, A3_152, A4_153, A5_154, A6_155, A7_156, A8_157, A9_158, A10_159)
  local L12_160, L13_161
  L12_160 = _UPVALUE0_
  L12_160 = L12_160.NOT_SUPPORTED
  L13_161 = 0
  return L12_160, L13_161, 0
end
function routeDelete(A0_162)
  local L2_163, L3_164
  L2_163 = _UPVALUE0_
  L2_163 = L2_163.NOT_SUPPORTED
  L3_164 = 0
  return L2_163, L3_164, 0
end
