local L0_0
L0_0 = module
L0_0("com.teamf1.bl.oneToOneMapping", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/ipsec_oneToOneMapping")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function oneToOneMappingEdit(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8
  L1_2 = ACCESS_LEVEL
  if L1_2 ~= 0 then
    L1_2 = util
    L1_2 = L1_2.appendDebugOut
    L2_3 = "Detected Unauthorized access for page oneToOneMapping"
    L1_2(L2_3)
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.UNAUTHORIZED
    return L1_2
  end
  L1_2 = A0_1["oneToOneMapping.cookie"]
  L2_3 = A0_1["oneToOneMapping.sourceIpStart"]
  L3_4 = A0_1["oneToOneMapping.mappedIpStart"]
  L4_5 = A0_1["oneToOneMapping.rangeLength"]
  L5_6 = A0_1["oneToOneMapping.vpnPolicyName"]
  L6_7 = _UPVALUE0_
  L6_7 = L6_7.NIL
  if L1_2 == L6_7 then
    L6_7 = util
    L6_7 = L6_7.appendDebugOut
    L7_8 = "Set : Invalid Cookie"
    L6_7(L7_8)
    L6_7 = _UPVALUE0_
    L6_7 = L6_7.BAD_PARAMETER
    return L6_7
  end
  L6_7 = _UPVALUE0_
  L6_7 = L6_7.NIL
  if L2_3 == L6_7 then
    L6_7 = util
    L6_7 = L6_7.appendDebugOut
    L7_8 = "Set : Invalid sourceIpStart"
    L6_7(L7_8)
    L6_7 = _UPVALUE0_
    L6_7 = L6_7.BAD_PARAMETER
    return L6_7
  end
  L6_7 = _UPVALUE0_
  L6_7 = L6_7.NIL
  if L3_4 == L6_7 then
    L6_7 = util
    L6_7 = L6_7.appendDebugOut
    L7_8 = "Set : Invalid mappedIpStart"
    L6_7(L7_8)
    L6_7 = _UPVALUE0_
    L6_7 = L6_7.BAD_PARAMETER
    return L6_7
  end
  L6_7 = _UPVALUE0_
  L6_7 = L6_7.NIL
  if L4_5 == L6_7 then
    L6_7 = util
    L6_7 = L6_7.appendDebugOut
    L7_8 = "Set : Invalid rangeLength"
    L6_7(L7_8)
    L6_7 = _UPVALUE0_
    L6_7 = L6_7.BAD_PARAMETER
    return L6_7
  end
  L6_7 = _UPVALUE0_
  L6_7 = L6_7.NIL
  if L5_6 == L6_7 then
    L6_7 = util
    L6_7 = L6_7.appendDebugOut
    L7_8 = "Set : Invalid vpnPolicyName"
    L6_7(L7_8)
    L6_7 = _UPVALUE0_
    L6_7 = L6_7.BAD_PARAMETER
    return L6_7
  end
  L6_7, L7_8 = nil, nil
  _UPVALUE1_.start()
  L6_7, L7_8 = _UPVALUE2_.oneToOneMappingSet(L1_2, L2_3, L3_4, L4_5, L5_6)
  if L6_7 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page oneToOneMapping" .. L6_7)
    _UPVALUE1_.abort()
    return L6_7, L1_2
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L7_8
end
function oneToOneMappingCreate(A0_9)
  local L1_10, L2_11, L3_12, L4_13, L5_14, L6_15
  L1_10 = ACCESS_LEVEL
  if L1_10 ~= 0 then
    L1_10 = util
    L1_10 = L1_10.appendDebugOut
    L2_11 = "Detected Unauthorized access for page oneToOneMapping"
    L1_10(L2_11)
    L1_10 = _UPVALUE0_
    L1_10 = L1_10.UNAUTHORIZED
    return L1_10
  end
  L1_10 = A0_9["oneToOneMapping.sourceIpStart"]
  L2_11 = A0_9["oneToOneMapping.mappedIpStart"]
  L3_12 = A0_9["oneToOneMapping.rangeLength"]
  L4_13 = A0_9["oneToOneMapping.vpnPolicyName"]
  L5_14 = _UPVALUE0_
  L5_14 = L5_14.NIL
  if L1_10 == L5_14 then
    L5_14 = util
    L5_14 = L5_14.appendDebugOut
    L6_15 = "Set : Invalid sourceIpStart"
    L5_14(L6_15)
    L5_14 = _UPVALUE0_
    L5_14 = L5_14.BAD_PARAMETER
    return L5_14
  end
  L5_14 = _UPVALUE0_
  L5_14 = L5_14.NIL
  if L2_11 == L5_14 then
    L5_14 = util
    L5_14 = L5_14.appendDebugOut
    L6_15 = "Set : Invalid mappedIpStart"
    L5_14(L6_15)
    L5_14 = _UPVALUE0_
    L5_14 = L5_14.BAD_PARAMETER
    return L5_14
  end
  L5_14 = _UPVALUE0_
  L5_14 = L5_14.NIL
  if L3_12 == L5_14 then
    L5_14 = util
    L5_14 = L5_14.appendDebugOut
    L6_15 = "Set : Invalid rangeLength"
    L5_14(L6_15)
    L5_14 = _UPVALUE0_
    L5_14 = L5_14.BAD_PARAMETER
    return L5_14
  end
  L5_14 = _UPVALUE0_
  L5_14 = L5_14.NIL
  if L4_13 == L5_14 then
    L5_14 = util
    L5_14 = L5_14.appendDebugOut
    L6_15 = "Set : Invalid vpnPolicyName"
    L5_14(L6_15)
    L5_14 = _UPVALUE0_
    L5_14 = L5_14.BAD_PARAMETER
    return L5_14
  end
  L5_14, L6_15 = nil, nil
  _UPVALUE1_.start()
  L5_14, L6_15 = _UPVALUE2_.oneToOneMappingCreate(L1_10, L2_11, L3_12, L4_13)
  if L5_14 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page oneToOneMapping" .. L5_14)
    _UPVALUE1_.abort()
    return L5_14
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L6_15
end
function oneToOneMappingDelete(A0_16)
  local L1_17, L2_18
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for oneToOneMapping PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_17 = A0_16["oneToOneMapping.cookie"]
  if L1_17 == _UPVALUE0_.NIL then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L2_18, cookie = _UPVALUE2_.oneToOneMappingDelete(L1_17)
  if L2_18 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in oneToOneMapping page " .. L2_18)
    _UPVALUE1_.abort()
    return L2_18
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L2_18, cookie
end
function oneToOneMappingSectionGetAll()
  local L0_19, L1_20
  L1_20 = {}
  L0_19, statusDis, L1_20 = _UPVALUE0_.oneToOneMappingGetAll()
  if L1_20 == _UPVALUE1_.NIL then
    L1_20 = {}
  end
  if L0_19 ~= _UPVALUE1_.SUCCESS then
    return L0_19, statusDis, L1_20
  end
  return L0_19, statusDis, L1_20
end
function oneToOneMappingSectionDeleteAll()
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for oneToOneMapping PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.oneToOneMappingDeleteAll()
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in sslVpnClientRoutes page " .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
function oneToOneMappingSectionGet(A0_21)
  local L1_22, L2_23
  L2_23 = {}
  L1_22, L2_23 = _UPVALUE0_.oneToOneMappingGet(A0_21)
  if L2_23 == _UPVALUE1_.NIL then
    L2_23 = {}
  end
  if L1_22 ~= _UPVALUE1_.SUCCESS then
    return L1_22, L2_23
  end
  return L1_22, L2_23
end
function vpnPoliciesGetAll()
  local L0_24, L1_25
  L1_25 = {}
  L0_24, L1_25 = _UPVALUE0_.policiesGetAll()
  if L1_25 == _UPVALUE1_.NIL then
    L1_25 = {}
  end
  if L0_24 ~= _UPVALUE1_.SUCCESS then
    return L0_24, L1_25
  end
  return L0_24, L1_25
end
