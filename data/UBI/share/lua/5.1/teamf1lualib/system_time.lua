local L0_0
L0_0 = module
L0_0("com.teamf1.core.system.time", package.seeall)
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
L0_0("teamf1lualib/time_returnCodes")
L0_0 = require
L0_0("timeLib")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.time.returnCodes")
ENABLE = "1"
DISABLE = "0"
timeTable = "ntp"
attribute = {}
attribute.key = "_ROWID_"
attribute.keyvalue = "1"
attribute.currentTime = "currentTime"
attribute.timezone = "timezone"
attribute.dayligtSavings = "autoDaylight"
attribute.useNtp = "enabled"
attribute.reSyncInterval = "reSyncNtpVal"
attribute.useDefaultNtpServers = "useDefServers"
attribute.primaryNtpServer = "server1"
attribute.backupNtpServer = "server2"
manualTime = {}
manualTime.tableName = "manualTime"
manualTime.timeZone = "Timezone"
manualTime.manualTimeStatus = "ManualTimeStatus"
manualTime.dayligtSavings = "AutoDaylight"
function currentTimeGet()
  local L0_1, L1_2
  L0_1 = os
  L0_1 = L0_1.time
  L0_1 = L0_1()
  L1_2 = os
  L1_2 = L1_2.date
  L1_2 = L1_2("%a %b %d %H:%M:%S %Z %Y", L0_1)
  if L1_2 == nil then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, 1, L1_2
end
function currentTimeGetNext(A0_3)
  local L2_4, L3_5
  L2_4 = _UPVALUE0_
  L2_4 = L2_4.NOT_SUPPORTED
  L3_5 = rowId
  return L2_4, L3_5, currentTime
end
function currentTimeSet(A0_6, A1_7)
  local L2_8, L3_9, L4_10, L5_11
  if A1_7 == nil then
    L5_11 = _UPVALUE0_
    L5_11 = L5_11.INVALID_ARGUMENT
    return L5_11
  end
  L5_11 = isUseNtpEnabled
  L2_8, L4_10, L5_11 = nil, nil, L5_11()
  L3_9 = L5_11
  L5_11 = DISABLE
  if L4_10 == L5_11 then
    L5_11 = nil
    L5_11 = db.getAttribute(manualTime.tableName, attribute.key, attribute.keyvalue, manualTime.timeZone)
    dayligtSavings = db.getAttribute(manualTime.tableName, attribute.key, attribute.keyvalue, manualTime.dayligtSavings)
    status = deviceTimeSet(A1_7, L5_11, dayligtSavings)
    if status == nil then
      return _UPVALUE0_.FAILURE, A0_6
    end
  end
  L5_11 = _UPVALUE0_
  L5_11 = L5_11.SUCCESS
  return L5_11, A0_6
end
function timezoneGet()
  local L0_12, L1_13, L2_14, L3_15
  L2_14, L0_12, L3_15 = isUseNtpEnabled()
  if L3_15 == ENABLE then
    L1_13 = db.getAttribute(timeTable, attribute.key, attribute.keyvalue, attribute.timezone)
  else
    L1_13 = db.getAttribute(manualTime.tableName, attribute.key, attribute.keyvalue, manualTime.timeZone)
  end
  if L1_13 == nil then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, 1, L1_13
end
function timezoneGetNext(A0_16)
  local L2_17, L3_18
  L2_17 = _UPVALUE0_
  L2_17 = L2_17.NOT_SUPPORTED
  L3_18 = rowId
  return L2_17, L3_18, timezone
end
function timezoneSet(A0_19, A1_20)
  local L2_21, L3_22, L4_23, L5_24
  if A1_20 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_20) < 0 or tonumber(A1_20) > 91 then
    return INVALID_RANGE
  end
  L4_23, L2_21, L5_24 = isUseNtpEnabled()
  if L5_24 == ENABLE then
    L3_22 = db.setAttribute(timeTable, attribute.key, attribute.keyvalue, attribute.timezone, A1_20)
  else
    L3_22 = db.setAttribute(manualTime.tableName, attribute.key, attribute.keyvalue, manualTime.timeZone, A1_20)
  end
  if L3_22 == nil then
    return _UPVALUE0_.FAILURE, A0_19
  end
  return _UPVALUE0_.SUCCESS, A0_19
