local L0_0
L0_0 = module
L0_0("com.teamf1.core.wan.port", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/nimf_returnCodes")
L0_0 = require
L0_0("teamf1lualib/jumboFrame")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).wanPort = "LogicalIfName"
;({}).addressFamily = "AddressFamily"
;({}).macAddressType = "SetMacAddress"
;({}).macAddress = "MacAddress"
;({}).mtuType = "UseDefaultMtu"
;({}).mtu = "MtuSize"
;({}).speed = "PortSpeed"
;({}).requireLogin = "RequireLogin"
;({}).autoNegEnable = "AutoNegEnable"
;({}).duplexMode = "DuplexMode"
;({}).portSpeed = "PortSpeed"
;({}).portName = "PortName"
function wanPortGet()
  local L0_1, L1_2
  L0_1 = db
  L0_1 = L0_1.getNextRowId
  L1_2 = _UPVALUE0_
  L0_1 = L0_1(L1_2, _UPVALUE1_)
  L1_2 = _UPVALUE2_
  L1_2 = L1_2.NIL
  if L0_1 == L1_2 then
    L1_2 = _UPVALUE2_
    L1_2 = L1_2.NOT_EXIST
    return L1_2
  end
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(_UPVALUE1_, _UPVALUE3_, L0_1, _UPVALUE4_.wanPort)
  if L1_2 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_1, L1_2
end
function wanPortGetNext(A0_3)
  local L1_4, L2_5
  L1_4 = _UPVALUE0_
  L1_4 = L1_4.NIL
  if A0_3 == L1_4 then
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.INVALID_ARGUMENT
    return L1_4
  end
  L1_4 = tonumber
  L2_5 = A0_3
  L1_4 = L1_4(L2_5)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if L1_4 == L2_5 then
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
    L1_4 = L1_4.NOT_EXIST
    return L1_4
  end
  L1_4 = nil
  L2_5 = db
  L2_5 = L2_5.getNextRowId
  L2_5 = L2_5(A0_3, _UPVALUE1_)
  L1_4 = L2_5
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if L1_4 == L2_5 then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.NOT_EXIST
    return L2_5
  end
  L2_5 = db
  L2_5 = L2_5.getAttribute
  L2_5 = L2_5(_UPVALUE1_, _UPVALUE2_, L1_4, _UPVALUE3_.wanPort)
  if L2_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L2_5
end
function wanPortSet(A0_6, A1_7)
  local L3_8, L4_9
  L3_8 = _UPVALUE0_
  L3_8 = L3_8.NOT_SUPPORTED
  L4_9 = 0
  return L3_8, L4_9, 0
end
function macAddressTypeGet()
  local L0_10, L1_11
  L0_10 = db
  L0_10 = L0_10.getNextRowId
  L1_11 = _UPVALUE0_
  L0_10 = L0_10(L1_11, _UPVALUE1_)
  L1_11 = _UPVALUE2_
  L1_11 = L1_11.NIL
  if L0_10 == L1_11 then
    L1_11 = _UPVALUE2_
    L1_11 = L1_11.NOT_EXIST
    return L1_11
  end
  L1_11 = db
  L1_11 = L1_11.getAttribute
  L1_11 = L1_11(_UPVALUE1_, _UPVALUE3_, L0_10, _UPVALUE4_.macAddressType)
  if L1_11 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_10, L1_11
end
function macAddressTypeGetNext(A0_12)
  local L1_13, L2_14
  L1_13 = _UPVALUE0_
  L1_13 = L1_13.NIL
  if A0_12 == L1_13 then
    L1_13 = _UPVALUE0_
    L1_13 = L1_13.INVALID_ARGUMENT
    return L1_13
  end
  L1_13 = tonumber
  L2_14 = A0_12
  L1_13 = L1_13(L2_14)
  L2_14 = _UPVALUE0_
  L2_14 = L2_14.NIL
  if L1_13 == L2_14 then
    L1_13 = _UPVALUE0_
    L1_13 = L1_13.INVALID_ARGUMENT
    return L1_13
  end
  L1_13 = db
  L1_13 = L1_13.existsRow
  L2_14 = _UPVALUE1_
  L1_13 = L1_13(L2_14, _UPVALUE2_, A0_12)
  L2_14 = _UPVALUE0_
  L2_14 = L2_14.FALSE
  if L1_13 == L2_14 then
    L1_13 = _UPVALUE0_
    L1_13 = L1_13.NOT_EXIST
    return L1_13
  end
  L1_13 = nil
  L2_14 = db
  L2_14 = L2_14.getNextRowId
  L2_14 = L2_14(A0_12, _UPVALUE1_)
  L1_13 = L2_14
  L2_14 = _UPVALUE0_
  L2_14 = L2_14.NIL
  if L1_13 == L2_14 then
    L2_14 = _UPVALUE0_
    L2_14 = L2_14.NOT_EXIST
    return L2_14
  end
  L2_14 = db
  L2_14 = L2_14.getAttribute
  L2_14 = L2_14(_UPVALUE1_, _UPVALUE2_, L1_13, _UPVALUE3_.macAddressType)
  if L2_14 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_13
  end
  return _UPVALUE0_.SUCCESS, L1_13, L2_14
end
function macAddressTypeSet(A0_15, A1_16)
  local L2_17, L3_18
  L2_17 = _UPVALUE0_
  L2_17 = L2_17.NIL
  if A0_15 == L2_17 then
    L2_17 = _UPVALUE0_
    L2_17 = L2_17.INVALID_ARGUMENT
    return L2_17
  end
  L2_17 = tonumber
  L3_18 = A0_15
  L2_17 = L2_17(L3_18)
  L3_18 = _UPVALUE0_
  L3_18 = L3_18.NIL
  if L2_17 == L3_18 then
    L2_17 = _UPVALUE0_
    L2_17 = L2_17.INVALID_ARGUMENT
    return L2_17
  end
  L2_17 = db
  L2_17 = L2_17.existsRow
  L3_18 = _UPVALUE1_
  L2_17 = L2_17(L3_18, _UPVALUE2_, A0_15)
  L3_18 = _UPVALUE0_
  L3_18 = L3_18.FALSE
  if L2_17 == L3_18 then
    L2_17 = _UPVALUE0_
    L2_17 = L2_17.NOT_EXIST
    return L2_17
  end
  L2_17 = _UPVALUE0_
  L2_17 = L2_17.NIL
  if A1_16 == L2_17 then
    L2_17 = _UPVALUE0_
    L2_17 = L2_17.INVALID_ARGUMENT
    return L2_17
  end
  L2_17 = tonumber
  L3_18 = A1_16
  L2_17 = L2_17(L3_18)
  L3_18 = _UPVALUE0_
  L3_18 = L3_18.NIL
  if L2_17 == L3_18 then
    L3_18 = _UPVALUE0_
    L3_18 = L3_18.INVALID_ARGUMENT
    return L3_18
  end
  L3_18 = _UPVALUE3_
  if L2_17 ~= L3_18 then
    L3_18 = _UPVALUE4_
    if L2_17 ~= L3_18 then
      L3_18 = _UPVALUE5_
      if L2_17 ~= L3_18 then
        L3_18 = _UPVALUE0_
        L3_18 = L3_18.INVALID_ARGUMENT
        return L3_18
      end
    end
  end
  L3_18 = nil
  L3_18 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_15, _UPVALUE6_.macAddressType, A1_16)
  if L3_18 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_15
  end
  return _UPVALUE0_.SUCCESS, A0_15
end
function macAddressGet()
  local L0_19, L1_20
  L0_19 = db
  L0_19 = L0_19.getNextRowId
  L1_20 = _UPVALUE0_
  L0_19 = L0_19(L1_20, _UPVALUE1_)
  L1_20 = _UPVALUE2_
  L1_20 = L1_20.NIL
  if L0_19 == L1_20 then
    L1_20 = _UPVALUE2_
    L1_20 = L1_20.NOT_EXIST
    return L1_20
  end
  L1_20 = db
  L1_20 = L1_20.getAttribute
  L1_20 = L1_20(_UPVALUE1_, _UPVALUE3_, L0_19, _UPVALUE4_.macAddress)
  if L1_20 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_19, L1_20
