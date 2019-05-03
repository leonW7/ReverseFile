local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8
L0_0 = require
L1_1 = "teamf1lualib/db"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/util"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/validations"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/returnCodes"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/lan_addressing"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/dhcp_serverLAN"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/lan_staticDns"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/dhcp_leasedClientsLAN"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/management_config"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/vlan_vlan"
L0_0(L1_1)
L0_0 = HIGH_SEC
if L0_0 == "HIGH" then
  L0_0 = require
  L1_1 = "teamf1lualib/sslvpn_client"
  L0_0(L1_1)
end
L0_0 = require
L1_1 = "teamf1lualib/dhcp_reservedIpLAN"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/fwAttackChecks"
L0_0(L1_1)
L0_0 = require
L1_1 = "com.teamf1.core.config"
L0_0 = L0_0(L1_1)
L1_1 = require
L2_2 = "com.teamf1.core.lan.staticDns"
L1_1 = L1_1(L2_2)
L2_2 = require
L3_3 = "com.teamf1.core.dhcp.serverLAN"
L2_2 = L2_2(L3_3)
L3_3 = require
L4_4 = "com.teamf1.core.lan.addressing"
L3_3 = L3_3(L4_4)
L4_4 = require
L5_5 = "com.teamf1.core.returnCodes"
L4_4 = L4_4(L5_5)
L5_5 = require
L6_6 = "com.teamf1.core.validations"
L5_5 = L5_5(L6_6)
L6_6 = require
L7_7 = "com.teamf1.core.dhcp.leasedclientsLAN"
L6_6 = L6_6(L7_7)
L7_7 = require
L8_8 = "com.teamf1.core.vlan.vlan"
L7_7 = L7_7(L8_8)
L8_8 = nil
if HIGH_SEC == "HIGH" then
  L8_8 = require("com.teamf1.core.sslvpn.client")
