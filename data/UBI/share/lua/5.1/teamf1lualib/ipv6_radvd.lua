local L0_0
L0_0 = module
L0_0("com.teamf1.core.ipv6.radvd", package.seeall)
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
L0_0("teamf1lualib/returnCodes_radvd")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
radvdTable = "radvd"
radvdLANPrefixPoolTable = "radvdLANPrefixPool"
dhcpTable = "dhcpv6S"
attribute = {}
attribute.feature = "isEnabled"
attribute.mode = "UnicastOnly"
attribute.interval = "MaxRtrAdvInterval"
attribute.managed = "AdvManagedFlag"
attribute.other = "AdvOtherConfigFlag"
attribute.mtu = "AdvLinkMTU"
attribute.routerPreference = "AdvDefaultPreference"
attribute.lifetime = "AdvDefaultLifetime"
attribute.usePrefixDelegation = "useDHCP6sPrefixes"
attribute.prefix = "radvdAdvPrefix"
attribute.prefixLength = "radvdAdvPrefixLength"
attribute.prefixLifeTime = "radvdAdvPrefixLifetime"
attribute.prefixType = "radvdPrefixType"
attribute.sla = "SLAIdentifier"
attribute.base6to4Interface = "Base6to4Interface"
attribute.interfaceName = "interfaceName"
attribute.LogicalIfName = "LogicalIfName"
attribute.ipv6Mode = "netWorkMode"
ROWID = "_ROWID_"
STATUS_ENABLE = 1
STATUS_DISABLE = 0
ENABLE = "1"
DISABLE = "0"
LOW = 1
MEDIUM = 2
HIGH = 3
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
else
end
function isfeatureEnabled(A0_1)
  local L1_2, L2_3
  L1_2 = attribute
  L1_2 = L1_2.LogicalIfName
  L2_3 = "= '"
  L1_2 = L1_2 .. L2_3 .. A0_1 .. "'"
  L2_3 = db
  L2_3 = L2_3.getAttributeWhere
  L2_3 = L2_3(radvdTable, L1_2, attribute.feature)
  if L2_3 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L2_3
end
function isfeatureEnabledNext(A0_4)
  return _UPVALUE0_.NOT_SUPPORTED
end
function featureEnable()
  local L0_5, L1_6, L2_7
  L0_5 = _UPVALUE0_
  L0_5 = L0_5.ipv6ModeGet
  L2_7 = L0_5()
  if tonumber(L2_7) ~= 3 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if not db.setAttribute(radvdTable, "_ROWID_", 1, attribute.feature, STATUS_ENABLE) then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1
end
function featureDisable()
  local L0_8, L1_9, L2_10
  L0_8 = _UPVALUE0_
  L0_8 = L0_8.ipv6ModeGet
  L2_10 = L0_8()
  if tonumber(L2_10) ~= 3 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if not db.setAttribute(radvdTable, "_ROWID_", 1, attribute.feature, STATUS_DISABLE) then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1
end
function modeGet()
  local L0_11
  L0_11 = db
  L0_11 = L0_11.getAttribute
  L0_11 = L0_11(radvdTable, "_ROWID_", "1", attribute.mode)
  if L0_11 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_11
end
function modeGetNext()
  local L1_12
  L1_12 = _UPVALUE0_
  L1_12 = L1_12.NOT_SUPPORTED
  return L1_12
end
function modeSet(A0_13)
  local L1_14, L2_15, L3_16, L4_17, L5_18, L6_19
  L1_14 = _UPVALUE0_
  L1_14 = L1_14.ipv6ModeGet
  L3_16 = L1_14()
  L4_17 = isfeatureEnabled
  L6_19 = L4_17()
  if tonumber(L3_16) ~= 3 or tonumber(L6_19) ~= 1 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if A0_13 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if tonumber(A0_13) ~= 0 and tonumber(A0_13) ~= 1 then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if not db.setAttribute(radvdTable, "_ROWID_", "1", attribute.mode, A0_13) then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1
end
function intervalGet()
  local L0_20
  L0_20 = db
  L0_20 = L0_20.getAttribute
  L0_20 = L0_20(radvdTable, "_ROWID_", "1", attribute.interval)
  if L0_20 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_20
end
function intervalGetNext(A0_21)
  return _UPVALUE0_.NOT_SUPPORTED
end
function intervalSet(A0_22)
  local L1_23, L2_24, L3_25, L4_26, L5_27, L6_28
  L1_23 = _UPVALUE0_
  L1_23 = L1_23.ipv6ModeGet
  L3_25 = L1_23()
  L4_26 = isfeatureEnabled
  L6_28 = L4_26()
  if tonumber(L3_25) ~= 3 or tonumber(L6_28) ~= 1 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if A0_22 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if tonumber(A0_22) < 10 or tonumber(A0_22) > 1800 then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if not db.setAttribute(radvdTable, "_ROWID_", "1", attribute.interval, A0_22) then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1
end
function ismanagedEnabled()
  local L0_29
  L0_29 = db
  L0_29 = L0_29.getAttribute
  L0_29 = L0_29(radvdTable, "_ROWID_", "1", attribute.managed)
  if L0_29 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_29
end
function ismanagedEnabledNext()
  local L1_30
  L1_30 = _UPVALUE0_
  L1_30 = L1_30.NOT_SUPPORTED
  return L1_30
end
function managedEnable()
  local L0_31, L1_32, L2_33, L3_34, L4_35, L5_36
  L0_31 = _UPVALUE0_
  L0_31 = L0_31.ipv6ModeGet
  L2_33 = L0_31()
  L3_34 = isfeatureEnabled
  L5_36 = L3_34()
  if tonumber(L2_33) ~= 3 or tonumber(L5_36) ~= 1 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if not db.setAttribute(radvdTable, "_ROWID_", "1", attribute.managed, STATUS_ENABLE) then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1
end
function managedDisable()
  local L0_37, L1_38, L2_39, L3_40, L4_41, L5_42
  L0_37 = _UPVALUE0_
  L0_37 = L0_37.ipv6ModeGet
  L2_39 = L0_37()
  L3_40 = isfeatureEnabled
  L5_42 = L3_40()
  if tonumber(L2_39) ~= 3 or tonumber(L5_42) ~= 1 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if not db.setAttribute(radvdTable, "_ROWID_", "1", attribute.managed, STATUS_DISABLE) then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1
end
function isotherEnabled()
  local L0_43
  L0_43 = db
  L0_43 = L0_43.getAttribute
  L0_43 = L0_43(radvdTable, "_ROWID_", "1", attribute.other)
  if L0_43 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_43
end
function isotherEnabledNext()
  local L1_44
  L1_44 = _UPVALUE0_
  L1_44 = L1_44.NOT_SUPPORTED
  return L1_44
end
function otherEnable()
  local L0_45, L1_46, L2_47, L3_48, L4_49, L5_50
  L0_45 = _UPVALUE0_
  L0_45 = L0_45.ipv6ModeGet
  L2_47 = L0_45()
  L3_48 = isfeatureEnabled
  L5_50 = L3_48()
  if tonumber(L2_47) ~= 3 or tonumber(L5_50) ~= 1 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if not db.setAttribute(radvdTable, "_ROWID_", "1", attribute.other, STATUS_ENABLE) then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1
end
function otherDisable()
  local L0_51, L1_52, L2_53, L3_54, L4_55, L5_56
  L0_51 = _UPVALUE0_
  L0_51 = L0_51.ipv6ModeGet
  L2_53 = L0_51()
  L3_54 = isfeatureEnabled
  L5_56 = L3_54()
  if tonumber(L2_53) ~= 3 or tonumber(L5_56) ~= 1 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if not db.setAttribute(radvdTable, "_ROWID_", "1", attribute.other, STATUS_DISABLE) then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1
end
function mtuGet()
  local L0_57, L1_58
  L1_58 = db
  L1_58 = L1_58.getAttribute
  L1_58 = L1_58(radvdTable, "_ROWID_", "1", attribute.mtu)
  if L1_58 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L1_58
end
function mtuGetNext()
  local L1_59
  L1_59 = _UPVALUE0_
  L1_59 = L1_59.NOT_SUPPORTED
  return L1_59
end
function mtuSet(A0_60)
  local L1_61, L2_62, L3_63, L4_64, L5_65, L6_66
  L1_61 = _UPVALUE0_
  L1_61 = L1_61.ipv6ModeGet
  L3_63 = L1_61()
  L4_64 = isfeatureEnabled
  L6_66 = L4_64()
  if tonumber(L3_63) ~= 3 or tonumber(L6_66) ~= 1 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if A0_60 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if tonumber(A0_60) < 1280 or tonumber(A0_60) > 1500 then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if not db.setAttribute(radvdTable, "_ROWID_", "1", attribute.mtu, A0_60) then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1
end
function routerPreferenceGet()
  local L0_67
  L0_67 = db
  L0_67 = L0_67.getAttribute
  L0_67 = L0_67(radvdTable, "_ROWID_", "1", attribute.routerPreference)
  if L0_67 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_67
end
function routerPreferenceGetNext()
  local L1_68
  L1_68 = _UPVALUE0_
  L1_68 = L1_68.NOT_SUPPORTED
  return L1_68
end
function routerPreferenceSet(A0_69)
  local L1_70, L2_71, L3_72, L4_73, L5_74, L6_75
  L1_70 = _UPVALUE0_
  L1_70 = L1_70.ipv6ModeGet
  L3_72 = L1_70()
  L4_73 = isfeatureEnabled
  L6_75 = L4_73()
  if tonumber(L3_72) ~= 3 or tonumber(L6_75) ~= 1 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if A0_69 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if A0_69 ~= HIGH and A0_69 ~= MEDIUM and A0_69 ~= LOW then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if not db.setAttribute(radvdTable, "_ROWID_", "1", attribute.routerPreference, A0_69) then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1
