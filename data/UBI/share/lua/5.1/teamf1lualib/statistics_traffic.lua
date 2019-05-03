local L0_0
L0_0 = module
L0_0("com.teamf1.core.statistics.traffic", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/stats_db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).key = "_ROWID_"
;({}).interfaceName = "InterfaceName"
;({}).keyValue = "1"
;({}).interface = "interfaceName"
;({}).transmittedPackets = "tx_packets"
;({}).receivedPackets = "rx_packets"
;({}).transmittedPacketsDropped = "tx_dropped"
;({}).receivedPacketsDropped = "rx_dropped"
;({}).VlanState = "VlanState"
;({}).ifName = "LogicalIfName"
;({}).addressFamily = "AddressFamily"
;({}).connectionType6 = "ConnectionType6"
;({}).connectionType = "ConnectionType"
;({}).status = "Status"
;({}).profileName = "ProfileName"
;({}).idsEnable = "idsEnable"
;({}).ipsEnable = "ipsEnable"
function interfaceGet()
  local L0_1
  L0_1 = stats_db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue, _UPVALUE1_.interface)
  if L0_1 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_1
end
function interfaceGetNext(A0_2)
  local L1_3, L2_4
  L1_3 = _UPVALUE0_
  L1_3 = L1_3.NIL
  if A0_2 ~= L1_3 then
    L1_3 = tonumber
    L2_4 = A0_2
    L1_3 = L1_3(L2_4)
    L2_4 = _UPVALUE0_
    L2_4 = L2_4.NIL
  elseif L1_3 == L2_4 then
    L1_3 = _UPVALUE0_
    L1_3 = L1_3.INVALID_COOKIE
    return L1_3
  end
  L1_3 = stats_db
  L1_3 = L1_3.existsRow
  L2_4 = _UPVALUE1_
  L1_3 = L1_3(L2_4, _UPVALUE2_.key, A0_2)
  if L1_3 == false then
    L1_3 = _UPVALUE0_
    L1_3 = L1_3.NO_ROW
    return L1_3
  end
  L1_3 = stats_db
  L1_3 = L1_3.getNextRowId
  L2_4 = A0_2
  L1_3 = L1_3(L2_4, _UPVALUE1_)
  L2_4 = _UPVALUE0_
  L2_4 = L2_4.NIL
  if L1_3 == L2_4 then
    L2_4 = _UPVALUE0_
    L2_4 = L2_4.TABLE_IS_FULL
    return L2_4
  end
  L2_4 = stats_db
  L2_4 = L2_4.getAttribute
  L2_4 = L2_4(_UPVALUE1_, _UPVALUE2_.key, L1_3, _UPVALUE2_.interface)
  if L2_4 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_3
  end
  return _UPVALUE0_.SUCCESS, L1_3, L2_4
end
function interfaceSet(A0_5, A1_6)
  local L3_7
  L3_7 = _UPVALUE0_
  L3_7 = L3_7.NOT_SUPPORTED
  return L3_7, A0_5
end
function interfaceDelete(A0_8, A1_9)
  local L3_10
  L3_10 = _UPVALUE0_
  L3_10 = L3_10.NOT_SUPPORTED
  return L3_10, A0_8
end
function transmittedPacketsGet()
  local L0_11
  L0_11 = stats_db
  L0_11 = L0_11.getAttribute
  L0_11 = L0_11(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue, _UPVALUE1_.transmittedPackets)
  if L0_11 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_11
end
function transmittedPacketsGetNext(A0_12)
  local L1_13, L2_14
  L1_13 = _UPVALUE0_
  L1_13 = L1_13.NIL
  if A0_12 ~= L1_13 then
    L1_13 = tonumber
    L2_14 = A0_12
    L1_13 = L1_13(L2_14)
    L2_14 = _UPVALUE0_
    L2_14 = L2_14.NIL
  elseif L1_13 == L2_14 then
    L1_13 = _UPVALUE0_
    L1_13 = L1_13.INVALID_COOKIE
    return L1_13
  end
  L1_13 = stats_db
  L1_13 = L1_13.existsRow
  L2_14 = _UPVALUE1_
  L1_13 = L1_13(L2_14, _UPVALUE2_.key, A0_12)
  if L1_13 == false then
    L1_13 = _UPVALUE0_
    L1_13 = L1_13.NO_ROW
    return L1_13
  end
  L1_13 = stats_db
  L1_13 = L1_13.getNextRowId
  L2_14 = A0_12
  L1_13 = L1_13(L2_14, _UPVALUE1_)
  L2_14 = _UPVALUE0_
  L2_14 = L2_14.NIL
  if L1_13 == L2_14 then
    L2_14 = _UPVALUE0_
    L2_14 = L2_14.TABLE_IS_FULL
    return L2_14
  end
  L2_14 = stats_db
  L2_14 = L2_14.getAttribute
  L2_14 = L2_14(_UPVALUE1_, _UPVALUE2_.key, L1_13, _UPVALUE2_.transmittedPackets)
  if L2_14 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_13
  end
  return _UPVALUE0_.SUCCESS, L1_13, L2_14
end
function transmittedPacketsSet(A0_15, A1_16)
  local L3_17
  L3_17 = _UPVALUE0_
  L3_17 = L3_17.NOT_SUPPORTED
  return L3_17, A0_15
end
function receivedPacketsGet()
  local L0_18
  L0_18 = stats_db
  L0_18 = L0_18.getAttribute
  L0_18 = L0_18(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue, _UPVALUE1_.receivedPackets)
  if L0_18 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_18
