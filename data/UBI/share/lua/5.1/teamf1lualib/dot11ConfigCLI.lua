local L0_0
L0_0 = require
L0_0("teamf1lualib/dot11View")
L0_0 = require
L0_0("ifDevLib")
L0_0 = require
L0_0("teamf1lualib/wps")
L0_0 = require
L0_0("teamf1lualib/profileConfig_bl")
L0_0 = require
L0_0("teamf1lualib/wps_bl")
L0_0 = require
L0_0("teamf1lualib/errorMap")
L0_0 = require
L0_0 = L0_0("com.teamf1.bl.wireless.profile")
unitTable = "unitInfo"
;({}).region = "regionInfo"
DOT11_ACL_TAB = "dot11ACL"
function WDSEnableFieldValueGet(A0_1)
  local L1_2
  if A0_1 == nil then
    A0_1 = "1"
  end
  L1_2 = db.getAttribute("dot11Radio", "_ROWID_", A0_1, "wdsEnabled")
  return L1_2
end
function dot11APInputVal(A0_3)
  local L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10
  L1_4 = db
  L1_4 = L1_4.getRow
  L2_5 = "dot11Profile"
  L3_6 = "profileName"
  L4_7 = A0_3["dot11VAP.profileName"]
  L1_4 = L1_4(L2_5, L3_6, L4_7)
  L2_5 = util
  L2_5 = L2_5.tableSplit
  L3_6 = A0_3
  L4_7 = "."
  L5_8 = "vapRadio"
  L2_5 = L2_5(L3_6, L4_7, L5_8)
  if L1_4 == nil then
    L3_6 = printCLIError
    L4_7 = "Selected profile does not exist."
    L3_6(L4_7)
    L3_6 = false
    return L3_6
  end
  L3_6 = nil
  L4_7 = db
  L4_7 = L4_7.getAttribute
  L5_8 = "dot11Profile"
  L6_9 = "profileName"
  L7_10 = A0_3["dot11VAP.profileName"]
  L4_7 = L4_7(L5_8, L6_9, L7_10, "radioMode")
  L5_8 = UNIT_NAME
  if L5_8 == "DSR-1000AC" then
    if L4_7 == "a" then
      L5_8 = "1"
      radioNo = L5_8
    elseif L4_7 == "b" then
      L5_8 = "2"
      radioNo = L5_8
    elseif L4_7 == "dual" then
      L5_8 = "1"
      radioNo = L5_8
      L5_8 = "2"
      radioNo1 = L5_8
    end
  else
    L5_8 = UNIT_NAME
    if L5_8 == "DSR-500AC" then
      L5_8 = "1"
      radioNo = L5_8
    end
  end
  L5_8 = nil
  L6_9 = {}
  L7_10 = UNIT_NAME
  if L7_10 == "DSR-1000AC" then
    L7_10 = A0_3["dot11VAP.operation"]
    if L7_10 == "add" then
      L7_10 = "profileName = '"
      L7_10 = L7_10 .. A0_3["dot11VAP.profileName"] .. "'"
      L5_8 = db.getAttributeWhere("dot11Profile", L7_10, "radioMode")
      if L5_8 ~= "dual" and L5_8 ~= nil then
        if L5_8 == "b" then
          L5_8 = 2
        else
          L5_8 = 1
        end
        L7_10 = "radioNo = '" .. L5_8 .. "' and vapName != 'unused'"
        L5_8 = db.getRowsWhere("dot11Interface", L7_10)
        if L5_8 ~= nil and #L5_8 > 4 then
          printCLIError("Only four access points are allowed per radio.")
          return false
        end
      elseif L5_8 == "dual" then
        L7_10 = "radioNo = '1' and vapName != 'unused' "
        L5_8 = db.getRowsWhere("dot11Interface", L7_10)
        if L5_8 ~= nil and #L5_8 > 4 then
          printCLIError("Only four access points are allowed per radio.")
          return false
        end
        L7_10 = "radioNo = '2' and vapName != 'unused'"
        L5_8 = db.getRowsWhere("dot11Interface", L7_10)
        if L5_8 ~= nil and #L5_8 > 4 then
          printCLIError("Only four access points are allowed per radio.")
          return false
        end
      end
    end
  else
    L7_10 = UNIT_NAME
    if L7_10 == "DSR-500AC" then
      L7_10 = A0_3["dot11VAP.operation"]
      if L7_10 == "add" then
        L7_10 = "radioNo = '1' and vapName != 'unused' "
        where = L7_10
        L7_10 = db
        L7_10 = L7_10.getRowsWhere
        L7_10 = L7_10("dot11Interface", where)
        L5_8 = L7_10
        if L5_8 ~= nil then
          L7_10 = #L5_8
          if L7_10 > 4 then
            L7_10 = printCLIError
            L7_10("Only four access points are allowed per radio.")
            L7_10 = false
            return L7_10
          end
        end
      end
    else
      L7_10 = db
      L7_10 = L7_10.getTable
      L7_10 = L7_10("dot11VAP", false)
      L6_9 = L7_10
      if L6_9 ~= nil then
        L7_10 = #L6_9
        if L7_10 > 3 then
          L7_10 = A0_3["dot11VAP.operation"]
          if L7_10 == "add" then
            L7_10 = printCLIError
            L7_10("Only four access points are allowed per radio.")
            L7_10 = false
            return L7_10
          end
        end
      end
    end
  end
  L7_10 = db
  L7_10 = L7_10.tableSize
  L7_10 = L7_10("dot11Radio")
  if L7_10 == 0 then
    L7_10 = printCLIError
    L7_10("No radios configured.")
    L7_10 = false
    return L7_10
  end
  L7_10 = A0_3["crontab.unit"]
  if L7_10 == "1" then
    L7_10 = A0_3["crontab.startHour"]
    if L7_10 ~= "" then
      L7_10 = A0_3["crontab.startHour"]
    elseif L7_10 == nil then
      L7_10 = printCLIError
      L7_10("Enter Valid start hour")
      L7_10 = false
      return L7_10
    end
    L7_10 = A0_3["crontab.scheduleControl"]
    if L7_10 ~= "" then
      L7_10 = A0_3["crontab.scheduleControl"]
    elseif L7_10 == nil then
      L7_10 = printCLIError
      L7_10("Select Schedule Control value")
      L7_10 = false
      return L7_10
    end
    L7_10 = A0_3["crontab.stopHour"]
    if L7_10 ~= "" then
      L7_10 = A0_3["crontab.stopHour"]
    elseif L7_10 == nil then
      L7_10 = printCLIError
      L7_10("Enter Valid stop hour")
      L7_10 = false
      return L7_10
    end
    L7_10 = A0_3["crontab.startMinute"]
    if L7_10 ~= "" then
      L7_10 = A0_3["crontab.startMinute"]
    elseif L7_10 == nil then
      L7_10 = printCLIError
      L7_10("Enter Valid start minute")
      L7_10 = false
      return L7_10
    end
    L7_10 = A0_3["crontab.stopMinute"]
    if L7_10 ~= "" then
      L7_10 = A0_3["crontab.stopMinute"]
    elseif L7_10 == nil then
      L7_10 = printCLIError
      L7_10("Enter Valid stop minute")
      L7_10 = false
      return L7_10
    end
    L7_10 = A0_3["crontab.startMeridian"]
    if L7_10 ~= "" then
      L7_10 = A0_3["crontab.startMeridian"]
    elseif L7_10 == nil then
      L7_10 = printCLIError
      L7_10("Enter Valid start meridian")
      L7_10 = false
      return L7_10
    end
    L7_10 = A0_3["crontab.stopMeridian"]
    if L7_10 ~= "" then
      L7_10 = A0_3["crontab.stopMeridian"]
    elseif L7_10 == nil then
      L7_10 = printCLIError
      L7_10("Enter Valid stop meridian")
      L7_10 = false
      return L7_10
    end
    L7_10 = A0_3["crontab.startMeridian"]
    if L7_10 == "1" then
      L7_10 = A0_3["crontab.stopMeridian"]
      if L7_10 == "0" then
        L7_10 = printCLIError
        L7_10("End time hours cannot extend to next day")
        L7_10 = false
        return L7_10
      end
    end
    L7_10 = A0_3["crontab.startMeridian"]
    if L7_10 == A0_3["crontab.stopMeridian"] then
      L7_10 = tonumber
      L7_10 = L7_10(A0_3["crontab.startHour"])
      if L7_10 > tonumber(A0_3["crontab.stopHour"]) then
        L7_10 = printCLIError
        L7_10("End hour cannot be less then start hour")
        L7_10 = false
        return L7_10
      end
      L7_10 = A0_3["crontab.startHour"]
      if L7_10 == A0_3["crontab.stopHour"] then
        L7_10 = A0_3["crontab.startMinute"]
        if L7_10 > A0_3["crontab.stopMinute"] then
          L7_10 = printCLIError
          L7_10("Please check minutes")
          L7_10 = false
          return L7_10
        end
      end
    end
  end
  L7_10 = A0_3["dot11VAP.maxClients"]
  if L7_10 ~= nil then
    L7_10 = A0_3["dot11VAP.maxClients"]
  elseif L7_10 == "" then
    L7_10 = printCLIError
    L7_10("Invalid maximum associated clients value.")
    L7_10 = false
    return L7_10
  end
  L7_10 = true
  return L7_10
end
function dot11WDSCfgDisable(A0_11)
  local L1_12, L2_13, L3_14, L4_15
  L1_12 = require
  L2_13 = "teamf1lualib/wds"
  L1_12(L2_13)
  L1_12 = {}
  L2_13 = "ERROR"
  L3_14 = "DOT11_WDS_CONFIG_FAILED"
  L4_15 = ""
  configRow = db.getRow("dot11Radio", "radioNo", A0_11[1])
  if configRow == nil then
    printCLIError("Row doesnt exist")
    return "ERROR", "Row doesnt exist"
  else
    os.execute("touch /var/wdsPageAccessed")
    configRow["dot11Radio.wdsEnabled"] = "0"
    DBTable = "dot11Radio"
    L2_13, L3_14 = wds.wdsConfig(configRow, configRow["dot11Radio._ROWID_"], "edit")
    if L2_13 == "OK" then
      db.save()
    else
      os.execute("rm -f /var/wdsPageAccessed")
    end
  end
  L4_15 = db.getAttribute("stringsMap", "stringId", L3_14, LANGUAGE) or L3_14
  return L2_13, L4_15
end
function dot11WDSCfgEnable(A0_16)
  local L1_17, L2_18, L3_19, L4_20, L5_21, L6_22
  L1_17 = require
  L2_18 = "teamf1lualib/wds"
  L1_17(L2_18)
  L1_17 = {}
  L2_18 = {}
  L3_19 = "ERROR"
  L4_20 = "DOT11_WDS_CONFIG_FAILED"
  L5_21 = ""
  L6_22 = "vap0"
  configRow = db.getRow("dot11Radio", "radioNo", A0_16[1])
  if configRow == nil then
    printCLIError("Row doesnt exist")
    return "ERROR", "Row doesnt exist"
  else
    if UNIT_NAME == "DSR-1000AC" then
      if A0_16[1] == "1" then
        L6_22 = "vap0"
      else
        L6_22 = "vap4"
      end
      if db.getAttribute("dot11Interface", "interfaceName", L6_22, "vapName") == "unused" then
        printCLIError("Default profile Radio identity changed. Please " .. " configure at least one profile with matched wds Radio mode.")
        return "ERROR", "Cannot configure WDS"
      end
    end
    os.execute("touch /var/wdsPageAccessed")
    configRow["dot11Radio.wdsEnabled"] = "1"
    DBTable = "dot11Radio"
    L3_19, L4_20 = wds.wdsConfig(configRow, configRow["dot11Radio._ROWID_"], "edit")
    if L3_19 == "OK" then
      db.save()
    else
      os.execute("rm -f /var/wdsPageAccessed")
    end
  end
  L5_21 = db.getAttribute("stringsMap", "stringId", L4_20, LANGUAGE) or L4_20
  return L3_19, L5_21
