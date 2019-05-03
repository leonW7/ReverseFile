require("teamf1lualib/ifDev")
require("teamf1lualib/dot11")
require("teamf1lualib/vlan")
require("teamf1lualib/crontab")
require("teamf1lualib/bridgeLib")
dot11 = {}
function dot11.VAP_config(A0_0, A1_1, A2_2, A3_3)
  local L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20
  L4_4 = ACCESS_LEVEL
  if L4_4 ~= 0 then
    L4_4 = "ACCESS_DENIED"
    L5_5 = "10187"
    return L4_4, L5_5
  end
  L4_4 = db
  L4_4 = L4_4.existsRowWhere
  L5_5 = "dot11VAP"
  L6_6 = "profileName = '"
  L7_7 = A0_0["dot11VAP.profileName"]
  L8_8 = "'"
  L6_6 = L6_6 .. L7_7 .. L8_8
  L4_4 = L4_4(L5_5, L6_6)
  if L4_4 and L4_4 ~= A1_1 then
    L5_5 = "ERROR"
    L6_6 = "11873"
    return L5_5, L6_6
  end
  if not A3_3 then
    L5_5 = db
    L5_5 = L5_5.beginTransaction
    L5_5()
  end
  L5_5 = false
  L6_6 = {}
  L7_7 = A0_0["crontab.startMeridian"]
  if L7_7 == "1" then
    L7_7 = tonumber
    L8_8 = A0_0["crontab.startHour"]
    L7_7 = L7_7(L8_8)
    if L7_7 == 12 then
      L6_6["crontab.hour"] = "12"
    else
      L7_7 = A0_0["crontab.startHour"]
      L7_7 = L7_7 + 12
      L6_6["crontab.hour"] = L7_7
    end
    L7_7 = A0_0["crontab.startMinute"]
    L6_6["crontab.minute"] = L7_7
  else
    L7_7 = tonumber
    L8_8 = A0_0["crontab.startHour"]
    L7_7 = L7_7(L8_8)
    if L7_7 == 12 then
      L6_6["crontab.hour"] = "00"
    else
      L7_7 = A0_0["crontab.startHour"]
      L6_6["crontab.hour"] = L7_7
    end
    L7_7 = A0_0["crontab.startMinute"]
    L6_6["crontab.minute"] = L7_7
  end
  L7_7 = {}
  L8_8 = A0_0["crontab.stopMeridian"]
  if L8_8 == "1" then
    L8_8 = tonumber
    L9_9 = A0_0["crontab.stopHour"]
    L8_8 = L8_8(L9_9)
    if L8_8 == 12 then
      L7_7["crontab.hour"] = "12"
    else
      L8_8 = A0_0["crontab.stopHour"]
      L8_8 = L8_8 + 12
      L7_7["crontab.hour"] = L8_8
    end
    L8_8 = A0_0["crontab.stopMinute"]
    L7_7["crontab.minute"] = L8_8
  else
    L8_8 = tonumber
    L9_9 = A0_0["crontab.stopHour"]
    L8_8 = L8_8(L9_9)
    if L8_8 == 12 then
      L7_7["crontab.hour"] = "00"
    else
      L8_8 = A0_0["crontab.stopHour"]
      L7_7["crontab.hour"] = L8_8
    end
    L8_8 = A0_0["crontab.stopMinute"]
    L7_7["crontab.minute"] = L8_8
  end
  L8_8 = A0_0["crontab.unit"]
  L6_6["crontab.unit"] = L8_8
  L8_8 = A0_0["crontab.unit"]
  L7_7["crontab.unit"] = L8_8
  L8_8 = A0_0["crontab.unit"]
  if L8_8 == "2" then
    L8_8 = tonumber
    L9_9 = os
    L9_9 = L9_9.date
    L10_10 = "%H"
    L20_20 = L9_9(L10_10)
    L8_8 = L8_8(L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L9_9(L10_10))
    L9_9 = tonumber
    L10_10 = os
    L10_10 = L10_10.date
    L11_11 = "%M"
    L20_20 = L10_10(L11_11)
    L9_9 = L9_9(L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L10_10(L11_11))
    L10_10 = tonumber
    L11_11 = L6_6["crontab.hour"]
    L10_10 = L10_10(L11_11)
    setStrHr = L10_10
    L10_10 = tonumber
    L11_11 = L6_6["crontab.minute"]
    L10_10 = L10_10(L11_11)
    setStrMin = L10_10
    L10_10 = tonumber
    L11_11 = L7_7["crontab.hour"]
    L10_10 = L10_10(L11_11)
    setStpHr = L10_10
    L10_10 = tonumber
    L11_11 = L7_7["crontab.minute"]
    L10_10 = L10_10(L11_11)
    setStpMin = L10_10
    L10_10 = setStrHr
    L10_10 = L10_10 * 60
    L11_11 = setStrMin
    L10_10 = L10_10 + L11_11
    setStrMins = L10_10
    L10_10 = setStpHr
    L10_10 = L10_10 * 60
    L11_11 = setStpMin
    L10_10 = L10_10 + L11_11
    setStpMins = L10_10
    L10_10 = L8_8 * 60
    L10_10 = L10_10 + L9_9
    curMins = L10_10
    L10_10 = curMins
    L11_11 = setStrMins
    if L10_10 > L11_11 then
      L10_10 = curMins
      L11_11 = setStpMins
      if L10_10 < L11_11 then
        A0_0["dot11VAP.vapEnabled"] = "1"
      end
    else
      A0_0["dot11VAP.vapEnabled"] = "0"
    end
    L10_10 = A0_0["crontab.scheduleControl"]
    if L10_10 == "1" then
      L10_10 = A0_0["dot11VAP.vapEnabled"]
      if L10_10 == "1" then
        A0_0["dot11VAP.vapEnabled"] = "0"
      else
        A0_0["dot11VAP.vapEnabled"] = "1"
      end
    end
  elseif A1_1 == "-1" then
    A0_0["dot11VAP.vapEnabled"] = "1"
  else
    L8_8 = db
    L8_8 = L8_8.getAttribute
    L9_9 = "dot11VAP"
    L10_10 = "dot11VAP._ROWID_"
    L11_11 = A1_1
    L12_12 = "vapEnabled"
    L8_8 = L8_8(L9_9, L10_10, L11_11, L12_12)
    A0_0["dot11VAP.vapEnabled"] = L8_8
  end
  L8_8 = ""
  L9_9 = "/pfrm2.0/bin/stopStartVapInstance.sh %d %s"
  if A2_2 == "add" then
    L8_8 = A0_0["dot11VAP.vapName"]
  else
    L10_10 = db
    L10_10 = L10_10.getAttribute
    L11_11 = "dot11VAP"
    L12_12 = "dot11VAP._ROWID_"
    L10_10 = L10_10(L11_11, L12_12, L13_13, L14_14)
    L8_8 = L10_10
    A0_0["dot11VAP.vapName"] = L8_8
  end
  L10_10 = A0_0["crontab.unit"]
  if L10_10 == "2" then
    L10_10 = "/pfrm2.0/bin/ActivePointScheduler.sh"
    L11_11 = A0_0["dot11VAP.vapName"]
    L12_12 = tonumber
    L12_12 = L12_12(L13_13)
    L12_12 = L12_12 * 60
    L12_12 = L12_12 + L13_13
    L16_16 = L11_11
    L20_20 = L13_13
    L15_15["crontab.unit"] = "6"
    L15_15["crontab.interval"] = "5"
    L15_15["crontab.minute"] = "-1"
    L15_15["crontab.hour"] = "-1"
    L15_15["crontab.dayOfMonth"] = "-1"
    L15_15["crontab.month"] = "-1"
    L15_15["crontab.dayOfWeek"] = "-1"
    L16_16 = L14_14 or ""
    L15_15["crontab.command"] = L16_16
    if A2_2 == "add" then
      L16_16 = db
      L16_16 = L16_16.insert
      L16_16(L17_17, L18_18)
    elseif A2_2 == "edit" then
      L16_16 = db
      L16_16 = L16_16.existsRowWhere
      L20_20 = L10_10
      L16_16 = L16_16(L17_17, L18_18, L19_19)
      if L16_16 then
        L16_16 = db
        L16_16 = L16_16.setAttributeWhere
        L20_20 = L10_10
        L20_20 = L14_14
        L16_16(L17_17, L18_18, L19_19, L20_20)
      else
        L16_16 = db
        L16_16 = L16_16.insert
        L16_16(L17_17, L18_18)
      end
    end
  else
    L10_10 = A0_0["dot11VAP.vapName"]
    L11_11 = db
    L11_11 = L11_11.deleteRowWhere
    L12_12 = "crontab"
    L11_11(L12_12, L13_13)
    L11_11 = db
    L11_11 = L11_11.deleteRowWhere
    L12_12 = "crontab"
    L11_11(L12_12, L13_13)
  end
  L10_10 = string
  L10_10 = L10_10.format
  L11_11 = L9_9
  L12_12 = 1
  L10_10 = L10_10(L11_11, L12_12, L13_13)
  L11_11 = string
  L11_11 = L11_11.format
  L12_12 = L9_9
  L11_11 = L11_11(L12_12, L13_13, L14_14)
  L12_12 = A0_0["crontab.scheduleControl"]
  if L12_12 == "1" then
    L12_12 = string
    L12_12 = L12_12.format
    L12_12 = L12_12(L13_13, L14_14, L15_15)
    L10_10 = L12_12
    L12_12 = string
    L12_12 = L12_12.format
    L12_12 = L12_12(L13_13, L14_14, L15_15)
    L11_11 = L12_12
  end
  L6_6["crontab.command"] = L10_10
  L7_7["crontab.command"] = L11_11
  L12_12 = db
  L12_12 = L12_12.getRowsWhere
  L16_16 = "'"
  L12_12 = L12_12(L13_13, L14_14)
  if L12_12 then
    if L13_13 > 0 then
      L16_16 = L12_12[1]
      L16_16 = L16_16["crontab.command"]
      L13_13(L14_14, L15_15, L16_16)
      L16_16 = L12_12[2]
      L16_16 = L16_16["crontab.command"]
      L13_13(L14_14, L15_15, L16_16)
    end
  end
  if L13_13 == "2" then
    L5_5 = L13_13
    L5_5 = L5_5 and L13_13
  else
    L5_5 = true
  end
  if L13_13 == "DSR-1000AC" then
    L16_16 = A0_0["dot11VAP.profileName"]
    if L13_13 == "dual" then
      radio = L14_14
      A0_0["dot11VAP.radioList"] = "1,2"
    else
      L16_16 = "band='"
      L16_16 = L16_16 .. L17_17 .. L18_18
      radio = L14_14
      A0_0["dot11VAP.radioList"] = L14_14
    end
  else
    radio = L13_13
  end
  if L13_13 == "DSR-1000AC" and A2_2 == "edit" then
    L16_16 = A0_0["dot11VAP.profileName"]
    L16_16 = "vapName"
    L16_16 = "dot11Profile"
    L16_16 = nil
    if L13_13 ~= L15_15 then
      if L13_13 == "a" then
        L20_20 = L13_13
        L20_20 = "vapName = 'unused' and radioNo='"
        L20_20 = L20_20 .. L17_17 .. "'"
        L16_16 = L18_18
      elseif L13_13 == "b" then
        L20_20 = L13_13
        L20_20 = "vapName = 'unused' and radioNo='"
        L20_20 = L20_20 .. L17_17 .. "'"
        L16_16 = L18_18
      else
        if L15_15 == "a" then
        else
        end
        L20_20 = "band"
        L20_20 = "dot11Interface"
        L16_16 = L19_19
      end
      if L16_16 == nil then
        return L17_17, L18_18
      end
      if L13_13 == "dual" then
        L17_17["dot11Interface.vapName"] = L18_18
        L20_20 = L16_16
        L5_5 = L18_18
      else
        L20_20 = A0_0["dot11VAP.vapName"]
        L18_18["dot11Interface.vapName"] = "unused"
        L20_20 = L18_18
        L5_5 = L19_19
        L18_18["dot11Interface.vapName"] = L19_19
        L20_20 = L18_18
        L5_5 = L19_19
      end
    end
  end
  for L16_16, L17_17 in L13_13(L14_14) do
    L20_20 = "vapName = 'unused' and radioNo='"
    L20_20 = L20_20 .. L17_17["dot11Radio.radioNo"] .. "'"
    if A2_2 == "add" then
      L20_20 = db
      L20_20 = L20_20.getRowsWhere
      L20_20 = L20_20("dot11Interface", "vapName = '" .. A0_0["dot11VAP.vapName"] .. "'")
      L19_19["dot11Interface.vapName"] = A0_0["dot11VAP.vapName"]
      L5_5 = dot11Interface.config(L19_19, L18_18, "edit")
    end
    if A2_2 == "edit" then
      L20_20 = "dot11Profile"
      L20_20 = db
      L20_20 = L20_20.getRowsWithJoin
      L20_20 = L20_20({
        "dot11VAP:dot11Interface:vapName"
      }, "dot11VAP.vapName", L8_8)
      for _FORV_24_, _FORV_25_ in pairs(L20_20) do
        L5_5 = L5_5 and db.setAttributeWhere("VlanPortMgmt", "PhyInterfaceName='" .. _FORV_25_["dot11Interface.interfaceName"] .. "'", "PortName", L19_19)
      end
    end
  end
  if A2_2 == "add" and L5_5 then
    L16_16 = "1"
    L16_16 = "radioNo"
    if not L15_15 then
      A0_0["dot11VAP.txPower"] = L15_15
    end
    if not L15_15 then
      A0_0["dot11VAP.txRate"] = L15_15
    end
    if not L15_15 then
      A0_0["dot11VAP.puren"] = L15_15
    end
  end
  if L5_5 then
    L16_16 = A0_0
    L16_16 = L15_15(L16_16, L17_17, L18_18)
    L5_5 = L15_15
  end
  if L14_14 == "NOUPDATES" then
    if L15_15 == "1" then
      L16_16 = "dot11VAP"
      L20_20 = 1
      L5_5 = L15_15
    end
  end
  if L5_5 then
    if L15_15 == "1" then
      L16_16 = A0_0["dot11VAP.vapName"]
      L5_5 = L15_15
    elseif L15_15 == "0" then
      L16_16 = A0_0["dot11VAP.vapName"]
      L5_5 = L15_15
    end
  end
  if A2_2 == "add" then
    L16_16 = "dot11Profile"
    L16_16 = db
    L16_16 = L16_16.getRowsWithJoin
    L16_16 = L16_16(L17_17, L18_18, L19_19)
    for L20_20, _FORV_21_ in L17_17(L18_18) do
      L5_5 = L5_5 and db.setAttributeWhere("VlanPortMgmt", "PhyInterfaceName='" .. _FORV_21_["dot11Interface.interfaceName"] .. "'", "PortName", L15_15)
    end
  end
  L16_16 = "dot11Profile"
  L16_16 = A0_0["dot11VAP.vapEnabled"]
  if L16_16 == "1" then
    L16_16 = dot11
    L16_16 = L16_16.VAP_vlanPerSSID_config
    L16_16 = L16_16(L17_17, L18_18, L19_19)
    L5_5 = L16_16
  else
    L16_16 = A0_0["dot11VAP.vapEnabled"]
    if L16_16 == "0" then
      L16_16 = dot11
      L16_16 = L16_16.VAP_vlanPerSSID_config
      L16_16 = L16_16(L17_17, L18_18, L19_19)
      L5_5 = L16_16
    end
  end
  if L5_5 then
    if not A3_3 then
      L16_16 = db
      L16_16 = L16_16.commitTransaction
      L16_16()
    end
    L16_16 = "OK"
    return L16_16, L17_17
  else
    if not A3_3 then
      L16_16 = db
      L16_16 = L16_16.rollback
      L16_16()
    end
    L16_16 = "ERROR"
    return L16_16, L17_17
  end
