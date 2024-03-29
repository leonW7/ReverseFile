local L0_0
L0_0 = module
L0_0("com.teamf1.core.network.bridgeTrafficSelectors", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/trafficSelectorReturnCodes")
L0_0 = require
L0_0("teamf1lualib/bandwidthProfilesReturnCodes")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).ProfileName = "ProfileName"
;({}).ROWID = "_ROWID_"
;({}).ServiceName = "ServiceName"
;({}).MatchType = "MatchType"
;({}).IPAddress = "IPAddress"
;({}).SubnetMask = "SubnetMask"
;({}).MACAddress = "MACAddress"
;({}).Status = "Status"
function bridgeTrafficSelectorInfoGetAll()
  local L0_1, L1_2, L2_3
  L0_1 = {}
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.NIL
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.FAILURE
  L0_1 = db.getTable(_UPVALUE1_)
  if L0_1 == _UPVALUE0_.NIL then
    return _UPVALUE2_.DB_OP_FAILED, L0_1, L1_2
  end
  L1_2 = db.getAttribute(_UPVALUE3_, _UPVALUE4_, _UPVALUE5_, _UPVALUE6_.Status)
  if L1_2 == _UPVALUE0_.NIL then
    return _UPVALUE2_.DB_OP_FAILED, L0_1, L1_2
  end
  L2_3 = _UPVALUE0_.SUCCESS
  return L2_3, L0_1, L1_2
end
function bridgeDeleteAvailableTrafficSelectors(A0_4)
  local L1_5, L2_6
  L1_5 = {}
  L2_6 = _UPVALUE0_
  L2_6 = L2_6.NIL
  for _FORV_7_, _FORV_8_ in pairs(A0_4) do
    L1_5 = {}
    L1_5[_UPVALUE1_ .. "." .. _UPVALUE2_.ROWID] = _FORV_8_
    L2_6 = db.delete(_UPVALUE1_, L1_5)
    if not L2_6 then
      break
    end
  end
  if L2_6 then
  else
  end
  return _UPVALUE3_.TS_OP_FAILED
end
function bridgeTrafficSelectorValuesGet(A0_7)
  local L1_8, L2_9
  L1_8 = {}
  L2_9 = _UPVALUE0_
  L2_9 = L2_9.FAILURE
  if configRowId == "-1" then
    L1_8 = db.getDefaults(_UPVALUE1_, _UPVALUE2_)
  else
    L1_8 = db.getRow(_UPVALUE2_, _UPVALUE3_, A0_7)
  end
  if L1_8 == _UPVALUE0_.NIL then
    return _UPVALUE4_.DB_OP_FAILED, L1_8
  end
  L2_9 = _UPVALUE0_.SUCCESS
  return L2_9, L1_8
end
function bridgeServicesInfoGetAll(A0_10)
  local L1_11, L2_12
  L1_11 = {}
  L2_12 = _UPVALUE0_
  L2_12 = L2_12.FAILURE
  L1_11 = db.getTable(_UPVALUE1_)
  if L1_11 == _UPVALUE0_.NIL then
    return _UPVALUE2_.DB_OP_FAILED, L1_11
  end
  L2_12 = _UPVALUE0_.SUCCESS
  return L2_12, L1_11
end
function bridgeBWProfileStatusvalueGet(A0_13)
  local L1_14, L2_15
  L1_14 = _UPVALUE0_
  L1_14 = L1_14.NIL
  L2_15 = _UPVALUE0_
  L2_15 = L2_15.FAILURE
  L1_14 = db.getAttribute(_UPVALUE1_, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.Status)
  if L1_14 == _UPVALUE0_.NIL then
    return _UPVALUE5_.DB_OP_FAILED, L1_14
  end
  L2_15 = _UPVALUE0_.SUCCESS
  return L2_15, L1_14
