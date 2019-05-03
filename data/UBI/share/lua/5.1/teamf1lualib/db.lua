local L0_0
L0_0 = require
L0_0("luasql.sqlite3")
L0_0 = require
L0_0("teamf1lualib/config")
L0_0 = {}
db = L0_0
L0_0 = {}
I18N = L0_0
L0_0 = nil
function db.connect(A0_1)
  _UPVALUE0_ = _UPVALUE1_:connect(A0_1)
  return _UPVALUE0_
end
function db.set_connection(A0_2)
  local L1_3
  _UPVALUE0_ = A0_2
end
function db.get_connection(A0_4)
  local L1_5
  L1_5 = _UPVALUE0_
  return L1_5
end
function db.escape(A0_6)
  esc_txt, errorStr = _UPVALUE0_:escape(A0_6)
  return esc_txt
end
function db.sqlInjectionCheck(A0_7, A1_8)
  local L2_9, L3_10, L4_11, L5_12, L6_13
  if L2_9 == "string" then
    if L2_9 then
      return L2_9
    end
  elseif L2_9 == "table" then
    for L5_12, L6_13 in L2_9(L3_10) do
      if false and db.sqlInjectionCheck(L6_13) then
        return true
      end
    end
  end
  return L2_9
end
function db.execute(A0_14)
  cur, errorStr = _UPVALUE0_:execute(A0_14)
  errorStr = errorStr or ""
  if errorStr ~= "" then
    util.appendDebugOut("DBExecute error message: " .. errorStr .. "<br>")
  end
  if statusMessage == "" and errorStr ~= "" then
    util.appendDebugOut("statusMessage old = " .. statusMessage .. ", new = " .. errorStr .. "<br>")
    statusMessage = errorStr
  end
  return cur, errorStr
end
function db.close()
  _UPVALUE0_:close()
  _UPVALUE1_:close()
end
function db.set_connection(A0_15)
  local L1_16
  _UPVALUE0_ = A0_15
end
function db.get_connection(A0_17)
  local L1_18
  L1_18 = _UPVALUE0_
  return L1_18
end
function db.getTable(A0_19, A1_20, A2_21)
  local L3_22, L4_23, L5_24, L6_25, L7_26, L8_27, L9_28, L10_29, L11_30, L12_31
  L3_22 = ""
  if A2_21 == nil then
    L4_23 = string
    L4_23 = L4_23.format
    L5_24 = [[
                                 SELECT *, _ROWID_ AS _ROWID_ FROM %s
	                          ]]
    L6_25 = A0_19
    L4_23 = L4_23(L5_24, L6_25)
    L3_22 = L4_23
  else
    L3_22 = A2_21
  end
  L4_23 = db
  L4_23 = L4_23.execute
  L5_24 = L3_22
  L4_23 = L4_23(L5_24)
  L5_24 = 0
  L6_25 = {}
  if L4_23 then
    L8_27 = L4_23
    L7_26 = L4_23.fetch
    L7_26 = L7_26(L8_27, L9_28, L10_29)
    while L7_26 do
      L8_27 = {}
      L5_24 = L5_24 + 1
      for L12_31, _FORV_13_ in L9_28(L10_29) do
        if A1_20 or A1_20 == nil then
          L8_27[A0_19 .. "." .. L12_31] = _FORV_13_
        else
          L8_27[L12_31] = _FORV_13_
        end
      end
      L6_25[L5_24] = L8_27
      L12_31 = "a"
      L7_26 = L9_28
    end
    L8_27 = L4_23.close
    L8_27(L9_28)
  else
    L6_25 = nil
  end
  return L6_25
end
function db.getTableWithJoin(A0_32)
  local L1_33, L2_34, L3_35, L4_36, L5_37, L6_38, L7_39, L8_40, L9_41
  L1_33 = {}
  L2_34 = ""
  L3_35 = ""
  L4_36 = {}
  for L8_40, L9_41 in L5_37(L6_38) do
    if #util.split(L9_41, ":") == 3 then
      L1_33[util.split(L9_41, ":")[1]] = ""
      L1_33[util.split(L9_41, ":")[2]] = ""
      L3_35 = L3_35 .. util.split(L9_41, ":")[1] .. "." .. util.split(L9_41, ":")[3] .. " = " .. util.split(L9_41, ":")[2] .. "." .. util.split(L9_41, ":")[3] .. " AND "
    end
  end
  for L8_40, L9_41 in L5_37(L6_38) do
    L2_34 = L2_34 .. L8_40 .. ", "
  end
  L9_41 = L3_35
  L8_40 = L3_35.len
  L8_40 = L8_40(L9_41)
  L8_40 = L8_40 - 4
  L5_37(L6_38, L7_39, L8_40)
  L9_41 = L3_35
  L8_40 = L3_35.len
  L8_40 = L8_40(L9_41)
  L8_40 = L8_40 - 4
  L3_35 = L5_37
  L9_41 = L2_34
  L8_40 = L2_34.len
  L8_40 = L8_40(L9_41)
  L8_40 = L8_40 - 2
  L2_34 = L5_37
  for L8_40, L9_41 in L5_37(L6_38) do
    L4_36 = db.getTableWithJoinHelper(L4_36, L8_40, L2_34, L3_35)
  end
  return L4_36
end
function db.getTableWithJoinHelper(A0_42, A1_43, A2_44, A3_45)
  local L4_46, L5_47, L6_48, L7_49, L8_50, L9_51, L10_52, L11_53
  L4_46 = db
  L4_46 = L4_46.execute
  L5_47 = string
  L5_47 = L5_47.format
  L6_48 = [[
		SELECT %s.*, %s.ROWID AS _ROWID_
		FROM %s
		WHERE %s
	]]
  L7_49 = A1_43
  L11_53 = L5_47(L6_48, L7_49, L8_50, L9_51, L10_52)
  L4_46 = L4_46(L5_47, L6_48, L7_49, L8_50, L9_51, L10_52, L11_53, L5_47(L6_48, L7_49, L8_50, L9_51, L10_52))
  L5_47 = 0
  if L4_46 then
    L7_49 = L4_46
    L6_48 = L4_46.fetch
    L6_48 = L6_48(L7_49, L8_50, L9_51)
    while L6_48 do
      L5_47 = L5_47 + 1
      L7_49 = A0_42[L5_47]
      L7_49 = L7_49 or {}
      for L11_53, _FORV_12_ in L8_50(L9_51) do
        L7_49[A1_43 .. "." .. L11_53] = _FORV_12_
      end
      A0_42[L5_47] = L7_49
      L11_53 = "a"
      L6_48 = L8_50
    end
    L7_49 = L4_46.close
    L7_49(L8_50)
  else
    A0_42 = nil
  end
  return A0_42
