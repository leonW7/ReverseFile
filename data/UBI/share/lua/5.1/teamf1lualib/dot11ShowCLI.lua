local L0_0
L0_0 = require
L0_0("teamf1lualib/dot11View")
function L0_0(A0_1)
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
getChannelNum = L0_0
function L0_0(A0_4)
  local L1_5, L2_6, L3_7, L4_8, L5_9, L6_10
  L1_5 = {}
  L2_6 = "dscpCosMap"
  L3_7 = 0
  L4_8 = 63
  L5_9 = ""
  L6_10 = ""
  row = db.getRow("dot11Profile", "dot11Profile.profileName", A0_4)
  if row == nil then
    resTab.insertField(L1_5, "", "No such profile")
    return L1_5
  end
  while L3_7 <= L4_8 do
    L5_9 = L2_6 .. L3_7
    L6_10 = row["dot11Profile." .. L5_9]
    if string.lower(L6_10) ~= "default" then
      resTab.insertField(L1_5, "IP DSCP/TOS", L3_7)
      resTab.insertField(L1_5, "Class Of Service", L6_10)
    end
    L3_7 = L3_7 + 1
  end
  return L1_5
end
dot11ProfileDSCPMapGet = L0_0
function L0_0(A0_11)
  local L1_12
  L1_12 = {}
  row = db.getRow("dot11Profile", "dot11Profile.profileName", A0_11)
  if row == nil then
    resTab.insertField(L1_12, "", "No such profile")
    return L1_12
  end
  resTab.insertYNField(L1_12, row["dot11Profile.qosEnable"] == "1", "QoS Enable")
  resTab.insertField(L1_12, "Default Class Of Service", row["dot11Profile.defaultCos"])
  return L1_12
end
dot11ProfileQoSConfigGet = L0_0
function L0_0(A0_13, A1_14)
  local L2_15, L3_16
  L2_15 = {}
  if A1_14 ~= "Y" and A1_14 ~= "N" then
    A1_14 = "N"
  end
  L3_16 = db
  L3_16 = L3_16.getRow
  L3_16 = L3_16("dot11Profile", "dot11Profile.profileName", A0_13)
  row = L3_16
  L3_16 = row
  if L3_16 == nil then
    L3_16 = resTab
    L3_16 = L3_16.insertField
    L3_16(L2_15, "", "No such profile")
    return L2_15
  end
  L3_16 = resTab
  L3_16 = L3_16.insertField
  L3_16(L2_15, "Profile Name", row["dot11Profile.profileName"])
  L3_16 = resTab
  L3_16 = L3_16.insertField
  L3_16(L2_15, "SSID", row["dot11Profile.ssid"])
  L3_16 = row
  L3_16 = L3_16["dot11Profile.broadcastSSID"]
  if L3_16 == "1" then
    L3_16 = resTab
    L3_16 = L3_16.insertField
    L3_16(L2_15, "Broadcast SSID", "Enabled")
  else
    L3_16 = resTab
    L3_16 = L3_16.insertField
    L3_16(L2_15, "Broadcast SSID", "Disabled")
  end
  L3_16 = row
  L3_16 = L3_16["dot11Profile.security"]
  security = L3_16
  L3_16 = resTab
  L3_16 = L3_16.insertField
  L3_16(L2_15, "Security", security)
  L3_16 = security
  if L3_16 == "WEP" then
    L3_16 = resTab
    L3_16 = L3_16.insertField
    L3_16(L2_15, "Authentication", row["dot11Profile.wepAuth"])
    L3_16 = resTab
    L3_16 = L3_16.insertField
    L3_16(L2_15, "Encryption", row["dot11Profile.groupCipher"])
    L3_16 = row
    L3_16 = L3_16["dot11Profile.defWepkeyIdx"]
    resTab.insertField(L2_15, "WEP Key " .. L3_16 + 1, row["dot11Profile.wepkey" .. L3_16])
  else
    L3_16 = security
    if L3_16 ~= "WPA" then
      L3_16 = security
      if L3_16 ~= "WPA2" then
        L3_16 = security
      end
    elseif L3_16 == "WPA+WPA2" then
      L3_16 = resTab
      L3_16 = L3_16.insertField
      L3_16(L2_15, "Authentication", row["dot11Profile.authMethods"])
      L3_16 = resTab
      L3_16 = L3_16.insertField
      L3_16(L2_15, "Encryption", row["dot11Profile.pairwiseCiphers"])
      L3_16 = resTab
      L3_16 = L3_16.insertField
      L3_16(L2_15, "WPA Password", util.mask(row["dot11Profile.pskPassAscii"]))
    end
  end
  L3_16 = resTab
  L3_16 = L3_16.insertField
  L3_16(L2_15, "Profile Advanced Configuration", "")
  L3_16 = resTab
  L3_16 = L3_16.insertField
  L3_16(L2_15, "Association Timeout Interval (in Seconds)", row["dot11Profile.assocTimeout"])
  L3_16 = resTab
  L3_16 = L3_16.insertField
  L3_16(L2_15, "Authentication Timeout Interval (in Seconds)", row["dot11Profile.authTimeout"])
  L3_16 = resTab
  L3_16 = L3_16.insertField
  L3_16(L2_15, "Group Key Refresh Interval (in Seconds)", row["dot11Profile.groupKeyUpdateInterval"])
  L3_16 = resTab
  L3_16 = L3_16.insertField
  L3_16(L2_15, "Group Key Refresh Interval (in Seconds)", row["dot11Profile.groupKeyUpdateInterval"])
  L3_16 = resTab
  L3_16 = L3_16.insertField
  L3_16(L2_15, "PMKSA LifeTime (in Seconds)", row["dot11Profile.pmksaLifetime"])
  L3_16 = resTab
  L3_16 = L3_16.insertField
  L3_16(L2_15, "802.1X Re-authentication Interval (in Seconds)", row["dot11Profile.dot1xReauthInterval"])
  return L2_15
end
dot11ProfileSingleGet = L0_0
function L0_0()
  local L0_17, L1_18, L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26, L10_27, L11_28
  L0_17 = 0
  L1_18 = {}
  L2_19 = db
  L2_19 = L2_19.getTable
  L2_19 = L2_19(L3_20)
  for L6_23, L7_24 in L3_20(L4_21) do
    L0_17 = L0_17 + 1
    L8_25 = L2_19[L0_17]
    L9_26 = L8_25["dot11Profile.radioMode"]
    L9_26 = L9_26 or ""
    L10_27 = resTab
    L10_27 = L10_27.insertField
    L11_28 = L1_18
    L10_27(L11_28, "Profile Name", L8_25["dot11Profile.profileName"])
    L10_27 = resTab
    L10_27 = L10_27.insertField
    L11_28 = L1_18
    L10_27(L11_28, "SSID", L8_25["dot11Profile.ssid"])
    L10_27 = L8_25["dot11Profile.broadcastSSID"]
    if L10_27 == "1" then
      L10_27 = resTab
      L10_27 = L10_27.insertField
      L11_28 = L1_18
      L10_27(L11_28, "Broadcast SSID", "Enabled")
    else
      L10_27 = resTab
      L10_27 = L10_27.insertField
      L11_28 = L1_18
      L10_27(L11_28, "Broadcast SSID", "Disabled")
    end
    L10_27 = resTab
    L10_27 = L10_27.insertField
    L11_28 = L1_18
    L10_27(L11_28, "Security", L8_25["dot11Profile.security"])
    L10_27 = L8_25["dot11Profile.pairwiseCiphers"]
    L10_27 = L10_27 or ""
    L11_28 = L8_25["dot11Profile.authMethods"]
    L11_28 = L11_28 or ""
    if L8_25["dot11Profile.radioMode"] == "b" then
      L9_26 = "2.4 Ghz"
    elseif L8_25["dot11Profile.radioMode"] == "a" then
      L9_26 = "5 Ghz"
    elseif L8_25["dot11Profile.radioMode"] == "dual" then
      L9_26 = "Both"
    end
    if L8_25["dot11Profile.security"] == "OPEN" then
      L10_27 = "NONE"
      L11_28 = "NONE"
    elseif L8_25["dot11Profile.security"] == "WEP" then
      L10_27 = L8_25["dot11Profile.groupCipher"] or ""
      L11_28 = L8_25["dot11Profile.wepAuth"] or ""
    end
    resTab.insertField(L1_18, "Encryption", L10_27)
    resTab.insertField(L1_18, "Authentication", L11_28)
    if UNIT_NAME == "DSR-1000AC" then
      resTab.insertField(L1_18, "Radio Mode", L9_26)
    end
  end
  return L1_18
