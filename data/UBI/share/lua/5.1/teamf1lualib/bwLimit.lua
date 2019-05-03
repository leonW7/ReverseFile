local L0_0, L2_1, L3_2
L0_0 = {}
bwProfiles = L0_0
L0_0 = {}
trafficSelector = L0_0
L0_0 = "TrafficSelector"
L2_1 = nil
L3_2 = PRODUCT_ID
if L3_2 ~= "DSR-1000AC_Ax" then
  L3_2 = PRODUCT_ID
  if L3_2 ~= "DSR-500AC_Ax" then
    L3_2 = PRODUCT_ID
    if L3_2 ~= "DSR-1000_Bx" then
      L3_2 = PRODUCT_ID
      if L3_2 ~= "DSR-500_Bx" then
        L3_2 = PRODUCT_ID
        if L3_2 ~= "DSR-1000_Ax" then
          L3_2 = PRODUCT_ID
        end
      end
    end
  end
else
  if L3_2 == "DSR-1000N_Ax" then
    L2_1 = 15
end
else
  L3_2 = PRODUCT_ID
  if L3_2 ~= "DSR-500_Ax" then
    L3_2 = PRODUCT_ID
  else
    if L3_2 == "DSR-500N_Ax" then
      L2_1 = 8
  end
  else
    L3_2 = UNIT_NAME
    if L3_2 ~= "DSR-250" then
      L3_2 = UNIT_NAME
    else
      if L3_2 == "DSR-250N" then
        L2_1 = 4
    end
    else
      L3_2 = UNIT_NAME
      if L3_2 ~= "DSR-150" then
        L3_2 = UNIT_NAME
      elseif L3_2 == "DSR-150N" then
        L2_1 = 4
      end
    end
  end
end
L3_2 = bwProfiles
function L3_2.config(A0_3, A1_4, A2_5)
  if db.typeAndRangeValidate(A0_3) then
    if A2_5 == "add" then
      return db.insert(DBTable, A0_3)
    elseif A2_5 == "edit" then
      return db.update(DBTable, A0_3, A1_4)
    elseif A2_5 == "delete" then
      return db.delete(DBTable, A0_3)
    end
  end
  return false
end
L3_2 = bwProfiles
function L3_2.profileConfig(A0_6, A1_7, A2_8)
  local L3_9, L4_10, L5_11, L6_12, L7_13
  L3_9 = ACCESS_LEVEL
  if L3_9 ~= 0 then
    L3_9 = "ACCESS_DENIED"
    L4_10 = "10187"
    return L3_9, L4_10
  end
  L3_9 = db
  L3_9 = L3_9.beginTransaction
  L3_9()
  L3_9 = false
  if A2_8 == "add" then
    L4_10 = db
    L4_10 = L4_10.existsRow
    L5_11 = "DscpClassList"
    L6_12 = "Status"
    L7_13 = "0"
    L4_10 = L4_10(L5_11, L6_12, L7_13)
    if L4_10 then
      L5_11 = db
      L5_11 = L5_11.getAttribute
      L6_12 = "DscpClassList"
      L7_13 = "_ROWID_"
      L5_11 = L5_11(L6_12, L7_13, L4_10, "ClassId")
      L6_12 = db
      L6_12 = L6_12.getAttribute
      L7_13 = "DscpClassList"
      L6_12 = L6_12(L7_13, "_ROWID_", L4_10, "DscpMark")
      A0_6["BandWidthProfile.DscpMark"] = L6_12
      A0_6["BandWidthProfile.ClassId"] = L5_11
      L7_13 = {}
      L7_13["DscpClassList.Status"] = 1
      L3_9 = db.update("DscpClassList", L7_13, L4_10)
      L3_9 = L3_9 and bwProfiles.config(A0_6, A1_7, "add")
    else
      L5_11 = "Maximum limit for bandwidth profiles is reached."
      statusMessage = L5_11
      L5_11 = "ERROR"
      L6_12 = statusMessage
      return L5_11, L6_12
    end
  end
  if A2_8 == "edit" then
    L4_10 = DBTable
    if L4_10 == "BandWidthProfile" then
      L4_10 = db
      L4_10 = L4_10.getAttribute
      L5_11 = "BandWidthProfile"
      L6_12 = "_ROWID_"
      L7_13 = A1_7
      L4_10 = L4_10(L5_11, L6_12, L7_13, "ProfileName")
      L5_11 = db
      L5_11 = L5_11.getRows
      L6_12 = "TrafficSelector"
      L7_13 = "ProfileName"
      L5_11 = L5_11(L6_12, L7_13, L4_10)
      L6_12 = #L5_11
      if L6_12 == 0 then
        L6_12 = bwProfiles
        L6_12 = L6_12.config
        L7_13 = A0_6
        L6_12 = L6_12(L7_13, A1_7, A2_8)
        L3_9 = L6_12
      else
        L6_12 = db
        L6_12 = L6_12.rollback
        L6_12()
        L6_12 = "ERROR"
        L7_13 = "10306"
        return L6_12, L7_13
      end
    else
      L4_10 = bwProfiles
      L4_10 = L4_10.config
      L5_11 = A0_6
      L6_12 = A1_7
      L7_13 = A2_8
      L4_10 = L4_10(L5_11, L6_12, L7_13)
      L3_9 = L4_10
    end
  end
  if L3_9 then
    L4_10 = db
    L4_10 = L4_10.commitTransaction
    L5_11 = true
    L4_10(L5_11)
    if A2_8 == "edit" then
      L4_10 = DBTable
      if L4_10 == "BandWidthProfile" then
        L4_10 = db
        L4_10 = L4_10.setAttributeWhere
        L5_11 = "BandWidthProfileStatus"
        L6_12 = "rowId != 0"
        L7_13 = "Status"
        L4_10(L5_11, L6_12, L7_13, 0)
        L4_10 = os
        L4_10 = L4_10.execute
        L5_11 = "sleep 1"
        L4_10(L5_11)
        L4_10 = db
        L4_10 = L4_10.setAttributeWhere
        L5_11 = "BandWidthProfileStatus"
        L6_12 = "rowId != 0"
        L7_13 = "Status"
        L4_10(L5_11, L6_12, L7_13, 1)
      end
    end
    L4_10 = "OK"
    L5_11 = "12265"
    return L4_10, L5_11
  else
    L4_10 = db
    L4_10 = L4_10.rollback
    L4_10()
    L4_10 = DBTable
    if L4_10 == "BandWidthProfile" then
      L4_10 = "ERROR"
      L5_11 = "10308"
      return L4_10, L5_11
    else
      L4_10 = "ERROR"
      L5_11 = "10307"
      return L4_10, L5_11
    end
  end
