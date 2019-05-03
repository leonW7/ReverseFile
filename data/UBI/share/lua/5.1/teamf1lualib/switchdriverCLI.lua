local L0_0
L0_0 = require
L0_0("teamf1lualib/powersaving")
L0_0 = require
L0_0("teamf1lualib/jumboFrame_bl")
L0_0 = require
L0_0("teamf1lualib/errorMap")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.errorMap")
function powerModeCfgInit(A0_1)
  configRowId = "1"
  configRow = db.getRow("PowerModeConf", "PowerModeConf._ROWID_", configRowId)
  if configRow == nil then
    configRow = {}
    configRow["PowerModeConf._ROWID_"] = -1
  end
  configRowId = configRow["PowerModeConf._ROWID_"]
  return configRowId, configRow
end
function powerModeCfgSave(A0_2)
  local L1_3
  L1_3 = ""
  errorFlag = L1_3
  L1_3 = ""
  statusCode = L1_3
  L1_3 = ""
  statusMessage = L1_3
  L1_3 = "PowerModeConf"
  DBTable = L1_3
  L1_3 = A0_2["PowerModeConf._ROWID_"]
  errorFlag, statusCode = powersaving.ps_config(A0_2, L1_3, "edit")
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  return errorFlag, statusMessage
end
function powerModeCfgInputVal(A0_4)
  if A0_4["PowerModeConf.PowerMode"] == "" or A0_4["PowerModeConf.PowerMode"] == nil then
    printCLIError("Enter Valid Enable Value\n")
    return false
  end
  if A0_4["PowerModeConf.LengthMode"] == "" or A0_4["PowerModeConf.LengthMode"] == nil then
    printCLIError("Enter Valid Enable Value\n")
    return false
  end
  return true
end
function powerModeCfgGet()
  if db.getRow("PowerModeConf", "_ROWID_", "1") == nil then
    print("Power Mode Configuration Not Available\n")
  else
    printLabel("Power Mode Settings:")
    if db.getRow("PowerModeConf", "_ROWID_", "1")["PowerModeConf.PowerMode"] == "1" then
      print("Power Mode Link Status : Enabled\n")
    else
      print("Power Mode Link Status : Disabled\n")
    end
    if db.getRow("PowerModeConf", "_ROWID_", "1")["PowerModeConf.LengthMode"] == "1" then
      print("Power Mode Length Mode : Enabled\n")
    else
      print("Power Mode Length Mode : Disabled\n")
    end
  end
end
function jumboFrameCfgInit(A0_5)
  configRowId = "1"
  configRow = db.getRow("PowerModeConf", "PowerModeConf._ROWID_", configRowId)
  if configRow == nil then
    configRow = {}
    configRow["PowerModeConf._ROWID_"] = -1
  end
  configRowId = configRow["PowerModeConf._ROWID_"]
  return configRowId, configRow
end
function jumboFrameCfgSave(A0_6)
  local L1_7, L2_8, L3_9, L4_10
  L1_7 = ""
  errorFlag = L1_7
  L1_7 = ""
  statusCode = L1_7
  L1_7 = ""
  statusMessage = L1_7
  L1_7 = ""
  L2_8 = ""
  L3_9 = nil
  L4_10 = "PowerModeConf"
  DBTable = L4_10
  L2_8 = "Operation Succeeded, Please Configure MTU in WAN settings Page."
  L4_10 = UNIT_NAME
  if L4_10 ~= "DSR-250N" then
    L4_10 = UNIT_NAME
  elseif L4_10 == "DSR-250" then
    L2_8 = "Operation Succeeded."
  end
  L4_10 = "Disabling Jumbo Frame will set MTU's with default value 1500."
  A0_6["jumboFrame.jumboFrame"] = A0_6["PowerModeConf.JumboFrameEnable"]
  if db.getAttribute("PowerModeConf", "_ROWID_", "1", "JumboFrameEnable") ~= A0_6["PowerModeConf.JumboFrameEnable"] and A0_6["PowerModeConf.JumboFrameEnable"] == "0" then
    printCLIError(L4_10)
    printCLIError("Are you sure you want to proceed [Y/N]?")
    L1_7 = io.stdin:read("*l")
    if L1_7 == "N" or L1_7 == "n" then
      errorFlag = "ERROR"
      statusMessage = "Action Cancelled"
      return errorFlag, statusMessage
    elseif L1_7 == "Y" or L1_7 == "y" then
      errorFlag, L3_9 = jumboFrameSet(A0_6)
      statusMessage = _UPVALUE0_.errorStringGet(errorFlag)
    end
  else
    errorFlag, L3_9 = jumboFrameSet(A0_6)
    statusMessage = _UPVALUE0_.errorStringGet(errorFlag)
  end
  if errorFlag == 0 then
    errorFlag = "OK"
    db.save()
    if A0_6["PowerModeConf.JumboFrameEnable"] == "1" then
      printCLIError(L2_8)
    end
  else
    errorFlag = "ERROR"
  end
  return errorFlag, statusMessage
end
function jumboFrameCfgInputVal(A0_11)
  if A0_11["PowerModeConf.JumboFrameEnable"] == "" or A0_11["PowerModeConf.JumboFrameEnable"] == nil then
    printCLIError("Enter Valid Enable Value\n")
    return false
  end
  return true
end
function jumboFrameCfgGet()
  if db.getRow("PowerModeConf", "_ROWID_", "1") == nil then
    print("Jumbo Frame Configuration Not Available\n")
  else
    printLabel("JumboFrame Setting :")
    if db.getRow("PowerModeConf", "_ROWID_", "1")["PowerModeConf.JumboFrameEnable"] == "1" then
      print("JumboFrameEnable Status : Enabled\n")
    else
      print("JUmboFrameEnable Status : Disabled\n")
    end
  end
end