end
dhcpWorkType = {}
dhcpWorkType.none = "None"
dhcpWorkType.server = "Server"
dhcpWorkType.relay = "Relay"
LAN_NAME = "LAN"
lanCookie = "lanSettings.cookie"
lanipAddress = "lanSettings.ipAddress"
lansubnetMask = "lanSettings.subnetMask"
langateway = "lanSettings.gateway"
landhcpType = "lanSettings.dhcpType"
landnsProxy = "lanSettings.dnsProxy"
landhcpRelay = "lanSettings.dhcpRelay"
landefaultRoute = "lanSettings.defaultRoute"
landefaultRouteGateway = "lanSettings.defaultRouteGateway"
lansnat = "lanSettings.snat"
lanstartIpAddr = "lanSettings.startIpAddr"
lanendIpAddr = "lanSettings.endIpAddr"
landomainName = "lanSettings.domainName"
landefaultGateway = "lanSettings.defaultGateway"
lanprimaryDnsServer = "lanSettings.primaryDnsServer"
lansecondaryDnsServer = "lanSettings.secondaryDnsServer"
lanwinsServer = "lanSettings.winsServer"
lanleaseTime = "lanSettings.leaseTime"
lannameServer = "lanSettings.nameServer"
lanDNSHostName = "lanSettingsDns.HostName"
lanDNSAddress = "lanSettingsDns.IpAddress"
lanConfigureDns = "lanSettings.ConfigureDns"
function lanSettingsGet()
  local L0_9, L1_10, L2_11, L3_12, L4_13, L5_14, L6_15, L7_16, L8_17, L9_18, L10_19, L11_20, L12_21, L13_22, L14_23, L15_24, L16_25, L17_26, L18_27, L19_28, L20_29, L21_30, L22_31, L23_32
  L18_27 = _UPVALUE0_
  L18_27 = L18_27.lanAddressGet
  L5_14, L6_15, L18_27 = nil, nil, L18_27()
  L5_14, L6_15, L19_28 = nil, nil, L18_27()
  L5_14, L6_15, L20_29 = nil, nil, L18_27()
  L5_14, L6_15, L21_30 = nil, nil, L18_27()
  L5_14, L6_15, L22_31 = nil, nil, L18_27()
  L5_14, L6_15, L23_32 = nil, nil, L18_27()
  L4_13 = L23_32
  gateway = L22_31
  L3_12 = L21_30
  L2_11 = L20_29
  L1_10 = L19_28
  L0_9 = L18_27
  L18_27 = _UPVALUE1_
  L18_27 = L18_27.SUCCESS
  if L0_9 ~= L18_27 then
    return L0_9
  end
  L18_27 = _UPVALUE2_
  L18_27 = L18_27.dhcpServerLANGet
  L13_22, L14_23, L15_24, L12_21, L16_25, L17_26, L23_32 = L18_27()
  L11_20 = L23_32
  L10_19 = L22_31
  L3_12 = L21_30
  L2_11 = L20_29
  cookie1 = L19_28
  returnCode1 = L18_27
  L18_27 = _UPVALUE3_
  L18_27 = L18_27.dnsEntryGetAll
  L19_28 = L18_27()
  L20_29 = _UPVALUE1_
  L20_29 = L20_29.SUCCESS
  if L18_27 ~= L20_29 then
    return L0_9
  end
  L20_29 = "0"
  if L4_13 == "None" then
    L20_29 = "0"
  elseif L4_13 == "Server" then
    L20_29 = "1"
  else
    L20_29 = "3"
  end
  L21_30 = "0"
  L22_31 = _UPVALUE4_
  L22_31 = L22_31.ipAddressCheck
  L23_32 = "2"
  L22_31 = L22_31(L23_32, L14_23)
  L23_32 = _UPVALUE1_
  L23_32 = L23_32.SUCCESS
  if L22_31 == L23_32 then
    L21_30 = "1"
  end
  L23_32 = _UPVALUE4_
  L23_32 = L23_32.ipAddressCheck
  L23_32 = L23_32("2", L15_24)
  L22_31 = L23_32
  L23_32 = _UPVALUE1_
  L23_32 = L23_32.SUCCESS
  if L22_31 == L23_32 then
    L21_30 = "1"
  end
  L23_32 = _UPVALUE4_
  L23_32 = L23_32.ipAddressCheck
  L23_32 = L23_32("2", L16_25)
  L22_31 = L23_32
  L23_32 = _UPVALUE1_
  L23_32 = L23_32.SUCCESS
  if L22_31 == L23_32 then
    L21_30 = "1"
  end
  L23_32 = {}
  L23_32[lanipAddress] = L2_11
  L23_32[lansubnetMask] = L3_12
  L23_32[langateway] = gateway
  L23_32[landhcpType] = L20_29
  L23_32[landnsProxy] = L5_14
  L23_32[landhcpRelay] = L6_15
  L23_32[lanstartIpAddr] = L10_19
  L23_32[lanendIpAddr] = L11_20
  L23_32[landomainName] = L12_21
  L23_32[landefaultGateway] = L13_22
  L23_32[lanprimaryDnsServer] = L14_23
  L23_32[lansecondaryDnsServer] = L15_24
  L23_32[lanwinsServer] = L16_25
  L23_32[lanleaseTime] = L17_26
  L23_32[lannameServer] = nameServer
  L23_32[lanConfigureDns] = L21_30
  return L0_9, L1_10, L23_32, L19_28
end
function lanSettingsGetNext(A0_33)
  return _UPVALUE0_.NOT_SUPPORTED
end
function respondToPingGet()
  local L0_34, L1_35, L2_36
  L0_34 = _UPVALUE0_
  L0_34 = L0_34.NIL
  L1_35 = _UPVALUE0_
  L1_35 = L1_35.NIL
  L2_36 = _UPVALUE0_
  L2_36 = L2_36.NIL
  L2_36, L1_35, L0_34 = fw.core.attackChecks.pingOnLanStatusGet()
  if L2_36 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in getting default respond to LAN ping value" .. L2_36)
    return L2_36
  end
  return _UPVALUE0_.SUCCESS, L0_34
