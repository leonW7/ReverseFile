local L0_0, L1_1
L0_0 = {}
pppoe = L0_0
L0_0 = pppoe
function L1_1(A0_2, A1_3, A2_4)
  if db.typeAndRangeValidate(A0_2) then
    if A2_4 == "add" then
      return db.insert("Pppoe", A0_2)
    elseif A2_4 == "edit" then
      return db.update("Pppoe", A0_2, A1_3)
    elseif A2_4 == "delete" then
      return nil
    end
  end
  return false
end
L0_0.config = L1_1
L0_0 = pppoe
function L1_1(A0_5, A1_6, A2_7)
  local L3_8, L4_9
  L3_8 = 2
  L4_9 = ACCESS_LEVEL
  if L4_9 ~= 0 then
    L4_9 = "ACCESS_DENIED"
    return L4_9, "10187"
  end
  if A2_7 == "add" then
    L4_9 = db
    L4_9 = L4_9.getAttribute
    L4_9 = L4_9("PppoeProfile", "LogicalIfName", A0_5["PppoeProfile.LogicalIfName"], "count(*)")
    L4_9 = L4_9 or "0"
    if A2_7 == "add" and L3_8 <= tonumber(L4_9) then
      return "ERROR", "10368"
    end
  end
  L4_9 = false
  if db.typeAndRangeValidate(A0_5) then
    if A2_7 == "add" then
      L4_9 = db.insert("PppoeProfile", A0_5)
    elseif A2_7 == "edit" then
      L4_9 = db.update("PppoeProfile", A0_5, A1_6)
    elseif A2_7 == "delete" then
      L4_9 = db.delete("PppoeProfile", A0_5)
    end
  end
  if L4_9 then
    return "OK", "12265"
  else
    return "ERROR", "11828"
  end
end
L0_0.profileConfig = L1_1
L0_0 = pppoe
function L1_1(A0_10, A1_11, A2_12)
  if db.typeAndRangeValidate(A0_10) then
    if A2_12 == "add" then
      return db.insert("DualPppoe", A0_10)
    elseif A2_12 == "edit" then
      return db.update("DualPppoe", A0_10, A1_11)
    elseif A2_12 == "delete" then
      return nil
    end
  end
  return false
end
L0_0.dualAccessConfig = L1_1
