local L0_0, L1_1
L0_0 = {}
vlan = L0_0
L0_0 = vlan
function L1_1(A0_2, A1_3, A2_4)
  if db.typeAndRangeValidate(A0_2) then
    if A2_4 == "add" then
      return db.insert(DBTable, A0_2)
    elseif A2_4 == "edit" then
      return db.update(DBTable, A0_2, A1_3)
    elseif A2_4 == "delete" then
      return db.delete(DBTable, A0_2)
    end
  end
end
L0_0.config = L1_1
L0_0 = vlan
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
  L3_8 = vlan.config(A0_5, A1_6, A2_7)
  if L3_8 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12496"
  end
end
L0_0.vlanStatusConfig = L1_1
L0_0 = vlan
function L1_1(A0_9, A1_10, A2_11)
  local L3_12, L4_13, L5_14, L6_15, L7_16, L8_17, L9_18, L10_19, L11_20, L12_21, L13_22
  L3_12 = ACCESS_LEVEL
  if L3_12 ~= 0 then
    L3_12 = "ACCESS_DENIED"
    return L3_12, L4_13
  end
  L3_12 = db
  L3_12 = L3_12.beginTransaction
  L3_12()
  L3_12 = false
  if A2_11 == "add" or A2_11 == "edit" then
    if L4_13 == "VlanPortMgmt" then
      if L4_13 == "0" then
        L7_16 = "_ROWID_"
        L7_16 = 0
        for L11_20, L12_21 in L8_17(L9_18) do
          L7_16 = L7_16 + 1
          if L13_22 ~= nil and L13_22[L4_13] ~= nil and L13_22[L4_13] == "1" and L13_22["vlan.vlanId"] ~= A0_9["VlanPortMgmt.DefaultPVID"] then
            break
          elseif (L13_22[L4_13] ~= nil or L13_22[L4_13] == "0") and L13_22["vlan.vlanId"] == A0_9["VlanPortMgmt.DefaultPVID"] then
            L13_22[L4_13] = "1"
            db.update("vlan", L13_22, L13_22["vlan._ROWID_"])
          end
        end
        if L6_15 then
          L8_17()
          return L8_17, L9_18
        end
      end
      L7_16 = A0_9["VlanPortMgmt.DefaultPVID"]
      if L4_13 == nil then
        L4_13["vlan.vlanId"] = L5_14
        L7_16 = L4_13
        L3_12 = L5_14
        if not L3_12 then
          L5_14()
          return L5_14, L6_15
        end
      else
        L7_16 = A0_9["VlanPortMgmt.DefaultPVID"]
        L7_16 = "_ROWID_"
        L7_16 = "vlan"
        L3_12 = L6_15
        if not L3_12 then
          L6_15()
          L7_16 = "12496"
          return L6_15, L7_16
        end
      end
    end
  elseif A2_11 == "delete" then
    for L7_16, L8_17 in L4_13(L5_14) do
      if L10_19 then
        if L12_21 > 1 then
          L12_21()
          return L12_21, L13_22
        end
        for _FORV_15_, _FORV_16_ in L12_21(L13_22) do
          L3_12 = vlanConfig.config({
            _FORV_16_["vlan._ROWID_"]
          }, -1, "delete")
        end
      end
    end
  end
  L7_16 = nil
  if L8_17 == "VlanPortMgmt" then
  end
  if A2_11 ~= "delete" then
    L3_12 = L8_17
  end
  if L8_17 == "VlanPortMgmt" then
    L7_16 = L8_17
  end
  if L3_12 then
    if L8_17 == "VlanPortMgmt" and (L4_13 ~= nil and L5_14 ~= nil and L4_13 ~= L5_14 or L6_15 ~= nil and L7_16 ~= nil and L6_15 ~= L7_16) then
      for _FORV_14_, _FORV_15_ in L11_20(L12_21) do
        if L9_18[L10_19] ~= nil then
          if true then
            db.setAttribute("vlan", "_ROWID_", L9_18[L10_19]["vlan._ROWID_"], db.getAttribute("VlanPortMgmt", "_ROWID_", A1_10, "PortLogicalName"), L9_18[L10_19][L8_17])
          end
        end
      end
    end
  end
  if L3_12 then
    if L8_17 == "VlanPortMgmt" then
      L3_12 = L8_17
    end
  end
  if L3_12 then
    L8_17(L9_18)
    if L8_17 == "VlanPortMgmt" then
      if L8_17 == "0" then
        locTable = L8_17
        DBTable = L8_17
        L8_17[L9_18] = L10_19
        L8_17(L9_18, L10_19)
        DBTable = L8_17
      end
    end
    return L8_17, L9_18
  else
    L8_17()
    return L8_17, L9_18
  end
end
L0_0.vlanConfig = L1_1
L0_0 = vlan
function L1_1(A0_23, A1_24)
  local L2_25, L3_26, L4_27, L5_28, L6_29, L7_30, L8_31, L9_32, L10_33, L11_34, L12_35, L13_36, L14_37
  L2_25 = ACCESS_LEVEL
  if L2_25 ~= 0 then
    L2_25 = "ACCESS_DENIED"
    L3_26 = "10187"
    return L2_25, L3_26
  end
  L2_25 = db
  L2_25 = L2_25.beginTransaction
  L2_25()
  L2_25 = false
  L3_26 = false
  L4_27 = "vlan."
  L5_28 = db
  L5_28 = L5_28.getAttribute
  L6_29 = "VlanPortMgmt"
  L5_28 = L5_28(L6_29, L7_30, L8_31, L9_32)
  L4_27 = L4_27 .. L5_28
  L5_28 = db
  L5_28 = L5_28.getTable
  L6_29 = "vlan"
  L5_28 = L5_28(L6_29)
  L6_29 = 0
  for L10_33, L11_34 in L7_30(L8_31) do
    L6_29 = L6_29 + 1
    L12_35 = L5_28[L6_29]
    L13_36 = false
    if L12_35 ~= nil then
      L14_37 = "vlan.row_"
      L14_37 = L14_37 .. L12_35["vlan._ROWID_"]
      L14_37 = A0_23[L14_37]
      if L14_37 == nil then
        L14_37 = L12_35["vlan.portName"]
        if L14_37 ~= nil then
          L14_37 = "vlan."
          L14_37 = L14_37 .. L12_35["vlan.portName"]
          if L14_37 == L4_27 then
            L14_37 = vlan
            L14_37 = L14_37.config
            L14_37 = L14_37({
              L12_35["vlan._ROWID_"]
            }, -1, "delete")
            L2_25 = L14_37
            L3_26 = true
            if not L2_25 then
              break
            end
          end
        end
      end
      L14_37 = "vlan.new_vlanId_"
      L14_37 = L14_37 .. L12_35["vlan.vlanId"]
      L14_37 = A0_23[L14_37]
      if L14_37 ~= nil then
        L14_37 = {}
        L14_37["vlan.vlanId"] = A0_23["vlan.new_vlanId_" .. L12_35["vlan.vlanId"]]
        L14_37["vlan.vlanName"] = db.getAttribute("vlan", "vlanId", L14_37["vlan.vlanId"], "vlanName")
        L14_37["vlan.portName"] = db.getAttribute("VlanPortMgmt", "_ROWID_", A1_24, "PortLogicalName")
        L2_25 = vlan.config(L14_37, -1, "add")
      end
    end
  end
  if not L3_26 then
    L2_25 = true
  end
  if L2_25 then
    L7_30(L8_31)
    return L7_30, L8_31
  else
    L7_30()
    return L7_30, L8_31
  end
end
L0_0.portVlanConfig = L1_1
