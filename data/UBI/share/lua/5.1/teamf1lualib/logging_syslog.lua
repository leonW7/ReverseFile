local L0_0
L0_0 = module
L0_0("com.teamf1.core.logging.syslog", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).key = "_ROWID_"
;({}).keyValue = "1"
;({}).serverId = "serverId"
;({}).active = "Enable"
;({}).ipAddress = "serverName"
;({}).facilityBitmap = "facilityId"
;({}).severityBitmap = "severity"
function serverIdGet()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue, _UPVALUE1_.serverId)
  if L0_1 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, _UPVALUE3_, L0_1
end
function serverIdGetNext(A0_2)
  local L1_3, L2_4
  L1_3 = _UPVALUE0_
  L1_3 = L1_3.NIL
  if A0_2 ~= L1_3 then
    L1_3 = tonumber
    L2_4 = A0_2
    L1_3 = L1_3(L2_4)
    L2_4 = _UPVALUE0_
    L2_4 = L2_4.NIL
  elseif L1_3 == L2_4 then
    L1_3 = _UPVALUE0_
    L1_3 = L1_3.INVALID_ARGUMENT
    return L1_3
  end
  L1_3 = db
  L1_3 = L1_3.existsRow
  L2_4 = _UPVALUE1_
  L1_3 = L1_3(L2_4, _UPVALUE2_.key, A0_2)
  if L1_3 == false then
    L1_3 = _UPVALUE0_
    L1_3 = L1_3.INVALID_ARGUMENT
    return L1_3
  end
  L1_3 = db
  L1_3 = L1_3.getNextRowId
  L2_4 = A0_2
  L1_3 = L1_3(L2_4, _UPVALUE1_)
  L2_4 = _UPVALUE0_
  L2_4 = L2_4.NIL
  if L1_3 == L2_4 then
    L2_4 = _UPVALUE0_
    L2_4 = L2_4.TABLE_IS_FULL
    return L2_4
  end
  L2_4 = db
  L2_4 = L2_4.getAttribute
  L2_4 = L2_4(_UPVALUE1_, _UPVALUE2_.key, L1_3, _UPVALUE2_.serverId)
  if L2_4 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_3
  end
  return _UPVALUE0_.SUCCESS, L1_3, L2_4
end
function serverIdSet(A0_5, A1_6)
  local L3_7
  L3_7 = _UPVALUE0_
  L3_7 = L3_7.NOT_SUPPORTED
  return L3_7, A0_5
end
function serverIdDelete(A0_8, A1_9)
  local L3_10
  L3_10 = _UPVALUE0_
  L3_10 = L3_10.NOT_SUPPORTED
  return L3_10, A0_8
end
function isactiveEnabled()
  local L0_11
  L0_11 = db
  L0_11 = L0_11.getAttribute
  L0_11 = L0_11(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue, _UPVALUE1_.active)
  if L0_11 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ACTIVE
  end
  return _UPVALUE2_.SUCCESS, _UPVALUE3_, L0_11
end
function isactiveEnabledNext(A0_12)
  local L1_13, L2_14
  L1_13 = _UPVALUE0_
  L1_13 = L1_13.NIL
  if A0_12 ~= L1_13 then
    L1_13 = tonumber
    L2_14 = A0_12
    L1_13 = L1_13(L2_14)
    L2_14 = _UPVALUE0_
    L2_14 = L2_14.NIL
  elseif L1_13 == L2_14 then
    L1_13 = _UPVALUE0_
    L1_13 = L1_13.INVALID_ARGUMENT
    return L1_13
  end
  L1_13 = db
  L1_13 = L1_13.existsRow
  L2_14 = _UPVALUE1_
  L1_13 = L1_13(L2_14, _UPVALUE2_.key, A0_12)
  if L1_13 == false then
    L1_13 = _UPVALUE0_
    L1_13 = L1_13.INVALID_ARGUMENT
    return L1_13
  end
  L1_13 = db
  L1_13 = L1_13.getNextRowId
  L2_14 = A0_12
  L1_13 = L1_13(L2_14, _UPVALUE1_)
  L2_14 = _UPVALUE0_
  L2_14 = L2_14.NIL
  if L1_13 == L2_14 then
    L2_14 = _UPVALUE0_
    L2_14 = L2_14.TABLE_IS_FULL
    return L2_14
  end
  L2_14 = db
  L2_14 = L2_14.getAttribute
  L2_14 = L2_14(_UPVALUE1_, _UPVALUE2_.key, L1_13, _UPVALUE2_.active)
  if L2_14 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_13
  end
  return _UPVALUE0_.SUCCESS, L1_13, L2_14
