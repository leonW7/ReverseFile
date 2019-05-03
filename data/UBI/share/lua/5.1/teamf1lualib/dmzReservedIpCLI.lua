local L0_0
L0_0 = require
L0_0("teamf1lualib/dhcp")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("validationsLuaLib")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.validations")
function dmzDhcpReservedIPsCfgInit(A0_1)
  local L1_2, L2_3, L3_4
  L1_2 = A0_1[1]
  L2_3 = -1
  L3_4 = db
  L3_4 = L3_4.getRow
  L3_4 = L3_4("DhcpfixedIpAddress", "MacAddr", L1_2)
  if L3_4 == nil then
    L3_4 = {}
    L3_4["DhcpfixedIpAddress.Name"] = ""
    L3_4["DhcpfixedIpAddress.MacAddr"] = L1_2
    L3_4["DhcpfixedIpAddress.LogicalIfName"] = "DMZ"
    L3_4["DhcpfixedIpAddress.AssociatingEnabled"] = "0"
    L3_4["DhcpfixedIpAddress._ROWID_"] = "-1"
  else
    L2_3 = L3_4["DhcpfixedIpAddress._ROWID_"]
  end
  return L2_3, L3_4
end
function dmzDhcpReservedIPsCfgSave(A0_5)
  local L1_6, L2_7, L3_8
  L2_7 = ""
  L3_8 = nil
  DBTable = "DhcpfixedIpAddress"
  if A0_5["DhcpfixedIpAddress._ROWID_"] == "-1" then
    L1_6, L2_7 = dhcp.fixedIpConfig(A0_5, A0_5["DhcpfixedIpAddress._ROWID_"], "add")
  else
    L1_6, L2_7 = dhcp.fixedIpConfig(A0_5, A0_5["DhcpfixedIpAddress._ROWID_"], "edit")
  end
  if L1_6 == "OK" then
    db.save()
  end
  L3_8 = db.getAttribute("stringsMap", "stringId", L2_7, LANGUAGE)
  return L1_6, L3_8
end
function dmzIPMacBinding_dhcpVal(A0_9)
  local L1_10, L2_11
  L1_10 = "logicalIfName ='DMZ'"
  L2_11 = db
  L2_11 = L2_11.getRowsWhere
  L2_11 = L2_11("dhcp", L1_10)
  for _FORV_6_, _FORV_7_ in pairs(L2_11) do
    valid = validationsLuaLib.ipv4AddrTokenAddrRangeCheck(A0_9, _FORV_7_["dhcp.startAddress"], _FORV_7_["dhcp.endAddress"])
    if valid == 0 then
      return true
    end
  end
  return false
end
function dmzDhcpReservedIPsCfgInputVal(A0_12)
  local L1_13, L2_14
  if db.getAttribute("ConfigPort", "_ROWID_", "1", "LogicalIfName") ~= "DMZ" then
    if UNIT_NAME == "DSR-1000N" or UNIT_NAME == "DSR-1000" or UNIT_NAME == "DSR-500N" or UNIT_NAME == "DSR-500" or UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-500AC" then
      printCLIError("Please set the Configurable port to DMZ")
    else
      printCLIError("Please enable DMZ first")
    end
    return false
  end
  if A0_12["DhcpfixedIpAddress.IpAddr"] == nil or A0_12["DhcpfixedIpAddress.IpAddr"] == "" then
    printCLIError("Invalid IP Address for the fixed mac address entry.")
    return false
  end
  L1_13 = util.split(A0_12["DhcpfixedIpAddress.IpAddr"], ".")
  if L1_13 == nil or tonumber(L1_13[1]) == 224 or tonumber(L1_13[1]) > 224 or tonumber(L1_13[1]) == 0 or A0_12["DhcpfixedIpAddress.IpAddr"] == "0.0.0.0" then
    printCLIError("Invalid IP address. Please enter a value a valid IP address.")
    return false
  end
  L1_13 = A0_12["DhcpfixedIpAddress.IpAddr"]
  valid, L2_14 = validationsLuaLib.ipv4AddrAsciiToNum(L1_13)
  if valid == -1 then
    printCLIError("Invalid IP address. Please enter a value a valid IP address.")
    return false
  end
  if dmzIPMacBinding_dhcpVal(A0_12["DhcpfixedIpAddress.IpAddr"]) ~= true then
    printCLIError("IP Address is not in the range of DMZ network")
    return false
  end
  if _UPVALUE0_.isMulticastMac(A0_12["DhcpfixedIpAddress.MacAddr"]) == true then
    printCLIError("Multicast Mac address is not allowed.")
    return false
  end
  return true
end
function dmzDhcpReservedIPsCfgDel(A0_15)
  local L1_16, L2_17, L3_18, L4_19
  L2_17 = ""
  L3_18 = nil
  L4_19 = "DhcpfixedIpAddress"
  DBTable = L4_19
  L4_19 = db
  L4_19 = L4_19.getRow
  L4_19 = L4_19("DhcpfixedIpAddress", "MacAddr", A0_15)
  if L4_19 == nil then
    print("Macaddress entry doesn't exist")
    return false
  else
    L1_16, L2_17 = dhcp.fixedIpConfig(L4_19, L4_19["DhcpfixedIpAddress._ROWID_"], "delete")
  end
  if L1_16 == "OK" then
    db.save()
    print("Row Deleted")
  end
  L3_18 = db.getAttribute("stringsMap", "stringId", L2_17, LANGUAGE)
  return L1_16, L3_18
end
function dmzDhcpReservedIPSetupGet()
  local L0_20, L1_21
  L0_20 = db
  L0_20 = L0_20.getTable
  L1_21 = "DhcpfixedIpAddress"
  L0_20 = L0_20(L1_21)
  L1_21 = {}
  printLabel("List of DMZ DHCP Reserved Addresses")
  for _FORV_7_, _FORV_8_ in pairs(L0_20) do
    if L0_20[0 + 1]["DhcpfixedIpAddress.LogicalIfName"] == "DMZ" and 0 + 1 ~= nil then
      resTab.insertField(L1_21, "IP Address", L0_20[0 + 1]["DhcpfixedIpAddress.IpAddr"] or "")
      resTab.insertField(L1_21, "MAC Address", L0_20[0 + 1]["DhcpfixedIpAddress.MacAddr"] or "")
    end
  end
  resTab.print(L1_21, 0)
end
function dmzDhcpLeasedListGet()
  local L0_22, L1_23
  L0_22 = db
  L0_22 = L0_22.getTable
  L1_23 = "DhcpLeasedClients"
  L0_22 = L0_22(L1_23)
  L1_23 = {}
  printLabel("List of Available DMZ DHCP Leased Clients")
  for _FORV_7_, _FORV_8_ in pairs(L0_22) do
    if L0_22["0" + 1]["DhcpfixedIpAddress.LogicalIfName"] == "DMZ" and "0" + 1 ~= nil then
      resTab.insertField(L1_23, "IP Address", L0_22["0" + 1]["DhcpLeasedClients.IPAddr"] or "")
      resTab.insertField(L1_23, "Mac Address", L0_22["0" + 1]["DhcpLeasedClients.MacAddr"] or "")
    end
  end
  resTab.print(L1_23, 0)
end
