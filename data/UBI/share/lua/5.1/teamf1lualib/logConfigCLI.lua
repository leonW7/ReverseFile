local L0_0
L0_0 = require
L0_0("teamf1lualib/admin_license")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.admin.license")
log = {}
function logCfgSave(A0_1)
  DBTable = "FirewallLogs"
  errorFlag, statusCode = logConfigure(A0_1, "1", "edit")
  if errorFlag == "OK" then
    DBTable = "OtherSystemLogs"
    errorFlag, statusCode = logConfigure(A0_1, "1", "edit")
    if errorFlag == "OK" then
      db.save()
    end
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  return errorFlag, statusMessage
end
function logCfgInit(A0_2)
  local L1_3, L2_4, L3_5
  L1_3 = {}
  L2_4 = db
  L2_4 = L2_4.getRow
  L3_5 = "FirewallLogs"
  L2_4 = L2_4(L3_5, "_ROWID_", "1")
  L3_5 = util
  L3_5 = L3_5.tableAppend
  L3_5 = L3_5(L1_3, L2_4)
  L1_3 = L3_5
  L3_5 = db
  L3_5 = L3_5.getRow
  L3_5 = L3_5("OtherSystemLogs", "_ROWID_", "1")
  L1_3 = util.tableAppend(L1_3, L3_5)
  if L1_3 == nil then
    L1_3 = {}
  end
  return 1, L1_3
end
function logCfgVal(A0_6)
  local L1_7
  L1_7 = true
  return L1_7
end
function sysEventLogsGet(A0_8)
  printLabel("Logging Config")
  printLabel("Routing Logs")
  print("LAN to WAN")
  if db.getRow("FirewallLogs", "_ROWID_", "1")["FirewallLogs.LANToWANAccept"] == "1" then
    print("Accepted Packets: Enabled")
  else
    print("Accepted Packets: Disabled")
  end
  if db.getRow("FirewallLogs", "_ROWID_", "1")["FirewallLogs.LANToWANDrop"] == "1" then
    print("Dropped Packets: Enabled")
  else
    print("Dropped Packets: Disabled")
  end
  print("WAN to LAN")
  if db.getRow("FirewallLogs", "_ROWID_", "1")["FirewallLogs.WANToLANAccept"] == "1" then
    print("Accepted Packets: Enabled")
  else
    print("Accepted Packets: Disabled")
  end
  if db.getRow("FirewallLogs", "_ROWID_", "1")["FirewallLogs.WANToLANDrop"] == "1" then
    print("Dropped Packets: Enabled")
  else
    print("Dropped Packets: Disabled")
  end
  print("WAN to DMZ")
  if db.getRow("FirewallLogs", "_ROWID_", "1")["FirewallLogs.WANToDMZAccept"] == "1" then
    print("Accepted Packets: Enabled")
  else
    print("Accepted Packets: Disabled")
  end
  if db.getRow("FirewallLogs", "_ROWID_", "1")["FirewallLogs.WANToDMZDrop"] == "1" then
    print("Dropped Packets: Enabled")
  else
    print("Dropped Packets: Disabled")
  end
  print("DMZ to WAN")
  if db.getRow("FirewallLogs", "_ROWID_", "1")["FirewallLogs.DMZToWANAccept"] == "1" then
    print("Accepted Packets: Enabled")
  else
    print("Accepted Packets: Disabled")
  end
  if db.getRow("FirewallLogs", "_ROWID_", "1")["FirewallLogs.DMZToWANDrop"] == "1" then
    print("Dropped Packets: Enabled")
  else
    print("Dropped Packets: Disabled")
  end
  print("LAN to DMZ")
  if db.getRow("FirewallLogs", "_ROWID_", "1")["FirewallLogs.LANToDMZAccept"] == "1" then
    print("Accepted Packets: Enabled")
  else
    print("Accepted Packets: Disabled")
  end
  if db.getRow("FirewallLogs", "_ROWID_", "1")["FirewallLogs.LANToDMZDROP"] == "1" then
    print("Dropped Packets: Enabled")
  else
    print("Dropped Packets: Disabled")
  end
  print("DMZ to LAN")
  if db.getRow("FirewallLogs", "_ROWID_", "1")["FirewallLogs.DMZToLANAccept"] == "1" then
    print("Accepted Packets: Enabled")
  else
    print("Accepted Packets: Disabled")
  end
  if db.getRow("FirewallLogs", "_ROWID_", "1")["FirewallLogs.DMZToLANDrop"] == "1" then
    print("Dropped Packets: Enabled")
  else
    print("Dropped Packets: Disabled")
  end
  print("VLAN to VLAN")
  if db.getRow("FirewallLogs", "_ROWID_", "1")["FirewallLogs.LANToLANAccept"] == "1" then
    print("Accepted Packets: Enabled")
  else
    print("Accepted Packets: Disabled")
  end
  if db.getRow("FirewallLogs", "_ROWID_", "1")["FirewallLogs.LANToLANDrop"] == "1" then
    print("Dropped Packets: Enabled")
  else
    print("Dropped Packets: Disabled")
  end
  print("Category Filtering")
  if db.getRow("FirewallLogs", "_ROWID_", "1")["FirewallLogs.webCategoryAccept"] == "1" then
    print("Accepted Packets: Enabled")
  else
    print("Accepted Packets: Disabled")
  end
  if db.getRow("FirewallLogs", "_ROWID_", "1")["FirewallLogs.webCategoryDrop"] == "1" then
    print("Dropped Packets: Enabled")
  else
    print("Dropped Packets: Disabled")
  end
  print([[

System Logs]])
  print("____________\n")
  if db.getRow("FirewallLogs", "_ROWID_", "1")["FirewallLogs.UnicastTraffic"] == "1" then
    print("All Unicast Traffic: Enabled")
  else
    print("All Unicast Traffic: Disabled")
  end
  if db.getRow("FirewallLogs", "_ROWID_", "1")["FirewallLogs.BroadCastORMulticastTraffic"] == "1" then
    print("All Broadcast/Multicast Traffic: Enabled")
  else
    print("All Broadcast/Multicast Traffic: Disabled")
  end
  if db.getRow("FirewallLogs", "_ROWID_", "1")["FirewallLogs.FtpLogs"] == "1" then
    print("FTP Logs: Enabled")
  else
    print("FTP Logs: Disabled")
  end
  if db.getRow("FirewallLogs", "_ROWID_", "1")["FirewallLogs.IcmpRedirectedLogs"] == "1" then
    print("Redirected ICMP Packets Log: Enabled")
  else
    print("Redirected ICMP Packets Log: Disabled")
  end
  if db.getRow("FirewallLogs", "_ROWID_", "1")["FirewallLogs.logInvalidPacket"] == "1" then
    print("Invalid Packets Log: Enabled")
  else
    print("Invalid Packets Log: Disabled")
  end
  if _UPVALUE0_.wcfLicenseStatusGet() then
    if db.getRow("FirewallLogs", "_ROWID_", "1")["FirewallLogs.categoryServerLogs"] == "1" then
      print("Remote Classification Server Logs: Enabled")
    else
      print("Remote Classification Server Logs: Disabled")
    end
  end
  if db.getRow("FirewallLogs", "_ROWID_", "1")["FirewallLogs.BandwidthLimitLogs"] == "1" then
    print("Bandwidth Limit: Enabled")
  else
    print("Bandwidth Limit: Disabled")
  end
  print("\n")
