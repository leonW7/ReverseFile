local L0_0
L0_0 = module
L0_0("com.teamf1.core.filter.approvedUrls", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/filter_content")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/filter_validation")
L0_0 = require
L0_0("teamf1lualib/wcf_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.filter.content")
approvedurlsTable = "TrustedDomains"
;({}).url = "KeywordToAllow"
;({}).rowId = "_ROWID_"
if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-1000" or UNIT_NAME == "DSR-1000N" then
elseif UNIT_NAME == "DSR-500AC" or UNIT_NAME == "DSR-500" or UNIT_NAME == "DSR-500N" then
elseif UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-250N" then
else
end
function isfeatureEnabled()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  L4_5 = DUMMY_COOKIE
  L0_1, L1_2, L2_3 = _UPVALUE0_.isfeatureEnabled()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  L3_4 = L2_3
  return _UPVALUE1_.SUCCESS, L4_5, L3_4
end
function isfeatureEnabledNext(A0_6)
  local L2_7
  L2_7 = _UPVALUE0_
  L2_7 = L2_7.NOT_SUPPORTED
  return L2_7, A0_6
end
function featureEnable(A0_8)
  local L2_9
  L2_9 = _UPVALUE0_
  L2_9 = L2_9.NOT_SUPPORTED
  return L2_9, A0_8
end
function featureDisable(A0_10)
  local L2_11
  L2_11 = _UPVALUE0_
  L2_11 = L2_11.NOT_SUPPORTED
  return L2_11, A0_10
end
function approvedUrlGet()
  local L0_12, L1_13, L2_14
  L0_12 = db.getNextRowId(_UPVALUE0_, approvedurlsTable)
  if _UPVALUE1_.NIL == L0_12 then
    return _UPVALUE2_.APPROVED_URL_NIL_TABLE
  end
  L2_14 = db.getAttribute(approvedurlsTable, _UPVALUE3_, L0_12, _UPVALUE4_.url)
  if L2_14 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_12, L2_14
end
function approvedUrlGetNext(A0_15)
  local L1_16, L2_17, L3_18
  if A0_15 == _UPVALUE0_.NIL then
    return _UPVALUE1_.APPROVED_URL_COOKIE_NIL
  end
  valid = db.existsRow(approvedurlsTable, _UPVALUE2_, A0_15)
  if not valid then
    return _UPVALUE1_.INVALID_APPROVED_URL_COOKIE
  end
  L3_18 = db.getNextRowId(A0_15, approvedurlsTable)
  if _UPVALUE0_.NIL == L3_18 then
    return _UPVALUE1_.APPROVED_URL_COMPLETE_TABLE
  end
  L2_17 = db.getAttribute(approvedurlsTable, _UPVALUE2_, L3_18, _UPVALUE3_.url)
  if L2_17 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L3_18
  end
  return _UPVALUE0_.SUCCESS, L3_18, L2_17
end
function approvedUrlSet(A0_19, A1_20)
  local L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27
  L7_26 = _UPVALUE0_
  L7_26 = L7_26.NIL
  if A1_20 == L7_26 then
    L7_26 = _UPVALUE1_
    L7_26 = L7_26.APPROVED_URL_NIL
    return L7_26
  end
  L7_26 = _UPVALUE2_
  L7_26 = L7_26.urlValidation
  L8_27 = A1_20
  L7_26 = L7_26(L8_27)
  L2_21 = L7_26
  if not L2_21 then
    L7_26 = _UPVALUE1_
    L7_26 = L7_26.INVALID_APPROVED_URL
    return L7_26
  end
  L7_26 = _UPVALUE2_
  L7_26 = L7_26.urlProtocolCheck
  L8_27 = A1_20
  L7_26 = L7_26(L8_27)
  L2_21 = L7_26
  if not L2_21 then
    L7_26 = _UPVALUE1_
    L7_26 = L7_26.URL_PROTOCOL_NOT_ALLOWED
    return L7_26
  end
  L7_26 = _UPVALUE0_
  L7_26 = L7_26.NIL
  if A0_19 == L7_26 then
    L7_26 = _UPVALUE1_
    L7_26 = L7_26.APPROVED_URL_COOKIE_NIL
    return L7_26
  end
  L7_26 = db
  L7_26 = L7_26.existsRow
  L8_27 = approvedurlsTable
  L7_26 = L7_26(L8_27, _UPVALUE3_, A0_19)
  L2_21 = L7_26
  if not L2_21 then
    L7_26 = _UPVALUE1_
    L7_26 = L7_26.INVALID_APPROVED_URL_COOKIE
    return L7_26
  end
  L7_26 = db
  L7_26 = L7_26.getAttribute
  L8_27 = approvedurlsTable
  L7_26 = L7_26(L8_27, _UPVALUE4_.url, A1_20, _UPVALUE4_.url)
  L8_27 = db
  L8_27 = L8_27.getAttribute
  L8_27 = L8_27(approvedurlsTable, _UPVALUE4_.url, A1_20, _UPVALUE4_.rowId)
  if L7_26 ~= nil and tonumber(A0_19) ~= tonumber(L8_27) then
    return _UPVALUE0_.CONFIGURED_ENTRY_EXISTS
  end
  L3_22, L4_23, L5_24 = _UPVALUE5_.isfeatureEnabled()
  if _UPVALUE0_.SUCCESS ~= L3_22 or _UPVALUE6_ ~= L5_24 then
    return _UPVALUE1_.WCFSTATUS_DISABLED
  end
  L6_25 = db.setAttribute(approvedurlsTable, _UPVALUE3_, A0_19, _UPVALUE4_.url, A1_20)
  if not L6_25 then
    return _UPVALUE0_.FAILURE, A0_19
  end
  return _UPVALUE0_.SUCCESS, A0_19
