local L0_0
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = db
L0_0 = L0_0.connect
L0_0(arg[1])
L0_0 = util
L0_0 = L0_0.setDebugStatus
L0_0(true)
while true do
  L0_0 = db
  L0_0 = L0_0.getAttribute
  L0_0 = L0_0("environment", "name", "NIMFSTATUS_PROGRAM", "value")
  if L0_0 ~= nil then
    os.execute(L0_0 .. " " .. arg[1] .. " WAN1 2")
    os.execute(L0_0 .. " " .. arg[1] .. " WAN1 10")
    os.execute(L0_0 .. " " .. arg[1] .. " WAN2 2")
  end
  L0_0 = db.getAttribute("environment", "name", "LINKSTATUS_PROGRAM", "value")
  if L0_0 ~= nil then
    os.execute(L0_0 .. " " .. arg[1] .. " WAN1")
    os.execute(L0_0 .. " " .. arg[1] .. " WAN2")
  end
  os.execute("sleep 5")
end
