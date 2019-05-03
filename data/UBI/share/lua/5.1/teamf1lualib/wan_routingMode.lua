local L0_0
L0_0 = module
L0_0("com.teamf1.core.wan.routingmode", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/nimf_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).routingMode = "Enable"
;({}).accessMgmt = "accessMgmtEnable"
;({}).LogicalIfName = "LogicalIfName"
;({}).interfaceName = "logicalIfName"
;({}).dhcpEnabled = "dhcpEnabled"
;({}).DhcpRelayStatus = "DhcpRelayStatus"
;({}).RelayGateway = "RelayGateway"
;({}).pptpRoutingMode = "pptpRoutingMode"
;({}).l2tpRoutingMode = "l2tpRoutingMode"
function accessManagementUpdate()
  local L0_1, L1_2
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L1_2 = _UPVALUE0_
  L0_1 = L0_1(L1_2, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.accessMgmt)
  L1_2 = _UPVALUE4_
  L1_2 = L1_2.NIL
  if L0_1 == L1_2 then
    L1_2 = _UPVALUE4_
    L1_2 = L1_2.FAILURE
    return L1_2
  end
  L1_2 = ENABLE
  if L0_1 == L1_2 then
    L1_2 = nil
    L1_2 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.accessMgmt, L0_1)
    if L1_2 == _UPVALUE4_.FAILURE then
      return _UPVALUE4_.FAILURE, cookie
    end
  end
  L1_2 = _UPVALUE4_
  L1_2 = L1_2.SUCCESS
  return L1_2
end
;({}).routingMode = "Enable"
;({}).natInterface = "NATInterfaces"
;({}).routedInterface = "RoutedInterfaces"
;({}).bridgeVLANID = "BridgeVlan"
;({}).vlanPortName = "portName"
;({}).vlanID = "vlanId"
;({}).nameofVlan = "vlanName"
;({}).vlanInternal = "vlanInternal"
;({}).ifaceName = "interfaceName"
;({}).vlanIdofBridge = "bridgeIndex"
;({}).macAddress = "macAddress"
;({}).LogicalIfName = "LogicalIfName"
;({}).AddressFamily = "AddressFamily"
;({}).StaticIp = "StaticIp"
;({}).NetMask = "NetMask"
;({}).Gateway = "Gateway"
;({}).portNumber = "PortNumber"
;({}).portName = "PortName"
;({}).logicalName = "PortLogicalName"
;({}).portType = "PortType"
;({}).ifaceName = "PhyInterfaceName"
;({}).vlanMode = "PortVlanMode"
;({}).portID = "DefaultPVID"
;({}).LogicalIfName = "LogicalIfName"
;({}).AddressFamily = "AddressFamily"
function vlanIDValidator(A0_3, A1_4)
  if A0_3 then
    if tonumber(A0_3) == 4094 then
      return _UPVALUE0_.FAILURE
    end
    if A1_4 ~= _UPVALUE0_.NIL and tonumber(A0_3) == 4093 then
      return _UPVALUE0_.FAILURE
    end
  end
  return _UPVALUE0_.SUCCESS
end
function routingModeEditVlanPortMgmt(A0_5)
  local L1_6
  L1_6 = _UPVALUE0_
  L1_6 = L1_6.FAILURE
  if db.typeAndRangeValidate(A0_5) == _UPVALUE0_.FALSE then
    return L1_6
  end
  L1_6 = db.update(_UPVALUE1_, A0_5, _UPVALUE2_)
  L1_6 = L1_6 and _UPVALUE0_.SUCCESS
  L1_6 = _UPVALUE0_.SUCCESS
  return L1_6
