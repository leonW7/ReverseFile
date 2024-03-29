snmp = {}
function snmp.config(A0_0, A1_1, A2_2, A3_3)
  if snmp.inputvalidate(A0_0, A2_2) then
    if A2_2 == "add" then
      return db.insert(A3_3, A0_0)
    elseif A2_2 == "edit" then
      return db.update(A3_3, A0_0, A1_1)
    elseif A2_2 == "delete" then
      return db.delete(A3_3, A0_0)
    end
  end
  return false
end
function snmp.inputvalidate(A0_4, A1_5)
  do return db.typeAndRangeValidate(A0_4) end
  return false
end
function snmp.system_config(A0_6, A1_7, A2_8)
  local L3_9
  L3_9 = ACCESS_LEVEL
  if L3_9 ~= 0 then
    L3_9 = "ACCESS_DENIED"
    return L3_9, "10187"
  end
  L3_9 = false
  L3_9 = snmp.config(A0_6, A1_7, A2_8, "system")
  if L3_9 then
    return "OK", "12265"
  else
    return "ERROR", "12301"
  end
end
function snmp.snmpTrap_config(A0_10, A1_11, A2_12)
  local L3_13
  L3_13 = ACCESS_LEVEL
  if L3_13 ~= 0 then
    L3_13 = "ACCESS_DENIED"
    return L3_13, "10187"
  end
  L3_13 = false
  L3_13 = snmp.config(A0_10, A1_11, A2_12, "snmpTrap")
  if L3_13 then
    return "OK", "12265"
  else
    printCLIError("row with the given IP address does not exist")
    return "ERROR", "12183"
  end
end
function snmp.snmpAccessControl_config(A0_14, A1_15, A2_16)
  local L3_17, L4_18
  L3_17 = ACCESS_LEVEL
  if L3_17 ~= 0 then
    L3_17 = "ACCESS_DENIED"
    L4_18 = "10187"
    return L3_17, L4_18
  end
  L3_17 = false
  if A2_16 == "edit" or A2_16 == "add" then
    L4_18 = "ipAddr = '"
    L4_18 = L4_18 .. A0_14["snmpAccessControl.ipAddr"] .. "' and " .. "subnetMask = '" .. A0_14["snmpAccessControl.subnetMask"] .. "' and " .. "commName = '" .. A0_14["snmpAccessControl.commName"] .. "' and " .. "accessType = '" .. A0_14["snmpAccessControl.accessType"] .. "'"
    if db.existsRowWhere("snmpAccessControl", L4_18) and db.existsRowWhere("snmpAccessControl", L4_18) ~= A1_15 then
      printCLIError("Entry already exists in access control list.\n")
      return "ERROR", "12178"
    end
  end
  L4_18 = snmp
  L4_18 = L4_18.config
  L4_18 = L4_18(A0_14, A1_15, A2_16, "snmpAccessControl")
  L3_17 = L4_18
  if L3_17 == 0 then
    L4_18 = printCLIError
    L4_18("There is no configuration to delete")
    L4_18 = "ERROR"
    return L4_18, "12183"
  end
  if L3_17 then
    L4_18 = "OK"
    return L4_18, "12265"
  else
    L4_18 = "ERROR"
    return L4_18, "12178"
  end
end
function snmp.snmpv3Users_config(A0_19, A1_20, A2_21)
  local L3_22
  L3_22 = ACCESS_LEVEL
  if L3_22 ~= 0 then
    L3_22 = "ACCESS_DENIED"
    return L3_22, "10187"
  end
  L3_22 = false
  L3_22 = snmp.config(A0_19, A1_20, A2_21, "snmpv3Users")
  if L3_22 then
    return "OK", "12265"
  else
    return "ERROR", "12186"
  end
end
function snmp.import(A0_23, A1_24)
  local L2_25, L3_26, L4_27, L5_28, L6_29
  if A0_23 == nil then
    A0_23 = A1_24
  else
    if L2_25 ~= nil then
      if L2_25 == nil then
        A0_23.trap = L2_25
        A0_23.accessControl = L2_25
      end
    end
    if L2_25 == nil then
      A0_23.v3Users = L2_25
    end
  end
  for L5_28, L6_29 in L2_25(L3_26) do
    L6_29 = util.addPrefix(L6_29, "snmpTrap.")
    snmp.snmpTrap_config(L6_29, -1, "add")
  end
  for L5_28, L6_29 in L2_25(L3_26) do
    L6_29 = util.addPrefix(L6_29, "snmpAccessControl.")
    snmp.snmpAccessControl_config(L6_29, -1, "add")
  end
  for L5_28, L6_29 in L2_25(L3_26) do
    L6_29 = util.addPrefix(L6_29, "snmpv3Users.")
    snmp.snmpv3Users_config(L6_29, -1, "add")
  end
end
function snmp.export()
  local L0_30
  L0_30 = {}
  L0_30.trap = db.getTable("snmpTrap", false)
  L0_30.accessControl = db.getTable("snmpAccessControl", false)
  L0_30.v3Users = db.getTable("snmpv3Users", false)
  return L0_30
end
if config.register then
  config.register("snmp", snmp.import, snmp.export)
end
