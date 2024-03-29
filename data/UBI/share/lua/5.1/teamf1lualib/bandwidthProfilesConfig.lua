local L0_0
L0_0 = module
L0_0("com.teamf1.core.network.bandwidthProfiles", package.seeall)
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
;({}).WANID = "WANID"
;({}).ClassId = "ClassId"
;({}).ROWID = "_ROWID_"
;({}).action = "action"
;({}).service = "service"
;({}).waninterface = "waninterface"
;({}).bandwidthrate = "bandwidthrate"
;({}).ProfileName = "ProfileName"
;({}).DscpMark = "DscpMark"
;({}).Status = "Status"
;({}).ClassId = "ClassId"
;({}).Status = "Status"
;({}).name = "name"
;({}).value = "value"
;({}).LogicalIfName = "LogicalIfName"
;({})["0"] = "10"
;({})["1"] = "30"
;({})["2"] = "60"
if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-1000" then
elseif UNIT_NAME == "DSR-500AC" or UNIT_NAME == "DSR-500" then
else
end
function bandwidthProfileStatusGet()
  local L0_1, L1_2, L2_3
  L0_1 = {}
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.FAILURE
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.FAILURE
  L2_3 = _UPVALUE1_ .. "=" .. _UPVALUE2_
  L0_1 = db.getRowWhere(_UPVALUE3_, L2_3)
  if L0_1 == _UPVALUE0_.NIL then
    return _UPVALUE4_.DB_OP_FAILED, L0_1
  end
  L1_2 = _UPVALUE0_.SUCCESS
  return L1_2, L0_1
end
function bandwidthProfileInfoGetAll()
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
function bandwidthProfileStatusModify(A0_6)
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
  if tonumber(A0_6) == 0 then
    if (db.getAttribute(_UPVALUE6_, _UPVALUE1_, _UPVALUE2_, _UPVALUE7_.action) or "0") == _UPVALUE8_ then
      return _UPVALUE4_.BW_MGMT_DISABLE
    end
  end
  L2_8 = db.update(_UPVALUE3_, L1_7, _UPVALUE2_)
  if not L2_8 then
    return _UPVALUE4_.DB_OP_FAILED
  end
  return _UPVALUE0_.SUCCESS
end
function bandwidthHWOffloadHandler()
  local L0_11, L1_12, L2_13
  L0_11 = _UPVALUE0_
  L0_11 = L0_11.NIL
  L1_12 = _UPVALUE0_
  L1_12 = L1_12.FAILURE
  L2_13 = _UPVALUE0_
  L2_13 = L2_13.NIL
  L0_11 = db.getAttribute(_UPVALUE1_, _UPVALUE2_.name, _UPVALUE3_, _UPVALUE2_.value)
  if L0_11 == _UPVALUE0_.NIL then
    L1_12 = _UPVALUE0_.SUCCESS
    return L1_12
  end
  L2_13 = _UPVALUE4_ .. L0_11 .. " " .. _UPVALUE5_
  os.execute(L2_13)
  L1_12 = _UPVALUE0_.SUCCESS
  return L1_12
