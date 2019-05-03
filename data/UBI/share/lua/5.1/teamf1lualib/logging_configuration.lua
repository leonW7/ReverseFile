local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12
L0_0 = module
L1_1 = "com.teamf1.core.logging.configuration"
L2_2 = package
L2_2 = L2_2.seeall
L0_0(L1_1, L2_2)
L0_0 = require
L1_1 = "teamf1lualib/db"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/util"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/validations"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/returnCodes"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/admin_license"
L0_0(L1_1)
L0_0 = require
L1_1 = "com.teamf1.core.returnCodes"
L0_0 = L0_0(L1_1)
L1_1 = require
L2_2 = "com.teamf1.core.validations"
L1_1 = L1_1(L2_2)
L2_2 = require
L3_3 = "com.teamf1.core.admin.license"
L2_2 = L2_2(L3_3)
L3_3 = "logConfig"
L4_4 = "FirewallLogs"
L5_5 = "compLogConfig"
L6_6 = 84
L7_7 = {}
L7_7.logStatus = "logStatus"
L7_7.compId = "componentId"
L7_7.key = "_ROWID_"
L7_7.facilityId = "facilityId"
L7_7.keyValue = "1"
L7_7.emergency = "emergency"
L7_7.alert = "alert"
L7_7.critical = "critical"
L7_7.errorStatus = "error"
L7_7.warning = "warning"
L7_7.notice = "notice"
L7_7.information = "information"
L7_7.debug = "debug"
L7_7.lanToWanAccept = "LANToWANAccept"
L7_7.lanToWanDrop = "LANToWANDrop"
L7_7.wanToLanAccept = "WANToLANAccept"
L7_7.wanToLanDrop = "WANToLANDrop"
L7_7.wanToDmzDrop = "WANToDMZDrop"
L7_7.wanToDmzAccept = "WANToDMZAccept"
L7_7.dmzToWanAccept = "DMZToWANAccept"
L7_7.dmzToWanDrop = "DMZToWANDrop"
L7_7.lanToDmzDrop = "LANToDMZDROP"
L7_7.lanToDmzAccept = "LANToDMZAccept"
L7_7.dmzToLanDrop = "DMZToLANDrop"
L7_7.dmzToLanAccept = "DMZToLANAccept"
L7_7.lanToLanAccept = "LANToLANAccept"
L7_7.lanToLanDrop = "LANToLANDrop"
L7_7.webCategoryAccept = "webCategoryAccept"
L7_7.webCategoryDrop = "webCategoryDrop"
L7_7.eventLogBitmap = "BandwidthLimitLogs"
L7_7.unicastTrafficLogBitmap = "UnicastTraffic"
L7_7.broadcastOrMulticastLogBitmap = "BroadCastORMulticastTraffic"
L7_7.ftpLogBitmap = "FtpLogs"
L7_7.redirectedIcmpLogBitmap = "IcmpRedirectedLogs"
L7_7.BandwidthLimitLogsBitMap = "BandwidthLimitLogs"
L7_7.invalidPacketsLogBitmap = "logInvalidPacket"
L7_7.categoryServerLogs = "categoryServerLogs"
L7_7.kernelLog = "0"
L7_7.systemLog = "3"
L7_7.wirelessLog = "16"
L7_7.UTMLogs = "17"
L7_7.networkLog = "18"
L7_7.vpnLog = "19"
L7_7.wcfLog = "20"
L7_7.firewallLog = "21"
L8_8 = "environment"
L9_9 = {}
L9_9.name = "name"
L9_9.value = "value"
L10_10 = "LOGGINGD_PID_FILE"
L11_11 = "kill"
L12_12 = "loggingd"
function kernelEventLogBitmapGet()
  local L1_13
  L1_13 = _UPVALUE0_
  L1_13 = L1_13.NOT_SUPPORTED
  return L1_13
end
function kernelEventLogBitmapGetNext(A0_14)
  local L2_15
  L2_15 = _UPVALUE0_
  L2_15 = L2_15.NOT_SUPPORTED
  return L2_15, A0_14
end
function kernelEventLogBitmapSet(A0_16, A1_17)
  local L2_18, L3_19, L4_20, L5_21, L6_22, L7_23
  L2_18 = _UPVALUE0_
  L2_18 = L2_18.NIL
  if A1_17 == L2_18 then
    L2_18 = _UPVALUE0_
    L2_18 = L2_18.INVALID_ARGUMENT
    return L2_18
  end
  L2_18 = Dec2Bin
  L2_18 = L2_18(L3_19, L4_20)
  binaryValue = L2_18
  L2_18 = binaryValue
  if L2_18 == L3_19 then
    L2_18 = _UPVALUE0_
    L2_18 = L2_18.FAILURE
    return L2_18
  end
  L2_18 = {
    L3_19,
    L4_20,
    L5_21,
    L6_22,
    L7_23,
    _UPVALUE1_.notice,
    _UPVALUE1_.information,
    _UPVALUE1_.debug
  }
  L6_22 = _UPVALUE1_
  L6_22 = L6_22.errorStatus
  L7_23 = _UPVALUE1_
  L7_23 = L7_23.warning
  array = L2_18
  L2_18 = tostring
  L2_18 = L2_18(L3_19)
  for L6_22 = _UPVALUE2_, _UPVALUE3_ do
    L7_23 = L2_18.sub
    L7_23 = L7_23(L2_18, L6_22, L6_22)
    if db.setAttribute(_UPVALUE4_, _UPVALUE1_.key, _UPVALUE1_.kernelLog, array[L6_22], L7_23) == _UPVALUE0_.NIL then
      return _UPVALUE0_.FAILURE
    end
  end
  return L3_19, L4_20
end
function kernelSysLogBitmapGet()
  local L1_24
  L1_24 = _UPVALUE0_
  L1_24 = L1_24.NOT_SUPPORTED
  return L1_24
end
function kernelSysLogBitmapGetNext(A0_25)
  local L2_26
  L2_26 = _UPVALUE0_
  L2_26 = L2_26.NOT_SUPPORTED
  return L2_26, A0_25
end
function kernelSysLogBitmapSet(A0_27, A1_28)
  local L2_29, L3_30, L4_31, L5_32, L6_33
  L2_29 = _UPVALUE0_
  L2_29 = L2_29.NIL
  if A1_28 == L2_29 then
    L2_29 = _UPVALUE0_
    L2_29 = L2_29.INVALID_ARGUMENT
    return L2_29
  end
  L2_29 = {
    L3_30,
    L4_31,
    L5_32,
    L6_33,
    _UPVALUE1_.warning,
    _UPVALUE1_.notice,
    _UPVALUE1_.information,
    _UPVALUE1_.debug
  }
  L6_33 = _UPVALUE1_
  L6_33 = L6_33.errorStatus
  array = L2_29
  L2_29 = Dec2Bin
  L2_29 = L2_29(L3_30, L4_31)
  binaryString = L3_30
  for L6_33 = _UPVALUE2_, _UPVALUE3_ do
    value = string.sub(binaryString, L6_33, L6_33)
    if value == _UPVALUE4_ then
      val = _UPVALUE5_
      val = db.getAttribute(_UPVALUE6_, _UPVALUE1_.key, _UPVALUE1_.kernelLog, array[L6_33]) + _UPVALUE7_
      status = db.setAttribute(_UPVALUE6_, _UPVALUE1_.key, _UPVALUE1_.kernelLog, array[L6_33], val)
      if status == _UPVALUE0_.NIL then
        return _UPVALUE0_.FAILURE, A0_27
      end
    end
  end
  return L3_30, L4_31
end
function SystemEventLogBitmapGet()
  local L1_34
  L1_34 = _UPVALUE0_
  L1_34 = L1_34.NOT_SUPPORTED
  return L1_34
end
function SystemEventLogBitmapGetNext(A0_35)
  local L2_36
  L2_36 = _UPVALUE0_
  L2_36 = L2_36.NOT_SUPPORTED
  return L2_36, A0_35
end
function SystemEventLogBitmapSet(A0_37, A1_38)
  local L2_39, L3_40, L4_41, L5_42, L6_43, L7_44
  L2_39 = _UPVALUE0_
  L2_39 = L2_39.NIL
  if A1_38 == L2_39 then
    L2_39 = _UPVALUE0_
    L2_39 = L2_39.INVALID_ARGUMENT
    return L2_39
  end
  L2_39 = Dec2Bin
  L2_39 = L2_39(L3_40, L4_41)
  if L2_39 == L3_40 then
    return L3_40
  end
  L6_43 = _UPVALUE1_
  L6_43 = L6_43.critical
  L7_44 = _UPVALUE1_
  L7_44 = L7_44.errorStatus
  array = L3_40
  string = L3_40
  for L6_43 = _UPVALUE2_, _UPVALUE3_ do
    L7_44 = string
    L7_44 = L7_44.sub
    L7_44 = L7_44(string, L6_43, L6_43)
    if db.setAttribute(_UPVALUE4_, _UPVALUE1_.key, _UPVALUE1_.systemLog, array[L6_43], L7_44) == _UPVALUE0_.NIL then
      return _UPVALUE0_.FAILURE
    end
  end
  return L3_40, L4_41
