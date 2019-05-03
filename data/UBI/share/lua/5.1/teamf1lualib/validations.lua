local L0_0
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = module
L0_0("com.teamf1.core.validations", package.seeall)
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("validationsLuaLib")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
openvpnTable = "OpenVpn"
;({}).feature = "ServerEnable"
;({}).mode = "OpenVpnMode"
;({}).network = "OpenVpnNetwork"
;({}).networkMask = "OpenVpnNetmask"
;({}).LogicalIfName = "LogicalIfName"
;({}).AddressFamily = "AddressFamily"
;({}).StaticIp = "StaticIp"
;({}).NetMask = "NetMask"
;({}).feature = "Xl2tpdEnable"
;({}).startIPAddress = "StartIPAddress"
;({}).feature = "pptpdEnable"
;({}).startIPAddress = "startIPAddress"
function ipAddressCheck(A0_1, A1_2)
  local L2_3, L3_4
  L2_3 = validationsLuaLib
  L2_3 = L2_3.ipAddressCheck
  L3_4 = A0_1
  L3_4 = L2_3(L3_4, A1_2)
  return L2_3, L3_4
end
function ipv4SubnetMaskGet(A0_5)
  local L1_6, L2_7
  L1_6 = validationsLuaLib
  L1_6 = L1_6.ipv4SubnetNumToMaskGet
  L2_7 = A0_5
  L2_7 = L1_6(L2_7)
  return L1_6, L2_7
end
function ipv4SingleMaskCheck(A0_8, A1_9, A2_10)
  local L3_11, L4_12
  L3_11 = validationsLuaLib
  L3_11 = L3_11.ipv4SingleMaskCheck
  L4_12 = A0_8
  L4_12 = L3_11(L4_12, A1_9, A2_10)
  return L3_11, L4_12
end
function ipv4DualMaskCheck(A0_13, A1_14, A2_15, A3_16)
  local L4_17, L5_18
  L4_17 = validationsLuaLib
  L4_17 = L4_17.ipv4DualMaskCheck
  L5_18 = A0_13
  L5_18 = L4_17(L5_18, A1_14, A2_15, A3_16)
  return L4_17, L5_18
end
function ipAddressRangesMatch(A0_19, A1_20, A2_21, A3_22)
  local L4_23, L5_24
  L4_23 = validationsLuaLib
  L4_23 = L4_23.ipAddressRangesMatch
  L5_24 = A0_19
  L5_24 = L4_23(L5_24, A1_20, A2_21, A3_22)
  return L4_23, L5_24
end
function ipAddressRangeGet(A0_25, A1_26)
  local L2_27, L3_28, L4_29, L5_30, L6_31
  L2_27 = validationsLuaLib
  L2_27 = L2_27.ipAddressRangeGet
  L3_28 = A0_25
  L4_29 = A1_26
  L4_29 = L2_27(L3_28, L4_29)
  L5_30 = L2_27
  L6_31 = L3_28
  return L5_30, L6_31, L4_29
end
function ipv4IsIPinSameNetwork(A0_32, A1_33, A2_34, A3_35)
  local L4_36, L5_37
  L4_36 = validationsLuaLib
  L4_36 = L4_36.ipv4IsIPinSameNetwork
  L5_37 = A0_32
  L5_37 = L4_36(L5_37, A1_33, A2_34, A3_35)
  return L4_36, L5_37
end
function ipv4AddressesCompare(A0_38, A1_39)
  local L2_40, L3_41
  L2_40 = validationsLuaLib
  L2_40 = L2_40.ipv4AddressesCompare
  L3_41 = A0_38
  L3_41 = L2_40(L3_41, A1_39)
  return L2_40, L3_41
end
function ipv6SingleMaskCheck(A0_42, A1_43, A2_44)
  local L3_45, L4_46
  L3_45 = validationsLuaLib
  L3_45 = L3_45.ipv6SingleMaskCheck
  L4_46 = A0_42
  L4_46 = L3_45(L4_46, A1_43, A2_44)
  return L3_45, L4_46
end
function ipv6DualMaskCheck(A0_47, A1_48, A2_49, A3_50)
  local L4_51, L5_52
  L4_51 = validationsLuaLib
  L4_51 = L4_51.ipv6DualMaskCheck
  L5_52 = A0_47
  L5_52 = L4_51(L5_52, A1_48, A2_49, A3_50)
  return L4_51, L5_52
end
function ipv6AddressesCompare(A0_53, A1_54)
  local L2_55, L3_56
  L2_55 = validationsLuaLib
  L2_55 = L2_55.ipv6AddressesCompare
  L3_56 = A0_53
  L3_56 = L2_55(L3_56, A1_54)
  return L2_55, L3_56
end
function isMacAddress(A0_57)
  local L1_58, L2_59, L3_60, L4_61, L5_62, L6_63
  L1_58 = 0
  L2_59 = _UPVALUE0_
  L2_59 = L2_59.EMPTY
  macTable = L3_60
  if L3_60 ~= 6 then
    return L3_60, L4_61
  end
  for L6_63, _FORV_7_ in L3_60(L4_61) do
    if macTable[L6_63] == _UPVALUE0_.NIL or macTable[L6_63] == _UPVALUE0_.EMPTY then
      return _UPVALUE0_.ERROR, "ERR_MAC_EMPTY_VALUE_OCTET_" .. L6_63
    elseif string.len(macTable[L6_63]) ~= 2 then
      return _UPVALUE0_.ERROR, "ERR_TWOCHAR_OCTET_" .. L6_63
    elseif patternCheck(macTable[L6_63], "abcdefABCDEF%d") ~= 1 then
      return _UPVALUE0_.ERROR, "ERR_ONLYHEX_OCTET_" .. L6_63
    else
      L1_58 = _UPVALUE0_.SUCCESS
    end
  end
  return L3_60, L4_61