end
function macAddressGetNext(A0_21)
  local L1_22, L2_23
  L1_22 = _UPVALUE0_
  L1_22 = L1_22.NIL
  if A0_21 == L1_22 then
    L1_22 = _UPVALUE0_
    L1_22 = L1_22.INVALID_ARGUMENT
    return L1_22
  end
  L1_22 = tonumber
  L2_23 = A0_21
  L1_22 = L1_22(L2_23)
  L2_23 = _UPVALUE0_
  L2_23 = L2_23.NIL
  if L1_22 == L2_23 then
    L1_22 = _UPVALUE0_
    L1_22 = L1_22.INVALID_ARGUMENT
    return L1_22
  end
  L1_22 = db
  L1_22 = L1_22.existsRow
  L2_23 = _UPVALUE1_
  L1_22 = L1_22(L2_23, _UPVALUE2_, A0_21)
  L2_23 = _UPVALUE0_
  L2_23 = L2_23.FALSE
  if L1_22 == L2_23 then
    L1_22 = _UPVALUE0_
    L1_22 = L1_22.NOT_EXIST
    return L1_22
  end
  L1_22 = nil
  L2_23 = db
  L2_23 = L2_23.getNextRowId
  L2_23 = L2_23(A0_21, _UPVALUE1_)
  L1_22 = L2_23
  L2_23 = _UPVALUE0_
  L2_23 = L2_23.NIL
  if L1_22 == L2_23 then
    L2_23 = _UPVALUE0_
    L2_23 = L2_23.NOT_EXIST
    return L2_23
  end
  L2_23 = db
  L2_23 = L2_23.getAttribute
  L2_23 = L2_23(_UPVALUE1_, _UPVALUE2_, L1_22, _UPVALUE3_.macAddress)
  if L2_23 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_22
  end
  return _UPVALUE0_.SUCCESS, L1_22, L2_23
end
function macAddressSet(A0_24, A1_25)
  local L2_26, L3_27
  L2_26 = db
  L2_26 = L2_26.getAttribute
  L3_27 = _UPVALUE0_
  L2_26 = L2_26(L3_27, _UPVALUE1_, A0_24, _UPVALUE2_.macAddressType)
  L3_27 = tonumber
  L3_27 = L3_27(L2_26)
  L2_26 = L3_27
  L3_27 = _UPVALUE3_
  if L2_26 ~= L3_27 then
    L3_27 = _UPVALUE4_
    L3_27 = L3_27.DEPENDENCY_NOT_MET
    return L3_27
  end
  L3_27 = _UPVALUE4_
  L3_27 = L3_27.NIL
  if A0_24 == L3_27 then
    L3_27 = _UPVALUE4_
    L3_27 = L3_27.INVALID_ARGUMENT
    return L3_27
  end
  L3_27 = tonumber
  L3_27 = L3_27(A0_24)
  if L3_27 == _UPVALUE4_.NIL then
    L3_27 = _UPVALUE4_
    L3_27 = L3_27.INVALID_ARGUMENT
    return L3_27
  end
  L3_27 = db
  L3_27 = L3_27.existsRow
  L3_27 = L3_27(_UPVALUE0_, _UPVALUE1_, A0_24)
  if L3_27 == _UPVALUE4_.FALSE then
    L3_27 = _UPVALUE4_
    L3_27 = L3_27.NOT_EXIST
    return L3_27
  end
  L3_27 = _UPVALUE4_
  L3_27 = L3_27.NIL
  if A1_25 == L3_27 then
    L3_27 = _UPVALUE4_
    L3_27 = L3_27.INVALID_ARGUMENT
    return L3_27
  end
  L3_27 = _UPVALUE5_
  L3_27 = L3_27.macAddressCheck
  L3_27 = L3_27(A1_25)
  valid = L3_27
  L3_27 = valid
  if L3_27 ~= _UPVALUE4_.SUCCESS then
    L3_27 = _UPVALUE4_
    L3_27 = L3_27.INVALID_ARGUMENT
    return L3_27
  end
  L3_27 = nil
  L3_27 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, A0_24, _UPVALUE2_.macAddress, A1_25)
  if L3_27 == _UPVALUE4_.FALSE then
    return _UPVALUE4_.FAILURE, A0_24
  end
  return _UPVALUE4_.SUCCESS, A0_24
end
function mtuTypeGet()
  local L0_28, L1_29
  L0_28 = db
  L0_28 = L0_28.getNextRowId
  L1_29 = _UPVALUE0_
  L0_28 = L0_28(L1_29, _UPVALUE1_)
  L1_29 = _UPVALUE2_
  L1_29 = L1_29.NIL
  if L0_28 == L1_29 then
    L1_29 = _UPVALUE2_
    L1_29 = L1_29.NOT_EXIST
    return L1_29
  end
  L1_29 = db
  L1_29 = L1_29.getAttribute
  L1_29 = L1_29(_UPVALUE1_, _UPVALUE3_, L0_28, _UPVALUE4_.mtuType)
  if L1_29 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_28, L1_29
end
function mtuTypeGetNext(A0_30)
  local L1_31, L2_32
  L1_31 = _UPVALUE0_
  L1_31 = L1_31.NIL
  if A0_30 == L1_31 then
    L1_31 = _UPVALUE0_
    L1_31 = L1_31.INVALID_ARGUMENT
    return L1_31
  end
  L1_31 = tonumber
  L2_32 = A0_30
  L1_31 = L1_31(L2_32)
  L2_32 = _UPVALUE0_
  L2_32 = L2_32.NIL
  if L1_31 == L2_32 then
    L1_31 = _UPVALUE0_
    L1_31 = L1_31.INVALID_ARGUMENT
    return L1_31
  end
  L1_31 = db
  L1_31 = L1_31.existsRow
  L2_32 = _UPVALUE1_
  L1_31 = L1_31(L2_32, _UPVALUE2_, A0_30)
  L2_32 = _UPVALUE0_
  L2_32 = L2_32.FALSE
  if L1_31 == L2_32 then
    L1_31 = _UPVALUE0_
    L1_31 = L1_31.NOT_EXIST
    return L1_31
  end
  L1_31 = nil
  L2_32 = db
  L2_32 = L2_32.getNextRowId
  L2_32 = L2_32(A0_30, _UPVALUE1_)
  L1_31 = L2_32
  L2_32 = _UPVALUE0_
  L2_32 = L2_32.NIL
  if L1_31 == L2_32 then
    L2_32 = _UPVALUE0_
    L2_32 = L2_32.NOT_EXIST
    return L2_32
  end
  L2_32 = db
  L2_32 = L2_32.getAttribute
  L2_32 = L2_32(_UPVALUE1_, _UPVALUE2_, L1_31, _UPVALUE3_.mtuType)
  if L2_32 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_31
  end
  return _UPVALUE0_.SUCCESS, L1_31, L2_32
end
function mtuTypeSet(A0_33, A1_34)
  local L2_35, L3_36
  L2_35 = _UPVALUE0_
  L2_35 = L2_35.NIL
  if A0_33 == L2_35 then
    L2_35 = _UPVALUE0_
    L2_35 = L2_35.INVALID_ARGUMENT
    return L2_35
  end
  L2_35 = tonumber
  L3_36 = A0_33
  L2_35 = L2_35(L3_36)
  L3_36 = _UPVALUE0_
  L3_36 = L3_36.NIL
  if L2_35 == L3_36 then
    L2_35 = _UPVALUE0_
    L2_35 = L2_35.INVALID_ARGUMENT
    return L2_35
  end
  L2_35 = db
  L2_35 = L2_35.existsRow
  L3_36 = _UPVALUE1_
  L2_35 = L2_35(L3_36, _UPVALUE2_, A0_33)
  L3_36 = _UPVALUE0_
  L3_36 = L3_36.FALSE
  if L2_35 == L3_36 then
    L2_35 = _UPVALUE0_
    L2_35 = L2_35.NOT_EXIST
    return L2_35
  end
  L2_35 = _UPVALUE0_
  L2_35 = L2_35.NIL
  if A1_34 == L2_35 then
    L2_35 = _UPVALUE0_
    L2_35 = L2_35.INVALID_ARGUMENT
    return L2_35
  end
  L2_35 = tonumber
  L3_36 = A1_34
  L2_35 = L2_35(L3_36)
  L3_36 = _UPVALUE0_
  L3_36 = L3_36.NIL
  if L2_35 == L3_36 then
    L3_36 = _UPVALUE0_
    L3_36 = L3_36.INVALID_ARGUMENT
    return L3_36
  end
  L3_36 = _UPVALUE3_
  if L2_35 ~= L3_36 then
    L3_36 = _UPVALUE4_
    if L2_35 ~= L3_36 then
      L3_36 = _UPVALUE0_
      L3_36 = L3_36.INVALID_ARGUMENT
      return L3_36
    end
  end
  L3_36 = nil
  L3_36 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_33, _UPVALUE5_.mtuType, A1_34)
  if L3_36 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_33
  end
  return _UPVALUE0_.SUCCESS, A0_33
