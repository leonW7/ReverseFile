local L0_0, L1_1
L0_0 = {}
util = L0_0
L0_0 = false
_DEBUG_STATUS = L0_0
L0_0 = "<br>"
_DEBUG_OUTPUT = L0_0
L0_0 = false
_OUTPUT_STATUS = L0_0
L0_0 = "<br>"
_OUTPUT = L0_0
L0_0 = util
function L1_1(A0_2)
  local L1_3
  _DEBUG_STATUS = A0_2
end
L0_0.setDebugStatus = L1_1
L0_0 = util
function L1_1()
  local L0_4, L1_5
  L0_4 = _DEBUG_STATUS
  return L0_4
end
L0_0.getDebugStatus = L1_1
L0_0 = util
function L1_1(A0_6)
  if _DEBUG_STATUS then
    _DEBUG_OUTPUT = _DEBUG_OUTPUT .. A0_6
  end
end
L0_0.appendDebugOut = L1_1
L0_0 = util
function L1_1()
  local L0_7, L1_8
  L0_7 = _DEBUG_OUTPUT
  return L0_7
end
L0_0.getDebugOut = L1_1
L0_0 = util
function L1_1(A0_9)
  local L1_10
  _OUTPUT_STATUS = A0_9
end
L0_0.setOutputStatus = L1_1
L0_0 = util
function L1_1()
  local L0_11, L1_12
  L0_11 = _OUTPUT_STATUS
  return L0_11
end
L0_0.getOutputStatus = L1_1
L0_0 = util
function L1_1(A0_13)
  if _OUTPUT_STATUS then
    _OUTPUT = _OUTPUT .. A0_13
  end
end
L0_0.appendOut = L1_1
L0_0 = util
function L1_1()
  local L0_14, L1_15
  L0_14 = _OUTPUT
  return L0_14
end
L0_0.getOut = L1_1
L0_0 = util
function L1_1(A0_16)
  return io.open(A0_16, "r"):read("*all")
end
L0_0.fileToString = L1_1
L0_0 = util
function L1_1(A0_17)
  local L1_18
  L1_18 = io
  L1_18 = L1_18.open
  L1_18 = L1_18(A0_17)
  if L1_18 then
    io.close(L1_18)
    return true
  else
    return false
  end
end
L0_0.fileExists = L1_1
L0_0 = util
function L1_1(A0_19)
  local L1_20, L2_21, L3_22, L4_23, L5_24, L6_25
  if A0_19 == nil then
    L1_20 = "Nil table!"
    return L1_20
  end
  L1_20 = "----- Table: -----<br>"
  for L5_24, L6_25 in L2_21(L3_22) do
    L1_20 = L1_20 .. "Key = " .. L5_24 .. ", Value = " .. L6_25 .. "<br>"
  end
  return L2_21
end
L0_0.tableToString = L1_1
L0_0 = util
function L1_1(A0_26, A1_27)
  if table == nil then
    return "Nil table!"
  end
  return "----- Recusive Table: -----<br>" .. util.tableToStringRecHelper(A0_26, A1_27) .. "-------------------------------------<br>"
end
L0_0.tableToStringRec = L1_1
L0_0 = util
function L1_1(A0_28, A1_29)
  local L2_30, L3_31, L4_32, L5_33, L6_34, L7_35, L8_36
  L2_30 = ""
  L3_31 = A1_29 or ""
  for L7_35, L8_36 in L4_32(L5_33) do
    L2_30 = L2_30 .. L3_31 .. "[" .. tostring(L7_35) .. "]"
    if type(L8_36) == "table" then
      L2_30 = L2_30 .. [[
:
<br>]] .. util.tableToStringRecHelper(L8_36, L3_31 .. "&nbsp&nbsp&nbsp")
    else
      L2_30 = L2_30 .. " = " .. tostring(L8_36) .. [[

<br>]]
    end
  end
  return L2_30
