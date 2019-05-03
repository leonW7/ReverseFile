local L0_0
L0_0 = module
L0_0("com.teamf1.core.routing.rip", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/rip_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).direction = "Direction"
;({}).version = "Version"
;({}).authentication = "AuthenticationType"
;({}).firstKeyId = "FirstKeyId"
;({}).firstAuthenticationKey = "FirstAuthenticationKeyId"
;({}).firstKeyFrom = "FirstKeyFrom"
;({}).firstKeyTo = "FirstKeyTo"
;({}).secondKeyId = "SecondKeyId"
;({}).secondAuthenticationKey = "SecondAuthenticationKeyId"
;({}).secondKeyFrom = "SecondKeyFrom"
;({}).secondKeyTo = "SecondKeyTo"
function directionGet()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.direction)
  if L0_1 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_1
end
function directionGetNext(A0_2)
  local L2_3, L3_4
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.NOT_SUPPORTED
  L3_4 = 0
  return L2_3, L3_4, 0
end
function directionSet(A0_5, A1_6)
  local L2_7, L3_8
  L2_7 = _UPVALUE0_
  L2_7 = L2_7.NIL
  if A1_6 == L2_7 then
    L2_7 = _UPVALUE0_
    L2_7 = L2_7.INVALID_ARGUMENT
    return L2_7
  end
  L2_7 = tonumber
  L3_8 = A1_6
  L2_7 = L2_7(L3_8)
  L3_8 = _UPVALUE0_
  L3_8 = L3_8.NIL
  if L2_7 == L3_8 then
    L3_8 = _UPVALUE0_
    L3_8 = L3_8.INVALID_ARGUMENT
    return L3_8
  end
  L3_8 = _UPVALUE1_
  if L2_7 ~= L3_8 then
    L3_8 = _UPVALUE2_
    if L2_7 ~= L3_8 then
      L3_8 = _UPVALUE3_
      if L2_7 ~= L3_8 then
        L3_8 = _UPVALUE4_
        if L2_7 ~= L3_8 then
          L3_8 = _UPVALUE0_
          L3_8 = L3_8.INVALID_ARGUMENT
          return L3_8
        end
      end
    end
  end
  L3_8 = nil
  L3_8 = db.setAttribute(_UPVALUE5_, _UPVALUE6_, _UPVALUE7_, _UPVALUE8_.direction, A1_6)
  if L3_8 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_5
  end
  return _UPVALUE0_.SUCCESS, A0_5
end
function versionGet()
  local L0_9
  L0_9 = db
  L0_9 = L0_9.getAttribute
  L0_9 = L0_9(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.version)
  if L0_9 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_9
end
function versionGetNext(A0_10)
  local L2_11, L3_12
  L2_11 = _UPVALUE0_
  L2_11 = L2_11.NOT_SUPPORTED
  L3_12 = 0
  return L2_11, L3_12, 0
end
function versionSet(A0_13, A1_14)
  local L2_15, L3_16
  L2_15 = _UPVALUE0_
  L2_15 = L2_15.NIL
  if A1_14 == L2_15 then
    L2_15 = _UPVALUE0_
    L2_15 = L2_15.INVALID_ARGUMENT
    return L2_15
  end
  L2_15 = tonumber
  L3_16 = A1_14
  L2_15 = L2_15(L3_16)
  L3_16 = _UPVALUE0_
  L3_16 = L3_16.NIL
  if L2_15 == L3_16 then
    L3_16 = _UPVALUE0_
    L3_16 = L3_16.INVALID_ARGUMENT
    return L3_16
  end
  L3_16 = _UPVALUE1_
  if L2_15 ~= L3_16 then
    L3_16 = _UPVALUE2_
    if L2_15 ~= L3_16 then
      L3_16 = _UPVALUE3_
      if L2_15 ~= L3_16 then
        L3_16 = _UPVALUE4_
        if L2_15 ~= L3_16 then
          L3_16 = _UPVALUE0_
          L3_16 = L3_16.INVALID_ARGUMENT
          return L3_16
        end
      end
    end
  end
  L3_16 = nil
  L3_16 = db.setAttribute(_UPVALUE5_, _UPVALUE6_, _UPVALUE7_, _UPVALUE8_.version, A1_14)
  if L3_16 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_13
  end
  return _UPVALUE0_.SUCCESS, A0_13
end
function isauthenticationEnabled()
  local L0_17
  L0_17 = db
  L0_17 = L0_17.getAttribute
  L0_17 = L0_17(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.authentication)
  if L0_17 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_17
end
function isauthenticationEnabledNext(A0_18)
  local L2_19, L3_20
  L2_19 = _UPVALUE0_
  L2_19 = L2_19.NOT_SUPPORTED
  L3_20 = 0
  return L2_19, L3_20, 0
end
function authenticationEnable(A0_21)
  local L1_22, L2_23, L3_24, L4_25
  L1_22 = {}
  L2_23 = db
  L2_23 = L2_23.getRow
  L3_24 = _UPVALUE0_
  L4_25 = _UPVALUE1_
  L2_23 = L2_23(L3_24, L4_25, _UPVALUE2_)
  L1_22 = L2_23
  L2_23 = _UPVALUE0_
  L3_24 = "."
  L4_25 = _UPVALUE3_
  L4_25 = L4_25.direction
  L2_23 = L2_23 .. L3_24 .. L4_25
  L2_23 = L1_22[L2_23]
  L3_24 = _UPVALUE0_
  L4_25 = "."
  L3_24 = L3_24 .. L4_25 .. _UPVALUE3_.version
  L3_24 = L1_22[L3_24]
  L4_25 = tonumber
  L4_25 = L4_25(L2_23)
  L2_23 = L4_25
  L4_25 = tonumber
  L4_25 = L4_25(L3_24)
  L3_24 = L4_25
  L4_25 = _UPVALUE4_
  if L2_23 == L4_25 then
    L4_25 = _UPVALUE5_
    L4_25 = L4_25.DEPENDENCY_NOT_MET
    return L4_25
  end
  L4_25 = _UPVALUE6_
  if L3_24 ~= L4_25 then
    L4_25 = _UPVALUE7_
    if L3_24 ~= L4_25 then
      L4_25 = _UPVALUE5_
      L4_25 = L4_25.DEPENDENCY_NOT_MET
      return L4_25
    end
  end
  L4_25 = nil
  L4_25 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.authentication, _UPVALUE8_)
  if L4_25 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_21
  end
  return _UPVALUE5_.SUCCESS, A0_21