end
function stringLengthCheck(A0_64, A1_65, A2_66)
  if A2_66 == _UPVALUE0_.EMPTY or A2_66 == _UPVALUE0_.NIL then
    return _UPVALUE0_.ERROR
  end
  if tonumber(A0_64) <= A2_66.len(A2_66) and tonumber(A1_65) >= A2_66.len(A2_66) then
    return _UPVALUE0_.SUCCESS
  else
    return _UPVALUE0_.FAILURE
  end
end
function isEqual(A0_67, A1_68)
  local L2_69
  if A0_67 == A1_68 then
    L2_69 = _UPVALUE0_
    L2_69 = L2_69.SUCCESS
    return L2_69
  else
    L2_69 = _UPVALUE0_
    L2_69 = L2_69.FAILURE
    return L2_69
  end
end
function numberCompare(A0_70, A1_71)
  A0_70 = tonumber(A0_70)
  A1_71 = tonumber(A1_71)
  if A0_70 == _UPVALUE0_.NIL or A0_70 == _UPVALUE0_.EMPTY or A1_71 == _UPVALUE0_.NIL or A1_71 == _UPVALUE0_.EMPTY then
    return _UPVALUE0_.ERROR, "ERR_EMPTY_OR_BAD_VALUE_ENTERED"
  end
  return tonumber(A1_71 - A0_70)
end
function numberRangeCheck(A0_72, A1_73, A2_74)
  A2_74 = tonumber(A2_74)
  A0_72 = tonumber(A0_72)
  A1_73 = tonumber(A1_73)
  if A2_74 == _UPVALUE0_.NIL or A2_74 == _UPVALUE0_.EMPTY or A0_72 == _UPVALUE0_.NIL or A0_72 == _UPVALUE0_.EMPTY or A1_73 == _UPVALUE0_.NIL or A1_73 == _UPVALUE0_.EMPTY then
    return _UPVALUE0_.ERROR, "ERR_EMPTY_OR_BAD_VALUE_ENTERED"
  end
  if A2_74 > A1_73 or A2_74 < A0_72 then
    return _UPVALUE0_.FAILURE, "ERR_BOUND_INVALID_RANGE"
  else
    return _UPVALUE0_.SUCCESS
  end
end
function patternCheck(A0_75, A1_76, A2_77)
  local L3_78
  L3_78 = 0
  if A0_75 == _UPVALUE0_.NIL then
    return _UPVALUE0_.ERROR, "ERR_EMPTY_VALUE_ENTERED"
  end
  if A2_77 ~= _UPVALUE0_.NIL then
    for _FORV_7_, _FORV_8_ in string.gmatch(A0_75, "[" .. A1_76 .. "]") do
      num = num + 1
    end
    if num ~= A2_77 and A2_77 ~= _UPVALUE0_.NIL then
      L3_78 = _UPVALUE0_.FAILURE
    end
  elseif string.find(A0_75, "[" .. A1_76 .. "]") then
    L3_78 = _UPVALUE0_.FAILURE
  else
    L3_78 = _UPVALUE0_.SUCCESS
  end
  return L3_78
end
function isNumber(A0_79)
  A0_79 = tonumber(A0_79)
  if A0_79 == _UPVALUE0_.EMPTY or A0_79 == _UPVALUE0_.NIL then
    return _UPVALUE0_.ERROR, "ERR_EMPTY_OR_BAD_VALUE_ENTERED"
  end
  return _UPVALUE0_.SUCCESS
end
function isBoolean(A0_80)
  A0_80 = tonumber(A0_80)
  if A0_80 == _UPVALUE0_.EMPTY or A0_80 == _UPVALUE0_.NIL then
    return _UPVALUE0_.ERROR, "ERR_EMPTY_OR_BAD_VALUE_ENTERED"
  elseif A0_80 == 1 or A0_80 == 0 then
    return _UPVALUE0_.SUCCESS
  end
  return _UPVALUE0_.FAILURE
end
function split(A0_81, A1_82)
  local L2_83, L3_84, L5_85
  if A1_82 == "" then
    L2_83 = _UPVALUE0_
    L2_83 = L2_83.ERROR
    return L2_83
  end
  L2_83 = 0
  L3_84 = {}
  for _FORV_7_, _FORV_8_ in function()
    return string.find(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, true)
  end, nil, nil do
    table.insert(L3_84, string.sub(A0_81, L2_83, _FORV_7_ - 1))
    L2_83 = _FORV_8_ + 1
  end
  L5_85(L3_84, string.sub(A0_81, L2_83))
  return L3_84
end
function fqdnCheck(A0_86)
  return _UPVALUE0_.SUCCESS
end
function booleanCheck(A0_87)
  if tonumber(A0_87) == _UPVALUE0_.EMPTY or tonumber(A0_87) == _UPVALUE0_.NIL then
    return _UPVALUE0_.ERROR
  elseif tonumber(A0_87) == 1 or tonumber(A0_87) == 0 then
    return _UPVALUE0_.SUCCESS
  else
    return _UPVALUE0_.FAILURE
  end
