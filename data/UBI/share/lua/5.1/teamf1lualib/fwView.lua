require("teamf1lualib/fwRules")
require("validationsLuaLib")
fwView = {}
function fwView.serviceConfig(A0_0, A1_1, A2_2)
  local L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17
  L3_3 = ACCESS_LEVEL
  if L3_3 ~= 0 then
    L3_3 = "ACCESS_DENIED"
    L4_4 = "10187"
    return L3_3, L4_4
  end
  L3_3 = db
  L3_3 = L3_3.beginTransaction
  L3_3()
  L3_3 = false
  if A2_2 == "edit" then
    L4_4 = 0
    L5_5 = 0
    L6_6 = 0
    L7_7 = 0
    L8_8 = A0_0["Services.ServiceName"]
    L9_9 = db
    L9_9 = L9_9.existsRowWhere
    L10_10 = "FirewallRules"
    L11_11 = "ServiceName = '"
    L12_12 = L8_8
    L13_13 = "'"
    L11_11 = L11_11 .. L12_12 .. L13_13
    L9_9 = L9_9(L10_10, L11_11)
    L10_10 = db
    L10_10 = L10_10.getRows
    L11_11 = "FirewallRules"
    L12_12 = "ServiceName"
    L13_13 = L8_8
    L10_10 = L10_10(L11_11, L12_12, L13_13)
    L11_11 = db
    L11_11 = L11_11.existsRowWhere
    L12_12 = "FirewallRules6"
    L13_13 = "ServiceName = '"
    L14_14 = L8_8
    L15_15 = "'"
    L13_13 = L13_13 .. L14_14 .. L15_15
    L11_11 = L11_11(L12_12, L13_13)
    L12_12 = db
    L12_12 = L12_12.getRows
    L13_13 = "FirewallRules6"
    L14_14 = "ServiceName"
    L15_15 = L8_8
    L12_12 = L12_12(L13_13, L14_14, L15_15)
    L13_13 = db
    L13_13 = L13_13.existsRowWhere
    L14_14 = "TrafficSelector"
    L15_15 = "ServiceName = '"
    L16_16 = L8_8
    L17_17 = "'"
    L15_15 = L15_15 .. L16_16 .. L17_17
    L13_13 = L13_13(L14_14, L15_15)
    L14_14 = db
    L14_14 = L14_14.existsRowWhere
    L15_15 = "ProtocolBinding"
    L16_16 = "ServiceName = '"
    L17_17 = L8_8
    L16_16 = L16_16 .. L17_17 .. "'"
    L14_14 = L14_14(L15_15, L16_16)
    L15_15 = db
    L15_15 = L15_15.getRows
    L16_16 = "ProtocolBinding"
    L17_17 = "ServiceName"
    L15_15 = L15_15(L16_16, L17_17, L8_8)
    L16_16 = db
    L16_16 = L16_16.existsRowWhere
    L17_17 = "bandwidthmanagement"
    L16_16 = L16_16(L17_17, "service = '" .. L8_8 .. "'")
    L17_17 = db
    L17_17 = L17_17.getRows
    L17_17 = L17_17("bandwidthmanagement", "service", L8_8)
    for _FORV_21_, _FORV_22_ in pairs(L10_10) do
      L4_4 = 0
      if _FORV_22_["FirewallRules.Status"] == "1" then
        L4_4 = 1
        break
      end
    end
    for _FORV_21_, _FORV_22_ in pairs(L12_12) do
      L5_5 = 0
      if _FORV_22_["FirewallRules6.Status"] == "1" then
        L5_5 = 1
        break
      end
    end
    for _FORV_21_, _FORV_22_ in pairs(L15_15) do
      L6_6 = 0
      if _FORV_22_["ProtocolBinding.Enabled"] == "1" then
        L6_6 = 1
        break
      end
    end
    for _FORV_21_, _FORV_22_ in pairs(L17_17) do
      L6_6 = 0
      if _FORV_22_["bandwidthmanagement.action"] == "1" then
        L7_7 = 1
        break
      end
    end
    if (L9_9 or L11_11) and (L4_4 == 1 or L5_5 == 1) then
      db.rollback()
      return "ERROR", "12128"
    end
    if L13_13 then
      db.rollback()
      return "ERROR", "13290"
    end
    if L14_14 and L6_6 == 1 then
      db.rollback()
      return "ERROR", "13291"
    end
    if L16_16 and L7_7 == 1 then
      db.rollback()
      return "ERROR", "SERVICE_IN_USE_BW_MGMT"
    end
  end
  L4_4 = fwRules
  L4_4 = L4_4.config
  L5_5 = A0_0
  L6_6 = A1_1
  L7_7 = A2_2
  L4_4 = L4_4(L5_5, L6_6, L7_7)
  L3_3 = L4_4
  if L3_3 then
    L4_4 = db
    L4_4 = L4_4.commitTransaction
    L5_5 = true
    L4_4(L5_5)
    L4_4 = "OK"
    L5_5 = "12265"
    return L4_4, L5_5
  else
    L4_4 = db
    L4_4 = L4_4.rollback
    L4_4()
    L4_4 = "ERROR"
    L5_5 = "12126"
    return L4_4, L5_5
  end
end
function fwView.deleteServices(A0_18)
  local L1_19, L2_20, L3_21, L4_22, L5_23, L6_24, L7_25, L8_26
  L1_19 = ACCESS_LEVEL
  if L1_19 ~= 0 then
    L1_19 = "ACCESS_DENIED"
    L2_20 = "10187"
    return L1_19, L2_20
  end
  L1_19 = db
  L1_19 = L1_19.beginTransaction
  L1_19()
  L1_19 = true
  L2_20 = "12265"
  for L6_24, L7_25 in L3_21(L4_22) do
    L8_26 = db
    L8_26 = L8_26.getAttribute
    L8_26 = L8_26("Services", "_ROWID_", L7_25, "ServiceName")
    if db.existsRowWhere("FirewallRules", "ServiceName = '" .. L8_26 .. "'") or db.existsRowWhere("FirewallRules6", "ServiceName = '" .. L8_26 .. "'") then
      L1_19 = false
      L2_20 = "12127"
      break
    end
    if db.existsRowWhere("bandwidthmanagement", "service = '" .. L8_26 .. "'") then
      L1_19 = false
      L2_20 = "SERVICE_IN_USE_BW_MGMT"
      break
    end
  end
  if L1_19 then
    for L6_24, L7_25 in L3_21(L4_22) do
      L8_26 = {}
      L8_26["Services._ROWID_"] = L7_25
      L1_19 = fwRules.config(L8_26, "-1", "delete")
      if L1_19 == false then
        L2_20 = "12129"
        break
      end
    end
  end
  if L1_19 then
    L3_21(L4_22)
    return L3_21, L4_22
  else
    L3_21()
    return L3_21, L4_22
  end
end
function fwView.scheduleConfigGet(A0_27)
  local L1_28, L2_29, L3_30, L4_31, L5_32, L6_33, L7_34
  L1_28 = {}
  L2_29 = A0_27["Schedules.ScheduleName"]
  L1_28["Schedules.ScheduleName"] = L2_29
  L2_29 = A0_27["Schedules._ROWID_"]
  L1_28["Schedules._ROWID_"] = L2_29
  L2_29 = A0_27["Schedules.AllDay"]
  L1_28["Schedules.AllDay"] = L2_29
  L2_29 = tonumber
  L3_30 = A0_27["Schedules.Days"]
  L2_29 = L2_29(L3_30)
  if L2_29 ~= nil then
    if L2_29 == 127 or L2_29 == 128 then
      L1_28["Schedules.allDays"] = "1"
      L2_29 = L2_29 - L2_29
    else
      L1_28["Schedules.allDays"] = "0"
    end
    if L2_29 >= 64 then
      L1_28["Schedules.sunday"] = "1"
      L2_29 = L2_29 - 64
    else
      L1_28["Schedules.sunday"] = "0"
    end
    if L2_29 >= 32 then
      L1_28["Schedules.saturday"] = "1"
      L2_29 = L2_29 - 32
    else
      L1_28["Schedules.saturday"] = "0"
    end
    if L2_29 >= 16 then
      L1_28["Schedules.friday"] = "1"
      L2_29 = L2_29 - 16
    else
      L1_28["Schedules.friday"] = "0"
    end
    if L2_29 >= 8 then
      L1_28["Schedules.thursday"] = "1"
      L2_29 = L2_29 - 8
    else
      L1_28["Schedules.thursday"] = "0"
    end
    if L2_29 >= 4 then
      L1_28["Schedules.wednesday"] = "1"
      L2_29 = L2_29 - 4
    else
      L1_28["Schedules.wednesday"] = "0"
    end
    if L2_29 >= 2 then
      L1_28["Schedules.tuesday"] = "1"
      L2_29 = L2_29 - 2
    else
      L1_28["Schedules.tuesday"] = "0"
    end
    if L2_29 >= 1 then
      L1_28["Schedules.monday"] = "1"
      L2_29 = L2_29 - 1
    else
      L1_28["Schedules.monday"] = "0"
    end
  end
  L3_30 = tonumber
  L4_31 = A0_27["Schedules.StartTimeHours"]
  L3_30 = L3_30(L4_31)
  if L3_30 ~= nil then
    L4_31 = A0_27["Schedules.StartTimeHours"]
    if L4_31 == "0" then
      L4_31 = A0_27["Schedules.StartTimeMins"]
      if L4_31 == "0" then
        L1_28["Schedules.startTimeHour"] = "12"
        L1_28["Schedules.startTimeMin"] = "00"
        L1_28["Schedules.startTimeMeridian"] = "AM"
      end
    else
      L4_31 = A0_27["Schedules.StartTimeHours"]
      if L4_31 == "0" then
        L1_28["Schedules.startTimeHour"] = "12"
        L4_31 = A0_27["Schedules.StartTimeMins"]
        L1_28["Schedules.startTimeMin"] = L4_31
        L1_28["Schedules.startTimeMeridian"] = "AM"
      elseif L3_30 > 12 then
        L4_31 = L3_30 - 12
        L1_28["Schedules.startTimeHour"] = L4_31
        L4_31 = A0_27["Schedules.StartTimeMins"]
        L1_28["Schedules.startTimeMin"] = L4_31
        L1_28["Schedules.startTimeMeridian"] = "PM"
      elseif L3_30 == 12 then
        L4_31 = A0_27["Schedules.StartTimeHours"]
        L1_28["Schedules.startTimeHour"] = L4_31
        L4_31 = A0_27["Schedules.StartTimeMins"]
        L1_28["Schedules.startTimeMin"] = L4_31
        L1_28["Schedules.startTimeMeridian"] = "PM"
      else
        L4_31 = A0_27["Schedules.StartTimeHours"]
        L1_28["Schedules.startTimeHour"] = L4_31
        L4_31 = A0_27["Schedules.StartTimeMins"]
        L1_28["Schedules.startTimeMin"] = L4_31
        L1_28["Schedules.startTimeMeridian"] = "AM"
      end
    end
  end
  L4_31 = tonumber
  L5_32 = A0_27["Schedules.EndTimeHours"]
  L4_31 = L4_31(L5_32)
  L3_30 = L4_31
  if L3_30 ~= nil then
    L4_31 = A0_27["Schedules.EndTimeHours"]
    if L4_31 == "0" then
      L4_31 = A0_27["Schedules.EndTimeMins"]
      if L4_31 == "0" then
        L1_28["Schedules.endTimeHour"] = "12"
        L1_28["Schedules.endTimeMin"] = "00"
        L1_28["Schedules.endTimeMeridian"] = "AM"
      end
    else
      L4_31 = A0_27["Schedules.EndTimeHours"]
      if L4_31 == "0" then
        L1_28["Schedules.endTimeHour"] = "12"
        L4_31 = A0_27["Schedules.EndTimeMins"]
        L1_28["Schedules.endTimeMin"] = L4_31
        L1_28["Schedules.endTimeMeridian"] = "AM"
      elseif L3_30 > 12 then
        L4_31 = L3_30 - 12
        L1_28["Schedules.endTimeHour"] = L4_31
        L4_31 = A0_27["Schedules.EndTimeMins"]
        L1_28["Schedules.endTimeMin"] = L4_31
        L1_28["Schedules.endTimeMeridian"] = "PM"
      elseif L3_30 == 12 then
        L4_31 = A0_27["Schedules.EndTimeHours"]
        L1_28["Schedules.endTimeHour"] = L4_31
        L4_31 = A0_27["Schedules.EndTimeMins"]
        L1_28["Schedules.endTimeMin"] = L4_31
        L1_28["Schedules.endTimeMeridian"] = "PM"
      else
        L4_31 = A0_27["Schedules.EndTimeHours"]
        L1_28["Schedules.endTimeHour"] = L4_31
        L4_31 = A0_27["Schedules.EndTimeMins"]
        L1_28["Schedules.endTimeMin"] = L4_31
        L1_28["Schedules.endTimeMeridian"] = "AM"
      end
    end
  end
  L4_31 = L1_28["Schedules.startTimeHour"]
  L5_32 = L1_28["Schedules.startTimeMin"]
  L6_33 = L1_28["Schedules.endTimeHour"]
  L7_34 = L1_28["Schedules.endTimeMin"]
  if L4_31 ~= nil and string.len(L4_31) == 1 then
    L1_28["Schedules.startTimeHour"] = string.format("%d%d", 0, L4_31)
  end
  if L5_32 ~= nil and string.len(L5_32) == 1 then
    L1_28["Schedules.startTimeMin"] = string.format("%d%d", 0, L5_32)
  end
  if L6_33 ~= nil and string.len(L6_33) == 1 then
    L1_28["Schedules.endTimeHour"] = string.format("%d%d", 0, L6_33)
  end
  if L7_34 ~= nil and string.len(L7_34) == 1 then
    L1_28["Schedules.endTimeMin"] = string.format("%d%d", 0, L7_34)
  end
  return L1_28
