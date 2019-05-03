local L0_0
L0_0 = require
L0_0("teamf1lualib/fwView")
L0_0 = require
L0_0("teamf1lualib/ul_contentFiltering")
L0_0 = require
L0_0("teamf1lualib/admin_license")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/urlFilteringAccessControl_bl")
L0_0 = require
L0_0("teamf1lualib/blockedKeywords_bl")
L0_0 = require
L0_0("teamf1lualib/errorMap")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.admin.license")
if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-1000" or UNIT_NAME == "DSR-1000N" then
elseif UNIT_NAME == "DSR-500AC" or UNIT_NAME == "DSR-500" or UNIT_NAME == "DSR-500N" then
elseif UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-250N" then
elseif UNIT_NAME == "DSR-150" or UNIT_NAME == "DSR-150N" then
end
function contentFilteringCfgInit(A0_1)
  local L1_2
  L1_2 = db
  L1_2 = L1_2.getRow
  L1_2 = L1_2("ContentFiltering", "_ROWID_", "1")
  configRow = L1_2
  L1_2 = db
  L1_2 = L1_2.getRow
  L1_2 = L1_2("WebComponents", "_ROWID_", "1")
  configRow = util.tableAppend(configRow, L1_2)
  return 1, configRow
end
function contentFilteringCfgSave(A0_3)
  errorFlag = "ERROR"
  statusCode = ""
  statusMessage = ""
  DBTable = "ContentFiltering"
  if A0_3["ContentFiltering.Status"] == "1" then
    if _UPVALUE0_.contentFilteringEnable() == "0" then
      printCLIError("Error in configuring contentFiltering.")
      return false
    end
  elseif A0_3["ContentFiltering.Status"] == "0" and _UPVALUE0_.contentFilteringDisable() == "0" then
    printCLIError("Error in configuring contentFiltering.")
    return false
  end
  errorFlag, statusCode = fwView.contentFileteringConfig(A0_3, "1", "edit")
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  return errorFlag, statusMessage
end
function contentFilteringCfgInputVal(A0_4)
  if db.getAttribute("contentFiltering", "_ROWID_", "1", "Status") == "0" and A0_4["ContentFiltering.Status"] == "0" then
    printCLIError("Content filter is already disabled.")
    return false
  end
  return true
end
function contentFilteringCfgGet(A0_5)
  if db.getRow("ContentFiltering", "_ROWID_", "1") == nil and db.getRow("WebComponents", "_ROWID_", "1") == nil then
    print("Content Filtering Configurations Not Available\n")
  else
    printLabel("Content Filtering")
    print("WAN Security Checks\n")
    if db.getRow("ContentFiltering", "_ROWID_", "1")["ContentFiltering.Status"] == "1" then
      print("Content Filtering : Enabled\n")
    else
      print("Content Filtering : Disabled\n")
    end
    print("LAN Security Checks\n")
    if db.getRow("WebComponents", "_ROWID_", "1")["WebComponents.ProxyEnable"] == "1" then
      print("Proxy : Enabled\n")
    else
      print("Proxy : Disabled\n")
    end
    if db.getRow("WebComponents", "_ROWID_", "1")["WebComponents.JavaComponentEnable"] == "1" then
      print("Java : Enabled\n")
    else
      print("Java : Disabled\n")
    end
    if db.getRow("WebComponents", "_ROWID_", "1")["WebComponents.ActivexControlEnable"] == "1" then
      print("ActiveX : Enabled\n")
    else
      print("ActiveX : Disabled\n")
    end
    if db.getRow("WebComponents", "_ROWID_", "1")["WebComponents.CookiesEnable"] == "1" then
      print("Cookies : Enabled\n")
    else
      print("Cookies : Disabled\n")
    end
  end
