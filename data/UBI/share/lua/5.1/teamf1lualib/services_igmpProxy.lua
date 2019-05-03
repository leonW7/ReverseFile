local L0_0
L0_0 = module
L0_0("com.teamf1.core.services.igmpproxy", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/igmp_returnCodes")
L0_0 = require
L0_0("teamf1lualib/igmp")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.igmp_returnCodes")
ENABLE = "1"
DISABLE = "0"
PPTP = "pptp"
L2TP = "l2tp"
igmpproxyTable = "Igmp"
nimfConfTable = "nimfConf"
wanModeTable = "WanMode"
pptpTable = "pptp"
l2tpTable = "l2tp"
allowedNetworksTable = "allowedNets"
WAN1 = "WAN1"
WAN2 = "WAN2"
attribute = {}
attribute.key = "_ROWID_"
attribute.keyvalue = "1"
attribute.feature = "IgmpEnable"
attribute.networkAddress = "networkAddr"
attribute.maskLength = "maskLength"
attribute.interface = "igmpLogicalIfName"
attribute.logicalIfName = "LogicalIfName"
attribute.interfaceWAN1 = "upstreamInterfaceWAN1"
attribute.interfaceWAN2 = "upstreamInterfaceWAN2"
attribute.wanMode = "Wanmode"
attribute.connectionTypePri = "connectionTypePri"
attribute.connectionTypeSec = "connectionTypeSec"
attribute.dualAccessPri = "dualAccessPri"
attribute.dualAccessSec = "dualAccessSec"
attribute.failPriLogicalIfName = "FailoverPriLogicalIfName"
attribute.failSecLogicalIfName = "FailoverSecLogicalIfName"
attribute.dedicatedLogicalIfName = "DedicatedLogicalIfName"
attribute.connType = "ConnectionType"
attribute.dualAccess = "DualAccess"
attribute.pptp = "pptp"
attribute.l2tp = "l2tp"
function isfeatureEnabled()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(igmpproxyTable, attribute.key, attribute.keyvalue, attribute.feature)
  if L0_1 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_1
end
function isfeatureEnabledNext(A0_2)
  return _UPVALUE0_.NOT_SUPPORTED
end
function featureEnable(A0_3, A1_4, A2_5, A3_6)
  local L4_7
  L4_7 = {}
  L4_7[igmpproxyTable .. "." .. attribute.feature] = A1_4
  L4_7[igmpproxyTable .. "." .. attribute.interfaceWAN1] = A2_5
  L4_7[igmpproxyTable .. "." .. attribute.interfaceWAN2] = A3_6
  if db.update(igmpproxyTable, L4_7, A0_3) == nil then
    return _UPVALUE0_.FAILURE, A0_3
  end
  return _UPVALUE0_.SUCCESS, A0_3
end
function featureDisable(A0_8)
  if db.setAttribute(igmpproxyTable, attribute.key, attribute.keyvalue, attribute.feature, DISABLE) == nil then
    return _UPVALUE0_.FAILURE, A0_8
  end
  return _UPVALUE0_.SUCCESS, A0_8
end
function networkAddressGet()
  local L0_9, L1_10
  L0_9 = db
  L0_9 = L0_9.getNextRowId
  L1_10 = "0"
  L0_9 = L0_9(L1_10, allowedNetworksTable)
  L1_10 = db
  L1_10 = L1_10.getAttribute
  L1_10 = L1_10(allowedNetworksTable, attribute.key, L0_9, attribute.networkAddress)
  if L1_10 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L1_10
end
function networkAddressGetNext(A0_11)
  local L1_12, L2_13
  if A0_11 ~= nil then
    L1_12 = tonumber
    L2_13 = A0_11
    L1_12 = L1_12(L2_13)
  elseif L1_12 == nil then
    L1_12 = _UPVALUE0_
    L1_12 = L1_12.INVALID_ARGUMENT
    return L1_12
  end
  L1_12 = db
  L1_12 = L1_12.existsRow
  L2_13 = allowedNetworksTable
  L1_12 = L1_12(L2_13, attribute.key, A0_11)
  if L1_12 == false then
    L1_12 = _UPVALUE0_
    L1_12 = L1_12.INVALID_ARGUMENT
    return L1_12
  end
  L1_12 = db
  L1_12 = L1_12.getNextRowId
  L2_13 = A0_11
  L1_12 = L1_12(L2_13, allowedNetworksTable)
  if L1_12 == nil then
    L2_13 = _UPVALUE0_
    L2_13 = L2_13.TABLE_IS_FULL
    return L2_13
  end
  L2_13 = db
  L2_13 = L2_13.getAttribute
  L2_13 = L2_13(allowedNetworksTable, attribute.key, L1_12, attribute.networkAddress)
  if L2_13 == nil then
    return _UPVALUE0_.FAILURE, L1_12
  end
  return _UPVALUE0_.SUCCESS, L1_12, L2_13
end
function networkAddressSet(A0_14, A1_15)
  local L2_16, L3_17, L4_18, L5_19
  if A0_14 == nil or tonumber(A0_14) == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(allowedNetworksTable, attribute.key, A0_14) == false then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_15 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L5_19 = _UPVALUE1_.ipv4Check(A1_15)
  if L5_19 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_16, L5_19, L3_17 = isfeatureEnabled()
  if L3_17 == ENABLE then
    L4_18 = db.setAttribute(allowedNetworksTable, attribute.key, A0_14, attribute.networkAddress, A1_15)
  else
    return _UPVALUE0_.FAILURE
  end
  if L4_18 == false then
    return _UPVALUE0_.FAILURE, A0_14
  end
  return _UPVALUE0_.SUCCESS, A0_14
end
function networkAddressDelete(A0_20, A1_21)
  local L3_22
  L3_22 = _UPVALUE0_
  L3_22 = L3_22.NOT_SUPPORTED
  return L3_22, A0_20
end
function maskLengthGet()
  local L0_23, L1_24
  L0_23 = db
  L0_23 = L0_23.getNextRowId
  L1_24 = "0"
  L0_23 = L0_23(L1_24, allowedNetworksTable)
  L1_24 = db
  L1_24 = L1_24.getAttribute
  L1_24 = L1_24(allowedNetworksTable, attribute.key, L0_23, attribute.maskLength)
  if L1_24 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L1_24
end
function maskLengthGetNext(A0_25)
  local L1_26, L2_27
  if A0_25 ~= nil then
    L1_26 = tonumber
    L2_27 = A0_25
    L1_26 = L1_26(L2_27)
  elseif L1_26 == nil then
    L1_26 = _UPVALUE0_
    L1_26 = L1_26.INVALID_ARGUMENT
    return L1_26
  end
  L1_26 = db
  L1_26 = L1_26.existsRow
  L2_27 = allowedNetworksTable
  L1_26 = L1_26(L2_27, attribute.key, A0_25)
  if L1_26 == false then
    L1_26 = _UPVALUE0_
    L1_26 = L1_26.INVALID_ARGUMENT
    return L1_26
  end
  L1_26 = db
  L1_26 = L1_26.getNextRowId
  L2_27 = A0_25
  L1_26 = L1_26(L2_27, allowedNetworksTable)
  if L1_26 == nil then
    L2_27 = _UPVALUE0_
    L2_27 = L2_27.TABLE_IS_FULL
    return L2_27
  end
  L2_27 = db
  L2_27 = L2_27.getAttribute
  L2_27 = L2_27(allowedNetworksTable, attribute.key, L1_26, attribute.maskLength)
  if L2_27 == nil then
    return _UPVALUE0_.FAILURE, L1_26
  end
  return _UPVALUE0_.SUCCESS, L1_26, L2_27
end
function maskLengthSet(A0_28, A1_29)
  local L2_30, L3_31, L4_32
  if A0_28 == nil or tonumber(A0_28) == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(allowedNetworksTable, attribute.key, A0_28) == false then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_29 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_29) > 32 or tonumber(A1_29) < 0 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L4_32, L2_30, featureEnabled = isfeatureEnabled()
  if featureEnabled == ENABLE then
    L3_31 = db.setAttribute(allowedNetworksTable, attribute.key, A0_28, attribute.maskLength, A1_29)
  else
    return _UPVALUE0_.FAILURE
  end
  if L3_31 == nil then
    return _UPVALUE0_.FAILURE, A0_28
  end
  return _UPVALUE0_.SUCCESS, A0_28
