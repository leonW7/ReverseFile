local L0_0
L0_0 = module
L0_0("com.teamf1.core.sslvpn.client_route", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/sslvpn_client")
L0_0 = require
L0_0("teamf1lualib/sslvpn_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.sslvpn.returnCodes")
client_routeTable = "SSLVPNClientRoute"
;({}).routeDstNetworkIP = "DestinationNetwork"
;({}).routeSubnetmask = "SubnetMask"
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
else
end
function routeDstNetworkIPGet()
  local L0_1, L1_2
  L0_1 = db
  L0_1 = L0_1.getNextRowId
  L1_2 = _UPVALUE0_
  L0_1 = L0_1(L1_2, client_routeTable)
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(client_routeTable, _UPVALUE1_, L0_1, _UPVALUE2_.routeDstNetworkIP)
  if L1_2 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_1, L1_2
end
function routeDstNetworkIPGetNext(A0_3)
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
  L2_5 = client_routeTable
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
  L1_4 = L1_4(L2_5, client_routeTable)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if L1_4 == L2_5 then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.NOT_EXIST
    return L2_5
  end
  L2_5 = db
  L2_5 = L2_5.getAttribute
  L2_5 = L2_5(client_routeTable, _UPVALUE1_, L1_4, _UPVALUE2_.routeDstNetworkIP)
  if L2_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L2_5
end
function routeDstNetworkIPSet(A0_6, A1_7)
  local L2_8
  L2_8 = _UPVALUE0_
  L2_8 = L2_8.NIL
  if A0_6 ~= L2_8 then
    L2_8 = tonumber
    L2_8 = L2_8(A0_6)
  elseif L2_8 == _UPVALUE0_.NIL then
    L2_8 = _UPVALUE0_
    L2_8 = L2_8.INVALID_ARGUMENT
    return L2_8
  end
  L2_8 = db
  L2_8 = L2_8.existsRow
  L2_8 = L2_8(client_routeTable, _UPVALUE1_, A0_6)
  if L2_8 == _UPVALUE0_.FALSE then
    L2_8 = _UPVALUE0_
    L2_8 = L2_8.INVALID_ARGUMENT
    return L2_8
  end
  L2_8 = nil
  if A1_7 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_8 = _UPVALUE2_.ipAddressCheck("2", A1_7)
  if L2_8 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(client_routeTable, _UPVALUE1_, A0_6, _UPVALUE3_.routeDstNetworkIP, A1_7) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_6
  end
  return _UPVALUE0_.SUCCESS, A0_6
end
function routeDstNetworkIPDelete(A0_9, A1_10)
  local L3_11
  L3_11 = _UPVALUE0_
  L3_11 = L3_11.SUCCESS
  return L3_11, A0_9
end
function routeSubnetmaskGet()
  local L0_12, L1_13
  L0_12 = db
  L0_12 = L0_12.getNextRowId
  L1_13 = _UPVALUE0_
  L0_12 = L0_12(L1_13, client_routeTable)
  L1_13 = db
  L1_13 = L1_13.getAttribute
  L1_13 = L1_13(client_routeTable, _UPVALUE1_, L0_12, _UPVALUE2_.routeSubnetmask)
  if L1_13 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_12, L1_13
end
function routeSubnetmaskGetNext(A0_14)
  local L1_15, L2_16
  L1_15 = _UPVALUE0_
  L1_15 = L1_15.NIL
  if A0_14 ~= L1_15 then
    L1_15 = tonumber
    L2_16 = A0_14
    L1_15 = L1_15(L2_16)
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.NIL
  elseif L1_15 == L2_16 then
    L1_15 = _UPVALUE0_
    L1_15 = L1_15.INVALID_ARGUMENT
    return L1_15
  end
  L1_15 = db
  L1_15 = L1_15.existsRow
  L2_16 = client_routeTable
  L1_15 = L1_15(L2_16, _UPVALUE1_, A0_14)
  L2_16 = _UPVALUE0_
  L2_16 = L2_16.FALSE
  if L1_15 == L2_16 then
    L1_15 = _UPVALUE0_
    L1_15 = L1_15.INVALID_ARGUMENT
    return L1_15
  end
  L1_15 = db
  L1_15 = L1_15.getNextRowId
  L2_16 = A0_14
  L1_15 = L1_15(L2_16, client_routeTable)
  L2_16 = _UPVALUE0_
  L2_16 = L2_16.NIL
  if L1_15 == L2_16 then
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.NOT_EXIST
    return L2_16
  end
  L2_16 = db
  L2_16 = L2_16.getAttribute
  L2_16 = L2_16(client_routeTable, _UPVALUE1_, L1_15, _UPVALUE2_.routeSubnetmask)
  if L2_16 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_15
  end
  return _UPVALUE0_.SUCCESS, L1_15, L2_16
end
function routeSubnetmaskSet(A0_17, A1_18)
  local L2_19
  L2_19 = _UPVALUE0_
  L2_19 = L2_19.NIL
  if A0_17 ~= L2_19 then
    L2_19 = tonumber
    L2_19 = L2_19(A0_17)
  elseif L2_19 == _UPVALUE0_.NIL then
    L2_19 = _UPVALUE0_
    L2_19 = L2_19.INVALID_ARGUMENT
    return L2_19
  end
  L2_19 = db
  L2_19 = L2_19.existsRow
  L2_19 = L2_19(client_routeTable, _UPVALUE1_, A0_17)
  if L2_19 == _UPVALUE0_.FALSE then
    L2_19 = _UPVALUE0_
    L2_19 = L2_19.INVALID_ARGUMENT
    return L2_19
  end
  L2_19 = nil
  if A1_18 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_19 = _UPVALUE2_.ipAddressCheck("2", A1_18)
  if L2_19 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(client_routeTable, _UPVALUE1_, A0_17, _UPVALUE3_.routeSubnetmask, A1_18) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_17
  end
  return _UPVALUE0_.SUCCESS, A0_17
end
function clientRouteGet()
  local L0_20, L1_21, L2_22, L3_23, L4_24, L5_25, L6_26
  L0_20 = _UPVALUE0_
  L0_20 = L0_20.isfullTunnelEnabled
  L2_22 = L0_20()
  L3_23 = _UPVALUE1_
  if L2_22 ~= L3_23 then
    L3_23 = _UPVALUE2_
    L3_23 = L3_23.SSLVPN_FULLTUNNEL_ENABLED
    return L3_23
  end
  L3_23 = db
  L3_23 = L3_23.getNextRowId
  L4_24 = _UPVALUE3_
  L5_25 = client_routeTable
  L3_23 = L3_23(L4_24, L5_25)
  L4_24 = db
  L4_24 = L4_24.getRow
  L5_25 = client_routeTable
  L6_26 = _UPVALUE4_
  L4_24 = L4_24(L5_25, L6_26, L3_23)
  L5_25 = _UPVALUE5_
  L5_25 = L5_25.NIL
  if L4_24 == L5_25 then
    L5_25 = _UPVALUE5_
    L5_25 = L5_25.FAILURE
    return L5_25
  end
  L5_25, L6_26 = nil, nil
  L5_25 = L4_24[client_routeTable .. "." .. _UPVALUE6_.routeDstNetworkIP]
  L6_26 = L4_24[client_routeTable .. "." .. _UPVALUE6_.routeSubnetmask]
  return _UPVALUE5_.SUCCESS, L3_23, L5_25, L6_26
end
function clientRouteGetNext(A0_27)
  local L1_28, L2_29, L3_30, L4_31
  L1_28 = _UPVALUE0_
  L1_28 = L1_28.NIL
  if A0_27 ~= L1_28 then
    L1_28 = tonumber
    L2_29 = A0_27
    L1_28 = L1_28(L2_29)
    L2_29 = _UPVALUE0_
    L2_29 = L2_29.NIL
  elseif L1_28 == L2_29 then
    L1_28 = _UPVALUE0_
    L1_28 = L1_28.INVALID_ARGUMENT
    return L1_28
  end
  L1_28 = db
  L1_28 = L1_28.existsRow
  L2_29 = client_routeTable
  L3_30 = _UPVALUE1_
  L4_31 = A0_27
  L1_28 = L1_28(L2_29, L3_30, L4_31)
  L2_29 = _UPVALUE0_
  L2_29 = L2_29.FALSE
  if L1_28 == L2_29 then
    L1_28 = _UPVALUE0_
    L1_28 = L1_28.INVALID_ARGUMENT
    return L1_28
  end
  L1_28 = db
  L1_28 = L1_28.getNextRowId
  L2_29 = A0_27
  L3_30 = client_routeTable
  L1_28 = L1_28(L2_29, L3_30)
  L2_29 = _UPVALUE0_
  L2_29 = L2_29.NIL
  if L1_28 == L2_29 then
    L2_29 = _UPVALUE0_
    L2_29 = L2_29.NOT_EXIST
    return L2_29
  end
  L2_29 = db
  L2_29 = L2_29.getRow
  L3_30 = client_routeTable
  L4_31 = _UPVALUE1_
  L2_29 = L2_29(L3_30, L4_31, L1_28)
  L3_30 = _UPVALUE0_
  L3_30 = L3_30.NIL
  if L2_29 == L3_30 then
    L3_30 = _UPVALUE0_
    L3_30 = L3_30.FAILURE
    return L3_30
  end
  L3_30, L4_31 = nil, nil
  L3_30 = L2_29[client_routeTable .. "." .. _UPVALUE2_.routeDstNetworkIP]
  L4_31 = L2_29[client_routeTable .. "." .. _UPVALUE2_.routeSubnetmask]
  return _UPVALUE0_.SUCCESS, L1_28, L3_30, L4_31
end
function clientRouteGetAll()
  local L0_32, L1_33, L2_34, L3_35
  L0_32 = _UPVALUE0_
  L0_32 = L0_32.isfullTunnelEnabled
  L2_34 = L0_32()
  L3_35 = _UPVALUE1_
  if L2_34 ~= L3_35 then
    L3_35 = _UPVALUE2_
    L3_35 = L3_35.SSLVPN_FULLTUNNEL_ENABLED
    return L3_35
  end
  L3_35 = {}
  L3_35 = db.getTable(client_routeTable, false)
  if L3_35 == NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L3_35
end
function clientRouteSet(A0_36, A1_37, A2_38)
  local L3_39, L4_40
  L3_39 = _UPVALUE0_
  L3_39 = L3_39.NIL
  if A0_36 ~= L3_39 then
    L3_39 = tonumber
    L4_40 = A0_36
    L3_39 = L3_39(L4_40)
    L4_40 = _UPVALUE0_
    L4_40 = L4_40.NIL
  elseif L3_39 == L4_40 then
    L3_39 = _UPVALUE0_
    L3_39 = L3_39.INVALID_ARGUMENT
    return L3_39
  end
  L3_39 = db
  L3_39 = L3_39.existsRow
  L4_40 = client_routeTable
  L3_39 = L3_39(L4_40, _UPVALUE1_, A0_36)
  L4_40 = _UPVALUE0_
  L4_40 = L4_40.FALSE
  if L3_39 == L4_40 then
    L3_39 = _UPVALUE0_
    L3_39 = L3_39.INVALID_ARGUMENT
    return L3_39
  end
  L3_39 = nil
  L4_40 = {}
  if A1_37 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L3_39 = _UPVALUE2_.ipAddressCheck("2", A1_37)
  if L3_39 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE3_.SSLVPN_CLINET_DESTINATIONIP_INVALID
  end
  L4_40[client_routeTable .. "." .. _UPVALUE4_.routeDstNetworkIP] = A1_37
  if A2_38 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L3_39 = _UPVALUE2_.ipAddressCheck("2", A2_38)
  if L3_39 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE3_.SSLVPN_CLINET_DESTINATIONSUBNETMASK_INVALID
  end
  L4_40[client_routeTable .. "." .. _UPVALUE4_.routeSubnetmask] = A2_38
  if db.update(client_routeTable, L4_40, A0_36) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_36
  end
  return _UPVALUE0_.SUCCESS, A0_36
end
function clientRouteCreate(A0_41, A1_42)
  local L2_43, L3_44, L4_45, L5_46, L6_47, L7_48, L8_49, L9_50
  L2_43 = db
  L2_43 = L2_43.existsRowWhere
  L3_44 = client_routeTable
  L4_45 = _UPVALUE0_
  L4_45 = L4_45.routeDstNetworkIP
  L5_46 = " ='"
  L6_47 = A0_41
  L7_48 = "' AND "
  L8_49 = _UPVALUE0_
  L8_49 = L8_49.routeSubnetmask
  L9_50 = " ='"
  L4_45 = L4_45 .. L5_46 .. L6_47 .. L7_48 .. L8_49 .. L9_50 .. A1_42 .. "'"
  L2_43 = L2_43(L3_44, L4_45)
  L3_44 = _UPVALUE1_
  L3_44 = L3_44.FALSE
  if L2_43 ~= L3_44 then
    L2_43 = _UPVALUE2_
    L2_43 = L2_43.CLIENT_ROUTE_CONFIG_FAILED
    return L2_43
  end
  L2_43 = nil
  L3_44 = {}
  L4_45 = _UPVALUE3_
  L4_45 = L4_45.isfullTunnelEnabled
  L6_47 = L4_45()
  L7_48 = _UPVALUE4_
  if L6_47 ~= L7_48 then
    L7_48 = _UPVALUE2_
    L7_48 = L7_48.SSLVPN_FULLTUNNEL_ENABLED
    return L7_48
  end
  L7_48 = _UPVALUE1_
  L7_48 = L7_48.NIL
  if A0_41 == L7_48 then
    L7_48 = _UPVALUE1_
    L7_48 = L7_48.INVALID_ARGUMENT
    return L7_48
  end
  L7_48 = _UPVALUE5_
  L7_48 = L7_48.ipAddressCheck
  L8_49 = "2"
  L9_50 = A0_41
  L7_48 = L7_48(L8_49, L9_50)
  L4_45 = L7_48
  L7_48 = _UPVALUE1_
  L7_48 = L7_48.SUCCESS
  if L4_45 ~= L7_48 then
    L7_48 = _UPVALUE2_
    L7_48 = L7_48.SSLVPN_CLINET_DESTINATIONIP_INVALID
    return L7_48
  end
  L7_48 = client_routeTable
  L8_49 = "."
  L9_50 = _UPVALUE0_
  L9_50 = L9_50.routeDstNetworkIP
  L7_48 = L7_48 .. L8_49 .. L9_50
  L3_44[L7_48] = A0_41
  L7_48 = _UPVALUE1_
  L7_48 = L7_48.NIL
  if A1_42 == L7_48 then
    L7_48 = _UPVALUE1_
    L7_48 = L7_48.INVALID_ARGUMENT
    return L7_48
  end
  L7_48 = _UPVALUE5_
  L7_48 = L7_48.ipAddressCheck
  L8_49 = "2"
  L9_50 = A1_42
  L7_48 = L7_48(L8_49, L9_50)
  L4_45 = L7_48
  L7_48 = _UPVALUE1_
  L7_48 = L7_48.SUCCESS
  if L4_45 ~= L7_48 then
    L7_48 = _UPVALUE2_
    L7_48 = L7_48.SSLVPN_CLINET_DESTINATIONSUBNETMASK_INVALID
    return L7_48
  end
  L7_48 = client_routeTable
  L8_49 = "."
  L9_50 = _UPVALUE0_
  L9_50 = L9_50.routeSubnetmask
  L7_48 = L7_48 .. L8_49 .. L9_50
  L3_44[L7_48] = A1_42
  L7_48 = db
  L7_48 = L7_48.getTable
  L8_49 = client_routeTable
  L7_48 = L7_48(L8_49)
  if L7_48 ~= nil then
    L8_49 = #L7_48
    L9_50 = _UPVALUE6_
    if L8_49 >= L9_50 then
      L8_49 = _UPVALUE1_
      L8_49 = L8_49.MAX_LIMIT_REACHED
      return L8_49
    end
  end
  L8_49 = db
  L8_49 = L8_49.insert
  L9_50 = client_routeTable
  L8_49 = L8_49(L9_50, L3_44)
  L9_50 = _UPVALUE1_
  L9_50 = L9_50.NIL
  if L8_49 == L9_50 then
    L9_50 = _UPVALUE1_
    L9_50 = L9_50.FAILURE
    return L9_50
  end
  L9_50 = db
  L9_50 = L9_50.getAttributeWhere
  L9_50 = L9_50(client_routeTable, _UPVALUE0_.routeDstNetworkIP .. " ='" .. A0_41 .. "' AND " .. _UPVALUE0_.routeSubnetmask .. " ='" .. A1_42 .. "'", _UPVALUE7_)
  return _UPVALUE1_.SUCCESS, L9_50
end
function clientRouteDelete(A0_51)
  if A0_51 == _UPVALUE0_.NIL or tonumber(A0_51) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(client_routeTable, _UPVALUE1_, A0_51) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.deleteRow(client_routeTable, _UPVALUE1_, A0_51) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_51
  end
  return _UPVALUE0_.SUCCESS, A0_51
end
function clientRouteDeleteAll()
  local L0_52
  L0_52 = {}
  L0_52 = db.deleteAllRows(client_routeTable)
  if not L0_52 then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
