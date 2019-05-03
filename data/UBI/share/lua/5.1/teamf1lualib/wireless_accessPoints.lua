local L0_0
L0_0 = module
L0_0("com.teamf1.core.wireless.accesspoints", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/dot11_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
accesspointsTable = "dot11VAP"
radioTable = "dot11Radio"
crontabTable = "crontab"
dot11InterfaceTable = "dot11Interface"
profileTable = "dot11Profile"
portMgmtTable = "VlanPortMgmt"
radionTable = "dot11Radio11n"
dot11ACLTable = "dot11ACL"
bridgePortsTable = "bridgePorts"
dot11WPSTable = "dot11WPS"
vlanTable = "vlan"
;({}).apName = "vapName"
;({}).vapEnabled = "vapEnabled"
;({}).profileName = "profileName"
;({}).activeTime = "activeTime"
;({}).scheduleControl = "scheduleControl"
;({}).startHour = "startHour"
;({}).startMinute = "startMinute"
;({}).startMeridian = "startMeridian"
;({}).stopHour = "stopHour"
;({}).stopMinute = "stopMinute"
;({}).stopMeridian = "stopMeridian"
;({}).wlanPartition = "apIsolation"
;({}).beaconInterval = "beaconInterval"
;({}).dtimInterval = "dtimInterval"
;({}).rtsThreshold = "rtsThreshold"
;({}).fragThreshold = "fragThreshold"
;({}).preambleMode = "preambleMode"
;({}).rtsCtsProtect = "rtsCtsProtect"
;({}).uapsd = "uapsd"
;({}).txPower = "txPower"
;({}).shortRetry = "shortRetry"
;({}).longRetry = "longRetry"
;({}).radioList = "radioList"
;({}).unit = "unit"
;({}).hour = "hour"
;({}).minute = "minute"
;({}).interval = "interval"
;({}).dayOfMonth = "dayOfMonth"
;({}).month = "month"
;({}).dayOfWeek = "dayOfWeek"
;({}).command = "command"
;({}).txRate = "txRate"
;({}).puren = "puren"
;({}).ssid = "ssid"
;({}).broadcastSSID = "broadcastSSID"
;({}).interfaceName = "interfaceName"
;({}).ROW_ID = "_ROWID_"
;({}).macAddress = "macAddress"
;({}).bridge = "BRIDGE"
;({}).vapDisabled = "VAP-DISABLED"
;({}).portEnabled = "portEnabled"
;({}).wpsEnabled = "wpsEnabled"
;({}).vlanId = "vlanId"
;({}).wdsEnabled = "wdsEnabled"
;({}).radioMode = "radioMode"
;({}).band = "band"
function apNameGet(A0_1)
  local L1_2, L2_3
  L2_3 = db
  L2_3 = L2_3.getAttribute
  L2_3 = L2_3(accesspointsTable, _UPVALUE0_.ROW_ID, A0_1, _UPVALUE0_.apName)
  if L2_3 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, A0_1, L2_3
end
function apNameGetNext(A0_4)
  local L1_5, L2_6, L3_7
  L3_7 = db
  L3_7 = L3_7.getAttribute
  L3_7 = L3_7(accesspointsTable, _UPVALUE0_.ROW_ID, L2_6, _UPVALUE0_.apName)
  if L3_7 == nil then
    return _UPVALUE1_.FAILURE, L2_6
  end
  return _UPVALUE1_.SUCCESS, L2_6, L3_7
end
function apNameSet(A0_8, A1_9)
  local L2_10, L3_11, L4_12
  if A1_9 == nil then
    L3_11 = _UPVALUE0_
    L3_11 = L3_11.INVALID_ARGUMENT
    return L3_11
  end
  L3_11 = status
  if L3_11 == nil then
    L3_11 = _UPVALUE0_
    L3_11 = L3_11.FAILURE
    L4_12 = A0_8
    return L3_11, L4_12
  end
  L3_11 = _UPVALUE0_
  L3_11 = L3_11.SUCCESS
  L4_12 = A0_8
  return L3_11, L4_12
end
function apNameDelete(A0_13, A1_14)
  local L2_15, L3_16, L4_17
  L3_16 = status
  if L3_16 == nil then
    L3_16 = _UPVALUE0_
    L3_16 = L3_16.FAILURE
    L4_17 = A0_13
    return L3_16, L4_17
  end
  L3_16 = _UPVALUE0_
  L3_16 = L3_16.SUCCESS
  L4_17 = A0_13
  return L3_16, L4_17
end
function profileNameGet()
  local L0_18, L1_19
  L1_19 = db
  L1_19 = L1_19.getAttribute
  L1_19 = L1_19(accesspointsTable, _UPVALUE0_.ROW_ID, "1", _UPVALUE0_.profileName)
  if L1_19 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_19
end
function profileNameGetNext(A0_20)
  local L1_21, L2_22, L3_23
  L3_23 = db
  L3_23 = L3_23.getAttribute
  L3_23 = L3_23(accesspointsTable, _UPVALUE0_.ROW_ID, L2_22, _UPVALUE0_.profileName)
  if L3_23 == nil then
    return _UPVALUE1_.FAILURE, L2_22
  end
  return _UPVALUE1_.SUCCESS, L2_22, L3_23
end
function profileNameSet(A0_24, A1_25)
  local L2_26, L3_27, L4_28
  if A1_25 == nil then
    L3_27 = _UPVALUE0_
    L3_27 = L3_27.INVALID_ARGUMENT
    return L3_27
  end
  L3_27 = status
  if L3_27 == nil then
    L3_27 = _UPVALUE0_
    L3_27 = L3_27.FAILURE
    L4_28 = A0_24
    return L3_27, L4_28
  end
  L3_27 = _UPVALUE0_
  L3_27 = L3_27.SUCCESS
  L4_28 = A0_24
  return L3_27, L4_28
end
function isactiveTimeEnabled()
  local L0_29, L1_30
  L1_30 = db
  L1_30 = L1_30.getAttribute
  L1_30 = L1_30(accesspointsTable, _UPVALUE0_.ROW_ID, "1", _UPVALUE0_.activeTime)
  if L1_30 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_30
end
function isactiveTimeEnabledNext(A0_31)
  local L1_32, L2_33, L3_34
  L3_34 = db
  L3_34 = L3_34.getAttribute
  L3_34 = L3_34(accesspointsTable, _UPVALUE0_.ROW_ID, L2_33, _UPVALUE0_.activeTime)
  if L3_34 == nil then
    return _UPVALUE1_.FAILURE, L2_33
  end
  return _UPVALUE1_.SUCCESS, L2_33, L3_34
end
function activeTimeEnable(A0_35)
  local L1_36, L2_37, L3_38
  L2_37 = status
  if L2_37 == nil then
    L2_37 = _UPVALUE0_
    L2_37 = L2_37.FAILURE
    L3_38 = A0_35
    return L2_37, L3_38
  end
  L2_37 = _UPVALUE0_
  L2_37 = L2_37.SUCCESS
  L3_38 = A0_35
  return L2_37, L3_38
end
function activeTimeDisable(A0_39)
  local L1_40, L2_41, L3_42
  L2_41 = status
  if L2_41 == nil then
    L2_41 = _UPVALUE0_
    L2_41 = L2_41.FAILURE
    L3_42 = A0_39
    return L2_41, L3_42
  end
  L2_41 = _UPVALUE0_
  L2_41 = L2_41.SUCCESS
  L3_42 = A0_39
  return L2_41, L3_42
end
function isscheduleControlEnabled()
  local L0_43, L1_44
  L1_44 = db
  L1_44 = L1_44.getAttribute
  L1_44 = L1_44(accesspointsTable, _UPVALUE0_.ROW_ID, "1", _UPVALUE0_.scheduleControl)
  if L1_44 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_44
end
function isscheduleControlEnabledNext(A0_45)
  local L1_46, L2_47, L3_48
  L3_48 = db
  L3_48 = L3_48.getAttribute
  L3_48 = L3_48(accesspointsTable, _UPVALUE0_.ROW_ID, L2_47, _UPVALUE0_.scheduleControl)
  if L3_48 == nil then
    return _UPVALUE1_.FAILURE, L2_47
  end
  return _UPVALUE1_.SUCCESS, L2_47, L3_48
end
function scheduleControlEnable(A0_49)
  local L1_50, L2_51, L3_52
  L2_51 = status
  if L2_51 == nil then
    L2_51 = _UPVALUE0_
    L2_51 = L2_51.FAILURE
    L3_52 = A0_49
    return L2_51, L3_52
  end
  L2_51 = _UPVALUE0_
  L2_51 = L2_51.SUCCESS
  L3_52 = A0_49
  return L2_51, L3_52
end
function scheduleControlDisable(A0_53)
  local L1_54, L2_55, L3_56
  L2_55 = status
  if L2_55 == nil then
    L2_55 = _UPVALUE0_
    L2_55 = L2_55.FAILURE
    L3_56 = A0_53
    return L2_55, L3_56
  end
  L2_55 = _UPVALUE0_
  L2_55 = L2_55.SUCCESS
  L3_56 = A0_53
  return L2_55, L3_56
end
function startHourGet()
  local L0_57, L1_58
  L1_58 = db
  L1_58 = L1_58.getAttribute
  L1_58 = L1_58(accesspointsTable, _UPVALUE0_.ROW_ID, "1", _UPVALUE0_.startHour)
  if L1_58 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_58
end
function startHourGetNext(A0_59)
  local L1_60, L2_61, L3_62
  L3_62 = db
  L3_62 = L3_62.getAttribute
  L3_62 = L3_62(accesspointsTable, _UPVALUE0_.ROW_ID, L2_61, _UPVALUE0_.startHour)
  if L3_62 == nil then
    return _UPVALUE1_.FAILURE, L2_61
  end
  return _UPVALUE1_.SUCCESS, L2_61, L3_62
end
function startHourSet(A0_63, A1_64)
  local L2_65, L3_66, L4_67
  if A1_64 == nil then
    L3_66 = _UPVALUE0_
    L3_66 = L3_66.INVALID_ARGUMENT
    return L3_66
  end
  L3_66 = status
  if L3_66 == nil then
    L3_66 = _UPVALUE0_
    L3_66 = L3_66.FAILURE
    L4_67 = A0_63
    return L3_66, L4_67
  end
  L3_66 = _UPVALUE0_
  L3_66 = L3_66.SUCCESS
  L4_67 = A0_63
  return L3_66, L4_67
end
function startMinuteGet()
  local L0_68, L1_69
  L1_69 = db
  L1_69 = L1_69.getAttribute
  L1_69 = L1_69(accesspointsTable, _UPVALUE0_.ROW_ID, "1", _UPVALUE0_.startMinute)
  if L1_69 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_69
end
function startMinuteGetNext(A0_70)
  local L1_71, L2_72, L3_73
  L3_73 = db
  L3_73 = L3_73.getAttribute
  L3_73 = L3_73(accesspointsTable, _UPVALUE0_.ROW_ID, L2_72, _UPVALUE0_.startMinute)
  if L3_73 == nil then
    return _UPVALUE1_.FAILURE, L2_72
  end
  return _UPVALUE1_.SUCCESS, L2_72, L3_73
end
function startMinuteSet(A0_74, A1_75)
  local L2_76, L3_77, L4_78
  if A1_75 == nil then
    L3_77 = _UPVALUE0_
    L3_77 = L3_77.INVALID_ARGUMENT
    return L3_77
  end
  L3_77 = status
  if L3_77 == nil then
    L3_77 = _UPVALUE0_
    L3_77 = L3_77.FAILURE
    L4_78 = A0_74
    return L3_77, L4_78
  end
  L3_77 = _UPVALUE0_
  L3_77 = L3_77.SUCCESS
  L4_78 = A0_74
  return L3_77, L4_78
end
function startMeridianGet()
  local L0_79, L1_80
  L1_80 = db
  L1_80 = L1_80.getAttribute
  L1_80 = L1_80(accesspointsTable, _UPVALUE0_.ROW_ID, "1", _UPVALUE0_.startMeridian)
  if L1_80 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_80
end
function startMeridianGetNext(A0_81)
  local L1_82, L2_83, L3_84
  L3_84 = db
  L3_84 = L3_84.getAttribute
  L3_84 = L3_84(accesspointsTable, _UPVALUE0_.ROW_ID, L2_83, _UPVALUE0_.startMeridian)
  if L3_84 == nil then
    return _UPVALUE1_.FAILURE, L2_83
  end
  return _UPVALUE1_.SUCCESS, L2_83, L3_84
end
function startMeridianSet(A0_85, A1_86)
  local L2_87, L3_88, L4_89
  if A1_86 == nil then
    L3_88 = _UPVALUE0_
    L3_88 = L3_88.INVALID_ARGUMENT
    return L3_88
  end
  L3_88 = status
  if L3_88 == nil then
    L3_88 = _UPVALUE0_
    L3_88 = L3_88.FAILURE
    L4_89 = A0_85
    return L3_88, L4_89
  end
  L3_88 = _UPVALUE0_
  L3_88 = L3_88.SUCCESS
  L4_89 = A0_85
  return L3_88, L4_89
end
function stopHourGet()
  local L0_90, L1_91
  L1_91 = db
  L1_91 = L1_91.getAttribute
  L1_91 = L1_91(accesspointsTable, _UPVALUE0_.ROW_ID, "1", _UPVALUE0_.stopHour)
  if L1_91 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_91
end
function stopHourGetNext(A0_92)
  local L1_93, L2_94, L3_95
  L3_95 = db
  L3_95 = L3_95.getAttribute
  L3_95 = L3_95(accesspointsTable, _UPVALUE0_.ROW_ID, L2_94, _UPVALUE0_.stopHour)
  if L3_95 == nil then
    return _UPVALUE1_.FAILURE, L2_94
  end
  return _UPVALUE1_.SUCCESS, L2_94, L3_95
end
function stopHourSet(A0_96, A1_97)
  local L2_98, L3_99, L4_100
  if A1_97 == nil then
    L3_99 = _UPVALUE0_
    L3_99 = L3_99.INVALID_ARGUMENT
    return L3_99
  end
  L3_99 = status
  if L3_99 == nil then
    L3_99 = _UPVALUE0_
    L3_99 = L3_99.FAILURE
    L4_100 = A0_96
    return L3_99, L4_100
  end
  L3_99 = _UPVALUE0_
  L3_99 = L3_99.SUCCESS
  L4_100 = A0_96
  return L3_99, L4_100
end
function stopMinuteGet()
  local L0_101, L1_102
  L1_102 = db
  L1_102 = L1_102.getAttribute
  L1_102 = L1_102(accesspointsTable, _UPVALUE0_.ROW_ID, "1", _UPVALUE0_.stopMinute)
  if L1_102 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_102
end
function stopMinuteGetNext(A0_103)
  local L1_104, L2_105, L3_106
  L3_106 = db
  L3_106 = L3_106.getAttribute
  L3_106 = L3_106(accesspointsTable, _UPVALUE0_.ROW_ID, L2_105, _UPVALUE0_.stopMinute)
  if L3_106 == nil then
    return _UPVALUE1_.FAILURE, L2_105
  end
  return _UPVALUE1_.SUCCESS, L2_105, L3_106
end
function stopMinuteSet(A0_107, A1_108)
  local L2_109, L3_110, L4_111
  if A1_108 == nil then
    L3_110 = _UPVALUE0_
    L3_110 = L3_110.INVALID_ARGUMENT
    return L3_110
  end
  L3_110 = status
  if L3_110 == nil then
    L3_110 = _UPVALUE0_
    L3_110 = L3_110.FAILURE
    L4_111 = A0_107
    return L3_110, L4_111
  end
  L3_110 = _UPVALUE0_
  L3_110 = L3_110.SUCCESS
  L4_111 = A0_107
  return L3_110, L4_111
end
function stopMeridianGet()
  local L0_112, L1_113
  L1_113 = db
  L1_113 = L1_113.getAttribute
  L1_113 = L1_113(accesspointsTable, _UPVALUE0_.ROW_ID, "1", _UPVALUE0_.stopMeridian)
  if L1_113 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_113
end
function stopMeridianGetNext(A0_114)
  local L1_115, L2_116, L3_117
  L3_117 = db
  L3_117 = L3_117.getAttribute
  L3_117 = L3_117(accesspointsTable, _UPVALUE0_.ROW_ID, L2_116, _UPVALUE0_.stopMeridian)
  if L3_117 == nil then
    return _UPVALUE1_.FAILURE, L2_116
  end
  return _UPVALUE1_.SUCCESS, L2_116, L3_117
end
function stopMeridianSet(A0_118, A1_119)
  local L2_120, L3_121, L4_122
  if A1_119 == nil then
    L3_121 = _UPVALUE0_
    L3_121 = L3_121.INVALID_ARGUMENT
    return L3_121
  end
  L3_121 = status
  if L3_121 == nil then
    L3_121 = _UPVALUE0_
    L3_121 = L3_121.FAILURE
    L4_122 = A0_118
    return L3_121, L4_122
  end
  L3_121 = _UPVALUE0_
  L3_121 = L3_121.SUCCESS
  L4_122 = A0_118
  return L3_121, L4_122
end
function accessPointGet()
  local L0_123, L1_124, L2_125, L3_126, L4_127, L5_128, L6_129, L7_130, L8_131, L9_132, L10_133, L11_134, L12_135, L13_136, L14_137
  L0_123 = db
  L0_123 = L0_123.getNextRowId
  L1_124 = FIRST_COOKIE
  L2_125 = accesspointsTable
  L0_123 = L0_123(L1_124, L2_125)
  L1_124, L2_125, L3_126, L4_127, L5_128, L6_129, L7_130, L8_131, L9_132, L10_133, L11_134 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L12_135 = db
  L12_135 = L12_135.getRow
  L13_136 = accesspointsTable
  L14_137 = _UPVALUE0_
  L14_137 = L14_137.ROW_ID
  L12_135 = L12_135(L13_136, L14_137, L0_123)
  L13_136 = db
  L13_136 = L13_136.getAttribute
  L14_137 = accesspointsTable
  L13_136 = L13_136(L14_137, _UPVALUE0_.ROW_ID, L0_123, _UPVALUE0_.apName)
  L13_136 = L13_136 or ""
  L14_137 = "/pfrm2.0/bin/stopStartVapInstance.sh %d %s"
  if db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_136 .. "'")[1] == nil then
    ({})[crontabTable .. "." .. _UPVALUE0_.startHour] = ""
    ;({})[crontabTable .. "." .. _UPVALUE0_.startMinute] = ""
    ;({})[crontabTable .. "." .. _UPVALUE0_.startMeridian] = ""
    ;({})[crontabTable .. "." .. _UPVALUE0_.unit] = "0"
  else
    if db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_136 .. "'")[1][crontabTable .. "." .. _UPVALUE0_.command] == string.format(L14_137, 1, L13_136) then
      ({})[crontabTable .. "." .. _UPVALUE0_.scheduleControl] = "0"
    else
      ({})[crontabTable .. "." .. _UPVALUE0_.scheduleControl] = "1"
    end
    ;({})[crontabTable .. "." .. _UPVALUE0_.unit] = db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_136 .. "'")[1][crontabTable .. "." .. _UPVALUE0_.unit]
    if tonumber(db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_136 .. "'")[1][crontabTable .. "." .. _UPVALUE0_.hour]) == 0 then
      ({})[crontabTable .. "." .. _UPVALUE0_.startMeridian] = "0"
      ;({})[crontabTable .. "." .. _UPVALUE0_.startHour] = "12"
    elseif tonumber(db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_136 .. "'")[1][crontabTable .. "." .. _UPVALUE0_.hour]) > 12 then
      ({})[crontabTable .. "." .. _UPVALUE0_.startMeridian] = "1"
      ;({})[crontabTable .. "." .. _UPVALUE0_.startHour] = tonumber(db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_136 .. "'")[1][crontabTable .. "." .. _UPVALUE0_.hour]) - 12
    elseif tonumber(db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_136 .. "'")[1][crontabTable .. "." .. _UPVALUE0_.hour]) == 12 then
      ({})[crontabTable .. "." .. _UPVALUE0_.startMeridian] = "1"
      ;({})[crontabTable .. "." .. _UPVALUE0_.startHour] = "12"
    else
      ({})[crontabTable .. "." .. _UPVALUE0_.startHour] = db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_136 .. "'")[1][crontabTable .. "." .. _UPVALUE0_.hour]
      ;({})[crontabTable .. "." .. _UPVALUE0_.startMeridian] = "0"
    end
    ;({})[crontabTable .. "." .. _UPVALUE0_.startMinute] = db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_136 .. "'")[1][crontabTable .. "." .. _UPVALUE0_.minute]
  end
  if db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_136 .. "'")[2] == nil then
    ({})[crontabTable .. "." .. _UPVALUE0_.stopHour] = ""
    ;({})[crontabTable .. "." .. _UPVALUE0_.stopMinute] = ""
    ;({})[crontabTable .. "." .. _UPVALUE0_.stopMeridian] = ""
    ;({})[crontabTable .. "." .. _UPVALUE0_.unit] = "0"
  else
    ({})[crontabTable .. "." .. _UPVALUE0_.unit] = db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_136 .. "'")[2][crontabTable .. "." .. _UPVALUE0_.unit]
    if tonumber(db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_136 .. "'")[2][crontabTable .. "." .. _UPVALUE0_.hour]) == 0 then
      ({})[crontabTable .. "." .. _UPVALUE0_.stopMeridian] = "0"
      ;({})[crontabTable .. "." .. _UPVALUE0_.stopHour] = "12"
    elseif tonumber(db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_136 .. "'")[2][crontabTable .. "." .. _UPVALUE0_.hour]) > 12 then
      ({})[crontabTable .. "." .. _UPVALUE0_.stopMeridian] = "1"
      ;({})[crontabTable .. "." .. _UPVALUE0_.stopHour] = tonumber(db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_136 .. "'")[2][crontabTable .. "." .. _UPVALUE0_.hour]) - 12
    elseif tonumber(db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_136 .. "'")[2][crontabTable .. "." .. _UPVALUE0_.hour]) == 12 then
      ({})[crontabTable .. "." .. _UPVALUE0_.stopMeridian] = "1"
      ;({})[crontabTable .. "." .. _UPVALUE0_.stopHour] = "12"
    else
      ({})[crontabTable .. "." .. _UPVALUE0_.stopHour] = db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_136 .. "'")[2][crontabTable .. "." .. _UPVALUE0_.hour]
      ;({})[crontabTable .. "." .. _UPVALUE0_.stopMeridian] = "0"
    end
    ;({})[crontabTable .. "." .. _UPVALUE0_.stopMinute] = db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_136 .. "'")[2][crontabTable .. "." .. _UPVALUE0_.minute]
  end
  L1_124 = L12_135[accesspointsTable .. "." .. _UPVALUE0_.apName]
  L2_125 = L12_135[accesspointsTable .. "." .. _UPVALUE0_.profileName]
  L3_126 = ({})[crontabTable .. "." .. _UPVALUE0_.unit]
  L4_127 = ({})[crontabTable .. "." .. _UPVALUE0_.scheduleControl]
  L5_128 = ({})[crontabTable .. "." .. _UPVALUE0_.startHour]
  L6_129 = ({})[crontabTable .. "." .. _UPVALUE0_.startMinute]
  L7_130 = ({})[crontabTable .. "." .. _UPVALUE0_.startMeridian]
  L8_131 = ({})[crontabTable .. "." .. _UPVALUE0_.stopHour]
  L9_132 = ({})[crontabTable .. "." .. _UPVALUE0_.stopMinute]
  L10_133 = ({})[crontabTable .. "." .. _UPVALUE0_.stopMeridian]
  L11_134 = ({})[crontabTable .. "." .. _UPVALUE0_.wlanPartition]
  return _UPVALUE1_.SUCCESS, L0_123, L1_124, L2_125, L3_126, L4_127, L5_128, L6_129, L7_130, L8_131, L9_132, L10_133, L11_134