end
function trustedDomainsCfgInit(A0_6)
  RowId = A0_6[1]
  if RowId == nil then
    configRow = db.getDefaults(true, "TrustedDomains")
  else
    configRow = db.getRow("TrustedDomains", "TrustedDomains._ROWID_", RowId)
  end
  if configRow == nil then
    print("Row doesnt exist probably deleted. Please exit from this mode\n")
    return -1, {}
  end
  return 1, configRow
end
function trustedDomainsCfgSave(A0_7)
  errorFlag = ""
  statusCode = ""
  statusMessage = ""
  DBTable = "TrustedDomains"
  RowId = A0_7["TrustedDomains._ROWID_"]
  if RowId == nil then
    if db.getRowsWhere(DBTable, " KeywordToAllow is NOT NULL") ~= nil and #db.getRowsWhere(DBTable, " KeywordToAllow is NOT NULL") >= _UPVALUE0_ then
      statusMessage = "Maximum limit for approved URLs is reached."
      return "ERROR", statusMessage
    end
    A0_7["TrustedDomains.OID"] = nil
    errorFlag, statusCode = fwView.trustedDomainConfig(A0_7, "-1", "add")
  else
    errorFlag, statusCode = fwView.trustedDomainConfig(A0_7, RowId, "edit")
  end
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  return errorFlag, statusMessage
end
function trustedDomainsCfgDel(A0_8)
  local L1_9
  L1_9 = ""
  errorFlag = L1_9
  L1_9 = ""
  statusCode = L1_9
  L1_9 = ""
  statusMessage = L1_9
  L1_9 = "TrustedDomains"
  DBTable = L1_9
  L1_9 = {}
  rows = L1_9
  L1_9 = {}
  L1_9 = db.getRow("TrustedDomains", "_ROWID_", A0_8[1])
  if L1_9 == nil then
    errorFlag = "ERROR"
    statusMessage = "Row doesnt exist"
    printCLIError("Row doesnt exist")
    return errorFlag, statusMessage
  else
    rows.rowid = L1_9["TrustedDomains._ROWID_"]
    if rows then
      errorFlag, statusCode = fwView.deleteDomains(rows)
    end
    if errorFlag == "OK" then
      db.save()
    end
    statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  end
  return errorFlag, statusMessage
end
function trustedDomainsCfgInputVal(A0_10)
  local L1_11, L2_12
  L1_11 = db
  L1_11 = L1_11.getRow
  L2_12 = "ContentFiltering"
  L1_11 = L1_11(L2_12, "_ROWID_", "1")
  L2_12 = L1_11["ContentFiltering.Status"]
  if L2_12 == "0" then
    L2_12 = printCLIError
    L2_12("please Enable content filtering first")
    L2_12 = false
    return L2_12
  end
  L2_12 = A0_10["TrustedDomains.KeywordToAllow"]
  if L2_12 ~= nil then
    L2_12 = A0_10["TrustedDomains.KeywordToAllow"]
  elseif L2_12 == "" then
    L2_12 = printCLIError
    L2_12("please enter a valid url")
    L2_12 = false
    return L2_12
  end
  L2_12 = urlValidation
  L2_12 = L2_12(A0_10["TrustedDomains.KeywordToAllow"])
  if not L2_12 then
    printCLIError("Please enter a valid url")
    return false
  end
  L2_12 = urlProtocolCheck(A0_10["TrustedDomains.KeywordToAllow"])
  if not L2_12 then
    printCLIError("Please enter a valid url without protocol specification")
    return false
  end
  return true
end
function urlFilteringACLProfileCfgInit(A0_13)
  RowId = A0_13[1]
  if RowId == nil then
    configRow = db.getDefaults(true, "urlFilteringAccessControlPolicy")
  else
    configRow = db.getRow("urlFilteringAccessControlPolicy", "urlFilteringAccessControlPolicy._ROWID_", RowId)
  end
  if configRow == nil then
    print("Row doesnt exist probably deleted. Please exit from this mode.\n")
    return -1, {}
  end
  return 1, configRow
