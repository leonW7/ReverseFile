local L0_0
L0_0 = module
L0_0("com.teamf1.core.ipv6.lan", package.seeall)
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
dhcpTable = "dhcpv6s"
staticTable = "ifStatic"
;({}).dhcpServer = "isEnabled"
;({}).dhcpServerMode = "statelessMode"
;({}).dhcpDomainName = "domainName"
;({}).dhcpServerPreference = "serverPreference"
;({}).dhcpServerDnsType = "useDNSServersFrom"
;({}).primaryDnsServer = "primaryDNSServer"
;({}).secondaryDnsServer = "secondaryDNSServer"
;({}).leaseTime = "leaseTime"
;({}).prefixDelegation = "prefixDelegation"
;({}).prefix = "StaticIp"
;({}).prefixLength = "PrefixLength"
;({}).logicalIfName = "LogicalIfName"
;({}).addrFamily = "AddressFamily"
;({}).ipv6Mode = "netWorkMode"
STATUS_ENABLE = 1
STATUS_DISABLE = 0
STATELESS = 1
STATEFUL = 0
PROXY = 1
ISP = 2
CUSTOM = 3
function isdhcpServerEnabled()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(dhcpTable, "_ROWID_", 1, _UPVALUE0_.dhcpServer)
  if L0_1 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1, L0_1
end
function isdhcpServerEnabledNext(A0_2)
  local L2_3
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.NOT_SUPPORTED
  return L2_3, 1
end
function dhcpServerEnable()
  local L0_4, L1_5, L2_6
  L0_4 = _UPVALUE0_
  L0_4 = L0_4.ipv6ModeGet
  L2_6 = L0_4()
  if tonumber(L2_6) ~= 3 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if db.setAttribute(dhcpTable, "_ROWID_", 1, _UPVALUE2_.dhcpServer, STATUS_ENABLE) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1
end
function dhcpServerDisable()
  local L0_7, L1_8, L2_9
  L0_7 = _UPVALUE0_
  L0_7 = L0_7.ipv6ModeGet
  L2_9 = L0_7()
  if tonumber(L2_9) ~= 3 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if db.setAttribute(dhcpTable, "_ROWID_", 1, _UPVALUE2_.dhcpServer, STATUS_DISABLE) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1
end
function dhcpServerModeGet()
  local L0_10
  L0_10 = db
  L0_10 = L0_10.getAttribute
  L0_10 = L0_10(dhcpTable, "_ROWID_", "1", _UPVALUE0_.dhcpServerMode)
  if L0_10 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1, L0_10
end
function dhcpServerModeGetNext(A0_11)
  local L2_12
  L2_12 = _UPVALUE0_
  L2_12 = L2_12.NOT_SUPPORTED
  return L2_12, 1
end
function dhcpServerModeSet(A0_13)
  local L1_14, L2_15, L3_16, L4_17, L5_18, L6_19
  L1_14 = _UPVALUE0_
  L1_14 = L1_14.ipv6ModeGet
  L3_16 = L1_14()
  L4_17 = isdhcpServerEnabled
  L6_19 = L4_17()
  if tonumber(L3_16) ~= 3 or tonumber(L6_19) ~= 1 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if A0_13 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if A0_13 ~= STATELESS and A0_13 ~= STATEFUL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttribute(dhcpTable, "_ROWID_", 1, _UPVALUE2_.dhcpServerMode, A0_13) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1
end
function dhcpDomainNameGet()
  local L0_20
  L0_20 = db
  L0_20 = L0_20.getAttribute
  L0_20 = L0_20(dhcpTable, "_ROWID_", "1", _UPVALUE0_.dhcpDomainName)
  if L0_20 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1, L0_20
end
function dhcpDomainNameGetNext(A0_21)
  local L2_22
  L2_22 = _UPVALUE0_
  L2_22 = L2_22.NOT_SUPPORTED
  return L2_22, 1
end
function dhcpDomainNameSet(A0_23)
  local L1_24, L2_25, L3_26, L4_27, L5_28, L6_29
  L1_24 = _UPVALUE0_
  L1_24 = L1_24.ipv6ModeGet
  L3_26 = L1_24()
  L4_27 = tonumber
  L5_28 = L3_26
  L4_27 = L4_27(L5_28)
  if L4_27 ~= 3 then
    L4_27 = _UPVALUE1_
    L4_27 = L4_27.NOT_SUPPORTED
    return L4_27
  end
  L4_27 = isdhcpServerEnabled
  L6_29 = L4_27()
  if tonumber(L6_29) == 0 then
    return _UPVALUE1_.NOT_SUPPORTED, 1
  end
  if A0_23 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttribute(dhcpTable, "_ROWID_", 1, _UPVALUE2_.dhcpDomainName, A0_23) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1
end
function dhcpServerPreferenceGet()
  local L0_30
  L0_30 = db
  L0_30 = L0_30.getAttribute
  L0_30 = L0_30(dhcpTable, "_ROWID_", "1", _UPVALUE0_.dhcpServerPreference)
  if L0_30 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1, L0_30
end
function dhcpServerPreferenceGetNext(A0_31)
  local L2_32
  L2_32 = _UPVALUE0_
  L2_32 = L2_32.NOT_SUPPORTED
  return L2_32, 1
