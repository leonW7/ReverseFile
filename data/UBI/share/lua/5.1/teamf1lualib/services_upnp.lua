local L0_0
L0_0 = module
L0_0("com.teamf1.core.services.upnp", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/libupnp_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
upnpTable = "upnp"
upnpPortMapTable = "upnpPortMap"
attribute = {}
attribute.key = "_ROWID_"
attribute.keyvalue = "1"
attribute.feature = "upnpEnable"
attribute.interface = "interfaceName"
attribute.advertisementPeriod = "advPeriod"
attribute.timeToLive = "advTimeToLive"
attribute.active = "active"
attribute.ipAddress = "ipAddr"
attribute.protocol = "protocol"
attribute.internalPort = "intPort"
attribute.externalPort = "extPort"
vlanTable = "vlan"
attribute.vlanId = "vlanId"
function isfeatureEnabled()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(upnpTable, attribute.key, attribute.keyvalue, attribute.feature)
  if L0_1 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_1
end
function isfeatureEnabledNext(A0_2)
  return _UPVALUE0_.NOT_SUPPORTED
end
function featureEnable(A0_3)
  if db.setAttribute(upnpTable, attribute.key, attribute.keyvalue, attribute.feature, _UPVALUE0_) == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE, A0_3
  end
  return _UPVALUE1_.SUCCESS, A0_3
end
function featureDisable(A0_4)
  if db.setAttribute(upnpTable, attribute.key, attribute.keyvalue, attribute.feature, _UPVALUE0_) == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE, A0_4
  end
  return _UPVALUE1_.SUCCESS, A0_4
end
function interfaceGet()
  local L0_5
  L0_5 = db
  L0_5 = L0_5.getAttribute
  L0_5 = L0_5(upnpTable, attribute.key, attribute.keyvalue, attribute.interface)
  if L0_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_5
end
function interfaceGetNext(A0_6)
  return _UPVALUE0_.NOT_SUPPORTED
end
function interfaceSet(A0_7, A1_8)
  local L2_9, L3_10, L4_11, L5_12, L6_13
  L6_13 = _UPVALUE0_
  L6_13 = L6_13.NIL
  if A1_8 == L6_13 then
    L6_13 = _UPVALUE0_
    L6_13 = L6_13.INVALID_ARGUMENT
    return L6_13
  end
  L6_13 = A1_8
  L6_13 = string.gsub(L6_13, "bdg", "")
  L5_12 = db.existsRow(vlanTable, attribute.vlanId, L6_13)
  if L5_12 == false then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L3_10, L2_9, L4_11 = isfeatureEnabled()
  if L4_11 == _UPVALUE1_ then
    L5_12 = db.setAttribute(upnpTable, attribute.key, attribute.keyvalue, attribute.interface, A1_8)
  else
    return _UPVALUE0_.FAILURE
  end
  if L5_12 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_7
  end
  return _UPVALUE0_.SUCCESS, A0_7
end
function advertisementPeriodGet()
  local L0_14
  L0_14 = db
  L0_14 = L0_14.getAttribute
  L0_14 = L0_14(upnpTable, attribute.key, attribute.keyvalue, attribute.advertisementPeriod)
  if L0_14 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_14
end
function advertisementPeriodGetNext(A0_15)
  return _UPVALUE0_.NOT_SUPPORTED
end
function advertisementPeriodSet(A0_16, A1_17)
  local L2_18, L3_19, L4_20, L5_21
  if A1_17 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_17) < 1 or tonumber(A1_17) > 86400 then
    return _UPVALUE1_.ADVERTISEMENT_PERIOD_INVALID
  end
  L3_19, L2_18, L4_20 = isfeatureEnabled()
  if L4_20 == _UPVALUE2_ then
    L5_21 = db.setAttribute(upnpTable, attribute.key, attribute.keyvalue, attribute.advertisementPeriod, A1_17)
  else
    return _UPVALUE0_.FAILURE
  end
  if L5_21 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_16
  end
  return _UPVALUE0_.SUCCESS, A0_16
end
function timeToLiveGet()
  local L0_22
  L0_22 = db
  L0_22 = L0_22.getAttribute
  L0_22 = L0_22(upnpTable, attribute.key, attribute.keyvalue, attribute.timeToLive)
  if L0_22 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_22
end
function timeToLiveGetNext(A0_23)
  return _UPVALUE0_.NOT_SUPPORTED