end
function accessPointGetNext(A0_138)
  local L1_139, L2_140, L3_141, L4_142, L5_143, L6_144, L7_145, L8_146, L9_147, L10_148, L11_149, L12_150, L13_151, L14_152, L15_153
  L1_139 = db
  L1_139 = L1_139.getNextRowId
  L2_140 = A0_138
  L3_141 = accesspointsTable
  L1_139 = L1_139(L2_140, L3_141)
  L2_140, L3_141, L4_142, L5_143, L6_144, L7_145, L8_146, L9_147, L10_148, L11_149, L12_150 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L13_151 = db
  L13_151 = L13_151.getRow
  L14_152 = accesspointsTable
  L15_153 = _UPVALUE0_
  L15_153 = L15_153.ROW_ID
  L13_151 = L13_151(L14_152, L15_153, L1_139)
  L14_152 = db
  L14_152 = L14_152.getAttribute
  L15_153 = accesspointsTable
  L14_152 = L14_152(L15_153, _UPVALUE0_.ROW_ID, L1_139, _UPVALUE0_.apName)
  L14_152 = L14_152 or ""
  L15_153 = "/pfrm2.0/bin/stopStartVapInstance.sh %d %s"
  if db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L14_152 .. "'")[1] == nil then
    ({})[crontabTable .. "." .. _UPVALUE0_.startHour] = ""
    ;({})[crontabTable .. "." .. _UPVALUE0_.startMinute] = ""
    ;({})[crontabTable .. "." .. _UPVALUE0_.startMeridian] = ""
    ;({})[crontabTable .. "." .. _UPVALUE0_.unit] = "0"
  else
    if db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L14_152 .. "'")[1][crontabTable .. "." .. _UPVALUE0_.command] == string.format(L15_153, 1, L14_152) then
      ({})[crontabTable .. "." .. _UPVALUE0_.scheduleControl] = "0"
    else
      ({})[crontabTable .. "." .. _UPVALUE0_.scheduleControl] = "1"
    end
    ;({})[crontabTable .. "." .. _UPVALUE0_.unit] = db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L14_152 .. "'")[1][crontabTable .. "." .. _UPVALUE0_.unit]
    if tonumber(db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L14_152 .. "'")[1][crontabTable .. "." .. _UPVALUE0_.hour]) == 0 then
      ({})[crontabTable .. "." .. _UPVALUE0_.startMeridian] = "0"
      ;({})[crontabTable .. "." .. _UPVALUE0_.startHour] = "12"
    elseif tonumber(db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L14_152 .. "'")[1][crontabTable .. "." .. _UPVALUE0_.hour]) > 12 then
      ({})[crontabTable .. "." .. _UPVALUE0_.startMeridian] = "1"
      ;({})[crontabTable .. "." .. _UPVALUE0_.startHour] = tonumber(db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L14_152 .. "'")[1][crontabTable .. "." .. _UPVALUE0_.hour]) - 12
    elseif tonumber(db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L14_152 .. "'")[1][crontabTable .. "." .. _UPVALUE0_.hour]) == 12 then
      ({})[crontabTable .. "." .. _UPVALUE0_.startMeridian] = "1"
      ;({})[crontabTable .. "." .. _UPVALUE0_.startHour] = "12"
    else
      ({})[crontabTable .. "." .. _UPVALUE0_.startHour] = db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L14_152 .. "'")[1][crontabTable .. "." .. _UPVALUE0_.hour]
      ;({})[crontabTable .. "." .. _UPVALUE0_.startMeridian] = "0"
    end
    ;({})[crontabTable .. "." .. _UPVALUE0_.startMinute] = db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L14_152 .. "'")[1][crontabTable .. "." .. _UPVALUE0_.minute]
  end
  if db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L14_152 .. "'")[2] == nil then
    ({})[crontabTable .. "." .. _UPVALUE0_.stopHour] = ""
    ;({})[crontabTable .. "." .. _UPVALUE0_.stopMinute] = ""
    ;({})[crontabTable .. "." .. _UPVALUE0_.stopMeridian] = ""
    ;({})[crontabTable .. "." .. _UPVALUE0_.unit] = "0"
  else
    ({})[crontabTable .. "." .. _UPVALUE0_.unit] = db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L14_152 .. "'")[2][crontabTable .. "." .. _UPVALUE0_.unit]
    if tonumber(db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L14_152 .. "'")[2][crontabTable .. "." .. _UPVALUE0_.hour]) == 0 then
      ({})[crontabTable .. "." .. _UPVALUE0_.stopMeridian] = "0"
      ;({})[crontabTable .. "." .. _UPVALUE0_.stopHour] = "12"
    elseif tonumber(db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L14_152 .. "'")[2][crontabTable .. "." .. _UPVALUE0_.hour]) > 12 then
      ({})[crontabTable .. "." .. _UPVALUE0_.stopMeridian] = "1"
      ;({})[crontabTable .. "." .. _UPVALUE0_.stopHour] = tonumber(db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L14_152 .. "'")[2][crontabTable .. "." .. _UPVALUE0_.hour]) - 12
    elseif tonumber(db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L14_152 .. "'")[2][crontabTable .. "." .. _UPVALUE0_.hour]) == 12 then
      ({})[crontabTable .. "." .. _UPVALUE0_.stopMeridian] = "1"
      ;({})[crontabTable .. "." .. _UPVALUE0_.stopHour] = "12"
    else
      ({})[crontabTable .. "." .. _UPVALUE0_.stopHour] = db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L14_152 .. "'")[2][crontabTable .. "." .. _UPVALUE0_.hour]
      ;({})[crontabTable .. "." .. _UPVALUE0_.stopMeridian] = "0"
    end
    ;({})[crontabTable .. "." .. _UPVALUE0_.stopMinute] = db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L14_152 .. "'")[2][crontabTable .. "." .. _UPVALUE0_.minute]
  end
  L2_140 = L13_151[accesspointsTable .. "." .. _UPVALUE0_.apName]
  L3_141 = L13_151[accesspointsTable .. "." .. _UPVALUE0_.profileName]
  L4_142 = ({})[crontabTable .. "." .. _UPVALUE0_.unit]
  L5_143 = ({})[crontabTable .. "." .. _UPVALUE0_.scheduleControl]
  L6_144 = ({})[crontabTable .. "." .. _UPVALUE0_.startHour]
  L7_145 = ({})[crontabTable .. "." .. _UPVALUE0_.startMinute]
  L8_146 = ({})[crontabTable .. "." .. _UPVALUE0_.startMeridian]
  L9_147 = ({})[crontabTable .. "." .. _UPVALUE0_.stopHour]
  L10_148 = ({})[crontabTable .. "." .. _UPVALUE0_.stopMinute]
  L11_149 = ({})[crontabTable .. "." .. _UPVALUE0_.stopMeridian]
  L12_150 = ({})[crontabTable .. "." .. _UPVALUE0_.wlanPartition]
  return _UPVALUE1_.SUCCESS, L1_139, L2_140, L3_141, L4_142, L5_143, L6_144, L7_145, L8_146, L9_147, L10_148, L11_149, L12_150
end
function is_WPS_Enabled(A0_154)
  if A0_154 ~= nil and db.getRow(dot11WPSTable, _UPVALUE1_.apName, A0_154) ~= nil and db.getRow(dot11WPSTable, _UPVALUE1_.apName, A0_154)[dot11WPSTable .. "." .. _UPVALUE1_.wpsEnabled] == "1" then
    return _UPVALUE2_.VAP_IS_INUSE_BY_WPS_ERR
  end
  return _UPVALUE0_.SUCCESS
end
function is_WDS_Enabled(A0_155)
  local L1_156, L2_157
  L1_156 = _UPVALUE0_
  L1_156 = L1_156.FAILURE
  L2_157 = _UPVALUE0_
  L2_157 = L2_157.NIL
  if A0_155 ~= L2_157 then
    L2_157 = tonumber
    L2_157 = L2_157(A0_155)
  elseif L2_157 == _UPVALUE0_.NIL then
    L2_157 = _UPVALUE0_
    L2_157 = L2_157.INVALID_ARGUMENT
    return L2_157
  end
  L2_157 = db
  L2_157 = L2_157.getAttribute
  L2_157 = L2_157(radioTable, _UPVALUE1_.ROW_ID, A0_155, _UPVALUE1_.wdsEnabled)
  if L2_157 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  if tonumber(L2_157) == 1 then
    return _UPVALUE2_.WDS_IS_CONFIGURED_ERR1
  end
  L1_156 = _UPVALUE0_.SUCCESS
  return L1_156
