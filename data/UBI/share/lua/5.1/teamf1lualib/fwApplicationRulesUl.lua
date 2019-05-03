require("teamf1lualib/fwApplicationRules")
fw.ul.portTriggerStatus = {}
function fw.ul.portTriggerStatus.GetAll()
  local L0_0, L1_1, L2_2
  L0_0 = db
  L0_0 = L0_0.getAttribute
  L1_1 = "environment"
  L2_2 = "name"
  L0_0 = L0_0(L1_1, L2_2, "PORTTRIG_STATUS_PROG", "value")
  L1_1 = NIL
  if L0_0 ~= L1_1 then
    L1_1 = util
    L1_1 = L1_1.appendDebugOut
    L2_2 = "Exec = "
    L2_2 = L2_2 .. os.execute(L0_0 .. " " .. DB_FILE_NAME) .. "<br>"
    L1_1(L2_2)
  end
  L1_1 = fw
  L1_1 = L1_1.core
  L1_1 = L1_1.portTriggerStatus
  L1_1 = L1_1.GetAll
  L2_2 = L1_1()
  if returnCodes.SUCCESS ~= L1_1 then
    return L1_1
  end
  return L1_1, L2_2
end
