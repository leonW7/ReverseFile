local L0_0, L1_1
L0_0 = {}
iproute = L0_0
L0_0 = iproute
function L1_1(A0_2, A1_3, A2_4)
  local L3_5, L4_6, L5_7
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
  L4_6 = ""
  L5_7 = iproute
  L5_7 = L5_7.inputvalidate
  L5_7 = L5_7(A0_2)
  if L5_7 then
    if A2_4 == "add" then
      L5_7 = db
      L5_7 = L5_7.getRowsWhere
      L5_7 = L5_7("route", "routeName = '" .. A0_2["route.routeName"] .. "'")
      if #L5_7 == 0 then
        L5_7 = db.getTable("route")
        for _FORV_11_, _FORV_12_ in pairs(L5_7) do
          if _FORV_12_["route.dstIpAddr"] == A0_2["route.dstIpAddr"] and _FORV_12_["route.metric"] == A0_2["route.metric"] then
            ({})[0 + 1] = _FORV_12_["route._ROWID_"]
          end
        end
        if #{} == 0 then
          L3_5 = db.insert("route", A0_2)
          if L3_5 then
            L4_6 = "11996"
          else
            L4_6 = "11997"
          end
        else
          L4_6 = "11998"
          L3_5 = false
        end
      else
        L4_6 = "12004"
        L3_5 = false
      end
    elseif A2_4 == "edit" then
      L5_7 = db
      L5_7 = L5_7.getTable
      L5_7 = L5_7("route")
      for _FORV_11_, _FORV_12_ in pairs(L5_7) do
        if _FORV_12_["route.dstIpAddr"] == A0_2["route.dstIpAddr"] and _FORV_12_["route.metric"] == A0_2["route.metric"] then
          ({})[0 + 1] = _FORV_12_["route._ROWID_"]
        end
      end
      if #{} == 0 or #{} == 1 and ({})[1] == A1_3 then
        L3_5 = db.update("route", A0_2, A1_3)
        if L3_5 then
          L4_6 = "12002"
        else
          L4_6 = "12001"
        end
      else
        L4_6 = "11998"
        L3_5 = false
      end
    end
  end
  if L3_5 then
    L5_7 = db
    L5_7 = L5_7.commitTransaction
    L5_7(true)
    L5_7 = "OK"
    return L5_7, L4_6
  else
    L5_7 = db
    L5_7 = L5_7.rollback
    L5_7()
    L5_7 = "ERROR"
    return L5_7, L4_6
  end
end
L0_0.config = L1_1
L0_0 = iproute
function L1_1(A0_8)
  local L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15
  L1_9 = ACCESS_LEVEL
  if L1_9 ~= 0 then
    L1_9 = "ACCESS_DENIED"
    return L1_9, L2_10
  end
  L1_9 = db
  L1_9 = L1_9.beginTransaction
  L1_9()
  L1_9 = false
  for L5_13, L6_14 in L2_10(L3_11) do
    L7_15 = {}
    L7_15["route._ROWID_"] = L6_14
    L1_9 = db.delete("route", L7_15)
    if not L1_9 then
      break
    end
  end
  if L1_9 then
    L2_10(L3_11)
    return L2_10, L3_11
  else
    L2_10()
    return L2_10, L3_11
  end
end
L0_0.deleteRoute = L1_1
L0_0 = iproute
function L1_1(A0_16)
  if db.typeAndRangeValidate(A0_16) then
    return true
  else
    return false
  end
end
L0_0.inputvalidate = L1_1
L0_0 = iproute
function L1_1(A0_17, A1_18, A2_19)
  local L3_20, L4_21, L5_22, L6_23
  L3_20 = ACCESS_LEVEL
  if L3_20 ~= 0 then
    L3_20 = "ACCESS_DENIED"
    L4_21 = "10187"
    return L3_20, L4_21
  end
  L3_20 = db
  L3_20 = L3_20.beginTransaction
  L3_20()
  L3_20 = false
  L4_21 = ""
  L5_22 = iproute
  L5_22 = L5_22.inputvalidate
  L6_23 = A0_17
  L5_22 = L5_22(L6_23)
  if L5_22 then
    if A2_19 == "add" then
      L5_22 = db
      L5_22 = L5_22.getRowsWhere
      L6_23 = "route6"
      L5_22 = L5_22(L6_23, "routeName = '" .. A0_17["route6.routeName"] .. "'")
      L6_23 = #L5_22
      if L6_23 == 0 then
        L6_23 = db
        L6_23 = L6_23.getTable
        L6_23 = L6_23("route6")
        for _FORV_12_, _FORV_13_ in pairs(L6_23) do
          if _FORV_13_["route6.dstIpAddr"] == A0_17["route6.dstIpAddr"] and _FORV_13_["route6.metric"] == A0_17["route6.metric"] then
            ({})[0 + 1] = _FORV_13_["route6._ROWID_"]
          end
        end
        if #{} == 0 then
          L3_20 = db.insert("route6", A0_17)
          if L3_20 then
            L4_21 = "11151"
          else
            L4_21 = "11152"
          end
        else
          L4_21 = "11998"
          L3_20 = false
        end
      else
        L4_21 = "12004"
        L3_20 = false
      end
    elseif A2_19 == "edit" then
      L5_22 = db
      L5_22 = L5_22.getTable
      L6_23 = "route6"
      L5_22 = L5_22(L6_23)
      L6_23 = 0
      for _FORV_11_, _FORV_12_ in pairs(L5_22) do
        if _FORV_12_["route6.dstIpAddr"] == A0_17["route6.dstIpAddr"] and _FORV_12_["route6.metric"] == A0_17["route6.metric"] then
          L6_23 = L6_23 + 1
          ;({})[L6_23] = _FORV_12_["route6._ROWID_"]
        end
      end
      if #{} == 0 or #{} == 1 and ({})[1] == A1_18 then
        L3_20 = db.update("route6", A0_17, A1_18)
        if L3_20 then
          L4_21 = "11155"
        else
          L4_21 = "11154"
        end
      else
        L4_21 = "11998"
        L3_20 = false
      end
    end
  end
  if L3_20 then
    L5_22 = db
    L5_22 = L5_22.commitTransaction
    L6_23 = true
    L5_22(L6_23)
    L5_22 = "OK"
    L6_23 = L4_21
    return L5_22, L6_23
  else
    L5_22 = db
    L5_22 = L5_22.rollback
    L5_22()
    L5_22 = "ERROR"
    L6_23 = L4_21
    return L5_22, L6_23
  end
end
L0_0.ipv6Config = L1_1
L0_0 = iproute
function L1_1(A0_24)
  local L1_25, L2_26, L3_27, L4_28, L5_29, L6_30, L7_31
  L1_25 = ACCESS_LEVEL
  if L1_25 ~= 0 then
    L1_25 = "ACCESS_DENIED"
    return L1_25, L2_26
  end
  L1_25 = db
  L1_25 = L1_25.beginTransaction
  L1_25()
  L1_25 = false
  for L5_29, L6_30 in L2_26(L3_27) do
    L7_31 = {}
    L7_31["route6._ROWID_"] = L6_30
    L1_25 = db.delete("route6", L7_31)
    if not L1_25 then
      break
    end
  end
  if L1_25 then
    L2_26(L3_27)
    return L2_26, L3_27
  else
    L2_26()
    return L2_26, L3_27
  end
end
L0_0.deleteIpv6Route = L1_1
