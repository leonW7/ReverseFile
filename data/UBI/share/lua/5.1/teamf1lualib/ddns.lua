local L0_0, L1_1
L0_0 = {}
ddns = L0_0
L0_0 = ddns
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
L0_0.updateConfig = L1_1
L0_0 = ddns
function L1_1(A0_5, A1_6, A2_7)
  local L3_8
  L3_8 = ACCESS_LEVEL
  if L3_8 ~= 0 then
    L3_8 = "ACCESS_DENIED"
    return L3_8, "10187"
  end
  L3_8 = db
  L3_8 = L3_8.beginTransaction
  L3_8()
  L3_8 = false
  L3_8 = ddns.updateConfig(A0_5, A1_6, A2_7)
  if L3_8 then
    db.commitTransaction()
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10507"
  end
end
L0_0.config = L1_1
L0_0 = ddns
function L1_1(A0_9, A1_10, A2_11, A3_12)
  local L4_13, L5_14
  L4_13 = ACCESS_LEVEL
  if L4_13 ~= 0 then
    L4_13 = "ACCESS_DENIED"
    L5_14 = "10187"
    return L4_13, L5_14
  end
  L4_13 = db
  L4_13 = L4_13.beginTransaction
  L4_13()
  L4_13 = false
  L5_14 = ddns
  L5_14 = L5_14.updateConfig
  L5_14 = L5_14(A0_9, A1_10, "edit")
  L4_13 = L5_14
  if L4_13 then
    L5_14 = A0_9["ddns.ddnsService2"]
    if L5_14 ~= nil then
      L5_14 = {}
      L5_14["ddns.ddnsService"] = A0_9["ddns.ddnsService2"]
      if A0_9["ddns.ddnsService2"] ~= "0" then
        L5_14["ddns.hostname"] = A0_9["ddns.hostname2"]
        L5_14["ddns.username"] = A0_9["ddns.username2"]
        L5_14["ddns.password"] = A0_9["ddns.password2"]
        L5_14["ddns.wildflag"] = A0_9["ddns.wildflag2"]
        L5_14["ddns.timePeriod"] = A0_9["ddns.timePeriod2"]
      end
      L4_13 = ddns.updateConfig(L5_14, A2_11, "edit")
    end
  end
  if L4_13 then
    L5_14 = A0_9["ddns.ddnsService3"]
    if L5_14 ~= nil then
      L5_14 = {}
      L5_14["ddns.ddnsService"] = A0_9["ddns.ddnsService3"]
      if A0_9["ddns.ddnsService3"] ~= "0" then
        L5_14["ddns.hostname"] = A0_9["ddns.hostname3"]
        L5_14["ddns.username"] = A0_9["ddns.username3"]
        L5_14["ddns.password"] = A0_9["ddns.password3"]
        L5_14["ddns.wildflag"] = A0_9["ddns.wildflag3"]
        L5_14["ddns.timePeriod"] = A0_9["ddns.timePeriod3"]
      end
      L4_13 = ddns.updateConfig(L5_14, A3_12, "edit")
    end
  end
  if L4_13 then
    L5_14 = db
    L5_14 = L5_14.commitTransaction
    L5_14()
    L5_14 = "OK"
    return L5_14, "12265"
  else
    L5_14 = db
    L5_14 = L5_14.rollback
    L5_14()
    L5_14 = "ERROR"
    return L5_14, "10507"
  end
end
L0_0.configWarp = L1_1
L0_0 = ddns
function L1_1(A0_15)
  return db.getRow("ddns", "interfaceName", A0_15)
end
L0_0.configGet = L1_1