end
function dot11WDSCfgPeerAdd(A0_23)
  local L1_24, L2_25, L3_26, L4_27
  L1_24 = require
  L2_25 = "teamf1lualib/wds"
  L1_24(L2_25)
  L1_24 = {}
  L2_25 = "ERROR"
  L3_26 = "DOT11_WDS_CONFIG_FAILED"
  L4_27 = ""
  configRow = db.getRow("dot11Radio", "radioNo", A0_23[1])
  if configRow == nil then
    printCLIError("Invalid Radio Number")
    return "ERROR", "Row doesnt exist"
  else
    configRow = db.getRowWhere("dot11WDSPeers", "radioNo='" .. A0_23[1] .. "' and macAddress='" .. A0_23[2] .. "'")
    if configRow ~= nil then
      printCLIError("Peer already exists")
      return "ERROR", "Row already exist"
    end
    DBTable = "dot11WDSPeers"
    configRow = {}
    configRow["dot11WDSPeers.radioNo"] = A0_23[1]
    configRow["dot11WDSPeers.macAddress"] = A0_23[2]
    configRow["dot11WDSPeers.ssid"] = "tf1WdsMagic"
    L2_25, L3_26 = wds.peerConfig(configRow, configRow["dot11Radio._ROWID_"], "add")
    if L2_25 == "OK" then
      db.save()
    end
  end
  L4_27 = db.getAttribute("stringsMap", "stringId", L3_26, LANGUAGE) or L3_26
  return L2_25, L4_27
end
function dot11WDSCfgPeerDelete(A0_28)
  local L1_29, L2_30, L3_31, L4_32
  L1_29 = require
  L2_30 = "teamf1lualib/wds"
  L1_29(L2_30)
  L1_29 = {}
  L2_30 = "ERROR"
  L3_31 = "DOT11_WDS_CONFIG_FAILED"
  L4_32 = ""
  configRow = db.getRow("dot11Radio", "radioNo", A0_28[1])
  if configRow == nil then
    printCLIError("Invalid Radio Number")
    return "ERROR", "Row doesnt exist"
  else
    configRow = db.getRowWhere("dot11WDSPeers", "radioNo='" .. A0_28[1] .. "' and macAddress='" .. A0_28[2] .. "'")
    if configRow == nil then
      printCLIError("Peer does not exist")
      return "ERROR", "Row does not exist"
    end
    DBTable = "dot11WDSPeers"
    L2_30, L3_31 = wds.peerConfig(configRow, configRow["dot11Radio._ROWID_"], "delete")
    if L2_30 == "OK" then
      db.save()
    end
  end
  L4_32 = db.getAttribute("stringsMap", "stringId", L3_31, LANGUAGE) or L3_31
  return L2_30, L4_32
end
function dot11APCfgDel(A0_33)
  local L1_34, L2_35, L3_36, L4_37
  L1_34 = {}
  L2_35 = "ERROR"
  L3_36 = "DOT11_AP_CONFIG_FAILED"
  L4_37 = ""
  if UNIT_NAME == "DSR-1000AC" then
    if A0_33[1] == "ap1" or A0_33[1] == "ap5" then
      printCLIError("Default Access Point cannot be deleted.")
      return "ERROR", "Default Access Point cannot be deleted."
    end
  elseif A0_33[1] == "ap1" then
    printCLIError("Default Access Point cannot be deleted.")
    return "ERROR", "Default Access Point cannot be deleted."
  end
  configRow = db.getRow("dot11VAP", "vapName", A0_33[1])
  if configRow == nil then
    printCLIError("Row doesnt exist")
    return "ERROR", "Row doesnt exist"
  else
    table.insert(L1_34, configRow["dot11VAP._ROWID_"])
    L2_35, L3_36 = dot11.VAP_delete(L1_34)
    if L2_35 == "OK" then
      db.save()
    end
  end
  L4_37 = db.getAttribute("stringsMap", "stringId", L3_36, LANGUAGE)
  return L2_35, L4_37
end
function dot11APCfgDisable(A0_38)
  local L1_39, L2_40, L3_41, L4_42
  L1_39 = {}
  L2_40 = "ERROR"
  L3_41 = ""
  L4_42 = ""
  configRow = db.getRow("dot11VAP", "vapName", A0_38[1])
  if configRow == nil then
    printCLIError("Row doesnt exist")
    return "ERROR", "Row doesnt exist"
  else
    table.insert(L1_39, configRow["dot11VAP._ROWID_"])
    L2_40, L3_41 = dot11.VAP_enable(L1_39, false)
  end
  if L2_40 == "OK" then
    db.save()
  end
  L4_42 = db.getAttribute("stringsMap", "stringId", L3_41, LANGUAGE)
  return L2_40, L4_42
end
function dot11APCfgEnable(A0_43)
  local L1_44, L2_45, L3_46, L4_47
  L1_44 = {}
  L2_45 = "ERROR"
  L3_46 = ""
  L4_47 = ""
  configRow = db.getRow("dot11VAP", "vapName", A0_43[1])
  if configRow == nil then
    printCLIError("Row doesnt exist")
    return "ERROR", "Row doesnt exist"
  else
    table.insert(L1_44, configRow["dot11VAP._ROWID_"])
    L2_45, L3_46 = dot11.VAP_enable(L1_44, true)
    if L2_45 == "OK" then
      db.save()
    end
  end
  L4_47 = db.getAttribute("stringsMap", "stringId", L3_46, LANGUAGE)
  return L2_45, L4_47
end
function dot11APCfgSave(A0_48)
  local L1_49, L2_50, L3_51
  L1_49 = "ERROR"
  L2_50 = ""
  L3_51 = ""
  if A0_48["crontab.unit"] == "1" then
    A0_48["crontab.unit"] = "2"
  end
  if A0_48["crontab.scheduleControl"] == "1" then
    A0_48["crontab.scheduleControl"] = "0"
  else
    A0_48["crontab.scheduleControl"] = "1"
  end
  if A0_48["dot11VAP._ROWID_"] == nil then
    radioNo = "1"
    A0_48["dot11VAP.radioList"] = "1"
    A0_48["dot11VAP.beaconInterval"] = db.getRow("dot11Radio", "radioNo", radioNo)["dot11Radio.beaconInterval"]
    A0_48["dot11VAP.dtimInterval"] = db.getRow("dot11Radio", "radioNo", radioNo)["dot11Radio.dtimInterval"]
    A0_48["dot11VAP.rtsThreshold"] = db.getRow("dot11Radio", "radioNo", radioNo)["dot11Radio.rtsThreshold"]
    A0_48["dot11VAP.fragThreshold"] = db.getRow("dot11Radio", "radioNo", radioNo)["dot11Radio.fragThreshold"]
    A0_48["dot11VAP.preambleMode"] = db.getRow("dot11Radio", "radioNo", radioNo)["dot11Radio.preambleMode"]
    A0_48["dot11VAP.rtsCtsProtect"] = db.getRow("dot11Radio", "radioNo", radioNo)["dot11Radio.rtsCtsProtect"]
    A0_48["dot11VAP.uapsd"] = db.getRow("dot11Radio", "radioNo", radioNo)["dot11Radio.uapsd"]
    A0_48["dot11VAP.txPower"] = db.getRow("dot11Radio", "radioNo", radioNo)["dot11Radio.txPower"]
    A0_48["dot11VAP.shortRetry"] = db.getRow("dot11Radio", "radioNo", radioNo)["dot11Radio.shortRetry"]
    A0_48["dot11VAP.longRetry"] = db.getRow("dot11Radio", "radioNo", radioNo)["dot11Radio.longRetry"]
    if A0_48["dot11VAP.apIsolation"] == nil or A0_48["dot11VAP.apIsolation"] == "" then
      A0_48["dot11VAP.apIsolation"] = "0"
    end
    A0_48["dot11VAP.vapName"] = A0_48["dot11VAP.vapName"]
    L1_49, L2_50 = dot11.VAP_config(A0_48, "-1", "add")
  else
    A0_48["dot11Radio.radioNo"] = radioNo
    L1_49, L2_50 = dot11.VAP_config(A0_48, A0_48["dot11VAP._ROWID_"], "edit")
  end
  if L1_49 == "OK" then
    db.save()
  end
  L3_51 = db.getAttribute("stringsMap", "stringId", L2_50, LANGUAGE)
  return L1_49, L3_51
end
function dot11APCfgInit(A0_52)
  local L1_53, L2_54, L3_55, L4_56, L5_57, L6_58, L7_59, L8_60, L9_61, L10_62, L11_63, L12_64, L13_65, L14_66
  L1_53 = A0_52[1]
  L2_54 = {}
  L3_55 = {}
  L4_56 = A0_52[2]
  L5_57 = db
  L5_57 = L5_57.getRow
  L5_57 = L5_57(L6_58, L7_59, L8_60)
  if L4_56 == "add" then
    if L5_57 == nil then
      L5_57 = L6_58
      L5_57["dot11VAP.vapName"] = L1_53
      L5_57["dot11VAP.operation"] = "add"
    end
  elseif L4_56 == "edit" and L5_57 ~= nil then
    L9_61 = L5_57["dot11VAP._ROWID_"]
    L5_57 = L6_58
    L9_61 = false
    L2_54 = L6_58
    for L9_61, L10_62 in L6_58(L7_59) do
      for L14_66, _FORV_15_ in L11_63(L12_64) do
        i = string.find(L10_62["crontab.command"], L1_53)
        if i ~= nil then
          L5_57["crontab.unit"] = "1"
          j = string.find(L10_62["crontab.command"], "stopStartVapInstance.sh")
          if j ~= nil then
            active_time = util.split(L10_62["crontab.command"], " ")
            L14_66 = active_time[2]
            if tonumber(L14_66) ~= 0 then
              if tonumber(L10_62["crontab.hour"]) > 12 then
                L5_57["crontab.startMeridian"] = "1"
                L5_57["crontab.startHour"] = L10_62["crontab.hour"] - 12
                L5_57["crontab.startMinute"] = L10_62["crontab.minute"]
              else
                L5_57["crontab.startMeridian"] = "0"
                L5_57["crontab.startMinute"] = L10_62["crontab.minute"]
                L5_57["crontab.startHour"] = L10_62["crontab.hour"]
              end
            elseif tonumber(L10_62["crontab.hour"]) > 12 then
              L5_57["crontab.stopMeridian"] = "1"
              L5_57["crontab.stopHour"] = L10_62["crontab.hour"] - 12
              L5_57["crontab.stopMinute"] = L10_62["crontab.minute"]
            else
              L5_57["crontab.stopMeridian"] = "0"
              L5_57["crontab.stopMinute"] = L10_62["crontab.minute"]
              L5_57["crontab.stopHour"] = L10_62["crontab.hour"]
            end
          end
        end
      end
    end
    L5_57["dot11VAP.operation"] = "edit"
  elseif L5_57 == nil then
    L6_58(L7_59)
    return L6_58, L7_59
  end
  return L6_58, L7_59
