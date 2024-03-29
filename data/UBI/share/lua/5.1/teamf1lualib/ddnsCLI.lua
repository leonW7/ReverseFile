local L0_0
L0_0 = require
L0_0("teamf1lualib/ddns")
L0_0 = require
L0_0("teamf1lualib/services_ddns")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function ddnsUploadKeySet(A0_1, A1_2)
  if os.execute("tftp -gr " .. A0_1 .. " -l /tmp/" .. _UPVALUE0_ .. " " .. A1_2) == 256 then
    printCLIError("TFTP failed ")
  end
end
function printDdnsSetup(A0_3, A1_4, A2_5)
  local L3_6, L4_7, L5_8
  L3_6 = A2_5["ddnsStatus.Status"]
  L3_6 = L3_6 or ""
  L4_7 = _UPVALUE0_
  L5_8 = tonumber
  L5_8 = L5_8(A1_4["ddns.ddnsService"])
  L4_7 = L4_7[L5_8]
  L4_7 = L4_7 or "Disabled"
  if L4_7 == "Disabled" then
    L3_6 = "DDNS is disabled"
  end
  L5_8 = {}
  resTab.insertField(L5_8, "Current WAN Mode:", A0_3 or "")
  resTab.insertField(L5_8, "DDNS Status:", A2_5["ddnsStatus.Status"] or "")
  resTab.insertField(L5_8, "Dynamic DNS Service Type:", _UPVALUE0_[tonumber(A1_4["ddns.ddnsService"])] or "Disabled")
  A1_4["ddns.ddnsService"] = _UPVALUE1_[tonumber(A1_4["ddns.ddnsService"])] or "1"
  if A1_4["ddns.ddnsService"] ~= "1" then
    if A1_4["ddns.ddnsService"] == "11" or A1_4["ddns.ddnsService"] == "13" then
      resTab.insertField(L5_8, "DynDNS Server:", A1_4["ddns.server"] or "")
    end
    if A1_4["ddns.ddnsService"] ~= "13" then
      resTab.insertField(L5_8, "User Name:", A1_4["ddns.username"] or "")
      resTab.insertField(L5_8, "Password:", A1_4["ddns.password"] or "")
    end
    if A1_4["ddns.ddnsService"] ~= "12" then
      resTab.insertField(L5_8, "Host Name:", A1_4["ddns.hostname"] or "")
    else
      resTab.insertField(L5_8, "Oray UserType:", A2_5["ddnsStatus.orayType"] or "")
      resTab.insertField(L5_8, "Oray Domain:", A2_5["ddnsStatus.orayDomain"] or "")
    end
    if A1_4["ddns.ddnsService"] == "13" then
      resTab.insertField(L5_8, "ZoneName:", A1_4["ddns.zonename"] or "")
    end
    if A1_4["ddns.ddnsService"] == "1" then
      resTab.insertField(L5_8, "Type:", _UPVALUE2_[tonumber(A1_4["ddns.ddnsType"])] or "")
    end
    if A1_4["ddns.ddnsService"] == "1" or A1_4["ddns.ddnsService"] == "7" or A1_4["ddns.ddnsService"] == "8" then
      resTab.insertField(L5_8, "Wildcard:", _UPVALUE3_[tonumber(A1_4["ddns.wildflag"])] or "Disabled")
    end
    if A1_4["ddns.ddnsService"] ~= "11" and A1_4["ddns.ddnsService"] ~= "12" then
      resTab.insertField(L5_8, "Use external (NAT router's) IP address:", _UPVALUE3_[tonumber(A1_4["ddns.ipcheck"])] or "Disabled")
      resTab.insertField(L5_8, "Force Update Interval:", A1_4["ddns.timePeriod"] or "")
    end
    if A1_4["ddns.ddnsService"] == "13" then
      resTab.insertField(L5_8, "Key:", _UPVALUE4_[tonumber(A1_4["ddns.key"])] or "Not Uploaded")
    end
    if A1_4["ddns.ddnsService"] == "11" then
      resTab.insertField(L5_8, "URL:", A1_4["ddns.ddnsUrl"] or "")
      if A1_4["ddns.ddnsOptUrl"] == "NOOPTURL" then
        A1_4["ddns.ddnsOptUrl"] = nil
      end
      resTab.insertField(L5_8, "Additional DDNS Options:", A1_4["ddns.ddnsOptUrl"] or "")
    end
  end
  resTab.print(L5_8, 0)
