local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/fwValidations")
L0_0 = "1"
fw.core.firewallLogs = {}
fw.core.firewallLogs.Ipv4 = {}
fw.core.firewallLogs.Ipv6 = {}
Ipv4firewallLogsTable = "FirewallLogs"
;({}).lanToWanAccept = "LANToWANAccept"
;({}).lanToWanDrop = "LANToWANDrop"
;({}).wanToLanAccept = "WANToLANAccept"
;({}).wanToLanDrop = "WANToLANDrop"
;({}).lanToDmzAccept = "LANToDMZAccept"
;({}).lanToDmzDrop = "LANToDMZDROP"
;({}).dmzToWanAccept = "DMZToWANAccept"
;({}).dmzToWanDrop = "DMZToWANDrop"
;({}).dmzToLanAccept = "DMZToLANAccept"
;({}).dmzToLanDrop = "DMZToLANDrop"
;({}).wanToDmzDrop = "WANToDMZDrop"
;({}).wanToDmzAccept = "WANToDMZAccept"
;({}).lanToLanAccept = "LANToLANAccept"
;({}).lanToLanDrop = "LANToLANDrop"
;({}).unicastTraffic = "UnicastTraffic"
;({}).broadCastORMulticastTraffic = "BroadCastORMulticastTraffic"
;({}).sourceMACFilter = "SourceMACFilter"
;({}).sessionLimitLogs = "SessionLimitLogs"
;({}).bandwidthLimitLogs = "BandwidthLimitLogs"
;({}).ftpLogs = "FtpLogs"
;({}).icmpInvalidLogs = "IcmpInvalidLogs"
;({}).icmpRedirectedLogs = "IcmpRedirectedLogs"
;({}).invalidPacketLogs = "logInvalidPacket"
;({}).webCategoryAccept = "webCategoryAccept"
;({}).webCategoryDrop = "webCategoryDrop"
;({}).categoryServerLogs = "categoryServerLogs"
Ipv6firewallLogsTable = "FirewallLogs6"
;({}).lanToWanAccept = "LANToWANAccept"
;({}).lanToWanDrop = "LANToWANDrop"
;({}).wanToLanAccept = "WANToLANAccept"
;({}).wanToLanDrop = "WANToLANDrop"
function fw.core.firewallLogs.Ipv4.lanToWanAcceptLogStatusGet()
  local L0_1
  L0_1 = db.getAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.lanToWanAccept)
  if L0_1 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_1
end
function fw.core.firewallLogs.Ipv4.lanToWanAcceptLogStatusGetNext(A0_2)
  local L2_3
  L2_3 = returnCodes
  L2_3 = L2_3.NOT_SUPPORTED
  return L2_3, A0_2
end
function fw.core.firewallLogs.Ipv4.lanToWanAcceptLogStatusEnable()
  local L0_4, L1_5
  L1_5 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.lanToWanAccept, _UPVALUE3_)
  if not L1_5 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.lanToWanAcceptLogStatusDisable()
  local L0_6, L1_7
  L1_7 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.lanToWanAccept, _UPVALUE3_)
  if not L1_7 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.lanToWanDropLogStatusEnable()
  local L0_8, L1_9
  L1_9 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.lanToWanDrop, _UPVALUE3_)
  if not L1_9 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.lanToWanDropLogStatusDisable()
  local L0_10, L1_11
  L1_11 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.lanToWanDrop, _UPVALUE3_)
  if not L1_11 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.lanToWanDropLogStatusGet()
  local L0_12
  L0_12 = db.getAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.lanToWanDrop)
  if L0_12 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_12
end
function fw.core.firewallLogs.Ipv4.lanToWanDropLogStatusGetNext(A0_13)
  local L2_14
  L2_14 = returnCodes
  L2_14 = L2_14.NOT_SUPPORTED
  return L2_14, A0_13
end
function fw.core.firewallLogs.Ipv4.wanToLanAcceptLogStatusEnable()
  local L0_15, L1_16
  L1_16 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.wanToLanAccept, _UPVALUE3_)
  if not L1_16 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.wanToLanAcceptLogStatusDisable()
  local L0_17, L1_18
  L1_18 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.wanToLanAccept, _UPVALUE3_)
  if not L1_18 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.wanToLanAcceptLogStatusGet()
  local L0_19
  L0_19 = db.getAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.wanToLanAccept)
  if L0_19 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_19
end
function fw.core.firewallLogs.Ipv4.wanToLanAcceptLogStatusGetNext(A0_20)
  local L2_21
  L2_21 = returnCodes
  L2_21 = L2_21.NOT_SUPPORTED
  return L2_21, A0_20
end
function fw.core.firewallLogs.Ipv4.wanToLanDropLogStatusEnable()
  local L0_22, L1_23
  L1_23 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.wanToLanDrop, _UPVALUE3_)
  if not L1_23 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.wanToLanDropLogStatusDisable()
  local L0_24, L1_25
  L1_25 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.wanToLanDrop, _UPVALUE3_)
  if not L1_25 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.wanToLanDropLogStatusGet()
  local L0_26
  L0_26 = db.getAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.wanToLanDrop)
  if L0_26 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_26
