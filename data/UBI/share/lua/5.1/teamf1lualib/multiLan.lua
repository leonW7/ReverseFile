local L0_0, L1_1
L0_0 = {}
multiLan = L0_0
L0_0 = multiLan
function L1_1(A0_2, A1_3, A2_4)
  local L3_5
  L3_5 = ACCESS_LEVEL
  if L3_5 ~= 0 then
    L3_5 = "ACCESS_DENIED"
    return L3_5, "10187"
  end
  L3_5 = db
  L3_5 = L3_5.beginTransaction
  L3_5()
  L3_5 = false
  if db.typeAndRangeValidate(A0_2) then
    if A2_4 == "add" then
      L3_5 = db.insert(DBTable, A0_2)
    elseif A2_4 == "edit" then
      L3_5 = db.update(DBTable, A0_2, A1_3)
    elseif A2_4 == "delete" then
      L3_5 = db.delete(DBTable, A0_2)
    end
  end
  if L3_5 then
    db.commitTransaction()
    return "OK", "12265"
  else
    db.rollback()
    if A2_4 == "delete" then
      return "ERROR", "12772"
    else
      return "ERROR", "12773"
    end
  end
end
L0_0.Config = L1_1
L0_0 = multiLan
function L1_1(A0_6, A1_7, A2_8)
  local L3_9
  L3_9 = ACCESS_LEVEL
  if L3_9 ~= 0 then
    L3_9 = "ACCESS_DENIED"
    return L3_9, "10187"
  end
  L3_9 = db
  L3_9 = L3_9.beginTransaction
  L3_9()
  L3_9 = false
  if db.typeAndRangeValidate(A0_6) then
    if A2_8 == "add" then
      L3_9 = db.insert(DBTable, A0_6)
    elseif A2_8 == "edit" then
      L3_9 = db.update(DBTable, A0_6, A1_7)
    elseif A2_8 == "delete" then
      L3_9 = db.delete(DBTable, A0_6)
    end
  end
  if L3_9 then
    db.commitTransaction()
    return "OK", "12265"
  else
    db.rollback()
    if A2_8 == "delete" then
      return "ERROR", "12774"
    else
      return "ERROR", "12775"
    end
  end
end
L0_0.ipv6Config = L1_1
