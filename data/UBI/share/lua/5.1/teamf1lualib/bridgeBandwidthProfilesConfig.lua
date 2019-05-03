local L0_0
L0_0 = module
L0_0("com.teamf1.core.network.bridgeBandwidthProfiles", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/bandwidthProfilesReturnCodes")
L0_0 = require
L0_0("teamf1lualib/trafficSelectorReturnCodes")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).ROWID = "_ROWID_"
;({}).Status = "Status"
;({}).ProfileName = "ProfileName"
;({}).DscpMark = "DscpMark"
;({}).Policy = "Policy"
;({}).ProfileType = "ProfileType"
;({}).Priority = "Priority"
;({}).MinimumRate = "MinimumRate"
;({}).MaximumRate = "MaximumRate"
;({}).ClassId = "ClassId"
;({}).WANID = "WANID"
;({}).ProfileName = "ProfileName"
;({}).DscpMark = "DscpMark"
;({}).Status = "Status"
;({}).ClassId = "ClassId"
;({}).Status = "Status"
;({}).name = "name"
;({}).value = "value"
;({}).LogicalIfName = "LogicalIfName"
function bridgeBandwidthProfileStatusGet()
  local L0_1, L1_2, L2_3
  L0_1 = {}
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.FAILURE
  L2_3 = _UPVALUE1_
  L2_3 = L2_3 .. "=" .. _UPVALUE2_
  L0_1 = db.getRowWhere(_UPVALUE3_, L2_3)
  if L0_1 == _UPVALUE0_.NIL then
    return _UPVALUE4_.DB_OP_FAILED, L0_1
  end
  L1_2 = _UPVALUE0_.SUCCESS
  return L1_2, L0_1
end
function bridgeBandwidthProfileInfoGetAll()
  local L0_4, L1_5
  L0_4 = {}
  L1_5 = _UPVALUE0_
  L1_5 = L1_5.FAILURE
  L0_4 = db.getTable(_UPVALUE1_)
  if L0_4 == _UPVALUE0_.NIL then
    return _UPVALUE2_.DB_OP_FAILED, L0_4
  end
  L1_5 = _UPVALUE0_.SUCCESS
  return L1_5, L0_4
end
function bridgeBandwidthProfileStatusModify(A0_6)
  local L1_7, L2_8, L3_9, L4_10
  L1_7 = {}
  L2_8 = _UPVALUE0_
  L2_8 = L2_8.NIL
  L3_9 = _UPVALUE0_
  L3_9 = L3_9.NIL
  L4_10 = _UPVALUE0_
  L4_10 = L4_10.NIL
  L4_10 = _UPVALUE1_ .. "=" .. _UPVALUE2_
  L1_7 = db.getRowWhere(_UPVALUE3_, L4_10)
  if L1_7 == _UPVALUE0_.NIL then
    return _UPVALUE4_.DB_OP_FAILED
  end
  L3_9 = tonumber(A0_6)
  L1_7[_UPVALUE3_ .. "." .. _UPVALUE5_.Status] = L3_9
  L2_8 = db.update(_UPVALUE3_, L1_7, _UPVALUE2_)
  if not L2_8 then
    return _UPVALUE4_.DB_OP_FAILED
  end
  return _UPVALUE0_.SUCCESS
