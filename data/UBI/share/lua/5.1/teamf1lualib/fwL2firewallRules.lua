local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/fwValidations")
L0_0 = require
L0_0("teamf1lualib/fwPriorityMap")
L0_0 = "1"
fw.core.l2firewallRules = {}
fw.core.l2firewallRules.L2 = {}
L2firewallRulesTable = "L2FirewallRules"
l2ServicesTable = "L2Services"
ServicesTable = "Services"
;({}).ruleType = "RuleType"
;({}).status = "Status"
;({}).serviceName = "L2ServiceName"
;({}).action = "Action"
;({}).scheduleName = "ScheduleName"
;({}).sourceAddressType = "SourceAddressType"
;({}).sourceAddressStart = "SourceAddressStart"
;({}).sourceAddressEnd = "SourceAddressEnd"
;({}).destinationAddressType = "DestinationAddressType"
;({}).destinationAddressStart = "DestinationAddressStart"
;({}).destinationAddressEnd = "DestinationAddressEnd"
;({}).sourceMACAddressStart = "SourceMACAddressStart"
;({}).sourceMACAddressEnd = "SourceMACAddressEnd"
;({}).destinationMACAddressType = "DestinationMACAddressType"
;({}).destinationMACAddressStart = "DestinationMACAddressStart"
;({}).destinationMACAddressEnd = "DestinationMACAddressEnd"
;({}).vlanId = "vlanId"
;({}).dscp = "dscp"
;({}).classId = "classId"
;({}).ServiceName = "ServiceName"
;({}).sourceMACAddressType = "SourceMACAddressType"
;({}).direction = "Direction"
OTHER = "OTHER"
function fw.core.l2firewallRules.L2.delete(A0_1)
  local L1_2, L2_3, L3_4
  if A0_1 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_2 = db.existsRow(L2firewallRulesTable, _UPVALUE1_, A0_1)
  if not L1_2 then
    return returnCodes.COOKIEFAIL
  end
  L3_4 = db.deleteRow(L2firewallRulesTable, _UPVALUE1_, A0_1)
  if not L3_4 then
    return returnCodes.FAILURE, A0_1
  end
  return returnCodes.SUCCESS, A0_1
end
function fw.core.l2firewallRules.L2.deleteAll()
  local L0_5, L1_6
  L1_6 = db.deleteAllRows(L2firewallRulesTable)
  if not L1_6 then
    return returnCodes.FAILURE, cookie
  end
  return returnCodes.SUCCESS, cookie
end
function fw.core.l2firewallRules.L2.addGet()
  local L0_7, L1_8, L2_9, L3_10, L4_11
  L0_7 = {}
  L1_8 = {}
  L2_9 = {}
  L3_10 = db
  L3_10 = L3_10.getTable
  L4_11 = l2ServicesTable
  L3_10 = L3_10(L4_11, false)
  L4_11 = db
  L4_11 = L4_11.getTable
  L4_11 = L4_11(ServicesTable, false)
  util.appendDebugOut("Services Table: " .. util.tableToStringRec(L4_11))
  for _FORV_8_, _FORV_9_ in pairs(L3_10) do
    L0_7[_FORV_8_] = {}
    L0_7[_FORV_8_][_UPVALUE0_.ServiceName] = _FORV_9_.ServiceName
  end
  util.appendDebugOut("Services Table: " .. util.tableToStringRec(L0_7))
  for _FORV_8_, _FORV_9_ in pairs(L4_11) do
    L1_8[_FORV_8_] = {}
    L1_8[_FORV_8_][_UPVALUE0_.ServiceName] = _FORV_9_.ServiceName
  end
  util.appendDebugOut("Services Table: " .. util.tableToStringRec(L1_8))
  ;({}).L2ServiceNames = L0_7
  ;({}).ServiceNames = L1_8
  ;({}).ServiceName = ""
  ;({})[_UPVALUE0_.status] = 1
  ;({})[_UPVALUE0_.sourceAddressType] = "0"
  ;({})[_UPVALUE0_.sourceAddressStart] = ""
  ;({})[_UPVALUE0_.sourceAddressEnd] = ""
  ;({})[_UPVALUE0_.destinationAddressType] = "0"
  ;({})[_UPVALUE0_.destinationAddressStart] = ""
  ;({})[_UPVALUE0_.destinationAddressEnd] = ""
  ;({})[_UPVALUE0_.sourceMACAddressType] = "0"
  ;({})[_UPVALUE0_.sourceMACAddressStart] = ""
  ;({})[_UPVALUE0_.sourceMACAddressEnd] = ""
  ;({})[_UPVALUE0_.destinationMACAddressType] = "0"
  ;({})[_UPVALUE0_.destinationMACAddressStart] = ""
  ;({})[_UPVALUE0_.destinationMACAddressEnd] = ""
  ;({})[_UPVALUE0_.dscp] = ""
  ;({})[_UPVALUE0_.classId] = ""
  ;({})[_UPVALUE0_.vlanId] = ""
  ;({})[_UPVALUE0_.scheduleName] = ""
  return {}
