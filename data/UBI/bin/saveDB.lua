local L0_0
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("validationsLuaLib")
L0_0 = UNIT_NAME
if L0_0 ~= "DSR-1000AC" then
  L0_0 = UNIT_NAME
elseif L0_0 == "DSR-500AC" then
  L0_0 = "/tmp/savedb_check_file"
  validationsLuaLib.lockFile(L0_0)
end
L0_0 = db
L0_0 = L0_0.connect
L0_0(arg[1])
L0_0 = util
L0_0 = L0_0.setDebugStatus
L0_0(true)
L0_0 = db
L0_0 = L0_0.execute
L0_0("ATTACH '/tmp/cpAcc.db' as cpAccDB")
L0_0 = ""
SETTINGS_FILE = L0_0
L0_0 = db
L0_0 = L0_0.getAttribute
L0_0 = L0_0("environment", "name", "TEAMF1_CFG_ASCII", "value")
SETTINGS_FILE = L0_0
L0_0 = db
L0_0 = L0_0.save
L0_0()
L0_0 = UNIT_NAME
if L0_0 ~= "DSR-1000AC" then
  L0_0 = UNIT_NAME
elseif L0_0 == "DSR-500AC" then
  L0_0 = validationsLuaLib
  L0_0 = L0_0.unlockFile
  L0_0(SAVEDB_CHECK_FILE)
end
