local L0_0
L0_0 = module
L0_0("com.teamf1.core.lan.staticDns", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/vlan_validation")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/nimf_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
staticdnsTable = "DnsStaticHostsMapping"
;({}).hostName = "HostName"
;({}).ipAddress = "IpAddress"
ROWID = "_ROWID_"
MIN_STRING_LENGTH = 0
MAX_STRING_LENGTH = 64
IPV4_ADDRESS_FAMILY = "2"
function hostNameGet()
  local L0_1, L1_2
  L0_1 = firstCookieGet
  L1_2 = staticdnsTable
  L0_1 = L0_1(L1_2)
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(staticdnsTable, ROWID, L0_1, _UPVALUE0_.hostName)
  if L1_2 == NIL then
    return _UPVALUE1_.FAILURE, L0_1
  end
  return _UPVALUE1_.SUCCESS, L0_1, L1_2
end
function hostNameGetNext(A0_3)
  local L1_4, L2_5, L3_6
  L1_4 = nextCookieGet
  L2_5 = A0_3
  L3_6 = staticdnsTable
  L2_5 = L1_4(L2_5, L3_6)
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
  L3_6 = L3_6(staticdnsTable, ROWID, L1_4, _UPVALUE1_.hostName)
  if L3_6 == NIL then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L3_6
end
function hostNameSet(A0_7, A1_8)
  local L2_9
  if checkCookieExists(A0_7, staticdnsTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if A1_8 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_9 = _UPVALUE1_.stringLengthCheck(MIN_STRING_LENGTH, MAX_STRING_LENGTH, A1_8)
  if L2_9 == _UPVALUE0_.ERROR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(staticdnsTable, ROWID, A0_7, _UPVALUE2_.hostName, A1_8) == NIL then
    return _UPVALUE0_.FAILURE, A0_7
  end
  return _UPVALUE0_.SUCCESS, A0_7
end
function hostNameDelete(A0_10)
  if checkCookieExists(A0_10, staticdnsTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if db.deleteRow(staticdnsTable, ROWID, A0_10) == NIL then
    return _UPVALUE0_.FAILURE, A0_10
  end
  return _UPVALUE0_.SUCCESS, A0_10
end
function ipAddressGet()
  local L0_11, L1_12
  L0_11 = firstCookieGet
  L1_12 = staticdnsTable
  L0_11 = L0_11(L1_12)
  L1_12 = db
  L1_12 = L1_12.getAttribute
  L1_12 = L1_12(staticdnsTable, ROWID, L0_11, _UPVALUE0_.ipAddress)
  if L1_12 == NIL then
    return _UPVALUE1_.FAILURE, L0_11
  end
  return _UPVALUE1_.SUCCESS, L0_11, L1_12
end
function ipAddressGetNext(A0_13)
  local L1_14, L2_15, L3_16
  L1_14 = nextCookieGet
  L2_15 = A0_13
  L3_16 = staticdnsTable
  L2_15 = L1_14(L2_15, L3_16)
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
  L3_16 = L3_16(staticdnsTable, ROWID, L1_14, _UPVALUE1_.ipAddress)
  if L3_16 == NIL then
    return _UPVALUE0_.FAILURE, L1_14
  end
  return _UPVALUE0_.SUCCESS, L1_14, L3_16
end
function ipAddressSet(A0_17, A1_18)
  local L2_19
  if checkCookieExists(A0_17, staticdnsTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if A1_18 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_19 = _UPVALUE1_.ipAddressCheck(IPV4_ADDRESS_FAMILY, A1_18)
  if L2_19 == _UPVALUE0_.ERROR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(staticdnsTable, ROWID, A0_17, _UPVALUE2_.ipAddress, A1_18) == NIL then
    return _UPVALUE0_.FAILURE, A0_17
  end
  return _UPVALUE0_.SUCCESS, A0_17
end
function dnsEntryGet()
  local L0_20
  L0_20 = firstCookieGet
  L0_20 = L0_20(staticdnsTable)
  if db.getRow(staticdnsTable, ROWID, L0_20) == NIL then
    return _UPVALUE0_.FAILURE, L0_20
  end
  return _UPVALUE0_.SUCCESS, L0_20, db.getRow(staticdnsTable, ROWID, L0_20)[staticdnsTable .. "." .. _UPVALUE1_.hostName], db.getRow(staticdnsTable, ROWID, L0_20)[staticdnsTable .. "." .. _UPVALUE1_.ipAddress]
end
function dnsEntryGetAll()
  local L0_21
  L0_21 = db
  L0_21 = L0_21.getTable
  L0_21 = L0_21(staticdnsTable)
  if L0_21 == NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, L0_21
end
function dnsEntryGetNext(A0_22)
  local L1_23
  L1_23 = nextCookieGet
  L1_23 = L1_23(A0_22, staticdnsTable)
  if L1_23 == FALSE then
    if L1_23(A0_22, staticdnsTable) == NIL then
      return _UPVALUE0_.NEXT_ROWID_INVALID
    else
      return _UPVALUE0_.INVALID_COOKIE
    end
  end
  if db.getRow(staticdnsTable, ROWID, L1_23) == NIL then
    return _UPVALUE0_.FAILURE, L1_23
  end
  return _UPVALUE0_.SUCCESS, L1_23, db.getRow(staticdnsTable, ROWID, L1_23)[staticdnsTable .. "." .. _UPVALUE1_.hostName], db.getRow(staticdnsTable, ROWID, L1_23)[staticdnsTable .. "." .. _UPVALUE1_.ipAddress]
end
function dnsEntrySet(A0_24)
  local L1_25, L2_26, L3_27, L4_28, L5_29
  if A0_24 ~= nil then
    dnsTable = L1_25
    for L4_28, L5_29 in L1_25(L2_26) do
      L5_29[staticdnsTable .. "." .. _UPVALUE0_.hostName] = A0_24["lanSettingsDns.HostName" .. L5_29[staticdnsTable .. "." .. ROWID]]
      L5_29[staticdnsTable .. "." .. _UPVALUE0_.ipAddress] = A0_24["lanSettingsDns.IpAddress" .. L5_29[staticdnsTable .. "." .. ROWID]]
      status = db.update(staticdnsTable, L5_29, L5_29[staticdnsTable .. "." .. ROWID])
    end
  end
  if L1_25 == L2_26 then
    return L1_25, L2_26
  end
  return L1_25, L2_26
end
function dnsEntryCreate(A0_30, A1_31)
  local L2_32, L3_33, L4_34, L5_35
  L3_33 = NIL
  if A0_30 == L3_33 then
    L3_33 = _UPVALUE0_
    L3_33 = L3_33.COMP_NIMF_LAN_STATICDNS_HOSTNAME_NIL
    return L3_33
  end
  L3_33 = _UPVALUE1_
  L3_33 = L3_33.stringLengthCheck
  L4_34 = MIN_STRING_LENGTH
  L5_35 = MAX_STRING_LENGTH
  L3_33 = L3_33(L4_34, L5_35, A0_30)
  L2_32 = L3_33
  L3_33 = _UPVALUE2_
  L3_33 = L3_33.ERROR
  if L2_32 == L3_33 then
    L3_33 = _UPVALUE0_
    L3_33 = L3_33.COMP_NIMF_LAN_STATICDNS_HOSTNAME_INVALID
    return L3_33
  end
  L3_33 = NIL
  if A1_31 == L3_33 then
    L3_33 = _UPVALUE0_
    L3_33 = L3_33.COMP_NIMF_LAN_STATICDNS_IPADDRESS_NIL
    return L3_33
  end
  L3_33 = _UPVALUE1_
  L3_33 = L3_33.ipAddressCheck
  L4_34 = IPV4_ADDRESS_FAMILY
  L5_35 = A1_31
  L3_33 = L3_33(L4_34, L5_35)
  L2_32 = L3_33
  L3_33 = _UPVALUE2_
  L3_33 = L3_33.ERROR
  if L2_32 == L3_33 then
    L3_33 = _UPVALUE0_
    L3_33 = L3_33.COMP_NIMF_LAN_STATICDNS_IPADDRESS_INVALID
    return L3_33
  end
  L3_33 = {}
  L4_34 = staticdnsTable
  L5_35 = "."
  L4_34 = L4_34 .. L5_35 .. _UPVALUE3_.hostName
  L3_33[L4_34] = A0_30
  L4_34 = staticdnsTable
  L5_35 = "."
  L4_34 = L4_34 .. L5_35 .. _UPVALUE3_.ipAddress
  L3_33[L4_34] = A1_31
  L4_34 = db
  L4_34 = L4_34.insert
  L5_35 = staticdnsTable
  L4_34 = L4_34(L5_35, L3_33)
  L5_35 = db
  L5_35 = L5_35.getAttribute
  L5_35 = L5_35(staticdnsTable, _UPVALUE3_.ipAddress, A1_31, ROWID)
  if L4_34 == NIL then
    return _UPVALUE2_.FAILURE, L5_35
  end
  return _UPVALUE2_.SUCCESS, L5_35
end
function dnsEntryDelete(A0_36)
  if checkCookieExists(A0_36, staticdnsTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if db.deleteRow(staticdnsTable, ROWID, A0_36) == NIL then
    return _UPVALUE0_.FAILURE, A0_36
  end
  return _UPVALUE0_.SUCCESS, A0_36
end
