local L0_0
L0_0 = module
L0_0("com.teamf1.core.filter.blockedKeywords", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/filter_content")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/filter_validation")
L0_0 = require
L0_0("teamf1lualib/wcf_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.filter.content")
blockedkeywordsTable = "BlockSites"
;({}).active = "Status"
;({}).word = "KeywordToBlock"
;({}).lanGroup = "KeywordBlockingTo"
;({}).useLanGroups = "useLanGroups"
if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-1000" or UNIT_NAME == "DSR-1000N" then
elseif UNIT_NAME == "DSR-500AC" or UNIT_NAME == "DSR-500" or UNIT_NAME == "DSR-500N" then
elseif UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-250N" then
else
end
function isfeatureEnabledNext(A0_1)
  local L2_2
  L2_2 = _UPVALUE0_
  L2_2 = L2_2.NOT_SUPPORTED
  return L2_2, A0_1
end
function featureEnable(A0_3)
  local L2_4
  L2_4 = _UPVALUE0_
  L2_4 = L2_4.NOT_SUPPORTED
  return L2_4, A0_3
end
function featureDisable(A0_5)
  local L2_6
  L2_6 = _UPVALUE0_
  L2_6 = L2_6.NOT_SUPPORTED
  return L2_6, A0_5
end
function isuseLanGroupsEnabled()
  local L1_7
  L1_7 = _UPVALUE0_
  L1_7 = L1_7.NOT_SUPPORTED
  return L1_7, cookie
end
function isuseLanGroupsEnabledNext(A0_8)
  local L2_9
  L2_9 = _UPVALUE0_
  L2_9 = L2_9.NOT_SUPPORTED
  return L2_9, A0_8
end
function useLanGroupsEnable(A0_10)
  local L2_11
  L2_11 = _UPVALUE0_
  L2_11 = L2_11.NOT_SUPPORTED
  return L2_11, A0_10
end
function useLanGroupsDisable(A0_12)
  local L2_13
  L2_13 = _UPVALUE0_
  L2_13 = L2_13.NOT_SUPPORTED
  return L2_13, A0_12
end
function wordGet()
  local L0_14, L1_15, L2_16
  L0_14 = db.getNextRowId(_UPVALUE0_, blockedkeywordsTable)
  if _UPVALUE1_.NIL == L0_14 then
    return _UPVALUE2_.BLOCKKEYWORDS_NIL_TABLE
  end
  L2_16 = db.getAttribute(blockedkeywordsTable, _UPVALUE3_, L0_14, _UPVALUE4_.word)
  if L2_16 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_14, L2_16
end
function wordGetNext(A0_17)
  local L1_18, L2_19, L3_20
  if A0_17 == _UPVALUE0_.NIL then
    return _UPVALUE1_.BLOCKKEYWORDS_COOKIE_NIL
  end
  valid = db.existsRow(blockedkeywordsTable, _UPVALUE2_, A0_17)
  if not valid then
    return _UPVALUE1_.INVALID_BLOCKKEYWORDS_COOKIE
  end
  L3_20 = db.getNextRowId(A0_17, blockedkeywordsTable)
  if _UPVALUE0_.NIL == L3_20 then
    return _UPVALUE1_.BLOCKKEYWORDS_COMPLETE_TABLE
  end
  L2_19 = db.getAttribute(blockedkeywordsTable, _UPVALUE2_, L3_20, _UPVALUE3_.word)
  if L2_19 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L3_20
  end
  return _UPVALUE0_.SUCCESS, L3_20, L2_19
