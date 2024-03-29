local L0_0
L0_0 = require
L0_0("teamf1lualib/fwView")
L0_0 = require
L0_0("teamf1lualib/blockedClients_bl")
L0_0 = require
L0_0("teamf1lualib/errorMap")
L0_0 = require
L0_0 = L0_0("com.teamf1.bl.vlan.captiveportalblockedclients")
function customServicesCfgInit(A0_1)
  local L1_2
  L1_2 = A0_1[1]
  configRow = {}
  if L1_2 == nil then
    configRow = db.getDefaults(true, "Services")
    if configRow["Services.DestinationPortStart"] == nil or configRow["Services.DestinationPortStart"] == "" then
      configRow["Services.DestinationPortStart"] = "0"
    end
    if configRow["Services.DestinationPortEnd"] == nil or configRow["Services.DestinationPortEnd"] == "" then
      configRow["Services.DestinationPortEnd"] = "0"
    end
    if configRow["Services.MultiPort"] == nil or configRow["Services.MultiPort"] == "" then
      configRow["Services.MultiPort"] = "0"
    end
  elseif A0_1[2] ~= nil and A0_1[2] == "edit" then
    configRow = db.getRow("Services", "_ROWID_", L1_2)
    if configRow == nil then
      print("Row does not exist")
      return -1, {}
    end
    configRow.operation = A0_1[2]
  else
    configRow = db.getRow("Services", "_ROWID_", L1_2)
    if configRow == nil then
      print("Row does not exist")
      return -1, {}
    end
    configRow.operation = A0_1[2]
    configRow["Services.SourcePortStart"] = "0"
    configRow["Services.SourcePortEnd"] = "0"
    configRow["Services.DestinationPortStart"] = "0"
    configRow["Services.DestinationPortEnd"] = "0"
    configRow["Services.MultiPort"] = "0"
    configRow["Services.SourceMultiPort"] = "0"
  end
  return configRow["Services._ROWID_"], configRow
end
function customServicesCfgSave(A0_3)
  local L1_4, L2_5, L3_6
  L1_4 = "OK"
  L2_5 = ""
  L3_6 = ""
  DBTable = "Services"
  if A0_3["Services._ROWID_"] == nil then
    A0_3["Services.OID"] = nil
    if A0_3["Services.Protocol"] == "1" or A0_3["Services.Protocol"] == "58" then
      A0_3["Services.DestinationPortEnd"] = nil
    end
    A0_3["Services.IsDefault"] = "0"
    L1_4, L2_5 = fwView.serviceConfig(A0_3, "-1", "add")
  else
    L1_4, L2_5 = fwView.serviceConfig(A0_3, A0_3["Services._ROWID_"], "edit")
  end
  if L1_4 == "OK" then
    db.save()
  end
  L3_6 = db.getAttribute("stringsMap", "stringId", L2_5, LANGUAGE) or L2_5
  return L1_4, L3_6
end
function customServicesCfgDel(A0_7)
  local L1_8, L2_9, L3_10, L4_11
  L1_8 = "ERROR"
  L2_9 = ""
  L3_10 = ""
  L4_11 = "Services"
  DBTable = L4_11
  L4_11 = db
  L4_11 = L4_11.getRow
  L4_11 = L4_11("Services", "_ROWID_", A0_7[1])
  configRow = L4_11
  L4_11 = configRow
  if L4_11 == nil then
    L4_11 = printCLIError
    L4_11("Row doesnt exist")
    L4_11 = L1_8
    return L4_11, L3_10
  end
  L4_11 = {}
  L4_11.rowid = configRow["Services._ROWID_"]
  L1_8, L2_9 = fwView.deleteServices(L4_11)
  if L1_8 == "OK" then
    db.save()
  end
  L3_10 = db.getAttribute("stringsMap", "stringId", L2_9, LANGUAGE)
  if L1_8 == "ERROR" then
    printCLIError(L3_10)
  end
  return L1_8, L3_10