end
function routingModeEditVlanMgmt(A0_7, A1_8)
  local L2_9, L3_10, L4_11, L5_12, L6_13, L7_14, L8_15
  L2_9 = ""
  L3_10 = 0
  L4_11 = false
  L5_12 = {}
  L6_13 = {}
  L7_14 = {}
  L8_15 = {}
  L2_9 = db.getAttribute(_UPVALUE1_, _UPVALUE2_, A1_8, _UPVALUE3_)
  if L2_9 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L5_12 = db.getTable(_UPVALUE4_)
  if L5_12 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  for _FORV_13_, _FORV_14_ in pairs(L5_12) do
    L3_10 = L3_10 + 1
    L6_13 = L5_12[L3_10]
    if L6_13 ~= _UPVALUE0_.NIL and L6_13[_UPVALUE4_ .. "." .. _UPVALUE5_.vlanPortName] ~= _UPVALUE0_.NIL and L6_13[_UPVALUE4_ .. "." .. _UPVALUE5_.vlanPortName] == L2_9 then
      if A0_7 ~= L6_13[_UPVALUE4_ .. "." .. _UPVALUE5_.vlanID] then
        L4_11 = db.delete(_UPVALUE4_, {
          L6_13[_UPVALUE4_ .. "." .. _UPVALUE2_]
        })
      else
        L4_11 = true
      end
      if not L4_11 then
        break
      end
    end
  end
  L7_14[_UPVALUE4_ .. "." .. A0_7] = A0_7
  L3_10 = 0
  for _FORV_13_, _FORV_14_ in pairs(L5_12) do
    L3_10 = L3_10 + 1
    if L5_12[L3_10] ~= _UPVALUE0_.NIL and L7_14[_UPVALUE4_ .. "." .. L5_12[L3_10][_UPVALUE4_ .. "." .. _UPVALUE5_.vlanID]] ~= _UPVALUE0_.NIL then
      L8_15 = {}
      L8_15[_UPVALUE4_ .. "." .. _UPVALUE5_.vlanID] = A0_7
      L8_15[_UPVALUE4_ .. "." .. _UPVALUE5_.nameofVlan] = db.getAttribute(_UPVALUE4_, _UPVALUE5_.vlanID, A0_7, _UPVALUE5_.nameofVlan)
      L8_15[_UPVALUE4_ .. "." .. _UPVALUE5_.vlanPortName] = db.getAttribute(_UPVALUE1_, _UPVALUE2_, A1_8, _UPVALUE6_.logicalName)
      db.insert(_UPVALUE4_, L8_15)
    end
  end
  return _UPVALUE0_.SUCCESS
end
function routingModeCreateVLAN(A0_16)
  local L1_17
  L1_17 = _UPVALUE0_
  L1_17 = L1_17.FAILURE
  if db.typeAndRangeValidate(A0_16) == _UPVALUE0_.FALSE then
    return L1_17
  end
  L1_17 = db.insert(_UPVALUE1_, A0_16)
  if L1_17 == _UPVALUE0_.NIL then
    return L1_17
  end
  L1_17 = _UPVALUE0_.SUCCESS
  return L1_17
end
function routingModeCreateBridge(A0_18)
  local L1_19, L2_20
  L1_19 = {}
  L2_20 = _UPVALUE0_
  L2_20 = L2_20.FAILURE
  if db.typeAndRangeValidate(A0_18) == _UPVALUE0_.FALSE then
    return L2_20
  end
  L2_20, errStr = db.insert(_UPVALUE1_, A0_18)
  if L2_20 == _UPVALUE0_.NIL then
    return L2_20
  end
  L2_20 = _UPVALUE0_.SUCCESS
  return L2_20
end
function routingModeTablesCreate(A0_21)
  local L1_22, L2_23
  L1_22 = {}
  L2_23 = _UPVALUE0_
  L2_23 = L2_23.FAILURE
  L1_22 = {}
  L1_22 = db.getDefaults(_UPVALUE1_)
  L1_22[_UPVALUE1_ .. "." .. _UPVALUE2_.vlanIdofBridge] = tonumber(A0_21)
  L1_22[_UPVALUE1_ .. "." .. _UPVALUE2_.ifaceName] = _UPVALUE3_ .. A0_21
  L1_22[_UPVALUE1_ .. "." .. _UPVALUE2_.macAddress] = _UPVALUE4_
  L2_23 = routingModeCreateBridge(L1_22)
  if L2_23 == _UPVALUE0_.FAILURE then
    return _UPVALUE0_.FAILURE, cookie
  end
  L1_22 = {}
  L1_22[_UPVALUE5_ .. "." .. _UPVALUE6_.vlanID] = tonumber(A0_21)
  L1_22[_UPVALUE5_ .. "." .. _UPVALUE6_.nameofVlan] = _UPVALUE7_
  L1_22[_UPVALUE5_ .. "." .. _UPVALUE6_.vlanPortName] = _UPVALUE4_
  L1_22[_UPVALUE5_ .. "." .. _UPVALUE6_.vlanInternal] = _UPVALUE8_
  L2_23 = routingModeCreateVLAN(L1_22)
  if L2_23 == _UPVALUE0_.FAILURE then
    return _UPVALUE0_.FAILURE, cookie
  end
  L1_22 = {}
  L1_22[_UPVALUE5_ .. "." .. _UPVALUE6_.vlanID] = tonumber(A0_21)
  L1_22[_UPVALUE5_ .. "." .. _UPVALUE6_.nameofVlan] = _UPVALUE4_
  L1_22[_UPVALUE5_ .. "." .. _UPVALUE6_.vlanPortName] = _UPVALUE9_
  L1_22[_UPVALUE5_ .. "." .. _UPVALUE6_.vlanInternal] = _UPVALUE8_
  L2_23 = routingModeCreateVLAN(L1_22)
  if L2_23 == _UPVALUE0_.FAILURE then
    return _UPVALUE0_.FAILURE, cookie
  end
  return L2_23
