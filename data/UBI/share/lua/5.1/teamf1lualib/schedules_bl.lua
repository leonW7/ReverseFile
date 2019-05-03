local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/fwSchedules")
L0_0 = require
L0_0("teamf1lualib/fwSchedulesUl")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
schedulesTables = "Schedules"
attribute = {}
attribute.scheduleName = "ScheduleName"
attribute.days = "Days"
attribute.allDay = "AllDay"
attribute.startTimeInHours = "StartTimeHours"
attribute.startTimeInMins = "StartTimeMins"
attribute.endTimeInHours = "EndTimeHours"
attribute.endTimeInMins = "EndTimeMins"
attribute.scheduleStartTime = "scheduleStartTime"
attribute.scheduleEndTime = "scheduleEndTime"
MeridianList = {"AM", "PM"}
function daysGet(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8
  if tonumber(A0_1) ~= nil then
    if tonumber(A0_1) >= 64 then
      L7_8 = "1"
    else
      L7_8 = "0"
    end
    if tonumber(A0_1) - 64 >= 32 then
      L6_7 = "1"
    else
      L6_7 = "0"
    end
    if tonumber(A0_1) - 64 - 32 >= 16 then
      L5_6 = "1"
    else
      L5_6 = "0"
    end
    if tonumber(A0_1) - 64 - 32 - 16 >= 8 then
      L4_5 = "1"
    else
      L4_5 = "0"
    end
    if tonumber(A0_1) - 64 - 32 - 16 - 8 >= 4 then
      L3_4 = "1"
    else
      L3_4 = "0"
    end
    if tonumber(A0_1) - 64 - 32 - 16 - 8 - 4 >= 2 then
      L2_3 = "1"
    else
      L2_3 = "0"
    end
    if tonumber(A0_1) - 64 - 32 - 16 - 8 - 4 - 2 >= 1 then
      L1_2 = "1"
    else
      L1_2 = "0"
    end
  end
  return L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8
end
function schedulesGetall()
  local L0_9, L1_10, L2_11, L3_12, L4_13, L5_14, L6_15, L7_16, L8_17, L9_18, L10_19, L11_20, L12_21, L13_22, L14_23
  L0_9 = fw
  L0_9 = L0_9.core
  L0_9 = L0_9.schedules
  L0_9 = L0_9.GetAll
  L1_10 = L0_9()
  if L0_9 ~= L2_11 then
    return L0_9
  end
  for L5_14, L6_15 in L2_11(L3_12) do
    L7_16 = attribute
    L7_16 = L7_16.days
    L7_16 = L6_15[L7_16]
    if L7_16 == "127" then
      L7_16 = attribute
      L7_16 = L7_16.days
      L6_15[L7_16] = "All Days"
    else
      L7_16 = daysGet
      L8_17 = attribute
      L8_17 = L8_17.days
      L8_17 = L6_15[L8_17]
      L13_22 = L7_16(L8_17)
      L14_23 = ""
      if L7_16 == "1" then
        L14_23 = L14_23 .. ",Monday"
      end
      if L8_17 == "1" then
        L14_23 = L14_23 .. ",Tuesday"
      end
      if L9_18 == "1" then
        L14_23 = L14_23 .. ",Wednesday"
      end
      if L10_19 == "1" then
        L14_23 = L14_23 .. ",Thursday"
      end
      if L11_20 == "1" then
        L14_23 = L14_23 .. ",Friday"
      end
      if L12_21 == "1" then
        L14_23 = L14_23 .. ",Saturday"
      end
      if L13_22 == "1" then
        L14_23 = L14_23 .. ",Sunday"
      end
      L6_15[attribute.days] = string.sub(L14_23, 2)
    end
    L7_16 = attribute
    L7_16 = L7_16.allDay
    L7_16 = L6_15[L7_16]
    if L7_16 == "1" then
      L7_16 = attribute
      L7_16 = L7_16.scheduleStartTime
      L6_15[L7_16] = "12:00 AM"
      L7_16 = attribute
      L7_16 = L7_16.scheduleEndTime
      L6_15[L7_16] = "11:59 PM"
    else
      L7_16, L8_17 = nil, nil
      L9_18 = tonumber
      L10_19 = attribute
      L10_19 = L10_19.startTimeInHours
      L10_19 = L6_15[L10_19]
      L9_18 = L9_18(L10_19)
      if L9_18 >= 12 then
        L9_18 = attribute
        L9_18 = L9_18.startTimeInHours
        L10_19 = tostring
        L11_20 = tonumber
        L12_21 = attribute
        L12_21 = L12_21.startTimeInHours
        L12_21 = L6_15[L12_21]
        L11_20 = L11_20(L12_21)
        L11_20 = L11_20 - 12
        L10_19 = L10_19(L11_20)
        L6_15[L9_18] = L10_19
        L9_18 = MeridianList
        L7_16 = L9_18[2]
      else
        L9_18 = tonumber
        L10_19 = attribute
        L10_19 = L10_19.startTimeInHours
        L10_19 = L6_15[L10_19]
        L9_18 = L9_18(L10_19)
        if L9_18 <= 12 then
          L9_18 = MeridianList
          L7_16 = L9_18[1]
        end
      end
      L9_18 = tonumber
      L10_19 = attribute
      L10_19 = L10_19.endTimeInHours
      L10_19 = L6_15[L10_19]
      L9_18 = L9_18(L10_19)
      if L9_18 >= 12 then
        L9_18 = attribute
        L9_18 = L9_18.endTimeInHours
        L10_19 = tostring
        L11_20 = tonumber
        L12_21 = attribute
        L12_21 = L12_21.endTimeInHours
        L12_21 = L6_15[L12_21]
        L11_20 = L11_20(L12_21)
        L11_20 = L11_20 - 12
        L10_19 = L10_19(L11_20)
        L6_15[L9_18] = L10_19
        L9_18 = MeridianList
        L8_17 = L9_18[2]
      else
        L9_18 = tonumber
        L10_19 = attribute
        L10_19 = L10_19.endTimeInHours
        L10_19 = L6_15[L10_19]
        L9_18 = L9_18(L10_19)
        if L9_18 <= 12 then
          L9_18 = MeridianList
          L8_17 = L9_18[1]
        end
      end
      L9_18 = tonumber
      L10_19 = attribute
      L10_19 = L10_19.startTimeInHours
      L10_19 = L6_15[L10_19]
      L9_18 = L9_18(L10_19)
      if L9_18 < 10 then
        L9_18 = attribute
        L9_18 = L9_18.startTimeInHours
        L10_19 = "0"
        L11_20 = attribute
        L11_20 = L11_20.startTimeInHours
        L11_20 = L6_15[L11_20]
        L10_19 = L10_19 .. L11_20
        L6_15[L9_18] = L10_19
      end
      L9_18 = tonumber
      L10_19 = attribute
      L10_19 = L10_19.startTimeInMins
      L10_19 = L6_15[L10_19]
      L9_18 = L9_18(L10_19)
      if L9_18 < 10 then
        L9_18 = attribute
        L9_18 = L9_18.startTimeInMins
        L10_19 = "0"
        L11_20 = attribute
        L11_20 = L11_20.startTimeInMins
        L11_20 = L6_15[L11_20]
        L10_19 = L10_19 .. L11_20
        L6_15[L9_18] = L10_19
      end
      L9_18 = tonumber
      L10_19 = attribute
      L10_19 = L10_19.endTimeInHours
      L10_19 = L6_15[L10_19]
      L9_18 = L9_18(L10_19)
      if L9_18 < 10 then
        L9_18 = attribute
        L9_18 = L9_18.endTimeInHours
        L10_19 = "0"
        L11_20 = attribute
        L11_20 = L11_20.endTimeInHours
        L11_20 = L6_15[L11_20]
        L10_19 = L10_19 .. L11_20
        L6_15[L9_18] = L10_19
      end
      L9_18 = tonumber
      L10_19 = attribute
      L10_19 = L10_19.endTimeInMins
      L10_19 = L6_15[L10_19]
      L9_18 = L9_18(L10_19)
      if L9_18 < 10 then
        L9_18 = attribute
        L9_18 = L9_18.endTimeInMins
        L10_19 = "0"
        L11_20 = attribute
        L11_20 = L11_20.endTimeInMins
        L11_20 = L6_15[L11_20]
        L10_19 = L10_19 .. L11_20
        L6_15[L9_18] = L10_19
      end
      L9_18 = attribute
      L9_18 = L9_18.scheduleStartTime
      L10_19 = attribute
      L10_19 = L10_19.startTimeInHours
      L10_19 = L6_15[L10_19]
      L11_20 = ":"
      L12_21 = attribute
      L12_21 = L12_21.startTimeInMins
      L12_21 = L6_15[L12_21]
      L13_22 = " "
      L14_23 = L7_16
      L10_19 = L10_19 .. L11_20 .. L12_21 .. L13_22 .. L14_23
      L6_15[L9_18] = L10_19
      L9_18 = attribute
      L9_18 = L9_18.scheduleEndTime
      L10_19 = attribute
      L10_19 = L10_19.endTimeInHours
      L10_19 = L6_15[L10_19]
      L11_20 = ":"
      L12_21 = attribute
      L12_21 = L12_21.endTimeInMins
      L12_21 = L6_15[L12_21]
      L13_22 = " "
      L14_23 = L8_17
      L10_19 = L10_19 .. L11_20 .. L12_21 .. L13_22 .. L14_23
      L6_15[L9_18] = L10_19
    end
  end
  return L2_11, L3_12
end
function schedulesGet(A0_24)
  local L1_25, L2_26, L3_27, L4_28, L5_29, L6_30, L7_31, L8_32, L9_33, L10_34, L11_35, L12_36, L13_37, L14_38, L15_39, L16_40, L17_41, L18_42, L19_43, L20_44, L21_45
  L12_36 = fw
  L12_36 = L12_36.core
  L12_36 = L12_36.schedules
  L12_36 = L12_36.rowGet
  L13_37 = A0_24
  L20_44 = L12_36(L13_37)
  L10_34 = L20_44
  L9_33 = L19_43
  L8_32 = L18_42
  L7_31 = L17_41
  L6_30 = L16_40
  L5_29 = L15_39
  L4_28 = L14_38
  L11_35 = L13_37
  L1_25 = L12_36
  L12_36 = daysGet
  L13_37 = L5_29
  L18_42 = L12_36(L13_37)
  L19_43 = _UPVALUE0_
  L19_43 = L19_43.SUCCESS
  if L1_25 ~= L19_43 then
    return L1_25
  end
  L19_43 = nil
  if L5_29 == "127" then
    L19_43 = "1"
  else
    L19_43 = "2"
  end
  L20_44, L21_45 = nil, nil
  if tonumber(L7_31) >= 12 then
    L7_31 = tostring(tonumber(L7_31) - 12)
    L20_44 = MeridianList[2]
  elseif tonumber(L7_31) <= 12 then
    if L7_31 == "0" then
      L7_31 = "12"
    end
    L20_44 = MeridianList[1]
  end
  if tonumber(L9_33) >= 12 then
    L9_33 = tostring(tonumber(L9_33) - 12)
    L21_45 = MeridianList[2]
  elseif tonumber(L9_33) <= 12 then
    if L9_33 == "0" then
      L9_33 = "12"
    end
    L21_45 = MeridianList[1]
  end
  if L6_30 == "0" then
    L6_30 = tostring(tonumber(L6_30) + 2)
  end
  if tonumber(L7_31) < 10 then
    L7_31 = "0" .. L7_31
  end
  if tonumber(L8_32) < 10 then
    L8_32 = "0" .. L8_32
  end
  if tonumber(L9_33) < 10 then
    L9_33 = "0" .. L9_33
  end
  if tonumber(L10_34) < 10 then
    L10_34 = "0" .. L10_34
  end
  L2_26 = L7_31 .. ":" .. L8_32 .. " " .. L20_44
  L3_27 = L9_33 .. ":" .. L10_34 .. " " .. L21_45
  return L1_25, A0_24, L4_28, L12_36, L13_37, L14_38, L15_39, L16_40, L17_41, L18_42, L19_43, L6_30, L2_26, L3_27
end
function schedulesGetNext(A0_46)
  local L1_47, L2_48, L3_49, L4_50, L5_51, L6_52, L7_53, L8_54, L9_55, L10_56, L11_57, L12_58, L13_59, L14_60, L15_61, L16_62, L17_63, L18_64, L19_65, L20_66
  L1_47 = A0_46["schedules.cookie"]
  if L1_47 == nil then
    L2_48 = util
    L2_48 = L2_48.appendDebugOut
    L3_49 = "GetNext : Invalid Cookie"
    L2_48(L3_49)
    L2_48 = _UPVALUE0_
    L2_48 = L2_48.BAD_PARAMETER
    return L2_48
  end
  L2_48, L3_49, L4_50, L5_51, L6_52, L7_53, L8_54, L9_55, L10_56 = nil, nil, nil, nil, nil, nil, nil, nil, nil
  L11_57 = fw
  L11_57 = L11_57.core
  L11_57 = L11_57.schedules
  L11_57 = L11_57.GetNext
  L12_58 = L1_47
  L19_65 = L11_57(L12_58)
  L9_55 = L19_65
  L8_54 = L18_64
  L7_53 = L17_63
  L6_52 = L16_62
  L5_51 = L15_61
  L4_50 = L14_60
  L3_49 = L13_59
  L10_56 = L12_58
  L2_48 = L11_57
  L11_57 = daysGet
  L12_58 = L4_50
  L17_63 = L11_57(L12_58)
  L18_64 = _UPVALUE0_
  L18_64 = L18_64.SUCCESS
  if L2_48 ~= L18_64 then
    return L2_48
  end
  L18_64 = nil
  if L4_50 == "127" then
    L18_64 = "1"
  else
    L18_64 = "2"
  end
  L19_65, L20_66 = nil, nil
  if tonumber(L6_52) >= 12 then
    L6_52 = tostring(tonumber(L6_52) - 12)
    L19_65 = MeridianList[1]
  elseif tonumber(L6_52) <= 12 then
    L19_65 = MeridianList[2]
  end
  if tonumber(L8_54) >= 12 then
    L8_54 = tostring(tonumber(L8_54) - 12)
    L20_66 = MeridianList[1]
  elseif tonumber(L8_54) <= 12 then
    L20_66 = MeridianList[2]
  end
  return L2_48, L10_56, L3_49, L11_57, L12_58, L13_59, L14_60, L15_61, L16_62, L17_63, L18_64, tostring(tonumber(L5_51) + 1), L6_52, L7_53, L8_54, L9_55, L19_65, L20_66
end
function schedulesSet(A0_67)
  local L1_68, L2_69, L3_70, L4_71, L5_72, L6_73, L7_74, L8_75, L9_76, L10_77, L11_78, L12_79, L13_80, L14_81, L15_82, L16_83, L17_84, L18_85, L19_86, L20_87, L21_88, L22_89, L23_90, L24_91, L25_92, L26_93
  L1_68 = ACCESS_LEVEL
  if L1_68 ~= 0 then
    L1_68 = util
    L1_68 = L1_68.appendDebugOut
    L2_69 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_68(L2_69)
    L1_68 = _UPVALUE0_
    L1_68 = L1_68.UNAUTHORIZED
    return L1_68
  end
  L1_68 = A0_67["schedules.cookie"]
  L2_69 = A0_67["schedules.scheduleName"]
  L3_70 = A0_67["schedules.allDay"]
  L4_71 = A0_67["schedules.allTime"]
  L5_72 = A0_67["schedules.DatePickerStartTime"]
  L6_73 = A0_67["schedules.DatePickerEndTime"]
  L7_74, L8_75, L9_76, L10_77, L11_78, L12_79, L13_80, L14_81, L15_82, L16_83 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  if L5_72 ~= nil and L6_73 ~= nil then
    L17_84 = util
    L17_84 = L17_84.split
    L18_85 = L5_72
    L19_86 = ":"
    L17_84 = L17_84(L18_85, L19_86)
    L7_74 = L17_84
    L17_84 = util
    L17_84 = L17_84.split
    L18_85 = L7_74[2]
    L19_86 = " "
    L17_84 = L17_84(L18_85, L19_86)
    L8_75 = L17_84
    L9_76 = L7_74[1]
    L10_77 = L8_75[1]
    L11_78 = L8_75[2]
    L17_84 = util
    L17_84 = L17_84.split
    L18_85 = L6_73
    L19_86 = ":"
    L17_84 = L17_84(L18_85, L19_86)
    L12_79 = L17_84
    L17_84 = util
    L17_84 = L17_84.split
    L18_85 = L12_79[2]
    L19_86 = " "
    L17_84 = L17_84(L18_85, L19_86)
    L13_80 = L17_84
    L14_81 = L12_79[1]
    L15_82 = L13_80[1]
    L16_83 = L13_80[2]
  end
  L17_84 = A0_67["schedules.monday"]
  L18_85 = A0_67["schedules.tuesday"]
  L19_86 = A0_67["schedules.wednesday"]
  L20_87 = A0_67["schedules.thursday"]
  L21_88 = A0_67["schedules.friday"]
  L22_89 = A0_67["schedules.saturday"]
  L23_90 = A0_67["schedules.sunday"]
  if L3_70 == "1" then
    L17_84 = "0"
    L18_85 = "0"
    L19_86 = "0"
    L20_87 = "0"
    L21_88 = "0"
    L22_89 = "0"
    L23_90 = "0"
  end
  if L3_70 == "2" then
    L3_70 = "0"
  end
  if L4_71 == "2" then
    L4_71 = "0"
  end
  if L1_68 == nil then
    L24_91 = util
    L24_91 = L24_91.appendDebugOut
    L25_92 = "Set : Invalid Cookie"
    L24_91(L25_92)
    L24_91 = _UPVALUE0_
    L24_91 = L24_91.BAD_PARAMETER
    return L24_91
  end
  if L2_69 == nil or L3_70 == nil or L4_71 == nil then
    L24_91 = util
    L24_91 = L24_91.appendDebugOut
    L25_92 = "GetNext : Invalid Cookie"
    L24_91(L25_92)
    L24_91 = _UPVALUE0_
    L24_91 = L24_91.BAD_PARAMETER
    return L24_91
  end
  L24_91, L25_92 = nil, nil
  L26_93 = db
  L26_93 = L26_93.getRow
  L26_93 = L26_93("sessionLimitProfiles", "scheduleProfile", L2_69)
  if L26_93 then
    _UPVALUE1_.start()
    db.deleteRow("sessionLimitProfiles", "scheduleProfile", L2_69)
    _UPVALUE1_.complete()
    _UPVALUE1_.save()
    os.execute("sleep 5")
  end
  _UPVALUE1_.start()
  L24_91, L25_92 = fw.core.schedules.edit(L2_69, L3_70, L4_71, L9_76, L10_77, L14_81, L15_82, L17_84, L18_85, L19_86, L20_87, L21_88, L22_89, L23_90, L11_78, L16_83, L1_68)
  if L24_91 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L24_91)
    _UPVALUE1_.abort()
    return L24_91, L1_68
  end
  if L26_93 then
    db.insert("sessionLimitProfiles", L26_93)
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L25_92
end
function schedulesDelete(A0_94)
  local L1_95, L2_96
  L1_95 = ACCESS_LEVEL
  if L1_95 ~= 0 then
    L1_95 = util
    L1_95 = L1_95.appendDebugOut
    L2_96 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_95(L2_96)
    L1_95 = _UPVALUE0_
    L1_95 = L1_95.UNAUTHORIZED
    return L1_95
  end
  L1_95 = A0_94["schedules.cookie"]
  if L1_95 == nil then
    L2_96 = util
    L2_96 = L2_96.appendDebugOut
    L2_96("Delete : Invalid Cookie")
    L2_96 = _UPVALUE0_
    L2_96 = L2_96.BAD_PARAMETER
    return L2_96
  end
  L2_96 = nil
  _UPVALUE1_.start()
  L2_96, cookie = fw.ul.schedules.delete(L1_95)
  if L2_96 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L2_96)
    _UPVALUE1_.abort()
    return L2_96, L1_95
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function schedulesDefaultsGet()
  local L0_97, L1_98, L3_99, L4_100, L5_101
  L0_97 = 1
  L1_98 = "PAP"
  L3_99 = _UPVALUE0_
  L3_99 = L3_99.SUCCESS
  L4_100 = 0
  L5_101 = L0_97
  return L3_99, L4_100, L5_101, L1_98
