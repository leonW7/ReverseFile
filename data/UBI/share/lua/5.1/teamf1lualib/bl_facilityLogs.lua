local L0_0
L0_0 = module
L0_0("com.teamf1.bl.logging.configuration", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/logging_configuration")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.logging.configuration")
function kernelFacilityLogsGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10
  L9_10 = {}
  returnCode, L0_1, L2_3, L1_2, L1_2, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9 = _UPVALUE0_.kernelFacilityLogBitmapGet()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, L0_1, L2_3, L1_2, L1_2, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9
end
function systemFacilityLogsGet()
  local L0_11, L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19
  returnCode, L0_11, L2_13, L1_12, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19 = _UPVALUE0_.systemFacilityLogBitmapGet()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, L0_11, L2_13, L1_12, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19
end
function utmFacilityLogsGet()
  local L0_20, L1_21, L2_22, L3_23, L4_24, L5_25, L6_26, L7_27, L8_28
  returnCode, L0_20, L2_22, L1_21, L3_23, L4_24, L5_25, L6_26, L7_27, L8_28 = _UPVALUE0_.utmFacilityLogBitmapGet()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, L0_20, L2_22, L1_21, L3_23, L4_24, L5_25, L6_26, L7_27, L8_28
end
function wirelessFacilityLogsGet()
  local L0_29, L1_30, L2_31, L3_32, L4_33, L5_34, L6_35, L7_36, L8_37
  returnCode, L0_29, L2_31, L1_30, L3_32, L4_33, L5_34, L6_35, L7_36, L8_37 = _UPVALUE0_.wirelessFacilityLogBitmapGet()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, L0_29, L2_31, L1_30, L3_32, L4_33, L5_34, L6_35, L7_36, L8_37
end
function networkFacilityLogsGet()
  local L0_38, L1_39, L2_40, L3_41, L4_42, L5_43, L6_44, L7_45, L8_46, L9_47
  L9_47 = {}
  returnCode, L0_38, L2_40, L1_39, L3_41, L4_42, L5_43, L6_44, L7_45, L8_46 = _UPVALUE0_.networkFacilityLogBitmapGet()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, L0_38, L2_40, L1_39, L3_41, L4_42, L5_43, L6_44, L7_45, L8_46
end
function vpnFacilityLogsGet()
  local L0_48, L1_49, L2_50, L3_51, L4_52, L5_53, L6_54, L7_55, L8_56, L9_57
  L9_57 = {}
  returnCode, L0_48, L2_50, L1_49, L3_51, L4_52, L5_53, L6_54, L7_55, L8_56 = _UPVALUE0_.vpnFacilityLogBitmapGet()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, L0_48, L2_50, L1_49, L3_51, L4_52, L5_53, L6_54, L7_55, L8_56
end
function wcfFacilityLogsGet()
  local L0_58, L1_59, L2_60, L3_61, L4_62, L5_63, L6_64, L7_65, L8_66, L9_67
  L9_67 = {}
  returnCode, L0_58, L2_60, L1_59, L3_61, L4_62, L5_63, L6_64, L7_65, L8_66 = _UPVALUE0_.wcfFacilityLogBitmapGet()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, L0_58, L2_60, L1_59, L3_61, L4_62, L5_63, L6_64, L7_65, L8_66
end
function firewallFacilityLogsGet()
  local L0_68, L1_69, L2_70, L3_71, L4_72, L5_73, L6_74, L7_75, L8_76, L9_77
  L9_77 = {}
  returnCode, L0_68, L2_70, L1_69, L3_71, L4_72, L5_73, L6_74, L7_75, L8_76 = _UPVALUE0_.firewallFacilityLogBitmapGet()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, L0_68, L2_70, L1_69, L3_71, L4_72, L5_73, L6_74, L7_75, L8_76
end
function kernelLogSet(A0_78)
  local L1_79, L2_80, L3_81, L4_82, L5_83, L6_84, L7_85, L8_86, L9_87
  L1_79 = ACCESS_LEVEL
  if L1_79 ~= 0 then
    L1_79 = util
    L1_79 = L1_79.appendDebugOut
    L2_80 = "Detected unauthorized access for facilityLogs"
    L1_79(L2_80)
    L1_79 = _UPVALUE0_
    L1_79 = L1_79.UNAUTHORIZED
    return L1_79
  end
  L1_79 = A0_78["facilityLogs.cookie"]
  L2_80 = A0_78["facilityLogs.emergency"]
  L3_81 = A0_78["facilityLogs.alert"]
  L4_82 = A0_78["facilityLogs.critical"]
  L5_83 = A0_78["facilityLogs.error"]
  L6_84 = A0_78["facilityLogs.warning"]
  L7_85 = A0_78["facilityLogs.notice"]
  L8_86 = A0_78["facilityLogs.information"]
  L9_87 = A0_78["facilityLogs.debug"]
  if L1_79 == nil then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L2_80 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L3_81 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L4_82 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L5_83 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L6_84 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L7_85 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L8_86 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L9_87 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.kernelFacilityLogsSet(L1_79, L2_80, L3_81, L4_82, L5_83, L6_84, L7_85, L8_86, L9_87)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in facilityLogs" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
