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
L0_0("teamf1lualib/ipsec_dhcpserver")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function dhcpRangeGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
  L5_6 = _UPVALUE0_
  L5_6 = L5_6.dhcpserverConfigGet
  L4_5, L1_2, L2_3, L3_4, L5_6 = nil, nil, nil, nil, L5_6()
  L0_1 = L5_6
  L5_6 = _UPVALUE1_
  L5_6 = L5_6.SUCCESS
  if L0_1 ~= L5_6 then
    return L0_1
  end
  L5_6 = {}
  L5_6["dhcpRange.startIpAddr"] = L1_2
  L5_6["dhcpRange.endIpAddr"] = L2_3
  L5_6["dhcpRange.subnetMask"] = L3_4
  return L0_1, L4_5, L5_6
end
function dhcpRangeGetNext(A0_7)
  return _UPVALUE0_.NOT_SUPPORTED
end
function dhcpRangeSet(A0_8)
  local L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15
  L1_9 = ACCESS_LEVEL
  if L1_9 ~= 0 then
    L1_9 = util
    L1_9 = L1_9.appendDebugOut
    L2_10 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_9(L2_10)
    L1_9 = _UPVALUE0_
    L1_9 = L1_9.UNAUTHORIZED
    return L1_9
  end
  L1_9 = A0_8["dhcpRange.cookie"]
  L2_10 = A0_8["dhcpRange.startIpAddr"]
  L3_11 = A0_8["dhcpRange.endIpAddr"]
  L4_12 = A0_8["dhcpRange.subnetMask"]
  if L1_9 == nil then
    L5_13 = util
    L5_13 = L5_13.appendDebugOut
    L6_14 = "Set : Invalid Cookie"
    L5_13(L6_14)
    L5_13 = _UPVALUE0_
    L5_13 = L5_13.BAD_PARAMETER
    return L5_13
  end
  if L2_10 == nil or L3_11 == nil then
    L5_13 = util
    L5_13 = L5_13.appendDebugOut
    L6_14 = "GetNext : Invalid Cookie"
    L5_13(L6_14)
    L5_13 = _UPVALUE0_
    L5_13 = L5_13.BAD_PARAMETER
    return L5_13
  end
  L5_13 = nil
  L6_14 = _UPVALUE1_
  L6_14 = L6_14.checkWanSubnetRange
  L7_15 = L2_10
  L6_14 = L6_14(L7_15, L4_12)
  L5_13 = L6_14
  L6_14 = _UPVALUE0_
  L6_14 = L6_14.SUCCESS
  if L5_13 == L6_14 then
    L6_14 = UNIT_NAME
    if L6_14 ~= "DSR-250N" then
      L6_14 = UNIT_NAME
      if L6_14 ~= "DSR-250" then
        L6_14 = UNIT_NAME
        if L6_14 ~= "DSR-150N" then
          L6_14 = UNIT_NAME
          if L6_14 ~= "DSR-150" then
            L6_14 = _UPVALUE0_
            L6_14 = L6_14.WAN_ALREADY_CONFIGURED
            return L6_14
          end
        end
      end
    else
      L6_14 = _UPVALUE0_
      L6_14 = L6_14.WAN_ECONA_ALREADY_CONFIGURED
      return L6_14
    end
  end
  L6_14 = HIGH_SEC
  if L6_14 == "HIGH" then
    L6_14 = _UPVALUE1_
    L6_14 = L6_14.checkSslClientRange
    L7_15 = L2_10
    L6_14 = L6_14(L7_15, L4_12)
    L5_13 = L6_14
    L6_14 = _UPVALUE0_
    L6_14 = L6_14.SUCCESS
    if L5_13 == L6_14 then
      L6_14 = _UPVALUE0_
      L6_14 = L6_14.SSLVPN_ALREADY_CONFIGURED
      return L6_14
    end
  end
  L6_14 = _UPVALUE1_
  L6_14 = L6_14.checkLanVlanSubnetRange
  L7_15 = L2_10
  L6_14 = L6_14(L7_15, L4_12)
  L5_13 = L6_14
  L6_14 = _UPVALUE0_
  L6_14 = L6_14.SUCCESS
  if L5_13 == L6_14 then
    L6_14 = _UPVALUE0_
    L6_14 = L6_14.LAN_VLAN_ALREADY_CONFIGURED
    return L6_14
  end
  L6_14 = _UPVALUE1_
  L6_14 = L6_14.checkDmzSubnetRange
  L7_15 = L2_10
  L6_14 = L6_14(L7_15, L4_12)
  L5_13 = L6_14
  L6_14 = _UPVALUE0_
  L6_14 = L6_14.SUCCESS
  if L5_13 == L6_14 then
    L6_14 = _UPVALUE0_
    L6_14 = L6_14.DMZ_ALREADY_CONFIGURED
    return L6_14
  end
  L6_14 = _UPVALUE1_
  L6_14 = L6_14.checkOpenVpnSubnetRange
  L7_15 = L2_10
  L6_14 = L6_14(L7_15, L4_12)
  returnCode = L6_14
  L6_14 = returnCode
  L7_15 = _UPVALUE0_
  L7_15 = L7_15.SUCCESS
  if L6_14 == L7_15 then
    L6_14 = util
    L6_14 = L6_14.appendDebugOut
    L7_15 = "Set : Invalid ipaddress"
    L6_14(L7_15)
    L6_14 = _UPVALUE0_
    L6_14 = L6_14.IP_IN_OPENVPN_NETWORK
    return L6_14
  end
  L6_14 = _UPVALUE1_
  L6_14 = L6_14.checkPptpSeverSubnetRange
  L7_15 = L2_10
  L6_14 = L6_14(L7_15, L4_12)
  L5_13 = L6_14
  L6_14 = _UPVALUE0_
  L6_14 = L6_14.SUCCESS
  if L5_13 == L6_14 then
    L6_14 = _UPVALUE0_
    L6_14 = L6_14.PPTP_SERVER_ALREADY_CONFIGURED
    return L6_14
  end
  L6_14 = _UPVALUE1_
  L6_14 = L6_14.checkL2tpSeverSubnetRange
  L7_15 = L2_10
  L6_14 = L6_14(L7_15, L4_12)
  L5_13 = L6_14
  L6_14 = _UPVALUE0_
  L6_14 = L6_14.SUCCESS
  if L5_13 == L6_14 then
    L6_14 = _UPVALUE0_
    L6_14 = L6_14.L2TP_SERVER_ALREADY_CONFIGURED
    return L6_14
  end
  L6_14, L7_15 = nil, nil
  _UPVALUE2_.start()
  L6_14, L7_15 = _UPVALUE3_.dhcpserverConfigSet(L1_9, L2_10, L3_11, L4_12)
  if L6_14 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L6_14)
    _UPVALUE2_.abort()
    return L6_14, L1_9
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return _UPVALUE0_.SUCCESS, L7_15
end
function dhcpRangeDelete(A0_16)
  return _UPVALUE0_.NOT_SUPPORTED
end
function dhcpRangeDefaultsGet()
  local L0_17, L1_18, L2_19, L4_20, L5_21, L6_22, L7_23
  L0_17 = "192.168.12.100"
  L1_18 = "192.168.12.254"
  L2_19 = "255.255.255.0"
  L4_20 = _UPVALUE0_
  L4_20 = L4_20.SUCCESS
  L5_21 = 0
  L6_22 = L0_17
  L7_23 = L1_18
  return L4_20, L5_21, L6_22, L7_23, L2_19
end
function dhcpRangeCreate(A0_24)
  return _UPVALUE0_.NOT_SUPPORTED
end
