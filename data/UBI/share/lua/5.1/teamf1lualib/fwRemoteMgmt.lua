local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/fwValidations")
L0_0 = "1"
fw.core.schedules = {}
remoteMgmtTable = "accessMgmt"
;({}).accessMgmtEnable = "accessMgmtEnable"
;({}).serviceType = "serviceType"
;({}).ipMode = "ipMode"
;({}).accessType = "accessType"
;({}).ipv4StartIP = "accessMgmtIP1"
;({}).ipv4EndIP = "accessMgmtIP2"
;({}).ipv6StartIP = "accessMgmtIP3"
;({}).ipv6EndIP = "accessMgmtIP4"
;({}).port = "port"
fw.core.remoteHttpsMgmt = {}
fw.core.remoteSshMgmt = {}
function fw.core.remoteHttpsMgmt.statusEnable()
  local L0_1, L1_2, L2_3
  L1_2 = DUMMY_COOKIE
  L2_3 = nil
  L2_3 = db.setAttribute(remoteMgmtTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.accessMgmtEnable, _UPVALUE3_)
  if not L2_3 then
    return returnCodes.FAILURE, L1_2
  end
  return returnCodes.SUCCESS, L1_2
end
function fw.core.remoteHttpsMgmt.statusDisable()
  local L0_4, L1_5, L2_6
  L1_5 = DUMMY_COOKIE
  L2_6 = nil
  L2_6 = db.setAttribute(remoteMgmtTable, _UPVALUE0_, _UPVALUE1_, attributehaccessMgmtEnable, _UPVALUE2_)
  if not L2_6 then
    return returnCodes.FAILURE, L1_5
  end
  return returnCodes.SUCCESS, L1_5
end
function fw.core.remoteHttpsMgmt.statusGet()
  local L0_7
  L0_7 = db.getAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.accessMgmtEnable)
  if L0_7 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_7
end
function fw.core.remoteHttpsMgmt.statusGetNext(A0_8)
  local L2_9
  L2_9 = returnCodes
  L2_9 = L2_9.NOT_SUPPORTED
  return L2_9, A0_8
end
function fw.core.remoteHttpsMgmt.serviceTypeSet(A0_10)
  local L2_11
  L2_11 = returnCodes
  L2_11 = L2_11.NOT_SUPPORTED
  return L2_11, cookie
end
function fw.core.remoteHttpsMgmt.accessTypeSet(A0_12)
  local L1_13, L2_14, L3_15
  L3_15 = db.setAttribute(remoteMgmtTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.accessType, A0_12)
  if not L3_15 then
    return returnCodes.FAILURE, cookie
  end
  return returnCodes.SUCCESS, cookie
end
function fw.core.remoteHttpsMgmt.accessTypeGet()
  local L0_16
  L0_16 = db.getAttribute(remoteMgmtTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.accessType)
  if L0_16 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_16
end
function fw.core.remoteHttpsMgmt.accessTypeGetNext(A0_17)
  local L2_18
  L2_18 = returnCodes
  L2_18 = L2_18.NOT_SUPPORTED
  return L2_18, A0_17
end
function fw.core.remoteHttpsMgmt.ipv4StartIPSet(A0_19)
  local L1_20, L2_21, L3_22
  L3_22 = db.setAttribute(remoteMgmtTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.ipv4StartIP, A0_19)
  if not L3_22 then
    return returnCodes.FAILURE, cookie
  end
  return returnCodes.SUCCESS, cookie
end
function fw.core.remoteHttpsMgmt.ipv4StartIPGet()
  local L0_23
  L0_23 = db.getAttribute(remoteMgmtTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.ipv4StartIP)
  if L0_23 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_23
end
function fw.core.remoteHttpsMgmt.ipv4StartIPGetNext(A0_24)
  local L2_25
  L2_25 = returnCodes
  L2_25 = L2_25.NOT_SUPPORTED
  return L2_25, A0_24
end
function fw.core.remoteHttpsMgmt.ipv4EndIPSet(A0_26)
  local L1_27, L2_28, L3_29
  L3_29 = db.setAttribute(remoteMgmtTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.ipv4EndIP, ipv4StartIpaddress)
  if not L3_29 then
    return returnCodes.FAILURE, cookie
  end
  return returnCodes.SUCCESS, cookie
end
function fw.core.remoteHttpsMgmt.ipv4EndIPGet()
  local L0_30
  L0_30 = db.getAttribute(remoteMgmtTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.ipv4EndIP)
  if L0_30 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_30
end
function fw.core.remoteHttpsMgmt.ipv4EndIPGet()
  local L1_31
  L1_31 = returnCodes
  L1_31 = L1_31.NOT_SUPPORTED
  return L1_31, cookie
end
function fw.core.remoteHttpsMgmt.portSet(A0_32)
  local L1_33, L2_34, L3_35
  L3_35 = db.setAttribute(remoteMgmtTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.port, A0_32)
  if not L3_35 then
    return returnCodes.FAILURE, cookie
  end
  return returnCodes.SUCCESS, cookie
