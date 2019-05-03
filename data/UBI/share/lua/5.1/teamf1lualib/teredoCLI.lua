local L0_0
L0_0 = require
L0_0("teamf1lualib/bl_teredoTunnel")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/errorMap")
L0_0 = require
L0_0 = L0_0("com.teamf1.bl.ipv6.teredo")
function teredoTunnelCfgInit(A0_1)
  configRow = db.getRow("teredoTunnel", "_ROWID_", "1")
  if configRow == nil then
    configRow = db.getDefaults(true, "teredoTunnel")
  end
  return 1, configRow
end
function teredoTunnelCfgSave(A0_2)
  local L1_3
  L1_3 = "teredoTunnel"
  DBTable = L1_3
  L1_3 = _UPVALUE0_
  L1_3 = L1_3.teredoConfigSet
  L1_3 = L1_3(A0_2)
  if L1_3 == _UPVALUE1_.SUCCESS then
    errorFlag = "OK"
  else
    errorFlag = "ERROR"
    statusMessage = _UPVALUE2_.errorStringGet(L1_3)
  end
  return errorFlag, statusMessage
end
function teredoTunnelCfgInputVal(A0_4)
  if db.getAttribute("networkInfo", "_ROWID_", "1", "netWorkMode") == "1" then
    printCLIError("Please Set IP Mode to IPv4/IPv6 to configure IPv6 Tunnels.")
    return false
  end
  return true
end