end
function authenticationDisable(A0_26)
  local L1_27, L2_28, L3_29, L4_30
  L1_27 = {}
  L2_28 = db
  L2_28 = L2_28.getRow
  L3_29 = _UPVALUE0_
  L4_30 = _UPVALUE1_
  L2_28 = L2_28(L3_29, L4_30, _UPVALUE2_)
  L1_27 = L2_28
  L2_28 = _UPVALUE0_
  L3_29 = "."
  L4_30 = _UPVALUE3_
  L4_30 = L4_30.direction
  L2_28 = L2_28 .. L3_29 .. L4_30
  L2_28 = L1_27[L2_28]
  L3_29 = _UPVALUE0_
  L4_30 = "."
  L3_29 = L3_29 .. L4_30 .. _UPVALUE3_.version
  L3_29 = L1_27[L3_29]
  L4_30 = tonumber
  L4_30 = L4_30(L2_28)
  L2_28 = L4_30
  L4_30 = tonumber
  L4_30 = L4_30(L3_29)
  L3_29 = L4_30
  L4_30 = _UPVALUE4_
  if L2_28 == L4_30 then
    L4_30 = _UPVALUE5_
    L4_30 = L4_30.DEPENDENCY_NOT_MET
    return L4_30
  end
  L4_30 = _UPVALUE6_
  if L3_29 ~= L4_30 then
    L4_30 = _UPVALUE7_
    if L3_29 ~= L4_30 then
      L4_30 = _UPVALUE5_
      L4_30 = L4_30.DEPENDENCY_NOT_MET
      return L4_30
    end
  end
  L4_30 = nil
  L4_30 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.authentication, _UPVALUE8_)
  if L4_30 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_26
  end
  return _UPVALUE5_.SUCCESS, A0_26
end
function firstKeyIdGet()
  local L0_31
  L0_31 = db
  L0_31 = L0_31.getAttribute
  L0_31 = L0_31(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.firstKeyId)
  if L0_31 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_31
end
function firstKeyIdGetNext(A0_32)
  local L2_33, L3_34
  L2_33 = _UPVALUE0_
  L2_33 = L2_33.NOT_SUPPORTED
  L3_34 = 0
  return L2_33, L3_34, 0
end
function firstKeyIdSet(A0_35, A1_36)
  local L2_37, L3_38, L4_39, L5_40, L6_41, L7_42
  L2_37 = {}
  L3_38 = db
  L3_38 = L3_38.getRow
  L4_39 = _UPVALUE0_
  L5_40 = _UPVALUE1_
  L6_41 = _UPVALUE2_
  L3_38 = L3_38(L4_39, L5_40, L6_41)
  L2_37 = L3_38
  L3_38 = _UPVALUE0_
  L4_39 = "."
  L5_40 = _UPVALUE3_
  L5_40 = L5_40.direction
  L3_38 = L3_38 .. L4_39 .. L5_40
  L3_38 = L2_37[L3_38]
  L4_39 = _UPVALUE0_
  L5_40 = "."
  L6_41 = _UPVALUE3_
  L6_41 = L6_41.version
  L4_39 = L4_39 .. L5_40 .. L6_41
  L4_39 = L2_37[L4_39]
  L5_40 = _UPVALUE0_
  L6_41 = "."
  L7_42 = _UPVALUE3_
  L7_42 = L7_42.authentication
  L5_40 = L5_40 .. L6_41 .. L7_42
  L5_40 = L2_37[L5_40]
  L6_41 = tonumber
  L7_42 = L3_38
  L6_41 = L6_41(L7_42)
  L3_38 = L6_41
  L6_41 = tonumber
  L7_42 = L4_39
  L6_41 = L6_41(L7_42)
  L4_39 = L6_41
  L6_41 = _UPVALUE4_
  if L3_38 == L6_41 then
    L6_41 = _UPVALUE5_
    L6_41 = L6_41.DEPENDENCY_NOT_MET
    return L6_41
  end
  L6_41 = _UPVALUE6_
  if L4_39 ~= L6_41 then
    L6_41 = _UPVALUE7_
    if L4_39 ~= L6_41 then
      L6_41 = _UPVALUE5_
      L6_41 = L6_41.DEPENDENCY_NOT_MET
      return L6_41
    end
  end
  L6_41 = _UPVALUE8_
  if L5_40 ~= L6_41 then
    L6_41 = _UPVALUE5_
    L6_41 = L6_41.DEPENDENCY_NOT_MET
    return L6_41
  end
  L6_41 = _UPVALUE5_
  L6_41 = L6_41.NIL
  if A1_36 == L6_41 then
    L6_41 = _UPVALUE5_
    L6_41 = L6_41.INVALID_ARGUMENT
    return L6_41
  end
  L6_41 = tonumber
  L7_42 = A1_36
  L6_41 = L6_41(L7_42)
  L7_42 = _UPVALUE5_
  L7_42 = L7_42.NIL
  if L6_41 == L7_42 then
    L7_42 = _UPVALUE5_
    L7_42 = L7_42.INVALID_ARGUMENT
    return L7_42
  end
  L7_42 = _UPVALUE9_
  if not (L6_41 < L7_42) then
    L7_42 = _UPVALUE10_
  elseif L6_41 > L7_42 then
    L7_42 = _UPVALUE5_
    L7_42 = L7_42.INVALID_ARGUMENT
    return L7_42
  end
  L7_42 = nil
  L7_42 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.firstKeyId, A1_36)
  if L7_42 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_35
  end
  return _UPVALUE5_.SUCCESS, A0_35