end
L0_0.tableToStringRecHelper = L1_1
L0_0 = util
function L1_1(A0_37, A1_38)
  if A0_37 == nil then
    return nil
  end
  if A1_38 == nil then
    return A0_37
  end
  return (util.filterTable(A0_37, function(A0_39)
    for _FORV_4_, _FORV_5_ in pairs(_UPVALUE0_) do
      if A0_39 == _FORV_5_ then
        return false
      end
    end
    return true
  end))
end
L0_0.tableSubtract = L1_1
L0_0 = util
function L1_1(A0_40, A1_41)
  local L2_42, L3_43, L4_44, L5_45, L6_46, L7_47, L8_48, L9_49
  L2_42 = assert
  L3_43 = type
  L4_44 = A0_40
  L3_43 = L3_43(L4_44)
  L3_43 = L3_43 == "table"
  L2_42(L3_43)
  L2_42 = assert
  L3_43 = type
  L4_44 = A1_41
  L3_43 = L3_43(L4_44)
  L3_43 = L3_43 == "function"
  L2_42(L3_43)
  L2_42, L3_43 = nil, nil
  L4_44 = {}
  for L8_48, L9_49 in L5_45(L6_46) do
    if A1_41(L9_49) then
      table.insert(L4_44, L9_49)
    end
  end
  return L4_44
end
L0_0.filterTable = L1_1
L0_0 = util
function L1_1(A0_50, A1_51)
  local L2_52
  L2_52 = {}
  for _FORV_6_, _FORV_7_ in pairs(A0_50) do
    L2_52[_FORV_6_] = _FORV_7_
  end
  for _FORV_6_, _FORV_7_ in pairs(A1_51) do
    L2_52[_FORV_6_] = _FORV_7_
  end
  return L2_52
end
L0_0.tableAdd = L1_1
L0_0 = util
function L1_1(A0_53, A1_54)
  if A0_53 == nil or A1_54 == nil then
    return A0_53
  end
  for _FORV_5_, _FORV_6_ in pairs(A1_54) do
    A0_53[_FORV_5_] = _FORV_6_
  end
  return A0_53
end
L0_0.tableAppend = L1_1
L0_0 = util
function L1_1(A0_55, A1_56)
  local L2_57, L3_58, L5_59
  if A1_56 == "" then
    L2_57 = false
    return L2_57
  end
  L2_57 = 0
  L3_58 = {}
  for _FORV_7_, _FORV_8_ in function()
    return string.find(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, true)
  end, nil, nil do
    table.insert(L3_58, string.sub(A0_55, L2_57, _FORV_7_ - 1))
    L2_57 = _FORV_8_ + 1
  end
  L5_59(L3_58, string.sub(A0_55, L2_57))
  return L3_58
end
L0_0.split = L1_1
L0_0 = util
function L1_1(A0_60, A1_61)
  local L2_62, L3_63, L4_64, L5_65, L6_66, L7_67
  if not A0_60 then
    L2_62 = ""
    return L2_62
  end
  L2_62 = {}
  for L6_66, L7_67 in L3_63(L4_64) do
    if L6_66 >= 2 then
      L2_62 = L2_62 .. A1_61 .. L7_67
    else
      L2_62 = L7_67
    end
  end
  return L2_62
end
L0_0.join = L1_1
L0_0 = util
function L1_1(A0_68, A1_69, A2_70)
  local L3_71, L4_72, L5_73, L6_74, L7_75, L8_76
  L3_71 = {}
  L4_72 = {}
  for L8_76, _FORV_9_ in L5_73(L6_74) do
    L3_71 = util.split(L8_76, A1_69)
    if #L3_71 == 2 and L3_71[1] == A2_70 then
      L4_72[L3_71[1] .. "." .. L3_71[2]] = _FORV_9_
    end
  end
  if L5_73 > 0 then
    return L4_72
  else
    return L5_73
  end