end
function interfaceGet()
  local L0_33
  L0_33 = db
  L0_33 = L0_33.getAttribute
  L0_33 = L0_33(igmpproxyTable, attribute.key, attribute.keyvalue, attribute.interface)
  if L0_33 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_33
end
function interfaceGetNext(A0_34)
  return _UPVALUE0_.NOT_SUPPORTED
end
function interfaceSet(A0_35, A1_36)
  return _UPVALUE0_.NOT_SUPPORTED
end
function igmpEntryGet(A0_37)
  local L1_38, L2_39, L3_40, L4_41, L5_42
  L1_38 = {}
  L2_39 = {}
  L3_40 = db
  L3_40 = L3_40.getRow
  L4_41 = allowedNetworksTable
  L5_42 = attribute
  L5_42 = L5_42.key
  L3_40 = L3_40(L4_41, L5_42, A0_37)
  L1_38 = L3_40
  if L1_38 == nil then
    L3_40 = _UPVALUE0_
    L3_40 = L3_40.FAILURE
    return L3_40
  end
  L3_40 = db
  L3_40 = L3_40.getRow
  L4_41 = igmpproxyTable
  L5_42 = attribute
  L5_42 = L5_42.key
  L3_40 = L3_40(L4_41, L5_42, attribute.keyvalue)
  L2_39 = L3_40
  if L2_39 == nil then
    L3_40 = _UPVALUE0_
    L3_40 = L3_40.FAILURE
    return L3_40
  end
  L3_40, L4_41, L5_42 = nil, nil, nil
  L3_40 = L1_38[allowedNetworksTable .. "." .. attribute.networkAddress]
  L4_41 = L1_38[allowedNetworksTable .. "." .. attribute.maskLength]
  L5_42 = L2_39[igmpproxyTable .. "." .. attribute.interface]
  if L3_40 == nil or L4_41 == nil or L5_42 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L3_40, L4_41, L5_42