end
function firstAuthenticationKeyGet()
  local L0_43
  L0_43 = db
  L0_43 = L0_43.getAttribute
  L0_43 = L0_43(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.firstAuthenticationKey)
  if L0_43 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_43
end
function firstAuthenticationKeyGetNext(A0_44)
  local L2_45, L3_46
  L2_45 = _UPVALUE0_
  L2_45 = L2_45.NOT_SUPPORTED
  L3_46 = 0
  return L2_45, L3_46, 0
end
function firstAuthenticationKeySet(A0_47, A1_48)
  local L2_49, L3_50, L4_51, L5_52, L6_53
  L2_49 = {}
  L3_50 = db
  L3_50 = L3_50.getRow
  L4_51 = _UPVALUE0_
  L5_52 = _UPVALUE1_
  L6_53 = _UPVALUE2_
  L3_50 = L3_50(L4_51, L5_52, L6_53)
  L2_49 = L3_50
  L3_50 = _UPVALUE0_
  L4_51 = "."
  L5_52 = _UPVALUE3_
  L5_52 = L5_52.direction
  L3_50 = L3_50 .. L4_51 .. L5_52
  L3_50 = L2_49[L3_50]
  L4_51 = _UPVALUE0_
  L5_52 = "."
  L6_53 = _UPVALUE3_
  L6_53 = L6_53.version
  L4_51 = L4_51 .. L5_52 .. L6_53
  L4_51 = L2_49[L4_51]
  L5_52 = _UPVALUE0_
  L6_53 = "."
  L5_52 = L5_52 .. L6_53 .. _UPVALUE3_.authentication
  L5_52 = L2_49[L5_52]
  L6_53 = tonumber
  L6_53 = L6_53(L3_50)
  L3_50 = L6_53
  L6_53 = tonumber
  L6_53 = L6_53(L4_51)
  L4_51 = L6_53
  L6_53 = _UPVALUE4_
  if L3_50 == L6_53 then
    L6_53 = _UPVALUE5_
    L6_53 = L6_53.DEPENDENCY_NOT_MET
    return L6_53
  end
  L6_53 = _UPVALUE6_
  if L4_51 ~= L6_53 then
    L6_53 = _UPVALUE7_
    if L4_51 ~= L6_53 then
      L6_53 = _UPVALUE5_
      L6_53 = L6_53.DEPENDENCY_NOT_MET
      return L6_53
    end
  end
  L6_53 = _UPVALUE8_
  if L5_52 ~= L6_53 then
    L6_53 = _UPVALUE5_
    L6_53 = L6_53.DEPENDENCY_NOT_MET
    return L6_53
  end
  L6_53 = _UPVALUE5_
  L6_53 = L6_53.NIL
  if A1_48 == L6_53 then
    L6_53 = _UPVALUE5_
    L6_53 = L6_53.INVALID_ARGUMENT
    return L6_53
  end
  L6_53 = _UPVALUE9_
  L6_53 = L6_53.stringLengthCheck
  L6_53 = L6_53(_UPVALUE10_, _UPVALUE11_, A1_48)
  if L6_53 ~= _UPVALUE5_.SUCCESS then
    L6_53 = _UPVALUE5_
    L6_53 = L6_53.INVALID_ARGUMENT
    return L6_53
  end
  L6_53 = nil
  L6_53 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.firstAuthenticationKey, A1_48)
  if L6_53 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_47
  end
  return _UPVALUE5_.SUCCESS, A0_47
end
function firstKeyFromGet()
  local L0_54
  L0_54 = db
  L0_54 = L0_54.getAttribute
  L0_54 = L0_54(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.firstKeyFrom)
  if L0_54 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_54
end
function firstKeyFromGetNext(A0_55)
  local L2_56, L3_57
  L2_56 = _UPVALUE0_
  L2_56 = L2_56.NOT_SUPPORTED
  L3_57 = 0
  return L2_56, L3_57, 0
end
function firstKeyFromSet(A0_58, A1_59)
  local L2_60, L3_61, L4_62, L5_63, L6_64
  L2_60 = {}
  L3_61 = db
  L3_61 = L3_61.getRow
  L4_62 = _UPVALUE0_
  L5_63 = _UPVALUE1_
  L6_64 = _UPVALUE2_
  L3_61 = L3_61(L4_62, L5_63, L6_64)
  L2_60 = L3_61
  L3_61 = _UPVALUE0_
  L4_62 = "."
  L5_63 = _UPVALUE3_
  L5_63 = L5_63.direction
  L3_61 = L3_61 .. L4_62 .. L5_63
  L3_61 = L2_60[L3_61]
  L4_62 = _UPVALUE0_
  L5_63 = "."
  L6_64 = _UPVALUE3_
  L6_64 = L6_64.version
  L4_62 = L4_62 .. L5_63 .. L6_64
  L4_62 = L2_60[L4_62]
  L5_63 = _UPVALUE0_
  L6_64 = "."
  L5_63 = L5_63 .. L6_64 .. _UPVALUE3_.authentication
  L5_63 = L2_60[L5_63]
  L6_64 = tonumber
  L6_64 = L6_64(L3_61)
  L3_61 = L6_64
  L6_64 = tonumber
  L6_64 = L6_64(L4_62)
  L4_62 = L6_64
  L6_64 = _UPVALUE4_
  if L3_61 == L6_64 then
    L6_64 = _UPVALUE5_
    L6_64 = L6_64.DEPENDENCY_NOT_MET
    return L6_64
  end
  L6_64 = _UPVALUE6_
  if L4_62 ~= L6_64 then
    L6_64 = _UPVALUE7_
    if L4_62 ~= L6_64 then
      L6_64 = _UPVALUE5_
      L6_64 = L6_64.DEPENDENCY_NOT_MET
      return L6_64
    end
  end
  L6_64 = _UPVALUE8_
  if L5_63 ~= L6_64 then
    L6_64 = _UPVALUE5_
    L6_64 = L6_64.DEPENDENCY_NOT_MET
    return L6_64
  end
  L6_64 = _UPVALUE5_
  L6_64 = L6_64.NIL
  if A1_59 == L6_64 then
    L6_64 = _UPVALUE5_
    L6_64 = L6_64.INVALID_ARGUMENT
    return L6_64
  end
  L6_64 = nil
  L6_64 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.firstKeyFrom, A1_59)
  if L6_64 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_58
  end
  return _UPVALUE5_.SUCCESS, A0_58