end
function dhcpServerPreferenceSet(A0_33)
  local L1_34, L2_35, L3_36, L4_37, L5_38, L6_39
  L1_34 = _UPVALUE0_
  L1_34 = L1_34.ipv6ModeGet
  L3_36 = L1_34()
  L4_37 = tonumber
  L5_38 = L3_36
  L4_37 = L4_37(L5_38)
  if L4_37 ~= 3 then
    L4_37 = _UPVALUE1_
    L4_37 = L4_37.NOT_SUPPORTED
    return L4_37
  end
  L4_37 = isdhcpServerEnabled
  L6_39 = L4_37()
  if tonumber(L6_39) == 0 then
    return _UPVALUE1_.NOT_SUPPORTED, 1
  end
  if A0_33 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if tonumber(A0_33) < 0 or tonumber(A0_33) > 255 then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttribute(dhcpTable, "_ROWID_", 1, _UPVALUE2_.dhcpServerPreference, A0_33) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1
end
function dhcpServerDnsTypeGet()
  local L0_40
  L0_40 = db
  L0_40 = L0_40.getAttribute
  L0_40 = L0_40(dhcpTable, "_ROWID_", "1", _UPVALUE0_.dhcpServerDnsType)
  if L0_40 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1, L0_40
end
function dhcpServerDnsTypeGetNext(A0_41)
  local L2_42
  L2_42 = _UPVALUE0_
  L2_42 = L2_42.NOT_SUPPORTED
  return L2_42, 1
end
function dhcpServerDnsTypeSet(A0_43)
  local L1_44, L2_45, L3_46, L4_47, L5_48, L6_49
  L1_44 = _UPVALUE0_
  L1_44 = L1_44.ipv6ModeGet
  L3_46 = L1_44()
  L4_47 = tonumber
  L5_48 = L3_46
  L4_47 = L4_47(L5_48)
  if L4_47 ~= 3 then
    L4_47 = _UPVALUE1_
    L4_47 = L4_47.NOT_SUPPORTED
    return L4_47
  end
  L4_47 = isdhcpServerEnabled
  L6_49 = L4_47()
  if tonumber(L6_49) == 0 then
    return _UPVALUE1_.NOT_SUPPORTED, 1
  end
  if A0_43 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if A0_43 ~= PROXY and A0_43 ~= CUSTOM and A0_43 ~= ISP then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttribute(dhcpTable, "_ROWID_", 1, _UPVALUE2_.dhcpServerDnsType, A0_43) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1
end
function primaryDnsServerGet()
  local L0_50
  L0_50 = db
  L0_50 = L0_50.getAttribute
  L0_50 = L0_50(dhcpTable, "_ROWID_", "1", _UPVALUE0_.primaryDnsServer)
  if L0_50 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1, L0_50
end
function primaryDnsServerGetNext(A0_51)
  local L2_52
  L2_52 = _UPVALUE0_
  L2_52 = L2_52.NOT_SUPPORTED
  return L2_52, 1
end
function primaryDnsServerSet(A0_53)
  local L1_54, L2_55, L3_56, L4_57, L5_58, L6_59, L7_60
  L1_54 = _UPVALUE0_
  L1_54 = L1_54.ipv6ModeGet
  L3_56 = L1_54()
  L4_57 = tonumber
  L5_58 = L3_56
  L4_57 = L4_57(L5_58)
  if L4_57 ~= 3 then
    L4_57 = _UPVALUE1_
    L4_57 = L4_57.NOT_SUPPORTED
    return L4_57
  end
  L4_57 = nil
  L5_58 = isdhcpServerEnabled
  L7_60 = L5_58()
  if tonumber(L7_60) == 0 then
    return _UPVALUE1_.NOT_SUPPORTED, 1
  end
  if A0_53 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  L4_57 = _UPVALUE2_.ipAddressCheck(10, A0_53)
  if L4_57 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttribute(dhcpTable, "_ROWID_", 1, _UPVALUE3_.primaryDnsServer, A0_53) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1
end
function secondaryDnsServerGet()
  local L0_61
  L0_61 = db
  L0_61 = L0_61.getAttribute
  L0_61 = L0_61(dhcpTable, "_ROWID_", "1", _UPVALUE0_.secondaryDnsServer)
  if L0_61 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1, L0_61
end
function secondaryDnsServerGetNext(A0_62)
  local L2_63
  L2_63 = _UPVALUE0_
  L2_63 = L2_63.NOT_SUPPORTED
  return L2_63, 1
end
function secondaryDnsServerSet(A0_64)
  local L1_65, L2_66, L3_67, L4_68, L5_69, L6_70, L7_71
  L1_65 = _UPVALUE0_
  L1_65 = L1_65.ipv6ModeGet
  L3_67 = L1_65()
  L4_68 = tonumber
  L5_69 = L3_67
  L4_68 = L4_68(L5_69)
  if L4_68 ~= 3 then
    L4_68 = _UPVALUE1_
    L4_68 = L4_68.NOT_SUPPORTED
    return L4_68
  end
  L4_68 = nil
  L5_69 = isdhcpServerEnabled
  L7_71 = L5_69()
  if tonumber(L7_71) == 0 then
    return _UPVALUE1_.NOT_SUPPORTED, 1
  end
  if A0_64 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  L4_68 = _UPVALUE2_.ipAddressCheck(10, A0_64)
  if L4_68 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttribute(dhcpTable, "_ROWID_", 1, _UPVALUE3_.secondaryDnsServer, A0_64) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1
