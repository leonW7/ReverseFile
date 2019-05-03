local L0_0
L0_0 = module
L0_0("com.teamf1.core.routing.static_routes", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/route_returnCodes")
L0_0 = require
L0_0("teamf1lualib/vlan_vlan")
L0_0 = require
L0_0("teamf1lualib/dhcp_serverVLAN")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).routeName = "routeName"
;({}).active = "active"
;({}).private = "private"
;({}).destinationIpAddress = "dstIpAddr"
;({}).subnetMask = "ipSNetMask"
;({}).interface = "interfaceName"
;({}).gatewayIpAddress = "gwIpAddr"
;({}).metric = "metric"
NimfTable = "NimfConf"
PptpTable = "Pptp"
L2TpTable = "L2tp"
DualPppoeTable = "DualPppoe"
NetworkInterfaceTable = "networkInterface"
;({}).LogicalIfName = "LogicalIfName"
;({}).AddressFamily = "AddressFamily"
;({}).IfStatus = "IfStatus"
;({}).GetIpFromIspPhy = "GetIpFromIspPhy"
;({}).ConnectionType = "ConnectionType"
;({}).DualAccess = "DualAccess"
;({}).GetIpFromIsp = "GetIpFromIsp"
;({}).dmz_interface = "LogicalIfName"
;({}).dmz_ip = "StaticIp"
;({}).dmz_netmask = "NetMask"
;({}).wan_ipAddress = "ipAddress"
;({}).wan_subnet = "subnetMask"
;({}).interfaceName = "LogicalIfName"
;({}).addressFamily = "addressFamily"
;({}).StaticIpPhy = "StaticIpPhy"
;({}).NetMaskPhy = "NetMaskPhy"
;({}).GatewayPhy = "GatewayPhy"
WAN1NAME = "WAN1"
WAN2NAME = "WAN2"
IPv4_ADDRESS_FAMILY = "2"
pptpConnection = "pptp"
l2tpConnection = "l2tp"
dualPppoeConnection = "dualPppoe"
russianPppoeFile = "/var/russia_dualPppoe.conf"
russianL2tpFile = "/var/russia_l2tp.conf"
russianPptpFile = "/var/russia_pptp.conf"
if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-1000" or UNIT_NAME == "DSR-1000N" then
elseif UNIT_NAME == "DSR-500AC" or UNIT_NAME == "DSR-500" or UNIT_NAME == "DSR-500N" then
elseif UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-250N" then
else
end
function routeNameGet()
  local L0_1, L1_2
  L0_1 = db
  L0_1 = L0_1.getNextRowId
  L1_2 = _UPVALUE0_
  L0_1 = L0_1(L1_2, _UPVALUE1_)
  L1_2 = _UPVALUE2_
  L1_2 = L1_2.NIL
  if L0_1 == L1_2 then
    L1_2 = _UPVALUE2_
    L1_2 = L1_2.NOT_EXIST
    return L1_2
  end
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(_UPVALUE1_, _UPVALUE3_, L0_1, _UPVALUE4_.routeName)
  if L1_2 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_1, L1_2
end
function routeNameGetNext(A0_3)
  local L1_4, L2_5
  L1_4 = _UPVALUE0_
  L1_4 = L1_4.NIL
  if A0_3 == L1_4 then
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.INVALID_ARGUMENT
    return L1_4
  end
  L1_4 = tonumber
  L2_5 = A0_3
  L1_4 = L1_4(L2_5)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if L1_4 == L2_5 then
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.INVALID_ARGUMENT
    return L1_4
  end
  L1_4 = db
  L1_4 = L1_4.existsRow
  L2_5 = _UPVALUE1_
  L1_4 = L1_4(L2_5, _UPVALUE2_, A0_3)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.FALSE
  if L1_4 == L2_5 then
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.NOT_EXIST
    return L1_4
  end
  L1_4 = nil
  L2_5 = db
  L2_5 = L2_5.getNextRowId
  L2_5 = L2_5(A0_3, _UPVALUE1_)
  L1_4 = L2_5
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if L1_4 == L2_5 then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.NOT_EXIST
    return L2_5
  end
  L2_5 = db
  L2_5 = L2_5.getAttribute
  L2_5 = L2_5(_UPVALUE1_, _UPVALUE2_, L1_4, _UPVALUE3_.routeName)
  if L2_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L2_5
end
function routeNameSet(A0_6, A1_7)
  local L2_8
  L2_8 = _UPVALUE0_
  L2_8 = L2_8.NIL
  if A0_6 == L2_8 then
    L2_8 = _UPVALUE0_
    L2_8 = L2_8.INVALID_ARGUMENT
    return L2_8
  end
  L2_8 = tonumber
  L2_8 = L2_8(A0_6)
  if L2_8 == _UPVALUE0_.NIL then
    L2_8 = _UPVALUE0_
    L2_8 = L2_8.INVALID_ARGUMENT
    return L2_8
  end
  L2_8 = db
  L2_8 = L2_8.existsRow
  L2_8 = L2_8(_UPVALUE1_, _UPVALUE2_, A0_6)
  if L2_8 == _UPVALUE0_.FALSE then
    L2_8 = _UPVALUE0_
    L2_8 = L2_8.NOT_EXIST
    return L2_8
  end
  L2_8 = _UPVALUE0_
  L2_8 = L2_8.NIL
  if A1_7 == L2_8 then
    L2_8 = _UPVALUE0_
    L2_8 = L2_8.INVALID_ARGUMENT
    return L2_8
  end
  L2_8 = _UPVALUE3_
  L2_8 = L2_8.stringLengthCheck
  L2_8 = L2_8(_UPVALUE4_, _UPVALUE5_, A1_7)
  if L2_8 ~= _UPVALUE0_.SUCCESS then
    L2_8 = _UPVALUE0_
    L2_8 = L2_8.INVALID_ARGUMENT
    return L2_8
  end
  L2_8 = nil
  L2_8 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_6, _UPVALUE6_.routeName, A1_7)
  if L2_8 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_6
  end
  return _UPVALUE0_.SUCCESS, A0_6
end
function routeNameDelete(A0_9, A1_10)
  local L2_11, L3_12, L4_13
  L2_11 = NOT_SUPPORTED
  L3_12 = 0
  L4_13 = 0
  return L2_11, L3_12, L4_13
end
function activeGet()
  local L0_14, L1_15
  L0_14 = db
  L0_14 = L0_14.getNextRowId
  L1_15 = _UPVALUE0_
  L0_14 = L0_14(L1_15, _UPVALUE1_)
  L1_15 = _UPVALUE2_
  L1_15 = L1_15.NIL
  if L0_14 == L1_15 then
    L1_15 = _UPVALUE2_
    L1_15 = L1_15.NOT_EXIST
    return L1_15
  end
  L1_15 = db
  L1_15 = L1_15.getAttribute
  L1_15 = L1_15(_UPVALUE1_, _UPVALUE3_, L0_14, _UPVALUE4_.active)
  if L1_15 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_14, L1_15
end
function activeGetNext(A0_16)
  local L1_17, L2_18
  L1_17 = _UPVALUE0_
  L1_17 = L1_17.NIL
  if A0_16 == L1_17 then
    L1_17 = _UPVALUE0_
    L1_17 = L1_17.INVALID_ARGUMENT
    return L1_17
  end
  L1_17 = tonumber
  L2_18 = A0_16
  L1_17 = L1_17(L2_18)
  L2_18 = _UPVALUE0_
  L2_18 = L2_18.NIL
  if L1_17 == L2_18 then
    L1_17 = _UPVALUE0_
    L1_17 = L1_17.INVALID_ARGUMENT
    return L1_17
  end
  L1_17 = db
  L1_17 = L1_17.existsRow
  L2_18 = _UPVALUE1_
  L1_17 = L1_17(L2_18, _UPVALUE2_, A0_16)
  L2_18 = _UPVALUE0_
  L2_18 = L2_18.FALSE
  if L1_17 == L2_18 then
    L1_17 = _UPVALUE0_
    L1_17 = L1_17.NOT_EXIST
    return L1_17
  end
  L1_17 = nil
  L2_18 = db
  L2_18 = L2_18.getNextRowId
  L2_18 = L2_18(A0_16, _UPVALUE1_)
  L1_17 = L2_18
  L2_18 = _UPVALUE0_
  L2_18 = L2_18.NIL
  if L1_17 == L2_18 then
    L2_18 = _UPVALUE0_
    L2_18 = L2_18.NOT_EXIST
    return L2_18
  end
  L2_18 = db
  L2_18 = L2_18.getAttribute
  L2_18 = L2_18(_UPVALUE1_, _UPVALUE2_, L1_17, _UPVALUE3_.active)
  if L2_18 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_17
  end
  return _UPVALUE0_.SUCCESS, L1_17, L2_18
end
function activeSet(A0_19, A1_20)
  local L2_21, L3_22
  L2_21 = _UPVALUE0_
  L2_21 = L2_21.NIL
  if A0_19 == L2_21 then
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.INVALID_ARGUMENT
    return L2_21
  end
  L2_21 = tonumber
  L3_22 = A0_19
  L2_21 = L2_21(L3_22)
  L3_22 = _UPVALUE0_
  L3_22 = L3_22.NIL
  if L2_21 == L3_22 then
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.INVALID_ARGUMENT
    return L2_21
  end
  L2_21 = db
  L2_21 = L2_21.existsRow
  L3_22 = _UPVALUE1_
  L2_21 = L2_21(L3_22, _UPVALUE2_, A0_19)
  L3_22 = _UPVALUE0_
  L3_22 = L3_22.FALSE
  if L2_21 == L3_22 then
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.NOT_EXIST
    return L2_21
  end
  L2_21 = _UPVALUE0_
  L2_21 = L2_21.NIL
  if A1_20 == L2_21 then
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.INVALID_ARGUMENT
    return L2_21
  end
  L2_21 = tonumber
  L3_22 = A1_20
  L2_21 = L2_21(L3_22)
  L3_22 = _UPVALUE0_
  L3_22 = L3_22.NIL
  if L2_21 == L3_22 then
    L3_22 = _UPVALUE0_
    L3_22 = L3_22.INVALID_ARGUMENT
    return L3_22
  end
  L3_22 = _UPVALUE3_
  if L2_21 ~= L3_22 then
    L3_22 = _UPVALUE4_
    if L2_21 ~= L3_22 then
      L3_22 = _UPVALUE0_
      L3_22 = L3_22.INVALID_ARGUMENT
      return L3_22
    end
  end
  L3_22 = nil
  L3_22 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_19, _UPVALUE5_.active, A1_20)
  if L3_22 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_19
  end
  return _UPVALUE0_.SUCCESS, A0_19
end
function privateGet()
  local L0_23, L1_24
  L0_23 = db
  L0_23 = L0_23.getNextRowId
  L1_24 = _UPVALUE0_
  L0_23 = L0_23(L1_24, _UPVALUE1_)
  L1_24 = _UPVALUE2_
  L1_24 = L1_24.NIL
  if L0_23 == L1_24 then
    L1_24 = _UPVALUE2_
    L1_24 = L1_24.NOT_EXIST
    return L1_24
  end
  L1_24 = db
  L1_24 = L1_24.getAttribute
  L1_24 = L1_24(_UPVALUE1_, _UPVALUE3_, L0_23, _UPVALUE4_.private)
  if L1_24 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_23, L1_24
end
function privateGetNext(A0_25)
  local L1_26, L2_27
  L1_26 = _UPVALUE0_
  L1_26 = L1_26.NIL
  if A0_25 == L1_26 then
    L1_26 = _UPVALUE0_
    L1_26 = L1_26.INVALID_ARGUMENT
    return L1_26
  end
  L1_26 = tonumber
  L2_27 = A0_25
  L1_26 = L1_26(L2_27)
  L2_27 = _UPVALUE0_
  L2_27 = L2_27.NIL
  if L1_26 == L2_27 then
    L1_26 = _UPVALUE0_
    L1_26 = L1_26.INVALID_ARGUMENT
    return L1_26
  end
  L1_26 = db
  L1_26 = L1_26.existsRow
  L2_27 = _UPVALUE1_
  L1_26 = L1_26(L2_27, _UPVALUE2_, A0_25)
  L2_27 = _UPVALUE0_
  L2_27 = L2_27.FALSE
  if L1_26 == L2_27 then
    L1_26 = _UPVALUE0_
    L1_26 = L1_26.NOT_EXIST
    return L1_26
  end
  L1_26 = nil
  L2_27 = db
  L2_27 = L2_27.getNextRowId
  L2_27 = L2_27(A0_25, _UPVALUE1_)
  L1_26 = L2_27
  L2_27 = _UPVALUE0_
  L2_27 = L2_27.NIL
  if L1_26 == L2_27 then
    L2_27 = _UPVALUE0_
    L2_27 = L2_27.NOT_EXIST
    return L2_27
  end
  L2_27 = db
  L2_27 = L2_27.getAttribute
  L2_27 = L2_27(_UPVALUE1_, _UPVALUE2_, L1_26, _UPVALUE3_.private)
  if L2_27 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_26
  end
  return _UPVALUE0_.SUCCESS, L1_26, L2_27
