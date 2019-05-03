local L0_0
L0_0 = module
L0_0("com.teamf1.bl.lanqos.trustmode", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/lanqos_trustMode")
L0_0 = require
L0_0("teamf1lualib/wan_routingMode")
L0_0 = "5"
function trustModeGet()
  local L0_1, L1_2, L2_3, L3_4
  L3_4, L2_3, L0_1, L1_2 = _UPVALUE0_.trustModeGroupGet()
  if L3_4 ~= _UPVALUE1_.SUCCESS then
    return L3_4
  end
  L1_2 = _UPVALUE2_[tonumber(L1_2)]
  return L3_4, L2_3, L0_1, L1_2
end
function trustModeGetNext(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10, L6_11
  L2_7 = A0_5["trusMode.cookie"]
  if L2_7 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_6, L5_10, L6_11 = _UPVALUE1_.routingModeGet()
  if L1_6 ~= _UPVALUE0_.SUCCESS then
    return L1_6
  end
  if L2_7 == _UPVALUE2_ and L6_11 ~= _UPVALUE3_ then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_6, L5_10, L3_8, L4_9 = _UPVALUE4_.trustModeGroupGetNext(L2_7)
  if L1_6 ~= _UPVALUE0_.SUCCESS then
    return L1_6
  end
  L4_9 = _UPVALUE5_[tonumber(L4_9)]
  return L1_6, L5_10, L3_8, L4_9
end
function trustModeSet(A0_12)
  local L1_13, L2_14, L3_15, L4_16
  L3_15 = A0_12["trustMode.trustMode"]
  L4_16 = A0_12["trustMode.cookie"]
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page DUMMY PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if L4_16 == nil then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L3_15 == nil then
    util.appendDebugOut("Set : Invalid trustMode")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_13, cookie, L2_14 = _UPVALUE1_.routingModeGet()
  if L1_13 ~= _UPVALUE0_.SUCCESS then
    return L1_13
  end
  if L4_16 == _UPVALUE2_ and L2_14 ~= _UPVALUE3_ then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE4_.start()
  L1_13, cookie = _UPVALUE5_.trustModeSet(L4_16, L3_15)
  if L1_13 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in trustMode page" .. L1_13)
    _UPVALUE4_.abort()
    return L1_13
  end
  _UPVALUE4_.complete()
  _UPVALUE4_.save()
  return L1_13, cookie
end
function trustModeGroupGet()
  local L0_17, L1_18, L2_19, L3_20, L4_21, L5_22, L6_23, L7_24
  L6_23 = {}
  L7_24 = 1
  L0_17, L4_21, L5_22 = _UPVALUE0_.routingModeGet()
  if L0_17 ~= _UPVALUE1_.SUCCESS then
    return L0_17
  end
  L0_17, L4_21, L2_19, L3_20 = _UPVALUE2_.trustModeGroupGet()
  if L0_17 == _UPVALUE1_.SUCCESS then
    L6_23[L7_24] = {}
    L6_23[L7_24].port = L2_19
    L3_20 = _UPVALUE3_[tonumber(L3_20)]
    L6_23[L7_24].trustMode = L3_20
    L7_24 = L7_24 + 1
    while L0_17 == _UPVALUE1_.SUCCESS do
      if L4_21 == _UPVALUE4_ and L5_22 ~= _UPVALUE5_ then
        util.appendDebugOut("GetNext : Invalid Cookie")
        break
      end
      L0_17, L4_21, L2_19, L3_20 = _UPVALUE2_.trustModeGroupGetNext(L4_21)
      if L0_17 == _UPVALUE1_.SUCCESS then
        L6_23[L7_24] = {}
        L6_23[L7_24].port = L2_19
        L3_20 = _UPVALUE3_[tonumber(L3_20)]
        L6_23[L7_24].trustMode = L3_20
        L7_24 = L7_24 + 1
      end
    end
    return _UPVALUE1_.SUCCESS, L6_23
  else
    return L0_17
  end
end
function trustModeGetAll()
  local L0_25, L1_26
  L0_25, L1_26 = _UPVALUE0_.trustModeInfoGetAll()
  if L0_25 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  L0_25, cookie, routingMode = _UPVALUE2_.routingModeGet()
  if L0_25 ~= _UPVALUE1_.SUCCESS then
    return L0_25
  end
  if routingMode ~= _UPVALUE3_ then
    L1_26[tonumber(_UPVALUE4_)] = _UPVALUE1_.NIL
  end
  for _FORV_5_, _FORV_6_ in pairs(L1_26) do
    _FORV_6_.trustMode = _UPVALUE5_[tonumber(_FORV_6_.trustMode)]
  end
  return _UPVALUE1_.SUCCESS, L1_26
end
function trustModeGetInfo(A0_27)
  local L1_28, L2_29
  curCookie = A0_27["trustMode.cookie"]
  if curCookie == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_28, L2_29 = _UPVALUE1_.trustModeInfoGetRow(curCookie)
  if L1_28 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  L2_29 = util.removePrefix(L2_29, "swPortConfig.")
  return _UPVALUE0_.SUCCESS, L2_29
end
