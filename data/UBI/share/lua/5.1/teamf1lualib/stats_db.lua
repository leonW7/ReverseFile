local L0_0
L0_0 = require
L0_0("luasql.sqlite3")
L0_0 = require
L0_0("teamf1lualib/config")
L0_0 = {}
stats_db = L0_0
L0_0 = luasql
L0_0 = L0_0.sqlite3
L0_0 = L0_0()
function stats_db.connect(A0_1)
  _UPVALUE0_ = _UPVALUE1_:connect(A0_1)
end
function stats_db.execute(A0_2)
  cur, errorStr = _UPVALUE0_:execute(A0_2)
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
function stats_db.close()
  _UPVALUE0_:close()
  _UPVALUE1_:close()
end
function stats_db.getTable(A0_3, A1_4, A2_5)
  local L3_6, L4_7, L5_8, L6_9, L7_10, L8_11, L9_12, L10_13, L11_14, L12_15
  L3_6 = ""
  if A2_5 == nil then
    L4_7 = string
    L4_7 = L4_7.format
    L5_8 = [[
                                 SELECT *, _ROWID_ AS _ROWID_ FROM %s
	                          ]]
    L6_9 = A0_3
    L4_7 = L4_7(L5_8, L6_9)
    L3_6 = L4_7
  else
    L3_6 = A2_5
  end
  L4_7 = stats_db
  L4_7 = L4_7.execute
  L5_8 = L3_6
  L4_7 = L4_7(L5_8)
  L5_8 = 0
  L6_9 = {}
  if L4_7 then
    L8_11 = L4_7
    L7_10 = L4_7.fetch
    L7_10 = L7_10(L8_11, L9_12, L10_13)
    while L7_10 do
      L8_11 = {}
      L5_8 = L5_8 + 1
      for L12_15, _FORV_13_ in L9_12(L10_13) do
        if A1_4 or A1_4 == nil then
          L8_11[A0_3 .. "." .. L12_15] = _FORV_13_
        else
          L8_11[L12_15] = _FORV_13_
        end
      end
      L6_9[L5_8] = L8_11
      L12_15 = "a"
      L7_10 = L9_12
    end
    L8_11 = L4_7.close
    L8_11(L9_12)
  else
    L6_9 = nil
  end
  return L6_9
end
function stats_db.getTableWithJoin(A0_16)
  local L1_17, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25
  L1_17 = {}
  L2_18 = ""
  L3_19 = ""
  L4_20 = {}
  for L8_24, L9_25 in L5_21(L6_22) do
    if #util.split(L9_25, ":") == 3 then
      L1_17[util.split(L9_25, ":")[1]] = ""
      L1_17[util.split(L9_25, ":")[2]] = ""
      L3_19 = L3_19 .. util.split(L9_25, ":")[1] .. "." .. util.split(L9_25, ":")[3] .. " = " .. util.split(L9_25, ":")[2] .. "." .. util.split(L9_25, ":")[3] .. " AND "
    end
  end
  for L8_24, L9_25 in L5_21(L6_22) do
    L2_18 = L2_18 .. L8_24 .. ", "
  end
  L9_25 = L3_19
  L8_24 = L3_19.len
  L8_24 = L8_24(L9_25)
  L8_24 = L8_24 - 4
  L5_21(L6_22, L7_23, L8_24)
  L9_25 = L3_19
  L8_24 = L3_19.len
  L8_24 = L8_24(L9_25)
  L8_24 = L8_24 - 4
  L3_19 = L5_21
  L9_25 = L2_18
  L8_24 = L2_18.len
  L8_24 = L8_24(L9_25)
  L8_24 = L8_24 - 2
  L2_18 = L5_21
  for L8_24, L9_25 in L5_21(L6_22) do
    L4_20 = stats_db.getTableWithJoinHelper(L4_20, L8_24, L2_18, L3_19)
  end
  return L4_20
end
function stats_db.getTableWithJoinHelper(A0_26, A1_27, A2_28, A3_29)
  local L4_30, L5_31, L6_32, L7_33, L8_34, L9_35, L10_36, L11_37
  L4_30 = stats_db
  L4_30 = L4_30.execute
  L5_31 = string
  L5_31 = L5_31.format
  L6_32 = [[
		SELECT %s.*, %s.ROWID AS _ROWID_
		FROM %s
		WHERE %s
	]]
  L7_33 = A1_27
  L11_37 = L5_31(L6_32, L7_33, L8_34, L9_35, L10_36)
  L4_30 = L4_30(L5_31, L6_32, L7_33, L8_34, L9_35, L10_36, L11_37, L5_31(L6_32, L7_33, L8_34, L9_35, L10_36))
  L5_31 = 0
  if L4_30 then
    L7_33 = L4_30
    L6_32 = L4_30.fetch
    L6_32 = L6_32(L7_33, L8_34, L9_35)
    while L6_32 do
      L5_31 = L5_31 + 1
      L7_33 = A0_26[L5_31]
      L7_33 = L7_33 or {}
      for L11_37, _FORV_12_ in L8_34(L9_35) do
        L7_33[A1_27 .. "." .. L11_37] = _FORV_12_
      end
      A0_26[L5_31] = L7_33
      L11_37 = "a"
      L6_32 = L8_34
    end
    L7_33 = L4_30.close
    L7_33(L8_34)
  else
    A0_26 = nil
  end
  return A0_26
