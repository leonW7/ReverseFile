local L0_0
L0_0 = module
L0_0("com.teamf1.core.threeg.threeg_inbox", package.seeall)
L0_0 = require
L0_0("smsLib")
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/threeg_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).serno = "Sno"
;({}).text = "Text"
;({}).sender = "Sender"
;({}).timestamp = "Time"
;({}).mode = "mode"
function inboxGetIdTbl(A0_1)
  local L1_2, L2_3, L3_4
  L2_3, L3_4 = inboxGetAll()
  if L2_3 == _UPVALUE0_.SUCCESS then
    for _FORV_7_, _FORV_8_ in pairs(L3_4) do
      if tonumber(_FORV_8_.Sno) == tonumber(A0_1) then
        L1_2 = _FORV_8_
      end
    end
  else
    return _UPVALUE0_.FAILURE, _UPVALUE0_.NIL
  end
  return L2_3, L1_2
end
function inboxGetAll()
  local L0_5, L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14
  L0_5 = _UPVALUE0_
  L1_6 = 0
  L2_7 = nil
  L3_8 = _UPVALUE1_
  L4_9 = nil
  L5_10 = smsLib
  L5_10 = L5_10.smsInboxGet
  L6_11 = L0_5
  L5_10 = L5_10(L6_11)
  L6_11 = string
  L6_11 = L6_11.len
  L7_12 = L5_10
  L6_11 = L6_11(L7_12)
  L4_9 = L6_11
  if L5_10 == "0" then
    L6_11 = _UPVALUE2_
    L6_11 = L6_11.NO_MSG_FOUND
    L7_12 = _UPVALUE3_
    L7_12 = L7_12.NIL
    return L6_11, L7_12
  elseif L5_10 == "2620" then
    L6_11 = _UPVALUE2_
    L6_11 = L6_11.NETWORK_ERROR
    L7_12 = _UPVALUE3_
    L7_12 = L7_12.NIL
    return L6_11, L7_12
  elseif L5_10 == "2029" then
    L6_11 = _UPVALUE2_
    L6_11 = L6_11.SIM_BUSY
    L7_12 = _UPVALUE3_
    L7_12 = L7_12.NIL
    return L6_11, L7_12
  end
  L6_11 = string
  L6_11 = L6_11.len
  L7_12 = L3_8
  L6_11 = L6_11(L7_12)
  L6_11 = L6_11 + 1
  if L4_9 < L6_11 then
    L6_11 = _UPVALUE3_
    L6_11 = L6_11.FAILURE
    L7_12 = _UPVALUE3_
    L7_12 = L7_12.NIL
    return L6_11, L7_12
  end
  L6_11 = {}
  L7_12 = string
  L7_12 = L7_12.find
  L8_13 = L5_10
  L9_14 = L3_8
  L8_13 = L7_12(L8_13, L9_14)
  L2_7 = L8_13
  L4_9 = L7_12
  while L2_7 do
    L7_12 = string
    L7_12 = L7_12.sub
    L8_13 = L5_10
    L9_14 = 1
    L7_12 = L7_12(L8_13, L9_14, L2_7)
    L1_6 = L1_6 + 1
    L8_13 = {}
    L6_11[L1_6] = L8_13
    L8_13 = 0
    while L8_13 < 5 do
      L9_14 = string
      L9_14 = L9_14.find
      L9_14 = L9_14(L7_12, "*")
      L8_13 = L8_13 + 1
      if L8_13 == 1 then
        L6_11[L1_6][_UPVALUE4_.serno] = string.sub(L7_12, 1, L9_14 - 1)
      elseif L8_13 == 2 then
        L6_11[L1_6][_UPVALUE4_.mode] = string.sub(L7_12, 1, L9_14 - 1)
      elseif L8_13 == 3 then
        L6_11[L1_6][_UPVALUE4_.sender] = string.sub(L7_12, 1, L9_14 - 1)
      elseif L8_13 == 4 then
        L6_11[L1_6][_UPVALUE4_.timestamp] = string.sub(L7_12, 1, L9_14 - 1)
      else
        L9_14 = string.find(L7_12, L3_8)
        L6_11[L1_6][_UPVALUE4_.text] = string.sub(L7_12, 1, L9_14 - 1)
      end
      L7_12 = string.sub(L7_12, L9_14 + 1)
    end
    L9_14 = string
    L9_14 = L9_14.sub
    L9_14 = L9_14(L5_10, L2_7 + 1)
    L5_10 = L9_14
    L9_14 = string
    L9_14 = L9_14.len
    L9_14 = L9_14(L5_10)
    if L9_14 == 0 then
      L9_14 = string
      L9_14 = L9_14.len
      L9_14 = L9_14(L6_11[L1_6][_UPVALUE4_.text])
      L9_14 = L9_14 - 4
      if L9_14 < 0 then
        L6_11[L1_6][_UPVALUE4_.text] = ""
        break
      else
        L6_11[L1_6][_UPVALUE4_.text] = string.sub(L6_11[L1_6][_UPVALUE4_.text], 1, L9_14)
        break
      end
    end
    L9_14 = string
    L9_14 = L9_14.find
    L2_7, L9_14 = L5_10, L9_14(L5_10, L3_8)
    L4_9 = L9_14
  end
  L7_12 = _UPVALUE3_
  L7_12 = L7_12.SUCCESS
  L8_13 = L6_11
  return L7_12, L8_13
end
function inboxDelete(A0_15)
  local L1_16
  L1_16 = _UPVALUE0_
  if A0_15 == _UPVALUE1_.NIL or tonumber(A0_15) == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if smsLib.smsDelete(L1_16, A0_15) ~= _UPVALUE2_ then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS
end
function inboxDeleteAll(A0_17)
  local L1_18, L2_19, L3_20
  L1_18 = _UPVALUE0_
  L2_19 = inboxGetAll
  L3_20 = L2_19()
  if L2_19 == _UPVALUE1_.SUCCESS then
    for _FORV_7_, _FORV_8_ in pairs(L3_20) do
      if smsLib.smsDelete(L1_18, _FORV_8_[_UPVALUE2_.serno]) ~= _UPVALUE3_ then
        return _UPVALUE1_.FAILURE
      end
    end
  else
    return _UPVALUE1_.FAILURE
  end
  return L2_19
end