end
function urlCheck(A0_88)
  local L1_89, L2_90, L3_91, L4_92, L5_93, L6_94, L7_95, L8_96, L9_97
  L1_89 = false
  if A0_88 ~= nil then
    L2_90 = string
    L2_90 = L2_90.len
    L2_90 = L2_90(L3_91)
  elseif L2_90 > L3_91 then
    L2_90 = _UPVALUE0_
    L2_90 = L2_90.ERROR
    return L2_90
  end
  L2_90 = ""
  for L6_94 in L3_91(L4_92, L5_93) do
    L8_96 = L6_94
    L2_90 = L7_95 .. L8_96
  end
  if L3_91 then
    return L3_91
  end
  if L4_92 ~= "." then
    if L4_92 ~= "-" then
      if L4_92 ~= "." then
      end
    end
  elseif L4_92 == "-" then
    return L4_92
  end
  for L8_96, L9_97 in L5_93(L6_94) do
    if L3_91 < 1 or L3_91 > charInUrlAfterDot then
      return _UPVALUE0_.ERROR
    end
  end
  return L5_93
end
function ipv4Check(A0_98)
  local L1_99, L2_100, L3_101, L4_102, L5_103, L6_104, L7_105, L8_106, L9_107
  L1_99 = 4
  L2_100 = 0
  L3_101 = 255
  if A0_98 == nil then
    L4_102 = _UPVALUE0_
    L4_102 = L4_102.ERROR
    return L4_102
  else
    L4_102 = split
    L4_102 = L4_102(L5_103, L6_104)
    if L5_103 == L1_99 then
      for L8_106, L9_107 in L5_103(L6_104) do
        if L9_107:match("%a") or L9_107:match("%W") then
          return _UPVALUE0_.ERROR
        elseif L3_101 < tonumber(L9_107) or L2_100 > tonumber(L9_107) then
          return _UPVALUE0_.ERROR
        end
      end
    else
      return L5_103
    end
    return L5_103
  end
end
function macAddressCheck(A0_108)
  local L1_109, L2_110, L3_111, L4_112, L5_113, L6_114, L7_115, L8_116, L9_117
  L1_109 = 6
  L2_110 = 2
  if A0_108 == nil then
    L3_111 = _UPVALUE0_
    L3_111 = L3_111.ERROR
    return L3_111
  else
    L3_111 = "[abcdefABCDEF%d]"
    L4_112 = split
    L4_112 = L4_112(L5_113, L6_114)
    if L5_113 == L1_109 then
      for L8_116, L9_117 in L5_113(L6_114) do
        if string.len(L9_117) == L2_110 then
          for _FORV_15_ in L9_117:gmatch(L3_111) do
            ({})[1] = _FORV_15_
          end
          if ({})[1] == nil or ({})[2] == nil then
            return _UPVALUE0_.ERROR
          end
        else
          return _UPVALUE0_.ERROR
        end
      end
    else
      return L5_113
    end
    return L5_113
  end
end
function sslvpnIpSecSubnetIpCheck(A0_118, A1_119)
  local L2_120, L3_121, L4_122, L5_123, L6_124
  L3_121 = db
  L3_121 = L3_121.getAttribute
  L4_122 = "SSLVPNClientConf"
  L5_123 = "_ROWID_"
  L6_124 = 1
  L3_121 = L3_121(L4_122, L5_123, L6_124, "BeginClientAddress")
  L3_121 = L3_121 or ""
  L4_122 = ipv4DualMaskCheck
  L5_123 = A0_118
  L6_124 = A1_119
  L4_122 = L4_122(L5_123, L6_124, L3_121, "255.255.255.0")
  L2_120 = L4_122
  L4_122 = _UPVALUE0_
  L4_122 = L4_122.SUCCESS
  if L2_120 == L4_122 then
    return L2_120
  end
  L4_122 = db
  L4_122 = L4_122.getRow
  L5_123 = "IPsecDhcpClientIPRange"
  L6_124 = "_ROWID_"
  L4_122 = L4_122(L5_123, L6_124, "1")
  L4_122 = L4_122 or ""
  L5_123 = L4_122["IPsecDhcpClientIPRange.StartIPAddress"]
  L5_123 = L5_123 or ""
  L6_124 = L4_122["IPsecDhcpClientIPRange.SubnetMask"]
  L6_124 = L6_124 or ""
  L2_120 = ipv4DualMaskCheck(A0_118, A1_119, L5_123, L6_124)
  if L2_120 == _UPVALUE0_.SUCCESS then
    return L2_120
  end
  return _UPVALUE0_.FAILURE
end
function checkLanVlanSubnetRange(A0_125, A1_126)
  local L2_127, L3_128, L4_129, L5_130, L6_131
  L2_127 = "LogicalIfName LIKE 'LAN%' and "
  L3_128 = _UPVALUE0_
  L3_128 = L3_128.AddressFamily
  L4_129 = " = '"
  L5_130 = _UPVALUE1_
  L6_131 = "'"
  L2_127 = L2_127 .. L3_128 .. L4_129 .. L5_130 .. L6_131
  L3_128 = db
  L3_128 = L3_128.getRowsWhere
  L4_129 = "ipAddressTable"
  L5_130 = L2_127
  L3_128 = L3_128(L4_129, L5_130)
  L4_129, L5_130, L6_131 = nil, nil, nil
  if L3_128 == nil then
    return _UPVALUE2_.FAILURE
  end
  if #L3_128 == 0 or #L3_128 == "" then
    return _UPVALUE2_.FAILURE
  end
  for _FORV_10_, _FORV_11_ in pairs(L3_128) do
    L4_129 = _FORV_11_["ipAddressTable.ipAddress"]
    L5_130 = _FORV_11_["ipAddressTable.subnetMask"]
    L6_131 = ipv4DualMaskCheck(L4_129, L5_130, A0_125, A1_126)
    if L6_131 == _UPVALUE2_.SUCCESS then
      return _UPVALUE2_.SUCCESS
    end
  end
  return _UPVALUE2_.FAILURE
