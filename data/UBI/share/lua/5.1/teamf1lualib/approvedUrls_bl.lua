local L0_0
L0_0 = module
L0_0("com.teamf1.bl.filter.approvedUrls", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/filter_approvedUrls")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/wcf_returnCodes")
L0_0 = require
L0_0("teamf1lualib/filter_validation")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function approvedUrlsSectionGet()
  local L0_1, L1_2, L2_3
  L0_1, L1_2, L2_3 = _UPVALUE0_.approvedUrlGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3
end
function approvedUrlsSectionGetNext(A0_4)
  local L1_5, L2_6, L3_7, L4_8
  L1_5 = A0_4["approvedUrls.cookie"]
  L2_6 = _UPVALUE0_
  L2_6 = L2_6.NIL
  if L1_5 == L2_6 then
    L2_6 = util
    L2_6 = L2_6.appendDebugOut
    L3_7 = "GetNext : Invalid Cookie"
    L2_6(L3_7)
    L2_6 = _UPVALUE0_
    L2_6 = L2_6.BAD_PARAMETER
    return L2_6
  end
  L2_6, L3_7, L4_8 = nil, nil, nil
  L2_6, L3_7, L4_8 = _UPVALUE1_.approvedUrlGetNext(L1_5)
  if L2_6 ~= _UPVALUE0_.SUCCESS then
    return L2_6
  end
  return L2_6, L3_7, L4_8
end
function approvedUrlsSectionSet(A0_9)
  local L1_10, L2_11, L3_12, L4_13
  L1_10 = ACCESS_LEVEL
  if L1_10 ~= 0 then
    L1_10 = util
    L1_10 = L1_10.appendDebugOut
    L2_11 = "Detected Unauthorized access for page approvedUrls"
    L1_10(L2_11)
    L1_10 = _UPVALUE0_
    L1_10 = L1_10.UNAUTHORIZED
    return L1_10
  end
  L1_10 = A0_9["approvedUrls.cookie"]
  L2_11 = A0_9["approvedUrls.url"]
  L3_12 = _UPVALUE0_
  L3_12 = L3_12.NIL
  if L1_10 == L3_12 then
    L3_12 = util
    L3_12 = L3_12.appendDebugOut
    L4_13 = "Set : Invalid Cookie"
    L3_12(L4_13)
    L3_12 = _UPVALUE0_
    L3_12 = L3_12.BAD_PARAMETER
    return L3_12
  end
  L3_12 = _UPVALUE0_
  L3_12 = L3_12.NIL
  if L2_11 == L3_12 then
    L3_12 = util
    L3_12 = L3_12.appendDebugOut
    L4_13 = "GetNext : Invalid Cookie"
    L3_12(L4_13)
    L3_12 = _UPVALUE0_
    L3_12 = L3_12.BAD_PARAMETER
    return L3_12
  end
  L3_12, L4_13 = nil, nil
  _UPVALUE1_.start()
  L3_12, L4_13 = _UPVALUE2_.approvedUrlSet(L1_10, L2_11)
  if L3_12 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page approvedUrls" .. L3_12)
    _UPVALUE1_.abort()
    return L3_12, L1_10
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L4_13
end
function approvedUrlsSectionCreate(A0_14)
  local L1_15, L2_16, L3_17
  L1_15 = ACCESS_LEVEL
  if L1_15 ~= 0 then
    L1_15 = util
    L1_15 = L1_15.appendDebugOut
    L2_16 = "Detected Unauthorized access for page approvedUrls"
    L1_15(L2_16)
    L1_15 = _UPVALUE0_
    L1_15 = L1_15.UNAUTHORIZED
    return L1_15
  end
  L1_15 = A0_14["approvedUrls.url"]
  L2_16 = _UPVALUE0_
  L2_16 = L2_16.NIL
  if L1_15 == L2_16 then
    L2_16 = util
    L2_16 = L2_16.appendDebugOut
    L3_17 = "GetNext : Invalid Cookie"
    L2_16(L3_17)
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.BAD_PARAMETER
    return L2_16
  end
  L2_16, L3_17 = nil, nil
  _UPVALUE1_.start()
  L2_16, L3_17 = _UPVALUE2_.approvedUrlCreate(L1_15)
  if L2_16 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page approvedUrls" .. L2_16)
    _UPVALUE1_.abort()
    return L2_16, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L3_17