end
function activeEnable(A0_15)
  if A0_15 == _UPVALUE0_.NIL or tonumber(A0_15) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_15) < _UPVALUE1_ or tonumber(A0_15) > _UPVALUE2_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE3_, _UPVALUE4_.key, A0_15, _UPVALUE4_.active, _UPVALUE5_) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_15
  end
  return _UPVALUE0_.SUCCESS, A0_15
end
function activeDisable(A0_16)
  if A0_16 == _UPVALUE0_.NIL or tonumber(A0_16) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_16) < _UPVALUE1_ or tonumber(A0_16) > _UPVALUE2_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE3_, _UPVALUE4_.key, A0_16, _UPVALUE4_.active, _UPVALUE5_) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_16
  end
  return _UPVALUE0_.SUCCESS, A0_16
end
function ipAddressGet()
  local L0_17
  L0_17 = db
  L0_17 = L0_17.getAttribute
  L0_17 = L0_17(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue, _UPVALUE1_.ipAddress)
  if L0_17 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, _UPVALUE3_, L0_17
end
function ipAddressGetNext(A0_18)
  local L1_19, L2_20
  L1_19 = _UPVALUE0_
  L1_19 = L1_19.NIL
  if A0_18 ~= L1_19 then
    L1_19 = tonumber
    L2_20 = A0_18
    L1_19 = L1_19(L2_20)
    L2_20 = _UPVALUE0_
    L2_20 = L2_20.NIL
  elseif L1_19 == L2_20 then
    L1_19 = _UPVALUE0_
    L1_19 = L1_19.INVALID_ARGUMENT
    return L1_19
  end
  L1_19 = db
  L1_19 = L1_19.existsRow
  L2_20 = _UPVALUE1_
  L1_19 = L1_19(L2_20, _UPVALUE2_.key, A0_18)
  if L1_19 == false then
    L1_19 = _UPVALUE0_
    L1_19 = L1_19.INVALID_ARGUMENT
    return L1_19
  end
  L1_19 = db
  L1_19 = L1_19.getNextRowId
  L2_20 = A0_18
  L1_19 = L1_19(L2_20, _UPVALUE1_)
  L2_20 = _UPVALUE0_
  L2_20 = L2_20.NIL
  if L1_19 == L2_20 then
    L2_20 = _UPVALUE0_
    L2_20 = L2_20.TABLE_IS_FULL
    return L2_20
  end
  L2_20 = db
  L2_20 = L2_20.getAttribute
  L2_20 = L2_20(_UPVALUE1_, _UPVALUE2_.key, L1_19, _UPVALUE2_.ipAddress)
  if L2_20 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_19
  end
  return _UPVALUE0_.SUCCESS, L1_19, L2_20
end
function ipAddressSet(A0_21, A1_22)
  if A0_21 == _UPVALUE0_.NIL or tonumber(A0_21) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_21) < _UPVALUE1_ or tonumber(A0_21) > _UPVALUE2_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_22 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE3_, _UPVALUE4_.key, A0_21, _UPVALUE4_.ipAddress, A1_22) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_21
  end
  return _UPVALUE0_.SUCCESS, A0_21
end
function facilityBitmapGet()
  local L0_23
  L0_23 = db
  L0_23 = L0_23.getAttribute
  L0_23 = L0_23(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue, _UPVALUE1_.facilityBitmap)
  if L0_23 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, _UPVALUE3_, L0_23