end
function deleteAvailableProfiles(A0_14)
  local L1_15, L2_16, L3_17, L4_18, L5_19, L6_20, L7_21, L8_22, L9_23, L10_24, L11_25, L12_26, L13_27
  L1_15 = {}
  L2_16 = {}
  L3_17 = {}
  L4_18 = _UPVALUE0_
  L4_18 = L4_18.NIL
  L5_19 = _UPVALUE0_
  L5_19 = L5_19.NIL
  L6_20 = _UPVALUE0_
  L6_20 = L6_20.NIL
  L7_21 = _UPVALUE1_
  L8_22 = _UPVALUE0_
  L8_22 = L8_22.FAILURE
  for L12_26, L13_27 in L9_23(L10_24) do
    L1_15 = {}
    L1_15[_UPVALUE2_ .. "." .. _UPVALUE3_.ROWID] = L13_27
    L6_20 = db.getAttribute(_UPVALUE2_, _UPVALUE4_, L13_27, _UPVALUE3_.DscpMark)
    L4_18 = db.existsRow(_UPVALUE5_, _UPVALUE6_.DscpMark, L6_20)
    L6_20 = db.getAttribute(_UPVALUE2_, _UPVALUE4_, L13_27, _UPVALUE3_.ProfileName)
    L3_17 = db.getRows(_UPVALUE7_, _UPVALUE8_.ProfileName, L6_20)
    L2_16 = {}
    L2_16[_UPVALUE5_ .. "." .. _UPVALUE6_.Status] = 0
    if #L3_17 ~= 0 then
      L7_21 = _UPVALUE1_
      L5_19 = "1"
    else
      L7_21 = _UPVALUE9_
    end
    L7_21 = L7_21 and db.update(_UPVALUE5_, L2_16, L4_18)
    L7_21 = L7_21 and db.delete(_UPVALUE2_, L1_15)
    if not L7_21 then
      break
    end
  end
  if L7_21 then
    L8_22 = L9_23.SUCCESS
  elseif L5_19 == "1" then
    L8_22 = L9_23.BW_IS_BEING_USED
  else
    L8_22 = L9_23.BW_DEL_FAILED
  end
  return L8_22
end
function bandwidthProfileInfoGet(A0_28)
  local L1_29, L2_30
  L1_29 = {}
  L2_30 = _UPVALUE0_
  L2_30 = L2_30.FAILURE
  if A0_28 == "-1" then
    L1_29 = db.getDefaults(_UPVALUE1_, _UPVALUE2_)
    L1_29[_UPVALUE2_ .. "." .. _UPVALUE3_.Policy] = _UPVALUE4_
    L1_29[_UPVALUE2_ .. "." .. _UPVALUE3_.ProfileType] = _UPVALUE5_
  else
    L1_29 = db.getRow(_UPVALUE2_, _UPVALUE6_, A0_28)
  end
  if L1_29 == _UPVALUE0_.NIL then
    return _UPVALUE7_.DB_OP_FAILED, L1_29
  end
  L2_30 = _UPVALUE0_.SUCCESS
  return L2_30, L1_29
end
function vlanInfoGet()
  local L0_31, L1_32
  L0_31 = {}
  L1_32 = _UPVALUE0_
  L1_32 = L1_32.FAILURE
  L0_31 = db.getTable(_UPVALUE1_)
  if L0_31 == _UPVALUE0_.NIL then
    return _UPVALUE2_.DB_OP_FAILED, L0_31
  end
  L1_32 = _UPVALUE0_.SUCCESS
  return L1_32, L0_31
end
function configPortInfoGet()
  local L0_33, L1_34
  L0_33 = _UPVALUE0_
  L0_33 = L0_33.NIL
  L1_34 = _UPVALUE0_
  L1_34 = L1_34.FAILURE
  L0_33 = db.getAttribute(_UPVALUE1_, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.LogicalIfName) or ""
  if L0_33 == _UPVALUE0_.NIL then
    return _UPVALUE5_.DB_OP_FAILED, L0_33
  end
  L1_34 = _UPVALUE0_.SUCCESS
  return L1_34, L0_33
