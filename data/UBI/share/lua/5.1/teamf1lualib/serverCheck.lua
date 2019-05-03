require("teamf1lualib/db")
serverCheck = {}
function serverCheck.getCheckNow(A0_0)
  return db.getAttribute("serverCheck", "authType", A0_0, "checkNow")
end
function serverCheck.getrow(A0_1)
  return db.getRow("serverCheck", "authType", A0_1)
end
function serverCheck.config(A0_2, A1_3)
  local L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12
  L2_4 = false
  L3_5 = 1
  L4_6 = 1
  L5_7 = 1
  L6_8 = 0
  L7_9 = 0
  L8_10 = 0
  L9_11 = ACCESS_LEVEL
  if L9_11 ~= 0 then
    L9_11 = "ACCESS_DENIED"
    L10_12 = "10187"
    return L9_11, L10_12
  end
  if A1_3 ~= "edit" then
    L9_11 = nil
    return L9_11
  end
  L9_11 = {}
  L9_11["serverCheck.checkNow"] = L3_5
  L9_11["serverCheck.response"] = L4_6
  L9_11["serverCheck.updateFromWeb"] = L5_7
  L9_11["serverCheck.firstServerStatus"] = L6_8
  L9_11["serverCheck.secondServerStatus"] = L7_9
  L9_11["serverCheck.thirdServerStatus"] = L8_10
  L10_12 = db
  L10_12 = L10_12.beginTransaction
  L10_12()
  L10_12 = db
  L10_12 = L10_12.getAttribute
  L10_12 = L10_12("serverCheck", "authType", A0_2, "_ROWID_")
  L2_4 = db.update("serverCheck", L9_11, L10_12)
  if L2_4 then
    db.commitTransaction()
    return "OK", "Operation Succeeded"
  else
    db.rollback()
    return "ERROR", "Operation Failed"
  end
end
