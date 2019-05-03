local L0_0
L0_0 = module
L0_0("com.teamf1.core.ipv6.lanAddressPools", package.seeall)
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
L0_0 = "dhcpv6sLANAddrPool"
lanaddresspoolsTable = L0_0
L0_0 = "networkInterface"
networkInterfaceTable = L0_0
L0_0 = {}
L0_0.startIpAddress = "startAddress"
L0_0.endIpAddress = "endAddress"
L0_0.prefixLength = "prefixLength"
L0_0.logicalIfName = "LogicalIfName"
L0_0.interfaceName = "interfaceName"
L0_0.ipv6Mode = "netWorkMode"
function startIpAddressGet()
  local L0_1, L1_2, L2_3
  L1_2 = db
  L1_2 = L1_2.getNextRowId
  L2_3 = 0
  L1_2 = L1_2(L2_3, lanaddresspoolsTable)
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.NIL
  if L1_2 == L2_3 then
    L2_3 = _UPVALUE0_
    L2_3 = L2_3.FAILURE
    return L2_3
  end
  L2_3 = db
  L2_3 = L2_3.getAttribute
  L2_3 = L2_3(lanaddresspoolsTable, "_ROWID_", L1_2, _UPVALUE1_.startIpAddress)
  if L2_3 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_2, L2_3
end
function startIpAddressGetNext(A0_4)
  local L1_5, L2_6
  L1_5 = _UPVALUE0_
  L1_5 = L1_5.NIL
  if A0_4 ~= L1_5 then
    L1_5 = tonumber
    L2_6 = A0_4
    L1_5 = L1_5(L2_6)
    L2_6 = _UPVALUE0_
    L2_6 = L2_6.NIL
  elseif L1_5 == L2_6 then
    L1_5 = INAVLID_ARGUMENT
    return L1_5
  end
  L1_5 = db
  L1_5 = L1_5.getNextRowId
  L2_6 = A0_4
  L1_5 = L1_5(L2_6, lanaddresspoolsTable)
  L2_6 = _UPVALUE0_
  L2_6 = L2_6.NIL
  if L1_5 == L2_6 then
    L2_6 = _UPVALUE0_
    L2_6 = L2_6.FAILURE
    return L2_6
  end
  L2_6 = db
  L2_6 = L2_6.getAttribute
  L2_6 = L2_6(lanaddresspoolsTable, "_ROWID_", L1_5, _UPVALUE1_.startIpAddress)
  if L2_6 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_5
  end
  return _UPVALUE0_.SUCCESS, L1_5, L2_6
end
function startIpAddressSet(A0_7, A1_8)
  local L2_9, L3_10, L4_11, L5_12
  L2_9 = _UPVALUE0_
  L2_9 = L2_9.ipv6ModeGet
  L4_11 = L2_9()
  L5_12 = tonumber
  L5_12 = L5_12(L4_11)
  if L5_12 ~= 3 then
    L5_12 = _UPVALUE1_
    L5_12 = L5_12.NOT_SUPPORTED
    return L5_12
  end
  L5_12 = nil
  if A1_8 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  L5_12 = _UPVALUE2_.ipAddressCheck(10, A1_8)
  if L5_12 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttribute(lanaddresspoolsTable, "_ROWID_", A0_7, _UPVALUE3_.startIpAddress, A1_8) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_7
  end
  return _UPVALUE1_.SUCCESS, A0_7
end
function endIpAddressGet()
  local L0_13, L1_14
  L0_13 = db
  L0_13 = L0_13.getNextRowId
  L1_14 = 0
  L0_13 = L0_13(L1_14, lanaddresspoolsTable)
  L1_14 = _UPVALUE0_
  L1_14 = L1_14.NIL
  if L0_13 == L1_14 then
    L1_14 = _UPVALUE0_
    L1_14 = L1_14.FAILURE
    return L1_14
  end
  L1_14 = db
  L1_14 = L1_14.getAttribute
  L1_14 = L1_14(lanaddresspoolsTable, "_ROWID_", L0_13, _UPVALUE1_.endIpAddress)
  if L1_14 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_13, L1_14