end
function wordSet(A0_21, A1_22)
  local L2_23, L3_24, L4_25, L5_26, L6_27
  if A0_21 == _UPVALUE0_.NIL then
    return _UPVALUE1_.BLOCKKEYWORDS_COOKIE_NIL
  end
  L2_23 = db.existsRow(blockedkeywordsTable, _UPVALUE2_, A0_21)
  if not L2_23 then
    return _UPVALUE1_.INVALID_BLOCKKEYWORDS_COOKIE
  end
  if A1_22 == _UPVALUE0_.NIL then
    return _UPVALUE1_.BLOCKKEYWORDS_WORD_NIL
  end
  if string.len(A1_22) > _UPVALUE3_ or string.len(A1_22) < _UPVALUE4_ then
    return _UPVALUE1_.INVALID_BLOCKKEYWORDS_WORD
  end
  L2_23 = _UPVALUE5_.urlValidation(A1_22)
  if not L2_23 then
    return _UPVALUE1_.INVALID_BLOCKKEYWORDS_WORD
  end
  L2_23 = _UPVALUE5_.urlProtocolCheck(A1_22)
  if not L2_23 then
    return _UPVALUE1_.URL_PROTOCOL_NOT_ALLOWED
  end
  if db.getAttribute(blockedkeywordsTable, _UPVALUE6_.word, A1_22, _UPVALUE6_.word) ~= nil then
    return _UPVALUE0_.CONFIGURED_ENTRY_EXISTS
  end
  L6_27 = db.setAttribute(blockedkeywordsTable, _UPVALUE2_, A0_21, _UPVALUE6_.word, A1_22)
  if not L6_27 then
    return _UPVALUE0_.FAILURE, A0_21
  end
  return _UPVALUE0_.SUCCESS, A0_21
end
function wordDelete(A0_28)
  local L1_29, L2_30, L3_31, L4_32, L5_33
  if A0_28 == _UPVALUE0_.NIL then
    return _UPVALUE1_.BLOCKKEYWORDS_COOKIE_NIL
  end
  L1_29 = db.existsRow(blockedkeywordsTable, _UPVALUE2_, A0_28)
  if not L1_29 then
    return _UPVALUE1_.INVALID_BLOCKKEYWORDS_COOKIE
  end
  L5_33 = db.deleteRow(blockedkeywordsTable, _UPVALUE2_, A0_28)
  if not L5_33 then
    return _UPVALUE0_.FAILURE, A0_28
  end
  return _UPVALUE0_.SUCCESS, A0_28
end
function lanGroupGet()
  local L0_34, L1_35, L2_36
  L0_34 = db.getNextRowId(_UPVALUE0_, blockedkeywordsTable)
  if _UPVALUE1_.NIL == L0_34 then
    return _UPVALUE2_.BLOCKKEYWORDS_NIL_TABLE
  end
  L2_36 = db.getAttribute(blockedkeywordsTable, _UPVALUE3_, L0_34, _UPVALUE4_.lanGroup)
  if L2_36 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_34, L2_36
end
function lanGroupGetNext(A0_37)
  local L1_38, L2_39, L3_40
  if A0_37 == _UPVALUE0_.NIL then
    return _UPVALUE1_.BLOCKKEYWORDS_COOKIE_NIL
  end
  valid = db.existsRow(blockedkeywordsTable, _UPVALUE2_, A0_37)
  if not valid then
    return _UPVALUE1_.INVALID_BLOCKKEYWORDS_COOKIE
  end
  L3_40 = db.getNextRowId(A0_37, blockedkeywordsTable)
  if _UPVALUE0_.NIL == L3_40 then
    return _UPVALUE1_.BLOCKKEYWORDS_COMPLETE_TABLE
  end
  L2_39 = db.getAttribute(blockedkeywordsTable, _UPVALUE2_, L3_40, _UPVALUE3_.lanGroup)
  if L2_39 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L3_40
  end
  return _UPVALUE0_.SUCCESS, L3_40, L2_39
end
function lanGroupSet(A0_41, A1_42)
  local L2_43, L3_44, L4_45, L5_46, L6_47
  if A0_41 == _UPVALUE0_.NIL then
    return _UPVALUE1_.BLOCKKEYWORDS_COOKIE_NIL
  end
  L2_43 = db.existsRow(blockedkeywordsTable, _UPVALUE2_, A0_41)
  if not L2_43 then
    return _UPVALUE1_.INVALID_BLOCKKEYWORDS_COOKIE
  end
  if A1_42 == _UPVALUE0_.NIL then
    return _UPVALUE1_.BLOCKKEYWORDS_LANGROUP_NIL
  end
  L2_43 = _UPVALUE3_.lanGroupValidation(A1_42)
  if not L2_43 then
    return _UPVALUE1_.INVALID_BLOCKKEYWORDS_LANGROUP
  end
  L6_47 = db.setAttribute(blockedkeywordsTable, _UPVALUE2_, A0_41, _UPVALUE4_.lanGroup, A1_42)
  if not L6_47 then
    return _UPVALUE0_.FAILURE, A0_41
  end
  return _UPVALUE0_.SUCCESS, A0_41