end
function dot11PfrInputVal(A0_67)
  local L1_68, L2_69, L3_70, L4_71, L5_72, L6_73, L7_74
  L1_68 = false
  L2_69 = A0_67["dot11Profile.profileName"]
  if L2_69 == nil then
    L2_69 = printCLIError
    L3_70 = "Invalid profile name."
    L2_69(L3_70)
    return L1_68
  end
  L2_69 = A0_67["dot11Profile.ssid"]
  if L2_69 == nil then
    L2_69 = printCLIError
    L3_70 = "Invalid SSID for the access point."
    L2_69(L3_70)
    return L1_68
  else
    L2_69 = A0_67["dot11Profile.operation"]
    if L2_69 == "add" then
      L2_69 = db
      L2_69 = L2_69.getTable
      L3_70 = "dot11Profile"
      L4_71 = false
      L2_69 = L2_69(L3_70, L4_71)
      L3_70 = UNIT_NAME
      if L3_70 == "DSR-1000AC" then
        L3_70 = #L2_69
        if L3_70 > 15 then
          L3_70 = printCLIError
          L4_71 = "Max 16 Profile's are allowed to configure."
          L3_70(L4_71)
          return L1_68
        end
      else
        L3_70 = #L2_69
        if L3_70 > 7 then
          L3_70 = printCLIError
          L4_71 = "Max 8 Profile's are allowed to configure."
          L3_70(L4_71)
          return L1_68
        end
      end
      L3_70 = db
      L3_70 = L3_70.getAttribute
      L4_71 = "dot11Profile"
      L5_72 = "ssid"
      L6_73 = A0_67["dot11Profile.ssid"]
      L7_74 = "profileName"
      L3_70 = L3_70(L4_71, L5_72, L6_73, L7_74)
      if L3_70 ~= nil then
        L4_71 = printCLIError
        L5_72 = "Configured SSID already exists."
        L4_71(L5_72)
        return L1_68
      end
    end
  end
  L2_69 = nil
  L3_70 = db
  L3_70 = L3_70.getAttribute
  L4_71 = "dot11VAP"
  L5_72 = "profileName"
  L6_73 = A0_67["dot11Profile.profileName"]
  L7_74 = "vapName"
  L3_70 = L3_70(L4_71, L5_72, L6_73, L7_74)
  if L3_70 ~= nil then
    L4_71 = db
    L4_71 = L4_71.getAttribute
    L5_72 = "dot11Interface"
    L6_73 = "vapName"
    L7_74 = L3_70
    L4_71 = L4_71(L5_72, L6_73, L7_74, "radioNo")
    L2_69 = L4_71
    L4_71 = db
    L4_71 = L4_71.getAttribute
    L5_72 = "dot11Radio"
    L6_73 = "radioNo"
    L7_74 = L2_69
    L4_71 = L4_71(L5_72, L6_73, L7_74, "opMode")
    L5_72 = db
    L5_72 = L5_72.getAttribute
    L6_73 = "dot11Radio11n"
    L7_74 = "radioNo"
    L5_72 = L5_72(L6_73, L7_74, L2_69, "puren")
    L6_73 = db
    L6_73 = L6_73.getAttribute
    L7_74 = "dot11Radio11n"
    L6_73 = L6_73(L7_74, "radioNo", L2_69, "pure11ac")
    L7_74 = ""
    if L5_72 == "1" or L6_73 == "1" then
      L7_74 = "N/AC mode"
    else
      L7_74 = "G/N-Mixed"
    end
    if A0_67["dot11Profile.security"] == "WEP" and (L4_71 == "ng40-" or L4_71 == "ng40+" or L4_71 == "ng" or L4_71 == "na40-" or L4_71 == "na40+" or L4_71 == "na" or L4_71 == "ac" or L4_71 == "ac40+" or L4_71 == "ac40-" or L4_71 == "ac80") then
      printCLIError(" WEP not supported in " .. L7_74 .. ". Please change the radio setting to configure the AP in WEP security mode")
      return L1_68
    end
    if A0_67["dot11Profile.security"] == "WPA" and A0_67["dot11Profile.pairwiseCiphers"] == "TKIP" and (L4_71 == "ng40-" or L4_71 == "ng40+" or L4_71 == "ng" or L4_71 == "na40-" or L4_71 == "na40+" or L4_71 == "na" or L4_71 == "ac" or L4_71 == "ac40+" or L4_71 == "ac40-" or L4_71 == "ac80") then
      printCLIError("WPA/TKIP encryption not supported in " .. L7_74 .. ". Please change the radio setting to configure the AP in WPA/TKIP security mode")
      return L1_68
    end
  end
  L4_71 = A0_67["dot11Profile.security"]
  if L4_71 == "WEP" then
    L4_71 = A0_67["dot11Profile.groupCipher"]
    if L4_71 == nil then
      L4_71 = printCLIError
      L5_72 = "Invalid WEP Encryption."
      L4_71(L5_72)
      return L1_68
    end
  end
  L4_71 = A0_67["dot11Profile.security"]
  if L4_71 == "WPA" then
    L4_71 = A0_67["dot11Profile.pairwiseCiphers"]
    if L4_71 == "CCMP" then
      L4_71 = printCLIError
      L5_72 = "Invalid encryption type for the selected security type"
      L4_71(L5_72)
      L4_71 = false
      return L4_71
    end
  end
  L4_71 = A0_67["dot11Profile.security"]
  if L4_71 == "WPA2" then
    L4_71 = A0_67["dot11Profile.pairwiseCiphers"]
    if L4_71 ~= "CCMP" then
      L4_71 = printCLIError
      L5_72 = "Invalid encryption type for the selected security type"
      L4_71(L5_72)
      L4_71 = false
      return L4_71
    end
  end
  L4_71 = A0_67["dot11Profile.security"]
  if L4_71 == "WPA+WPA2" then
    L4_71 = A0_67["dot11Profile.pairwiseCiphers"]
    if L4_71 ~= "TKIP+CCMP" then
      L4_71 = printCLIError
      L5_72 = "Invalid encryption type for the selected security type"
      L4_71(L5_72)
      L4_71 = false
      return L4_71
    end
  end
  L4_71 = A0_67["dot11Profile.security"]
  if L4_71 ~= "WPA" then
    L4_71 = A0_67["dot11Profile.security"]
    if L4_71 ~= "WPA2" then
      L4_71 = A0_67["dot11Profile.security"]
    end
  elseif L4_71 == "WPA+WPA2" then
    L4_71 = A0_67["dot11Profile.authMethods"]
    if L4_71 == nil then
      L4_71 = printCLIError
      L5_72 = "WPA authentication type not specified."
      L4_71(L5_72)
      return L1_68
    end
    L4_71 = A0_67["dot11Profile.pairwiseCiphers"]
    if L4_71 == nil then
      L4_71 = printCLIError
      L5_72 = "WPA encryption type not specified."
      L4_71(L5_72)
      return L1_68
    end
  end
  L4_71 = A0_67["dot11Profile.security"]
  if L4_71 ~= "WPA" then
    L4_71 = A0_67["dot11Profile.security"]
    if L4_71 ~= "WPA2" then
      L4_71 = A0_67["dot11Profile.security"]
    end
  elseif L4_71 == "WPA+WPA2" then
    L4_71 = A0_67["dot11Profile.authMethods"]
    if L4_71 ~= "PSK" then
      L4_71 = A0_67["dot11Profile.authMethods"]
    elseif L4_71 == "PSK+RADIUS" then
      L4_71 = A0_67["dot11Profile.pskPassAscii"]
      if L4_71 ~= nil then
        L4_71 = A0_67["dot11Profile.pskPassAscii"]
      elseif L4_71 == "" then
        L4_71 = printCLIError
        L5_72 = "WPA password not specified."
        L4_71(L5_72)
        return L1_68
      end
    end
  end
  L4_71 = A0_67["dot11Profile.security"]
  if L4_71 ~= "WPA" then
    L4_71 = A0_67["dot11Profile.security"]
    if L4_71 ~= "WPA2" then
      L4_71 = A0_67["dot11Profile.security"]
    end
  elseif L4_71 == "WPA+WPA2" then
    L4_71 = A0_67["dot11Profile.pskPassAscii"]
    if L4_71 ~= nil then
      L4_71 = A0_67["dot11Profile.authMethods"]
      if L4_71 ~= "PSK" then
        L4_71 = A0_67["dot11Profile.authMethods"]
      elseif L4_71 == "PSK+RADIUS" then
        L4_71 = string
        L4_71 = L4_71.len
        L5_72 = A0_67["dot11Profile.pskPassAscii"]
        L4_71 = L4_71(L5_72)
        if not (L4_71 < 8) then
          L4_71 = string
          L4_71 = L4_71.len
          L5_72 = A0_67["dot11Profile.pskPassAscii"]
          L4_71 = L4_71(L5_72)
        elseif L4_71 > 63 then
          L4_71 = printCLIError
          L5_72 = "WPA password length should be between 8 to 63 characters."
          L4_71(L5_72)
          return L1_68
        end
        L4_71 = A0_67["dot11Profile.mfpEnabled"]
        if L4_71 == nil then
          L4_71 = printCLIError
          L5_72 = "Enter Protect Management Value."
          L4_71(L5_72)
          return L1_68
        else
          L4_71 = A0_67["dot11Profile.forcePMF"]
          if L4_71 == "1" then
            L4_71 = printCLIError
            L5_72 = "Enter forcePMF Value."
            L4_71(L5_72)
            return L1_68
          end
        end
      end
    end
  end
  L4_71 = A0_67["dot11Profile.authMethods"]
  if L4_71 == "RADIUS" then
    L4_71 = A0_67["dot11Profile.pskPassAscii"]
    if L4_71 == nil then
    end
  end
  L4_71 = A0_67["dot11Profile.security"]
  if L4_71 == "WEP" then
    L4_71 = A0_67["dot11Profile.defWepkeyIdx"]
    if L4_71 == nil then
      L4_71 = printCLIError
      L5_72 = "Invalid WEP key index type."
      L4_71(L5_72)
      return L1_68
    end
    L4_71 = A0_67["dot11Profile.wepAuth"]
    if L4_71 == nil then
      L4_71 = printCLIError
      L5_72 = "Invalid WEP authentication type."
      L4_71(L5_72)
      return L1_68
    end
    L4_71 = A0_67["dot11Profile.pskPassHex"]
    if L4_71 ~= nil then
      L4_71 = string
      L4_71 = L4_71.len
      L5_72 = A0_67["dot11Profile.pskPassHex"]
      L4_71 = L4_71(L5_72)
      if L4_71 > 32 then
        L4_71 = printCLIError
        L5_72 = "WEP passphrase length should be less than 32 characters."
        L4_71(L5_72)
        return L1_68
      end
    end
    L4_71 = A0_67["dot11Profile.groupCipher"]
    if L4_71 ~= "64" then
      L4_71 = A0_67["dot11Profile.groupCipher"]
      if L4_71 ~= "128" then
        L4_71 = printCLIError
        L5_72 = "Invalid WEP encryption type."
        L4_71(L5_72)
        return L1_68
      end
    end
    L4_71 = A0_67["dot11Profile.wepkey0"]
    if L4_71 == nil then
      L4_71 = A0_67["dot11Profile.wepkey1"]
      if L4_71 == nil then
        L4_71 = A0_67["dot11Profile.wepkey2"]
        if L4_71 == nil then
          L4_71 = A0_67["dot11Profile.wepkey3"]
          if L4_71 == nil then
            L4_71 = printCLIError
            L5_72 = "Invalid WEP key type."
            L4_71(L5_72)
            return L1_68
          end
        end
      end
    end
    L4_71 = A0_67["dot11Profile.groupCipher"]
    L5_72 = L4_71 - 24
    L5_72 = L5_72 / 4
    L6_73 = L5_72 / 2
    L7_74 = A0_67["dot11Profile.wepkey0"]
    if L7_74 then
      L7_74 = A0_67["dot11Profile.wepkey0"]
      if L7_74 ~= "" then
        L7_74 = string
        L7_74 = L7_74.len
        L7_74 = L7_74(A0_67["dot11Profile.wepkey0"])
        if L7_74 ~= L6_73 then
          L7_74 = string
          L7_74 = L7_74.len
          L7_74 = L7_74(A0_67["dot11Profile.wepkey0"])
          if L7_74 ~= L5_72 then
            L7_74 = printCLIError
            L7_74("Failed to configure WEP key as the length is invalid")
            return L1_68
          end
        end
        L7_74 = dot11VAP
        L7_74 = L7_74.hasTypeValidate
        L7_74 = L7_74(A0_67["dot11Profile.wepkey0"], "%X")
        if L7_74 == 1 then
          L7_74 = string
          L7_74 = L7_74.len
          L7_74 = L7_74(A0_67["dot11Profile.wepkey0"])
          if L7_74 ~= L6_73 then
            L7_74 = printCLIError
            L7_74("ASCII key should contain 5(64 Bit) or 13(128 Bit) characters")
            return L1_68
          end
        else
          L7_74 = string
          L7_74 = L7_74.len
          L7_74 = L7_74(A0_67["dot11Profile.wepkey0"])
          if L7_74 ~= L6_73 then
            L7_74 = string
            L7_74 = L7_74.len
            L7_74 = L7_74(A0_67["dot11Profile.wepkey0"])
            if L7_74 ~= L5_72 then
              L7_74 = printCLIError
              L7_74("Failed to configure WEP key as the length is invalid")
              return L1_68
            end
          end
        end
      end
    end
    L7_74 = A0_67["dot11Profile.wepkey1"]
    if L7_74 then
      L7_74 = A0_67["dot11Profile.wepkey1"]
      if L7_74 ~= "" then
        L7_74 = string
        L7_74 = L7_74.len
        L7_74 = L7_74(A0_67["dot11Profile.wepkey1"])
        if L7_74 ~= L6_73 then
          L7_74 = string
          L7_74 = L7_74.len
          L7_74 = L7_74(A0_67["dot11Profile.wepkey1"])
          if L7_74 ~= L5_72 then
            L7_74 = printCLIError
            L7_74("Failed to configure WEP key as the length is invalid")
            return L1_68
          end
        end
        L7_74 = dot11VAP
        L7_74 = L7_74.hasTypeValidate
        L7_74 = L7_74(A0_67["dot11Profile.wepkey1"], "%X")
        if L7_74 == 1 then
          L7_74 = string
          L7_74 = L7_74.len
          L7_74 = L7_74(A0_67["dot11Profile.wepkey1"])
          if L7_74 ~= L6_73 then
            L7_74 = printCLIError
            L7_74("ASCII key should contain 5(64 Bit) or 13(128 Bit) characters")
            return L1_68
          end
        else
          L7_74 = string
          L7_74 = L7_74.len
          L7_74 = L7_74(A0_67["dot11Profile.wepkey1"])
          if L7_74 ~= L6_73 then
            L7_74 = string
            L7_74 = L7_74.len
            L7_74 = L7_74(A0_67["dot11Profile.wepkey1"])
            if L7_74 ~= L5_72 then
              L7_74 = printCLIError
              L7_74("Failed to configure WEP key as the length is invalid")
              return L1_68
            end
          end
        end
      end
    end
    L7_74 = A0_67["dot11Profile.wepkey2"]
    if L7_74 then
      L7_74 = A0_67["dot11Profile.wepkey2"]
      if L7_74 ~= "" then
        L7_74 = string
        L7_74 = L7_74.len
        L7_74 = L7_74(A0_67["dot11Profile.wepkey2"])
        if L7_74 ~= L6_73 then
          L7_74 = string
          L7_74 = L7_74.len
          L7_74 = L7_74(A0_67["dot11Profile.wepkey2"])
          if L7_74 ~= L5_72 then
            L7_74 = printCLIError
            L7_74("Failed to configure WEP key as the length is invalid")
            return L1_68
          end
        end
        L7_74 = dot11VAP
        L7_74 = L7_74.hasTypeValidate
        L7_74 = L7_74(A0_67["dot11Profile.wepkey2"], "%X")
        if L7_74 == 1 then
          L7_74 = string
          L7_74 = L7_74.len
          L7_74 = L7_74(A0_67["dot11Profile.wepkey2"])
          if L7_74 ~= L6_73 then
            L7_74 = printCLIError
            L7_74("ASCII key should contain 5(64 Bit) or 13(128 Bit) characters")
            return L1_68
          end
        else
          L7_74 = string
          L7_74 = L7_74.len
          L7_74 = L7_74(A0_67["dot11Profile.wepkey2"])
          if L7_74 ~= L6_73 then
            L7_74 = string
            L7_74 = L7_74.len
            L7_74 = L7_74(A0_67["dot11Profile.wepkey2"])
            if L7_74 ~= L5_72 then
              L7_74 = printCLIError
              L7_74("Failed to configure WEP key as the length is invalid")
              return L1_68
            end
          end
        end
      end
    end
    L7_74 = A0_67["dot11Profile.wepkey3"]
    if L7_74 then
      L7_74 = A0_67["dot11Profile.wepkey3"]
      if L7_74 ~= "" then
        L7_74 = string
        L7_74 = L7_74.len
        L7_74 = L7_74(A0_67["dot11Profile.wepkey3"])
        if L7_74 ~= L6_73 then
          L7_74 = string
          L7_74 = L7_74.len
          L7_74 = L7_74(A0_67["dot11Profile.wepkey3"])
          if L7_74 ~= L5_72 then
            L7_74 = printCLIError
            L7_74("Failed to configure WEP key as the length is invalid")
            return L1_68
          end
        end
        L7_74 = dot11VAP
        L7_74 = L7_74.hasTypeValidate
        L7_74 = L7_74(A0_67["dot11Profile.wepkey3"], "%X")
        if L7_74 == 1 then
          L7_74 = string
          L7_74 = L7_74.len
          L7_74 = L7_74(A0_67["dot11Profile.wepkey3"])
          if L7_74 ~= L6_73 then
            L7_74 = printCLIError
            L7_74("ASCII key should contain 5(64 Bit) or 13(128 Bit) characters")
            return L1_68
          end
        else
          L7_74 = string
          L7_74 = L7_74.len
          L7_74 = L7_74(A0_67["dot11Profile.wepkey3"])
          if L7_74 ~= L6_73 then
            L7_74 = string
            L7_74 = L7_74.len
            L7_74 = L7_74(A0_67["dot11Profile.wepkey3"])
            if L7_74 ~= L5_72 then
              L7_74 = printCLIError
              L7_74("Failed to configure WEP key as the length is invalid")
              return L1_68
            end
          end
        end
      end
    end
  end
  L4_71 = _UPVALUE0_
  L5_72 = A0_67
  L4_71 = L4_71(L5_72)
  if false == L4_71 then
    return L1_68
  end
  L4_71 = UNIT_NAME
  if L4_71 == "DSR-1000AC" then
    L4_71 = A0_67["dot11Profile.radioMode"]
    if L4_71 ~= nil then
      L4_71 = A0_67["dot11Profile.radioMode"]
      if L4_71 ~= "" then
        L4_71 = A0_67["dot11Profile.radioMode"]
      end
    elseif L4_71 == " " then
      L4_71 = printCLIError
      L5_72 = "Invalid Radio Mode."
      L4_71(L5_72)
      return L1_68
    end
  end
  L4_71 = _UPVALUE1_
  L5_72 = A0_67
  L4_71 = L4_71(L5_72)
  if false == L4_71 then
    return L1_68
  end
  L4_71 = A0_67["dot11Profile.operation"]
  if L4_71 ~= "add" then
    L4_71 = A0_67["dot11Profile.operation"]
    if L4_71 ~= "delete" then
      L4_71 = UNIT_NAME
      if L4_71 == "DSR-1000AC" then
        L4_71 = A0_67["dot11Profile.profileName"]
        if L4_71 ~= "default1" then
          L4_71 = A0_67["dot11Profile.profileName"]
        elseif L4_71 == "default2" then
          L4_71 = WDSEnableFieldValueGet
          L5_72 = L2_69
          L4_71 = L4_71(L5_72)
          if L4_71 ~= nil then
            L5_72 = tonumber
            L6_73 = L4_71
            L5_72 = L5_72(L6_73)
            if L5_72 == 1 then
              L5_72 = printCLIError
              L6_73 = "WDS is enabled and this profile is being used in default VAP. Please disable WDS to modify configuration."
              L5_72(L6_73)
              return L1_68
            end
          end
        end
      else
        L4_71 = UNIT_NAME
        if L4_71 == "DSR-500AC" then
          L4_71 = A0_67["dot11Profile.profileName"]
          if L4_71 == "default1" then
            L4_71 = WDSEnableFieldValueGet
            L5_72 = L2_69
            L4_71 = L4_71(L5_72)
            if L4_71 ~= nil then
              L5_72 = tonumber
              L6_73 = L4_71
              L5_72 = L5_72(L6_73)
              if L5_72 == 1 then
                L5_72 = printCLIError
                L6_73 = "WDS is enabled and this profile is being used in default VAP. Please disable WDS to modify configuration."
                L5_72(L6_73)
                return L1_68
              end
            end
          end
        end
      end
    end
  end
  L1_68 = true
  return L1_68