end
function igmpEntryGetNext(A0_43)
  local L1_44, L2_45, L3_46, L4_47, L5_48, L6_49
  if A0_43 ~= nil then
    L1_44 = tonumber
    L2_45 = A0_43
    L1_44 = L1_44(L2_45)
  elseif L1_44 == nil then
    L1_44 = _UPVALUE0_
    L1_44 = L1_44.INVALID_ARGUMENT
    return L1_44
  end
  L1_44 = db
  L1_44 = L1_44.existsRow
  L2_45 = allowedNetworksTable
  L3_46 = attribute
  L3_46 = L3_46.key
  L4_47 = A0_43
  L1_44 = L1_44(L2_45, L3_46, L4_47)
  if L1_44 == false then
    L1_44 = _UPVALUE0_
    L1_44 = L1_44.INVALID_ARGUMENT
    return L1_44
  end
  L1_44 = db
  L1_44 = L1_44.getNextRowId
  L2_45 = A0_43
  L3_46 = allowedNetworksTable
  L1_44 = L1_44(L2_45, L3_46)
  if L1_44 == nil then
    L2_45 = _UPVALUE0_
    L2_45 = L2_45.TABLE_IS_FULL
    return L2_45
  end
  L2_45 = db
  L2_45 = L2_45.getRow
  L3_46 = allowedNetworksTable
  L4_47 = attribute
  L4_47 = L4_47.key
  L5_48 = L1_44
  L2_45 = L2_45(L3_46, L4_47, L5_48)
  if L2_45 == nil then
    L3_46 = _UPVALUE0_
    L3_46 = L3_46.FAILURE
    return L3_46
  end
  L3_46 = db
  L3_46 = L3_46.getRow
  L4_47 = igmpproxyTable
  L5_48 = attribute
  L5_48 = L5_48.key
  L6_49 = attribute
  L6_49 = L6_49.keyvalue
  L3_46 = L3_46(L4_47, L5_48, L6_49)
  if L3_46 == nil then
    L4_47 = _UPVALUE0_
    L4_47 = L4_47.FAILURE
    return L4_47
  end
  L4_47, L5_48, L6_49 = nil, nil, nil
  L4_47 = L2_45[allowedNetworksTable .. "." .. attribute.networkAddress]
  L5_48 = L2_45[allowedNetworksTable .. "." .. attribute.maskLength]
  L6_49 = L3_46[igmpproxyTable .. "." .. attribute.interface]
  if L4_47 == nil or L5_48 == nil or L6_49 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_44, L4_47, L5_48, L6_49