end
function activeGet()
  local L0_48, L1_49, L2_50, L3_51
  L0_48 = db.getNextRowId(_UPVALUE0_, blockedkeywordsTable)
  if _UPVALUE1_.NIL == L0_48 then
    return _UPVALUE2_.BLOCKKEYWORDS_NIL_TABLE
  end
  L3_51 = db.getAttribute(blockedkeywordsTable, _UPVALUE3_, L0_48, _UPVALUE4_.active)
  if L3_51 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_48, L3_51
end
function activeGetNext(A0_52)
  local L1_53, L2_54, L3_55
  if A0_52 == _UPVALUE0_.NIL then
    return _UPVALUE1_.BLOCKKEYWORDS_COOKIE_NIL
  end
  valid = db.existsRow(blockedkeywordsTable, _UPVALUE2_, A0_52)
  if not valid then
    return _UPVALUE1_.INVALID_BLOCKKEYWORDS_COOKIE
  end
  L3_55 = db.getNextRowId(A0_52, blockedkeywordsTable)
  if _UPVALUE0_.NIL == L3_55 then
    return _UPVALUE1_.BLOCKKEYWORDS_COMPLETE_TABLE
  end
  L2_54 = db.getAttribute(blockedkeywordsTable, _UPVALUE2_, L3_55, _UPVALUE3_.active)
  if L2_54 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L3_55
  end
  return _UPVALUE0_.SUCCESS, L3_55, L2_54
end
function activeSet(A0_56, A1_57)
  local L2_58, L3_59, L4_60, L5_61, L6_62
  if A0_56 == _UPVALUE0_.NIL then
    return _UPVALUE1_.BLOCKKEYWORDS_COOKIE_NIL
  end
  L2_58 = db.existsRow(blockedkeywordsTable, _UPVALUE2_, A0_56)
  if not L2_58 then
    return _UPVALUE1_.INVALID_BLOCKKEYWORDS_COOKIE
  end
  if A1_57 == _UPVALUE0_.NIL then
    return _UPVALUE1_.BLOCKKEYWORDS_STATUS_NIL
  end
  L2_58 = _UPVALUE3_.isBoolean(A1_57)
  if L2_58 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE1_.INVALID_BLOCKKEYWORDS_STATUS, A0_56
  end
  L6_62 = db.setAttribute(blockedkeywordsTable, _UPVALUE2_, A0_56, _UPVALUE4_.active, A1_57)
  if not L6_62 then
    return _UPVALUE0_.FAILURE, A0_56
  end
  return _UPVALUE0_.SUCCESS, A0_56
end
function activeSetAll(A0_63, A1_64)
  local L2_65, L3_66, L4_67, L5_68, L6_69, L7_70, L8_71
  L3_66 = _UPVALUE0_
  L3_66 = L3_66.FAILURE
  for L7_70, L8_71 in L4_67(L5_68) do
    L3_66, L2_65 = activeSet(L8_71, A1_64)
    if L3_66 ~= _UPVALUE0_.SUCCESS then
      return L3_66, L2_65
    end
  end
  L3_66 = L4_67.SUCCESS
  return L4_67, L5_68