end
function dot11.VAP_ConfigGet(A0_21)
  local L1_22, L2_23
  L1_22 = db
  L1_22 = L1_22.getAttribute
  L2_23 = "dot11VAP"
  L1_22 = L1_22(L2_23, "_ROWID_", A0_21, "vapName")
  L1_22 = L1_22 or ""
  L2_23 = "/pfrm2.0/bin/stopStartVapInstance.sh %d %s"
  if db.getRowsWhere("crontab", "command like '%stopStartVapInstance.sh%" .. L1_22 .. "'")[1] == nil then
    ({})["crontab.startHour"] = ""
    ;({})["crontab.startMinute"] = ""
    ;({})["crontab.startMeridian"] = ""
    ;({})["crontab.unit"] = "0"
  else
    if db.getRowsWhere("crontab", "command like '%stopStartVapInstance.sh%" .. L1_22 .. "'")[1]["crontab.command"] == string.format(L2_23, 1, L1_22) then
      ({})["crontab.scheduleControl"] = "0"
    else
      ({})["crontab.scheduleControl"] = "1"
    end
    ;({})["crontab.unit"] = db.getRowsWhere("crontab", "command like '%stopStartVapInstance.sh%" .. L1_22 .. "'")[1]["crontab.unit"]
    if tonumber(db.getRowsWhere("crontab", "command like '%stopStartVapInstance.sh%" .. L1_22 .. "'")[1]["crontab.hour"]) == 0 then
      ({})["crontab.startMeridian"] = "0"
      ;({})["crontab.startHour"] = "12"
    elseif tonumber(db.getRowsWhere("crontab", "command like '%stopStartVapInstance.sh%" .. L1_22 .. "'")[1]["crontab.hour"]) > 12 then
      ({})["crontab.startMeridian"] = "1"
      ;({})["crontab.startHour"] = tonumber(db.getRowsWhere("crontab", "command like '%stopStartVapInstance.sh%" .. L1_22 .. "'")[1]["crontab.hour"]) - 12
    elseif tonumber(db.getRowsWhere("crontab", "command like '%stopStartVapInstance.sh%" .. L1_22 .. "'")[1]["crontab.hour"]) == 12 then
      ({})["crontab.startMeridian"] = "1"
      ;({})["crontab.startHour"] = "12"
    else
      ({})["crontab.startHour"] = db.getRowsWhere("crontab", "command like '%stopStartVapInstance.sh%" .. L1_22 .. "'")[1]["crontab.hour"]
      ;({})["crontab.startMeridian"] = "0"
    end
    ;({})["crontab.startMinute"] = db.getRowsWhere("crontab", "command like '%stopStartVapInstance.sh%" .. L1_22 .. "'")[1]["crontab.minute"]
  end
  if db.getRowsWhere("crontab", "command like '%stopStartVapInstance.sh%" .. L1_22 .. "'")[2] == nil then
    ({})["crontab.stopHour"] = ""
    ;({})["crontab.stopMinute"] = ""
    ;({})["crontab.stopMeridian"] = ""
    ;({})["crontab.unit"] = "0"
  else
    ({})["crontab.unit"] = db.getRowsWhere("crontab", "command like '%stopStartVapInstance.sh%" .. L1_22 .. "'")[2]["crontab.unit"]
    if tonumber(db.getRowsWhere("crontab", "command like '%stopStartVapInstance.sh%" .. L1_22 .. "'")[2]["crontab.hour"]) == 0 then
      ({})["crontab.stopMeridian"] = "0"
      ;({})["crontab.stopHour"] = "12"
    elseif tonumber(db.getRowsWhere("crontab", "command like '%stopStartVapInstance.sh%" .. L1_22 .. "'")[2]["crontab.hour"]) > 12 then
      ({})["crontab.stopMeridian"] = "1"
      ;({})["crontab.stopHour"] = tonumber(db.getRowsWhere("crontab", "command like '%stopStartVapInstance.sh%" .. L1_22 .. "'")[2]["crontab.hour"]) - 12
    elseif tonumber(db.getRowsWhere("crontab", "command like '%stopStartVapInstance.sh%" .. L1_22 .. "'")[2]["crontab.hour"]) == 12 then
      ({})["crontab.stopMeridian"] = "1"
      ;({})["crontab.stopHour"] = "12"
    else
      ({})["crontab.stopHour"] = db.getRowsWhere("crontab", "command like '%stopStartVapInstance.sh%" .. L1_22 .. "'")[2]["crontab.hour"]
      ;({})["crontab.stopMeridian"] = "0"
    end
    ;({})["crontab.stopMinute"] = db.getRowsWhere("crontab", "command like '%stopStartVapInstance.sh%" .. L1_22 .. "'")[2]["crontab.minute"]
  end
  return {}
