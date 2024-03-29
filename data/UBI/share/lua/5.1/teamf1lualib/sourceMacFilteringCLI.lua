local L0_0
L0_0 = require
L0_0("teamf1lualib/fwView")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/ipMacBinding_bl")
L0_0 = 512
DSR_1000_MAXLIMIT = L0_0
L0_0 = 256
DSR_500_MAXLIMIT = L0_0
L0_0 = 128
DSR_250_MAXLIMIT = L0_0
L0_0 = 64
DSR_150_MAXLIMIT = L0_0
L0_0 = DSR_1000_MAXLIMIT
IP_MAC_LIMIT = L0_0
L0_0 = PRODUCT_ID
if L0_0 ~= "DSR-500AC_Ax" then
  L0_0 = PRODUCT_ID
  if L0_0 ~= "DSR-500_Bx" then
    L0_0 = UNIT_NAME
    if L0_0 ~= "DSR-500" then
      L0_0 = UNIT_NAME
    end
  end
else
  if L0_0 == "DSR-500N" then
    L0_0 = DSR_500_MAXLIMIT
    IP_MAC_LIMIT = L0_0
end
else
  L0_0 = UNIT_NAME
  if L0_0 ~= "DSR-250" then
    L0_0 = UNIT_NAME
  else
    if L0_0 == "DSR-250N" then
      L0_0 = DSR_250_MAXLIMIT
      IP_MAC_LIMIT = L0_0
  end
  else
    L0_0 = UNIT_NAME
    if L0_0 ~= "DSR-150" then
      L0_0 = UNIT_NAME
    elseif L0_0 == "DSR-150N" then
      L0_0 = DSR_150_MAXLIMIT
      IP_MAC_LIMIT = L0_0
    end
  end
end
L0_0 = require
L0_0 = L0_0("com.teamf1.core.validations")
function sourceMacFilteringCfgInit(A0_1)
  if A0_1[1] == nil then
    configRow = db.getDefaults(true, "SourceMACAddress")
    configRow["SourceMACAddress._ROWID_"] = "-1"
    configRow["SourceMACAddress.OID"] = "10"
  else
    configRow = db.getRow("SourceMACAddress", "SourceMACAddress._ROWID_", A0_1[1])
  end
  if configRow == nil then
    print("Deleted row\n")
    return -1, {}
  end
  return configRow["SourceMACAddress._ROWID_"], configRow
end
function sourceMacFilteringCfgSave(A0_2)
  DBTable = "SourceMACAddress"
  RowId = A0_2["SourceMACAddress._ROWID_"]
  if RowId == "-1" then
    errorFlag, statusCode = fwView.macFilteringConfig(A0_2, RowId, "add")
  else
    errorFlag, statusCode = fwView.macFilteringConfig(A0_2, RowId, "edit")
  end
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  return errorFlag, statusMessage
end
function sourceMacFilteringCfgDel(A0_3)
  DBTable = "SourceMACAddress"
  rows = {}
  rows.rowid = A0_3["SourceMACAddress._ROWID_"]
  if rows then
    errorFlag, statusCode = fwView.deleteMac(rows)
  end
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  return errorFlag, statusMessage
end
function sourceMacFilteringCfgInputVal(A0_4)
  if A0_4["SourceMACAddress.SourceMACAddress"] == "" then
    printCLIError("Enter valid mac address\n")
    return false
  end
  return true
end
function sourceMacFilteringCfgGet(A0_5)
  local L1_6, L2_7, L3_8, L4_9
  L1_6 = {}
  L2_7 = {}
  L3_8 = db
  L3_8 = L3_8.getRow
  L4_9 = "MACFiltering"
  L3_8 = L3_8(L4_9, "_ROWID_", "1")
  L4_9 = L3_8["MACFiltering.MACFilterEnable"]
  if L4_9 == "1" then
    L4_9 = resTab
    L4_9 = L4_9.insertField
    L4_9(L1_6, "MAC Filtering", "Enabled")
  else
    L4_9 = resTab
    L4_9 = L4_9.insertField
    L4_9(L1_6, "MAC Filtering", "Disabled")
  end
  L4_9 = L3_8["MACFiltering.MACAddressPolicy"]
  if L4_9 == "0" then
    L4_9 = resTab
    L4_9 = L4_9.insertField
    L4_9(L1_6, "Policy for MAC Addresses", "Block and Permit the rest")
  else
    L4_9 = L3_8["MACFiltering.MACAddressPolicy"]
    if L4_9 == "1" then
      L4_9 = resTab
      L4_9 = L4_9.insertField
      L4_9(L1_6, "Policy for MAC Addresses", "Permit and Block the rest")
    else
      L4_9 = resTab
      L4_9 = L4_9.insertField
      L4_9(L1_6, "Policy for MAC Addresses", "Unknown")
    end
  end
  L4_9 = db
  L4_9 = L4_9.getTable
  L4_9 = L4_9("SourceMACAddress")
  for _FORV_9_, _FORV_10_ in pairs(L4_9) do
    resTab.insertField(L2_7, "ROW ID", L4_9[0 + 1]["SourceMACAddress._ROWID_"] or "")
    resTab.insertField(L2_7, "MAC Address", L4_9[0 + 1]["SourceMACAddress.SourceMACAddress"] or "")
  end
  printLabel("Source MAC Filter\n")
  resTab.print(L1_6, 0)
  printLabel("List of Available MAC Addresses\n")
  resTab.print(L2_7, 0)
