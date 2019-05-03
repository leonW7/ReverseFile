local L0_0
L0_0 = require
L0_0("teamf1lualib/errorMap")
L0_0 = require
L0_0("teamf1lualib/sessionSettings_bl")
L0_0 = require
L0_0("teamf1lualib/nimfCLI")
L0_0 = require
L0_0("teamf1lualib/admin_license")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.admin.license")
if UNIT_NAME == "DWC-1000" then
  require("teamf1lualib/lmUtils")
end
;({}).dot11Channelget = "/pfrm2.0/bin/dot11ChannelGet "
function getChannelNum(A0_1)
  local L1_2, L2_3
  L1_2 = tonumber
  L2_3 = A0_1
  L1_2 = L1_2(L2_3)
  if L1_2 >= 2412 then
    L1_2 = tonumber
    L2_3 = A0_1
    L1_2 = L1_2(L2_3)
    if L1_2 == 2484 then
      L1_2 = "14 - 2.484GHz"
      return L1_2
    else
      L1_2 = tonumber
      L2_3 = A0_1
      L1_2 = L1_2(L2_3)
      if L1_2 < 2484 then
        L1_2 = tonumber
        L2_3 = A0_1
        L1_2 = L1_2(L2_3)
        L1_2 = L1_2 - 2407
        L1_2 = L1_2 / 5
        L2_3 = tonumber
        L2_3 = L2_3(A0_1)
        L2_3 = L2_3 / 1000
        return L1_2 .. " - " .. L2_3 .. "GHz"
      else
        L1_2 = tonumber
        L2_3 = A0_1
        L1_2 = L1_2(L2_3)
        if L1_2 < 5000 then
          L1_2 = tonumber
          L2_3 = A0_1
          L1_2 = L1_2(L2_3)
          L1_2 = L1_2 - 2512
          L1_2 = L1_2 / 20
          L1_2 = 15 + L1_2
          L2_3 = tonumber
          L2_3 = L2_3(A0_1)
          L2_3 = L2_3 / 1000
          return L1_2 .. " - " .. L2_3 .. "GHz"
        else
          L1_2 = tonumber
          L2_3 = A0_1
          L1_2 = L1_2(L2_3)
          L1_2 = L1_2 - 5000
          L1_2 = L1_2 / 5
          L2_3 = tonumber
          L2_3 = L2_3(A0_1)
          L2_3 = L2_3 / 1000
          return L1_2 .. " - " .. L2_3 .. "GHz"
        end
      end
    end
  end
end
function tzInfoGet()
  local L0_4, L1_5
  L0_4 = {}
  L1_5 = "1"
  row = db.getRow("ntp", "ntp._ROWID_", 1)
  resTab.insertField(L0_4, "Current Time", util.time())
  L1_5 = tonumber(row["ntp.timezone"])
  L1_5 = L1_5 + 1
  resTab.insertField(L0_4, "Timezone", _UPVALUE0_[L1_5])
  if row["ntp.autoDaylight"] == "1" then
    resTab.insertField(L0_4, "Automatically Adjust for Daylight " .. "Savings Time", "Yes")
  else
    resTab.insertField(L0_4, "Automatically Adjust for Daylight " .. "Savings Time", "No")
  end
  if row["ntp.useDefServers"] == "1" then
    resTab.insertField(L0_4, "Default NTP servers used ", "Yes")
  else
    resTab.insertField(L0_4, "Default NTP servers used ", "No")
    resTab.insertField(L0_4, "Server 1 Name / IP Address", row["ntp.server1"])
    resTab.insertField(L0_4, "Server 2 Name / IP Address", row["ntp.server2"])
  end
  return L0_4
end
function logIdentifierGet()
  return db.getAttribute("emailLogs", "_ROWID_", 1, "logId") or "EAP3000"
end
function syslogServerGet()
  return db.getAttribute("sysLogInfo", "_ROWID_", 1, "serverName")
end
function sysLogInfoGet()
  local L0_6, L1_7, L2_8
  L0_6 = db
  L0_6 = L0_6.getTable
  L1_7 = "sysLogInfo"
  L0_6 = L0_6(L1_7)
  L1_7 = nil
  L2_8 = UNIT_NAME
  if L2_8 ~= "DSR-1000AC" then
    L2_8 = UNIT_NAME
    if L2_8 ~= "DSR-1000N" then
      L2_8 = UNIT_NAME
    end
  else
    if L2_8 == "DSR-1000" then
      L1_7 = 10
  end
  else
    L2_8 = UNIT_NAME
    if L2_8 ~= "DSR-500AC" then
      L2_8 = UNIT_NAME
      if L2_8 ~= "DSR-500N" then
        L2_8 = UNIT_NAME
      end
    else
      if L2_8 == "DSR-500" then
        L1_7 = 7
    end
    else
      L2_8 = UNIT_NAME
      if L2_8 ~= "DSR-250N" then
        L2_8 = UNIT_NAME
      else
        if L2_8 == "DSR-250" then
          L1_7 = 5
      end
      else
        L1_7 = 2
      end
    end
  end
  L2_8 = 0
  for _FORV_6_, _FORV_7_ in pairs(L0_6) do
    L2_8 = L2_8 + 1
    if L1_7 >= L2_8 then
      if tonumber(_FORV_7_["sysLogInfo.Enable"]) == 1 then
        print("Syslog Server " .. L2_8)
        print("___________________")
        print("Enable : Y")
        print("FQDN / IP Address : " .. _FORV_7_["sysLogInfo.serverName"])
        if _FORV_7_["sysLogInfo.facilityId"] == "255" then
          print("Facility :-- All")
        elseif _FORV_7_["sysLogInfo.facilityId"] == "3" then
          print("Facility :-- System")
        elseif _FORV_7_["sysLogInfo.facilityId"] == "16" then
          print("Facility :-- Wireless")
        elseif _FORV_7_["sysLogInfo.facilityId"] == "18" then
          print("Facility :-- Network")
        elseif _FORV_7_["sysLogInfo.facilityId"] == "19" then
          print("Facility :-- VPN")
        elseif _FORV_7_["sysLogInfo.facilityId"] == "20" then
          print("Facility :-- WCF")
        elseif _FORV_7_["sysLogInfo.facilityId"] == "21" then
          print("Facility :-- Firewall")
        end
        if _FORV_7_["sysLogInfo.severity"] == "0" then
          print("Severity :-- All")
        elseif _FORV_7_["sysLogInfo.severity"] == "128" then
          print("Severity :-- Log Debug")
        elseif _FORV_7_["sysLogInfo.severity"] == "64" then
          print("Severity :-- Log Info")
        elseif _FORV_7_["sysLogInfo.severity"] == "32" then
          print("Severity :-- Log Notice")
        elseif _FORV_7_["sysLogInfo.severity"] == "16" then
          print("Severity :-- Log Warning")
        elseif _FORV_7_["sysLogInfo.severity"] == "8" then
          print("Severity :-- Log Error")
        elseif _FORV_7_["sysLogInfo.severity"] == "4" then
          print("Severity :-- Log Critical")
        elseif _FORV_7_["sysLogInfo.severity"] == "2" then
          print("Severity :-- Log Alert")
        elseif _FORV_7_["sysLogInfo.severity"] == "1" then
          print("Severity :-- Log Emerg")
        end
      else
        print("Syslog Server " .. L2_8)
        print("___________________")
        print("Enable : N")
        print("FQDN / IP Address : --")
        print("Facility : --")
        print("Severity : --")
      end
    end
  end
end
function sysLogFacilityInfoGet(A0_9)
  local L1_10, L2_11, L3_12, L4_13, L5_14, L6_15, L7_16, L8_17, L9_18, L10_19, L11_20
  if A0_9 == nil then
    L1_10 = {}
    L2_11 = resTab
    L2_11 = L2_11.insertField
    L3_12 = L1_10
    L4_13 = ""
    L5_14 = "No such facility"
    L2_11(L3_12, L4_13, L5_14)
    return L1_10
  end
  if A0_9 == "Local1-UTM" then
    L1_10 = {}
    L2_11 = resTab
    L2_11 = L2_11.insertField
    L3_12 = L1_10
    L4_13 = ""
    L5_14 = "No such facility"
    L2_11(L3_12, L4_13, L5_14)
    return L1_10
  end
  if A0_9 == "Local4-WCF" then
    L1_10 = _UPVALUE0_
    if L1_10 == false then
      L1_10 = {}
      return L1_10
    end
  end
  if A0_9 == "Wireless" then
    L1_10 = UNIT_NAME
    if L1_10 == "DSR-1000N" then
      L1_10 = UNIT_NAME
      if L1_10 == "DSR-500N" then
        L1_10 = UNIT_NAME
        if L1_10 == "DSR-250N" then
          L1_10 = UNIT_NAME
          if L1_10 == "DSR-150N" then
            L1_10 = UNIT_NAME
            if L1_10 == "DSR-1000AC" then
              L1_10 = UNIT_NAME
            end
          end
        end
      end
    elseif L1_10 ~= "DSR-500AC" then
      L1_10 = {}
      return L1_10
    end
  end
  L1_10 = db
  L1_10 = L1_10.getRow
  L2_11 = "logConfig"
  L3_12 = "logConfig.facility"
  L4_13 = A0_9
  L1_10 = L1_10(L2_11, L3_12, L4_13)
  if L1_10 == nil then
    L2_11 = {}
    L3_12 = resTab
    L3_12 = L3_12.insertField
    L4_13 = L2_11
    L5_14 = ""
    L6_15 = "No such facility"
    L3_12(L4_13, L5_14, L6_15)
    return L2_11
  end
  L2_11 = resTab
  L2_11 = L2_11.createRowLbl
  L3_12 = "Emergency"
  L4_13 = "Alert"
  L5_14 = "Critical"
  L6_15 = "Error"
  L7_16 = "Warning"
  L8_17 = "Notification"
  L9_18 = "Information"
  L10_19 = "Debugging"
  L2_11 = L2_11(L3_12, L4_13, L5_14, L6_15, L7_16, L8_17, L9_18, L10_19)
  L3_12 = util
  L3_12 = L3_12.integerToBits
  L4_13 = L1_10["logConfig.emergency"]
  L3_12 = L3_12(L4_13)
  L4_13 = util
  L4_13 = L4_13.integerToBits
  L5_14 = L1_10["logConfig.alert"]
  L4_13 = L4_13(L5_14)
  L5_14 = util
  L5_14 = L5_14.integerToBits
  L6_15 = L1_10["logConfig.critical"]
  L5_14 = L5_14(L6_15)
  L6_15 = util
  L6_15 = L6_15.integerToBits
  L7_16 = L1_10["logConfig.error"]
  L6_15 = L6_15(L7_16)
  L7_16 = util
  L7_16 = L7_16.integerToBits
  L8_17 = L1_10["logConfig.warning"]
  L7_16 = L7_16(L8_17)
  L8_17 = util
  L8_17 = L8_17.integerToBits
  L9_18 = L1_10["logConfig.notice"]
  L8_17 = L8_17(L9_18)
  L9_18 = util
  L9_18 = L9_18.integerToBits
  L10_19 = L1_10["logConfig.information"]
  L9_18 = L9_18(L10_19)
  L10_19 = util
  L10_19 = L10_19.integerToBits
  L11_20 = L1_10["logConfig.debug"]
  L10_19 = L10_19(L11_20)
  L11_20 = nil
  if Modelid == "DSR-1000AC" or Modelid == "DSR-500AC" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" then
    L11_20 = {
      1,
      3,
      4
    }
  else
    L11_20 = {1, 3}
  end
  for _FORV_15_, _FORV_16_ in ipairs(L11_20) do
    if _FORV_16_ == 1 then
      colLbl = "Display in event log"
    elseif _FORV_16_ == 3 then
      colLbl = "Send to syslog"
      if Modelid == "DSR-1000AC" or Modelid == "DSR-500AC" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" then
      elseif _FORV_16_ == 4 then
        colLbl = "Display on telnet/SSH monitor"
      end
    end
    resTab.insertYNField(L2_11, L3_12[_FORV_16_] == 1, colLbl)
    resTab.insertYNField(L2_11, L4_13[_FORV_16_] == 1, colLbl)
    resTab.insertYNField(L2_11, L5_14[_FORV_16_] == 1, colLbl)
    resTab.insertYNField(L2_11, L6_15[_FORV_16_] == 1, colLbl)
    resTab.insertYNField(L2_11, L7_16[_FORV_16_] == 1, colLbl)
    resTab.insertYNField(L2_11, L8_17[_FORV_16_] == 1, colLbl)
    resTab.insertYNField(L2_11, L9_18[_FORV_16_] == 1, colLbl)
    resTab.insertYNField(L2_11, L10_19[_FORV_16_] == 1, colLbl)
  end
  return L2_11
