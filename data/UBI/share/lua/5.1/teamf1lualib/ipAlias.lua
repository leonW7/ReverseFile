local L0_0, L1_1
L0_0 = {}
ipAlias = L0_0
L0_0 = ipAlias
function L1_1(A0_2, A1_3, A2_4)
  local L3_5, L4_6, L5_7, L6_8, L7_9, L8_10
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
  L4_6 = "12752"
  L5_7 = db
  L5_7 = L5_7.typeAndRangeValidate
  L6_8 = A0_2
  L5_7 = L5_7(L6_8)
  if L5_7 then
    if A2_4 == "add" then
      L5_7 = db
      L5_7 = L5_7.insert
      L6_8 = "ifStaticIPAlias"
      L7_9 = A0_2
      L5_7 = L5_7(L6_8, L7_9)
      L3_5 = L5_7
    elseif A2_4 == "edit" then
      L5_7 = db
      L5_7 = L5_7.getAttribute
      L6_8 = "ifStaticIPAlias"
      L7_9 = "_ROWID_"
      L8_10 = A1_3
      L5_7 = L5_7(L6_8, L7_9, L8_10, "IPAddress")
      L6_8 = "RuleType = 'SECURE_INSECURE' and Action != 'DROP' and SNATAddressType != 7 and SNATAddress ='"
      L7_9 = L5_7
      L8_10 = "'"
      L6_8 = L6_8 .. L7_9 .. L8_10
      L7_9 = db
      L7_9 = L7_9.existsRowWhere
      L8_10 = "FirewallRules"
      L7_9 = L7_9(L8_10, L6_8)
      L8_10 = "RuleType = 'INSECURE_SECURE' and DestinationPublicInterface != 'WAN1' and DestinationPublicInterface != 'WAN2' and DestinationPublicAddress ='"
      L8_10 = L8_10 .. L5_7 .. "'"
      if L7_9 or db.existsRowWhere("FirewallRules", L8_10) then
        L4_6 = "10212"
        L3_5 = false
      else
        L3_5 = true
      end
      if db.getAttribute("ifStaticIPAlias", "_ROWID_", A1_3, "LogicalIfName") ~= A0_2["ifStaticIPAlias.LogicalIfName"] and #db.getRowsWhere("ifStaticIPAlias", "LogicalIfName = '" .. A0_2["ifStaticIPAlias.LogicalIfName"] .. "'") >= 8 then
        L4_6 = "11354"
        L3_5 = false
      end
      L3_5 = L3_5 and db.update("ifStaticIPAlias", A0_2, A1_3)
    end
  end
  if L3_5 then
    L5_7 = db
    L5_7 = L5_7.commitTransaction
    L5_7()
    L5_7 = "OK"
    L6_8 = "12265"
    return L5_7, L6_8
  else
    L5_7 = db
    L5_7 = L5_7.rollback
    L5_7()
    L5_7 = "ERROR"
    L6_8 = L4_6
    return L5_7, L6_8
  end
end
L0_0.config = L1_1
L0_0 = ipAlias
function L1_1(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20, L10_21, L11_22
  L1_12 = ACCESS_LEVEL
  if L1_12 ~= 0 then
    L1_12 = "ACCESS_DENIED"
    L2_13 = "10187"
    return L1_12, L2_13
  end
  L1_12 = db
  L1_12 = L1_12.beginTransaction
  L1_12()
  L1_12 = true
  L2_13 = "12265"
  for L6_17, L7_18 in L3_14(L4_15) do
    L8_19 = db
    L8_19 = L8_19.getAttribute
    L9_20 = "ifStaticIPAlias"
    L10_21 = "_ROWID_"
    L11_22 = L7_18
    L8_19 = L8_19(L9_20, L10_21, L11_22, "IPAddress")
    L9_20 = {}
    L10_21 = "RuleType = 'SECURE_INSECURE' and Action != 'DROP' and SNATAddressType != 7 and SNATAddress ='"
    L11_22 = L8_19
    L10_21 = L10_21 .. L11_22 .. "'"
    L11_22 = db
    L11_22 = L11_22.existsRowWhere
    L11_22 = L11_22("FirewallRules", L10_21)
    L9_20 = L11_22
    L11_22 = "RuleType = 'INSECURE_SECURE' and DestinationPublicInterface != 'WAN1' and DestinationPublicAddress ='"
    L11_22 = L11_22 .. L8_19 .. "'"
    firewallRules1 = db.existsRowWhere("FirewallRules", L11_22)
    if L9_20 or firewallRules1 then
      L1_12 = false
      L2_13 = "10212"
      break
    end
  end
  if L1_12 then
    for L6_17, L7_18 in L3_14(L4_15) do
      L8_19 = {}
      L8_19["ifStaticIPAlias._ROWID_"] = L7_18
      L9_20 = db
      L9_20 = L9_20.delete
      L10_21 = "ifStaticIPAlias"
      L11_22 = L8_19
      L9_20 = L9_20(L10_21, L11_22)
      L1_12 = L9_20
      if L1_12 == false then
        L2_13 = "12753"
        break
      end
    end
  end
  if L1_12 then
    L3_14(L4_15)
    return L3_14, L4_15
  else
    L3_14()
    return L3_14, L4_15
  end
end
L0_0.deleteIPAlias = L1_1