end
function macFilteringCfgInit(A0_10)
  configRow = db.getRow("MACFiltering", "_ROWID_", "1")
  return 1, configRow
end
function macFilteringCfgSave(A0_11)
  DBTable = "MACFiltering"
  errorFlag, statusCode = fwView.macFilteringConfig(A0_11, "1", "edit")
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  return errorFlag, statusMessage
end
function ipMacBindingCfgInit(A0_12)
  if A0_12[1] == nil then
    configRow = db.getDefaults(true, "IPMACBinding")
    configRow["IPMACBinding._ROWID_"] = "-1"
    configRow["IPMACBinding.OID"] = "10"
  else
    configRow = db.getRow("IPMACBinding", "IPMACBinding._ROWID_", A0_12[1])
  end
  if configRow == nil then
    return -1, {}
  end
  return configRow["IPMACBinding._ROWID_"], configRow
end
function ipMacBindingCfgSave(A0_13)
  DBTable = "IPMACBinding"
  if A0_13["IPMACBinding._ROWID_"] == "-1" then
    A0_13["IPMACBinding.AssociatingEnabled"] = "0"
    errorFlag, statusCode = fwView.ipMacConfig(A0_13, "-1", "add")
  else
    dhcp_IpAddr = db.getAttribute("IPMACBinding", "_ROWID_", A0_13["IPMACBinding._ROWID_"], "IPAddress")
    errorFlag, statusCode = fwView.ipMacConfig(A0_13, A0_13["IPMACBinding._ROWID_"], "edit")
  end
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE) or statusCode
  return errorFlag, statusMessage
end
function ipMacBindingCfgDel(A0_14)
  local L1_15, L2_16
  L1_15 = "IPMACBinding"
  DBTable = L1_15
  L1_15 = {}
  L2_16 = A0_14["IPMACBinding._ROWID_"]
  L1_15 = db.getRow("IPMACBinding", "_ROWID_", L2_16)
  if L1_15 == nil then
    errorFlag = "ERROR"
    statusMessage = "Row doesnt exist"
    printCLIError("Row doesnt exist")
    return errorFlag, statusMessage
  else
    A0_14["ipMacBinding.cookie"] = L2_16
    errorFlag = ipMacBindingDelete(A0_14)
  end
  if errorFlag == 0 then
    errorFlag = "OK"
    db.save()
  else
    errorFlag = "ERROR"
  end
  return errorFlag
end
function ipMacBindingCfgDelall()
  local L0_17, L1_18, L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25
  L0_17 = {}
  L1_18 = db
  L1_18 = L1_18.getTable
  L2_19 = "IPMACBinding"
  L1_18 = L1_18(L2_19)
  if L1_18 ~= nil then
    L2_19 = {}
  else
    if L1_18 == L2_19 then
      L2_19 = "ERROR"
      errorFlag = L2_19
      L2_19 = "No exisiting ip or mac binding rules to delete"
      statusMessage = L2_19
      L2_19 = printCLIError
      L2_19(L3_20)
      L2_19 = errorFlag
      return L2_19, L3_20
  end
  else
    L2_19 = 0
    for L6_23, L7_24 in L3_20(L4_21) do
      L2_19 = L2_19 + 1
      L8_25 = L1_18[L2_19]
      L8_25["ipMacBinding.cookie"] = L8_25["IPMACBinding._ROWID_"]
      errorFlag = ipMacBindingDelete(L8_25)
    end
    if L3_20 == 0 then
      errorFlag = L3_20
    else
      errorFlag = L3_20
      return L3_20
    end
  end
  L2_19 = errorFlag
  if L2_19 == "OK" then
    L2_19 = db
    L2_19 = L2_19.save
    L2_19()
  end
  L2_19 = errorFlag
  return L2_19
