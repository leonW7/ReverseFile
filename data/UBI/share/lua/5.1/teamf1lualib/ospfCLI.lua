require("teamf1lualib/ospf")
function ospfCfgInit(A0_0)
  local L1_1
  L1_1 = {}
  L1_1 = db.getRow("ospf", "ospf.LogicalIfName", A0_0[1])
  if L1_1 == nil then
    print("Selected Interface Doesnt Exist in cmd : net routing ospfv2 configure <interface>")
    return false
  end
  return rowId, L1_1
end
function ospfCfgSave(A0_2)
  local L1_3, L2_4, L3_5
  L1_3 = ""
  L2_4 = ""
  L3_5 = ""
  L1_3, L2_4 = ospf.edit(A0_2, A0_2["ospf._ROWID_"])
  if L1_3 == "OK" then
    db.save()
  end
  L3_5 = db.getAttribute("stringsMap", "stringId", L2_4, LANGUAGE)
  return L1_3, L3_5
end
function ospfCfgInputVal(A0_6)
  if db.getAttribute("ospf", "_ROWID_", A0_6["ospf._ROWID_"], "ospfEnable") == "0" and A0_6["ospf.ospfEnable"] == "0" then
    printCLIError("Please enable OSPFv2 first on " .. A0_6["ospf.LogicalIfName"])
    return false
  end
  if A0_6["ospf.ospfEnable"] == nil or A0_6["ospf.ospfEnable"] == "" then
    printCLIError("Please enable or disable OSPFv2")
    return false
  end
  if A0_6["ospf.helloInterval"] == nil or A0_6["ospf.helloInterval"] == "" then
    printCLIError("Please enter Hello Interval")
    return false
  end
  if A0_6["ospf.deadInterval"] == nil or A0_6["ospf.deadInterval"] == "" then
    printCLIError("Please enter Dead Interval")
    return false
  end
  if A0_6["ospf.areaId"] == nil or A0_6["ospf.areaId"] == "" then
    printCLIError("Please enter Area Id")
    return false
  end
  if A0_6["ospf.priority"] == nil or A0_6["ospf.priority"] == "" then
    printCLIError("Please enter priority")
    return false
  end
  if A0_6["ospf.cost"] == nil or A0_6["ospf.cost"] == "" then
    printCLIError("Please enter cost")
    return false
  end
  if tonumber(A0_6["ospf.helloInterval"]) < 1 or tonumber(A0_6["ospf.helloInterval"]) > 65535 then
    printCLIError("Please enter Hello Interval in range 1 - 65535")
    return false
  end
  if tonumber(A0_6["ospf.deadInterval"]) < 1 or tonumber(A0_6["ospf.deadInterval"]) > 65535 then
    printCLIError("Please enter Dead Interval in range 1 - 65535")
    return false
  end
  if tonumber(A0_6["ospf.areaId"]) < 0 or tonumber(A0_6["ospf.areaId"]) > 200 then
    printCLIError("Please enter Area Id in range 0 - 200")
    return false
  end
  if tonumber(A0_6["ospf.priority"]) < 0 or tonumber(A0_6["ospf.priority"]) > 255 then
    printCLIError("Please enter priority in range 0 - 255")
    return false
  end
  if tonumber(A0_6["ospf.cost"]) < 1 or tonumber(A0_6["ospf.cost"]) > 65535 then
    printCLIError("Please enter cost in range 1 - 65535")
    return false
  end
  if A0_6["ospf.authType"] == "Simple" then
    if A0_6["ospf.textAuthKey"] == nil or A0_6["ospf.textAuthKey"] == "" then
      printCLIError("Please enter auth_key")
      return false
    end
    if string.len(A0_6["ospf.textAuthKey"]) > 8 then
      printCLIError("auth_key length is allowed upto maximum 8 characters")
      return false
    end
  end
  if A0_6["ospf.authType"] == "Md5" then
    if A0_6["ospf.md5KeyId"] == nil or A0_6["ospf.md5KeyId"] == "" or A0_6["ospf.md5AuthKey"] == nil or A0_6["ospf.md5AuthKey"] == "" then
      printCLIError("Please enter md5_key_id or md5_auth_key")
      return false
    end
    if string.len(A0_6["ospf.md5AuthKey"]) > 16 then
      printCLIError("md5_auth_key length is allowed upto maximum 16 characters")
      return false
    end
    if 1 > tonumber(A0_6["ospf.md5KeyId"]) or 255 < tonumber(A0_6["ospf.md5KeyId"]) then
      printCLIError("Please enter md5_key_id in range")
      return false
    end
  end
  if A0_6["ospf.ospfEnable"] == "1" and A0_6["ospf.LogicalIfName"]:find("WAN") == 1 and A0_6["ospf.LogicalIfName"]:find("WAN") == 3 and A0_6["ospf.lanEnable"] == nil then
    printCLIError("Please disable/enable lanEnable option for exchanging LAN routes on WAN interface")
    return false
  end
