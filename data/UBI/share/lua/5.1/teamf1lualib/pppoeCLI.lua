require("teamf1lualib/pppoe")
function pppoeConfigGet()
  local L0_0
  L0_0 = {}
  resTab.insertField(L0_0, "Username", db.getRow("Pppoe", "_ROWID_", 1)["Pppoe.UserName"])
  resTab.insertField(L0_0, "Password", db.getRow("Pppoe", "_ROWID_", 1)["Pppoe.Password"])
  resTab.insertField(L0_0, "Authentication Type", db.getRow("Pppoe", "_ROWID_", 1)["Pppoe.AuthType"])
  resTab.insertField(L0_0, "Service Name", db.getRow("Pppoe", "_ROWID_", 1)["Pppoe.Service"] or "")
  resTab.insertField(L0_0, "Enable Compression Negotiation", db.getRow("Pppoe", "_ROWID_", 1)["Pppoe.Compression"])
  resTab.insertField(L0_0, "Connection Mode", db.getRow("Pppoe", "_ROWID_", 1)["Pppoe.IdleTimeOutFlag"])
  resTab.insertField(L0_0, "Idle Timeout", db.getRow("Pppoe", "_ROWID_", 1)["Pppoe.IdleTimeOutValue"])
  resTab.insertField(L0_0, "IP Address", db.getRow("Pppoe", "_ROWID_", 1)["Pppoe.StaticIp"])
  resTab.insertField(L0_0, "IP Subnet Mask", db.getRow("Pppoe", "_ROWID_", 1)["Pppoe.NetMask"])
  resTab.insertField(L0_0, "Get Automatically from ISP", db.getRow("Pppoe", "_ROWID_", 1)["Pppoe.GetIpFromIsp"])
  resTab.insertField(L0_0, "Use These DNS Servers", db.getRow("Pppoe", "_ROWID_", 1)["Pppoe.GetDnsFromIsp"])
  resTab.insertField(L0_0, "Primary DNS Server", db.getRow("Pppoe", "_ROWID_", 1)["Pppoe.PrimaryDns"] or "")
  resTab.insertField(L0_0, "Secondary DNS Server", db.getRow("Pppoe", "_ROWID_", 1)["Pppoe.SecondaryDns"] or "")
  printLabel("PPPOE configuration")
  resTab.print(L0_0, 0)
end
function pppoeConfigSave(A0_1)
  local L1_2
  L1_2 = "ERROR"
  L1_2 = pppoe.config(A0_1, A0_1["Pppoe._ROWID_"], "edit")
  if L1_2 then
    db.setAttribute("NimfConf", "_ROWID_", "1", "IfStatus", "1")
    L1_2 = "OK"
    db.save()
  end
  return L1_2
end
function pppoeConfigInit(A0_3)
  local L1_4, L2_5
  L1_4 = {}
  L2_5 = 1
  L1_4 = db.getRow("Pppoe", "Pppoe._ROWID_", L2_5)
  return L2_5, L1_4
end
