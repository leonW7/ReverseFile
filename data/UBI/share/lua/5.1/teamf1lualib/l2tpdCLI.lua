local L0_0
L0_0 = require
L0_0("teamf1lualib/l2tpServer")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vpn_l2tpServer")
L0_0 = require
L0_0("teamf1lualib/errorMap")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.errorMap")
function l2tpServerCfgInit(A0_1)
  configRow = db.getRow("Xl2tpServerIPRange", "_ROWID_", "1")
  return 1, configRow
end
function l2tpServerCfgSave(A0_2)
  local L1_3, L2_4, L3_5
  L1_3 = "ERROR"
  L2_4 = ""
  L3_5 = ""
  DBTable = "Xl2tpServerIPRange"
  L1_3, L2_4 = l2tpServer.serverConfig(A0_2, "1", "edit")
  if L1_3 == "OK" then
    db.save()
  end
  L3_5 = db.getAttribute("stringsMap", "stringId", L2_4, LANGUAGE) or L2_4
  return L1_3, L3_5
end
function l2tpServerInputVal(A0_6)
  local L1_7
  if db.getRow("networkInfo", "_ROWID_", "1")["networkInfo.netWorkMode"] == "3" then
    if A0_6["pptpServerIPRange.pptpdIpv6PrefixLenghtInit"] ~= nil then
      A0_6["Xl2tpServerIPRange.Xl2tpdIpv6Prefix"] = A0_6["Xl2tpServerIPRange.Xl2tpdIpv6PrefixInit"] .. "/" .. A0_6["Xl2tpServerIPRange.Xl2tpdIpv6PrefixLengthInit"]
    end
  else
    A0_6["Xl2tpServerIPRange.Xl2tpdIpv6Prefix"] = ""
  end
  if db.getRow("networkInfo", "_ROWID_", "1")["networkInfo.netWorkMode"] == "1" and A0_6["Xl2tpServerIPRange.Xl2tpd6Enable"] == "1" then
    printCLIError("Please change Ip Mode to IPV4/IPV6 first to enable L2TP server on ipv6")
    return false
  end
  if A0_6["Xl2tpServerIPRange.Xl2tpd6Enable"] == "1" and A0_6["Xl2tpServerIPRange.Xl2tpdEnable"] == "1" then
    printCLIError("You cannot enable l2tp Server in both ipv4 and ipv4/ipv6 mode.")
    return false
  end
  if A0_6["Xl2tpServerIPRange.Xl2tpd6Enable"] == "1" and (A0_6["Xl2tpServerIPRange.Xl2tpd6Enable"] == nil or A0_6["Xl2tpServerIPRange.Xl2tpd6Enable"] == "") then
    printCLIError("Invalid l2tp server ipv6 prefix")
  end
  if A0_6["Xl2tpServerIPRange.Xl2tpdEnable"] == "1" then
    if A0_6["Xl2tpServerIPRange.StartIPAddress"] == nil or A0_6["Xl2tpServerIPRange.StartIPAddress"] == "" or A0_6["Xl2tpServerIPRange.StartIPAddress"] == "0.0.0.0" then
      printCLIError("Invalid l2tp server start address range")
      return false
    end
    L1_7, range = _UPVALUE0_.subnetCheckValidation(A0_6["Xl2tpServerIPRange.StartIPAddress"], A0_6["Xl2tpServerIPRange.EndIPAddress"])
    if L1_7 ~= _UPVALUE1_.SUCCESS then
      statusErrorMessage = _UPVALUE2_.errorStringGet(L1_7)
      return false, statusErrorMessage
    end
    if A0_6["Xl2tpServerIPRange.EndIPAddress"] == nil or A0_6["Xl2tpServerIPRange.EndIPAddress"] == "" or A0_6["Xl2tpServerIPRange.EndIPAddress"] == "0.0.0.0" then
      printCLIError("Invalid l2tp server  end address range")
      return false
    end
    if _UPVALUE3_.checkIpv4Address(A0_6["Xl2tpServerIPRange.StartIPAddress"]) ~= true then
      printCLIError("Start IP Address is Invalid.Octet 1 should be in 1-223 and Octet 4 should be in 1-254 range.")
      return false
    end
    if _UPVALUE3_.checkIpv4Address(A0_6["Xl2tpServerIPRange.EndIPAddress"]) ~= true then
      printCLIError("End IP Address is Invalid.Octet 1 should be in 1-223 and Octet 4 should be in 1-254 range.")
      return false
    end
    if _UPVALUE3_.ipv4SingleMaskCheck(A0_6["Xl2tpServerIPRange.EndIPAddress"], A0_6["Xl2tpServerIPRange.StartIPAddress"], "255.255.255.0") ~= _UPVALUE1_.SUCCESS then
      printCLIError("Staring IP address and Ending IP address must be in same range")
      return false
    end
    L1_7 = _UPVALUE3_.ipv4AddressesCompare(A0_6["Xl2tpServerIPRange.StartIPAddress"], A0_6["Xl2tpServerIPRange.EndIPAddress"])
    if L1_7 == 0 or L1_7 == 3 or L1_7 == 2 then
      printCLIError("End address should be higher than Start address")
      return false
    end
  end
  if (A0_6["Xl2tpServerIPRange.AuthenticationType"] == "3" or A0_6["Xl2tpServerIPRange.AuthenticationType"] == "4") and (A0_6["Xl2tpServerIPRange.PapEnable"] == "1" or A0_6["Xl2tpServerIPRange.ChapEnable"] == "1") then
    printCLIError("pap and chap are unsupported protocols")
    return false
  end
  if A0_6["Xl2tpServerIPRange.AuthenticationType"] == "5" and (A0_6["Xl2tpServerIPRange.ChapEnable"] == "1" or A0_6["Xl2tpServerIPRange.MSChapEnable"] == "1" or A0_6["Xl2tpServerIPRange.MSChapv2Enable"] == "1") then
    printCLIError("pop3 only supports PAP protocol")
    return false
  end
  if A0_6["Xl2tpServerIPRange.AuthenticationType"] == "6" then
    if A0_6["Xl2tpServerIPRange.PapEnable"] == "1" or A0_6["Xl2tpServerIPRange.ChapEnable"] == "1" or A0_6["Xl2tpServerIPRange.MSChapEnable"] == "1" or A0_6["Xl2tpServerIPRange.MSChapv2Enable"] == "1" then
      printCLIError("do no select any authentication protocol")
      return false
    end
    if A0_6["Xl2tpServerIPRange.Mppe40Enable"] == "1" or A0_6["Xl2tpServerIPRange.Mppe128Enable"] == "1" or A0_6["Xl2tpServerIPRange.MppeStatefullEnable"] == "1" then
      printCLIError("do no select any encryption protocol")
      return false
    end
  end
  if A0_6["Xl2tpServerIPRange.UserTimeOut"] == "0" then
    printCLIError("please Enter the value between 300 - 1800")
    return false
  end
  return true