end
function firstKeyToGet()
  local L0_65
  L0_65 = db
  L0_65 = L0_65.getAttribute
  L0_65 = L0_65(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.firstKeyTo)
  if L0_65 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_65
end
function firstKeyToGetNext(A0_66)
  local L2_67, L3_68
  L2_67 = _UPVALUE0_
  L2_67 = L2_67.NOT_SUPPORTED
  L3_68 = 0
  return L2_67, L3_68, 0
end
function firstKeyToSet(A0_69, A1_70)
  local L2_71, L3_72, L4_73, L5_74, L6_75
  L2_71 = {}
  L3_72 = db
  L3_72 = L3_72.getRow
  L4_73 = _UPVALUE0_
  L5_74 = _UPVALUE1_
  L6_75 = _UPVALUE2_
  L3_72 = L3_72(L4_73, L5_74, L6_75)
  L2_71 = L3_72
  L3_72 = _UPVALUE0_
  L4_73 = "."
  L5_74 = _UPVALUE3_
  L5_74 = L5_74.direction
  L3_72 = L3_72 .. L4_73 .. L5_74
  L3_72 = L2_71[L3_72]
  L4_73 = _UPVALUE0_
  L5_74 = "."
  L6_75 = _UPVALUE3_
  L6_75 = L6_75.version
  L4_73 = L4_73 .. L5_74 .. L6_75
  L4_73 = L2_71[L4_73]
  L5_74 = _UPVALUE0_
  L6_75 = "."
  L5_74 = L5_74 .. L6_75 .. _UPVALUE3_.authentication
  L5_74 = L2_71[L5_74]
  L6_75 = tonumber
  L6_75 = L6_75(L3_72)
  L3_72 = L6_75
  L6_75 = tonumber
  L6_75 = L6_75(L4_73)
  L4_73 = L6_75
  L6_75 = _UPVALUE4_
  if L3_72 == L6_75 then
    L6_75 = _UPVALUE5_
    L6_75 = L6_75.DEPENDENCY_NOT_MET
    return L6_75
  end
  L6_75 = _UPVALUE6_
  if L4_73 ~= L6_75 then
    L6_75 = _UPVALUE7_
    if L4_73 ~= L6_75 then
      L6_75 = _UPVALUE5_
      L6_75 = L6_75.DEPENDENCY_NOT_MET
      return L6_75
    end
  end
  L6_75 = _UPVALUE8_
  if L5_74 ~= L6_75 then
    L6_75 = _UPVALUE5_
    L6_75 = L6_75.DEPENDENCY_NOT_MET
    return L6_75
  end
  L6_75 = _UPVALUE5_
  L6_75 = L6_75.NIL
  if A1_70 == L6_75 then
    L6_75 = _UPVALUE5_
    L6_75 = L6_75.INVALID_ARGUMENT
    return L6_75
  end
  L6_75 = nil
  L6_75 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.firstKeyTo, A1_70)
  if L6_75 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_69
  end
  return _UPVALUE5_.SUCCESS, A0_69
end
function secondKeyIdGet()
  local L0_76
  L0_76 = db
  L0_76 = L0_76.getAttribute
  L0_76 = L0_76(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.secondKeyId)
  if L0_76 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_76
end
function secondKeyIdGetNext(A0_77)
  local L2_78, L3_79
  L2_78 = _UPVALUE0_
  L2_78 = L2_78.NOT_SUPPORTED
  L3_79 = 0
  return L2_78, L3_79, 0