end
function checkWanSubnetRange(A0_132, A1_133)
  local L2_134, L3_135, L4_136, L5_137, L6_138, L7_139, L8_140, L9_141, L10_142, L11_143
  L6_138 = _UPVALUE0_
  L6_138 = L6_138.NIL
  if A0_132 ~= L6_138 then
    L6_138 = _UPVALUE0_
    L6_138 = L6_138.NIL
  elseif A1_133 == L6_138 then
    L6_138 = _UPVALUE0_
    L6_138 = L6_138.FAILURE
    return L6_138
  end
  L6_138 = "LogicalIfName = 'WAN1' and addressFamily = 2"
  L7_139 = "LogicalIfName = 'WAN2' and addressFamily = 2"
  L8_140 = "LogicalIfName = 'WAN1' and AddressFamily = 2"
  L9_141 = "LogicalIfName = 'WAN2' and AddressFamily = 2"
  L10_142 = nil
  L11_143 = db
  L11_143 = L11_143.getAttributeWhere
  L11_143 = L11_143("NimfConf", L8_140, "ConnectionType")
  if L11_143 == "ifStatic" then
    L3_135 = db.getRowWhere("ifStatic", L8_140)
    if L3_135 ~= "" and L3_135 ~= nil then
      L5_137 = L3_135["ifStatic.StaticIp"]
      L4_136 = L3_135["ifStatic.NetMask"]
      result = ipv4DualMaskCheck(A0_132, A1_133, L5_137, L4_136)
      if result == _UPVALUE0_.SUCCESS then
        return _UPVALUE0_.SUCCESS
      end
    end
  else
    L3_135 = db.getRowWhere("ipAddressTable", L6_138)
    L10_142 = db.getAttribute("networkInterface", "LogicalIfName", "WAN1", "IfStatus")
    if tonumber(L10_142) == 1 and L3_135 ~= "" and L3_135 ~= nil then
      L5_137 = L3_135["ipAddressTable.ipAddress"]
      L4_136 = L3_135["ipAddressTable.subnetMask"]
      result = ipv4DualMaskCheck(A0_132, A1_133, L5_137, L4_136)
      if result == _UPVALUE0_.SUCCESS then
        return _UPVALUE0_.SUCCESS
      end
    end
  end
  if UNIT_NAME == "DSR-1000N" or UNIT_NAME == "DSR-1000" or UNIT_NAME == "DSR-500N" or UNIT_NAME == "DSR-500" or UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-500AC" then
    L11_143 = db.getAttributeWhere("NimfConf", L9_141, "ConnectionType")
    if L11_143 == "ifStatic" then
      L3_135 = db.getRowWhere("ifStatic", L9_141)
      if L3_135 ~= "" and L3_135 ~= nil then
        L5_137 = L3_135["ifStatic.StaticIp"]
        L4_136 = L3_135["ifStatic.NetMask"]
        result = ipv4DualMaskCheck(A0_132, A1_133, L5_137, L4_136)
        if result == _UPVALUE0_.SUCCESS then
          return _UPVALUE0_.SUCCESS
        end
      end
    else
      L3_135 = db.getRowWhere("ipAddressTable", L7_139)
      L10_142 = db.getAttribute("networkInterface", "LogicalIfName", "WAN2", "IfStatus")
      if tonumber(L10_142) == 1 and L3_135 ~= "" and L3_135 ~= nil then
        L5_137 = L3_135["ipAddressTable.ipAddress"]
        L4_136 = L3_135["ipAddressTable.subnetMask"]
        result = ipv4DualMaskCheck(A0_132, A1_133, L5_137, L4_136)
        if result == _UPVALUE0_.SUCCESS then
          return _UPVALUE0_.SUCCESS
        end
      end
    end
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.FAILURE
end
function checkIpSecSubnetRange(A0_144, A1_145)
  local L2_146, L3_147, L4_148, L5_149, L6_150
  L3_147 = "_ROWID_ = 1"
  L4_148 = db
  L4_148 = L4_148.getRowWhere
  L5_149 = "IPsecDhcpClientIPRange"
  L6_150 = L3_147
  L4_148 = L4_148(L5_149, L6_150)
  if L4_148 ~= "" and L4_148 ~= nil then
    L5_149, L6_150 = nil, nil
    L5_149 = L4_148["IPsecDhcpClientIPRange.StartIPAddress"]
    L6_150 = L4_148["IPsecDhcpClientIPRange.SubnetMask"]
    L2_146 = ipv4DualMaskCheck(A0_144, A1_145, L5_149, L6_150)
    if L2_146 == _UPVALUE0_.SUCCESS then
      return _UPVALUE0_.SUCCESS
    end
  end
  L5_149 = _UPVALUE0_
  L5_149 = L5_149.FAILURE
  return L5_149
end
function checkSslClientRange(A0_151, A1_152)
  local L2_153
  if db.getRowWhere("SSLVPNClientConf", _UPVALUE0_, _UPVALUE1_) ~= "" or db.getRowWhere("SSLVPNClientConf", _UPVALUE0_, _UPVALUE1_) ~= nil then
    sslSecStartIp = db.getRowWhere("SSLVPNClientConf", _UPVALUE0_, _UPVALUE1_)["SSLVPNClientConf.BeginClientAddress"]
    L2_153 = ipv4DualMaskCheck(A0_151, A1_152, sslSecStartIp, "255.255.255.0")
    if L2_153 == _UPVALUE2_.SUCCESS then
      return _UPVALUE2_.SUCCESS
    end
  end
  return _UPVALUE2_.FAILURE
