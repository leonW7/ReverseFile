local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wirelessClients", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wireless_statistics")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function enabledVapsGetAll()
  local L0_1, L1_2
  L0_1 = _UPVALUE0_
  L0_1 = L0_1.wirelessenabledVapsGetAll
  L1_2 = L0_1()
  return L0_1, L1_2
end
function clientRowsGet(A0_3)
  local L1_4, L2_5
  L1_4 = _UPVALUE0_
  L1_4 = L1_4.wirelessClientRowsGet
  L2_5 = A0_3
  L2_5 = L1_4(L2_5)
  return L1_4, L2_5
end
function clientRowGet150N(A0_6)
  return (_UPVALUE0_.wirelessClientRowsGet150N(A0_6))
end
function clientRowGet250N(A0_7)
  return (_UPVALUE0_.wirelessClientRowsGet250N(A0_7))
end
function staConnectedTimeGet(A0_8)
  local L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16, L9_17
  if A0_8 == 0 or A0_8 == nil then
    L1_9 = "-"
    return L1_9
  end
  L1_9 = timeLib
  L1_9 = L1_9.uptime
  L2_10 = L1_9()
  L3_11 = db
  L3_11 = L3_11.getAttribute
  L4_12 = "unitInfo"
  L5_13 = "_ROWID_"
  L6_14 = "1"
  L7_15 = "modelId"
  L3_11 = L3_11(L4_12, L5_13, L6_14, L7_15)
  L4_12 = db
  L4_12 = L4_12.getAttribute
  L5_13 = "hwFamilyInfo"
  L6_14 = "_ROWID_"
  L7_15 = "1"
  L8_16 = "hwFamilyName"
  L4_12 = L4_12(L5_13, L6_14, L7_15, L8_16)
  L5_13 = 0
  if L3_11 == "DSR-250N" and L4_12 == "Ax" then
    L5_13 = A0_8
  else
    L5_13 = L2_10 - A0_8
  end
  L6_14 = math
  L6_14 = L6_14.floor
  L7_15 = L5_13 / 60
  L6_14 = L6_14(L7_15)
  L7_15 = L5_13 % 60
  L8_16 = math
  L8_16 = L8_16.floor
  L9_17 = L6_14 / 60
  L8_16 = L8_16(L9_17)
  L6_14 = L6_14 % 60
  L9_17 = math
  L9_17 = L9_17.floor
  L9_17 = L9_17(L8_16 / 24)
  L8_16 = L8_16 % 24
  L5_13 = L9_17 .. " days, " .. L8_16 .. " hours, " .. L6_14 .. " minutes, " .. L7_15 .. " seconds"
  return L5_13
end