end
function blockedKeywordsGet()
  local L0_72, L1_73, L2_74, L3_75, L4_76, L5_77
  L5_77 = {}
  L0_72 = db.getNextRowId(_UPVALUE0_, blockedkeywordsTable)
  if _UPVALUE1_.NIL == L0_72 then
    return _UPVALUE2_.BLOCKKEYWORDS_NIL_TABLE
  end
  L5_77 = db.getRow(blockedkeywordsTable, _UPVALUE3_, L0_72)
  if L5_77 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  L3_75 = L5_77[blockedkeywordsTable .. "." .. _UPVALUE4_.active]
  L2_74 = L5_77[blockedkeywordsTable .. "." .. _UPVALUE4_.word]
  L4_76 = L5_77[blockedkeywordsTable .. "." .. _UPVALUE4_.lanGroup]
  return _UPVALUE1_.SUCCESS, L0_72, L3_75, L2_74, L4_76
end
function blockedKeywordsGetNext(A0_78)
  local L1_79, L2_80, L3_81, L4_82, L5_83, L6_84
  L6_84 = {}
  if A0_78 == _UPVALUE0_.NIL then
    return _UPVALUE1_.BLOCKKEYWORDS_COOKIE_NIL
  end
  valid = db.existsRow(blockedkeywordsTable, _UPVALUE2_, A0_78)
  if not valid then
    return _UPVALUE1_.INVALID_BLOCKKEYWORDS_COOKIE
  end
  L3_81 = db.getNextRowId(A0_78, blockedkeywordsTable)
  if _UPVALUE0_.NIL == L3_81 then
    return _UPVALUE1_.BLOCKKEYWORDS_COMPLETE_TABLE
  end
  if db.getRow(blockedkeywordsTable, _UPVALUE2_, L3_81) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L4_82 = db.getRow(blockedkeywordsTable, _UPVALUE2_, L3_81)[blockedkeywordsTable .. "." .. _UPVALUE3_.active]
  L2_80 = db.getRow(blockedkeywordsTable, _UPVALUE2_, L3_81)[blockedkeywordsTable .. "." .. _UPVALUE3_.word]
  L5_83 = db.getRow(blockedkeywordsTable, _UPVALUE2_, L3_81)[blockedkeywordsTable .. "." .. _UPVALUE3_.lanGroup]
  return _UPVALUE0_.SUCCESS, L3_81, L4_82, L2_80, L5_83
end
function blockedKeywordsSet(A0_85, A1_86, A2_87, A3_88)
  local L4_89, L5_90, L6_91, L7_92, L8_93, L9_94
  L9_94 = {}
  if A0_85 == _UPVALUE0_.NIL then
    return _UPVALUE1_.BLOCKKEYWORDS_COOKIE_NIL
  end
  L4_89 = db.existsRow(blockedkeywordsTable, _UPVALUE2_, A0_85)
  if not L4_89 then
    return _UPVALUE1_.INVALID_BLOCKKEYWORDS_COOKIE
  end
  if A1_86 == _UPVALUE0_.NIL then
    return _UPVALUE1_.BLOCKKEYWORDS_STATUS_NIL
  end
  L4_89 = _UPVALUE3_.isBoolean(A1_86)
  if L4_89 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE1_.INVALID_BLOCKKEYWORDS_STATUS
  end
  if A2_87 == _UPVALUE0_.NIL then
    return _UPVALUE1_.BLOCKKEYWORDS_WORD_NIL
  end
  if string.len(A2_87) > _UPVALUE4_ or string.len(A2_87) < _UPVALUE5_ then
    return _UPVALUE1_.INVALID_BLOCKKEYWORDS_WORD
  end
  if A3_88 == _UPVALUE0_.NIL then
    return _UPVALUE1_.BLOCKKEYWORDS_LANGROUP_NIL
  end
  L4_89 = _UPVALUE6_.lanGroupValidation(A3_88)
  if not L4_89 then
    return _UPVALUE1_.INVALID_BLOCKKEYWORDS_LANGROUP
  end
  L9_94[blockedkeywordsTable .. "." .. _UPVALUE7_.word] = A2_87
  L9_94[blockedkeywordsTable .. "." .. _UPVALUE7_.active] = A1_86
  L9_94[blockedkeywordsTable .. "." .. _UPVALUE7_.lanGroup] = A3_88
  L8_93 = db.update(blockedkeywordsTable, L9_94, A0_85)
  if not L8_93 then
    return _UPVALUE0_.FAILURE, A0_85
  end
  return _UPVALUE0_.SUCCESS, A0_85