end
function receivedPacketsGetNext(A0_19)
  local L1_20, L2_21
  L1_20 = _UPVALUE0_
  L1_20 = L1_20.NIL
  if A0_19 ~= L1_20 then
    L1_20 = tonumber
    L2_21 = A0_19
    L1_20 = L1_20(L2_21)
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.NIL
  elseif L1_20 == L2_21 then
    L1_20 = _UPVALUE0_
    L1_20 = L1_20.INVALID_COOKIE
    return L1_20
  end
  L1_20 = stats_db
  L1_20 = L1_20.existsRow
  L2_21 = _UPVALUE1_
  L1_20 = L1_20(L2_21, _UPVALUE2_.key, A0_19)
  if L1_20 == false then
    L1_20 = _UPVALUE0_
    L1_20 = L1_20.NO_ROW
    return L1_20
  end
  L1_20 = stats_db
  L1_20 = L1_20.getNextRowId
  L2_21 = A0_19
  L1_20 = L1_20(L2_21, _UPVALUE1_)
  L2_21 = _UPVALUE0_
  L2_21 = L2_21.NIL
  if L1_20 == L2_21 then
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.TABLE_IS_FULL
    return L2_21
  end
  L2_21 = stats_db
  L2_21 = L2_21.getAttribute
  L2_21 = L2_21(_UPVALUE1_, _UPVALUE2_.key, L1_20, _UPVALUE2_.receivedPackets)
  if L2_21 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_20
  end
  return _UPVALUE0_.SUCCESS, L1_20, L2_21
end
function receivedPacketsSet(A0_22, A1_23)
  local L3_24
  L3_24 = _UPVALUE0_
  L3_24 = L3_24.NOT_SUPPORTED
  return L3_24, A0_22
end
function transmittedPacketsDroppedGet()
  local L0_25
  L0_25 = db
  L0_25 = L0_25.getAttribute
  L0_25 = L0_25(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue, _UPVALUE1_.transmittedPacketsDropped)
  if L0_25 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_25
end
function transmittedPacketsDroppedGetNext(A0_26)
  local L1_27, L2_28
  L1_27 = _UPVALUE0_
  L1_27 = L1_27.NIL
  if A0_26 ~= L1_27 then
    L1_27 = tonumber
    L2_28 = A0_26
    L1_27 = L1_27(L2_28)
    L2_28 = _UPVALUE0_
    L2_28 = L2_28.NIL
  elseif L1_27 == L2_28 then
    L1_27 = _UPVALUE0_
    L1_27 = L1_27.INVALID_COOKIE
    return L1_27
  end
  L1_27 = stats_db
  L1_27 = L1_27.existsRow
  L2_28 = _UPVALUE1_
  L1_27 = L1_27(L2_28, _UPVALUE2_.key, A0_26)
  if L1_27 == false then
    L1_27 = _UPVALUE0_
    L1_27 = L1_27.NO_ROW
    return L1_27
  end
  L1_27 = stats_db
  L1_27 = L1_27.getNextRowId
  L2_28 = A0_26
  L1_27 = L1_27(L2_28, _UPVALUE1_)
  L2_28 = _UPVALUE0_
  L2_28 = L2_28.NIL
  if L1_27 == L2_28 then
    L2_28 = _UPVALUE0_
    L2_28 = L2_28.TABLE_IS_FULL
    return L2_28
  end
  L2_28 = stats_db
  L2_28 = L2_28.getAttribute
  L2_28 = L2_28(_UPVALUE1_, _UPVALUE2_.key, L1_27, _UPVALUE2_.transmittedPacketsDropped)
  if L2_28 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_27
  end
  return _UPVALUE0_.SUCCESS, L1_27, L2_28
end
function transmittedPacketsDroppedSet(A0_29, A1_30)
  local L3_31
  L3_31 = _UPVALUE0_
  L3_31 = L3_31.NOT_SUPPORTED
  return L3_31, A0_29
end
function receivedPacketsDroppedGet()
  local L0_32
  L0_32 = stats_db
  L0_32 = L0_32.getAttribute
  L0_32 = L0_32(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue, _UPVALUE1_.receivedPacketsDropped)
  if L0_32 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_32
end
function receivedPacketsDroppedGetNext(A0_33)
  local L1_34, L2_35
  L1_34 = _UPVALUE0_
  L1_34 = L1_34.NIL
  if A0_33 ~= L1_34 then
    L1_34 = tonumber
    L2_35 = A0_33
    L1_34 = L1_34(L2_35)
    L2_35 = _UPVALUE0_
    L2_35 = L2_35.NIL
  elseif L1_34 == L2_35 then
    L1_34 = _UPVALUE0_
    L1_34 = L1_34.INVALID_COOKIE
    return L1_34
  end
  L1_34 = stats_db
  L1_34 = L1_34.existsRow
  L2_35 = _UPVALUE1_
  L1_34 = L1_34(L2_35, _UPVALUE2_.key, A0_33)
  if L1_34 == false then
    L1_34 = _UPVALUE0_
    L1_34 = L1_34.NO_ROW
    return L1_34
  end
  L1_34 = stats_db
  L1_34 = L1_34.getNextRowId
  L2_35 = A0_33
  L1_34 = L1_34(L2_35, _UPVALUE1_)
  L2_35 = _UPVALUE0_
  L2_35 = L2_35.NIL
  if L1_34 == L2_35 then
    L2_35 = _UPVALUE0_
    L2_35 = L2_35.TABLE_IS_FULL
    return L2_35
  end
  L2_35 = stats_db
  L2_35 = L2_35.getAttribute
  L2_35 = L2_35(_UPVALUE1_, _UPVALUE2_.key, L1_34, _UPVALUE2_.receivedPacketsDropped)
  if L2_35 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_34
  end
  return _UPVALUE0_.SUCCESS, L1_34, L2_35
end
function receivedPacketsDroppedSet(A0_36, A1_37)
  local L3_38
  L3_38 = _UPVALUE0_
  L3_38 = L3_38.NOT_SUPPORTED
  return L3_38, A0_36
