local L0_0
L0_0 = require
L0_0("teamf1lualib/dhcp")
L0_0 = require
L0_0("validationsLuaLib")
L0_0 = require
L0_0("teamf1lualib/lanDhcpReservedIps_bl")
L0_0 = {
  "Best Effort",
  "Background",
  "Spare",
  "Excellent Effort",
  "Controlled Load",
  "Video",
  "Voice",
  "Network Control"
}
function dhcpSetupGet()
  local L0_1, L1_2, L2_3
  L0_1 = {}
  L1_2, L2_3 = nil, nil
  printLabel("DHCP Setup Configuration")
  L1_2 = db.getRow("dhcp", "_ROWID_", 1)
  L2_3 = db.getRow("DhcpRelay", "_ROWID_", 1)
  if L1_2 ~= nil and L2_3 ~= nil then
    if L1_2["dhcp.dhcpEnabled"] == "0" and L2_3["DhcpRelay.DhcpRelayStatus"] == "1" then
      resTab.insertField(L0_1, "DHCP Relay ", "Enabled")
    end
    if L1_2["dhcp.dhcpEnabled"] == "1" and L2_3["DhcpRelay.DhcpRelayStatus"] == "0" then
      resTab.insertField(L0_1, "DHCP Server ", "Enabled")
    end
    if L1_2["dhcp.dhcpEnabled"] == "0" and L2_3["DhcpRelay.DhcpRelayStatus"] == "0" then
      resTab.insertField(L0_1, "DHCP Server and Relay ", "Disabled")
    end
    if L1_2["dhcp.dhcpEnabled"] == "1" then
      resTab.insertField(L0_1, "Domain Name", L1_2["dhcp.domainName"] or "")
      resTab.insertField(L0_1, "Starting IP Address", L1_2["dhcp.startAddress"] or "")
      resTab.insertField(L0_1, "Ending IP Address", L1_2["dhcp.endAddress"] or "")
      resTab.insertField(L0_1, "Primary DNS Server", L1_2["dhcp.primaryDnsServer"] or "")
      resTab.insertField(L0_1, "Secondary DNS Server", L1_2["dhcp.secondaryDnsServer"] or "")
      resTab.insertField(L0_1, "WINS Server", L1_2["dhcp.winsServer"] or "")
      resTab.insertField(L0_1, "Lease Time in hrs ", L1_2["dhcp.leaseTime"] or "")
      if L1_2["dhcp.enableDnsProxy"] == "1" then
        resTab.insertField(L0_1, "DNS Proxy", " Enabled")
      else
        resTab.insertField(L0_1, "DNS Proxy", " Disabled")
      end
    elseif L2_3["DhcpRelay.DhcpRelayStatus"] == "1" then
      resTab.insertField(L0_1, "Relay Gateway", L2_3["DhcpRelay.RelayGateway"] or "")
    end
  end
  resTab.print(L0_1, 0)
end
function dhcpReservedIPSetupGet()
  local L0_4, L1_5, L2_6
  L0_4 = db
  L0_4 = L0_4.getTable
  L1_5 = "DhcpfixedIpAddress"
  L0_4 = L0_4(L1_5)
  L1_5 = db
  L1_5 = L1_5.getTable
  L2_6 = "IPMACBinding"
  L1_5 = L1_5(L2_6)
  L2_6 = {}
  printLabel("List of DHCP Reserved Addresses")
  for _FORV_9_, _FORV_10_ in pairs(L0_4) do
    if 0 + 1 ~= nil then
      resTab.insertField(L2_6, "Host Name", L0_4[0 + 1]["DhcpfixedIpAddress.Name"] or "")
      resTab.insertField(L2_6, "IP Address", L0_4[0 + 1]["DhcpfixedIpAddress.IpAddr"] or "")
      resTab.insertField(L2_6, "MAC Address", L0_4[0 + 1]["DhcpfixedIpAddress.MacAddr"] or "")
      if L0_4[0 + 1]["DhcpfixedIpAddress.AssociatingEnabled"] == "1" then
        resTab.insertField(L2_6, "Association", "Enabled")
        logStatus = db.getAttribute("IPMACBinding", "IPAddress", L0_4[0 + 1]["DhcpfixedIpAddress.IpAddr"], "LogStatus")
        if logStatus == "1" then
          resTab.insertField(L2_6, "logStatus", "Enabled")
        else
          resTab.insertField(L2_6, "logStatus", "Disabled")
        end
      else
        resTab.insertField(L2_6, "Association", "Disabled")
        resTab.insertField(L2_6, "logStatus", "Disabled")
      end
    end
  end
  resTab.print(L2_6, 0)