end
function leaseTimeGet()
  local L0_72
  L0_72 = db
  L0_72 = L0_72.getAttribute
  L0_72 = L0_72(dhcpTable, "_ROWID_", "1", _UPVALUE0_.leaseTime)
  if L0_72 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1, L0_72
end
function leaseTimeGetNext(A0_73)
  local L2_74
  L2_74 = _UPVALUE0_
  L2_74 = L2_74.NOT_SUPPORTED
  return L2_74, A0_73
end
function leaseTimeSet(A0_75)
  local L1_76, L2_77, L3_78, L4_79, L5_80, L6_81
  L1_76 = _UPVALUE0_
  L1_76 = L1_76.ipv6ModeGet
  L3_78 = L1_76()
  L4_79 = tonumber
  L5_80 = L3_78
  L4_79 = L4_79(L5_80)
  if L4_79 ~= 3 then
    L4_79 = _UPVALUE1_
    L4_79 = L4_79.NOT_SUPPORTED
    return L4_79
  end
  L4_79 = isdhcpServerEnabled
  L6_81 = L4_79()
  if tonumber(L6_81) == 0 then
    return _UPVALUE1_.NOT_SUPPORTED, 1
  end
  if A0_75 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if tonumber(A0_75) < 0 or tonumber(A0_75) > 604800 then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttribute(dhcpTable, "_ROWID_", 1, _UPVALUE2_.leaseTime, A0_75) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1
end
function isprefixDelegationEnabled()
  local L0_82
  L0_82 = db
  L0_82 = L0_82.getAttribute
  L0_82 = L0_82(dhcpTable, "_ROWID_", "1", _UPVALUE0_.prefixDelegation)
  if L0_82 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L0_82
end
function isprefixDelegationEnabledNext(A0_83)
  local L2_84
  L2_84 = _UPVALUE0_
  L2_84 = L2_84.NOT_SUPPORTED
  return L2_84, 1
end
function prefixDelegationEnable()
  local L0_85, L1_86, L2_87, L3_88, L4_89, L5_90
  L0_85 = _UPVALUE0_
  L0_85 = L0_85.ipv6ModeGet
  L2_87 = L0_85()
  L3_88 = tonumber
  L4_89 = L2_87
  L3_88 = L3_88(L4_89)
  if L3_88 ~= 3 then
    L3_88 = _UPVALUE1_
    L3_88 = L3_88.NOT_SUPPORTED
    return L3_88
  end
  L3_88 = isdhcpServerEnabled
  L5_90 = L3_88()
  if tonumber(L5_90) == 0 then
    return _UPVALUE1_.NOT_SUPPORTED, 1
  end
  if db.setAttribute(dhcpTable, "_ROWID_", 1, _UPVALUE2_.prefixDelegation, STATUS_ENABLE) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1
end
function prefixDelegationDisable()
  local L0_91, L1_92, L2_93, L3_94, L4_95, L5_96
  L0_91 = _UPVALUE0_
  L0_91 = L0_91.ipv6ModeGet
  L2_93 = L0_91()
  L3_94 = tonumber
  L4_95 = L2_93
  L3_94 = L3_94(L4_95)
  if L3_94 ~= 3 then
    L3_94 = _UPVALUE1_
    L3_94 = L3_94.NOT_SUPPORTED
    return L3_94
  end
  L3_94 = isdhcpServerEnabled
  L5_96 = L3_94()
  if tonumber(L5_96) == 0 then
    return _UPVALUE1_.NOT_SUPPORTED, 1
  end
  if db.setAttribute(dhcpTable, "_ROWID_", 1, _UPVALUE2_.prefixDelegation, STATUS_DISABLE) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, 1
  end
  return _UPVALUE1_.SUCCESS, 1
end
function prefixGet()
  local L0_97, L1_98, L2_99, L3_100
  L0_97 = _UPVALUE0_
  L0_97 = L0_97.logicalIfName
  L1_98 = " = 'LAN' AND "
  L2_99 = _UPVALUE0_
  L2_99 = L2_99.addrFamily
  L3_100 = " = 10"
  L0_97 = L0_97 .. L1_98 .. L2_99 .. L3_100
  L1_98 = db
  L1_98 = L1_98.getRowWhere
  L2_99 = staticTable
  L3_100 = L0_97
  L1_98 = L1_98(L2_99, L3_100)
  L2_99 = _UPVALUE1_
  L2_99 = L2_99.NIL
  if L1_98 == L2_99 then
    L2_99 = _UPVALUE1_
    L2_99 = L2_99.FAILURE
    return L2_99
  end
  L2_99 = staticTable
  L3_100 = "."
  L2_99 = L2_99 .. L3_100 .. _UPVALUE0_.prefix
  L2_99 = L1_98[L2_99]
  L3_100 = _UPVALUE1_
  L3_100 = L3_100.NIL
  if L2_99 == L3_100 then
    L3_100 = _UPVALUE1_
    L3_100 = L3_100.FAILURE
    return L3_100
  end
  L3_100 = db
  L3_100 = L3_100.getAttributeWhere
  L3_100 = L3_100(staticTable, L0_97, "_ROWID_")
  return _UPVALUE1_.SUCCESS, L3_100, L2_99