end
function igmpEntrySet(A0_50, A1_51, A2_52)
  local L3_53, L4_54, L5_55
  if A0_50 ~= nil then
    L5_55 = tonumber
    L5_55 = L5_55(A0_50)
  elseif L5_55 == nil then
    L5_55 = _UPVALUE0_
    L5_55 = L5_55.INVALID_ARGUMENT
    return L5_55
  end
  if A1_51 == nil then
    L5_55 = _UPVALUE1_
    L5_55 = L5_55.COMP_IGMP_PROXY_NETWORK_ADDRESS_NIL
    return L5_55
  end
  L5_55 = _UPVALUE2_
  L5_55 = L5_55.ipv4Check
  L5_55 = L5_55(A1_51)
  L3_53 = L5_55
  L5_55 = _UPVALUE0_
  L5_55 = L5_55.SUCCESS
  if L3_53 ~= L5_55 then
    L5_55 = _UPVALUE1_
    L5_55 = L5_55.COMP_IGMP_PROXY_NETWORK_ADDRESS_NIL
    return L5_55
  end
  if A2_52 == nil then
    L5_55 = _UPVALUE1_
    L5_55 = L5_55.COMP_IGMP_PROXY_NETWORK_MASK_NIL
    return L5_55
  end
  L5_55 = {}
  L5_55[allowedNetworksTable .. "." .. attribute.networkAddress] = A1_51
  L5_55[allowedNetworksTable .. "." .. attribute.maskLength] = A2_52
  L4_54 = db.update(allowedNetworksTable, L5_55, A0_50)
  if L4_54 == nil then
    return _UPVALUE0_.FAILURE, A0_50
  end
  return _UPVALUE0_.SUCCESS, A0_50
end
function igmpEntryCreate(A0_56, A1_57)
  local L2_58, L3_59, L4_60, L5_61, L6_62
  if A0_56 == nil then
    L5_61 = _UPVALUE0_
    L5_61 = L5_61.COMP_IGMP_PROXY_NETWORK_ADDRESS_NIL
    return L5_61
  end
  L5_61 = _UPVALUE1_
  L5_61 = L5_61.ipv4Check
  L6_62 = A0_56
  L5_61 = L5_61(L6_62)
  L2_58 = L5_61
  L5_61 = _UPVALUE2_
  L5_61 = L5_61.SUCCESS
  if L2_58 ~= L5_61 then
    L5_61 = _UPVALUE0_
    L5_61 = L5_61.COMP_IGMP_PROXY_NETWORK_ADDRESS_INVALID
    return L5_61
  end
  if A1_57 == nil then
    L5_61 = _UPVALUE0_
    L5_61 = L5_61.COMP_IGMP_PROXY_NETWORK_MASK_NIL
    return L5_61
  end
  L5_61 = {}
  L6_62 = allowedNetworksTable
  L6_62 = L6_62 .. "." .. attribute.networkAddress
  L5_61[L6_62] = A0_56
  L6_62 = allowedNetworksTable
  L6_62 = L6_62 .. "." .. attribute.maskLength
  L5_61[L6_62] = A1_57
  L6_62 = nil
  L6_62 = db.insert(allowedNetworksTable, L5_61)
  if L6_62 == nil then
    return _UPVALUE2_.FAILURE, rowId
  end
  return _UPVALUE2_.SUCCESS, rowId