end
function timeToLiveSet(A0_24, A1_25)
  local L2_26, L3_27, L4_28, L5_29
  if A1_25 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_25) < 1 or tonumber(A1_25) > 255 then
    return _UPVALUE1_.ADVERTISEMENT_TIME_TOLIVE_INVALID
  end
  L3_27, L2_26, L4_28 = isfeatureEnabled()
  if L4_28 == _UPVALUE2_ then
    L5_29 = db.setAttribute(upnpTable, attribute.key, attribute.keyvalue, attribute.timeToLive, A1_25)
  else
    return _UPVALUE0_.FAILURE
  end
  if L5_29 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_24
  end
  return _UPVALUE0_.SUCCESS, A0_24
end
function activeGet()
  local L0_30, L1_31
  L0_30 = db
  L0_30 = L0_30.getNextRowId
  L1_31 = "0"
  L0_30 = L0_30(L1_31, upnpPortMapTable)
  L1_31 = db
  L1_31 = L1_31.getAttribute
  L1_31 = L1_31(upnpPortMapTable, attribute.key, L0_30, attribute.active)
  if L1_31 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L1_31
end
function activeGetNext(A0_32)
  local L1_33, L2_34
  L1_33 = _UPVALUE0_
  L1_33 = L1_33.NIL
  if A0_32 ~= L1_33 then
    L1_33 = tonumber
    L2_34 = A0_32
    L1_33 = L1_33(L2_34)
    L2_34 = _UPVALUE0_
    L2_34 = L2_34.NIL
  elseif L1_33 == L2_34 then
    L1_33 = INVALID_ARGUMENT
    return L1_33
  end
  L1_33 = db
  L1_33 = L1_33.existsRow
  L2_34 = upnpPortMapTable
  L1_33 = L1_33(L2_34, attribute.key, A0_32)
  if L1_33 == false then
    L1_33 = INVALID_ARGUMENT
    return L1_33
  end
  L1_33 = db
  L1_33 = L1_33.getNextRowId
  L2_34 = A0_32
  L1_33 = L1_33(L2_34, upnpPortMapTable)
  L2_34 = _UPVALUE0_
  L2_34 = L2_34.NIL
  if L1_33 == L2_34 then
    L2_34 = TABLE_IS_FULL
    return L2_34
  end
  L2_34 = db
  L2_34 = L2_34.getAttribute
  L2_34 = L2_34(upnpTable, attribute.key, L1_33, attribute.active)
  if L2_34 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_33
  end
  return _UPVALUE0_.SUCCESS, L1_33, L2_34
end
function activeSet(A0_35, A1_36)
  return _UPVALUE0_.NOT_SUPPORTED
end
function ipAddressGet()
  local L0_37
  L0_37 = db
  L0_37 = L0_37.getAttribute
  L0_37 = L0_37(upnpPortMapTable, attribute.key, attribute.keyvalue, attribute.ipAddress)
  if L0_37 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_37
end
function ipAddressGetNext(A0_38)
  local L1_39, L2_40, L3_41
  L2_40 = _UPVALUE0_
  L2_40 = L2_40.NIL
  if A0_38 ~= L2_40 then
    L2_40 = tonumber
    L3_41 = A0_38
    L2_40 = L2_40(L3_41)
    L3_41 = _UPVALUE0_
    L3_41 = L3_41.NIL
  elseif L2_40 == L3_41 then
    L2_40 = _UPVALUE0_
    L2_40 = L2_40.INVALID_ARGUMENT
    return L2_40
  end
  L2_40 = db
  L2_40 = L2_40.existsRow
  L3_41 = upnpPortMapTable
  L2_40 = L2_40(L3_41, attribute.key, A0_38)
  if L2_40 == false then
    L2_40 = _UPVALUE0_
    L2_40 = L2_40.INVALID_ARGUMENT
    return L2_40
  end
  L2_40 = db
  L2_40 = L2_40.getNextRowId
  L3_41 = A0_38
  L2_40 = L2_40(L3_41, upnpPortMapTable)
  L3_41 = _UPVALUE0_
  L3_41 = L3_41.NIL
  if L2_40 == L3_41 then
    L3_41 = _UPVALUE0_
    L3_41 = L3_41.TABLE_IS_FULL
    return L3_41
  end
  L3_41 = db
  L3_41 = L3_41.getAttribute
  L3_41 = L3_41(upnpTable, attribute.key, L2_40, attribute.ipAddress)
  if L3_41 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L2_40
  end
  return _UPVALUE0_.SUCCESS, L2_40, L3_41
end
function ipAddressSet(A0_42, A1_43)
  return _UPVALUE0_.NOT_SUPPORTED