end
function SystemSysLogBitmapGet()
  local L1_45
  L1_45 = _UPVALUE0_
  L1_45 = L1_45.NOT_SUPPORTED
  return L1_45
end
function SystemSysLogBitmapGetNext(A0_46)
  local L2_47
  L2_47 = _UPVALUE0_
  L2_47 = L2_47.NOT_SUPPORTED
  return L2_47, A0_46
end
function SystemSysLogBitmapSet(A0_48, A1_49)
  local L2_50, L3_51, L4_52, L5_53
  if A1_49 == L2_50 then
    return L2_50
  end
  L5_53 = _UPVALUE1_
  L5_53 = L5_53.critical
  array = L2_50
  binaryValue = L2_50
  binaryString = L2_50
  for L5_53 = _UPVALUE2_, _UPVALUE3_ do
    value = string.sub(binaryString, L5_53, L5_53)
    if value == _UPVALUE4_ then
      val = _UPVALUE5_
      val = db.getAttribute(_UPVALUE6_, _UPVALUE1_.key, _UPVALUE1_.systemLog, array[L5_53]) + _UPVALUE7_
      status = db.setAttribute(_UPVALUE6_, _UPVALUE1_.key, _UPVALUE1_.systemLog, array[L5_53], val)
      if status == _UPVALUE0_.NIL then
        return _UPVALUE0_.FAILURE, A0_48
      end
    end
  end
  return L2_50, L3_51
end
function routingAcceptedPacketsLogBitmapGet()
  routingAcceptedLogTable = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)
  lanToWanAccept = routingAcceptedLogTable[_UPVALUE0_ .. "." .. _UPVALUE1_.lanToWanAccept]
  wanToLanAccept = routingAcceptedLogTable[_UPVALUE0_ .. "." .. _UPVALUE1_.wanToLanAccept]
  wanToDmzAccept = routingAcceptedLogTable[_UPVALUE0_ .. "." .. _UPVALUE1_.wanToDmzAccept]
  dmzToWanAccept = routingAcceptedLogTable[_UPVALUE0_ .. "." .. _UPVALUE1_.dmzToWanAccept]
  lanToDmzAccept = routingAcceptedLogTable[_UPVALUE0_ .. "." .. _UPVALUE1_.lanToDmzAccept]
  dmzToWanAccept = routingAcceptedLogTable[_UPVALUE0_ .. "." .. _UPVALUE1_.dmzToWanAccept]
  lanToLanAccept = routingAcceptedLogTable[_UPVALUE0_ .. "." .. _UPVALUE1_.lanToLanAccept]
  categoryServerLogs = routingAcceptedLogTable[_UPVALUE0_ .. "." .. _UPVALUE1_.categoryServerLogs]
  array = {
    lanToWanAccept,
    wanToLanAccept,
    wanToDmzAccept,
    dmzToWanAccept,
    lanToDmzAccept,
    dmzToWanAccept,
    lanToLanAccept,
    categoryServerLogs
  }
  routingAcceptedPacketsLogBitmap = _UPVALUE2_
  for _FORV_3_ = _UPVALUE3_, _UPVALUE4_ do
    if array[_FORV_3_] == _UPVALUE5_ then
      routingAcceptedPacketsLogBitmap = routingAcceptedPacketsLogBitmap + 2 ^ (_FORV_3_ - 1)
    end
  end
  if routingAcceptedPacketsLogBitmap == _UPVALUE6_.NIL then
    return _UPVALUE6_.FAILURE
  end
  return _UPVALUE6_.SUCCESS, 1, routingAcceptedPacketsLogBitmap
end
function routingAcceptedPacketsLogBitmapGetNext(A0_54)
  local L2_55
  L2_55 = _UPVALUE0_
  L2_55 = L2_55.NOT_SUPPORTED
  return L2_55, A0_54
end
function routingAcceptedPacketsLogBitmapSet(A0_56, A1_57)
  local L2_58, L3_59, L4_60, L5_61
  if A1_57 == L2_58 then
    return L2_58
  end
  L5_61 = _UPVALUE1_
  L5_61 = L5_61.wanToDmzAccept
  arrayAccept = L2_58
  binaryAcceptValue = L2_58
  binaryAcceptString = L2_58
  for L5_61 = _UPVALUE2_, _UPVALUE3_ do
    AcceptValue = string.sub(binaryAcceptString, L5_61, L5_61)
    if AcceptValue == _UPVALUE4_ then
      status = db.setAttribute(_UPVALUE5_, _UPVALUE1_.key, _UPVALUE1_.keyValue, arrayAccept[L5_61], _UPVALUE4_)
    else
      status = db.setAttribute(_UPVALUE5_, _UPVALUE1_.key, _UPVALUE1_.keyValue, arrayAccept[L5_61], _UPVALUE6_)
    end
    if status == _UPVALUE0_.NIL then
      return _UPVALUE0_.FAILURE, A0_56
    end
  end
  return L2_58, L3_59
end
function routingDroppedPacketsLogBitmapGet()
  lanToWanDrop = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.lanToWanDrop]
  wanToLanDrop = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.wanToLanDrop]
  wanToDmzDrop = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.wanToDmzDrop]
  dmzToWanDrop = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.dmzToWanDrop]
  lanToDmzDrop = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.lanToDmzDrop]
  dmzToWanDrop = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.dmzToWanDrop]
  lanToLanDrop = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.lanToLanDrop]
  categoryServerLogs = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.categoryServerLogs]
  array = {
    lanToWanDrop,
    wanToLanDrop,
    wanToDmzDrop,
    dmzToWanDrop,
    lanToDmzDrop,
    dmzToWanDrop,
    lanToLanDrop,
    categoryServerLogs
  }
  routingDroppedPacketsLogBitmap = _UPVALUE2_
  for _FORV_4_ = _UPVALUE3_, _UPVALUE4_ do
    if array[_FORV_4_] == _UPVALUE5_ then
      routingDroppedPacketsLogBitmap = routingDroppedPacketsLogBitmap + 2 ^ (_FORV_4_ - 1)
    end
  end
  if routingDroppedPacketsLogBitmap == _UPVALUE6_.NIL then
    return _UPVALUE6_.FAILURE
  end
  return _UPVALUE6_.SUCCESS, 1, routingDroppedPacketsLogBitmap
end
function routingDroppedPacketsLogBitmapGetNext(A0_62)
  local L2_63
  L2_63 = _UPVALUE0_
  L2_63 = L2_63.NOT_SUPPORTED
  return L2_63, A0_62
end
function routingDroppedPacketsLogBitmapSet(A0_64, A1_65)
  local L2_66, L3_67, L4_68, L5_69
  if A1_65 == L2_66 then
    return L2_66
  end
  L5_69 = _UPVALUE1_
  L5_69 = L5_69.wanToDmzDrop
  arrayDrop = L2_66
  binaryDropValue = L2_66
  binaryDropString = L2_66
  for L5_69 = _UPVALUE2_, _UPVALUE3_ do
    DropValue = string.sub(binaryDropString, L5_69, L5_69)
    if DropValue == _UPVALUE4_ then
      status = db.setAttribute(_UPVALUE5_, _UPVALUE1_.key, _UPVALUE1_.keyValue, arrayAccept[L5_69], _UPVALUE4_)
    else
      status = db.setAttribute(_UPVALUE5_, _UPVALUE1_.key, _UPVALUE1_.keyValue, arrayAccept[L5_69], _UPVALUE6_)
    end
    if status == _UPVALUE0_.NIL then
      return _UPVALUE0_.FAILURE, A0_64
    end
  end
  return L2_66, L3_67
end
function eventLogBitmapGet()
  local L0_70
  L0_70 = db
  L0_70 = L0_70.getAttribute
  L0_70 = L0_70(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue, _UPVALUE1_.eventLogBitmap)
  if L0_70 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_70
end
function eventLogBitmapGetNext(A0_71)
  local L2_72
  L2_72 = _UPVALUE0_
  L2_72 = L2_72.NOT_SUPPORTED
  return L2_72, A0_71