end
function fw.core.firewallLogs.Ipv4.wanToLanDropLogStatusGetNext(A0_27)
  local L2_28
  L2_28 = returnCodes
  L2_28 = L2_28.NOT_SUPPORTED
  return L2_28, A0_27
end
function fw.core.firewallLogs.Ipv4.lanToDmzAcceptLogStatusEnable()
  local L0_29, L1_30
  L1_30 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.lanToDmzAccept, _UPVALUE3_)
  if not L1_30 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.lanToDmzAcceptLogStatusDisable()
  local L0_31, L1_32
  L1_32 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.lanToDmzAccept, _UPVALUE3_)
  if not L1_32 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.lanToDmzAcceptLogStatusGet()
  local L0_33
  L0_33 = db.getAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.lanToDmzAccept)
  if L0_33 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_33
end
function fw.core.firewallLogs.Ipv4.lanToDmzAcceptLogStatusGetNext(A0_34)
  local L2_35
  L2_35 = returnCodes
  L2_35 = L2_35.NOT_SUPPORTED
  return L2_35, A0_34
end
function fw.core.firewallLogs.Ipv4.lanToDmzDropLogStatusEnable()
  local L0_36, L1_37
  L1_37 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.lanToDmzDrop, _UPVALUE3_)
  if not L1_37 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.lanToDmzDropLogStatusDisable()
  local L0_38, L1_39
  L1_39 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.lanToDmzDrop, _UPVALUE3_)
  if not L1_39 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.lanToDmzDropLogStatusGet()
  local L0_40
  L0_40 = db.getAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.lanToDmzDrop)
  if L0_40 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_40
end
function fw.core.firewallLogs.Ipv4.lanToDmzDropLogStatusGetNext(A0_41)
  local L2_42
  L2_42 = returnCodes
  L2_42 = L2_42.NOT_SUPPORTED
  return L2_42, A0_41
end
function fw.core.firewallLogs.Ipv4.dmzToWanAcceptLogStatusEnable()
  local L0_43, L1_44
  L1_44 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.dmzToWanAccept, _UPVALUE3_)
  if not L1_44 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.dmzToWanAcceptLogStatusDisable()
  local L0_45, L1_46
  L1_46 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.dmzToWanAccept, _UPVALUE3_)
  if not L1_46 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.dmzToWanAcceptLogStatusGet()
  local L0_47
  L0_47 = db.getAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.dmzToWanAccept)
  if L0_47 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_47
end
function fw.core.firewallLogs.Ipv4.dmzToWanAcceptLogStatusGetNext(A0_48)
  local L2_49
  L2_49 = returnCodes
  L2_49 = L2_49.NOT_SUPPORTED
  return L2_49, A0_48
end
function fw.core.firewallLogs.Ipv4.dmzToWanDropLogStatusEnable()
  local L0_50, L1_51
  L1_51 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.dmzToWanDrop, _UPVALUE3_)
  if not L1_51 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.dmzToWanDropLogStatusDisable()
  local L0_52, L1_53
  L1_53 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.dmzToWanDrop, _UPVALUE3_)
  if not L1_53 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.dmzToWanDropLogStatusGet()
  local L0_54
  L0_54 = db.getAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.dmzToWanDrop)
  if L0_54 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_54
end
function fw.core.firewallLogs.Ipv4.dmzToWanDropLogStatusGetNext(A0_55)
  local L2_56
  L2_56 = returnCodes
  L2_56 = L2_56.NOT_SUPPORTED
  return L2_56, A0_55
end
function fw.core.firewallLogs.Ipv4.dmzToLanAcceptLogStatusEnable()
  local L0_57, L1_58
  L1_58 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.dmzToLanAccept, _UPVALUE3_)
  if not L1_58 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.dmzToLanAcceptLogStatusDisable()
  local L0_59, L1_60
  L1_60 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.dmzToLanAccept, _UPVALUE3_)
  if not L1_60 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.dmzToLanAcceptLogStatusGet()
  local L0_61
  L0_61 = db.getAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.dmzToLanAccept)
  if L0_61 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_61
end
function fw.core.firewallLogs.Ipv4.dmzToLanAcceptLogStatusGetNext(A0_62)
  local L2_63
  L2_63 = returnCodes
  L2_63 = L2_63.NOT_SUPPORTED
  return L2_63, A0_62
end
function fw.core.firewallLogs.Ipv4.dmzToLanDropLogStatusEnable()
  local L0_64, L1_65
  L1_65 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.dmzToLanDrop, _UPVALUE3_)
  if not L1_65 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.dmzToLanDropLogStatusDisable()
  local L0_66, L1_67
  L1_67 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.dmzToLanDrop, _UPVALUE3_)
  if not L1_67 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.dmzToLanDropLogStatusGet()
  local L0_68
  L0_68 = db.getAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.dmzToLanDrop)
  if L0_68 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_68