end
function ipAddressDelete(A0_44, A1_45)
  return _UPVALUE0_.NOT_SUPPORTED
end
function protocolGet()
  local L0_46
  L0_46 = db
  L0_46 = L0_46.getAttribute
  L0_46 = L0_46(upnpPortMapTable, attribute.key, attribute.keyvalue, attribute.protocol)
  if L0_46 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_46
end
function protocolGetNext(A0_47)
  local L1_48, L2_49, L3_50
  L2_49 = _UPVALUE0_
  L2_49 = L2_49.NIL
  if A0_47 ~= L2_49 then
    L2_49 = tonumber
    L3_50 = A0_47
    L2_49 = L2_49(L3_50)
    L3_50 = _UPVALUE0_
    L3_50 = L3_50.NIL
  elseif L2_49 == L3_50 then
    L2_49 = _UPVALUE0_
    L2_49 = L2_49.INVALID_ARGUMENT
    return L2_49
  end
  L2_49 = db
  L2_49 = L2_49.existsRow
  L3_50 = upnpPortMapTable
  L2_49 = L2_49(L3_50, attribute.key, A0_47)
  if L2_49 == false then
    L2_49 = _UPVALUE0_
    L2_49 = L2_49.INVALID_ARGUMENT
    return L2_49
  end
  L2_49 = db
  L2_49 = L2_49.getNextRowId
  L3_50 = A0_47
  L2_49 = L2_49(L3_50, upnpPortMapTable)
  L3_50 = _UPVALUE0_
  L3_50 = L3_50.NIL
  if L2_49 == L3_50 then
    L3_50 = _UPVALUE0_
    L3_50 = L3_50.TABLE_IS_FULL
    return L3_50
  end
  L3_50 = db
  L3_50 = L3_50.getAttribute
  L3_50 = L3_50(upnpPortMapTable, attribute.key, L2_49, attribute.protocol)
  if L3_50 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L2_49
  end
  return _UPVALUE0_.SUCCESS, L2_49, L3_50
end
function protocolSet(A0_51, A1_52)
  return _UPVALUE0_.NOT_SUPPORTED
end
function internalPortGet()
  local L0_53
  L0_53 = db
  L0_53 = L0_53.getAttribute
  L0_53 = L0_53(upnpPortMapTable, attribute.key, attribute.keyvalue, attribute.internalPort)
  if L0_53 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_53
end
function internalPortGetNext(A0_54)
  local L1_55, L2_56, L3_57
  L2_56 = _UPVALUE0_
  L2_56 = L2_56.NIL
  if A0_54 ~= L2_56 then
    L2_56 = tonumber
    L3_57 = A0_54
    L2_56 = L2_56(L3_57)
    L3_57 = _UPVALUE0_
    L3_57 = L3_57.NIL
  elseif L2_56 == L3_57 then
    L2_56 = _UPVALUE0_
    L2_56 = L2_56.INVALID_ARGUMENT
    return L2_56
  end
  L2_56 = db
  L2_56 = L2_56.existsRow
  L3_57 = upnpPortMapTable
  L2_56 = L2_56(L3_57, attribute.key, A0_54)
  if L2_56 == false then
    L2_56 = _UPVALUE0_
    L2_56 = L2_56.INVALID_ARGUMENT
    return L2_56
  end
  L2_56 = db
  L2_56 = L2_56.getNextRowId
  L3_57 = A0_54
  L2_56 = L2_56(L3_57, upnpPortMapTable)
  L3_57 = _UPVALUE0_
  L3_57 = L3_57.NIL
  if L2_56 == L3_57 then
    L3_57 = _UPVALUE0_
    L3_57 = L3_57.TABLE_IS_FULL
    return L3_57
  end
  L3_57 = db
  L3_57 = L3_57.getAttribute
  L3_57 = L3_57(upnpTable, attribute.key, L2_56, attribute.internalPort)
  if L3_57 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L2_56
  end
  return _UPVALUE0_.SUCCESS, L2_56, L3_57
end
function internalPortSet(A0_58, A1_59)
  return _UPVALUE0_.NOT_SUPPORTED
end
function externalPortGet()
  local L0_60
  L0_60 = db
  L0_60 = L0_60.getAttribute
  L0_60 = L0_60(upnpPortMapTable, attribute.key, attribute.keyvalue, attribute.externalPort)
  if L0_60 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_60
