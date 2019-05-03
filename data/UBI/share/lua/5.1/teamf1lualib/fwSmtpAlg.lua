local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/fwValidations")
L0_0 = "1"
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
elseif PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-500_Ax" or PRODUCT_ID == "DSR-500N_Ax" then
elseif UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-250N" then
elseif UNIT_NAME == "DSR-150" or UNIT_NAME == "DSR-150N" then
end
fw.core.smtpAlg = {}
fw.core.approvedMailIdList = {}
fw.core.blockedMailIdList = {}
fw.core.subjectList = {}
smtpAlgTable = "smtpAlg"
;({}).status = "smtpAlgStatus"
;({}).port = "port"
approvedMailIdListTable = "approvedMailIdList"
;({}).approvedMailId = "approvedMailId"
blockedMailIdListTable = "blockedMailIdList"
;({}).blockedMailId = "blockedMailId"
subjectListTable = "subjectList"
;({}).subject = "subject"
;({}).mailId = "mailId"
;({}).action = "action"
function fw.core.smtpAlg.Get()
  local L0_1, L1_2, L2_3
  L2_3 = {}
  L2_3 = db.getRow(smtpAlgTable, _UPVALUE0_, _UPVALUE1_)
  if L2_3 == _UPVALUE2_ then
    return returnCodes.FAILURE
  else
    L0_1 = L2_3[smtpAlgTable .. "." .. _UPVALUE3_.status]
    L1_2 = L2_3[smtpAlgTable .. "." .. _UPVALUE3_.port]
    return returnCodes.SUCCESS, _UPVALUE1_, L0_1, L1_2
  end
end
function fw.core.smtpAlg.GetNext(A0_4)
  local L2_5
  L2_5 = returnCodes
  L2_5 = L2_5.NOT_SUPPORTED
  return L2_5, A0_4
end
function fw.core.smtpAlg.edit(A0_6, A1_7)
  local L2_8, L3_9, L4_10, L5_11, L6_12
  L3_9 = {}
  L4_10, L5_11, L6_12 = nil, nil, nil
  L2_8 = booleanCheck(A0_6)
  if L2_8 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  if A0_6 == _UPVALUE1_ then
    L6_12, L2_8 = fw_portValidation(_UPVALUE2_, _UPVALUE3_, A1_7)
    if L2_8 ~= returnCodes.SUCCESS then
      return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
    end
  end
  L3_9[smtpAlgTable .. "." .. _UPVALUE4_.status] = A0_6
  L3_9[smtpAlgTable .. "." .. _UPVALUE4_.port] = L6_12
  L5_11 = db.update(smtpAlgTable, L3_9, _UPVALUE0_)
  if not L5_11 then
    return returnCodes.FAILURE, _UPVALUE0_
  end
  return returnCodes.SUCCESS, _UPVALUE0_
end
function fw.core.smtpAlg.statusGet()
  local L0_13
  L0_13 = db.getAttribute(smtpAlgTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.status)
  if L0_13 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_13
end
function fw.core.smtpAlg.statusGetNext(A0_14)
  local L2_15
  L2_15 = returnCodes
  L2_15 = L2_15.NOT_SUPPORTED
  return L2_15, A0_14
end
function fw.core.smtpAlg.statusEnable()
  local L0_16, L1_17
  L1_17 = db.setAttribute(smtpAlgTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.status, _UPVALUE3_)
  if not L1_17 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.smtpAlg.statusDisable()
  local L0_18, L1_19
  L1_19 = db.setAttribute(smtpAlgTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.status, _UPVALUE3_)
  if not L1_19 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.smtpAlg.portGet()
  local L0_20
  L0_20 = db.getAttribute(smtpAlgTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.port)
  if L0_20 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_20
end
function fw.core.smtpAlg.portGetNext(A0_21)
  local L2_22
  L2_22 = returnCodes
  L2_22 = L2_22.NOT_SUPPORTED
  return L2_22, A0_21
end
function fw.core.smtpAlg.portSet(A0_23)
  local L1_24, L2_25, L3_26, L4_27
  L4_27 = db.getAttribute(smtpAlgTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.status)
  if L4_27 == _UPVALUE3_ then
    port, L1_24 = fw_portValidation(_UPVALUE4_, _UPVALUE5_, A0_23)
    if L1_24 ~= returnCodes.SUCCESS then
      return returnCodes.INVALID_ARGUMENT, cookie
    end
  end
  L3_26 = db.setAttribute(smtpAlgTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.port, A0_23)
  if not L3_26 then
    return returnCodes.FAILURE, cookie
  end
  return returnCodes.SUCCESS, cookie