end
function sysSNMPConfigGet()
  local L0_21
  L0_21 = {}
  row = db.getRow("system", "system._ROWID_", 1)
  if row == nil then
    return nil
  end
  resTab.insertField(L0_21, "SysContact", row["system.sysContact"] or "")
  resTab.insertField(L0_21, "SysLocation", row["system.sysLoc"] or "")
  resTab.insertField(L0_21, "SysName", row["system.name"])
  return L0_21
end
function sysSchedGet()
  local L0_22
  L0_22 = resTab
  L0_22 = L0_22.create
  L0_22 = L0_22()
  emailLogs = db.getAttribute("emailLogs", "_ROWID_", 1, "mailLogs")
  if emailLogs ~= "1" then
    return nil
  end
  schdCmd = db.getAttribute("environment", "name", "EMAILLOGS_PROGRAM", "value") .. " " .. DB_FILE_NAME
  _UPVALUE0_(L0_22, schdCmd)
  return L0_22
end
function sysEmailLogGet()
  local L0_23, L1_24, L2_25, L3_26
  L0_23 = resTab
  L0_23 = L0_23.create
  L0_23 = L0_23()
  L1_24 = db
  L1_24 = L1_24.getAttribute
  L2_25 = "emailLogs"
  L3_26 = "_ROWID_"
  L1_24 = L1_24(L2_25, L3_26, 1, "mailLogs")
  emailLogs = L1_24
  L1_24 = emailLogs
  if L1_24 ~= "1" then
    L1_24 = nil
    return L1_24
  end
  L1_24 = db
  L1_24 = L1_24.getAttribute
  L2_25 = "emailLogs"
  L3_26 = "_ROWID_"
  L1_24 = L1_24(L2_25, L3_26, 1, "entryName")
  L2_25 = db
  L2_25 = L2_25.getRow
  L3_26 = "smtpServer"
  L2_25 = L2_25(L3_26, "entryName", L1_24)
  row = L2_25
  L2_25 = row
  if L2_25 == nil then
  else
    L2_25 = resTab
    L2_25 = L2_25.insertField
    L3_26 = L0_23
    L2_25(L3_26, "E-Mail Server Address", row["smtpServer.emailServer"])
    L2_25 = resTab
    L2_25 = L2_25.insertField
    L3_26 = L0_23
    L2_25(L3_26, "SMTP port number", row["smtpServer.smtpPort"])
    L2_25 = resTab
    L2_25 = L2_25.insertField
    L3_26 = L0_23
    L2_25(L3_26, "Return E-Mail Address", row["smtpServer.fromAddr"])
    L2_25 = resTab
    L2_25 = L2_25.insertField
    L3_26 = L0_23
    L2_25(L3_26, "Send to E-Mail Address", row["smtpServer.toAddr"])
    L2_25 = resTab
    L2_25 = L2_25.insertField
    L3_26 = L0_23
    L2_25(L3_26, "Send to E-Mail Address2", row["smtpServer.toAddr2"])
    L2_25 = resTab
    L2_25 = L2_25.insertField
    L3_26 = L0_23
    L2_25(L3_26, "Send to E-Mail Address3", row["smtpServer.toAddr3"])
    L2_25 = row
    L2_25 = L2_25["smtpServer.auth"]
    L3_26 = tonumber
    L3_26 = L3_26(L2_25)
    L2_25 = L3_26
    L3_26 = ""
    if L2_25 == -1 then
      L3_26 = "No Authentication"
    elseif L2_25 == 0 then
      L3_26 = "Login Plain"
    elseif L2_25 == 1 then
      L3_26 = "CRAM-MD5"
    end
    resTab.insertField(L0_23, "Authentication", L3_26)
    if L2_25 == 0 or L2_25 == 1 then
      resTab.insertField(L0_23, "User Name", row["smtpServer.userName"])
      resTab.insertField(L0_23, "Password", row["smtpServer.passWord"])
    end
    resTab.insertYNField(L0_23, row["smtpServer.respondIdentd"] == "1", "Respond to Identd from SMTP Server")
    resTab.insertYNField(L0_23, row["smtpServer.tlsSupport"] == "1", "Enable tlsSupport")
  end
  return L0_23
end
function sysEmailSchedGet(A0_27)
  print("\n" .. "Log Identifier: " .. logIdentifierGet())
  resultTab = sysEmailLogGet()
  if resultTab == nil then
    print("\n" .. "E-Mail logs are disabled" .. "\n")
  else
    printLabel("Enable E-Mail Logs")
    resTab.print(resultTab, 0)
  end
  resultTab = sysSchedGet()
  if resultTab ~= nil then
    printLabel("Send E-mail logs by Schedule")
    resTab.print(resultTab, 0)
  end
end
function sysLoggingGet(A0_28)
  local L1_29, L2_30, L3_31, L4_32, L5_33
  L1_29 = A0_28[1]
  L2_30 = logIdentifierGet
  L2_30 = L2_30()
  L2_30 = L2_30 or ""
  L3_31 = syslogServerGet
  L3_31 = L3_31()
  L3_31 = L3_31 or ""
  L4_32 = nil
  L5_33 = print
  L5_33("\n" .. "Log Identifier: " .. L2_30)
  L5_33 = print
  L5_33("Syslog Server: " .. L3_31)
  L5_33 = printLabel
  L5_33("Logs Facility and Level Configuration")
  if L1_29 == "all" then
    L5_33 = db
    L5_33 = L5_33.getTable
    L5_33 = L5_33("logConfig")
    for _FORV_9_, _FORV_10_ in pairs(L5_33) do
      L4_32 = 0
      if _FORV_10_["logConfig.facility"] == "Local0-wireless" then
        if UNIT_NAME == "DSR-1000N" or UNIT_NAME == "DSR-500N" or UNIT_NAME == "DSR-250N" or UNIT_NAME == "DSR-150N" or UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-500AC" then
          printLabel("Wireless")
          L4_32 = 1
        end
      elseif _FORV_10_["logConfig.facility"] == "Kernel" then
        printLabel("Kernel")
        L4_32 = 1
      elseif _FORV_10_["logConfig.facility"] == "Local2-Networking" then
        printLabel("Network")
        L4_32 = 1
      elseif _FORV_10_["logConfig.facility"] == "Local3-VPN" then
        printLabel("VPN")
        L4_32 = 1
      elseif _FORV_10_["logConfig.facility"] == "Local4-WCF" and _UPVALUE0_ == true then
        printLabel("WCF")
        L4_32 = 1
      elseif _FORV_10_["logConfig.facility"] == "Local5-Firewall" then
        printLabel("Firewall")
        L4_32 = 1
      elseif _FORV_10_["logConfig.facility"] == "System" then
        printLabel(_FORV_10_["logConfig.facility"])
        L4_32 = 1
      end
      if L4_32 == 1 then
        resultTab = sysLogFacilityInfoGet(_FORV_10_["logConfig.facility"])
        resTab.print(resultTab)
      end
    end
  else
    L4_32 = 0
    if L1_29 == "Wireless" then
      L5_33 = UNIT_NAME
      if L5_33 ~= "DSR-1000N" then
        L5_33 = UNIT_NAME
        if L5_33 ~= "DSR-500N" then
          L5_33 = UNIT_NAME
          if L5_33 ~= "DSR-250N" then
            L5_33 = UNIT_NAME
            if L5_33 ~= "DSR-150N" then
              L5_33 = UNIT_NAME
              if L5_33 ~= "DSR-1000AC" then
                L5_33 = UNIT_NAME
              end
            end
          end
        end
      elseif L5_33 == "DSR-500AC" then
        L1_29 = "Local0-wireless"
        L4_32 = 1
      end
    elseif L1_29 == "System" then
      L1_29 = "System"
      L4_32 = 1
    elseif L1_29 == "Kernel" then
      L1_29 = "Kernel"
      L4_32 = 1
    elseif L1_29 == "Networking" then
      L1_29 = "Local2-Networking"
      L4_32 = 1
    elseif L1_29 == "VPN" then
      L1_29 = "Local3-VPN"
      L4_32 = 1
    elseif L1_29 == "WCF" then
      L1_29 = "Local4-WCF"
      L4_32 = 1
    elseif L1_29 == "Firewall" then
      L1_29 = "Local5-Firewall"
      L4_32 = 1
    end
    if L4_32 == 1 then
      L5_33 = sysLogFacilityInfoGet
      L5_33 = L5_33(L1_29)
      resultTab = L5_33
      L5_33 = printLabel
      L5_33(L1_29)
      L5_33 = resTab
      L5_33 = L5_33.print
      L5_33(resultTab)
    else
      L5_33 = print
      L5_33(L1_29, "", "No such facility")
    end
  end