end
function facilityBitmapGetNext(A0_24)
  local L1_25, L2_26
  L1_25 = _UPVALUE0_
  L1_25 = L1_25.NIL
  if A0_24 ~= L1_25 then
    L1_25 = tonumber
    L2_26 = A0_24
    L1_25 = L1_25(L2_26)
    L2_26 = _UPVALUE0_
    L2_26 = L2_26.NIL
  elseif L1_25 == L2_26 then
    L1_25 = _UPVALUE0_
    L1_25 = L1_25.INVALID_ARGUMENT
    return L1_25
  end
  L1_25 = db
  L1_25 = L1_25.existsRow
  L2_26 = _UPVALUE1_
  L1_25 = L1_25(L2_26, _UPVALUE2_.key, A0_24)
  if L1_25 == false then
    L1_25 = _UPVALUE0_
    L1_25 = L1_25.INVALID_ARGUMENT
    return L1_25
  end
  L1_25 = db
  L1_25 = L1_25.getNextRowId
  L2_26 = A0_24
  L1_25 = L1_25(L2_26, _UPVALUE1_)
  L2_26 = _UPVALUE0_
  L2_26 = L2_26.NIL
  if L1_25 == L2_26 then
    L2_26 = _UPVALUE0_
    L2_26 = L2_26.TABLE_IS_FULL
    return L2_26
  end
  L2_26 = db
  L2_26 = L2_26.getAttribute
  L2_26 = L2_26(_UPVALUE1_, _UPVALUE2_.key, L1_25, _UPVALUE2_.facilityBitmap)
  if L2_26 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_25
  end
  return _UPVALUE0_.SUCCESS, L1_25, L2_26
end
function facilityBitmapSet(A0_27, A1_28)
  if A0_27 == _UPVALUE0_.NIL or tonumber(A0_27) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_27) < _UPVALUE1_ or tonumber(A0_27) > _UPVALUE2_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_28 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE3_, _UPVALUE4_.key, A0_27, _UPVALUE4_.facilityBitmap, A1_28) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_27
  end
  return _UPVALUE0_.SUCCESS, A0_27
end
function severityBitmapGet()
  local L0_29
  L0_29 = db
  L0_29 = L0_29.getAttribute
  L0_29 = L0_29(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue, _UPVALUE1_.severityBitmap)
  if L0_29 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, _UPVALUE3_, L0_29
end
function severityBitmapGetNext(A0_30)
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
  L2_32 = _UPVALUE1_
  L1_31 = L1_31(L2_32, _UPVALUE2_.key, A0_30)
  if L1_31 == false then
    L1_31 = _UPVALUE0_
    L1_31 = L1_31.INVALID_ARGUMENT
    return L1_31
  end
  L1_31 = db
  L1_31 = L1_31.getNextRowId
  L2_32 = A0_30
  L1_31 = L1_31(L2_32, _UPVALUE1_)
  L2_32 = _UPVALUE0_
  L2_32 = L2_32.NIL
  if L1_31 == L2_32 then
    L2_32 = _UPVALUE0_
    L2_32 = L2_32.TABLE_IS_FULL
    return L2_32
  end
  L2_32 = db
  L2_32 = L2_32.getAttribute
  L2_32 = L2_32(_UPVALUE1_, _UPVALUE2_.key, L1_31, _UPVALUE2_.severityBitmap)
  if L2_32 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_31
  end
  return _UPVALUE0_.SUCCESS, L1_31, L2_32
end
function severityBitmapSet(A0_33, A1_34)
  if A0_33 == _UPVALUE0_.NIL or tonumber(A0_33) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_33) < _UPVALUE1_ or tonumber(A0_33) > _UPVALUE2_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_34 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE3_, _UPVALUE4_.key, A0_33, _UPVALUE4_.severityBitmap, A1_34) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_33
  end
  return _UPVALUE0_.SUCCESS, A0_33
end
function syslogServerGet()
  local L0_35, L1_36, L2_37, L3_38, L4_39, L5_40
  L0_35 = {}
  L1_36 = db
  L1_36 = L1_36.getRow
  L2_37 = _UPVALUE0_
  L3_38 = _UPVALUE1_
  L3_38 = L3_38.key
  L4_39 = _UPVALUE1_
  L4_39 = L4_39.keyValue
  L1_36 = L1_36(L2_37, L3_38, L4_39)
  L0_35 = L1_36
  L1_36 = _UPVALUE2_
  L1_36 = L1_36.NIL
  if L0_35 == L1_36 then
    L1_36 = _UPVALUE2_
    L1_36 = L1_36.FAILURE
    return L1_36
  end
  L1_36, L2_37, L3_38, L4_39, L5_40 = nil, nil, nil, nil, nil
  L1_36 = L0_35[_UPVALUE0_ .. "." .. _UPVALUE1_.serverId]
  L2_37 = L0_35[_UPVALUE0_ .. "." .. _UPVALUE1_.active]
  L3_38 = L0_35[_UPVALUE0_ .. "." .. _UPVALUE1_.ipAddress]
  L4_39 = L0_35[_UPVALUE0_ .. "." .. _UPVALUE1_.facilityBitmap]
  L5_40 = L0_35[_UPVALUE0_ .. "." .. _UPVALUE1_.severityBitmap]
  if L1_36 == _UPVALUE2_.NIL or L2_37 == _UPVALUE2_.NIL or L3_38 == _UPVALUE2_.NIL or L4_39 == _UPVALUE2_.NIL or L5_40 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, _UPVALUE3_, L1_36, L2_37, L3_38, L4_39, L5_40
