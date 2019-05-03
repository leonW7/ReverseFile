local L0_0
L0_0 = require
L0_0("teamf1lualib/logging")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/bl_logInfo")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/admin_license")
L0_0 = require
L0_0("teamf1lualib/errorMap")
L0_0 = require
L0_0("teamf1lualib/logging_configuration")
L0_0 = require
L0_0("teamf1lualib/threeg_smsEvent")
L0_0 = require
L0_0("teamf1lualib/threeg_createSms")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("validationsLuaLib")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0 = L0_0("com.teamf1.bl.view.logging")
;({}).receiverInfo = "ReceiverInfo"
;({}).wanStatusInfo = "WANStatusInfo"
;({}).vpnStatusInfo = "VPNStatusInfo"
;({}).cpuStatusInfo = "CPUUtilizationInfo"
function syslogCfgInputVal(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10
  L1_2 = A0_1["emailLogs.logId"]
  if L1_2 == nil then
    L1_2 = printCLIError
    L1_2(L2_3)
    L1_2 = false
    return L1_2
  end
  L1_2 = A0_1["emailLogs.mailLogs"]
  if L1_2 == nil then
    L1_2 = A0_1["emailLogs.mailLogs"]
  elseif L1_2 == "1" then
    L1_2 = A0_1.emailLogsEnable
    A0_1["emailLogs.mailLogs"] = L1_2
  end
  A0_1.emailLogsEnable = nil
  L1_2 = A0_1.crontabunit
  if L1_2 ~= nil then
    L1_2 = A0_1.crontabunit
    A0_1["crontab.unit"] = L1_2
  end
  A0_1.crontabunit = nil
  L1_2 = A0_1["emailLogs.mailLogs"]
  if L1_2 == "1" then
    L1_2 = A0_1["smtpServer.emailServer"]
    if L1_2 ~= nil then
      L1_2 = A0_1["smtpServer.emailServer"]
    elseif L1_2 == "" then
      L1_2 = printCLIError
      L1_2(L2_3)
      L1_2 = false
      return L1_2
    end
    L1_2 = string
    L1_2 = L1_2.len
    L1_2 = L1_2(L2_3)
    if L1_2 >= 49 then
      L1_2 = printCLIError
      L1_2(L2_3)
      L1_2 = false
      return L1_2
    end
    L1_2 = A0_1["smtpServer.fromAddr"]
    if L1_2 ~= nil then
      L1_2 = A0_1["smtpServer.fromAddr"]
    elseif L1_2 == "" then
      L1_2 = printCLIError
      L1_2(L2_3)
      L1_2 = false
      return L1_2
    end
    L1_2 = A0_1["smtpServer.toAddr"]
    if L1_2 ~= nil then
      L1_2 = A0_1["smtpServer.toAddr"]
    elseif L1_2 == "" then
      L1_2 = printCLIError
      L1_2(L2_3)
      L1_2 = false
      return L1_2
    end
    L1_2 = A0_1["smtpServer.auth"]
    if L1_2 == nil then
      L1_2 = printCLIError
      L1_2(L2_3)
      L1_2 = false
      return L1_2
    else
      L1_2 = A0_1["smtpServer.auth"]
      if L1_2 ~= "-1" then
        L1_2 = A0_1["smtpServer.userName"]
        if L1_2 ~= nil then
          L1_2 = A0_1["smtpServer.userName"]
        elseif L1_2 == "" then
          L1_2 = printCLIError
          L1_2(L2_3)
          L1_2 = false
          return L1_2
        end
        L1_2 = A0_1["smtpServer.passWord"]
        if L1_2 ~= nil then
          L1_2 = A0_1["smtpServer.passWord"]
        elseif L1_2 == "" then
          L1_2 = printCLIError
          L1_2(L2_3)
          L1_2 = false
          return L1_2
        end
      end
    end
    L1_2 = A0_1["smtpServer.auth"]
    if L1_2 == "-1" then
      L1_2 = A0_1["smtpServer.tlsSupport"]
      if L1_2 ~= "0" then
        L1_2 = printCLIError
        L1_2(L2_3)
        L1_2 = false
        return L1_2
      end
    end
    L1_2 = A0_1["crontab.unit"]
    if L1_2 ~= "2" then
      L1_2 = A0_1["crontab.unit"]
    elseif L1_2 == "3" then
      L1_2 = A0_1["crontab.hour"]
      if L1_2 ~= nil then
        L1_2 = A0_1["crontab.hour"]
      elseif L1_2 == "-1" then
        A0_1["crontab.hour"] = "0"
      end
      L1_2 = A0_1["crontab.meridiem"]
      if L1_2 == nil then
        A0_1["crontab.meridiem"] = "0"
      end
    end
    L1_2 = A0_1["crontab.unit"]
    if L1_2 == "3" then
      L1_2 = A0_1["crontab.dayOfWeek"]
      if L1_2 ~= nil then
        L1_2 = A0_1["crontab.dayOfWeek"]
      elseif L1_2 == "-1" then
        A0_1["crontab.dayOfWeek"] = "0"
      end
    end
  end
  L1_2 = db
  L1_2 = L1_2.getTable
  L1_2 = L1_2(L2_3)
  for L5_6, L6_7 in L2_3(L3_4) do
    L7_8 = "sysLogInfo.Enable"
    L8_9 = L6_7["sysLogInfo.serverId"]
    L7_8 = L7_8 .. L8_9
    L7_8 = A0_1[L7_8]
    if L7_8 ~= nil then
      L7_8 = "sysLogInfo.Enable"
      L8_9 = L6_7["sysLogInfo.serverId"]
      L7_8 = L7_8 .. L8_9
      L7_8 = A0_1[L7_8]
      L6_7["sysLogInfo.Enable"] = L7_8
      L7_8 = L6_7["sysLogInfo.Enable"]
      if L7_8 == "1" then
        L7_8 = "sysLogInfo.serverName"
        L8_9 = L6_7["sysLogInfo.serverId"]
        L7_8 = L7_8 .. L8_9
        L7_8 = A0_1[L7_8]
        if L7_8 ~= "" then
          L7_8 = "sysLogInfo.serverName"
          L8_9 = L6_7["sysLogInfo.serverId"]
          L7_8 = L7_8 .. L8_9
          L7_8 = A0_1[L7_8]
        elseif L7_8 == nil then
          L7_8 = printCLIError
          L8_9 = "Please Gave IP Address or FQDN.\n"
          L7_8(L8_9)
          L7_8 = false
          return L7_8
        end
        L7_8 = "sysLogInfo.serverName"
        L8_9 = L6_7["sysLogInfo.serverId"]
        L7_8 = L7_8 .. L8_9
        L7_8 = A0_1[L7_8]
        L6_7["sysLogInfo.serverName"] = L7_8
        L7_8 = L6_7["sysLogInfo.serverName"]
        L8_9 = _UPVALUE0_
        L8_9 = L8_9.ipAddressCheck
        L9_10 = 2
        L8_9 = L8_9(L9_10, L7_8)
        L9_10 = _UPVALUE1_
        L9_10 = L9_10.SUCCESS
        if L8_9 == L9_10 then
          if L7_8 == "0.0.0.0" then
            L9_10 = printCLIError
            L9_10("Invalid IP Address.Please Configure a valid IP.\n")
            L9_10 = false
            return L9_10
          end
          L9_10 = util
          L9_10 = L9_10.split
          L9_10 = L9_10(L7_8, ".")
          if tonumber(L9_10[1]) == 224 or tonumber(L9_10[1]) > 224 then
            printCLIError("Invalid IP address. Please enter a value between 1 - 223 for octet 1")
            return false
          end
        else
          L9_10 = string
          L9_10 = L9_10.find
          L9_10 = L9_10(L7_8, "%.")
          if L9_10 ~= nil then
            L9_10 = string
            L9_10 = L9_10.find
            L9_10 = L9_10(L7_8, "%.")
          else
            if L9_10 == "" then
              L9_10 = printCLIError
              L9_10("Invalid Domain name. Please enter a valid Domain name")
              L9_10 = false
              return L9_10
          end
          else
            L9_10 = validationsLuaLib
            L9_10 = L9_10.domainNameValidation
            errStr, L9_10 = L7_8, L9_10(L7_8)
            status = L9_10
            L9_10 = tonumber
            L9_10 = L9_10(status)
            if L9_10 ~= 0 then
              L9_10 = printCLIError
              L9_10(errStr)
              L9_10 = false
              return L9_10
            end
            L9_10 = util
            L9_10 = L9_10.split
            L9_10 = L9_10(L7_8, ".")
            L9_10 = L9_10[#L9_10]
            if domainExtCheck(L9_10) ~= "OK" then
              printCLIError("Please enter a valid domain name extension")
              return false
            end
          end
        end
      end
    end
  end
  return L2_3
end
function syslogCfgSave(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20
  L1_12 = "ERROR"
  L2_13 = ""
  L3_14 = ""
  L4_15 = logging
  L4_15 = L4_15.emailLogs_config
  L4_15 = L4_15(L5_16)
  L2_13 = L5_16
  L1_12 = L4_15
  if L1_12 == "OK" then
    L4_15 = db
    L4_15 = L4_15.getTable
    L4_15 = L4_15(L5_16)
    for L8_19, L9_20 in L5_16(L6_17) do
      if A0_11["sysLogInfo.Enable" .. L9_20["sysLogInfo.serverId"]] ~= nil then
        L9_20["sysLogInfo.Enable"] = A0_11["sysLogInfo.Enable" .. L9_20["sysLogInfo.serverId"]]
        if L9_20["sysLogInfo.Enable"] == "1" then
          L9_20["sysLogInfo.serverName"] = A0_11["sysLogInfo.serverName" .. L9_20["sysLogInfo.serverId"]]
          L9_20["sysLogInfo.facilityId"] = A0_11["sysLogInfo.facilityId" .. L9_20["sysLogInfo.serverId"]]
          L9_20["sysLogInfo.severity"] = A0_11["sysLogInfo.severity" .. L9_20["sysLogInfo.serverId"]]
        end
        valid = db.update("sysLogInfo", L9_20, L9_20["sysLogInfo._ROWID_"])
      end
    end
  end
  if L1_12 == "OK" then
    L4_15 = db
    L4_15 = L4_15.save
    L4_15()
  end
  L4_15 = db
  L4_15 = L4_15.getAttribute
  L8_19 = LANGUAGE
  L4_15 = L4_15(L5_16, L6_17, L7_18, L8_19)
  L3_14 = L4_15
  L4_15 = L1_12
  return L4_15, L5_16
end
function syslogCfgInit(A0_21)
  local L1_22, L2_23
  L1_22 = A0_21[1]
  L2_23 = -1
  configRow = logging.emailLogsConfigGet()
  if configRow == nil then
    configRow = {}
  end
  return L2_23, configRow
end
function availFacilityoptGet()
  local L0_24, L1_25
  L0_24 = printLabel
  L1_25 = "Available Facilty Options:"
  L0_24(L1_25)
  L0_24 = 0
  L1_25 = FacilityoptGet
  L1_25 = L1_25()
  for _FORV_5_, _FORV_6_ in pairs(L1_25) do
    L0_24 = L0_24 + 1
    print(L1_25[L0_24])
  end
end
function FacilityoptGet()
  local L0_26, L1_27
  L0_26 = {}
  L1_27 = 1
  L0_26[L1_27] = "Kernel"
  L1_27 = L1_27 + 1
  L0_26[L1_27] = "System"
  if db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-150N" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-250N" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500N" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000N" then
    L1_27 = L1_27 + 1
    L0_26[L1_27] = "Wireless"
  end
  L1_27 = L1_27 + 1
  L0_26[L1_27] = "Network"
  L1_27 = L1_27 + 1
  L0_26[L1_27] = "VPN"
  L1_27 = L1_27 + 1
  L0_26[L1_27] = "Firewall"
  if _UPVALUE0_ then
    L1_27 = L1_27 + 1
    L0_26[L1_27] = "WCF"
  end
  return L0_26 or {}
end
function loggingCfgInputVal(A0_28)
  local L1_29
  L1_29 = true
  return L1_29
end
function loggingCfgSave(A0_30)
  local L1_31, L2_32, L3_33, L4_34
  L1_31 = "ERROR"
  L2_32 = ""
  L3_33 = ""
  L4_34 = _UPVALUE0_
  L4_34 = L4_34.NIL
  A0_30["logConfig.emergency"] = util.joinBitFields(A0_30, "logConfig", "emergency", ".", 4, true)
  A0_30["logConfig.alert"] = util.joinBitFields(A0_30, "logConfig", "alert", ".", 4, true)
  A0_30["logConfig.critical"] = util.joinBitFields(A0_30, "logConfig", "critical", ".", 4, true)
  A0_30["logConfig.error"] = util.joinBitFields(A0_30, "logConfig", "error", ".", 4, true)
  A0_30["logConfig.warning"] = util.joinBitFields(A0_30, "logConfig", "warning", ".", 4, true)
  A0_30["logConfig.notice"] = util.joinBitFields(A0_30, "logConfig", "notice", ".", 4, true)
  A0_30["logConfig.information"] = util.joinBitFields(A0_30, "logConfig", "information", ".", 4, true)
  A0_30["logConfig.debug"] = util.joinBitFields(A0_30, "logConfig", "debug", ".", 4, true)
  L1_31, L2_32 = logging.logConfig_config(A0_30, A0_30["logConfig._ROWID_"], "edit")
  if L1_31 == "OK" then
    db.save()
    L4_34 = _UPVALUE1_.logDaemonStartStopHandler()
    if L4_34 ~= _UPVALUE0_.SUCCESS then
      L2_32 = "12771"
    else
      L2_32 = "12265"
    end
  end
  L3_33 = db.getAttribute("stringsMap", "stringId", L2_32, LANGUAGE)
  return L1_31, L3_33
end
function loggingCfgInit(A0_35)
  local L1_36, L2_37, L3_38, L4_39, L5_40, L6_41, L7_42, L8_43, L9_44, L10_45, L11_46, L12_47, L13_48, L14_49, L15_50, L16_51, L17_52, L18_53, L19_54
  L1_36 = A0_35[1]
  L2_37 = -1
  L3_38 = 0
  L4_39 = _UPVALUE0_
  L5_40 = _UPVALUE1_
  L5_40 = L5_40.wcfLicenseStatusGet
  L5_40 = L5_40()
  L6_41 = db
  L6_41 = L6_41.getAttribute
  L10_45 = "modelId"
  L6_41 = L6_41(L7_42, L8_43, L9_44, L10_45)
  if L6_41 ~= "DSR-1000N" and L6_41 ~= "DSR-500N" and L6_41 ~= "DSR-250N" and L6_41 ~= "DSR-150N" then
    if L5_40 then
      L4_39 = _UPVALUE2_
    else
      L4_39 = _UPVALUE3_
    end
  elseif L5_40 then
    L4_39 = _UPVALUE0_
  else
    L4_39 = _UPVALUE4_
  end
  for L10_45 = 1, #L4_39 do
    L11_46 = L4_39[L10_45]
    if L11_46 == L1_36 then
      L3_38 = 1
      break
    end
    L10_45 = L10_45 + 1
  end
  if L3_38 == 0 then
    L7_42(L8_43)
    L7_42(L8_43)
    for L10_45 = 1, #L4_39 do
      L11_46 = print
      L12_47 = L4_39[L10_45]
      L11_46(L12_47)
      L10_45 = L10_45 + 1
    end
    return
  end
  if L1_36 == "Wireless" then
    L1_36 = "Local0-wireless"
  elseif L1_36 == "Network" then
    L1_36 = "Local2-Networking"
  elseif L1_36 == "VPN" then
    L1_36 = "Local3-VPN"
  elseif L1_36 == "WCF" then
    L1_36 = "Local4-WCF"
  elseif L1_36 == "Firewall" then
    L1_36 = "Local5-Firewall"
  end
  L10_45 = L1_36
  configRow = L7_42
  if L7_42 == nil then
    configRow = L7_42
    return L7_42, L8_43
  end
  L10_45 = configRow
  L10_45 = L10_45["logConfig.critical"]
  L10_45 = util
  L10_45 = L10_45.integerToBits
  L11_46 = configRow
  L11_46 = L11_46["logConfig.error"]
  L10_45 = L10_45(L11_46)
  L11_46 = util
  L11_46 = L11_46.integerToBits
  L12_47 = configRow
  L12_47 = L12_47["logConfig.warning"]
  L11_46 = L11_46(L12_47)
  L12_47 = util
  L12_47 = L12_47.integerToBits
  L13_48 = configRow
  L13_48 = L13_48["logConfig.notice"]
  L12_47 = L12_47(L13_48)
  L13_48 = util
  L13_48 = L13_48.integerToBits
  L14_49 = configRow
  L14_49 = L14_49["logConfig.information"]
  L13_48 = L13_48(L14_49)
  L14_49 = util
  L14_49 = L14_49.integerToBits
  L15_50 = configRow
  L15_50 = L15_50["logConfig.debug"]
  L14_49 = L14_49(L15_50)
  L15_50 = nil
  for L19_54 = 1, 4 do
    L15_50 = "logConfig.emergency" .. L19_54
    configRow[L15_50] = L7_42[L19_54] or 0
    L15_50 = "logConfig.alert" .. L19_54
    configRow[L15_50] = L8_43[L19_54] or 0
    L15_50 = "logConfig.critical" .. L19_54
    configRow[L15_50] = L9_44[L19_54] or 0
    L15_50 = "logConfig.error" .. L19_54
    configRow[L15_50] = L10_45[L19_54] or 0
    L15_50 = "logConfig.warning" .. L19_54
    configRow[L15_50] = L11_46[L19_54] or 0
    L15_50 = "logConfig.notice" .. L19_54
    configRow[L15_50] = L12_47[L19_54] or 0
    L15_50 = "logConfig.information" .. L19_54
    configRow[L15_50] = L13_48[L19_54] or 0
    L15_50 = "logConfig.debug" .. L19_54
    configRow[L15_50] = L14_49[L19_54] or 0
  end
  L2_37 = L16_51["logConfig._ROW_ID_"]
  return L16_51, L17_52
end
function viewLogCfgVal(A0_55)
  if db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") ~= "DSR-1000N" and db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") ~= "DSR-500N" and db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") ~= "DSR-250N" and db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") ~= "DSR-150N" and db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") ~= "DSR-1000AC" and db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") ~= "DSR-500AC" and (tonumber(A0_55["displayLogs.facilityID"]) == 16 or A0_55["displayLogs.category"] == "WIRELESS") then
    print("Wireless is not applicable for this DUT.")
    return "ERROR"
  end
  if _UPVALUE0_.wcfLicenseStatusGet() == false and (tonumber(A0_55["displayLogs.facilityID"]) == 20 or A0_55["displayLogs.category"] == "WCF") then
    print("Please enable WCF license to get the WCF logs.")
    return "ERROR"
  end
  return "OK"
