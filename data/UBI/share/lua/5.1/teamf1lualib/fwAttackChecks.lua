local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/fwValidations")
L0_0 = "1"
fw.core.attackChecks = {}
fw.core.icsaSettings = {}
fw.core.fwDosAttackSettings = {}
attackChecksTable = "AttackChecks"
;({}).stealthModeStatus = "StealthMode"
;({}).blockTcpFloodStatus = "TcpFlood"
;({}).blockUdpFloodStatus = "UdpFlood"
;({}).udpConnectionLimitValue = "UdpConnLimitVal"
;({}).pingOnLanStatus = "PingReplyOnLan"
;({}).dnsProxy = "DnsProxy"
;({}).blockSpoofPktStatus = "BlockSpoof"
;({}).tcpFilterCheckStatus = "TcpFilterCheck"
icsaSettingsTable = "icsaSettings"
;({}).blockICMPNotification = "BlockICMPNotification"
;({}).blockFragPkts = "BlockFragPkts"
;({}).blockMulticastPkts = "BlockMulticastPkts"
;({}).blockTcpRST = "BlockTcpRST"
fwDosAttackSettingsTable = "fwDosAttackSettings"
;({}).synFloodDetectRate = "SynFloodDetectRate"
;({}).echoStormFloodRate = "EchoStormFloodRate"
;({}).icmpFloodRate = "IcmpFloodRate"
function fw.core.attackChecks.pingOnLanStatusSet(A0_1)
  local L1_2
  L1_2 = returnCodes
  L1_2 = L1_2.FAILURE
  L1_2 = db.setAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.pingOnLanStatus, A0_1)
  if L1_2 == returnCodes.NIL then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS
end
function fw.core.attackChecks.pingOnWanStatusGet()
  local L0_3
  L0_3 = db.getAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.pingOnWanStatus)
  if L0_3 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_3
end
function fw.core.attackChecks.pingOnWanStatusGetNext(A0_4)
  local L2_5
  L2_5 = returnCodes
  L2_5 = L2_5.NOT_SUPPORTED
  return L2_5, A0_4
end
function fw.core.attackChecks.pingOnWanStatusEnable()
  local L0_6, L1_7
  L1_7 = db.setAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.pingOnWan, _UPVALUE3_)
  if not L1_7 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.attackChecks.pingOnWanStatusDisable()
  local L0_8, L1_9
  L1_9 = db.setAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.pingOnWan, _UPVALUE3_)
  if not L1_9 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.attackChecks.stealthModeStatusGet()
  local L0_10
  L0_10 = db.getAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.stealthModeStatus)
  if L0_10 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_10
end
function fw.core.attackChecks.stealthModeStatusGetNext(A0_11)
  local L2_12
  L2_12 = returnCodes
  L2_12 = L2_12.NOT_SUPPORTED
  return L2_12, A0_11
end
function fw.core.attackChecks.stealthModeStatusEnable()
  local L0_13, L1_14
  L1_14 = db.setAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.stealthModeStatus, _UPVALUE3_)
  if not L1_14 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.attackChecks.stealthModeStatusDisable()
  local L0_15, L1_16
  L1_16 = db.setAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.stealthModeStatus, _UPVALUE3_)
  if not L1_16 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.attackChecks.blockTcpFloodStatusGet()
  local L0_17
  L0_17 = db.getAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.blockTcpFloodStatus)
  if L0_17 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_17
end
function fw.core.attackChecks.blockTcpFloodStatusGetNext(A0_18)
  local L2_19
  L2_19 = returnCodes
  L2_19 = L2_19.NOT_SUPPORTED
  return L2_19, A0_18
end
function fw.core.attackChecks.blockTcpFloodStatusEnable()
  local L0_20, L1_21
  L1_21 = db.setAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.blockTcpFloodStatus, _UPVALUE3_)
  if not L1_21 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.attackChecks.blockTcpFloodStatusDisable()
  local L0_22, L1_23
  L1_23 = db.setAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.blockTcpFloodStatus, _UPVALUE3_)
  if not L1_23 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.attackChecks.blockUdpFloodStatusGet()
  local L0_24
  L0_24 = db.getAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.blockUdpFloodStatus)
  if L0_24 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_24
