local L0_0
L0_0 = module
L0_0("com.teamf1.core.wireless.wds", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/dot11_returnCodes")
L0_0 = require
L0_0("teamf1lualib/wireless_accessPoints")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.wireless.dot11.returnCodes")
radioTable = "dot11Radio"
portMgmtTable = "VlanPortMgmt"
bridgePortsTable = "bridgePorts"
wdsPeersTable = "dot11WDSPeers"
vlanTable = "vlan"
vapTable = "dot11VAP"
profileTable = "dot11Profile"
radio11nTable = "dot11Radio11n"
interfaceTable = "dot11Interface"
;({}).ROW_ID = "_ROWID_"
;({}).wdsEnabled = "wdsEnabled"
;({}).wdsPskPassAscii = "wdsPskPassAscii"
;({}).pskPassAscii = "pskPassAscii"
;({}).wdsIndexNo = "wdsIndexNo"
;({}).PortNumber = "PortNumber"
;({}).interfaceName = "interfaceName"
;({}).portEnabled = "portEnabled"
;({}).bridgeInterface = "bridgeInterface"
;({}).vlanEnabled = "vlanEnabled"
;({}).vlanId = "vlanId"
;({}).PortNumber = "PortNumber"
;({}).PortName = "PortName"
;({}).PortLogicalName = "PortLogicalName"
;({}).PortType = "PortType"
;({}).PhyInterfaceName = "PhyInterfaceName"
;({}).PortVlanMode = "PortVlanMode"
;({}).DefaultPVID = "DefaultPVID"
;({}).portName = "portName"
;({}).vlanId = "vlanId"
;({}).vlanName = "vlanName"
;({}).wdsIndexNo = "wdsIndexNo"
;({}).profileName = "profileName"
;({}).pairwiseCiphers = "pairwiseCiphers"
;({}).pairwiseCipher = "pairwiseCipher"
;({}).radioNo = "radioNo"
;({}).ssid = "ssid"
;({}).vapName = "vapName"
;({}).defaultAP = "ap1"
;({}).authMethods = "authMethods"
;({}).security = "security"
;({}).groupCipher = "groupCipher"
;({}).wepAuth = "wepAuth"
;({}).macAddress = "macAddress"
;({}).trunk = "trunk"
;({}).vapEnabled = "vapEnabled"
;({}).bridge = "BRIDGE"
;({}).vapDisabled = "VAP-DISABLED"
;({}).apName = "vapName"
;({}).defaultInterface = "vap0"
function getdefaultAP(A0_1)
  local L1_2
  if A0_1 == 1 then
    L1_2 = _UPVALUE0_
    L1_2.defaultAP = "ap1"
  else
    L1_2 = _UPVALUE0_
    L1_2.defaultAP = "ap5"
  end
end
function getdefaultInterface(A0_3)
  local L1_4
  if A0_3 == 1 then
    L1_4 = _UPVALUE0_
    L1_4.defaultInterface = "vap0"
  else
    L1_4 = _UPVALUE0_
    L1_4.defaultInterface = "vap4"
  end
end
function iswdsEnableEnabled()
  local L0_5, L1_6
  L1_6 = db
  L1_6 = L1_6.getAttribute
  L1_6 = L1_6(wdsTable, "_ROWID_", "1", _UPVALUE0_.wdsEnable)
  if L1_6 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_6
end
function iswdsEnableEnabledNext(A0_7)
  local L1_8, L2_9, L3_10
  L3_10 = db
  L3_10 = L3_10.getAttribute
  L3_10 = L3_10(wdsTable, "_ROWID_", L2_9, _UPVALUE0_.wdsEnable)
  if L3_10 == nil then
    return _UPVALUE1_.FAILURE, L2_9
  end
  return _UPVALUE1_.SUCCESS, L2_9, L3_10
end
function wdsEnableEnable(A0_11)
  local L1_12, L2_13, L3_14
  L2_13 = status
  if L2_13 == nil then
    L2_13 = _UPVALUE0_
    L2_13 = L2_13.FAILURE
    L3_14 = A0_11
    return L2_13, L3_14
  end
  L2_13 = _UPVALUE0_
  L2_13 = L2_13.SUCCESS
  L3_14 = A0_11
  return L2_13, L3_14
end
function wdsEnableDisable(A0_15)
  local L1_16, L2_17, L3_18
  L2_17 = status
  if L2_17 == nil then
    L2_17 = _UPVALUE0_
    L2_17 = L2_17.FAILURE
    L3_18 = A0_15
    return L2_17, L3_18
  end
  L2_17 = _UPVALUE0_
  L2_17 = L2_17.SUCCESS
  L3_18 = A0_15
  return L2_17, L3_18
end
function macAddressGet()
  local L0_19, L1_20
  L1_20 = db
  L1_20 = L1_20.getAttribute
  L1_20 = L1_20(wdsTable, "_ROWID_", "1", _UPVALUE0_.macAddress)
  if L1_20 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_20
end
function macAddressGetNext(A0_21)
  local L1_22, L2_23, L3_24
  L3_24 = db
  L3_24 = L3_24.getAttribute
  L3_24 = L3_24(wdsTable, "_ROWID_", L2_23, _UPVALUE0_.macAddress)
  if L3_24 == nil then
    return _UPVALUE1_.FAILURE, L2_23
  end
  return _UPVALUE1_.SUCCESS, L2_23, L3_24
end
function macAddressSet(A0_25, A1_26)
  local L2_27, L3_28, L4_29
  if A1_26 == nil then
    L3_28 = _UPVALUE0_
    L3_28 = L3_28.INVALID_ARGUMENT
    return L3_28
  end
  L3_28 = status
  if L3_28 == nil then
    L3_28 = _UPVALUE0_
    L3_28 = L3_28.FAILURE
    L4_29 = A0_25
    return L3_28, L4_29
  end
  L3_28 = _UPVALUE0_
  L3_28 = L3_28.SUCCESS
  L4_29 = A0_25
  return L3_28, L4_29
end
function wdsGroupGet()
  local L0_30, L1_31, L2_32
  L0_30 = status
  if L0_30 == nil then
    L0_30 = _UPVALUE0_
    L0_30 = L0_30.FAILURE
    return L0_30
  end
  L0_30 = _UPVALUE0_
  L0_30 = L0_30.SUCCESS
  L1_31 = 1
  L2_32 = wdsGroup
  return L0_30, L1_31, L2_32
end
function wdsGroupGetNext(A0_33)
  local L1_34, L2_35, L3_36, L4_37
  L2_35 = status
  if L2_35 == nil then
    L2_35 = _UPVALUE0_
    L2_35 = L2_35.FAILURE
    L3_36 = A0_33
    return L2_35, L3_36
  end
  L2_35 = _UPVALUE0_
  L2_35 = L2_35.SUCCESS
  L3_36 = L1_34
  L4_37 = wdsGroup
  return L2_35, L3_36, L4_37
end
function dot11WDSPeersDummyUpdate()
  local L0_38, L1_39, L2_40, L3_41, L4_42, L5_43, L6_44, L7_45, L8_46, L9_47, L10_48
  L2_40 = 0
  L3_41 = 0
  if L4_42 ~= "DSR-150N" then
  elseif L4_42 == "Bx" then
    L3_41 = 1
  end
  if L3_41 == 0 then
    return L4_42
  end
  L7_45 = "1"
  L8_46 = _UPVALUE1_
  L8_46 = L8_46.wdsEnabled
  L0_38 = L4_42 or ""
  if L0_38 ~= nil then
    if L4_42 == 1 then
      L1_39 = L4_42
      L2_40 = 0
      for L7_45, L8_46 in L4_42(L5_43) do
        L2_40 = L2_40 + 1
        L9_47 = L1_39[L2_40]
        L10_48 = _UPVALUE1_
        L10_48 = L10_48.macAddress
        L10_48 = L9_47[L10_48]
        valid = db.setAttribute(wdsPeersTable, _UPVALUE1_.ROW_ID, L9_47[_UPVALUE1_.ROW_ID], _UPVALUE1_.macAddress, L10_48)
      end
    end
  end
  return L4_42
end
function wdsGroupSet(A0_49, A1_50, A2_51)
  local L3_52, L4_53, L5_54, L6_55, L7_56, L8_57, L9_58, L10_59, L11_60, L12_61, L13_62, L14_63, L15_64, L16_65, L17_66, L18_67, L19_68
  L3_52 = {}
  L4_53 = db
  L4_53 = L4_53.getAttribute
  L5_54 = vapTable
  L6_55 = _UPVALUE0_
  L6_55 = L6_55.vapName
  L7_56 = _UPVALUE0_
  L7_56 = L7_56.defaultAP
  L8_57 = _UPVALUE0_
  L8_57 = L8_57.vapEnabled
  L4_53 = L4_53(L5_54, L6_55, L7_56, L8_57)
  L5_54 = _UPVALUE1_
  L5_54 = L5_54.NIL
  if L4_53 ~= L5_54 then
    L5_54 = tonumber
    L6_55 = L4_53
    L5_54 = L5_54(L6_55)
    if L5_54 == 0 then
      L5_54 = _UPVALUE2_
      L5_54 = L5_54.WDS_IS_CONFIGURED_ERR2
      L6_55 = A0_49
      return L5_54, L6_55
    end
  end
  L5_54 = nil
  L6_55 = db
  L6_55 = L6_55.getAttribute
  L7_56 = radioTable
  L8_57 = _UPVALUE0_
  L8_57 = L8_57.ROW_ID
  L9_58 = A0_49
  L10_59 = _UPVALUE0_
  L10_59 = L10_59.wdsEnabled
  L6_55 = L6_55(L7_56, L8_57, L9_58, L10_59)
  L7_56 = db
  L7_56 = L7_56.getAttribute
  L8_57 = vapTable
  L9_58 = _UPVALUE0_
  L9_58 = L9_58.vapName
  L10_59 = _UPVALUE0_
  L10_59 = L10_59.defaultAP
  L11_60 = _UPVALUE0_
  L11_60 = L11_60.profileName
  L7_56 = L7_56(L8_57, L9_58, L10_59, L11_60)
  L8_57 = db
  L8_57 = L8_57.getAttribute
  L9_58 = profileTable
  L10_59 = _UPVALUE0_
  L10_59 = L10_59.profileName
  L11_60 = L7_56
  L12_61 = _UPVALUE0_
  L12_61 = L12_61.security
  L8_57 = L8_57(L9_58, L10_59, L11_60, L12_61)
  L8_57 = L8_57 or ""
  L9_58 = 0
  L10_59 = UNIT_NAME
  if L10_59 ~= "DSR-150N" then
    L10_59 = UNIT_NAME
    if L10_59 == "DSR-250N" then
      L10_59 = HW_SER
    end
  elseif L10_59 == "Bx" then
    L9_58 = 1
  end
  if A1_50 == nil then
    L10_59 = _UPVALUE1_
    L10_59 = L10_59.INVALID_ARGUMENT
    return L10_59
  end
  L10_59 = _UPVALUE3_
  L10_59 = L10_59.booleanCheck
  L11_60 = A1_50
  L10_59 = L10_59(L11_60)
  L5_54 = L10_59
  L10_59 = _UPVALUE1_
  L10_59 = L10_59.SUCCESS
  if L5_54 ~= L10_59 then
    L10_59 = _UPVALUE1_
    L10_59 = L10_59.INVALID_ARGUMENT
    return L10_59
  end
  L10_59 = radioTable
  L11_60 = "."
  L12_61 = _UPVALUE0_
  L12_61 = L12_61.wdsEnabled
  L10_59 = L10_59 .. L11_60 .. L12_61
  L3_52[L10_59] = A1_50
  L10_59 = _UPVALUE1_
  L10_59 = L10_59.NIL
  if A2_51 ~= L10_59 then
    L10_59 = util
    L10_59 = L10_59.isAllMasked
    L11_60 = A2_51
    L10_59 = L10_59(L11_60)
    if L10_59 then
      L10_59 = db
      L10_59 = L10_59.getAttribute
      L11_60 = radioTable
      L12_61 = _UPVALUE0_
      L12_61 = L12_61.ROW_ID
      L10_59 = L10_59(L11_60, L12_61, L13_62, L14_63)
      A2_51 = L10_59
    end
  end
  L10_59 = radioTable
  L11_60 = "."
  L12_61 = _UPVALUE0_
  L12_61 = L12_61.wdsPskPassAscii
  L10_59 = L10_59 .. L11_60 .. L12_61
  L3_52[L10_59] = A2_51
  L10_59 = db
  L10_59 = L10_59.update
  L11_60 = radioTable
  L12_61 = L3_52
  L10_59 = L10_59(L11_60, L12_61, L13_62)
  if L10_59 == nil then
    L11_60 = _UPVALUE1_
    L11_60 = L11_60.FAILURE
    L12_61 = A0_49
    return L11_60, L12_61
  end
  L11_60 = db
  L11_60 = L11_60.getTable
  L12_61 = wdsPeersTable
  L11_60 = L11_60(L12_61, L13_62)
  L12_61 = 0
  for L16_65, L17_66 in L13_62(L14_63) do
    L12_61 = L12_61 + 1
    L18_67 = L11_60[L12_61]
    if L9_58 == 1 then
      if L8_57 == "OPEN" or L8_57 == "WEP" then
        L19_68 = _UPVALUE0_
        L19_68 = L19_68.pskPassAscii
        L19_68 = L18_67[L19_68]
        if L19_68 == "" then
          L19_68 = _UPVALUE0_
          L19_68 = L19_68.pairwiseCipher
          L19_68 = L18_67[L19_68]
        elseif L19_68 ~= "" then
          L19_68 = db
          L19_68 = L19_68.getRow
          L19_68 = L19_68(wdsPeersTable, _UPVALUE0_.ROW_ID, L18_67[_UPVALUE0_.ROW_ID])
          L19_68[wdsPeersTable .. "." .. _UPVALUE0_.pskPassAscii] = ""
          L19_68[wdsPeersTable .. "." .. _UPVALUE0_.pairwiseCipher] = ""
          if db.update(wdsPeersTable, L19_68, L18_67[_UPVALUE0_.ROW_ID]) == nil then
            return _UPVALUE1_.FAILURE, A0_49
          end
        end
      else
        L19_68 = _UPVALUE1_
        L19_68 = L19_68.NIL
        if A2_51 ~= L19_68 then
          L19_68 = _UPVALUE0_
          L19_68 = L19_68.pskPassAscii
          L19_68 = L18_67[L19_68]
          if A2_51 ~= L19_68 then
            L19_68 = db
            L19_68 = L19_68.setAttribute
            L19_68 = L19_68(wdsPeersTable, _UPVALUE0_.ROW_ID, L18_67[_UPVALUE0_.ROW_ID], _UPVALUE0_.pskPassAscii, A2_51)
            L10_59 = L19_68
          end
        end
      end
    else
      L19_68 = _UPVALUE1_
      L19_68 = L19_68.NIL
      if A2_51 ~= L19_68 and L10_59 then
        L19_68 = db
        L19_68 = L19_68.setAttribute
        L19_68 = L19_68(wdsPeersTable, _UPVALUE0_.ROW_ID, L18_67[_UPVALUE0_.ROW_ID], _UPVALUE0_.pskPassAscii, A2_51)
        L10_59 = L19_68
      end
    end
    if L6_55 ~= A1_50 then
      if A1_50 == "1" then
        L19_68 = bridgeCreate
        statCode, L19_68 = L18_67[_UPVALUE0_.wdsIndexNo] - 1, L19_68(L18_67[_UPVALUE0_.wdsIndexNo] - 1)
        L10_59 = L19_68
      elseif A1_50 == "0" then
        L19_68 = bridgeDelete
        statCode, L19_68 = L18_67[_UPVALUE0_.wdsIndexNo] - 1, L19_68(L18_67[_UPVALUE0_.wdsIndexNo] - 1)
        L10_59 = L19_68
      end
    end
  end
  if L10_59 then
    return L13_62, L14_63
  else
    return L13_62, L14_63
  end
end
function acWdsGroupSet(A0_69, A1_70, A2_71)
  local L3_72, L4_73, L5_74, L6_75, L7_76, L8_77, L9_78, L10_79, L11_80, L12_81, L13_82, L14_83, L15_84, L16_85, L17_86, L18_87, L19_88, L20_89, L21_90, L22_91, L23_92, L24_93, L25_94
  L3_72 = {}
  L4_73 = {}
  L5_74 = _UPVALUE0_
  L5_74 = L5_74.NIL
  L6_75 = _UPVALUE0_
  L6_75 = L6_75.NIL
  L7_76 = UNIT_NAME
  if L7_76 == "DSR-1000AC" then
    L7_76 = getdefaultAP
    L8_77 = A0_69
    L7_76(L8_77)
  end
  L7_76 = nil
  L8_77 = db
  L8_77 = L8_77.getAttribute
  L9_78 = radioTable
  L10_79 = _UPVALUE1_
  L10_79 = L10_79.ROW_ID
  L11_80 = A0_69
  L12_81 = _UPVALUE1_
  L12_81 = L12_81.wdsEnabled
  L8_77 = L8_77(L9_78, L10_79, L11_80, L12_81)
  if A1_70 == nil then
    L9_78 = _UPVALUE0_
    L9_78 = L9_78.INVALID_ARGUMENT
    return L9_78
  end
  L9_78 = _UPVALUE2_
  L9_78 = L9_78.booleanCheck
  L10_79 = A1_70
  L9_78 = L9_78(L10_79)
  L7_76 = L9_78
  L9_78 = _UPVALUE0_
  L9_78 = L9_78.SUCCESS
  if L7_76 ~= L9_78 then
    L9_78 = _UPVALUE0_
    L9_78 = L9_78.INVALID_ARGUMENT
    return L9_78
  end
  L9_78 = db
  L9_78 = L9_78.getAttribute
  L10_79 = vapTable
  L11_80 = _UPVALUE1_
  L11_80 = L11_80.vapName
  L12_81 = _UPVALUE1_
  L12_81 = L12_81.defaultAP
  L13_82 = _UPVALUE1_
  L13_82 = L13_82.vapEnabled
  L9_78 = L9_78(L10_79, L11_80, L12_81, L13_82)
  L10_79 = _UPVALUE0_
  L10_79 = L10_79.NIL
  if L9_78 ~= L10_79 then
    L10_79 = tonumber
    L11_80 = L9_78
    L10_79 = L10_79(L11_80)
    if L10_79 == 0 then
      L10_79 = _UPVALUE3_
      L10_79 = L10_79.WDS_IS_CONFIGURED_ERR2
      L11_80 = A0_69
      return L10_79, L11_80
    end
  end
  L10_79 = db
  L10_79 = L10_79.getAttribute
  L11_80 = vapTable
  L12_81 = _UPVALUE1_
  L12_81 = L12_81.vapName
  L13_82 = _UPVALUE1_
  L13_82 = L13_82.defaultAP
  L14_83 = _UPVALUE1_
  L14_83 = L14_83.profileName
  L10_79 = L10_79(L11_80, L12_81, L13_82, L14_83)
  L11_80 = db
  L11_80 = L11_80.getAttribute
  L12_81 = profileTable
  L13_82 = _UPVALUE1_
  L13_82 = L13_82.profileName
  L14_83 = L10_79
  L15_84 = _UPVALUE1_
  L15_84 = L15_84.security
  L11_80 = L11_80(L12_81, L13_82, L14_83, L15_84)
  L11_80 = L11_80 or ""
  L12_81 = os
  L12_81 = L12_81.execute
  L13_82 = _UPVALUE4_
  L14_83 = " "
  L15_84 = _UPVALUE5_
  L16_85 = A0_69 - 1
  L17_86 = " key off"
  L13_82 = L13_82 .. L14_83 .. L15_84 .. L16_85 .. L17_86
  L12_81(L13_82)
  L12_81 = UNIT_NAME
  if L12_81 ~= "DSR-1000AC" then
    L12_81 = UNIT_NAME
  elseif L12_81 == "DSR-500AC" and L8_77 ~= A1_70 then
    if A1_70 == "1" then
      L12_81 = bridgeCreate
      L13_82 = A0_69 - 1
      L13_82 = L12_81(L13_82)
      statCode = L13_82
      L7_76 = L12_81
    elseif A1_70 == "0" then
      L12_81 = bridgeDelete
      L13_82 = A0_69 - 1
      L13_82 = L12_81(L13_82)
      statCode = L13_82
      L7_76 = L12_81
    end
  end
  L12_81 = radioTable
  L13_82 = "."
  L14_83 = _UPVALUE1_
  L14_83 = L14_83.wdsEnabled
  L12_81 = L12_81 .. L13_82 .. L14_83
  L3_72[L12_81] = A1_70
  L12_81 = _UPVALUE0_
  L12_81 = L12_81.NIL
  if A2_71 ~= L12_81 then
    L12_81 = util
    L12_81 = L12_81.isAllMasked
    L13_82 = A2_71
    L12_81 = L12_81(L13_82)
    if L12_81 then
      L12_81 = db
      L12_81 = L12_81.getAttribute
      L13_82 = radioTable
      L14_83 = _UPVALUE1_
      L14_83 = L14_83.ROW_ID
      L15_84 = A0_69
      L16_85 = _UPVALUE1_
      L16_85 = L16_85.wdsPskPassAscii
      L12_81 = L12_81(L13_82, L14_83, L15_84, L16_85)
      A2_71 = L12_81
    end
  end
  L12_81 = radioTable
  L13_82 = "."
  L14_83 = _UPVALUE1_
  L14_83 = L14_83.wdsPskPassAscii
  L12_81 = L12_81 .. L13_82 .. L14_83
  L3_72[L12_81] = A2_71
  L12_81, L13_82 = nil, nil
  L14_83 = db
  L14_83 = L14_83.update
  L15_84 = radioTable
  L16_85 = L3_72
  L17_86 = A0_69
  L16_85 = L14_83(L15_84, L16_85, L17_86)
  if L14_83 == nil then
    L17_86 = _UPVALUE0_
    L17_86 = L17_86.FAILURE
    L18_87 = A0_69
    return L17_86, L18_87
  end
  if L16_85 == "NOUPDATES" then
    L17_86 = os
    L17_86 = L17_86.execute
    L18_87 = "rm -f /var/wdsPageAccessed"
    L17_86(L18_87)
  end
  L17_86 = db
  L17_86 = L17_86.getTable
  L18_87 = wdsPeersTable
  L17_86 = L17_86(L18_87, L19_88)
  L18_87 = 0
  for L22_91, L23_92 in L19_88(L20_89) do
    L18_87 = L18_87 + 1
    L24_93 = L17_86[L18_87]
    if L11_80 == "OPEN" or L11_80 == "WEP" then
      L25_94 = _UPVALUE1_
      L25_94 = L25_94.pskPassAscii
      L25_94 = L24_93[L25_94]
      if L25_94 == "" then
        L25_94 = _UPVALUE1_
        L25_94 = L25_94.pairwiseCipher
        L25_94 = L24_93[L25_94]
      elseif L25_94 ~= "" then
        L25_94 = db
        L25_94 = L25_94.getRow
        L25_94 = L25_94(wdsPeersTable, _UPVALUE1_.ROW_ID, L24_93[_UPVALUE1_.ROW_ID])
        L25_94[wdsPeersTable .. "." .. _UPVALUE1_.pskPassAscii] = ""
        L25_94[wdsPeersTable .. "." .. _UPVALUE1_.pairwiseCipher] = ""
        if db.update(wdsPeersTable, L25_94, L24_93[_UPVALUE1_.ROW_ID]) == nil then
          return _UPVALUE0_.FAILURE, A0_69
        end
      end
    else
      L25_94 = _UPVALUE0_
      L25_94 = L25_94.NIL
      if A2_71 ~= L25_94 then
        L25_94 = _UPVALUE1_
        L25_94 = L25_94.pskPassAscii
        L25_94 = L24_93[L25_94]
        if A2_71 ~= L25_94 then
          L25_94 = db
          L25_94 = L25_94.setAttribute
          L25_94 = L25_94(wdsPeersTable, _UPVALUE1_.ROW_ID, L24_93[_UPVALUE1_.ROW_ID], _UPVALUE1_.pskPassAscii, A2_71)
          L14_83 = L25_94
        end
      end
    end
    L25_94 = UNIT_NAME
    if L25_94 ~= "DSR-1000AC" then
      L25_94 = UNIT_NAME
      if L25_94 ~= "DSR-500AC" and L8_77 ~= A1_70 then
        if A1_70 == "1" then
          L25_94 = bridgeCreate
          statCode, L25_94 = L24_93[_UPVALUE1_.wdsIndexNo] - 1, L25_94(L24_93[_UPVALUE1_.wdsIndexNo] - 1)
          L14_83 = L25_94
        elseif A1_70 == "0" then
          L25_94 = bridgeDelete
          statCode, L25_94 = L24_93[_UPVALUE1_.wdsIndexNo] - 1, L25_94(L24_93[_UPVALUE1_.wdsIndexNo] - 1)
          L14_83 = L25_94
        end
      end
    end
  end
  L22_91 = _UPVALUE1_
  L22_91 = L22_91.defaultAP
  L23_92 = _UPVALUE1_
  L23_92 = L23_92.profileName
  L6_75 = L19_88
  if L6_75 == nil then
    return L19_88, L20_89
  end
  L22_91 = "='"
  L23_92 = L6_75
  L24_93 = "'"
  L4_73 = L19_88
  if L14_83 and L4_73 ~= nil then
    if A1_70 == "1" then
      if L19_88 == "WEP" then
        L22_91 = _UPVALUE4_
        L23_92 = " "
        L24_93 = _UPVALUE5_
        L25_94 = A0_69 - 1
        L22_91 = L22_91 .. L23_92 .. L24_93 .. L25_94 .. " key " .. L4_73[L20_89]
        L21_90(L22_91)
      end
    end
    return L19_88, L20_89
  else
    return L19_88, L20_89
  end
end
function wdsGroupCreate(A0_95, A1_96)
  return _UPVALUE0_.NOT_SUPPORTED
end
function wdsGroupDelete(A0_97)
  return _UPVALUE0_.NOT_SUPPORTED
end
function wdsPeerGroupCreate(A0_98)
  local L1_99, L2_100, L3_101, L4_102, L5_103, L6_104, L7_105, L8_106, L9_107, L10_108, L11_109, L12_110
  L1_99 = {}
  L2_100 = false
  L3_101 = 4
  L4_102 = UNIT_NAME
  if L4_102 ~= "DSR-150N" then
    L4_102 = UNIT_NAME
    if L4_102 == "DSR-250N" then
      L4_102 = HW_SER
    end
  elseif L4_102 == "Bx" then
    L3_101 = 3
  end
  L4_102 = db
  L4_102 = L4_102.getTable
  L5_103 = wdsPeersTable
  L6_104 = false
  L4_102 = L4_102(L5_103, L6_104)
  if L4_102 ~= nil then
    L5_103 = #L4_102
    L6_104 = L3_101 - 1
    if L5_103 > L6_104 then
      L5_103 = _UPVALUE0_
      L5_103 = L5_103.MAX_WDS_REACHED
      return L5_103
    end
  end
  L5_103 = _UPVALUE1_
  L5_103 = L5_103.NIL
  if A0_98 == L5_103 then
    L5_103 = _UPVALUE1_
    L5_103 = L5_103.INVALID_ARGUMENT
    return L5_103
  end
  L5_103 = db
  L5_103 = L5_103.getAttribute
  L6_104 = wdsPeersTable
  L7_105 = _UPVALUE2_
  L7_105 = L7_105.macAddress
  L8_106 = A0_98
  L9_107 = _UPVALUE2_
  L9_107 = L9_107.macAddress
  L5_103 = L5_103(L6_104, L7_105, L8_106, L9_107)
  if L5_103 ~= nil then
    L6_104 = _UPVALUE0_
    L6_104 = L6_104.MAC_ALREADY_IN_USE
    return L6_104
  end
  L6_104 = wdsPeersTable
  L7_105 = "."
  L8_106 = _UPVALUE2_
  L8_106 = L8_106.macAddress
  L6_104 = L6_104 .. L7_105 .. L8_106
  L1_99[L6_104] = A0_98
  L6_104 = db
  L6_104 = L6_104.getAttribute
  L7_105 = vapTable
  L8_106 = _UPVALUE2_
  L8_106 = L8_106.ROW_ID
  L9_107 = "1"
  L10_108 = _UPVALUE2_
  L10_108 = L10_108.profileName
  L6_104 = L6_104(L7_105, L8_106, L9_107, L10_108)
  L7_105 = db
  L7_105 = L7_105.getAttribute
  L8_106 = profileTable
  L9_107 = _UPVALUE2_
  L9_107 = L9_107.profileName
  L10_108 = L6_104
  L11_109 = _UPVALUE2_
  L11_109 = L11_109.pairwiseCiphers
  L7_105 = L7_105(L8_106, L9_107, L10_108, L11_109)
  L7_105 = L7_105 or ""
  L8_106 = db
  L8_106 = L8_106.getAttribute
  L9_107 = profileTable
  L10_108 = _UPVALUE2_
  L10_108 = L10_108.profileName
  L11_109 = L6_104
  L12_110 = _UPVALUE2_
  L12_110 = L12_110.security
  L8_106 = L8_106(L9_107, L10_108, L11_109, L12_110)
  L8_106 = L8_106 or ""
  L9_107 = 0
  L10_108 = UNIT_NAME
  if L10_108 ~= "DSR-150N" then
    L10_108 = UNIT_NAME
    if L10_108 == "DSR-250N" then
      L10_108 = HW_SER
    end
  elseif L10_108 == "Bx" then
    L9_107 = 1
  end
  L10_108 = string
  L10_108 = L10_108.find
  L11_109 = L7_105
  L12_110 = "+"
  L10_108 = L10_108(L11_109, L12_110)
  if L10_108 ~= nil then
    L11_109 = string
    L11_109 = L11_109.sub
    L12_110 = L7_105
    L11_109 = L11_109(L12_110, L10_108 + 1)
    L7_105 = L11_109
  end
  L11_109 = wdsPeersTable
  L12_110 = "."
  L11_109 = L11_109 .. L12_110 .. _UPVALUE2_.pairwiseCipher
  L12_110 = L7_105 or ""
  L1_99[L11_109] = L12_110
  L11_109 = wdsPeersTable
  L12_110 = "."
  L11_109 = L11_109 .. L12_110 .. _UPVALUE2_.radioNo
  L1_99[L11_109] = "1"
  L11_109 = wdsPeersTable
  L12_110 = "."
  L11_109 = L11_109 .. L12_110 .. _UPVALUE2_.ssid
  L1_99[L11_109] = "tf1WdsMagic"
  L11_109 = wdsPeersTable
  L12_110 = "."
  L11_109 = L11_109 .. L12_110 .. _UPVALUE2_.pskPassAscii
  L1_99[L11_109] = "dlink"
  L11_109 = db
  L11_109 = L11_109.getAttribute
  L12_110 = radioTable
  L11_109 = L11_109(L12_110, _UPVALUE2_.ROW_ID, "1", _UPVALUE2_.wdsEnabled)
  L11_109 = L11_109 or ""
  L12_110 = 1
  L1_99[wdsPeersTable .. "." .. _UPVALUE2_.pskPassAscii] = db.getAttribute(radioTable, _UPVALUE2_.ROW_ID, "1", _UPVALUE2_.wdsPskPassAscii)
  while true do
    if L3_101 >= L12_110 and db.existsRow(wdsPeersTable, _UPVALUE2_.wdsIndexNo, L12_110) then
      L12_110 = L12_110 + 1
      break
    end
  end
  L1_99[wdsPeersTable .. "." .. _UPVALUE2_.wdsIndexNo] = L12_110
  if L9_107 == 1 and (L8_106 == "OPEN" or L8_106 == "WEP") then
    L1_99[wdsPeersTable .. "." .. _UPVALUE2_.pairwiseCipher] = ""
    L1_99[wdsPeersTable .. "." .. _UPVALUE2_.pskPassAscii] = ""
  end
  L2_100 = db.insert(wdsPeersTable, L1_99)
  if L11_109 == "1" then
    if L1_99[wdsPeersTable .. "." .. _UPVALUE2_.wdsIndexNo] == _UPVALUE1_.NIL then
      L2_100 = _UPVALUE1_.FALSE
    end
    L2_100, statCode = bridgeCreate(L1_99[wdsPeersTable .. "." .. _UPVALUE2_.wdsIndexNo] - 1)
  end
  if L2_100 then
    return _UPVALUE1_.SUCCESS
  else
    return _UPVALUE1_.FAILURE
  end
end
function acWdsPeerGroupCreate(A0_111, A1_112)
  local L2_113, L3_114, L4_115, L5_116, L6_117, L7_118, L8_119, L9_120, L10_121, L11_122
  L2_113 = {}
  L3_114 = false
  L4_115 = 4
  L5_116 = UNIT_NAME
  if L5_116 == "DSR-150N" then
    L4_115 = 3
  end
  L5_116 = _UPVALUE0_
  L5_116 = L5_116.NIL
  if A0_111 == L5_116 then
    L5_116 = _UPVALUE0_
    L5_116 = L5_116.INVALID_ARGUMENT
    return L5_116
  end
  L5_116 = _UPVALUE0_
  L5_116 = L5_116.NIL
  if A1_112 == L5_116 then
    L5_116 = _UPVALUE0_
    L5_116 = L5_116.INVALID_ARGUMENT
    return L5_116
  end
  L5_116 = db
  L5_116 = L5_116.getAttribute
  L6_117 = wdsPeersTable
  L7_118 = _UPVALUE1_
  L7_118 = L7_118.macAddress
  L8_119 = A0_111
  L9_120 = _UPVALUE1_
  L9_120 = L9_120.macAddress
  L5_116 = L5_116(L6_117, L7_118, L8_119, L9_120)
  if L5_116 ~= nil then
    L6_117 = _UPVALUE2_
    L6_117 = L6_117.MAC_ALREADY_IN_USE
    return L6_117
  end
  L6_117 = wdsPeersTable
  L7_118 = "."
  L8_119 = _UPVALUE1_
  L8_119 = L8_119.macAddress
  L6_117 = L6_117 .. L7_118 .. L8_119
  L2_113[L6_117] = A0_111
  L6_117 = db
  L6_117 = L6_117.getAttribute
  L7_118 = vapTable
  L8_119 = _UPVALUE1_
  L8_119 = L8_119.ROW_ID
  L9_120 = A1_112
  L10_121 = _UPVALUE1_
  L10_121 = L10_121.profileName
  L6_117 = L6_117(L7_118, L8_119, L9_120, L10_121)
  L7_118 = db
  L7_118 = L7_118.getAttribute
  L8_119 = profileTable
  L9_120 = _UPVALUE1_
  L9_120 = L9_120.profileName
  L10_121 = L6_117
  L11_122 = _UPVALUE1_
  L11_122 = L11_122.pairwiseCiphers
  L7_118 = L7_118(L8_119, L9_120, L10_121, L11_122)
  L7_118 = L7_118 or ""
  L8_119 = db
  L8_119 = L8_119.getAttribute
  L9_120 = profileTable
  L10_121 = _UPVALUE1_
  L10_121 = L10_121.profileName
  L11_122 = L6_117
  L8_119 = L8_119(L9_120, L10_121, L11_122, _UPVALUE1_.security)
  L8_119 = L8_119 or ""
  L9_120 = string
  L9_120 = L9_120.find
  L10_121 = L7_118
  L11_122 = "+"
  L9_120 = L9_120(L10_121, L11_122)
  if L8_119 == "OPEN" or L8_119 == "WEP" then
    L7_118 = nil
  elseif L9_120 ~= nil then
    L10_121 = string
    L10_121 = L10_121.sub
    L11_122 = L7_118
    L10_121 = L10_121(L11_122, L9_120 + 1)
    L7_118 = L10_121
  end
  if L7_118 == "TKIP" then
    L7_118 = ""
  end
  L10_121 = wdsPeersTable
  L11_122 = "."
  L10_121 = L10_121 .. L11_122 .. _UPVALUE1_.pairwiseCipher
  L11_122 = L7_118 or ""
  L2_113[L10_121] = L11_122
  L10_121 = wdsPeersTable
  L11_122 = "."
  L10_121 = L10_121 .. L11_122 .. _UPVALUE1_.radioNo
  L2_113[L10_121] = A1_112
  L10_121 = wdsPeersTable
  L11_122 = "."
  L10_121 = L10_121 .. L11_122 .. _UPVALUE1_.ssid
  L2_113[L10_121] = "tf1WdsMagic"
  L10_121 = wdsPeersTable
  L11_122 = "."
  L10_121 = L10_121 .. L11_122 .. _UPVALUE1_.pskPassAscii
  L2_113[L10_121] = "dlink"
  L10_121 = db
  L10_121 = L10_121.getAttribute
  L11_122 = radioTable
  L10_121 = L10_121(L11_122, _UPVALUE1_.ROW_ID, A1_112, _UPVALUE1_.wdsEnabled)
  L10_121 = L10_121 or ""
  L11_122 = 1
  L2_113[wdsPeersTable .. "." .. _UPVALUE1_.pskPassAscii] = db.getAttribute(radioTable, _UPVALUE1_.ROW_ID, A1_112, _UPVALUE1_.wdsPskPassAscii)
  while true do
    if L4_115 >= L11_122 and db.getRowWhere(wdsPeersTable, "radioNo='" .. A1_112 .. "' and wdsIndexNo='" .. L11_122 .. "'") then
      L11_122 = L11_122 + 1
      break
    end
  end
  if L4_115 < L11_122 then
    return _UPVALUE2_.MAX_WDS_REACHED
  end
  L2_113[wdsPeersTable .. "." .. _UPVALUE1_.wdsIndexNo] = L11_122
  if L8_119 == "OPEN" or L8_119 == "WEP" then
    L2_113[wdsPeersTable .. "." .. _UPVALUE1_.pairwiseCipher] = ""
    L2_113[wdsPeersTable .. "." .. _UPVALUE1_.pskPassAscii] = ""
  end
  L3_114 = db.insert(wdsPeersTable, L2_113)
  if UNIT_NAME ~= "DSR-1000AC" and UNIT_NAME ~= "DSR-500AC" and L10_121 == "1" then
    if L2_113[wdsPeersTable .. "." .. _UPVALUE1_.wdsIndexNo] == _UPVALUE0_.NIL then
      L3_114 = _UPVALUE0_.FALSE
    end
    L3_114, statCode = bridgeCreate(L2_113[wdsPeersTable .. "." .. _UPVALUE1_.wdsIndexNo] - 1)
  end
  if L3_114 then
    return _UPVALUE0_.SUCCESS
  else
    return _UPVALUE0_.FAILURE
  end
end
function bridgeCreate(A0_123)
  local L1_124, L2_125, L3_126, L4_127, L5_128
  L1_124 = false
  L2_125 = "14"
  while true do
    L3_126 = db
    L3_126 = L3_126.existsRow
    L4_127 = portMgmtTable
    L5_128 = _UPVALUE0_
    L5_128 = L5_128.PortNumber
    L3_126 = L3_126(L4_127, L5_128, L2_125)
    if L3_126 then
      L3_126 = tonumber
      L4_127 = L2_125
      L3_126 = L3_126(L4_127)
      L2_125 = L3_126 + 1
      L3_126 = L2_125
      L4_127 = ""
      L2_125 = L3_126 .. L4_127
    end
  end
  L3_126 = {}
  L4_127 = bridgePortsTable
  L5_128 = "."
  L4_127 = L4_127 .. L5_128 .. _UPVALUE0_.interfaceName
  L5_128 = "wds"
  L5_128 = L5_128 .. A0_123
  L3_126[L4_127] = L5_128
  L4_127 = bridgePortsTable
  L5_128 = "."
  L4_127 = L4_127 .. L5_128 .. _UPVALUE0_.portEnabled
  L3_126[L4_127] = "1"
  L4_127 = bridgePortsTable
  L5_128 = "."
  L4_127 = L4_127 .. L5_128 .. _UPVALUE0_.bridgeInterface
  L3_126[L4_127] = "bdg"
  L4_127 = bridgePortsTable
  L5_128 = "."
  L4_127 = L4_127 .. L5_128 .. _UPVALUE0_.vlanEnabled
  L3_126[L4_127] = "0"
  L4_127 = bridgePortsTable
  L5_128 = "."
  L4_127 = L4_127 .. L5_128 .. _UPVALUE0_.vlanId
  L3_126[L4_127] = "1"
  L4_127 = bridgePortsTable
  L5_128 = "."
  L4_127 = L4_127 .. L5_128 .. _UPVALUE0_.trunk
  L3_126[L4_127] = "1"
  L4_127 = db
  L4_127 = L4_127.insert
  L5_128 = bridgePortsTable
  L4_127 = L4_127(L5_128, L3_126)
  L1_124 = L4_127
  if L1_124 then
    L4_127 = {}
    L5_128 = portMgmtTable
    L5_128 = L5_128 .. "." .. _UPVALUE0_.PortNumber
    L4_127[L5_128] = L2_125
    L5_128 = portMgmtTable
    L5_128 = L5_128 .. "." .. _UPVALUE0_.PortName
    L4_127[L5_128] = "dummy"
    L5_128 = portMgmtTable
    L5_128 = L5_128 .. "." .. _UPVALUE0_.PortLogicalName
    L4_127[L5_128] = "port" .. tonumber(L2_125) + 1
    L5_128 = portMgmtTable
    L5_128 = L5_128 .. "." .. _UPVALUE0_.PortType
    L4_127[L5_128] = "BRIDGE"
    L5_128 = portMgmtTable
    L5_128 = L5_128 .. "." .. _UPVALUE0_.PhyInterfaceName
    L4_127[L5_128] = "wds" .. A0_123
    L5_128 = UNIT_NAME
    if L5_128 ~= "DSR-1000AC" then
      L5_128 = UNIT_NAME
      if L5_128 ~= "DSR-500AC" then
        L5_128 = portMgmtTable
        L5_128 = L5_128 .. "." .. _UPVALUE0_.PortVlanMode
        L4_127[L5_128] = "2"
      end
    else
      L5_128 = portMgmtTable
      L5_128 = L5_128 .. "." .. _UPVALUE0_.PortVlanMode
      L4_127[L5_128] = "0"
    end
    L5_128 = portMgmtTable
    L5_128 = L5_128 .. "." .. _UPVALUE0_.DefaultPVID
    L4_127[L5_128] = "1"
    L5_128 = db
    L5_128 = L5_128.insert
    L5_128 = L5_128(portMgmtTable, L4_127)
    L1_124 = L5_128
  end
  if L1_124 then
    L4_127 = {}
    L5_128 = vlanTable
    L5_128 = L5_128 .. "." .. _UPVALUE0_.portName
    L4_127[L5_128] = "port" .. tonumber(L2_125) + 1
    L5_128 = db
    L5_128 = L5_128.getTable
    L5_128 = L5_128(vlanTable, _UPVALUE1_.FALSE)
    for _FORV_10_, _FORV_11_ in pairs(L5_128) do
      if L5_128[0 + 1][_UPVALUE0_.portName] == "dummy" then
        L4_127[vlanTable .. "." .. _UPVALUE0_.vlanId] = L5_128[0 + 1][_UPVALUE0_.vlanId]
        L4_127[vlanTable .. "." .. _UPVALUE0_.vlanName] = L5_128[0 + 1][_UPVALUE0_.vlanName]
        L1_124 = L1_124 and db.insert(vlanTable, L4_127)
      end
    end
  end
  L4_127 = L1_124
  L5_128 = statCode
  return L4_127, L5_128
end
function bridgeDelete(A0_129)
  local L1_130, L2_131
  L1_130 = _UPVALUE0_
  L1_130 = L1_130.FALSE
  L2_131 = db
  L2_131 = L2_131.getAttribute
  L2_131 = L2_131(portMgmtTable, _UPVALUE1_.PhyInterfaceName, "wds" .. A0_129, "PortLogicalName")
  L2_131 = L2_131 or ""
  L1_130 = db.deleteRow(vlanTable, _UPVALUE1_.portName, L2_131)
  L1_130 = L1_130 and db.deleteRow(portMgmtTable, _UPVALUE1_.PhyInterfaceName, "wds" .. A0_129)
  L1_130 = L1_130 and db.deleteRow(bridgePortsTable, _UPVALUE1_.interfaceName, "wds" .. A0_129)
  return L1_130, statCode
end
function wdsGroupGetCur(A0_132)
  local L1_133, L2_134, L3_135, L4_136, L5_137, L6_138, L7_139, L8_140, L9_141, L10_142, L11_143, L12_144, L13_145, L14_146, L15_147
  L7_139 = {}
  L8_140 = UNIT_NAME
  if L8_140 == "DSR-1000AC" then
    L8_140 = getdefaultAP
    L9_141 = A0_132
    L8_140(L9_141)
  end
  L8_140 = db
  L8_140 = L8_140.getRow
  L9_141 = radioTable
  L10_142 = _UPVALUE0_
  L10_142 = L10_142.ROW_ID
  L11_143 = A0_132
  L8_140 = L8_140(L9_141, L10_142, L11_143)
  L9_141 = _UPVALUE1_
  L9_141 = L9_141.NIL
  if L8_140 == L9_141 then
    L9_141 = _UPVALUE1_
    L9_141 = L9_141.FAILURE
    return L9_141
  end
  L9_141 = radioTable
  L10_142 = "."
  L11_143 = _UPVALUE0_
  L11_143 = L11_143.wdsEnabled
  L9_141 = L9_141 .. L10_142 .. L11_143
  L1_133 = L8_140[L9_141]
  L9_141 = radioTable
  L10_142 = "."
  L11_143 = _UPVALUE0_
  L11_143 = L11_143.wdsPskPassAscii
  L9_141 = L9_141 .. L10_142 .. L11_143
  L9_141 = L8_140[L9_141]
  L10_142 = _UPVALUE1_
  L10_142 = L10_142.NIL
  if L9_141 ~= L10_142 then
    L10_142 = radioTable
    L11_143 = "."
    L12_144 = _UPVALUE0_
    L12_144 = L12_144.wdsPskPassAscii
    L10_142 = L10_142 .. L11_143 .. L12_144
    L11_143 = util
    L11_143 = L11_143.mask
    L12_144 = radioTable
    L13_145 = "."
    L14_146 = _UPVALUE0_
    L14_146 = L14_146.wdsPskPassAscii
    L12_144 = L12_144 .. L13_145 .. L14_146
    L12_144 = L8_140[L12_144]
    L11_143 = L11_143(L12_144)
    L8_140[L10_142] = L11_143
    L10_142 = radioTable
    L11_143 = "."
    L12_144 = _UPVALUE0_
    L12_144 = L12_144.wdsPskPassAscii
    L10_142 = L10_142 .. L11_143 .. L12_144
    L5_137 = L8_140[L10_142]
  end
  L10_142 = db
  L10_142 = L10_142.getAttribute
  L11_143 = vapTable
  L12_144 = _UPVALUE0_
  L12_144 = L12_144.vapName
  L13_145 = _UPVALUE0_
  L13_145 = L13_145.defaultAP
  L14_146 = _UPVALUE0_
  L14_146 = L14_146.profileName
  L10_142 = L10_142(L11_143, L12_144, L13_145, L14_146)
  L11_143 = db
  L11_143 = L11_143.getRowWhere
  L12_144 = profileTable
  L13_145 = _UPVALUE0_
  L13_145 = L13_145.profileName
  L14_146 = "='"
  L15_147 = L10_142
  L13_145 = L13_145 .. L14_146 .. L15_147 .. "'"
  L11_143 = L11_143(L12_144, L13_145)
  L12_144 = profileTable
  L13_145 = "."
  L14_146 = _UPVALUE0_
  L14_146 = L14_146.pairwiseCiphers
  L12_144 = L12_144 .. L13_145 .. L14_146
  L12_144 = L11_143[L12_144]
  L2_134 = L12_144 or ""
  L12_144 = profileTable
  L13_145 = "."
  L14_146 = _UPVALUE0_
  L14_146 = L14_146.authMethods
  L12_144 = L12_144 .. L13_145 .. L14_146
  L12_144 = L11_143[L12_144]
  L4_136 = L12_144 or ""
  L12_144 = profileTable
  L13_145 = "."
  L14_146 = _UPVALUE0_
  L14_146 = L14_146.security
  L12_144 = L12_144 .. L13_145 .. L14_146
  L3_135 = L11_143[L12_144]
  L12_144 = profileTable
  L13_145 = "."
  L14_146 = _UPVALUE0_
  L14_146 = L14_146.security
  L12_144 = L12_144 .. L13_145 .. L14_146
  L12_144 = L11_143[L12_144]
  if L12_144 == "OPEN" then
    L2_134 = "None"
    L4_136 = "None"
  else
    L12_144 = profileTable
    L13_145 = "."
    L14_146 = _UPVALUE0_
    L14_146 = L14_146.security
    L12_144 = L12_144 .. L13_145 .. L14_146
    L12_144 = L11_143[L12_144]
    if L12_144 == "WEP" then
      L12_144 = profileTable
      L13_145 = "."
      L14_146 = _UPVALUE0_
      L14_146 = L14_146.groupCipher
      L12_144 = L12_144 .. L13_145 .. L14_146
      L12_144 = L11_143[L12_144]
      L2_134 = L12_144 or ""
      L12_144 = profileTable
      L13_145 = "."
      L14_146 = _UPVALUE0_
      L14_146 = L14_146.wepAuth
      L12_144 = L12_144 .. L13_145 .. L14_146
      L12_144 = L11_143[L12_144]
      L4_136 = L12_144 or ""
    end
  end
  L12_144 = ""
  L13_145 = UNIT_NAME
  if L13_145 == "DSR-250N" then
    L13_145 = HW_SER
    if L13_145 ~= "Bx" then
      L13_145 = io
      L13_145 = L13_145.popen
      L14_146 = "/sbin/ifconfig vap0 | grep 'HWaddr' | cut -d' ' -f 11"
      L13_145 = L13_145(L14_146)
      L12_144 = L13_145
    end
  else
    L13_145 = UNIT_NAME
    if L13_145 ~= "DSR-1000AC" then
      L13_145 = UNIT_NAME
      if L13_145 ~= "DSR-500AC" then
        L13_145 = io
        L13_145 = L13_145.popen
        L14_146 = "/sbin/ifconfig wifi0 | grep 'HWaddr' | cut -d' ' -f 10"
        L13_145 = L13_145(L14_146)
        L12_144 = L13_145
      end
    else
      L13_145 = radioTable
      L14_146 = "."
      L15_147 = _UPVALUE0_
      L15_147 = L15_147.interfaceName
      L13_145 = L13_145 .. L14_146 .. L15_147
      L13_145 = L8_140[L13_145]
      L14_146 = "/sbin/ifconfig "
      L15_147 = L13_145
      L14_146 = L14_146 .. L15_147 .. " | grep 'HWaddr' | cut -d' ' -f 10"
      L15_147 = io
      L15_147 = L15_147.popen
      L15_147 = L15_147(L14_146)
      L12_144 = L15_147
    end
  end
  L13_145 = ""
  L15_147 = L12_144
  L14_146 = L12_144.read
  L14_146 = L14_146(L15_147, "*all")
  L15_147 = L12_144.close
  L15_147(L12_144)
  if L14_146 then
    L15_147 = UNIT_NAME
    if L15_147 ~= "DSR-1000AC" then
      L15_147 = UNIT_NAME
      if L15_147 ~= "DSR-500AC" then
        L13_145 = L14_146
      end
    else
      L15_147 = string
      L15_147 = L15_147.gsub
      L15_147 = L15_147(L14_146, "%-00%-00%-00%-00%-00%-00%-00%-00%-00%-00", "")
      L15_147 = string.gsub(L15_147, "%-", ":")
      L13_145 = L15_147
    end
  end
  L15_147 = UNIT_NAME
  if L15_147 ~= "DSR-1000AC" then
    L15_147 = UNIT_NAME
    if L15_147 ~= "DSR-500AC" then
      L15_147 = db
      L15_147 = L15_147.getTable
      L15_147 = L15_147(_UPVALUE2_)
      L7_139 = L15_147
    end
  else
    L15_147 = _UPVALUE0_
    L15_147 = L15_147.radioNo
    L15_147 = L15_147 .. "='" .. A0_132 .. "'"
    L7_139 = db.getRowsWhere(_UPVALUE2_, L15_147)
  end
  if L7_139 == nil then
    L15_147 = _UPVALUE1_
    L15_147 = L15_147.FAILURE
    return L15_147
  end
  L15_147 = db
  L15_147 = L15_147.getAttribute
  L15_147 = L15_147(vapTable, _UPVALUE0_.vapName, _UPVALUE0_.defaultAP, _UPVALUE0_.vapEnabled)
  if L15_147 ~= _UPVALUE1_.NIL and tonumber(L15_147) == 0 then
    return _UPVALUE3_.WDS_IS_CONFIGURED_ERR2, A0_132, L1_133, L2_134, L3_135, L4_136, L5_137, L13_145, L7_139
  end
  return _UPVALUE1_.SUCCESS, A0_132, L1_133, L2_134, L3_135, L4_136, L5_137, L13_145, L7_139
end
function wdsPeerGroupGetAll()
  local L0_148
  L0_148 = db
  L0_148 = L0_148.getTable
  L0_148 = L0_148(wdsPeersTable, _UPVALUE0_.FALSE)
  if L0_148 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_148
end
function wdsPeerGroupDelete(A0_149)
  local L1_150, L2_151, L3_152, L4_153, L5_154
  L1_150 = {}
  L2_151 = false
  L3_152 = 4
  L4_153 = UNIT_NAME
  if L4_153 == "DSR-150N" then
    L3_152 = 3
  end
  L4_153 = UNIT_NAME
  if L4_153 ~= "DSR-1000AC" then
    L4_153 = UNIT_NAME
    if L4_153 ~= "DSR-500AC" then
      L4_153 = db
      L4_153 = L4_153.getAttribute
      L5_154 = radioTable
      L4_153 = L4_153(L5_154, _UPVALUE0_.ROW_ID, "1", _UPVALUE0_.wdsEnabled)
      L4_153 = L4_153 or ""
      if L4_153 == "1" then
        L5_154 = db
        L5_154 = L5_154.getAttribute
        L5_154 = L5_154(wdsPeersTable, _UPVALUE0_.ROW_ID, A0_149, _UPVALUE0_.wdsIndexNo)
        L2_151, statCode = bridgeDelete(tonumber(L5_154) - 1)
        if L2_151 == _UPVALUE1_.FALSE then
          return dot11ReturnCodes.BRIDGE_DELETE_FAILED
        end
      end
    end
  end
  L4_153 = db
  L4_153 = L4_153.deleteRow
  L5_154 = wdsPeersTable
  L4_153 = L4_153(L5_154, _UPVALUE0_.ROW_ID, A0_149)
  L5_154 = _UPVALUE1_
  L5_154 = L5_154.NIL
  if L4_153 == L5_154 then
    L5_154 = _UPVALUE1_
    L5_154 = L5_154.FAILURE
    return L5_154, A0_149
  end
  L5_154 = _UPVALUE1_
  L5_154 = L5_154.SUCCESS
  return L5_154, A0_149
end
function wdsPeerGroupDeleteAll()
  local L0_155, L1_156, L2_157, L3_158, L4_159, L5_160, L6_161, L7_162, L8_163, L9_164, L10_165
  L0_155 = {}
  L1_156 = false
  L2_157 = 4
  L3_158 = UNIT_NAME
  if L3_158 == "DSR-150N" then
    L2_157 = 3
  end
  L3_158 = UNIT_NAME
  if L3_158 ~= "DSR-1000AC" then
    L3_158 = UNIT_NAME
    if L3_158 ~= "DSR-500AC" then
      L3_158 = db
      L3_158 = L3_158.getAttribute
      L4_159 = radioTable
      L3_158 = L3_158(L4_159, L5_160, L6_161, L7_162)
      L3_158 = L3_158 or ""
      L4_159 = db
      L4_159 = L4_159.getTable
      L4_159 = L4_159(L5_160, L6_161)
      if L3_158 == "1" then
        for L8_163, L9_164 in L5_160(L6_161) do
          L10_165 = db
          L10_165 = L10_165.getAttribute
          L10_165 = L10_165(wdsPeersTable, _UPVALUE0_.ROW_ID, L9_164[_UPVALUE0_.ROW_ID], _UPVALUE0_.wdsIndexNo)
          L1_156, statCode = bridgeDelete(tonumber(L10_165) - 1)
          if L1_156 == _UPVALUE1_.FALSE then
            break
          end
        end
      end
    end
  end
  L3_158 = db
  L3_158 = L3_158.deleteAllRows
  L4_159 = wdsPeersTable
  L3_158 = L3_158(L4_159)
  L4_159 = _UPVALUE1_
  L4_159 = L4_159.NIL
  if L3_158 == L4_159 then
    L4_159 = _UPVALUE1_
    L4_159 = L4_159.FAILURE
    return L4_159, L5_160
  end
  L4_159 = _UPVALUE1_
  L4_159 = L4_159.SUCCESS
  return L4_159, L5_160
end
function acWdsRadio_vap_restart(A0_166, A1_167)
  local L2_168, L3_169, L4_170, L5_171, L6_172, L7_173, L8_174, L9_175, L10_176, L11_177, L12_178, L13_179
  L2_168 = _UPVALUE0_
  L2_168 = L2_168.TRUE
  L3_169 = UNIT_NAME
  if L3_169 == "DSR-1000AC" then
    L3_169 = getdefaultAP
    L4_170 = A0_166
    L3_169(L4_170)
  end
  L3_169 = db
  L3_169 = L3_169.getAttribute
  L4_170 = radioTable
  L5_171 = _UPVALUE1_
  L5_171 = L5_171.ROW_ID
  L6_172 = A0_166
  L7_173 = _UPVALUE1_
  L7_173 = L7_173.wdsEnabled
  L3_169 = L3_169(L4_170, L5_171, L6_172, L7_173)
  if A1_167 == nil then
    L4_170 = _UPVALUE0_
    L4_170 = L4_170.INVALID_ARGUMENT
    return L4_170
  end
  L4_170 = _UPVALUE2_
  L4_170 = L4_170.booleanCheck
  L5_171 = A1_167
  L4_170 = L4_170(L5_171)
  L2_168 = L4_170
  L4_170 = _UPVALUE0_
  L4_170 = L4_170.SUCCESS
  if L2_168 ~= L4_170 then
    L4_170 = _UPVALUE0_
    L4_170 = L4_170.INVALID_ARGUMENT
    return L4_170
  end
  L4_170 = db
  L4_170 = L4_170.getAttribute
  L5_171 = vapTable
  L6_172 = _UPVALUE1_
  L6_172 = L6_172.vapName
  L7_173 = _UPVALUE1_
  L7_173 = L7_173.defaultAP
  L4_170 = L4_170(L5_171, L6_172, L7_173, L8_174)
  L5_171 = _UPVALUE0_
  L5_171 = L5_171.NIL
  if L4_170 ~= L5_171 then
    L5_171 = tonumber
    L6_172 = L4_170
    L5_171 = L5_171(L6_172)
    if L5_171 == 0 then
      L5_171 = _UPVALUE3_
      L5_171 = L5_171.WDS_IS_CONFIGURED_ERR2
      L6_172 = A0_166
      return L5_171, L6_172
    end
  end
  L5_171 = UNIT_NAME
  if L5_171 == "DSR-1000AC" then
    L5_171 = getdefaultInterface
    L6_172 = A0_166
    L5_171(L6_172)
    L5_171 = _UPVALUE1_
    L5_171 = L5_171.defaultInterface
    L6_172 = db
    L6_172 = L6_172.getAttribute
    L7_173 = interfaceTable
    L6_172 = L6_172(L7_173, L8_174, L9_175, L10_176)
    if L6_172 == "unused" then
      L7_173 = _UPVALUE3_
      L7_173 = L7_173.DEFAULT_IDENTITY_CHANGED
      return L7_173
    end
  end
  if L3_169 ~= A1_167 and A1_167 == "1" then
    L5_171 = db
    L5_171 = L5_171.getAttribute
    L6_172 = radioTable
    L7_173 = _UPVALUE1_
    L7_173 = L7_173.ROW_ID
    L5_171 = L5_171(L6_172, L7_173, L8_174, L9_175)
    L6_172 = db
    L6_172 = L6_172.setAttribute
    L7_173 = radioTable
    L11_177 = L5_171
    L6_172 = L6_172(L7_173, L8_174, L9_175, L10_176, L11_177)
    L2_168 = L6_172
    if not L2_168 then
      L6_172 = _UPVALUE0_
      L6_172 = L6_172.FAILURE
      L7_173 = A0_166
      return L6_172, L7_173
    end
    L6_172 = db
    L6_172 = L6_172.getAttribute
    L7_173 = radio11nTable
    L6_172 = L6_172(L7_173, L8_174, L9_175, L10_176)
    L7_173 = db
    L7_173 = L7_173.setAttribute
    L11_177 = _UPVALUE1_
    L11_177 = L11_177.ROW_ID
    L12_178 = L6_172
    L7_173 = L7_173(L8_174, L9_175, L10_176, L11_177, L12_178)
    L2_168 = L7_173
    if not L2_168 then
      L7_173 = _UPVALUE0_
      L7_173 = L7_173.FAILURE
      return L7_173, L8_174
    end
    L7_173 = db
    L7_173 = L7_173.getTable
    L7_173 = L7_173(L8_174, L9_175)
    for L11_177, L12_178 in L8_174(L9_175) do
      L13_179 = _UPVALUE1_
      L13_179 = L13_179.vapEnabled
      L13_179 = L12_178[L13_179]
      if L13_179 == "1" then
        L13_179 = db
        L13_179 = L13_179.setAttribute
        L13_179 = L13_179(vapTable, _UPVALUE1_.ROW_ID, L12_178[_UPVALUE1_.ROW_ID], _UPVALUE1_.vapEnabled, 1)
        L2_168 = L13_179
      end
      if not L2_168 then
        L13_179 = _UPVALUE0_
        L13_179 = L13_179.FAILURE
        return L13_179, A0_166
      end
      L13_179 = _UPVALUE1_
      L13_179 = L13_179.vapEnabled
      L13_179 = L12_178[L13_179]
      if L13_179 == "1" then
        L13_179 = _UPVALUE4_
        L13_179 = L13_179.vapPortEnableSet
        L13_179 = L13_179(L12_178[_UPVALUE1_.apName], true)
        L2_168 = L13_179
      else
        L13_179 = _UPVALUE1_
        L13_179 = L13_179.vapEnabled
        L13_179 = L12_178[L13_179]
        if L13_179 == "0" then
          L13_179 = _UPVALUE4_
          L13_179 = L13_179.vapPortEnableSet
          L13_179 = L13_179(L12_178[_UPVALUE1_.apName], _UPVALUE0_.FALSE)
          L2_168 = L13_179
        end
      end
      L13_179 = db
      L13_179 = L13_179.getAttribute
      L13_179 = L13_179(profileTable, _UPVALUE1_.profileName, L12_178[_UPVALUE1_.profileName], _UPVALUE1_.ssid)
      if L12_178[_UPVALUE1_.vapEnabled] == "1" then
        L2_168 = _UPVALUE4_.vlanPeerSSIDSet(L12_178[_UPVALUE1_.apName], L13_179, _UPVALUE1_.bridge)
      elseif L12_178[_UPVALUE1_.vapEnabled] == "0" then
        L2_168 = _UPVALUE4_.vlanPeerSSIDSet(L12_178[_UPVALUE1_.apName], L13_179, _UPVALUE1_.vapDisabled)
      end
    end
  end
  if L2_168 then
    L5_171 = _UPVALUE0_
    L5_171 = L5_171.SUCCESS
    L6_172 = A0_166
    return L5_171, L6_172
  else
    L5_171 = _UPVALUE0_
    L5_171 = L5_171.FAILURE
    L6_172 = A0_166
    return L5_171, L6_172
  end
end