end
function fw.core.l2firewallRules.L2.editGet(A0_12)
  local L1_13, L2_14, L3_15, L4_16, L5_17, L6_18
  L1_13 = db
  L1_13 = L1_13.getRowWhere
  L2_14 = L2firewallRulesTable
  L3_15 = "_ROWID_ = "
  L4_16 = A0_12
  L3_15 = L3_15 .. L4_16
  L1_13 = L1_13(L2_14, L3_15)
  L2_14 = util
  L2_14 = L2_14.appendDebugOut
  L3_15 = "firewallRule: "
  L4_16 = util
  L4_16 = L4_16.tableToString
  L5_17 = L1_13
  L4_16 = L4_16(L5_17)
  L3_15 = L3_15 .. L4_16
  L2_14(L3_15)
  L2_14 = {}
  L3_15 = {}
  L4_16 = {}
  L5_17 = db
  L5_17 = L5_17.getTable
  L5_17 = L5_17(L6_18, false)
  L6_18("L2Services Table: " .. util.tableToStringRec(L5_17))
  for _FORV_9_, _FORV_10_ in L6_18(L5_17) do
    L3_15[_FORV_9_] = {}
    L3_15[_FORV_9_][_UPVALUE0_.ServiceName] = _FORV_10_.ServiceName
  end
  L6_18("Services Table: " .. util.tableToStringRec(L3_15))
  util.appendDebugOut("Services Table: " .. util.tableToStringRec(L6_18))
  for _FORV_10_, _FORV_11_ in pairs(L6_18) do
    L4_16[_FORV_10_] = {}
    L4_16[_FORV_10_][_UPVALUE0_.ServiceName] = _FORV_11_.ServiceName
  end
  util.appendDebugOut("Services Table: " .. util.tableToStringRec(L4_16))
  ;({}).L2ServiceNames = L3_15
  ;({}).ServiceNames = L4_16
  ;({}).L2ServiceName = L1_13[L2firewallRulesTable .. "." .. _UPVALUE0_.serviceName]
  if ({}).L2ServiceName ~= "ANY" then
    ({}).ServiceName = L1_13[L2firewallRulesTable .. "." .. _UPVALUE0_.ServiceName]
  end
  ;({})[_UPVALUE0_.status] = L1_13[L2firewallRulesTable .. "." .. _UPVALUE0_.status]
  if L1_13[L2firewallRulesTable .. "." .. _UPVALUE0_.action] == "1" then
    ({})[_UPVALUE0_.action] = "ACCEPT"
  else
    ({})[_UPVALUE0_.action] = "DROP"
  end
  ;({})[_UPVALUE0_.direction] = L1_13[L2firewallRulesTable .. "." .. _UPVALUE0_.ruleType]
  ;({})[_UPVALUE0_.sourceAddressType] = L1_13[L2firewallRulesTable .. "." .. _UPVALUE0_.sourceAddressType]
  ;({})[_UPVALUE0_.sourceAddressStart] = L1_13[L2firewallRulesTable .. "." .. _UPVALUE0_.sourceAddressStart]
  ;({})[_UPVALUE0_.sourceAddressEnd] = L1_13[L2firewallRulesTable .. "." .. _UPVALUE0_.sourceAddressEnd]
  ;({})[_UPVALUE0_.destinationAddressType] = L1_13[L2firewallRulesTable .. "." .. _UPVALUE0_.destinationAddressType]
  ;({})[_UPVALUE0_.destinationAddressStart] = L1_13[L2firewallRulesTable .. "." .. _UPVALUE0_.destinationAddressStart]
  ;({})[_UPVALUE0_.destinationAddressEnd] = L1_13[L2firewallRulesTable .. "." .. _UPVALUE0_.destinationAddressEnd]
  ;({})[_UPVALUE0_.sourceMACAddressType] = L1_13[L2firewallRulesTable .. "." .. _UPVALUE0_.sourceMACAddressType]
  ;({})[_UPVALUE0_.sourceMACAddressStart] = L1_13[L2firewallRulesTable .. "." .. _UPVALUE0_.sourceMACAddressStart]
  ;({})[_UPVALUE0_.sourceMACAddressEnd] = L1_13[L2firewallRulesTable .. "." .. _UPVALUE0_.sourceMACAddressEnd]
  ;({})[_UPVALUE0_.destinationMACAddressType] = L1_13[L2firewallRulesTable .. "." .. _UPVALUE0_.destinationMACAddressType]
  ;({})[_UPVALUE0_.destinationMACAddressStart] = L1_13[L2firewallRulesTable .. "." .. _UPVALUE0_.destinationMACAddressStart]
  ;({})[_UPVALUE0_.destinationMACAddressEnd] = L1_13[L2firewallRulesTable .. "." .. _UPVALUE0_.destinationMACAddressEnd]
  ;({})[_UPVALUE0_.dscp] = ""
  ;({})[_UPVALUE0_.classId] = ""
  ;({})[_UPVALUE0_.vlanId] = ""
  ;({})[_UPVALUE0_.scheduleName] = ""
  return {}