end
dot11ProfileAllGet = L0_0
function L0_0(A0_29)
  local L1_30, L2_31, L3_32, L4_33, L5_34, L6_35, L7_36, L8_37, L9_38
  L1_30 = 0
  L2_31 = {}
  L3_32 = db
  L3_32 = L3_32.getRow
  L4_33 = "dot11Radio"
  L5_34 = "dot11Radio.radioNo"
  L6_35 = A0_29
  L3_32 = L3_32(L4_33, L5_34, L6_35)
  L4_33 = db
  L4_33 = L4_33.getRow
  L5_34 = "dot11Radio11n"
  L6_35 = "dot11Radio11n.radioNo"
  L7_36 = A0_29
  L4_33 = L4_33(L5_34, L6_35, L7_36)
  L5_34 = db
  L5_34 = L5_34.getAttribute
  L6_35 = "dot11Radio11n"
  L7_36 = "radioNo"
  L8_37 = A0_29
  L9_38 = "chanWidth"
  L5_34 = L5_34(L6_35, L7_36, L8_37, L9_38)
  if L3_32 == nil then
    L6_35 = resTab
    L6_35 = L6_35.insertField
    L7_36 = L2_31
    L8_37 = ""
    L9_38 = "No such radio"
    L6_35(L7_36, L8_37, L9_38)
    return L2_31
  end
  if L5_34 == "20" then
    L5_34 = "20 MHz"
  elseif L5_34 == "2040" then
    L5_34 = "20/40 MHz"
  elseif L5_34 == "80" then
    L5_34 = "80 MHz"
  else
    L5_34 = ""
  end
  L6_35 = L3_32["dot11Radio.band"]
  if L6_35 == "a" then
    L6_35 = "5 GHz"
    band = L6_35
  else
    L6_35 = L3_32["dot11Radio.band"]
    if L6_35 == "b" then
      L6_35 = "2.4 GHz"
      band = L6_35
    end
  end
  L6_35 = resTab
  L6_35 = L6_35.insertField
  L7_36 = L2_31
  L8_37 = "Operating Frequency"
  L9_38 = band
  L9_38 = L9_38 or ""
  L6_35(L7_36, L8_37, L9_38)
  L6_35 = string
  L6_35 = L6_35.find
  L7_36 = L3_32["dot11Radio.opMode"]
  L8_37 = "ac"
  L6_35 = L6_35(L7_36, L8_37)
  if L6_35 then
    L6_35 = L4_33["dot11Radio11n.pure11ac"]
    if L6_35 == "1" then
      L6_35 = resTab
      L6_35 = L6_35.insertField
      L7_36 = L2_31
      L8_37 = "Mode"
      L9_38 = "AC Only"
      L6_35(L7_36, L8_37, L9_38)
    else
      L6_35 = resTab
      L6_35 = L6_35.insertField
      L7_36 = L2_31
      L8_37 = "Mode"
      L9_38 = "A/N/AC-Mixed"
      L6_35(L7_36, L8_37, L9_38)
    end
  else
    L6_35 = string
    L6_35 = L6_35.find
    L7_36 = L3_32["dot11Radio.opMode"]
    L8_37 = "na"
    L6_35 = L6_35(L7_36, L8_37)
    if L6_35 then
      L6_35 = L4_33["dot11Radio11n.puren"]
      if L6_35 == "1" then
        L6_35 = resTab
        L6_35 = L6_35.insertField
        L7_36 = L2_31
        L8_37 = "Mode"
        L9_38 = "N Only"
        L6_35(L7_36, L8_37, L9_38)
      else
        L6_35 = resTab
        L6_35 = L6_35.insertField
        L7_36 = L2_31
        L8_37 = "Mode"
        L9_38 = "N/A-Mixed"
        L6_35(L7_36, L8_37, L9_38)
      end
    else
      L6_35 = string
      L6_35 = L6_35.find
      L7_36 = L3_32["dot11Radio.opMode"]
      L8_37 = "ng"
      L6_35 = L6_35(L7_36, L8_37)
      if L6_35 then
        L6_35 = L4_33["dot11Radio11n.puren"]
        if L6_35 == "1" then
          L6_35 = resTab
          L6_35 = L6_35.insertField
          L7_36 = L2_31
          L8_37 = "Mode"
          L9_38 = "N Only"
          L6_35(L7_36, L8_37, L9_38)
        else
          L6_35 = resTab
          L6_35 = L6_35.insertField
          L7_36 = L2_31
          L8_37 = "Mode"
          L9_38 = "N/G-Mixed"
          L6_35(L7_36, L8_37, L9_38)
        end
      else
        L6_35 = L3_32["dot11Radio.opMode"]
        if L6_35 == "g only" then
          L6_35 = resTab
          L6_35 = L6_35.insertField
          L7_36 = L2_31
          L8_37 = "Mode"
          L9_38 = "G Only"
          L6_35(L7_36, L8_37, L9_38)
        else
          L6_35 = L3_32["dot11Radio.opMode"]
          if L6_35 == "b and g" then
            L6_35 = resTab
            L6_35 = L6_35.insertField
            L7_36 = L2_31
            L8_37 = "Mode"
            L9_38 = "G/B-Mixed"
            L6_35(L7_36, L8_37, L9_38)
          else
            L6_35 = L3_32["dot11Radio.opMode"]
            if L6_35 == "a only" then
              L6_35 = resTab
              L6_35 = L6_35.insertField
              L7_36 = L2_31
              L8_37 = "Mode"
              L9_38 = "A Only"
              L6_35(L7_36, L8_37, L9_38)
            else
              L6_35 = L3_32["dot11Radio.opMode"]
              if L6_35 == "b only" then
                L6_35 = resTab
                L6_35 = L6_35.insertField
                L7_36 = L2_31
                L8_37 = "Mode"
                L9_38 = "B Only"
                L6_35(L7_36, L8_37, L9_38)
              else
                L6_35 = resTab
                L6_35 = L6_35.insertField
                L7_36 = L2_31
                L8_37 = "Mode"
                L9_38 = L3_32["dot11Radio.opMode"]
                L9_38 = L9_38 or ""
                L6_35(L7_36, L8_37, L9_38)
              end
            end
          end
        end
      end
    end
  end
  L6_35 = resTab
  L6_35 = L6_35.insertField
  L7_36 = L2_31
  L8_37 = "Channel Spacing"
  L9_38 = L5_34 or ""
  L6_35(L7_36, L8_37, L9_38)
  L6_35 = nil
  L7_36 = "N/A"
  L8_37 = UNIT_NAME
  if L8_37 ~= "DSR-1000AC" then
    L8_37 = UNIT_NAME
  elseif L8_37 == "DSR-500AC" then
    L8_37 = tonumber
    L9_38 = A0_29
    L8_37 = L8_37(L9_38)
    if L8_37 == 2 then
      L8_37 = "radioList = '2' and vapEnabled = '1'"
      L9_38 = db
      L9_38 = L9_38.getAttributeWhere
      L9_38 = L9_38("dot11VAP", L8_37, "vapName")
      L6_35 = L9_38
      L9_38 = UNIT_NAME
      if L9_38 == "DSR-1000AC" and (L6_35 == nil or L6_35 == "" or L6_35 == " ") then
        L8_37 = "radioList = '1,2' and vapEnabled = '1'"
        L9_38 = db
        L9_38 = L9_38.getAttributeWhere
        L9_38 = L9_38("dot11VAP", L8_37, "vapName")
        L6_35 = L9_38
      end
      if L6_35 ~= nil and L6_35 ~= "" and L6_35 ~= " " then
        L9_38 = "radioNo = '2' and vapName == '"
        L8_37 = L9_38 .. L6_35 .. "'"
        L9_38 = db
        L9_38 = L9_38.getAttributeWhere
        L9_38 = L9_38("dot11Interface", L8_37, "interfaceName")
        L6_35 = L9_38
      end
    else
      L8_37 = "radioList = '1' and vapEnabled = '1'"
      L9_38 = db
      L9_38 = L9_38.getAttributeWhere
      L9_38 = L9_38("dot11VAP", L8_37, "vapName")
      L6_35 = L9_38
      L9_38 = UNIT_NAME
      if L9_38 == "DSR-1000AC" and (L6_35 == nil or L6_35 == "" or L6_35 == " ") then
        L8_37 = "radioList = '1,2' and vapEnabled = '1'"
        L9_38 = db
        L9_38 = L9_38.getAttributeWhere
        L9_38 = L9_38("dot11VAP", L8_37, "vapName")
        L6_35 = L9_38
      end
      if L6_35 ~= nil and L6_35 ~= "" and L6_35 ~= " " then
        L9_38 = "radioNo = '1' and vapName == '"
        L8_37 = L9_38 .. L6_35 .. "'"
        L9_38 = db
        L9_38 = L9_38.getAttributeWhere
        L9_38 = L9_38("dot11Interface", L8_37, "interfaceName")
        L6_35 = L9_38
      end
    end
    if L6_35 ~= nil and L6_35 ~= "" and L6_35 ~= " " then
      L8_37 = io
      L8_37 = L8_37.popen
      L9_38 = "/pfrm2.0/bin/dot11ChannelGet "
      L9_38 = L9_38 .. L6_35
      L8_37 = L8_37(L9_38)
      L9_38 = L8_37.read
      L9_38 = L9_38(L8_37, "*number")
      L7_36 = L9_38
      if L7_36 ~= nil and L7_36 ~= "" and L7_36 ~= " " then
        L9_38 = getChannelNum
        L9_38 = L9_38(L7_36)
        L7_36 = L9_38
      end
      L9_38 = L8_37.close
      L9_38(L8_37)
    else
      L7_36 = "N/A"
    end
    L3_32["dot11Radio.currentChannel"] = L7_36
  end
  L8_37 = L3_32["dot11Radio.configuredChannel"]
  if L8_37 == "0" then
    L8_37 = resTab
    L8_37 = L8_37.insertField
    L9_38 = L2_31
    L8_37(L9_38, "Channel", "Auto")
  else
    L8_37 = resTab
    L8_37 = L8_37.insertField
    L9_38 = L2_31
    L8_37(L9_38, "Channel", L3_32["dot11Radio.currentChannel"])
  end
  L8_37 = resTab
  L8_37 = L8_37.insertField
  L9_38 = L2_31
  L8_37(L9_38, "Current Channel", L3_32["dot11Radio.currentChannel"])
  L8_37 = db
  L8_37 = L8_37.getRowsWhere
  L9_38 = "dot11Interface"
  L8_37 = L8_37(L9_38, "radioNo='" .. L3_32["dot11Radio.radioNo"] .. "' and vapName !='unused' and vapName not like 'wds%'")
  L9_38 = nil
  for _FORV_13_, _FORV_14_ in pairs(L8_37) do
    if db.getRowWhere("dot11VAP", "vapName='" .. _FORV_14_["dot11Interface.vapName"] .. "' and vapEnabled='1'") ~= nil then
      require("dot11Lib")
      L9_38 = dot11.GetTxPower(_FORV_14_["dot11Interface.interfaceName"])
    end
  end
  if L9_38 == nil or L9_38 == "" or L9_38 == " " then
    L9_38 = 0
  end
  resTab.insertField(L2_31, "Default Transmit Power", L3_32["dot11Radio.txPower"] .. " dBm" or "")
  resTab.insertField(L2_31, "Transmit Power", L9_38 .. " dBm" or "")
  if L3_32["dot11Radio.txRate"] == "0" then
  elseif L3_32["dot11Radio.txRate"] == "27" then
  elseif L3_32["dot11Radio.txRate"] == "26" then
  elseif L3_32["dot11Radio.txRate"] == "25" then
  elseif L3_32["dot11Radio.txRate"] == "11" then
  elseif L3_32["dot11Radio.txRate"] == "15" then
  elseif L3_32["dot11Radio.txRate"] == "10" then
  elseif L3_32["dot11Radio.txRate"] == "14" then
  elseif L3_32["dot11Radio.txRate"] == "9" then
  elseif L3_32["dot11Radio.txRate"] == "13" then
  elseif L3_32["dot11Radio.txRate"] == "8" then
  elseif L3_32["dot11Radio.txRate"] == "12" then
  elseif L3_32["dot11Radio.txRate"] == "128" then
  elseif L3_32["dot11Radio.txRate"] == "129" then
  elseif L3_32["dot11Radio.txRate"] == "130" then
  elseif L3_32["dot11Radio.txRate"] == "131" then
  elseif L3_32["dot11Radio.txRate"] == "132" then
  elseif L3_32["dot11Radio.txRate"] == "133" then
  elseif L3_32["dot11Radio.txRate"] == "134" then
  elseif L3_32["dot11Radio.txRate"] == "135" then
  elseif L3_32["dot11Radio.txRate"] == "136" then
  elseif L3_32["dot11Radio.txRate"] == "137" then
  elseif L3_32["dot11Radio.txRate"] == "138" then
  elseif L3_32["dot11Radio.txRate"] == "139" then
  elseif L3_32["dot11Radio.txRate"] == "140" then
  elseif L3_32["dot11Radio.txRate"] == "141" then
  elseif L3_32["dot11Radio.txRate"] == "142" then
  elseif L3_32["dot11Radio.txRate"] == "143" then
  elseif L3_32["dot11Radio.txRate"] == "144" then
  elseif L3_32["dot11Radio.txRate"] == "145" then
  elseif L3_32["dot11Radio.txRate"] == "146" then
  elseif L3_32["dot11Radio.txRate"] == "147" then
  elseif L3_32["dot11Radio.txRate"] == "148" then
  elseif L3_32["dot11Radio.txRate"] == "149" then
  elseif L3_32["dot11Radio.txRate"] == "150" then
  elseif L3_32["dot11Radio.txRate"] == "151" then
  elseif L3_32["dot11Radio.txRate"] == "152" then
  elseif L3_32["dot11Radio.txRate"] == "153" then
  elseif L3_32["dot11Radio.txRate"] == "154" then
  elseif L3_32["dot11Radio.txRate"] == "155" then
  elseif L3_32["dot11Radio.txRate"] == "156" then
  elseif L3_32["dot11Radio.txRate"] == "157" then
  elseif L3_32["dot11Radio.txRate"] == "158" then
  elseif L3_32["dot11Radio.txRate"] == "159" then
  elseif L3_32["dot11Radio.txRate"] == "160" then
  elseif L3_32["dot11Radio.txRate"] == "161" then
  else
  end
  resTab.insertField(L2_31, "Transmit Rate", "" or "")
  return L2_31
