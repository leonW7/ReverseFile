local L0_0, L1_1
L0_0 = {}
telnetAccessMgmt = L0_0
L0_0 = {}
fwAccessMgmt = L0_0
L0_0 = {}
blockSites = L0_0
L0_0 = blockSites
function L1_1(A0_2, A1_3, A2_4)
  local L3_5
  L3_5 = ACCESS_LEVEL
  if L3_5 ~= 0 then
    L3_5 = "ACCESS_DENIED"
    return L3_5, "10187"
  end
  L3_5 = db
  L3_5 = L3_5.beginTransaction
  L3_5()
  L3_5 = false
  A1_3 = db.getAttribute("blockSites", "keyword", A0_2["blockSites.keyword"], "_ROWID_")
  L3_5 = blockSites.config(A0_2, A1_3, A2_4)
  if L3_5 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12466"
  end
end
L0_0.blockSites_config = L1_1
L0_0 = blockSites
function L1_1(A0_6, A1_7, A2_8)
  if A2_8 == "add" then
    return db.insert("blockSites", A0_6)
  elseif A2_8 == "edit" then
    return db.update("blockSites", A0_6, A1_7)
  elseif A2_8 == "delete" then
    return db.delete("blockSites", A0_6)
  end
  return false
end
L0_0.config = L1_1
L0_0 = telnetAccessMgmt
function L1_1(A0_9, A1_10, A2_11)
  local L3_12, L4_13
  L3_12 = {}
  L4_13 = ACCESS_LEVEL
  if L4_13 ~= 0 then
    L4_13 = "ACCESS_DENIED"
    return L4_13, "10187"
  end
  L4_13 = db
  L4_13 = L4_13.beginTransaction
  L4_13()
  L4_13 = false
  if A2_11 == "add" then
    return nil
  elseif A2_11 == "edit" then
    L3_12["accessMgmt.accessMgmtEnable"] = A0_9["telnet.telnetEnable"]
    L3_12["accessMgmt.serviceType"] = "1"
    L3_12["accessMgmt.accessMgmtIP1"] = A0_9["telnet.telnetIP1"]
    L3_12["accessMgmt.accessMgmtIP2"] = A0_9["telnet.telnetIP2"]
    L3_12["accessMgmt.accessType"] = A0_9["telnet.telnetAccessType"]
    L3_12["accessMgmt.port"] = A0_9["telnet.telnetPort"]
    L4_13 = db.update("accessMgmt", L3_12, "1")
  elseif A2_11 == "delete" then
    return nil
  end
  if L4_13 then
    db.commitTransaction(true)
    return "OK", "11485"
  else
    db.rollback()
    return "ERROR", "10146"
  end
end
L0_0.config = L1_1
L0_0 = fwAccessMgmt
function L1_1(A0_14, A1_15, A2_16)
  local L3_17, L4_18
  L3_17 = {}
  L4_18 = ACCESS_LEVEL
  if L4_18 ~= 0 then
    L4_18 = "ACCESS_DENIED"
    return L4_18, "10187"
  end
  L4_18 = db
  L4_18 = L4_18.beginTransaction
  L4_18()
  L4_18 = false
  if A2_16 == "add" then
    return nil
  elseif A2_16 == "edit" then
    A0_14["accessMgmt.serviceType"] = "0"
    os.execute("echo Updating accesssMgmt Table. > /dev/NULL")
    L4_18 = db.update("accessMgmt", A0_14, "0")
    A0_14["accessMgmt.serviceType"] = "2"
    L3_17["accessMgmt.accessMgmtEnable"] = A0_14["accessMgmt.accessMgmtEnableSsh"]
    L3_17["accessMgmt.accessType"] = A0_14["accessMgmt.accessType"]
    L3_17["accessMgmt.accessMgmtIP1"] = A0_14["accessMgmt.accessMgmtIP1"]
    L3_17["accessMgmt.accessMgmtIP2"] = A0_14["accessMgmt.accessMgmtIP2"]
    os.execute("echo Updating accesssMgmt Table. > /dev/NULL")
    L4_18 = db.update("accessMgmt", L3_17, "2")
    if db.getRow("RemoteSnmp", "_ROWID_", "1") == nil then
      remoteSNMPConfig(A0_14, 1, "add")
    else
      remoteSNMPConfig(A0_14, -1, "edit")
    end
  else
    return nil
  end
  if L4_18 then
    os.execute("echo Saving accessMgmt Table DB Transaction. > /dev/NULL")
    db.commitTransaction(true)
    return "OK", "11485"
  else
    os.execute("echo Saving accessMgmt Table DB Transaction Failed. > /dev/NULL")
    db.rollback()
    return "ERROR", "10146"
  end
end
L0_0.config = L1_1
function L0_0(A0_19, A1_20, A2_21)
  local L3_22
  L3_22 = ACCESS_LEVEL
  if L3_22 ~= 0 then
    L3_22 = "ACCESS_DENIED"
    return L3_22, "10187"
  end
  L3_22 = false
  if A2_21 == "add" then
    L3_22 = db.insert("RemoteSnmp", A0_19)
  elseif A2_21 == "edit" then
    L3_22 = db.update("RemoteSnmp", A0_19, "1")
  else
    return nil
  end
end
remoteSNMPConfig = L0_0