end
function l2tpdtGet()
  local L0_8, L1_9
  L1_9 = {}
  configRow = db.getRow("Xl2tpServerIPRange", "_ROWID_", "1")
  printLabel("L2TP Server Configuration")
  if configRow["Xl2tpServerIPRange.Xl2tpdEnable"] == "0" and configRow["Xl2tpServerIPRange.Xl2tpd6Enable"] == "0" then
    L0_8 = "Disabled"
  end
  if configRow["Xl2tpServerIPRange.Xl2tpdEnable"] == "1" and configRow["Xl2tpServerIPRange.Xl2tpd6Enable"] == "0" then
    L0_8 = "Enabled (Ipv4 only)"
  end
  if configRow["Xl2tpServerIPRange.Xl2tpdEnable"] == "0" and configRow["Xl2tpServerIPRange.Xl2tpd6Enable"] == "1" then
    L0_8 = "Enabled (Ipv4/Ipv6)"
  end
  resTab.insertField(L1_9, "L2TP Server status : ", L0_8)
  if configRow["Xl2tpServerIPRange.l2tpRoutingMode"] == "0" then
    NatMode = "Classical"
  else
    NatMode = "NAT"
  end
  resTab.insertField(L1_9, "L2TP Server routing mode : ", NatMode or "")
  resTab.insertField(L1_9, "L2TP Server starting ip address : ", configRow["Xl2tpServerIPRange.StartIPAddress"] or "")
  resTab.insertField(L1_9, "L2TP Server ending ip address : ", configRow["Xl2tpServerIPRange.EndIPAddress"] or "")
  resTab.insertField(L1_9, "IPV6 Prefix", configRow["Xl2tpServerIPRange.Xl2tpdIpv6Prefix"])
  if configRow["Xl2tpServerIPRange.AuthenticationType"] == "0" then
    Authentication = "Local User Database"
  elseif configRow["Xl2tpServerIPRange.AuthenticationType"] == "1" then
    Authentication = "External Radius Server"
  elseif configRow["Xl2tpServerIPRange.AuthenticationType"] == "2" then
    Authentication = "External LDAP Server"
  elseif configRow["Xl2tpServerIPRange.AuthenticationType"] == "3" then
    Authentication = "External Active Directory Server"
  elseif configRow["Xl2tpServerIPRange.AuthenticationType"] == "4" then
    Authentication = "External NT Domain Server"
  elseif configRow["Xl2tpServerIPRange.AuthenticationType"] == "5" then
    Authentication = "External POP3 Server"
  elseif configRow["Xl2tpServerIPRange.AuthenticationType"] == "6" then
    Authentication = "None Authentication"
  end
  resTab.insertField(L1_9, "Authentication Database", Authentication)
  if configRow["Xl2tpServerIPRange.Xl2tpd6Enable"] == "1" then
    resTab.insertField(L1_9, "L2TP Server ipv6 prefix/length : ", configRow["Xl2tpServerIPRange.Xl2tpdIpv6Prefix"] or "")
  end
  if configRow["Xl2tpServerIPRange.PapEnable"] == "0" then
    PapEnable = "Disabled"
  else
    PapEnable = "Enabled"
  end
  resTab.insertField(L1_9, "L2TP Server pap authentication : ", PapEnable or "")
  if configRow["Xl2tpServerIPRange.ChapEnable"] == "0" then
    ChapEnable = "Disabled"
  else
    ChapEnable = "Enabled"
  end
  resTab.insertField(L1_9, "L2TP Server chap authentication : ", ChapEnable or "")
  if configRow["Xl2tpServerIPRange.MSChapEnable"] == "0" then
    MSChapEnable = "Disabled"
  else
    MSChapEnable = "Enabled"
  end
  resTab.insertField(L1_9, "L2TP Server mschap authentication : ", MSChapEnable or "")
  if configRow["Xl2tpServerIPRange.MSChapv2Enable"] == "0" then
    MSChapv2Enable = "Disabled"
  else
    MSChapv2Enable = "Enabled"
  end
  resTab.insertField(L1_9, "L2TP Server mschapv2 authentication : ", MSChapv2Enable or "")
  if configRow["Xl2tpServerIPRange.l2tpSecretKeyEnable"] == "0" then
    l2tpSecretKeyEnable = "Disabled"
  else
    l2tpSecretKeyEnable = "Enabled"
  end
  resTab.insertField(L1_9, "L2TP Server secret key status: ", l2tpSecretKeyEnable or "")
  resTab.insertField(L1_9, "L2TP Server secret key : ", configRow["Xl2tpServerIPRange.secretKey"] or "")
  resTab.insertField(L1_9, "L2TP Server user time out : ", configRow["Xl2tpServerIPRange.UserTimeOut"])
  resTab.print(L1_9, 0)