end
function fw.core.firewallLogs.Ipv4.dmzToLanDropLogStatusGetNext(A0_69)
  local L2_70
  L2_70 = returnCodes
  L2_70 = L2_70.NOT_SUPPORTED
  return L2_70, A0_69
end
function fw.core.firewallLogs.Ipv4.wanToDmzAcceptLogStatusEnable()
  local L0_71, L1_72
  L1_72 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.wanToDmzAccept, _UPVALUE3_)
  if not L1_72 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.wanToDmzAcceptLogStatusDisable()
  local L0_73, L1_74
  L1_74 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.wanToDmzAccept, _UPVALUE3_)
  if not L1_74 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.wanToDmzAcceptLogStatusGet()
  local L0_75
  L0_75 = db.getAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.wanToDmzAccept)
  if L0_75 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_75
end
function fw.core.firewallLogs.Ipv4.wanToDmzAcceptLogStatusGetNext(A0_76)
  local L2_77
  L2_77 = returnCodes
  L2_77 = L2_77.NOT_SUPPORTED
  return L2_77, A0_76
end
function fw.core.firewallLogs.Ipv4.wanToDmzDropLogStatusEnable()
  local L0_78, L1_79
  L1_79 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.wanToDmzDrop, _UPVALUE3_)
  if not L1_79 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.wanToDmzDropLogStatusDisable()
  local L0_80, L1_81
  L1_81 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.wanToDmzDrop, _UPVALUE3_)
  if not L1_81 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.wanToDmzDropLogStatusGet()
  local L0_82
  L0_82 = db.getAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.wanToDmzDrop)
  if L0_82 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_82
end
function fw.core.firewallLogs.Ipv4.wanToDmzDropLogStatusGetNext(A0_83)
  local L2_84
  L2_84 = returnCodes
  L2_84 = L2_84.NOT_SUPPORTED
  return L2_84, A0_83
end
function fw.core.firewallLogs.Ipv4.lanToLanAcceptLogStatusEnable()
  local L0_85, L1_86
  L1_86 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.lanToLanAccept, _UPVALUE3_)
  if not L1_86 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.lanToLanAcceptLogStatusDisable()
  local L0_87, L1_88
  L1_88 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.lanToLanAccept, _UPVALUE3_)
  if not L1_88 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.lanToLanAcceptLogStatusGet()
  local L0_89
  L0_89 = db.getAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.lanToLanAccept)
  if L0_89 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_89
end
function fw.core.firewallLogs.Ipv4.lanToLanAcceptLogStatusGetNext(A0_90)
  local L2_91
  L2_91 = returnCodes
  L2_91 = L2_91.NOT_SUPPORTED
  return L2_91, A0_90
end
function fw.core.firewallLogs.Ipv4.lanToLanDropLogStatusEnable()
  local L0_92, L1_93
  L1_93 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.lanToLanDrop, _UPVALUE3_)
  if not L1_93 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.lanToLanDropLogStatusDisable()
  local L0_94, L1_95
  L1_95 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.lanToLanDrop, _UPVALUE3_)
  if not L1_95 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.lanToLanDropLogStatusGet()
  local L0_96
  L0_96 = db.getAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.lanToLanDrop)
  if L0_96 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_96
end
function fw.core.firewallLogs.Ipv4.lanToLanDropLogStatusGetNext(A0_97)
  local L2_98
  L2_98 = returnCodes
  L2_98 = L2_98.NOT_SUPPORTED
  return L2_98, A0_97
end
function fw.core.firewallLogs.Ipv4.unicastTrafficLogStatusEnable()
  local L0_99, L1_100
  L1_100 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.unicastTraffic, _UPVALUE3_)
  if not L1_100 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.unicastTrafficLogStatusDisable()
  local L0_101, L1_102
  L1_102 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.unicastTraffic, _UPVALUE3_)
  if not L1_102 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.unicastTrafficLogStatusGet()
  local L0_103
  L0_103 = db.getAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.unicastTraffic)
  if L0_103 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_103
end
function fw.core.firewallLogs.Ipv4.unicastTrafficLogStatusGetNext(A0_104)
  local L2_105
  L2_105 = returnCodes
  L2_105 = L2_105.NOT_SUPPORTED
  return L2_105, A0_104
end
function fw.core.firewallLogs.Ipv4.broadCastORMulticastTrafficLogStatusEnable()
  local L0_106, L1_107
  L1_107 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.broadCastORMulticastTraffic, _UPVALUE3_)
  if not L1_107 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.broadCastORMulticastTrafficLogStatusDisable()
  local L0_108, L1_109
  L1_109 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.broadCastORMulticastTraffic, _UPVALUE3_)
  if not L1_109 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.broadCastORMulticastTrafficLogStatusGet()
  local L0_110
  L0_110 = db.getAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.broadCastORMulticastTraffic)
  if L0_110 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_110
