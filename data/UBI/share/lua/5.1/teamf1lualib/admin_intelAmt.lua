local L0_0
L0_0 = module
L0_0("com.teamf1.core.admin.intelamt", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/intelAmt_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
ENABLE = "1"
DISABLE = "0"
ADDRESS_ANY = "0"
ADDRESS_SPECIFIC = "1"
intelamtTable = "IntelAmt"
intelamtStartTable = "IntelAmtStart"
intelamtPortTable = "IntelAmtPorts"
attribute = {}
attribute.key = "_ROWID_"
attribute.keyvalue = "1"
attribute.feature = "Status"
attribute.wanHostType = "AddressType"
attribute.wanHostAddresses = "ExternalIpStr"
attribute.lanServerIpAddress = "LocalServerIp"
attribute.reflector = "enable"
attribute.destinationPort = "destPort"
attribute.sourcePort = "srcPort"
attribute.activeReflectorOnPort = "enable"
PORT16992 = "16992"
PORT16993 = "16993"
PORT16994 = "16994"
PORT16995 = "16995"
PORT9971 = "9971"
function isfeatureEnabled()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(intelamtTable, attribute.key, attribute.keyvalue, attribute.feature)
  if L0_1 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_1
end
function isfeatureEnabledNext(A0_2)
  local L2_3, L3_4
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.NOT_SUPPORTED
  L3_4 = rowId
  return L2_3, L3_4, feature
end
function featureEnable(A0_5)
  if db.setAttribute(intelamtTable, attribute.key, attribute.keyvalue, attribute.feature, ENABLE) == nil then
    return _UPVALUE0_.FAILURE, A0_5
  end
  return _UPVALUE0_.SUCCESS, A0_5
end
function featureDisable(A0_6)
  if db.setAttribute(intelamtTable, attribute.key, attribute.keyvalue, attribute.feature, DISABLE) == nil then
    return _UPVALUE0_.FAILURE, A0_6
  end
  return _UPVALUE0_.SUCCESS, A0_6
end
function wanHostTypeGet()
  local L0_7, L1_8, L2_9, L3_10
  L1_8, L0_7, L2_9 = isfeatureEnabled()
  if L2_9 == ENABLE then
    L3_10 = db.getAttribute(intelamtTable, attribute.key, attribute.keyvalue, attribute.wanHostType)
  else
    return _UPVALUE0_.FAILURE
  end
  if L3_10 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L3_10
end
function wanHostTypeGetNext(A0_11)
  local L2_12, L3_13
  L2_12 = _UPVALUE0_
  L2_12 = L2_12.NOT_SUPPORTED
  L3_13 = rowId
  return L2_12, L3_13, wanHostType
end
function wanHostTypeSet(A0_14, A1_15)
  local L2_16, L3_17, L4_18, L5_19
  if A1_15 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_15 ~= ADDRESS_ANY and A1_15 ~= ADDRESS_SPECIFIC then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L3_17, L2_16, L5_19 = isfeatureEnabled()
  if L5_19 == ENABLE then
    L4_18 = db.setAttribute(intelamtTable, attribute.key, attribute.keyvalue, attribute.wanHostType, A1_15)
  else
    return _UPVALUE0_.FAILURE
  end
  if L4_18 == nil then
    return _UPVALUE0_.FAILURE, A0_14
  end
  return _UPVALUE0_.SUCCESS, A0_14
end
function wanHostAddressesGet()
  local L0_20, L1_21, L2_22, L3_23, L4_24
  L2_22, L1_21, L3_23 = isfeatureEnabled()
  if L3_23 == ENABLE then
    L2_22, L1_21, L4_24 = wanHostTypeGet()
    if L4_24 == ADDRESS_SPECIFIC then
      L0_20 = db.getAttribute(intelamtTable, attribute.key, attribute.keyvalue, attribute.wanHostAddresses)
    else
      return _UPVALUE0_.FAILURE
    end
  else
    return _UPVALUE0_.FAILURE
  end
  if L0_20 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_20
end
function wanHostAddressesGetNext(A0_25)
  local L2_26, L3_27
  L2_26 = _UPVALUE0_
  L2_26 = L2_26.NOT_SUPPORTED
  L3_27 = rowId
  return L2_26, L3_27, wanHostAddresses
end
function wanHostAddressesSet(A0_28, A1_29)
  local L2_30, L3_31, L4_32, L5_33
  if A1_29 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_30, msg = _UPVALUE1_.ipAddressCheck("2", A1_29)
  if L2_30 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE2_.OPTION_HOST_ADDRESS_INVALID
  end
  L3_31, L2_30, L4_32 = isfeatureEnabled()
  if L4_32 == ENABLE then
    L3_31, L2_30, L5_33 = wanHostTypeGet()
    if L5_33 == ADDRESS_SPECIFIC then
      status = db.setAttribute(intelamtTable, attribute.key, attribute.keyvalue, attribute.wanHostAddresses, A1_29)
    else
      return _UPVALUE0_.FAILURE
    end
  else
    return _UPVALUE0_.FAILURE
  end
  if status == nil then
    return _UPVALUE0_.FAILURE, A0_28
  end
  return _UPVALUE0_.SUCCESS, A0_28
end
function lanServerIpAddressGet()
  local L0_34, L1_35, L2_36, L3_37, L4_38
  L1_35, L0_34, L2_36 = isfeatureEnabled()
  if L2_36 == ENABLE then
    L1_35, L0_34, L3_37 = wanHostTypeGet()
    if L3_37 == ADDRESS_ANY or L3_37 == ADDRESS_SPECIFIC then
      L4_38 = db.getAttribute(intelamtTable, attribute.key, attribute.keyvalue, attribute.lanServerIpAddress)
    else
      return _UPVALUE0_.FAILURE
    end
  else
    return _UPVALUE0_.FAILURE
  end
  if L4_38 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L4_38
end
function lanServerIpAddressGetNext(A0_39)
  local L2_40, L3_41
  L2_40 = _UPVALUE0_
  L2_40 = L2_40.NOT_SUPPORTED
  L3_41 = rowId
  return L2_40, L3_41, lanServerIpAddress
end
function lanServerIpAddressSet(A0_42, A1_43)
  local L2_44, L3_45, L4_46, L5_47, L6_48
  if A1_43 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_44, msg = _UPVALUE1_.ipAddressCheck("2", A1_43)
  if L2_44 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE2_.LAN_SERVER_ADDRESS_INVALID
  end
  L3_45, L2_44, L4_46 = isfeatureEnabled()
  if L4_46 == ENABLE then
    L3_45, L2_44, L5_47 = wanHostTypeGet()
    if L5_47 ~= ADDRESS_ANY or L5_47 ~= ADDRESS_SPECIFIC then
      L6_48 = db.setAttribute(intelamtTable, attribute.key, attribute.keyvalue, attribute.lanServerIpAddress, A1_43)
    else
      return _UPVALUE0_.FAILURE
    end
  else
    return _UPVALUE0_.FAILURE
  end
  if L6_48 == nil then
    return _UPVALUE0_.FAILURE, A0_42
  end
  return _UPVALUE0_.SUCCESS, A0_42
end
function isreflectorEnabled()
  local L0_49
  L0_49 = db
  L0_49 = L0_49.getAttribute
  L0_49 = L0_49(intelamtStartTable, attribute.key, attribute.keyvalue, attribute.reflector)
  if L0_49 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_49
end
function isreflectorEnabledNext(A0_50)
  local L2_51, L3_52
  L2_51 = _UPVALUE0_
  L2_51 = L2_51.NOT_SUPPORTED
  L3_52 = rowId
  return L2_51, L3_52, reflector
end
function reflectorEnable(A0_53)
  if db.setAttribute(intelamtStartTable, attribute.key, attribute.keyvalue, attribute.reflector, ENABLE) == nil then
    return _UPVALUE0_.FAILURE, A0_53
  end
  return _UPVALUE0_.SUCCESS, A0_53
end
function reflectorDisable(A0_54)
  if db.setAttribute(intelamtStartTable, attribute.key, attribute.keyvalue, attribute.reflector, DISABLE) == nil then
    return _UPVALUE0_.FAILURE, A0_54
  end
  return _UPVALUE0_.SUCCESS, A0_54
end
function destinationPortGet()
  local L0_55, L1_56, L2_57, L3_58, L4_59
  L1_56, L0_55, L3_58 = isreflectorEnabled()
  if L3_58 == ENABLE then
    L1_56, L0_55, L4_59 = isActiveReflectorOnPortEnabled()
    if L4_59 == ENABLE then
      L2_57 = db.getAttribute(intelamtPortTable, attribute.key, attribute.keyvalue, attribute.destinationPort)
    else
      return _UPVALUE0_.FAILURE
    end
  else
    return _UPVALUE0_.FAILURE
  end
  if L2_57 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L2_57
end
function destinationPortGetNext(A0_60)
  local L1_61, L2_62, L3_63, L4_64, L5_65, L6_66
  if A0_60 ~= nil then
    L6_66 = tonumber
    L6_66 = L6_66(A0_60)
  elseif L6_66 == nil then
    L6_66 = _UPVALUE0_
    L6_66 = L6_66.INVALID_ARGUMENT
    return L6_66
  end
  L6_66 = db
  L6_66 = L6_66.existsRow
  L6_66 = L6_66(intelamtPortTable, attribute.key, A0_60)
  if L6_66 == false then
    L6_66 = _UPVALUE0_
    L6_66 = L6_66.INVALID_ARGUMENT
    return L6_66
  end
  L6_66 = db
  L6_66 = L6_66.getNextRowId
  L6_66 = L6_66(A0_60, intelamtPortTable)
  if L6_66 == nil then
    return _UPVALUE0_.TABLE_IS_FULL
  end
  L2_62, L1_61, L4_64 = isreflectorEnabled()
  if L4_64 == ENABLE then
    L2_62, L1_61, L5_65 = isActiveReflectorOnPortEnabled()
    if L5_65 == ENABLE then
      L3_63 = db.getAttribute(intelamtPortTable, attribute.key, L6_66, attribute.destinationPort)
    else
      return _UPVALUE0_.FAILURE
    end
  else
    return _UPVALUE0_.FAILURE
  end
  if L3_63 == nil then
    return _UPVALUE0_.FAILURE, L6_66
  end
  return _UPVALUE0_.SUCCESS, L6_66, L3_63
end
function destinationPortSet(A0_67, A1_68)
  local L3_69
  L3_69 = _UPVALUE0_
  L3_69 = L3_69.NOT_SUPPORTED
  return L3_69, A0_67
end
function destinationPortDelete(A0_70, A1_71)
  local L3_72
  L3_72 = _UPVALUE0_
  L3_72 = L3_72.NOT_SUPPORTED
  return L3_72, A0_70
end
function sourcePortGet()
  local L0_73, L1_74, L2_75, L3_76, L4_77
  L1_74, L0_73, L3_76 = isreflectorEnabled()
  if L3_76 == ENABLE then
    L1_74, L0_73, L4_77 = isActiveReflectorOnPortEnabled()
    if L4_77 == ENABLE then
      L2_75 = db.getAttribute(intelamtPortTable, attribute.key, attribute.keyvalue, attribute.sourcePort)
    else
      return _UPVALUE0_.FAILURE
    end
  else
    return _UPVALUE0_.FAILURE
  end
  if L2_75 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L2_75
end
function sourcePortGetNext(A0_78)
  local L1_79, L2_80, L3_81, L4_82, L5_83, L6_84
  if A0_78 ~= nil then
    L6_84 = tonumber
    L6_84 = L6_84(A0_78)
  elseif L6_84 == nil then
    L6_84 = _UPVALUE0_
    L6_84 = L6_84.INVALID_ARGUMENT
    return L6_84
  end
  L6_84 = db
  L6_84 = L6_84.existsRow
  L6_84 = L6_84(intelamtPortTable, attribute.key, A0_78)
  if L6_84 == false then
    L6_84 = _UPVALUE0_
    L6_84 = L6_84.INVALID_ARGUMENT
    return L6_84
  end
  L6_84 = db
  L6_84 = L6_84.getNextRowId
  L6_84 = L6_84(A0_78, intelamtPortTable)
  if L6_84 == nil then
    return _UPVALUE0_.TABLE_IS_FULL
  end
  L2_80, L1_79, L4_82 = isreflectorEnabled()
  if L4_82 == ENABLE then
    L2_80, L1_79, L5_83 = isActiveReflectorOnPortEnabled()
    if L5_83 == ENABLE then
      L3_81 = db.getAttribute(intelamtPortTable, attribute.key, L6_84, attribute.sourcePort)
    else
      return _UPVALUE0_.FAILURE
    end
  else
    return _UPVALUE0_.FAILURE
  end
  if L3_81 == nil then
    return _UPVALUE0_.FAILURE, L6_84
  end
  return _UPVALUE0_.SUCCESS, L6_84, L3_81
end
function sourcePortSet(A0_85, A1_86)
  local L2_87, L3_88, L4_89, L5_90, L6_91
  if A0_85 == nil or tonumber(A0_85) == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(intelamtPortTable, attribute.key, A0_85) == false then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_86 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_86) < 1 or tonumber(A1_86) > 65535 then
    return _UPVALUE1_.SRC_PORT_INVALID
  end
  L3_88, L2_87, L4_89 = isreflectorEnabled()
  if L4_89 == ENABLE then
    L3_88, L2_87, L5_90 = isActiveReflectorOnPortEnabled()
    if L5_90 == ENABLE then
      L6_91 = db.setAttribute(intelamtPortTable, attribute.key, A0_85, attribute.sourcePort, A1_86)
    else
      return _UPVALUE0_.FAILURE
    end
  else
    return _UPVALUE0_.FAILURE
  end
  if L6_91 == nil then
    return _UPVALUE0_.FAILURE, A0_85
  end
  return _UPVALUE0_.SUCCESS, A0_85