end
function secondKeyIdSet(A0_80, A1_81)
  local L2_82, L3_83, L4_84, L5_85, L6_86, L7_87
  L2_82 = {}
  L3_83 = db
  L3_83 = L3_83.getRow
  L4_84 = _UPVALUE0_
  L5_85 = _UPVALUE1_
  L6_86 = _UPVALUE2_
  L3_83 = L3_83(L4_84, L5_85, L6_86)
  L2_82 = L3_83
  L3_83 = _UPVALUE0_
  L4_84 = "."
  L5_85 = _UPVALUE3_
  L5_85 = L5_85.direction
  L3_83 = L3_83 .. L4_84 .. L5_85
  L3_83 = L2_82[L3_83]
  L4_84 = _UPVALUE0_
  L5_85 = "."
  L6_86 = _UPVALUE3_
  L6_86 = L6_86.version
  L4_84 = L4_84 .. L5_85 .. L6_86
  L4_84 = L2_82[L4_84]
  L5_85 = _UPVALUE0_
  L6_86 = "."
  L7_87 = _UPVALUE3_
  L7_87 = L7_87.authentication
  L5_85 = L5_85 .. L6_86 .. L7_87
  L5_85 = L2_82[L5_85]
  L6_86 = tonumber
  L7_87 = L3_83
  L6_86 = L6_86(L7_87)
  L3_83 = L6_86
  L6_86 = tonumber
  L7_87 = L4_84
  L6_86 = L6_86(L7_87)
  L4_84 = L6_86
  L6_86 = _UPVALUE4_
  if L3_83 == L6_86 then
    L6_86 = _UPVALUE5_
    L6_86 = L6_86.DEPENDENCY_NOT_MET
    return L6_86
  end
  L6_86 = _UPVALUE6_
  if L4_84 ~= L6_86 then
    L6_86 = _UPVALUE7_
    if L4_84 ~= L6_86 then
      L6_86 = _UPVALUE5_
      L6_86 = L6_86.DEPENDENCY_NOT_MET
      return L6_86
    end
  end
  L6_86 = _UPVALUE8_
  if L5_85 ~= L6_86 then
    L6_86 = _UPVALUE5_
    L6_86 = L6_86.DEPENDENCY_NOT_MET
    return L6_86
  end
  L6_86 = _UPVALUE5_
  L6_86 = L6_86.NIL
  if A1_81 == L6_86 then
    L6_86 = _UPVALUE5_
    L6_86 = L6_86.INVALID_ARGUMENT
    return L6_86
  end
  L6_86 = tonumber
  L7_87 = A1_81
  L6_86 = L6_86(L7_87)
  L7_87 = _UPVALUE5_
  L7_87 = L7_87.NIL
  if L6_86 == L7_87 then
    L7_87 = _UPVALUE5_
    L7_87 = L7_87.INVALID_ARGUMENT
    return L7_87
  end
  L7_87 = _UPVALUE9_
  if not (L6_86 < L7_87) then
    L7_87 = _UPVALUE10_
  elseif L6_86 > L7_87 then
    L7_87 = _UPVALUE5_
    L7_87 = L7_87.INVALID_ARGUMENT
    return L7_87
  end
  L7_87 = nil
  L7_87 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.secondKeyId, A1_81)
  if L7_87 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_80
  end
  return _UPVALUE5_.SUCCESS, A0_80
end
function secondAuthenticationKeyGet()
  local L0_88
  L0_88 = db
  L0_88 = L0_88.getAttribute
  L0_88 = L0_88(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.secondAuthenticationKey)
  if L0_88 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_88
end
function secondAuthenticationKeyGetNext(A0_89)
  local L2_90, L3_91
  L2_90 = _UPVALUE0_
  L2_90 = L2_90.NOT_SUPPORTED
  L3_91 = 0
  return L2_90, L3_91, 0
end
function secondAuthenticationKeySet(A0_92, A1_93)
  local L2_94, L3_95, L4_96, L5_97, L6_98
  L2_94 = {}
  L3_95 = db
  L3_95 = L3_95.getRow
  L4_96 = _UPVALUE0_
  L5_97 = _UPVALUE1_
  L6_98 = _UPVALUE2_
  L3_95 = L3_95(L4_96, L5_97, L6_98)
  L2_94 = L3_95
  L3_95 = _UPVALUE0_
  L4_96 = "."
  L5_97 = _UPVALUE3_
  L5_97 = L5_97.direction
  L3_95 = L3_95 .. L4_96 .. L5_97
  L3_95 = L2_94[L3_95]
  L4_96 = _UPVALUE0_
  L5_97 = "."
  L6_98 = _UPVALUE3_
  L6_98 = L6_98.version
  L4_96 = L4_96 .. L5_97 .. L6_98
  L4_96 = L2_94[L4_96]
  L5_97 = _UPVALUE0_
  L6_98 = "."
  L5_97 = L5_97 .. L6_98 .. _UPVALUE3_.authentication
  L5_97 = L2_94[L5_97]
  L6_98 = tonumber
  L6_98 = L6_98(L3_95)
  L3_95 = L6_98
  L6_98 = tonumber
  L6_98 = L6_98(L4_96)
  L4_96 = L6_98
  L6_98 = _UPVALUE4_
  if L3_95 == L6_98 then
    L6_98 = _UPVALUE5_
    L6_98 = L6_98.DEPENDENCY_NOT_MET
    return L6_98
  end
  L6_98 = _UPVALUE6_
  if L4_96 ~= L6_98 then
    L6_98 = _UPVALUE7_
    if L4_96 ~= L6_98 then
      L6_98 = _UPVALUE5_
      L6_98 = L6_98.DEPENDENCY_NOT_MET
      return L6_98
    end
  end
  L6_98 = _UPVALUE8_
  if L5_97 ~= L6_98 then
    L6_98 = _UPVALUE5_
    L6_98 = L6_98.DEPENDENCY_NOT_MET
    return L6_98
  end
  L6_98 = _UPVALUE5_
  L6_98 = L6_98.NIL
  if A1_93 == L6_98 then
    L6_98 = _UPVALUE5_
    L6_98 = L6_98.INVALID_ARGUMENT
    return L6_98
  end
  L6_98 = _UPVALUE9_
  L6_98 = L6_98.stringLengthCheck
  L6_98 = L6_98(_UPVALUE10_, _UPVALUE11_, A1_93)
  if L6_98 ~= _UPVALUE5_.SUCCESS then
    L6_98 = _UPVALUE5_
    L6_98 = L6_98.INVALID_ARGUMENT
    return L6_98
  end
  L6_98 = nil
  L6_98 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.secondAuthenticationKey, A1_93)
  if L6_98 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_92
  end
  return _UPVALUE5_.SUCCESS, A0_92
end
function secondKeyFromGet()
  local L0_99
  L0_99 = db
  L0_99 = L0_99.getAttribute
  L0_99 = L0_99(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.secondKeyFrom)
  if L0_99 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_99
end
function secondKeyFromGetNext(A0_100)
  local L2_101, L3_102
  L2_101 = _UPVALUE0_
  L2_101 = L2_101.NOT_SUPPORTED
  L3_102 = 0
  return L2_101, L3_102, 0
