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
L0_0("teamf1lualib/services_upnp")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function upnpSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
  L0_1, L1_2, L2_3, L3_4, L4_5, L5_6 = _UPVALUE0_.upnpConfigGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
end
function upnpSectionSet(A0_7)
  local L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14
  L1_8 = ACCESS_LEVEL
  if L1_8 ~= 0 then
    L1_8 = util
    L1_8 = L1_8.appendDebugOut
    L2_9 = "Detected Unauthorized access for page upnp"
    L1_8(L2_9)
    L1_8 = _UPVALUE0_
    L1_8 = L1_8.UNAUTHORIZED
    return L1_8
  end
  L1_8 = A0_7["upnp.cookie"]
  L2_9 = A0_7["upnp.active"]
  L3_10 = A0_7["upnp.interface"]
  L4_11 = A0_7["upnp.advertisementPeriod"]
  L5_12 = A0_7["upnp.advertisementTimeToLive"]
  L6_13 = _UPVALUE0_
  L6_13 = L6_13.NIL
  if L1_8 == L6_13 then
    L6_13 = util
    L6_13 = L6_13.appendDebugOut
    L7_14 = "Set : Invalid Cookie"
    L6_13(L7_14)
    L6_13 = _UPVALUE0_
    L6_13 = L6_13.BAD_PARAMETER
    return L6_13
  end
  L6_13 = _UPVALUE0_
  L6_13 = L6_13.NIL
  if L2_9 == L6_13 then
    L6_13 = _UPVALUE0_
    L6_13 = L6_13.BAD_PARAMETER
    return L6_13
  end
  L6_13 = _UPVALUE1_
  if L2_9 == L6_13 then
    L6_13 = _UPVALUE0_
    L6_13 = L6_13.NIL
    if L3_10 ~= L6_13 then
      L6_13 = _UPVALUE0_
      L6_13 = L6_13.NIL
      if L4_11 ~= L6_13 then
        L6_13 = _UPVALUE0_
        L6_13 = L6_13.NIL
      end
    elseif L5_12 == L6_13 then
      L6_13 = util
      L6_13 = L6_13.appendDebugOut
      L7_14 = "GetNext : Invalid Cookie"
      L6_13(L7_14)
      L6_13 = _UPVALUE0_
      L6_13 = L6_13.BAD_PARAMETER
      return L6_13
    end
  end
  L6_13, L7_14 = nil, nil
  _UPVALUE2_.start()
  L6_13, L7_14 = _UPVALUE3_.upnpConfigSet(L1_8, L2_9, L3_10, L4_11, L5_12)
  if L6_13 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page upnp" .. L6_13)
    _UPVALUE2_.abort()
    return L6_13, L1_8
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return L6_13, L7_14
end
function upnpNetworkSectionGet()
  local L0_15, L1_16, L2_17, L3_18, L4_19, L5_20, L6_21
  L0_15, L1_16, L2_17, L3_18, L4_19, L5_20, L6_21 = _UPVALUE0_.upnpNetworkEntryGet()
  if L0_15 ~= _UPVALUE1_.SUCCESS then
    return L0_15
  end
  return L0_15, L1_16, L2_17, L3_18, L4_19, L5_20, L6_21
end
function upnpNetworkSectionGetNext(A0_22)
  local L1_23, L2_24, L3_25, L4_26, L5_27, L6_28, L7_29, L8_30
  L1_23 = A0_22["upnp.cookie"]
  L2_24 = _UPVALUE0_
  L2_24 = L2_24.NIL
  if L1_23 == L2_24 then
    L2_24 = util
    L2_24 = L2_24.appendDebugOut
    L3_25 = "GetNext : Invalid Cookie"
    L2_24(L3_25)
    L2_24 = _UPVALUE0_
    L2_24 = L2_24.BAD_PARAMETER
    return L2_24
  end
  L2_24, L3_25, L4_26, L5_27, L6_28, L7_29, L8_30 = nil, nil, nil, nil, nil, nil, nil
  L2_24, L3_25, L4_26, L5_27, L6_28, L7_29, L8_30 = _UPVALUE1_.upnpNetworkEntryGetNext(L1_23)
  if L2_24 ~= _UPVALUE0_.SUCCESS then
    return L2_24
  end
  return L2_24, L3_25, L4_26, L5_27, L6_28, L7_29, L8_30
end
function upnpPortMapListSectionGet()
  local L0_31
  L0_31 = {}
  returnCode, cookie, L0_31 = _UPVALUE0_.upnpPortMapListGet()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, cookie, L0_31
end
function upnpRefreshSectionSet()
  returnCode, cookie = _UPVALUE0_.upnpRefreshSet()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, cookie
end
