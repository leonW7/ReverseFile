local L0_0
L0_0 = require
L0_0("teamf1lualib/fwView")
L0_0 = "Schedules"
DBTable = L0_0
L0_0 = nil
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
  L0_0 = 10
else
  L0_0 = 5
end
function schedulesCfgInit(A0_1)
  if A0_1[1] == nil then
    configRow = db.getDefaults(true, "Schedules")
    configRow["Schedules._ROWID_"] = "-1"
  else
    configRow = db.getRow("Schedules", "Schedules._ROWID_", A0_1[1])
  end
  if configRow == nil then
    print("Row does not exist\n")
    return -1, {}
  else
    configRow = fwView.scheduleConfigGet(configRow)
    rowid = configRow["Schedules._ROWID_"]
  end
  return rowid, configRow
end
function schedulesCfgSave(A0_2)
  RowId = A0_2["Schedules._ROWID_"]
  DBTable = "Schedules"
  if db.getTable(DBTable) ~= nil and #db.getTable(DBTable) >= _UPVALUE0_ then
    statusMessage = "Maximum limit for schedules is reached."
    return "ERROR", statusMessage
  end
  if RowId == "-1" then
    errorFlag, statusCode = fwView.schedulesConfig(A0_2, RowId, "add")
  else
    errorFlag, statusCode = fwView.schedulesConfig(A0_2, RowId, "edit")
  end
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  return errorFlag, statusMessage
end
function schedulesCfgDel(A0_3)
  local L1_4, L2_5, L3_6, L4_7, L5_8
  L2_5 = ""
  L3_6 = nil
  L4_7 = {}
  L5_8 = "Schedules"
  DBTable = L5_8
  L5_8 = {}
  L5_8 = db.getRow("Schedules", "_ROWID_", A0_3[1])
  if L5_8 == nil or L5_8 == "" then
    printCLIError("Row Doesn't exist")
    return nil
  else
    valid = firewallRowWhereExists("FirewallRules", "ScheduleName = '" .. L5_8["Schedules.ScheduleName"] .. "'")
    if valid then
      print("Schedule In Use By Ipv4 Firewall Rules.")
      return false
    end
    valid = firewallRowWhereExists("FirewallRules6", "ScheduleName = '" .. L5_8["Schedules.ScheduleName"] .. "'")
    if valid then
      print("Schedule In Use By Ipv6 Firewall Rules.")
      return false
    end
    L4_7["1"] = A0_3[1]
    L1_4, L2_5 = fwView.deleteSchedules(L4_7)
    if L1_4 == "OK" then
      print("Row Deleted")
      db.save()
    end
    L3_6 = db.getAttribute("stringsMap", "stringId", L2_5, LANGUAGE)
    return L1_4, L3_6
  end
end
function schedulesCfgInputVal(A0_9)
  local L1_10
  L1_10 = A0_9["Schedules.ScheduleName"]
  if L1_10 == "" then
    L1_10 = printCLIError
    L1_10("Enter unique schedule name\n")
    L1_10 = false
    return L1_10
  end
  L1_10 = string
  L1_10 = L1_10.find
  L1_10 = L1_10(A0_9["Schedules.ScheduleName"], "%s")
  if L1_10 ~= nil then
    L1_10 = A0_9["Schedules.ScheduleName"]
    A0_9["Schedules.ScheduleName"] = "\"" .. A0_9["Schedules.ScheduleName"] .. "\""
    if string.find(L1_10, "%\"") then
      A0_9["Schedules.ScheduleName"] = L1_10
    end
  end
  L1_10 = db
  L1_10 = L1_10.existsRowWhere
  L1_10 = L1_10("Schedules", "_ROWID_ = '" .. A0_9["Schedules._ROWID_"] .. "'")
  if L1_10 and db.getRow("Schedules", "_ROWID_", A0_9["Schedules._ROWID_"])["Schedules.ScheduleName"] ~= A0_9["Schedules.ScheduleName"] then
    printCLIError("Schedule name cannot be edited\n")
    return false
  end
  if A0_9["Schedules.allDays"] == "1" and (A0_9["Schedules.monday"] == "1" or A0_9["Schedules.tuesday"] == "1" or A0_9["Schedules.wednesday"] == "1" or A0_9["Schedules.thursday"] == "1" or A0_9["Schedules.friday"] == "1" or A0_9["Schedules.saturday"] == "1" or A0_9["Schedules.sunday"] == "1") then
    printCLIError("days all: Disable this field when specific" .. " day is selected\n")
    return false
  end
  if A0_9["Schedules.allDays"] == "0" and A0_9["Schedules.monday"] == "0" and A0_9["Schedules.tuesday"] == "0" and A0_9["Schedules.wednesday"] == "0" and A0_9["Schedules.thursday"] == "0" and A0_9["Schedules.friday"] == "0" and A0_9["Schedules.saturday"] == "0" and A0_9["Schedules.sunday"] == "0" then
    printCLIError("Select valid day of the week\n")
    return false
  end
  if A0_9["Schedules.AllDay"] == "0" then
    if A0_9["Schedules.startTimeMin"] == nil or A0_9["Schedules.startTimeHour"] == nil or A0_9["Schedules.startTimeMeridian"] == nil then
      printCLIError("Enter valid start time (hours, mins, AM/PM)\n")
      return false
    end
    if A0_9["Schedules.endTimeMin"] == nil or A0_9["Schedules.endTimeHour"] == nil or A0_9["Schedules.endTimeMeridian"] == nil then
      printCLIError("Enter valid end time (hours, mins, AM/PM)\n")
      return false
    end
  end
  if A0_9["Schedules.StartTimeHours"] == "" and A0_9["Schedules.StartTimeMins"] == "" then
    printCLIError("Enter valid start time \n")
    return false
  end
  if A0_9["Schedules.EndTimeHours"] == "" and A0_9["Schedules.EndTimeMins"] == "" then
    printCLIError("Enter valid end time \n")
    return false
  end
  return true
