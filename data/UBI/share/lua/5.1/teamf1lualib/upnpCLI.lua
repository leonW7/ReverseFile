require("teamf1lualib/upnp")
function upnpPortmapGet()
  local L0_0, L1_1
  L0_0 = {}
  L1_1 = db
  L1_1 = L1_1.getTable
  L1_1 = L1_1("upnpPortMap")
  for _FORV_5_, _FORV_6_ in pairs(L1_1) do
    resTab.insertField(L0_0, "Active", _FORV_6_["upnpPortMap.active"])
    resTab.insertField(L0_0, "Protocol", _FORV_6_["upnpPortMap.protocol"])
    resTab.insertField(L0_0, "Int. Port", _FORV_6_["upnpPortMap.intPort"])
    resTab.insertField(L0_0, "Ext. Port", _FORV_6_["upnpPortMap.extPort"])
    resTab.insertField(L0_0, "IP Address", _FORV_6_["upnpPortMap.ipAddr"])
  end
  printLabel("UPnP Portmap Table")
  resTab.print(L0_0, 0)
end
function upnpAvailVlan()
  local L0_2, L1_3, L2_4
  L0_2 = {}
  L1_3 = "portName = 'dummy'"
  L2_4 = db
  L2_4 = L2_4.getRowsWhere
  L2_4 = L2_4("vlan", L1_3, false)
  printLabel("Available VLAN Table")
  for _FORV_6_, _FORV_7_ in pairs(L2_4) do
    if _FORV_7_["vlan.vlanId"] == "1" then
      print("LAN")
    else
      print("VLAN" .. _FORV_7_["vlan.vlanId"])
    end
  end
end
function upnpGet()
  local L0_5, L1_6
  L1_6 = {}
  if db.getAttribute("upnp", "_ROWID_", 1, "upnpEnable") ~= "1" then
    print("\n" .. "UPnP is disabled" .. "\n")
  else
    if db.getRow("upnp", "_ROWID_", 1)["upnp.upnpEnable"] == "0" then
      L0_5 = "Disabled"
    else
      L0_5 = "Enabled"
    end
    resTab.insertField(L1_6, "Advertisement Period", db.getRow("upnp", "_ROWID_", 1)["upnp.advPeriod"])
    resTab.insertField(L1_6, "Advertisement Time To Live", db.getRow("upnp", "_ROWID_", 1)["upnp.advTimeToLive"])
    if db.getRow("upnp", "_ROWID_", 1)["upnp.interfaceName"]:sub(4) == "1" then
      resTab.insertField(L1_6, "interface Name", "LAN")
    else
      resTab.insertField(L1_6, "interface Name", "VLAN" .. db.getRow("upnp", "_ROWID_", 1)["upnp.interfaceName"]:sub(4))
    end
    resTab.insertField(L1_6, "Upnp Status", L0_5)
    printLabel("UPnP configuration")
    resTab.print(L1_6, 0)
  end
end
function upnpConfigSave(A0_7)
  local L1_8, L2_9, L3_10, L4_11
  L1_8 = "ERROR"
  L2_9 = ""
  L3_10 = ""
  L4_11 = ""
  DBTable = "upnp"
  if A0_7["upnp.interfaceName"] == "LAN" then
    L4_11 = "LAN"
  else
    L4_11 = string.sub(A0_7["upnp.interfaceName"], 2, string.len(A0_7["upnp.interfaceName"]))
  end
  A0_7["upnp.interfaceName"] = db.getRow("networkInterface", "logicalIfName", L4_11)["networkInterface.VirtualIfName"]
  L1_8, L2_9 = upnp.config(A0_7, A0_7["upnp._ROWID_"], "edit")
  if L1_8 == "OK" then
    db.save()
  end
  L3_10 = db.getAttribute("stringsMap", "stringId", L2_9, LANGUAGE)
  return L1_8, L3_10
end
function upnpConfigInit(A0_12)
  local L1_13, L2_14
  L1_13 = {}
  L2_14 = 1
  L1_13 = db.getRow("upnp", "upnp._ROWID_", L2_14)
  return L2_14, L1_13
end
function upnpConfigVal(A0_15)
  local L1_16, L2_17
  L1_16 = ""
  L2_17 = ""
  if string.sub(A0_15["upnp.interfaceName"], 1, 1) == "L" or string.sub(A0_15["upnp.interfaceName"], 1, 1) == "V" then
    if A0_15["upnp.interfaceName"] == "LAN" then
      L2_17 = "LAN"
    else
      L2_17 = string.sub(A0_15["upnp.interfaceName"], 2, string.len(A0_15["upnp.interfaceName"]))
    end
    L1_16 = db.getAttribute("networkInterface", "LogicalIfName", L2_17, "ifType")
  else
    L1_16 = "lanbridges"
  end
  if L1_16 ~= "bridge" or L1_16 == nil then
    printCLIError("The Interface name is not valid")
    return false
  end
  return true
end