end
dot11RadioSingleGet = L0_0
function L0_0()
  local L0_39, L1_40, L2_41, L3_42, L4_43, L5_44, L6_45, L7_46, L8_47, L9_48, L10_49, L11_50, L12_51, L13_52, L14_53, L15_54, L16_55, L17_56, L18_57, L19_58, L20_59
  L0_39 = 0
  L1_40 = {}
  L2_41 = db
  L2_41 = L2_41.getTableWithJoin
  L2_41 = L2_41(L3_42)
  if L2_41 == nil then
    L6_45 = "No APs Configured"
    L3_42(L4_43, L5_44, L6_45)
    return L1_40
  end
  for L6_45, L7_46 in L3_42(L4_43) do
    L8_47 = db
    L8_47 = L8_47.getRows
    L9_48 = "dot11Interface"
    L8_47 = L8_47(L9_48, L10_49, L11_50)
    L9_48 = ""
    for L13_52, L14_53 in L10_49(L11_50) do
      L15_54 = L9_48
      L16_55 = L14_53["dot11Interface.radioNo"]
      L17_56 = ", "
      L9_48 = L15_54 .. L16_55 .. L17_56
    end
    L14_53 = L9_48
    L13_52 = L9_48.len
    L13_52 = L13_52(L14_53)
    L13_52 = L13_52 - 2
    L9_48 = L10_49
    L0_39 = L0_39 + 1
    L13_52 = "dot11Profile"
    L14_53 = "ssid"
    L15_54 = L10_49["dot11Profile.ssid"]
    L16_55 = "radioMode"
    if L12_51 == "b" then
    elseif L12_51 == "a" then
    else
    end
    L13_52 = resTab
    L13_52 = L13_52.insertField
    L14_53 = L1_40
    L15_54 = "APName"
    L16_55 = L10_49["dot11VAP.vapName"]
    L13_52(L14_53, L15_54, L16_55)
    L13_52 = L10_49["dot11VAP.vapEnabled"]
    if L13_52 == "0" then
      L13_52 = resTab
      L13_52 = L13_52.insertField
      L14_53 = L1_40
      L15_54 = "Enabled"
      L16_55 = "N"
      L13_52(L14_53, L15_54, L16_55)
    else
      L13_52 = resTab
      L13_52 = L13_52.insertField
      L14_53 = L1_40
      L15_54 = "Enabled"
      L16_55 = "Y"
      L13_52(L14_53, L15_54, L16_55)
    end
    L13_52 = resTab
    L13_52 = L13_52.insertField
    L14_53 = L1_40
    L15_54 = "SSID"
    L16_55 = L10_49["dot11Profile.ssid"]
    L13_52(L14_53, L15_54, L16_55)
    L13_52 = L10_49["dot11Profile.broadcastSSID"]
    if L13_52 == "0" then
      L13_52 = resTab
      L13_52 = L13_52.insertField
      L14_53 = L1_40
      L15_54 = "Broadcast"
      L16_55 = "N"
      L13_52(L14_53, L15_54, L16_55)
    else
      L13_52 = resTab
      L13_52 = L13_52.insertField
      L14_53 = L1_40
      L15_54 = "Broadcast"
      L16_55 = "Y"
      L13_52(L14_53, L15_54, L16_55)
    end
    L13_52 = ""
    L14_53 = L10_49["dot11Profile.security"]
    if L14_53 ~= "OPEN" then
      L14_53 = L10_49["dot11Profile.security"]
    else
      if L14_53 == "WEP" then
        L13_52 = L10_49["dot11Profile.security"]
    end
    else
      L14_53 = L10_49["dot11Profile.security"]
      L15_54 = " / "
      L16_55 = L10_49["dot11Profile.pairwiseCiphers"]
      L17_56 = " / "
      L18_57 = L10_49["dot11Profile.authMethods"]
      L13_52 = L14_53 .. L15_54 .. L16_55 .. L17_56 .. L18_57
    end
    L14_53 = L10_49["dot11VAP.profileName"]
    L15_54 = "("
    L16_55 = L13_52
    L17_56 = ")"
    L14_53 = L14_53 .. L15_54 .. L16_55 .. L17_56
    tmpStr = L14_53
    L14_53 = resTab
    L14_53 = L14_53.insertField
    L15_54 = L1_40
    L16_55 = "Profile"
    L17_56 = tmpStr
    L14_53(L15_54, L16_55, L17_56)
    L14_53 = "No"
    L15_54 = "-"
    L16_55 = "-"
    L17_56 = L11_50["crontab.unit"]
    if L17_56 == "2" then
      L14_53 = "Yes"
      L17_56 = L11_50["crontab.startMeridian"]
      if L17_56 == "1" then
        L17_56 = "PM"
        startMeridiem = L17_56
      else
        L17_56 = L11_50["crontab.startMeridian"]
        if L17_56 == "0" then
          L17_56 = "AM"
          startMeridiem = L17_56
        end
      end
      L17_56 = L11_50["crontab.stopMeridian"]
      if L17_56 == "1" then
        L17_56 = "PM"
        stopMeridiem = L17_56
      else
        L17_56 = L11_50["crontab.stopMeridian"]
        if L17_56 == "0" then
          L17_56 = "AM"
          stopMeridiem = L17_56
        end
      end
      L17_56 = L11_50["crontab.startHour"]
      L18_57 = L11_50["crontab.startMinute"]
      L19_58 = L11_50["crontab.stopHour"]
      L20_59 = L11_50["crontab.stopMinute"]
      if L17_56 ~= nil and L17_56 ~= "" and tonumber(L17_56) < 10 then
        L17_56 = "0" .. L17_56
      end
      if L18_57 ~= nil and L18_57 ~= "" and tonumber(L18_57) < 10 then
        L18_57 = "0" .. L18_57
      end
      if L19_58 ~= nil and L19_58 ~= "" and tonumber(L19_58) < 10 then
        L19_58 = "0" .. L19_58
      end
      if L20_59 ~= nil and L20_59 ~= "" and tonumber(L20_59) < 10 then
        L20_59 = "0" .. L20_59
      end
      L15_54 = L17_56 .. ":" .. L18_57 .. " " .. startMeridiem
      L16_55 = L19_58 .. ":" .. L20_59 .. " " .. stopMeridiem
    end
    L17_56 = resTab
    L17_56 = L17_56.insertField
    L18_57 = L1_40
    L19_58 = "Active Time"
    L20_59 = L14_53
    L17_56(L18_57, L19_58, L20_59)
    L17_56 = resTab
    L17_56 = L17_56.insertField
    L18_57 = L1_40
    L19_58 = "Start Time"
    L20_59 = L15_54
    L17_56(L18_57, L19_58, L20_59)
    L17_56 = resTab
    L17_56 = L17_56.insertField
    L18_57 = L1_40
    L19_58 = "Stop Time"
    L20_59 = L16_55
    L17_56(L18_57, L19_58, L20_59)
    L17_56 = UNIT_NAME
    if L17_56 == "DSR-1000AC" then
      L17_56 = resTab
      L17_56 = L17_56.insertField
      L18_57 = L1_40
      L19_58 = "Radio Mode"
      L20_59 = L12_51
      L17_56(L18_57, L19_58, L20_59)
    end
  end
  L3_42(L4_43, L5_44)