end
function ipMacBindingCfgInputVal(A0_26)
  if A0_26["IPMACBinding.SourceMACAddress"] == "" then
    printCLIError("Enter valid ip/mac binding source mac address\n")
    return false
  end
  if A0_26["IPMACBinding.IPAddress"] == "" or A0_26["IPMACBinding.IPAddress"] == "0.0.0.0" or A0_26["IPMACBinding.IPAddress"] == nil then
    printCLIError("Enter valid ip/mac binding ip address\n")
    return false
  end
  if A0_26["IPMACBinding._ROWID_"] == "-1" then
    if #db.getTable("IPMACBinding") >= IP_MAC_LIMIT then
      printCLIError("Maximum Entries are added.")
      return false
    end
    if A0_26["IPMACBinding.Name"] == "" then
      printCLIError("Enter valid Host name\n")
      return false
    end
    if db.existsRow("IPMACBinding", "SourceMACAddress", A0_26["IPMACBinding.SourceMACAddress"]) then
      printCLIError("Configured MAC Address Is Already Existing")
      return false
    end
    if _UPVALUE0_.checkIpv4Address(A0_26["IPMACBinding.IPAddress"]) ~= true then
      printCLIError("IP Address is Invalid. Octet 1 should be in 1-223 and Octet 4 should be in 1-254 range.")
      return false
    end
    if db.existsRow("IPMACBinding", "IPAddress", A0_26["IPMACBinding.IPAddress"]) then
      printCLIError("Configured Ip Address Is Already Existing")
      return false
    end
    if db.existsRow("IPMACBinding", "Name", A0_26["IPMACBinding.Name"]) then
      printCLIError("Configured Host Name Is Already Existing")
      return false
    end
  end
  if A0_26["IPMACBinding.LogStatus"] == "" then
    printCLIError("Enter valid ip/mac binding logging status\n")
    return false
  end
  if A0_26["IPMACBinding.AssociatingEnabled"] == "" then
    A0_26["IPMACBinding.AssociatingEnabled"] = 0
  end
  if _UPVALUE0_.isMulticastMac(A0_26["IPMACBinding.SourceMACAddress"]) == true then
    printCLIError("Multicast Mac Address is not allowed.\n")
    return false
  end
  return true
end
function ipMacBindingCfgGet(A0_27)
  local L1_28, L2_29
  L1_28 = {}
  L2_29 = printLabel
  L2_29("IP/MAC Binding")
  L2_29 = print
  L2_29("List of Available IP/MAC Bindings\n")
  L2_29 = db
  L2_29 = L2_29.getTable
  L2_29 = L2_29("IPMACBinding")
  for _FORV_7_, _FORV_8_ in pairs(L2_29) do
    resTab.insertField(L1_28, "ROW ID", L2_29[0 + 1]["IPMACBinding._ROWID_"] or "")
    resTab.insertField(L1_28, "Host Name", L2_29[0 + 1]["IPMACBinding.Name"] or "")
    resTab.insertField(L1_28, "MAC Address", L2_29[0 + 1]["IPMACBinding.SourceMACAddress"] or "")
    resTab.insertField(L1_28, "IP Address", L2_29[0 + 1]["IPMACBinding.IPAddress"] or "")
    if L2_29[0 + 1]["IPMACBinding.LogStatus"] == "1" then
      resTab.insertField(L1_28, "Log Dropped Packets", "Enabled")
    else
      resTab.insertField(L1_28, "Log Dropped Packets", "Disabled")
    end
  end
  resTab.print(L1_28, 0)
end
function ipMacBinding_dhcpVal(A0_30)
  local L1_31, L2_32, L3_33, L4_34, L5_35, L6_36, L7_37, L8_38, L9_39, L10_40
  L1_31 = "logicalIfName !='DMZ'"
  L2_32 = db
  L2_32 = L2_32.getRowsWhere
  L2_32 = L2_32(L3_33, L4_34)
  for L6_36, L7_37 in L3_33(L4_34) do
    L8_38 = L7_37["dhcp.startAddress"]
    L9_39 = util
    L9_39 = L9_39.split
    L10_40 = L8_38
    L9_39 = L9_39(L10_40, ".")
    L10_40 = L7_37["dhcp.endAddress"]
    if tonumber(L9_39[3]) == tonumber(util.split(A0_30, ".")[3]) and (tonumber(L9_39[4]) > tonumber(util.split(A0_30, ".")[4]) or tonumber(util.split(L10_40, ".")[4]) < tonumber(util.split(A0_30, ".")[4])) then
      return true
    end
  end
  return L3_33
end
