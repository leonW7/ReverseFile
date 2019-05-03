local L0_0
L0_0 = require
L0_0("teamf1lualib/pptpClient")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vpn_pptpClient")
L0_0 = require
L0_0("teamf1lualib/errorMap")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.errorMap")
function pptpClientCfgInit(A0_1)
  configRow = db.getRow("pptpClient", "_ROWID_", "1")
  configRow["pptpClient.AutoDial"] = "0"
  configRow["pptpClient.Time"] = "0"
  return 1, configRow
end
function pptpClientCfgSave(A0_2)
  local L1_3, L2_4, L3_5
  L1_3 = "ERROR"
  L2_4 = ""
  L3_5 = ""
  DBTable = "pptpClient"
  L1_3, L2_4 = pptpClient.set(A0_2)
  if L1_3 then
    db.save()
    L3_5 = db.getAttribute("stringsMap", "stringId", L2_4, LANGUAGE) or L2_4
    return "OK", L3_5
  else
    L3_5 = db.getAttribute("stringsMap", "stringId", L2_4, LANGUAGE) or L2_4
    return "ERROR", L3_5
  end
end
function pptpClientInputVal(A0_6)
  if A0_6["pptpClient.pptpClientEnable"] == "" or A0_6["pptpClient.pptpClientEnable"] == nil then
    printCLIError("Please configure pptp client first")
    return false
  end
  if A0_6["pptpClient.pptpClientEnable"] == "1" then
    if A0_6["pptpClient.ServerIp"] == nil or A0_6["pptpClient.ServerIp"] == "0.0.0.0" then
      printCLIError("Invalid pptp server address")
      return false
    end
    if _UPVALUE0_.checkIpv4Address(A0_6["pptpClient.ServerIp"]) ~= true then
      printCLIError("Server IP Address is Invalid. Octet 1 should be in 1-223 and Octet 4 should be in 1-254 range.")
      return false
    end
    if A0_6["pptpClient.IdleTimeOut"] == nil or A0_6["pptpClient.IdleTimeOut"] == "0" then
      printCLIError("Invalid Idle TimeOut, Please Enter the range between 300 - 1800")
      return false
    end
    if A0_6["pptpClient.RemoteNetwork"] == nil or A0_6["pptpClient.RemoteNetwork"] == "0.0.0.0" then
      printCLIError("Invalid remote network address")
      return false
    end
    if _UPVALUE0_.is_ipv4_address(A0_6["pptpClient.RemoteNetwork"]) ~= true then
      printCLIError("Invalid Remote Network Address")
      return false
    end
    if tonumber(_UPVALUE0_.split(A0_6["pptpClient.RemoteNetwork"], ".")[1]) == 224 or tonumber(_UPVALUE0_.split(A0_6["pptpClient.RemoteNetwork"], ".")[1]) == 0 or tonumber(_UPVALUE0_.split(A0_6["pptpClient.RemoteNetwork"], ".")[1]) > 224 then
      printCLIError("Invalid Remote Network IP address. Please enter a value between 1 - 223 for octet 1")
      return false
    end
    if A0_6["pptpClient.RemoteNetmask"] == nil or A0_6["pptpClient.RemoteNetmask"] == "0" then
      printCLIError("Invalid Remote Netmask for PPTP client, Please enter value between 1-32")
      return false
    end
    valid = _UPVALUE1_.pptpSubnetCheckValidation(A0_6["pptpClient.RemoteNetwork"], A0_6["pptpClient.RemoteNetmask"])
    if valid ~= _UPVALUE2_.SUCCESS then
      statusErrorMessage = _UPVALUE3_.errorStringGet(valid)
      return false, statusErrorMessage
    end
    if A0_6["pptpClient.UserName"] == nil then
      printCLIError("PLease enter user name")
      return false
    end
    if 24 < string.len(A0_6["pptpClient.UserName"]) or 0 > string.len(A0_6["pptpClient.UserName"]) then
      printCLIError("Please enter upto 24 characters for userName.")
      return false
    end
    if A0_6["pptpClient.Password"] == nil then
      printCLIError("Please enter password")
      return false
    end
    if A0_6["pptpClient.AutoDial"] == "0" and A0_6["pptpClient.Time"] ~= "0" then
      printCLIError("Please enable auto_dial")
      return false
    elseif A0_6["pptpClient.AutoDial"] == "1" and A0_6["pptpClient.Time"] == "0" then
      printCLIError("Please configure time in minutes for Auto Dial")
      return false
    end
    if 128 < string.len(A0_6["pptpClient.Password"]) or 0 > string.len(A0_6["pptpClient.Password"]) then
      printCLIError("Please enter upto 128 characters for Password.")
      return false
    end
  end
  if io.open("/var/run/ppp100.pid", "r") then
    connectionStatus = "1"
  else
    connectionStatus = "0"
  end
  if (db.getRowWhere("pptpClient", "pptpClientEnable = 1") or "") and connectionStatus == "1" then
    if (db.getRowWhere("pptpClient", "pptpClientEnable = 1") or "")["pptpClient.ServerIp"] == A0_6["pptpClient.ServerIp"] and (db.getRowWhere("pptpClient", "pptpClientEnable = 1") or "")["pptpClient.RemoteNetwork"] == A0_6["pptpClient.RemoteNetwork"] and (db.getRowWhere("pptpClient", "pptpClientEnable = 1") or "")["pptpClient.RemoteNetmask"] == A0_6["pptpClient.RemoteNetmask"] and (db.getRowWhere("pptpClient", "pptpClientEnable = 1") or "")["pptpClient.UserName"] == A0_6["pptpClient.UserName"] and (db.getRowWhere("pptpClient", "pptpClientEnable = 1") or "")["pptpClient.Password"] == A0_6["pptpClient.Password"] and (db.getRowWhere("pptpClient", "pptpClientEnable = 1") or "")["pptpClient.MppeEncryptionEnable"] == A0_6["pptpClient.MppeEncryptionEnable"] and (db.getRowWhere("pptpClient", "pptpClientEnable = 1") or "")["pptpClient.IdleTimeOut"] == A0_6["pptpClient.IdleTimeOut"] then
      return true
    else
      printCLIError("Configuration is in use, please disconnect the active" .. " pptp tunnel from pptp client_action to change the configuration")
      return false
    end
  end
  return true