function systemLogSet(A0_88)
  local L1_89, L2_90, L3_91, L4_92, L5_93, L6_94, L7_95, L8_96, L9_97
  L1_89 = ACCESS_LEVEL
  if L1_89 ~= 0 then
    L1_89 = util
    L1_89 = L1_89.appendDebugOut
    L2_90 = "Detected unauthorized access for facilityLogs "
    L1_89(L2_90)
    L1_89 = _UPVALUE0_
    L1_89 = L1_89.UNAUTHORIZED
    return L1_89
  end
  L1_89 = A0_88["facilityLogs.cookie"]
  L2_90 = A0_88["facilityLogs.emergency"]
  L3_91 = A0_88["facilityLogs.alert"]
  L4_92 = A0_88["facilityLogs.critical"]
  L5_93 = A0_88["facilityLogs.error"]
  L6_94 = A0_88["facilityLogs.warning"]
  L7_95 = A0_88["facilityLogs.notice"]
  L8_96 = A0_88["facilityLogs.information"]
  L9_97 = A0_88["facilityLogs.debug"]
  if L1_89 == nil then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L2_90 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L3_91 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L4_92 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L5_93 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L6_94 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L7_95 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L8_96 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L9_97 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.systemFacilityLogsSet(L1_89, L2_90, L3_91, L4_92, L5_93, L6_94, L7_95, L8_96, L9_97)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in facilityLogs" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
function utmLogSet(A0_98)
  local L1_99, L2_100, L3_101, L4_102, L5_103, L6_104, L7_105, L8_106, L9_107
  L1_99 = ACCESS_LEVEL
  if L1_99 ~= 0 then
    L1_99 = util
    L1_99 = L1_99.appendDebugOut
    L2_100 = "Detected unauthorized access for facilityLogs "
    L1_99(L2_100)
    L1_99 = _UPVALUE0_
    L1_99 = L1_99.UNAUTHORIZED
    return L1_99
  end
  L1_99 = A0_98["facilityLogs.cookie"]
  L2_100 = A0_98["facilityLogs.emergency"]
  L3_101 = A0_98["facilityLogs.alert"]
  L4_102 = A0_98["facilityLogs.critical"]
  L5_103 = A0_98["facilityLogs.error"]
  L6_104 = A0_98["facilityLogs.warning"]
  L7_105 = A0_98["facilityLogs.notice"]
  L8_106 = A0_98["facilityLogs.information"]
  L9_107 = A0_98["facilityLogs.debug"]
  if L1_99 == nil then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L2_100 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L3_101 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L4_102 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L5_103 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L6_104 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L7_105 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L8_106 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L9_107 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.utmFacilityLogsSet(L1_99, L2_100, L3_101, L4_102, L5_103, L6_104, L7_105, L8_106, L9_107)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in facilityLogs" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
function wirelessLogSet(A0_108)
  local L1_109, L2_110, L3_111, L4_112, L5_113, L6_114, L7_115, L8_116, L9_117
  L1_109 = ACCESS_LEVEL
  if L1_109 ~= 0 then
    L1_109 = util
    L1_109 = L1_109.appendDebugOut
    L2_110 = "Detected unauthorized access for facilityLogs "
    L1_109(L2_110)
    L1_109 = _UPVALUE0_
    L1_109 = L1_109.UNAUTHORIZED
    return L1_109
  end
  L1_109 = A0_108["facilityLogs.cookie"]
  L2_110 = A0_108["facilityLogs.emergency"]
  L3_111 = A0_108["facilityLogs.alert"]
  L4_112 = A0_108["facilityLogs.critical"]
  L5_113 = A0_108["facilityLogs.error"]
  L6_114 = A0_108["facilityLogs.warning"]
  L7_115 = A0_108["facilityLogs.notice"]
  L8_116 = A0_108["facilityLogs.information"]
  L9_117 = A0_108["facilityLogs.debug"]
  if L1_109 == nil then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L2_110 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L3_111 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L4_112 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L5_113 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L6_114 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L7_115 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L8_116 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L9_117 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.wirelessFacilityLogsSet(L1_109, L2_110, L3_111, L4_112, L5_113, L6_114, L7_115, L8_116, L9_117)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in facilityLogs" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