end
function db.getRowWithJoin(A0_54, A1_55, A2_56)
  local L3_57
  L3_57 = db
  L3_57 = L3_57.getTableWithJoin
  L3_57 = L3_57(A0_54)
  for _FORV_7_, _FORV_8_ in pairs(L3_57) do
    if _FORV_8_[A1_55] == A2_56 then
      return _FORV_8_
    end
  end
  return nil
end
function db.getRowsWithJoin(A0_58, A1_59, A2_60)
  local L3_61, L4_62, L5_63, L6_64, L7_65, L8_66, L9_67
  L3_61 = db
  L3_61 = L3_61.getTableWithJoin
  L4_62 = A0_58
  L3_61 = L3_61(L4_62)
  L4_62 = {}
  for L8_66, L9_67 in L5_63(L6_64) do
    if L9_67[A1_59] == A2_60 then
      table.insert(L4_62, L9_67)
    end
  end
  return L4_62
end
function db.existsRow(A0_68, A1_69, A2_70)
  local L3_71
  L3_71 = db
  L3_71 = L3_71.execute
  L3_71 = L3_71(string.format([[
		SELECT *, ROWID AS _ROWID_ FROM %s
		WHERE %s = '%s'
	]], A0_68, A1_69, A2_70))
  if L3_71 then
    L3_71:close()
  end
  return L3_71:fetch({}, "a")._ROWID_
end
function db.existsRowLike(A0_72, A1_73, A2_74)
  local L3_75
  L3_75 = db
  L3_75 = L3_75.execute
  L3_75 = L3_75(string.format([[
		SELECT *, ROWID AS _ROWID_ FROM %s
		WHERE %s LIKE '%s'
	]], A0_72, A1_73, A2_74))
  if L3_75 then
    L3_75:close()
  end
  return L3_75:fetch({}, "a")._ROWID_
end
function db.existsTable(A0_76)
  local L1_77
  L1_77 = db
  L1_77 = L1_77.execute
  L1_77 = L1_77(string.format([[
		SELECT *, ROWID AS _ROWID_ FROM %s
	]], A0_76))
  if L1_77 then
  elseif statusMessage ~= "" then
    statusMessage = ""
  end
  return true
end
function db.existsRowWhere(A0_78, A1_79)
  local L2_80
  L2_80 = db
  L2_80 = L2_80.execute
  L2_80 = L2_80(string.format([[
		SELECT *, ROWID AS _ROWID_ FROM %s
		WHERE %s
	]], A0_78, A1_79))
  if L2_80 then
    L2_80:close()
  end
  return L2_80:fetch({}, "a")._ROWID_
end
function db.getRow(A0_81, A1_82, A2_83)
  local L3_84, L4_85, L5_86, L6_87, L7_88, L8_89, L9_90
  L3_84 = db
  L3_84 = L3_84.execute
  L4_85 = string
  L4_85 = L4_85.format
  L5_86 = [[
		SELECT *, ROWID AS _ROWID_ FROM %s
		WHERE %s = '%s'
	]]
  L9_90 = L4_85(L5_86, L6_87, L7_88, L8_89)
  L3_84 = L3_84(L4_85, L5_86, L6_87, L7_88, L8_89, L9_90, L4_85(L5_86, L6_87, L7_88, L8_89))
  L4_85 = {}
  if L3_84 then
    L5_86 = L3_84.fetch
    L5_86 = L5_86(L6_87, L7_88, L8_89)
    L6_87(L7_88)
    if L5_86 then
      for L9_90, _FORV_10_ in L6_87(L7_88) do
        L4_85[A0_81 .. "." .. L9_90] = _FORV_10_
      end
    else
      L4_85 = nil
    end
  else
    L4_85 = nil
  end
  return L4_85
end
function db.getRowWhere(A0_91, A1_92, A2_93)
  local L3_94, L4_95, L5_96, L6_97, L7_98, L8_99, L9_100
  L3_94 = db
  L3_94 = L3_94.execute
  L4_95 = string
  L4_95 = L4_95.format
  L5_96 = [[
		SELECT *, ROWID AS _ROWID_ FROM %s
		WHERE %s
	]]
  L9_100 = L4_95(L5_96, L6_97, L7_98)
  L3_94 = L3_94(L4_95, L5_96, L6_97, L7_98, L8_99, L9_100, L4_95(L5_96, L6_97, L7_98))
  L4_95 = {}
  if L3_94 then
    L5_96 = L3_94.fetch
    L5_96 = L5_96(L6_97, L7_98, L8_99)
    L6_97(L7_98)
    if L5_96 then
      for L9_100, _FORV_10_ in L6_97(L7_98) do
        if A2_93 or A2_93 == nil then
          L4_95[A0_91 .. "." .. L9_100] = _FORV_10_
        else
          L4_95[L9_100] = _FORV_10_
        end
      end
    else
      L4_95 = nil
    end
  else
    L4_95 = nil
  end
  return L4_95
end
function db.getRowFromWhere(A0_101, A1_102)
  local L2_103, L3_104, L4_105, L5_106, L6_107, L7_108, L8_109
  L2_103 = db
  L2_103 = L2_103.execute
  L3_104 = string
  L3_104 = L3_104.format
  L4_105 = [[
		SELECT *, ROWID AS _ROWID_ FROM %s
		WHERE %s
	]]
  L8_109 = L3_104(L4_105, L5_106, L6_107)
  L2_103 = L2_103(L3_104, L4_105, L5_106, L6_107, L7_108, L8_109, L3_104(L4_105, L5_106, L6_107))
  L3_104 = {}
  if L2_103 then
    L4_105 = L2_103.fetch
    L4_105 = L4_105(L5_106, L6_107, L7_108)
    L5_106(L6_107)
    if L4_105 then
      for L8_109, _FORV_9_ in L5_106(L6_107) do
        L3_104[tablename .. "." .. L8_109] = _FORV_9_
      end
    else
      L3_104 = nil
    end
  else
    L3_104 = nil
  end
  return L3_104
end
function db.getRows(A0_110, A1_111, A2_112)
  local L3_113, L4_114, L5_115, L6_116, L7_117, L8_118, L9_119, L10_120, L11_121
  L3_113 = db
  L3_113 = L3_113.execute
  L4_114 = string
  L4_114 = L4_114.format
  L5_115 = [[
		SELECT *, ROWID AS _ROWID_ FROM %s
		WHERE %s = '%s'
	]]
  L6_116 = A0_110
  L7_117 = A1_111
  L11_121 = L4_114(L5_115, L6_116, L7_117, L8_118)
  L3_113 = L3_113(L4_114, L5_115, L6_116, L7_117, L8_118, L9_119, L10_120, L11_121, L4_114(L5_115, L6_116, L7_117, L8_118))
  L4_114 = 0
  L5_115 = {}
  if L3_113 then
    L7_117 = L3_113
    L6_116 = L3_113.fetch
    L6_116 = L6_116(L7_117, L8_118, L9_119)
    while L6_116 do
      L7_117 = tonumber
      L7_117 = L7_117(L8_118)
      if L7_117 > 0 then
        L7_117 = {}
        L4_114 = L4_114 + 1
        for L11_121, _FORV_12_ in L8_118(L9_119) do
          L7_117[A0_110 .. "." .. L11_121] = _FORV_12_
        end
        L5_115[L4_114] = L7_117
      end
      L7_117 = L3_113.fetch
      L7_117 = L7_117(L8_118, L9_119, L10_120)
      L6_116 = L7_117
    end
    L7_117 = L3_113.close
    L7_117(L8_118)
  else
    L5_115 = nil
  end
  return L5_115