end
function stats_db.getRowWithJoin(A0_38, A1_39, A2_40)
  local L3_41
  L3_41 = stats_db
  L3_41 = L3_41.getTableWithJoin
  L3_41 = L3_41(A0_38)
  for _FORV_7_, _FORV_8_ in pairs(L3_41) do
    if _FORV_8_[A1_39] == A2_40 then
      return _FORV_8_
    end
  end
  return nil
end
function stats_db.getRowsWithJoin(A0_42, A1_43, A2_44)
  local L3_45, L4_46, L5_47, L6_48, L7_49, L8_50, L9_51
  L3_45 = stats_db
  L3_45 = L3_45.getTableWithJoin
  L4_46 = A0_42
  L3_45 = L3_45(L4_46)
  L4_46 = {}
  for L8_50, L9_51 in L5_47(L6_48) do
    if L9_51[A1_43] == A2_44 then
      table.insert(L4_46, L9_51)
    end
  end
  return L4_46
end
function stats_db.existsRow(A0_52, A1_53, A2_54)
  local L3_55
  L3_55 = stats_db
  L3_55 = L3_55.execute
  L3_55 = L3_55(string.format([[
		SELECT *, ROWID AS _ROWID_ FROM %s
		WHERE %s = '%s'
	]], A0_52, A1_53, A2_54))
  if L3_55 then
    L3_55:close()
  end
  return L3_55:fetch({}, "a")._ROWID_
end
function stats_db.existsRowWhere(A0_56, A1_57)
  local L2_58
  L2_58 = stats_db
  L2_58 = L2_58.execute
  L2_58 = L2_58(string.format([[
		SELECT *, ROWID AS _ROWID_ FROM %s
		WHERE %s
	]], A0_56, A1_57))
  if L2_58 then
    L2_58:close()
  end
  return L2_58:fetch({}, "a")._ROWID_
end
function stats_db.getRow(A0_59, A1_60, A2_61)
  local L3_62, L4_63, L5_64, L6_65, L7_66, L8_67, L9_68
  L3_62 = stats_db
  L3_62 = L3_62.execute
  L4_63 = string
  L4_63 = L4_63.format
  L5_64 = [[
		SELECT *, ROWID AS _ROWID_ FROM %s
		WHERE %s = '%s'
	]]
  L9_68 = L4_63(L5_64, L6_65, L7_66, L8_67)
  L3_62 = L3_62(L4_63, L5_64, L6_65, L7_66, L8_67, L9_68, L4_63(L5_64, L6_65, L7_66, L8_67))
  L4_63 = {}
  if L3_62 then
    L5_64 = L3_62.fetch
    L5_64 = L5_64(L6_65, L7_66, L8_67)
    L6_65(L7_66)
    if L5_64 then
      for L9_68, _FORV_10_ in L6_65(L7_66) do
        L4_63[A0_59 .. "." .. L9_68] = _FORV_10_
      end
    else
      L4_63 = nil
    end
  else
    L4_63 = nil
  end
  return L4_63
end
function stats_db.getRowWhere(A0_69, A1_70)
  local L2_71, L3_72, L4_73, L5_74, L6_75, L7_76, L8_77
  L2_71 = stats_db
  L2_71 = L2_71.execute
  L3_72 = string
  L3_72 = L3_72.format
  L4_73 = [[
		SELECT *, ROWID AS _ROWID_ FROM %s
		WHERE %s
	]]
  L8_77 = L3_72(L4_73, L5_74, L6_75)
  L2_71 = L2_71(L3_72, L4_73, L5_74, L6_75, L7_76, L8_77, L3_72(L4_73, L5_74, L6_75))
  L3_72 = {}
  if L2_71 then
    L4_73 = L2_71.fetch
    L4_73 = L4_73(L5_74, L6_75, L7_76)
    L5_74(L6_75)
    if L4_73 then
      for L8_77, _FORV_9_ in L5_74(L6_75) do
        L3_72[A0_69 .. "." .. L8_77] = _FORV_9_
      end
    else
      L3_72 = nil
    end
  else
    L3_72 = nil
  end
  return L3_72
end
function stats_db.getRowFromWhere(A0_78, A1_79)
  local L2_80, L3_81, L4_82, L5_83, L6_84, L7_85, L8_86
  L2_80 = stats_db
  L2_80 = L2_80.execute
  L3_81 = string
  L3_81 = L3_81.format
  L4_82 = [[
		SELECT *, ROWID AS _ROWID_ FROM %s
		WHERE %s
	]]
  L8_86 = L3_81(L4_82, L5_83, L6_84)
  L2_80 = L2_80(L3_81, L4_82, L5_83, L6_84, L7_85, L8_86, L3_81(L4_82, L5_83, L6_84))
  L3_81 = {}
  if L2_80 then
    L4_82 = L2_80.fetch
    L4_82 = L4_82(L5_83, L6_84, L7_85)
    L5_83(L6_84)
    if L4_82 then
      for L8_86, _FORV_9_ in L5_83(L6_84) do
        L3_81[tablename .. "." .. L8_86] = _FORV_9_
      end
    else
      L3_81 = nil
    end
  else
    L3_81 = nil
  end
  return L3_81