end
function igmpEntryDelete(A0_63)
  local L1_64, L2_65, L3_66
  if A0_63 == nil or tonumber(A0_63) == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(allowedNetworksTable, attribute.key, A0_63) == false then
    return _UPVALUE0_.FAILURE
  end
  L3_66 = db.deleteRow(allowedNetworksTable, attribute.key, A0_63)
  if L3_66 == nil then
    return _UPVALUE0_.FAILURE, A0_63
  end
  return _UPVALUE0_.SUCCESS, A0_63
end
function igmpEntryGetAll()
  local L0_67, L1_68, L2_69, L3_70, L4_71, L5_72, L6_73, L7_74, L8_75
  L0_67 = "_ROWID_=1"
  L1_68 = ""
  L2_69 = ""
  L3_70 = ""
  L4_71 = "0"
  L5_72 = "0"
  L6_73 = "0"
  L7_74 = {}
  L8_75 = db
  L8_75 = L8_75.getRow
  L8_75 = L8_75(igmpproxyTable, attribute.key, attribute.keyvalue)
  L7_74 = db.getRow(wanModeTable, attribute.key, attribute.keyvalue)
  if tonumber(L7_74[wanModeTable .. "." .. attribute.wanMode]) == 2 then
    L2_69 = db.getAttribute(nimfConfTable, attribute.logicalIfName, L7_74[wanModeTable .. "." .. attribute.failPriLogicalIfName], attribute.connType)
    L3_70 = db.getAttribute(nimfConfTable, attribute.logicalIfName, L7_74[wanModeTable .. "." .. attribute.failSecLogicalIfName], attribute.connType)
    if L2_69 == attribute.pptp then
      L5_72 = db.getAttribute(pptpTable, attribute.logicalIfName, L7_74[wanModeTable .. "." .. attribute.failPriLogicalIfName], attribute.dualAccess)
    elseif L2_69 == attribute.l2tp then
      L5_72 = db.getAttribute(l2tpTable, attribute.logicalIfName, L7_74[wanModeTable .. "." .. attribute.failPriLogicalIfName], attribute.dualAccess)
    end
    if L3_70 == attribute.pptp then
      L6_73 = db.getAttribute(pptpTable, attribute.logicalIfName, L7_74[wanModeTable .. "." .. attribute.failSecLogicalIfName], attribute.dualAccess)
    elseif L3_70 == attribute.l2tp then
      L6_73 = db.getAttribute(l2tpTable, attribute.logicalIfName, L7_74[wanModeTable .. "." .. attribute.failSecLogicalIfName], attribute.dualAccess)
    end
    L8_75[igmpproxyTable .. "." .. attribute.failPriLogicalIfName] = L7_74[wanModeTable .. "." .. attribute.failPriLogicalIfName]
    L8_75[igmpproxyTable .. "." .. attribute.failSecLogicalIfName] = L7_74[wanModeTable .. "." .. attribute.failSecLogicalIfName]
    L8_75[igmpproxyTable .. "." .. attribute.connectionTypePri] = L2_69
    L8_75[igmpproxyTable .. "." .. attribute.connectionTypeSec] = L3_70
    L8_75[igmpproxyTable .. "." .. attribute.dualAccessPri] = L5_72
    L8_75[igmpproxyTable .. "." .. attribute.dualAccessSec] = L6_73
    if L8_75[igmpproxyTable .. "." .. attribute.dualAccessPri] == nil then
      L8_75[igmpproxyTable .. "." .. attribute.dualAccessPri] = "0"
    end
    if L8_75[igmpproxyTable .. "." .. attribute.dualAccessSec] == nil then
      L8_75[igmpproxyTable .. "." .. attribute.dualAccessSec] = "0"
    end
  else
    if tonumber(L7_74[wanModeTable .. "." .. attribute.wanMode]) == 0 then
      L1_68 = db.getAttribute(nimfConfTable, attribute.logicalIfName, L7_74[wanModeTable .. "." .. attribute.dedicatedLogicalIfName], attribute.connType)
      if L1_68 == attribute.pptp then
        L4_71 = db.getAttribute(pptpTable, attribute.logicalIfName, L7_74[wanModeTable .. "." .. attribute.dedicatedLogicalIfName], attribute.dualAccess)
      elseif L1_68 == attribute.l2tp then
        L4_71 = db.getAttribute(l2tpTable, attribute.logicalIfName, L7_74[wanModeTable .. "." .. attribute.dedicatedLogicalIfName], attribute.dualAccess)
      end
    else
    end
    L8_75[igmpproxyTable .. "." .. attribute.logicalIfName] = L7_74[wanModeTable .. "." .. attribute.dedicatedLogicalIfName]
    L8_75[igmpproxyTable .. "." .. attribute.connType] = L1_68
    L8_75[igmpproxyTable .. "." .. attribute.dualAccess] = L4_71
    if L8_75[igmpproxyTable .. "." .. attribute.dualAccess] == nil then
      L8_75[igmpproxyTable .. "." .. attribute.dualAccess] = "0"
    end
  end
  L8_75[igmpproxyTable .. "." .. attribute.wanMode] = L7_74[wanModeTable .. "." .. attribute.wanMode]
  return _UPVALUE0_.SUCCESS, L8_75
