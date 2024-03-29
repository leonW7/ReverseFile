require("timeLib")
time = {}
ntp = {}
function time.setTimeAndDate(A0_0)
  if ACCESS_LEVEL ~= 0 then
    return "ACCESS_DENIED", "10187"
  end
  if db.typeAndRangeValidate(A0_0) then
    return "OK", "12265"
  else
    return "ERROR", "12336"
  end
end
function time.ntp_config(A0_1, A1_2, A2_3)
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
  L3_4 = ntp.config(A0_1, A1_2, A2_3)
  if L3_4 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "11449"
  end
end
function ntp.config(A0_5, A1_6, A2_7)
  if ntp.inputvalidate(A0_5, A2_7) then
    if A2_7 == "add" then
      return db.insert("ntp", A0_5)
    elseif A2_7 == "edit" then
      return db.update("ntp", A0_5, A1_6)
    elseif A2_7 == "delete" then
      return db.delete("ntp", A0_5)
    end
  end
  return false
end
function ntp.inputvalidate(A0_8, A1_9)
  do return db.typeAndRangeValidate(A0_8) end
  return false
end
function time.manualTimeConfig(A0_10, A1_11, A2_12)
  local L3_13
  L3_13 = ACCESS_LEVEL
  if L3_13 ~= 0 then
    L3_13 = "ACCESS_DENIED"
    return L3_13, "10187"
  end
  L3_13 = db
  L3_13 = L3_13.beginTransaction
  L3_13()
  L3_13 = false
  if db.typeAndRangeValidate(A0_10) then
    if A2_12 == "add" then
      L3_13 = db.insert(DBTable, A0_10)
    elseif A2_12 == "edit" then
      L3_13 = db.update(DBTable, A0_10, A1_11)
    elseif A2_12 == "delete" then
      L3_13 = db.delete(DBTable, A0_10)
    end
  end
  if L3_13 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "11343"
  end
end
