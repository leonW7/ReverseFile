require("teamf1lualib/dhcpc")
function DhcpcConfigGet()
  local L0_0
  L0_0 = {}
  resTab.insertField(L0_0, "Get DNS Automatically from ISP", db.getRow("Dhcpc", "_ROWID_", 1)["Dhcpc.GetDnsFromIsp"])
  resTab.insertField(L0_0, "Primary DNS Server", db.getRow("Dhcpc", "_ROWID_", 1)["Dhcpc.PrimaryDns"] or "")
  resTab.insertField(L0_0, "Secondary DNS Server", db.getRow("Dhcpc", "_ROWID_", 1)["Dhcpc.SecondaryDns"] or "")
  printLabel("DHCPC configuration")
  resTab.print(L0_0, 0)
end
function dhcpcConfigSave(A0_1)
  local L1_2
  L1_2 = "ERROR"
  L1_2 = dhcpc.config(A0_1, A0_1["Dhcpc._ROWID_"], "edit")
  if L1_2 then
    db.setAttribute("NimfConf", "_ROWID_", "1", "IfStatus", "1")
    L1_2 = "OK"
    db.save()
  end
  return L1_2
end
function dhcpcConfigInit(A0_3)
  local L1_4, L2_5
  L1_4 = {}
  L2_5 = 1
  L1_4 = db.getRow("Dhcpc", "Dhcpc._ROWID_", L2_5)
  return L2_5, L1_4
end