end
function checkDmzSubnetRange(A0_154, A1_155)
  local L2_156, L3_157, L4_158, L5_159
  L2_156 = "LogicalIfName = 'DMZ'"
  L3_157 = db
  L3_157 = L3_157.getRowWhere
  L4_158 = "ifStatic"
  L5_159 = L2_156
  L3_157 = L3_157(L4_158, L5_159)
  if L3_157 ~= "" or L3_157 ~= nil then
    L4_158 = L3_157["ifStatic.StaticIp"]
    L5_159 = L3_157["ifStatic.NetMask"]
    if ipv4DualMaskCheck(A0_154, A1_155, L4_158, L5_159) == _UPVALUE0_.SUCCESS then
      return _UPVALUE0_.SUCCESS
    end
  end
  L4_158 = _UPVALUE0_
  L4_158 = L4_158.FAILURE
  return L4_158
end
function checkDmzWithLan(A0_160, A1_161)
  local L2_162, L3_163, L4_164, L5_165, L6_166, L7_167, L8_168, L9_169, L10_170
  L2_162 = "LogicalIfName != 'DMZ' and AddressFamily='2'"
  L3_163 = db
  L3_163 = L3_163.getRowsWhere
  L3_163 = L3_163(L4_164, L5_165)
  if L3_163 ~= "" and L3_163 ~= nil then
    for L7_167, L8_168 in L4_164(L5_165) do
      L9_169 = L8_168["ifStatic.StaticIp"]
      L10_170 = L8_168["ifStatic.NetMask"]
      if L9_169 ~= nil and L9_169 ~= "" and L9_169 ~= "0.0.0.0" and ipv4DualMaskCheck(A0_160, A1_161, L9_169, L10_170) == _UPVALUE0_.SUCCESS then
        return _UPVALUE0_.SUCCESS
      end
    end
  end
  return L4_164
end
function checkVlanIpRange(A0_171, A1_172)
  local L2_173, L3_174, L4_175, L5_176, L6_177, L7_178, L8_179, L9_180, L10_181
  L2_173 = "LogicalIfName != 'LAN' and AddressFamily='2'"
  L3_174 = db
  L3_174 = L3_174.getRowsWhere
  L3_174 = L3_174(L4_175, L5_176)
  if L3_174 ~= "" and L3_174 ~= nil then
    for L7_178, L8_179 in L4_175(L5_176) do
      L9_180 = L8_179["ifStatic.StaticIp"]
      L10_181 = L8_179["ifStatic.NetMask"]
      if L9_180 ~= nil and L9_180 ~= "" and L9_180 ~= "0.0.0.0" and ipv4DualMaskCheck(A0_171, A1_172, L9_180, L10_181) == _UPVALUE0_.SUCCESS then
        return _UPVALUE0_.SUCCESS
      end
    end
  end
  return L4_175
end
function is_ipv4_address(A0_182)
  local L1_183, L2_184, L3_185, L4_186, L5_187, L6_188, L7_189, L8_190, L9_191, L10_192
  L1_183 = 4
  L2_184 = 0
  L3_185 = 255
  if A0_182 ~= nil then
    L4_186 = type
    L5_187 = A0_182
    L4_186 = L4_186(L5_187)
  elseif L4_186 ~= "string" then
    L4_186 = false
    return L4_186
  end
  L4_186 = "^(%d+)%.(%d+)%.(%d+)%.(%d+)$"
  L5_187 = {
    [6] = L6_188(L7_189, L8_190)
  }
  L10_192 = L6_188(L7_189, L8_190)
  ;({
    [6] = L6_188(L7_189, L8_190)
  })[1] = L6_188
  ;({
    [6] = L6_188(L7_189, L8_190)
  })[2] = L7_189
  ;({
    [6] = L6_188(L7_189, L8_190)
  })[3] = L8_190
  ;({
    [6] = L6_188(L7_189, L8_190)
  })[4] = L9_191
  ;({
    [6] = L6_188(L7_189, L8_190)
  })[5] = L10_192
  if L5_187 == nil then
    return L6_188
  end
  if L6_188 ~= L1_183 then
    return L6_188
  end
  for L9_191, L10_192 in L6_188(L7_189) do
    if L2_184 > tonumber(L10_192) or L3_185 < tonumber(L10_192) then
      return false
    end
  end
  return L6_188
end
function is_fqdn_address(A0_193)
  local L1_194
  if A0_193 ~= nil then
    L1_194 = type
    L1_194 = L1_194(A0_193)
  elseif L1_194 ~= "string" then
    L1_194 = false
    return L1_194
  end
  L1_194 = "^[a-zA-Z0-9_%-%.]+[^.]$"
  if string.find(A0_193, L1_194) then
    return true
  end
  return false