end
function lifetimeGet()
  local L0_76
  L0_76 = db
  L0_76 = L0_76.getAttribute
  L0_76 = L0_76(radvdTable, "_ROWID_", "1", attribute.lifetime)
  if L0_76 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_76
end
function lifetimeGetNext()
  local L1_77
  L1_77 = _UPVALUE0_
  L1_77 = L1_77.NOT_SUPPORTED
  return L1_77
end
function lifetimeSet(A0_78)
  local L1_79, L2_80, L3_81, L4_82, L5_83, L6_84
  L1_79 = _UPVALUE0_
  L1_79 = L1_79.ipv6ModeGet
  L3_81 = L1_79()
  L4_82 = isfeatureEnabled
  L6_84 = L4_82()
  if tonumber(L3_81) ~= 3 or tonumber(L6_84) ~= 1 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if A0_78 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if tonumber(A0_78) < 30 or tonumber(A0_78) > 9000 then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if not db.setAttribute(radvdTable, "_ROWID_", "1", attribute.lifetime, A0_78) then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1
end
function isusePrefixDelegationEnabled()
  local L0_85
  L0_85 = db
  L0_85 = L0_85.getAttribute
  L0_85 = L0_85(radvdTable, "_ROWID_", "1", attribute.usePrefixDelegation)
  if L0_85 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_85
end
function isusePrefixDelegationEnabledNext()
  local L1_86
  L1_86 = _UPVALUE0_
  L1_86 = L1_86.NOT_SUPPORTED
  return L1_86
end
function usePrefixDelegationEnable()
  local L0_87, L1_88, L2_89, L3_90, L4_91, L5_92
  L0_87 = _UPVALUE0_
  L0_87 = L0_87.ipv6ModeGet
  L2_89 = L0_87()
  L3_90 = isfeatureEnabled
  L5_92 = L3_90()
  if tonumber(L2_89) ~= 3 or tonumber(L5_92) ~= 1 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if not db.setAttribute(radvdTable, "_ROWID_", "1", attribute.usePrefixDelegation, STATUS_ENABLE) then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1
end
function usePrefixDelegationDisable()
  local L0_93, L1_94, L2_95, L3_96, L4_97, L5_98
  L0_93 = _UPVALUE0_
  L0_93 = L0_93.ipv6ModeGet
  L2_95 = L0_93()
  L3_96 = isfeatureEnabled
  L5_98 = L3_96()
  if tonumber(L2_95) ~= 3 or tonumber(L5_98) ~= 1 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if not db.setAttribute(radvdTable, "_ROWID_", "1", attribute.usePrefixDelegation, STATUS_DISABLE) then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1
end
function prefixGet()
  local L0_99, L1_100, L2_101
  L0_99 = db
  L0_99 = L0_99.getNextRowId
  L1_100 = 0
  L2_101 = radvdLANPrefixPoolTable
  L0_99 = L0_99(L1_100, L2_101)
  L1_100 = _UPVALUE0_
  L1_100 = L1_100.NIL
  if L0_99 == L1_100 then
    L1_100 = EMPTY_TABLE
    return L1_100
  end
  L1_100 = db
  L1_100 = L1_100.getAttribute
  L2_101 = radvdLANPrefixPoolTable
  L1_100 = L1_100(L2_101, "_ROWID_", L0_99, attribute.prefixType)
  L2_101 = nil
  if tonumber(L1_100) == 2 then
    L2_101 = db.getAttribute(radvdLANPrefixPoolTable, "_ROWID_", L0_99, attribute.prefix)
  else
    return _UPVALUE0_.NOT_SUPPORTED, L0_99
  end
  if L2_101 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L0_99
  end
  return _UPVALUE0_.SUCCESS, L0_99, L2_101
end
function prefixGetNext(A0_102)
  local L1_103, L2_104, L3_105
  L1_103 = _UPVALUE0_
  L1_103 = L1_103.NIL
  if A0_102 ~= L1_103 then
    L1_103 = tonumber
    L2_104 = A0_102
    L1_103 = L1_103(L2_104)
    L2_104 = _UPVALUE0_
    L2_104 = L2_104.NIL
  elseif L1_103 == L2_104 then
    L1_103 = _UPVALUE0_
    L1_103 = L1_103.INVALID_ARGUMENT
    return L1_103
  end
  L1_103 = nil
  L2_104 = db
  L2_104 = L2_104.getNextRowId
  L3_105 = A0_102
  L2_104 = L2_104(L3_105, radvdLANPrefixPoolTable)
  L1_103 = L2_104
  L2_104 = _UPVALUE0_
  L2_104 = L2_104.NIL
  if L1_103 == L2_104 then
    L2_104 = _UPVALUE0_
    L2_104 = L2_104.TABLE_FULL
    L3_105 = A0_102
    return L2_104, L3_105
  end
  L2_104 = db
  L2_104 = L2_104.getAttribute
  L3_105 = radvdLANPrefixPoolTable
  L2_104 = L2_104(L3_105, "_ROWID_", L1_103, attribute.prefixType)
  L3_105 = nil
  if tonumber(L2_104) == 2 then
    L3_105 = db.getAttribute(radvdLANPrefixPoolTable, "_ROWID_", L1_103, attribute.prefix)
  else
    return _UPVALUE0_.NOT_SUPPORTED, L1_103
  end
  if L3_105 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_103
  end
  return _UPVALUE0_.SUCCESS, L1_103, L3_105
end
function prefixSet(A0_106, A1_107)
  local L2_108, L3_109, L4_110, L5_111, L6_112, L7_113, L8_114, L9_115, L10_116
  L2_108 = _UPVALUE0_
  L2_108 = L2_108.ipv6ModeGet
  L4_110 = L2_108()
  L5_111 = isfeatureEnabled
  L7_113 = L5_111()
  L8_114 = tonumber
  L9_115 = L4_110
  L8_114 = L8_114(L9_115)
  if L8_114 == 3 then
    L8_114 = tonumber
    L9_115 = L7_113
    L8_114 = L8_114(L9_115)
  elseif L8_114 ~= 1 then
    L8_114 = _UPVALUE1_
    L8_114 = L8_114.NOT_SUPPORTED
    return L8_114
  end
  L8_114 = _UPVALUE1_
  L8_114 = L8_114.NIL
  if A0_106 ~= L8_114 then
    L8_114 = tonumber
    L9_115 = A0_106
    L8_114 = L8_114(L9_115)
    L9_115 = _UPVALUE1_
    L9_115 = L9_115.NIL
  elseif L8_114 == L9_115 then
    L8_114 = _UPVALUE1_
    L8_114 = L8_114.INVALID_ARGUMENT
    return L8_114
  end
  L8_114 = _UPVALUE1_
  L8_114 = L8_114.NIL
  if A1_107 == L8_114 then
    L8_114 = _UPVALUE1_
    L8_114 = L8_114.INVALID_ARGUMENT
    return L8_114
  end
  L8_114 = db
  L8_114 = L8_114.getAttribute
  L9_115 = radvdLANPrefixPoolTable
  L10_116 = "_ROWID_"
  L8_114 = L8_114(L9_115, L10_116, A0_106, attribute.prefixType)
  L9_115 = tonumber
  L10_116 = L8_114
  L9_115 = L9_115(L10_116)
  if L9_115 ~= 2 then
    L9_115 = _UPVALUE1_
    L9_115 = L9_115.NOT_SUPPORTED
    L10_116 = A0_106
    return L9_115, L10_116
  end
  L9_115 = _UPVALUE2_
  L9_115 = L9_115.ipAddressCheck
  L10_116 = 10
  L9_115 = L9_115(L10_116, A1_107)
  valid = L9_115
  L9_115 = valid
  L10_116 = _UPVALUE1_
  L10_116 = L10_116.SUCCESS
  if L9_115 ~= L10_116 then
    L9_115 = _UPVALUE1_
    L9_115 = L9_115.INVALID_ARGUMENT
    return L9_115
  end
  L9_115 = db
  L9_115 = L9_115.getRow
  L10_116 = radvdLANPrefixPoolTable
  L9_115 = L9_115(L10_116, "_ROWID_", A0_106)
  L10_116 = tonumber
  L10_116 = L10_116(L9_115[radvdLANPrefixPoolTable .. "." .. attribute.prefixType])
  if L10_116 ~= 2 then
    L10_116 = _UPVALUE1_
    L10_116 = L10_116.INVALID_ARGUMENT
    return L10_116
  end
  L10_116 = "_ROWID_ = "
  L10_116 = L10_116 .. A0_106
  if not db.setAttributeWhere(radvdLANPrefixPoolTable, L10_116, attribute.prefix, A1_107) then
    return _UPVALUE1_.FAILURE, A0_106
  end
  return _UPVALUE1_.SUCCESS, A0_106
end
function prefixLengthGet()
  local L0_117, L1_118, L2_119
  L0_117 = db
  L0_117 = L0_117.getNextRowId
  L1_118 = 0
  L2_119 = radvdLANPrefixPoolTable
  L0_117 = L0_117(L1_118, L2_119)
  L1_118 = _UPVALUE0_
  L1_118 = L1_118.NIL
  if L0_117 == L1_118 then
    L1_118 = EMPTY_TABLE
    return L1_118
  end
  L1_118 = tonumber
  L2_119 = L0_117
  L1_118 = L1_118(L2_119)
  L2_119 = _UPVALUE0_
  L2_119 = L2_119.NIL
  if L1_118 == L2_119 then
    L1_118 = _UPVALUE0_
    L1_118 = L1_118.INVALID_ARGUMENT
    return L1_118
  end
  L1_118 = db
  L1_118 = L1_118.getAttribute
  L2_119 = radvdLANPrefixPoolTable
  L1_118 = L1_118(L2_119, "_ROWID_", L0_117, attribute.prefixType)
  L2_119 = nil
  if tonumber(L1_118) == 2 then
    L2_119 = db.getAttribute(radvdLANPrefixPoolTable, "_ROWID_", L0_117, attribute.prefixLength)
  else
    return _UPVALUE0_.NOT_SUPPORTED, L0_117
  end
  if L2_119 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L0_117
  end
  return _UPVALUE0_.SUCCESS, L0_117, L2_119
