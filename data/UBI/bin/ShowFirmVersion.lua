local L0_0, L1_1, L2_2
L0_0 = require
L1_1 = "teamf1lualib/util"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/db"
L0_0(L1_1)
L0_0 = ""
L1_1 = db
L1_1 = L1_1.connect
L2_2 = arg
L2_2 = L2_2[1]
L1_1(L2_2)
L1_1 = db
L1_1 = L1_1.getAttribute
L2_2 = "environment"
L1_1 = L1_1(L2_2, "name", "UPDATE_FIRMWARE_VERSION_PROGRAM", "value")
L2_2 = db
L2_2 = L2_2.getAttribute
L2_2 = L2_2("environment", "name", "FIRMWARE_PARTITION", "value")