end
function privateSet(A0_28, A1_29)
  local L2_30, L3_31
  L2_30 = _UPVALUE0_
  L2_30 = L2_30.NIL
  if A0_28 == L2_30 then
    L2_30 = _UPVALUE0_
    L2_30 = L2_30.INVALID_ARGUMENT
    return L2_30
  end
  L2_30 = tonumber
  L3_31 = A0_28
  L2_30 = L2_30(L3_31)
  L3_31 = _UPVALUE0_
  L3_31 = L3_31.NIL
  if L2_30 == L3_31 then
    L2_30 = _UPVALUE0_
    L2_30 = L2_30.INVALID_ARGUMENT
    return L2_30
  end
  L2_30 = db
  L2_30 = L2_30.existsRow
  L3_31 = _UPVALUE1_
  L2_30 = L2_30(L3_31, _UPVALUE2_, A0_28)
  L3_31 = _UPVALUE0_
  L3_31 = L3_31.FALSE
  if L2_30 == L3_31 then
    L2_30 = _UPVALUE0_
    L2_30 = L2_30.NOT_EXIST
    return L2_30
  end
  L2_30 = _UPVALUE0_
  L2_30 = L2_30.NIL
  if A1_29 == L2_30 then
    L2_30 = _UPVALUE0_
    L2_30 = L2_30.INVALID_ARGUMENT
    return L2_30
  end
  L2_30 = tonumber
  L3_31 = A1_29
  L2_30 = L2_30(L3_31)
  L3_31 = _UPVALUE0_
  L3_31 = L3_31.NIL
  if L2_30 == L3_31 then
    L3_31 = _UPVALUE0_
    L3_31 = L3_31.INVALID_ARGUMENT
    return L3_31
  end
  L3_31 = _UPVALUE3_
  if L2_30 ~= L3_31 then
    L3_31 = _UPVALUE4_
    if L2_30 ~= L3_31 then
      L3_31 = _UPVALUE0_
      L3_31 = L3_31.INVALID_ARGUMENT
      return L3_31
    end
  end
  L3_31 = nil
  L3_31 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_28, _UPVALUE5_.private, A1_29)
  if L3_31 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_28
  end
  return _UPVALUE0_.SUCCESS, A0_28
end
function destinationIpAddressGet()
  local L0_32, L1_33
  L0_32 = db
  L0_32 = L0_32.getNextRowId
  L1_33 = _UPVALUE0_
  L0_32 = L0_32(L1_33, _UPVALUE1_)
  L1_33 = _UPVALUE2_
  L1_33 = L1_33.NIL
  if L0_32 == L1_33 then
    L1_33 = _UPVALUE2_
    L1_33 = L1_33.NOT_EXIST
    return L1_33
  end
  L1_33 = db
  L1_33 = L1_33.getAttribute
  L1_33 = L1_33(_UPVALUE1_, _UPVALUE3_, L0_32, _UPVALUE4_.destinationIpAddress)
  if L1_33 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_32, L1_33
end
function destinationIpAddressGetNext(A0_34)
  local L1_35, L2_36
  L1_35 = _UPVALUE0_
  L1_35 = L1_35.NIL
  if A0_34 == L1_35 then
    L1_35 = _UPVALUE0_
    L1_35 = L1_35.INVALID_ARGUMENT
    return L1_35
  end
  L1_35 = tonumber
  L2_36 = A0_34
  L1_35 = L1_35(L2_36)
  L2_36 = _UPVALUE0_
  L2_36 = L2_36.NIL
  if L1_35 == L2_36 then
    L1_35 = _UPVALUE0_
    L1_35 = L1_35.INVALID_ARGUMENT
    return L1_35
  end
  L1_35 = db
  L1_35 = L1_35.existsRow
  L2_36 = _UPVALUE1_
  L1_35 = L1_35(L2_36, _UPVALUE2_, A0_34)
  L2_36 = _UPVALUE0_
  L2_36 = L2_36.FALSE
  if L1_35 == L2_36 then
    L1_35 = _UPVALUE0_
    L1_35 = L1_35.NOT_EXIST
    return L1_35
  end
  L1_35 = nil
  L2_36 = db
  L2_36 = L2_36.getNextRowId
  L2_36 = L2_36(A0_34, _UPVALUE1_)
  L1_35 = L2_36
  L2_36 = _UPVALUE0_
  L2_36 = L2_36.NIL
  if L1_35 == L2_36 then
    L2_36 = _UPVALUE0_
    L2_36 = L2_36.NOT_EXIST
    return L2_36
  end
  L2_36 = db
  L2_36 = L2_36.getAttribute
  L2_36 = L2_36(_UPVALUE1_, _UPVALUE2_, L1_35, _UPVALUE3_.destinationIpAddress)
  if L2_36 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_35
  end
  return _UPVALUE0_.SUCCESS, L1_35, L2_36
end
function destinationIpAddressSet(A0_37, A1_38)
  local L2_39
  L2_39 = _UPVALUE0_
  L2_39 = L2_39.NIL
  if A0_37 == L2_39 then
    L2_39 = _UPVALUE0_
    L2_39 = L2_39.INVALID_ARGUMENT
    return L2_39
  end
  L2_39 = tonumber
  L2_39 = L2_39(A0_37)
  if L2_39 == _UPVALUE0_.NIL then
    L2_39 = _UPVALUE0_
    L2_39 = L2_39.INVALID_ARGUMENT
    return L2_39
  end
  L2_39 = db
  L2_39 = L2_39.existsRow
  L2_39 = L2_39(_UPVALUE1_, _UPVALUE2_, A0_37)
  if L2_39 == _UPVALUE0_.FALSE then
    L2_39 = _UPVALUE0_
    L2_39 = L2_39.NOT_EXIST
    return L2_39
  end
  L2_39 = _UPVALUE0_
  L2_39 = L2_39.NIL
  if A1_38 == L2_39 then
    L2_39 = _UPVALUE0_
    L2_39 = L2_39.INVALID_ARGUMENT
    return L2_39
  end
  L2_39 = _UPVALUE3_
  L2_39 = L2_39.ipAddressCheck
  L2_39 = L2_39(_UPVALUE4_, A1_38)
  valid = L2_39
  L2_39 = valid
  if L2_39 ~= _UPVALUE0_.SUCCESS then
    L2_39 = _UPVALUE0_
    L2_39 = L2_39.INVALID_ARGUMENT
    return L2_39
  end
  L2_39 = nil
  L2_39 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_37, _UPVALUE5_.destinationIpAddress, A1_38)
  if L2_39 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_37
  end
  return _UPVALUE0_.SUCCESS, A0_37
end
function subnetMaskGet()
  local L0_40, L1_41
  L0_40 = db
  L0_40 = L0_40.getNextRowId
  L1_41 = _UPVALUE0_
  L0_40 = L0_40(L1_41, _UPVALUE1_)
  L1_41 = _UPVALUE2_
  L1_41 = L1_41.NIL
  if L0_40 == L1_41 then
    L1_41 = _UPVALUE2_
    L1_41 = L1_41.NOT_EXIST
    return L1_41
  end
  L1_41 = db
  L1_41 = L1_41.getAttribute
  L1_41 = L1_41(_UPVALUE1_, _UPVALUE3_, L0_40, _UPVALUE4_.subnetMask)
  if L1_41 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_40, L1_41
end
function subnetMaskGetNext(A0_42)
  local L1_43, L2_44
  L1_43 = _UPVALUE0_
  L1_43 = L1_43.NIL
  if A0_42 == L1_43 then
    L1_43 = _UPVALUE0_
    L1_43 = L1_43.INVALID_ARGUMENT
    return L1_43
  end
  L1_43 = tonumber
  L2_44 = A0_42
  L1_43 = L1_43(L2_44)
  L2_44 = _UPVALUE0_
  L2_44 = L2_44.NIL
  if L1_43 == L2_44 then
    L1_43 = _UPVALUE0_
    L1_43 = L1_43.INVALID_ARGUMENT
    return L1_43
  end
  L1_43 = db
  L1_43 = L1_43.existsRow
  L2_44 = _UPVALUE1_
  L1_43 = L1_43(L2_44, _UPVALUE2_, A0_42)
  L2_44 = _UPVALUE0_
  L2_44 = L2_44.FALSE
  if L1_43 == L2_44 then
    L1_43 = _UPVALUE0_
    L1_43 = L1_43.NOT_EXIST
    return L1_43
  end
  L1_43 = nil
  L2_44 = db
  L2_44 = L2_44.getNextRowId
  L2_44 = L2_44(A0_42, _UPVALUE1_)
  L1_43 = L2_44
  L2_44 = _UPVALUE0_
  L2_44 = L2_44.NIL
  if L1_43 == L2_44 then
    L2_44 = _UPVALUE0_
    L2_44 = L2_44.NOT_EXIST
    return L2_44
  end
  L2_44 = db
  L2_44 = L2_44.getAttribute
  L2_44 = L2_44(_UPVALUE1_, _UPVALUE2_, L1_43, _UPVALUE3_.subnetMask)
  if L2_44 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_43
  end
  return _UPVALUE0_.SUCCESS, L1_43, L2_44
end
function subnetMaskSet(A0_45, A1_46)
  local L2_47
  L2_47 = _UPVALUE0_
  L2_47 = L2_47.NIL
  if A0_45 == L2_47 then
    L2_47 = _UPVALUE0_
    L2_47 = L2_47.INVALID_ARGUMENT
    return L2_47
  end
  L2_47 = tonumber
  L2_47 = L2_47(A0_45)
  if L2_47 == _UPVALUE0_.NIL then
    L2_47 = _UPVALUE0_
    L2_47 = L2_47.INVALID_ARGUMENT
    return L2_47
  end
  L2_47 = db
  L2_47 = L2_47.existsRow
  L2_47 = L2_47(_UPVALUE1_, _UPVALUE2_, A0_45)
  if L2_47 == _UPVALUE0_.FALSE then
    L2_47 = _UPVALUE0_
    L2_47 = L2_47.NOT_EXIST
    return L2_47
  end
  L2_47 = _UPVALUE0_
  L2_47 = L2_47.NIL
  if A1_46 == L2_47 then
    L2_47 = _UPVALUE0_
    L2_47 = L2_47.INVALID_ARGUMENT
    return L2_47
  end
  L2_47 = _UPVALUE3_
  L2_47 = L2_47.ipAddressCheck
  L2_47 = L2_47(_UPVALUE4_, A1_46)
  valid = L2_47
  L2_47 = valid
  if L2_47 ~= _UPVALUE0_.SUCCESS then
    L2_47 = _UPVALUE0_
    L2_47 = L2_47.INVALID_ARGUMENT
    return L2_47
  end
  L2_47 = nil
  L2_47 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_45, _UPVALUE5_.subnetMask, A1_46)
  if L2_47 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_45
  end
  return _UPVALUE0_.SUCCESS, A0_45
end
function interfaceGet()
  local L0_48, L1_49
  L0_48 = db
  L0_48 = L0_48.getNextRowId
  L1_49 = _UPVALUE0_
  L0_48 = L0_48(L1_49, _UPVALUE1_)
  L1_49 = _UPVALUE2_
  L1_49 = L1_49.NIL
  if L0_48 == L1_49 then
    L1_49 = _UPVALUE2_
    L1_49 = L1_49.NOT_EXIST
    return L1_49
  end
  L1_49 = db
  L1_49 = L1_49.getAttribute
  L1_49 = L1_49(_UPVALUE1_, _UPVALUE3_, L0_48, _UPVALUE4_.interface)
  if L1_49 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_48, L1_49
end
function interfaceGetNext(A0_50)
  local L1_51, L2_52
  L1_51 = _UPVALUE0_
  L1_51 = L1_51.NIL
  if A0_50 == L1_51 then
    L1_51 = _UPVALUE0_
    L1_51 = L1_51.INVALID_ARGUMENT
    return L1_51
  end
  L1_51 = tonumber
  L2_52 = A0_50
  L1_51 = L1_51(L2_52)
  L2_52 = _UPVALUE0_
  L2_52 = L2_52.NIL
  if L1_51 == L2_52 then
    L1_51 = _UPVALUE0_
    L1_51 = L1_51.INVALID_ARGUMENT
    return L1_51
  end
  L1_51 = db
  L1_51 = L1_51.existsRow
  L2_52 = _UPVALUE1_
  L1_51 = L1_51(L2_52, _UPVALUE2_, A0_50)
  L2_52 = _UPVALUE0_
  L2_52 = L2_52.FALSE
  if L1_51 == L2_52 then
    L1_51 = _UPVALUE0_
    L1_51 = L1_51.NOT_EXIST
    return L1_51
  end
  L1_51 = nil
  L2_52 = db
  L2_52 = L2_52.getNextRowId
  L2_52 = L2_52(A0_50, _UPVALUE1_)
  L1_51 = L2_52
  L2_52 = _UPVALUE0_
  L2_52 = L2_52.NIL
  if L1_51 == L2_52 then
    L2_52 = _UPVALUE0_
    L2_52 = L2_52.NOT_EXIST
    return L2_52
  end
  L2_52 = db
  L2_52 = L2_52.getAttribute
  L2_52 = L2_52(_UPVALUE1_, _UPVALUE2_, L1_51, _UPVALUE3_.interface)
  if L2_52 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_51
  end
  return _UPVALUE0_.SUCCESS, L1_51, L2_52