end
function viewLogsInfoGet(A0_56, A1_57, A2_58)
  local L3_59, L4_60, L5_61, L6_62, L7_63, L8_64, L9_65, L10_66, L11_67, L12_68, L13_69, L14_70, L15_71, L16_72, L17_73, L18_74, L19_75, L20_76, L21_77, L22_78
  L3_59 = "n"
  L4_60 = print
  L5_61 = A0_56
  L6_62 = A1_57
  L7_63 = A2_58
  L4_60(L5_61, L6_62, L7_63)
  L4_60 = db
  L4_60 = L4_60.getRow
  L5_61 = "displayLogs"
  L6_62 = "_ROWID_"
  L7_63 = "1"
  L4_60 = L4_60(L5_61, L6_62, L7_63)
  L4_60["displayLogs.facilityID"] = A0_56
  L4_60["displayLogs.category"] = A1_57
  L4_60["displayLogs.logLevel"] = A2_58
  L5_61 = ACCESS_LEVEL
  if L5_61 ~= 0 then
    L5_61 = print
    L6_62 = "Only admin user can filter the logs, others can use the logs."
    L5_61(L6_62)
  else
    L5_61 = viewLogCfgVal
    L6_62 = L4_60
    L5_61 = L5_61(L6_62)
    if L5_61 == "ERROR" then
      L5_61 = false
      return L5_61
    else
      L5_61 = "displayLogs"
      DBTable = L5_61
      L5_61 = db
      L5_61 = L5_61.beginTransaction
      L5_61()
      L5_61 = db
      L5_61 = L5_61.typeAndRangeValidate
      L6_62 = L4_60
      L5_61 = L5_61(L6_62)
      if L5_61 then
        L5_61 = 1
      else
        L5_61 = print
        L6_62 = "Failed to get logs"
        L5_61(L6_62)
        L5_61 = false
        return L5_61
      end
      L5_61 = db
      L5_61 = L5_61.update
      L6_62 = DBTable
      L7_63 = L4_60
      L8_64 = "1"
      L5_61 = L5_61(L6_62, L7_63, L8_64)
      if L5_61 then
        L6_62 = db
        L6_62 = L6_62.commitTransaction
        L6_62()
      else
        L6_62 = db
        L6_62 = L6_62.rollback
        L6_62()
        L6_62 = print
        L7_63 = "Failed to get logs"
        L6_62(L7_63)
        L6_62 = false
        return L6_62
      end
    end
  end
  L5_61 = _UPVALUE0_
  L5_61 = L5_61.logEncInfoGet
  L9_65 = L5_61()
  L10_66 = _UPVALUE1_
  L10_66 = L10_66.SUCCESS
  if L5_61 ~= L10_66 then
    L10_66 = {}
    L9_65 = L10_66
  end
  L10_66 = 1
  L11_67 = 0
  L12_68 = 1
  L13_69 = 20
  L11_67 = #L9_65
  if L13_69 >= L11_67 then
    L13_69 = L11_67
  end
  if L11_67 == 0 then
    L14_70(L15_71)
    return
  end
  L14_70(L15_71)
  L14_70(L15_71)
  for L17_73 = L12_68, L13_69 do
    L18_74 = {}
    L18_74 = L9_65[L17_73]
    L19_75 = L18_74["eventLogging._ROWID_"]
    L20_76 = L18_74["eventLogging.facilityId"]
    if L20_76 == "0" then
      L20_76 = "KERNEL"
    elseif L20_76 == "3" then
      L20_76 = "SYSTEM"
    elseif L20_76 == "16" then
      L20_76 = "WIRELESS"
    elseif L20_76 == "18" then
      L20_76 = "NETWORK"
    elseif L20_76 == "19" then
      L20_76 = "VPN"
    elseif L20_76 == "20" then
      L20_76 = "WCF"
    elseif L20_76 == "21" then
      L20_76 = "FIREWALL"
    end
    L21_77 = L18_74["eventLogging.logLevel"]
    if L21_77 == "1" then
      L21_77 = "Emergency"
    elseif L21_77 == "2" then
      L21_77 = "Alert"
    elseif L21_77 == "4" then
      L21_77 = "Critical"
    elseif L21_77 == "8" then
      L21_77 = "Error"
    elseif L21_77 == "16" then
      L21_77 = "Warning"
    elseif L21_77 == "32" then
      L21_77 = "Notification"
    elseif L21_77 == "64" then
      L21_77 = "Information"
    elseif L21_77 == "128" then
      L21_77 = "Debugging"
    end
    L22_78 = L18_74["eventLogging.textMessage"]
    print(L20_76 .. "    " .. L21_77 .. "    " .. L22_78)
  end
  while L3_59 == "n" do
    L14_70(L15_71)
    L14_70(L15_71)
    L14_70(L15_71)
    L14_70(L15_71)
    L14_70(L15_71)
    L3_59 = L14_70
    if L3_59 == "n" then
      L12_68 = L12_68 + 20
      L13_69 = L13_69 + 20
      if L11_67 <= L13_69 then
        L13_69 = L11_67
      end
      L14_70(L15_71)
      L14_70(L15_71)
      for L17_73 = L12_68, L13_69 do
        L18_74 = {}
        L18_74 = L9_65[L17_73]
        L19_75 = L18_74["eventLogging._ROWID_"]
        L20_76 = L18_74["eventLogging.facilityId"]
        if L20_76 == "3" then
          L20_76 = "SYSTEM"
        elseif L20_76 == "16" then
          L20_76 = "WIRELESS"
        elseif L20_76 == "18" then
          L20_76 = "NETWORK"
        elseif L20_76 == "19" then
          L20_76 = "VPN"
        elseif L20_76 == "20" then
          L20_76 = "WCF"
        elseif L20_76 == "21" then
          L20_76 = "FIREWALL"
        end
        L21_77 = L18_74["eventLogging.logLevel"]
        if L21_77 == "1" then
          L21_77 = "Emergency"
        elseif L21_77 == "2" then
          L21_77 = "Alert"
        elseif L21_77 == "4" then
          L21_77 = "Critical"
        elseif L21_77 == "8" then
          L21_77 = "Error"
        elseif L21_77 == "16" then
          L21_77 = "Warning"
        elseif L21_77 == "32" then
          L21_77 = "Notification"
        elseif L21_77 == "64" then
          L21_77 = "Information"
        elseif L21_77 == "128" then
          L21_77 = "Debugging"
        end
        L22_78 = L18_74["eventLogging.textMessage"]
        print(L20_76 .. "    " .. L21_77 .. "    " .. L22_78)
      end
      if L13_69 == L11_67 then
        L14_70(L15_71)
        return
      end
    elseif L3_59 == "s" then
      if L14_70 ~= 0 then
        L14_70(L15_71)
      else
        L17_73 = L15_71
        L16_72(L17_73)
      end
    elseif L3_59 == "r" then
      if L14_70 ~= 0 then
        L14_70(L15_71)
      elseif L14_70 == L15_71 then
        L15_71(L16_72)
      else
        L15_71(L16_72)
      end
    elseif L3_59 == "e" then
      if L14_70 ~= 0 then
        L14_70(L15_71)
      else
        CURRENT_LOG_FILE = L14_70
        L15_71(L16_72)
        L17_73 = "*l"
        L17_73 = "Enter the tftp server ip address."
        L16_72(L17_73)
        L17_73 = L16_72
        L18_74 = "*l"
        L17_73 = os
        L17_73 = L17_73.execute
        L18_74 = "tftp -p -l "
        L19_75 = CURRENT_LOG_FILE
        L20_76 = " -r "
        L21_77 = L15_71
        L22_78 = " "
        L18_74 = L18_74 .. L19_75 .. L20_76 .. L21_77 .. L22_78 .. L16_72
        L17_73 = L17_73(L18_74)
        if L17_73 == 256 then
          L18_74 = printCLIError
          L19_75 = "TFTP failed "
          L18_74(L19_75)
        end
        L18_74 = os
        L18_74 = L18_74.execute
        L19_75 = "/bin/rm -rf "
        L20_76 = CURRENT_LOG_FILE
        L19_75 = L19_75 .. L20_76
        L18_74(L19_75)
      end
    else
      L14_70(L15_71)
      return
    end
  end