end
function fw.core.l2firewallRules.L2.addSet(A0_19)
  local L1_20, L2_21
  L1_20 = util
  L1_20 = L1_20.appendDebugOut
  L2_21 = "Insert values: "
  L2_21 = L2_21 .. util.tableToStringRec(A0_19)
  L1_20(L2_21)
  L1_20 = {}
  L2_21 = util
  L2_21 = L2_21.removePrefix
  L2_21 = L2_21(A0_19, "bridgeFirewallRules.")
  A0_19 = L2_21
  L1_20["L2FirewallRules.OID"] = ""
  L2_21 = L2firewallRulesTable
  L2_21 = L2_21 .. "." .. _UPVALUE0_.ruleType
  L1_20[L2_21] = A0_19[_UPVALUE0_.direction]
  L2_21 = _UPVALUE0_
  L2_21 = L2_21.action
  L2_21 = A0_19[L2_21]
  if L2_21 == "ACCEPT" then
    L2_21 = L2firewallRulesTable
    L2_21 = L2_21 .. "." .. _UPVALUE0_.action
    L1_20[L2_21] = "1"
  else
    L2_21 = L2firewallRulesTable
    L2_21 = L2_21 .. "." .. _UPVALUE0_.action
    L1_20[L2_21] = "0"
  end
  L2_21 = db
  L2_21 = L2_21.getRowsWhere
  L2_21 = L2_21(L2firewallRulesTable, " RuleType == 'Inbound' or RuleType == 'Outbound'")
  if #L2_21 >= 600 then
    return returnCodes.EXCEED_MAX_LIMIT
  elseif L1_20[L2firewallRulesTable .. "." .. _UPVALUE0_.ruleType] == "Outbound" then
    L2_21 = db.getRowsWhere(L2firewallRulesTable, " RuleType == 'Outbound'")
    if #L2_21 >= 300 then
      return returnCodes.EXCEED_OUTBOUND_LIMIT
    end
  elseif L1_20[L2firewallRulesTable .. "." .. _UPVALUE0_.ruleType] == "Inbound" then
    L2_21 = db.getRowsWhere(L2firewallRulesTable, " RuleType == 'Inbound'")
    if #L2_21 >= 300 then
      return returnCodes.EXCEED_INBOUND_LIMIT
    end
  end
  L1_20[L2firewallRulesTable .. "." .. _UPVALUE0_.status] = 1
  L1_20[L2firewallRulesTable .. "." .. _UPVALUE0_.serviceName] = A0_19[_UPVALUE0_.serviceName]
  L1_20[L2firewallRulesTable .. "." .. _UPVALUE0_.ServiceName] = A0_19[_UPVALUE0_.ServiceName]
  L1_20[L2firewallRulesTable .. "." .. _UPVALUE0_.sourceAddressType] = A0_19[_UPVALUE0_.sourceAddressType]
  L1_20[L2firewallRulesTable .. "." .. _UPVALUE0_.sourceAddressStart] = A0_19[_UPVALUE0_.sourceAddressStart]
  L1_20[L2firewallRulesTable .. "." .. _UPVALUE0_.sourceAddressEnd] = A0_19[_UPVALUE0_.sourceAddressEnd]
  L1_20[L2firewallRulesTable .. "." .. _UPVALUE0_.destinationAddressType] = A0_19[_UPVALUE0_.destinationAddressType]
  L1_20[L2firewallRulesTable .. "." .. _UPVALUE0_.destinationAddressStart] = A0_19[_UPVALUE0_.destinationAddressStart]
  L1_20[L2firewallRulesTable .. "." .. _UPVALUE0_.destinationAddressEnd] = A0_19[_UPVALUE0_.destinationAddressEnd]
  L1_20[L2firewallRulesTable .. "." .. _UPVALUE0_.sourceMACAddressType] = A0_19[_UPVALUE0_.sourceMACAddressType]
  L1_20[L2firewallRulesTable .. "." .. _UPVALUE0_.sourceMACAddressStart] = A0_19[_UPVALUE0_.sourceMACAddressStart]
  L1_20[L2firewallRulesTable .. "." .. _UPVALUE0_.sourceMACAddressEnd] = A0_19[_UPVALUE0_.sourceMACAddressEnd]
  L1_20[L2firewallRulesTable .. "." .. _UPVALUE0_.destinationMACAddressType] = A0_19[_UPVALUE0_.destinationMACAddressType]
  L1_20[L2firewallRulesTable .. "." .. _UPVALUE0_.destinationMACAddressStart] = A0_19[_UPVALUE0_.destinationMACAddressStart]
  L1_20[L2firewallRulesTable .. "." .. _UPVALUE0_.destinationMACAddressEnd] = A0_19[_UPVALUE0_.destinationMACAddressEnd]
  L1_20["L2FirewallRules.dscp"] = ""
  L1_20["L2FirewallRules.classId"] = ""
  L1_20["L2FirewallRules.vlanId"] = ""
  L1_20["L2FirewallRules.ScheduleName"] = ""
  util.appendDebugOut("Inserting values: " .. util.tableToStringRec(L1_20))
  DBTable = L2firewallRulesTable
  if db.insert(L2firewallRulesTable, L1_20) then
    return returnCodes.SUCCESS, cookie
  else
    return returnCodes.FAILURE, cookie
  end
