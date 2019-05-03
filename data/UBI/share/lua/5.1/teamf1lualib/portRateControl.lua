require("teamf1lualib/db")
portRateControlTbl = {}
portRateControlTbl.name = "PortRateControl"
portRateControlTbl.portName = "PortRateControl.portName"
portRateControlTbl.portRatePct = "PortRateControl.portRatePct"
portRateControlStatusTbl = {}
portRateControlStatusTbl.name = "PortRateControlStatus"
portRateControlStatusTbl.portRateControlStatus = "portRateControlStatus"
function portRateControlConfig(A0_0, A1_1)
  local L2_2, L3_3
  L2_2 = 0
  L3_3 = {}
  L3_3[portRateControlTbl.portName] = A0_0
  L3_3[portRateControlTbl.portRatePct] = A1_1
  L2_2 = string.byte(A0_0, 5)
  L2_2 = L2_2 - 48
  return db.update(portRateControlTbl.name, L3_3, L2_2)
end
