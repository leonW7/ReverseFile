if HIGH_SEC == "HIGH" then
  require("teamf1lualib/sslAdmin")
end
radius = {}
function radius.radius_config(A0_0, A1_1, A2_2)
  local L3_3
  L3_3 = ACCESS_LEVEL
  if L3_3 ~= 0 then
    L3_3 = "ACCESS_DENIED"
    return L3_3, "10187"
  end
  L3_3 = db
  L3_3 = L3_3.beginTransaction
  L3_3()
  L3_3 = false
  L3_3 = radius.config(A0_0, A1_1, A2_2)
  if L3_3 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "11902"
  end
end
function radius.config(A0_4, A1_5, A2_6)
  local L3_7, L4_8, L5_9, L6_10, L7_11
  if L3_7 then
    if A2_6 == "add" then
      return L3_7(L4_8, L5_9)
    elseif A2_6 == "edit" then
      L6_10 = A1_5
      return L3_7(L4_8, L5_9, L6_10)
    elseif A2_6 == "delete" then
      for L6_10, L7_11 in L3_7(L4_8) do
        valid = db.deleteRow("radiusClient", "_ROWID_", L7_11)
        if not valid then
          return false
        end
      end
      return L3_7
    end
  end
  return L3_7
end
function radius.profileAdd(A0_12)
  local L1_13, L2_14, L3_15, L4_16
  L1_13 = true
  L2_14 = {}
  L3_15 = {}
  L4_16 = {}
  if ACCESS_LEVEL ~= 0 then
    return "ACCESS_DENIED", "10187"
  end
  if db.existsRow("radiusClient", "ProfileName", A0_12["radiusClient.ProfileName"]) then
    return "ERROR", "13344"
  end
  db.beginTransaction()
  if A0_12 ~= nil then
    L2_14["radiusClient.ProfileName"] = A0_12["radiusClient.ProfileName"]
    L2_14["radiusClient.isEnable"] = A0_12["radiusClient.isEnable"]
    L2_14["radiusClient.authserver"] = A0_12["radiusClient.authserver"]
    L2_14["radiusClient.authport"] = A0_12["radiusClient.authport"]
    L2_14["radiusClient.authsecret"] = A0_12["radiusClient.authsecret"]
    L2_14["radiusClient.authretries"] = A0_12["radiusClient.authretries"]
    L2_14["radiusClient.authtimeout"] = A0_12["radiusClient.authtimeout"]
    L3_15["radiusClient.ProfileName"] = A0_12["radiusClient.ProfileName"]
    L3_15["radiusClient.isEnable"] = A0_12["radiusClient.isEnable"]
    L3_15["radiusClient.authserver"] = A0_12["radiusClient.authserver2"]
    L3_15["radiusClient.authport"] = A0_12["radiusClient.authport2"]
    L3_15["radiusClient.authsecret"] = A0_12["radiusClient.authsecret2"]
    L3_15["radiusClient.authretries"] = A0_12["radiusClient.authretries2"]
    L3_15["radiusClient.authtimeout"] = A0_12["radiusClient.authtimeout2"]
    L4_16["radiusClient.ProfileName"] = A0_12["radiusClient.ProfileName"]
    L4_16["radiusClient.isEnable"] = A0_12["radiusClient.isEnable"]
    L4_16["radiusClient.authserver"] = A0_12["radiusClient.authserver3"]
    L4_16["radiusClient.authport"] = A0_12["radiusClient.authport3"]
    L4_16["radiusClient.authsecret"] = A0_12["radiusClient.authsecret3"]
    L4_16["radiusClient.authretries"] = A0_12["radiusClient.authretries3"]
    L4_16["radiusClient.authtimeout"] = A0_12["radiusClient.authtimeout3"]
  end
  L1_13 = db.insert("radiusClient", L2_14)
  if L1_13 and L3_15 ~= nil then
    L1_13 = db.insert("radiusClient", L3_15)
  end
  if L1_13 and L4_16 ~= nil then
    L1_13 = db.insert("radiusClient", L4_16)
  end
  if L1_13 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "11902"
  end