end
function dot11.VAP_advConfig(A0_24, A1_25)
  local L2_26, L3_27, L4_28
  L2_26 = ACCESS_LEVEL
  if L2_26 ~= 0 then
    L2_26 = "ACCESS_DENIED"
    L3_27 = "10187"
    return L2_26, L3_27
  end
  L2_26 = db
  L2_26 = L2_26.beginTransaction
  L2_26()
  L2_26 = true
  L3_27 = {}
  L4_28 = db
  L4_28 = L4_28.getAttribute
  L4_28 = L4_28("dot11VAP", "rowid", A1_25, "vapName")
  L2_26 = L2_26 and dot11.VAP_portEnable(L4_28, false)
  L3_27 = util.tableSplit(A0_24, ".", "dot11VAP")
  L2_26 = dot11VAP.config(L3_27, A1_25, "edit")
  L2_26 = L2_26 and dot11.VAP_portEnable(L4_28, true)
  if L2_26 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10189"
  end
end
function dot11.VAP_delete(A0_29)
  local L1_30, L2_31, L3_32, L4_33, L5_34, L6_35, L7_36, L8_37, L9_38, L10_39, L11_40, L12_41, L13_42, L14_43, L15_44, L16_45, L17_46, L18_47
  L1_30 = ACCESS_LEVEL
  if L1_30 ~= 0 then
    L1_30 = "ACCESS_DENIED"
    L2_31 = "10187"
    return L1_30, L2_31
  end
  L1_30 = db
  L1_30 = L1_30.beginTransaction
  L1_30()
  L1_30 = true
  L2_31 = {}
  for L6_35, L7_36 in L3_32(L4_33) do
    L8_37 = db
    L8_37 = L8_37.getRow
    L9_38 = "dot11VAP"
    L10_39 = "dot11VAP._ROWID_"
    L11_40 = L7_36
    L8_37 = L8_37(L9_38, L10_39, L11_40)
    L9_38 = L8_37["dot11VAP.vapName"]
    L10_39 = db
    L10_39 = L10_39.getRow
    L11_40 = "dot11WPS"
    L10_39 = L10_39(L11_40, L12_41, L13_42)
    if L10_39 ~= nil then
      L11_40 = L10_39["dot11WPS.wpsEnabled"]
      if L11_40 == "1" then
        L11_40 = db
        L11_40 = L11_40.rollback
        L11_40()
        L11_40 = "ERROR"
        return L11_40, L12_41
      end
    end
    L11_40 = db
    L11_40 = L11_40.getRows
    L11_40 = L11_40(L12_41, L13_42, L14_43)
    for L15_44, L16_45 in L12_41(L13_42) do
      L17_46 = {}
      L18_47 = db
      L18_47 = L18_47.getAttribute
      L18_47 = L18_47("dot11ACL", "macAddress", L16_45["dot11ACL.macAddress"], "rowid")
      L17_46["dot11ACL._ROWID_"] = L18_47
      L1_30 = dot11ACL.config(L17_46, "-1", "delete")
      if not L1_30 then
        break
      end
    end
    if not L8_37 then
      return L12_41
    end
    L1_30 = L13_42
    L1_30 = L1_30 and L13_42
    L17_46 = "'"
    for L17_46, L18_47 in L14_43(L15_44) do
      L18_47["dot11Interface.vapName"] = "unused"
      dot11Interface.config(L18_47, L18_47["dot11Interface._ROWID_"], "edit")
    end
    L14_43(L15_44, L16_45)
    L17_46 = L9_38
    L18_47 = "%'"
    L14_43(L15_44, L16_45)
    L17_46 = L9_38
    L18_47 = "'"
    L14_43(L15_44, L16_45)
  end
  if L1_30 then
    for L6_35, L7_36 in L3_32(L4_33) do
      L8_37 = {}
      L8_37["dot11VAP._ROWID_"] = L7_36
      L9_38 = dot11VAP
      L9_38 = L9_38.config
      L10_39 = L8_37
      L11_40 = "-1"
      L9_38 = L9_38(L10_39, L11_40, L12_41)
      L1_30 = L9_38
      if not L1_30 then
        break
      end
    end
  end
  if L1_30 then
    for L6_35, L7_36 in L3_32(L4_33) do
      L8_37 = {}
      L8_37["vlan.vlanId"] = L7_36
      L9_38 = vlan
      L9_38 = L9_38.config
      L10_39 = L8_37
      L11_40 = "-1"
      L9_38 = L9_38(L10_39, L11_40, L12_41)
      L1_30 = L9_38
      if not L1_30 then
        break
      end
    end
  end
  if L1_30 then
    L3_32(L4_33)
    return L3_32, L4_33
  else
    L3_32()
    return L3_32, L4_33
  end
