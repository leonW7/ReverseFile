local L0_0
L0_0 = {}
ifStatic = L0_0
L0_0 = ifStatic
function L0_0.config(A0_1, A1_2, A2_3)
  if db.typeAndRangeValidate(A0_1) then
    if A2_3 == "add" then
      return db.insert("ifStatic", A0_1)
    elseif A2_3 == "edit" then
      return db.update("ifStatic", A0_1, A1_2)
    elseif A2_3 == "delete" then
      return nil
    end
  end
  return false
end