end
function ddnsGet(A0_9)
  local L1_10, L2_11, L3_12, L4_13, L5_14, L6_15, L7_16
  L4_13 = db
  L4_13 = L4_13.getAttribute
  L5_14 = "ddns"
  L6_15 = "_ROWID_"
  L7_16 = 1
  L4_13 = L4_13(L5_14, L6_15, L7_16, "ddnsService")
  L5_14 = db
  L5_14 = L5_14.getAttribute
  L6_15 = "WanMode"
  L7_16 = "_ROWID_"
  L5_14 = L5_14(L6_15, L7_16, "1", "Wanmode")
  L6_15 = db
  L6_15 = L6_15.getAttribute
  L7_16 = "WanMode"
  L6_15 = L6_15(L7_16, "_ROWID_", "1", "DedicatedLogicalIfName")
  L7_16 = db
  L7_16 = L7_16.getAttribute
  L7_16 = L7_16("WanMode", "_ROWID_", "1", "FailoverPriLogicalIfName")
  if L5_14 == "0" then
    L3_12 = "use only single wan port " .. L6_15
  elseif L5_14 == "2" then
    L3_12 = "Auto-Rollover using WAN port " .. L7_16
  elseif L5_14 == "1" then
    L3_12 = "Load balancing Round Robin"
  else
    L3_12 = "Load balancing Spillover Mode"
  end
  if L4_13 == "0" then
    printLabel("Dynamic DNS service Dedicated WAN currently disabled\n")
  else
    printLabel("Dynamic DNS Service Dedicated WAN currently enabled.\n")
  end
  L1_10 = db.getRow("ddns", "_ROWID_", 1)
  L2_11 = db.getRow("ddnsStatus", "_ROWID_", 1)
  printDdnsSetup(L3_12, L1_10, L2_11)
  if UNIT_NAME ~= "DSR-250N" and UNIT_NAME ~= "DSR-250" and UNIT_NAME ~= "DSR-150N" and UNIT_NAME ~= "DSR-150" then
    L4_13 = db.getAttribute("ddns", "_ROWID_", 2, "ddnsService")
    if L4_13 == "0" then
      printLabel("Dynamic DNS service Configurable WAN " .. "currently disabled\n")
    else
      printLabel("Dynamic DNS Service Configurable WAN " .. "currently enabled.\n")
    end
    L1_10 = db.getRow("ddns", "_ROWID_", 2)
    L2_11 = db.getRow("ddnsStatus", "_ROWID_", 2)
    printDdnsSetup(L3_12, L1_10, L2_11)
    if UNIT_NAME ~= "DSR-500N" and UNIT_NAME ~= "DSR-500" and UNIT_NAME ~= "DSR-500AC" then
      L4_13 = db.getAttribute("ddns", "_ROWID_", 3, "ddnsService")
      if L4_13 == "0" then
        printLabel("Dynamic DNS service ThreeG WAN " .. "currently disabled\n")
      else
        printLabel("Dynamic DNS Service ThreeG WAN " .. "currently enabled.\n")
      end
      L1_10 = db.getRow("ddns", "_ROWID_", 3)
      L2_11 = db.getRow("ddnsStatus", "_ROWID_", 3)
      printDdnsSetup(L3_12, L1_10, L2_11)
    end
  end
end
function ddnsConfSet(A0_17, A1_18)
  local L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26, L10_27, L11_28, L12_29, L13_30, L14_31, L15_32
  L2_19 = A1_18
  L3_20 = A0_17["ddns.ddnsService"]
  L4_21 = A0_17["ddns.server"]
  L5_22 = A0_17["ddns.username"]
  L6_23 = A0_17["ddns.password"]
  L7_24 = A0_17["ddns.hostname"]
  L8_25 = A0_17["ddns.zonename"]
  L9_26 = A0_17["ddns.type"]
  L10_27 = A0_17["ddns.wildflag"]
  L11_28 = A0_17["ddns.externalIpCheck"]
  L12_29 = A0_17["ddns.timePeriod"]
  L13_30 = A0_17["ddns.url"]
  L14_31 = A0_17["ddns.additionalDDNS"]
  L15_32 = nil
  if L3_20 == "13" then
    L15_32 = _UPVALUE0_
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.ddnsConfigSet(L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26, L10_27, L11_28, L12_29, L13_30, L14_31, L15_32)
  if returnCode ~= _UPVALUE3_.SUCCESS then
    util.appendDebugOut("Error in configuring values in  dynamicDns")
    _UPVALUE1_.abort()
    return cookie, returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return "OK", "STATUS_OK"