end
function isdayligtSavingsEnabled()
  local L0_25, L1_26, L2_27, L3_28
  L2_27, L0_25, L3_28 = isUseNtpEnabled()
  if L3_28 == ENABLE then
    L1_26 = db.getAttribute(timeTable, attribute.key, attribute.keyvalue, attribute.dayligtSavings)
  else
    L1_26 = db.getAttribute(manualTime.tableName, attribute.key, attribute.keyvalue, manualTime.dayligtSavings)
  end
  if L1_26 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L1_26
end
function isdayligtSavingsEnabledNext(A0_29)
  local L2_30, L3_31
  L2_30 = _UPVALUE0_
  L2_30 = L2_30.NOT_SUPPORTED
  L3_31 = rowId
  return L2_30, L3_31, daylightSavings
end
function dayligtSavingsEnable(A0_32)
  local L1_33, L2_34, L3_35, L4_36
  L3_35, L1_33, L4_36 = isUseNtpEnabled()
  if L4_36 == ENABLE then
    L2_34 = db.setAttribute(timeTable, attribute.key, attribute.keyvalue, attribute.dayligtSavings, ENABLE)
  else
    L2_34 = db.setAttribute(manualTime.tableName, attribute.key, attribute.keyvalue, manualTime.dayligtSavings, ENABLE)
  end
  if L2_34 == nil then
    return _UPVALUE0_.FAILURE, A0_32
  end
  return _UPVALUE0_.SUCCESS, A0_32
end
function dayligtSavingsDisable(A0_37)
  local L1_38, L2_39, L3_40, L4_41
  L3_40, L1_38, L4_41 = isUseNtpEnabled()
  if L4_41 == ENABLE then
    L2_39 = db.setAttribute(timeTable, attribute.key, attribute.keyvalue, attribute.dayligtSavings, DISABLE)
  else
    L2_39 = db.setAttribute(manualTime.tableName, attribute.key, attribute.keyvalue, manualTime.dayligtSavings, DISABLE)
  end
  if L2_39 == nil then
    return _UPVALUE0_.FAILURE, A0_37
  end
  return _UPVALUE0_.SUCCESS, A0_37
end
function isUseNtpEnabled()
  local L0_42, L1_43
  L1_43 = db
  L1_43 = L1_43.getAttribute
  L1_43 = L1_43(timeTable, attribute.key, attribute.keyvalue, attribute.useNtp)
  if L1_43 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L1_43
end
function isuseNtpEnabledNext(A0_44)
  local L2_45, L3_46
  L2_45 = _UPVALUE0_
  L2_45 = L2_45.NOT_SUPPORTED
  L3_46 = rowId
  return L2_45, L3_46, useNtp
end
function useNtpEnable(A0_47)
  local L1_48, L2_49
  L2_49 = db.setAttribute(timeTable, attribute.key, attribute.keyvalue, attribute.useNtp, ENABLE)
  if L2_49 == nil then
    return _UPVALUE0_.FAILURE, A0_47
  end
  L2_49 = db.setAttribute(manualTime.tableName, attribute.key, attribute.keyvalue, manualTime.manualTimeStatus, DISABLE)
  if L2_49 == nil then
    return _UPVALUE0_.FAILURE, A0_47
  end
  return _UPVALUE0_.SUCCESS, A0_47
end
function useNtpDisable(A0_50)
  local L1_51, L2_52
  L2_52 = db.setAttribute(timeTable, attribute.key, attribute.keyvalue, attribute.useNtp, DISABLE)
  if L2_52 == nil then
    return _UPVALUE0_.FAILURE, A0_50
  end
  L2_52 = db.setAttribute(manualTime.tableName, attribute.key, attribute.keyvalue, manualTime.manualTimeStatus, ENABLE)
  if L2_52 == nil then
    return _UPVALUE0_.FAILURE, A0_50
  end
  return _UPVALUE0_.SUCCESS, A0_50