end
function sysTimezoneGet(A0_34)
  printLabel("Time Zone & NTP Servers Configuration")
  resultTab = tzInfoGet()
  resTab.print(resultTab, 0)
end
function sysUsersGet(A0_35)
  printLabel("User Selection")
  resultTab = sysUserGet()
  resTab.print(resultTab, 0)
  printLabel("Available Access Points")
  resultTab = dot11APAllGet()
  resTab.print(resultTab, 0)
  printLabel("Ethernet Port 1")
  resultTab = _UPVALUE0_()
  resTab.print(resultTab, 0)
  printLabel("Ethernet Port 2")
  resultTab = _UPVALUE1_()
  resTab.print(resultTab, 0)
end
function statusGet(A0_36)
  local L1_37, L2_38, L3_39, L4_40, L5_41, L6_42, L7_43, L8_44, L9_45, L10_46, L11_47, L12_48, L13_49, L14_50, L15_51, L16_52, L17_53, L18_54, L19_55, L20_56, L21_57, L22_58, L23_59, L24_60, L25_61, L26_62, L27_63, L28_64, L29_65, L30_66, L31_67, L32_68, L33_69, L34_70, L35_71, L36_72, L37_73, L38_74, L39_75, L40_76, L41_77, L42_78, L43_79, L44_80
  L1_37 = {}
  if A0_36 == "WAN1" or A0_36 == "WAN2" then
    L2_38 = "LogicalIfName = '"
    L3_39 = A0_36
    L4_40 = "' and addressFamily = 2"
    L2_38 = L2_38 .. L3_39 .. L4_40
    L3_39 = "LogicalIfName = '"
    L4_40 = A0_36
    L5_41 = "' and addressFamily = 10"
    L3_39 = L3_39 .. L4_40 .. L5_41
    L4_40 = "LogicalIfName = '"
    L5_41 = A0_36
    L6_42 = "PPPOE6"
    L7_43 = "' and AddressFamily = 10"
    L4_40 = L4_40 .. L5_41 .. L6_42 .. L7_43
    L5_41 = db
    L5_41 = L5_41.getRowWhere
    L6_42 = "NimfConf"
    L7_43 = L2_38
    L5_41 = L5_41(L6_42, L7_43)
    L6_42 = db
    L6_42 = L6_42.getRowWhere
    L7_43 = "NimfConf"
    L8_44 = L3_39
    L6_42 = L6_42(L7_43, L8_44)
    L7_43 = db
    L7_43 = L7_43.getRowsWhere
    L8_44 = "ipAddressTable"
    L9_45 = L2_38
    L7_43 = L7_43(L8_44, L9_45)
    L8_44 = db
    L8_44 = L8_44.getRows
    L9_45 = "resolverConfig"
    L10_46 = "LogicalIfName"
    L11_47 = A0_36
    L8_44 = L8_44(L9_45, L10_46, L11_47)
    L9_45 = db
    L9_45 = L9_45.getRows
    L10_46 = "defaultRouters"
    L11_47 = "LogicalIfName"
    L9_45 = L9_45(L10_46, L11_47, L12_48)
    L10_46 = db
    L10_46 = L10_46.getAttribute
    L11_47 = "networkInterface"
    L10_46 = L10_46(L11_47, L12_48, L13_49, L14_50)
    L11_47 = db
    L11_47 = L11_47.getAttribute
    L15_51 = "IfStatus"
    L11_47 = L11_47(L12_48, L13_49, L14_50, L15_51)
    L11_47 = L11_47 or ""
    L15_51 = ""
    L16_52 = ""
    L17_53 = ""
    L18_54 = ""
    L19_55 = {}
    L20_56 = {}
    L21_57 = {}
    L22_58 = ""
    L23_59 = "LogicalIfName = '"
    L24_60 = A0_36
    L25_61 = "' and"
    L26_62 = " ProfileName = 'pppoeProfile1'"
    L23_59 = L23_59 .. L24_60 .. L25_61 .. L26_62
    L24_60 = "LogicalIfName = '"
    L25_61 = A0_36
    L26_62 = "' and"
    L27_63 = " ProfileName = 'pppoeProfile2'"
    L24_60 = L24_60 .. L25_61 .. L26_62 .. L27_63
    L25_61 = db
    L25_61 = L25_61.getRowWhere
    L26_62 = "PppoeProfile"
    L27_63 = L23_59
    L25_61 = L25_61(L26_62, L27_63)
    L26_62 = db
    L26_62 = L26_62.getRowWhere
    L27_63 = "PppoeProfile"
    L28_64 = L24_60
    L26_62 = L26_62(L27_63, L28_64)
    L27_63, L28_64, L29_65, L30_66, L31_67 = nil, nil, nil, nil, nil
    if L10_46 ~= nil then
      L32_68 = db
      L32_68 = L32_68.getAttribute
      L33_69 = "ethernet"
      L34_70 = "interfaceName"
      L35_71 = L10_46
      L32_68 = L32_68(L33_69, L34_70, L35_71, L36_72)
      L12_48 = L32_68 or ""
    end
    L32_68 = L5_41["NimfConf.ConnectionType"]
    if L32_68 ~= nil then
      L32_68 = L5_41["NimfConf.ConnectionType"]
      if L32_68 == "dhcpc" then
      else
        L32_68 = L5_41["NimfConf.ConnectionType"]
        if L32_68 == "ifStatic" then
        else
          L32_68 = L5_41["NimfConf.ConnectionType"]
          if L32_68 == "pppoe" then
          else
            L32_68 = L5_41["NimfConf.ConnectionType"]
            if L32_68 == "pptp" then
            else
              L32_68 = L5_41["NimfConf.ConnectionType"]
              if L32_68 == "l2tp" then
              else
                L32_68 = L5_41["NimfConf.ConnectionType"]
                if L32_68 == "threeg" then
                else
                  L32_68 = L5_41["NimfConf.ConnectionType"]
                  if L32_68 == "dualPppoe" then
                    L32_68 = db
                    L32_68 = L32_68.getRowWhere
                    L33_69 = "DualPppoe"
                    L34_70 = "LogicalIfName = '"
                    L35_71 = A0_36
                    L34_70 = L34_70 .. L35_71 .. L36_72
                    L32_68 = L32_68(L33_69, L34_70)
                    L21_57 = L32_68
                  end
                end
              end
            end
          end
        end
      end
    end
    L32_68 = L5_41["NimfConf.ConnectionType"]
    if L32_68 == "pppoe" then
      L32_68 = L25_61["PppoeProfile.Status"]
      if L32_68 == "1" then
        L32_68 = L26_62["PppoeProfile.Status"]
      end
    end
    if L14_50 == "PPTP" then
      L32_68 = db
      L32_68 = L32_68.getAttribute
      L33_69 = "PPTP"
      L34_70 = "LogicalIfName"
      L35_71 = A0_36
      L32_68 = L32_68(L33_69, L34_70, L35_71, L36_72)
      L27_63 = L32_68
    elseif L14_50 == "L2TP" then
      L32_68 = db
      L32_68 = L32_68.getAttribute
      L33_69 = "L2TP"
      L34_70 = "LogicalIfName"
      L35_71 = A0_36
      L32_68 = L32_68(L33_69, L34_70, L35_71, L36_72)
      L28_64 = L32_68
    end
    L32_68 = db
    L32_68 = L32_68.getAttribute
    L33_69 = "networkInfo"
    L34_70 = "_ROWID_"
    L35_71 = "1"
    L32_68 = L32_68(L33_69, L34_70, L35_71, L36_72)
    if L32_68 == "3" then
      L32_68 = L6_42["NimfConf.ConnectionType6"]
      if L32_68 ~= nil then
        L32_68 = L6_42["NimfConf.ConnectionType6"]
        if L32_68 == "dhcp6c" then
          L15_51 = "Dynamic IP (DHCPv6)"
        else
          L32_68 = L6_42["NimfConf.ConnectionType6"]
          if L32_68 == "ifStatic6" then
            L15_51 = "Static IPv6"
          else
            L32_68 = L6_42["NimfConf.ConnectionType6"]
            if L32_68 == "pppoe6" then
              L15_51 = "PPPoE over IPv6"
            else
              L32_68 = L6_42["NimfConf.ConnectionType6"]
              if L32_68 == "" then
                L15_51 = "Disabled"
              end
            end
          end
        end
      end
    else
      L15_51 = "IPv6 is disabled"
    end
    L32_68 = db
    L32_68 = L32_68.getRowWhere
    L33_69 = "NimfStatus"
    L34_70 = L2_38
    L32_68 = L32_68(L33_69, L34_70)
    if L32_68 ~= nil then
      L33_69 = L32_68["NimfStatus.Nimfstatus"]
      L16_52 = L33_69 or ""
    end
    L33_69 = db
    L33_69 = L33_69.getAttribute
    L34_70 = "networkInfo"
    L35_71 = "_ROWID_"
    L33_69 = L33_69(L34_70, L35_71, L36_72, L37_73)
    if L33_69 == "3" then
      L33_69 = db
      L33_69 = L33_69.getRowWhere
      L34_70 = "NimfStatus"
      L35_71 = L3_39
      L33_69 = L33_69(L34_70, L35_71)
      L32_68 = L33_69
      if L32_68 ~= nil then
        L33_69 = L32_68["NimfStatus.Nimfstatus"]
        L17_53 = L33_69 or ""
      end
    else
      L17_53 = "IPv6 is disabled"
    end
    L33_69 = db
    L33_69 = L33_69.getRowWhere
    L34_70 = "NimfStatus"
    L35_71 = L2_38
    L33_69 = L33_69(L34_70, L35_71)
    if L33_69 ~= nil then
      L34_70 = L33_69["NimfStatus.Linkstatus"]
      L18_54 = L34_70 or ""
    end
    L34_70 = db
    L34_70 = L34_70.getAttribute
    L35_71 = "NatTable"
    L34_70 = L34_70(L35_71, L36_72, L37_73, L38_74)
    if L34_70 == "1" then
    else
    end
    L34_70 = resTab
    L34_70 = L34_70.insertField
    L35_71 = L1_37
    L37_73 = L12_48 or ""
    L34_70(L35_71, L36_72, L37_73)
    L34_70 = ""
    L35_71 = 0
    if L14_50 ~= "Japanese multiple PPPoE" then
      if L7_43 then
        for L39_75, L40_76 in L36_72(L37_73) do
          L35_71 = L35_71 + 1
          L41_77 = L7_43[L35_71]
          L34_70 = L42_78 .. L43_79 .. L44_80 .. L41_77["ipAddressTable.subnetMask"]
          if L35_71 ~= L42_78 then
            L34_70 = L42_78 .. L43_79
          end
        end
      end
    else
      if L14_50 == "Japanese multiple PPPoE" then
        if L7_43 then
          L35_71 = 0
          for L39_75, L40_76 in L36_72(L37_73) do
            L35_71 = L35_71 + 1
            L41_77 = L7_43[L35_71]
            L34_70 = L42_78 .. L43_79 .. L44_80 .. "Primary" .. ")"
            if L35_71 ~= L42_78 then
              L34_70 = L42_78 .. L43_79
            end
          end
        end
        if L36_72 == 2 then
          if L36_72 == 2 then
            if L37_73 then
              L40_76 = "*all"
              L36_72 = L38_74 or ""
              L40_76 = L36_72
              L41_77 = " ("
              L34_70 = L38_74 .. L39_75 .. L40_76 .. L41_77 .. L42_78 .. L43_79
              L38_74(L39_75)
            end
          end
        end
      else
      end
    end
    if L14_50 == "Russian dual access PPPoE" then
      if L38_74 == "1" then
        L40_76 = "r"
        if L38_74 then
          L40_76 = L38_74
          L41_77 = "*line"
          L22_58 = L39_75 or "MM"
          L40_76 = L38_74
          L41_77 = "*line"
          L37_73 = L39_75 or ""
          L40_76 = L38_74
          L41_77 = "*line"
          L36_72 = L39_75 or ""
        else
          L22_58 = "0.0.0.0"
        end
        L40_76 = ", "
        L41_77 = L36_72
        L34_70 = L39_75 .. L40_76 .. L41_77 .. L42_78 .. L43_79 .. L44_80 .. "Physical" .. ")"
      elseif L38_74 == "0" and L11_47 == "1" then
        if L38_74 ~= nil then
          if L38_74 ~= nil then
            if L38_74 ~= nil then
              L22_58 = L38_74 or "DD"
            end
          end
        else
          L22_58 = "0.0.0.0"
        end
        L40_76 = L36_72
        L41_77 = " / "
        L34_70 = L38_74 .. L39_75 .. L40_76 .. L41_77 .. L42_78 .. L43_79 .. L44_80 .. ")"
      end
    end
    if L27_63 == "1" then
      L40_76 = nil
      L41_77 = tonumber
      L41_77 = L41_77(L42_78)
      if L41_77 == 0 then
        L41_77 = L36_72["Pptp.Gateway"]
        L29_65 = L41_77 or ""
        L41_77 = L36_72["Pptp.NetMask"]
        L39_75 = L41_77 or ""
        L41_77 = L36_72["Pptp.StaticIp"]
        L40_76 = L41_77 or ""
        L41_77 = L36_72["Pptp.StaticDNS"]
        L30_66 = L41_77 or ""
        L31_67 = "0.0.0.0"
        L41_77 = L34_70
        L34_70 = L41_77 .. L42_78 .. L43_79 .. L44_80 .. L39_75 .. " (Physical)"
      else
        L41_77 = io
        L41_77 = L41_77.open
        L41_77 = L41_77(L42_78, L43_79)
        rPptp_file = L41_77
        L41_77 = rPptp_file
        if L41_77 then
          L41_77 = rPptp_file
          L41_77 = L41_77.read
          L41_77 = L41_77(L42_78, L43_79)
          L29_65 = L41_77 or ""
          L41_77 = rPptp_file
          L41_77 = L41_77.read
          L41_77 = L41_77(L42_78, L43_79)
          L39_75 = L41_77 or ""
          L41_77 = rPptp_file
          L41_77 = L41_77.read
          L41_77 = L41_77(L42_78, L43_79)
          L40_76 = L41_77 or ""
          L41_77 = rPptp_file
          L41_77 = L41_77.read
          L41_77 = L41_77(L42_78, L43_79)
          L30_66 = L41_77 or ""
          L41_77 = rPptp_file
          L41_77 = L41_77.read
          L41_77 = L41_77(L42_78, L43_79)
          L31_67 = L41_77 or ""
          L41_77 = L34_70
          L34_70 = L41_77 .. L42_78 .. L43_79 .. L44_80 .. L39_75 .. " (Physical)"
          L41_77 = rPptp_file
          L41_77 = L41_77.close
          L41_77(L42_78)
        else
          L29_65 = "0.0.0.0"
          L40_76 = "0.0.0.0"
          L30_66 = "0.0.0.0"
          L31_67 = "0.0.0.0"
          L41_77 = L34_70
          L34_70 = L41_77 .. L42_78
        end
      end
    elseif L28_64 == "1" then
      L40_76 = nil
      L41_77 = tonumber
      L41_77 = L41_77(L42_78)
      if L41_77 == 0 then
        L41_77 = L36_72["L2tp.Gateway"]
        L29_65 = L41_77 or ""
        L41_77 = L36_72["L2tp.NetMask"]
        L39_75 = L41_77 or ""
        L41_77 = L36_72["L2tp.StaticIp"]
        L40_76 = L41_77 or ""
        L41_77 = L36_72["L2tp.StaticDNS"]
        L30_66 = L41_77 or ""
        L31_67 = "0.0.0.0"
        L41_77 = L34_70
        L34_70 = L41_77 .. L42_78 .. L43_79 .. L44_80 .. L39_75 .. " (Physical)"
      else
        L41_77 = io
        L41_77 = L41_77.open
        L41_77 = L41_77(L42_78, L43_79)
        rL2tp_file = L41_77
        L41_77 = rL2tp_file
        if L41_77 then
          L41_77 = rL2tp_file
          L41_77 = L41_77.read
          L41_77 = L41_77(L42_78, L43_79)
          L29_65 = L41_77 or ""
          L41_77 = rL2tp_file
          L41_77 = L41_77.read
          L41_77 = L41_77(L42_78, L43_79)
          L39_75 = L41_77 or ""
          L41_77 = rL2tp_file
          L41_77 = L41_77.read
          L41_77 = L41_77(L42_78, L43_79)
          L40_76 = L41_77 or ""
          L41_77 = rL2tp_file
          L41_77 = L41_77.read
          L41_77 = L41_77(L42_78, L43_79)
          L30_66 = L41_77 or ""
          L41_77 = rL2tp_file
          L41_77 = L41_77.read
          L41_77 = L41_77(L42_78, L43_79)
          L31_67 = L41_77 or ""
          L41_77 = L34_70
          L34_70 = L41_77 .. L42_78 .. L43_79 .. L44_80 .. L39_75 .. " (Physical)"
          L41_77 = rL2tp_file
          L41_77 = L41_77.close
          L41_77(L42_78)
        else
          L29_65 = "0.0.0.0"
          L40_76 = "0.0.0.0"
          L30_66 = "0.0.0.0"
          L31_67 = "0.0.0.0"
          L41_77 = L34_70
          L34_70 = L41_77 .. L42_78
        end
      end
    end
    L39_75 = L34_70 or ""
    L36_72(L37_73, L38_74, L39_75)
    L34_70 = ""
    if L15_51 == "PPPoE over IPv6" then
    else
    end
    L40_76 = "1"
    L41_77 = "netWorkMode"
    if L37_73 == "3" then
      L35_71 = 0
      if L36_72 then
        for L40_76, L41_77 in L37_73(L38_74) do
          L35_71 = L35_71 + 1
          if L43_79 ~= nil then
            if L43_79 ~= "" then
              L34_70 = L43_79 .. L44_80 .. " / " .. L42_78["ipAddressTable.ipv6PrefixLen"]
            end
          end
          if L35_71 ~= L43_79 then
            if L43_79 ~= nil then
              if L43_79 ~= "" then
                L34_70 = L43_79 .. L44_80
              end
            end
          end
        end
      end
    end
    L40_76 = L34_70 or ""
    L37_73(L38_74, L39_75, L40_76)
    if L11_47 == "1" then
      L11_47 = "UP"
    elseif L11_47 == "2" then
      L11_47 = "UP(IPv6)"
    elseif L11_47 == "3" then
      L11_47 = "UP(IPv4 and IPv6)"
    elseif L11_47 == "0" then
      L11_47 = "DOWN"
    end
    if L14_50 == "Japanese multiple PPPoE" then
      L40_76 = L11_47
      L41_77 = " ("
      if L39_75 == 2 then
        L40_76 = "/var/wan101Ip"
        L41_77 = "r"
        if L39_75 then
          L40_76 = L38_74
          L41_77 = ","
          L41_77 = L39_75
          L40_76 = L39_75.close
          L40_76(L41_77)
        else
          L40_76 = L38_74
          L41_77 = ","
        end
      end
      L11_47 = L38_74
    end
    if L14_50 == "Russian dual access PPPoE" then
      if L38_74 == "1" then
        L40_76 = "r"
        if L38_74 then
        else
        end
      elseif L38_74 == "0" then
        if L11_47 == "UP" then
        else
        end
      end
      L40_76 = L37_73
      L41_77 = " ("
      L11_47 = L38_74 .. L39_75 .. L40_76 .. L41_77 .. L42_78 .. L43_79
    end
    if L27_63 == "1" then
      L40_76 = A0_36
      L41_77 = "GetIpFromIsp"
      L40_76 = "/var/russia_pptp.conf"
      L41_77 = "r"
      isFile = L39_75
      if L39_75 then
        L40_76 = L39_75
        L39_75(L40_76)
      else
      end
      L40_76 = L37_73
      L40_76 = ", "
      L41_77 = L38_74
      L11_47 = L39_75 .. L40_76 .. L41_77 .. L42_78
    elseif L28_64 == "1" then
      L40_76 = A0_36
      L41_77 = "GetIpFromIsp"
      L40_76 = "/var/russia_l2tp.conf"
      L41_77 = "r"
      isFile = L39_75
      if L39_75 then
        L40_76 = L39_75
        L39_75(L40_76)
      else
      end
      L40_76 = L37_73
      L40_76 = ", "
      L41_77 = L38_74
      L11_47 = L39_75 .. L40_76 .. L41_77 .. L42_78
    end
    L40_76 = L11_47 or ""
    L37_73(L38_74, L39_75, L40_76)
    L40_76 = L13_49 or ""
    L37_73(L38_74, L39_75, L40_76)
    if L27_63 == "1" then
      L40_76 = "Russian dual access PPTP"
      L37_73(L38_74, L39_75, L40_76)
    elseif L28_64 == "1" then
      L40_76 = "Russian dual access L2TP"
      L37_73(L38_74, L39_75, L40_76)
    else
      L40_76 = L14_50 or ""
      L37_73(L38_74, L39_75, L40_76)
    end
    L40_76 = L15_51 or ""
    L37_73(L38_74, L39_75, L40_76)
    L40_76 = L16_52 or ""
    L37_73(L38_74, L39_75, L40_76)
    L40_76 = L17_53 or ""
    L37_73(L38_74, L39_75, L40_76)
    L40_76 = L18_54 or ""
    L37_73(L38_74, L39_75, L40_76)
    L40_76 = "_ROWID_"
    L41_77 = "1"
    if L38_74 ~= nil then
      L40_76 = L38_74["WanMode.Wanmode"]
      if L40_76 == "2" then
      else
      end
      if L39_75 ~= nil then
        if L39_75 == "WAN1" then
        else
        end
      else
      end
      L40_76 = L38_74["WanMode.Wanmode"]
      if L40_76 == "2" then
        L40_76 = "Auto-Rollover using WAN port"
        L41_77 = L39_75
      else
        L40_76 = L38_74["WanMode.Wanmode"]
        if L40_76 == "1" then
        else
          L40_76 = L38_74["WanMode.Wanmode"]
          if L40_76 == "3" then
          else
            L40_76 = L38_74["WanMode.Wanmode"]
            if L40_76 == "0" then
              L40_76 = "Use only single WAN port "
              L41_77 = L39_75
            end
          end
        end
      end
    end
    L40_76 = "unitInfo"
    L41_77 = "_ROWID_"
    if L39_75 == "DSR-1000N" or L39_75 == "DSR-1000" or L39_75 == "DSR-500" or L39_75 == "DSR-500N" or L39_75 == "DSR-1000AC" or L39_75 == "DSR-500AC" then
      L40_76 = resTab
      L40_76 = L40_76.insertField
      L41_77 = L1_37
      L43_79 = L37_73 or ""
      L40_76(L41_77, L42_78, L43_79)
    end
    L40_76 = ""
    if L9_45 then
      L41_77 = 0
      for _FORV_45_, _FORV_46_ in L42_78(L43_79) do
        L41_77 = L41_77 + 1
        if L9_45[L41_77]["defaultRouters.nextHopGateway"] ~= nil and L9_45[L41_77]["defaultRouters.nextHopGateway"] ~= "" then
          if L40_76 == "" then
            L40_76 = L40_76 .. L9_45[L41_77]["defaultRouters.nextHopGateway"]
          else
            L40_76 = L40_76 .. ", " .. L9_45[L41_77]["defaultRouters.nextHopGateway"]
          end
        end
      end
    end
    L41_77 = db
    L41_77 = L41_77.getAttribute
    L41_77 = L41_77(L42_78, L43_79, L44_80, "netWorkMode")
    if L41_77 == "3" then
      L41_77 = ""
      if L15_51 == "PPPoE over IPv6" then
        stat6Row = L42_78
        L41_77 = L42_78["defaultRouters.nextHopGateway"]
      end
      if L41_77 == nil or L41_77 == "" then
        if tonumber(L42_78) == 2 then
          file = io.open("/tmp/pppoe6CommonSessionGW" .. "." .. A0_36, "r")
          if file then
            L43_79 = file:read("*all") or ""
            L41_77 = L43_79
            if L41_77 then
              L40_76 = L40_76 .. ", " .. L41_77
              file:close()
            end
          end
        end
      end
    end
    if L14_50 == "Japanese multiple PPPoE" then
      L41_77 = L40_76
      L40_76 = L41_77 .. L42_78 .. L43_79 .. L44_80
      L41_77 = #L19_55
      if L41_77 == 2 then
        L41_77 = io
        L41_77 = L41_77.open
        L41_77 = L41_77(L42_78, L43_79)
        if L41_77 then
          L40_76 = L43_79 .. L44_80 .. L42_78 .. " (" .. "Secondary" .. ")"
          L43_79(L44_80)
        end
      end
    end
    if L14_50 == "Russian dual access PPPoE" then
      L41_77 = L40_76
      L40_76 = L41_77 .. L42_78 .. L43_79 .. L44_80 .. "Physical" .. ")"
    end
    if L27_63 == "1" then
      L41_77 = L40_76
      L40_76 = L41_77 .. L42_78 .. L43_79 .. L44_80
      L41_77 = resTab
      L41_77 = L41_77.insertField
      L44_80 = L40_76 or ""
      L41_77(L42_78, L43_79, L44_80)
    elseif L28_64 == "1" then
      L41_77 = L40_76
      L40_76 = L41_77 .. L42_78 .. L43_79 .. L44_80
      L41_77 = resTab
      L41_77 = L41_77.insertField
      L44_80 = L40_76 or ""
      L41_77(L42_78, L43_79, L44_80)
    else
      L41_77 = resTab
      L41_77 = L41_77.insertField
      L44_80 = L40_76 or ""
      L41_77(L42_78, L43_79, L44_80)
    end
    L41_77 = ""
    if L8_44 then
      for _FORV_46_, _FORV_47_ in L43_79(L44_80) do
        if L8_44[L42_78]["resolverConfig.nameserver1"] ~= nil and L8_44[L42_78]["resolverConfig.nameserver1"] ~= "" then
          if L41_77 == "" then
            L41_77 = L41_77 .. L8_44[L42_78]["resolverConfig.nameserver1"]
          else
            L41_77 = L41_77 .. ", " .. L8_44[L42_78]["resolverConfig.nameserver1"]
          end
        end
      end
    end
    if L14_50 == "Japanese multiple PPPoE" then
      L41_77 = L42_78 .. L43_79 .. L44_80 .. ")"
      if L42_78 == 2 then
        if L42_78 then
          L41_77 = L44_80 .. ", " .. L43_79 .. " (" .. "Secondary" .. ")"
          L44_80(L42_78)
        end
      end
    end
    if L14_50 == "Russian dual access PPPoE" then
      if L8_44 then
        for _FORV_47_, _FORV_48_ in L44_80(L8_44) do
          if L8_44[L43_79]["resolverConfig.nameserver3"] ~= nil and L8_44[L43_79]["resolverConfig.nameserver3"] ~= "" and L42_78 == "" then
          else
          end
        end
      end
      L41_77 = L43_79 .. L44_80 .. L42_78 .. " (" .. "Physical" .. ")"
    end
    if L27_63 == "1" then
      L41_77 = L42_78 .. L43_79 .. L44_80 .. "(Physical)"
      L42_78(L43_79, L44_80, L41_77 or "")
    elseif L28_64 == "1" then
      L41_77 = L42_78 .. L43_79 .. L44_80 .. "(Physical)"
      L42_78(L43_79, L44_80, L41_77 or "")
    else
      L42_78(L43_79, L44_80, L41_77 or "")
    end
    if L8_44 then
      for _FORV_47_, _FORV_48_ in L44_80(L8_44) do
        if L8_44[L43_79]["resolverConfig.nameserver2"] ~= nil and L8_44[L43_79]["resolverConfig.nameserver2"] ~= "" then
          if L42_78 == "" then
          else
          end
        end
      end
    end
    if L14_50 == "Japanese multiple PPPoE" then
      if L43_79 == 2 then
        if L43_79 then
          L35_71 = 1
          while true do
            if L35_71 == 2 then
              break
            end
            L35_71 = L35_71 + 1
          end
          L43_79:close()
        end
      end
    end
    if L14_50 == "Russian dual access PPPoE" then
      if L8_44 then
        for _FORV_48_, _FORV_49_ in pairs(L8_44) do
          if L8_44[L44_80]["resolverConfig.nameserver4"] ~= nil and L8_44[L44_80]["resolverConfig.nameserver4"] ~= "" and L43_79 == "" then
          else
          end
        end
      end
    end
    if L27_63 == "1" then
      L43_79(L44_80, "Secondary DNS", L42_78 or "")
    elseif L28_64 == "1" then
      L43_79(L44_80, "Secondary DNS", L42_78 or "")
    else
      L43_79(L44_80, "Secondary DNS", L42_78 or "")
    end
  elseif A0_36 == "DMZ" then
    L2_38 = "LogicalIfName = 'DMZ' AND addressFamily = '2'"
    L3_39 = db
    L3_39 = L3_39.getRowsWhere
    L4_40 = "ipAddressTable"
    L5_41 = L2_38
    L3_39 = L3_39(L4_40, L5_41)
    L4_40 = db
    L4_40 = L4_40.getRow
    L5_41 = "dhcp"
    L6_42 = "dhcp._ROWID_"
    L7_43 = "2"
    L4_40 = L4_40(L5_41, L6_42, L7_43)
    L5_41 = ""
    if L4_40 ~= nil then
      L6_42 = L4_40["dhcp.dhcpEnabled"]
      if L6_42 == "1" then
        L5_41 = "Enabled"
      else
        L6_42 = L4_40["dhcp.dhcpEnabled"]
        if L6_42 == "0" then
          L5_41 = "Disabled"
        end
      end
    end
    L6_42 = db
    L6_42 = L6_42.getRow
    L7_43 = "dhcpRelay"
    L8_44 = "dhcpRelay.LogicalIfName"
    L9_45 = "DMZ"
    L6_42 = L6_42(L7_43, L8_44, L9_45)
    L7_43 = ""
    if L6_42 ~= nil then
      L8_44 = L6_42["dhcpRelay.DhcpRelayStatus"]
      if L8_44 == "1" then
        L7_43 = "Enabled"
      else
        L8_44 = L6_42["dhcpRelay.DhcpRelayStatus"]
        if L8_44 == "0" then
          L7_43 = "Disabled"
        end
      end
    end
    L8_44 = db
    L8_44 = L8_44.getRow
    L9_45 = "networkInterface"
    L10_46 = "LogicalIfName"
    L11_47 = "DMZ"
    L8_44 = L8_44(L9_45, L10_46, L11_47)
    L9_45 = db
    L9_45 = L9_45.getAttribute
    L10_46 = "ethernet"
    L11_47 = "ethernet.interfaceName"
    L9_45 = L9_45(L10_46, L11_47, L12_48, L13_49)
    L10_46 = resTab
    L10_46 = L10_46.insertField
    L11_47 = L1_37
    L13_49 = L9_45 or ""
    L10_46(L11_47, L12_48, L13_49)
    L10_46 = ""
    L11_47 = 0
    if L3_39 then
      for L15_51, L16_52 in L12_48(L13_49) do
        L11_47 = L11_47 + 1
        L17_53 = L3_39[L11_47]
        L18_54 = L10_46
        L19_55 = L17_53["ipAddressTable.ipAddress"]
        L20_56 = " / "
        L21_57 = L17_53["ipAddressTable.subnetMask"]
        L10_46 = L18_54 .. L19_55 .. L20_56 .. L21_57
        L18_54 = #L3_39
        if L11_47 ~= L18_54 then
          L18_54 = L10_46
          L19_55 = ", "
          L10_46 = L18_54 .. L19_55
        end
      end
    end
    L15_51 = L10_46 or ""
    L12_48(L13_49, L14_50, L15_51)
    L15_51 = L5_41 or ""
    L12_48(L13_49, L14_50, L15_51)
    L15_51 = L7_43 or ""
    L12_48(L13_49, L14_50, L15_51)
  end
  return L1_37
