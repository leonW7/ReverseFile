require("teamf1lualib/crontab")
logging = {}
logConfig = {}
sysLogInfo = {}
emailLogs = {}
logEventConfig = {}
function logging.logConfig_config(A0_0, A1_1, A2_2)
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
  L3_3 = logConfig.config(A0_0, A1_1, A2_2)
  if L3_3 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12771"
  end
end
function logConfig.config(A0_4, A1_5, A2_6)
  if logConfig.inputvalidate(A0_4, A2_6) then
    if A2_6 == "add" then
      return db.insert("logConfig", A0_4)
    elseif A2_6 == "edit" then
      return db.update("logConfig", A0_4, A1_5)
    elseif A2_6 == "delete" then
      return db.delete("logConfig", A0_4)
    end
  end
  return false
end
function logConfig.inputvalidate(A0_7, A1_8)
  do return db.typeAndRangeValidate(A0_7) end
  return false
end
function logging.emailLogs_config(A0_9)
  local L1_10, L2_11
  L1_10 = db
  L1_10 = L1_10.getAttribute
  L2_11 = "emailLogs"
  L1_10 = L1_10(L2_11, "_ROWID_", 1, "entryName")
  L2_11 = db
  L2_11 = L2_11.getAttribute
  L2_11 = L2_11("environment", "name", "EMAILLOGS_PROGRAM", "value")
  L2_11 = L2_11 .. " " .. DB_FILE_NAME .. " " .. "all"
  emailLogsBinary = L2_11
  L2_11 = A0_9["emailLogs.mailLogs"]
  if L2_11 == "0" then
    L2_11 = db
    L2_11 = L2_11.update
    L2_11 = L2_11("emailLogs", A0_9, 1)
    valid = L2_11
    L2_11 = valid
    if L2_11 == false then
      L2_11 = "ERROR"
      return L2_11, "10675"
    end
    L2_11 = db
    L2_11 = L2_11.deleteRow
    L2_11 = L2_11("crontab", "command", emailLogsBinary)
    valid = L2_11
    L2_11 = valid
    if L2_11 == false then
      L2_11 = "ERROR"
      return L2_11, "10485"
    end
  else
    L2_11 = db
    L2_11 = L2_11.update
    L2_11 = L2_11("emailLogs", A0_9, 1)
    valid = L2_11
    L2_11 = valid
    if L2_11 == false then
      L2_11 = "ERROR"
      return L2_11, "10675"
    end
    L2_11 = db
    L2_11 = L2_11.getAttribute
    L2_11 = L2_11("environment", "name", "LOG_FILE", "value")
    A0_9["smtpServer.logFile"] = L2_11
    L2_11 = db
    L2_11 = L2_11.existsRow
    L2_11 = L2_11("smtpServer", "entryName", L1_10)
    if L2_11 then
      L2_11 = db
      L2_11 = L2_11.getAttribute
      L2_11 = L2_11("smtpServer", "entryName", L1_10, "_ROWID_")
      valid = db.update("smtpServer", A0_9, L2_11)
    else
      A0_9["smtpServer.entryName"] = L1_10
      L2_11 = db
      L2_11 = L2_11.insert
      L2_11 = L2_11("smtpServer", A0_9)
      valid = L2_11
    end
    L2_11 = valid
    if L2_11 == false then
      L2_11 = "ERROR"
      return L2_11, "12175"
    end
    L2_11 = "OK"
    if A0_9["crontab.unit"] == "0" then
      valid = db.deleteRow("crontab", "command", emailLogsBinary)
    else
      valid = db.deleteRow("crontab", "command", emailLogsBinary)
      L2_11 = crontab.config(A0_9, -1, "insert", emailLogsBinary)
    end
    if L2_11 ~= "OK" or valid == false then
      return "ERROR", "10486"
    end
  end
  L2_11 = "OK"
  return L2_11, "12265"