end
function customServicesCfgInputVal(A0_12)
  local L1_13, L2_14, L3_15, L4_16, L5_17, L6_18, L7_19, L8_20, L9_21
  L1_13 = A0_12["Services.IsDefault"]
  if L1_13 == "1" then
    L1_13 = printCLIError
    L1_13(L2_14)
    L1_13 = false
    return L1_13
  end
  L1_13 = A0_12["Services.ServiceName"]
  if L1_13 ~= "" then
    L1_13 = A0_12["Services.ServiceName"]
  elseif L1_13 == nil then
    L1_13 = printCLIError
    L1_13(L2_14)
    L1_13 = false
    return L1_13
  end
  L1_13 = A0_12["Services.Protocol"]
  if L1_13 ~= nil then
    L1_13 = A0_12["Services.Protocol"]
  elseif L1_13 == "" then
    L1_13 = printCLIError
    L1_13(L2_14)
    L1_13 = false
    return L1_13
  end
  L1_13 = A0_12["Services.PortType"]
  if L1_13 ~= nil then
    L1_13 = A0_12["Services.PortType"]
  elseif L1_13 == "" then
    L1_13 = printCLIError
    L1_13(L2_14)
    L1_13 = false
    return L1_13
  end
  L1_13 = db
  L1_13 = L1_13.getTable
  L1_13 = L1_13(L2_14)
  if L1_13 ~= nil then
    if L2_14 ~= "edit" then
      for L5_17, L6_18 in L2_14(L3_15) do
        L8_20 = L6_18["Services.ServiceName"]
        if L7_19 == L8_20 then
          L8_20 = "Service Name Already Exists.\n"
          L7_19(L8_20)
          return L7_19
        end
      end
    end
  end
  if L2_14 == "0" then
    if L2_14 ~= "1" then
    else
      if L2_14 == "58" then
        if L2_14 == nil then
          L2_14(L3_15)
          return L2_14
        end
    end
    elseif L2_14 == "1" then
      if L2_14 ~= nil then
        if not (L2_14 < 0) then
        elseif L2_14 > 40 then
          L2_14(L3_15)
          return L2_14
        end
      end
    elseif L2_14 == "58" then
      if L2_14 ~= nil then
        if not (L2_14 < 1) then
        elseif L2_14 > 255 then
          L2_14(L3_15)
          return L2_14
        end
      end
    end
    if L2_14 ~= "6" then
    elseif L2_14 == "256" then
      if L2_14 ~= 0 and L3_15 == 0 or L2_14 == 0 and L3_15 ~= 0 then
        L8_20 = " ranging between 1 to 65535.\n"
        L6_18(L7_19)
        return L6_18
      end
      if L4_16 ~= 0 and L5_17 == 0 or L4_16 == 0 and L5_17 ~= 0 then
        L8_20 = "values ranging between 1 to 65535.\n"
        L6_18(L7_19)
        return L6_18
      end
      if L4_16 == 0 and L5_17 == 0 and L2_14 == 0 and L3_15 == 0 then
        L8_20 = "Source Port Range or  Both.\n"
        L6_18(L7_19)
        return L6_18
      end
      if L4_16 ~= nil and L5_17 ~= nil and L4_16 > L5_17 then
        L8_20 = " port can not be less than destination start port.\n"
        L6_18(L7_19)
        return L6_18
      end
      if L2_14 ~= nil and L3_15 ~= nil and L2_14 > L3_15 then
        L8_20 = " can not be less than source start port.\n"
        L6_18(L7_19)
        return L6_18
      end
    end
    if L2_14 ~= "1" then
    elseif L2_14 == "58" then
      A0_12["Services.DestinationPortStart"] = L2_14
      A0_12["Services.SourcePortStart"] = "0"
      A0_12["Services.SourcePortEnd"] = "0"
      A0_12["Services.DestinationPortEnd"] = "0"
    end
    A0_12["Services.MultiPort"] = ""
    A0_12["Services.SourceMultiPort"] = ""
  end
  if L2_14 == "2" then
    A0_12["Services.SourcePortStart"] = "0"
    A0_12["Services.SourcePortEnd"] = "0"
    A0_12["Services.DestinationPortStart"] = "0"
    A0_12["Services.DestinationPortEnd"] = "0"
    if L4_16 ~= "6" then
    elseif L4_16 == "256" then
      if L4_16 ~= nil then
      elseif L4_16 == "" or L3_15 == 0 then
        if L4_16 ~= nil then
        elseif L4_16 == "" or L2_14 == 0 then
          L4_16(L5_17)
          return L4_16
        end
      end
    end
    if L4_16 ~= "1" then
    elseif L4_16 == "58" then
      L4_16(L5_17)
      return L4_16
    end
    if L5_17 ~= nil then
      if L5_17 ~= "" then
        if L5_17 ~= "0" then
          for L8_20, L9_21 in L5_17(L6_18) do
            if tonumber(L9_21) == nil then
              printCLIError("Enter valid Destination Multiple " .. "Ports between 1-65535, additional commas ',' or " .. "other special characters are not allowed.\n")
              return false
            elseif tonumber(L9_21) <= 0 or tonumber(L9_21) > 65535 then
              printCLIError("Enter valid Destination Multiple" .. " Ports between 1-65535. \n")
              return false
            end
          end
        end
      end
    end
    if L5_17 ~= nil then
      if L5_17 ~= "" then
        if L5_17 ~= "0" then
          for L8_20, L9_21 in L5_17(L6_18) do
            if tonumber(L9_21) == nil then
              printCLIError("Enter valid Source Multiple Ports " .. "between 1-65535, additional commas ',' " .. "or other special characters are not allowed.\n")
              return false
            elseif tonumber(L9_21) <= 0 or tonumber(L9_21) > 65535 then
              printCLIError("Enter valid Source Multiple " .. "Ports between 1-65535. \n")
              return false
            end
          end
        end
      end
    end
  end
  if L2_14 == "edit" then
    if L3_15 ~= L2_14 then
      L3_15(L4_16)
      return L3_15
    end
  end
  if L2_14 ~= "3" then
    if L3_15 == "58" then
      L3_15(L4_16)
      return L3_15
    end
  end
  return L3_15