end
function lanStatusGet()
  local L0_81, L1_82, L2_83, L3_84, L4_85, L5_86, L6_87, L7_88, L8_89, L9_90, L10_91, L11_92, L12_93, L13_94
  L0_81 = {}
  L1_82 = "LogicalIfName = 'LAN' AND addressFamily = '2'"
  L2_83 = db
  L2_83 = L2_83.getRowsWhere
  L3_84 = "ipAddressTable"
  L4_85 = L1_82
  L2_83 = L2_83(L3_84, L4_85)
  L3_84 = "LogicalIfName = 'LAN' AND addressFamily = '10'"
  L4_85 = db
  L4_85 = L4_85.getRowsWhere
  L5_86 = "ipAddressTable"
  L6_87 = L3_84
  L4_85 = L4_85(L5_86, L6_87)
  L5_86 = db
  L5_86 = L5_86.getRow
  L6_87 = "dhcp"
  L7_88 = "dhcp._ROWID_"
  L8_89 = "1"
  L5_86 = L5_86(L6_87, L7_88, L8_89)
  L6_87 = ""
  if L5_86 ~= nil then
    L7_88 = L5_86["dhcp.dhcpEnabled"]
    if L7_88 == "1" then
      L6_87 = "Enabled"
    else
      L7_88 = L5_86["dhcp.dhcpEnabled"]
      if L7_88 == "0" then
        L6_87 = "Disabled"
      end
    end
  end
  L7_88 = db
  L7_88 = L7_88.getRow
  L8_89 = "dhcpRelay"
  L9_90 = "dhcpRelay.LogicalIfName"
  L10_91 = "LAN"
  L7_88 = L7_88(L8_89, L9_90, L10_91)
  L8_89 = ""
  if L7_88 ~= nil then
    L9_90 = L7_88["dhcpRelay.DhcpRelayStatus"]
    if L9_90 == "1" then
      L8_89 = "Enabled"
    else
      L9_90 = L7_88["dhcpRelay.DhcpRelayStatus"]
      if L9_90 == "0" then
        L8_89 = "Disabled"
      end
    end
  end
  L9_90 = db
  L9_90 = L9_90.getRow
  L10_91 = "dhcpv6s"
  L11_92 = "dhcpv6s._ROWID_"
  L12_93 = "1"
  L9_90 = L9_90(L10_91, L11_92, L12_93)
  L10_91 = ""
  L11_92 = db
  L11_92 = L11_92.getAttribute
  L12_93 = "networkInfo"
  L13_94 = "_ROWID_"
  L11_92 = L11_92(L12_93, L13_94, "1", "netWorkMode")
  if L11_92 == "3" then
    if L9_90 ~= nil then
      L11_92 = L9_90["dhcpv6s.isEnabled"]
      if L11_92 == "1" then
        L10_91 = "Enabled"
      else
        L11_92 = L9_90["dhcpv6s.isEnabled"]
        if L11_92 == "0" then
          L10_91 = "Disabled"
        end
      end
    end
  else
    L10_91 = "IPv6 is disabled"
  end
  L11_92 = db
  L11_92 = L11_92.getRow
  L12_93 = "networkInterface"
  L13_94 = "LogicalIfName"
  L11_92 = L11_92(L12_93, L13_94, "LAN")
  L12_93 = db
  L12_93 = L12_93.getAttribute
  L13_94 = "ethernet"
  L12_93 = L12_93(L13_94, "ethernet.interfaceName", L11_92["networkInterface.interfaceName"], "macAddress")
  L13_94 = resTab
  L13_94 = L13_94.insertField
  L13_94(L0_81, "MAC Address", L12_93 or "")
  L13_94 = ""
  if L2_83 then
    for _FORV_18_, _FORV_19_ in pairs(L2_83) do
      L13_94 = L13_94 .. L2_83[0 + 1]["ipAddressTable.ipAddress"] .. " / " .. L2_83[0 + 1]["ipAddressTable.subnetMask"]
      if 0 + 1 ~= #L2_83 then
        L13_94 = L13_94 .. ", "
      end
    end
  end
  resTab.insertField(L0_81, "IP Address", L13_94 or "")
  L13_94 = ""
  if db.getAttribute("networkInfo", "_ROWID_", "1", "netWorkMode") == "3" and L4_85 then
    for _FORV_18_, _FORV_19_ in pairs(L4_85) do
      L13_94 = L13_94 .. L4_85[0 + 1]["ipAddressTable.ipAddress"] .. " / " .. L4_85[0 + 1]["ipAddressTable.ipv6PrefixLen"]
      if 0 + 1 ~= #L4_85 then
        L13_94 = L13_94 .. ", "
      end
    end
  end
  resTab.insertField(L0_81, "IPv6 Address", L13_94 or "")
  resTab.insertField(L0_81, "DHCP Server", L6_87 or "")
  resTab.insertField(L0_81, "DHCP Relay", L8_89 or "")
  resTab.insertField(L0_81, "DHCPv6 Server", L10_91 or "")
  return L0_81