end
function ospf6CfgInit(A0_7)
  local L1_8
  L1_8 = {}
  L1_8 = db.getRow("ospf6", "ospf6.LogicalIfName", A0_7[1])
  if L1_8 == nil then
    print("Selected Interface Doesnt Exist in cmd : net routing ospfv2 configure <interface>")
    return false
  end
  return rowId, L1_8
end
function ospf6CfgSave(A0_9)
  local L1_10, L2_11, L3_12, L4_13
  L1_10 = ""
  L2_11 = ""
  L3_12 = ""
  L4_13 = A0_9["ospf6._ROWID_"]
  L1_10, L2_11 = ospf6.edit(A0_9, A0_9["ospf6._ROWID_"])
  if L1_10 == "OK" then
    db.save()
  end
  L3_12 = db.getAttribute("stringsMap", "stringId", L2_11, LANGUAGE)
  return L1_10, L3_12
end
function ospf6CfgInputVal(A0_14)
  if db.getAttribute("networkInfo", "_ROWID_", "1", "netWorkMode") == "1" then
    printCLIError("Please Set IP Mode to IPv4/IPv6")
    return false
  end
  if db.getAttribute("ospf6", "_ROWID_", A0_14["ospf6._ROWID_"], "ospf6Enable") == "0" and A0_14["ospf6.ospf6Enable"] == "0" then
    printCLIError("Please enable OSPFv3 first on " .. A0_14["ospf6.LogicalIfName"])
    return false
  end
  if A0_14["ospf6.ospf6Enable"] == nil or A0_14["ospf6.ospf6Enable"] == "" then
    printCLIError("Please enable or disable OSPFv3")
    return false
  end
  if A0_14["ospf6.helloInterval"] == nil or A0_14["ospf6.helloInterval"] == "" then
    printCLIError("Please enter Hello Interval")
    return false
  end
  if A0_14["ospf6.deadInterval"] == nil or A0_14["ospf6.deadInterval"] == "" then
    printCLIError("Please enter Dead Interval")
    return false
  end
  if A0_14["ospf6.priority"] == nil or A0_14["ospf6.priority"] == "" then
    printCLIError("Please enter priority")
    return false
  end
  if A0_14["ospf6.cost"] == nil or A0_14["ospf6.cost"] == "" then
    printCLIError("Please enter cost")
    return false
  end
  if tonumber(A0_14["ospf6.helloInterval"]) < 1 or tonumber(A0_14["ospf6.helloInterval"]) > 65535 then
    printCLIError("Please enter Hello Interval in range 1 - 65535")
    return false
  end
  if tonumber(A0_14["ospf6.deadInterval"]) < 1 or tonumber(A0_14["ospf6.deadInterval"]) > 65535 then
    printCLIError("Please enter Dead Interval in range 1 - 65535")
    return false
  end
  if tonumber(A0_14["ospf6.priority"]) < 0 or tonumber(A0_14["ospf6.priority"]) > 255 then
    printCLIError("Please enter priority in range 0 - 255")
    return false
  end
  if tonumber(A0_14["ospf6.cost"]) < 1 or tonumber(A0_14["ospf6.cost"]) > 65535 then
    printCLIError("Please enter cost in range 1 - 65535")
    return false
  end
