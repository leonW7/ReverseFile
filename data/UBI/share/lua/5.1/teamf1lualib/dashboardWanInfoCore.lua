local L0_0
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = "/tmp/system.db"
db.connect(L0_0)
function option1HistoricalBWUsageGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8
  L0_1 = db
  L0_1 = L0_1.getTable
  L1_2 = "option1DataHistory"
  L0_1 = L0_1(L1_2)
  L1_2 = {}
  L2_3 = 1
  _UPVALUE0_ = L2_3
  L2_3 = {}
  for L6_7, L7_8 in L3_4(L4_5) do
    for _FORV_11_, _FORV_12_ in pairs(L7_8) do
      if _FORV_11_ == "option1DataHistory.time" then
        L2_3[_UPVALUE0_] = _FORV_12_
        _UPVALUE0_ = _UPVALUE0_ + 1
      end
    end
  end
  if L3_4 > 0 then
    L3_4(L4_5)
    _UPVALUE1_ = L3_4
    for L7_8, _FORV_8_ in L4_5(L5_6) do
      L3_4[_UPVALUE1_] = {}
      L1_2[_UPVALUE1_] = db.getAttribute("option1DataHistory", "time", L2_3[_UPVALUE1_], "wan1HistoricData")
      _UPVALUE1_ = _UPVALUE1_ + 1
    end
    return L4_5, L5_6
  else
    return L3_4
  end
end
function option2HistoricalBWUsageGet()
  local L0_9, L1_10, L2_11, L3_12, L4_13, L5_14, L6_15, L7_16, L8_17, L9_18, L10_19, L11_20, L12_21, L13_22, L14_23, L15_24, L16_25, L17_26, L18_27
  L0_9 = db
  L0_9 = L0_9.getTable
  L1_10 = "option2DataHistory"
  L0_9 = L0_9(L1_10)
  L1_10 = 1
  _UPVALUE0_ = L1_10
  L1_10 = 1
  L2_11 = 2
  L3_12 = {}
  for L7_16, L8_17 in L4_13(L5_14) do
    for L12_21, L13_22 in L9_18(L10_19) do
      if L12_21 == "option2DataHistory.time" then
        L3_12[L14_23] = L13_22
        _UPVALUE0_ = L14_23
      end
    end
  end
  if L4_13 > 0 then
    L4_13(L5_14)
    for L7_16, L8_17 in L4_13(L5_14) do
    end
    _UPVALUE1_ = L4_13
    for L10_19, L11_20 in L7_16(L8_17) do
      L12_21 = _UPVALUE1_
      L13_22 = db
      L13_22 = L13_22.getAttribute
      L17_26 = "wan2HistoricData"
      L13_22 = L13_22(L14_23, L15_24, L16_25, L17_26)
      L4_13[L12_21] = L13_22
      L12_21 = ":"
      L13_22 = os
      L13_22 = L13_22.date
      L13_22 = L13_22(L14_23, L15_24)
      for L17_26, L18_27 in L14_23(L15_24) do
        if L17_26 == "hour" then
          L5_14[_UPVALUE1_] = L18_27
        end
        if L17_26 == "min" then
          L5_14[_UPVALUE1_] = L5_14[_UPVALUE1_] .. L12_21 .. L18_27
        end
      end
      _UPVALUE1_ = L14_23
    end
    return L7_16, L8_17, L9_18, L10_19
  else
    return L4_13
  end
end
function option3HistoricalBWUsageGet()
  local L0_28, L1_29, L2_30, L3_31, L4_32, L5_33, L6_34, L7_35
  L0_28 = db
  L0_28 = L0_28.getTable
  L1_29 = "wan3DataHistory"
  L0_28 = L0_28(L1_29)
  L1_29 = {}
  L2_30 = 1
  _UPVALUE0_ = L2_30
  L2_30 = {}
  for L6_34, L7_35 in L3_31(L4_32) do
    for _FORV_11_, _FORV_12_ in pairs(L7_35) do
      if _FORV_11_ == "wan3DataHistory.time" then
        L2_30[_UPVALUE0_] = _FORV_12_
        _UPVALUE0_ = _UPVALUE0_ + 1
      end
    end
  end
  if L3_31 > 0 then
    L3_31(L4_32)
    _UPVALUE1_ = L3_31
    for L7_35, _FORV_8_ in L4_32(L5_33) do
      L3_31[_UPVALUE1_] = {}
      L1_29[_UPVALUE1_] = db.getAttribute("wan3DataHistory", "time", L2_30[_UPVALUE1_], "wan3HistoricData")
      _UPVALUE1_ = _UPVALUE1_ + 1
    end
    return L4_32, L5_33
  else
    return L3_31
  end
end
