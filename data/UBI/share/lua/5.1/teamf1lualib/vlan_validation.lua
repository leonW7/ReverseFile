local L0_0, L1_1
L0_0 = "ifStatic"
ifStaticTable = L0_0
L0_0 = "vlan"
vlanTable = L0_0
L0_0 = "dummy"
DUMMY_PORT_NAME = L0_0
L0_0 = nil
NIL = L0_0
L0_0 = false
FALSE = L0_0
L0_0 = 512
DSR_1000_MAXLIMIT = L0_0
L0_0 = 256
DSR_500_MAXLIMIT = L0_0
L0_0 = 128
DSR_250_MAXLIMIT = L0_0
L0_0 = 64
DSR_150_MAXLIMIT = L0_0
L0_0 = DSR_1000_MAXLIMIT
RESERVED_IP_MAXLIMIT = L0_0
L0_0 = PRODUCT_ID
if L0_0 ~= "DSR-500AC_Ax" then
  L0_0 = PRODUCT_ID
  if L0_0 ~= "DSR-500_Bx" then
    L0_0 = UNIT_NAME
    if L0_0 ~= "DSR-500" then
      L0_0 = UNIT_NAME
    end
  end
else
  if L0_0 == "DSR-500N" then
    L0_0 = DSR_500_MAXLIMIT
    RESERVED_IP_MAXLIMIT = L0_0
end
else
  L0_0 = UNIT_NAME
  if L0_0 ~= "DSR-250" then
    L0_0 = UNIT_NAME
  else
    if L0_0 == "DSR-250N" then
      L0_0 = DSR_250_MAXLIMIT
      RESERVED_IP_MAXLIMIT = L0_0
  end
  else
    L0_0 = UNIT_NAME
    if L0_0 ~= "DSR-150" then
      L0_0 = UNIT_NAME
    elseif L0_0 == "DSR-150N" then
      L0_0 = DSR_150_MAXLIMIT
      RESERVED_IP_MAXLIMIT = L0_0
    end
  end
end
function L0_0(A0_2)
  portNumbersList = {
    "1",
    "2",
    "3",
    "4"
  }
  for _FORV_4_, _FORV_5_ in pairs(portNumbersList) do
    if _FORV_5_ == A0_2 then
      return true
    end
  end
  return false
end
portListCheck = L0_0
function L0_0(A0_3, A1_4)
  local L2_5, L3_6, L4_7, L5_8, L6_9, L7_10, L8_11
  L3_6 = vlanTable
  if A0_3 == L3_6 then
    L3_6 = "SELECT _ROWID_ from "
    L7_10 = "'"
    L2_5 = L3_6 .. L4_7 .. L5_8 .. L6_9 .. L7_10
  else
    L3_6 = ifStaticTable
    if A0_3 == L3_6 then
      L3_6 = "SELECT _ROWID_ from "
      L2_5 = L3_6 .. L4_7 .. L5_8
    elseif A1_4 ~= nil then
      L3_6 = "SELECT _ROWID_ from "
      L2_5 = L3_6 .. L4_7 .. L5_8 .. L6_9
    else
      L3_6 = "SELECT _ROWID_ from "
      L2_5 = L3_6 .. L4_7
    end
  end
  L3_6 = db
  L3_6 = L3_6.getTable
  L3_6 = L3_6(L4_7, L5_8, L6_9)
  for L7_10, L8_11 in L4_7(L5_8) do
    for _FORV_12_, _FORV_13_ in pairs(L8_11) do
      return _FORV_13_
    end
  end
end
firstCookieGet = L0_0
function L0_0(A0_12, A1_13, A2_14)
  local L3_15, L4_16, L5_17, L6_18, L7_19, L8_20, L9_21
  L3_15 = tostring
  L4_16 = A0_12
  L3_15 = L3_15(L4_16)
  A0_12 = L3_15
  L3_15 = nil
  L4_16 = vlanTable
  if A1_13 == L4_16 then
    L4_16 = "SELECT _ROWID_ from "
    L8_20 = "'"
    L3_15 = L4_16 .. L5_17 .. L6_18 .. L7_19 .. L8_20
  else
    L4_16 = ifStaticTable
    if A1_13 == L4_16 then
      L4_16 = "SELECT _ROWID_ from "
      L3_15 = L4_16 .. L5_17 .. L6_18
    elseif A2_14 ~= nil then
      L4_16 = "SELECT _ROWID_ from "
      L3_15 = L4_16 .. L5_17 .. L6_18 .. L7_19
    else
      L4_16 = "SELECT _ROWID_ from "
      L3_15 = L4_16 .. L5_17
    end
  end
  L4_16 = db
  L4_16 = L4_16.getTable
  L4_16 = L4_16(L5_17, L6_18, L7_19)
  for L8_20, L9_21 in L5_17(L6_18) do
    for _FORV_13_, _FORV_14_ in pairs(L9_21) do
      if _FORV_14_ == A0_12 then
        return true
      end
    end
  end
  return L5_17