end
function prefixLengthGetNext(A0_120)
  local L1_121, L2_122, L3_123
  L1_121 = _UPVALUE0_
  L1_121 = L1_121.NIL
  if A0_120 ~= L1_121 then
    L1_121 = tonumber
    L2_122 = A0_120
    L1_121 = L1_121(L2_122)
    L2_122 = _UPVALUE0_
    L2_122 = L2_122.NIL
  elseif L1_121 == L2_122 then
    L1_121 = _UPVALUE0_
    L1_121 = L1_121.INVALID_ARGUMENT
    return L1_121
  end
  L1_121 = nil
  L2_122 = db
  L2_122 = L2_122.getNextRowId
  L3_123 = A0_120
  L2_122 = L2_122(L3_123, radvdLANPrefixPoolTable)
  L1_121 = L2_122
  L2_122 = _UPVALUE0_
  L2_122 = L2_122.NIL
  if L1_121 == L2_122 then
    L2_122 = _UPVALUE0_
    L2_122 = L2_122.TABLE_FULL
    L3_123 = A0_120
    return L2_122, L3_123
  end
  L2_122 = db
  L2_122 = L2_122.getAttribute
  L3_123 = radvdLANPrefixPoolTable
  L2_122 = L2_122(L3_123, "_ROWID_", L1_121, attribute.prefixType)
  L3_123 = nil
  if tonumber(L2_122) == 2 then
    L3_123 = db.getAttribute(radvdLANPrefixPoolTable, "_ROWID_", L1_121, attribute.prefixLength)
  else
    return _UPVALUE0_.NOT_SUPPORTED, L1_121
  end
  if L3_123 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_121
  end
  return _UPVALUE0_.SUCCESS, L1_121, L3_123
end
function prefixLengthSet(A0_124, A1_125)
  local L2_126, L3_127, L4_128, L5_129, L6_130, L7_131, L8_132, L9_133, L10_134, L11_135
  L2_126 = _UPVALUE0_
  L2_126 = L2_126.ipv6ModeGet
  L4_128 = L2_126()
  L5_129 = isfeatureEnabled
  L7_131 = L5_129()
  L8_132 = tonumber
  L9_133 = L4_128
  L8_132 = L8_132(L9_133)
  if L8_132 == 3 then
    L8_132 = tonumber
    L9_133 = L7_131
    L8_132 = L8_132(L9_133)
  elseif L8_132 ~= 1 then
    L8_132 = _UPVALUE1_
    L8_132 = L8_132.NOT_SUPPORTED
    return L8_132
  end
  L8_132 = _UPVALUE1_
  L8_132 = L8_132.NIL
  if A0_124 ~= L8_132 then
    L8_132 = tonumber
    L9_133 = A0_124
    L8_132 = L8_132(L9_133)
    L9_133 = _UPVALUE1_
    L9_133 = L9_133.NIL
  elseif L8_132 == L9_133 then
    L8_132 = _UPVALUE1_
    L8_132 = L8_132.INVALID_ARGUMENT
    return L8_132
  end
  L8_132 = _UPVALUE1_
  L8_132 = L8_132.NIL
  if A1_125 == L8_132 then
    L8_132 = _UPVALUE1_
    L8_132 = L8_132.INVALID_ARGUMENT
    return L8_132
  end
  L8_132 = db
  L8_132 = L8_132.getAttribute
  L9_133 = radvdLANPrefixPoolTable
  L10_134 = "_ROWID_"
  L11_135 = A0_124
  L8_132 = L8_132(L9_133, L10_134, L11_135, attribute.prefixType)
  L9_133 = tonumber
  L10_134 = L8_132
  L9_133 = L9_133(L10_134)
  if L9_133 ~= 2 then
    L9_133 = _UPVALUE1_
    L9_133 = L9_133.NOT_SUPPORTED
    L10_134 = A0_124
    return L9_133, L10_134
  end
  L9_133 = tonumber
  L10_134 = A1_125
  L9_133 = L9_133(L10_134)
  if L9_133 < 1 or L9_133 > 128 then
    L10_134 = _UPVALUE1_
    L10_134 = L10_134.INVALID_ARGUMENT
    return L10_134
  end
  L10_134 = db
  L10_134 = L10_134.getRow
  L11_135 = radvdLANPrefixPoolTable
  L10_134 = L10_134(L11_135, "_ROWID_", A0_124)
  L11_135 = tonumber
  L11_135 = L11_135(L10_134[radvdLANPrefixPoolTable .. "." .. attribute.prefixType])
  if L11_135 ~= 2 then
    L11_135 = _UPVALUE1_
    L11_135 = L11_135.INVALID_ARGUMENT
    return L11_135
  end
  L11_135 = "_ROWID_ = "
  L11_135 = L11_135 .. A0_124
  if not db.setAttributeWhere(radvdLANPrefixPoolTable, L11_135, attribute.prefixLength, A1_125) then
    return _UPVALUE1_.FAILURE, A0_124
  end
  return _UPVALUE1_.SUCCESS, A0_124
end
function prefixLifeTimeGet()
  local L0_136, L1_137
  L0_136 = db
  L0_136 = L0_136.getNextRowId
  L1_137 = 0
  L0_136 = L0_136(L1_137, radvdLANPrefixPoolTable)
  L1_137 = _UPVALUE0_
  L1_137 = L1_137.NIL
  if L0_136 == L1_137 then
    L1_137 = _UPVALUE0_
    L1_137 = L1_137.EMPTY_TABLE
    return L1_137
  end
  L1_137 = tonumber
  L1_137 = L1_137(L0_136)
  if L1_137 == _UPVALUE0_.NIL then
    L1_137 = _UPVALUE0_
    L1_137 = L1_137.INVALID_ARGUMENT
    return L1_137
  end
  L1_137 = db
  L1_137 = L1_137.getAttribute
  L1_137 = L1_137(radvdLANPrefixPoolTable, "_ROWID_", L0_136, attribute.prefixLifeTime)
  if L1_137 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L0_136
  end
  return _UPVALUE0_.SUCCESS, L0_136, L1_137
end
function prefixLifeTimeGetNext(A0_138)
  local L1_139, L2_140
  L1_139 = _UPVALUE0_
  L1_139 = L1_139.NIL
  if A0_138 ~= L1_139 then
    L1_139 = tonumber
    L2_140 = A0_138
    L1_139 = L1_139(L2_140)
    L2_140 = _UPVALUE0_
    L2_140 = L2_140.NIL
  elseif L1_139 == L2_140 then
    L1_139 = _UPVALUE0_
    L1_139 = L1_139.INVALID_ARGUMENT
    return L1_139
  end
  L1_139 = nil
  L2_140 = db
  L2_140 = L2_140.getNextRowId
  L2_140 = L2_140(A0_138, radvdLANPrefixPoolTable)
  L1_139 = L2_140
  L2_140 = _UPVALUE0_
  L2_140 = L2_140.NIL
  if L1_139 == L2_140 then
    L2_140 = _UPVALUE0_
    L2_140 = L2_140.TABLE_FULL
    return L2_140, A0_138
  end
  L2_140 = db
  L2_140 = L2_140.getAttribute
  L2_140 = L2_140(radvdLANPrefixPoolTable, "_ROWID_", L1_139, attribute.prefixLifeTime)
  if L2_140 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_139
  end
  return _UPVALUE0_.SUCCESS, L1_139, L2_140
end
function prefixLifeTimeSet(A0_141, A1_142)
  local L2_143, L3_144, L4_145, L5_146, L6_147, L7_148, L8_149, L9_150
  L2_143 = _UPVALUE0_
  L2_143 = L2_143.ipv6ModeGet
  L4_145 = L2_143()
  L5_146 = isfeatureEnabled
  L7_148 = L5_146()
  L8_149 = tonumber
  L9_150 = L4_145
  L8_149 = L8_149(L9_150)
  if L8_149 == 3 then
    L8_149 = tonumber
    L9_150 = L7_148
    L8_149 = L8_149(L9_150)
  elseif L8_149 ~= 1 then
    L8_149 = _UPVALUE1_
    L8_149 = L8_149.NOT_SUPPORTED
    return L8_149
  end
  L8_149 = _UPVALUE1_
  L8_149 = L8_149.NIL
  if A0_141 ~= L8_149 then
    L8_149 = tonumber
    L9_150 = A0_141
    L8_149 = L8_149(L9_150)
    L9_150 = _UPVALUE1_
    L9_150 = L9_150.NIL
  elseif L8_149 == L9_150 then
    L8_149 = _UPVALUE1_
    L8_149 = L8_149.INVALID_ARGUMENT
    return L8_149
  end
  L8_149 = _UPVALUE1_
  L8_149 = L8_149.NIL
  if A1_142 == L8_149 then
    L8_149 = _UPVALUE1_
    L8_149 = L8_149.INVALID_ARGUMENT
    return L8_149
  end
  L8_149 = tonumber
  L9_150 = A1_142
  L8_149 = L8_149(L9_150)
  if L8_149 < 5 or L8_149 > 65536 then
    L9_150 = _UPVALUE1_
    L9_150 = L9_150.INVALID_ARGUMENT
    return L9_150
  end
  L9_150 = "_ROWID_ = "
  L9_150 = L9_150 .. A0_141
  if not db.setAttributeWhere(radvdLANPrefixPoolTable, L9_150, attribute.prefixLifeTime, A1_142) then
    return _UPVALUE1_.FAILURE, A0_141
  end
  return _UPVALUE1_.SUCCESS, A0_141