end
dot11APAllGet = L0_0
function L0_0(A0_60)
  local L1_61, L2_62, L3_63, L4_64
  L1_61 = 1
  L2_62 = {}
  L3_63 = db
  L3_63 = L3_63.getRow
  L4_64 = "dot11VAP"
  L3_63 = L3_63(L4_64, "dot11VAP.vapName", A0_60)
  L4_64 = db
  L4_64 = L4_64.getRows
  L4_64 = L4_64("dot11ACL", "dot11ACL.vapName", A0_60)
  if L3_63 ~= nil then
    resTab.insertField(L2_62, "ACL Policy Status", L3_63["dot11VAP.defACLPolicy"])
  end
  for _FORV_8_, _FORV_9_ in pairs(L4_64) do
    resTab.insertField(L2_62, "Host" .. L1_61, _FORV_9_["dot11ACL.macAddress"])
    L1_61 = L1_61 + 1
  end
  return L2_62
end
function dot11RadioAdvGet(A0_65)
  local L1_66, L2_67, L3_68
  L1_66 = 0
  L2_67 = {}
  L3_68 = ""
  resTab.insertField(L2_67, "Beacon Interval", db.getRow("dot11Radio", "dot11Radio.radioNo", A0_65)["dot11Radio.beaconInterval"])
  resTab.insertField(L2_67, "DTIM Interval", db.getRow("dot11Radio", "dot11Radio.radioNo", A0_65)["dot11Radio.dtimInterval"])
  resTab.insertField(L2_67, "RTS Threshold", db.getRow("dot11Radio", "dot11Radio.radioNo", A0_65)["dot11Radio.rtsThreshold"])
  if db.getRow("dot11Radio", "dot11Radio.radioNo", A0_65)["dot11Radio.band"] == "b" and UNIT_NAME ~= "DSR-500AC" then
    resTab.insertField(L2_67, "Frag Threshold", db.getRow("dot11Radio", "dot11Radio.radioNo", A0_65)["dot11Radio.fragThreshold"])
  end
  resTab.insertField(L2_67, "Preamble Mode", db.getRow("dot11Radio", "dot11Radio.radioNo", A0_65)["dot11Radio.preambleMode"])
  if db.getRow("dot11Radio", "dot11Radio.radioNo", A0_65)["dot11Radio.band"] ~= "a" then
    if db.getRow("dot11Radio", "dot11Radio.radioNo", A0_65)["dot11Radio.rtsCtsProtect"] == "1" then
      resTab.insertField(L2_67, "Protection Mode:", "CTS-t-Self Protection")
    elseif db.getRow("dot11Radio", "dot11Radio.radioNo", A0_65)["dot11Radio.rtsCtsProtect"] == "0" then
      resTab.insertField(L2_67, "Protection Mode", "None")
    end
  end
  if db.getRow("dot11Radio", "dot11Radio.radioNo", A0_65)["dot11Radio.uapsd"] == "1" then
    resTab.insertField(L2_67, "Power save enable", "Y")
  else
    resTab.insertField(L2_67, "Power save enable", "N")
  end
  resTab.insertField(L2_67, "Short Retry", db.getRow("dot11Radio", "dot11Radio.radioNo", A0_65)["dot11Radio.shortRetry"])
  resTab.insertField(L2_67, "Long Retry", db.getRow("dot11Radio", "dot11Radio.radioNo", A0_65)["dot11Radio.longRetry"])
  if db.getRow("dot11Radio11n", "dot11Radio11n.radioNo", A0_65)["dot11Radio11n.txAntennas"] == "0" then
    db.getRow("dot11Radio11n", "dot11Radio11n.radioNo", A0_65)["dot11Radio11n.txAntennas"] = "Auto"
  end
  if db.getRow("dot11Radio11n", "dot11Radio11n.radioNo", A0_65)["dot11Radio11n.rxAntennas"] == "0" then
    db.getRow("dot11Radio11n", "dot11Radio11n.radioNo", A0_65)["dot11Radio11n.rxAntennas"] = "Auto"
  end
  resTab.insertField(L2_67, "Tx antenna", db.getRow("dot11Radio11n", "dot11Radio11n.radioNo", A0_65)["dot11Radio11n.txAntennas"])
  resTab.insertField(L2_67, "Rx antenna", db.getRow("dot11Radio11n", "dot11Radio11n.radioNo", A0_65)["dot11Radio11n.rxAntennas"])
  resTab.insertField(L2_67, "AMPDU", db.getRow("dot11Radio11n", "dot11Radio11n.radioNo", A0_65)["dot11Radio11n.ampdu"])
  return L2_67
