local L0_0, L1_1
L0_0 = {}
firmConf = L0_0
L0_0 = {}
firmStatusConf = L0_0
L0_0 = firmConf
function L1_1(A0_2, A1_3, A2_4)
  local L3_5, L4_6, L5_7
  L3_5 = false
  L4_6 = 1
  L5_7 = db
  L5_7 = L5_7.typeAndRangeValidate
  L5_7 = L5_7(A0_2)
  if L5_7 then
    if A2_4 == "add" then
      L5_7 = nil
      return L5_7
    elseif A2_4 == "edit" then
      L5_7 = {}
      L5_7["FirmStatus.StatusAvailable"] = L4_6
      L3_5 = db.update("FirmConf", A0_2, A1_3)
      L3_5 = L3_5 and db.update("FirmStatus", L5_7, A1_3)
      if L3_5 then
        db.commitTransaction()
        return "OK", "12265"
      else
        db.rollback()
        return "ERROR", "11481"
      end
    elseif A2_4 == "delete" then
      L5_7 = nil
      return L5_7
    end
  end
  L5_7 = false
  return L5_7
end
L0_0.config = L1_1
L0_0 = firmStatusConf
function L1_1(A0_8, A1_9, A2_10)
  local L3_11
  L3_11 = false
  if db.typeAndRangeValidate(A0_8) then
    if A2_10 == "add" then
      return nil
    elseif A2_10 == "edit" then
      L3_11 = db.update("(FirmStatus", A0_8, A1_9)
      if L3_11 then
        db.commitTransaction()
        return "OK", "12265"
      else
        db.rollback()
        return "ERROR", "12746"
      end
    elseif A2_10 == "delete" then
      return nil
    end
  end
  return false
end
L0_0.config = L1_1
