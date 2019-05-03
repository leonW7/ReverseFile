local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/fwValidations")
L0_0 = "1"
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
else
end
fw.schedules = {}
fw.core.schedules = {}
schedulesTables = "Schedules"
;({}).scheduleName = "ScheduleName"
;({}).days = "Days"
;({}).allDay = "AllDay"
;({}).startTimeInHours = "StartTimeHours"
;({}).startTimeInMins = "StartTimeMins"
;({}).endTimeInHours = "EndTimeHours"
;({}).endTimeInMins = "EndTimeMins"
function fw.core.schedules.scheduleNameGet()
  local L0_1, L1_2, L2_3
  L1_2, L0_1 = getFirstCookie(schedulesTables, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_2 then
    return L1_2
  end
  L2_3 = db.getAttribute(schedulesTables, _UPVALUE0_, L0_1, _UPVALUE1_.scheduleName)
  if L2_3 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_1, L2_3
end
function fw.core.schedules.scheduleNameGetNext(A0_4)
  local L1_5, L2_6, L3_7
  if A0_4 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_5, L3_7 = getNextCookie(schedulesTables, _UPVALUE1_, A0_4)
  if returnCodes.SUCCESS ~= L1_5 then
    return L1_5
  end
  L2_6 = db.getAttribute(schedulesTables, _UPVALUE1_, L3_7, _UPVALUE2_.scheduleName)
  if L2_6 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_7, L2_6
end
function fw.core.schedules.scheduleNameSet(A0_8, A1_9)
  local L2_10, L3_11, L4_12
  if A0_8 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_10 = db.existsRow(schedulesTables, _UPVALUE1_, A0_8)
  if not L2_10 then
    return returnCodes.COOKIEFAIL
  end
  L2_10 = fw_textValidation(A1_9, _UPVALUE0_, _UPVALUE0_)
  if L2_10 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A0_8
  end
  L4_12 = db.setAttribute(schedulesTables, _UPVALUE1_, A0_8, _UPVALUE2_.scheduleName, A1_9)
  if not L4_12 then
    return returnCodes.FAILURE, A0_8
  end
  return returnCodes.SUCCESS, A0_8
end
function fw.core.schedules.daysGet()
  local L0_13, L1_14, L2_15
  L1_14, L0_13 = getFirstCookie(schedulesTables, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_14 then
    return L1_14
  end
  L2_15 = db.getAttribute(schedulesTables, _UPVALUE0_, L0_13, _UPVALUE1_.days)
  if L2_15 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_13, L2_15
end
function fw.core.schedules.daysGetNext(A0_16)
  local L1_17, L2_18, L3_19
  if A0_16 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_17, L3_19 = getNextCookie(schedulesTables, _UPVALUE1_, A0_16)
  if returnCodes.SUCCESS ~= L1_17 then
    return L1_17
  end
  L2_18 = db.getAttribute(schedulesTables, _UPVALUE1_, L3_19, _UPVALUE2_.days)
  if L2_18 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_19, L2_18
end
function fw.core.schedules.daysSet(A0_20, A1_21)
  local L2_22, L3_23, L4_24
  if A0_20 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_22 = db.existsRow(schedulesTables, _UPVALUE1_, A0_20)
  if not L2_22 then
    return returnCodes.COOKIEFAIL
  end
  if A1_21 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L4_24 = db.setAttribute(schedulesTables, _UPVALUE1_, A0_20, _UPVALUE2_.days, A1_21)
  if not L4_24 then
    return returnCodes.FAILURE, A0_20
  end
  return returnCodes.SUCCESS, A0_20
end
function fw.core.schedules.allDayGet()
  local L0_25, L1_26, L2_27
  L1_26, L0_25 = getFirstCookie(schedulesTables, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_26 then
    return L1_26
  end
  L2_27 = db.getAttribute(schedulesTables, _UPVALUE0_, L0_25, _UPVALUE1_.allDay)
  if L2_27 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_25, L2_27
end
function fw.core.schedules.allDayGetNext(A0_28)
  local L1_29, L2_30, L3_31
  if A0_28 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_29, L3_31 = getNextCookie(schedulesTables, _UPVALUE1_, A0_28)
  if returnCodes.SUCCESS ~= L1_29 then
    return L1_29
  end
  L2_30 = db.getAttribute(schedulesTables, _UPVALUE1_, L3_31, _UPVALUE2_.allDay)
  if L2_30 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_31, L2_30
end
function fw.core.schedules.allDaySet(A0_32, A1_33)
  local L2_34, L3_35, L4_36
  if A0_32 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_34 = db.existsRow(schedulesTables, _UPVALUE1_, A0_32)
  if not L2_34 then
    return returnCodes.COOKIEFAIL
  end
  L2_34 = booleanCheck(A1_33)
  if L2_34 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A0_32
  end
  L4_36 = db.setAttribute(schedulesTables, _UPVALUE1_, A0_32, _UPVALUE2_.allDay, A1_33)
  if not L4_36 then
    return returnCodes.FAILURE, A0_32
  end
  return returnCodes.SUCCESS, A0_32
end
function fw.core.schedules.startTimeHoursGet()
  local L0_37, L1_38, L2_39
  L1_38, L0_37 = getFirstCookie(schedulesTables, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_38 then
    return L1_38
  end
  L2_39 = db.getAttribute(schedulesTables, _UPVALUE0_, L0_37, _UPVALUE1_.startTimeInHours)
  if L2_39 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_37, L2_39
end
function fw.core.schedules.startTimeHoursGetNext(A0_40)
  local L1_41, L2_42, L3_43
  if A0_40 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_41, L3_43 = getNextCookie(schedulesTables, _UPVALUE1_, A0_40)
  if returnCodes.SUCCESS ~= L1_41 then
    return L1_41
  end
  L2_42 = db.getAttribute(schedulesTables, _UPVALUE1_, L3_43, _UPVALUE2_.startTimeInHours)
  if L2_42 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_43, L2_42
end
function fw.core.schedules.startTimeHoursSet(A0_44, A1_45)
  local L2_46, L3_47, L4_48, L5_49
  if A0_44 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_46 = db.existsRow(schedulesTables, _UPVALUE1_, A0_44)
  if not L2_46 then
    return returnCodes.COOKIEFAIL
  end
  L5_49 = db.getAttribute(schedulesTables, _UPVALUE1_, A0_44, _UPVALUE2_.allDay)
  if L5_49 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  if L5_49 == _UPVALUE3_ then
    startingHours, L2_46 = fw_portValidation(_UPVALUE4_, _UPVALUE5_, A1_45)
    if L2_46 ~= returnCodes.SUCCESS then
      return returnCodes.INVALID_ARGUMENT, A0_44
    end
  else
    return returnCodes.INVALID_ARGUMENT, A0_44
  end
  L4_48 = db.setAttribute(schedulesTables, _UPVALUE1_, A0_44, _UPVALUE2_.startTimeInHours, A1_45)
  if not L4_48 then
    return returnCodes.FAILURE, A0_44
  end
  return returnCodes.SUCCESS, A0_44
end
function fw.core.schedules.startTimeMinsGet()
  local L0_50, L1_51, L2_52
  L1_51, L0_50 = getFirstCookie(schedulesTables, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_51 then
    return L1_51
  end
  L2_52 = db.getAttribute(schedulesTables, _UPVALUE0_, L0_50, _UPVALUE1_.startTimeInMins)
  if L2_52 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_50, L2_52
end
function fw.core.schedules.startTimeMinsGetNext(A0_53)
  local L1_54, L2_55, L3_56
  if A0_53 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_54, L3_56 = getNextCookie(schedulesTables, _UPVALUE1_, A0_53)
  if returnCodes.SUCCESS ~= L1_54 then
    return L1_54
  end
  startTimeInMins = db.getAttribute(schedulesTables, _UPVALUE1_, L3_56, _UPVALUE2_.startTimeInMins)
  if startTimeInMins == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_56, startTimeInMins
end
function fw.core.schedules.startTimeMinsSet(A0_57, A1_58)
  local L2_59, L3_60, L4_61
  if A0_57 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_59 = db.existsRow(schedulesTables, _UPVALUE1_, A0_57)
  if not L2_59 then
    return returnCodes.COOKIEFAIL
  end
  allDayStatus = db.getAttribute(schedulesTables, _UPVALUE1_, A0_57, _UPVALUE2_.allDay)
  if allDayStatus == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  if allDayStatus == _UPVALUE3_ then
    startingMins, L2_59 = fw_portValidation(_UPVALUE4_, _UPVALUE5_, A1_58)
    if L2_59 ~= returnCodes.SUCCESS then
      return returnCodes.INVALID_ARGUMENT, A0_57
    end
  else
    return returnCodes.INVALID_ARGUMENT, A0_57
  end
  L4_61 = db.setAttribute(schedulesTables, _UPVALUE1_, A0_57, _UPVALUE2_.startTimeInMins, A1_58)
  if not L4_61 then
    return returnCodes.FAILURE, A0_57
  end
  return returnCodes.SUCCESS, A0_57
end
function fw.core.schedules.endTimeHoursGet()
  local L0_62, L1_63, L2_64
  L1_63, L0_62 = getFirstCookie(schedulesTables, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_63 then
    return L1_63
  end
  L2_64 = db.getAttribute(schedulesTables, _UPVALUE0_, L0_62, _UPVALUE1_.endTimeInHours)
  if L2_64 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_62, L2_64
end
function fw.core.schedules.endTimeHoursGet(A0_65)
  local L1_66, L2_67, L3_68
  if A0_65 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_66, L3_68 = getNextCookie(schedulesTables, _UPVALUE1_, A0_65)
  if returnCodes.SUCCESS ~= L1_66 then
    return L1_66
  end
  L2_67 = db.getAttribute(schedulesTables, _UPVALUE1_, L3_68, _UPVALUE2_.endTimeInHours)
  if L2_67 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_68, L2_67
end
function fw.core.schedules.endTimeHoursSet(A0_69, A1_70)
  local L2_71, L3_72, L4_73
  if A0_69 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_71 = db.existsRow(schedulesTables, _UPVALUE1_, A0_69)
  if not L2_71 then
    return returnCodes.COOKIEFAIL
  end
  allDayStatus = db.getAttribute(schedulesTables, _UPVALUE1_, A0_69, _UPVALUE2_.allDay)
  if allDayStatus == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  if allDayStatus == _UPVALUE3_ then
    endingHours, L2_71 = fw_portValidation(_UPVALUE4_, _UPVALUE5_, A1_70)
    if L2_71 ~= returnCodes.SUCCESS then
      return returnCodes.INVALID_ARGUMENT, A0_69
    end
  else
    return returnCodes.INVALID_ARGUMENT, A0_69
  end
  L4_73 = db.setAttribute(schedulesTables, _UPVALUE1_, A0_69, _UPVALUE2_.endTimeInHours, A1_70)
  if not L4_73 then
    return returnCodes.FAILURE, A0_69
  end
  return returnCodes.SUCCESS, A0_69
end
function fw.core.schedules.endTimeMinsGet()
  local L0_74, L1_75, L2_76
  L1_75, L0_74 = getFirstCookie(schedulesTables, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_75 then
    return L1_75
  end
  L2_76 = db.getAttribute(schedulesTables, _UPVALUE0_, L0_74, _UPVALUE1_.endTimeInMins)
  if L2_76 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_74, L2_76
end
function fw.core.schedules.endTimeMinsGetNext(A0_77)
  local L1_78, L2_79, L3_80
  if cookie == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_78, L3_80 = getNextCookie(schedulesTables, _UPVALUE1_, cookie)
  if returnCodes.SUCCESS ~= L1_78 then
    return L1_78
  end
  endTimeInMins = db.getAttribute(schedulesTables, _UPVALUE1_, L3_80, _UPVALUE2_.endTimeInMins)
  if endTimeInMins == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L3_80, endTimeInMins
end
function fw.core.schedules.endTimeMinsSet(A0_81, A1_82)
  local L2_83, L3_84, L4_85
  if A0_81 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_83 = db.existsRow(schedulesTables, _UPVALUE1_, A0_81)
  if not L2_83 then
    return returnCodes.COOKIEFAIL
  end
  allDayStatus = db.getAttribute(schedulesTables, _UPVALUE1_, A0_81, _UPVALUE2_.allDay)
  if allDayStatus == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  if allDayStatus == _UPVALUE3_ then
    endingMins, L2_83 = fw_portValidation(_UPVALUE4_, _UPVALUE5_, A1_82)
    if L2_83 ~= returnCodes.SUCCESS then
      return returnCodes.INVALID_ARGUMENT, A0_81
    end
  else
    return returnCodes.INVALID_ARGUMENT, A0_81
  end
  L4_85 = db.setAttribute(schedulesTables, _UPVALUE1_, A0_81, _UPVALUE2_.endTimeInMins, A1_82)
  if not L4_85 then
    return returnCodes.FAILURE, A0_81
  end
  return returnCodes.SUCCESS, A0_81
end
function fw.schedules.add(A0_86, A1_87, A2_88, A3_89, A4_90, A5_91, A6_92)
  local L7_93, L8_94, L9_95, L10_96, L11_97, L12_98, L13_99, L14_100
  L8_94 = {}
  L9_95, L10_96, L11_97, L12_98, L13_99, L14_100 = nil, nil, nil, nil, nil, nil
  L7_93 = fw_textValidation(A0_86, _UPVALUE0_, _UPVALUE1_)
  if L7_93 ~= returnCodes.SUCCESS then
    return fwReturnCodes.COMP_FIREWALL_SCHEDULE_NAME_INVALID, A0_86
  end
  if A1_87 == _UPVALUE2_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L7_93 = booleanCheck(A2_88)
  if L7_93 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A0_86
  end
  L11_97, L7_93 = fw_portValidation(_UPVALUE3_, _UPVALUE4_, A3_89)
  if L7_93 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A0_86
  end
  L12_98, L7_93 = fw_portValidation(_UPVALUE5_, _UPVALUE6_, A4_90)
  if L7_93 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A0_86
  end
  L13_99, L7_93 = fw_portValidation(_UPVALUE3_, _UPVALUE4_, A5_91)
  if L7_93 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A0_86
  end
  L14_100, L7_93 = fw_portValidation(_UPVALUE5_, _UPVALUE6_, A6_92)
  if L7_93 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A0_86
  end
  L8_94[schedulesTables .. "." .. _UPVALUE7_.scheduleName] = A0_86
  L8_94[schedulesTables .. "." .. _UPVALUE7_.days] = A1_87
  L8_94[schedulesTables .. "." .. _UPVALUE7_.allDay] = A2_88
  L8_94[schedulesTables .. "." .. _UPVALUE7_.startTimeInHours] = L11_97
  L8_94[schedulesTables .. "." .. _UPVALUE7_.startTimeInMins] = L12_98
  L8_94[schedulesTables .. "." .. _UPVALUE7_.endTimeInHours] = L13_99
  L8_94[schedulesTables .. "." .. _UPVALUE7_.endTimeInMins] = L14_100
  if db.getTable(schedulesTables) ~= nil and #db.getTable(schedulesTables) >= _UPVALUE8_ then
    return returnCodes.MAX_LIMIT_REACHED
  end
  L7_93 = db.insert(schedulesTables, L8_94)
  if not L7_93 then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, A0_86
end
function fw.schedules.edit(A0_101, A1_102, A2_103, A3_104, A4_105, A5_106, A6_107, A7_108)
  local L8_109, L9_110, L10_111, L11_112, L12_113
  L10_111 = {}
  L11_112, L12_113 = nil, nil
  if A7_108 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L8_109 = db.existsRow(schedulesTables, _UPVALUE1_, A7_108)
  if not L8_109 then
    return returnCodes.COOKIEFAIL
  end
  L8_109 = fw_textValidation(A0_101, _UPVALUE0_, _UPVALUE0_)
  if L8_109 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A7_108
  end
  if A1_102 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L8_109 = booleanCheck(A2_103)
  if L8_109 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A7_108
  end
  startingHours, L8_109 = fw_portValidation(_UPVALUE2_, _UPVALUE3_, A3_104)
  if L8_109 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A7_108
  end
  startingMins, L8_109 = fw_portValidation(_UPVALUE4_, _UPVALUE5_, A4_105)
  if L8_109 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A7_108
  end
  endingHours, L8_109 = fw_portValidation(_UPVALUE2_, _UPVALUE3_, A5_106)
  if L8_109 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A7_108
  end
  endingMins, L8_109 = fw_portValidation(_UPVALUE4_, _UPVALUE5_, A6_107)
  if L8_109 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A7_108
  end
  L10_111[schedulesTables .. "." .. _UPVALUE6_.scheduleName] = A0_101
  L10_111[schedulesTables .. "." .. _UPVALUE6_.days] = A1_102
  L10_111[schedulesTables .. "." .. _UPVALUE6_.allDay] = A2_103
  L10_111[schedulesTables .. "." .. _UPVALUE6_.startTimeInHours] = A3_104
  L10_111[schedulesTables .. "." .. _UPVALUE6_.startTimeInMins] = A4_105
  L10_111[schedulesTables .. "." .. _UPVALUE6_.endTimeInHours] = A5_106
  L10_111[schedulesTables .. "." .. _UPVALUE6_.endTimeInMins] = A6_107
  L9_110 = db.getAttribute(schedulesTables, _UPVALUE1_, A7_108, "_ROWID_")
  if L9_110 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  if A0_101 ~= db.getAttribute(schedulesTables, "_ROWID_", L9_110, _UPVALUE1_) then
    return returnCodes.FAILURE
  end
  L12_113 = db.update(schedulesTables, L10_111, L9_110)
  if not L12_113 then
    return returnCodes.FAILURE, L9_110
  end
  return returnCodes.SUCCESS, L9_110
end
function fw.core.schedules.delete(A0_114)
  local L1_115, L2_116, L3_117
  L3_117 = db.deleteRow(schedulesTables, _UPVALUE0_, A0_114)
  if not L3_117 then
    return returnCodes.FAILURE, A0_114
  end
  return returnCodes.SUCCESS, A0_114
end
function fw.core.schedules.deleteAll()
  local L0_118
  L0_118 = db.deleteAllRows(schedulesTables)
  if not L0_118 then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS
end
function fw.core.schedules.Get()
  local L0_119, L1_120, L2_121, L3_122, L4_123, L5_124, L6_125, L7_126, L8_127, L9_128
  L9_128 = {}
  L1_120, L0_119 = getFirstCookie(schedulesTables, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_120 then
    return L1_120
  end
  L9_128 = db.getRow(schedulesTables, _UPVALUE0_, L0_119)
  if L9_128 == _UPVALUE1_ then
    return returnCodes.FAILURE
  end
  L2_121 = L9_128[schedulesTables .. "." .. _UPVALUE2_.scheduleName]
  L3_122 = L9_128[schedulesTables .. "." .. _UPVALUE2_.days]
  L4_123 = L9_128[schedulesTables .. "." .. _UPVALUE2_.allDay]
  L5_124 = L9_128[schedulesTables .. "." .. _UPVALUE2_.startTimeInHours]
  L6_125 = L9_128[schedulesTables .. "." .. _UPVALUE2_.startTimeInMins]
  L7_126 = L9_128[schedulesTables .. "." .. _UPVALUE2_.endTimeInHours]
  L8_127 = L9_128[schedulesTables .. "." .. _UPVALUE2_.endTimeInMins]
  return returnCodes.SUCCESS, L0_119, L2_121, L3_122, L4_123, L5_124, L6_125, L7_126, L8_127
end
function fw.core.schedules.GetNext(A0_129)
  local L1_130, L2_131, L3_132, L4_133, L5_134, L6_135, L7_136, L8_137, L9_138
  L9_138 = {}
  if A0_129 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_130, rowId = getNextCookie(schedulesTables, _UPVALUE1_, A0_129)
  if returnCodes.SUCCESS ~= L1_130 then
    return L1_130
  end
  L9_138 = db.getRow(schedulesTables, _UPVALUE1_, rowId)
  if L9_138 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  L2_131 = L9_138[schedulesTables .. "." .. _UPVALUE2_.scheduleName]
  L3_132 = L9_138[schedulesTables .. "." .. _UPVALUE2_.days]
  L4_133 = L9_138[schedulesTables .. "." .. _UPVALUE2_.allDay]
  L5_134 = L9_138[schedulesTables .. "." .. _UPVALUE2_.startTimeInHours]
  L6_135 = L9_138[schedulesTables .. "." .. _UPVALUE2_.startTimeInMins]
  L7_136 = L9_138[schedulesTables .. "." .. _UPVALUE2_.endTimeInHours]
  L8_137 = L9_138[schedulesTables .. "." .. _UPVALUE2_.endTimeInMins]
  return returnCodes.SUCCESS, rowId, L2_131, L3_132, L4_133, L5_134, L6_135, L7_136, L8_137
end
function fw.core.schedules.rowGet(A0_139)
  local L1_140, L2_141, L3_142, L4_143, L5_144, L6_145, L7_146, L8_147, L9_148
  L9_148 = {}
  if A0_139 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L9_148 = db.getRow(schedulesTables, _UPVALUE1_, A0_139)
  if L9_148 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  L2_141 = L9_148[schedulesTables .. "." .. _UPVALUE2_.scheduleName]
  L3_142 = L9_148[schedulesTables .. "." .. _UPVALUE2_.days]
  L4_143 = L9_148[schedulesTables .. "." .. _UPVALUE2_.allDay]
  L5_144 = L9_148[schedulesTables .. "." .. _UPVALUE2_.startTimeInHours]
  L6_145 = L9_148[schedulesTables .. "." .. _UPVALUE2_.startTimeInMins]
  L7_146 = L9_148[schedulesTables .. "." .. _UPVALUE2_.endTimeInHours]
  L8_147 = L9_148[schedulesTables .. "." .. _UPVALUE2_.endTimeInMins]
  return returnCodes.SUCCESS, A0_139, L2_141, L3_142, L4_143, L5_144, L6_145, L7_146, L8_147
end
function fw.core.schedules.GetAll()
  local L0_149
  L0_149 = db
  L0_149 = L0_149.getTable
  L0_149 = L0_149(schedulesTables, false)
  if L0_149 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_149
end
function fw.core.schedules.add(A0_150, A1_151, A2_152, A3_153, A4_154, A5_155, A6_156, A7_157, A8_158, A9_159, A10_160, A11_161, A12_162, A13_163, A14_164, A15_165)
  local L16_166, L17_167, L18_168, L19_169
  L19_169 = db
  L19_169 = L19_169.existsRow
  L19_169 = L19_169(schedulesTables, _UPVALUE0_, A0_150)
  L16_166 = L19_169
  if L16_166 then
    L19_169 = fwReturnCodes
    L19_169 = L19_169.COMP_FIREWALL_SCHEDULE_NAME_ALREADY_EXIT
    return L19_169
  end
  L19_169 = _UPVALUE1_
  L19_169 = L19_169(A7_157, A8_158, A9_159, A10_160, A11_161, A12_162, A13_163, A1_151)
  if L19_169 == 0 then
    return fwReturnCodes.COMP_FIREWALL_SCHEDULE_SELECT_DAY
  end
  if A2_152 == _UPVALUE2_ then
    A3_153 = "0"
    A4_154 = "0"
    A5_155 = "23"
    A6_156 = "59"
  else
    if A14_164 == "AM" then
      if A3_153 == "12" then
        A3_153 = "0"
      end
    elseif A3_153 ~= "12" then
      A3_153 = tonumber(A3_153) + 12
    end
    if A15_165 == "AM" then
      if A5_155 == "12" then
        A5_155 = "0"
      end
    elseif A5_155 ~= "12" then
      A5_155 = tonumber(A5_155) + 12
    end
  end
  if tonumber(A3_153) * 60 + tonumber(A4_154) >= tonumber(A5_155) * 60 + tonumber(A6_156) then
    return fwReturnCodes.COMP_FIREWALL_SCHEDULE_STARTTIME_GREATERTHAN_ENDTIME
  end
  L18_168, errCode = fw.schedules.add(A0_150, L19_169, A2_152, A3_153, A4_154, A5_155, A6_156)
  if L18_168 ~= returnCodes.SUCCESS then
    return L18_168, errCode
  end
  return returnCodes.SUCCESS, errCode
end
function fw.core.schedules.edit(A0_170, A1_171, A2_172, A3_173, A4_174, A5_175, A6_176, A7_177, A8_178, A9_179, A10_180, A11_181, A12_182, A13_183, A14_184, A15_185, A16_186)
  local L17_187, L18_188, L19_189, L20_190
  L20_190 = _UPVALUE0_
  L20_190 = L20_190(A7_177, A8_178, A9_179, A10_180, A11_181, A12_182, A13_183, A1_171)
  if L20_190 == 0 then
    return fwReturnCodes.COMP_FIREWALL_SCHEDULE_SELECT_DAY
  end
  if A2_172 == _UPVALUE1_ then
    A3_173 = "0"
    A4_174 = "0"
    A5_175 = "23"
    A6_176 = "59"
  else
    if A14_184 == "AM" then
      if A3_173 == "12" then
        A3_173 = "0"
      end
    elseif A3_173 ~= "12" then
      A3_173 = tonumber(A3_173) + 12
    end
    if A15_185 == "AM" then
      if A5_175 == "12" then
        A5_175 = "0"
      end
    elseif A5_175 ~= "12" then
      A5_175 = tonumber(A5_175) + 12
    end
  end
  if tonumber(A3_173) * 60 + tonumber(A4_174) >= tonumber(A5_175) * 60 + tonumber(A6_176) then
    return fwReturnCodes.COMP_FIREWALL_SCHEDULE_STARTTIME_GREATERTHAN_ENDTIME
  end
  L19_189, errCode = fw.schedules.edit(A0_170, L20_190, A2_172, A3_173, A4_174, A5_175, A6_176, A16_186)
  if L19_189 ~= returnCodes.SUCCESS then
    return returnCodes.FAILURE, errCode
  end
  return returnCodes.SUCCESS, errCode
end