end
function eventLogBitmapSet(A0_73, A1_74)
  if A1_74 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.isBoolean(A1_74)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_74 == _UPVALUE2_ then
    status = db.setAttribute(_UPVALUE3_, _UPVALUE4_.key, _UPVALUE4_.keyValue, _UPVALUE4_.eventLogBitmap, _UPVALUE2_)
  else
    status = db.setAttribute(_UPVALUE3_, _UPVALUE4_.key, _UPVALUE4_.keyValue, _UPVALUE4_.eventLogBitmap, _UPVALUE5_)
  end
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_73
  end
  return _UPVALUE0_.SUCCESS, A0_73
end
function unicastTrafficLogBitmapGet()
  local L0_75
  L0_75 = db
  L0_75 = L0_75.getAttribute
  L0_75 = L0_75(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue, _UPVALUE1_.unicastTrafficLogBitmap)
  if L0_75 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_75
end
function unicastTrafficeLogBitmapGetNext(A0_76)
  local L2_77
  L2_77 = _UPVALUE0_
  L2_77 = L2_77.NOT_SUPPORTED
  return L2_77, A0_76
end
function unicastTrafficLogBitmapSet(A0_78, A1_79)
  if A1_79 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.booleanCheck(A1_79)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_79 == _UPVALUE2_ then
    status = db.setAttribute(_UPVALUE3_, _UPVALUE4_.key, _UPVALUE4_.keyValue, _UPVALUE4_.unicastTrafficLogBitmap, _UPVALUE2_)
  else
    status = db.setAttribute(_UPVALUE3_, _UPVALUE4_.key, _UPVALUE4_.keyValue, _UPVALUE4_.unicastTrafficLogBitmap, _UPVALUE5_)
  end
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_78
  end
  return _UPVALUE0_.SUCCESS, A0_78
end
function broadcastOrMulticastLogBitmapGet()
  local L0_80
  L0_80 = db
  L0_80 = L0_80.getAttribute
  L0_80 = L0_80(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue, _UPVALUE1_.broadcastOrMulticastLogBitmap)
  if L0_80 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_80
end
function broadcastOrMulticastLogBitmapGetNext(A0_81)
  local L2_82
  L2_82 = _UPVALUE0_
  L2_82 = L2_82.NOT_SUPPORTED
  return L2_82, A0_81
end
function broadcastOrMulticastLogBitmapSet(A0_83, A1_84)
  if A1_84 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.booleanCheck(A1_84)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_84 == _UPVALUE2_ then
    status = db.setAttribute(_UPVALUE3_, _UPVALUE4_.key, _UPVALUE4_.keyValue, _UPVALUE4_.broadcastOrMulticastLogBitmap, _UPVALUE2_)
  else
    status = db.setAttribute(_UPVALUE3_, _UPVALUE4_.key, _UPVALUE4_.keyValue, _UPVALUE4_.broadcastOrMulticastLogBitmap, _UPVALUE5_)
  end
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_83
  end
  return _UPVALUE0_.SUCCESS, A0_83
end
function ftpLogBitmapGet()
  local L0_85
  L0_85 = db
  L0_85 = L0_85.getAttribute
  L0_85 = L0_85(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue, _UPVALUE1_.ftpLogBitmap)
  if L0_85 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_85
end
function ftpLogBitmapGetNext(A0_86)
  local L2_87
  L2_87 = _UPVALUE0_
  L2_87 = L2_87.NOT_SUPPORTED
  return L2_87, A0_86
end
function ftpLogBitmapSet(A0_88, A1_89)
  if A1_89 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.booleanCheck(A1_89)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_89 == _UPVALUE2_ then
    status = db.setAttribute(_UPVALUE3_, _UPVALUE4_.key, _UPVALUE4_.keyValue, _UPVALUE4_.ftpLogBitmap, _UPVALUE2_)
  else
    status = db.setAttribute(_UPVALUE3_, _UPVALUE4_.key, _UPVALUE4_.keyValue, _UPVALUE4_.ftpLogBitmap, _UPVALUE5_)
  end
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_88
  end
  return _UPVALUE0_.SUCCESS, A0_88
end
function redirectedIcmpLogBitmapGet()
  local L0_90
  L0_90 = db
  L0_90 = L0_90.getAttribute
  L0_90 = L0_90(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue, _UPVALUE1_.redirectedIcmpLogBitmap)
  if L0_90 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_90
end
function redirectedIcmpLogBitmapGetNext(A0_91)
  local L2_92
  L2_92 = _UPVALUE0_
  L2_92 = L2_92.NOT_SUPPORTED
  return L2_92, A0_91
end
function redirectedIcmpLogBitmapSet(A0_93, A1_94)
  if A1_94 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.booleanCheck(A1_94)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_94 == _UPVALUE2_ then
    status = db.setAttribute(_UPVALUE3_, _UPVALUE4_.key, _UPVALUE4_.keyValue, _UPVALUE4_.redirectedIcmpLogBitmap, _UPVALUE2_)
  else
    status = db.setAttribute(_UPVALUE3_, _UPVALUE4_.key, _UPVALUE4_.keyValue, _UPVALUE4_.redirectedIcmpLogBitmap, _UPVALUE5_)
  end
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_93
  end
  return _UPVALUE0_.SUCCESS, A0_93
end
function invalidPacketsLogBitmapGet()
  local L0_95
  L0_95 = db
  L0_95 = L0_95.getAttribute
  L0_95 = L0_95(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue, _UPVALUE1_.invalidPacketsLogBitmap)
  if L0_95 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_95
end
function invalidPacketsLogBitmapGetNext(A0_96)
  local L2_97
  L2_97 = _UPVALUE0_
  L2_97 = L2_97.NOT_SUPPORTED
  return L2_97, A0_96
end
function invalidPacketsLogBitmapSet(A0_98, A1_99)
  if A1_99 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.booleanCheck(A1_99)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_99 == _UPVALUE2_ then
    status = db.setAttribute(_UPVALUE3_, _UPVALUE4_.key, _UPVALUE4_.keyValue, _UPVALUE4_.invalidPacketsLogBitmap, _UPVALUE2_)
  else
    status = db.setAttribute(_UPVALUE3_, _UPVALUE4_.key, _UPVALUE4_.keyValue, _UPVALUE4_.invalidPacketsLogBitmap, _UPVALUE5_)
  end
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_98
  end
  return _UPVALUE0_.SUCCESS, A0_98
end
function kernelFacilityLogBitmapGet()
  local L0_100, L1_101, L2_102, L3_103, L4_104, L5_105, L6_106, L7_107
  L0_100 = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.kernelLog)[_UPVALUE0_ .. "." .. _UPVALUE1_.emergency])
  L1_101 = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.kernelLog)[_UPVALUE0_ .. "." .. _UPVALUE1_.alert])
  L2_102 = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.kernelLog)[_UPVALUE0_ .. "." .. _UPVALUE1_.critical])
  L3_103 = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.kernelLog)[_UPVALUE0_ .. "." .. _UPVALUE1_.errorStatus])
  L4_104 = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.kernelLog)[_UPVALUE0_ .. "." .. _UPVALUE1_.warning])
  L5_105 = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.kernelLog)[_UPVALUE0_ .. "." .. _UPVALUE1_.notice])
  L6_106 = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.kernelLog)[_UPVALUE0_ .. "." .. _UPVALUE1_.information])
  L7_107 = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.kernelLog)[_UPVALUE0_ .. "." .. _UPVALUE1_.debug])
  if L0_100 == _UPVALUE2_.NIL or L1_101 == _UPVALUE2_.NIL or L2_102 == _UPVALUE2_.NIL or L3_103 == _UPVALUE2_.NIL or L4_104 == _UPVALUE2_.NIL or L5_105 == _UPVALUE2_.NIL or L6_106 == _UPVALUE2_.NIL or L7_107 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, _UPVALUE1_.kernelLog, L0_100, L1_101, L2_102, L3_103, L4_104, L5_105, L6_106, L7_107
end
function kernelFacilityLogBitmapGetNext(A0_108)
  local L2_109
  L2_109 = _UPVALUE0_
  L2_109 = L2_109.NOT_SUPPORTED
  return L2_109, A0_108