end
function mtuGet()
  local L0_37, L1_38
  L0_37 = db
  L0_37 = L0_37.getNextRowId
  L1_38 = _UPVALUE0_
  L0_37 = L0_37(L1_38, _UPVALUE1_)
  L1_38 = _UPVALUE2_
  L1_38 = L1_38.NIL
  if L0_37 == L1_38 then
    L1_38 = _UPVALUE2_
    L1_38 = L1_38.NOT_EXIST
    return L1_38
  end
  L1_38 = db
  L1_38 = L1_38.getAttribute
  L1_38 = L1_38(_UPVALUE1_, _UPVALUE3_, L0_37, _UPVALUE4_.mtu)
  if L1_38 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_37, L1_38
end
function mtuGetNext(A0_39)
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
  L2_41 = L2_41(_UPVALUE1_, _UPVALUE2_, L1_40, _UPVALUE3_.mtu)
  if L2_41 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_40
  end
  return _UPVALUE0_.SUCCESS, L1_40, L2_41
end
function mtuSet(A0_42, A1_43)
  local L2_44, L3_45, L4_46
  L2_44 = db
  L2_44 = L2_44.getAttribute
  L3_45 = _UPVALUE0_
  L4_46 = _UPVALUE1_
  L2_44 = L2_44(L3_45, L4_46, A0_42, _UPVALUE2_.mtuType)
  L3_45 = tonumber
  L4_46 = L2_44
  L3_45 = L3_45(L4_46)
  L4_46 = _UPVALUE3_
  if L3_45 ~= L4_46 then
    L3_45 = _UPVALUE4_
    L3_45 = L3_45.DEPENDENCY_NOT_MET
    return L3_45
  end
  L3_45 = _UPVALUE4_
  L3_45 = L3_45.NIL
  if A0_42 == L3_45 then
    L3_45 = _UPVALUE4_
    L3_45 = L3_45.INVALID_ARGUMENT
    return L3_45
  end
  L3_45 = tonumber
  L4_46 = A0_42
  L3_45 = L3_45(L4_46)
  L4_46 = _UPVALUE4_
  L4_46 = L4_46.NIL
  if L3_45 == L4_46 then
    L3_45 = _UPVALUE4_
    L3_45 = L3_45.INVALID_ARGUMENT
    return L3_45
  end
  L3_45 = db
  L3_45 = L3_45.existsRow
  L4_46 = _UPVALUE0_
  L3_45 = L3_45(L4_46, _UPVALUE1_, A0_42)
  L4_46 = _UPVALUE4_
  L4_46 = L4_46.FALSE
  if L3_45 == L4_46 then
    L3_45 = _UPVALUE4_
    L3_45 = L3_45.NOT_EXIST
    return L3_45
  end
  L3_45 = _UPVALUE4_
  L3_45 = L3_45.NIL
  if A1_43 == L3_45 then
    L3_45 = _UPVALUE4_
    L3_45 = L3_45.INVALID_ARGUMENT
    return L3_45
  end
  L3_45 = tonumber
  L4_46 = A1_43
  L3_45 = L3_45(L4_46)
  L4_46 = _UPVALUE5_
  if not (L3_45 < L4_46) then
    L4_46 = _UPVALUE6_
  elseif L3_45 > L4_46 then
    L4_46 = _UPVALUE4_
    L4_46 = L4_46.INVALID_ARGUMENT
    return L4_46
  end
  L4_46 = nil
  L4_46 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, A0_42, _UPVALUE2_.mtu, A1_43)
  if L4_46 == _UPVALUE4_.FALSE then
    return _UPVALUE4_.FAILURE, A0_42
  end
  return _UPVALUE4_.SUCCESS, A0_42
end
function speedGet()
  local L0_47, L1_48
  L0_47 = db
  L0_47 = L0_47.getNextRowId
  L1_48 = _UPVALUE0_
  L0_47 = L0_47(L1_48, _UPVALUE1_)
  L1_48 = _UPVALUE2_
  L1_48 = L1_48.NIL
  if L0_47 == L1_48 then
    L1_48 = _UPVALUE2_
    L1_48 = L1_48.NOT_EXIST
    return L1_48
  end
  L1_48 = db
  L1_48 = L1_48.getAttribute
  L1_48 = L1_48(_UPVALUE1_, _UPVALUE3_, L0_47, _UPVALUE4_.speed)
  if L1_48 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_47, L1_48
end
function speedGetNext(A0_49)
  local L1_50, L2_51
  L1_50 = _UPVALUE0_
  L1_50 = L1_50.NIL
  if A0_49 == L1_50 then
    L1_50 = _UPVALUE0_
    L1_50 = L1_50.INVALID_ARGUMENT
    return L1_50
  end
  L1_50 = tonumber
  L2_51 = A0_49
  L1_50 = L1_50(L2_51)
  L2_51 = _UPVALUE0_
  L2_51 = L2_51.NIL
  if L1_50 == L2_51 then
    L1_50 = _UPVALUE0_
    L1_50 = L1_50.INVALID_ARGUMENT
    return L1_50
  end
  L1_50 = db
  L1_50 = L1_50.existsRow
  L2_51 = _UPVALUE1_
  L1_50 = L1_50(L2_51, _UPVALUE2_, A0_49)
  L2_51 = _UPVALUE0_
  L2_51 = L2_51.FALSE
  if L1_50 == L2_51 then
    L1_50 = _UPVALUE0_
    L1_50 = L1_50.NOT_EXIST
    return L1_50
  end
  L1_50 = nil
  L2_51 = db
  L2_51 = L2_51.getNextRowId
  L2_51 = L2_51(A0_49, _UPVALUE1_)
  L1_50 = L2_51
  L2_51 = _UPVALUE0_
  L2_51 = L2_51.NIL
  if L1_50 == L2_51 then
    L2_51 = _UPVALUE0_
    L2_51 = L2_51.NOT_EXIST
    return L2_51
  end
  L2_51 = db
  L2_51 = L2_51.getAttribute
  L2_51 = L2_51(_UPVALUE1_, _UPVALUE2_, L1_50, _UPVALUE3_.speed)
  if L2_51 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_50
  end
  return _UPVALUE0_.SUCCESS, L1_50, L2_51
end
function speedSet(A0_52, A1_53)
  local L2_54, L3_55
  L2_54 = _UPVALUE0_
  L2_54 = L2_54.NIL
  if A0_52 == L2_54 then
    L2_54 = _UPVALUE0_
    L2_54 = L2_54.INVALID_ARGUMENT
    return L2_54
  end
  L2_54 = tonumber
  L3_55 = A0_52
  L2_54 = L2_54(L3_55)
  L3_55 = _UPVALUE0_
  L3_55 = L3_55.NIL
  if L2_54 == L3_55 then
    L2_54 = _UPVALUE0_
    L2_54 = L2_54.INVALID_ARGUMENT
    return L2_54
  end
  L2_54 = db
  L2_54 = L2_54.existsRow
  L3_55 = _UPVALUE1_
  L2_54 = L2_54(L3_55, _UPVALUE2_, A0_52)
  L3_55 = _UPVALUE0_
  L3_55 = L3_55.FALSE
  if L2_54 == L3_55 then
    L2_54 = _UPVALUE0_
    L2_54 = L2_54.NOT_EXIST
    return L2_54
  end
  L2_54 = _UPVALUE0_
  L2_54 = L2_54.NIL
  if A1_53 == L2_54 then
    L2_54 = _UPVALUE0_
    L2_54 = L2_54.INVALID_ARGUMENT
    return L2_54
  end
  L2_54 = tonumber
  L3_55 = A1_53
  L2_54 = L2_54(L3_55)
  L3_55 = _UPVALUE3_
  if L2_54 ~= L3_55 then
    L3_55 = _UPVALUE4_
    if L2_54 ~= L3_55 then
      L3_55 = _UPVALUE5_
      if L2_54 ~= L3_55 then
        L3_55 = _UPVALUE6_
        if L2_54 ~= L3_55 then
          L3_55 = _UPVALUE7_
          if L2_54 ~= L3_55 then
            L3_55 = _UPVALUE8_
            if L2_54 ~= L3_55 then
              L3_55 = _UPVALUE9_
              if L2_54 ~= L3_55 then
                L3_55 = _UPVALUE0_
                L3_55 = L3_55.INVALID_ARGUMENT
                return L3_55
              end
            end
          end
        end
      end
    end
  end
  L3_55 = nil
  L3_55 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_52, _UPVALUE10_.speed, A1_53)
  if L3_55 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_52
  end
  return _UPVALUE0_.SUCCESS, A0_52