end
function dot11StatsGet(A0_69)
  local L1_70, L2_71, L3_72
  L1_70 = A0_69[1]
  L2_71 = A0_69[2]
  if L1_70 ~= "all" and L2_71 ~= "-1" then
    L3_72 = dot11APDetailedStatsGet
    L3_72 = L3_72(L1_70, L2_71)
    resultTab = L3_72
    L3_72 = printLabel
    L3_72("AP Detailed Statistics")
    L3_72 = resTab
    L3_72 = L3_72.print
    L3_72(resultTab, 0)
  else
    L3_72 = printLabel
    L3_72("Radio Statistics")
    L3_72 = dot11RadioStatsGet
    L3_72 = L3_72()
    resultTab = L3_72
    L3_72 = resTab
    L3_72 = L3_72.print
    L3_72(resultTab, 0)
    L3_72 = printLabel
    L3_72("AP Statistics")
    L3_72 = dot11APStatsGet
    L3_72 = L3_72()
    resultTab = L3_72
    L3_72 = resTab
    L3_72 = L3_72.print
    L3_72(resultTab, 0)
  end
  L3_72 = db
  L3_72 = L3_72.getAttribute
  L3_72 = L3_72("environment", "name", "IFDEVSTATS_PROGRAM", "value")
  os.execute(L3_72 .. " " .. DB_FILE_NAME)