end
function pptpClientGet()
  local L0_7, L1_8, L2_9
  L1_8 = {}
  L2_9 = {}
  L2_9 = db.getRow("autodialpptpvpn", "_ROWID_", "1")
  configRow = db.getRow("pptpClient", "_ROWID_", "1")
  printLabel("PPTP Client Configuration")
  if configRow["pptpClient.pptpClientEnable"] == "0" then
    L0_7 = "Disabled"
  else
    L0_7 = "Enabled"
  end
  resTab.insertField(L1_8, "PPTP Client Status:", L0_7)
  resTab.insertField(L1_8, "Server Address:", configRow["pptpClient.ServerIp"] or "")
  resTab.insertField(L1_8, "Remote Network:", configRow["pptpClient.RemoteNetwork"] or "")
  resTab.insertField(L1_8, "Remote Subnet Mask:", configRow["pptpClient.RemoteNetmask"] or "")
  resTab.insertField(L1_8, "Username:", configRow["pptpClient.UserName"] or "")
  resTab.insertField(L1_8, "Password:", configRow["pptpClient.Password"] or "")
  resTab.insertField(L1_8, "Mppe Enable:", configRow["pptpClient.MppeEncryptionEnable"] or "")
  resTab.insertField(L1_8, "Idle Time Out:", configRow["pptpClient.IdleTimeOut"] or "")
  if L2_9["autodialpptpvpn.action"] == "1" then
    resTab.insertField(L1_8, "Auto Dial", "enabled" or "")
    resTab.insertField(L1_8, "Time", L2_9["autodialpptpvpn.time"] or "")
  else
    resTab.insertField(L1_8, "Auto Dial", "disabled" or "")
  end
  resTab.print(L1_8, 0)
end
function pptpClientActionSet(A0_10)
  if db.setAttribute("pptpClientConnectionStatus", "_ROWID_", 1, "action", A0_10[1]) then
    db.save()
    return "OK"
  else
    return "ERROR"
  end
end
function pptpClientStatusGet()
  local L0_11, L1_12, L2_13
  L0_11 = "/var/ppp100.status"
  PPTP_CLIENT_PPP_STATUS_FILE = L0_11
  L0_11, L1_12 = nil, nil
  L2_13 = {}
  configRow = db.getRow("pptpClientConnectionStatus", "_ROWID_", "1")
  printLabel("PPTP client connection status")
  if io.open(PPTP_CLIENT_PPP_STATUS_FILE, "r") == nil then
    L0_11 = "Disconnected"
  else
    L1_12 = io.open(PPTP_CLIENT_PPP_STATUS_FILE, "r"):read("*line")
    if L1_12 ~= nil and tonumber(L1_12) == 0 then
      L0_11 = "Connected"
    else
      L0_11 = "Disconnected"
    end
    io.open(PPTP_CLIENT_PPP_STATUS_FILE, "r"):close()
  end
  resTab.insertField(L2_13, "PPTP Client Connection Status:", L0_11)
  resTab.print(L2_13, 0)
end