end
function trafficCountersGet(A0_39)
  local L1_40, L2_41, L3_42, L4_43, L5_44, L6_45, L7_46, L8_47, L9_48
  L6_45 = _UPVALUE0_
  L6_45 = L6_45.NIL
  if A0_39 == L6_45 then
    L6_45 = _UPVALUE0_
    L6_45 = L6_45.INVALID_INTERFACE
    return L6_45
  end
  if A0_39 ~= "LAN" then
    L6_45 = _UPVALUE1_
    if A0_39 ~= L6_45 then
      L6_45 = _UPVALUE2_
    end
  else
    if A0_39 == L6_45 or A0_39 == "DMZ" or A0_39 == "WAN3" then
      L6_45 = _UPVALUE3_
      L6_45 = L6_45.ifName
      L7_46 = "="
      L8_47 = "'"
      L9_48 = A0_39
      L6_45 = L6_45 .. L7_46 .. L8_47 .. L9_48 .. "'"
      L7_46 = {}
      L8_47 = db
      L8_47 = L8_47.getRowWhere
      L9_48 = _UPVALUE4_
      L8_47 = L8_47(L9_48, L6_45)
      L7_46 = L8_47
      L8_47 = _UPVALUE3_
      L8_47 = L8_47.interface
      L9_48 = "="
      L8_47 = L8_47 .. L9_48 .. "'" .. L7_46[_UPVALUE4_ .. "." .. _UPVALUE3_.interface] .. "'"
      L9_48 = {}
      L9_48 = stats_db.getRowWhere(_UPVALUE5_, L8_47)
      if L9_48 == _UPVALUE0_.NIL then
        return _UPVALUE0_.FAILURE
      end
      L1_40 = L9_48[_UPVALUE5_ .. "." .. _UPVALUE3_.interface]
      L2_41 = L9_48[_UPVALUE5_ .. "." .. _UPVALUE3_.transmittedPackets]
      L3_42 = L9_48[_UPVALUE5_ .. "." .. _UPVALUE3_.receivedPackets]
      L4_43 = L9_48[_UPVALUE5_ .. "." .. _UPVALUE3_.transmittedPacketsDropped]
      L5_44 = L9_48[_UPVALUE5_ .. "." .. _UPVALUE3_.receivedPacketsDropped]
  end
  elseif A0_39 == "vlan" then
    L6_45 = db
    L6_45 = L6_45.getRow
    L7_46 = _UPVALUE6_
    L8_47 = _UPVALUE3_
    L8_47 = L8_47.key
    L9_48 = _UPVALUE3_
    L9_48 = L9_48.keyValue
    L6_45 = L6_45(L7_46, L8_47, L9_48)
    L7_46 = _UPVALUE0_
    L7_46 = L7_46.NIL
    if L6_45 ~= L7_46 then
      L7_46 = db
      L7_46 = L7_46.getRowsWhere
      L8_47 = _UPVALUE4_
      L9_48 = "ifType = 'bridge'"
      L7_46 = L7_46(L8_47, L9_48)
      L8_47 = _UPVALUE0_
      L8_47 = L8_47.SUCCESS
      L9_48 = cookie
      return L8_47, L9_48, L7_46
    else
      L7_46 = _UPVALUE0_
      L7_46 = L7_46.FAILURE
      return L7_46
    end
  end
  L6_45 = _UPVALUE0_
  L6_45 = L6_45.NIL
  if L1_40 ~= L6_45 then
    L6_45 = _UPVALUE0_
    L6_45 = L6_45.NIL
    if L2_41 ~= L6_45 then
      L6_45 = _UPVALUE0_
      L6_45 = L6_45.NIL
      if L3_42 ~= L6_45 then
        L6_45 = _UPVALUE0_
        L6_45 = L6_45.NIL
        if L4_43 ~= L6_45 then
          L6_45 = _UPVALUE0_
          L6_45 = L6_45.NIL
        end
      end
    end
  elseif L5_44 == L6_45 then
    L6_45 = _UPVALUE0_
    L6_45 = L6_45.FAILURE
    return L6_45
  end
  L6_45 = _UPVALUE0_
  L6_45 = L6_45.SUCCESS
  L7_46 = 1
  L8_47 = L1_40
  L9_48 = L2_41
  return L6_45, L7_46, L8_47, L9_48, L3_42, L4_43, L5_44
end
function trafficCountersGetNext(A0_49, A1_50)
  local L2_51, L3_52
  L2_51 = _UPVALUE0_
  L2_51 = L2_51.NIL
  if A1_50 == L2_51 then
    L2_51 = _UPVALUE0_
    L2_51 = L2_51.INVALID_INTERFACE
    return L2_51
  end
  if A1_50 ~= "LAN" then
    L2_51 = _UPVALUE1_
    if A1_50 ~= L2_51 then
      L2_51 = _UPVALUE2_
      if A1_50 ~= L2_51 and A1_50 ~= "wlan" and A1_50 ~= "DMZ" and A1_50 ~= "vlan" then
        L2_51 = string
        L2_51 = L2_51.sub
        L3_52 = A1_50
        L2_51 = L2_51(L3_52, 1, 3)
        if L2_51 ~= "bdg" then
          L2_51 = _UPVALUE0_
          L2_51 = L2_51.INVALID_INTERFACE
          return L2_51
        end
      end
    end
  end
  if A1_50 ~= "LAN" then
    L2_51 = _UPVALUE1_
    if A1_50 ~= L2_51 then
      L2_51 = _UPVALUE2_
    end
  elseif A1_50 == L2_51 or A1_50 == "DMZ" or A1_50 == "wlan" then
    L2_51 = _UPVALUE0_
    L2_51 = L2_51.NOT_SUPPORTED
    return L2_51
  end
  L2_51 = {}
  L3_52 = _UPVALUE3_
  L3_52 = L3_52.interface
  L3_52 = L3_52 .. "=" .. "'" .. A1_50 .. "'"
  L2_51 = stats_db.getRowWhere(_UPVALUE4_, L3_52)
  if L2_51 == _UPVALUE0_.NIL then
    L2_51 = {}
    return _UPVALUE0_.FAILURE
  else
    return _UPVALUE0_.SUCCESS, A0_49, L2_51
  end
end
function trafficCountersSet(A0_53, A1_54, A2_55, A3_56, A4_57, A5_58)
  local L7_59
  L7_59 = _UPVALUE0_
  L7_59 = L7_59.NOT_SUPPORTED
  return L7_59, A0_53
end
function trafficCountersCreate(A0_60, A1_61, A2_62, A3_63, A4_64)
  return _UPVALUE0_.NOT_SUPPORTED
end
function trafficCountersDelete(A0_65)
  local L2_66
  L2_66 = _UPVALUE0_
  L2_66 = L2_66.NOT_SUPPORTED
  return L2_66, A0_65