end
function urlFilteringACLProfileCfgSave(A0_14)
  local L1_15, L2_16
  L1_15 = ""
  errorFlag = L1_15
  L1_15 = ""
  statusCode = L1_15
  L1_15 = ""
  statusMessage = L1_15
  L1_15 = "urlFilteringAccessControlPolicy"
  DBTable = L1_15
  L1_15 = nil
  L2_16 = A0_14["urlFilteringAccessControlPolicy._ROWID_"]
  RowId = L2_16
  L2_16 = RowId
  if L2_16 == nil then
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.urlFilteringACLPolicySectionCreate
    L1_15, L2_16 = A0_14, L2_16(A0_14)
    errorFlag = L2_16
    L2_16 = _UPVALUE1_
    L2_16 = L2_16.errorStringGet
    L2_16 = L2_16(errorFlag)
    statusMessage = L2_16
  else
    L2_16 = A0_14["urlFilteringAccessControlPolicy._ROWID_"]
    if (db.getAttribute("urlFilteringAccessControlPolicy", "_ROWID_", L2_16, "policyName") ~= nil or db.getAttribute("urlFilteringAccessControlPolicy", "_ROWID_", L2_16, "policyName") ~= "") and db.getAttribute("urlFilteringAccessControlPolicy", "_ROWID_", L2_16, "policyName") ~= A0_14["urlFilteringACLPolicy.policyName"] then
      printCLIError("Existing Policy name edit is not allowed.")
      return false
    end
    A0_14["urlFilteringACLPolicy.cookie"] = A0_14["urlFilteringAccessControlPolicy._ROWID_"]
    errorFlag, L1_15 = _UPVALUE0_.urlFilteringACLPolicySectionSet(A0_14)
    statusMessage = _UPVALUE1_.errorStringGet(errorFlag)
  end
  L2_16 = errorFlag
  if L2_16 == 0 then
    L2_16 = "OK"
    errorFlag = L2_16
    L2_16 = db
    L2_16 = L2_16.save
    L2_16()
  else
    L2_16 = "ERROR"
    errorFlag = L2_16
  end
  L2_16 = errorFlag
  return L2_16, statusMessage
end
function urlFilteringACLProfileCfgDel(A0_17)
  local L1_18, L2_19
  L1_18 = ""
  errorFlag = L1_18
  L1_18 = ""
  statusCode = L1_18
  L1_18 = ""
  statusMessage = L1_18
  L1_18 = nil
  L2_19 = "urlFilteringAccessControlPolicy"
  DBTable = L2_19
  L2_19 = {}
  L2_19 = db.getRow("urlFilteringAccessControlPolicy", "_ROWID_", A0_17[1])
  if L2_19 == nil then
    errorFlag = "ERROR"
    statusMessage = "Row doesnt exist"
    printCLIError("Row doesnt exist")
    return errorFlag, statusMessage
  else
    L2_19["urlFilteringACLPolicy.cookie"] = L2_19["urlFilteringAccessControlPolicy._ROWID_"]
    errorFlag, L1_18 = _UPVALUE0_.urlFilteringACLPolicySectionDelete(L2_19)
    statusMessage = _UPVALUE1_.errorStringGet(errorFlag)
  end
  if errorFlag == 0 then
    errorFlag = "OK"
    db.save()
  else
    errorFlag = "ERROR"
  end
  return errorFlag, statusMessage
end
function urlFilteringACLProfileCfgDelall()
  local L0_20, L1_21
  L0_20 = "ERROR"
  L1_21 = {}
  L1_21 = db.getTable("urlFilteringAccessControlPolicy")
  if L1_21 == nil then
    return "ERROR", "No exisitng routes to delete"
  else
    L0_20 = _UPVALUE0_.urlFilteringACLPolicySectionDeleteAll()
  end
  if L0_20 == 0 then
    L0_20 = "OK"
    db.save()
  else
    L0_20 = "ERROR"
  end
  return L0_20