end
function secondKeyFromSet(A0_103, A1_104)
  local L2_105, L3_106, L4_107, L5_108, L6_109
  L2_105 = {}
  L3_106 = db
  L3_106 = L3_106.getRow
  L4_107 = _UPVALUE0_
  L5_108 = _UPVALUE1_
  L6_109 = _UPVALUE2_
  L3_106 = L3_106(L4_107, L5_108, L6_109)
  L2_105 = L3_106
  L3_106 = _UPVALUE0_
  L4_107 = "."
  L5_108 = _UPVALUE3_
  L5_108 = L5_108.direction
  L3_106 = L3_106 .. L4_107 .. L5_108
  L3_106 = L2_105[L3_106]
  L4_107 = _UPVALUE0_
  L5_108 = "."
  L6_109 = _UPVALUE3_
  L6_109 = L6_109.version
  L4_107 = L4_107 .. L5_108 .. L6_109
  L4_107 = L2_105[L4_107]
  L5_108 = _UPVALUE0_
  L6_109 = "."
  L5_108 = L5_108 .. L6_109 .. _UPVALUE3_.authentication
  L5_108 = L2_105[L5_108]
  L6_109 = tonumber
  L6_109 = L6_109(L3_106)
  L3_106 = L6_109
  L6_109 = tonumber
  L6_109 = L6_109(L4_107)
  L4_107 = L6_109
  L6_109 = _UPVALUE4_
  if L3_106 == L6_109 then
    L6_109 = _UPVALUE5_
    L6_109 = L6_109.DEPENDENCY_NOT_MET
    return L6_109
  end
  L6_109 = _UPVALUE6_
  if L4_107 ~= L6_109 then
    L6_109 = _UPVALUE7_
    if L4_107 ~= L6_109 then
      L6_109 = _UPVALUE5_
      L6_109 = L6_109.DEPENDENCY_NOT_MET
      return L6_109
    end
  end
  L6_109 = _UPVALUE8_
  if L5_108 ~= L6_109 then
    L6_109 = _UPVALUE5_
    L6_109 = L6_109.DEPENDENCY_NOT_MET
    return L6_109
  end
  L6_109 = _UPVALUE5_
  L6_109 = L6_109.NIL
  if A1_104 == L6_109 then
    L6_109 = _UPVALUE5_
    L6_109 = L6_109.INVALID_ARGUMENT
    return L6_109
  end
  L6_109 = nil
  L6_109 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.secondKeyFrom, A1_104)
  if L6_109 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_103
  end
  return _UPVALUE5_.SUCCESS, A0_103
end
function secondKeyToGet()
  local L0_110
  L0_110 = db
  L0_110 = L0_110.getAttribute
  L0_110 = L0_110(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.secondKeyTo)
  if L0_110 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_110
end
function secondKeyToGetNext(A0_111)
  local L2_112, L3_113
  L2_112 = _UPVALUE0_
  L2_112 = L2_112.NOT_SUPPORTED
  L3_113 = 0
  return L2_112, L3_113, 0
end
function secondKeyToSet(A0_114, A1_115)
  local L2_116, L3_117, L4_118, L5_119, L6_120
  L2_116 = {}
  L3_117 = db
  L3_117 = L3_117.getRow
  L4_118 = _UPVALUE0_
  L5_119 = _UPVALUE1_
  L6_120 = _UPVALUE2_
  L3_117 = L3_117(L4_118, L5_119, L6_120)
  L2_116 = L3_117
  L3_117 = _UPVALUE0_
  L4_118 = "."
  L5_119 = _UPVALUE3_
  L5_119 = L5_119.direction
  L3_117 = L3_117 .. L4_118 .. L5_119
  L3_117 = L2_116[L3_117]
  L4_118 = _UPVALUE0_
  L5_119 = "."
  L6_120 = _UPVALUE3_
  L6_120 = L6_120.version
  L4_118 = L4_118 .. L5_119 .. L6_120
  L4_118 = L2_116[L4_118]
  L5_119 = _UPVALUE0_
  L6_120 = "."
  L5_119 = L5_119 .. L6_120 .. _UPVALUE3_.authentication
  L5_119 = L2_116[L5_119]
  L6_120 = tonumber
  L6_120 = L6_120(L3_117)
  L3_117 = L6_120
  L6_120 = tonumber
  L6_120 = L6_120(L4_118)
  L4_118 = L6_120
  L6_120 = _UPVALUE4_
  if L3_117 == L6_120 then
    L6_120 = _UPVALUE5_
    L6_120 = L6_120.DEPENDENCY_NOT_MET
    return L6_120
  end
  L6_120 = _UPVALUE6_
  if L4_118 ~= L6_120 then
    L6_120 = _UPVALUE7_
    if L4_118 ~= L6_120 then
      L6_120 = _UPVALUE5_
      L6_120 = L6_120.DEPENDENCY_NOT_MET
      return L6_120
    end
  end
  L6_120 = _UPVALUE8_
  if L5_119 ~= L6_120 then
    L6_120 = _UPVALUE5_
    L6_120 = L6_120.DEPENDENCY_NOT_MET
    return L6_120
  end
  L6_120 = _UPVALUE5_
  L6_120 = L6_120.NIL
  if A1_115 == L6_120 then
    L6_120 = _UPVALUE5_
    L6_120 = L6_120.INVALID_ARGUMENT
    return L6_120
  end
  L6_120 = nil
  L6_120 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.secondKeyTo, A1_115)
  if L6_120 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_114
  end
  return _UPVALUE5_.SUCCESS, A0_114