end
function isActiveReflectorOnPortEnabled()
  local L0_92
  L0_92 = db
  L0_92 = L0_92.getAttribute
  L0_92 = L0_92(intelamtPortTable, attribute.key, attribute.keyvalue, attribute.activeReflectorOnPort)
  if L0_92 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_92
end
function isActiveReflectorOnPortEnabledNext(A0_93)
  local L1_94, L2_95
  if A0_93 ~= nil then
    L1_94 = tonumber
    L2_95 = A0_93
    L1_94 = L1_94(L2_95)
  elseif L1_94 == nil then
    L1_94 = _UPVALUE0_
    L1_94 = L1_94.INVALID_ARGUMENT
    return L1_94
  end
  L1_94 = db
  L1_94 = L1_94.getNextRowId
  L2_95 = A0_93
  L1_94 = L1_94(L2_95, intelamtPortTable)
  if L1_94 == nil then
    L2_95 = _UPVALUE0_
    L2_95 = L2_95.TABLE_IS_FULL
    return L2_95
  end
  L2_95 = db
  L2_95 = L2_95.getAttribute
  L2_95 = L2_95(intelamtPortTable, attribute.key, L1_94, attribute.activeReflectorOnPort)
  if L2_95 == nil then
    return _UPVALUE0_.FAILURE, L1_94
  end
  return _UPVALUE0_.SUCCESS, L1_94, L2_95