end
function logging.emailLogs_getInfo()
  local L0_12, L1_13
  L0_12 = {}
  configRow = L0_12
  L0_12 = db
  L0_12 = L0_12.getAttribute
  L1_13 = "emailLogs"
  L0_12 = L0_12(L1_13, "_ROWID_", 1, "entryName")
  L1_13 = db
  L1_13 = L1_13.existsRow
  L1_13 = L1_13("smtpServer", "entryName", L0_12)
  if not L1_13 then
    L1_13 = configRow
    L1_13["smtpServer.emailServer"] = ""
    L1_13 = configRow
    L1_13["smtpServer.fromAddr"] = ""
    L1_13 = configRow
    L1_13["smtpServer.toAddr"] = ""
    L1_13 = configRow
    L1_13["smtpServer.toAddr2"] = ""
    L1_13 = configRow
    L1_13["smtpServer.toAddr3"] = ""
    L1_13 = configRow
    L1_13["smtpServer.auth"] = ""
    L1_13 = configRow
    L1_13["smtpServer.userName"] = ""
    L1_13 = configRow
    L1_13["smtpServer.passWord"] = ""
    L1_13 = configRow
    L1_13["smtpServer.respondIdentd"] = "0"
    L1_13 = configRow
    L1_13["crontab.unit"] = "0"
  else
    L1_13 = db
    L1_13 = L1_13.getRow
    L1_13 = L1_13("smtpServer", "entryName", L0_12)
    for _FORV_5_, _FORV_6_ in pairs(L1_13) do
      configRow[_FORV_5_] = _FORV_6_
    end
    if tonumber(configRow["smtpServer.auth"]) == -1 then
      configRow["smtpServer.userName"] = ""
      configRow["smtpServer.passWord"] = ""
    end
  end
  L1_13 = db
  L1_13 = L1_13.getAttribute
  L1_13 = L1_13("environment", "name", "EMAILLOGS_PROGRAM", "value")
  L1_13 = L1_13 .. " " .. DB_FILE_NAME
  emailLogsBinary = L1_13
  L1_13 = configRow
  L1_13["emailLogs.mailLogs"] = db.getAttribute("emailLogs", "_ROWID_", 1, "mailLogs")
  L1_13 = configRow
  L1_13["emailLogs.logId"] = db.getAttribute("emailLogs", "_ROWID_", 1, "logId")
  L1_13 = db
  L1_13 = L1_13.existsRow
  L1_13 = L1_13("crontab", "command", emailLogsBinary)
  if not L1_13 then
    L1_13 = configRow
    L1_13["crontab.unit"] = "0"
  else
    L1_13 = db
    L1_13 = L1_13.getAttribute
    L1_13 = L1_13("crontab", "command", emailLogsBinary, "_ROWID_")
    configRow = crontab.getSchedule(L1_13, configRow)
  end
  L1_13 = configRow
  return L1_13
end
function logging.sysLogInfo_config(A0_14, A1_15)
  local L2_16
  L2_16 = ACCESS_LEVEL
  if L2_16 ~= 0 then
    L2_16 = "ACCESS_DENIED"
    return L2_16, "10187"
  end
  L2_16 = db
  L2_16 = L2_16.beginTransaction
  L2_16()
  L2_16 = false
  if A1_15 == "add" then
    L2_16 = db.insert("sysLogInfo", A0_14)
  elseif A1_15 == "edit" then
    L2_16 = db.update("sysLogInfo", A0_14, 1)
  end
  if L2_16 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12294"
  end
end
function logging.logEventsConfig_config(A0_17, A1_18, A2_19)
  local L3_20
  L3_20 = ACCESS_LEVEL
  if L3_20 ~= 0 then
    L3_20 = "ACCESS_DENIED"
    return L3_20, "10187"
  end
  L3_20 = db
  L3_20 = L3_20.beginTransaction
  L3_20()
  L3_20 = false
  L3_20 = logEventConfig.config(A0_17, A1_18, A2_19)
  if L3_20 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12771"
  end