end
function urlFilteringACLProfileCfgInputVal(A0_22)
  if db.getRow("urlFilteringAccessControl", "_ROWID_", "1")["urlFilteringAccessControl.enable"] == "0" then
    printCLIError("please Enable URL filtering ACL first")
    return false
  end
  if A0_22["urlFilteringACLPolicy.policyName"] == nil or A0_22["urlFilteringACLPolicy.policyName"] == "" then
    printCLIError("please gave valid policy name")
    return false
  end
  if A0_22["urlFilteringACLPolicy.policyType"] == nil or A0_22["urlFilteringACLPolicy.policyType"] == "" then
    printCLIError("please select valid policy Type")
    return false
  end
  if A0_22["urlFilteringACLPolicy.policyType"] == "0" then
    if A0_22["urlFilteringACLPolicy.ipAddress"] == nil or A0_22["urlFilteringACLPolicy.ipAddress"] == "" or A0_22["urlFilteringACLPolicy.ipAddress"] == "0.0.0.0" then
      printCLIError("Invalid ip address")
      return false
    end
    if _UPVALUE0_.checkFirewallIPAddress(A0_22["urlFilteringACLPolicy.ipAddress"]) ~= true then
      printCLIError("IP Address is Invalid.Octet 1 should be in 1-223 and 1-254 for octet 4.")
      return false
    end
    if tonumber(util.split(A0_22["urlFilteringACLPolicy.ipAddress"], ".")[4]) == 255 or tonumber(util.split(A0_22["urlFilteringACLPolicy.ipAddress"], ".")[4]) > 254 or tonumber(util.split(A0_22["urlFilteringACLPolicy.ipAddress"], ".")[4]) == 0 then
      printCLIError("Invalid IP address. Please enter a value between 1 - 254 for octet 4")
      return false
    end
  end
  if A0_22["urlFilteringACLPolicy.policyType"] == "1" then
    if A0_22["urlFilteringACLPolicy.startIpAddress"] == nil or A0_22["urlFilteringACLPolicy.startIpAddress"] == "" or A0_22["urlFilteringACLPolicy.startIpAddress"] == "0.0.0.0" then
      printCLIError("Invalid source_address_start")
      return false
    end
    if _UPVALUE0_.checkFirewallIPAddress(A0_22["urlFilteringACLPolicy.startIpAddress"]) ~= true then
      printCLIError("Source Start IP Address is Invalid.Octet 1 should be in 1-223 and 1-254 for octet 4.")
      return false
    end
    if tonumber(util.split(A0_22["urlFilteringACLPolicy.startIpAddress"], ".")[4]) == 255 or 254 < tonumber(util.split(A0_22["urlFilteringACLPolicy.startIpAddress"], ".")[4]) or tonumber(util.split(A0_22["urlFilteringACLPolicy.startIpAddress"], ".")[4]) == 0 then
      printCLIError("Invalid source Start IP address. Please enter a value between 1 - 254 for octet 4")
      return false
    end
    if A0_22["urlFilteringACLPolicy.endIpAddress"] == nil or A0_22["urlFilteringACLPolicy.endIpAddress"] == "" or A0_22["urlFilteringACLPolicy.endIpAddress"] == "0.0.0.0" then
      printCLIError("Invalid source_address_start")
      return false
    end
    if _UPVALUE0_.checkFirewallIPAddress(A0_22["urlFilteringACLPolicy.endIpAddress"]) ~= true then
      printCLIError("Source end IP Address is Invalid.Octet 1 should be in 1-223 and 1-254 for octet 4.")
      return false
    end
    if tonumber(util.split(A0_22["urlFilteringACLPolicy.endIpAddress"], ".")[4]) == 255 or 254 < tonumber(util.split(A0_22["urlFilteringACLPolicy.endIpAddress"], ".")[4]) or tonumber(util.split(A0_22["urlFilteringACLPolicy.endIpAddress"], ".")[4]) == 0 then
      printCLIError("Invalid Source end IP address. Please enter a value between 1 - 254 for octet 4")
      return false
    end
  end
  if A0_22["urlFilteringACLPolicy.policyType"] == "2" and (A0_22["urlFilteringACLPolicy.interfaceName"] == nil or A0_22["urlFilteringACLPolicy.interfaceName"] == "") then
    printCLIError("Please select atleast one Interface from vlans")
    return false
  end
  return true