end
function activeReflectorOnPortEnable(A0_96)
  local L1_97, L2_98, L3_99, L4_100
  if A0_96 == nil or tonumber(A0_96) == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(intelamtPortTable, attribute.key, A0_96) == false then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_98, L1_97, L3_99 = isreflectorEnabled()
  if L3_99 == ENABLE then
    L4_100 = db.setAttribute(intelamtPortTable, attribute.key, A0_96, attribute.activeReflectorOnPort, ENABLE)
  else
    return _UPVALUE0_.FAILURE
  end
  if L4_100 == nil then
    return _UPVALUE0_.FAILURE, A0_96
  end
  return _UPVALUE0_.SUCCESS, A0_96
end
function activeReflectorOnPortDisable(A0_101)
  local L1_102, L2_103, L3_104, L4_105
  if A0_101 == nil or tonumber(A0_101) == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(intelamtPortTable, attribute.key, A0_101) == false then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_103, L1_102, L3_104 = isreflectorEnabled()
  if L3_104 == ENABLE then
    L4_105 = db.setAttribute(intelamtPortTable, attribute.key, A0_101, attribute.activeReflectorOnPort, DISABLE)
  else
    return _UPVALUE0_.FAILURE
  end
  if L4_105 == nil then
    return _UPVALUE0_.FAILURE, A0_101
  end
  return _UPVALUE0_.SUCCESS, A0_101
