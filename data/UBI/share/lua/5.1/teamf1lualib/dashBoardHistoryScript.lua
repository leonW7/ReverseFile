local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35, L36_36, L37_37, L38_38, L39_39, L40_40, L41_41, L42_42, L43_43, L44_44, L45_45, L46_46, L47_47, L48_48, L49_49, L50_50, L51_51, L52_52
L0_0 = require
L1_1 = "teamf1lualib/db"
L0_0(L1_1)
L0_0 = "/tmp/system.db"
DB_FILE_NAME = L0_0
L0_0 = db
L0_0 = L0_0.connect
L1_1 = DB_FILE_NAME
L0_0(L1_1)
L0_0 = 2
L1_1 = 1
L2_2 = 1048576
L3_3 = "/proc/net/dev"
L4_4 = 3
L5_5 = 6
L6_6 = "eth1"
L7_7 = db
L7_7 = L7_7.getAttribute
L8_8 = "unitInfo"
L9_9 = "_ROWID_"
L10_10 = "1"
L11_11 = "modelId"
L7_7 = L7_7(L8_8, L9_9, L10_10, L11_11)
L7_7 = L7_7 or ""
L8_8 = db
L8_8 = L8_8.getAttribute
L9_9 = "unitInfo"
L10_10 = "_ROWID_"
L11_11 = "1"
L12_12 = "hardwareVersion"
L8_8 = L8_8(L9_9, L10_10, L11_11, L12_12)
L8_8 = L8_8 or ""
L9_9 = db
L9_9 = L9_9.getAttribute
L10_10 = "hwFamilyInfo"
L11_11 = "_ROWID_"
L12_12 = "1"
L13_13 = "hwFamilyName"
L9_9 = L9_9(L10_10, L11_11, L12_12, L13_13)
L10_10 = L7_7
L11_11 = "_"
L12_12 = L9_9
L10_10 = L10_10 .. L11_11 .. L12_12
L11_11 = "eth2"
L12_12 = "ppp3"
if "DSR-1000AC_Ax" == L10_10 or "DSR-500AC_Ax" == L10_10 or "DSR-1000_Bx" == L10_10 or "DSR-500_Bx" == L10_10 then
  L11_11 = "eth0"
elseif L7_7 == "DSR-1000N" or L7_7 == "DSR-1000" or L7_7 == "DSR-500N" or L7_7 == "DSR-500" then
  L11_11 = "eth2"
else
  L11_11 = "eth0.4093"
end
L13_13 = 2
L14_14 = 10
L15_15 = 20
L16_16 = 1
L17_17, L18_18, L19_19, L20_20, L21_21, L22_22 = nil, nil, nil, nil, nil, nil
L22_22 = 0
L18_18 = 0
L23_23 = false
L24_24 = false
L25_25 = {}
L26_26 = {}
L27_27 = {}
L28_28 = {}
L29_29 = 1
L30_30 = {}
L31_31 = {}
L32_32 = {}
L33_33 = io
L33_33 = L33_33.open
L33_33 = L33_33(L34_34, L35_35)
if L33_33 then
  repeat
    L19_19 = L34_34
    if nil ~= L19_19 and "" ~= L19_19 then
      if L34_34 == L6_6 then
        for L37_37 in L34_34(L35_35, L36_36) do
          L25_25[L29_29] = L37_37
          L29_29 = L29_29 + L16_16
        end
        if L34_34 > 5 then
          L25_25[L13_13] = L34_34
          L25_25[L14_14] = L34_34
        end
        L17_17 = L34_34 + L35_35
        L17_17 = L17_17 / L2_2
      end
      if L34_34 == L11_11 then
        for L40_40 in L37_37(L38_38, L39_39) do
          L35_35[L36_36] = L40_40
        end
        if L37_37 > 5 then
          L35_35[L13_13] = L37_37
          L35_35[L14_14] = L37_37
        end
        L18_18 = L37_37 + L38_38
        L18_18 = L18_18 / L2_2
      end
      if L34_34 == L12_12 then
        for L40_40 in L37_37(L38_38, L39_39) do
          L35_35[L36_36] = L40_40
        end
        if L37_37 > 5 then
          L35_35[L13_13] = L37_37
          L35_35[L14_14] = L37_37
        end
        L22_22 = L37_37 + L38_38
        L22_22 = L22_22 / L2_2
      end
    end
  until nil == L19_19
end
L21_21 = L35_35
for L40_40, L41_41 in L37_37(L38_38) do
  for L45_45, L46_46 in L42_42(L43_43) do
    if L45_45 == "option1DataHistory.time" then
      L30_30[L36_36] = L46_46
    end
  end