end
function prefixGetNext(A0_101)
  local L2_102
  L2_102 = _UPVALUE0_
  L2_102 = L2_102.NOT_SUPPORTED
  return L2_102, A0_101
end
function prefixSet(A0_103)
  local L1_104, L2_105, L3_106, L4_107, L5_108, L6_109, L7_110, L8_111
  L2_105 = _UPVALUE0_
  L2_105 = L2_105.ipv6ModeGet
  L4_107 = L2_105()
  L5_108 = tonumber
  L6_109 = L4_107
  L5_108 = L5_108(L6_109)
  if L5_108 ~= 3 then
    L5_108 = _UPVALUE1_
    L5_108 = L5_108.NOT_SUPPORTED
    return L5_108
  end
  L5_108 = _UPVALUE1_
  L5_108 = L5_108.NIL
  if A0_103 == L5_108 then
    L5_108 = _UPVALUE1_
    L5_108 = L5_108.INVALID_ARGUMENT
    return L5_108
  end
  L5_108 = _UPVALUE2_
  L5_108 = L5_108.ipAddressCheck
  L6_109 = 10
  L7_110 = A0_103
  L5_108 = L5_108(L6_109, L7_110)
  L1_104 = L5_108
  L5_108 = _UPVALUE1_
  L5_108 = L5_108.SUCCESS
  if L1_104 ~= L5_108 then
    L5_108 = _UPVALUE1_
    L5_108 = L5_108.INVALID_ARGUMENT
    return L5_108
  end
  L5_108 = _UPVALUE3_
  L5_108 = L5_108.logicalIfName
  L6_109 = " = 'LAN' AND "
  L7_110 = _UPVALUE3_
  L7_110 = L7_110.addrFamily
  L8_111 = " = 10"
  L5_108 = L5_108 .. L6_109 .. L7_110 .. L8_111
  L6_109 = db
  L6_109 = L6_109.setAttributeWhere
  L7_110 = staticTable
  L8_111 = L5_108
  L7_110 = L6_109(L7_110, L8_111, _UPVALUE3_.prefix, A0_103)
  L8_111 = _UPVALUE1_
  L8_111 = L8_111.FALSE
  if L6_109 == L8_111 then
    L8_111 = _UPVALUE1_
    L8_111 = L8_111.FAILURE
    return L8_111
  end
  L8_111 = db
  L8_111 = L8_111.getAttributeWhere
  L8_111 = L8_111(staticTable, L5_108, "_ROWID_")
  return _UPVALUE1_.SUCCESS, L8_111
end
function prefixLengthGet()
  local L0_112, L1_113, L2_114, L3_115
  L0_112 = _UPVALUE0_
  L0_112 = L0_112.logicalIfName
  L1_113 = " = 'LAN' AND "
  L2_114 = _UPVALUE0_
  L2_114 = L2_114.addrFamily
  L3_115 = " = 10"
  L0_112 = L0_112 .. L1_113 .. L2_114 .. L3_115
  L1_113 = db
  L1_113 = L1_113.getRowWhere
  L2_114 = staticTable
  L3_115 = L0_112
  L1_113 = L1_113(L2_114, L3_115)
  L2_114 = _UPVALUE1_
  L2_114 = L2_114.NIL
  if L1_113 == L2_114 then
    L2_114 = _UPVALUE1_
    L2_114 = L2_114.FAILURE
    return L2_114
  end
  L2_114 = staticTable
  L3_115 = "."
  L2_114 = L2_114 .. L3_115 .. _UPVALUE0_.prefixLength
  L2_114 = L1_113[L2_114]
  L3_115 = _UPVALUE1_
  L3_115 = L3_115.NIL
  if L2_114 == L3_115 then
    L3_115 = _UPVALUE1_
    L3_115 = L3_115.FAILURE
    return L3_115
  end
  L3_115 = db
  L3_115 = L3_115.getAttributeWhere
  L3_115 = L3_115(staticTable, L0_112, "_ROWID_")
  return _UPVALUE1_.SUCCESS, L3_115, L2_114
end
function prefixLengthGetNext(A0_116)
  local L2_117
  L2_117 = _UPVALUE0_
  L2_117 = L2_117.NOT_SUPPORTED
  return L2_117, A0_116