end
function interfaceStatsGet(A0_67)
  local L1_68
  L1_68 = stats_db
  L1_68 = L1_68.getRow
  L1_68 = L1_68(_UPVALUE0_, _UPVALUE1_.interface, A0_67)
  if L1_68 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L1_68
end
function wanConnectionTypeGet(A0_69)
  local L1_70, L2_71
  L1_70 = _UPVALUE0_
  L1_70 = L1_70.NIL
  if A0_69 == L1_70 then
    L1_70 = _UPVALUE0_
    L1_70 = L1_70.INVALID_INTERFACE
    return L1_70
  end
  L1_70 = PRODUCT_ID
  if L1_70 ~= "DSR-1000AC_Ax" then
    L1_70 = PRODUCT_ID
    if L1_70 ~= "DSR-500AC_Ax" then
      L1_70 = PRODUCT_ID
      if L1_70 ~= "DSR-1000_Bx" then
        L1_70 = PRODUCT_ID
        if L1_70 ~= "DSR-500_Bx" then
          L1_70 = _UPVALUE1_
          if A0_69 ~= L1_70 then
            L1_70 = _UPVALUE2_
            if A0_69 ~= L1_70 then
              L1_70 = _UPVALUE0_
              L1_70 = L1_70.INVALID_INTERFACE
              return L1_70
            end
          end
        end
      end
    end
  end
  L1_70 = _UPVALUE3_
  L1_70 = L1_70.ifName
  L2_71 = " = '"
  L1_70 = L1_70 .. L2_71 .. A0_69 .. "' and " .. _UPVALUE3_.addressFamily .. " = " .. _UPVALUE4_
  L2_71 = db
  L2_71 = L2_71.getAttributeWhere
  L2_71 = L2_71(_UPVALUE5_, L1_70, _UPVALUE3_.connectionType)
  if L2_71 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  if L2_71 == "pppoe" then
    L1_70 = _UPVALUE3_.ifName .. " = '" .. A0_69 .. "' and " .. _UPVALUE3_.profileName .. " = '" .. _UPVALUE6_ .. "'"
    if db.getAttributeWhere(_UPVALUE7_, L1_70, _UPVALUE3_.status) == _UPVALUE0_.NIL then
      return _UPVALUE0_.FAILURE
    end
    if _UPVALUE8_ == db.getAttributeWhere(_UPVALUE7_, L1_70, _UPVALUE3_.status) then
      L2_71 = _UPVALUE9_
    end
  end
  return _UPVALUE0_.SUCCESS, L2_71
end
function DedicatedinterfaceStatsGet()
  local L0_72, L1_73, L2_74, L3_75, L4_76, L5_77, L6_78, L7_79, L8_80, L9_81, L10_82, L11_83, L12_84, L13_85, L14_86, L15_87, L16_88
  L0_72 = db
  L0_72 = L0_72.getAttribute
  L1_73 = _UPVALUE0_
  L2_74 = _UPVALUE1_
  L2_74 = L2_74.ifName
  L3_75 = _UPVALUE2_
  L4_76 = _UPVALUE1_
  L4_76 = L4_76.interfaceName
  L0_72 = L0_72(L1_73, L2_74, L3_75, L4_76)
  L1_73 = db
  L1_73 = L1_73.getAttribute
  L2_74 = _UPVALUE0_
  L3_75 = _UPVALUE1_
  L3_75 = L3_75.ifName
  L4_76 = _UPVALUE3_
  L5_77 = _UPVALUE1_
  L5_77 = L5_77.interfaceName
  L1_73 = L1_73(L2_74, L3_75, L4_76, L5_77)
  L2_74 = _UPVALUE2_
  L3_75 = ""
  L4_76 = db
  L4_76 = L4_76.getRowWhere
  L5_77 = _UPVALUE4_
  L6_78 = _UPVALUE1_
  L6_78 = L6_78.ifName
  L7_79 = " = '"
  L8_80 = L2_74
  L9_81 = "' and "
  L10_82 = _UPVALUE1_
  L10_82 = L10_82.addressFamily
  L11_83 = " = 2"
  L6_78 = L6_78 .. L7_79 .. L8_80 .. L9_81 .. L10_82 .. L11_83
  L4_76 = L4_76(L5_77, L6_78)
  if L4_76 ~= nil then
    L3_75 = L4_76["NimfConf.ConnectionType"]
  end
  L5_77, L6_78 = nil, nil
  if L3_75 ~= "dhcpc" and L3_75 ~= "ifStatic" then
    L7_79 = stats_db
    L7_79 = L7_79.getRowWhere
    L8_80 = "interfaceStats"
    L9_81 = "interfaceName = 'ppp1'"
    L7_79 = L7_79(L8_80, L9_81)
    L5_77 = L7_79
    L7_79 = stats_db
    L7_79 = L7_79.getRowWhere
    L8_80 = "interfaceUsage"
    L9_81 = "interfaceName = 'ppp1'"
    L7_79 = L7_79(L8_80, L9_81)
    L6_78 = L7_79
  else
    L7_79 = stats_db
    L7_79 = L7_79.getRowWhere
    L8_80 = "interfaceStats"
    L9_81 = "interfaceName = '"
    L10_82 = L0_72
    L11_83 = "'"
    L9_81 = L9_81 .. L10_82 .. L11_83
    L7_79 = L7_79(L8_80, L9_81)
    L5_77 = L7_79
    L7_79 = stats_db
    L7_79 = L7_79.getRowWhere
    L8_80 = "interfaceUsage"
    L9_81 = "interfaceName = '"
    L10_82 = L0_72
    L11_83 = "'"
    L9_81 = L9_81 .. L10_82 .. L11_83
    L7_79 = L7_79(L8_80, L9_81)
    L6_78 = L7_79
  end
  if L5_77 == nil then
    L7_79 = {}
    L5_77 = L7_79
  end
  if L6_78 == nil then
    L7_79 = {}
    L6_78 = L7_79
  end
  L7_79 = ""
  L8_80 = ""
  L9_81 = db
  L9_81 = L9_81.getAttribute
  L10_82 = "PortMgmt"
  L11_83 = "PortName"
  L12_84 = "DedicatedWAN"
  L13_85 = "PortStatus"
  L9_81 = L9_81(L10_82, L11_83, L12_84, L13_85)
  L10_82 = stats_db
  L10_82 = L10_82.getRowWhere
  L11_83 = "NimfStatus"
  L12_84 = _UPVALUE1_
  L12_84 = L12_84.ifName
  L13_85 = " = '"
  L14_86 = L2_74
  L15_87 = "' and "
  L16_88 = _UPVALUE1_
  L16_88 = L16_88.addressFamily
  L12_84 = L12_84 .. L13_85 .. L14_86 .. L15_87 .. L16_88 .. " = 2"
  L10_82 = L10_82(L11_83, L12_84)
  L11_83 = L10_82["NimfStatus.WanUpTime"]
  L11_83 = L11_83 or ""
  if L11_83 == nil or L9_81 == "0" then
    L11_83 = "Not Yet Available"
  end
  L12_84 = L5_77["interfaceStats.tx_packets"]
  L13_85 = L5_77["interfaceStats.rx_packets"]
  L14_86 = L5_77["interfaceStats.collisions"]
  L15_87 = L6_78["interfaceUsage.tx_bytes_rate"]
  L16_88 = L6_78["interfaceUsage.rx_bytes_rate"]
  return _UPVALUE5_.SUCCESS, L12_84, L13_85, L14_86, L15_87, L16_88, L11_83