end
function logGetPage()
  local L0_79, L1_80, L2_81, L3_82, L4_83, L5_84, L6_85, L7_86, L8_87, L9_88, L10_89, L11_90
  L0_79 = 0
  L1_80 = "n"
  L2_81, L3_82, L4_83 = nil, nil, nil
  L5_84 = ""
  L6_85 = ""
  L7_86 = ""
  L8_87 = ""
  L9_88 = db
  L9_88 = L9_88.getTable
  L10_89 = "eventLog"
  L9_88 = L9_88(L10_89)
  L2_81 = L9_88
  L9_88 = 1
  L10_89 = 1
  L11_90 = 20
  L0_79 = #L2_81
  if L11_90 >= L0_79 then
    L11_90 = L0_79
  end
  if L0_79 == 0 then
    print("There are No LOG Entries to be shown")
    return
  end
  for _FORV_15_ = L10_89, L11_90 do
    L3_82 = L2_81[_FORV_15_]
    L4_83 = L3_82["eventLog.textMessage"]
    if string.find(L4_83, "\n", -2) then
      L4_83 = string.sub(L4_83, 1, -2)
    end
    print(L4_83)
  end
  while L1_80 == "n" do
    print("Enter 'n' to view next page")
    print("Enter 'r' to to remove all log entries and exit")
    print("Enter 'e' to send all logs to preconfigured e-mail recipients and exit")
    print("Enter any other key to exit")
    L1_80 = io.stdin:read("*l")
    if L1_80 == "n" then
      L10_89 = L10_89 + 20
      L11_90 = L11_90 + 20
      if L0_79 <= L11_90 then
        L11_90 = L0_79
      end
      for _FORV_15_ = L10_89, L11_90 do
        L3_82 = L2_81[_FORV_15_]
        L4_83 = L3_82["eventLog.textMessage"]
        if string.find(L4_83, "\n", -2) then
          L4_83 = string.sub(L4_83, 1, -2)
        end
        print(L4_83)
      end
      if L11_90 == L0_79 then
        print("All LOG Entries have been Showed")
        return
      end
    elseif L1_80 == "r" then
      print("All LOG Entries have been Deleted")
      db.execute("DELETE FROM eventLog")
      return
    elseif L1_80 == "e" then
      L8_87 = db.getAttribute("emailLogs", "_ROWID_", 1, "mailLogs")
      if L8_87 == nil or L8_87 == "" then
        print("Email configuration failed")
        return
      end
      if L8_87 == "1" then
        L6_85 = db.getAttribute("environment", "name", "EMAILLOGS_PROGRAM", "value") .. " " .. DB_FILE_NAME
        if L6_85 == nil or L6_85 == "" then
          print("Email configuration failed")
          return
        end
        L7_86 = os.execute(L6_85)
        if L7_86 == 0 then
          L5_84 = "LOGGING_EMAIL_PASSED"
        else
          L5_84 = "LOGGING_EMAIL_FAILED"
        end
      end
      if L8_87 == "0" or L8_87 == nil then
        L5_84 = "LOGGING_EMAIL_DISABLED"
      end
      statusMessage = db.getAttribute("stringsMap", "stringId", L5_84, LANGUAGE)
      print(statusMessage)
      return
    else
      print("Exiting")
      return
    end
  end
