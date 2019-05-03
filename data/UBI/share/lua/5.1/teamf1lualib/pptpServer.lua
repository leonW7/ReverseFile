local L0_0, L1_1
L0_0 = {}
pptpServer = L0_0
L0_0 = pptpServer
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
L0_0 = pptpServer
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
  if A2_7 == "edit" and util.isAllMasked(A0_5["pptpServerUsers.password"]) then
    A0_5["pptpServerUsers.password"] = db.getAttribute("pptpServerUsers", "_ROWID_", A1_6, "password")
  end
  L3_8 = pptpServer.config(A0_5, A1_6, A2_7)
  if L3_8 then
    db.commitTransaction()
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12814"
  end
end
L0_0.userConfig = L1_1
L0_0 = pptpServer
function L1_1(A0_9, A1_10)
  local L2_11, L3_12, L4_13, L5_14, L6_15, L7_16, L8_17, L9_18
  L2_11 = ACCESS_LEVEL
  if L2_11 ~= 0 then
    L2_11 = "ACCESS_DENIED"
    L3_12 = "10187"
    return L2_11, L3_12
  end
  L2_11 = db
  L2_11 = L2_11.beginTransaction
  L2_11()
  L2_11 = false
  L3_12 = "1"
  if A1_10 == "enable" then
    L3_12 = "1"
  else
    L3_12 = "0"
  end
  for L7_16, L8_17 in L4_13(L5_14) do
    L9_18 = {}
    L9_18["pptpServerUsers.enableConnection"] = L3_12
    L2_11 = pptpServer.config(L9_18, L8_17, "edit")
    if not L2_11 then
      break
    end
  end
  if L2_11 then
    L4_13(L5_14)
    return L4_13, L5_14
  else
    L4_13()
    return L4_13, L5_14
  end
end
L0_0.userStatusChange = L1_1
L0_0 = pptpServer
function L1_1(A0_19, A1_20, A2_21)
  local L3_22
  L3_22 = ACCESS_LEVEL
  if L3_22 ~= 0 then
    L3_22 = "ACCESS_DENIED"
    return L3_22, "10187"
  end
  L3_22 = A0_19["pptpServerIPRange.AuthenticationType"]
  if L3_22 == "2" then
    L3_22 = db
    L3_22 = L3_22.getTable
    L3_22 = L3_22("LDAPSettings")
    if L3_22 == nil or #L3_22 == 0 then
      return "ERROR", "20551"
    end
  else
    L3_22 = A0_19["pptpServerIPRange.AuthenticationType"]
    if L3_22 == "3" then
      L3_22 = db
      L3_22 = L3_22.getTable
      L3_22 = L3_22("ActiveDirectorySettings")
      if L3_22 == nil or #L3_22 == 0 then
        return "ERROR", "20564"
      end
    else
      L3_22 = A0_19["pptpServerIPRange.AuthenticationType"]
      if L3_22 == "4" then
        L3_22 = db
        L3_22 = L3_22.getTable
        L3_22 = L3_22("NTDomainSettings")
        if L3_22 == nil or #L3_22 == 0 then
          return "ERROR", "20565"
        end
      else
        L3_22 = A0_19["pptpServerIPRange.AuthenticationType"]
        if L3_22 == "5" then
          L3_22 = db
          L3_22 = L3_22.getTable
          L3_22 = L3_22("POPProfiles")
          if L3_22 == nil or #L3_22 == 0 then
            return "ERROR", "20552"
          end
        else
          L3_22 = A0_19["pptpServerIPRange.AuthenticationType"]
          if L3_22 == "1" then
            L3_22 = db
            L3_22 = L3_22.getTable
            L3_22 = L3_22("radiusClient")
            if L3_22 == nil or #L3_22 == 0 then
              return "ERROR", "20553"
            end
          end
        end
      end
    end
  end
  L3_22 = db
  L3_22 = L3_22.beginTransaction
  L3_22()
  L3_22 = false
  L3_22 = pptpServer.config(A0_19, A1_20, A2_21)
  if L3_22 then
    db.commitTransaction()
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12815"
  end
end
L0_0.serverConfig = L1_1