end
function l2tpdtclientGet()
  local L0_10, L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17
  L0_10 = "/var/ppp_user_session"
  L1_11 = _UPVALUE0_
  L2_12 = L0_10
  L1_11 = L1_11(L2_12)
  L2_12 = {}
  for L6_16, L7_17 in L3_13(L4_14) do
    L2_12[L6_16] = {}
    for _FORV_13_ in L7_17:gmatch("%S+") do
      ({})[1] = _FORV_13_
    end
    if 1 + 1 < 4 then
      L2_12[L6_16].user = "*"
      L2_12[L6_16].rmoteip = ({})[1]
      L2_12[L6_16].server = ({})[2]
    else
      L2_12[L6_16].user = ({})[1]
      L2_12[L6_16].rmoteip = ({})[2]
      L2_12[L6_16].server = ({})[3]
    end
  end
  for _FORV_8_, _FORV_9_ in L5_15(L6_16) do
    L3_13[L4_14] = {}
    if L2_12[_FORV_8_].server == "l2tpServer" then
      L3_13[L4_14].userName = L2_12[_FORV_8_].user
      L3_13[L4_14].RemoteIP = L2_12[_FORV_8_].rmoteip
      L3_13[L4_14].Xl2tpIP = db.getAttribute("Xl2tpServerIPRange", "_ROWID_", "1", "StartIPAddress") or "0"
    end
  end
  L7_17("List of L2TP Active Users")
  if L6_16 == "1" then
    for _FORV_12_, _FORV_13_ in pairs(L7_17) do
      resTab.insertField(L5_15, "User Name", L7_17[0 + 1].userName or "")
      resTab.insertField(L5_15, "Remote IP", L7_17[0 + 1].RemoteIP or "")
      resTab.insertField(L5_15, "L2TP IP", L7_17[0 + 1].Xl2tpIP or "")
    end
    resTab.print(L5_15, 0)
  end
end