end
function dot11.VAP_enable(A0_48, A1_49)
  local L2_50, L3_51, L4_52, L5_53, L6_54, L7_55, L8_56, L9_57, L10_58, L11_59
  L2_50 = ACCESS_LEVEL
  if L2_50 ~= 0 then
    L2_50 = "ACCESS_DENIED"
    return L2_50, L3_51
  end
  L2_50 = db
  L2_50 = L2_50.beginTransaction
  L2_50()
  L2_50 = false
  for L6_54, L7_55 in L3_51(L4_52) do
    L8_56 = ""
    if A1_49 then
      L8_56 = "1"
    else
      L8_56 = "0"
    end
    L9_57 = db
    L9_57 = L9_57.getRow
    L10_58 = "dot11VAP"
    L11_59 = "dot11VAP._ROWID_"
    L9_57 = L9_57(L10_58, L11_59, L7_55)
    if L9_57 ~= nil and L9_57 ~= "" and L9_57 ~= " " then
      if not A1_49 then
        L10_58 = db
        L10_58 = L10_58.getAttribute
        L11_59 = "dot11Profile"
        L10_58 = L10_58(L11_59, "profileName", L9_57["dot11VAP.profileName"], "ssid")
        L11_59 = dot11
        L11_59 = L11_59.VAP_vlanPerSSID_config
        L11_59 = L11_59(L9_57["dot11VAP.vapName"], L10_58, "VAP-DISABLED")
        L2_50 = L11_59
        if L2_50 then
          L11_59 = dot11
          L11_59 = L11_59.VAP_portEnable
          L11_59 = L11_59(L9_57["dot11VAP.vapName"], false)
          L2_50 = L11_59
        end
        if L2_50 then
          L11_59 = db
          L11_59 = L11_59.setAttribute
          L11_59 = L11_59("dot11VAP", "_ROWID_", L7_55, "vapEnabled", L8_56)
          L2_50 = L11_59
        end
        L11_59 = db
        L11_59 = L11_59.getRowsWhere
        L11_59 = L11_59("dot11Interface", "vapName='" .. L9_57["dot11VAP.vapName"] .. "'")
        for _FORV_15_, _FORV_16_ in pairs(L11_59) do
          os.execute("/sbin/ifconfig " .. _FORV_16_["dot11Interface.interfaceName"] .. " down")
        end
      end
      if A1_49 then
        L10_58 = db
        L10_58 = L10_58.setAttribute
        L11_59 = "dot11VAP"
        L10_58 = L10_58(L11_59, "_ROWID_", L7_55, "vapEnabled", L8_56)
        L2_50 = L10_58
        if L2_50 then
          L10_58 = dot11
          L10_58 = L10_58.VAP_portEnable
          L11_59 = L9_57["dot11VAP.vapName"]
          L10_58 = L10_58(L11_59, true)
          L2_50 = L10_58
        end
        L10_58 = db
        L10_58 = L10_58.getAttribute
        L11_59 = "dot11Profile"
        L10_58 = L10_58(L11_59, "profileName", L9_57["dot11VAP.profileName"], "ssid")
        if L2_50 then
          L11_59 = dot11
          L11_59 = L11_59.VAP_vlanPerSSID_config
          L11_59 = L11_59(L9_57["dot11VAP.vapName"], L10_58, "BRIDGE")
          L2_50 = L11_59
        end
      end
    end
  end
  if L2_50 then
    L3_51(L4_52)
    return L3_51, L4_52
  else
    L3_51()
    if A1_49 then
      return L3_51, L4_52
    else
      return L3_51, L4_52
    end
  end
end
function dot11.VAP_portEnable(A0_60, A1_61)
  local L2_62, L3_63, L4_64, L5_65, L6_66, L7_67, L8_68, L9_69, L10_70, L11_71
  L2_62 = true
  if A1_61 then
    L3_63 = "1"
    enStr = L3_63
  else
    L3_63 = "0"
    enStr = L3_63
  end
  L3_63 = db
  L3_63 = L3_63.getRowsWithJoin
  L3_63 = L3_63(L4_64, L5_65, L6_66)
  for L7_67, L8_68 in L4_64(L5_65) do
    if L2_62 then
      L9_69 = L8_68["dot11Interface.interfaceName"]
      L10_70 = db
      L10_70 = L10_70.getAttribute
      L11_71 = "bridgePorts"
      L10_70 = L10_70(L11_71, "interfaceName", L9_69, "rowid")
      L11_71 = {}
      L11_71["bridgePorts.portEnabled"] = enStr
      L2_62 = db.update("bridgePorts", L11_71, L10_70)
    end
  end
  return L2_62
