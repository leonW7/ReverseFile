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
L0_0("teamf1lualib/dhcp_reservedIpLAN")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function lanReservedIpsGetAll()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13
  L0_1 = _UPVALUE0_
  L0_1 = L0_1.IpMacReservationLANGetAll
  L2_3 = L0_1()
  L3_4 = _UPVALUE1_
  L3_4 = L3_4.SUCCESS
  if L0_1 ~= L3_4 then
    return L0_1
  end
  L3_4 = {}
  for L7_8, L8_9 in L4_5(L5_6) do
    L3_4[L7_8] = L9_10
    for L12_13, _FORV_13_ in L9_10(L10_11) do
      L12_13 = string.gsub(L12_13, "DhcpfixedIpAddress", "lanDhcpReservedIps")
      L3_4[L7_8][L12_13] = _FORV_13_
    end
  end
  return L4_5, L5_6, L6_7
end
function lanReservedIpsGet(A0_14)
  local L1_15, L2_16, L3_17, L4_18, L5_19
  L1_15, L4_18, L2_16, L3_17, interfaceType, hostName, ipMacBinding, L5_19 = _UPVALUE0_.IpMacReservationLANGet(A0_14)
  if L1_15 ~= _UPVALUE1_.SUCCESS then
    return L1_15
  end
  return L1_15, L4_18, L2_16, L3_17, interfaceType, hostName, ipMacBinding, L5_19
end
function lanReservedIpsGetNext(A0_20)
  local L1_21, L2_22, L3_23, L4_24, L5_25
  L1_21 = A0_20["lanDhcpReservedIps.cookie"]
  if L1_21 == nil then
    L2_22 = util
    L2_22 = L2_22.appendDebugOut
    L3_23 = "GetNext : Invalid Cookie"
    L2_22(L3_23)
    L2_22 = _UPVALUE0_
    L2_22 = L2_22.BAD_PARAMETER
    return L2_22
  end
  L2_22, L3_23, L4_24, L5_25 = nil, nil, nil, nil
  L2_22, L5_25, L3_23, L4_24 = _UPVALUE1_.IpMacReservationLANGetNext(L1_21)
  if L2_22 ~= _UPVALUE0_.SUCCESS then
    return L2_22
  end
  return L2_22, L5_25, L3_23, L4_24
end
function lanReservedIpsSet(A0_26)
  local L1_27, L2_28, L3_29, L4_30, L5_31, L6_32, L7_33, L8_34
  L1_27 = ACCESS_LEVEL
  if L1_27 ~= 0 then
    L1_27 = util
    L1_27 = L1_27.appendDebugOut
    L2_28 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_27(L2_28)
    L1_27 = _UPVALUE0_
    L1_27 = L1_27.UNAUTHORIZED
    return L1_27
  end
  L1_27 = A0_26["lanDhcpReservedIps.cookie"]
  L2_28 = A0_26["lanDhcpReservedIps.macAddress"]
  L3_29 = A0_26["lanDhcpReservedIps.ipAddress"]
  L4_30 = A0_26["lanDhcpReservedIps.hostName"]
  L5_31 = A0_26["lanDhcpReservedIps.ipMacBinding"]
  L6_32 = A0_26["lanDhcpReservedIps.logStatus"]
  if L1_27 == nil then
    L7_33 = util
    L7_33 = L7_33.appendDebugOut
    L8_34 = "Set : Invalid Cookie"
    L7_33(L8_34)
    L7_33 = _UPVALUE0_
    L7_33 = L7_33.BAD_PARAMETER
    return L7_33
  end
  if L2_28 == nil or L3_29 == nil or L4_30 == nil or L5_31 == nil or L6_32 == nil then
    L7_33 = util
    L7_33 = L7_33.appendDebugOut
    L8_34 = "GetNext : Invalid Cookie"
    L7_33(L8_34)
    L7_33 = _UPVALUE0_
    L7_33 = L7_33.BAD_PARAMETER
    return L7_33
  end
  L7_33, L8_34 = nil, nil
  _UPVALUE1_.start()
  L7_33, L8_34 = _UPVALUE2_.IpMacReservationLANSet(L1_27, L2_28, L3_29, L4_30, L5_31, L6_32)
  if L7_33 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L7_33)
    _UPVALUE1_.abort()
    return L7_33, L1_27
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L8_34
end
function lanReservedIpsDelete(A0_35)
  local L1_36, L2_37
  L1_36 = ACCESS_LEVEL
  if L1_36 ~= 0 then
    L1_36 = util
    L1_36 = L1_36.appendDebugOut
    L2_37 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_36(L2_37)
    L1_36 = _UPVALUE0_
    L1_36 = L1_36.UNAUTHORIZED
    return L1_36
  end
  L1_36 = A0_35["lanDhcpReservedIps.cookie"]
  if L1_36 == nil then
    L2_37 = util
    L2_37 = L2_37.appendDebugOut
    L2_37("Delete : Invalid Cookie")
    L2_37 = _UPVALUE0_
    L2_37 = L2_37.BAD_PARAMETER
    return L2_37
  end
  L2_37 = nil
  _UPVALUE1_.start()
  L2_37, cookie = _UPVALUE2_.IpMacReservationLANDelete(L1_36)
  if L2_37 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L2_37)
    _UPVALUE1_.abort()
    return L2_37, L1_36
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function lanReservedIpsDefaultGet()
  local L0_38, L1_39, L3_40, L4_41, L5_42
  L3_40 = _UPVALUE0_
  L3_40 = L3_40.SUCCESS
  L4_41 = 0
  L5_42 = L0_38
  return L3_40, L4_41, L5_42, L1_39