end
function dot11PfrCfgDel(A0_75)
  local L1_76, L2_77, L3_78, L4_79
  L1_76 = {}
  L2_77 = "ERROR"
  L3_78 = "DOT11_PROFILE_CONFIG_FAILED"
  L4_79 = ""
  if db.getRow("dot11Profile", "profileName", A0_75[1]) == nil then
    printCLIError("Row doesnt exist")
    return "ERROR", "Row doesnt exist"
  else
    if UNIT_NAME == "DSR-1000AC" then
      if db.getRow("dot11Profile", "profileName", A0_75[1])["dot11Profile.profileName"] == "default1" or db.getRow("dot11Profile", "profileName", A0_75[1])["dot11Profile.profileName"] == "default2" then
        printCLIError("Cannot delete default Profile")
        return "ERROR", "Cannot delete default Profile"
      end
    elseif db.getRow("dot11Profile", "profileName", A0_75[1])["dot11Profile.profileName"] == "default1" then
      printCLIError("Cannot delete default Profile")
      return "ERROR", "Cannot delete default Profile"
    end
    table.insert(L1_76, db.getRow("dot11Profile", "profileName", A0_75[1])["dot11Profile._ROWID_"])
    L2_77, L3_78 = dot11.profile_config(L1_76, "-1", "delete")
    if L2_77 == "OK" then
      db.save()
    end
  end
  L4_79 = db.getAttribute("stringsMap", "stringId", L3_78, LANGUAGE)
  return L2_77, L4_79
end
function dot11PfrCfgSave(A0_80)
  local L1_81, L2_82, L3_83
  L1_81 = "ERROR"
  L2_82 = ""
  L3_83 = ""
  if A0_80["dot11Profile.security"] == "OPEN" then
    A0_80["dot11Profile.pairwiseCiphers"] = "NONE"
    A0_80["dot11Profile.authMethods"] = "NONE"
  end
  if (A0_80["dot11Profile.security"] == "WPA" or A0_80["dot11Profile.security"] == "WPA2" or A0_80["dot11Profile.security"] == "WPA+WPA2") and A0_80["dot11Profile.pskPassAscii"] ~= nil and (A0_80["dot11Profile.authMethods"] == "PSK" or A0_80["dot11Profile.authMethods"] == "PSK+RADIUS") then
    if A0_80["dot11Profile.mfpEnabled"] == "1" then
      if A0_80["dot11Profile.forcePMF"] == "1" then
        A0_80["dot11Profile.preAuthStatus"] = "192"
      else
        A0_80["dot11Profile.preAuthStatus"] = "128"
      end
    else
      A0_80["dot11Profile.preAuthStatus"] = "0"
    end
  end
  if A0_80["dot11Profile._ROWID_"] == nil then
    L1_81, L2_82 = dot11.profile_config(A0_80, "-1", "add")
    A0_80["dot11Profile._ROWID_"] = db.getAttribute("dot11Profile", "dot11Profile.profileName", A0_80["dot11Profile.profileName"], "_ROWID_")
  else
    A0_80["dot11Profile.rowID"] = A0_80["dot11Profile._ROWID_"]
    L1_81, L2_82 = _UPVALUE0_.wirelessProfileEditSet(A0_80, "edit")
  end
  if L1_81 == 0 then
    L1_81 = "OK"
  end
  if L1_81 == "OK" then
    db.save()
  end
  L3_83 = db.getAttribute("stringsMap", "stringId", L2_82, LANGUAGE)
  if A0_80["dot11Profile.security"] ~= nil and (A0_80["dot11Profile.security"] == "WEP" or A0_80["dot11Profile.security"] == "OPEN") then
    printCLIError("Warning: OPEN and WEP security modes provide weak or no security and makes a user prone to malicious attacks. For strong wireless security please use WPA, WPA2 or WPA+WPA2.")
  end
  return L1_81, L3_83
end
function dot11WmmCfgSave(A0_84)
  local L1_85, L2_86, L3_87
  L1_85 = "ERROR"
  L2_86 = ""
  L3_87 = ""
  for _FORV_7_, _FORV_8_ in pairs(A0_84) do
    if _FORV_8_ == "Best_Effort" then
      A0_84[_FORV_7_] = "Best Effort"
    end
  end
  L1_85, L2_86 = dot11.profile_config(A0_84, A0_84["dot11Profile._ROWID_"], "edit")
  if L1_85 == "OK" then
    db.save()
  end
  L3_87 = db.getAttribute("stringsMap", "stringId", L2_86, LANGUAGE)
  return L1_85, L3_87
end
function dot11WmmInputVal()
  local L0_88, L1_89
  L0_88 = true
  return L0_88
end
function dot11PfrCfgInit(A0_90)
  local L1_91, L2_92, L3_93
  L1_91 = A0_90[1]
  L2_92 = A0_90[2]
  L3_93 = db
  L3_93 = L3_93.getRow
  L3_93 = L3_93("dot11Profile", "dot11Profile.profileName", L1_91)
  if L3_93 == nil and L2_92 ~= "edit" then
    L3_93 = {}
    L3_93["dot11Profile.profileName"] = L1_91
    if A0_90[2] == "add" then
      L3_93["dot11Profile.operation"] = L2_92
    end
    _UPVALUE0_(L3_93)
  elseif L3_93 == nil then
    printCLIError("Enter profile name does not exist.")
    return -1, nil
  end
  return rowId, L3_93
end
function dot11WmmCfgInit(A0_94)
  local L1_95, L2_96
  L1_95 = A0_94[1]
  L2_96 = db
  L2_96 = L2_96.getRow
  L2_96 = L2_96("dot11Profile", "dot11Profile.profileName", L1_95)
  if L2_96 == nil then
    printCLIError("Invalid profile Name")
    return -1, nil
  end
  return rowId, L2_96