end
function fw.core.firewallLogs.Ipv4.broadCastORMulticastTrafficLogStatusGetNext(A0_111)
  local L2_112
  L2_112 = returnCodes
  L2_112 = L2_112.NOT_SUPPORTED
  return L2_112, A0_111
end
function fw.core.firewallLogs.Ipv4.sourceMACFilterLogStatusEnable()
  local L0_113, L1_114
  L1_114 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.sourceMACFilter, _UPVALUE3_)
  if not L1_114 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.sourceMACFilterLogStatusDisable()
  local L0_115, L1_116
  L1_116 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.sourceMACFilter, _UPVALUE3_)
  if not L1_116 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.sourceMACFilterLogStatusGet()
  local L0_117
  L0_117 = db.getAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.sourceMACFilter)
  if L0_117 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_117
end
function fw.core.firewallLogs.Ipv4.sourceMACFilterLogStatusGetNext(A0_118)
  local L2_119
  L2_119 = returnCodes
  L2_119 = L2_119.NOT_SUPPORTED
  return L2_119, A0_118
end
function fw.core.firewallLogs.Ipv4.sessionLimitLogStatusEnable()
  local L0_120, L1_121
  L1_121 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.sessionLimitLogs, _UPVALUE3_)
  if not L1_121 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.sessionLimitLogStatusDisable()
  local L0_122, L1_123
  L1_123 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.sessionLimitLogs, _UPVALUE3_)
  if not L1_123 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.sessionLimitLogsGet()
  local L0_124
  L0_124 = db.getAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.sessionLimitLogs)
  if L0_124 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_124
end
function fw.core.firewallLogs.Ipv4.sessionLimitLogsGetNext(A0_125)
  local L2_126
  L2_126 = returnCodes
  L2_126 = L2_126.NOT_SUPPORTED
  return L2_126, A0_125
end
function fw.core.firewallLogs.Ipv4.bandwidthLimitLogStatusEnable()
  local L0_127, L1_128
  L1_128 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.bandwidthLimitLogs, _UPVALUE3_)
  if not L1_128 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.bandwidthLimitLogStatusDisable()
  local L0_129, L1_130
  L1_130 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.bandwidthLimitLogs, _UPVALUE3_)
  if not L1_130 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.bandwidthLimitLogStatusGet()
  local L0_131
  L0_131 = db.getAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.bandwidthLimitLogs)
  if L0_131 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_131
end
function fw.core.firewallLogs.Ipv4.bandwidthLimitLogStatusGetNext(A0_132)
  local L2_133
  L2_133 = returnCodes
  L2_133 = L2_133.NOT_SUPPORTED
  return L2_133, A0_132
end
function fw.core.firewallLogs.Ipv4.ftpLogStatusEnable()
  local L0_134, L1_135
  L1_135 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.ftpLogs, _UPVALUE3_)
  if not L1_135 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.ftpLogStatusDisable()
  local L0_136, L1_137
  L1_137 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.ftpLogs, _UPVALUE3_)
  if not L1_137 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.ftpLogStatusGet()
  local L0_138
  L0_138 = db.getAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.ftpLogs)
  if L0_138 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_138
end
function fw.core.firewallLogs.Ipv4.ftpLogStatusGetNext(A0_139)
  local L2_140
  L2_140 = returnCodes
  L2_140 = L2_140.NOT_SUPPORTED
  return L2_140, A0_139
end
function fw.core.firewallLogs.Ipv4.icmpInvalidLogStatusEnable()
  local L0_141, L1_142
  L1_142 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.icmpInvalidLogs, _UPVALUE3_)
  if not L1_142 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.icmpInvalidLogStatusDisable()
  local L0_143, L1_144
  L1_144 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.icmpInvalidLogs, _UPVALUE3_)
  if not L1_144 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.icmpInvalidLogStatusGet()
  local L0_145
  L0_145 = db.getAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.icmpInvalidLogs)
  if L0_145 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_145
end
function fw.core.firewallLogs.Ipv4.icmpInvalidLogStatusGetNext(A0_146)
  local L2_147
  L2_147 = returnCodes
  L2_147 = L2_147.NOT_SUPPORTED
  return L2_147, A0_146
end
function fw.core.firewallLogs.Ipv4.icmpRedirectedLogStatusEnable()
  local L0_148, L1_149
  L1_149 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.icmpRedirectedLogs, _UPVALUE3_)
  if not L1_149 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.icmpRedirectedLogStatusDisable()
  local L0_150, L1_151
  L1_151 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.icmpRedirectedLogs, _UPVALUE3_)
  if not L1_151 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.icmpRedirectedLogStatusGet()
  local L0_152
  L0_152 = db.getAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.icmpRedirectedLogs)
  if L0_152 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_152
end
function fw.core.firewallLogs.Ipv4.icmpRedirectedLogStatusGetNext(A0_153)
  local L2_154
  L2_154 = returnCodes
  L2_154 = L2_154.NOT_SUPPORTED
  return L2_154, A0_153
