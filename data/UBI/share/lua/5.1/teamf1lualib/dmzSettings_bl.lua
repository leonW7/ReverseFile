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
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/dhcp_serverDMZ")
L0_0 = require
L0_0("teamf1lualib/dmz_addressing")
L0_0 = require
L0_0("teamf1lualib/dhcp_leasedClientsDMZ")
L0_0 = require
L0_0("teamf1lualib/vlan_vlan")
L0_0 = require
L0_0("teamf1lualib/wan_configurablePort")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
dhcpWorkType = {}
dhcpWorkType.none = "None"
dhcpWorkType.server = "Server"
dhcpWorkType.relay = "Relay"
DMZ_NAME = "DMZ"
function dmzSettingsGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19
  L17_18 = _UPVALUE0_
  L17_18 = L17_18.dmzAddressGet
  L1_2, L2_3, L9_10, L3_4, L4_5, L5_6, L17_18 = nil, nil, nil, nil, nil, nil, L17_18()
  L1_2, L2_3, L9_10, L3_4, L4_5, L5_6, L18_19 = nil, nil, nil, nil, nil, nil, L17_18()
  L14_15 = L18_19
  L0_1 = L17_18
  L17_18 = _UPVALUE1_
  L17_18 = L17_18.SUCCESS
  if L0_1 ~= L17_18 then
    return L0_1
  end
  L17_18 = _UPVALUE2_
  L17_18 = L17_18.dhcpServerDMZGet
  L1_2, L2_3, L6_7, L7_8, L9_10, L10_11, L11_12, L8_9, L12_13, L13_14, L18_19 = L17_18()
  cookie1 = L18_19
  returnCode1 = L17_18
  L17_18 = returnCode1
  L18_19 = _UPVALUE1_
  L18_19 = L18_19.SUCCESS
  if L17_18 ~= L18_19 then
    return L0_1
  end
  L17_18 = nil
  L18_19 = dhcpWorkType
  L18_19 = L18_19.none
  if L3_4 == L18_19 then
    L17_18 = "1"
  else
    L18_19 = dhcpWorkType
    L18_19 = L18_19.server
    if L3_4 == L18_19 then
      L17_18 = "2"
    else
      L17_18 = "3"
    end
  end
  L18_19 = UNIT_NAME
  if L18_19 ~= "DSR-250" then
    L18_19 = UNIT_NAME
    if L18_19 ~= "DSR-250N" then
      L18_19 = UNIT_NAME
      if L18_19 ~= "DSR-150" then
        L18_19 = UNIT_NAME
      end
    end
  elseif L18_19 == "DSR-150N" then
    L18_19 = _UPVALUE3_
    L18_19 = L18_19.configPortUsageGet
    L14_15, L16_17, L18_19 = L17_18()
    L0_1 = L18_19
    if L16_17 == "LAN" then
      L15_16 = "0"
    elseif L16_17 == "DMZ" then
      L15_16 = "1"
    end
    if L16_17 == "LAN" or L16_17 == "WAN2" then
      L18_19 = _UPVALUE1_
      L0_1 = L18_19.DMZ_CANNOT_BE_CONFIGURED
    end
  end
  L18_19 = {}
  L18_19["dmzSettings.ipAddress"] = L1_2
  L18_19["dmzSettings.subnetMask"] = L2_3
  L18_19["dmzSettings.dhcpType"] = L17_18
  L18_19["dmzSettings.dnsProxy"] = L4_5
  L18_19["dmzSettings.dhcpRelay"] = L5_6
  L18_19["dmzSettings.startIpAddr"] = L6_7
  L18_19["dmzSettings.endIpAddr"] = L7_8
  L18_19["dmzSettings.domainName"] = L8_9
  L18_19["dmzSettings.defaultGateway"] = L9_10
  L18_19["dmzSettings.primaryDnsServer"] = L10_11
  L18_19["dmzSettings.secondaryDnsServer"] = L11_12
  L18_19["dmzSettings.winsServer"] = L12_13
  L18_19["dmzSettings.leaseTime"] = L13_14
  L18_19["dmzSettings.dmzEnable"] = L15_16
  return L0_1, L14_15, L18_19
end
function dmzSettingsGetNext(A0_20)
  return _UPVALUE0_.NOT_SUPPORTED