end
function kernelFacilityLogBitmapSet(A0_110, A1_111, A2_112)
  local L3_113, L4_114, L5_115, L6_116, L7_117
  if A1_111 == L3_113 then
    return L3_113
  end
  if A2_112 == L3_113 then
    return L3_113
  end
  L6_116 = _UPVALUE1_
  L6_116 = L6_116.critical
  L7_117 = _UPVALUE1_
  L7_117 = L7_117.errorStatus
  array = L3_113
  binarySyslogValue = L3_113
  binaryEventValue = L3_113
  binarySyslogString = L3_113
  binaryEventString = L3_113
  for L6_116 = _UPVALUE2_, _UPVALUE3_ do
    L7_117 = _UPVALUE4_
    syslogLogValue = L7_117
    L7_117 = _UPVALUE4_
    eventLogValue = L7_117
    L7_117 = string
    L7_117 = L7_117.sub
    L7_117 = L7_117(binarySyslogString, L6_116, L6_116)
    syslogValue = L7_117
    L7_117 = string
    L7_117 = L7_117.sub
    L7_117 = L7_117(binaryEventString, L6_116, L6_116)
    eventValue = L7_117
    L7_117 = syslogValue
    if L7_117 == _UPVALUE5_ then
      L7_117 = _UPVALUE6_
      syslogLogValue = L7_117
    end
    L7_117 = eventValue
    if L7_117 == _UPVALUE5_ then
      L7_117 = _UPVALUE2_
      eventLogValue = L7_117
    end
    L7_117 = bit
    L7_117 = L7_117.bor
    L7_117 = L7_117(syslogLogValue, eventLogValue)
    status = db.setAttribute(_UPVALUE7_, _UPVALUE1_.key, _UPVALUE1_.kernelLog, array[L6_116], L7_117)
    if status == _UPVALUE0_.NIL then
      return _UPVALUE0_.FAILURE, A0_110
    end
  end
  return L3_113, L4_114
end
function kernelFacilityLogBitmapCreate(A0_118, A1_119)
  return _UPVALUE0_.NOT_SUPPORTED
end
function kernelFacilityLogBitmapDelete(A0_120)
  return _UPVALUE0_.NOT_SUPPORTED
end
function systemFacilityLogBitmapGet()
  emergencyChoices = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.systemLog)[_UPVALUE0_ .. "." .. _UPVALUE1_.emergency])
  alertChoices = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.systemLog)[_UPVALUE0_ .. "." .. _UPVALUE1_.alert])
  criticalChoices = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.systemLog)[_UPVALUE0_ .. "." .. _UPVALUE1_.critical])
  errorChoices = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.systemLog)[_UPVALUE0_ .. "." .. _UPVALUE1_.errorStatus])
  warningChoices = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.systemLog)[_UPVALUE0_ .. "." .. _UPVALUE1_.warning])
  noticeChoices = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.systemLog)[_UPVALUE0_ .. "." .. _UPVALUE1_.notice])
  informationChoices = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.systemLog)[_UPVALUE0_ .. "." .. _UPVALUE1_.information])
  debugChoices = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.systemLog)[_UPVALUE0_ .. "." .. _UPVALUE1_.debug])
  if emergencyChoices == _UPVALUE2_.NIL or alertChoices == _UPVALUE2_.NIL or criticalChoices == _UPVALUE2_.NIL or errorChoices == _UPVALUE2_.NIL or warningChoices == _UPVALUE2_.NIL or noticeChoices == _UPVALUE2_.NIL or informationChoices == _UPVALUE2_.NIL or debugChoices == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, _UPVALUE1_.systemLog, emergencyChoices, alertChoices, criticalChoices, errorChoices, warningChoices, noticeChoices, informationChoices, debugChoices
end
function wirelessFacilityLogBitmapGet()
  emergencyChoices = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.wirelessLog)[_UPVALUE0_ .. "." .. _UPVALUE1_.emergency])
  alertChoices = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.wirelessLog)[_UPVALUE0_ .. "." .. _UPVALUE1_.alert])
  criticalChoices = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.wirelessLog)[_UPVALUE0_ .. "." .. _UPVALUE1_.critical])
  errorChoices = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.wirelessLog)[_UPVALUE0_ .. "." .. _UPVALUE1_.errorStatus])
  warningChoices = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.wirelessLog)[_UPVALUE0_ .. "." .. _UPVALUE1_.warning])
  noticeChoices = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.wirelessLog)[_UPVALUE0_ .. "." .. _UPVALUE1_.notice])
  informationChoices = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.wirelessLog)[_UPVALUE0_ .. "." .. _UPVALUE1_.information])
  debugChoices = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.wirelessLog)[_UPVALUE0_ .. "." .. _UPVALUE1_.debug])
  if emergencyChoices == _UPVALUE2_.NIL or alertChoices == _UPVALUE2_.NIL or criticalChoices == _UPVALUE2_.NIL or errorChoices == _UPVALUE2_.NIL or warningChoices == _UPVALUE2_.NIL or noticeChoices == _UPVALUE2_.NIL or informationChoices == _UPVALUE2_.NIL or debugChoices == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, _UPVALUE1_.wirelessLog, emergencyChoices, alertChoices, criticalChoices, errorChoices, warningChoices, noticeChoices, informationChoices, debugChoices
end
function networkFacilityLogBitmapGet()
  local L0_121
  L0_121 = db
  L0_121 = L0_121.getRow
  L0_121 = L0_121(_UPVALUE0_, _UPVALUE1_.facilityId, tonumber(_UPVALUE1_.networkLog))
  emergencyChoices = util.integerToBits(L0_121[_UPVALUE0_ .. "." .. _UPVALUE1_.emergency])
  alertChoices = util.integerToBits(L0_121[_UPVALUE0_ .. "." .. _UPVALUE1_.alert])
  criticalChoices = util.integerToBits(L0_121[_UPVALUE0_ .. "." .. _UPVALUE1_.critical])
  errorChoices = util.integerToBits(L0_121[_UPVALUE0_ .. "." .. _UPVALUE1_.errorStatus])
  warningChoices = util.integerToBits(L0_121[_UPVALUE0_ .. "." .. _UPVALUE1_.warning])
  noticeChoices = util.integerToBits(L0_121[_UPVALUE0_ .. "." .. _UPVALUE1_.notice])
  informationChoices = util.integerToBits(L0_121[_UPVALUE0_ .. "." .. _UPVALUE1_.information])
  debugChoices = util.integerToBits(L0_121[_UPVALUE0_ .. "." .. _UPVALUE1_.debug])
  if emergencyChoices == _UPVALUE2_.NIL or alertChoices == _UPVALUE2_.NIL or criticalChoices == _UPVALUE2_.NIL or errorChoices == _UPVALUE2_.NIL or warningChoices == _UPVALUE2_.NIL or noticeChoices == _UPVALUE2_.NIL or informationChoices == _UPVALUE2_.NIL or debugChoices == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, _UPVALUE1_.networkLog, emergencyChoices, alertChoices, criticalChoices, errorChoices, warningChoices, noticeChoices, informationChoices, debugChoices
end
function vpnFacilityLogBitmapGet()
  local L0_122
  L0_122 = db
  L0_122 = L0_122.getRow
  L0_122 = L0_122(_UPVALUE0_, _UPVALUE1_.facilityId, tonumber(_UPVALUE1_.vpnLog))
  emergencyChoices = util.integerToBits(L0_122[_UPVALUE0_ .. "." .. _UPVALUE1_.emergency])
  alertChoices = util.integerToBits(L0_122[_UPVALUE0_ .. "." .. _UPVALUE1_.alert])
  criticalChoices = util.integerToBits(L0_122[_UPVALUE0_ .. "." .. _UPVALUE1_.critical])
  errorChoices = util.integerToBits(L0_122[_UPVALUE0_ .. "." .. _UPVALUE1_.errorStatus])
  warningChoices = util.integerToBits(L0_122[_UPVALUE0_ .. "." .. _UPVALUE1_.warning])
  noticeChoices = util.integerToBits(L0_122[_UPVALUE0_ .. "." .. _UPVALUE1_.notice])
  informationChoices = util.integerToBits(L0_122[_UPVALUE0_ .. "." .. _UPVALUE1_.information])
  debugChoices = util.integerToBits(L0_122[_UPVALUE0_ .. "." .. _UPVALUE1_.debug])
  if emergencyChoices == _UPVALUE2_.NIL or alertChoices == _UPVALUE2_.NIL or criticalChoices == _UPVALUE2_.NIL or errorChoices == _UPVALUE2_.NIL or warningChoices == _UPVALUE2_.NIL or noticeChoices == _UPVALUE2_.NIL or informationChoices == _UPVALUE2_.NIL or debugChoices == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, _UPVALUE1_.vpnLog, emergencyChoices, alertChoices, criticalChoices, errorChoices, warningChoices, noticeChoices, informationChoices, debugChoices