end
function fw.core.l2firewallRules.L2.editSet(A0_22, A1_23)
  local L2_24
  L2_24 = util
  L2_24 = L2_24.appendDebugOut
  L2_24("Insert values: " .. util.tableToStringRec(A0_22))
  L2_24 = {}
  A0_22 = util.removePrefix(A0_22, "bridgeFirewallRules.")
  L2_24["L2FirewallRules.OID"] = ""
  L2_24[L2firewallRulesTable .. "." .. _UPVALUE0_.ruleType] = A0_22[_UPVALUE0_.direction]
  if A0_22[_UPVALUE0_.action] == "ACCEPT" then
    L2_24[L2firewallRulesTable .. "." .. _UPVALUE0_.action] = "1"
  else
    L2_24[L2firewallRulesTable .. "." .. _UPVALUE0_.action] = "0"
  end
  if L2_24[L2firewallRulesTable .. "." .. _UPVALUE0_.ruleType] == "Outbound" then
    if #db.getRowsWhere(L2firewallRulesTable, " RuleType == 'Outbound'") >= 300 then
      return returnCodes.EXCEED_OUTBOUND_LIMIT
    end
  elseif L2_24[L2firewallRulesTable .. "." .. _UPVALUE0_.ruleType] == "Inbound" and 300 <= #db.getRowsWhere(L2firewallRulesTable, " RuleType == 'Inbound'") then
    return returnCodes.EXCEED_INBOUND_LIMIT
  end
  L2_24[L2firewallRulesTable .. "." .. _UPVALUE0_.status] = A0_22[_UPVALUE0_.status]
  L2_24[L2firewallRulesTable .. "." .. _UPVALUE0_.serviceName] = A0_22[_UPVALUE0_.serviceName]
  L2_24[L2firewallRulesTable .. "." .. _UPVALUE0_.ServiceName] = A0_22[_UPVALUE0_.ServiceName]
  L2_24[L2firewallRulesTable .. "." .. _UPVALUE0_.sourceAddressType] = A0_22[_UPVALUE0_.sourceAddressType]
  L2_24[L2firewallRulesTable .. "." .. _UPVALUE0_.sourceAddressStart] = A0_22[_UPVALUE0_.sourceAddressStart]
  L2_24[L2firewallRulesTable .. "." .. _UPVALUE0_.sourceAddressEnd] = A0_22[_UPVALUE0_.sourceAddressEnd]
  L2_24[L2firewallRulesTable .. "." .. _UPVALUE0_.destinationAddressType] = A0_22[_UPVALUE0_.destinationAddressType]
  L2_24[L2firewallRulesTable .. "." .. _UPVALUE0_.destinationAddressStart] = A0_22[_UPVALUE0_.destinationAddressStart]
  L2_24[L2firewallRulesTable .. "." .. _UPVALUE0_.destinationAddressEnd] = A0_22[_UPVALUE0_.destinationAddressEnd]
  L2_24[L2firewallRulesTable .. "." .. _UPVALUE0_.sourceMACAddressType] = A0_22[_UPVALUE0_.sourceMACAddressType]
  L2_24[L2firewallRulesTable .. "." .. _UPVALUE0_.sourceMACAddressStart] = A0_22[_UPVALUE0_.sourceMACAddressStart]
  L2_24[L2firewallRulesTable .. "." .. _UPVALUE0_.sourceMACAddressEnd] = A0_22[_UPVALUE0_.sourceMACAddressEnd]
  L2_24[L2firewallRulesTable .. "." .. _UPVALUE0_.destinationMACAddressType] = A0_22[_UPVALUE0_.destinationMACAddressType]
  L2_24[L2firewallRulesTable .. "." .. _UPVALUE0_.destinationMACAddressStart] = A0_22[_UPVALUE0_.destinationMACAddressStart]
  L2_24[L2firewallRulesTable .. "." .. _UPVALUE0_.destinationMACAddressEnd] = A0_22[_UPVALUE0_.destinationMACAddressEnd]
  L2_24["L2FirewallRules.dscp"] = ""
  L2_24["L2FirewallRules.classId"] = ""
  L2_24["L2FirewallRules.vlanId"] = ""
  L2_24["L2FirewallRules.ScheduleName"] = ""
  util.appendDebugOut("Inserting values: " .. util.tableToStringRec(L2_24))
  DBTable = L2firewallRulesTable
  if db.update(L2firewallRulesTable, L2_24, A1_23) then
    return returnCodes.SUCCESS, cookie
  else
    return returnCodes.FAILURE, cookie
  end