end
function isDhcpReservedIPNotExist(A0_195, A1_196, A2_197, A3_198, A4_199)
  local L5_200, L6_201
  L5_200 = db
  L5_200 = L5_200.getRow
  L6_201 = "ifStatic"
  L5_200 = L5_200(L6_201, "LogicalIfName", A0_195)
  L6_201 = "LogicalIfName = '"
  L6_201 = L6_201 .. A0_195 .. "'"
  whereSet = L6_201
  L6_201 = db
  L6_201 = L6_201.getRowsWhere
  L6_201 = L6_201("DhcpfixedIpAddress", whereSet)
  valid = ipv4DualMaskCheck(A1_196, A2_197, L5_200["ifStatic.StaticIp"], L5_200["ifStatic.NetMask"])
  if valid ~= _UPVALUE0_.SUCCESS then
    if #L6_201 > 0 then
      return _UPVALUE0_.DELETE_DHCP_RESERVEDIP
    end
  elseif A3_198 ~= nil and A4_199 ~= nil then
    for _FORV_10_, _FORV_11_ in pairs(L6_201) do
      if validationsLuaLib.ipv4DhcpRangeCheck(A3_198, A4_199, _FORV_11_["DhcpfixedIpAddress.IpAddr"], A2_197) ~= _UPVALUE0_.SUCCESS then
        return _UPVALUE0_.DELETE_DHCP_RESERVEDIP
      end
    end
  end
  return _UPVALUE0_.SUCCESS
end
function checkSubnetMask(A0_202)
  if #split(A0_202, ".") ~= 4 or split(A0_202, ".")[1] == nil then
    return _UPVALUE0_.FAILURE
  end
  if validationsLuaLib.CIDRMaskValidityCheck(split(A0_202, ".")[1], split(A0_202, ".")[2], split(A0_202, ".")[3], split(A0_202, ".")[4]) == 0 then
    return _UPVALUE0_.SUCCESS
  end
  return _UPVALUE0_.FAILURE
end
function checkDmzDhcpSubnetRange(A0_203)
  local L1_204, L2_205, L3_206, L4_207
  L1_204 = "LogicalIfName = 'DMZ'"
  L2_205 = db
  L2_205 = L2_205.getRowWhere
  L3_206 = "ifStatic"
  L4_207 = L1_204
  L2_205 = L2_205(L3_206, L4_207)
  if L2_205 ~= "" or L2_205 ~= nil then
    L3_206 = L2_205["ifStatic.StaticIp"]
    L4_207 = L2_205["ifStatic.NetMask"]
    if ipv4SingleMaskCheck(A0_203, L3_206, L4_207) == _UPVALUE0_.SUCCESS then
      return _UPVALUE0_.SUCCESS
    end
  end
  L3_206 = _UPVALUE0_
  L3_206 = L3_206.FAILURE
  return L3_206
end
function checkIpv4Address(A0_208)
  local L1_209, L2_210
  L1_209 = is_ipv4_address
  L2_210 = A0_208
  L1_209 = L1_209(L2_210)
  L2_210 = nil
  if L1_209 ~= true then
    return false
  end
  L2_210 = split(A0_208, ".")
  if tonumber(L2_210[1]) > 0 and tonumber(L2_210[1]) < 224 and 0 < tonumber(L2_210[4]) and tonumber(L2_210[4]) < 255 then
    L1_209 = true
  else
    L1_209 = false
  end
  return L1_209
end
function checkFirewallIPAddress(A0_211)
  local L1_212, L2_213
  L1_212 = is_ipv4_address
  L2_213 = A0_211
  L1_212 = L1_212(L2_213)
  L2_213 = nil
  if L1_212 ~= true then
    return false
  end
  L2_213 = split(A0_211, ".")
  if tonumber(L2_213[1]) > 0 and tonumber(L2_213[1]) < 224 and 0 <= tonumber(L2_213[4]) and tonumber(L2_213[4]) <= 255 then
    L1_212 = true
  else
    L1_212 = false
  end
  return L1_212
end
function isMulticastMac(A0_214)
  if isMacAddress(A0_214) ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.ERROR
  end
  if string.sub(split(A0_214, ":")[1], 2, 2) == "1" or string.sub(split(A0_214, ":")[1], 2, 2) == "3" or string.sub(split(A0_214, ":")[1], 2, 2) == "5" or string.sub(split(A0_214, ":")[1], 2, 2) == "7" or string.sub(split(A0_214, ":")[1], 2, 2) == "9" or string.sub(split(A0_214, ":")[1], 2, 2) == "b" or string.sub(split(A0_214, ":")[1], 2, 2) == "d" or string.sub(split(A0_214, ":")[1], 2, 2) == "f" or string.sub(split(A0_214, ":")[1], 2, 2) == "B" or string.sub(split(A0_214, ":")[1], 2, 2) == "D" or string.sub(split(A0_214, ":")[1], 2, 2) == "F" then
    return true
  end
  return false
