local L0_0, L1_1
L0_0 = {}
l2tpServer = L0_0
L0_0 = l2tpServer
function L1_1(A0_2, A1_3, A2_4)
  if db.typeAndRangeValidate(A0_2) then
    if A2_4 == "add" then
      return db.insert(DBTable, A0_2)
    elseif A2_4 == "edit" then
      return db.update(DBTable, A0_2, A1_3)
    elseif A2_4 == "delete" then
      return db.delete(DBTable, A0_2)
    end
  else
    return false
  end
end
L0_0.config = L1_1
L0_0 = l2tpServer
function L1_1(A0_5, A1_6, A2_7)
  local L3_8
  L3_8 = ACCESS_LEVEL
  if L3_8 ~= 0 then
    L3_8 = "ACCESS_DENIED"
    return L3_8, "10187"
  end
  L3_8 = A0_5["Xl2tpServerIPRange.AuthenticationType"]
  if L3_8 == "2" then
    L3_8 = db
    L3_8 = L3_8.getTable
    L3_8 = L3_8("LDAPSettings")
    if L3_8 == nil or #L3_8 == 0 then
      return "ERROR", "20551"
    end
  else
    L3_8 = A0_5["Xl2tpServerIPRange.AuthenticationType"]
    if L3_8 == "3" then
      L3_8 = db
      L3_8 = L3_8.getTable
      L3_8 = L3_8("ActiveDirectorySettings")
      if L3_8 == nil or #L3_8 == 0 then
        return "ERROR", "20564"
      end
    else
      L3_8 = A0_5["Xl2tpServerIPRange.AuthenticationType"]
      if L3_8 == "4" then
        L3_8 = db
        L3_8 = L3_8.getTable
        L3_8 = L3_8("NTDomainSettings")
        if L3_8 == nil or #L3_8 == 0 then
          return "ERROR", "20565"
        end
      else
        L3_8 = A0_5["Xl2tpServerIPRange.AuthenticationType"]
        if L3_8 == "5" then
          L3_8 = db
          L3_8 = L3_8.getTable
          L3_8 = L3_8("POPProfiles")
          if L3_8 == nil or #L3_8 == 0 then
            return "ERROR", "20552"
          end
        else
          L3_8 = A0_5["Xl2tpServerIPRange.AuthenticationType"]
          if L3_8 == "1" then
            L3_8 = db
            L3_8 = L3_8.getTable
            L3_8 = L3_8("radiusClient")
            if L3_8 == nil or #L3_8 == 0 then
              return "ERROR", "20553"
            end
          end
        end
      end
    end
  end
  L3_8 = db
  L3_8 = L3_8.beginTransaction
  L3_8()
  L3_8 = false
  L3_8 = l2tpServer.config(A0_5, A1_6, A2_7)
  if L3_8 then
    db.commitTransaction()
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12762"
  end
end
L0_0.serverConfig = L1_1
L0_0 = l2tpServer
function L1_1(A0_9, A1_10, A2_11)
  local L3_12
  L3_12 = ACCESS_LEVEL
  if L3_12 ~= 0 then
    L3_12 = "ACCESS_DENIED"
    return L3_12, "10187"
  end
  L3_12 = db
  L3_12 = L3_12.beginTransaction
  L3_12()
  L3_12 = false
  if A2_11 == "add" then
    A0_9["USERDBUsers.GroupName"] = db.getDefaults(true, "USERDBUsers")["USERDBUsers.GroupName"]
    A0_9["USERDBUsers.UserTimeOut"] = db.getDefaults(true, "USERDBUsers")["USERDBUsers.UserTimeOut"]
    A0_9["USERDBUsers.groupid"] = 1
    A0_9["USERDBUsers.DenyLogin"] = db.getDefaults(true, "USERDBUsers")["USERDBUsers.DenyLogin"]
    A0_9["USERDBUsers.DenyLoginFromWan"] = db.getDefaults(true, "USERDBUsers")["USERDBUsers.DenyLoginFromWan"]
    A0_9["USERDBUsers.LoginFromIP"] = db.getDefaults(true, "USERDBUsers")["USERDBUsers.LoginFromIP"]
    A0_9["USERDBUsers.LoginFromBrowser"] = db.getDefaults(true, "USERDBUsers")["USERDBUsers.LoginFromBrowser"]
  end
  if A2_11 == "edit" and util.isAllMasked(A0_9["USERDBUsers.Password"]) then
    A0_9["USERDBUsers.Password"] = db.getAttribute("USERDBUsers", "_ROWID_", A1_10, "password")
  end
  L3_12 = l2tpServer.config(A0_9, A1_10, A2_11)
  if L3_12 then
    db.commitTransaction()
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12763"
  end
end
L0_0.userConfig = L1_1
L0_0 = l2tpServer
function L1_1(A0_13)
  local L1_14, L2_15, L3_16, L4_17, L5_18, L6_19, L7_20, L8_21
  L1_14 = ACCESS_LEVEL
  if L1_14 ~= 0 then
    L1_14 = "ACCESS_DENIED"
    L2_15 = "10187"
    return L1_14, L2_15
  end
  L1_14 = db
  L1_14 = L1_14.beginTransaction
  L1_14()
  L1_14 = true
  L2_15 = "12265"
  for L6_19, L7_20 in L3_16(L4_17) do
    L8_21 = {}
    L8_21["USERDBUsers._ROWID_"] = L7_20
    L1_14 = l2tpServer.config(L8_21, "-1", "delete")
    if L1_14 == false then
      L2_15 = "12764"
      break
    end
  end
  if L1_14 ~= false then
    L2_15 = "12765"
  end
  if L1_14 then
    L3_16(L4_17)
    return L3_16, L4_17
  else
    L3_16()
    return L3_16, L4_17
  end
end
L0_0.delete = L1_1
