local L0_0
L0_0 = module
L0_0("com.teamf1.core.wireless.advancedwireless", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wireless_accessPoints")
L0_0 = require
L0_0("teamf1lualib/dot11_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.wireless.accesspoints")
radioTable = "dot11Radio"
vapTable = "dot11VAP"
profileTable = "dot11Profile"
dot11CardTable = "dot11Card"
multouniTable = "MulToUni"
;({}).beaconInterval = "beaconInterval"
;({}).dtimInterval = "dtimInterval"
;({}).rtsThreshold = "rtsThreshold"
;({}).fragThreshold = "fragThreshold"
;({}).preambleMode = "preambleMode"
;({}).protectionMode = "rtsCtsProtect"
;({}).powerSave = "uapsd"
;({}).vapEnabled = "vapEnabled"
;({}).vapName = "vapName"
;({}).ROW_ID = "_ROWID_"
;({}).profileName = "profileName"
;({}).ssid = "ssid"
;({}).cardNo = "cardNo"
;({}).Enabled = "Enabled"
;({}).radioNo = "radioNo"
;({}).txAntennas = "txAntennas"
;({}).rxAntennas = "rxAntennas"
;({}).ampdu = "ampdu"
function beaconIntervalGet()
  local L0_1, L1_2
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(radioTable, "_ROWID_", "1", _UPVALUE0_.beaconInterval)
  if L1_2 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_2
end
function beaconIntervalGetNext(A0_3)
  local L1_4, L2_5, L3_6
  L3_6 = db
  L3_6 = L3_6.getAttribute
  L3_6 = L3_6(radioTable, "_ROWID_", L2_5, _UPVALUE0_.beaconInterval)
  if L3_6 == nil then
    return _UPVALUE1_.FAILURE, L2_5
  end
  return _UPVALUE1_.SUCCESS, L2_5, L3_6
end
function beaconIntervalSet(A0_7, A1_8)
  local L2_9
  if A1_8 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_8) < 40 or tonumber(A1_8) > 3500 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if status == nil then
    return _UPVALUE0_.FAILURE, A0_7
  end
  return _UPVALUE0_.SUCCESS, A0_7
end
function dtimIntervalGet()
  local L0_10, L1_11
  L1_11 = db
  L1_11 = L1_11.getAttribute
  L1_11 = L1_11(radioTable, "_ROWID_", "1", _UPVALUE0_.dtimInterval)
  if L1_11 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_11
end
function dtimIntervalGetNext(A0_12)
  local L1_13, L2_14, L3_15
  L3_15 = db
  L3_15 = L3_15.getAttribute
  L3_15 = L3_15(radioTable, "_ROWID_", L2_14, _UPVALUE0_.dtimInterval)
  if L3_15 == nil then
    return _UPVALUE1_.FAILURE, L2_14
  end
  return _UPVALUE1_.SUCCESS, L2_14, L3_15
end
function dtimIntervalSet(A0_16, A1_17)
  local L2_18
  if A1_17 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_17) < 1 or tonumber(A1_17) > 255 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if status == nil then
    return _UPVALUE0_.FAILURE, A0_16
  end
  return _UPVALUE0_.SUCCESS, A0_16
end
function rtsThresholdGet()
  local L0_19, L1_20
  L1_20 = db
  L1_20 = L1_20.getAttribute
  L1_20 = L1_20(radioTable, "_ROWID_", "1", _UPVALUE0_.rtsThreshold)
  if L1_20 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_20
end
function rtsThresholdGetNext(A0_21)
  local L1_22, L2_23, L3_24
  L3_24 = db
  L3_24 = L3_24.getAttribute
  L3_24 = L3_24(radioTable, "_ROWID_", L2_23, _UPVALUE0_.rtsThreshold)
  if L3_24 == nil then
    return _UPVALUE1_.FAILURE, L2_23
  end
  return _UPVALUE1_.SUCCESS, L2_23, L3_24
end
function rtsThresholdSet(A0_25, A1_26)
  local L2_27
  if A1_26 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-500AC" then
    if tonumber(A1_26) < 257 or tonumber(A1_26) > 2347 then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
  elseif tonumber(A1_26) < 257 or tonumber(A1_26) > 2346 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if status == nil then
    return _UPVALUE0_.FAILURE, A0_25
  end
  return _UPVALUE0_.SUCCESS, A0_25
end
function fragThresholdGet()
  local L0_28, L1_29
  L1_29 = db
  L1_29 = L1_29.getAttribute
  L1_29 = L1_29(radioTable, "_ROWID_", "1", _UPVALUE0_.fragThreshold)
  if L1_29 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_29
end
function fragThresholdGetNext(A0_30)
  local L1_31, L2_32, L3_33
  L3_33 = db
  L3_33 = L3_33.getAttribute
  L3_33 = L3_33(radioTable, "_ROWID_", L2_32, _UPVALUE0_.fragThreshold)
  if L3_33 == nil then
    return _UPVALUE1_.FAILURE, L2_32
  end
  return _UPVALUE1_.SUCCESS, L2_32, L3_33