end
function endIpAddressGetNext(A0_15)
  local L1_16, L2_17
  L1_16 = _UPVALUE0_
  L1_16 = L1_16.NIL
  if A0_15 ~= L1_16 then
    L1_16 = tonumber
    L2_17 = A0_15
    L1_16 = L1_16(L2_17)
    L2_17 = _UPVALUE0_
    L2_17 = L2_17.NIL
  elseif L1_16 == L2_17 then
    L1_16 = _UPVALUE0_
    L1_16 = L1_16.INVALID_ARGUMENT
    return L1_16
  end
  L1_16 = db
  L1_16 = L1_16.getNextRowId
  L2_17 = A0_15
  L1_16 = L1_16(L2_17, lanaddresspoolsTable)
  L2_17 = _UPVALUE0_
  L2_17 = L2_17.NIL
  if L1_16 == L2_17 then
    L2_17 = _UPVALUE0_
    L2_17 = L2_17.FAILURE
    return L2_17
  end
  L2_17 = db
  L2_17 = L2_17.getAttribute
  L2_17 = L2_17(lanaddresspoolsTable, "_ROWID_", L1_16, _UPVALUE1_.endIpAddress)
  if L2_17 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_16
  end
  return _UPVALUE0_.SUCCESS, L1_16, L2_17
end
function endIpAddressSet(A0_18, A1_19)
  local L2_20, L3_21, L4_22, L5_23
  L2_20 = _UPVALUE0_
  L2_20 = L2_20.ipv6ModeGet
  L4_22 = L2_20()
  L5_23 = tonumber
  L5_23 = L5_23(L4_22)
  if L5_23 ~= 3 then
    L5_23 = _UPVALUE1_
    L5_23 = L5_23.NOT_SUPPORTED
    return L5_23
  end
  L5_23 = nil
  if A0_18 == _UPVALUE1_.NIL or tonumber(A0_18) == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if A1_19 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  L5_23 = _UPVALUE2_.ipAddressCheck(10, A1_19)
  if L5_23 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttribute(lanaddresspoolsTable, "_ROWID_", A0_18, _UPVALUE3_.endIpAddress, A1_19) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_18
  end
  return _UPVALUE1_.SUCCESS, A0_18
end
function prefixLengthGet()
  local L0_24, L1_25
  L0_24 = db
  L0_24 = L0_24.getNextRowId
  L1_25 = 0
  L0_24 = L0_24(L1_25, lanaddresspoolsTable)
  L1_25 = _UPVALUE0_
  L1_25 = L1_25.NIL
  if L0_24 == L1_25 then
    L1_25 = _UPVALUE0_
    L1_25 = L1_25.FAILURE
    return L1_25
  end
  L1_25 = db
  L1_25 = L1_25.getAttribute
  L1_25 = L1_25(lanaddresspoolsTable, "_ROWID_", L0_24, _UPVALUE1_.prefixLength)
  if L1_25 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L1_25
end
function prefixLengthGetNext(A0_26)
  local L1_27, L2_28
  L1_27 = _UPVALUE0_
  L1_27 = L1_27.NIL
  if A0_26 ~= L1_27 then
    L1_27 = tonumber
    L2_28 = A0_26
    L1_27 = L1_27(L2_28)
    L2_28 = _UPVALUE0_
    L2_28 = L2_28.NIL
  elseif L1_27 == L2_28 then
    L1_27 = _UPVALUE0_
    L1_27 = L1_27.INVALID_ARGUMENT
    return L1_27
  end
  L1_27 = db
  L1_27 = L1_27.getNextRowId
  L2_28 = A0_26
  L1_27 = L1_27(L2_28, lanaddresspoolsTable)
  L2_28 = _UPVALUE0_
  L2_28 = L2_28.NIL
  if L1_27 == L2_28 then
    L2_28 = _UPVALUE0_
    L2_28 = L2_28.FAILURE
    return L2_28
  end
  L2_28 = db
  L2_28 = L2_28.getAttribute
  L2_28 = L2_28(lanaddresspoolsTable, "_ROWID_", L1_27, _UPVALUE1_.prefixLength)
  if L2_28 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_27
  end
  return _UPVALUE0_.SUCCESS, L1_27, L2_28
