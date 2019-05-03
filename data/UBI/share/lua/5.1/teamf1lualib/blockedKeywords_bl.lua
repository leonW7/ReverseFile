local L0_0
L0_0 = module
L0_0("com.teamf1.bl.filter.blockedKeywords", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/filter_blockedKeywords")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/fwRules")
L0_0 = require
L0_0("teamf1lualib/wcf_returnCodes")
L0_0 = require
L0_0("teamf1lualib/filter_validation")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function blockedKeywordsSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  L0_1, L1_2, L3_4, L2_3, L4_5 = _UPVALUE0_.blockedKeywordsGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  if L3_4 == "1" then
    L3_4 = "Enabled"
  else
    L3_4 = "Disabled"
  end
  return L0_1, L1_2, L2_3, L3_4
end
function blockedKeywordsSectionGetNext(A0_6)
  local L1_7, L2_8, L3_9, L4_10, L5_11, L6_12
  L1_7 = A0_6["blockedKeywords.cookie"]
  L2_8 = _UPVALUE0_
  L2_8 = L2_8.NIL
  if L1_7 == L2_8 then
    L2_8 = util
    L2_8 = L2_8.appendDebugOut
    L3_9 = "GetNext : Invalid Cookie"
    L2_8(L3_9)
    L2_8 = _UPVALUE0_
    L2_8 = L2_8.BAD_PARAMETER
    return L2_8
  end
  L2_8, L3_9, L4_10, L5_11, L6_12 = nil, nil, nil, nil, nil
  L2_8, L3_9, L4_10, L5_11, L6_12 = _UPVALUE1_.blockedKeywordsGetNext(L1_7)
  if L2_8 ~= _UPVALUE0_.SUCCESS then
    return L2_8
  end
  if L5_11 == "1" then
    L5_11 = "Enabled"
  else
    L5_11 = "Disabled"
  end
  return L2_8, L3_9, L4_10, L5_11, L6_12
