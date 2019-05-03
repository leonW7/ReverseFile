local L0_0, L1_1
L0_0 = {}
lanGroups = L0_0
L0_0 = {}
lanHost = L0_0
L0_0 = lanGroups
function L1_1(A0_2, A1_3, A2_4)
  local L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L12_14, L13_15, L14_16, L15_17, L16_18
  L3_5 = ACCESS_LEVEL
  if L3_5 ~= 0 then
    L3_5 = "ACCESS_DENIED"
    return L3_5, L4_6
  end
  L3_5 = db
  L3_5 = L3_5.beginTransaction
  L3_5()
  L3_5 = false
  if L4_6 then
    if A2_4 == "add" then
      if L4_6 then
        L3_5 = L4_6
      else
        L4_6()
        return L4_6, L5_7
      end
    elseif A2_4 == "edit" then
      L3_5 = false
    elseif A2_4 == "delete" then
      for L7_9, L8_10 in L4_6(L5_7) do
        L9_11 = db
        L9_11 = L9_11.getAttribute
        L10_12 = "LanGroup"
        L11_13 = "LanGroup._ROWID_"
        L9_11 = L9_11(L10_12, L11_13, L12_14, L13_15)
        L10_12 = db
        L10_12 = L10_12.existsRowWhere
        L11_13 = "BlockSites"
        L10_12 = L10_12(L11_13, L12_14)
        if L10_12 then
          L11_13 = db
          L11_13 = L11_13.rollback
          L11_13()
          L11_13 = "ERROR"
          return L11_13, L12_14
        end
        L11_13 = db
        L11_13 = L11_13.getRowsWhere
        L15_17 = "'"
        L11_13 = L11_13(L12_14, L13_15)
        if L11_13 ~= nil then
          for L15_17, L16_18 in L12_14(L13_15) do
            L3_5 = lanHost.config(L16_18, "-1", "delete")
            if L3_5 then
            else
              db.rollback()
              return "ERROR", "11201"
            end
          end
        end
      end
      L3_5 = L4_6
    end
  end
  if L3_5 then
    L4_6()
    return L4_6, L5_7
  else
    L4_6()
    return L4_6, L5_7
  end
end
L0_0.config = L1_1
L0_0 = lanGroups
function L1_1(A0_19, A1_20)
  do return db.typeAndRangeValidate(A0_19) end
  return false
end
L0_0.inputvalidate = L1_1
function L0_0(A0_21)
  local L1_22
  L1_22 = db
  L1_22 = L1_22.getTable
  L1_22 = L1_22("LanGroup")
  for _FORV_6_, _FORV_7_ in pairs(L1_22) do
    if string.lower(A0_21) == string.lower(L1_22[0 + 1]["LanGroup.GroupName"]) then
      return false
    end
  end
  return true
end
checkValidGroupName = L0_0
L0_0 = lanHost
function L1_1(A0_23, A1_24, A2_25)
  local L3_26
  L3_26 = ACCESS_LEVEL
  if L3_26 ~= 0 then
    L3_26 = "ACCESS_DENIED"
    return L3_26, "10187"
  end
  L3_26 = db
  L3_26 = L3_26.beginTransaction
  L3_26()
  L3_26 = false
  if db.typeAndRangeValidate(A0_23) then
    if A2_25 == "add" then
      L3_26 = db.insert("LanHost", A0_23)
    elseif A2_25 == "edit" then
      L3_26 = db.update("LanHost", A0_23, A1_24)
    elseif A2_25 == "delete" then
      L3_26 = db.delete("LanHost", A0_23)
    end
  end
  if L3_26 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "11201"
  end
end
L0_0.config = L1_1
