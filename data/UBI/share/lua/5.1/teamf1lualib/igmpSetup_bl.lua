local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/services_igmpProxy")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
ENABLE = "1"
DISABLE = "0"
function igmpProxyGet()
  local L0_1, L1_2, L2_3
  L0_1, L1_2, L2_3 = _UPVALUE0_.isfeatureEnabled()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3
end
function igmpproxySet(A0_4)
  local L1_5, L2_6, L3_7, L4_8, L5_9, L6_10
  L1_5 = ACCESS_LEVEL
  if L1_5 ~= 0 then
    L1_5 = util
    L1_5 = L1_5.appendDebugOut
    L2_6 = "Detected Unauthorized access for page igmpSetup"
    L1_5(L2_6)
    L1_5 = _UPVALUE0_
    L1_5 = L1_5.UNAUTHORIZED
    return L1_5
  end
  L1_5 = A0_4["Igmp.cookie"]
  L2_6 = A0_4["Igmp.IgmpEnable"]
  L3_7 = A0_4["Igmp.upstreamInterfaceWAN1"]
  L4_8 = A0_4["Igmp.upstreamInterfaceWAN2"]
  if L1_5 == nil then
    L5_9 = util
    L5_9 = L5_9.appendDebugOut
    L6_10 = "Set : Invalid Cookie"
    L5_9(L6_10)
    L5_9 = _UPVALUE0_
    L5_9 = L5_9.BAD_PARAMETER
    return L5_9
  end
  if L2_6 == nil then
    L5_9 = util
    L5_9 = L5_9.appendDebugOut
    L6_10 = "GetNext : Invalid Cookie"
    L5_9(L6_10)
    L5_9 = _UPVALUE0_
    L5_9 = L5_9.BAD_PARAMETER
    return L5_9
  end
  L5_9, L6_10 = nil, nil
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page igmpSetup")
    return _UPVALUE0_.UNAUTHORIZED
  end
  _UPVALUE1_.start()
  if L2_6 == ENABLE then
    L5_9, L6_10 = _UPVALUE2_.featureEnable(L1_5, L2_6, L3_7, L4_8)
  else
    L5_9, L6_10 = _UPVALUE2_.featureDisable(L1_5)
  end
  if L5_9 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page igmpSetup" .. L5_9)
    _UPVALUE1_.abort()
    return L5_9, L1_5
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L5_9, L6_10
end
function igmpSectionGet(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16
  L1_12, L2_13, L3_14, L4_15, L5_16 = _UPVALUE0_.igmpEntryGet(A0_11)
  if L1_12 ~= _UPVALUE1_.SUCCESS then
    return L1_12
  end
  return L1_12, L2_13, L3_14, L4_15, L5_16
end
function igmpSectionGetNext(A0_17)
  local L1_18, L2_19, L3_20, L4_21, L5_22, L6_23
  L1_18 = A0_17["igmpSetup.cookie"]
  if L1_18 == nil then
    L2_19 = util
    L2_19 = L2_19.appendDebugOut
    L3_20 = "GetNext : Invalid Cookie"
    L2_19(L3_20)
    L2_19 = _UPVALUE0_
    L2_19 = L2_19.BAD_PARAMETER
    return L2_19
  end
  L2_19, L3_20, L4_21, L5_22, L6_23 = nil, nil, nil, nil, nil
  L2_19, L3_20, L4_21, L5_22, L6_23 = _UPVALUE1_.igmpEntryGetNext(L1_18)
  if L2_19 ~= _UPVALUE0_.SUCCESS then
    return L2_19
  end
  return L2_19, L3_20, L4_21, L5_22, L6_23
end
function igmpSectionSet(A0_24)
  local L1_25, L2_26, L3_27, L4_28, L5_29
  L1_25 = ACCESS_LEVEL
  if L1_25 ~= 0 then
    L1_25 = util
    L1_25 = L1_25.appendDebugOut
    L2_26 = "Detected Unauthorized access for page igmpSetup"
    L1_25(L2_26)
    L1_25 = _UPVALUE0_
    L1_25 = L1_25.UNAUTHORIZED
    return L1_25
  end
  L1_25 = A0_24["igmpSetup.cookie"]
  L2_26 = A0_24["igmpSetup.networkAddress"]
  L3_27 = A0_24["igmpSetup.maskLength"]
  if L1_25 == nil then
    L4_28 = util
    L4_28 = L4_28.appendDebugOut
    L5_29 = "Set : Invalid Cookie"
    L4_28(L5_29)
    L4_28 = _UPVALUE0_
    L4_28 = L4_28.BAD_PARAMETER
    return L4_28
  end
  if L2_26 == nil or L3_27 == nil then
    L4_28 = util
    L4_28 = L4_28.appendDebugOut
    L5_29 = "GetNext : Invalid Cookie"
    L4_28(L5_29)
    L4_28 = _UPVALUE0_
    L4_28 = L4_28.BAD_PARAMETER
    return L4_28
  end
  L4_28, L5_29 = nil, nil
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page igmpSetup")
    return _UPVALUE0_.UNAUTHORIZED
  end
  _UPVALUE1_.start()
  L4_28, L5_29 = _UPVALUE2_.igmpEntrySet(L1_25, L2_26, L3_27, interface)
  if L4_28 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page igmpSetup" .. L4_28)
    _UPVALUE1_.abort()
    return L4_28, L1_25
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L4_28, L5_29
end
function igmpSectionDelete(A0_30)
  local L1_31, L2_32
  L1_31 = ACCESS_LEVEL
  if L1_31 ~= 0 then
    L1_31 = util
    L1_31 = L1_31.appendDebugOut
    L2_32 = "Detected Unauthorized access for page igmpSetup"
    L1_31(L2_32)
    L1_31 = _UPVALUE0_
    L1_31 = L1_31.UNAUTHORIZED
    return L1_31
  end
  L1_31 = A0_30["igmpSetup.cookie"]
  if L1_31 == nil then
    L2_32 = util
    L2_32 = L2_32.appendDebugOut
    L2_32("Delete : Invalid Cookie")
    L2_32 = _UPVALUE0_
    L2_32 = L2_32.BAD_PARAMETER
    return L2_32
  end
  L2_32 = nil
  _UPVALUE1_.start()
  L2_32, cookie = _UPVALUE2_.igmpEntryDelete(L1_31)
  if L2_32 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page igmpSetup" .. L2_32)
    _UPVALUE1_.abort()
    return L2_32, L1_31
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function igmpSectionDeleteAll()
  local L0_33
  L0_33 = ACCESS_LEVEL
  if L0_33 ~= 0 then
    L0_33 = util
    L0_33 = L0_33.appendDebugOut
    L0_33("Detected Unauthorized access for page igmpSetup")
    L0_33 = _UPVALUE0_
    L0_33 = L0_33.UNAUTHORIZED
    return L0_33
  end
  L0_33 = nil
  _UPVALUE1_.start()
  L0_33, cookie = _UPVALUE2_.igmpEntryDeleteAll()
  if L0_33 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page igmpSetup" .. L0_33)
    _UPVALUE1_.abort()
    return L0_33, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function igmpSectionCreate(A0_34)
  local L1_35, L2_36, L3_37, L4_38
  L3_37 = ACCESS_LEVEL
  if L3_37 ~= 0 then
    L3_37 = util
    L3_37 = L3_37.appendDebugOut
    L4_38 = "Detected Unauthorized access for page igmpSetup"
    L3_37(L4_38)
    L3_37 = _UPVALUE0_
    L3_37 = L3_37.UNAUTHORIZED
    return L3_37
  end
  L3_37 = A0_34["igmpSetup.networkAddress"]
  L4_38 = A0_34["igmpSetup.maskLength"]
  if L3_37 == nil or L4_38 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L1_35, L2_36 = _UPVALUE2_.igmpEntryCreate(L3_37, L4_38)
  if L1_35 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page  igmpSetup" .. L1_35)
    _UPVALUE1_.abort()
    return L1_35, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_35, L2_36
end
function igmpProxyGetAll()
  local L0_39, L1_40
  L0_39, L1_40 = _UPVALUE0_.igmpEntryGetAll()
  if L0_39 ~= _UPVALUE1_.SUCCESS then
    return L0_39
  end
  return L0_39, L1_40
end
