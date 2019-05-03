local L0_0
L0_0 = module
L0_0("com.teamf1.core.captiveportal.payment", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/captiveportal_validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/captivePortal_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).paymentGateway = "paymentGateway"
;({}).loginId = "loginId"
;({}).currency = "currencyId"
;({}).emailAddr = "loginId"
;({}).APIUserName = "APIUserName"
;({}).APIPassword = "APIPassword"
;({}).APISignature = "APISignature"
;({}).APPID = "APPID"
;({}).currencyName = "currencyName"
;({}).currencyCode = "currencyCode"
;({}).loginGwServer = "paymentGwServer"
;({}).blCurrency = "currency"
;({}).setPriceEnable = "setPriceEnable"
;({}).externalPaymentGW = "externalPaymentGW"
function paymentProcessorGetAll()
  local L0_1, L1_2, L2_3
  L1_2 = false
  L2_3 = db
  L2_3 = L2_3.getTable
  L2_3 = L2_3(_UPVALUE0_, false)
  if L2_3 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  for _FORV_6_, _FORV_7_ in pairs(L2_3) do
    L0_1, _FORV_7_[_UPVALUE2_.currencyName] = currencyNameGet(_FORV_7_[_UPVALUE2_.currency])
    if L0_1 ~= _UPVALUE1_.SUCCESS then
      L1_2 = true
      break
    end
  end
  if L1_2 then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L2_3
end
function payMentProcessorGetRow(A0_4)
  local L1_5, L2_6, L3_7, L4_8
  L2_6 = _UPVALUE0_
  L2_6 = L2_6.NIL
  if A0_4 == L2_6 then
    L2_6 = _UPVALUE0_
    L2_6 = L2_6.INVALID_ARGUMENT
    return L2_6
  end
  L2_6 = db
  L2_6 = L2_6.existsRow
  L3_7 = _UPVALUE1_
  L4_8 = _UPVALUE2_
  L2_6 = L2_6(L3_7, L4_8, A0_4)
  if not L2_6 then
    L3_7 = _UPVALUE0_
    L3_7 = L3_7.FAILURE
    return L3_7
  end
  L3_7 = db
  L3_7 = L3_7.getRow
  L4_8 = _UPVALUE1_
  L3_7 = L3_7(L4_8, _UPVALUE2_, A0_4)
  L4_8 = _UPVALUE0_
  L4_8 = L4_8.NIL
  if L3_7 == L4_8 then
    L4_8 = _UPVALUE0_
    L4_8 = L4_8.FAILURE
    return L4_8
  end
  L4_8 = _UPVALUE1_
  L4_8 = L4_8 .. "." .. _UPVALUE3_.paymentGateway
  L4_8 = L3_7[L4_8]
  if L4_8 ~= _UPVALUE4_ then
    L4_8 = _UPVALUE1_
    L4_8 = L4_8 .. "." .. _UPVALUE3_.paymentGateway
    L4_8 = L3_7[L4_8]
  else
    if L4_8 == _UPVALUE5_ then
      L4_8 = db
      L4_8 = L4_8.getRow
      L4_8 = L4_8(_UPVALUE6_, _UPVALUE7_, A0_4)
      L1_5 = L4_8
  end
  else
    L4_8 = _UPVALUE0_
    L4_8 = L4_8.FAILURE
    return L4_8
  end
  L4_8 = _UPVALUE0_
  L4_8 = L4_8.NIL
  if L1_5 == L4_8 then
    L4_8 = _UPVALUE0_
    L4_8 = L4_8.FAILURE
    return L4_8
  end
  L4_8 = _UPVALUE1_
  L4_8 = L4_8 .. "." .. _UPVALUE3_.paymentGateway
  L4_8 = L3_7[L4_8]
  if L4_8 ~= _UPVALUE4_ then
    L4_8 = _UPVALUE1_
    L4_8 = L4_8 .. "." .. _UPVALUE3_.paymentGateway
    L4_8 = L3_7[L4_8]
  elseif L4_8 == _UPVALUE5_ then
    L4_8 = _UPVALUE6_
    L4_8 = L4_8 .. "." .. _UPVALUE3_.currency
    L1_5[L4_8] = L3_7[_UPVALUE1_ .. "." .. _UPVALUE3_.currency]
  end
  L4_8 = _UPVALUE1_
  L4_8 = L4_8 .. "." .. _UPVALUE3_.paymentGateway
  L4_8 = L3_7[L4_8]
  return _UPVALUE0_.SUCCESS, L1_5, L4_8