end
function ripConfigGet()
  local L0_121, L1_122, L2_123, L3_124, L4_125, L5_126, L6_127, L7_128, L8_129, L9_130, L10_131, L11_132
  L0_121 = {}
  L1_122 = db
  L1_122 = L1_122.getRow
  L2_123 = _UPVALUE0_
  L3_124 = _UPVALUE1_
  L4_125 = _UPVALUE2_
  L1_122 = L1_122(L2_123, L3_124, L4_125)
  L0_121 = L1_122
  L1_122 = _UPVALUE3_
  L1_122 = L1_122.NIL
  if L0_121 == L1_122 then
    L1_122 = _UPVALUE3_
    L1_122 = L1_122.FAILURE
    return L1_122
  end
  L1_122 = _UPVALUE0_
  L2_123 = "."
  L3_124 = _UPVALUE4_
  L3_124 = L3_124.direction
  L1_122 = L1_122 .. L2_123 .. L3_124
  L1_122 = L0_121[L1_122]
  L2_123 = _UPVALUE0_
  L3_124 = "."
  L4_125 = _UPVALUE4_
  L4_125 = L4_125.version
  L2_123 = L2_123 .. L3_124 .. L4_125
  L2_123 = L0_121[L2_123]
  L3_124 = _UPVALUE0_
  L4_125 = "."
  L5_126 = _UPVALUE4_
  L5_126 = L5_126.authentication
  L3_124 = L3_124 .. L4_125 .. L5_126
  L3_124 = L0_121[L3_124]
  L4_125 = _UPVALUE0_
  L5_126 = "."
  L6_127 = _UPVALUE4_
  L6_127 = L6_127.firstKeyId
  L4_125 = L4_125 .. L5_126 .. L6_127
  L4_125 = L0_121[L4_125]
  L5_126 = _UPVALUE0_
  L6_127 = "."
  L7_128 = _UPVALUE4_
  L7_128 = L7_128.firstAuthenticationKey
  L5_126 = L5_126 .. L6_127 .. L7_128
  L5_126 = L0_121[L5_126]
  L6_127 = _UPVALUE0_
  L7_128 = "."
  L8_129 = _UPVALUE4_
  L8_129 = L8_129.firstKeyFrom
  L6_127 = L6_127 .. L7_128 .. L8_129
  L6_127 = L0_121[L6_127]
  L7_128 = _UPVALUE0_
  L8_129 = "."
  L9_130 = _UPVALUE4_
  L9_130 = L9_130.firstKeyTo
  L7_128 = L7_128 .. L8_129 .. L9_130
  L7_128 = L0_121[L7_128]
  L8_129 = _UPVALUE0_
  L9_130 = "."
  L10_131 = _UPVALUE4_
  L10_131 = L10_131.secondKeyId
  L8_129 = L8_129 .. L9_130 .. L10_131
  L8_129 = L0_121[L8_129]
  L9_130 = _UPVALUE0_
  L10_131 = "."
  L11_132 = _UPVALUE4_
  L11_132 = L11_132.secondAuthenticationKey
  L9_130 = L9_130 .. L10_131 .. L11_132
  L9_130 = L0_121[L9_130]
  L10_131 = _UPVALUE0_
  L11_132 = "."
  L10_131 = L10_131 .. L11_132 .. _UPVALUE4_.secondKeyFrom
  L10_131 = L0_121[L10_131]
  L11_132 = _UPVALUE0_
  L11_132 = L11_132 .. "." .. _UPVALUE4_.secondKeyTo
  L11_132 = L0_121[L11_132]
  return _UPVALUE3_.SUCCESS, 1, L1_122, L2_123, L3_124, L4_125, L5_126, L6_127, L7_128, L8_129, L9_130, L10_131, L11_132
end
function ripConfigGetNext(A0_133)
  local L2_134, L3_135
  L2_134 = _UPVALUE0_
  L2_134 = L2_134.NOT_SUPPORTED
  L3_135 = 0
  return L2_134, L3_135, 0