end
function intelAmtSetupGet()
  local L0_106, L1_107, L2_108, L3_109, L4_110, L5_111, L6_112
  L3_109 = {}
  L4_110 = db
  L4_110 = L4_110.getRow
  L5_111 = intelamtTable
  L6_112 = attribute
  L6_112 = L6_112.key
  L4_110 = L4_110(L5_111, L6_112, attribute.keyvalue)
  L3_109 = L4_110
  if L3_109 == nil then
    L4_110 = _UPVALUE0_
    L4_110 = L4_110.FAILURE
    return L4_110
  end
  L4_110, L5_111, L6_112 = nil, nil, nil
  L1_107, L0_106, L2_108 = isfeatureEnabled()
  if L2_108 == ENABLE then
    L4_110 = L3_109[intelamtTable .. "." .. attribute.wanHostType]
    L5_111 = L3_109[intelamtTable .. "." .. attribute.wanHostAddresses]
    L6_112 = L3_109[intelamtTable .. "." .. attribute.lanServerIpAddress]
  else
    return _UPVALUE0_.FAILURE
  end
  if L4_110 == nil or L5_111 == nil or L6_112 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L4_110, L5_111, L6_112
end
function intelAmtSetupGetNext(A0_113)
  local L2_114, L3_115
  L2_114 = _UPVALUE0_
  L2_114 = L2_114.NOT_SUPPORTED
  L3_115 = rowId
  return L2_114, L3_115, intelAmtSetup