end
function prefixLengthSet(A0_118)
  local L1_119, L2_120, L3_121, L4_122, L5_123, L6_124, L7_125, L8_126
  L1_119 = _UPVALUE0_
  L1_119 = L1_119.ipv6ModeGet
  L3_121 = L1_119()
  L4_122 = tonumber
  L5_123 = L3_121
  L4_122 = L4_122(L5_123)
  if L4_122 ~= 3 then
    L4_122 = _UPVALUE1_
    L4_122 = L4_122.NOT_SUPPORTED
    return L4_122
  end
  L4_122 = _UPVALUE1_
  L4_122 = L4_122.NIL
  if A0_118 == L4_122 then
    L4_122 = _UPVALUE1_
    L4_122 = L4_122.INVALID_ARGUMENT
    return L4_122
  end
  L4_122 = tonumber
  L5_123 = A0_118
  L4_122 = L4_122(L5_123)
  if L4_122 < 1 or L4_122 > 128 then
    L5_123 = _UPVALUE1_
    L5_123 = L5_123.INVALID_ARGUMENT
    return L5_123
  end
  L5_123 = _UPVALUE2_
  L5_123 = L5_123.logicalIfName
  L6_124 = " = 'LAN' AND "
  L7_125 = _UPVALUE2_
  L7_125 = L7_125.addrFamily
  L8_126 = " = 10"
  L5_123 = L5_123 .. L6_124 .. L7_125 .. L8_126
  L6_124 = db
  L6_124 = L6_124.setAttributeWhere
  L7_125 = staticTable
  L8_126 = L5_123
  L7_125 = L6_124(L7_125, L8_126, _UPVALUE2_.prefixLength, A0_118)
  L8_126 = _UPVALUE1_
  L8_126 = L8_126.FALSE
  if L6_124 == L8_126 then
    L8_126 = _UPVALUE1_
    L8_126 = L8_126.FAILURE
    return L8_126
  end
  L8_126 = db
  L8_126 = L8_126.getAttributeWhere
  L8_126 = L8_126(staticTable, L5_123, "_ROWID_")
  return _UPVALUE1_.SUCCESS, L8_126
end
function prefixGrpGet()
  local L0_127, L1_128, L2_129, L3_130, L4_131
  L0_127 = _UPVALUE0_
  L0_127 = L0_127.logicalIfName
  L1_128 = " = 'LAN' AND "
  L2_129 = _UPVALUE0_
  L2_129 = L2_129.addrFamily
  L3_130 = " = 10"
  L0_127 = L0_127 .. L1_128 .. L2_129 .. L3_130
  L1_128 = db
  L1_128 = L1_128.getRowWhere
  L2_129 = staticTable
  L3_130 = L0_127
  L1_128 = L1_128(L2_129, L3_130)
  L2_129 = _UPVALUE1_
  L2_129 = L2_129.NIL
  if L1_128 == L2_129 then
    L2_129 = _UPVALUE1_
    L2_129 = L2_129.FAILURE
    return L2_129
  end
  L2_129 = staticTable
  L3_130 = "."
  L4_131 = _UPVALUE0_
  L4_131 = L4_131.prefix
  L2_129 = L2_129 .. L3_130 .. L4_131
  L2_129 = L1_128[L2_129]
  L3_130 = staticTable
  L4_131 = "."
  L3_130 = L3_130 .. L4_131 .. _UPVALUE0_.prefixLength
  L3_130 = L1_128[L3_130]
  L4_131 = db
  L4_131 = L4_131.getAttributeWhere
  L4_131 = L4_131(staticTable, L0_127, "_ROWID_")
  return _UPVALUE1_.SUCCESS, L4_131, L2_129, L3_130
end
function prefixGrpGetNext(A0_132)
  return _UPVALUE0_.NOT_SUPPORTED
end
function prefixGrpSet(A0_133, A1_134)
  local L2_135, L3_136, L4_137, L5_138, L6_139, L7_140, L8_141, L9_142
  L2_135 = _UPVALUE0_
  L2_135 = L2_135.ipv6ModeGet
  L4_137 = L2_135()
  L5_138 = tonumber
  L6_139 = L4_137
  L5_138 = L5_138(L6_139)
  if L5_138 ~= 3 then
    L5_138 = _UPVALUE1_
    L5_138 = L5_138.IPV6MODE_NOT_ENABLED
    return L5_138
  end
  L5_138 = nil
  L6_139 = _UPVALUE2_
  L6_139 = L6_139.NIL
  if A0_133 == L6_139 then
    L6_139 = _UPVALUE3_
    L6_139 = L6_139.PREFIX_NIL
    return L6_139
  end
  L6_139 = _UPVALUE4_
  L6_139 = L6_139.ipAddressCheck
  L7_140 = 10
  L8_141 = A0_133
  L6_139 = L6_139(L7_140, L8_141)
  L5_138 = L6_139
  L6_139 = _UPVALUE2_
  L6_139 = L6_139.SUCCESS
  if L5_138 ~= L6_139 then
    L6_139 = _UPVALUE3_
    L6_139 = L6_139.INVALID_PREFIX
    return L6_139
  end
  L6_139 = _UPVALUE4_
  L6_139 = L6_139.ipv6AddressCheck
  L7_140 = A0_133
  L6_139 = L6_139(L7_140)
  returnCode = L6_139
  L6_139 = returnCode
  L7_140 = _UPVALUE2_
  L7_140 = L7_140.SUCCESS
  if L6_139 ~= L7_140 then
    L6_139 = returnCode
    return L6_139
  end
  L6_139 = _UPVALUE2_
  L6_139 = L6_139.NIL
  if A1_134 == L6_139 or A1_134 == "" then
    L6_139 = _UPVALUE3_
    L6_139 = L6_139.PREFIXLENGTH_NIL
    return L6_139
  end
  L6_139 = tonumber
  L7_140 = A1_134
  L6_139 = L6_139(L7_140)
  if L6_139 < 1 or L6_139 > 128 then
    L7_140 = _UPVALUE3_
    L7_140 = L7_140.INVALID_PREFIXLENGTH
    return L7_140
  end
  L7_140 = _UPVALUE5_
  L7_140 = L7_140.logicalIfName
  L8_141 = " = 'LAN' AND "
  L9_142 = _UPVALUE5_
  L9_142 = L9_142.addrFamily
  L7_140 = L7_140 .. L8_141 .. L9_142 .. " = 10"
  L8_141 = db
  L8_141 = L8_141.getAttributeWhere
  L9_142 = staticTable
  L8_141 = L8_141(L9_142, L7_140, "_ROWID_")
  L9_142 = {}
  L9_142[staticTable .. "." .. _UPVALUE5_.prefix] = A0_133
  L9_142[staticTable .. "." .. _UPVALUE5_.prefixLength] = A1_134
  if db.update(staticTable, L9_142, L8_141) == NIL then
    return _UPVALUE2_.FAILURE, L8_141
  end
  return _UPVALUE2_.SUCCESS, L8_141