end
function accessPointSet(A0_158, A1_159, A2_160, A3_161, A4_162, A5_163, A6_164, A7_165, A8_166, A9_167, A10_168, A11_169, A12_170, A13_171, A14_172)
  local L15_173, L16_174, L17_175, L18_176, L19_177, L20_178, L21_179, L22_180, L23_181, L24_182, L25_183, L26_184, L27_185, L28_186, L29_187, L30_188, L31_189, L32_190
  L15_173 = {}
  L16_174 = {}
  L17_175 = {}
  L18_176 = _UPVALUE0_
  L18_176 = L18_176.NIL
  if A0_158 ~= L18_176 then
    L18_176 = tonumber
    L19_177 = A0_158
    L18_176 = L18_176(L19_177)
    L19_177 = _UPVALUE0_
    L19_177 = L19_177.NIL
  elseif L18_176 == L19_177 then
    L18_176 = _UPVALUE0_
    L18_176 = L18_176.INVALID_ARGUMENT
    return L18_176
  end
  L18_176 = db
  L18_176 = L18_176.getAttribute
  L19_177 = dot11InterfaceTable
  L20_178 = _UPVALUE1_
  L20_178 = L20_178.apName
  L21_179 = A1_159
  L22_180 = _UPVALUE1_
  L22_180 = L22_180.interfaceName
  L18_176 = L18_176(L19_177, L20_178, L21_179, L22_180)
  L19_177 = db
  L19_177 = L19_177.getAttribute
  L20_178 = profileTable
  L21_179 = _UPVALUE1_
  L21_179 = L21_179.profileName
  L22_180 = A2_160
  L23_181 = _UPVALUE1_
  L23_181 = L23_181.radioMode
  L19_177 = L19_177(L20_178, L21_179, L22_180, L23_181)
  L20_178 = UNIT_NAME
  if L20_178 == "DSR-1000AC" then
    if L19_177 == "dual" then
      L20_178 = "radioNo = '1' and vapName = '"
      L21_179 = A1_159
      L22_180 = "'"
      L20_178 = L20_178 .. L21_179 .. L22_180
      L21_179 = "radioNo = '2' and vapName = '"
      L22_180 = A1_159
      L23_181 = "'"
      L21_179 = L21_179 .. L22_180 .. L23_181
      L22_180 = db
      L22_180 = L22_180.getAttributeWhere
      L23_181 = dot11InterfaceTable
      L24_182 = L20_178
      L25_183 = _UPVALUE1_
      L25_183 = L25_183.interfaceName
      L22_180 = L22_180(L23_181, L24_182, L25_183)
      if L22_180 == "vap0" or L22_180 == "vap4" then
        if L22_180 == "vap0" then
          L19_177 = "a"
        elseif L22_180 == "vap4" then
          L19_177 = "b"
        end
        L23_181 = db
        L23_181 = L23_181.getAttribute
        L24_182 = radioTable
        L25_183 = _UPVALUE1_
        L25_183 = L25_183.band
        L26_184 = L19_177
        L27_185 = _UPVALUE1_
        L27_185 = L27_185.wdsEnabled
        L23_181 = L23_181(L24_182, L25_183, L26_184, L27_185)
        L24_182 = _UPVALUE0_
        L24_182 = L24_182.NIL
        if L23_181 == L24_182 then
          L24_182 = _UPVALUE0_
          L24_182 = L24_182.FAILURE
          return L24_182
        end
        L24_182 = tonumber
        L25_183 = L23_181
        L24_182 = L24_182(L25_183)
        if L24_182 == 1 then
          L24_182 = _UPVALUE2_
          L24_182 = L24_182.WDS_IS_CONFIGURED_ERR1
          return L24_182
        end
      end
      L23_181 = db
      L23_181 = L23_181.getAttributeWhere
      L24_182 = dot11InterfaceTable
      L25_183 = L21_179
      L26_184 = _UPVALUE1_
      L26_184 = L26_184.interfaceName
      L23_181 = L23_181(L24_182, L25_183, L26_184)
      if L23_181 == "vap0" or L23_181 == "vap4" then
        if L23_181 == "vap0" then
          L19_177 = "a"
        elseif L23_181 == "vap4" then
          L19_177 = "b"
        end
        L24_182 = db
        L24_182 = L24_182.getAttribute
        L25_183 = radioTable
        L26_184 = _UPVALUE1_
        L26_184 = L26_184.band
        L27_185 = L19_177
        L28_186 = _UPVALUE1_
        L28_186 = L28_186.wdsEnabled
        L24_182 = L24_182(L25_183, L26_184, L27_185, L28_186)
        L25_183 = _UPVALUE0_
        L25_183 = L25_183.NIL
        if L24_182 == L25_183 then
          L25_183 = _UPVALUE0_
          L25_183 = L25_183.FAILURE
          return L25_183
        end
        L25_183 = tonumber
        L26_184 = L24_182
        L25_183 = L25_183(L26_184)
        if L25_183 == 1 then
          L25_183 = _UPVALUE2_
          L25_183 = L25_183.WDS_IS_CONFIGURED_ERR1
          return L25_183
        end
      end
    end
    if L18_176 == "vap0" or L18_176 == "vap4" then
      L20_178 = db
      L20_178 = L20_178.getAttribute
      L21_179 = radioTable
      L22_180 = _UPVALUE1_
      L22_180 = L22_180.band
      L23_181 = L19_177
      L24_182 = _UPVALUE1_
      L24_182 = L24_182.wdsEnabled
      L20_178 = L20_178(L21_179, L22_180, L23_181, L24_182)
      L21_179 = _UPVALUE0_
      L21_179 = L21_179.NIL
      if L20_178 == L21_179 then
        L21_179 = _UPVALUE0_
        L21_179 = L21_179.FAILURE
        return L21_179
      end
      if L18_176 == "vap0" and L19_177 == "a" then
        L21_179 = tonumber
        L22_180 = L20_178
        L21_179 = L21_179(L22_180)
        if L21_179 == 1 then
          L21_179 = _UPVALUE2_
          L21_179 = L21_179.WDS_IS_CONFIGURED_ERR1
          return L21_179
        end
      end
      if L18_176 == "vap4" and L19_177 == "b" then
        L21_179 = tonumber
        L22_180 = L20_178
        L21_179 = L21_179(L22_180)
        if L21_179 == 1 then
          L21_179 = _UPVALUE2_
          L21_179 = L21_179.WDS_IS_CONFIGURED_ERR1
          return L21_179
        end
      end
    end
  else
    L20_178 = tonumber
    L21_179 = A0_158
    L20_178 = L20_178(L21_179)
    if L20_178 == 1 then
      L20_178 = db
      L20_178 = L20_178.getAttribute
      L21_179 = radioTable
      L22_180 = _UPVALUE1_
      L22_180 = L22_180.ROW_ID
      L23_181 = A0_158
      L24_182 = _UPVALUE1_
      L24_182 = L24_182.wdsEnabled
      L20_178 = L20_178(L21_179, L22_180, L23_181, L24_182)
      L21_179 = _UPVALUE0_
      L21_179 = L21_179.NIL
      if L20_178 == L21_179 then
        L21_179 = _UPVALUE0_
        L21_179 = L21_179.FAILURE
        return L21_179
      end
      L21_179 = tonumber
      L22_180 = L20_178
      L21_179 = L21_179(L22_180)
      if L21_179 == 1 then
        L21_179 = _UPVALUE2_
        L21_179 = L21_179.WDS_IS_CONFIGURED_ERR1
        return L21_179
      end
    end
  end
  L20_178 = nil
  if A1_159 == nil then
    L21_179 = _UPVALUE0_
    L21_179 = L21_179.INVALID_ARGUMENT
    return L21_179
  end
  L21_179 = accesspointsTable
  L22_180 = "."
  L23_181 = _UPVALUE1_
  L23_181 = L23_181.apName
  L21_179 = L21_179 .. L22_180 .. L23_181
  L15_173[L21_179] = A1_159
  L21_179 = accesspointsTable
  L22_180 = "."
  L23_181 = _UPVALUE1_
  L23_181 = L23_181.vapEnabled
  L21_179 = L21_179 .. L22_180 .. L23_181
  L22_180 = db
  L22_180 = L22_180.getAttribute
  L23_181 = accesspointsTable
  L24_182 = accesspointsTable
  L25_183 = "."
  L26_184 = _UPVALUE1_
  L26_184 = L26_184.ROW_ID
  L24_182 = L24_182 .. L25_183 .. L26_184
  L25_183 = A0_158
  L26_184 = _UPVALUE1_
  L26_184 = L26_184.vapEnabled
  L22_180 = L22_180(L23_181, L24_182, L25_183, L26_184)
  L15_173[L21_179] = L22_180
  if A2_160 == nil then
    L21_179 = _UPVALUE0_
    L21_179 = L21_179.INVALID_ARGUMENT
    return L21_179
  end
  L21_179 = db
  L21_179 = L21_179.getAttribute
  L22_180 = accesspointsTable
  L23_181 = accesspointsTable
  L24_182 = "."
  L25_183 = _UPVALUE1_
  L25_183 = L25_183.apName
  L23_181 = L23_181 .. L24_182 .. L25_183
  L24_182 = A1_159
  L25_183 = _UPVALUE1_
  L25_183 = L25_183.profileName
  L21_179 = L21_179(L22_180, L23_181, L24_182, L25_183)
  L22_180 = db
  L22_180 = L22_180.existsRowWhere
  L23_181 = accesspointsTable
  L24_182 = _UPVALUE1_
  L24_182 = L24_182.profileName
  L25_183 = " ='"
  L26_184 = A2_160
  L27_185 = "'"
  L24_182 = L24_182 .. L25_183 .. L26_184 .. L27_185
  L22_180 = L22_180(L23_181, L24_182)
  if L22_180 and A2_160 ~= L21_179 then
    L23_181 = _UPVALUE2_
    L23_181 = L23_181.PROFILE_NAME_IS_IN_USE
    return L23_181
  end
  L23_181 = accesspointsTable
  L24_182 = "."
  L25_183 = _UPVALUE1_
  L25_183 = L25_183.profileName
  L23_181 = L23_181 .. L24_182 .. L25_183
  L15_173[L23_181] = A2_160
  if A12_170 ~= nil then
    L23_181 = accesspointsTable
    L24_182 = "."
    L25_183 = _UPVALUE1_
    L25_183 = L25_183.txPower
    L23_181 = L23_181 .. L24_182 .. L25_183
    L15_173[L23_181] = A12_170
  end
  if A13_171 ~= nil then
    L23_181 = accesspointsTable
    L24_182 = "."
    L25_183 = _UPVALUE1_
    L25_183 = L25_183.txRate
    L23_181 = L23_181 .. L24_182 .. L25_183
    L15_173[L23_181] = A13_171
  end
  if A14_172 ~= nil then
    L23_181 = accesspointsTable
    L24_182 = "."
    L25_183 = _UPVALUE1_
    L25_183 = L25_183.puren
    L23_181 = L23_181 .. L24_182 .. L25_183
    L15_173[L23_181] = A14_172
  end
  if A11_169 == nil then
    L23_181 = _UPVALUE0_
    L23_181 = L23_181.INVALID_ARGUMENT
    return L23_181
  end
  L23_181 = accesspointsTable
  L24_182 = "."
  L25_183 = _UPVALUE1_
  L25_183 = L25_183.wlanPartition
  L23_181 = L23_181 .. L24_182 .. L25_183
  L15_173[L23_181] = A11_169
  if A3_161 == nil then
    L23_181 = _UPVALUE0_
    L23_181 = L23_181.INVALID_ARGUMENT
    return L23_181
  end
  L23_181 = crontabTable
  L24_182 = "."
  L25_183 = _UPVALUE1_
  L25_183 = L25_183.unit
  L23_181 = L23_181 .. L24_182 .. L25_183
  L16_174[L23_181] = A3_161
  L23_181 = crontabTable
  L24_182 = "."
  L25_183 = _UPVALUE1_
  L25_183 = L25_183.unit
  L23_181 = L23_181 .. L24_182 .. L25_183
  L17_175[L23_181] = A3_161
  if A5_163 == nil then
    L23_181 = _UPVALUE0_
    L23_181 = L23_181.INVALID_ARGUMENT
    return L23_181
  end
  L23_181 = crontabTable
  L24_182 = "."
  L25_183 = _UPVALUE1_
  L25_183 = L25_183.hour
  L23_181 = L23_181 .. L24_182 .. L25_183
  L16_174[L23_181] = A5_163
  if A6_164 == nil then
    L23_181 = _UPVALUE0_
    L23_181 = L23_181.INVALID_ARGUMENT
    return L23_181
  end
  L23_181 = crontabTable
  L24_182 = "."
  L25_183 = _UPVALUE1_
  L25_183 = L25_183.minute
  L23_181 = L23_181 .. L24_182 .. L25_183
  L16_174[L23_181] = A6_164
  if A8_166 == nil then
    L23_181 = _UPVALUE0_
    L23_181 = L23_181.INVALID_ARGUMENT
    return L23_181
  end
  L23_181 = crontabTable
  L24_182 = "."
  L25_183 = _UPVALUE1_
  L25_183 = L25_183.hour
  L23_181 = L23_181 .. L24_182 .. L25_183
  L17_175[L23_181] = A8_166
  if A9_167 == nil then
    L23_181 = _UPVALUE0_
    L23_181 = L23_181.INVALID_ARGUMENT
    return L23_181
  end
  L23_181 = crontabTable
  L24_182 = "."
  L25_183 = _UPVALUE1_
  L25_183 = L25_183.minute
  L23_181 = L23_181 .. L24_182 .. L25_183
  L17_175[L23_181] = A9_167
  if A3_161 == "2" then
    L23_181 = tonumber
    L24_182 = os
    L24_182 = L24_182.date
    L25_183 = "%H"
    L29_187 = L24_182(L25_183)
    L23_181 = L23_181(L24_182, L25_183, L26_184, L27_185, L28_186, L29_187, L30_188, L31_189, L32_190, L24_182(L25_183))
    L24_182 = tonumber
    L25_183 = os
    L25_183 = L25_183.date
    L26_184 = "%M"
    L29_187 = L25_183(L26_184)
    L24_182 = L24_182(L25_183, L26_184, L27_185, L28_186, L29_187, L30_188, L31_189, L32_190, L25_183(L26_184))
    L25_183 = tonumber
    L26_184 = A5_163
    L25_183 = L25_183(L26_184)
    setStrHr = L25_183
    L25_183 = tonumber
    L26_184 = A6_164
    L25_183 = L25_183(L26_184)
    setStrMin = L25_183
    L25_183 = tonumber
    L26_184 = A8_166
    L25_183 = L25_183(L26_184)
    setStpHr = L25_183
    L25_183 = tonumber
    L26_184 = A9_167
    L25_183 = L25_183(L26_184)
    setStpMin = L25_183
    L25_183 = setStrHr
    L25_183 = L25_183 * 60
    L26_184 = setStrMin
    L25_183 = L25_183 + L26_184
    setStrMins = L25_183
    L25_183 = setStpHr
    L25_183 = L25_183 * 60
    L26_184 = setStpMin
    L25_183 = L25_183 + L26_184
    setStpMins = L25_183
    L25_183 = L23_181 * 60
    L25_183 = L25_183 + L24_182
    curMins = L25_183
    L25_183 = curMins
    L26_184 = setStrMins
    if L25_183 > L26_184 then
      L25_183 = curMins
      L26_184 = setStpMins
      if L25_183 < L26_184 then
        L25_183 = accesspointsTable
        L26_184 = "."
        L27_185 = _UPVALUE1_
        L27_185 = L27_185.vapEnabled
        L25_183 = L25_183 .. L26_184 .. L27_185
        L15_173[L25_183] = "1"
      end
    else
      L25_183 = accesspointsTable
      L26_184 = "."
      L27_185 = _UPVALUE1_
      L27_185 = L27_185.vapEnabled
      L25_183 = L25_183 .. L26_184 .. L27_185
      L15_173[L25_183] = "0"
    end
    if A4_162 == "1" then
      L25_183 = accesspointsTable
      L26_184 = "."
      L27_185 = _UPVALUE1_
      L27_185 = L27_185.vapEnabled
      L25_183 = L25_183 .. L26_184 .. L27_185
      L25_183 = L15_173[L25_183]
      if L25_183 == "1" then
        L25_183 = accesspointsTable
        L26_184 = "."
        L27_185 = _UPVALUE1_
        L27_185 = L27_185.vapEnabled
        L25_183 = L25_183 .. L26_184 .. L27_185
        L15_173[L25_183] = "0"
      else
        L25_183 = accesspointsTable
        L26_184 = "."
        L27_185 = _UPVALUE1_
        L27_185 = L27_185.vapEnabled
        L25_183 = L25_183 .. L26_184 .. L27_185
        L15_173[L25_183] = "1"
      end
    end
  end
  L23_181 = "/pfrm2.0/bin/stopStartVapInstance.sh %d %s"
  if A3_161 == "2" then
    L24_182 = "/pfrm2.0/bin/ActivePointScheduler.sh"
    L25_183 = A1_159
    L26_184 = tonumber
    L27_185 = A5_163
    L26_184 = L26_184(L27_185)
    L26_184 = L26_184 * 60
    L27_185 = tonumber
    L28_186 = A6_164
    L27_185 = L27_185(L28_186)
    L26_184 = L26_184 + L27_185
    L27_185 = tonumber
    L28_186 = A8_166
    L27_185 = L27_185(L28_186)
    L27_185 = L27_185 * 60
    L28_186 = tonumber
    L29_187 = A9_167
    L28_186 = L28_186(L29_187)
    L27_185 = L27_185 + L28_186
    L28_186 = L24_182
    L29_187 = " "
    L28_186 = L28_186 .. L29_187 .. L30_188 .. L31_189 .. L32_190 .. " " .. L27_185 .. " " .. A4_162
    L29_187 = {}
    L29_187[L30_188] = "6"
    L29_187[L30_188] = "5"
    L29_187[L30_188] = "-1"
    L29_187[L30_188] = "-1"
    L29_187[L30_188] = "-1"
    L29_187[L30_188] = "-1"
    L29_187[L30_188] = "-1"
    L31_189 = L28_186 or ""
    L29_187[L30_188] = L31_189
    if L30_188 then
      status = L30_188
    else
      status = L30_188
    end
    if L30_188 == nil then
      return L30_188, L31_189
    end
  else
    L24_182 = accesspointsTable
    L25_183 = "."
    L26_184 = _UPVALUE1_
    L26_184 = L26_184.apName
    L24_182 = L24_182 .. L25_183 .. L26_184
    L24_182 = L15_173[L24_182]
    L25_183 = db
    L25_183 = L25_183.deleteRowWhere
    L26_184 = crontabTable
    L27_185 = "command LIKE '/pfrm2.0/bin/ActivePointScheduler.sh "
    L28_186 = L24_182
    L29_187 = "%'"
    L27_185 = L27_185 .. L28_186 .. L29_187
    L25_183(L26_184, L27_185)
    L25_183 = db
    L25_183 = L25_183.deleteRowWhere
    L26_184 = crontabTable
    L27_185 = "command LIKE '/pfrm2.0/bin/stopStartVapInstance.sh _ "
    L28_186 = L24_182
    L29_187 = "'"
    L27_185 = L27_185 .. L28_186 .. L29_187
    L25_183(L26_184, L27_185)
  end
  L24_182 = string
  L24_182 = L24_182.format
  L25_183 = L23_181
  L26_184 = 1
  L27_185 = A1_159
  L24_182 = L24_182(L25_183, L26_184, L27_185)
  L25_183 = string
  L25_183 = L25_183.format
  L26_184 = L23_181
  L27_185 = 0
  L28_186 = A1_159
  L25_183 = L25_183(L26_184, L27_185, L28_186)
  if A4_162 == "1" then
    L26_184 = string
    L26_184 = L26_184.format
    L27_185 = L23_181
    L28_186 = 0
    L29_187 = A1_159
    L26_184 = L26_184(L27_185, L28_186, L29_187)
    L24_182 = L26_184
    L26_184 = string
    L26_184 = L26_184.format
    L27_185 = L23_181
    L28_186 = 1
    L29_187 = A1_159
    L26_184 = L26_184(L27_185, L28_186, L29_187)
    L25_183 = L26_184
  end
  L26_184 = crontabTable
  L27_185 = "."
  L28_186 = _UPVALUE1_
  L28_186 = L28_186.command
  L26_184 = L26_184 .. L27_185 .. L28_186
  L16_174[L26_184] = L24_182
  L26_184 = crontabTable
  L27_185 = "."
  L28_186 = _UPVALUE1_
  L28_186 = L28_186.command
  L26_184 = L26_184 .. L27_185 .. L28_186
  L17_175[L26_184] = L25_183
  L26_184 = db
  L26_184 = L26_184.getRowsWhere
  L27_185 = crontabTable
  L28_186 = "command like '%stopStartVapInstance.sh%"
  L29_187 = A1_159
  L28_186 = L28_186 .. L29_187 .. L30_188
  L26_184 = L26_184(L27_185, L28_186)
  if L26_184 then
    L27_185 = #L26_184
    if L27_185 > 0 then
      L27_185 = db
      L27_185 = L27_185.deleteRow
      L28_186 = crontabTable
      L29_187 = _UPVALUE1_
      L29_187 = L29_187.command
      L27_185(L28_186, L29_187, L30_188)
      L27_185 = db
      L27_185 = L27_185.deleteRow
      L28_186 = crontabTable
      L29_187 = _UPVALUE1_
      L29_187 = L29_187.command
      L27_185(L28_186, L29_187, L30_188)
    end
  end
  if A3_161 == "2" then
    L27_185 = db
    L27_185 = L27_185.insert
    L28_186 = crontabTable
    L29_187 = L16_174
    L27_185 = L27_185(L28_186, L29_187)
    L20_178 = L27_185
    if L20_178 then
      L27_185 = db
      L27_185 = L27_185.insert
      L28_186 = crontabTable
      L29_187 = L17_175
      L27_185 = L27_185(L28_186, L29_187)
      L20_178 = L27_185
    end
  else
    L20_178 = true
  end
  L27_185 = UNIT_NAME
  if L27_185 == "DSR-1000AC" then
    L27_185 = db
    L27_185 = L27_185.getAttribute
    L28_186 = profileTable
    L29_187 = _UPVALUE1_
    L29_187 = L29_187.profileName
    L27_185 = L27_185(L28_186, L29_187, L30_188, L31_189)
    L28_186 = nil
    L29_187 = db
    L29_187 = L29_187.getRowsWhere
    L29_187 = L29_187(L30_188, L31_189)
    if L30_188 > 1 then
      L28_186 = "dual"
    elseif L30_188 == "2" then
      L28_186 = "b"
    elseif L30_188 == "1" then
      L28_186 = "a"
    end
    if L28_186 ~= L27_185 then
      if L27_185 == "a" then
      elseif L27_185 == "b" then
      else
      end
      if L27_185 == "dual" then
        status = L31_189
        freeRow = L31_189
        if L31_189 then
          L20_178 = L31_189
        end
        freeRow = L31_189
        if L31_189 then
          L20_178 = L31_189
        end
      else
        L15_173[L31_189] = L30_188
        status = L31_189
        freeRow = L31_189
        if L31_189 then
          L20_178 = L31_189
        end
      end
    end
  end
  L27_185 = db
  L27_185 = L27_185.existsRowWhere
  L28_186 = dot11InterfaceTable
  L29_187 = "vapName = 'unused'"
  L27_185 = L27_185(L28_186, L29_187)
  L28_186 = db
  L28_186 = L28_186.getAttribute
  L29_187 = profileTable
  L28_186 = L28_186(L29_187, L30_188, L31_189, L32_190)
  L29_187 = db
  L29_187 = L29_187.getRowsWithJoin
  L29_187 = L29_187(L30_188, L31_189, L32_190)
  for _FORV_33_, _FORV_34_ in L30_188(L31_189) do
    L20_178 = L20_178 and db.setAttributeWhere(portMgmtTable, "PhyInterfaceName='" .. _FORV_34_[dot11InterfaceTable .. "." .. _UPVALUE1_.interfaceName] .. "'", "PortName", L28_186)
  end
  if L30_188 ~= "DSR-1000AC" then
  elseif L30_188 == "DSR-500AC" and L20_178 then
    if L30_188 == "1" then
      L20_178 = L30_188
    end
  end
  if L20_178 then
    if L32_190 ~= "DSR-1000AC" then
    else
      if L32_190 == "DSR-500AC" then
        L20_178 = L32_190
    end
    else
      L20_178 = L32_190
    end
  end
  if L32_190 ~= "DSR-1000AC" then
  elseif L32_190 == "DSR-500AC" and L31_189 == "NOUPDATES" then
    if L32_190 == "1" then
      L20_178 = L32_190
    end
  end
  if L20_178 then
    if L32_190 == "1" then
      L20_178 = L32_190
    elseif L32_190 == "0" then
      L20_178 = L32_190
    end
  end
  if L15_173[accesspointsTable .. "." .. _UPVALUE1_.vapEnabled] == "1" then
    L20_178 = vlanPeerSSIDSet(L15_173[accesspointsTable .. "." .. _UPVALUE1_.apName], L32_190, _UPVALUE1_.bridge)
  elseif L15_173[accesspointsTable .. "." .. _UPVALUE1_.vapEnabled] == "0" then
    L20_178 = vlanPeerSSIDSet(L15_173[accesspointsTable .. "." .. _UPVALUE1_.apName], L32_190, _UPVALUE1_.vapDisabled)
  end
  if L20_178 then
    return _UPVALUE0_.SUCCESS
  else
    return _UPVALUE0_.FAILURE
  end