end
function wanPortGroupGet()
  local L0_56, L1_57, L2_58, L3_59, L4_60, L5_61, L6_62, L7_63
  L0_56 = db
  L0_56 = L0_56.getNextRowId
  L1_57 = _UPVALUE0_
  L2_58 = _UPVALUE1_
  L0_56 = L0_56(L1_57, L2_58)
  L1_57 = _UPVALUE2_
  L1_57 = L1_57.NIL
  if L0_56 == L1_57 then
    L1_57 = _UPVALUE2_
    L1_57 = L1_57.NOT_EXIST
    return L1_57
  end
  L1_57 = {}
  L2_58 = db
  L2_58 = L2_58.getRow
  L3_59 = _UPVALUE1_
  L4_60 = _UPVALUE3_
  L5_61 = L0_56
  L2_58 = L2_58(L3_59, L4_60, L5_61)
  L1_57 = L2_58
  L2_58 = _UPVALUE2_
  L2_58 = L2_58.NIL
  if L1_57 == L2_58 then
    L2_58 = _UPVALUE2_
    L2_58 = L2_58.FAILURE
    return L2_58
  end
  L2_58 = _UPVALUE1_
  L3_59 = "."
  L4_60 = _UPVALUE4_
  L4_60 = L4_60.wanPort
  L2_58 = L2_58 .. L3_59 .. L4_60
  L2_58 = L1_57[L2_58]
  L3_59 = _UPVALUE1_
  L4_60 = "."
  L5_61 = _UPVALUE4_
  L5_61 = L5_61.macAddressType
  L3_59 = L3_59 .. L4_60 .. L5_61
  L3_59 = L1_57[L3_59]
  L4_60 = _UPVALUE1_
  L5_61 = "."
  L6_62 = _UPVALUE4_
  L6_62 = L6_62.macAddress
  L4_60 = L4_60 .. L5_61 .. L6_62
  L4_60 = L1_57[L4_60]
  L5_61 = _UPVALUE1_
  L6_62 = "."
  L7_63 = _UPVALUE4_
  L7_63 = L7_63.mtuType
  L5_61 = L5_61 .. L6_62 .. L7_63
  L5_61 = L1_57[L5_61]
  L6_62 = _UPVALUE1_
  L7_63 = "."
  L6_62 = L6_62 .. L7_63 .. _UPVALUE4_.mtu
  L6_62 = L1_57[L6_62]
  L7_63 = _UPVALUE1_
  L7_63 = L7_63 .. "." .. _UPVALUE4_.speed
  L7_63 = L1_57[L7_63]
  return _UPVALUE2_.SUCCESS, L0_56, L2_58, L3_59, L4_60, L5_61, L6_62, L7_63
end
function wanPortGroupGetNext(A0_64)
  local L1_65, L2_66, L3_67, L4_68, L5_69, L6_70, L7_71, L8_72
  L1_65 = _UPVALUE0_
  L1_65 = L1_65.NIL
  if A0_64 == L1_65 then
    L1_65 = _UPVALUE0_
    L1_65 = L1_65.INVALID_ARGUMENT
    return L1_65
  end
  L1_65 = tonumber
  L2_66 = A0_64
  L1_65 = L1_65(L2_66)
  L2_66 = _UPVALUE0_
  L2_66 = L2_66.NIL
  if L1_65 == L2_66 then
    L1_65 = _UPVALUE0_
    L1_65 = L1_65.INVALID_ARGUMENT
    return L1_65
  end
  L1_65 = db
  L1_65 = L1_65.existsRow
  L2_66 = _UPVALUE1_
  L3_67 = _UPVALUE2_
  L4_68 = A0_64
  L1_65 = L1_65(L2_66, L3_67, L4_68)
  L2_66 = _UPVALUE0_
  L2_66 = L2_66.FALSE
  if L1_65 == L2_66 then
    L1_65 = _UPVALUE0_
    L1_65 = L1_65.NOT_EXIST
    return L1_65
  end
  L1_65 = nil
  L2_66 = db
  L2_66 = L2_66.getNextRowId
  L3_67 = A0_64
  L4_68 = _UPVALUE1_
  L2_66 = L2_66(L3_67, L4_68)
  L1_65 = L2_66
  L2_66 = _UPVALUE0_
  L2_66 = L2_66.NIL
  if L1_65 == L2_66 then
    L2_66 = _UPVALUE0_
    L2_66 = L2_66.NOT_EXIST
    return L2_66
  end
  L2_66 = {}
  L3_67 = db
  L3_67 = L3_67.getRow
  L4_68 = _UPVALUE1_
  L5_69 = _UPVALUE2_
  L6_70 = L1_65
  L3_67 = L3_67(L4_68, L5_69, L6_70)
  L2_66 = L3_67
  L3_67 = _UPVALUE0_
  L3_67 = L3_67.NIL
  if L2_66 == L3_67 then
    L3_67 = _UPVALUE0_
    L3_67 = L3_67.FAILURE
    L4_68 = A0_64
    return L3_67, L4_68
  end
  L3_67 = _UPVALUE1_
  L4_68 = "."
  L5_69 = _UPVALUE3_
  L5_69 = L5_69.wanPort
  L3_67 = L3_67 .. L4_68 .. L5_69
  L3_67 = L2_66[L3_67]
  L4_68 = _UPVALUE1_
  L5_69 = "."
  L6_70 = _UPVALUE3_
  L6_70 = L6_70.macAddressType
  L4_68 = L4_68 .. L5_69 .. L6_70
  L4_68 = L2_66[L4_68]
  L5_69 = _UPVALUE1_
  L6_70 = "."
  L7_71 = _UPVALUE3_
  L7_71 = L7_71.macAddress
  L5_69 = L5_69 .. L6_70 .. L7_71
  L5_69 = L2_66[L5_69]
  L6_70 = _UPVALUE1_
  L7_71 = "."
  L8_72 = _UPVALUE3_
  L8_72 = L8_72.mtuType
  L6_70 = L6_70 .. L7_71 .. L8_72
  L6_70 = L2_66[L6_70]
  L7_71 = _UPVALUE1_
  L8_72 = "."
  L7_71 = L7_71 .. L8_72 .. _UPVALUE3_.mtu
  L7_71 = L2_66[L7_71]
  L8_72 = _UPVALUE1_
  L8_72 = L8_72 .. "." .. _UPVALUE3_.speed
  L8_72 = L2_66[L8_72]
  return _UPVALUE0_.SUCCESS, L1_65, L3_67, L4_68, L5_69, L6_70, L7_71, L8_72