end
function db.getRowsWhere(A0_122, A1_123)
  local L2_124, L3_125, L4_126, L5_127, L6_128, L7_129, L8_130, L9_131, L10_132
  L2_124 = db
  L2_124 = L2_124.execute
  L3_125 = string
  L3_125 = L3_125.format
  L4_126 = [[
		SELECT *, ROWID AS _ROWID_ FROM %s
		WHERE %s
	]]
  L5_127 = A0_122
  L6_128 = A1_123
  L10_132 = L3_125(L4_126, L5_127, L6_128)
  L2_124 = L2_124(L3_125, L4_126, L5_127, L6_128, L7_129, L8_130, L9_131, L10_132, L3_125(L4_126, L5_127, L6_128))
  L3_125 = 0
  L4_126 = {}
  if L2_124 then
    L6_128 = L2_124
    L5_127 = L2_124.fetch
    L5_127 = L5_127(L6_128, L7_129, L8_130)
    while L5_127 do
      L6_128 = tonumber
      L6_128 = L6_128(L7_129)
      if L6_128 > 0 then
        L6_128 = {}
        L3_125 = L3_125 + 1
        for L10_132, _FORV_11_ in L7_129(L8_130) do
          L6_128[A0_122 .. "." .. L10_132] = _FORV_11_
        end
        L4_126[L3_125] = L6_128
      end
      L6_128 = L2_124.fetch
      L6_128 = L6_128(L7_129, L8_130, L9_131)
      L5_127 = L6_128
    end
    L6_128 = L2_124.close
    L6_128(L7_129)
  else
    L4_126 = nil
  end
  return L4_126
end
function db.getDistinctValues(A0_133, A1_134)
  local L2_135, L3_136, L4_137, L5_138, L6_139, L7_140, L8_141, L9_142, L10_143
  L2_135 = db
  L2_135 = L2_135.execute
  L3_136 = string
  L3_136 = L3_136.format
  L4_137 = "\t\tSELECT DISTINCT %s FROM %s"
  L5_138 = A1_134
  L6_139 = A0_133
  L10_143 = L3_136(L4_137, L5_138, L6_139)
  L2_135 = L2_135(L3_136, L4_137, L5_138, L6_139, L7_140, L8_141, L9_142, L10_143, L3_136(L4_137, L5_138, L6_139))
  L3_136 = 0
  L4_137 = {}
  if L2_135 then
    L6_139 = L2_135
    L5_138 = L2_135.fetch
    L5_138 = L5_138(L6_139, L7_140, L8_141)
    while L5_138 do
      L6_139 = {}
      L3_136 = L3_136 + 1
      for L10_143, _FORV_11_ in L7_140(L8_141) do
        L6_139[A0_133 .. "." .. L10_143] = _FORV_11_
      end
      L4_137[L3_136] = L6_139
      L10_143 = "a"
      L5_138 = L7_140
    end
    L6_139 = L2_135.close
    L6_139(L7_140)
  else
    L4_137 = nil
  end
  return L4_137
end
function db.getDefaults(A0_144, ...)
  local L2_146, L3_147, L4_148, L5_149, L6_150, L7_151, L8_152, L9_153, L10_154, L11_155, L12_156, L13_157, L14_158
  L2_146 = {}
  L14_158 = ...
  ;({
    [11] = ...
  })[1] = L5_149
  ;({
    [11] = ...
  })[2] = L6_150
  ;({
    [11] = ...
  })[3] = L7_151
  ;({
    [11] = ...
  })[4] = L8_152
  ;({
    [11] = ...
  })[5] = L9_153
  ;({
    [11] = ...
  })[6] = L10_154
  ;({
    [11] = ...
  })[7] = L11_155
  ;({
    [11] = ...
  })[8] = L12_156
  ;({
    [11] = ...
  })[9] = L13_157
  ;({
    [11] = ...
  })[10] = L14_158
  for L6_150, L7_151 in L3_147(L4_148) do
    L8_152 = db
    L8_152 = L8_152.getRows
    L8_152 = L8_152(L9_153, L10_154, L11_155)
    for L12_156, L13_157 in L9_153(L10_154) do
      L14_158 = L7_151
      L14_158 = L14_158 .. "." .. L13_157["tableDefaults.columnName"]
      L2_146[L14_158] = L13_157["tableDefaults.defValue"]
    end
    for L13_157, L14_158 in L10_154(L11_155) do
      if L14_158 == "_ROWID_" then
        L2_146[L7_151 .. "." .. L14_158] = "1"
      elseif not util.tableKeyExists(L2_146, L7_151 .. "." .. L14_158) then
        if A0_144 then
          L2_146[L7_151 .. "." .. L14_158] = ""
        else
          L2_146[L7_151 .. "." .. L14_158] = false
        end
      end
    end
  end
  return L2_146
end
function db.getDef(A0_159, A1_160)
  if db.getRowWhere("tableDefaults", "tableName = '" .. A0_159 .. "' AND columnName = '" .. A1_160 .. "'") then
    return db.getRowWhere("tableDefaults", "tableName = '" .. A0_159 .. "' AND columnName = '" .. A1_160 .. "'")["tableDefaults.defValue"]
  else
    return ""
  end
end
function db.getMin(A0_161, A1_162)
  if db.getRowWhere("tableDefaults", "tableName = '" .. A0_161 .. "' AND columnName = '" .. A1_162 .. "'") then
    return db.getRowWhere("tableDefaults", "tableName = '" .. A0_161 .. "' AND columnName = '" .. A1_162 .. "'")["tableDefaults.minValue"]
  else
    return ""
  end
end
function db.getMax(A0_163, A1_164)
  if db.getRowWhere("tableDefaults", "tableName = '" .. A0_163 .. "' AND columnName = '" .. A1_164 .. "'") then
    return db.getRowWhere("tableDefaults", "tableName = '" .. A0_163 .. "' AND columnName = '" .. A1_164 .. "'")["tableDefaults.maxValue"]
  else
    return ""
  end
end
function db.getDefStr(A0_165, A1_166)
  return "(" .. db.getMin(A0_165, A1_166) .. "-" .. db.getMax(A0_165, A1_166) .. ", default " .. db.getDef(A0_165, A1_166) .. ")"