end
function urlFilteringACLCfgInit(A0_23)
  RowId = A0_23[1]
  if RowId == nil then
    configRow = db.getDefaults(true, "urlFilteringAccessControl")
  else
    configRow = db.getRow("urlFilteringAccessControl", "urlFilteringAccessControl._ROWID_", RowId)
  end
  if configRow == nil then
    print("Row doesnt exist probably deleted. Please exit from this mode.\n")
    return -1, {}
  end
  return 1, configRow
end
function urlFilteringACLCfgSave(A0_24)
  local L1_25
  L1_25 = ""
  errorFlag = L1_25
  L1_25 = ""
  statusCode = L1_25
  L1_25 = ""
  statusMessage = L1_25
  L1_25 = nil
  errorFlag, L1_25 = _UPVALUE0_.urlFilteringAccessControlSectionSet(A0_24)
  statusMessage = _UPVALUE1_.errorStringGet(errorFlag)
  if errorFlag == 0 then
    errorFlag = "OK"
    db.save()
  else
    errorFlag = "ERROR"
  end
  return errorFlag, statusMessage
end
function urlFilteringACLCfgInputVal(A0_26)
  if db.getRow("ContentFiltering", "_ROWID_", "1")["ContentFiltering.Status"] == "0" then
    printCLIError("please Enable content filtering first.")
    return false
  end
  if A0_26["urlFilteringAccessControl.enable"] == nil or A0_26["urlFilteringAccessControl.enable"] == "" then
    printCLIError("please select valid action enable/disable.")
    return false
  end
  if A0_26["urlFilteringAccessControl.action"] == nil or A0_26["urlFilteringAccessControl.action"] == "" then
    printCLIError("please select valid action black/white list.")
    return false
  end
  return true
end
function urlValidation(A0_27)
  local L1_28, L2_29, L3_30, L4_31, L5_32, L6_33, L7_34, L8_35
  L1_28 = false
  valid = L1_28
  if A0_27 ~= nil then
    L1_28 = string
    L1_28 = L1_28.len
    L1_28 = L1_28(L2_29)
  elseif L1_28 > L2_29 then
    L1_28 = valid
    return L1_28
  end
  L1_28 = ""
  for L5_32 in L2_29(L3_30, L4_31) do
    L7_34 = L5_32
    L1_28 = L6_33 .. L7_34
  end
  if L2_29 then
    return L2_29
  end
  if L3_30 ~= "." then
    if L3_30 ~= "-" then
      if L3_30 ~= ":" then
        if L3_30 ~= "/" then
          if L3_30 ~= "." then
            if L3_30 ~= "-" then
              if L3_30 ~= ":" then
              end
            end
          end
        end
      end
    end
  elseif L3_30 == "/" then
    return L3_30
  end
  for L7_34, L8_35 in L4_31(L5_32) do
    if L2_29 < 1 or L2_29 > _UPVALUE1_ then
      return valid
    end
  end
  valid = L4_31
  return L4_31
end
function urlProtocolCheck(A0_36)
  local L1_37, L2_38, L3_39
  L1_37 = false
  valid = L1_37
  L1_37, L2_38, L3_39 = nil, nil, nil
  L1_37, L2_38, L3_39 = A0_36:find("^([a-zA-Z][-+.a-zA-Z0-9]*):")
  if L3_39 then
    return valid
  end
  valid = true
  return valid
