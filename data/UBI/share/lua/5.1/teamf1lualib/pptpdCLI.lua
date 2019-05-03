local L0_0
L0_0 = require
L0_0("teamf1lualib/pptpServer")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vpn_pptpServer")
L0_0 = require
L0_0("teamf1lualib/errorMap")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.errorMap")
function pptpServerCfgInit(A0_1)
  configRow = db.getRow("pptpServerIPRange", "_ROWID_", "1")
  return 1, configRow
end
function pptpServerCfgSave(A0_2)
  local L1_3, L2_4, L3_5
  L1_3 = "ERROR"
  L2_4 = ""
  L3_5 = ""
  DBTable = "pptpServerIPRange"
  L1_3, L2_4 = pptpServer.serverConfig(A0_2, "1", "edit")
  if L1_3 == "OK" then
    db.save()
  end
  L3_5 = db.getAttribute("stringsMap", "stringId", L2_4, LANGUAGE) or L2_4
  return L1_3, L3_5
end
function pptpServerInputVal(A0_6)
  local L1_7
  if db.getRow("networkInfo", "_ROWID_", "1")["networkInfo.netWorkMode"] == "3" then
    if A0_6["pptpServerIPRange.pptpdIpv6PrefixLenghtInit"] ~= nil then
      A0_6["pptpServerIPRange.pptpdIpv6Prefix"] = A0_6["pptpServerIPRange.pptpdIpv6PrefixInit"] .. "/" .. A0_6["pptpServerIPRange.pptpdIpv6PrefixLenghtInit"]
    end
  else
    A0_6["pptpServerIPRange.pptpdIpv6Prefix"] = ""
  end
  if db.getRow("networkInfo", "_ROWID_", "1")["networkInfo.netWorkMode"] == "1" and A0_6["pptpServerIPRange.pptpd6Enable"] == "1" then
    printCLIError("Please change Ip Mode to IPV4/IPV6 first to enable PPTP server on ipv6")
    return false
  end
  if A0_6["pptpServerIPRange.pptpd6Enable"] == "1" and A0_6["pptpServerIPRange.pptpdEnable"] == "1" then
    printCLIError("You cannot enable pptp Server in both ipv4 and ipv4/ipv6 mode.")
    return false
  end
  if A0_6["pptpServerIPRange.pptpd6Enable"] == "1" and (A0_6["pptpServerIPRange.pptpdIpv6Prefix"] == nil or A0_6["pptpServerIPRange.pptpdIpv6Prefix"] == "") then
    printCLIError("Invalid pptp server ipv6 prefix")
  end
  if A0_6["pptpServerIPRange.pptpdEnable"] == "1" then
    if A0_6["pptpServerIPRange.startIPAddress"] == nil or A0_6["pptpServerIPRange.startIPAddress"] == "" or A0_6["pptpServerIPRange.startIPAddress"] == "0.0.0.0" then
      printCLIError("Invalid pptp server start address range")
      return false
    end
    L1_7, range = _UPVALUE0_.subnetCheckValidation(A0_6["pptpServerIPRange.startIPAddress"], A0_6["pptpServerIPRange.endIPAddress"])
    if L1_7 ~= _UPVALUE1_.SUCCESS then
      statusErrorMessage = _UPVALUE2_.errorStringGet(L1_7)
      return false, statusErrorMessage
    end
    if A0_6["pptpServerIPRange.endIPAddress"] == nil or A0_6["pptpServerIPRange.endIPAddress"] == "" or A0_6["pptpServerIPRange.endIPAddress"] == "0.0.0.0" then
      printCLIError("Invalid pptp server  end address range")
      return false
    end
    if _UPVALUE3_.checkIpv4Address(A0_6["pptpServerIPRange.startIPAddress"]) ~= true then
      printCLIError("Start IP Address is Invalid.Octet 1 should be in 1-223 and Octet 4 should be in 1-254 range.")
      return false
    end
    if _UPVALUE3_.checkIpv4Address(A0_6["pptpServerIPRange.endIPAddress"]) ~= true then
      printCLIError("End IP Address is Invalid.Octet 1 should be in 1-223 and Octet 4 should be in 1-254 range.")
      return false
    end
    if _UPVALUE3_.ipv4SingleMaskCheck(A0_6["pptpServerIPRange.endIPAddress"], A0_6["pptpServerIPRange.startIPAddress"], "255.255.255.0") ~= _UPVALUE1_.SUCCESS then
      printCLIError("Staring IP address and Ending IP address must be in same range")
      return false
    end
    L1_7 = _UPVALUE3_.ipv4AddressesCompare(A0_6["pptpServerIPRange.startIPAddress"], A0_6["pptpServerIPRange.endIPAddress"])
    if L1_7 == 0 or L1_7 == 3 or L1_7 == 2 then
      printCLIError("End address should be higher than Start address")
      return false
    end
  end
  if (A0_6["pptpServerIPRange.AuthenticationType"] == "3" or A0_6["pptpServerIPRange.AuthenticationType"] == "4") and (A0_6["pptpServerIPRange.PapEnable"] == "1" or A0_6["pptpServerIPRange.ChapEnable"] == "1") then
    printCLIError("pap and chap are unsupported protocols")
    return false
  end
  if A0_6["pptpServerIPRange.AuthenticationType"] == "5" then
    if A0_6["pptpServerIPRange.ChapEnable"] == "1" or A0_6["pptpServerIPRange.MSChapEnable"] == "1" or A0_6["pptpServerIPRange.MSChapv2Enable"] == "1" then
      printCLIError("pop3 only supports PAP protocol")
      return false
    end
    if A0_6["pptpServerIPRange.Mppe40Enable"] == "1" or A0_6["pptpServerIPRange.Mppe128Enable"] == "1" or A0_6["pptpServerIPRange.MppeStatefullEnable"] == "1" then
      printCLIError("pop3 does not support encryption protocols")
      return false
    end
  end
  if A0_6["pptpServerIPRange.AuthenticationType"] == "6" then
    if A0_6["pptpServerIPRange.PapEnable"] == "1" or A0_6["pptpServerIPRange.ChapEnable"] == "1" or A0_6["pptpServerIPRange.MSChapEnable"] == "1" or A0_6["pptpServerIPRange.MSChapv2Enable"] == "1" then
      printCLIError("do no select any authentication protocol")
      return false
    end
    if A0_6["pptpServerIPRange.Mppe40Enable"] == "1" or A0_6["pptpServerIPRange.Mppe128Enable"] == "1" or A0_6["pptpServerIPRange.MppeStatefullEnable"] == "1" then
      printCLIError("do no select any encryption protocol")
      return false
    end
  end
  if A0_6["pptpServerIPRange.UserTimeOut"] == "0" then
    printCLIError("please Enter the value between 300 - 1800")
    return false
  end
  if A0_6["pptpServerIPRange.netbiosEnable"] == "1" then
    if A0_6["pptpServerIPRange.primWinsServerIp"] == nil or A0_6["pptpServerIPRange.primWinsServerIp"] == "" or A0_6["pptpServerIPRange.primWinsServerIp"] == "0.0.0.0" then
      printCLIError("Please enter a valid Primary WINS Server IP address")
      return false
    end
    if _UPVALUE3_.checkIpv4Address(A0_6["pptpServerIPRange.primWinsServerIp"]) ~= true then
      printCLIError("Invalid IP Address.Octet 1 should be in 1-223" .. " and Octet 4 should be in 1-254 range.")
      return false
    end
    if A0_6["pptpServerIPRange.secWinsServerIp"] == nil or A0_6["pptpServerIPRange.secWinsServerIp"] == "" or A0_6["pptpServerIPRange.secWinsServerIp"] == "0.0.0.0" then
      printCLIError("Please enter a valid Secondary WINS Server" .. " IP address")
      return false
    end
    if _UPVALUE3_.checkIpv4Address(A0_6["pptpServerIPRange.secWinsServerIp"]) ~= true then
      printCLIError("Invalid IP Address.Octet 1 should be in 1-223" .. " and Octet 4 should be in 1-254 range.")
      return false
    end
  end
  return true