end
function customServicesCfgGet()
  local L0_22, L1_23
  L0_22 = db
  L0_22 = L0_22.getTable
  L1_23 = "Services"
  L0_22 = L0_22(L1_23)
  L1_23 = {}
  printLabel("List of Available Custom Services")
  for _FORV_7_, _FORV_8_ in pairs(L0_22) do
    if "0" + 1 ~= nil and L0_22["0" + 1]["Services.IsDefault"] == "0" then
      resTab.insertField(L1_23, "ROW ID", L0_22["0" + 1]["Services._ROWID_"] or "")
      resTab.insertField(L1_23, "Name", L0_22["0" + 1]["Services.ServiceName"] or "")
      if L0_22["0" + 1]["Services.Protocol"] == "1" then
        resTab.insertField(L1_23, "Protocol Type", "ICMP")
      elseif L0_22["0" + 1]["Services.Protocol"] == "6" then
        resTab.insertField(L1_23, "Protocol Type", "TCP")
      elseif L0_22["0" + 1]["Services.Protocol"] == "17" then
        resTab.insertField(L1_23, "Protocol Type", "UDP")
      elseif L0_22["0" + 1]["Services.Protocol"] == "256" then
        resTab.insertField(L1_23, "Protocol Type", "BOTH")
      elseif L0_22["0" + 1]["Services.Protocol"] == "58" then
        resTab.insertField(L1_23, "Protocol Type", "ICMPv6")
      end
      if L0_22["0" + 1]["Services.PortType"] == "0" then
        if L0_22["0" + 1]["Services.Protocol"] == "1" or L0_22["0" + 1]["Services.Protocol"] == "58" then
          resTab.insertField(L1_23, "Type", "ICMP/ICMPv6")
          resTab.insertField(L1_23, "Source Port Range", "")
          resTab.insertField(L1_23, "ICMP Type/Destination " .. "Port Range", L0_22["0" + 1]["Services.DestinationPortStart"])
        end
        if L0_22["0" + 1]["Services.Protocol"] == "6" or L0_22["0" + 1]["Services.Protocol"] == "17" or L0_22["0" + 1]["Services.Protocol"] == "256" then
          resTab.insertField(L1_23, "Type", "RANGE")
          if tonumber(L0_22["0" + 1]["Services.DestinationPortStart"]) == 0 then
            L0_22["0" + 1]["Services.DestinationPortStart"] = ""
          end
          if tonumber(L0_22["0" + 1]["Services.DestinationPortEnd"]) == 0 then
            L0_22["0" + 1]["Services.DestinationPortEnd"] = ""
          end
          if tonumber(L0_22["0" + 1]["Services.SourcePortStart"]) == 0 then
            L0_22["0" + 1]["Services.SourcePortStart"] = ""
          end
          if tonumber(L0_22["0" + 1]["Services.SourcePortEnd"]) == 0 then
            L0_22["0" + 1]["Services.SourcePortEnd"] = ""
          end
          resTab.insertField(L1_23, "Source Port Range", L0_22["0" + 1]["Services.SourcePortStart"] .. "-" .. L0_22["0" + 1]["Services.SourcePortEnd"] or "")
          resTab.insertField(L1_23, "ICMP Type/Destination" .. " Port Range", L0_22["0" + 1]["Services.DestinationPortStart"] .. "-" .. L0_22["0" + 1]["Services.DestinationPortEnd"] or "")
        end
      end
      if L0_22["0" + 1]["Services.PortType"] == "2" then
        resTab.insertField(L1_23, "Type", "MULITPLE")
        if tonumber(L0_22["0" + 1]["Services.SourceMultiPort"]) == 0 then
          L0_22["0" + 1]["Services.SourceMultiPort"] = ""
        end
        if tonumber(L0_22["0" + 1]["Services.MultiPort"]) == 0 then
          L0_22["0" + 1]["Services.MultiPort"] = ""
        end
        resTab.insertField(L1_23, "Source Port Range", L0_22["0" + 1]["Services.SourceMultiPort"] or "")
        resTab.insertField(L1_23, "ICMP Type/Destination Port" .. " Range", L0_22["0" + 1]["Services.MultiPort"] or "")
      end
    end
  end
  resTab.print(L1_23, 0)
