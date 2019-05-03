require("adpLuaLib")
USCORSTR = "__________________________________________________"
SPACESTR = "                              "
resTab = {}
function wepKeyLenGet(A0_0)
  local L1_1, L2_2
  L1_1 = A0_0[1]
  L2_2 = 10
  if L1_1 == "152" then
    L2_2 = 32
  elseif L1_1 == "128" then
    L2_2 = 26
  elseif L1_1 == "64" then
    L2_2 = 10
  end
  return L2_2
end
function wepKeyGenerate(A0_3)
  local L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10, L8_11, L9_12
  L3_6 = A0_3[1]
  L4_7 = A0_3[2]
  L5_8 = adpLuaLib
  L5_8 = L5_8.lua_adpMD5Init
  L5_8()
  L5_8 = adpLuaLib
  L5_8 = L5_8.lua_adpDigest
  L6_9 = L3_6
  L7_10 = string
  L7_10 = L7_10.len
  L8_11 = L3_6
  L7_10 = L7_10(L8_11)
  L8_11 = "md5"
  L7_10 = L5_8(L6_9, L7_10, L8_11)
  L8_11 = adpLuaLib
  L8_11 = L8_11.lua_adpBin2hex
  L9_12 = L6_9
  L9_12 = L8_11(L9_12, L7_10)
  if L9_12 == nil then
    return ""
  end
  return string.sub(L9_12, 1, L4_7)
end
function printCLIError(A0_13)
  print(A0_13)
end
function printLabel(A0_14)
  print("\n" .. A0_14)
  print(string.sub(USCORSTR, 0, string.len(A0_14)))
end
function resTab.insertField(A0_15, A1_16, A2_17)
  local L3_18, L4_19, L5_20, L6_21, L7_22, L8_23
  L3_18 = 0
  for L7_22, L8_23 in L4_19(L5_20) do
    if L8_23[1] == A1_16 then
      L3_18 = 1
      table.insert(L8_23, A2_17)
    end
  end
  if L3_18 == 0 then
    A0_15[L4_19] = L5_20
    L7_22 = A1_16
    L5_20(L6_21, L7_22)
    L7_22 = A2_17
    L5_20(L6_21, L7_22)
  end
end
function resTab.insertYNField(A0_24, A1_25, A2_26, A3_27, A4_28)
  if A2_26 == nil then
    return -1
  end
  if A3_27 == nil then
    A3_27 = "Y"
  end
  if A4_28 == nil then
    A4_28 = "N"
  end
  if A1_25 == true then
    resTab.insertField(A0_24, A2_26, A3_27)
  elseif A1_25 == false then
    resTab.insertField(A0_24, A2_26, A4_28)
  else
    return -1
  end
  return 0
end
function resTab.createRowLbl(...)
  local L1_30, L2_31, L3_32, L4_33, L5_34, L6_35
  L1_30 = {}
  L6_35 = ...
  ;({
    [4] = ...
  })[1] = L4_33
  ;({
    [4] = ...
  })[2] = L5_34
  ;({
    [4] = ...
  })[3] = L6_35
  for L5_34, L6_35 in L2_31(L3_32) do
    resTab.insertField(L1_30, "ROW_LABEL", L6_35)
  end
  return L1_30
end
function resTab.create()
  local L0_36, L1_37
  L0_36 = {}
  return L0_36
end
function printMR(A0_38, A1_39)
  local L2_40, L3_41, L4_42, L5_43, L6_44, L7_45, L8_46, L9_47, L10_48, L11_49, L12_50, L13_51, L14_52
  L2_40 = 1
  L3_41 = ""
  L4_42 = {}
  for L8_46, L9_47 in L5_43(L6_44) do
    L4_42[L8_46] = 0
    for L13_51, L14_52 in L10_48(L11_49) do
      if string.len(L14_52) > L4_42[L8_46] then
        L4_42[L8_46] = string.len(L14_52)
      end
    end
  end
  while A1_39 >= L2_40 do
    for L10_48, L11_49 in L7_45(L8_46) do
      L13_51 = string
      L13_51 = L13_51.len
      L14_52 = L11_49[L2_40]
      L13_51 = L13_51(L14_52)
      L13_51 = L11_49[L2_40]
      L14_52 = string
      L14_52 = L14_52.sub
      L14_52 = L14_52(SPACESTR, 0, L12_50)
      L13_51 = L5_43
      L14_52 = " "
      if L2_40 == 1 then
        L13_51 = L3_41
        L14_52 = " "
        L3_41 = L13_51 .. L14_52 .. string.sub(USCORSTR, 0, L4_42[L10_48])
      end
    end
    L7_45(L8_46)
    if L2_40 == 1 then
      L7_45(L8_46)
    end
    L2_40 = L2_40 + 1
  end
end
function printSRFmt(A0_53, A1_54)
  local L2_55
  L2_55 = ""
  for _FORV_6_, _FORV_7_ in pairs(A0_53) do
    L2_55 = _FORV_7_[1] .. ": " .. _FORV_7_[2]
    print(L2_55)
  end
end
function printSR(A0_56, A1_57)
  local L2_58
  L2_58 = ""
  for _FORV_6_, _FORV_7_ in pairs(A0_56) do
    L2_58 = _FORV_7_[1] .. ": " .. _FORV_7_[2]
    print(L2_58)
  end
end
function resTab.print(A0_59, A1_60)
  local L2_61
  if A0_59 == nil then
    L2_61 = -1
    return L2_61
  end
  L2_61 = A0_59[1]
  if L2_61 == nil then
    L2_61 = -1
    return L2_61
  end
  L2_61 = table
  L2_61 = L2_61.maxn
  L2_61 = L2_61(A0_59[1])
  print()
  if L2_61 == 2 then
    printSR(A0_59, A1_60)
  else
    printMR(A0_59, L2_61)
  end
  print()
end
