local L0_0, L1_1
L0_0 = {}
bbwProfiles = L0_0
L0_0 = {}
bridgeTrafficSelector = L0_0
L0_0 = bbwProfiles
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
  return false
end
L0_0.config = L1_1
L0_0 = bridgeTrafficSelector
function L1_1(A0_5, A1_6, A2_7)
  if db.typeAndRangeValidate(A0_5) then
    if A2_7 == "add" then
      return db.insert(DBTable, A0_5)
    elseif A2_7 == "edit" then
      return db.update(DBTable, A0_5, A1_6)
    elseif A2_7 == "delete" then
      return db.delete(DBTable, A0_5)
    end
  end
  return false
end
L0_0.config = L1_1
L0_0 = bbwProfiles
function L1_1(A0_8, A1_9, A2_10)
  local L3_11, L4_12, L5_13, L6_14, L7_15
  L3_11 = ACCESS_LEVEL
  if L3_11 ~= 0 then
    L3_11 = "ACCESS_DENIED"
    L4_12 = "10187"
    return L3_11, L4_12
  end
  L3_11 = db
  L3_11 = L3_11.beginTransaction
  L3_11()
  L3_11 = false
  if A2_10 == "add" then
    L4_12 = db
    L4_12 = L4_12.existsRow
    L5_13 = "L2DscpClassList"
    L6_14 = "Status"
    L7_15 = "0"
    L4_12 = L4_12(L5_13, L6_14, L7_15)
    if L4_12 then
      L5_13 = db
      L5_13 = L5_13.getAttribute
      L6_14 = "L2DscpClassList"
      L7_15 = "_ROWID_"
      L5_13 = L5_13(L6_14, L7_15, L4_12, "ClassId")
      L6_14 = db
      L6_14 = L6_14.getAttribute
      L7_15 = "L2DscpClassList"
      L6_14 = L6_14(L7_15, "_ROWID_", L4_12, "DscpMark")
      A0_8["L2BandWidthProfile.DscpMark"] = L6_14
      A0_8["L2BandWidthProfile.ClassId"] = L5_13
      L7_15 = {}
      L7_15["L2DscpClassList.Status"] = 1
      L3_11 = db.update("L2DscpClassList", L7_15, L4_12)
      L3_11 = L3_11 and bbwProfiles.config(A0_8, A1_9, "add")
    else
      L5_13 = "ERROR"
      L6_14 = "13471"
      return L5_13, L6_14
    end
  end
  if A2_10 == "edit" then
    L4_12 = DBTable
    if L4_12 == "L2BandWidthProfile" then
      L4_12 = db
      L4_12 = L4_12.getAttribute
      L5_13 = "L2BandWidthProfile"
      L6_14 = "_ROWID_"
      L7_15 = A1_9
      L4_12 = L4_12(L5_13, L6_14, L7_15, "ProfileName")
      L5_13 = db
      L5_13 = L5_13.getRows
      L6_14 = "L2TrafficSelector"
      L7_15 = "ProfileName"
      L5_13 = L5_13(L6_14, L7_15, L4_12)
      L6_14 = #L5_13
      if L6_14 == 0 then
        L6_14 = bbwProfiles
        L6_14 = L6_14.config
        L7_15 = A0_8
        L6_14 = L6_14(L7_15, A1_9, A2_10)
        L3_11 = L6_14
      else
        L6_14 = db
        L6_14 = L6_14.rollback
        L6_14()
        L6_14 = "ERROR"
        L7_15 = "13472"
        return L6_14, L7_15
      end
    else
      L4_12 = bbwProfiles
      L4_12 = L4_12.config
      L5_13 = A0_8
      L6_14 = A1_9
      L7_15 = A2_10
      L4_12 = L4_12(L5_13, L6_14, L7_15)
      L3_11 = L4_12
    end
  end
  if L3_11 then
    L4_12 = db
    L4_12 = L4_12.commitTransaction
    L5_13 = true
    L4_12(L5_13)
    if A2_10 == "edit" then
      L4_12 = DBTable
      if L4_12 == "L2BandWidthProfile" then
        L4_12 = db
        L4_12 = L4_12.setAttributeWhere
        L5_13 = "L2BandWidthProfileStatus"
        L6_14 = "rowId != 0"
        L7_15 = "Status"
        L4_12(L5_13, L6_14, L7_15, 0)
        L4_12 = os
        L4_12 = L4_12.execute
        L5_13 = "sleep 1"
        L4_12(L5_13)
        L4_12 = db
        L4_12 = L4_12.setAttributeWhere
        L5_13 = "L2BandWidthProfileStatus"
        L6_14 = "rowId != 0"
        L7_15 = "Status"
        L4_12(L5_13, L6_14, L7_15, 1)
      end
    end
    L4_12 = "OK"
    L5_13 = "12265"
    return L4_12, L5_13
  else
    L4_12 = db
    L4_12 = L4_12.rollback
    L4_12()
    L4_12 = DBTable
    if L4_12 == "L2BandWidthProfile" then
      L4_12 = "ERROR"
      L5_13 = "13473"
      return L4_12, L5_13
    else
      L4_12 = "ERROR"
      L5_13 = "13474"
      return L4_12, L5_13
    end
  end