end
function prefixTypeGet()
  local L0_151, L1_152
  L0_151 = db
  L0_151 = L0_151.getNextRowId
  L1_152 = 0
  L0_151 = L0_151(L1_152, radvdLANPrefixPoolTable)
  L1_152 = _UPVALUE0_
  L1_152 = L1_152.NIL
  if L0_151 == L1_152 then
    L1_152 = _UPVALUE0_
    L1_152 = L1_152.EMPTY_TABLE
    return L1_152
  end
  L1_152 = tonumber
  L1_152 = L1_152(L0_151)
  if L1_152 == _UPVALUE0_.NIL then
    L1_152 = _UPVALUE0_
    L1_152 = L1_152.INVALID_ARGUMENT
    return L1_152
  end
  L1_152 = db
  L1_152 = L1_152.getAttribute
  L1_152 = L1_152(radvdLANPrefixPoolTable, "_ROWID_", L0_151, attribute.prefixType)
  if L1_152 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L0_151
  end
  return _UPVALUE0_.SUCCESS, L0_151, L1_152
end
function prefixTypeGetNext(A0_153)
  local L1_154, L2_155
  L1_154 = _UPVALUE0_
  L1_154 = L1_154.NIL
  if A0_153 ~= L1_154 then
    L1_154 = tonumber
    L2_155 = A0_153
    L1_154 = L1_154(L2_155)
    L2_155 = _UPVALUE0_
    L2_155 = L2_155.NIL
  elseif L1_154 == L2_155 then
    L1_154 = _UPVALUE0_
    L1_154 = L1_154.INVALID_ARGUMENT
    return L1_154
  end
  L1_154 = nil
  L2_155 = db
  L2_155 = L2_155.getNextRowId
  L2_155 = L2_155(A0_153, radvdLANPrefixPoolTable)
  L1_154 = L2_155
  L2_155 = _UPVALUE0_
  L2_155 = L2_155.NIL
  if L1_154 == L2_155 then
    L2_155 = _UPVALUE0_
    L2_155 = L2_155.TABLE_FULL
    return L2_155, A0_153
  end
  L2_155 = db
  L2_155 = L2_155.getAttribute
  L2_155 = L2_155(radvdLANPrefixPoolTable, "_ROWID_", L1_154, attribute.prefixType)
  if L2_155 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_154
  end
  return _UPVALUE0_.SUCCESS, L1_154, L2_155
end
function prefixTypeSet(A0_156, A1_157)
  return _UPVALUE0_.NOT_SUPPORTED
end
function slaGet()
  local L0_158, L1_159, L2_160
  L0_158 = db
  L0_158 = L0_158.getNextRowId
  L1_159 = 0
  L2_160 = radvdLANPrefixPoolTable
  L0_158 = L0_158(L1_159, L2_160)
  L1_159 = _UPVALUE0_
  L1_159 = L1_159.NIL
  if L0_158 == L1_159 then
    L1_159 = _UPVALUE0_
    L1_159 = L1_159.EMPTY_TABLE
    return L1_159
  end
  L1_159 = tonumber
  L2_160 = L0_158
  L1_159 = L1_159(L2_160)
  L2_160 = _UPVALUE0_
  L2_160 = L2_160.NIL
  if L1_159 == L2_160 then
    L1_159 = _UPVALUE0_
    L1_159 = L1_159.INVALID_ARGUMENT
    return L1_159
  end
  L1_159 = db
  L1_159 = L1_159.getAttribute
  L2_160 = radvdLANPrefixPoolTable
  L1_159 = L1_159(L2_160, "_ROWID_", L0_158, attribute.prefixType)
  L2_160 = nil
  if tonumber(L1_159) == 1 then
    L2_160 = db.getAttribute(radvdLANPrefixPoolTable, "_ROWID_", L0_158, attribute.sla)
  else
    return _UPVALUE0_.NOT_SUPPORTED, L0_158
  end
  if L2_160 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L0_158
  end
  return _UPVALUE0_.SUCCESS, L0_158, L2_160
end
function slaGetNext(A0_161)
  local L1_162, L2_163, L3_164
  L1_162 = _UPVALUE0_
  L1_162 = L1_162.NIL
  if A0_161 ~= L1_162 then
    L1_162 = tonumber
    L2_163 = A0_161
    L1_162 = L1_162(L2_163)
    L2_163 = _UPVALUE0_
    L2_163 = L2_163.NIL
  elseif L1_162 == L2_163 then
    L1_162 = _UPVALUE0_
    L1_162 = L1_162.INVALID_ARGUMENT
    return L1_162
  end
  L1_162 = nil
  L2_163 = db
  L2_163 = L2_163.getNextRowId
  L3_164 = A0_161
  L2_163 = L2_163(L3_164, radvdLANPrefixPoolTable)
  L1_162 = L2_163
  L2_163 = _UPVALUE0_
  L2_163 = L2_163.NIL
  if L1_162 == L2_163 then
    L2_163 = _UPVALUE0_
    L2_163 = L2_163.TABLE_FULL
    L3_164 = A0_161
    return L2_163, L3_164
  end
  L2_163 = db
  L2_163 = L2_163.getAttribute
  L3_164 = radvdLANPrefixPoolTable
  L2_163 = L2_163(L3_164, "_ROWID_", L1_162, attribute.prefixType)
  L3_164 = nil
  if tonumber(L2_163) == 1 then
    L3_164 = db.getAttribute(radvdLANPrefixPoolTable, "_ROWID_", L1_162, attribute.sla)
  else
    return _UPVALUE0_.NOT_SUPPORTED, L1_162
  end
  if L3_164 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_162
  end
  return _UPVALUE0_.SUCCESS, L1_162, L3_164
end
function slaSet(A0_165, A1_166)
  local L2_167, L3_168, L4_169, L5_170, L6_171, L7_172, L8_173, L9_174, L10_175, L11_176
  L2_167 = _UPVALUE0_
  L2_167 = L2_167.ipv6ModeGet
  L4_169 = L2_167()
  L5_170 = isfeatureEnabled
  L7_172 = L5_170()
  L8_173 = tonumber
  L9_174 = L4_169
  L8_173 = L8_173(L9_174)
  if L8_173 == 3 then
    L8_173 = tonumber
    L9_174 = L7_172
    L8_173 = L8_173(L9_174)
  elseif L8_173 ~= 1 then
    L8_173 = _UPVALUE1_
    L8_173 = L8_173.NOT_SUPPORTED
    return L8_173
  end
  L8_173 = _UPVALUE1_
  L8_173 = L8_173.NIL
  if A0_165 ~= L8_173 then
    L8_173 = tonumber
    L9_174 = A0_165
    L8_173 = L8_173(L9_174)
    L9_174 = _UPVALUE1_
    L9_174 = L9_174.NIL
  elseif L8_173 == L9_174 then
    L8_173 = _UPVALUE1_
    L8_173 = L8_173.INVALID_ARGUMENT
    return L8_173
  end
  L8_173 = _UPVALUE1_
  L8_173 = L8_173.NIL
  if A1_166 == L8_173 then
    L8_173 = _UPVALUE1_
    L8_173 = L8_173.INVALID_ARGUMENT
    return L8_173
  end
  L8_173 = db
  L8_173 = L8_173.getAttribute
  L9_174 = radvdLANPrefixPoolTable
  L10_175 = "_ROWID_"
  L11_176 = A0_165
  L8_173 = L8_173(L9_174, L10_175, L11_176, attribute.prefixType)
  L9_174 = tonumber
  L10_175 = L8_173
  L9_174 = L9_174(L10_175)
  if L9_174 ~= 1 then
    L9_174 = _UPVALUE1_
    L9_174 = L9_174.NOT_SUPPORTED
    L10_175 = A0_165
    return L9_174, L10_175
  end
  L9_174 = tonumber
  L10_175 = A1_166
  L9_174 = L9_174(L10_175)
  if L9_174 < 1 or L9_174 > 999 then
    L10_175 = _UPVALUE1_
    L10_175 = L10_175.INVALID_ARGUMENT
    return L10_175
  end
  L10_175 = db
  L10_175 = L10_175.getRow
  L11_176 = radvdLANPrefixPoolTable
  L10_175 = L10_175(L11_176, "_ROWID_", A0_165)
  L11_176 = tonumber
  L11_176 = L11_176(L10_175[radvdLANPrefixPoolTable .. "." .. attribute.prefixType])
  if L11_176 ~= 1 then
    L11_176 = _UPVALUE1_
    L11_176 = L11_176.INVALID_ARGUMENT
    return L11_176
  end
  L11_176 = "_ROWID_ = "
  L11_176 = L11_176 .. A0_165
  if not db.setAttributeWhere(radvdLANPrefixPoolTable, L11_176, attribute.sla, A1_166) then
    return _UPVALUE1_.FAILURE, A0_165
  end
  return _UPVALUE1_.SUCCESS, A0_165
end
function advertisementGetAll(A0_177)
  local L1_178
  L1_178 = {}
  L1_178 = db.getTable(radvdTable, false)
  if L1_178 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_178
