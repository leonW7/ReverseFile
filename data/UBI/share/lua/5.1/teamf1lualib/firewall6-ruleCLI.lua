local L0_0
L0_0 = require
L0_0("teamf1lualib/fwView")
L0_0 = require
L0_0("teamf1lualib/fwRules")
L0_0 = "PriorityId != 'NULL' and PriorityId !='0'"
function firewallRule6InfoGet(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L2_3 = "networkInfo"
  L3_4 = "_ROWID_"
  L4_5 = "1"
  L5_6 = "netWorkMode"
  L1_2 = L1_2(L2_3, L3_4, L4_5, L5_6)
  L1_2 = L1_2 or ""
  if L1_2 == "1" then
    L2_3 = printCLIError
    L3_4 = "Please Set IP Mode to IPv4/IPv6 to configure this option.\n"
    L2_3(L3_4)
    L2_3 = false
    return L2_3
  end
  L2_3 = printLabel
  L3_4 = "Default Outbound Policy"
  L2_3(L3_4)
  L2_3 = db
  L2_3 = L2_3.getRow
  L3_4 = "fwDefaultOutBoundPolicy"
  L4_5 = "Ipmode"
  L5_6 = "2"
  L2_3 = L2_3(L3_4, L4_5, L5_6)
  defRow = L2_3
  L2_3 = defRow
  L2_3 = L2_3["fwDefaultOutBoundPolicy.DefaultPolicyStatus"]
  if L2_3 == "1" then
    L2_3 = print
    L3_4 = "For IPv6 : Allow Always\n"
    L2_3(L3_4)
  else
    L2_3 = defRow
    L2_3 = L2_3["fwDefaultOutBoundPolicy.DefaultPolicyStatus"]
    if L2_3 == "0" then
      L2_3 = print
      L3_4 = "For IPv6 : Block Always"
      L2_3(L3_4)
    end
  end
  L2_3 = "RuleType = 'SECURE_INSECURE'"
  L3_4 = L2_3
  L4_5 = " or RuleType = 'INSECURE_SECURE'"
  L2_3 = L3_4 .. L4_5
  L3_4 = db
  L3_4 = L3_4.getRowsWhere
  L4_5 = "FirewallRules6"
  L5_6 = L2_3
  L3_4 = L3_4(L4_5, L5_6)
  L4_5 = db
  L4_5 = L4_5.getAttribute
  L5_6 = "fwPriorityMap6"
  L6_7 = "RuleType"
  L7_8 = "ALL"
  L4_5 = L4_5(L5_6, L6_7, L7_8, "PriorityStr")
  L4_5 = L4_5 or ""
  L5_6 = {}
  L6_7 = {}
  L7_8 = printLabel
  L7_8("List of Available IPv6 Firewall Rules")
  if L4_5 ~= nil and L4_5 ~= "" then
    L7_8 = util
    L7_8 = L7_8.split
    L7_8 = L7_8(L4_5, ",")
    if L7_8 ~= false and #L7_8 ~= 0 then
      for _FORV_12_, _FORV_13_ in pairs(L7_8) do
        for _FORV_17_, _FORV_18_ in pairs(L3_4) do
          if _FORV_18_["FirewallRules6.PriorityId"] == _FORV_13_ then
            L6_7["0" + 1] = _FORV_18_
            break
          end
        end
      end
    end
  end
  L7_8, _FORV_12_ = nil, nil
  for _FORV_17_, _FORV_18_ in pairs(L6_7) do
    if L6_7[0 + 1]["FirewallRules6.Status"] == "0" then
      L7_8 = "Disabled"
    elseif L6_7[0 + 1]["FirewallRules6.Status"] == "1" then
      L7_8 = "Enabled"
    end
    if L6_7[0 + 1]["FirewallRules6.RuleType"] == "SECURE_INSECURE" then
    else
    end
    if L6_7[0 + 1]["FirewallRules6.Action"] == "ACCEPT" then
    elseif L6_7[0 + 1]["FirewallRules6.Action"] == "DROP" then
    elseif L6_7[0 + 1]["FirewallRules6.Action"] == "DROP_BY_SCHED_MATCH" then
    else
    end
    if L6_7[0 + 1]["FirewallRules6.SourceAddressType"] == "0" then
    elseif L6_7[0 + 1]["FirewallRules6.SourceAddressType"] == "1" then
    elseif L6_7[0 + 1]["FirewallRules6.SourceAddressType"] == "2" then
    end
    if L6_7[0 + 1]["FirewallRules6.DestinationAddressType"] == "0" then
    elseif L6_7[0 + 1]["FirewallRules6.DestinationAddressType"] == "1" then
    elseif L6_7[0 + 1]["FirewallRules6.DestinationAddressType"] == "2" then
    end
    if L6_7[0 + 1]["FirewallRules6.LogLevel"] == "1" then
    else
    end
    resTab.insertField(L5_6, "ROW ID", L6_7[0 + 1]["FirewallRules6._ROWID_"] or "")
    resTab.insertField(L5_6, "Status", L7_8 or "")
    resTab.insertField(L5_6, "Rule Type", "WAN To LAN" or "")
    resTab.insertField(L5_6, "Service", L6_7[0 + 1]["FirewallRules6.ServiceName"] or "")
    resTab.insertField(L5_6, "Action", "ALLOW by schedule,otherwise block" or "")
    resTab.insertField(L5_6, "Source Users", L6_7[0 + 1]["FirewallRules6.SourceAddressStart"] .. " - " .. L6_7[0 + 1]["FirewallRules6.SourceAddressEnd"] or "")
    resTab.insertField(L5_6, "Destination Users", L6_7[0 + 1]["FirewallRules6.DestinationAddressStart"] .. " - " .. L6_7[0 + 1]["FirewallRules6.DestinationAddressEnd"] or "")
    resTab.insertField(L5_6, "Log", "Always" or "")
  end
  resTab.print(L5_6, 0)
end
function firewallSettings6CfgInit(A0_9)
  local L1_10, L2_11, L3_12, L4_13
  L1_10 = A0_9[1]
  L2_11 = {}
  L2_11["Ipv6.DefaultPolicyStatus"] = L1_10
  L2_11["Ipv4.DefaultPolicyStatus"] = nil
  L2_11["Ipv6._ROWID_"] = "2"
  L3_12 = L2_11["Ipv6._ROWID_"]
  L4_13 = L2_11
  return L3_12, L4_13
end
function firewallSettings6CfgSave(A0_14)
  local L1_15, L2_16, L3_17
  L1_15 = "Error"
  L2_16 = ""
  L3_17 = ""
  L1_15, L2_16 = fwView.defaultPolicyEdit(A0_14)
  L3_17 = db.getAttribute("stringsMap", "stringId", L2_16, LANGUAGE)
  if L1_15 == "OK" then
    db.save()
  else
    L1_15 = "ERROR"
    L3_17 = "Default outbound rule not found for IPv6 Firewall Rules."
  end
  return L1_15, L3_17
end
function firewallSettings6InVal()
  if (db.getAttribute("networkInfo", "_ROWID_", "1", "netWorkMode") or "") == "1" then
    printCLIError("Please Set IP Mode to IPv4/IPv6 to configure this option.\n")
    return false
  end
  return true
end
function accessControlRule6Modify(A0_18)
  local L1_19, L2_20, L3_21, L4_22, L5_23, L6_24, L7_25
  L1_19 = db
  L1_19 = L1_19.getAttribute
  L2_20 = "networkInfo"
  L3_21 = "_ROWID_"
  L4_22 = "1"
  L5_23 = "netWorkMode"
  L1_19 = L1_19(L2_20, L3_21, L4_22, L5_23)
  L1_19 = L1_19 or ""
  if L1_19 == "1" then
    L2_20 = printCLIError
    L3_21 = "Please Set IP Mode to IPv4/IPv6 to configure this option.\n"
    L2_20(L3_21)
    L2_20 = false
    return L2_20
  end
  L2_20 = "Error"
  L3_21 = ""
  L4_22 = ""
  L5_23 = "FirewallRules6"
  DBTable = L5_23
  L5_23 = {}
  L6_24 = A0_18[1]
  L5_23.rowId = L6_24
  L6_24 = A0_18[2]
  L7_25 = L5_23.rowId
  if tonumber(L7_25) > 0 and 2 > tonumber(L7_25) then
    printCLIError("The IPV6 Firewall Rule with rowId 1 is default and" .. " cannot be " .. A0_18[2] .. "d.")
    return false
  end
  if db.existsRow(DBTable, "_ROWID_", L7_25) == false then
    printCLIError("Configured Row ID does not exist.")
    return false
  end
  L2_20, L4_22 = fwView.modifyIPv6Rules(L5_23, L6_24)
  if L2_20 == "OK" then
    db.save()
    if L6_24 == "delete" then
      print("Firewall rule(s) has been deleted.")
    elseif L6_24 == "enable" then
      print("Firewall rule(s) has been enabled.")
    elseif L6_24 == "disable" then
      print("Firewall rule(s) has been disabled.")
    end
  end
  firewallRule6InfoGet()
  return L2_20, L4_22
end
function accessControlRule6CfgInit(A0_26)
  local L1_27, L2_28
  L1_27 = A0_26[1]
  L2_28 = {}
  if L1_27 == nil then
    L2_28["FirewallRules6._ROWID_"] = "-1"
    L2_28["FirewallRules6.ServiceName"] = "ANY"
    L2_28["FirewallRules6.SourceAddressType"] = "0"
    L2_28["FirewallRules6.DestinationAddressType"] = "0"
    L2_28["FirewallRules6.LogLevel"] = "1"
    L2_28["FirewallRules6.Action"] = "DROP"
    _UPVALUE0_ = "add"
  else
    _UPVALUE0_ = "edit"
    if tonumber(L1_27) == 1 then
      print("The IPV6 Firewall Rule with rowId 1 is default and cannot be editable.")
      return -1
    end
    L2_28 = db.getRow("FirewallRules6", "_ROWID_", L1_27)
    if L2_28 == nil then
      print("Row does not exist")
      return -1
    end
    _UPVALUE1_ = tonumber(L1_27)
  end
  return L2_28["FirewallRules6._ROWID_"], L2_28
end
function accessControlRule6CfgSave(A0_29)
  local L1_30, L2_31, L3_32
  L1_30 = "Error"
  L2_31 = ""
  L3_32 = ""
  DBTable = "FirewallRules6"
  if A0_29["FirewallRules6.RuleType"] == "INSECURE_SECURE" then
    A0_29["FirewallRules6.FromZoneType"] = "INSECURE"
    A0_29["FirewallRules6.ToZoneType"] = "SECURE"
  elseif A0_29["FirewallRules6.RuleType"] == "SECURE_INSECURE" then
    A0_29["FirewallRules6.FromZoneType"] = "SECURE"
    A0_29["FirewallRules6.ToZoneType"] = "INSECURE"
  end
  if A0_29["FirewallRules6.SourceAddressType"] == "1" then
    A0_29["FirewallRules6.SourceAddressPrefixLength"] = ""
  end
  if A0_29["FirewallRules6.DestinationAddressType"] == "1" then
    A0_29["FirewallRules6.DestinationAddressPrefixLength"] = ""
  end
  if A0_29["FirewallRules6._ROWID_"] == "-1" then
    L1_30, L3_32 = fwView.ipv6FirewallRulesAdd(A0_29)
  else
    L1_30, L3_32 = fwView.ipv6FirewallRulesEdit(A0_29, A0_29["FirewallRules6._ROWID_"])
  end
  if L1_30 == "OK" then
    db.save()
    if A0_29["FirewallRules6._ROWID_"] == "-1" then
      print("Firewall rule(s) has been added.")
    else
      print("Firewall rule(s) has been eddited.")
    end
  end
  return L1_30, L3_32
end
function accessControlRule6CfgInputVal(A0_33)
  local L1_34, L2_35, L3_36, L4_37, L5_38
  L1_34 = A0_33["FirewallRules6.ServiceName"]
  if L1_34 then
    L1_34 = "ServiceName = '"
    L2_35 = A0_33["FirewallRules6.ServiceName"]
    L3_36 = "'"
    L1_34 = L1_34 .. L2_35 .. L3_36
    L2_35 = db
    L2_35 = L2_35.existsRowWhere
    L3_36 = "Services"
    L4_37 = L1_34
    L2_35 = L2_35(L3_36, L4_37)
    if L2_35 == false then
      L3_36 = printCLIError
      L4_37 = "Invalid service name"
      L3_36(L4_37)
      L3_36 = false
      return L3_36
    end
  end
  L1_34 = A0_33["FirewallRules6.RuleType"]
  if L1_34 ~= nil then
    L1_34 = A0_33["FirewallRules6.RuleType"]
  elseif L1_34 == "" then
    L1_34 = printCLIError
    L2_35 = "Enter valid Rule Type\n"
    L1_34(L2_35)
    L1_34 = false
    return L1_34
  end
  L1_34 = A0_33["FirewallRules6.SourceAddressType"]
  if L1_34 ~= "" then
    L1_34 = A0_33["FirewallRules6.SourceAddressType"]
  elseif L1_34 == nil then
    L1_34 = printCLIError
    L2_35 = "Enter valid source address type\n"
    L1_34(L2_35)
    L1_34 = false
    return L1_34
  end
  L1_34 = A0_33["FirewallRules6.DestinationAddressType"]
  if L1_34 ~= "" then
    L1_34 = A0_33["FirewallRules6.DestinationAddressType"]
  elseif L1_34 == nil then
    L1_34 = printCLIError
    L2_35 = "Enter valid destination address type\n"
    L1_34(L2_35)
    L1_34 = false
    return L1_34
  end
  L1_34 = A0_33["FirewallRules6.SourceAddressType"]
  if L1_34 == "1" then
    L1_34 = A0_33["FirewallRules6.SourceAddressStart"]
    if L1_34 ~= "" then
      L1_34 = A0_33["FirewallRules6.SourceAddressStart"]
    elseif L1_34 == nil then
      L1_34 = printCLIError
      L2_35 = "Enter valid source address\n"
      L1_34(L2_35)
      L1_34 = false
      return L1_34
    end
  end
  L1_34 = A0_33["FirewallRules6.SourceAddressType"]
  if L1_34 == "2" then
    L1_34 = A0_33["FirewallRules6.SourceAddressStart"]
    if L1_34 ~= "" then
      L1_34 = A0_33["FirewallRules6.SourceAddressStart"]
      if L1_34 ~= nil then
        L1_34 = A0_33["FirewallRules6.SourceAddressEnd"]
        if L1_34 ~= "" then
          L1_34 = A0_33["FirewallRules6.SourceAddressEnd"]
        end
      end
    elseif L1_34 == nil then
      L1_34 = printCLIError
      L2_35 = "Enter valid source address range\n"
      L1_34(L2_35)
      L1_34 = false
      return L1_34
    end
  end
  L1_34 = A0_33["FirewallRules6.DestinationAddressType"]
  if L1_34 == "1" then
    L1_34 = A0_33["FirewallRules6.DestinationAddressStart"]
    if L1_34 ~= "" then
      L1_34 = A0_33["FirewallRules6.DestinationAddressStart"]
    elseif L1_34 == nil then
      L1_34 = printCLIError
      L2_35 = "Enter valid destination address\n"
      L1_34(L2_35)
      L1_34 = false
      return L1_34
    end
  end
  L1_34 = A0_33["FirewallRules6.DestinationAddressType"]
  if L1_34 == "2" then
    L1_34 = A0_33["FirewallRules6.DestinationAddressStart"]
    if L1_34 ~= "" then
      L1_34 = A0_33["FirewallRules6.DestinationAddressStart"]
      if L1_34 ~= nil then
        L1_34 = A0_33["FirewallRules6.DestinationAddressEnd"]
        if L1_34 ~= "" then
          L1_34 = A0_33["FirewallRules6.DestinationAddressEnd"]
        end
      end
    elseif L1_34 == nil then
      L1_34 = printCLIError
      L2_35 = "Enter valid destination address range\n"
      L1_34(L2_35)
      L1_34 = false
      return L1_34
    end
  end
  L1_34, L2_35, L3_36 = nil, nil, nil
  L4_37 = A0_33["FirewallRules6.RuleType"]
  L5_38 = db
  L5_38 = L5_38.getRowsWhere
  L5_38 = L5_38("FirewallRules", _UPVALUE0_)
  if #L5_38 >= 600 and _UPVALUE1_ == "add" then
    printCLIError("Maximum Firewall Rule Limit Exceeded")
    return false
  elseif L4_37 == "SECURE_INSECURE" then
    if _UPVALUE1_ == "add" then
      L3_36 = _UPVALUE0_ .. " and ruleType == " .. "'SECURE_INSECURE'"
    elseif _UPVALUE1_ == "edit" then
      L1_34 = "rowid != " .. _UPVALUE2_
      L3_36 = _UPVALUE0_ .. " and ruleType == " .. "'SECURE_INSECURE'" .. " and " .. L1_34
    end
    L5_38 = db.getRowsWhere("FirewallRules", L3_36)
    if #L5_38 >= 300 then
      printCLIError("Outbound Firewall Rule Limit Exceeded")
      return false
    end
  elseif L4_37 == "INSECURE_SECURE" then
    if _UPVALUE1_ == "add" then
      L2_35 = _UPVALUE0_ .. " and ruleType == " .. "'INSECURE_SECURE'"
    elseif _UPVALUE1_ == "edit" then
      L1_34 = "rowid != " .. _UPVALUE2_
      L2_35 = _UPVALUE0_ .. " and ruleType == " .. "'INSECURE_SECURE'" .. " and " .. L1_34
    end
    L5_38 = db.getRowsWhere("FirewallRules", L2_35)
    if #L5_38 >= 300 then
      printCLIError("Inbound Firewall Rule Limit Exceeded")
      return false
    end
  end
  return true
end
function rule6ReorderInit(A0_39)
  local L1_40, L2_41, L3_42, L4_43, L5_44, L6_45, L7_46
  L1_40 = {}
  L2_41 = {}
  L3_42 = 0
  L4_43 = A0_39[1]
  L1_40["Rule6ToMove.rowIds"] = L4_43
  L4_43 = util
  L4_43 = L4_43.split
  L5_44 = A0_39[1]
  L6_45 = ","
  L4_43 = L4_43(L5_44, L6_45)
  L2_41 = L4_43
  L4_43 = db
  L4_43 = L4_43.getAttribute
  L5_44 = "FirewallRules6"
  L6_45 = "_ROWID_"
  L7_46 = L2_41[1]
  L4_43 = L4_43(L5_44, L6_45, L7_46, "PriorityId")
  L3_42 = L4_43 or ""
  if L3_42 == nil or L3_42 == "" then
    L4_43 = printCLIError
    L5_44 = "Invalid rowid"
    L4_43(L5_44)
    L4_43 = -1
    L5_44 = nil
    return L4_43, L5_44
  end
  L4_43 = nil
  L5_44 = db
  L5_44 = L5_44.getRow
  L6_45 = "fwPriorityMap6"
  L7_46 = "RuleType"
  L5_44 = L5_44(L6_45, L7_46, "ALL")
  if L5_44 ~= nil then
    L6_45 = L5_44["fwPriorityMap6.PriorityStr"]
    L4_43 = L6_45 or ""
  end
  if L4_43 == nil or L4_43 == "" then
    L6_45 = -1
    L7_46 = nil
    return L6_45, L7_46
  end
  L6_45 = util
  L6_45 = L6_45.split
  L7_46 = L4_43
  L6_45 = L6_45(L7_46, ",")
  L7_46 = 0
  if L6_45 ~= false then
    for _FORV_11_, _FORV_12_ in pairs(L6_45) do
      L7_46 = L7_46 + 1
      if _FORV_12_ == L3_42 then
        L1_40["Rule6ToMove.pos"] = L7_46
        break
      end
    end
  end
  print("curPos", L7_46)
  return -1, L1_40
end
function rule6ReorderSave(A0_47)
  local L1_48, L2_49, L3_50, L4_51, L5_52, L6_53, L7_54, L8_55
  L1_48 = "Error"
  L2_49 = ""
  L3_50 = {}
  L3_50 = L4_51
  for L7_54, L8_55 in L4_51(L5_52) do
    print("k", L7_54)
    print("v", L8_55)
  end
  L2_49 = L5_52
  L1_48 = L4_51
  if L1_48 == "OK" then
    L4_51()
  end
  return L4_51, L5_52
end
function rule6ReorderInVal(A0_56)
  local L1_57, L2_58, L3_59, L4_60, L5_61, L6_62
  L1_57 = {}
  L1_57 = L2_58
  for L5_61, L6_62 in L2_58(L3_59) do
    rowValid = db.existsRow("FirewallRules6", "ROWID", L6_62)
    if rowValid == false then
      printCLIError(L6_62, " is not a valid ROWID")
      return false
    end
  end
  return L2_58
end