end
L0_0.profileConfig = L1_1
L0_0 = bbwProfiles
function L1_1(A0_16)
  local L1_17, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26, L11_27, L12_28, L13_29
  L1_17 = ACCESS_LEVEL
  if L1_17 ~= 0 then
    L1_17 = "ACCESS_DENIED"
    L2_18 = "10187"
    return L1_17, L2_18
  end
  L1_17 = db
  L1_17 = L1_17.beginTransaction
  L1_17()
  L1_17 = false
  L2_18 = ""
  for L6_22, L7_23 in L3_19(L4_20) do
    L8_24 = {}
    L8_24["L2BandWidthProfile._ROWID_"] = L7_23
    L9_25 = db
    L9_25 = L9_25.getAttribute
    L10_26 = "L2BandWidthProfile"
    L11_27 = "_ROWID_"
    L12_28 = L7_23
    L13_29 = "DscpMark"
    L9_25 = L9_25(L10_26, L11_27, L12_28, L13_29)
    L10_26 = db
    L10_26 = L10_26.existsRow
    L11_27 = "L2DscpClassList"
    L12_28 = "DscpMark"
    L13_29 = L9_25
    L10_26 = L10_26(L11_27, L12_28, L13_29)
    L11_27 = db
    L11_27 = L11_27.getAttribute
    L12_28 = "L2BandWidthProfile"
    L13_29 = "_ROWID_"
    L11_27 = L11_27(L12_28, L13_29, L7_23, "ProfileName")
    L12_28 = db
    L12_28 = L12_28.getRows
    L13_29 = "L2TrafficSelector"
    L12_28 = L12_28(L13_29, "ProfileName", L11_27)
    L13_29 = {}
    L13_29["L2DscpClassList.Status"] = 0
    if #L12_28 ~= 0 then
      L1_17 = false
      L2_18 = "1"
    else
      L1_17 = true
    end
    L1_17 = L1_17 and db.update("L2DscpClassList", L13_29, L10_26)
    L1_17 = L1_17 and db.delete("L2BandWidthProfile", L8_24)
    if not L1_17 then
      break
    end
  end
  if L1_17 then
    L3_19(L4_20)
    return L3_19, L4_20
  else
    L3_19()
    if L2_18 == "1" then
      return L3_19, L4_20
    else
      return L3_19, L4_20
    end
  end
end
L0_0.deleteProfiles = L1_1
L0_0 = bridgeTrafficSelector
function L1_1(A0_30, A1_31, A2_32)
  local L3_33
  L3_33 = ACCESS_LEVEL
  if L3_33 ~= 0 then
    L3_33 = "ACCESS_DENIED"
    return L3_33, "10187"
  end
  L3_33 = db
  L3_33 = L3_33.beginTransaction
  L3_33()
  L3_33 = false
  L3_33 = bridgeTrafficSelector.config(A0_30, A1_31, A2_32)
  if L3_33 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    if A2_32 == "delete" then
      return "ERROR", "13477"
    else
      return "ERROR", "13478"
    end
  end
end
L0_0.profileConfig = L1_1