end
function trustedDomainsCfgGet(A0_40)
  local L1_41, L2_42, L3_43
  L1_41 = {}
  L2_42 = print
  L3_43 = "List of available  Approved URLS"
  L2_42(L3_43)
  L2_42 = 0
  L3_43 = db
  L3_43 = L3_43.getTable
  L3_43 = L3_43("TrustedDomains")
  if L3_43 == nil then
    print("trusted domains configurations unavailable")
  else
    for _FORV_7_, _FORV_8_ in pairs(L3_43) do
      L2_42 = L2_42 + 1
      if L2_42 ~= nil then
        resTab.insertField(L1_41, "ROW ID", L3_43[L2_42]["TrustedDomains._ROWID_"] or "")
        resTab.insertField(L1_41, "Domain", L3_43[L2_42]["TrustedDomains.KeywordToAllow"] or "")
        resTab.insertField(L1_41, "Protocol", "HTTP")
      end
    end
  end
  resTab.print(L1_41, 0)
end
function blockedKeywordsCfgInit(A0_44)
  RowId = A0_44[1]
  if RowId == nil then
    configRow = db.getDefaults(true, "BlockSites")
  else
    configRow = db.getRow("BlockSites", "BlockSites._ROWID_", RowId)
  end
  if configRow == nil then
    print("Row doesnt exist probably deleted. Please exit from this mode\n")
    return -1, {}
  end
  return 1, configRow
end
function blockedKeywordsCfgSave(A0_45)
  errorFlag = ""
  statusCode = ""
  statusMessage = ""
  DBTable = "BlockSites"
  RowId = A0_45["BlockSites._ROWID_"]
  if RowId == nil then
    if db.getRowsWhere(DBTable, " KeywordToBlock != '.'") ~= nil and #db.getRowsWhere(DBTable, " KeywordToBlock != '.'") >= _UPVALUE0_ then
      statusMessage = "Maximum limit for blocked URLs is reached."
      return "ERROR", statusMessage
    end
    A0_45["BlockSites.OID"] = nil
    A0_45["BlockSites.KeywordBlockingTo"] = "1"
    A0_45["BlockSites.Status"] = "1"
    errorFlag, statusCode = fwView.blockedKeywordConfig(A0_45, "-1", "add")
  else
    errorFlag, statusCode = fwView.blockedKeywordConfig(A0_45, RowId, "edit")
  end
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  return errorFlag, statusMessage
end
function blockedKeywordsCfgDel(A0_46)
  local L1_47
  L1_47 = ""
  errorFlag = L1_47
  L1_47 = ""
  statusCode = L1_47
  L1_47 = ""
  statusMessage = L1_47
  L1_47 = "BlockSites"
  DBTable = L1_47
  L1_47 = {}
  rows = L1_47
  L1_47 = {}
  L1_47 = db.getRow("BlockSites", "_ROWID_", A0_46[1])
  if L1_47 == nil then
    errorFlag = "ERROR"
    statusMessage = "Row doesnt exist"
    printCLIError("Row doesnt exist")
    return errorFlag, statusMessage
  else
    rows.rowid = L1_47["BlockSites._ROWID_"]
    if rows then
      errorFlag, statusCode = fwView.deleteKeywords(rows)
    end
    if errorFlag == "OK" then
      db.save()
    end
    statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  end
  return errorFlag, statusMessage