end
function accessPointCreate(A0_191, A1_192, A2_193, A3_194, A4_195, A5_196, A6_197, A7_198, A8_199, A9_200, A10_201)
  local L11_202, L12_203, L13_204, L14_205, L15_206, L16_207, L17_208, L18_209, L19_210, L20_211, L21_212, L22_213, L23_214, L24_215, L25_216, L26_217, L27_218, L28_219
  L11_202 = {}
  L12_203 = {}
  L13_204 = {}
  L14_205 = {}
  L15_206 = nil
  L16_207 = UNIT_NAME
  if L16_207 == "DSR-1000AC" then
    L16_207 = "profileName = '"
    L17_208 = A1_192
    L18_209 = "'"
    L16_207 = L16_207 .. L17_208 .. L18_209
    L17_208 = db
    L17_208 = L17_208.getAttributeWhere
    L18_209 = profileTable
    L19_210 = L16_207
    L20_211 = _UPVALUE0_
    L20_211 = L20_211.radioMode
    L17_208 = L17_208(L18_209, L19_210, L20_211)
    tempVar = L17_208
    L17_208 = tempVar
    if L17_208 ~= "dual" then
      L17_208 = tempVar
      if L17_208 ~= nil then
        L17_208 = tempVar
        if L17_208 == "b" then
          L17_208 = 2
          tempVar = L17_208
        else
          L17_208 = 1
          tempVar = L17_208
        end
        L17_208 = "radioNo = '"
        L18_209 = tempVar
        L19_210 = "' and vapName != 'unused'"
        L16_207 = L17_208 .. L18_209 .. L19_210
        L17_208 = db
        L17_208 = L17_208.getRowsWhere
        L18_209 = dot11InterfaceTable
        L19_210 = L16_207
        L17_208 = L17_208(L18_209, L19_210)
        tempVar = L17_208
        L17_208 = tempVar
        if L17_208 ~= nil then
          L17_208 = tempVar
          L17_208 = #L17_208
          if L17_208 > 4 then
            L17_208 = _UPVALUE1_
            L17_208 = L17_208.MAX_AP_REACHED
            return L17_208
          end
        end
      end
    else
      L17_208 = tempVar
      if L17_208 == "dual" then
        L16_207 = "radioNo = '1' and vapName != 'unused' "
        L17_208 = db
        L17_208 = L17_208.getRowsWhere
        L18_209 = dot11InterfaceTable
        L19_210 = L16_207
        L17_208 = L17_208(L18_209, L19_210)
        tempVar = L17_208
        L17_208 = tempVar
        if L17_208 ~= nil then
          L17_208 = tempVar
          L17_208 = #L17_208
          if L17_208 > 4 then
            L17_208 = _UPVALUE1_
            L17_208 = L17_208.MAX_AP_REACHED
            return L17_208
          end
        end
        L16_207 = "radioNo = '2' and vapName != 'unused'"
        L17_208 = db
        L17_208 = L17_208.getRowsWhere
        L18_209 = dot11InterfaceTable
        L19_210 = L16_207
        L17_208 = L17_208(L18_209, L19_210)
        tempVar = L17_208
        L17_208 = tempVar
        if L17_208 ~= nil then
          L17_208 = tempVar
          L17_208 = #L17_208
          if L17_208 > 4 then
            L17_208 = _UPVALUE1_
            L17_208 = L17_208.MAX_AP_REACHED
            return L17_208
          end
        end
      end
    end
  else
    L16_207 = UNIT_NAME
    if L16_207 == "DSR-500AC" then
      L16_207 = "radioNo = '1' and vapName != 'unused' "
      where = L16_207
      L16_207 = db
      L16_207 = L16_207.getRowsWhere
      L17_208 = dot11InterfaceTable
      L18_209 = where
      L16_207 = L16_207(L17_208, L18_209)
      tempVar = L16_207
      L16_207 = tempVar
      if L16_207 ~= nil then
        L16_207 = tempVar
        L16_207 = #L16_207
        if L16_207 > 4 then
          L16_207 = _UPVALUE1_
          L16_207 = L16_207.MAX_AP_REACHED
          return L16_207
        end
      end
    else
      L16_207 = db
      L16_207 = L16_207.getTable
      L17_208 = accesspointsTable
      L18_209 = false
      L16_207 = L16_207(L17_208, L18_209)
      L14_205 = L16_207
      if L14_205 ~= nil then
        L16_207 = #L14_205
        if L16_207 > 3 then
          L16_207 = _UPVALUE1_
          L16_207 = L16_207.MAX_AP_REACHED
          return L16_207
        end
      end
    end
  end
  L16_207 = db
  L16_207 = L16_207.existsRowWhere
  L17_208 = accesspointsTable
  L18_209 = _UPVALUE0_
  L18_209 = L18_209.apName
  L19_210 = " ='"
  L20_211 = A0_191
  L21_212 = "'"
  L18_209 = L18_209 .. L19_210 .. L20_211 .. L21_212
  L16_207 = L16_207(L17_208, L18_209)
  if L16_207 then
    L17_208 = _UPVALUE1_
    L17_208 = L17_208.AP_NAME_ALREADY_IN_USE
    return L17_208
  end
  L17_208 = db
  L17_208 = L17_208.existsRowWhere
  L18_209 = accesspointsTable
  L19_210 = _UPVALUE0_
  L19_210 = L19_210.profileName
  L20_211 = " ='"
  L21_212 = A1_192
  L22_213 = "'"
  L19_210 = L19_210 .. L20_211 .. L21_212 .. L22_213
  L17_208 = L17_208(L18_209, L19_210)
  if L17_208 then
    L18_209 = _UPVALUE1_
    L18_209 = L18_209.PROFILE_NAME_IS_IN_USE
    return L18_209
  end
  L18_209 = db
  L18_209 = L18_209.getRow
  L19_210 = radioTable
  L20_211 = _UPVALUE0_
  L20_211 = L20_211.ROW_ID
  L21_212 = "1"
  L18_209 = L18_209(L19_210, L20_211, L21_212)
  L19_210 = accesspointsTable
  L20_211 = "."
  L21_212 = _UPVALUE0_
  L21_212 = L21_212.radioList
  L19_210 = L19_210 .. L20_211 .. L21_212
  L11_202[L19_210] = "1"
  L19_210 = accesspointsTable
  L20_211 = "."
  L21_212 = _UPVALUE0_
  L21_212 = L21_212.beaconInterval
  L19_210 = L19_210 .. L20_211 .. L21_212
  L20_211 = radioTable
  L21_212 = "."
  L22_213 = _UPVALUE0_
  L22_213 = L22_213.beaconInterval
  L20_211 = L20_211 .. L21_212 .. L22_213
  L20_211 = L18_209[L20_211]
  L11_202[L19_210] = L20_211
  L19_210 = accesspointsTable
  L20_211 = "."
  L21_212 = _UPVALUE0_
  L21_212 = L21_212.dtimInterval
  L19_210 = L19_210 .. L20_211 .. L21_212
  L20_211 = radioTable
  L21_212 = "."
  L22_213 = _UPVALUE0_
  L22_213 = L22_213.dtimInterval
  L20_211 = L20_211 .. L21_212 .. L22_213
  L20_211 = L18_209[L20_211]
  L11_202[L19_210] = L20_211
  L19_210 = accesspointsTable
  L20_211 = "."
  L21_212 = _UPVALUE0_
  L21_212 = L21_212.rtsThreshold
  L19_210 = L19_210 .. L20_211 .. L21_212
  L20_211 = radioTable
  L21_212 = "."
  L22_213 = _UPVALUE0_
  L22_213 = L22_213.rtsThreshold
  L20_211 = L20_211 .. L21_212 .. L22_213
  L20_211 = L18_209[L20_211]
  L11_202[L19_210] = L20_211
  L19_210 = accesspointsTable
  L20_211 = "."
  L21_212 = _UPVALUE0_
  L21_212 = L21_212.fragThreshold
  L19_210 = L19_210 .. L20_211 .. L21_212
  L20_211 = radioTable
  L21_212 = "."
  L22_213 = _UPVALUE0_
  L22_213 = L22_213.fragThreshold
  L20_211 = L20_211 .. L21_212 .. L22_213
  L20_211 = L18_209[L20_211]
  L11_202[L19_210] = L20_211
  L19_210 = accesspointsTable
  L20_211 = "."
  L21_212 = _UPVALUE0_
  L21_212 = L21_212.preambleMode
  L19_210 = L19_210 .. L20_211 .. L21_212
  L20_211 = radioTable
  L21_212 = "."
  L22_213 = _UPVALUE0_
  L22_213 = L22_213.preambleMode
  L20_211 = L20_211 .. L21_212 .. L22_213
  L20_211 = L18_209[L20_211]
  L11_202[L19_210] = L20_211
  L19_210 = accesspointsTable
  L20_211 = "."
  L21_212 = _UPVALUE0_
  L21_212 = L21_212.rtsCtsProtect
  L19_210 = L19_210 .. L20_211 .. L21_212
  L20_211 = radioTable
  L21_212 = "."
  L22_213 = _UPVALUE0_
  L22_213 = L22_213.rtsCtsProtect
  L20_211 = L20_211 .. L21_212 .. L22_213
  L20_211 = L18_209[L20_211]
  L11_202[L19_210] = L20_211
  L19_210 = accesspointsTable
  L20_211 = "."
  L21_212 = _UPVALUE0_
  L21_212 = L21_212.uapsd
  L19_210 = L19_210 .. L20_211 .. L21_212
  L20_211 = radioTable
  L21_212 = "."
  L22_213 = _UPVALUE0_
  L22_213 = L22_213.uapsd
  L20_211 = L20_211 .. L21_212 .. L22_213
  L20_211 = L18_209[L20_211]
  L11_202[L19_210] = L20_211
  L19_210 = accesspointsTable
  L20_211 = "."
  L21_212 = _UPVALUE0_
  L21_212 = L21_212.txPower
  L19_210 = L19_210 .. L20_211 .. L21_212
  L20_211 = radioTable
  L21_212 = "."
  L22_213 = _UPVALUE0_
  L22_213 = L22_213.txPower
  L20_211 = L20_211 .. L21_212 .. L22_213
  L20_211 = L18_209[L20_211]
  L11_202[L19_210] = L20_211
  L19_210 = accesspointsTable
  L20_211 = "."
  L21_212 = _UPVALUE0_
  L21_212 = L21_212.shortRetry
  L19_210 = L19_210 .. L20_211 .. L21_212
  L20_211 = radioTable
  L21_212 = "."
  L22_213 = _UPVALUE0_
  L22_213 = L22_213.longRetry
  L20_211 = L20_211 .. L21_212 .. L22_213
  L20_211 = L18_209[L20_211]
  L11_202[L19_210] = L20_211
  L19_210 = nil
  if A0_191 == nil then
    L20_211 = _UPVALUE2_
    L20_211 = L20_211.INVALID_ARGUMENT
    return L20_211
  end
  L20_211 = accesspointsTable
  L21_212 = "."
  L22_213 = _UPVALUE0_
  L22_213 = L22_213.apName
  L20_211 = L20_211 .. L21_212 .. L22_213
  L11_202[L20_211] = A0_191
  if A1_192 == nil then
    L20_211 = _UPVALUE2_
    L20_211 = L20_211.INVALID_ARGUMENT
    return L20_211
  end
  L20_211 = accesspointsTable
  L21_212 = "."
  L22_213 = _UPVALUE0_
  L22_213 = L22_213.profileName
  L20_211 = L20_211 .. L21_212 .. L22_213
  L11_202[L20_211] = A1_192
  if A10_201 == nil then
    L20_211 = _UPVALUE2_
    L20_211 = L20_211.INVALID_ARGUMENT
    return L20_211
  end
  L20_211 = accesspointsTable
  L21_212 = "."
  L22_213 = _UPVALUE0_
  L22_213 = L22_213.wlanPartition
  L20_211 = L20_211 .. L21_212 .. L22_213
  L11_202[L20_211] = A10_201
  if A2_193 == nil then
    L20_211 = _UPVALUE2_
    L20_211 = L20_211.INVALID_ARGUMENT
    return L20_211
  end
  L20_211 = crontabTable
  L21_212 = "."
  L22_213 = _UPVALUE0_
  L22_213 = L22_213.unit
  L20_211 = L20_211 .. L21_212 .. L22_213
  L12_203[L20_211] = A2_193
  L20_211 = crontabTable
  L21_212 = "."
  L22_213 = _UPVALUE0_
  L22_213 = L22_213.unit
  L20_211 = L20_211 .. L21_212 .. L22_213
  L13_204[L20_211] = A2_193
  if A4_195 == nil then
    L20_211 = _UPVALUE2_
    L20_211 = L20_211.INVALID_ARGUMENT
    return L20_211
  end
  L20_211 = crontabTable
  L21_212 = "."
  L22_213 = _UPVALUE0_
  L22_213 = L22_213.hour
  L20_211 = L20_211 .. L21_212 .. L22_213
  L12_203[L20_211] = A4_195
  if A5_196 == nil then
    L20_211 = _UPVALUE2_
    L20_211 = L20_211.INVALID_ARGUMENT
    return L20_211
  end
  L20_211 = crontabTable
  L21_212 = "."
  L22_213 = _UPVALUE0_
  L22_213 = L22_213.minute
  L20_211 = L20_211 .. L21_212 .. L22_213
  L12_203[L20_211] = A5_196
  if A7_198 == nil then
    L20_211 = _UPVALUE2_
    L20_211 = L20_211.INVALID_ARGUMENT
    return L20_211
  end
  L20_211 = crontabTable
  L21_212 = "."
  L22_213 = _UPVALUE0_
  L22_213 = L22_213.hour
  L20_211 = L20_211 .. L21_212 .. L22_213
  L13_204[L20_211] = A7_198
  if A8_199 == nil then
    L20_211 = _UPVALUE2_
    L20_211 = L20_211.INVALID_ARGUMENT
    return L20_211
  end
  L20_211 = crontabTable
  L21_212 = "."
  L22_213 = _UPVALUE0_
  L22_213 = L22_213.minute
  L20_211 = L20_211 .. L21_212 .. L22_213
  L13_204[L20_211] = A8_199
  if A2_193 == "2" then
    L20_211 = tonumber
    L21_212 = os
    L21_212 = L21_212.date
    L22_213 = "%H"
    L27_218 = L21_212(L22_213)
    L20_211 = L20_211(L21_212, L22_213, L23_214, L24_215, L25_216, L26_217, L27_218, L28_219, L21_212(L22_213))
    L21_212 = tonumber
    L22_213 = os
    L22_213 = L22_213.date
    L23_214 = "%M"
    L27_218 = L22_213(L23_214)
    L21_212 = L21_212(L22_213, L23_214, L24_215, L25_216, L26_217, L27_218, L28_219, L22_213(L23_214))
    L22_213 = tonumber
    L23_214 = A4_195
    L22_213 = L22_213(L23_214)
    setStrHr = L22_213
    L22_213 = tonumber
    L23_214 = A5_196
    L22_213 = L22_213(L23_214)
    setStrMin = L22_213
    L22_213 = tonumber
    L23_214 = A7_198
    L22_213 = L22_213(L23_214)
    setStpHr = L22_213
    L22_213 = tonumber
    L23_214 = A8_199
    L22_213 = L22_213(L23_214)
    setStpMin = L22_213
    L22_213 = setStrHr
    L22_213 = L22_213 * 60
    L23_214 = setStrMin
    L22_213 = L22_213 + L23_214
    setStrMins = L22_213
    L22_213 = setStpHr
    L22_213 = L22_213 * 60
    L23_214 = setStpMin
    L22_213 = L22_213 + L23_214
    setStpMins = L22_213
    L22_213 = L20_211 * 60
    L22_213 = L22_213 + L21_212
    curMins = L22_213
    L22_213 = curMins
    L23_214 = setStrMins
    if L22_213 > L23_214 then
      L22_213 = curMins
      L23_214 = setStpMins
      if L22_213 < L23_214 then
        L22_213 = accesspointsTable
        L23_214 = "."
        L24_215 = _UPVALUE0_
        L24_215 = L24_215.vapEnabled
        L22_213 = L22_213 .. L23_214 .. L24_215
        L11_202[L22_213] = "1"
      end
    else
      L22_213 = accesspointsTable
      L23_214 = "."
      L24_215 = _UPVALUE0_
      L24_215 = L24_215.vapEnabled
      L22_213 = L22_213 .. L23_214 .. L24_215
      L11_202[L22_213] = "0"
    end
    if A3_194 == "1" then
      L22_213 = accesspointsTable
      L23_214 = "."
      L24_215 = _UPVALUE0_
      L24_215 = L24_215.vapEnabled
      L22_213 = L22_213 .. L23_214 .. L24_215
      L22_213 = L11_202[L22_213]
      if L22_213 == "1" then
        L22_213 = accesspointsTable
        L23_214 = "."
        L24_215 = _UPVALUE0_
        L24_215 = L24_215.vapEnabled
        L22_213 = L22_213 .. L23_214 .. L24_215
        L11_202[L22_213] = "0"
      else
        L22_213 = accesspointsTable
        L23_214 = "."
        L24_215 = _UPVALUE0_
        L24_215 = L24_215.vapEnabled
        L22_213 = L22_213 .. L23_214 .. L24_215
        L11_202[L22_213] = "1"
      end
    end
  else
    L20_211 = accesspointsTable
    L21_212 = "."
    L22_213 = _UPVALUE0_
    L22_213 = L22_213.vapEnabled
    L20_211 = L20_211 .. L21_212 .. L22_213
    L11_202[L20_211] = "1"
  end
  L20_211 = "/pfrm2.0/bin/stopStartVapInstance.sh %d %s"
  if A2_193 == "2" then
    L21_212 = "/pfrm2.0/bin/ActivePointScheduler.sh"
    L22_213 = A0_191
    L23_214 = tonumber
    L24_215 = A4_195
    L23_214 = L23_214(L24_215)
    L23_214 = L23_214 * 60
    L24_215 = tonumber
    L25_216 = A5_196
    L24_215 = L24_215(L25_216)
    L23_214 = L23_214 + L24_215
    L24_215 = tonumber
    L25_216 = A7_198
    L24_215 = L24_215(L25_216)
    L24_215 = L24_215 * 60
    L25_216 = tonumber
    L26_217 = A8_199
    L25_216 = L25_216(L26_217)
    L24_215 = L24_215 + L25_216
    L25_216 = L21_212
    L26_217 = " "
    L27_218 = L22_213
    L25_216 = L25_216 .. L26_217 .. L27_218 .. L28_219 .. L23_214 .. " " .. L24_215 .. " " .. A3_194
    L26_217 = {}
    L27_218 = crontabTable
    L27_218 = L27_218 .. L28_219 .. _UPVALUE0_.unit
    L26_217[L27_218] = "6"
    L27_218 = crontabTable
    L27_218 = L27_218 .. L28_219 .. _UPVALUE0_.interval
    L26_217[L27_218] = "5"
    L27_218 = crontabTable
    L27_218 = L27_218 .. L28_219 .. _UPVALUE0_.minute
    L26_217[L27_218] = "-1"
    L27_218 = crontabTable
    L27_218 = L27_218 .. L28_219 .. _UPVALUE0_.hour
    L26_217[L27_218] = "-1"
    L27_218 = crontabTable
    L27_218 = L27_218 .. L28_219 .. _UPVALUE0_.dayOfMonth
    L26_217[L27_218] = "-1"
    L27_218 = crontabTable
    L27_218 = L27_218 .. L28_219 .. _UPVALUE0_.month
    L26_217[L27_218] = "-1"
    L27_218 = crontabTable
    L27_218 = L27_218 .. L28_219 .. _UPVALUE0_.dayOfWeek
    L26_217[L27_218] = "-1"
    L27_218 = crontabTable
    L27_218 = L27_218 .. L28_219 .. _UPVALUE0_.command
    L28_219 = L25_216 or ""
    L26_217[L27_218] = L28_219
    L27_218 = db
    L27_218 = L27_218.insert
    L27_218 = L27_218(L28_219, L26_217)
    if L27_218 == nil then
      return L28_219, rowId
    end
  else
    L21_212 = accesspointsTable
    L22_213 = "."
    L23_214 = _UPVALUE0_
    L23_214 = L23_214.apName
    L21_212 = L21_212 .. L22_213 .. L23_214
    L21_212 = L11_202[L21_212]
    L22_213 = db
    L22_213 = L22_213.deleteRowWhere
    L23_214 = crontabTable
    L24_215 = "command LIKE '/pfrm2.0/bin/ActivePointScheduler.sh "
    L25_216 = L21_212
    L26_217 = "%'"
    L24_215 = L24_215 .. L25_216 .. L26_217
    L22_213(L23_214, L24_215)
    L22_213 = db
    L22_213 = L22_213.deleteRowWhere
    L23_214 = crontabTable
    L24_215 = "command LIKE '/pfrm2.0/bin/stopStartVapInstance.sh _ "
    L25_216 = L21_212
    L26_217 = "'"
    L24_215 = L24_215 .. L25_216 .. L26_217
    L22_213(L23_214, L24_215)
  end
  L21_212 = string
  L21_212 = L21_212.format
  L22_213 = L20_211
  L23_214 = 1
  L24_215 = A0_191
  L21_212 = L21_212(L22_213, L23_214, L24_215)
  L22_213 = string
  L22_213 = L22_213.format
  L23_214 = L20_211
  L24_215 = 0
  L25_216 = A0_191
  L22_213 = L22_213(L23_214, L24_215, L25_216)
  if A3_194 == "1" then
    L23_214 = string
    L23_214 = L23_214.format
    L24_215 = L20_211
    L25_216 = 0
    L26_217 = A0_191
    L23_214 = L23_214(L24_215, L25_216, L26_217)
    L21_212 = L23_214
    L23_214 = string
    L23_214 = L23_214.format
    L24_215 = L20_211
    L25_216 = 1
    L26_217 = A0_191
    L23_214 = L23_214(L24_215, L25_216, L26_217)
    L22_213 = L23_214
  end
  L23_214 = crontabTable
  L24_215 = "."
  L25_216 = _UPVALUE0_
  L25_216 = L25_216.command
  L23_214 = L23_214 .. L24_215 .. L25_216
  L12_203[L23_214] = L21_212
  L23_214 = crontabTable
  L24_215 = "."
  L25_216 = _UPVALUE0_
  L25_216 = L25_216.command
  L23_214 = L23_214 .. L24_215 .. L25_216
  L13_204[L23_214] = L22_213
  L23_214 = db
  L23_214 = L23_214.getRowsWhere
  L24_215 = crontabTable
  L25_216 = "command like '%stopStartVapInstance.sh%"
  L26_217 = A0_191
  L27_218 = "'"
  L25_216 = L25_216 .. L26_217 .. L27_218
  L23_214 = L23_214(L24_215, L25_216)
  if L23_214 then
    L24_215 = #L23_214
    if L24_215 > 0 then
      L24_215 = db
      L24_215 = L24_215.deleteRow
      L25_216 = crontabTable
      L26_217 = _UPVALUE0_
      L26_217 = L26_217.command
      L27_218 = L23_214[1]
      L27_218 = L27_218[L28_219]
      L24_215(L25_216, L26_217, L27_218)
      L24_215 = db
      L24_215 = L24_215.deleteRow
      L25_216 = crontabTable
      L26_217 = _UPVALUE0_
      L26_217 = L26_217.command
      L27_218 = L23_214[2]
      L27_218 = L27_218[L28_219]
      L24_215(L25_216, L26_217, L27_218)
    end
  end
  if A2_193 == "2" then
    L24_215 = db
    L24_215 = L24_215.insert
    L25_216 = crontabTable
    L26_217 = L12_203
    L24_215 = L24_215(L25_216, L26_217)
    L19_210 = L24_215
    if L19_210 then
      L24_215 = db
      L24_215 = L24_215.insert
      L25_216 = crontabTable
      L26_217 = L13_204
      L24_215 = L24_215(L25_216, L26_217)
      L19_210 = L24_215
    end
  else
    L19_210 = true
  end
  L24_215 = UNIT_NAME
  if L24_215 ~= "DSR-1000AC" then
    L24_215 = UNIT_NAME
  else
    if L24_215 == "DSR-500AC" then
      L24_215 = "1"
      L25_216 = UNIT_NAME
      if L25_216 == "DSR-1000AC" then
        L25_216 = db
        L25_216 = L25_216.getAttribute
        L26_217 = profileTable
        L27_218 = _UPVALUE0_
        L27_218 = L27_218.profileName
        L25_216 = L25_216(L26_217, L27_218, L28_219, _UPVALUE0_.radioMode)
        if L25_216 == "a" then
          L24_215 = "1"
        elseif L25_216 == "b" then
          L24_215 = "2"
        elseif L25_216 == "dual" then
          L24_215 = "dual"
        end
      end
      if L24_215 ~= "dual" then
        L25_216 = db
        L25_216 = L25_216.existsRowWhere
        L26_217 = dot11InterfaceTable
        L27_218 = "vapName = 'unused' and radioNo='"
        L27_218 = L27_218 .. L28_219 .. "'"
        L25_216 = L25_216(L26_217, L27_218)
        L26_217 = {}
        L27_218 = db
        L27_218 = L27_218.getRowsWhere
        L27_218 = L27_218(L28_219, "vapName = '" .. A0_191 .. "'")
        if L27_218 then
          if L28_219 == 0 then
            L26_217[L28_219] = A0_191
            L19_210 = L28_219
          end
        else
          L19_210 = L28_219.FALSE
        end
      else
        L25_216 = db
        L25_216 = L25_216.existsRowWhere
        L26_217 = dot11InterfaceTable
        L27_218 = "vapName = 'unused' and radioNo='1'"
        L25_216 = L25_216(L26_217, L27_218)
        L26_217 = {}
        if L25_216 then
          L27_218 = dot11InterfaceTable
          L27_218 = L27_218 .. L28_219 .. _UPVALUE0_.apName
          L26_217[L27_218] = A0_191
          L27_218 = db
          L27_218 = L27_218.setAttribute
          L27_218 = L27_218(L28_219, _UPVALUE0_.ROW_ID, L25_216, _UPVALUE0_.apName, L26_217[dot11InterfaceTable .. "." .. _UPVALUE0_.apName])
          L19_210 = L27_218
        else
          L27_218 = _UPVALUE2_
          L19_210 = L27_218.FALSE
        end
        L27_218 = db
        L27_218 = L27_218.existsRowWhere
        L27_218 = L27_218(L28_219, "vapName = 'unused' and radioNo='2'")
        if L27_218 then
          L28_219[dot11InterfaceTable .. "." .. _UPVALUE0_.apName] = A0_191
          L19_210 = db.setAttribute(dot11InterfaceTable, _UPVALUE0_.ROW_ID, L27_218, _UPVALUE0_.apName, L28_219[dot11InterfaceTable .. "." .. _UPVALUE0_.apName])
        else
          L19_210 = _UPVALUE2_.FALSE
        end
      end
      L25_216 = L24_215
      L26_217 = UNIT_NAME
      if L26_217 == "DSR-1000AC" then
        if L24_215 ~= "dual" then
          L25_216 = L24_215
        else
          L25_216 = "1,2"
        end
      end
      L26_217 = accesspointsTable
      L27_218 = "."
      L26_217 = L26_217 .. L27_218 .. L28_219
      L11_202[L26_217] = L25_216
  end
  else
    L24_215 = db
    L24_215 = L24_215.existsRowWhere
    L25_216 = dot11InterfaceTable
    L26_217 = "vapName = 'unused'"
    L24_215 = L24_215(L25_216, L26_217)
    L25_216 = {}
    L26_217 = db
    L26_217 = L26_217.getRowsWhere
    L27_218 = dot11InterfaceTable
    L26_217 = L26_217(L27_218, L28_219)
    if L26_217 then
      L27_218 = #L26_217
      if L27_218 == 0 then
        L27_218 = dot11InterfaceTable
        L27_218 = L27_218 .. L28_219 .. _UPVALUE0_.apName
        L25_216[L27_218] = A0_191
        L27_218 = db
        L27_218 = L27_218.setAttribute
        L27_218 = L27_218(L28_219, _UPVALUE0_.ROW_ID, L24_215, _UPVALUE0_.apName, L25_216[dot11InterfaceTable .. "." .. _UPVALUE0_.apName])
        L19_210 = L27_218
      end
    else
      L27_218 = _UPVALUE2_
      L19_210 = L27_218.FALSE
    end
  end
  L24_215 = db
  L24_215 = L24_215.getRow
  L25_216 = radioTable
  L26_217 = "rowid"
  L27_218 = 1
  L24_215 = L24_215(L25_216, L26_217, L27_218)
  L25_216 = db
  L25_216 = L25_216.getRow
  L26_217 = radionTable
  L27_218 = "rowid"
  L25_216 = L25_216(L26_217, L27_218, L28_219)
  L26_217 = accesspointsTable
  L27_218 = "."
  L26_217 = L26_217 .. L27_218 .. L28_219
  L26_217 = L11_202[L26_217]
  if not L26_217 then
    L26_217 = accesspointsTable
    L27_218 = "."
    L26_217 = L26_217 .. L27_218 .. L28_219
    L27_218 = radioTable
    L27_218 = L27_218 .. L28_219 .. _UPVALUE0_.txPower
    L27_218 = L24_215[L27_218]
    L11_202[L26_217] = L27_218
  end
  L26_217 = accesspointsTable
  L27_218 = "."
  L26_217 = L26_217 .. L27_218 .. L28_219
  L26_217 = L11_202[L26_217]
  if not L26_217 then
    L26_217 = accesspointsTable
    L27_218 = "."
    L26_217 = L26_217 .. L27_218 .. L28_219
    L27_218 = radioTable
    L27_218 = L27_218 .. L28_219 .. _UPVALUE0_.txRate
    L27_218 = L24_215[L27_218]
    L11_202[L26_217] = L27_218
  end
  L26_217 = accesspointsTable
  L27_218 = "."
  L26_217 = L26_217 .. L27_218 .. L28_219
  L26_217 = L11_202[L26_217]
  if not L26_217 then
    L26_217 = accesspointsTable
    L27_218 = "."
    L26_217 = L26_217 .. L27_218 .. L28_219
    L27_218 = L25_216["dot11Radio11n.puren"]
    L11_202[L26_217] = L27_218
  end
  if L19_210 then
    L26_217 = db
    L26_217 = L26_217.insert
    L27_218 = accesspointsTable
    L26_217 = L26_217(L27_218, L28_219)
    L19_210 = L26_217
  end
  if L19_210 then
    L26_217 = accesspointsTable
    L27_218 = "."
    L26_217 = L26_217 .. L27_218 .. L28_219
    L26_217 = L11_202[L26_217]
    if L26_217 == "1" then
      L26_217 = vapPortEnableSet
      L27_218 = accesspointsTable
      L27_218 = L27_218 .. L28_219 .. _UPVALUE0_.apName
      L27_218 = L11_202[L27_218]
      L26_217 = L26_217(L27_218, L28_219)
      L19_210 = L26_217
    else
      L26_217 = accesspointsTable
      L27_218 = "."
      L26_217 = L26_217 .. L27_218 .. L28_219
      L26_217 = L11_202[L26_217]
      if L26_217 == "0" then
        L26_217 = vapPortEnableSet
        L27_218 = accesspointsTable
        L27_218 = L27_218 .. L28_219 .. _UPVALUE0_.apName
        L27_218 = L11_202[L27_218]
        L26_217 = L26_217(L27_218, L28_219)
        L19_210 = L26_217
      end
    end
  end
  L26_217 = db
  L26_217 = L26_217.getAttribute
  L27_218 = profileTable
  L26_217 = L26_217(L27_218, L28_219, L11_202[accesspointsTable .. "." .. _UPVALUE0_.profileName], _UPVALUE0_.ssid)
  L27_218 = db
  L27_218 = L27_218.getRowsWithJoin
  L27_218 = L27_218(L28_219, dot11InterfaceTable .. "." .. _UPVALUE0_.apName, L11_202[accesspointsTable .. "." .. _UPVALUE0_.apName])
  for _FORV_31_, _FORV_32_ in L28_219(L27_218) do
    L19_210 = L19_210 and db.setAttributeWhere(portMgmtTable, "PhyInterfaceName='" .. _FORV_32_[dot11InterfaceTable .. "." .. _UPVALUE0_.interfaceName] .. "'", "PortName", L26_217)
  end
  if L11_202[accesspointsTable .. "." .. _UPVALUE0_.vapEnabled] == "1" then
    L19_210 = vlanPeerSSIDSet(L11_202[accesspointsTable .. "." .. _UPVALUE0_.apName], L28_219, _UPVALUE0_.bridge)
  elseif L11_202[accesspointsTable .. "." .. _UPVALUE0_.vapEnabled] == "0" then
    L19_210 = vlanPeerSSIDSet(L11_202[accesspointsTable .. "." .. _UPVALUE0_.apName], L28_219, _UPVALUE0_.vapDisabled)
  end
  if L19_210 then
    return _UPVALUE2_.SUCCESS
  else
    return _UPVALUE2_.FAILURE
  end
