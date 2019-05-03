require("teamf1lualib/fwView")
HW_OFFLOAD_SCRIPT = "/pfrm2.0/etc/hardwareOffload.lua"
SYSTEM_DB_FILE_NAME = "/tmp/system.db"
PFRM_BIN_PATH = "/pfrm2.0/bin/lua"
function vpnPassthroughInfoGet(A0_0)
  local L1_1
  L1_1 = {}
  printLabel("Passthrough")
  row = db.getRow("AttackChecks", "AttackChecks._ROWID_", 1)
  print("IPSec VPN Passthrough:")
  print("                      ")
  if row["AttackChecks.IpsecPassthrough"] == "0" then
    print(" IPSec Passthrough : Disabled")
  else
    print(" IPSec Passthrough : Enabled")
  end
  if row["AttackChecks.PptpPassthrough"] == "0" then
    print(" PPTP Passthrough  : Disabled")
  else
    print(" PPTP Passthrough  : Enabled")
  end
  if row["AttackChecks.L2tpPassthrough"] == "0" then
    print(" L2TP Passthrough  : Disabled")
  else
    print(" L2TP Passthrough  : Enabled")
  end
end
function vpnpassthroughCfgSave(A0_2)
  local L1_3, L2_4, L3_5
  L1_3 = "ERROR"
  L2_4 = ""
  L3_5 = ""
  DBTable = "AttackChecks"
  L1_3, L3_5 = fwView.attackChecksConfig(A0_2, 1, "edit")
  if L1_3 == "OK" then
    db.save()
  end
  return L1_3, L3_5
end
function vpnpassthroughCfgInit(A0_6)
  local L1_7, L2_8
  L1_7 = 1
  L2_8 = db
  L2_8 = L2_8.getRow
  L2_8 = L2_8("AttackChecks", "_ROWID_", L1_7)
  if L2_8 == nil then
    return L1_7, {}
  end
  L1_7 = L2_8["AttackChecks._ROWID_"]
  return L1_7, L2_8
end