end
function paymentGwSet(A0_9)
  local L1_10, L2_11, L3_12, L4_13, L5_14, L6_15, L7_16
  L1_10 = {}
  L2_11 = {}
  L3_12 = nil
  L4_13 = _UPVALUE0_
  L4_13 = L4_13.NIL
  if A0_9 == L4_13 then
    L4_13 = _UPVALUE0_
    L4_13 = L4_13.INVALID_ARGUMENT
    return L4_13
  end
  L4_13 = A0_9.loginId
  cookie = L4_13
  L4_13 = cookie
  L5_14 = _UPVALUE0_
  L5_14 = L5_14.NIL
  if L4_13 ~= L5_14 then
    L4_13 = cookie
  elseif L4_13 == "" then
    L4_13 = _UPVALUE0_
    L4_13 = L4_13.INVALID_ARGUMENT
    return L4_13
  end
  L4_13 = _UPVALUE0_
  L4_13 = L4_13.NIL
  if A0_9 == L4_13 then
    L4_13 = _UPVALUE0_
    L4_13 = L4_13.INVALID_ARGUMENT
    return L4_13
  end
  L4_13 = _UPVALUE1_
  L4_13 = L4_13.paymentGateway
  L4_13 = A0_9[L4_13]
  L5_14 = _UPVALUE0_
  L5_14 = L5_14.NIL
  if L4_13 ~= L5_14 then
    L4_13 = _UPVALUE1_
    L4_13 = L4_13.paymentGateway
    L4_13 = A0_9[L4_13]
    if L4_13 ~= "" then
      L4_13 = _UPVALUE1_
      L4_13 = L4_13.currency
      L4_13 = A0_9[L4_13]
      L5_14 = _UPVALUE0_
      L5_14 = L5_14.NIL
      if L4_13 ~= L5_14 then
        L4_13 = _UPVALUE1_
        L4_13 = L4_13.currency
        L4_13 = A0_9[L4_13]
      end
    end
  elseif L4_13 == "" then
    L4_13 = _UPVALUE0_
    L4_13 = L4_13.INVALID_ARGUMENT
    return L4_13
  end
  L4_13 = tonumber
  L5_14 = _UPVALUE1_
  L5_14 = L5_14.currency
  L5_14 = A0_9[L5_14]
  L4_13 = L4_13(L5_14)
  L5_14 = _UPVALUE0_
  L5_14 = L5_14.NIL
  if L4_13 == L5_14 then
    L4_13 = _UPVALUE0_
    L4_13 = L4_13.INVALID_ARGUMENT
    return L4_13
  end
  L4_13 = db
  L4_13 = L4_13.existsRow
  L5_14 = _UPVALUE2_
  L6_15 = _UPVALUE3_
  L7_16 = _UPVALUE1_
  L7_16 = L7_16.currency
  L7_16 = A0_9[L7_16]
  L4_13 = L4_13(L5_14, L6_15, L7_16)
  if not L4_13 then
    L5_14 = _UPVALUE0_
    L5_14 = L5_14.FAILURE
    return L5_14
  end
  L5_14 = _UPVALUE4_
  L6_15 = "."
  L7_16 = _UPVALUE1_
  L7_16 = L7_16.paymentGateway
  L5_14 = L5_14 .. L6_15 .. L7_16
  L6_15 = _UPVALUE1_
  L6_15 = L6_15.paymentGateway
  L6_15 = A0_9[L6_15]
  L1_10[L5_14] = L6_15
  L5_14 = _UPVALUE4_
  L6_15 = "."
  L7_16 = _UPVALUE1_
  L7_16 = L7_16.currency
  L5_14 = L5_14 .. L6_15 .. L7_16
  L6_15 = _UPVALUE1_
  L6_15 = L6_15.currency
  L6_15 = A0_9[L6_15]
  L1_10[L5_14] = L6_15
  L5_14 = _UPVALUE1_
  L5_14 = L5_14.loginId
  L6_15 = "='"
  L7_16 = cookie
  L5_14 = L5_14 .. L6_15 .. L7_16 .. "'"
  L6_15 = db
  L6_15 = L6_15.getRowWhere
  L7_16 = _UPVALUE4_
  L6_15 = L6_15(L7_16, L5_14, false)
  L7_16 = _UPVALUE0_
  L7_16 = L7_16.NIL
  if L6_15 == L7_16 then
    L7_16 = _UPVALUE0_
    L7_16 = L7_16.FAILURE
    return L7_16
  end
  L7_16 = _UPVALUE1_
  L7_16 = L7_16.externalPaymentGW
  L5_14 = L7_16 .. "='" .. _UPVALUE5_ .. "' and " .. _UPVALUE1_.loginGwServer .. "='" .. L6_15[_UPVALUE6_] .. "'"
  L7_16 = db
  L7_16 = L7_16.getRowsWhere
  L7_16 = L7_16(_UPVALUE7_, L5_14)
  if L7_16 ~= nil and #L7_16 > 0 and L6_15[_UPVALUE1_.currency] ~= A0_9[_UPVALUE1_.currency] then
    return _UPVALUE8_.GW_SERVER_IS_IN_USE_CURRENCY_CANT_CONFIGURE
  end
  L5_14 = _UPVALUE1_.setPriceEnable .. "='" .. _UPVALUE5_ .. "' and " .. _UPVALUE1_.blCurrency .. "='" .. L6_15[_UPVALUE1_.currency] .. "'"
  L7_16 = db.getRowsWhere(_UPVALUE9_, L5_14)
  if L7_16 ~= nil and #L7_16 > 0 and L6_15[_UPVALUE1_.currency] ~= A0_9[_UPVALUE1_.currency] then
    return _UPVALUE8_.DISABLE_UNIT_PRICE_FROM_BILLING
  end
  L3_12 = db.getAttribute(_UPVALUE4_, _UPVALUE10_, cookie, _UPVALUE6_)
  if L3_12 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  if db.update(_UPVALUE4_, L1_10, L3_12) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  if A0_9[_UPVALUE1_.paymentGateway] == _UPVALUE11_ or A0_9[_UPVALUE1_.paymentGateway] == _UPVALUE12_ then
    if A0_9[_UPVALUE1_.APPID] == _UPVALUE0_.NIL or A0_9[_UPVALUE1_.APPID] == "" or A0_9[_UPVALUE1_.APISignature] == _UPVALUE0_.NIL or A0_9[_UPVALUE1_.APISignature] == "" or A0_9[_UPVALUE1_.APIPassword] == _UPVALUE0_.NIL or A0_9[_UPVALUE1_.APIPassword] == "" or A0_9[_UPVALUE1_.APIUserName] == _UPVALUE0_.NIL or A0_9[_UPVALUE1_.APIUserName] == "" then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    L2_11[_UPVALUE13_ .. "." .. _UPVALUE1_.APPID] = A0_9[_UPVALUE1_.APPID]
    L2_11[_UPVALUE13_ .. "." .. _UPVALUE1_.APISignature] = A0_9[_UPVALUE1_.APISignature]
    L2_11[_UPVALUE13_ .. "." .. _UPVALUE1_.APIPassword] = A0_9[_UPVALUE1_.APIPassword]
    L2_11[_UPVALUE13_ .. "." .. _UPVALUE1_.APIUserName] = A0_9[_UPVALUE1_.APIUserName]
    L3_12 = db.getAttribute(_UPVALUE13_, _UPVALUE14_, cookie, _UPVALUE6_)
    if L3_12 == _UPVALUE0_.NIL then
      return _UPVALUE0_.FAILURE
    end
    if db.update(_UPVALUE13_, L2_11, L3_12) == _UPVALUE0_.NIL then
      return _UPVALUE0_.FAILURE, cookie
    end
  else
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  return _UPVALUE0_.SUCCESS, cookie
end
function paymentGwCreate(A0_17)
  local L1_18, L2_19
  L1_18 = {}
  L2_19 = {}
  if A0_17 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A0_17[_UPVALUE1_.paymentGateway] == _UPVALUE0_.NIL or A0_17[_UPVALUE1_.paymentGateway] == "" or A0_17[_UPVALUE1_.loginId] == _UPVALUE0_.NIL or A0_17[_UPVALUE1_.loginId] == "" or A0_17[_UPVALUE1_.currency] == _UPVALUE0_.NIL or A0_17[_UPVALUE1_.currency] == "" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_17[_UPVALUE1_.currency]) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if not db.existsRow(_UPVALUE2_, _UPVALUE3_, A0_17[_UPVALUE1_.currency]) then
    return _UPVALUE0_.FAILURE
  end
  L1_18[_UPVALUE4_ .. "." .. _UPVALUE1_.paymentGateway] = A0_17[_UPVALUE1_.paymentGateway]
  L1_18[_UPVALUE4_ .. "." .. _UPVALUE1_.currency] = A0_17[_UPVALUE1_.currency]
  L1_18[_UPVALUE4_ .. "." .. _UPVALUE1_.loginId] = A0_17[_UPVALUE1_.loginId]
  if db.insert(_UPVALUE4_, L1_18) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  if A0_17[_UPVALUE1_.paymentGateway] == _UPVALUE5_ or A0_17[_UPVALUE1_.paymentGateway] == _UPVALUE6_ then
    if A0_17[_UPVALUE1_.APPID] == _UPVALUE0_.NIL or A0_17[_UPVALUE1_.APPID] == "" or A0_17[_UPVALUE1_.APISignature] == _UPVALUE0_.NIL or A0_17[_UPVALUE1_.APISignature] == "" or A0_17[_UPVALUE1_.APIPassword] == _UPVALUE0_.NIL or A0_17[_UPVALUE1_.APIPassword] == "" or A0_17[_UPVALUE1_.APIUserName] == _UPVALUE0_.NIL or A0_17[_UPVALUE1_.APIUserName] == "" then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    L2_19[_UPVALUE7_ .. "." .. _UPVALUE1_.APPID] = A0_17[_UPVALUE1_.APPID]
    L2_19[_UPVALUE7_ .. "." .. _UPVALUE1_.APISignature] = A0_17[_UPVALUE1_.APISignature]
    L2_19[_UPVALUE7_ .. "." .. _UPVALUE1_.APIPassword] = A0_17[_UPVALUE1_.APIPassword]
    L2_19[_UPVALUE7_ .. "." .. _UPVALUE1_.APIUserName] = A0_17[_UPVALUE1_.APIUserName]
    L2_19[_UPVALUE7_ .. "." .. _UPVALUE1_.emailAddr] = A0_17[_UPVALUE1_.loginId]
    if db.insert(_UPVALUE7_, L2_19) == _UPVALUE0_.NIL then
      return _UPVALUE0_.FAILURE, cookie
    end
  else
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  return _UPVALUE0_.SUCCESS, cookie
end
function paymentGwDelete(A0_20)
  local L1_21, L2_22, L3_23, L4_24
  L1_21 = _UPVALUE0_
  L1_21 = L1_21.NIL
  if A0_20 == L1_21 then
    L1_21 = _UPVALUE0_
    L1_21 = L1_21.INVALID_ARGUMENT
    return L1_21
  end
  L1_21 = _UPVALUE1_
  L1_21 = L1_21.loginId
  L2_22 = "='"
  L3_23 = A0_20
  L4_24 = "'"
  L1_21 = L1_21 .. L2_22 .. L3_23 .. L4_24
  L2_22 = db
  L2_22 = L2_22.getRowWhere
  L3_23 = _UPVALUE2_
  L4_24 = L1_21
  L2_22 = L2_22(L3_23, L4_24, false)
  L3_23 = _UPVALUE0_
  L3_23 = L3_23.NIL
  if L2_22 == L3_23 then
    L3_23 = _UPVALUE0_
    L3_23 = L3_23.FAILURE
    return L3_23
  end
  L3_23 = _UPVALUE1_
  L3_23 = L3_23.externalPaymentGW
  L4_24 = "='"
  L1_21 = L3_23 .. L4_24 .. _UPVALUE3_ .. "' and " .. _UPVALUE1_.loginGwServer .. "='" .. L2_22[_UPVALUE4_] .. "'"
  L3_23 = db
  L3_23 = L3_23.getRowsWhere
  L4_24 = _UPVALUE5_
  L3_23 = L3_23(L4_24, L1_21)
  if L3_23 ~= nil then
    L4_24 = #L3_23
    if L4_24 ~= 0 then
      L4_24 = _UPVALUE6_
      L4_24 = L4_24.GW_SERVER_IS_IN_USE
      return L4_24
    end
  end
  L4_24 = _UPVALUE1_
  L4_24 = L4_24.setPriceEnable
  L1_21 = L4_24 .. "='" .. _UPVALUE3_ .. "' and " .. _UPVALUE1_.blCurrency .. "='" .. L2_22[_UPVALUE1_.currency] .. "'"
  L4_24 = db
  L4_24 = L4_24.getRowsWhere
  L4_24 = L4_24(_UPVALUE7_, L1_21)
  L3_23 = L4_24
  if L3_23 ~= nil then
    L4_24 = #L3_23
    if L4_24 ~= 0 then
      L4_24 = _UPVALUE6_
      L4_24 = L4_24.DISABLE_UNIT_PRICE_FROM_BILLING
      return L4_24
    end
  end
  L4_24 = db
  L4_24 = L4_24.deleteRow
  L4_24 = L4_24(_UPVALUE2_, _UPVALUE8_, A0_20)
  if L4_24 == nil then
    return _UPVALUE0_.FAILURE
  end
  L4_24 = db.deleteRow(_UPVALUE9_, _UPVALUE10_, A0_20)
  if L4_24 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function currencyGetAll()
  local L0_25
  L0_25 = db
  L0_25 = L0_25.getTable
  L0_25 = L0_25(_UPVALUE0_, false)
  if L0_25 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_25