end
function approvedUrlsSectionDelete(A0_18)
  local L1_19, L2_20
  L1_19 = ACCESS_LEVEL
  if L1_19 ~= 0 then
    L1_19 = util
    L1_19 = L1_19.appendDebugOut
    L2_20 = "Detected Unauthorized access for page approvedUrls"
    L1_19(L2_20)
    L1_19 = _UPVALUE0_
    L1_19 = L1_19.UNAUTHORIZED
    return L1_19
  end
  L1_19 = A0_18["approvedUrls.cookie"]
  L2_20 = _UPVALUE0_
  L2_20 = L2_20.NIL
  if L1_19 == L2_20 then
    L2_20 = util
    L2_20 = L2_20.appendDebugOut
    L2_20("Set : Invalid Cookie")
    L2_20 = _UPVALUE0_
    L2_20 = L2_20.BAD_PARAMETER
    return L2_20
  end
  L2_20 = nil
  _UPVALUE1_.start()
  L2_20, cookie = _UPVALUE2_.approvedUrlDelete(L1_19)
  if L2_20 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page approvedUrls" .. L2_20)
    _UPVALUE1_.abort()
    return L2_20, L1_19
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function approvedUrlsSectionGetAll()
  local L0_21, L1_22
  L1_22 = {}
  L0_21, L1_22 = _UPVALUE0_.approvedUrlsGetAll()
  if L0_21 ~= _UPVALUE1_.SUCCESS then
    return L0_21
  end
  return L0_21, L1_22
end
function approvedUrlsSectionGetCur(A0_23)
  local L1_24, L2_25
  L1_24, L2_25 = _UPVALUE0_.approvedUrlGetCur(A0_23)
  if L1_24 ~= _UPVALUE1_.SUCCESS then
    return L1_24
  end
  return L1_24, L2_25