end
function prefixLengthSet(A0_29, A1_30)
  local L2_31, L3_32, L4_33
  L2_31 = _UPVALUE0_
  L2_31 = L2_31.ipv6ModeGet
  L4_33 = L2_31()
  if tonumber(L4_33) ~= 3 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if A0_29 == _UPVALUE1_.NIL or tonumber(A0_29) == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if A1_30 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if tonumber(A1_30) < 1 or tonumber(A1_30) > 128 then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttribute(lanaddresspoolsTable, "_ROWID_", A0_29, _UPVALUE2_.prefixLength, A1_30) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_29
  end
  return _UPVALUE1_.SUCCESS, A0_29
end
function addressPoolGet()
  local L0_34, L1_35, L2_36, L3_37, L4_38
  L0_34 = db
  L0_34 = L0_34.getNextRowId
  L1_35 = 0
  L2_36 = lanaddresspoolsTable
  L0_34 = L0_34(L1_35, L2_36)
  L1_35 = _UPVALUE0_
  L1_35 = L1_35.NIL
  if L0_34 == L1_35 then
    L1_35 = _UPVALUE0_
    L1_35 = L1_35.FAILURE
    return L1_35
  end
  L1_35 = db
  L1_35 = L1_35.getRow
  L2_36 = lanaddresspoolsTable
  L3_37 = "_ROWID_"
  L4_38 = L0_34
  L1_35 = L1_35(L2_36, L3_37, L4_38)
  L2_36 = NIl
  if L1_35 == L2_36 then
    L2_36 = _UPVALUE0_
    L2_36 = L2_36.FAILURE
    return L2_36
  end
  L2_36 = lanaddresspoolsTable
  L3_37 = "."
  L4_38 = _UPVALUE1_
  L4_38 = L4_38.startIpAddress
  L2_36 = L2_36 .. L3_37 .. L4_38
  L2_36 = L1_35[L2_36]
  L3_37 = lanaddresspoolsTable
  L4_38 = "."
  L3_37 = L3_37 .. L4_38 .. _UPVALUE1_.endIpAddress
  L3_37 = L1_35[L3_37]
  L4_38 = lanaddresspoolsTable
  L4_38 = L4_38 .. "." .. _UPVALUE1_.prefixLength
  L4_38 = L1_35[L4_38]
  return _UPVALUE0_.SUCCESS, L0_34, L2_36, L3_37, L4_38
end
function addressPoolGetNext(A0_39)
  local L1_40, L2_41, L3_42, L4_43, L5_44
  L1_40 = _UPVALUE0_
  L1_40 = L1_40.NIL
  if A0_39 ~= L1_40 then
    L1_40 = tonumber
    L2_41 = A0_39
    L1_40 = L1_40(L2_41)
    L2_41 = _UPVALUE0_
    L2_41 = L2_41.NIL
  elseif L1_40 == L2_41 then
    L1_40 = _UPVALUE0_
    L1_40 = L1_40.INVALID_ARGUMENT
    return L1_40
  end
  L1_40 = db
  L1_40 = L1_40.getNextRowId
  L2_41 = A0_39
  L3_42 = lanaddresspoolsTable
  L1_40 = L1_40(L2_41, L3_42)
  L2_41 = _UPVALUE0_
  L2_41 = L2_41.NIL
  if L1_40 == L2_41 then
    L2_41 = _UPVALUE0_
    L2_41 = L2_41.FAILURE
    return L2_41
  end
  L2_41 = db
  L2_41 = L2_41.getRow
  L3_42 = lanaddresspoolsTable
  L4_43 = "_ROWID_"
  L5_44 = L1_40
  L2_41 = L2_41(L3_42, L4_43, L5_44)
  L3_42 = NIl
  if L2_41 == L3_42 then
    L3_42 = _UPVALUE0_
    L3_42 = L3_42.FAILURE
    return L3_42
  end
  L3_42 = lanaddresspoolsTable
  L4_43 = "."
  L5_44 = _UPVALUE1_
  L5_44 = L5_44.startIpAddress
  L3_42 = L3_42 .. L4_43 .. L5_44
  L3_42 = L2_41[L3_42]
  L4_43 = lanaddresspoolsTable
  L5_44 = "."
  L4_43 = L4_43 .. L5_44 .. _UPVALUE1_.endIpAddress
  L4_43 = L2_41[L4_43]
  L5_44 = lanaddresspoolsTable
  L5_44 = L5_44 .. "." .. _UPVALUE1_.prefixLength
  L5_44 = L2_41[L5_44]
  return _UPVALUE0_.SUCCESS, L1_40, L3_42, L4_43, L5_44
