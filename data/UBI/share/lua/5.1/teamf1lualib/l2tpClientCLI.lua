local L0_0
L0_0 = require
L0_0("teamf1lualib/l2tpClient")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vpn_l2tpClient")
L0_0 = require
L0_0("teamf1lualib/errorMap")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.errorMap")
function l2tpClientCfgInit(A0_1)
  configRow = db.getRow("l2tpVPNClient", "_ROWID_", "1")
  configRow["l2tpVPNClient.AutoDial"] = "0"
  configRow["l2tpVPNClient.Time"] = "0"
  return 1, configRow
end
function l2tpClientCfgSave(A0_2)
  local L1_3, L2_4, L3_5
  L1_3 = "ERROR"
  L2_4 = ""
  L3_5 = ""
  DBTable = "l2tpVPNClient"
  L1_3, L2_4 = l2tpClient.set(A0_2)
  if L1_3 then
    db.save()
    L3_5 = db.getAttribute("stringsMap", "stringId", L2_4, LANGUAGE) or L2_4
    return "OK", L3_5
  else
    L3_5 = db.getAttribute("stringsMap", "stringId", L2_4, LANGUAGE) or L2_4
    return "ERROR", L3_5
  end
end
function l2tpClientInputVal(A0_6)
  if A0_6["l2tpVPNClient.l2tpClientEnable"] == "" or A0_6["l2tpVPNClient.l2tpClientEnable"] == nil then
    printCLIError("Please configure l2tp Client First")
    return false
  end
  if A0_6["l2tpVPNClient.l2tpClientEnable"] == "1" then
    if A0_6["l2tpVPNClient.DemandFlag"] == "1" and (A0_6["l2tpVPNClient.IdleTimeOut"] == "0" or A0_6["l2tpVPNClient.IdleTimeOut"] == nil) then
      printCLIError("Please enter value between 300 - 1800")
      return false
    end
    if A0_6["l2tpVPNClient.l2tpServerIp"] == nil or A0_6["l2tpVPNClient.l2tpServerIp"] == "0.0.0.0" then
      printCLIError("Invalid l2tp server address")
      return false
    end
    if _UPVALUE0_.checkIpv4Address(A0_6["l2tpVPNClient.l2tpServerIp"]) ~= true then
      printCLIError("Server IP Address is Invalid. Octet 1 should be in 1-223 and Octet 4 should be in 1-254 range.")
      return false
    end
    if A0_6["l2tpVPNClient.RemoteNetwork"] == nil or A0_6["l2tpVPNClient.RemoteNetwork"] == "0.0.0.0" then
      printCLIError("Invalid remote network address")
      return false
    end
    if _UPVALUE0_.is_ipv4_address(A0_6["l2tpVPNClient.RemoteNetwork"]) ~= true then
      printCLIError("Invalid Remote Network Address")
      return false
    end
    if tonumber(_UPVALUE0_.split(A0_6["l2tpVPNClient.RemoteNetwork"], ".")[1]) == 224 or tonumber(_UPVALUE0_.split(A0_6["l2tpVPNClient.RemoteNetwork"], ".")[1]) == 0 or tonumber(_UPVALUE0_.split(A0_6["l2tpVPNClient.RemoteNetwork"], ".")[1]) > 224 then
      printCLIError("Invalid Remote Network IP address. Please enter a value between 1 - 223 for octet 1")
      return false
    end
    if A0_6["l2tpVPNClient.RemoteNetmask"] == "0" or A0_6["l2tpVPNClient.RemoteNetmask"] == "nil" then
      printCLIError("please enter  remote netmask value between 1 - 32")
      return false
    end
    valid = _UPVALUE1_.l2tpSubnetCheckValidation(A0_6["l2tpVPNClient.RemoteNetwork"], A0_6["l2tpVPNClient.RemoteNetmask"])
    if valid ~= _UPVALUE2_.SUCCESS then
      statusErrorMessage = _UPVALUE3_.errorStringGet(valid)
      return false, statusErrorMessage
    end
    if A0_6["l2tpVPNClient.UserName"] == nil then
      printCLIError("PLease enter user name")
      return false
    end
    if 24 < string.len(A0_6["l2tpVPNClient.UserName"]) or 0 > string.len(A0_6["l2tpVPNClient.UserName"]) then
      printCLIError("Please enter upto 24 characters for userName.")
      return false
    end
    if A0_6["l2tpVPNClient.Password"] == nil then
      printCLIError("Please enter password")
      return false
    end
    if A0_6["l2tpVPNClient.AutoDial"] == "0" and A0_6["l2tpVPNClient.Time"] ~= "0" then
      printCLIError("Please enable auto_dial")
      return false
    elseif A0_6["l2tpVPNClient.AutoDial"] == "1" and A0_6["l2tpVPNClient.Time"] == "0" then
      printCLIError("Please configure time in minutes for Auto Dial")
      return false
    end
    if 128 < string.len(A0_6["l2tpVPNClient.Password"]) or 0 > string.len(A0_6["l2tpVPNClient.Password"]) then
      printCLIError("Please enter upto 128 characters for Password.")
      return false
    end
  end
  if io.open("/var/ppp88.status", "r") then
    connectionStatus = io.open("/var/ppp88.status", "r"):read("*line") or ""
    if connectionStatus == "0" then
      connectionStatus = "1"
    else
      connectionStatus = "0"
    end
  end
  if (db.getRowWhere("l2tpVPNClient", "l2tpClientEnable = 1") or "") and connectionStatus == "1" then
    if (db.getRowWhere("l2tpVPNClient", "l2tpClientEnable = 1") or "")["l2tpVPNClient.l2tpServerIp"] == A0_6["l2tpVPNClient.l2tpServerIp"] and (db.getRowWhere("l2tpVPNClient", "l2tpClientEnable = 1") or "")["l2tpVPNClient.RemoteNetwork"] == A0_6["l2tpVPNClient.RemoteNetwork"] and (db.getRowWhere("l2tpVPNClient", "l2tpClientEnable = 1") or "")["l2tpVPNClient.RemoteNetmask"] == A0_6["l2tpVPNClient.RemoteNetmask"] and (db.getRowWhere("l2tpVPNClient", "l2tpClientEnable = 1") or "")["l2tpVPNClient.UserName"] == A0_6["l2tpVPNClient.UserName"] and (db.getRowWhere("l2tpVPNClient", "l2tpClientEnable = 1") or "")["l2tpVPNClient.Password"] == A0_6["l2tpVPNClient.Password"] and (db.getRowWhere("l2tpVPNClient", "l2tpClientEnable = 1") or "")["l2tpVPNClient.EnableMppe"] == A0_6["l2tpVPNClient.EnableMppe"] and (db.getRowWhere("l2tpVPNClient", "l2tpClientEnable = 1") or "")["l2tpVPNClient.DemandFlag"] == A0_6["l2tpVPNClient.DemandFlag"] then
      return true
    else
      printCLIError("Configuration is in use, please disconnect the active" .. " l2tp tunnel from l2tp client_action to change the configuration")
      return false
    end
  end
  return true
