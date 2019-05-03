local L0_0, L1_1
L0_0 = {}
algs = L0_0
L0_0 = algs
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
  L3_5 = algs.config(A0_2, A1_3, A2_4)
  if L3_5 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12160"
  end
end
L0_0.alg_config = L1_1
L0_0 = algs
function L1_1(A0_6, A1_7, A2_8)
  if db.typeAndRangeValidate(A0_6) then
    if A2_8 == "add" then
      return db.insert(DBTable, A0_6)
    elseif A2_8 == "edit" then
      return db.update(DBTable, A0_6, A1_7)
    elseif A2_8 == "delete" then
      return db.delete(DBTable, A0_6)
    end
  end
  return false
end
L0_0.config = L1_1