end
function addressPoolGetCur(A0_45)
  local L1_46, L2_47, L3_48, L4_49, L5_50
  L1_46 = _UPVALUE0_
  L1_46 = L1_46.NIL
  if A0_45 ~= L1_46 then
    L1_46 = tonumber
    L2_47 = A0_45
    L1_46 = L1_46(L2_47)
    L2_47 = _UPVALUE0_
    L2_47 = L2_47.NIL
  elseif L1_46 == L2_47 then
    L1_46 = _UPVALUE0_
    L1_46 = L1_46.INVALID_ARGUMENT
    return L1_46
  end
  L1_46 = db
  L1_46 = L1_46.getRow
  L2_47 = lanaddresspoolsTable
  L3_48 = "_ROWID_"
  L4_49 = A0_45
  L1_46 = L1_46(L2_47, L3_48, L4_49)
  L2_47 = NIl
  if L1_46 == L2_47 then
    L2_47 = _UPVALUE0_
    L2_47 = L2_47.FAILURE
    return L2_47
  end
  L2_47 = lanaddresspoolsTable
  L3_48 = "."
  L4_49 = _UPVALUE1_
  L4_49 = L4_49.startIpAddress
  L2_47 = L2_47 .. L3_48 .. L4_49
  L2_47 = L1_46[L2_47]
  L3_48 = lanaddresspoolsTable
  L4_49 = "."
  L5_50 = _UPVALUE1_
  L5_50 = L5_50.endIpAddress
  L3_48 = L3_48 .. L4_49 .. L5_50
  L3_48 = L1_46[L3_48]
  L4_49 = lanaddresspoolsTable
  L5_50 = "."
  L4_49 = L4_49 .. L5_50 .. _UPVALUE1_.prefixLength
  L4_49 = L1_46[L4_49]
  L5_50 = lanaddresspoolsTable
  L5_50 = L5_50 .. "." .. _UPVALUE1_.interfaceName
  L5_50 = L1_46[L5_50]
  return _UPVALUE0_.SUCCESS, A0_45, L2_47, L3_48, L4_49, L5_50