end
function syslogServerGetNext(A0_41)
  local L1_42, L2_43, L3_44, L4_45, L5_46, L6_47, L7_48
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
  L2_43 = _UPVALUE1_
  L3_44 = _UPVALUE2_
  L3_44 = L3_44.key
  L4_45 = A0_41
  L1_42 = L1_42(L2_43, L3_44, L4_45)
  if L1_42 == false then
    L1_42 = _UPVALUE0_
    L1_42 = L1_42.INVALID_ARGUMENT
    return L1_42
  end
  L1_42 = db
  L1_42 = L1_42.getNextRowId
  L2_43 = A0_41
  L3_44 = _UPVALUE1_
  L1_42 = L1_42(L2_43, L3_44)
  L2_43 = _UPVALUE0_
  L2_43 = L2_43.NIL
  if L1_42 == L2_43 then
    L2_43 = _UPVALUE0_
    L2_43 = L2_43.TABLE_IS_FULL
    return L2_43
  end
  L2_43 = {}
  L3_44 = db
  L3_44 = L3_44.getRow
  L4_45 = _UPVALUE1_
  L5_46 = _UPVALUE2_
  L5_46 = L5_46.key
  L6_47 = L1_42
  L3_44 = L3_44(L4_45, L5_46, L6_47)
  L2_43 = L3_44
  L3_44 = _UPVALUE0_
  L3_44 = L3_44.NIL
  if L2_43 == L3_44 then
    L3_44 = _UPVALUE0_
    L3_44 = L3_44.FAILURE
    return L3_44
  end
  L3_44, L4_45, L5_46, L6_47, L7_48 = nil, nil, nil, nil, nil
  L3_44 = L2_43[_UPVALUE1_ .. "." .. _UPVALUE2_.serverId]
  L4_45 = L2_43[_UPVALUE1_ .. "." .. _UPVALUE2_.active]
  L5_46 = L2_43[_UPVALUE1_ .. "." .. _UPVALUE2_.ipAddress]
  L6_47 = L2_43[_UPVALUE1_ .. "." .. _UPVALUE2_.facilityBitmap]
  L7_48 = L2_43[_UPVALUE1_ .. "." .. _UPVALUE2_.severityBitmap]
  if L3_44 == _UPVALUE0_.NIL or L4_45 == _UPVALUE0_.NIL or L5_46 == _UPVALUE0_.NIL or L6_47 == _UPVALUE0_.NIL or L7_48 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_41, L3_44, L4_45, L5_46, L6_47, L7_48
