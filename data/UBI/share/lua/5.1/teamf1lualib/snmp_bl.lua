local L0_0
L0_0 = module
L0_0("com.teamf1.bl.snmp.users", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/snmp_users")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function snmpUserSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9
  L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9 = _UPVALUE0_.userGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9
end
function snmpUserSectionGetNext(A0_10)
  local L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18, L9_19, L10_20
  L1_11 = A0_10["snmp.cookie"]
  if L1_11 == nil then
    L2_12 = util
    L2_12 = L2_12.appendDebugOut
    L3_13 = "GetNext : Invalid Cookie"
    L2_12(L3_13)
    L2_12 = _UPVALUE0_
    L2_12 = L2_12.BAD_PARAMETER
    return L2_12
  end
  L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18, L9_19, L10_20 = nil, nil, nil, nil, nil, nil, nil, nil, nil
  L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18, L9_19, L10_20 = _UPVALUE1_.userGetNext(L1_11)
  if L2_12 ~= _UPVALUE0_.SUCCESS then
    return L2_12
  end
  return L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18, L9_19, L10_20
end
function snmpUserSectionGetCur(A0_21)
  local L1_22, L2_23, L3_24, L4_25, L5_26, L6_27, L7_28, L8_29
  L1_22, A0_21, L2_23, L3_24, L4_25, L5_26, L6_27, L7_28, L8_29 = _UPVALUE0_.userGetCur(A0_21)
  L4_25 = tostring(tonumber(L4_25) + 1)
  if L5_26 ~= _UPVALUE1_.NIL then
    L5_26 = authAlgoToNum(L5_26)
  end
  if L7_28 ~= _UPVALUE1_.NIL then
    L7_28 = privacyAlgoToNum(L7_28)
  end
  if L1_22 ~= _UPVALUE1_.SUCCESS then
    return L1_22
  end
  return L1_22, A0_21, L2_23, L3_24, L4_25, L5_26, L6_27, L7_28, L8_29
end
function snmpUserSectionGetAll()
  local L0_30, L1_31
  L1_31 = {}
  L0_30, L1_31 = _UPVALUE0_.userGetAll()
  if L0_30 ~= _UPVALUE1_.SUCCESS then
    return L0_30
  end
  return L0_30, L1_31
end
function snmpUserSectionSet(A0_32)
  local L1_33, L2_34, L3_35, L4_36, L5_37, L6_38, L7_39, L8_40
  L1_33 = ACCESS_LEVEL
  if L1_33 ~= 0 then
    L1_33 = util
    L1_33 = L1_33.appendDebugOut
    L2_34 = "Detected Unauthorized access for page snmp"
    L1_33(L2_34)
    L1_33 = _UPVALUE0_
    L1_33 = L1_33.UNAUTHORIZED
    return L1_33
  end
  L1_33 = A0_32["snmp.cookie"]
  L2_34 = A0_32["snmp.securityLevel"]
  L3_35 = A0_32["snmp.authAlgo"]
  L4_36 = A0_32["snmp.authPassword"]
  L5_37 = A0_32["snmp.privAlgo"]
  L6_38 = A0_32["snmp.privPassword"]
  L7_39 = tostring
  L8_40 = tonumber
  L8_40 = L8_40(L2_34)
  L8_40 = L8_40 - 1
  L7_39 = L7_39(L8_40)
  L2_34 = L7_39
  if L1_33 == nil then
    L7_39 = util
    L7_39 = L7_39.appendDebugOut
    L8_40 = "Set : Invalid Cookie"
    L7_39(L8_40)
    L7_39 = _UPVALUE0_
    L7_39 = L7_39.BAD_PARAMETER
    return L7_39
  end
  L7_39 = _UPVALUE0_
  L7_39 = L7_39.NIL
  if L3_35 ~= L7_39 then
    L7_39 = _UPVALUE1_
    L8_40 = tonumber
    L8_40 = L8_40(L3_35)
    L3_35 = L7_39[L8_40]
  end
  L7_39 = _UPVALUE0_
  L7_39 = L7_39.NIL
  if L5_37 ~= L7_39 then
    L7_39 = _UPVALUE2_
    L8_40 = tonumber
    L8_40 = L8_40(L5_37)
    L5_37 = L7_39[L8_40]
  end
  if L2_34 == nil then
    L7_39 = util
    L7_39 = L7_39.appendDebugOut
    L8_40 = "GetNext : Invalid Cookie"
    L7_39(L8_40)
    L7_39 = _UPVALUE0_
    L7_39 = L7_39.BAD_PARAMETER
    return L7_39
  end
  L7_39, L8_40 = nil, nil
  _UPVALUE3_.start()
  L7_39, L8_40 = _UPVALUE4_.userSet(L1_33, L2_34, L3_35, L4_36, L5_37, L6_38)
  if L7_39 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page snmp" .. L7_39)
    _UPVALUE3_.abort()
    return L7_39, L1_33
  end
  _UPVALUE3_.complete()
  _UPVALUE3_.save()
  return _UPVALUE0_.SUCCESS, L8_40
end
function authAlgoToNum(A0_41)
  local L1_42
  if A0_41 == "MD5" then
    L1_42 = "1"
  elseif A0_41 == "SHA" then
    L1_42 = "2"
  end
  return L1_42
end
function privacyAlgoToNum(A0_43)
  local L1_44
  if A0_43 == "DES" then
    L1_44 = "1"
  elseif A0_43 == "AES" then
    L1_44 = "2"
  end
  return L1_44
end