end
function ipv6LogsCfgSave(A0_9)
  DBTable = "FirewallLogs6"
  errorFlag, statusCode = logConfigure(A0_9, "1", "edit")
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  return errorFlag, statusMessage
end
function ipv6LogsCfgInit(A0_10)
  configRow = db.getRow("FirewallLogs6", "_ROWID_", "1")
  if configRow == nil then
    configRow = db.getDefaults(true, "FirewallLogs6")
  end
  return 1, configRow
end
function ipv6LogsCfgInputVal(A0_11)
  if (db.getAttribute("networkInfo", "_ROWID_", "1", "netWorkMode") or "") == "1" then
    printCLIError("Please Set IP Mode to IPv4/IPv6 to configure IPv6 " .. "Logging.\n")
    return false
  end
  return true
end
function ipv6LogsCfgGet(A0_12)
  printLabel("IPV6 Logging")
  if ipv6LogsCfgInputVal() then
    printLabel("Routing Logs")
    print("LAN To WAN:\n")
    if db.getRow("FirewallLogs6", "_ROWID_", "1")["FirewallLogs6.LANToWANAccept"] == "1" then
      print("Accepted Packets:  Enabled\t")
    else
      print("Accepted Packets:  Disabled\t")
    end
    if db.getRow("FirewallLogs6", "_ROWID_", "1")["FirewallLogs6.LANToWANDrop"] == "1" then
      print("Dropped Packets:  Enabled\t")
    else
      print("Dropped Packets:  Disabled\t")
    end
    print([[

WAN To LAN:
]])
    if db.getRow("FirewallLogs6", "_ROWID_", "1")["FirewallLogs6.WANToLANAccept"] == "1" then
      print("Accepted Packets:  Enabled\t")
    else
      print("Accepted Packets:  Disabled\t")
    end
    if db.getRow("FirewallLogs6", "_ROWID_", "1")["FirewallLogs6.WANToLANDrop"] == "1" then
      print("Dropped Packets:  Enabled\t")
    else
      print("Dropped Packets:  Disabled\t")
    end
  end
end
function log.config(A0_13, A1_14, A2_15)
  if db.typeAndRangeValidate(A0_13) then
    if A2_15 == "add" then
      return false
    elseif A2_15 == "edit" then
      return db.update(DBTable, A0_13, A1_14)
    elseif A2_15 == "delete" then
      return false
    end
  else
    return false
  end
end
function logConfigure(A0_16, A1_17, A2_18)
  local L3_19
  L3_19 = ACCESS_LEVEL
  if L3_19 ~= 0 then
    L3_19 = "ACCESS_DENIED"
    return L3_19, "ADMIN_REQD"
  end
  L3_19 = db
  L3_19 = L3_19.beginTransaction
  L3_19()
  L3_19 = false
  L3_19 = log.config(A0_16, A1_17, A2_18)
  if L3_19 then
    db.commitTransaction()
    return "OK", "STATUS_OK"
  else
    db.rollback()
    return "ERROR", "LOGGING_CONFIG_FAILED"
  end
end