end
function fwView.schedulesConfig(A0_35, A1_36, A2_37)
  local L3_38, L4_39
  L3_38 = ACCESS_LEVEL
  if L3_38 ~= 0 then
    L3_38 = "ACCESS_DENIED"
    L4_39 = "10187"
    return L3_38, L4_39
  end
  L3_38 = db
  L3_38 = L3_38.beginTransaction
  L3_38()
  L3_38 = false
  L4_39 = {}
  L4_39["Schedules.Days"], L4_39["Schedules.ScheduleName"] = 0 + 1 + 2 + 4 + 8 + 16 + 32 + 64 + 127, A0_35["Schedules.ScheduleName"]
  L4_39["Schedules.AllDay"] = A0_35["Schedules.AllDay"]
  if A0_35["Schedules.AllDay"] == "1" then
    L4_39["Schedules.StartTimeHours"] = "0"
    L4_39["Schedules.StartTimeMins"] = "0"
    L4_39["Schedules.EndTimeHours"] = "23"
    L4_39["Schedules.EndTimeMins"] = "59"
  else
    if A0_35["Schedules.startTimeMeridian"] == "AM" then
      if A0_35["Schedules.startTimeHour"] == "12" then
        L4_39["Schedules.StartTimeHours"] = "0"
      else
        L4_39["Schedules.StartTimeHours"] = A0_35["Schedules.startTimeHour"]
      end
    elseif A0_35["Schedules.startTimeHour"] ~= "12" then
      L4_39["Schedules.StartTimeHours"] = A0_35["Schedules.startTimeHour"] + 12
    else
      L4_39["Schedules.StartTimeHours"] = A0_35["Schedules.startTimeHour"]
    end
    if A0_35["Schedules.endTimeMeridian"] == "AM" then
      if A0_35["Schedules.endTimeHour"] == "12" then
        L4_39["Schedules.EndTimeHours"] = "0"
      else
        L4_39["Schedules.EndTimeHours"] = A0_35["Schedules.endTimeHour"]
      end
    elseif A0_35["Schedules.endTimeHour"] ~= "12" then
      L4_39["Schedules.EndTimeHours"] = A0_35["Schedules.endTimeHour"] + 12
    else
      L4_39["Schedules.EndTimeHours"] = A0_35["Schedules.endTimeHour"]
    end
    L4_39["Schedules.StartTimeMins"] = A0_35["Schedules.startTimeMin"]
    L4_39["Schedules.EndTimeMins"] = A0_35["Schedules.endTimeMin"]
  end
  L3_38 = fwRules.config(L4_39, A1_36, A2_37)
  if L3_38 then
    db.commitTransaction()
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12033"
  end
end
function fwView.deleteSchedules(A0_40)
  local L1_41, L2_42, L3_43, L4_44, L5_45, L6_46, L7_47, L8_48
  L1_41 = ACCESS_LEVEL
  if L1_41 ~= 0 then
    L1_41 = "ACCESS_DENIED"
    L2_42 = "10187"
    return L1_41, L2_42
  end
  L1_41 = db
  L1_41 = L1_41.beginTransaction
  L1_41()
  L1_41 = true
  L2_42 = "12265"
  for L6_46, L7_47 in L3_43(L4_44) do
    L8_48 = db
    L8_48 = L8_48.getAttribute
    L8_48 = L8_48("Schedules", "_ROWID_", L7_47, "ScheduleName")
    if db.existsRowWhere("FirewallRules", "ScheduleName = '" .. L8_48 .. "'") or db.existsRowWhere("FirewallRules6", "ScheduleName = '" .. L8_48 .. "'") then
      L1_41 = false
      L2_42 = "12034"
      break
    end
  end
  if L1_41 then
    for L6_46, L7_47 in L3_43(L4_44) do
      L8_48 = {}
      L8_48["Schedules._ROWID_"] = L7_47
      L1_41 = fwRules.config(L8_48, "-1", "delete")
      if L1_41 == false then
        L2_42 = "12037"
        break
      end
    end
  end
  if L1_41 then
    L3_43(L4_44)
    return L3_43, L4_44
  else
    L3_43()
    return L3_43, L4_44
  end
end
function fwView.defaultPolicyConfig(A0_49, A1_50, A2_51)
  local L3_52
  L3_52 = ACCESS_LEVEL
  if L3_52 ~= 0 then
    L3_52 = "ACCESS_DENIED"
    return L3_52, "10187"
  end
  L3_52 = db
  L3_52 = L3_52.beginTransaction
  L3_52()
  L3_52 = false
  L3_52 = fwRules.config(A0_49, A1_50, A2_51)
  if L3_52 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12798"
  end
end
function fwView.lwInConfig(A0_53, A1_54, A2_55)
  local L3_56
  L3_56 = ACCESS_LEVEL
  if L3_56 ~= 0 then
    L3_56 = "ACCESS_DENIED"
    return L3_56, "10187"
  end
  L3_56 = db
  L3_56 = L3_56.beginTransaction
  L3_56()
  L3_56 = false
  if A0_53["FirewallRules.DestinationAddressType"] ~= nil then
    if A0_53["FirewallRules.DestinationAddressType"] == "1" then
      A0_53["FirewallRules.DestinationAddressStart"] = util.joinFields(A0_53, "FirewallRules", "destStartIpAddrbyte", ".", 4)
    elseif A0_53["FirewallRules.DestinationAddressType"] == "2" then
      A0_53["FirewallRules.DestinationAddressStart"] = util.joinFields(A0_53, "FirewallRules", "destStartIpAddrbyte", ".", 4)
      A0_53["FirewallRules.DestinationAddressEnd"] = util.joinFields(A0_53, "FirewallRules", "destEndIpAddrbyte", ".", 4)
    end
  elseif A0_53["FirewallRules.Action"] ~= "DROP" then
    A0_53["FirewallRules.DNATAddress"] = util.joinFields(A0_53, "FirewallRules", "sendToSvrIpAddrbyte", ".", 4)
  end
  if A0_53["FirewallRules.DestinationPublicInterface"] ~= nil and A0_53["FirewallRules.DestinationPublicInterface"] ~= "WAN" and A0_53["FirewallRules.DestinationPublicInterface"] ~= "OTHER" then
    A0_53["FirewallRules.DestinationPublicAddress"] = util.joinFields(A0_53, "FirewallRules", "wanDestIpAddrbyte", ".", 4)
  end
  if A0_53["FirewallRules.SourceAddressType"] == "1" then
    A0_53["FirewallRules.SourceAddressStart"] = util.joinFields(A0_53, "FirewallRules", "sourceStartIpAddrbyte", ".", 4)
  elseif A0_53["FirewallRules.SourceAddressType"] == "2" then
    A0_53["FirewallRules.SourceAddressStart"] = util.joinFields(A0_53, "FirewallRules", "sourceStartIpAddrbyte", ".", 4)
    A0_53["FirewallRules.SourceAddressEnd"] = util.joinFields(A0_53, "FirewallRules", "sourceEndIpAddrbyte", ".", 4)
  end
  if (A0_53["FirewallRules.Action"] == "DROP_BY_SCHEDULE" or A0_53["FirewallRules.Action"] == "ACCEPT_BY_SCHEDULE") and A0_53["FirewallRules.ScheduleName"] == nil then
    return "ERROR", "12035"
  end
  L3_56 = fwRules.config(A0_53, A1_54, A2_55)
  if L3_56 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10803"
  end