end
function dhcpMacFilteringSetupGet()
  local L0_7, L1_8
  L0_7 = db
  L0_7 = L0_7.getTable
  L1_8 = "DhcpMacExclusion"
  L0_7 = L0_7(L1_8)
  L1_8 = {}
  printLabel("List of DHCP MAC Filtering identifiers")
  for _FORV_7_, _FORV_8_ in pairs(L0_7) do
    if 0 + 1 ~= nil then
      resTab.insertField(L1_8, "MAC Address", L0_7[0 + 1]["DhcpMacExclusion.MacAddress"] or "")
      if L0_7[0 + 1]["DhcpMacExclusion.AllowFlag"] == "0" then
        resTab.insertField(L1_8, "Status", "Deny")
      else
        resTab.insertField(L1_8, "Status", "Allow")
      end
    end
  end
  resTab.print(L1_8, 0)
end
function dhcpOption60SetupGet()
  local L0_9, L1_10, L2_11, L3_12, L4_13
  L0_9 = db
  L0_9 = L0_9.getTable
  L1_10 = "Option60"
  L0_9 = L0_9(L1_10)
  L1_10 = {}
  L2_11 = nil
  L3_12 = "0"
  L4_13 = "1"
  printLabel("List of DHCP Option 60 Identifiers")
  for _FORV_8_, _FORV_9_ in pairs(L0_9) do
    L3_12 = L3_12 + 1
    if L3_12 ~= nil then
      resTab.insertField(L1_10, "Vendor Class Identifier", L0_9[L3_12]["Option60.VendorId"] or "")
      resTab.insertField(L1_10, "Start IP Address", L0_9[L3_12]["Option60.StartIp"] or "")
      resTab.insertField(L1_10, "End IP Address", L0_9[L3_12]["Option60.EndIp"] or "")
      L4_13 = tonumber(L0_9[L3_12]["Option60.PriorityLevel"])
      L4_13 = L4_13 + 1
      resTab.insertField(L1_10, "Traffic Type", _UPVALUE0_[L4_13])
    end
  end
  resTab.print(L1_10, 0)
end
function dhcpLeasedListGet()
  local L0_14, L1_15
  L0_14 = db
  L0_14 = L0_14.getTable
  L1_15 = "DhcpLeasedClients"
  L0_14 = L0_14(L1_15)
  L1_15 = {}
  for _FORV_7_, _FORV_8_ in pairs(L0_14) do
    if "0" + 1 ~= nil then
      resTab.insertField(L1_15, "Host Name", L0_14["0" + 1]["DhcpLeasedClients.HostName"] or "unknown")
      resTab.insertField(L1_15, "IP Address", L0_14["0" + 1]["DhcpLeasedClients.IPAddr"] or "")
      resTab.insertField(L1_15, "Mac Address", L0_14["0" + 1]["DhcpLeasedClients.MacAddr"] or "")
    end
  end
  printLabel("List of Available DHCP Leased Clients")
  resTab.print(L1_15, 0)
end
function dhcpServerCfgInit(A0_16)
  local L1_17, L2_18
  L1_17 = -1
  L2_18 = db
  L2_18 = L2_18.getRow
  L2_18 = L2_18("dhcp", "_ROWID_", "1")
  if L2_18 == nil then
    return L1_17, {}
  end
  L1_17 = L2_18["dhcp._ROWID_"]
  return L1_17, L2_18
end
function dhcpServerCfgSave(A0_19)
  local L1_20, L2_21, L3_22
  L2_21 = ""
  L3_22 = nil
  if db.existsRow("dhcp", "_ROWID_", "1") then
    L1_20, L2_21 = dhcp.config(A0_19, "1", "edit")
  else
    L1_20, L2_21 = dhcp.config(A0_19, "-1", "add")
  end
  if L1_20 == "OK" then
    db.save()
  end
  L3_22 = db.getAttribute("stringsMap", "stringId", L2_21, LANGUAGE)
  return L1_20, L3_22
