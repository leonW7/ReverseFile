local L0_0, L1_1
L0_0 = {}
igmp = L0_0
L0_0 = igmp
function L1_1(A0_2, A1_3, A2_4)
  local L3_5
  L3_5 = ACCESS_LEVEL
  if L3_5 ~= 0 then
    L3_5 = "ACCESS_DENIED"
    return L3_5, "10187"
  end
  L3_5 = false
  if db.typeAndRangeValidate(A0_2) then
    if A2_4 == "add" then
      return nil
    elseif A2_4 == "edit" then
      L3_5 = db.update("Igmp", A0_2, A1_3)
      if L3_5 then
        db.commitTransaction()
        return "OK", "12265"
      else
        db.rollback()
        return "ERROR", "10946"
      end
    elseif A2_4 == "delete" then
      return nil
    end
  end
  return false
end
L0_0.config = L1_1
L0_0 = igmp
function L1_1(A0_6)
  local L1_7, L2_8, L3_9, L4_10, L5_11, L6_12, L7_13, L8_14
  L1_7 = ACCESS_LEVEL
  if L1_7 ~= 0 then
    L1_7 = "ACCESS_DENIED"
    L2_8 = "10187"
    return L1_7, L2_8
  end
  L1_7 = db
  L1_7 = L1_7.beginTransaction
  L1_7()
  L1_7 = true
  L2_8 = "12265"
  for L6_12, L7_13 in L3_9(L4_10) do
    L8_14 = {}
    L8_14["allowedNets._ROWID_"] = L7_13
    L1_7 = igmp.networkConfig(L8_14, "-1", "delete")
    if L1_7 == false then
      L2_8 = "10944"
      break
    end
  end
  if L1_7 ~= false then
    L2_8 = "12265"
  end
  if L1_7 then
    L3_9(L4_10)
    return L3_9, L4_10
  else
    L3_9()
    return L3_9, L4_10
  end
end
L0_0.deleteAllowedNetwork = L1_1
L0_0 = igmp
function L1_1(A0_15, A1_16, A2_17)
  local L3_18
  L3_18 = ACCESS_LEVEL
  if L3_18 ~= 0 then
    L3_18 = "ACCESS_DENIED"
    return L3_18, "10187"
  end
  L3_18 = db
  L3_18 = L3_18.beginTransaction
  L3_18()
  L3_18 = false
  L3_18 = igmp.networkConfig(A0_15, A1_16, A2_17)
  if L3_18 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10227"
  end
end
L0_0.allowedNetworkConfig = L1_1
L0_0 = igmp
function L1_1(A0_19, A1_20, A2_21)
  if db.typeAndRangeValidate(A0_19) then
    if A2_21 == "add" then
      return db.insert("allowedNets", A0_19)
    elseif A2_21 == "edit" then
      return db.update("allowedNets", A0_19, A1_20)
    elseif A2_21 == "delete" then
      return db.delete("allowedNets", A0_19)
    end
  end
  return false
end
L0_0.networkConfig = L1_1
L0_0 = igmp
function L1_1()
  return (db.getTable("allowedNets"))
end
L0_0.allNetworksGet = L1_1
L0_0 = igmp
function L1_1(A0_22)
  return (db.getRow("allowedNets", "_ROWID_", A0_22))
end
L0_0.addressByRowGet = L1_1
L0_0 = igmp
function L1_1()
  local L0_23, L1_24, L2_25, L3_26, L4_27, L5_28, L6_29, L7_30, L8_31
  L8_31 = "_ROWID_=1"
  L0_23 = db.getRow("Igmp", "_ROWID_", "1")
  L1_24 = db.getRowWhere("WanMode", L8_31, false)
  if L1_24.Wanmode == "2" then
    connectionTypePri = db.getAttribute("nimfConf", "LogicalIfName", L1_24.FailoverPriLogicalIfName, "ConnectionType")
    connectionTypeSec = db.getAttribute("nimfConf", "LogicalIfName", L1_24.FailoverSecLogicalIfName, "ConnectionType")
    if connectionTypePri == "pptp" then
      L3_26 = db.getAttribute("Pptp", "LogicalIfName", L1_24.FailoverPriLogicalIfName, "DualAccess")
    elseif connectionTypePri == "l2tp" then
      L3_26 = db.getAttribute("l2tp", "LogicalIfName", L1_24.FailoverPriLogicalIfName, "DualAccess")
    end
    if connectionTypeSec == "pptp" then
      L4_27 = db.getAttribute("Pptp", "LogicalIfName", L1_24.FailoverSecLogicalIfName, "DualAccess")
    elseif connectionTypeSec == "l2tp" then
      L4_27 = db.getAttribute("l2tp", "LogicalIfName", L1_24.FailoverSecLogicalIfName, "DualAccess")
    end
    L0_23["Igmp.FailoverPriLogicalIfName"] = L1_24.FailoverPriLogicalIfName
    L0_23["Igmp.FailoverSecLogicalIfName"] = L1_24.FailoverSecLogicalIfName
    L0_23["Igmp.connectionTypePri"] = connectionTypePri
    L0_23["Igmp.connectionTypeSec"] = connectionTypeSec
    L0_23["Igmp.dualAccessPri"] = L3_26
    L0_23["Igmp.dualAccessSec"] = L4_27
    if L0_23["Igmp.dualAccessPri"] == nil then
      L0_23["Igmp.dualAccessPri"] = "0"
    end
    if L0_23["Igmp.dualAccessSec"] == nil then
      L0_23["Igmp.dualAccessSec"] = "0"
    end
  else
    if L1_24.Wanmode == "0" then
      connectionType = db.getAttribute("nimfConf", "LogicalIfName", L1_24.DedicatedLogicalIfName, "ConnectionType")
      if connectionType == "pptp" then
        L2_25 = db.getAttribute("Pptp", "LogicalIfName", L1_24.DedicatedLogicalIfName, "DualAccess")
      elseif connectionType == "l2tp" then
        L2_25 = db.getAttribute("l2tp", "LogicalIfName", L1_24.DedicatedLogicalIfName, "DualAccess")
      end
    end
    L0_23["Igmp.LogicalIfName"] = L1_24.DedicatedLogicalIfName
    L0_23["Igmp.connectionType"] = connectionType
    L0_23["Igmp.dualAccess"] = L2_25
    if L0_23["Igmp.dualAccess"] == nil then
      L0_23["Igmp.dualAccess"] = "0"
    end
  end
  L0_23["Igmp.wanMode"] = L1_24.Wanmode
  return L0_23
end
L0_0.show = L1_1