end
function fw.core.attackChecks.blockUdpFloodStatusGetNext(A0_25)
  local L2_26
  L2_26 = returnCodes
  L2_26 = L2_26.NOT_SUPPORTED
  return L2_26, A0_25
end
function fw.core.attackChecks.blockUdpFloodStatusEnable()
  local L0_27, L1_28
  L1_28 = db.setAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.blockUdpFloodStatus, _UPVALUE3_)
  if not L1_28 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.attackChecks.blockUdpFloodStatusDisable()
  local L0_29, L1_30
  L1_30 = db.setAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.blockUdpFloodStatus, _UPVALUE3_)
  if not L1_30 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.attackChecks.udpConnectionLimitValueGet()
  local L0_31
  L0_31 = db.getAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.udpConnectionLimitValue)
  if L0_31 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_31
end
function fw.core.attackChecks.udpConnectionLimitValueGetNext(A0_32)
  local L2_33
  L2_33 = returnCodes
  L2_33 = L2_33.NOT_SUPPORTED
  return L2_33, A0_32
end
function fw.core.attackChecks.udpConnectionLimitValueSet(A0_34)
  local L1_35, L2_36, L3_37, L4_38
  L4_38 = db.getAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.blockUdpFloodStatus)
  if L4_38 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  if L4_38 == _UPVALUE4_ then
    L1_35 = numberRangeCheck(_UPVALUE5_, _UPVALUE6_, A0_34)
    if L1_35 ~= returnCodes.SUCCESS then
      return returnCodes.INVALID_ARGUMENT, _UPVALUE1_
    end
  end
  L3_37 = db.setAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.udpConnectionLimitValue, A0_34)
  if not L3_37 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.attackChecks.pingOnLanStatusGet()
  local L0_39
  L0_39 = db.getAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.pingOnLanStatus)
  if L0_39 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_39
end
function fw.core.attackChecks.pingOnLanStatusGetNext(A0_40)
  local L2_41
  L2_41 = returnCodes
  L2_41 = L2_41.NOT_SUPPORTED
  return L2_41, A0_40
end
function fw.core.attackChecks.pingOnLanStatusEnable()
  local L0_42, L1_43
  L1_43 = db.setAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.pingOnLanStatus, _UPVALUE3_)
  if not L1_43 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.attackChecks.pingOnLanStatusDisable()
  local L0_44, L1_45
  L1_45 = db.setAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.pingOnLanStatus, _UPVALUE3_)
  if not L1_45 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.attackChecks.dnsProxyStatusGet()
  local L0_46
  L0_46 = db.getAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.dnsProxy)
  if L0_46 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_46
end
function fw.core.attackChecks.dnsProxyStatusGet()
  local L1_47
  L1_47 = returnCodes
  L1_47 = L1_47.NOT_SUPPORTED
  return L1_47, cookie
end
function fw.core.attackChecks.dnsProxyStatusEnable()
  local L0_48, L1_49
  L1_49 = db.setAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.dnsProxy, _UPVALUE3_)
  if not L1_49 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.attackChecks.dnsProxyStatusDisable()
  local L0_50, L1_51
  L1_51 = db.setAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.dnsProxy, _UPVALUE3_)
  if not L1_51 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.attackChecks.blockSpoofPktStatusGet()
  local L0_52
  L0_52 = db.getAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.blockSpoofPktStatus)
  if L0_52 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_52
end
function fw.core.attackChecks.blockSpoofPktStatusGetNext(A0_53)
  local L2_54
  L2_54 = returnCodes
  L2_54 = L2_54.NOT_SUPPORTED
  return L2_54, A0_53