end
function interfaceSet(A0_53, A1_54)
  local L2_55
  L2_55 = _UPVALUE0_
  L2_55 = L2_55.NIL
  if A0_53 == L2_55 then
    L2_55 = _UPVALUE0_
    L2_55 = L2_55.INVALID_ARGUMENT
    return L2_55
  end
  L2_55 = tonumber
  L2_55 = L2_55(A0_53)
  if L2_55 == _UPVALUE0_.NIL then
    L2_55 = _UPVALUE0_
    L2_55 = L2_55.INVALID_ARGUMENT
    return L2_55
  end
  L2_55 = db
  L2_55 = L2_55.existsRow
  L2_55 = L2_55(_UPVALUE1_, _UPVALUE2_, A0_53)
  if L2_55 == _UPVALUE0_.FALSE then
    L2_55 = _UPVALUE0_
    L2_55 = L2_55.NOT_EXIST
    return L2_55
  end
  L2_55 = _UPVALUE0_
  L2_55 = L2_55.NIL
  if A1_54 == L2_55 then
    L2_55 = _UPVALUE0_
    L2_55 = L2_55.INVALID_ARGUMENT
    return L2_55
  end
  L2_55 = _UPVALUE3_
  if A1_54 ~= L2_55 then
    L2_55 = _UPVALUE4_
    if A1_54 ~= L2_55 then
      L2_55 = _UPVALUE0_
      L2_55 = L2_55.INVALID_ARGUMENT
      return L2_55
    end
  end
  L2_55 = nil
  L2_55 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_53, _UPVALUE5_.interface, A1_54)
  if L2_55 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_53
  end
  return _UPVALUE0_.SUCCESS, A0_53
end
function gatewayIpAddressGet()
  local L0_56, L1_57
  L0_56 = db
  L0_56 = L0_56.getNextRowId
  L1_57 = _UPVALUE0_
  L0_56 = L0_56(L1_57, _UPVALUE1_)
  L1_57 = _UPVALUE2_
  L1_57 = L1_57.NIL
  if L0_56 == L1_57 then
    L1_57 = _UPVALUE2_
    L1_57 = L1_57.NOT_EXIST
    return L1_57
  end
  L1_57 = db
  L1_57 = L1_57.getAttribute
  L1_57 = L1_57(_UPVALUE1_, _UPVALUE3_, L0_56, _UPVALUE4_.gatewayIpAddress)
  if L1_57 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_56, L1_57
end
function gatewayIpAddressGetNext(A0_58)
  local L1_59, L2_60
  L1_59 = _UPVALUE0_
  L1_59 = L1_59.NIL
  if A0_58 == L1_59 then
    L1_59 = _UPVALUE0_
    L1_59 = L1_59.INVALID_ARGUMENT
    return L1_59
  end
  L1_59 = tonumber
  L2_60 = A0_58
  L1_59 = L1_59(L2_60)
  L2_60 = _UPVALUE0_
  L2_60 = L2_60.NIL
  if L1_59 == L2_60 then
    L1_59 = _UPVALUE0_
    L1_59 = L1_59.INVALID_ARGUMENT
    return L1_59
  end
  L1_59 = db
  L1_59 = L1_59.existsRow
  L2_60 = _UPVALUE1_
  L1_59 = L1_59(L2_60, _UPVALUE2_, A0_58)
  L2_60 = _UPVALUE0_
  L2_60 = L2_60.FALSE
  if L1_59 == L2_60 then
    L1_59 = _UPVALUE0_
    L1_59 = L1_59.NOT_EXIST
    return L1_59
  end
  L1_59 = nil
  L2_60 = db
  L2_60 = L2_60.getNextRowId
  L2_60 = L2_60(A0_58, _UPVALUE1_)
  L1_59 = L2_60
  L2_60 = _UPVALUE0_
  L2_60 = L2_60.NIL
  if L1_59 == L2_60 then
    L2_60 = _UPVALUE0_
    L2_60 = L2_60.NOT_EXIST
    return L2_60
  end
  L2_60 = db
  L2_60 = L2_60.getAttribute
  L2_60 = L2_60(_UPVALUE1_, _UPVALUE2_, L1_59, _UPVALUE3_.gatewayIpAddress)
  if L2_60 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_59
  end
  return _UPVALUE0_.SUCCESS, L1_59, L2_60
end
function gatewayIpAddressSet(A0_61, A1_62)
  local L2_63
  L2_63 = _UPVALUE0_
  L2_63 = L2_63.NIL
  if A0_61 == L2_63 then
    L2_63 = _UPVALUE0_
    L2_63 = L2_63.INVALID_ARGUMENT
    return L2_63
  end
  L2_63 = tonumber
  L2_63 = L2_63(A0_61)
  if L2_63 == _UPVALUE0_.NIL then
    L2_63 = _UPVALUE0_
    L2_63 = L2_63.INVALID_ARGUMENT
    return L2_63
  end
  L2_63 = db
  L2_63 = L2_63.existsRow
  L2_63 = L2_63(_UPVALUE1_, _UPVALUE2_, A0_61)
  if L2_63 == _UPVALUE0_.FALSE then
    L2_63 = _UPVALUE0_
    L2_63 = L2_63.NOT_EXIST
    return L2_63
  end
  L2_63 = _UPVALUE0_
  L2_63 = L2_63.NIL
  if A1_62 == L2_63 then
    L2_63 = _UPVALUE0_
    L2_63 = L2_63.INVALID_ARGUMENT
    return L2_63
  end
  L2_63 = _UPVALUE3_
  L2_63 = L2_63.ipAddressCheck
  L2_63 = L2_63(_UPVALUE4_, A1_62)
  valid = L2_63
  L2_63 = valid
  if L2_63 ~= _UPVALUE0_.SUCCESS then
    L2_63 = _UPVALUE0_
    L2_63 = L2_63.INVALID_ARGUMENT
    return L2_63
  end
  L2_63 = nil
  L2_63 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_61, _UPVALUE5_.gatewayIpAddress, A1_62)
  if L2_63 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_61
  end
  return _UPVALUE0_.SUCCESS, A0_61
end
function metricGet()
  local L0_64, L1_65
  L0_64 = db
  L0_64 = L0_64.getNextRowId
  L1_65 = _UPVALUE0_
  L0_64 = L0_64(L1_65, _UPVALUE1_)
  L1_65 = _UPVALUE2_
  L1_65 = L1_65.NIL
  if L0_64 == L1_65 then
    L1_65 = _UPVALUE2_
    L1_65 = L1_65.NOT_EXIST
    return L1_65
  end
  L1_65 = db
  L1_65 = L1_65.getAttribute
  L1_65 = L1_65(_UPVALUE1_, _UPVALUE3_, L0_64, _UPVALUE4_.metric)
  if L1_65 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_64, L1_65
end
function metricGetNext(A0_66)
  local L1_67, L2_68
  L1_67 = _UPVALUE0_
  L1_67 = L1_67.NIL
  if A0_66 == L1_67 then
    L1_67 = _UPVALUE0_
    L1_67 = L1_67.INVALID_ARGUMENT
    return L1_67
  end
  L1_67 = tonumber
  L2_68 = A0_66
  L1_67 = L1_67(L2_68)
  L2_68 = _UPVALUE0_
  L2_68 = L2_68.NIL
  if L1_67 == L2_68 then
    L1_67 = _UPVALUE0_
    L1_67 = L1_67.INVALID_ARGUMENT
    return L1_67
  end
  L1_67 = db
  L1_67 = L1_67.existsRow
  L2_68 = _UPVALUE1_
  L1_67 = L1_67(L2_68, _UPVALUE2_, A0_66)
  L2_68 = _UPVALUE0_
  L2_68 = L2_68.FALSE
  if L1_67 == L2_68 then
    L1_67 = _UPVALUE0_
    L1_67 = L1_67.NOT_EXIST
    return L1_67
  end
  L1_67 = nil
  L2_68 = db
  L2_68 = L2_68.getNextRowId
  L2_68 = L2_68(A0_66, _UPVALUE1_)
  L1_67 = L2_68
  L2_68 = _UPVALUE0_
  L2_68 = L2_68.NIL
  if L1_67 == L2_68 then
    L2_68 = _UPVALUE0_
    L2_68 = L2_68.NOT_EXIST
    return L2_68
  end
  L2_68 = db
  L2_68 = L2_68.getAttribute
  L2_68 = L2_68(_UPVALUE1_, _UPVALUE2_, L1_67, _UPVALUE3_.metric)
  if L2_68 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_67
  end
  return _UPVALUE0_.SUCCESS, L1_67, L2_68
end
function metricSet(A0_69, A1_70)
  local L2_71, L3_72
  L2_71 = _UPVALUE0_
  L2_71 = L2_71.NIL
  if A0_69 == L2_71 then
    L2_71 = _UPVALUE0_
    L2_71 = L2_71.INVALID_ARGUMENT
    return L2_71
  end
  L2_71 = tonumber
  L3_72 = A0_69
  L2_71 = L2_71(L3_72)
  L3_72 = _UPVALUE0_
  L3_72 = L3_72.NIL
  if L2_71 == L3_72 then
    L2_71 = _UPVALUE0_
    L2_71 = L2_71.INVALID_ARGUMENT
    return L2_71
  end
  L2_71 = db
  L2_71 = L2_71.existsRow
  L3_72 = _UPVALUE1_
  L2_71 = L2_71(L3_72, _UPVALUE2_, A0_69)
  L3_72 = _UPVALUE0_
  L3_72 = L3_72.FALSE
  if L2_71 == L3_72 then
    L2_71 = _UPVALUE0_
    L2_71 = L2_71.NOT_EXIST
    return L2_71
  end
  L2_71 = _UPVALUE0_
  L2_71 = L2_71.NIL
  if A1_70 == L2_71 then
    L2_71 = _UPVALUE0_
    L2_71 = L2_71.INVALID_ARGUMENT
    return L2_71
  end
  L2_71 = tonumber
  L3_72 = A1_70
  L2_71 = L2_71(L3_72)
  L3_72 = _UPVALUE0_
  L3_72 = L3_72.NIL
  if L2_71 == L3_72 then
    L3_72 = _UPVALUE0_
    L3_72 = L3_72.INVALID_ARGUMENT
    return L3_72
  end
  L3_72 = _UPVALUE3_
  if not (L2_71 < L3_72) then
    L3_72 = _UPVALUE4_
  elseif L2_71 > L3_72 then
    L3_72 = _UPVALUE0_
    L3_72 = L3_72.INVALID_ARGUMENT
    return L3_72
  end
  L3_72 = nil
  L3_72 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_69, _UPVALUE5_.metric, A1_70)
  if L3_72 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_69
  end
  return _UPVALUE0_.SUCCESS, A0_69
end
function staticRouteGet(A0_73)
  local L1_74, L2_75, L3_76, L4_77, L5_78, L6_79, L7_80, L8_81, L9_82
  L1_74 = {}
  L2_75 = db
  L2_75 = L2_75.getRow
  L3_76 = _UPVALUE0_
  L4_77 = _UPVALUE1_
  L5_78 = A0_73
  L2_75 = L2_75(L3_76, L4_77, L5_78)
  L1_74 = L2_75
  L2_75 = _UPVALUE2_
  L2_75 = L2_75.NIL
  if L1_74 == L2_75 then
    L2_75 = _UPVALUE2_
    L2_75 = L2_75.FAILURE
    return L2_75
  end
  L2_75 = _UPVALUE0_
  L3_76 = "."
  L4_77 = _UPVALUE3_
  L4_77 = L4_77.routeName
  L2_75 = L2_75 .. L3_76 .. L4_77
  L2_75 = L1_74[L2_75]
  L3_76 = _UPVALUE0_
  L4_77 = "."
  L5_78 = _UPVALUE3_
  L5_78 = L5_78.active
  L3_76 = L3_76 .. L4_77 .. L5_78
  L3_76 = L1_74[L3_76]
  L4_77 = _UPVALUE0_
  L5_78 = "."
  L6_79 = _UPVALUE3_
  L6_79 = L6_79.private
  L4_77 = L4_77 .. L5_78 .. L6_79
  L4_77 = L1_74[L4_77]
  L5_78 = _UPVALUE0_
  L6_79 = "."
  L7_80 = _UPVALUE3_
  L7_80 = L7_80.destinationIpAddress
  L5_78 = L5_78 .. L6_79 .. L7_80
  L5_78 = L1_74[L5_78]
  L6_79 = _UPVALUE0_
  L7_80 = "."
  L8_81 = _UPVALUE3_
  L8_81 = L8_81.subnetMask
  L6_79 = L6_79 .. L7_80 .. L8_81
  L6_79 = L1_74[L6_79]
  L7_80 = _UPVALUE0_
  L8_81 = "."
  L9_82 = _UPVALUE3_
  L9_82 = L9_82.interface
  L7_80 = L7_80 .. L8_81 .. L9_82
  L7_80 = L1_74[L7_80]
  L8_81 = _UPVALUE0_
  L9_82 = "."
  L8_81 = L8_81 .. L9_82 .. _UPVALUE3_.gatewayIpAddress
  L8_81 = L1_74[L8_81]
  L9_82 = _UPVALUE0_
  L9_82 = L9_82 .. "." .. _UPVALUE3_.metric
  L9_82 = L1_74[L9_82]
  return _UPVALUE2_.SUCCESS, A0_73, L2_75, L3_76, L4_77, L5_78, L6_79, L7_80, L8_81, L9_82