end
function getSystemCurrentChannelOnVAP()
  local L0_95, L1_96, L2_97, L3_98, L4_99
  L0_95 = db
  L0_95 = L0_95.getAttribute
  L1_96 = "dot11VAP"
  L2_97 = "vapEnabled"
  L3_98 = "1"
  L4_99 = "vapName"
  L0_95 = L0_95(L1_96, L2_97, L3_98, L4_99)
  L1_96 = "N/A"
  L2_97 = 1
  L3_98 = ""
  if L0_95 then
    L4_99 = db
    L4_99 = L4_99.getAttribute
    L4_99 = L4_99("dot11Interface", "vapName", L0_95, "interfaceName")
    if io.popen("/pfrm2.0/bin/dot11ChannelGet " .. L4_99) then
      L2_97 = io.popen("/pfrm2.0/bin/dot11ChannelGet " .. L4_99):read("*number")
      io.popen("/pfrm2.0/bin/dot11ChannelGet " .. L4_99):close()
    end
  end
  if L0_95 then
    L4_99 = L2_97 / 1000
    if L2_97 >= 2412 then
      L1_96 = L2_97
      if L2_97 == 2484 then
        L1_96 = 14
      elseif L2_97 < 2484 then
        L1_96 = (L2_97 - 2407) / 5
      elseif L2_97 < 5000 then
        L1_96 = 15 + (L2_97 - 2512) / 20
      else
        L1_96 = (L2_97 - 5000) / 5
      end
    elseif L2_97 ~= nil then
      L1_96 = L2_97
    end
    L1_96 = L1_96 .. " - " .. L4_99 .. "GHz"
  end
  L3_98 = L1_96
  return L3_98