end
function db.getAttribute(A0_167, A1_168, A2_169, A3_170)
  local L4_171
  L4_171 = db
  L4_171 = L4_171.execute
  L4_171 = L4_171(string.format([[
		SELECT %s, ROWID AS _ROWID_ FROM %s
		WHERE %s = '%s'
	]], A3_170, A0_167, A1_168, A2_169))
  if L4_171 then
    L4_171:close()
    if L4_171:fetch({}, "a") then
    end
  end
  return L4_171:fetch({}, "a")[A3_170]
end
function db.setAttributeExt(A0_172, A1_173, A2_174, A3_175, A4_176, A5_177, A6_178)
  local L7_179, L8_180, L9_181
  L7_179 = "UPDATE "
  L8_180 = A0_172
  L9_181 = " SET "
  L7_179 = L7_179 .. L8_180 .. L9_181 .. A3_175 .. "=" .. A4_176
  if A5_177 ~= nil then
    L8_180 = L7_179
    L9_181 = ", OID="
    L7_179 = L8_180 .. L9_181 .. A5_177
  end
  if A6_178 ~= nil then
    L8_180 = L7_179
    L9_181 = ", objRevId="
    L7_179 = L8_180 .. L9_181 .. A6_178 + 1 .. " "
  end
  L8_180 = L7_179
  L9_181 = "WHERE "
  L7_179 = L8_180 .. L9_181 .. A1_173 .. "=" .. A2_174
  L8_180 = db
  L8_180 = L8_180.existsRow
  L9_181 = A0_172
  L8_180 = L8_180(L9_181, A1_173, A2_174)
  if L8_180 then
    L8_180 = db
    L8_180 = L8_180.execute
    L9_181 = L7_179
    L9_181 = L8_180(L9_181)
    util.appendDebugOut(L7_179 .. "<br>")
    return L8_180, L9_181
  else
    L8_180 = false
    return L8_180
  end
end
function db.setAttribute(A0_182, A1_183, A2_184, A3_185, A4_186)
  local L5_187, L6_188, L7_189
  L5_187 = db
  L5_187 = L5_187.existsRow
  L6_188 = A0_182
  L7_189 = A1_183
  L5_187 = L5_187(L6_188, L7_189, A2_184)
  if L5_187 then
    L5_187 = string
    L5_187 = L5_187.format
    L6_188 = [[
			UPDATE %s
            SET %s = '%s'
			WHERE %s = '%s'
		]]
    L7_189 = A0_182
    L5_187 = L5_187(L6_188, L7_189, A3_185, A4_186, A1_183, A2_184)
    L6_188 = db
    L6_188 = L6_188.execute
    L7_189 = L5_187
    L7_189 = L6_188(L7_189)
    util.appendDebugOut(L5_187 .. "<br>")
    return L6_188, L7_189
  else
    L5_187 = false
    return L5_187
  end
end
function db.setAttributeWhere(A0_190, A1_191, A2_192, A3_193)
  local L4_194, L5_195
  L4_194 = db
  L4_194 = L4_194.existsRowWhere
  L5_195 = A0_190
  L4_194 = L4_194(L5_195, A1_191)
  if L4_194 then
    L4_194 = db
    L4_194 = L4_194.execute
    L5_195 = string
    L5_195 = L5_195.format
    L5_195 = L5_195([[
			UPDATE %s
            SET %s = '%s'
			WHERE %s
		]], A0_190, A2_192, A3_193, A1_191)
    L5_195 = L4_194(L5_195, L5_195([[
			UPDATE %s
            SET %s = '%s'
			WHERE %s
		]], A0_190, A2_192, A3_193, A1_191))
    return L4_194, L5_195
  else
    L4_194 = false
    return L4_194
  end
end
function db.deleteRow(A0_196, A1_197, A2_198)
  local L3_199, L4_200
  L3_199 = db
  L3_199 = L3_199.execute
  L4_200 = string
  L4_200 = L4_200.format
  L4_200 = L4_200([[
		DELETE FROM %s
		WHERE %s = '%s'
	]], A0_196, A1_197, A2_198)
  L4_200 = L3_199(L4_200, L4_200([[
		DELETE FROM %s
		WHERE %s = '%s'
	]], A0_196, A1_197, A2_198))
  return L3_199, L4_200
end
function db.deleteAllRows(A0_201)
  local L1_202
  tableData = db.getTable(A0_201, false)
  if tableData == nil then
    return nil
  end
  for _FORV_5_, _FORV_6_ in pairs(tableData) do
    keyname = "_ROWID_"
    keyvalue = _FORV_6_._ROWID_
    L1_202 = db.deleteRow(A0_201, keyname, keyvalue)
    if L1_202 == nil then
      return nil
    end
  end
  return L1_202, errstr
end
function db.deleteAllEntries(A0_203)
  local L1_204, L2_205
  L1_204 = db
  L1_204 = L1_204.execute
  L2_205 = string
  L2_205 = L2_205.format
  L2_205 = L2_205([[
		DELETE FROM %s
        ]], A0_203)
  L2_205 = L1_204(L2_205, L2_205([[
		DELETE FROM %s
        ]], A0_203))
  return L1_204, L2_205
end
function db.deleteRowWhere(A0_206, A1_207)
  local L2_208, L3_209
  L2_208 = db
  L2_208 = L2_208.execute
  L3_209 = string
  L3_209 = L3_209.format
  L3_209 = L3_209([[
		DELETE FROM %s
		WHERE %s
	]], A0_206, A1_207)
  L3_209 = L2_208(L3_209, L3_209([[
		DELETE FROM %s
		WHERE %s
	]], A0_206, A1_207))
  return L2_208, L3_209
end
function db.insert(A0_210, A1_211, A2_212)
  local L3_213, L4_214, L5_215, L6_216, L7_217, L8_218, L9_219, L10_220, L11_221, L12_222
  L3_213 = ""
  L4_214 = "INSERT INTO "
  L5_215 = A0_210
  L6_216 = " ("
  L4_214 = L4_214 .. L5_215 .. L6_216
  L5_215 = ") VALUES ("
  L6_216 = db
  L6_216 = L6_216.getColNames
  L7_217 = A0_210
  L6_216 = L6_216(L7_217)
  L7_217 = db
  L7_217 = L7_217.getDefaults
  L7_217 = L7_217(L8_218, L9_219)
  for L11_221, L12_222 in L8_218(L9_219) do
    L4_214 = L4_214 .. "'" .. L12_222 .. "', "
    if L12_222 == "_ROWID_" then
      L5_215 = L5_215 .. "(select OID from oidRecord where tableName=\"" .. A0_210 .. "\"), "
    elseif A2_212 and util.tableKeyExists(A1_211, L12_222) then
      L5_215 = L5_215 .. "'" .. A1_211[L12_222] .. "', "
    elseif util.tableKeyExists(A1_211, A0_210 .. "." .. L12_222) then
      L5_215 = L5_215 .. "'" .. A1_211[A0_210 .. "." .. L12_222] .. "', "
    elseif L7_217[A0_210 .. "." .. L12_222] then
      L5_215 = L5_215 .. "'" .. L7_217[A0_210 .. "." .. L12_222] .. "', "
    else
      L5_215 = L5_215 .. "NULL, "
    end
  end
  L12_222 = L4_214
  L11_221 = L4_214.len
  L11_221 = L11_221(L12_222)
  L11_221 = L11_221 - 2
  L4_214 = L8_218
  L12_222 = L5_215
  L11_221 = L5_215.len
  L11_221 = L11_221(L12_222)
  L11_221 = L11_221 - 2
  L5_215 = L8_218
  L5_215 = L8_218 .. L9_219
  L3_213 = L8_218 .. L9_219
  L11_221 = L3_213
  L12_222 = "<br>\n"
  L11_221 = L11_221 .. L12_222
  L10_220(L11_221)
  L11_221 = L9_219
  return L10_220, L11_221