end
function lanGet()
  local L0_143, L1_144, L2_145, L3_146, L4_147, L5_148, L6_149, L7_150, L8_151, L9_152
  L0_143 = db
  L0_143 = L0_143.getRow
  L1_144 = dhcpTable
  L2_145 = "_ROWID_ "
  L3_146 = 1
  L0_143 = L0_143(L1_144, L2_145, L3_146)
  L1_144 = _UPVALUE0_
  L1_144 = L1_144.NIL
  if L0_143 == L1_144 then
    L1_144 = _UPVALUE0_
    L1_144 = L1_144.FAILURE
    L2_145 = 1
    return L1_144, L2_145
  end
  L1_144 = dhcpTable
  L2_145 = "."
  L3_146 = _UPVALUE1_
  L3_146 = L3_146.dhcpServer
  L1_144 = L1_144 .. L2_145 .. L3_146
  L1_144 = L0_143[L1_144]
  L2_145 = dhcpTable
  L3_146 = "."
  L4_147 = _UPVALUE1_
  L4_147 = L4_147.dhcpServerMode
  L2_145 = L2_145 .. L3_146 .. L4_147
  L2_145 = L0_143[L2_145]
  L3_146 = dhcpTable
  L4_147 = "."
  L5_148 = _UPVALUE1_
  L5_148 = L5_148.dhcpDomainName
  L3_146 = L3_146 .. L4_147 .. L5_148
  L3_146 = L0_143[L3_146]
  L4_147 = dhcpTable
  L5_148 = "."
  L6_149 = _UPVALUE1_
  L6_149 = L6_149.dhcpServerPreference
  L4_147 = L4_147 .. L5_148 .. L6_149
  L4_147 = L0_143[L4_147]
  L5_148 = dhcpTable
  L6_149 = "."
  L7_150 = _UPVALUE1_
  L7_150 = L7_150.dhcpServerDnsType
  L5_148 = L5_148 .. L6_149 .. L7_150
  L5_148 = L0_143[L5_148]
  L6_149 = dhcpTable
  L7_150 = "."
  L8_151 = _UPVALUE1_
  L8_151 = L8_151.primaryDnsServer
  L6_149 = L6_149 .. L7_150 .. L8_151
  L6_149 = L0_143[L6_149]
  L7_150 = dhcpTable
  L8_151 = "."
  L9_152 = _UPVALUE1_
  L9_152 = L9_152.secondaryDnsServer
  L7_150 = L7_150 .. L8_151 .. L9_152
  L7_150 = L0_143[L7_150]
  L8_151 = dhcpTable
  L9_152 = "."
  L8_151 = L8_151 .. L9_152 .. _UPVALUE1_.leaseTime
  L8_151 = L0_143[L8_151]
  L9_152 = dhcpTable
  L9_152 = L9_152 .. "." .. _UPVALUE1_.prefixDelegation
  L9_152 = L0_143[L9_152]
  return _UPVALUE0_.SUCCESS, 1, L1_144, L2_145, L3_146, L4_147, L5_148, L6_149, L7_150, L8_151, L9_152
end
function lanGetNext(A0_153)
  local L2_154
  L2_154 = _UPVALUE0_
  L2_154 = L2_154.NOT_SUPPORTED
  return L2_154, 1