end
function getAvailableBridgeVlanID(A0_24)
  local L1_25, L2_26, L3_27, L4_28
  L1_25 = _UPVALUE0_
  L1_25 = L1_25.FAILURE
  L2_26 = "4088"
  L3_27 = ""
  L4_28 = {}
  for _FORV_8_ = 1, 6 do
    L3_27 = _UPVALUE1_.vlanID .. "=" .. L2_26
    L4_28 = db.getRowWhere(_UPVALUE2_, L3_27)
    if L4_28 == _UPVALUE0_.NIL then
      break
    end
    L2_26 = L2_26 + 1
  end
  L1_25 = vlanIDValidator(L2_26, A0_24)
  if L1_25 == _UPVALUE0_.FAILURE then
    return L1_25
  end
  L1_25 = _UPVALUE0_.SUCCESS
  return L1_25, L2_26
end
function routeModeMapper(A0_29, A1_30, A2_31)
  local L3_32, L4_33, L5_34, L6_35, L7_36, L8_37
  L3_32 = _UPVALUE0_
  L3_32 = L3_32.FAILURE
  L4_33 = _UPVALUE0_
  L4_33 = L4_33.NIL
  for L8_37, _FORV_9_ in L5_34(L6_35) do
    if A2_31 == _UPVALUE1_ then
      if _FORV_9_ == A1_30 then
        L4_33 = tostring(L8_37)
        L3_32 = _UPVALUE0_.SUCCESS
        break
      end
    elseif L8_37 == tonumber(A1_30) then
      L4_33 = _FORV_9_
      L3_32 = _UPVALUE0_.SUCCESS
      break
    end
  end
  return L5_34, L6_35
end
function routingModeIfStaticTableUpdate(A0_38, A1_39, A2_40, A3_41)
  local L4_42, L5_43, L6_44
  L4_42 = {}
  L5_43 = {}
  L6_44 = ""
  L6_44 = _UPVALUE1_.LogicalIfName .. "='" .. _UPVALUE2_ .. "'"
  L4_42 = db.getRowWhere(_UPVALUE3_, L6_44)
  if L4_42 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  L4_42[_UPVALUE3_ .. "." .. _UPVALUE1_.AddressFamily] = _UPVALUE4_
  L4_42[_UPVALUE3_ .. "." .. _UPVALUE1_.StaticIp] = A1_39
  L4_42[_UPVALUE3_ .. "." .. _UPVALUE1_.NetMask] = A2_40
  L4_42[_UPVALUE3_ .. "." .. _UPVALUE1_.Gateway] = _UPVALUE5_
  valid = db.update(_UPVALUE3_, L4_42, L4_42[_UPVALUE3_ .. "." .. _UPVALUE6_])
  if valid == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  L6_44 = _UPVALUE7_ .. A0_38
  L4_42 = {}
  L4_42[_UPVALUE3_ .. "." .. _UPVALUE1_.LogicalIfName] = L6_44
  L4_42[_UPVALUE3_ .. "." .. _UPVALUE1_.AddressFamily] = _UPVALUE4_
  L4_42[_UPVALUE3_ .. "." .. _UPVALUE1_.StaticIp] = A3_41
  L4_42[_UPVALUE3_ .. "." .. _UPVALUE1_.NetMask] = A2_40
  L4_42[_UPVALUE3_ .. "." .. _UPVALUE1_.Gateway] = _UPVALUE5_
  L6_44 = _UPVALUE8_ .. "='" .. _UPVALUE7_ .. A0_38 .. "'"
  L5_43 = db.getRowWhere(_UPVALUE3_, L6_44)
  if L5_43 == _UPVALUE0_.NIL then
    valid = db.insert(_UPVALUE3_, L4_42)
  else
    valid = db.update(_UPVALUE3_, L4_42, L5_43[_UPVALUE3_ .. "." .. _UPVALUE6_])
  end
  if valid == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS
