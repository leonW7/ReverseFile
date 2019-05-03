require("teamf1lualib/db")
require("teamf1lualib/util")
l2FirewallRules = {}
l2FirewallRules.defaultfwPolicy = {}
function l2FirewallRules.config(A0_0, A1_1, A2_2)
  if A2_2 == "add" then
    return db.insert(DBTable, A0_0)
  elseif A2_2 == "edit" then
    return db.update(DBTable, A0_0, A1_1)
  elseif A2_2 == "delete" then
    return db.delete(DBTable, A0_0)
  end
  return false
end
function l2FirewallRules.listGet()
  local L0_3, L1_4, L2_5
  L0_3 = {}
  L1_4 = {}
  L2_5 = db
  L2_5 = L2_5.getTable
  L2_5 = L2_5("L2FirewallRules", true)
  if L2_5 == nil then
    return nil
  end
  util.appendDebugOut("List  of firewallRules " .. util.tableToStringRec(L2_5))
  for _FORV_6_, _FORV_7_ in pairs(L2_5) do
    L0_3[_FORV_6_] = {}
    L0_3[_FORV_6_] = util.removePrefix(L2_5[_FORV_6_], "L2FirewallRules.")
    L0_3[_FORV_6_].Direction = L0_3[_FORV_6_].RuleType
    if L0_3[_FORV_6_].Status == "1" then
      L0_3[_FORV_6_].ruleStatus = "Enabled"
    else
      L0_3[_FORV_6_].ruleStatus = "Disabled"
    end
    if L0_3[_FORV_6_].Action == "1" then
      L0_3[_FORV_6_].Action = "Allow Always"
    elseif L0_3[_FORV_6_].Action == "0" then
      L0_3[_FORV_6_].Action = "Block Always"
    end
    if L0_3[_FORV_6_].L2ServiceName == "ANY" then
      L0_3[_FORV_6_].ServiceName = "Any"
    end
    if L0_3[_FORV_6_].SourceMACAddressType == "0" then
      L0_3[_FORV_6_].SourceMacAddress = "Any"
    elseif L0_3[_FORV_6_].SourceMACAddressType == "1" then
      L0_3[_FORV_6_].SourceMacAddress = L0_3[_FORV_6_].SourceMACAddressStart
    elseif L0_3[_FORV_6_].SourceMACAddressType == "2" then
      L0_3[_FORV_6_].SourceMacAddress = L0_3[_FORV_6_].SourceMACAddressStart .. "-" .. L0_3[_FORV_6_].SourceMACAddressEnd
    end
    if L0_3[_FORV_6_].DestinationMACAddressType == "0" then
      L0_3[_FORV_6_].DestinationMacAddress = "Any"
    elseif L0_3[_FORV_6_].DestinationMACAddressType == "1" then
      L0_3[_FORV_6_].DestinationMacAddress = L0_3[_FORV_6_].DestinationMACAddressStart
    elseif L0_3[_FORV_6_].DestinationMACAddressType == "2" then
      L0_3[_FORV_6_].DestinationMacAddress = L0_3[_FORV_6_].DestinationMACAddressStart .. "-" .. L0_3[_FORV_6_].DestinationMACAddressEnd
    end
    if L0_3[_FORV_6_].SourceAddressType == "0" then
      L0_3[_FORV_6_].SourceIPAddress = "Any"
    elseif L0_3[_FORV_6_].SourceAddressType == "1" then
      L0_3[_FORV_6_].SourceIPAddress = L0_3[_FORV_6_].SourceAddressStart
    elseif L0_3[_FORV_6_].SourceAddressType == "2" then
      L0_3[_FORV_6_].SourceIPAddress = L0_3[_FORV_6_].SourceAddressStart .. "-" .. L0_3[_FORV_6_].SourceAddressEnd
    end
    if L0_3[_FORV_6_].DestinationAddressType == "0" then
      L0_3[_FORV_6_].DestinationIPAddress = "Any"
    elseif L0_3[_FORV_6_].DestinationAddressType == "1" then
      L0_3[_FORV_6_].DestinationIPAddress = L0_3[_FORV_6_].DestinationAddressStart
    elseif L0_3[_FORV_6_].DestinationAddressType == "2" then
      L0_3[_FORV_6_].DestinationIPAddress = L0_3[_FORV_6_].DestinationAddressStart .. "-" .. L0_3[_FORV_6_].DestinationAddressEnd
    end
  end
  util.appendDebugOut("List of firewallRules " .. util.tableToStringRec(L0_3))
  return L0_3