end
function intelAmtSetupSet(A0_116, A1_117, A2_118, A3_119)
  local L4_120, L5_121, L6_122, L7_123
  if A1_117 == nil then
    L7_123 = _UPVALUE0_
    L7_123 = L7_123.INVALID_ARGUMENT
    return L7_123
  end
  L7_123 = ADDRESS_ANY
  if A1_117 ~= L7_123 then
    L7_123 = ADDRESS_SPECIFIC
    if A1_117 ~= L7_123 then
      L7_123 = _UPVALUE0_
      L7_123 = L7_123.INVALID_ARGUMENT
      return L7_123
    end
  end
  if A2_118 == nil then
    L7_123 = _UPVALUE0_
    L7_123 = L7_123.INVALID_ARGUMENT
    return L7_123
  end
  if A3_119 == nil then
    L7_123 = _UPVALUE0_
    L7_123 = L7_123.INVALID_ARGUMENT
    return L7_123
  end
  L7_123 = _UPVALUE1_
  L7_123 = L7_123.ipAddressCheck
  msg, L7_123 = "2", L7_123("2", A3_119)
  L4_120 = L7_123
  L7_123 = _UPVALUE0_
  L7_123 = L7_123.SUCCESS
  if L4_120 ~= L7_123 then
    L7_123 = _UPVALUE2_
    L7_123 = L7_123.LAN_SERVER_ADDRESS_INVALID
    return L7_123
  end
  L7_123 = {}
  L5_121, L4_120, L6_122 = isfeatureEnabled()
  if L6_122 == ENABLE then
    L7_123[intelamtTable .. "." .. attribute.wanHostType] = nil
    if nil == ADDRESS_SPECIFIC then
      L7_123[intelamtTable .. "." .. attribute.wanHostAddresses] = nil
    end
    L7_123[intelamtTable .. "." .. attribute.lanServerIpAddress] = nil
  else
    return _UPVALUE0_.FAILURE
  end
  if db.update(intelamtTable, L7_123, attribute.keyvalue) == nil then
    return _UPVALUE0_.FAILURE, A0_116
  end
  return _UPVALUE0_.SUCCESS, A0_116
end
function intelAmtSetupCreate(A0_124, A1_125, A2_126)
  local L4_127
  L4_127 = _UPVALUE0_
  L4_127 = L4_127.NOT_SUPPORTED
  return L4_127, rowid
end
function intelAmtSetupDelete(A0_128)
  local L2_129
  L2_129 = _UPVALUE0_
  L2_129 = L2_129.NOT_SUPPORTED
  return L2_129, A0_128
end
function intelAmtReflectorSetupGet()
  local L0_130, L1_131, L2_132, L3_133, L4_134, L5_135, L6_136, L7_137
  L3_133 = {}
  L4_134 = db
  L4_134 = L4_134.getNextRowId
  L5_135 = "0"
  L6_136 = intelamtPortTable
  L4_134 = L4_134(L5_135, L6_136)
  L5_135 = db
  L5_135 = L5_135.getRow
  L6_136 = intelamtPortTable
  L7_137 = attribute
  L7_137 = L7_137.key
  L5_135 = L5_135(L6_136, L7_137, L4_134)
  L3_133 = L5_135
  if L3_133 == nil then
    L5_135 = _UPVALUE0_
    L5_135 = L5_135.FAILURE
    return L5_135
  end
  L5_135, L6_136, L7_137 = nil, nil, nil
  L1_131, L0_130, L2_132 = isreflectorEnabled()
  if L2_132 == ENABLE then
    L5_135 = L3_133[intelamtPortTable .. "." .. attribute.activeReflectorOnPort]
    L6_136 = L3_133[intelamtPortTable .. "." .. attribute.destinationPort]
    L7_137 = L3_133[intelamtPortTable .. "." .. attribute.sourcePort]
  else
    return _UPVALUE0_.FAILURE
  end
  if L5_135 == nil or L6_136 == nil or L7_137 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L6_136, L7_137, L5_135
end
function intelAmtReflectorSetupGetNext(A0_138)
  local L1_139, L2_140, L3_141, L4_142, L5_143, L6_144, L7_145
  if A0_138 ~= nil then
    L4_142 = tonumber
    L5_143 = A0_138
    L4_142 = L4_142(L5_143)
  elseif L4_142 == nil then
    L4_142 = _UPVALUE0_
    L4_142 = L4_142.INVALID_ARGUMENT
    return L4_142
  end
  L4_142 = db
  L4_142 = L4_142.getNextRowId
  L5_143 = A0_138
  L6_144 = intelamtPortTable
  L4_142 = L4_142(L5_143, L6_144)
  if L4_142 == nil then
    L5_143 = _UPVALUE0_
    L5_143 = L5_143.TABLE_IS_FULL
    return L5_143
  end
  L5_143, L6_144, L7_145 = nil, nil, nil
  if db.getRow(intelamtPortTable, attribute.key, L4_142) == nil then
    return _UPVALUE0_.FAILURE
  end
  L2_140, L1_139, L3_141 = isreflectorEnabled()
  if L3_141 == ENABLE then
    L5_143 = db.getRow(intelamtPortTable, attribute.key, L4_142)[intelamtPortTable .. "." .. attribute.activeReflectorOnPort]
    L6_144 = db.getRow(intelamtPortTable, attribute.key, L4_142)[intelamtPortTable .. "." .. attribute.destinationPort]
    L7_145 = db.getRow(intelamtPortTable, attribute.key, L4_142)[intelamtPortTable .. "." .. attribute.sourcePort]
  else
    return _UPVALUE0_.FAILURE
  end
  if L5_143 == nil or L6_144 == nil or L7_145 == nil then
    return _UPVALUE0_.FAILURE, A0_138
  end
  return _UPVALUE0_.SUCCESS, L4_142, L5_143, L6_144, L7_145