end
function wordSectionSet(A0_13)
  local L1_14, L2_15, L3_16, L4_17
  L1_14 = ACCESS_LEVEL
  if L1_14 ~= 0 then
    L1_14 = util
    L1_14 = L1_14.appendDebugOut
    L2_15 = "Detected Unauthorized access for page blockedKeywords"
    L1_14(L2_15)
    L1_14 = _UPVALUE0_
    L1_14 = L1_14.UNAUTHORIZED
    return L1_14
  end
  L1_14 = A0_13["blockedKeywords.cookie"]
  L2_15 = A0_13["blockedKeywords.word"]
  L3_16 = _UPVALUE0_
  L3_16 = L3_16.NIL
  if L1_14 == L3_16 then
    L3_16 = util
    L3_16 = L3_16.appendDebugOut
    L4_17 = "Set : Invalid Cookie"
    L3_16(L4_17)
    L3_16 = _UPVALUE0_
    L3_16 = L3_16.BAD_PARAMETER
    return L3_16
  end
  L3_16 = _UPVALUE0_
  L3_16 = L3_16.NIL
  if L2_15 == L3_16 then
    L3_16 = util
    L3_16 = L3_16.appendDebugOut
    L4_17 = "GetNext : Invalid Cookie"
    L3_16(L4_17)
    L3_16 = _UPVALUE0_
    L3_16 = L3_16.BAD_PARAMETER
    return L3_16
  end
  L3_16, L4_17 = nil, nil
  _UPVALUE1_.start()
  L3_16, L4_17 = _UPVALUE2_.wordSet(L1_14, L2_15)
  if L3_16 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page blockedKeywords" .. L3_16)
    _UPVALUE1_.abort()
    return L3_16, L1_14
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L4_17
end
function activeSectionSet(A0_18)
  local L1_19, L2_20, L3_21, L4_22
  L1_19 = ACCESS_LEVEL
  if L1_19 ~= 0 then
    L1_19 = util
    L1_19 = L1_19.appendDebugOut
    L2_20 = "Detected Unauthorized access for page blockedKeywords"
    L1_19(L2_20)
    L1_19 = _UPVALUE0_
    L1_19 = L1_19.UNAUTHORIZED
    return L1_19
  end
  L1_19 = A0_18["blockedKeywords.cookie"]
  L2_20 = A0_18["blockedKeywords.active"]
  L3_21 = _UPVALUE0_
  L3_21 = L3_21.NIL
  if L1_19 == L3_21 then
    L3_21 = util
    L3_21 = L3_21.appendDebugOut
    L4_22 = "Set : Invalid Cookie"
    L3_21(L4_22)
    L3_21 = _UPVALUE0_
    L3_21 = L3_21.BAD_PARAMETER
    return L3_21
  end
  L3_21 = _UPVALUE0_
  L3_21 = L3_21.NIL
  if L2_20 == L3_21 then
    L3_21 = util
    L3_21 = L3_21.appendDebugOut
    L4_22 = "GetNext : Invalid Cookie"
    L3_21(L4_22)
    L3_21 = _UPVALUE0_
    L3_21 = L3_21.BAD_PARAMETER
    return L3_21
  end
  L3_21, L4_22 = nil, nil
  _UPVALUE1_.start()
  L3_21, L4_22 = _UPVALUE2_.activeSet(L1_19, L2_20)
  if L3_21 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page blockedKeywords" .. L3_21)
    _UPVALUE1_.abort()
    return L3_21, L1_19
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L4_22
end
function activeSectionSetAll(A0_23, A1_24)
  local L2_25, L3_26
  L2_25 = ACCESS_LEVEL
  if L2_25 ~= 0 then
    L2_25 = util
    L2_25 = L2_25.appendDebugOut
    L3_26 = "Detected Unauthorized access for page blockedKeywords"
    L2_25(L3_26)
    L2_25 = _UPVALUE0_
    L2_25 = L2_25.UNAUTHORIZED
    return L2_25
  end
  L2_25 = _UPVALUE0_
  L2_25 = L2_25.NIL
  if A0_23 == L2_25 then
    L2_25 = util
    L2_25 = L2_25.appendDebugOut
    L3_26 = "Set : Invalid Cookie"
    L2_25(L3_26)
    L2_25 = _UPVALUE0_
    L2_25 = L2_25.BAD_PARAMETER
    return L2_25
  end
  L2_25 = _UPVALUE0_
  L2_25 = L2_25.NIL
  if A1_24 == L2_25 then
    L2_25 = util
    L2_25 = L2_25.appendDebugOut
    L3_26 = "GetNext : Invalid Cookie"
    L2_25(L3_26)
    L2_25 = _UPVALUE0_
    L2_25 = L2_25.BAD_PARAMETER
    return L2_25
  end
  L2_25, L3_26 = nil, nil
  _UPVALUE1_.start()
  L2_25, L3_26 = _UPVALUE2_.activeSetAll(A0_23, A1_24)
  if L2_25 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page blockedKeywords" .. L2_25)
    _UPVALUE1_.abort()
    return L2_25, L3_26
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L3_26
end
function blockedKeywordsSectionCreate(A0_27)
  local L1_28, L2_29, L3_30, L4_31
  L1_28 = ACCESS_LEVEL
  if L1_28 ~= 0 then
    L1_28 = util
    L1_28 = L1_28.appendDebugOut
    L2_29 = "Detected Unauthorized access for page blockedKeywords"
    L1_28(L2_29)
    L1_28 = _UPVALUE0_
    L1_28 = L1_28.UNAUTHORIZED
    return L1_28
  end
  L1_28 = A0_27["blockedKeywords.word"]
  L2_29 = _UPVALUE0_
  L2_29 = L2_29.NIL
  if L1_28 == L2_29 then
    L2_29 = util
    L2_29 = L2_29.appendDebugOut
    L3_30 = "GetNext : Invalid Cookie"
    L2_29(L3_30)
    L2_29 = _UPVALUE0_
    L2_29 = L2_29.BAD_PARAMETER
    return L2_29
  end
  L2_29, L3_30, L4_31 = nil, nil, nil
  L4_31 = "1"
  _UPVALUE1_.start()
  L2_29, L3_30 = _UPVALUE2_.blockedKeywordsCreate(L1_28, L4_31)
  if L2_29 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page blockedKeywords" .. L2_29)
    _UPVALUE1_.abort()
    return L2_29, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L3_30