end
function bandwidthProfileAdd(A0_35, A1_36, A2_37, A3_38, A4_39, A5_40, A6_41)
  local L7_42, L8_43, L9_44, L10_45, L11_46, L12_47, L13_48, L14_49, L15_50, L16_51, L17_52, L18_53, L19_54
  L7_42 = {}
  L8_43 = {}
  L9_44 = _UPVALUE0_
  L9_44 = L9_44.NIL
  L10_45 = _UPVALUE0_
  L10_45 = L10_45.NIL
  L11_46 = _UPVALUE0_
  L11_46 = L11_46.NIL
  L12_47 = _UPVALUE0_
  L12_47 = L12_47.FAILURE
  L13_48 = db
  L13_48 = L13_48.getDefaults
  L14_49 = _UPVALUE1_
  L15_50 = _UPVALUE2_
  L13_48 = L13_48(L14_49, L15_50)
  L7_42 = L13_48
  L13_48 = db
  L13_48 = L13_48.getTable
  L14_49 = _UPVALUE2_
  L15_50 = false
  L13_48 = L13_48(L14_49, L15_50)
  L14_49 = nil
  L15_50 = PRODUCT_ID
  if L15_50 ~= "DSR-1000AC_Ax" then
    L15_50 = PRODUCT_ID
    if L15_50 ~= "DSR-500AC_Ax" then
      L15_50 = PRODUCT_ID
      if L15_50 ~= "DSR-1000_Bx" then
        L15_50 = PRODUCT_ID
        if L15_50 ~= "DSR-500_Bx" then
          L15_50 = PRODUCT_ID
          if L15_50 ~= "DSR-1000_Ax" then
            L15_50 = PRODUCT_ID
          end
        end
      end
    end
  else
    if L15_50 == "DSR-1000N_Ax" then
      L14_49 = 15
  end
  else
    L14_49 = 8
  end
  if L13_48 ~= nil then
    L15_50 = #L13_48
    L16_51 = L14_49 - 1
    if L15_50 > L16_51 then
      L15_50 = _UPVALUE0_
      L15_50 = L15_50.MAX_LIMIT_REACHED
      return L15_50
    end
  end
  L15_50 = db
  L15_50 = L15_50.getAttribute
  L16_51 = _UPVALUE3_
  L17_52 = _UPVALUE4_
  L18_53 = _UPVALUE5_
  L19_54 = _UPVALUE6_
  L19_54 = L19_54.Status
  L15_50 = L15_50(L16_51, L17_52, L18_53, L19_54)
  L16_51 = tonumber
  L17_52 = L15_50
  L16_51 = L16_51(L17_52)
  if L16_51 ~= 1 then
    L16_51 = _UPVALUE7_
    L16_51 = L16_51.BW_PROFILE_ENABLED
    return L16_51
  end
  L16_51 = db
  L16_51 = L16_51.getAttribute
  L17_52 = _UPVALUE2_
  L18_53 = _UPVALUE2_
  L19_54 = "."
  L18_53 = L18_53 .. L19_54 .. _UPVALUE6_.ProfileName
  L19_54 = A0_35
  L16_51 = L16_51(L17_52, L18_53, L19_54, _UPVALUE4_)
  L11_46 = L16_51
  L16_51 = _UPVALUE0_
  L16_51 = L16_51.NIL
  if L11_46 ~= L16_51 then
    L16_51 = L12_47
    L17_52 = _UPVALUE7_
    L17_52 = L17_52.PROILE_EXISTS
    return L16_51, L17_52
  end
  if A1_36 == "0" then
    L16_51 = db
    L16_51 = L16_51.getRow
    L17_52 = "bandwidthmanagement"
    L18_53 = _UPVALUE4_
    L19_54 = "1"
    L16_51 = L16_51(L17_52, L18_53, L19_54)
    L17_52 = L16_51["bandwidthmanagement.action"]
    if L17_52 == "1" then
      L17_52 = tonumber
      L18_53 = L16_51["bandwidthmanagement.bandwidthrate"]
      L17_52 = L17_52(L18_53)
      L18_53 = _UPVALUE8_
      L18_53 = L18_53 - L17_52
      L18_53 = L18_53 * 1024
      L19_54 = 0
      if A2_37 == "1" then
        L19_54 = tonumber(A5_40)
      else
        L19_54 = tonumber(_UPVALUE9_[A3_38]) * 1024
      end
      if L18_53 < L19_54 then
        return _UPVALUE7_.BW_MGMT_LIMIT_REACHED
      end
    end
  end
  L16_51 = _UPVALUE0_
  L16_51 = L16_51.NIL
  if A0_35 ~= L16_51 then
    L16_51 = _UPVALUE2_
    L17_52 = "."
    L18_53 = _UPVALUE6_
    L18_53 = L18_53.ProfileName
    L16_51 = L16_51 .. L17_52 .. L18_53
    L13_48[L16_51] = A0_35
  end
  L16_51 = _UPVALUE0_
  L16_51 = L16_51.NIL
  if A1_36 ~= L16_51 then
    L16_51 = _UPVALUE2_
    L17_52 = "."
    L18_53 = _UPVALUE6_
    L18_53 = L18_53.Policy
    L16_51 = L16_51 .. L17_52 .. L18_53
    L13_48[L16_51] = A1_36
  end
  L16_51 = _UPVALUE0_
  L16_51 = L16_51.NIL
  if A2_37 ~= L16_51 then
    L16_51 = _UPVALUE2_
    L17_52 = "."
    L18_53 = _UPVALUE6_
    L18_53 = L18_53.ProfileType
    L16_51 = L16_51 .. L17_52 .. L18_53
    L13_48[L16_51] = A2_37
  end
  L16_51 = _UPVALUE0_
  L16_51 = L16_51.NIL
  if A3_38 ~= L16_51 then
    L16_51 = _UPVALUE2_
    L17_52 = "."
    L18_53 = _UPVALUE6_
    L18_53 = L18_53.Priority
    L16_51 = L16_51 .. L17_52 .. L18_53
    L13_48[L16_51] = A3_38
  end
  L16_51 = _UPVALUE0_
  L16_51 = L16_51.NIL
  if A4_39 ~= L16_51 then
    L16_51 = _UPVALUE2_
    L17_52 = "."
    L18_53 = _UPVALUE6_
    L18_53 = L18_53.MinimumRate
    L16_51 = L16_51 .. L17_52 .. L18_53
    L13_48[L16_51] = A4_39
  end
  L16_51 = _UPVALUE0_
  L16_51 = L16_51.NIL
  if A5_40 ~= L16_51 then
    L16_51 = _UPVALUE2_
    L17_52 = "."
    L18_53 = _UPVALUE6_
    L18_53 = L18_53.MaximumRate
    L16_51 = L16_51 .. L17_52 .. L18_53
    L13_48[L16_51] = A5_40
  end
  L16_51 = _UPVALUE0_
  L16_51 = L16_51.NIL
  if A6_41 ~= L16_51 then
    L16_51 = _UPVALUE2_
    L17_52 = "."
    L18_53 = _UPVALUE6_
    L18_53 = L18_53.WANID
    L16_51 = L16_51 .. L17_52 .. L18_53
    L13_48[L16_51] = A6_41
  end
  L16_51 = db
  L16_51 = L16_51.existsRow
  L17_52 = _UPVALUE10_
  L18_53 = _UPVALUE11_
  L18_53 = L18_53.Status
  L19_54 = _UPVALUE12_
  L16_51 = L16_51(L17_52, L18_53, L19_54)
  L9_44 = L16_51
  if L9_44 then
    L16_51 = db
    L16_51 = L16_51.getAttribute
    L17_52 = _UPVALUE10_
    L18_53 = _UPVALUE4_
    L19_54 = L9_44
    L16_51 = L16_51(L17_52, L18_53, L19_54, _UPVALUE11_.ClassId)
    L11_46 = L16_51
    L16_51 = _UPVALUE2_
    L17_52 = "."
    L18_53 = _UPVALUE6_
    L18_53 = L18_53.ClassId
    L16_51 = L16_51 .. L17_52 .. L18_53
    L13_48[L16_51] = L11_46
    L16_51 = db
    L16_51 = L16_51.getAttribute
    L17_52 = _UPVALUE10_
    L18_53 = _UPVALUE4_
    L19_54 = L9_44
    L16_51 = L16_51(L17_52, L18_53, L19_54, _UPVALUE11_.DscpMark)
    L11_46 = L16_51
    L16_51 = _UPVALUE2_
    L17_52 = "."
    L18_53 = _UPVALUE6_
    L18_53 = L18_53.DscpMark
    L16_51 = L16_51 .. L17_52 .. L18_53
    L13_48[L16_51] = L11_46
    L16_51 = {}
    L8_43 = L16_51
    L16_51 = _UPVALUE10_
    L17_52 = "."
    L18_53 = _UPVALUE11_
    L18_53 = L18_53.Status
    L16_51 = L16_51 .. L17_52 .. L18_53
    L8_43[L16_51] = 1
    L16_51 = db
    L16_51 = L16_51.update
    L17_52 = _UPVALUE10_
    L18_53 = L8_43
    L19_54 = L9_44
    L16_51 = L16_51(L17_52, L18_53, L19_54)
    L10_45 = L16_51
    if L10_45 then
      L16_51 = db
      L16_51 = L16_51.insert
      L17_52 = _UPVALUE2_
      L18_53 = L13_48
      L16_51 = L16_51(L17_52, L18_53)
      L10_45 = L16_51
    end
  else
    L16_51 = _UPVALUE0_
    L16_51 = L16_51.MAX_LIMIT_REACHED
    return L16_51
  end
  if L10_45 then
    L16_51 = _UPVALUE0_
    L12_47 = L16_51.SUCCESS
  else
    L16_51 = _UPVALUE7_
    L12_47 = L16_51.BW_CONFIG_FAILED
  end
  return L12_47