end
function ddnsCfgSave(A0_33)
  local L1_34, L2_35, L3_36
  L1_34 = "ERROR"
  L2_35 = ""
  L3_36 = ""
  DBTable = "ddns"
  L1_34, L2_35 = ddnsConfSet(A0_33, 1)
  if L2_35 == "STATUS_OK" then
    L1_34 = "OK"
  else
    L2_35 = "DDNS_CONFIG_FAILED"
  end
  L3_36 = db.getAttribute("stringsMap", "stringId", L2_35, LANGUAGE)
  return L1_34, L3_36
end
function ddnsCfgInit(A0_37)
  local L1_38, L2_39
  L1_38 = 1
  L2_39 = db
  L2_39 = L2_39.getRow
  L2_39 = L2_39("ddns", "_ROWID_", "rowId")
  if L2_39 == nil then
    return L1_38, {}
  end
  L1_38 = L2_39["ddns._ROWID_"]
  return L1_38, L2_39
end
function ddnsCfgValidateTbl(A0_40)
  if A0_40["ddns.ddnsService"] == nil then
    printCLIError("Invalid DDNS Service")
    return false, A0_40
  end
  if A0_40["ddns.ddnsService"] == "1" then
    A0_40 = {}
    A0_40["ddns.ddnsService"] = "1"
    if util.fileExists("/tmp/" .. _UPVALUE0_) then
      os.execute("rm -f /tmp/" .. _UPVALUE0_)
    end
    return true, A0_40
  end
  if A0_40["ddns.ddnsService"] ~= "13" then
    if A0_40["ddns.username"] == nil then
      printCLIError("Invalid Username")
      return false, A0_40
    end
    if A0_40["ddns.password"] == nil then
      printCLIError("Invalid Password")
      return false, A0_40
    end
  else
    A0_40["ddns.username"] = nil
    A0_40["ddns.password"] = nil
  end
  if A0_40["ddns.ddnsService"] ~= "12" then
    if A0_40["ddns.hostname"] == nil then
      printCLIError("Invalid Hostname")
      return false, A0_40
    end
  else
    A0_40["ddns.hostname"] = nil
  end
  if A0_40["ddns.ddnsService"] == "1" then
    if A0_40["ddns.type"] == nil or A0_40["ddns.type"] == "0" then
      printCLIError("Invalid Type")
      return false, A0_40
    end
  else
    A0_40["ddns.type"] = nil
  end
  if A0_40["ddns.ddnsService"] == "1" or A0_40["ddns.ddnsService"] == "7" or A0_40["ddns.ddnsService"] == "8" then
    if A0_40["ddns.wildflag"] == nil then
      printCLIError("Invalid Wildflag")
      return false, A0_40
    end
  else
    A0_40["ddns.wildflag"] = nil
  end
  if A0_40["ddns.ddnsService"] ~= "11" and A0_40["ddns.ddnsService"] ~= "12" then
    if A0_40["ddns.externalIpCheck"] == nil then
      printCLIError("Invalid External Ip Check")
      return false, A0_40
    end
    if A0_40["ddns.timePeriod"] == nil or A0_40["ddns.timePeriod"] == "0" then
      printCLIError("Invalid TimePeriod")
      return false, A0_40
    end
  else
    A0_40["ddns.externalIpCheck"] = nil
    A0_40["ddns.timePeriod"] = nil
  end
  if A0_40["ddns.ddnsService"] == "11" or A0_40["ddns.ddnsService"] == "13" then
    if A0_40["ddns.server"] == nil then
      printCLIError("Invalid DDNS Server")
      return false, A0_40
    end
  else
    A0_40["ddns.server"] = nil
  end
  if A0_40["ddns.ddnsService"] == "13" then
    if A0_40["ddns.zonename"] == nil then
      printCLIError("Invalid Zonename")
      return false, A0_40
    end
    if not util.fileExists("/tmp/" .. _UPVALUE0_) then
      printCLIError("Please Upload a Key file")
      return false, A0_40
    end
  else
    A0_40["ddns.zonename"] = nil
    if util.fileExists("/tmp/" .. _UPVALUE0_) then
      os.execute("rm -f /tmp/" .. _UPVALUE0_)
    end
  end
  if A0_40["ddns.ddnsService"] == "11" then
    if A0_40["ddns.url"] == nil then
      printCLIError("Invalid Custom URL")
      return false, A0_40
    end
  else
    A0_40["ddns.url"] = nil
    A0_40["ddns.additionalDDNS"] = nil
  end
  return true, A0_40