end
function fragThresholdSet(A0_34, A1_35)
  local L2_36
  if A1_35 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_35) < 257 or tonumber(A1_35) > 2346 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if status == nil then
    return _UPVALUE0_.FAILURE, A0_34
  end
  return _UPVALUE0_.SUCCESS, A0_34
end
function preambleModeGet()
  local L0_37, L1_38
  L1_38 = db
  L1_38 = L1_38.getAttribute
  L1_38 = L1_38(radioTable, "_ROWID_", "1", _UPVALUE0_.preambleMode)
  if L1_38 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_38
end
function preambleModeGetNext(A0_39)
  local L1_40, L2_41, L3_42
  L3_42 = db
  L3_42 = L3_42.getAttribute
  L3_42 = L3_42(radioTable, "_ROWID_", L2_41, _UPVALUE0_.preambleMode)
  if L3_42 == nil then
    return _UPVALUE1_.FAILURE, L2_41
  end
  return _UPVALUE1_.SUCCESS, L2_41, L3_42
end
function preambleModeSet(A0_43, A1_44)
  local L2_45, L3_46, L4_47
  if A1_44 == nil then
    L3_46 = _UPVALUE0_
    L3_46 = L3_46.INVALID_ARGUMENT
    return L3_46
  end
  if A1_44 ~= "long" and A1_44 ~= "short" then
    L3_46 = _UPVALUE0_
    L3_46 = L3_46.INVALID_ARGUMENT
    return L3_46
  end
  L3_46 = status
  if L3_46 == nil then
    L3_46 = _UPVALUE0_
    L3_46 = L3_46.FAILURE
    L4_47 = A0_43
    return L3_46, L4_47
  end
  L3_46 = _UPVALUE0_
  L3_46 = L3_46.SUCCESS
  L4_47 = A0_43
  return L3_46, L4_47
end
function protectionModeGet()
  local L0_48, L1_49
  L1_49 = db
  L1_49 = L1_49.getAttribute
  L1_49 = L1_49(radioTable, "_ROWID_", "1", _UPVALUE0_.protectionMode)
  if L1_49 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_49
end
function protectionModeGetNext(A0_50)
  local L1_51, L2_52, L3_53
  L3_53 = db
  L3_53 = L3_53.getAttribute
  L3_53 = L3_53(radioTable, "_ROWID_", L2_52, _UPVALUE0_.protectionMode)
  if L3_53 == nil then
    return _UPVALUE1_.FAILURE, L2_52
  end
  return _UPVALUE1_.SUCCESS, L2_52, L3_53
end
function protectionModeSet(A0_54, A1_55)
  local L2_56, L3_57, L4_58
  if A1_55 == nil then
    L3_57 = _UPVALUE0_
    L3_57 = L3_57.INVALID_ARGUMENT
    return L3_57
  end
  if A1_55 ~= "none" and A1_55 ~= "ctsSelf" then
    L3_57 = _UPVALUE0_
    L3_57 = L3_57.INVALID_ARGUMENT
    return L3_57
  end
  L3_57 = status
  if L3_57 == nil then
    L3_57 = _UPVALUE0_
    L3_57 = L3_57.FAILURE
    L4_58 = A0_54
    return L3_57, L4_58
  end
  L3_57 = _UPVALUE0_
  L3_57 = L3_57.SUCCESS
  L4_58 = A0_54
  return L3_57, L4_58
end
function ispowerSaveEnabled()
  local L0_59, L1_60
  L1_60 = db
  L1_60 = L1_60.getAttribute
  L1_60 = L1_60(radioTable, "_ROWID_", "1", _UPVALUE0_.powerSave)
  if L1_60 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_60
end
function ispowerSaveEnabledNext(A0_61)
  local L1_62, L2_63, L3_64
  L3_64 = db
  L3_64 = L3_64.getAttribute
  L3_64 = L3_64(radioTable, "_ROWID_", L2_63, _UPVALUE0_.powerSave)
  if L3_64 == nil then
    return _UPVALUE1_.FAILURE, L2_63
  end
  return _UPVALUE1_.SUCCESS, L2_63, L3_64
end
function powerSaveEnable(A0_65)
  local L1_66, L2_67, L3_68
  L2_67 = status
  if L2_67 == nil then
    L2_67 = _UPVALUE0_
    L2_67 = L2_67.FAILURE
    L3_68 = A0_65
    return L2_67, L3_68
  end
  L2_67 = _UPVALUE0_
  L2_67 = L2_67.SUCCESS
  L3_68 = A0_65
  return L2_67, L3_68