end
function fwView.lwOutConfig(A0_57, A1_58, A2_59)
  local L3_60
  L3_60 = ACCESS_LEVEL
  if L3_60 ~= 0 then
    L3_60 = "ACCESS_DENIED"
    return L3_60, "10187"
  end
  L3_60 = db
  L3_60 = L3_60.beginTransaction
  L3_60()
  L3_60 = false
  if A0_57["FirewallRules.SourceAddressType"] == "1" then
    A0_57["FirewallRules.SourceAddressStart"] = util.joinFields(A0_57, "FirewallRules", "sourceStartIpAddrbyte", ".", 4)
  elseif A0_57["FirewallRules.SourceAddressType"] == "2" then
    A0_57["FirewallRules.SourceAddressStart"] = util.joinFields(A0_57, "FirewallRules", "sourceStartIpAddrbyte", ".", 4)
    A0_57["FirewallRules.SourceAddressEnd"] = util.joinFields(A0_57, "FirewallRules", "sourceEndIpAddrbyte", ".", 4)
  end
  if A0_57["FirewallRules.DestinationAddressType"] == "1" then
    A0_57["FirewallRules.DestinationAddressStart"] = util.joinFields(A0_57, "FirewallRules", "destStartIpAddrbyte", ".", 4)
  elseif A0_57["FirewallRules.DestinationAddressType"] == "2" then
    A0_57["FirewallRules.DestinationAddressStart"] = util.joinFields(A0_57, "FirewallRules", "destStartIpAddrbyte", ".", 4)
    A0_57["FirewallRules.DestinationAddressEnd"] = util.joinFields(A0_57, "FirewallRules", "destEndIpAddrbyte", ".", 4)
  end
  if A0_57["FirewallRules.SNATAddressType"] ~= nil then
    if A0_57["FirewallRules.SNATAddressType"] == "1" then
      A0_57["FirewallRules.SNATAddress"] = util.joinFields(A0_57, "FirewallRules", "natIpAddrbyte", ".", 4)
    end
    A0_57["FirewallRules.SNATInterface"] = "WAN1"
  end
  if (A0_57["FirewallRules.Action"] == "DROP_BY_SCHEDULE" or A0_57["FirewallRules.Action"] == "ACCEPT_BY_SCHEDULE") and A0_57["FirewallRules.ScheduleName"] == nil then
    return "ERROR", "12035"
  end
  L3_60 = fwRules.config(A0_57, A1_58, A2_59)
  if L3_60 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10804"
  end
end
function fwView.modifyRules(A0_61, A1_62)
  local L2_63, L3_64, L4_65, L5_66, L6_67, L7_68, L8_69, L9_70, L10_71, L11_72, L12_73, L13_74
  L2_63 = ACCESS_LEVEL
  if L2_63 ~= 0 then
    L2_63 = "ACCESS_DENIED"
    L3_64 = "10187"
    return L2_63, L3_64
  end
  L2_63 = db
  L2_63 = L2_63.beginTransaction
  L2_63()
  L2_63 = true
  L3_64 = "12265"
  if A1_62 == "enable" then
    for L7_68, L8_69 in L4_65(L5_66) do
      L9_70["FirewallRules.Status"] = "1"
      L12_73 = L8_69
      L13_74 = "edit"
      L2_63 = L10_71
      if L2_63 == false then
        L3_64 = "12082"
        break
      end
    end
    if L2_63 ~= false then
      L3_64 = "12081"
    end
  elseif A1_62 == "disable" then
    for L7_68, L8_69 in L4_65(L5_66) do
      L9_70["FirewallRules.Status"] = "0"
      L12_73 = L8_69
      L13_74 = "edit"
      L2_63 = L10_71
      if L2_63 == false then
        L3_64 = "12080"
        break
      end
    end
    if L2_63 ~= false then
      L3_64 = "12079"
    end
  else
    for L9_70, L10_71 in L6_67(L7_68) do
      L12_73 = "FirewallRules"
      L13_74 = "_ROWID_"
      L4_65[L5_66] = L11_72
      L11_72["FirewallRules._ROWID_"] = L10_71
      L12_73 = fwRules
      L12_73 = L12_73.config
      L13_74 = L11_72
      L12_73 = L12_73(L13_74, "-1", "delete")
      L2_63 = L12_73
      if L2_63 == false then
        L3_64 = "12077"
        break
      end
    end
    if L2_63 ~= false then
      L3_64 = "12078"
    end
    if L2_63 ~= false then
      if L7_68 ~= nil then
        L6_67 = L8_69 or ""
        if L6_67 ~= nil and L6_67 ~= "" then
          if L8_69 ~= false then
            for L12_73, L13_74 in L9_70(L10_71) do
              for _FORV_18_, _FORV_19_ in pairs(L4_65) do
                if L13_74 == _FORV_19_ then
                  break
                end
              end
              if false then
              end
            end
            L12_73 = string
            L12_73 = L12_73.len
            L13_74 = L6_67
            L12_73 = L12_73(L13_74)
            L12_73 = L12_73 - 1
            L7_68["fwPriorityMap.PriorityStr"] = L6_67
            DBTable = L9_70
            L12_73 = "edit"
            L2_63 = L9_70
            if L2_63 then
            else
              L3_64 = "12799"
            end
          else
            L2_63 = false
            L3_64 = "12799"
          end
        else
          L2_63 = false
          L3_64 = "12799"
        end
      else
        L2_63 = false
        L3_64 = "12799"
      end
    end
  end
  if L2_63 then
    L4_65(L5_66)
    return L4_65, L5_66
  else
    L4_65()
    return L4_65, L5_66
  end
end
function fwView.moveRules(A0_75, A1_76)
  local L2_77, L3_78, L4_79, L5_80, L6_81, L7_82, L8_83, L9_84, L10_85, L11_86, L12_87, L13_88, L14_89, L15_90
  L2_77 = ACCESS_LEVEL
  if L2_77 ~= 0 then
    L2_77 = "ACCESS_DENIED"
    L3_78 = "10187"
    return L2_77, L3_78
  end
  L2_77 = {}
  L3_78 = #A0_75
  if L3_78 == 0 then
    L3_78 = db
    L3_78 = L3_78.getAttribute
    L7_82 = "PriorityId"
    L3_78 = L3_78(L4_79, L5_80, L6_81, L7_82)
    L3_78 = L3_78 or ""
    L2_77["1"] = L3_78
  else
    L3_78 = 0
    for L7_82, L8_83 in L4_79(L5_80) do
      L3_78 = L3_78 + 1
      L2_77[L3_78] = L9_84
    end
  end
  L3_78 = db
  L3_78 = L3_78.beginTransaction
  L3_78()
  L3_78 = false
  L7_82 = "fwPriorityMap"
  if L6_81 ~= nil then
    L7_82 = L6_81["fwPriorityMap.PriorityStr"]
    L4_79 = L7_82 or ""
  end
  if L4_79 ~= nil and L4_79 ~= "" then
    L7_82 = util
    L7_82 = L7_82.split
    L7_82 = L7_82(L8_83, L9_84)
    if L7_82 ~= false then
      if L8_83 == 0 then
      else
        for L11_86, L12_87 in L8_83(L9_84) do
          L14_89 = L12_87
        end
      end
      for L12_87, L13_88 in L9_84(L10_85) do
        L14_89 = true
        for _FORV_18_, _FORV_19_ in L15_90(L2_77) do
          if L13_88 == _FORV_19_ then
            L14_89 = false
            break
          end
        end
        if L14_89 then
        end
      end
      if L4_79 == "" then
      elseif L9_84 == 1 then
      elseif L9_84 == L10_85 then
      elseif L9_84 ~= false then
        if L10_85 >= L11_86 then
        else
          for L14_89, L15_90 in L11_86(L12_87) do
            if L10_85 == tonumber(A1_76) then
            end
          end
        end
      end
    end
  end
  L6_81["fwPriorityMap.PriorityStr"] = L4_79
  L7_82 = "fwPriorityMap"
  DBTable = L7_82
  L7_82 = fwRules
  L7_82 = L7_82.config
  L7_82 = L7_82(L8_83, L9_84, L10_85)
  L3_78 = L7_82
  if L3_78 then
    L7_82 = db
    L7_82 = L7_82.commitTransaction
    L7_82(L8_83)
    L7_82 = "OK"
    return L7_82, L8_83
  else
    L7_82 = db
    L7_82 = L7_82.rollback
    L7_82()
    L7_82 = "ERROR"
    return L7_82, L8_83
  end
end
function fwView.modifyIPv6Rules(A0_91, A1_92)
  local L2_93, L3_94, L4_95, L5_96, L6_97, L7_98, L8_99, L9_100
  L2_93 = ACCESS_LEVEL
  if L2_93 ~= 0 then
    L2_93 = "ACCESS_DENIED"
    L3_94 = "10187"
    return L2_93, L3_94
  end
  L2_93 = db
  L2_93 = L2_93.beginTransaction
  L2_93()
  L2_93 = true
  L3_94 = "12265"
  if A1_92 == "enable" then
    for L7_98, L8_99 in L4_95(L5_96) do
      L9_100 = {}
      L9_100["FirewallRules6.Status"] = "1"
      L2_93 = fwRules.config(L9_100, L8_99, "edit")
      if L2_93 == false then
        L3_94 = "12082"
        break
      end
    end
    if L2_93 ~= false then
      L3_94 = "12081"
    end
  elseif A1_92 == "disable" then
    for L7_98, L8_99 in L4_95(L5_96) do
      L9_100 = {}
      L9_100["FirewallRules6.Status"] = "0"
      L2_93 = fwRules.config(L9_100, L8_99, "edit")
      if L2_93 == false then
        L3_94 = "12080"
        break
      end
    end
    if L2_93 ~= false then
      L3_94 = "12079"
    end
  else
    for L7_98, L8_99 in L4_95(L5_96) do
      L9_100 = {}
      L9_100["FirewallRules6._ROWID_"] = L8_99
      L2_93 = fwRules.config(L9_100, "-1", "delete")
      if L2_93 == false then
        L3_94 = "12077"
        break
      end
    end
    if L2_93 ~= false then
      L3_94 = "12078"
    end
  end
  if L2_93 then
    L4_95(L5_96)
    return L4_95, L5_96
  else
    L4_95()
    return L4_95, L5_96
  end
end
function fwView.portTrgConfig(A0_101, A1_102, A2_103)
  local L3_104
  L3_104 = ACCESS_LEVEL
  if L3_104 ~= 0 then
    L3_104 = "ACCESS_DENIED"
    return L3_104, "10187"
  end
  L3_104 = db
  L3_104 = L3_104.beginTransaction
  L3_104()
  L3_104 = false
  L3_104 = fwRules.config(A0_101, A1_102, A2_103)
  if L3_104 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "11803"
  end
end
function fwView.deleteRules(A0_105)
  local L1_106, L2_107, L3_108, L4_109, L5_110, L6_111, L7_112, L8_113
  L1_106 = ACCESS_LEVEL
  if L1_106 ~= 0 then
    L1_106 = "ACCESS_DENIED"
    L2_107 = "10187"
    return L1_106, L2_107
  end
  L1_106 = db
  L1_106 = L1_106.beginTransaction
  L1_106()
  L1_106 = true
  L2_107 = "12265"
  for L6_111, L7_112 in L3_108(L4_109) do
    L8_113 = {}
    L8_113["PortTriggering._ROWID_"] = L7_112
    L1_106 = fwRules.config(L8_113, "-1", "delete")
    if L1_106 == false then
      L2_107 = "12020"
      break
    end
  end
  if L1_106 ~= false then
    L2_107 = "12098"
  end
  if L1_106 then
    L3_108(L4_109)
    return L3_108, L4_109
  else
    L3_108()
    return L3_108, L4_109
  end
end
function fwView.attackChecksConfig(A0_114, A1_115, A2_116)
  local L3_117
  L3_117 = ACCESS_LEVEL
  if L3_117 ~= 0 then
    L3_117 = "ACCESS_DENIED"
    return L3_117, "10187"
  end
  L3_117 = db
  L3_117 = L3_117.beginTransaction
  L3_117()
  L3_117 = false
  L3_117 = fwRules.config(A0_114, A1_115, A2_116)
  if L3_117 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10262"
  end