end
function wcfFacilityLogBitmapGet()
  local L0_123
  L0_123 = db
  L0_123 = L0_123.getRow
  L0_123 = L0_123(_UPVALUE0_, _UPVALUE1_.facilityId, tonumber(_UPVALUE1_.wcfLog))
  emergencyChoices = util.integerToBits(L0_123[_UPVALUE0_ .. "." .. _UPVALUE1_.emergency])
  alertChoices = util.integerToBits(L0_123[_UPVALUE0_ .. "." .. _UPVALUE1_.alert])
  criticalChoices = util.integerToBits(L0_123[_UPVALUE0_ .. "." .. _UPVALUE1_.critical])
  errorChoices = util.integerToBits(L0_123[_UPVALUE0_ .. "." .. _UPVALUE1_.errorStatus])
  warningChoices = util.integerToBits(L0_123[_UPVALUE0_ .. "." .. _UPVALUE1_.warning])
  noticeChoices = util.integerToBits(L0_123[_UPVALUE0_ .. "." .. _UPVALUE1_.notice])
  informationChoices = util.integerToBits(L0_123[_UPVALUE0_ .. "." .. _UPVALUE1_.information])
  debugChoices = util.integerToBits(L0_123[_UPVALUE0_ .. "." .. _UPVALUE1_.debug])
  if emergencyChoices == _UPVALUE2_.NIL or alertChoices == _UPVALUE2_.NIL or criticalChoices == _UPVALUE2_.NIL or errorChoices == _UPVALUE2_.NIL or warningChoices == _UPVALUE2_.NIL or noticeChoices == _UPVALUE2_.NIL or informationChoices == _UPVALUE2_.NIL or debugChoices == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, _UPVALUE1_.wcfLog, emergencyChoices, alertChoices, criticalChoices, errorChoices, warningChoices, noticeChoices, informationChoices, debugChoices
end
function firewallFacilityLogBitmapGet()
  local L0_124
  L0_124 = db
  L0_124 = L0_124.getRow
  L0_124 = L0_124(_UPVALUE0_, _UPVALUE1_.facilityId, tonumber(_UPVALUE1_.firewallLog))
  emergencyChoices = util.integerToBits(L0_124[_UPVALUE0_ .. "." .. _UPVALUE1_.emergency])
  alertChoices = util.integerToBits(L0_124[_UPVALUE0_ .. "." .. _UPVALUE1_.alert])
  criticalChoices = util.integerToBits(L0_124[_UPVALUE0_ .. "." .. _UPVALUE1_.critical])
  errorChoices = util.integerToBits(L0_124[_UPVALUE0_ .. "." .. _UPVALUE1_.errorStatus])
  warningChoices = util.integerToBits(L0_124[_UPVALUE0_ .. "." .. _UPVALUE1_.warning])
  noticeChoices = util.integerToBits(L0_124[_UPVALUE0_ .. "." .. _UPVALUE1_.notice])
  informationChoices = util.integerToBits(L0_124[_UPVALUE0_ .. "." .. _UPVALUE1_.information])
  debugChoices = util.integerToBits(L0_124[_UPVALUE0_ .. "." .. _UPVALUE1_.debug])
  if emergencyChoices == _UPVALUE2_.NIL or alertChoices == _UPVALUE2_.NIL or criticalChoices == _UPVALUE2_.NIL or errorChoices == _UPVALUE2_.NIL or warningChoices == _UPVALUE2_.NIL or noticeChoices == _UPVALUE2_.NIL or informationChoices == _UPVALUE2_.NIL or debugChoices == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, _UPVALUE1_.firewallLog, emergencyChoices, alertChoices, criticalChoices, errorChoices, warningChoices, noticeChoices, informationChoices, debugChoices
end
function utmFacilityLogBitmapGet()
  emergencyChoices = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.UTMLogs)[_UPVALUE0_ .. "." .. _UPVALUE1_.emergency])
  alertChoices = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.UTMLogs)[_UPVALUE0_ .. "." .. _UPVALUE1_.alert])
  criticalChoices = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.UTMLogs)[_UPVALUE0_ .. "." .. _UPVALUE1_.critical])
  errorChoices = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.UTMLogs)[_UPVALUE0_ .. "." .. _UPVALUE1_.errorStatus])
  warningChoices = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.UTMLogs)[_UPVALUE0_ .. "." .. _UPVALUE1_.warning])
  noticeChoices = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.UTMLogs)[_UPVALUE0_ .. "." .. _UPVALUE1_.notice])
  informationChoices = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.UTMLogs)[_UPVALUE0_ .. "." .. _UPVALUE1_.information])
  debugChoices = util.integerToBits(db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.UTMLogs)[_UPVALUE0_ .. "." .. _UPVALUE1_.debug])
  if emergencyChoices == _UPVALUE2_.NIL or alertChoices == _UPVALUE2_.NIL or criticalChoices == _UPVALUE2_.NIL or errorChoices == _UPVALUE2_.NIL or warningChoices == _UPVALUE2_.NIL or noticeChoices == _UPVALUE2_.NIL or informationChoices == _UPVALUE2_.NIL or debugChoices == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, _UPVALUE1_.UTMLogs, emergencyChoices, alertChoices, criticalChoices, errorChoices, warningChoices, noticeChoices, informationChoices, debugChoices
end
function systemFacilityLogBitmapGetNext(A0_125)
  local L2_126
  L2_126 = _UPVALUE0_
  L2_126 = L2_126.NOT_SUPPORTED
  return L2_126, A0_125
end
function systemFacilityLogBitmapSet(A0_127, A1_128, A2_129)
  local L3_130, L4_131, L5_132, L6_133, L7_134
  if A1_128 == L3_130 then
    return L3_130
  end
  if A2_129 == L3_130 then
    return L3_130
  end
  L6_133 = _UPVALUE1_
  L6_133 = L6_133.critical
  L7_134 = _UPVALUE1_
  L7_134 = L7_134.errorStatus
  array = L3_130
  binarySyslogValue = L3_130
  binaryEventValue = L3_130
  binarySyslogString = L3_130
  binaryEventString = L3_130
  for L6_133 = _UPVALUE2_, _UPVALUE3_ do
    L7_134 = _UPVALUE4_
    syslogLogValue = L7_134
    L7_134 = _UPVALUE4_
    eventLogValue = L7_134
    L7_134 = string
    L7_134 = L7_134.sub
    L7_134 = L7_134(binarySyslogString, L6_133, L6_133)
    syslogValue = L7_134
    L7_134 = string
    L7_134 = L7_134.sub
    L7_134 = L7_134(binaryEventString, L6_133, L6_133)
    eventValue = L7_134
    L7_134 = syslogValue
    if L7_134 == _UPVALUE5_ then
      L7_134 = _UPVALUE6_
      syslogLogValue = L7_134
    end
    L7_134 = eventValue
    if L7_134 == _UPVALUE5_ then
      L7_134 = _UPVALUE2_
      eventLogValue = L7_134
    end
    L7_134 = bit
    L7_134 = L7_134.bor
    L7_134 = L7_134(syslogLogValue, eventLogValue)
    status = db.setAttribute(_UPVALUE7_, _UPVALUE1_.key, _UPVALUE1_.systemLog, array[L6_133], L7_134)
    if status == _UPVALUE0_.NIL then
      return _UPVALUE0_.FAILURE, A0_127
    end
  end
  return L3_130, L4_131
end
function systemFacilityLogBitmapCreate(A0_135, A1_136)
  return _UPVALUE0_.NOT_SUPPORTED
end
function systemFacilityLogBitmapDelete(A0_137)
  local L2_138
  L2_138 = _UPVALUE0_
  L2_138 = L2_138.NOT_SUPPORTED
  return L2_138, A0_137