end
function db.update(A0_223, A1_224, A2_225)
  local L3_226, L4_227, L5_228, L6_229, L7_230, L8_231, L9_232, L10_233, L11_234, L12_235, L13_236
  L3_226 = "UPDATE "
  L4_227 = A0_223
  L5_228 = " SET "
  L3_226 = L3_226 .. L4_227 .. L5_228
  L4_227 = ""
  L5_228 = nil
  L6_229 = db
  L6_229 = L6_229.getColNames
  L6_229 = L6_229(L7_230)
  for L10_233, L11_234 in L7_230(L8_231) do
    L12_235 = util
    L12_235 = L12_235.split
    L13_236 = L10_233
    L12_235 = L12_235(L13_236, ".")
    L13_236 = #L12_235
    if L13_236 == 2 then
      L13_236 = L12_235[1]
      if L13_236 == A0_223 then
        L13_236 = util
        L13_236 = L13_236.keyTableValueExists
        L13_236 = L13_236(L6_229, L12_235[2])
        if L13_236 then
          L13_236 = L12_235[2]
          if A0_223 == "NimfConf" or A0_223 == "autodiall2tpvpn" or A0_223 == "autodialpptpvpn" then
            L4_227 = L4_227 .. L12_235[2] .. " = '" .. L11_234 .. "', "
          elseif L13_236 == "objRevId" then
            L4_227 = L4_227 .. L13_236 .. "='" .. L11_234 + 1
            L4_227 = L4_227 .. "', "
          elseif db.getAttribute(A0_223, "_ROWID_", A2_225, L13_236) == L11_234 then
            util.appendOut("field " .. L13_236 .. " hasnt changed<br>")
          else
            L4_227 = L4_227 .. L12_235[2] .. " = '" .. L11_234 .. "', "
          end
        end
      end
    end
  end
  L3_226 = L7_230 .. L8_231
  L11_234 = L3_226
  L10_233 = L3_226.len
  L10_233 = L10_233(L11_234)
  L10_233 = L10_233 - 2
  L3_226 = L7_230
  L10_233 = "'"
  L3_226 = L7_230 .. L8_231 .. L9_232 .. L10_233
  if L4_227 ~= "" then
    L10_233 = L3_226
    L11_234 = "<br>"
    L10_233 = L10_233 .. L11_234
    L9_232(L10_233)
    L10_233 = L8_231
    L11_234 = "UPDATED"
    return L9_232, L10_233, L11_234
  else
    return L7_230, L8_231, L9_232
  end
end
function db.delete(A0_237, A1_238)
  local L2_239, L3_240, L4_241, L5_242, L6_243, L7_244
  L2_239 = "DELETE FROM "
  L2_239 = L2_239 .. L3_240 .. L4_241
  for L6_243, L7_244 in L3_240(L4_241) do
    L2_239 = L2_239 .. "_ROWID_ = '" .. L7_244 .. "' OR "
  end
  L7_244 = L2_239
  L6_243 = L2_239.len
  L6_243 = L6_243(L7_244)
  L6_243 = L6_243 - 3
  L2_239 = L3_240
  L6_243 = L2_239
  L7_244 = "<br>"
  L6_243 = L6_243 .. L7_244
  L5_242(L6_243)
  L6_243 = L4_241
  return L5_242, L6_243
end
function db.getColNames(A0_245)
  local L1_246, L2_247
  L1_246 = db
  L1_246 = L1_246.execute
  L2_247 = string
  L2_247 = L2_247.format
  L2_247 = L2_247([[
		SELECT * FROM %s
	]], A0_245)
  L1_246 = L1_246(L2_247, L2_247([[
		SELECT * FROM %s
	]], A0_245))
  L2_247 = {}
  if L1_246 then
    L2_247 = L1_246:getcolnames()
    L1_246:close()
  else
    L2_247 = nil
  end
  return L2_247
end
function db.numCols(A0_248)
  return #db.getColNames(A0_248)
end
function db.getColTypes(A0_249)
  local L1_250, L2_251
  L1_250 = db
  L1_250 = L1_250.execute
  L2_251 = string
  L2_251 = L2_251.format
  L2_251 = L2_251([[
		SELECT * FROM %s
	]], A0_249)
  L1_250 = L1_250(L2_251, L2_251([[
		SELECT * FROM %s
	]], A0_249))
  L2_251 = {}
  if L1_250 then
    L2_251 = L1_250:getcoltypes()
    L1_250:close()
  else
    L2_251 = nil
  end
  return L2_251
end
function db.getColType(A0_252, A1_253)
  if util.keyTableValueExists(db.getColNames(A0_252), A1_253) then
    return db.getColTypes(A0_252)[util.keyTableValueExists(db.getColNames(A0_252), A1_253)]
  else
    return nil
  end