end
function externalPortGetNext(A0_61)
  local L1_62, L2_63, L3_64
  L2_63 = _UPVALUE0_
  L2_63 = L2_63.NIL
  if A0_61 ~= L2_63 then
    L2_63 = tonumber
    L3_64 = A0_61
    L2_63 = L2_63(L3_64)
    L3_64 = _UPVALUE0_
    L3_64 = L3_64.NIL
  elseif L2_63 == L3_64 then
    L2_63 = _UPVALUE0_
    L2_63 = L2_63.INVALID_ARGUMENT
    return L2_63
  end
  L2_63 = db
  L2_63 = L2_63.existsRow
  L3_64 = upnpPortMapTable
  L2_63 = L2_63(L3_64, attribute.key, A0_61)
  if L2_63 == false then
    L2_63 = _UPVALUE0_
    L2_63 = L2_63.INVALID_ARGUMENT
    return L2_63
  end
  L2_63 = db
  L2_63 = L2_63.getNextRowId
  L3_64 = A0_61
  L2_63 = L2_63(L3_64, upnpPortMapTable)
  L3_64 = _UPVALUE0_
  L3_64 = L3_64.NIL
  if L2_63 == L3_64 then
    L3_64 = _UPVALUE0_
    L3_64 = L3_64.TABLE_IS_FULL
    return L3_64
  end
  L3_64 = db
  L3_64 = L3_64.getAttribute
  L3_64 = L3_64(upnpTable, attribute.key, L2_63, attribute.externalPort)
  if L3_64 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L2_63
  end
  return _UPVALUE0_.SUCCESS, L2_63, L3_64
end
function externalPortSet(A0_65, A1_66)
  return _UPVALUE0_.NOT_SUPPORTED
end
function upnpConfigGet()
  local L0_67, L1_68, L2_69, L3_70, L4_71
  L4_71 = {}
  L4_71 = db.getRow(upnpTable, attribute.key, attribute.keyvalue)
  if L4_71 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L0_67 = L4_71[upnpTable .. "." .. attribute.feature]
  L1_68 = L4_71[upnpTable .. "." .. attribute.interface]
  L2_69 = L4_71[upnpTable .. "." .. attribute.advertisementPeriod]
  L3_70 = L4_71[upnpTable .. "." .. attribute.timeToLive]
  if L0_67 == _UPVALUE0_.NIL or L1_68 == _UPVALUE0_.NIL or L2_69 == _UPVALUE0_.NIL or L3_70 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_67, L1_68, L2_69, L3_70
end
function upnpConfigGetNext(A0_72)
  return _UPVALUE0_.NOT_SUPPORTED
end
function upnpConfigSet(A0_73, A1_74, A2_75, A3_76, A4_77)
  local L5_78, L6_79
  L6_79 = {}
  L5_78 = _UPVALUE0_.booleanCheck(A1_74)
  if L5_78 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if A1_74 == _UPVALUE2_ then
    if tonumber(A3_76) < 1 or tonumber(A3_76) > 86400 then
      return _UPVALUE3_.ADVERTISEMENT_PERIOD_INVALID
    end
    if tonumber(A4_77) < 1 or tonumber(A4_77) > 255 then
      return _UPVALUE3_.ADVERTISEMENT_TIME_TOLIVE_INVALID
    end
    L6_79[upnpTable .. "." .. attribute.feature] = A1_74
    L6_79[upnpTable .. "." .. attribute.interface] = A2_75
    L6_79[upnpTable .. "." .. attribute.advertisementPeriod] = A3_76
    L6_79[upnpTable .. "." .. attribute.timeToLive] = A4_77
  else
    L6_79[upnpTable .. "." .. attribute.feature] = A1_74
  end
  if db.update(upnpTable, L6_79, attribute.keyvalue) == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE, A0_73
  end
  return _UPVALUE1_.SUCCESS, A0_73
end
function upnpConfigCreate(A0_80, A1_81, A2_82, A3_83)
  return _UPVALUE0_.NOT_SUPPORTED
end
function upnpConfigDelete(A0_84)
  return _UPVALUE0_.NOT_SUPPORTED