end
function intelAmtReflectorSetupSet(A0_146, A1_147, A2_148)
  local L3_149, L4_150, L5_151, L6_152, L7_153, L8_154, L9_155
  if A0_146 ~= nil then
    L8_154 = tonumber
    L9_155 = A0_146
    L8_154 = L8_154(L9_155)
  elseif L8_154 == nil then
    L8_154 = _UPVALUE0_
    L8_154 = L8_154.INVALID_ARGUMENT
    return L8_154
  end
  if A1_147 == nil then
    L8_154 = _UPVALUE0_
    L8_154 = L8_154.INVALID_ARGUMENT
    return L8_154
  end
  L8_154 = tonumber
  L9_155 = A1_147
  L8_154 = L8_154(L9_155)
  if L8_154 < 1 or L8_154 > 65535 then
    L9_155 = _UPVALUE1_
    L9_155 = L9_155.SRC_PORT_INVALID
    return L9_155
  end
  if A2_148 == nil then
    L9_155 = _UPVALUE0_
    L9_155 = L9_155.INVALID_ARGUMENT
    return L9_155
  end
  L9_155 = _UPVALUE2_
  L9_155 = L9_155.isBoolean
  L9_155 = L9_155(A2_148)
  L3_149 = L9_155
  L9_155 = _UPVALUE0_
  L9_155 = L9_155.SUCCESS
  if L3_149 ~= L9_155 then
    L9_155 = _UPVALUE0_
    L9_155 = L9_155.INVALID_ARGUMENT
    return L9_155
  end
  L9_155 = {}
  L4_150, L3_149, L5_151 = isreflectorEnabled()
  if L5_151 == ENABLE then
    L9_155[intelamtPortTable .. "." .. attribute.activeReflectorOnPort] = A2_148
    L4_150, L3_149, L6_152 = isActiveReflectorOnPortEnabled()
    if L6_152 == ENABLE then
      L9_155[intelamtPortTable .. "." .. attribute.sourcePort] = A1_147
    end
  else
    return _UPVALUE0_.FAILURE
  end
  L7_153 = db.update(intelamtPortTable, L9_155, A0_146)
  if L7_153 == nil then
    return _UPVALUE0_.FAILURE, A0_146
  end
  return _UPVALUE0_.SUCCESS, A0_146
end
function intelAmtReflectorSetupCreate(A0_156, A1_157, A2_158)
  local L4_159
  L4_159 = _UPVALUE0_
  L4_159 = L4_159.NOT_SUPPORTED
  return L4_159, rowid
end
function intelAmtReflectorSetupDelete(A0_160)
  local L2_161
  L2_161 = _UPVALUE0_
  L2_161 = L2_161.NOT_SUPPORTED
  return L2_161, A0_160
end
function intelAmtSetupGetAll()
  local L0_162, L1_163, L2_164, L3_165, L4_166, L5_167, L6_168
  L3_165 = {}
  L4_166 = db
  L4_166 = L4_166.getRow
  L5_167 = intelamtTable
  L6_168 = attribute
  L6_168 = L6_168.key
  L4_166 = L4_166(L5_167, L6_168, attribute.keyvalue)
  L3_165 = L4_166
  if L3_165 == nil then
    L4_166 = _UPVALUE0_
    L4_166 = L4_166.FAILURE
    return L4_166
  end
  L4_166, L5_167, L6_168 = nil, nil, nil
  L1_163, L0_162, L2_164 = isfeatureEnabled()
  if L2_164 == ENABLE then
    L4_166 = L3_165[intelamtTable .. "." .. attribute.wanHostType]
    L5_167 = L3_165[intelamtTable .. "." .. attribute.wanHostAddresses]
    L6_168 = L3_165[intelamtTable .. "." .. attribute.lanServerIpAddress]
  end
  return _UPVALUE0_.SUCCESS, 1, L2_164, L4_166, L5_167, L6_168