end
function bandwidthProfileSet(A0_55, A1_56, A2_57, A3_58, A4_59, A5_60, A6_61, A7_62)
  local L8_63, L9_64, L10_65, L11_66, L12_67, L13_68, L14_69, L15_70, L16_71
  L8_63 = {}
  L9_64 = {}
  L10_65 = _UPVALUE0_
  L10_65 = L10_65.NIL
  L11_66 = _UPVALUE0_
  L11_66 = L11_66.FAILURE
  L12_67 = db
  L12_67 = L12_67.getRow
  L13_68 = _UPVALUE1_
  L14_69 = _UPVALUE2_
  L15_70 = A7_62
  L12_67 = L12_67(L13_68, L14_69, L15_70)
  L8_63 = L12_67
  L12_67 = _UPVALUE0_
  L12_67 = L12_67.NIL
  if L8_63 == L12_67 then
    L12_67 = _UPVALUE3_
    L11_66 = L12_67.DB_OP_FAILED
  end
  L12_67 = db
  L12_67 = L12_67.getAttribute
  L13_68 = _UPVALUE4_
  L14_69 = _UPVALUE2_
  L15_70 = _UPVALUE5_
  L16_71 = _UPVALUE6_
  L16_71 = L16_71.Status
  L12_67 = L12_67(L13_68, L14_69, L15_70, L16_71)
  L13_68 = tonumber
  L14_69 = L12_67
  L13_68 = L13_68(L14_69)
  if L13_68 ~= 1 then
    L13_68 = _UPVALUE3_
    L13_68 = L13_68.BW_PROFILE_ENABLED
    return L13_68
  end
  L13_68 = _UPVALUE0_
  L13_68 = L13_68.NIL
  if A0_55 ~= L13_68 then
    L13_68 = _UPVALUE1_
    L14_69 = "."
    L15_70 = _UPVALUE6_
    L15_70 = L15_70.ProfileName
    L13_68 = L13_68 .. L14_69 .. L15_70
    L8_63[L13_68] = A0_55
  end
  L13_68 = _UPVALUE0_
  L13_68 = L13_68.NIL
  if A1_56 ~= L13_68 then
    L13_68 = _UPVALUE1_
    L14_69 = "."
    L15_70 = _UPVALUE6_
    L15_70 = L15_70.Policy
    L13_68 = L13_68 .. L14_69 .. L15_70
    L8_63[L13_68] = A1_56
  end
  L13_68 = _UPVALUE0_
  L13_68 = L13_68.NIL
  if A2_57 ~= L13_68 then
    L13_68 = _UPVALUE1_
    L14_69 = "."
    L15_70 = _UPVALUE6_
    L15_70 = L15_70.ProfileType
    L13_68 = L13_68 .. L14_69 .. L15_70
    L8_63[L13_68] = A2_57
  end
  L13_68 = _UPVALUE0_
  L13_68 = L13_68.NIL
  if A3_58 ~= L13_68 then
    L13_68 = _UPVALUE1_
    L14_69 = "."
    L15_70 = _UPVALUE6_
    L15_70 = L15_70.Priority
    L13_68 = L13_68 .. L14_69 .. L15_70
    L8_63[L13_68] = A3_58
  end
  L13_68 = _UPVALUE0_
  L13_68 = L13_68.NIL
  if A4_59 ~= L13_68 then
    L13_68 = _UPVALUE1_
    L14_69 = "."
    L15_70 = _UPVALUE6_
    L15_70 = L15_70.MinimumRate
    L13_68 = L13_68 .. L14_69 .. L15_70
    L8_63[L13_68] = A4_59
  end
  L13_68 = _UPVALUE0_
  L13_68 = L13_68.NIL
  if A5_60 ~= L13_68 then
    L13_68 = _UPVALUE1_
    L14_69 = "."
    L15_70 = _UPVALUE6_
    L15_70 = L15_70.MaximumRate
    L13_68 = L13_68 .. L14_69 .. L15_70
    L8_63[L13_68] = A5_60
  end
  L13_68 = _UPVALUE0_
  L13_68 = L13_68.NIL
  if A6_61 ~= L13_68 then
    L13_68 = _UPVALUE1_
    L14_69 = "."
    L15_70 = _UPVALUE6_
    L15_70 = L15_70.WANID
    L13_68 = L13_68 .. L14_69 .. L15_70
    L8_63[L13_68] = A6_61
  end
  if A1_56 == "0" then
    L13_68 = db
    L13_68 = L13_68.getRow
    L14_69 = "bandwidthmanagement"
    L15_70 = _UPVALUE2_
    L16_71 = "1"
    L13_68 = L13_68(L14_69, L15_70, L16_71)
    L14_69 = L13_68["bandwidthmanagement.action"]
    if L14_69 == "1" then
      L14_69 = tonumber
      L15_70 = L13_68["bandwidthmanagement.bandwidthrate"]
      L14_69 = L14_69(L15_70)
      L15_70 = _UPVALUE7_
      L15_70 = L15_70 - L14_69
      L15_70 = L15_70 * 1024
      L16_71 = 0
      if A2_57 == "1" then
        L16_71 = tonumber(A5_60)
      else
        L16_71 = tonumber(_UPVALUE8_[A3_58]) * 1024
      end
      if L15_70 < L16_71 then
        return _UPVALUE3_.BW_MGMT_LIMIT_REACHED
      end
    end
  end
  L13_68 = db
  L13_68 = L13_68.getAttribute
  L14_69 = _UPVALUE1_
  L15_70 = _UPVALUE2_
  L16_71 = A7_62
  L13_68 = L13_68(L14_69, L15_70, L16_71, _UPVALUE6_.ProfileName)
  L10_65 = L13_68
  L13_68 = db
  L13_68 = L13_68.getRows
  L14_69 = _UPVALUE9_
  L15_70 = _UPVALUE10_
  L15_70 = L15_70.ProfileName
  L16_71 = L10_65
  L13_68 = L13_68(L14_69, L15_70, L16_71)
  L9_64 = L13_68
  L13_68 = #L9_64
  if L13_68 == 0 then
    L13_68 = db
    L13_68 = L13_68.update
    L14_69 = _UPVALUE1_
    L15_70 = L8_63
    L16_71 = A7_62
    L13_68 = L13_68(L14_69, L15_70, L16_71)
    status = L13_68
  else
    L13_68 = _UPVALUE3_
    L11_66 = L13_68.BW_IS_BEING_USED1
    return L11_66
  end
  L13_68 = status
  if L13_68 then
    L10_65 = "rowId != 0"
    L13_68 = db
    L13_68 = L13_68.setAttributeWhere
    L14_69 = _UPVALUE4_
    L15_70 = L10_65
    L16_71 = _UPVALUE11_
    L16_71 = L16_71.Status
    L13_68 = L13_68(L14_69, L15_70, L16_71, 0)
    status = L13_68
    L13_68 = os
    L13_68 = L13_68.execute
    L14_69 = "sleep 1"
    L13_68(L14_69)
    L13_68 = db
    L13_68 = L13_68.setAttributeWhere
    L14_69 = _UPVALUE4_
    L15_70 = L10_65
    L16_71 = _UPVALUE11_
    L16_71 = L16_71.Status
    L13_68 = L13_68(L14_69, L15_70, L16_71, 1)
    status = L13_68
    L13_68 = _UPVALUE0_
    L11_66 = L13_68.SUCCESS
  else
    L13_68 = _UPVALUE3_
    L11_66 = L13_68.BW_CONFIG_FAILED
    return L11_66
  end
  return L11_66