end
function laninterfaceStatsGet()
  local L0_89, L1_90, L2_91, L3_92, L4_93, L5_94, L6_95, L7_96
  L0_89 = stats_db
  L0_89 = L0_89.getRowWhere
  L1_90 = "interfaceStats"
  L2_91 = "interfaceName = 'bdg1'"
  L0_89 = L0_89(L1_90, L2_91)
  L1_90 = stats_db
  L1_90 = L1_90.getRowWhere
  L2_91 = "interfaceUsage"
  L3_92 = "interfaceName = 'bdg1'"
  L1_90 = L1_90(L2_91, L3_92)
  intUsageRow = L1_90
  if L0_89 == nil then
    L1_90 = {}
    L0_89 = L1_90
  end
  L1_90 = intUsageRow
  if L1_90 == nil then
    L1_90 = {}
    intUsageRow = L1_90
  end
  L1_90 = "LogicalIfName = 'LAN' and addressFamily = 2"
  L2_91 = stats_db
  L2_91 = L2_91.getRowWhere
  L3_92 = "NimfStatus"
  L4_93 = L1_90
  L2_91 = L2_91(L3_92, L4_93)
  L3_92 = L2_91["NimfStatus.WanUpTime"]
  L3_92 = L3_92 or ""
  lanUptime = L3_92
  L3_92 = L0_89["interfaceStats.tx_packets"]
  L4_93 = L0_89["interfaceStats.rx_packets"]
  L5_94 = L0_89["interfaceStats.collisions"]
  L6_95 = intUsageRow
  L6_95 = L6_95["interfaceUsage.tx_bytes_rate"]
  L7_96 = intUsageRow
  L7_96 = L7_96["interfaceUsage.rx_bytes_rate"]
  return _UPVALUE0_.SUCCESS, L3_92, L4_93, L5_94, L6_95, L7_96, lanUptime