end
function dhcpServerCfgInputVal(A0_23)
  if A0_23["dhcp.dhcpEnabled"] == "1" and db.getRow("DhcpRelay", "DhcpRelay._ROWID_", 1)["DhcpRelay.DhcpRelayStatus"] == "1" then
    printCLIError("Disable DHCP Relay before enabling DHCP Server")
    return false
  end
  if A0_23["dhcp.dhcpEnabled"] == "1" and A0_23["dhcp.startAddress"] == nil then
    printCLIError("Invalid Start IP address")
    return false
  end
  if A0_23["dhcp.dhcpEnabled"] == "1" and A0_23["dhcp.endAddress"] == nil then
    printCLIError("Invalid End IP address")
    return false
  end
  if A0_23["dhcp.dhcpEnabled"] == "1" and A0_23["dhcp.leaseTime"] == nil then
    printCLIError("Invalid lease Time")
    return false
  end
  if A0_23["dhcp.dhcpEnabled"] == "1" and A0_23["dhcp.enableDnsProxy"] == nil then
    printCLIError("Invalid DNS Proxy status")
    return false
  end
  return true
end
function dhcpRelayCfgInit(A0_24)
  local L1_25, L2_26
  L1_25 = -1
  L2_26 = db
  L2_26 = L2_26.getRow
  L2_26 = L2_26("DhcpRelay", "_ROWID_", "1")
  if L2_26 == nil then
    return L1_25, {}
  end
  L1_25 = L2_26["DhcpRelay._ROWID_"]
  return L1_25, L2_26
end
function dhcpRelayCfgSave(A0_27)
  local L1_28, L2_29, L3_30
  L2_29 = ""
  L3_30 = nil
  if db.existsRow("DhcpRelay", "_ROWID_", 1) then
    L1_28, L2_29 = dhcpRelay.config(A0_27, "1", "edit")
  end
  if L1_28 == "OK" then
    db.save()
  end
  L3_30 = db.getAttribute("stringsMap", "stringId", L2_29, LANGUAGE)
  return L1_28, L3_30
end
function dhcpRelayCfgInputVal(A0_31)
  if db.getRow("dhcp", "dhcp._ROWID_", 1)["dhcp.dhcpEnabled"] == "1" and A0_31["DhcpRelay.DhcpRelayStatus"] == "1" then
    printCLIError("Disable DHCP Server before enabling DHCP Relay")
    return false
  end
  if A0_31["DhcpRelay.DhcpRelayStatus"] == "1" and (A0_31["DhcpRelay.RelayGateway"] == nil or A0_31["DhcpRelay.RelayGateway"] == "0.0.0.0") then
    printCLIError("Invalid relay gateway")
    return false
  end
  return true
end
function dhcpReservedIPsCfgInit(A0_32)
  local L1_33, L2_34, L3_35
  L1_33 = A0_32[1]
  L2_34 = -1
  L3_35 = db
  L3_35 = L3_35.getRow
  L3_35 = L3_35("DhcpfixedIpAddress", "Name", L1_33)
  if L3_35 == nil then
    L3_35 = {}
    L3_35["DhcpfixedIpAddress.Name"] = L1_33
    L3_35["DhcpfixedIpAddress.LogicalIfName"] = "LAN"
    L3_35["DhcpfixedIpAddress._ROWID_"] = "-1"
    L3_35["DhcpfixedIpAddress.AssociatingEnabled"] = "0"
    L3_35["DhcpfixedIpAddress.logDroppedPackets"] = "0"
  else
    L2_34 = L3_35["DhcpfixedIpAddress._ROWID_"]
  end
  return L2_34, L3_35
end
function dhcpReservedIPsCfgSave(A0_36)
  local L1_37, L2_38, L3_39
  L2_38 = ""
  L3_39 = nil
  DBTable = "DhcpfixedIpAddress"
  if A0_36["DhcpfixedIpAddress._ROWID_"] == "-1" then
    L1_37, L2_38 = dhcp.fixedIpConfig(A0_36, A0_36["DhcpfixedIpAddress._ROWID_"], "add")
  else
    L1_37, L2_38 = dhcp.fixedIpConfig(A0_36, A0_36["DhcpfixedIpAddress._ROWID_"], "edit")
  end
  if L1_37 == "OK" then
    db.save()
  end
  L3_39 = db.getAttribute("stringsMap", "stringId", L2_38, LANGUAGE) or L2_38
  return L1_37, L3_39
