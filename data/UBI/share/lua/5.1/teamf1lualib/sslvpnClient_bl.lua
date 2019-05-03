local L0_0
L0_0 = module
L0_0("com.teamf1.bl.sslvpn.client", package.seeall)
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
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.validations")
function sslvpnClientSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9
  L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9 = _UPVALUE0_.clientGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9
end
function sslvpnClientSectionSet(A0_10)
  local L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18, L9_19, L10_20, L11_21, L12_22
  L1_11 = ACCESS_LEVEL
  if L1_11 ~= 0 then
    L1_11 = util
    L1_11 = L1_11.appendDebugOut
    L2_12 = "Detected Unauthorized access for page sslvpnClient"
    L1_11(L2_12)
    L1_11 = _UPVALUE0_
    L1_11 = L1_11.UNAUTHORIZED
    return L1_11
  end
  L1_11 = A0_10["sslvpnClient.cookie"]
  L2_12 = A0_10["sslvpnClient.fullTunnel"]
  L3_13 = A0_10["sslvpnClient.DNSSuffix"]
  L4_14 = A0_10["sslvpnClient.primaryDNSServer"]
  L5_15 = A0_10["sslvpnClient.secondaryDNSServer"]
  L6_16 = A0_10["sslvpnClient.beginClientAddress"]
  L7_17 = A0_10["sslvpnClient.endClientAddress"]
  L8_18 = A0_10["sslvpnClient.lcpTimeout"]
  L9_19 = _UPVALUE0_
  L9_19 = L9_19.NIL
  if L1_11 == L9_19 then
    L9_19 = util
    L9_19 = L9_19.appendDebugOut
    L10_20 = "Set : Invalid Cookie"
    L9_19(L10_20)
    L9_19 = _UPVALUE0_
    L9_19 = L9_19.BAD_PARAMETER
    return L9_19
  end
  L9_19 = _UPVALUE0_
  L9_19 = L9_19.NIL
  if L2_12 == L9_19 then
    L9_19 = util
    L9_19 = L9_19.appendDebugOut
    L10_20 = "Set : Invalid fullTunnel"
    L9_19(L10_20)
    L9_19 = _UPVALUE0_
    L9_19 = L9_19.BAD_PARAMETER
    return L9_19
  end
  L9_19 = _UPVALUE0_
  L9_19 = L9_19.NIL
  if L6_16 == L9_19 then
    L9_19 = util
    L9_19 = L9_19.appendDebugOut
    L10_20 = "Set : Invalid beginClientAddress"
    L9_19(L10_20)
    L9_19 = _UPVALUE0_
    L9_19 = L9_19.BAD_PARAMETER
    return L9_19
  end
  L9_19 = _UPVALUE0_
  L9_19 = L9_19.NIL
  if L7_17 == L9_19 then
    L9_19 = util
    L9_19 = L9_19.appendDebugOut
    L10_20 = "Set : Invalid endClientAddress"
    L9_19(L10_20)
    L9_19 = _UPVALUE0_
    L9_19 = L9_19.BAD_PARAMETER
    return L9_19
  end
  L9_19 = _UPVALUE0_
  L9_19 = L9_19.NIL
  if L8_18 == L9_19 then
    L9_19 = util
    L9_19 = L9_19.appendDebugOut
    L10_20 = "Set : Invalid lcpTimeout"
    L9_19(L10_20)
    L9_19 = _UPVALUE0_
    L9_19 = L9_19.BAD_PARAMETER
    return L9_19
  end
  L9_19 = nil
  L10_20 = "255.255.255.0"
  L11_21 = _UPVALUE1_
  L11_21 = L11_21.checkWanSubnetRange
  L12_22 = L6_16
  L11_21 = L11_21(L12_22, L10_20)
  L9_19 = L11_21
  L11_21 = _UPVALUE0_
  L11_21 = L11_21.SUCCESS
  if L9_19 == L11_21 then
    L11_21 = UNIT_NAME
    if L11_21 ~= "DSR-250N" then
      L11_21 = UNIT_NAME
      if L11_21 ~= "DSR-250" then
        L11_21 = UNIT_NAME
        if L11_21 ~= "DSR-150N" then
          L11_21 = UNIT_NAME
          if L11_21 ~= "DSR-150" then
            L11_21 = _UPVALUE0_
            L11_21 = L11_21.WAN_ALREADY_CONFIGURED
            return L11_21
          end
        end
      end
    else
      L11_21 = _UPVALUE0_
      L11_21 = L11_21.WAN_ECONA_ALREADY_CONFIGURED
      return L11_21
    end
  end
  L11_21 = _UPVALUE1_
  L11_21 = L11_21.checkIpSecSubnetRange
  L12_22 = L6_16
  L11_21 = L11_21(L12_22, L10_20)
  L9_19 = L11_21
  L11_21 = _UPVALUE0_
  L11_21 = L11_21.SUCCESS
  if L9_19 == L11_21 then
    L11_21 = _UPVALUE0_
    L11_21 = L11_21.IPSEC_ALREADY_CONFIGURED
    return L11_21
  end
  L11_21 = _UPVALUE1_
  L11_21 = L11_21.checkLanVlanSubnetRange
  L12_22 = L6_16
  L11_21 = L11_21(L12_22, L10_20)
  L9_19 = L11_21
  L11_21 = _UPVALUE0_
  L11_21 = L11_21.SUCCESS
  if L9_19 == L11_21 then
    L11_21 = _UPVALUE0_
    L11_21 = L11_21.LAN_VLAN_ALREADY_CONFIGURED
    return L11_21
  end
  L11_21 = _UPVALUE1_
  L11_21 = L11_21.checkDmzSubnetRange
  L12_22 = L6_16
  L11_21 = L11_21(L12_22, L10_20)
  L9_19 = L11_21
  L11_21 = _UPVALUE0_
  L11_21 = L11_21.SUCCESS
  if L9_19 == L11_21 then
    L11_21 = _UPVALUE0_
    L11_21 = L11_21.DMZ_ALREADY_CONFIGURED
    return L11_21
  end
  L11_21 = _UPVALUE1_
  L11_21 = L11_21.checkOpenVpnSubnetRange
  L12_22 = L6_16
  L11_21 = L11_21(L12_22, L10_20)
  L9_19 = L11_21
  L11_21 = _UPVALUE0_
  L11_21 = L11_21.SUCCESS
  if L9_19 == L11_21 then
    L11_21 = util
    L11_21 = L11_21.appendDebugOut
    L12_22 = "Set : Invalid ipaddress"
    L11_21(L12_22)
    L11_21 = _UPVALUE0_
    L11_21 = L11_21.OPENVPN_ALREADY_CONFIGURED
    return L11_21
  end
  L11_21 = _UPVALUE1_
  L11_21 = L11_21.checkPptpSeverSubnetRange
  L12_22 = L6_16
  L11_21 = L11_21(L12_22, L10_20)
  L9_19 = L11_21
  L11_21 = _UPVALUE0_
  L11_21 = L11_21.SUCCESS
  if L9_19 == L11_21 then
    L11_21 = _UPVALUE0_
    L11_21 = L11_21.PPTP_SERVER_ALREADY_CONFIGURED
    return L11_21
  end
  L11_21 = _UPVALUE1_
  L11_21 = L11_21.checkL2tpSeverSubnetRange
  L12_22 = L6_16
  L11_21 = L11_21(L12_22, L10_20)
  L9_19 = L11_21
  L11_21 = _UPVALUE0_
  L11_21 = L11_21.SUCCESS
  if L9_19 == L11_21 then
    L11_21 = _UPVALUE0_
    L11_21 = L11_21.L2TP_SERVER_ALREADY_CONFIGURED
    return L11_21
  end
  L11_21, L12_22 = nil, nil
  _UPVALUE2_.start()
  L11_21, L12_22 = _UPVALUE3_.clientSet(L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18)
  if L11_21 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page sslvpnClient" .. L11_21)
    _UPVALUE2_.abort()
    return L11_21, L1_11
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return _UPVALUE0_.SUCCESS, L12_22
end
