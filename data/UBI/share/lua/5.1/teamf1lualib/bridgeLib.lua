local L0_0, L1_1
L0_0 = {}
bridgePorts = L0_0
L0_0 = bridgePorts
function L1_1(A0_2, A1_3, A2_4)
  if bridgePorts.inputvalidate(A0_2, A2_4) then
    if A2_4 == "add" then
      return false
    elseif A2_4 == "edit" then
      return db.update("bridgePorts", A0_2, A1_3)
    elseif A2_4 == "delete" then
      return false
    end
  end
  return false
end
L0_0.config = L1_1
L0_0 = bridgePorts
function L1_1(A0_5, A1_6)
  do return db.typeAndRangeValidate(A0_5) end
  return false
end
L0_0.inputvalidate = L1_1
