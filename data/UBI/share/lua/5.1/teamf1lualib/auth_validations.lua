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
L0_0 = L0_0("com.teamf1.core.returnCodes")
function cookieValidate(A0_1, A1_2, A2_3)
  local L3_4
  if A1_2 == nil or A2_3 == nil or A0_1 == nil then
    L3_4 = _UPVALUE0_
    L3_4 = L3_4.INVALID_ARGUMENT
    return L3_4
  end
  L3_4 = db
  L3_4 = L3_4.existsRow
  L3_4 = L3_4(A2_3, A0_1, A1_2)
  if L3_4 ~= nil then
    if L3_4 == false then
      return _UPVALUE0_.NOT_EXIST
    else
      return _UPVALUE0_.SUCCESS, L3_4
    end
  end
end
function getNextValidCookie(A0_5, A1_6, A2_7)
  local L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14, L10_15, L11_16, L12_17, L13_18, L14_19, L15_20
  if A1_6 == nil or A2_7 == nil or A0_5 == nil then
    L3_8 = _UPVALUE0_
    L3_8 = L3_8.INVALID_ARGUMENT
    return L3_8
  end
  L3_8 = nil
  L4_9 = "SELECT "
  L5_10 = A0_5
  L3_8 = L4_9 .. L5_10 .. L6_11 .. L7_12
  L4_9 = db
  L4_9 = L4_9.getTable
  L5_10 = A2_7
  L4_9 = L4_9(L5_10, L6_11, L7_12)
  L5_10 = 0
  for L9_14, L10_15 in L6_11(L7_12) do
    for L14_19, L15_20 in L11_16(L12_17) do
      if L5_10 == 1 then
        return _UPVALUE0_.SUCCESS, L15_20
      end
      if L15_20 == A1_6 then
        L5_10 = 1
      end
    end
  end
  return L6_11
end
function getFirstCookie(A0_21, A1_22)
  local L2_23, L3_24, L4_25, L5_26, L6_27, L7_28, L8_29, L9_30, L10_31, L11_32, L12_33, L13_34
  if A1_22 == nil or A0_21 == nil then
    L2_23 = _UPVALUE0_
    L2_23 = L2_23.INVALID_ARGUMENT
    return L2_23
  end
  L2_23 = nil
  L3_24 = "SELECT "
  L2_23 = L3_24 .. L4_25 .. L5_26 .. L6_27
  L3_24 = db
  L3_24 = L3_24.getTable
  L3_24 = L3_24(L4_25, L5_26, L6_27)
  for L7_28, L8_29 in L4_25(L5_26) do
    for L12_33, L13_34 in L9_30(L10_31) do
      return _UPVALUE0_.SUCCESS, L13_34
    end
  end
  return L4_25
end