end
function igmpEntryDeleteAll()
  if db.deleteAllRows(allowedNetworksTable) == nil then
    return _UPVALUE0_.ERROR
  end
  return _UPVALUE0_.SUCCESS
end
function igmpSet(A0_76, A1_77)
  local L2_78, L3_79, L4_80
  L2_78 = "_ROWID_=1"
  L3_79 = "1"
  L4_80 = db
  L4_80 = L4_80.getRowWhere
  L4_80 = L4_80(igmpproxyTable, L2_78)
  if L4_80[igmpproxyTable .. "." .. attribute.feature] == ENABLE then
    if A1_77 == WAN1 then
      if modClientType == PPTP then
        L4_80[igmpproxyTable .. "." .. attribute.interfaceWAN1] = "1"
      elseif modClientType == L2TP then
        L4_80[igmpproxyTable .. "." .. attribute.interfaceWAN1] = "2"
      else
        L4_80[igmpproxyTable .. "." .. attribute.interfaceWAN1] = "0"
      end
    elseif A1_77 == WAN2 then
      if modClientType == PPTP then
        L4_80[igmpproxyTable .. "." .. attribute.interfaceWAN2] = "1"
      elseif modClientType == L2TP then
        L4_80[igmpproxyTable .. "." .. attribute.interfaceWAN2] = "2"
      else
        L4_80[igmpproxyTable .. "." .. attribute.interfaceWAN2] = "0"
      end
    end
  end
  errorFlag, statusCode = igmp.config(L4_80, L3_79, "edit")
  if errorFlag == "OK" then
    return _UPVALUE0_.SUCCESS, L3_79
  else
    return _UPVALUE0_.FAILURE, L3_79
  end
end
