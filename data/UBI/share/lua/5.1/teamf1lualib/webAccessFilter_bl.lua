local L0_0
L0_0 = module
L0_0("com.teamf1.bl.system.webAccessFilter", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/fwWebAccess")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function webAccessFilterStatusGet()
  local L0_1, L1_2
  L0_1 = _UPVALUE0_
  L0_1 = L0_1.FAILURE
  L1_2 = nil
  L0_1, L1_2 = fw.core.webAccess.statusGet()
  if L1_2 == "0" then
    L0_1 = "Please Enable Web GUI Management"
    return L0_1, L1_2
  end
  if L0_1 ~= _UPVALUE0_.SUCCESS then
    return L0_1, L1_2
  end
  return L0_1, L1_2
end
function webAccessFilterGet(A0_3)
  local L1_4, L2_5, L3_6
  L1_4 = {}
  L2_5 = {}
  L3_6 = _UPVALUE0_
  L3_6 = L3_6.FAILURE
  if A0_3 == _UPVALUE0_.NIL then
    L3_6 = _UPVALUE0_.BAD_PARAMETER
    return L3_6, L1_4, L2_5
  end
  L3_6, L1_4 = fw.core.webAccess.rowGet(A0_3)
  if L3_6 ~= _UPVALUE0_.SUCCESS then
    return L3_6, L1_4, L2_5
  end
  L3_6, L2_5 = fw.core.webAccess.vlanInfoGet()
  if L3_6 ~= _UPVALUE0_.SUCCESS then
    return L3_6, L1_4, L2_5
  end
  return L3_6, L1_4, L2_5
end
function webAccessFilterStatusEdit(A0_7)
  local L1_8, L2_9
  L1_8 = _UPVALUE0_
  L1_8 = L1_8.FAILURE
  L2_9 = _UPVALUE0_
  L2_9 = L2_9.NIL
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L2_9 = A0_7["webAccessStatus.accessStatus"]
  if L2_9 == _UPVALUE0_.NIL or L2_9 ~= "0" and L2_9 ~= "1" then
    L1_8 = _UPVALUE0_.BAD_PARAMETER
    return L1_8
  end
  _UPVALUE1_.start()
  if L2_9 == "0" then
    L1_8 = fw.core.webAccess.statusDisable()
  else
    L1_8 = fw.core.webAccess.statusEnable()
  end
  if L1_8 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page Web Access Filter.")
    _UPVALUE1_.abort()
    L1_8 = _UPVALUE0_.DB_OP_FAILED
    return L1_8
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_8
end
function webAccessFilterDelete(A0_10)
  local L1_11
  L1_11 = _UPVALUE0_
  L1_11 = L1_11.FAILURE
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_10 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L1_11 = fw.core.webAccess.delete(A0_10)
  if L1_11 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in deleting the Rows.")
    _UPVALUE1_.abort()
    return L1_11
  end
  L1_11 = _UPVALUE0_.SUCCESS
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_11
end
function webAccessFilterCreate(A0_12)
  local L1_13, L2_14, L3_15, L4_16, L5_17, L6_18, L7_19
  L1_13 = _UPVALUE0_
  L1_13 = L1_13.FAILURE
  L2_14 = A0_12["webAccessInfo.name"]
  L3_15 = A0_12["webAccessInfo.accessType"]
  L4_16 = A0_12["webAccessInfo.IpAddr"]
  L5_17 = A0_12["webAccessInfo.vlanName"]
  L6_18 = ACCESS_LEVEL
  if L6_18 ~= 0 then
    L6_18 = util
    L6_18 = L6_18.appendDebugOut
    L7_19 = "Detected Unauthorized access for page."
    L6_18(L7_19)
    L6_18 = _UPVALUE0_
    L6_18 = L6_18.UNAUTHORIZED
    return L6_18
  end
  L6_18 = A0_12["webAccessInfo.name"]
  L7_19 = _UPVALUE0_
  L7_19 = L7_19.NIL
  if L6_18 == L7_19 then
    L6_18 = _UPVALUE0_
    L6_18 = L6_18.BAD_PARAMETER
    return L6_18
  end
  L2_14 = A0_12["webAccessInfo.name"]
  L6_18 = A0_12["webAccessInfo.accessType"]
  L7_19 = _UPVALUE0_
  L7_19 = L7_19.NIL
  if L6_18 == L7_19 then
    L6_18 = _UPVALUE0_
    L6_18 = L6_18.BAD_PARAMETER
    return L6_18
  end
  L3_15 = A0_12["webAccessInfo.accessType"]
  if L3_15 == "0" then
    L6_18 = A0_12["webAccessInfo.IpAddr"]
    L7_19 = _UPVALUE0_
    L7_19 = L7_19.NIL
    if L6_18 == L7_19 then
      L6_18 = _UPVALUE0_
      L6_18 = L6_18.BAD_PARAMETER
      return L6_18
    end
    L4_16 = A0_12["webAccessInfo.IpAddr"]
  else
    L6_18 = A0_12["webAccessInfo.vlanName"]
    L7_19 = _UPVALUE0_
    L7_19 = L7_19.NIL
    if L6_18 == L7_19 then
      L6_18 = _UPVALUE0_
      L6_18 = L6_18.BAD_PARAMETER
      return L6_18
    end
    L5_17 = A0_12["webAccessInfo.vlanName"]
    L6_18, L7_19 = nil, nil
    L6_18, L7_19 = getVlanInfo(L5_17)
  end
  L6_18 = _UPVALUE1_
  L6_18 = L6_18.start
  L6_18()
  L6_18 = fw
  L6_18 = L6_18.core
  L6_18 = L6_18.webAccess
  L6_18 = L6_18.add
  L7_19 = L2_14
  L6_18 = L6_18(L7_19, L3_15, L4_16, L5_17, ipAddr, subnet)
  L1_13 = L6_18
  L6_18 = _UPVALUE0_
  L6_18 = L6_18.SUCCESS
  if L1_13 ~= L6_18 then
    L6_18 = util
    L6_18 = L6_18.appendDebugOut
    L7_19 = "Error in deleting the web access filter."
    L6_18(L7_19)
    L6_18 = _UPVALUE1_
    L6_18 = L6_18.abort
    L6_18()
    return L1_13
  end
  L6_18 = _UPVALUE0_
  L1_13 = L6_18.SUCCESS
  L6_18 = _UPVALUE1_
  L6_18 = L6_18.complete
  L6_18()
  L6_18 = _UPVALUE1_
  L6_18 = L6_18.save
  L6_18()
  return L1_13
end
function webAccessFilterEdit(A0_20)
  local L1_21, L2_22, L3_23, L4_24, L5_25, L6_26, L7_27, L8_28
  L1_21 = _UPVALUE0_
  L1_21 = L1_21.FAILURE
  L2_22 = A0_20["webAccessInfo.name"]
  L3_23 = A0_20["webAccessInfo.accessType"]
  L4_24 = A0_20["webAccessInfo.IpAddr"]
  L5_25 = A0_20["webAccessInfo.vlanName"]
  L6_26 = A0_20["webAccessInfo.cookie"]
  L7_27 = ACCESS_LEVEL
  if L7_27 ~= 0 then
    L7_27 = util
    L7_27 = L7_27.appendDebugOut
    L8_28 = "Detected Unauthorized access for page."
    L7_27(L8_28)
    L7_27 = _UPVALUE0_
    L7_27 = L7_27.UNAUTHORIZED
    return L7_27
  end
  L7_27 = A0_20["webAccessInfo.name"]
  L8_28 = _UPVALUE0_
  L8_28 = L8_28.NIL
  if L7_27 == L8_28 then
    L7_27 = _UPVALUE0_
    L7_27 = L7_27.BAD_PARAMETER
    return L7_27
  end
  L2_22 = A0_20["webAccessInfo.name"]
  L7_27 = A0_20["webAccessInfo.accessType"]
  L8_28 = _UPVALUE0_
  L8_28 = L8_28.NIL
  if L7_27 == L8_28 then
    L7_27 = _UPVALUE0_
    L7_27 = L7_27.BAD_PARAMETER
    return L7_27
  end
  L3_23 = A0_20["webAccessInfo.accessType"]
  if L3_23 == "0" then
    L7_27 = A0_20["webAccessInfo.IpAddr"]
    L8_28 = _UPVALUE0_
    L8_28 = L8_28.NIL
    if L7_27 == L8_28 then
      L7_27 = _UPVALUE0_
      L7_27 = L7_27.BAD_PARAMETER
      return L7_27
    end
    L4_24 = A0_20["webAccessInfo.IpAddr"]
  else
    L7_27 = A0_20["webAccessInfo.vlanName"]
    L8_28 = _UPVALUE0_
    L8_28 = L8_28.NIL
    if L7_27 == L8_28 then
      L7_27 = _UPVALUE0_
      L7_27 = L7_27.BAD_PARAMETER
      return L7_27
    end
    L5_25 = A0_20["webAccessInfo.vlanName"]
    L7_27, L8_28 = nil, nil
    L7_27, L8_28 = getVlanInfo(L5_25)
  end
  L7_27 = A0_20["webAccessInfo.cookie"]
  L8_28 = _UPVALUE0_
  L8_28 = L8_28.NIL
  if L7_27 == L8_28 then
    L7_27 = _UPVALUE0_
    L7_27 = L7_27.BAD_PARAMETER
    return L7_27
  end
  L6_26 = A0_20["webAccessInfo.cookie"]
  L7_27 = _UPVALUE1_
  L7_27 = L7_27.start
  L7_27()
  L7_27 = fw
  L7_27 = L7_27.core
  L7_27 = L7_27.webAccess
  L7_27 = L7_27.edit
  L8_28 = L2_22
  L7_27 = L7_27(L8_28, L3_23, L4_24, L5_25, ipAddr, subnet, L6_26)
  L1_21 = L7_27
  L7_27 = _UPVALUE0_
  L7_27 = L7_27.SUCCESS
  if L1_21 ~= L7_27 then
    L7_27 = util
    L7_27 = L7_27.appendDebugOut
    L8_28 = "Error in deleting the access filters."
    L7_27(L8_28)
    L7_27 = _UPVALUE1_
    L7_27 = L7_27.abort
    L7_27()
    return L1_21
  end
  L7_27 = _UPVALUE0_
  L1_21 = L7_27.SUCCESS
  L7_27 = _UPVALUE1_
  L7_27 = L7_27.complete
  L7_27()
  L7_27 = _UPVALUE1_
  L7_27 = L7_27.save
  L7_27()
  return L1_21
end
function webAccessFilterGetAll()
  local L0_29, L1_30, L2_31, L3_32, L4_33, L5_34, L6_35
  L0_29 = _UPVALUE0_
  L0_29 = L0_29.FAILURE
  L1_30 = {}
  L1_30 = L3_32
  L0_29 = L2_31
  for L5_34, L6_35 in L2_31(L3_32) do
    for _FORV_10_, _FORV_11_ in pairs(L6_35) do
    end
  end
  if L0_29 ~= L2_31 then
    return L2_31, L3_32
  end
  return L2_31, L3_32
end
