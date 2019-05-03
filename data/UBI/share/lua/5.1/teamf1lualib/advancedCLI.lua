require("teamf1lualib/attackChecks")
require("teamf1lualib/ips")
require("teamf1lualib/igmp")
function securityChecksInfoGet(A0_0)
  printLabel("Attack Checks")
  row = db.getRow("AttackChecks", "AttackChecks._ROWID_", 1)
  print("WAN Security Checks:", "")
  if row["AttackChecks.StealthMode"] == "0" then
    print(" Enable Stealth mode               : No")
  else
    print(" Enable Stealth mode               : Yes")
  end
  if row["AttackChecks.TcpFlood"] == "0" then
    print(" Block TCP Flood                   : No")
  else
    print(" Block TCP Flood                   : Yes")
  end
  print("LAN Security Checks:", "")
  if row["AttackChecks.UdpFlood"] == "0" then
    print(" Block UDP Flood                   : No")
  else
    print(" Block UDP Flood                   : Yes")
    print(" UDP Connection Limit              : " .. row["AttackChecks.UdpConnLimitVal"])
  end
  if row["AttackChecks.PingReplyOnLan"] == "0" then
    print(" Allow ICMP Notifications from LAN  : No")
  else
    print(" Allow ICMP Notifications from LAN  : Yes")
  end
  if row["AttackChecks.TcpFilterCheck"] == "0" then
    print("Tcp_Filter_Check   : No")
  else
    print("Tcp_Filter_Check   : Yes")
  end
  row = db.getRow("IcsaSettings", "IcsaSettings._ROWID_", 1)
  print("ICSA Settings:", "")
  if row["IcsaSettings.BlockICMPNotification"] == "0" then
    print(" Block ICMP Notification           : No")
  else
    print(" Block ICMP Notification           : Yes")
  end
  if row["IcsaSettings.BlockFragPkts"] == "0" then
    print(" Block Fragmented Packets           : No")
  else
    print(" Block Fragmented Packets           : Yes")
  end
  if row["IcsaSettings.BlockMulticastPkts"] == "0" then
    print(" Block Multicast Packets           : No")
  else
    print(" Block Multicast Packets           : Yes")
  end
  if row["AttackChecks.BlockSpoof"] == "0" then
    print(" Block spoofed packets             : No")
  else
    print(" Block spoofed packets             : Yes")
  end
  if row["IcsaSettings.BlockTcpRST"] == "0" then
    print(" Block Tcp RST Packets            : No")
  else
    print(" Block Tcp RST Packets            : Yes")
  end
  if row["IcsaSettings.BlockFtpBounceAttack"] == "0" then
    print(" Block Ftp Bounce Attack Packets  : No")
  else
    print(" Block Ftp Bounce Attack Packets  : Yes")
  end
  row = db.getRow("FwDosAttackSettings", "FwDosAttackSettings._ROWID_", 1)
  print("DoS Attacks:", "")
  print("Syn Flood Detect Rate[max/sec]        :", row["FwDosAttackSettings.SynFloodDetectRate"])
  print("Echo Storm Flood Rate[ping pkts/sec]  :", row["FwDosAttackSettings.EchoStormFloodRate"])
  print("ICMP Flood Rate[ICMP pkts/sec]        :", row["FwDosAttackSettings.IcmpFloodRate"])
end
function igmpInfoGet()
  local L0_1, L1_2
  L0_1 = {}
  L1_2 = {}
  printLabel("IGMP Configuration")
  if db.getRow("Igmp", "_ROWID_", "1")["Igmp.IgmpEnable"] == "1" then
    print("Igmp Proxy: Enabled")
  else
    print("Igmp Proxy: Disabled")
  end
  if db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") ~= "DSR-1000N" and db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") ~= "DSR-1000" and db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") ~= "DSR-500" and db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") ~= "DSR-500N" then
    L0_1 = db.getTable("allowedNets")
    printLabel("Multicast Source Network Addresses")
    if L0_1 == nil or L0_1 == {} then
      print("No network addresses are added")
    else
      for _FORV_7_, _FORV_8_ in pairs(L0_1) do
        resTab.insertField(L1_2, "Row Id", _FORV_8_["allowedNets._ROWID_"])
        resTab.insertField(L1_2, "Network Address", _FORV_8_["allowedNets.networkAddr"] or "")
        resTab.insertField(L1_2, "MaskLength", _FORV_8_["allowedNets.maskLength"] or "")
      end
    end
  end
  resTab.print(L1_2, 0)