end
function db.typeAndRangeValidate(A0_254)
  local L1_255, L2_256, L3_257, L4_258, L5_259, L6_260, L7_261, L8_262, L9_263, L10_264, L11_265, L12_266
  L1_255(L2_256)
  for L4_258, L5_259 in L1_255(L2_256) do
    L6_260 = util
    L6_260 = L6_260.split
    L7_261 = L4_258
    L8_262 = "."
    L6_260 = L6_260(L7_261, L8_262)
    L7_261 = #L6_260
    if L7_261 == 2 then
      L7_261 = db
      L7_261 = L7_261.getColType
      L8_262 = L6_260[1]
      L9_263 = L6_260[2]
      L7_261 = L7_261(L8_262, L9_263)
      if L7_261 then
        L8_262 = util
        L8_262 = L8_262.appendOut
        L9_263 = L6_260[2]
        L10_264 = " is a "
        L11_265 = L7_261
        L12_266 = "<br>"
        L9_263 = L9_263 .. L10_264 .. L11_265 .. L12_266
        L8_262(L9_263)
        if L7_261 == "integer" then
          L8_262 = tonumber
          L9_263 = L5_259
          L8_262 = L8_262(L9_263)
          L9_263 = type
          L10_264 = L8_262
          L9_263 = L9_263(L10_264)
          if L9_263 == "number" then
            L9_263 = string
            L9_263 = L9_263.sub
            L10_264 = L5_259
            L11_265 = 1
            L12_266 = 1
            L9_263 = L9_263(L10_264, L11_265, L12_266)
            L10_264 = string
            L10_264 = L10_264.sub
            L11_265 = L5_259
            L12_266 = -1
            L10_264 = L10_264(L11_265, L12_266, -1)
            if L9_263 == " " or L10_264 == " " then
              L11_265 = util
              L11_265 = L11_265.appendOut
              L12_266 = "Invalidation: unnecessary white space at beg or end<br>"
              L11_265(L12_266)
              L11_265 = false
              return L11_265
            end
            L11_265 = tonumber
            L12_266 = db
            L12_266 = L12_266.getMin
            L12_266 = L12_266(L6_260[1], L6_260[2])
            L11_265 = L11_265(L12_266, L12_266(L6_260[1], L6_260[2]))
            L12_266 = tonumber
            L12_266 = L12_266(db.getMax(L6_260[1], L6_260[2]))
            if L11_265 and L12_266 then
              util.appendOut("min = " .. L11_265 .. ", max = " .. L12_266 .. "<br>")
              if not (L8_262 >= L11_265) or not (L8_262 <= L12_266) then
                util.appendOut("Invalidation: bad range<br>")
                return false
              end
            end
          else
            L9_263 = util
            L9_263 = L9_263.appendOut
            L10_264 = "Invalidation: not and integer<br>"
            L9_263(L10_264)
            L9_263 = false
            return L9_263
          end
        end
      end
    end
  end
  return L1_255
end
function db.printTable(A0_267)
  local L1_268, L2_269, L3_270, L4_271, L5_272, L6_273, L7_274, L8_275, L9_276
  L1_268 = db
  L1_268 = L1_268.execute
  L2_269 = string
  L2_269 = L2_269.format
  L3_270 = [[
		SELECT *, ROWID AS _ROWID_ FROM %s
	]]
  L4_271 = A0_267
  L9_276 = L2_269(L3_270, L4_271)
  L1_268 = L1_268(L2_269, L3_270, L4_271, L5_272, L6_273, L7_274, L8_275, L9_276, L2_269(L3_270, L4_271))
  L2_269 = ""
  if L1_268 then
    L4_271 = L1_268
    L3_270 = L1_268.fetch
    L3_270 = L3_270(L4_271, L5_272, L6_273)
    L4_271 = "***** DB Table: "
    L2_269 = L4_271 .. L5_272 .. L6_273
    while L3_270 do
      L4_271 = "ROW ::: "
      for L8_275, L9_276 in L5_272(L6_273) do
        L4_271 = L4_271 .. L8_275 .. " = " .. L9_276 .. ", "
      end
      L9_276 = L4_271
      L8_275 = L4_271.len
      L8_275 = L8_275(L9_276)
      L8_275 = L8_275 - 2
      L4_271 = L5_272
      L2_269 = L5_272 .. L6_273 .. L7_274
      L8_275 = "a"
      L3_270 = L5_272
    end
    L4_271 = L2_269
    L2_269 = L4_271 .. L5_272
    L4_271 = L1_268.close
    L4_271(L5_272)
  else
    L3_270 = "Empty table: "
    L4_271 = A0_267
    L2_269 = L3_270 .. L4_271 .. L5_272
  end
  return L2_269
end
function db.tableSize(A0_277)
  local L1_278
  L1_278 = db
  L1_278 = L1_278.execute
  L1_278 = L1_278(string.format([[
		SELECT COUNT(*) FROM %s
	]], A0_277))
  if L1_278 then
    L1_278:close()
    return L1_278:fetch({}, "n")[1]
  else
    return 0
  end
end
function db.saveTable(A0_279, A1_280, A2_281, A3_282, A4_283, A5_284)
  local L6_285, L7_286, L8_287, L9_288, L10_289, L11_290, L12_291, L13_292
  L6_285 = ""
  L7_286 = ""
  A3_282 = A3_282 or L8_287
  if L8_287 ~= "number" then
  else
    if L8_287 == "string" then
      L6_285 = L8_287 .. L9_288
      L7_286 = L8_287 .. L9_288
      L11_290 = L7_286
      L8_287(L9_288, L10_289, L11_290)
  end
  else
    if L8_287 == "table" then
      if L8_287 ~= nil then
        if L8_287 ~= nil then
          return L8_287
        end
      end
      L6_285 = L8_287 .. L9_288
      if L8_287 then
        L8_287(L9_288, L10_289)
        L11_290 = "\n"
        L8_287(L9_288, L10_289, L11_290)
      else
        L8_287(L9_288, L10_289)
        L8_287(L9_288, L10_289)
        A3_282[A2_281] = A1_280
        for L11_290, L12_291 in L8_287(L9_288) do
          L13_292 = nil
          if A5_284 == 1 then
            L13_292 = string.format("%s[%d]", A1_280, A4_283)
          else
            L13_292 = string.format("%s[%s]", A1_280, _UPVALUE0_(L11_290))
          end
          A4_283 = A4_283 + db.saveTable(A0_279, L13_292, L12_291, A3_282, A4_283, 0)
        end
      end
    else
    end
  end
  L8_287(L9_288)
  return L8_287
end
function db.save()
  local L0_293, L1_294, L2_295
  L0_293 = io
  L0_293 = L0_293.open
  L1_294 = "/tmp/restoreProgress.txt"
  L2_295 = "r"
  L0_293 = L0_293(L1_294, L2_295)
  if L0_293 ~= nil then
    return
  end
  L1_294 = db
  L1_294 = L1_294.execute
  L2_295 = "ATTACH '/tmp/cpAcc.db' as cpAccDB"
  L1_294(L2_295)
  L1_294 = db
  L1_294 = L1_294.export
  L2_295 = SETTINGS_FILE
  L1_294(L2_295)
  L1_294 = config
  L1_294 = L1_294.updateChecksum
  L2_295 = db
  L1_294(L2_295, SETTINGS_FILE)
  L1_294 = db
  L1_294 = L1_294.getAttribute
  L2_295 = "environment"
  L1_294 = L1_294(L2_295, "name", "CFG_WRITE_PROGRAM", "value")
  L2_295 = db
  L2_295 = L2_295.getAttribute
  L2_295 = L2_295("environment", "name", "FLASH_CFG_PARTITION", "value")
  util.appendDebugOut("Exec = " .. os.execute(L1_294 .. " " .. L2_295 .. " " .. SETTINGS_FILE))
  util.appendDebugOut("Saved DB!<br>")
end
function db.export(A0_296)
  local L1_297, L2_298
  L1_297 = io
  L1_297 = L1_297.open
  L2_298 = A0_296
  L1_297 = L1_297(L2_298, "wb")
  L2_298 = db
  L2_298 = L2_298.getTable
  L2_298 = L2_298("saveTables", false)
  for _FORV_6_, _FORV_7_ in pairs(L2_298) do
    db.saveTable(L1_297, _FORV_7_.tableName, db.getTable(_FORV_7_.tableName, false), false, 1, 1)
  end