end
function routingModeIfStaticDefaultSet()
  local L0_45, L1_46, L2_47, L3_48, L4_49
  L0_45 = {}
  L1_46 = {}
  L2_47 = {}
  L3_48 = ""
  L4_49 = ""
  L3_48 = _UPVALUE0_.LogicalIfName .. "='" .. _UPVALUE1_ .. "'"
  L0_45 = db.getRowWhere(_UPVALUE2_, L3_48)
  L3_48 = _UPVALUE0_.LogicalIfName .. "='" .. _UPVALUE3_ .. "'"
  L1_46 = db.getRowWhere(_UPVALUE2_, L3_48)
  if L0_45 ~= _UPVALUE4_.NIL then
    L2_47 = {}
    L2_47[_UPVALUE2_ .. "." .. _UPVALUE0_.AddressFamily] = _UPVALUE5_
    L2_47[_UPVALUE2_ .. "." .. _UPVALUE0_.StaticIp] = _UPVALUE6_
    L2_47[_UPVALUE2_ .. "." .. _UPVALUE0_.NetMask] = _UPVALUE6_
    L2_47[_UPVALUE2_ .. "." .. _UPVALUE0_.Gateway] = _UPVALUE6_
    L4_49 = db.update(_UPVALUE2_, L2_47, L0_45[_UPVALUE2_ .. "." .. _UPVALUE7_])
    if not L4_49 then
      return _UPVALUE4_.FAILURE
    end
  else
    return _UPVALUE4_.FAILURE
  end
  if L1_46 ~= _UPVALUE4_.NIL then
    L2_47 = {}
    L2_47[_UPVALUE2_ .. "." .. _UPVALUE0_.StaticIp] = _UPVALUE6_
    L4_49 = db.update(_UPVALUE2_, L2_47, L1_46[_UPVALUE2_ .. "." .. _UPVALUE7_])
    if not L4_49 then
      return _UPVALUE4_.FAILURE
    end
  end
  return _UPVALUE4_.SUCCESS
end
function WANRoutingModeSplitterSet(A0_50, A1_51)
  local L2_52, L3_53
  if A0_50 == _UPVALUE0_ and (A1_51 == _UPVALUE0_ or A1_51 == nil) then
    L2_52 = ""
    L3_53 = _UPVALUE1_ .. "," .. _UPVALUE2_
  elseif A0_50 == _UPVALUE3_ and (A1_51 == _UPVALUE0_ or A1_51 == nil) then
    L2_52 = _UPVALUE1_
    L3_53 = _UPVALUE2_
  elseif A0_50 == _UPVALUE0_ and A1_51 == _UPVALUE3_ then
    L2_52 = _UPVALUE2_
    L3_53 = _UPVALUE1_
  elseif A0_50 == _UPVALUE3_ and A1_51 == _UPVALUE3_ then
    L2_52 = _UPVALUE1_ .. "," .. _UPVALUE2_
    L3_53 = ""
  end
  return L2_52, L3_53
end
function routingModeInterfacesMAP(A0_54, A1_55, A2_56, A3_57, A4_58)
  local L5_59, L6_60, L7_61, L8_62, L9_63
  L5_59 = _UPVALUE0_
  L5_59 = L5_59.FAILURE
  L6_60, L7_61, L8_62 = nil, nil, nil
  if A0_54 == 1 then
    L9_63 = _UPVALUE1_
    L9_63 = L9_63 .. "." .. _UPVALUE2_.natInterface
    A1_55[L9_63], A1_55[_UPVALUE1_ .. "." .. _UPVALUE2_.routedInterface] = WANRoutingModeSplitterSet(A2_56, A3_57)
  elseif A0_54 == 2 then
    L9_63 = _UPVALUE1_
    L9_63 = L9_63 .. "." .. _UPVALUE2_.natInterface
    A1_55[L9_63] = A4_58[_UPVALUE1_ .. "." .. _UPVALUE2_.natInterface]
    L9_63 = _UPVALUE1_
    L9_63 = L9_63 .. "." .. _UPVALUE2_.routedInterface
    A1_55[L9_63] = A4_58[_UPVALUE1_ .. "." .. _UPVALUE2_.routedInterface]
  elseif A0_54 == 3 then
    A3_57 = _UPVALUE3_
    L9_63 = _UPVALUE1_
    L9_63 = L9_63 .. "." .. _UPVALUE2_.natInterface
    A1_55[L9_63], A1_55[_UPVALUE1_ .. "." .. _UPVALUE2_.routedInterface] = WANRoutingModeSplitterSet(A2_56, A3_57)
    L9_63 = _UPVALUE4_
    L9_63 = L9_63.interfaceName
    L6_60 = L9_63 .. "= '" .. _UPVALUE5_ .. "'"
    L9_63 = db
    L9_63 = L9_63.getAttributeWhere
    L9_63 = L9_63(_UPVALUE6_, L6_60, _UPVALUE4_.dhcpEnabled)
    L7_61 = L9_63
    if L7_61 == "1" then
      L9_63 = db
      L9_63 = L9_63.setAttributeWhere
      L9_63 = L9_63(_UPVALUE6_, L6_60, _UPVALUE4_.dhcpEnabled, _UPVALUE7_)
      L5_59 = L9_63
      L9_63 = _UPVALUE0_
      L9_63 = L9_63.FALSE
      if L5_59 == L9_63 then
        L9_63 = _UPVALUE0_
        L9_63 = L9_63.FAILURE
        return L9_63
      end
    end
    L9_63 = db
    L9_63 = L9_63.getAttribute
    L9_63 = L9_63(_UPVALUE8_, _UPVALUE4_.interfaceName, _UPVALUE5_, _UPVALUE9_)
    L8_62 = db.getRow(_UPVALUE8_, _UPVALUE9_, L9_63)
    if L8_62[_UPVALUE8_ .. "." .. _UPVALUE4_.DhcpRelayStatus] == _UPVALUE10_ then
      L8_62[_UPVALUE8_ .. "." .. _UPVALUE4_.DhcpRelayStatus] = _UPVALUE7_
      L8_62[_UPVALUE8_ .. "." .. _UPVALUE4_.RelayGateway] = _UPVALUE11_
      L5_59 = db.update(_UPVALUE8_, L8_62, L9_63)
      if not L5_59 then
        return _UPVALUE0_.FAILURE
      end
    end
  end
  L9_63 = _UPVALUE0_
  L5_59 = L9_63.SUCCESS
  return L5_59
