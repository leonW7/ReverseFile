local L0_0, L1_1
L0_0 = {}
tcpdump = L0_0
L0_0 = tcpdump
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
  if A2_4 == "add" then
    return nil
  elseif A2_4 == "edit" then
    L3_5 = tcpdump.update_config(A0_2, A1_3)
  elseif A2_4 == "delete" then
    return nil
  end
  if L3_5 then
    db.commitTransaction()
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12776"
  end
end
L0_0.config = L1_1
L0_0 = tcpdump
function L1_1(A0_6, A1_7)
  valid = db.update("tcpdump", A0_6, A1_7)
  return valid
end
L0_0.update_config = L1_1