end
checkCookieExists = L0_0
function L0_0(A0_22, A1_23, A2_24)
  local L3_25, L4_26, L5_27, L6_28, L7_29, L8_30, L9_31, L10_32
  L3_25 = tostring
  L4_26 = A0_22
  L3_25 = L3_25(L4_26)
  A0_22 = L3_25
  L3_25 = nil
  L4_26 = vlanTable
  if A1_23 == L4_26 then
    L4_26 = "SELECT _ROWID_ from "
    L5_27 = A1_23
    L3_25 = L4_26 .. L5_27 .. L6_28 .. L7_29 .. L8_30
  else
    L4_26 = ifStaticTable
    if A1_23 == L4_26 then
      L4_26 = "SELECT _ROWID_ from "
      L5_27 = A1_23
      L3_25 = L4_26 .. L5_27 .. L6_28
    elseif A2_24 ~= nil then
      L4_26 = "SELECT _ROWID_ from "
      L5_27 = A1_23
      L3_25 = L4_26 .. L5_27 .. L6_28 .. L7_29
    else
      L4_26 = "SELECT _ROWID_ from "
      L5_27 = A1_23
      L3_25 = L4_26 .. L5_27
    end
  end
  L4_26 = db
  L4_26 = L4_26.getTable
  L5_27 = A1_23
  L4_26 = L4_26(L5_27, L6_28, L7_29)
  L5_27 = 0
  for L9_31, L10_32 in L6_28(L7_29) do
    for _FORV_14_, _FORV_15_ in pairs(L10_32) do
      if L5_27 == 1 then
        return _FORV_15_
      end
      if _FORV_15_ == A0_22 then
        L5_27 = 1
      end
    end
  end
  if L5_27 == 0 then
    return L6_28, L7_29
  else
    return L6_28
  end
end
nextCookieGet = L0_0
function L0_0(A0_33, A1_34, A2_35, A3_36)
  local L4_37, L5_38, L6_39, L7_40, L8_41, L9_42, L10_43
  L4_37 = db
  L4_37 = L4_37.getTableWithJoin
  L5_38 = {L6_39}
  L9_42 = ":"
  L10_43 = A2_35
  L4_37 = L4_37(L5_38)
  L5_38 = {}
  for L9_42, L10_43 in L6_39(L7_40) do
    if L10_43[A0_33 .. "." .. A2_35] == A3_36 then
      for _FORV_14_, _FORV_15_ in pairs(L10_43) do
        L5_38[_FORV_14_] = _FORV_15_
      end
      return L5_38
    end
  end
end
getRowJoinTable = L0_0
function L0_0(A0_44, A1_45)
  local L2_46
  L2_46 = {}
  for _FORV_6_, _FORV_7_ in pairs(A0_44) do
    L2_46[_FORV_6_] = _FORV_7_
  end
  for _FORV_6_, _FORV_7_ in pairs(A1_45) do
    L2_46[_FORV_6_] = _FORV_7_
  end
  return L2_46
end
merge1DTable = L0_0
function L0_0(A0_47, A1_48)
  local L2_49
  L2_49 = {}
  for _FORV_6_, _FORV_7_ in pairs(A0_47) do
    L2_49[_FORV_6_] = {}
    print(A0_47[_FORV_6_], A1_48[_FORV_6_])
    if type(A0_47[_FORV_6_]) == "table" and type(A1_48[_FORV_6_]) == "table" then
      L2_49[_FORV_6_] = merge1DTable(A0_47[_FORV_6_], A1_48[_FORV_6_])
    end
  end
  return L2_49
end
merge2DTable = L0_0