end
function routingBridgeModeSet(A0_64, A1_65, A2_66, A3_67, A4_68, A5_69, A6_70)
  local L7_71, L8_72, L9_73, L10_74, L11_75, L12_76, L13_77
  L7_71 = {}
  L8_72 = {}
  L9_73 = {}
  L10_74 = _UPVALUE0_
  L10_74 = L10_74.FAILURE
  L11_75 = ""
  L12_76 = 0
  L13_77 = 4094
  L7_71 = db.getRow(_UPVALUE1_, _UPVALUE2_, _UPVALUE3_)
  if L7_71 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  L10_74, L11_75 = routeModeMapper(_UPVALUE4_, A1_65, _UPVALUE5_)
  if L10_74 == _UPVALUE0_.FAILURE then
    return _UPVALUE0_.FAILURE, cookie
  end
  L8_72[_UPVALUE6_ .. "." .. _UPVALUE7_.routingMode] = L11_75
  if tonumber(L7_71[_UPVALUE6_ .. "." .. _UPVALUE7_.bridgeVLANID]) ~= 1 then
    L10_74 = routingModeIfStaticDefaultSet()
    if L10_74 == _UPVALUE0_.FAILURE then
      return L10_74
    end
  end
  L10_74 = routingModeInterfacesMAP(A1_65, L8_72, A2_66, A3_67, L7_71)
  if L10_74 == _UPVALUE0_.FAILURE then
    return L10_74
  end
  if tonumber(L8_72[_UPVALUE6_ .. "." .. _UPVALUE7_.routingMode]) == _UPVALUE8_ then
    L13_77 = L7_71[_UPVALUE6_ .. "." .. _UPVALUE7_.bridgeVLANID]
    L10_74 = vlanIDValidator(L13_77, fixedIDCheck)
    if L10_74 == _UPVALUE0_.FAILURE then
      return L10_74
    end
    if tonumber(L13_77) == 1 then
      L10_74, L11_75 = getAvailableBridgeVlanID()
      if L10_74 == _UPVALUE0_.FAILURE then
        return _UPVALUE0_.FAILURE, cookie
      end
      L13_77 = L11_75
      L8_72[_UPVALUE6_ .. "." .. _UPVALUE7_.bridgeVLANID] = L13_77
      L10_74 = routingModeTablesCreate(L13_77)
      if L10_74 == _UPVALUE0_.FAILURE then
        return _UPVALUE0_.FAILURE, cookie
      end
    end
    L9_73 = {}
    L9_73[_UPVALUE9_ .. "." .. _UPVALUE10_.portID] = L13_77
    L9_73[_UPVALUE9_ .. "." .. _UPVALUE10_.vlanMode] = _UPVALUE11_
    L10_74 = routingModeEditVlanPortMgmt(L9_73)
    if L10_74 == _UPVALUE0_.FAILURE then
      return _UPVALUE0_.FAILURE, cookie
    end
    L10_74 = routingModeEditVlanMgmt(L13_77, _UPVALUE12_)
    if L10_74 == _UPVALUE0_.FAILURE then
      return _UPVALUE0_.FAILURE, cookie
    end
    L10_74 = routingModeIfStaticTableUpdate(L13_77, A4_68, A6_70, A5_69)
    if L10_74 == _UPVALUE0_.FAILURE then
      return _UPVALUE0_.FAILURE, cookie
    end
  end
  if tonumber(L7_71[_UPVALUE6_ .. "." .. _UPVALUE7_.routingMode]) ~= tonumber(L8_72[_UPVALUE6_ .. "." .. _UPVALUE7_.routingMode]) then
    if tonumber(L7_71[_UPVALUE6_ .. "." .. _UPVALUE7_.routingMode]) == _UPVALUE8_ then
      L9_73 = {}
      L9_73[_UPVALUE9_ .. "." .. _UPVALUE10_.portID] = _UPVALUE13_
      L9_73[_UPVALUE9_ .. "." .. _UPVALUE10_.vlanMode] = _UPVALUE11_
      L10_74 = routingModeEditVlanPortMgmt(L9_73)
      if L10_74 == _UPVALUE0_.FAILURE then
        return _UPVALUE0_.FAILURE, cookie
      end
      L10_74 = routingModeEditVlanMgmt(_UPVALUE13_, _UPVALUE12_)
      if L10_74 == _UPVALUE0_.FAILURE then
        return _UPVALUE0_.FAILURE, cookie
      end
      L10_74 = routingModeIfStaticTableUpdate(_UPVALUE13_, _UPVALUE14_, _UPVALUE15_, _UPVALUE16_)
      if L10_74 == _UPVALUE0_.FAILURE then
        return _UPVALUE0_.FAILURE, cookie
      end
    end
    if tonumber(L7_71[_UPVALUE6_ .. "." .. _UPVALUE7_.routingMode]) == _UPVALUE17_ and tonumber(L8_72[_UPVALUE6_ .. "." .. _UPVALUE7_.routingMode]) == _UPVALUE18_ then
      whrQuery = _UPVALUE19_.LogicalIfName .. "='" .. _UPVALUE20_ .. "'"
      dmzStatTbl = db.getRowWhere(_UPVALUE21_, whrQuery)
      if dmzStatTbl ~= _UPVALUE0_.NIL then
        L9_73 = {}
        L9_73[_UPVALUE21_ .. "." .. _UPVALUE19_.AddressFamily] = _UPVALUE22_
        L9_73[_UPVALUE21_ .. "." .. _UPVALUE19_.StaticIp] = _UPVALUE14_
        L9_73[_UPVALUE21_ .. "." .. _UPVALUE19_.NetMask] = _UPVALUE15_
        L9_73[_UPVALUE21_ .. "." .. _UPVALUE19_.Gateway] = _UPVALUE16_
        valid = db.update(_UPVALUE21_, L9_73, dmzStatTbl[_UPVALUE21_ .. "." .. _UPVALUE2_])
        if not valid then
          return _UPVALUE0_.FAILURE
        end
      else
        return _UPVALUE0_.FAILURE
      end
    end
  end
  L10_74 = db.update(_UPVALUE6_, L8_72, _UPVALUE3_)
  if not L10_74 then
    return _UPVALUE0_.FAILURE, cookie
  end
  L10_74 = _UPVALUE0_.SUCCESS
  return L10_74