end
L0_0.tableSplit = L1_1
L0_0 = util
function L1_1(A0_77, A1_78)
  local L2_79
  L2_79 = false
  for _FORV_6_, _FORV_7_ in pairs(A0_77) do
    if _FORV_6_ == A1_78 then
      return true
    end
  end
  return L2_79
end
L0_0.tableKeyExists = L1_1
L0_0 = util
function L1_1(A0_80, A1_81)
  local L2_82
  L2_82 = false
  for _FORV_6_, _FORV_7_ in pairs(A0_80) do
    if _FORV_7_ == A1_81 then
      return _FORV_6_
    end
  end
  return nil
end
L0_0.keyTableValueExists = L1_1
L0_0 = util
function L1_1(A0_83)
  if A0_83 == nil then
    return nil
  end
  for _FORV_5_, _FORV_6_ in pairs(A0_83) do
  end
  return 0 + 1
end
L0_0.tableSize = L1_1
L0_0 = util
function L1_1(A0_84, A1_85)
  local L2_86, L3_87, L4_88, L5_89, L6_90
  L2_86 = {}
  for L6_90 in L3_87(L4_88) do
    table.insert(L2_86, L6_90)
  end
  L3_87(L4_88, L5_89)
  return L4_88
end
L0_0.pairsByKeys = L1_1
L0_0 = util
function L1_1(A0_91)
  local L1_92, L2_93
  L1_92 = loadstring
  L2_93 = "return "
  L2_93 = L2_93 .. A0_91
  L1_92 = L1_92(L2_93)
  L2_93 = L1_92
  return L2_93()
end
L0_0.getLuaVariable = L1_1
L0_0 = util
function L1_1(A0_94, A1_95)
  local L2_96, L3_97
  L2_96 = 8192
  L3_97 = ""
  while true do
    L3_97 = A0_94:read(L2_96)
    if not L3_97 then
      break
    end
    assert(io.open(A1_95, "wb"):write(L3_97))
    assert(io.open(A1_95, "wb"):flush())
  end
  io.open(A1_95, "wb"):close()
  A0_94:close()
end
L0_0.copyFile = L1_1
L0_0 = util
function L1_1()
  return os.date("%A, %B %d, %Y, %X (GMT %z)")
end
L0_0.time = L1_1
L0_0 = util
function L1_1()
  local L0_98
  L0_98 = {}
  L0_98.month = os.date("%m")
  L0_98.date = os.date("%d")
  L0_98.year = os.date("%Y")
  L0_98.hours = os.date("%H")
  L0_98.minutes = os.date("%M")
  L0_98.seconds = os.date("%S")
  return L0_98
end
L0_0.date = L1_1
L0_0 = util
function L1_1()
  local L0_99, L1_100, L2_101, L3_102, L4_103, L5_104
  L0_99 = timeLib
  L0_99 = L0_99.uptime
  L1_100 = L0_99()
  L2_101 = math
  L2_101 = L2_101.floor
  L3_102 = L1_100 / 60
  L2_101 = L2_101(L3_102)
  L3_102 = L1_100 % 60
  L4_103 = math
  L4_103 = L4_103.floor
  L5_104 = L2_101 / 60
  L4_103 = L4_103(L5_104)
  L2_101 = L2_101 % 60
  L5_104 = math
  L5_104 = L5_104.floor
  L5_104 = L5_104(L4_103 / 24)
  L4_103 = L4_103 % 24
  L1_100 = L5_104 .. " days, " .. L4_103 .. " hours, " .. L2_101 .. " minutes, " .. L3_102 .. " seconds"
  return L1_100
end
L0_0.uptime = L1_1
L0_0 = util
function L1_1(A0_105)
  local L1_106, L2_107, L3_108
  L1_106 = {}
  L2_107 = 0
  L3_108 = -1
  while L3_108 ~= 0 do
    L3_108 = math.floor(A0_105 / 2)
    L2_107 = A0_105 % 2
    A0_105 = L3_108
    table.insert(L1_106, L2_107)
  end
  return L1_106