end
function bridgeTrafficSelectorAdd(A0_16, A1_17, A2_18, A3_19, A4_20, A5_21, A6_22, A7_23, A8_24)
  local L9_25, L10_26, L11_27, L12_28, L13_29
  L9_25 = {}
  L10_26 = _UPVALUE0_
  L10_26 = L10_26.NIL
  L11_27 = _UPVALUE0_
  L11_27 = L11_27.FAILURE
  L12_28 = db
  L12_28 = L12_28.getAttribute
  L13_29 = _UPVALUE1_
  L12_28 = L12_28(L13_29, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.Status)
  L13_29 = tonumber
  L13_29 = L13_29(L12_28)
  if L13_29 == 0 then
    L13_29 = _UPVALUE5_
    L13_29 = L13_29.BBW_PROFILE_ENABLED
    return L13_29
  end
  L13_29 = db
  L13_29 = L13_29.getTable
  L13_29 = L13_29(_UPVALUE6_, false)
  if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
  else
  end
  if L13_29 ~= nil and #L13_29 > 8 - 1 then
    return _UPVALUE0_.MAX_LIMIT_REACHED
  end
  L13_29 = db.getDefaults(_UPVALUE7_, _UPVALUE6_)
  if A0_16 ~= _UPVALUE0_.NIL then
    L13_29[_UPVALUE6_ .. "." .. _UPVALUE8_.ProfileName] = A0_16
  end
  if A1_17 ~= _UPVALUE0_.NIL then
    L13_29[_UPVALUE6_ .. "." .. _UPVALUE8_.ServiceName] = A1_17
  end
  if A2_18 ~= _UPVALUE0_.NIL then
    L13_29[_UPVALUE6_ .. "." .. _UPVALUE8_.MatchType] = A2_18
  end
  if A3_19 ~= _UPVALUE0_.NIL then
    L13_29[_UPVALUE6_ .. "." .. _UPVALUE8_.IPAddress] = A3_19
  end
  if A4_20 ~= _UPVALUE0_.NIL then
    L13_29[_UPVALUE6_ .. "." .. _UPVALUE8_.SubnetMask] = A4_20
  end
  if A5_21 ~= _UPVALUE0_.NIL then
    L13_29[_UPVALUE6_ .. "." .. _UPVALUE8_.MACAddress] = A5_21
  end
  if A6_22 ~= _UPVALUE0_.NIL then
    L13_29[_UPVALUE6_ .. "." .. _UPVALUE8_.PortName] = A6_22
  end
  if A7_23 ~= _UPVALUE0_.NIL then
    L13_29[_UPVALUE6_ .. "." .. _UPVALUE8_.VapName] = A7_23
  end
  if A8_24 ~= _UPVALUE0_.NIL then
    L13_29[_UPVALUE6_ .. "." .. _UPVALUE8_.VlanId] = A8_24
  end
  L10_26 = db.insert(_UPVALUE6_, L13_29)
  if L10_26 then
    L11_27 = _UPVALUE0_.SUCCESS
  else
    L11_27 = _UPVALUE5_.TS_CONFIG_FAILED
  end
  return L11_27
end
function bridgeTrafficSelectorEdit(A0_30, A1_31, A2_32, A3_33, A4_34, A5_35, A6_36, A7_37, A8_38, A9_39)
  local L10_40, L11_41, L12_42, L13_43
  L10_40 = {}
  L11_41 = _UPVALUE0_
  L11_41 = L11_41.NIL
  L12_42 = _UPVALUE0_
  L12_42 = L12_42.FAILURE
  L13_43 = db
  L13_43 = L13_43.getAttribute
  L13_43 = L13_43(_UPVALUE1_, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.Status)
  if tonumber(L13_43) == 0 then
    return _UPVALUE5_.BBW_PROFILE_ENABLED
  end
  L10_40 = db.getRow(_UPVALUE6_, _UPVALUE2_, A9_39)
  if L10_40 == _UPVALUE0_.NIL then
    L12_42 = _UPVALUE5_.DB_OP_FAILED
  end
  if A0_30 ~= _UPVALUE0_.NIL then
    L10_40[_UPVALUE6_ .. "." .. _UPVALUE7_.ProfileName] = A0_30
  end
  if A1_31 ~= _UPVALUE0_.NIL then
    L10_40[_UPVALUE6_ .. "." .. _UPVALUE7_.ServiceName] = A1_31
  end
  if A2_32 ~= _UPVALUE0_.NIL then
    L10_40[_UPVALUE6_ .. "." .. _UPVALUE7_.MatchType] = A2_32
  end
  if A3_33 ~= _UPVALUE0_.NIL then
    L10_40[_UPVALUE6_ .. "." .. _UPVALUE7_.IPAddress] = A3_33
  end
  if A4_34 ~= _UPVALUE0_.NIL then
    L10_40[_UPVALUE6_ .. "." .. _UPVALUE7_.SubnetMask] = A4_34
  end
  if A5_35 ~= _UPVALUE0_.NIL then
    L10_40[_UPVALUE6_ .. "." .. _UPVALUE7_.MACAddress] = A5_35
  end
  if A6_36 ~= _UPVALUE0_.NIL then
    L10_40[_UPVALUE6_ .. "." .. _UPVALUE7_.PortName] = A6_36
  end
  if A7_37 ~= _UPVALUE0_.NIL then
    L10_40[_UPVALUE6_ .. "." .. _UPVALUE7_.VapName] = A7_37
  end
  if A8_38 ~= _UPVALUE0_.NIL then
    L10_40[_UPVALUE6_ .. "." .. _UPVALUE7_.VlanId] = A8_38
  end
  L11_41 = db.update(_UPVALUE6_, L10_40, A9_39)
  if L11_41 then
    L12_42 = _UPVALUE0_.SUCCESS
  else
    L12_42 = _UPVALUE5_.TS_CONFIG_FAILED
  end
  return L12_42
end