end
function reSyncIntervalGet()
  local L0_53, L1_54
  L1_54 = db
  L1_54 = L1_54.getAttribute
  L1_54 = L1_54(timeTable, attribute.key, attribute.keyvalue, attribute.reSyncInterval)
  if L1_54 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L1_54
end
function reSyncIntervalGetNext(A0_55)
  local L2_56, L3_57
  L2_56 = _UPVALUE0_
  L2_56 = L2_56.NOT_SUPPORTED
  L3_57 = rowId
  return L2_56, L3_57, reSyncInterval
end
function reSyncIntervalSet(A0_58, A1_59)
  local L2_60
  if A1_59 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_59) < 5 or tonumber(A1_59) > 1440 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  errorStr, L2_60, ntpEnabled = isUseNtpEnabled()
  if ntpEnabled == ENABLE then
    if db.setAttribute(timeTable, attribute.key, attribute.keyvalue, attribute.reSyncInterval, A1_59) == nil then
      return _UPVALUE0_.FAILURE, A0_58
    end
  else
    return _UPVALUE0_.FAILURE, A0_58
  end
  return _UPVALUE0_.SUCCESS, A0_58
end
function ntpUseDefServConfGet()
  local L0_61
  L0_61 = db.getAttribute(timeTable, attribute.key, attribute.keyvalue, attribute.useDefaultNtpServers)
  return L0_61
end
function isNtpDefaultEnabled()
  if ntpUseDefServConfGet() == ENABLE then
    return _UPVALUE0_.TRUE
  else
    return _UPVALUE0_.FALSE
  end
end
function isUseDefaultNtpServersEnabled()
  local L0_62, L1_63
  L1_63 = db
  L1_63 = L1_63.getAttribute
  L1_63 = L1_63(timeTable, attribute.key, attribute.keyvalue, attribute.useDefaultNtpServers)
  if L1_63 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L1_63
end
function isuseDefaultNtpServersEnabledNext(A0_64)
  local L2_65, L3_66
  L2_65 = _UPVALUE0_
  L2_65 = L2_65.NOT_SUPPORTED
  L3_66 = rowId
  return L2_65, L3_66, useDefaultNtpServers
end
function useDefaultNtpServersEnable(A0_67)
  local L1_68
  if db.setAttribute(timeTable, attribute.key, attribute.keyvalue, attribute.useDefaultNtpServers, ENABLE) == nil then
    return _UPVALUE0_.FAILURE, A0_67
  end
  return _UPVALUE0_.SUCCESS, A0_67
end
function useDefaultNtpServersDisable(A0_69)
  local L1_70
  if db.setAttribute(timeTable, attribute.key, attribute.keyvalue, attribute.useDefaultNtpServers, DISABLE) == nil then
    return _UPVALUE0_.FAILURE, A0_69
  end
  return _UPVALUE0_.SUCCESS, A0_69
end
function primaryNtpServerGet()
  local L0_71, L1_72
  L1_72 = db
  L1_72 = L1_72.getAttribute
  L1_72 = L1_72(timeTable, attribute.key, attribute.keyvalue, attribute.primaryNtpServer)
  if L1_72 == nil then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, 1, L1_72
end
function primaryNtpServerGetNext(A0_73)
  local L2_74, L3_75
  L2_74 = _UPVALUE0_
  L2_74 = L2_74.NOT_SUPPORTED
  L3_75 = rowId
  return L2_74, L3_75, primaryNtpServer
end
function primaryNtpServerSet(A0_76, A1_77)
  local L2_78, L3_79, L4_80, L5_81, L6_82
  if A1_77 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_78 = _UPVALUE1_.fqdnCheck(A1_77)
  if L2_78 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L3_79, L2_78, L4_80 = isUseNtpEnabled()
  if L4_80 == ENABLE then
    L3_79, L2_78, L5_81 = isUseDefaultNtpServersEnabled()
    if L5_81 == DISABLE then
      L6_82 = db.setAttribute(timeTable, attribute.key, attribute.keyvalue, attribute.primaryNtpServer, A1_77)
    else
      return _UPVALUE0_.FAILURE, A0_76
    end
  end
  if L6_82 == nil then
    return _UPVALUE0_.FAILURE, A0_76
  end
  return _UPVALUE0_.SUCCESS, A0_76