end
function upnpNetworkEntryGet()
  local L0_85, L1_86, L2_87, L3_88, L4_89, L5_90
  L5_90 = {}
  L5_90 = db.getRow(upnpPortMapTable, attribute.key, attribute.keyvalue)
  if L5_90 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L0_85 = L5_90[upnpPortMapTable .. "." .. attribute.ipAddress]
  L1_86 = L5_90[upnpPortMapTable .. "." .. attribute.active]
  L2_87 = L5_90[upnpPortMapTable .. "." .. attribute.protocol]
  L3_88 = L5_90[upnpPortMapTable .. "." .. attribute.internalPort]
  L4_89 = L5_90[upnpPortMapTable .. "." .. attribute.externalPort]
  if L0_85 == _UPVALUE0_.NIL or L1_86 == _UPVALUE0_.NIL or L2_87 == _UPVALUE0_.NIL or L3_88 == _UPVALUE0_.NIL or L4_89 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_85, L1_86, L2_87, L3_88, L4_89
end
function upnpNetworkEntryGetNext(A0_91)
  local L1_92, L2_93, L3_94, L4_95, L5_96, L6_97, L7_98
  L1_92 = _UPVALUE0_
  L1_92 = L1_92.NIL
  if A0_91 ~= L1_92 then
    L1_92 = tonumber
    L2_93 = A0_91
    L1_92 = L1_92(L2_93)
    L2_93 = _UPVALUE0_
    L2_93 = L2_93.NIL
  elseif L1_92 == L2_93 then
    L1_92 = _UPVALUE0_
    L1_92 = L1_92.INVALID_ARGUMENT
    return L1_92
  end
  L1_92 = db
  L1_92 = L1_92.existsRow
  L2_93 = upnpPortMap
  L3_94 = attribute
  L3_94 = L3_94.key
  L4_95 = A0_91
  L1_92 = L1_92(L2_93, L3_94, L4_95)
  if L1_92 == false then
    L1_92 = _UPVALUE0_
    L1_92 = L1_92.INVALID_ARGUMENT
    return L1_92
  end
  L1_92 = db
  L1_92 = L1_92.getNextRowId
  L2_93 = A0_91
  L3_94 = upnpPortMapTable
  L1_92 = L1_92(L2_93, L3_94)
  L2_93 = _UPVALUE0_
  L2_93 = L2_93.NIL
  if L1_92 == L2_93 then
    L2_93 = _UPVALUE0_
    L2_93 = L2_93.TABLE_IS_FULL
    return L2_93
  end
  L2_93 = db
  L2_93 = L2_93.getRow
  L3_94 = upnpPortMapTable
  L4_95 = attribute
  L4_95 = L4_95.key
  L5_96 = L1_92
  L2_93 = L2_93(L3_94, L4_95, L5_96)
  L3_94 = _UPVALUE0_
  L3_94 = L3_94.NIL
  if L2_93 == L3_94 then
    L3_94 = _UPVALUE0_
    L3_94 = L3_94.FAILURE
    return L3_94
  end
  L3_94, L4_95, L5_96, L6_97, L7_98 = nil, nil, nil, nil, nil
  L3_94 = L2_93[upnpPortMapTable .. "." .. attribute.ipAddress]
  L4_95 = L2_93[upnpPortMapTable .. "." .. attribute.active]
  L5_96 = L2_93[upnpPortMapTable .. "." .. attribute.protocol]
  L6_97 = L2_93[upnpPortMapTable .. "." .. attribute.internalPort]
  L7_98 = L2_93[upnpPortMapTable .. "." .. attribute.externalPort]
  if L3_94 == _UPVALUE0_.NIL or L4_95 == _UPVALUE0_.NIL or L5_96 == _UPVALUE0_.NIL or L6_97 == _UPVALUE0_.NIL or L7_98 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_92, L3_94, L4_95, L5_96, L6_97, L7_98
end
function upnpNetworEntrySet(A0_99, A1_100, A2_101, A3_102, A4_103, A5_104)
  return _UPVALUE0_.NOT_SUPPORTED
end
function upnpNetworEntryCreate(A0_105, A1_106, A2_107, A3_108, A4_109)
  return _UPVALUE0_.NOT_SUPPORTED
end
function upnpNetworEntryDelete(A0_110)
  return _UPVALUE0_.NOT_SUPPORTED
end
function upnpPortMapListGet()
  local L0_111
  L0_111 = {}
  L0_111 = db.getTable(upnpPortMapTable)
  if L0_111 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_111
end
function upnpRefreshSet()
  local L0_112
  L0_112 = _UPVALUE0_
  L0_112 = L0_112.NIL
  L0_112 = db.getAttribute("environment", "name", "UPNP_REFRESH_PROGRAM", "value")
  if L0_112 ~= _UPVALUE0_.NIL then
    status = os.execute(L0_112 .. " " .. "/tmp/system.db" .. " > /dev/null")
  end
  return _UPVALUE0_.SUCCESS, 1
end
