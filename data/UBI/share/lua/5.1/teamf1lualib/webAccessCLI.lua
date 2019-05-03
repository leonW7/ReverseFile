require("teamf1lualib/webAccess")
function webAccessStatusConfig(A0_0)
  local L1_1, L2_2, L3_3, L4_4
  L1_1 = "ERROR"
  L2_2 = ""
  L3_3 = ""
  L4_4 = {}
  L4_4["webAccessStatus.accessStatus"] = A0_0
  L1_1, L2_2 = webAccess.statusConfig(L4_4, "1", "edit")
  if L1_1 == "OK" then
    db.save()
  end
  L3_3 = db.getAttribute("stringsMap", "stringId", L2_2, LANGUAGE)
  return L1_1, L3_3
end
function webAccessInfoCfgInit(A0_5)
  local L1_6
  L1_6 = A0_5[1]
  if L1_6 == nil then
    configRow = {}
    configRow = db.getDefaults(true, "webAccessInfo")
    configRow["webAccessInfo._ROWID_"] = "-1"
  else
    if tonumber(L1_6) == 1 and A0_5 ~= nil then
      printCLIError("Cannot Edit default web Access Filter profile\n")
      return false
    end
    configRow = db.getRow("webAccessInfo", "_ROWID_", L1_6)
    if configRow == nil then
      print("Row ID does not exit")
      return -1, {}
    end
  end
  return configRow["webAccessInfo._ROWID_"], configRow
end
function webAccessInfoCfgSave(A0_7)
  local L1_8, L2_9, L3_10
  L1_8 = "Error"
  L2_9 = ""
  L3_10 = ""
  DBTable = "webAccessInfo"
  if A0_7["webAccessInfo._ROWID_"] == "-1" or A0_7["webAccessInfo._ROWID_"] == nil then
    L1_8, L2_9 = webAccess.infoConfig(A0_7, A0_7["webAccessInfo._ROWID_"], "add")
  else
    if db.getRow("webAccessInfo", "_ROWID_", A0_7["webAccessInfo._ROWID_"]) == nil then
      L1_8 = "ERROR"
      L3_10 = "Row doesnt exist"
      printCLIError("Row doesnt exist")
      return L1_8, L3_10
    end
    L1_8, L2_9 = webAccess.infoConfig(A0_7, A0_7["webAccessInfo._ROWID_"], "edit")
  end
  if L1_8 == "OK" then
    db.save()
  end
  L3_10 = db.getAttribute("stringsMap", "stringId", L2_9, LANGUAGE)
  return L1_8, L3_10