end
function configurablePortStatsGet()
  local L0_97, L1_98, L2_99, L3_100, L4_101, L5_102, L6_103, L7_104, L8_105, L9_106, L10_107, L11_108, L12_109, L13_110, L14_111, L15_112, L16_113, L17_114, L18_115, L19_116
  L0_97 = db
  L0_97 = L0_97.getAttribute
  L1_98 = _UPVALUE0_
  L2_99 = _UPVALUE1_
  L2_99 = L2_99.ifName
  L3_100 = _UPVALUE2_
  L4_101 = _UPVALUE1_
  L4_101 = L4_101.interfaceName
  L0_97 = L0_97(L1_98, L2_99, L3_100, L4_101)
  L1_98, L2_99, L3_100, L4_101, L5_102, L6_103, L7_104 = nil, nil, nil, nil, nil, nil, nil
  L8_105 = db
  L8_105 = L8_105.getRow
  L9_106 = "ConfigPort"
  L10_107 = "_ROWID_"
  L11_108 = "1"
  L8_105 = L8_105(L9_106, L10_107, L11_108)
  if L8_105 ~= nil then
    L9_106 = L8_105["ConfigPort.LogicalIfName"]
    if L9_106 ~= nil then
      L9_106 = L8_105["ConfigPort.LogicalIfName"]
      if L9_106 ~= "LAN" then
        L9_106 = ""
        L10_107, L11_108 = nil, nil
        L12_109 = L8_105["ConfigPort.LogicalIfName"]
        L13_110 = _UPVALUE2_
        if L12_109 == L13_110 then
          L12_109 = "("
          L13_110 = "WAN"
          L14_111 = ")"
          L9_106 = L12_109 .. L13_110 .. L14_111
          L12_109 = db
          L12_109 = L12_109.getRowWhere
          L13_110 = _UPVALUE3_
          L14_111 = _UPVALUE1_
          L14_111 = L14_111.ifName
          L15_112 = " = '"
          L16_113 = L8_105["ConfigPort.LogicalIfName"]
          L17_114 = "' and "
          L18_115 = _UPVALUE1_
          L18_115 = L18_115.addressFamily
          L19_116 = " = 2"
          L14_111 = L14_111 .. L15_112 .. L16_113 .. L17_114 .. L18_115 .. L19_116
          L12_109 = L12_109(L13_110, L14_111)
          connectionTypeRow = L12_109
          L12_109 = connectionTypeRow
          if L12_109 ~= nil then
            L12_109 = connectionTypeRow
            L12_109 = L12_109["NimfConf.ConnectionType"]
            connectionType = L12_109
          end
          L12_109 = connectionType
          if L12_109 ~= "dhcpc" then
            L12_109 = connectionType
            if L12_109 ~= "ifStatic" then
              L12_109 = stats_db
              L12_109 = L12_109.getRowWhere
              L13_110 = "interfaceStats"
              L14_111 = "interfaceName = 'ppp2'"
              L12_109 = L12_109(L13_110, L14_111)
              L10_107 = L12_109
              L12_109 = stats_db
              L12_109 = L12_109.getRowWhere
              L13_110 = "interfaceUsage"
              L14_111 = "interfaceName = 'ppp2'"
              L12_109 = L12_109(L13_110, L14_111)
              L11_108 = L12_109
            end
          else
            L12_109 = stats_db
            L12_109 = L12_109.getRowWhere
            L13_110 = "interfaceStats"
            L14_111 = "interfaceName = '"
            L15_112 = L0_97
            L16_113 = "'"
            L14_111 = L14_111 .. L15_112 .. L16_113
            L12_109 = L12_109(L13_110, L14_111)
            L10_107 = L12_109
            L12_109 = stats_db
            L12_109 = L12_109.getRowWhere
            L13_110 = "interfaceUsage"
            L14_111 = "interfaceName = '"
            L15_112 = L0_97
            L16_113 = "'"
            L14_111 = L14_111 .. L15_112 .. L16_113
            L12_109 = L12_109(L13_110, L14_111)
            L11_108 = L12_109
          end
        else
          L12_109 = L8_105["ConfigPort.LogicalIfName"]
          if L12_109 == "DMZ" then
            L12_109 = "("
            L13_110 = "DMZ"
            L14_111 = ")"
            L9_106 = L12_109 .. L13_110 .. L14_111
            L12_109 = UNIT_NAME
            if L12_109 ~= "DSR-250" then
              L12_109 = UNIT_NAME
              if L12_109 ~= "DSR-250N" then
                L12_109 = UNIT_NAME
                if L12_109 ~= "DSR-150" then
                  L12_109 = UNIT_NAME
                end
              end
            elseif L12_109 == "DSR-150N" then
              L12_109 = db
              L12_109 = L12_109.getAttribute
              L13_110 = _UPVALUE4_
              L14_111 = _UPVALUE1_
              L14_111 = L14_111.ifName
              L15_112 = _UPVALUE5_
              L16_113 = _UPVALUE1_
              L16_113 = L16_113.interface
              L12_109 = L12_109(L13_110, L14_111, L15_112, L16_113)
              L0_97 = L12_109
            end
            L12_109 = stats_db
            L12_109 = L12_109.getRowWhere
            L13_110 = "interfaceStats"
            L14_111 = "interfaceName = '"
            L15_112 = L0_97
            L16_113 = "'"
            L14_111 = L14_111 .. L15_112 .. L16_113
            L12_109 = L12_109(L13_110, L14_111)
            L10_107 = L12_109
            L12_109 = stats_db
            L12_109 = L12_109.getRowWhere
            L13_110 = "interfaceUsage"
            L14_111 = "interfaceName = '"
            L15_112 = L0_97
            L16_113 = "'"
            L14_111 = L14_111 .. L15_112 .. L16_113
            L12_109 = L12_109(L13_110, L14_111)
            L11_108 = L12_109
          end
        end
        if L10_107 == nil then
          L12_109 = {}
          L10_107 = L12_109
        end
        if L11_108 == nil then
          L12_109 = {}
          L11_108 = L12_109
        end
        L12_109 = ""
        L13_110 = L8_105["ConfigPort.LogicalIfName"]
        if L13_110 == "DMZ" then
          L13_110 = io
          L13_110 = L13_110.open
          L14_111 = "/var/dmzUptime"
          L15_112 = "r"
          L13_110 = L13_110(L14_111, L15_112)
          uptimeFile = L13_110
          L13_110 = uptimeFile
          if L13_110 == nil then
            L12_109 = "Not Yet Available"
          else
            L13_110 = L8_105["ConfigPort.LogicalIfName"]
            if L13_110 == "DMZ" then
              L13_110 = uptimeFile
              L14_111 = L13_110
              L13_110 = L13_110.read
              L15_112 = "*all"
              L13_110 = L13_110(L14_111, L15_112)
              upTime = L13_110
              L13_110 = io
              L13_110 = L13_110.close
              L14_111 = uptimeFile
              L13_110(L14_111)
              L13_110 = io
              L13_110 = L13_110.open
              L14_111 = "/proc/uptime"
              L15_112 = "r"
              L13_110 = L13_110(L14_111, L15_112)
              if L13_110 == nil then
                L12_109 = "Not Yet Available"
              end
              if L13_110 then
                L15_112 = L13_110
                L14_111 = L13_110.read
                L16_113 = "*all"
                L14_111 = L14_111(L15_112, L16_113)
                L15_112 = io
                L15_112 = L15_112.close
                L16_113 = L13_110
                L15_112(L16_113)
                L15_112 = util
                L15_112 = L15_112.split
                L16_113 = L14_111
                L17_114 = " "
                L15_112 = L15_112(L16_113, L17_114)
                L14_111 = L15_112[1]
                L16_113 = math
                L16_113 = L16_113.floor
                L17_114 = L14_111
                L16_113 = L16_113(L17_114)
                L17_114 = tonumber
                L18_115 = upTime
                L17_114 = L17_114(L18_115)
                L12_109 = L16_113 - L17_114
                L16_113 = math
                L16_113 = L16_113.floor
                L17_114 = L12_109 / 60
                L16_113 = L16_113(L17_114)
                L17_114 = L12_109 % 60
                if L17_114 < 10 then
                  L18_115 = "0"
                  L19_116 = L17_114
                  L17_114 = L18_115 .. L19_116
                end
                L18_115 = math
                L18_115 = L18_115.floor
                L19_116 = L16_113 / 60
                L18_115 = L18_115(L19_116)
                L16_113 = L16_113 % 60
                if L16_113 < 10 then
                  L19_116 = "0"
                  L16_113 = L19_116 .. L16_113
                end
                L19_116 = math
                L19_116 = L19_116.floor
                L19_116 = L19_116(L18_115 / 24)
                L18_115 = L18_115 % 24
                if L18_115 < 10 then
                  L18_115 = "0" .. L18_115
                end
                L12_109 = L19_116 .. " Days " .. L18_115 .. ":" .. L16_113 .. ":" .. L17_114
              end
            end
          end
        else
          L13_110 = L8_105["ConfigPort.LogicalIfName"]
          L14_111 = _UPVALUE2_
          if L13_110 == L14_111 then
            L13_110 = stats_db
            L13_110 = L13_110.getRowWhere
            L14_111 = "NimfStatus"
            L15_112 = _UPVALUE1_
            L15_112 = L15_112.ifName
            L16_113 = " = '"
            L17_114 = L8_105["ConfigPort.LogicalIfName"]
            L18_115 = "' and "
            L19_116 = _UPVALUE1_
            L19_116 = L19_116.addressFamily
            L15_112 = L15_112 .. L16_113 .. L17_114 .. L18_115 .. L19_116 .. " = 2"
            L13_110 = L13_110(L14_111, L15_112)
            L14_111 = L13_110["NimfStatus.WanUpTime"]
            L12_109 = L14_111 or ""
            L14_111 = ""
            L15_112 = db
            L15_112 = L15_112.getAttribute
            L16_113 = "PortMgmt"
            L17_114 = "PortName"
            L18_115 = "OptionalPort"
            L19_116 = "PortStatus"
            L15_112 = L15_112(L16_113, L17_114, L18_115, L19_116)
            if L15_112 == "0" then
              L12_109 = "Not Yet Available"
            end
          end
        end
        L1_98 = L10_107["interfaceStats.tx_packets"]
        L2_99 = L10_107["interfaceStats.rx_packets"]
        L3_100 = L10_107["interfaceStats.collisions"]
        L4_101 = L11_108["interfaceUsage.tx_bytes_rate"]
        L5_102 = L11_108["interfaceUsage.rx_bytes_rate"]
        L6_103 = L12_109
        L7_104 = L9_106
      end
    end
  end
  L9_106 = _UPVALUE6_
  L9_106 = L9_106.SUCCESS
  L10_107 = L1_98
  L11_108 = L2_99
  L12_109 = L3_100
  L13_110 = L4_101
  L14_111 = L5_102
  L15_112 = L6_103
  L16_113 = L7_104
  return L9_106, L10_107, L11_108, L12_109, L13_110, L14_111, L15_112, L16_113