end
function dhcpReservedIPsCfgDel(A0_40)
  local L1_41, L2_42, L3_43, L4_44
  L2_42 = ""
  L3_43 = nil
  L4_44 = "DhcpfixedIpAddress"
  DBTable = L4_44
  L4_44 = {}
  if db.getRow("DhcpfixedIpAddress", "Name", A0_40) == nil or db.getRow("DhcpfixedIpAddress", "Name", A0_40) == {} then
    print("HostName entry doesn't exist")
    return false
  else
    L4_44["lanDhcpReservedIps.cookie"] = db.getRow("DhcpfixedIpAddress", "Name", A0_40)["DhcpfixedIpAddress._ROWID_"]
    L1_41, L2_42 = lanReservedIpsDelete(L4_44)
  end
  if L1_41 == "OK" then
    db.save()
    print("Row Deleted")
  end
  L3_43 = db.getAttribute("stringsMap", "stringId", L2_42, LANGUAGE)
  return L1_41, L3_43
end
function dhcpReservedIPsCfgDelall()
  local L0_45, L1_46
  L0_45 = "ERROR"
  L1_46 = {}
  L1_46 = db.getTable("DhcpfixedIpAddress")
  if L1_46 == nil or L1_46 == {} then
    return "ERROR", "No exisitng dhcp reserved ip entries to delete"
  else
    L0_45 = lanReservedIpsDeleteAll()
  end
  if L0_45 == 0 then
    L0_45 = "OK"
    db.save()
  else
    L0_45 = "ERROR"
  end
  return L0_45
end
function dhcpReservedIPsCfgInputVal(A0_47)
  local L1_48, L2_49, L3_50, L4_51, L5_52, L6_53, L7_54, L8_55, L9_56, L10_57, L11_58, L12_59, L13_60, L14_61, L15_62
  L1_48 = A0_47["DhcpfixedIpAddress.AssociatingEnabled"]
  if L1_48 == nil then
    L1_48 = printCLIError
    L2_49 = "Invalid Association."
    L1_48(L2_49)
    L1_48 = false
    return L1_48
  end
  L1_48 = A0_47["DhcpfixedIpAddress.AssociatingEnabled"]
  if L1_48 == "1" then
    L1_48 = A0_47["DhcpfixedIpAddress.LogStatus"]
    if L1_48 == nil then
      L1_48 = printCLIError
      L2_49 = "Please enter the LogStatus."
      L1_48(L2_49)
      L1_48 = false
      return L1_48
    end
  end
  L1_48 = A0_47["DhcpfixedIpAddress.AssociatingEnabled"]
  if L1_48 == "0" then
    L1_48 = A0_47["DhcpfixedIpAddress.LogStatus"]
    if L1_48 == "1" then
      L1_48 = printCLIError
      L2_49 = "Enable Association First."
      L1_48(L2_49)
      L1_48 = false
      return L1_48
    end
  end
  L1_48 = A0_47["DhcpfixedIpAddress.Name"]
  if L1_48 == nil then
    L1_48 = printCLIError
    L2_49 = "Please enter a valid Host Name"
    L1_48(L2_49)
    L1_48 = false
    return L1_48
  end
  L1_48 = A0_47["DhcpfixedIpAddress.IpAddr"]
  if L1_48 == nil then
    L1_48 = printCLIError
    L2_49 = "Invalid IP Address for the fixed mac address entry."
    L1_48(L2_49)
    L1_48 = false
    return L1_48
  else
    L1_48 = IpMacBinding_dhcpVal
    L2_49 = A0_47["DhcpfixedIpAddress.IpAddr"]
    L1_48 = L1_48(L2_49)
    if L1_48 == false then
      L2_49 = printCLIError
      L3_50 = "Reserved IP cannot be configured outside DHCP Server address range pool of Vlan. Please configure different IP"
      L2_49(L3_50)
      L2_49 = false
      return L2_49
    end
  end
  L1_48 = A0_47["DhcpfixedIpAddress.MacAddr"]
  if L1_48 == nil then
    L1_48 = printCLIError
    L2_49 = "Please enter valid MAC address value"
    L1_48(L2_49)
    L1_48 = false
    return L1_48
  end
  L1_48 = A0_47["DhcpfixedIpAddress._ROWID_"]
  if L1_48 == "-1" then
    L1_48 = db
    L1_48 = L1_48.existsRow
    L2_49 = "DhcpfixedIpAddress"
    L3_50 = "MacAddr"
    L4_51 = A0_47["DhcpfixedIpAddress.MacAddr"]
    L1_48 = L1_48(L2_49, L3_50, L4_51)
    if L1_48 then
      L1_48 = printCLIError
      L2_49 = "Configured MAC Address Is Already Existing"
      L1_48(L2_49)
      L1_48 = false
      return L1_48
    end
    L1_48 = db
    L1_48 = L1_48.existsRow
    L2_49 = "DhcpfixedIpAddress"
    L3_50 = "IpAddr"
    L4_51 = A0_47["DhcpfixedIpAddress.IpAddr"]
    L1_48 = L1_48(L2_49, L3_50, L4_51)
    if L1_48 then
      L1_48 = printCLIError
      L2_49 = "Configured Ip Address Is Already Existing"
      L1_48(L2_49)
      L1_48 = false
      return L1_48
    end
    L1_48 = db
    L1_48 = L1_48.existsRow
    L2_49 = "DhcpfixedIpAddress"
    L3_50 = "Name"
    L4_51 = A0_47["DhcpfixedIpAddress.Name"]
    L1_48 = L1_48(L2_49, L3_50, L4_51)
    if L1_48 then
      L1_48 = printCLIError
      L2_49 = "Configured Host Name Is Already Existing"
      L1_48(L2_49)
      L1_48 = false
      return L1_48
    end
  end
  L1_48 = A0_47["DhcpfixedIpAddress._ROWID_"]
  L2_49 = A0_47["DhcpfixedIpAddress.AssociatingEnabled"]
  L3_50 = A0_47["DhcpfixedIpAddress.MacAddr"]
  L4_51 = A0_47["DhcpfixedIpAddress.IpAddr"]
  if L1_48 ~= "-1" and L2_49 == "1" then
    L5_52 = db
    L5_52 = L5_52.getRow
    L6_53 = "DhcpfixedIpAddress"
    L7_54 = "_ROWID_"
    L8_55 = L1_48
    L5_52 = L5_52(L6_53, L7_54, L8_55)
    if L5_52 == nil then
      L6_53 = print
      L7_54 = "Error in getting values from DhcpfixedIpAddress for "
      L8_55 = " rowid : "
      L9_56 = L1_48
      L7_54 = L7_54 .. L8_55 .. L9_56
      L6_53(L7_54)
      L6_53 = false
      return L6_53
    end
    L6_53, L7_54, L8_55 = nil, nil, nil
    L6_53 = L5_52["DhcpfixedIpAddress.Name"]
    L7_54 = L5_52["DhcpfixedIpAddress.IpAddr"]
    L8_55 = L5_52["DhcpfixedIpAddress.MacAddr"]
    L9_56 = "SourceMACAddress != '"
    L10_57 = L8_55
    L14_61 = L6_53
    L15_62 = "'"
    L9_56 = L9_56 .. L10_57 .. L11_58 .. L12_59 .. L13_60 .. L14_61 .. L15_62
    L10_57 = db
    L10_57 = L10_57.getRowsWhere
    L10_57 = L10_57(L11_58, L12_59)
    if L10_57 ~= nil then
      for L14_61, L15_62 in L11_58(L12_59) do
        for _FORV_19_, _FORV_20_ in pairs(L15_62) do
          if _FORV_19_ == "IPMACBinding.SourceMACAddress" and _FORV_20_ == L3_50 then
            printCLIError("MAC Address already configured")
            return false
          end
          if _FORV_19_ == "IPMACBinding.IPAddress" and _FORV_20_ == L4_51 then
            printCLIError("IP Address already configured")
            return false
          end
        end
      end
    end
  end
  L5_52 = true
  return L5_52
