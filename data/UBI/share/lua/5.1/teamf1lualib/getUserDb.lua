local L0_0
L0_0 = {}
getUserDb = L0_0
L0_0 = getUserDb
function L0_0.upload(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13
  L1_2 = ACCESS_LEVEL
  if L1_2 ~= 0 then
    L1_2 = "ACCESS_DENIED"
    L2_3 = "10187"
    return L1_2, L2_3
  end
  L1_2 = db
  L1_2 = L1_2.beginTransaction
  L1_2()
  L1_2 = false
  L2_3 = "/var/"
  L3_4 = "sample.csv"
  L4_5 = {}
  L5_6 = A0_1["GetUsersDb.GetUsersDbFile"]
  L5_6 = L5_6.filesize
  L6_7 = A0_1["GetUsersDb.GetUsersDbFile"]
  L6_7 = L6_7.filename
  L7_8 = L6_7
  L8_9 = A0_1["GetUsersDb.GetUsersDbFile"]
  L8_9 = L8_9.file
  L9_10 = L2_3
  L10_11 = L3_4
  L9_10 = L9_10 .. L10_11
  L4_5["GETUSERSDb.GetUsersDbFile"] = L9_10
  L9_10 = cgilua
  L9_10 = L9_10.cookies
  L9_10 = L9_10.get
  L10_11 = "TeamF1Login"
  L9_10 = L9_10(L10_11)
  L10_11 = "mv"
  L11_12 = " "
  L12_13 = "/tmp/"
  L10_11 = L10_11 .. L11_12 .. L12_13 .. L9_10 .. " " .. L2_3 .. L3_4
  L11_12 = os
  L11_12 = L11_12.execute
  L12_13 = L10_11
  L11_12 = L11_12(L12_13)
  L12_13 = "/usr/bin/dos2unix"
  L12_13 = L12_13 .. " " .. L2_3 .. L3_4
  if #db.getTable("GETUSERSDb") == 0 then
    L11_12 = db.insert("GETUSERSDb", L4_5)
  else
    L11_12 = db.setAttribute("GETUSERSDb", "_ROWID_", "1", "GetUsersDbFile", L2_3 .. L3_4)
  end
  if L11_12 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12786"
  end
end