end
function blockedKeywordsSectionDelete(A0_32)
  local L1_33, L2_34
  L1_33 = ACCESS_LEVEL
  if L1_33 ~= 0 then
    L1_33 = util
    L1_33 = L1_33.appendDebugOut
    L2_34 = "Detected Unauthorized access for page blockedKeywords"
    L1_33(L2_34)
    L1_33 = _UPVALUE0_
    L1_33 = L1_33.UNAUTHORIZED
    return L1_33
  end
  L1_33 = A0_32["blockedKeywords.cookie"]
  L2_34 = _UPVALUE0_
  L2_34 = L2_34.NIL
  if L1_33 == L2_34 then
    L2_34 = util
    L2_34 = L2_34.appendDebugOut
    L2_34("Set : Invalid Cookie")
    L2_34 = _UPVALUE0_
    L2_34 = L2_34.BAD_PARAMETER
    return L2_34
  end
  L2_34 = nil
  _UPVALUE1_.start()
  L2_34, cookie = _UPVALUE2_.blockedKeywordsDelete(L1_33)
  if L2_34 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page blockedKeywords" .. L2_34)
    _UPVALUE1_.abort()
    return L2_34, L1_33
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function blockedKeywordsSectionGetAll()
  local L0_35, L1_36, L2_37
  L1_36 = {}
  L2_37 = "0"
  L0_35, L1_36 = _UPVALUE0_.blockedKeywordsGetAll()
  if L1_36 == _UPVALUE1_.NIL then
    L1_36 = {}
  end
  for _FORV_6_, _FORV_7_ in pairs(L1_36) do
    if L1_36[_FORV_6_].Status == "1" then
      L1_36[_FORV_6_].Status = "Enabled"
    elseif L1_36[_FORV_6_].Status == "0" then
      L1_36[_FORV_6_].Status = "Disabled"
    end
    if L1_36[_FORV_6_].KeywordToBlock == "." then
      L2_37 = "1"
    end
  end
  if L0_35 ~= _UPVALUE1_.SUCCESS then
    return L0_35, L1_36
  end
  return L0_35, L1_36, L2_37
end
function blockedKeywordsSectionDeleteAll()
  local L0_38
  L0_38 = ACCESS_LEVEL
  if L0_38 ~= 0 then
    L0_38 = util
    L0_38 = L0_38.appendDebugOut
    L0_38("Detected Unauthorized access for page blockedKeywords")
    L0_38 = _UPVALUE0_
    L0_38 = L0_38.UNAUTHORIZED
    return L0_38
  end
  L0_38 = nil
  _UPVALUE1_.start()
  L0_38 = _UPVALUE2_.blockedKeywordsDeleteAll()
  if L0_38 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page blockedKeywords" .. L0_38)
    _UPVALUE1_.abort()
    return L0_38
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L0_38
end
function blockedKeywordsSectionGetCur(A0_39)
  local L1_40, L2_41, L3_42, L4_43
  L1_40, L3_42, L2_41, L4_43 = _UPVALUE0_.blockedKeywordsGetCur(A0_39)
  if L1_40 ~= _UPVALUE1_.SUCCESS then
    return L1_40
  end
  if L3_42 == "1" then
    L3_42 = "Enabled"
  else
    L3_42 = "Disabled"
  end
  return L1_40, L2_41, L3_42
