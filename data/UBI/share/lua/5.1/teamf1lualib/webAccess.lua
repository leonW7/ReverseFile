require("teamf1lualib/fwRules")
webAccess = {}
function webAccess.config(A0_0, A1_1, A2_2)
  if db.typeAndRangeValidate(A0_0) then
    if A2_2 == "add" then
      return db.insert(DBTable, A0_0)
    elseif A2_2 == "edit" then
      return db.update(DBTable, A0_0, A1_1)
    elseif A2_2 == "delete" then
      return db.delete(DBTable, A0_0)
    end
  end
  return false
end
function getVlanInfo(A0_3)
  local L1_4
  L1_4 = "AddressFamily = '2' and LogicalIfName = '"
  L1_4 = L1_4 .. A0_3 .. "'"
  ipAddr = db.getRowWhere("ifStatic", L1_4)["ifStatic.StaticIp"]
  subnet = db.getRowWhere("ifStatic", L1_4)["ifStatic.NetMask"]
  return ipAddr, subnet
end
function webAccess.statusConfig(A0_5, A1_6, A2_7)
  local L3_8, L4_9, L5_10, L6_11, L7_12
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
  L4_9 = "webAccessStatus"
  DBTable = L4_9
  L4_9 = webAccess
  L4_9 = L4_9.config
  L5_10 = A0_5
  L6_11 = A1_6
  L7_12 = A2_7
  L4_9 = L4_9(L5_10, L6_11, L7_12)
  L3_8 = L4_9
  if L3_8 then
    L4_9 = "webAccessInfo"
    DBTable = L4_9
    L4_9 = {}
    L5_10 = A0_5["webAccessStatus.accessStatus"]
    if L5_10 == "1" then
      L5_10 = db
      L5_10 = L5_10.getTable
      L6_11 = "webAccessInfo"
      L5_10 = L5_10(L6_11)
      L6_11 = #L5_10
      if L6_11 == 0 then
        L6_11, L7_12 = nil, nil
        L6_11, L7_12 = getVlanInfo("LAN")
        L4_9["webAccessInfo.name"] = "Default"
        L4_9["webAccessInfo.accessType"] = 1
        L4_9["webAccessInfo.IpAddr"] = ""
        L4_9["webAccessInfo.vlanName"] = "LAN"
        L4_9["webAccessInfo.vlanIpAddr"] = L6_11
        L4_9["webAccessInfo.vlanSubnet"] = L7_12
        webAccess.config(L4_9, A1_6, "add")
      end
    end
  end
  if L3_8 then
    L4_9 = db
    L4_9 = L4_9.commitTransaction
    L5_10 = true
    L4_9(L5_10)
    L4_9 = "OK"
    L5_10 = "12265"
    return L4_9, L5_10
  else
    L4_9 = db
    L4_9 = L4_9.rollback
    L4_9()
    L4_9 = "ERROR"
    L5_10 = "12160"
    return L4_9, L5_10
  end
end
function webAccess.infoConfig(A0_13, A1_14, A2_15)
  local L3_16, L4_17, L5_18
  L3_16 = ACCESS_LEVEL
  if L3_16 ~= 0 then
    L3_16 = "ACCESS_DENIED"
    L4_17 = "10187"
    return L3_16, L4_17
  end
  L3_16 = db
  L3_16 = L3_16.beginTransaction
  L3_16()
  L3_16 = false
  if A2_15 == "add" or A2_15 == "edit" then
    L4_17 = A0_13["webAccessInfo.accessType"]
    if L4_17 == "0" then
      A0_13["webAccessInfo.vlanName"] = ""
      A0_13["webAccessInfo.vlanIpAddr"] = ""
      A0_13["webAccessInfo.vlanSubnet"] = ""
    else
      L4_17, L5_18 = nil, nil
      L4_17, L5_18 = getVlanInfo(A0_13["webAccessInfo.vlanName"])
      A0_13["webAccessInfo.IpAddr"] = ""
      A0_13["webAccessInfo.vlanIpAddr"] = L4_17
      A0_13["webAccessInfo.vlanSubnet"] = L5_18
    end
  end
  L4_17 = db
  L4_17 = L4_17.getAttribute
  L5_18 = "webAccessInfo"
  L4_17 = L4_17(L5_18, "_ROWID_", A1_14, "name")
  if L4_17 == "Default" then
    L5_18 = print
    L5_18("Operation not supported \n")
    L5_18 = db
    L5_18 = L5_18.rollback
    L5_18()
    L5_18 = "OK"
    return L5_18, "12265"
  else
    L5_18 = webAccess
    L5_18 = L5_18.config
    L5_18 = L5_18(A0_13, A1_14, A2_15)
    L3_16 = L5_18
  end
  if L3_16 then
    L5_18 = db
    L5_18 = L5_18.commitTransaction
    L5_18(true)
    L5_18 = "OK"
    return L5_18, "12265"
  else
    L5_18 = db
    L5_18 = L5_18.rollback
    L5_18()
    L5_18 = "ERROR"
    return L5_18, "12160"
  end
end
function webAccess.infoDelete(A0_19)
  local L1_20, L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27
  L1_20 = ACCESS_LEVEL
  if L1_20 ~= 0 then
    L1_20 = "ACCESS_DENIED"
    L2_21 = "10187"
    return L1_20, L2_21
  end
  L1_20 = db
  L1_20 = L1_20.beginTransaction
  L1_20()
  L1_20 = true
  L2_21 = "12265"
  for L6_25, L7_26 in L3_22(L4_23) do
    L8_27 = {}
    L8_27["webAccessInfo._ROWID_"] = L7_26
    if db.getAttribute("webAccessInfo", "_ROWID_", L7_26, "name") ~= "Default" then
      L1_20 = fwRules.config(L8_27, "-1", "delete")
      if L1_20 == false then
        L2_21 = "11328"
        break
      end
    else
      L1_20 = false
      print("Operation not supported \n")
      break
    end
  end
  if L1_20 ~= false then
    L2_21 = "12088"
  end
  if L1_20 then
    L3_22(L4_23)
    return L3_22, L4_23
  else
    L3_22()
    return L3_22, L4_23
  end
end