end
function fw.core.attackChecks.blockSpoofPktStatusEnable()
  local L0_55, L1_56
  L1_56 = db.setAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.blockSpoofPktStatus, _UPVALUE3_)
  if not L1_56 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.attackChecks.blockSpoofPktStatusDisable()
  local L0_57, L1_58
  L1_58 = db.setAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.blockSpoofPktStatus, _UPVALUE3_)
  if not L1_58 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.attackChecks.tcpFilterCheckStatusGet()
  local L0_59
  L0_59 = db.getAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.tcpFilterCheckStatus)
  if L0_59 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_59
end
function fw.core.attackChecks.tcpFilterCheckStatusGetNext(A0_60)
  local L2_61
  L2_61 = returnCodes
  L2_61 = L2_61.NOT_SUPPORTED
  return L2_61, A0_60
end
function fw.core.attackChecks.tcpFilterCheckStatusEnable()
  local L0_62, L1_63
  L1_63 = db.setAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.tcpFilterCheckStatus, _UPVALUE3_)
  if not L1_63 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.attackChecks.tcpFilterCheckStatusDisable()
  local L0_64, L1_65
  L1_65 = db.setAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.tcpFilterCheckStatus, _UPVALUE3_)
  if not L1_65 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.attackChecks.Get()
  local L0_66, L1_67, L2_68, L3_69, L4_70, L5_71, L6_72, L7_73
  L7_73 = {}
  L7_73 = db.getRow(attackChecksTable, _UPVALUE0_, _UPVALUE1_)
  if L7_73 == _UPVALUE2_ then
    return returnCodes.FAILURE
  else
    L0_66 = L7_73[attackChecksTable .. "." .. _UPVALUE3_.stealthModeStatus]
    L1_67 = L7_73[attackChecksTable .. "." .. _UPVALUE3_.blockTcpFloodStatus]
    L2_68 = L7_73[attackChecksTable .. "." .. _UPVALUE3_.blockUdpFloodStatus]
    L3_69 = L7_73[attackChecksTable .. "." .. _UPVALUE3_.udpConnectionLimitValue]
    L4_70 = L7_73[attackChecksTable .. "." .. _UPVALUE3_.pingOnLanStatus]
    L5_71 = L7_73[attackChecksTable .. "." .. _UPVALUE3_.blockSpoofPktStatus]
    L6_72 = L7_73[attackChecksTable .. "." .. _UPVALUE3_.tcpFilterCheckStatus]
    return returnCodes.SUCCESS, _UPVALUE1_, L0_66, L1_67, L2_68, L3_69, L4_70, L5_71, L6_72
  end
end
function fw.core.attackChecks.GetNext(A0_74)
  local L2_75
  L2_75 = returnCodes
  L2_75 = L2_75.NOT_SUPPORTED
  return L2_75, A0_74
end
function fw.core.attackChecks.edit(A0_76, A1_77, A2_78, A3_79, A4_80, A5_81, A6_82)
  local L7_83, L8_84, L9_85, L10_86
  L8_84 = {}
  L9_85, L10_86 = nil, nil
  L7_83 = booleanCheck(A0_76)
  if L7_83 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L7_83 = booleanCheck(A1_77)
  if L7_83 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L7_83 = booleanCheck(A2_78)
  if L7_83 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  if A2_78 == _UPVALUE1_ then
    L7_83 = numberRangeCheck(_UPVALUE2_, _UPVALUE3_, A3_79)
    if L7_83 ~= returnCodes.SUCCESS then
      return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
    end
  end
  L7_83 = booleanCheck(A4_80)
  if L7_83 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L7_83 = booleanCheck(A5_81)
  if L7_83 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L7_83 = booleanCheck(A6_82)
  if L7_83 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L8_84[attackChecksTable .. "." .. _UPVALUE4_.stealthModeStatus] = A0_76
  L8_84[attackChecksTable .. "." .. _UPVALUE4_.blockTcpFloodStatus] = A1_77
  L8_84[attackChecksTable .. "." .. _UPVALUE4_.blockUdpFloodStatus] = A2_78
  if A2_78 == _UPVALUE1_ then
    L8_84[attackChecksTable .. "." .. _UPVALUE4_.udpConnectionLimitValue] = A3_79
  end
  L8_84[attackChecksTable .. "." .. _UPVALUE4_.pingOnLanStatus] = A4_80
  L8_84[attackChecksTable .. "." .. _UPVALUE4_.blockSpoofPktStatus] = A5_81
  L8_84[attackChecksTable .. "." .. _UPVALUE4_.tcpFilterCheckStatus] = A6_82
  L10_86 = db.update(attackChecksTable, L8_84, _UPVALUE0_)
  if not L10_86 then
    return returnCodes.FAILURE, _UPVALUE0_
  end
  return returnCodes.SUCCESS, _UPVALUE0_