end
function vlanPortStatsGet()
  local L0_117, L1_118, L2_119, L3_120, L4_121, L5_122, L6_123, L7_124, L8_125, L9_126, L10_127, L11_128, L12_129, L13_130
  L0_117 = 0
  L1_118 = {}
  L2_119 = db
  L2_119 = L2_119.getRow
  L3_120 = "VlanStatus"
  L4_121 = "_ROWID_"
  L2_119 = L2_119(L3_120, L4_121, L5_122)
  if L2_119 ~= nil then
    L3_120 = L2_119["VlanStatus.VlanState"]
    if L3_120 == "1" then
      L3_120 = stats_db
      L3_120 = L3_120.getRowWhere
      L4_121 = "networkInterface"
      L3_120 = L3_120(L4_121, L5_122)
      if L3_120 ~= nil then
        L4_121 = #L3_120
        if L4_121 ~= 0 then
          L4_121 = "displayOdd"
          for L8_125, L9_126 in L5_122(L6_123) do
            L10_127 = L9_126["networkInterface.interfaceName"]
            if L10_127 ~= "bdg1" then
              L0_117 = L0_117 + 1
              L10_127 = {}
              L1_118[L0_117] = L10_127
              L10_127 = stats_db
              L10_127 = L10_127.getRowWhere
              L11_128 = "interfaceStats"
              L12_129 = "interfaceName = '"
              L13_130 = L9_126["networkInterface.interfaceName"]
              L12_129 = L12_129 .. L13_130 .. "'"
              L10_127 = L10_127(L11_128, L12_129)
              intStatsRow = L10_127
              L10_127 = stats_db
              L10_127 = L10_127.getRowWhere
              L11_128 = "interfaceUsage"
              L12_129 = "interfaceName = '"
              L13_130 = L9_126["networkInterface.interfaceName"]
              L12_129 = L12_129 .. L13_130 .. "'"
              L10_127 = L10_127(L11_128, L12_129)
              intUsageRow = L10_127
              L10_127 = intStatsRow
              if L10_127 == nil then
                L10_127 = {}
                intStatsRow = L10_127
              end
              L10_127 = intUsageRow
              if L10_127 == nil then
                L10_127 = {}
                intUsageRow = L10_127
              end
              L10_127 = "Not Yet Available"
              lanUptime = L10_127
              L10_127 = io
              L10_127 = L10_127.open
              L11_128 = "/var/"
              L12_129 = L9_126["networkInterface.LogicalIfName"]
              L13_130 = "Uptime"
              L11_128 = L11_128 .. L12_129 .. L13_130
              L12_129 = "r"
              L10_127 = L10_127(L11_128, L12_129)
              uptimeFile = L10_127
              L10_127 = uptimeFile
              if L10_127 == nil then
                L10_127 = "Not Yet Available"
                lanUptime = L10_127
              else
                L10_127 = io
                L10_127 = L10_127.input
                L11_128 = "/var/"
                L12_129 = L9_126["networkInterface.LogicalIfName"]
                L13_130 = "Uptime"
                L11_128 = L11_128 .. L12_129 .. L13_130
                L10_127(L11_128)
                L10_127 = os
                L10_127 = L10_127.time
                L10_127 = L10_127()
                timeNow = L10_127
                L10_127 = tonumber
                L11_128 = timeNow
                L10_127 = L10_127(L11_128)
                L11_128 = io
                L11_128 = L11_128.read
                L12_129 = "*all"
                L11_128 = L11_128(L12_129)
                L10_127 = L10_127 - L11_128
                lanUptime = L10_127
                L10_127 = math
                L10_127 = L10_127.floor
                L11_128 = lanUptime
                L11_128 = L11_128 / 60
                L10_127 = L10_127(L11_128)
                L11_128 = lanUptime
                L11_128 = L11_128 % 60
                L12_129 = math
                L12_129 = L12_129.floor
                L13_130 = L10_127 / 60
                L12_129 = L12_129(L13_130)
                L10_127 = L10_127 % 60
                L13_130 = math
                L13_130 = L13_130.floor
                L13_130 = L13_130(L12_129 / 24)
                L12_129 = L12_129 % 24
                lanUptime = L13_130 .. " Days " .. L12_129 .. " :" .. L10_127 .. " :" .. L11_128
              end
              if L4_121 == "displayOdd" then
                L4_121 = "displayEven"
              elseif L4_121 == "displayEven" then
                L4_121 = "displayOdd"
              end
              L10_127 = L1_118[L0_117]
              L11_128 = L9_126["networkInterface.LogicalIfName"]
              L10_127.interfaceName = L11_128
              L10_127 = L1_118[L0_117]
              L11_128 = intStatsRow
              L11_128 = L11_128["interfaceStats.tx_packets"]
              L10_127.tx_packets = L11_128
              L10_127 = L1_118[L0_117]
              L11_128 = intStatsRow
              L11_128 = L11_128["interfaceStats.rx_packets"]
              L10_127.rx_packets = L11_128
              L10_127 = L1_118[L0_117]
              L11_128 = intStatsRow
              L11_128 = L11_128["interfaceStats.collisions"]
              L10_127.collisions = L11_128
              L10_127 = L1_118[L0_117]
              L11_128 = intUsageRow
              L11_128 = L11_128["interfaceUsage.tx_bytes_rate"]
              L10_127.tx_bytes_rate = L11_128
              L10_127 = L1_118[L0_117]
              L11_128 = intUsageRow
              L11_128 = L11_128["interfaceUsage.rx_bytes_rate"]
              L10_127.rx_bytes_rate = L11_128
              L10_127 = L1_118[L0_117]
              L11_128 = lanUptime
              L10_127.lanUptime = L11_128
            end
          end
        end
      end
    end
  end
  L3_120 = _UPVALUE0_
  L3_120 = L3_120.SUCCESS
  L4_121 = L1_118
  return L3_120, L4_121