end
function lanReservedIpsCreate(A0_43)
  local L1_44, L2_45, L3_46, L4_47, L5_48, L6_49, L7_50
  L1_44 = ACCESS_LEVEL
  if L1_44 ~= 0 then
    L1_44 = util
    L1_44 = L1_44.appendDebugOut
    L2_45 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_44(L2_45)
    L1_44 = _UPVALUE0_
    L1_44 = L1_44.UNAUTHORIZED
    return L1_44
  end
  L1_44 = A0_43["lanDhcpReservedIps.macAddress"]
  L2_45 = A0_43["lanDhcpReservedIps.ipAddress"]
  L3_46 = A0_43["lanDhcpReservedIps.hostName"]
  L4_47 = A0_43["lanDhcpReservedIps.ipMacBinding"]
  L5_48 = A0_43["lanDhcpReservedIps.logStatus"]
  if L1_44 == nil or L2_45 == nil or L3_46 == nil or L4_47 == nil or L5_48 == nil then
    L6_49 = util
    L6_49 = L6_49.appendDebugOut
    L7_50 = "GetNext : Invalid Cookie"
    L6_49(L7_50)
    L6_49 = _UPVALUE0_
    L6_49 = L6_49.BAD_PARAMETER
    return L6_49
  end
  L6_49, L7_50 = nil, nil
  _UPVALUE1_.start()
  L6_49, L7_50 = _UPVALUE2_.IpMacReservationLANCreate(L1_44, L2_45, "LAN", L3_46, L4_47, L5_48)
  if L6_49 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L6_49)
    _UPVALUE1_.abort()
    return L6_49, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L7_50
end
function lanReservedIpsDeleteAll()
  local L0_51
  L0_51 = ACCESS_LEVEL
  if L0_51 ~= 0 then
    L0_51 = util
    L0_51 = L0_51.appendDebugOut
    L0_51("Detected Unauthorized access for page DUMMY PAGE")
    L0_51 = _UPVALUE0_
    L0_51 = L0_51.UNAUTHORIZED
    return L0_51
  end
  L0_51 = nil
  _UPVALUE1_.start()
  L0_51, cookie = _UPVALUE2_.IpMacReservationLANDeleteAll()
  if L0_51 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L0_51)
    _UPVALUE1_.abort()
    return L0_51, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
