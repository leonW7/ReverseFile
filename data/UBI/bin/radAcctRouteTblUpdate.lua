local L0_0, L1_1, L2_2, L3_3
L0_0 = require
L1_1 = "teamf1lualib/db"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/accounting_core"
L0_0(L1_1)
L0_0 = require
L1_1 = "com.teamf1.core.accounting"
L0_0 = L0_0(L1_1)
L1_1 = db
L1_1 = L1_1.connect
L2_2 = arg
L2_2 = L2_2[1]
L1_1(L2_2)
L1_1 = db
L1_1 = L1_1.getTable
L2_2 = "radiusClient"
L3_3 = false
L1_1 = L1_1(L2_2, L3_3)
L2_2, L3_3 = nil, nil
for _FORV_7_, _FORV_8_ in pairs(L1_1) do
  L2_2 = _FORV_8_.acctserver
  L3_3 = _FORV_8_._ROWID_
  L0_0.accountingVlanServerRouteTblUpdate(L2_2, L3_3)
end
db.close()