end
function dot11RegChanCheck(A0_97, A1_98, A2_99, A3_100)
  local L4_101, L5_102, L6_103, L7_104, L8_105, L9_106, L10_107, L11_108, L12_109, L13_110, L14_111, L15_112, L16_113, L17_114, L18_115, L19_116, L20_117, L21_118, L22_119
  L4_101 = db
  L4_101 = L4_101.getAttribute
  L5_102 = unitTable
  L6_103 = "_ROWID_"
  L7_104 = "1"
  L8_105 = _UPVALUE0_
  L8_105 = L8_105.region
  L4_101 = L4_101(L5_102, L6_103, L7_104, L8_105)
  L5_102, L6_103, L7_104, L8_105, L9_106, L10_107, L11_108 = nil, nil, nil, nil, nil, nil, nil
  L12_109 = {
    L13_110,
    L14_111,
    L15_112,
    L16_113,
    L17_114,
    L18_115,
    L19_116,
    L20_117,
    L21_118,
    L22_119,
    {
      "Netherlands",
      528,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Norway",
      578,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Sweden",
      752,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Poland",
      616,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Slovenia",
      705,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Luxembourg",
      442,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "South Africa",
      710,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "China",
      156,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        149,
        153,
        157,
        161
      }
    },
    {
      "Singapore",
      702,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        149,
        153,
        157,
        161
      }
    },
    {
      "Korea",
      410,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132,
        149,
        157
      },
      {}
    },
    {
      "France",
      250,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Japan",
      392,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Israel",
      612,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64
      }
    },
    {
      "India",
      456,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        149,
        153,
        157,
        161
      }
    },
    {
      "Russia",
      643,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        136,
        140,
        144,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        140,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        136,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        149,
        153,
        157,
        161
      }
    },
    {
      "Azerbaijan",
      31,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64
      }
    },
    {
      "Bahamas",
      44,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        149,
        153,
        157,
        161
      }
    },
    {
      "Belarus",
      112,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Albania",
      8,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Austria",
      40,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Armenia",
      51,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {},
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {},
      {}
    },
    {
      "Barbados",
      52,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        149,
        153,
        157,
        161
      }
    },
    {
      "Belize",
      84,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {153, 161},
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {149, 157},
      {
        149,
        153,
        157,
        161
      }
    },
    {
      "Brunei Darussalam",
      96,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        149,
        153,
        157,
        161
      }
    },
    {
      "Bolivia",
      68,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {153, 161},
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {149, 157},
      {
        149,
        153,
        157,
        161
      }
    },
    {
      "Bosnia And Herzegovina",
      70,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Bermuda",
      60,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132,
        149,
        157
      },
      {}
    },
    {
      "Bulgaria",
      100,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Qatar",
      634,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {153, 161},
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {149, 157},
      {
        149,
        153,
        157,
        161
      }
    },
    {
      "Panama",
      591,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11
      },
      {
        40,
        48,
        56,
        64,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7
      },
      {
        36,
        44,
        52,
        60,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        149,
        153,
        157,
        161
      }
    },
    {
      "Reunion",
      638,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Peru",
      604,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        149,
        153,
        157,
        161
      }
    },
    {
      "Pakistan",
      586,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {153, 161},
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {149, 157},
      {
        149,
        153,
        157,
        161
      }
    },
    {
      "Portugal",
      620,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Bangladesh",
      50,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {153, 161},
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {149, 157},
      {
        149,
        153,
        157,
        161
      }
    },
    {
      "Argentina",
      32,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        149,
        153,
        157,
        161
      }
    },
    {
      "Bahrain",
      48,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {},
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {},
      {}
    },
    {
      "American Samoa",
      16,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        149,
        153,
        157,
        161
      }
    },
    {
      "Belgium",
      56,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Papua New Guinea",
      598,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        149,
        153,
        157,
        161
      }
    },
    L13_110,
    L14_111,
    L15_112,
    L16_113,
    L17_114,
    L18_115,
    L19_116,
    L20_117,
    L21_118,
    L22_119,
    {
      "Turkey",
      792,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "United Arab Emirates",
      784,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        149,
        153,
        157,
        161
      }
    },
    {
      "Tunisia",
      788,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {},
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {},
      {}
    },
    {
      "Trinidad And Tobago",
      780,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        149,
        153,
        157,
        161
      }
    },
    {
      "Uganda",
      800,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        149,
        153,
        157,
        161
      }
    },
    {
      "Thailand",
      764,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        149,
        153,
        157,
        161
      }
    },
    {
      "Ukraine",
      804,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        149,
        153,
        157,
        161
      }
    },
    {
      "Virgin Islands(U.S.)",
      850,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        149,
        153,
        157,
        161
      }
    },
    {
      "Venezuela",
      862,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        149,
        153,
        157,
        161
      }
    },
    {
      "Uzbekistan",
      860,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        149,
        153,
        157,
        161
      }
    },
    {
      "Uruguay",
      858,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        149,
        153,
        157,
        161
      }
    },
    {
      "Viet Nam",
      704,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        149,
        153,
        157,
        161
      }
    },
    {
      "United Kingdom",
      826,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Zimbabwe",
      716,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {},
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {},
      {}
    },
    {
      "Jordan",
      400,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        149,
        153,
        157,
        161
      }
    },
    {
      "Jamaica",
      388,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        149,
        153,
        157,
        161
      }
    },
    {
      "Honduras",
      340,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        149,
        153,
        157,
        161
      }
    },
    {
      "Iran",
      364,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {153, 161},
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {149, 157},
      {
        149,
        153,
        157,
        161
      }
    },
    {
      "Hungary",
      348,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Italy",
      380,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Indonesia",
      360,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        149,
        153,
        157,
        161
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {},
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {},
      {}
    },
    {
      "Hong Kong",
      344,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        149,
        153,
        157,
        161
      }
    },
    {
      "Macau SAR",
      446,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {153, 161},
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {149, 157},
      {
        149,
        153,
        157,
        161
      }
    },
    {
      "Liechtenstein",
      438,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Latvia",
      428,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Macedonia, The Former Yugoslav Republic Of",
      807,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Kuwait",
      414,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64
      }
    },
    {
      "Lebanon",
      422,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        149,
        153,
        157,
        161
      }
    },
    {
      "Kenya",
      404,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        100,
        104,
        108,
        112,
        149,
        153
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        104,
        112,
        153
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        100,
        108,
        149
      },
      {
        36,
        40,
        44,
        48,
        100,
        104,
        108,
        112
      }
    },
    {
      "Kazakhstan",
      398,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {},
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {},
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {},
      {}
    },
    {
      "Lithuania",
      440,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Malawi",
      454,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Mauritius",
      480,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        149,
        153,
        157,
        161
      }
    },
    {
      "Malaysia",
      458,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        149,
        157
      },
      {}
    },
    {
      "Maldives",
      462,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {}
    },
    {
      "Morocco",
      504,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60
      },
      {}
    },
    {
      "Martinique",
      474,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {}
    },
    {
      "Mayotte",
      175,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {}
    },
    {
      "Monaco",
      492,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Mexico",
      484,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        149,
        153,
        157,
        161
      }
    },
    L13_110,
    L14_111,
    L15_112,
    L16_113,
    L17_114,
    L18_115,
    L19_116,
    L20_117,
    L21_118,
    L22_119,
    {
      "EL Salvador",
      222,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {},
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {},
      {}
    },
    {
      "Costa Rica",
      188,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {},
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {},
      {}
    },
    {
      "Ecuador",
      218,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {},
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {},
      {}
    },
    {
      "Croatia",
      191,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Czech Republic",
      203,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Estonia",
      233,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Colombia",
      170,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        149,
        153,
        157,
        161
      }
    },
    {
      "Dominican Republic",
      214,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11
      },
      {
        40,
        48,
        56,
        64,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7
      },
      {
        36,
        44,
        52,
        60,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        149,
        153,
        157,
        161
      }
    },
    {
      "Cyprus",
      196,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Greenland",
      304,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {},
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {},
      {}
    },
    {
      "Guatemala",
      320,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11
      },
      {
        40,
        48,
        56,
        64,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7
      },
      {
        36,
        44,
        52,
        60,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        149,
        153,
        157,
        161
      }
    },
    {
      "Georgia",
      268,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64
      }
    },
    {
      "Sri Lanka",
      144,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {},
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {},
      {}
    },
    {
      "French Guiana",
      254,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Greece",
      300,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Grenada",
      308,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136,
        153,
        161
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132,
        149,
        157
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        149,
        153,
        157,
        161
      }
    },
    {
      "Guam",
      316,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140,
        149,
        153,
        157,
        161,
        165
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11
      },
      {},
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7
      },
      {},
      {}
    },
    {
      "Guadeloupe",
      312,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "French Polynesia",
      258,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Slovakia",
      703,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Slovenia",
      705,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    },
    {
      "Egypt",
      818,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11
      },
      {},
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {},
      {}
    },
    {
      "Syria",
      760,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {},
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {},
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {},
      {}
    },
    {
      "Yemen",
      887,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {},
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {},
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {},
      {}
    },
    {
      "Cambodia",
      116,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132,
        136,
        140
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128,
        136
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124,
        132
      },
      {}
    },
    {
      "Algeria",
      12,
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128,
        132
      },
      {
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13
      },
      {
        40,
        48,
        56,
        64,
        104,
        112,
        120,
        128
      },
      {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      },
      {
        36,
        44,
        52,
        60,
        100,
        108,
        116,
        124
      },
      {
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        100,
        104,
        108,
        112,
        116,
        120,
        124,
        128
      }
    }
  }
  L16_113 = {
    L17_114,
    L18_115,
    L19_116,
    L20_117,
    L21_118,
    L22_119,
    7,
    8,
    9,
    10,
    11,
    12,
    13
  }
  L17_114 = 1
  L21_118 = 5
  L22_119 = 6
  L17_114 = {
    L18_115,
    L19_116,
    L20_117,
    L21_118,
    L22_119,
    56,
    60,
    64,
    100,
    104,
    108,
    112,
    116,
    132,
    136,
    140,
    149,
    153,
    157,
    161,
    165
  }
  L21_118 = 48
  L22_119 = 52
  L21_118 = 7
  L22_119 = 8
  L21_118 = 48
  L22_119 = 56
  L21_118 = 1
  L22_119 = 2
  L21_118 = {
    L22_119,
    44,
    52,
    60,
    100,
    108,
    132,
    149,
    157
  }
  L22_119 = 36
  L22_119 = {
    36,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    100,
    104,
    108,
    112,
    149,
    153,
    157,
    161
  }
  L16_113 = 840
  L17_114 = {
    L18_115,
    L19_116,
    L20_117,
    L21_118,
    L22_119,
    6,
    7,
    8,
    9,
    10,
    11
  }
  L21_118 = 4
  L22_119 = 5
  L21_118 = 44
  L22_119 = 48
  L21_118 = 6
  L22_119 = 7
  L21_118 = 40
  L22_119 = 48
  L21_118 = {
    L22_119,
    2,
    3,
    4,
    5,
    6,
    7
  }
  L22_119 = 1
  L22_119 = {
    36,
    44,
    149,
    157
  }
  L16_113 = "Canada"
  L17_114 = 124
  L21_118 = 3
  L22_119 = 4
  L21_118 = 40
  L22_119 = 44
  L21_118 = 5
  L22_119 = 6
  L21_118 = {
    L22_119,
    48,
    153,
    161
  }
  L22_119 = 40
  L22_119 = {
    1,
    2,
    3,
    4,
    5,
    6,
    7
  }
  L16_113 = {
    L17_114,
    L18_115,
    L19_116,
    L20_117,
    L21_118,
    L22_119,
    {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9
    },
    {
      36,
      44,
      149,
      157
    },
    {
      36,
      40,
      44,
      48,
      149,
      153,
      157,
      161
    }
  }
  L17_114 = "Latin America"
  L21_118 = 2
  L22_119 = 3
  L21_118 = 36
  L22_119 = 40
  L21_118 = {
    L22_119,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13
  }
  L22_119 = 5
  L22_119 = {
    40,
    48,
    153,
    161
  }
  L17_114 = {
    L18_115,
    L19_116,
    L20_117,
    L21_118,
    L22_119,
    {
      40,
      48,
      153,
      161
    },
    {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9
    },
    {
      36,
      44,
      149,
      157
    },
    {
      36,
      40,
      44,
      48,
      149,
      153,
      157,
      161
    }
  }
  L21_118 = 1
  L22_119 = 2
  L21_118 = {
    L22_119,
    40,
    44,
    48,
    149,
    153,
    157,
    161,
    165
  }
  L22_119 = 36
  L22_119 = {
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13
  }
  L21_118 = {
    L22_119,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11
  }
  L22_119 = 1
  L22_119 = {
    36,
    40,
    44,
    48,
    149,
    153,
    157,
    161,
    165
  }
  L21_118 = 208
  L22_119 = {
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13
  }
  L21_118 = "Germany"
  L22_119 = 276
  L21_118 = {
    L22_119,
    352,
    {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13
    },
    {
      36,
      40,
      44,
      48,
      52,
      56,
      60,
      64,
      100,
      104,
      108,
      112,
      116,
      120,
      124,
      128,
      132,
      136,
      140
    },
    {
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13
    },
    {
      40,
      48,
      56,
      64,
      104,
      112,
      120,
      128,
      136
    },
    {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9
    },
    {
      36,
      44,
      52,
      60,
      100,
      108,
      116,
      124,
      132
    },
    {
      36,
      40,
      44,
      48,
      52,
      56,
      60,
      64,
      100,
      104,
      108,
      112,
      116,
      120,
      124,
      128
    }
  }
  L22_119 = "Iceland"
  L22_119 = {
    "Finland",
    246,
    {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13
    },
    {
      36,
      40,
      44,
      48,
      52,
      56,
      60,
      64,
      100,
      104,
      108,
      112,
      116,
      120,
      124,
      128,
      132,
      136,
      140
    },
    {
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13
    },
    {
      40,
      48,
      56,
      64,
      104,
      112,
      120,
      128,
      136
    },
    {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9
    },
    {
      36,
      44,
      52,
      60,
      100,
      108,
      116,
      124,
      132
    },
    {
      36,
      40,
      44,
      48,
      52,
      56,
      60,
      64,
      100,
      104,
      108,
      112,
      116,
      120,
      124,
      128
    }
  }
  L16_113 = {
    L17_114,
    L18_115,
    L19_116,
    L20_117,
    L21_118,
    L22_119,
    7,
    8,
    9,
    10,
    11
  }
  L17_114 = 1
  L21_118 = 5
  L22_119 = 6
  L17_114 = {
    L18_115,
    L19_116,
    L20_117,
    L21_118,
    L22_119,
    56,
    60,
    64,
    100,
    104,
    108,
    112,
    116,
    120,
    124,
    128,
    132,
    136,
    140,
    149,
    153,
    157,
    161,
    165
  }
  L21_118 = 48
  L22_119 = 52
  L21_118 = 7
  L22_119 = 8
  L21_118 = 48
  L22_119 = 56
  L21_118 = 1
  L22_119 = 2
  L21_118 = {
    L22_119,
    44,
    52,
    60,
    100,
    108,
    116,
    124,
    132,
    149,
    157
  }
  L22_119 = 36
  L22_119 = {
    36,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    100,
    104,
    108,
    112,
    116,
    120,
    124,
    128,
    149,
    153,
    157,
    161
  }
  L16_113 = 600
  L17_114 = {
    L18_115,
    L19_116,
    L20_117,
    L21_118,
    L22_119,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13
  }
  L21_118 = 4
  L22_119 = 5
  L21_118 = 44
  L22_119 = 48
  L21_118 = 6
  L22_119 = 7
  L21_118 = 40
  L22_119 = 48
  L21_118 = {
    L22_119,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
  }
  L22_119 = 1
  L22_119 = {
    36,
    44,
    52,
    60,
    100,
    108,
    116,
    124,
    132,
    149,
    157
  }
  L16_113 = "Switzerland"
  L17_114 = 756
  L21_118 = 3
  L22_119 = 4
  L21_118 = 40
  L22_119 = 44
  L21_118 = 5
  L22_119 = 6
  L21_118 = {
    L22_119,
    48,
    56,
    64,
    104,
    112,
    120,
    128,
    136
  }
  L22_119 = 40
  L22_119 = {
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
  }
  L16_113 = {
    L17_114,
    L18_115,
    L19_116,
    L20_117,
    L21_118,
    L22_119,
    {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9
    },
    {
      36,
      44,
      52,
      60,
      100,
      108,
      116,
      124,
      132
    },
    {
      36,
      40,
      44,
      48,
      52,
      56,
      60,
      64,
      100,
      104,
      108,
      112,
      116,
      120,
      124,
      128
    }
  }
  L17_114 = "Romania"
  L21_118 = 2
  L22_119 = 3
  L21_118 = 36
  L22_119 = 40
  L21_118 = {
    L22_119,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13
  }
  L22_119 = 5
  L22_119 = {
    40,
    48,
    56,
    64,
    104,
    112,
    120,
    128,
    136
  }
  L17_114 = {
    L18_115,
    L19_116,
    L20_117,
    L21_118,
    L22_119,
    {
      40,
      48,
      56,
      64,
      104,
      112,
      120,
      128,
      136,
      153,
      161
    },
    {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9
    },
    {
      36,
      44,
      52,
      60,
      100,
      108,
      116,
      124,
      132,
      149,
      157
    },
    {
      36,
      40,
      44,
      48,
      52,
      56,
      60,
      64,
      100,
      104,
      108,
      112,
      116,
      120,
      124,
      128,
      149,
      153,
      157,
      161
    }
  }
  L21_118 = 1
  L22_119 = 2
  L21_118 = {
    L22_119,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    100,
    104,
    108,
    112,
    116,
    120,
    124,
    128,
    132,
    136,
    140,
    149,
    153,
    157,
    161,
    165
  }
  L22_119 = 36
  L22_119 = {
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13
  }
  L21_118 = {
    L22_119,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13
  }
  L22_119 = 1
  L22_119 = {
    36,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    100,
    104,
    108,
    112,
    116,
    120,
    124,
    128,
    132,
    136,
    140
  }
  L21_118 = 834
  L22_119 = {
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13
  }
  L21_118 = "Serbia"
  L22_119 = 688
  L21_118 = {
    L22_119,
    682,
    {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13
    },
    {
      36,
      40,
      44,
      48,
      52,
      56,
      60,
      64,
      100,
      104,
      108,
      112,
      116,
      120,
      124,
      128,
      132,
      136,
      140
    },
    {
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13
    },
    {
      40,
      48,
      56,
      64,
      104,
      112,
      120,
      128,
      136
    },
    {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9
    },
    {
      36,
      44,
      52,
      60,
      100,
      108,
      116,
      124,
      132
    },
    {
      36,
      40,
      44,
      48,
      52,
      56,
      60,
      64,
      100,
      104,
      108,
      112,
      116,
      120,
      124,
      128
    }
  }
  L22_119 = "Saudi Arabia"
  L22_119 = {
    "Spain",
    724,
    {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13
    },
    {
      36,
      40,
      44,
      48,
      52,
      56,
      60,
      64,
      100,
      104,
      108,
      112,
      116,
      120,
      124,
      128,
      132,
      136,
      140
    },
    {
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13
    },
    {
      40,
      48,
      56,
      64,
      104,
      112,
      120,
      128,
      136
    },
    {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9
    },
    {
      36,
      44,
      52,
      60,
      100,
      108,
      116,
      124,
      132
    },
    {
      36,
      40,
      44,
      48,
      52,
      56,
      60,
      64,
      100,
      104,
      108,
      112,
      116,
      120,
      124,
      128
    }
  }
  L16_113 = {
    L17_114,
    L18_115,
    L19_116,
    L20_117,
    L21_118,
    L22_119,
    7,
    8,
    9,
    10,
    11,
    12,
    13
  }
  L17_114 = 1
  L21_118 = 5
  L22_119 = 6
  L17_114 = {
    L18_115,
    L19_116,
    L20_117,
    L21_118,
    L22_119,
    56,
    60,
    64,
    149,
    153,
    157,
    161,
    165
  }
  L21_118 = 48
  L22_119 = 52
  L21_118 = 7
  L22_119 = 8
  L21_118 = 48
  L22_119 = 56
  L21_118 = 1
  L22_119 = 2
  L21_118 = {
    L22_119,
    44,
    52,
    60,
    149,
    157
  }
  L22_119 = 36
  L22_119 = {
    36,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    149,
    153,
    157,
    161
  }
  L16_113 = 470
  L17_114 = {
    L18_115,
    L19_116,
    L20_117,
    L21_118,
    L22_119,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13
  }
  L21_118 = 4
  L22_119 = 5
  L21_118 = 44
  L22_119 = 48
  L21_118 = 6
  L22_119 = 7
  L21_118 = 40
  L22_119 = 48
  L21_118 = {
    L22_119,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
  }
  L22_119 = 1
  L22_119 = {
    36,
    44,
    52,
    60,
    100,
    108,
    116,
    124,
    132
  }
  L16_113 = "Northern Mariana Islands"
  L17_114 = 580
  L21_118 = 3
  L22_119 = 4
  L21_118 = 40
  L22_119 = 44
  L21_118 = 5
  L22_119 = 6
  L21_118 = {
    L22_119,
    48,
    56,
    64,
    104,
    112,
    120,
    128,
    136,
    153,
    161
  }
  L22_119 = 40
  L22_119 = {
    1,
    2,
    3,
    4,
    5,
    6,
    7
  }
  L16_113 = {
    L17_114,
    L18_115,
    L19_116,
    L20_117,
    L21_118,
    L22_119,
    {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9
    },
    {
      36,
      44,
      52,
      60,
      100,
      108,
      116,
      124,
      132
    },
    {
      36,
      40,
      44,
      48,
      52,
      56,
      60,
      64,
      100,
      104,
      108,
      112,
      116,
      120,
      124,
      128
    }
  }
  L17_114 = "Oman"
  L21_118 = 2
  L22_119 = 3
  L21_118 = 36
  L22_119 = 40
  L21_118 = {
    L22_119,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13
  }
  L22_119 = 5
  L22_119 = {
    40,
    48,
    56,
    64,
    104,
    112,
    120,
    128,
    136
  }
  L17_114 = {
    L18_115,
    L19_116,
    L20_117,
    L21_118,
    L22_119,
    {
      40,
      48,
      56,
      64,
      104,
      112,
      120,
      128,
      136
    },
    {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9
    },
    {
      36,
      44,
      52,
      60,
      100,
      108,
      116,
      124,
      132
    },
    {}
  }
  L21_118 = 1
  L22_119 = 2
  L21_118 = {
    L22_119,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    100,
    104,
    108,
    112,
    116,
    120,
    124,
    128,
    132,
    136,
    140
  }
  L22_119 = 36
  L22_119 = {
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13
  }
  L21_118 = {
    L22_119,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13
  }
  L22_119 = 1
  L22_119 = {
    36,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    100,
    104,
    108,
    112,
    116,
    120,
    124,
    128,
    132,
    136,
    140
  }
  L21_118 = 554
  L22_119 = {
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13
  }
  L21_118 = "Nicaragua"
  L22_119 = 558
  L21_118 = {
    L22_119,
    152,
    {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13
    },
    {
      36,
      40,
      44,
      48,
      52,
      56,
      60,
      64,
      149,
      153,
      157,
      161,
      165
    },
    {
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13
    },
    {
      40,
      48,
      56,
      64,
      153,
      161
    },
    {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9
    },
    {
      36,
      44,
      52,
      60,
      149,
      157
    },
    {
      36,
      40,
      44,
      48,
      52,
      56,
      60,
      64,
      149,
      153,
      157,
      161
    }
  }
  L22_119 = "Chile"
  L22_119 = {
    "Nigeria",
    566,
    {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13
    },
    {
      52,
      56,
      60,
      64,
      149,
      153,
      157,
      161,
      165
    },
    {
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13
    },
    {
      56,
      64,
      153,
      161
    },
    {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9
    },
    {
      52,
      60,
      149,
      157
    },
    {
      52,
      56,
      60,
      64,
      149,
      153,
      157,
      161
    }
  }
  if L4_101 == L13_110 then
    L13_110(L14_111)
    return L13_110
  end
  for L16_113, L17_114 in L13_110(L14_111) do
    if L18_115 == L19_116 then
      L11_108 = 1
      L9_106 = 0
      L8_105 = 3
      L10_107 = "0(Auto)"
      if A1_98 == L18_115 then
        L8_105 = L8_105 + A0_97
      elseif A1_98 == L18_115 then
        L8_105 = L18_115 + L19_116
      elseif A2_99 == L18_115 then
        L8_105 = L18_115 + L19_116
      else
        L8_105 = L18_115 + L19_116
      end
      L6_103 = L17_114[L8_105]
      for L21_118, L22_119 in L18_115(L19_116) do
        L10_107 = L10_107 .. " " .. L22_119
        if L22_119 == tonumber(A3_100) then
          L9_106 = 1
          break
        end
      end
      if L9_106 ~= L18_115 then
        L18_115(L19_116)
        return L18_115
      end
    end
  end
  if L11_108 ~= L13_110 then
    L13_110(L14_111)
    return L13_110
  end
  return L13_110