end
function logEventConfig.config(A0_21, A1_22, A2_23)
  if logConfig.inputvalidate(A0_21, A2_23) then
    if A2_23 == "add" then
      return db.insert("logEventEmailConfig", A0_21)
    elseif A2_23 == "edit" then
      return db.update("logEventEmailConfig", A0_21, A1_22)
    elseif A2_23 == "delete" then
      return db.delete("logEventEmailConfig", A0_21)
    end
  end
  return false
end
function logging.emailLogsConfig(A0_24)
  local L1_25, L2_26, L3_27, L4_28, L5_29, L6_30, L7_31
  L1_25 = ACCESS_LEVEL
  if L1_25 ~= 0 then
    L1_25 = "ACCESS_DENIED"
    L2_26 = "10187"
    return L1_25, L2_26
  end
  L1_25 = false
  L2_26 = db
  L2_26 = L2_26.beginTransaction
  L2_26()
  L2_26 = logging
  L2_26 = L2_26.emailLogs_config
  L2_26 = L2_26(L3_27)
  statusCode = L3_27
  errorFlag = L2_26
  L2_26 = errorFlag
  if L2_26 == "OK" then
    L2_26 = db
    L2_26 = L2_26.getTable
    L2_26 = L2_26(L3_27)
    for L6_30, L7_31 in L3_27(L4_28) do
      if A0_24["sysLogInfo.Enable" .. L7_31["sysLogInfo.serverId"]] ~= nil then
        L7_31["sysLogInfo.Enable"] = A0_24["sysLogInfo.Enable" .. L7_31["sysLogInfo.serverId"]]
        if L7_31["sysLogInfo.Enable"] == "1" then
          L7_31["sysLogInfo.serverName"] = A0_24["sysLogInfo.serverName" .. L7_31["sysLogInfo.serverId"]]
          L7_31["sysLogInfo.facilityId"] = A0_24["sysLogInfo.facilityId" .. L7_31["sysLogInfo.serverId"]]
          L7_31["sysLogInfo.severity"] = A0_24["sysLogInfo.severity" .. L7_31["sysLogInfo.serverId"]]
        end
        L1_25 = db.update("sysLogInfo", L7_31, L7_31["sysLogInfo._ROWID_"])
        if L1_25 == false then
          break
        end
      end
    end
  end
  if L1_25 then
    L2_26 = errorFlag
    if L2_26 == "OK" then
      L2_26 = db
      L2_26 = L2_26.commitTransaction
      L2_26(L3_27)
      L2_26 = "OK"
      return L2_26, L3_27
    end
  else
    L2_26 = db
    L2_26 = L2_26.rollback
    L2_26()
    L2_26 = "ERROR"
    return L2_26, L3_27
  end
end
function logging.emailLogsConfigGet()
  local L0_32, L1_33
  L0_32 = logging
  L0_32 = L0_32.emailLogs_getInfo
  L0_32 = L0_32()
  if L0_32 == nil then
    L1_33 = {}
    L0_32 = L1_33
  end
  L1_33 = db
  L1_33 = L1_33.getTable
  L1_33 = L1_33("sysLogInfo")
  for _FORV_5_, _FORV_6_ in pairs(L1_33) do
    L0_32["sysLogInfo.Enable" .. _FORV_6_["sysLogInfo.serverId"]] = _FORV_6_["sysLogInfo.Enable"]
    L0_32["sysLogInfo.serverName" .. _FORV_6_["sysLogInfo.serverId"]] = _FORV_6_["sysLogInfo.serverName"]
    L0_32["sysLogInfo.facilityId" .. _FORV_6_["sysLogInfo.serverId"]] = _FORV_6_["sysLogInfo.facilityId"]
    L0_32["sysLogInfo.severity" .. _FORV_6_["sysLogInfo.serverId"]] = _FORV_6_["sysLogInfo.severity"]
  end
  return L0_32
end