end
function fw.core.approvedMailIdList.add(A0_28)
  local L1_29, L2_30, L3_31, L4_32, L5_33
  L2_30 = {}
  L3_31, L4_32, L5_33 = nil, nil, nil
  L1_29, cookie, L5_33 = fw.core.smtpAlg.statusGet()
  if L5_33 ~= _UPVALUE0_ then
    return fwReturnCodes.COMP_FIREWALL_SMTP_DISABLED, cookie
  end
  L1_29 = urlValidation(A0_28)
  if not L1_29 then
    return returnCodes.INVALID_ARGUMENT, cookie
  end
  L1_29 = db.existsRow(approvedMailIdListTable, _UPVALUE1_, A0_28)
  if L1_29 then
    return fwReturnCodes.COMP_FIREWALL_MAILID_ALREADY_EXIT
  end
  L2_30[approvedMailIdListTable .. "." .. _UPVALUE2_.approvedMailId] = A0_28
  if #db.getRowsWhere(approvedMailIdListTable, " approvedMailId is NOT NULL") >= _UPVALUE3_ then
    return returnCodes.MAXIMUM_APPROVEMAILID_EXCEED
  end
  L1_29 = db.insert(approvedMailIdListTable, L2_30)
  if not L1_29 then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, A0_28
end
function fw.core.approvedMailIdList.approvedMailIdSet(A0_34, A1_35)
  local L2_36, L3_37, L4_38
  if A0_34 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_36 = db.existsRow(approvedMailIdListTable, _UPVALUE1_, A0_34)
  if not L2_36 then
    return returnCodes.COOKIEFAIL
  end
  L2_36 = urlValidation(A1_35)
  if not L2_36 then
    return returnCodes.INVALID_ARGUMENT, A0_34
  end
  L2_36 = db.existsRow(approvedMailIdListTable, _UPVALUE1_, A1_35)
  if L2_36 and A0_34 ~= A1_35 then
    return fwReturnCodes.COMP_FIREWALL_MAILID_ALREADY_EXIT
  end
  L4_38 = db.setAttribute(approvedMailIdListTable, _UPVALUE1_, A0_34, _UPVALUE2_.approvedMailId, A1_35)
  if not L4_38 then
    return returnCodes.FAILURE, A0_34
  end
  return returnCodes.SUCCESS, A0_34
end
function fw.core.approvedMailIdList.delete(A0_39)
  local L1_40, L2_41, L3_42
  if A0_39 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_40 = db.existsRow(approvedMailIdListTable, _UPVALUE1_, A0_39)
  if not L1_40 then
    return returnCodes.COOKIEFAIL
  end
  L3_42 = db.deleteRow(approvedMailIdListTable, _UPVALUE1_, A0_39)
  if not L3_42 then
    return returnCodes.FAILURE, A0_39
  end
  return returnCodes.SUCCESS, A0_39
end
function fw.core.approvedMailIdList.deleteAll()
  local L0_43
  L0_43 = db.deleteAllRows(approvedMailIdListTable)
  if not L0_43 then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS
end
function fw.core.approvedMailIdList.approvedMailIdGet()
  local L0_44, L1_45, L2_46
  L1_45, L0_44 = getFirstCookie(approvedMailIdListTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_45 then
    return L1_45
  end
  L2_46 = db.getAttribute(approvedMailIdListTable, _UPVALUE0_, L0_44, _UPVALUE1_.approvedMailId)
  if L2_46 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_44, L2_46
end
function fw.core.approvedMailIdList.approvedMailIdGetNext(A0_47)
  local L1_48, L2_49, L3_50
  L2_49, rowId = getNextCookie(approvedMailIdListTable, _UPVALUE0_, L1_48)
  if returnCodes.SUCCESS ~= L2_49 then
    return L2_49
  end
  L3_50 = db.getAttribute(approvedMailIdListTable, _UPVALUE0_, rowId, _UPVALUE1_.approvedMailId)
  if L3_50 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, rowId, L3_50
end
function fw.core.approvedMailIdList.rowGet(A0_51)
  local L1_52, L2_53
  L2_53 = db.getAttribute(approvedMailIdListTable, _UPVALUE0_, A0_51, _UPVALUE1_.approvedMailId)
  if L2_53 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, A0_51, L2_53
end
function fw.core.approvedMailIdList.GetAll()
  local L0_54, L1_55
  L1_55 = fw
  L1_55 = L1_55.core
  L1_55 = L1_55.smtpAlg
  L1_55 = L1_55.statusGet
  cookie, L0_54, L1_55 = nil, nil, L1_55()
  valid = L1_55
  L1_55 = _UPVALUE0_
  if L0_54 ~= L1_55 then
    L1_55 = fwReturnCodes
    L1_55 = L1_55.COMP_FIREWALL_SMTP_DISABLED
    return L1_55, cookie
  end
  L1_55 = db
  L1_55 = L1_55.getTable
  L1_55 = L1_55(approvedMailIdListTable, false)
  if L1_55 == _UPVALUE1_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L1_55
end
function fw.core.blockedMailIdList.add(A0_56)
  local L1_57, L2_58, L3_59, L4_60, L5_61
  L2_58 = {}
  L3_59, L4_60, L5_61 = nil, nil, nil
  L1_57, cookie, L5_61 = fw.core.smtpAlg.statusGet()
  if L5_61 ~= _UPVALUE0_ then
    return fwReturnCodes.COMP_FIREWALL_SMTP_DISABLED, cookie
  end
  L1_57 = urlValidation(A0_56)
  if not L1_57 then
    return returnCodes.INVALID_ARGUMENT, cookie
  end
  L1_57 = db.existsRow(blockedMailIdListTable, _UPVALUE1_, A0_56)
  if L1_57 then
    return fwReturnCodes.COMP_FIREWALL_MAILID_ALREADY_EXIT
  end
  L2_58[blockedMailIdListTable .. "." .. _UPVALUE2_.blockedMailId] = A0_56
  if #db.getRowsWhere(blockedMailIdListTable, " blockedMailId is NOT NULL") >= _UPVALUE3_ then
    return returnCodes.MAXIMUM_BLOCKMAILID_EXCEED
  end
  L1_57 = db.insert(blockedMailIdListTable, L2_58)
  if not L1_57 then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.blockedMailIdList.blockedMailIdSet(A0_62, A1_63)
  local L2_64, L3_65, L4_66
  if A0_62 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_64 = db.existsRow(blockedMailIdListTable, _UPVALUE1_, A0_62)
  if not L2_64 then
    return returnCodes.COOKIEFAIL
  end
  L2_64 = urlValidation(A1_63)
  if not L2_64 then
    return returnCodes.INVALID_ARGUMENT, A0_62
  end
  L2_64 = db.existsRow(blockedMailIdListTable, _UPVALUE1_, A1_63)
  if L2_64 and A0_62 ~= A1_63 then
    return fwReturnCodes.COMP_FIREWALL_MAILID_ALREADY_EXIT
  end
  L4_66 = db.setAttribute(blockedMailIdListTable, _UPVALUE1_, A0_62, _UPVALUE2_.blockedMailId, A1_63)
  if not L4_66 then
    return returnCodes.FAILURE, A0_62
  end
  return returnCodes.SUCCESS, A0_62
end
function fw.core.blockedMailIdList.delete(A0_67)
  local L1_68, L2_69, L3_70
  if A0_67 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_68 = db.existsRow(blockedMailIdListTable, _UPVALUE1_, A0_67)
  if not L1_68 then
    return returnCodes.COOKIEFAIL
  end
  L3_70 = db.deleteRow(blockedMailIdListTable, _UPVALUE1_, A0_67)
  if not L3_70 then
    return returnCodes.FAILURE, A0_67
  end
  return returnCodes.SUCCESS, A0_67
end
function fw.core.blockedMailIdList.deleteAll()
  local L0_71
  L0_71 = db.deleteAllRows(blockedMailIdListTable)
  if not L0_71 then
    return returnCodes.FAILURE, cookie
  end
  return returnCodes.SUCCESS, cookie
end
function fw.core.blockedMailIdList.blockedMailIdGet()
  local L0_72, L1_73, L2_74
  L1_73, L0_72 = getFirstCookie(blockedMailIdListTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_73 then
    return L1_73
  end
  L2_74 = db.getAttribute(blockedMailIdListTable, _UPVALUE0_, L0_72, _UPVALUE1_.blockedMailId)
  if L2_74 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_72, L2_74
end
function fw.core.blockedMailIdList.blockedMailIdGetNext(A0_75)
  local L1_76, L2_77, L3_78
  L2_77, rowId = getNextCookie(blockedMailIdListTable, _UPVALUE0_, L1_76)
  if returnCodes.SUCCESS ~= L2_77 then
    return L2_77
  end
  L3_78 = db.getAttribute(blockedMailIdListTable, _UPVALUE0_, rowId, _UPVALUE1_.blockedMailId)
  if L3_78 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, rowId, L3_78
end
function fw.core.blockedMailIdList.rowGet(A0_79)
  local L1_80, L2_81
  if A0_79 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_81 = db.getAttribute(blockedMailIdListTable, _UPVALUE1_, A0_79, _UPVALUE2_.blockedMailId)
  if L2_81 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, A0_79, L2_81
end
function fw.core.blockedMailIdList.GetAll()
  local L0_82, L1_83
  L1_83 = fw
  L1_83 = L1_83.core
  L1_83 = L1_83.smtpAlg
  L1_83 = L1_83.statusGet
  cookie, L0_82, L1_83 = nil, nil, L1_83()
  valid = L1_83
  L1_83 = _UPVALUE0_
  if L0_82 ~= L1_83 then
    L1_83 = fwReturnCodes
    L1_83 = L1_83.COMP_FIREWALL_SMTP_DISABLED
    return L1_83, cookie
  end
  L1_83 = db
  L1_83 = L1_83.getTable
  L1_83 = L1_83(blockedMailIdListTable, false)
  if L1_83 == _UPVALUE1_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L1_83
end
function fw.core.subjectList.add(A0_84, A1_85, A2_86)
  local L3_87, L4_88, L5_89, L6_90, L7_91, L8_92
  L4_88 = {}
  L5_89, L6_90 = nil, nil
  L7_91 = DUMMY_COOKIE
  L8_92 = nil
  L3_87, L7_91, L8_92 = fw.core.smtpAlg.statusGet()
  if L8_92 ~= _UPVALUE0_ then
    return fwReturnCodes.COMP_FIREWALL_SMTP_DISABLED, L7_91
  end
  if A0_84 == _UPVALUE1_ then
    return returnCodes.INVALID_ARGUMENT, L7_91
  end
  L3_87 = urlValidation(A1_85)
  if not L3_87 then
    return returnCodes.INVALID_ARGUMENT, L7_91
  end
  if UNIT_NAME == "DSR-250N" or UNIT_NAME == "DSR-250" then
    _UPVALUE2_ = 50
  end
  if UNIT_NAME == "DSR-150N" or UNIT_NAME == "DSR-150" then
    _UPVALUE2_ = 25
  end
  if #db.getRowsWhere(subjectListTable, " mailId is NOT NULL") >= _UPVALUE2_ then
    return returnCodes.MAXIMUM_MAILFILTER_EXCEED
  end
  L3_87 = booleanCheck(A2_86)
  if L3_87 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, L7_91
  end
  L4_88[subjectListTable .. "." .. _UPVALUE3_.subject] = A0_84
  L4_88[subjectListTable .. "." .. _UPVALUE3_.mailId] = A1_85
  L4_88[subjectListTable .. "." .. _UPVALUE3_.action] = A2_86
  L3_87 = db.insert(subjectListTable, L4_88)
  if not L3_87 then
    return returnCodes.FAILURE
  end
  L7_91 = db.getAttribute(subjectListTable, _UPVALUE3_.subject, A0_84, _UPVALUE4_)
  if L7_91 == _UPVALUE1_ then
    return returnCodes.COOKIEFAIL
  end
  return returnCodes.SUCCESS, L7_91
end
function fw.core.subjectList.edit(A0_93, A1_94, A2_95, A3_96)
  local L4_97, L5_98, L6_99, L7_100
  L5_98 = {}
  L6_99, L7_100 = nil, nil
  if A3_96 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L4_97 = db.existsRow(subjectListTable, _UPVALUE1_, A3_96)
  if not L4_97 then
    return returnCodes.COOKIEFAIL
  end
  if A0_93 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT, A3_96
  end
  L4_97 = urlValidation(A1_94)
  if not L4_97 then
    return returnCodes.INVALID_ARGUMENT, A3_96
  end
  L4_97 = booleanCheck(A2_95)
  if L4_97 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A3_96
  end
  L5_98[subjectListTable .. "." .. _UPVALUE2_.subject] = A0_93
  L5_98[subjectListTable .. "." .. _UPVALUE2_.mailId] = A1_94
  L5_98[subjectListTable .. "." .. _UPVALUE2_.action] = A2_95
  L4_97 = db.update(subjectListTable, L5_98, A3_96)
  if not L4_97 then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, A3_96
end
function fw.core.subjectList.Get()
  local L0_101, L1_102, L2_103, L3_104, L4_105, L5_106
  L5_106 = {}
  L1_102, L0_101 = getFirstCookie(subjectListTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_102 then
    return L1_102
  end
  L5_106 = db.getRow(subjectListTable, _UPVALUE0_, L0_101)
  if L5_106 == _UPVALUE1_ then
    return returnCodes.FAILURE
  end
  L2_103 = L5_106[subjectListTable .. "." .. _UPVALUE2_.subject]
  L3_104 = L5_106[subjectListTable .. "." .. _UPVALUE2_.mailId]
  L4_105 = L5_106[subjectListTable .. "." .. _UPVALUE2_.action]
  return returnCodes.SUCCESS, L0_101, L2_103, L3_104, L4_105
end
function fw.core.subjectList.GetNext(A0_107)
  local L1_108, L2_109, L3_110, L4_111, L5_112
  L5_112 = {}
  if A0_107 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_108, rowId = getNextCookie(subjectListTable, _UPVALUE1_, A0_107)
  if returnCodes.SUCCESS ~= L1_108 then
    return L1_108
  end
  L5_112 = db.getRow(subjectListTable, _UPVALUE1_, rowId)
  if L5_112 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  L2_109 = L5_112[subjectListTable .. "." .. _UPVALUE2_.subject]
  L3_110 = L5_112[subjectListTable .. "." .. _UPVALUE2_.mailId]
  L4_111 = L5_112[subjectListTable .. "." .. _UPVALUE2_.action]
  return returnCodes.SUCCESS, rowId, L2_109, L3_110, L4_111
end
function fw.core.subjectList.rowGet(A0_113)
  local L1_114, L2_115, L3_116, L4_117, L5_118
  L5_118 = {}
  if A0_113 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L5_118 = db.getRow(subjectListTable, _UPVALUE1_, A0_113)
  if L5_118 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  L2_115 = L5_118[subjectListTable .. "." .. _UPVALUE2_.subject]
  L3_116 = L5_118[subjectListTable .. "." .. _UPVALUE2_.mailId]
  L4_117 = L5_118[subjectListTable .. "." .. _UPVALUE2_.action]
  return returnCodes.SUCCESS, A0_113, L2_115, L3_116, L4_117
end
function fw.core.subjectList.GetAll()
  local L0_119, L1_120
  L1_120 = fw
  L1_120 = L1_120.core
  L1_120 = L1_120.smtpAlg
  L1_120 = L1_120.statusGet
  cookie, L0_119, L1_120 = nil, nil, L1_120()
  valid = L1_120
  L1_120 = _UPVALUE0_
  if L0_119 ~= L1_120 then
    L1_120 = fwReturnCodes
    L1_120 = L1_120.COMP_FIREWALL_SMTP_DISABLED
    return L1_120, cookie
  end
  L1_120 = db
  L1_120 = L1_120.getTable
  L1_120 = L1_120(subjectListTable, false)
  if L1_120 == _UPVALUE1_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L1_120
end
function fw.core.subjectList.delete(A0_121)
  local L1_122, L2_123, L3_124
  if A0_121 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_122 = db.existsRow(subjectListTable, _UPVALUE1_, A0_121)
  if not L1_122 then
    return returnCodes.COOKIEFAIL
  end
  L3_124 = db.deleteRow(subjectListTable, _UPVALUE1_, A0_121)
  if not L3_124 then
    return returnCodes.FAILURE, A0_121
  end
  return returnCodes.SUCCESS, A0_121
end
function fw.core.subjectList.deleteAll()
  local L0_125
  L0_125 = db.deleteAllRows(subjectListTable)
  if not L0_125 then
    return returnCodes.FAILURE, cookie
  end
  return returnCodes.SUCCESS, cookie
end
function fw.core.subjectList.subjectGet()
  local L0_126, L1_127, L2_128
  L1_127, L0_126 = getFirstCookie(subjectListTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_127 then
    return L1_127
  end
  L2_128 = db.getAttribute(subjectListTable, _UPVALUE0_, L0_126, _UPVALUE1_.subject)
  if L2_128 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_126, L2_128
end
function fw.core.subjectList.subjectGetNext(A0_129)
  local L1_130, L2_131, L3_132
  L2_131, rowId = getNextCookie(subjectListTable, _UPVALUE0_, L1_130)
  if returnCodes.SUCCESS ~= L2_131 then
    return L2_131
  end
  L3_132 = db.getAttribute(subjectListTable, _UPVALUE0_, rowId, _UPVALUE1_.subject)
  if L3_132 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, rowId, L3_132
end
function fw.core.subjectList.subjectSet(A0_133, A1_134)
  local L2_135, L3_136, L4_137
  if A0_133 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_135 = db.existsRow(subjectListTable, _UPVALUE1_, A0_133)
  if not L2_135 then
    return returnCodes.COOKIEFAIL
  end
  L2_135 = fw_textValidation(A1_134)
  if L2_135 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A0_133
  end
  L4_137 = db.setAttribute(subjectListTable, _UPVALUE1_, A0_133, _UPVALUE2_.subject, A1_134)
  if not L4_137 then
    return returnCodes.FAILURE, A0_133
  end
  return returnCodes.SUCCESS, A0_133
end
function fw.core.subjectList.mailIdGet()
  local L0_138, L1_139, L2_140
  L1_139, L0_138 = getFirstCookie(subjectListTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_139 then
    return L1_139
  end
  L2_140 = db.getAttribute(subjectListTable, _UPVALUE0_, L0_138, _UPVALUE1_.mailId)
  if L2_140 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_138, L2_140
end
function fw.core.subjectList.mailIdGetNext(A0_141)
  local L1_142, L2_143, L3_144
  L2_143, rowId = getNextCookie(subjectListTable, _UPVALUE0_, L1_142)
  if returnCodes.SUCCESS ~= L2_143 then
    return L2_143
  end
  L3_144 = db.getAttribute(subjectListTable, _UPVALUE0_, rowId, _UPVALUE1_.mailId)
  if L3_144 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, rowId, L3_144
end
function fw.core.subjectList.mailIdSet(A0_145, A1_146)
  local L2_147, L3_148, L4_149
  if A0_145 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_147 = db.existsRow(subjectListTable, _UPVALUE1_, A0_145)
  if not L2_147 then
    return returnCodes.COOKIEFAIL
  end
  L2_147 = urlValidation(A1_146)
  if not L2_147 then
    return returnCodes.INVALID_ARGUMENT, A0_145
  end
  L4_149 = db.setAttribute(subjectListTable, _UPVALUE1_, A0_145, _UPVALUE2_.mailId, A1_146)
  if not L4_149 then
    return returnCodes.FAILURE, A0_145
  end
  return returnCodes.SUCCESS, A0_145
end
function fw.core.subjectList.actionGet()
  local L0_150, L1_151, L2_152
  L1_151, L0_150 = getFirstCookie(subjectListTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_151 then
    return L1_151
  end
  L2_152 = db.getAttribute(subjectListTable, _UPVALUE0_, L0_150, _UPVALUE1_.action)
  if L2_152 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_150, L2_152
end
function fw.core.subjectList.actionGetNext(A0_153)
  local L1_154, L2_155, L3_156
  L2_155, rowId = getNextCookie(subjectListTable, _UPVALUE0_, L1_154)
  if returnCodes.SUCCESS ~= L2_155 then
    return L2_155
  end
  L3_156 = db.getAttribute(subjectListTable, _UPVALUE0_, rowId, _UPVALUE1_.action)
  if L3_156 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, rowId, L3_156
end
function fw.core.subjectList.actionSet(A0_157, A1_158)
  local L2_159, L3_160, L4_161
  if A0_157 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_159 = db.existsRow(subjectListTable, _UPVALUE1_, A0_157)
  if not L2_159 then
    return returnCodes.COOKIEFAIL
  end
  L2_159 = booleanCheck(A1_158)
  if L2_159 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A0_157
  end
  L4_161 = db.setAttribute(subjectListTable, _UPVALUE1_, A0_157, _UPVALUE2_.action, A1_158)
  if not L4_161 then
    return returnCodes.FAILURE, A0_157
  end
  return returnCodes.SUCCESS, A0_157
end