end
function dot11RadioInputVal(A0_120)
  local L1_121, L2_122, L3_123, L4_124
  L1_121 = 0
  L2_122 = "UPPER"
  L3_123 = "20"
  L4_124 = "0"
  if UNIT_NAME == "DSR-1000AC" then
    if A0_120["dot11Radio.radioNo"] == "1" then
      if A0_120["dot11Radio.band"] == "b" then
        printCLIError("Invalid frequency band for 5GHz radio")
        return false
      end
    elseif A0_120["dot11Radio.radioNo"] == "2" and A0_120["dot11Radio.band"] == "a" then
      printCLIError("Invalid frequency band for 2.4GHz radio ")
      return false
    end
  end
  if A0_120["dot11Radio.band"] == "a" and (A0_120["dot11Radio.opMode"] == "212992" or A0_120["dot11Radio.opMode"] == "196608" or A0_120["dot11Radio.opMode"] == "475136" or A0_120["dot11Radio.opMode"] == "196607") then
    printCLIError("Invalid mode selected")
    return false
  end
  if A0_120["dot11Radio.band"] == "b" and (A0_120["dot11Radio.opMode"] == "65536" or A0_120["dot11Radio.opMode"] == "393216" or A0_120["dot11Radio.opMode"] == 983040) then
    printCLIError("Invalid mode selected")
    return false
  end
  if A0_120["dot11Radio.opMode"] == "212992" and A0_120["dot11Radio11n.chanWidth"] == "2040" or A0_120["dot11Radio.opMode"] == "196608" and A0_120["dot11Radio11n.chanWidth"] == "2040" or A0_120["dot11Radio.opMode"] == "65536" and A0_120["dot11Radio11n.chanWidth"] == "2040" or A0_120["dot11Radio.opMode"] == "196607" and A0_120["dot11Radio11n.chanWidth"] == "2040" then
    printCLIError("Invalid channel spacing")
    return false
  end
  if A0_120["dot11Radio11n.chanWidth"] ~= "80" or A0_120["dot11Radio.band"] == "a" and (A0_120["dot11Radio.opMode"] == "983040" or A0_120["dot11Radio.opMode"] == "983041") then
  else
    printCLIError("Invalid bandwidth")
    return false
  end
  if A0_120["dot11Radio.band"] == "b" and A0_120["dot11Radio11n.chanWidth"] == "80" then
    printCLIError("Invalid Operating Frequency")
    return false
  end
  if A0_120["dot11Radio.band"] == nil then
    printCLIError("Please configure the band information.")
    return false
  end
  if A0_120["dot11Radio.band"] == "b" then
    L1_121 = 0
  else
    L1_121 = 1
  end
  if A0_120["dot11Radio11n.chanWidth"] == nil then
    printCLIError("Please configure the channel Width information.")
    return false
  end
  if A0_120["dot11Radio11n.chanWidth"] == "20" then
    L3_123 = "20"
  elseif A0_120["dot11Radio11n.chanWidth"] == "80" then
    L3_123 = "80"
  else
    L3_123 = "2040"
    if A0_120["dot11Radio11n.ctlSideBand"] == nil then
      printCLIError("Please configure the control Side Band information.")
      return false
    end
    if A0_120["dot11Radio11n.ctlSideBand"] == "1" then
      L2_122 = "UPPER"
    else
      L2_122 = "LOWER"
    end
  end
  if A0_120["dot11Radio.configuredChannel"] == nil then
    printCLIError("Please configure the channel information.")
    return false
  end
  L4_124 = A0_120["dot11Radio.configuredChannel"]
  if L4_124 ~= "0" and dot11RegChanCheck(L1_121, L3_123, L2_122, L4_124) ~= "OK" then
    printCLIError("Invalid channel, Channel not Supported for this country")
    return false
  end
  return true