end
function intelAmtReflectorGetAll()
  local L0_169
  L0_169 = db
  L0_169 = L0_169.getAttribute
  L0_169 = L0_169(intelamtStartTable, attribute.key, attribute.keyvalue, attribute.reflector)
  port16992Status = db.getRow(intelamtPortTable, attribute.destinationPort, PORT16992)[intelamtPortTable .. "." .. attribute.activeReflectorOnPort]
  srcPort16992 = db.getRow(intelamtPortTable, attribute.destinationPort, PORT16992)[intelamtPortTable .. "." .. attribute.sourcePort]
  port16993Status = db.getRow(intelamtPortTable, attribute.destinationPort, PORT16993)[intelamtPortTable .. "." .. attribute.activeReflectorOnPort]
  srcPort16993 = db.getRow(intelamtPortTable, attribute.destinationPort, PORT16993)[intelamtPortTable .. "." .. attribute.sourcePort]
  port16994Status = db.getRow(intelamtPortTable, attribute.destinationPort, PORT16994)[intelamtPortTable .. "." .. attribute.activeReflectorOnPort]
  srcPort16994 = db.getRow(intelamtPortTable, attribute.destinationPort, PORT16994)[intelamtPortTable .. "." .. attribute.sourcePort]
  port16995Status = db.getRow(intelamtPortTable, attribute.destinationPort, PORT16995)[intelamtPortTable .. "." .. attribute.activeReflectorOnPort]
  srcPort16995 = db.getRow(intelamtPortTable, attribute.destinationPort, PORT16995)[intelamtPortTable .. "." .. attribute.sourcePort]
  port9971Status = db.getRow(intelamtPortTable, attribute.destinationPort, PORT9971)[intelamtPortTable .. "." .. attribute.activeReflectorOnPort]
  srcPort9971 = db.getRow(intelamtPortTable, attribute.destinationPort, PORT9971)[intelamtPortTable .. "." .. attribute.sourcePort]
  if L0_169 == _UPVALUE0_.NIL or port16992Status == _UPVALUE0_.NIL or srcPort16992 == _UPVALUE0_.NIL or port16993Status == _UPVALUE0_.NIL or srcPort16993 == _UPVALUE0_.NIL or port16994Status == _UPVALUE0_.NIL or srcPort16994 == _UPVALUE0_.NIL or port16995Status == _UPVALUE0_.NIL or srcPort16995 == _UPVALUE0_.NIL or port9971Status == _UPVALUE0_.NIL or srcPort9971 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_169, port16992Status, srcPort16992, port16993Status, srcPort16993, port16994Status, srcPort16994, port16995Status, srcPort16995, port9971Status, srcPort9971