end
function l2tpClientGet()
  local L0_7, L1_8, L2_9, L3_10, L4_11
  L3_10 = {}
  L4_11 = {}
  configRow = db.getRow("l2tpVPNClient", "_ROWID_", "1")
  L4_11 = db.getRow("autodiall2tpvpn", "_ROWID_", "1")
  printLabel("L2TP Client Configuration")
  if configRow["l2tpVPNClient.l2tpClientEnable"] == "0" then
    L0_7 = "Disabled"
  else
    L0_7 = "Enabled"
  end
  if configRow["l2tpVPNClient.DemandFlag"] == "1" then
    L1_8 = "On demand"
  else
    L1_8 = "Always on"
  end
  if configRow["l2tpVPNClient.EnableMppe"] == "0" then
    L2_9 = "Disabled"
  else
    L2_9 = "Enabled"
  end
  resTab.insertField(L3_10, "L2TP Client Status", L0_7)
  if L0_7 == "Enabled" then
    resTab.insertField(L3_10, "Server Address", configRow["l2tpVPNClient.l2tpServerIp"] or "")
    resTab.insertField(L3_10, "Remote Network", configRow["l2tpVPNClient.RemoteNetwork"] or "")
    resTab.insertField(L3_10, "Remote Subnet Mask", configRow["l2tpVPNClient.RemoteNetmask"] or "")
    resTab.insertField(L3_10, "Username", configRow["l2tpVPNClient.UserName"] or "")
    resTab.insertField(L3_10, "Password", util.mask(configRow["l2tpVPNClient.Password"]) or "")
    resTab.insertField(L3_10, "Reconnect Mode", L1_8)
    resTab.insertField(L3_10, "Idle Time Out", configRow["l2tpVPNClient.IdleTimeOut"] or "")
    resTab.insertField(L3_10, "Mppe Enable", L2_9)
    if L4_11["autodiall2tpvpn.action"] == "1" then
      resTab.insertField(L3_10, "Auto Dial", "enabled" or "")
      resTab.insertField(L3_10, "Time", L4_11["autodiall2tpvpn.time"] or "")
    else
      resTab.insertField(L3_10, "Auto Dial", "disabled" or "")
    end
  end
  resTab.print(L3_10, 0)