end
for L42_42, L43_43 in L39_39(L40_40) do
  for L47_47, L48_48 in L44_44(L45_45) do
    if L47_47 == "option2DataHistory.time" then
      L31_31[L38_38] = L48_48
    end
  end
end
for L44_44, L45_45 in L41_41(L42_42) do
  for L49_49, L50_50 in L46_46(L47_47) do
    if L49_49 == "wan3DataHistory.time" then
      L32_32[L40_40] = L50_50
    end
  end
end
L41_41(L42_42)
L41_41(L42_42)
L41_41(L42_42)
if L47_47 > 0 then
  if L47_47 <= L48_48 then
    L49_49 = "time"
    L50_50 = L30_30[L41_41]
    L51_51 = "wan1Data"
    L49_49 = "option2DataHistory"
    L50_50 = "time"
    L51_51 = L31_31[L42_42]
    L52_52 = "wan2Data"
    L49_49 = db
    L49_49 = L49_49.getAttribute
    L50_50 = "wan3DataHistory"
    L51_51 = "time"
    L52_52 = L32_32[L41_41]
    L49_49 = L49_49(L50_50, L51_51, L52_52, "wan3Data")
    L26_26["option1DataHistory.wan1Data"] = L17_17
    L27_27["option2DataHistory.wan2Data"] = L18_18
    L28_28["wan3DataHistory.wan3Data"] = L22_22
    L26_26["option1DataHistory.wan1HistoricData"] = L44_44
    L27_27["option2DataHistory.wan2HistoricData"] = L45_45
    L28_28["wan3DataHistory.wan3HistoricData"] = L46_46
  end
elseif L47_47 == 0 then
  L26_26["option1DataHistory.wan1Data"] = L17_17
  L26_26["option1DataHistory.wan1HistoricData"] = L17_17
  L27_27["option2DataHistory.wan2Data"] = L18_18
  L27_27["option2DataHistory.wan2HistoricData"] = L18_18
  L27_27["wan3DataHistory.wan3Data"] = L22_22
  L27_27["wan3DataHistory.wan3HistoricData"] = L22_22
elseif L15_15 <= L47_47 then
  L49_49 = "time"
  L50_50 = L30_30[L41_41]
  L51_51 = "wan1Data"
  L49_49 = "option2DataHistory"
  L50_50 = "time"
  L51_51 = L31_31[L42_42]
  L52_52 = "wan2Data"
  L49_49 = db
  L49_49 = L49_49.getAttribute
  L50_50 = "wan3DataHistory"
  L51_51 = "time"
  L52_52 = L32_32[L42_42]
  L49_49 = L49_49(L50_50, L51_51, L52_52, "wan3Data")
  L50_50 = L30_30[L1_1]
  L51_51 = L31_31[L1_1]
  L52_52 = L32_32[L1_1]
  db.beginTransaction()
  L23_23 = db.deleteRow("option1DataHistory", "time", L50_50)
  L24_24 = db.deleteRow("option2DataHistory", "time", L51_51)
  L24_24 = db.deleteRow("wan3DataHistory", "time", L52_52)
  if L23_23 and L24_24 then
    db.commitTransaction(true)
  else
    db.rollback()
  end
  L23_23 = false
  L24_24 = false
  L26_26["option1DataHistory.wan1Data"] = L17_17
  L26_26["option1DataHistory.wan1HistoricData"] = L44_44
  L27_27["option2DataHistory.wan2Data"] = L18_18
  L27_27["option2DataHistory.wan2HistoricData"] = L45_45
  L28_28["wan3DataHistory.wan3Data"] = L22_22
  L28_28["wan3DataHistory.wan3HistoricData"] = L46_46
end
L26_26["option1DataHistory.time"] = L21_21
L27_27["option2DataHistory.time"] = L21_21
L28_28["wan3DataHistory.time"] = L21_21
if L47_47 < 0 then
  L28_28["wan3DataHistory.wan3Data"] = "0.00"
end
if L47_47 < 0 then
  L28_28["wan3DataHistory.wan3HistoricData"] = "0.00"
end
L47_47()
L49_49 = L26_26
L23_23 = L47_47
L49_49 = L27_27
L24_24 = L47_47
L49_49 = L28_28
L24_24 = L47_47
if L23_23 and L24_24 then
  L47_47(L48_48)
else
  L47_47()
  L23_23 = false
  L24_24 = false
end