end
function lanSet(A0_155, A1_156, A2_157, A3_158, A4_159, A5_160, A6_161, A7_162, A8_163)
  local L9_164, L10_165, L11_166, L12_167, L13_168
  L9_164 = _UPVALUE0_
  L9_164 = L9_164.ipv6ModeGet
  L11_166 = L9_164()
  L12_167 = tonumber
  L13_168 = L11_166
  L12_167 = L12_167(L13_168)
  if L12_167 ~= 3 then
    L12_167 = _UPVALUE1_
    L12_167 = L12_167.IPV6MODE_NOT_ENABLED
    return L12_167
  end
  L12_167 = nil
  L13_168 = _UPVALUE2_
  L13_168 = L13_168.NIL
  if A0_155 == L13_168 then
    L13_168 = _UPVALUE3_
    L13_168 = L13_168.INVALID_DHCPV6_STATUS
    return L13_168
  end
  L13_168 = _UPVALUE4_
  L13_168 = L13_168.isBoolean
  L13_168 = L13_168(A0_155)
  L12_167 = L13_168
  L13_168 = _UPVALUE2_
  L13_168 = L13_168.SUCCESS
  if L12_167 ~= L13_168 then
    L13_168 = _UPVALUE3_
    L13_168 = L13_168.INVALID_DHCPV6_STATUS
    return L13_168
  end
  L13_168 = tonumber
  L13_168 = L13_168(A0_155)
  if L13_168 ~= 0 then
    L13_168 = tonumber
    L13_168 = L13_168(A0_155)
    if L13_168 ~= 1 then
      L13_168 = _UPVALUE3_
      L13_168 = L13_168.INVALID_DHCPV6_STATUS
      return L13_168
    end
  end
  L13_168 = tonumber
  L13_168 = L13_168(A0_155)
  if L13_168 == 1 then
    L13_168 = _UPVALUE2_
    L13_168 = L13_168.NIL
    if A1_156 == L13_168 then
      L13_168 = _UPVALUE3_
      L13_168 = L13_168.DHCPV6_MODE_NIL
      return L13_168
    end
  end
  L13_168 = tonumber
  L13_168 = L13_168(A0_155)
  if L13_168 == 1 then
    L13_168 = tonumber
    L13_168 = L13_168(A1_156)
    if L13_168 ~= STATELESS then
      L13_168 = tonumber
      L13_168 = L13_168(A1_156)
      if L13_168 ~= STATEFUL then
        L13_168 = _UPVALUE3_
        L13_168 = L13_168.INVALID_DHCPV6_MODE
        return L13_168
      end
    end
  end
  L13_168 = tonumber
  L13_168 = L13_168(A0_155)
  if L13_168 == 1 then
    L13_168 = _UPVALUE2_
    L13_168 = L13_168.NIL
    if A3_158 == L13_168 then
      L13_168 = _UPVALUE3_
      L13_168 = L13_168.DHCPV6_SERVER_PREF_NIL
      return L13_168
    end
  end
  L13_168 = tonumber
  L13_168 = L13_168(A0_155)
  if L13_168 == 1 then
    L13_168 = tonumber
    L13_168 = L13_168(A3_158)
    if L13_168 < 0 or L13_168 > 255 then
      return _UPVALUE3_.INVALID_DHCPV6_SERVER_PREF
    end
  end
  L13_168 = tonumber
  L13_168 = L13_168(A0_155)
  if L13_168 == 1 then
    L13_168 = _UPVALUE2_
    L13_168 = L13_168.NIL
    if A4_159 == L13_168 then
      L13_168 = _UPVALUE3_
      L13_168 = L13_168.DHCPV6_DNSTYPE_NIL
      return L13_168
    end
  end
  L13_168 = tonumber
  L13_168 = L13_168(A0_155)
  if L13_168 == 1 then
    L13_168 = tonumber
    L13_168 = L13_168(A4_159)
    if L13_168 ~= PROXY then
      L13_168 = tonumber
      L13_168 = L13_168(A4_159)
      if L13_168 ~= CUSTOM then
        L13_168 = tonumber
        L13_168 = L13_168(A4_159 ~= ISP)
        if L13_168 then
          L13_168 = _UPVALUE3_
          L13_168 = L13_168.INVALID_DHCPV6_DNSTYPE
          return L13_168
        end
      end
    end
  end
  L13_168 = tonumber
  L13_168 = L13_168(A0_155)
  if L13_168 == 1 then
    L13_168 = tonumber
    L13_168 = L13_168(A4_159)
    if L13_168 == CUSTOM then
      L13_168 = _UPVALUE2_
      L13_168 = L13_168.NIL
      if A5_160 == L13_168 then
        L13_168 = _UPVALUE3_
        L13_168 = L13_168.DHCPV6_PRI_DNS_NIL
        return L13_168
      end
    end
  end
  L13_168 = tonumber
  L13_168 = L13_168(A0_155)
  if L13_168 == 1 then
    L13_168 = tonumber
    L13_168 = L13_168(A4_159)
    if L13_168 ~= CUSTOM then
      L13_168 = _UPVALUE2_
      L13_168 = L13_168.NIL
      if A5_160 ~= L13_168 then
        L13_168 = _UPVALUE2_
        L13_168 = L13_168.DEPENDENCY_NOT_MET
        return L13_168
      end
    end
  end
  L13_168 = tonumber
  L13_168 = L13_168(A0_155)
  if L13_168 == 1 then
    L13_168 = tonumber
    L13_168 = L13_168(A4_159)
    if L13_168 == CUSTOM then
      L13_168 = _UPVALUE2_
      L13_168 = L13_168.NIL
      if A5_160 ~= L13_168 then
        L13_168 = _UPVALUE4_
        L13_168 = L13_168.ipAddressCheck
        L13_168 = L13_168(10, A5_160)
        L12_167 = L13_168
        L13_168 = _UPVALUE2_
        L13_168 = L13_168.SUCCESS
        if L12_167 ~= L13_168 then
          L13_168 = _UPVALUE3_
          L13_168 = L13_168.INVALID_DHCPV6_PRI_DNS
          return L13_168
        end
      end
    end
  end
  L13_168 = tonumber
  L13_168 = L13_168(A0_155)
  if L13_168 == 1 then
    L13_168 = tonumber
    L13_168 = L13_168(A4_159)
    if L13_168 == CUSTOM then
      L13_168 = _UPVALUE2_
      L13_168 = L13_168.NIL
      if A6_161 == L13_168 then
        L13_168 = _UPVALUE3_
        L13_168 = L13_168.DHCPV6_SEC_DNS_NIL
        return L13_168
      end
    end
  end
  L13_168 = tonumber
  L13_168 = L13_168(A0_155)
  if L13_168 == 1 then
    L13_168 = tonumber
    L13_168 = L13_168(A4_159)
    if L13_168 ~= CUSTOM then
      L13_168 = _UPVALUE2_
      L13_168 = L13_168.NIL
      if A6_161 ~= L13_168 then
        L13_168 = _UPVALUE2_
        L13_168 = L13_168.DEPENDENCY_NOT_MET
        return L13_168
      end
    end
  end
  L13_168 = tonumber
  L13_168 = L13_168(A0_155)
  if L13_168 == 1 then
    L13_168 = tonumber
    L13_168 = L13_168(A4_159)
    if L13_168 == CUSTOM then
      L13_168 = _UPVALUE2_
      L13_168 = L13_168.NIL
      if A6_161 ~= L13_168 then
        L13_168 = _UPVALUE4_
        L13_168 = L13_168.ipAddressCheck
        L13_168 = L13_168(10, A6_161)
        L12_167 = L13_168
        L13_168 = _UPVALUE2_
        L13_168 = L13_168.SUCCESS
        if L12_167 ~= L13_168 then
          L13_168 = _UPVALUE3_
          L13_168 = L13_168.INVALID_DHCPV6_SEC_DNS
          return L13_168
        end
      end
    end
  end
  L13_168 = tonumber
  L13_168 = L13_168(A0_155)
  if L13_168 == 1 then
    L13_168 = _UPVALUE2_
    L13_168 = L13_168.NIL
    if A7_162 == L13_168 then
      L13_168 = _UPVALUE3_
      L13_168 = L13_168.DHCPV6_LEASE_TIME_NIL
      return L13_168
    end
  end
  L13_168 = tonumber
  L13_168 = L13_168(A0_155)
  if L13_168 == 1 then
    L13_168 = tonumber
    L13_168 = L13_168(A7_162)
    if L13_168 ~= _UPVALUE2_.NIL then
      if L13_168 < 0 or L13_168 > 604800 then
        return _UPVALUE3_.INVALID_DHCPV6_LEASE_TIME
      end
    else
      return _UPVALUE3_.INVALID_DHCPV6_LEASE_TIME
    end
  end
  L13_168 = tonumber
  L13_168 = L13_168(A0_155)
  if L13_168 == 1 then
    L13_168 = _UPVALUE2_
    L13_168 = L13_168.NIL
    if A8_163 == L13_168 then
      L13_168 = _UPVALUE3_
      L13_168 = L13_168.DHCPV6_PREFIX_DEL_NIL
      return L13_168
    end
  end
  L13_168 = tonumber
  L13_168 = L13_168(A0_155)
  if L13_168 == 1 then
    L13_168 = _UPVALUE4_
    L13_168 = L13_168.isBoolean
    L13_168 = L13_168(A8_163)
    L12_167 = L13_168
    L13_168 = _UPVALUE2_
    L13_168 = L13_168.SUCCESS
    if L12_167 ~= L13_168 then
      L13_168 = _UPVALUE3_
      L13_168 = L13_168.INVALID_DHCPV6_PREFIX_DEL
      return L13_168
    end
  end
  L13_168 = {}
  L13_168[dhcpTable .. "." .. _UPVALUE5_.dhcpServer] = A0_155
  L13_168[dhcpTable .. "." .. _UPVALUE5_.dhcpServerMode] = A1_156
  L13_168[dhcpTable .. "." .. _UPVALUE5_.dhcpDomainName] = A2_157
  L13_168[dhcpTable .. "." .. _UPVALUE5_.dhcpServerPreference] = A3_158
  L13_168[dhcpTable .. "." .. _UPVALUE5_.dhcpServerDnsType] = A4_159
  L13_168[dhcpTable .. "." .. _UPVALUE5_.primaryDnsServer] = A5_160
  L13_168[dhcpTable .. "." .. _UPVALUE5_.secondaryDnsServer] = A6_161
  L13_168[dhcpTable .. "." .. _UPVALUE5_.leaseTime] = A7_162
  L13_168[dhcpTable .. "." .. _UPVALUE5_.prefixDelegation] = A8_163
  if db.update(dhcpTable, L13_168, 1) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, 1
  end
  return _UPVALUE2_.SUCCESS, 1
end
function lanCreate(A0_169, A1_170, A2_171, A3_172, A4_173, A5_174, A6_175, A7_176, A8_177, A9_178, A10_179)
  local L12_180
  L12_180 = _UPVALUE0_
  L12_180 = L12_180.NOT_SUPPORTED
  return L12_180, 1
end
function lanDelete(A0_181)
  local L2_182
  L2_182 = _UPVALUE0_
  L2_182 = L2_182.NOT_SUPPORTED
  return L2_182, 1
end
