local L0_0
L0_0 = module
L0_0("com.teamf1.core.vpn.gre", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/gre_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
greTable = "GRE"
;({}).tunnelName = "TunnelName"
;({}).ipAddress = "IpAddress"
;({}).subnetMask = "SubnetMask"
;({}).interfaceName = "InterfaceName"
;({}).remoteIP = "RemoteIp"
;({}).dpd = "DdpBrd"
;({}).dstIpAddr = "DstIpAddr"
;({}).routeNetMask = "RouteNetMask"
;({}).gwIpAddr = "GwIpAddr"
if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-1000" or UNIT_NAME == "DSR-1000N" then
elseif UNIT_NAME == "DSR-500AC" or UNIT_NAME == "DSR-500" or UNIT_NAME == "DSR-500N" then
elseif UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-250N" then
else
end
function tunnelNameGet()
  local L0_1, L1_2
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(greTable, "_ROWID_", "1", _UPVALUE0_.tunnelName)
  if L1_2 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_2
end
function tunnelNameGetNext(A0_3)
  local L1_4, L2_5, L3_6
  L3_6 = db
  L3_6 = L3_6.getAttribute
  L3_6 = L3_6(greTable, "_ROWID_", L2_5, _UPVALUE0_.tunnelName)
  if L3_6 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE, L2_5
  end
  return _UPVALUE1_.SUCCESS, L2_5, L3_6
end
function tunnelNameSet(A0_7, A1_8)
  local L2_9, L3_10, L4_11
  L3_10 = _UPVALUE0_
  L3_10 = L3_10.NIL
  if A1_8 == L3_10 then
    L3_10 = _UPVALUE0_
    L3_10 = L3_10.INVALID_ARGUMENT
    return L3_10
  end
  L3_10 = status
  L4_11 = _UPVALUE0_
  L4_11 = L4_11.NIL
  if L3_10 == L4_11 then
    L3_10 = _UPVALUE0_
    L3_10 = L3_10.FAILURE
    L4_11 = A0_7
    return L3_10, L4_11
  end
  L3_10 = _UPVALUE0_
  L3_10 = L3_10.SUCCESS
  L4_11 = A0_7
  return L3_10, L4_11
end
function tunnelNameDelete(A0_12, A1_13)
  local L2_14, L3_15, L4_16
  L3_15 = status
  L4_16 = _UPVALUE0_
  L4_16 = L4_16.NIL
  if L3_15 == L4_16 then
    L3_15 = _UPVALUE0_
    L3_15 = L3_15.FAILURE
    L4_16 = A0_12
    return L3_15, L4_16
  end
  L3_15 = _UPVALUE0_
  L3_15 = L3_15.SUCCESS
  L4_16 = A0_12
  return L3_15, L4_16
end
function ipAddressGet()
  local L0_17, L1_18
  L1_18 = db
  L1_18 = L1_18.getAttribute
  L1_18 = L1_18(greTable, "_ROWID_", "1", _UPVALUE0_.ipAddress)
  if L1_18 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_18
end
function ipAddressGetNext(A0_19)
  local L1_20, L2_21, L3_22
  L3_22 = db
  L3_22 = L3_22.getAttribute
  L3_22 = L3_22(greTable, "_ROWID_", L2_21, _UPVALUE0_.ipAddress)
  if L3_22 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE, L2_21
  end
  return _UPVALUE1_.SUCCESS, L2_21, L3_22
end
function ipAddressSet(A0_23, A1_24)
  local L2_25
  if A1_24 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_25 = _UPVALUE1_.ipAddressCheck("2", A1_24)
  if L2_25 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_23
  end
  return _UPVALUE0_.SUCCESS, A0_23
end
function subnetMaskGet()
  local L0_26, L1_27
  L1_27 = db
  L1_27 = L1_27.getAttribute
  L1_27 = L1_27(greTable, "_ROWID_", "1", _UPVALUE0_.subnetMask)
  if L1_27 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_27
end
function subnetMaskGetNext(A0_28)
  local L1_29, L2_30, L3_31
  L3_31 = db
  L3_31 = L3_31.getAttribute
  L3_31 = L3_31(greTable, "_ROWID_", L2_30, _UPVALUE0_.subnetMask)
  if L3_31 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE, L2_30
  end
  return _UPVALUE1_.SUCCESS, L2_30, L3_31
end
function subnetMaskSet(A0_32, A1_33)
  local L2_34
  if A1_33 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_34 = _UPVALUE1_.ipAddressCheck("2", A1_33)
  if L2_34 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_32
  end
  return _UPVALUE0_.SUCCESS, A0_32
end
function interfaceNameGet()
  local L0_35, L1_36
  L1_36 = db
  L1_36 = L1_36.getAttribute
  L1_36 = L1_36(greTable, "_ROWID_", "1", _UPVALUE0_.interfaceName)
  if L1_36 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_36
end
function interfaceNameGetNext(A0_37)
  local L1_38, L2_39, L3_40
  L3_40 = db
  L3_40 = L3_40.getAttribute
  L3_40 = L3_40(greTable, "_ROWID_", L2_39, _UPVALUE0_.interfaceName)
  if L3_40 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE, L2_39
  end
  return _UPVALUE1_.SUCCESS, L2_39, L3_40
end
function interfaceNameSet(A0_41, A1_42)
  local L2_43, L3_44, L4_45
  L3_44 = _UPVALUE0_
  L3_44 = L3_44.NIL
  if A1_42 == L3_44 then
    L3_44 = _UPVALUE0_
    L3_44 = L3_44.INVALID_ARGUMENT
    return L3_44
  end
  if A1_42 ~= "WAN1" and A1_42 ~= "WAN2" and A1_42 ~= "WAN3" then
    L3_44 = _UPVALUE0_
    L3_44 = L3_44.INVALID_ARGUMENT
    return L3_44
  end
  L3_44 = status
  L4_45 = _UPVALUE0_
  L4_45 = L4_45.NIL
  if L3_44 == L4_45 then
    L3_44 = _UPVALUE0_
    L3_44 = L3_44.FAILURE
    L4_45 = A0_41
    return L3_44, L4_45
  end
  L3_44 = _UPVALUE0_
  L3_44 = L3_44.SUCCESS
  L4_45 = A0_41
  return L3_44, L4_45
end
function remoteIPGet()
  local L0_46, L1_47
  L1_47 = db
  L1_47 = L1_47.getAttribute
  L1_47 = L1_47(greTable, "_ROWID_", "1", _UPVALUE0_.remoteIP)
  if L1_47 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_47
end
function remoteIPGetNext(A0_48)
  local L1_49, L2_50, L3_51
  L3_51 = db
  L3_51 = L3_51.getAttribute
  L3_51 = L3_51(greTable, "_ROWID_", L2_50, _UPVALUE0_.remoteIP)
  if L3_51 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE, L2_50
  end
  return _UPVALUE1_.SUCCESS, L2_50, L3_51
end
function remoteIPSet(A0_52, A1_53)
  local L2_54
  if A1_53 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_54 = _UPVALUE1_.ipAddressCheck("2", A1_53)
  if L2_54 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_52
  end
  return _UPVALUE0_.SUCCESS, A0_52
end
function isdpdEnabled()
  local L0_55, L1_56
  L1_56 = db
  L1_56 = L1_56.getAttribute
  L1_56 = L1_56(greTable, "_ROWID_", "1", _UPVALUE0_.dpd)
  if L1_56 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_56
end
function isdpdEnabledNext(A0_57)
  local L1_58, L2_59, L3_60
  L3_60 = db
  L3_60 = L3_60.getAttribute
  L3_60 = L3_60(greTable, "_ROWID_", L2_59, _UPVALUE0_.dpd)
  if L3_60 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE, L2_59
  end
  return _UPVALUE1_.SUCCESS, L2_59, L3_60
end
function dpdEnable(A0_61)
  local L1_62, L2_63, L3_64
  L2_63 = status
  L3_64 = _UPVALUE0_
  L3_64 = L3_64.NIL
  if L2_63 == L3_64 then
    L2_63 = _UPVALUE0_
    L2_63 = L2_63.FAILURE
    L3_64 = A0_61
    return L2_63, L3_64
  end
  L2_63 = _UPVALUE0_
  L2_63 = L2_63.SUCCESS
  L3_64 = A0_61
  return L2_63, L3_64
end
function dpdDisable(A0_65)
  local L1_66, L2_67, L3_68
  L2_67 = status
  L3_68 = _UPVALUE0_
  L3_68 = L3_68.NIL
  if L2_67 == L3_68 then
    L2_67 = _UPVALUE0_
    L2_67 = L2_67.FAILURE
    L3_68 = A0_65
    return L2_67, L3_68
  end
  L2_67 = _UPVALUE0_
  L2_67 = L2_67.SUCCESS
  L3_68 = A0_65
  return L2_67, L3_68
end
function dstIpAddrGet()
  local L0_69, L1_70
  L1_70 = db
  L1_70 = L1_70.getAttribute
  L1_70 = L1_70(greTable, "_ROWID_", "1", _UPVALUE0_.dstIpAddr)
  if L1_70 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_70
end
function dstIpAddrGetNext(A0_71)
  local L1_72, L2_73, L3_74
  L3_74 = db
  L3_74 = L3_74.getAttribute
  L3_74 = L3_74(greTable, "_ROWID_", L2_73, _UPVALUE0_.dstIpAddr)
  if L3_74 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE, L2_73
  end
  return _UPVALUE1_.SUCCESS, L2_73, L3_74
end
function dstIpAddrSet(A0_75, A1_76)
  local L2_77
  if A1_76 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_77 = _UPVALUE1_.ipAddressCheck("2", A1_76)
  if L2_77 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_75
  end
  return _UPVALUE0_.SUCCESS, A0_75
end
function routeNetMaskGet()
  local L0_78, L1_79
  L1_79 = db
  L1_79 = L1_79.getAttribute
  L1_79 = L1_79(greTable, "_ROWID_", "1", _UPVALUE0_.routeNetMask)
  if L1_79 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_79
end
function routeNetMaskGetNext(A0_80)
  local L1_81, L2_82, L3_83
  L3_83 = db
  L3_83 = L3_83.getAttribute
  L3_83 = L3_83(greTable, "_ROWID_", L2_82, _UPVALUE0_.routeNetMask)
  if L3_83 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE, L2_82
  end
  return _UPVALUE1_.SUCCESS, L2_82, L3_83
end
function routeNetMaskSet(A0_84, A1_85)
  local L2_86
  if A1_85 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_86 = _UPVALUE1_.ipAddressCheck("2", A1_85)
  if L2_86 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_84
  end
  return _UPVALUE0_.SUCCESS, A0_84
end
function gwIpAddrGet()
  local L0_87, L1_88
  L1_88 = db
  L1_88 = L1_88.getAttribute
  L1_88 = L1_88(greTable, "_ROWID_", "1", _UPVALUE0_.gwIpAddr)
  if L1_88 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_88
end
function gwIpAddrGetNext(A0_89)
  local L1_90, L2_91, L3_92
  L3_92 = db
  L3_92 = L3_92.getAttribute
  L3_92 = L3_92(greTable, "_ROWID_", L2_91, _UPVALUE0_.gwIpAddr)
  if L3_92 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE, L2_91
  end
  return _UPVALUE1_.SUCCESS, L2_91, L3_92
end
function gwIpAddrSet(A0_93, A1_94)
  local L2_95
  if A1_94 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_95 = _UPVALUE1_.ipAddressCheck("2", A1_94)
  if L2_95 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_93
  end
  return _UPVALUE0_.SUCCESS, A0_93
end
function greGet()
  local L0_96, L1_97, L2_98
  L0_96 = status
  L1_97 = _UPVALUE0_
  L1_97 = L1_97.NIL
  if L0_96 == L1_97 then
    L0_96 = _UPVALUE0_
    L0_96 = L0_96.FAILURE
    return L0_96
  end
  L0_96 = _UPVALUE0_
  L0_96 = L0_96.SUCCESS
  L1_97 = 1
  L2_98 = gre
  return L0_96, L1_97, L2_98
end
function greGetNext(A0_99)
  local L1_100, L2_101, L3_102, L4_103
  L2_101 = status
  L3_102 = _UPVALUE0_
  L3_102 = L3_102.NIL
  if L2_101 == L3_102 then
    L2_101 = _UPVALUE0_
    L2_101 = L2_101.FAILURE
    L3_102 = A0_99
    return L2_101, L3_102
  end
  L2_101 = _UPVALUE0_
  L2_101 = L2_101.SUCCESS
  L3_102 = L1_100
  L4_103 = gre
  return L2_101, L3_102, L4_103
end
function greSet(A0_104, A1_105, A2_106, A3_107, A4_108, A5_109, A6_110, A7_111, A8_112, A9_113)
  local L10_114, L11_115
  L10_114 = _UPVALUE0_
  L10_114 = L10_114.NIL
  if A0_104 ~= L10_114 then
    L10_114 = tonumber
    L11_115 = A0_104
    L10_114 = L10_114(L11_115)
    L11_115 = _UPVALUE0_
    L11_115 = L11_115.NIL
  elseif L10_114 == L11_115 then
    L10_114 = _UPVALUE0_
    L10_114 = L10_114.INVALID_ARGUMENT
    return L10_114
  end
  L10_114 = db
  L10_114 = L10_114.existsRow
  L11_115 = greTable
  L10_114 = L10_114(L11_115, _UPVALUE1_, A0_104)
  L11_115 = _UPVALUE0_
  L11_115 = L11_115.FALSE
  if L10_114 == L11_115 then
    L10_114 = _UPVALUE2_
    L10_114 = L10_114.GRE_INVALID_COOKIE
    return L10_114
  end
  L10_114 = {}
  L11_115 = nil
  if A1_105 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L10_114[greTable .. "." .. _UPVALUE3_.tunnelName] = A1_105
  if A2_106 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L11_115 = _UPVALUE4_.ipAddressCheck("2", A2_106)
  if L11_115 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L10_114[greTable .. "." .. _UPVALUE3_.ipAddress] = A2_106
  if A3_107 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L11_115 = _UPVALUE4_.ipAddressCheck("2", A3_107)
  if L11_115 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L10_114[greTable .. "." .. _UPVALUE3_.subnetMask] = A3_107
  if A4_108 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A4_108 ~= "WAN1" and A4_108 ~= "WAN2" and A4_108 ~= "WAN3" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L10_114[greTable .. "." .. _UPVALUE3_.interfaceName] = A4_108
  if A5_109 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L11_115 = _UPVALUE4_.ipAddressCheck("2", A5_109)
  if L11_115 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L10_114[greTable .. "." .. _UPVALUE3_.remoteIP] = A5_109
  if A6_110 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L11_115 = _UPVALUE4_.booleanCheck(A6_110)
  if L11_115 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L10_114[greTable .. "." .. _UPVALUE3_.dpd] = A6_110
  if A7_111 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L11_115 = _UPVALUE4_.ipAddressCheck("2", A7_111)
  if L11_115 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L10_114[greTable .. "." .. _UPVALUE3_.dstIpAddr] = A7_111
  if A8_112 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L11_115 = _UPVALUE4_.ipAddressCheck("2", A8_112)
  if L11_115 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L10_114[greTable .. "." .. _UPVALUE3_.routeNetMask] = A8_112
  if A9_113 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L11_115 = _UPVALUE4_.ipAddressCheck("2", A9_113)
  if L11_115 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L10_114[greTable .. "." .. _UPVALUE3_.gwIpAddr] = A9_113
  if db.update(greTable, L10_114, A0_104) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_104
  end
  return _UPVALUE0_.SUCCESS, A0_104
end
function greCreate(A0_116, A1_117, A2_118, A3_119, A4_120, A5_121, A6_122, A7_123, A8_124)
  local L9_125, L10_126, L11_127, L12_128, L13_129
  L9_125 = db
  L9_125 = L9_125.getTable
  L10_126 = greTable
  L9_125 = L9_125(L10_126)
  if L9_125 ~= nil then
    L10_126 = #L9_125
    L11_127 = _UPVALUE0_
    if L10_126 >= L11_127 then
      L10_126 = _UPVALUE1_
      L10_126 = L10_126.MAX_LIMIT_REACHED
      return L10_126
    end
  end
  L10_126 = {}
  L11_127 = nil
  L12_128 = _UPVALUE2_
  L12_128 = L12_128.NIL
  if A0_116 == L12_128 then
    L12_128 = _UPVALUE2_
    L12_128 = L12_128.INVALID_ARGUMENT
    return L12_128
  end
  L12_128 = greTable
  L13_129 = "."
  L12_128 = L12_128 .. L13_129 .. _UPVALUE3_.tunnelName
  L10_126[L12_128] = A0_116
  L12_128 = _UPVALUE2_
  L12_128 = L12_128.NIL
  if A1_117 == L12_128 then
    L12_128 = _UPVALUE2_
    L12_128 = L12_128.INVALID_ARGUMENT
    return L12_128
  end
  L12_128 = _UPVALUE4_
  L12_128 = L12_128.ipAddressCheck
  L13_129 = "2"
  L12_128 = L12_128(L13_129, A1_117)
  L11_127 = L12_128
  L12_128 = _UPVALUE2_
  L12_128 = L12_128.SUCCESS
  if L11_127 ~= L12_128 then
    L12_128 = _UPVALUE2_
    L12_128 = L12_128.INVALID_ARGUMENT
    return L12_128
  end
  L12_128 = greTable
  L13_129 = "."
  L12_128 = L12_128 .. L13_129 .. _UPVALUE3_.ipAddress
  L10_126[L12_128] = A1_117
  L12_128 = _UPVALUE2_
  L12_128 = L12_128.NIL
  if A2_118 == L12_128 then
    L12_128 = _UPVALUE2_
    L12_128 = L12_128.INVALID_ARGUMENT
    return L12_128
  end
  L12_128 = _UPVALUE4_
  L12_128 = L12_128.ipAddressCheck
  L13_129 = "2"
  L12_128 = L12_128(L13_129, A2_118)
  L11_127 = L12_128
  L12_128 = _UPVALUE2_
  L12_128 = L12_128.SUCCESS
  if L11_127 ~= L12_128 then
    L12_128 = _UPVALUE2_
    L12_128 = L12_128.INVALID_ARGUMENT
    return L12_128
  end
  L12_128 = greTable
  L13_129 = "."
  L12_128 = L12_128 .. L13_129 .. _UPVALUE3_.subnetMask
  L10_126[L12_128] = A2_118
  L12_128 = _UPVALUE2_
  L12_128 = L12_128.NIL
  if A3_119 == L12_128 then
    L12_128 = _UPVALUE2_
    L12_128 = L12_128.INVALID_ARGUMENT
    return L12_128
  end
  if A3_119 ~= "WAN1" and A3_119 ~= "WAN2" and A3_119 ~= "WAN3" then
    L12_128 = _UPVALUE2_
    L12_128 = L12_128.INVALID_ARGUMENT
    return L12_128
  end
  L12_128 = greTable
  L13_129 = "."
  L12_128 = L12_128 .. L13_129 .. _UPVALUE3_.interfaceName
  L10_126[L12_128] = A3_119
  L12_128 = _UPVALUE2_
  L12_128 = L12_128.NIL
  if A4_120 == L12_128 then
    L12_128 = _UPVALUE2_
    L12_128 = L12_128.INVALID_ARGUMENT
    return L12_128
  end
  L12_128 = _UPVALUE4_
  L12_128 = L12_128.ipAddressCheck
  L13_129 = "2"
  L12_128 = L12_128(L13_129, A4_120)
  L11_127 = L12_128
  L12_128 = _UPVALUE2_
  L12_128 = L12_128.SUCCESS
  if L11_127 ~= L12_128 then
    L12_128 = _UPVALUE2_
    L12_128 = L12_128.INVALID_ARGUMENT
    return L12_128
  end
  L12_128 = greTable
  L13_129 = "."
  L12_128 = L12_128 .. L13_129 .. _UPVALUE3_.remoteIP
  L10_126[L12_128] = A4_120
  L12_128 = _UPVALUE2_
  L12_128 = L12_128.NIL
  if A5_121 == L12_128 then
    L12_128 = _UPVALUE2_
    L12_128 = L12_128.INVALID_ARGUMENT
    return L12_128
  end
  L12_128 = _UPVALUE4_
  L12_128 = L12_128.booleanCheck
  L13_129 = A5_121
  L12_128 = L12_128(L13_129)
  L11_127 = L12_128
  L12_128 = _UPVALUE2_
  L12_128 = L12_128.SUCCESS
  if L11_127 ~= L12_128 then
    L12_128 = _UPVALUE2_
    L12_128 = L12_128.INVALID_ARGUMENT
    return L12_128
  end
  L12_128 = greTable
  L13_129 = "."
  L12_128 = L12_128 .. L13_129 .. _UPVALUE3_.dpd
  L10_126[L12_128] = A5_121
  L12_128 = _UPVALUE2_
  L12_128 = L12_128.NIL
  if A6_122 == L12_128 then
    L12_128 = _UPVALUE2_
    L12_128 = L12_128.INVALID_ARGUMENT
    return L12_128
  end
  L12_128 = _UPVALUE4_
  L12_128 = L12_128.ipAddressCheck
  L13_129 = "2"
  L12_128 = L12_128(L13_129, A6_122)
  L11_127 = L12_128
  L12_128 = _UPVALUE2_
  L12_128 = L12_128.SUCCESS
  if L11_127 ~= L12_128 then
    L12_128 = _UPVALUE2_
    L12_128 = L12_128.INVALID_ARGUMENT
    return L12_128
  end
  L12_128 = greTable
  L13_129 = "."
  L12_128 = L12_128 .. L13_129 .. _UPVALUE3_.dstIpAddr
  L10_126[L12_128] = A6_122
  L12_128 = _UPVALUE2_
  L12_128 = L12_128.NIL
  if A7_123 == L12_128 then
    L12_128 = _UPVALUE2_
    L12_128 = L12_128.INVALID_ARGUMENT
    return L12_128
  end
  L12_128 = _UPVALUE4_
  L12_128 = L12_128.ipAddressCheck
  L13_129 = "2"
  L12_128 = L12_128(L13_129, A7_123)
  L11_127 = L12_128
  L12_128 = _UPVALUE2_
  L12_128 = L12_128.SUCCESS
  if L11_127 ~= L12_128 then
    L12_128 = _UPVALUE2_
    L12_128 = L12_128.INVALID_ARGUMENT
    return L12_128
  end
  L12_128 = greTable
  L13_129 = "."
  L12_128 = L12_128 .. L13_129 .. _UPVALUE3_.routeNetMask
  L10_126[L12_128] = A7_123
  L12_128 = _UPVALUE2_
  L12_128 = L12_128.NIL
  if A8_124 == L12_128 then
    L12_128 = _UPVALUE2_
    L12_128 = L12_128.INVALID_ARGUMENT
    return L12_128
  end
  L12_128 = _UPVALUE4_
  L12_128 = L12_128.ipAddressCheck
  L13_129 = "2"
  L12_128 = L12_128(L13_129, A8_124)
  L11_127 = L12_128
  L12_128 = _UPVALUE2_
  L12_128 = L12_128.SUCCESS
  if L11_127 ~= L12_128 then
    L12_128 = _UPVALUE2_
    L12_128 = L12_128.INVALID_ARGUMENT
    return L12_128
  end
  L12_128 = greTable
  L13_129 = "."
  L12_128 = L12_128 .. L13_129 .. _UPVALUE3_.gwIpAddr
  L10_126[L12_128] = A8_124
  L12_128 = db
  L12_128 = L12_128.insert
  L13_129 = greTable
  L12_128 = L12_128(L13_129, L10_126)
  L13_129 = _UPVALUE2_
  L13_129 = L13_129.NIL
  if L12_128 == L13_129 then
    L13_129 = _UPVALUE2_
    L13_129 = L13_129.FAILURE
    return L13_129
  end
  L13_129 = db
  L13_129 = L13_129.getAttributeWhere
  L13_129 = L13_129(greTable, _UPVALUE3_.tunnelName .. " ='" .. A0_116 .. "'", _UPVALUE5_)
  return _UPVALUE2_.SUCCESS, L13_129
end
function greDelete(A0_130)
  if A0_130 == _UPVALUE0_.NIL or tonumber(A0_130) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(greTable, _UPVALUE1_, A0_130) == _UPVALUE0_.FALSE then
    return _UPVALUE2_.GRE_INVALID_COOKIE
  end
  if db.deleteRow(greTable, _UPVALUE1_, A0_130) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_130
  end
  return _UPVALUE0_.SUCCESS, A0_130
end
function greGetAll()
  local L0_131
  L0_131 = db
  L0_131 = L0_131.getTable
  L0_131 = L0_131(greTable, false)
  if L0_131 == _UPVALUE0_.NIL then
    return _UPVALUE1_.GRE_TABLENIL
  end
  return _UPVALUE0_.SUCCESS, L0_131
end
function greDeleteAll()
  if db.deleteAllRows(greTable) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function greGetCur(A0_132)
  local L1_133, L2_134, L3_135, L4_136, L5_137, L6_138, L7_139, L8_140, L9_141, L10_142
  L1_133 = db
  L1_133 = L1_133.getRow
  L2_134 = greTable
  L3_135 = _UPVALUE0_
  L4_136 = A0_132
  L1_133 = L1_133(L2_134, L3_135, L4_136)
  L2_134 = _UPVALUE1_
  L2_134 = L2_134.NIL
  if L1_133 == L2_134 then
    L2_134 = _UPVALUE1_
    L2_134 = L2_134.FAILURE
    return L2_134
  end
  L2_134, L3_135, L4_136, L5_137, L6_138, L7_139, L8_140, L9_141, L10_142 = nil, nil, nil, nil, nil, nil, nil, nil, nil
  L2_134 = L1_133[greTable .. "." .. _UPVALUE2_.tunnelName]
  L3_135 = L1_133[greTable .. "." .. _UPVALUE2_.ipAddress]
  L4_136 = L1_133[greTable .. "." .. _UPVALUE2_.subnetMask]
  L5_137 = L1_133[greTable .. "." .. _UPVALUE2_.interfaceName]
  L6_138 = L1_133[greTable .. "." .. _UPVALUE2_.remoteIP]
  L7_139 = L1_133[greTable .. "." .. _UPVALUE2_.dpd]
  L8_140 = L1_133[greTable .. "." .. _UPVALUE2_.dstIpAddr]
  L9_141 = L1_133[greTable .. "." .. _UPVALUE2_.routeNetMask]
  L10_142 = L1_133[greTable .. "." .. _UPVALUE2_.gwIpAddr]
  return _UPVALUE1_.SUCCESS, L2_134, L3_135, L4_136, L5_137, L6_138, L7_139, L8_140, L9_141, L10_142
end
function greTunnelStatusGet()
  local L0_143, L1_144
  L0_143 = db
  L0_143 = L0_143.getTable
  L1_144 = greTable
  L0_143 = L0_143(L1_144, false)
  L1_144 = _UPVALUE0_
  L1_144 = L1_144.NIL
  if L0_143 == L1_144 then
    L1_144 = _UPVALUE0_
    L1_144 = L1_144.FAILURE
    return L1_144
  end
  L1_144 = {}
  for _FORV_6_, _FORV_7_ in pairs(L0_143) do
    L1_144[0 + 1] = {}
    L1_144[0 + 1][_UPVALUE1_.tunnelName] = L0_143[_FORV_6_][_UPVALUE1_.tunnelName]
    L1_144[0 + 1][_UPVALUE1_.gwIpAddr] = L0_143[_FORV_6_][_UPVALUE1_.gwIpAddr]
    L1_144[0 + 1][_UPVALUE1_.ipAddress] = L0_143[_FORV_6_][_UPVALUE1_.ipAddress]
    status = os.execute("/pfrm2.0/bin/doPing 4 " .. L0_143[_FORV_6_][_UPVALUE1_.ipAddress] .. " " .. L0_143[_FORV_6_][_UPVALUE1_.gwIpAddr] .. " /tmp/greStatus.txt")
    if status == 0 then
      L1_144[0 + 1].Status = "Connected"
    else
      L1_144[0 + 1].Status = "Disconnected"
    end
  end
  return _UPVALUE0_.SUCCESS, L1_144
end
