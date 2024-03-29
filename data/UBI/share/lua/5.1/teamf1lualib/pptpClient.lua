local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = {}
pptpClient = L0_0
L0_0 = "autodialpptpvpn"
function pptpDBConfig(A0_1, A1_2, A2_3, A3_4)
  if db.typeAndRangeValidate(A0_1) then
    if A3_4 == "add" then
      return db.insert(A1_2, A0_1)
    elseif A3_4 == "edit" then
      return db.update(A1_2, A0_1, A2_3)
    elseif A3_4 == "delete" then
      return db.delete(A1_2, A0_1)
    end
  end
end
pptpDBRowGet = db.getRow
function pptpClient.set(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10
  L1_6 = db
  L1_6 = L1_6.beginTransaction
  L1_6()
  L1_6 = false
  L2_7 = false
  L3_8 = false
  L4_9 = {}
  L5_10 = {}
  if A0_5["pptpClient.pptpClientEnable"] == "1" then
    L1_6 = db.setAttribute("pptpClientConnectionStatus", "_ROWID_", 1, "actionStatus", "1")
    db.setAttribute("pptpClientConnectionStatus", "_ROWID_", 1, "action", "1")
    db.setAttribute("pptpClientConnectionStatus", "_ROWID_", 1, "connectionStatus", "1")
    if A0_5["pptpClient.ServerIp"] == "0.0.0.0" then
      return "ERROR", "12759"
    end
    if A0_5["pptpClient.RemoteNetwork"] == "0.0.0.0" then
      return "ERROR", "12760"
    end
  else
    L1_6 = db.setAttribute("pptpClientConnectionStatus", "_ROWID_", 1, "actionStatus", "0")
    db.setAttribute("pptpClientConnectionStatus", "_ROWID_", 1, "action", "0")
    db.setAttribute("pptpClientConnectionStatus", "_ROWID_", 1, "connectionStatus", "0")
  end
  L2_7 = pptpDBConfig(A0_5, "pptpClient", 1, "edit") and L1_6
  if A0_5["pptpClient.AutoDial"] == _UPVALUE0_ then
    L5_10[_UPVALUE1_ .. "." .. "action"] = A0_5["pptpClient.AutoDial"]
  else
    L5_10[_UPVALUE1_ .. "." .. "action"] = 0
  end
  if A0_5["pptpClient.AutoDial"] == _UPVALUE0_ then
    L5_10[_UPVALUE1_ .. "." .. "time"] = A0_5["pptpClient.Time"]
  else
    L5_10[_UPVALUE1_ .. "." .. "time"] = 2
  end
  L3_8 = pptpDBConfig(L5_10, "autodialpptpvpn", 1, "edit") and L1_6
  if L2_7 and L3_8 then
    db.commitTransaction()
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12761"
  end
end
function pptpClient.get()
  return pptpDBRowGet("pptpClient", "_ROWID_", 1)
end
function pptpClient.ConnStatusConfig(A0_11, A1_12, A2_13, A3_14, A4_15, A5_16)
  local L6_17
  L6_17 = db
  L6_17 = L6_17.beginTransaction
  L6_17()
  L6_17 = false
  if A5_16 == "Connect" then
    L6_17 = db.setAttribute(A0_11, A1_12, A2_13, A3_14, A4_15)
  else
    L6_17 = db.setAttribute(A0_11, A1_12, A2_13, A3_14, A4_15)
  end
  if L6_17 then
    db.commitTransaction()
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12761"
  end
end
function pptpClient.getConnStatus()
  local L0_18, L1_19, L2_20
  L0_18 = "Disconnected"
  L1_19 = -1
  L2_20 = nil
  require("pptpClientLuaLib")
  L0_18 = pptpClientLuaLib.connStatusGet()
  if tonumber(L0_18) == _UPVALUE0_ then
    L0_18 = "Connected"
    remoteSubnet = db.getAttribute("pptpClient", "_ROWID_", "1", "RemoteNetwork", "0")
    remoteNetmask = db.getAttribute("pptpClient", "_ROWID_", "1", "RemoteNetmask", "0")
    L2_20 = db.getAttribute("environment", "name", "ROUTE_PATH", "value")
    if remoteSubnet ~= nil and remoteNetmask ~= nil then
      L1_19 = pptpClientLuaLib.addRoute(remoteSubnet, remoteNetmask, L2_20)
    end
  else
    L0_18 = "Disconnected"
  end
  return pptpDBRowGet("pptpClientConnectionStatus", "_ROWID_", 1), L0_18
end
