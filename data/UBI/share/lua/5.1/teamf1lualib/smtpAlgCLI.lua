local L0_0
L0_0 = require
L0_0("teamf1lualib/smtpAlg")
L0_0 = 200
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
  L0_0 = 200
elseif PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-500_Ax" or PRODUCT_ID == "DSR-500N_Ax" then
  L0_0 = 100
elseif UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-250N" then
  L0_0 = 50
elseif UNIT_NAME == "DSR-150" or UNIT_NAME == "DSR-150N" then
  L0_0 = 25
end
function smtpAlgCfgInit(A0_1)
  configRow = db.getRow("smtpAlg", "_ROWID_", "1")
  return 1, configRow
end
function smtpAlgCfgSave(A0_2)
  local L1_3, L2_4, L3_5, L4_6
  L1_3 = "ERROR"
  errorFlag = L1_3
  L1_3 = ""
  statusCode = L1_3
  L1_3 = ""
  statusMessage = L1_3
  L1_3 = "smtpAlg"
  DBTable = L1_3
  L1_3 = "Enabling the SMTP ALG would result in performance drop. Please confirm(Y/N?)"
  L2_4 = db
  L2_4 = L2_4.getAttribute
  L3_5 = "smtpAlg"
  L4_6 = "_ROWID_"
  L2_4 = L2_4(L3_5, L4_6, "1", "smtpAlgStatus")
  L3_5 = tonumber
  L4_6 = A0_2["smtpAlg.smtpAlgStatus"]
  L3_5 = L3_5(L4_6)
  if L3_5 == 1 then
    L3_5 = tonumber
    L4_6 = L2_4
    L3_5 = L3_5(L4_6)
    if L3_5 ~= 1 then
      L3_5 = printCLIError
      L4_6 = L1_3
      L3_5(L4_6)
      L3_5 = io
      L3_5 = L3_5.stdin
      L4_6 = L3_5
      L3_5 = L3_5.read
      L3_5 = L3_5(L4_6, "*l")
      if L3_5 ~= "Y" and L3_5 ~= "N" then
        L4_6 = "ERROR"
        return L4_6, "Please confirm with Y/N"
      end
      if L3_5 == "N" then
        L4_6 = "ERROR"
        errorFlag = L4_6
        L4_6 = "Action Cancelled"
        statusMessage = L4_6
        L4_6 = errorFlag
        return L4_6, statusMessage
      end
    end
  end
  L3_5 = smtpAlgStatus
  L3_5 = L3_5.edit
  L4_6 = A0_2
  L4_6 = L3_5(L4_6, "1")
  statusCode = L4_6
  errorFlag = L3_5
  L3_5 = errorFlag
  if L3_5 == "OK" then
    L3_5 = db
    L3_5 = L3_5.getAttribute
    L4_6 = "environment"
    L3_5 = L3_5(L4_6, "name", "HW_OFFLOAD_SCRIPT", "value")
    L4_6 = "/pfrm2.0/bin/lua "
    L4_6 = L4_6 .. L3_5 .. " " .. DB_FILE_NAME
    util.appendDebugOut("Exec: " .. os.execute(L4_6))
    db.save()
  end
  L3_5 = db
  L3_5 = L3_5.getAttribute
  L4_6 = "stringsMap"
  L3_5 = L3_5(L4_6, "stringId", statusCode, LANGUAGE)
  statusMessage = L3_5
  L3_5 = errorFlag
  L4_6 = statusMessage
  return L3_5, L4_6
end
function smtpAlgCfgInputVal(A0_7)
  if A0_7["smtpAlg.smtpAlgStatus"] == nil then
    printCLIError("Please Enable smtpAlg first")
    return false
  end
  if A0_7["smtpAlg.port"] == "0" or A0_7["smtpAlg.port"] == "" then
    printCLIError("Please enter a valid port number")
    return false
  end
  return true
end
function smtpAlgGet()
  local L0_8, L1_9
  L0_8 = db
  L0_8 = L0_8.getRow
  L1_9 = "smtpAlg"
  L0_8 = L0_8(L1_9, "_ROWID_", "1")
  L1_9 = {}
  if L0_8["smtpAlg.smtpAlgStatus"] ~= nil and L0_8["smtpAlg.smtpAlgStatus"] == "0" then
    resTab.insertField(L1_9, "SmtpAlg Status is", "Disabled")
  else
    resTab.insertField(L1_9, "SmtpAlg Status is ", "Enabled")
  end
  resTab.print(L1_9, 0)
