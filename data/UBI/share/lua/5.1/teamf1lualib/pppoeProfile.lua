local L0_0, L1_1
L0_0 = {}
pppoeProfile = L0_0
L0_0 = pppoeProfile
function L1_1(A0_2, A1_3, A2_4)
  local L3_5, L4_6, L5_7, L6_8, L7_9, L8_10
  L3_5 = 2
  L4_6 = ACCESS_LEVEL
  if L4_6 ~= 0 then
    L4_6 = "ACCESS_DENIED"
    L5_7 = "10187"
    return L4_6, L5_7
  end
  L4_6 = db
  L4_6 = L4_6.getAttribute
  L5_7 = "PppoeProfile"
  L6_8 = "LogicalIfName"
  L7_9 = A0_2["PppoeProfile.LogicalIfName"]
  L8_10 = "count(*)"
  L4_6 = L4_6(L5_7, L6_8, L7_9, L8_10)
  L4_6 = L4_6 or "0"
  if A2_4 == "add" then
    L5_7 = tonumber
    L6_8 = L4_6
    L5_7 = L5_7(L6_8)
    if L3_5 <= L5_7 then
      L5_7 = "ERROR"
      L6_8 = "10368"
      return L5_7, L6_8
    end
  end
  if A2_4 == "add" then
    L5_7 = db
    L5_7 = L5_7.existsRow
    L6_8 = "PppoeProfile"
    L7_9 = "ProfileName"
    L8_10 = A0_2["PppoeProfile.ProfileName"]
    L5_7 = L5_7(L6_8, L7_9, L8_10)
    if L5_7 then
      L5_7 = "ERROR"
      L6_8 = "11877"
      return L5_7, L6_8
    end
  end
  L5_7 = db
  L5_7 = L5_7.beginTransaction
  L5_7()
  L5_7 = false
  L6_8 = {}
  if A2_4 == "add" then
    L7_9 = 1
    while L7_9 <= 8 do
      L8_10 = db
      L8_10 = L8_10.existsRow
      L8_10 = L8_10("NimfConf", "ConnectionId", L7_9)
      if L8_10 then
        L7_9 = L7_9 + 1
      else
        break
      end
    end
    L8_10 = "PppoeProfile"
    DBTable = L8_10
    L8_10 = pppoeProfile
    L8_10 = L8_10.config
    L8_10 = L8_10(A0_2, A1_3, A2_4)
    L5_7 = L8_10
    if L5_7 then
      L8_10 = A0_2["PppoeProfile.LogicalIfName"]
      L6_8["Pppoe.LogicalIfName"] = L8_10
      L8_10 = A0_2["PppoeProfile.UserName"]
      L6_8["Pppoe.UserName"] = L8_10
      L8_10 = A0_2["PppoeProfile.Password"]
      L6_8["Pppoe.Password"] = L8_10
      L8_10 = A0_2["PppoeProfile.GetIpFromIsp"]
      L6_8["Pppoe.GetIpFromIsp"] = L8_10
      L8_10 = A0_2["PppoeProfile.GetIpFromIsp"]
      if L8_10 == "0" then
        L8_10 = A0_2["PppoeProfile.StaticIp"]
        L6_8["Pppoe.StaticIp"] = L8_10
        L8_10 = A0_2["PppoeProfile.NetMask"]
        L6_8["Pppoe.NetMask"] = L8_10
      end
      L8_10 = A0_2["PppoeProfile.GetDnsFromIsp"]
      L6_8["Pppoe.GetDnsFromIsp"] = L8_10
      L8_10 = A0_2["PppoeProfile.GetDnsFromIsp"]
      if L8_10 == "0" then
        L8_10 = A0_2["PppoeProfile.PrimaryDns"]
        L6_8["Pppoe.PrimaryDns"] = L8_10
        L8_10 = A0_2["PppoeProfile.SecondaryDns"]
        L6_8["Pppoe.SecondaryDns"] = L8_10
      end
      L8_10 = A0_2["PppoeProfile.IdleTimeOutFlag"]
      L6_8["Pppoe.IdleTimeOutFlag"] = L8_10
      L8_10 = A0_2["PppoeProfile.IdleTimeOutValue"]
      L6_8["Pppoe.IdleTimeOutValue"] = L8_10
      L8_10 = A0_2["PppoeProfile.ProfileName"]
      L6_8["Pppoe.ProfileName"] = L8_10
      L6_8["Pppoe.ConnectionId"] = L7_9
      L8_10 = "Pppoe"
      DBTable = L8_10
      L8_10 = pppoeProfile
      L8_10 = L8_10.config
      L8_10 = L8_10(L6_8, A1_3, A2_4)
      L5_7 = L8_10
    end
    if L5_7 then
      L8_10 = {}
      L8_10["MultiPppoe.LogicalIfName"] = A0_2["PppoeProfile.LogicalIfName"]
      L8_10["MultiPppoe.ConnectionId"] = L7_9
      DBTable = "MultiPppoe"
      L5_7 = pppoeProfile.config(L8_10, A1_3, A2_4)
    end
    if L5_7 then
      L8_10 = {}
      L8_10["NimfConf.UseDefaultMtu"], L8_10["NimfConf.SetMacAddress"], L8_10["NimfConf.PortSpeed"], L8_10["NimfConf.MtuSize"], L8_10["NimfConf.RequireLogin"], L8_10["NimfConf.IfStatus"], L8_10["NimfConf.ConnectionType"], L8_10["NimfConf.AddressFamily"], L8_10["NimfConf.LogicalIfName"] = 1, 0, 1, 1500, 0, 0, "pppoe", 2, A0_2["PppoeProfile.LogicalIfName"]
      L8_10["NimfConf.ConnectionId"] = L7_9
      DBTable = "NimfConf"
      L5_7 = pppoeProfile.config(L8_10, A1_3, A2_4)
    end
  else
    L7_9 = "PppoeProfile"
    DBTable = L7_9
    L7_9 = A1_3
    L8_10 = db
    L8_10 = L8_10.existsRow
    L8_10 = L8_10("PppoeProfile", "ProfileName", A0_2["PppoeProfile.ProfileName"])
    if L8_10 then
      L8_10 = db
      L8_10 = L8_10.getAttribute
      L8_10 = L8_10("PppoeProfile", "ProfileName", A0_2["PppoeProfile.ProfileName"], "_ROWID_")
      L7_9 = L8_10
    end
    if L7_9 == A1_3 then
      L8_10 = pppoeProfile
      L8_10 = L8_10.config
      L8_10 = L8_10(A0_2, A1_3, A2_4)
      L5_7 = L8_10
      L8_10 = A0_2["PppoeProfile.LogicalIfName"]
      L6_8["Pppoe.LogicalIfName"] = L8_10
      L8_10 = A0_2["PppoeProfile.UserName"]
      L6_8["Pppoe.UserName"] = L8_10
      L8_10 = A0_2["PppoeProfile.Password"]
      L6_8["Pppoe.Password"] = L8_10
      L8_10 = A0_2["PppoeProfile.GetIpFromIsp"]
      L6_8["Pppoe.GetIpFromIsp"] = L8_10
      L8_10 = A0_2["PppoeProfile.GetIpFromIsp"]
      if L8_10 == "0" then
        L8_10 = A0_2["PppoeProfile.StaticIp"]
        L6_8["Pppoe.StaticIp"] = L8_10
        L8_10 = A0_2["PppoeProfile.NetMask"]
        L6_8["Pppoe.NetMask"] = L8_10
      end
      L8_10 = A0_2["PppoeProfile.GetDnsFromIsp"]
      L6_8["Pppoe.GetDnsFromIsp"] = L8_10
      L8_10 = A0_2["PppoeProfile.GetDnsFromIsp"]
      if L8_10 == "0" then
        L8_10 = A0_2["PppoeProfile.PrimaryDns"]
        L6_8["Pppoe.PrimaryDns"] = L8_10
        L8_10 = A0_2["PppoeProfile.SecondaryDns"]
        L6_8["Pppoe.SecondaryDns"] = L8_10
      end
      L8_10 = A0_2["PppoeProfile.IdleTimeOutFlag"]
      L6_8["Pppoe.IdleTimeOutFlag"] = L8_10
      L8_10 = A0_2["PppoeProfile.IdleTimeOutValue"]
      L6_8["Pppoe.IdleTimeOutValue"] = L8_10
      L8_10 = A0_2["PppoeProfile.ProfileName"]
      L6_8["Pppoe.ProfileName"] = L8_10
      L8_10 = "Pppoe"
      DBTable = L8_10
      L8_10 = pppoeProfile
      L8_10 = L8_10.config
      L8_10 = L8_10(L6_8, A1_3, A2_4)
      L5_7 = L8_10
    else
      L8_10 = db
      L8_10 = L8_10.rollback
      L8_10()
      L8_10 = "ERROR"
      return L8_10, "11877"
    end
  end
  if L5_7 then
    L7_9 = db
    L7_9 = L7_9.commitTransaction
    L8_10 = true
    L7_9(L8_10)
    L7_9 = "OK"
    L8_10 = "12265"
    return L7_9, L8_10
  else
    L7_9 = db
    L7_9 = L7_9.rollback
    L7_9()
    L7_9 = "ERROR"
    L8_10 = "11828"
    return L7_9, L8_10
  end