end
function l2FirewallRules.addGet()
  local L0_6, L1_7, L2_8, L3_9, L4_10
  L0_6 = {}
  L1_7 = {}
  L2_8 = {}
  L3_9 = db
  L3_9 = L3_9.getTable
  L4_10 = "L2Services"
  L3_9 = L3_9(L4_10, false)
  L4_10 = db
  L4_10 = L4_10.getTable
  L4_10 = L4_10("Services", false)
  util.appendDebugOut("Services Table: " .. util.tableToStringRec(L4_10))
  for _FORV_8_, _FORV_9_ in pairs(L3_9) do
    L0_6[_FORV_8_] = {}
    L0_6[_FORV_8_].ServiceName = _FORV_9_.ServiceName
  end
  util.appendDebugOut("Services Table: " .. util.tableToStringRec(L0_6))
  for _FORV_8_, _FORV_9_ in pairs(L4_10) do
    L1_7[_FORV_8_] = {}
    L1_7[_FORV_8_].ServiceName = _FORV_9_.ServiceName
  end
  util.appendDebugOut("Services Table: " .. util.tableToStringRec(L1_7))
  ;({}).L2ServiceNames = L0_6
  ;({}).ServiceNames = L1_7
  ;({}).ServiceName = ""
  ;({}).Status = 1
  ;({}).SourceAddressType = 0
  ;({}).SourceAddressStart = ""
  ;({}).SourceAddressEnd = ""
  ;({}).DestinationAddressType = 0
  ;({}).DestinationAddressStart = ""
  ;({}).DestinationAddressEnd = ""
  ;({}).SourceMACAddressType = 0
  ;({}).SourceMACAddressStart = ""
  ;({}).SourceMACAddressEnd = ""
  ;({}).DestinationMACAddressType = 0
  ;({}).DestinationMACAddressStart = ""
  ;({}).DestinationMACAddressEnd = ""
  ;({}).dscp = ""
  ;({}).classId = ""
  ;({}).vlanId = ""
  ;({}).ScheduleName = ""
  return {}