end
function wlanStatusGet()
  local L0_100, L1_101, L2_102, L3_103, L4_104, L5_105, L6_106, L7_107, L8_108, L9_109, L10_110, L11_111, L12_112, L13_113, L14_114, L15_115, L16_116, L17_117, L18_118
  L0_100 = {}
  L1_101 = "N/A"
  L2_102 = {}
  L3_103 = UNIT_NAME
  if L3_103 ~= "DSR-1000AC" then
    L3_103 = db
    L3_103 = L3_103.getRow
    L4_104 = "dot11Card"
    L3_103 = L3_103(L4_104, L5_105, L6_106)
    L4_104 = {}
    if L3_103 ~= nil then
      L4_104 = L5_105
      L4_104["dot11GlobalConfig.country"] = L5_105
      L4_104["dot11GlobalConfig.country"] = L5_105
      L4_104["dot11Radio11n.puren"] = L5_105
    end
    if L3_103 == nil then
      L3_103 = L5_105
    end
    if L4_104 == nil then
      L4_104 = L5_105
    end
    if L6_106 == "b" then
    else
    end
    if L6_106 ~= "ng40-" then
    else
      if L6_106 == "ng" then
        L4_104["dot11Radio.opMode"] = "N/G-Mixed"
    end
    elseif L6_106 == "b and g" then
      L4_104["dot11Radio.opMode"] = "B/G-Mixed"
    elseif L6_106 == "g only" then
      L4_104["dot11Radio.opMode"] = "G Only"
    end
    if L6_106 ~= "na40-" then
    else
      if L6_106 == "na" then
        L4_104["dot11Radio.opMode"] = "N/A-Mixed"
    end
    elseif L6_106 == "a only" then
      L4_104["dot11Radio.opMode"] = "A Only"
    elseif L6_106 ~= "ac40-" then
    elseif L6_106 == "ac80" then
      L4_104["dot11Radio.opMode"] = "A/C/N-Mixed"
    end
    if L6_106 == "1" then
      L4_104["dot11Radio.opMode"] = "N Only"
    end
    if L6_106 == "DSR-500AC" then
      L10_110 = "vapName"
      if L6_106 then
        L10_110 = "vapName"
        L11_111 = L6_106
        L12_112 = "interfaceName"
        if L8_108 ~= nil and L8_108 ~= "" and L8_108 ~= " " then
          L10_110 = _UPVALUE0_
          L10_110 = L10_110.dot11Channelget
          L11_111 = L8_108
          L10_110 = L10_110 .. L11_111
          L11_111 = L9_109
          L10_110 = L9_109.read
          L12_112 = "*number"
          L10_110 = L10_110(L11_111, L12_112)
          L1_101 = L10_110
          if L1_101 ~= nil and L1_101 ~= "" and L1_101 ~= " " then
            L10_110 = getChannelNum
            L11_111 = L1_101
            L10_110 = L10_110(L11_111)
            L1_101 = L10_110
          end
          L11_111 = L9_109
          L10_110 = L9_109.close
          L10_110(L11_111)
        end
      end
    else
      L1_101 = L6_106
    end
    L6_106(L7_107)
    L6_106(L7_107)
    L6_106(L7_107)
  else
    L3_103 = 0
    L4_104 = db
    L4_104 = L4_104.getTable
    L4_104 = L4_104(L5_105)
    for L10_110, L11_111 in L7_107(L8_108) do
      L3_103 = L3_103 + 1
      L12_112 = {}
      L6_106[L3_103] = L12_112
      L12_112 = db
      L12_112 = L12_112.getRow
      L13_113 = "dot11Card"
      L14_114 = "_ROWID_"
      L15_115 = L11_111["dot11Card.cardNo"]
      L12_112 = L12_112(L13_113, L14_114, L15_115)
      if L12_112 ~= nil then
        L13_113 = db
        L13_113 = L13_113.getRow
        L14_114 = "dot11Radio"
        L15_115 = "cardNo"
        L16_116 = L12_112["dot11Card.cardNo"]
        L13_113 = L13_113(L14_114, L15_115, L16_116)
        L13_113 = db
        L13_113 = L13_113.getAttribute
        L14_114 = "dot11GlobalConfig"
        L15_115 = "_ROWID_"
        L16_116 = "1"
        L17_117 = "country"
        L13_113 = L13_113(L14_114, L15_115, L16_116, L17_117)
        L13_113 = L13_113 or ""
        L5_105["dot11GlobalConfig.country"] = L13_113
        L13_113 = db
        L13_113 = L13_113.getAttribute
        L14_114 = "dot11Countries"
        L15_115 = "countrycode"
        L16_116 = L5_105["dot11GlobalConfig.country"]
        L17_117 = "country"
        L13_113 = L13_113(L14_114, L15_115, L16_116, L17_117)
        L13_113 = L13_113 or L5_105["dot11GlobalConfig.country"]
        L5_105["dot11GlobalConfig.country"] = L13_113
        L13_113 = db
        L13_113 = L13_113.getAttribute
        L14_114 = "dot11Radio11n"
        L15_115 = "radioNo"
        L16_116 = L5_105["dot11Radio.radioNo"]
        L17_117 = "puren"
        L13_113 = L13_113(L14_114, L15_115, L16_116, L17_117)
        L13_113 = L13_113 or ""
        L5_105["dot11Radio11n.puren"] = L13_113
      end
      if L12_112 == nil then
        L13_113 = {}
        L12_112 = L13_113
      end
      if L5_105 == nil then
        L13_113 = {}
      end
      L13_113 = ""
      L14_114 = L5_105["dot11Radio.band"]
      if L14_114 == "b" then
        L13_113 = "2.4GHz"
      else
        L14_114 = L5_105["dot11Radio.band"]
        if L14_114 == "a" then
          L13_113 = "5GHz"
        end
      end
      L14_114 = L5_105["dot11Radio.opMode"]
      if L14_114 ~= "ng40-" then
        L14_114 = L5_105["dot11Radio.opMode"]
      else
        if L14_114 == "ng" then
          L5_105["dot11Radio.opMode"] = "N/G-Mixed"
      end
      else
        L14_114 = L5_105["dot11Radio.opMode"]
        if L14_114 == "b and g" then
          L5_105["dot11Radio.opMode"] = "B/G-Mixed"
        else
          L14_114 = L5_105["dot11Radio.opMode"]
          if L14_114 == "g only" then
            L5_105["dot11Radio.opMode"] = "G Only"
          end
        end
      end
      L14_114 = L5_105["dot11Radio.opMode"]
      if L14_114 ~= "na40-" then
        L14_114 = L5_105["dot11Radio.opMode"]
      else
        if L14_114 == "na" then
          L5_105["dot11Radio.opMode"] = "N/A-Mixed"
      end
      else
        L14_114 = L5_105["dot11Radio.opMode"]
        if L14_114 == "a only" then
          L5_105["dot11Radio.opMode"] = "A Only"
        else
          L14_114 = L5_105["dot11Radio.opMode"]
          if L14_114 ~= "ac40-" then
            L14_114 = L5_105["dot11Radio.opMode"]
            if L14_114 ~= "ac" then
              L14_114 = L5_105["dot11Radio.opMode"]
              if L14_114 ~= "ac40+" then
                L14_114 = L5_105["dot11Radio.opMode"]
              end
            end
          elseif L14_114 == "ac80" then
            L5_105["dot11Radio.opMode"] = "A/C/N-Mixed"
          end
        end
      end
      L14_114 = L5_105["dot11Radio11n.puren"]
      if L14_114 == "1" then
        L5_105["dot11Radio.opMode"] = "N Only"
      end
      L14_114 = "vapEnabled ='1' and radioList='"
      L15_115 = L5_105["dot11Radio.radioNo"]
      L16_116 = "'"
      L14_114 = L14_114 .. L15_115 .. L16_116
      L15_115 = db
      L15_115 = L15_115.getAttributeWhere
      L16_116 = "dot11VAP"
      L17_117 = L14_114
      L18_118 = "vapName"
      L15_115 = L15_115(L16_116, L17_117, L18_118)
      L16_116 = UNIT_NAME
      if L16_116 == "DSR-1000AC" and L15_115 == nil then
        L14_114 = "vapEnabled ='1' and radioList='1,2'"
        L16_116 = db
        L16_116 = L16_116.getAttributeWhere
        L17_117 = "dot11VAP"
        L18_118 = L14_114
        L16_116 = L16_116(L17_117, L18_118, "vapName")
        L15_115 = L16_116
      end
      L16_116 = "N/A"
      L17_117 = ""
      if L15_115 ~= nil and L15_115 ~= "" and L15_115 ~= " " then
        L18_118 = "radioNo = '"
        L14_114 = L18_118 .. L5_105["dot11Radio.radioNo"] .. "' and vapName == '" .. L15_115 .. "'"
        L18_118 = db
        L18_118 = L18_118.getAttributeWhere
        L18_118 = L18_118("dot11Interface", L14_114, "interfaceName")
        if L18_118 ~= nil and L18_118 ~= "" and L18_118 ~= " " then
          L16_116 = io.popen(_UPVALUE0_.dot11Channelget .. L18_118):read("*number")
          if L16_116 ~= nil and L16_116 ~= "" and L16_116 ~= " " then
            L16_116 = getChannelNum(L16_116)
          end
          io.popen(_UPVALUE0_.dot11Channelget .. L18_118):close()
        end
      end
      L5_105["dot11Radio.configuredChannel"] = L16_116
      L18_118 = resTab
      L18_118 = L18_118.insertField
      L18_118(L2_102, "Operating Frequency:", L13_113 or "")
      L18_118 = resTab
      L18_118 = L18_118.insertField
      L18_118(L2_102, "Mode:", L5_105["dot11Radio.opMode"] or "")
      L18_118 = resTab
      L18_118 = L18_118.insertField
      L18_118(L2_102, "Channel:", L5_105["dot11Radio.configuredChannel"] or "")
    end
    L7_107(L8_108, L9_109)
  end
  L3_103 = 0
  L4_104 = db
  L4_104 = L4_104.getTable
  L4_104 = L4_104(L5_105)
  for L8_108, L9_109 in L5_105(L6_106) do
    L3_103 = L3_103 + 1
    L10_110 = L4_104[L3_103]
    L11_111 = db
    L11_111 = L11_111.getRow
    L12_112 = "dot11Profile"
    L13_113 = "profileName"
    L14_114 = L10_110["dot11VAP.profileName"]
    L11_111 = L11_111(L12_112, L13_113, L14_114)
    if L11_111 == nil then
      L12_112 = {}
      L11_111 = L12_112
    end
    L12_112 = L11_111["dot11Profile.pairwiseCiphers"]
    L12_112 = L12_112 or ""
    L13_113 = L11_111["dot11Profile.authMethods"]
    L13_113 = L13_113 or ""
    L14_114 = L11_111["dot11Profile.security"]
    if L14_114 == "OPEN" then
      L12_112 = "NONE"
      L13_113 = "NONE"
    else
      L14_114 = L11_111["dot11Profile.security"]
      if L14_114 == "WEP" then
        L14_114 = L11_111["dot11Profile.groupCipher"]
        L12_112 = L14_114 or ""
        L14_114 = L11_111["dot11Profile.wepAuth"]
        L13_113 = L14_114 or ""
      end
    end
    L14_114 = L10_110["dot11VAP.vapEnabled"]
    if L14_114 == "1" then
      L14_114 = resTab
      L14_114 = L14_114.insertField
      L15_115 = L0_100
      L16_116 = "SSID"
      L17_117 = L11_111["dot11Profile.ssid"]
      L17_117 = L17_117 or ""
      L14_114(L15_115, L16_116, L17_117)
      L14_114 = resTab
      L14_114 = L14_114.insertField
      L15_115 = L0_100
      L16_116 = "SECURITY"
      L17_117 = L11_111["dot11Profile.security"]
      L17_117 = L17_117 or ""
      L14_114(L15_115, L16_116, L17_117)
      L14_114 = resTab
      L14_114 = L14_114.insertField
      L15_115 = L0_100
      L16_116 = "ENCRYPTION"
      L17_117 = L12_112 or ""
      L14_114(L15_115, L16_116, L17_117)
      L14_114 = resTab
      L14_114 = L14_114.insertField
      L15_115 = L0_100
      L16_116 = "AUTHENTICATION"
      L17_117 = L13_113 or ""
      L14_114(L15_115, L16_116, L17_117)
    end
  end
  return L0_100