end
function webAccessInfoCfgDel(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17
  L1_12 = "ERROR"
  L2_13 = ""
  L3_14 = ""
  L4_15 = "webAccessInfo"
  DBTable = L4_15
  L4_15 = tonumber
  L5_16 = A0_11
  L4_15 = L4_15(L5_16)
  if L4_15 == 1 and A0_11 ~= nil then
    L4_15 = printCLIError
    L5_16 = "Cannot Delete default web Access Filter profile\n"
    L4_15(L5_16)
    L4_15 = false
    return L4_15
  end
  L4_15 = db
  L4_15 = L4_15.getAttribute
  L5_16 = "webAccessStatus"
  L6_17 = "_ROWID_"
  L4_15 = L4_15(L5_16, L6_17, 1, "accessStatus")
  if L4_15 == "0" then
    L5_16 = printCLIError
    L6_17 = "Please Enable web Access Filter\n"
    L5_16(L6_17)
    L5_16 = false
    return L5_16
  end
  L5_16 = db
  L5_16 = L5_16.getRow
  L6_17 = "webAccessInfo"
  L5_16 = L5_16(L6_17, "_ROWID_", A0_11)
  if L5_16 == nil then
    L1_12 = "ERROR"
    L3_14 = "Row doesnt exist"
    L6_17 = printCLIError
    L6_17("Row doesnt exist")
    L6_17 = L1_12
    return L6_17, L3_14
  end
  L6_17 = {}
  L6_17.rowid = L5_16["webAccessInfo._ROWID_"]
  L1_12, L2_13 = webAccess.infoDelete(L6_17)
  if L1_12 == "OK" then
    db.save()
  end
  L3_14 = db.getAttribute("stringsMap", "stringId", L2_13, LANGUAGE)
  return L1_12, L3_14
end
function webAccessInfoCfgInputVal(A0_18)
  local L1_19, L2_20
  L1_19 = db
  L1_19 = L1_19.getAttribute
  L2_20 = "webAccessStatus"
  L1_19 = L1_19(L2_20, "_ROWID_", 1, "accessStatus")
  if L1_19 == "0" then
    L2_20 = printCLIError
    L2_20("Please Enable web Access Filter\n")
    L2_20 = false
    return L2_20
  end
  L2_20 = A0_18["webAccessInfo.name"]
  if L2_20 ~= "" then
    L2_20 = A0_18["webAccessInfo.name"]
  elseif L2_20 == nil then
    L2_20 = printCLIError
    L2_20("Enter valid Name\n")
    L2_20 = false
    return L2_20
  end
  L2_20 = A0_18["webAccessInfo.accessType"]
  if L2_20 ~= "" then
    L2_20 = A0_18["webAccessInfo.accessType"]
  elseif L2_20 == nil then
    L2_20 = printCLIError
    L2_20("Enter valid access type\n")
    L2_20 = false
    return L2_20
  end
  L2_20 = A0_18["webAccessInfo.accessType"]
  if L2_20 == "0" then
    L2_20 = A0_18["webAccessInfo.IpAddr"]
    if L2_20 ~= "" then
      L2_20 = A0_18["webAccessInfo.IpAddr"]
    elseif L2_20 == nil then
      L2_20 = printCLIError
      L2_20("Enter valid IpAddress\n")
      L2_20 = false
      return L2_20
    end
  else
    L2_20 = A0_18["webAccessInfo.vlanId"]
    if L2_20 ~= "" then
      L2_20 = A0_18["webAccessInfo.vlanId"]
    elseif L2_20 == nil then
      L2_20 = printCLIError
      L2_20("Enter valid vlan Id\n")
      L2_20 = false
      return L2_20
    end
    L2_20 = A0_18["webAccessInfo.vlanId"]
    if L2_20 == "1" then
      A0_18["webAccessInfo.vlanName"] = "LAN"
    else
      L2_20 = "LAN"
      L2_20 = L2_20 .. A0_18["webAccessInfo.vlanId"]
      A0_18["webAccessInfo.vlanName"] = L2_20
    end
    L2_20 = "AddressFamily = '2' and LogicalIfName = '"
    L2_20 = L2_20 .. A0_18["webAccessInfo.vlanName"] .. "'"
    if db.existsRowWhere("ifStatic", L2_20) then
    else
      printCLIError("Enter valid vlan Id\n")
      return false
    end
  end
  L2_20 = nil
  if A0_18["webAccessInfo._ROWID_"] ~= "-1" then
    L2_20 = "name = '" .. A0_18["webAccessInfo.name"] .. "' and _ROWID_ != '" .. A0_18["webAccessInfo._ROWID_"] .. "'"
    valid = db.getRowWhere("webAccessInfo", L2_20)
    if valid then
      printCLIError("Please enter unique value for Name/Single IP Address/Vlan Network ")
      return false
    end
    if A0_18["webAccessInfo.accessType"] == "0" then
      L2_20 = "accessType = '0' and IpAddr = '" .. A0_18["webAccessInfo.IpAddr"] .. "' and _ROWID_ != '" .. A0_18["webAccessInfo._ROWID_"] .. "'"
      valid = db.getRowWhere("webAccessInfo", L2_20)
      if valid then
        printCLIError("Please enter unique value for Name/Single IP Address/Vlan Network ")
        return false
      end
    else
      L2_20 = "accessType = '1' and vlanName= '" .. A0_18["webAccessInfo.vlanName"] .. "' and _ROWID_ != '" .. A0_18["webAccessInfo._ROWID_"] .. "'"
      valid = db.getRowWhere("webAccessInfo", L2_20)
      if valid then
        printCLIError("Please enter unique value for Name/Single IP Address/Vlan Network ")
        return false
      end
    end
  end
  if A0_18["webAccessInfo._ROWID_"] == "-1" then
    L2_20 = "name = '" .. A0_18["webAccessInfo.name"] .. "'"
    valid = db.getRowWhere("webAccessInfo", L2_20)
    if valid then
      printCLIError("Please enter unique value for Name/Single IP Address/Vlan Network ")
      return false
    end
    if A0_18["webAccessInfo.accessType"] == "0" then
      L2_20 = "accessType = '0' and IpAddr = '" .. A0_18["webAccessInfo.IpAddr"] .. "'"
      valid = db.getRowWhere("webAccessInfo", L2_20)
      if valid then
        printCLIError("Please enter unique value for Name/Single IP Address/Vlan Network ")
        return false
      end
    else
      L2_20 = "accessType = '1' and vlanName= '" .. A0_18["webAccessInfo.vlanName"] .. "'"
      valid = db.getRowWhere("webAccessInfo", L2_20)
      if valid then
        printCLIError("Please enter unique value for Name/Single IP Address/Vlan Network ")
        return false
      end
    end
  end
  return true
end
function webAccessInfoCfgGet()
  local L0_21, L1_22, L2_23, L3_24, L4_25, L5_26, L6_27, L7_28, L8_29, L9_30, L10_31, L11_32, L12_33
  L0_21 = db
  L0_21 = L0_21.getTable
  L1_22 = "webAccessInfo"
  L0_21 = L0_21(L1_22)
  L1_22 = db
  L1_22 = L1_22.getAttribute
  L2_23 = "webAccessStatus"
  L3_24 = "_ROWID_"
  L4_25 = 1
  L1_22 = L1_22(L2_23, L3_24, L4_25, L5_26)
  L2_23 = {}
  L3_24 = nil
  L4_25 = "0"
  L5_26(L6_27)
  if L1_22 == "1" then
    L5_26(L6_27)
    L5_26(L6_27)
    for L8_29, L9_30 in L5_26(L6_27) do
      L4_25 = L4_25 + 1
      L10_31 = L0_21[L4_25]
      if L4_25 == nil then
        L11_32 = resTab
        L11_32 = L11_32.insertField
        L12_33 = L2_23
        L11_32(L12_33, "Port Triggering", "Disabled")
      else
        L11_32 = resTab
        L11_32 = L11_32.insertField
        L12_33 = L2_23
        L11_32(L12_33, "ROW ID", L10_31["webAccessInfo._ROWID_"] or "")
        L11_32 = resTab
        L11_32 = L11_32.insertField
        L12_33 = L2_23
        L11_32(L12_33, "Name", L10_31["webAccessInfo.name"] or "")
        L11_32 = L10_31["webAccessInfo.accessType"]
        if L11_32 == "0" then
          L11_32 = resTab
          L11_32 = L11_32.insertField
          L12_33 = L2_23
          L11_32(L12_33, "AccessType", "Single IpAddr")
          L11_32 = resTab
          L11_32 = L11_32.insertField
          L12_33 = L2_23
          L11_32(L12_33, "IpAdrr / Network", L10_31["webAccessInfo.IpAddr"] or "")
        else
          L11_32 = resTab
          L11_32 = L11_32.insertField
          L12_33 = L2_23
          L11_32(L12_33, "AccessType", "Vlan Network")
          L11_32 = nil
          L12_33 = L10_31["webAccessInfo.vlanName"]
          if L12_33 == "LAN" then
            L11_32 = "Default vlan"
          else
            L12_33 = string
            L12_33 = L12_33.sub
            L12_33 = L12_33(L10_31["webAccessInfo.vlanName"], 4)
            L11_32 = "vlan" .. L12_33
          end
          L12_33 = resTab
          L12_33 = L12_33.insertField
          L12_33(L2_23, "IpAdrr / Network", L11_32 or "")
        end
      end
    end
    L5_26(L6_27, L7_28)
  else
    L5_26(L6_27)
  end
end