end
function backupNtpServerGet()
  local L0_83, L1_84
  L1_84 = db
  L1_84 = L1_84.getAttribute
  L1_84 = L1_84(timeTable, attribute.key, attribute.keyvalue, attribute.backupNtpServer)
  if L1_84 == nil then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, 1, L1_84
end
function backupNtpServerGetNext(A0_85)
  local L2_86, L3_87
  L2_86 = _UPVALUE0_
  L2_86 = L2_86.NOT_SUPPORTED
  L3_87 = rowId
  return L2_86, L3_87, backupNtpServer
end
function backupNtpServerSet(A0_88, A1_89)
  local L2_90, L3_91, L4_92, L5_93, L6_94
  if A1_89 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT, A0_88
  end
  L2_90 = _UPVALUE1_.fqdnCheck(A1_89)
  if L2_90 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L4_92, L2_90, L5_93 = isUseNtpEnabled()
  if L5_93 == ENABLE then
    L4_92, L2_90, L6_94 = isUseDefaultNtpServersEnabled()
    if L6_94 == DISABLE then
      L3_91 = db.setAttribute(timeTable, attribute.key, attribute.keyvalue, attribute.backupNtpServer, A1_89)
    else
      return _UPVALUE0_.FAILURE, A0_88
    end
  end
  if L3_91 == nil then
    return _UPVALUE0_.FAILURE, A0_88
  end
  return _UPVALUE0_.SUCCESS, A0_88
end
function ClockGet()
  local L0_95, L1_96, L2_97, L3_98, L4_99, L5_100, L6_101, L7_102, L8_103, L9_104, L10_105, L11_106, L12_107
  L4_99 = currentTimeGet
  L6_101 = L4_99()
  L2_97 = L6_101
  L0_95 = L5_100
  L1_96 = L4_99
  L4_99 = _UPVALUE0_
  L4_99 = L4_99.SUCCESS
  if L1_96 ~= L4_99 then
    L4_99 = _UPVALUE0_
    L4_99 = L4_99.INVALID_ARGUMENT
    return L4_99
  end
  if L2_97 == nil then
    L4_99 = _UPVALUE0_
    L4_99 = L4_99.FAILURE
    L5_100 = cookie
    return L4_99, L5_100
  end
  L4_99 = {}
  L5_100 = db
  L5_100 = L5_100.getRow
  L6_101 = timeTable
  L7_102 = attribute
  L7_102 = L7_102.key
  L8_103 = attribute
  L8_103 = L8_103.keyvalue
  L5_100 = L5_100(L6_101, L7_102, L8_103)
  L4_99 = L5_100
  if L4_99 == nil then
    L5_100 = _UPVALUE0_
    L5_100 = L5_100.FAILURE
    return L5_100
  end
  L5_100 = {}
  L6_101 = db
  L6_101 = L6_101.getRow
  L7_102 = manualTime
  L7_102 = L7_102.tableName
  L8_103 = attribute
  L8_103 = L8_103.key
  L9_104 = attribute
  L9_104 = L9_104.keyvalue
  L6_101 = L6_101(L7_102, L8_103, L9_104)
  L5_100 = L6_101
  if L5_100 == nil then
    L6_101 = _UPVALUE0_
    L6_101 = L6_101.FAILURE
    return L6_101
  end
  L6_101, L7_102, L8_103, L9_104, L10_105, L11_106, L12_107 = nil, nil, nil, nil, nil, nil, nil
  L8_103 = L4_99[timeTable .. "." .. attribute.useNtp]
  L1_96, L0_95, L3_98 = isUseNtpEnabled()
  if L3_98 == ENABLE then
    L6_101 = L4_99[timeTable .. "." .. attribute.timezone]
    L7_102 = L4_99[timeTable .. "." .. attribute.dayligtSavings]
  else
    L6_101 = L5_100[manualTime.tableName .. "." .. manualTime.timeZone]
    L7_102 = L5_100[manualTime.tableName .. "." .. manualTime.dayligtSavings]
  end
  L9_104 = L4_99[timeTable .. "." .. attribute.reSyncInterval]
  L10_105 = L4_99[timeTable .. "." .. attribute.useDefaultNtpServers]
  L11_106 = L4_99[timeTable .. "." .. attribute.primaryNtpServer]
  L12_107 = L4_99[timeTable .. "." .. attribute.backupNtpServer]
  if L6_101 == nil or L7_102 == nil or L8_103 == nil or L9_104 == nil or L10_105 == nil or L11_106 == nil or L12_107 == nil then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, 1, L2_97, L6_101, L7_102, L8_103, L9_104, L10_105, L11_106, L12_107