end
function activeInformationGet()
  local L0_131, L1_132, L2_133, L3_134, L4_135, L5_136, L6_137, L7_138, L8_139, L9_140, L10_141
  L0_131 = os
  L0_131 = L0_131.execute
  L1_132 = "/pfrm2.0/bin/netstat -s -w | grep 'ICMP messages received' | awk '{print $1}'"
  L2_133 = "> /tmp/netStat.txt"
  L1_132 = L1_132 .. L2_133
  L0_131(L1_132)
  L0_131 = assert
  L1_132 = io
  L1_132 = L1_132.open
  L2_133 = "/tmp/netStat.txt"
  L3_134 = "r"
  L10_141 = L1_132(L2_133, L3_134)
  L0_131 = L0_131(L1_132, L2_133, L3_134, L4_135, L5_136, L6_137, L7_138, L8_139, L9_140, L10_141, L1_132(L2_133, L3_134))
  L2_133 = L0_131
  L1_132 = L0_131.read
  L3_134 = "*all"
  L1_132 = L1_132(L2_133, L3_134)
  if L1_132 == "" then
    L1_132 = 0
  end
  L3_134 = L0_131
  L2_133 = L0_131.close
  L2_133(L3_134)
  L2_133 = db
  L2_133 = L2_133.getTable
  L3_134 = "vlan"
  L2_133 = L2_133(L3_134)
  L3_134 = 0
  L4_135 = 0
  L5_136 = ""
  L6_137 = 0
  for L10_141, _FORV_11_ in L7_138(L8_139) do
    L3_134 = L3_134 + 1
    if L2_133[L3_134]["vlan.portName"] == "dummy" then
      L4_135 = L4_135 + 1
    end
  end
  if L4_135 > 0 then
    L10_141 = L4_135
    L5_136 = L8_139 .. L9_140
  end
  L10_141 = "_ROWID_"
  if L8_139 == "DSR-150N" or L8_139 == "DSR-250N" or L8_139 == "DSR-500N" or L8_139 == "DSR-1000N" or L8_139 == "DSR-1000AC" or L8_139 == "DSR-500AC" then
    L10_141 = db
    L10_141 = L10_141.getTable
    L10_141 = L10_141("dot11VAP")
    for _FORV_14_, _FORV_15_ in pairs(L10_141) do
    end
  end
  if L9_140 > 0 then
    L10_141 = ", "
    L5_136 = L9_140 .. L10_141 .. "AP's-" .. tostring(L7_138 - L4_135)
  end
  L10_141 = "networkInterface"
  if L9_140 == "1" then
    L6_137 = L6_137 + 1
  end
  L10_141 = "ConfigPort"
  if L9_140 then
    L10_141 = ", "
    L5_136 = L9_140 .. L10_141 .. "DMZ-1"
    if L9_140 ~= "DSR-150N" then
    elseif L9_140 == "DSR-250" then
      L10_141 = "networkInterface"
      if L9_140 == "1" then
        L6_137 = L6_137 + 1
      end
    end
  else
    L10_141 = "networkInterface"
    if L9_140 == "1" then
      L6_137 = L6_137 + 1
    else
      L10_141 = "networkInterface"
      if L9_140 == "1" then
        L6_137 = L6_137 + 1
      end
    end
  end
  if L6_137 > 0 then
    L10_141 = ", "
    L5_136 = L9_140 .. L10_141 .. "WAN's-" .. tostring(L6_137)
  end
  L10_141 = L1_132
  return L9_140, L10_141, L4_135, L7_138, L5_136
end
function ipsInfoGet()
  local L0_142, L1_143, L2_144
  L0_142 = db
  L0_142 = L0_142.getRow
  L1_143 = _UPVALUE0_
  L2_144 = "_ROWID_"
  L0_142 = L0_142(L1_143, L2_144, "1")
  if L0_142 == nil then
    L1_143 = {}
    L0_142 = L1_143
  end
  L1_143 = _UPVALUE0_
  L2_144 = "."
  L1_143 = L1_143 .. L2_144 .. _UPVALUE1_.ipsEnable
  L1_143 = L0_142[L1_143]
  L2_144 = _UPVALUE0_
  L2_144 = L2_144 .. "." .. _UPVALUE1_.idsEnable
  L2_144 = L0_142[L2_144]
  return _UPVALUE2_.SUCCESS, L1_143, L2_144
end
function configurablePortUsageGet()
  return (db.getAttribute("ConfigPort", "_ROWID_", "1", "LogicalIfName"))
end
