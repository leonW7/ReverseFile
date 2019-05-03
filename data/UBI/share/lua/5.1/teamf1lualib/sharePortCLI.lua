require("teamf1lualib/sharePort")
require("teamf1lualib/db")
function ShareportVlanCfgInit(A0_0)
  local L1_1, L2_2
  L1_1 = A0_0[1]
  L2_2 = {}
  if L1_1 == nil then
    printCLIError("Valid Row Id is required for configuration")
  else
    L2_2 = db.getRow("SharePortVlan", "_ROWID_", L1_1)
    if L2_2 == nil then
      printCLIError("Row does not exist")
      return -1
    end
  end
  return -1, L2_2
end
function ShareportVlanCfgSave(A0_3)
  DBTable = "SharePortVlan"
  if ACCESS_LEVEL ~= 0 then
    return "ACCESS_DENIED", "ADMIN_REQD"
  end
  db.beginTransaction()
  valid = db.update("SharePortVlan", A0_3, A0_3["SharePortVlan._ROWID_"])
  if valid then
    db.commitTransaction()
  else
    db.rollback()
    return "ERROR", "STATUS_NOT_OK"
  end
  if valid then
    db.save()
    return "OK", "STATUS_OK"
  end
end
function ShareportVlanCfgInputVal(A0_4)
  local L1_5
  L1_5 = A0_4["SharePortVlan.storageSharing"]
  if L1_5 == "1" then
    L1_5 = db
    L1_5 = L1_5.existsRow
    L1_5 = L1_5("USB", "StorageServer", "1")
    if not L1_5 then
      printCLIError("USB sharing not enabled")
      return false
    end
    L1_5 = sharePort.usbCheck("storage")
    if not L1_5 then
      printCLIError("No storage device connnected")
      return false
    end
  end
  L1_5 = A0_4["SharePortVlan.printerSharing"]
  if L1_5 == "1" then
    L1_5 = db
    L1_5 = L1_5.existsRow
    L1_5 = L1_5("USB", "PrintServer", "1")
    if L1_5 == false then
      printCLIError("USB printer sharing not enabled")
      return false
    end
    valid = sharePort.usbCheck("Printer")
    if not valid then
      printCLIError("No Printer device connnected")
      return false
    end
  end
end
function shareportStats()
  local L0_6, L1_7
  L0_6 = db
  L0_6 = L0_6.getTable
  L1_7 = "SharePortVlan"
  L0_6 = L0_6(L1_7)
  L1_7 = {}
  printLabel("SharePort on VLAN Configuration")
  for _FORV_5_, _FORV_6_ in pairs(L0_6) do
    resTab.insertField(L1_7, "ROW ID", _FORV_6_["SharePortVlan._ROWID_"])
    resTab.insertField(L1_7, "Vlan Name", _FORV_6_["SharePortVlan.vlanName"])
    resTab.insertField(L1_7, "Storage Sharing", _FORV_6_["SharePortVlan.storageSharing"])
    resTab.insertField(L1_7, "Printer Sharing", _FORV_6_["SharePortVlan.printerSharing"])
  end
  resTab.print(L1_7, 0)
end