end
L0_0.integerToBits = L1_1
L0_0 = util
function L1_1(A0_109, A1_110, A2_111, A3_112, A4_113)
  local L5_114, L6_115
  L5_114 = {}
  L6_115 = 1
  while A4_113 >= L6_115 do
    table.insert(L5_114, A0_109[A1_110 .. A3_112 .. A2_111 .. L6_115])
    L6_115 = L6_115 + 1
  end
  return L5_114
end
L0_0.getPartialArray = L1_1
L0_0 = util
function L1_1(A0_116, A1_117, A2_118, A3_119, A4_120)
  local L5_121, L6_122
  L5_121 = ""
  L6_122 = 1
  while A4_120 >= L6_122 do
    L5_121 = L5_121 .. A0_116[A1_117 .. A3_119 .. A2_118 .. L6_122] .. A3_119
    L6_122 = L6_122 + 1
  end
  L5_121 = L5_121:sub(1, L5_121:len() - A3_119:len())
  if L5_121 == "..." then
    L5_121 = ""
  end
  return L5_121
end
L0_0.joinFields = L1_1
L0_0 = util
function L1_1(A0_123, A1_124, A2_125, A3_126, A4_127, A5_128)
  local L6_129, L7_130
  L6_129 = util
  L6_129 = L6_129.getPartialArray
  L7_130 = A0_123
  L6_129 = L6_129(L7_130, A1_124, A2_125, A3_126, A4_127)
  L7_130 = ""
  if A5_128 then
    while A4_127 >= 1 do
      L7_130 = L7_130 .. L6_129[A4_127]
    end
  else
    while A4_127 >= 1 do
      L7_130 = L7_130 .. L6_129[1]
    end
  end
  return tonumber(L7_130, 2)
end
L0_0.joinBitFields = L1_1
L0_0 = util
function L1_1(A0_131)
  local L1_132, L2_133, L3_134, L4_135, L5_136, L6_137, L7_138, L8_139
  L1_132 = string
  L1_132 = L1_132.len
  L2_133 = A0_131
  L1_132 = L1_132(L2_133)
  L2_133 = 0
  L3_134 = 0
  L4_135 = 1
  if L5_136 == 45 then
    L4_135 = 2
    base = L5_136
  else
    L4_135 = 1
    base = L5_136
  end
  for L8_139 = L4_135, L1_132 do
    if string.byte(A0_131, L8_139) >= 48 and string.byte(A0_131, L8_139) <= 58 then
      L2_133 = L2_133 + base * (string.byte(A0_131, L8_139) - string.byte("0", 1))
      base = base / 10
    else
      return -1, 0
    end
  end
  if L4_135 == 2 then
    L2_133 = L2_133 * -1
  end
  return L5_136, L6_137
end
L0_0.atoi = L1_1
L0_0 = util
function L1_1(A0_140)
  local L1_141, L2_142, L3_143
  L1_141 = string
  L1_141 = L1_141.len
  L2_142 = A0_140
  L1_141 = L1_141(L2_142)
  L2_142 = 1
  L3_143 = ""
  for _FORV_7_ = L2_142, L1_141 do
    L3_143 = L3_143 .. "*"
  end
  return L3_143
end
L0_0.mask = L1_1
L0_0 = util
function L1_1(A0_144)
  if A0_144 == "" then
    return false
  end
  return false
end
L0_0.isAllMasked = L1_1
L0_0 = util
function L1_1(A0_145)
  local L1_146
  L1_146 = {}
  L1_146[1] = util.split(util.split(A0_145, "@")[1], "/")[2]
  L1_146[2] = util.split(util.split(A0_145, "@")[1], "/")[3]
  L1_146[3] = util.split(util.split(A0_145, "@")[1], "/")[1]
  L1_146[4] = util.split(util.split(A0_145, "@")[2], ":")[1]
  L1_146[5] = util.split(util.split(A0_145, "@")[2], ":")[2]
  L1_146[6] = util.split(util.split(A0_145, "@")[2], ":")[3]
  return L1_146
