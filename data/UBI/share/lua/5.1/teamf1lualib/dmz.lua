local L0_0
L0_0 = {}
dmz = L0_0
L0_0 = dmz
function L0_0.config(A0_1, A1_2, A2_3)
  local L3_4
  L3_4 = ACCESS_LEVEL
  if L3_4 ~= 0 then
    L3_4 = "ACCESS_DENIED"
    return L3_4, "10187"
  end
  L3_4 = db
  L3_4 = L3_4.beginTransaction
  L3_4()
  L3_4 = false
  if db.typeAndRangeValidate(A0_1) then
    if A2_3 == "add" then
      L3_4 = db.insert(DBTable, A0_1)
    elseif A2_3 == "edit" then
      L3_4 = db.update(DBTable, A0_1, A1_2)
    elseif A2_3 == "delete" then
      L3_4 = false
    end
  end
  if L3_4 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10613"
  end
end