end
function sysStatusGet(A0_119)
  local L1_120, L2_121, L3_122, L4_123
  L1_120 = printLabel
  L2_121 = "System Info"
  L1_120(L2_121)
  L1_120 = _UPVALUE0_
  L1_120 = L1_120()
  resultTab = L1_120
  L1_120 = resTab
  L1_120 = L1_120.print
  L2_121 = resultTab
  L3_122 = 0
  L1_120(L2_121, L3_122)
  L1_120 = db
  L1_120 = L1_120.getAttribute
  L2_121 = "environment"
  L3_122 = "name"
  L4_123 = "NIMFSTATUS_PROGRAM"
  L1_120 = L1_120(L2_121, L3_122, L4_123, "value")
  if L1_120 ~= nil then
    L2_121 = util
    L2_121 = L2_121.appendDebugOut
    L3_122 = "Exec = "
    L4_123 = os
    L4_123 = L4_123.execute
    L4_123 = L4_123(L1_120 .. " " .. DB_FILE_NAME .. " WAN1 2")
    L3_122 = L3_122 .. L4_123
    L2_121(L3_122)
    L2_121 = util
    L2_121 = L2_121.appendDebugOut
    L3_122 = "Exec = "
    L4_123 = os
    L4_123 = L4_123.execute
    L4_123 = L4_123(L1_120 .. " " .. DB_FILE_NAME .. " WAN1 10")
    L3_122 = L3_122 .. L4_123
    L2_121(L3_122)
    L2_121 = util
    L2_121 = L2_121.appendDebugOut
    L3_122 = "Exec = "
    L4_123 = os
    L4_123 = L4_123.execute
    L4_123 = L4_123(L1_120 .. " " .. DB_FILE_NAME .. " WAN2 2")
    L3_122 = L3_122 .. L4_123
    L2_121(L3_122)
    L2_121 = util
    L2_121 = L2_121.appendDebugOut
    L3_122 = "Exec = "
    L4_123 = os
    L4_123 = L4_123.execute
    L4_123 = L4_123(L1_120 .. " " .. DB_FILE_NAME .. " WAN2 10")
    L3_122 = L3_122 .. L4_123
    L2_121(L3_122)
  end
  L2_121 = db
  L2_121 = L2_121.getAttribute
  L3_122 = "networkInfo"
  L4_123 = "_ROWID_"
  L2_121 = L2_121(L3_122, L4_123, "1", "netWorkMode")
  L2_121 = L2_121 or "0"
  if L2_121 == "3" then
    L3_122 = db
    L3_122 = L3_122.getAttribute
    L4_123 = "environment"
    L3_122 = L3_122(L4_123, "name", "IPV6_GW_UPDATE", "value")
    L1_120 = L3_122
    if L1_120 ~= nil then
      L3_122 = util
      L3_122 = L3_122.appendDebugOut
      L4_123 = "Exec = "
      L4_123 = L4_123 .. os.execute(L1_120 .. " " .. DB_FILE_NAME)
      L3_122(L4_123)
    end
  end
  L3_122 = printLabel
  L4_123 = "WAN1 Information"
  L3_122(L4_123)
  L3_122 = statusGet
  L4_123 = "WAN1"
  L3_122 = L3_122(L4_123)
  resultTab = L3_122
  L3_122 = resTab
  L3_122 = L3_122.print
  L4_123 = resultTab
  L3_122(L4_123, 0)
  L3_122 = db
  L3_122 = L3_122.getAttribute
  L4_123 = "unitInfo"
  L3_122 = L3_122(L4_123, "_ROWID_", "1", "modelId")
  L4_123 = nil
  if L3_122 == "DWC-1000" then
    L4_123 = vpnLicenseStatusGet()
  end
  if L3_122 == "DWC-1000" and not L4_123 then
  elseif db.getAttribute("ConfigPort", "_ROWID_", "1", "LogicalIfName") == "WAN2" then
    printLabel("WAN2 Information")
    resultTab = statusGet("WAN2")
    resTab.print(resultTab, 0)
  elseif db.getAttribute("ConfigPort", "_ROWID_", "1", "LogicalIfName") == "DMZ" then
    printLabel("DMZ Information")
    resultTab = statusGet("DMZ")
    resTab.print(resultTab, 0)
  end
  if L3_122 == "DSR-1000N" or L3_122 == "DSR-1000" or L3_122 == "DSR-1000AC" then
    resultTab = wanStatusGetWan3()
    resTab.print(resultTab, 0)
  end
  printLabel("LAN Information")
  resultTab = lanStatusGet()
  resTab.print(resultTab, 0)
  if L3_122 == "DSR-1000N" or L3_122 == "DSR-500N" or L3_122 == "DSR-250N" or L3_122 == "DSR-150N" or L3_122 == "DSR-1000AC" or L3_122 == "DSR-500AC" then
    printLabel("Wireless LAN Information")
    resultTab = wlanStatusGet()
    resTab.print(resultTab, 0)
  end
