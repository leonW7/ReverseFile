local L0_0
L0_0 = module
L0_0("com.teamf1.core.dhcp.leasedclientsIPv6", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/dhcp_returnCodes")
L0_0 = require
L0_0("teamf1lualib/vlan_validation")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.dhcp_returnCodes")
leasedclientsIPv6Table = "DhcpLeasedClients"
attribute = {}
attribute.macAddress = "MacAddr"
attribute.ipAddress = "IPAddr"
attribute.hostName = "hostName"
attribute.interfaceName = "LogicalIfName"
attribute.addressFamily = "addressFamily"
IPv6_NAME = "IPv6"
LAN_NAME = "LAN"
ROWID = "_ROWID_"
LOCALHOST = "Localhost"
IPv4_ADDRESS_FAMILY = "2"
IPv6_ADDRESS_FAMILY = "10"
where = attribute.interfaceName .. "= '" .. LAN_NAME .. "' and " .. attribute.addressFamily .. "='" .. IPv6_ADDRESS_FAMILY .. "'"
whereLeased = attribute.addressFamily .. "='" .. IPv6_ADDRESS_FAMILY .. "'"
function macAddressGet()
  local L0_1, L1_2
  L0_1 = firstCookieGet
  L1_2 = leasedclientsIPv6Table
  L0_1 = L0_1(L1_2, where)
  L1_2 = NIL
  if L0_1 == L1_2 then
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.INVALID_COOKIE
    return L1_2
  end
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(leasedclientsIPv6Table, ROWID, L0_1, attribute.macAddress)
  if L1_2 == NIL then
    return _UPVALUE0_.FAILURE, L0_1
  end
  return _UPVALUE0_.SUCCESS, L0_1, L1_2
end
function macAddressGetNext(A0_3)
  local L1_4, L2_5, L3_6
  L1_4 = nextCookieGet
  L2_5 = A0_3
  L3_6 = leasedclientsIPv6Table
  L2_5 = L1_4(L2_5, L3_6, where)
  L3_6 = FALSE
  if L1_4 == L3_6 then
    L3_6 = NIL
    if L2_5 == L3_6 then
      L3_6 = _UPVALUE0_
      L3_6 = L3_6.NEXT_ROWID_INVALID
      return L3_6
    else
      L3_6 = _UPVALUE0_
      L3_6 = L3_6.INVALID_COOKIE
      return L3_6
    end
  end
  L3_6 = db
  L3_6 = L3_6.getAttribute
  L3_6 = L3_6(leasedclientsIPv6Table, ROWID, L1_4, attribute.macAddress)
  if L3_6 == NIL then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L3_6
end
function macAddressSet(A0_7, A1_8)
  return _UPVALUE0_.NOT_SUPPORTED
end
function macAddressDelete(A0_9, A1_10)
  return _UPVALUE0_.NOT_SUPPORTED
end
function ipAddressGet()
  local L0_11, L1_12
  L0_11 = firstCookieGet
  L1_12 = leasedclientsIPv6Table
  L0_11 = L0_11(L1_12, where)
  L1_12 = NIL
  if L0_11 == L1_12 then
    L1_12 = _UPVALUE0_
    L1_12 = L1_12.INVALID_COOKIE
    return L1_12
  end
  L1_12 = db
  L1_12 = L1_12.getAttribute
  L1_12 = L1_12(leasedclientsIPv6Table, ROWID, L0_11, attribute.ipAddress)
  if L1_12 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_11, L1_12
end
function ipAddressGetNext(A0_13)
  local L1_14, L2_15, L3_16
  L1_14 = nextCookieGet
  L2_15 = A0_13
  L3_16 = leasedclientsIPv6Table
  L2_15 = L1_14(L2_15, L3_16, where)
  L3_16 = FALSE
  if L1_14 == L3_16 then
    L3_16 = NIL
    if L2_15 == L3_16 then
      L3_16 = _UPVALUE0_
      L3_16 = L3_16.NEXT_ROWID_INVALID
      return L3_16
    else
      L3_16 = _UPVALUE0_
      L3_16 = L3_16.INVALID_COOKIE
      return L3_16
    end
  end
  L3_16 = db
  L3_16 = L3_16.getAttribute
  L3_16 = L3_16(leasedclientsIPv6Table, ROWID, L1_14, attribute.ipAddress)
  if L3_16 == NIL then
    return _UPVALUE0_.FAILURE, L1_14
  end
  return _UPVALUE0_.SUCCESS, L1_14, L3_16
end
function ipAddressSet(A0_17, A1_18)
  return _UPVALUE0_.NOT_SUPPORTED
end
function hostNameGet()
  local L1_19
  L1_19 = _UPVALUE0_
  L1_19 = L1_19.NOT_SUPPORTED
  return L1_19
end
function hostNameGetNext(A0_20)
  return _UPVALUE0_.NOT_SUPPORTED
end
function hostNameSet(A0_21, A1_22)
  return _UPVALUE0_.NOT_SUPPORTED
end
function clientIPv6Get()
  local L0_23
  L0_23 = print
  L0_23(leasedclientsIPv6Table)
  L0_23 = firstCookieGet
  L0_23 = L0_23(leasedclientsIPv6Table, where)
  if L0_23 == NIL then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if db.getRow(leasedclientsIPv6Table, ROWID, L0_23) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_23, db.getRow(leasedclientsIPv6Table, ROWID, L0_23)[leasedclientsIPv6Table .. "." .. attribute.macAddress], db.getRow(leasedclientsIPv6Table, ROWID, L0_23)[leasedclientsIPv6Table .. "." .. attribute.ipAddress], LOCALHOST
end
function clientIPv6GetNext(A0_24)
  local L1_25
  L1_25 = nextCookieGet
  L1_25 = L1_25(A0_24, leasedclientsIPv6Table, where)
  if L1_25 == FALSE then
    if L1_25(A0_24, leasedclientsIPv6Table, where) == NIL then
      return _UPVALUE0_.NEXT_ROWID_INVALID
    else
      return _UPVALUE0_.INVALID_COOKIE
    end
  end
  if db.getRow(leasedclientsIPv6Table, ROWID, L1_25) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_24, db.getRow(leasedclientsIPv6Table, ROWID, L1_25)[leasedclientsIPv6Table .. "." .. attribute.macAddress], db.getRow(leasedclientsIPv6Table, ROWID, L1_25)[leasedclientsIPv6Table .. "." .. attribute.ipAddress], LOCALHOST
end
function clientIPv6GetAll()
  local L0_26
  L0_26 = db
  L0_26 = L0_26.getRowsWhere
  L0_26 = L0_26(leasedclientsIPv6Table, whereLeased)
  if L0_26 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_26
end
function clientIPv6Set(A0_27, A1_28, A2_29, A3_30)
  return _UPVALUE0_.NOT_SUPPORTED
end
function clientIPv6Create(A0_31, A1_32, A2_33)
  return _UPVALUE0_.NOT_SUPPORTED
end
function clientIPv6Delete(A0_34)
  return _UPVALUE0_.NOT_SUPPORTED
end