end
function fw.core.l2firewallRules.L2.ruleStatusEnable(A0_25)
  local L1_26, L2_27, L3_28
  if A0_25 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_26 = db.existsRow(L2firewallRulesTable, _UPVALUE1_, A0_25)
  if not L1_26 then
    return returnCodes.COOKIEFAIL
  end
  L3_28 = db.setAttribute(L2firewallRulesTable, _UPVALUE1_, A0_25, _UPVALUE2_.status, _UPVALUE3_)
  if not L3_28 then
    return returnCodes.FAILURE, A0_25
  end
  return returnCodes.SUCCESS, A0_25
end
function fw.core.l2firewallRules.L2.ruleStatusDisable(A0_29)
  local L1_30, L2_31, L3_32
  if A0_29 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_30 = db.existsRow(L2firewallRulesTable, _UPVALUE1_, A0_29)
  if not L1_30 then
    return returnCodes.COOKIEFAIL
  end
  L3_32 = db.setAttribute(L2firewallRulesTable, _UPVALUE1_, A0_29, _UPVALUE2_.status, _UPVALUE3_)
  if not L3_32 then
    return returnCodes.FAILURE, A0_29
  end
  return returnCodes.SUCCESS, A0_29
end
function fw.core.l2firewallRules.L2.EnableAll()
  if db.setAttributeWhere(L2firewallRulesTable, _UPVALUE0_, _UPVALUE1_.status, _UPVALUE2_) == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS
end
function fw.core.l2firewallRules.L2.DisableAll()
  if db.setAttributeWhere(L2firewallRulesTable, _UPVALUE0_, _UPVALUE1_.status, _UPVALUE2_) == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS
end
function fw.core.l2firewallRules.L2.listGet()
  local L0_33, L1_34, L2_35
  L0_33 = {}
  L1_34 = {}
  L2_35 = db
  L2_35 = L2_35.getTable
  L2_35 = L2_35(L2firewallRulesTable, true)
  if L2_35 == nil then
    return returnCodes.SUCCESS, returnCodes.NIL
  end
  util.appendDebugOut("List  of firewallRules " .. util.tableToStringRec(L2_35))
  for _FORV_6_, _FORV_7_ in pairs(L2_35) do
    L0_33[_FORV_6_] = {}
    L0_33[_FORV_6_] = util.removePrefix(L2_35[_FORV_6_], "L2FirewallRules.")
    L0_33[_FORV_6_][_UPVALUE0_.direction] = L0_33[_FORV_6_].RuleType
    if L0_33[_FORV_6_][_UPVALUE0_.status] == "1" then
      L0_33[_FORV_6_].ruleStatus = "Enabled"
    else
      L0_33[_FORV_6_].ruleStatus = "Disabled"
    end
    if L0_33[_FORV_6_][_UPVALUE0_.action] == "1" then
      L0_33[_FORV_6_][_UPVALUE0_.action] = "Allow Always"
    elseif L0_33[_FORV_6_][_UPVALUE0_.action] == "0" then
      L0_33[_FORV_6_][_UPVALUE0_.action] = "Block Always"
    end
    if L0_33[_FORV_6_][_UPVALUE0_.serviceName] == "ANY" then
      L0_33[_FORV_6_][_UPVALUE0_.ServiceName] = "Any"
    end
    if L0_33[_FORV_6_][_UPVALUE0_.sourceMACAddressType] == "0" then
      L0_33[_FORV_6_].SourceMacAddress = "Any"
    elseif L0_33[_FORV_6_][_UPVALUE0_.sourceMACAddressType] == "1" then
      L0_33[_FORV_6_].SourceMacAddress = L0_33[_FORV_6_][_UPVALUE0_.sourceMACAddressStart]
    elseif L0_33[_FORV_6_][_UPVALUE0_.sourceMACAddressType] == "2" then
      L0_33[_FORV_6_].SourceMacAddress = L0_33[_FORV_6_][_UPVALUE0_.sourceMACAddressStart] .. "-" .. L0_33[_FORV_6_][_UPVALUE0_.sourceMACAddressEnd]
    end
    if L0_33[_FORV_6_][_UPVALUE0_.destinationMACAddressType] == "0" then
      L0_33[_FORV_6_].DestinationMacAddress = "Any"
    elseif L0_33[_FORV_6_][_UPVALUE0_.destinationMACAddressType] == "1" then
      L0_33[_FORV_6_].DestinationMacAddress = L0_33[_FORV_6_][_UPVALUE0_.destinationMACAddressStart]
    elseif L0_33[_FORV_6_][_UPVALUE0_.destinationMACAddressType] == "2" then
      L0_33[_FORV_6_].DestinationMacAddress = L0_33[_FORV_6_][_UPVALUE0_.destinationMACAddressStart] .. "-" .. L0_33[_FORV_6_][_UPVALUE0_.destinationMACAddressEnd]
    end
    if L0_33[_FORV_6_][_UPVALUE0_.sourceAddressType] == "0" then
      L0_33[_FORV_6_].SourceIPAddress = "Any"
    elseif L0_33[_FORV_6_][_UPVALUE0_.sourceAddressType] == "1" then
      L0_33[_FORV_6_].SourceIPAddress = L0_33[_FORV_6_][_UPVALUE0_.sourceAddressStart]
    elseif L0_33[_FORV_6_][_UPVALUE0_.sourceAddressType] == "2" then
      L0_33[_FORV_6_].SourceIPAddress = L0_33[_FORV_6_][_UPVALUE0_.sourceAddressStart] .. "-" .. L0_33[_FORV_6_][_UPVALUE0_.sourceAddressEnd]
    end
    if L0_33[_FORV_6_][_UPVALUE0_.destinationAddressType] == "0" then
      L0_33[_FORV_6_].DestinationIPAddress = "Any"
    elseif L0_33[_FORV_6_][_UPVALUE0_.destinationAddressType] == "1" then
      L0_33[_FORV_6_].DestinationIPAddress = L0_33[_FORV_6_][_UPVALUE0_.destinationAddressStart]
    elseif L0_33[_FORV_6_][_UPVALUE0_.destinationAddressType] == "2" then
      L0_33[_FORV_6_].DestinationIPAddress = L0_33[_FORV_6_][_UPVALUE0_.destinationAddressStart] .. "-" .. L0_33[_FORV_6_][_UPVALUE0_.destinationAddressEnd]
    end
  end
  util.appendDebugOut("List of firewallRules " .. util.tableToStringRec(L0_33))
  return returnCodes.SUCCESS, L0_33
end