end
function ddnsCfgInputVal(A0_41)
  local L1_42, L2_43, L3_44, L4_45
  L1_42 = db
  L1_42 = L1_42.getAttribute
  L2_43 = "WanMode"
  L3_44 = "_ROWID_"
  L4_45 = "1"
  L1_42 = L1_42(L2_43, L3_44, L4_45, "Wanmode")
  L2_43 = db
  L2_43 = L2_43.getAttribute
  L3_44 = "WanMode"
  L4_45 = "_ROWID_"
  L2_43 = L2_43(L3_44, L4_45, "1", "DedicatedLogicalIfName")
  L3_44 = db
  L3_44 = L3_44.getAttribute
  L4_45 = "WanMode"
  L3_44 = L3_44(L4_45, "_ROWID_", "1", "FailoverPriLogicalIfName")
  if L1_42 == "0" then
    if L2_43 == "WAN2" then
      L4_45 = printCLIError
      L4_45("Current wan mode is Use only single WAN port Configurable WAN,You can not configure ddns for wan1 now ")
      L4_45 = false
      return L4_45
    elseif L2_43 == "WAN3" then
      L4_45 = printCLIError
      L4_45("Current wan mode is Use only single WAN port Mobile Internet,You can not configure ddns for wan1 now ")
      L4_45 = false
      return L4_45
    end
  elseif L1_42 == "2" then
    if L3_44 == "WAN2" then
      L4_45 = printCLIError
      L4_45("Current wan mode is Auto-Rollover using WAN port Configurable WAN, you cannot configure ddns for wan1 now")
      L4_45 = false
      return L4_45
    elseif L3_44 == "WAN3" then
      L4_45 = printCLIError
      L4_45("Current wan mode is Auto-Rollover using WAN port Mobile Internet, you cannot configure ddns for wan1 now")
      L4_45 = false
      return L4_45
    end
  end
  L4_45 = nil
  L4_45, A0_41 = ddnsCfgValidateTbl(A0_41)
  return L4_45
end
function ddns2CfgSave(A0_46)
  local L1_47, L2_48, L3_49
  L1_47 = "ERROR"
  L2_48 = ""
  L3_49 = ""
  DBTable = "ddns"
  L1_47, L2_48 = ddnsConfSet(A0_46, 2)
  if L2_48 == "STATUS_OK" then
    L1_47 = "OK"
    db.save()
  else
    L2_48 = "DDNS_CONFIG_FAILED"
  end
  L3_49 = db.getAttribute("stringsMap", "stringId", L2_48, LANGUAGE)
  return L1_47, L3_49
end
function ddns2CfgInit(A0_50)
  local L1_51, L2_52
  L1_51 = 2
  L2_52 = db
  L2_52 = L2_52.getRow
  L2_52 = L2_52("ddns", "_ROWID_", "rowId")
  if L2_52 == nil then
    return L1_51, {}
  end
  L1_51 = L2_52["ddns._ROWID_"]
  return L1_51, L2_52