end
function staticRouteGetNext(A0_83)
  local L1_84, L2_85, L3_86, L4_87, L5_88, L6_89, L7_90, L8_91, L9_92, L10_93
  L1_84 = _UPVALUE0_
  L1_84 = L1_84.NIL
  if A0_83 == L1_84 then
    L1_84 = _UPVALUE0_
    L1_84 = L1_84.INVALID_ARGUMENT
    return L1_84
  end
  L1_84 = tonumber
  L2_85 = A0_83
  L1_84 = L1_84(L2_85)
  L2_85 = _UPVALUE0_
  L2_85 = L2_85.NIL
  if L1_84 == L2_85 then
    L1_84 = _UPVALUE0_
    L1_84 = L1_84.INVALID_ARGUMENT
    return L1_84
  end
  L1_84 = db
  L1_84 = L1_84.existsRow
  L2_85 = _UPVALUE1_
  L3_86 = _UPVALUE2_
  L4_87 = A0_83
  L1_84 = L1_84(L2_85, L3_86, L4_87)
  L2_85 = _UPVALUE0_
  L2_85 = L2_85.FALSE
  if L1_84 == L2_85 then
    L1_84 = _UPVALUE0_
    L1_84 = L1_84.NOT_EXIST
    return L1_84
  end
  L1_84 = nil
  L2_85 = db
  L2_85 = L2_85.getNextRowId
  L3_86 = A0_83
  L4_87 = _UPVALUE1_
  L2_85 = L2_85(L3_86, L4_87)
  L1_84 = L2_85
  L2_85 = _UPVALUE0_
  L2_85 = L2_85.NIL
  if L1_84 == L2_85 then
    L2_85 = _UPVALUE0_
    L2_85 = L2_85.NOT_EXIST
    return L2_85
  end
  L2_85 = {}
  L3_86 = db
  L3_86 = L3_86.getRow
  L4_87 = _UPVALUE1_
  L5_88 = _UPVALUE2_
  L6_89 = L1_84
  L3_86 = L3_86(L4_87, L5_88, L6_89)
  L2_85 = L3_86
  L3_86 = _UPVALUE0_
  L3_86 = L3_86.NIL
  if L2_85 == L3_86 then
    L3_86 = _UPVALUE0_
    L3_86 = L3_86.FAILURE
    L4_87 = A0_83
    return L3_86, L4_87
  end
  L3_86 = _UPVALUE1_
  L4_87 = "."
  L5_88 = _UPVALUE3_
  L5_88 = L5_88.routeName
  L3_86 = L3_86 .. L4_87 .. L5_88
  L3_86 = L2_85[L3_86]
  L4_87 = _UPVALUE1_
  L5_88 = "."
  L6_89 = _UPVALUE3_
  L6_89 = L6_89.active
  L4_87 = L4_87 .. L5_88 .. L6_89
  L4_87 = L2_85[L4_87]
  L5_88 = _UPVALUE1_
  L6_89 = "."
  L7_90 = _UPVALUE3_
  L7_90 = L7_90.private
  L5_88 = L5_88 .. L6_89 .. L7_90
  L5_88 = L2_85[L5_88]
  L6_89 = _UPVALUE1_
  L7_90 = "."
  L8_91 = _UPVALUE3_
  L8_91 = L8_91.destinationIpAddress
  L6_89 = L6_89 .. L7_90 .. L8_91
  L6_89 = L2_85[L6_89]
  L7_90 = _UPVALUE1_
  L8_91 = "."
  L9_92 = _UPVALUE3_
  L9_92 = L9_92.subnetMask
  L7_90 = L7_90 .. L8_91 .. L9_92
  L7_90 = L2_85[L7_90]
  L8_91 = _UPVALUE1_
  L9_92 = "."
  L10_93 = _UPVALUE3_
  L10_93 = L10_93.interface
  L8_91 = L8_91 .. L9_92 .. L10_93
  L8_91 = L2_85[L8_91]
  L9_92 = _UPVALUE1_
  L10_93 = "."
  L9_92 = L9_92 .. L10_93 .. _UPVALUE3_.gatewayIpAddress
  L9_92 = L2_85[L9_92]
  L10_93 = _UPVALUE1_
  L10_93 = L10_93 .. "." .. _UPVALUE3_.metric
  L10_93 = L2_85[L10_93]
  return _UPVALUE0_.SUCCESS, L1_84, L3_86, L4_87, L5_88, L6_89, L7_90, L8_91, L9_92, L10_93
end
function staticRouteSet(A0_94, A1_95, A2_96, A3_97, A4_98, A5_99, A6_100, A7_101, A8_102)
  local L9_103, L10_104, L11_105, L12_106, L13_107, L14_108
  L9_103 = _UPVALUE0_
  L9_103 = L9_103.NIL
  if A0_94 == L9_103 then
    L9_103 = _UPVALUE0_
    L9_103 = L9_103.INVALID_ARGUMENT
    return L9_103
  end
  L9_103 = tonumber
  L10_104 = A0_94
  L9_103 = L9_103(L10_104)
  L10_104 = _UPVALUE0_
  L10_104 = L10_104.NIL
  if L9_103 == L10_104 then
    L9_103 = _UPVALUE0_
    L9_103 = L9_103.INVALID_ARGUMENT
    return L9_103
  end
  L9_103 = db
  L9_103 = L9_103.existsRow
  L10_104 = _UPVALUE1_
  L11_105 = _UPVALUE2_
  L12_106 = A0_94
  L9_103 = L9_103(L10_104, L11_105, L12_106)
  L10_104 = _UPVALUE0_
  L10_104 = L10_104.FALSE
  if L9_103 == L10_104 then
    L9_103 = _UPVALUE0_
    L9_103 = L9_103.NOT_EXIST
    return L9_103
  end
  L9_103 = {}
  L10_104 = _UPVALUE0_
  L10_104 = L10_104.NIL
  if A1_95 == L10_104 then
    L10_104 = _UPVALUE0_
    L10_104 = L10_104.INVALID_ARGUMENT
    return L10_104
  end
  L10_104 = _UPVALUE3_
  L10_104 = L10_104.stringLengthCheck
  L11_105 = _UPVALUE4_
  L12_106 = _UPVALUE5_
  L13_107 = A1_95
  L10_104 = L10_104(L11_105, L12_106, L13_107)
  L11_105 = _UPVALUE0_
  L11_105 = L11_105.SUCCESS
  if L10_104 ~= L11_105 then
    L10_104 = _UPVALUE0_
    L10_104 = L10_104.INVALID_ARGUMENT
    return L10_104
  end
  L10_104 = _UPVALUE1_
  L11_105 = "."
  L12_106 = _UPVALUE6_
  L12_106 = L12_106.routeName
  L10_104 = L10_104 .. L11_105 .. L12_106
  L9_103[L10_104] = A1_95
  L10_104 = _UPVALUE0_
  L10_104 = L10_104.NIL
  if A2_96 == L10_104 then
    L10_104 = _UPVALUE0_
    L10_104 = L10_104.INVALID_ARGUMENT
    return L10_104
  end
  L10_104 = tonumber
  L11_105 = A2_96
  L10_104 = L10_104(L11_105)
  L11_105 = _UPVALUE0_
  L11_105 = L11_105.NIL
  if L10_104 == L11_105 then
    L11_105 = _UPVALUE0_
    L11_105 = L11_105.INVALID_ARGUMENT
    return L11_105
  end
  L11_105 = _UPVALUE7_
  if L10_104 ~= L11_105 then
    L11_105 = _UPVALUE8_
    if L10_104 ~= L11_105 then
      L11_105 = _UPVALUE0_
      L11_105 = L11_105.INVALID_ARGUMENT
      return L11_105
    end
  end
  L11_105 = _UPVALUE1_
  L12_106 = "."
  L13_107 = _UPVALUE6_
  L13_107 = L13_107.active
  L11_105 = L11_105 .. L12_106 .. L13_107
  L9_103[L11_105] = A2_96
  L11_105 = _UPVALUE0_
  L11_105 = L11_105.NIL
  if A3_97 == L11_105 then
    L11_105 = _UPVALUE0_
    L11_105 = L11_105.INVALID_ARGUMENT
    return L11_105
  end
  L11_105 = tonumber
  L12_106 = A3_97
  L11_105 = L11_105(L12_106)
  L12_106 = _UPVALUE0_
  L12_106 = L12_106.NIL
  if L11_105 == L12_106 then
    L12_106 = _UPVALUE0_
    L12_106 = L12_106.INVALID_ARGUMENT
    return L12_106
  end
  L12_106 = _UPVALUE7_
  if L11_105 ~= L12_106 then
    L12_106 = _UPVALUE8_
    if L11_105 ~= L12_106 then
      L12_106 = _UPVALUE0_
      L12_106 = L12_106.INVALID_ARGUMENT
      return L12_106
    end
  end
  L12_106 = _UPVALUE1_
  L13_107 = "."
  L12_106 = L12_106 .. L13_107 .. L14_108
  L9_103[L12_106] = A3_97
  L12_106 = _UPVALUE0_
  L12_106 = L12_106.NIL
  if A4_98 == L12_106 then
    L12_106 = _UPVALUE0_
    L12_106 = L12_106.INVALID_ARGUMENT
    return L12_106
  end
  L12_106 = _UPVALUE3_
  L12_106 = L12_106.ipAddressCheck
  L13_107 = _UPVALUE9_
  L12_106 = L12_106(L13_107, L14_108)
  valid = L12_106
  L12_106 = valid
  L13_107 = _UPVALUE0_
  L13_107 = L13_107.SUCCESS
  if L12_106 ~= L13_107 then
    L12_106 = _UPVALUE10_
    L12_106 = L12_106.ROUTE_INVALID_DESTINATION_IP
    return L12_106
  end
  L12_106 = _UPVALUE1_
  L13_107 = "."
  L12_106 = L12_106 .. L13_107 .. L14_108
  L9_103[L12_106] = A4_98
  L12_106 = _UPVALUE0_
  L12_106 = L12_106.NIL
  if A5_99 == L12_106 then
    L12_106 = _UPVALUE0_
    L12_106 = L12_106.INVALID_ARGUMENT
    return L12_106
  end
  L12_106 = _UPVALUE3_
  L12_106 = L12_106.ipAddressCheck
  L13_107 = _UPVALUE9_
  L12_106 = L12_106(L13_107, L14_108)
  valid = L12_106
  L12_106 = valid
  L13_107 = _UPVALUE0_
  L13_107 = L13_107.SUCCESS
  if L12_106 ~= L13_107 then
    L12_106 = _UPVALUE10_
    L12_106 = L12_106.ROUTE_INVALID_NETMASK
    return L12_106
  end
  L12_106 = _UPVALUE1_
  L13_107 = "."
  L12_106 = L12_106 .. L13_107 .. L14_108
  L9_103[L12_106] = A5_99
  L12_106 = _UPVALUE0_
  L12_106 = L12_106.NIL
  if A6_100 == L12_106 then
    L12_106 = _UPVALUE0_
    L12_106 = L12_106.INVALID_ARGUMENT
    return L12_106
  end
  L12_106 = _UPVALUE1_
  L13_107 = "."
  L12_106 = L12_106 .. L13_107 .. L14_108
  L9_103[L12_106] = A6_100
  L12_106 = _UPVALUE0_
  L12_106 = L12_106.NIL
  if A7_101 == L12_106 then
    L12_106 = _UPVALUE0_
    L12_106 = L12_106.INVALID_ARGUMENT
    return L12_106
  end
  L12_106 = _UPVALUE3_
  L12_106 = L12_106.ipAddressCheck
  L13_107 = _UPVALUE9_
  L12_106 = L12_106(L13_107, L14_108)
  valid = L12_106
  L12_106 = valid
  L13_107 = _UPVALUE0_
  L13_107 = L13_107.SUCCESS
  if L12_106 ~= L13_107 then
    L12_106 = _UPVALUE10_
    L12_106 = L12_106.ROUTE_INVALID_GATEWAY
    return L12_106
  end
  L12_106 = _UPVALUE1_
  L13_107 = "."
  L12_106 = L12_106 .. L13_107 .. L14_108
  L9_103[L12_106] = A7_101
  L12_106 = _UPVALUE0_
  L12_106 = L12_106.NIL
  if A8_102 == L12_106 then
    L12_106 = _UPVALUE0_
    L12_106 = L12_106.INVALID_ARGUMENT
    return L12_106
  end
  L12_106 = tonumber
  L13_107 = A8_102
  L12_106 = L12_106(L13_107)
  L13_107 = _UPVALUE0_
  L13_107 = L13_107.NIL
  if L12_106 == L13_107 then
    L13_107 = _UPVALUE0_
    L13_107 = L13_107.INVALID_ARGUMENT
    return L13_107
  end
  L13_107 = _UPVALUE11_
  if not (L12_106 < L13_107) then
    L13_107 = _UPVALUE12_
  elseif L12_106 > L13_107 then
    L13_107 = _UPVALUE10_
    L13_107 = L13_107.ROUTE_INVALID_METRIC
    return L13_107
  end
  L13_107 = _UPVALUE1_
  L13_107 = L13_107 .. L14_108 .. _UPVALUE6_.metric
  L9_103[L13_107] = A8_102
  L13_107 = db
  L13_107 = L13_107.getTable
  L13_107 = L13_107(L14_108)
  for _FORV_17_, _FORV_18_ in L14_108(L13_107) do
    if _FORV_18_[_UPVALUE1_ .. "." .. _UPVALUE6_.destinationIpAddress] == A4_98 and _FORV_18_[_UPVALUE1_ .. "." .. _UPVALUE6_.metric] == A8_102 and _FORV_18_[_UPVALUE1_ .. "." .. _UPVALUE2_] ~= A0_94 then
      return _UPVALUE10_.ROUTE_ALREADY_EXISTS
    end
  end
  valid = L14_108
  if L14_108 ~= _UPVALUE0_.SUCCESS then
    return L14_108
  end
  if L14_108 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_94
  end
  return _UPVALUE0_.SUCCESS, A0_94