function networkLogSet(A0_118)
  local L1_119, L2_120, L3_121, L4_122, L5_123, L6_124, L7_125, L8_126, L9_127
  L1_119 = ACCESS_LEVEL
  if L1_119 ~= 0 then
    L1_119 = util
    L1_119 = L1_119.appendDebugOut
    L2_120 = "Detected unauthorized access for facilityLogs "
    L1_119(L2_120)
    L1_119 = _UPVALUE0_
    L1_119 = L1_119.UNAUTHORIZED
    return L1_119
  end
  L1_119 = A0_118["facilityLogs.cookie"]
  L2_120 = A0_118["facilityLogs.emergency"]
  L3_121 = A0_118["facilityLogs.alert"]
  L4_122 = A0_118["facilityLogs.critical"]
  L5_123 = A0_118["facilityLogs.error"]
  L6_124 = A0_118["facilityLogs.warning"]
  L7_125 = A0_118["facilityLogs.notice"]
  L8_126 = A0_118["facilityLogs.information"]
  L9_127 = A0_118["facilityLogs.debug"]
  if L1_119 == nil then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L2_120 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L3_121 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L4_122 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L5_123 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L6_124 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L7_125 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L8_126 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L9_127 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.networkFacilityLogsSet(L1_119, L2_120, L3_121, L4_122, L5_123, L6_124, L7_125, L8_126, L9_127)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in facilityLogs" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
function vpnLogSet(A0_128)
  local L1_129, L2_130, L3_131, L4_132, L5_133, L6_134, L7_135, L8_136, L9_137
  L1_129 = ACCESS_LEVEL
  if L1_129 ~= 0 then
    L1_129 = util
    L1_129 = L1_129.appendDebugOut
    L2_130 = "Detected unauthorized access for facilityLogs "
    L1_129(L2_130)
    L1_129 = _UPVALUE0_
    L1_129 = L1_129.UNAUTHORIZED
    return L1_129
  end
  L1_129 = A0_128["facilityLogs.cookie"]
  L2_130 = A0_128["facilityLogs.emergency"]
  L3_131 = A0_128["facilityLogs.alert"]
  L4_132 = A0_128["facilityLogs.critical"]
  L5_133 = A0_128["facilityLogs.error"]
  L6_134 = A0_128["facilityLogs.warning"]
  L7_135 = A0_128["facilityLogs.notice"]
  L8_136 = A0_128["facilityLogs.information"]
  L9_137 = A0_128["facilityLogs.debug"]
  if L1_129 == nil then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L2_130 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L3_131 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L4_132 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L5_133 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L6_134 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L7_135 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L8_136 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L9_137 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.vpnFacilityLogsSet(L1_129, L2_130, L3_131, L4_132, L5_133, L6_134, L7_135, L8_136, L9_137)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in facilityLogs" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
function wcfLogSet(A0_138)
  local L1_139, L2_140, L3_141, L4_142, L5_143, L6_144, L7_145, L8_146, L9_147
  L1_139 = ACCESS_LEVEL
  if L1_139 ~= 0 then
    L1_139 = util
    L1_139 = L1_139.appendDebugOut
    L2_140 = "Detected unauthorized access for facilityLogs "
    L1_139(L2_140)
    L1_139 = _UPVALUE0_
    L1_139 = L1_139.UNAUTHORIZED
    return L1_139
  end
  L1_139 = A0_138["facilityLogs.cookie"]
  L2_140 = A0_138["facilityLogs.emergency"]
  L3_141 = A0_138["facilityLogs.alert"]
  L4_142 = A0_138["facilityLogs.critical"]
  L5_143 = A0_138["facilityLogs.error"]
  L6_144 = A0_138["facilityLogs.warning"]
  L7_145 = A0_138["facilityLogs.notice"]
  L8_146 = A0_138["facilityLogs.information"]
  L9_147 = A0_138["facilityLogs.debug"]
  if L1_139 == nil then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L2_140 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L3_141 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L4_142 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L5_143 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L6_144 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L7_145 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L8_146 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L9_147 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.wcfFacilityLogsSet(L1_139, L2_140, L3_141, L4_142, L5_143, L6_144, L7_145, L8_146, L9_147)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in facilityLogs" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