end
function pptpdtGet()
  local L0_8, L1_9
  L1_9 = {}
  configRow = db.getRow("pptpServerIPRange", "_ROWID_", "1")
  printLabel("PPTP Server Configuration")
  if configRow["pptpServerIPRange.pptpdEnable"] == "0" and configRow["pptpServerIPRange.pptpd6Enable"] == "0" then
    L0_8 = "Disabled"
  end
  if configRow["pptpServerIPRange.pptpdEnable"] == "1" and configRow["pptpServerIPRange.pptpd6Enable"] == "0" then
    L0_8 = "Enabled (Ipv4 only)"
  end
  if configRow["pptpServerIPRange.pptpdEnable"] == "0" and configRow["pptpServerIPRange.pptpd6Enable"] == "1" then
    L0_8 = "Enabled (Ipv4/Ipv6)"
  end
  resTab.insertField(L1_9, "PPTP Server status", L0_8)
  if configRow["pptpServerIPRange.pptpRoutingMode"] == "0" then
    pptpRoutingMode = "Classical"
  else
    pptpRoutingMode = "NAT"
  end
  resTab.insertField(L1_9, "PPTP Server routing mode : ", pptpRoutingMode)
  resTab.insertField(L1_9, "PPTP Server starting ip address", configRow["pptpServerIPRange.startIPAddress"] or "")
  resTab.insertField(L1_9, "PPTP Server ending ip address", configRow["pptpServerIPRange.endIPAddress"] or "")
  resTab.insertField(L1_9, "IPV6 Prefix", configRow["pptpServerIPRange.pptpdIpv6Prefix"])
  if configRow["pptpServerIPRange.AuthenticationType"] == "0" then
    Authentication = "Local User Database"
  elseif configRow["pptpServerIPRange.AuthenticationType"] == "1" then
    Authentication = "External Radius Server"
  elseif configRow["pptpServerIPRange.AuthenticationType"] == "2" then
    Authentication = "External LDAP Server"
  elseif configRow["pptpServerIPRange.AuthenticationType"] == "3" then
    Authentication = "External Active Directory Server"
  elseif configRow["pptpServerIPRange.AuthenticationType"] == "4" then
    Authentication = "External NT Domain Server"
  elseif configRow["pptpServerIPRange.AuthenticationType"] == "5" then
    Authentication = "External POP3 Server"
  elseif configRow["pptpServerIPRange.AuthenticationType"] == "6" then
    Authentication = "None Authentication"
  end
  resTab.insertField(L1_9, "Authentication Database", Authentication)
  if configRow["pptpServerIPRange.pptpd6Enable"] == "1" then
    resTab.insertField(L1_9, "PPTP Server ipv6 prefix/length : ", configRow["pptpServerIPRange.pptpdIpv6Prefix"] or "")
  end
  if configRow["pptpServerIPRange.PapEnable"] == "0" then
    PapEnable = "Disabled"
  else
    PapEnable = "Enabled"
  end
  resTab.insertField(L1_9, "PPTP Server pap authentication : ", PapEnable)
  if configRow["pptpServerIPRange.ChapEnable"] == "0" then
    ChapEnable = "Disabled"
  else
    ChapEnable = "Enabled"
  end
  resTab.insertField(L1_9, "PPTP Server chap authentication : ", ChapEnable)
  if configRow["pptpServerIPRange.MSChapEnable"] == "0" then
    MSChapEnable = "Disabled"
  else
    MSChapEnable = "Enabled"
  end
  resTab.insertField(L1_9, "PPTP Server mschap authentication : ", MSChapEnable)
  if configRow["pptpServerIPRange.MSChapv2Enable"] == "0" then
    MSChapv2Enable = "Disabled"
  else
    MSChapv2Enable = "Enabled"
  end
  resTab.insertField(L1_9, "PPTP Server mschapv2  authentication : ", MSChapv2Enable)
  if configRow["pptpServerIPRange.Mppe40Enable"] == "0" then
    Mppe40Enable = "Disabled"
  else
    Mppe40Enable = "Enabled"
  end
  resTab.insertField(L1_9, "PPTP Server mppe40 encryption : ", Mppe40Enable)
  if configRow["pptpServerIPRange.Mppe128Enable"] == "0" then
    Mppe128Enable = "Disabled"
  else
    Mppe128Enable = "Enabled"
  end
  resTab.insertField(L1_9, "PPTP Server mppe128 encryption : ", Mppe128Enable)
  if configRow["pptpServerIPRange.MppeStatefullEnable"] == "0" then
    MppeStatefullEnable = "Disabled"
  else
    MppeStatefullEnable = "Enabled"
  end
  if configRow["pptpServerIPRange.netbiosEnable"] == "1" then
    EnableNetbios = "Enabled"
  else
    EnableNetbios = "Disabled"
  end
  resTab.insertField(L1_9, "PPTP Server mppe stateful : ", MppeStatefullEnable)
  resTab.insertField(L1_9, "PPTP Server user timeout : ", configRow["pptpServerIPRange.UserTimeOut"])
  resTab.insertField(L1_9, "Enable Netbios : ", EnableNetbios)
  resTab.insertField(L1_9, "Primary wins server : ", configRow["pptpServerIPRange.primWinsServerIp"])
  resTab.insertField(L1_9, "Secondary wins server : ", configRow["pptpServerIPRange.secWinsServerIp"])
  resTab.print(L1_9, 0)