end
function ipsInfoGet()
  ipsconfig = db.getRow("IPSConfig", "_ROWID_", "1")
  ipscheckconfiglan = db.getRow("IPSNetworkSegments", "_ROWID_", "1")
  ipscheckconfigdmz = db.getRow("IPSNetworkSegments", "_ROWID_", "2")
  printLabel("Intrusion Detection/Prevention Enable")
  if ipsconfig["IPSConfig.idsEnable"] == "1" then
    print("Intrusion Detection: Enabled")
  else
    print("Intrusion Detection: Disabled")
  end
  if ipsconfig["IPSConfig.ipsEnable"] == "1" then
    print("Intrusion Prevention: Enabled")
  else
    print("Intrusion Prevention: Disabled")
  end
  printLabel("IPS Checks Active Between")
  if ipscheckconfiglan["IPSNetworkSegments.ipsEnable"] == "1" then
    print("LAN and WAN :Yes")
  else
    print("LAN and WAN :No")
  end
  if ipscheckconfigdmz["IPSNetworkSegments.ipsEnable"] == "1" then
    print("DMZ and WAN :Yes")
  else
    print("DMZ and WAN :No")
  end
  printLabel("IPS Status")
  print("Number of Signatures Loaded: " .. db.getRow("IPSStatus", "_ROWID_", "1")["IPSStatus.numRules"])
end
function securityChecksCfgSave(A0_3)
  local L1_4, L2_5, L3_6, L4_7
  L1_4 = "ERROR"
  L2_5 = ""
  L3_6 = ""
  L4_7 = {}
  L4_7 = db.getRow("AttackChecks", "AttackChecks._ROWID_", 1)
  if L4_7 == nil then
    print("ERROR")
  end
  if (L4_7["AttackChecks.UdpFlood"] == "0" or A0_3["AttackChecks.UdpFlood"] == "0") and A0_3["AttackChecks.UdpConnLimitVal"] ~= L4_7["AttackChecks.UdpConnLimitVal"] and A0_3["AttackChecks.UdpFlood"] ~= "1" then
    return L1_4, "UDP Connection Limit Configuration Not allowed when Block UDP Flood Disabled"
  end
  L1_4, L2_5 = attackChecks.config(A0_3, "1", "edit")
  if L1_4 == "OK" then
    db.save()
  end
  L3_6 = db.getAttribute("stringsMap", "stringId", L2_5, LANGUAGE)
  return L1_4, L3_6
end
function securityChecksCfgInit(A0_8)
  local L1_9, L2_10
  L1_9 = 1
  L2_10 = attackChecks
  L2_10 = L2_10.configGet
  L2_10 = L2_10()
  if L2_10 == nil then
    return L1_9, {}
  end
  return L1_9, L2_10
end
function igmpCfgInit(A0_11)
  configRow = db.getRow("Igmp", "_ROWID_", "1")
  return 1, configRow
end
function allowedNetCfgInit(A0_12)
  if A0_12[1] == nil then
    configRow = {}
    configRow["allowedNets._ROWID_"] = "-1"
  else
    configRow = db.getRow("allowedNets", "_ROWID_", A0_12[1])
  end
  if configRow == nil then
    print("Row deleted\n")
    return -1, {}
  end
  return configRow["allowedNets._ROWID_"], configRow
end
function allowedNetCfgSave(A0_13)
  local L1_14, L2_15, L3_16
  L1_14 = ""
  L2_15 = ""
  L3_16 = ""
  if A0_13["allowedNets._ROWID_"] == "-1" then
    L1_14, L2_15 = igmp.allowedNetworkConfig(A0_13, "-1", "add")
  else
    L1_14, L2_15 = igmp.allowedNetworkConfig(A0_13, A0_13["allowedNets._ROWID_"], "edit")
  end
  if L1_14 == "OK" then
    db.save()
  end
  L3_16 = db.getAttribute("stringsMap", "stringId", L2_15, LANGUAGE)
  return L1_14, L3_16
end
function allowedNetCfgDel(A0_17)
  local L1_18, L2_19, L3_20, L4_21, L5_22
  L1_18 = {}
  L2_19 = ""
  L3_20 = ""
  L4_21 = ""
  L5_22 = false
  db.beginTransaction()
  if A0_17[1] ~= nil then
    L1_18["allowedNets._ROWID_"] = A0_17[1]
    L5_22 = db.delete("allowedNets", L1_18)
  end
  if L5_22 then
    db.commitTransaction(true)
    L2_19 = "OK"
    L3_20 = "STATUS_OK"
  else
    db.rollback()
    L2_19 = "ERROR"
    L3_20 = "IGMP_NETWORK_DELETE_FAILED"
  end
  if L2_19 == "OK" then
    db.save()
  end
  L4_21 = db.getAttribute("stringsMap", "stringId", L3_20, LANGUAGE)
  return L2_19, L4_21
