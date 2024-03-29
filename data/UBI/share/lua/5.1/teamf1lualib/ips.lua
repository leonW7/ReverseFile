local L0_0, L1_1
L0_0 = {}
ips = L0_0
L0_0 = ips
function L1_1(A0_2, A1_3, A2_4)
  if db.typeAndRangeValidate(A0_2) then
    if A2_4 == "add" then
      return false
    elseif A2_4 == "edit" then
      return db.update(DBTable, A0_2, A1_3)
    elseif A2_4 == "delete" then
      return false
    end
  end
end
L0_0.configUpdate = L1_1
L0_0 = ips
function L1_1(A0_5, A1_6, A2_7)
  local L3_8, L4_9, L5_10
  L3_8 = ACCESS_LEVEL
  if L3_8 ~= 0 then
    L3_8 = "ACCESS_DENIED"
    L4_9 = "10187"
    return L3_8, L4_9
  end
  L3_8 = db
  L3_8 = L3_8.beginTransaction
  L3_8()
  L3_8 = false
  L4_9 = "IPSConfig"
  DBTable = L4_9
  L4_9 = ips
  L4_9 = L4_9.configUpdate
  L5_10 = A0_5
  L4_9 = L4_9(L5_10, A1_6, A2_7)
  L3_8 = L4_9
  if L3_8 then
    L4_9 = "IPSNetworkSegments"
    DBTable = L4_9
    L4_9 = db
    L4_9 = L4_9.getRowWhere
    L5_10 = "IPSNetworkSegments"
    L4_9 = L4_9(L5_10, "FromZoneType = 'SECURE' and ToZoneType = 'INSECURE'")
    if L4_9 ~= nil then
      L5_10 = A0_5["IPSNetworkSegments.ipsEnable1"]
      L4_9["IPSNetworkSegments.ipsEnable"] = L5_10
      L5_10 = ips
      L5_10 = L5_10.configUpdate
      L5_10 = L5_10(L4_9, L4_9["IPSNetworkSegments._ROWID_"], A2_7)
      L3_8 = L5_10
      if L3_8 then
        L5_10 = A0_5["IPSNetworkSegments.ipsEnable2"]
        if L5_10 ~= nil then
          L5_10 = db
          L5_10 = L5_10.getRowWhere
          L5_10 = L5_10("IPSNetworkSegments", "FromZoneType = 'PUBLIC' and ToZoneType = 'INSECURE'")
          if L5_10 ~= nil then
            L5_10["IPSNetworkSegments.ipsEnable"] = A0_5["IPSNetworkSegments.ipsEnable2"]
            L3_8 = ips.configUpdate(L5_10, L5_10["IPSNetworkSegments._ROWID_"], A2_7)
          else
            db.rollback()
            return "ERROR", "12754"
          end
        end
      end
    else
      L5_10 = db
      L5_10 = L5_10.rollback
      L5_10()
      L5_10 = "ERROR"
      return L5_10, "12754"
    end
  end
  if L3_8 then
    L4_9 = db
    L4_9 = L4_9.commitTransaction
    L4_9()
    L4_9 = "OK"
    L5_10 = "12265"
    return L4_9, L5_10
  else
    L4_9 = db
    L4_9 = L4_9.rollback
    L4_9()
    L4_9 = "ERROR"
    L5_10 = "12754"
    return L4_9, L5_10
  end
end
L0_0.config = L1_1
L0_0 = ips
function L1_1()
  local L0_11
  L0_11 = db
  L0_11 = L0_11.getRow
  L0_11 = L0_11("IPSConfig", "_ROWID_", "1")
  if L0_11 == nil then
    L0_11 = {}
  end
  if db.getRowWhere("IPSNetworkSegments", "FromZoneType = 'SECURE' and ToZoneType = 'INSECURE'") ~= nil then
    L0_11["IPSNetworkSegments.ipsEnable1"] = db.getRowWhere("IPSNetworkSegments", "FromZoneType = 'SECURE' and ToZoneType = 'INSECURE'")["IPSNetworkSegments.ipsEnable"] or ""
  end
  if db.getRowWhere("IPSNetworkSegments", "FromZoneType = 'PUBLIC' and ToZoneType = 'INSECURE'") ~= nil then
    L0_11["IPSNetworkSegments.ipsEnable2"] = db.getRowWhere("IPSNetworkSegments", "FromZoneType = 'PUBLIC' and ToZoneType = 'INSECURE'")["IPSNetworkSegments.ipsEnable"] or ""
  end
  if db.getRow("IPSStatus", "_ROWID_", "1") ~= nil then
    L0_11["IPSStatus.numRules"] = db.getRow("IPSStatus", "_ROWID_", "1")["IPSStatus.numRules"]
    L0_11["IPSStatus.numAlerts"] = db.getRow("IPSStatus", "_ROWID_", "1")["IPSStatus.numAlerts"]
    L0_11["IPSStatus.numDrops"] = db.getRow("IPSStatus", "_ROWID_", "1")["IPSStatus.numDrops"] + db.getRow("IPSStatus", "_ROWID_", "1")["IPSStatus.numRejects"]
  end
  return L0_11
end
L0_0.configGet = L1_1
