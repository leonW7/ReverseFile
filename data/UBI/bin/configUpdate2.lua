local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12
L0_0 = require
L1_1 = "teamf1lualib/util"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/db"
L0_0(L1_1)
function L0_0(A0_13, A1_14)
  local L2_15, L3_16, L4_17, L5_18, L6_19, L7_20, L8_21, L9_22, L10_23, L11_24, L12_25, L13_26, L14_27, L15_28
  L2_15 = assert
  L3_16 = type
  L4_17 = A0_13
  L3_16 = L3_16(L4_17)
  L3_16 = L3_16 == "table"
  L2_15(L3_16)
  L2_15 = assert
  L3_16 = type
  L4_17 = A1_14
  L3_16 = L3_16(L4_17)
  L3_16 = L3_16 == "function"
  L2_15(L3_16)
  L2_15, L3_16, L4_17, L5_18 = nil, nil, nil, nil
  L6_19 = {}
  for L10_23, L11_24 in L7_20(L8_21) do
    L6_19[L10_23] = L12_25
    for L15_28, _FORV_16_ in L12_25(L13_26) do
      if A1_14(L15_28) then
        L6_19[L10_23][L15_28] = _FORV_16_
      end
    end
  end
  return L6_19
end
filterTable = L0_0
function L0_0(A0_29, A1_30)
  local L2_31, L3_32, L4_33, L5_34, L6_35, L7_36, L8_37, L9_38, L10_39
  if A0_29 == nil or A1_30 == nil then
    return A0_29
  end
  L2_31, L3_32, L4_33, L5_34 = nil, nil, nil, nil
  for L9_38, L10_39 in L6_35(L7_36) do
    for _FORV_14_, _FORV_15_ in pairs(L10_39) do
      if not A0_29[L9_38] then
        A0_29[L9_38] = {}
      end
      if _FORV_15_ == "" then
        A0_29[L9_38][_FORV_14_] = nil
      else
        A0_29[L9_38][_FORV_14_] = _FORV_15_
      end
    end
  end
  return A0_29
end
tableAppend = L0_0
function L0_0(A0_40, A1_41, A2_42)
  local L3_43
  L3_43 = {}
  L3_43 = filterTable(A0_40, function(A0_44)
    local L1_45, L2_46, L3_47, L4_48, L5_49, L6_50, L7_51, L8_52, L9_53
    for L8_52, L9_53 in L5_49(L6_50) do
      for _FORV_13_, _FORV_14_ in pairs(L9_53) do
        if _FORV_13_ == A0_44 then
          return true
        end
      end
    end
    return L5_49
  end)
  return L3_43
end
tableSubtract = L0_0
L0_0 = {}
L1_1 = {}
L2_2 = db
L2_2 = L2_2.connect
L3_3 = arg
L3_3 = L3_3[1]
L2_2(L3_3)
L2_2 = db
L2_2 = L2_2.getAttribute
L3_3 = "environment"
L2_2 = L2_2(L3_3, L4_4, L5_5, L6_6)
L3_3 = db
L3_3 = L3_3.getTable
L3_3 = L3_3(L4_4, L5_5)
L4_4(L5_5)
for L7_7, L8_8 in L4_4(L5_5) do
  L9_9 = L8_8.TableName
  L10_10 = util
  L10_10 = L10_10.getLuaVariable
  L11_11 = L9_9
  L10_10 = L10_10(L11_11)
  L0_0[L9_9] = L10_10
  L10_10 = _G
  L10_10[L9_9] = nil
end
L4_4(L5_5)
for L7_7, L8_8 in L4_4(L5_5) do
  L9_9 = L8_8.TableName
  L10_10 = util
  L10_10 = L10_10.getLuaVariable
  L11_11 = L9_9
  L10_10 = L10_10(L11_11)
  L11_11 = L0_0[L9_9]
  if L10_10 == nil then
    L12_12("configUpdate : no LUA variable : " .. L9_9)
  else
    if L11_11 and L9_9 ~= "systemConfig" then
      for _FORV_16_, _FORV_17_ in pairs(L12_12) do
        for _FORV_21_, _FORV_22_ in pairs(L10_10) do
          if not L10_10[_FORV_21_][_FORV_17_] then
            L10_10[_FORV_21_][_FORV_17_] = ""
          end
        end
      end
      for _FORV_16_, _FORV_17_ in pairs(L12_12) do
        for _FORV_21_, _FORV_22_ in pairs(L11_11) do
          if not L11_11[_FORV_21_][_FORV_17_] then
            L11_11[_FORV_21_][_FORV_17_] = ""
          end
        end
      end
      if #L10_10 ~= 0 then
        L11_11 = tableSubtract(L11_11, L10_10)
      end
      L10_10 = tableAppend(L10_10, L11_11)
    end
    for _FORV_15_, _FORV_16_ in L12_12(L10_10) do
      for _FORV_20_, _FORV_21_ in pairs(L10_10[1]) do
        if not L10_10[_FORV_15_][_FORV_20_] then
          L10_10[_FORV_15_][_FORV_20_] = L10_10[1][_FORV_20_]
        end
      end
      if L11_11 and not L11_11[_FORV_15_] then
        L10_10[_FORV_15_] = nil
      end
    end
    if L12_12 >= 0 then
      L1_1[L9_9] = L10_10
    end
  end
end
for L8_8, L9_9 in L5_5(L6_6) do
  L10_10 = L9_9.TableName
  L11_11 = db
  L11_11 = L11_11.saveTable
  L11_11(L12_12, L10_10, L1_1[L10_10], false, 1, 1)
end
L5_5()