end
function fw.core.remoteHttpsMgmt.portGet()
  local L0_36
  L0_36 = db.getAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.port)
  if L0_36 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_36
end
function fw.core.remoteHttpsMgmt.portGetNext(A0_37)
  local L2_38
  L2_38 = returnCodes
  L2_38 = L2_38.NOT_SUPPORTED
  return L2_38, A0_37
end
function fw.core.remoteSshMgmt.statusEnable()
  local L0_39, L1_40, L2_41
  L1_40 = DUMMY_COOKIE
  L2_41 = nil
  L2_41 = db.setAttribute(remoteMgmtTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.accessMgmtEnable, _UPVALUE3_)
  if not L2_41 then
    return returnCodes.FAILURE, L1_40
  end
  return returnCodes.SUCCESS, L1_40
end
function fw.core.remoteSshMgmt.statusDisable()
  local L0_42, L1_43, L2_44
  L1_43 = DUMMY_COOKIE
  L2_44 = nil
  L2_44 = db.setAttribute(remoteMgmtTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.accessMgmtEnable, _UPVALUE3_)
  if not L2_44 then
    return returnCodes.FAILURE, L1_43
  end
  return returnCodes.SUCCESS, L1_43
end
function fw.core.remoteSshMgmt.statusGet()
  local L0_45
  remoteHttpsStatus = db.getAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.accessMgmtEnable)
  if remoteHttpsStatus == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_45
end
function fw.core.remoteSshMgmt.statusGetNext(A0_46)
  local L2_47
  L2_47 = returnCodes
  L2_47 = L2_47.NOT_SUPPORTED
  return L2_47, A0_46
end
function fw.core.remoteSshMgmt.serviceTypeSet(A0_48)
  local L2_49
  L2_49 = returnCodes
  L2_49 = L2_49.NOT_SUPPORTED
  return L2_49, cookie
end
function fw.core.remoteSshMgmt.serviceTypeGet(A0_50)
  local L2_51
  L2_51 = returnCodes
  L2_51 = L2_51.NOT_SUPPORTED
  return L2_51, cookie
end
function fw.core.remoteSshMgmt.accessTypeSet(A0_52)
  local L1_53, L2_54, L3_55
  L3_55 = db.setAttribute(remoteMgmtTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.accessType, A0_52)
  if not L3_55 then
    return returnCodes.FAILURE, cookie
  end
  return returnCodes.SUCCESS, cookie
end
function fw.core.remoteSshMgmt.accessTypeGet()
  local L0_56
  L0_56 = db.getAttribute(remoteMgmtTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.accessType)
  if L0_56 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_56
end
function fw.core.remoteSshMgmt.accessTypeGetNext(A0_57)
  local L2_58
  L2_58 = returnCodes
  L2_58 = L2_58.NOT_SUPPORTED
  return L2_58, A0_57
end
function fw.core.remoteSshMgmt.ipv4StartIPSet(A0_59)
  local L1_60, L2_61, L3_62
  L3_62 = db.setAttribute(remoteMgmtTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.ipv4StartIP, A0_59)
  if not L3_62 then
    return returnCodes.FAILURE, cookie
  end
  return returnCodes.SUCCESS, cookie
end
function fw.core.remoteSshMgmt.ipv4StartIPGet()
  local L0_63
  L0_63 = db.getAttribute(remoteMgmtTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.ipv4StartIP)
  if L0_63 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_63
end
function fw.core.remoteSshMgmt.ipv4StartIPGetNext(A0_64)
  local L2_65
  L2_65 = returnCodes
  L2_65 = L2_65.NOT_SUPPORTED
  return L2_65, A0_64
end
function fw.core.remoteSshMgmt.ipv4EndIPSet(A0_66)
  local L1_67, L2_68, L3_69
  L3_69 = db.setAttribute(remoteMgmtTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.ipv4EndIP, ipv4StartIpaddress)
  if not L3_69 then
    return returnCodes.FAILURE, cookie
  end
  return returnCodes.SUCCESS, cookie
end
function fw.core.remoteSshMgmt.ipv4EndIPGet()
  local L0_70
  L0_70 = db.getAttribute(remoteMgmtTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.ipv4EndIP)
  if L0_70 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_70
end
function fw.core.remoteSshMgmt.ipv4EndIPGet()
  local L1_71
  L1_71 = returnCodes
  L1_71 = L1_71.NOT_SUPPORTED
  return L1_71, cookie
end
function fw.core.remoteSshMgmt.portSet(A0_72)
  local L2_73
  L2_73 = returnCodes
  L2_73 = L2_73.NOT_SUPPORTED
  return L2_73, cookie
end
function fw.core.remoteSshMgmt.portGet()
  local L1_74
  L1_74 = returnCodes
  L1_74 = L1_74.NOT_SUPPORTED
  return L1_74, cookie