end
function checkVlanSubnetRange(A0_215, A1_216, A2_217)
  local L3_218, L4_219, L5_220, L6_221, L7_222, L8_223, L9_224, L10_225, L11_226, L12_227, L13_228, L14_229, L15_230
  L3_218 = "LogicalIfName LIKE 'LAN%'"
  L4_219 = db
  L4_219 = L4_219.getRowsWhere
  L5_220 = "ipAddressTable"
  L6_221 = L3_218
  L4_219 = L4_219(L5_220, L6_221)
  L5_220, L6_221, L7_222 = nil, nil, nil
  if L4_219 == nil then
    return L8_223
  end
  if L8_223 ~= 0 then
  elseif L8_223 == "" then
    return L8_223
  end
  for L11_226, L12_227 in L8_223(L9_224) do
    L13_228 = L12_227["ipAddressTable.LogicalIfName"]
    if L13_228 ~= "LAN" then
      L13_228, L14_229, L15_230 = nil, nil, nil
      L13_228 = L12_227["ipAddressTable.LogicalIfName"]
      if L13_228 ~= _UPVALUE0_.NIL then
        L15_230 = split(L13_228, "LAN")
        L14_229 = L15_230[2]
      end
      L5_220 = L12_227["ipAddressTable.ipAddress"]
      L6_221 = L12_227["ipAddressTable.subnetMask"]
      L7_222 = ipv4DualMaskCheck(L5_220, L6_221, A0_215, A1_216)
      if L7_222 == _UPVALUE0_.SUCCESS and L14_229 ~= A2_217 then
        return _UPVALUE0_.SUCCESS
      end
    else
      L5_220 = L12_227["ipAddressTable.ipAddress"]
      L6_221 = L12_227["ipAddressTable.subnetMask"]
      L13_228 = ipv4DualMaskCheck
      L14_229 = L5_220
      L15_230 = L6_221
      L13_228 = L13_228(L14_229, L15_230, A0_215, A1_216)
      L7_222 = L13_228
      L13_228 = _UPVALUE0_
      L13_228 = L13_228.SUCCESS
      if L7_222 == L13_228 then
        L13_228 = tonumber
        L14_229 = A2_217
        L13_228 = L13_228(L14_229)
        if L13_228 ~= 1 then
          L13_228 = _UPVALUE0_
          L13_228 = L13_228.SUCCESS
          return L13_228
        end
      end
    end
  end
  return L8_223
end
function checkVlanIPV6RangeCheck(A0_231, A1_232, A2_233)
  local L3_234, L4_235, L5_236, L6_237, L7_238, L8_239, L9_240, L10_241, L11_242, L12_243, L13_244, L14_245, L15_246
  L3_234 = "LogicalIfName LIKE 'LAN%' and addressFamily=10"
  L4_235 = db
  L4_235 = L4_235.getRowsWhere
  L5_236 = "ipAddressTable"
  L6_237 = L3_234
  L4_235 = L4_235(L5_236, L6_237)
  L5_236, L6_237, L7_238 = nil, nil, nil
  if L4_235 == nil then
    return L8_239
  end
  if L8_239 ~= 0 then
  elseif L8_239 == "" then
    return L8_239
  end
  for L11_242, L12_243 in L8_239(L9_240) do
    L13_244 = L12_243["ipAddressTable.LogicalIfName"]
    if L13_244 ~= "LAN" then
      L13_244, L14_245, L15_246 = nil, nil, nil
      L13_244 = L12_243["ipAddressTable.LogicalIfName"]
      if L13_244 ~= _UPVALUE0_.NIL then
        L15_246 = split(L13_244, "LAN")
        L14_245 = L15_246[2]
      end
      L5_236 = L12_243["ipAddressTable.ipAddress"]
      L6_237 = L12_243["ipAddressTable.ipv6PrefixLen"]
      L7_238 = ipv6DualMaskCheck(L5_236, L6_237, A0_231, A1_232)
      if L7_238 == _UPVALUE0_.SUCCESS and L14_245 ~= A2_233 then
        return _UPVALUE0_.SUCCESS
      end
    else
      L5_236 = L12_243["ipAddressTable.ipAddress"]
      L6_237 = L12_243["ipAddressTable.ipv6PrefixLen"]
      L13_244 = ipv6DualMaskCheck
      L14_245 = L5_236
      L15_246 = L6_237
      L13_244 = L13_244(L14_245, L15_246, A0_231, A1_232)
      L7_238 = L13_244
      L13_244 = _UPVALUE0_
      L13_244 = L13_244.SUCCESS
      if L7_238 == L13_244 then
        L13_244 = tonumber
        L14_245 = A2_233
        L13_244 = L13_244(L14_245)
        if L13_244 ~= 1 then
          L13_244 = _UPVALUE0_
          L13_244 = L13_244.SUCCESS
          return L13_244
        end
      end
    end
  end
  return L8_239
end
function checkLanSubnetRange(A0_247, A1_248)
  local L2_249, L3_250, L4_251, L5_252, L6_253
  L2_249 = "LogicalIfName = 'LAN'"
  L3_250 = db
  L3_250 = L3_250.getRow
  L4_251 = "ipAddressTable"
  L5_252 = "LogicalIfName"
  L6_253 = "LAN"
  L3_250 = L3_250(L4_251, L5_252, L6_253)
  L4_251, L5_252, L6_253 = nil, nil, nil
  if L3_250 == nil then
    return _UPVALUE0_.FAILURE
  end
  L4_251 = L3_250["ipAddressTable.ipAddress"]
  L5_252 = L3_250["ipAddressTable.subnetMask"]
  L6_253 = ipv4DualMaskCheck(L4_251, L5_252, A0_247, A1_248)
  if L6_253 == _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.SUCCESS
  end
  return _UPVALUE0_.FAILURE
