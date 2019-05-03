local L0_0
L0_0 = module
L0_0("com.teamf1.core.dhcp.leasedclientsLAN", package.seeall)
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
leasedclientsLANTable = "DhcpLeasedClients"
attribute = {}
attribute.macAddress = "MacAddr"
attribute.ipAddress = "IPAddr"
attribute.hostName = "hostName"
attribute.interfaceName = "LogicalIfName"
attribute.addressFamily = "addressFamily"
LAN_NAME = "LAN"
DMZ_NAME = "DMZ"
ROWID = "_ROWID_"
LOCALHOST = "Localhost"
IPv4_ADDRESS_FAMILY = "2"
IPv6_ADDRESS_FAMILY = "10"
where = attribute.interfaceName .. "!= '" .. DMZ_NAME .. "' and " .. attribute.addressFamily .. "='" .. IPv4_ADDRESS_FAMILY .. "'"
function macAddressGet()
  local L0_1, L1_2
  L0_1 = firstCookieGet
  L1_2 = leasedclientsLANTable
  L0_1 = L0_1(L1_2, where)
  L1_2 = NIL
  if L0_1 == L1_2 then
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.INVALID_COOKIE
    return L1_2
  end
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(leasedclientsLANTable, ROWID, L0_1, attribute.macAddress)
  if L1_2 == NIL then
    return _UPVALUE0_.FAILURE, L0_1
  end
  return _UPVALUE0_.SUCCESS, L0_1, L1_2
end
function macAddressGetNext(A0_3)
  local L1_4, L2_5, L3_6
  L1_4 = nextCookieGet
  L2_5 = A0_3
  L3_6 = leasedclientsLANTable
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
  L3_6 = L3_6(leasedclientsLANTable, ROWID, L1_4, attribute.macAddress)
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
  L1_12 = leasedclientsLANTable
  L0_11 = L0_11(L1_12, where)
  L1_12 = NIL
  if L0_11 == L1_12 then
    L1_12 = _UPVALUE0_
    L1_12 = L1_12.INVALID_COOKIE
    return L1_12
  end
  L1_12 = db
  L1_12 = L1_12.getAttribute
  L1_12 = L1_12(leasedclientsLANTable, ROWID, L0_11, attribute.ipAddress)
  if L1_12 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_11, L1_12
end
function ipAddressGetNext(A0_13)
  local L1_14, L2_15, L3_16
  L1_14 = nextCookieGet
  L2_15 = A0_13
  L3_16 = leasedclientsLANTable
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
  L3_16 = L3_16(leasedclientsLANTable, ROWID, L1_14, attribute.ipAddress)
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
function clientLANGetCur(A0_23)
  if db.getRow(leasedclientsLANTable, ROWID, A0_23) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_23, db.getRow(leasedclientsLANTable, ROWID, A0_23)[leasedclientsLANTable .. "." .. attribute.macAddress], db.getRow(leasedclientsLANTable, ROWID, A0_23)[leasedclientsLANTable .. "." .. attribute.ipAddress], LOCALHOST
end
function clientLANGet()
  local L0_24
  L0_24 = firstCookieGet
  L0_24 = L0_24(leasedclientsLANTable, where)
  if L0_24 == NIL then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if db.getRow(leasedclientsLANTable, ROWID, L0_24) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_24, db.getRow(leasedclientsLANTable, ROWID, L0_24)[leasedclientsLANTable .. "." .. attribute.macAddress], db.getRow(leasedclientsLANTable, ROWID, L0_24)[leasedclientsLANTable .. "." .. attribute.ipAddress], LOCALHOST
end
function clientLANGetNext(A0_25)
  local L1_26
  L1_26 = nextCookieGet
  L1_26 = L1_26(A0_25, leasedclientsLANTable, where)
  if L1_26 == FALSE then
    if L1_26(A0_25, leasedclientsLANTable, where) == NIL then
      return _UPVALUE0_.NEXT_ROWID_INVALID
    else
      return _UPVALUE0_.INVALID_COOKIE
    end
  end
  if db.getRow(leasedclientsLANTable, ROWID, L1_26) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_25, db.getRow(leasedclientsLANTable, ROWID, L1_26)[leasedclientsLANTable .. "." .. attribute.macAddress], db.getRow(leasedclientsLANTable, ROWID, L1_26)[leasedclientsLANTable .. "." .. attribute.ipAddress], LOCALHOST
end
function clientLANGetAll()
  local L0_27
  L0_27 = db
  L0_27 = L0_27.getRowsWhere
  L0_27 = L0_27(leasedclientsLANTable, where)
  if L0_27 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_27
end
function clientLANSet(A0_28, A1_29, A2_30, A3_31)
  return _UPVALUE0_.NOT_SUPPORTED
end
function clientLANCreate(A0_32, A1_33, A2_34)
  return _UPVALUE0_.NOT_SUPPORTED
end
function clientLANDelete(A0_35)
  return _UPVALUE0_.NOT_SUPPORTED
end
function clientLANDeleteAll()
  if db.deleteRowWhere(leasedclientsLANTable, where) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
