local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = db
L0_0 = L0_0.getRow
l2tpDBRowGet = L0_0
L0_0 = "ppp88"
pppIf = L0_0
L0_0 = {}
l2tpClient = L0_0
L0_0 = "autodiall2tpvpn"
function l2tpDBConfig(A0_1, A1_2, A2_3, A3_4)
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
function l2tpClient.set(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10
  L1_6 = db
  L1_6 = L1_6.beginTransaction
  L1_6()
  L1_6 = false
  L2_7 = false
  L3_8 = false
  L4_9 = {}
  L5_10 = {}
  if A0_5["l2tpVPNClient.l2tpClientEnable"] == "1" then
    L1_6 = db.setAttribute("l2tpClientConnectionStatus", "_ROWID_", 1, "actionStatus", "1")
    db.setAttribute("l2tpClientConnectionStatus", "_ROWID_", 1, "action", "1")
    db.setAttribute("l2tpClientConnectionStatus", "_ROWID_", 1, "connectionStatus", "1")
    if A0_5["l2tpVPNClient.l2tpServerIp"] == "0.0.0.0" then
      return "ERROR", "13436"
    end
    if A0_5["l2tpVPNClient.RemoteNetwork"] == "0.0.0.0" then
      return "ERROR", "13437"
    end
  else
    L1_6 = db.setAttribute("l2tpClientConnectionStatus", "_ROWID_", 1, "actionStatus", "0")
    db.setAttribute("l2tpClientConnectionStatus", "_ROWID_", 1, "action", "0")
    db.setAttribute("l2tpClientConnectionStatus", "_ROWID_", 1, "connectionStatus", "0")
  end
  L4_9[_UPVALUE0_ .. "." .. "EnableMppe"] = A0_5["l2tpVPNClient.EnableMppe"]
  L4_9[_UPVALUE0_ .. "." .. "l2tpClientEnable"] = A0_5["l2tpVPNClient.l2tpClientEnable"]
  L4_9[_UPVALUE0_ .. "." .. "l2tpServerIp"] = A0_5["l2tpVPNClient.l2tpServerIp"]
  L4_9[_UPVALUE0_ .. "." .. "UserName"] = A0_5["l2tpVPNClient.UserName"]
  L4_9[_UPVALUE0_ .. "." .. "DemandFlag"] = A0_5["l2tpVPNClient.DemandFlag"]
  L4_9[_UPVALUE0_ .. "." .. "Password"] = A0_5["l2tpVPNClient.Password"]
  L4_9[_UPVALUE0_ .. "." .. "RemoteNetmask"] = A0_5["l2tpVPNClient.RemoteNetmask"]
  L4_9[_UPVALUE0_ .. "." .. "RemoteNetwork"] = A0_5["l2tpVPNClient.RemoteNetwork"]
  L4_9[_UPVALUE0_ .. "." .. "IdleTimeOut"] = A0_5["l2tpVPNClient.IdleTimeOut"]
  L2_7 = l2tpDBConfig(L4_9, "l2tpVPNClient", 1, "edit") and L1_6
  if A0_5["l2tpVPNClient.AutoDial"] == _UPVALUE1_ then
    L5_10[_UPVALUE2_ .. "." .. "action"] = A0_5["l2tpVPNClient.AutoDial"]
  else
    L5_10[_UPVALUE2_ .. "." .. "action"] = 0
  end
  if A0_5["l2tpVPNClient.AutoDial"] == _UPVALUE1_ then
    L5_10[_UPVALUE2_ .. "." .. "time"] = A0_5["l2tpVPNClient.Time"]
  else
    L5_10[_UPVALUE2_ .. "." .. "time"] = 2
  end
  L3_8 = l2tpDBConfig(L5_10, "autodiall2tpvpn", 1, "edit") and L1_6
  if L2_7 and L3_8 then
    db.commitTransaction()
    return "OK", "11484"
  else
    db.rollback()
    return "ERROR", "13439"
  end
end
function l2tpClient.get()
  local L0_11
  L0_11 = {}
  L0_11 = l2tpDBRowGet("l2tpVPNClient", "_ROWID_", "1")
  L0_11["l2tpVPNClient.Time"], L0_11["l2tpVPNClient.AutoDial"] = db.getAttribute(_UPVALUE0_, "_ROWID_", "1", "time"), db.getAttribute(_UPVALUE0_, "_ROWID_", "1", "action")
  return L0_11
end
function l2tpClient.setAction(A0_12)
  local L1_13
  L1_13 = db
  L1_13 = L1_13.beginTransaction
  L1_13()
  L1_13 = false
  if A0_12 == "Connect" then
    L1_13 = db.setAttribute("l2tpClientConnectionStatus", "_ROWID_", "1", "action", "1")
  else
    L1_13 = db.setAttribute("l2tpClientConnectionStatus", "_ROWID_", "1", "action", "0")
  end
  if L1_13 then
    db.commitTransaction()
    return "OK", "Action performed!"
  else
    db.rollback()
    return "ERROR", "Action failed!"
  end
end
function l2tpClient.getConnStatus()
  local L0_14, L1_15
  require("l2tpClientLuaLib")
  L0_14 = l2tpClientLuaLib.connStatusGet()
  L1_15 = db.getAttribute("l2tpVPNClient", "_ROWID_", 1, "DemandFlag")
  if L0_14 == 0 then
    L0_14 = "Connected"
  elseif L0_14 == 12 and tonumber(L1_15) == 1 then
    L0_14 = "Idle"
  elseif L0_14 == 19 then
    L0_14 = "Authentication Failed"
  else
    L0_14 = "Disconnected"
  end
  return l2tpDBRowGet("l2tpClientConnectionStatus", "_ROWID_", 1), L0_14
end