end
function allowedNetCfgInputVal(A0_23)
  if db.getRow("Igmp", "Igmp._ROWID_", "1")["Igmp.IgmpEnable"] == "0" then
    printCLIError("Igmp Proxy is not enabled")
    return false
  end
  if A0_23["allowedNets.networkAddr"] == nil or A0_23["allowedNets.networkAddr"] == "" then
    printCLIError("Enter a valid IP Address")
    return false
  end
  if A0_23["allowedNets.maskLength"] == nil or A0_23["allowedNets.maskLength"] == "" then
    printCLIError("Enter a valid mask length (0-32)")
    return false
  end
  return true
end
function igmpCfgSave(A0_24)
  local L1_25, L2_26, L3_27
  L1_25 = "ERROR"
  L2_26 = ""
  L3_27 = ""
  L1_25, L2_26 = igmp.config(A0_24, "1", "edit")
  if L1_25 == "OK" then
    db.save()
  end
  L3_27 = db.getAttribute("stringsMap", "stringId", L2_26, LANGUAGE) or L2_26
  return L1_25, L3_27
end
function ipsCfgInit(A0_28)
  local L1_29
  L1_29 = {}
  L1_29 = ips.configGet()
  return 1, L1_29
end
function ipsCfgSave(A0_30)
  local L1_31, L2_32, L3_33, L4_34, L5_35, L6_36, L7_37, L8_38
  L1_31 = "ERROR"
  L2_32 = ""
  L3_33 = ""
  L4_34 = db
  L4_34 = L4_34.getRow
  L5_35 = "ipsConfig"
  L6_36 = "_ROWID_"
  L7_37 = "1"
  L4_34 = L4_34(L5_35, L6_36, L7_37)
  L5_35 = "Enabling the IPS/IDS would result in performance drop. Please confirm(Y/N?)"
  L6_36 = tonumber
  L7_37 = L4_34["ipsConfig.ipsEnable"]
  L6_36 = L6_36(L7_37)
  if L6_36 ~= 1 then
    L6_36 = tonumber
    L7_37 = L4_34["ipsConfig.idsEnable"]
    L6_36 = L6_36(L7_37)
    if L6_36 ~= 1 then
      L6_36 = tonumber
      L7_37 = A0_30["IPSConfig.ipsEnable"]
      L6_36 = L6_36(L7_37)
      if L6_36 ~= 1 then
        L6_36 = tonumber
        L7_37 = A0_30["IPSConfig.idsEnable"]
        L6_36 = L6_36(L7_37)
      elseif L6_36 == 1 then
        L6_36 = printCLIError
        L7_37 = L5_35
        L6_36(L7_37)
        L6_36 = io
        L6_36 = L6_36.stdin
        L7_37 = L6_36
        L6_36 = L6_36.read
        L8_38 = "*l"
        L6_36 = L6_36(L7_37, L8_38)
        if L6_36 ~= "Y" and L6_36 ~= "N" then
          L7_37 = "ERROR"
          L8_38 = "Please confirm with Y/N"
          return L7_37, L8_38
        end
        if L6_36 == "N" then
          L1_31 = "ERROR"
          L2_32 = "Action Cancelled"
          L7_37 = L1_31
          L8_38 = L2_32
          return L7_37, L8_38
        end
      end
    end
  end
  L6_36 = ips
  L6_36 = L6_36.config
  L7_37 = A0_30
  L8_38 = "1"
  L7_37 = L6_36(L7_37, L8_38, "edit")
  L3_33 = L7_37
  L1_31 = L6_36
  L6_36 = db
  L6_36 = L6_36.getAttribute
  L7_37 = "unitInfo"
  L8_38 = "_ROWID_"
  L6_36 = L6_36(L7_37, L8_38, "1", "modelId")
  if L1_31 == "OK" then
    L7_37 = db
    L7_37 = L7_37.save
    L7_37()
    L7_37 = db
    L7_37 = L7_37.getAttribute
    L8_38 = "environment"
    L7_37 = L7_37(L8_38, "name", "HW_OFFLOAD_SCRIPT", "value")
    L8_38 = "/pfrm2.0/bin/lua "
    L8_38 = L8_38 .. L7_37 .. " " .. DB_FILE_NAME
    util.appendDebugOut("Exec: " .. os.execute(L8_38))
  end
  L7_37 = db
  L7_37 = L7_37.getAttribute
  L8_38 = "stringsMap"
  L7_37 = L7_37(L8_38, "stringId", L3_33, LANGUAGE)
  L2_32 = L7_37 or L3_33
  L7_37 = L1_31
  L8_38 = L2_32
  return L7_37, L8_38
end
