local L0_0
L0_0 = module
L0_0("com.teamf1.bl.subjectList", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/fwSmtpAlg")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function mailFilteringSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  L0_1, L4_5, L1_2, L2_3, L3_4 = fw.core.subjectList.Get()
  if L0_1 ~= _UPVALUE0_.SUCCESS then
    return L0_1
  end
  return L0_1, L4_5, L1_2, L2_3, L3_4
end
function mailFilteringSectionGetNext(A0_6)
  local L1_7, L2_8, L3_9, L4_10, L5_11
  L1_7 = A0_6["mailFiltering.cookie"]
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
  L2_8, L3_9, L4_10, L5_11 = nil, nil, nil, nil
  L2_8, cookie, L3_9, L4_10, L5_11 = fw.core.subjectList.GetNext(L1_7)
  if L2_8 ~= _UPVALUE0_.SUCCESS then
    return L2_8
  end
  return L2_8, cookie, L3_9, L4_10, L5_11
end
function mailFilteringSectionSet(A0_12)
  local L1_13, L2_14, L3_15, L4_16, L5_17, L6_18
  L1_13 = ACCESS_LEVEL
  if L1_13 ~= 0 then
    L1_13 = util
    L1_13 = L1_13.appendDebugOut
    L2_14 = "Detected Unauthorized access for page mailFiltering PAGE"
    L1_13(L2_14)
    L1_13 = _UPVALUE0_
    L1_13 = L1_13.UNAUTHORIZED
    return L1_13
  end
  L1_13 = A0_12["mailFiltering.cookie"]
  L2_14 = A0_12["mailFiltering.subject"]
  L3_15 = A0_12["mailFiltering.mailId"]
  L4_16 = A0_12["mailFiltering.action"]
  L5_17 = _UPVALUE0_
  L5_17 = L5_17.NIL
  if L1_13 == L5_17 then
    L5_17 = util
    L5_17 = L5_17.appendDebugOut
    L6_18 = "Set : Invalid Cookie"
    L5_17(L6_18)
    L5_17 = _UPVALUE0_
    L5_17 = L5_17.BAD_PARAMETER
    return L5_17
  end
  L5_17 = _UPVALUE0_
  L5_17 = L5_17.NIL
  if L2_14 ~= L5_17 then
    L5_17 = _UPVALUE0_
    L5_17 = L5_17.NIL
    if L3_15 ~= L5_17 then
      L5_17 = _UPVALUE0_
      L5_17 = L5_17.NIL
    end
  elseif L4_16 == L5_17 then
    L5_17 = util
    L5_17 = L5_17.appendDebugOut
    L6_18 = "GetNext : Invalid Cookie"
    L5_17(L6_18)
    L5_17 = _UPVALUE0_
    L5_17 = L5_17.BAD_PARAMETER
    return L5_17
  end
  L5_17, L6_18 = nil, nil
  _UPVALUE1_.start()
  L5_17, L6_18 = fw.core.subjectList.edit(L2_14, L3_15, L4_16, L1_13)
  if L5_17 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in mailFiltering PAGE" .. L5_17)
    _UPVALUE1_.abort()
    return L5_17, L1_13
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L6_18
end
function mailFilteringSectionDelete(A0_19)
  local L1_20, L2_21
  L1_20 = ACCESS_LEVEL
  if L1_20 ~= 0 then
    L1_20 = util
    L1_20 = L1_20.appendDebugOut
    L2_21 = "Detected Unauthorized access for mailFiltering PAGE"
    L1_20(L2_21)
    L1_20 = _UPVALUE0_
    L1_20 = L1_20.UNAUTHORIZED
    return L1_20
  end
  L1_20 = A0_19["mailFiltering.cookie"]
  L2_21 = _UPVALUE0_
  L2_21 = L2_21.NIL
  if L1_20 == L2_21 then
    L2_21 = util
    L2_21 = L2_21.appendDebugOut
    L2_21("Delete : Invalid Cookie")
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.BAD_PARAMETER
    return L2_21
  end
  L2_21 = nil
  _UPVALUE1_.start()
  L2_21, cookie = fw.core.subjectList.delete(L1_20)
  if L2_21 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in mailFiltering PAGE" .. L2_21)
    _UPVALUE1_.abort()
    return L2_21, L1_20
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function mailFilteringSectionCreate(A0_22)
  local L1_23, L2_24, L3_25, L4_26, L5_27
  L1_23 = ACCESS_LEVEL
  if L1_23 ~= 0 then
    L1_23 = util
    L1_23 = L1_23.appendDebugOut
    L2_24 = "Detected Unauthorized access for mailFiltering PAGE"
    L1_23(L2_24)
    L1_23 = _UPVALUE0_
    L1_23 = L1_23.UNAUTHORIZED
    return L1_23
  end
  L1_23 = A0_22["mailFiltering.subject"]
  L2_24 = A0_22["mailFiltering.mailId"]
  L3_25 = A0_22["mailFiltering.action"]
  L4_26 = _UPVALUE0_
  L4_26 = L4_26.NIL
  if L1_23 ~= L4_26 then
    L4_26 = _UPVALUE0_
    L4_26 = L4_26.NIL
    if L2_24 ~= L4_26 then
      L4_26 = _UPVALUE0_
      L4_26 = L4_26.NIL
    end
  elseif L3_25 == L4_26 then
    L4_26 = util
    L4_26 = L4_26.appendDebugOut
    L5_27 = "GetNext : Invalid Cookie"
    L4_26(L5_27)
    L4_26 = _UPVALUE0_
    L4_26 = L4_26.BAD_PARAMETER
    return L4_26
  end
  L4_26, L5_27 = nil, nil
  _UPVALUE1_.start()
  L4_26, L5_27 = fw.core.subjectList.add(L1_23, L2_24, L3_25)
  if L4_26 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in mailFiltering PAGE" .. L4_26)
    _UPVALUE1_.abort()
    return L4_26, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L5_27
end
function mailFilteringSectionGetAll()
  local L0_28, L1_29
  L1_29 = {}
  L0_28, L1_29 = fw.core.subjectList.GetAll()
  if L0_28 ~= _UPVALUE0_.SUCCESS then
    L1_29 = {}
    return L0_28, L1_29
  end
  return L0_28, L1_29
end
function mailFilteringSectionDeleteAll()
  local L0_30
  L0_30 = ACCESS_LEVEL
  if L0_30 ~= 0 then
    L0_30 = util
    L0_30 = L0_30.appendDebugOut
    L0_30("Detected Unauthorized access for mailFiltering PAGE")
    L0_30 = _UPVALUE0_
    L0_30 = L0_30.UNAUTHORIZED
    return L0_30
  end
  L0_30 = nil
  L0_30 = fw.core.subjectList.deleteAll()
  if L0_30 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in mailFiltering PAGE" .. L0_30)
    _UPVALUE1_.abort()
    return L0_30
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function mailFilteringSectionGetCur(A0_31)
  local L1_32, L2_33, L3_34, L4_35
  L1_32, cookie, L2_33, L3_34, L4_35 = fw.core.subjectList.rowGet(A0_31)
  if L1_32 ~= _UPVALUE0_.SUCCESS then
    return L1_32
  end
  return L1_32, L2_33, L3_34, L4_35
end