end
function powerSaveDisable(A0_69)
  local L1_70, L2_71, L3_72
  L2_71 = status
  if L2_71 == nil then
    L2_71 = _UPVALUE0_
    L2_71 = L2_71.FAILURE
    L3_72 = A0_69
    return L2_71, L3_72
  end
  L2_71 = _UPVALUE0_
  L2_71 = L2_71.SUCCESS
  L3_72 = A0_69
  return L2_71, L3_72
end
function advancedGroupSettingsGet()
  local L0_73, L1_74, L2_75, L3_76, L4_77, L5_78, L6_79, L7_80, L8_81
  L7_80 = db
  L7_80 = L7_80.getRow
  L8_81 = dot11CardTable
  L7_80 = L7_80(L8_81, _UPVALUE0_.ROW_ID, "1")
  L8_81 = {}
  if L7_80 ~= _UPVALUE1_.NIL then
    L8_81 = db.getRow(radioTable, _UPVALUE0_.cardNo, L7_80[dot11CardTable .. "." .. _UPVALUE0_.cardNo])
  else
    L8_81 = {}
  end
  L0_73 = L8_81[radioTable .. "." .. _UPVALUE0_.beaconInterval]
  L1_74 = L8_81[radioTable .. "." .. _UPVALUE0_.dtimInterval]
  L2_75 = L8_81[radioTable .. "." .. _UPVALUE0_.rtsThreshold]
  L3_76 = L8_81[radioTable .. "." .. _UPVALUE0_.fragThreshold]
  L4_77 = L8_81[radioTable .. "." .. _UPVALUE0_.preambleMode]
  L5_78 = L8_81[radioTable .. "." .. _UPVALUE0_.protectionMode]
  L6_79 = L8_81[radioTable .. "." .. _UPVALUE0_.powerSave]
  return _UPVALUE1_.SUCCESS, 1, L0_73, L1_74, L2_75, L3_76, L4_77, L5_78, L6_79
end
function acAdvancedGroupSettingsGet(A0_82)
  local L1_83, L2_84, L3_85, L4_86, L5_87, L6_88, L7_89, L8_90, L9_91, L10_92
  L1_83 = _UPVALUE0_
  L1_83 = L1_83.NIL
  if A0_82 == L1_83 then
    L1_83 = _UPVALUE0_
    L1_83 = L1_83.INVALID_ARGUMENT
    return L1_83
  end
  L1_83, L2_84, L3_85, L4_86, L5_87, L6_88, L7_89, L8_90, L9_91, L10_92 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  if db.getRow(radioTable, _UPVALUE1_.radioNo, A0_82) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L1_83 = db.getRow(radioTable, _UPVALUE1_.radioNo, A0_82)[radioTable .. "." .. _UPVALUE1_.beaconInterval]
  L2_84 = db.getRow(radioTable, _UPVALUE1_.radioNo, A0_82)[radioTable .. "." .. _UPVALUE1_.dtimInterval]
  L3_85 = db.getRow(radioTable, _UPVALUE1_.radioNo, A0_82)[radioTable .. "." .. _UPVALUE1_.rtsThreshold]
  L4_86 = db.getRow(radioTable, _UPVALUE1_.radioNo, A0_82)[radioTable .. "." .. _UPVALUE1_.fragThreshold]
  L5_87 = db.getRow(radioTable, _UPVALUE1_.radioNo, A0_82)[radioTable .. "." .. _UPVALUE1_.preambleMode]
  L6_88 = db.getRow(radioTable, _UPVALUE1_.radioNo, A0_82)[radioTable .. "." .. _UPVALUE1_.protectionMode]
  L7_89 = db.getRow(radioTable, _UPVALUE1_.radioNo, A0_82)[radioTable .. "." .. _UPVALUE1_.powerSave]
  if db.getRow(_UPVALUE2_, _UPVALUE2_ .. "." .. _UPVALUE1_.radioNo, A0_82) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L8_90 = db.getRow(_UPVALUE2_, _UPVALUE2_ .. "." .. _UPVALUE1_.radioNo, A0_82)[_UPVALUE2_ .. "." .. _UPVALUE1_.txAntennas]
  L9_91 = db.getRow(_UPVALUE2_, _UPVALUE2_ .. "." .. _UPVALUE1_.radioNo, A0_82)[_UPVALUE2_ .. "." .. _UPVALUE1_.rxAntennas]
  L10_92 = db.getRow(_UPVALUE2_, _UPVALUE2_ .. "." .. _UPVALUE1_.radioNo, A0_82)[_UPVALUE2_ .. "." .. _UPVALUE1_.ampdu]
  return _UPVALUE0_.SUCCESS, 1, L1_83, L2_84, L3_85, L4_86, L5_87, L6_88, L7_89, L8_90, L9_91, L10_92
end
function advancedGroupSettingsGetNext(A0_93)
  return _UPVALUE0_.NOT_SUPPORTED