end
function l2FirewallRules.addSet(A0_11)
  local L1_12
  L1_12 = util
  L1_12 = L1_12.appendDebugOut
  L1_12("Insert values: " .. util.tableToStringRec(A0_11))
  L1_12 = {}
  L1_12["L2FirewallRules.OID"] = ""
  L1_12["L2FirewallRules.RuleType"] = A0_11.Direction
  if A0_11.Action == "ACCEPT" then
    L1_12["L2FirewallRules.Action"] = "1"
  else
    L1_12["L2FirewallRules.Action"] = "0"
  end
  L1_12["L2FirewallRules.Status"] = 1
  L1_12["L2FirewallRules.L2ServiceName"] = A0_11.L2ServiceName
  L1_12["L2FirewallRules.ServiceName"] = A0_11.ServiceName
  L1_12["L2FirewallRules.SourceAddressType"] = A0_11.SourceAddressType
  L1_12["L2FirewallRules.SourceAddressStart"] = A0_11.SourceAddressStart
  L1_12["L2FirewallRules.SourceAddressEnd"] = A0_11.SourceAddressEnd
  L1_12["L2FirewallRules.DestinationAddressType"] = A0_11.DestinationAddressType
  L1_12["L2FirewallRules.DestinationAddressStart"] = A0_11.DestinationAddressStart
  L1_12["L2FirewallRules.DestinationAddressEnd"] = A0_11.DestinationAddressEnd
  L1_12["L2FirewallRules.SourceMACAddressType"] = A0_11.SourceMACAddressType
  L1_12["L2FirewallRules.SourceMACAddressStart"] = A0_11.SourceMACAddressStart
  L1_12["L2FirewallRules.SourceMACAddressEnd"] = A0_11.SourceMACAddressEnd
  L1_12["L2FirewallRules.DestinationMACAddressType"] = A0_11.DestinationMACAddressType
  L1_12["L2FirewallRules.DestinationMACAddressStart"] = A0_11.DestinationMACAddressStart
  L1_12["L2FirewallRules.DestinationMACAddressEnd"] = A0_11.DestinationMACAddressEnd
  L1_12["L2FirewallRules.dscp"] = ""
  L1_12["L2FirewallRules.classId"] = ""
  L1_12["L2FirewallRules.vlanId"] = ""
  L1_12["L2FirewallRules.ScheduleName"] = ""
  util.appendDebugOut("Inserting values: " .. util.tableToStringRec(L1_12))
  db.beginTransaction()
  DBTable = "L2FirewallRules"
  if l2FirewallRules.config(L1_12, "-1", "add") then
    db.commitTransaction()
    db.save()
    return "OK", "STATUS_OK"
  else
    db.rollback()
    return "ERROR", "10802"
  end
end
function l2FirewallRules.editGet(A0_13)
  local L1_14, L2_15, L3_16, L4_17, L5_18, L6_19
  L1_14 = db
  L1_14 = L1_14.getRowWhere
  L2_15 = "L2FirewallRules"
  L3_16 = "_ROWID_ = "
  L4_17 = A0_13
  L3_16 = L3_16 .. L4_17
  L1_14 = L1_14(L2_15, L3_16)
  L2_15 = util
  L2_15 = L2_15.appendDebugOut
  L3_16 = "firewallRule: "
  L4_17 = util
  L4_17 = L4_17.tableToString
  L5_18 = L1_14
  L4_17 = L4_17(L5_18)
  L3_16 = L3_16 .. L4_17
  L2_15(L3_16)
  L2_15 = {}
  L3_16 = {}
  L4_17 = {}
  L5_18 = db
  L5_18 = L5_18.getTable
  L5_18 = L5_18(L6_19, false)
  L6_19("L2Services Table: " .. util.tableToStringRec(L5_18))
  for _FORV_9_, _FORV_10_ in L6_19(L5_18) do
    L3_16[_FORV_9_] = {}
    L3_16[_FORV_9_].ServiceName = _FORV_10_.ServiceName
  end
  L6_19("Services Table: " .. util.tableToStringRec(L3_16))
  util.appendDebugOut("Services Table: " .. util.tableToStringRec(L6_19))
  for _FORV_10_, _FORV_11_ in pairs(L6_19) do
    L4_17[_FORV_10_] = {}
    L4_17[_FORV_10_].ServiceName = _FORV_11_.ServiceName
  end
  util.appendDebugOut("Services Table: " .. util.tableToStringRec(L4_17))
  ;({}).L2ServiceNames = L3_16
  ;({}).ServiceNames = L4_17
  ;({}).L2ServiceName = L1_14["L2FirewallRules.L2ServiceName"]
  if ({}).L2ServiceName ~= "ANY" then
    ({}).ServiceName = L1_14["L2FirewallRules.ServiceName"]
  end
  ;({}).Status = L1_14["L2FirewallRules.Status"]
  if L1_14["L2FirewallRules.Action"] == "1" then
    ({}).Action = "ACCEPT"
  else
    ({}).Action = "DROP"
  end
  ;({}).Direction = L1_14["L2FirewallRules.RuleType"]
  ;({}).SourceAddressType = L1_14["L2FirewallRules.SourceAddressType"]
  ;({}).SourceAddressStart = L1_14["L2FirewallRules.SourceAddressStart"]
  ;({}).SourceAddressEnd = L1_14["L2FirewallRules.SourceAddressEnd"]
  ;({}).DestinationAddressType = L1_14["L2FirewallRules.DestinationAddressType"]
  ;({}).DestinationAddressStart = L1_14["L2FirewallRules.DestinationAddressStart"]
  ;({}).DestinationAddressEnd = L1_14["L2FirewallRules.DestinationAddressEnd"]
  ;({}).SourceMACAddressType = L1_14["L2FirewallRules.SourceMACAddressType"]
  ;({}).SourceMACAddressStart = L1_14["L2FirewallRules.SourceMACAddressStart"]
  ;({}).SourceMACAddressEnd = L1_14["L2FirewallRules.SourceMACAddressEnd"]
  ;({}).DestinationMACAddressType = L1_14["L2FirewallRules.DestinationMACAddressType"]
  ;({}).DestinationMACAddressStart = L1_14["L2FirewallRules.DestinationMACAddressStart"]
  ;({}).DestinationMACAddressEnd = L1_14["L2FirewallRules.DestinationMACAddressEnd"]
  ;({}).dscp = ""
  ;({}).classId = ""
  ;({}).vlanId = ""
  ;({}).ScheduleName = ""
  return {}