end
function schedulesSetupGet(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20, L10_21, L11_22, L12_23
  L1_12 = {}
  L2_13 = printLabel
  L3_14 = "Schedules"
  L2_13(L3_14)
  L2_13 = print
  L3_14 = "List of Available Schedules\n"
  L2_13(L3_14)
  L2_13 = 0
  L3_14 = db
  L3_14 = L3_14.getTable
  L3_14 = L3_14(L4_15)
  for L7_18, L8_19 in L4_15(L5_16) do
    L2_13 = L2_13 + 1
    L9_20 = fwView
    L9_20 = L9_20.scheduleConfigGet
    L10_21 = L3_14[L2_13]
    L9_20 = L9_20(L10_21)
    L10_21 = ""
    L11_22 = L9_20["Schedules.allDays"]
    if L11_22 == "1" then
      L10_21 = "All Days"
    else
      L11_22 = L9_20["Schedules.sunday"]
      if L11_22 == "1" then
        L11_22 = L10_21
        L12_23 = "Sunday"
        L10_21 = L11_22 .. L12_23 .. ", "
      end
      L11_22 = L9_20["Schedules.monday"]
      if L11_22 == "1" then
        L11_22 = L10_21
        L12_23 = "Monday"
        L10_21 = L11_22 .. L12_23 .. ", "
      end
      L11_22 = L9_20["Schedules.tuesday"]
      if L11_22 == "1" then
        L11_22 = L10_21
        L12_23 = "Tuesday"
        L10_21 = L11_22 .. L12_23 .. ", "
      end
      L11_22 = L9_20["Schedules.wednesday"]
      if L11_22 == "1" then
        L11_22 = L10_21
        L12_23 = "Wednesday"
        L10_21 = L11_22 .. L12_23 .. ", "
      end
      L11_22 = L9_20["Schedules.thursday"]
      if L11_22 == "1" then
        L11_22 = L10_21
        L12_23 = "Thursday"
        L10_21 = L11_22 .. L12_23 .. ", "
      end
      L11_22 = L9_20["Schedules.friday"]
      if L11_22 == "1" then
        L11_22 = L10_21
        L12_23 = "Friday"
        L10_21 = L11_22 .. L12_23 .. ", "
      end
      L11_22 = L9_20["Schedules.saturday"]
      if L11_22 == "1" then
        L11_22 = L10_21
        L12_23 = "Saturday"
        L10_21 = L11_22 .. L12_23 .. ", "
      end
      L12_23 = L10_21
      L11_22 = L10_21.sub
      L11_22 = L11_22(L12_23, 1, L10_21:len() - 2)
      L10_21 = L11_22
    end
    L11_22 = string
    L11_22 = L11_22.find
    L12_23 = L9_20["Schedules.ScheduleName"]
    L11_22 = L11_22(L12_23, "%s")
    if L11_22 ~= nil then
      L11_22 = string
      L11_22 = L11_22.sub
      L12_23 = L9_20["Schedules.ScheduleName"]
      L11_22 = L11_22(L12_23, 2, string.len(L9_20["Schedules.ScheduleName"]) - 1)
      L9_20["Schedules.ScheduleName"] = L11_22
    end
    L11_22 = L9_20["Schedules.startTimeHour"]
    L12_23 = ":"
    L11_22 = L11_22 .. L12_23 .. L9_20["Schedules.startTimeMin"] .. " " .. L9_20["Schedules.startTimeMeridian"]
    L12_23 = L9_20["Schedules.endTimeHour"]
    L12_23 = L12_23 .. ":" .. L9_20["Schedules.endTimeMin"] .. " " .. L9_20["Schedules.endTimeMeridian"]
    resTab.insertField(L1_12, "ROW ID", L9_20["Schedules._ROWID_"])
    resTab.insertField(L1_12, "Name", L9_20["Schedules.ScheduleName"])
    resTab.insertField(L1_12, "Days", L10_21)
    resTab.insertField(L1_12, "Start Time", L11_22)
    resTab.insertField(L1_12, "End Time", L12_23)
  end
  L4_15(L5_16, L6_17)
end