end
function staticRouteCreate(A0_109, A1_110, A2_111, A3_112, A4_113, A5_114, A6_115, A7_116)
  local L8_117, L9_118, L10_119, L11_120, L12_121, L13_122, L14_123, L15_124, L16_125, L17_126
  L8_117 = {}
  L9_118 = _UPVALUE0_
  L9_118 = L9_118.interface
  L10_119 = " !='WAN2PPPOE2' and "
  L11_120 = _UPVALUE0_
  L11_120 = L11_120.interface
  L12_121 = " !='WAN1PPPOE2'"
  L9_118 = L9_118 .. L10_119 .. L11_120 .. L12_121
  L10_119 = db
  L10_119 = L10_119.getRowsWhere
  L11_120 = _UPVALUE1_
  L12_121 = L9_118
  L10_119 = L10_119(L11_120, L12_121)
  if L10_119 ~= nil then
    L11_120 = #L10_119
    L12_121 = _UPVALUE2_
    if L11_120 >= L12_121 then
      L11_120 = _UPVALUE3_
      L11_120 = L11_120.MAX_LIMIT_REACHED
      return L11_120
    end
  end
  L11_120 = _UPVALUE3_
  L11_120 = L11_120.NIL
  if A0_109 == L11_120 then
    L11_120 = _UPVALUE3_
    L11_120 = L11_120.INVALID_ARGUMENT
    return L11_120
  end
  L11_120 = _UPVALUE4_
  L11_120 = L11_120.stringLengthCheck
  L12_121 = _UPVALUE5_
  L13_122 = _UPVALUE6_
  L14_123 = A0_109
  L11_120 = L11_120(L12_121, L13_122, L14_123)
  L12_121 = _UPVALUE3_
  L12_121 = L12_121.SUCCESS
  if L11_120 ~= L12_121 then
    L11_120 = _UPVALUE3_
    L11_120 = L11_120.INVALID_ARGUMENT
    return L11_120
  end
  L11_120 = db
  L11_120 = L11_120.getRowsWhere
  L12_121 = _UPVALUE1_
  L13_122 = _UPVALUE0_
  L13_122 = L13_122.routeName
  L14_123 = " = '"
  L15_124 = A0_109
  L13_122 = L13_122 .. L14_123 .. L15_124 .. L16_125
  L11_120 = L11_120(L12_121, L13_122)
  L12_121 = #L11_120
  if L12_121 ~= 0 then
    L12_121 = _UPVALUE7_
    L12_121 = L12_121.ROUTE_NAME_EXISTS
    return L12_121
  end
  L12_121 = _UPVALUE1_
  L13_122 = "."
  L14_123 = _UPVALUE0_
  L14_123 = L14_123.routeName
  L12_121 = L12_121 .. L13_122 .. L14_123
  L8_117[L12_121] = A0_109
  L12_121 = _UPVALUE3_
  L12_121 = L12_121.NIL
  if A1_110 == L12_121 then
    L12_121 = _UPVALUE3_
    L12_121 = L12_121.INVALID_ARGUMENT
    return L12_121
  end
  L12_121 = tonumber
  L13_122 = A1_110
  L12_121 = L12_121(L13_122)
  L13_122 = _UPVALUE3_
  L13_122 = L13_122.NIL
  if L12_121 == L13_122 then
    L13_122 = _UPVALUE3_
    L13_122 = L13_122.INVALID_ARGUMENT
    return L13_122
  end
  L13_122 = _UPVALUE8_
  if L12_121 ~= L13_122 then
    L13_122 = _UPVALUE9_
    if L12_121 ~= L13_122 then
      L13_122 = _UPVALUE3_
      L13_122 = L13_122.INVALID_ARGUMENT
      return L13_122
    end
  end
  L13_122 = _UPVALUE1_
  L14_123 = "."
  L15_124 = _UPVALUE0_
  L15_124 = L15_124.active
  L13_122 = L13_122 .. L14_123 .. L15_124
  L8_117[L13_122] = A1_110
  L13_122 = _UPVALUE3_
  L13_122 = L13_122.NIL
  if A2_111 == L13_122 then
    L13_122 = _UPVALUE3_
    L13_122 = L13_122.INVALID_ARGUMENT
    return L13_122
  end
  L13_122 = tonumber
  L14_123 = A2_111
  L13_122 = L13_122(L14_123)
  L14_123 = _UPVALUE3_
  L14_123 = L14_123.NIL
  if L13_122 == L14_123 then
    L14_123 = _UPVALUE3_
    L14_123 = L14_123.INVALID_ARGUMENT
    return L14_123
  end
  L14_123 = _UPVALUE8_
  if L13_122 ~= L14_123 then
    L14_123 = _UPVALUE9_
    if L13_122 ~= L14_123 then
      L14_123 = _UPVALUE3_
      L14_123 = L14_123.INVALID_ARGUMENT
      return L14_123
    end
  end
  L14_123 = _UPVALUE1_
  L15_124 = "."
  L14_123 = L14_123 .. L15_124 .. L16_125
  L8_117[L14_123] = A2_111
  L14_123 = _UPVALUE3_
  L14_123 = L14_123.NIL
  if A3_112 == L14_123 then
    L14_123 = _UPVALUE3_
    L14_123 = L14_123.INVALID_ARGUMENT
    return L14_123
  end
  L14_123 = _UPVALUE4_
  L14_123 = L14_123.ipAddressCheck
  L15_124 = _UPVALUE10_
  L14_123 = L14_123(L15_124, L16_125)
  valid = L14_123
  L14_123 = valid
  L15_124 = _UPVALUE3_
  L15_124 = L15_124.SUCCESS
  if L14_123 ~= L15_124 then
    L14_123 = _UPVALUE7_
    L14_123 = L14_123.ROUTE_INVALID_DESTINATION_IP
    return L14_123
  end
  L14_123 = _UPVALUE1_
  L15_124 = "."
  L14_123 = L14_123 .. L15_124 .. L16_125
  L8_117[L14_123] = A3_112
  L14_123 = _UPVALUE3_
  L14_123 = L14_123.NIL
  if A4_113 == L14_123 then
    L14_123 = _UPVALUE3_
    L14_123 = L14_123.INVALID_ARGUMENT
    return L14_123
  end
  L14_123 = _UPVALUE4_
  L14_123 = L14_123.ipAddressCheck
  L15_124 = _UPVALUE10_
  L14_123 = L14_123(L15_124, L16_125)
  valid = L14_123
  L14_123 = valid
  L15_124 = _UPVALUE3_
  L15_124 = L15_124.SUCCESS
  if L14_123 ~= L15_124 then
    L14_123 = _UPVALUE7_
    L14_123 = L14_123.ROUTE_INVALID_NETMASK
    return L14_123
  end
  L14_123 = _UPVALUE1_
  L15_124 = "."
  L14_123 = L14_123 .. L15_124 .. L16_125
  L8_117[L14_123] = A4_113
  L14_123 = _UPVALUE3_
  L14_123 = L14_123.NIL
  if A5_114 == L14_123 then
    L14_123 = _UPVALUE3_
    L14_123 = L14_123.INVALID_ARGUMENT
    return L14_123
  end
  L14_123 = _UPVALUE1_
  L15_124 = "."
  L14_123 = L14_123 .. L15_124 .. L16_125
  L8_117[L14_123] = A5_114
  L14_123 = _UPVALUE3_
  L14_123 = L14_123.NIL
  if A6_115 == L14_123 then
    L14_123 = _UPVALUE3_
    L14_123 = L14_123.INVALID_ARGUMENT
    return L14_123
  end
  L14_123 = _UPVALUE4_
  L14_123 = L14_123.ipAddressCheck
  L15_124 = _UPVALUE10_
  L14_123 = L14_123(L15_124, L16_125)
  valid = L14_123
  L14_123 = valid
  L15_124 = _UPVALUE3_
  L15_124 = L15_124.SUCCESS
  if L14_123 ~= L15_124 then
    L14_123 = _UPVALUE7_
    L14_123 = L14_123.ROUTE_INVALID_GATEWAY
    return L14_123
  end
  L14_123 = _UPVALUE1_
  L15_124 = "."
  L14_123 = L14_123 .. L15_124 .. L16_125
  L8_117[L14_123] = A6_115
  L14_123 = _UPVALUE3_
  L14_123 = L14_123.NIL
  if A7_116 == L14_123 then
    L14_123 = _UPVALUE3_
    L14_123 = L14_123.INVALID_ARGUMENT
    return L14_123
  end
  L14_123 = tonumber
  L15_124 = A7_116
  L14_123 = L14_123(L15_124)
  L15_124 = _UPVALUE3_
  L15_124 = L15_124.NIL
  if L14_123 == L15_124 then
    L15_124 = _UPVALUE3_
    L15_124 = L15_124.INVALID_ARGUMENT
    return L15_124
  end
  L15_124 = _UPVALUE11_
  if not (L14_123 < L15_124) then
    L15_124 = _UPVALUE12_
  elseif L14_123 > L15_124 then
    L15_124 = _UPVALUE7_
    L15_124 = L15_124.INVALID_METRIC
    return L15_124
  end
  L15_124 = _UPVALUE1_
  L15_124 = L15_124 .. L16_125 .. L17_126
  L8_117[L15_124] = A7_116
  L15_124 = db
  L15_124 = L15_124.getTable
  L15_124 = L15_124(L16_125)
  for _FORV_19_, _FORV_20_ in L16_125(L17_126) do
    if _FORV_20_[_UPVALUE1_ .. "." .. _UPVALUE0_.destinationIpAddress] == A3_112 and _FORV_20_[_UPVALUE1_ .. "." .. _UPVALUE0_.metric] == A7_116 then
      return _UPVALUE7_.ROUTE_ALREADY_EXISTS
    end
  end
  valid = L16_125
  if L16_125 ~= L17_126 then
    return L16_125
  end
  if L16_125 == L17_126 then
    return L17_126
  end
  return _UPVALUE3_.SUCCESS, L17_126
end
function staticRouteDelete(A0_127)
  if A0_127 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_127) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_127) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.NOT_EXIST
  end
  if db.deleteRow(_UPVALUE1_, _UPVALUE2_, A0_127) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_127
  end
  return _UPVALUE0_.SUCCESS, A0_127
end
function staticRouteGetAll()
  local L0_128, L1_129
  L0_128 = _UPVALUE0_
  L0_128 = L0_128.interface
  L1_129 = " !='WAN2PPPOE2' and "
  L0_128 = L0_128 .. L1_129 .. _UPVALUE0_.interface .. " !='WAN1PPPOE2'"
  L1_129 = db
  L1_129 = L1_129.getRowsWhere
  L1_129 = L1_129(_UPVALUE1_, L0_128)
  if L1_129 == NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L1_129
end
function staticRouteDeleteAll()
  local L0_130, L1_131, L2_132, L3_133, L4_134, L5_135, L6_136, L7_137, L8_138
  L0_130 = _UPVALUE0_
  L0_130 = L0_130.interface
  L1_131 = " !='WAN2PPPOE2' and "
  L2_132 = _UPVALUE0_
  L2_132 = L2_132.interface
  L0_130 = L0_130 .. L1_131 .. L2_132 .. L3_133
  L1_131 = {}
  L2_132 = db
  L2_132 = L2_132.getRowsWhere
  L2_132 = L2_132(L3_133, L4_134)
  for L6_136, L7_137 in L3_133(L4_134) do
    L8_138 = {}
    L8_138 = L7_137
    valid = db.delete(_UPVALUE1_, L8_138)
    if valid == _UPVALUE2_.FALSE then
      return _UPVALUE2_.FAILURE
    end
  end
  return L3_133