end
L0_0.splitDateTime = L1_1
L0_0 = util
function L1_1(A0_147)
  local L1_148
  if A0_147 == nil then
    L1_148 = 0
    return L1_148
  elseif A0_147 == "Jan" then
    L1_148 = 1
    return L1_148
  elseif A0_147 == "Feb" then
    L1_148 = 2
    return L1_148
  elseif A0_147 == "Mar" then
    L1_148 = 3
    return L1_148
  elseif A0_147 == "Apr" then
    L1_148 = 4
    return L1_148
  elseif A0_147 == "May" then
    L1_148 = 5
    return L1_148
  elseif A0_147 == "Jun" then
    L1_148 = 6
    return L1_148
  elseif A0_147 == "Jul" then
    L1_148 = 7
    return L1_148
  elseif A0_147 == "Aug" then
    L1_148 = 8
    return L1_148
  elseif A0_147 == "Sep" then
    L1_148 = 9
    return L1_148
  elseif A0_147 == "Oct" then
    L1_148 = 10
    return L1_148
  elseif A0_147 == "Nov" then
    L1_148 = 11
    return L1_148
  elseif A0_147 == "Dec" then
    L1_148 = 12
    return L1_148
  else
    L1_148 = 0
    return L1_148
  end
end
L0_0.getMonthNum = L1_1
L0_0 = util
function L1_1(A0_149, A1_150, A2_151)
  local L3_152, L4_153, L5_154
  L3_152 = "Text"
  L4_153 = assert
  L5_154 = io
  L5_154 = L5_154.open
  L5_154 = L5_154("help/" .. A2_151, "r")
  L4_153 = L4_153(L5_154, L5_154("help/" .. A2_151, "r"))
  L5_154 = L4_153.read
  L5_154 = L5_154(L4_153, "*all")
  assert(L4_153:close())
  mainHeading = ""
  for _FORV_9_ in string.gfind(L5_154, "<h1>(.-)</h1>") do
    mainHeading = _FORV_9_
    break
  end
  L3_152 = ""
  for _FORV_9_ in string.gfind(L5_154, ":|" .. A0_149 .. "|:.-:|" .. A1_150 .. "|:(.-)" .. ":|" .. A1_150 .. "End|:.-:|" .. A0_149 .. "End|:") do
    L3_152 = _FORV_9_
    break
  end
  L3_152 = string.gsub(L3_152, ":|companyname|:", COMPANY_NAME)
  L3_152 = string.gsub(L3_152, ":|unitname|:", UNIT_INFO)
  L3_152 = string.gsub(L3_152, ":|webaddress|:", WEB_ADDRESS)
  L3_152 = string.gsub(L3_152, ":|supportlink|:", SUPPORT_LINK)
  L3_152 = string.gsub(L3_152, "<br><h(%d)>", "<span class=\"help_h%1\">")
  L3_152 = string.gsub(L3_152, "</h(%d)>", "</span>")
  L3_152 = string.gsub(L3_152, "<n>", "<span class=\"help_note\">")
  L3_152 = string.gsub(L3_152, "</n>", "</span>")
  L3_152 = string.gsub(L3_152, [[
<br>
<br>]], "<br>")
  L3_152 = string.gsub(L3_152, [[
<br>
<br>]], "<br>")
  L3_152 = string.gsub(L3_152, "<br><br>", "<br>")
  return L3_152
end
L0_0.getHelp = L1_1
L0_0 = util
function L1_1(A0_155, A1_156)
  local L2_157, L3_158, L4_159, L5_160, L6_161
  L2_157 = {}
  for L6_161, _FORV_7_ in L3_158(L4_159) do
    L2_157[A1_156 .. L6_161] = _FORV_7_
  end
  return L2_157