end
function addressPoolSet(A0_51, A1_52, A2_53, A3_54, A4_55)
  local L5_56, L6_57, L7_58, L8_59, L9_60, L10_61
  L5_56 = _UPVALUE0_
  L5_56 = L5_56.ipv6ModeGet
  L7_58 = L5_56()
  L8_59 = tonumber
  L9_60 = L7_58
  L8_59 = L8_59(L9_60)
  if L8_59 ~= 3 then
    L8_59 = _UPVALUE1_
    L8_59 = L8_59.IPV6MODE_NOT_ENABLED
    return L8_59
  end
  L8_59 = nil
  L9_60 = _UPVALUE2_
  L9_60 = L9_60.NIL
  if A1_52 == L9_60 then
    L9_60 = _UPVALUE3_
    L9_60 = L9_60.START_IP_IS_NIL
    return L9_60
  end
  L9_60 = _UPVALUE4_
  L9_60 = L9_60.ipAddressCheck
  L10_61 = 10
  L9_60 = L9_60(L10_61, A1_52)
  L8_59 = L9_60
  L9_60 = _UPVALUE2_
  L9_60 = L9_60.SUCCESS
  if L8_59 ~= L9_60 then
    L9_60 = _UPVALUE3_
    L9_60 = L9_60.INVALID_START_IP
    return L9_60
  end
  L9_60 = _UPVALUE2_
  L9_60 = L9_60.NIL
  if A2_53 == L9_60 then
    L9_60 = _UPVALUE3_
    L9_60 = L9_60.END_IP_NIL
    return L9_60
  end
  L9_60 = _UPVALUE4_
  L9_60 = L9_60.ipAddressCheck
  L10_61 = 10
  L9_60 = L9_60(L10_61, A2_53)
  L8_59 = L9_60
  L9_60 = _UPVALUE2_
  L9_60 = L9_60.SUCCESS
  if L8_59 ~= L9_60 then
    L9_60 = _UPVALUE3_
    L9_60 = L9_60.INVALID_END_IP
    return L9_60
  end
  L9_60 = _UPVALUE2_
  L9_60 = L9_60.NIL
  if A3_54 == L9_60 then
    L9_60 = _UPVALUE3_
    L9_60 = L9_60.ADDRPOOL_PREFIXLENGTH_NIL
    return L9_60
  end
  L9_60 = tonumber
  L10_61 = A3_54
  L9_60 = L9_60(L10_61)
  if L9_60 < 1 or L9_60 > 128 then
    L10_61 = _UPVALUE3_
    L10_61 = L10_61.INVALID_ADDRPOOL_PREFIXLENGTH
    return L10_61
  end
  L10_61 = {}
  L10_61[lanaddresspoolsTable .. "." .. _UPVALUE5_.startIpAddress] = A1_52
  L10_61[lanaddresspoolsTable .. "." .. _UPVALUE5_.endIpAddress] = A2_53
  L10_61[lanaddresspoolsTable .. "." .. _UPVALUE5_.prefixLength] = A3_54
  L10_61[lanaddresspoolsTable .. "." .. _UPVALUE5_.interfaceName] = A4_55
  if db.update(lanaddresspoolsTable, L10_61, A0_51) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_51
  end
  return _UPVALUE2_.SUCCESS, A0_51