end
function stats_db.getRows(A0_87, A1_88, A2_89)
  local L3_90, L4_91, L5_92, L6_93, L7_94, L8_95, L9_96, L10_97, L11_98
  L3_90 = stats_db
  L3_90 = L3_90.execute
  L4_91 = string
  L4_91 = L4_91.format
  L5_92 = [[
		SELECT *, ROWID AS _ROWID_ FROM %s
		WHERE %s = '%s'
	]]
  L6_93 = A0_87
  L7_94 = A1_88
  L11_98 = L4_91(L5_92, L6_93, L7_94, L8_95)
  L3_90 = L3_90(L4_91, L5_92, L6_93, L7_94, L8_95, L9_96, L10_97, L11_98, L4_91(L5_92, L6_93, L7_94, L8_95))
  L4_91 = 0
  L5_92 = {}
  if L3_90 then
    L7_94 = L3_90
    L6_93 = L3_90.fetch
    L6_93 = L6_93(L7_94, L8_95, L9_96)
    while L6_93 do
      L7_94 = tonumber
      L7_94 = L7_94(L8_95)
      if L7_94 > 0 then
        L7_94 = {}
        L4_91 = L4_91 + 1
        for L11_98, _FORV_12_ in L8_95(L9_96) do
          L7_94[A0_87 .. "." .. L11_98] = _FORV_12_
        end
        L5_92[L4_91] = L7_94
      end
      L7_94 = L3_90.fetch
      L7_94 = L7_94(L8_95, L9_96, L10_97)
      L6_93 = L7_94
    end
    L7_94 = L3_90.close
    L7_94(L8_95)
  else
    L5_92 = nil
  end
  return L5_92
end
function stats_db.getRowsWhere(A0_99, A1_100)
  local L2_101, L3_102, L4_103, L5_104, L6_105, L7_106, L8_107, L9_108, L10_109
  L2_101 = stats_db
  L2_101 = L2_101.execute
  L3_102 = string
  L3_102 = L3_102.format
  L4_103 = [[
		SELECT *, ROWID AS _ROWID_ FROM %s
		WHERE %s
	]]
  L5_104 = A0_99
  L6_105 = A1_100
  L10_109 = L3_102(L4_103, L5_104, L6_105)
  L2_101 = L2_101(L3_102, L4_103, L5_104, L6_105, L7_106, L8_107, L9_108, L10_109, L3_102(L4_103, L5_104, L6_105))
  L3_102 = 0
  L4_103 = {}
  if L2_101 then
    L6_105 = L2_101
    L5_104 = L2_101.fetch
    L5_104 = L5_104(L6_105, L7_106, L8_107)
    while L5_104 do
      L6_105 = tonumber
      L6_105 = L6_105(L7_106)
      if L6_105 > 0 then
        L6_105 = {}
        L3_102 = L3_102 + 1
        for L10_109, _FORV_11_ in L7_106(L8_107) do
          L6_105[A0_99 .. "." .. L10_109] = _FORV_11_
        end
        L4_103[L3_102] = L6_105
      end
      L6_105 = L2_101.fetch
      L6_105 = L6_105(L7_106, L8_107, L9_108)
      L5_104 = L6_105
    end
    L6_105 = L2_101.close
    L6_105(L7_106)
  else
    L4_103 = nil
  end
  return L4_103
end
function stats_db.getDistinctValues(A0_110, A1_111)
  local L2_112, L3_113, L4_114, L5_115, L6_116, L7_117, L8_118, L9_119, L10_120
  L2_112 = stats_db
  L2_112 = L2_112.execute
  L3_113 = string
  L3_113 = L3_113.format
  L4_114 = "\t\tSELECT DISTINCT %s FROM %s"
  L5_115 = A1_111
  L6_116 = A0_110
  L10_120 = L3_113(L4_114, L5_115, L6_116)
  L2_112 = L2_112(L3_113, L4_114, L5_115, L6_116, L7_117, L8_118, L9_119, L10_120, L3_113(L4_114, L5_115, L6_116))
  L3_113 = 0
  L4_114 = {}
  if L2_112 then
    L6_116 = L2_112
    L5_115 = L2_112.fetch
    L5_115 = L5_115(L6_116, L7_117, L8_118)
    while L5_115 do
      L6_116 = {}
      L3_113 = L3_113 + 1
      for L10_120, _FORV_11_ in L7_117(L8_118) do
        L6_116[A0_110 .. "." .. L10_120] = _FORV_11_
      end
      L4_114[L3_113] = L6_116
      L10_120 = "a"
      L5_115 = L7_117
    end
    L6_116 = L2_112.close
    L6_116(L7_117)
  else
    L4_114 = nil
  end
  return L4_114