end
function dot11.VAP_vlanPerSSID_config(A0_72, A1_73, A2_74)
  local L3_75, L4_76
  L3_75 = true
  L4_76 = enable
  if L4_76 then
    L4_76 = "1"
    enStr = L4_76
  else
    L4_76 = "0"
    enStr = L4_76
  end
  L4_76 = db
  L4_76 = L4_76.getRowsWithJoin
  L4_76 = L4_76({
    "dot11VAP:dot11Interface:vapName"
  }, "dot11VAP.vapName", A0_72)
  for _FORV_8_, _FORV_9_ in pairs(L4_76) do
    L3_75 = L3_75 and db.setAttributeWhere("VlanPortMgmt", "portName='" .. A1_73 .. "' AND PhyInterfaceName='" .. _FORV_9_["dot11Interface.interfaceName"] .. "'", "PortType", A2_74)
  end
  return L3_75
end
function dot11.VapsOnProfile_portEnable(A0_77, A1_78)
  local L2_79
  L2_79 = db
  L2_79 = L2_79.getRowsWhere
  L2_79 = L2_79("dot11VAP", "vapEnabled = '1' and profileName = '" .. A0_77 .. "'")
  for _FORV_7_, _FORV_8_ in pairs(L2_79) do
    dot11.VAP_portEnable(_FORV_8_["dot11VAP.vapName"], A1_78)
  end
end
function dot11.profile_config(A0_80, A1_81, A2_82)
  local L3_83, L4_84, L5_85, L6_86, L7_87, L8_88, L9_89, L10_90, L11_91, L12_92
  L3_83 = "0"
  L4_84 = db
  L4_84 = L4_84.getAttribute
  L5_85 = "dot11Profile"
  L6_86 = "dot11Profile._ROWID_"
  L4_84 = L4_84(L5_85, L6_86, L7_87, L8_88)
  L5_85 = ACCESS_LEVEL
  if L5_85 ~= 0 then
    L5_85 = "ACCESS_DENIED"
    L6_86 = "10187"
    return L5_85, L6_86
  end
  if A2_82 == "add" or A2_82 == "edit" then
    L5_85 = A0_80["dot11Profile.ssid"]
    if L5_85 ~= nil then
      L5_85 = db
      L5_85 = L5_85.existsRowWhere
      L6_86 = "dot11Profile"
      L5_85 = L5_85(L6_86, L7_87)
      if L5_85 and L5_85 ~= A1_81 then
        L6_86 = "ERROR"
        return L6_86, L7_87
      end
    end
  end
  L5_85 = db
  L5_85 = L5_85.beginTransaction
  L5_85()
  L5_85 = false
  L6_86 = nil
  if A2_82 == "edit" then
    proSec = L7_87
    if L7_87 ~= "WPA" then
    elseif L7_87 == "WPA+WPA2" then
      apRows = L7_87
      if L7_87 ~= 0 then
        for L10_90 = 1, #L8_88 do
          row = L11_91
          L12_92 = "dot11WPS"
          disCheck = L11_91
          if L11_91 ~= nil then
            if L11_91 == "1" then
              if L11_91 ~= "OPEN" then
              elseif L11_91 == "WEP" then
                L12_92 = "11554"
                return L11_91, L12_92
              end
            end
          end
        end
      end
    end
  end
  if A2_82 == "edit" then
    L7_87(L8_88, L9_89)
    L6_86 = L7_87
  end
  if A2_82 == "delete" then
    for L10_90, L11_91 in L7_87(L8_88) do
      L12_92 = db
      L12_92 = L12_92.getAttribute
      L12_92 = L12_92("dot11Profile", "_ROWID_", L11_91, "profileName")
      if db.getRow("dot11VAP", "profileName", L12_92) ~= nil then
        printCLIError("Can't delete , Profile is associated with AP")
        db.rollback()
        return "ERROR", "12090"
      end
    end
  end
  if A2_82 ~= "delete" then
  end
  if L7_87 == "DSR-1000AC" and A2_82 == "edit" then
    if L7_87 ~= nil then
      if L7_87 ~= L8_88 then
        newMode = L8_88
        if L8_88 == "a" then
          L12_92 = "radioNo"
          L12_92 = L8_88
          freeRow = L9_89
        elseif L8_88 == "b" then
          L12_92 = "radioNo"
          L12_92 = L8_88
          freeRow = L9_89
        else
          if L7_87 == "a" then
          else
          end
          L12_92 = L8_88
          L12_92 = "vapName = 'unused' and radioNo='"
          L12_92 = L12_92 .. L9_89 .. "'"
          freeRow = L10_90
        end
        if L8_88 == nil then
          return L8_88, L9_89
        end
        if L8_88 == "dual" then
          L8_88["dot11Interface.vapName"] = L9_89
          L12_92 = "edit"
          L5_85 = L9_89
        else
          L12_92 = "_ROWID_"
          L9_89["dot11Interface.vapName"] = "unused"
          L12_92 = L8_88
          L5_85 = L10_90
          L9_89["dot11Interface.vapName"] = L10_90
          L12_92 = freeRow
          L5_85 = L10_90
        end
      end
    end
  end
  statCd = L8_88
  L5_85 = L7_87
  if L7_87 == "DSR-1000AC" and A2_82 == "edit" then
    if L7_87 ~= nil then
      vapTbl = L7_87
      L7_87(L8_88, L9_89, L10_90, L11_91)
    end
  end
  if L5_85 and A2_82 == "edit" then
    L7_87(L8_88, L9_89)
    vapTable = L7_87
    for L11_91, L12_92 in L8_88(L9_89) do
      row = vapTable[L7_87]
      if row["dot11VAP.profileName"] == L4_84 then
        L3_83 = "1"
      end
    end
    if L3_83 == "1" then
      for L12_92 = 1, #L8_88 do
        row = L8_88[L12_92]
        intName = db.getAttribute("dot11Interface", "vapName", row["dot11VAP.vapName"], "interfaceName")
        L5_85 = db.setAttribute("VlanPortMgmt", "PhyInterfaceName", intName, "portName", A0_80["dot11Profile.ssid"])
      end
    end
  end
  if L5_85 then
    L7_87(L8_88)
    return L7_87, L8_88
  else
    L7_87()
    if L7_87 ~= "" then
      return L7_87, L8_88
    else
      return L7_87, L8_88
    end
  end
end
function dot11.profile_advConfig(A0_93, A1_94)
  local L2_95, L3_96, L4_97, L5_98
  L2_95 = "0"
  L3_96 = db
  L3_96 = L3_96.getAttribute
  L4_97 = "dot11Profile"
  L5_98 = "dot11Profile._ROWID_"
  L3_96 = L3_96(L4_97, L5_98, A1_94, "profileName")
  L4_97 = db
  L4_97 = L4_97.getAttribute
  L5_98 = "dot11Profile"
  L4_97 = L4_97(L5_98, "dot11Profile._ROWID_", A1_94, "ssid")
  L5_98 = ACCESS_LEVEL
  if L5_98 ~= 0 then
    L5_98 = "ACCESS_DENIED"
    return L5_98, "10187"
  end
  L5_98 = dot11
  L5_98 = L5_98.VapsOnProfile_portEnable
  L5_98(L3_96, 0)
  L5_98 = db
  L5_98 = L5_98.beginTransaction
  L5_98()
  L5_98 = false
  L5_98 = dot11Profile.config(A0_93, A1_94, "edit")
  dot11.VapsOnProfile_portEnable(L3_96, 1)
  vapTable = db.getTable("dot11VAP")
  for _FORV_10_, _FORV_11_ in pairs(vapTable) do
    row = vapTable[0 + 1]
    if row["dot11VAP.profileName"] == L3_96 then
      L2_95 = "1"
    end
  end
  if L2_95 == "1" then
    table = db.getRows("dot11VAP", "profileName", L3_96)
    for _FORV_10_ = 1, #table do
      row = table[_FORV_10_]
      intName = db.getAttribute("dot11Interface", "vapName", row["dot11VAP.vapName"], "interfaceName")
      L5_98 = db.setAttribute("VlanPortMgmt", "PhyInterfaceName", intName, "portName", L4_97)
    end
  end
  if L5_98 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10192"
  end