end
function accessPointDelete(A0_220)
  local L1_221, L2_222, L3_223, L4_224, L5_225, L6_226, L7_227, L8_228, L9_229, L10_230, L11_231, L12_232, L13_233, L14_234, L15_235, L16_236, L17_237, L18_238
  L1_221 = true
  L2_222 = {}
  L3_223 = db
  L3_223 = L3_223.getAttribute
  L4_224 = accesspointsTable
  L5_225 = accesspointsTable
  L6_226 = "."
  L7_227 = _UPVALUE0_
  L7_227 = L7_227.ROW_ID
  L5_225 = L5_225 .. L6_226 .. L7_227
  L6_226 = A0_220
  L7_227 = _UPVALUE0_
  L7_227 = L7_227.apName
  L3_223 = L3_223(L4_224, L5_225, L6_226, L7_227)
  L4_224 = db
  L4_224 = L4_224.getRow
  L5_225 = accesspointsTable
  L6_226 = accesspointsTable
  L7_227 = "."
  L8_228 = _UPVALUE0_
  L8_228 = L8_228.ROW_ID
  L6_226 = L6_226 .. L7_227 .. L8_228
  L7_227 = A0_220
  L4_224 = L4_224(L5_225, L6_226, L7_227)
  L5_225 = accesspointsTable
  L6_226 = "."
  L7_227 = _UPVALUE0_
  L7_227 = L7_227.profileName
  L5_225 = L5_225 .. L6_226 .. L7_227
  L5_225 = L4_224[L5_225]
  L6_226 = db
  L6_226 = L6_226.getAttribute
  L7_227 = dot11InterfaceTable
  L8_228 = _UPVALUE0_
  L8_228 = L8_228.apName
  L9_229 = L3_223
  L10_230 = _UPVALUE0_
  L10_230 = L10_230.interfaceName
  L6_226 = L6_226(L7_227, L8_228, L9_229, L10_230)
  L7_227 = db
  L7_227 = L7_227.getAttribute
  L8_228 = profileTable
  L9_229 = _UPVALUE0_
  L9_229 = L9_229.profileName
  L10_230 = L5_225
  L7_227 = L7_227(L8_228, L9_229, L10_230, L11_231)
  L8_228 = UNIT_NAME
  if L8_228 == "DSR-1000AC" then
    if L7_227 == "dual" then
      L8_228 = "radioNo = '1' and vapName = '"
      L9_229 = L3_223
      L10_230 = "'"
      L8_228 = L8_228 .. L9_229 .. L10_230
      L9_229 = "radioNo = '2' and vapName = '"
      L10_230 = L3_223
      L9_229 = L9_229 .. L10_230 .. L11_231
      L10_230 = db
      L10_230 = L10_230.getAttributeWhere
      L10_230 = L10_230(L11_231, L12_232, L13_233)
      if L10_230 == "vap0" or L10_230 == "vap4" then
        if L10_230 == "vap0" then
          L7_227 = "a"
        elseif L10_230 == "vap4" then
          L7_227 = "b"
        end
        if L11_231 == L12_232 then
          return L12_232
        end
        if L12_232 == 1 then
          return L12_232
        end
      end
      if L11_231 == "vap0" or L11_231 == "vap4" then
        if L11_231 == "vap0" then
          L7_227 = "a"
        elseif L11_231 == "vap4" then
          L7_227 = "b"
        end
        if L12_232 == L13_233 then
          return L13_233
        end
        if L13_233 == 1 then
          return L13_233
        end
      end
    end
    if L6_226 == "vap0" or L6_226 == "vap4" then
      L8_228 = db
      L8_228 = L8_228.getAttribute
      L9_229 = radioTable
      L10_230 = _UPVALUE0_
      L10_230 = L10_230.band
      L8_228 = L8_228(L9_229, L10_230, L11_231, L12_232)
      L9_229 = _UPVALUE1_
      L9_229 = L9_229.NIL
      if L8_228 == L9_229 then
        L9_229 = _UPVALUE1_
        L9_229 = L9_229.FAILURE
        return L9_229
      end
      if L6_226 == "vap0" and L7_227 == "a" then
        L9_229 = tonumber
        L10_230 = L8_228
        L9_229 = L9_229(L10_230)
        if L9_229 == 1 then
          L9_229 = _UPVALUE2_
          L9_229 = L9_229.VAP_IS_INUSE_BY_WDS
          return L9_229
        end
      end
      if L6_226 == "vap4" and L7_227 == "b" then
        L9_229 = tonumber
        L10_230 = L8_228
        L9_229 = L9_229(L10_230)
        if L9_229 == 1 then
          L9_229 = _UPVALUE2_
          L9_229 = L9_229.VAP_IS_INUSE_BY_WDS
          return L9_229
        end
      end
    end
  end
  L8_228 = _UPVALUE3_
  if L3_223 ~= L8_228 then
    L8_228 = _UPVALUE4_
    if L3_223 == L8_228 then
      L8_228 = UNIT_NAME
    end
  elseif L8_228 == "DSR-1000AC" then
    L8_228 = _UPVALUE1_
    L8_228 = L8_228.SUCCESS
    return L8_228
  end
  L8_228 = accesspointsTable
  L9_229 = "."
  L10_230 = _UPVALUE0_
  L10_230 = L10_230.apName
  L8_228 = L8_228 .. L9_229 .. L10_230
  L8_228 = L4_224[L8_228]
  L9_229 = db
  L9_229 = L9_229.getRow
  L10_230 = dot11WPSTable
  L9_229 = L9_229(L10_230, L11_231, L12_232)
  if L9_229 ~= nil then
    L10_230 = dot11WPSTable
    L10_230 = L10_230 .. L11_231 .. L12_232
    L10_230 = L9_229[L10_230]
    if L10_230 == "1" then
      L10_230 = _UPVALUE2_
      L10_230 = L10_230.VAP_IS_INUSE_BY_WPS
      return L10_230
    end
  end
  L10_230 = db
  L10_230 = L10_230.getRows
  L10_230 = L10_230(L11_231, L12_232, L13_233)
  for L14_234, L15_235 in L11_231(L12_232) do
    L17_237 = db
    L17_237 = L17_237.getAttribute
    L18_238 = dot11ACLTable
    L17_237 = L17_237(L18_238, _UPVALUE0_.macAddress, L15_235[dot11ACLTable .. "." .. _UPVALUE0_.macAddress], "rowid")
    L18_238 = dot11ACLTable
    L18_238 = L18_238 .. "." .. _UPVALUE0_.ROW_ID
    L16_236[L18_238] = L17_237
    L18_238 = db
    L18_238 = L18_238.delete
    L18_238 = L18_238(dot11ACLTable, L16_236)
    L1_221 = L18_238
    if not L1_221 then
      break
    end
  end
  if not L4_224 then
    return L11_231
  end
  L1_221 = L12_232
  L1_221 = L1_221 and L12_232
  if L13_233 ~= "DSR-1000AC" then
  else
    if L13_233 == "DSR-500AC" then
      L17_237 = "."
      L18_238 = _UPVALUE0_
      L18_238 = L18_238.apName
      L17_237 = "'"
      for L17_237, L18_238 in L14_234(L15_235) do
        L12_232[dot11InterfaceTable .. "." .. _UPVALUE0_.apName] = "unused"
        db.setAttribute(dot11InterfaceTable, _UPVALUE0_.ROW_ID, L13_233[L17_237][dot11InterfaceTable .. "._ROWID_"], _UPVALUE0_.apName, L12_232[dot11InterfaceTable .. "." .. _UPVALUE0_.apName])
        table.insert(L2_222, L13_233[L17_237][accesspointsTable .. "." .. _UPVALUE0_.vlanId])
        db.deleteRowWhere(crontabTable, "command LIKE '/pfrm2.0/bin/ActivePointScheduler.sh " .. L8_228 .. "%'")
        db.deleteRowWhere(crontabTable, "command LIKE '/pfrm2.0/bin/stopStartVapInstance.sh _ " .. L8_228 .. "'")
      end
  end
  else
    L17_237 = "."
    L18_238 = _UPVALUE0_
    L18_238 = L18_238.apName
    L17_237 = "'"
    L12_232[L14_234] = "unused"
    L17_237 = L13_233
    L18_238 = _UPVALUE0_
    L18_238 = L18_238.apName
    L14_234(L15_235, L16_236, L17_237, L18_238, L12_232[dot11InterfaceTable .. "." .. _UPVALUE0_.apName])
    L17_237 = "."
    L18_238 = _UPVALUE0_
    L18_238 = L18_238.vlanId
    L14_234(L15_235, L16_236)
    L17_237 = L8_228
    L18_238 = "%'"
    L14_234(L15_235, L16_236)
    L17_237 = L8_228
    L18_238 = "'"
    L14_234(L15_235, L16_236)
  end
  if L1_221 then
    L13_233[L14_234] = A0_220
    L17_237 = A0_220
    L1_221 = L14_234
  end
  if L1_221 then
    for L16_236, L17_237 in L13_233(L14_234) do
      L18_238 = {}
      L18_238["vlan.vlanId"] = L17_237
      L1_221 = db.delete(vlanTable, L18_238)
      if not L1_221 then
        break
      end
    end
  end
  if L1_221 then
    return L13_233
  else
    return L13_233
  end
