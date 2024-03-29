local L0_0
L0_0 = module
L0_0("com.teamf1.bl.filter.dynamic", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/filter_dynamic")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function dynamicFilteringSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15
  L8_9 = _UPVALUE0_
  L8_9 = L8_9.categoryListGet
  L7_8, L8_9 = nil, L8_9()
  L7_8, L13_14 = nil, L8_9()
  L7_8, L14_15 = nil, L8_9()
  L6_7 = L14_15
  L5_6 = L13_14
  L4_5 = L12_13
  L3_4 = L11_12
  L2_3 = L10_11
  L1_2 = L9_10
  L0_1 = L8_9
  L8_9 = _UPVALUE1_
  L8_9 = L8_9.SUCCESS
  if L0_1 ~= L8_9 then
    return L0_1
  end
  L8_9 = {}
  for L12_13 = 1, 32 do
    L8_9[L12_13] = "0"
  end
  for L13_14, L14_15 in L10_11(L11_12) do
    if tonumber(L14_15) ~= _UPVALUE1_.NIL then
      L8_9[tonumber(L14_15)] = "1"
    end
  end
  L8_9[33] = L3_4
  L8_9["siteCategory.nonManagedVerdict"] = L4_5
  L8_9["siteCategory.categoryVerdict"] = L5_6
  L8_9["siteCategory.timeout"] = L6_7
  L8_9["siteCategory.updateAccess"] = L7_8
  return L10_11, L11_12, L12_13
end
function dynamicFilteringSectionSet(A0_16)
  local L1_17, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24
  L1_17 = ACCESS_LEVEL
  if L1_17 ~= 0 then
    L1_17 = util
    L1_17 = L1_17.appendDebugOut
    L2_18 = "Detected Unauthorized access for page approvedCategory PAGE"
    L1_17(L2_18)
    L1_17 = _UPVALUE0_
    L1_17 = L1_17.UNAUTHORIZED
    return L1_17
  end
  L1_17, L2_18 = nil, nil
  L3_19 = 0
  L4_20 = nil
  L5_21()
  for L8_24, _FORV_9_ in L5_21(L6_22) do
    L3_19 = L3_19 + 1
    if A0_16[_UPVALUE2_[L3_19]] == "1" then
      if L4_20 == _UPVALUE0_.NIL then
        L4_20 = tostring(L3_19) .. ","
      elseif L3_19 ~= 33 then
        L4_20 = L4_20 .. tostring(L3_19) .. ","
      end
    end
  end
  if L4_20 == L5_21 then
    L4_20 = "--"
  else
    L8_24 = -2
    L4_20 = L5_21
  end
  L8_24 = A0_16["siteCategory.updateAccess"]
  if L4_20 == "--" and (L5_21 == "1" or L6_22 == "1") then
    return _UPVALUE0_.ENABLED_CATEGORY
  end
  L1_17, L2_18 = _UPVALUE3_.categoryListSet(L4_20, A0_16[_UPVALUE2_[33]], L5_21, L6_22, L7_23, L8_24)
  if L1_17 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page approvedCategory PAGE" .. L1_17)
    _UPVALUE1_.abort()
    return L1_17, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L2_18
end
