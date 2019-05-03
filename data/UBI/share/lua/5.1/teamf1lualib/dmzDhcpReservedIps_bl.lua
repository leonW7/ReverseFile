local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/dhcp_reservedIpDMZ")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function dmzReservedIpsGetAll()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12
  L0_1 = _UPVALUE0_
  L0_1 = L0_1.IpMacReservationDMZGetAll
  L1_2 = L0_1()
  L2_3 = _UPVALUE1_
  L2_3 = L2_3.SUCCESS
  if L0_1 ~= L2_3 then
    return L0_1
  end
  L2_3 = {}
  for L6_7, L7_8 in L3_4(L4_5) do
    L2_3[L6_7] = L8_9
    for L11_12, _FORV_12_ in L8_9(L9_10) do
      L11_12 = string.gsub(L11_12, "DhcpfixedIpAddress", "dmzDhcpReservedIps")
      L2_3[L6_7][L11_12] = _FORV_12_
    end
  end
  return L3_4, L4_5
end
function dmzReservedIpsGet(A0_13)
  local L1_14, L2_15, L3_16, L4_17
  L1_14, L4_17, L2_15, L3_16 = _UPVALUE0_.IpMacReservationDMZGet(A0_13)
  if L1_14 ~= _UPVALUE1_.SUCCESS then
    return L1_14
  end
  return L1_14, L4_17, L2_15, L3_16
end
function dmzReservedIpsGetNext(A0_18)
  local L1_19, L2_20, L3_21, L4_22, L5_23
  L1_19 = A0_18["dmzDhcpReservedIps.cookie"]
  if L1_19 == nil then
    L2_20 = util
    L2_20 = L2_20.appendDebugOut
    L3_21 = "GetNext : Invalid Cookie"
    L2_20(L3_21)
    L2_20 = _UPVALUE0_
    L2_20 = L2_20.BAD_PARAMETER
    return L2_20
  end
  L2_20, L3_21, L4_22, L5_23 = nil, nil, nil, nil
  L2_20, L5_23, L3_21, L4_22 = _UPVALUE1_.IpMacReservationDMZGetNext(L1_19)
  if L2_20 ~= _UPVALUE0_.SUCCESS then
    return L2_20
  end
  return L2_20, L5_23, L3_21, L4_22
end
function dmzReservedIpsSet(A0_24)
  local L1_25, L2_26, L3_27, L4_28, L5_29
  L1_25 = ACCESS_LEVEL
  if L1_25 ~= 0 then
    L1_25 = util
    L1_25 = L1_25.appendDebugOut
    L2_26 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_25(L2_26)
    L1_25 = _UPVALUE0_
    L1_25 = L1_25.UNAUTHORIZED
    return L1_25
  end
  L1_25 = A0_24["dmzDhcpReservedIps.cookie"]
  L2_26 = A0_24["dmzDhcpReservedIps.macAddress"]
  L3_27 = A0_24["dmzDhcpReservedIps.ipAddress"]
  if L1_25 == nil then
    L4_28 = util
    L4_28 = L4_28.appendDebugOut
    L5_29 = "Set : Invalid Cookie"
    L4_28(L5_29)
    L4_28 = _UPVALUE0_
    L4_28 = L4_28.BAD_PARAMETER
    return L4_28
  end
  if L2_26 == nil or L3_27 == nil then
    L4_28 = util
    L4_28 = L4_28.appendDebugOut
    L5_29 = "GetNext : Invalid Cookie"
    L4_28(L5_29)
    L4_28 = _UPVALUE0_
    L4_28 = L4_28.BAD_PARAMETER
    return L4_28
  end
  L4_28, L5_29 = nil, nil
  _UPVALUE1_.start()
  L4_28, L5_29 = _UPVALUE2_.IpMacReservationDMZSet(L1_25, L2_26, L3_27)
  if L4_28 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L4_28)
    _UPVALUE1_.abort()
    return L4_28, L1_25
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L5_29
end
function dmzReservedIpsDelete(A0_30)
  local L1_31, L2_32
  L1_31 = ACCESS_LEVEL
  if L1_31 ~= 0 then
    L1_31 = util
    L1_31 = L1_31.appendDebugOut
    L2_32 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_31(L2_32)
    L1_31 = _UPVALUE0_
    L1_31 = L1_31.UNAUTHORIZED
    return L1_31
  end
  L1_31 = A0_30["dmzDhcpReservedIps.cookie"]
  if L1_31 == nil then
    L2_32 = util
    L2_32 = L2_32.appendDebugOut
    L2_32("Delete : Invalid Cookie")
    L2_32 = _UPVALUE0_
    L2_32 = L2_32.BAD_PARAMETER
    return L2_32
  end
  L2_32 = nil
  _UPVALUE1_.start()
  L2_32, cookie = _UPVALUE2_.IpMacReservationDMZDelete(L1_31)
  if L2_32 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L2_32)
    _UPVALUE1_.abort()
    return L2_32, L1_31
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function dmzReservedIpsDefaultGet()
  local L0_33, L1_34, L3_35, L4_36, L5_37
  L3_35 = _UPVALUE0_
  L3_35 = L3_35.SUCCESS
  L4_36 = 0
  L5_37 = L0_33
  return L3_35, L4_36, L5_37, L1_34
end
function dmzReservedIpsCreate(A0_38)
  local L1_39, L2_40, L3_41, L4_42
  L1_39 = ACCESS_LEVEL
  if L1_39 ~= 0 then
    L1_39 = util
    L1_39 = L1_39.appendDebugOut
    L2_40 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_39(L2_40)
    L1_39 = _UPVALUE0_
    L1_39 = L1_39.UNAUTHORIZED
    return L1_39
  end
  L1_39 = A0_38["dmzDhcpReservedIps.macAddress"]
  L2_40 = A0_38["dmzDhcpReservedIps.ipAddress"]
  if L1_39 == nil or L2_40 == nil then
    L3_41 = util
    L3_41 = L3_41.appendDebugOut
    L4_42 = "GetNext : Invalid Cookie"
    L3_41(L4_42)
    L3_41 = _UPVALUE0_
    L3_41 = L3_41.BAD_PARAMETER
    return L3_41
  end
  L3_41, L4_42 = nil, nil
  _UPVALUE1_.start()
  L3_41, L4_42 = _UPVALUE2_.IpMacReservationDMZCreate(L1_39, L2_40, "DMZ")
  if L3_41 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L3_41)
    _UPVALUE1_.abort()
    return L3_41, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L4_42
end
function dmzReservedIpsDeleteAll()
  local L0_43
  L0_43 = ACCESS_LEVEL
  if L0_43 ~= 0 then
    L0_43 = util
    L0_43 = L0_43.appendDebugOut
    L0_43("Detected Unauthorized access for page DUMMY PAGE")
    L0_43 = _UPVALUE0_
    L0_43 = L0_43.UNAUTHORIZED
    return L0_43
  end
  L0_43 = nil
  _UPVALUE1_.start()
  L0_43, cookie = _UPVALUE2_.IpMacReservationDMZDeleteAll()
  if L0_43 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L0_43)
    _UPVALUE1_.abort()
    return L0_43, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