end
function schedulesCreate(A0_102)
  local L1_103, L2_104, L3_105, L4_106, L5_107, L6_108, L7_109, L8_110, L9_111, L10_112, L11_113, L12_114, L13_115, L14_116, L15_117, L16_118, L17_119, L18_120, L19_121, L20_122, L21_123, L22_124, L23_125, L24_126
  L1_103 = ACCESS_LEVEL
  if L1_103 ~= 0 then
    L1_103 = util
    L1_103 = L1_103.appendDebugOut
    L2_104 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_103(L2_104)
    L1_103 = _UPVALUE0_
    L1_103 = L1_103.UNAUTHORIZED
    return L1_103
  end
  L1_103 = A0_102["schedules.scheduleName"]
  L2_104 = A0_102["schedules.allDay"]
  L3_105 = A0_102["schedules.allTime"]
  L4_106 = A0_102["schedules.DatePickerStartTime"]
  L5_107 = A0_102["schedules.DatePickerEndTime"]
  L6_108, L7_109, L8_110, L9_111, L10_112, L11_113, L12_114, L13_115, L14_116, L15_117 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  if L4_106 ~= nil and L5_107 ~= nil then
    L16_118 = util
    L16_118 = L16_118.split
    L17_119 = L4_106
    L18_120 = ":"
    L16_118 = L16_118(L17_119, L18_120)
    L6_108 = L16_118
    L16_118 = util
    L16_118 = L16_118.split
    L17_119 = L6_108[2]
    L18_120 = " "
    L16_118 = L16_118(L17_119, L18_120)
    L7_109 = L16_118
    L8_110 = L6_108[1]
    L9_111 = L7_109[1]
    L10_112 = L7_109[2]
    L16_118 = util
    L16_118 = L16_118.split
    L17_119 = L5_107
    L18_120 = ":"
    L16_118 = L16_118(L17_119, L18_120)
    L11_113 = L16_118
    L16_118 = util
    L16_118 = L16_118.split
    L17_119 = L11_113[2]
    L18_120 = " "
    L16_118 = L16_118(L17_119, L18_120)
    L12_114 = L16_118
    L13_115 = L11_113[1]
    L14_116 = L12_114[1]
    L15_117 = L12_114[2]
  end
  L16_118 = A0_102["schedules.monday"]
  L17_119 = A0_102["schedules.tuesday"]
  L18_120 = A0_102["schedules.wednesday"]
  L19_121 = A0_102["schedules.thursday"]
  L20_122 = A0_102["schedules.friday"]
  L21_123 = A0_102["schedules.saturday"]
  L22_124 = A0_102["schedules.sunday"]
  if L2_104 == "2" then
    L2_104 = "0"
  end
  if L3_105 == "2" then
    L3_105 = "0"
  end
  if L1_103 == nil or L2_104 == nil or L3_105 == nil then
    L23_125 = util
    L23_125 = L23_125.appendDebugOut
    L24_126 = "GetNext : Invalid Cookie"
    L23_125(L24_126)
    L23_125 = _UPVALUE0_
    L23_125 = L23_125.BAD_PARAMETER
    return L23_125
  end
  L23_125, L24_126 = nil, nil
  _UPVALUE1_.start()
  L23_125, L24_126 = fw.core.schedules.add(L1_103, L2_104, L3_105, L8_110, L9_111, L13_115, L14_116, L16_118, L17_119, L18_120, L19_121, L20_122, L21_123, L22_124, L10_112, L15_117)
  if L23_125 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L23_125)
    _UPVALUE1_.abort()
    return L23_125, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L24_126
end
function schedulesDeleteAll()
  local L0_127
  L0_127 = ACCESS_LEVEL
  if L0_127 ~= 0 then
    L0_127 = util
    L0_127 = L0_127.appendDebugOut
    L0_127("Detected Unauthorized access for page DUMMY PAGE")
    L0_127 = _UPVALUE0_
    L0_127 = L0_127.UNAUTHORIZED
    return L0_127
  end
  L0_127 = nil
  _UPVALUE1_.start()
  L0_127, cookie = fw.ul.schedules.deleteAll()
  if L0_127 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L0_127)
    _UPVALUE1_.abort()
    return L0_127, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