end
function fw.core.firewallLogs.Ipv4.invalidPacketLogStatusEnable()
  local L0_155, L1_156
  L1_156 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.invalidPacketLogs, _UPVALUE3_)
  if not L1_156 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.invalidPacketLogStatusDisable()
  local L0_157, L1_158
  L1_158 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.invalidPacketLogs, _UPVALUE3_)
  if not L1_158 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.invalidPacketLogStatusGet()
  local L0_159
  L0_159 = db.getAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.invalidPacketLogs)
  if L0_159 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_159
end
function fw.core.firewallLogs.Ipv4.invalidPacketLogStatusGetNext(A0_160)
  local L2_161
  L2_161 = returnCodes
  L2_161 = L2_161.NOT_SUPPORTED
  return L2_161, A0_160
end
function fw.core.firewallLogs.Ipv4.webCategoryAcceptLogStatusEnable()
  local L0_162, L1_163
  L1_163 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.webCategoryAccept, _UPVALUE3_)
  if not L1_163 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.webCategoryAcceptLogStatusDisable()
  local L0_164, L1_165
  L1_165 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.webCategoryAccept, _UPVALUE3_)
  if not L1_165 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.webCategoryAcceptLogStatusGet()
  local L0_166
  L0_166 = db.getAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.webCategoryAccept)
  if L0_166 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_166
end
function fw.core.firewallLogs.Ipv4.webCategoryAcceptLogStatusGetNext(A0_167)
  local L2_168
  L2_168 = returnCodes
  L2_168 = L2_168.NOT_SUPPORTED
  return L2_168, A0_167
end
function fw.core.firewallLogs.Ipv4.webCategoryDropLogStatusEnable()
  local L0_169, L1_170
  L1_170 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.webCategoryDrop, _UPVALUE3_)
  if not L1_170 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.webCategoryDropLogStatusDisable()
  local L0_171, L1_172
  L1_172 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.webCategoryDrop, _UPVALUE3_)
  if not L1_172 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.webCategoryDropLogStatusGet()
  local L0_173
  L0_173 = db.getAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.webCategoryDrop)
  if L0_173 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_173
end
function fw.core.firewallLogs.Ipv4.webCategoryDropLogStatusGetNext(A0_174)
  local L2_175
  L2_175 = returnCodes
  L2_175 = L2_175.NOT_SUPPORTED
  return L2_175, A0_174
end
function fw.core.firewallLogs.Ipv4.categoryServerLogStatusEnable()
  local L0_176, L1_177
  L1_177 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.categoryServerLogs, _UPVALUE3_)
  if not L1_177 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.categoryServerLogStatusDisable()
  local L0_178, L1_179
  L1_179 = db.setAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.categoryServerLogs, _UPVALUE3_)
  if not L1_179 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv4.categoryServerLogStatusGet()
  local L0_180
  L0_180 = db.getAttribute(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.categoryServerLogs)
  if L0_180 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_180
end
function fw.core.firewallLogs.Ipv4.categoryServerLogStatusGetNext(A0_181)
  local L2_182
  L2_182 = returnCodes
  L2_182 = L2_182.NOT_SUPPORTED
  return L2_182, A0_181