function firewallLogSet(A0_148)
  local L1_149, L2_150, L3_151, L4_152, L5_153, L6_154, L7_155, L8_156, L9_157
  L1_149 = ACCESS_LEVEL
  if L1_149 ~= 0 then
    L1_149 = util
    L1_149 = L1_149.appendDebugOut
    L2_150 = "Detected unauthorized access for facilityLogs "
    L1_149(L2_150)
    L1_149 = _UPVALUE0_
    L1_149 = L1_149.UNAUTHORIZED
    return L1_149
  end
  L1_149 = A0_148["facilityLogs.cookie"]
  L2_150 = A0_148["facilityLogs.emergency"]
  L3_151 = A0_148["facilityLogs.alert"]
  L4_152 = A0_148["facilityLogs.critical"]
  L5_153 = A0_148["facilityLogs.error"]
  L6_154 = A0_148["facilityLogs.warning"]
  L7_155 = A0_148["facilityLogs.notice"]
  L8_156 = A0_148["facilityLogs.information"]
  L9_157 = A0_148["facilityLogs.debug"]
  if L1_149 == nil then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L2_150 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L3_151 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L4_152 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L5_153 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L6_154 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L7_155 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L8_156 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L9_157 == nil then
    util.appendDebugOut("Set : Invalid log status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.firewallFacilityLogsSet(L1_149, L2_150, L3_151, L4_152, L5_153, L6_154, L7_155, L8_156, L9_157)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in facilityLogs" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
function facilityLogsGet(A0_158)
  local L1_159, L2_160, L3_161, L4_162, L5_163, L6_164, L7_165, L8_166, L9_167, L10_168
  L1_159 = _UPVALUE0_
  L1_159 = L1_159.FAILURE
  L2_160, L3_161, L4_162, L5_163, L6_164, L7_165, L8_166, L9_167, L10_168 = nil, nil, nil, nil, nil, nil, nil, nil, nil
  if A0_158 == nil then
    return _UPVALUE0_.BAD_PARAMETER
  end
  if A0_158 == "0" then
    L1_159, L2_160, L4_162, L3_161, L5_163, L6_164, L7_165, L8_166, L9_167, L10_168 = kernelFacilityLogsGet()
  elseif A0_158 == "3" then
    L1_159, L2_160, L4_162, L3_161, L5_163, L6_164, L7_165, L8_166, L9_167, L10_168 = systemFacilityLogsGet()
  elseif A0_158 == "16" then
    L1_159, L2_160, L4_162, L3_161, L5_163, L6_164, L7_165, L8_166, L9_167, L10_168 = wirelessFacilityLogsGet()
  elseif A0_158 == "18" then
    L1_159, L2_160, L4_162, L3_161, L5_163, L6_164, L7_165, L8_166, L9_167, L10_168 = networkFacilityLogsGet()
  elseif A0_158 == "19" then
    L1_159, L2_160, L4_162, L3_161, L5_163, L6_164, L7_165, L8_166, L9_167, L10_168 = vpnFacilityLogsGet()
  elseif A0_158 == "20" then
    L1_159, L2_160, L4_162, L3_161, L5_163, L6_164, L7_165, L8_166, L9_167, L10_168 = wcfFacilityLogsGet()
  elseif A0_158 == "21" then
    L1_159, L2_160, L4_162, L3_161, L5_163, L6_164, L7_165, L8_166, L9_167, L10_168 = firewallFacilityLogsGet()
  end
  if returnCode ~= _UPVALUE0_.SUCCESS then
    return returnCode
  end
  return returnCode, L2_160, L4_162, L3_161, L5_163, L6_164, L7_165, L8_166, L9_167, L10_168
end
function facilityLogsSet(A0_169)
  local L1_170, L2_171
  L1_170 = _UPVALUE0_
  L1_170 = L1_170.FAILURE
  L2_171 = nil
  if A0_169 == nil then
    return _UPVALUE0_.BAD_PARAMETER
  end
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected unauthorized access for facilityLogs ")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_169["facilityLogs.facility"] == "0" then
    A0_169["facilityLogs.cookie"] = "0"
    L1_170, L2_171 = kernelLogSet(A0_169)
  elseif A0_169["facilityLogs.facility"] == "3" then
    A0_169["facilityLogs.cookie"] = "3"
    L1_170, L2_171 = systemLogSet(A0_169)
  elseif A0_169["facilityLogs.facility"] == "18" then
    A0_169["facilityLogs.cookie"] = "18"
    L1_170, L2_171 = networkLogSet(A0_169)
  elseif A0_169["facilityLogs.facility"] == "19" then
    A0_169["facilityLogs.cookie"] = "19"
    L1_170, L2_171 = vpnLogSet(A0_169)
  elseif A0_169["facilityLogs.facility"] == "20" then
    A0_169["facilityLogs.cookie"] = "20"
    L1_170, L2_171 = wcfLogSet(A0_169)
  elseif A0_169["facilityLogs.facility"] == "21" then
    A0_169["facilityLogs.cookie"] = "21"
    L1_170, L2_171 = firewallLogSet(A0_169)
  elseif A0_169["facilityLogs.facility"] == "16" then
    A0_169["facilityLogs.cookie"] = "16"
    L1_170, L2_171 = wirelessLogSet(A0_169)
  end
  if L1_170 ~= _UPVALUE0_.SUCCESS then
    return L1_170
  end
  L1_170 = _UPVALUE1_.logDaemonStartStopHandler()
  if L1_170 ~= _UPVALUE0_.SUCCESS then
    return L1_170
  end
  return L1_170, cookie
end