end
function l2tpClientActionSet(A0_12)
  if db.getRow("l2tpVPNClient", "_ROWID_", "1")["l2tpVPNClient.l2tpClientEnable"] == "0" then
    printCLIError("PLease Enable L2tp Client before connecting or dropping the connection")
    return false
  end
  l2tpVpnClientRow, conStatusl2tp = l2tpClient.getConnStatus()
  if l2tpVpnClientRow["l2tpClientConnectionStatus.action"] ~= nil and l2tpVpnClientRow["l2tpClientConnectionStatus.action"] == "1" then
    if conStatusl2tp == "Disconnected" or conStatusl2tp == "Authentication Failed" then
      if A0_12[1] == "1" then
        actionFlag = db.setAttribute("l2tpClientConnectionStatus", "_ROWID_", "1", "action", "1")
      else
        printCLIError("Current Status is " .. conStatusl2tp .. ", cannnot be dis-connected")
        return false
      end
    elseif A0_12[1] == "0" then
      actionFlag = db.setAttribute("l2tpClientConnectionStatus", "_ROWID_", "1", "action", "0")
    else
      printCLIError("Current Status is " .. conStatusl2tp .. ", cannot be connected")
      return false
    end
  elseif conStatusl2tp == "Connected" or conStatusl2tp == "Idle" then
    if A0_12[1] == "0" then
      actionFlag = db.setAttribute("l2tpClientConnectionStatus", "_ROWID_", "1", "action", "0")
    else
      printCLIError("Current Status is " .. conStatusl2tp .. ", cannot be connected")
      return false
    end
  elseif A0_12[1] == "1" then
    actionFlag = db.setAttribute("l2tpClientConnectionStatus", "_ROWID_", "1", "action", "1")
  else
    printCLIError("Current Status is " .. conStatusl2tp .. ", cannnot be dis-connected")
    return false
  end
  if actionFlag then
    db.save()
    return "OK"
  else
    return "ERROR"
  end
end
function l2tpClientStatusGet()
  local L0_13, L1_14
  L1_14 = {}
  l2tpVpnClientRow, conStatusl2tp = l2tpClient.getConnStatus()
  printLabel("L2TP client connection status")
  resTab.insertField(L1_14, "L2TP Client Connection Status:", conStatusl2tp)
  resTab.print(L1_14, 0)
end