end
function dot11.profile_qosConfig(A0_99, A1_100)
  local L2_101, L3_102, L4_103, L5_104
  L2_101 = "0"
  L3_102 = db
  L3_102 = L3_102.getAttribute
  L4_103 = "dot11Profile"
  L5_104 = "dot11Profile._ROWID_"
  L3_102 = L3_102(L4_103, L5_104, A1_100, "profileName")
  L4_103 = db
  L4_103 = L4_103.getAttribute
  L5_104 = "dot11Profile"
  L4_103 = L4_103(L5_104, "dot11Profile._ROWID_", A1_100, "ssid")
  L5_104 = ACCESS_LEVEL
  if L5_104 ~= 0 then
    L5_104 = "ACCESS_DENIED"
    return L5_104, "10187"
  end
  L5_104 = db
  L5_104 = L5_104.beginTransaction
  L5_104()
  L5_104 = false
  dot11.VapsOnProfile_portEnable(L3_102, 0)
  L5_104 = dot11Profile.config(A0_99, A1_100, "edit")
  dot11.VapsOnProfile_portEnable(L3_102, 1)
  vapTable = db.getTable("dot11VAP")
  for _FORV_10_, _FORV_11_ in pairs(vapTable) do
    row = vapTable[0 + 1]
    if row["dot11VAP.profileName"] == L3_102 then
      L2_101 = "1"
    end
  end
  if L2_101 == "1" then
    table = db.getRows("dot11VAP", "profileName", L3_102)
    for _FORV_10_ = 1, #table do
      row = table[_FORV_10_]
      intName = db.getAttribute("dot11Interface", "vapName", row["dot11VAP.vapName"], "interfaceName")
      L5_104 = db.setAttribute("VlanPortMgmt", "PhyInterfaceName", intName, "portName", L4_103)
    end
  end
  if L5_104 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "11893"
  end
end
function dot11.card_config(A0_105, A1_106, A2_107)
  local L3_108
  L3_108 = ACCESS_LEVEL
  if L3_108 ~= 0 then
    L3_108 = "ACCESS_DENIED"
    return L3_108, "10187"
  end
  L3_108 = db
  L3_108 = L3_108.beginTransaction
  L3_108()
  L3_108 = false
  L3_108 = dot11Card.config(A0_105, A1_106, A2_107)
  if L3_108 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10406"
  end
end
function dot11.authorizedap_config(A0_109, A1_110, A2_111)
  local L3_112
  L3_112 = ACCESS_LEVEL
  if L3_112 ~= 0 then
    L3_112 = "ACCESS_DENIED"
    return L3_112, "10187"
  end
  L3_112 = db
  L3_112 = L3_112.beginTransaction
  L3_112()
  L3_112 = false
  if not rougeTbl and db.getRows("dot11RogueAP", "macAddress", A0_109["dot11AuthorizedAP.macAddress"] or "") and #db.getRows("dot11RogueAP", "macAddress", A0_109["dot11AuthorizedAP.macAddress"] or "") == 0 then
    L3_112 = true
  end
  L3_112 = L3_112 and dot11AuthorizedAP.config(A0_109, A1_110, A2_111)
  if L3_112 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10282"
  end
end
function dot11.rogueap_move(A0_113)
  local L1_114, L2_115, L3_116, L4_117, L5_118, L6_119, L7_120, L8_121
  L1_114 = ACCESS_LEVEL
  if L1_114 ~= 0 then
    L1_114 = "ACCESS_DENIED"
    return L1_114, L2_115
  end
  L1_114 = db
  L1_114 = L1_114.beginTransaction
  L1_114()
  L1_114 = false
  for L5_118, L6_119 in L2_115(L3_116) do
    L7_120 = db
    L7_120 = L7_120.getRow
    L8_121 = "dot11RogueAP"
    L7_120 = L7_120(L8_121, "dot11RogueAP._ROWID_", L6_119)
    if L7_120 then
      L8_121 = {}
      L8_121["dot11AuthorizedAP.macAddress"] = L7_120["dot11RogueAP.macAddress"]
      L8_121["dot11AuthorizedAP.SSID"] = L7_120["dot11RogueAP.SSID"]
      L8_121["dot11AuthorizedAP.security"] = L7_120["dot11RogueAP.security"]
      L8_121["dot11AuthorizedAP.pairwiseCiphers"] = L7_120["dot11RogueAP.pairwiseCiphers"]
      L8_121["dot11AuthorizedAP.authMethods"] = L7_120["dot11RogueAP.authMethods"]
      L1_114 = dot11AuthorizedAP.config(L8_121, "-1", "add")
      if not L1_114 then
        break
      end
    end
  end
  if L1_114 then
    L5_118 = "delete"
    L1_114 = L2_115
  end
  if L1_114 then
    L2_115(L3_116)
    return L2_115, L3_116
  else
    L2_115()
    return L2_115, L3_116
  end
end
function dot11.ACL_config(A0_122, A1_123, A2_124)
  local L3_125
  L3_125 = ACCESS_LEVEL
  if L3_125 ~= 0 then
    L3_125 = "ACCESS_DENIED"
    return L3_125, "10187"
  end
  L3_125 = db
  L3_125 = L3_125.beginTransaction
  L3_125()
  L3_125 = false
  L3_125 = dot11ACL.config(A0_122, A1_123, A2_124)
  if L3_125 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10147"
  end
end
function dot11.WPS_config(A0_126, A1_127, A2_128)
  local L3_129
  L3_129 = ACCESS_LEVEL
  if L3_129 ~= 0 then
    L3_129 = "ACCESS_DENIED"
    return L3_129, "10187"
  end
  L3_129 = db
  L3_129 = L3_129.beginTransaction
  L3_129()
  L3_129 = false
  L3_129 = dot11WPS.config(A0_126, A1_127, A2_128)
  if L3_129 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12782"
  end
end
function dot11.WPS_Station_config(A0_130, A1_131, A2_132)
  local L3_133
  L3_133 = ACCESS_LEVEL
  if L3_133 ~= 0 then
    L3_133 = "ACCESS_DENIED"
    return L3_133, "10187"
  end
  L3_133 = db
  L3_133 = L3_133.beginTransaction
  L3_133()
  L3_133 = false
  L3_133 = dot11WPSStations.config(A0_130, A1_131, A2_132)
  if L3_133 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12782"
  end
