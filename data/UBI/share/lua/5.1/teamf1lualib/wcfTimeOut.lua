local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5
L0_0 = require
L1_1 = "teamf1lualib/db"
L0_0(L1_1)
L0_0 = "/tmp/system.db"
DB_FILE_NAME = L0_0
L0_0 = db
L0_0 = L0_0.connect
L1_1 = DB_FILE_NAME
L0_0(L1_1)
L0_0 = false
L1_1 = 1
L2_2 = 0
L3_3 = "-1"
L4_4 = "lua /pfrm2.0/share/lua/5.1/teamf1lualib/wcfTimeOut.lua"
L5_5 = db
L5_5 = L5_5.getAttribute
L5_5 = L5_5("siteCategory", "_ROWID_", 1, "categoryVerdict")
if tonumber(L5_5) == L1_1 then
  db.beginTransaction()
  L0_0 = db.setAttribute("siteCategory", "_ROWID_", 1, "categoryVerdict", L2_2)
  if L0_0 then
    db.commitTransaction(true)
  else
    db.rollback()
  end
end