end
function ClockGetNext(A0_108)
  local L2_109, L3_110
  L2_109 = _UPVALUE0_
  L2_109 = L2_109.NOT_SUPPORTED
  L3_110 = rowId
  return L2_109, L3_110, clock
end
function ClockSet(A0_111, A1_112, A2_113, A3_114, A4_115, A5_116, A6_117, A7_118, A8_119)
  local L9_120, L10_121, L11_122, L12_123, L13_124, L14_125, L15_126, L16_127, L17_128, L18_129, L19_130, L20_131, L21_132, L22_133, L23_134, L24_135, L25_136, L26_137, L27_138, L28_139, L29_140, L30_141, L31_142, L32_143, L33_144, L34_145, L35_146, L36_147
  L9_120 = {}
  L10_121 = {}
  L11_122, L12_123, L13_124, L14_125 = nil, nil, nil, nil
  if A2_113 == nil then
    L15_126 = _UPVALUE0_
    L15_126 = L15_126.INVALID_ARGUMENT
    return L15_126
  end
  if A3_114 == nil then
    L15_126 = _UPVALUE0_
    L15_126 = L15_126.INVALID_ARGUMENT
    return L15_126
  end
  L15_126 = _UPVALUE1_
  L15_126 = L15_126.isBoolean
  L16_127 = A3_114
  L15_126 = L15_126(L16_127)
  L11_122 = L15_126
  L15_126 = _UPVALUE0_
  L15_126 = L15_126.SUCCESS
  if L11_122 ~= L15_126 then
    L15_126 = _UPVALUE0_
    L15_126 = L15_126.INVALID_ARGUMENT
    return L15_126
  end
  if A4_115 == nil then
    L15_126 = _UPVALUE0_
    L15_126 = L15_126.INVALID_ARGUMENT
    return L15_126
  end
  L15_126 = _UPVALUE1_
  L15_126 = L15_126.isBoolean
  L16_127 = A4_115
  L15_126 = L15_126(L16_127)
  L11_122 = L15_126
  L15_126 = _UPVALUE0_
  L15_126 = L15_126.SUCCESS
  if L11_122 ~= L15_126 then
    L15_126 = _UPVALUE0_
    L15_126 = L15_126.INVALID_ARGUMENT
    return L15_126
  end
  L15_126 = timeTable
  L16_127 = "."
  L17_128 = attribute
  L17_128 = L17_128.useNtp
  L15_126 = L15_126 .. L16_127 .. L17_128
  L9_120[L15_126] = A4_115
  if A4_115 == "1" then
    if A5_116 ~= nil then
      L15_126 = tonumber
      L16_127 = A5_116
      L15_126 = L15_126(L16_127)
      if L15_126 < 5 or L15_126 > 1440 then
        L16_127 = _UPVALUE2_
        L16_127 = L16_127.TIME_SYNC_INTERVAL_INVALID
        return L16_127
      end
    end
    if A6_117 == nil then
      L15_126 = _UPVALUE0_
      L15_126 = L15_126.INVALID_ARGUMENT
      return L15_126
    end
    L15_126 = _UPVALUE1_
    L15_126 = L15_126.isBoolean
    L16_127 = A6_117
    L15_126 = L15_126(L16_127)
    L11_122 = L15_126
    L15_126 = _UPVALUE0_
    L15_126 = L15_126.SUCCESS
    if L11_122 ~= L15_126 then
      L15_126 = _UPVALUE0_
      L15_126 = L15_126.INVALID_ARGUMENT
      return L15_126
    end
    if A6_117 == "0" then
      if A7_118 == nil then
        L15_126 = _UPVALUE0_
        L15_126 = L15_126.INVALID_ARGUMENT
        return L15_126
      end
      L15_126 = _UPVALUE1_
      L15_126 = L15_126.fqdnCheck
      L16_127 = A7_118
      L15_126 = L15_126(L16_127)
      L11_122 = L15_126
      L15_126 = _UPVALUE0_
      L15_126 = L15_126.SUCCESS
      if L11_122 ~= L15_126 then
        L15_126 = _UPVALUE2_
        L15_126 = L15_126.TIME_PRIMAY_NTP_SERVER_INVALID
        return L15_126
      end
      if A8_119 == nil then
        L15_126 = _UPVALUE0_
        L15_126 = L15_126.INVALID_ARGUMENT
        return L15_126
      end
      L15_126 = _UPVALUE1_
      L15_126 = L15_126.fqdnCheck
      L16_127 = A8_119
      L15_126 = L15_126(L16_127)
      L11_122 = L15_126
      L15_126 = _UPVALUE0_
      L15_126 = L15_126.SUCCESS
      if L11_122 ~= L15_126 then
        L15_126 = _UPVALUE2_
        L15_126 = L15_126.TIME_BACKUP_NTP_SERVER_INVALID
        return L15_126
      end
      L15_126 = timeTable
      L16_127 = "."
      L17_128 = attribute
      L17_128 = L17_128.primaryNtpServer
      L15_126 = L15_126 .. L16_127 .. L17_128
      L9_120[L15_126] = A7_118
      L15_126 = timeTable
      L16_127 = "."
      L17_128 = attribute
      L17_128 = L17_128.backupNtpServer
      L15_126 = L15_126 .. L16_127 .. L17_128
      L9_120[L15_126] = A8_119
    end
    L15_126 = timeTable
    L16_127 = "."
    L17_128 = attribute
    L17_128 = L17_128.reSyncInterval
    L15_126 = L15_126 .. L16_127 .. L17_128
    L9_120[L15_126] = A5_116
    L15_126 = timeTable
    L16_127 = "."
    L17_128 = attribute
    L17_128 = L17_128.useDefaultNtpServers
    L15_126 = L15_126 .. L16_127 .. L17_128
    L9_120[L15_126] = A6_117
    L15_126 = timeTable
    L16_127 = "."
    L17_128 = attribute
    L17_128 = L17_128.timezone
    L15_126 = L15_126 .. L16_127 .. L17_128
    L9_120[L15_126] = A2_113
    L15_126 = timeTable
    L16_127 = "."
    L17_128 = attribute
    L17_128 = L17_128.dayligtSavings
    L15_126 = L15_126 .. L16_127 .. L17_128
    L9_120[L15_126] = A3_114
  else
    if A1_112 == nil then
      L15_126 = _UPVALUE0_
      L15_126 = L15_126.INVALID_ARGUMENT
      return L15_126
    end
    L15_126 = deviceTimeSet
    L16_127 = A1_112
    L17_128 = A2_113
    L18_129 = A3_114
    L15_126 = L15_126(L16_127, L17_128, L18_129)
    L16_127 = manualTime
    L16_127 = L16_127.tableName
    L17_128 = "."
    L18_129 = manualTime
    L18_129 = L18_129.dayligtSavings
    L16_127 = L16_127 .. L17_128 .. L18_129
    L10_121[L16_127] = A3_114
    L16_127 = manualTime
    L16_127 = L16_127.tableName
    L17_128 = "."
    L18_129 = manualTime
    L18_129 = L18_129.manualTimeStatus
    L16_127 = L16_127 .. L17_128 .. L18_129
    L17_128 = ENABLE
    L10_121[L16_127] = L17_128
  end
  L15_126 = db
  L15_126 = L15_126.update
  L16_127 = timeTable
  L17_128 = L9_120
  L18_129 = attribute
  L18_129 = L18_129.keyvalue
  L15_126 = L15_126(L16_127, L17_128, L18_129)
  L14_125 = L15_126
  if L14_125 == nil then
    L15_126 = _UPVALUE0_
    L15_126 = L15_126.FAILURE
    L16_127 = A0_111
    return L15_126, L16_127
  end
  L15_126 = manualTime
  L15_126 = L15_126.tableName
  L16_127 = "."
  L17_128 = manualTime
  L17_128 = L17_128.timeZone
  L15_126 = L15_126 .. L16_127 .. L17_128
  L10_121[L15_126] = A2_113
  L15_126 = db
  L15_126 = L15_126.update
  L16_127 = manualTime
  L16_127 = L16_127.tableName
  L17_128 = L10_121
  L18_129 = attribute
  L18_129 = L18_129.keyvalue
  L15_126 = L15_126(L16_127, L17_128, L18_129)
  L14_125 = L15_126
  if L14_125 == nil then
    L15_126 = _UPVALUE0_
    L15_126 = L15_126.FAILURE
    L16_127 = A0_111
    return L15_126, L16_127
  end
  L15_126 = db
  L15_126 = L15_126.getRowsWhere
  L16_127 = "crontab"
  L17_128 = "command like '%stopStartVapInstance.sh 1%'"
  L18_129 = false
  L15_126 = L15_126(L16_127, L17_128, L18_129)
  if L15_126 ~= nil then
    L16_127 = tonumber
    L17_128 = os
    L17_128 = L17_128.date
    L18_129 = "%H"
    L36_147 = L17_128(L18_129)
    L16_127 = L16_127(L17_128, L18_129, L19_130, L20_131, L21_132, L22_133, L23_134, L24_135, L25_136, L26_137, L27_138, L28_139, L29_140, L30_141, L31_142, L32_143, L33_144, L34_145, L35_146, L36_147, L17_128(L18_129))
    L17_128 = tonumber
    L18_129 = os
    L18_129 = L18_129.date
    L36_147 = L18_129(L19_130)
    L17_128 = L17_128(L18_129, L19_130, L20_131, L21_132, L22_133, L23_134, L24_135, L25_136, L26_137, L27_138, L28_139, L29_140, L30_141, L31_142, L32_143, L33_144, L34_145, L35_146, L36_147, L18_129(L19_130))
    L18_129 = tonumber
    L18_129 = L18_129(L19_130)
    for L22_133, L23_134 in L19_130(L20_131) do
      L24_135 = L15_126[L22_133]
      L24_135 = L24_135["crontab.command"]
      L25_136 = tonumber
      L26_137 = L15_126[L22_133]
      L26_137 = L26_137["crontab.hour"]
      L25_136 = L25_136(L26_137)
      L26_137 = tonumber
      L27_138 = L15_126[L22_133]
      L27_138 = L27_138["crontab.minute"]
      L26_137 = L26_137(L27_138)
      L27_138 = L24_135
      L28_139 = " | /usr/bin/cut -d\" \" -f3"
      L27_138 = L27_138 .. L28_139
      L28_139 = os
      L28_139 = L28_139.execute
      L29_140 = "echo "
      L30_141 = L27_138
      L31_142 = " > /tmp/apname"
      L29_140 = L29_140 .. L30_141 .. L31_142
      L28_139 = L28_139(L29_140)
      L29_140 = io
      L29_140 = L29_140.open
      L30_141 = "/tmp/apname"
      L31_142 = "r"
      L29_140 = L29_140(L30_141, L31_142)
      L30_141 = nil
      if L29_140 ~= nil then
        L32_143 = L29_140
        L31_142 = L29_140.read
        L31_142 = L31_142(L32_143)
        L30_141 = L31_142
      end
      if L30_141 ~= nil then
        L31_142 = "/pfrm2.0/bin/stopStartVapInstance.sh 0 "
        L32_143 = L30_141
        L31_142 = L31_142 .. L32_143
        L32_143 = tonumber
        L33_144 = db
        L33_144 = L33_144.getAttribute
        L34_145 = "crontab"
        L35_146 = "command"
        L36_147 = L31_142
        L36_147 = L33_144(L34_145, L35_146, L36_147, "hour")
        L32_143 = L32_143(L33_144, L34_145, L35_146, L36_147, L33_144(L34_145, L35_146, L36_147, "hour"))
        L33_144 = tonumber
        L34_145 = db
        L34_145 = L34_145.getAttribute
        L35_146 = "crontab"
        L36_147 = "command"
        L36_147 = L34_145(L35_146, L36_147, L31_142, "minute")
        L33_144 = L33_144(L34_145, L35_146, L36_147, L34_145(L35_146, L36_147, L31_142, "minute"))
        L34_145 = tonumber
        L35_146 = L25_136 * 60
        L35_146 = L35_146 + L26_137
        L34_145 = L34_145(L35_146)
        L35_146 = tonumber
        L36_147 = L32_143 * 60
        L36_147 = L36_147 + L33_144
        L35_146 = L35_146(L36_147)
        L36_147 = db
        L36_147 = L36_147.getAttribute
        L36_147 = L36_147("dot11VAP", "vapName", L30_141, "_ROWID_")
        if L18_129 > L34_145 and L18_129 < L35_146 then
          db.setAttribute("dot11VAP", "vapName", L30_141, "vapEnabled", "1")
          _UPVALUE3_.vapEnableSet(L36_147, true)
        else
          db.setAttribute("dot11VAP", "vapName", L30_141, "vapEnabled", "0")
          _UPVALUE3_.vapEnableSet(L36_147, false)
        end
      end
    end
  end
  L16_127 = _UPVALUE0_
  L16_127 = L16_127.SUCCESS
  L17_128 = A0_111
  return L16_127, L17_128