end
function advertisementGet(A0_179)
  local L1_180, L2_181
  L1_180 = {}
  L2_181 = _UPVALUE0_
  L2_181 = L2_181.NIL
  if A0_179 ~= L2_181 then
    L2_181 = tonumber
    L2_181 = L2_181(A0_179)
  elseif L2_181 == _UPVALUE0_.NIL then
    L2_181 = _UPVALUE0_
    L2_181 = L2_181.INVALID_ARGUMENT
    return L2_181
  end
  L2_181 = db
  L2_181 = L2_181.getRow
  L2_181 = L2_181(radvdTable, ROWID, A0_179)
  L1_180 = L2_181
  L2_181 = _UPVALUE0_
  L2_181 = L2_181.NIL
  if L1_180 == L2_181 then
    L2_181 = _UPVALUE0_
    L2_181 = L2_181.FAILURE
    return L2_181
  end
  L2_181 = {}
  L2_181["radvd.status"] = L1_180[radvdTable .. "." .. attribute.feature]
  L2_181["radvd.mode"] = L1_180[radvdTable .. "." .. attribute.mode]
  L2_181["radvd.interval"] = L1_180[radvdTable .. "." .. attribute.interval]
  L2_181["radvd.managed"] = L1_180[radvdTable .. "." .. attribute.managed]
  L2_181["radvd.other"] = L1_180[radvdTable .. "." .. attribute.other]
  L2_181["radvd.mtu"] = L1_180[radvdTable .. "." .. attribute.mtu]
  L2_181["radvd.routerPreference"] = L1_180[radvdTable .. "." .. attribute.routerPreference]
  L2_181["radvd.lifetime"] = L1_180[radvdTable .. "." .. attribute.lifetime]
  return _UPVALUE0_.SUCCESS, A0_179, L2_181
end
function advertisementstatusGet()
  local L0_182, L1_183, L2_184
  L2_184 = attribute
  L2_184 = L2_184.feature
  L2_184 = L2_184 .. "= '" .. ENABLE .. "'"
  L1_183 = db.getAttributeWhere(radvdTable, L2_184, ROWID)
  if L1_183 == _UPVALUE0_.NIL then
    L0_182 = DISABLE
  else
    L0_182 = ENABLE
  end
  return _UPVALUE0_.SUCCESS, L0_182
end
function advertisementGetNext(A0_185)
  return _UPVALUE0_.NOT_SUPPORTED
end
function advertisementSet(A0_186, A1_187, A2_188, A3_189, A4_190, A5_191, A6_192, A7_193, A8_194)
  local L9_195, L10_196, L11_197, L12_198, L13_199, L14_200, L15_201
  L9_195 = _UPVALUE0_
  L9_195 = L9_195.ipv6ModeGet
  L11_197 = L9_195()
  L12_198 = tonumber
  L13_199 = L11_197
  L12_198 = L12_198(L13_199)
  if L12_198 ~= 3 then
    L12_198 = _UPVALUE1_
    L12_198 = L12_198.IPV6MODE_NOT_ENABLED
    return L12_198
  end
  L12_198 = nil
  L13_199 = _UPVALUE2_
  L13_199 = L13_199.NIL
  if A0_186 ~= L13_199 then
    L13_199 = tonumber
    L14_200 = A0_186
    L13_199 = L13_199(L14_200)
    L14_200 = _UPVALUE2_
    L14_200 = L14_200.NIL
  elseif L13_199 == L14_200 then
    L13_199 = _UPVALUE2_
    L13_199 = L13_199.INVALID_ARGUMENT
    return L13_199
  end
  L13_199 = _UPVALUE2_
  L13_199 = L13_199.NIL
  if A1_187 == L13_199 then
    L13_199 = _UPVALUE3_
    L13_199 = L13_199.RADVD_STATUS_NIL
    return L13_199
  end
  L13_199 = tonumber
  L14_200 = A1_187
  L13_199 = L13_199(L14_200)
  if L13_199 ~= 0 and L13_199 ~= 1 then
    L14_200 = _UPVALUE3_
    L14_200 = L14_200.INVALID_RADVD_VALUE
    return L14_200
  end
  if L13_199 == 1 then
    L14_200 = _UPVALUE2_
    L14_200 = L14_200.NIL
    if A2_188 == L14_200 then
      L14_200 = _UPVALUE3_
      L14_200 = L14_200.ADV_MODE_NIL
      return L14_200
    end
  end
  L14_200 = nil
  if L13_199 == 1 then
    L15_201 = tonumber
    L15_201 = L15_201(A2_188)
    L14_200 = L15_201
    if L14_200 ~= 0 and L14_200 ~= 1 then
      L15_201 = _UPVALUE3_
      L15_201 = L15_201.INVALID_ADV_MODE
      return L15_201
    end
  end
  if L13_199 == 1 and L14_200 == 0 then
    L15_201 = _UPVALUE2_
    L15_201 = L15_201.NIL
    if A3_189 == L15_201 then
      L15_201 = _UPVALUE3_
      L15_201 = L15_201.ADV_INTERVAL_NIL
      return L15_201
    end
  end
  if L13_199 == 1 and L14_200 == 0 then
    L15_201 = tonumber
    L15_201 = L15_201(A3_189)
    if L15_201 < 10 or L15_201 > 1800 then
      return _UPVALUE3_.INVALID_ADV_INTERVAL
    end
  end
  if L13_199 == 1 then
    L15_201 = _UPVALUE2_
    L15_201 = L15_201.NIL
    if A4_190 == L15_201 then
      L15_201 = _UPVALUE3_
      L15_201 = L15_201.RADVD_MANAGED_FLAG_NIL
      return L15_201
    end
  end
  if L13_199 == 1 then
    L15_201 = _UPVALUE4_
    L15_201 = L15_201.isBoolean
    L15_201 = L15_201(A4_190)
    L12_198 = L15_201
    L15_201 = _UPVALUE2_
    L15_201 = L15_201.SUCCESS
    if L12_198 ~= L15_201 then
      L15_201 = _UPVALUE3_
      L15_201 = L15_201.INVALID_RADVD_MANAGED_FLAG
      return L15_201
    end
  end
  if L13_199 == 1 then
    L15_201 = _UPVALUE2_
    L15_201 = L15_201.NIL
    if A5_191 == L15_201 then
      L15_201 = _UPVALUE3_
      L15_201 = L15_201.RADVD_OTHER_FLAG_NIL
      return L15_201
    end
  end
  if L13_199 == 1 then
    L15_201 = _UPVALUE4_
    L15_201 = L15_201.isBoolean
    L15_201 = L15_201(A5_191)
    L12_198 = L15_201
    L15_201 = _UPVALUE2_
    L15_201 = L15_201.SUCCESS
    if L12_198 ~= L15_201 then
      L15_201 = _UPVALUE3_
      L15_201 = L15_201.INVALID_RADVD_OTHER_FLAG
      return L15_201
    end
  end
  if L13_199 == 1 then
    L15_201 = _UPVALUE2_
    L15_201 = L15_201.NIL
    if A6_192 == L15_201 then
      L15_201 = _UPVALUE3_
      L15_201 = L15_201.RADVD_MTU_NIL
      return L15_201
    end
  end
  if L13_199 == 1 then
    L15_201 = tonumber
    L15_201 = L15_201(A6_192)
    if L15_201 < 1280 or L15_201 > 1500 then
      return _UPVALUE3_.INVALID_RADVD_MTU
    end
  end
  if L13_199 == 1 then
    L15_201 = _UPVALUE2_
    L15_201 = L15_201.NIL
    if A7_193 == L15_201 then
      L15_201 = _UPVALUE3_
      L15_201 = L15_201.RADVD_ROUTER_PREF_VAL_NIL
      return L15_201
    end
  end
  if L13_199 == 1 then
    L15_201 = tonumber
    L15_201 = L15_201(A7_193)
    if L15_201 ~= HIGH then
      L15_201 = tonumber
      L15_201 = L15_201(A7_193)
      if L15_201 ~= MEDIUM then
        L15_201 = tonumber
        L15_201 = L15_201(A7_193)
        if L15_201 ~= LOW then
          L15_201 = _UPVALUE3_
          L15_201 = L15_201.INVALID_RADVD_ROUTER_PREF_VAL
          return L15_201
        end
      end
    end
  end
  if L13_199 == 1 then
    L15_201 = _UPVALUE2_
    L15_201 = L15_201.NIL
    if A8_194 == L15_201 then
      L15_201 = _UPVALUE3_
      L15_201 = L15_201.RADVD_LIFETIME_NIL
      return L15_201
    end
  end
  if L13_199 == 1 then
    L15_201 = tonumber
    L15_201 = L15_201(A8_194)
    if L15_201 < 10 or L15_201 > 9000 then
      return _UPVALUE3_.INVALID_RADVD_LIFETIME_VAL
    end
  end
  L15_201 = {}
  L15_201[radvdTable .. "." .. attribute.feature] = A1_187
  L15_201[radvdTable .. "." .. attribute.mode] = A2_188
  L15_201[radvdTable .. "." .. attribute.interval] = A3_189
  L15_201[radvdTable .. "." .. attribute.managed] = A4_190
  L15_201[radvdTable .. "." .. attribute.other] = A5_191
  L15_201[radvdTable .. "." .. attribute.mtu] = A6_192
  L15_201[radvdTable .. "." .. attribute.routerPreference] = A7_193
  L15_201[radvdTable .. "." .. attribute.lifetime] = A8_194
  if db.update(radvdTable, L15_201, A0_186) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, 1
  end
  return _UPVALUE2_.SUCCESS, 1