end
function dot11.radio_config(A0_134, A1_135, A2_136)
  local L3_137, L4_138, L5_139, L6_140, L7_141, L8_142, L9_143, L10_144, L11_145
  L3_137 = ACCESS_LEVEL
  if L3_137 ~= 0 then
    L3_137 = "ACCESS_DENIED"
    L4_138 = "10187"
    return L3_137, L4_138
  end
  L3_137 = db
  L3_137 = L3_137.beginTransaction
  L3_137()
  L3_137 = true
  L4_138 = db
  L4_138 = L4_138.getAttribute
  L5_139 = "dot11Radio"
  L6_140 = "_ROWID_"
  L4_138 = L4_138(L5_139, L6_140, L7_141, L8_142)
  L5_139 = db
  L5_139 = L5_139.getRow
  L6_140 = "dot11GlobalConfig"
  L5_139 = L5_139(L6_140, L7_141, L8_142)
  if L3_137 and L5_139 ~= nil then
    L6_140 = A0_134["dot11GlobalConfig.country"]
    L5_139["dot11GlobalConfig.country"] = L6_140
    L6_140 = db
    L6_140 = L6_140.update
    L6_140 = L6_140(L7_141, L8_142, L9_143)
    L3_137 = L6_140
  else
    L3_137 = false
  end
  if L3_137 then
    L6_140 = db
    L6_140 = L6_140.getRow
    L6_140 = L6_140(L7_141, L8_142, L9_143)
    if L7_141 ~= nil then
      L10_144 = "cardNo"
      L11_145 = L7_141
      if L8_142 ~= nil then
        if L3_137 then
          L8_142["dot11Radio.opMode"] = L9_143
          if L9_143 ~= "b and g" then
            L8_142["dot11Radio.preambleMode"] = "Long"
          end
          L8_142["dot11Radio.configuredChannel"] = L9_143
          L8_142["dot11Radio.txPower"] = L9_143
          L8_142["dot11Radio.txRate"] = L9_143
          L8_142["dot11Radio.band"] = L9_143
          if L9_143 ~= nil then
            L8_142["dot11Radio.dothEnabled"] = L9_143
          end
          L10_144 = L8_142
          L11_145 = L8_142["dot11Radio._ROWID_"]
          L3_137 = L9_143
        end
        L10_144 = "dot11Radio11n"
        L11_145 = "radioNo"
        if L9_143 ~= nil then
          L10_144 = A0_134["dot11Radio11n.chanWidth"]
          L9_143["dot11Radio11n.chanWidth"] = L10_144
          L10_144 = A0_134["dot11Radio11n.puren"]
          L9_143["dot11Radio11n.puren"] = L10_144
          L10_144 = A0_134["dot11Radio11n.pure11ac"]
          L9_143["dot11Radio11n.pure11ac"] = L10_144
          L10_144 = A0_134["dot11Radio11n.mimoPreamble"]
          L9_143["dot11Radio11n.mimoPreamble"] = L10_144
          L10_144 = dot11Radio
          L10_144 = L10_144.config11n
          L11_145 = L9_143
          L10_144 = L10_144(L11_145, L9_143["dot11Radio11n._ROWID_"], "edit")
          L3_137 = L10_144
        end
      end
    end
  end
  L6_140 = db
  L6_140 = L6_140.getRowsWithJoin
  L6_140 = L6_140(L7_141, L8_142, L9_143)
  if L7_141 == 0 then
    L3_137 = true
  else
    for L10_144, L11_145 in L7_141(L8_142) do
      L11_145["dot11VAP.txPower"] = A0_134["dot11Radio.txPower"]
      L11_145["dot11VAP.txRate"] = A0_134["dot11Radio.txRate"]
      L11_145["dot11VAP.puren"] = A0_134["dot11Radio11n.puren"]
      L11_145["crontab.unit"] = dot11.VAP_ConfigGet(L11_145["dot11VAP._ROWID_"])["crontab.unit"]
      L11_145["crontab.startHour"] = dot11.VAP_ConfigGet(L11_145["dot11VAP._ROWID_"])["crontab.startHour"]
      L11_145["crontab.startMinute"] = dot11.VAP_ConfigGet(L11_145["dot11VAP._ROWID_"])["crontab.startMinute"]
      L11_145["crontab.startMeridian"] = dot11.VAP_ConfigGet(L11_145["dot11VAP._ROWID_"])["crontab.startMeridian"]
      L11_145["crontab.stopHour"] = dot11.VAP_ConfigGet(L11_145["dot11VAP._ROWID_"])["crontab.stopHour"]
      L11_145["crontab.stopMinute"] = dot11.VAP_ConfigGet(L11_145["dot11VAP._ROWID_"])["crontab.stopMinute"]
      L11_145["crontab.stopMeridian"] = dot11.VAP_ConfigGet(L11_145["dot11VAP._ROWID_"])["crontab.stopMeridian"]
      L11_145["crontab.scheduleControl"] = dot11.VAP_ConfigGet(L11_145["dot11VAP._ROWID_"])["crontab.scheduleControl"]
      L3_137 = dot11.VAP_config(L11_145, L11_145["dot11VAP._ROWID_"], "edit", true)
      if L3_137 == false then
        break
      end
    end
  end
  if L3_137 then
    L7_141(L8_142)
    return L7_141, L8_142
  else
    L7_141()
    return L7_141, L8_142
  end
end
function dot11.radio_advanced_config(A0_146, A1_147, A2_148)
  local L3_149, L4_150, L5_151, L6_152, L7_153, L8_154, L9_155, L10_156, L11_157
  L3_149 = ACCESS_LEVEL
  if L3_149 ~= 0 then
    L3_149 = "ACCESS_DENIED"
    L4_150 = "10187"
    return L3_149, L4_150
  end
  L3_149 = db
  L3_149 = L3_149.beginTransaction
  L3_149()
  L3_149 = false
  L4_150 = db
  L4_150 = L4_150.getAttribute
  L5_151 = "dot11Radio"
  L4_150 = L4_150(L5_151, L6_152, L7_153, L8_154)
  if L4_150 ~= "a" then
    L5_151 = UNIT_NAME
  elseif L5_151 == "DSR-500AC" then
    L5_151 = db
    L5_151 = L5_151.getAttribute
    L9_155 = "fragThreshold"
    L5_151 = L5_151(L6_152, L7_153, L8_154, L9_155)
    A0_146["dot11Radio.fragThreshold"] = L5_151
  end
  L5_151 = dot11Radio
  L5_151 = L5_151.config
  L5_151 = L5_151(L6_152, L7_153, L8_154)
  L3_149 = L5_151
  L5_151 = UNIT_NAME
  if L5_151 ~= "DSR-1000AC" then
    L5_151 = UNIT_NAME
    if L5_151 ~= "DSR-500AC" and L3_149 then
      L5_151 = db
      L5_151 = L5_151.getTable
      L5_151 = L5_151(L6_152)
      if L6_152 == 0 then
        L3_149 = true
      else
        for L9_155, L10_156 in L6_152(L7_153) do
          L11_157 = A0_146["dot11Radio.beaconInterval"]
          L10_156["dot11VAP.beaconInterval"] = L11_157
          L11_157 = A0_146["dot11Radio.dtimInterval"]
          L10_156["dot11VAP.dtimInterval"] = L11_157
          L11_157 = A0_146["dot11Radio.rtsThreshold"]
          L10_156["dot11VAP.rtsThreshold"] = L11_157
          L11_157 = A0_146["dot11Radio.fragThreshold"]
          L10_156["dot11VAP.fragThreshold"] = L11_157
          L11_157 = A0_146["dot11Radio.preambleMode"]
          L10_156["dot11VAP.preambleMode"] = L11_157
          L11_157 = A0_146["dot11Radio.rtsCtsProtect"]
          L10_156["dot11VAP.rtsCtsProtect"] = L11_157
          L11_157 = A0_146["dot11Radio.uapsd"]
          L10_156["dot11VAP.uapsd"] = L11_157
          L11_157 = A0_146["dot11Radio.shortRetry"]
          L10_156["dot11VAP.shortRetry"] = L11_157
          L11_157 = A0_146["dot11Radio.longRetry"]
          L10_156["dot11VAP.longRetry"] = L11_157
          if L3_149 then
            L11_157 = L10_156["dot11VAP.vapEnabled"]
            if L11_157 == "1" then
              L11_157 = dot11
              L11_157 = L11_157.VAP_portEnable
              L11_157 = L11_157(L10_156["dot11VAP.vapName"], false)
              L3_149 = L11_157
            end
          end
          L11_157 = dot11VAP
          L11_157 = L11_157.config
          L11_157 = L11_157(L10_156, L10_156["dot11VAP._ROWID_"], "edit")
          L3_149 = L11_157
          if L3_149 == false then
            break
          end
          if L3_149 then
            L11_157 = L10_156["dot11VAP.vapEnabled"]
            if L11_157 == "1" then
              L11_157 = dot11
              L11_157 = L11_157.VAP_portEnable
              L11_157 = L11_157(L10_156["dot11VAP.vapName"], true)
              L3_149 = L11_157
            end
          end
          L11_157 = db
          L11_157 = L11_157.getAttribute
          L11_157 = L11_157("dot11Profile", "profileName", L10_156["dot11VAP.profileName"], "ssid")
          if L3_149 and L10_156["dot11VAP.vapEnabled"] == "1" then
            L3_149 = dot11.VAP_vlanPerSSID_config(L10_156["dot11VAP.vapName"], L11_157, "BRIDGE")
          end
        end
      end
    end
  end
  if L3_149 then
    L5_151 = db
    L5_151 = L5_151.commitTransaction
    L5_151(L6_152)
    L5_151 = "OK"
    return L5_151, L6_152
  else
    L5_151 = db
    L5_151 = L5_151.rollback
    L5_151()
    L5_151 = "ERROR"
    return L5_151, L6_152
  end