end
function blockedClientsCfgInit(A0_24)
  local L1_25, L2_26, L3_27, L4_28, L5_29
  L1_25 = A0_24[1]
  L2_26 = A0_24[2]
  L3_27 = -1
  L4_28 = {}
  configRow = L4_28
  L4_28 = configRow
  L4_28["blockedClients.macAddress"] = L1_25
  L4_28 = configRow
  L4_28["blockedClients.description"] = L2_26
  L4_28 = L3_27
  L5_29 = configRow
  return L4_28, L5_29
end
function blockedClientsEditCfgInit(A0_30)
  local L1_31, L2_32
  L1_31 = A0_30[1]
  L2_32 = db
  L2_32 = L2_32.getRow
  L2_32 = L2_32("blockMAC", "_ROWID_", L1_31)
  if L2_32 == nil then
    printCLIError("Mac Client with given Row  doesnt exist, First Add a MAC Client")
    return nil, {}
  else
    L1_31 = L2_32["blockMAC._ROWID_"]
    L2_32["blockedClients.cookie"] = L1_31
  end
  return L1_31, L2_32
end
function blockedClientsCfgSave(A0_33)
  local L1_34, L2_35, L3_36, L4_37
  L1_34 = "OK"
  L2_35 = ""
  L3_36 = ""
  L4_37 = "blockMAC"
  DBTable = L4_37
  L4_37 = {}
  L4_37["blockedClients.cookie"] = A0_33["blockMAC._ROWID_"]
  if L4_37["blockedClients.cookie"] == nil then
    L1_34, L2_35 = _UPVALUE0_.blockedClientsSectionCreate(A0_33)
  else
    L1_34, L2_35 = _UPVALUE0_.blockedClientsSectionSet(A0_33)
  end
  if L1_34 == 0 then
    L1_34 = "OK"
  else
    L1_34 = _UPVALUE1_.errorStringGet(L1_34)
  end
  if L1_34 == "OK" then
    db.save()
  end
  L3_36 = L1_34
  return L1_34, L3_36
