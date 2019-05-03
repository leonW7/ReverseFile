local L0_0
L0_0 = module
L0_0("com.teamf1.bl.filter.content", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/filter_content")
L0_0 = require
L0_0("teamf1lualib/ul_contentFiltering")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function contentFilteringSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7
  L0_1, L6_7, L1_2 = _UPVALUE0_.isfeatureEnabled()
  L0_1, L6_7, L2_3, L3_4, L4_5, L5_6 = _UPVALUE0_.webComponentBlockGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L6_7, L1_2, L2_3, L3_4, L5_6, L4_5
end
function contentFilteringSectionSet(A0_8)
  local L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15
  L1_9 = ACCESS_LEVEL
  if L1_9 ~= 0 then
    L1_9 = util
    L1_9 = L1_9.appendDebugOut
    L2_10 = "Detected Unauthorized access for page contentFiltering PAGE"
    L1_9(L2_10)
    L1_9 = _UPVALUE0_
    L1_9 = L1_9.UNAUTHORIZED
    return L1_9
  end
  L1_9 = A0_8["contentFiltering.feature"]
  L2_10 = A0_8["contentFiltering.webProxy"]
  L3_11 = A0_8["contentFiltering.java"]
  L4_12 = A0_8["contentFiltering.activex"]
  L5_13 = A0_8["contentFiltering.cookies"]
  L6_14 = _UPVALUE0_
  L6_14 = L6_14.NIL
  if L1_9 == L6_14 then
    L6_14 = util
    L6_14 = L6_14.appendDebugOut
    L7_15 = "GetNext : Invalid Cookie"
    L6_14(L7_15)
    L6_14 = _UPVALUE0_
    L6_14 = L6_14.BAD_PARAMETER
    return L6_14
  end
  L6_14, L7_15 = nil, nil
  _UPVALUE1_.start()
  if L1_9 == _UPVALUE2_ then
    if L2_10 == _UPVALUE0_.NIL or L3_11 == _UPVALUE0_.NIL or L4_12 == _UPVALUE0_.NIL or L5_13 == _UPVALUE0_.NIL then
      util.appendDebugOut("GetNext : Invalid Cookie")
      return _UPVALUE0_.BAD_PARAMETER
    end
    L6_14, L7_15 = _UPVALUE3_.contentFilteringEnable()
    if L6_14 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in configuring values in page contentFiltering PAGE" .. L6_14)
      _UPVALUE1_.abort()
      return L6_14, curCookie
    end
    L6_14, L7_15 = _UPVALUE4_.webComponentBlockSet(L2_10, L3_11, L4_12, L5_13)
    if L6_14 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in configuring values in page contentFiltering PAGE" .. L6_14)
      _UPVALUE1_.abort()
      return L6_14, curCookie
    end
  end
  if L1_9 == _UPVALUE5_ then
    L6_14, L7_15 = _UPVALUE3_.contentFilteringDisable()
    if L6_14 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in configuring values in page contentFiltering PAGE" .. L6_14)
      _UPVALUE1_.abort()
      return L6_14, curCookie
    end
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L7_15
end