end
function ClockCreate(A0_148, A1_149, A2_150, A3_151, A4_152, A5_153, A6_154, A7_155)
  local L9_156
  L9_156 = _UPVALUE0_
  L9_156 = L9_156.NOT_SUPPORTED
  return L9_156, rowId
end
function ClockDelete(A0_157)
  local L2_158
  L2_158 = _UPVALUE0_
  L2_158 = L2_158.NOT_SUPPORTED
  return L2_158, A0_157
end
function deviceTimeSet(A0_159, A1_160, A2_161)
  local L3_162, L4_163, L5_164, L6_165, L7_166, L8_167, L9_168, L10_169, L11_170
  L3_162 = util
  L3_162 = L3_162.split
  L4_163 = A0_159
  L5_164 = " "
  L3_162 = L3_162(L4_163, L5_164)
  L4_163 = util
  L4_163 = L4_163.split
  L5_164 = L3_162[1]
  L6_165 = "/"
  L4_163 = L4_163(L5_164, L6_165)
  L5_164 = L4_163[3]
  L6_165 = L4_163[1]
  L7_166 = L4_163[2]
  L8_167 = util
  L8_167 = L8_167.split
  L9_168 = L3_162[2]
  L10_169 = ":"
  L8_167 = L8_167(L9_168, L10_169)
  L9_168 = L8_167[1]
  L10_169 = L8_167[2]
  L11_170 = "00"
  if L3_162[3] == "PM" then
    if tonumber(L9_168) ~= 12 then
      L9_168 = tonumber(L9_168) + 12
    end
  elseif tonumber(L9_168) == 12 then
    L9_168 = tonumber(L9_168) - 12
  end
  if tonumber(L6_165) > 12 then
    return _UPVALUE0_.ERROR
  end
  timeLib.logManualTime(1)
  if UNIT_NAME == "DSR-250N" or UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-150N" or UNIT_NAME == "DSR-150" or PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-500_Bx" then
  else
  end
  stat = os.execute("/pfrm2.0/bin/setRtcTime" .. " " .. "1" .. " " .. L7_166 .. " " .. L6_165 .. " " .. L5_164 .. " " .. L9_168 .. " " .. L10_169 .. " " .. L11_170 .. " " .. A1_160 .. " " .. A2_161)
  timeLib.logManualTime(2)
  return stat
end