end
function fw.core.icsaSettings.Get()
  local L0_87, L1_88, L2_89, L3_90, L4_91
  L4_91 = {}
  L4_91 = db.getRow(icsaSettingsTable, _UPVALUE0_, _UPVALUE1_)
  if L4_91 == _UPVALUE2_ then
    return returnCodes.FAILURE
  else
    L0_87 = L4_91[icsaSettingsTable .. "." .. _UPVALUE3_.blockICMPNotification]
    L1_88 = L4_91[icsaSettingsTable .. "." .. _UPVALUE3_.blockFragPkts]
    L2_89 = L4_91[icsaSettingsTable .. "." .. _UPVALUE3_.blockMulticastPkts]
    L3_90 = L4_91[icsaSettingsTable .. "." .. _UPVALUE3_.blockTcpRST]
    return returnCodes.SUCCESS, _UPVALUE1_, L0_87, L1_88, L2_89, L3_90
  end
end
function fw.core.icsaSettings.GetNext(A0_92)
  local L2_93
  L2_93 = returnCodes
  L2_93 = L2_93.NOT_SUPPORTED
  return L2_93, A0_92
end
function fw.core.icsaSettings.edit(A0_94, A1_95, A2_96, A3_97)
  local L4_98, L5_99, L6_100, L7_101
  L5_99 = {}
  L6_100, L7_101 = nil, nil
  L4_98 = booleanCheck(A0_94)
  if L4_98 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L4_98 = booleanCheck(A1_95)
  if L4_98 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L4_98 = booleanCheck(A2_96)
  if L4_98 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L4_98 = booleanCheck(A3_97)
  if L4_98 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L5_99[icsaSettingsTable .. "." .. _UPVALUE1_.blockICMPNotification] = A0_94
  L5_99[icsaSettingsTable .. "." .. _UPVALUE1_.blockFragPkts] = A1_95
  L5_99[icsaSettingsTable .. "." .. _UPVALUE1_.blockMulticastPkts] = A2_96
  L5_99[icsaSettingsTable .. "." .. _UPVALUE1_.blockTcpRST] = A3_97
  L7_101 = db.update(icsaSettingsTable, L5_99, _UPVALUE0_)
  if not L7_101 then
    return returnCodes.FAILURE, _UPVALUE0_
  end
  return returnCodes.SUCCESS, _UPVALUE0_
end
function fw.core.icsaSettings.blockICMPNotificationStatusGet()
  local L0_102
  L0_102 = db.getAttribute(icsaSettingsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.blockICMPNotification)
  if L0_102 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_102
end
function fw.core.icsaSettings.blockICMPNotificationStatusGetNext(A0_103)
  local L2_104
  L2_104 = returnCodes
  L2_104 = L2_104.NOT_SUPPORTED
  return L2_104, A0_103
end
function fw.core.icsaSettings.blockICMPNotificationStatusEnable()
  local L0_105, L1_106
  L1_106 = db.setAttribute(icsaSettingsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.blockICMPNotification, _UPVALUE3_)
  if not L1_106 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.icsaSettings.blockICMPNotificationStatusDisable()
  local L0_107, L1_108
  L1_108 = db.setAttribute(icsaSettingsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.blockICMPNotification, _UPVALUE3_)
  if not L1_108 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.icsaSettings.blockFragPktsStatusGet()
  local L0_109
  L0_109 = db.getAttribute(icsaSettingsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.blockFragPkts)
  if L0_109 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_109