end
function portGroupGet(A0_73, A1_74)
  local L2_75, L3_76, L4_77, L5_78, L6_79, L7_80, L8_81, L9_82, L10_83, L11_84, L12_85, L13_86, L14_87, L15_88
  L2_75 = _UPVALUE0_
  L2_75 = L2_75.NIL
  if A0_73 == L2_75 then
    L2_75 = _UPVALUE0_
    L2_75 = L2_75.INVALID_ARGUMENT
    return L2_75
  end
  L2_75 = _UPVALUE0_
  L2_75 = L2_75.NIL
  if A1_74 == L2_75 then
    L2_75 = _UPVALUE0_
    L2_75 = L2_75.INVALID_ARGUMENT
    return L2_75
  end
  L2_75 = _UPVALUE1_
  if A0_73 ~= L2_75 then
    L2_75 = _UPVALUE2_
    if A0_73 ~= L2_75 then
      L2_75 = _UPVALUE3_
      if A0_73 ~= L2_75 then
        L2_75 = _UPVALUE4_
        if A0_73 ~= L2_75 then
          L2_75 = _UPVALUE0_
          L2_75 = L2_75.INVALID_ARGUMENT
          return L2_75
        end
      end
    end
  end
  L2_75 = _UPVALUE5_
  if A1_74 ~= L2_75 then
    L2_75 = _UPVALUE6_
    if A1_74 ~= L2_75 then
      L2_75 = _UPVALUE0_
      L2_75 = L2_75.INVALID_ARGUMENT
      return L2_75
    end
  end
  L2_75 = _UPVALUE7_
  L2_75 = L2_75.wanPort
  L3_76 = " = '"
  L4_77 = A0_73
  L5_78 = "' AND "
  L6_79 = _UPVALUE7_
  L6_79 = L6_79.addressFamily
  L7_80 = " = '"
  L8_81 = A1_74
  L9_82 = "'"
  L2_75 = L2_75 .. L3_76 .. L4_77 .. L5_78 .. L6_79 .. L7_80 .. L8_81 .. L9_82
  L3_76 = nil
  L4_77 = db
  L4_77 = L4_77.getAttributeWhere
  L5_78 = _UPVALUE8_
  L6_79 = L2_75
  L7_80 = _UPVALUE9_
  L4_77 = L4_77(L5_78, L6_79, L7_80)
  L3_76 = L4_77
  L4_77 = _UPVALUE0_
  L4_77 = L4_77.NIL
  if L3_76 == L4_77 then
    L4_77 = _UPVALUE0_
    L4_77 = L4_77.NOT_EXIST
    return L4_77
  end
  L4_77 = {}
  L5_78 = db
  L5_78 = L5_78.getRow
  L6_79 = _UPVALUE8_
  L7_80 = _UPVALUE9_
  L8_81 = L3_76
  L5_78 = L5_78(L6_79, L7_80, L8_81)
  L4_77 = L5_78
  L5_78 = {}
  L6_79 = "0"
  L7_80 = _UPVALUE4_
  if A0_73 == L7_80 then
    L6_79 = "1"
  end
  if L6_79 == "0" then
    L7_80 = nil
    L8_81 = _UPVALUE1_
    if A0_73 == L8_81 then
      L7_80 = _UPVALUE10_
    else
      L8_81 = _UPVALUE2_
      if A0_73 == L8_81 then
        L8_81 = UNIT_NAME
        if L8_81 ~= "DSR-250" then
          L8_81 = UNIT_NAME
          if L8_81 ~= "DSR-250N" then
            L8_81 = UNIT_NAME
            if L8_81 ~= "DSR-150" then
              L8_81 = UNIT_NAME
            end
          end
        else
          if L8_81 == "DSR-150N" then
            L7_80 = "Port8"
        end
        else
          L7_80 = _UPVALUE11_
        end
      end
    end
    L8_81 = _UPVALUE7_
    L8_81 = L8_81.portName
    L9_82 = " = '"
    L10_83 = L7_80
    L11_84 = "'"
    L8_81 = L8_81 .. L9_82 .. L10_83 .. L11_84
    L9_82 = nil
    L10_83 = db
    L10_83 = L10_83.getAttributeWhere
    L11_84 = _UPVALUE12_
    L12_85 = L8_81
    L13_86 = _UPVALUE9_
    L10_83 = L10_83(L11_84, L12_85, L13_86)
    L9_82 = L10_83
    L10_83 = db
    L10_83 = L10_83.getRow
    L11_84 = _UPVALUE12_
    L12_85 = _UPVALUE9_
    L13_86 = L9_82
    L10_83 = L10_83(L11_84, L12_85, L13_86)
    L5_78 = L10_83
    L10_83 = _UPVALUE0_
    L10_83 = L10_83.NIL
    if L4_77 == L10_83 then
      L10_83 = _UPVALUE0_
      L10_83 = L10_83.NIL
      if L5_78 == L10_83 then
        L10_83 = _UPVALUE0_
        L10_83 = L10_83.FAILURE
        L11_84 = cookie
        return L10_83, L11_84
      end
    end
  end
  L7_80 = _UPVALUE8_
  L8_81 = "."
  L9_82 = _UPVALUE7_
  L9_82 = L9_82.wanPort
  L7_80 = L7_80 .. L8_81 .. L9_82
  L7_80 = L4_77[L7_80]
  L8_81 = _UPVALUE8_
  L9_82 = "."
  L10_83 = _UPVALUE7_
  L10_83 = L10_83.macAddressType
  L8_81 = L8_81 .. L9_82 .. L10_83
  L8_81 = L4_77[L8_81]
  L9_82 = _UPVALUE8_
  L10_83 = "."
  L11_84 = _UPVALUE7_
  L11_84 = L11_84.macAddress
  L9_82 = L9_82 .. L10_83 .. L11_84
  L9_82 = L4_77[L9_82]
  L10_83 = _UPVALUE8_
  L11_84 = "."
  L12_85 = _UPVALUE7_
  L12_85 = L12_85.mtuType
  L10_83 = L10_83 .. L11_84 .. L12_85
  L10_83 = L4_77[L10_83]
  L11_84 = _UPVALUE8_
  L12_85 = "."
  L13_86 = _UPVALUE7_
  L13_86 = L13_86.mtu
  L11_84 = L11_84 .. L12_85 .. L13_86
  L11_84 = L4_77[L11_84]
  L12_85 = _UPVALUE12_
  L13_86 = "."
  L14_87 = _UPVALUE7_
  L14_87 = L14_87.autoNegEnable
  L12_85 = L12_85 .. L13_86 .. L14_87
  L12_85 = L5_78[L12_85]
  L13_86 = _UPVALUE12_
  L14_87 = "."
  L15_88 = _UPVALUE7_
  L15_88 = L15_88.duplexMode
  L13_86 = L13_86 .. L14_87 .. L15_88
  L13_86 = L5_78[L13_86]
  L14_87 = _UPVALUE12_
  L15_88 = "."
  L14_87 = L14_87 .. L15_88 .. _UPVALUE7_.portSpeed
  L14_87 = L5_78[L14_87]
  L15_88 = nil
  if L12_85 ~= _UPVALUE0_.NIL then
    if L12_85 == _UPVALUE13_ then
      L15_88 = _UPVALUE14_
    elseif L14_87 == _UPVALUE15_ and L13_86 == _UPVALUE16_ then
      L15_88 = _UPVALUE17_
    elseif L14_87 == _UPVALUE15_ and L13_86 == _UPVALUE13_ then
      L15_88 = _UPVALUE18_
    elseif L14_87 == _UPVALUE19_ and L13_86 == _UPVALUE16_ then
      L15_88 = _UPVALUE20_
    elseif L14_87 == _UPVALUE19_ and L13_86 == _UPVALUE13_ then
      L15_88 = _UPVALUE21_
    elseif L14_87 == _UPVALUE22_ and L13_86 == _UPVALUE16_ then
      L15_88 = _UPVALUE23_
    elseif L14_87 == _UPVALUE22_ and L13_86 == _UPVALUE13_ then
      L15_88 = _UPVALUE24_
    end
  end
  return _UPVALUE0_.SUCCESS, L3_76, L7_80, L8_81, L9_82, L10_83, L11_84, L15_88