end
function advancedGroupSettingsSet(A0_94, A1_95, A2_96, A3_97, A4_98, A5_99, A6_100, A7_101)
  local L8_102, L9_103, L10_104, L11_105, L12_106, L13_107, L14_108, L15_109, L16_110, L17_111, L18_112, L19_113, L20_114, L21_115
  L8_102 = {}
  L9_103 = nil
  if A1_95 == nil then
    L10_104 = _UPVALUE0_
    L10_104 = L10_104.INVALID_ARGUMENT
    return L10_104
  end
  L10_104 = tonumber
  L11_105 = A1_95
  L10_104 = L10_104(L11_105)
  if L10_104 < 40 or L10_104 > 3500 then
    L11_105 = _UPVALUE0_
    L11_105 = L11_105.INVALID_ARGUMENT
    return L11_105
  end
  L11_105 = radioTable
  L12_106 = "."
  L13_107 = _UPVALUE1_
  L13_107 = L13_107.beaconInterval
  L11_105 = L11_105 .. L12_106 .. L13_107
  L8_102[L11_105] = A1_95
  if A2_96 == nil then
    L11_105 = _UPVALUE0_
    L11_105 = L11_105.INVALID_ARGUMENT
    return L11_105
  end
  L11_105 = tonumber
  L12_106 = A2_96
  L11_105 = L11_105(L12_106)
  if L11_105 < 1 or L11_105 > 255 then
    L12_106 = _UPVALUE0_
    L12_106 = L12_106.INVALID_ARGUMENT
    return L12_106
  end
  L12_106 = radioTable
  L13_107 = "."
  L14_108 = _UPVALUE1_
  L14_108 = L14_108.dtimInterval
  L12_106 = L12_106 .. L13_107 .. L14_108
  L8_102[L12_106] = A2_96
  if A3_97 == nil then
    L12_106 = _UPVALUE0_
    L12_106 = L12_106.INVALID_ARGUMENT
    return L12_106
  end
  L12_106 = tonumber
  L13_107 = A3_97
  L12_106 = L12_106(L13_107)
  if L12_106 < 256 or L12_106 > 2346 then
    L13_107 = _UPVALUE0_
    L13_107 = L13_107.INVALID_ARGUMENT
    return L13_107
  end
  L13_107 = radioTable
  L14_108 = "."
  L15_109 = _UPVALUE1_
  L15_109 = L15_109.rtsThreshold
  L13_107 = L13_107 .. L14_108 .. L15_109
  L8_102[L13_107] = A3_97
  if A4_98 == nil then
    L13_107 = _UPVALUE0_
    L13_107 = L13_107.INVALID_ARGUMENT
    return L13_107
  end
  L13_107 = tonumber
  L14_108 = A4_98
  L13_107 = L13_107(L14_108)
  if L13_107 < 257 or L13_107 > 2346 then
    L14_108 = _UPVALUE0_
    L14_108 = L14_108.INVALID_ARGUMENT
    return L14_108
  end
  L14_108 = radioTable
  L15_109 = "."
  L14_108 = L14_108 .. L15_109 .. L16_110
  L8_102[L14_108] = A4_98
  if A5_99 == nil then
    L14_108 = _UPVALUE0_
    L14_108 = L14_108.INVALID_ARGUMENT
    return L14_108
  end
  if A5_99 ~= "Long" and A5_99 ~= "Short" then
    L14_108 = _UPVALUE0_
    L14_108 = L14_108.INVALID_ARGUMENT
    return L14_108
  end
  L14_108 = radioTable
  L15_109 = "."
  L14_108 = L14_108 .. L15_109 .. L16_110
  L8_102[L14_108] = A5_99
  if A6_100 == nil then
    L14_108 = _UPVALUE0_
    L14_108 = L14_108.INVALID_ARGUMENT
    return L14_108
  end
  if A6_100 ~= "0" and A6_100 ~= "1" then
    L14_108 = _UPVALUE0_
    L14_108 = L14_108.INVALID_ARGUMENT
    return L14_108
  end
  L14_108 = radioTable
  L15_109 = "."
  L14_108 = L14_108 .. L15_109 .. L16_110
  L8_102[L14_108] = A6_100
  if A7_101 == nil then
    L14_108 = _UPVALUE0_
    L14_108 = L14_108.INVALID_ARGUMENT
    return L14_108
  end
  L14_108 = _UPVALUE2_
  L14_108 = L14_108.booleanCheck
  L15_109 = A7_101
  L14_108 = L14_108(L15_109)
  L9_103 = L14_108
  L14_108 = _UPVALUE0_
  L14_108 = L14_108.SUCCESS
  if L9_103 ~= L14_108 then
    L14_108 = _UPVALUE0_
    L14_108 = L14_108.INVALID_ARGUMENT
    return L14_108
  end
  L14_108 = radioTable
  L15_109 = "."
  L14_108 = L14_108 .. L15_109 .. L16_110
  L8_102[L14_108] = A7_101
  L14_108 = db
  L14_108 = L14_108.update
  L15_109 = radioTable
  L14_108 = L14_108(L15_109, L16_110, L17_111)
  if not L14_108 then
    L15_109 = _UPVALUE0_
    L15_109 = L15_109.FAILURE
    return L15_109, L16_110
  end
  L9_103 = true
  L15_109 = db
  L15_109 = L15_109.getTable
  L15_109 = L15_109(L16_110)
  if L16_110 == 0 then
    return L16_110
  else
    for L19_113, L20_114 in L16_110(L17_111) do
      L21_115 = vapTable
      L21_115 = L21_115 .. "." .. _UPVALUE1_.beaconInterval
      L20_114[L21_115] = A1_95
      L21_115 = vapTable
      L21_115 = L21_115 .. "." .. _UPVALUE1_.dtimInterval
      L20_114[L21_115] = A2_96
      L21_115 = vapTable
      L21_115 = L21_115 .. "." .. _UPVALUE1_.rtsThreshold
      L20_114[L21_115] = A3_97
      L21_115 = vapTable
      L21_115 = L21_115 .. "." .. _UPVALUE1_.fragThreshold
      L20_114[L21_115] = A4_98
      L21_115 = vapTable
      L21_115 = L21_115 .. "." .. _UPVALUE1_.preambleMode
      L20_114[L21_115] = A5_99
      L21_115 = vapTable
      L21_115 = L21_115 .. "." .. _UPVALUE1_.protectionMode
      L20_114[L21_115] = A6_100
      L21_115 = vapTable
      L21_115 = L21_115 .. "." .. _UPVALUE1_.powerSave
      L20_114[L21_115] = A7_101
      if L9_103 then
        L21_115 = vapTable
        L21_115 = L21_115 .. "." .. _UPVALUE1_.vapEnabled
        L21_115 = L20_114[L21_115]
        if L21_115 == "1" then
          L21_115 = _UPVALUE3_
          L21_115 = L21_115.vapPortEnableSet
          L21_115 = L21_115(L20_114[vapTable .. "." .. _UPVALUE1_.vapName], false)
          L9_103 = L21_115
        end
      end
      L21_115 = db
      L21_115 = L21_115.update
      L21_115 = L21_115(vapTable, L20_114, L20_114[vapTable .. "." .. _UPVALUE1_.ROW_ID])
      L9_103 = L21_115
      if not L9_103 then
        break
      end
      if L9_103 then
        L21_115 = vapTable
        L21_115 = L21_115 .. "." .. _UPVALUE1_.vapEnabled
        L21_115 = L20_114[L21_115]
        if L21_115 == "1" then
          L21_115 = _UPVALUE3_
          L21_115 = L21_115.vapPortEnableSet
          L21_115 = L21_115(L20_114[vapTable .. "." .. _UPVALUE1_.vapName], true)
          L9_103 = L21_115
        end
      end
      L21_115 = db
      L21_115 = L21_115.getAttribute
      L21_115 = L21_115(profileTable, _UPVALUE1_.profileName, L20_114[vapTable .. "." .. _UPVALUE1_.profileName], _UPVALUE1_.ssid)
      if L9_103 and L20_114[vapTable .. "." .. _UPVALUE1_.vapEnabled] == "1" then
        L9_103 = _UPVALUE3_.vlanPeerSSIDSet(L20_114[vapTable .. "." .. _UPVALUE1_.vapName], L21_115, "BRIDGE")
      end
    end
  end
  if not L9_103 then
    return L16_110
  end
  return L16_110, L17_111