end
function respondToPingSet(A0_37)
  local L1_38, L2_39, L3_40
  L1_38 = _UPVALUE0_
  L1_38 = L1_38.NIL
  L2_39 = _UPVALUE0_
  L2_39 = L2_39.NIL
  L3_40 = _UPVALUE0_
  L3_40 = L3_40.NIL
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page DUMMY PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_38 = A0_37["lanSettingsTable.pingOnLanStatus"]
  if L1_38 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L3_40 = fw.core.attackChecks.pingOnLanStatusSet(L1_38)
  if L3_40 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Setting default respond to LAN ping value" .. L3_40)
    _UPVALUE1_.abort()
    return L3_40
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function lanSettingsSet(A0_41)
  local L1_42, L2_43, L3_44, L4_45, L5_46, L6_47, L7_48, L8_49, L9_50, L10_51, L11_52, L12_53, L13_54, L14_55, L15_56, L16_57, L17_58, L18_59, L19_60, L20_61, L21_62, L22_63, L23_64
  L1_42 = ACCESS_LEVEL
  if L1_42 ~= 0 then
    L1_42 = util
    L1_42 = L1_42.appendDebugOut
    L2_43 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_42(L2_43)
    L1_42 = _UPVALUE0_
    L1_42 = L1_42.UNAUTHORIZED
    return L1_42
  end
  L1_42 = nil
  L2_43 = landhcpType
  L2_43 = A0_41[L2_43]
  if L2_43 == "0" then
    L1_42 = "None"
  else
    L2_43 = landhcpType
    L2_43 = A0_41[L2_43]
    if L2_43 == "1" then
      L1_42 = "Server"
    else
      L2_43 = landhcpType
      L2_43 = A0_41[L2_43]
      if L2_43 == "3" then
        L1_42 = "Relay"
      end
    end
  end
  L2_43 = lanCookie
  L2_43 = A0_41[L2_43]
  L3_44 = lanipAddress
  L3_44 = A0_41[L3_44]
  L4_45 = lansubnetMask
  L4_45 = A0_41[L4_45]
  L5_46 = langateway
  L5_46 = A0_41[L5_46]
  L6_47 = L1_42
  L7_48 = landnsProxy
  L7_48 = A0_41[L7_48]
  L8_49 = landhcpRelay
  L8_49 = A0_41[L8_49]
  L9_50 = landomainName
  L9_50 = A0_41[L9_50]
  if L2_43 == nil then
    L10_51 = util
    L10_51 = L10_51.appendDebugOut
    L11_52 = "Set : Invalid Cookie"
    L10_51(L11_52)
    L10_51 = _UPVALUE0_
    L10_51 = L10_51.BAD_PARAMETER
    return L10_51
  end
  L10_51 = HIGH_SEC
  if L10_51 == "HIGH" then
    L10_51 = _UPVALUE1_
    L10_51 = L10_51.sslvpnIpSecSubnetIpCheck
    L11_52 = L3_44
    L12_53 = L4_45
    L10_51 = L10_51(L11_52, L12_53)
    L11_52 = _UPVALUE0_
    L11_52 = L11_52.SUCCESS
    if L10_51 == L11_52 then
      L11_52 = _UPVALUE0_
      L11_52 = L11_52.IP_ALREADY_CONFIGURED
      return L11_52
    end
  end
  if L3_44 == nil then
    L10_51 = util
    L10_51 = L10_51.appendDebugOut
    L11_52 = "Set : Invalid Cookie"
    L10_51(L11_52)
    L10_51 = _UPVALUE0_
    L10_51 = L10_51.BAD_PARAMETER
    return L10_51
  end
  if L4_45 == nil then
    L10_51 = util
    L10_51 = L10_51.appendDebugOut
    L11_52 = "Set : Invalid Cookie"
    L10_51(L11_52)
    L10_51 = _UPVALUE0_
    L10_51 = L10_51.BAD_PARAMETER
    return L10_51
  end
  L10_51, L11_52 = nil, nil
  L10_51 = L3_44
  L11_52 = L4_45
  L12_53, L13_54 = nil, nil
  L14_55 = _UPVALUE1_
  L14_55 = L14_55.checkWanSubnetRange
  L15_56 = L3_44
  L16_57 = L4_45
  L14_55 = L14_55(L15_56, L16_57)
  L12_53 = L14_55
  L14_55 = _UPVALUE0_
  L14_55 = L14_55.SUCCESS
  if L12_53 == L14_55 then
    L14_55 = util
    L14_55 = L14_55.appendDebugOut
    L15_56 = "Set : Invalid ipaddress"
    L14_55(L15_56)
    L14_55 = UNIT_NAME
    if L14_55 ~= "DSR-250N" then
      L14_55 = UNIT_NAME
      if L14_55 ~= "DSR-250" then
        L14_55 = UNIT_NAME
        if L14_55 ~= "DSR-150N" then
          L14_55 = UNIT_NAME
          if L14_55 ~= "DSR-150" then
            L14_55 = _UPVALUE0_
            L14_55 = L14_55.WAN_ALREADY_CONFIGURED
            return L14_55
          end
        end
      end
    else
      L14_55 = _UPVALUE0_
      L14_55 = L14_55.WAN_ECONA_ALREADY_CONFIGURED
      return L14_55
    end
  end
  L14_55 = _UPVALUE1_
  L14_55 = L14_55.checkIpSecSubnetRange
  L15_56 = L3_44
  L16_57 = L4_45
  L14_55 = L14_55(L15_56, L16_57)
  L12_53 = L14_55
  L14_55 = _UPVALUE0_
  L14_55 = L14_55.SUCCESS
  if L12_53 == L14_55 then
    L14_55 = util
    L14_55 = L14_55.appendDebugOut
    L15_56 = "Set : Invalid ipaddress"
    L14_55(L15_56)
    L14_55 = _UPVALUE0_
    L14_55 = L14_55.IPSEC_DHCP_ALREADY_CONFIGURED
    return L14_55
  end
  L14_55 = _UPVALUE1_
  L14_55 = L14_55.checkOpenVpnSubnetRange
  L15_56 = L3_44
  L16_57 = L4_45
  L14_55 = L14_55(L15_56, L16_57)
  L12_53 = L14_55
  L14_55 = _UPVALUE0_
  L14_55 = L14_55.SUCCESS
  if L12_53 == L14_55 then
    L14_55 = util
    L14_55 = L14_55.appendDebugOut
    L15_56 = "Set : Invalid ipaddress"
    L14_55(L15_56)
    L14_55 = _UPVALUE0_
    L14_55 = L14_55.OPENVPN_ALREADY_CONFIGURED
    return L14_55
  end
  L14_55 = HIGH_SEC
  if L14_55 == "HIGH" then
    L14_55 = _UPVALUE1_
    L14_55 = L14_55.checkSslClientRange
    L15_56 = L3_44
    L16_57 = L4_45
    L14_55 = L14_55(L15_56, L16_57)
    L12_53 = L14_55
    L14_55 = _UPVALUE0_
    L14_55 = L14_55.SUCCESS
    if L12_53 == L14_55 then
      L14_55 = util
      L14_55 = L14_55.appendDebugOut
      L15_56 = "Set : Invalid ipaddress"
      L14_55(L15_56)
      L14_55 = _UPVALUE0_
      L14_55 = L14_55.SSLVPN_CLIENT_ALREADY_CONFIGURED
      return L14_55
    end
  end
  L14_55 = _UPVALUE1_
  L14_55 = L14_55.checkDmzSubnetRange
  L15_56 = L3_44
  L16_57 = L4_45
  L14_55 = L14_55(L15_56, L16_57)
  L12_53 = L14_55
  L14_55 = _UPVALUE0_
  L14_55 = L14_55.SUCCESS
  if L12_53 == L14_55 then
    L14_55 = util
    L14_55 = L14_55.appendDebugOut
    L15_56 = "Set : Invalid ipaddress"
    L14_55(L15_56)
    L14_55 = _UPVALUE0_
    L14_55 = L14_55.DMZ_ALREADY_CONFIGURED
    return L14_55
  end
  L14_55 = _UPVALUE1_
  L14_55 = L14_55.checkVlanSubnetRange
  L15_56 = L3_44
  L16_57 = L4_45
  L17_58 = "1"
  L14_55 = L14_55(L15_56, L16_57, L17_58)
  L12_53 = L14_55
  L14_55 = _UPVALUE0_
  L14_55 = L14_55.SUCCESS
  if L12_53 == L14_55 then
    L14_55 = util
    L14_55 = L14_55.appendDebugOut
    L15_56 = "Set : Invalid ipaddress"
    L14_55(L15_56)
    L14_55 = _UPVALUE0_
    L14_55 = L14_55.LAN_VLAN_ALREADY_CONFIGURED
    return L14_55
  end
  L14_55 = _UPVALUE2_
  L14_55 = L14_55.start
  L14_55()
  L14_55 = _UPVALUE1_
  L14_55 = L14_55.isDhcpReservedIPNotExist
  L15_56 = "LAN"
  L16_57 = L3_44
  L17_58 = L4_45
  L18_59 = lanstartIpAddr
  L18_59 = A0_41[L18_59]
  L19_60 = lanendIpAddr
  L19_60 = A0_41[L19_60]
  L14_55 = L14_55(L15_56, L16_57, L17_58, L18_59, L19_60)
  L12_53 = L14_55
  L14_55 = _UPVALUE0_
  L14_55 = L14_55.SUCCESS
  if L12_53 ~= L14_55 then
    L14_55 = util
    L14_55 = L14_55.appendDebugOut
    L15_56 = "Error in configuring values in page lansettings PAGE"
    L16_57 = L12_53
    L15_56 = L15_56 .. L16_57
    L14_55(L15_56)
    L14_55 = _UPVALUE2_
    L14_55 = L14_55.abort
    L14_55()
    L14_55 = L12_53
    L15_56 = L2_43
    return L14_55, L15_56
  end
  L14_55 = _UPVALUE3_
  L14_55 = L14_55.lanAddressSet
  L15_56 = L2_43
  L16_57 = L3_44
  L17_58 = L4_45
  L18_59 = L5_46
  L19_60 = L6_47
  L20_61 = L7_48
  L21_62 = L8_49
  L22_63 = L9_50
  L15_56 = L14_55(L15_56, L16_57, L17_58, L18_59, L19_60, L20_61, L21_62, L22_63)
  L13_54 = L15_56
  L12_53 = L14_55
  L14_55 = _UPVALUE0_
  L14_55 = L14_55.SUCCESS
  if L12_53 ~= L14_55 then
    L14_55 = util
    L14_55 = L14_55.appendDebugOut
    L15_56 = "Error in configuring values in page DUMMY PAGE"
    L16_57 = L12_53
    L15_56 = L15_56 .. L16_57
    L14_55(L15_56)
    L14_55 = _UPVALUE2_
    L14_55 = L14_55.abort
    L14_55()
    L14_55 = L12_53
    L15_56 = L2_43
    return L14_55, L15_56
  end
  L14_55 = dhcpWorkType
  L14_55 = L14_55.server
  if L6_47 == L14_55 then
    L14_55 = lanstartIpAddr
    L14_55 = A0_41[L14_55]
    L15_56 = lanendIpAddr
    L15_56 = A0_41[L15_56]
    L16_57 = landomainName
    L16_57 = A0_41[L16_57]
    L17_58 = landefaultGateway
    L17_58 = A0_41[L17_58]
    L18_59 = lanprimaryDnsServer
    L18_59 = A0_41[L18_59]
    L19_60 = lansecondaryDnsServer
    L19_60 = A0_41[L19_60]
    L20_61 = lanwinsServer
    L20_61 = A0_41[L20_61]
    L21_62 = lanleaseTime
    L21_62 = A0_41[L21_62]
    L22_63 = lanConfigureDns
    L22_63 = A0_41[L22_63]
    if L22_63 == "0" then
      L18_59 = ""
      L19_60 = ""
      L20_61 = ""
    end
    L22_63 = _UPVALUE4_
    L22_63 = L22_63.typeFind
    L23_64 = LAN_NAME
    L23_64 = L22_63(L23_64)
    if L22_63 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L22_63)
      _UPVALUE2_.abort()
      return L22_63, L2_43
    end
    returnCode1, cookie1 = _UPVALUE4_.dhcpServerLANSet(L23_64, L3_44, L4_45, L14_55, L15_56, L17_58, L18_59, L19_60, L16_57, L20_61, L21_62)
    if returnCode1 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L22_63)
      _UPVALUE2_.abort()
      return returnCode1, L2_43
    end
  end
  L14_55 = _UPVALUE5_
  L14_55 = L14_55.clientLANDeleteAll
  L14_55 = L14_55()
  L15_56 = _UPVALUE0_
  L15_56 = L15_56.SUCCESS
  if L14_55 ~= L15_56 then
    L15_56 = util
    L15_56 = L15_56.appendDebugOut
    L16_57 = "Error in configuring values in lan leased client's"
    L17_58 = L12_53
    L16_57 = L16_57 .. L17_58
    L15_56(L16_57)
    L15_56 = _UPVALUE2_
    L15_56 = L15_56.abort
    L15_56()
    L15_56 = L14_55
    L16_57 = L2_43
    return L15_56, L16_57
  end
  L15_56, L16_57, L17_58, L18_59 = nil, nil, nil, nil
  L19_60 = _UPVALUE6_
  L19_60 = L19_60.dnsEntrySet
  L20_61 = A0_41
  L20_61 = L19_60(L20_61)
  L16_57 = L20_61
  L15_56 = L19_60
  L19_60 = _UPVALUE0_
  L19_60 = L19_60.SUCCESS
  if L15_56 ~= L19_60 then
    L19_60 = util
    L19_60 = L19_60.appendDebugOut
    L20_61 = "Error in configuring values in Dns host name mapping"
    L21_62 = L12_53
    L20_61 = L20_61 .. L21_62
    L19_60(L20_61)
    L19_60 = _UPVALUE2_
    L19_60 = L19_60.abort
    L19_60()
    L19_60 = L15_56
    L20_61 = L2_43
    return L19_60, L20_61
  end
  L19_60 = _UPVALUE7_
  L19_60 = L19_60.firewallRulesUpdate
  L20_61 = "1"
  L21_62 = L10_51
  L22_63 = L11_52
  L19_60 = L19_60(L20_61, L21_62, L22_63)
  L12_53 = L19_60
  L19_60 = _UPVALUE0_
  L19_60 = L19_60.SUCCESS
  if L12_53 ~= L19_60 then
    L19_60 = util
    L19_60 = L19_60.appendDebugOut
    L20_61 = "Error in configuring values in page DUMMY PAGE"
    L21_62 = L12_53
    L20_61 = L20_61 .. L21_62
    L19_60(L20_61)
    L19_60 = _UPVALUE2_
    L19_60 = L19_60.abort
    L19_60()
    L19_60 = L12_53
    L20_61 = L2_43
    return L19_60, L20_61
  end
  L19_60 = _UPVALUE2_
  L19_60 = L19_60.complete
  L19_60()
  L19_60 = _UPVALUE2_
  L19_60 = L19_60.save
  L19_60()
  L19_60 = _UPVALUE0_
  L19_60 = L19_60.SUCCESS
  L20_61 = L13_54
  return L19_60, L20_61