end
function db.insertImport(A0_299, A1_300, A2_301)
  local L3_302, L4_303, L5_304, L6_305, L7_306, L8_307, L9_308, L10_309, L11_310, L12_311, L13_312
  L3_302 = ""
  L4_303 = "INSERT INTO "
  L5_304 = A0_299
  L6_305 = " ("
  L4_303 = L4_303 .. L5_304 .. L6_305
  L5_304 = ") VALUES ("
  L6_305 = ""
  L7_306 = db
  L7_306 = L7_306.getColNames
  L8_307 = A0_299
  L7_306 = L7_306(L8_307)
  L8_307 = db
  L8_307 = L8_307.getDefaults
  L8_307 = L8_307(L9_308, L10_309)
  for L12_311, L13_312 in L9_308(L10_309) do
    L4_303 = L4_303 .. "'" .. L13_312 .. "', "
    if A2_301 and util.tableKeyExists(A1_300, L13_312) then
      L6_305 = string.gsub(A1_300[L13_312], "'", "''")
      L5_304 = L5_304 .. "'" .. L6_305 .. "', "
    elseif util.tableKeyExists(A1_300, A0_299 .. "." .. L13_312) then
      L6_305 = string.gsub(A1_300[A0_299 .. "." .. L13_312], "'", "''")
      L5_304 = L5_304 .. "'" .. L6_305 .. "', "
    elseif L8_307[A0_299 .. "." .. L13_312] then
      L6_305 = string.gsub(L8_307[A0_299 .. "." .. L13_312], "'", "''")
      L5_304 = L5_304 .. "'" .. L6_305 .. "', "
    else
      L5_304 = L5_304 .. "NULL, "
    end
    L6_305 = ""
  end
  L13_312 = L4_303
  L12_311 = L4_303.len
  L12_311 = L12_311(L13_312)
  L12_311 = L12_311 - 2
  L4_303 = L9_308
  L13_312 = L5_304
  L12_311 = L5_304.len
  L12_311 = L12_311(L13_312)
  L12_311 = L12_311 - 2
  L5_304 = L9_308
  L5_304 = L9_308 .. L10_309
  L3_302 = L9_308 .. L10_309
  L12_311 = L3_302
  L13_312 = "<br>\n"
  L12_311 = L12_311 .. L13_312
  L11_310(L12_311)
  L12_311 = L10_309
  return L11_310, L12_311
end
function db.import(A0_313)
  local L1_314, L2_315, L3_316, L4_317, L5_318, L6_319, L7_320, L8_321, L9_322, L10_323, L11_324, L12_325, L13_326, L14_327, L15_328, L16_329, L17_330, L18_331, L19_332
  L1_314 = true
  L2_315 = util
  L2_315 = L2_315.appendDebugOut
  L2_315(L3_316)
  L2_315 = dofile
  L2_315(L3_316)
  L2_315 = db
  L2_315 = L2_315.getTable
  L2_315 = L2_315(L3_316, L4_317)
  L3_316()
  for L6_319, L7_320 in L3_316(L4_317) do
    if not L1_314 then
      break
    end
    L8_321 = L7_320.tableName
    L9_322 = util
    L9_322 = L9_322.getLuaVariable
    L9_322 = L9_322(L10_323)
    if L9_322 == nil then
      L10_323(L11_324)
    end
    if L9_322 ~= nil then
      if L10_323 >= 1 then
        for L13_326, L14_327 in L10_323(L11_324) do
          if L8_321 == "oidRecord" then
            L15_328 = {}
            for L19_332, _FORV_20_ in L16_329(L17_330) do
              L15_328[L8_321 .. "." .. L19_332] = _FORV_20_
            end
            L19_332 = L9_322[L13_326]
            L19_332 = L19_332._ROWID_
            L1_314 = L16_329
          else
            L15_328 = db
            L15_328 = L15_328.insertImport
            L19_332 = true
            L15_328 = L15_328(L16_329, L17_330, L18_331, L19_332)
            L1_314 = L15_328
          end
          if not L1_314 then
            L15_328 = print
            L15_328(L16_329)
            break
          end
        end
      end
    end
  end
  if L1_314 then
    L3_316()
    return L3_316
  else
    L3_316()
    return L3_316
  end
end
function db.beginTransaction()
  queryString = "BEGIN TRANSACTION"
  util.appendDebugOut(queryString .. "<br>")
end
function db.commitTransaction()
  queryString = "COMMIT"
  util.appendDebugOut(queryString .. "<br>")
end
function db.rollback()
  queryString = "ROLLBACK"
  util.appendDebugOut(queryString .. "<br>")
end
function db.verifyFileContent(A0_333)
  local L1_334, L2_335
  L1_334 = io
  L1_334 = L1_334.open
  L2_335 = A0_333
  L1_334 = L1_334(L2_335)
  if L1_334 then
    L2_335 = L1_334.read
    L2_335 = L2_335(L1_334, "*all")
    L2_335 = L2_335 or ""
    L1_334:close()
    if db.sqlInjectionCheck(L2_335) then
      return true
    else
      return false
    end
  end
end
function db.getRowsByOrder(A0_336, A1_337)
  local L2_338, L3_339, L4_340, L5_341, L6_342, L7_343, L8_344, L9_345, L10_346
  L2_338 = db
  L2_338 = L2_338.execute
  L3_339 = string
  L3_339 = L3_339.format
  L4_340 = [[
		SELECT *, ROWID AS _ROWID_ FROM %s
		ORDER BY %s DESC
	]]
  L5_341 = A0_336
  L6_342 = A1_337
  L10_346 = L3_339(L4_340, L5_341, L6_342)
  L2_338 = L2_338(L3_339, L4_340, L5_341, L6_342, L7_343, L8_344, L9_345, L10_346, L3_339(L4_340, L5_341, L6_342))
  L3_339 = 0
  L4_340 = {}
  if L2_338 then
    L6_342 = L2_338
    L5_341 = L2_338.fetch
    L5_341 = L5_341(L6_342, L7_343, L8_344)
    while L5_341 do
      L6_342 = tonumber
      L6_342 = L6_342(L7_343)
      if L6_342 > 0 then
        L6_342 = {}
        L3_339 = L3_339 + 1
        for L10_346, _FORV_11_ in L7_343(L8_344) do
          L6_342[A0_336 .. "." .. L10_346] = _FORV_11_
        end
        L4_340[L3_339] = L6_342
      end
      L6_342 = L2_338.fetch
      L6_342 = L6_342(L7_343, L8_344, L9_345)
      L5_341 = L6_342
    end
    L6_342 = L2_338.close
    L6_342(L7_343)
  else
    L4_340 = nil
  end
  return L4_340