end
function currencyGetRow(A0_26)
  local L1_27, L2_28
  L1_27 = _UPVALUE0_
  L1_27 = L1_27.NIL
  if A0_26 == L1_27 then
    L1_27 = _UPVALUE0_
    L1_27 = L1_27.INVALID_ARGUMENT
    return L1_27
  end
  L1_27 = db
  L1_27 = L1_27.existsRow
  L2_28 = _UPVALUE1_
  L1_27 = L1_27(L2_28, _UPVALUE2_, A0_26)
  if not L1_27 then
    L2_28 = _UPVALUE0_
    L2_28 = L2_28.FAILURE
    return L2_28
  end
  L2_28 = db
  L2_28 = L2_28.getRow
  L2_28 = L2_28(_UPVALUE1_, _UPVALUE2_, A0_26)
  if L2_28 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L2_28
end
function currencyNameGet(A0_29)
  local L1_30, L2_31
  L1_30 = _UPVALUE0_
  L1_30 = L1_30.NIL
  if A0_29 == L1_30 then
    L1_30 = _UPVALUE0_
    L1_30 = L1_30.INVALID_ARGUMENT
    return L1_30
  end
  L1_30 = db
  L1_30 = L1_30.existsRow
  L2_31 = _UPVALUE1_
  L1_30 = L1_30(L2_31, _UPVALUE2_, A0_29)
  if not L1_30 then
    L2_31 = _UPVALUE0_
    L2_31 = L2_31.FAILURE
    return L2_31
  end
  L2_31 = db
  L2_31 = L2_31.getAttribute
  L2_31 = L2_31(_UPVALUE1_, _UPVALUE2_, A0_29, _UPVALUE3_.currencyName)
  if L2_31 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L2_31
end
function currencyCodeGet(A0_32)
  local L1_33, L2_34
  L1_33 = _UPVALUE0_
  L1_33 = L1_33.NIL
  if A0_32 == L1_33 then
    L1_33 = _UPVALUE0_
    L1_33 = L1_33.INVALID_ARGUMENT
    return L1_33
  end
  L1_33 = db
  L1_33 = L1_33.existsRow
  L2_34 = _UPVALUE1_
  L1_33 = L1_33(L2_34, _UPVALUE2_, A0_32)
  if not L1_33 then
    L2_34 = _UPVALUE0_
    L2_34 = L2_34.FAILURE
    return L2_34
  end
  L2_34 = db
  L2_34 = L2_34.getAttribute
  L2_34 = L2_34(_UPVALUE1_, _UPVALUE2_, A0_32, _UPVALUE3_.currencyCode)
  if L2_34 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L2_34
end
