local L0_0, L1_1
L0_0 = {}
rip = L0_0
L0_0 = rip
function L1_1(A0_2, A1_3, A2_4)
  local L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11
  L3_5 = ACCESS_LEVEL
  if L3_5 ~= 0 then
    L3_5 = "ACCESS_DENIED"
    return L3_5, L4_6
  end
  L3_5 = A0_2["Rip.AuthenticationType"]
  if L3_5 == "1" then
    L3_5 = {
      L4_6,
      L5_7,
      L6_8,
      L7_9
    }
    L7_9 = "SecondKeyTo"
    for L7_9, L8_10 in L4_6(L5_7) do
      L9_11 = "Rip."
      L9_11 = L9_11 .. L8_10 .. "3"
      L9_11 = A0_2[L9_11]
      L9_11 = L9_11 .. "/" .. A0_2["Rip." .. L8_10 .. "1"] .. "/" .. A0_2["Rip." .. L8_10 .. "2"]
      L9_11 = L9_11 .. "@" .. A0_2["Rip." .. L8_10 .. "4"] .. ":" .. A0_2["Rip." .. L8_10 .. "5"] .. ":" .. A0_2["Rip." .. L8_10 .. "6"]
      A0_2["Rip." .. L8_10] = L9_11
    end
  end
  L3_5 = db
  L3_5 = L3_5.beginTransaction
  L3_5()
  L3_5 = false
  L7_9 = A1_3
  if L4_6 then
    L7_9 = A1_3
    L8_10 = "edit"
    L3_5 = L5_7
  else
    L7_9 = A1_3
    L8_10 = "add"
    L3_5 = L5_7
  end
  if L3_5 then
    L5_7(L6_8)
    return L5_7, L6_8
  else
    L5_7()
    return L5_7, L6_8
  end
end
L0_0.config = L1_1
L0_0 = rip
function L1_1(A0_12, A1_13, A2_14)
  if db.typeAndRangeValidate(A0_12) then
    if A2_14 == "add" then
      return db.insert("Rip", A0_12)
    elseif A2_14 == "edit" then
      return db.update("Rip", A0_12, A1_13)
    elseif A2_14 == "delete" then
      return db.delete("Rip", A0_12)
    end
  else
    return false
  end
end
L0_0.dbconfig = L1_1