end
function fw.core.firewallLogs.Ipv4.edit(A0_183, A1_184, A2_185, A3_186, A4_187, A5_188, A6_189, A7_190, A8_191, A9_192, A10_193, A11_194, A12_195, A13_196, A14_197, A15_198, A16_199, A17_200, A18_201, A19_202, A20_203, A21_204, A22_205, A23_206, A24_207, A25_208)
  local L26_209, L27_210, L28_211, L29_212
  L27_210 = {}
  L28_211, L29_212 = nil, nil
  L26_209 = booleanCheck(A0_183)
  if L26_209 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L26_209 = booleanCheck(A1_184)
  if L26_209 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L26_209 = booleanCheck(A2_185)
  if L26_209 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L26_209 = booleanCheck(A3_186)
  if L26_209 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L26_209 = booleanCheck(A4_187)
  if L26_209 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L26_209 = booleanCheck(A5_188)
  if L26_209 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L26_209 = booleanCheck(A6_189)
  if L26_209 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L26_209 = booleanCheck(A7_190)
  if L26_209 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L26_209 = booleanCheck(A8_191)
  if L26_209 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L26_209 = booleanCheck(A9_192)
  if L26_209 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L26_209 = booleanCheck(A10_193)
  if L26_209 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L26_209 = booleanCheck(A11_194)
  if L26_209 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L26_209 = booleanCheck(A12_195)
  if L26_209 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L26_209 = booleanCheck(A13_196)
  if L26_209 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L26_209 = booleanCheck(A14_197)
  if L26_209 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L26_209 = booleanCheck(A15_198)
  if L26_209 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L26_209 = booleanCheck(A16_199)
  if L26_209 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L26_209 = booleanCheck(A17_200)
  if L26_209 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L26_209 = booleanCheck(A18_201)
  if L26_209 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L26_209 = booleanCheck(A19_202)
  if L26_209 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L26_209 = booleanCheck(A20_203)
  if L26_209 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L26_209 = booleanCheck(A21_204)
  if L26_209 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L26_209 = booleanCheck(A22_205)
  if L26_209 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L26_209 = booleanCheck(A23_206)
  if L26_209 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L26_209 = booleanCheck(A24_207)
  if L26_209 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L26_209 = booleanCheck(A25_208)
  if L26_209 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L27_210[Ipv4firewallLogsTable .. "." .. _UPVALUE1_.lanToWanAccept] = A0_183
  L27_210[Ipv4firewallLogsTable .. "." .. _UPVALUE1_.lanToWanDrop] = A1_184
  L27_210[Ipv4firewallLogsTable .. "." .. _UPVALUE1_.wanToLanAccept] = A2_185
  L27_210[Ipv4firewallLogsTable .. "." .. _UPVALUE1_.wanToLanDrop] = A3_186
  L27_210[Ipv4firewallLogsTable .. "." .. _UPVALUE1_.lanToDmzAccept] = A4_187
  L27_210[Ipv4firewallLogsTable .. "." .. _UPVALUE1_.lanToDmzDrop] = A5_188
  L27_210[Ipv4firewallLogsTable .. "." .. _UPVALUE1_.dmzToWanAccept] = A6_189
  L27_210[Ipv4firewallLogsTable .. "." .. _UPVALUE1_.dmzToWanDrop] = A7_190
  L27_210[Ipv4firewallLogsTable .. "." .. _UPVALUE1_.dmzToLanAccept] = A8_191
  L27_210[Ipv4firewallLogsTable .. "." .. _UPVALUE1_.dmzToLanDrop] = A9_192
  L27_210[Ipv4firewallLogsTable .. "." .. _UPVALUE1_.wanToDmzDrop] = A10_193
  L27_210[Ipv4firewallLogsTable .. "." .. _UPVALUE1_.wanToDmzAccept] = A11_194
  L27_210[Ipv4firewallLogsTable .. "." .. _UPVALUE1_.lanToLanAccept] = A12_195
  L27_210[Ipv4firewallLogsTable .. "." .. _UPVALUE1_.lanToLanDrop] = A13_196
  L27_210[Ipv4firewallLogsTable .. "." .. _UPVALUE1_.unicastTraffic] = A14_197
  L27_210[Ipv4firewallLogsTable .. "." .. _UPVALUE1_.broadCastORMulticastTraffic] = A15_198
  L27_210[Ipv4firewallLogsTable .. "." .. _UPVALUE1_.sourceMACFilter] = A16_199
  L27_210[Ipv4firewallLogsTable .. "." .. _UPVALUE1_.sessionLimitLogs] = A17_200
  L27_210[Ipv4firewallLogsTable .. "." .. _UPVALUE1_.bandwidthLimitLogs] = A18_201
  L27_210[Ipv4firewallLogsTable .. "." .. _UPVALUE1_.ftpLogs] = A19_202
  L27_210[Ipv4firewallLogsTable .. "." .. _UPVALUE1_.icmpInvalidLogs] = A20_203
  L27_210[Ipv4firewallLogsTable .. "." .. _UPVALUE1_.icmpRedirectedLogs] = A21_204
  L27_210[Ipv4firewallLogsTable .. "." .. _UPVALUE1_.invalidPacketLogs] = A22_205
  L27_210[Ipv4firewallLogsTable .. "." .. _UPVALUE1_.webCategoryAccept] = A23_206
  L27_210[Ipv4firewallLogsTable .. "." .. _UPVALUE1_.webCategoryDrop] = A24_207
  L27_210[Ipv4firewallLogsTable .. "." .. _UPVALUE1_.categoryServerLogs] = A25_208
  L29_212 = db.update(Ipv4firewallLogsTable, L27_210, _UPVALUE0_)
  if not L29_212 then
    return returnCodes.FAILURE, _UPVALUE0_
  end
  return returnCodes.SUCCESS, _UPVALUE0_