end
function approvedMailIdCfgInit(A0_10)
  local L1_11
  L1_11 = A0_10[1]
  if L1_11 == nil then
    configRow = {}
    configRow["approvedMailIdList._ROWID_"] = "-1"
  else
    configRow = {}
    configRow["approvedMailIdList._ROWID_"] = L1_11
    configRow = db.getRow("approvedMailIdList", "_ROWID_", L1_11)
    if configRow == nil then
      print("Row does not exist")
      return -1, {}
    end
  end
  return configRow["approvedMailIdList._ROWID_"], configRow
end
function approvedMailIdCfgSave(A0_12)
  local L1_13, L2_14
  L1_13 = "ERROR"
  errorFlag = L1_13
  L1_13 = ""
  statusCode = L1_13
  L1_13 = ""
  statusMessage = L1_13
  L1_13 = "approvedMailIdList"
  DBTable = L1_13
  L1_13 = {}
  L2_14 = A0_12["approvedMailIdList._ROWID_"]
  if L2_14 == "-1" then
    L1_13 = db.getTable(DBTable)
    if L1_13 ~= nil and _UPVALUE0_ <= #L1_13 then
      statusMessage = "Approved Mail IDs maximum limit is reached."
      return errorFlag, statusMessage
    end
    errorFlag, statusCode = approvedMail.add(A0_12)
  else
    errorFlag, statusCode = approvedMail.edit(A0_12, L2_14)
  end
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  return errorFlag, statusMessage
end
function approvedMailIdCfgInputVal(A0_15)
  if A0_15["approvedMailIdList.approvedMailId"] == nil or A0_15["approvedMailIdList.approvedMailId"] == "" then
    printCLIError("Please enter a valid mail id")
    return false
  else
    if string.find(A0_15["approvedMailIdList.approvedMailId"], "@") == nil then
      printCLIError("Please enter a valid mail id that contains '@'")
      return false
    end
    if string.find(A0_15["approvedMailIdList.approvedMailId"], "%.") == nil then
      printCLIError("Please enter a valid mail id that contains '.'")
      return false
    end
  end
  return true
end
function approvedMailIdCfgDel(A0_16)
  local L1_17
  L1_17 = ""
  errorFlag = L1_17
  L1_17 = ""
  statusCode = L1_17
  L1_17 = ""
  statusMessage = L1_17
  L1_17 = "approvedMailIdList"
  DBTable = L1_17
  L1_17 = {}
  rows = L1_17
  L1_17 = {}
  L1_17 = db.getRow("approvedMailIdList", "_ROWID_", A0_16[1])
  if L1_17 == nil then
    errorFlag = "ERROR"
    statusMessage = "Row doesn't exist"
    printCLIError(statusMessage)
    return errorFlag, statusMessage
  else
    rows.rowid = L1_17["approvedMailIdList._ROWID_"]
    if rows then
      errorFlag, statusCode = approvedMail.delete(rows)
    end
    if errorFlag == "OK" then
      db.save()
      print("Row Deleted")
    end
    statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  end
  return errorFlag, statusMessage
end
function approvedMailIdListGet()
  local L0_18, L1_19
  L0_18 = db
  L0_18 = L0_18.getTable
  L1_19 = "approvedMailIdList"
  L0_18 = L0_18(L1_19)
  L1_19 = {}
  printLabel("List of Approved Mail_Id")
  for _FORV_7_, _FORV_8_ in pairs(L0_18) do
    if 0 + 1 ~= nil then
      resTab.insertField(L1_19, "ROW ID", L0_18[0 + 1]["approvedMailIdList._ROWID_"] or "")
      resTab.insertField(L1_19, "Approved MailId", L0_18[0 + 1]["approvedMailIdList.approvedMailId"] or "")
    end
  end
  resTab.print(L1_19, 0)