end
function fw.core.icsaSettings.blockFragPktsStatusGetNext(A0_110)
  local L2_111
  L2_111 = returnCodes
  L2_111 = L2_111.NOT_SUPPORTED
  return L2_111, A0_110
end
function fw.core.icsaSettings.blockFragPktsStatusEnable()
  local L0_112, L1_113
  L1_113 = db.setAttribute(icsaSettingsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.blockFragPkts, _UPVALUE3_)
  if not L1_113 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.icsaSettings.blockFragPktsStatusDisable()
  local L0_114, L1_115
  L1_115 = db.setAttribute(icsaSettingsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.blockFragPkts, _UPVALUE3_)
  if not L1_115 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.icsaSettings.blockMulticastPktsStatusGet()
  local L0_116
  L0_116 = db.getAttribute(icsaSettingsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.blockMulticastPkts)
  if L0_116 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_116
end
function fw.core.icsaSettings.blockMulticastPktsStatusGetNext(A0_117)
  local L2_118
  L2_118 = returnCodes
  L2_118 = L2_118.NOT_SUPPORTED
  return L2_118, A0_117
end
function fw.core.icsaSettings.blockMulticastPktsStatusEnable()
  local L0_119, L1_120
  L1_120 = db.setAttribute(icsaSettingsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.blockMulticastPkts, _UPVALUE3_)
  if not L1_120 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.icsaSettings.blockMulticastPktsStatusDisable()
  local L0_121, L1_122
  L1_122 = db.setAttribute(icsaSettingsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.blockMulticastPkts, _UPVALUE3_)
  if not L1_122 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.icsaSettings.blockTcpRSTStatusGet()
  local L0_123
  L0_123 = db.getAttribute(icsaSettingsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.blockTcpRST)
  if L0_123 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_123
end
function fw.core.icsaSettings.blockTcpRSTStatusGetNext(A0_124)
  local L2_125
  L2_125 = returnCodes
  L2_125 = L2_125.NOT_SUPPORTED
  return L2_125, A0_124
end
function fw.core.icsaSettings.blockTcpRSTStatusEnable()
  local L0_126, L1_127
  L1_127 = db.setAttribute(icsaSettingsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.blockTcpRST, _UPVALUE3_)
  if not L1_127 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.icsaSettings.blockTcpRSTStatusDisable()
  local L0_128, L1_129
  L1_129 = db.setAttribute(icsaSettingsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.blockTcpRST, _UPVALUE3_)
  if not L1_129 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.fwDosAttackSettings.Get()
  local L0_130, L1_131, L2_132, L3_133
  L3_133 = {}
  L3_133 = db.getRow(fwDosAttackSettingsTable, _UPVALUE0_, _UPVALUE1_)
  if L3_133 == _UPVALUE2_ then
    return returnCodes.FAILURE
  else
    L0_130 = L3_133[fwDosAttackSettingsTable .. "." .. _UPVALUE3_.synFloodDetectRate]
    L1_131 = L3_133[fwDosAttackSettingsTable .. "." .. _UPVALUE3_.echoStormFloodRate]
    L2_132 = L3_133[fwDosAttackSettingsTable .. "." .. _UPVALUE3_.icmpFloodRate]
    return returnCodes.SUCCESS, _UPVALUE1_, L0_130, L1_131, L2_132
  end
end
function fw.core.fwDosAttackSettings.GetNext(A0_134)
  local L2_135
  L2_135 = returnCodes
  L2_135 = L2_135.NOT_SUPPORTED
  return L2_135, A0_134
