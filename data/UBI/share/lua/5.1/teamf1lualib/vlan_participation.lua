local L0_0
L0_0 = module
L0_0("com.teamf1.core.vlan.participation", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vlan_returnCodes")
L0_0 = require
L0_0("teamf1lualib/vlan_validation")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
participationTable = "vlanportmgmt"
igmpSnoopingTable = "igmpSnooping"
dot11Table = "dot11Interface"
dot11Table_attr = {}
dot11Table_attr.interfaceName = "interfaceName"
dot11Table_attr.radioNo = "radioNo"
;({}).keyName = "PortNumber"
;({}).port = "PortNumber"
;({}).mode = "PortVlanMode"
;({}).pvid = "DefaultPVID"
;({}).portName = "PortName"
;({}).PortType = "PortType"
;({}).PhyInterfaceName = "PhyInterfaceName"
;({}).PARTICIPATION = "participation"
;({}).PortLogicalName = "PortLogicalName"
;({}).status = "status"
;({}).key = "_ROWID_"
;({}).keyValue = "1"
;({}).modelId = "modelId"
;({}).radio = "radio"
NetworkInterfaceTable = "networkInterface"
NetworkInterfaceTable_attr = {}
NetworkInterfaceTable_attr.interfaceName = "interfaceName"
NetworkInterfaceTable_attr.ifType = "ifType"
DOT11_VALUE_STRING = "dot11"
VAP_DISABLED = "VAP-DISABLED"
vlanMemberShipTable = "vlan"
vlan = {}
vlan.attribute = {}
vlan.attribute.portName = "portName"
vlan.attribute.vlanId = "vlanId"
vlan.attribute.vlanName = "vlanName"
vlanMode = {}
vlanMode.access = "0"
vlanMode.general = "1"
vlanMode.trunk = "2"
vlanMinNumber = 1
vlanMaxNumber = 4096
LAN_NAME = "LAN"
ETH0_NAME = "eth0"
ROWID = "_ROWID_"
Default_portName = "dummy"
DEFAULT_PVID = "1"
Default_Name = "Default"
function portGet()
  local L0_1, L1_2
  L0_1 = firstCookieGet
  L1_2 = participationTable
  L0_1 = L0_1(L1_2)
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(participationTable, ROWID, L0_1, _UPVALUE0_.port)
  if L1_2 == NIL then
    return _UPVALUE1_.FAILURE, L0_1
  end
  return _UPVALUE1_.SUCCESS, L0_1, L1_2
end
function portSet(A0_3, A1_4)
  local L3_5
  L3_5 = _UPVALUE0_
  L3_5 = L3_5.NOT_SUPPORTED
  return L3_5, A0_3
end
function portDelete(A0_6)
  local L2_7
  L2_7 = _UPVALUE0_
  L2_7 = L2_7.NOT_SUPPORTED
  return L2_7, A0_6
end
function portGetNext(A0_8)
  local L1_9, L2_10, L3_11
  L1_9 = nextCookieGet
  L2_10 = A0_8
  L3_11 = participationTable
  L2_10 = L1_9(L2_10, L3_11)
  L3_11 = FALSE
  if L1_9 == L3_11 then
    L3_11 = NIL
    if L2_10 == L3_11 then
      L3_11 = _UPVALUE0_
      L3_11 = L3_11.NEXT_ROWID_INVALID
      return L3_11
    else
      L3_11 = _UPVALUE0_
      L3_11 = L3_11.INVALID_COOKIE
      return L3_11
    end
  end
  L3_11 = db
  L3_11 = L3_11.getAttribute
  L3_11 = L3_11(participationTable, ROWID, L1_9, _UPVALUE1_.port)
  if L3_11 == NIL then
    return _UPVALUE0_.FAILURE, L1_9
  end
  return _UPVALUE0_.SUCCESS, L1_9, L3_11
end
function modeGet()
  local L0_12, L1_13
  L0_12 = firstCookieGet
  L1_13 = participationTable
  L0_12 = L0_12(L1_13)
  L1_13 = db
  L1_13 = L1_13.getAttribute
  L1_13 = L1_13(participationTable, ROWID, L0_12, _UPVALUE0_.mode)
  if L1_13 == NIL then
    return _UPVALUE1_.FAILURE, L0_12
  end
  return _UPVALUE1_.SUCCESS, L0_12, L1_13
end
function modeSet(A0_14, A1_15)
  if checkCookieExists(A0_14, participationTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if A1_15 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_15 ~= vlanMode.access and A1_15 ~= vlanMode.general and A1_15 ~= vlanMode.trunk then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(participationTable, ROWID, A0_14, _UPVALUE1_.mode, A1_15) == NIL then
    return _UPVALUE0_.FAILURE, A0_14
  end
  return _UPVALUE0_.SUCCESS, A0_14
end
function modeGetNext(A0_16)
  local L1_17, L2_18, L3_19
  L1_17 = nextCookieGet
  L2_18 = A0_16
  L3_19 = participationTable
  L2_18 = L1_17(L2_18, L3_19)
  L3_19 = FALSE
  if L1_17 == L3_19 then
    L3_19 = NIL
    if L2_18 == L3_19 then
      L3_19 = _UPVALUE0_
      L3_19 = L3_19.NEXT_ROWID_INVALID
      return L3_19
    else
      L3_19 = _UPVALUE0_
      L3_19 = L3_19.INVALID_COOKIE
      return L3_19
    end
  end
  L3_19 = db
  L3_19 = L3_19.getAttribute
  L3_19 = L3_19(participationTable, ROWID, L1_17, _UPVALUE1_.mode)
  if L3_19 == NIL then
    return _UPVALUE0_.FAILURE, L1_17
  end
  return _UPVALUE0_.SUCCESS, L1_17, L3_19
end
function pvidGet()
  local L0_20, L1_21
  L0_20 = firstCookieGet
  L1_21 = participationTable
  L0_20 = L0_20(L1_21)
  L1_21 = db
  L1_21 = L1_21.getAttribute
  L1_21 = L1_21(participationTable, ROWID, L0_20, _UPVALUE0_.pvid)
  if L1_21 == NIL then
    return _UPVALUE1_.FAILURE, L0_20
  end
  return _UPVALUE1_.SUCCESS, L0_20, L1_21
end
function pvidSet(A0_22, A1_23)
  if checkCookieExists(A0_22, participationTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if A1_23 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_23) < vlanMinNumber or tonumber(A1_23) > vlanMaxNumber then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(participationTable, ROWID, A0_22, _UPVALUE1_.pvid, A1_23) == NIL then
    return _UPVALUE0_.FAILURE, A0_22
  end
  return _UPVALUE0_.SUCCESS, A0_22
end
function pvidGetNext(A0_24)
  local L1_25, L2_26, L3_27
  L1_25 = nextCookieGet
  L2_26 = A0_24
  L3_27 = participationTable
  L2_26 = L1_25(L2_26, L3_27)
  L3_27 = FALSE
  if L1_25 == L3_27 then
    L3_27 = NIL
    if L2_26 == L3_27 then
      L3_27 = _UPVALUE0_
      L3_27 = L3_27.NEXT_ROWID_INVALID
      return L3_27
    else
      L3_27 = _UPVALUE0_
      L3_27 = L3_27.INVALID_COOKIE
      return L3_27
    end
  end
  L3_27 = db
  L3_27 = L3_27.getAttribute
  L3_27 = L3_27(participationTable, ROWID, L1_25, _UPVALUE1_.pvid)
  if L3_27 == NIL then
    return _UPVALUE0_.FAILURE, L1_25
  end
  return _UPVALUE0_.SUCCESS, L1_25, L3_27
end
function participationVlanGet()
  local L0_28, L1_29, L2_30, L3_31, L4_32, L5_33, L6_34, L7_35, L8_36, L9_37, L10_38, L11_39, L12_40, L13_41
  L0_28 = firstCookieGet
  L1_29 = participationTable
  L0_28 = L0_28(L1_29)
  L1_29 = db
  L1_29 = L1_29.getAttribute
  L2_30 = participationTable
  L3_31 = ROWID
  L1_29 = L1_29(L2_30, L3_31, L4_32, L5_33)
  L2_30 = db
  L2_30 = L2_30.getRows
  L3_31 = vlanMemberShipTable
  L2_30 = L2_30(L3_31, L4_32, L5_33)
  L3_31 = ""
  for L7_35, L8_36 in L4_32(L5_33) do
    for L12_40, L13_41 in L9_37(L10_38) do
      if L12_40 == vlanMemberShipTable .. "." .. vlan.attribute.vlanId then
        L3_31 = L3_31 .. "," .. L13_41
      end
    end
  end
  L3_31 = L4_32
  if L2_30 == L4_32 then
    return L4_32, L5_33
  end
  return L4_32, L5_33, L6_34
end
function participationVlanSet(A0_42, A1_43)
  local L2_44, L3_45, L4_46, L5_47, L6_48, L7_49, L8_50, L9_51, L10_52, L11_53, L12_54, L13_55, L14_56, L15_57
  L2_44 = checkCookieExists
  L3_45 = A0_42
  L4_46 = participationTable
  L2_44 = L2_44(L3_45, L4_46)
  L3_45 = FALSE
  if L2_44 == L3_45 then
    L2_44 = _UPVALUE0_
    L2_44 = L2_44.INVALID_COOKIE
    return L2_44
  end
  L2_44 = db
  L2_44 = L2_44.getAttribute
  L3_45 = participationTable
  L4_46 = ROWID
  L2_44 = L2_44(L3_45, L4_46, L5_47, L6_48)
  L3_45 = NIL
  if A1_43 == L3_45 then
    L3_45 = _UPVALUE2_
    L3_45 = L3_45.COMP_VLAN_PARTICIPATION_PARTICIPATION_NIL
    return L3_45
  end
  L3_45 = {}
  L4_46 = 1
  for L8_50 in L5_47(L6_48, L7_49) do
    L3_45[L4_46] = L8_50
    L4_46 = L4_46 + 1
  end
  L8_50 = L2_44
  L8_50 = vlan
  L8_50 = L8_50.attribute
  L8_50 = L8_50.portName
  if L6_48 == L7_49 then
    L8_50 = A0_42
    return L7_49, L8_50
  end
  L8_50 = participationTable
  L8_50 = "1"
  for L12_54, L13_55 in L9_51(L10_52) do
    L14_56 = db
    L14_56 = L14_56.existsRow
    L15_57 = vlanMemberShipTable
    L14_56 = L14_56(L15_57, vlan.attribute.vlanId, L13_55)
    L15_57 = FALSE
    if L14_56 == L15_57 then
      L15_57 = _UPVALUE2_
      L15_57 = L15_57.COMP_VLAN_PARTICIPATION_VLANID_NOT_EXISTS
      return L15_57
    else
      L15_57 = {}
      L15_57[vlanMemberShipTable .. "." .. vlan.attribute.portName] = L7_49
      L15_57[vlanMemberShipTable .. "." .. vlan.attribute.vlanId] = L13_55
      L15_57[vlanMemberShipTable .. "." .. vlan.attribute.vlanName] = db.getAttribute(vlanMemberShipTable, vlan.attribute.vlanId, L13_55, vlan.attribute.vlanName)
      L8_50 = db.insert(vlanMemberShipTable, L15_57)
    end
  end
  if L8_50 == L9_51 then
    return L9_51, L10_52
  end
  return L9_51, L10_52
end
function dot11participationVlanSet(A0_58, A1_59)
  local L2_60, L3_61, L4_62, L5_63, L6_64, L7_65, L8_66, L9_67, L10_68, L11_69, L12_70, L13_71
  L2_60 = checkCookieExists
  L3_61 = A0_58
  L4_62 = participationTable
  L2_60 = L2_60(L3_61, L4_62)
  L3_61 = FALSE
  if L2_60 == L3_61 then
    L2_60 = _UPVALUE0_
    L2_60 = L2_60.INVALID_COOKIE
    return L2_60
  end
  L2_60 = db
  L2_60 = L2_60.getAttribute
  L3_61 = participationTable
  L4_62 = ROWID
  L2_60 = L2_60(L3_61, L4_62, L5_63, L6_64)
  L3_61 = NIL
  if A1_59 == L3_61 then
    L3_61 = _UPVALUE2_
    L3_61 = L3_61.COMP_VLAN_PARTICIPATION_PARTICIPATION_NIL
    return L3_61
  end
  L3_61 = {}
  L4_62 = 1
  for L8_66 in L5_63(L6_64, L7_65) do
    L3_61[L4_62] = L8_66
    L4_62 = L4_62 + 1
  end
  if L5_63 == L6_64 then
    return L6_64, L7_65
  end
  for L10_68, L11_69 in L7_65(L8_66) do
    L12_70 = db
    L12_70 = L12_70.existsRow
    L13_71 = vlanMemberShipTable
    L12_70 = L12_70(L13_71, vlan.attribute.vlanId, L11_69)
    L13_71 = FALSE
    if L12_70 == L13_71 then
      L13_71 = _UPVALUE2_
      L13_71 = L13_71.COMP_VLAN_PARTICIPATION_VLANID_NOT_EXISTS
      return L13_71
    else
      L13_71 = {}
      L13_71[vlanMemberShipTable .. "." .. vlan.attribute.portName] = L2_60
      L13_71[vlanMemberShipTable .. "." .. vlan.attribute.vlanId] = L11_69
      L13_71[vlanMemberShipTable .. "." .. vlan.attribute.vlanName] = db.getAttribute(vlanMemberShipTable, vlan.attribute.vlanId, L11_69, vlan.attribute.vlanName)
    end
  end
  if L6_64 == L7_65 then
    return L7_65, L8_66
  end
  return L7_65, L8_66
end
function participationVlanGetNext(A0_72)
  local L1_73, L2_74, L3_75, L4_76, L5_77, L6_78, L7_79, L8_80, L9_81, L10_82, L11_83, L12_84, L13_85, L14_86, L15_87
  L1_73 = nextCookieGet
  L2_74 = A0_72
  L3_75 = participationTable
  L2_74 = L1_73(L2_74, L3_75)
  L3_75 = FALSE
  if L1_73 == L3_75 then
    L3_75 = NIL
    if L2_74 == L3_75 then
      L3_75 = _UPVALUE0_
      L3_75 = L3_75.NEXT_ROWID_INVALID
      return L3_75
    else
      L3_75 = _UPVALUE0_
      L3_75 = L3_75.INVALID_COOKIE
      return L3_75
    end
  end
  L3_75 = db
  L3_75 = L3_75.getAttribute
  L4_76 = participationTable
  L5_77 = ROWID
  L3_75 = L3_75(L4_76, L5_77, L6_78, L7_79)
  L4_76 = db
  L4_76 = L4_76.getRows
  L5_77 = vlanMemberShipTable
  L4_76 = L4_76(L5_77, L6_78, L7_79)
  L5_77 = ""
  for L9_81, L10_82 in L6_78(L7_79) do
    for L14_86, L15_87 in L11_83(L12_84) do
      if L14_86 == vlanMemberShipTable .. "." .. vlan.attribute.vlanId then
        L5_77 = L5_77 .. "," .. L15_87
      end
    end
  end
  L5_77 = L6_78
  if L4_76 == L6_78 then
    return L6_78, L7_79
  end
  return L6_78, L7_79, L8_80
end
function participationGet(A0_88)
  local L1_89, L2_90, L3_91, L4_92, L5_93, L6_94, L7_95
  L6_94 = tonumber
  L7_95 = A0_88
  L6_94 = L6_94(L7_95)
  if L6_94 > 9 then
    L6_94 = tonumber
    L7_95 = A0_88
    L6_94 = L6_94(L7_95)
    if L6_94 < 18 then
      L6_94 = participationdot11VlanGetWithCookie
      L7_95 = A0_88
      L3_91, L6_94 = nil, L6_94(L7_95)
      L3_91, L7_95 = nil, L6_94(L7_95)
      L2_90 = L7_95
      L1_89 = L6_94
      L6_94 = NIL
      if L3_91 == L6_94 then
        L6_94 = _UPVALUE0_
        L6_94 = L6_94.FAILURE
        L7_95 = A0_88
        return L6_94, L7_95
      end
      L4_92 = "1"
    end
  else
    L6_94 = participationVlanGetWithCookie
    L7_95 = A0_88
    L3_91, L7_95 = L6_94(L7_95)
    L2_90 = L7_95
    L1_89 = L6_94
    L6_94 = NIL
    if L3_91 == L6_94 then
      L6_94 = _UPVALUE0_
      L6_94 = L6_94.FAILURE
      L7_95 = A0_88
      return L6_94, L7_95
    end
    L4_92 = "0"
  end
  L6_94 = db
  L6_94 = L6_94.getRow
  L7_95 = participationTable
  L6_94 = L6_94(L7_95, ROWID, A0_88)
  L7_95 = NIL
  if L6_94 == L7_95 then
    L7_95 = _UPVALUE0_
    L7_95 = L7_95.FAILURE
    return L7_95, cookies
  end
  L7_95 = participationTable
  L7_95 = L7_95 .. "." .. _UPVALUE1_.portName
  L5_93 = L6_94[L7_95]
  L7_95 = nil
  if tonumber(A0_88) > 9 and tonumber(A0_88) < 18 then
    L7_95 = L6_94[participationTable .. "." .. _UPVALUE1_.portName]
  else
    L7_95 = tonumber(L6_94[participationTable .. "." .. _UPVALUE1_.port])
    L7_95 = L7_95 + 1
    L7_95 = tostring(L7_95)
  end
  return _UPVALUE0_.SUCCESS, A0_88, L7_95, L6_94[participationTable .. "." .. _UPVALUE1_.mode], L6_94[participationTable .. "." .. _UPVALUE1_.pvid], L3_91, L4_92, L5_93
end
function participationVlanGetWithCookie(A0_96)
  local L1_97, L2_98, L3_99, L4_100, L5_101, L6_102, L7_103, L8_104, L9_105, L10_106, L11_107, L12_108, L13_109
  L1_97 = db
  L1_97 = L1_97.getAttribute
  L2_98 = participationTable
  L3_99 = ROWID
  L1_97 = L1_97(L2_98, L3_99, L4_100, L5_101)
  L2_98 = db
  L2_98 = L2_98.getRows
  L3_99 = vlanMemberShipTable
  L2_98 = L2_98(L3_99, L4_100, L5_101)
  L3_99 = ""
  for L7_103, L8_104 in L4_100(L5_101) do
    for L12_108, L13_109 in L9_105(L10_106) do
      if L12_108 == vlanMemberShipTable .. "." .. vlan.attribute.vlanId then
        L3_99 = L3_99 .. "," .. L13_109
      end
    end
  end
  L3_99 = L4_100
  if L2_98 == L4_100 then
    return L4_100, L5_101
  end
  return L4_100, L5_101, L6_102
end
function participationdot11VlanGetWithCookie(A0_110)
  local L1_111, L2_112, L3_113, L4_114, L5_115, L6_116, L7_117, L8_118, L9_119, L10_120, L11_121, L12_122, L13_123
  L1_111 = db
  L1_111 = L1_111.getAttribute
  L2_112 = participationTable
  L3_113 = ROWID
  L1_111 = L1_111(L2_112, L3_113, L4_114, L5_115)
  L2_112 = db
  L2_112 = L2_112.getRows
  L3_113 = vlanMemberShipTable
  L2_112 = L2_112(L3_113, L4_114, L5_115)
  L3_113 = ""
  for L7_117, L8_118 in L4_114(L5_115) do
    for L12_122, L13_123 in L9_119(L10_120) do
      if L12_122 == vlanMemberShipTable .. "." .. vlan.attribute.vlanId then
        L3_113 = L3_113 .. "," .. L13_123
      end
    end
  end
  L3_113 = L4_114
  if L2_112 == L4_114 then
    return L4_114, L5_115
  end
  return L4_114, L5_115, L6_116
end
function participationGetAll()
  local L0_124, L1_125, L2_126, L3_127, L4_128, L5_129, L6_130, L7_131, L8_132, L9_133, L10_134, L11_135, L12_136, L13_137, L14_138
  L1_125 = PRODUCT_ID
  if L1_125 ~= "DSR-1000AC_Ax" then
    L1_125 = PRODUCT_ID
    if L1_125 ~= "DSR-500AC_Ax" then
      L1_125 = PRODUCT_ID
      if L1_125 ~= "DSR-1000_Bx" then
        L1_125 = PRODUCT_ID
      end
    end
  else
    if L1_125 == "DSR-500_Bx" then
      L1_125 = "SELECT * from "
      L2_126 = participationTable
      L3_127 = " where "
      L4_128 = _UPVALUE0_
      L4_128 = L4_128.PortType
      L8_132 = _UPVALUE0_
      L8_132 = L8_132.PhyInterfaceName
      L9_133 = " = '"
      L0_124 = L1_125 .. L2_126 .. L3_127 .. L4_128 .. L5_129 .. L6_130 .. L7_131 .. L8_132 .. L9_133 .. L10_134 .. L11_135
  end
  else
    L1_125 = "SELECT * from "
    L2_126 = participationTable
    L3_127 = " where "
    L4_128 = _UPVALUE0_
    L4_128 = L4_128.PortType
    L8_132 = _UPVALUE0_
    L8_132 = L8_132.PhyInterfaceName
    L9_133 = " = '"
    L0_124 = L1_125 .. L2_126 .. L3_127 .. L4_128 .. L5_129 .. L6_130 .. L7_131 .. L8_132 .. L9_133 .. L10_134 .. L11_135
  end
  L1_125 = db
  L1_125 = L1_125.getTable
  L2_126 = participationTable
  L3_127 = nil
  L4_128 = L0_124
  L1_125 = L1_125(L2_126, L3_127, L4_128)
  L2_126 = NIL
  if L1_125 == L2_126 then
    L2_126 = _UPVALUE2_
    L2_126 = L2_126.FAILURE
    return L2_126
  end
  L2_126, L3_127, L4_128 = nil, nil, nil
  for L8_132, L9_133 in L5_129(L6_130) do
    for L13_137, L14_138 in L10_134(L11_135) do
      if L13_137 == participationTable .. "." .. _UPVALUE0_.port then
        L2_126, L3_127, L4_128 = participationVlanGetWithCookie(L14_138)
        if L2_126 ~= _UPVALUE2_.SUCCESS then
          return _UPVALUE2_.FAILURE
        else
          L9_133[participationTable .. "." .. _UPVALUE0_.PARTICIPATION] = L4_128
        end
      end
    end
  end
  return L5_129, L6_130
end
function participationdot11GetAll()
  local L0_139, L1_140, L2_141, L3_142, L4_143, L5_144, L6_145, L7_146, L8_147, L9_148, L10_149, L11_150, L12_151, L13_152, L14_153, L15_154, L16_155, L17_156, L18_157
  L0_139 = _UPVALUE0_
  L0_139 = L0_139.NIL
  L1_140 = {}
  L2_141 = _UPVALUE0_
  L2_141 = L2_141.NIL
  L3_142 = "SELECT * from "
  L4_143 = participationTable
  L3_142 = L3_142 .. L4_143
  L4_143 = db
  L4_143 = L4_143.getTable
  L5_144 = participationTable
  L6_145 = nil
  L7_146 = L3_142
  L4_143 = L4_143(L5_144, L6_145, L7_146)
  L5_144 = NIL
  if L4_143 == L5_144 then
    L5_144 = _UPVALUE0_
    L5_144 = L5_144.FAILURE
    return L5_144
  end
  L5_144, L6_145, L7_146 = nil, nil, nil
  L8_147 = 1
  for L12_151, L13_152 in L9_148(L10_149) do
    for L17_156, L18_157 in L14_153(L15_154) do
      tempVar = db.getAttribute(NetworkInterfaceTable, NetworkInterfaceTable_attr.interfaceName, L13_152[participationTable .. "." .. _UPVALUE1_.PhyInterfaceName], NetworkInterfaceTable_attr.ifType)
      if tempVar == DOT11_VALUE_STRING and L17_156 == participationTable .. "." .. _UPVALUE1_.port and L13_152[participationTable .. "." .. _UPVALUE1_.PortType] ~= VAP_DISABLED then
        L2_141 = db.getAttribute(dot11Table, dot11Table_attr.interfaceName, L13_152[participationTable .. "." .. _UPVALUE1_.PhyInterfaceName], dot11Table_attr.radioNo)
        L1_140[L8_147] = {}
        tempVar = L13_152[participationTable .. "." .. _UPVALUE1_.PortLogicalName]
        L5_144, L6_145, L7_146 = participationdot11VlanGetWithCookie(L18_157)
        if L5_144 ~= _UPVALUE0_.SUCCESS then
          return _UPVALUE0_.FAILURE
        else
          L13_152[participationTable .. "." .. _UPVALUE1_.PARTICIPATION] = L7_146
        end
        tempVar = L13_152[participationTable .. "." .. _UPVALUE1_.port]
        L1_140[L8_147][participationTable .. "." .. _UPVALUE1_.port] = tempVar
        tempVar = L13_152[participationTable .. "." .. _UPVALUE1_.portName]
        L1_140[L8_147][participationTable .. "." .. _UPVALUE1_.portName] = tempVar
        tempVar = L13_152[participationTable .. "." .. _UPVALUE1_.mode]
        L1_140[L8_147][participationTable .. "." .. _UPVALUE1_.mode] = tempVar
        tempVar = L13_152[participationTable .. "." .. _UPVALUE1_.pvid]
        L1_140[L8_147][participationTable .. "." .. _UPVALUE1_.pvid] = tempVar
        tempVar = L13_152[participationTable .. "." .. _UPVALUE1_.PARTICIPATION]
        L1_140[L8_147][participationTable .. "." .. _UPVALUE1_.PARTICIPATION] = tempVar
        if UNIT_NAME == "DSR-1000AC" then
          if L2_141 == "1" then
            L2_141 = "5 Ghz"
          else
            L2_141 = "2.4 Ghz"
          end
          tempVar = L2_141
          L1_140[L8_147][participationTable .. "." .. _UPVALUE1_.radio] = tempVar
        end
        L8_147 = L8_147 + 1
      end
    end
  end
  return L9_148, L10_149
end
function participationSet(A0_158, A1_159, A2_160, A3_161, A4_162)
  local L5_163, L6_164, L7_165, L8_166, L9_167, L10_168, L11_169, L12_170, L13_171, L14_172, L15_173, L16_174
  L5_163 = db
  L5_163 = L5_163.getAttribute
  L6_164 = igmpSnoopingTable
  L7_165 = ROWID
  L8_166 = "1"
  L9_167 = _UPVALUE0_
  L9_167 = L9_167.status
  L5_163 = L5_163(L6_164, L7_165, L8_166, L9_167)
  if L5_163 == "1" then
    L6_164 = tonumber
    L7_165 = A0_158
    L6_164 = L6_164(L7_165)
    if L6_164 < 10 then
      L6_164 = _UPVALUE1_
      L6_164 = L6_164.COMP_VLAN_IGMPSNOOPING_ENABLED
      return L6_164
    end
  end
  L6_164 = nil
  L7_165 = checkCookieExists
  L8_166 = A0_158
  L9_167 = participationTable
  L7_165 = L7_165(L8_166, L9_167)
  L8_166 = FALSE
  if L7_165 == L8_166 then
    L7_165 = _UPVALUE2_
    L7_165 = L7_165.INVALID_COOKIE
    return L7_165
  end
  L7_165 = db
  L7_165 = L7_165.getAttribute
  L8_166 = participationTable
  L9_167 = ROWID
  L10_168 = A0_158
  L7_165 = L7_165(L8_166, L9_167, L10_168, L11_169)
  L8_166 = db
  L8_166 = L8_166.getAttribute
  L9_167 = participationTable
  L10_168 = ROWID
  L8_166 = L8_166(L9_167, L10_168, L11_169, L12_170)
  L9_167 = NIL
  if A2_160 == L9_167 then
    L9_167 = _UPVALUE1_
    L9_167 = L9_167.COMP_VLAN_PARTICIPATION_MODE_NIL
    return L9_167
  end
  L9_167 = vlanMode
  L9_167 = L9_167.access
  if A2_160 ~= L9_167 then
    L9_167 = vlanMode
    L9_167 = L9_167.general
    if A2_160 ~= L9_167 then
      L9_167 = vlanMode
      L9_167 = L9_167.trunk
      if A2_160 ~= L9_167 then
        L9_167 = _UPVALUE1_
        L9_167 = L9_167.COMP_VLAN_PARTICIPATION_MODE_INVALID
        return L9_167
      end
    end
  end
  L9_167 = vlanMode
  L9_167 = L9_167.trunk
  if A2_160 == L9_167 then
    A3_161 = DEFAULT_PVID
    L9_167 = util
    L9_167 = L9_167.split
    L10_168 = A4_162
    L9_167 = L9_167(L10_168, L11_169)
    L10_168 = 0
    for L14_172, L15_173 in L11_169(L12_170) do
      L16_174 = DEFAULT_PVID
      if L15_173 == L16_174 then
        L10_168 = 1
      end
    end
    if L10_168 == 0 then
      A4_162 = L11_169 .. L12_170 .. L13_171
    end
  end
  L9_167 = vlanMode
  L9_167 = L9_167.general
  if A2_160 == L9_167 then
    L9_167 = util
    L9_167 = L9_167.split
    L10_168 = A4_162
    L9_167 = L9_167(L10_168, L11_169)
    L10_168 = 0
    for L14_172, L15_173 in L11_169(L12_170) do
      if L15_173 == A3_161 then
        L10_168 = 1
      end
    end
    if L10_168 == 0 then
      A4_162 = L11_169 .. L12_170 .. L13_171
    end
  end
  L9_167 = db
  L9_167 = L9_167.existsRow
  L10_168 = vlanMemberShipTable
  L9_167 = L9_167(L10_168, L11_169, L12_170)
  if not L9_167 then
    L10_168 = _UPVALUE1_
    L10_168 = L10_168.COMP_VLAN_PARTICIPATION_VLANID_NOT_EXISTS
    return L10_168
  end
  L10_168 = NIL
  if A3_161 == L10_168 then
    L10_168 = _UPVALUE1_
    L10_168 = L10_168.COMP_VLAN_PARTICIPATION_VLANID_NIL
    return L10_168
  end
  L10_168 = db
  L10_168 = L10_168.getAttribute
  L14_172 = _UPVALUE0_
  L14_172 = L14_172.port
  L10_168 = L10_168(L11_169, L12_170, L13_171, L14_172)
  L10_168 = L10_168 + 1
  L14_172 = "'"
  L14_172 = L11_169
  if L12_170 then
    return L13_171
  end
  L14_172 = A3_161
  L14_172 = vlanMinNumber
  if not (L13_171 < L14_172) then
    L14_172 = vlanMaxNumber
  elseif L13_171 > L14_172 then
    L14_172 = _UPVALUE1_
    L14_172 = L14_172.COMP_VLAN_PARTICIPATION_VLANID_INVALID
    return L14_172
  end
  L14_172 = NIL
  if A4_162 == L14_172 then
    A4_162 = A3_161
  end
  L14_172 = {}
  L15_173 = participationTable
  L16_174 = "."
  L15_173 = L15_173 .. L16_174 .. _UPVALUE0_.mode
  L14_172[L15_173] = A2_160
  L15_173 = participationTable
  L16_174 = "."
  L15_173 = L15_173 .. L16_174 .. _UPVALUE0_.pvid
  L14_172[L15_173] = A3_161
  L15_173 = db
  L15_173 = L15_173.update
  L16_174 = participationTable
  L15_173 = L15_173(L16_174, L14_172, A0_158)
  L16_174 = nil
  if string.find(L8_166, "vap") ~= nil then
    L16_174 = dot11participationVlanSet(A0_158, A4_162)
  else
    L16_174 = participationVlanSet(A0_158, A4_162)
  end
  if L16_174 ~= _UPVALUE2_.SUCCESS then
    return _UPVALUE2_.FAILURE, A0_158
  end
  if L15_173 == NIL then
    return _UPVALUE2_.FAILURE, A0_158
  end
  return _UPVALUE2_.SUCCESS, A0_158
end
function participationGetNext(A0_175)
  local L1_176, L2_177, L3_178, L4_179, L5_180
  L1_176 = nextCookieGet
  L2_177 = A0_175
  L3_178 = participationTable
  L2_177 = L1_176(L2_177, L3_178)
  L3_178 = FALSE
  if L1_176 == L3_178 then
    L3_178 = NIL
    if L2_177 == L3_178 then
      L3_178 = _UPVALUE0_
      L3_178 = L3_178.NEXT_ROWID_INVALID
      return L3_178
    else
      L3_178 = _UPVALUE0_
      L3_178 = L3_178.INVALID_COOKIE
      return L3_178
    end
  end
  L3_178 = db
  L3_178 = L3_178.getRow
  L4_179 = participationTable
  L5_180 = ROWID
  L3_178 = L3_178(L4_179, L5_180, L1_176)
  L4_179 = NIL
  if L3_178 == L4_179 then
    L4_179 = _UPVALUE0_
    L4_179 = L4_179.FAILURE
    L5_180 = A0_175
    return L4_179, L5_180
  end
  L4_179 = tonumber
  L5_180 = participationTable
  L5_180 = L5_180 .. "." .. _UPVALUE1_.port
  L5_180 = L3_178[L5_180]
  L4_179 = L4_179(L5_180)
  L4_179 = L4_179 + 1
  L5_180 = tostring
  L5_180 = L5_180(L4_179)
  L4_179 = L5_180
  L5_180 = participationVlanGetNext
  L5_180 = L5_180(A0_175)
  if L5_180 == NIL then
    return _UPVALUE0_.FAILURE, A0_175
  end
  return _UPVALUE0_.SUCCESS, A0_175, L4_179, L3_178[participationTable .. "." .. _UPVALUE1_.mode], L3_178[participationTable .. "." .. _UPVALUE1_.pvid], L5_180
end
function participationDelete(A0_181)
  local L2_182
  L2_182 = _UPVALUE0_
  L2_182 = L2_182.NOT_SUPPORTED
  return L2_182, A0_181
end
function participationCreate(A0_183, A1_184, A2_185, A3_186)
  local L5_187
  L5_187 = _UPVALUE0_
  L5_187 = L5_187.NOT_SUPPORTED
  return L5_187, cookie
end