end
function blockedKeywordsCfgInputVal(A0_48)
  local L1_49, L2_50
  L1_49 = db
  L1_49 = L1_49.getRow
  L2_50 = "ContentFiltering"
  L1_49 = L1_49(L2_50, "_ROWID_", "1")
  L2_50 = L1_49["ContentFiltering.Status"]
  if L2_50 == "0" then
    L2_50 = printCLIError
    L2_50("please Enable content filtering first")
    L2_50 = false
    return L2_50
  end
  L2_50 = A0_48["BlockSites.KeywordToBlock"]
  if L2_50 ~= nil then
    L2_50 = A0_48["BlockSites.KeywordToBlock"]
  elseif L2_50 == "" then
    L2_50 = printCLIError
    L2_50("Enter valid blocked_URL")
    L2_50 = false
    return L2_50
  end
  L2_50 = urlValidation
  L2_50 = L2_50(A0_48["BlockSites.KeywordToBlock"])
  if not L2_50 then
    printCLIError("Please enter a valid url")
    return false
  end
  L2_50 = urlProtocolCheck(A0_48["BlockSites.KeywordToBlock"])
  if not L2_50 then
    printCLIError("Please enter a valid url without protocol specification")
    return false
  end
  return true
end
function blockedallKeywordsCfgInit(A0_51)
  RowId = A0_51[1]
  if RowId == nil then
    configRow = db.getDefaults(true, "BlockSites")
  else
    configRow = db.getRow("BlockSites", "BlockSites._ROWID_", RowId)
  end
  if configRow == nil then
    print("Row doesnt exist probably deleted. Please exit from this mode\n")
    return -1, {}
  end
  return 1, configRow
end
function blockedallKeywordsCfgSave(A0_52)
  errorFlag = ""
  statusCode = ""
  statusMessage = ""
  DBTable = "BlockSites"
  RowId = A0_52["BlockSites._ROWID_"]
  A0_52["blockAllURLStatus.Status"] = A0_52["BlockSites.KeywordToBlock"]
  if RowId == nil then
    errorFlag = _UPVALUE0_.blockAllURLConfig(A0_52)
  else
    errorFlag = _UPVALUE0_.blockAllURLConfig(A0_52)
  end
  statusMessage = _UPVALUE1_.errorStringGet(errorFlag)
  if errorFlag == returnCodes.SUCCESS then
    errorFlag = "OK"
    db.save()
  else
    errorFlag = "ERROR"
  end
  return errorFlag, statusMessage
end
function blockedallKeywordsCfgInputVal(A0_53)
  if db.getRow("ContentFiltering", "_ROWID_", "1")["ContentFiltering.Status"] == "0" then
    printCLIError("please Enable content filtering first")
    return false
  end
  if A0_53["BlockSites.KeywordToBlock"] == nil or A0_53["BlockSites.KeywordToBlock"] == "" then
    printCLIError("Please select the valid option to enable/disable block all url feature")
    return false
  end
  return true
end
function blockedKeywordsStatusModify(A0_54)
  local L1_55
  L1_55 = "BlockSites"
  DBTable = L1_55
  L1_55 = {}
  rows = L1_55
  L1_55 = {}
  L1_55 = db.getRow("BlockSites", "_ROWID_", A0_54[1])
  if L1_55 == nil then
    errorFlag = "ERROR"
    statusMessage = "Row doesnt exist"
    printCLIError("Row doesnt exist")
    return errorFlag, statusMessage
  else
    rows.rowid = A0_54[1]
    if rows then
      errorFlag, statusCode = fwView.modifyKeywordStatus(rows, A0_54[2])
    end
    if errorFlag == "OK" then
      db.save()
    end
    statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  end
  return errorFlag, statusMessage
end
function blockedKeywordsCfgGet(A0_56)
  local L1_57, L2_58, L3_59, L4_60
  L1_57 = {}
  L2_58 = printLabel
  L3_59 = "Blocked URLs"
  L2_58(L3_59)
  L2_58 = print
  L3_59 = "List of available Blocked URLs\n"
  L2_58(L3_59)
  L2_58 = 0
  L3_59 = ""
  L4_60 = db
  L4_60 = L4_60.getTable
  L4_60 = L4_60("BlockSites")
  if L4_60 == nil then
    print("Blocked URLs configuration unavailable")
  else
    for _FORV_8_, _FORV_9_ in pairs(L4_60) do
      L2_58 = L2_58 + 1
      if L2_58 ~= nil then
        resTab.insertField(L1_57, "ROW ID", L4_60[L2_58]["BlockSites._ROWID_"] or "")
        if L4_60[L2_58]["BlockSites.Status"] == "1" then
          L3_59 = "Enabled"
        elseif L4_60[L2_58]["BlockSites.Status"] == "0" then
          L3_59 = "Disabled"
        end
        resTab.insertField(L1_57, "Status", L3_59)
        resTab.insertField(L1_57, "Blocked Keyword ", L4_60[L2_58]["BlockSites.KeywordToBlock"] or "")
      end
    end
  end
  resTab.print(L1_57, 0)