end
function fwView.contentFileteringConfig(A0_118, A1_119, A2_120)
  local L3_121
  L3_121 = ACCESS_LEVEL
  if L3_121 ~= 0 then
    L3_121 = "ACCESS_DENIED"
    return L3_121, "10187"
  end
  L3_121 = db
  L3_121 = L3_121.beginTransaction
  L3_121()
  L3_121 = true
  if A0_118["ContentFiltering.Status"] == "1" then
    DBTable = "WebComponents"
    L3_121 = fwRules.config(A0_118, A1_119, A2_120)
  end
  if L3_121 then
    DBTable = "ContentFiltering"
    L3_121 = fwRules.config(A0_118, A1_119, A2_120)
  end
  if L3_121 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10471"
  end
end
function fwView.blockedAllURLConfig(A0_122)
  local L1_123, L2_124
  L1_123 = ACCESS_LEVEL
  if L1_123 ~= 0 then
    L1_123 = "ACCESS_DENIED"
    L2_124 = "10187"
    return L1_123, L2_124
  end
  L1_123 = db
  L1_123 = L1_123.beginTransaction
  L1_123()
  L1_123 = false
  L2_124 = A0_122["BlockSites.BlockAllURLStatus"]
  if L2_124 == "1" then
    L2_124 = {}
    L2_124["BlockSites.KeywordToBlock"] = "."
    L2_124["BlockSites.KeywordBlockingTo"] = "1"
    L2_124["BlockSites.Status"] = A0_122["BlockSites.BlockAllURLStatus"]
    DBTable = "BlockSites"
    L1_123 = fwRules.config(L2_124, "-1", "add")
  else
    L2_124 = fwView
    L2_124 = L2_124.blockedAllURLDel
    L2_124 = L2_124("BlockSites", "KeywordToBlock", ".")
    L1_123 = L2_124
  end
  if L1_123 then
    L2_124 = db
    L2_124 = L2_124.commitTransaction
    L2_124(true)
    L2_124 = "OK"
    return L2_124, "12265"
  else
    L2_124 = db
    L2_124 = L2_124.rollback
    L2_124()
    L2_124 = "ERROR"
    return L2_124, "10344"
  end
end
function fwView.blockedAllURLDel(A0_125, A1_126, A2_127)
  local L3_128
  L3_128 = db.deleteRow(A0_125, A1_126, A2_127)
  return L3_128
end
function fwView.blockedKeywordConfig(A0_129, A1_130, A2_131)
  local L3_132, L4_133, L5_134, L6_135, L7_136, L8_137, L9_138, L10_139, L11_140, L12_141
  L3_132 = ACCESS_LEVEL
  if L3_132 ~= 0 then
    L3_132 = "ACCESS_DENIED"
    L4_133 = "10187"
    return L3_132, L4_133
  end
  L3_132 = db
  L3_132 = L3_132.beginTransaction
  L3_132()
  L3_132 = false
  if A2_131 == "add" then
    L4_133 = A0_129["BlockSites.KeywordBlockingTo"]
    if L4_133 == "ALL" then
      L4_133 = db
      L4_133 = L4_133.getTable
      L5_134 = "LanGroup"
      L4_133 = L4_133(L5_134)
      L5_134 = 0
      for L9_138, L10_139 in L6_135(L7_136) do
        L5_134 = L5_134 + 1
        L11_140 = L4_133[L5_134]
        L12_141 = {}
        L12_141["BlockSites.KeywordToBlock"] = A0_129["BlockSites.KeywordToBlock"]
        L12_141["BlockSites.KeywordBlockingTo"] = L11_140["LanGroup.GroupName"]
        L12_141["BlockSites.Status"] = A0_129["BlockSites.Status"]
        L3_132 = fwRules.config(L12_141, A1_130, A2_131)
        if L3_132 then
        else
          db.rollback()
          return "ERROR", "10344"
        end
      end
    else
      L4_133 = fwRules
      L4_133 = L4_133.config
      L5_134 = A0_129
      L4_133 = L4_133(L5_134, L6_135, L7_136)
      L3_132 = L4_133
    end
  elseif A2_131 == "edit" then
    L4_133 = A0_129["BlockSites.KeywordBlockingTo"]
    if L4_133 == "ALL" then
      L4_133 = db
      L4_133 = L4_133.getTable
      L5_134 = "LanGroup"
      L4_133 = L4_133(L5_134)
      L5_134 = 0
      for L9_138, L10_139 in L6_135(L7_136) do
        L5_134 = L5_134 + 1
        L11_140 = L4_133[L5_134]
        L12_141 = {}
        L12_141["BlockSites.KeywordToBlock"] = A0_129["BlockSites.KeywordToBlock"]
        L12_141["BlockSites.KeywordBlockingTo"] = L11_140["LanGroup.GroupName"]
        L12_141["BlockSites.Status"] = "1"
        if db.existsRowWhere("BlockSites", "KeywordToBlock = '" .. A0_129["BlockSites.KeywordToBlock"] .. "' and KeywordBlockingTo = '" .. L11_140["LanGroup.GroupName"] .. "'") then
          L3_132 = true
        else
          L3_132 = fwRules.config(L12_141, A1_130, "add")
        end
        if L3_132 then
        else
          db.rollback()
          return "ERROR", "10344"
        end
      end
    else
      L4_133 = fwRules
      L4_133 = L4_133.config
      L5_134 = A0_129
      L4_133 = L4_133(L5_134, L6_135, L7_136)
      L3_132 = L4_133
    end
  end
  if L3_132 then
    L4_133 = db
    L4_133 = L4_133.commitTransaction
    L5_134 = true
    L4_133(L5_134)
    L4_133 = "OK"
    L5_134 = "12265"
    return L4_133, L5_134
  else
    L4_133 = db
    L4_133 = L4_133.rollback
    L4_133()
    L4_133 = "ERROR"
    L5_134 = "10344"
    return L4_133, L5_134
  end
end
function fwView.importCSV(A0_142, A1_143)
  local L2_144
  L2_144 = ACCESS_LEVEL
  if L2_144 ~= 0 then
    L2_144 = "ACCESS_DENIED"
    return L2_144, "10187"
  end
  L2_144 = false
  if A1_143 == nil then
    return "ERROR", "11518"
  end
  if A0_142 == nil then
    return "ERROR", "11518"
  end
  if A0_142 == "BlockSites" then
    L2_144 = os.execute("importBlockedKeyword " .. A1_143 .. " " .. A0_142)
  elseif A0_142 == "TrustedDomains" then
    L2_144 = os.execute("importApprovedUrls " .. A1_143 .. " " .. A0_142)
  else
    return "ERROR", "12321"
  end
  if L2_144 == 0 then
    return "OK", "12265"
  else
    return "ERROR", "10959"
  end
end
function fwView.trustedDomainConfig(A0_145, A1_146, A2_147)
  local L3_148
  L3_148 = ACCESS_LEVEL
  if L3_148 ~= 0 then
    L3_148 = "ACCESS_DENIED"
    return L3_148, "10187"
  end
  L3_148 = db
  L3_148 = L3_148.beginTransaction
  L3_148()
  L3_148 = false
  L3_148 = fwRules.config(A0_145, A1_146, A2_147)
  if L3_148 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12377"
  end
end
function fwView.macFilteringConfig(A0_149, A1_150, A2_151)
  local L3_152
  L3_152 = ACCESS_LEVEL
  if L3_152 ~= 0 then
    L3_152 = "ACCESS_DENIED"
    return L3_152, "10187"
  end
  L3_152 = db
  L3_152 = L3_152.beginTransaction
  L3_152()
  L3_152 = false
  L3_152 = fwRules.config(A0_149, A1_150, A2_151)
  if L3_152 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12191"
  end
end
function fwView.ipMacConfig(A0_153, A1_154, A2_155)
  local L3_156, L4_157, L5_158
  L3_156 = ACCESS_LEVEL
  if L3_156 ~= 0 then
    L3_156 = "ACCESS_DENIED"
    L4_157 = "10187"
    return L3_156, L4_157
  end
  L3_156 = db
  L3_156 = L3_156.beginTransaction
  L3_156()
  L3_156 = false
  L4_157 = "SourceMACAddress ='"
  L5_158 = A0_153["IPMACBinding.SourceMACAddress"]
  L4_157 = L4_157 .. L5_158 .. "'"
  L5_158 = "IPAddress ='"
  L5_158 = L5_158 .. A0_153["IPMACBinding.IPAddress"] .. "'"
  if (A2_155 == "add" or A2_155 == "edit") and not db.existsRowWhere(DBTable, L4_157) and not db.existsRowWhere(DBTable, L5_158) then
    L3_156 = fwRules.config(A0_153, A1_154, A2_155)
  elseif A2_155 == "edit" and db.existsRowWhere(DBTable, L4_157) == A1_154 and db.existsRowWhere(DBTable, L5_158) == A1_154 then
    L3_156 = fwRules.config(A0_153, A1_154, A2_155)
  elseif A2_155 == "edit" and not db.existsRowWhere(DBTable, L4_157) and db.existsRowWhere(DBTable, L5_158) and db.existsRowWhere(DBTable, L5_158) == A1_154 or not db.existsRowWhere(DBTable, L5_158) and db.existsRowWhere(DBTable, L4_157) and db.existsRowWhere(DBTable, L4_157) == A1_154 then
    L3_156 = fwRules.config(A0_153, A1_154, A2_155)
  else
    db.rollback()
    return "ERROR", "11330"
  end
  if L3_156 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "11097"
  end
end
function fwView.ipMac_dhcpConfig(A0_159, A1_160, A2_161, A3_162)
  local L4_163, L5_164, L6_165
  L4_163 = ACCESS_LEVEL
  if L4_163 ~= 0 then
    L4_163 = "ACCESS_DENIED"
    L5_164 = "10187"
    return L4_163, L5_164
  end
  L4_163 = db
  L4_163 = L4_163.beginTransaction
  L4_163()
  L4_163 = false
  L5_164 = {}
  L6_165 = A0_159["IPMACBinding.LogicalIfName"]
  L5_164["DhcpfixedIpAddress.LogicalIfName"] = L6_165
  L6_165 = A0_159["IPMACBinding.Name"]
  L5_164["DhcpfixedIpAddress.Name"] = L6_165
  L6_165 = A0_159["IPMACBinding.IPAddress"]
  L5_164["DhcpfixedIpAddress.IpAddr"] = L6_165
  L6_165 = A0_159["IPMACBinding.SourceMACAddress"]
  L5_164["DhcpfixedIpAddress.MacAddr"] = L6_165
  L6_165 = A0_159["IPMACBinding.AssociatingEnabled"]
  L5_164["DhcpfixedIpAddress.AssociatingEnabled"] = L6_165
  if A3_162 == "add" then
    L6_165 = db
    L6_165 = L6_165.insert
    L6_165 = L6_165("DhcpfixedIpAddress", L5_164)
    L4_163 = L6_165
  else
    L6_165 = db
    L6_165 = L6_165.existsRowWhere
    L6_165 = L6_165("DhcpfixedIpAddress", "IpAddr = '" .. A1_160 .. "'")
    if L6_165 then
      L4_163 = db.update("DhcpfixedIpAddress", L5_164, L6_165)
    else
      L4_163 = db.insert("DhcpfixedIpAddress", L5_164)
    end
  end
  if L4_163 then
    L6_165 = db
    L6_165 = L6_165.commitTransaction
    L6_165(true)
    L6_165 = "OK"
    return L6_165, "12265"
  else
    L6_165 = db
    L6_165 = L6_165.rollback
    L6_165()
    L6_165 = "ERROR"
    return L6_165, "10560"
  end