end
function prefixGrpGet()
  local L0_202, L1_203, L2_204, L3_205, L4_206, L5_207, L6_208
  L0_202 = db
  L0_202 = L0_202.getNextRowId
  L1_203 = 0
  L2_204 = radvdLANPrefixPoolTable
  L0_202 = L0_202(L1_203, L2_204)
  L1_203 = _UPVALUE0_
  L1_203 = L1_203.NIL
  if L0_202 == L1_203 then
    L1_203 = EMPTY_TABLE
    return L1_203
  end
  L1_203 = tonumber
  L2_204 = L0_202
  L1_203 = L1_203(L2_204)
  L2_204 = _UPVALUE0_
  L2_204 = L2_204.NIL
  if L1_203 == L2_204 then
    L1_203 = _UPVALUE0_
    L1_203 = L1_203.INVALID_ARGUMENT
    return L1_203
  end
  L1_203 = {}
  L2_204 = db
  L2_204 = L2_204.getRow
  L3_205 = radvdLANPrefixPoolTable
  L4_206 = "_ROWID_"
  L5_207 = L0_202
  L2_204 = L2_204(L3_205, L4_206, L5_207)
  L1_203 = L2_204
  L2_204 = _UPVALUE0_
  L2_204 = L2_204.NIL
  if L1_203 == L2_204 then
    L2_204 = _UPVALUE0_
    L2_204 = L2_204.FAILURE
    return L2_204
  end
  L2_204 = radvdLANPrefixPoolTable
  L3_205 = "."
  L4_206 = attribute
  L4_206 = L4_206.prefix
  L2_204 = L2_204 .. L3_205 .. L4_206
  L2_204 = L1_203[L2_204]
  L3_205 = radvdLANPrefixPoolTable
  L4_206 = "."
  L5_207 = attribute
  L5_207 = L5_207.prefixLength
  L3_205 = L3_205 .. L4_206 .. L5_207
  L3_205 = L1_203[L3_205]
  L4_206 = radvdLANPrefixPoolTable
  L5_207 = "."
  L6_208 = attribute
  L6_208 = L6_208.prefixLifeTime
  L4_206 = L4_206 .. L5_207 .. L6_208
  L4_206 = L1_203[L4_206]
  L5_207 = radvdLANPrefixPoolTable
  L6_208 = "."
  L5_207 = L5_207 .. L6_208 .. attribute.prefixType
  L5_207 = L1_203[L5_207]
  L6_208 = radvdLANPrefixPoolTable
  L6_208 = L6_208 .. "." .. attribute.sla
  L6_208 = L1_203[L6_208]
  return _UPVALUE0_.SUCCESS, L0_202, L2_204, L3_205, L4_206, L5_207, L6_208
end
function prefixGrpGetNext(A0_209)
  local L1_210, L2_211, L3_212, L4_213, L5_214, L6_215, L7_216
  L1_210 = _UPVALUE0_
  L1_210 = L1_210.NIL
  if A0_209 ~= L1_210 then
    L1_210 = tonumber
    L2_211 = A0_209
    L1_210 = L1_210(L2_211)
    L2_211 = _UPVALUE0_
    L2_211 = L2_211.NIL
  elseif L1_210 == L2_211 then
    L1_210 = _UPVALUE0_
    L1_210 = L1_210.INVALID_ARGUMENT
    return L1_210
  end
  L1_210 = nil
  L2_211 = db
  L2_211 = L2_211.getNextRowId
  L3_212 = A0_209
  L4_213 = radvdLANPrefixPoolTable
  L2_211 = L2_211(L3_212, L4_213)
  L1_210 = L2_211
  L2_211 = _UPVALUE0_
  L2_211 = L2_211.NIL
  if L1_210 == L2_211 then
    L2_211 = _UPVALUE0_
    L2_211 = L2_211.TABLE_FULL
    L3_212 = A0_209
    return L2_211, L3_212
  end
  L2_211 = {}
  L3_212 = db
  L3_212 = L3_212.getRow
  L4_213 = radvdLANPrefixPoolTable
  L5_214 = "_ROWID_"
  L6_215 = L1_210
  L3_212 = L3_212(L4_213, L5_214, L6_215)
  L2_211 = L3_212
  L3_212 = _UPVALUE0_
  L3_212 = L3_212.NIL
  if L2_211 == L3_212 then
    L3_212 = _UPVALUE0_
    L3_212 = L3_212.FAILURE
    return L3_212
  end
  L3_212 = radvdLANPrefixPoolTable
  L4_213 = "."
  L5_214 = attribute
  L5_214 = L5_214.prefix
  L3_212 = L3_212 .. L4_213 .. L5_214
  L3_212 = L2_211[L3_212]
  L4_213 = radvdLANPrefixPoolTable
  L5_214 = "."
  L6_215 = attribute
  L6_215 = L6_215.prefixLength
  L4_213 = L4_213 .. L5_214 .. L6_215
  L4_213 = L2_211[L4_213]
  L5_214 = radvdLANPrefixPoolTable
  L6_215 = "."
  L7_216 = attribute
  L7_216 = L7_216.prefixLifeTime
  L5_214 = L5_214 .. L6_215 .. L7_216
  L5_214 = L2_211[L5_214]
  L6_215 = radvdLANPrefixPoolTable
  L7_216 = "."
  L6_215 = L6_215 .. L7_216 .. attribute.prefixType
  L6_215 = L2_211[L6_215]
  L7_216 = radvdLANPrefixPoolTable
  L7_216 = L7_216 .. "." .. attribute.sla
  L7_216 = L2_211[L7_216]
  return _UPVALUE0_.SUCCESS, L1_210, L3_212, L4_213, L5_214, L6_215, L7_216
end
function prefixGrpGetCur(A0_217)
  local L1_218, L2_219, L3_220, L4_221, L5_222, L6_223, L7_224
  L1_218 = _UPVALUE0_
  L1_218 = L1_218.NIL
  if A0_217 ~= L1_218 then
    L1_218 = tonumber
    L2_219 = A0_217
    L1_218 = L1_218(L2_219)
    L2_219 = _UPVALUE0_
    L2_219 = L2_219.NIL
  elseif L1_218 == L2_219 then
    L1_218 = _UPVALUE0_
    L1_218 = L1_218.INVALID_ARGUMENT
    return L1_218
  end
  L1_218 = {}
  L2_219 = db
  L2_219 = L2_219.getRow
  L3_220 = radvdLANPrefixPoolTable
  L4_221 = "_ROWID_"
  L5_222 = A0_217
  L2_219 = L2_219(L3_220, L4_221, L5_222)
  L1_218 = L2_219
  L2_219 = _UPVALUE0_
  L2_219 = L2_219.NIL
  if L1_218 == L2_219 then
    L2_219 = _UPVALUE0_
    L2_219 = L2_219.FAILURE
    return L2_219
  end
  L2_219 = radvdLANPrefixPoolTable
  L3_220 = "."
  L4_221 = attribute
  L4_221 = L4_221.prefix
  L2_219 = L2_219 .. L3_220 .. L4_221
  L2_219 = L1_218[L2_219]
  L3_220 = radvdLANPrefixPoolTable
  L4_221 = "."
  L5_222 = attribute
  L5_222 = L5_222.prefixLength
  L3_220 = L3_220 .. L4_221 .. L5_222
  L3_220 = L1_218[L3_220]
  L4_221 = radvdLANPrefixPoolTable
  L5_222 = "."
  L6_223 = attribute
  L6_223 = L6_223.prefixLifeTime
  L4_221 = L4_221 .. L5_222 .. L6_223
  L4_221 = L1_218[L4_221]
  L5_222 = radvdLANPrefixPoolTable
  L6_223 = "."
  L7_224 = attribute
  L7_224 = L7_224.prefixType
  L5_222 = L5_222 .. L6_223 .. L7_224
  L5_222 = L1_218[L5_222]
  L6_223 = radvdLANPrefixPoolTable
  L7_224 = "."
  L6_223 = L6_223 .. L7_224 .. attribute.sla
  L6_223 = L1_218[L6_223]
  L7_224 = radvdLANPrefixPoolTable
  L7_224 = L7_224 .. "." .. attribute.interfaceName
  L7_224 = L1_218[L7_224]
  return _UPVALUE0_.SUCCESS, A0_217, L2_219, L3_220, L4_221, L5_222, L6_223, L7_224