end
function routeModeDMZInfoGet(A0_78)
  local L1_79, L2_80
  L1_79 = {}
  L2_80 = _UPVALUE0_
  L2_80 = L2_80.NIL
  L2_80 = _UPVALUE1_.LogicalIfName .. "='" .. _UPVALUE2_ .. "'"
  L1_79 = db.getRowWhere(_UPVALUE3_, L2_80)
  if L2_80 == _UPVALUE0_.NIL or L1_79 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  A0_78[_UPVALUE4_] = L1_79[_UPVALUE3_ .. "." .. _UPVALUE1_.StaticIp]
  L1_79 = {}
  L2_80 = _UPVALUE0_.NIL
  L2_80 = _UPVALUE1_.LogicalIfName .. "='" .. _UPVALUE5_ .. A0_78[_UPVALUE6_] .. "'"
  if L2_80 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L1_79 = db.getRowWhere(_UPVALUE3_, L2_80)
  if L1_79 ~= _UPVALUE0_.NIL then
    A0_78[_UPVALUE7_] = L1_79[_UPVALUE3_ .. "." .. _UPVALUE1_.StaticIp]
    A0_78[_UPVALUE8_] = L1_79[_UPVALUE3_ .. "." .. _UPVALUE1_.NetMask]
  else
    A0_78[_UPVALUE7_] = _UPVALUE9_
    A0_78[_UPVALUE8_] = _UPVALUE10_
  end
  return _UPVALUE0_.SUCCESS
end
function WANRoutingModeSplitterGet(A0_81)
  A0_81[_UPVALUE1_] = "0"
  A0_81[_UPVALUE2_] = "0"
  if A0_81[_UPVALUE3_] ~= _UPVALUE0_.NIL and A0_81[_UPVALUE3_] ~= "" then
    interfaceArr = util.split(A0_81[_UPVALUE3_], ",")
    if #interfaceArr > 2 or #interfaceArr < 1 then
      return _UPVALUE0_.FAILURE
    end
    if #interfaceArr > 1 then
      A0_81[_UPVALUE1_] = "1"
      A0_81[_UPVALUE2_] = "1"
    elseif interfaceArr[1] == _UPVALUE4_ then
      A0_81[_UPVALUE1_] = "1"
    elseif interfaceArr[1] == _UPVALUE5_ then
      A0_81[_UPVALUE2_] = "1"
    end
  end
  return _UPVALUE0_.SUCCESS