end
function dot11RadioCfgSave(A0_125)
  local L1_126, L2_127, L3_128, L4_129, L5_130
  L1_126 = "ERROR"
  L2_127 = ""
  L3_128 = ""
  L4_129 = db
  L4_129 = L4_129.getAttribute
  L5_130 = "dot11Countries"
  L4_129 = L4_129(L5_130, "country", A0_125["dot11GlobalConfig.country"], "countrycode")
  L4_129 = L4_129 or A0_125["dot11GlobalConfig.country"]
  A0_125["dot11GlobalConfig.country"] = L4_129
  L4_129 = ""
  L5_130 = ""
  if A0_125["dot11Radio11n.chanWidth"] ~= "20" then
    L4_129 = "40"
  end
  if A0_125["dot11Radio11n.ctlSideBand"] == "1" then
    L5_130 = "-"
  end
  if A0_125["dot11Radio11n.ctlSideBand"] == "0" then
    L5_130 = "+"
  end
  if A0_125["dot11Radio11n.chanWidth"] == "80" then
    L4_129 = "80"
    L5_130 = ""
  end
  A0_125["dot11Radio11n.puren"] = "0"
  A0_125["dot11Radio11n.pure11ac"] = "0"
  A0_125["dot11Radio11n.mimoPreamble"] = "0"
  if A0_125["dot11Radio.opMode"] == "212992" then
    A0_125["dot11Radio.opMode"] = "b and g"
  elseif A0_125["dot11Radio.opMode"] == "196607" then
    A0_125["dot11Radio.opMode"] = "b only"
  elseif A0_125["dot11Radio.opMode"] == "196608" then
    A0_125["dot11Radio.opMode"] = "g only"
  elseif A0_125["dot11Radio.opMode"] == "65536" then
    A0_125["dot11Radio.opMode"] = "a only"
  else
    if A0_125["dot11Radio.opMode"] == "475136" then
      A0_125["dot11Radio.opMode"] = "ng"
    elseif A0_125["dot11Radio.opMode"] == "393216" then
      A0_125["dot11Radio.opMode"] = "na"
    elseif A0_125["dot11Radio.opMode"] == "131072" then
      if A0_125["dot11Radio.band"] == "b" then
        A0_125["dot11Radio.opMode"] = "ng"
      else
        A0_125["dot11Radio.opMode"] = "na"
      end
      A0_125["dot11Radio11n.puren"] = "1"
      A0_125["dot11Radio11n.mimoPreamble"] = "0"
    elseif A0_125["dot11Radio.opMode"] == "983041" then
      A0_125["dot11Radio.opMode"] = "ac"
      A0_125["dot11Radio11n.pure11ac"] = "1"
    elseif A0_125["dot11Radio.opMode"] == "983040" then
      A0_125["dot11Radio.opMode"] = "ac"
    end
    if A0_125["dot11Radio11n.chanWidth"] ~= "20" then
      A0_125["dot11Radio.opMode"] = A0_125["dot11Radio.opMode"] .. L4_129 .. L5_130
    end
  end
  L1_126, L2_127 = dot11.radio_config(A0_125, A0_125["dot11Radio._ROWID_"], "edit")
  if L1_126 == "OK" then
    db.save()
  end
  L3_128 = db.getAttribute("stringsMap", "stringId", L2_127, LANGUAGE)
  return L1_126, L3_128
end
function dot11RadioCfgInit(A0_131)
  local L1_132, L2_133, L3_134, L4_135, L5_136
  L1_132 = db
  L1_132 = L1_132.getRowWhere
  L2_133 = "tableDefaults"
  L3_134 = "tableName = 'dot11VAP' and columnName='txPower'"
  L1_132 = L1_132(L2_133, L3_134)
  L2_133 = 28
  if L1_132 ~= nil then
    L2_133 = L1_132["tableDefaults.maxValue"]
  end
  L3_134 = db
  L3_134 = L3_134.getRow
  L4_135 = "dot11Card"
  L5_136 = "_ROWID_"
  L3_134 = L3_134(L4_135, L5_136, A0_131[1])
  if L3_134 ~= nil then
    L4_135 = db
    L4_135 = L4_135.getRow
    L5_136 = "dot11Radio"
    L4_135 = L4_135(L5_136, "cardNo", L3_134["dot11Card.cardNo"])
    configRow = L4_135
    L4_135 = configRow
    L5_136 = db
    L5_136 = L5_136.getAttribute
    L5_136 = L5_136("dot11GlobalConfig", "_ROWID_", "1", "country")
    L5_136 = L5_136 or ""
    L4_135["dot11GlobalConfig.country"] = L5_136
    L4_135 = configRow
    L5_136 = db
    L5_136 = L5_136.getAttribute
    L5_136 = L5_136("dot11Countries", "countrycode", configRow["dot11GlobalConfig.country"], "country")
    if not L5_136 then
      L5_136 = configRow
      L5_136 = L5_136["dot11GlobalConfig.country"]
    end
    L4_135["dot11GlobalConfig.country"] = L5_136
    L4_135 = configRow
    L5_136 = db
    L5_136 = L5_136.getAttribute
    L5_136 = L5_136("dot11Radio11n", "radioNo", configRow["dot11Radio.radioNo"], "chanWidth")
    L5_136 = L5_136 or ""
    L4_135["dot11Radio11n.chanWidth"] = L5_136
    L4_135 = configRow
    L5_136 = db
    L5_136 = L5_136.getAttribute
    L5_136 = L5_136("dot11Radio11n", "radioNo", configRow["dot11Radio.radioNo"], "puren")
    L5_136 = L5_136 or ""
    L4_135["dot11Radio11n.puren"] = L5_136
    L4_135 = configRow
    L5_136 = db
    L5_136 = L5_136.getAttribute
    L5_136 = L5_136("dot11Radio11n", "radioNo", configRow["dot11Radio.radioNo"], "pure11ac")
    L5_136 = L5_136 or ""
    L4_135["dot11Radio11n.pure11ac"] = L5_136
    L4_135 = configRow
    L5_136 = db
    L5_136 = L5_136.getAttribute
    L5_136 = L5_136("dot11Radio11n", "radioNo", configRow["dot11Radio.radioNo"], "mimoPreamble")
    L5_136 = L5_136 or ""
    L4_135["dot11Radio11n.mimoPreamble"] = L5_136
    L4_135 = configRow
    L4_135["dot11Radio11n.ctlSideBand"] = "1"
    L4_135 = string
    L4_135 = L4_135.find
    L5_136 = configRow
    L5_136 = L5_136["dot11Radio.opMode"]
    L4_135 = L4_135(L5_136, "b and g")
    if L4_135 then
      L4_135 = configRow
      L4_135["dot11Radio.opMode"] = "212992"
    end
    L4_135 = string
    L4_135 = L4_135.find
    L5_136 = configRow
    L5_136 = L5_136["dot11Radio.opMode"]
    L4_135 = L4_135(L5_136, "b only")
    if L4_135 then
      L4_135 = configRow
      L4_135["dot11Radio.opMode"] = "196607"
    end
    L4_135 = string
    L4_135 = L4_135.find
    L5_136 = configRow
    L5_136 = L5_136["dot11Radio.opMode"]
    L4_135 = L4_135(L5_136, "g only")
    if L4_135 then
      L4_135 = configRow
      L4_135["dot11Radio.opMode"] = "196608"
    end
    L4_135 = string
    L4_135 = L4_135.find
    L5_136 = configRow
    L5_136 = L5_136["dot11Radio.opMode"]
    L4_135 = L4_135(L5_136, "a only")
    if L4_135 then
      L4_135 = configRow
      L4_135["dot11Radio.opMode"] = "65536"
    end
    L4_135 = string
    L4_135 = L4_135.find
    L5_136 = configRow
    L5_136 = L5_136["dot11Radio.opMode"]
    L4_135 = L4_135(L5_136, "ng")
    if L4_135 then
      L4_135 = configRow
      L4_135["dot11Radio.opMode"] = "475136"
    end
    L4_135 = string
    L4_135 = L4_135.find
    L5_136 = configRow
    L5_136 = L5_136["dot11Radio.opMode"]
    L4_135 = L4_135(L5_136, "na")
    if L4_135 then
      L4_135 = configRow
      L4_135["dot11Radio.opMode"] = "393216"
    end
    L4_135 = string
    L4_135 = L4_135.find
    L5_136 = configRow
    L5_136 = L5_136["dot11Radio.opMode"]
    L4_135 = L4_135(L5_136, "ac")
    if L4_135 then
      L4_135 = configRow
      L4_135["dot11Radio.opMode"] = "983040"
    end
    L4_135 = configRow
    L4_135 = L4_135["dot11Radio11n.puren"]
    if L4_135 == "1" then
      L4_135 = configRow
      L4_135["dot11Radio.opMode"] = "131072"
    end
    L4_135 = configRow
    L4_135 = L4_135["dot11Radio11n.pure11ac"]
    if L4_135 == "1" then
      L4_135 = configRow
      L4_135["dot11Radio.opMode"] = "983041"
    end
  else
    L4_135 = {}
    L3_134 = L4_135
    L4_135 = {}
    configRow = L4_135
  end
  L4_135 = configRow
  L4_135 = L4_135["dot11Radio.configuredChannel"]
  if L4_135 == "0" then
    L4_135 = db
    L4_135 = L4_135.getAttribute
    L5_136 = "environment"
    L4_135 = L4_135(L5_136, "name", "CHANNEL_DBUPDATE_PROGRAM", "value")
    L5_136 = db
    L5_136 = L5_136.getAttribute
    L5_136 = L5_136("dot11Interface", "_ROWID_", "1", "interfaceName")
    if L4_135 ~= nil and L5_136 ~= nil then
      util.appendDebugOut("Exec = " .. os.execute(L4_135 .. " " .. DB_FILE_NAME .. " " .. L5_136))
      configRow["dot11Radio.currentChannel"] = db.getAttribute("dot11Radio", "cardNo", L3_134["dot11Card.cardNo"], "currentChannel")
    end
  end
  L4_135 = db
  L4_135 = L4_135.getAttribute
  L5_136 = "unitInfo"
  L4_135 = L4_135(L5_136, "rowid", 1, "regionInfo")
  configuredCountry = L4_135
  L4_135 = 1
  L5_136 = configRow
  return L4_135, L5_136
