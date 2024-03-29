local L0_0
L0_0 = module
L0_0("com.teamf1.core.snmp.acl", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/cookie")
L0_0 = require
L0_0("teamf1lualib/snmp_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.snmp.returnCodes")
ACCESS_TYPE1 = "rocommunity"
ACCESS_TYPE2 = "rwcommunity"
aclTable = "snmpAccessControl"
;({}).key = "_ROWID_"
;({}).ipAddress = "ipAddr"
;({}).subnetMask = "subnetMask"
;({}).community = "commName"
;({}).accessType = "accessType"
function ipAddressGet()
  local L0_1, L1_2, L2_3
  L0_1 = cookieGet
  L1_2 = aclTable
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.key
  L1_2 = L0_1(L1_2, L2_3)
  if L1_2 == nil then
    L2_3 = _UPVALUE1_
    L2_3 = L2_3.FAILURE
    return L2_3
  end
  L2_3 = db
  L2_3 = L2_3.getAttribute
  L2_3 = L2_3(aclTable, _UPVALUE0_.key, L1_2, _UPVALUE0_.ipAddress)
  if L2_3 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_2, L2_3
end
function ipAddressGetNext(A0_4)
  local L1_5, L2_6, L3_7
  if A0_4 == nil then
    L1_5 = _UPVALUE0_
    L1_5 = L1_5.INVALID_ARGUMENT
    return L1_5
  end
  L1_5 = cookieGetNext
  L2_6 = aclTable
  L3_7 = _UPVALUE1_
  L3_7 = L3_7.key
  L2_6 = L1_5(L2_6, L3_7, A0_4)
  if L2_6 == nil then
    L3_7 = _UPVALUE0_
    L3_7 = L3_7.TABLE_IS_FULL
    return L3_7
  end
  L3_7 = db
  L3_7 = L3_7.getAttribute
  L3_7 = L3_7(aclTable, _UPVALUE1_.key, L2_6, _UPVALUE1_.ipAddress)
  if L3_7 == nil then
    return _UPVALUE0_.FAILURE, L2_6
  end
  return _UPVALUE0_.SUCCESS, L2_6, L3_7
end
function ipAddressSet(A0_8, A1_9)
  if A0_8 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(aclTable, _UPVALUE1_.key, A0_8) == false then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_9 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE2_.ipAddressCheck("2", A1_9)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(aclTable, _UPVALUE1_.key, A0_8, _UPVALUE1_.ipAddress, A1_9) == nil then
    return _UPVALUE0_.FAILURE, A0_8
  end
  return _UPVALUE0_.SUCCESS, A0_8
end
function ipAddressDelete(A0_10, A1_11)
  return _UPVALUE0_.NOT_SUPPORTED
end
function subnetMaskGet()
  local L0_12, L1_13, L2_14
  L0_12 = cookieGet
  L1_13 = aclTable
  L2_14 = _UPVALUE0_
  L2_14 = L2_14.key
  L1_13 = L0_12(L1_13, L2_14)
  if L1_13 == nil then
    L2_14 = _UPVALUE1_
    L2_14 = L2_14.FAILURE
    return L2_14
  end
  L2_14 = db
  L2_14 = L2_14.getAttribute
  L2_14 = L2_14(aclTable, _UPVALUE0_.key, L1_13, _UPVALUE0_.subnetMask)
  if L2_14 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_13, L2_14
end
function subnetMaskGetNext(A0_15)
  local L1_16, L2_17, L3_18
  if A0_15 == nil then
    L1_16 = _UPVALUE0_
    L1_16 = L1_16.INVALID_ARGUMENT
    return L1_16
  end
  L1_16 = cookieGetNext
  L2_17 = aclTable
  L3_18 = _UPVALUE1_
  L3_18 = L3_18.key
  L2_17 = L1_16(L2_17, L3_18, A0_15)
  if L2_17 == nil then
    L3_18 = _UPVALUE0_
    L3_18 = L3_18.TABLE_IS_FULL
    return L3_18
  end
  L3_18 = db
  L3_18 = L3_18.getAttribute
  L3_18 = L3_18(aclTable, _UPVALUE1_.key, L2_17, _UPVALUE1_.subnetMask)
  if L3_18 == nil then
    return _UPVALUE0_.FAILURE, L2_17
  end
  return _UPVALUE0_.SUCCESS, L2_17, L3_18
end
function subnetMaskSet(A0_19, A1_20)
  if A0_19 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(aclTable, _UPVALUE1_.key, A0_19) == false then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_20 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE2_.ipAddressCheck("2", A1_20)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(aclTable, _UPVALUE1_.key, A0_19, _UPVALUE1_.subnetMask, A1_20) == nil then
    return _UPVALUE0_.FAILURE, A0_19
  end
  return _UPVALUE0_.SUCCESS, A0_19
end
function communityGet()
  local L0_21, L1_22, L2_23
  L0_21 = cookieGet
  L1_22 = aclTable
  L2_23 = _UPVALUE0_
  L2_23 = L2_23.key
  L1_22 = L0_21(L1_22, L2_23)
  if L1_22 == nil then
    L2_23 = _UPVALUE1_
    L2_23 = L2_23.FAILURE
    return L2_23
  end
  L2_23 = db
  L2_23 = L2_23.getAttribute
  L2_23 = L2_23(aclTable, _UPVALUE0_.key, L1_22, _UPVALUE0_.community)
  if L2_23 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_22, L2_23
end
function communityGetNext(A0_24)
  local L1_25, L2_26, L3_27
  if A0_24 == nil then
    L1_25 = _UPVALUE0_
    L1_25 = L1_25.INVALID_ARGUMENT
    return L1_25
  end
  L1_25 = cookieGetNext
  L2_26 = aclTable
  L3_27 = _UPVALUE1_
  L3_27 = L3_27.key
  L2_26 = L1_25(L2_26, L3_27, A0_24)
  if L2_26 == nil then
    L3_27 = _UPVALUE0_
    L3_27 = L3_27.TABLE_IS_FULL
    return L3_27
  end
  L3_27 = db
  L3_27 = L3_27.getAttribute
  L3_27 = L3_27(aclTable, _UPVALUE1_.key, L2_26, _UPVALUE1_.community)
  if L3_27 == nil then
    return _UPVALUE0_.FAILURE, L2_26
  end
  return _UPVALUE0_.SUCCESS, L2_26, L3_27
end
function communitySet(A0_28, A1_29)
  if A0_28 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(aclTable, _UPVALUE1_.key, A0_28) == false then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_29 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(aclTable, _UPVALUE1_.key, A0_28, _UPVALUE1_.community, A1_29) == nil then
    return _UPVALUE0_.FAILURE, A0_28
  end
  return _UPVALUE0_.SUCCESS, A0_28
end
function accessTypeGet()
  local L0_30, L1_31, L2_32
  L0_30 = cookieGet
  L1_31 = aclTable
  L2_32 = _UPVALUE0_
  L2_32 = L2_32.key
  L1_31 = L0_30(L1_31, L2_32)
  if L1_31 == nil then
    L2_32 = _UPVALUE1_
    L2_32 = L2_32.FAILURE
    return L2_32
  end
  L2_32 = db
  L2_32 = L2_32.getAttribute
  L2_32 = L2_32(aclTable, _UPVALUE0_.key, L1_31, _UPVALUE0_.accessType)
  if L2_32 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_31, L2_32
end
function accessTypeGetNext(A0_33)
  local L1_34, L2_35, L3_36
  if A0_33 == nil then
    L1_34 = _UPVALUE0_
    L1_34 = L1_34.INVALID_ARGUMENT
    return L1_34
  end
  L1_34 = cookieGetNext
  L2_35 = aclTable
  L3_36 = _UPVALUE1_
  L3_36 = L3_36.key
  L2_35 = L1_34(L2_35, L3_36, A0_33)
  if L2_35 == nil then
    L3_36 = _UPVALUE0_
    L3_36 = L3_36.TABLE_IS_FULL
    return L3_36
  end
  L3_36 = db
  L3_36 = L3_36.getAttribute
  L3_36 = L3_36(aclTable, _UPVALUE1_.key, L2_35, _UPVALUE1_.accessType)
  if L3_36 == nil then
    return _UPVALUE0_.FAILURE, L2_35
  end
  return _UPVALUE0_.SUCCESS, L2_35, L3_36
end
function accessTypeSet(A0_37, A1_38)
  if A0_37 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(aclTable, _UPVALUE1_.key, A0_37) == false then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_38 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_38 ~= "ro" and A1_38 ~= "rw" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(aclTable, _UPVALUE1_.key, A0_37, _UPVALUE1_.accessType, A1_38) == nil then
    return _UPVALUE0_.FAILURE, A0_37
  end
  return _UPVALUE0_.SUCCESS, A0_37
end
function accessListGet()
  local L0_39, L1_40, L2_41, L3_42, L4_43, L5_44, L6_45
  L0_39 = {}
  L1_40 = cookieGet
  L2_41 = aclTable
  L3_42 = _UPVALUE0_
  L3_42 = L3_42.key
  L2_41 = L1_40(L2_41, L3_42)
  if L2_41 == nil then
    L3_42 = _UPVALUE1_
    L3_42 = L3_42.FAILURE
    return L3_42
  end
  L3_42 = db
  L3_42 = L3_42.getRow
  L4_43 = aclTable
  L5_44 = _UPVALUE0_
  L5_44 = L5_44.key
  L6_45 = L2_41
  L3_42 = L3_42(L4_43, L5_44, L6_45)
  L0_39 = L3_42
  if L0_39 == nil then
    L3_42 = _UPVALUE1_
    L3_42 = L3_42.FAILURE
    return L3_42
  end
  L3_42, L4_43, L5_44, L6_45 = nil, nil, nil, nil
  L3_42 = L0_39[aclTable .. "." .. _UPVALUE0_.ipAddress]
  L4_43 = L0_39[aclTable .. "." .. _UPVALUE0_.subnetMask]
  L5_44 = L0_39[aclTable .. "." .. _UPVALUE0_.community]
  L6_45 = L0_39[aclTable .. "." .. _UPVALUE0_.accessType]
  if L3_42 == nil or L4_43 == nil or L5_44 == nil or L6_45 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L2_41, L3_42, L4_43, L5_44, L6_45
end
function accessListGetNext(A0_46)
  local L1_47, L2_48, L3_49, L4_50, L5_51, L6_52, L7_53
  if A0_46 == nil then
    L1_47 = _UPVALUE0_
    L1_47 = L1_47.INVALID_ARGUMENT
    return L1_47
  end
  L1_47 = cookieGetNext
  L2_48 = aclTable
  L3_49 = _UPVALUE1_
  L3_49 = L3_49.key
  L4_50 = A0_46
  L2_48 = L1_47(L2_48, L3_49, L4_50)
  if L2_48 == nil then
    L3_49 = _UPVALUE0_
    L3_49 = L3_49.TABLE_IS_FULL
    return L3_49
  end
  L3_49 = {}
  L4_50 = db
  L4_50 = L4_50.getRow
  L5_51 = aclTable
  L6_52 = _UPVALUE1_
  L6_52 = L6_52.key
  L7_53 = L2_48
  L4_50 = L4_50(L5_51, L6_52, L7_53)
  L3_49 = L4_50
  if L3_49 == nil then
    L4_50 = _UPVALUE0_
    L4_50 = L4_50.FAILURE
    return L4_50
  end
  L4_50, L5_51, L6_52, L7_53 = nil, nil, nil, nil
  L4_50 = L3_49[aclTable .. "." .. _UPVALUE1_.ipAddress]
  L5_51 = L3_49[aclTable .. "." .. _UPVALUE1_.subnetMask]
  L6_52 = L3_49[aclTable .. "." .. _UPVALUE1_.community]
  L7_53 = L3_49[aclTable .. "." .. _UPVALUE1_.accessType]
  if L4_50 == nil or L5_51 == nil or L6_52 == nil or L7_53 == nil then
    return _UPVALUE0_.FAILURE, A0_46
  end
  return _UPVALUE0_.SUCCESS, L2_48, L4_50, L5_51, L6_52, L7_53
end
function accessListSet(A0_54, A1_55, A2_56, A3_57, A4_58)
  local L5_59
  if A0_54 == nil then
    L5_59 = _UPVALUE0_
    L5_59 = L5_59.INVALID_ARGUMENT
    return L5_59
  end
  if A1_55 == nil then
    L5_59 = _UPVALUE0_
    L5_59 = L5_59.INVALID_ARGUMENT
    return L5_59
  end
  L5_59 = _UPVALUE1_
  L5_59 = L5_59.ipAddressCheck
  L5_59 = L5_59("2", A1_55)
  valid = L5_59
  L5_59 = valid
  if L5_59 ~= _UPVALUE0_.SUCCESS then
    L5_59 = _UPVALUE2_
    L5_59 = L5_59.SNMP_ACL_IPADDRESS_INVALID
    return L5_59
  end
  if A2_56 == nil then
    L5_59 = _UPVALUE0_
    L5_59 = L5_59.INVALID_ARGUMENT
    return L5_59
  end
  L5_59 = _UPVALUE1_
  L5_59 = L5_59.ipAddressCheck
  L5_59 = L5_59("2", A2_56)
  valid = L5_59
  L5_59 = valid
  if L5_59 ~= _UPVALUE0_.SUCCESS then
    L5_59 = _UPVALUE2_
    L5_59 = L5_59.SNMP_ACL_SUBNETMASK_INVALID
    return L5_59
  end
  if A3_57 == nil then
    L5_59 = _UPVALUE0_
    L5_59 = L5_59.INVALID_ARGUMENT
    return L5_59
  end
  if A4_58 == nil then
    L5_59 = _UPVALUE0_
    L5_59 = L5_59.INVALID_ARGUMENT
    return L5_59
  end
  L5_59 = ACCESS_TYPE1
  if A4_58 ~= L5_59 then
    L5_59 = ACCESS_TYPE2
    if A4_58 ~= L5_59 then
      L5_59 = _UPVALUE0_
      L5_59 = L5_59.INVALID_ARGUMENT
      return L5_59
    end
  end
  L5_59 = {}
  L5_59[aclTable .. "." .. _UPVALUE3_.ipAddress] = A1_55
  L5_59[aclTable .. "." .. _UPVALUE3_.subnetMask] = A2_56
  L5_59[aclTable .. "." .. _UPVALUE3_.community] = A3_57
  L5_59[aclTable .. "." .. _UPVALUE3_.accessType] = A4_58
  if db.getAttributeWhere(aclTable, _UPVALUE3_.ipAddress .. " ='" .. A1_55 .. "' AND " .. _UPVALUE3_.subnetMask .. " ='" .. A2_56 .. "'  AND " .. _UPVALUE3_.community .. " ='" .. A3_57 .. "' AND " .. _UPVALUE3_.accessType .. " ='" .. A4_58 .. "'", _UPVALUE3_.key) ~= _UPVALUE0_.NIL and db.getAttributeWhere(aclTable, _UPVALUE3_.ipAddress .. " ='" .. A1_55 .. "' AND " .. _UPVALUE3_.subnetMask .. " ='" .. A2_56 .. "'  AND " .. _UPVALUE3_.community .. " ='" .. A3_57 .. "' AND " .. _UPVALUE3_.accessType .. " ='" .. A4_58 .. "'", _UPVALUE3_.key) ~= A0_54 then
    return _UPVALUE2_.SNMP_ACCESS_NOT_ALLOWED
  end
  if db.update(aclTable, L5_59, A0_54) == nil then
    return _UPVALUE0_.FAILURE, A0_54
  end
  return _UPVALUE0_.SUCCESS, A0_54
end
function accessListCreate(A0_60, A1_61, A2_62, A3_63)
  local L4_64, L5_65, L6_66, L7_67, L8_68
  L4_64 = db
  L4_64 = L4_64.getTable
  L5_65 = aclTable
  L6_66 = false
  L4_64 = L4_64(L5_65, L6_66)
  L5_65 = nil
  L6_66 = PRODUCT_ID
  if L6_66 ~= "DSR-1000AC_Ax" then
    L6_66 = PRODUCT_ID
    if L6_66 ~= "DSR-500AC_Ax" then
      L6_66 = PRODUCT_ID
      if L6_66 ~= "DSR-1000_Bx" then
        L6_66 = PRODUCT_ID
        if L6_66 ~= "DSR-500_Bx" then
          L6_66 = PRODUCT_ID
          if L6_66 ~= "DSR-1000_Ax" then
            L6_66 = PRODUCT_ID
          end
        end
      end
    end
  else
    if L6_66 == "DSR-1000N_Ax" then
      L5_65 = 32
  end
  else
    L6_66 = UNIT_NAME
    if L6_66 ~= "DSR-500" then
      L6_66 = UNIT_NAME
    else
      if L6_66 == "DSR-500N" then
        L5_65 = 16
    end
    else
      L5_65 = 8
    end
  end
  if L4_64 ~= nil then
    L6_66 = #L4_64
    L7_67 = L5_65 - 1
    if L6_66 > L7_67 then
      L6_66 = _UPVALUE0_
      L6_66 = L6_66.MAX_LIMIT_REACHED
      return L6_66
    end
  end
  if A0_60 == nil then
    L6_66 = _UPVALUE0_
    L6_66 = L6_66.INVALID_ARGUMENT
    return L6_66
  end
  L6_66 = _UPVALUE1_
  L6_66 = L6_66.ipAddressCheck
  L7_67 = "2"
  L8_68 = A0_60
  L6_66 = L6_66(L7_67, L8_68)
  valid = L6_66
  L6_66 = valid
  L7_67 = _UPVALUE0_
  L7_67 = L7_67.SUCCESS
  if L6_66 ~= L7_67 then
    L6_66 = _UPVALUE2_
    L6_66 = L6_66.SNMP_ACL_IPADDRESS_INVALID
    return L6_66
  end
  if A1_61 == nil then
    L6_66 = _UPVALUE0_
    L6_66 = L6_66.INVALID_ARGUMENT
    return L6_66
  end
  L6_66 = _UPVALUE1_
  L6_66 = L6_66.ipAddressCheck
  L7_67 = "2"
  L8_68 = A1_61
  L6_66 = L6_66(L7_67, L8_68)
  valid = L6_66
  L6_66 = valid
  L7_67 = _UPVALUE0_
  L7_67 = L7_67.SUCCESS
  if L6_66 ~= L7_67 then
    L6_66 = _UPVALUE2_
    L6_66 = L6_66.SNMP_ACL_SUBNETMASK_INVALID
    return L6_66
  end
  if A2_62 == nil then
    L6_66 = _UPVALUE0_
    L6_66 = L6_66.INVALID_ARGUMENT
    return L6_66
  end
  if A3_63 == nil then
    L6_66 = _UPVALUE0_
    L6_66 = L6_66.INVALID_ARGUMENT
    return L6_66
  end
  L6_66 = ACCESS_TYPE1
  if A3_63 ~= L6_66 then
    L6_66 = ACCESS_TYPE2
    if A3_63 ~= L6_66 then
      L6_66 = _UPVALUE0_
      L6_66 = L6_66.INVALID_ARGUMENT
      return L6_66
    end
  end
  L6_66 = {}
  L7_67 = aclTable
  L8_68 = "."
  L7_67 = L7_67 .. L8_68 .. _UPVALUE3_.ipAddress
  L6_66[L7_67] = A0_60
  L7_67 = aclTable
  L8_68 = "."
  L7_67 = L7_67 .. L8_68 .. _UPVALUE3_.subnetMask
  L6_66[L7_67] = A1_61
  L7_67 = aclTable
  L8_68 = "."
  L7_67 = L7_67 .. L8_68 .. _UPVALUE3_.community
  L6_66[L7_67] = A2_62
  L7_67 = aclTable
  L8_68 = "."
  L7_67 = L7_67 .. L8_68 .. _UPVALUE3_.accessType
  L6_66[L7_67] = A3_63
  L7_67 = db
  L7_67 = L7_67.existsRowWhere
  L8_68 = aclTable
  L7_67 = L7_67(L8_68, _UPVALUE3_.ipAddress .. " ='" .. A0_60 .. "' AND " .. _UPVALUE3_.subnetMask .. " ='" .. A1_61 .. "' AND " .. _UPVALUE3_.community .. " ='" .. A2_62 .. "' AND " .. _UPVALUE3_.accessType .. " ='" .. A3_63 .. "'")
  if L7_67 then
    L7_67 = _UPVALUE2_
    L7_67 = L7_67.SNMP_ACCESS_NOT_ALLOWED
    return L7_67
  end
  L7_67 = db
  L7_67 = L7_67.insert
  L8_68 = aclTable
  L7_67 = L7_67(L8_68, L6_66)
  if L7_67 == nil then
    L8_68 = _UPVALUE0_
    L8_68 = L8_68.FAILURE
    return L8_68
  end
  L8_68 = db
  L8_68 = L8_68.getAttributeWhere
  L8_68 = L8_68(aclTable, _UPVALUE3_.ipAddress .. " ='" .. A0_60 .. "' AND " .. _UPVALUE3_.subnetMask .. " ='" .. A1_61 .. "' AND " .. _UPVALUE3_.community .. " ='" .. A2_62 .. "'", _UPVALUE3_.key)
  return _UPVALUE0_.SUCCESS, L8_68
end
function accessListDelete(A0_69)
  if A0_69 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(aclTable, _UPVALUE1_.key, A0_69) == false then
    return _UPVALUE0_.FAILURE
  end
  if db.deleteRow(aclTable, _UPVALUE1_.key, A0_69) == nil then
    return _UPVALUE0_.FAILURE, A0_69
  end
  return _UPVALUE0_.SUCCESS, A0_69
end
function accessListDeleteAll()
  if db.deleteAllRows(aclTable) == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function accessListGetAll()
  local L0_70
  L0_70 = {}
  L0_70 = db.getTable(aclTable, false)
  if L0_70 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_70
end
function accessListGetCur(A0_71)
  local L1_72, L2_73, L3_74, L4_75, L5_76
  if A0_71 == nil then
    L1_72 = _UPVALUE0_
    L1_72 = L1_72.FAILURE
    return L1_72
  end
  L1_72 = {}
  L2_73 = db
  L2_73 = L2_73.getRow
  L3_74 = aclTable
  L4_75 = _UPVALUE1_
  L4_75 = L4_75.key
  L5_76 = A0_71
  L2_73 = L2_73(L3_74, L4_75, L5_76)
  L1_72 = L2_73
  if L1_72 == nil then
    L2_73 = _UPVALUE0_
    L2_73 = L2_73.FAILURE
    return L2_73
  end
  L2_73, L3_74, L4_75, L5_76 = nil, nil, nil, nil
  L2_73 = L1_72[aclTable .. "." .. _UPVALUE1_.ipAddress]
  L3_74 = L1_72[aclTable .. "." .. _UPVALUE1_.subnetMask]
  L4_75 = L1_72[aclTable .. "." .. _UPVALUE1_.community]
  L5_76 = L1_72[aclTable .. "." .. _UPVALUE1_.accessType]
  if L2_73 == nil or L3_74 == nil or L4_75 == nil or L5_76 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_71, L2_73, L3_74, L4_75, L5_76
end