end
function ddns2CfgInputVal(A0_53)
  local L1_54, L2_55, L3_56, L4_57
  L1_54 = db
  L1_54 = L1_54.getAttribute
  L2_55 = "WanMode"
  L3_56 = "_ROWID_"
  L4_57 = "1"
  L1_54 = L1_54(L2_55, L3_56, L4_57, "Wanmode")
  L2_55 = db
  L2_55 = L2_55.getAttribute
  L3_56 = "WanMode"
  L4_57 = "_ROWID_"
  L2_55 = L2_55(L3_56, L4_57, "1", "DedicatedLogicalIfName")
  L3_56 = db
  L3_56 = L3_56.getAttribute
  L4_57 = "WanMode"
  L3_56 = L3_56(L4_57, "_ROWID_", "1", "FailoverPriLogicalIfName")
  if L1_54 == "0" then
    if L2_55 == "WAN1" then
      L4_57 = printCLIError
      L4_57("Current wan mode is Use only single WAN port Dedicated WAN,You can not configure ddns for wan2 now ")
      L4_57 = false
      return L4_57
    elseif L2_55 == "WAN3" then
      L4_57 = printCLIError
      L4_57("Current wan mode is Use only single WAN port Mobile Internet, You can not configure ddns for wan2 now")
      L4_57 = false
      return L4_57
    end
  elseif L1_54 == "2" then
    if L3_56 == "WAN1" then
      L4_57 = printCLIError
      L4_57("Current wan mode is Auto-Rollover using WAN port Dedicated WAN, you cannot configure ddns for wan2 now")
      L4_57 = false
      return L4_57
    elseif L3_56 == "WAN3" then
      L4_57 = printCLIError
      L4_57("Current wan mode is Auto-Rollover using WAN port Mobile Internet, you cannot configure ddns for wan2 now")
      L4_57 = false
      return L4_57
    end
  end
  L4_57 = nil
  L4_57, A0_53 = ddnsCfgValidateTbl(A0_53)
  return L4_57
end
function ddns3CfgSave(A0_58)
  local L1_59, L2_60, L3_61
  L1_59 = "ERROR"
  L2_60 = ""
  L3_61 = ""
  DBTable = "ddns"
  L1_59, L2_60 = ddnsConfSet(A0_58, 3)
  if L2_60 == "STATUS_OK" then
    L1_59 = "OK"
    db.save()
  else
    L2_60 = "DDNS_CONFIG_FAILED"
  end
  L3_61 = db.getAttribute("stringsMap", "stringId", L2_60, LANGUAGE)
  return L1_59, L3_61
end
function ddns3CfgInit(A0_62)
  local L1_63, L2_64
  L1_63 = 3
  L2_64 = db
  L2_64 = L2_64.getRow
  L2_64 = L2_64("ddns", "_ROWID_", "rowId")
  if L2_64 == nil then
    return L1_63, {}
  end
  L1_63 = L2_64["ddns._ROWID_"]
  return L1_63, L2_64
end
function ddns3CfgInputVal(A0_65)
  local L1_66, L2_67, L3_68, L4_69
  L1_66 = db
  L1_66 = L1_66.getAttribute
  L2_67 = "WanMode"
  L3_68 = "_ROWID_"
  L4_69 = "1"
  L1_66 = L1_66(L2_67, L3_68, L4_69, "Wanmode")
  L2_67 = db
  L2_67 = L2_67.getAttribute
  L3_68 = "WanMode"
  L4_69 = "_ROWID_"
  L2_67 = L2_67(L3_68, L4_69, "1", "DedicatedLogicalIfName")
  L3_68 = db
  L3_68 = L3_68.getAttribute
  L4_69 = "WanMode"
  L3_68 = L3_68(L4_69, "_ROWID_", "1", "FailoverPriLogicalIfName")
  if L1_66 == "0" then
    if L2_67 == "WAN1" then
      L4_69 = printCLIError
      L4_69("Current wan mode is Use only single WAN port " .. "Dedicated WAN,You can not configure ddns for " .. "wan3 now ")
      L4_69 = false
      return L4_69
    elseif L2_67 == "WAN2" then
      L4_69 = printCLIError
      L4_69("Current wan mode is Use only single WAN port " .. "Configurable WAN,You can not configure ddns " .. "for wan3 now")
      L4_69 = false
      return L4_69
    end
  elseif L1_66 == "2" then
    if L3_68 == "WAN1" then
      L4_69 = printCLIError
      L4_69("Current wan mode is Auto-Rollover using WAN " .. "port Dedicated WAN, you cannot configure " .. "ddns for wan3 now")
      L4_69 = false
      return L4_69
    elseif L3_68 == "WAN2" then
      L4_69 = printCLIError
      L4_69("Current wan mode is Auto-Rollover using " .. "WAN port Configurable WAN, you cannot " .. "configure ddns for wan3 now")
      L4_69 = false
      return L4_69
    end
  end
  L4_69 = nil
  L4_69, A0_65 = ddnsCfgValidateTbl(A0_65)
  return L4_69
end