end
function staticRouteGetExtraPhyInterfaceName()
  local L0_139, L1_140
  L0_139 = ""
  L1_140 = ""
  if db.getRowWhere(NimfTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN1NAME .. "' and " .. _UPVALUE0_.AddressFamily .. " = '" .. IPv4_ADDRESS_FAMILY .. "'") ~= nil then
    if db.getRowWhere(NimfTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN1NAME .. "' and " .. _UPVALUE0_.AddressFamily .. " = '" .. IPv4_ADDRESS_FAMILY .. "'")[NimfTable .. "." .. _UPVALUE0_.ConnectionType] == pptpConnection then
      if db.getRowWhere(PptpTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN1NAME .. "'") ~= nil and db.getRowWhere(NetworkInterfaceTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN1NAME .. "'") ~= nil and db.getRowWhere(PptpTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN1NAME .. "'")[PptpTable .. "." .. _UPVALUE0_.DualAccess] == "1" and db.getRowWhere(NetworkInterfaceTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN1NAME .. "'")[NetworkInterfaceTable .. "." .. _UPVALUE0_.IfStatus] == "1" then
        L0_139 = "Wan1Phy"
      end
    elseif db.getRowWhere(NimfTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN1NAME .. "' and " .. _UPVALUE0_.AddressFamily .. " = '" .. IPv4_ADDRESS_FAMILY .. "'")[NimfTable .. "." .. _UPVALUE0_.ConnectionType] == l2tpConnection then
      if db.getRowWhere(L2TpTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN1NAME .. "'") ~= nil and db.getRowWhere(NetworkInterfaceTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN1NAME .. "'") ~= nil and db.getRowWhere(L2TpTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN1NAME .. "'")[L2TpTable .. "." .. _UPVALUE0_.DualAccess] == "1" and db.getRowWhere(NetworkInterfaceTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN1NAME .. "'")[NetworkInterfaceTable .. "." .. _UPVALUE0_.IfStatus] == "1" then
        L0_139 = "Wan1Phy"
      end
    elseif db.getRowWhere(NimfTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN1NAME .. "' and " .. _UPVALUE0_.AddressFamily .. " = '" .. IPv4_ADDRESS_FAMILY .. "'")[NimfTable .. "." .. _UPVALUE0_.ConnectionType] == dualPppoeConnection and db.getRowWhere(DualPppoeTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN1NAME .. "'") ~= nil and db.getRowWhere(DualPppoeTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN1NAME .. "'")[DualPppoeTable .. "." .. _UPVALUE0_.GetIpFromIspPhy] == "1" and db.getRowWhere(NetworkInterfaceTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN1NAME .. "'") ~= nil and (db.getRowWhere(NetworkInterfaceTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN1NAME .. "'")[NetworkInterfaceTable .. "." .. _UPVALUE0_.IfStatus] == "1" or db.getRowWhere(NetworkInterfaceTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN1NAME .. "'")[NetworkInterfaceTable .. "." .. _UPVALUE0_.IfStatus] == "3") then
      if util.fileExists(russianPppoeFile) then
        L0_139 = "Wan1Phy"
      end
    elseif db.getRowWhere(NimfTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN1NAME .. "' and " .. _UPVALUE0_.AddressFamily .. " = '" .. IPv4_ADDRESS_FAMILY .. "'")[NimfTable .. "." .. _UPVALUE0_.ConnectionType] == dualPppoeConnection and db.getRowWhere(DualPppoeTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN1NAME .. "'") ~= nil and db.getRowWhere(DualPppoeTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN1NAME .. "'")[DualPppoeTable .. "." .. _UPVALUE0_.GetIpFromIspPhy] == "0" and db.getRowWhere(NetworkInterfaceTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN1NAME .. "'") ~= nil and (db.getRowWhere(NetworkInterfaceTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN1NAME .. "'")[NetworkInterfaceTable .. "." .. _UPVALUE0_.IfStatus] == "1" or db.getRowWhere(NetworkInterfaceTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN1NAME .. "'")[NetworkInterfaceTable .. "." .. _UPVALUE0_.IfStatus] == "3") then
      L0_139 = "Wan1Phy"
    end
  end
  if db.getRowWhere(NimfTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN2NAME .. "' and " .. _UPVALUE0_.AddressFamily .. " = '" .. IPv4_ADDRESS_FAMILY .. "'") ~= nil then
    if db.getRowWhere(NimfTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN2NAME .. "' and " .. _UPVALUE0_.AddressFamily .. " = '" .. IPv4_ADDRESS_FAMILY .. "'")[NimfTable .. "." .. _UPVALUE0_.ConnectionType] == pptpConnection then
      if db.getRowWhere(PptpTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN2NAME .. "'") ~= nil and db.getRowWhere(NetworkInterfaceTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN2NAME .. "'") ~= nil and db.getRowWhere(PptpTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN2NAME .. "'")[PptpTable .. "." .. _UPVALUE0_.DualAccess] == "1" and db.getRowWhere(NetworkInterfaceTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN2NAME .. "'")[NetworkInterfaceTable .. "." .. _UPVALUE0_.IfStatus] == "1" then
        L1_140 = "Wan2Phy"
      end
    elseif db.getRowWhere(NimfTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN2NAME .. "' and " .. _UPVALUE0_.AddressFamily .. " = '" .. IPv4_ADDRESS_FAMILY .. "'")[NimfTable .. "." .. _UPVALUE0_.ConnectionType] == l2tpConnection then
      if db.getRowWhere(L2TpTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN2NAME .. "'") ~= nil and db.getRowWhere(NetworkInterfaceTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN2NAME .. "'") ~= nil and db.getRowWhere(L2TpTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN2NAME .. "'")[L2TpTable .. "." .. _UPVALUE0_.DualAccess] == "1" and db.getRowWhere(NetworkInterfaceTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN2NAME .. "'")[NetworkInterfaceTable .. "." .. _UPVALUE0_.IfStatus] == "1" then
        L1_140 = "Wan2Phy"
      end
    elseif db.getRowWhere(NimfTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN2NAME .. "' and " .. _UPVALUE0_.AddressFamily .. " = '" .. IPv4_ADDRESS_FAMILY .. "'")[NimfTable .. "." .. _UPVALUE0_.ConnectionType] == dualPppoeConnection and db.getRowWhere(DualPppoeTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN2NAME .. "'") ~= nil and db.getRowWhere(DualPppoeTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN2NAME .. "'")[DualPppoeTable .. "." .. _UPVALUE0_.GetIpFromIspPhy] == "1" and db.getRowWhere(NetworkInterfaceTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN2NAME .. "'") ~= nil and (db.getRowWhere(NetworkInterfaceTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN2NAME .. "'")[NetworkInterfaceTable .. "." .. _UPVALUE0_.IfStatus] == "1" or db.getRowWhere(NetworkInterfaceTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN2NAME .. "'")[NetworkInterfaceTable .. "." .. _UPVALUE0_.IfStatus] == "3") then
      if util.fileExists(russianPppoeFile) then
        L1_140 = "Wan2Phy"
      end
    elseif db.getRowWhere(NimfTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN2NAME .. "' and " .. _UPVALUE0_.AddressFamily .. " = '" .. IPv4_ADDRESS_FAMILY .. "'")[NimfTable .. "." .. _UPVALUE0_.ConnectionType] == dualPppoeConnection and db.getRowWhere(DualPppoeTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN2NAME .. "'") ~= nil and db.getRowWhere(DualPppoeTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN2NAME .. "'")[DualPppoeTable .. "." .. _UPVALUE0_.GetIpFromIspPhy] == "0" and db.getRowWhere(NetworkInterfaceTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN2NAME .. "'") ~= nil and (db.getRowWhere(NetworkInterfaceTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN2NAME .. "'")[NetworkInterfaceTable .. "." .. _UPVALUE0_.IfStatus] == "1" or db.getRowWhere(NetworkInterfaceTable, _UPVALUE0_.LogicalIfName .. " = '" .. WAN2NAME .. "'")[NetworkInterfaceTable .. "." .. _UPVALUE0_.IfStatus] == "3") then
      L1_140 = "Wan2Phy"
    end
  end
  return L0_139, L1_140
