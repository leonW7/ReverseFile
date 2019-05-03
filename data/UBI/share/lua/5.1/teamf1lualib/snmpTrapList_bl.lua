local L0_0
L0_0 = module
L0_0("com.teamf1.bl.snmp.traps", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/snmp_traps")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function snmpTrapSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
  L0_1, L1_2, L2_3, L3_4, L4_5, L5_6 = _UPVALUE0_.trapServerListGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
end
function snmpTrapSectionGetNext(A0_7)
  local L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14
  L1_8 = A0_7["snmpTrapList.cookie"]
  if L1_8 == nil then
    L2_9 = util
    L2_9 = L2_9.appendDebugOut
    L3_10 = "GetNext : Invalid Cookie"
    L2_9(L3_10)
    L2_9 = _UPVALUE0_
    L2_9 = L2_9.BAD_PARAMETER
    return L2_9
  end
  L2_9, L3_10, L4_11, L5_12, L6_13, L7_14 = nil, nil, nil, nil, nil, nil
  L2_9, L3_10, L4_11, L5_12, L6_13, L7_14 = _UPVALUE1_.trapServerListGetNext(L1_8)
  if L2_9 ~= _UPVALUE0_.SUCCESS then
    return L2_9
  end
  return L2_9, L3_10, L4_11, L5_12, L6_13, L7_14
end
function snmpTrapSectionGetCur(A0_15)
  local L1_16, L2_17, L3_18, L4_19, L5_20
  L1_16, A0_15, L2_17, L3_18, L4_19, L5_20 = _UPVALUE0_.trapServerListGetCur(A0_15)
  if L5_20 == "v1" then
    L5_20 = "1"
  elseif L5_20 == "v2c" then
    L5_20 = "2"
  elseif L5_20 == "v3" then
    L5_20 = "3"
  end
  if L1_16 ~= _UPVALUE1_.SUCCESS then
    return L1_16
  end
  return L1_16, A0_15, L2_17, L3_18, L4_19, L5_20
end
function snmpTrapSectionGetAll()
  local L0_21, L1_22
  L1_22 = {}
  L0_21, L1_22 = _UPVALUE0_.trapServerListGetAll()
  if L0_21 ~= _UPVALUE1_.SUCCESS then
    return L0_21
  end
  return L0_21, L1_22
end
function snmpTrapSectionSet(A0_23)
  local L1_24, L2_25, L3_26, L4_27, L5_28, L6_29, L7_30
  L1_24 = ACCESS_LEVEL
  if L1_24 ~= 0 then
    L1_24 = util
    L1_24 = L1_24.appendDebugOut
    L2_25 = "Detected Unauthorized access for page snmpTrapList"
    L1_24(L2_25)
    L1_24 = _UPVALUE0_
    L1_24 = L1_24.UNAUTHORIZED
    return L1_24
  end
  L1_24 = A0_23["snmpTrapList.cookie"]
  L2_25 = A0_23["snmpTrapList.ipAddr"]
  L3_26 = A0_23["snmpTrapList.port"]
  L4_27 = A0_23["snmpTrapList.commName"]
  L5_28 = A0_23["snmpTrapList.snmpVersion"]
  L6_29 = _UPVALUE1_
  L7_30 = tonumber
  L7_30 = L7_30(L5_28)
  L5_28 = L6_29[L7_30]
  if L1_24 == nil then
    L6_29 = util
    L6_29 = L6_29.appendDebugOut
    L7_30 = "Set : Invalid Cookie"
    L6_29(L7_30)
    L6_29 = _UPVALUE0_
    L6_29 = L6_29.BAD_PARAMETER
    return L6_29
  end
  if L2_25 == nil or L3_26 == nil or L4_27 == nil or L5_28 == nil then
    L6_29 = util
    L6_29 = L6_29.appendDebugOut
    L7_30 = "GetNext : Invalid Cookie"
    L6_29(L7_30)
    L6_29 = _UPVALUE0_
    L6_29 = L6_29.BAD_PARAMETER
    return L6_29
  end
  L6_29, L7_30 = nil, nil
  _UPVALUE2_.start()
  L6_29, L7_30 = _UPVALUE3_.trapServerListSet(L1_24, L2_25, L3_26, L4_27, L5_28)
  if L6_29 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page snmpTrapList" .. L6_29)
    _UPVALUE2_.abort()
    return L6_29, L1_24
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return L6_29, L7_30
end
function snmpTrapSectionDelete(A0_31)
  local L1_32, L2_33, L3_34
  L1_32 = ACCESS_LEVEL
  if L1_32 ~= 0 then
    L1_32 = util
    L1_32 = L1_32.appendDebugOut
    L2_33 = "Detected Unauthorized access for page snmpTrapList"
    L1_32(L2_33)
    L1_32 = _UPVALUE0_
    L1_32 = L1_32.UNAUTHORIZED
    return L1_32
  end
  L1_32 = A0_31["snmpTrapList.cookie"]
  if L1_32 == nil then
    L2_33 = util
    L2_33 = L2_33.appendDebugOut
    L3_34 = "Delete : Invalid Cookie"
    L2_33(L3_34)
    L2_33 = _UPVALUE0_
    L2_33 = L2_33.BAD_PARAMETER
    return L2_33
  end
  L2_33, L3_34 = nil, nil
  _UPVALUE1_.start()
  L2_33, L3_34 = _UPVALUE2_.trapServerListDelete(L1_32)
  if L2_33 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page snmpTrapList" .. L2_33)
    _UPVALUE1_.abort()
    return L2_33, L1_32
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L2_33, L3_34
end
function snmpTrapSectionDeleteAll()
  local L0_35
  L0_35 = ACCESS_LEVEL
  if L0_35 ~= 0 then
    L0_35 = util
    L0_35 = L0_35.appendDebugOut
    L0_35("Detected Unauthorized access for page snmpTrapList")
    L0_35 = _UPVALUE0_
    L0_35 = L0_35.UNAUTHORIZED
    return L0_35
  end
  L0_35 = nil
  _UPVALUE1_.start()
  L0_35 = _UPVALUE2_.trapServerListDeleteAll()
  if L0_35 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page snmpTrapList" .. L0_35)
    _UPVALUE1_.abort()
    return L0_35
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L0_35
end
function snmpTrapSectionCreate(A0_36)
  local L1_37, L2_38, L3_39, L4_40, L5_41, L6_42, L7_43
  L1_37 = ACCESS_LEVEL
  if L1_37 ~= 0 then
    L1_37 = util
    L1_37 = L1_37.appendDebugOut
    L2_38 = "Detected Unauthorized access for page snmpTrapList"
    L1_37(L2_38)
    L1_37 = _UPVALUE0_
    L1_37 = L1_37.UNAUTHORIZED
    return L1_37
  end
  L1_37 = A0_36["snmpTrapList.cookie"]
  L2_38 = A0_36["snmpTrapList.ipAddr"]
  L3_39 = A0_36["snmpTrapList.port"]
  L4_40 = A0_36["snmpTrapList.commName"]
  L5_41 = A0_36["snmpTrapList.snmpVersion"]
  L6_42 = _UPVALUE1_
  L7_43 = tonumber
  L7_43 = L7_43(L5_41)
  L5_41 = L6_42[L7_43]
  if L2_38 == nil or L3_39 == nil or L4_40 == nil or L5_41 == nil then
    L6_42 = util
    L6_42 = L6_42.appendDebugOut
    L7_43 = "GetNext : Invalid Cookie"
    L6_42(L7_43)
    L6_42 = _UPVALUE0_
    L6_42 = L6_42.BAD_PARAMETER
    return L6_42
  end
  L6_42, L7_43 = nil, nil
  _UPVALUE2_.start()
  L6_42, L7_43 = _UPVALUE3_.trapServerListCreate(L2_38, L3_39, L4_40, L5_41)
  if L6_42 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page snmpTrapList" .. L6_42)
    _UPVALUE2_.abort()
    return L6_42, 0
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return L6_42, L7_43
end