end
function blockedKeywordsCreate(A0_95, A1_96)
  local L2_97, L3_98, L4_99, L5_100, L6_101, L7_102, L8_103
  L3_98 = {}
  L4_99, L5_100, L6_101, L7_102, L8_103 = nil, nil, nil, nil, nil
  if db.getRowsWhere(blockedkeywordsTable, " KeywordToBlock != '.'") ~= nil and #db.getRowsWhere(blockedkeywordsTable, " KeywordToBlock != '.'") >= _UPVALUE0_ then
    return _UPVALUE1_.MAXIMUM_BLOCKKEYWORDS_EXCEED
  end
  if A0_95 == _UPVALUE2_.NIL then
    return _UPVALUE1_.BLOCKKEYWORDS_WORD_NIL
  end
  if string.len(A0_95) > _UPVALUE3_ or string.len(A0_95) < _UPVALUE4_ then
    return _UPVALUE1_.INVALID_BLOCKKEYWORDS_WORD
  end
  L2_97 = _UPVALUE5_.urlValidation(A0_95)
  if not L2_97 then
    return _UPVALUE1_.INVALID_BLOCKKEYWORDS_WORD
  end
  L2_97 = _UPVALUE5_.urlProtocolCheck(A0_95)
  if not L2_97 then
    return _UPVALUE1_.URL_PROTOCOL_NOT_ALLOWED
  end
  if db.getAttribute(blockedkeywordsTable, _UPVALUE6_.word, A0_95, _UPVALUE6_.word) ~= nil then
    return _UPVALUE2_.CONFIGURED_ENTRY_EXISTS
  end
  if A1_96 == _UPVALUE2_.NIL then
    return _UPVALUE1_.BLOCKKEYWORDS_LANGROUP_NIL
  end
  L2_97 = _UPVALUE5_.lanGroupValidation(A1_96)
  if not L2_97 then
    return _UPVALUE1_.INVALID_BLOCKKEYWORDS_LANGROUP
  end
  L3_98[blockedkeywordsTable .. "." .. _UPVALUE6_.word] = A0_95
  L3_98[blockedkeywordsTable .. "." .. _UPVALUE6_.active] = _UPVALUE7_
  L3_98[blockedkeywordsTable .. "." .. _UPVALUE6_.lanGroup] = A1_96
  L2_97 = db.insert(blockedkeywordsTable, L3_98)
  if not L2_97 then
    return _UPVALUE2_.FAILURE
  end
  L8_103 = _UPVALUE6_.word .. " = '" .. A0_95 .. "' AND " .. _UPVALUE6_.lanGroup .. " = '" .. A1_96 .. "'"
  L7_102 = db.getAttributeWhere(blockedkeywordsTable, L8_103, _UPVALUE8_)
  if L7_102 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L7_102
end
function blockedKeywordsDelete(A0_104)
  local L1_105, L2_106, L3_107, L4_108, L5_109
  if A0_104 == _UPVALUE0_.NIL then
    return _UPVALUE1_.BLOCKKEYWORDS_COOKIE_NIL
  end
  L1_105 = db.existsRow(blockedkeywordsTable, _UPVALUE2_, A0_104)
  if not L1_105 then
    return _UPVALUE1_.INVALID_BLOCKKEYWORDS_COOKIE
  end
  L5_109 = db.deleteRow(blockedkeywordsTable, _UPVALUE2_, A0_104)
  if not L5_109 then
    return _UPVALUE0_.FAILURE, A0_104
  end
  return _UPVALUE0_.SUCCESS, A0_104
end
function blockedKeywordsGetAll()
  local L0_110, L1_111, L2_112
  L1_111 = {}
  L2_112 = nil
  L1_111 = db.getTable(blockedkeywordsTable, false)
  if L1_111 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_111