end
function db.updateRows(A0_347, A1_348, A2_349, A3_350)
  local L4_351, L5_352, L6_353, L7_354, L8_355, L9_356
  L4_351 = "UPDATE "
  L8_355 = "="
  L9_356 = A2_349
  L4_351 = L4_351 .. L5_352 .. L6_353 .. L7_354 .. L8_355 .. L9_356 .. " WHERE _ROWID_  IN ( "
  for L8_355, L9_356 in L5_352(L6_353) do
    L4_351 = L4_351 .. "'" .. L9_356 .. "' , "
  end
  L9_356 = L4_351
  L8_355 = L4_351.len
  L8_355 = L8_355(L9_356)
  L8_355 = L8_355 - 3
  L4_351 = L5_352
  L4_351 = L5_352 .. L6_353
  L8_355 = L4_351
  L9_356 = "<br>"
  L8_355 = L8_355 .. L9_356
  L7_354(L8_355)
  L8_355 = L6_353
  return L7_354, L8_355
end
function db.updateTable(A0_357, A1_358, A2_359)
  local L3_360, L4_361, L5_362
  L3_360 = "UPDATE "
  L4_361 = A0_357
  L5_362 = " SET "
  L3_360 = L3_360 .. L4_361 .. L5_362 .. A1_358 .. "='" .. A2_359 .. "'"
  L4_361 = db
  L4_361 = L4_361.execute
  L5_362 = L3_360
  L5_362 = L4_361(L5_362)
  util.appendDebugOut(L3_360 .. "<br>")
  return L4_361, L5_362
end
function db.numRows(A0_363, A1_364, A2_365)
  local L3_366, L4_367, L5_368, L6_369, L7_370, L8_371
  L3_366 = ""
  L4_367 = ""
  L5_368 = "COUNT(*) AS _COUNT_"
  if A1_364 ~= nil then
    L6_369 = "WHERE "
    L7_370 = A1_364
    L3_366 = L6_369 .. L7_370
  end
  if A2_365 ~= nil then
    L6_369 = A2_365
    L7_370 = ","
    L8_371 = L5_368
    L5_368 = L6_369 .. L7_370 .. L8_371
    L6_369 = "GROUP BY "
    L7_370 = A2_365
    L4_367 = L6_369 .. L7_370
  end
  L6_369 = db
  L6_369 = L6_369.execute
  L7_370 = string
  L7_370 = L7_370.format
  L8_371 = [[
 
		    SELECT %s FROM %s %s %s
		    ]]
  L8_371 = L7_370(L8_371, L5_368, A0_363, L3_366, L4_367)
  L6_369 = L6_369(L7_370, L8_371, L7_370(L8_371, L5_368, A0_363, L3_366, L4_367))
  if L6_369 then
    if A2_365 ~= nil then
      L7_370 = {}
      L8_371 = L6_369.fetch
      L8_371 = L8_371(L6_369, {}, "a")
      while L8_371 do
        L7_370[L8_371[A2_365]] = L8_371._COUNT_
        L8_371 = L6_369:fetch(L8_371, "a")
      end
      L6_369:close()
      return L7_370
    else
      L8_371 = L6_369
      L7_370 = L6_369.fetch
      L7_370 = L7_370(L8_371, {}, "a")
      L8_371 = L7_370._COUNT_
      return L8_371
    end
  else
    L7_370 = nil
    return L7_370
  end
end
function db.getNextRowId(A0_372, A1_373)
  local L2_374, L3_375
  L2_374 = "_ROWID_"
  L3_375 = db
  L3_375 = L3_375.execute
  L3_375 = L3_375(string.format([[
        SELECT %s, ROWID AS _ROWID_ FROM %s
        LIMIT %s,1
    ]], L2_374, A1_373, A0_372))
  if L3_375 then
    L3_375:close()
    if L3_375:fetch({}, "a") then
    end
  end
  return L3_375:fetch({}, "a")[L2_374]
end
function db.getAttributeWhere(A0_376, A1_377, A2_378)
  local L3_379
  L3_379 = db
  L3_379 = L3_379.execute
  L3_379 = L3_379(string.format([[
    SELECT %s, ROWID AS _ROWID_ FROM %s
    WHERE %s
    ]], A2_378, A0_376, A1_377))
  if L3_379 then
    L3_379:close()
    if L3_379:fetch({}, "a") then
    end
  end
  return L3_379:fetch({}, "a")[A2_378]
end
function db.getString(A0_380)
  local L1_381, L2_382, L3_383, L4_384, L5_385, L6_386, L7_387, L8_388
  L1_381 = {}
  L2_382 = {}
  L1_381[1] = L2_382
  if A0_380 == nil then
    return L1_381
  end
  L2_382 = nil
  L3_383 = util
  L3_383 = L3_383.split
  L3_383 = L3_383(L4_384, L5_385)
  for L7_387, L8_388 in L4_384(L5_385) do
    if L2_382 ~= nil then
      L2_382 = L2_382 .. "i18n_id='" .. L8_388 .. "' or "
    else
      L2_382 = "i18n_id='" .. L8_388 .. "' or "
    end
  end
  if L2_382 ~= nil then
    L7_387 = -4
    L2_382 = L4_384
  end
  L7_387 = L5_385
  L8_388 = L2_382
  L1_381[1] = L6_386
  return L6_386
end
function db.getStringsWhere(A0_389, A1_390)
  local L2_391, L3_392, L4_393, L5_394
  L2_391 = db
  L2_391 = L2_391.execute
  L3_392 = string
  L3_392 = L3_392.format
  L4_393 = [[
		SELECT *, ROWID AS _ROWID_ FROM %s
		WHERE %s
	]]
  L5_394 = A0_389
  L5_394 = L3_392(L4_393, L5_394, A1_390)
  L2_391 = L2_391(L3_392, L4_393, L5_394, L3_392(L4_393, L5_394, A1_390))
  L3_392 = 0
  L4_393 = {}
  if L2_391 then
    L5_394 = L2_391.fetch
    L5_394 = L5_394(L2_391, {}, "a")
    while L5_394 do
      if 0 < tonumber(L5_394._ROWID_) then
        L4_393[L5_394.i18n_id] = L5_394.string
      end
      L5_394 = L2_391:fetch(L5_394, "a")
    end
    L2_391:close()
  else
    L4_393 = nil
  end
  return L4_393
end
function I18N.dbConnect(A0_395)
  _UPVALUE0_ = db.connect(A0_395)
  db.set_connection(_UPVALUE0_)
end
function db.breadCrumbSupport()
  local L0_396, L1_397
  _UPVALUE0_ = db.connect("/pkgMgmt/pkgMgmt.db")
  db.set_connection(_UPVALUE0_)
  L0_396 = db.getAttribute("Languages", "Status", "1", "LanguageId")
  _UPVALUE1_ = db.connect("/tmp/system.db")
  db.set_connection(_UPVALUE1_)
  L1_397 = util.split(L0_396, "-")
  return L1_397[1]
end
