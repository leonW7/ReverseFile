local L0_0
L0_0 = module
L0_0("com.teamf1.bl.blockedMailIdList", package.seeall)
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
;({}).mailId = "blockedMailId"
function blockedMailIdsSectionGet()
  local L0_1, L1_2, L2_3
  L0_1, L1_2, L2_3 = fw.core.blockedMailIdList.blockedMailIdGet()
  if L0_1 ~= _UPVALUE0_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3
end
function blockedMailIdsSectionGetNext(A0_4)
  local L1_5, L2_6, L3_7, L4_8
  L1_5 = A0_4["blockedMailIds.cookie"]
  if L1_5 == nil then
    L2_6 = util
    L2_6 = L2_6.appendDebugOut
    L3_7 = "GetNext : Invalid Cookie"
    L2_6(L3_7)
    L2_6 = _UPVALUE0_
    L2_6 = L2_6.BAD_PARAMETER
    return L2_6
  end
  L2_6, L3_7, L4_8 = nil, nil, nil
  L2_6, L4_8, L3_7 = fw.core.blockedMailIdList.blockedMailIdGetNext(L1_5)
  if L2_6 ~= _UPVALUE0_.SUCCESS then
    return L2_6
  end
  return L2_6, L4_8, L3_7
end
function blockedMailIdsSectionSet(A0_9)
  local L1_10, L2_11, L3_12, L4_13
  L1_10 = ACCESS_LEVEL
  if L1_10 ~= 0 then
    L1_10 = util
    L1_10 = L1_10.appendDebugOut
    L2_11 = "Detected Unauthorized access for page blockedMailIds PAGE"
    L1_10(L2_11)
    L1_10 = _UPVALUE0_
    L1_10 = L1_10.UNAUTHORIZED
    return L1_10
  end
  L1_10 = A0_9["blockedMailIds.cookie"]
  L2_11 = A0_9["blockedMailIds.blockedMailId"]
  if L1_10 == nil then
    L3_12 = util
    L3_12 = L3_12.appendDebugOut
    L4_13 = "Set : Invalid Cookie"
    L3_12(L4_13)
    L3_12 = _UPVALUE0_
    L3_12 = L3_12.BAD_PARAMETER
    return L3_12
  end
  L3_12 = nil
  L4_13 = mailIdGet
  L1_10, L4_13 = L1_10, L4_13(L1_10)
  L3_12 = L4_13
  L4_13 = _UPVALUE0_
  L4_13 = L4_13.SUCCESS
  if L3_12 ~= L4_13 then
    return L3_12
  end
  if L2_11 == nil then
    L4_13 = util
    L4_13 = L4_13.appendDebugOut
    L4_13("GetNext : Invalid Cookie")
    L4_13 = _UPVALUE0_
    L4_13 = L4_13.BAD_PARAMETER
    return L4_13
  end
  L4_13 = nil
  _UPVALUE1_.start()
  L3_12, L4_13 = fw.core.blockedMailIdList.blockedMailIdSet(L1_10, L2_11)
  if L3_12 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page blockedMailIds PAGE" .. L3_12)
    _UPVALUE1_.abort()
    return L3_12, L1_10
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L4_13
end
function blockedMailIdsSectionDelete(A0_14)
  local L1_15, L2_16
  L1_15 = ACCESS_LEVEL
  if L1_15 ~= 0 then
    L1_15 = util
    L1_15 = L1_15.appendDebugOut
    L2_16 = "Detected Unauthorized access for page blockedMailIds PAGE"
    L1_15(L2_16)
    L1_15 = _UPVALUE0_
    L1_15 = L1_15.UNAUTHORIZED
    return L1_15
  end
  L1_15 = A0_14["blockedMailIds.cookie"]
  if L1_15 == nil then
    L2_16 = util
    L2_16 = L2_16.appendDebugOut
    L2_16("Delete : Invalid Cookie")
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.BAD_PARAMETER
    return L2_16
  end
  L2_16 = nil
  L2_16, L1_15 = mailIdGet(L1_15)
  if L2_16 ~= _UPVALUE0_.SUCCESS then
    return L2_16
  end
  _UPVALUE1_.start()
  L2_16, cookie = fw.core.blockedMailIdList.delete(L1_15)
  if L2_16 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in blockedMailIds PAGE" .. L2_16)
    _UPVALUE1_.abort()
    return L2_16, L1_15
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function blockedMailIdsSectionCreate(A0_17)
  local L1_18, L2_19, L3_20
  L1_18 = ACCESS_LEVEL
  if L1_18 ~= 0 then
    L1_18 = util
    L1_18 = L1_18.appendDebugOut
    L2_19 = "Detected Unauthorized access for blockedMailIds PAGE"
    L1_18(L2_19)
    L1_18 = _UPVALUE0_
    L1_18 = L1_18.UNAUTHORIZED
    return L1_18
  end
  L1_18 = A0_17["blockedMailIds.blockedMailId"]
  if L1_18 == nil then
    L2_19 = util
    L2_19 = L2_19.appendDebugOut
    L3_20 = "GetNext : Invalid Cookie"
    L2_19(L3_20)
    L2_19 = _UPVALUE0_
    L2_19 = L2_19.BAD_PARAMETER
    return L2_19
  end
  L2_19, L3_20 = nil, nil
  _UPVALUE1_.start()
  L2_19, L3_20 = fw.core.blockedMailIdList.add(L1_18)
  if L2_19 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in blockedMailIds PAGE" .. L2_19)
    _UPVALUE1_.abort()
    return L2_19, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L3_20
end
function blockedMailIdsSectionGetAll()
  local L0_21, L1_22
  L1_22 = {}
  L0_21, L1_22 = fw.core.blockedMailIdList.GetAll()
  if L0_21 ~= _UPVALUE0_.SUCCESS then
    L1_22 = {}
    return L0_21, L1_22
  end
  return _UPVALUE0_.SUCCESS, L1_22
end
function blockedMailIdsSectionDeleteAll()
  local L0_23
  L0_23 = ACCESS_LEVEL
  if L0_23 ~= 0 then
    L0_23 = util
    L0_23 = L0_23.appendDebugOut
    L0_23("Detected Unauthorized access for page blockedMailIds PAGE")
    L0_23 = _UPVALUE0_
    L0_23 = L0_23.UNAUTHORIZED
    return L0_23
  end
  L0_23 = nil
  _UPVALUE1_.start()
  L0_23 = fw.core.blockedMailIdList.deleteAll()
  if L0_23 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in blockedMailIds PAGE" .. L0_23)
    _UPVALUE1_.abort()
    return L0_23
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function blockedMailIdsSectionGetCur(A0_24)
  local L1_25, L2_26, L3_27
  L3_27, A0_24 = mailIdGet(A0_24)
  if L3_27 ~= _UPVALUE0_.SUCCESS then
    return L3_27
  end
  L3_27, cookie, L2_26 = fw.core.blockedMailIdList.rowGet(A0_24)
  if L3_27 ~= _UPVALUE0_.SUCCESS then
    return L3_27
  end
  return L3_27, L2_26
end
function mailIdGet(A0_28)
  local L1_29
  L1_29 = db
  L1_29 = L1_29.getAttribute
  L1_29 = L1_29(_UPVALUE0_, _UPVALUE1_, A0_28, _UPVALUE2_.mailId)
  if L1_29 == _UPVALUE3_.NIL then
    return _UPVALUE3_.ERROR
  end
  return _UPVALUE3_.SUCCESS, L1_29
end