end
function routingPacketslogBitmapGet()
  local L0_139, L1_140, L2_141, L3_142, L4_143, L5_144, L6_145, L7_146, L8_147, L9_148, L10_149, L11_150, L12_151, L13_152, L14_153, L15_154, L16_155
  L0_139 = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.lanToWanAccept]
  L1_140 = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.lanToWanDrop]
  L2_141 = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.wanToLanAccept]
  L3_142 = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.wanToLanDrop]
  L4_143 = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.wanToDmzAccept]
  L5_144 = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.wanToDmzDrop]
  L6_145 = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.dmzToWanAccept]
  L7_146 = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.dmzToWanDrop]
  L8_147 = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.lanToDmzAccept]
  L9_148 = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.lanToDmzDrop]
  L10_149 = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.dmzToLanAccept]
  L11_150 = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.dmzToLanDrop]
  L12_151 = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.lanToLanAccept]
  L13_152 = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.lanToLanDrop]
  L15_154 = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.webCategoryDrop]
  L14_153 = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.webCategoryAccept]
  L16_155 = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.categoryServerLogs]
  if L0_139 == _UPVALUE2_.NIL or L1_140 == _UPVALUE2_.NIL or L2_141 == _UPVALUE2_.NIL or L3_142 == _UPVALUE2_.NIL or L4_143 == _UPVALUE2_.NIL or L5_144 == _UPVALUE2_.NIL or L6_145 == _UPVALUE2_.NIL or L7_146 == _UPVALUE2_.NIL or L8_147 == _UPVALUE2_.NIL or L9_148 == _UPVALUE2_.NIL or L10_149 == _UPVALUE2_.NIL or L11_150 == _UPVALUE2_.NIL or L12_151 == _UPVALUE2_.NIL or L13_152 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_139, L1_140, L2_141, L3_142, L4_143, L5_144, L6_145, L7_146, L8_147, L9_148, L10_149, L11_150, L12_151, L13_152, L16_155, L15_154, L14_153
end
function routingPacketslogBitmapGetNext(A0_156)
  local L2_157
  L2_157 = _UPVALUE0_
  L2_157 = L2_157.NOT_SUPPORTED
  return L2_157, A0_156
end
function routingPacketslogBitmapSet(A0_158, A1_159, A2_160)
  local L3_161, L4_162, L5_163, L6_164
  if A1_159 == L3_161 then
    return L3_161
  end
  if A2_160 == L3_161 then
    return L3_161
  end
  L6_164 = _UPVALUE1_
  L6_164 = L6_164.wanToDmzAccept
  arrayAccept = L3_161
  L6_164 = _UPVALUE1_
  L6_164 = L6_164.wanToDmzDrop
  arrayDrop = L3_161
  binaryAcceptValue = L3_161
  binaryDropValue = L3_161
  binaryAcceptString = L3_161
  binaryDropString = L3_161
  for L6_164 = _UPVALUE2_, _UPVALUE3_ do
    AcceptValue = string.sub(binaryAcceptString, L6_164, L6_164)
    DropValue = string.sub(binaryDropString, L6_164, L6_164)
    if AcceptValue == _UPVALUE4_ then
      status = db.setAttribute(_UPVALUE5_, _UPVALUE1_.key, _UPVALUE1_.keyValue, arrayAccept[L6_164], _UPVALUE4_)
    else
      status = db.setAttribute(_UPVALUE5_, _UPVALUE1_.key, _UPVALUE1_.keyValue, arrayAccept[L6_164], _UPVALUE6_)
    end
    if status == _UPVALUE0_.NIL then
      return _UPVALUE0_.FAILURE, A0_158
    end
    if DropValue == _UPVALUE4_ then
      status = db.setAttribute(_UPVALUE5_, _UPVALUE1_.key, _UPVALUE1_.keyValue, arrayDrop[L6_164], _UPVALUE4_)
    else
      status = db.setAttribute(_UPVALUE5_, _UPVALUE1_.key, _UPVALUE1_.keyValue, arrayDrop[L6_164], _UPVALUE6_)
    end
    if status == _UPVALUE0_.NIL then
      return _UPVALUE0_.FAILURE, A0_158
    end
  end
  return L3_161, L4_162
end
function routingPacketslogBitmapCreate(A0_165, A1_166)
  local L3_167
  L3_167 = _UPVALUE0_
  L3_167 = L3_167.NOT_SUPPORTED
  return L3_167, cookie
end
function routingPacketslogBitmapDelete(A0_168)
  return _UPVALUE0_.NOT_SUPPORTED
end
function systemLogBitmapGet()
  local L0_169, L1_170, L2_171, L3_172, L4_173
  L0_169 = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.unicastTrafficLogBitmap]
  L1_170 = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.broadcastOrMulticastLogBitmap]
  L2_171 = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.ftpLogBitmap]
  L3_172 = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.redirectedIcmpLogBitmap]
  L4_173 = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.invalidPacketsLogBitmap]
  categoryServerLogs = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.categoryServerLogs]
  bwLimitLogs = db.getRow(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue)[_UPVALUE0_ .. "." .. _UPVALUE1_.BandwidthLimitLogsBitMap]
  if L0_169 == _UPVALUE2_.NIL or L1_170 == _UPVALUE2_.NIL or L2_171 == _UPVALUE2_.NIL or L3_172 == _UPVALUE2_.NIL or L4_173 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_169, L1_170, L2_171, L3_172, L4_173, categoryServerLogs, bwLimitLogs
end
function systemLogBitmapGetNext(A0_174)
  local L2_175
  L2_175 = _UPVALUE0_
  L2_175 = L2_175.NOT_SUPPORTED
  return L2_175, A0_174
end
function systemLogBitmapSet(A0_176, A1_177, A2_178, A3_179, A4_180, A5_181, A6_182, A7_183)
  local L8_184
  L8_184 = {}
  if A1_177 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A2_178 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A3_179 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A4_180 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A7_183 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A5_181 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.isBoolean(A1_177)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  valid = _UPVALUE1_.isBoolean(A2_178)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  valid = _UPVALUE1_.isBoolean(A3_179)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  valid = _UPVALUE1_.isBoolean(A5_181)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  valid = _UPVALUE1_.isBoolean(A4_180)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  valid = _UPVALUE1_.isBoolean(A7_183)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  if _UPVALUE2_.wcfLicenseStatusGet() then
    if A6_182 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    valid = _UPVALUE1_.isBoolean(A6_182)
    if valid ~= _UPVALUE0_.SUCCESS then
      return _UPVALUE0_.FAILURE
    end
    L8_184[_UPVALUE3_ .. "." .. _UPVALUE4_.categoryServerLogs] = A6_182
  end
  L8_184[_UPVALUE3_ .. "." .. _UPVALUE4_.invalidPacketsLogBitmap] = A5_181
  L8_184[_UPVALUE3_ .. "." .. _UPVALUE4_.redirectedIcmpLogBitmap] = A4_180
  L8_184[_UPVALUE3_ .. "." .. _UPVALUE4_.ftpLogBitmap] = A3_179
  L8_184[_UPVALUE3_ .. "." .. _UPVALUE4_.broadcastOrMulticastLogBitmap] = A2_178
  L8_184[_UPVALUE3_ .. "." .. _UPVALUE4_.unicastTrafficLogBitmap] = A1_177
  L8_184[_UPVALUE3_ .. "." .. _UPVALUE4_.BandwidthLimitLogsBitMap] = A7_183
  status = db.update(_UPVALUE3_, L8_184, _UPVALUE4_.keyValue)
  if not status then
    return _UPVALUE0_.FAILURE, A0_176
  end
  return _UPVALUE0_.SUCCESS, A0_176
end
function systemLogBitmapCreate(A0_185, A1_186, A2_187, A3_188, A4_189)
  return _UPVALUE0_.NOT_SUPPORTED
end
function systemLogBitmapDelete(A0_190)
  local L2_191
  L2_191 = _UPVALUE0_
  L2_191 = L2_191.NOT_SUPPORTED
  return L2_191, A0_190