end
function l2FirewallRules.editSet(A0_20, A1_21)
  local L2_22
  L2_22 = util
  L2_22 = L2_22.appendDebugOut
  L2_22("Insert values: " .. util.tableToStringRec(A0_20))
  L2_22 = {}
  L2_22["L2FirewallRules.OID"] = ""
  L2_22["L2FirewallRules.RuleType"] = A0_20.Direction
  if A0_20.Action == "ACCEPT" then
    L2_22["L2FirewallRules.Action"] = "1"
  else
    L2_22["L2FirewallRules.Action"] = "0"
  end
  L2_22["L2FirewallRules.Status"] = A0_20.Status
  L2_22["L2FirewallRules.L2ServiceName"] = A0_20.L2ServiceName
  L2_22["L2FirewallRules.ServiceName"] = A0_20.ServiceName
  L2_22["L2FirewallRules.SourceAddressType"] = A0_20.SourceAddressType
  L2_22["L2FirewallRules.SourceAddressStart"] = A0_20.SourceAddressStart
  L2_22["L2FirewallRules.SourceAddressEnd"] = A0_20.SourceAddressEnd
  L2_22["L2FirewallRules.DestinationAddressType"] = A0_20.DestinationAddressType
  L2_22["L2FirewallRules.DestinationAddressStart"] = A0_20.DestinationAddressStart
  L2_22["L2FirewallRules.DestinationAddressEnd"] = A0_20.DestinationAddressEnd
  L2_22["L2FirewallRules.SourceMACAddressType"] = A0_20.SourceMACAddressType
  L2_22["L2FirewallRules.SourceMACAddressStart"] = A0_20.SourceMACAddressStart
  L2_22["L2FirewallRules.SourceMACAddressEnd"] = A0_20.SourceMACAddressEnd
  L2_22["L2FirewallRules.DestinationMACAddressType"] = A0_20.DestinationMACAddressType
  L2_22["L2FirewallRules.DestinationMACAddressStart"] = A0_20.DestinationMACAddressStart
  L2_22["L2FirewallRules.DestinationMACAddressEnd"] = A0_20.DestinationMACAddressEnd
  L2_22["L2FirewallRules.dscp"] = ""
  L2_22["L2FirewallRules.classId"] = ""
  L2_22["L2FirewallRules.vlanId"] = ""
  L2_22["L2FirewallRules.ScheduleName"] = ""
  util.appendDebugOut("Inserting values: " .. util.tableToStringRec(L2_22))
  db.beginTransaction()
  DBTable = "L2FirewallRules"
  if l2FirewallRules.config(L2_22, A1_21, "edit") then
    db.commitTransaction()
    db.save()
    return "OK", "STATUS_OK"
  else
    db.rollback()
    return "ERROR", "10802"
  end
