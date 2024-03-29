local L0_0
L0_0 = module
L0_0("com.teamf1.core.filter.validations", package.seeall)
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function validCategoryList(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9
  L1_2 = false
  L2_3 = ""
  L3_4 = {}
  if A0_1 == nil then
    return L1_2
  elseif A0_1 ~= "--" then
    L4_5 = 1
    for L8_9 in L5_6(L6_7, L7_8) do
      L3_4[L4_5] = L8_9
      if L4_5 == 1 then
        L2_3 = L8_9
      else
        L2_3 = L2_3 .. "," .. L8_9
      end
      L4_5 = L4_5 + 1
      if tonumber(L8_9) > _UPVALUE0_ or tonumber(L8_9) < _UPVALUE1_ then
        L2_3 = nil
        return L1_2
      end
    end
    if L2_3 == A0_1 then
      for L8_9 = 1, L4_5 do
        for _FORV_12_, _FORV_13_ in pairs(L3_4) do
          if _FORV_12_ ~= L8_9 and L3_4[L8_9] == _FORV_13_ then
            return L1_2
          end
        end
      end
      L1_2 = true
      return L1_2
    else
      return L1_2
    end
  else
    L1_2 = true
    return L1_2
  end
end
function urlValidation(A0_10)
  local L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18
  L1_11 = false
  valid = L1_11
  if A0_10 ~= nil then
    L1_11 = string
    L1_11 = L1_11.len
    L1_11 = L1_11(L2_12)
  elseif L1_11 > L2_12 then
    L1_11 = valid
    return L1_11
  end
  L1_11 = ""
  for L5_15 in L2_12(L3_13, L4_14) do
    L7_17 = L5_15
    L1_11 = L6_16 .. L7_17
  end
  if L2_12 then
    return L2_12
  end
  if L3_13 ~= "." then
    if L3_13 ~= "-" then
      if L3_13 ~= ":" then
        if L3_13 ~= "/" then
          if L3_13 ~= "." then
            if L3_13 ~= "-" then
              if L3_13 ~= ":" then
              end
            end
          end
        end
      end
    end
  elseif L3_13 == "/" then
    return L3_13
  end
  for L7_17, L8_18 in L4_14(L5_15) do
    if L2_12 < 1 or L2_12 > _UPVALUE2_ then
      return valid
    end
  end
  valid = L4_14
  return L4_14
end
function urlProtocolCheck(A0_19)
  local L1_20, L2_21, L3_22
  L1_20 = false
  valid = L1_20
  L1_20, L2_21, L3_22 = nil, nil, nil
  L1_20, L2_21, L3_22 = A0_19:find("^([a-zA-Z][-+.a-zA-Z0-9]*):")
  if L3_22 then
    return valid
  end
  valid = true
  return valid
end
function db.getColumn(A0_23, A1_24)
  local L2_25, L3_26, L4_27, L5_28
  L2_25 = db
  L2_25 = L2_25.execute
  L3_26 = string
  L3_26 = L3_26.format
  L4_27 = [[
    SELECT %s FROM %s
    ]]
  L5_28 = A1_24
  L5_28 = L3_26(L4_27, L5_28, A0_23)
  L2_25 = L2_25(L3_26, L4_27, L5_28, L3_26(L4_27, L5_28, A0_23))
  L3_26 = {}
  if L2_25 then
    L4_27 = 0
    L5_28 = L2_25.fetch
    L5_28 = L5_28(L2_25, {}, "a")
    while L5_28 do
      L4_27 = L4_27 + 1
      for _FORV_9_, _FORV_10_ in pairs(L5_28) do
        L3_26[L4_27] = _FORV_10_
      end
      L5_28 = L2_25:fetch(L5_28, "a")
    end
    L2_25:close()
    return L3_26
  else
    return L3_26
  end
end
function lanGroupValidation(A0_29)
  local L1_30, L2_31, L3_32, L4_33
  L1_30 = false
  L2_31 = "LanGroup"
  L3_32 = "GroupName"
  L4_33 = db
  L4_33 = L4_33.getColumn
  L4_33 = L4_33(L2_31, L3_32)
  if tostring(A0_29) == "1" then
    L1_30 = true
    return L1_30
  end
  for _FORV_8_, _FORV_9_ in pairs(L4_33) do
    if A0_29 == _FORV_9_ then
      L1_30 = true
      return L1_30
    end
  end
  return L1_30
end