end
function ospfInfoGet()
  local L0_15, L1_16, L2_17, L3_18, L4_19, L5_20
  L0_15 = db
  L0_15 = L0_15.getTable
  L1_16 = "ospf"
  L0_15 = L0_15(L1_16)
  L1_16 = {}
  L2_17 = nil
  L3_18 = 0
  L4_19 = ""
  L5_20 = ""
  printLabel("OSPFv2 Configuration")
  if L0_15 == nil then
    print("ospf table not available")
  else
    io.write(string.format([[

%-8s %-14s %-5s %-9s %-14s %-13s %-5s %-8s %-8s %-6s %-16s %-18s 
]], "Status", "Interface", "Area", "Priority", "HelloInterval", "DeadInterval", "Cost", "AuthType", "AuthKey", "Md5Id", "Md5AuthKey", "LAN Route Exchange"))
    io.write(string.format("%-8s %-14s %-5s %-9s %-14s %-13s %-5s %-8s %-8s %-6s %-16s %-18s \n", "------", "---------", "----", "--------", "------------", "-------------", "-----", "--------", "-------", "-----", "-----------", "------------------"))
    for _FORV_9_, _FORV_10_ in pairs(L0_15) do
      L3_18 = L3_18 + 1
      L2_17 = L0_15[L3_18]
      if L2_17["ospf.ospfEnable"] == "1" then
        L4_19 = "Enabled"
      else
        L4_19 = "Disabled"
      end
      if L2_17["ospf.authType"] == "Md5" or L2_17["ospf.authType"] == "None" then
        L2_17["ospf.textAuthKey"] = "N/A"
      end
      if L2_17["ospf.authType"] == "Simple" or L2_17["ospf.authType"] == "None" then
        L2_17["ospf.md5KeyId"] = "N/A"
      end
      if L2_17["ospf.authType"] == "Simple" or L2_17["ospf.authType"] == "None" then
        L2_17["ospf.md5AuthKey"] = "N/A"
      end
      if L2_17["ospf.LogicalIfName"]:find("WAN") == 1 and L2_17["ospf.LogicalIfName"]:find("WAN") == 3 then
        if L2_17["ospf.lanEnable"] == "1" then
          L5_20 = "Enabled"
        else
          L5_20 = "Disabled"
        end
      else
        L5_20 = "N/A"
      end
      io.write(string.format("%-8s %-14s %-5s %-9s %-14s %-13s %-5s %-8s %-10s %-4s %-16s %-18s \n", L4_19, L2_17["ospf.LogicalIfName"], L2_17["ospf.areaId"], L2_17["ospf.priority"], L2_17["ospf.helloInterval"], L2_17["ospf.deadInterval"], L2_17["ospf.cost"], L2_17["ospf.authType"], L2_17["ospf.textAuthKey"], L2_17["ospf.md5KeyId"], L2_17["ospf.md5AuthKey"], L5_20))
    end
  end
end
function ospf6InfoGet()
  local L0_21, L1_22, L2_23, L3_24, L4_25
  L0_21 = db
  L0_21 = L0_21.getTable
  L1_22 = "ospf6"
  L0_21 = L0_21(L1_22)
  L1_22 = {}
  L2_23 = nil
  L3_24 = 0
  L4_25 = ""
  printLabel("OSPFv3 Configuration")
  if L0_21 == nil then
    print("ospf6 table not available")
  else
    for _FORV_8_, _FORV_9_ in pairs(L0_21) do
      L3_24 = L3_24 + 1
      L2_23 = L0_21[L3_24]
      if L3_24 ~= nil then
        resTab.insertField(L1_22, "Interface", L2_23["ospf6.LogicalIfName"] or "")
        if L2_23["ospf6.ospf6Enable"] == "1" then
          L4_25 = "Enabled"
        else
          L4_25 = "Disabled"
        end
        resTab.insertField(L1_22, "Status", L4_25)
        resTab.insertField(L1_22, "Priority", L2_23["ospf6.priority"] or "")
        resTab.insertField(L1_22, "Hello Interval", L2_23["ospf6.helloInterval"] or "")
        resTab.insertField(L1_22, "Dead Interval", L2_23["ospf6.deadInterval"] or "")
        resTab.insertField(L1_22, "Cost", L2_23["ospf6.cost"] or "")
      end
    end
    resTab.print(L1_22, 0)
  end
end
