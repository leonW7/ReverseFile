require("teamf1lualib/ethernet")
require("teamf1lualib/bridgeLib")
function ethCfgInputVal(A0_0)
  if A0_0["ethernet._ROWID_"] == nil then
    printCLIError("Interface not found.")
    return false
  end
  if A0_0["ethernet.vlanId"] == nil or A0_0["ethernet.vlanId"] == "" then
    printCLIError("Invalid VLAN Id for ethernet port.")
    return false
  end
  return true
end
function ethCfgSave(A0_1)
  local L1_2, L2_3, L3_4
  L1_2 = "ERROR"
  L2_3 = ""
  L3_4 = ""
  A0_1["vlan.vlanId"] = A0_1["ethernet.vlanId"]
  if db.getAttribute("ethernet", "_ROWID_", A0_1["ethernet._ROWID_"], "interfaceName") == "eth0" then
    A0_1["bridgePorts.trunk"] = 1
  end
  L1_2, L3_4 = ethernet.ethernet_config(A0_1, A0_1["ethernet._ROWID_"], "edit")
  if L1_2 == "OK" then
    db.save()
  end
  L2_3 = db.getAttribute("stringsMap", "stringId", L3_4, LANGUAGE)
  return L1_2, L2_3
end
function ethCfgInit(A0_5)
  local L1_6, L2_7
  L1_6 = A0_5[1]
  L2_7 = -1
  configRow = db.getRow("ethernet", "ethernet.interfaceName", L1_6)
  if configRow == nil then
    return L2_7, {}
  end
  configRow["vlan.native"] = db.getAttribute("vlan", "vlanId", configRow["ethernet.vlanId"], "native")
  return L2_7, configRow
end
function ethCLIGet(A0_8)
  local L1_9, L2_10
  L1_9 = {}
  L2_10 = 1
  printLabel("Ethernet Interfaces")
  if db.getRow("ethernet", "ethernet.interfaceName", "bdgWAN1") then
    resTab.insertField(L1_9, "S.No.", L2_10)
    resTab.insertField(L1_9, "Interface Name", "bdgWAN1")
    L2_10 = L2_10 + 1
  end
  if db.getRow("ethernet", "ethernet.interfaceName", "bdgWAN2") then
    resTab.insertField(L1_9, "S.No.", L2_10)
    resTab.insertField(L1_9, "Interface Name", "bdgWAN2")
    L2_10 = L2_10 + 1
  end
  if db.getRow("ethernet", "ethernet.interfaceName", "bdg1") then
    resTab.insertField(L1_9, "S.No.", L2_10)
    resTab.insertField(L1_9, "Interface Name", "bdg1")
    resTab.print(L1_9, 0)
  end
end
function ethCLIStatsGet(A0_11)
  local L1_12, L2_13, L3_14
  L1_12 = db
  L1_12 = L1_12.getAttribute
  L2_13 = "environment"
  L3_14 = "name"
  L1_12 = L1_12(L2_13, L3_14, "IFDEVSTATS_PROGRAM", "value")
  L2_13 = os
  L2_13 = L2_13.execute
  L3_14 = L1_12
  L3_14 = L3_14 .. " " .. DB_FILE_NAME
  L2_13(L3_14)
  L2_13 = db
  L2_13 = L2_13.getTable
  L3_14 = "ethernet"
  L2_13 = L2_13(L3_14)
  L3_14 = {}
  for _FORV_7_, _FORV_8_ in pairs(L2_13) do
    resTab.insertField(L3_14, "IFACE", db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_8_["ethernet.interfaceName"])["interfaceStats.interfaceName"])
    resTab.insertField(L3_14, "PktRx", db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_8_["ethernet.interfaceName"])["interfaceStats.rx_packets"])
    resTab.insertField(L3_14, "PktTx", db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_8_["ethernet.interfaceName"])["interfaceStats.tx_packets"])
    resTab.insertField(L3_14, "ByteRx", db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_8_["ethernet.interfaceName"])["interfaceStats.rx_bytes"])
    resTab.insertField(L3_14, "ByteTx", db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_8_["ethernet.interfaceName"])["interfaceStats.tx_bytes"])
    resTab.insertField(L3_14, "ErrRx", db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_8_["ethernet.interfaceName"])["interfaceStats.rx_errors"])
    resTab.insertField(L3_14, "ErrTx", db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_8_["ethernet.interfaceName"])["interfaceStats.tx_errors"])
    resTab.insertField(L3_14, "DropRx", db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_8_["ethernet.interfaceName"])["interfaceStats.rx_dropped"])
    resTab.insertField(L3_14, "DropTx", db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_8_["ethernet.interfaceName"])["interfaceStats.tx_dropped"])
    resTab.insertField(L3_14, "Mcast", db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_8_["ethernet.interfaceName"])["interfaceStats.multicast"])
    resTab.insertField(L3_14, "Coll", db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_8_["ethernet.interfaceName"])["interfaceStats.collisions"])
  end
  printLabel("Ethernet Statistics")
  resTab.print(L3_14, 0)
end