end
function vapPortEnableSet(A0_239, A1_240)
  local L2_241, L3_242, L4_243, L5_244, L6_245, L7_246, L8_247, L9_248, L10_249, L11_250
  L2_241 = true
  if A1_240 then
    L3_242 = "1"
    enStr = L3_242
  else
    L3_242 = "0"
    enStr = L3_242
  end
  L3_242 = db
  L3_242 = L3_242.getRowsWithJoin
  L7_246 = dot11InterfaceTable
  L8_247 = ":"
  L9_248 = _UPVALUE0_
  L9_248 = L9_248.apName
  L7_246 = _UPVALUE0_
  L7_246 = L7_246.apName
  L3_242 = L3_242(L4_243, L5_244, L6_245)
  for L7_246, L8_247 in L4_243(L5_244) do
    if L2_241 then
      L9_248 = dot11InterfaceTable
      L10_249 = "."
      L11_250 = _UPVALUE0_
      L11_250 = L11_250.interfaceName
      L9_248 = L9_248 .. L10_249 .. L11_250
      L9_248 = L8_247[L9_248]
      L10_249 = db
      L10_249 = L10_249.getAttribute
      L11_250 = bridgePortsTable
      L10_249 = L10_249(L11_250, _UPVALUE0_.interfaceName, L9_248, "rowid")
      L11_250 = {}
      L11_250[bridgePortsTable .. "." .. _UPVALUE0_.portEnabled] = enStr
      L2_241 = db.update(bridgePortsTable, L11_250, L10_249)
    end
  end
  return L2_241
