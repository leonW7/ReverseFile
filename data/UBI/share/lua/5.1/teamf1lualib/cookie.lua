local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function cookieGet(A0_1, A1_2, A2_3)
  local L3_4, L4_5
  L3_4 = {}
  L4_5 = nil
  if A0_1 == NIL or A1_2 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A2_3 ~= NIL then
    L3_4 = db.getColumnWhere(A0_1, A1_2, A2_3)
  else
    L3_4 = db.getColumn(A0_1, A1_2)
  end
  if L3_4 == NIL then
    return _UPVALUE0_.Failure
  end
  L4_5 = L3_4[1]
  return _UPVALUE0_.SUCCESS, L4_5
end
function cookieGetNext(A0_6, A1_7, A2_8, A3_9)
  local L4_10, L5_11
  L4_10 = {}
  L5_11 = nil
  if A0_6 == NIL or A1_7 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A2_8 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A3_9 ~= NIL then
    L4_10 = db.getColumnWhere(A0_6, A1_7, A3_9)
  else
    L4_10 = db.getColumn(A0_6, A1_7)
  end
  if L4_10 == NIL then
    return _UPVALUE0_.Failure
  end
  L5_11 = tostring(A2_8)
  for _FORV_10_, _FORV_11_ in pairs(L4_10) do
    if L5_11 == _FORV_11_ then
      L5_11 = L4_10[_FORV_10_ + 1]
      break
    end
  end
  if not true or L5_11 == NIL then
    return _UPVALUE0_.COOKIEFAIL
  end
  return _UPVALUE0_.SUCCESS, L5_11
end
function db.getColumn(A0_12, A1_13)
  local L2_14, L3_15, L4_16, L5_17
  L2_14 = db
  L2_14 = L2_14.execute
  L3_15 = string
  L3_15 = L3_15.format
  L4_16 = [[
    SELECT %s FROM %s
    ]]
  L5_17 = A1_13
  L5_17 = L3_15(L4_16, L5_17, A0_12)
  L2_14 = L2_14(L3_15, L4_16, L5_17, L3_15(L4_16, L5_17, A0_12))
  L3_15 = {}
  if L2_14 then
    L4_16 = 0
    L5_17 = L2_14.fetch
    L5_17 = L5_17(L2_14, {}, "a")
    while L5_17 do
      L4_16 = L4_16 + 1
      for _FORV_9_, _FORV_10_ in pairs(L5_17) do
        L3_15[L4_16] = _FORV_10_
      end
      L5_17 = L2_14:fetch(L5_17, "a")
    end
    L2_14:close()
    return L3_15
  else
    return L3_15
  end
end
function db.getColumnWhere(A0_18, A1_19, A2_20)
  local L3_21, L4_22, L5_23, L6_24
  L3_21 = db
  L3_21 = L3_21.execute
  L4_22 = string
  L4_22 = L4_22.format
  L5_23 = [[
    SELECT %s FROM %s WHERE %s
    ]]
  L6_24 = A1_19
  L6_24 = L4_22(L5_23, L6_24, A0_18, A2_20)
  L3_21 = L3_21(L4_22, L5_23, L6_24, L4_22(L5_23, L6_24, A0_18, A2_20))
  L4_22 = {}
  if L3_21 then
    L5_23 = 0
    L6_24 = L3_21.fetch
    L6_24 = L6_24(L3_21, {}, "a")
    while L6_24 do
      L5_23 = L5_23 + 1
      for _FORV_10_, _FORV_11_ in pairs(L6_24) do
        L4_22[L5_23] = _FORV_11_
      end
      L6_24 = L3_21:fetch(L6_24, "a")
    end
    L3_21:close()
    return L4_22
  else
    return L4_22
  end
end