end
function acAdvancedGroupSettingsSet(A0_116, A1_117, A2_118, A3_119, A4_120, A5_121, A6_122, A7_123, A8_124, A9_125, A10_126)
  local L11_127, L12_128, L13_129, L14_130, L15_131, L16_132, L17_133, L18_134, L19_135, L20_136, L21_137, L22_138, L23_139, L24_140, L25_141, L26_142, L27_143, L28_144
  L11_127 = {}
  L12_128 = {}
  L13_129 = nil
  L14_130 = A0_116
  L15_131 = _UPVALUE0_
  L15_131 = L15_131.NIL
  if A0_116 == L15_131 then
    L15_131 = _UPVALUE0_
    L15_131 = L15_131.INVALID_ARGUMENT
    return L15_131
  end
  L15_131 = _UPVALUE1_
  if A0_116 ~= L15_131 then
    L15_131 = _UPVALUE2_
    if A0_116 ~= L15_131 then
      L15_131 = _UPVALUE0_
      L15_131 = L15_131.INVALID_ARGUMENT
      return L15_131
    end
  end
  if A1_117 == nil then
    L15_131 = _UPVALUE0_
    L15_131 = L15_131.INVALID_ARGUMENT
    return L15_131
  end
  L15_131 = tonumber
  L16_132 = A1_117
  L15_131 = L15_131(L16_132)
  if L15_131 < 40 or L15_131 > 3500 then
    L16_132 = _UPVALUE0_
    L16_132 = L16_132.INVALID_ARGUMENT
    return L16_132
  end
  L16_132 = radioTable
  L17_133 = "."
  L18_134 = _UPVALUE3_
  L18_134 = L18_134.beaconInterval
  L16_132 = L16_132 .. L17_133 .. L18_134
  L11_127[L16_132] = A1_117
  if A2_118 == nil then
    L16_132 = _UPVALUE0_
    L16_132 = L16_132.INVALID_ARGUMENT
    return L16_132
  end
  L16_132 = tonumber
  L17_133 = A2_118
  L16_132 = L16_132(L17_133)
  if L16_132 < 1 or L16_132 > 255 then
    L17_133 = _UPVALUE0_
    L17_133 = L17_133.INVALID_ARGUMENT
    return L17_133
  end
  L17_133 = radioTable
  L18_134 = "."
  L19_135 = _UPVALUE3_
  L19_135 = L19_135.dtimInterval
  L17_133 = L17_133 .. L18_134 .. L19_135
  L11_127[L17_133] = A2_118
  if A3_119 == nil then
    L17_133 = _UPVALUE0_
    L17_133 = L17_133.INVALID_ARGUMENT
    return L17_133
  end
  L17_133 = tonumber
  L18_134 = A3_119
  L17_133 = L17_133(L18_134)
  if L17_133 < 256 or L17_133 > 2347 then
    L18_134 = _UPVALUE0_
    L18_134 = L18_134.INVALID_ARGUMENT
    return L18_134
  end
  L18_134 = radioTable
  L19_135 = "."
  L20_136 = _UPVALUE3_
  L20_136 = L20_136.rtsThreshold
  L18_134 = L18_134 .. L19_135 .. L20_136
  L11_127[L18_134] = A3_119
  L18_134 = UNIT_NAME
  if L18_134 ~= "DSR-500AC" and L14_130 ~= 1 and A4_120 == nil then
    L18_134 = _UPVALUE0_
    L18_134 = L18_134.INVALID_ARGUMENT
    return L18_134
  end
  L18_134 = UNIT_NAME
  if L18_134 ~= "DSR-500AC" and L14_130 ~= 1 then
    L18_134 = tonumber
    L19_135 = A4_120
    L18_134 = L18_134(L19_135)
    if L18_134 < 257 or L18_134 > 2346 then
      L19_135 = _UPVALUE0_
      L19_135 = L19_135.INVALID_ARGUMENT
      return L19_135
    else
      L19_135 = radioTable
      L20_136 = "."
      L19_135 = L19_135 .. L20_136 .. L21_137
      L11_127[L19_135] = A4_120
    end
  end
  if A5_121 == nil then
    L18_134 = _UPVALUE0_
    L18_134 = L18_134.INVALID_ARGUMENT
    return L18_134
  end
  if A5_121 ~= "Long" and A5_121 ~= "Short" then
    L18_134 = _UPVALUE0_
    L18_134 = L18_134.INVALID_ARGUMENT
    return L18_134
  end
  L18_134 = radioTable
  L19_135 = "."
  L20_136 = _UPVALUE3_
  L20_136 = L20_136.preambleMode
  L18_134 = L18_134 .. L19_135 .. L20_136
  L11_127[L18_134] = A5_121
  L18_134 = UNIT_NAME
  if L18_134 ~= "DSR-500AC" and L14_130 ~= 1 and A6_122 == nil then
    L18_134 = _UPVALUE0_
    L18_134 = L18_134.INVALID_ARGUMENT
    return L18_134
  end
  L18_134 = UNIT_NAME
  if L18_134 ~= "DSR-500AC" and L14_130 ~= 1 and A6_122 ~= "0" and A6_122 ~= "1" then
    L18_134 = _UPVALUE0_
    L18_134 = L18_134.INVALID_ARGUMENT
    return L18_134
  end
  L18_134 = radioTable
  L19_135 = "."
  L20_136 = _UPVALUE3_
  L20_136 = L20_136.protectionMode
  L18_134 = L18_134 .. L19_135 .. L20_136
  L11_127[L18_134] = A6_122
  if A7_123 == nil then
    L18_134 = _UPVALUE0_
    L18_134 = L18_134.INVALID_ARGUMENT
    return L18_134
  end
  L18_134 = _UPVALUE4_
  L18_134 = L18_134.booleanCheck
  L19_135 = A7_123
  L18_134 = L18_134(L19_135)
  L13_129 = L18_134
  L18_134 = _UPVALUE0_
  L18_134 = L18_134.SUCCESS
  if L13_129 ~= L18_134 then
    L18_134 = _UPVALUE0_
    L18_134 = L18_134.INVALID_ARGUMENT
    return L18_134
  end
  L18_134 = radioTable
  L19_135 = "."
  L20_136 = _UPVALUE3_
  L20_136 = L20_136.powerSave
  L18_134 = L18_134 .. L19_135 .. L20_136
  L11_127[L18_134] = A7_123
  L18_134 = _UPVALUE0_
  L18_134 = L18_134.NIL
  if A10_126 == L18_134 then
    L18_134 = _UPVALUE0_
    L18_134 = L18_134.INVALID_ARGUMENT
    return L18_134
  end
  L18_134 = _UPVALUE4_
  L18_134 = L18_134.booleanCheck
  L19_135 = A10_126
  L18_134 = L18_134(L19_135)
  L13_129 = L18_134
  L18_134 = _UPVALUE0_
  L18_134 = L18_134.SUCCESS
  if L13_129 ~= L18_134 then
    L18_134 = _UPVALUE0_
    L18_134 = L18_134.INVALID_ARGUMENT
    return L18_134
  end
  L18_134 = _UPVALUE5_
  L19_135 = "."
  L20_136 = _UPVALUE3_
  L20_136 = L20_136.ampdu
  L18_134 = L18_134 .. L19_135 .. L20_136
  L12_128[L18_134] = A10_126
  L18_134 = _UPVALUE0_
  L18_134 = L18_134.NIL
  if A9_125 == L18_134 then
    L18_134 = _UPVALUE0_
    L18_134 = L18_134.INVALID_ARGUMENT
    return L18_134
  end
  if A9_125 ~= "0" and A9_125 ~= "1" and A9_125 ~= "2" and A9_125 ~= "3" then
    L18_134 = _UPVALUE0_
    L18_134 = L18_134.INVALID_ARGUMENT
    return L18_134
  end
  L18_134 = _UPVALUE5_
  L19_135 = "."
  L20_136 = _UPVALUE3_
  L20_136 = L20_136.txAntennas
  L18_134 = L18_134 .. L19_135 .. L20_136
  L12_128[L18_134] = A9_125
  L18_134 = _UPVALUE0_
  L18_134 = L18_134.NIL
  if A8_124 == L18_134 then
    L18_134 = _UPVALUE0_
    L18_134 = L18_134.INVALID_ARGUMENT
    return L18_134
  end
  if A8_124 ~= "0" and A8_124 ~= "1" and A8_124 ~= "2" and A8_124 ~= "3" then
    L18_134 = _UPVALUE0_
    L18_134 = L18_134.INVALID_ARGUMENT
    return L18_134
  end
  L18_134 = _UPVALUE5_
  L19_135 = "."
  L20_136 = _UPVALUE3_
  L20_136 = L20_136.rxAntennas
  L18_134 = L18_134 .. L19_135 .. L20_136
  L12_128[L18_134] = A8_124
  L18_134 = db
  L18_134 = L18_134.update
  L19_135 = radioTable
  L20_136 = L11_127
  L18_134 = L18_134(L19_135, L20_136, L21_137)
  if not L18_134 then
    L19_135 = _UPVALUE0_
    L19_135 = L19_135.FAILURE
    L20_136 = A0_116
    return L19_135, L20_136
  end
  L19_135 = db
  L19_135 = L19_135.update
  L20_136 = _UPVALUE5_
  L19_135 = L19_135(L20_136, L21_137, L22_138)
  if not L19_135 then
    L20_136 = _UPVALUE0_
    L20_136 = L20_136.FAILURE
    return L20_136, L21_137
  end
  L13_129 = true
  L20_136 = db
  L20_136 = L20_136.getRowsWhere
  L24_140 = "%'"
  L20_136 = L20_136(L21_137, L22_138)
  if L21_137 == 0 then
    return L21_137
  else
    for L24_140, L25_141 in L21_137(L22_138) do
      L26_142 = vapTable
      L27_143 = "."
      L28_144 = _UPVALUE3_
      L28_144 = L28_144.beaconInterval
      L26_142 = L26_142 .. L27_143 .. L28_144
      L25_141[L26_142] = A1_117
      L26_142 = vapTable
      L27_143 = "."
      L28_144 = _UPVALUE3_
      L28_144 = L28_144.dtimInterval
      L26_142 = L26_142 .. L27_143 .. L28_144
      L25_141[L26_142] = A2_118
      L26_142 = vapTable
      L27_143 = "."
      L28_144 = _UPVALUE3_
      L28_144 = L28_144.rtsThreshold
      L26_142 = L26_142 .. L27_143 .. L28_144
      L25_141[L26_142] = A3_119
      L26_142 = vapTable
      L27_143 = "."
      L28_144 = _UPVALUE3_
      L28_144 = L28_144.fragThreshold
      L26_142 = L26_142 .. L27_143 .. L28_144
      L25_141[L26_142] = A4_120
      L26_142 = vapTable
      L27_143 = "."
      L28_144 = _UPVALUE3_
      L28_144 = L28_144.preambleMode
      L26_142 = L26_142 .. L27_143 .. L28_144
      L25_141[L26_142] = A5_121
      L26_142 = vapTable
      L27_143 = "."
      L28_144 = _UPVALUE3_
      L28_144 = L28_144.protectionMode
      L26_142 = L26_142 .. L27_143 .. L28_144
      L25_141[L26_142] = A6_122
      L26_142 = vapTable
      L27_143 = "."
      L28_144 = _UPVALUE3_
      L28_144 = L28_144.powerSave
      L26_142 = L26_142 .. L27_143 .. L28_144
      L25_141[L26_142] = A7_123
      if L13_129 then
        L26_142 = vapTable
        L27_143 = "."
        L28_144 = _UPVALUE3_
        L28_144 = L28_144.vapEnabled
        L26_142 = L26_142 .. L27_143 .. L28_144
        L26_142 = L25_141[L26_142]
        if L26_142 == "1" then
          L26_142 = _UPVALUE6_
          L26_142 = L26_142.vapPortEnableSet
          L27_143 = vapTable
          L28_144 = "."
          L27_143 = L27_143 .. L28_144 .. _UPVALUE3_.vapName
          L27_143 = L25_141[L27_143]
          L28_144 = false
          L26_142 = L26_142(L27_143, L28_144)
          L13_129 = L26_142
        end
      end
      L26_142, L27_143 = nil, nil
      L28_144 = db
      L28_144 = L28_144.update
      L26_142, L27_143, L28_144 = vapTable, L25_141, L28_144(vapTable, L25_141, L25_141[vapTable .. "." .. _UPVALUE3_.ROW_ID])
      L13_129 = L28_144
      if not L13_129 then
        break
      end
      if L27_143 == "NOUPDATES" then
        L28_144 = vapTable
        L28_144 = L28_144 .. "." .. _UPVALUE3_.vapEnabled
        L28_144 = L25_141[L28_144]
        if L28_144 == "1" then
          L28_144 = db
          L28_144 = L28_144.setAttribute
          L28_144 = L28_144(vapTable, _UPVALUE3_.ROW_ID, L25_141[vapTable .. "." .. _UPVALUE3_.ROW_ID], _UPVALUE3_.vapEnabled, 1)
          L13_129 = L28_144
        end
      end
      if L13_129 then
        L28_144 = vapTable
        L28_144 = L28_144 .. "." .. _UPVALUE3_.vapEnabled
        L28_144 = L25_141[L28_144]
        if L28_144 == "1" then
          L28_144 = _UPVALUE6_
          L28_144 = L28_144.vapPortEnableSet
          L28_144 = L28_144(L25_141[vapTable .. "." .. _UPVALUE3_.vapName], true)
          L13_129 = L28_144
        end
      end
      L28_144 = db
      L28_144 = L28_144.getAttribute
      L28_144 = L28_144(profileTable, _UPVALUE3_.profileName, L25_141[vapTable .. "." .. _UPVALUE3_.profileName], _UPVALUE3_.ssid)
      if L13_129 and L25_141[vapTable .. "." .. _UPVALUE3_.vapEnabled] == "1" then
        L13_129 = _UPVALUE6_.vlanPeerSSIDSet(L25_141[vapTable .. "." .. _UPVALUE3_.vapName], L28_144, "BRIDGE")
      end
    end
  end
  if not L13_129 then
    return L21_137
  end
  return L21_137, L22_138