end
function fwView.dhcpConfig_unwantDelete(A0_166, A1_167)
  local L2_168
  L2_168 = ACCESS_LEVEL
  if L2_168 ~= 0 then
    L2_168 = "ACCESS_DENIED"
    return L2_168, "10187"
  end
  L2_168 = db
  L2_168 = L2_168.beginTransaction
  L2_168()
  L2_168 = false
  inTable = {}
  rowid1 = db.existsRowWhere("DhcpfixedIpAddress", "IpAddr = '" .. A1_167 .. "'")
  if rowid1 then
    inTable["DhcpfixedIpAddress._ROWID_"] = rowid1
    L2_168 = db.delete("DhcpfixedIpAddress", inTable)
  else
    L2_168 = true
  end
  if L2_168 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10560"
  end
end
function fwView.deleteKeywords(A0_169)
  local L1_170, L2_171, L3_172, L4_173, L5_174, L6_175, L7_176, L8_177
  L1_170 = ACCESS_LEVEL
  if L1_170 ~= 0 then
    L1_170 = "ACCESS_DENIED"
    L2_171 = "10187"
    return L1_170, L2_171
  end
  L1_170 = db
  L1_170 = L1_170.beginTransaction
  L1_170()
  L1_170 = true
  L2_171 = "12265"
  for L6_175, L7_176 in L3_172(L4_173) do
    L8_177 = {}
    L8_177["BlockSites._ROWID_"] = L7_176
    L1_170 = fwRules.config(L8_177, "-1", "delete")
    if L1_170 == false then
      L2_171 = "10345"
      break
    end
  end
  if L1_170 ~= false then
    L2_171 = "10346"
  end
  if L1_170 then
    L3_172(L4_173)
    return L3_172, L4_173
  else
    L3_172()
    return L3_172, L4_173
  end
end
function fwView.modifyKeywordStatus(A0_178, A1_179)
  local L2_180, L3_181, L4_182, L5_183, L6_184, L7_185, L8_186, L9_187, L10_188
  L2_180 = ACCESS_LEVEL
  if L2_180 ~= 0 then
    L2_180 = "ACCESS_DENIED"
    L3_181 = "10187"
    return L2_180, L3_181
  end
  L2_180 = db
  L2_180 = L2_180.beginTransaction
  L2_180()
  L2_180 = true
  L3_181 = "12265"
  L4_182 = "1"
  if A1_179 == "enable" then
    L4_182 = "1"
  else
    L4_182 = "0"
  end
  for L8_186, L9_187 in L5_183(L6_184) do
    L10_188 = {}
    L10_188["BlockSites.Status"] = L4_182
    L2_180 = fwRules.config(L10_188, L9_187, "edit")
    if L2_180 == false then
      L3_181 = "10344"
      break
    end
  end
  if L2_180 then
    L5_183(L6_184)
    return L5_183, L6_184
  else
    L5_183()
    return L5_183, L6_184
  end
end
function fwView.deleteDomains(A0_189)
  local L1_190, L2_191, L3_192, L4_193, L5_194, L6_195, L7_196, L8_197
  L1_190 = ACCESS_LEVEL
  if L1_190 ~= 0 then
    L1_190 = "ACCESS_DENIED"
    L2_191 = "10187"
    return L1_190, L2_191
  end
  L1_190 = db
  L1_190 = L1_190.beginTransaction
  L1_190()
  L1_190 = true
  L2_191 = "12265"
  for L6_195, L7_196 in L3_192(L4_193) do
    L8_197 = {}
    L8_197["TrustedDomains._ROWID_"] = L7_196
    L1_190 = fwRules.config(L8_197, "-1", "delete")
    if L1_190 == false then
      L2_191 = "12378"
      break
    end
  end
  if L1_190 ~= false then
    L2_191 = "12379"
  end
  if L1_190 then
    L3_192(L4_193)
    return L3_192, L4_193
  else
    L3_192()
    return L3_192, L4_193
  end
end
function fwView.deleteMac(A0_198)
  local L1_199, L2_200, L3_201, L4_202, L5_203, L6_204, L7_205, L8_206
  L1_199 = ACCESS_LEVEL
  if L1_199 ~= 0 then
    L1_199 = "ACCESS_DENIED"
    L2_200 = "10187"
    return L1_199, L2_200
  end
  L1_199 = db
  L1_199 = L1_199.beginTransaction
  L1_199()
  L1_199 = true
  L2_200 = "12265"
  for L6_204, L7_205 in L3_201(L4_202) do
    L8_206 = {}
    L8_206["SourceMACAddress._ROWID_"] = L7_205
    L1_199 = fwRules.config(L8_206, "-1", "delete")
    if L1_199 == false then
      L2_200 = "11328"
      break
    end
  end
  if L1_199 ~= false then
    L2_200 = "12088"
  end
  if L1_199 then
    L3_201(L4_202)
    return L3_201, L4_202
  else
    L3_201()
    return L3_201, L4_202
  end
end
function fwView.deleteIpMac(A0_207)
  local L1_208, L2_209, L3_210, L4_211, L5_212, L6_213, L7_214, L8_215
  L1_208 = ACCESS_LEVEL
  if L1_208 ~= 0 then
    L1_208 = "ACCESS_DENIED"
    L2_209 = "10187"
    return L1_208, L2_209
  end
  L1_208 = db
  L1_208 = L1_208.beginTransaction
  L1_208()
  L1_208 = false
  L2_209 = "12265"
  inTable_dhcp = L3_210
  for L6_213, L7_214 in L3_210(L4_211) do
    L8_215 = {}
    dhcp_IpAddr = db.getAttribute("IPMACBinding", "_ROWID_", L7_214, "IPAddress")
    L8_215["IPMACBinding._ROWID_"] = L7_214
    L1_208 = fwRules.config(L8_215, "-1", "delete")
    rowid1 = db.existsRowWhere("DhcpfixedIpAddress", "IpAddr = '" .. dhcp_IpAddr .. "'")
    if rowid1 then
      inTable_dhcp[L6_213] = rowid1
      L1_208 = db.delete("DhcpfixedIpAddress", inTable_dhcp)
    else
      L1_208 = true
    end
    if L1_208 == false then
      L2_209 = "11092"
      break
    end
  end
  if L1_208 ~= false then
    L2_209 = "12087"
  end
  if L1_208 then
    L3_210(L4_211)
    return L3_210, L4_211
  else
    L3_210()
    return L3_210, L4_211
  end
end
function fwView.getMaxPriority(A0_216)
  local L1_217
  L1_217 = "RuleType = 'SECURE_INSECURE'"
  L1_217 = L1_217 .. " or RuleType = 'INSECURE_SECURE'"
  L1_217 = L1_217 .. " or RuleType = 'PUBLIC_SECURE'"
  L1_217 = L1_217 .. " or RuleType = 'SECURE_PUBLIC'"
  L1_217 = L1_217 .. " or RuleType = 'INSECURE_PUBLIC'"
  L1_217 = L1_217 .. " or RuleType = 'PUBLIC_INSECURE'"
  L1_217 = L1_217 .. " or RuleType = 'SECURE_SECURE'"
  if A0_216 == "4" then
  else
    if A0_216 == "6" then
    else
    end
  end
  if cur then
    cur:close()
  end
  return cur:fetch({}, "a") and (cur:fetch({}, "a").PriorityId or "")