end
function stats_db.getDefaults(A0_121, ...)
  local L2_123, L3_124, L4_125, L5_126, L6_127, L7_128, L8_129, L9_130, L10_131, L11_132, L12_133, L13_134, L14_135
  L2_123 = {}
  L14_135 = ...
  ;({
    [11] = ...
  })[1] = L5_126
  ;({
    [11] = ...
  })[2] = L6_127
  ;({
    [11] = ...
  })[3] = L7_128
  ;({
    [11] = ...
  })[4] = L8_129
  ;({
    [11] = ...
  })[5] = L9_130
  ;({
    [11] = ...
  })[6] = L10_131
  ;({
    [11] = ...
  })[7] = L11_132
  ;({
    [11] = ...
  })[8] = L12_133
  ;({
    [11] = ...
  })[9] = L13_134
  ;({
    [11] = ...
  })[10] = L14_135
  for L6_127, L7_128 in L3_124(L4_125) do
    L8_129 = stats_db
    L8_129 = L8_129.getRows
    L8_129 = L8_129(L9_130, L10_131, L11_132)
    for L12_133, L13_134 in L9_130(L10_131) do
      L14_135 = L7_128
      L14_135 = L14_135 .. "." .. L13_134["tableDefaults.columnName"]
      L2_123[L14_135] = L13_134["tableDefaults.defValue"]
    end
    for L13_134, L14_135 in L10_131(L11_132) do
      if L14_135 == "_ROWID_" then
        L2_123[L7_128 .. "." .. L14_135] = "1"
      elseif not util.tableKeyExists(L2_123, L7_128 .. "." .. L14_135) then
        if A0_121 then
          L2_123[L7_128 .. "." .. L14_135] = ""
        else
          L2_123[L7_128 .. "." .. L14_135] = false
        end
      end
    end
  end
  return L2_123
end
function stats_db.getDef(A0_136, A1_137)
  if stats_db.getRowWhere("tableDefaults", "tableName = '" .. A0_136 .. "' AND columnName = '" .. A1_137 .. "'") then
    return stats_db.getRowWhere("tableDefaults", "tableName = '" .. A0_136 .. "' AND columnName = '" .. A1_137 .. "'")["tableDefaults.defValue"]
  else
    return ""
  end
end
function stats_db.getMin(A0_138, A1_139)
  if stats_db.getRowWhere("tableDefaults", "tableName = '" .. A0_138 .. "' AND columnName = '" .. A1_139 .. "'") then
    return stats_db.getRowWhere("tableDefaults", "tableName = '" .. A0_138 .. "' AND columnName = '" .. A1_139 .. "'")["tableDefaults.minValue"]
  else
    return ""
  end
end
function stats_db.getMax(A0_140, A1_141)
  if stats_db.getRowWhere("tableDefaults", "tableName = '" .. A0_140 .. "' AND columnName = '" .. A1_141 .. "'") then
    return stats_db.getRowWhere("tableDefaults", "tableName = '" .. A0_140 .. "' AND columnName = '" .. A1_141 .. "'")["tableDefaults.maxValue"]
  else
    return ""
  end
end
function stats_db.getDefStr(A0_142, A1_143)
  return "(" .. stats_db.getMin(A0_142, A1_143) .. "-" .. stats_db.getMax(A0_142, A1_143) .. ", default " .. stats_db.getDef(A0_142, A1_143) .. ")"
end
function stats_db.getAttribute(A0_144, A1_145, A2_146, A3_147)
  local L4_148
  L4_148 = stats_db
  L4_148 = L4_148.execute
  L4_148 = L4_148(string.format([[
		SELECT %s, ROWID AS _ROWID_ FROM %s
		WHERE %s = '%s'
	]], A3_147, A0_144, A1_145, A2_146))
  if L4_148 then
    L4_148:close()
    if L4_148:fetch({}, "a") then
    end
  end
  return L4_148:fetch({}, "a")[A3_147]
end
function stats_db.getAttributeWhere(A0_149, A1_150, A2_151)
  local L3_152
  L3_152 = stats_db
  L3_152 = L3_152.execute
  L3_152 = L3_152(string.format([[
    SELECT %s, ROWID AS _ROWID_ FROM %s
    WHERE %s
    ]], A2_151, A0_149, A1_150))
  if L3_152 then
    L3_152:close()
    if L3_152:fetch({}, "a") then
    end
  end
  return L3_152:fetch({}, "a")[A2_151]
end
function stats_db.setAttributeExt(A0_153, A1_154, A2_155, A3_156, A4_157, A5_158, A6_159)
  local L7_160, L8_161, L9_162
  L7_160 = "UPDATE "
  L8_161 = A0_153
  L9_162 = " SET "
  L7_160 = L7_160 .. L8_161 .. L9_162 .. A3_156 .. "=" .. A4_157
  if A5_158 ~= nil then
    L8_161 = L7_160
    L9_162 = ", OID="
    L7_160 = L8_161 .. L9_162 .. A5_158
  end
  if A6_159 ~= nil then
    L8_161 = L7_160
    L9_162 = ", objRevId="
    L7_160 = L8_161 .. L9_162 .. A6_159 + 1 .. " "
  end
  L8_161 = L7_160
  L9_162 = "WHERE "
  L7_160 = L8_161 .. L9_162 .. A1_154 .. "=" .. A2_155
  L8_161 = stats_db
  L8_161 = L8_161.existsRow
  L9_162 = A0_153
  L8_161 = L8_161(L9_162, A1_154, A2_155)
  if L8_161 then
    L8_161 = stats_db
    L8_161 = L8_161.execute
    L9_162 = L7_160
    L9_162 = L8_161(L9_162)
    util.appendDebugOut(L7_160 .. "<br>")
    return L8_161, L9_162
  else
    L8_161 = false
    return L8_161
  end