end
function wanPortGroupSet(A0_89, A1_90, A2_91, A3_92, A4_93, A5_94, A6_95, A7_96, A8_97)
  local L9_98, L10_99, L11_100, L12_101, L13_102, L14_103, L15_104, L16_105, L17_106, L18_107, L19_108, L20_109, L21_110, L22_111, L23_112, L24_113
  L9_98 = _UPVALUE0_
  L9_98 = L9_98.NIL
  if A0_89 == L9_98 then
    L9_98 = _UPVALUE0_
    L9_98 = L9_98.INVALID_ARGUMENT
    return L9_98
  end
  L9_98 = tonumber
  L10_99 = A0_89
  L9_98 = L9_98(L10_99)
  L10_99 = _UPVALUE0_
  L10_99 = L10_99.NIL
  if L9_98 == L10_99 then
    L9_98 = _UPVALUE0_
    L9_98 = L9_98.INVALID_ARGUMENT
    return L9_98
  end
  L9_98 = db
  L9_98 = L9_98.existsRow
  L10_99 = _UPVALUE1_
  L11_100 = _UPVALUE2_
  L12_101 = A0_89
  L9_98 = L9_98(L10_99, L11_100, L12_101)
  L10_99 = _UPVALUE0_
  L10_99 = L10_99.FALSE
  if L9_98 == L10_99 then
    L9_98 = _UPVALUE0_
    L9_98 = L9_98.NOT_EXIST
    return L9_98
  end
  L9_98 = _UPVALUE0_
  L9_98 = L9_98.NIL
  if A7_96 == L9_98 then
    L9_98 = _UPVALUE0_
    L9_98 = L9_98.INVALID_ARGUMENT
    return L9_98
  end
  L9_98 = _UPVALUE0_
  L9_98 = L9_98.NIL
  if A1_90 == L9_98 then
    L9_98 = _UPVALUE0_
    L9_98 = L9_98.INVALID_ARGUMENT
    return L9_98
  end
  L9_98 = _UPVALUE3_
  if A1_90 ~= L9_98 then
    L9_98 = _UPVALUE4_
    if A1_90 ~= L9_98 then
      L9_98 = _UPVALUE5_
      if A1_90 ~= L9_98 then
        L9_98 = _UPVALUE6_
        if A1_90 ~= L9_98 then
          L9_98 = _UPVALUE0_
          L9_98 = L9_98.INVALID_ARGUMENT
          return L9_98
        end
      end
    end
  end
  L9_98 = _UPVALUE7_
  L10_99 = _UPVALUE8_
  L10_99 = L10_99.wanPort
  L11_100 = " = '"
  L12_101 = A1_90
  L13_102 = "' AND "
  L14_103 = _UPVALUE8_
  L14_103 = L14_103.addressFamily
  L15_104 = " = '"
  L16_105 = L9_98
  L17_106 = "'"
  L10_99 = L10_99 .. L11_100 .. L12_101 .. L13_102 .. L14_103 .. L15_104 .. L16_105 .. L17_106
  L11_100 = nil
  L12_101 = db
  L12_101 = L12_101.getAttributeWhere
  L13_102 = _UPVALUE1_
  L14_103 = L10_99
  L15_104 = _UPVALUE2_
  L12_101 = L12_101(L13_102, L14_103, L15_104)
  L11_100 = L12_101
  L12_101 = _UPVALUE0_
  L12_101 = L12_101.NIL
  if A2_91 ~= L12_101 then
    L12_101 = tonumber
    L13_102 = A2_91
    L12_101 = L12_101(L13_102)
    L13_102 = _UPVALUE0_
    L13_102 = L13_102.NIL
    if L12_101 == L13_102 then
      L13_102 = _UPVALUE0_
      L13_102 = L13_102.INVALID_ARGUMENT
      return L13_102
    end
    L13_102 = _UPVALUE9_
    if L12_101 ~= L13_102 then
      L13_102 = _UPVALUE10_
      if L12_101 ~= L13_102 then
        L13_102 = _UPVALUE11_
        if L12_101 ~= L13_102 then
          L13_102 = _UPVALUE0_
          L13_102 = L13_102.INVALID_ARGUMENT
          return L13_102
        end
      end
    end
    L13_102 = _UPVALUE1_
    L14_103 = "."
    L15_104 = _UPVALUE8_
    L15_104 = L15_104.macAddressType
    L13_102 = L13_102 .. L14_103 .. L15_104
    A7_96[L13_102] = A2_91
    L13_102 = tonumber
    L14_103 = A2_91
    L13_102 = L13_102(L14_103)
    L14_103 = _UPVALUE11_
    if L13_102 == L14_103 then
      L13_102 = _UPVALUE0_
      L13_102 = L13_102.NIL
      if A3_92 == L13_102 then
        L13_102 = _UPVALUE0_
        L13_102 = L13_102.INVALID_ARGUMENT
        return L13_102
      end
      L13_102 = _UPVALUE12_
      L13_102 = L13_102.macAddressCheck
      L14_103 = A3_92
      L13_102 = L13_102(L14_103)
      valid = L13_102
      L13_102 = valid
      L14_103 = _UPVALUE0_
      L14_103 = L14_103.SUCCESS
      if L13_102 ~= L14_103 then
        L13_102 = _UPVALUE13_
        L13_102 = L13_102.WAN_PORT_INVALID_MAC_ADDRESS
        return L13_102
      end
      L13_102 = db
      L13_102 = L13_102.getAttribute
      L14_103 = "defaultMac"
      L15_104 = "logicalName"
      L16_105 = "WAN1"
      L17_106 = "macAddress"
      L13_102 = L13_102(L14_103, L15_104, L16_105, L17_106)
      L13_102 = L13_102 or ""
      L14_103 = db
      L14_103 = L14_103.getAttribute
      L15_104 = "defaultMac"
      L16_105 = "logicalName"
      L17_106 = "WAN2"
      L18_107 = "macAddress"
      L14_103 = L14_103(L15_104, L16_105, L17_106, L18_107)
      L14_103 = L14_103 or ""
      L15_104 = db
      L15_104 = L15_104.getAttribute
      L16_105 = "networkInterface"
      L17_106 = "LogicalIfName"
      L18_107 = "WAN1"
      L19_108 = "interfaceName"
      L15_104 = L15_104(L16_105, L17_106, L18_107, L19_108)
      L15_104 = L15_104 or ""
      L16_105 = db
      L16_105 = L16_105.getAttribute
      L17_106 = "networkInterface"
      L18_107 = "LogicalIfName"
      L19_108 = "WAN2"
      L20_109 = "interfaceName"
      L16_105 = L16_105(L17_106, L18_107, L19_108, L20_109)
      L16_105 = L16_105 or ""
      L17_106 = {}
      L18_107 = {}
      L19_108 = _UPVALUE3_
      if A1_90 == L19_108 then
        L19_108 = A3_92
        if L14_103 ~= "" then
          L20_109 = string
          L20_109 = L20_109.upper
          L21_110 = L19_108
          L20_109 = L20_109(L21_110)
          L21_110 = string
          L21_110 = L21_110.upper
          L22_111 = L14_103
          L21_110 = L21_110(L22_111)
          if L20_109 == L21_110 then
            L20_109 = _UPVALUE13_
            L20_109 = L20_109.WAN_PORT_ALREADY_USED_MAC_ADDRESS
            return L20_109
          end
        end
        L20_109 = ""
        L21_110 = ""
        L22_111 = "/sbin/ifconfig | grep "
        L23_112 = L15_104
        L24_113 = " | awk '{print $5}'"
        L22_111 = L22_111 .. L23_112 .. L24_113
        L23_112 = assert
        L24_113 = io
        L24_113 = L24_113.popen
        L24_113 = L24_113(L22_111)
        L23_112 = L23_112(L24_113, L24_113(L22_111))
        if L23_112 then
          while true do
            L24_113 = L23_112.read
            L24_113 = L24_113(L23_112, "*line")
            L21_110 = L24_113
            if L21_110 == nil then
              break
            end
            L24_113 = string
            L24_113 = L24_113.upper
            L24_113 = L24_113(L21_110)
            L20_109 = L24_113
          end
          L24_113 = L23_112.close
          L24_113(L23_112)
        end
        L24_113 = _UPVALUE0_
        L24_113 = L24_113.NIL
        if L20_109 == L24_113 then
          L24_113 = db
          L24_113 = L24_113.getAttribute
          L24_113 = L24_113("defaultMac", "logicalName", "WAN2", "macAddress")
          L20_109 = L24_113 or ""
        end
        L24_113 = string
        L24_113 = L24_113.upper
        L24_113 = L24_113(L19_108)
        if L24_113 == string.upper(L20_109) then
          L24_113 = _UPVALUE1_
          L24_113 = L24_113 .. "." .. _UPVALUE8_.macAddress
          A7_96[L24_113] = A3_92
        else
          L24_113 = "cat /sys/class/net/*/address"
          if assert(io.popen(L24_113)) then
            while true do
              L18_107 = assert(io.popen(L24_113)):read("*line")
              if L18_107 == nil then
                break
              end
              L17_106 = string.upper(L18_107)
              if L17_106 == string.upper(L19_108) then
                return _UPVALUE13_.WAN_PORT_ALREADY_USED_MAC_ADDRESS
              end
            end
            assert(io.popen(L24_113)):close()
            else
              L19_108 = _UPVALUE4_
              if A1_90 == L19_108 then
                L19_108 = A3_92
                L20_109 = string
                L20_109 = L20_109.upper
                L21_110 = L19_108
                L20_109 = L20_109(L21_110)
                L21_110 = string
                L21_110 = L21_110.upper
                L22_111 = L13_102
                L21_110 = L21_110(L22_111)
                if L20_109 == L21_110 then
                  L20_109 = _UPVALUE13_
                  L20_109 = L20_109.WAN_PORT_ALREADY_USED_MAC_ADDRESS
                  return L20_109
                end
                L20_109 = "/sbin/ifconfig | grep "
                L21_110 = L16_105
                L22_111 = " | awk '{print $5}'"
                L20_109 = L20_109 .. L21_110 .. L22_111
                L21_110 = assert
                L22_111 = io
                L22_111 = L22_111.popen
                L23_112 = L20_109
                L24_113 = L22_111(L23_112)
                L21_110 = L21_110(L22_111, L23_112, L24_113, L22_111(L23_112))
                if L21_110 then
                  while true do
                    L23_112 = L21_110
                    L22_111 = L21_110.read
                    L24_113 = "*line"
                    L22_111 = L22_111(L23_112, L24_113)
                    CONTENT = L22_111
                    L22_111 = CONTENT
                    if L22_111 == nil then
                      break
                    end
                    L22_111 = string
                    L22_111 = L22_111.upper
                    L23_112 = CONTENT
                    L22_111 = L22_111(L23_112)
                    MAC = L22_111
                  end
                  L23_112 = L21_110
                  L22_111 = L21_110.close
                  L22_111(L23_112)
                end
                L22_111 = string
                L22_111 = L22_111.upper
                L23_112 = L19_108
                L22_111 = L22_111(L23_112)
                L23_112 = string
                L23_112 = L23_112.upper
                L24_113 = MAC
                L23_112 = L23_112(L24_113)
                if L22_111 == L23_112 then
                  L22_111 = _UPVALUE1_
                  L23_112 = "."
                  L24_113 = _UPVALUE8_
                  L24_113 = L24_113.macAddress
                  L22_111 = L22_111 .. L23_112 .. L24_113
                  A7_96[L22_111] = A3_92
                else
                  L22_111 = "cat /sys/class/net/*/address"
                  L23_112 = assert
                  L24_113 = io
                  L24_113 = L24_113.popen
                  L24_113 = L24_113(L22_111)
                  L23_112 = L23_112(L24_113, L24_113(L22_111))
                  if L23_112 then
                    while true do
                      L24_113 = L23_112.read
                      L24_113 = L24_113(L23_112, "*line")
                      L18_107 = L24_113
                      if L18_107 == nil then
                        break
                      end
                      L24_113 = string
                      L24_113 = L24_113.upper
                      L24_113 = L24_113(L18_107)
                      L17_106 = L24_113
                      L24_113 = string
                      L24_113 = L24_113.upper
                      L24_113 = L24_113(L19_108)
                      if L17_106 == L24_113 then
                        L24_113 = _UPVALUE13_
                        L24_113 = L24_113.WAN_PORT_ALREADY_USED_MAC_ADDRESS
                        return L24_113
                      end
                    end
                    L24_113 = L23_112.close
                    L24_113(L23_112)
                  end
                end
              end
            end
          end
        end
    end
    L13_102 = _UPVALUE1_
    L14_103 = "."
    L15_104 = _UPVALUE8_
    L15_104 = L15_104.macAddress
    L13_102 = L13_102 .. L14_103 .. L15_104
    A7_96[L13_102] = A3_92
    L13_102 = {}
    L14_103 = SAPI
    if L14_103 ~= nil then
      L14_103 = SAPI
      L14_103 = L14_103.Request
      L14_103 = L14_103.servervariable
      L15_104 = "REMOTE_ADDR"
      L14_103 = L14_103(L15_104)
      L15_104 = "cat /proc/net/arp | grep "
      L16_105 = L14_103
      L17_106 = " |  awk '{print $4}'"
      L15_104 = L15_104 .. L16_105 .. L17_106
      L16_105 = {}
      L17_106 = assert
      L18_107 = io
      L18_107 = L18_107.popen
      L19_108 = L15_104
      L24_113 = L18_107(L19_108)
      L17_106 = L17_106(L18_107, L19_108, L20_109, L21_110, L22_111, L23_112, L24_113, L18_107(L19_108))
      if L17_106 then
        while true do
          L19_108 = L17_106
          L18_107 = L17_106.read
          L20_109 = "*line"
          L18_107 = L18_107(L19_108, L20_109)
          L16_105 = L18_107
          if L16_105 == nil then
            break
          end
          L18_107 = string
          L18_107 = L18_107.upper
          L19_108 = L16_105
          L18_107 = L18_107(L19_108)
          L13_102 = L18_107
        end
        L19_108 = L17_106
        L18_107 = L17_106.close
        L18_107(L19_108)
      end
    end
    L14_103 = tonumber
    L15_104 = A2_91
    L14_103 = L14_103(L15_104)
    L15_104 = _UPVALUE10_
    if L14_103 == L15_104 then
      A3_92 = L13_102
      L14_103 = _UPVALUE3_
      if A1_90 == L14_103 then
        L14_103 = db
        L14_103 = L14_103.getAttribute
        L15_104 = _UPVALUE1_
        L16_105 = _UPVALUE8_
        L16_105 = L16_105.wanPort
        L17_106 = _UPVALUE4_
        L18_107 = _UPVALUE8_
        L18_107 = L18_107.macAddress
        L14_103 = L14_103(L15_104, L16_105, L17_106, L18_107)
        L15_104 = string
        L15_104 = L15_104.upper
        L16_105 = L14_103
        L15_104 = L15_104(L16_105)
        if L13_102 == L15_104 then
          L15_104 = _UPVALUE13_
          L15_104 = L15_104.WAN_PORT_ALREADY_USED_CLONE_MAC_ADDRESS
          return L15_104
        end
      else
        L14_103 = _UPVALUE4_
        if A1_90 == L14_103 then
          L14_103 = db
          L14_103 = L14_103.getAttribute
          L15_104 = _UPVALUE1_
          L16_105 = _UPVALUE8_
          L16_105 = L16_105.wanPort
          L17_106 = _UPVALUE3_
          L18_107 = _UPVALUE8_
          L18_107 = L18_107.macAddress
          L14_103 = L14_103(L15_104, L16_105, L17_106, L18_107)
          L15_104 = string
          L15_104 = L15_104.upper
          L16_105 = L14_103
          L15_104 = L15_104(L16_105)
          if L13_102 == L15_104 then
            L15_104 = _UPVALUE13_
            L15_104 = L15_104.WAN_PORT_ALREADY_USED_CLONE_MAC_ADDRESS
            return L15_104
          end
        end
      end
    end
    L14_103 = _UPVALUE1_
    L15_104 = "."
    L16_105 = _UPVALUE8_
    L16_105 = L16_105.macAddress
    L14_103 = L14_103 .. L15_104 .. L16_105
    A7_96[L14_103] = A3_92
    L14_103 = tonumber
    L15_104 = A2_91
    L14_103 = L14_103(L15_104)
    L15_104 = _UPVALUE9_
    if L14_103 == L15_104 then
      A3_92 = "00:00:00:00:00:00"
    end
    L14_103 = _UPVALUE1_
    L15_104 = "."
    L16_105 = _UPVALUE8_
    L16_105 = L16_105.macAddress
    L14_103 = L14_103 .. L15_104 .. L16_105
    A7_96[L14_103] = A3_92
  end
  L12_101 = _UPVALUE0_
  L12_101 = L12_101.NIL
  if A4_93 == L12_101 then
    L12_101 = _UPVALUE0_
    L12_101 = L12_101.INVALID_ARGUMENT
    return L12_101
  end
  L12_101 = tonumber
  L13_102 = A4_93
  L12_101 = L12_101(L13_102)
  L13_102 = _UPVALUE0_
  L13_102 = L13_102.NIL
  if L12_101 == L13_102 then
    L13_102 = _UPVALUE0_
    L13_102 = L13_102.INVALID_ARGUMENT
    return L13_102
  end
  L13_102 = _UPVALUE14_
  if L12_101 ~= L13_102 then
    L13_102 = _UPVALUE15_
    if L12_101 ~= L13_102 then
      L13_102 = _UPVALUE0_
      L13_102 = L13_102.INVALID_ARGUMENT
      return L13_102
    end
  end
  L13_102 = _UPVALUE1_
  L14_103 = "."
  L15_104 = _UPVALUE8_
  L15_104 = L15_104.mtuType
  L13_102 = L13_102 .. L14_103 .. L15_104
  A7_96[L13_102] = A4_93
  L13_102 = tonumber
  L14_103 = A4_93
  L13_102 = L13_102(L14_103)
  L14_103 = _UPVALUE14_
  if L13_102 == L14_103 then
    L13_102 = db
    L13_102 = L13_102.getAttribute
    L14_103 = _UPVALUE1_
    L15_104 = _UPVALUE2_
    L16_105 = L11_100
    L17_106 = _UPVALUE8_
    L17_106 = L17_106.requireLogin
    L13_102 = L13_102(L14_103, L15_104, L16_105, L17_106)
    if L13_102 == "0" then
      L14_103 = _UPVALUE1_
      L15_104 = "."
      L16_105 = _UPVALUE8_
      L16_105 = L16_105.mtu
      L14_103 = L14_103 .. L15_104 .. L16_105
      A7_96[L14_103] = "1500"
    elseif L13_102 == "1" then
      L14_103 = _UPVALUE1_
      L15_104 = "."
      L16_105 = _UPVALUE8_
      L16_105 = L16_105.mtu
      L14_103 = L14_103 .. L15_104 .. L16_105
      A7_96[L14_103] = "1492"
    end
  end
  L13_102 = tonumber
  L14_103 = A4_93
  L13_102 = L13_102(L14_103)
  L14_103 = _UPVALUE15_
  if L13_102 == L14_103 then
    L13_102 = _UPVALUE0_
    L13_102 = L13_102.NIL
    if A5_94 == L13_102 then
      L13_102 = _UPVALUE0_
      L13_102 = L13_102.INVALID_ARGUMENT
      return L13_102
    end
    L13_102 = tonumber
    L14_103 = A5_94
    L13_102 = L13_102(L14_103)
    L14_103 = UNIT_NAME
    if L14_103 ~= "DSR-150" then
      L14_103 = UNIT_NAME
      if L14_103 ~= "DSR-150N" then
        L14_103 = _UPVALUE16_
        L14_103 = L14_103.jumboGet
        L15_104 = L14_103()
        L16_105 = tonumber
        L17_106 = L15_104
        L16_105 = L16_105(L17_106)
        if L16_105 == 1 then
          L16_105 = A7_96["NimfConf.ConnectionType"]
          if L16_105 ~= "ifStatic" then
            L16_105 = A7_96["NimfConf.ConnectionType"]
          else
            if L16_105 == "dhcpc" then
              L16_105 = _UPVALUE17_
              if not (L13_102 < L16_105) then
                L16_105 = _UPVALUE18_
              elseif L13_102 > L16_105 then
                L16_105 = _UPVALUE0_
                L16_105 = L16_105.INVALID_ARGUMENT
                return L16_105
              end
          end
          else
            L16_105 = _UPVALUE19_
            if not (L13_102 < L16_105) then
              L16_105 = _UPVALUE20_
            elseif L13_102 > L16_105 then
              L16_105 = _UPVALUE0_
              L16_105 = L16_105.INVALID_ARGUMENT
              return L16_105
            end
          end
        else
          L16_105 = _UPVALUE19_
          if not (L13_102 < L16_105) then
            L16_105 = _UPVALUE20_
          elseif L13_102 > L16_105 then
            L16_105 = _UPVALUE0_
            L16_105 = L16_105.INVALID_ARGUMENT
            return L16_105
          end
        end
      end
    else
      L14_103 = _UPVALUE19_
      if not (L13_102 < L14_103) then
        L14_103 = _UPVALUE20_
      elseif L13_102 > L14_103 then
        L14_103 = _UPVALUE0_
        L14_103 = L14_103.INVALID_ARGUMENT
        return L14_103
      end
    end
    L14_103 = _UPVALUE1_
    L15_104 = "."
    L16_105 = _UPVALUE8_
    L16_105 = L16_105.mtu
    L14_103 = L14_103 .. L15_104 .. L16_105
    A7_96[L14_103] = A5_94
  end
  L13_102 = {}
  L14_103 = _UPVALUE0_
  L14_103 = L14_103.NIL
  if A6_95 ~= L14_103 then
    L14_103 = tonumber
    L15_104 = A6_95
    L14_103 = L14_103(L15_104)
    L15_104 = _UPVALUE21_
    if L14_103 ~= L15_104 then
      L15_104 = _UPVALUE22_
      if L14_103 ~= L15_104 then
        L15_104 = _UPVALUE23_
        if L14_103 ~= L15_104 then
          L15_104 = _UPVALUE24_
          if L14_103 ~= L15_104 then
            L15_104 = _UPVALUE25_
            if L14_103 ~= L15_104 then
              L15_104 = _UPVALUE26_
              if L14_103 ~= L15_104 then
                L15_104 = _UPVALUE27_
                if L14_103 ~= L15_104 then
                  L15_104 = _UPVALUE0_
                  L15_104 = L15_104.INVALID_ARGUMENT
                  return L15_104
                end
              end
            end
          end
        end
      end
    end
    L15_104 = _UPVALUE22_
    if L14_103 ~= L15_104 then
      L15_104 = _UPVALUE24_
      if L14_103 ~= L15_104 then
        L15_104 = _UPVALUE26_
      end
    else
      if L14_103 == L15_104 then
        L15_104 = _UPVALUE28_
        L16_105 = "."
        L17_106 = _UPVALUE8_
        L17_106 = L17_106.duplexMode
        L15_104 = L15_104 .. L16_105 .. L17_106
        L16_105 = _UPVALUE29_
        L13_102[L15_104] = L16_105
    end
    else
      L15_104 = _UPVALUE23_
      if L14_103 ~= L15_104 then
        L15_104 = _UPVALUE25_
        if L14_103 ~= L15_104 then
          L15_104 = _UPVALUE27_
        end
      elseif L14_103 == L15_104 then
        L15_104 = _UPVALUE28_
        L16_105 = "."
        L17_106 = _UPVALUE8_
        L17_106 = L17_106.duplexMode
        L15_104 = L15_104 .. L16_105 .. L17_106
        L16_105 = _UPVALUE30_
        L13_102[L15_104] = L16_105
      end
    end
    L15_104 = _UPVALUE21_
    if L14_103 == L15_104 then
      L15_104 = _UPVALUE28_
      L16_105 = "."
      L17_106 = _UPVALUE8_
      L17_106 = L17_106.autoNegEnable
      L15_104 = L15_104 .. L16_105 .. L17_106
      L16_105 = _UPVALUE30_
      L13_102[L15_104] = L16_105
    else
      L15_104 = _UPVALUE28_
      L16_105 = "."
      L17_106 = _UPVALUE8_
      L17_106 = L17_106.autoNegEnable
      L15_104 = L15_104 .. L16_105 .. L17_106
      L16_105 = _UPVALUE29_
      L13_102[L15_104] = L16_105
    end
    L15_104 = _UPVALUE22_
    if L14_103 ~= L15_104 then
      L15_104 = _UPVALUE23_
    else
      if L14_103 == L15_104 then
        L15_104 = _UPVALUE28_
        L16_105 = "."
        L17_106 = _UPVALUE8_
        L17_106 = L17_106.portSpeed
        L15_104 = L15_104 .. L16_105 .. L17_106
        L16_105 = _UPVALUE31_
        L13_102[L15_104] = L16_105
    end
    else
      L15_104 = _UPVALUE25_
      if L14_103 ~= L15_104 then
        L15_104 = _UPVALUE24_
      else
        if L14_103 == L15_104 then
          L15_104 = _UPVALUE28_
          L16_105 = "."
          L17_106 = _UPVALUE8_
          L17_106 = L17_106.portSpeed
          L15_104 = L15_104 .. L16_105 .. L17_106
          L16_105 = _UPVALUE32_
          L13_102[L15_104] = L16_105
      end
      else
        L15_104 = _UPVALUE26_
        if L14_103 ~= L15_104 then
          L15_104 = _UPVALUE27_
        elseif L14_103 == L15_104 then
          L15_104 = _UPVALUE28_
          L16_105 = "."
          L17_106 = _UPVALUE8_
          L17_106 = L17_106.portSpeed
          L15_104 = L15_104 .. L16_105 .. L17_106
          L16_105 = _UPVALUE33_
          L13_102[L15_104] = L16_105
        end
      end
    end
  end
  L14_103, L15_104 = nil, nil
  L16_105 = db
  L16_105 = L16_105.update
  L17_106 = _UPVALUE1_
  L18_107 = A7_96
  L19_108 = L11_100
  L16_105 = L16_105(L17_106, L18_107, L19_108)
  L14_103 = L16_105
  L16_105 = _UPVALUE0_
  L16_105 = L16_105.NIL
  if L14_103 == L16_105 then
    L16_105 = _UPVALUE0_
    L16_105 = L16_105.FAILURE
    L17_106 = A0_89
    return L16_105, L17_106
  end
  L16_105 = nil
  L17_106 = "0"
  if A8_97 == "threeg" then
    L17_106 = "1"
  end
  L18_107 = _UPVALUE6_
  if A1_90 == L18_107 then
    L17_106 = "1"
  end
  if L17_106 == "0" then
    L18_107 = _UPVALUE3_
    if A1_90 == L18_107 then
      L16_105 = _UPVALUE34_
    else
      L18_107 = _UPVALUE4_
      if A1_90 == L18_107 then
        L18_107 = UNIT_NAME
        if L18_107 ~= "DSR-250" then
          L18_107 = UNIT_NAME
          if L18_107 ~= "DSR-250N" then
            L18_107 = UNIT_NAME
            if L18_107 ~= "DSR-150" then
              L18_107 = UNIT_NAME
            end
          end
        else
          if L18_107 == "DSR-150N" then
            L16_105 = "Port8"
        end
        else
          L16_105 = _UPVALUE35_
        end
      end
    end
    L18_107 = _UPVALUE8_
    L18_107 = L18_107.portName
    L19_108 = " = '"
    L20_109 = L16_105
    L21_110 = "'"
    L18_107 = L18_107 .. L19_108 .. L20_109 .. L21_110
    L19_108 = nil
    L20_109 = db
    L20_109 = L20_109.getAttributeWhere
    L21_110 = _UPVALUE28_
    L22_111 = L18_107
    L23_112 = _UPVALUE2_
    L20_109 = L20_109(L21_110, L22_111, L23_112)
    L19_108 = L20_109
    L20_109 = db
    L20_109 = L20_109.update
    L21_110 = _UPVALUE28_
    L22_111 = L13_102
    L23_112 = L19_108
    L20_109 = L20_109(L21_110, L22_111, L23_112)
    L15_104 = L20_109
    L20_109 = _UPVALUE0_
    L20_109 = L20_109.NIL
    if L15_104 == L20_109 then
      L20_109 = _UPVALUE0_
      L20_109 = L20_109.FAILURE
      L21_110 = A0_89
      return L20_109, L21_110
    end
  end
  L18_107 = _UPVALUE0_
  L18_107 = L18_107.SUCCESS
  L19_108 = A0_89
  return L18_107, L19_108
end
function wanPortGroupCreate(A0_114, A1_115, A2_116, A3_117, A4_118, A5_119)
  local L7_120, L8_121
  L7_120 = _UPVALUE0_
  L7_120 = L7_120.NOT_SUPPORTED
  L8_121 = 0
  return L7_120, L8_121, 0
end
function wanPortGroupDelete(A0_122)
  local L2_123, L3_124
  L2_123 = _UPVALUE0_
  L2_123 = L2_123.NOT_SUPPORTED
  L3_124 = 0
  return L2_123, L3_124, 0
end