end
function blockedMailIdCfgInit(A0_20)
  local L1_21
  L1_21 = A0_20[1]
  if L1_21 == nil then
    configRow = {}
    configRow["blockedMailIdList._ROWID_"] = "-1"
  else
    configRow = {}
    configRow["blockedMailIdList._ROWID_"] = L1_21
    configRow = db.getRow("blockedMailIdList", "_ROWID_", L1_21)
    if configRow == nil then
      print("Row does not exist")
      return -1, {}
    end
  end
  return configRow["blockedMailIdList._ROWID_"], configRow
end
function blockedMailIdCfgSave(A0_22)
  local L1_23, L2_24
  L1_23 = "ERROR"
  errorFlag = L1_23
  L1_23 = ""
  statusCode = L1_23
  L1_23 = ""
  statusMessage = L1_23
  L1_23 = "blockedMailIdList"
  DBTable = L1_23
  L1_23 = {}
  L2_24 = A0_22["blockedMailIdList._ROWID_"]
  if L2_24 == "-1" then
    L1_23 = db.getTable(DBTable)
    if L1_23 ~= nil and _UPVALUE0_ <= #L1_23 then
      statusMessage = "Blocked Mail IDs maximum limit is reached."
      return errorFlag, statusMessage
    end
    errorFlag, statusCode = blockedMail.add(A0_22)
  else
    errorFlag, statusCode = blockedMail.edit(A0_22, L2_24)
  end
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  return errorFlag, statusMessage
end
function blockedMailIdCfgInputVal(A0_25)
  if A0_25["blockedMailIdList.blockedMailId"] == nil or A0_25["blockedMailIdList.blockedMailId"] == "" then
    printCLIError("Please enter a valid mail id")
    return false
  else
    if string.find(A0_25["blockedMailIdList.blockedMailId"], "@") == nil then
      printCLIError("Please enter a valid mail id that contains '@'")
      return false
    end
    if string.find(A0_25["blockedMailIdList.blockedMailId"], "%.") == nil then
      printCLIError("Please enter a valid mail id that contains '.'")
      return false
    end
  end
  return true
end
function blockedMailIdCfgDel(A0_26)
  local L1_27
  L1_27 = ""
  errorFlag = L1_27
  L1_27 = ""
  statusCode = L1_27
  L1_27 = ""
  statusMessage = L1_27
  L1_27 = "blockedMailIdList"
  DBTable = L1_27
  L1_27 = {}
  rows = L1_27
  L1_27 = {}
  L1_27 = db.getRow("blockedMailIdList", "_ROWID_", A0_26[1])
  if L1_27 == nil then
    errorFlag = "ERROR"
    statusMessage = "Row doesn't exist"
    printCLIError(statusMessage)
    return errorFlag, statusMessage
  else
    rows.rowid = L1_27["blockedMailIdList._ROWID_"]
    if rows then
      errorFlag, statusCode = blockedMail.delete(rows)
    end
    if errorFlag == "OK" then
      db.save()
      print("Row Deleted")
    end
    statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  end
  return errorFlag, statusMessage
end
function blockedMailIdListGet()
  local L0_28, L1_29
  L0_28 = db
  L0_28 = L0_28.getTable
  L1_29 = "blockedMailIdList"
  L0_28 = L0_28(L1_29)
  L1_29 = {}
  printLabel("List of Blocked Mail_Id")
  for _FORV_7_, _FORV_8_ in pairs(L0_28) do
    if 0 + 1 ~= nil then
      resTab.insertField(L1_29, "ROW ID", L0_28[0 + 1]["blockedMailIdList._ROWID_"] or "")
      resTab.insertField(L1_29, "Blocked MailId", L0_28[0 + 1]["blockedMailIdList.blockedMailId"] or "")
    end
  end
  resTab.print(L1_29, 0)
end
function subjectListCfgInit(A0_30)
  local L1_31
  L1_31 = A0_30[1]
  if L1_31 == nil then
    configRow = {}
    configRow["subjectList._ROWID_"] = "-1"
  else
    configRow = {}
    configRow["subjectList._ROWID_"] = L1_31
    configRow = db.getRow("subjectList", "_ROWID_", L1_31)
    if configRow == nil then
      print("Row does not exist")
      return -1, {}
    end
  end
  return configRow["subjectList._ROWID_"], configRow