end
function syslogServerSet(A0_49, A1_50, A2_51, A3_52, A4_53, A5_54)
  local L6_55, L7_56, L8_57, L9_58
  L7_56 = _UPVALUE0_
  L7_56 = L7_56.NIL
  if A0_49 ~= L7_56 then
    L7_56 = tonumber
    L8_57 = A0_49
    L7_56 = L7_56(L8_57)
    L8_57 = _UPVALUE0_
    L8_57 = L8_57.NIL
  elseif L7_56 == L8_57 then
    L7_56 = _UPVALUE0_
    L7_56 = L7_56.INVALID_ARGUMENT
    return L7_56
  end
  L7_56 = tonumber
  L8_57 = A0_49
  L7_56 = L7_56(L8_57)
  L8_57 = _UPVALUE1_
  if not (L7_56 < L8_57) then
    L8_57 = _UPVALUE2_
  elseif L7_56 > L8_57 then
    L8_57 = _UPVALUE0_
    L8_57 = L8_57.INVALID_ARGUMENT
    return L8_57
  end
  L8_57 = _UPVALUE0_
  L8_57 = L8_57.NIL
  if A1_50 == L8_57 then
    L8_57 = _UPVALUE0_
    L8_57 = L8_57.INVALID_ARGUMENT
    return L8_57
  end
  L8_57 = tonumber
  L9_58 = A1_50
  L8_57 = L8_57(L9_58)
  L9_58 = _UPVALUE3_
  if not (L8_57 < L9_58) then
    L9_58 = _UPVALUE4_
  elseif L8_57 > L9_58 then
    L9_58 = _UPVALUE0_
    L9_58 = L9_58.INVALID_ARGUMENT
    return L9_58
  end
  L9_58 = _UPVALUE0_
  L9_58 = L9_58.NIL
  if A2_51 == L9_58 then
    L9_58 = _UPVALUE0_
    L9_58 = L9_58.INVALID_ARGUMENT
    return L9_58
  end
  L9_58 = _UPVALUE5_
  L9_58 = L9_58.isBoolean
  L9_58 = L9_58(A2_51)
  L6_55 = L9_58
  L9_58 = _UPVALUE0_
  L9_58 = L9_58.SUCCESS
  if L6_55 ~= L9_58 then
    L9_58 = _UPVALUE0_
    L9_58 = L9_58.INVALID_ARGUMENT
    return L9_58
  end
  L9_58 = _UPVALUE0_
  L9_58 = L9_58.NIL
  if A3_52 == L9_58 then
    L9_58 = _UPVALUE0_
    L9_58 = L9_58.INVALID_ARGUMENT
    return L9_58
  end
  L9_58 = _UPVALUE0_
  L9_58 = L9_58.NIL
  if A4_53 == L9_58 then
    L9_58 = _UPVALUE0_
    L9_58 = L9_58.INVALID_ARGUMENT
    return L9_58
  end
  L9_58 = _UPVALUE0_
  L9_58 = L9_58.NIL
  if A5_54 == L9_58 then
    L9_58 = _UPVALUE0_
    L9_58 = L9_58.INVALID_ARGUMENT
    return L9_58
  end
  L9_58 = db
  L9_58 = L9_58.setAttribute
  L9_58 = L9_58(_UPVALUE6_, _UPVALUE7_.key, A1_50, _UPVALUE7_.ipAddress, A3_52)
  if L9_58 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_49
  end
  L9_58 = db.setAttribute(_UPVALUE6_, _UPVALUE7_.key, A1_50, _UPVALUE7_.active, A2_51)
  if L9_58 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_49
  end
  L9_58 = db.setAttribute(_UPVALUE6_, _UPVALUE7_.key, A1_50, _UPVALUE7_.facilityBitmap, A4_53)
  if L9_58 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_49
  end
  L9_58 = db.setAttribute(_UPVALUE6_, _UPVALUE7_.key, A1_50, _UPVALUE7_.severityBitmap, A5_54)
  if L9_58 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_49
  end
  return _UPVALUE0_.SUCCESS, A0_49
end
function syslogServerCreate(A0_59, A1_60, A2_61, A3_62, A4_63)
  return _UPVALUE0_.NOT_SUPPORTED
end
function syslogServerDelete(A0_64)
  local L2_65
  L2_65 = _UPVALUE0_
  L2_65 = L2_65.NOT_SUPPORTED
  return L2_65, A0_64
end
function syslogServerGetAll()
  local L0_66
  L0_66 = {}
  L0_66 = db.getTable(_UPVALUE0_)
  if L0_66 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_66
end
function syslogServerSetAll(A0_67)
  local L1_68, L2_69, L3_70, L4_71, L5_72, L6_73, L7_74
  L1_68 = {}
  L2_69 = db
  L2_69 = L2_69.getTable
  L2_69 = L2_69(L3_70)
  for L6_73, L7_74 in L3_70(L4_71) do
    if A0_67["sysLogServer.Enable" .. L7_74["sysLogInfo.serverId"]] ~= _UPVALUE1_.NIL then
      L7_74["sysLogInfo.Enable"] = A0_67["sysLogServer.Enable" .. L7_74["sysLogInfo.serverId"]]
      if L7_74["sysLogInfo.Enable"] == "1" then
        L7_74["sysLogInfo.facilityId"] = A0_67["sysLogServer.facilityId" .. L7_74["sysLogInfo.serverId"]]
        L7_74["sysLogInfo.severity"] = A0_67["sysLogServer.severity" .. L7_74["sysLogInfo.serverId"]]
        L7_74["sysLogInfo.serverName"] = A0_67["sysLogServer.serverName" .. L7_74["sysLogInfo.serverId"]]
      end
      valid = db.update("sysLogInfo", L7_74, L7_74["sysLogInfo._ROWID_"])
      if valid == _UPVALUE1_.FALSE then
        break
      end
    end
  end
  return L3_70
end