end
function smsEventsCfgInit()
  local L0_91
  L0_91 = db
  L0_91 = L0_91.getRow
  L0_91 = L0_91(_UPVALUE0_, _UPVALUE0_ .. "." .. _UPVALUE1_, _UPVALUE2_)
  return 1, L0_91
end
function smsEventsCfgInputVal(A0_92)
  if (A0_92[_UPVALUE0_ .. "." .. _UPVALUE1_.wanStatusInfo] == "1" or A0_92[_UPVALUE0_ .. "." .. _UPVALUE1_.vpnStatusInfo] == "1" or A0_92[_UPVALUE0_ .. "." .. _UPVALUE1_.cpuStatusInfo] == "1") and (A0_92[_UPVALUE0_ .. "." .. _UPVALUE1_.receiverInfo] == "" or A0_92[_UPVALUE0_ .. "." .. _UPVALUE1_.receiverInfo] == nil) then
    printCLIError("Please enter a valid mobile number number")
    return false
  end
  if (A0_92[_UPVALUE0_ .. "." .. _UPVALUE1_.receiverInfo] ~= "" or A0_92[_UPVALUE0_ .. "." .. _UPVALUE1_.receiverInfo] ~= nil) and (string.len(A0_92[_UPVALUE0_ .. "." .. _UPVALUE1_.receiverInfo]) < 11 or string.len(A0_92[_UPVALUE0_ .. "." .. _UPVALUE1_.receiverInfo]) > 12) then
    printCLIError("The number entered must be of 11 or 12 digits")
    return false
  end
  return true