end
function subjectListCfgSave(A0_32)
  local L1_33, L2_34
  L1_33 = "ERROR"
  errorFlag = L1_33
  L1_33 = ""
  statusCode = L1_33
  L1_33 = ""
  statusMessage = L1_33
  L1_33 = "subjectList"
  DBTable = L1_33
  L1_33 = {}
  L2_34 = UNIT_NAME
  if L2_34 ~= "DSR-250N" then
    L2_34 = UNIT_NAME
  elseif L2_34 == "DSR-250" then
    L2_34 = 50
    _UPVALUE0_ = L2_34
  end
  L2_34 = UNIT_NAME
  if L2_34 ~= "DSR-150N" then
    L2_34 = UNIT_NAME
  elseif L2_34 == "DSR-150" then
    L2_34 = 25
    _UPVALUE0_ = L2_34
  end
  L2_34 = A0_32["subjectList._ROWID_"]
  if L2_34 == "-1" then
    L1_33 = db.getTable(DBTable)
    if L1_33 ~= nil and _UPVALUE0_ <= #L1_33 then
      statusMessage = "Mail filtering maximum limit is reached."
      return errorFlag, statusMessage
    end
    errorFlag, statusCode = subjectList.add(A0_32)
  else
    errorFlag, statusCode = subjectList.edit(A0_32, L2_34)
  end
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  return errorFlag, statusMessage
end
function subjectListCfgInputVal(A0_35)
  if A0_35["subjectList.subject"] == nil or A0_35["subjectList.subject"] == "" then
    printCLIError("Please enter a valid subject")
    return false
  end
  if A0_35["subjectList.mailId"] == nil or A0_35["subjectList.mailId"] == "" then
    printCLIError("Please enter a valid mail id")
    return false
  else
    if string.find(A0_35["subjectList.mailId"], "@") == nil then
      printCLIError("Please enter a valid mail that contain '@'")
      return false
    end
    if string.find(A0_35["subjectList.mailId"], "%.") == nil then
      printCLIError("Please enter a valid mail that contain '.'")
      return false
    end
  end
  if A0_35["subjectList.action"] == nil then
    printCLIError("Please enter a valid action")
    return false
  end
  return true
end
function subjectListCfgDel(A0_36)
  local L1_37
  L1_37 = ""
  errorFlag = L1_37
  L1_37 = ""
  statusCode = L1_37
  L1_37 = ""
  statusMessage = L1_37
  L1_37 = "subjectList"
  DBTable = L1_37
  L1_37 = {}
  rows = L1_37
  L1_37 = {}
  L1_37 = db.getRow("subjectList", "_ROWID_", A0_36[1])
  if L1_37 == nil then
    errorFlag = "ERROR"
    statusMessage = "Row doesn't exist"
    printCLIError(statusMessage)
    return errorFlag, statusMessage
  else
    rows.rowid = L1_37["subjectList._ROWID_"]
    if rows then
      errorFlag, statusCode = subjectList.delete(rows)
    end
    if errorFlag == "OK" then
      db.save()
      print("Row Deleted")
    end
    statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  end
  return errorFlag, statusMessage
end
function subjectListGet()
  local L0_38, L1_39
  L0_38 = db
  L0_38 = L0_38.getTable
  L1_39 = "subjectList"
  L0_38 = L0_38(L1_39)
  L1_39 = {}
  printLabel("List of Subject and corresponding mail Id")
  for _FORV_7_, _FORV_8_ in pairs(L0_38) do
    if 0 + 1 ~= nil then
      resTab.insertField(L1_39, "ROW ID ", L0_38[0 + 1]["subjectList._ROWID_"] or "")
      resTab.insertField(L1_39, "Subject ", L0_38[0 + 1]["subjectList.subject"] or "")
      resTab.insertField(L1_39, "MailId ", L0_38[0 + 1]["subjectList.mailId"] or "")
      if L0_38[0 + 1]["subjectList.action"] == "0" then
        resTab.insertField(L1_39, "Action ", "Block")
      elseif L0_38[0 + 1]["subjectList.action"] == "1" then
        resTab.insertField(L1_39, "Action ", "Allow")
      end
    end
  end
  resTab.print(L1_39, 0)
end