end
function stats_db.setAttribute(A0_163, A1_164, A2_165, A3_166, A4_167)
  local L5_168, L6_169, L7_170
  L5_168 = stats_db
  L5_168 = L5_168.existsRow
  L6_169 = A0_163
  L7_170 = A1_164
  L5_168 = L5_168(L6_169, L7_170, A2_165)
  if L5_168 then
    L5_168 = string
    L5_168 = L5_168.format
    L6_169 = [[
			UPDATE %s
            SET %s = '%s'
			WHERE %s = '%s'
		]]
    L7_170 = A0_163
    L5_168 = L5_168(L6_169, L7_170, A3_166, A4_167, A1_164, A2_165)
    L6_169 = stats_db
    L6_169 = L6_169.execute
    L7_170 = L5_168
    L7_170 = L6_169(L7_170)
    util.appendDebugOut(L5_168 .. "<br>")
    return L6_169, L7_170
  else
    L5_168 = false
    return L5_168
  end
end
function stats_db.setAttributeWhere(A0_171, A1_172, A2_173, A3_174)
  local L4_175, L5_176
  L4_175 = stats_db
  L4_175 = L4_175.existsRowWhere
  L5_176 = A0_171
  L4_175 = L4_175(L5_176, A1_172)
  if L4_175 then
    L4_175 = stats_db
    L4_175 = L4_175.execute
    L5_176 = string
    L5_176 = L5_176.format
    L5_176 = L5_176([[
			UPDATE %s
            SET %s = '%s'
			WHERE %s
		]], A0_171, A2_173, A3_174, A1_172)
    L5_176 = L4_175(L5_176, L5_176([[
			UPDATE %s
            SET %s = '%s'
			WHERE %s
		]], A0_171, A2_173, A3_174, A1_172))
    return L4_175, L5_176
  else
    L4_175 = false
    return L4_175
  end
end
function stats_db.deleteRow(A0_177, A1_178, A2_179)
  local L3_180, L4_181
  L3_180 = stats_db
  L3_180 = L3_180.execute
  L4_181 = string
  L4_181 = L4_181.format
  L4_181 = L4_181([[
		DELETE FROM %s
		WHERE %s = '%s'
	]], A0_177, A1_178, A2_179)
  L4_181 = L3_180(L4_181, L4_181([[
		DELETE FROM %s
		WHERE %s = '%s'
	]], A0_177, A1_178, A2_179))
  return L3_180, L4_181
end
function stats_db.deleteRowWhere(A0_182, A1_183)
  local L2_184, L3_185
  L2_184 = stats_db
  L2_184 = L2_184.execute
  L3_185 = string
  L3_185 = L3_185.format
  L3_185 = L3_185([[
		DELETE FROM %s
		WHERE %s
	]], A0_182, A1_183)
  L3_185 = L2_184(L3_185, L3_185([[
		DELETE FROM %s
		WHERE %s
	]], A0_182, A1_183))
  return L2_184, L3_185
end
function stats_db.insert(A0_186, A1_187, A2_188)
  local L3_189, L4_190, L5_191, L6_192, L7_193, L8_194, L9_195, L10_196, L11_197, L12_198
  L3_189 = ""
  L4_190 = "INSERT INTO "
  L5_191 = A0_186
  L6_192 = " ("
  L4_190 = L4_190 .. L5_191 .. L6_192
  L5_191 = ") VALUES ("
  L6_192 = stats_db
  L6_192 = L6_192.getColNames
  L7_193 = A0_186
  L6_192 = L6_192(L7_193)
  L7_193 = stats_db
  L7_193 = L7_193.getDefaults
  L7_193 = L7_193(L8_194, L9_195)
  for L11_197, L12_198 in L8_194(L9_195) do
    L4_190 = L4_190 .. "'" .. L12_198 .. "', "
    if L12_198 == "_ROWID_" then
      L5_191 = L5_191 .. "(select OID from oidRecord where tableName=\"" .. A0_186 .. "\"), "
    elseif A2_188 and util.tableKeyExists(A1_187, L12_198) then
      L5_191 = L5_191 .. "'" .. A1_187[L12_198] .. "', "
    elseif util.tableKeyExists(A1_187, A0_186 .. "." .. L12_198) then
      L5_191 = L5_191 .. "'" .. A1_187[A0_186 .. "." .. L12_198] .. "', "
    elseif L7_193[A0_186 .. "." .. L12_198] then
      L5_191 = L5_191 .. "'" .. L7_193[A0_186 .. "." .. L12_198] .. "', "
    else
      L5_191 = L5_191 .. "NULL, "
    end
  end
  L12_198 = L4_190
  L11_197 = L4_190.len
  L11_197 = L11_197(L12_198)
  L11_197 = L11_197 - 2
  L4_190 = L8_194
  L12_198 = L5_191
  L11_197 = L5_191.len
  L11_197 = L11_197(L12_198)
  L11_197 = L11_197 - 2
  L5_191 = L8_194
  L5_191 = L8_194 .. L9_195
  L3_189 = L8_194 .. L9_195
  L11_197 = L3_189
  L12_198 = "<br>\n"
  L11_197 = L11_197 .. L12_198
  L10_196(L11_197)
  L11_197 = L9_195
  return L10_196, L11_197
