local L0_0
L0_0 = db
L0_0 = L0_0.save
olddbsave = L0_0
L0_0 = db
function L0_0.save()
  local L0_1
  L0_1 = {}
  if db.getAttribute("FactoryStatus", "_ROWID_", "1", "factStatus") == "0" then
    L0_1["FactoryStatus.factStatus"] = "1"
    db.update("FactoryStatus", L0_1, "1")
  end
  olddbsave()
end
