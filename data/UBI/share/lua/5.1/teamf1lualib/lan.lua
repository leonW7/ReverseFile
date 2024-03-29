require("teamf1lualib/dhcp")
lan = {}
function lan.config(A0_0, A1_1, A2_2)
  local L3_3, L4_4
  L3_3 = ACCESS_LEVEL
  if L3_3 ~= 0 then
    L3_3 = "ACCESS_DENIED"
    L4_4 = "10187"
    return L3_3, L4_4
  end
  L3_3 = db
  L3_3 = L3_3.beginTransaction
  L3_3()
  L3_3 = false
  L4_4 = lan
  L4_4 = L4_4.inputvalidate
  L4_4 = L4_4(A0_0, A2_2)
  if L4_4 then
    if A2_2 == "add" then
      L4_4 = nil
      return L4_4
    elseif A2_2 == "edit" then
      L4_4 = db
      L4_4 = L4_4.update
      L4_4 = L4_4("Lan", A0_0, A1_1)
      L3_3 = L4_4
    elseif A2_2 == "delete" then
      L4_4 = nil
      return L4_4
    end
  end
  L4_4 = A0_0["dhcp.set"]
  if L4_4 ~= nil then
    L4_4 = A0_0["dhcp.set"]
    if L4_4 == "1" then
      L4_4 = {}
      L4_4["dhcp.startAddress"] = A0_0["dhcp.startAddress"]
      L4_4["dhcp.endAddress"] = A0_0["dhcp.endAddress"]
      if L3_3 then
        DBTable = "dhcp"
        errorFlag, statusCode = dhcp.config(L4_4, "1", "edit")
        if errorFlag == "OK" then
          L3_3 = true
        else
          db.rollback()
          return "ERROR", statusCode
        end
      end
    end
  end
  if L3_3 then
    L4_4 = db
    L4_4 = L4_4.commitTransaction
    L4_4()
    L4_4 = "OK"
    return L4_4, "12265"
  else
    L4_4 = db
    L4_4 = L4_4.rollback
    L4_4()
    L4_4 = "ERROR"
    return L4_4, "12766"
  end
end
function lan.inputvalidate(A0_5, A1_6)
  do return db.typeAndRangeValidate(A0_5) end
  return false
end
function lan.ipv4LanConfig(A0_7, A1_8, A2_9)
  local L3_10, L4_11, L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L13_20, L14_21, L15_22, L16_23
  L3_10 = ACCESS_LEVEL
  if L3_10 ~= 0 then
    L3_10 = "ACCESS_DENIED"
    L4_11 = "10187"
    return L3_10, L4_11
  end
  L3_10 = db
  L3_10 = L3_10.beginTransaction
  L3_10()
  L3_10 = false
  if A2_9 == "add" then
    L4_11 = nil
    return L4_11
  elseif A2_9 == "edit" then
    L4_11 = {}
    L5_12 = db
    L5_12 = L5_12.update
    L6_13 = "ifStatic"
    L7_14 = A0_7
    L8_15 = A1_8
    L5_12 = L5_12(L6_13, L7_14, L8_15)
    L3_10 = L5_12
    L5_12 = db
    L5_12 = L5_12.getAttribute
    L6_13 = "ifStatic"
    L7_14 = "_ROWID_"
    L8_15 = A1_8
    L9_16 = "LogicalIfName"
    L5_12 = L5_12(L6_13, L7_14, L8_15, L9_16)
    if L5_12 ~= "DMZ" then
      L6_13, L7_14, L8_15 = nil, nil, nil
      L9_16 = A0_7["vlan.vlanId"]
      if L9_16 ~= nil then
        L10_17 = "bdg"
        L11_18 = tonumber
        L12_19 = L9_16
        L11_18 = L11_18(L12_19)
        L7_14 = L10_17 .. L11_18
        if L7_14 ~= nil then
          L10_17 = db
          L10_17 = L10_17.getAttribute
          L11_18 = "interVLANRouting"
          L12_19 = "ifName"
          L13_20 = L7_14
          L14_21 = "accessType"
          L10_17 = L10_17(L11_18, L12_19, L13_20, L14_21)
          L8_15 = L10_17
        end
        if L8_15 ~= nil and L8_15 ~= "0" then
          L10_17 = A0_7["ifStatic.StaticIp"]
          if L10_17 ~= nil then
            L10_17 = {}
            L11_18 = A0_7["ifStatic.StaticIp"]
            L10_17["CaptivePortalVlan.ipAddress"] = L11_18
            L11_18 = db
            L11_18 = L11_18.update
            L12_19 = "CaptivePortalVlan"
            L13_20 = L10_17
            L14_21 = tonumber
            L15_22 = L9_16
            L16_23 = L14_21(L15_22)
            L11_18 = L11_18(L12_19, L13_20, L14_21, L15_22, L16_23, L14_21(L15_22))
            L3_10 = L11_18
          end
        end
      end
      L10_17 = A0_7["vlan.vlanId"]
      if L10_17 == "" or L10_17 == nil then
        L10_17 = "1"
      end
      L11_18 = "vlanId = '"
      L12_19 = L10_17
      L13_20 = "'"
      L11_18 = L11_18 .. L12_19 .. L13_20
      L12_19 = db
      L12_19 = L12_19.existsRowWhere
      L13_20 = "interVLAN"
      L14_21 = L11_18
      L12_19 = L12_19(L13_20, L14_21)
      if L12_19 then
        L13_20 = A0_7["ifStatic.StaticIp"]
        L4_11["interVLAN.StaticIp"] = L13_20
        L13_20 = db
        L13_20 = L13_20.update
        L14_21 = "interVLAN"
        L15_22 = L4_11
        L16_23 = L12_19
        L13_20 = L13_20(L14_21, L15_22, L16_23)
        L3_10 = L13_20
      end
      L13_20 = {}
      L14_21 = nil
      if L10_17 == "1" then
        L14_21 = "LAN"
      else
        L15_22 = "LAN"
        L16_23 = L10_17
        L14_21 = L15_22 .. L16_23
      end
      L15_22 = "vlanName = '"
      L16_23 = L14_21
      L15_22 = L15_22 .. L16_23 .. "'"
      L16_23 = db
      L16_23 = L16_23.existsRowWhere
      L16_23 = L16_23("webAccessInfo", L15_22)
      if L16_23 then
        L13_20["webAccessInfo.vlanIpAddr"] = A0_7["ifStatic.StaticIp"]
        L13_20["webAccessInfo.vlanSubnet"] = A0_7["ifStatic.NetMask"]
        L3_10 = db.update("webAccessInfo", L13_20, L16_23)
      end
    end
  elseif A2_9 == "delete" then
    L4_11 = nil
    return L4_11
  end
  if L3_10 then
    L4_11 = db
    L4_11 = L4_11.commitTransaction
    L4_11()
    L4_11 = "OK"
    L5_12 = "12265"
    return L4_11, L5_12
  else
    L4_11 = db
    L4_11 = L4_11.rollback
    L4_11()
    L4_11 = "ERROR"
    L5_12 = "12767"
    return L4_11, L5_12
  end
