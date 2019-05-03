local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wireless.accesspoints", package.seeall)
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
L0_0("teamf1lualib/wireless_statistics")
L0_0 = require
L0_0("teamf1lualib/dot11_returnCodes")
L0_0 = require
L0_0("teamf1lualib/wireless_wds")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function accessPointsSectionGetCur(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14
  L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14 = _UPVALUE0_.accessPointGetCur(A0_1)
  if L5_6 == "2" then
    L5_6 = "1"
  end
  if L6_7 == "1" then
    L6_7 = "0"
  else
    L6_7 = "1"
  end
  if L1_2 ~= _UPVALUE1_.SUCCESS then
    return L1_2
  end
  return L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14
end
function accessPointsSectionGetAll()
  local L0_15, L1_16
  L1_16 = {}
  L0_15, L1_16 = _UPVALUE0_.accessPointGetAll()
  if L1_16 == _UPVALUE1_.NIL then
    L1_16 = {}
  end
  return L0_15, L1_16
end
function accessPointsSectionSet(A0_17)
  local L1_18, L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26, L10_27, L11_28, L12_29, L13_30, L14_31, L15_32, L16_33, L17_34, L18_35, L19_36, L20_37, L21_38, L22_39, L23_40
  L1_18 = ACCESS_LEVEL
  if L1_18 ~= 0 then
    L1_18 = util
    L1_18 = L1_18.appendDebugOut
    L2_19 = "Detected Unauthorized access for page accessPoints"
    L1_18(L2_19)
    L1_18 = _UPVALUE0_
    L1_18 = L1_18.UNAUTHORIZED
    return L1_18
  end
  L1_18, L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26, L10_27, L11_28 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L12_29 = A0_17["accessPoints.cookie"]
  L13_30 = A0_17["accessPoints.apName"]
  L14_31 = A0_17["accessPoints.profileName"]
  L15_32 = A0_17["accessPoints.activeTime"]
  L16_33 = A0_17["accessPoints.scheduleControl"]
  L17_34 = A0_17["accessPoints.startHour"]
  L18_35 = A0_17["accessPoints.startMinute"]
  L19_36 = A0_17["accessPoints.startMeridian"]
  L20_37 = A0_17["accessPoints.stopHour"]
  L21_38 = A0_17["accessPoints.stopMinute"]
  L22_39 = A0_17["accessPoints.stopMeridian"]
  L23_40 = A0_17["accessPoints.wlanPartition"]
  if L15_32 == "1" then
    L15_32 = "2"
  end
  if L19_36 == "1" then
    if tonumber(L17_34) == 12 then
      L17_34 = "12"
    else
      L17_34 = L17_34 + 12
    end
  else
    if tonumber(L17_34) == 12 then
      L17_34 = "00"
    else
    end
  end
  if L22_39 == "1" then
    if tonumber(L20_37) == 12 then
      L20_37 = "12"
    else
      L20_37 = L20_37 + 12
    end
  else
    if tonumber(L20_37) == 12 then
      L20_37 = "00"
    else
    end
  end
  if L16_33 == "1" then
    L16_33 = "0"
  else
    L16_33 = "1"
  end
  if PRODUCT_ID ~= "DSR-1000AC_Ax" and PRODUCT_ID ~= "DSR-500AC_Ax" and PRODUCT_ID ~= "DSR-1000_Bx" and PRODUCT_ID ~= "DSR-500_Bx" then
    if tonumber(L12_29) == 1 then
      returnCode = _UPVALUE1_.is_WDS_Enabled(L12_29)
      if returnCode ~= _UPVALUE0_.SUCCESS then
        return returnCode
      end
    end
    returnCode = _UPVALUE1_.is_WPS_Enabled(L13_30)
    if returnCode ~= _UPVALUE0_.SUCCESS then
      return returnCode
    end
  end
  _UPVALUE2_.start()
  returnCode, L1_18 = _UPVALUE1_.accessPointSet(L12_29, L13_30, L14_31, L15_32, L16_33, L17_34, L18_35, L19_36, L20_37, L21_38, L22_39, L23_40)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page accessPoints" .. returnCode)
    _UPVALUE2_.abort()
    return returnCode
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return _UPVALUE0_.SUCCESS, L1_18
end
function accessPointsSectionCreate(A0_41)
  local L1_42, L2_43, L3_44, L4_45, L5_46, L6_47, L7_48, L8_49, L9_50, L10_51, L11_52, L12_53, L13_54, L14_55, L15_56, L16_57, L17_58, L18_59, L19_60, L20_61, L21_62, L22_63
  L1_42 = ACCESS_LEVEL
  if L1_42 ~= 0 then
    L1_42 = util
    L1_42 = L1_42.appendDebugOut
    L2_43 = "Detected Unauthorized access for page accessPoints"
    L1_42(L2_43)
    L1_42 = _UPVALUE0_
    L1_42 = L1_42.UNAUTHORIZED
    return L1_42
  end
  L1_42, L2_43, L3_44, L4_45, L5_46, L6_47, L7_48, L8_49, L9_50, L10_51, L11_52 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L12_53 = A0_41["accessPoints.apName"]
  L13_54 = A0_41["accessPoints.profileName"]
  L14_55 = A0_41["accessPoints.activeTime"]
  L15_56 = A0_41["accessPoints.scheduleControl"]
  L16_57 = A0_41["accessPoints.startHour"]
  L17_58 = A0_41["accessPoints.startMinute"]
  L18_59 = A0_41["accessPoints.startMeridian"]
  L19_60 = A0_41["accessPoints.stopHour"]
  L20_61 = A0_41["accessPoints.stopMinute"]
  L21_62 = A0_41["accessPoints.stopMeridian"]
  L22_63 = A0_41["accessPoints.wlanPartition"]
  if L14_55 == "1" then
    L14_55 = "2"
  end
  if L18_59 == "1" then
    if tonumber(L16_57) == 12 then
      L16_57 = "12"
    else
      L16_57 = L16_57 + 12
    end
  else
    if tonumber(L16_57) == 12 then
      L16_57 = "00"
    else
    end
  end
  if L21_62 == "1" then
    if tonumber(L19_60) == 12 then
      L19_60 = "12"
    else
      L19_60 = L19_60 + 12
    end
  else
    if tonumber(L19_60) == 12 then
      L19_60 = "00"
    else
    end
  end
  if L15_56 == "1" then
    L15_56 = "0"
  else
    L15_56 = "1"
  end
  _UPVALUE1_.start()
  returnCode, L1_42 = _UPVALUE2_.accessPointCreate(L12_53, L13_54, L14_55, L15_56, L16_57, L17_58, L18_59, L19_60, L20_61, L21_62, L22_63)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page accessPoints" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L1_42
end
function accessPointsSectionDelete(A0_64)
  local L1_65, L2_66
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for accessPoints PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_65 = A0_64["accessPoints.cookie"]
  if L1_65 == _UPVALUE0_.NIL then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if tonumber(L1_65) == 1 or tonumber(L1_65) == 2 and UNIT_NAME == "DSR-1000AC" then
    return _UPVALUE1_.DEFAULT_AP_DELETE_ERROR
  end
  _UPVALUE2_.start()
  L2_66, cookie = _UPVALUE3_.accessPointDelete(L1_65)
  if L2_66 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page accessPoints" .. L2_66)
    _UPVALUE2_.abort()
    return L2_66
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return L2_66, cookie
end
function accessPointsSectionDeleteAll()
  local L0_67
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for accessPoints PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  _UPVALUE1_.start()
  L0_67, cookie = _UPVALUE2_.accessPointDeleteAll()
  if L0_67 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page accessPoints" .. L0_67)
    _UPVALUE1_.abort()
    return L0_67
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L0_67
end
function wirelessAPDisable(A0_68)
  local L1_69
  L1_69 = ACCESS_LEVEL
  if L1_69 ~= 0 then
    L1_69 = util
    L1_69 = L1_69.appendDebugOut
    L1_69("Detected Unauthorized access for page accessPoints")
    L1_69 = _UPVALUE0_
    L1_69 = L1_69.UNAUTHORIZED
    return L1_69
  end
  L1_69 = _UPVALUE0_
  L1_69 = L1_69.FAILURE
  if A0_68 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L1_69, statusMessage = _UPVALUE2_.accessPointDisable(A0_68)
  if L1_69 ~= _UPVALUE0_.SUCCESS then
    _UPVALUE1_.abort()
    return L1_69
  end
  L1_69 = _UPVALUE0_.SUCCESS
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_69
end
function wirelessAPDisableAll(A0_70)
  local L1_71
  L1_71 = ACCESS_LEVEL
  if L1_71 ~= 0 then
    L1_71 = util
    L1_71 = L1_71.appendDebugOut
    L1_71("Detected Unauthorized access for page accessPoints")
    L1_71 = _UPVALUE0_
    L1_71 = L1_71.UNAUTHORIZED
    return L1_71
  end
  L1_71 = _UPVALUE0_
  L1_71 = L1_71.FAILURE
  if A0_70 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L1_71 = _UPVALUE2_.accessPointDisableAll(A0_70)
  if L1_71 ~= _UPVALUE0_.SUCCESS then
    _UPVALUE1_.abort()
    return L1_71
  end
  L1_71 = _UPVALUE0_.SUCCESS
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_71
end
function wirelessAPEnable(A0_72)
  local L1_73
  L1_73 = ACCESS_LEVEL
  if L1_73 ~= 0 then
    L1_73 = util
    L1_73 = L1_73.appendDebugOut
    L1_73("Detected Unauthorized access for page accessPoints")
    L1_73 = _UPVALUE0_
    L1_73 = L1_73.UNAUTHORIZED
    return L1_73
  end
  L1_73 = _UPVALUE0_
  L1_73 = L1_73.FAILURE
  if A0_72 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L1_73 = _UPVALUE2_.accessPointEnable(A0_72)
  if L1_73 ~= _UPVALUE0_.SUCCESS then
    _UPVALUE1_.abort()
    return L1_73
  end
  L1_73 = _UPVALUE0_.SUCCESS
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_73
end
function wirelessAPEnableAll(A0_74)
  local L1_75
  L1_75 = ACCESS_LEVEL
  if L1_75 ~= 0 then
    L1_75 = util
    L1_75 = L1_75.appendDebugOut
    L1_75("Detected Unauthorized access for page accessPoints")
    L1_75 = _UPVALUE0_
    L1_75 = L1_75.UNAUTHORIZED
    return L1_75
  end
  L1_75 = _UPVALUE0_
  L1_75 = L1_75.FAILURE
  if A0_74 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L1_75 = _UPVALUE2_.accessPointEnableAll(A0_74)
  if L1_75 ~= _UPVALUE0_.SUCCESS then
    _UPVALUE1_.abort()
    return L1_75
  end
  L1_75 = _UPVALUE0_.SUCCESS
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_75
end
function accessPointSectionGetDefaults()
  local L0_76, L1_77, L2_78, L3_79
  L0_76 = _UPVALUE0_
  L0_76 = L0_76.accessPointGetDefaults
  L3_79 = L0_76()
  return L0_76, L1_77, L2_78, L3_79
end
function profileSectionGetAll()
  local L0_80, L1_81
  L0_80 = _UPVALUE0_
  L0_80 = L0_80.profileGetAll
  L1_81 = L0_80()
  return _UPVALUE1_.SUCCESS, L1_81
end
function accessPointStatusSectionGet(A0_82)
  local L1_83, L2_84
  L1_83 = _UPVALUE0_
  L1_83 = L1_83.statisticsGetCurAP
  L2_84 = A0_82
  L2_84 = L1_83(L2_84)
  return L1_83, L2_84
end
function accessPointNameGet(A0_85)
  local L1_86, L2_87, L3_88
  L1_86 = _UPVALUE0_
  L1_86 = L1_86.apNameGet
  L2_87 = A0_85
  L3_88 = L1_86(L2_87)
  if L1_86 ~= _UPVALUE1_.SUCCESS then
    return L1_86
  end
  return L1_86, L2_87, L3_88
end
function accessPointsStatus()
  local L0_89
  L0_89 = 0
  if _UPVALUE0_.accessPointEnableCheck() == 1 then
    L0_89 = 1
  else
    L0_89 = 0
  end
  return L0_89
end