end
function dot11radiusCfgInit(A0_137)
  configRow = db.getRow("radiusClient", "_ROWID_", "1")
  configRow["radiusClient.authserver2"] = db.getAttribute("radiusClient", "_ROWID_", "2", "authserver")
  if configRow["radiusClient.authsecret"] ~= nil then
    configRow["radiusClient.authsecret"] = util.mask(configRow["radiusClient.authsecret"])
  end
  return 1, configRow
end
function dot11radiusCfgSave(A0_138)
  local L1_139
  L1_139 = A0_138["radiusClient.authsecret"]
  if L1_139 ~= nil then
    L1_139 = util
    L1_139 = L1_139.isAllMasked
    L1_139 = L1_139(A0_138["radiusClient.authsecret"])
    if L1_139 then
      L1_139 = db
      L1_139 = L1_139.getAttribute
      L1_139 = L1_139("radiusClient", "_ROWID_", "1", "authsecret")
      L1_139 = L1_139 or A0_138["radiusClient.authsecret"]
      A0_138["radiusClient.authsecret"] = L1_139
    end
  end
  L1_139 = {}
  L1_139["radiusClient.authserver"] = A0_138["radiusClient.authserver2"]
  A0_138["radiusClient.authserver2"] = nil
  L1_139["radiusClient.authport"] = A0_138["radiusClient.authport"]
  L1_139["radiusClient.authtimeout"] = A0_138["radiusClient.authtimeout"]
  L1_139["radiusClient.authretries"] = A0_138["radiusClient.authretries"]
  errorFlag, statusCode = radius.radius_config(A0_138, "1", "edit")
  if errorFlag == "OK" then
    errorFlag, statusCode = radius.radius_config(L1_139, "2", "edit")
  end
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  return errorFlag, statusMessage
end
function dot11radiusInputVal(A0_140)
  if A0_140["radiusClient.authsecret"] == "" or A0_140["radiusClient.authsecret"] == nil then
    printCLIError("Invalid secret")
    return false
  end
  return true
end
function dot11RadioAdvCfgInit(A0_141)
  local L1_142
  L1_142 = A0_141[1]
  if db.getRow("dot11Card", "_ROWID_", L1_142) ~= nil then
    configRow = db.getRowsWithJoin({
      "dot11Radio:dot11Radio11n:radioNo"
    }, "dot11Radio.radioNo", L1_142)
  else
    printCLIError("Please enter the correct radio number")
    configRow = {}
  end
  return 1, configRow[1]
end
function dot11RadioAdvCfgSave(A0_143)
  local L1_144, L2_145, L3_146, L4_147, L5_148
  L1_144 = "ERROR"
  L2_145 = ""
  L3_146 = ""
  L4_147 = ""
  L5_148 = "Protection Mode is no longer supported for 5 Ghz.\n"
  if A0_143["dot11Radio.opMode"] ~= "b and g" then
    A0_143["dot11Radio.preambleMode"] = "Long"
  end
  L1_144, L2_145 = dot11.radio_advanced_config(A0_143, A0_143["dot11Radio._ROWID_"], "edit")
  if A0_143["dot11Radio.radioNo"] == "1" and A0_143["dot11Radio.band"] == "a" then
    printCLIError(L5_148)
    while L4_147 ~= "Y" and L4_147 ~= "y" do
      printCLIError("Press Y for saving the configuration.\n")
      L4_147 = io.stdin:read("*l")
    end
  end
  if L1_144 == "OK" then
    valid = dot11Radio.config11n(A0_143, A0_143["dot11Radio11n._ROWID_"], "edit")
    db.save()
  end
  L3_146 = db.getAttribute("stringsMap", "stringId", L2_145, LANGUAGE)
  return L1_144, L3_146
end
function dot11RadioAdvInputVal(A0_149)
  if A0_149["dot11Radio.rts"] == "1" and A0_149["dot11Radio.rtsThreshold"] == "2347" then
    printCLIError("Please give valid RTS Threshold value")
    return false
  end
  if A0_149["dot11Radio.rts"] == "" or A0_149["dot11Radio.rts"] == nil then
    printCLIError("Please Enable/Disable RTS Threshold option")
    return false
  end
  if A0_149["dot11Radio.rts"] == "0" then
    A0_149["dot11Radio.rtsThreshold"] = "2347"
  end
  if A0_149["dot11Radio.radioNo"] == "1" and A0_149["dot11Radio.band"] == "a" and A0_149["dot11Radio.rtsCtsProtect"] == "1" then
    printCLIError("Protection Mode is no longer supported for 5 Ghz.\n")
    return false
  end
  return true
end
function dot11WPSCfgInit(A0_150)
  configRow = db.getRow("dot11WPS", "_ROWID_", "1")
  if configRow == nil then
    return -1, {}
  else
    configRow["dot11WPS.pin"] = "0"
    configRow["dot11WPS.pbc"] = "0"
    return 1, configRow
  end
end
function dot11WPSSave(A0_151)
  local L1_152, L2_153, L3_154, L4_155, L5_156, L6_157
  L1_152 = "ERROR"
  L2_153 = ""
  L3_154 = ""
  L4_155 = db
  L4_155 = L4_155.getRow
  L5_156 = "dot11WPS"
  L6_157 = "_ROWID_"
  L4_155 = L4_155(L5_156, L6_157, "1")
  if L4_155 == nil then
    L5_156 = wps
    L5_156 = L5_156.wpsConfig
    L6_157 = A0_151
    L6_157 = L5_156(L6_157, "-1", "add")
    L3_154 = L6_157
    L1_152 = L5_156
  else
    L5_156 = wps
    L5_156 = L5_156.wpsConfig
    L6_157 = A0_151
    L6_157 = L5_156(L6_157, "1", "edit")
    L3_154 = L6_157
    L1_152 = L5_156
  end
  if L1_152 == "OK" then
    L5_156 = db
    L5_156 = L5_156.save
    L5_156()
  end
  L5_156 = db
  L5_156 = L5_156.getAttribute
  L6_157 = "stringsMap"
  L5_156 = L5_156(L6_157, "stringId", L3_154, LANGUAGE)
  L2_153 = L5_156 or L3_154
  L5_156 = ""
  L6_157 = A0_151["dot11WPS.pin"]
  if L6_157 == "1" then
    L6_157 = A0_151["dot11WPS.pbc"]
    if L6_157 == "0" then
      L6_157 = A0_151["dot11WPS.wpsEnabled"]
      if L6_157 == "1" then
        L6_157 = A0_151["dot11WPS.stationPin"]
        A0_151["wps.wpsStationPin"] = L6_157
        L6_157 = _UPVALUE0_
        L6_157 = L6_157.wpsPinSectionSet
        L6_157 = L6_157(A0_151)
        L1_152 = L6_157
        L6_157 = _UPVALUE1_
        L6_157 = L6_157.errorStringGet
        L6_157 = L6_157(L1_152)
        L2_153 = L6_157
        if L1_152 == 0 then
          L1_152 = "OK"
        else
          L1_152 = "ERROR"
        end
        L6_157 = L1_152
        return L6_157, L2_153
      end
    end
  end
  L6_157 = A0_151["dot11WPS.pin"]
  if L6_157 == "0" then
    L6_157 = A0_151["dot11WPS.pbc"]
    if L6_157 == "1" then
      L6_157 = A0_151["dot11WPS.wpsEnabled"]
      if L6_157 == "1" then
        L6_157 = db
        L6_157 = L6_157.getAttribute
        L6_157 = L6_157("environment", "name", "WPS_PBC_PROGRAM", "value")
        if L6_157 ~= nil then
          L5_156 = os.execute(L6_157)
        end
        L2_153 = db.getAttribute("stringsMap", "stringId", "STATUS_OK", LANGUAGE) or ""
        return L1_152, L2_153
      end
    end
  end
  L6_157 = L1_152
  return L6_157, L2_153
end
function dot11WPSInputVal(A0_158)
  if A0_158["dot11WPS.vapName"] == nil or A0_158["dot11WPS.vapName"] == "" then
    printCLIError("Please enter the access point name")
    return false
  end
  if db.getRow("dot11VAP", "vapName", A0_158["dot11WPS.vapName"]) == nil then
    printCLIError("Access point doesn't exist")
    return false
  end
  if db.getRow("dot11VAP", "vapName", A0_158["dot11WPS.vapName"])["dot11VAP.vapEnabled"] == "0" then
    printCLIError("Please configured/Enabled AP to use this feature")
    return false
  end
  if db.getRowWhere("dot11Profile", "profileName='" .. db.getRow("dot11VAP", "vapName", A0_158["dot11WPS.vapName"])["dot11VAP.profileName"] .. "'") == nil and string.find(db.getRowWhere("dot11Profile", "profileName='" .. db.getRow("dot11VAP", "vapName", A0_158["dot11WPS.vapName"])["dot11VAP.profileName"] .. "'")["dot11Profile.security"], "WPA") then
    printCLIError("access points is not configured with WPA2/WPA+WPA2 security")
    return false
  end
  return true
end
function dot11ACLCfgInit(A0_159)
  configRow = db.getRow("dot11VAP", "vapName", A0_159[1])
  if configRow == nil then
    configRow = {}
  end
  return -1, configRow
end
function dot11ACLSave(A0_160)
  local L1_161, L2_162, L3_163, L4_164
  L1_161 = "OK"
  L2_162 = ""
  L3_163 = ""
  L4_164 = {}
  L1_161, L2_162 = dot11.VAP_aclConfig(A0_160, A0_160["dot11VAP._ROWID_"])
  if L1_161 == "OK" then
    db.save()
  end
  L4_164["dot11ACL.vapName"] = A0_160["dot11VAP.vapName"]
  L4_164["dot11ACL.macAddress"] = A0_160["dot11ACL.macAddress"]
  if L4_164["dot11ACL.macAddress"] ~= nil then
    L1_161, L2_162 = dot11.ACL_config(L4_164, "-1", "add")
  end
  if L1_161 == "OK" then
    db.save()
  end
  L3_163 = db.getAttribute("stringsMap", "stringId", L2_162, LANGUAGE) or L2_162
  return L1_161, L3_163
end
function dot11ACLInputVal(A0_165)
  if A0_165["dot11VAP._ROWID_"] == nil then
    printCLIError("accesspoint doesnt exist")
    return false
  end
  if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-1000N" then
  elseif UNIT_NAME == "DSR-500AC" or UNIT_NAME == "DSR-500N" then
  elseif UNIT_NAME == "DSR-250N" then
  else
  end
  if db.getTable(DOT11_ACL_TAB, false) ~= nil and #db.getTable(DOT11_ACL_TAB, false) > 64 - 1 then
    printCLIError("Maximum limit is reached")
    return false
  end
  return true
end
function dot11ACLcfgDel(A0_166)
  local L1_167
  L1_167 = {}
  L1_167 = db.getRow("dot11ACL", "_ROWID_", A0_166[1])
  if L1_167 == nil or L1_167 == "" then
    printCLIError("Row Doesn't exist")
    return nil
  else
    errorFlag, statusCode = dot11.ACL_config(L1_167, "-1", "delete")
    if errorFlag == "OK" then
      print("Row Deleted")
      db.save()
    end
  end
end