end
L3_2 = bwProfiles
function L3_2.deleteProfiles(A0_14)
  local L1_15, L2_16, L3_17, L4_18, L5_19, L6_20, L7_21, L8_22, L9_23, L10_24, L11_25, L12_26, L13_27
  L1_15 = ACCESS_LEVEL
  if L1_15 ~= 0 then
    L1_15 = "ACCESS_DENIED"
    L2_16 = "10187"
    return L1_15, L2_16
  end
  L1_15 = db
  L1_15 = L1_15.beginTransaction
  L1_15()
  L1_15 = false
  L2_16 = ""
  for L6_20, L7_21 in L3_17(L4_18) do
    L8_22 = {}
    L8_22["BandWidthProfile._ROWID_"] = L7_21
    L9_23 = db
    L9_23 = L9_23.getAttribute
    L10_24 = "BandWidthProfile"
    L11_25 = "_ROWID_"
    L12_26 = L7_21
    L13_27 = "DscpMark"
    L9_23 = L9_23(L10_24, L11_25, L12_26, L13_27)
    L10_24 = db
    L10_24 = L10_24.existsRow
    L11_25 = "DscpClassList"
    L12_26 = "DscpMark"
    L13_27 = L9_23
    L10_24 = L10_24(L11_25, L12_26, L13_27)
    L11_25 = db
    L11_25 = L11_25.getAttribute
    L12_26 = "BandWidthProfile"
    L13_27 = "_ROWID_"
    L11_25 = L11_25(L12_26, L13_27, L7_21, "ProfileName")
    L12_26 = db
    L12_26 = L12_26.getRows
    L13_27 = "TrafficSelector"
    L12_26 = L12_26(L13_27, "ProfileName", L11_25)
    L13_27 = {}
    L13_27["DscpClassList.Status"] = 0
    if #L12_26 ~= 0 then
      L1_15 = false
      L2_16 = "1"
    else
      L1_15 = true
    end
    L1_15 = L1_15 and db.update("DscpClassList", L13_27, L10_24)
    L1_15 = L1_15 and db.delete("BandWidthProfile", L8_22)
    if not L1_15 then
      break
    end
  end
  if L1_15 then
    L3_17(L4_18)
    return L3_17, L4_18
  else
    L3_17()
    if L2_16 == "1" then
      return L3_17, L4_18
    else
      return L3_17, L4_18
    end
  end
end
L3_2 = trafficSelector
function L3_2.config(A0_28, A1_29, A2_30)
  if db.typeAndRangeValidate(A0_28) then
    if A2_30 == "add" then
      return db.insert(DBTable, A0_28)
    elseif A2_30 == "edit" then
      return db.update(DBTable, A0_28, A1_29)
    elseif A2_30 == "delete" then
      return db.delete(DBTable, A0_28)
    end
  end
  return false
end
L3_2 = trafficSelector
function L3_2.profileConfig(A0_31, A1_32, A2_33)
  local L3_34
  L3_34 = ACCESS_LEVEL
  if L3_34 ~= 0 then
    L3_34 = "ACCESS_DENIED"
    return L3_34, "10187"
  end
  if A2_33 == "add" then
    L3_34 = db
    L3_34 = L3_34.getTable
    L3_34 = L3_34(_UPVALUE0_)
    if L3_34 ~= nil and #L3_34 >= _UPVALUE1_ then
      statusMessage = "Maximum limit for traffic selectors is reached."
      return "ERROR", statusMessage
    end
  end
  L3_34 = db
  L3_34 = L3_34.beginTransaction
  L3_34()
  L3_34 = false
  L3_34 = trafficSelector.config(A0_31, A1_32, A2_33)
  if L3_34 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    if A2_33 == "delete" then
      return "ERROR", "12364"
    else
      return "ERROR", "12362"
    end
  end
end