end
function lan.ipv6LanConfig(A0_24, A1_25, A2_26)
  local L3_27
  L3_27 = ACCESS_LEVEL
  if L3_27 ~= 0 then
    L3_27 = "ACCESS_DENIED"
    return L3_27, "10187"
  end
  L3_27 = db
  L3_27 = L3_27.beginTransaction
  L3_27()
  L3_27 = false
  if lan.inputvalidate(A0_24, A2_26) then
    if A2_26 == "add" then
      return nil
    elseif A2_26 == "edit" then
      L3_27 = db.update("ifStatic", A0_24, A1_25)
    elseif A2_26 == "delete" then
      return nil
    end
  end
  if L3_27 then
    if db.existsRow("dhcpv6s", "_ROWID_", "1") then
      L3_27 = db.update("dhcpv6s", A0_24, "1")
    else
      L3_27 = db.insert("dhcpv6s", A0_24)
    end
  end
  if L3_27 then
    db.commitTransaction()
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "11138"
  end
end
function lan.lanPoolsDelete(A0_28)
  local L1_29, L2_30, L3_31, L4_32, L5_33, L6_34, L7_35
  L1_29 = ACCESS_LEVEL
  if L1_29 ~= 0 then
    L1_29 = "ACCESS_DENIED"
    return L1_29, L2_30
  end
  L1_29 = db
  L1_29 = L1_29.beginTransaction
  L1_29()
  L1_29 = false
  for L5_33, L6_34 in L2_30(L3_31) do
    L7_35 = {}
    L7_35["dhcpv6sLANAddrPool._ROWID_"] = L6_34
    L1_29 = db.delete("dhcpv6sLANAddrPool", L7_35)
    if L1_29 == false then
      break
    end
  end
  if L1_29 then
    L2_30(L3_31)
    return L2_30, L3_31
  else
    L2_30()
    return L2_30, L3_31
  end
end
function lan.poolConfig(A0_36, A1_37, A2_38)
  local L3_39
  L3_39 = ACCESS_LEVEL
  if L3_39 ~= 0 then
    L3_39 = "ACCESS_DENIED"
    return L3_39, "10187"
  end
  L3_39 = db
  L3_39 = L3_39.beginTransaction
  L3_39()
  L3_39 = false
  if db.typeAndRangeValidate(A0_36) then
    if A2_38 == "add" then
      L3_39 = db.insert(DBTable, A0_36)
    elseif A2_38 == "edit" then
      L3_39 = db.update(DBTable, A0_36, A1_37)
    elseif A2_38 == "delete" then
      L3_39 = db.delete(DBTable, A0_36)
    end
  end
  if L3_39 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "11139"
  end
end
function lan.lanPrefixDelete(A0_40)
  local L1_41, L2_42, L3_43, L4_44, L5_45, L6_46, L7_47
  L1_41 = ACCESS_LEVEL
  if L1_41 ~= 0 then
    L1_41 = "ACCESS_DENIED"
    return L1_41, L2_42
  end
  L1_41 = db
  L1_41 = L1_41.beginTransaction
  L1_41()
  L1_41 = false
  for L5_45, L6_46 in L2_42(L3_43) do
    L7_47 = {}
    L7_47["dhcpv6sLANPrefixPool._ROWID_"] = L6_46
    L1_41 = db.delete("dhcpv6sLANPrefixPool", L7_47)
    if L1_41 == false then
      break
    end
  end
  if L1_41 then
    L2_42(L3_43)
    return L2_42, L3_43
  else
    L2_42()
    return L2_42, L3_43
  end
end
function lan.prefixConfig(A0_48, A1_49, A2_50)
  local L3_51
  L3_51 = ACCESS_LEVEL
  if L3_51 ~= 0 then
    L3_51 = "ACCESS_DENIED"
    return L3_51, "10187"
  end
  L3_51 = db
  L3_51 = L3_51.beginTransaction
  L3_51()
  L3_51 = false
  if db.typeAndRangeValidate(A0_48) then
    if A2_50 == "add" then
      L3_51 = db.insert(DBTable, A0_48)
    elseif A2_50 == "edit" then
      L3_51 = db.update(DBTable, A0_48, A1_49)
    elseif A2_50 == "delete" then
      L3_51 = db.delete(DBTable, A0_48)
    end
  end
  if L3_51 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "11143"
  end
end