end
function fwView.firewallRulesConfig(A0_218, A1_219, A2_220)
  local L3_221, L4_222, L5_223, L6_224
  L3_221 = ACCESS_LEVEL
  if L3_221 ~= 0 then
    L3_221 = "ACCESS_DENIED"
    L4_222 = "10187"
    return L3_221, L4_222
  end
  L3_221 = db
  L3_221 = L3_221.beginTransaction
  L3_221()
  L3_221 = true
  L4_222 = A0_218["FirewallRules.FromZoneType"]
  if L4_222 == "SECURE_VLAN" then
    A0_218["FirewallRules.FromZoneType"] = "SECURE"
    L4_222 = db
    L4_222 = L4_222.getAttribute
    L5_223 = "vlan"
    L6_224 = "vlanName"
    L4_222 = L4_222(L5_223, L6_224, A0_218["FirewallRules.FromZoneVlanName"], "vlanId")
    fromZoneVlanId = L4_222
    L4_222 = fromZoneVlanId
    A0_218["FirewallRules.FromZoneVlanId"] = L4_222
    L4_222 = A0_218["FirewallRules.SourceAddressType"]
    if L4_222 == "0" then
      L4_222 = "LAN"
      L5_223 = fromZoneVlanId
      L4_222 = L4_222 .. L5_223
      fromZoneVlan = L4_222
      L4_222 = A0_218["FirewallRules.FromZoneVlanName"]
      if L4_222 == "Default" then
        L4_222 = "LAN"
        fromZoneVlan = L4_222
      end
      L4_222 = db
      L4_222 = L4_222.getAttribute
      L5_223 = "ifStatic"
      L6_224 = "LogicalIfName"
      L4_222 = L4_222(L5_223, L6_224, fromZoneVlan, "StaticIp")
      fromIpAddr = L4_222
      L4_222 = db
      L4_222 = L4_222.getAttribute
      L5_223 = "ifStatic"
      L6_224 = "LogicalIfName"
      L4_222 = L4_222(L5_223, L6_224, fromZoneVlan, "NetMask")
      fromSnet = L4_222
      L4_222 = {
        [3] = L5_223(L6_224, fromSnet)
      }
      L5_223 = validationsLuaLib
      L5_223 = L5_223.ipAddressRangeGet
      L6_224 = fromIpAddr
      L6_224 = L5_223(L6_224, fromSnet)
      ;({
        [3] = L5_223(L6_224, fromSnet)
      })[1] = L5_223
      ;({
        [3] = L5_223(L6_224, fromSnet)
      })[2] = L6_224
      L5_223 = L4_222[1]
      if L5_223 == 1 then
        L5_223 = L4_222[2]
        A0_218["FirewallRules.SourceAddressStart"] = L5_223
        L5_223 = L4_222[3]
        A0_218["FirewallRules.SourceAddressEnd"] = L5_223
      else
        L3_221 = false
      end
    end
  else
    A0_218["FirewallRules.FromZoneVlanId"] = "0"
  end
  L4_222 = A0_218["FirewallRules.ToZoneType"]
  if L4_222 == "SECURE_VLAN" then
    A0_218["FirewallRules.ToZoneType"] = "SECURE"
    L4_222 = db
    L4_222 = L4_222.getAttribute
    L5_223 = "vlan"
    L6_224 = "vlanName"
    L4_222 = L4_222(L5_223, L6_224, A0_218["FirewallRules.ToZoneVlanName"], "vlanId")
    toZoneVlanId = L4_222
    L4_222 = toZoneVlanId
    A0_218["FirewallRules.ToZoneVlanId"] = L4_222
    L4_222 = A0_218["FirewallRules.DestinationAddressType"]
    if L4_222 == "0" then
      L4_222 = "LAN"
      L5_223 = toZoneVlanId
      L4_222 = L4_222 .. L5_223
      toZoneVlan = L4_222
      L4_222 = A0_218["FirewallRules.ToZoneVlanName"]
      if L4_222 == "Default" then
        L4_222 = "LAN"
        toZoneVlan = L4_222
      end
      L4_222 = db
      L4_222 = L4_222.getAttribute
      L5_223 = "ifStatic"
      L6_224 = "LogicalIfName"
      L4_222 = L4_222(L5_223, L6_224, toZoneVlan, "StaticIp")
      toIpAddr = L4_222
      L4_222 = db
      L4_222 = L4_222.getAttribute
      L5_223 = "ifStatic"
      L6_224 = "LogicalIfName"
      L4_222 = L4_222(L5_223, L6_224, toZoneVlan, "NetMask")
      toSnet = L4_222
      L4_222 = {
        [3] = L5_223(L6_224, toSnet)
      }
      L5_223 = validationsLuaLib
      L5_223 = L5_223.ipAddressRangeGet
      L6_224 = toIpAddr
      L6_224 = L5_223(L6_224, toSnet)
      ;({
        [3] = L5_223(L6_224, toSnet)
      })[1] = L5_223
      ;({
        [3] = L5_223(L6_224, toSnet)
      })[2] = L6_224
      L5_223 = L4_222[1]
      if L5_223 == 1 then
        L5_223 = L4_222[2]
        A0_218["FirewallRules.DestinationAddressStart"] = L5_223
        L5_223 = L4_222[3]
        A0_218["FirewallRules.DestinationAddressEnd"] = L5_223
      else
        L3_221 = false
      end
    end
  else
    A0_218["FirewallRules.ToZoneVlanId"] = "0"
  end
  L4_222 = A0_218["FirewallRules.RuleType"]
  if L4_222 == nil then
    L4_222 = A0_218["FirewallRules.FromZoneType"]
    L5_223 = "_"
    L6_224 = A0_218["FirewallRules.ToZoneType"]
    L4_222 = L4_222 .. L5_223 .. L6_224
    A0_218["FirewallRules.RuleType"] = L4_222
  else
    L4_222 = string
    L4_222 = L4_222.find
    L5_223 = A0_218["FirewallRules.RuleType"]
    L6_224 = "_"
    L4_222 = L4_222(L5_223, L6_224)
    L5_223 = string
    L5_223 = L5_223.sub
    L6_224 = A0_218["FirewallRules.RuleType"]
    L5_223 = L5_223(L6_224, 0, L4_222 - 1)
    A0_218["FirewallRules.FromZoneType"] = L5_223
    L5_223 = string
    L5_223 = L5_223.sub
    L6_224 = A0_218["FirewallRules.RuleType"]
    L5_223 = L5_223(L6_224, L4_222 + 1)
    A0_218["FirewallRules.ToZoneType"] = L5_223
  end
  L4_222 = 0
  if L3_221 and A2_220 == "add" then
    L5_223 = fwView
    L5_223 = L5_223.getMaxPriority
    L6_224 = "4"
    L5_223 = L5_223(L6_224)
    if L5_223 == nil or L5_223 == "" or L5_223 == "0" then
      L4_222 = 1
    else
      L6_224 = tonumber
      L6_224 = L6_224(L5_223)
      L4_222 = L6_224 + 1
    end
    if L4_222 == 4294967295 then
      L4_222 = 1
      while true do
        L6_224 = db
        L6_224 = L6_224.getRow
        L6_224 = L6_224("FirewallRules", "PriorityId", L4_222)
        if L6_224 == nil or L6_224 == "" then
          break
        else
          L4_222 = L4_222 + 1
        end
      end
    end
    A0_218["FirewallRules.PriorityId"] = L4_222
  end
  L5_223 = fwRules
  L5_223 = L5_223.config
  L6_224 = A0_218
  L5_223 = L5_223(L6_224, A1_219, A2_220)
  L3_221 = L5_223
  if L3_221 and A2_220 == "add" then
    L5_223 = db
    L5_223 = L5_223.getAttribute
    L6_224 = "fwPriorityMap"
    L5_223 = L5_223(L6_224, "RuleType", "ALL", "PriorityStr")
    L5_223 = L5_223 or ""
    if L5_223 == "" then
      L5_223 = L4_222
    else
      L6_224 = L5_223
      L5_223 = L6_224 .. "," .. L4_222
    end
    L6_224 = db
    L6_224 = L6_224.getRow
    L6_224 = L6_224("fwPriorityMap", "RuleType", "ALL")
    if L6_224 ~= nil then
      L6_224["fwPriorityMap.PriorityStr"] = L5_223
      DBTable = "fwPriorityMap"
      L3_221 = fwRules.config(L6_224, L6_224["fwPriorityMap._ROWID_"], "edit")
    else
      L3_221 = false
    end
  end
  if L3_221 then
    L5_223 = db
    L5_223 = L5_223.commitTransaction
    L6_224 = true
    L5_223(L6_224)
    L5_223 = "OK"
    L6_224 = "12265"
    return L5_223, L6_224
  else
    L5_223 = db
    L5_223 = L5_223.rollback
    L5_223()
    L5_223 = "ERROR"
    L6_224 = "10802"
    return L5_223, L6_224
  end
end
function fwView.ipv6FirewallRulesConfig(A0_225, A1_226, A2_227)
  local L3_228
  L3_228 = ACCESS_LEVEL
  if L3_228 ~= 0 then
    L3_228 = "ACCESS_DENIED"
    return L3_228, "10187"
  end
  L3_228 = db
  L3_228 = L3_228.beginTransaction
  L3_228()
  L3_228 = true
  if A0_225["FirewallRules6.RuleType"] == nil then
    A0_225["FirewallRules6.RuleType"] = A0_225["FirewallRules6.FromZoneType"] .. "_" .. A0_225["FirewallRules6.ToZoneType"]
  else
    A0_225["FirewallRules6.FromZoneType"] = string.sub(A0_225["FirewallRules6.RuleType"], 0, string.find(A0_225["FirewallRules6.RuleType"], "_") - 1)
    A0_225["FirewallRules6.ToZoneType"] = string.sub(A0_225["FirewallRules6.RuleType"], string.find(A0_225["FirewallRules6.RuleType"], "_") + 1)
  end
  L3_228 = fwRules.config(A0_225, A1_226, A2_227)
  if L3_228 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10802"
  end
end
function fwView.ipv6FirewallRulesAdd(A0_229)
  local L1_230, L2_231, L3_232, L4_233
  L1_230 = ACCESS_LEVEL
  if L1_230 ~= 0 then
    L1_230 = "ACCESS_DENIED"
    L2_231 = "10187"
    return L1_230, L2_231
  end
  L1_230 = db
  L1_230 = L1_230.beginTransaction
  L1_230()
  L1_230 = true
  L2_231 = A0_229["FirewallRules6.FromZoneType"]
  L3_232 = "_"
  L4_233 = A0_229["FirewallRules6.ToZoneType"]
  L2_231 = L2_231 .. L3_232 .. L4_233
  A0_229["FirewallRules6.RuleType"] = L2_231
  L2_231 = 0
  if L1_230 then
    L3_232 = fwView
    L3_232 = L3_232.getMaxPriority
    L4_233 = "6"
    L3_232 = L3_232(L4_233)
    if L3_232 == nil or L3_232 == "" or L3_232 == "0" then
      L2_231 = 1
    else
      L4_233 = tonumber
      L4_233 = L4_233(L3_232)
      L2_231 = L4_233 + 1
    end
    if L2_231 == 4294967295 then
      L2_231 = 1
      while true do
        L4_233 = db
        L4_233 = L4_233.getRow
        L4_233 = L4_233("FirewallRules6", "PriorityId", L2_231)
        if L4_233 == nil or L4_233 == "" then
          break
        else
          L2_231 = L2_231 + 1
        end
      end
    end
    A0_229["FirewallRules6.PriorityId"] = L2_231
  end
  L3_232 = fwRules
  L3_232 = L3_232.config
  L4_233 = A0_229
  L3_232 = L3_232(L4_233, "-1", "add")
  L1_230 = L3_232
  if L1_230 then
    L3_232 = db
    L3_232 = L3_232.getAttribute
    L4_233 = "fwPriorityMap6"
    L3_232 = L3_232(L4_233, "RuleType", "ALL", "PriorityStr")
    L3_232 = L3_232 or ""
    if L3_232 == "" then
      L3_232 = L2_231
    else
      L4_233 = L3_232
      L3_232 = L4_233 .. "," .. L2_231
    end
    L4_233 = db
    L4_233 = L4_233.getRow
    L4_233 = L4_233("fwPriorityMap6", "RuleType", "ALL")
    if L4_233 ~= nil then
      L4_233["fwPriorityMap6.PriorityStr"] = L3_232
      DBTable = "fwPriorityMap6"
      L1_230 = fwRules.config(L4_233, L4_233["fwPriorityMap6._ROWID_"], "edit")
    else
      L1_230 = false
    end
  end
  if L1_230 then
    L3_232 = db
    L3_232 = L3_232.commitTransaction
    L4_233 = true
    L3_232(L4_233)
    L3_232 = "OK"
    L4_233 = "12265"
    return L3_232, L4_233
  else
    L3_232 = db
    L3_232 = L3_232.rollback
    L3_232()
    L3_232 = "ERROR"
    L4_233 = "10802"
    return L3_232, L4_233
  end
end
function fwView.ipv6FirewallRulesEdit(A0_234, A1_235)
  local L2_236
  L2_236 = ACCESS_LEVEL
  if L2_236 ~= 0 then
    L2_236 = "ACCESS_DENIED"
    return L2_236, "10187"
  end
  L2_236 = db
  L2_236 = L2_236.beginTransaction
  L2_236()
  L2_236 = false
  A0_234["FirewallRules6.RuleType"] = A0_234["FirewallRules6.FromZoneType"] .. "_" .. A0_234["FirewallRules6.ToZoneType"]
  L2_236 = fwRules.config(A0_234, A1_235, "edit")
  if L2_236 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10802"
  end
end
function fwView.ipv6FirewallRulesGet(A0_237)
  local L1_238
  L1_238 = {}
  if A0_237 == "-1" then
    L1_238.FirewallRules6 = db.getRow("FirewallRules6", "_ROWID_", A0_237)
  else
    L1_238 = db.getRow("FirewallRules6", "_ROWID_", A0_237)
  end
  L1_238.Services = db.getTable("Services")
  L1_238.Schedules = db.getTable("Schedules")
  return L1_238