end
function prefixGrpSet(A0_225, A1_226, A2_227, A3_228, A4_229, A5_230, A6_231)
  local L7_232, L8_233, L9_234, L10_235, L11_236, L12_237, L13_238, L14_239, L15_240, L16_241, L17_242
  L7_232 = _UPVALUE0_
  L7_232 = L7_232.ipv6ModeGet
  L9_234 = L7_232()
  L10_235 = isfeatureEnabled
  L11_236 = A6_231
  L12_237 = L10_235(L11_236)
  L13_238 = tonumber
  L14_239 = L9_234
  L13_238 = L13_238(L14_239)
  if L13_238 ~= 3 then
    L13_238 = _UPVALUE1_
    L13_238 = L13_238.IPV6MODE_NOT_ENABLED
    return L13_238
  end
  L13_238 = tonumber
  L14_239 = L12_237
  L13_238 = L13_238(L14_239)
  if L13_238 ~= 1 then
    L13_238 = _UPVALUE2_
    L13_238 = L13_238.FEATURE_RADVD_NOT_ENABLED
    return L13_238
  end
  L13_238 = nil
  L14_239 = _UPVALUE3_
  L14_239 = L14_239.NIL
  if A4_229 == L14_239 then
    L14_239 = _UPVALUE2_
    L14_239 = L14_239.ADV_PREFIXTYPE_NIL
    return L14_239
  end
  L14_239 = tonumber
  L15_240 = A4_229
  L14_239 = L14_239(L15_240)
  if L14_239 ~= 1 and L14_239 ~= 2 then
    L15_240 = _UPVALUE2_
    L15_240 = L15_240.INVALID_ADV_PREFIXTYPE
    return L15_240
  end
  if A4_229 == 2 then
    L15_240 = _UPVALUE3_
    L15_240 = L15_240.NIL
    if A1_226 == L15_240 then
      L15_240 = _UPVALUE2_
      L15_240 = L15_240.PREFIX_REQUIRED
      return L15_240
    end
  end
  if A4_229 == 2 then
    L15_240 = _UPVALUE4_
    L15_240 = L15_240.ipAddressCheck
    L16_241 = 10
    L17_242 = A1_226
    L15_240 = L15_240(L16_241, L17_242)
    L13_238 = L15_240
    L15_240 = _UPVALUE3_
    L15_240 = L15_240.SUCCESS
    if L13_238 ~= L15_240 then
      L15_240 = _UPVALUE2_
      L15_240 = L15_240.INVALID_ADV_PREFIX
      return L15_240
    end
  end
  if A4_229 == 2 then
    L15_240 = _UPVALUE3_
    L15_240 = L15_240.NIL
    if A2_227 == L15_240 then
      L15_240 = _UPVALUE2_
      L15_240 = L15_240.ADV_PREFIXLENGTH_NIL
      return L15_240
    end
  end
  if A4_229 == 2 then
    L15_240 = tonumber
    L16_241 = A2_227
    L15_240 = L15_240(L16_241)
    if L15_240 < 1 or L15_240 > 128 then
      L16_241 = _UPVALUE2_
      L16_241 = L16_241.INVALID_ADV_PREFIXLENGTH
      return L16_241
    end
  end
  L15_240 = _UPVALUE3_
  L15_240 = L15_240.NIL
  if A3_228 == L15_240 then
    L15_240 = _UPVALUE2_
    L15_240 = L15_240.ADV_PREFIX_LIFETIME_NIL
    return L15_240
  end
  L15_240 = tonumber
  L16_241 = A3_228
  L15_240 = L15_240(L16_241)
  if L15_240 < 5 or L15_240 > 65536 then
    L16_241 = _UPVALUE2_
    L16_241 = L16_241.INVALID_ADV_PREFIX_LIFETIME
    return L16_241
  end
  if A4_229 == 1 then
    L16_241 = _UPVALUE3_
    L16_241 = L16_241.NIL
    if A5_230 == L16_241 then
      L16_241 = _UPVALUE2_
      L16_241 = L16_241.ADV_SLA_REQUIRED
      return L16_241
    end
  end
  if A4_229 == 1 then
    L16_241 = tonumber
    L17_242 = A5_230
    L16_241 = L16_241(L17_242)
    if L16_241 < 1 or L16_241 > 999 then
      L17_242 = _UPVALUE2_
      L17_242 = L17_242.INVALID_ADV_SLA_VAL
      return L17_242
    end
  end
  if A4_229 == 1 then
    L16_241 = _UPVALUE3_
    L16_241 = L16_241.NIL
    if A2_227 == L16_241 then
      L16_241 = _UPVALUE3_
      L16_241 = L16_241.NIL
    elseif A1_226 ~= L16_241 then
      L16_241 = _UPVALUE3_
      L16_241 = L16_241.INVALID_ARGUMENT
      return L16_241
    end
  end
  if A4_229 == 2 then
    L16_241 = _UPVALUE3_
    L16_241 = L16_241.NIL
    if A5_230 ~= L16_241 then
      L16_241 = _UPVALUE3_
      L16_241 = L16_241.INVALID_ARGUMENT
      return L16_241
    end
  end
  L16_241 = ""
  L17_242 = tonumber
  L17_242 = L17_242(A4_229)
  if L17_242 == _UPVALUE5_ then
    L17_242 = tonumber
    L17_242 = L17_242(A5_230)
    L17_242 = num2hex(L17_242)
    A1_226 = "2002:0:0:" .. L17_242 .. "::"
    A2_227 = "64"
    L16_241 = _UPVALUE6_
  end
  L17_242 = {}
  L17_242[radvdLANPrefixPoolTable .. "." .. attribute.prefix] = A1_226
  L17_242[radvdLANPrefixPoolTable .. "." .. attribute.prefixLength] = A2_227
  L17_242[radvdLANPrefixPoolTable .. "." .. attribute.prefixLifeTime] = A3_228
  L17_242[radvdLANPrefixPoolTable .. "." .. attribute.prefixType] = A4_229
  L17_242[radvdLANPrefixPoolTable .. "." .. attribute.sla] = A5_230
  L17_242[radvdLANPrefixPoolTable .. "." .. attribute.base6to4Interface] = L16_241
  L17_242[radvdLANPrefixPoolTable .. "." .. attribute.interfaceName] = A6_231
  if db.update(radvdLANPrefixPoolTable, L17_242, tonumber(A0_225)) == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE, A0_225
  end
  return _UPVALUE3_.SUCCESS, A0_225
end
function prefixCreate(A0_243, A1_244, A2_245, A3_246, A4_247, A5_248)
  local L6_249, L7_250, L8_251, L9_252, L10_253, L11_254, L12_255, L13_256, L14_257, L15_258, L16_259, L17_260, L18_261, L19_262, L20_263, L21_264, L22_265
  L6_249 = _UPVALUE0_
  L6_249 = L6_249.ipv6ModeGet
  L8_251 = L6_249()
  L9_252 = isfeatureEnabled
  L10_253 = A5_248
  L11_254 = L9_252(L10_253)
  L12_255 = tonumber
  L13_256 = L8_251
  L12_255 = L12_255(L13_256)
  if L12_255 ~= 3 then
    L12_255 = _UPVALUE1_
    L12_255 = L12_255.IPV6MODE_NOT_ENABLED
    return L12_255
  end
  L12_255 = tonumber
  L13_256 = L11_254
  L12_255 = L12_255(L13_256)
  if L12_255 ~= 1 then
    L12_255 = _UPVALUE2_
    L12_255 = L12_255.FEATURE_RADVD_NOT_ENABLED
    return L12_255
  end
  L12_255 = nil
  L13_256 = _UPVALUE3_
  L13_256 = L13_256.NIL
  if A3_246 == L13_256 then
    L13_256 = _UPVALUE2_
    L13_256 = L13_256.ADV_PREFIXTYPE_NIL
    return L13_256
  end
  L13_256 = tonumber
  L14_257 = A3_246
  L13_256 = L13_256(L14_257)
  if L13_256 ~= 1 and L13_256 ~= 2 then
    L14_257 = _UPVALUE2_
    L14_257 = L14_257.INVALID_ADV_PREFIXTYPE
    return L14_257
  end
  if A3_246 == 2 then
    L14_257 = _UPVALUE3_
    L14_257 = L14_257.NIL
    if A0_243 == L14_257 then
      L14_257 = _UPVALUE2_
      L14_257 = L14_257.PREFIX_REQUIRED
      return L14_257
    end
  end
  if A3_246 == 2 then
    L14_257 = _UPVALUE4_
    L14_257 = L14_257.ipAddressCheck
    L15_258 = 10
    L16_259 = A0_243
    L14_257 = L14_257(L15_258, L16_259)
    L12_255 = L14_257
    L14_257 = _UPVALUE3_
    L14_257 = L14_257.SUCCESS
    if L12_255 ~= L14_257 then
      L14_257 = _UPVALUE2_
      L14_257 = L14_257.INVALID_ADV_PREFIX
      return L14_257
    end
  end
  if A3_246 == 2 then
    L14_257 = _UPVALUE3_
    L14_257 = L14_257.NIL
    if A1_244 == L14_257 then
      L14_257 = _UPVALUE2_
      L14_257 = L14_257.ADV_PREFIXLENGTH_NIL
      return L14_257
    end
  end
  if A3_246 == 2 then
    L14_257 = tonumber
    L15_258 = A1_244
    L14_257 = L14_257(L15_258)
    if L14_257 < 1 or L14_257 > 128 then
      L15_258 = _UPVALUE2_
      L15_258 = L15_258.INVALID_ADV_PREFIXLENGTH
      return L15_258
    end
  end
  L14_257 = _UPVALUE3_
  L14_257 = L14_257.NIL
  if A2_245 == L14_257 then
    L14_257 = _UPVALUE2_
    L14_257 = L14_257.ADV_PREFIX_LIFETIME_NIL
    return L14_257
  end
  L14_257 = tonumber
  L15_258 = A2_245
  L14_257 = L14_257(L15_258)
  if L14_257 < 5 or L14_257 > 65536 then
    L15_258 = _UPVALUE2_
    L15_258 = L15_258.INVALID_ADV_PREFIX_LIFETIME
    return L15_258
  end
  if A3_246 == 1 then
    L15_258 = _UPVALUE3_
    L15_258 = L15_258.NIL
    if A4_247 == L15_258 then
      L15_258 = _UPVALUE2_
      L15_258 = L15_258.ADV_SLA_REQUIRED
      return L15_258
    end
  end
  if A3_246 == 1 then
    L15_258 = tonumber
    L16_259 = A4_247
    L15_258 = L15_258(L16_259)
    if L15_258 < 1 or L15_258 > 999 then
      L16_259 = _UPVALUE2_
      L16_259 = L16_259.INVALID_ADV_SLA_VAL
      return L16_259
    end
  end
  if A3_246 == 1 then
    L15_258 = _UPVALUE3_
    L15_258 = L15_258.NIL
    if A1_244 == L15_258 then
      L15_258 = _UPVALUE3_
      L15_258 = L15_258.NIL
    elseif A0_243 ~= L15_258 then
      L15_258 = _UPVALUE3_
      L15_258 = L15_258.INVALID_ARGUMENT
      return L15_258
    end
  end
  if A3_246 == 2 then
    L15_258 = _UPVALUE3_
    L15_258 = L15_258.NIL
    if A4_247 ~= L15_258 then
      L15_258 = _UPVALUE3_
      L15_258 = L15_258.INVALID_ARGUMENT
      return L15_258
    end
  end
  L15_258 = ""
  L16_259 = tonumber
  L17_260 = A3_246
  L16_259 = L16_259(L17_260)
  L17_260 = _UPVALUE5_
  if L16_259 == L17_260 then
    L16_259 = tonumber
    L17_260 = A4_247
    L16_259 = L16_259(L17_260)
    L17_260 = num2hex
    L18_261 = L16_259
    L17_260 = L17_260(L18_261)
    L16_259 = L17_260
    L17_260 = "2002:0:0:"
    L18_261 = L16_259
    L19_262 = "::"
    A0_243 = L17_260 .. L18_261 .. L19_262
    A1_244 = "64"
    L15_258 = _UPVALUE6_
  end
  L16_259 = nil
  L17_260 = tonumber
  L18_261 = A3_246
  L17_260 = L17_260(L18_261)
  if L17_260 == 1 then
    L17_260 = attribute
    L17_260 = L17_260.prefixType
    L18_261 = " = "
    L19_262 = A3_246
    L20_263 = " AND "
    L21_264 = attribute
    L21_264 = L21_264.sla
    L22_265 = " = "
    L16_259 = L17_260 .. L18_261 .. L19_262 .. L20_263 .. L21_264 .. L22_265 .. A4_247
  end
  L17_260 = tonumber
  L18_261 = A3_246
  L17_260 = L17_260(L18_261)
  if L17_260 == 2 then
    L17_260 = attribute
    L17_260 = L17_260.prefixType
    L18_261 = " = "
    L19_262 = A3_246
    L20_263 = " AND "
    L21_264 = attribute
    L21_264 = L21_264.prefix
    L22_265 = " = '"
    L16_259 = L17_260 .. L18_261 .. L19_262 .. L20_263 .. L21_264 .. L22_265 .. A0_243 .. "' AND " .. attribute.prefixLength .. " = " .. A1_244
  end
  L17_260 = db
  L17_260 = L17_260.existsRowWhere
  L18_261 = radvdLANPrefixPoolTable
  L19_262 = L16_259
  L17_260 = L17_260(L18_261, L19_262)
  if L17_260 then
    L18_261 = _UPVALUE3_
    L18_261 = L18_261.ALREADY_CONFIGURED
    L19_262 = L17_260
    return L18_261, L19_262
  end
  L18_261 = {}
  L19_262 = radvdLANPrefixPoolTable
  L20_263 = "."
  L21_264 = attribute
  L21_264 = L21_264.prefix
  L19_262 = L19_262 .. L20_263 .. L21_264
  L18_261[L19_262] = A0_243
  L19_262 = radvdLANPrefixPoolTable
  L20_263 = "."
  L21_264 = attribute
  L21_264 = L21_264.prefixLength
  L19_262 = L19_262 .. L20_263 .. L21_264
  L18_261[L19_262] = A1_244
  L19_262 = radvdLANPrefixPoolTable
  L20_263 = "."
  L21_264 = attribute
  L21_264 = L21_264.prefixLifeTime
  L19_262 = L19_262 .. L20_263 .. L21_264
  L18_261[L19_262] = A2_245
  L19_262 = radvdLANPrefixPoolTable
  L20_263 = "."
  L21_264 = attribute
  L21_264 = L21_264.prefixType
  L19_262 = L19_262 .. L20_263 .. L21_264
  L18_261[L19_262] = A3_246
  L19_262 = radvdLANPrefixPoolTable
  L20_263 = "."
  L21_264 = attribute
  L21_264 = L21_264.sla
  L19_262 = L19_262 .. L20_263 .. L21_264
  L18_261[L19_262] = A4_247
  L19_262 = radvdLANPrefixPoolTable
  L20_263 = "."
  L21_264 = attribute
  L21_264 = L21_264.base6to4Interface
  L19_262 = L19_262 .. L20_263 .. L21_264
  L18_261[L19_262] = L15_258
  L19_262 = radvdLANPrefixPoolTable
  L20_263 = "."
  L21_264 = attribute
  L21_264 = L21_264.interfaceName
  L19_262 = L19_262 .. L20_263 .. L21_264
  L18_261[L19_262] = A5_248
  L19_262 = db
  L19_262 = L19_262.getTable
  L20_263 = radvdLANPrefixPoolTable
  L19_262 = L19_262(L20_263)
  if L19_262 ~= nil then
    L20_263 = #L19_262
    L21_264 = _UPVALUE7_
    if L20_263 >= L21_264 then
      L20_263 = _UPVALUE3_
      L20_263 = L20_263.MAX_LIMIT_REACHED
      return L20_263
    end
  end
  L20_263 = db
  L20_263 = L20_263.insert
  L21_264 = radvdLANPrefixPoolTable
  L22_265 = L18_261
  L21_264 = L20_263(L21_264, L22_265)
  L22_265 = _UPVALUE3_
  L22_265 = L22_265.NIL
  if L21_264 == L22_265 then
    L22_265 = _UPVALUE3_
    L22_265 = L22_265.FAILURE
    return L22_265
  end
  L22_265 = db
  L22_265 = L22_265.getAttributeWhere
  L22_265 = L22_265(radvdLANPrefixPoolTable, L16_259, "_ROWID_")
  return _UPVALUE3_.SUCCESS, L22_265
