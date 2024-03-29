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
function getMaxId(A0_35, A1_36)
  local L2_37, L3_38, L4_39, L5_40, L6_41, L7_42, L8_43, L9_44, L10_45, L11_46, L12_47, L13_48
  if A0_35 == nil or A1_36 == nil then
    L2_37 = _UPVALUE0_
    L2_37 = L2_37.INVALID_ARGUMENT
    return L2_37
  end
  L2_37 = 0
  L3_38 = "SELECT "
  L3_38 = L3_38 .. L4_39 .. L5_40 .. L6_41
  query = L3_38
  L3_38 = db
  L3_38 = L3_38.getTable
  L3_38 = L3_38(L4_39, L5_40, L6_41)
  for L7_42, L8_43 in L4_39(L5_40) do
    for L12_47, L13_48 in L9_44(L10_45) do
      if L2_37 < tonumber(L13_48) then
        L2_37 = tonumber(L13_48)
      end
    end
  end
  if L2_37 == 0 then
    return L4_39
  else
    return L4_39, L5_40
  end
end
function openvpngetMaxId(A0_49, A1_50)
  local L2_51, L3_52, L4_53, L5_54, L6_55, L7_56, L8_57, L9_58, L10_59, L11_60, L12_61, L13_62
  L2_51 = 0
  L3_52 = "SELECT "
  L3_52 = L3_52 .. L4_53 .. L5_54 .. L6_55
  query = L3_52
  L3_52 = db
  L3_52 = L3_52.getTable
  L3_52 = L3_52(L4_53, L5_54, L6_55)
  if L3_52 ~= L4_53 then
    for L7_56, L8_57 in L4_53(L5_54) do
      for L12_61, L13_62 in L9_58(L10_59) do
        if L2_51 < tonumber(L13_62) then
          L2_51 = tonumber(L13_62)
        end
      end
    end
  end
  return L4_53, L5_54
end
