local L0_0
L0_0 = module
L0_0("com.teamf1.core.sslvpn.resource", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/sslvpn_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.sslvpn.returnCodes")
resouceTable = "SSLVPNResource"
resouceconfigTable = "SSLVPNResourceObject"
;({}).resourceName = "ResourceName"
;({}).serviceType = "ServiceType"
;({}).useCount = "UseCount"
;({}).accessMgmt = "accessMgmtEnable"
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
elseif PRODUCT_ID == "DSR-500_Ax" or PRODUCT_ID == "DSR-500N_Ax" then
else
end
function resourceNameGet()
  local L0_1, L1_2
  L0_1 = db
  L0_1 = L0_1.getNextRowId
  L1_2 = _UPVALUE0_
  L0_1 = L0_1(L1_2, resouceTable)
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(resouceTable, _UPVALUE1_, L0_1, _UPVALUE2_.resourceName)
  if L1_2 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_1, L1_2
end
function resourceNameGetNext(A0_3)
  local L1_4, L2_5
  L1_4 = _UPVALUE0_
  L1_4 = L1_4.NIL
  if A0_3 ~= L1_4 then
    L1_4 = tonumber
    L2_5 = A0_3
    L1_4 = L1_4(L2_5)
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.NIL
  elseif L1_4 == L2_5 then
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.INVALID_ARGUMENT
    return L1_4
  end
  L1_4 = db
  L1_4 = L1_4.existsRow
  L2_5 = resouceTable
  L1_4 = L1_4(L2_5, _UPVALUE1_, A0_3)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.FALSE
  if L1_4 == L2_5 then
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.INVALID_ARGUMENT
    return L1_4
  end
  L1_4 = db
  L1_4 = L1_4.getNextRowId
  L2_5 = A0_3
  L1_4 = L1_4(L2_5, resouceTable)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if L1_4 == L2_5 then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.NOT_EXIST
    return L2_5
  end
  L2_5 = db
  L2_5 = L2_5.getAttribute
  L2_5 = L2_5(resouceTable, _UPVALUE1_, L1_4, _UPVALUE2_.resourceName)
  if L2_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L2_5
end
function resourceNameSet(A0_6, A1_7)
  if A0_6 == _UPVALUE0_.NIL or tonumber(A0_6) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(resouceTable, _UPVALUE1_, A0_6) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_7 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(resouceTable, _UPVALUE1_, A0_6, _UPVALUE2_.resourceName, A1_7) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_6
  end
  return _UPVALUE0_.SUCCESS, A0_6
end
function resourceNameDelete(A0_8, A1_9)
  local L3_10
  L3_10 = _UPVALUE0_
  L3_10 = L3_10.NOT_SUPPORTED
  return L3_10, A0_8
end
function serviceTypeGet()
  local L0_11, L1_12
  L0_11 = db
  L0_11 = L0_11.getNextRowId
  L1_12 = _UPVALUE0_
  L0_11 = L0_11(L1_12, resouceTable)
  L1_12 = db
  L1_12 = L1_12.getAttribute
  L1_12 = L1_12(resouceTable, _UPVALUE1_, L0_11, _UPVALUE2_.serviceType)
  if L1_12 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_11, L1_12
end
function serviceTypeGetNext(A0_13)
  local L1_14, L2_15
  L1_14 = _UPVALUE0_
  L1_14 = L1_14.NIL
  if A0_13 ~= L1_14 then
    L1_14 = tonumber
    L2_15 = A0_13
    L1_14 = L1_14(L2_15)
    L2_15 = _UPVALUE0_
    L2_15 = L2_15.NIL
  elseif L1_14 == L2_15 then
    L1_14 = _UPVALUE0_
    L1_14 = L1_14.INVALID_ARGUMENT
    return L1_14
  end
  L1_14 = db
  L1_14 = L1_14.existsRow
  L2_15 = resouceTable
  L1_14 = L1_14(L2_15, _UPVALUE1_, A0_13)
  L2_15 = _UPVALUE0_
  L2_15 = L2_15.FALSE
  if L1_14 == L2_15 then
    L1_14 = _UPVALUE0_
    L1_14 = L1_14.INVALID_ARGUMENT
    return L1_14
  end
  L1_14 = db
  L1_14 = L1_14.getNextRowId
  L2_15 = A0_13
  L1_14 = L1_14(L2_15, resouceTable)
  L2_15 = _UPVALUE0_
  L2_15 = L2_15.NIL
  if L1_14 == L2_15 then
    L2_15 = _UPVALUE0_
    L2_15 = L2_15.NOT_EXIST
    return L2_15
  end
  L2_15 = db
  L2_15 = L2_15.getAttribute
  L2_15 = L2_15(resouceTable, _UPVALUE1_, L1_14, _UPVALUE2_.serviceType)
  if L2_15 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_14
  end
  return _UPVALUE0_.SUCCESS, L1_14, L2_15
end
function serviceTypeSet(A0_16, A1_17)
  if A0_16 == _UPVALUE0_.NIL or tonumber(A0_16) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(resouceTable, _UPVALUE1_, A0_16) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_17 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_17 ~= _UPVALUE2_ and A1_17 ~= _UPVALUE3_ and A1_17 ~= _UPVALUE4_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(resouceTable, _UPVALUE1_, A0_16, _UPVALUE5_.serviceType, A1_17) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_16
  end
  return _UPVALUE0_.SUCCESS, A0_16
end
function useCountGet()
  local L0_18, L1_19
  L0_18 = db
  L0_18 = L0_18.getNextRowId
  L1_19 = _UPVALUE0_
  L0_18 = L0_18(L1_19, resouceTable)
  L1_19 = db
  L1_19 = L1_19.getAttribute
  L1_19 = L1_19(resouceTable, _UPVALUE1_, L0_18, _UPVALUE2_.useCount)
  if L1_19 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_18, L1_19
end
function useCountGetNext(A0_20)
  local L1_21, L2_22
  L1_21 = _UPVALUE0_
  L1_21 = L1_21.NIL
  if A0_20 ~= L1_21 then
    L1_21 = tonumber
    L2_22 = A0_20
    L1_21 = L1_21(L2_22)
    L2_22 = _UPVALUE0_
    L2_22 = L2_22.NIL
  elseif L1_21 == L2_22 then
    L1_21 = _UPVALUE0_
    L1_21 = L1_21.INVALID_ARGUMENT
    return L1_21
  end
  L1_21 = db
  L1_21 = L1_21.existsRow
  L2_22 = resouceTable
  L1_21 = L1_21(L2_22, _UPVALUE1_, A0_20)
  L2_22 = _UPVALUE0_
  L2_22 = L2_22.FALSE
  if L1_21 == L2_22 then
    L1_21 = _UPVALUE0_
    L1_21 = L1_21.INVALID_ARGUMENT
    return L1_21
  end
  L1_21 = db
  L1_21 = L1_21.getNextRowId
  L2_22 = A0_20
  L1_21 = L1_21(L2_22, resouceTable)
  L2_22 = _UPVALUE0_
  L2_22 = L2_22.NIL
  if L1_21 == L2_22 then
    L2_22 = _UPVALUE0_
    L2_22 = L2_22.returnCodes
    L2_22 = L2_22.NOT_EXIST
    return L2_22
  end
  L2_22 = db
  L2_22 = L2_22.getAttribute
  L2_22 = L2_22(resouceTable, _UPVALUE1_, L1_21, _UPVALUE2_.useCount)
  if L2_22 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_21
  end
  return _UPVALUE0_.SUCCESS, L1_21, L2_22
end
function useCountSet(A0_23, A1_24)
  local L3_25
  L3_25 = _UPVALUE0_
  L3_25 = L3_25.NOT_SUPPORTED
  return L3_25, A0_23
end
function resourceConfigGet()
  local L0_26, L1_27, L2_28, L3_29, L4_30, L5_31
  L0_26 = db
  L0_26 = L0_26.getAttribute
  L1_27 = _UPVALUE0_
  L2_28 = _UPVALUE1_
  L3_29 = _UPVALUE2_
  L4_30 = _UPVALUE3_
  L4_30 = L4_30.accessMgmt
  L0_26 = L0_26(L1_27, L2_28, L3_29, L4_30)
  L1_27 = _UPVALUE4_
  if L0_26 == L1_27 then
    L1_27 = _UPVALUE5_
    L1_27 = L1_27.SSLVPN_REMOTEMANAGEMENT_DISABLED
    return L1_27
  end
  L1_27 = db
  L1_27 = L1_27.getNextRowId
  L2_28 = _UPVALUE2_
  L3_29 = resouceTable
  L1_27 = L1_27(L2_28, L3_29)
  L2_28 = db
  L2_28 = L2_28.getRow
  L3_29 = resouceTable
  L4_30 = _UPVALUE1_
  L5_31 = L1_27
  L2_28 = L2_28(L3_29, L4_30, L5_31)
  L3_29 = _UPVALUE6_
  L3_29 = L3_29.NIL
  if L2_28 == L3_29 then
    L3_29 = _UPVALUE6_
    L3_29 = L3_29.FAILURE
    return L3_29
  end
  L3_29, L4_30, L5_31 = nil, nil, nil
  L3_29 = L2_28[resouceTable .. "." .. _UPVALUE3_.resourceName]
  L4_30 = L2_28[resouceTable .. "." .. _UPVALUE3_.serviceType]
  L5_31 = L2_28[resouceTable .. "." .. _UPVALUE3_.useCount]
  return _UPVALUE6_.SUCCESS, L1_27, L3_29, L4_30, L5_31
end
function resourceConfigGetNext(A0_32)
  local L1_33, L2_34, L3_35, L4_36
  L1_33 = _UPVALUE0_
  L1_33 = L1_33.NIL
  if A0_32 ~= L1_33 then
    L1_33 = tonumber
    L2_34 = A0_32
    L1_33 = L1_33(L2_34)
    L2_34 = _UPVALUE0_
    L2_34 = L2_34.NIL
  elseif L1_33 == L2_34 then
    L1_33 = _UPVALUE0_
    L1_33 = L1_33.INVALID_ARGUMENT
    return L1_33
  end
  L1_33 = db
  L1_33 = L1_33.existsRow
  L2_34 = resouceTable
  L3_35 = _UPVALUE1_
  L4_36 = A0_32
  L1_33 = L1_33(L2_34, L3_35, L4_36)
  L2_34 = _UPVALUE0_
  L2_34 = L2_34.FALSE
  if L1_33 == L2_34 then
    L1_33 = _UPVALUE0_
    L1_33 = L1_33.INVALID_ARGUMENT
    return L1_33
  end
  L1_33 = db
  L1_33 = L1_33.getRow
  L2_34 = resouceTable
  L3_35 = _UPVALUE1_
  L4_36 = A0_32
  L1_33 = L1_33(L2_34, L3_35, L4_36)
  L2_34 = _UPVALUE0_
  L2_34 = L2_34.NIL
  if L1_33 == L2_34 then
    L2_34 = _UPVALUE0_
    L2_34 = L2_34.FAILURE
    L3_35 = A0_32
    return L2_34, L3_35
  end
  L2_34, L3_35, L4_36 = nil, nil, nil
  L2_34 = L1_33[resouceTable .. "." .. _UPVALUE2_.resourceName]
  L3_35 = L1_33[resouceTable .. "." .. _UPVALUE2_.serviceType]
  L4_36 = L1_33[resouceTable .. "." .. _UPVALUE2_.useCount]
  return _UPVALUE0_.SUCCESS, A0_32, L2_34, L3_35, L4_36
end
function resourceConfigSet(A0_37, A1_38, A2_39)
  local L3_40
  L3_40 = _UPVALUE0_
  L3_40 = L3_40.NIL
  if A0_37 ~= L3_40 then
    L3_40 = tonumber
    L3_40 = L3_40(A0_37)
  elseif L3_40 == _UPVALUE0_.NIL then
    L3_40 = _UPVALUE0_
    L3_40 = L3_40.INVALID_ARGUMENT
    return L3_40
  end
  L3_40 = db
  L3_40 = L3_40.existsRow
  L3_40 = L3_40(resouceTable, _UPVALUE1_, A0_37)
  if L3_40 == _UPVALUE0_.FALSE then
    L3_40 = _UPVALUE0_
    L3_40 = L3_40.INVALID_ARGUMENT
    return L3_40
  end
  L3_40 = {}
  if A1_38 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L3_40[resouceTable .. "." .. _UPVALUE2_.resourceName] = A1_38
  if A2_39 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A2_39 ~= _UPVALUE3_ and A2_39 ~= _UPVALUE4_ and A2_39 ~= _UPVALUE5_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L3_40[resouceTable .. "." .. _UPVALUE2_.serviceType] = A2_39
  if db.update(resouceTable, L3_40, A0_37) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_37
  end
  return _UPVALUE0_.SUCCESS, A0_37
end
function resourceConfigCreate(A0_41, A1_42)
  local L2_43, L3_44, L4_45, L5_46, L6_47
  L2_43 = db
  L2_43 = L2_43.existsRow
  L3_44 = resouceTable
  L4_45 = _UPVALUE0_
  L4_45 = L4_45.resourceName
  L5_46 = A0_41
  L2_43 = L2_43(L3_44, L4_45, L5_46)
  L3_44 = _UPVALUE1_
  L3_44 = L3_44.FALSE
  if L2_43 ~= L3_44 then
    L2_43 = _UPVALUE2_
    L2_43 = L2_43.RESOURCENAME_ALREADY_EXIST
    return L2_43
  end
  L2_43 = {}
  L3_44 = _UPVALUE1_
  L3_44 = L3_44.NIL
  if A0_41 == L3_44 then
    L3_44 = _UPVALUE1_
    L3_44 = L3_44.INVALID_ARGUMENT
    return L3_44
  end
  L3_44 = string
  L3_44 = L3_44.find
  L4_45 = A0_41
  L5_46 = "'"
  L3_44 = L3_44(L4_45, L5_46)
  L4_45 = _UPVALUE1_
  L4_45 = L4_45.NIL
  if L3_44 ~= L4_45 then
    L4_45 = _UPVALUE2_
    L4_45 = L4_45.RESOURCE_NAME_SPECIAL_CHARACTER
    return L4_45
  end
  L4_45 = resouceTable
  L5_46 = "."
  L6_47 = _UPVALUE0_
  L6_47 = L6_47.resourceName
  L4_45 = L4_45 .. L5_46 .. L6_47
  L2_43[L4_45] = A0_41
  L4_45 = _UPVALUE1_
  L4_45 = L4_45.NIL
  if A1_42 == L4_45 then
    L4_45 = _UPVALUE1_
    L4_45 = L4_45.INVALID_ARGUMENT
    return L4_45
  end
  L4_45 = _UPVALUE3_
  if A1_42 ~= L4_45 then
    L4_45 = _UPVALUE4_
    if A1_42 ~= L4_45 then
      L4_45 = _UPVALUE5_
      if A1_42 ~= L4_45 then
        L4_45 = _UPVALUE1_
        L4_45 = L4_45.INVALID_ARGUMENT
        return L4_45
      end
    end
  end
  L4_45 = resouceTable
  L5_46 = "."
  L6_47 = _UPVALUE0_
  L6_47 = L6_47.serviceType
  L4_45 = L4_45 .. L5_46 .. L6_47
  L2_43[L4_45] = A1_42
  L4_45 = db
  L4_45 = L4_45.getTable
  L5_46 = resouceTable
  L4_45 = L4_45(L5_46)
  if L4_45 ~= nil then
    L5_46 = #L4_45
    L6_47 = _UPVALUE6_
    if L5_46 >= L6_47 then
      L5_46 = _UPVALUE1_
      L5_46 = L5_46.MAX_LIMIT_REACHED
      return L5_46
    end
  end
  L5_46 = db
  L5_46 = L5_46.insert
  L6_47 = resouceTable
  L5_46 = L5_46(L6_47, L2_43)
  L6_47 = _UPVALUE1_
  L6_47 = L6_47.NIL
  if L5_46 == L6_47 then
    L6_47 = _UPVALUE1_
    L6_47 = L6_47.FAILURE
    return L6_47
  end
  L6_47 = db
  L6_47 = L6_47.getAttribute
  L6_47 = L6_47(resouceTable, _UPVALUE0_.resourceName, A0_41, _UPVALUE7_)
  return _UPVALUE1_.SUCCESS, L6_47
end
function resourceConfigDelete(A0_48)
  if A0_48 == _UPVALUE0_.NIL or tonumber(A0_48) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(resouceTable, _UPVALUE1_, A0_48) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.deleteRow(resouceTable, _UPVALUE1_, A0_48) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_48
  end
  return _UPVALUE0_.SUCCESS, A0_48
end
function resourceConfigGetAll()
  local L0_49, L1_50, L2_51
  L0_49 = db
  L0_49 = L0_49.getAttribute
  L1_50 = _UPVALUE0_
  L2_51 = _UPVALUE1_
  L0_49 = L0_49(L1_50, L2_51, _UPVALUE2_, _UPVALUE3_.accessMgmt)
  L1_50 = nil
  L2_51 = _UPVALUE4_
  if L0_49 == L2_51 then
    L2_51 = _UPVALUE5_
    L1_50 = L2_51.SSLVPN_REMOTEMANAGEMENT_DISABLED
  else
    L2_51 = _UPVALUE6_
    L1_50 = L2_51.SUCCESS
  end
  L2_51 = db
  L2_51 = L2_51.getTable
  L2_51 = L2_51(resouceTable, false)
  if L2_51 == _UPVALUE6_.NIL then
    return _UPVALUE6_.FAILURE
  end
  return L1_50, L2_51
end
function resourceConfigDeleteAll()
  if db.deleteAllRows(resouceTable) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function resourceConfigGetCur(A0_52)
  local L1_53, L2_54, L3_55, L4_56
  L1_53 = db
  L1_53 = L1_53.getRow
  L2_54 = resouceTable
  L3_55 = _UPVALUE0_
  L4_56 = A0_52
  L1_53 = L1_53(L2_54, L3_55, L4_56)
  L2_54 = _UPVALUE1_
  L2_54 = L2_54.NIL
  if L1_53 == L2_54 then
    L2_54 = _UPVALUE1_
    L2_54 = L2_54.FAILURE
    return L2_54
  end
  L2_54, L3_55, L4_56 = nil, nil, nil
  L2_54 = L1_53[resouceTable .. "." .. _UPVALUE2_.resourceName]
  L3_55 = L1_53[resouceTable .. "." .. _UPVALUE2_.serviceType]
  L4_56 = L1_53[resouceTable .. "." .. _UPVALUE2_.useCount]
  return _UPVALUE1_.SUCCESS, A0_52, L2_54, L3_55, L4_56
end
function resourceDelete(A0_57)
  local L1_58
  L1_58 = _UPVALUE0_
  L1_58 = L1_58.NIL
  if A0_57 == L1_58 then
    L1_58 = _UPVALUE0_
    L1_58 = L1_58.INVALID_ARGUMENT
    return L1_58
  end
  L1_58 = db
  L1_58 = L1_58.existsRow
  L1_58 = L1_58(resouceTable, _UPVALUE1_.resourceName, A0_57)
  if L1_58 == _UPVALUE0_.FALSE then
    L1_58 = _UPVALUE0_
    L1_58 = L1_58.INVALID_ARGUMENT
    return L1_58
  end
  L1_58 = db
  L1_58 = L1_58.deleteRow
  L1_58 = L1_58(resouceconfigTable, _UPVALUE1_.resourceName, A0_57)
  if L1_58 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L1_58 = db.deleteRow(resouceTable, _UPVALUE1_.resourceName, A0_57)
  if L1_58 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function useCountCheck(A0_59)
  if db.getAttribute(resouceTable, _UPVALUE0_.resourceName, A0_59, _UPVALUE0_.useCount) == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILUE
  end
  if db.getAttribute(resouceTable, _UPVALUE0_.resourceName, A0_59, _UPVALUE0_.useCount) ~= "0" then
    return _UPVALUE2_.RESOUCE_IS_IN_USE
  end
  return _UPVALUE1_.SUCCESS
end
function useCountCheckAll()
  local L0_60
  L0_60 = db
  L0_60 = L0_60.getTable
  L0_60 = L0_60(resouceTable, false)
  if L0_60 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  for _FORV_4_, _FORV_5_ in pairs(L0_60) do
    if L0_60[_FORV_4_][_UPVALUE1_.useCount] ~= "0" then
      return _UPVALUE2_.RESOUCE_IS_IN_USE
    end
  end
  return _UPVALUE0_.SUCCESS
end
function curServiceTypeGet(A0_61)
  return (db.getAttribute(resouceTable, _UPVALUE0_.resourceName, A0_61, _UPVALUE0_.serviceType))
end