end
function fw.core.firewallLogs.Ipv4.Get()
  local L0_213, L1_214, L2_215, L3_216, L4_217, L5_218, L6_219, L7_220, L8_221, L9_222, L10_223, L11_224, L12_225, L13_226, L14_227, L15_228, L16_229, L17_230, L18_231, L19_232, L20_233, L21_234, L22_235, L23_236, L24_237, L25_238, L26_239
  L26_239 = {}
  L26_239 = db.getRow(Ipv4firewallLogsTable, _UPVALUE0_, _UPVALUE1_)
  if L26_239 == NIL then
    return returnCodes.FAILURE
  else
    L0_213 = L26_239[Ipv4firewallLogsTable .. "." .. _UPVALUE2_.lanToWanAccept]
    L1_214 = L26_239[Ipv4firewallLogsTable .. "." .. _UPVALUE2_.lanToWanDrop]
    L2_215 = L26_239[Ipv4firewallLogsTable .. "." .. _UPVALUE2_.wanToLanAccept]
    L3_216 = L26_239[Ipv4firewallLogsTable .. "." .. _UPVALUE2_.wanToLanDrop]
    L4_217 = L26_239[Ipv4firewallLogsTable .. "." .. _UPVALUE2_.lanToDmzAccept]
    L5_218 = L26_239[Ipv4firewallLogsTable .. "." .. _UPVALUE2_.lanToDmzDrop]
    L6_219 = L26_239[Ipv4firewallLogsTable .. "." .. _UPVALUE2_.dmzToWanAccept]
    L7_220 = L26_239[Ipv4firewallLogsTable .. "." .. _UPVALUE2_.dmzToWanDrop]
    L8_221 = L26_239[Ipv4firewallLogsTable .. "." .. _UPVALUE2_.dmzToLanAccept]
    L9_222 = L26_239[Ipv4firewallLogsTable .. "." .. _UPVALUE2_.dmzToLanDrop]
    L10_223 = L26_239[Ipv4firewallLogsTable .. "." .. _UPVALUE2_.wanToDmzDrop]
    L11_224 = L26_239[Ipv4firewallLogsTable .. "." .. _UPVALUE2_.wanToDmzAccept]
    L12_225 = L26_239[Ipv4firewallLogsTable .. "." .. _UPVALUE2_.lanToLanAccept]
    L13_226 = L26_239[Ipv4firewallLogsTable .. "." .. _UPVALUE2_.lanToLanDrop]
    L14_227 = L26_239[Ipv4firewallLogsTable .. "." .. _UPVALUE2_.unicastTraffic]
    L15_228 = L26_239[Ipv4firewallLogsTable .. "." .. _UPVALUE2_.broadCastORMulticastTraffic]
    L16_229 = L26_239[Ipv4firewallLogsTable .. "." .. _UPVALUE2_.sourceMACFilter]
    L17_230 = L26_239[Ipv4firewallLogsTable .. "." .. _UPVALUE2_.sessionLimitLogs]
    L18_231 = L26_239[Ipv4firewallLogsTable .. "." .. _UPVALUE2_.bandwidthLimitLogs]
    L19_232 = L26_239[Ipv4firewallLogsTable .. "." .. _UPVALUE2_.ftpLogs]
    L20_233 = L26_239[Ipv4firewallLogsTable .. "." .. _UPVALUE2_.icmpInvalidLogs]
    L21_234 = L26_239[Ipv4firewallLogsTable .. "." .. _UPVALUE2_.icmpRedirectedLogs]
    L22_235 = L26_239[Ipv4firewallLogsTable .. "." .. _UPVALUE2_.invalidPacketLogs]
    L23_236 = L26_239[Ipv4firewallLogsTable .. "." .. _UPVALUE2_.webCategoryAccept]
    L24_237 = L26_239[Ipv4firewallLogsTable .. "." .. _UPVALUE2_.webCategoryDrop]
    L25_238 = L26_239[Ipv4firewallLogsTable .. "." .. _UPVALUE2_.categoryServerLogs]
    return returnCodes.SUCCESS, _UPVALUE1_, L0_213, L1_214, L2_215, L3_216, L4_217, L5_218, L6_219, L7_220, L8_221, L9_222, L10_223, L11_224, L12_225, L13_226, L14_227, L15_228, L16_229, L17_230, L18_231, L19_232, L20_233, L21_234, L22_235, L23_236, L24_237, L25_238
  end
end
function fw.core.firewallLogs.Ipv4.GetNext(A0_240)
  local L2_241
  L2_241 = returnCodes
  L2_241 = L2_241.NOT_SUPPORTED
  return L2_241, A0_240
end
function fw.core.firewallLogs.Ipv6.edit(A0_242, A1_243, A2_244, A3_245)
  local L4_246, L5_247, L6_248, L7_249
  L5_247 = {}
  L6_248, L7_249 = nil, nil
  L4_246 = booleanCheck(A0_242)
  if L4_246 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L4_246 = booleanCheck(A1_243)
  if L4_246 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L4_246 = booleanCheck(A2_244)
  if L4_246 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L4_246 = booleanCheck(A3_245)
  if L4_246 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L5_247[Ipv6firewallLogsTable .. "." .. _UPVALUE1_.lanToWanAccept] = A0_242
  L5_247[Ipv6firewallLogsTable .. "." .. _UPVALUE1_.lanToWanDrop] = A1_243
  L5_247[Ipv6firewallLogsTable .. "." .. _UPVALUE1_.wanToLanAccept] = A2_244
  L5_247[Ipv6firewallLogsTable .. "." .. _UPVALUE1_.wanToLanDrop] = A3_245
  L7_249 = db.update(Ipv6firewallLogsTable, L5_247, _UPVALUE0_)
  if not L7_249 then
    return returnCodes.FAILURE, _UPVALUE0_
  end
  return returnCodes.SUCCESS, _UPVALUE0_