end
function stats_db.update(A0_199, A1_200, A2_201)
  local L3_202, L4_203, L5_204, L6_205, L7_206, L8_207, L9_208, L10_209, L11_210, L12_211, L13_212
  L3_202 = "UPDATE "
  L4_203 = A0_199
  L5_204 = " SET "
  L3_202 = L3_202 .. L4_203 .. L5_204
  L4_203 = ""
  L5_204 = nil
  L6_205 = stats_db
  L6_205 = L6_205.getColNames
  L6_205 = L6_205(L7_206)
  for L10_209, L11_210 in L7_206(L8_207) do
    L12_211 = util
    L12_211 = L12_211.split
    L13_212 = L10_209
    L12_211 = L12_211(L13_212, ".")
    L13_212 = #L12_211
    if L13_212 == 2 then
      L13_212 = L12_211[1]
      if L13_212 == A0_199 then
        L13_212 = util
        L13_212 = L13_212.keyTableValueExists
        L13_212 = L13_212(L6_205, L12_211[2])
        if L13_212 then
          L13_212 = L12_211[2]
          if A0_199 == "NimfConf" or A0_199 == "dhcp" then
            L4_203 = L4_203 .. L12_211[2] .. " = '" .. L11_210 .. "', "
          elseif L13_212 == "objRevId" then
            L4_203 = L4_203 .. L13_212 .. "='" .. L11_210 + 1
            L4_203 = L4_203 .. "', "
          elseif stats_db.getAttribute(A0_199, "_ROWID_", A2_201, L13_212) == L11_210 then
            util.appendOut("field " .. L13_212 .. " hasnt changed<br>")
          else
            L4_203 = L4_203 .. L12_211[2] .. " = '" .. L11_210 .. "', "
          end
        end
      end
    end
  end
  L3_202 = L7_206 .. L8_207
  L11_210 = L3_202
  L10_209 = L3_202.len
  L10_209 = L10_209(L11_210)
  L10_209 = L10_209 - 2
  L3_202 = L7_206
  L10_209 = "'"
  L3_202 = L7_206 .. L8_207 .. L9_208 .. L10_209
  if L4_203 ~= "" then
    L10_209 = L3_202
    L11_210 = "<br>"
    L10_209 = L10_209 .. L11_210
    L9_208(L10_209)
    L10_209 = L8_207
    L11_210 = "UPDATED"
    return L9_208, L10_209, L11_210
  else
    return L7_206, L8_207, L9_208
  end
end
function stats_db.delete(A0_213, A1_214)
  local L2_215, L3_216, L4_217, L5_218, L6_219, L7_220
  L2_215 = "DELETE FROM "
  L2_215 = L2_215 .. L3_216 .. L4_217
  for L6_219, L7_220 in L3_216(L4_217) do
    L2_215 = L2_215 .. "_ROWID_ = '" .. L7_220 .. "' OR "
  end
  L7_220 = L2_215
  L6_219 = L2_215.len
  L6_219 = L6_219(L7_220)
  L6_219 = L6_219 - 3
  L2_215 = L3_216
  L6_219 = L2_215
  L7_220 = "<br>"
  L6_219 = L6_219 .. L7_220
  L5_218(L6_219)
  L6_219 = L4_217
  return L5_218, L6_219
end
function stats_db.getColNames(A0_221)
  local L1_222, L2_223
  L1_222 = stats_db
  L1_222 = L1_222.execute
  L2_223 = string
  L2_223 = L2_223.format
  L2_223 = L2_223([[
		SELECT * FROM %s
	]], A0_221)
  L1_222 = L1_222(L2_223, L2_223([[
		SELECT * FROM %s
	]], A0_221))
  L2_223 = {}
  if L1_222 then
    L2_223 = L1_222:getcolnames()
    L1_222:close()
  else
    L2_223 = nil
  end
  return L2_223
end
function stats_db.numCols(A0_224)
  return #stats_db.getColNames(A0_224)
end
function stats_db.getColTypes(A0_225)
  local L1_226, L2_227
  L1_226 = stats_db
  L1_226 = L1_226.execute
  L2_227 = string
  L2_227 = L2_227.format
  L2_227 = L2_227([[
		SELECT * FROM %s
	]], A0_225)
  L1_226 = L1_226(L2_227, L2_227([[
		SELECT * FROM %s
	]], A0_225))
  L2_227 = {}
  if L1_226 then
    L2_227 = L1_226:getcoltypes()
    L1_226:close()
  else
    L2_227 = nil
  end
  return L2_227
end
function stats_db.getColType(A0_228, A1_229)
  if util.keyTableValueExists(stats_db.getColNames(A0_228), A1_229) then
    return stats_db.getColTypes(A0_228)[util.keyTableValueExists(stats_db.getColNames(A0_228), A1_229)]
  else
    return nil
  end
end
function stats_db.typeAndRangeValidate(A0_230)
  local L1_231
  L1_231 = true
  return L1_231