end
function vlanPeerSSIDSet(A0_251, A1_252, A2_253)
  local L3_254, L4_255
  L3_254 = true
  L4_255 = enable
  if L4_255 then
    L4_255 = "1"
    enStr = L4_255
  else
    L4_255 = "0"
    enStr = L4_255
  end
  L4_255 = db
  L4_255 = L4_255.getRowsWithJoin
  L4_255 = L4_255({
    accesspointsTable .. ":" .. dot11InterfaceTable .. ":" .. _UPVALUE0_.apName
  }, accesspointsTable .. "." .. _UPVALUE0_.apName, A0_251)
  for _FORV_8_, _FORV_9_ in pairs(L4_255) do
    L3_254 = L3_254 and db.setAttributeWhere(portMgmtTable, "portName='" .. A1_252 .. "' AND PhyInterfaceName='" .. _FORV_9_[dot11InterfaceTable .. "." .. _UPVALUE0_.interfaceName] .. "'", "PortType", A2_253)
  end
  return L3_254
end
function accessPointEnable(A0_256)
  local L1_257, L2_258, L3_259
  L1_257 = _UPVALUE0_
  L1_257 = L1_257.ERROR
  L2_258 = "/pfrm2.0/bin/stopStartVapInstance.sh %d %s"
  L3_259 = "0"
  vapName = db.getRow(accesspointsTable, accesspointsTable .. "." .. _UPVALUE1_.ROW_ID, A0_256)[accesspointsTable .. "." .. _UPVALUE1_.apName]
  strCmd = string.format(L2_258, 1, vapName)
  stpCmd = string.format(L2_258, 0, vapName)
  strHr = tonumber(db.getAttribute(crontabTable, _UPVALUE1_.command, strCmd, _UPVALUE1_.hour))
  if strHr then
    strMin = db.getAttribute(crontabTable, _UPVALUE1_.command, strCmd, _UPVALUE1_.minute)
    stpHr = db.getAttribute(crontabTable, _UPVALUE1_.command, stpCmd, _UPVALUE1_.hour)
    stpMin = db.getAttribute(crontabTable, _UPVALUE1_.command, stpCmd, _UPVALUE1_.minute)
    curHr = tonumber(os.date("%H"))
    curMin = tonumber(os.date("%M"))
    curMins = curHr * 60 + curMin
    setStrMins = strHr * 60 + strMin
    setStpMins = stpHr * 60 + stpMin
    if curMins < setStrMins or curMins > setStpMins then
      L1_257 = _UPVALUE2_.AP_NAME_ENABLE_ERR
    end
  end
  if "1" == "0" then
    errorFlag, statusCode = vapEnableSet(A0_256, true)
  end
  if errorFlag == _UPVALUE0_.SUCCESS then
    L1_257 = _UPVALUE0_.SUCCESS
    return L1_257
  else
    return L1_257
  end
end
function accessPointEnableAll(A0_260)
  local L1_261, L2_262, L3_263, L4_264, L5_265, L6_266
  L1_261 = _UPVALUE0_
  L1_261 = L1_261.FAILURE
  for L5_265, L6_266 in L2_262(L3_263) do
    L1_261 = accessPointEnable(L6_266)
    if L1_261 == _UPVALUE0_.FAILURE then
      return L1_261
    end
  end
  L1_261 = L2_262.SUCCESS
  return L1_261
end
function accessPointDisable(A0_267)
  local L1_268, L2_269, L3_270, L4_271, L5_272, L6_273, L7_274, L8_275, L9_276, L10_277, L11_278, L12_279, L13_280, L14_281
  L1_268 = _UPVALUE0_
  L1_268 = L1_268.ERROR
  L2_269 = "/pfrm2.0/bin/stopStartVapInstance.sh %d %s"
  L3_270 = "0"
  L4_271 = "0"
  L5_272 = db
  L5_272 = L5_272.getRow
  L6_273 = accesspointsTable
  L7_274 = accesspointsTable
  L8_275 = "."
  L9_276 = _UPVALUE1_
  L9_276 = L9_276.ROW_ID
  L7_274 = L7_274 .. L8_275 .. L9_276
  L8_275 = A0_267
  L5_272 = L5_272(L6_273, L7_274, L8_275)
  L6_273 = accesspointsTable
  L7_274 = "."
  L8_275 = _UPVALUE1_
  L8_275 = L8_275.apName
  L6_273 = L6_273 .. L7_274 .. L8_275
  L6_273 = L5_272[L6_273]
  L7_274 = accesspointsTable
  L8_275 = "."
  L9_276 = _UPVALUE1_
  L9_276 = L9_276.profileName
  L7_274 = L7_274 .. L8_275 .. L9_276
  L7_274 = L5_272[L7_274]
  L8_275 = db
  L8_275 = L8_275.getAttribute
  L9_276 = dot11InterfaceTable
  L10_277 = _UPVALUE1_
  L10_277 = L10_277.apName
  L11_278 = L6_273
  L12_279 = _UPVALUE1_
  L12_279 = L12_279.interfaceName
  L8_275 = L8_275(L9_276, L10_277, L11_278, L12_279)
  L9_276 = db
  L9_276 = L9_276.getAttribute
  L10_277 = profileTable
  L11_278 = _UPVALUE1_
  L11_278 = L11_278.profileName
  L12_279 = L7_274
  L13_280 = _UPVALUE1_
  L13_280 = L13_280.radioMode
  L9_276 = L9_276(L10_277, L11_278, L12_279, L13_280)
  L10_277 = UNIT_NAME
  if L10_277 == "DSR-1000AC" then
    if L9_276 == "dual" then
      L10_277 = "radioNo = '1' and vapName = '"
      L11_278 = L6_273
      L12_279 = "'"
      L10_277 = L10_277 .. L11_278 .. L12_279
      L11_278 = "radioNo = '2' and vapName = '"
      L12_279 = L6_273
      L13_280 = "'"
      L11_278 = L11_278 .. L12_279 .. L13_280
      L12_279 = db
      L12_279 = L12_279.getAttributeWhere
      L13_280 = dot11InterfaceTable
      L14_281 = L10_277
      L12_279 = L12_279(L13_280, L14_281, _UPVALUE1_.interfaceName)
      if L12_279 == "vap0" or L12_279 == "vap4" then
        if L12_279 == "vap0" then
          L9_276 = "a"
        elseif L12_279 == "vap4" then
          L9_276 = "b"
        end
        L13_280 = db
        L13_280 = L13_280.getAttribute
        L14_281 = radioTable
        L13_280 = L13_280(L14_281, _UPVALUE1_.band, L9_276, _UPVALUE1_.wdsEnabled)
        L14_281 = _UPVALUE0_
        L14_281 = L14_281.NIL
        if L13_280 == L14_281 then
          L14_281 = _UPVALUE0_
          L14_281 = L14_281.FAILURE
          return L14_281
        end
        L14_281 = tonumber
        L14_281 = L14_281(L13_280)
        if L14_281 == 1 then
          L14_281 = _UPVALUE2_
          L14_281 = L14_281.WDS_IS_CONFIGURED_ERR
          return L14_281
        end
      end
      L13_280 = db
      L13_280 = L13_280.getAttributeWhere
      L14_281 = dot11InterfaceTable
      L13_280 = L13_280(L14_281, L11_278, _UPVALUE1_.interfaceName)
      if L13_280 == "vap0" or L13_280 == "vap4" then
        if L13_280 == "vap0" then
          L9_276 = "a"
        elseif L13_280 == "vap4" then
          L9_276 = "b"
        end
        L14_281 = db
        L14_281 = L14_281.getAttribute
        L14_281 = L14_281(radioTable, _UPVALUE1_.band, L9_276, _UPVALUE1_.wdsEnabled)
        if L14_281 == _UPVALUE0_.NIL then
          return _UPVALUE0_.FAILURE
        end
        if tonumber(L14_281) == 1 then
          return _UPVALUE2_.WDS_IS_CONFIGURED_ERR
        end
      end
    end
    if L8_275 == "vap0" or L8_275 == "vap4" then
      L10_277 = db
      L10_277 = L10_277.getAttribute
      L11_278 = radioTable
      L12_279 = _UPVALUE1_
      L12_279 = L12_279.band
      L13_280 = L9_276
      L14_281 = _UPVALUE1_
      L14_281 = L14_281.wdsEnabled
      L10_277 = L10_277(L11_278, L12_279, L13_280, L14_281)
      L11_278 = _UPVALUE0_
      L11_278 = L11_278.NIL
      if L10_277 == L11_278 then
        L11_278 = _UPVALUE0_
        L11_278 = L11_278.FAILURE
        return L11_278
      end
      if L8_275 == "vap0" and L9_276 == "a" then
        L11_278 = tonumber
        L12_279 = L10_277
        L11_278 = L11_278(L12_279)
        if L11_278 == 1 then
          L11_278 = _UPVALUE2_
          L11_278 = L11_278.WDS_IS_CONFIGURED_ERR
          return L11_278
        end
      end
      if L8_275 == "vap4" and L9_276 == "b" then
        L11_278 = tonumber
        L12_279 = L10_277
        L11_278 = L11_278(L12_279)
        if L11_278 == 1 then
          L11_278 = _UPVALUE2_
          L11_278 = L11_278.WDS_IS_CONFIGURED_ERR
          return L11_278
        end
      end
    end
  else
    L10_277 = tonumber
    L11_278 = A0_267
    L10_277 = L10_277(L11_278)
    if L10_277 == 1 then
      L10_277 = db
      L10_277 = L10_277.getAttribute
      L11_278 = radioTable
      L12_279 = _UPVALUE1_
      L12_279 = L12_279.ROW_ID
      L13_280 = A0_267
      L14_281 = _UPVALUE1_
      L14_281 = L14_281.wdsEnabled
      L10_277 = L10_277(L11_278, L12_279, L13_280, L14_281)
      L11_278 = _UPVALUE0_
      L11_278 = L11_278.NIL
      if L10_277 == L11_278 then
        L11_278 = _UPVALUE0_
        L11_278 = L11_278.FAILURE
        return L11_278
      end
      L11_278 = tonumber
      L12_279 = L10_277
      L11_278 = L11_278(L12_279)
      if L11_278 == 1 then
        L11_278 = _UPVALUE2_
        L11_278 = L11_278.WDS_IS_CONFIGURED_ERR
        return L11_278
      end
    end
  end
  L10_277 = db
  L10_277 = L10_277.getRow
  L11_278 = dot11WPSTable
  L12_279 = _UPVALUE1_
  L12_279 = L12_279.apName
  L13_280 = L6_273
  L10_277 = L10_277(L11_278, L12_279, L13_280)
  if L10_277 ~= nil then
    L11_278 = dot11WPSTable
    L12_279 = "."
    L13_280 = _UPVALUE1_
    L13_280 = L13_280.wpsEnabled
    L11_278 = L11_278 .. L12_279 .. L13_280
    L11_278 = L10_277[L11_278]
    if L11_278 == "1" then
      L11_278 = _UPVALUE2_
      L11_278 = L11_278.VAP_IS_INUSE_BY_WPS_ERR1
      return L11_278
    end
  end
  L11_278 = string
  L11_278 = L11_278.format
  L12_279 = L2_269
  L13_280 = 1
  L14_281 = L6_273
  L11_278 = L11_278(L12_279, L13_280, L14_281)
  strCmd = L11_278
  L11_278 = string
  L11_278 = L11_278.format
  L12_279 = L2_269
  L13_280 = 0
  L14_281 = L6_273
  L11_278 = L11_278(L12_279, L13_280, L14_281)
  stpCmd = L11_278
  L11_278 = db
  L11_278 = L11_278.getAttribute
  L12_279 = crontabTable
  L13_280 = _UPVALUE1_
  L13_280 = L13_280.command
  L14_281 = strCmd
  L11_278 = L11_278(L12_279, L13_280, L14_281, _UPVALUE1_.hour)
  strHr = L11_278
  L11_278 = strHr
  if L11_278 then
    L11_278 = db
    L11_278 = L11_278.getAttribute
    L12_279 = crontabTable
    L13_280 = _UPVALUE1_
    L13_280 = L13_280.command
    L14_281 = strCmd
    L11_278 = L11_278(L12_279, L13_280, L14_281, _UPVALUE1_.minute)
    strMin = L11_278
    L11_278 = db
    L11_278 = L11_278.getAttribute
    L12_279 = crontabTable
    L13_280 = _UPVALUE1_
    L13_280 = L13_280.command
    L14_281 = stpCmd
    L11_278 = L11_278(L12_279, L13_280, L14_281, _UPVALUE1_.hour)
    stpHr = L11_278
    L11_278 = db
    L11_278 = L11_278.getAttribute
    L12_279 = crontabTable
    L13_280 = _UPVALUE1_
    L13_280 = L13_280.command
    L14_281 = stpCmd
    L11_278 = L11_278(L12_279, L13_280, L14_281, _UPVALUE1_.minute)
    stpMin = L11_278
    L11_278 = tonumber
    L12_279 = os
    L12_279 = L12_279.date
    L13_280 = "%H"
    L14_281 = L12_279(L13_280)
    L11_278 = L11_278(L12_279, L13_280, L14_281, L12_279(L13_280))
    curHr = L11_278
    L11_278 = tonumber
    L12_279 = os
    L12_279 = L12_279.date
    L13_280 = "%M"
    L14_281 = L12_279(L13_280)
    L11_278 = L11_278(L12_279, L13_280, L14_281, L12_279(L13_280))
    curMin = L11_278
    L11_278 = curHr
    L11_278 = L11_278 * 60
    L12_279 = curMin
    L11_278 = L11_278 + L12_279
    curMins = L11_278
    L11_278 = strHr
    L11_278 = L11_278 * 60
    L12_279 = strMin
    L11_278 = L11_278 + L12_279
    setStrMins = L11_278
    L11_278 = stpHr
    L11_278 = L11_278 * 60
    L12_279 = stpMin
    L11_278 = L11_278 + L12_279
    setStpMins = L11_278
    L11_278 = curMins
    L12_279 = setStrMins
    if L11_278 > L12_279 then
      L11_278 = curMins
      L12_279 = setStpMins
      if L11_278 < L12_279 then
        L11_278 = _UPVALUE2_
        L1_268 = L11_278.AP_NAME_DISABLE_ERR
        L3_270 = "1"
      end
    end
  end
  if L3_270 == "0" then
    L11_278 = vapEnableSet
    L12_279 = A0_267
    L13_280 = _UPVALUE0_
    L13_280 = L13_280.FALSE
    L12_279 = L11_278(L12_279, L13_280)
    statusCode = L12_279
    errorFlag = L11_278
  end
  L11_278 = errorFlag
  L12_279 = _UPVALUE0_
  L12_279 = L12_279.SUCCESS
  if L11_278 == L12_279 then
    L11_278 = _UPVALUE0_
    L1_268 = L11_278.SUCCESS
    return L1_268
  else
    return L1_268
  end