end
function fw.core.firewallLogs.Ipv6.Get()
  local L0_250, L1_251, L2_252, L3_253, L4_254
  L4_254 = {}
  L4_254 = db.getRow(Ipv6firewallLogsTable, _UPVALUE0_, _UPVALUE1_)
  if L4_254 == NIL then
    return returnCodes.FAILURE
  else
    L0_250 = L4_254[Ipv6firewallLogsTable .. "." .. _UPVALUE2_.lanToWanAccept]
    L1_251 = L4_254[Ipv6firewallLogsTable .. "." .. _UPVALUE2_.lanToWanDrop]
    L2_252 = L4_254[Ipv6firewallLogsTable .. "." .. _UPVALUE2_.wanToLanAccept]
    L3_253 = L4_254[Ipv6firewallLogsTable .. "." .. _UPVALUE2_.wanToLanDrop]
    return returnCodes.SUCCESS, _UPVALUE1_, L0_250, L1_251, L2_252, L3_253
  end
end
function fw.core.firewallLogs.Ipv6.GetNext(A0_255)
  local L2_256
  L2_256 = returnCodes
  L2_256 = L2_256.NOT_SUPPORTED
  return L2_256, A0_255
end
function fw.core.firewallLogs.Ipv6.lanToWanAcceptLogStatusEnable()
  local L0_257, L1_258
  L1_258 = db.setAttribute(Ipv6firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.lanToWanAccept, _UPVALUE3_)
  if not L1_258 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv6.lanToWanAcceptLogStatusDisable()
  local L0_259, L1_260
  L1_260 = db.setAttribute(Ipv6firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.lanToWanAccept, _UPVALUE3_)
  if not L1_260 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv6.lanToWanAcceptLogStatusGet()
  local L0_261
  L0_261 = db.getAttribute(Ipv6firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.lanToWanAccept)
  if L0_261 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_261
end
function fw.core.firewallLogs.Ipv6.lanToWanAcceptLogStatusGetNext(A0_262)
  local L2_263
  L2_263 = returnCodes
  L2_263 = L2_263.NOT_SUPPORTED
  return L2_263, A0_262
end
function fw.core.firewallLogs.Ipv6.lanToWanDropLogStatusEnable()
  local L0_264, L1_265
  L1_265 = db.setAttribute(Ipv6firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.lanToWanDrop, _UPVALUE3_)
  if not L1_265 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv6.lanToWanDropLogStatusDisable()
  local L0_266, L1_267
  L1_267 = db.setAttribute(Ipv6firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.lanToWanDrop, _UPVALUE3_)
  if not L1_267 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv6.lanToWanDropLogStatusGet()
  local L0_268
  L0_268 = db.getAttribute(Ipv6firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.lanToWanDrop)
  if L0_268 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_268
end
function fw.core.firewallLogs.Ipv6.lanToWanDropLogStatusGetNext(A0_269)
  local L2_270
  L2_270 = returnCodes
  L2_270 = L2_270.NOT_SUPPORTED
  return L2_270, A0_269
end
function fw.core.firewallLogs.Ipv6.wanToLanAcceptLogStatusEnable()
  local L0_271, L1_272
  L1_272 = db.setAttribute(Ipv6firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.wanToLanAccept, _UPVALUE3_)
  if not L1_272 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv6.wanToLanAcceptLogStatusDisable()
  local L0_273, L1_274
  L1_274 = db.setAttribute(Ipv6firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.wanToLanAccept, _UPVALUE3_)
  if not L1_274 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv6.wanToLanAcceptLogStatusGet()
  local L0_275
  L0_275 = db.getAttribute(Ipv6firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.wanToLanAccept)
  if L0_275 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_275
end
function fw.core.firewallLogs.Ipv6.wanToLanAcceptLogStatusGetNext(A0_276)
  local L2_277
  L2_277 = returnCodes
  L2_277 = L2_277.NOT_SUPPORTED
  return L2_277, A0_276
end
function fw.core.firewallLogs.Ipv6.wanToLanDropLogStatusEnable()
  local L0_278, L1_279
  L1_279 = db.setAttribute(Ipv6firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.wanToLanDrop, _UPVALUE3_)
  if not L1_279 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv6.wanToLanDropLogStatusDisable()
  local L0_280, L1_281
  L1_281 = db.setAttribute(Ipv6firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.wanToLanDrop, _UPVALUE3_)
  if not L1_281 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.firewallLogs.Ipv6.wanToLanDropLogStatusGet()
  local L0_282
  L0_282 = db.getAttribute(Ipv6firewallLogsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.wanToLanDrop)
  if L0_282 == NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_282
end
function fw.core.firewallLogs.Ipv6.wanToLanDropLogStatusGetNext(A0_283)
  local L2_284
  L2_284 = returnCodes
  L2_284 = L2_284.NOT_SUPPORTED
  return L2_284, A0_283
end
