local L0_0
L0_0 = require
L0_0("teamf1lualib/time")
L0_0 = require
L0_0("teamf1lualib/wireless_accessPoints")
L0_0 = "/flash/tmp/lm/freeTrial"
freeTrialFile = L0_0
L0_0 = "/flash/tmp/lm/freeTrialTime"
freeTrialTimeFile = L0_0
L0_0 = "/flash/tmp/lm/activation_keys"
activationFile = L0_0
L0_0 = require
L0_0 = L0_0("com.teamf1.core.wireless.accesspoints")
function timeConfigInputVal(A0_1)
  local L1_2, L2_3, L3_4, L4_5
  L1_2 = db
  L1_2 = L1_2.getRow
  L2_3 = "ntp"
  L3_4 = "_ROWID_"
  L4_5 = "1"
  L1_2 = L1_2(L2_3, L3_4, L4_5)
  L2_3, L3_4 = nil, nil
  L4_5 = io
  L4_5 = L4_5.open
  L4_5 = L4_5(freeTrialTimeFile, "r")
  if io.open(activationFile, "r") ~= nil then
    if io.open(activationFile, "r"):read("*line") ~= nil and io.open(activationFile, "r"):read("*line") ~= "" then
      printCLIError("WCF License activated. Not allowed to change " .. "Date and Time.")
      return false
    elseif L4_5 ~= nil then
      L3_4 = L4_5:read("*line")
      L2_3 = os.time()
      if tonumber(L3_4) >= tonumber(L2_3) then
        if A0_1["ntp.enabled"] ~= L1_2["ntp.enabled"] or A0_1["ntp.autoDaylight"] ~= L1_2["ntp.autoDaylight"] or A0_1["ntp.useDefServers"] ~= L1_2["ntp.useDefServers"] or A0_1["ntp.reSyncNtpVal"] ~= L1_2["ntp.reSyncNtpVal"] then
          printCLIError("WCF License activated. Not allowed to change " .. "Date and Time.")
          return false
        end
      elseif tonumber(L3_4) ~= 1 and tonumber(L3_4) <= tonumber(L2_3) then
        L4_5:close()
        L4_5 = io.open(freeTrialTimeFile, "w")
        if L4_5 ~= nil then
          L4_5:write("1")
        else
          printCLIError("WCF License activated. Not allowed to " .. "change Date and Time.")
        end
      end
    end
    io.open(activationFile, "r"):close()
  end
  if L4_5 then
    L4_5:close()
  end
  if A0_1["ntp.enabled"] == "0" and (A0_1["ntp.year"] == nil or A0_1["ntp.month"] == nil or A0_1["ntp.date"] == nil or A0_1["ntp.hours"] == nil or A0_1["ntp.minutes"] == nil or A0_1["ntp.seconds"] == nil) then
    printCLIError("Please provide a valid values for year/month/day/hours/minutes/seconds.")
    return false
  end
  if A0_1["ntp.enabled"] == "1" and (A0_1["ntp.year"] ~= nil or A0_1["ntp.month"] ~= nil or A0_1["ntp.date"] ~= nil or A0_1["ntp.hours"] ~= nil or A0_1["ntp.minutes"] ~= nil or A0_1["ntp.seconds"] ~= nil) then
    printCLIError("NTP servers ENABLED,can't modify year/month/day/hours/minutes/seconds parameters")
    return false
  end
  return true
