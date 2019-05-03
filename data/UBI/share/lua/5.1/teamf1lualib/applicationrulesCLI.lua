local L0_0
L0_0 = require
L0_0("teamf1lualib/fwView")
L0_0 = 1
function portTriggeringCfgInit(A0_1)
  local L1_2
  L1_2 = A0_1[1]
  if L1_2 == nil then
    configRow = {}
    configRow = db.getDefaults(true, "PortTriggering")
    configRow["PortTriggering._ROWID_"] = "-1"
    configRow["PortTriggering.OID"] = "10"
  else
    configRow = db.getRow("PortTriggering", "_ROWID_", L1_2)
    if configRow == nil then
      print("Row ID does not exit")
      return -1, {}
    end
  end
  return configRow["PortTriggering._ROWID_"], configRow
end
function portTriggeringCfgSave(A0_3)
  local L1_4, L2_5, L3_6
  L1_4 = "Error"
  L2_5 = ""
  L3_6 = ""
  DBTable = "PortTriggering"
  if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-1000N" or UNIT_NAME == "DSR-1000" then
    _UPVALUE0_ = 600
  elseif UNIT_NAME == "DSR-500AC" or UNIT_NAME == "DSR-500N" or UNIT_NAME == "DSR-500" then
    _UPVALUE0_ = 400
  elseif UNIT_NAME == "DSR-250N" or UNIT_NAME == "DSR-250" then
    _UPVALUE0_ = 200
  else
    _UPVALUE0_ = 100
  end
  if A0_3["PortTriggering._ROWID_"] == "-1" or A0_3["PortTriggering._ROWID_"] == nil then
    if db.getRowsWhere("PortTriggering", " ruleName is NOT NULL") ~= nil and #db.getRowsWhere("PortTriggering", " ruleName is NOT NULL") >= _UPVALUE0_ then
      L3_6 = "Application rules maximum limit is reached."
      return L1_4, L3_6
    end
    L1_4, L2_5 = fwView.portTrgConfig(A0_3, RowId, "add")
  else
    L1_4, L2_5 = fwView.portTrgConfig(A0_3, A0_3["PortTriggering._ROWID_"], "edit")
  end
  if L1_4 == "OK" then
    db.save()
  end
  L3_6 = db.getAttribute("stringsMap", "stringId", L2_5, LANGUAGE)
  return L1_4, L3_6
end
function portTriggeringCfgDel(A0_7)
  local L1_8, L2_9, L3_10, L4_11, L5_12
  L1_8 = "ERROR"
  L2_9 = ""
  L3_10 = ""
  L4_11 = "PortTriggering"
  DBTable = L4_11
  L4_11 = db
  L4_11 = L4_11.getRow
  L5_12 = "PortTriggering"
  L4_11 = L4_11(L5_12, "_ROWID_", A0_7)
  if L4_11 == nil then
    L1_8 = "ERROR"
    L3_10 = "Row doesnt exist"
    L5_12 = printCLIError
    L5_12("Row doesnt exist")
    L5_12 = L1_8
    return L5_12, L3_10
  end
  L5_12 = {}
  L5_12.rowid = L4_11["PortTriggering._ROWID_"]
  L1_8, L2_9 = fwView.deleteRules(L5_12)
  if L1_8 == "OK" then
    db.save()
  end
  L3_10 = db.getAttribute("stringsMap", "stringId", L2_9, LANGUAGE)
  return L1_8, L3_10
end
function portTriggeringCfgInputVal(A0_13)
  if A0_13["PortTriggering.RuleName"] == "" then
    printCLIError("Enter valid rule name\n")
    return false
  end
  if A0_13["PortTriggering.RuleStatus"] == "" then
    printCLIError("Enter valid rule status\n")
    return false
  end
  if A0_13["PortTriggering.Protocol"] == "" then
    printCLIError("Enter valid protocol name\n")
    return false
  end
  if A0_13["PortTriggering.OutgoingPortStart"] == "" then
    printCLIError("Enter valid starting port number of outgoing traffic\n")
    return false
  end
  if A0_13["PortTriggering.OutgoingPortEnd"] == "" then
    printCLIError("Enter valid ending port number of outgoing traffic\n")
    return false
  end
  if A0_13["PortTriggering.IncomingPortStart"] == "" then
    printCLIError("Enter valid starting port number of incoming traffic\n")
    return false
  end
  if A0_13["PortTriggering.IncomingPortEnd"] == "" then
    printCLIError("Enter valid ending port number of incoming traffic\n")
    return false
  end
  if A0_13["PortTriggering.Interface"] == "" then
    printCLIError("Enter valid Interface Name\n")
    return false
  end
  if A0_13["PortTriggering.IncomingPortEnd"] ~= nil and A0_13["PortTriggering.IncomingPortStart"] ~= nil then
    if tonumber(A0_13["PortTriggering.IncomingPortStart"]) < _UPVALUE0_ or tonumber(A0_13["PortTriggering.IncomingPortStart"]) > _UPVALUE1_ then
      printCLIError("Invalid incoming start Port. Please enter a value between 1 - 65535")
      return false
    end
    if tonumber(A0_13["PortTriggering.IncomingPortEnd"]) < _UPVALUE0_ or tonumber(A0_13["PortTriggering.IncomingPortEnd"]) > _UPVALUE1_ then
      printCLIError("Invalid incoming end Port. Please enter a value between 1 - 65535")
      return false
    end
    if tonumber(A0_13["PortTriggering.IncomingPortEnd"]) < tonumber(A0_13["PortTriggering.IncomingPortStart"]) then
      printCLIError("Incoming end port  cannot be less than incoming start port")
      return false
    end
  end
  if A0_13["PortTriggering.OutgoingPortEnd"] ~= nil and A0_13["PortTriggering.OutgoingPortStart"] ~= nil then
    if tonumber(A0_13["PortTriggering.OutgoingPortStart"]) < _UPVALUE0_ or tonumber(A0_13["PortTriggering.OutgoingPortStart"]) > _UPVALUE1_ then
      printCLIError("Invalid outgoing start Port. Please enter a value between 1 - 65535")
      return false
    end
    if tonumber(A0_13["PortTriggering.OutgoingPortEnd"]) < _UPVALUE0_ or tonumber(A0_13["PortTriggering.OutgoingPortEnd"]) > _UPVALUE1_ then
      printCLIError("Invalid outgoing end Port. Please enter a value between 1 - 65535")
      return false
    end
    if tonumber(A0_13["PortTriggering.OutgoingPortEnd"]) < tonumber(A0_13["PortTriggering.OutgoingPortStart"]) then
      printCLIError("Outgoing end port  cannot be less than incoming start port")
      return false
    end
  end
  return true