end
function interfaceSubnetCheck(A0_141, A1_142)
  local L2_143, L3_144, L4_145, L5_146, L6_147, L7_148, L8_149, L9_150, L10_151, L11_152, L12_153, L13_154, L14_155, L15_156, L16_157
  L2_143 = db
  L2_143 = L2_143.getRowWhere
  L3_144 = NimfTable
  L4_145 = _UPVALUE0_
  L4_145 = L4_145.LogicalIfName
  L5_146 = " = '"
  L6_147 = WAN1NAME
  L7_148 = "' and "
  L8_149 = _UPVALUE0_
  L8_149 = L8_149.AddressFamily
  L9_150 = " = '"
  L10_151 = IPv4_ADDRESS_FAMILY
  L11_152 = "'"
  L4_145 = L4_145 .. L5_146 .. L6_147 .. L7_148 .. L8_149 .. L9_150 .. L10_151 .. L11_152
  L2_143 = L2_143(L3_144, L4_145)
  L3_144 = db
  L3_144 = L3_144.getRowWhere
  L4_145 = NimfTable
  L5_146 = _UPVALUE0_
  L5_146 = L5_146.LogicalIfName
  L6_147 = " = '"
  L7_148 = WAN2NAME
  L8_149 = "' and "
  L9_150 = _UPVALUE0_
  L9_150 = L9_150.AddressFamily
  L10_151 = " = '"
  L11_152 = IPv4_ADDRESS_FAMILY
  L12_153 = "'"
  L5_146 = L5_146 .. L6_147 .. L7_148 .. L8_149 .. L9_150 .. L10_151 .. L11_152 .. L12_153
  L3_144 = L3_144(L4_145, L5_146)
  L4_145, L5_146, L6_147, L7_148, L8_149, L9_150 = nil, nil, nil, nil, nil, nil
  L10_151 = _UPVALUE1_
  if A0_141 == L10_151 then
    L10_151 = db
    L10_151 = L10_151.getAttributeWhere
    L11_152 = _UPVALUE2_
    L12_153 = _UPVALUE0_
    L12_153 = L12_153.interfaceName
    L13_154 = " = '"
    L14_155 = _UPVALUE1_
    L15_156 = "' AND "
    L16_157 = _UPVALUE0_
    L16_157 = L16_157.addressFamily
    L12_153 = L12_153 .. L13_154 .. L14_155 .. L15_156 .. L16_157 .. " = " .. _UPVALUE3_
    L13_154 = _UPVALUE0_
    L13_154 = L13_154.wan_ipAddress
    L10_151 = L10_151(L11_152, L12_153, L13_154)
    L4_145 = L10_151
    L10_151 = db
    L10_151 = L10_151.getAttributeWhere
    L11_152 = _UPVALUE2_
    L12_153 = _UPVALUE0_
    L12_153 = L12_153.interfaceName
    L13_154 = " = '"
    L14_155 = _UPVALUE1_
    L15_156 = "' AND "
    L16_157 = _UPVALUE0_
    L16_157 = L16_157.addressFamily
    L12_153 = L12_153 .. L13_154 .. L14_155 .. L15_156 .. L16_157 .. " = " .. _UPVALUE3_
    L13_154 = _UPVALUE0_
    L13_154 = L13_154.wan_subnet
    L10_151 = L10_151(L11_152, L12_153, L13_154)
    L5_146 = L10_151
    L10_151 = _UPVALUE4_
    L10_151 = L10_151.NIL
    if L4_145 ~= L10_151 then
      L10_151 = _UPVALUE5_
      if L4_145 ~= L10_151 then
        L10_151 = _UPVALUE4_
        L10_151 = L10_151.NIL
        if L5_146 ~= L10_151 then
          L10_151 = _UPVALUE5_
        end
      end
    else
      if L5_146 == L10_151 then
        L10_151 = _UPVALUE6_
        L10_151 = L10_151.INTERFACE_HAVE_NO_IP
        return L10_151
    end
    else
      L10_151 = _UPVALUE7_
      L10_151 = L10_151.ipv4DualMaskCheck
      L11_152 = L4_145
      L12_153 = L5_146
      L13_154 = A1_142
      L14_155 = L5_146
      L10_151 = L10_151(L11_152, L12_153, L13_154, L14_155)
      valid = L10_151
      L10_151 = valid
      L11_152 = _UPVALUE4_
      L11_152 = L11_152.SUCCESS
      if L10_151 ~= L11_152 then
        L10_151 = _UPVALUE6_
        L10_151 = L10_151.GATEWAY_NOT_IN_SAME_SUBNET
        return L10_151
      end
    end
    L10_151 = _UPVALUE4_
    L10_151 = L10_151.SUCCESS
    return L10_151
  else
    L10_151 = _UPVALUE8_
    if A0_141 == L10_151 then
      L10_151 = NimfTable
      L11_152 = "."
      L12_153 = _UPVALUE0_
      L12_153 = L12_153.ConnectionType
      L10_151 = L10_151 .. L11_152 .. L12_153
      L10_151 = L2_143[L10_151]
      L11_152 = dualPppoeConnection
      if L10_151 == L11_152 then
        L10_151 = db
        L10_151 = L10_151.getRowWhere
        L11_152 = DualPppoeTable
        L12_153 = _UPVALUE0_
        L12_153 = L12_153.LogicalIfName
        L13_154 = " = '"
        L14_155 = WAN1NAME
        L15_156 = "'"
        L12_153 = L12_153 .. L13_154 .. L14_155 .. L15_156
        L10_151 = L10_151(L11_152, L12_153)
        L11_152 = db
        L11_152 = L11_152.getAttribute
        L12_153 = NetworkInterfaceTable
        L13_154 = _UPVALUE0_
        L13_154 = L13_154.LogicalIfName
        L14_155 = WAN1NAME
        L15_156 = _UPVALUE0_
        L15_156 = L15_156.IfStatus
        L11_152 = L11_152(L12_153, L13_154, L14_155, L15_156)
        L11_152 = L11_152 or ""
        L12_153 = io
        L12_153 = L12_153.open
        L13_154 = russianPppoeFile
        L14_155 = "r"
        L12_153 = L12_153(L13_154, L14_155)
        L13_154 = DualPppoeTable
        L14_155 = "."
        L15_156 = _UPVALUE0_
        L15_156 = L15_156.GetIpFromIspPhy
        L13_154 = L13_154 .. L14_155 .. L15_156
        L13_154 = L10_151[L13_154]
        if L13_154 == "1" then
          if L12_153 then
            L14_155 = L12_153
            L13_154 = L12_153.read
            L15_156 = "*line"
            L13_154 = L13_154(L14_155, L15_156)
            L6_147 = L13_154 or ""
            L14_155 = L12_153
            L13_154 = L12_153.read
            L15_156 = "*line"
            L13_154 = L13_154(L14_155, L15_156)
            L5_146 = L13_154 or ""
            L14_155 = L12_153
            L13_154 = L12_153.read
            L15_156 = "*line"
            L13_154 = L13_154(L14_155, L15_156)
            L4_145 = L13_154 or ""
          else
            L6_147 = _UPVALUE5_
            L5_146 = _UPVALUE5_
            L4_145 = _UPVALUE5_
          end
          L14_155 = L12_153
          L13_154 = L12_153.close
          L13_154(L14_155)
        else
          L13_154 = DualPppoeTable
          L14_155 = "."
          L15_156 = _UPVALUE0_
          L15_156 = L15_156.GetIpFromIspPhy
          L13_154 = L13_154 .. L14_155 .. L15_156
          L13_154 = L10_151[L13_154]
          if L13_154 == "0" and L11_152 == "1" then
            L13_154 = DualPppoeTable
            L14_155 = "."
            L15_156 = _UPVALUE0_
            L15_156 = L15_156.StaticIpPhy
            L13_154 = L13_154 .. L14_155 .. L15_156
            L13_154 = L10_151[L13_154]
            if L13_154 ~= nil then
              L13_154 = DualPppoeTable
              L14_155 = "."
              L15_156 = _UPVALUE0_
              L15_156 = L15_156.NetMaskPhy
              L13_154 = L13_154 .. L14_155 .. L15_156
              L13_154 = L10_151[L13_154]
              if L13_154 ~= nil then
                L13_154 = DualPppoeTable
                L14_155 = "."
                L15_156 = _UPVALUE0_
                L15_156 = L15_156.GatewayPhy
                L13_154 = L13_154 .. L14_155 .. L15_156
                L13_154 = L10_151[L13_154]
                if L13_154 ~= nil then
                  L13_154 = DualPppoeTable
                  L14_155 = "."
                  L15_156 = _UPVALUE0_
                  L15_156 = L15_156.StaticIpPhy
                  L13_154 = L13_154 .. L14_155 .. L15_156
                  L6_147 = L10_151[L13_154]
                  L13_154 = DualPppoeTable
                  L14_155 = "."
                  L15_156 = _UPVALUE0_
                  L15_156 = L15_156.NetMaskPhy
                  L13_154 = L13_154 .. L14_155 .. L15_156
                  L5_146 = L10_151[L13_154]
                  L13_154 = DualPppoeTable
                  L14_155 = "."
                  L15_156 = _UPVALUE0_
                  L15_156 = L15_156.GatewayPhy
                  L13_154 = L13_154 .. L14_155 .. L15_156
                  L4_145 = L10_151[L13_154]
                end
              end
            else
              L6_147 = _UPVALUE5_
              L5_146 = _UPVALUE5_
              L4_145 = _UPVALUE5_
            end
          end
        end
      else
        L10_151 = NimfTable
        L11_152 = "."
        L12_153 = _UPVALUE0_
        L12_153 = L12_153.ConnectionType
        L10_151 = L10_151 .. L11_152 .. L12_153
        L10_151 = L2_143[L10_151]
        L11_152 = l2tpConnection
        if L10_151 == L11_152 then
          L10_151 = io
          L10_151 = L10_151.open
          L11_152 = russianL2tpFile
          L12_153 = "r"
          L10_151 = L10_151(L11_152, L12_153)
          if L10_151 then
            L12_153 = L10_151
            L11_152 = L10_151.read
            L13_154 = "*line"
            L11_152 = L11_152(L12_153, L13_154)
            L6_147 = L11_152 or ""
            L12_153 = L10_151
            L11_152 = L10_151.read
            L13_154 = "*line"
            L11_152 = L11_152(L12_153, L13_154)
            L5_146 = L11_152 or ""
            L12_153 = L10_151
            L11_152 = L10_151.read
            L13_154 = "*line"
            L11_152 = L11_152(L12_153, L13_154)
            L4_145 = L11_152 or ""
          else
            L6_147 = _UPVALUE5_
            L5_146 = _UPVALUE5_
            L4_145 = _UPVALUE5_
          end
          L12_153 = L10_151
          L11_152 = L10_151.close
          L11_152(L12_153)
        else
          L10_151 = NimfTable
          L11_152 = "."
          L12_153 = _UPVALUE0_
          L12_153 = L12_153.ConnectionType
          L10_151 = L10_151 .. L11_152 .. L12_153
          L10_151 = L2_143[L10_151]
          L11_152 = pptpConnection
          if L10_151 == L11_152 then
            L10_151 = io
            L10_151 = L10_151.open
            L11_152 = russianPptpFile
            L12_153 = "r"
            L10_151 = L10_151(L11_152, L12_153)
            if L10_151 then
              L12_153 = L10_151
              L11_152 = L10_151.read
              L13_154 = "*line"
              L11_152 = L11_152(L12_153, L13_154)
              L6_147 = L11_152 or ""
              L12_153 = L10_151
              L11_152 = L10_151.read
              L13_154 = "*line"
              L11_152 = L11_152(L12_153, L13_154)
              L5_146 = L11_152 or ""
              L12_153 = L10_151
              L11_152 = L10_151.read
              L13_154 = "*line"
              L11_152 = L11_152(L12_153, L13_154)
              L4_145 = L11_152 or ""
            else
              L6_147 = _UPVALUE5_
              L5_146 = _UPVALUE5_
              L4_145 = _UPVALUE5_
            end
            L12_153 = L10_151
            L11_152 = L10_151.close
            L11_152(L12_153)
          end
        end
      end
      L10_151 = _UPVALUE4_
      L10_151 = L10_151.NIL
      if L4_145 ~= L10_151 then
        L10_151 = _UPVALUE5_
        if L4_145 ~= L10_151 then
          L10_151 = _UPVALUE4_
          L10_151 = L10_151.NIL
          if L5_146 ~= L10_151 then
            L10_151 = _UPVALUE5_
          end
        end
      else
        if L5_146 == L10_151 then
          L10_151 = _UPVALUE6_
          L10_151 = L10_151.INTERFACE_HAVE_NO_IP
          return L10_151
      end
      else
        L10_151 = _UPVALUE7_
        L10_151 = L10_151.ipv4DualMaskCheck
        L11_152 = L4_145
        L12_153 = L5_146
        L13_154 = A1_142
        L14_155 = L5_146
        L10_151 = L10_151(L11_152, L12_153, L13_154, L14_155)
        valid = L10_151
        L10_151 = valid
        L11_152 = _UPVALUE4_
        L11_152 = L11_152.SUCCESS
        if L10_151 ~= L11_152 then
          L10_151 = _UPVALUE6_
          L10_151 = L10_151.GATEWAY_NOT_IN_SAME_SUBNET
          return L10_151
        end
      end
      L10_151 = _UPVALUE4_
      L10_151 = L10_151.SUCCESS
      return L10_151
    else
      L10_151 = _UPVALUE9_
      if A0_141 == L10_151 then
        L10_151 = db
        L10_151 = L10_151.getAttributeWhere
        L11_152 = _UPVALUE2_
        L12_153 = _UPVALUE0_
        L12_153 = L12_153.interfaceName
        L13_154 = " = '"
        L14_155 = _UPVALUE9_
        L15_156 = "' AND "
        L16_157 = _UPVALUE0_
        L16_157 = L16_157.addressFamily
        L12_153 = L12_153 .. L13_154 .. L14_155 .. L15_156 .. L16_157 .. " = " .. _UPVALUE3_
        L13_154 = _UPVALUE0_
        L13_154 = L13_154.wan_ipAddress
        L10_151 = L10_151(L11_152, L12_153, L13_154)
        L11_152 = db
        L11_152 = L11_152.getAttributeWhere
        L12_153 = _UPVALUE2_
        L13_154 = _UPVALUE0_
        L13_154 = L13_154.interfaceName
        L14_155 = " = '"
        L15_156 = _UPVALUE9_
        L16_157 = "' AND "
        L13_154 = L13_154 .. L14_155 .. L15_156 .. L16_157 .. _UPVALUE0_.addressFamily .. " = " .. _UPVALUE3_
        L14_155 = _UPVALUE0_
        L14_155 = L14_155.wan_subnet
        L11_152 = L11_152(L12_153, L13_154, L14_155)
        L12_153 = _UPVALUE4_
        L12_153 = L12_153.NIL
        if L10_151 ~= L12_153 then
          L12_153 = _UPVALUE5_
          if L10_151 ~= L12_153 then
            L12_153 = _UPVALUE4_
            L12_153 = L12_153.NIL
            if L11_152 ~= L12_153 then
              L12_153 = _UPVALUE5_
            end
          end
        else
          if L11_152 == L12_153 then
            L12_153 = _UPVALUE6_
            L12_153 = L12_153.INTERFACE_HAVE_NO_IP
            return L12_153
        end
        else
          L12_153 = _UPVALUE7_
          L12_153 = L12_153.ipv4DualMaskCheck
          L13_154 = L10_151
          L14_155 = L11_152
          L15_156 = A1_142
          L16_157 = L11_152
          L12_153 = L12_153(L13_154, L14_155, L15_156, L16_157)
          valid = L12_153
          L12_153 = valid
          L13_154 = _UPVALUE4_
          L13_154 = L13_154.SUCCESS
          if L12_153 ~= L13_154 then
            L12_153 = _UPVALUE6_
            L12_153 = L12_153.GATEWAY_NOT_IN_SAME_SUBNET
            return L12_153
          end
        end
        L12_153 = _UPVALUE4_
        L12_153 = L12_153.SUCCESS
        return L12_153
      else
        L10_151 = _UPVALUE10_
        if A0_141 == L10_151 then
          L10_151 = NimfTable
          L11_152 = "."
          L12_153 = _UPVALUE0_
          L12_153 = L12_153.ConnectionType
          L10_151 = L10_151 .. L11_152 .. L12_153
          L10_151 = L3_144[L10_151]
          L11_152 = dualPppoeConnection
          if L10_151 == L11_152 then
            L10_151 = db
            L10_151 = L10_151.getRowWhere
            L11_152 = DualPppoeTable
            L12_153 = _UPVALUE0_
            L12_153 = L12_153.LogicalIfName
            L13_154 = " = '"
            L14_155 = WAN2NAME
            L15_156 = "'"
            L12_153 = L12_153 .. L13_154 .. L14_155 .. L15_156
            L10_151 = L10_151(L11_152, L12_153)
            L11_152 = db
            L11_152 = L11_152.getAttribute
            L12_153 = NetworkInterfaceTable
            L13_154 = _UPVALUE0_
            L13_154 = L13_154.LogicalIfName
            L14_155 = WAN2NAME
            L15_156 = _UPVALUE0_
            L15_156 = L15_156.IfStatus
            L11_152 = L11_152(L12_153, L13_154, L14_155, L15_156)
            L11_152 = L11_152 or ""
            L12_153 = io
            L12_153 = L12_153.open
            L13_154 = russianPppoeFile
            L14_155 = "r"
            L12_153 = L12_153(L13_154, L14_155)
            L13_154 = DualPppoeTable
            L14_155 = "."
            L15_156 = _UPVALUE0_
            L15_156 = L15_156.GetIpFromIspPhy
            L13_154 = L13_154 .. L14_155 .. L15_156
            L13_154 = L10_151[L13_154]
            if L13_154 == "1" then
              if L12_153 then
                L14_155 = L12_153
                L13_154 = L12_153.read
                L15_156 = "*line"
                L13_154 = L13_154(L14_155, L15_156)
                L9_150 = L13_154 or ""
                L14_155 = L12_153
                L13_154 = L12_153.read
                L15_156 = "*line"
                L13_154 = L13_154(L14_155, L15_156)
                L8_149 = L13_154 or ""
                L14_155 = L12_153
                L13_154 = L12_153.read
                L15_156 = "*line"
                L13_154 = L13_154(L14_155, L15_156)
                L7_148 = L13_154 or ""
              else
                L9_150 = _UPVALUE5_
                L8_149 = _UPVALUE5_
                L7_148 = _UPVALUE5_
              end
              L14_155 = L12_153
              L13_154 = L12_153.close
              L13_154(L14_155)
            else
              L13_154 = DualPppoeTable
              L14_155 = "."
              L15_156 = _UPVALUE0_
              L15_156 = L15_156.GetIpFromIspPhy
              L13_154 = L13_154 .. L14_155 .. L15_156
              L13_154 = L10_151[L13_154]
              if L13_154 == "0" and L11_152 == "1" then
                L13_154 = DualPppoeTable
                L14_155 = "."
                L15_156 = _UPVALUE0_
                L15_156 = L15_156.StaticIpPhy
                L13_154 = L13_154 .. L14_155 .. L15_156
                L13_154 = L10_151[L13_154]
                if L13_154 ~= nil then
                  L13_154 = DualPppoeTable
                  L14_155 = "."
                  L15_156 = _UPVALUE0_
                  L15_156 = L15_156.NetMaskPhy
                  L13_154 = L13_154 .. L14_155 .. L15_156
                  L13_154 = L10_151[L13_154]
                  if L13_154 ~= nil then
                    L13_154 = DualPppoeTable
                    L14_155 = "."
                    L15_156 = _UPVALUE0_
                    L15_156 = L15_156.GatewayPhy
                    L13_154 = L13_154 .. L14_155 .. L15_156
                    L13_154 = L10_151[L13_154]
                    if L13_154 ~= nil then
                      L13_154 = DualPppoeTable
                      L14_155 = "."
                      L15_156 = _UPVALUE0_
                      L15_156 = L15_156.StaticIpPhy
                      L13_154 = L13_154 .. L14_155 .. L15_156
                      L9_150 = L10_151[L13_154]
                      L13_154 = DualPppoeTable
                      L14_155 = "."
                      L15_156 = _UPVALUE0_
                      L15_156 = L15_156.NetMaskPhy
                      L13_154 = L13_154 .. L14_155 .. L15_156
                      L8_149 = L10_151[L13_154]
                      L13_154 = DualPppoeTable
                      L14_155 = "."
                      L15_156 = _UPVALUE0_
                      L15_156 = L15_156.GatewayPhy
                      L13_154 = L13_154 .. L14_155 .. L15_156
                      L7_148 = L10_151[L13_154]
                    end
                  end
                else
                  L9_150 = _UPVALUE5_
                  L8_149 = _UPVALUE5_
                  L7_148 = _UPVALUE5_
                end
              end
            end
          else
            L10_151 = NimfTable
            L11_152 = "."
            L12_153 = _UPVALUE0_
            L12_153 = L12_153.ConnectionType
            L10_151 = L10_151 .. L11_152 .. L12_153
            L10_151 = L3_144[L10_151]
            L11_152 = l2tpConnection
            if L10_151 == L11_152 then
              L10_151 = io
              L10_151 = L10_151.open
              L11_152 = russianL2tpFile
              L12_153 = "r"
              L10_151 = L10_151(L11_152, L12_153)
              if L10_151 then
                L12_153 = L10_151
                L11_152 = L10_151.read
                L13_154 = "*line"
                L11_152 = L11_152(L12_153, L13_154)
                L9_150 = L11_152 or ""
                L12_153 = L10_151
                L11_152 = L10_151.read
                L13_154 = "*line"
                L11_152 = L11_152(L12_153, L13_154)
                L8_149 = L11_152 or ""
                L12_153 = L10_151
                L11_152 = L10_151.read
                L13_154 = "*line"
                L11_152 = L11_152(L12_153, L13_154)
                L7_148 = L11_152 or ""
              else
                L9_150 = _UPVALUE5_
                L8_149 = _UPVALUE5_
                L7_148 = _UPVALUE5_
              end
              L12_153 = L10_151
              L11_152 = L10_151.close
              L11_152(L12_153)
            else
              L10_151 = NimfTable
              L11_152 = "."
              L12_153 = _UPVALUE0_
              L12_153 = L12_153.ConnectionType
              L10_151 = L10_151 .. L11_152 .. L12_153
              L10_151 = L3_144[L10_151]
              L11_152 = pptpConnection
              if L10_151 == L11_152 then
                L10_151 = io
                L10_151 = L10_151.open
                L11_152 = russianPptpFile
                L12_153 = "r"
                L10_151 = L10_151(L11_152, L12_153)
                if L10_151 then
                  L12_153 = L10_151
                  L11_152 = L10_151.read
                  L13_154 = "*line"
                  L11_152 = L11_152(L12_153, L13_154)
                  L9_150 = L11_152 or ""
                  L12_153 = L10_151
                  L11_152 = L10_151.read
                  L13_154 = "*line"
                  L11_152 = L11_152(L12_153, L13_154)
                  L8_149 = L11_152 or ""
                  L12_153 = L10_151
                  L11_152 = L10_151.read
                  L13_154 = "*line"
                  L11_152 = L11_152(L12_153, L13_154)
                  L7_148 = L11_152 or ""
                else
                  L9_150 = _UPVALUE5_
                  L8_149 = _UPVALUE5_
                  L7_148 = _UPVALUE5_
                end
                L12_153 = L10_151
                L11_152 = L10_151.close
                L11_152(L12_153)
              end
            end
          end
          L10_151 = _UPVALUE4_
          L10_151 = L10_151.NIL
          if L7_148 ~= L10_151 then
            L10_151 = _UPVALUE5_
            if L7_148 ~= L10_151 then
              L10_151 = _UPVALUE4_
              L10_151 = L10_151.NIL
              if L8_149 ~= L10_151 then
                L10_151 = _UPVALUE5_
              end
            end
          else
            if L8_149 == L10_151 then
              L10_151 = _UPVALUE6_
              L10_151 = L10_151.INTERFACE_HAVE_NO_IP
              return L10_151
          end
          else
            L10_151 = _UPVALUE7_
            L10_151 = L10_151.ipv4DualMaskCheck
            L11_152 = L7_148
            L12_153 = L8_149
            L13_154 = A1_142
            L14_155 = L8_149
            L10_151 = L10_151(L11_152, L12_153, L13_154, L14_155)
            valid = L10_151
            L10_151 = valid
            L11_152 = _UPVALUE4_
            L11_152 = L11_152.SUCCESS
            if L10_151 ~= L11_152 then
              L10_151 = _UPVALUE6_
              L10_151 = L10_151.GATEWAY_NOT_IN_SAME_SUBNET
              return L10_151
            end
          end
          L10_151 = _UPVALUE4_
          L10_151 = L10_151.SUCCESS
          return L10_151
        else
          L10_151 = _UPVALUE11_
          if A0_141 == L10_151 then
            L10_151 = db
            L10_151 = L10_151.getAttribute
            L11_152 = _UPVALUE12_
            L12_153 = _UPVALUE0_
            L12_153 = L12_153.dmz_interface
            L13_154 = _UPVALUE11_
            L14_155 = _UPVALUE0_
            L14_155 = L14_155.dmz_ip
            L10_151 = L10_151(L11_152, L12_153, L13_154, L14_155)
            L11_152 = db
            L11_152 = L11_152.getAttribute
            L12_153 = _UPVALUE12_
            L13_154 = _UPVALUE0_
            L13_154 = L13_154.dmz_interface
            L14_155 = _UPVALUE11_
            L15_156 = _UPVALUE0_
            L15_156 = L15_156.dmz_netmask
            L11_152 = L11_152(L12_153, L13_154, L14_155, L15_156)
            L12_153 = _UPVALUE4_
            L12_153 = L12_153.NIL
            if L10_151 ~= L12_153 then
              L12_153 = _UPVALUE5_
              if L10_151 ~= L12_153 then
                L12_153 = _UPVALUE4_
                L12_153 = L12_153.NIL
                if L11_152 ~= L12_153 then
                  L12_153 = _UPVALUE5_
                end
              end
            else
              if L11_152 == L12_153 then
                L12_153 = _UPVALUE6_
                L12_153 = L12_153.INTERFACE_HAVE_NO_IP
                return L12_153
            end
            else
              L12_153 = _UPVALUE7_
              L12_153 = L12_153.ipv4DualMaskCheck
              L13_154 = L10_151
              L14_155 = L11_152
              L15_156 = A1_142
              L16_157 = L11_152
              L12_153 = L12_153(L13_154, L14_155, L15_156, L16_157)
              valid = L12_153
              L12_153 = valid
              L13_154 = _UPVALUE4_
              L13_154 = L13_154.SUCCESS
              if L12_153 ~= L13_154 then
                L12_153 = _UPVALUE6_
                L12_153 = L12_153.GATEWAY_NOT_IN_SAME_SUBNET
                return L12_153
              end
            end
            L12_153 = _UPVALUE4_
            L12_153 = L12_153.SUCCESS
            return L12_153
          else
            L10_151 = _UPVALUE13_
            if A0_141 == L10_151 then
              L10_151 = db
              L10_151 = L10_151.getAttributeWhere
              L11_152 = _UPVALUE2_
              L12_153 = _UPVALUE0_
              L12_153 = L12_153.interfaceName
              L13_154 = " = '"
              L14_155 = _UPVALUE13_
              L15_156 = "' AND "
              L16_157 = _UPVALUE0_
              L16_157 = L16_157.addressFamily
              L12_153 = L12_153 .. L13_154 .. L14_155 .. L15_156 .. L16_157 .. " = " .. _UPVALUE3_
              L13_154 = _UPVALUE0_
              L13_154 = L13_154.wan_ipAddress
              L10_151 = L10_151(L11_152, L12_153, L13_154)
              L11_152 = db
              L11_152 = L11_152.getAttributeWhere
              L12_153 = _UPVALUE2_
              L13_154 = _UPVALUE0_
              L13_154 = L13_154.interfaceName
              L14_155 = " = '"
              L15_156 = _UPVALUE13_
              L16_157 = "' AND "
              L13_154 = L13_154 .. L14_155 .. L15_156 .. L16_157 .. _UPVALUE0_.addressFamily .. " = " .. _UPVALUE3_
              L14_155 = _UPVALUE0_
              L14_155 = L14_155.wan_subnet
              L11_152 = L11_152(L12_153, L13_154, L14_155)
              L12_153 = _UPVALUE4_
              L12_153 = L12_153.NIL
              if L10_151 ~= L12_153 then
                L12_153 = _UPVALUE5_
                if L10_151 ~= L12_153 then
                  L12_153 = _UPVALUE4_
                  L12_153 = L12_153.NIL
                  if L11_152 ~= L12_153 then
                    L12_153 = _UPVALUE5_
                  end
                end
              else
                if L11_152 == L12_153 then
                  L12_153 = _UPVALUE6_
                  L12_153 = L12_153.INTERFACE_HAVE_NO_IP
                  return L12_153
              end
              else
                L12_153 = _UPVALUE7_
                L12_153 = L12_153.ipv4DualMaskCheck
                L13_154 = L10_151
                L14_155 = L11_152
                L15_156 = A1_142
                L16_157 = L11_152
                L12_153 = L12_153(L13_154, L14_155, L15_156, L16_157)
                valid = L12_153
                L12_153 = valid
                L13_154 = _UPVALUE4_
                L13_154 = L13_154.SUCCESS
                if L12_153 ~= L13_154 then
                  L12_153 = _UPVALUE6_
                  L12_153 = L12_153.GATEWAY_NOT_IN_SAME_SUBNET
                  return L12_153
                end
              end
              L12_153 = _UPVALUE4_
              L12_153 = L12_153.SUCCESS
              return L12_153
            else
              L10_151 = string
              L10_151 = L10_151.sub
              L11_152 = A0_141
              L12_153 = 1
              L13_154 = 3
              L10_151 = L10_151(L11_152, L12_153, L13_154)
              L11_152 = _UPVALUE14_
              if L10_151 == L11_152 then
                L11_152 = _UPVALUE15_
                L11_152 = L11_152.typeFind
                L12_153 = A0_141
                L12_153 = L11_152(L12_153)
                L13_154 = _UPVALUE4_
                L13_154 = L13_154.SUCCESS
                if L11_152 ~= L13_154 then
                  L13_154 = _UPVALUE4_
                  L13_154 = L13_154.INTERFACE_NOT_DEFINED
                  return L13_154
                end
                L13_154 = _UPVALUE15_
                L13_154 = L13_154.dhcpServerVLANGet
                L14_155 = L12_153
                L16_157 = L13_154(L14_155)
                if L13_154 ~= _UPVALUE4_.SUCCESS then
                  return _UPVALUE4_.INTERFACE_NOT_DEFINED
                end
                if L15_156 == _UPVALUE4_.NIL or L15_156 == _UPVALUE5_ or L16_157 == _UPVALUE4_.NIL or L16_157 == _UPVALUE5_ then
                  return _UPVALUE6_.INTERFACE_HAVE_NO_IP
                else
                  valid = _UPVALUE7_.ipv4DualMaskCheck(L15_156, L16_157, A1_142, L16_157)
                  if valid ~= _UPVALUE4_.SUCCESS then
                    return _UPVALUE6_.GATEWAY_NOT_IN_SAME_SUBNET
                  end
                end
                return _UPVALUE4_.SUCCESS
              end
              L11_152 = _UPVALUE4_
              L11_152 = L11_152.INTERFACE_NOT_DEFINED
              return L11_152
            end
          end
        end
      end
    end
  end
end