end
function bridgeIfaceIPget(A0_82)
  local L1_83, L2_84, L3_85, L4_86, L6_87
  L1_83 = ""
  L2_84 = ""
  L3_85 = {}
  L4_86 = {}
  L6_87 = ""
  L1_83 = _UPVALUE0_ .. A0_82[_UPVALUE1_]
  L2_84 = _UPVALUE2_ .. " = '" .. _UPVALUE3_ .. "'"
  resultTab = db.getRowsWhere(_UPVALUE4_, L2_84)
  L2_84 = _UPVALUE5_.NIL
  if resultTab ~= _UPVALUE5_.NIL then
    A0_82[_UPVALUE6_] = {}
    A0_82[_UPVALUE7_] = {}
    for _FORV_10_, _FORV_11_ in pairs(resultTab) do
      L2_84 = _UPVALUE8_.LogicalIfName .. " = '" .. _FORV_11_[_UPVALUE4_ .. "." .. _UPVALUE8_.LogicalIfName] .. "' and " .. _UPVALUE8_.AddressFamily .. "=2"
      L4_86 = db.getRowWhere(_UPVALUE9_, L2_84)
      if L4_86 ~= _UPVALUE5_.NIL then
        L6_87 = L4_86[_UPVALUE9_ .. "." .. _UPVALUE10_.LogicalIfName]
        if L6_87 ~= L1_83 then
          A0_82[_UPVALUE6_][0 + 1] = L4_86[_UPVALUE9_ .. "." .. _UPVALUE10_.StaticIp]
          A0_82[_UPVALUE7_][0 + 1] = L4_86[_UPVALUE9_ .. "." .. _UPVALUE10_.NetMask]
        end
      end
    end
  end
  return _UPVALUE5_.SUCCESS
end
function routingBridgeModeGet()
  local L0_88, L1_89, L2_90
  L0_88 = {}
  L1_89 = {}
  L2_90 = _UPVALUE0_
  L2_90 = L2_90.FAILURE
  L0_88 = db.getRow(_UPVALUE1_, _UPVALUE2_, _UPVALUE3_)
  if L0_88 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L1_89[_UPVALUE4_] = L0_88[_UPVALUE5_ .. "." .. _UPVALUE6_.routingMode]
  L1_89[_UPVALUE7_] = L0_88[_UPVALUE5_ .. "." .. _UPVALUE6_.natInterface]
  L1_89[_UPVALUE8_] = L0_88[_UPVALUE5_ .. "." .. _UPVALUE6_.routedInterface]
  L1_89[_UPVALUE9_] = L0_88[_UPVALUE5_ .. "." .. _UPVALUE6_.bridgeVLANID]
  L0_88 = {}
  L2_90, L1_89[_UPVALUE4_] = routeModeMapper(_UPVALUE10_, L1_89[_UPVALUE4_], _UPVALUE11_)
  if L2_90 == _UPVALUE0_.FAILURE then
    return _UPVALUE0_.FAILURE, cookie
  end
  if routeModeDMZInfoGet(L1_89) == _UPVALUE0_.FAILURE then
    return _UPVALUE0_.FAILURE
  end
  if WANRoutingModeSplitterGet(L1_89) == _UPVALUE0_.FAILURE then
    return _UPVALUE0_.FAILURE
  end
  if bridgeIfaceIPget(L1_89) == _UPVALUE0_.FAILURE then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L1_89
end
function routingModeGet()
  local L0_91, L1_92, L2_93
  L0_91 = {}
  L1_92 = {}
  L2_93 = _UPVALUE0_
  L2_93 = L2_93.FAILURE
  L1_92[_UPVALUE1_] = "0"
  L1_92[_UPVALUE2_] = "0"
  L0_91 = db.getRow(_UPVALUE3_, _UPVALUE4_, _UPVALUE5_)
  if L0_91 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L1_92[_UPVALUE6_] = L0_91[_UPVALUE7_ .. "." .. _UPVALUE8_.routingMode]
  L0_91 = {}
  L2_93, L1_92[_UPVALUE6_] = routeModeMapper(_UPVALUE9_, L1_92[_UPVALUE6_], _UPVALUE10_)
  if L2_93 == _UPVALUE0_.FAILURE then
    return _UPVALUE0_.FAILURE, cookie
  end
  if tonumber(L1_92[_UPVALUE6_]) == 1 then
    L1_92[_UPVALUE1_] = "1"
  else
    L1_92[_UPVALUE1_] = "0"
  end
  return _UPVALUE0_.SUCCESS, 1, L1_92
