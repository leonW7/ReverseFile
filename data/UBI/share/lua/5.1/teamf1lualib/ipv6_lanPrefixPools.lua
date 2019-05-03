local L0_0
L0_0 = module
L0_0("com.teamf1.core.ipv6.lanPrefixPools", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/ipv6_mode")
L0_0 = require
L0_0("teamf1lualib/returnCodes_ipv6_nimf")
L0_0 = require
L0_0("teamf1lualib/returnCodes_dhcpv6")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
lanprefixpoolsTable = "dhcpv6sLANPrefixPool"
;({}).prefix = "delegationPrefix"
;({}).prefixLength = "delegationPrefixLen"
;({}).ipv6Mode = "netWorkMode"
;({}).interfaceName = "interfaceName"
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
elseif PRODUCT_ID == "DSR-500_Ax" or PRODUCT_ID == "DSR-500N_Ax" then
elseif UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-250N" then
else
end
function prefixGet()
  local L0_1, L1_2
  L0_1 = db
  L0_1 = L0_1.getNextRowId
  L1_2 = 0
  L0_1 = L0_1(L1_2, lanprefixpoolsTable)
  if L0_1 == nil then
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.FAILURE
    return L1_2, L0_1
  end
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(lanprefixpoolsTable, "_ROWID_", L0_1, _UPVALUE1_.prefix)
  if L1_2 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_1, L1_2
end
function prefixGetNext(A0_3)
  local L1_4, L2_5
  L1_4 = db
  L1_4 = L1_4.getNextRowId
  L2_5 = A0_3
  L1_4 = L1_4(L2_5, lanprefixpoolsTable)
  if L1_4 == nil then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.FAILURE
    return L2_5, L1_4
  end
  L2_5 = db
  L2_5 = L2_5.getAttribute
  L2_5 = L2_5(lanprefixpoolsTable, "_ROWID_", L1_4, _UPVALUE1_.prefix)
  if L2_5 == nil then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L2_5
end
function prefixSet(A0_6, A1_7)
  local L2_8, L3_9, L4_10, L5_11
  L2_8 = _UPVALUE0_
  L2_8 = L2_8.ipv6ModeGet
  L4_10 = L2_8()
  L5_11 = tonumber
  L5_11 = L5_11(L4_10)
  if L5_11 ~= 3 then
    L5_11 = _UPVALUE1_
    L5_11 = L5_11.NOT_SUPPORTED
    return L5_11
  end
  L5_11 = nil
  if A0_6 == nil or tonumber(A0_6) == nil then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if A1_7 == nil then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  L5_11 = _UPVALUE2_.ipAddressCheck(10, A1_7)
  if L5_11 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttribute(lanprefixpoolsTable, "_ROWID_", A0_6, _UPVALUE3_.prefix, A1_7) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_6
  end
  return _UPVALUE1_.SUCCESS, A0_6
end
function prefixDelete(A0_12, A1_13)
  return _UPVALUE0_.NOT_SUPPORTED
end
function prefixLengthGet()
  local L0_14, L1_15
  L0_14 = db
  L0_14 = L0_14.getNextRowId
  L1_15 = 0
  L0_14 = L0_14(L1_15, lanprefixpoolsTable)
  if L0_14 == nil then
    L1_15 = _UPVALUE0_
    L1_15 = L1_15.FAILURE
    return L1_15, L0_14
  end
  L1_15 = db
  L1_15 = L1_15.getAttribute
  L1_15 = L1_15(lanprefixpoolsTable, "_ROWID_", L0_14, _UPVALUE1_.prefixLength)
  if L1_15 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_14, L1_15
end
function prefixLengthGetNext(A0_16)
  local L1_17, L2_18
  L1_17 = db
  L1_17 = L1_17.getNextRowId
  L2_18 = A0_16
  L1_17 = L1_17(L2_18, lanprefixpoolsTable)
  if L1_17 == nil then
    L2_18 = _UPVALUE0_
    L2_18 = L2_18.FAILURE
    return L2_18, L1_17
  end
  L2_18 = db
  L2_18 = L2_18.getAttribute
  L2_18 = L2_18(lanprefixpoolsTable, "_ROWID_", L1_17, _UPVALUE1_.prefixLength)
  if L2_18 == nil then
    return _UPVALUE0_.FAILURE, L1_17
  end
  return _UPVALUE0_.SUCCESS, L1_17, L2_18
end
function prefixLengthSet(A0_19, A1_20)
  local L2_21, L3_22, L4_23
  L2_21 = _UPVALUE0_
  L2_21 = L2_21.ipv6ModeGet
  L4_23 = L2_21()
  if tonumber(L4_23) ~= 3 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if A0_19 == nil or tonumber(A0_19) == nil then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if A1_20 == nil then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if tonumber(A1_20) < 1 or tonumber(A1_20) > 128 then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttribute(lanprefixpoolsTable, "_ROWID_", A0_19, _UPVALUE2_.prefixLength, A1_20) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_19
  end
  return _UPVALUE1_.SUCCESS, A0_19
end
function prefixPoolGet()
  local L0_24, L1_25, L2_26, L3_27
  L0_24 = db
  L0_24 = L0_24.getNextRowId
  L1_25 = 0
  L2_26 = lanprefixpoolsTable
  L0_24 = L0_24(L1_25, L2_26)
  if L0_24 == nil then
    L1_25 = _UPVALUE0_
    L1_25 = L1_25.FAILURE
    L2_26 = L0_24
    return L1_25, L2_26
  end
  L1_25 = db
  L1_25 = L1_25.getRow
  L2_26 = lanprefixpoolsTable
  L3_27 = "_ROWID_"
  L1_25 = L1_25(L2_26, L3_27, L0_24)
  if L1_25 == nil then
    L2_26 = _UPVALUE0_
    L2_26 = L2_26.FAILURE
    L3_27 = L0_24
    return L2_26, L3_27
  end
  L2_26, L3_27 = nil, nil
  L2_26 = L1_25[lanprefixpoolsTable .. "." .. _UPVALUE1_.prefix]
  L3_27 = L1_25[lanprefixpoolsTable .. "." .. _UPVALUE1_.prefixLength]
  return _UPVALUE0_.SUCCESS, L0_24, L2_26, L3_27
end
function prefixPoolGetNext(A0_28)
  local L1_29, L2_30, L3_31, L4_32
  L1_29 = db
  L1_29 = L1_29.getNextRowId
  L2_30 = A0_28
  L3_31 = lanprefixpoolsTable
  L1_29 = L1_29(L2_30, L3_31)
  if L1_29 == nil then
    L2_30 = _UPVALUE0_
    L2_30 = L2_30.FAILURE
    L3_31 = L1_29
    return L2_30, L3_31
  end
  L2_30 = db
  L2_30 = L2_30.getRow
  L3_31 = lanprefixpoolsTable
  L4_32 = "_ROWID_"
  L2_30 = L2_30(L3_31, L4_32, L1_29)
  if L2_30 == nil then
    L3_31 = _UPVALUE0_
    L3_31 = L3_31.FAILURE
    L4_32 = L1_29
    return L3_31, L4_32
  end
  L3_31, L4_32 = nil, nil
  L3_31 = L2_30[lanprefixpoolsTable .. "." .. _UPVALUE1_.prefix]
  L4_32 = L2_30[lanprefixpoolsTable .. "." .. _UPVALUE1_.prefixLength]
  return _UPVALUE0_.SUCCESS, L1_29, L3_31, L4_32
end
function prefixPoolGetCur(A0_33)
  local L1_34, L2_35, L3_36, L4_37
  L1_34 = db
  L1_34 = L1_34.getRow
  L2_35 = lanprefixpoolsTable
  L3_36 = "_ROWID_"
  L4_37 = A0_33
  L1_34 = L1_34(L2_35, L3_36, L4_37)
  if L1_34 == nil then
    L2_35 = _UPVALUE0_
    L2_35 = L2_35.FAILURE
    return L2_35
  end
  L2_35, L3_36, L4_37 = nil, nil, nil
  L2_35 = L1_34[lanprefixpoolsTable .. "." .. _UPVALUE1_.prefix]
  L3_36 = L1_34[lanprefixpoolsTable .. "." .. _UPVALUE1_.prefixLength]
  L4_37 = L1_34[lanprefixpoolsTable .. "." .. _UPVALUE1_.interfaceName]
  return _UPVALUE0_.SUCCESS, A0_33, L2_35, L3_36, L4_37
end
function prefixPoolSet(A0_38, A1_39, A2_40, A3_41)
  local L4_42, L5_43, L6_44, L7_45, L8_46, L9_47
  L4_42 = _UPVALUE0_
  L4_42 = L4_42.ipv6ModeGet
  L6_44 = L4_42()
  L7_45 = tonumber
  L8_46 = L6_44
  L7_45 = L7_45(L8_46)
  if L7_45 ~= 3 then
    L7_45 = _UPVALUE1_
    L7_45 = L7_45.IPV6MODE_NOT_ENABLED
    return L7_45
  end
  L7_45 = nil
  if A0_38 ~= nil then
    L8_46 = tonumber
    L9_47 = A0_38
    L8_46 = L8_46(L9_47)
  elseif L8_46 == nil then
    L8_46 = _UPVALUE2_
    L8_46 = L8_46.INVALID_ARGUMENT
    return L8_46
  end
  if A1_39 == nil then
    L8_46 = _UPVALUE3_
    L8_46 = L8_46.PREFIXPOOL_PREFIX_NIL
    return L8_46
  end
  L8_46 = _UPVALUE4_
  L8_46 = L8_46.ipAddressCheck
  L9_47 = 10
  L8_46 = L8_46(L9_47, A1_39)
  L7_45 = L8_46
  L8_46 = _UPVALUE2_
  L8_46 = L8_46.SUCCESS
  if L7_45 ~= L8_46 then
    L8_46 = _UPVALUE3_
    L8_46 = L8_46.INVALID_PREFIXPOOL_PREFIX
    return L8_46
  end
  if A2_40 == nil then
    L8_46 = _UPVALUE3_
    L8_46 = L8_46.PREFIXPOOL_PREFIXLENGTH_NIL
    return L8_46
  end
  L8_46 = tonumber
  L9_47 = A2_40
  L8_46 = L8_46(L9_47)
  if L8_46 < 1 or L8_46 > 128 then
    L9_47 = _UPVALUE3_
    L9_47 = L9_47.INVALID_PREFIXPOOL_PREFIXLENGTH
    return L9_47
  end
  L9_47 = db
  L9_47 = L9_47.existsRow
  L9_47 = L9_47("dhcpv6sLANPrefixPool", "delegationPrefix", A1_39)
  if L9_47 then
    L9_47 = _UPVALUE2_
    L9_47 = L9_47.LAN_VLAN_IPV6_PREFIXDELEGATION_ALREADY_CONFIGURED
    return L9_47
  end
  L9_47 = {}
  L9_47[lanprefixpoolsTable .. "." .. _UPVALUE5_.prefix] = A1_39
  L9_47[lanprefixpoolsTable .. "." .. _UPVALUE5_.prefixLength] = A2_40
  L9_47[lanprefixpoolsTable .. "." .. _UPVALUE5_.interfaceName] = A3_41
  if db.update(lanprefixpoolsTable, L9_47, A0_38) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_38
  end
  return _UPVALUE2_.SUCCESS, A0_38
end
function prefixPoolCreate(A0_48, A1_49, A2_50)
  local L3_51, L4_52, L5_53, L6_54, L7_55, L8_56, L9_57, L10_58, L11_59, L12_60
  L3_51 = _UPVALUE0_
  L3_51 = L3_51.ipv6ModeGet
  L5_53 = L3_51()
  L6_54 = tonumber
  L7_55 = L5_53
  L6_54 = L6_54(L7_55)
  if L6_54 ~= 3 then
    L6_54 = _UPVALUE1_
    L6_54 = L6_54.IPV6MODE_NOT_ENABLED
    return L6_54
  end
  L6_54 = nil
  if A0_48 == nil then
    L7_55 = _UPVALUE2_
    L7_55 = L7_55.PREFIXPOOL_PREFIX_NIL
    return L7_55
  end
  L7_55 = _UPVALUE3_
  L7_55 = L7_55.ipAddressCheck
  L8_56 = 10
  L9_57 = A0_48
  L7_55 = L7_55(L8_56, L9_57)
  L6_54 = L7_55
  L7_55 = _UPVALUE4_
  L7_55 = L7_55.SUCCESS
  if L6_54 ~= L7_55 then
    L7_55 = _UPVALUE2_
    L7_55 = L7_55.INVALID_PREFIXPOOL_PREFIX
    return L7_55
  end
  if A1_49 == nil then
    L7_55 = _UPVALUE2_
    L7_55 = L7_55.PREFIXPOOL_PREFIXLENGTH_NIL
    return L7_55
  end
  L7_55 = tonumber
  L8_56 = A1_49
  L7_55 = L7_55(L8_56)
  if L7_55 < 1 or L7_55 > 128 then
    L8_56 = _UPVALUE2_
    L8_56 = L8_56.INVALID_PREFIXPOOL_PREFIXLENGTH
    return L8_56
  end
  L8_56 = db
  L8_56 = L8_56.existsRow
  L9_57 = "dhcpv6sLANPrefixPool"
  L10_58 = "delegationPrefix"
  L11_59 = A0_48
  L8_56 = L8_56(L9_57, L10_58, L11_59)
  if L8_56 then
    L8_56 = _UPVALUE4_
    L8_56 = L8_56.LAN_VLAN_IPV6_PREFIXDELEGATION_ALREADY_CONFIGURED
    return L8_56
  end
  L8_56 = {}
  L9_57 = lanprefixpoolsTable
  L10_58 = "."
  L11_59 = _UPVALUE5_
  L11_59 = L11_59.prefix
  L9_57 = L9_57 .. L10_58 .. L11_59
  L8_56[L9_57] = A0_48
  L9_57 = lanprefixpoolsTable
  L10_58 = "."
  L11_59 = _UPVALUE5_
  L11_59 = L11_59.prefixLength
  L9_57 = L9_57 .. L10_58 .. L11_59
  L8_56[L9_57] = A1_49
  L9_57 = lanprefixpoolsTable
  L10_58 = "."
  L11_59 = _UPVALUE5_
  L11_59 = L11_59.interfaceName
  L9_57 = L9_57 .. L10_58 .. L11_59
  L8_56[L9_57] = A2_50
  L9_57 = db
  L9_57 = L9_57.getTable
  L10_58 = lanprefixpoolsTable
  L9_57 = L9_57(L10_58)
  if L9_57 ~= nil then
    L10_58 = #L9_57
    L11_59 = _UPVALUE6_
    if L10_58 >= L11_59 then
      L10_58 = _UPVALUE4_
      L10_58 = L10_58.MAX_LIMIT_REACHED
      return L10_58
    end
  end
  L10_58 = db
  L10_58 = L10_58.insert
  L11_59 = lanprefixpoolsTable
  L12_60 = L8_56
  L11_59 = L10_58(L11_59, L12_60)
  L12_60 = _UPVALUE4_
  L12_60 = L12_60.NIL
  if L11_59 == L12_60 then
    L12_60 = _UPVALUE4_
    L12_60 = L12_60.FAILURE
    return L12_60
  end
  L12_60 = db
  L12_60 = L12_60.getAttribute
  L12_60 = L12_60(lanprefixpoolsTable, _UPVALUE5_.prefix, A0_48, "_ROWID_")
  return _UPVALUE4_.SUCCESS, L12_60
end
function prefixPoolDelete(A0_61)
  local L1_62, L2_63, L3_64, L4_65
  L1_62 = _UPVALUE0_
  L1_62 = L1_62.ipv6ModeGet
  L3_64 = L1_62()
  L4_65 = tonumber
  L4_65 = L4_65(L3_64)
  if L4_65 ~= 3 then
    L4_65 = _UPVALUE1_
    L4_65 = L4_65.IPV6MODE_NOT_ENABLED
    return L4_65
  end
  if A0_61 ~= nil then
    L4_65 = tonumber
    L4_65 = L4_65(A0_61)
  elseif L4_65 == nil then
    L4_65 = _UPVALUE2_
    L4_65 = L4_65.INVALID_ARGUMENT
    return L4_65
  end
  L4_65 = "_ROWID_ = "
  L4_65 = L4_65 .. A0_61
  if db.deleteRowWhere(lanprefixpoolsTable, L4_65) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_61
  end
  return _UPVALUE2_.SUCCESS, A0_61
end
function dhcpPrefixPoolGetAll()
  local L0_66
  L0_66 = db
  L0_66 = L0_66.getTable
  L0_66 = L0_66(lanprefixpoolsTable, false)
  if L0_66 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_66
end
function dhcpPrefixPoolDeleteAll()
  if db.deleteAllRows(lanprefixpoolsTable) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