end
function dmzSettingsSet(A0_21)
  local L1_22, L2_23, L3_24, L4_25, L5_26, L6_27, L7_28, L8_29, L9_30, L10_31, L11_32, L12_33, L13_34, L14_35, L15_36, L16_37, L17_38, L18_39, L19_40, L20_41, L21_42, L22_43
  L1_22 = ACCESS_LEVEL
  if L1_22 ~= 0 then
    L1_22 = util
    L1_22 = L1_22.appendDebugOut
    L2_23 = "Detected Unauthorized access for page dmzSettings.html"
    L1_22(L2_23)
    L1_22 = _UPVALUE0_
    L1_22 = L1_22.UNAUTHORIZED
    return L1_22
  end
  L1_22 = A0_21["dmzSettings.cookie"]
  L2_23 = A0_21["dmzSettings.ipAddress"]
  L3_24 = A0_21["dmzSettings.subnetMask"]
  L4_25 = A0_21["dmzSettings.dhcpType"]
  L5_26 = A0_21["dmzSettings.dnsProxy"]
  L6_27 = A0_21["dmzSettings.dmzEnable"]
  L7_28 = nil
  L8_29 = A0_21["dmzSettings.dhcpRelay"]
  if L1_22 == nil then
    L9_30 = util
    L9_30 = L9_30.appendDebugOut
    L10_31 = "Set : Invalid Cookie"
    L9_30(L10_31)
    L9_30 = _UPVALUE0_
    L9_30 = L9_30.BAD_PARAMETER
    return L9_30
  end
  L9_30 = nil
  if L4_25 == "1" then
    L9_30 = "None"
  elseif L4_25 == "2" then
    L9_30 = "Server"
  else
    L9_30 = "Relay"
  end
  if L6_27 == "1" then
    L7_28 = "DMZ"
  elseif L6_27 == "0" then
    L7_28 = "LAN"
  end
  L10_31 = UNIT_NAME
  if L10_31 ~= "DSR-250" then
    L10_31 = UNIT_NAME
    if L10_31 ~= "DSR-250N" then
      L10_31 = UNIT_NAME
      if L10_31 ~= "DSR-150" then
        L10_31 = UNIT_NAME
      end
    end
  elseif L10_31 == "DSR-150N" then
    L10_31 = _UPVALUE1_
    L10_31 = L10_31.configPortUsageGet
    L12_33 = L10_31()
    configPortUsage = L12_33
    cookie = L11_32
    returnCode = L10_31
    L10_31 = configPortUsage
    if L10_31 ~= "LAN" then
      L10_31 = configPortUsage
    elseif L10_31 == "WAN2" then
      L10_31 = _UPVALUE0_
      L10_31 = L10_31.DMZ_CANNOT_BE_CONFIGURED
      return L10_31
    end
  end
  L10_31 = _UPVALUE2_
  L10_31 = L10_31.start
  L10_31()
  L10_31 = HIGH_SEC
  if L10_31 == "HIGH" and L2_23 and L3_24 then
    L10_31 = _UPVALUE3_
    L10_31 = L10_31.checkOpenVpnSubnetRange
    L11_32 = L2_23
    L12_33 = L3_24
    L10_31 = L10_31(L11_32, L12_33)
    returnCode = L10_31
    L10_31 = returnCode
    L11_32 = _UPVALUE0_
    L11_32 = L11_32.SUCCESS
    if L10_31 == L11_32 then
      L10_31 = util
      L10_31 = L10_31.appendDebugOut
      L11_32 = "Set : Invalid ipaddress"
      L10_31(L11_32)
      L10_31 = _UPVALUE0_
      L10_31 = L10_31.OPENVPN_ALREADY_CONFIGURED
      return L10_31
    end
  end
  L10_31 = HIGH_SEC
  if L10_31 == "HIGH" and L2_23 and L3_24 then
    L10_31 = _UPVALUE3_
    L10_31 = L10_31.checkSslClientRange
    L11_32 = L2_23
    L12_33 = L3_24
    L10_31 = L10_31(L11_32, L12_33)
    returnCode = L10_31
    L10_31 = returnCode
    L11_32 = _UPVALUE0_
    L11_32 = L11_32.SUCCESS
    if L10_31 == L11_32 then
      L10_31 = util
      L10_31 = L10_31.appendDebugOut
      L11_32 = "Set : Invalid ipaddress"
      L10_31(L11_32)
      L10_31 = _UPVALUE0_
      L10_31 = L10_31.SSLVPN_CLIENT_ALREADY_CONFIGURED
      return L10_31
    end
  end
  if L2_23 and L3_24 then
    L10_31 = _UPVALUE3_
    L10_31 = L10_31.checkIpSecSubnetRange
    L11_32 = L2_23
    L12_33 = L3_24
    L10_31 = L10_31(L11_32, L12_33)
    returnCode = L10_31
    L10_31 = returnCode
    L11_32 = _UPVALUE0_
    L11_32 = L11_32.SUCCESS
    if L10_31 == L11_32 then
      L10_31 = util
      L10_31 = L10_31.appendDebugOut
      L11_32 = "Set : Invalid ipaddress"
      L10_31(L11_32)
      L10_31 = _UPVALUE0_
      L10_31 = L10_31.IPSEC_DHCP_ALREADY_CONFIGURED
      return L10_31
    end
  end
  if L2_23 and L3_24 then
    L10_31 = _UPVALUE3_
    L10_31 = L10_31.checkLanVlanSubnetRange
    L11_32 = L2_23
    L12_33 = L3_24
    L10_31 = L10_31(L11_32, L12_33)
    returnCode = L10_31
    L10_31 = returnCode
    L11_32 = _UPVALUE0_
    L11_32 = L11_32.SUCCESS
    if L10_31 == L11_32 then
      L10_31 = util
      L10_31 = L10_31.appendDebugOut
      L11_32 = "Set : Invalid ipaddress"
      L10_31(L11_32)
      L10_31 = _UPVALUE0_
      L10_31 = L10_31.LAN_VLAN_ALREADY_CONFIGURED
      return L10_31
    end
  end
  if L2_23 and L3_24 then
    L10_31 = _UPVALUE3_
    L10_31 = L10_31.checkPptpSeverSubnetRange
    L11_32 = L2_23
    L12_33 = L3_24
    L10_31 = L10_31(L11_32, L12_33)
    returnCode = L10_31
    L10_31 = returnCode
    L11_32 = _UPVALUE0_
    L11_32 = L11_32.SUCCESS
    if L10_31 == L11_32 then
      L10_31 = util
      L10_31 = L10_31.appendDebugOut
      L11_32 = "Set : Invalid ipaddress"
      L10_31(L11_32)
      L10_31 = _UPVALUE0_
      L10_31 = L10_31.PPTP_SERVER_ALREADY_CONFIGURED
      return L10_31
    end
  end
  if L2_23 and L3_24 then
    L10_31 = _UPVALUE3_
    L10_31 = L10_31.checkL2tpSeverSubnetRange
    L11_32 = L2_23
    L12_33 = L3_24
    L10_31 = L10_31(L11_32, L12_33)
    returnCode = L10_31
    L10_31 = returnCode
    L11_32 = _UPVALUE0_
    L11_32 = L11_32.SUCCESS
    if L10_31 == L11_32 then
      L10_31 = util
      L10_31 = L10_31.appendDebugOut
      L11_32 = "Set : Invalid ipaddress"
      L10_31(L11_32)
      L10_31 = _UPVALUE0_
      L10_31 = L10_31.L2TP_SERVER_ALREADY_CONFIGURED
      return L10_31
    end
  end
  L10_31 = nil
  if L2_23 and L3_24 then
    L11_32 = _UPVALUE3_
    L11_32 = L11_32.checkWanSubnetRange
    L12_33 = L2_23
    L13_34 = L3_24
    L11_32 = L11_32(L12_33, L13_34)
    L10_31 = L11_32
    L11_32 = _UPVALUE0_
    L11_32 = L11_32.SUCCESS
    if L10_31 == L11_32 then
      L11_32 = UNIT_NAME
      if L11_32 ~= "DSR-1000N" then
        L11_32 = UNIT_NAME
        if L11_32 ~= "DSR-1000" then
          L11_32 = UNIT_NAME
          if L11_32 ~= "DSR-500N" then
            L11_32 = UNIT_NAME
            if L11_32 ~= "DSR-500" then
              L11_32 = UNIT_NAME
              if L11_32 ~= "DSR-1000AC" then
                L11_32 = UNIT_NAME
              end
            end
          end
        end
      else
        if L11_32 == "DSR-500AC" then
          L11_32 = _UPVALUE0_
          L11_32 = L11_32.WAN_ALREADY_CONFIGURED
          return L11_32
      end
      else
        L11_32 = _UPVALUE0_
        L11_32 = L11_32.WAN_ECONA_ALREADY_CONFIGURED
        return L11_32
      end
    end
  end
  if L2_23 and L3_24 then
    L11_32 = _UPVALUE3_
    L11_32 = L11_32.checkDmzWithLan
    L12_33 = L2_23
    L13_34 = L3_24
    L11_32 = L11_32(L12_33, L13_34)
    L10_31 = L11_32
    L11_32 = _UPVALUE0_
    L11_32 = L11_32.SUCCESS
    if L10_31 == L11_32 then
      L11_32 = util
      L11_32 = L11_32.appendDebugOut
      L12_33 = "Set : Invalid ipaddress"
      L11_32(L12_33)
      L11_32 = _UPVALUE0_
      L11_32 = L11_32.DMZ_IP_ADDRESS_ALREADY_CONFIGURED
      return L11_32
    end
  end
  if L7_28 ~= "LAN" then
    L11_32 = _UPVALUE3_
    L11_32 = L11_32.isDhcpReservedIPNotExist
    L12_33 = "DMZ"
    L13_34 = L2_23
    L14_35 = L3_24
    L15_36 = A0_21["dmzSettings.startIpAddr"]
    L16_37 = A0_21["dmzSettings.endIpAddr"]
    L11_32 = L11_32(L12_33, L13_34, L14_35, L15_36, L16_37)
    L10_31 = L11_32
    L11_32 = _UPVALUE0_
    L11_32 = L11_32.SUCCESS
    if L10_31 ~= L11_32 then
      L11_32 = util
      L11_32 = L11_32.appendDebugOut
      L12_33 = "Error in configuring values in page dmzSettings.html"
      L13_34 = L10_31
      L12_33 = L12_33 .. L13_34
      L11_32(L12_33)
      L11_32 = _UPVALUE2_
      L11_32 = L11_32.abort
      L11_32()
      L11_32 = L10_31
      L12_33 = L1_22
      return L11_32, L12_33
    end
    L11_32 = _UPVALUE4_
    L11_32 = L11_32.dmzAddressSet
    L12_33 = L1_22
    L13_34 = L2_23
    L14_35 = L3_24
    L15_36 = NIL
    L16_37 = L9_30
    L17_38 = L5_26
    L18_39 = L8_29
    L12_33 = L11_32(L12_33, L13_34, L14_35, L15_36, L16_37, L17_38, L18_39)
    cookie = L12_33
    L10_31 = L11_32
    L11_32 = _UPVALUE0_
    L11_32 = L11_32.SUCCESS
    if L10_31 ~= L11_32 then
      L11_32 = util
      L11_32 = L11_32.appendDebugOut
      L12_33 = "Error in configuring values in page dmzSettings.html"
      L13_34 = L10_31
      L12_33 = L12_33 .. L13_34
      L11_32(L12_33)
      L11_32 = _UPVALUE2_
      L11_32 = L11_32.abort
      L11_32()
      L11_32 = L10_31
      L12_33 = L1_22
      return L11_32, L12_33
    end
    L11_32 = dhcpWorkType
    L11_32 = L11_32.server
    if L9_30 == L11_32 then
      L11_32 = A0_21["dmzSettings.startIpAddr"]
      L12_33 = A0_21["dmzSettings.endIpAddr"]
      L13_34 = A0_21["dmzSettings.domainName"]
      L14_35 = A0_21["dmzSettings.defaultGateway"]
      L15_36 = A0_21["dmzSettings.primaryDnsServer"]
      L16_37 = A0_21["dmzSettings.secondaryDnsServer"]
      L17_38 = A0_21["dmzSettings.winsServer"]
      L18_39 = A0_21["dmzSettings.leaseTime"]
      L19_40 = _UPVALUE5_
      L19_40 = L19_40.typeFind
      L20_41 = DMZ_NAME
      L20_41 = L19_40(L20_41)
      L21_42 = _UPVALUE0_
      L21_42 = L21_42.SUCCESS
      if L19_40 ~= L21_42 then
        L21_42 = util
        L21_42 = L21_42.appendDebugOut
        L22_43 = "Error in configuring values in page dmzSettings.html"
        L22_43 = L22_43 .. L19_40
        L21_42(L22_43)
        L21_42 = _UPVALUE2_
        L21_42 = L21_42.abort
        L21_42()
        L21_42 = _UPVALUE0_
        L21_42 = L21_42.ERROR
        L22_43 = L1_22
        return L21_42, L22_43
      end
      L21_42, L22_43 = nil, nil
      L21_42, L22_43 = _UPVALUE5_.dhcpServerDMZSet(L20_41, L2_23, L3_24, L11_32, L12_33, L14_35, L15_36, L16_37, L13_34, L17_38, L18_39)
      if L21_42 ~= _UPVALUE0_.SUCCESS then
        util.appendDebugOut("Error in configuring values in page dmzSettings.html" .. L19_40)
        _UPVALUE2_.abort()
        return L21_42, L1_22
      end
    end
  end
  L11_32 = _UPVALUE2_
  L11_32 = L11_32.complete
  L11_32()
  L11_32 = _UPVALUE2_
  L11_32 = L11_32.save
  L11_32()
  L11_32 = _UPVALUE0_
  L11_32 = L11_32.SUCCESS
  L12_33 = cookie
  return L11_32, L12_33
end
function subnetMaskDelete(A0_44)
  return _UPVALUE0_.NOT_SUPPORTED
end
function subnetMaskDefaultsGet()
  local L0_45, L1_46, L3_47, L4_48, L5_49
  L0_45 = 1
  L1_46 = "PAP"
  L3_47 = _UPVALUE0_
  L3_47 = L3_47.SUCCESS
  L4_48 = 0
  L5_49 = L0_45
  return L3_47, L4_48, L5_49, L1_46
end
function subnetMaskCreate(A0_50)
  return _UPVALUE0_.NOT_SUPPORTED
end
function configPortNameGet()
  local L0_51, L1_52, L2_53
  L0_51, L1_52, L2_53 = _UPVALUE0_.configPortUsageGet()
  return L0_51, L2_53
end