end
function advancedGroupSettingsCreate(A0_145, A1_146, A2_147, A3_148, A4_149, A5_150, A6_151)
  return _UPVALUE0_.NOT_SUPPORTED
end
function advancedGroupSettingsDelete(A0_152)
  return _UPVALUE0_.NOT_SUPPORTED
end
function multiToUnicastSettingsGet(A0_153)
  local L1_154
  L1_154 = db.getAttribute(multouniTable, "_ROWID_", A0_153, _UPVALUE0_.Enabled)
  if L1_154 == NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_154
end
function multiToUnicastSettingsGetNext(A0_155)
  return _UPVALUE0_.NOT_SUPPORTED
end
function multiToUnicastSettingsSet(A0_156, A1_157)
  local L2_158, L3_159
  L2_158 = {}
  L3_159 = nil
  if A1_157 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L3_159 = _UPVALUE1_.booleanCheck(A1_157)
  if L3_159 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_158[multouniTable .. "." .. _UPVALUE2_.Enabled] = A1_157
  if not db.update(multouniTable, L2_158, A0_156) then
    return _UPVALUE0_.FAILURE, A0_156
  end
  L3_159 = true
  if not L3_159 then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_156
end
function multiToUnicastSettingsDelete(A0_160)
  return _UPVALUE0_.NOT_SUPPORTED
end