end
function fw.core.fwDosAttackSettings.edit(A0_136, A1_137, A2_138)
  local L3_139, L4_140, L5_141, L6_142, L7_143
  L4_140 = {}
  L5_141, L6_142, L7_143 = nil, nil, nil
  L3_139 = numberRangeCheck(_UPVALUE0_, _UPVALUE1_, A0_136)
  if L3_139 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE2_
  end
  L3_139 = numberRangeCheck(_UPVALUE0_, _UPVALUE1_, A1_137)
  if L3_139 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE2_
  end
  L3_139 = numberRangeCheck(_UPVALUE0_, _UPVALUE1_, A2_138)
  if L3_139 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE2_
  end
  L4_140[fwDosAttackSettingsTable .. "." .. _UPVALUE3_.synFloodDetectRate] = A0_136
  L4_140[fwDosAttackSettingsTable .. "." .. _UPVALUE3_.echoStormFloodRate] = A1_137
  L4_140[fwDosAttackSettingsTable .. "." .. _UPVALUE3_.icmpFloodRate] = A2_138
  L6_142 = db.update(fwDosAttackSettingsTable, L4_140, _UPVALUE2_)
  if not L6_142 then
    return returnCodes.FAILURE, _UPVALUE2_
  end
  return returnCodes.SUCCESS, _UPVALUE2_
end
function fw.core.fwDosAttackSettings.synFloodDetectRateGet()
  local L0_144
  L0_144 = db.getAttribute(fwDosAttackSettingsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.synFloodDetectRate)
  if L0_144 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_144
end
function fw.core.fwDosAttackSettings.synFloodDetectRateGetNext(A0_145)
  local L2_146
  L2_146 = returnCodes
  L2_146 = L2_146.NOT_SUPPORTED
  return L2_146, A0_145
end
function fw.core.fwDosAttackSettings.synFloodDetectRateSet(A0_147)
  local L1_148, L2_149, L3_150
  L1_148 = numberRangeCheck(_UPVALUE0_, _UPVALUE1_, A0_147)
  if L1_148 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE2_
  end
  L3_150 = db.setAttribute(fwDosAttackSettingsTable, _UPVALUE3_, _UPVALUE2_, _UPVALUE4_.synFloodDetectRate, A0_147)
  if not L3_150 then
    return returnCodes.FAILURE, _UPVALUE2_
  end
  return returnCodes.SUCCESS, _UPVALUE2_
end
function fw.core.fwDosAttackSettings.echoStormFloodRateGet()
  local L0_151
  L0_151 = db.getAttribute(fwDosAttackSettingsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.echoStormFloodRate)
  if L0_151 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_151
end
function fw.core.fwDosAttackSettings.echoStormFloodRateGetNext(A0_152)
  local L2_153
  L2_153 = returnCodes
  L2_153 = L2_153.NOT_SUPPORTED
  return L2_153, A0_152
end
function fw.core.fwDosAttackSettings.echoStormFloodRateSet(A0_154)
  local L1_155, L2_156, L3_157
  L1_155 = numberRangeCheck(_UPVALUE0_, _UPVALUE1_, A0_154)
  if L1_155 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE2_
  end
  L3_157 = db.setAttribute(fwDosAttackSettingsTable, _UPVALUE3_, _UPVALUE2_, _UPVALUE4_.echoStormFloodRate, A0_154)
  if not L3_157 then
    return returnCodes.FAILURE, _UPVALUE2_
  end
  return returnCodes.SUCCESS, _UPVALUE2_
end
function fw.core.fwDosAttackSettings.icmpFloodRateGet()
  local L0_158
  L0_158 = db.getAttribute(fwDosAttackSettingsTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.icmpFloodRate)
  if L0_158 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_158
end
function fw.core.fwDosAttackSettings.icmpFloodRateGetNext(A0_159)
  local L2_160
  L2_160 = returnCodes
  L2_160 = L2_160.NOT_SUPPORTED
  return L2_160, A0_159
end
function fw.core.fwDosAttackSettings.icmpFloodRateSet(A0_161)
  local L1_162, L2_163, L3_164
  L1_162 = numberRangeCheck(_UPVALUE0_, _UPVALUE1_, A0_161)
  if L1_162 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE2_
  end
  L3_164 = db.setAttribute(fwDosAttackSettingsTable, _UPVALUE3_, _UPVALUE2_, _UPVALUE4_.icmpFloodRate, A0_161)
  if not L3_164 then
    return returnCodes.FAILURE, _UPVALUE2_
  end
  return returnCodes.SUCCESS, echoStormFloodRate
end