end
function lanSettingsDelete(A0_65)
  local L2_66
  L2_66 = _UPVALUE0_
  L2_66 = L2_66.NOT_SUPPORTED
  return L2_66, cookie
end
function lanSettingsDefaultsGet()
  local L0_67, L1_68, L3_69, L4_70, L5_71
  L0_67 = 1
  L1_68 = "PAP"
  L3_69 = _UPVALUE0_
  L3_69 = L3_69.SUCCESS
  L4_70 = 0
  L5_71 = L0_67
  return L3_69, L4_70, L5_71, L1_68
end
function lanSettingsCreate(A0_72)
  local L2_73
  L2_73 = _UPVALUE0_
  L2_73 = L2_73.NOT_SUPPORTED
  return L2_73, cookie
end
function sslVpnBeginClient()
  local L0_74, L1_75, L2_76
  if HIGH_SEC == "HIGH" then
    L0_74, L1_75, L2_76 = _UPVALUE0_.beginClientAddressGet()
  end
  return L0_74, L1_75, L2_76
end
function sslVpnEndClient()
  local L0_77, L1_78, L2_79
  if HIGH_SEC == "HIGH" then
    L0_77, L1_78, L2_79 = _UPVALUE0_.endClientAddressGet()
  end
  return L0_77, L1_78, L2_79
end
function dhcpFixedIpAddress()
  return (_UPVALUE0_.reservedLANIpGet())
end