end
function addressPoolCreate(A0_62, A1_63, A2_64, A3_65)
  local L4_66, L5_67, L6_68, L7_69, L8_70, L9_71, L10_72, L11_73, L12_74, L13_75
  L4_66 = _UPVALUE0_
  L4_66 = L4_66.ipv6ModeGet
  L6_68 = L4_66()
  L7_69 = tonumber
  L8_70 = L6_68
  L7_69 = L7_69(L8_70)
  if L7_69 ~= 3 then
    L7_69 = _UPVALUE1_
    L7_69 = L7_69.IPV6MODE_NOT_ENABLED
    return L7_69
  end
  L7_69 = nil
  L8_70 = _UPVALUE2_
  L8_70 = L8_70.NIL
  if A0_62 == L8_70 then
    L8_70 = _UPVALUE3_
    L8_70 = L8_70.START_IP_IS_NIL
    return L8_70
  end
  L8_70 = _UPVALUE4_
  L8_70 = L8_70.ipAddressCheck
  L9_71 = 10
  L10_72 = A0_62
  L8_70 = L8_70(L9_71, L10_72)
  L7_69 = L8_70
  L8_70 = _UPVALUE2_
  L8_70 = L8_70.SUCCESS
  if L7_69 ~= L8_70 then
    L8_70 = _UPVALUE3_
    L8_70 = L8_70.INVALID_START_IP
    return L8_70
  end
  L8_70 = _UPVALUE2_
  L8_70 = L8_70.NIL
  if A1_63 == L8_70 then
    L8_70 = _UPVALUE3_
    L8_70 = L8_70.END_IP_NIL
    return L8_70
  end
  L8_70 = _UPVALUE4_
  L8_70 = L8_70.ipAddressCheck
  L9_71 = 10
  L10_72 = A1_63
  L8_70 = L8_70(L9_71, L10_72)
  L7_69 = L8_70
  L8_70 = _UPVALUE2_
  L8_70 = L8_70.SUCCESS
  if L7_69 ~= L8_70 then
    L8_70 = _UPVALUE3_
    L8_70 = L8_70.INVALID_END_IP
    return L8_70
  end
  L8_70 = _UPVALUE2_
  L8_70 = L8_70.NIL
  if A2_64 == L8_70 then
    L8_70 = _UPVALUE3_
    L8_70 = L8_70.ADDRPOOL_PREFIXLENGTH_NIL
    return L8_70
  end
  L8_70 = tonumber
  L9_71 = A2_64
  L8_70 = L8_70(L9_71)
  if L8_70 < 1 or L8_70 > 128 then
    L9_71 = _UPVALUE3_
    L9_71 = L9_71.INVALID_ADDRPOOL_PREFIXLENGTH
    return L9_71
  end
  L9_71 = {}
  L10_72 = lanaddresspoolsTable
  L11_73 = "."
  L12_74 = _UPVALUE5_
  L12_74 = L12_74.startIpAddress
  L10_72 = L10_72 .. L11_73 .. L12_74
  L9_71[L10_72] = A0_62
  L10_72 = lanaddresspoolsTable
  L11_73 = "."
  L12_74 = _UPVALUE5_
  L12_74 = L12_74.endIpAddress
  L10_72 = L10_72 .. L11_73 .. L12_74
  L9_71[L10_72] = A1_63
  L10_72 = lanaddresspoolsTable
  L11_73 = "."
  L12_74 = _UPVALUE5_
  L12_74 = L12_74.prefixLength
  L10_72 = L10_72 .. L11_73 .. L12_74
  L9_71[L10_72] = A2_64
  L10_72 = lanaddresspoolsTable
  L11_73 = "."
  L12_74 = _UPVALUE5_
  L12_74 = L12_74.interfaceName
  L10_72 = L10_72 .. L11_73 .. L12_74
  L9_71[L10_72] = A3_65
  L10_72 = db
  L10_72 = L10_72.insert
  L11_73 = lanaddresspoolsTable
  L12_74 = L9_71
  L11_73 = L10_72(L11_73, L12_74)
  L12_74 = _UPVALUE2_
  L12_74 = L12_74.NIL
  if L11_73 == L12_74 then
    L12_74 = _UPVALUE2_
    L12_74 = L12_74.FAILURE
    return L12_74
  end
  L12_74 = _UPVALUE5_
  L12_74 = L12_74.startIpAddress
  L13_75 = " = '"
  L12_74 = L12_74 .. L13_75 .. A0_62 .. "' AND " .. _UPVALUE5_.endIpAddress .. " = '" .. A1_63 .. "'"
  L13_75 = db
  L13_75 = L13_75.getAttributeWhere
  L13_75 = L13_75(lanaddresspoolsTable, L12_74, "_ROWID_")
  return _UPVALUE2_.SUCCESS, L13_75
end
function addressPoolDelete(A0_76)
  local L1_77, L2_78, L3_79
  L1_77 = _UPVALUE0_
  L1_77 = L1_77.ipv6ModeGet
  L3_79 = L1_77()
  if tonumber(L3_79) ~= 3 then
    return _UPVALUE1_.IPV6MODE_NOT_ENABLED
  end
  if A0_76 == _UPVALUE2_.NIL or tonumber(A0_76) == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if db.deleteRow(lanaddresspoolsTable, "_ROWID_", A0_76) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_76
  end
  return _UPVALUE2_.SUCCESS, A0_76
end
function dhcpAddressPoolGetAll()
  local L0_80
  L0_80 = db
  L0_80 = L0_80.getTable
  L0_80 = L0_80(lanaddresspoolsTable, false)
  if L0_80 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_80
end
function dhcpAddressPoolDeleteAll()
  if db.deleteAllRows(lanaddresspoolsTable) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
