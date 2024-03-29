require("teamf1lualib/login")
crontab = {}
function crontab.config(A0_0, A1_1, A2_2, A3_3)
  if A2_2 == "delete" then
    valid = db.deleteRow("crontab", "_ROWID_", A1_1)
  else
    A0_0["crontab.minute"] = 0
    A0_0["crontab.month"] = -1
    A0_0["crontab.dayOfMonth"] = -1
    A0_0["crontab.command"] = A3_3
    if A0_0["crontab.meridiem"] == "1" then
      A0_0["crontab.hour"] = 12 + A0_0["crontab.hour"]
    end
    if A0_0["crontab.unit"] == "1" then
      A0_0["crontab.hour"] = -1
    end
    if A1_1 == "-1" or A1_1 == -1 then
      valid = db.insert("crontab", A0_0)
    else
      valid = db.update("crontab", A0_0, A1_1)
    end
  end
  if valid then
    return "OK", "12265"
  else
    return "ERROR", "10485"
  end
end
function crontab.getSchedule(A0_4, A1_5)
  A1_5["crontab.hour"] = "-1"
  A1_5["crontab.unit"] = "-1"
  A1_5["crontab.dayOfWeek"] = "-1"
  A1_5["crontab.meridiem"] = "-1"
  if db.getRow("crontab", "_ROWID_", A0_4)["crontab.hour"] == "-1" then
    A1_5["crontab.unit"] = "1"
    return A1_5
  else
    hour = tonumber(db.getRow("crontab", "_ROWID_", A0_4)["crontab.hour"])
    if hour > 11 then
      A1_5["crontab.hour"] = tostring(hour - 12)
      A1_5["crontab.meridiem"] = "1"
    else
      A1_5["crontab.hour"] = db.getRow("crontab", "_ROWID_", A0_4)["crontab.hour"]
      A1_5["crontab.meridiem"] = "0"
    end
    if db.getRow("crontab", "_ROWID_", A0_4)["crontab.dayOfWeek"] == "-1" then
      A1_5["crontab.unit"] = "2"
      return A1_5
    else
      A1_5["crontab.unit"] = "3"
      A1_5["crontab.dayOfWeek"] = db.getRow("crontab", "_ROWID_", A0_4)["crontab.dayOfWeek"]
      return A1_5
    end
  end
  return A1_5
end
function crontab.getScheduleByCmd(A0_6)
  schedRow = db.getRowWhere("crontab", "command='" .. A0_6 .. "'")
  if schedRow == nil then
    util.appendDebugOut("crontab.getScheduleByCmd: ERROR: No Record <br>")
    return nil
  end
  hour = tonumber(schedRow["crontab.hour"])
  if hour > 11 then
    schedRow["crontab.hour"] = tostring(hour - 12)
    schedRow["crontab.meridiem"] = "1"
  else
    schedRow["crontab.meridiem"] = "0"
  end
  util.appendDebugOut("Schedule:Unit: " .. schedRow["crontab.unit"] .. "<br>")
  return schedRow
end