end
function l2FirewallRules.delete(A0_23)
  local L1_24, L2_25, L3_26, L4_27, L5_28, L6_29, L7_30
  L1_24 = db
  L1_24 = L1_24.beginTransaction
  L1_24()
  L1_24 = false
  DBTable = L2_25
  for L5_28, L6_29 in L2_25(L3_26) do
    L7_30 = {}
    L7_30["L2FirewallRules._ROWID_"] = L6_29
    L1_24 = db.delete("L2FirewallRules", L7_30)
    if L1_24 == false then
      break
    end
  end
  if L1_24 then
    L2_25()
    L2_25()
    L2_25(L3_26)
    return L2_25, L3_26
  else
    L2_25()
    L2_25(L3_26)
    return L2_25, L3_26
  end
end
function l2FirewallRules.enable(A0_31)
  local L1_32, L2_33, L3_34, L4_35, L5_36, L6_37
  L1_32 = db
  L1_32 = L1_32.beginTransaction
  L1_32()
  L1_32 = false
  DBTable = L2_33
  for L5_36, L6_37 in L2_33(L3_34) do
    L1_32 = db.setAttribute("L2FirewallRules", "_ROWID_", L6_37, "Status", "1")
    if L1_32 == false then
      break
    end
  end
  if L1_32 then
    L2_33()
    L2_33()
    L2_33(L3_34)
    return L2_33, L3_34
  else
    L2_33()
    L2_33(L3_34)
    return L2_33, L3_34
  end
end
function l2FirewallRules.disable(A0_38)
  local L1_39, L2_40, L3_41, L4_42, L5_43, L6_44
  L1_39 = db
  L1_39 = L1_39.beginTransaction
  L1_39()
  L1_39 = false
  for L5_43, L6_44 in L2_40(L3_41) do
    L1_39 = db.setAttribute("L2FirewallRules", "_ROWID_", L6_44, "Status", "0")
    if L1_39 == false then
      break
    end
  end
  if L1_39 then
    L2_40()
    L2_40()
    L2_40(L3_41)
    return L2_40, L3_41
  else
    L2_40()
    L2_40(L3_41)
    return L2_40, L3_41
  end
end
function l2FirewallRules.defaultfwPolicy.editGet()
  local L0_45, L1_46
  L0_45 = db
  L0_45 = L0_45.getRowWhere
  L1_46 = "L2FirewallDefaultPolicy"
  L0_45 = L0_45(L1_46, "_ROWID_ = 1")
  L1_46 = util
  L1_46 = L1_46.removePrefix
  L1_46 = L1_46(L0_45, "L2FirewallDefaultPolicy.")
  util.appendDebugOut("Default Policy: " .. util.tableToStringRec(L1_46))
  return L1_46
end
function l2FirewallRules.defaultfwPolicy.editSet(A0_47)
  local L1_48
  L1_48 = util
  L1_48 = L1_48.appendDebugOut
  L1_48("InputTable: " .. util.tableToStringRec(A0_47))
  L1_48 = util
  L1_48 = L1_48.addPrefix
  L1_48 = L1_48(A0_47, "L2FirewallDefaultPolicy.")
  db.beginTransaction()
  DBTable = "L2FirewallDefaultPolicy"
  if l2FirewallRules.config(L1_48, "1", "edit") then
    db.commitTransaction()
    db.save()
    return "OK", "STATUS_OK"
  else
    db.rollback()
    return "ERROR", "DEFAULT_POLICY_SET_FAILED"
  end
end