end
function fwView.ipv6FirewallRulesDelete(A0_239)
  local L1_240, L2_241, L3_242, L4_243, L5_244, L6_245, L7_246, L8_247, L9_248, L10_249, L11_250, L12_251
  L1_240 = ACCESS_LEVEL
  if L1_240 ~= 0 then
    L1_240 = "ACCESS_DENIED"
    L2_241 = "10187"
    return L1_240, L2_241
  end
  L1_240 = db
  L1_240 = L1_240.beginTransaction
  L1_240()
  L1_240 = true
  L2_241 = "12265"
  L3_242 = {}
  L4_243 = 0
  for L8_247, L9_248 in L5_244(L6_245) do
    L4_243 = L4_243 + 1
    L11_250 = "FirewallRules6"
    L12_251 = "_ROWID_"
    L3_242[L4_243] = L10_249
    L10_249["FirewallRules6._ROWID_"] = L9_248
    L11_250 = fwRules
    L11_250 = L11_250.config
    L12_251 = L10_249
    L11_250 = L11_250(L12_251, "-1", "delete")
    L1_240 = L11_250
    if L1_240 == false then
      L2_241 = "12077"
      break
    end
  end
  if L1_240 ~= false then
    L2_241 = "12078"
  end
  if L1_240 ~= false then
    if L6_245 ~= nil then
      L5_244 = L7_246 or ""
      if L5_244 ~= nil and L5_244 ~= "" then
        if L7_246 ~= false then
          for L11_250, L12_251 in L8_247(L9_248) do
            for _FORV_17_, _FORV_18_ in pairs(L3_242) do
              if L12_251 == _FORV_18_ then
                break
              end
            end
            if false then
            end
          end
          L11_250 = string
          L11_250 = L11_250.len
          L12_251 = L5_244
          L11_250 = L11_250(L12_251)
          L11_250 = L11_250 - 1
          L6_245["fwPriorityMap6.PriorityStr"] = L5_244
          DBTable = L8_247
          L11_250 = "edit"
          L1_240 = L8_247
          if L1_240 then
          else
            L2_241 = "12799"
          end
        else
          L1_240 = false
          L2_241 = "12799"
        end
      else
        L1_240 = false
        L2_241 = "12799"
      end
    else
      L1_240 = false
      L2_241 = "12799"
    end
  end
  if L1_240 then
    L5_244(L6_245)
    return L5_244, L6_245
  else
    L5_244()
    return L5_244, L6_245
  end
end
function fwView.ipv6FirewallRulesEnable(A0_252)
  local L1_253, L2_254, L3_255, L4_256, L5_257, L6_258, L7_259
  L1_253 = ACCESS_LEVEL
  if L1_253 ~= 0 then
    L1_253 = "ACCESS_DENIED"
    return L1_253, L2_254
  end
  L1_253 = db
  L1_253 = L1_253.beginTransaction
  L1_253()
  L1_253 = true
  for L5_257, L6_258 in L2_254(L3_255) do
    L7_259 = {}
    L7_259["FirewallRules6.Status"] = "1"
    ruleEnableStatus = fwRules.config(L7_259, L6_258, "edit")
    if ruleEnableStatus == false then
      break
    end
  end
  if L2_254 then
    L2_254(L3_255)
    return L2_254, L3_255
  else
    L2_254()
    return L2_254, L3_255
  end
end
function fwView.ipv6FirewallRulesDisable(A0_260)
  local L1_261, L2_262, L3_263, L4_264, L5_265, L6_266, L7_267
  L1_261 = ACCESS_LEVEL
  if L1_261 ~= 0 then
    L1_261 = "ACCESS_DENIED"
    return L1_261, L2_262
  end
  L1_261 = db
  L1_261 = L1_261.beginTransaction
  L1_261()
  L1_261 = true
  for L5_265, L6_266 in L2_262(L3_263) do
    L7_267 = {}
    L7_267["FirewallRules6.Status"] = "0"
    ruleDisableStatus = fwRules.config(L7_267, L6_266, "edit")
    if ruleDisableStatus == false then
      break
    end
  end
  if L2_262 then
    L2_262(L3_263)
    return L2_262, L3_263
  else
    L2_262()
    return L2_262, L3_263
  end
end
function fwView.ipv6FirewallRulesMove(A0_268, A1_269)
  local L2_270, L3_271, L4_272, L5_273, L6_274, L7_275, L8_276, L9_277, L10_278, L11_279, L12_280, L13_281, L14_282, L15_283
  L2_270 = ACCESS_LEVEL
  if L2_270 ~= 0 then
    L2_270 = "ACCESS_DENIED"
    L3_271 = "10187"
    return L2_270, L3_271
  end
  L2_270 = {}
  L3_271 = #A0_268
  if L3_271 == 0 then
    L3_271 = db
    L3_271 = L3_271.getAttribute
    L7_275 = "PriorityId"
    L3_271 = L3_271(L4_272, L5_273, L6_274, L7_275)
    L3_271 = L3_271 or ""
    L2_270["1"] = L3_271
  else
    L3_271 = 0
    for L7_275, L8_276 in L4_272(L5_273) do
      L3_271 = L3_271 + 1
      L2_270[L3_271] = L9_277
    end
  end
  L3_271 = db
  L3_271 = L3_271.beginTransaction
  L3_271()
  L3_271 = false
  L7_275 = "fwPriorityMap6"
  if L6_274 ~= nil then
    L7_275 = L6_274["fwPriorityMap6.PriorityStr"]
    L4_272 = L7_275 or ""
  end
  if L4_272 ~= nil and L4_272 ~= "" then
    L7_275 = util
    L7_275 = L7_275.split
    L7_275 = L7_275(L8_276, L9_277)
    if L7_275 ~= false then
      if L8_276 == 0 then
      else
        for L11_279, L12_280 in L8_276(L9_277) do
          L14_282 = L12_280
        end
      end
      for L12_280, L13_281 in L9_277(L10_278) do
        L14_282 = true
        for _FORV_18_, _FORV_19_ in L15_283(L2_270) do
          if L13_281 == _FORV_19_ then
            L14_282 = false
            break
          end
        end
        if L14_282 then
        end
      end
      if L4_272 == "" then
      elseif L9_277 == 1 then
      elseif L9_277 == L10_278 then
      elseif L9_277 ~= false then
        if L10_278 >= L11_279 then
        else
          for L14_282, L15_283 in L11_279(L12_280) do
            if L10_278 == tonumber(A1_269) then
            end
          end
        end
      end
    end
  end
  L6_274["fwPriorityMap6.PriorityStr"] = L4_272
  L7_275 = "fwPriorityMap6"
  DBTable = L7_275
  L7_275 = fwRules
  L7_275 = L7_275.config
  L7_275 = L7_275(L8_276, L9_277, L10_278)
  L3_271 = L7_275
  if L3_271 then
    L7_275 = db
    L7_275 = L7_275.commitTransaction
    L7_275(L8_276)
    L7_275 = "OK"
    return L7_275, L8_276
  else
    L7_275 = db
    L7_275 = L7_275.rollback
    L7_275()
    L7_275 = "ERROR"
    return L7_275, L8_276
  end
end
function fwView.defaultPolicyEdit(A0_284)
  local L1_285, L2_286, L3_287
  L1_285 = ACCESS_LEVEL
  if L1_285 ~= 0 then
    L1_285 = "ACCESS_DENIED"
    L2_286 = "10187"
    return L1_285, L2_286
  end
  L1_285 = db
  L1_285 = L1_285.beginTransaction
  L1_285()
  L1_285 = false
  L2_286 = {}
  L3_287 = {}
  DBTable = "fwDefaultOutBoundPolicy"
  if A0_284["Ipv4.DefaultPolicyStatus"] ~= nil then
    L2_286["fwDefaultOutBoundPolicy.DefaultPolicyStatus"] = A0_284["Ipv4.DefaultPolicyStatus"]
    L1_285 = fwRules.config(L2_286, "1", "edit")
  end
  if (db.getAttribute("networkInfo", "_ROWID_", "1", "netWorkMode") or "") ~= "1" and A0_284["Ipv6.DefaultPolicyStatus"] ~= nil then
    L3_287["fwDefaultOutBoundPolicy.DefaultPolicyStatus"] = A0_284["Ipv6.DefaultPolicyStatus"]
    L1_285 = fwRules.config(L3_287, "2", "edit")
  end
  if L1_285 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12798"
  end
end
function fwView.defaultPolicyGet()
  local L0_288
  L0_288 = {}
  L0_288.Ipv4DefaultPolicyStatus = db.getRow("fwDefaultOutBoundPolicy", "_ROWID_", "1")
  L0_288.Ipv6DefaultPolicyStatus = db.getRow("fwDefaultOutBoundPolicy", "_ROWID_", "2")
  return L0_288
end
function ipv6FirewallRulesDisplay()
  local L0_289, L1_290, L2_291, L3_292, L4_293
  L0_289 = "RuleType = 'SECURE_INSECURE'"
  L1_290 = L0_289
  L2_291 = " or RuleType = 'INSECURE_SECURE'"
  L0_289 = L1_290 .. L2_291
  L1_290 = db
  L1_290 = L1_290.getRowsWhere
  L2_291 = "FirewallRules6"
  L3_292 = L0_289
  L1_290 = L1_290(L2_291, L3_292)
  L2_291 = {}
  L3_292 = db
  L3_292 = L3_292.getAttribute
  L4_293 = "fwPriorityMap6"
  L3_292 = L3_292(L4_293, "RuleType", "ALL", "PriorityStr")
  L3_292 = L3_292 or ""
  if L3_292 ~= nil and L3_292 ~= "" then
    L4_293 = util
    L4_293 = L4_293.split
    L4_293 = L4_293(L3_292, ",")
    if L4_293 ~= false and #L4_293 ~= 0 then
      for _FORV_9_, _FORV_10_ in pairs(L4_293) do
        for _FORV_14_, _FORV_15_ in pairs(L1_290) do
          if _FORV_15_["FirewallRules6.PriorityId"] == _FORV_10_ then
            L2_291[0 + 1] = _FORV_15_
            break
          end
        end
      end
    end
  end
  L4_293 = 0
  for _FORV_8_, _FORV_9_ in pairs(L2_291) do
    L4_293 = L4_293 + 1
    if L2_291[L4_293]["FirewallRules6.FromZoneType"] == "SECURE" then
      L2_291[L4_293]["FirewallRules6.FromZone"] = "LAN"
    elseif L2_291[L4_293]["FirewallRules6.FromZoneType"] == "INSECURE" then
      L2_291[L4_293]["FirewallRules6.FromZone"] = "WAN"
    end
    if L2_291[L4_293]["FirewallRules6.ToZoneType"] == "SECURE" then
      L2_291[L4_293]["FirewallRules6.ToZone"] = "LAN"
    elseif L2_291[L4_293]["FirewallRules6.ToZoneType"] == "INSECURE" then
      L2_291[L4_293]["FirewallRules6.ToZone"] = "WAN"
    end
    if L2_291[L4_293]["FirewallRules6.Status"] == "0" then
      L2_291[L4_293]["FirewallRules6.ruleStatus"] = "Disabled"
    elseif L2_291[L4_293]["FirewallRules6.Status"] == "1" then
      L2_291[L4_293]["FirewallRules6.ruleStatus"] = "Enabled"
    end
    if L2_291[L4_293]["FirewallRules6.SourceAddressType"] == "0" then
      L2_291[L4_293]["FirewallRules6.SourceHosts"] = "Any"
    elseif L2_291[L4_293]["FirewallRules6.SourceAddressType"] == "1" then
      L2_291[L4_293]["FirewallRules6.SourceHosts"] = L2_291[L4_293]["FirewallRules6.SourceAddressStart"]
    elseif L2_291[L4_293]["FirewallRules6.SourceAddressType"] == "2" then
      L2_291[L4_293]["FirewallRules6.SourceHosts"] = L2_291[L4_293]["FirewallRules6.SourceAddressStart"] .. ":" .. L2_291[L4_293]["FirewallRules6.SourceAddressEnd"]
    end
    if L2_291[L4_293]["FirewallRules6.DestinationAddressType"] == "0" then
      L2_291[L4_293]["FirewallRules6.DestinationHosts"] = "Any"
    elseif L2_291[L4_293]["FirewallRules6.DestinationAddressType"] == "1" then
      L2_291[L4_293]["FirewallRules6.DestinationHosts"] = L2_291[L4_293]["FirewallRules6.DestinationAddressStart"]
    elseif L2_291[L4_293]["FirewallRules6.DestinationAddressType"] == "2" then
      L2_291[L4_293]["FirewallRules6.DestinationHosts"] = L2_291[L4_293]["FirewallRules6.DestinationAddressStart"] .. ":" .. L2_291[L4_293]["FirewallRules6.DestinationAddressEnd"]
    end
    if L2_291[L4_293]["FirewallRules6.LogLevel"] == "1" then
      L2_291[L4_293]["FirewallRules6.LogOption"] = "Never"
    elseif L2_291[L4_293]["FirewallRules6.LogLevel"] == "2" then
      L2_291[L4_293]["FirewallRules6.LogOption"] = "Always"
    end
    if L2_291[L4_293]["FirewallRules6.Action"] == "ACCEPT" then
      L2_291[L4_293]["FirewallRules6.displayAction"] = "Allow Always"
    elseif L2_291[L4_293]["FirewallRules6.Action"] == "DROP" then
      L2_291[L4_293]["FirewallRules6.displayAction"] = "Block Always"
    elseif L2_291[L4_293]["FirewallRules6.Action"] == "ACCEPT_BY_SCHED_MATCH" then
      L2_291[L4_293]["FirewallRules6.displayAction"] = "Allow By Schedule, otherwise Block"
    elseif L2_291[L4_293]["FirewallRules6.Action"] == "DROP_BY_SCHED_MATCH" then
      L2_291[L4_293]["FirewallRules6.displayAction"] = "Block By Schedule, otherwise Allow"
    end
  end
  return L2_291
