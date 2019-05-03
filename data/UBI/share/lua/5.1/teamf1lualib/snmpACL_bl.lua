local L0_0
L0_0 = module
L0_0("com.teamf1.bl.snmp.acl", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/snmp_acl")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function accessListSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
  L0_1, L1_2, L2_3, L3_4, L4_5, L5_6 = _UPVALUE0_.accessListGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
end
function accessListSectionGetNext(A0_7)
  local L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14
  L1_8 = A0_7["snmpAccessControllList.cookie"]
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
  L2_9, L3_10, L4_11, L5_12, L6_13, L7_14 = _UPVALUE1_.accessListGetNext(L1_8)
  if L2_9 ~= _UPVALUE0_.SUCCESS then
    return L2_9
  end
  return L2_9, L3_10, L4_11, L5_12, L6_13, L7_14
end
function accessListSectionSet(A0_15)
  local L1_16, L2_17, L3_18, L4_19, L5_20, L6_21, L7_22
  L1_16 = ACCESS_LEVEL
  if L1_16 ~= 0 then
    L1_16 = util
    L1_16 = L1_16.appendDebugOut
    L2_17 = "Detected Unauthorized access for page snmpAccessControllList"
    L1_16(L2_17)
    L1_16 = _UPVALUE0_
    L1_16 = L1_16.UNAUTHORIZED
    return L1_16
  end
  L1_16 = A0_15["snmpAccessControllList.cookie"]
  L2_17 = A0_15["snmpAccessControllList.ipAddr"]
  L3_18 = A0_15["snmpAccessControllList.subnetMask"]
  L4_19 = A0_15["snmpAccessControllList.commName"]
  L5_20 = A0_15["snmpAccessControllList.accessType"]
  if L1_16 == nil then
    L6_21 = util
    L6_21 = L6_21.appendDebugOut
    L7_22 = "Set : Invalid Cookie"
    L6_21(L7_22)
    L6_21 = _UPVALUE0_
    L6_21 = L6_21.BAD_PARAMETER
    return L6_21
  end
  if L2_17 == nil or L3_18 == nil or L4_19 == nil or L5_20 == nil then
    L6_21 = util
    L6_21 = L6_21.appendDebugOut
    L7_22 = "GetNext : Invalid Cookie"
    L6_21(L7_22)
    L6_21 = _UPVALUE0_
    L6_21 = L6_21.BAD_PARAMETER
    return L6_21
  end
  if L5_20 == "1" then
    L5_20 = "rocommunity"
  elseif L5_20 == "2" then
    L5_20 = "rwcommunity"
  end
  L6_21, L7_22 = nil, nil
  _UPVALUE1_.start()
  L6_21, L7_22 = _UPVALUE2_.accessListSet(L1_16, L2_17, L3_18, L4_19, L5_20)
  if L6_21 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page snmpAccessControllList" .. L6_21)
    _UPVALUE1_.abort()
    return L6_21, L1_16
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L7_22
end
function accessListSectionDelete(A0_23)
  local L1_24, L2_25, L3_26
  L1_24 = ACCESS_LEVEL
  if L1_24 ~= 0 then
    L1_24 = util
    L1_24 = L1_24.appendDebugOut
    L2_25 = "Detected Unauthorized access for page snmpAccessControllList"
    L1_24(L2_25)
    L1_24 = _UPVALUE0_
    L1_24 = L1_24.UNAUTHORIZED
    return L1_24
  end
  L1_24 = A0_23["snmpAccessControllList.cookie"]
  if L1_24 == nil then
    L2_25 = util
    L2_25 = L2_25.appendDebugOut
    L3_26 = "Delete : Invalid Cookie"
    L2_25(L3_26)
    L2_25 = _UPVALUE0_
    L2_25 = L2_25.BAD_PARAMETER
    return L2_25
  end
  L2_25, L3_26 = nil, nil
  _UPVALUE1_.start()
  L2_25, L3_26 = _UPVALUE2_.accessListDelete(L1_24)
  if L2_25 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page snmpAccessControllList" .. L2_25)
    _UPVALUE1_.abort()
    return L2_25, L1_24
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L3_26
end
function accessListSectionCreate(A0_27)
  local L1_28, L2_29, L3_30, L4_31, L5_32, L6_33
  L1_28 = ACCESS_LEVEL
  if L1_28 ~= 0 then
    L1_28 = util
    L1_28 = L1_28.appendDebugOut
    L2_29 = "Detected Unauthorized access for page snmpAccessControllList"
    L1_28(L2_29)
    L1_28 = _UPVALUE0_
    L1_28 = L1_28.UNAUTHORIZED
    return L1_28
  end
  L1_28 = A0_27["snmpAccessControllList.ipAddr"]
  L2_29 = A0_27["snmpAccessControllList.subnetMask"]
  L3_30 = A0_27["snmpAccessControllList.commName"]
  L4_31 = A0_27["snmpAccessControllList.accessType"]
  if L1_28 == nil or L2_29 == nil or L3_30 == nil or L4_31 == nil then
    L5_32 = util
    L5_32 = L5_32.appendDebugOut
    L6_33 = "GetNext : Invalid Cookie"
    L5_32(L6_33)
    L5_32 = _UPVALUE0_
    L5_32 = L5_32.BAD_PARAMETER
    return L5_32
  end
  L5_32, L6_33 = nil, nil
  if L4_31 == "1" then
    L4_31 = "rocommunity"
  elseif L4_31 == "2" then
    L4_31 = "rwcommunity"
  end
  _UPVALUE1_.start()
  L5_32, L6_33 = _UPVALUE2_.accessListCreate(L1_28, L2_29, L3_30, L4_31)
  if L5_32 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page snmpAccessControllList" .. L5_32)
    _UPVALUE1_.abort()
    return L5_32, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L6_33
end
function accessListSectionGetCur(A0_34)
  local L1_35, L2_36, L3_37, L4_38, L5_39
  L1_35, A0_34, L2_36, L3_37, L4_38, L5_39 = _UPVALUE0_.accessListGetCur(A0_34)
  if L5_39 == "rocommunity" then
    L5_39 = "1"
  elseif L5_39 == "rwcommunity" then
    L5_39 = "2"
  end
  if L1_35 ~= _UPVALUE1_.SUCCESS then
    return L1_35
  end
  return L1_35, A0_34, L2_36, L3_37, L4_38, L5_39
end
function accessListSectionGetAll()
  local L0_40, L1_41
  L1_41 = {}
  L0_40, L1_41 = _UPVALUE0_.accessListGetAll()
  if L0_40 ~= _UPVALUE1_.SUCCESS then
    return L0_40
  end
  return L0_40, L1_41
end
function accessListSectionDeleteAll()
  local L0_42
  L0_42 = ACCESS_LEVEL
  if L0_42 ~= 0 then
    L0_42 = util
    L0_42 = L0_42.appendDebugOut
    L0_42("Detected Unauthorized access for page snmpAccessControllList")
    L0_42 = _UPVALUE0_
    L0_42 = L0_42.UNAUTHORIZED
    return L0_42
  end
  L0_42 = nil
  _UPVALUE1_.start()
  L0_42 = _UPVALUE2_.accessListDeleteAll()
  if L0_42 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page snmpAccessControllList" .. L0_42)
    _UPVALUE1_.abort()
    return L0_42
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L0_42
end