end
function bridgeDeleteAvailableProfiles(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20, L10_21, L11_22, L12_23, L13_24
  L1_12 = {}
  L2_13 = {}
  L3_14 = {}
  L4_15 = _UPVALUE0_
  L4_15 = L4_15.NIL
  L5_16 = _UPVALUE0_
  L5_16 = L5_16.NIL
  L6_17 = _UPVALUE0_
  L6_17 = L6_17.NIL
  L7_18 = _UPVALUE1_
  L8_19 = _UPVALUE0_
  L8_19 = L8_19.FAILURE
  for L12_23, L13_24 in L9_20(L10_21) do
    L1_12 = {}
    L1_12[_UPVALUE2_ .. "." .. _UPVALUE3_.ROWID] = L13_24
    L6_17 = db.getAttribute(_UPVALUE2_, _UPVALUE4_, L13_24, _UPVALUE3_.DscpMark)
    L4_15 = db.existsRow(_UPVALUE5_, _UPVALUE6_.DscpMark, L6_17)
    L6_17 = db.getAttribute(_UPVALUE2_, _UPVALUE4_, L13_24, _UPVALUE3_.ProfileName)
    L3_14 = db.getRows(_UPVALUE7_, _UPVALUE8_.ProfileName, L6_17)
    L2_13 = {}
    L2_13[_UPVALUE5_ .. "." .. _UPVALUE6_.Status] = 0
    if #L3_14 ~= 0 then
      L7_18 = _UPVALUE1_
      L5_16 = "1"
    else
      L7_18 = _UPVALUE9_
    end
    L7_18 = L7_18 and db.update(_UPVALUE5_, L2_13, L4_15)
    L7_18 = L7_18 and db.delete(_UPVALUE2_, L1_12)
    if not L7_18 then
      break
    end
  end
  if L7_18 then
    L8_19 = L9_20.SUCCESS
  elseif L5_16 == "1" then
    L8_19 = L9_20.BW_IS_BEING_USED
  else
    L8_19 = L9_20.BW_DEL_FAILED
  end
  return L8_19
end
function bridgeBandwidthProfileInfoGet(A0_25)
  local L1_26, L2_27
  L1_26 = {}
  L2_27 = _UPVALUE0_
  L2_27 = L2_27.FAILURE
  if A0_25 == "-1" then
    L1_26 = db.getDefaults(_UPVALUE1_, _UPVALUE2_)
    L1_26[_UPVALUE2_ .. "." .. _UPVALUE3_.Policy] = _UPVALUE4_
    L1_26[_UPVALUE2_ .. "." .. _UPVALUE3_.ProfileType] = _UPVALUE5_
  else
    L1_26 = db.getRow(_UPVALUE2_, _UPVALUE6_, A0_25)
  end
  if L1_26 == _UPVALUE0_.NIL then
    return _UPVALUE7_.DB_OP_FAILED, L1_26
  end
  L2_27 = _UPVALUE0_.SUCCESS
  return L2_27, L1_26
end
function bridgeBandwidthProfileAdd(A0_28, A1_29, A2_30, A3_31, A4_32, A5_33, A6_34)
  local L7_35, L8_36, L9_37, L10_38, L11_39, L12_40, L13_41, L14_42, L15_43
  L7_35 = {}
  L8_36 = {}
  L9_37 = _UPVALUE0_
  L9_37 = L9_37.NIL
  L10_38 = _UPVALUE0_
  L10_38 = L10_38.NIL
  L11_39 = _UPVALUE0_
  L11_39 = L11_39.NIL
  L12_40 = _UPVALUE0_
  L12_40 = L12_40.FAILURE
  L13_41 = bridgeBandwidthProfileStatusGet
  L14_42 = L13_41()
  L15_43 = tonumber
  L15_43 = L15_43(L14_42[_UPVALUE1_ .. "." .. _UPVALUE2_.Status])
  if L15_43 == 0 then
    L15_43 = _UPVALUE3_
    L15_43 = L15_43.BrideBW_PROFILE_ENABLED
    return L15_43
  end
  L15_43 = db
  L15_43 = L15_43.getTable
  L15_43 = L15_43(_UPVALUE4_, false)
  if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
  else
  end
  if L15_43 ~= nil and #L15_43 > 8 - 1 then
    return _UPVALUE0_.MAX_LIMIT_REACHED
  end
  L11_39 = db.getAttribute(_UPVALUE4_, _UPVALUE4_ .. "." .. _UPVALUE5_.ProfileName, A0_28, _UPVALUE6_)
  if L11_39 ~= _UPVALUE0_.NIL then
    return L13_41, _UPVALUE3_.PROILE_EXISTS
  end
  if A0_28 ~= _UPVALUE0_.NIL then
    L15_43[_UPVALUE4_ .. "." .. _UPVALUE5_.ProfileName] = A0_28
  end
  if A1_29 ~= _UPVALUE0_.NIL then
    L15_43[_UPVALUE4_ .. "." .. _UPVALUE5_.Policy] = A1_29
  end
  if A2_30 ~= _UPVALUE0_.NIL then
    L15_43[_UPVALUE4_ .. "." .. _UPVALUE5_.ProfileType] = A2_30
  end
  if A3_31 ~= _UPVALUE0_.NIL then
    L15_43[_UPVALUE4_ .. "." .. _UPVALUE5_.Priority] = A3_31
  end
  if A4_32 ~= _UPVALUE0_.NIL then
    L15_43[_UPVALUE4_ .. "." .. _UPVALUE5_.MinimumRate] = A4_32
  end
  if A5_33 ~= _UPVALUE0_.NIL then
    L15_43[_UPVALUE4_ .. "." .. _UPVALUE5_.MaximumRate] = A5_33
  end
  if A6_34 ~= _UPVALUE0_.NIL then
    L15_43[_UPVALUE4_ .. "." .. _UPVALUE5_.WANID] = A6_34
  end
  L9_37 = db.existsRow(_UPVALUE7_, _UPVALUE8_.Status, _UPVALUE9_)
  if L9_37 then
    L11_39 = db.getAttribute(_UPVALUE7_, _UPVALUE6_, L9_37, _UPVALUE8_.ClassId)
    L15_43[_UPVALUE4_ .. "." .. _UPVALUE5_.ClassId] = L11_39
    L11_39 = db.getAttribute(_UPVALUE7_, _UPVALUE6_, L9_37, _UPVALUE8_.DscpMark)
    L15_43[_UPVALUE4_ .. "." .. _UPVALUE5_.DscpMark] = L11_39
    L8_36 = {}
    L8_36[_UPVALUE7_ .. "." .. _UPVALUE8_.Status] = 1
    L10_38 = db.update(_UPVALUE7_, L8_36, L9_37)
    L10_38 = L10_38 and db.insert(_UPVALUE4_, L15_43)
  else
    return _UPVALUE0_.MAX_LIMIT_REACHED
  end
  if L10_38 then
    L13_41 = _UPVALUE0_.SUCCESS
  else
    L13_41 = _UPVALUE3_.BW_CONFIG_FAILED
  end
  return L13_41
end
function bridgeBandwidthProfileSet(A0_44, A1_45, A2_46, A3_47, A4_48, A5_49, A6_50, A7_51)
  local L8_52, L9_53, L10_54
  L8_52 = {}
  L9_53 = {}
  L10_54 = _UPVALUE0_
  L10_54 = L10_54.NIL
  if tonumber(bridgeBandwidthProfileStatusGet()[_UPVALUE1_ .. "." .. _UPVALUE2_.Status]) == 0 then
    return _UPVALUE3_.BrideBW_PROFILE_ENABLED
  end
  L8_52 = db.getRow(_UPVALUE4_, _UPVALUE5_, A7_51)
  if L8_52 == _UPVALUE0_.NIL then
  end
  if A0_44 ~= _UPVALUE0_.NIL then
    L8_52[_UPVALUE4_ .. "." .. _UPVALUE6_.ProfileName] = A0_44
  end
  if A1_45 ~= _UPVALUE0_.NIL then
    L8_52[_UPVALUE4_ .. "." .. _UPVALUE6_.Policy] = A1_45
  end
  if A2_46 ~= _UPVALUE0_.NIL then
    L8_52[_UPVALUE4_ .. "." .. _UPVALUE6_.ProfileType] = A2_46
  end
  if A3_47 ~= _UPVALUE0_.NIL then
    L8_52[_UPVALUE4_ .. "." .. _UPVALUE6_.Priority] = A3_47
  end
  if A4_48 ~= _UPVALUE0_.NIL then
    L8_52[_UPVALUE4_ .. "." .. _UPVALUE6_.MinimumRate] = A4_48
  end
  if A5_49 ~= _UPVALUE0_.NIL then
    L8_52[_UPVALUE4_ .. "." .. _UPVALUE6_.MaximumRate] = A5_49
  end
  if A6_50 ~= _UPVALUE0_.NIL then
    L8_52[_UPVALUE4_ .. "." .. _UPVALUE6_.WANID] = A6_50
  end
  L10_54 = db.getAttribute(_UPVALUE4_, _UPVALUE5_, A7_51, _UPVALUE6_.ProfileName)
  L9_53 = db.getRows(_UPVALUE7_, _UPVALUE8_.ProfileName, L10_54)
  if #L9_53 == 0 then
    status = db.update(_UPVALUE4_, L8_52, A7_51)
  else
    return _UPVALUE3_.BW_IS_BEING_USED1
  end
  if status then
    L10_54 = "rowId != 0"
    status = db.setAttributeWhere(_UPVALUE1_, L10_54, _UPVALUE2_.Status, 0)
    os.execute("sleep 1")
    status = db.setAttributeWhere(_UPVALUE1_, L10_54, _UPVALUE2_.Status, 1)
  else
    return _UPVALUE3_.BW_CONFIG_FAILED
  end
  return _UPVALUE3_.BW_CONFIG_FAILED
end