end
function dot11RogueAPGet(A0_73)
  printLabel("Authorized AP Mac Addresses")
  resultTab = dot11RAPAllGet()
  resTab.print(resultTab, 0)
  printLabel("Detected RogueAPs")
  resultTab = dot11RAPDetAllGet()
  resTab.print(resultTab, 0)
end
function dot11APGet(A0_74)
  local L1_75
  L1_75 = A0_74[1]
  if L1_75 ~= "all" then
    printLabel("AP Configuration")
    resultTab = _UPVALUE0_(L1_75)
    resTab.print(resultTab, 8)
    printLabel("ACL Policy and MAC Addresses")
    resultTab = _UPVALUE1_(L1_75)
    resTab.print(resultTab, 8)
  else
    resultTab = dot11APAllGet()
  end
end
function dot11RadioGet(A0_76)
  local L1_77
  L1_77 = A0_76[1]
  if db.getRow("dot11Radio", "dot11Radio.radioNo", L1_77) == nil then
    printCLIError("Invalid Radio Number")
    return
  end
  printLabel("Radio Configuration")
  resultTab = dot11RadioSingleGet(L1_77)
  resTab.print(resultTab, 0)
  printLabel("Radio Advanced Configuration")
  resultTab = dot11RadioAdvGet(L1_77)
  resTab.print(resultTab, 0)
end
function dot11ProfileGet(A0_78)
  local L1_79, L2_80
  L1_79 = A0_78[1]
  L2_80 = A0_78[2]
  if L1_79 ~= "all" then
    resultTab = dot11ProfileSingleGet(L1_79, L2_80)
    printLabel("Profile Configuration")
    resTab.print(resultTab, 0)
    if L2_80 == "Y" then
      printLabel("Profile QoS Configuration")
      resultTab = dot11ProfileQoSConfigGet(L1_79)
      resTab.print(resultTab, 0)
      resultTab = dot11ProfileDSCPMapGet(L1_79)
      printLabel("IP TOS/DiffServ Mapping (non default values)")
      resTab.print(resultTab, 0)
    end
  else
    resultTab = dot11ProfileAllGet()
    resTab.print(resultTab, 0)
  end
end
function dot11radiusGet(A0_81)
  local L1_82, L2_83, L3_84, L4_85
  L1_82 = {}
  L2_83 = db
  L2_83 = L2_83.getRow
  L3_84 = "radiusClient"
  L4_85 = "_ROWID_"
  L2_83 = L2_83(L3_84, L4_85, "1")
  L3_84 = db
  L3_84 = L3_84.getRow
  L4_85 = "radiusClient"
  L3_84 = L3_84(L4_85, "_ROWID_", "2")
  L4_85 = resTab
  L4_85 = L4_85.insertField
  L4_85(L1_82, "Authentication_Server_IP_Address(Primary)", L2_83["radiusClient.authserver"])
  L4_85 = resTab
  L4_85 = L4_85.insertField
  L4_85(L1_82, "Authentication_Server_IP_Address(Secondary)", L3_84["radiusClient.authserver"])
  L4_85 = resTab
  L4_85 = L4_85.insertField
  L4_85(L1_82, "Authentication Port", L2_83["radiusClient.authport"])
  L4_85 = L2_83["radiusClient.authsecret"]
  L4_85 = string.gsub(L4_85, ".", "*")
  resTab.insertField(L1_82, "Secret", L4_85)
  resTab.insertField(L1_82, "Timeout", L2_83["radiusClient.authtimeout"])
  resTab.insertField(L1_82, "Retries", L2_83["radiusClient.authretries"])
  printLabel("Radius Configuration")
  resTab.print(L1_82, 0)
end
function dot11wpsGet(A0_86)
  local L1_87
  L1_87 = {}
  if db.getRow("dot11WPS", "_ROWID_", "1") == nil then
    printCLIError("WPS not configured")
  else
    resTab.insertField(L1_87, "Access Point Name", db.getRow("dot11WPS", "_ROWID_", "1")["dot11WPS.vapName"])
    if db.getRow("dot11WPS", "_ROWID_", "1")["dot11WPS.wpsEnabled"] == "1" then
      resTab.insertField(L1_87, "WPS Enabled", "Y")
    else
      resTab.insertField(L1_87, "WPS Enabled", "N")
    end
    resTab.print(L1_87, 0)
  end
end
function dot11wdsGet(A0_88)
  local L1_89, L2_90, L3_91, L4_92, L5_93, L6_94, L7_95, L8_96, L9_97
  L1_89 = A0_88[1]
  L2_90 = db
  L2_90 = L2_90.getRow
  L3_91 = "dot11Radio"
  L4_92 = "_ROWID_"
  L5_93 = L1_89
  L2_90 = L2_90(L3_91, L4_92, L5_93)
  if L2_90 == nil then
    L3_91 = printCLIError
    L4_92 = "Invalid Radio Number"
    L3_91(L4_92)
    return
  end
  L3_91 = {}
  L4_92 = printLabel
  L5_93 = "WDS Settings"
  L4_92(L5_93)
  L4_92 = nil
  L5_93 = L2_90["dot11Radio.wdsEnabled"]
  if L5_93 == "1" then
    L4_92 = "Enabled"
  else
    L4_92 = "Disabled"
  end
  L5_93 = resTab
  L5_93 = L5_93.insertField
  L6_94 = L3_91
  L7_95 = "WDS Status"
  L8_96 = L4_92
  L5_93(L6_94, L7_95, L8_96)
  L5_93 = L2_90["dot11Radio.wdsPskPassAscii"]
  if L5_93 ~= nil then
    L5_93 = resTab
    L5_93 = L5_93.insertField
    L6_94 = L3_91
    L7_95 = "PSK Key"
    L8_96 = L2_90["dot11Radio.wdsPskPassAscii"]
    L5_93(L6_94, L7_95, L8_96)
  end
  L5_93 = ""
  L6_94 = io
  L6_94 = L6_94.popen
  L7_95 = "ifconfig wifi0 | grep 'HWaddr' | cut -d' ' -f 10"
  L6_94 = L6_94(L7_95)
  L5_93 = L6_94
  L6_94 = ""
  L8_96 = L5_93
  L7_95 = L5_93.read
  L9_97 = "*all"
  L7_95 = L7_95(L8_96, L9_97)
  L9_97 = L5_93
  L8_96 = L5_93.close
  L8_96(L9_97)
  if L7_95 then
    L8_96 = string
    L8_96 = L8_96.gsub
    L9_97 = L7_95
    L8_96 = L8_96(L9_97, "%-00%-00%-00%-00%-00%-00%-00%-00%-00%-00", "")
    L6_94 = L8_96
    L8_96 = string
    L8_96 = L8_96.gsub
    L9_97 = L6_94
    L8_96 = L8_96(L9_97, "%-", ":")
    L6_94 = L8_96
  end
  L8_96 = resTab
  L8_96 = L8_96.insertField
  L9_97 = L3_91
  L8_96(L9_97, "Radio Mac", L6_94)
  L8_96 = resTab
  L8_96 = L8_96.print
  L9_97 = L3_91
  L8_96(L9_97, 0)
  L8_96 = {}
  L3_91 = L8_96
  L8_96 = "radioNo='"
  L9_97 = L1_89
  L8_96 = L8_96 .. L9_97 .. "'"
  L9_97 = db
  L9_97 = L9_97.getRowsWhere
  L9_97 = L9_97("dot11WDSPeers", L8_96)
  for _FORV_13_, _FORV_14_ in pairs(L9_97) do
    resTab.insertField(L3_91, "mac address", _FORV_14_["dot11WDSPeers.macAddress"])
  end
  printLabel("List of MAC Address")
  resTab.print(L3_91, 0)