end
function urlFilteringACLProfileCfgGet(A0_61)
  local L1_62, L2_63, L3_64, L4_65
  L1_62 = db
  L1_62 = L1_62.getRow
  L2_63 = "urlFilteringAccessControl"
  L3_64 = "_ROWID_"
  L4_65 = "1"
  L1_62 = L1_62(L2_63, L3_64, L4_65)
  L2_63 = printLabel
  L3_64 = "URL filtering ACL"
  L2_63(L3_64)
  L2_63 = L1_62["urlFilteringAccessControl.enable"]
  if L2_63 == "1" then
    L2_63 = print
    L3_64 = "URL filtering ACL : Enabled\n"
    L2_63(L3_64)
  else
    L2_63 = print
    L3_64 = "URL filtering ACL : Disabled\n"
    L2_63(L3_64)
  end
  L2_63 = L1_62["urlFilteringAccessControl.action"]
  if L2_63 == "1" then
    L2_63 = print
    L3_64 = "Action : White List\n"
    L2_63(L3_64)
  else
    L2_63 = print
    L3_64 = "Action : Black List\n"
    L2_63(L3_64)
  end
  L2_63 = {}
  L3_64 = print
  L4_65 = "List of available URL filtering ACL profiles"
  L3_64(L4_65)
  L3_64 = 0
  L4_65 = db
  L4_65 = L4_65.getTable
  L4_65 = L4_65("urlFilteringAccessControlPolicy")
  if L4_65 == nil then
    print("URL filtering ACL profiles configurations unavailable")
  else
    for _FORV_8_, _FORV_9_ in pairs(L4_65) do
      L3_64 = L3_64 + 1
      if L3_64 ~= nil then
        resTab.insertField(L2_63, "ROW ID", L4_65[L3_64]["urlFilteringAccessControlPolicy._ROWID_"] or "")
        resTab.insertField(L2_63, "policy Name", L4_65[L3_64]["urlFilteringAccessControlPolicy.policyName"] or "")
        if L4_65[L3_64]["urlFilteringAccessControlPolicy.policyType"] == "0" then
          L4_65[L3_64]["urlFilteringAccessControlPolicy.policyType"] = "SINGLE_IP"
        elseif L4_65[L3_64]["urlFilteringAccessControlPolicy.policyType"] == "1" then
          L4_65[L3_64]["urlFilteringAccessControlPolicy.policyType"] = "ADDRESS_RANGE"
        else
          L4_65[L3_64]["urlFilteringAccessControlPolicy.policyType"] = "INTERFACE"
        end
        resTab.insertField(L2_63, "policy Type", L4_65[L3_64]["urlFilteringAccessControlPolicy.policyType"] or "")
        resTab.insertField(L2_63, "ip address ", L4_65[L3_64]["urlFilteringAccessControlPolicy.ipAddress"] or "")
        resTab.insertField(L2_63, "start address", L4_65[L3_64]["urlFilteringAccessControlPolicy.startIpAddress"] or "")
        resTab.insertField(L2_63, "end address", L4_65[L3_64]["urlFilteringAccessControlPolicy.endIpAddress"] or "")
        resTab.insertField(L2_63, "interaface", L4_65[L3_64]["urlFilteringAccessControlPolicy.interfaceName"] or "")
      end
    end
  end
  resTab.print(L2_63, 0)
end
