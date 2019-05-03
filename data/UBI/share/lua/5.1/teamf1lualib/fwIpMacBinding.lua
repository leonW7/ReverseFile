local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/fwValidations")
L0_0 = "1"
fw.core.ipMacBinding = {}
ipMacBindingTable = "IPMACBinding"
;({}).name = "Name"
;({}).sourceMACAddress = "SourceMACAddress"
;({}).ipAddress = "IPAddress"
;({}).logStatus = "LogStatus"
;({}).associationEnabled = "AssociatingEnabled"
function fw.core.ipMacBinding.ruleNameGet()
  local L0_1, L1_2, L2_3
  L1_2, L0_1 = getFirstCookie(ipMacBindingTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_2 then
    return L1_2
  end
  L2_3 = db.getAttribute(ipMacBindingTable, _UPVALUE0_, L0_1, _UPVALUE1_.name)
  if L2_3 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_1, L2_3
end
function fw.core.ipMacBinding.ruleNameGetNext(A0_4)
  local L1_5, L2_6, L3_7
  if A0_4 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_5, L3_7 = getNextCookie(ipMacBindingTable, _UPVALUE1_, A0_4)
  if returnCodes.SUCCESS ~= L1_5 then
    return L1_5
  end
  L2_6 = db.getAttribute(ipMacBindingTable, _UPVALUE1_, L3_7, _UPVALUE2_.name)
  if L2_6 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_7, L2_6
end
function fw.core.ipMacBinding.ruleNameSet(A0_8, A1_9)
  local L2_10, L3_11, L4_12
  if A0_8 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_10 = db.existsRow(ipMacBindingTable, _UPVALUE1_, A0_8)
  if not L2_10 then
    return returnCodes.COOKIEFAIL
  end
  L2_10 = fw_textValidation(A1_9)
  if L2_10 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A0_8
  end
  L4_12 = db.setAttribute(ipMacBindingTable, _UPVALUE1_, A0_8, _UPVALUE2_.name, A1_9)
  if not L4_12 then
    return returnCodes.FAILURE, A0_8
  end
  return returnCodes.SUCCESS, A0_8
end
function fw.core.ipMacBinding.sourceMACAddressGet()
  local L0_13, L1_14, L2_15
  L1_14, L0_13 = getFirstCookie(ipMacBindingTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_14 then
    return L1_14
  end
  L2_15 = db.getAttribute(ipMacBindingTable, _UPVALUE0_, L0_13, _UPVALUE1_.sourceMACAddress)
  if L2_15 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_13, L2_15
end
function fw.core.ipMacBinding.sourceMACAddressGetNext(A0_16)
  local L1_17, L2_18, L3_19
  if A0_16 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_17, L3_19 = getNextCookie(ipMacBindingTable, _UPVALUE1_, A0_16)
  if returnCodes.SUCCESS ~= L1_17 then
    return L1_17
  end
  L2_18 = db.getAttribute(ipMacBindingTable, _UPVALUE1_, L3_19, _UPVALUE2_.sourceMACAddress)
  if L2_18 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_19, L2_18
end
function fw.core.ipMacBinding.sourceMACAddressSet(A0_20, A1_21)
  local L2_22, L3_23, L4_24
  if A0_20 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_22 = db.existsRow(ipMacBindingTable, _UPVALUE1_, A0_20)
  if not L2_22 then
    return returnCodes.COOKIEFAIL
  end
  if A1_21 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_22 = macAddressCheck(A1_21)
  if not L2_22 then
    return returnCodes.INVALID_ARGUMENT
  end
  L4_24 = db.setAttribute(ipMacBindingTable, _UPVALUE1_, A0_20, _UPVALUE2_.sourceMACAddress, A1_21)
  if not L4_24 then
    return returnCodes.FAILURE, A0_20
  end
  return returnCodes.SUCCESS, A0_20
end
function fw.core.ipMacBinding.ipAddressGet()
  local L0_25, L1_26, L2_27
  L1_26, L0_25 = getFirstCookie(ipMacBindingTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_26 then
    return L1_26
  end
  L2_27 = db.getAttribute(ipMacBindingTable, _UPVALUE0_, L0_25, _UPVALUE1_.ipAddress)
  if L2_27 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_25, L2_27
end
function fw.core.ipMacBinding.ipAddressGetNext(A0_28)
  local L1_29, L2_30, L3_31
  if A0_28 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_29, L3_31 = getNextCookie(ipMacBindingTable, _UPVALUE1_, A0_28)
  if returnCodes.SUCCESS ~= L1_29 then
    return L1_29
  end
  L2_30 = db.getAttribute(ipMacBindingTable, _UPVALUE1_, L3_31, _UPVALUE2_.ipAddress)
  if L2_30 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_31, L2_30
end
function fw.core.ipMacBinding.ipAddressSet(A0_32, A1_33)
  local L2_34, L3_35, L4_36
  if A0_32 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_34 = db.existsRow(ipMacBindingTable, _UPVALUE1_, A0_32)
  if not L2_34 then
    return returnCodes.COOKIEFAIL
  end
  if A1_33 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_34 = ipv4Check(A1_33)
  if not L2_34 then
    return returnCodes.INVALID_ARGUMENT
  end
  L4_36 = db.setAttribute(ipMacBindingTable, _UPVALUE1_, A0_32, _UPVALUE2_.ipAddress, A1_33)
  if not L4_36 then
    return returnCodes.FAILURE, A0_32
  end
  return returnCodes.SUCCESS, A0_32
end
function fw.core.ipMacBinding.logStatusGet()
  local L0_37, L1_38, L2_39
  L1_38, L0_37 = getFirstCookie(ipMacBindingTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_38 then
    return L1_38
  end
  L2_39 = db.getAttribute(ipMacBindingTable, _UPVALUE0_, L0_37, _UPVALUE1_.logStatus)
  if L2_39 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_37, L2_39
end
function fw.core.ipMacBinding.logStatusGetNext(A0_40)
  local L1_41, L2_42, L3_43
  if A0_40 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_41, L3_43 = getNextCookie(ipMacBindingTable, _UPVALUE1_, A0_40)
  if returnCodes.SUCCESS ~= L1_41 then
    return L1_41
  end
  L2_42 = db.getAttribute(ipMacBindingTable, _UPVALUE1_, L3_43, _UPVALUE2_.logStatus)
  if L2_42 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_43, L2_42
end
function fw.core.ipMacBinding.logStatusSet(A0_44, A1_45)
  local L2_46, L3_47, L4_48
  if A0_44 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_46 = db.existsRow(ipMacBindingTable, _UPVALUE1_, A0_44)
  if not L2_46 then
    return returnCodes.COOKIEFAIL
  end
  L2_46 = booleanCheck(A1_45)
  if not L2_46 then
    return returnCodes.INVALID_ARGUMENT
  end
  L4_48 = db.setAttribute(ipMacBindingTable, _UPVALUE1_, A0_44, _UPVALUE2_.logStatus, A1_45)
  if not L4_48 then
    return returnCodes.FAILURE, A0_44
  end
  return returnCodes.SUCCESS, A0_44
end
function fw.core.ipMacBinding.associationEnabledGet()
  local L0_49, L1_50, L2_51
  L1_50, L0_49 = getFirstCookie(ipMacBindingTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_50 then
    return L1_50
  end
  L2_51 = db.getAttribute(ipMacBindingTable, _UPVALUE0_, L0_49, _UPVALUE1_.associationEnabled)
  if L2_51 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_49, L2_51
end
function fw.core.ipMacBinding.associationEnabledGetNext(A0_52)
  local L1_53, L2_54, L3_55
  if A0_52 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_53, L3_55 = getNextCookie(ipMacBindingTable, _UPVALUE1_, A0_52)
  if returnCodes.SUCCESS ~= L1_53 then
    return L1_53
  end
  L2_54 = db.getAttribute(ipMacBindingTable, _UPVALUE1_, L3_55, _UPVALUE2_.associationEnabled)
  if L2_54 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_55, L2_54
end
function fw.core.ipMacBinding.associationEnabledSet(A0_56, A1_57)
  local L2_58, L3_59, L4_60
  if A0_56 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_58 = db.existsRow(ipMacBindingTable, _UPVALUE1_, A0_56)
  if not L2_58 then
    return returnCodes.COOKIEFAIL
  end
  L2_58 = booleanCheck(A1_57)
  if not L2_58 then
    return returnCodes.INVALID_ARGUMENT
  end
  L4_60 = db.setAttribute(ipMacBindingTable, _UPVALUE1_, A0_56, _UPVALUE2_.associationEnabled, A1_57)
  if not L4_60 then
    return returnCodes.FAILURE, A0_56
  end
  return returnCodes.SUCCESS, A0_56
end
function fw.core.ipMacBinding.add(A0_61, A1_62, A2_63, A3_64, A4_65)
  local L5_66, L6_67, L7_68, L8_69
  L6_67 = {}
  L7_68, L8_69 = nil, nil
  L5_66 = fw_textValidation(A0_61)
  if L5_66 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A0_61
  end
  if A1_62 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L5_66 = macAddressCheck(A1_62)
  if not L5_66 then
    return returnCodes.INVALID_ARGUMENT
  end
  if A2_63 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L5_66 = ipv4Check(A2_63)
  if not L5_66 then
    return returnCodes.INVALID_ARGUMENT
  end
  L5_66 = booleanCheck(A3_64)
  if not L5_66 then
    return returnCodes.INVALID_ARGUMENT
  end
  L5_66 = booleanCheck(A4_65)
  if not L5_66 then
    return returnCodes.INVALID_ARGUMENT
  end
  L6_67[ipMacBindingTable .. "." .. _UPVALUE1_.name] = A0_61
  L6_67[ipMacBindingTable .. "." .. _UPVALUE1_.sourceMACAddress] = A1_62
  L6_67[ipMacBindingTable .. "." .. _UPVALUE1_.ipAddress] = A2_63
  L6_67[ipMacBindingTable .. "." .. _UPVALUE1_.logStatus] = A3_64
  L6_67[ipMacBindingTable .. "." .. _UPVALUE1_.associationEnabled] = A4_65
  L8_69 = db.insert(ipMacBindingTable, L6_67)
  if not L8_69 then
    return returnCodes.FAILURE, A0_61
  end
  return returnCodes.SUCCESS, A0_61
end
function fw.core.ipMacBinding.edit(A0_70, A1_71, A2_72, A3_73, A4_74, A5_75)
  local L6_76, L7_77, L8_78, L9_79
  L7_77 = {}
  L8_78, L9_79 = nil, nil
  if A5_75 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L6_76 = db.existsRow(ipMacBindingTable, _UPVALUE1_, A5_75)
  if not L6_76 then
    return returnCodes.COOKIEFAIL
  end
  L6_76 = fw_textValidation(A0_70)
  if L6_76 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A5_75
  end
  if A1_71 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L6_76 = macAddressCheck(A1_71)
  if not L6_76 then
    return returnCodes.INVALID_ARGUMENT
  end
  if A2_72 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L6_76 = ipv4Check(A2_72)
  if not L6_76 then
    return returnCodes.INVALID_ARGUMENT
  end
  L6_76 = booleanCheck(A3_73)
  if not L6_76 then
    return returnCodes.INVALID_ARGUMENT
  end
  L6_76 = booleanCheck(A4_74)
  if not L6_76 then
    return returnCodes.INVALID_ARGUMENT
  end
  L7_77[ipMacBindingTable .. "." .. _UPVALUE2_.name] = A0_70
  L7_77[ipMacBindingTable .. "." .. _UPVALUE2_.sourceMACAddress] = A1_71
  L7_77[ipMacBindingTable .. "." .. _UPVALUE2_.ipAddress] = A2_72
  L7_77[ipMacBindingTable .. "." .. _UPVALUE2_.logStatus] = A3_73
  L7_77[ipMacBindingTable .. "." .. _UPVALUE2_.associationEnabled] = A4_74
  rowId = db.getAttribute(ipMacBindingTable, _UPVALUE1_, A5_75, "_ROWID_")
  if rowId == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  L9_79 = db.update(ipMacBindingTable, L7_77, rowId)
  if not L9_79 then
    return returnCodes.FAILURE, A5_75
  end
  return returnCodes.SUCCESS, A5_75
end
function fw.core.ipMacBinding.delete(A0_80)
  local L1_81, L2_82, L3_83
  if A0_80 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_81 = db.existsRow(ipMacBindingTable, _UPVALUE1_, A0_80)
  if not L1_81 then
    return returnCodes.COOKIEFAIL
  end
  L3_83 = db.deleteRow(ipMacBindingTable, _UPVALUE1_, A0_80)
  if not L3_83 then
    return returnCodes.FAILURE, A0_80
  end
  return returnCodes.SUCCESS, A0_80
end
function fw.core.ipMacBinding.deleteAll()
  local L0_84
  L0_84 = db.deleteAllRows(ipMacBindingTable)
  if not L0_84 then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS
end
function fw.core.ipMacBinding.Get()
  local L0_85, L1_86, L2_87, L3_88, L4_89, L5_90, L6_91, L7_92
  L7_92 = {}
  L1_86, L0_85 = getFirstCookie(ipMacBindingTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_86 then
    return L1_86
  end
  L7_92 = db.getRow(ipMacBindingTable, _UPVALUE0_, L0_85)
  if L7_92 == _UPVALUE1_ then
    return returnCodes.FAILURE
  end
  L2_87 = L7_92[ipMacBindingTable .. "." .. _UPVALUE2_.name]
  L3_88 = L7_92[ipMacBindingTable .. "." .. _UPVALUE2_.sourceMACAddress]
  L4_89 = L7_92[ipMacBindingTable .. "." .. _UPVALUE2_.ipAddress]
  L5_90 = L7_92[ipMacBindingTable .. "." .. _UPVALUE2_.logStatus]
  L6_91 = L7_92[ipMacBindingTable .. "." .. _UPVALUE2_.associationEnabled]
  return returnCodes.SUCCESS, L0_85, L2_87, L3_88, L4_89, L5_90, L6_91
end
function fw.core.ipMacBinding.GetNext(A0_93)
  local L1_94, L2_95, L3_96, L4_97, L5_98, L6_99, L7_100
  L7_100 = {}
  if A0_93 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_94, rowId = getNextCookie(portTriggeringTable, _UPVALUE1_, A0_93)
  if returnCodes.SUCCESS ~= L1_94 then
    return L1_94
  end
  ipMacBindingConfigTbl = db.getRow(ipMacBindingTable, _UPVALUE1_, A0_93)
  if ipMacBindingConfigTbl == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  L2_95 = ipMacBindingConfigTbl[ipMacBindingTable .. "." .. _UPVALUE2_.name]
  L3_96 = ipMacBindingConfigTbl[ipMacBindingTable .. "." .. _UPVALUE2_.sourceMACAddress]
  L4_97 = ipMacBindingConfigTbl[ipMacBindingTable .. "." .. _UPVALUE2_.ipAddress]
  L5_98 = ipMacBindingConfigTbl[ipMacBindingTable .. "." .. _UPVALUE2_.logStatus]
  L6_99 = ipMacBindingConfigTbl[ipMacBindingTable .. "." .. _UPVALUE2_.associationEnabled]
  return returnCodes.SUCCESS, rowId, L2_95, L3_96, L4_97, L5_98, L6_99
end
function fw.core.ipMacBinding.rowGet(A0_101)
  local L1_102, L2_103, L3_104, L4_105, L5_106, L6_107, L7_108
  L7_108 = {}
  if A0_101 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L7_108 = db.getRow(ipMacBindingTable, _UPVALUE1_, A0_101)
  if L7_108 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  L2_103 = L7_108[ipMacBindingTable .. "." .. _UPVALUE2_.name]
  L3_104 = L7_108[ipMacBindingTable .. "." .. _UPVALUE2_.sourceMACAddress]
  L4_105 = L7_108[ipMacBindingTable .. "." .. _UPVALUE2_.ipAddress]
  L5_106 = L7_108[ipMacBindingTable .. "." .. _UPVALUE2_.logStatus]
  L6_107 = L7_108[ipMacBindingTable .. "." .. _UPVALUE2_.associationEnabled]
  return returnCodes.SUCCESS, A0_101, L2_103, L3_104, L4_105, L5_106, L6_107
end
function fw.core.ipMacBinding.GetAll()
  local L0_109
  L0_109 = db
  L0_109 = L0_109.getTable
  L0_109 = L0_109(ipMacBindingTable, false)
  if L0_109 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_109
end