end
function num2hex(A0_266)
  local L1_267, L2_268
  L1_267 = "0123456789abcdef"
  L2_268 = ""
  while A0_266 > 0 do
    L2_268 = string.sub(L1_267, math.fmod(A0_266, 16) + 1, math.fmod(A0_266, 16) + 1) .. L2_268
    A0_266 = math.floor(A0_266 / 16)
  end
  if L2_268 == "" then
    L2_268 = "0"
  end
  return L2_268
end
function advertisementStatusSet(A0_269, A1_270)
  local L2_271, L3_272, L4_273
  L2_271 = _UPVALUE0_
  L2_271 = L2_271.ipv6ModeGet
  L4_273 = L2_271()
  if tonumber(L4_273) ~= 3 then
    return _UPVALUE1_.IPV6MODE_NOT_ENABLED
  end
  if A0_269 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A1_270
  end
  if A0_269 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A1_270
  end
  if db.setAttribute(radvdTable, ROWID, A1_270, attribute.feature, A0_269) == NIL then
    return _UPVALUE2_.FAILURE, A1_270
  end
  return _UPVALUE2_.SUCCESS, A1_270
end
function advertisementEnableAll()
  local L0_274, L1_275, L2_276, L3_277
  L0_274 = _UPVALUE0_
  L0_274 = L0_274.ipv6ModeGet
  L2_276 = L0_274()
  L3_277 = tonumber
  L3_277 = L3_277(L2_276)
  if L3_277 ~= 3 then
    L3_277 = _UPVALUE1_
    L3_277 = L3_277.IPV6MODE_NOT_ENABLED
    return L3_277
  end
  L3_277 = attribute
  L3_277 = L3_277.feature
  L3_277 = L3_277 .. "='" .. DISABLE .. "'"
  if db.setAttributeWhere(radvdTable, L3_277, attribute.feature, ENABLE) == NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS
end
function advertisementDisableAll()
  local L0_278, L1_279, L2_280, L3_281
  L0_278 = _UPVALUE0_
  L0_278 = L0_278.ipv6ModeGet
  L2_280 = L0_278()
  L3_281 = tonumber
  L3_281 = L3_281(L2_280)
  if L3_281 ~= 3 then
    L3_281 = _UPVALUE1_
    L3_281 = L3_281.IPV6MODE_NOT_ENABLED
    return L3_281
  end
  L3_281 = attribute
  L3_281 = L3_281.feature
  L3_281 = L3_281 .. "='" .. ENABLE .. "'"
  if db.setAttributeWhere(radvdTable, L3_281, attribute.feature, DISABLE) == NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS
end
function prefixDelete(A0_282)
  local L1_283, L2_284, L3_285, L4_286, L5_287, L6_288, L7_289, L8_290, L9_291
  L1_283 = _UPVALUE0_
  L1_283 = L1_283.ipv6ModeGet
  L3_285 = L1_283()
  L4_286 = db
  L4_286 = L4_286.getAttribute
  L5_287 = radvdLANPrefixPoolTable
  L6_288 = ROWID
  L7_289 = A0_282
  L8_290 = attribute
  L8_290 = L8_290.interfaceName
  L4_286 = L4_286(L5_287, L6_288, L7_289, L8_290)
  L5_287 = isfeatureEnabled
  L6_288 = L4_286
  L7_289 = L5_287(L6_288)
  L8_290 = tonumber
  L9_291 = L3_285
  L8_290 = L8_290(L9_291)
  if L8_290 ~= 3 then
    L8_290 = _UPVALUE1_
    L8_290 = L8_290.IPV6MODE_NOT_ENABLED
    return L8_290
  end
  L8_290 = nil
  L9_291 = _UPVALUE2_
  L9_291 = L9_291.NIL
  if A0_282 ~= L9_291 then
    L9_291 = tonumber
    L9_291 = L9_291(A0_282)
  elseif L9_291 == _UPVALUE2_.NIL then
    L9_291 = _UPVALUE2_
    L9_291 = L9_291.INVALID_ARGUMENT
    return L9_291
  end
  L9_291 = "_ROWID_ = "
  L9_291 = L9_291 .. A0_282
  if db.deleteRowWhere(radvdLANPrefixPoolTable, L9_291) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_282
  end
  return _UPVALUE2_.SUCCESS, A0_282
end
function radvdPrefixesGetAll()
  local L0_292
  L0_292 = db
  L0_292 = L0_292.getTable
  L0_292 = L0_292(radvdLANPrefixPoolTable, false)
  if L0_292 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_292
end
function radvdAdvPrefixesDeleteAll()
  if db.deleteAllRows(radvdLANPrefixPoolTable) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function radvdAdvPrefixVlanIdGetAll()
  local L0_293, L1_294
  L0_293 = "SELECT "
  L1_294 = attribute
  L1_294 = L1_294.LogicalIfName
  L0_293 = L0_293 .. L1_294 .. " from " .. radvdTable .. " where isEnabled ='" .. STATUS_ENABLE .. "'"
  L1_294 = db
  L1_294 = L1_294.getTable
  L1_294 = L1_294(radvdTable, false, L0_293)
  return _UPVALUE0_.SUCCESS, L1_294
end