end
function checkOpenVpnSubnetRange(A0_254, A1_255)
  local L2_256, L3_257, L4_258, L5_259, L6_260, L7_261
  L4_258 = db
  L4_258 = L4_258.getRow
  L5_259 = openvpnTable
  L6_260 = _UPVALUE0_
  L7_261 = _UPVALUE1_
  L4_258 = L4_258(L5_259, L6_260, L7_261)
  L5_259 = _UPVALUE2_
  L5_259 = L5_259.NIL
  if L4_258 == L5_259 then
    L5_259 = _UPVALUE2_
    L5_259 = L5_259.FAILURE
    return L5_259
  end
  L5_259 = openvpnTable
  L6_260 = "."
  L7_261 = _UPVALUE3_
  L7_261 = L7_261.feature
  L5_259 = L5_259 .. L6_260 .. L7_261
  L2_256 = L4_258[L5_259]
  L5_259 = openvpnTable
  L6_260 = "."
  L7_261 = _UPVALUE3_
  L7_261 = L7_261.mode
  L5_259 = L5_259 .. L6_260 .. L7_261
  L3_257 = L4_258[L5_259]
  L5_259 = _UPVALUE4_
  if L2_256 == L5_259 then
    L5_259 = _UPVALUE5_
    if L3_257 == L5_259 then
      L5_259 = db
      L5_259 = L5_259.getAttribute
      L6_260 = "openVpn"
      L7_261 = "_ROWID_"
      L5_259 = L5_259(L6_260, L7_261, 1, "OpenVpnNetwork")
      L6_260 = db
      L6_260 = L6_260.getAttribute
      L7_261 = "openVpn"
      L6_260 = L6_260(L7_261, "_ROWID_", 1, "OpenVpnNetmask")
      if L5_259 == nil or L6_260 == nil then
        L7_261 = _UPVALUE2_
        L7_261 = L7_261.FAILURE
        return L7_261
      end
      L7_261 = ipv4DualMaskCheck
      L7_261 = L7_261(A0_254, A1_255, L5_259, L6_260)
      if L7_261 == _UPVALUE2_.SUCCESS then
        return _UPVALUE2_.SUCCESS
      end
    end
  end
  L5_259 = db
  L5_259 = L5_259.getTable
  L6_260 = "OpenVpnGwRoutes"
  L5_259 = L5_259(L6_260)
  L6_260, L7_261 = nil, nil
  if L5_259 == nil then
    return _UPVALUE2_.FAILURE
  end
  if #L5_259 == 0 or #L5_259 == "" then
    return _UPVALUE2_.FAILURE
  end
  for _FORV_11_, _FORV_12_ in pairs(L5_259) do
    L6_260 = _FORV_12_["OpenVpnGwRoutes.Network"]
    L7_261 = _FORV_12_["OpenVpnGwRoutes.Netmask"]
    result = ipv4DualMaskCheck(A0_254, A1_255, L6_260, L7_261)
    if result == _UPVALUE2_.SUCCESS then
      return _UPVALUE2_.SUCCESS
    end
  end
  return _UPVALUE2_.FAILURE
end
function validateUrl(A0_262)
  local L1_263, L2_264, L3_265, L4_266, L5_267
  if A0_262 == L1_263 or A0_262 == "" then
    return L1_263
  end
  for L4_266, L5_267 in L1_263(L2_264) do
    if string.match(L5_267, "<") == "<" or string.match(L5_267, ">") == ">" then
      return 1
    end
  end
  return L1_263
end
function checkPptpSeverSubnetRange(A0_268, A1_269)
  local L2_270, L3_271
  L2_270 = db.getRow(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_)[_UPVALUE0_ .. "." .. _UPVALUE3_.feature]
  if L2_270 == _UPVALUE4_ then
    L3_271 = db.getRow(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_)[_UPVALUE0_ .. "." .. _UPVALUE3_.startIPAddress]
    if ipv4DualMaskCheck(A0_268, A1_269, L3_271, A1_269) == _UPVALUE5_.SUCCESS then
      return (ipv4DualMaskCheck(A0_268, A1_269, L3_271, A1_269))
    end
  else
    return _UPVALUE5_.FAILURE
  end
end
function checkL2tpSeverSubnetRange(A0_272, A1_273)
  local L2_274, L3_275
  L2_274 = db.getRow(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_)[_UPVALUE0_ .. "." .. _UPVALUE3_.feature]
  if L2_274 == _UPVALUE4_ then
    L3_275 = db.getRow(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_)[_UPVALUE0_ .. "." .. _UPVALUE3_.startIPAddress]
    if ipv4DualMaskCheck(A0_272, A1_273, L3_275, A1_273) == _UPVALUE5_.SUCCESS then
      return (ipv4DualMaskCheck(A0_272, A1_273, L3_275, A1_273))
    end
  else
    return _UPVALUE5_.FAILURE
  end
end
function ipv6AddressCheck(A0_276)
  if A0_276 == nil or A0_276 == "" or A0_276 == " " then
    return "Invalid Ipv6 Address"
  end
  if validationsLuaLib.ipAddressCheck("10", A0_276) ~= 0 then
    return validationsLuaLib.ipAddressCheck("10", A0_276)
  end
  if validationsLuaLib.ipv6AddressTypeCheck(A0_276) == "UNSPECIFIED" then
    return _UPVALUE0_.UNSPECIFIED_IPADDRESS
  elseif validationsLuaLib.ipv6AddressTypeCheck(A0_276) == "INVALID" then
    return _UPVALUE0_.INVALID_IPV6_ADDRESS
  elseif validationsLuaLib.ipv6AddressTypeCheck(A0_276) == "LOOPBACK" then
    return _UPVALUE0_.LOOPBACK_IPV6_ADDRESS
  elseif validationsLuaLib.ipv6AddressTypeCheck(A0_276) == "MULTICAST" or validationsLuaLib.ipv6AddressTypeCheck(A0_276) == "MULTICASTLINKLOCAL" or validationsLuaLib.ipv6AddressTypeCheck(A0_276) == "MULTICASTSITELOCAL" or validationsLuaLib.ipv6AddressTypeCheck(A0_276) == "MULTICASTORGANIZATIONLOCAL" or validationsLuaLib.ipv6AddressTypeCheck(A0_276) == "MULTICASTGLOBAL" then
    return _UPVALUE0_.MULTICAST_IPV6_ADDRESS
  end
  return _UPVALUE0_.SUCCESS
end