end
function fwView.nwModeConfig(A0_294, A1_295, A2_296)
  local L3_297, L4_298, L5_299
  L3_297 = ACCESS_LEVEL
  if L3_297 ~= 0 then
    L3_297 = "ACCESS_DENIED"
    L4_298 = "10187"
    return L3_297, L4_298
  end
  L3_297 = db
  L3_297 = L3_297.getAttribute
  L4_298 = "unitInfo"
  L5_299 = "_ROWID_"
  L3_297 = L3_297(L4_298, L5_299, "1", "modelId")
  L4_298 = true
  L5_299 = {}
  DBTable = "NatTable"
  if A0_294["NatTable.Enable"] == "5" then
    L5_299["NatTable.Enable"] = "5"
  elseif A0_294["NatTable.Enable"] == "1" then
    L5_299["NatTable.Enable"] = "1"
    if L3_297 ~= nil and (L3_297 == "DSR-1000AC" or L3_297 == "DSR-1000N" or L3_297 == "DSR-1000" or L3_297 == "DSR-500AC" or L3_297 == "DSR-500N" or L3_297 == "DSR-500") then
      L5_299["NatTable.NATInterfaces"] = A0_294["NatTable.NATInterfaces"]
      L5_299["NatTable.RoutedInterfaces"] = A0_294["NatTable.RoutedInterfaces"]
    end
  elseif A0_294["NatTable.Enable"] == "6" then
    L5_299["NatTable.Enable"] = "6"
    L5_299["NatTable.NATInterfaces"] = A0_294["NatTable.NATInterfaces"]
    L5_299["NatTable.RoutedInterfaces"] = A0_294["NatTable.RoutedInterfaces"]
    L5_299["NatTable.BridgeVlan"] = A0_294["NatTable.BridgeVlan"]
  elseif A0_294["NatTable.Enable"] == "0" then
    L5_299["NatTable.Enable"] = "0"
  end
  L4_298 = fwRules.config(L5_299, A1_295, A2_296)
  if L4_298 then
    return "OK", "12265"
  else
    return "ERROR", "12016"
  end
end
function fwView.fwSessionconfig(A0_300, A1_301, A2_302)
  local L3_303
  L3_303 = ACCESS_LEVEL
  if L3_303 ~= 0 then
    L3_303 = "ACCESS_DENIED"
    return L3_303, "10187"
  end
  L3_303 = db
  L3_303 = L3_303.beginTransaction
  L3_303()
  L3_303 = true
  L3_303 = fwRules.config(A0_300, A1_301, A2_302)
  if L3_303 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12806"
  end
end
function fwView.trafficMeterConfig(A0_304, A1_305, A2_306)
  local L3_307
  L3_307 = ACCESS_LEVEL
  if L3_307 ~= 0 then
    L3_307 = "ACCESS_DENIED"
    return L3_307, "10187"
  end
  L3_307 = db
  L3_307 = L3_307.beginTransaction
  L3_307()
  L3_307 = true
  L3_307 = fwRules.config(A0_304, A1_305, A2_306)
  if L3_307 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12807"
  end
end
function fwView.deleteNatRules(A0_308)
  local L1_309, L2_310, L3_311, L4_312, L5_313, L6_314, L7_315
  L1_309 = ACCESS_LEVEL
  if L1_309 ~= 0 then
    L1_309 = "ACCESS_DENIED"
    return L1_309, L2_310
  end
  L1_309 = db
  L1_309 = L1_309.beginTransaction
  L1_309()
  L1_309 = true
  for L5_313, L6_314 in L2_310(L3_311) do
    L7_315 = {}
    L7_315["OneToOneNat._ROWID_"] = L6_314
    L1_309 = fwRules.config(L7_315, "-1", "delete")
  end
  if L1_309 then
    L2_310(L3_311)
    return L2_310, L3_311
  else
    L2_310()
    return L2_310, L3_311
  end
end
function fwView.natSeviceConfig(A0_316, A1_317, A2_318)
  local L3_319
  L3_319 = ACCESS_LEVEL
  if L3_319 ~= 0 then
    L3_319 = "ACCESS_DENIED"
    return L3_319, "10187"
  end
  L3_319 = db
  L3_319 = L3_319.beginTransaction
  L3_319()
  L3_319 = true
  L3_319 = fwRules.config(A0_316, A1_317, A2_318)
  if L3_319 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "11457"
  end
end
function fwView.deleteNatServices(A0_320)
  local L1_321, L2_322, L3_323, L4_324, L5_325, L6_326, L7_327
  L1_321 = ACCESS_LEVEL
  if L1_321 ~= 0 then
    L1_321 = "ACCESS_DENIED"
    return L1_321, L2_322
  end
  L1_321 = db
  L1_321 = L1_321.beginTransaction
  L1_321()
  L1_321 = true
  for L5_325, L6_326 in L2_322(L3_323) do
    L7_327 = {}
    L7_327["OneToOneNatService._ROWID_"] = L6_326
    L1_321 = fwRules.config(L7_327, "-1", "delete")
  end
  if L1_321 then
    L2_322(L3_323)
    return L2_322, L3_323
  else
    L2_322()
    return L2_322, L3_323
  end
end
function fwView.vlanNamesGet()
  return db.getRowsWhere("vlan", "portName = 'dummy'")
end
function fwView.ipsecMappingConfig(A0_328, A1_329, A2_330)
  local L3_331, L4_332, L5_333, L6_334, L7_335, L8_336, L9_337
  L3_331 = ACCESS_LEVEL
  if L3_331 ~= 0 then
    L3_331 = "ACCESS_DENIED"
    L4_332 = "10187"
    return L3_331, L4_332
  end
  L3_331 = db
  L3_331 = L3_331.beginTransaction
  L3_331()
  L3_331 = false
  L4_332 = A0_328["IpsecLocalTrafficSelectorMapping.sourceIpStart"]
  L5_333 = util
  L5_333 = L5_333.split
  L6_334 = L4_332
  L7_335 = "."
  L5_333 = L5_333(L6_334, L7_335)
  L6_334 = A0_328["IpsecLocalTrafficSelectorMapping.mappedIpStart"]
  L7_335 = util
  L7_335 = L7_335.split
  L8_336 = L6_334
  L9_337 = "."
  L7_335 = L7_335(L8_336, L9_337)
  L8_336 = A0_328["IpsecLocalTrafficSelectorMapping.rangeLength"]
  L9_337 = tonumber
  L9_337 = L9_337(L5_333[4])
  L9_337 = L9_337 + tonumber(L8_336)
  L9_337 = L9_337 - 1
  if not (L9_337 > 254) then
    L9_337 = tonumber
    L9_337 = L9_337(L7_335[4])
    L9_337 = L9_337 + tonumber(L8_336)
    L9_337 = L9_337 - 1
  elseif L9_337 > 254 then
    L9_337 = "ERROR"
    return L9_337, "20551"
  end
  L9_337 = A0_328["IpsecLocalTrafficSelectorMapping.vpnPolicyName"]
  A0_328["IpsecLocalTrafficSelectorMapping.vpnPolicyStatus"] = db.getRow("IpsecVPNPolicy", "VPNPolicyName", L9_337)["IpsecVPNPolicy.Status"]
  A0_328["IpsecLocalTrafficSelectorMapping.dstTrafficSeletorType"] = db.getRow("IpsecVPNPolicy", "VPNPolicyName", L9_337)["IpsecVPNPolicy.RemoteNetworkType"]
  A0_328["IpsecLocalTrafficSelectorMapping.dstTrafficSelectorIpStart"] = db.getRow("IpsecVPNPolicy", "VPNPolicyName", L9_337)["IpsecVPNPolicy.RemoteStartAddress"]
  A0_328["IpsecLocalTrafficSelectorMapping.dstTrafficSelectorIpEnd"] = db.getRow("IpsecVPNPolicy", "VPNPolicyName", L9_337)["IpsecVPNPolicy.RemoteEndAddress"]
  A0_328["IpsecLocalTrafficSelectorMapping.dstTrafficSelectorSubnetMask"] = db.getRow("IpsecVPNPolicy", "VPNPolicyName", L9_337)["IpsecVPNPolicy.RemoteSubnetMask"]
  L3_331 = fwRules.config(A0_328, A1_329, A2_330)
  if L3_331 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "20551"
  end
end
function fwView.ipsecMappingdeleteRules(A0_338)
  local L1_339, L2_340, L3_341, L4_342, L5_343, L6_344, L7_345, L8_346
  L1_339 = ACCESS_LEVEL
  if L1_339 ~= 0 then
    L1_339 = "ACCESS_DENIED"
    L2_340 = "10187"
    return L1_339, L2_340
  end
  L1_339 = db
  L1_339 = L1_339.beginTransaction
  L1_339()
  L1_339 = true
  L2_340 = "STATUS_OK"
  for L6_344, L7_345 in L3_341(L4_342) do
    L8_346 = {}
    L8_346["IpsecLocalTrafficSelectorMapping._ROWID_"] = L7_345
    L1_339 = fwRules.config(L8_346, "-1", "delete")
    if L1_339 == false then
      L2_340 = "20551"
      break
    end
  end
  if L1_339 ~= false then
    L2_340 = "20551"
  end
  if L1_339 then
    L3_341(L4_342)
    return L3_341, L4_342
  else
    L3_341()
    return L3_341, L4_342
  end
end