end
function dhcpMacFilteringCfgInit(A0_63)
  local L1_64, L2_65, L3_66
  L1_64 = A0_63[1]
  L2_65 = -1
  L3_66 = db
  L3_66 = L3_66.getRow
  L3_66 = L3_66("DhcpMacExclusion", "MacAddress", L1_64)
  if L3_66 == nil then
    L3_66 = {}
    L3_66["DhcpMacExclusion.MacAddress"] = L1_64
    L3_66["DhcpMacExclusion.LogicalIfName"] = "LAN"
  else
    L2_65 = L3_66["DhcpMacExclusion._ROWID_"]
  end
  return L2_65, L3_66
end
function dhcpMacFilteringCfgSave(A0_67)
  local L1_68, L2_69, L3_70
  L2_69 = ""
  L3_70 = nil
  DBTable = "DhcpMacExclusion"
  if A0_67["DhcpMacExclusion._ROWID_"] == nil then
    L1_68, L3_70 = dhcp.macFilteringConfig(A0_67, "-1", "add")
  else
    L1_68, L3_70 = dhcp.macFilteringConfig(A0_67, A0_67["DhcpMacExclusion._ROWID_"], "edit")
  end
  if L1_68 == "OK" then
    db.save()
  end
  L3_70 = db.getAttribute("stringsMap", "stringId", L2_69, LANGUAGE)
  return L1_68, L3_70