end
function smsEventsCfgSave(A0_93)
  local L1_94
  _UPVALUE0_.start()
  L1_94 = _UPVALUE1_.smsEventSet(A0_93)
  if L1_94 ~= _UPVALUE2_.SUCCESS then
    _UPVALUE0_.abort()
    return _UPVALUE3_, _UPVALUE4_
  end
  _UPVALUE0_.complete()
  _UPVALUE0_.save()
  return _UPVALUE5_, _UPVALUE6_
end
function smsEventsCfgShow()
  local L0_95, L1_96
  printLabel("SMS Loging Configuration")
  L0_95, L1_96 = _UPVALUE3_.createSmsGet()
  if L1_96 == _UPVALUE4_ then
    printLabel("3G is not available")
  end
  printLabel("Receiver")
  if db.getRow(_UPVALUE0_, _UPVALUE0_ .. "." .. _UPVALUE1_, _UPVALUE2_)[_UPVALUE0_ .. "." .. _UPVALUE5_.receiverInfo] ~= "" or db.getRow(_UPVALUE0_, _UPVALUE0_ .. "." .. _UPVALUE1_, _UPVALUE2_)[_UPVALUE0_ .. "." .. _UPVALUE5_.receiverInfo] ~= nil then
    print("Mobile Number :" .. db.getRow(_UPVALUE0_, _UPVALUE0_ .. "." .. _UPVALUE1_, _UPVALUE2_)[_UPVALUE0_ .. "." .. _UPVALUE5_.receiverInfo])
  else
    print("Mobile number is not configured")
  end
  printLabel("Events")
  if db.getRow(_UPVALUE0_, _UPVALUE0_ .. "." .. _UPVALUE1_, _UPVALUE2_)[_UPVALUE0_ .. "." .. _UPVALUE5_.wanStatusInfo] == "1" then
    print("WAN UP/Down : Enabled")
  else
    print("WAN UP/Down : Disabled")
  end
  if db.getRow(_UPVALUE0_, _UPVALUE0_ .. "." .. _UPVALUE1_, _UPVALUE2_)[_UPVALUE0_ .. "." .. _UPVALUE5_.vpnStatusInfo] == "1" then
    print("VPN connect/disconnect : Enabled")
  else
    print("VPN connect/disconnect : Disabled")
  end
  if db.getRow(_UPVALUE0_, _UPVALUE0_ .. "." .. _UPVALUE1_, _UPVALUE2_)[_UPVALUE0_ .. "." .. _UPVALUE5_.cpuStatusInfo] == "1" then
    print("CPU/Memory usage reaches 80% : Enabled")
  else
    print("CPU/Memory usage reaches 80% : Disabled")
  end