end
function blockedClientsCfgInputVal(A0_38)
  local L1_39, L2_40, L3_41, L4_42, L5_43
  L1_39 = 64
  L2_40 = 0
  L3_41 = 0
  L4_42 = nil
  L5_43 = db
  L5_43 = L5_43.getTable
  L5_43 = L5_43("blockMAC")
  for _FORV_9_, _FORV_10_ in pairs(L5_43) do
    L3_41 = L3_41 + 1
    if L3_41 ~= nil and string.upper(A0_38["blockedClients.macAddress"]) == string.upper(L5_43[L3_41]["blockMAC.sourceMACAddress"]) then
      printCLIError("MAC address already configured")
      return false
    end
  end
  if A0_38["blockedClients.description"] == "" or A0_38["blockedClients.description"] == nil then
    printCLIError("Please Enter Proper Description First\n")
    return false
  end
  if L1_39 < string.len(A0_38["blockedClients.description"]) or L2_40 > string.len(A0_38["blockedClients.description"]) then
    printCLIError("Please enter upto 64 characters for Description.")
    return false
  end
  return true
end
function blockedClientsCfgDel(A0_44)
  local L1_45, L2_46, L3_47, L4_48
  L1_45 = "ERROR"
  L2_46 = ""
  L3_47 = ""
  L4_48 = "blockMAC"
  DBTable = L4_48
  L4_48 = db
  L4_48 = L4_48.getRow
  L4_48 = L4_48("blockMAC", "_ROWID_", A0_44[1])
  configRow = L4_48
  L4_48 = configRow
  if L4_48 == nil then
    L4_48 = printCLIError
    L4_48("Mac Client with given Row  doesnt exist")
    L4_48 = L1_45
    return L4_48, L3_47
  end
  L4_48 = {}
  L4_48["blockedClients.cookie"] = configRow["blockMAC._ROWID_"]
  L1_45, L2_46 = _UPVALUE0_.blockedClientsSectionDelete(L4_48)
  if L1_45 == "OK" then
    db.save()
  end
  L3_47 = db.getAttribute("stringsMap", "stringId", L2_46, LANGUAGE) or L2_46
  return L1_45, L3_47
end
function blockedClientsCfgGet()
  local L0_49, L1_50, L2_51, L3_52
  L0_49 = 0
  L1_50 = {}
  L2_51 = nil
  L3_52 = db
  L3_52 = L3_52.getTable
  L3_52 = L3_52("blockMAC")
  print("display available Block Mac Clients list\n")
  for _FORV_7_, _FORV_8_ in pairs(L3_52) do
    L0_49 = L0_49 + 1
    if L0_49 ~= nil then
      resTab.insertField(L1_50, "ROW_ID", L3_52[L0_49]["blockMAC._ROWID_"] or "")
      resTab.insertField(L1_50, "MAC_Address", L3_52[L0_49]["blockMAC.sourceMACAddress"] or "")
      resTab.insertField(L1_50, "Description", L3_52[L0_49]["blockMAC.description"] or "")
    end
  end
  resTab.print(L1_50, 0)
end
