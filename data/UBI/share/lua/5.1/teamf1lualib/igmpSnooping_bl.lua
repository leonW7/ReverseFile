local L0_0
L0_0 = module
L0_0("com.teamf1.bl.network.igmpSnooping", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/igmp_snooping")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function igmpSnoopingSectionGet()
  local L0_1, L1_2
  L0_1, cookie, L1_2 = _UPVALUE0_.isfeatureEnabled()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, cookie, L1_2
end
function igmpSnoopingSectionSet(A0_3)
  local L1_4, L2_5, L3_6
  L1_4 = ACCESS_LEVEL
  if L1_4 ~= 0 then
    L1_4 = util
    L1_4 = L1_4.appendDebugOut
    L2_5 = "Detected Unauthorized access for "
    L3_6 = "page igmpSnooping PAGE"
    L2_5 = L2_5 .. L3_6
    L1_4(L2_5)
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.UNAUTHORIZED
    return L1_4
  end
  L1_4 = A0_3["igmpSnooping.Status"]
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if L1_4 == L2_5 then
    L2_5 = util
    L2_5 = L2_5.appendDebugOut
    L3_6 = "GetNext : Invalid Cookie"
    L2_5(L3_6)
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.BAD_PARAMETER
    return L2_5
  end
  L2_5, L3_6 = nil, nil
  _UPVALUE1_.start()
  if L1_4 == _UPVALUE2_ then
    L2_5, L3_6 = _UPVALUE3_.featureEnable()
    if L2_5 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in configuring values in page " .. "igmpSnooping PAGE" .. L2_5)
      _UPVALUE1_.abort()
      return L2_5, curCookie
    end
  else
    L2_5, L3_6 = _UPVALUE3_.featureDisable()
    if L2_5 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in configuring values in page " .. "igmpSnooping PAGE" .. L2_5)
      _UPVALUE1_.abort()
      return L2_5, curCookie
    end
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L3_6
end
function igmpSnoopingPortSectionGetAll()
  local L0_7, L1_8
  L1_8 = {}
  L0_7, L1_8 = _UPVALUE0_.portMapGetAll()
  if L0_7 ~= _UPVALUE1_.SUCCESS then
    return L0_7
  end
  return L0_7, L1_8
end
function igmpSnoopingPortSectionGetCur(A0_9)
  local L1_10, L2_11
  L1_10, cookie, vlanId, participationPortVlans, portsTable = _UPVALUE0_.portMapGetCur(A0_9)
  if L1_10 ~= _UPVALUE1_.SUCCESS then
    return L1_10
  end
  return L1_10, cookie, vlanId, participationPortVlans, portsTable
end
function igmpSnoopingPortSectionSet(A0_12)
  local L1_13, L2_14, L3_15, L4_16, L5_17
  L1_13 = ACCESS_LEVEL
  if L1_13 ~= 0 then
    L1_13 = util
    L1_13 = L1_13.appendDebugOut
    L2_14 = "Detected Unauthorized access for page "
    L3_15 = "igmpSnooping PAGE"
    L2_14 = L2_14 .. L3_15
    L1_13(L2_14)
    L1_13 = _UPVALUE0_
    L1_13 = L1_13.UNAUTHORIZED
    return L1_13
  end
  L1_13 = A0_12["igmpSnooping.vlanId"]
  L2_14 = A0_12["igmpSnooping.membership"]
  L3_15 = A0_12["igmpSnooping.cookie"]
  L4_16, L5_17 = nil, nil
  _UPVALUE1_.start()
  L4_16, L5_17 = _UPVALUE2_.portMapSet(L3_15, L1_13, L2_14)
  if L4_16 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page " .. "igmpSnooping PAGE" .. L4_16)
    _UPVALUE1_.abort()
    return L4_16, L3_15
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L5_17
end