end
function routingLogsSetup(A0_192, A1_193, A2_194, A3_195, A4_196, A5_197, A6_198, A7_199, A8_200, A9_201, A10_202, A11_203, A12_204, A13_205, A14_206, A15_207, A16_208)
  local L17_209
  L17_209 = {}
  if A1_193 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A2_194 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A3_195 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A4_196 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A15_207 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A16_208 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.isBoolean(A1_193)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  valid = _UPVALUE1_.isBoolean(A2_194)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  valid = _UPVALUE1_.isBoolean(A3_195)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  valid = _UPVALUE1_.isBoolean(A4_196)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  L17_209[_UPVALUE2_ .. "." .. _UPVALUE3_.lanToWanAccept] = A1_193
  L17_209[_UPVALUE2_ .. "." .. _UPVALUE3_.lanToWanDrop] = A2_194
  L17_209[_UPVALUE2_ .. "." .. _UPVALUE3_.wanToLanAccept] = A3_195
  L17_209[_UPVALUE2_ .. "." .. _UPVALUE3_.wanToLanDrop] = A4_196
  L17_209[_UPVALUE2_ .. "." .. _UPVALUE3_.webCategoryAccept] = A15_207
  L17_209[_UPVALUE2_ .. "." .. _UPVALUE3_.webCategoryDrop] = A16_208
  if A5_197 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A6_198 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A7_199 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A8_200 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A9_201 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A10_202 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A11_203 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A12_204 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A13_205 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A14_206 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.isBoolean(A5_197)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  valid = _UPVALUE1_.isBoolean(A6_198)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  valid = _UPVALUE1_.isBoolean(A7_199)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  valid = _UPVALUE1_.isBoolean(A8_200)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  valid = _UPVALUE1_.isBoolean(A9_201)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  valid = _UPVALUE1_.isBoolean(A10_202)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  valid = _UPVALUE1_.isBoolean(A11_203)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  valid = _UPVALUE1_.isBoolean(A12_204)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  valid = _UPVALUE1_.isBoolean(A13_205)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  valid = _UPVALUE1_.isBoolean(A14_206)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  L17_209[_UPVALUE2_ .. "." .. _UPVALUE3_.wanToDmzAccept] = A5_197
  L17_209[_UPVALUE2_ .. "." .. _UPVALUE3_.wanToDmzDrop] = A6_198
  L17_209[_UPVALUE2_ .. "." .. _UPVALUE3_.dmzToWanAccept] = A7_199
  L17_209[_UPVALUE2_ .. "." .. _UPVALUE3_.dmzToWanDrop] = A8_200
  L17_209[_UPVALUE2_ .. "." .. _UPVALUE3_.lanToDmzAccept] = A9_201
  L17_209[_UPVALUE2_ .. "." .. _UPVALUE3_.lanToDmzDrop] = A10_202
  L17_209[_UPVALUE2_ .. "." .. _UPVALUE3_.dmzToLanAccept] = A11_203
  L17_209[_UPVALUE2_ .. "." .. _UPVALUE3_.dmzToLanDrop] = A12_204
  L17_209[_UPVALUE2_ .. "." .. _UPVALUE3_.lanToLanDrop] = A14_206
  L17_209[_UPVALUE2_ .. "." .. _UPVALUE3_.lanToLanAccept] = A13_205
  status = db.update(_UPVALUE2_, L17_209, _UPVALUE3_.keyValue)
  if not status then
    return _UPVALUE0_.FAILURE, A0_192
  end
  return _UPVALUE0_.SUCCESS, A0_192
end
function systemFacilityLogsSet(A0_210, A1_211, A2_212, A3_213, A4_214, A5_215, A6_216, A7_217, A8_218)
  if A1_211 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A2_212 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A3_213 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A4_214 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A5_215 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A6_216 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A7_217 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A8_218 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.systemLog, _UPVALUE2_.emergency, A1_211)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_210
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.systemLog, _UPVALUE2_.alert, A2_212)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_210
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.systemLog, _UPVALUE2_.critical, A3_213)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_210
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.systemLog, _UPVALUE2_.errorStatus, A4_214)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_210
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.systemLog, _UPVALUE2_.warning, A5_215)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_210
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.systemLog, _UPVALUE2_.notice, A6_216)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_210
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.systemLog, _UPVALUE2_.information, A7_217)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_210
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.systemLog, _UPVALUE2_.debug, A8_218)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_210
  end
  return _UPVALUE0_.SUCCESS, A0_210
end
function utmFacilityLogsSet(A0_219, A1_220, A2_221, A3_222, A4_223, A5_224, A6_225, A7_226, A8_227)
  if A1_220 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A2_221 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A3_222 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A4_223 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A5_224 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A6_225 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A7_226 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A8_227 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.UTMLogs, _UPVALUE2_.emergency, A1_220)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_219
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.UTMLogs, _UPVALUE2_.alert, A2_221)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_219
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.UTMLogs, _UPVALUE2_.critical, A3_222)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_219
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.UTMLogs, _UPVALUE2_.errorStatus, A4_223)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_219
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.UTMLogs, _UPVALUE2_.warning, A5_224)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_219
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.UTMLogs, _UPVALUE2_.notice, A6_225)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_219
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.UTMLogs, _UPVALUE2_.information, A7_226)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_219
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.UTMLogs, _UPVALUE2_.debug, A8_227)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_219
  end
  return _UPVALUE0_.SUCCESS, A0_219
end
function wirelessFacilityLogsSet(A0_228, A1_229, A2_230, A3_231, A4_232, A5_233, A6_234, A7_235, A8_236)
  if A1_229 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A2_230 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A3_231 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A4_232 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A5_233 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A6_234 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A7_235 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A8_236 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.wirelessLog, _UPVALUE2_.emergency, A1_229)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_228
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.wirelessLog, _UPVALUE2_.alert, A2_230)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_228
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.wirelessLog, _UPVALUE2_.critical, A3_231)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_228
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.wirelessLog, _UPVALUE2_.errorStatus, A4_232)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_228
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.wirelessLog, _UPVALUE2_.warning, A5_233)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_228
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.wirelessLog, _UPVALUE2_.notice, A6_234)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_228
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.wirelessLog, _UPVALUE2_.information, A7_235)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_228
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.wirelessLog, _UPVALUE2_.debug, A8_236)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_228
  end
  return _UPVALUE0_.SUCCESS, A0_228
end
function networkFacilityLogsSet(A0_237, A1_238, A2_239, A3_240, A4_241, A5_242, A6_243, A7_244, A8_245)
  local L9_246, L10_247, L11_248
  L9_246 = {}
  L10_247 = _UPVALUE0_
  L10_247 = L10_247.facilityId
  L11_248 = "="
  L10_247 = L10_247 .. L11_248 .. _UPVALUE0_.networkLog
  L11_248 = nil
  L9_246 = db.getRowWhere(_UPVALUE1_, L10_247)
  if L9_246 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  if A1_238 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A2_239 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A3_240 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A4_241 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A5_242 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A6_243 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A7_244 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A8_245 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  L9_246[_UPVALUE1_ .. "." .. _UPVALUE0_.emergency] = A1_238
  L9_246[_UPVALUE1_ .. "." .. _UPVALUE0_.alert] = A2_239
  L9_246[_UPVALUE1_ .. "." .. _UPVALUE0_.critical] = A3_240
  L9_246[_UPVALUE1_ .. "." .. _UPVALUE0_.errorStatus] = A4_241
  L9_246[_UPVALUE1_ .. "." .. _UPVALUE0_.warning] = A5_242
  L9_246[_UPVALUE1_ .. "." .. _UPVALUE0_.notice] = A6_243
  L9_246[_UPVALUE1_ .. "." .. _UPVALUE0_.information] = A7_244
  L9_246[_UPVALUE1_ .. "." .. _UPVALUE0_.debug] = A8_245
  L9_246[_UPVALUE1_ .. "." .. _UPVALUE0_.debug] = A8_245
  L11_248 = L9_246[_UPVALUE1_ .. "." .. _UPVALUE0_.key]
  status = db.update(_UPVALUE1_, L9_246, L11_248)
  if not status then
    return _UPVALUE2_.FAILURE, A0_237
  end
  return _UPVALUE2_.SUCCESS, A0_237
end
function vpnFacilityLogsSet(A0_249, A1_250, A2_251, A3_252, A4_253, A5_254, A6_255, A7_256, A8_257)
  local L9_258, L10_259, L11_260
  L9_258 = {}
  L10_259 = _UPVALUE0_
  L10_259 = L10_259.facilityId
  L11_260 = "="
  L10_259 = L10_259 .. L11_260 .. _UPVALUE0_.vpnLog
  L11_260 = nil
  L9_258 = db.getRowWhere(_UPVALUE1_, L10_259)
  if L9_258 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  if A1_250 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A2_251 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A3_252 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A4_253 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A5_254 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A6_255 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A7_256 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A8_257 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  L9_258[_UPVALUE1_ .. "." .. _UPVALUE0_.emergency] = A1_250
  L9_258[_UPVALUE1_ .. "." .. _UPVALUE0_.alert] = A2_251
  L9_258[_UPVALUE1_ .. "." .. _UPVALUE0_.critical] = A3_252
  L9_258[_UPVALUE1_ .. "." .. _UPVALUE0_.errorStatus] = A4_253
  L9_258[_UPVALUE1_ .. "." .. _UPVALUE0_.warning] = A5_254
  L9_258[_UPVALUE1_ .. "." .. _UPVALUE0_.notice] = A6_255
  L9_258[_UPVALUE1_ .. "." .. _UPVALUE0_.information] = A7_256
  L9_258[_UPVALUE1_ .. "." .. _UPVALUE0_.debug] = A8_257
  L11_260 = L9_258[_UPVALUE1_ .. "." .. _UPVALUE0_.key]
  status = db.update(_UPVALUE1_, L9_258, L11_260)
  if not status then
    return _UPVALUE2_.FAILURE, A0_249
  end
  return _UPVALUE2_.SUCCESS, A0_249
