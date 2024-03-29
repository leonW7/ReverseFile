local L0_0
L0_0 = module
L0_0("com.teamf1.core.sslvpn.portforwarding", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/sslvpn_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.sslvpn.returnCodes")
portforwardingTable = "SSLVPNPortForwardingAppsMap"
;({}).appsMapServerIp = "ServerIP"
;({}).appsMapPort = "Port"
portforwardingFQDNTable = "SSLVPNPortForwardingFQDNMap"
;({}).FQDNMapServerIp = "ServerIP"
;({}).FQDNMapFQDNName = "FQDNName"
function appsMapServerIpGet()
  local L0_1, L1_2
  L0_1 = db
  L0_1 = L0_1.getNextRowId
  L1_2 = _UPVALUE0_
  L0_1 = L0_1(L1_2, portforwardingTable)
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(portforwardingTable, _UPVALUE1_, L0_1, _UPVALUE2_.appsMapServerIp)
  if L1_2 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_1, L1_2
end
function appsMapServerIpGetNext(A0_3)
  local L1_4, L2_5
  L1_4 = _UPVALUE0_
  L1_4 = L1_4.NIL
  if A0_3 ~= L1_4 then
    L1_4 = tonumber
    L2_5 = A0_3
    L1_4 = L1_4(L2_5)
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.NIL
  elseif L1_4 == L2_5 then
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.INVALID_ARGUMENT
    return L1_4
  end
  L1_4 = db
  L1_4 = L1_4.existsRow
  L2_5 = portforwardingTable
  L1_4 = L1_4(L2_5, _UPVALUE1_, A0_3)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.FALSE
  if L1_4 == L2_5 then
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.INVALID_ARGUMENT
    return L1_4
  end
  L1_4 = db
  L1_4 = L1_4.getNextRowId
  L2_5 = A0_3
  L1_4 = L1_4(L2_5, portforwardingTable)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if L1_4 == L2_5 then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.NOT_EXIST
    return L2_5
  end
  L2_5 = db
  L2_5 = L2_5.getAttribute
  L2_5 = L2_5(portforwardingTable, _UPVALUE1_, L1_4, _UPVALUE2_.appsMapServerIp)
  if L2_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L2_5
end
function appsMapServerIpSet(A0_6, A1_7)
  if A0_6 == _UPVALUE0_.NIL or tonumber(A0_6) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(portforwardingTable, _UPVALUE1_, A0_6) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_7 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE2_.ipAddressCheck("2", A1_7)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(portforwardingTable, _UPVALUE1_, A0_6, _UPVALUE3_.appsMapServerIp, A1_7) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_6
  end
  return _UPVALUE0_.SUCCESS, A0_6
end
function appsMapServerIpDelete(A0_8, A1_9)
  local L3_10
  L3_10 = _UPVALUE0_
  L3_10 = L3_10.NOT_SUPPORTED
  return L3_10, A0_8
end
function appsMapPortGet()
  local L0_11, L1_12
  L0_11 = db
  L0_11 = L0_11.getNextRowId
  L1_12 = _UPVALUE0_
  L0_11 = L0_11(L1_12, portforwardingTable)
  L1_12 = db
  L1_12 = L1_12.getAttribute
  L1_12 = L1_12(portforwardingTable, _UPVALUE1_, L0_11, _UPVALUE2_.appsMapPort)
  if L1_12 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_11, L1_12
end
function appsMapPortGetNext(A0_13)
  local L1_14, L2_15
  L1_14 = _UPVALUE0_
  L1_14 = L1_14.NIL
  if A0_13 ~= L1_14 then
    L1_14 = tonumber
    L2_15 = A0_13
    L1_14 = L1_14(L2_15)
    L2_15 = _UPVALUE0_
    L2_15 = L2_15.NIL
  elseif L1_14 == L2_15 then
    L1_14 = _UPVALUE0_
    L1_14 = L1_14.INVALID_ARGUMENT
    return L1_14
  end
  L1_14 = db
  L1_14 = L1_14.existsRow
  L2_15 = portforwardingTable
  L1_14 = L1_14(L2_15, _UPVALUE1_, A0_13)
  L2_15 = _UPVALUE0_
  L2_15 = L2_15.FALSE
  if L1_14 == L2_15 then
    L1_14 = _UPVALUE0_
    L1_14 = L1_14.INVALID_ARGUMENT
    return L1_14
  end
  L1_14 = db
  L1_14 = L1_14.getNextRowId
  L2_15 = A0_13
  L1_14 = L1_14(L2_15, portforwardingTable)
  L2_15 = _UPVALUE0_
  L2_15 = L2_15.NIL
  if L1_14 == L2_15 then
    L2_15 = _UPVALUE0_
    L2_15 = L2_15.NOT_EXIST
    return L2_15
  end
  L2_15 = db
  L2_15 = L2_15.getAttribute
  L2_15 = L2_15(portforwardingTable, _UPVALUE1_, L1_14, _UPVALUE2_.appsMapPort)
  if L2_15 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_14
  end
  return _UPVALUE0_.SUCCESS, L1_14, L2_15
end
function appsMapPortSet(A0_16, A1_17)
  if A0_16 == _UPVALUE0_.NIL or tonumber(A0_16) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(portforwardingTable, _UPVALUE1_, A0_16) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_17 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(portforwardingTable, _UPVALUE1_, A0_16, _UPVALUE2_.appsMapPort, A1_17) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_16
  end
  return _UPVALUE0_.SUCCESS, A0_16
end
function appsMapPortDelete(A0_18, A1_19)
  local L3_20
  L3_20 = _UPVALUE0_
  L3_20 = L3_20.NOT_SUPPORTED
  return L3_20, A0_18
end
function FQDNMapServerIpGet()
  local L0_21, L1_22
  L0_21 = db
  L0_21 = L0_21.getNextRowId
  L1_22 = _UPVALUE0_
  L0_21 = L0_21(L1_22, portforwardingFQDNTable)
  L1_22 = db
  L1_22 = L1_22.getAttribute
  L1_22 = L1_22(portforwardingFQDNTable, _UPVALUE1_, L0_21, _UPVALUE2_.FQDNMapServerIp)
  if L1_22 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_21, L1_22
end
function FQDNMapServerIpGetNext(A0_23)
  local L1_24, L2_25
  L1_24 = _UPVALUE0_
  L1_24 = L1_24.NIL
  if A0_23 ~= L1_24 then
    L1_24 = tonumber
    L2_25 = A0_23
    L1_24 = L1_24(L2_25)
    L2_25 = _UPVALUE0_
    L2_25 = L2_25.NIL
  elseif L1_24 == L2_25 then
    L1_24 = _UPVALUE0_
    L1_24 = L1_24.INVALID_ARGUMENT
    return L1_24
  end
  L1_24 = db
  L1_24 = L1_24.existsRow
  L2_25 = portforwardingFQDNTable
  L1_24 = L1_24(L2_25, _UPVALUE1_, A0_23)
  L2_25 = _UPVALUE0_
  L2_25 = L2_25.FALSE
  if L1_24 == L2_25 then
    L1_24 = _UPVALUE0_
    L1_24 = L1_24.INVALID_ARGUMENT
    return L1_24
  end
  L1_24 = db
  L1_24 = L1_24.getNextRowId
  L2_25 = A0_23
  L1_24 = L1_24(L2_25, portforwardingFQDNTable)
  L2_25 = _UPVALUE0_
  L2_25 = L2_25.NIL
  if L1_24 == L2_25 then
    L2_25 = _UPVALUE0_
    L2_25 = L2_25.NOT_EXIST
    return L2_25
  end
  L2_25 = db
  L2_25 = L2_25.getAttribute
  L2_25 = L2_25(portforwardingFQDNTable, _UPVALUE1_, L1_24, _UPVALUE2_.FQDNMapServerIp)
  if L2_25 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_24
  end
  return _UPVALUE0_.SUCCESS, L1_24, L2_25
end
function FQDNMapServerIpSet(A0_26, A1_27)
  local L2_28
  L2_28 = _UPVALUE0_
  L2_28 = L2_28.NIL
  if A0_26 ~= L2_28 then
    L2_28 = tonumber
    L2_28 = L2_28(A0_26)
  elseif L2_28 == _UPVALUE0_.NIL then
    L2_28 = _UPVALUE0_
    L2_28 = L2_28.INVALID_ARGUMENT
    return L2_28
  end
  L2_28 = db
  L2_28 = L2_28.existsRow
  L2_28 = L2_28(portforwardingFQDNTable, _UPVALUE1_, A0_26)
  if L2_28 == _UPVALUE0_.FALSE then
    L2_28 = _UPVALUE0_
    L2_28 = L2_28.INVALID_ARGUMENT
    return L2_28
  end
  L2_28 = nil
  if A1_27 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_28 = _UPVALUE2_.ipAddressCheck("2", A1_27)
  if L2_28 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(portforwardingFQDNTable, _UPVALUE1_, A0_26, _UPVALUE3_.FQDNMapServerIp, A1_27) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_26
  end
  return _UPVALUE0_.SUCCESS, A0_26
end
function FQDNMapServerIpDelete(A0_29, A1_30)
  local L3_31
  L3_31 = _UPVALUE0_
  L3_31 = L3_31.NOT_SUPPORTED
  return L3_31, A0_29
end
function FQDNMapFQDNNameGet()
  local L0_32, L1_33
  L0_32 = db
  L0_32 = L0_32.getNextRowId
  L1_33 = _UPVALUE0_
  L0_32 = L0_32(L1_33, portforwardingFQDNTable)
  L1_33 = db
  L1_33 = L1_33.getAttribute
  L1_33 = L1_33(portforwardingFQDNTable, _UPVALUE1_, L0_32, _UPVALUE2_.FQDNMapFQDNName)
  if L1_33 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_32, L1_33
end
function FQDNMapFQDNNameGetNext(A0_34)
  local L1_35, L2_36
  L1_35 = _UPVALUE0_
  L1_35 = L1_35.NIL
  if A0_34 ~= L1_35 then
    L1_35 = tonumber
    L2_36 = A0_34
    L1_35 = L1_35(L2_36)
    L2_36 = _UPVALUE0_
    L2_36 = L2_36.NIL
  elseif L1_35 == L2_36 then
    L1_35 = _UPVALUE0_
    L1_35 = L1_35.INVALID_ARGUMENT
    return L1_35
  end
  L1_35 = db
  L1_35 = L1_35.existsRow
  L2_36 = portforwardingFQDNTable
  L1_35 = L1_35(L2_36, _UPVALUE1_, A0_34)
  L2_36 = _UPVALUE0_
  L2_36 = L2_36.FALSE
  if L1_35 == L2_36 then
    L1_35 = _UPVALUE0_
    L1_35 = L1_35.INVALID_ARGUMENT
    return L1_35
  end
  L1_35 = db
  L1_35 = L1_35.getNextRowId
  L2_36 = A0_34
  L1_35 = L1_35(L2_36, portforwardingFQDNTable)
  L2_36 = _UPVALUE0_
  L2_36 = L2_36.NIL
  if L1_35 == L2_36 then
    L2_36 = _UPVALUE0_
    L2_36 = L2_36.NOT_EXIST
    return L2_36
  end
  L2_36 = db
  L2_36 = L2_36.getAttribute
  L2_36 = L2_36(portforwardingFQDNTable, _UPVALUE1_, L1_35, _UPVALUE2_.FQDNMapFQDNName)
  if L2_36 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_35
  end
  return _UPVALUE0_.SUCCESS, L1_35, L2_36
end
function FQDNMapFQDNNameSet(A0_37, A1_38)
  local L2_39
  L2_39 = _UPVALUE0_
  L2_39 = L2_39.NIL
  if A0_37 ~= L2_39 then
    L2_39 = tonumber
    L2_39 = L2_39(A0_37)
  elseif L2_39 == _UPVALUE0_.NIL then
    L2_39 = _UPVALUE0_
    L2_39 = L2_39.INVALID_ARGUMENT
    return L2_39
  end
  L2_39 = db
  L2_39 = L2_39.existsRow
  L2_39 = L2_39(portforwardingFQDNTable, _UPVALUE1_, A0_37)
  if L2_39 == _UPVALUE0_.FALSE then
    L2_39 = _UPVALUE0_
    L2_39 = L2_39.INVALID_ARGUMENT
    return L2_39
  end
  L2_39 = nil
  if A1_38 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_39 = _UPVALUE2_.fqdnCheck(A1_38)
  if L2_39 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(portforwardingFQDNTable, _UPVALUE1_, A0_37, _UPVALUE3_.FQDNMapFQDNName, A1_38) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_37
  end
  return _UPVALUE0_.SUCCESS, A0_37
end
function FQDNMapFQDNNameDelete(A0_40, A1_41)
  local L3_42
  L3_42 = _UPVALUE0_
  L3_42 = L3_42.NOT_SUPPORTED
  return L3_42, A0_40
end
function appsMapGet()
  local L0_43, L1_44, L2_45, L3_46
  L0_43 = db
  L0_43 = L0_43.getNextRowId
  L1_44 = _UPVALUE0_
  L2_45 = portforwardingTable
  L0_43 = L0_43(L1_44, L2_45)
  L1_44 = db
  L1_44 = L1_44.getRow
  L2_45 = portforwardingTable
  L3_46 = _UPVALUE1_
  L1_44 = L1_44(L2_45, L3_46, L0_43)
  L2_45 = _UPVALUE2_
  L2_45 = L2_45.NIL
  if L1_44 == L2_45 then
    L2_45 = _UPVALUE2_
    L2_45 = L2_45.FAILURE
    return L2_45
  end
  L2_45, L3_46 = nil, nil
  L2_45 = L1_44[portforwardingTable .. "." .. _UPVALUE3_.appsMapServerIp]
  L3_46 = L1_44[portforwardingTable .. "." .. _UPVALUE3_.appsMapPort]
  return _UPVALUE2_.SUCCESS, L0_43, L2_45, L3_46
end
function appsMapGetNext(A0_47)
  local L1_48, L2_49, L3_50, L4_51
  L1_48 = _UPVALUE0_
  L1_48 = L1_48.NIL
  if A0_47 ~= L1_48 then
    L1_48 = tonumber
    L2_49 = A0_47
    L1_48 = L1_48(L2_49)
    L2_49 = _UPVALUE0_
    L2_49 = L2_49.NIL
  elseif L1_48 == L2_49 then
    L1_48 = _UPVALUE0_
    L1_48 = L1_48.INVALID_ARGUMENT
    return L1_48
  end
  L1_48 = db
  L1_48 = L1_48.existsRow
  L2_49 = portforwardingTable
  L3_50 = _UPVALUE1_
  L4_51 = A0_47
  L1_48 = L1_48(L2_49, L3_50, L4_51)
  L2_49 = _UPVALUE0_
  L2_49 = L2_49.FALSE
  if L1_48 == L2_49 then
    L1_48 = _UPVALUE0_
    L1_48 = L1_48.INVALID_ARGUMENT
    return L1_48
  end
  L1_48 = db
  L1_48 = L1_48.getNextRowId
  L2_49 = A0_47
  L3_50 = portforwardingTable
  L1_48 = L1_48(L2_49, L3_50)
  L2_49 = _UPVALUE0_
  L2_49 = L2_49.NIL
  if L1_48 == L2_49 then
    L2_49 = _UPVALUE0_
    L2_49 = L2_49.NOT_EXIST
    return L2_49
  end
  L2_49 = db
  L2_49 = L2_49.getRow
  L3_50 = portforwardingTable
  L4_51 = _UPVALUE1_
  L2_49 = L2_49(L3_50, L4_51, L1_48)
  L3_50 = _UPVALUE0_
  L3_50 = L3_50.NIL
  if L2_49 == L3_50 then
    L3_50 = _UPVALUE0_
    L3_50 = L3_50.FAILURE
    return L3_50
  end
  L3_50, L4_51 = nil, nil
  L3_50 = L2_49[portforwardingTable .. "." .. _UPVALUE2_.appsMapServerIp]
  L4_51 = L2_49[portforwardingTable .. "." .. _UPVALUE2_.appsMapPort]
  return _UPVALUE0_.SUCCESS, L1_48, L3_50, L4_51
end
function appsMapGetCur(A0_52)
  local L1_53, L2_54, L3_55
  L1_53 = db
  L1_53 = L1_53.getRow
  L2_54 = portforwardingTable
  L3_55 = _UPVALUE0_
  L1_53 = L1_53(L2_54, L3_55, A0_52)
  L2_54 = _UPVALUE1_
  L2_54 = L2_54.NIL
  if L1_53 == L2_54 then
    L2_54 = _UPVALUE1_
    L2_54 = L2_54.FAILURE
    return L2_54
  end
  L2_54, L3_55 = nil, nil
  L2_54 = L1_53[portforwardingTable .. "." .. _UPVALUE2_.appsMapServerIp]
  L3_55 = L1_53[portforwardingTable .. "." .. _UPVALUE2_.appsMapPort]
  return _UPVALUE1_.SUCCESS, A0_52, L2_54, L3_55
end
function appsMapGetAll()
  local L0_56
  L0_56 = db
  L0_56 = L0_56.getTable
  L0_56 = L0_56(portforwardingTable, false)
  if L0_56 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_56
end
function appsMapSet(A0_57, A1_58, A2_59)
  local L3_60, L4_61
  L3_60 = _UPVALUE0_
  L3_60 = L3_60.NIL
  if A0_57 ~= L3_60 then
    L3_60 = tonumber
    L4_61 = A0_57
    L3_60 = L3_60(L4_61)
    L4_61 = _UPVALUE0_
    L4_61 = L4_61.NIL
  elseif L3_60 == L4_61 then
    L3_60 = _UPVALUE0_
    L3_60 = L3_60.INVALID_ARGUMENT
    return L3_60
  end
  L3_60 = db
  L3_60 = L3_60.existsRow
  L4_61 = portforwardingTable
  L3_60 = L3_60(L4_61, _UPVALUE1_, A0_57)
  L4_61 = _UPVALUE0_
  L4_61 = L4_61.FALSE
  if L3_60 == L4_61 then
    L3_60 = _UPVALUE0_
    L3_60 = L3_60.INVALID_ARGUMENT
    return L3_60
  end
  L3_60 = db
  L3_60 = L3_60.getRow
  L4_61 = portforwardingTable
  L3_60 = L3_60(L4_61, _UPVALUE1_, A0_57)
  L4_61 = nil
  if A1_58 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L4_61 = _UPVALUE2_.ipAddressCheck("2", A1_58)
  if L4_61 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE3_.SSLVPN_APPSMAPSERVERIP_INVALID
  end
  L3_60[portforwardingTable .. "." .. _UPVALUE4_.appsMapServerIp] = A1_58
  if A2_59 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L3_60[portforwardingTable .. "." .. _UPVALUE4_.appsMapPort] = A2_59
  if db.update(portforwardingTable, L3_60, A0_57) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_57
  end
  return _UPVALUE0_.SUCCESS, A0_57
end
function appsMapCreate(A0_62, A1_63)
  local L2_64, L3_65, L4_66, L5_67
  L2_64 = db
  L2_64 = L2_64.existsRowWhere
  L3_65 = portforwardingTable
  L4_66 = _UPVALUE0_
  L4_66 = L4_66.appsMapServerIp
  L5_67 = " ='"
  L4_66 = L4_66 .. L5_67 .. A0_62 .. "' AND " .. _UPVALUE0_.appsMapPort .. " ='" .. A1_63 .. "'"
  L2_64 = L2_64(L3_65, L4_66)
  L3_65 = _UPVALUE1_
  L3_65 = L3_65.FALSE
  if L2_64 ~= L3_65 then
    L2_64 = _UPVALUE2_
    L2_64 = L2_64.PORTFORWARDING_CONFIG_FAILED
    return L2_64
  end
  L2_64 = nil
  L3_65 = _UPVALUE1_
  L3_65 = L3_65.NIL
  if A0_62 == L3_65 then
    L3_65 = _UPVALUE1_
    L3_65 = L3_65.INVALID_ARGUMENT
    return L3_65
  end
  L3_65 = _UPVALUE3_
  L3_65 = L3_65.ipAddressCheck
  L4_66 = "2"
  L5_67 = A0_62
  L3_65 = L3_65(L4_66, L5_67)
  L2_64 = L3_65
  L3_65 = _UPVALUE1_
  L3_65 = L3_65.SUCCESS
  if L2_64 ~= L3_65 then
    L3_65 = _UPVALUE2_
    L3_65 = L3_65.SSLVPN_APPSMAPSERVERIP_INVALID
    return L3_65
  end
  L3_65 = {}
  L4_66 = portforwardingTable
  L5_67 = "."
  L4_66 = L4_66 .. L5_67 .. _UPVALUE0_.appsMapServerIp
  L3_65[L4_66] = A0_62
  L4_66 = _UPVALUE1_
  L4_66 = L4_66.NIL
  if A1_63 == L4_66 then
    L4_66 = _UPVALUE1_
    L4_66 = L4_66.INVALID_ARGUMENT
    return L4_66
  end
  L4_66 = portforwardingTable
  L5_67 = "."
  L4_66 = L4_66 .. L5_67 .. _UPVALUE0_.appsMapPort
  L3_65[L4_66] = A1_63
  L4_66 = db
  L4_66 = L4_66.insert
  L5_67 = portforwardingTable
  L4_66 = L4_66(L5_67, L3_65)
  L5_67 = _UPVALUE1_
  L5_67 = L5_67.NIL
  if L4_66 == L5_67 then
    L5_67 = _UPVALUE1_
    L5_67 = L5_67.FAILURE
    return L5_67
  end
  L5_67 = db
  L5_67 = L5_67.getAttributeWhere
  L5_67 = L5_67(portforwardingTable, _UPVALUE0_.appsMapServerIp .. " ='" .. A0_62 .. "' AND " .. _UPVALUE0_.appsMapPort .. " ='" .. A1_63 .. "'", _UPVALUE4_)
  return _UPVALUE1_.SUCCESS, L5_67
end
function appsMapDelete(A0_68)
  if A0_68 == _UPVALUE0_.NIL or tonumber(A0_68) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(portforwardingTable, _UPVALUE1_, A0_68) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.deleteRow(portforwardingTable, _UPVALUE1_, A0_68) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_68
  end
  return _UPVALUE0_.SUCCESS, A0_68
end
function appsMapDeleteAll()
  if db.deleteAllRows(portforwardingTable) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function fqdnMapGet()
  local L0_69, L1_70, L2_71, L3_72
  L0_69 = db
  L0_69 = L0_69.getNextRowId
  L1_70 = _UPVALUE0_
  L2_71 = portforwardingFQDNTable
  L0_69 = L0_69(L1_70, L2_71)
  L1_70 = db
  L1_70 = L1_70.getRow
  L2_71 = portforwardingFQDNTable
  L3_72 = _UPVALUE1_
  L1_70 = L1_70(L2_71, L3_72, L0_69)
  L2_71 = _UPVALUE2_
  L2_71 = L2_71.NIL
  if L1_70 == L2_71 then
    L2_71 = _UPVALUE2_
    L2_71 = L2_71.FAILURE
    return L2_71
  end
  L2_71, L3_72 = nil, nil
  L2_71 = L1_70[portforwardingFQDNTable .. "." .. _UPVALUE3_.FQDNMapServerIp]
  L3_72 = L1_70[portforwardingFQDNTable .. "." .. _UPVALUE3_.FQDNMapFQDNName]
  return _UPVALUE2_.SUCCESS, L0_69, L2_71, L3_72
end
function fqdnMapGetNext(A0_73)
  local L1_74, L2_75, L3_76, L4_77
  L1_74 = _UPVALUE0_
  L1_74 = L1_74.NIL
  if A0_73 ~= L1_74 then
    L1_74 = tonumber
    L2_75 = A0_73
    L1_74 = L1_74(L2_75)
    L2_75 = _UPVALUE0_
    L2_75 = L2_75.NIL
  elseif L1_74 == L2_75 then
    L1_74 = _UPVALUE0_
    L1_74 = L1_74.INVALID_ARGUMENT
    return L1_74
  end
  L1_74 = db
  L1_74 = L1_74.existsRow
  L2_75 = portforwardingFQDNTable
  L3_76 = _UPVALUE1_
  L4_77 = A0_73
  L1_74 = L1_74(L2_75, L3_76, L4_77)
  L2_75 = _UPVALUE0_
  L2_75 = L2_75.FALSE
  if L1_74 == L2_75 then
    L1_74 = _UPVALUE0_
    L1_74 = L1_74.INVALID_ARGUMENT
    return L1_74
  end
  L1_74 = db
  L1_74 = L1_74.getNextRowId
  L2_75 = A0_73
  L3_76 = portforwardingFQDNTable
  L1_74 = L1_74(L2_75, L3_76)
  L2_75 = _UPVALUE0_
  L2_75 = L2_75.NIL
  if L1_74 == L2_75 then
    L2_75 = _UPVALUE0_
    L2_75 = L2_75.NOT_EXIST
    return L2_75
  end
  L2_75 = db
  L2_75 = L2_75.getRow
  L3_76 = portforwardingFQDNTable
  L4_77 = _UPVALUE1_
  L2_75 = L2_75(L3_76, L4_77, L1_74)
  L3_76 = _UPVALUE0_
  L3_76 = L3_76.NIL
  if L2_75 == L3_76 then
    L3_76 = _UPVALUE0_
    L3_76 = L3_76.FAILURE
    return L3_76
  end
  L3_76, L4_77 = nil, nil
  L3_76 = L2_75[portforwardingFQDNTable .. "." .. _UPVALUE2_.FQDNMapServerIp]
  L4_77 = L2_75[portforwardingFQDNTable .. "." .. _UPVALUE2_.FQDNMapFQDNName]
  return _UPVALUE0_.SUCCESS, L1_74, L3_76, L4_77
end
function fqdnMapGetAll()
  local L0_78
  L0_78 = db
  L0_78 = L0_78.getTable
  L0_78 = L0_78(portforwardingFQDNTable, false)
  if L0_78 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_78
end
function fqdnMapSet(A0_79, A1_80, A2_81)
  local L3_82, L4_83
  L3_82 = _UPVALUE0_
  L3_82 = L3_82.NIL
  if A0_79 ~= L3_82 then
    L3_82 = tonumber
    L4_83 = A0_79
    L3_82 = L3_82(L4_83)
    L4_83 = _UPVALUE0_
    L4_83 = L4_83.NIL
  elseif L3_82 == L4_83 then
    L3_82 = _UPVALUE0_
    L3_82 = L3_82.INVALID_ARGUMENT
    return L3_82
  end
  L3_82 = db
  L3_82 = L3_82.existsRow
  L4_83 = portforwardingFQDNTable
  L3_82 = L3_82(L4_83, _UPVALUE1_, A0_79)
  L4_83 = _UPVALUE0_
  L4_83 = L4_83.FALSE
  if L3_82 == L4_83 then
    L3_82 = _UPVALUE0_
    L3_82 = L3_82.INVALID_ARGUMENT
    return L3_82
  end
  L3_82 = {}
  L4_83 = nil
  if A1_80 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L4_83 = _UPVALUE2_.ipAddressCheck("2", A1_80)
  if L4_83 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE3_.SSLVPN_FQDNSERVERIP_INVALID
  end
  L3_82[portforwardingFQDNTable .. "." .. _UPVALUE4_.FQDNMapServerIp] = A1_80
  if A2_81 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L4_83 = _UPVALUE2_.fqdnCheck(A2_81)
  if L4_83 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE3_.SSLVPN_FQDNNAME_INVALID
  end
  L3_82[portforwardingFQDNTable .. "." .. _UPVALUE4_.FQDNMapFQDNName] = A2_81
  if db.update(portforwardingFQDNTable, L3_82, A0_79) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_79
  end
  return _UPVALUE0_.SUCCESS, A0_79
end
function fqdnMapCreate(A0_84, A1_85)
  local L2_86, L3_87, L4_88, L5_89
  L2_86 = db
  L2_86 = L2_86.existsRowWhere
  L3_87 = portforwardingFQDNTable
  L4_88 = _UPVALUE0_
  L4_88 = L4_88.FQDNMapServerIp
  L5_89 = " ='"
  L4_88 = L4_88 .. L5_89 .. A0_84 .. "' AND " .. _UPVALUE0_.FQDNMapFQDNName .. " ='" .. A1_85 .. "'"
  L2_86 = L2_86(L3_87, L4_88)
  L3_87 = _UPVALUE1_
  L3_87 = L3_87.FALSE
  if L2_86 ~= L3_87 then
    L2_86 = _UPVALUE2_
    L2_86 = L2_86.FQDNMAP_CONFIG_FAILED
    return L2_86
  end
  L2_86 = {}
  L3_87 = nil
  L4_88 = _UPVALUE1_
  L4_88 = L4_88.NIL
  if A0_84 == L4_88 then
    L4_88 = _UPVALUE1_
    L4_88 = L4_88.INVALID_ARGUMENT
    return L4_88
  end
  L4_88 = _UPVALUE3_
  L4_88 = L4_88.ipAddressCheck
  L5_89 = "2"
  L4_88 = L4_88(L5_89, A0_84)
  L3_87 = L4_88
  L4_88 = _UPVALUE1_
  L4_88 = L4_88.SUCCESS
  if L3_87 ~= L4_88 then
    L4_88 = _UPVALUE2_
    L4_88 = L4_88.SSLVPN_FQDNSERVERIP_INVALID
    return L4_88
  end
  L4_88 = portforwardingFQDNTable
  L5_89 = "."
  L4_88 = L4_88 .. L5_89 .. _UPVALUE0_.FQDNMapServerIp
  L2_86[L4_88] = A0_84
  L4_88 = _UPVALUE1_
  L4_88 = L4_88.NIL
  if A1_85 == L4_88 then
    L4_88 = _UPVALUE1_
    L4_88 = L4_88.INVALID_ARGUMENT
    return L4_88
  end
  L4_88 = _UPVALUE3_
  L4_88 = L4_88.fqdnCheck
  L5_89 = A1_85
  L4_88 = L4_88(L5_89)
  L3_87 = L4_88
  L4_88 = _UPVALUE1_
  L4_88 = L4_88.SUCCESS
  if L3_87 ~= L4_88 then
    L4_88 = _UPVALUE2_
    L4_88 = L4_88.SSLVPN_FQDNNAME_INVALID
    return L4_88
  end
  L4_88 = portforwardingFQDNTable
  L5_89 = "."
  L4_88 = L4_88 .. L5_89 .. _UPVALUE0_.FQDNMapFQDNName
  L2_86[L4_88] = A1_85
  L4_88 = db
  L4_88 = L4_88.insert
  L5_89 = portforwardingFQDNTable
  L4_88 = L4_88(L5_89, L2_86)
  L5_89 = _UPVALUE1_
  L5_89 = L5_89.NIL
  if L4_88 == L5_89 then
    L5_89 = _UPVALUE1_
    L5_89 = L5_89.FAILURE
    return L5_89
  end
  L5_89 = db
  L5_89 = L5_89.getAttributeWhere
  L5_89 = L5_89(portforwardingFQDNTable, _UPVALUE0_.FQDNMapServerIp .. " ='" .. A0_84 .. "' AND " .. _UPVALUE0_.FQDNMapFQDNName .. " ='" .. A1_85 .. "'", _UPVALUE4_)
  return _UPVALUE1_.SUCCESS, L5_89
end
function fqdnMapDelete(A0_90)
  if A0_90 == _UPVALUE0_.NIL or tonumber(A0_90) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(portforwardingFQDNTable, _UPVALUE1_, A0_90) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.deleteRow(portforwardingFQDNTable, _UPVALUE1_, A0_90) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_90
  end
  return _UPVALUE0_.SUCCESS, A0_90
end
function fqdnMapDeleteAll()
  if db.deleteAllRows(portforwardingFQDNTable) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function fqdnMapGetCur(A0_91)
  local L1_92, L2_93, L3_94
  L1_92 = db
  L1_92 = L1_92.getRow
  L2_93 = portforwardingFQDNTable
  L3_94 = _UPVALUE0_
  L1_92 = L1_92(L2_93, L3_94, A0_91)
  L2_93 = _UPVALUE1_
  L2_93 = L2_93.NIL
  if L1_92 == L2_93 then
    L2_93 = _UPVALUE1_
    L2_93 = L2_93.FAILURE
    return L2_93
  end
  L2_93, L3_94 = nil, nil
  L2_93 = L1_92[portforwardingFQDNTable .. "." .. _UPVALUE2_.FQDNMapServerIp]
  L3_94 = L1_92[portforwardingFQDNTable .. "." .. _UPVALUE2_.FQDNMapFQDNName]
  return _UPVALUE1_.SUCCESS, cooke, L2_93, L3_94
end