end
L0_0.profileConfig = L1_1
L0_0 = pppoeProfile
function L1_1(A0_11, A1_12, A2_13)
  if db.typeAndRangeValidate(A0_11) then
    if A2_13 == "add" then
      return db.insert(DBTable, A0_11)
    elseif A2_13 == "edit" then
      return db.update(DBTable, A0_11, A1_12)
    elseif A2_13 == "delete" then
      return db.delete(DBTable, A0_11)
    end
  end
  return false
end
L0_0.config = L1_1
L0_0 = pppoeProfile
function L1_1(A0_14, A1_15)
  local L2_16, L3_17, L4_18, L5_19, L6_20, L7_21, L8_22, L9_23, L10_24, L11_25, L12_26, L13_27, L14_28, L15_29, L16_30, L17_31, L18_32, L19_33, L20_34
  L2_16 = ACCESS_LEVEL
  if L2_16 ~= 0 then
    L2_16 = "ACCESS_DENIED"
    L3_17 = "10187"
    return L2_16, L3_17
  end
  L2_16 = db
  L2_16 = L2_16.beginTransaction
  L2_16()
  L2_16 = true
  L3_17 = "12265"
  if A1_15 == "enable" then
    for L7_21, L8_22 in L4_18(L5_19) do
      L10_24 = "PppoeProfile"
      L11_25 = "_ROWID_"
      L12_26 = L8_22
      L13_27 = "LogicalIfName"
      L10_24 = "LogicalIfName ='"
      L11_25 = L9_23
      L12_26 = "' and AddressFamily = 2 and ConnectionId = 0"
      L10_24 = L10_24 .. L11_25 .. L12_26
      L11_25 = db
      L11_25 = L11_25.getRowWhere
      L12_26 = "NimfConf"
      L13_27 = L10_24
      L11_25 = L11_25(L12_26, L13_27)
      L12_26 = L11_25["NimfConf.ConnectionType"]
      if L12_26 ~= "pppoe" then
        L13_27 = db
        L13_27 = L13_27.rollback
        L13_27()
        L13_27 = "ERROR"
        L14_28 = "10456"
        return L13_27, L14_28
      end
      L13_27 = {}
      L14_28 = {}
      L15_29 = "1"
      L13_27["PppoeProfile.Status"] = L15_29
      L14_28["NimfConf.IfStatus"] = L15_29
      L16_30 = "PppoeProfile"
      DBTable = L16_30
      L16_30 = pppoeProfile
      L16_30 = L16_30.config
      L17_31 = L13_27
      L18_32 = L8_22
      L19_33 = "edit"
      L16_30 = L16_30(L17_31, L18_32, L19_33)
      L2_16 = L16_30
      L16_30 = db
      L16_30 = L16_30.getAttribute
      L17_31 = "PppoeProfile"
      L18_32 = "_ROWID_"
      L19_33 = L8_22
      L20_34 = "ProfileName"
      L16_30 = L16_30(L17_31, L18_32, L19_33, L20_34)
      if L2_16 == false then
        L3_17 = "11831"
        break
      end
      if L2_16 then
        L17_31 = db
        L17_31 = L17_31.getAttribute
        L18_32 = "Pppoe"
        L19_33 = "ProfileName"
        L20_34 = L16_30
        L17_31 = L17_31(L18_32, L19_33, L20_34, "ConnectionId")
        L18_32 = db
        L18_32 = L18_32.getAttribute
        L19_33 = "NimfConf"
        L20_34 = "ConnectionId"
        L18_32 = L18_32(L19_33, L20_34, L17_31, "_ROWID_")
        L19_33 = "NimfConf"
        DBTable = L19_33
        L19_33 = pppoeProfile
        L19_33 = L19_33.config
        L20_34 = L14_28
        L19_33 = L19_33(L20_34, L18_32, "edit")
        L2_16 = L19_33
      end
    end
  elseif A1_15 == "disable" then
    for L7_21, L8_22 in L4_18(L5_19) do
      L10_24 = {}
      L11_25 = "0"
      L9_23["PppoeProfile.Status"] = L11_25
      L10_24["NimfConf.IfStatus"] = L11_25
      L12_26 = "PppoeProfile"
      DBTable = L12_26
      L12_26 = pppoeProfile
      L12_26 = L12_26.config
      L13_27 = L9_23
      L14_28 = L8_22
      L15_29 = "edit"
      L12_26 = L12_26(L13_27, L14_28, L15_29)
      L2_16 = L12_26
      L12_26 = db
      L12_26 = L12_26.getAttribute
      L13_27 = "PppoeProfile"
      L14_28 = "_ROWID_"
      L15_29 = L8_22
      L16_30 = "ProfileName"
      L12_26 = L12_26(L13_27, L14_28, L15_29, L16_30)
      if L2_16 == false then
        L3_17 = "11830"
        break
      end
      if L2_16 then
        L13_27 = db
        L13_27 = L13_27.getAttribute
        L14_28 = "Pppoe"
        L15_29 = "ProfileName"
        L16_30 = L12_26
        L17_31 = "ConnectionId"
        L13_27 = L13_27(L14_28, L15_29, L16_30, L17_31)
        L14_28 = db
        L14_28 = L14_28.getAttribute
        L15_29 = "NimfConf"
        L16_30 = "ConnectionId"
        L17_31 = L13_27
        L18_32 = "_ROWID_"
        L14_28 = L14_28(L15_29, L16_30, L17_31, L18_32)
        L15_29 = "NimfConf"
        DBTable = L15_29
        L15_29 = pppoeProfile
        L15_29 = L15_29.config
        L16_30 = L10_24
        L17_31 = L14_28
        L18_32 = "edit"
        L15_29 = L15_29(L16_30, L17_31, L18_32)
        L2_16 = L15_29
      end
      if L2_16 == false then
        L3_17 = "11830"
        break
      end
    end
  else
    for L10_24, L11_25 in L7_21(L8_22) do
      L12_26 = db
      L12_26 = L12_26.getAttribute
      L13_27 = "PppoeProfile"
      L14_28 = "_ROWID_"
      L15_29 = L11_25
      L16_30 = "ProfileName"
      L12_26 = L12_26(L13_27, L14_28, L15_29, L16_30)
      L12_26 = db
      L12_26 = L12_26.getAttribute
      L13_27 = "Pppoe"
      L14_28 = "ProfileName"
      L15_29 = L4_18
      L16_30 = "_ROWID_"
      L12_26 = L12_26(L13_27, L14_28, L15_29, L16_30)
      L12_26 = db
      L12_26 = L12_26.getAttribute
      L13_27 = "Pppoe"
      L14_28 = "ProfileName"
      L15_29 = L4_18
      L16_30 = "ConnectionId"
      L12_26 = L12_26(L13_27, L14_28, L15_29, L16_30)
      L13_27 = db
      L13_27 = L13_27.getAttribute
      L14_28 = "NimfConf"
      L15_29 = "ConnectionId"
      L16_30 = L12_26
      L17_31 = "_ROWID_"
      L13_27 = L13_27(L14_28, L15_29, L16_30, L17_31)
      L14_28 = db
      L14_28 = L14_28.getAttribute
      L15_29 = "NimfConf"
      L16_30 = "_ROWID_"
      L17_31 = L13_27
      L18_32 = "IfStatus"
      L14_28 = L14_28(L15_29, L16_30, L17_31, L18_32)
      if L14_28 == L6_20 then
        L15_29 = db
        L15_29 = L15_29.rollback
        L15_29()
        L15_29 = "ERROR"
        L16_30 = "10599"
        return L15_29, L16_30
      end
    end
    for L10_24, L11_25 in L7_21(L8_22) do
      L12_26 = {}
      L13_27 = {}
      L14_28 = {}
      L15_29 = {}
      L16_30 = db
      L16_30 = L16_30.getAttribute
      L17_31 = "PppoeProfile"
      L18_32 = "_ROWID_"
      L19_33 = L11_25
      L20_34 = "ProfileName"
      L16_30 = L16_30(L17_31, L18_32, L19_33, L20_34)
      L16_30 = db
      L16_30 = L16_30.getAttribute
      L17_31 = "Pppoe"
      L18_32 = "ProfileName"
      L19_33 = L4_18
      L20_34 = "_ROWID_"
      L16_30 = L16_30(L17_31, L18_32, L19_33, L20_34)
      L16_30 = db
      L16_30 = L16_30.getAttribute
      L17_31 = "Pppoe"
      L18_32 = "ProfileName"
      L19_33 = L4_18
      L20_34 = "ConnectionId"
      L16_30 = L16_30(L17_31, L18_32, L19_33, L20_34)
      L17_31 = db
      L17_31 = L17_31.getAttribute
      L18_32 = "NimfConf"
      L19_33 = "ConnectionId"
      L20_34 = L16_30
      L17_31 = L17_31(L18_32, L19_33, L20_34, "_ROWID_")
      L18_32 = db
      L18_32 = L18_32.getAttribute
      L19_33 = "NimfConf"
      L20_34 = "_ROWID_"
      L18_32 = L18_32(L19_33, L20_34, L17_31, "IfStatus")
      L19_33 = db
      L19_33 = L19_33.getAttribute
      L20_34 = "MultiPppoe"
      L19_33 = L19_33(L20_34, "ConnectionId", L16_30, "_ROWID_")
      L20_34 = true
      L12_26["PppoeProfile._ROWID_"] = L11_25
      L14_28["Pppoe._ROWID_"] = L5_19
      L15_29["MultiPppoe._ROWID_"] = L19_33
      L13_27["NimfConf._ROWID_"] = L17_31
      DBTable = "Pppoe"
      L20_34 = pppoeProfile.config(L14_28, "-1", "delete")
      if L20_34 then
        DBTable = "PppoeProfile"
        L20_34 = pppoeProfile.config(L12_26, "-1", "delete")
      end
      if L20_34 then
        DBTable = "MultiPppoe"
        L20_34 = pppoeProfile.config(L15_29, "-1", "delete")
      end
      if L20_34 then
        DBTable = "NimfConf"
        L20_34 = pppoeProfile.config(L13_27, "-1", "delete")
      end
      if L20_34 == false then
        L3_17 = "11829"
        break
      end
    end
  end
  if L2_16 then
    L4_18(L5_19)
    return L4_18, L5_19
  else
    L4_18()
    return L4_18, L5_19
  end
end
L0_0.modifyProfileStatus = L1_1
