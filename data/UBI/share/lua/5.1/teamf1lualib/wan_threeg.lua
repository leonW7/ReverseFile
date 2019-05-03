local L0_0
L0_0 = module
L0_0("com.teamf1.core.wan.threeg", package.seeall)
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
L0_0("teamf1lualib/wan_dhcp")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).interfaceName = "LogicalIfName"
;({}).userName = "UserName"
;({}).password = "Password"
;({}).dialNumber = "DialNumber"
;({}).authType = "AuthMethod"
;({}).apn = "Apn"
;({}).dnsType = "GetDnsFromIsp"
;({}).primaryDns = "PrimaryDns"
;({}).secondaryDns = "SecondaryDns"
;({}).reconnectMode = "IdleTimeOutFlag"
;({}).idleTime = "IdleTimeOutValue"
;({}).apnType = "ApnRequired"
function threegSettingsGet(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13
  if db.getRow(_UPVALUE0_, _UPVALUE1_.interfaceName, A0_1) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  L1_2 = db.getRow(_UPVALUE0_, _UPVALUE1_.interfaceName, A0_1)[_UPVALUE0_ .. "." .. _UPVALUE1_.interfaceName]
  L2_3 = db.getRow(_UPVALUE0_, _UPVALUE1_.interfaceName, A0_1)[_UPVALUE0_ .. "." .. _UPVALUE1_.userName]
  L3_4 = db.getRow(_UPVALUE0_, _UPVALUE1_.interfaceName, A0_1)[_UPVALUE0_ .. "." .. _UPVALUE1_.password]
  L4_5 = db.getRow(_UPVALUE0_, _UPVALUE1_.interfaceName, A0_1)[_UPVALUE0_ .. "." .. _UPVALUE1_.dialNumber]
  L5_6 = db.getRow(_UPVALUE0_, _UPVALUE1_.interfaceName, A0_1)[_UPVALUE0_ .. "." .. _UPVALUE1_.authType]
  L6_7 = db.getRow(_UPVALUE0_, _UPVALUE1_.interfaceName, A0_1)[_UPVALUE0_ .. "." .. _UPVALUE1_.apn]
  L7_8 = db.getRow(_UPVALUE0_, _UPVALUE1_.interfaceName, A0_1)[_UPVALUE0_ .. "." .. _UPVALUE1_.dnsType]
  L8_9 = db.getRow(_UPVALUE0_, _UPVALUE1_.interfaceName, A0_1)[_UPVALUE0_ .. "." .. _UPVALUE1_.primaryDns]
  L9_10 = db.getRow(_UPVALUE0_, _UPVALUE1_.interfaceName, A0_1)[_UPVALUE0_ .. "." .. _UPVALUE1_.secondaryDns]
  L10_11 = db.getRow(_UPVALUE0_, _UPVALUE1_.interfaceName, A0_1)[_UPVALUE0_ .. "." .. _UPVALUE1_.reconnectMode]
  L11_12 = db.getRow(_UPVALUE0_, _UPVALUE1_.interfaceName, A0_1)[_UPVALUE0_ .. "." .. _UPVALUE1_.idleTime]
  L12_13 = db.getRow(_UPVALUE0_, _UPVALUE1_.interfaceName, A0_1)[_UPVALUE0_ .. "." .. _UPVALUE1_.apnType]
  return _UPVALUE2_.SUCCESS, L1_2, L10_11, L11_12, L2_3, L3_4, L4_5, L5_6, L12_13, L6_7, L7_8, L8_9, L9_10
end
function threegSettingsSet(A0_14, A1_15, A2_16, A3_17, A4_18, A5_19, A6_20, A7_21, A8_22, A9_23, A10_24, A11_25, A12_26)
  local L13_27, L14_28, L15_29
  L13_27 = db
  L13_27 = L13_27.existsRow
  L14_28 = _UPVALUE0_
  L15_29 = _UPVALUE1_
  L15_29 = L15_29.interfaceName
  L13_27 = L13_27(L14_28, L15_29, A0_14)
  L14_28 = _UPVALUE2_
  L14_28 = L14_28.FALSE
  if L13_27 == L14_28 then
    L13_27 = _UPVALUE2_
    L13_27 = L13_27.INVALID_ARGUMENT
    return L13_27
  end
  L13_27 = {}
  L14_28 = db
  L14_28 = L14_28.getAttribute
  L15_29 = _UPVALUE0_
  L14_28 = L14_28(L15_29, _UPVALUE1_.interfaceName, A0_14, _UPVALUE3_)
  L15_29 = _UPVALUE2_
  L15_29 = L15_29.NIL
  if A1_15 == L15_29 then
    L15_29 = _UPVALUE2_
    L15_29 = L15_29.INVALID_ARGUMENT
    return L15_29
  end
  L15_29 = _UPVALUE4_
  if A1_15 ~= L15_29 then
    L15_29 = _UPVALUE5_
    if A1_15 ~= L15_29 then
      L15_29 = _UPVALUE2_
      L15_29 = L15_29.INVALID_ARGUMENT
      return L15_29
    end
  end
  L15_29 = _UPVALUE0_
  L15_29 = L15_29 .. "." .. _UPVALUE1_.reconnectMode
  L13_27[L15_29] = A1_15
  L15_29 = _UPVALUE5_
  if A1_15 == L15_29 then
    L15_29 = _UPVALUE2_
    L15_29 = L15_29.NIL
    if A2_16 == L15_29 then
      L15_29 = _UPVALUE2_
      L15_29 = L15_29.INVALID_ARGUMENT
      return L15_29
    end
    L15_29 = _UPVALUE0_
    L15_29 = L15_29 .. "." .. _UPVALUE1_.idleTime
    L13_27[L15_29] = A2_16
    L15_29 = _UPVALUE6_
    if A12_26 ~= L15_29 then
      L15_29 = _UPVALUE7_
    elseif A12_26 == L15_29 then
      L15_29 = _UPVALUE8_
      L15_29 = L15_29.LOAD_BALANCE_MODE_ON_DEMAND_NOT_SUPPORTED
      return L15_29
    end
  end
  L15_29 = _UPVALUE2_
  L15_29 = L15_29.NIL
  if A3_17 == L15_29 then
    L15_29 = _UPVALUE2_
    L15_29 = L15_29.INVALID_ARGUMENT
    return L15_29
  end
  L15_29 = _UPVALUE0_
  L15_29 = L15_29 .. "." .. _UPVALUE1_.userName
  L13_27[L15_29] = A3_17
  L15_29 = _UPVALUE2_
  L15_29 = L15_29.NIL
  if A4_18 == L15_29 then
    L15_29 = _UPVALUE2_
    L15_29 = L15_29.INVALID_ARGUMENT
    return L15_29
  end
  L15_29 = _UPVALUE0_
  L15_29 = L15_29 .. "." .. _UPVALUE1_.password
  L13_27[L15_29] = A4_18
  L15_29 = _UPVALUE2_
  L15_29 = L15_29.NIL
  if A5_19 == L15_29 then
    L15_29 = _UPVALUE2_
    L15_29 = L15_29.INVALID_ARGUMENT
    return L15_29
  end
  L15_29 = _UPVALUE0_
  L15_29 = L15_29 .. "." .. _UPVALUE1_.dialNumber
  L13_27[L15_29] = A5_19
  L15_29 = _UPVALUE2_
  L15_29 = L15_29.NIL
  if A6_20 == L15_29 then
    L15_29 = _UPVALUE2_
    L15_29 = L15_29.INVALID_ARGUMENT
    return L15_29
  end
  L15_29 = _UPVALUE9_
  if A6_20 ~= L15_29 then
    L15_29 = _UPVALUE10_
    if A6_20 ~= L15_29 then
      L15_29 = _UPVALUE11_
      if A6_20 ~= L15_29 then
        L15_29 = _UPVALUE2_
        L15_29 = L15_29.INVALID_ARGUMENT
        return L15_29
      end
    end
  end
  L15_29 = _UPVALUE0_
  L15_29 = L15_29 .. "." .. _UPVALUE1_.authType
  L13_27[L15_29] = A6_20
  L15_29 = _UPVALUE2_
  L15_29 = L15_29.NIL
  if A7_21 == L15_29 then
    L15_29 = _UPVALUE2_
    L15_29 = L15_29.INVALID_ARGUMENT
    return L15_29
  end
  L15_29 = _UPVALUE12_
  L15_29 = L15_29.booleanCheck
  L15_29 = L15_29(A7_21)
  if L15_29 ~= _UPVALUE2_.SUCCESS then
    return _UPVALUE2_.FAILURE
  end
  L13_27[_UPVALUE0_ .. "." .. _UPVALUE1_.apnType] = A7_21
  if A7_21 == "1" then
    if A8_22 == _UPVALUE2_.NIL then
      return _UPVALUE2_.INVALID_ARGUMENT
    end
    L13_27[_UPVALUE0_ .. "." .. _UPVALUE1_.apn] = A8_22
  end
  if A9_23 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A9_23 ~= _UPVALUE13_ and A9_23 ~= _UPVALUE14_ then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  L13_27[_UPVALUE0_ .. "." .. _UPVALUE1_.dnsType] = A9_23
  if A9_23 == _UPVALUE14_ then
    if A10_24 == _UPVALUE2_.NIL then
      return _UPVALUE2_.INVALID_ARGUMENT
    end
    if _UPVALUE12_.ipv4Check(A10_24) ~= _UPVALUE2_.SUCCESS then
      return _UPVALUE2_.FAILURE
    end
    L13_27[_UPVALUE0_ .. "." .. _UPVALUE1_.primaryDns] = A10_24
    if A11_25 == _UPVALUE2_.NIL then
      return _UPVALUE2_.INVALID_ARGUMENT
    end
    if _UPVALUE12_.ipv4Check(A11_25) ~= _UPVALUE2_.SUCCESS then
      return _UPVALUE2_.FAILURE
    end
    L13_27[_UPVALUE0_ .. "." .. _UPVALUE1_.secondaryDns] = A11_25
  end
  if db.update(_UPVALUE0_, L13_27, L14_28) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, cookie
  end
  if A10_24 == _UPVALUE2_.NIL then
    A10_24 = "0.0.0.0"
  end
  if A11_25 == _UPVALUE2_.NIL then
    A11_25 = "0.0.0.0"
  end
  L15_29, cookie = _UPVALUE15_.dhcpSet(A0_14, A9_23, A10_24, A11_25)
  if L15_29 ~= _UPVALUE2_.SUCCESS then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, cookie
end
function threegReconnectModeget()
  local L0_30
  L0_30 = db
  L0_30 = L0_30.getAttribute
  L0_30 = L0_30(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.reconnectMode)
  if L0_30 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  else
    return _UPVALUE4_.SUCCESS, L0_30
  end
end
