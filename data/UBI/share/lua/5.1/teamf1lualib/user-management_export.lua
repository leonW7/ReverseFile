module(com.teamf1.core.user - management.export, seeall)
require("teamf1lualib/db")
require("teamf1lualib/util")
require("teamf1lualib/validations")
require("teamf1lualib/returnCodes")
exportTable = "user-managementTbl"
attribute.startExport = "startExport"
function startExportGet()
  local L0_0, L1_1
  L1_1 = db
  L1_1 = L1_1.getAttribute
  L1_1 = L1_1(exportTable, "_ROWID_", "1", attribute.startExport)
  if L1_1 == nil then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, 1, L1_1
end
function startExportGetNext(A0_2)
  local L1_3, L2_4, L3_5
  L3_5 = db
  L3_5 = L3_5.getAttribute
  L3_5 = L3_5(exportTable, "_ROWID_", L2_4, attribute.startExport)
  if L3_5 == nil then
    return returnCodes.FAILURE, L2_4
  end
  return returnCodes.SUCCESS, L2_4, L3_5
end
function startExportSet(A0_6, A1_7)
  local L2_8, L3_9, L4_10
  if A1_7 == nil then
    L3_9 = returnCodes
    L3_9 = L3_9.INVALID_ARGUMENT
    return L3_9
  end
  L3_9 = status
  if L3_9 == nil then
    L3_9 = returnCodes
    L3_9 = L3_9.FAILURE
    L4_10 = A0_6
    return L3_9, L4_10
  end
  L3_9 = returnCodes
  L3_9 = L3_9.SUCCESS
  L4_10 = A0_6
  return L3_9, L4_10
end
