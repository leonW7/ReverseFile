require("teamf1lualib/fwView")
function idsCfgInit(A0_0)
  local L1_1
  L1_1 = {}
  L1_1 = db.getRow("IdsConfiguration", "_ROWID_", "1")
  return 1, L1_1
end
function idsCfgSave(A0_2)
  local L1_3, L2_4, L3_5, L4_6, L5_7
  L1_3 = "ERROR"
  errorFlag = L1_3
  L1_3 = ""
  statusCode = L1_3
  L1_3 = ""
  statusMessage = L1_3
  L1_3 = 5
  L2_4 = 0
  L3_5 = ""
  L4_6 = "0"
  L5_7 = "Enabling IDS reboots the device.\n"
  DBTable = "IdsConfiguration"
  if A0_2["IdsConfiguration.IdsStatus"] == "1" and db.getAttribute("IdsConfiguration", "IdsConfiguration._ROWID_", "1", "IdsStatus") == "0" then
    printCLIError(L5_7)
    while L3_5 ~= "Y" and L3_5 ~= "N" and L1_3 > L2_4 do
      printCLIError("Are you sure you want to proceed [Y/N]?")
      L3_5 = io.stdin:read("*l")
      L2_4 = L2_4 + 1
    end
    if L3_5 == "N" or L2_4 == L1_3 then
      errorFlag = "ERROR"
      statusMessage = "Action Cancelled"
      return errorFlag, statusMessage
    elseif L3_5 == "Y" then
      L4_6 = "1"
    end
  end
  errorFlag, statusCode = ids.config(A0_2, "1", "edit")
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  if L4_6 == "1" then
    utilCLIReboot()
  end
  return errorFlag, statusMessage
end
function idsCfgVal(A0_8)
  local L1_9
  L1_9 = true
  return L1_9
end
function idsInfoGet()
  printLabel("IDS")
  row = db.getRow("IdsConfiguration", "IdsConfiguration._ROWID_", 1)
  print("IDS Settings")
  if row["IdsConfiguration.IdsStatus"] == "0" then
    print(" Intrusion Detection  : Disabled")
  elseif row["IdsConfiguration.IdsStatus"] == "1" then
    print(" Intrusion Detection  : Enabled")
    if row["IdsConfiguration.IntrusionLogStatus"] == "0" then
      print(" Intrusion Log        : Disabled")
    elseif row["IdsConfiguration.IntrusionLogStatus"] == "1" then
      print(" Intrusion Log        : Enabled")
    end
  end
end