end
function ripConfigSet(A0_136, A1_137, A2_138, A3_139, A4_140, A5_141, A6_142, A7_143, A8_144, A9_145, A10_146, A11_147)
  local L12_148, L13_149, L14_150, L15_151
  L12_148 = {}
  L13_149 = _UPVALUE0_
  L13_149 = L13_149.NIL
  if A1_137 == L13_149 then
    L13_149 = _UPVALUE0_
    L13_149 = L13_149.INVALID_ARGUMENT
    return L13_149
  end
  L13_149 = tonumber
  L14_150 = A1_137
  L13_149 = L13_149(L14_150)
  L14_150 = _UPVALUE0_
  L14_150 = L14_150.NIL
  if L13_149 == L14_150 then
    L14_150 = _UPVALUE0_
    L14_150 = L14_150.INVALID_ARGUMENT
    return L14_150
  end
  L14_150 = _UPVALUE1_
  if L13_149 ~= L14_150 then
    L14_150 = _UPVALUE2_
    if L13_149 ~= L14_150 then
      L14_150 = _UPVALUE3_
      if L13_149 ~= L14_150 then
        L14_150 = _UPVALUE4_
        if L13_149 ~= L14_150 then
          L14_150 = _UPVALUE0_
          L14_150 = L14_150.INVALID_ARGUMENT
          return L14_150
        end
      end
    end
  end
  L14_150 = _UPVALUE5_
  L15_151 = "."
  L14_150 = L14_150 .. L15_151 .. _UPVALUE6_.direction
  L12_148[L14_150] = A1_137
  L14_150 = _UPVALUE0_
  L14_150 = L14_150.NIL
  if A2_138 == L14_150 then
    L14_150 = _UPVALUE0_
    L14_150 = L14_150.INVALID_ARGUMENT
    return L14_150
  end
  L14_150 = tonumber
  L15_151 = A2_138
  L14_150 = L14_150(L15_151)
  L15_151 = _UPVALUE0_
  L15_151 = L15_151.NIL
  if L14_150 == L15_151 then
    L15_151 = _UPVALUE0_
    L15_151 = L15_151.INVALID_ARGUMENT
    return L15_151
  end
  L15_151 = _UPVALUE7_
  if L14_150 ~= L15_151 then
    L15_151 = _UPVALUE8_
    if L14_150 ~= L15_151 then
      L15_151 = _UPVALUE9_
      if L14_150 ~= L15_151 then
        L15_151 = _UPVALUE10_
        if L14_150 ~= L15_151 then
          L15_151 = _UPVALUE0_
          L15_151 = L15_151.INVALID_ARGUMENT
          return L15_151
        end
      end
    end
  end
  L15_151 = _UPVALUE5_
  L15_151 = L15_151 .. "." .. _UPVALUE6_.version
  L12_148[L15_151] = A2_138
  L15_151 = tonumber
  L15_151 = L15_151(A1_137)
  if L15_151 ~= _UPVALUE4_ then
    L15_151 = tonumber
    L15_151 = L15_151(A2_138)
    if L15_151 ~= _UPVALUE9_ then
      L15_151 = tonumber
      L15_151 = L15_151(A2_138)
    elseif L15_151 == _UPVALUE10_ then
      L15_151 = _UPVALUE0_
      L15_151 = L15_151.NIL
      if A3_139 == L15_151 then
        L15_151 = _UPVALUE0_
        L15_151 = L15_151.INVALID_ARGUMENT
        return L15_151
      end
      L15_151 = _UPVALUE11_
      L15_151 = L15_151.isBoolean
      L15_151 = L15_151(A3_139)
      valid = L15_151
      L15_151 = valid
      if L15_151 ~= _UPVALUE0_.SUCCESS then
        L15_151 = _UPVALUE0_
        L15_151 = L15_151.INVALID_ARGUMENT
        return L15_151
      end
      L15_151 = _UPVALUE5_
      L15_151 = L15_151 .. "." .. _UPVALUE6_.authentication
      L12_148[L15_151] = A3_139
      L15_151 = _UPVALUE12_
      if A3_139 == L15_151 then
        L15_151 = _UPVALUE0_
        L15_151 = L15_151.NIL
        if A4_140 == L15_151 then
          L15_151 = _UPVALUE0_
          L15_151 = L15_151.INVALID_ARGUMENT
          return L15_151
        end
        L15_151 = tonumber
        L15_151 = L15_151(A4_140)
        if L15_151 == _UPVALUE0_.NIL then
          return _UPVALUE0_.INVALID_ARGUMENT
        end
        if L15_151 < _UPVALUE13_ or L15_151 > _UPVALUE14_ then
          return _UPVALUE15_.RIP_INVALID_FIRST_KEYID
        end
        L12_148[_UPVALUE5_ .. "." .. _UPVALUE6_.firstKeyId] = A4_140
        if A5_141 == _UPVALUE0_.NIL then
          return _UPVALUE0_.INVALID_ARGUMENT
        end
        if _UPVALUE11_.stringLengthCheck(_UPVALUE16_, _UPVALUE17_, A5_141) ~= _UPVALUE0_.SUCCESS then
          return _UPVALUE0_.INVALID_ARGUMENT
        end
        L12_148[_UPVALUE5_ .. "." .. _UPVALUE6_.firstAuthenticationKey] = A5_141
        if A6_142 == _UPVALUE0_.NIL then
          return _UPVALUE0_.INVALID_ARGUMENT
        end
        L12_148[_UPVALUE5_ .. "." .. _UPVALUE6_.firstKeyFrom] = A6_142
        if A7_143 == _UPVALUE0_.NIL then
          return _UPVALUE0_.INVALID_ARGUMENT
        end
        L12_148[_UPVALUE5_ .. "." .. _UPVALUE6_.firstKeyTo] = A7_143
        if A8_144 == _UPVALUE0_.NIL then
          return _UPVALUE0_.INVALID_ARGUMENT
        end
        if tonumber(A8_144) == _UPVALUE0_.NIL then
          return _UPVALUE0_.INVALID_ARGUMENT
        end
        if tonumber(A8_144) < _UPVALUE13_ or tonumber(A8_144) > _UPVALUE14_ then
          return _UPVALUE15_.RIP_INVALID_SECOND_KEYID
        end
        L12_148[_UPVALUE5_ .. "." .. _UPVALUE6_.secondKeyId] = A8_144
        if A9_145 == _UPVALUE0_.NIL then
          return _UPVALUE0_.INVALID_ARGUMENT
        end
        if _UPVALUE11_.stringLengthCheck(_UPVALUE16_, _UPVALUE17_, A9_145) ~= _UPVALUE0_.SUCCESS then
          return _UPVALUE0_.INVALID_ARGUMENT
        end
        L12_148[_UPVALUE5_ .. "." .. _UPVALUE6_.secondAuthenticationKey] = A9_145
        if A10_146 == _UPVALUE0_.NIL then
          return _UPVALUE0_.INVALID_ARGUMENT
        end
        L12_148[_UPVALUE5_ .. "." .. _UPVALUE6_.secondKeyFrom] = A10_146
        if A11_147 == _UPVALUE0_.NIL then
          return _UPVALUE0_.INVALID_ARGUMENT
        end
        L12_148[_UPVALUE5_ .. "." .. _UPVALUE6_.secondKeyTo] = A11_147
      end
    end
  end
  L15_151 = nil
  L15_151 = db.update(_UPVALUE5_, L12_148, _UPVALUE18_)
  if L15_151 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_136
  end
  return _UPVALUE0_.SUCCESS, A0_136
end
function ripConfigCreate(A0_152, A1_153, A2_154, A3_155, A4_156, A5_157, A6_158, A7_159, A8_160, A9_161, A10_162)
  local L12_163, L13_164
  L12_163 = _UPVALUE0_
  L12_163 = L12_163.NOT_SUPPORTED
  L13_164 = 0
  return L12_163, L13_164, 0
end
function ripConfigDelete(A0_165)
  local L2_166, L3_167
  L2_166 = _UPVALUE0_
  L2_166 = L2_166.NOT_SUPPORTED
  L3_167 = 0
  return L2_166, L3_167, 0
end
