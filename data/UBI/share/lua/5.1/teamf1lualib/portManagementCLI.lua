require("teamf1lualib/portMgmt")
function portManagementCfgSave(A0_0)
  DBTable = "PortMgmt"
  errorFlag, statusCode = portMgmt.portMgmtConfig(A0_0, "-1", "edit")
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  return errorFlag, statusMessage
end
function portManagementCfgInit(A0_1)
  configRow = db.getRow("PortMgmt", "PortName", A0_1[1])
  if configRow == nil then
    print("Row doesnot exist\n")
    return -1, {}
  end
  return configRow["PortMgmt._ROWID_"], configRow
end
function portManagementCfgInputVal(A0_2)
  local L1_3
  L1_3 = true
  return L1_3
end
function portManagementCfgGet(A0_4)
  local L1_5, L2_6, L3_7
  L1_5 = {}
  L2_6 = 0
  L3_7 = db
  L3_7 = L3_7.getTable
  L3_7 = L3_7("PortMgmt")
  printLabel("Port Management")
  print("Port Management Settings\n")
  for _FORV_7_, _FORV_8_ in pairs(L3_7) do
    L2_6 = L2_6 + 1
    if L3_7[L2_6]["PortMgmt.PortStatus"] == "0" then
      portStatus = "Disabled"
    elseif L3_7[L2_6]["PortMgmt.PortStatus"] == "1" then
      portStatus = "Enabled"
    end
    if L3_7[L2_6]["PortMgmt.AutoNegEnable"] == "1" then
      auto = "Enabled"
    elseif L3_7[L2_6]["PortMgmt.AutoNegEnable"] == "0" then
      auto = "Disabled"
    end
    if L3_7[L2_6]["PortMgmt.DuplexMode"] == "1" then
      mode = "Full"
    elseif L3_7[L2_6]["PortMgmt.DuplexMode"] == "0" then
      mode = "Half"
    end
    resTab.insertField(L1_5, "Port Name", L3_7[L2_6]["PortMgmt.PortName"] or "")
    resTab.insertField(L1_5, "Status", portStatus or "")
    resTab.insertField(L1_5, "Auto", auto or "")
    resTab.insertField(L1_5, "Duplex", mode or "")
    resTab.insertField(L1_5, "Speed", L3_7[L2_6]["PortMgmt.PortSpeed"] or "")
  end
  resTab.print(L1_5, 0)
end