end
function wcfFacilityLogsSet(A0_261, A1_262, A2_263, A3_264, A4_265, A5_266, A6_267, A7_268, A8_269)
  local L9_270, L10_271, L11_272
  L9_270 = {}
  L10_271 = _UPVALUE0_
  L10_271 = L10_271.facilityId
  L11_272 = "="
  L10_271 = L10_271 .. L11_272 .. _UPVALUE0_.wcfLog
  L11_272 = nil
  L9_270 = db.getRowWhere(_UPVALUE1_, L10_271)
  if L9_270 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  if A1_262 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A2_263 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A3_264 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A4_265 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A5_266 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A6_267 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A7_268 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A8_269 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  L9_270[_UPVALUE1_ .. "." .. _UPVALUE0_.emergency] = A1_262
  L9_270[_UPVALUE1_ .. "." .. _UPVALUE0_.alert] = A2_263
  L9_270[_UPVALUE1_ .. "." .. _UPVALUE0_.critical] = A3_264
  L9_270[_UPVALUE1_ .. "." .. _UPVALUE0_.errorStatus] = A4_265
  L9_270[_UPVALUE1_ .. "." .. _UPVALUE0_.warning] = A5_266
  L9_270[_UPVALUE1_ .. "." .. _UPVALUE0_.notice] = A6_267
  L9_270[_UPVALUE1_ .. "." .. _UPVALUE0_.information] = A7_268
  L9_270[_UPVALUE1_ .. "." .. _UPVALUE0_.debug] = A8_269
  L11_272 = L9_270[_UPVALUE1_ .. "." .. _UPVALUE0_.key]
  status = db.update(_UPVALUE1_, L9_270, L11_272)
  if not status then
    return _UPVALUE2_.FAILURE, A0_261
  end
  return _UPVALUE2_.SUCCESS, A0_261
end
function firewallFacilityLogsSet(A0_273, A1_274, A2_275, A3_276, A4_277, A5_278, A6_279, A7_280, A8_281)
  local L9_282, L10_283, L11_284
  L9_282 = {}
  L10_283 = _UPVALUE0_
  L10_283 = L10_283.facilityId
  L11_284 = "="
  L10_283 = L10_283 .. L11_284 .. _UPVALUE0_.firewallLog
  L11_284 = nil
  L9_282 = db.getRowWhere(_UPVALUE1_, L10_283)
  if L9_282 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  if A1_274 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A2_275 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A3_276 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A4_277 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A5_278 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A6_279 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A7_280 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A8_281 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  L9_282[_UPVALUE1_ .. "." .. _UPVALUE0_.emergency] = A1_274
  L9_282[_UPVALUE1_ .. "." .. _UPVALUE0_.alert] = A2_275
  L9_282[_UPVALUE1_ .. "." .. _UPVALUE0_.critical] = A3_276
  L9_282[_UPVALUE1_ .. "." .. _UPVALUE0_.errorStatus] = A4_277
  L9_282[_UPVALUE1_ .. "." .. _UPVALUE0_.warning] = A5_278
  L9_282[_UPVALUE1_ .. "." .. _UPVALUE0_.notice] = A6_279
  L9_282[_UPVALUE1_ .. "." .. _UPVALUE0_.information] = A7_280
  L9_282[_UPVALUE1_ .. "." .. _UPVALUE0_.debug] = A8_281
  L11_284 = L9_282[_UPVALUE1_ .. "." .. _UPVALUE0_.key]
  status = db.update(_UPVALUE1_, L9_282, L11_284)
  if not status then
    return _UPVALUE2_.FAILURE, A0_273
  end
  return _UPVALUE2_.SUCCESS, A0_273
end
function kernelFacilityLogsSet(A0_285, A1_286, A2_287, A3_288, A4_289, A5_290, A6_291, A7_292, A8_293)
  if A1_286 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A2_287 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A3_288 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A4_289 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A5_290 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A6_291 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A7_292 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A8_293 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.kernelLog, _UPVALUE2_.emergency, A1_286)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_285
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.kernelLog, _UPVALUE2_.alert, A2_287)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_285
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.kernelLog, _UPVALUE2_.critical, A3_288)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_285
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.kernelLog, _UPVALUE2_.errorStatus, A4_289)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_285
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.kernelLog, _UPVALUE2_.warning, A5_290)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_285
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.kernelLog, _UPVALUE2_.notice, A6_291)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_285
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.kernelLog, _UPVALUE2_.information, A7_292)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_285
  end
  status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.kernelLog, _UPVALUE2_.debug, A8_293)
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_285
  end
  return _UPVALUE0_.SUCCESS, A0_285
end
function captivePortalLogSet(A0_294, A1_295)
  if A1_295 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_295 ~= _UPVALUE1_ and A1_295 ~= _UPVALUE2_ then
    return _UPVALUE0_.ERROR
  end
  if db.setAttribute(_UPVALUE3_, _UPVALUE4_.compId, _UPVALUE5_, _UPVALUE4_.logStatus, A1_295) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, A0_294
end
function captivePortalLogGet()
  local L0_296, L1_297
  L0_296 = db
  L0_296 = L0_296.getAttribute
  L1_297 = _UPVALUE0_
  L0_296 = L0_296(L1_297, _UPVALUE1_.compId, _UPVALUE2_, _UPVALUE1_.logStatus)
  L1_297 = _UPVALUE3_
  L1_297 = L1_297.NIL
  if L0_296 == L1_297 then
    L1_297 = _UPVALUE3_
    L1_297 = L1_297.FAILURE
    return L1_297, cookie
  end
  L1_297 = 1
  return _UPVALUE3_.SUCCESS, L1_297, L0_296
end
function logDaemonCmdExec(A0_298)
  os.execute(A0_298)
end
function logDaemonStartStopHandler()
  local L0_299, L1_300, L2_301, L3_302, L4_303, L5_304, L6_305, L7_306, L8_307, L9_308
  L0_299 = _UPVALUE0_
  L0_299 = L0_299.NIL
  L1_300 = _UPVALUE0_
  L1_300 = L1_300.NIL
  L2_301 = 0
  L3_302 = _UPVALUE0_
  L3_302 = L3_302.NIL
  L4_303 = _UPVALUE0_
  L4_303 = L4_303.NIL
  L5_304 = _UPVALUE0_
  L5_304 = L5_304.NIL
  L6_305 = 0
  L7_306 = _UPVALUE0_
  L7_306 = L7_306.NIL
  L8_307 = _UPVALUE0_
  L8_307 = L8_307.NIL
  L9_308 = _UPVALUE0_
  L9_308 = L9_308.NIL
  L1_300 = _UPVALUE1_.emergency .. " !=0 or " .. _UPVALUE1_.alert .. " !=0 or " .. _UPVALUE1_.critical .. " !=0 or " .. _UPVALUE1_.errorStatus .. " !=0 or " .. _UPVALUE1_.warning .. " !=0 or " .. _UPVALUE1_.notice .. " !=0 or " .. _UPVALUE1_.information .. " !=0 or " .. _UPVALUE1_.debug .. " !=0"
  L0_299 = db.execute(string.format([[
                     SELECT COUNT(*) FROM %s WHERE %s 
                     ]], _UPVALUE2_, L1_300))
  if L0_299 then
    L0_299:close()
    L2_301 = L0_299:fetch({}, "n")[1]
  else
    L2_301 = "0"
  end
  L7_306 = db.getAttribute(_UPVALUE3_, _UPVALUE4_.name, _UPVALUE5_, _UPVALUE4_.value)
  if L7_306 ~= nil then
    L4_303 = io.open(L7_306, "r")
    if L4_303 ~= nil then
      L5_304 = L4_303:read("*l")
      io.close(L4_303)
      L6_305 = 1
    else
      L6_305 = 0
    end
  else
    return _UPVALUE0_.FAILURE
  end
  if (L2_301 == nil or L2_301 == "0") and L6_305 == 1 then
    L8_307 = io.open(_UPVALUE6_, "r")
    if L8_307 ~= nil then
      L9_308 = L8_307:read("*l")
      logDaemonCmdExec(_UPVALUE7_ .. " -9 " .. L9_308)
      io.close(L8_307)
      logDaemonCmdExec("rm -rf " .. _UPVALUE6_)
    end
    logDaemonCmdExec("rm -rf " .. L7_306)
    if L5_304 ~= nil then
      logDaemonCmdExec(_UPVALUE8_ .. L5_304)
    else
      logDaemonCmdExec(_UPVALUE9_)
    end
  elseif L6_305 == 0 then
    logDaemonCmdExec(_UPVALUE10_ .. _UPVALUE11_ .. " " .. _UPVALUE12_)
  end
  return _UPVALUE0_.SUCCESS
end