end
function dot11.country_config(A0_158, A1_159, A2_160)
  local L3_161
  L3_161 = ACCESS_LEVEL
  if L3_161 ~= 0 then
    L3_161 = "ACCESS_DENIED"
    return L3_161, "10187"
  end
  L3_161 = db
  L3_161 = L3_161.beginTransaction
  L3_161()
  L3_161 = false
  L3_161 = db.update("dot11GlobalConfig", A0_158, 1)
  if L3_161 then
    rebootFlag = 1
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "11899"
  end
end
function dot11.IAPP_enable(A0_162, A1_163)
  local L2_164
  L2_164 = ACCESS_LEVEL
  if L2_164 ~= 0 then
    L2_164 = "ACCESS_DENIED"
    return L2_164, "10187"
  end
  L2_164 = db
  L2_164 = L2_164.beginTransaction
  L2_164()
  L2_164 = false
  if A1_163 then
  end
  L2_164 = dot11IAPP.enable(A0_162, A1_163)
  if L2_164 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    if A1_163 then
      return "ERROR", "10924"
    else
      return "ERROR", "10923"
    end
  end
end
function dot11.IAPPRemoteAP_config(A0_165, A1_166, A2_167)
  local L3_168
  L3_168 = ACCESS_LEVEL
  if L3_168 ~= 0 then
    L3_168 = "ACCESS_DENIED"
    return L3_168, "10187"
  end
  L3_168 = db
  L3_168 = L3_168.beginTransaction
  L3_168()
  L3_168 = false
  L3_168 = dot11IAPPRemoteAP.config(A0_165, A1_166, A2_167)
  if L3_168 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10922"
  end
end
function dot11.IAPP_setBssidSecret(A0_169)
  local L1_170
  L1_170 = ACCESS_LEVEL
  if L1_170 ~= 0 then
    L1_170 = "ACCESS_DENIED"
    return L1_170, "10187"
  end
  L1_170 = db
  L1_170 = L1_170.beginTransaction
  L1_170()
  L1_170 = false
  L1_170 = dot11IAPP.setBssidSecret(A0_169)
  if L1_170 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10921"
  end
end
function dot11.radio11n_config(A0_171, A1_172, A2_173)
  local L3_174
  L3_174 = ACCESS_LEVEL
  if L3_174 ~= 0 then
    L3_174 = "ACCESS_DENIED"
    return L3_174, "10187"
  end
  L3_174 = db
  L3_174 = L3_174.beginTransaction
  L3_174()
  L3_174 = false
  L3_174 = dot11Radio.config11n(A0_171, A1_172, A2_173)
  if L3_174 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "11899"
  end
end
function dot11.VAP_aclConfig(A0_175, A1_176)
  local L2_177, L3_178, L4_179
  L2_177 = ACCESS_LEVEL
  if L2_177 ~= 0 then
    L2_177 = "ACCESS_DENIED"
    L3_178 = "10187"
    return L2_177, L3_178
  end
  L2_177 = db
  L2_177 = L2_177.beginTransaction
  L2_177()
  L2_177 = true
  L3_178 = {}
  L4_179 = db
  L4_179 = L4_179.getAttribute
  L4_179 = L4_179("dot11VAP", "rowid", A1_176, "vapName")
  if db.getRow("dot11WPS", "vapName", L4_179) ~= nil and db.getRow("dot11WPS", "vapName", L4_179)["dot11WPS.wpsEnabled"] == "1" then
    db.rollback()
    return "ERROR", "12327"
  end
  L2_177 = L2_177 and dot11.VAP_portEnable(L4_179, false)
  L2_177 = db.setAttribute("dot11VAP", "vapName", L4_179, "defACLPolicy", A0_175["dot11VAP.defACLPolicy"])
  L2_177 = L2_177 and dot11.VAP_portEnable(L4_179, true)
  if L2_177 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10189"
  end
end
function dot11.STA_connectedTime(A0_180)
  local L1_181, L2_182, L3_183, L4_184, L5_185, L6_186, L7_187
  if A0_180 == 0 or A0_180 == nil then
    L1_181 = "-"
    return L1_181
  end
  L1_181 = timeLib
  L1_181 = L1_181.uptime
  L2_182 = L1_181()
  L3_183 = L2_182 - A0_180
  L4_184 = math
  L4_184 = L4_184.floor
  L5_185 = L3_183 / 60
  L4_184 = L4_184(L5_185)
  L5_185 = L3_183 % 60
  L6_186 = math
  L6_186 = L6_186.floor
  L7_187 = L4_184 / 60
  L6_186 = L6_186(L7_187)
  L4_184 = L4_184 % 60
  L7_187 = math
  L7_187 = L7_187.floor
  L7_187 = L7_187(L6_186 / 24)
  L6_186 = L6_186 % 24
  L3_183 = L7_187 .. " days, " .. L6_186 .. " hours, " .. L4_184 .. " minutes, " .. L5_185 .. " seconds"
  return L3_183
end
function dot11.wirelessWizardconfig(A0_188)
  local L1_189, L2_190
  L1_189 = db
  L1_189 = L1_189.beginTransaction
  L1_189()
  L1_189 = false
  L2_190 = {}
  L2_190["dot11Profile.pskPassAscii"] = A0_188["dot11Profile.pskPassAscii"]
  L2_190["dot11Profile.preAuthStatus"], L2_190["dot11Profile.authMethods"], L2_190["dot11Profile.pairwiseCiphers"], L2_190["dot11Profile.broadcastSSID"], L2_190["dot11Profile.security"], L2_190["dot11Profile.ssid"] = 0, "PSK", "TKIP+CCMP", 1, "WPA+WPA2", A0_188["dot11Profile.ssid"]
  L1_189 = dot11.profile_config(L2_190, "1", "edit")
  if L1_189 then
    db.commitTransaction()
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12797"
  end
end