end
function domainExtCheck(A0_97)
  local L1_98, L2_99
  L1_98 = 0
  L2_99 = {
    "com",
    "net",
    "aero",
    "asia",
    "cat",
    "jobs",
    "org",
    "biz",
    "coop",
    "info",
    "museum",
    "name",
    "pro",
    "tel",
    "travel",
    "edu",
    "gov",
    "int",
    "mil",
    "mobi",
    "ac",
    "ad",
    "ae",
    "af",
    "ag",
    "ai",
    "al",
    "am",
    "an",
    "ao",
    "aq",
    "ar",
    "as",
    "at",
    "au",
    "aw",
    "ax",
    "az",
    "ba",
    "bb",
    "bd",
    "be",
    "bf",
    "bg",
    "bh",
    "bi",
    "bj",
    "bm",
    "bn",
    "bo",
    "br",
    "bs",
    "bt",
    "bv",
    "bw",
    "by",
    "bz",
    "ca",
    "cc",
    "cd",
    "cf",
    "cg",
    "ch",
    "ci",
    "ck",
    "cl",
    "cm",
    "cn",
    "co",
    "cr",
    "cu",
    "cv",
    "cx",
    "cy",
    "cz",
    "de",
    "dj",
    "dk",
    "dm",
    "do",
    "dz",
    "ec",
    "ee",
    "eg",
    "er",
    "es",
    "et",
    "eu",
    "fi",
    "fj",
    "fk",
    "fm",
    "fo",
    "fr",
    "ga",
    "gb",
    "gd",
    "ge",
    "gf",
    "gg",
    "gh",
    "gi",
    "gl",
    "gm",
    "gn",
    "gp",
    "gq",
    "gr",
    "gs",
    "gt",
    "gu",
    "gw",
    "gy",
    "hk",
    "hm",
    "hn",
    "hr",
    "ht",
    "hu",
    "id",
    "ie",
    "il",
    "im",
    "in",
    "io",
    "iq",
    "ir",
    "is",
    "it",
    "je",
    "jm",
    "jo",
    "jp",
    "ke",
    "kg",
    "kh",
    "ki",
    "km",
    "kn",
    "kp",
    "kr",
    "kw",
    "ky",
    "kz",
    "la",
    "lb",
    "lc",
    "li",
    "lk",
    "lr",
    "ls",
    "lt",
    "lu",
    "lv",
    "ly",
    "ma",
    "mc",
    "md",
    "me",
    "mg",
    "mh",
    "mk",
    "ml",
    "mm",
    "mn",
    "mo",
    "mp",
    "mq",
    "mr",
    "ms",
    "mt",
    "mu",
    "mv",
    "mw",
    "mx",
    "my",
    "mz",
    "na",
    "nc",
    "ne",
    "nf",
    "ng",
    "ni",
    "nl",
    "no",
    "np",
    "nr",
    "nu",
    "nz",
    "om",
    "pa",
    "pe",
    "pf",
    "pg",
    "ph",
    "pk",
    "pl",
    "pm",
    "pn",
    "pr",
    "ps",
    "pt",
    "pw",
    "py",
    "qa",
    "re",
    "ro",
    "rw",
    "ru",
    "sa",
    "sb",
    "sc",
    "sd",
    "se",
    "sg",
    "sh",
    "si",
    "sj",
    "sk",
    "sl",
    "sm",
    "sn",
    "so",
    "sr",
    "st",
    "sv",
    "sy",
    "sz",
    "tc",
    "td",
    "tf",
    "tg",
    "th",
    "tj",
    "tk",
    "tm",
    "tn",
    "to",
    "tp",
    "tr",
    "tt",
    "tv",
    "tw",
    "tz",
    "ua",
    "ug",
    "uk",
    "um",
    "us",
    "uy",
    "uz",
    "va",
    "vc",
    "ve",
    "vg",
    "vi",
    "vn",
    "vu",
    "ws",
    "wf",
    "ye",
    "yt",
    "yu",
    "za",
    "zm",
    "zw"
  }
  for _FORV_6_, _FORV_7_ in pairs(L2_99) do
    if A0_97 == _FORV_7_ then
      L1_98 = 1
      break
    end
  end
  if L1_98 ~= 1 then
    return "ERROR"
  end
  return "OK"
end