end
function stats_db.printTable(A0_232)
  local L1_233, L2_234, L3_235, L4_236, L5_237, L6_238, L7_239, L8_240, L9_241
  L1_233 = stats_db
  L1_233 = L1_233.execute
  L2_234 = string
  L2_234 = L2_234.format
  L3_235 = [[
		SELECT *, ROWID AS _ROWID_ FROM %s
	]]
  L4_236 = A0_232
  L9_241 = L2_234(L3_235, L4_236)
  L1_233 = L1_233(L2_234, L3_235, L4_236, L5_237, L6_238, L7_239, L8_240, L9_241, L2_234(L3_235, L4_236))
  L2_234 = ""
  if L1_233 then
    L4_236 = L1_233
    L3_235 = L1_233.fetch
    L3_235 = L3_235(L4_236, L5_237, L6_238)
    L4_236 = "***** DB Table: "
    L2_234 = L4_236 .. L5_237 .. L6_238
    while L3_235 do
      L4_236 = "ROW ::: "
      for L8_240, L9_241 in L5_237(L6_238) do
        L4_236 = L4_236 .. L8_240 .. " = " .. L9_241 .. ", "
      end
      L9_241 = L4_236
      L8_240 = L4_236.len
      L8_240 = L8_240(L9_241)
      L8_240 = L8_240 - 2
      L4_236 = L5_237
      L2_234 = L5_237 .. L6_238 .. L7_239
      L8_240 = "a"
      L3_235 = L5_237
    end
    L4_236 = L2_234
    L2_234 = L4_236 .. L5_237
    L4_236 = L1_233.close
    L4_236(L5_237)
  else
    L3_235 = "Empty table: "
    L4_236 = A0_232
    L2_234 = L3_235 .. L4_236 .. L5_237
  end
  return L2_234
end
function stats_db.tableSize(A0_242)
  local L1_243
  L1_243 = stats_db
  L1_243 = L1_243.execute
  L1_243 = L1_243(string.format([[
		SELECT COUNT(*) FROM %s
	]], A0_242))
  if L1_243 then
    L1_243:close()
    return L1_243:fetch({}, "n")[1]
  else
    return 0
  end
end
function stats_db.getNextRowId(A0_244, A1_245)
  local L2_246, L3_247
  L2_246 = "_ROWID_"
  L3_247 = stats_db
  L3_247 = L3_247.execute
  L3_247 = L3_247(string.format([[
        SELECT %s, ROWID AS _ROWID_ FROM %s
        LIMIT %s,1
        ]], L2_246, A1_245, A0_244))
  if L3_247 then
    L3_247:close()
    if L3_247:fetch({}, "a") then
    end
  end
  return L3_247:fetch({}, "a")[L2_246]
end
function stats_db.columnMaxValue(A0_248, A1_249)
  local L2_250
  L2_250 = stats_db
  L2_250 = L2_250.execute
  L2_250 = L2_250(string.format([[
		SELECT MAX(%s) FROM %s
	]], A1_249, A0_248))
  if L2_250 then
    L2_250:close()
    return L2_250:fetch({}, "n")[1]
  else
    return 0
  end
end
function stats_db.saveTable(A0_251, A1_252, A2_253, A3_254, A4_255, A5_256)
  local L6_257, L7_258, L8_259, L9_260, L10_261, L11_262, L12_263, L13_264
  L6_257 = ""
  L7_258 = ""
  A3_254 = A3_254 or L8_259
  if L8_259 ~= "number" then
  else
    if L8_259 == "string" then
      L6_257 = L8_259 .. L9_260
      L7_258 = L8_259 .. L9_260
      L11_262 = L7_258
      L8_259(L9_260, L10_261, L11_262)
  end
  else
    if L8_259 == "table" then
      if L8_259 ~= nil then
        if L8_259 == "10" then
          return L8_259
        end
      end
      if L8_259 ~= nil then
        if L8_259 ~= nil then
          return L8_259
        end
      end
      L6_257 = L8_259 .. L9_260
      if L8_259 then
        L8_259(L9_260, L10_261)
        L11_262 = "\n"
        L8_259(L9_260, L10_261, L11_262)
      else
        L8_259(L9_260, L10_261)
        L8_259(L9_260, L10_261)
        A3_254[A2_253] = A1_252
        for L11_262, L12_263 in L8_259(L9_260) do
          L13_264 = nil
          if A5_256 == 1 then
            L13_264 = string.format("%s[%d]", A1_252, A4_255)
          else
            L13_264 = string.format("%s[%s]", A1_252, _UPVALUE0_(L11_262))
          end
          A4_255 = A4_255 + stats_db.saveTable(A0_251, L13_264, L12_263, A3_254, A4_255, 0)
        end
      end
    else
    end
  end
  L8_259(L9_260)
  return L8_259
end
function stats_db.save()
  local L0_265, L1_266
  L0_265 = stats_db
  L0_265 = L0_265.export
  L1_266 = SETTINGS_FILE
  L0_265(L1_266)
  L0_265 = config
  L0_265 = L0_265.updateChecksum
  L1_266 = db
  L0_265(L1_266, SETTINGS_FILE)
  L0_265 = stats_db
  L0_265 = L0_265.getAttribute
  L1_266 = "environment"
  L0_265 = L0_265(L1_266, "name", "CFG_WRITE_PROGRAM", "value")
  L1_266 = stats_db
  L1_266 = L1_266.getAttribute
  L1_266 = L1_266("environment", "name", "FLASH_CFG_PARTITION", "value")
  util.appendDebugOut("Exec = " .. os.execute(L0_265 .. " " .. L1_266 .. " " .. SETTINGS_FILE))
  util.appendDebugOut("Saved DB!<br>")