end
function dhcpMacFilteringCfgDel(A0_71)
  local L1_72, L2_73, L3_74
  L1_72 = "ERROR"
  L2_73 = ""
  L3_74 = nil
  DBTable = "DhcpMacExclusion"
  L1_72, L3_74 = dhcp.macFilteringConfig(A0_71, A0_71["DhcpMacExclusion._ROWID_"], "delete")
  if L1_72 == "OK" then
    db.save()
  end
  L3_74 = db.getAttribute("stringsMap", "stringId", L2_73, LANGUAGE)
  return L1_72, L3_74
end
function dhcpMacFilteringCfgInputVal(A0_75)
  if db.getRowsWhere("DhcpfixedIpAddress", "MacAddr = '" .. A0_75["DhcpMacExclusion.MacAddress"] .. "'") ~= nil and #db.getRowsWhere("DhcpfixedIpAddress", "MacAddr = '" .. A0_75["DhcpMacExclusion.MacAddress"] .. "'") ~= 0 then
    printCLIError("MAC conflict with dhcp reserved ips entry")
    return false
  end
  if A0_75["DhcpMacExclusion.AllowFlag"] == nil then
    printCLIError("Invalid Allow/Deny Flag.")
    return false
  end
  return true
end
function dhcpOption60CfgInit(A0_76)
  local L1_77, L2_78, L3_79
  L1_77 = A0_76[1]
  L2_78 = -1
  L3_79 = db
  L3_79 = L3_79.getRow
  L3_79 = L3_79("Option60", "VendorId", L1_77)
  if L3_79 == nil then
    L3_79 = {}
    L3_79["Option60.VendorId"] = L1_77
  else
    L2_78 = L3_79["Option60._ROWID_"]
  end
  return L2_78, L3_79
end
function dhcpOption60CfgSave(A0_80)
  local L1_81, L2_82, L3_83
  L1_81 = "ERROR"
  L2_82 = ""
  L3_83 = nil
  DBTable = "Option60"
  if A0_80["Option60._ROWID_"] == nil then
    L1_81, L3_83 = dhcp.option60Config(A0_80, "-1", "add")
  else
    L1_81, L3_83 = dhcp.option60Config(A0_80, A0_80["Option60._ROWID_"], "edit")
  end
  if L1_81 == "OK" then
    db.save()
  end
  L3_83 = db.getAttribute("stringsMap", "stringId", L2_82, LANGUAGE)
  return L1_81, L3_83
end
function dhcpOption60CfgDel(A0_84)
  local L1_85, L2_86, L3_87
  L1_85 = "ERROR"
  L2_86 = ""
  L3_87 = nil
  DBTable = "Option60"
  L1_85, L3_87 = dhcp.option60Config(A0_84, A0_84["Option60._ROWID_"], "delete")
  if L1_85 == "OK" then
    db.save()
  end
  L3_87 = db.getAttribute("stringsMap", "stringId", L2_86, LANGUAGE)
  return L1_85, L3_87
end
function dhcpOption60CfgInputVal(A0_88)
  if A0_88["Option60.StartIp"] == nil then
    printCLIError("Invalid Dhcp start ip address of dhcp option 60 pool.")
    return false
  end
  if A0_88["Option60.EndIp"] == nil then
    printCLIError("Invalid Dhcp end ip address of dhcp option 60 pool.")
    return false
  end
  if A0_88["Option60.PriorityLevel"] == nil or tonumber(A0_88["Option60.PriorityLevel"]) < 0 or tonumber(A0_88["Option60.PriorityLevel"]) > 7 then
    printCLIError("Invalid priority level please enter between 0 and 7 only.")
    return false
  end
  return true
end
function IpMacBinding_dhcpVal(A0_89)
  local L1_90, L2_91
  L1_90 = "logicalIfName !='DMZ'"
  L2_91 = db
  L2_91 = L2_91.getRowsWhere
  L2_91 = L2_91("dhcp", L1_90)
  for _FORV_6_, _FORV_7_ in pairs(L2_91) do
    valid = validationsLuaLib.ipv4AddrTokenAddrRangeCheck(A0_89, _FORV_7_["dhcp.startAddress"], _FORV_7_["dhcp.endAddress"])
    if valid == 0 then
      return true
    end
  end
  return false
end