end
function radius.profileEdit(A0_17, A1_18)
  local L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26, L10_27, L11_28, L12_29, L13_30, L14_31, L15_32, L16_33, L17_34, L18_35
  L2_19 = true
  L3_20 = {}
  L4_21 = {}
  L5_22 = {}
  L6_23, L7_24, L8_25 = nil, nil, nil
  L9_26 = ACCESS_LEVEL
  if L9_26 ~= 0 then
    L9_26 = "ACCESS_DENIED"
    L10_27 = "10187"
    return L9_26, L10_27
  end
  L9_26 = db
  L9_26 = L9_26.getRows
  L10_27 = "radiusClient"
  L11_28 = "ProfileName"
  L12_29 = A1_18
  L9_26 = L9_26(L10_27, L11_28, L12_29)
  L10_27 = db
  L10_27 = L10_27.beginTransaction
  L10_27()
  if A0_17 ~= nil then
    A0_17["radiusClient.ProfileName"] = A1_18
    A0_17["radiusClient.isEnable"] = "1"
    L10_27 = A0_17["radiusClient.ProfileName"]
    L3_20["radiusClient.ProfileName"] = L10_27
    L10_27 = A0_17["radiusClient.isEnable"]
    L3_20["radiusClient.isEnable"] = L10_27
    L10_27 = A0_17["radiusClient.authserver"]
    L3_20["radiusClient.authserver"] = L10_27
    L10_27 = A0_17["radiusClient.authport"]
    L3_20["radiusClient.authport"] = L10_27
    L10_27 = A0_17["radiusClient.authsecret"]
    if L10_27 ~= nil then
      L10_27 = util
      L10_27 = L10_27.isAllMasked
      L11_28 = A0_17["radiusClient.authsecret"]
      L10_27 = L10_27(L11_28)
      if L10_27 then
        L10_27 = L9_26[1]
        L10_27 = L10_27["radiusClient.authsecret"]
        L10_27 = L10_27 or A0_17["radiusClient.authsecret"]
        L3_20["radiusClient.authsecret"] = L10_27
      else
        L10_27 = A0_17["radiusClient.authsecret"]
        L3_20["radiusClient.authsecret"] = L10_27
      end
    end
    L10_27 = A0_17["radiusClient.acctserver"]
    L3_20["radiusClient.acctserver"] = L10_27
    L10_27 = A0_17["radiusClient.acctport"]
    L3_20["radiusClient.acctport"] = L10_27
    L10_27 = A0_17["radiusClient.acctsecret"]
    if L10_27 ~= nil then
      L10_27 = util
      L10_27 = L10_27.isAllMasked
      L11_28 = A0_17["radiusClient.acctsecret"]
      L10_27 = L10_27(L11_28)
      if L10_27 then
        L10_27 = L9_26[1]
        L10_27 = L10_27["radiusClient.acctsecret"]
        L10_27 = L10_27 or A0_17["radiusClient.acctsecret"]
        L3_20["radiusClient.acctsecret"] = L10_27
      else
        L10_27 = A0_17["radiusClient.acctsecret"]
        L3_20["radiusClient.acctsecret"] = L10_27
      end
    end
    L10_27 = A0_17["radiusClient.authretries"]
    L3_20["radiusClient.authretries"] = L10_27
    L10_27 = A0_17["radiusClient.authtimeout"]
    L3_20["radiusClient.authtimeout"] = L10_27
    L10_27 = L9_26[1]
    L6_23 = L10_27["radiusClient._ROWID_"]
    L10_27 = A0_17["radiusClient.ProfileName"]
    L4_21["radiusClient.ProfileName"] = L10_27
    L10_27 = A0_17["radiusClient.isEnable"]
    L4_21["radiusClient.isEnable"] = L10_27
    L10_27 = A0_17["radiusClient.authserver2"]
    L4_21["radiusClient.authserver"] = L10_27
    L10_27 = A0_17["radiusClient.authport2"]
    L4_21["radiusClient.authport"] = L10_27
    L10_27 = A0_17["radiusClient.authsecret2"]
    if L10_27 ~= nil then
      L10_27 = util
      L10_27 = L10_27.isAllMasked
      L11_28 = A0_17["radiusClient.authsecret2"]
      L10_27 = L10_27(L11_28)
      if L10_27 then
        L10_27 = L9_26[2]
        L10_27 = L10_27["radiusClient.authsecret"]
        L10_27 = L10_27 or A0_17["radiusClient.authsecret2"]
        L4_21["radiusClient.authsecret"] = L10_27
      else
        L10_27 = A0_17["radiusClient.authsecret2"]
        L4_21["radiusClient.authsecret"] = L10_27
      end
    end
    L10_27 = A0_17["radiusClient.acctserver2"]
    L4_21["radiusClient.acctserver"] = L10_27
    L10_27 = A0_17["radiusClient.acctport2"]
    L4_21["radiusClient.acctport"] = L10_27
    L10_27 = A0_17["radiusClient.acctsecret2"]
    if L10_27 ~= nil then
      L10_27 = util
      L10_27 = L10_27.isAllMasked
      L11_28 = A0_17["radiusClient.acctsecret2"]
      L10_27 = L10_27(L11_28)
      if L10_27 then
        L10_27 = L9_26[2]
        L10_27 = L10_27["radiusClient.acctsecret"]
        L10_27 = L10_27 or A0_17["radiusClient.acctsecret2"]
        L4_21["radiusClient.acctsecret"] = L10_27
      else
        L10_27 = A0_17["radiusClient.acctsecret2"]
        L4_21["radiusClient.acctsecret"] = L10_27
      end
    end
    L10_27 = A0_17["radiusClient.authretries2"]
    L4_21["radiusClient.authretries"] = L10_27
    L10_27 = A0_17["radiusClient.authtimeout2"]
    L4_21["radiusClient.authtimeout"] = L10_27
    L10_27 = A0_17["radiusClient.ProfileName"]
    L5_22["radiusClient.ProfileName"] = L10_27
    L10_27 = A0_17["radiusClient.isEnable"]
    L5_22["radiusClient.isEnable"] = L10_27
    L10_27 = A0_17["radiusClient.authserver3"]
    L5_22["radiusClient.authserver"] = L10_27
    L10_27 = A0_17["radiusClient.authport3"]
    L5_22["radiusClient.authport"] = L10_27
    L10_27 = A0_17["radiusClient.authsecret3"]
    if L10_27 ~= nil then
      L10_27 = util
      L10_27 = L10_27.isAllMasked
      L11_28 = A0_17["radiusClient.authsecret3"]
      L10_27 = L10_27(L11_28)
      if L10_27 then
        L10_27 = L9_26[3]
        L10_27 = L10_27["radiusClient.authsecret"]
        L10_27 = L10_27 or A0_17["radiusClient.authsecret3"]
        L5_22["radiusClient.authsecret"] = L10_27
      else
        L10_27 = A0_17["radiusClient.authsecret3"]
        L5_22["radiusClient.authsecret"] = L10_27
      end
    end
    L10_27 = A0_17["radiusClient.acctserver3"]
    L5_22["radiusClient.acctserver"] = L10_27
    L10_27 = A0_17["radiusClient.acctport3"]
    L5_22["radiusClient.acctport"] = L10_27
    L10_27 = A0_17["radiusClient.acctsecret3"]
    if L10_27 ~= nil then
      L10_27 = util
      L10_27 = L10_27.isAllMasked
      L11_28 = A0_17["radiusClient.acctsecret3"]
      L10_27 = L10_27(L11_28)
      if L10_27 then
        L10_27 = L9_26[3]
        L10_27 = L10_27["radiusClient.acctsecret"]
        L10_27 = L10_27 or A0_17["radiusClient.acctsecret3"]
        L5_22["radiusClient.acctsecret3"] = L10_27
      else
        L10_27 = A0_17["radiusClient.acctsecret3"]
        L5_22["radiusClient.acctsecret"] = L10_27
      end
    end
    L10_27 = A0_17["radiusClient.authretries3"]
    L5_22["radiusClient.authretries"] = L10_27
    L10_27 = A0_17["radiusClient.authtimeout3"]
    L5_22["radiusClient.authtimeout"] = L10_27
  end
  L10_27 = db
  L10_27 = L10_27.update
  L11_28 = "radiusClient"
  L12_29 = L3_20
  L13_30 = L6_23
  L10_27 = L10_27(L11_28, L12_29, L13_30)
  L2_19 = L10_27
  if L2_19 then
    L10_27 = #L9_26
    if L10_27 == 1 then
      if L4_21 ~= nil then
        L10_27 = db
        L10_27 = L10_27.insert
        L11_28 = "radiusClient"
        L12_29 = L4_21
        L13_30 = "-1"
        L10_27 = L10_27(L11_28, L12_29, L13_30)
        L2_19 = L10_27
        if L2_19 and L5_22 ~= nil then
          L10_27 = db
          L10_27 = L10_27.insert
          L11_28 = "radiusClient"
          L12_29 = L5_22
          L13_30 = "-1"
          L10_27 = L10_27(L11_28, L12_29, L13_30)
          L2_19 = L10_27
        end
      end
    end
  elseif L2_19 then
    L10_27 = L9_26[2]
    L7_24 = L10_27["radiusClient._ROWID_"]
    L10_27 = db
    L10_27 = L10_27.update
    L11_28 = "radiusClient"
    L12_29 = L4_21
    L13_30 = L7_24
    L10_27 = L10_27(L11_28, L12_29, L13_30)
    L2_19 = L10_27
    L10_27 = #L9_26
    if L10_27 == 2 then
      if L2_19 and L5_22 ~= nil then
        L10_27 = db
        L10_27 = L10_27.insert
        L11_28 = "radiusClient"
        L12_29 = L5_22
        L13_30 = "-1"
        L10_27 = L10_27(L11_28, L12_29, L13_30)
        L2_19 = L10_27
      end
    elseif L2_19 and L5_22 ~= nil then
      L10_27 = L9_26[3]
      L8_25 = L10_27["radiusClient._ROWID_"]
      L10_27 = db
      L10_27 = L10_27.update
      L11_28 = "radiusClient"
      L12_29 = L5_22
      L13_30 = L8_25
      L10_27 = L10_27(L11_28, L12_29, L13_30)
      L2_19 = L10_27
    end
  end
  L10_27 = HIGH_SEC
  if L10_27 == "HIGH" and L2_19 then
    L10_27 = {}
    L11_28 = ""
    L12_29 = ""
    L13_30 = "( AuthenticationType = 'radius_pap' OR AuthenticationType = 'radius_chap' OR AuthenticationType = 'radius_mschap' OR AuthenticationType = 'radius_mschapv2' ) AND AuthProfile = '"
    L13_30 = L13_30 .. L14_31 .. L15_32
    L10_27 = L14_31
    if L10_27 ~= nil then
      for L17_34, L18_35 in L14_31(L15_32) do
        L11_28 = db.getAttribute("UserGroups", "GroupId", L18_35["USERDBDomains.GroupId"], "_ROWID_")
        L2_19, L12_29 = sslAdmin.domainConfig(L18_35, L11_28, "edit")
      end
    end
  end
  if L2_19 then
    L10_27 = db
    L10_27 = L10_27.commitTransaction
    L11_28 = true
    L10_27(L11_28)
    L10_27 = "OK"
    L11_28 = "12265"
    return L10_27, L11_28
  else
    L10_27 = db
    L10_27 = L10_27.rollback
    L10_27()
    L10_27 = "ERROR"
    L11_28 = "11902"
    return L10_27, L11_28
  end