end
function timeConfigSave(A0_6)
  local L1_7, L2_8, L3_9, L4_10, L5_11, L6_12, L7_13, L8_14, L9_15, L10_16, L11_17, L12_18, L13_19, L14_20, L15_21, L16_22, L17_23, L18_24, L19_25, L20_26, L21_27, L22_28, L23_29, L24_30, L25_31, L26_32, L27_33, L28_34
  L1_7 = "manualTime"
  DBTable = L1_7
  L1_7 = "ERROR"
  L2_8 = ""
  L3_9 = ""
  L4_10 = {}
  L5_11 = {}
  L6_12 = 1
  L7_13 = db
  L7_13 = L7_13.getRow
  L8_14 = "manualTime"
  L9_15 = "manualTime._ROWID_"
  L10_16 = L6_12
  L7_13 = L7_13(L8_14, L9_15, L10_16)
  L5_11 = L7_13
  L7_13 = A0_6["ntp.enabled"]
  if L7_13 == "0" then
    L7_13 = UNIT_NAME
    if L7_13 ~= "DSR-250N" then
      L7_13 = UNIT_NAME
      if L7_13 ~= "DSR-250" then
        L7_13 = UNIT_NAME
        if L7_13 ~= "DSR-150N" then
          L7_13 = UNIT_NAME
        end
      end
    else
      if L7_13 == "DSR-150" then
        L7_13 = os
        L7_13 = L7_13.execute
        L8_14 = "date -s"
        L9_15 = " "
        L10_16 = A0_6["ntp.year"]
        L14_20 = A0_6["ntp.date"]
        L15_21 = "-"
        L16_22 = A0_6["ntp.hours"]
        L17_23 = ":"
        L18_24 = A0_6["ntp.minutes"]
        L19_25 = ":"
        L20_26 = A0_6["ntp.seconds"]
        L8_14 = L8_14 .. L9_15 .. L10_16 .. L11_17 .. L12_18 .. L13_19 .. L14_20 .. L15_21 .. L16_22 .. L17_23 .. L18_24 .. L19_25 .. L20_26
        L7_13 = L7_13(L8_14)
    end
    else
      L7_13 = UNIT_NAME
      if "DSR-1000AC" ~= L7_13 then
        L7_13 = UNIT_NAME
        if "DSR-500AC" ~= L7_13 then
          L7_13 = PRODUCT_ID
          if "DSR-1000_Bx" ~= L7_13 then
            L7_13 = PRODUCT_ID
          end
        end
      else
        if "DSR-500_Bx" == L7_13 then
          L7_13 = os
          L7_13 = L7_13.execute
          L8_14 = "date -s"
          L9_15 = " "
          L10_16 = A0_6["ntp.year"]
          L14_20 = A0_6["ntp.date"]
          L15_21 = "-"
          L16_22 = A0_6["ntp.hours"]
          L17_23 = ":"
          L18_24 = A0_6["ntp.minutes"]
          L19_25 = ":"
          L20_26 = A0_6["ntp.seconds"]
          L8_14 = L8_14 .. L9_15 .. L10_16 .. L11_17 .. L12_18 .. L13_19 .. L14_20 .. L15_21 .. L16_22 .. L17_23 .. L18_24 .. L19_25 .. L20_26
          L7_13 = L7_13(L8_14)
          L8_14 = os
          L8_14 = L8_14.execute
          L9_15 = "setRtcTime"
          L10_16 = " "
          L14_20 = " "
          L15_21 = A0_6["ntp.month"]
          L16_22 = " "
          L17_23 = A0_6["ntp.year"]
          L18_24 = " "
          L19_25 = A0_6["ntp.hours"]
          L20_26 = " "
          L21_27 = A0_6["ntp.minutes"]
          L22_28 = " "
          L23_29 = A0_6["ntp.seconds"]
          L24_30 = " "
          L25_31 = A0_6["ntp.timezone"]
          L26_32 = " "
          L27_33 = A0_6["ntp.autoDaylight"]
          L9_15 = L9_15 .. L10_16 .. L11_17 .. L12_18 .. L13_19 .. L14_20 .. L15_21 .. L16_22 .. L17_23 .. L18_24 .. L19_25 .. L20_26 .. L21_27 .. L22_28 .. L23_29 .. L24_30 .. L25_31 .. L26_32 .. L27_33
          L8_14 = L8_14(L9_15)
          L7_13 = L8_14
      end
      else
        L7_13 = os
        L7_13 = L7_13.execute
        L8_14 = "date -s"
        L9_15 = " "
        L10_16 = A0_6["ntp.month"]
        L14_20 = A0_6["ntp.year"]
        L15_21 = "."
        L16_22 = A0_6["ntp.seconds"]
        L8_14 = L8_14 .. L9_15 .. L10_16 .. L11_17 .. L12_18 .. L13_19 .. L14_20 .. L15_21 .. L16_22
        L7_13 = L7_13(L8_14)
        L8_14 = os
        L8_14 = L8_14.execute
        L9_15 = "setRtcTime"
        L10_16 = " "
        L14_20 = " "
        L15_21 = A0_6["ntp.month"]
        L16_22 = " "
        L17_23 = A0_6["ntp.year"]
        L18_24 = " "
        L19_25 = A0_6["ntp.hours"]
        L20_26 = " "
        L21_27 = A0_6["ntp.minutes"]
        L22_28 = " "
        L23_29 = A0_6["ntp.seconds"]
        L24_30 = " "
        L25_31 = A0_6["ntp.timezone"]
        L26_32 = " "
        L27_33 = A0_6["ntp.autoDaylight"]
        L9_15 = L9_15 .. L10_16 .. L11_17 .. L12_18 .. L13_19 .. L14_20 .. L15_21 .. L16_22 .. L17_23 .. L18_24 .. L19_25 .. L20_26 .. L21_27 .. L22_28 .. L23_29 .. L24_30 .. L25_31 .. L26_32 .. L27_33
        L8_14 = L8_14(L9_15)
        L7_13 = L8_14
      end
    end
    L7_13 = A0_6["ntp.enabled"]
    L4_10["ntp.enabled"] = L7_13
    L7_13 = A0_6["ntp.autoDaylight"]
    L4_10["ntp.autoDaylight"] = L7_13
    L7_13 = A0_6["ntp.timezone"]
    L4_10["ntp.timezone"] = L7_13
    L7_13 = time
    L7_13 = L7_13.ntp_config
    L8_14 = L4_10
    L9_15 = "1"
    L10_16 = "edit"
    L8_14 = L7_13(L8_14, L9_15, L10_16)
    L2_8 = L8_14
    L1_7 = L7_13
    if L1_7 ~= "OK" then
      L7_13 = printCLIError
      L8_14 = "NTP table update failed,ntp.enabled FALSE!!!"
      L7_13(L8_14)
      L7_13 = false
      return L7_13
    end
    L5_11["manualTime.ManualTimeStatus"] = 1
  else
    L7_13 = A0_6["ntp.enabled"]
    if L7_13 == "1" then
      L7_13 = time
      L7_13 = L7_13.ntp_config
      L8_14 = A0_6
      L9_15 = "1"
      L10_16 = "edit"
      L8_14 = L7_13(L8_14, L9_15, L10_16)
      L2_8 = L8_14
      L1_7 = L7_13
      if L1_7 ~= "OK" then
        L7_13 = printCLIError
        L8_14 = "NTP table update failed,ntp.enabled TRUE!!!"
        L7_13(L8_14)
        L7_13 = false
        return L7_13
      end
      L5_11["manualTime.ManualTimeStatus"] = 0
    end
  end
  L7_13 = A0_6["ntp.timezone"]
  L5_11["manualTime.Timezone"] = L7_13
  L7_13 = A0_6["ntp.autoDaylight"]
  L5_11["manualTime.AutoDaylight"] = L7_13
  L7_13 = time
  L7_13 = L7_13.manualTimeConfig
  L8_14 = L5_11
  L9_15 = L6_12
  L10_16 = "edit"
  L8_14 = L7_13(L8_14, L9_15, L10_16)
  L2_8 = L8_14
  L1_7 = L7_13
  if L1_7 ~= "OK" then
    L7_13 = printCLIError
    L8_14 = "Manual table update failed!!!"
    L7_13(L8_14)
    L7_13 = false
    return L7_13
  end
  if L1_7 == "OK" then
    L7_13 = A0_6["ntp.enabled"]
    if L7_13 == "0" then
      L7_13 = os
      L7_13 = L7_13.execute
      L8_14 = " rm -f /var/timeSynced 2>>/dev/null "
      L7_13(L8_14)
    end
    L7_13 = db
    L7_13 = L7_13.getRowsWhere
    L8_14 = "crontab"
    L9_15 = "command like '%stopStartVapInstance.sh 1%'"
    L10_16 = false
    L7_13 = L7_13(L8_14, L9_15, L10_16)
    if L7_13 ~= nil then
      L8_14 = tonumber
      L9_15 = os
      L9_15 = L9_15.date
      L10_16 = "%H"
      L28_34 = L9_15(L10_16)
      L8_14 = L8_14(L9_15, L10_16, L11_17, L12_18, L13_19, L14_20, L15_21, L16_22, L17_23, L18_24, L19_25, L20_26, L21_27, L22_28, L23_29, L24_30, L25_31, L26_32, L27_33, L28_34, L9_15(L10_16))
      L9_15 = tonumber
      L10_16 = os
      L10_16 = L10_16.date
      L28_34 = L10_16(L11_17)
      L9_15 = L9_15(L10_16, L11_17, L12_18, L13_19, L14_20, L15_21, L16_22, L17_23, L18_24, L19_25, L20_26, L21_27, L22_28, L23_29, L24_30, L25_31, L26_32, L27_33, L28_34, L10_16(L11_17))
      L10_16 = tonumber
      L10_16 = L10_16(L11_17)
      for L14_20, L15_21 in L11_17(L12_18) do
        L16_22 = L7_13[L14_20]
        L16_22 = L16_22["crontab.command"]
        L17_23 = tonumber
        L18_24 = L7_13[L14_20]
        L18_24 = L18_24["crontab.hour"]
        L17_23 = L17_23(L18_24)
        L18_24 = tonumber
        L19_25 = L7_13[L14_20]
        L19_25 = L19_25["crontab.minute"]
        L18_24 = L18_24(L19_25)
        L19_25 = L16_22
        L20_26 = " | /usr/bin/cut -d\" \" -f3"
        L19_25 = L19_25 .. L20_26
        L20_26 = os
        L20_26 = L20_26.execute
        L21_27 = "echo "
        L22_28 = L19_25
        L23_29 = " > /tmp/apname"
        L21_27 = L21_27 .. L22_28 .. L23_29
        L20_26 = L20_26(L21_27)
        L21_27 = io
        L21_27 = L21_27.open
        L22_28 = "/tmp/apname"
        L23_29 = "r"
        L21_27 = L21_27(L22_28, L23_29)
        L22_28 = nil
        if L21_27 ~= nil then
          L24_30 = L21_27
          L23_29 = L21_27.read
          L23_29 = L23_29(L24_30)
          L22_28 = L23_29
        end
        if L22_28 ~= nil then
          L23_29 = "/pfrm2.0/bin/stopStartVapInstance.sh 0 "
          L24_30 = L22_28
          L23_29 = L23_29 .. L24_30
          L24_30 = tonumber
          L25_31 = db
          L25_31 = L25_31.getAttribute
          L26_32 = "crontab"
          L27_33 = "command"
          L28_34 = L23_29
          L28_34 = L25_31(L26_32, L27_33, L28_34, "hour")
          L24_30 = L24_30(L25_31, L26_32, L27_33, L28_34, L25_31(L26_32, L27_33, L28_34, "hour"))
          L25_31 = tonumber
          L26_32 = db
          L26_32 = L26_32.getAttribute
          L27_33 = "crontab"
          L28_34 = "command"
          L28_34 = L26_32(L27_33, L28_34, L23_29, "minute")
          L25_31 = L25_31(L26_32, L27_33, L28_34, L26_32(L27_33, L28_34, L23_29, "minute"))
          L26_32 = tonumber
          L27_33 = L17_23 * 60
          L27_33 = L27_33 + L18_24
          L26_32 = L26_32(L27_33)
          L27_33 = tonumber
          L28_34 = L24_30 * 60
          L28_34 = L28_34 + L25_31
          L27_33 = L27_33(L28_34)
          L28_34 = db
          L28_34 = L28_34.getAttribute
          L28_34 = L28_34("dot11VAP", "vapName", L22_28, "_ROWID_")
          if L10_16 > L26_32 and L10_16 < L27_33 then
            db.setAttribute("dot11VAP", "vapName", L22_28, "vapEnabled", "1")
            _UPVALUE0_.vapEnableSet(L28_34, true)
          else
            db.setAttribute("dot11VAP", "vapName", L22_28, "vapEnabled", "0")
            _UPVALUE0_.vapEnableSet(L28_34, false)
          end
        end
      end
    end
    L8_14 = db
    L8_14 = L8_14.save
    L8_14()
  end
  L7_13 = db
  L7_13 = L7_13.getAttribute
  L8_14 = "stringsMap"
  L9_15 = "stringId"
  L10_16 = L2_8
  L7_13 = L7_13(L8_14, L9_15, L10_16, L11_17)
  L3_9 = L7_13 or L2_8
  L7_13 = L1_7
  L8_14 = L3_9
  return L7_13, L8_14
end
function timeConfigInit(A0_35)
  local L1_36, L2_37
  L1_36 = {}
  L2_37 = 1
  L1_36 = db.getRow("ntp", "ntp._ROWID_", L2_37)
  return L2_37, L1_36
end