end
function dot11ACLGet(A0_98)
  local L1_99, L2_100, L3_101, L4_102, L5_103, L6_104
  L1_99 = A0_98[1]
  L2_100 = ""
  L3_101 = {}
  L4_102 = "vapName = '"
  L5_103 = L1_99
  L6_104 = "'"
  L4_102 = L4_102 .. L5_103 .. L6_104
  L5_103 = printLabel
  L6_104 = "Default ACL Policy"
  L5_103(L6_104)
  L5_103 = db
  L5_103 = L5_103.getAttribute
  L6_104 = "dot11VAP"
  L5_103 = L5_103(L6_104, "dot11VAP.vapName", L1_99, "defACLPolicy")
  L6_104 = resTab
  L6_104 = L6_104.insertField
  L6_104(L3_101, "ACL Policy Status", L5_103)
  L6_104 = resTab
  L6_104 = L6_104.print
  L6_104(L3_101, L5_103)
  L6_104 = {}
  L3_101 = L6_104
  L6_104 = db
  L6_104 = L6_104.getRowsWhere
  L6_104 = L6_104("dot11ACL", L4_102)
  for _FORV_10_, _FORV_11_ in pairs(L6_104) do
    resTab.insertField(L3_101, "mac address", _FORV_11_["dot11ACL.macAddress"])
    resTab.insertField(L3_101, "row id", _FORV_11_["dot11ACL._ROWID_"])
  end
  printLabel("List of MAC Address")
  resTab.print(L3_101, 0)
end
function dot11WirelessGet(A0_105)
  local L1_106, L2_107, L3_108, L4_109, L5_110, L6_111, L7_112, L8_113, L9_114, L10_115, L11_116, L12_117, L13_118, L14_119, L15_120, L16_121, L17_122, L18_123, L19_124, L20_125, L21_126
  L1_106 = {}
  L2_107 = printLabel
  L2_107(L3_108)
  L2_107 = db
  L2_107 = L2_107.getRowsWhere
  L2_107 = L2_107(L3_108, L4_109)
  for L6_111, L7_112 in L3_108(L4_109) do
    L8_113 = L7_112["dot11VAP.vapName"]
    L8_113 = L8_113 or ""
    L9_114 = db
    L9_114 = L9_114.getRowsWithJoin
    L9_114 = L9_114(L10_115, L11_116, L12_117)
    for L13_118, L14_119 in L10_115(L11_116) do
      L15_120 = db
      L15_120 = L15_120.getRowsWhere
      L19_124 = "'"
      L15_120 = L15_120(L16_121, L17_122)
      for L19_124, L20_125 in L16_121(L17_122) do
        L21_126 = L14_119["dot11VAP.vapName"]
        L20_125["dot11VAP.vapName"] = L21_126
        L21_126 = L14_119["dot11Interface.radioNo"]
        L20_125["dot11Interface.radioNo"] = L21_126
        L21_126 = dot11
        L21_126 = L21_126.STA_connectedTime
        L21_126 = L21_126(L20_125["dot11STA.timeConnected"])
        if db.getAttribute("dot11Radio", "radioNo", L20_125["dot11Interface.radioNo"], "band") == "b" then
          L20_125["dot11Interface.radioNo"] = "2.4 Ghz"
        elseif db.getAttribute("dot11Radio", "radioNo", L20_125["dot11Interface.radioNo"], "band") == "a" then
          L20_125["dot11Interface.radioNo"] = "5 Ghz"
        end
        resTab.insertField(L1_106, "AP Name", L20_125["dot11VAP.vapName"] or "")
        resTab.insertField(L1_106, "MAC Address", L20_125["dot11STA.macAddress"] or "")
        resTab.insertField(L1_106, "Radio", L20_125["dot11Interface.radioNo"] or "")
        resTab.insertField(L1_106, "Security", L20_125["dot11STA.security"] or "")
        resTab.insertField(L1_106, "Authentication", L20_125["dot11STA.authentication"] or "")
        resTab.insertField(L1_106, "Time Connected", L21_126)
      end
    end
  end
  L3_108(L4_109, L5_110)
end
function dot11accesspointGet(A0_127)
  local L1_128, L2_129, L3_130, L4_131, L5_132, L6_133, L7_134, L8_135, L9_136, L10_137, L11_138, L12_139, L13_140, L14_141, L15_142, L16_143
  L1_128 = {}
  L2_129 = {}
  L3_130 = db
  L3_130 = L3_130.getRowsWithJoin
  L3_130 = L3_130(L4_131, L5_132, L6_133)
  for L7_134, L8_135 in L4_131(L5_132) do
    L9_136 = db
    L9_136 = L9_136.getRow
    L10_137 = "interfaceStats"
    L9_136 = L9_136(L10_137, L11_138, L12_139)
    L10_137 = A0_127[1]
    L9_136["dot11VAP.vapName"] = L10_137
    L10_137 = L8_135["dot11Interface.radioNo"]
    L9_136["dot11Interface.radioNo"] = L10_137
    L10_137 = L8_135["dot11Interface._ROWID_"]
    L9_136["dot11Interface.rowid"] = L10_137
    L10_137 = db
    L10_137 = L10_137.getAttribute
    L14_141 = "band"
    L10_137 = L10_137(L11_138, L12_139, L13_140, L14_141)
    if L10_137 == "b" then
      L9_136["dot11Interface.radioNo"] = "2.4 Ghz"
    elseif L10_137 == "a" then
      L9_136["dot11Interface.radioNo"] = "5 Ghz"
    end
    L14_141 = L9_136["dot11VAP.vapName"]
    L14_141 = L14_141 or ""
    L11_138(L12_139, L13_140, L14_141)
    L14_141 = L9_136["dot11Interface.radioNo"]
    L14_141 = L14_141 or ""
    L11_138(L12_139, L13_140, L14_141)
    L14_141 = L9_136["interfaceStats.rx_packets"]
    L14_141 = L14_141 or ""
    L11_138(L12_139, L13_140, L14_141)
    L14_141 = L9_136["interfaceStats.tx_packets"]
    L14_141 = L14_141 or ""
    L11_138(L12_139, L13_140, L14_141)
    L14_141 = L9_136["interfaceStats.rx_bytes"]
    L14_141 = L14_141 or ""
    L11_138(L12_139, L13_140, L14_141)
    L14_141 = L9_136["interfaceStats.tx_bytes"]
    L14_141 = L14_141 or ""
    L11_138(L12_139, L13_140, L14_141)
    L14_141 = L9_136["interfaceStats.rx_errors"]
    L14_141 = L14_141 or ""
    L11_138(L12_139, L13_140, L14_141)
    L14_141 = L9_136["interfaceStats.tx_errors"]
    L14_141 = L14_141 or ""
    L11_138(L12_139, L13_140, L14_141)
    L14_141 = L9_136["interfaceStats.rx_dropped"]
    L14_141 = L14_141 or ""
    L11_138(L12_139, L13_140, L14_141)
    L14_141 = L9_136["interfaceStats.tx_dropped"]
    L14_141 = L14_141 or ""
    L11_138(L12_139, L13_140, L14_141)
    L14_141 = L9_136["interfaceStats.multicast"]
    L14_141 = L14_141 or ""
    L11_138(L12_139, L13_140, L14_141)
    L14_141 = L9_136["interfaceStats.collisions"]
    L14_141 = L14_141 or ""
    L11_138(L12_139, L13_140, L14_141)
  end
  L4_131(L5_132)
  L4_131(L5_132, L6_133)
  L4_131(L5_132)
  for L8_135, L9_136 in L5_132(L6_133) do
    L10_137 = db
    L10_137 = L10_137.getRowsWhere
    L14_141 = "'"
    L10_137 = L10_137(L11_138, L12_139)
    for L14_141, L15_142 in L11_138(L12_139) do
      L16_143 = L9_136["dot11Interface.radioNo"]
      L15_142["dot11Interface.radioNo"] = L16_143
      L16_143 = dot11
      L16_143 = L16_143.STA_connectedTime
      L16_143 = L16_143(L15_142["dot11STA.timeConnected"])
      if db.getAttribute("dot11Radio", "radioNo", L15_142["dot11Interface.radioNo"], "band") == "b" then
        L15_142["dot11Interface.radioNo"] = "2.4 Ghz"
      elseif db.getAttribute("dot11Radio", "radioNo", L15_142["dot11Interface.radioNo"], "band") == "a" then
        L15_142["dot11Interface.radioNo"] = "5 Ghz"
      end
      resTab.insertField(L2_129, "MAC Address", L15_142["dot11STA.macAddress"])
      resTab.insertField(L2_129, "Radio", L15_142["dot11Interface.radioNo"])
      resTab.insertField(L2_129, "Security", L15_142["dot11STA.security"])
      resTab.insertField(L2_129, "Encryption", L15_142["dot11STA.cipher"])
      resTab.insertField(L2_129, "Authentication", L15_142["dot11STA.authentication"])
      resTab.insertField(L2_129, "Time Connected", L16_143)
      printLabel(" ")
    end
  end
  L5_132(L6_133, L7_134)