end
function radius.profileDelete(A0_36)
  local L1_37, L2_38, L3_39, L4_40, L5_41, L6_42, L7_43, L8_44, L9_45, L10_46
  L1_37 = {}
  L2_38 = false
  L3_39, L4_40 = nil, nil
  if L5_41 ~= 0 then
    return L5_41, L6_42
  end
  L8_44 = A0_36
  L1_37 = L5_41
  L5_41()
  for L8_44, L9_45 in L5_41(L6_42) do
    L10_46 = L9_45["radiusClient.isEnable"]
    if L10_46 == "1" then
      L10_46 = db
      L10_46 = L10_46.rollback
      L10_46()
      L10_46 = "ERROR"
      return L10_46, "13350"
    end
    L10_46 = {}
    L10_46["radiusClient._ROWID_"] = L9_45["radiusClient._ROWID_"]
    L2_38 = db.delete("radiusClient", L10_46)
  end
  if L2_38 then
    L5_41(L6_42)
    return L5_41, L6_42
  else
    L5_41()
    return L5_41, L6_42
  end
end
function radius.inputvalidate(A0_47, A1_48)
  do break end
  do return db.typeAndRangeValidate(A0_47) end
  return true
end
function radius.radiusEnable(A0_49)
  local L1_50
  L1_50 = {}
  L1_50 = db.getTable("radiusClient")
  for _FORV_5_, _FORV_6_ in pairs(L1_50) do
    if _FORV_6_["radiusClient.ProfileName"] == A0_49 then
      db.setAttribute("radiusClient", "ProfileName", A0_49, "isEnable", "1")
    else
      db.setAttribute("radiusClient", "ProfileName", _FORV_6_["radiusClient.ProfileName"], "isEnable", "0")
    end
  end
  return "OK", "13351"
end
function radius.radiusProfilesGet()
  return db.getDistinctValues("radiusClient", "ProfileName")
end
function radius.profileRowsGet(A0_51)
  return db.getRows("radiusClient", "ProfileName", A0_51)
end