end
function intelAmtReflectorSetAll(A0_170)
  local L1_171, L2_172
  L1_171 = A0_170["intelAmt.reflector"]
  if L1_171 == "1" then
    L2_172 = A0_170["intelAmt.redirectToPort16992"]
    if L2_172 ~= "1" then
      L2_172 = A0_170["intelAmt.redirectToPort16993"]
      if L2_172 ~= "1" then
        L2_172 = A0_170["intelAmt.redirectToPort16994"]
        if L2_172 ~= "1" then
          L2_172 = A0_170["intelAmt.redirectToPort16995"]
          if L2_172 ~= "1" then
            L2_172 = A0_170["intelAmt.redirectToPort9971"]
          end
        end
      end
    else
      if L2_172 == "1" then
        L2_172 = "1"
        isEnable = L2_172
    end
    else
      L2_172 = "0"
      isEnable = L2_172
      L2_172 = _UPVALUE0_
      L2_172 = L2_172.FAILURE
      return L2_172
    end
    L2_172 = {}
    rowid1 = db.getAttribute(intelamtPortTable, attribute.destinationPort, PORT16992, attribute.key)
    L2_172["IntelAmtPorts.enable"] = A0_170["intelAmt.redirectToPort16992"]
    L2_172["IntelAmtPorts.srcPort"] = A0_170["intelAmt.listenOnPort16992"]
    if tonumber(L2_172["IntelAmtPorts.srcPort"]) ~= _UPVALUE0_.NIL and (tonumber(L2_172["IntelAmtPorts.srcPort"]) < 1 or tonumber(L2_172["IntelAmtPorts.srcPort"]) > 65535) then
      return _UPVALUE1_.SRC_PORT_16992_INVALID
    end
    L1_171 = db.update(intelamtPortTable, L2_172, rowid1)
    rowid2 = db.getAttribute(intelamtPortTable, attribute.destinationPort, PORT16993, attribute.key)
    L2_172["IntelAmtPorts.enable"] = A0_170["intelAmt.redirectToPort16993"]
    L2_172["IntelAmtPorts.srcPort"] = A0_170["intelAmt.listenOnPort16993"]
    if tonumber(L2_172["IntelAmtPorts.srcPort"]) ~= _UPVALUE0_.NIL and (tonumber(L2_172["IntelAmtPorts.srcPort"]) < 1 or tonumber(L2_172["IntelAmtPorts.srcPort"]) > 65535) then
      return _UPVALUE1_.SRC_PORT_16993_INVALID
    end
    L1_171 = db.update(intelamtPortTable, L2_172, rowid2)
    rowid3 = db.getAttribute(intelamtPortTable, attribute.destinationPort, PORT16994, attribute.key)
    L2_172["IntelAmtPorts.enable"] = A0_170["intelAmt.redirectToPort16994"]
    L2_172["IntelAmtPorts.srcPort"] = A0_170["intelAmt.listenOnPort16994"]
    if tonumber(L2_172["IntelAmtPorts.srcPort"]) ~= _UPVALUE0_.NIL and (tonumber(L2_172["IntelAmtPorts.srcPort"]) < 1 or tonumber(L2_172["IntelAmtPorts.srcPort"]) > 65535) then
      return _UPVALUE1_.SRC_PORT_16994_INVALID
    end
    L1_171 = db.update(intelamtPortTable, L2_172, rowid3)
    rowid4 = db.getAttribute(intelamtPortTable, attribute.destinationPort, PORT16995, attribute.key)
    L2_172["IntelAmtPorts.enable"] = A0_170["intelAmt.redirectToPort16995"]
    L2_172["IntelAmtPorts.srcPort"] = A0_170["intelAmt.listenOnPort16995"]
    if tonumber(L2_172["IntelAmtPorts.srcPort"]) ~= _UPVALUE0_.NIL and (tonumber(L2_172["IntelAmtPorts.srcPort"]) < 1 or tonumber(L2_172["IntelAmtPorts.srcPort"]) > 65535) then
      return _UPVALUE1_.SRC_PORT_16995_INVALID
    end
    L1_171 = db.update(intelamtPortTable, L2_172, rowid4)
    rowid5 = db.getAttribute(intelamtPortTable, attribute.destinationPort, PORT9971, attribute.key)
    L2_172["IntelAmtPorts.enable"] = A0_170["intelAmt.redirectToPort9971"]
    L2_172["IntelAmtPorts.srcPort"] = A0_170["intelAmt.listenOnPort9971"]
    if tonumber(L2_172["IntelAmtPorts.srcPort"]) ~= _UPVALUE0_.NIL and (tonumber(L2_172["IntelAmtPorts.srcPort"]) < 1 or tonumber(L2_172["IntelAmtPorts.srcPort"]) > 65535) then
      return _UPVALUE1_.SRC_PORT_9971_INVALID
    end
    L1_171 = db.update(intelamtPortTable, L2_172, rowid5)
    L1_171 = db.setAttribute(intelamtStartTable, attribute.key, attribute.keyvalue, attribute.reflector, ENABLE)
  else
    L2_172 = db
    L2_172 = L2_172.setAttribute
    L2_172 = L2_172(intelamtStartTable, attribute.key, attribute.keyvalue, attribute.reflector, DISABLE)
    L1_171 = L2_172
  end
  L2_172 = _UPVALUE0_
  L2_172 = L2_172.NIL
  if L1_171 == L2_172 then
    L2_172 = _UPVALUE0_
    L2_172 = L2_172.FALURE
    return L2_172
  end
  L2_172 = _UPVALUE0_
  L2_172 = L2_172.SUCCESS
  return L2_172, 1
end
function intelAmtSetupSetAll(A0_173, A1_174, A2_175, A3_176)
  if A0_173 == "1" and A1_174 == "1" and A2_175 == "" then
    return _UPVALUE0_.OPTION_HOST_ADDRESS_INVALID
  end
  if A0_173 == "1" and A3_176 == "" then
    return _UPVALUE0_.LAN_SERVER_ADDRESS_INVALID
  end
  if A0_173 == "0" then
    status = db.setAttribute(intelamtTable, attribute.key, attribute.keyvalue, attribute.feature, A0_173)
  else
    tempTable = {}
    tempTable[intelamtTable .. "." .. attribute.feature] = A0_173
    tempTable[intelamtTable .. "." .. attribute.wanHostType] = A1_174
    tempTable[intelamtTable .. "." .. attribute.wanHostAddresses] = A2_175
    tempTable[intelamtTable .. "." .. attribute.lanServerIpAddress] = A3_176
    status = db.update(intelamtTable, tempTable, attribute.keyvalue)
  end
  if status == _UPVALUE1_.NIL then
    return _UPVALUE1_.FALURE
  end
  return _UPVALUE1_.SUCCESS, 1
end