end
function approvedUrlsSectionDeleteAll()
  local L0_26
  L0_26 = ACCESS_LEVEL
  if L0_26 ~= 0 then
    L0_26 = util
    L0_26 = L0_26.appendDebugOut
    L0_26("Detected Unauthorized access for page approvedUrls")
    L0_26 = _UPVALUE0_
    L0_26 = L0_26.UNAUTHORIZED
    return L0_26
  end
  L0_26 = nil
  _UPVALUE1_.start()
  L0_26 = _UPVALUE2_.approvedUrlsDeleteAll()
  if L0_26 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page approvedUrls" .. L0_26)
    _UPVALUE1_.abort()
    return L0_26
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function approvedUrlsSectionUpload(A0_27, A1_28)
  local L2_29, L3_30, L4_31, L5_32, L6_33, L7_34, L8_35, L9_36, L10_37, L11_38, L12_39, L13_40, L14_41
  L2_29 = ACCESS_LEVEL
  if L2_29 ~= 0 then
    L2_29 = util
    L2_29 = L2_29.appendDebugOut
    L3_30 = "Detected Unauthorized access for approvedUrls PAGE"
    L2_29(L3_30)
    L2_29 = _UPVALUE0_
    L2_29 = L2_29.UNAUTHORIZED
    return L2_29
  end
  if A1_28 == nil or A0_27 == nil then
    L2_29 = util
    L2_29 = L2_29.appendDebugOut
    L3_30 = "GetNext : Invalid Cookie"
    L2_29(L3_30)
    L2_29 = _UPVALUE0_
    L2_29 = L2_29.BAD_PARAMETER
    return L2_29
  end
  L2_29 = io
  L2_29 = L2_29.open
  L3_30 = A1_28
  L4_31 = "r"
  L2_29 = L2_29(L3_30, L4_31)
  L4_31 = L2_29
  L3_30 = L2_29.seek
  L3_30 = L3_30(L4_31)
  L5_32 = L2_29
  L4_31 = L2_29.seek
  L6_33 = "end"
  L4_31 = L4_31(L5_32, L6_33)
  L6_33 = L2_29
  L5_32 = L2_29.seek
  L7_34 = "set"
  L8_35 = L3_30
  L5_32(L6_33, L7_34, L8_35)
  L6_33 = L2_29
  L5_32 = L2_29.close
  L5_32(L6_33)
  if L4_31 >= 1024 then
    L5_32 = _UPVALUE0_
    L5_32 = L5_32.CSV_MAX_FILE_SIZE
    return L5_32
  end
  L5_32 = io
  L5_32 = L5_32.open
  L6_33 = A1_28
  L7_34 = "r"
  L5_32 = L5_32(L6_33, L7_34)
  L6_33 = nil
  if L5_32 then
    L8_35 = L5_32
    L7_34 = L5_32.read
    L9_36 = "*all"
    L7_34 = L7_34(L8_35, L9_36)
    L6_33 = L7_34 or ""
    L8_35 = L5_32
    L7_34 = L5_32.close
    L7_34(L8_35)
  end
  L7_34 = nil
  L8_35 = 0
  if L6_33 then
    L9_36 = util
    L9_36 = L9_36.split
    L9_36 = L9_36(L10_37, L11_38)
    L7_34 = L9_36
    L8_35 = #L7_34
  end
  if L7_34 then
    L9_36 = false
    for L13_40, L14_41 in L10_37(L11_38) do
      L14_41 = string.gsub(L14_41, "%s+", "")
      L9_36 = _UPVALUE1_.urlValidation(L14_41)
      if not L9_36 then
        return _UPVALUE2_.INVALID_APPROVED_URL
      end
      L9_36 = _UPVALUE1_.urlProtocolCheck(L14_41)
      if not L9_36 then
        return _UPVALUE2_.URL_PROTOCOL_NOT_ALLOWED
      end
    end
  end
  L9_36 = nil
  L13_40 = false
  if L10_37 == L11_38 then
    L9_36 = 0
  else
    L9_36 = #L10_37
  end
  L8_35 = L8_35 + L9_36
  if L12_39 ~= "DSR-1000N" then
  else
    if L12_39 == "DSR-1000" then
  end
  else
    if L12_39 ~= "DSR-500N" then
    else
      if L12_39 == "DSR-500" then
    end
    else
      if L12_39 ~= "DSR-250N" then
      else
        if L12_39 == "DSR-250" then
      end
      elseif L12_39 ~= "DSR-150N" then
      else
      end
    end
  end
  L13_40 = L8_35
  if L11_38 < L12_39 then
    return L12_39
  end
  L13_40 = A0_27
  L14_41 = A1_28
  L13_40 = _UPVALUE0_
  L13_40 = L13_40.SUCCESS
  if L12_39 ~= L13_40 then
    L13_40 = util
    L13_40 = L13_40.appendDebugOut
    L14_41 = "Error in Delete Operaion in page approvedUrls"
    L14_41 = L14_41 .. L12_39
    L13_40(L14_41)
    L13_40 = _UPVALUE4_
    L13_40 = L13_40.abort
    L13_40()
    return L12_39
  end
  L13_40 = _UPVALUE4_
  L13_40 = L13_40.complete
  L13_40()
  L13_40 = _UPVALUE4_
  L13_40 = L13_40.save
  L13_40()
  L13_40 = _UPVALUE0_
  L13_40 = L13_40.SUCCESS
  return L13_40
end