end
function qosBandwidthProfileDelete(A0_72)
  local L1_73
  L1_73 = _UPVALUE0_
  L1_73 = L1_73.NIL
  if A0_72 == L1_73 then
    L1_73 = _UPVALUE0_
    L1_73 = L1_73.INVALID_ARGUMENT
    return L1_73
  end
  L1_73 = tonumber
  L1_73 = L1_73(A0_72)
  if L1_73 == _UPVALUE0_.NIL then
    L1_73 = _UPVALUE0_
    L1_73 = L1_73.INVALID_ARGUMENT
    return L1_73
  end
  L1_73 = db
  L1_73 = L1_73.existsRow
  L1_73 = L1_73(_UPVALUE1_, _UPVALUE2_, A0_72)
  if L1_73 == _UPVALUE0_.FALSE then
    L1_73 = _UPVALUE0_
    L1_73 = L1_73.NOT_EXIST
    return L1_73
  end
  L1_73 = db
  L1_73 = L1_73.getAttribute
  L1_73 = L1_73(_UPVALUE1_, _UPVALUE2_, A0_72, _UPVALUE3_.ProfileName)
  if #db.getRows(_UPVALUE4_, _UPVALUE5_.ProfileName, L1_73) ~= 0 then
    return _UPVALUE6_.BW_IS_BEING_USED, A0_72
  end
  if db.deleteRow(_UPVALUE1_, _UPVALUE2_, A0_72) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_72
  end
  return _UPVALUE0_.SUCCESS, A0_72
