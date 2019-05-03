local L0_0, L1_1
L0_0 = {}
logConfig = L0_0
L0_0 = {}
log = L0_0
L0_0 = logConfig
function L1_1(A0_2, A1_3, A2_4)
  local L3_5, L4_6
  L3_5 = ACCESS_LEVEL
  if L3_5 ~= 0 then
    L3_5 = "ACCESS_DENIED"
    L4_6 = "10187"
    return L3_5, L4_6
  end
  L3_5 = db
  L3_5 = L3_5.beginTransaction
  L3_5()
  L3_5 = false
  L4_6 = "FirewallLogs"
  DBTable = L4_6
  L4_6 = log
  L4_6 = L4_6.config
  L4_6 = L4_6(A0_2, A1_3, A2_4)
  L3_5 = L4_6
  if L3_5 then
    L4_6 = "OtherSystemLogs"
    DBTable = L4_6
    L4_6 = log
    L4_6 = L4_6.config
    L4_6 = L4_6(A0_2, A1_3, A2_4)
    L3_5 = L4_6
  end
  if L3_5 then
    L4_6 = A0_2["logConfig.information"]
    if L4_6 ~= nil then
      L4_6 = "logConfig"
      DBTable = L4_6
      L4_6 = db
      L4_6 = L4_6.getRowWhere
      L4_6 = L4_6("logConfig", "facility='Local1-UTM'")
      if L4_6 ~= nil then
        L4_6["logConfig.information"] = A0_2["logConfig.information"]
        L3_5 = log.config(L4_6, L4_6["logConfig._ROWID_"], "edit")
      else
        L3_5 = false
      end
    end
  end
  if L3_5 then
    L4_6 = db
    L4_6 = L4_6.commitTransaction
    L4_6()
    L4_6 = "OK"
    return L4_6, "12265"
  else
    L4_6 = db
    L4_6 = L4_6.rollback
    L4_6()
    L4_6 = "ERROR"
    return L4_6, "12768"
  end
end
L0_0.config = L1_1
L0_0 = logConfig
function L1_1()
  local L0_7, L1_8, L2_9
  L0_7 = {}
  L1_8 = db
  L1_8 = L1_8.getRow
  L2_9 = "FirewallLogs"
  L1_8 = L1_8(L2_9, "_ROWID_", "1")
  L2_9 = util
  L2_9 = L2_9.tableAppend
  L2_9 = L2_9(L0_7, L1_8)
  L0_7 = L2_9
  L2_9 = db
  L2_9 = L2_9.getRow
  L2_9 = L2_9("OtherSystemLogs", "_ROWID_", "1")
  L0_7 = util.tableAppend(L0_7, L2_9)
  if L0_7 == nil then
    L0_7 = {}
  end
  if db.getRowWhere("logConfig", "facility='Local1-UTM'") ~= nil then
    L0_7["logConfig.information"] = db.getRowWhere("logConfig", "facility='Local1-UTM'")["logConfig.information"]
  end
  return L0_7
end
L0_0.configGet = L1_1
L0_0 = log
function L1_1(A0_10, A1_11, A2_12)
  if db.typeAndRangeValidate(A0_10) then
    if A2_12 == "add" then
      return false
    elseif A2_12 == "edit" then
      return db.update(DBTable, A0_10, A1_11)
    elseif A2_12 == "delete" then
      return false
    end
  else
    return false
  end
end
L0_0.config = L1_1
L0_0 = logConfig
function L1_1(A0_13, A1_14, A2_15)
  local L3_16
  L3_16 = ACCESS_LEVEL
  if L3_16 ~= 0 then
    L3_16 = "ACCESS_DENIED"
    return L3_16, "10187"
  end
  L3_16 = db
  L3_16 = L3_16.beginTransaction
  L3_16()
  L3_16 = false
  L3_16 = log.config(A0_13, A1_14, A2_15)
  if L3_16 then
    db.commitTransaction()
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12768"
  end
end
L0_0.ipv6LogConfig = L1_1
L0_0 = logConfig
function L1_1(A0_17, A1_18)
  local L2_19
  L2_19 = ACCESS_LEVEL
  if L2_19 ~= 0 then
    L2_19 = "ACCESS_DENIED"
    return L2_19, "10187"
  end
  L2_19 = db
  L2_19 = L2_19.beginTransaction
  L2_19()
  L2_19 = false
  L2_19 = log.config(A0_17, 1, "edit")
  if L2_19 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10802"
  end
end
L0_0.ipv6LogsEdit = L1_1
L0_0 = logConfig
function L1_1()
  ({}).FirewallLogs6 = db.getRow("FirewallLogs6", "_ROWID_", 1)
  return {}
end
L0_0.ipv6LogsGet = L1_1
