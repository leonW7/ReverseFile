require("teamf1lualib/fwRules")
attackChecks = {}
attackChecks6 = {}
function attackChecks.config(A0_0, A1_1, A2_2)
  local L3_3
  L3_3 = ACCESS_LEVEL
  if L3_3 ~= 0 then
    L3_3 = "ACCESS_DENIED"
    return L3_3, "10187"
  end
  L3_3 = db
  L3_3 = L3_3.beginTransaction
  L3_3()
  L3_3 = false
  DBTable = "AttackChecks"
  L3_3 = fwRules.config(A0_0, A1_1, A2_2)
  if L3_3 then
    DBTable = "IcsaSettings"
    L3_3 = fwRules.config(A0_0, A1_1, A2_2)
    if L3_3 then
      DBTable = "FwDosAttackSettings"
      L3_3 = fwRules.config(A0_0, A1_1, A2_2)
    end
  end
  if A0_0["IcsaSettings.BlockFragPkts"] == "1" then
    A0_0["AttackChecks6.BlockFragPkts"] = "1"
  elseif A0_0["IcsaSettings.BlockFragPkts"] == "0" then
    A0_0["AttackChecks6.BlockFragPkts"] = "0"
  end
  DBTable = "AttackChecks6"
  L3_3 = fwRules.config(A0_0, A1_1, A2_2)
  if L3_3 then
    db.commitTransaction()
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10262"
  end
end
function attackChecks.configGet()
  local L0_4, L1_5, L2_6, L3_7
  L0_4 = {}
  L1_5 = db
  L1_5 = L1_5.getRow
  L2_6 = "AttackChecks"
  L3_7 = "_ROWID_"
  L1_5 = L1_5(L2_6, L3_7, "1")
  L2_6 = util
  L2_6 = L2_6.tableAppend
  L3_7 = L0_4
  L2_6 = L2_6(L3_7, L1_5)
  L0_4 = L2_6
  L2_6 = db
  L2_6 = L2_6.getRow
  L3_7 = "IcsaSettings"
  L2_6 = L2_6(L3_7, "_ROWID_", "1")
  L3_7 = util
  L3_7 = L3_7.tableAppend
  L3_7 = L3_7(L0_4, L2_6)
  L0_4 = L3_7
  L3_7 = db
  L3_7 = L3_7.getRow
  L3_7 = L3_7("FwDosAttackSettings", "_ROWID_", "1")
  L0_4 = util.tableAppend(L0_4, L3_7)
  if L0_4 == nil then
    L0_4 = {}
  end
  return L0_4
end