end
function fw.core.remoteSshMgmt.portGetNext(A0_75)
  local L2_76
  L2_76 = returnCodes
  L2_76 = L2_76.NOT_SUPPORTED
  return L2_76, A0_75
end
function fw.core.remoteHttpsMgmt.Get()
  local L0_77, L1_78, L2_79, L3_80, L4_81, L5_82
  L5_82 = {}
  L5_82 = db.getRow(remoteMgmtTable, _UPVALUE0_, _UPVALUE1_)
  if L5_82 == _UPVALUE2_ then
    return returnCodes.FAILURE
  else
    L0_77 = L5_82[remoteMgmtTable .. "." .. _UPVALUE3_.accessMgmtEnable]
    L1_78 = L5_82[remoteMgmtTable .. "." .. _UPVALUE3_.accessType]
    L2_79 = L5_82[remoteMgmtTable .. "." .. _UPVALUE3_.ipv4StartIP]
    L3_80 = L5_82[remoteMgmtTable .. "." .. _UPVALUE3_.ipv4EndIP]
    L4_81 = L5_82[remoteMgmtTable .. "." .. _UPVALUE3_.httpsPort]
    return returnCodes.SUCCESS, _UPVALUE1_, L0_77, L1_78, L2_79, L3_80, L4_81
  end
end
function fw.core.remoteHttpsMgmt.GetNext(A0_83)
  local L2_84
  L2_84 = returnCodes
  L2_84 = L2_84.NOT_SUPPORTED
  return L2_84, A0_83
end
function fw.core.remoteHttpsMgmt.edit(A0_85, A1_86, A2_87, A3_88, A4_89)
  local L5_90, L6_91, L7_92, L8_93, L9_94
  L6_91 = {}
  L7_92, L8_93, L9_94 = nil, nil, nil
  L5_90 = booleanCheck(A0_85)
  if L5_90 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, L9_94
  end
  L6_91[remoteMgmtTable .. "." .. _UPVALUE0_.accessMgmtStatus] = A0_85
  L6_91[remoteMgmtTable .. "." .. _UPVALUE0_.accessType] = A1_86
  L6_91[remoteMgmtTable .. "." .. _UPVALUE0_.ipv4StartIP] = A2_87
  L6_91[remoteMgmtTable .. "." .. _UPVALUE0_.ipv4EndIP] = A3_88
  L6_91[remoteMgmtTable .. "." .. _UPVALUE0_.httpsPort] = A4_89
  L8_93 = db.update(remoteMgmtTable, L6_91, _UPVALUE1_)
  if not L8_93 then
    return returnCodes.FAILURE, L9_94
  end
  return returnCodes.SUCCESS, L9_94
end
function fw.core.remoteSshMgmt.Get()
  local L0_95, L1_96, L2_97, L3_98, L4_99
  L4_99 = {}
  L4_99 = db.getRow(remoteMgmtTable, _UPVALUE0_, _UPVALUE1_)
  if L4_99 == _UPVALUE2_ then
    return returnCodes.FAILURE
  else
    L0_95 = L4_99[remoteMgmtTable .. "." .. _UPVALUE3_.accessMgmtEnable]
    L1_96 = L4_99[remoteMgmtTable .. "." .. _UPVALUE3_.accessType]
    L2_97 = L4_99[remoteMgmtTable .. "." .. _UPVALUE3_.ipv4StartIP]
    L3_98 = L4_99[remoteMgmtTable .. "." .. _UPVALUE3_.ipv4EndIP]
    return returnCodes.SUCCESS, _UPVALUE1_, L0_95, L1_96, L2_97, L3_98
  end
end
function fw.core.remoteSshMgmt.GetNext(A0_100)
  local L2_101
  L2_101 = returnCodes
  L2_101 = L2_101.NOT_SUPPORTED
  return L2_101, A0_100
end
function fw.core.remoteSshMgmt.edit(A0_102, A1_103, A2_104, A3_105)
  local L4_106, L5_107, L6_108, L7_109, L8_110
  L5_107 = {}
  L6_108, L7_109, L8_110 = nil, nil, nil
  L4_106 = booleanCheck(A0_102)
  if L4_106 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, L8_110
  end
  L5_107[remoteMgmtTable .. "." .. _UPVALUE0_.accessMgmtStatus] = A0_102
  L5_107[remoteMgmtTable .. "." .. _UPVALUE0_.accessType] = A1_103
  L5_107[remoteMgmtTable .. "." .. _UPVALUE0_.ipv4StartIP] = A2_104
  L5_107[remoteMgmtTable .. "." .. _UPVALUE0_.ipv4EndIP] = A3_105
  L7_109 = db.update(remoteMgmtTable, L5_107, _UPVALUE1_)
  if not L7_109 then
    return returnCodes.FAILURE, L8_110
  end
  return returnCodes.SUCCESS, L8_110
end
