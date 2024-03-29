local L0_0
L0_0 = module
L0_0("com.teamf1.bl.captiveportal.payment", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/captiveportal_payment")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function availPaymentProcessorGet()
  local L0_1, L1_2
  L0_1 = {}
  L1_2 = nil
  L1_2, L0_1 = _UPVALUE0_.paymentProcessorGetAll()
  if L1_2 == _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.SUCCESS, L0_1
  else
    return L1_2, L0_1
  end
end
function paymentGateWayGet(A0_3)
  local L1_4, L2_5, L3_6
  L3_6 = {}
  if A0_3 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_4, L3_6, L2_5 = _UPVALUE1_.payMentProcessorGetRow(A0_3)
  if L1_4 == _UPVALUE0_.SUCCESS then
    if L2_5 == _UPVALUE2_ or L2_5 == _UPVALUE3_ then
      L3_6 = util.removePrefix(L3_6, "paypalServer.")
      return _UPVALUE0_.SUCCESS, L3_6, L2_5
    end
  else
    return L1_4, availPaymentProcessor, L2_5
  end
end
function paymentGWCreate(A0_7)
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for paymentGateway page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  A0_7 = util.removePrefix(A0_7, "payMentGW.")
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.paymentGwCreate(A0_7)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in paymentGateway page" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
function paymentGWSet(A0_8)
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for paymentGateway page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  A0_8 = util.removePrefix(A0_8, "payMentGW.")
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.paymentGwSet(A0_8)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in paymentGateway page")
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
function paymentGWDelete(A0_9)
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for paymentGateway page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  A0_9 = util.removePrefix(A0_9, "paymentGateway.")
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.paymentGwDelete(A0_9.checkbox)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in paymentGateway page")
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
function cpPaymentCurrencyGetAll()
  local L0_10, L1_11
  L0_10 = {}
  L1_11 = nil
  L1_11, L0_10 = _UPVALUE0_.currencyGetAll()
  if L1_11 == _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.SUCCESS, L0_10
  else
    return L1_11, L0_10
  end
end
function cpCurrencyForBillingProfile()
  local L0_12, L1_13, L2_14, L3_15, L5_16
  L0_12 = {}
  L1_13 = {}
  L2_14 = nil
  L3_15 = {}
  L5_16 = false
  L2_14, L1_13 = availPaymentProcessorGet()
  if L2_14 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  if #L1_13 == 0 then
    return _UPVALUE0_.SUCCESS, L1_13
  end
  L2_14, L0_12 = cpPaymentCurrencyGetAll()
  if L2_14 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  for _FORV_9_, _FORV_10_ in pairs(L0_12) do
    L5_16 = false
    for _FORV_14_, _FORV_15_ in pairs(L1_13) do
      if _FORV_10_.currencyId == _FORV_15_.currencyId then
        L5_16 = true
        break
      end
    end
    if L5_16 then
      L3_15[1] = {}
      L3_15[1][_UPVALUE1_] = _FORV_10_.currencyId
      L3_15[1][_UPVALUE2_] = _FORV_10_.currencyName
    end
  end
  return _UPVALUE0_.SUCCESS, L3_15
end