end
function blockedKeywordsSectionUpload(A0_44, A1_45)
  local L2_46, L3_47, L4_48, L5_49, L6_50, L7_51, L8_52, L9_53, L10_54, L11_55, L12_56, L13_57, L14_58
  L2_46 = ACCESS_LEVEL
  if L2_46 ~= 0 then
    L2_46 = util
    L2_46 = L2_46.appendDebugOut
    L3_47 = "Detected Unauthorized access for page blockedKeywords"
    L2_46(L3_47)
    L2_46 = _UPVALUE0_
    L2_46 = L2_46.UNAUTHORIZED
    return L2_46
  end
  if A1_45 == nil then
    L2_46 = util
    L2_46 = L2_46.appendDebugOut
    L3_47 = "Set : Invalid Cookie"
    L2_46(L3_47)
    L2_46 = _UPVALUE0_
    L2_46 = L2_46.BAD_PARAMETER
    return L2_46
  end
  if A0_44 == nil then
    L2_46 = util
    L2_46 = L2_46.appendDebugOut
    L3_47 = "Set : Invalid Cookie"
    L2_46(L3_47)
    L2_46 = _UPVALUE0_
    L2_46 = L2_46.BAD_PARAMETER
    return L2_46
  end
  L2_46 = io
  L2_46 = L2_46.open
  L3_47 = A1_45
  L4_48 = "r"
  L2_46 = L2_46(L3_47, L4_48)
  L4_48 = L2_46
  L3_47 = L2_46.seek
  L3_47 = L3_47(L4_48)
  L5_49 = L2_46
  L4_48 = L2_46.seek
  L6_50 = "end"
  L4_48 = L4_48(L5_49, L6_50)
  L6_50 = L2_46
  L5_49 = L2_46.seek
  L7_51 = "set"
  L8_52 = L3_47
  L5_49(L6_50, L7_51, L8_52)
  L6_50 = L2_46
  L5_49 = L2_46.close
  L5_49(L6_50)
  if L4_48 >= 1024 then
    L5_49 = _UPVALUE0_
    L5_49 = L5_49.CSV_MAX_FILE_SIZE
    return L5_49
  end
  L5_49 = io
  L5_49 = L5_49.open
  L6_50 = A1_45
  L7_51 = "r"
  L5_49 = L5_49(L6_50, L7_51)
  L6_50 = nil
  if L5_49 then
    L8_52 = L5_49
    L7_51 = L5_49.read
    L9_53 = "*all"
    L7_51 = L7_51(L8_52, L9_53)
    L6_50 = L7_51 or ""
    L8_52 = L5_49
    L7_51 = L5_49.close
    L7_51(L8_52)
  end
  L7_51 = nil
  L8_52 = 0
  if L6_50 then
    L9_53 = util
    L9_53 = L9_53.split
    L9_53 = L9_53(L10_54, L11_55)
    L7_51 = L9_53
    L8_52 = #L7_51
  end
  if L7_51 then
    L9_53 = false
    for L13_57, L14_58 in L10_54(L11_55) do
      L14_58 = string.gsub(L14_58, "%s+", "")
      L9_53 = _UPVALUE1_.urlValidation(L14_58)
      if not L9_53 then
        return _UPVALUE2_.INVALID_BLOCKKEYWORDS_WORD
      end
      L9_53 = _UPVALUE1_.urlProtocolCheck(L14_58)
      if not L9_53 then
        return _UPVALUE2_.URL_PROTOCOL_NOT_ALLOWED
      end
    end
  end
  L9_53 = nil
  L13_57 = false
  if L10_54 == L11_55 then
    L9_53 = 0
  else
    L9_53 = #L10_54
  end
  L8_52 = L8_52 + L9_53
  if L12_56 ~= "DSR-1000N" then
  else
    if L12_56 == "DSR-1000" then
  end
  else
    if L12_56 ~= "DSR-500N" then
    else
      if L12_56 == "DSR-500" then
    end
    else
      if L12_56 ~= "DSR-250N" then
      else
        if L12_56 == "DSR-250" then
      end
      elseif L12_56 ~= "DSR-150N" then
      else
      end
    end
  end
  L13_57 = L8_52
  if L11_55 < L12_56 then
    return L12_56
  end
  L12_56()
  L13_57 = A0_44
  L14_58 = A1_45
  L13_57 = _UPVALUE0_
  L13_57 = L13_57.SUCCESS
  if L12_56 ~= L13_57 then
    L13_57 = util
    L13_57 = L13_57.appendDebugOut
    L14_58 = "Error in Delete Operaion in page blockedKeywords"
    L14_58 = L14_58 .. L12_56
    L13_57(L14_58)
    L13_57 = _UPVALUE3_
    L13_57 = L13_57.abort
    L13_57()
    return L12_56
  end
  L13_57 = _UPVALUE3_
  L13_57 = L13_57.complete
  L13_57()
  L13_57 = _UPVALUE3_
  L13_57 = L13_57.save
  L13_57()
  L13_57 = _UPVALUE0_
  L13_57 = L13_57.SUCCESS
  return L13_57
end
function blockAllURLConfig(A0_59)
  local L1_60, L2_61
  L1_60 = _UPVALUE0_
  L1_60 = L1_60.FAILURE
  L2_61 = _UPVALUE0_
  L2_61 = L2_61.NIL
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L2_61 = A0_59["blockAllURLStatus.Status"]
  if L2_61 == _UPVALUE0_.NIL or L2_61 ~= "0" and L2_61 ~= "1" then
    L1_60 = _UPVALUE0_.BAD_PARAMETER
    return L1_60
  end
  _UPVALUE1_.start()
  L1_60 = _UPVALUE2_.blockedAllURLConfig(A0_59)
  if L1_60 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page Blocked Keywords.")
    _UPVALUE1_.abort()
    return L1_60
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_60
end