end
function approvedUrlCreate(A0_28)
  local L1_29, L2_30, L3_31, L4_32, L5_33, L6_34, L7_35
  L6_34 = DUMMY_COOKIE
  L7_35 = {}
  if db.getRowsWhere(approvedurlsTable, " KeywordToAllow is NOT NULL") ~= nil and #db.getRowsWhere(approvedurlsTable, " KeywordToAllow is NOT NULL") >= _UPVALUE0_ then
    return _UPVALUE1_.MAXIMUM_APPROVEURL_EXCEED
  end
  if A0_28 == _UPVALUE2_.NIL then
    return _UPVALUE1_.APPROVED_URL_NIL
  end
  L1_29 = _UPVALUE3_.urlValidation(A0_28)
  if not L1_29 then
    return _UPVALUE1_.INVALID_APPROVED_URL
  end
  L1_29 = _UPVALUE3_.urlProtocolCheck(A0_28)
  if not L1_29 then
    return _UPVALUE1_.URL_PROTOCOL_NOT_ALLOWED
  end
  if db.getAttribute(approvedurlsTable, _UPVALUE4_.url, A0_28, _UPVALUE4_.url) ~= nil then
    return _UPVALUE2_.CONFIGURED_ENTRY_EXISTS
  end
  L2_30, L3_31, L4_32 = _UPVALUE5_.isfeatureEnabled()
  if _UPVALUE2_.SUCCESS ~= L2_30 or _UPVALUE6_ ~= L4_32 then
    return _UPVALUE1_.WCFSTATUS_DISABLED
  end
  L7_35[approvedurlsTable .. "." .. _UPVALUE4_.url] = A0_28
  L1_29 = db.insert(approvedurlsTable, L7_35)
  if not L1_29 then
    return _UPVALUE2_.FAILURE
  end
  L6_34 = db.getAttribute(approvedurlsTable, _UPVALUE4_.url, A0_28, _UPVALUE7_)
  if L6_34 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L6_34
end
function approvedUrlDelete(A0_36)
  local L1_37, L2_38, L3_39, L4_40, L5_41
  if A0_36 == _UPVALUE0_.NIL then
    return _UPVALUE1_.APPROVED_URL_COOKIE_NIL
  end
  L1_37 = db.existsRow(approvedurlsTable, _UPVALUE2_, A0_36)
  if not L1_37 then
    return _UPVALUE1_.INVALID_APPROVED_URL_COOKIE
  end
  L2_38, L3_39, L4_40 = _UPVALUE3_.isfeatureEnabled()
  if _UPVALUE0_.SUCCESS ~= L2_38 or _UPVALUE4_ ~= L4_40 then
    return _UPVALUE1_.WCFSTATUS_DISABLED
  end
  L5_41 = db.deleteRow(approvedurlsTable, _UPVALUE2_, A0_36)
  if not L5_41 then
    return _UPVALUE0_.FAILURE, A0_36
  end
  return _UPVALUE0_.SUCCESS, A0_36
end
function approvedUrlsGetAll()
  local L0_42
  L0_42 = {}
  L0_42 = db.getTable(approvedurlsTable, false)
  if L0_42 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_42
end
function approvedUrlGetCur(A0_43)
  local L1_44, L2_45
  L2_45 = db.getAttribute(approvedurlsTable, _UPVALUE0_, A0_43, _UPVALUE1_.url)
  if L2_45 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L2_45
end
function approvedUrlsDeleteAll()
  local L0_46, L1_47, L2_48, L3_49
  L0_46 = {}
  L1_47, L2_48, L3_49 = nil, nil, nil
  L1_47, L2_48, L3_49 = _UPVALUE0_.isfeatureEnabled()
  if _UPVALUE1_.SUCCESS ~= L1_47 or _UPVALUE2_ ~= L3_49 then
    return _UPVALUE3_.WCFSTATUS_DISABLED
  end
  L0_46 = db.deleteAllRows(approvedurlsTable)
  if not L0_46 then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS
end
function importCSV(A0_50, A1_51)
  local L2_52, L3_53
  L2_52 = io
  L2_52 = L2_52.open
  L3_53 = "/tmp/urls.txt"
  L2_52 = L2_52(L3_53, "w")
  L3_53 = L2_52.write
  L3_53(L2_52, A1_51)
  L3_53 = L2_52.write
  L3_53(L2_52, A0_50)
  L3_53 = false
  if A0_50 == "BlockSites" then
    L3_53 = os.execute("/pfrm2.0/bin/importBlockedKeyword " .. A1_51 .. " " .. A0_50)
  elseif A0_50 == "TrustedDomains" then
    L2_52:write("hello")
    L3_53 = os.execute("/pfrm2.0/bin/importApprovedUrls " .. A1_51 .. " " .. A0_50)
  else
    return _UPVALUE0_.NOT_SUPPORTED
  end
  L2_52:write(L3_53)
  if L3_53 == 0 then
    return _UPVALUE0_.SUCCESS
  else
    return _UPVALUE0_.CONFIGURED_ENTRY_EXISTS
  end
end