end
L0_0.addPrefix = L1_1
L0_0 = util
function L1_1(A0_162, A1_163)
  local L2_164, L3_165, L4_166, L5_167, L6_168
  L2_164 = {}
  for L6_168, _FORV_7_ in L3_165(L4_166) do
    newkey = string.gsub(L6_168, A1_163, "")
    L2_164[newkey] = _FORV_7_
  end
  return L2_164
end
L0_0.removePrefix = L1_1
L0_0 = util
function L1_1(A0_169)
  local L1_170, L2_171, L3_172, L4_173, L5_174, L6_175, L7_176, L8_177
  L1_170 = {}
  L1_170["<"] = "&lt;"
  L1_170[">"] = "&gt;"
  if A0_169 ~= nil then
    L2_171 = type
    L3_172 = A0_169
    L2_171 = L2_171(L3_172)
  elseif L2_171 ~= "string" then
    L2_171 = ""
    return L2_171
  end
  function L2_171(A0_178)
    local L1_179
    L1_179 = _UPVALUE0_
    L1_179 = L1_179.byte
    L1_179 = L1_179(A0_178)
    if L1_179 > 127 then
      return format("&#%d;", L1_179)
    else
      return A0_178
    end
  end
  L3_172 = A0_169
  L7_176 = "&amp;"
  L3_172 = L4_173
  for L7_176, L8_177 in L4_173(L5_174) do
    L3_172 = A0_169.gsub(L3_172, L7_176, L8_177)
  end
  L7_176 = L2_171
  L3_172 = L4_173
  return L3_172
end
L0_0.encodeEntities = L1_1
L0_0 = util
function L1_1(A0_180)
  local L1_181, L2_182, L3_183, L4_184, L5_185, L6_186
  L1_181 = {}
  for L5_185, L6_186 in L2_182(L3_183) do
    L6_186 = util.encodeEntities(L6_186)
    L1_181[L5_185] = L6_186
  end
  return L1_181
end
L0_0.xssEncoding = L1_1
L0_0 = util
function L1_1(A0_187, A1_188, A2_189, A3_190)
  local L4_191
  L4_191 = ";`$&|><"
  A0_187 = string.gsub(A0_187, "[" .. L4_191 .. "]", "")
  if A3_190 then
    A0_187 = A0_187 .. " " .. A3_190
  end
  if A1_188 then
    A0_187 = A0_187 .. " >" .. string.gsub(A1_188, "[" .. L4_191 .. "]", "")
  end
  if A2_189 then
    A0_187 = A0_187 .. " 2>" .. string.gsub(A2_189, "[" .. L4_191 .. "]", "")
  end
  return os.execute(A0_187)
end
L0_0.runShellCmd = L1_1
L0_0 = util
function L1_1(A0_192, A1_193)
  local L2_194, L3_195, L4_196, L5_197, L6_198, L7_199, L8_200, L9_201, L10_202, L11_203, L12_204
  if A1_193 == "" then
    L2_194 = ""
    return L2_194
  end
  L2_194 = {}
  for L6_198 = 0, 255 do
    L7_199 = L6_198 + 1
    L8_200 = string
    L8_200 = L8_200.char
    L8_200 = L8_200(L9_201)
    L2_194[L7_199] = L8_200
  end
  L4_196 = A1_193 or "."
  L5_197["."] = L2_194
  L6_198 = {}
  L7_199 = string
  L7_199 = L7_199.gsub
  L8_200 = L3_195
  L7_199 = L7_199(L8_200, L9_201, L10_202)
  L8_200 = {}
  for L12_204 = 1, L10_202(L11_203) do
    L8_200[L12_204] = string.sub(L7_199, L12_204, L12_204)
  end
  L11_203(L12_204, L12_204())
  for _FORV_14_ = 1, A0_192 do
    L6_198[_FORV_14_] = L9_201[math.random(1, L10_202)]
  end
  return L11_203(L12_204)
end
L0_0.random = L1_1