end
function routingModeGetNext(A0_94)
  local L2_95, L3_96
  L2_95 = _UPVALUE0_
  L2_95 = L2_95.NOT_SUPPORTED
  L3_96 = 0
  return L2_95, L3_96, 0
end
function routingModeSet(A0_97, A1_98)
  local L2_99, L3_100, L4_101, L5_102, L6_103, L7_104
  L2_99 = {}
  L3_100 = {}
  L4_101 = {}
  L5_102 = _UPVALUE0_
  L5_102 = L5_102.FAILURE
  L6_103 = ""
  L7_104 = 0
  L2_99 = db.getRow(_UPVALUE1_, _UPVALUE2_, _UPVALUE3_)
  if L2_99 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_97
  end
  L5_102, L6_103 = routeModeMapper(_UPVALUE4_, A1_98, _UPVALUE5_)
  if L5_102 == _UPVALUE0_.FAILURE then
    return _UPVALUE0_.FAILURE, A0_97
  end
  L3_100[_UPVALUE6_ .. "." .. _UPVALUE7_.routingMode] = L6_103
  if tonumber(L3_100[_UPVALUE6_ .. "." .. _UPVALUE7_.routingMode]) == _UPVALUE8_ then
    L5_102 = routingModeIfStaticDefaultSet()
    if L5_102 == _UPVALUE0_.FAILURE then
      return L5_102
    end
  end
  if tonumber(L2_99[_UPVALUE6_ .. "." .. _UPVALUE7_.routingMode]) == _UPVALUE8_ and tonumber(L3_100[_UPVALUE6_ .. "." .. _UPVALUE7_.routingMode]) == _UPVALUE9_ then
    whrQuery = _UPVALUE10_.LogicalIfName .. "='" .. _UPVALUE11_ .. "'"
    dmzStatTbl = db.getRowWhere(_UPVALUE12_, whrQuery)
    if dmzStatTbl ~= _UPVALUE0_.NIL then
      L4_101 = {}
      L4_101[_UPVALUE12_ .. "." .. _UPVALUE10_.AddressFamily] = _UPVALUE13_
      L4_101[_UPVALUE12_ .. "." .. _UPVALUE10_.StaticIp] = _UPVALUE14_
      L4_101[_UPVALUE12_ .. "." .. _UPVALUE10_.NetMask] = _UPVALUE15_
      L4_101[_UPVALUE12_ .. "." .. _UPVALUE10_.Gateway] = _UPVALUE16_
      valid = db.update(_UPVALUE12_, L4_101, dmzStatTbl[_UPVALUE12_ .. "." .. _UPVALUE2_])
      if not valid then
        return _UPVALUE0_.FAILURE
      end
    else
      return _UPVALUE0_.FAILURE
    end
  end
  L5_102 = db.update(_UPVALUE6_, L3_100, _UPVALUE3_)
  if not L5_102 then
    return _UPVALUE0_.FAILURE, A0_97
  end
  L5_102 = _UPVALUE0_.SUCCESS
  return L5_102
end
function routingModeStatus()
  local L0_105
  L0_105 = db.getAttribute(_UPVALUE0_, _UPVALUE1_, "1", _UPVALUE2_.routingMode)
  return L0_105
end
function dmzStatusCheck()
  local L0_106
  L0_106 = db.getAttribute("ConfigPort", "_ROWID_", "1", "LogicalIfName")
  return L0_106
end
function routingModeSnmpGet()
  local L0_107, L1_108, L2_109
  L0_107 = _UPVALUE0_
  L0_107 = L0_107.FAILURE
  L1_108, L2_109 = nil, nil
  L1_108 = db.getAttribute(_UPVALUE1_, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.routingMode)
  if L1_108 == _UPVALUE0_.NIL then
    return L2_109
  end
  if L1_108 == "1" then
    L0_107 = 1
    L2_109 = _UPVALUE0_.SUCCESS
  elseif L1_108 == "0" then
    L0_107 = 2
    L2_109 = _UPVALUE0_.SUCCESS
  elseif L1_108 == "5" then
    L0_107 = 3
    L2_109 = _UPVALUE0_.SUCCESS
  end
  return L2_109, L0_107
end
function pptpL2tpModeSet()
  if db.setAttribute(_UPVALUE0_, "_ROWID_", "1", _UPVALUE1_.pptpRoutingMode, "0") == _UPVALUE2_.FALSE then
    return _UPVALUE2_.FAILURE
  end
  if db.setAttribute(_UPVALUE3_, "_ROWID_", "1", _UPVALUE1_.l2tpRoutingMode, "0") == _UPVALUE2_.FALSE then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS
end