end
function dot11WmmProfileGet(A0_144)
  local L1_145, L2_146, L3_147, L4_148, L5_149, L6_150, L7_151
  L1_145 = A0_144[1]
  L2_146 = db
  L2_146 = L2_146.getRowWhere
  L3_147 = "dot11Profile"
  L2_146 = L2_146(L3_147, L4_148, L5_149)
  if L2_146 == nil then
    L3_147 = printCLIError
    L3_147(L4_148)
    return
  end
  L3_147 = {}
  L4_148(L5_149)
  L7_151 = L1_145
  L4_148(L5_149, L6_150, L7_151)
  L7_151 = L2_146.qosEnable
  L4_148(L5_149, L6_150, L7_151)
  L7_151 = L2_146.defaultCos
  L4_148(L5_149, L6_150, L7_151)
  L4_148(L5_149, L6_150)
  L4_148(L5_149)
  for L7_151 = 0, 63 do
    resTab.insertField(L3_147, "ip dscp " .. L7_151, L2_146["dscpCosMap" .. L7_151])
  end
  L4_148(L5_149, L6_150)
end
function dot11accesspointallGet(A0_152)
  local L1_153, L2_154, L3_155, L4_156, L5_157, L6_158, L7_159, L8_160, L9_161, L10_162
  L1_153 = db
  L1_153 = L1_153.getTable
  L2_154 = "dot11VAP"
  L3_155 = "vapName"
  L1_153 = L1_153(L2_154, L3_155, L4_156)
  L2_154 = 0
  L3_155 = printLabel
  L3_155(L4_156)
  L3_155 = {}
  for L7_159, L8_160 in L4_156(L5_157) do
    L2_154 = L2_154 + 1
    L9_161 = L1_153[L2_154]
    L10_162 = db
    L10_162 = L10_162.getRowsWithJoin
    L10_162 = L10_162({
      "dot11VAP:dot11Interface:vapName"
    }, "dot11VAP.vapName", L9_161["dot11VAP.vapName"])
    for _FORV_14_, _FORV_15_ in pairs(L10_162) do
      db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_15_["dot11Interface.interfaceName"])["dot11VAP.vapName"] = L9_161["dot11VAP.vapName"]
      db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_15_["dot11Interface.interfaceName"])["dot11Interface.radioNo"] = _FORV_15_["dot11Interface.radioNo"]
      db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_15_["dot11Interface.interfaceName"])["dot11Interface.rowid"] = _FORV_15_["dot11Interface._ROWID_"]
      if db.getAttribute("dot11Radio", "radioNo", db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_15_["dot11Interface.interfaceName"])["dot11Interface.radioNo"], "band") == "b" then
        db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_15_["dot11Interface.interfaceName"])["dot11Interface.radioNo"] = "2.4 Ghz"
      elseif db.getAttribute("dot11Radio", "radioNo", db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_15_["dot11Interface.interfaceName"])["dot11Interface.radioNo"], "band") == "a" then
        db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_15_["dot11Interface.interfaceName"])["dot11Interface.radioNo"] = "5 Ghz"
      end
      resTab.insertField(L3_155, "AP Name", db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_15_["dot11Interface.interfaceName"])["dot11VAP.vapName"] or "")
      resTab.insertField(L3_155, "Radio", db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_15_["dot11Interface.interfaceName"])["dot11Interface.radioNo"] or "")
      resTab.insertField(L3_155, "PktRx", db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_15_["dot11Interface.interfaceName"])["interfaceStats.rx_packets"] or "")
      resTab.insertField(L3_155, "PktTx", db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_15_["dot11Interface.interfaceName"])["interfaceStats.tx_packets"] or "")
      resTab.insertField(L3_155, "ByteRx", db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_15_["dot11Interface.interfaceName"])["interfaceStats.rx_bytes"] or "")
      resTab.insertField(L3_155, "ByteTx", db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_15_["dot11Interface.interfaceName"])["interfaceStats.tx_bytes"] or "")
      resTab.insertField(L3_155, "ErrRx", db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_15_["dot11Interface.interfaceName"])["interfaceStats.rx_errors"] or "")
      resTab.insertField(L3_155, "ErrTx", db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_15_["dot11Interface.interfaceName"])["interfaceStats.tx_errors"] or "")
      resTab.insertField(L3_155, "DropRx", db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_15_["dot11Interface.interfaceName"])["interfaceStats.rx_dropped"] or "")
      resTab.insertField(L3_155, "DropTx", db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_15_["dot11Interface.interfaceName"])["interfaceStats.tx_dropped"] or "")
      resTab.insertField(L3_155, "MCast", db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_15_["dot11Interface.interfaceName"])["interfaceStats.multicast"] or "")
      resTab.insertField(L3_155, "#coll", db.getRow("interfaceStats", "interfaceStats.interfaceName", _FORV_15_["dot11Interface.interfaceName"])["interfaceStats.collisions"] or "")
    end
  end
  L4_156(L5_157, L6_158)
end