end
function bandwidthManagementConfig(A0_74, A1_75, A2_76, A3_77)
  local L4_78, L5_79, L6_80, L7_81, L8_82, L9_83, L10_84, L11_85, L12_86, L13_87, L14_88, L15_89
  L4_78 = {}
  L5_79 = {}
  L6_80 = _UPVALUE0_
  L6_80 = L6_80.NIL
  L7_81 = _UPVALUE0_
  L7_81 = L7_81.NIL
  L8_82 = _UPVALUE0_
  L8_82 = L8_82.NIL
  L9_83 = _UPVALUE0_
  L9_83 = L9_83.FAILURE
  L10_84 = db
  L10_84 = L10_84.getAttribute
  L11_85 = _UPVALUE1_
  L12_86 = _UPVALUE2_
  L13_87 = _UPVALUE3_
  L14_88 = _UPVALUE4_
  L14_88 = L14_88.Status
  L10_84 = L10_84(L11_85, L12_86, L13_87, L14_88)
  L11_85 = tonumber
  L12_86 = L10_84
  L11_85 = L11_85(L12_86)
  if L11_85 ~= 1 then
    L11_85 = _UPVALUE5_
    L11_85 = L11_85.BW_PROFILE_STATUS_ENABLE
    return L11_85
  end
  L11_85 = _UPVALUE6_
  if A0_74 == L11_85 then
    L11_85 = "Policy = 0"
    L12_86 = 0
    L13_87 = -1
    L14_88 = 0
    L15_89 = db
    L15_89 = L15_89.getRowsWhere
    L15_89 = L15_89("BandWidthProfile", L11_85)
    L15_89 = L15_89 or {}
    for _FORV_19_, _FORV_20_ in pairs(L15_89) do
      if _FORV_20_["BandWidthProfile.ProfileType"] == "1" then
        if L12_86 < tonumber(_FORV_20_["BandWidthProfile.MaximumRate"]) then
          L12_86 = tonumber(_FORV_20_["BandWidthProfile.MaximumRate"])
        end
      elseif L13_87 < tonumber(_FORV_20_["BandWidthProfile.Priority"]) then
        L13_87 = tonumber(_FORV_20_["BandWidthProfile.Priority"])
        L14_88 = tonumber(_UPVALUE7_[_FORV_20_["BandWidthProfile.Priority"]]) * 1024
      end
    end
    if tonumber(A3_77) * 1024 > _UPVALUE8_ * 1024 - L12_86 and tonumber(A3_77) * 1024 > _UPVALUE8_ * 1024 - L14_88 then
      return _UPVALUE5_.BW_PROFILE_RATE_LIMIT_REACHED
    end
    if (db.getRowWhere("Services", "ServiceName='" .. A2_76 .. "'")["Services.PortType"] == "0" or db.getRowWhere("Services", "ServiceName='" .. A2_76 .. "'")["Services.PortType"] == "2") and tonumber(db.getRowWhere("Services", "ServiceName='" .. A2_76 .. "'")["Services._ROWID_"]) > 73 and tonumber(db.getRowWhere("Services", "ServiceName='" .. A2_76 .. "'")["Services.DestinationPortStart"]) == 0 and tonumber(db.getRowWhere("Services", "ServiceName='" .. A2_76 .. "'")["Services.DestinationPortEnd"]) == 0 and (tonumber(db.getRowWhere("Services", "ServiceName='" .. A2_76 .. "'")["Services.MultiPort"]) == 0 or db.getRowWhere("Services", "ServiceName='" .. A2_76 .. "'")["Services.MultiPort"] == nil or db.getRowWhere("Services", "ServiceName='" .. A2_76 .. "'")["Services.MultiPort"] == "") then
      return _UPVALUE9_.SERVICE_NO_DESTINATION_PORT
    end
    L4_78[_UPVALUE10_ .. "." .. _UPVALUE11_.action] = A0_74
    L4_78[_UPVALUE10_ .. "." .. _UPVALUE11_.waninterface] = A1_75
    L4_78[_UPVALUE10_ .. "." .. _UPVALUE11_.service] = A2_76
    L4_78[_UPVALUE10_ .. "." .. _UPVALUE11_.bandwidthrate] = A3_77
  else
    L11_85 = _UPVALUE10_
    L12_86 = "."
    L13_87 = _UPVALUE11_
    L13_87 = L13_87.action
    L11_85 = L11_85 .. L12_86 .. L13_87
    L4_78[L11_85] = A0_74
  end
  L11_85 = db
  L11_85 = L11_85.update
  L12_86 = _UPVALUE10_
  L13_87 = L4_78
  L14_88 = _UPVALUE3_
  L11_85 = L11_85(L12_86, L13_87, L14_88)
  valid = L11_85
  L11_85 = valid
  if not L11_85 then
    L11_85 = _UPVALUE5_
    L9_83 = L11_85.DB_OP_FAILED
    return L9_83
  end
  L11_85 = _UPVALUE0_
  L9_83 = L11_85.SUCCESS
  return L9_83
end
function bandwidthInfoGet()
  local L0_90, L1_91, L2_92
  L0_90 = _UPVALUE0_
  L0_90 = L0_90.NIL
  L1_91 = _UPVALUE0_
  L1_91 = L1_91.FAILURE
  L2_92 = {}
  BandwidthManagement = db.getAttribute(_UPVALUE1_, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.action) or ""
  Servicetype = db.getAttribute(_UPVALUE1_, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.service) or ""
  WANInterface = db.getAttribute(_UPVALUE1_, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.waninterface) or ""
  BandwidthRate = db.getAttribute(_UPVALUE1_, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.bandwidthrate) or ""
  L2_92["BandwidthManagement.BandwidthManagement"] = BandwidthManagement
  L2_92["BandwidthManagement.Servicetype"] = Servicetype
  L2_92["BandwidthManagement.WANInterface"] = WANInterface
  L2_92["BandwidthManagement.BandwidthRate"] = BandwidthRate
  if BandwidthManagement == _UPVALUE0_.NIL then
    return _UPVALUE5_.DB_OP_FAILED, BandwidthManagement
  end
  L1_91 = _UPVALUE0_.SUCCESS
  return L1_91, L2_92
end