end
function blockedKeywordsDeleteAll()
  local L0_113, L1_114, L2_115, L3_116, L4_117, L5_118
  L5_118 = db
  L5_118 = L5_118.getTable
  L5_118 = L5_118(blockedkeywordsTable)
  L5_118 = L5_118 or {}
  for _FORV_9_, _FORV_10_ in pairs(L5_118) do
    if _FORV_10_[blockedkeywordsTable .. "." .. _UPVALUE0_.word] ~= "." then
      L4_117 = _FORV_10_[blockedkeywordsTable .. "." .. _UPVALUE1_]
      L0_113 = db.deleteRow(blockedkeywordsTable, _UPVALUE1_, L4_117)
    end
  end
  if not L0_113 then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS
end
function blockedKeywordsGetCur(A0_119)
  local L1_120, L2_121, L3_122, L4_123, L5_124
  L5_124 = {}
  L5_124 = db.getRow(blockedkeywordsTable, _UPVALUE0_, A0_119)
  if L5_124 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  L3_122 = L5_124[blockedkeywordsTable .. "." .. _UPVALUE2_.active]
  L2_121 = L5_124[blockedkeywordsTable .. "." .. _UPVALUE2_.word]
  L4_123 = L5_124[blockedkeywordsTable .. "." .. _UPVALUE2_.lanGroup]
  return _UPVALUE1_.SUCCESS, L3_122, L2_121, L4_123
end
function blockedKeywordsUpload(A0_125, A1_126)
  local L2_127
  L2_127 = false
  if A0_125 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_126 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A0_125 == "BlockSites" then
    L2_127 = _UPVALUE1_.execute("/pfrm2.0/bin/importBlockedKeyword " .. A1_126 .. " " .. A0_125)
  elseif A0_125 == "TrustedDomains" then
    L2_127 = _UPVALUE1_.execute("/pfrm2.0/bin/importApprovedUrls " .. A1_126 .. " " .. A0_125)
  else
    return _UPVALUE0_.NOT_SUPPORTED
  end
  if L2_127 == 0 then
    return _UPVALUE0_.SUCCESS
  else
    return _UPVALUE0_.CONFIGURED_ENTRY_EXISTS
  end
end
function blockedAllURLConfig(A0_128)
  local L1_129, L2_130, L3_131, L4_132, L5_133, L6_134, L7_135, L8_136, L9_137, L10_138, L11_139
  L4_132 = "0"
  L5_133 = {}
  L6_134, L7_135, L8_136 = nil, nil, nil
  L9_137 = _UPVALUE0_
  L9_137 = L9_137.isfeatureEnabled
  L10_138 = L9_137()
  L8_136 = L11_139
  L7_135 = L10_138
  L6_134 = L9_137
  L9_137 = _UPVALUE1_
  L9_137 = L9_137.SUCCESS
  if L9_137 == L6_134 then
    L9_137 = _UPVALUE2_
  elseif L9_137 ~= L8_136 then
    L9_137 = _UPVALUE3_
    L9_137 = L9_137.WCFSTATUS_DISABLED
    return L9_137
  end
  L9_137 = A0_128["blockAllURLStatus.Status"]
  if L9_137 == "1" then
    L9_137 = {}
    L10_138 = "BlockSites"
    L9_137[L11_139] = "."
    L9_137[L11_139] = "1"
    L9_137[L11_139] = "1"
    L5_133 = L11_139()
    L3_131 = L11_139
    if L5_133 == L11_139 then
      L5_133 = L11_139
    end
    for _FORV_14_, _FORV_15_ in L11_139(L5_133) do
      if L5_133[_FORV_14_].KeywordToBlock == "." then
        L4_132 = "1"
      end
    end
    if L4_132 == "0" then
      L1_129 = L11_139
      if L1_129 then
        return L11_139
      else
        return L11_139
      end
    end
    return L11_139
  else
    L9_137 = "KeywordToBlock = '.' AND Status = '1'"
    L10_138 = {}
    L1_129 = db.deleteRowWhere(L11_139, L9_137)
    if not L1_129 then
      return _UPVALUE1_.FAILURE
    else
      return _UPVALUE1_.SUCCESS
    end
  end
end
;({}).execute = function(A0_140)
  return (os.execute(A0_140))
end