end
function stats_db.export(A0_267)
  local L1_268, L2_269
  L1_268 = io
  L1_268 = L1_268.open
  L2_269 = A0_267
  L1_268 = L1_268(L2_269, "wb")
  L2_269 = stats_db
  L2_269 = L2_269.getTable
  L2_269 = L2_269("saveTables", false)
  for _FORV_6_, _FORV_7_ in pairs(L2_269) do
    stats_db.saveTable(L1_268, _FORV_7_.tableName, stats_db.getTable(_FORV_7_.tableName, false), false, 1, 1)
  end
end
function stats_db.insertImport(A0_270, A1_271, A2_272)
  local L3_273, L4_274, L5_275, L6_276, L7_277, L8_278, L9_279, L10_280, L11_281, L12_282
  L3_273 = ""
  L4_274 = "INSERT INTO "
  L5_275 = A0_270
  L6_276 = " ("
  L4_274 = L4_274 .. L5_275 .. L6_276
  L5_275 = ") VALUES ("
  L6_276 = stats_db
  L6_276 = L6_276.getColNames
  L7_277 = A0_270
  L6_276 = L6_276(L7_277)
  L7_277 = stats_db
  L7_277 = L7_277.getDefaults
  L7_277 = L7_277(L8_278, L9_279)
  for L11_281, L12_282 in L8_278(L9_279) do
    L4_274 = L4_274 .. "'" .. L12_282 .. "', "
    if A2_272 and util.tableKeyExists(A1_271, L12_282) then
      L5_275 = L5_275 .. "'" .. A1_271[L12_282] .. "', "
    elseif util.tableKeyExists(A1_271, A0_270 .. "." .. L12_282) then
      L5_275 = L5_275 .. "'" .. A1_271[A0_270 .. "." .. L12_282] .. "', "
    elseif L7_277[A0_270 .. "." .. L12_282] then
      L5_275 = L5_275 .. "'" .. L7_277[A0_270 .. "." .. L12_282] .. "', "
    else
      L5_275 = L5_275 .. "NULL, "
    end
  end
  L12_282 = L4_274
  L11_281 = L4_274.len
  L11_281 = L11_281(L12_282)
  L11_281 = L11_281 - 2
  L4_274 = L8_278
  L12_282 = L5_275
  L11_281 = L5_275.len
  L11_281 = L11_281(L12_282)
  L11_281 = L11_281 - 2
  L5_275 = L8_278
  L5_275 = L8_278 .. L9_279
  L3_273 = L8_278 .. L9_279
  L11_281 = L3_273
  L12_282 = "<br>\n"
  L11_281 = L11_281 .. L12_282
  L10_280(L11_281)
  L11_281 = L9_279
  return L10_280, L11_281
end
function stats_db.import(A0_283)
  local L1_284, L2_285, L3_286, L4_287, L5_288, L6_289, L7_290, L8_291, L9_292, L10_293, L11_294, L12_295, L13_296, L14_297, L15_298, L16_299, L17_300, L18_301, L19_302
  L1_284 = true
  L2_285 = util
  L2_285 = L2_285.appendDebugOut
  L2_285(L3_286)
  L2_285 = dofile
  L2_285(L3_286)
  L2_285 = stats_db
  L2_285 = L2_285.getTable
  L2_285 = L2_285(L3_286, L4_287)
  L3_286()
  for L6_289, L7_290 in L3_286(L4_287) do
    if not L1_284 then
      break
    end
    L8_291 = L7_290.tableName
    L9_292 = util
    L9_292 = L9_292.getLuaVariable
    L9_292 = L9_292(L10_293)
    if L9_292 == nil then
      L10_293(L11_294)
    end
    if L9_292 ~= nil then
      if L10_293 >= 1 then
        for L13_296, L14_297 in L10_293(L11_294) do
          if L8_291 == "oidRecord" then
            L15_298 = {}
            for L19_302, _FORV_20_ in L16_299(L17_300) do
              L15_298[L8_291 .. "." .. L19_302] = _FORV_20_
            end
            L19_302 = L9_292[L13_296]
            L19_302 = L19_302._ROWID_
            L1_284 = L16_299
          else
            L15_298 = stats_db
            L15_298 = L15_298.insertImport
            L19_302 = true
            L15_298 = L15_298(L16_299, L17_300, L18_301, L19_302)
            L1_284 = L15_298
          end
          if not L1_284 then
            L15_298 = print
            L15_298(L16_299)
            break
          end
        end
      end
    end
  end
  if L1_284 then
    L3_286()
    return L3_286
  else
    L3_286()
    return L3_286
  end
end
function stats_db.beginTransaction()
  queryString = "BEGIN TRANSACTION"
  util.appendDebugOut(queryString .. "<br>")
end
function stats_db.commitTransaction()
  queryString = "COMMIT"
  util.appendDebugOut(queryString .. "<br>")
end
function stats_db.rollback()
  queryString = "ROLLBACK"
  util.appendDebugOut(queryString .. "<br>")
end