end
function pptpdtclientGet()
  local L0_10, L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18, L9_19
  L0_10 = "/var/ppp_user_session"
  L1_11 = _UPVALUE0_
  L2_12 = L0_10
  L1_11 = L1_11(L2_12)
  L2_12 = {}
  L3_13 = {}
  for L7_17, L8_18 in L4_14(L5_15) do
    L9_19 = {}
    L2_12[L7_17] = L9_19
    L9_19 = 1
    for _FORV_14_ in L8_18:gmatch("%S+") do
      ({})[L9_19] = _FORV_14_
      L9_19 = L9_19 + 1
    end
    if L9_19 < 4 then
      L2_12[L7_17].user = "*"
      L2_12[L7_17].rmoteip = ({})[1]
      L2_12[L7_17].server = ({})[2]
    else
      L2_12[L7_17].user = ({})[1]
      L2_12[L7_17].rmoteip = ({})[2]
      L2_12[L7_17].server = ({})[3]
    end
  end
  for L9_19, _FORV_10_ in L6_16(L7_17) do
    L4_14[L5_15] = {}
    if L2_12[L9_19].server == "pptpServer" then
      L4_14[L5_15].userName = L2_12[L9_19].user
      L4_14[L5_15].RemoteIP = L2_12[L9_19].rmoteip
      L4_14[L5_15].pptpIP = db.getAttribute("pptpServerIPRange", "_ROWID_", "1", "startIPAddress") or "0"
    end
  end
  L9_19 = "_ROWID_"
  L9_19 = "List of PPTP Active Users"
  L8_18(L9_19)
  if L7_17 == "1" then
    L9_19 = L4_14
    for _FORV_13_, _FORV_14_ in pairs(L9_19) do
      resTab.insertField(L6_16, "User Name", L9_19[L8_18].userName or "")
      resTab.insertField(L6_16, "Remote IP", L9_19[L8_18].RemoteIP or "")
      resTab.insertField(L6_16, "PPTP IP", L9_19[L8_18].pptpIP or "")
    end
    resTab.print(L6_16, 0)
  end
end