end
function sysBOOTPGet(A0_124)
  local L1_125, L2_126
  L1_125 = {}
  L2_126 = {}
  row = db.getRow("bootpc", "bootpc._ROWID_", 1)
  if row ~= nil then
    resTab.insertYNField(L1_125, row["bootpc.bootpUpgrade"] == "1", "Enable Bootp upgrade")
    resTab.insertYNField(L1_125, row["bootpc.bootTimeCheck"] == "1", "Disable bootp check at boot time")
    resTab.insertField(L1_125, "Bootp Server", row["bootpc.bootpServer"])
  else
    resTab.insertField(L1_125, "", "BOOTP disabled")
  end
  cmd = db.getAttribute("environment", "name", "BOOTPC_DB_PROGRAM", "value")
  cmd = cmd .. " " .. DB_FILE_NAME .. " " .. "bootpc"
  _UPVALUE0_(L2_126, cmd)
  printLabel("Bootp Configuration")
  resTab.print(L1_125, 0)
  printLabel("Bootp Schedule Configuration")
  resTab.print(L2_126, 0)
end
function sysUsageRepGet(A0_127)
  local L1_128
  L1_128 = {}
  _UPVALUE0_(L1_128, "/pfrm2.0/bin/ifDevUsageRecord " .. DB_FILE_NAME)
  printLabel("Usage Reports Schedule Configurations")
  resTab.print(L1_128, 0)
end
function sysSNMPGet()
  local L0_129, L1_130, L2_131, L3_132, L4_133, L5_134, L6_135, L7_136, L8_137, L9_138, L10_139, L11_140, L12_141
  L0_129 = {}
  L1_130 = {}
  L2_131 = {}
  L3_132 = sysSNMPConfigGet
  L3_132 = L3_132()
  sysCfgTab = L3_132
  L3_132 = sysCfgTab
  if L3_132 ~= nil then
    L3_132 = printLabel
    L4_133 = "SNMP System Configuration"
    L3_132(L4_133)
    L3_132 = resTab
    L3_132 = L3_132.print
    L4_133 = sysCfgTab
    L3_132(L4_133, L5_134)
  end
  L3_132 = agentIP
  if L3_132 == nil then
    L3_132 = db
    L3_132 = L3_132.getTable
    L4_133 = "snmpTrap"
    L3_132 = L3_132(L4_133)
    L4_133 = 0
    for L8_137, L9_138 in L5_134(L6_135) do
      L4_133 = L4_133 + 1
      L10_139 = L3_132[L4_133]
      L11_140 = _UPVALUE0_
      L12_141 = L0_129
      L11_140(L12_141, L10_139)
    end
  else
    L3_132 = db
    L3_132 = L3_132.getRow
    L4_133 = "snmpTrap"
    L3_132 = L3_132(L4_133, L5_134, L6_135)
    L4_133 = _UPVALUE0_
    L4_133(L5_134, L6_135)
  end
  L3_132 = printLabel
  L4_133 = "Trap Agent IP Address"
  L3_132(L4_133)
  L3_132 = resTab
  L3_132 = L3_132.print
  L4_133 = L0_129
  L3_132(L4_133, L5_134)
  L3_132 = db
  L3_132 = L3_132.getTable
  L4_133 = "snmpAccessControl"
  L3_132 = L3_132(L4_133)
  L4_133 = 0
  for L8_137, L9_138 in L5_134(L6_135) do
    L4_133 = L4_133 + 1
    L10_139 = L3_132[L4_133]
    L11_140 = _UPVALUE1_
    L12_141 = L1_130
    L11_140(L12_141, L10_139)
  end
  L5_134(L6_135)
  L5_134(L6_135, L7_136)
  for L10_139, L11_140 in L7_136(L8_137) do
    L12_141 = L5_134[L6_135]
    _UPVALUE2_(L2_131, L12_141)
  end
  L7_136(L8_137)
  L7_136(L8_137, L9_138)
end
function sysCfgInit(A0_142)
  configRow = db.getRow("system", "system._ROWID_", 1)
  return 1, configRow
end
function sysCfgSave(A0_143)
  local L1_144, L2_145, L3_146
  L1_144 = "ERROR"
  L2_145 = ""
  L3_146 = ""
  DBTable = "system"
  L1_144, L2_145 = snmp.system_config(A0_143, 1, "edit")
  if L1_144 == "OK" then
    db.save()
  end
  L3_146 = db.getAttribute("stringsMap", "stringId", L2_145, LANGUAGE) or L2_145
  return L1_144, L3_146
end
function sysCfgVal(A0_147)
  if string.len(A0_147["system.name"]) > 32 then
    printCLIError("System name limit should be less than or equal to 32")
    return false
  end
end
function sysUtilizationInfoGet()
  local L0_148, L1_149
  L0_148 = db
  L0_148 = L0_148.getRow
  L1_149 = "SystemStatistics"
  L0_148 = L0_148(L1_149, "_ROWID_", "1")
  L1_149 = {}
  printLabel("CPU Utilization")
  resTab.insertField(L1_149, "CPU usage by user", L0_148["SystemStatistics.CpuUsedByUser"] .. "%")
  resTab.insertField(L1_149, "CPU usage by kernel", L0_148["SystemStatistics.CpuUsedByKernel"] .. "%")
  resTab.insertField(L1_149, "CPU idle", L0_148["SystemStatistics.CpuIdle"] .. "%")
  resTab.insertField(L1_149, "CPU waiting for IO", L0_148["SystemStatistics.CpuWaitingForIO"] .. "%")
  resTab.insertField(L1_149, "CPU usage", L0_148["SystemStatistics.CpuUsed"] .. "%")
  resTab.print(L1_149, 0)
  L1_149 = {}
  printLabel("Memory Utilization")
  resTab.insertField(L1_149, "Total Memory", L0_148["SystemStatistics.MemoryTotal"] .. " KB")
  resTab.insertField(L1_149, "Used Memory", L0_148["SystemStatistics.MemoryUsed"] .. " KB")
  resTab.insertField(L1_149, "Free Memory", L0_148["SystemStatistics.MemoryFree"] .. " KB")
  resTab.insertField(L1_149, "Cached Memory", L0_148["SystemStatistics.MemoryCached"] .. " KB")
  resTab.insertField(L1_149, "Buffer Memory", L0_148["SystemStatistics.MemoryBuffers"] .. " KB")
  resTab.print(L1_149, 0)
end
function sessionCfgInit(A0_150)
  local L1_151
  L1_151 = {}
  L1_151["SessionSettings.adminTimeout"] = db.getAttribute("sessionsettings", "GroupCapability", "3", "SessionTimeout")
  L1_151["SessionSettings.guestTimeout"] = db.getAttribute("sessionsettings", "GroupCapability", "4", "SessionTimeout")
  return 1, L1_151
end
function sessionCfgSave(A0_152)
  local L1_153, L2_154, L3_155
  L1_153 = "ERROR"
  L2_154 = "1"
  L3_155 = ""
  DBTable = "sessionsettings"
  L1_153, L2_154 = sessionSettingsSet(A0_152)
  if L1_153 == 0 then
    L1_153 = "OK"
  else
    L1_153 = _UPVALUE0_.errorStringGet(L1_153)
  end
  if L1_153 == "OK" then
    db.save()
  end
  L3_155 = L1_153
  return L1_153, L3_155
end
function sessionCfgVal(A0_156)
  if tonumber(A0_156["SessionSettings.adminTimeout"]) > 999 or tonumber(A0_156["SessionSettings.adminTimeout"]) < 0 then
    printCLIError("Admin Session timeout value should be less than or equal to 999 but greater than or equal to 0")
    return false
  end
  if 999 < tonumber(A0_156["SessionSettings.guestTimeout"]) or 0 > tonumber(A0_156["SessionSettings.guestTimeout"]) then
    printCLIError("Guest Session timeout value should be less than or equal to 999 but greater than or equal to 0")
    return false
  end
end
function sysSessionsettingsGet()
  local L0_157
  L0_157 = {}
  print("Displays system session_settings")
  resTab.insertField(L0_157, "Administrator", db.getRow("SessionSettings", "_ROWID_", "3")["SessionSettings.SessionTimeout"] or "")
  resTab.insertField(L0_157, "Guest", db.getRow("SessionSettings", "_ROWID_", "4")["SessionSettings.SessionTimeout"] or "")
  resTab.print(L0_157, 0)
end