end
function portTriggeringCfgGet()
  local L0_14, L1_15
  L0_14 = db
  L0_14 = L0_14.getTable
  L1_15 = "PortTriggering"
  L0_14 = L0_14(L1_15)
  L1_15 = {}
  printLabel("Port Triggering")
  printLabel("List of Available Port Triggering Rules")
  for _FORV_7_, _FORV_8_ in pairs(L0_14) do
    if "0" + 1 == nil then
      resTab.insertField(L1_15, "Port Triggering", "Disabled")
    else
      resTab.insertField(L1_15, "ROW ID", L0_14["0" + 1]["PortTriggering._ROWID_"] or "")
      resTab.insertField(L1_15, "Name", L0_14["0" + 1]["PortTriggering.RuleName"] or "")
      if L0_14["0" + 1]["PortTriggering.RuleStatus"] == "0" then
        resTab.insertField(L1_15, "Enable", "No")
      else
        resTab.insertField(L1_15, "Enable", "Yes")
      end
      if L0_14["0" + 1]["PortTriggering.Protocol"] == "6" then
        resTab.insertField(L1_15, "Type", "TCP")
      elseif L0_14["0" + 1]["PortTriggering.Protocol"] == "17" then
        resTab.insertField(L1_15, "Type", "UDP")
      end
      if L0_14["0" + 1]["PortTriggering.Interface"] == "SECURE" then
        resTab.insertField(L1_15, "Interface", "LAN")
      else
        resTab.insertField(L1_15, "Interface", "DMZ")
      end
      resTab.insertField(L1_15, "Outgoing Start Port", L0_14["0" + 1]["PortTriggering.OutgoingPortStart"] or "")
      resTab.insertField(L1_15, "Outgoing End Port", L0_14["0" + 1]["PortTriggering.OutgoingPortEnd"] or "")
      resTab.insertField(L1_15, "Incoming Start Port", L0_14["0" + 1]["PortTriggering.IncomingPortStart"] or "")
      resTab.insertField(L1_15, "Incoming End Port", L0_14["0" + 1]["PortTriggering.IncomingPortEnd"] or "")
    end
  end
  resTab.print(L1_15, 0)
end
function portTriggeringStatusGet()
  local L0_16, L1_17, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26, L11_27
  L0_16 = db
  L0_16 = L0_16.getAttribute
  L1_17 = "environment"
  L2_18 = "name"
  L3_19 = "PORTTRIG_STATUS_PROG"
  L4_20 = "value"
  L0_16 = L0_16(L1_17, L2_18, L3_19, L4_20)
  if L0_16 ~= nil then
    L1_17 = os
    L1_17 = L1_17.execute
    L2_18 = L0_16
    L3_19 = " "
    L4_20 = DB_FILE_NAME
    L2_18 = L2_18 .. L3_19 .. L4_20
    L1_17(L2_18)
  end
  L1_17 = {}
  L2_18 = 0
  L3_19 = db
  L3_19 = L3_19.getAttribute
  L4_20 = "environment"
  L3_19 = L3_19(L4_20, L5_21, L6_22, L7_23)
  L4_20 = os
  L4_20 = L4_20.execute
  L4_20(L5_21)
  L4_20 = db
  L4_20 = L4_20.getTable
  L4_20 = L4_20(L5_21)
  L5_21(L6_22)
  if L5_21 ~= 0 then
    for L8_24, L9_25 in L5_21(L6_22) do
      L2_18 = L2_18 + 1
      L10_26 = L4_20[L2_18]
      L11_27 = resTab
      L11_27 = L11_27.insertField
      L11_27(L1_17, "LAN/DMZ IP Address", L10_26["PortTriggerStatus.LanIpAddr"])
      L11_27 = L10_26["PortTriggerStatus.OpenPortRangeStart"]
      L11_27 = L11_27 .. "-" .. L10_26["PortTriggerStatus.OpenPortRangeEnd"]
      resTab.insertField(L1_17, "Open Ports", L11_27)
      resTab.insertField(L1_17, "Time Remaining(Sec)", L10_26["PortTriggerStatus.TimeRemaining"])
    end
  end
  L5_21(L6_22, L7_23)
end