end
function accessPointDisableAll(A0_282)
  local L1_283, L2_284, L3_285, L4_286, L5_287, L6_288, L7_289
  L1_283 = _UPVALUE0_
  L1_283 = L1_283.FAILURE
  L2_284 = _UPVALUE0_
  L2_284 = L2_284.NIL
  for L6_288, L7_289 in L3_285(L4_286) do
    L1_283 = accessPointDisable(L7_289)
    if L1_283 ~= _UPVALUE0_.SUCCESS then
      return L1_283
    end
  end
  L1_283 = L3_285.SUCCESS
  return L1_283
end
function vapEnableSet(A0_290, A1_291)
  local L2_292, L3_293, L4_294, L5_295
  L2_292 = _UPVALUE0_
  L2_292 = L2_292.FALSE
  L3_293 = ""
  if A1_291 then
    L3_293 = "1"
  else
    L3_293 = "0"
  end
  L4_294 = db
  L4_294 = L4_294.getRow
  L5_295 = accesspointsTable
  L4_294 = L4_294(L5_295, accesspointsTable .. "." .. _UPVALUE1_.ROW_ID, A0_290)
  if not A1_291 then
    L5_295 = db
    L5_295 = L5_295.getAttribute
    L5_295 = L5_295(profileTable, _UPVALUE1_.profileName, L4_294[accesspointsTable .. "." .. _UPVALUE1_.profileName], _UPVALUE1_.ssid)
    L2_292 = vlanPeerSSIDSet(L4_294[accesspointsTable .. "." .. _UPVALUE1_.apName], L5_295, _UPVALUE1_.vapDisabled)
    L2_292 = L2_292 and vapPortEnableSet(L4_294[accesspointsTable .. "." .. _UPVALUE1_.apName], _UPVALUE0_.FALSE)
    L2_292 = L2_292 and db.setAttribute(accesspointsTable, _UPVALUE1_.ROW_ID, A0_290, _UPVALUE1_.vapEnabled, L3_293)
  end
  if A1_291 then
    L5_295 = db
    L5_295 = L5_295.setAttribute
    L5_295 = L5_295(accesspointsTable, _UPVALUE1_.ROW_ID, A0_290, _UPVALUE1_.vapEnabled, L3_293)
    L2_292 = L5_295
    if L2_292 then
      L5_295 = vapPortEnableSet
      L5_295 = L5_295(L4_294[accesspointsTable .. "." .. _UPVALUE1_.apName], true)
      L2_292 = L5_295
    end
    L5_295 = db
    L5_295 = L5_295.getAttribute
    L5_295 = L5_295(profileTable, _UPVALUE1_.profileName, L4_294[accesspointsTable .. "." .. _UPVALUE1_.profileName], _UPVALUE1_.ssid)
    L2_292 = L2_292 and vlanPeerSSIDSet(L4_294[accesspointsTable .. "." .. _UPVALUE1_.apName], L5_295, _UPVALUE1_.bridge)
  end
  if L2_292 then
    L5_295 = _UPVALUE0_
    L5_295 = L5_295.SUCCESS
    return L5_295
  else
    L5_295 = _UPVALUE0_
    L5_295 = L5_295.FAILURE
    return L5_295
  end
end
function accessPointGetCur(A0_296)
  local L1_297, L2_298, L3_299, L4_300, L5_301, L6_302, L7_303, L8_304, L9_305, L10_306, L11_307, L12_308, L13_309, L14_310
  L12_308 = db
  L12_308 = L12_308.getRow
  L13_309 = accesspointsTable
  L14_310 = _UPVALUE0_
  L14_310 = L14_310.ROW_ID
  L12_308 = L12_308(L13_309, L14_310, A0_296)
  L13_309 = db
  L13_309 = L13_309.getAttribute
  L14_310 = accesspointsTable
  L13_309 = L13_309(L14_310, _UPVALUE0_.ROW_ID, A0_296, _UPVALUE0_.apName)
  L13_309 = L13_309 or ""
  L14_310 = "/pfrm2.0/bin/stopStartVapInstance.sh %d %s"
  if db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_309 .. "'")[1] == nil then
    ({})[crontabTable .. "." .. _UPVALUE0_.startHour] = ""
    ;({})[crontabTable .. "." .. _UPVALUE0_.startMinute] = ""
    ;({})[crontabTable .. "." .. _UPVALUE0_.startMeridian] = ""
    ;({})[crontabTable .. "." .. _UPVALUE0_.unit] = "0"
  else
    if db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_309 .. "'")[1][crontabTable .. "." .. _UPVALUE0_.command] == string.format(L14_310, 1, L13_309) then
      ({})[crontabTable .. "." .. _UPVALUE0_.scheduleControl] = "0"
    else
      ({})[crontabTable .. "." .. _UPVALUE0_.scheduleControl] = "1"
    end
    ;({})[crontabTable .. "." .. _UPVALUE0_.unit] = db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_309 .. "'")[1][crontabTable .. "." .. _UPVALUE0_.unit]
    if tonumber(db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_309 .. "'")[1][crontabTable .. "." .. _UPVALUE0_.hour]) == 0 then
      ({})[crontabTable .. "." .. _UPVALUE0_.startMeridian] = "0"
      ;({})[crontabTable .. "." .. _UPVALUE0_.startHour] = "12"
    elseif tonumber(db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_309 .. "'")[1][crontabTable .. "." .. _UPVALUE0_.hour]) > 12 then
      ({})[crontabTable .. "." .. _UPVALUE0_.startMeridian] = "1"
      ;({})[crontabTable .. "." .. _UPVALUE0_.startHour] = tonumber(db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_309 .. "'")[1][crontabTable .. "." .. _UPVALUE0_.hour]) - 12
    elseif tonumber(db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_309 .. "'")[1][crontabTable .. "." .. _UPVALUE0_.hour]) == 12 then
      ({})[crontabTable .. "." .. _UPVALUE0_.startMeridian] = "1"
      ;({})[crontabTable .. "." .. _UPVALUE0_.startHour] = "12"
    else
      ({})[crontabTable .. "." .. _UPVALUE0_.startHour] = db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_309 .. "'")[1][crontabTable .. "." .. _UPVALUE0_.hour]
      ;({})[crontabTable .. "." .. _UPVALUE0_.startMeridian] = "0"
    end
    ;({})[crontabTable .. "." .. _UPVALUE0_.startMinute] = db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_309 .. "'")[1][crontabTable .. "." .. _UPVALUE0_.minute]
  end
  if db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_309 .. "'")[2] == nil then
    ({})[crontabTable .. "." .. _UPVALUE0_.stopHour] = ""
    ;({})[crontabTable .. "." .. _UPVALUE0_.stopMinute] = ""
    ;({})[crontabTable .. "." .. _UPVALUE0_.stopMeridian] = ""
    ;({})[crontabTable .. "." .. _UPVALUE0_.unit] = "0"
  else
    ({})[crontabTable .. "." .. _UPVALUE0_.unit] = db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_309 .. "'")[2][crontabTable .. "." .. _UPVALUE0_.unit]
    if tonumber(db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_309 .. "'")[2][crontabTable .. "." .. _UPVALUE0_.hour]) == 0 then
      ({})[crontabTable .. "." .. _UPVALUE0_.stopMeridian] = "0"
      ;({})[crontabTable .. "." .. _UPVALUE0_.stopHour] = "12"
    elseif tonumber(db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_309 .. "'")[2][crontabTable .. "." .. _UPVALUE0_.hour]) > 12 then
      ({})[crontabTable .. "." .. _UPVALUE0_.stopMeridian] = "1"
      ;({})[crontabTable .. "." .. _UPVALUE0_.stopHour] = tonumber(db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_309 .. "'")[2][crontabTable .. "." .. _UPVALUE0_.hour]) - 12
    elseif tonumber(db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_309 .. "'")[2][crontabTable .. "." .. _UPVALUE0_.hour]) == 12 then
      ({})[crontabTable .. "." .. _UPVALUE0_.stopMeridian] = "1"
      ;({})[crontabTable .. "." .. _UPVALUE0_.stopHour] = "12"
    else
      ({})[crontabTable .. "." .. _UPVALUE0_.stopHour] = db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_309 .. "'")[2][crontabTable .. "." .. _UPVALUE0_.hour]
      ;({})[crontabTable .. "." .. _UPVALUE0_.stopMeridian] = "0"
    end
    ;({})[crontabTable .. "." .. _UPVALUE0_.stopMinute] = db.getRowsWhere(crontabTable, "command like '%stopStartVapInstance.sh%" .. L13_309 .. "'")[2][crontabTable .. "." .. _UPVALUE0_.minute]
  end
  L1_297 = L12_308[accesspointsTable .. "." .. _UPVALUE0_.apName]
  L2_298 = L12_308[accesspointsTable .. "." .. _UPVALUE0_.profileName]
  L3_299 = ({})[crontabTable .. "." .. _UPVALUE0_.unit]
  L4_300 = ({})[crontabTable .. "." .. _UPVALUE0_.scheduleControl]
  L5_301 = ({})[crontabTable .. "." .. _UPVALUE0_.startHour]
  L6_302 = ({})[crontabTable .. "." .. _UPVALUE0_.startMinute]
  L7_303 = ({})[crontabTable .. "." .. _UPVALUE0_.startMeridian]
  L8_304 = ({})[crontabTable .. "." .. _UPVALUE0_.stopHour]
  L9_305 = ({})[crontabTable .. "." .. _UPVALUE0_.stopMinute]
  L10_306 = ({})[crontabTable .. "." .. _UPVALUE0_.stopMeridian]
  L11_307 = L12_308[accesspointsTable .. "." .. _UPVALUE0_.wlanPartition]
  return _UPVALUE1_.SUCCESS, A0_296, L1_297, L2_298, L3_299, L4_300, L5_301, L6_302, L7_303, L8_304, L9_305, L10_306, L11_307
end
function accessPointDeleteAll()
  local L0_311
  L0_311 = db
  L0_311 = L0_311.getTable
  L0_311 = L0_311(accesspointsTable, _UPVALUE0_.FALSE)
  for _FORV_6_, _FORV_7_ in pairs(L0_311) do
    rowId = L0_311[_FORV_6_][_UPVALUE1_.ROW_ID]
    returnCode = accessPointDelete(rowId)
    if returnCode == _UPVALUE0_.FAILURE then
      return returnCode
    end
  end
  if UNIT_NAME == "DSR-1000AC" and "0" + 1 == "0" + 1 then
    return _UPVALUE4_.DEFAULT_AP_DELETE_ERROR
  end
  return _UPVALUE0_.SUCCESS
end
function accessPointGetAll()
  local L0_312, L1_313, L2_314, L3_315, L4_316, L5_317, L6_318, L7_319, L8_320, L9_321, L10_322, L11_323, L12_324, L13_325, L14_326
  L0_312 = db
  L0_312 = L0_312.getTable
  L1_313 = accesspointsTable
  L2_314 = false
  L0_312 = L0_312(L1_313, L2_314)
  L1_313 = 0
  L2_314, L3_315, L4_316, L5_317, L6_318, L7_319, L8_320, L9_321, L10_322, L11_323, L12_324, L13_325, L14_326 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  for _FORV_18_, _FORV_19_ in pairs(L0_312) do
    L1_313 = L1_313 + 1
    L2_314, L3_315, L4_316, L5_317, L6_318, L7_319, L8_320, L9_321, L10_322, L11_323, L12_324, L13_325, L14_326 = accessPointGetCur(L0_312[L1_313][_UPVALUE0_.ROW_ID])
    L0_312[L1_313][_UPVALUE0_.apName] = L4_316
    L0_312[L1_313][_UPVALUE0_.profileName] = L5_317
    L0_312[L1_313][_UPVALUE0_.unit] = L6_318
    L0_312[L1_313][_UPVALUE0_.scheduleControl] = L7_319
    L0_312[L1_313][_UPVALUE0_.startHour] = L8_320
    L0_312[L1_313][_UPVALUE0_.startMinute] = L9_321
    L0_312[L1_313][_UPVALUE0_.startMeridian] = L10_322
    L0_312[L1_313][_UPVALUE0_.stopHour] = L11_323
    L0_312[L1_313][_UPVALUE0_.stopMinute] = L12_324
    L0_312[L1_313][_UPVALUE0_.stopMeridian] = L13_325
    L0_312[L1_313][_UPVALUE0_.wlanPartition] = L14_326
    L0_312[L1_313][_UPVALUE0_.ssid] = db.getRow(profileTable, _UPVALUE0_.profileName, L0_312[L1_313][_UPVALUE0_.profileName])[profileTable .. "." .. _UPVALUE0_.ssid]
    L0_312[L1_313][_UPVALUE0_.broadcastSSID] = db.getRow(profileTable, _UPVALUE0_.profileName, L0_312[L1_313][_UPVALUE0_.profileName])[profileTable .. "." .. _UPVALUE0_.broadcastSSID]
  end
  return _UPVALUE1_.SUCCESS, L0_312
end
function accessPointGetDefaults()
  local L0_327, L1_328, L2_329, L3_330
  L0_327 = db
  L0_327 = L0_327.getDefaults
  L1_328 = true
  L2_329 = accesspointsTable
  L0_327 = L0_327(L1_328, L2_329)
  L1_328, L2_329, L3_330 = nil, nil, nil
  L1_328 = L0_327[accesspointsTable .. "." .. _UPVALUE0_.apName]
  L2_329 = L0_327[accesspointsTable .. "." .. _UPVALUE0_.profileName]
  L3_330 = L0_327[accesspointsTable .. "." .. _UPVALUE0_.wlanPartition]
  return _UPVALUE1_.SUCCESS, L1_328, L2_329, L3_330
end
function profileGetAll()
  local L0_331
  L0_331 = db
  L0_331 = L0_331.getTable
  L0_331 = L0_331(profileTable)
  return _UPVALUE0_.SUCCESS, L0_331
end
function accessPointEnableCheck()
  local L0_332, L1_333, L2_334, L3_335
  L0_332 = db
  L0_332 = L0_332.getTable
  L1_333 = accesspointsTable
  L0_332 = L0_332(L1_333)
  L1_333 = 0
  L2_334 = _UPVALUE0_
  L2_334 = L2_334.NIL
  L3_335 = _UPVALUE0_
  L3_335 = L3_335.FAILURE
  L2_334 = db.getAttribute(accesspointsTable, _UPVALUE1_.vapEnabled, _UPVALUE2_, _UPVALUE1_.apName)
  if L2_334 then
    L1_333 = 1
  else
    L1_333 = 0
  end
  L3_335 = _UPVALUE0_.SUCCESS
  return L3_335, L1_333
end
