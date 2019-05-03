local L0_0
L0_0 = module
L0_0("com.teamf1.core.ipv6.dhcpv6ServerVlan", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/ipv6_mode")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes_dhcpv6")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.ipv6.mode")
subnetTable = "ifStatic"
dhcpv6sTable = "dhcpv6s"
radvdTable = "radvd"
radvdPrefixPoolTable = "radvdLANPrefixPool"
vlanTable = "vlan"
ipv6InterfacesTable = "ipv6Interfaces"
networkInterfaceTable = "networkInterface"
defaultIp = ""
defaultIpv6Gateway = ""
defaultPrefixLength = "64"
LAN_NAME = "LAN"
DEFAULT_VLAN = "1"
IPV6_ADDRESS_FAMILY = "10"
defaultNetmask = ""
defaultIspName = "0"
defaultDhcpv6sDnsType = "1"
defaultLeaseTime = "86400"
defaultPrefixDelegation = "0"
defaultIpv6PrimaryDns = ""
defaultIpv6SecondaryDns = ""
defaulDhcpV6Mode = "1"
DISABLE = "0"
DEFAULT_BDG = "bdg1"
ROWID = "_ROWID_"
DUMMY_PORT = "dummy"
defaultPreference = "255"
defaultDomainName = "dlink.com"
;({}).ipAddress = "StaticIp"
;({}).subnetMask = "NetMask"
;({}).networkInterface = "LogicalIfName"
;({}).AddressFamily = "AddressFamily"
;({}).ifGateway = "Gateway"
;({}).prefixLength = "PrefixLength"
;({}).ispName = "IspName"
;({}).dhcpv6Server = "isEnabled"
;({}).dhcpv6ServerMode = "statelessMode"
;({}).serverPreference = "serverPreference"
;({}).dhcpv6DomainName = "domainName"
;({}).dhcpv6ServerDnsType = "useDNSServersFrom"
;({}).ipv6PrimaryDNSServer = "primaryDNSServer"
;({}).ipv6SecondaryDNSServer = "secondaryDNSServer"
;({}).ipv6LeaseTime = "leaseTime"
;({}).prefixDelegation = "prefixDelegation"
;({}).vlanId = "vlanId"
;({}).vlanIPv6 = "vlanIPv6"
;({}).portName = "portName"
;({}).interfaceName = "interfaceName"
;({}).feature = "isEnabled"
;({}).mode = "UnicastOnly"
;({}).interval = "MaxRtrAdvInterval"
;({}).managed = "AdvManagedFlag"
;({}).other = "AdvOtherConfigFlag"
;({}).mtu = "AdvLinkMTU"
;({}).routerPreference = "AdvDefaultPreference"
;({}).lifetime = "AdvDefaultLifetime"
;({}).usePrefixDelegation = "useDHCP6sPrefixes"
STATUS_DISABLE = 0
STATELESS = 1
STATEFUL = 0
PROXY = 1
ISP = 2
CUSTOM = 3
DUAL_IP_MODE = 3
function dhcpv6ServerVLANCreate(A0_1, A1_2, A2_3, A3_4, A4_5, A5_6, A6_7, A7_8, A8_9, A9_10, A10_11, A11_12, A12_13)
  local L13_14, L14_15, L15_16, L16_17, L17_18
  L16_17 = LAN_NAME
  L17_18 = A0_1
  L16_17 = L16_17 .. L17_18
  interfaceName = L16_17
  L16_17 = _UPVALUE0_
  L16_17 = L16_17.NIL
  if A1_2 == L16_17 or A1_2 == "" then
    L16_17 = _UPVALUE1_
    L16_17 = L16_17.INVALID_IPV6_VLAN_STATUS
    return L16_17
  end
  L16_17 = tonumber
  L17_18 = A1_2
  L16_17 = L16_17(L17_18)
  if L16_17 == 1 then
    L16_17 = ipv6VlanPrefixGrpCheck
    L17_18 = A3_4
    L16_17 = L16_17(L17_18, A4_5, A2_3)
    L13_14 = L16_17
    L16_17 = _UPVALUE0_
    L16_17 = L16_17.SUCCESS
    if L13_14 ~= L16_17 then
      return L13_14
    end
    L16_17 = tonumber
    L17_18 = A2_3
    L16_17 = L16_17(L17_18)
    if L16_17 == 1 then
      L16_17 = dhcpv6ConfigCheck
      L17_18 = A5_6
      L16_17 = L16_17(L17_18, A6_7, A7_8, A8_9, A9_10, A10_11, A11_12, A12_13)
      L13_14 = L16_17
      L16_17 = _UPVALUE0_
      L16_17 = L16_17.SUCCESS
      if L13_14 ~= L16_17 then
        return L13_14
      end
    else
      L16_17 = defaultDhcpv6Config
      A5_6, A7_8, A6_7, A8_9, A11_12, A12_13, A9_10, A10_11, L16_17 = A6_7, A7_8, A8_9, A9_10, A10_11, A11_12, A12_13, nil, L16_17()
      A5_6, A7_8, A6_7, A8_9, A11_12, A12_13, A9_10, A10_11, L17_18 = A6_7, A7_8, A8_9, A9_10, A10_11, A11_12, A12_13, nil, L16_17()
      A2_3 = L17_18
      L13_14 = L16_17
    end
    L16_17 = {}
    L17_18 = dhcpv6sTable
    L17_18 = L17_18 .. "." .. _UPVALUE2_.networkInterface
    L16_17[L17_18] = interfaceName
    L17_18 = dhcpv6sTable
    L17_18 = L17_18 .. "." .. _UPVALUE2_.dhcpv6Server
    L16_17[L17_18] = A2_3
    L17_18 = dhcpv6sTable
    L17_18 = L17_18 .. "." .. _UPVALUE2_.dhcpv6ServerMode
    L16_17[L17_18] = A5_6
    L17_18 = dhcpv6sTable
    L17_18 = L17_18 .. "." .. _UPVALUE2_.serverPreference
    L16_17[L17_18] = A7_8
    L17_18 = dhcpv6sTable
    L17_18 = L17_18 .. "." .. _UPVALUE2_.dhcpv6DomainName
    L16_17[L17_18] = A6_7
    L17_18 = dhcpv6sTable
    L17_18 = L17_18 .. "." .. _UPVALUE2_.dhcpv6ServerDnsType
    L16_17[L17_18] = A8_9
    L17_18 = dhcpv6sTable
    L17_18 = L17_18 .. "." .. _UPVALUE2_.ipv6PrimaryDNSServer
    L16_17[L17_18] = A9_10
    L17_18 = dhcpv6sTable
    L17_18 = L17_18 .. "." .. _UPVALUE2_.ipv6SecondaryDNSServer
    L16_17[L17_18] = A9_10
    L17_18 = dhcpv6sTable
    L17_18 = L17_18 .. "." .. _UPVALUE2_.ipv6LeaseTime
    L16_17[L17_18] = A11_12
    L17_18 = dhcpv6sTable
    L17_18 = L17_18 .. "." .. _UPVALUE2_.prefixDelegation
    L16_17[L17_18] = A12_13
    L17_18 = db
    L17_18 = L17_18.insert
    L17_18 = L17_18(dhcpv6sTable, L16_17)
    L14_15 = L17_18
    L17_18 = NIL
    if L14_15 == L17_18 then
      L17_18 = _UPVALUE0_
      L17_18 = L17_18.FAILURE
      return L17_18, cookie
    end
    L17_18 = vlanInterfaceNameGet
    L15_16, L17_18 = interfaceName, L17_18(interfaceName)
    L13_14 = L17_18
    L17_18 = {}
    L17_18[ipv6InterfacesTable .. "." .. _UPVALUE2_.interfaceName] = L15_16
    L14_15 = db.insert(ipv6InterfacesTable, L17_18)
    if L14_15 == NIL then
      return _UPVALUE0_.FAILURE, cookie
    end
    L14_15 = radvdDefaultConfigAdd(interfaceName)
    if L14_15 == NIL then
      return _UPVALUE0_.FAILURE, cookie
    end
  else
    L16_17 = tonumber
    L17_18 = A1_2
    L16_17 = L16_17(L17_18)
    if L16_17 == 0 then
      A3_4 = defaultIp
      A4_5 = defaultPrefixLength
    end
  end
  L16_17 = {}
  L17_18 = subnetTable
  L17_18 = L17_18 .. "." .. _UPVALUE2_.networkInterface
  L16_17[L17_18] = interfaceName
  L17_18 = subnetTable
  L17_18 = L17_18 .. "." .. _UPVALUE2_.ipAddress
  L16_17[L17_18] = A3_4
  L17_18 = subnetTable
  L17_18 = L17_18 .. "." .. _UPVALUE2_.subnetMask
  L16_17[L17_18] = defaultNetmask
  L17_18 = subnetTable
  L17_18 = L17_18 .. "." .. _UPVALUE2_.AddressFamily
  L16_17[L17_18] = IPV6_ADDRESS_FAMILY
  L17_18 = subnetTable
  L17_18 = L17_18 .. "." .. _UPVALUE2_.ispName
  L16_17[L17_18] = defaultIspName
  L17_18 = subnetTable
  L17_18 = L17_18 .. "." .. _UPVALUE2_.prefixLength
  L16_17[L17_18] = A4_5
  L17_18 = subnetTable
  L17_18 = L17_18 .. "." .. _UPVALUE2_.ifGateway
  L16_17[L17_18] = defaultIpv6Gateway
  L17_18 = db
  L17_18 = L17_18.insert
  L17_18 = L17_18(subnetTable, L16_17)
  if L17_18 == NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, cookie
end
function dhcpv6ServerVLANSet(A0_19, A1_20, A2_21, A3_22, A4_23, A5_24, A6_25, A7_26, A8_27, A9_28, A10_29, A11_30, A12_31)
  local L13_32, L14_33, L15_34, L16_35, L17_36, L18_37, L19_38, L20_39, L21_40, L22_41, L23_42, L24_43, L25_44
  L15_34 = _UPVALUE0_
  L15_34 = L15_34.ipv6ModeGet
  L17_36 = L15_34()
  L18_37 = DEFAULT_VLAN
  if A0_19 ~= L18_37 then
    L18_37 = LAN_NAME
    L19_38 = A0_19
    L14_33 = L18_37 .. L19_38
  else
    L14_33 = LAN_NAME
    L18_37 = tonumber
    L19_38 = L17_36
    L18_37 = L18_37(L19_38)
    L19_38 = DUAL_IP_MODE
    if L18_37 == L19_38 then
      L18_37 = DISABLE
      if A1_20 == L18_37 then
        L18_37 = _UPVALUE1_
        L18_37 = L18_37.DEFAULT_VLAN_IPV6_DISABLE_ERROR
        return L18_37
      end
    end
  end
  L18_37 = db
  L18_37 = L18_37.getAttribute
  L19_38 = dhcpv6sTable
  L20_39 = _UPVALUE2_
  L20_39 = L20_39.networkInterface
  L21_40 = L14_33
  L22_41 = ROWID
  L18_37 = L18_37(L19_38, L20_39, L21_40, L22_41)
  L19_38 = vlanInterfaceNameGet
  L20_39 = L14_33
  L20_39 = L19_38(L20_39)
  bdgInterfaceName = L20_39
  L13_32 = L19_38
  L19_38 = db
  L19_38 = L19_38.getAttribute
  L20_39 = ipv6InterfacesTable
  L21_40 = _UPVALUE2_
  L21_40 = L21_40.interfaceName
  L22_41 = bdgInterfaceName
  L23_42 = ROWID
  L19_38 = L19_38(L20_39, L21_40, L22_41, L23_42)
  L20_39 = db
  L20_39 = L20_39.getAttribute
  L21_40 = radvdTable
  L22_41 = _UPVALUE2_
  L22_41 = L22_41.networkInterface
  L23_42 = L14_33
  L24_43 = ROWID
  L20_39 = L20_39(L21_40, L22_41, L23_42, L24_43)
  L21_40 = NIL
  if A1_20 == L21_40 then
    L21_40 = _UPVALUE3_
    L21_40 = L21_40.FAILURE
    return L21_40
  end
  L21_40 = tonumber
  L22_41 = A1_20
  L21_40 = L21_40(L22_41)
  if L21_40 == 1 then
    L21_40 = ipv6VlanPrefixGrpCheck
    L22_41 = A3_22
    L23_42 = A4_23
    L24_43 = A2_21
    L21_40 = L21_40(L22_41, L23_42, L24_43)
    L13_32 = L21_40
    L21_40 = _UPVALUE3_
    L21_40 = L21_40.SUCCESS
    if L13_32 ~= L21_40 then
      return L13_32
    end
    L21_40 = tonumber
    L22_41 = A2_21
    L21_40 = L21_40(L22_41)
    if L21_40 == 1 then
      L21_40 = dhcpv6ConfigCheck
      L22_41 = A5_24
      L23_42 = A6_25
      L24_43 = A7_26
      L25_44 = A8_27
      L21_40 = L21_40(L22_41, L23_42, L24_43, L25_44, A9_28, A10_29, A11_30, A12_31)
      L13_32 = L21_40
      L21_40 = _UPVALUE3_
      L21_40 = L21_40.SUCCESS
      if L13_32 ~= L21_40 then
        return L13_32
      end
    else
      L21_40 = ipv6VlanGet
      L22_41 = A0_19
      A6_25, A7_26, A8_27, A9_28, A10_29, A11_30, A12_31, L21_40 = A9_28, A10_29, A11_30, A12_31, nil, nil, nil, L21_40(L22_41)
      A6_25, A7_26, A8_27, A9_28, A10_29, A11_30, A12_31, L22_41 = A9_28, A10_29, A11_30, A12_31, nil, nil, nil, L21_40(L22_41)
      A6_25, A7_26, A8_27, A9_28, A10_29, A11_30, A12_31, L23_42 = A9_28, A10_29, A11_30, A12_31, nil, nil, nil, L21_40(L22_41)
      A6_25, A7_26, A8_27, A9_28, A10_29, A11_30, A12_31, L24_43 = A9_28, A10_29, A11_30, A12_31, nil, nil, nil, L21_40(L22_41)
      A6_25, A7_26, A8_27, A9_28, A10_29, A11_30, A12_31, L25_44 = A9_28, A10_29, A11_30, A12_31, nil, nil, nil, L21_40(L22_41)
      A5_24 = L25_44
      dhcpv6Server1 = L24_43
      vlanIPv61 = L23_42
      ret = L22_41
      returnCode = L21_40
    end
    L21_40 = {}
    L22_41 = dhcpv6sTable
    L23_42 = "."
    L24_43 = _UPVALUE2_
    L24_43 = L24_43.networkInterface
    L22_41 = L22_41 .. L23_42 .. L24_43
    L21_40[L22_41] = L14_33
    L22_41 = dhcpv6sTable
    L23_42 = "."
    L24_43 = _UPVALUE2_
    L24_43 = L24_43.dhcpv6Server
    L22_41 = L22_41 .. L23_42 .. L24_43
    L21_40[L22_41] = A2_21
    L22_41 = dhcpv6sTable
    L23_42 = "."
    L24_43 = _UPVALUE2_
    L24_43 = L24_43.dhcpv6ServerMode
    L22_41 = L22_41 .. L23_42 .. L24_43
    L21_40[L22_41] = A5_24
    L22_41 = dhcpv6sTable
    L23_42 = "."
    L24_43 = _UPVALUE2_
    L24_43 = L24_43.serverPreference
    L22_41 = L22_41 .. L23_42 .. L24_43
    L21_40[L22_41] = A7_26
    L22_41 = dhcpv6sTable
    L23_42 = "."
    L24_43 = _UPVALUE2_
    L24_43 = L24_43.dhcpv6DomainName
    L22_41 = L22_41 .. L23_42 .. L24_43
    L21_40[L22_41] = A6_25
    L22_41 = dhcpv6sTable
    L23_42 = "."
    L24_43 = _UPVALUE2_
    L24_43 = L24_43.dhcpv6ServerDnsType
    L22_41 = L22_41 .. L23_42 .. L24_43
    L21_40[L22_41] = A8_27
    L22_41 = dhcpv6sTable
    L23_42 = "."
    L24_43 = _UPVALUE2_
    L24_43 = L24_43.ipv6PrimaryDNSServer
    L22_41 = L22_41 .. L23_42 .. L24_43
    L21_40[L22_41] = A9_28
    L22_41 = dhcpv6sTable
    L23_42 = "."
    L24_43 = _UPVALUE2_
    L24_43 = L24_43.ipv6SecondaryDNSServer
    L22_41 = L22_41 .. L23_42 .. L24_43
    L21_40[L22_41] = A10_29
    L22_41 = dhcpv6sTable
    L23_42 = "."
    L24_43 = _UPVALUE2_
    L24_43 = L24_43.ipv6LeaseTime
    L22_41 = L22_41 .. L23_42 .. L24_43
    L21_40[L22_41] = A11_30
    L22_41 = dhcpv6sTable
    L23_42 = "."
    L24_43 = _UPVALUE2_
    L24_43 = L24_43.prefixDelegation
    L22_41 = L22_41 .. L23_42 .. L24_43
    L21_40[L22_41] = A12_31
    L22_41 = _UPVALUE3_
    L22_41 = L22_41.NIL
    if L18_37 == L22_41 then
      L22_41 = db
      L22_41 = L22_41.insert
      L23_42 = dhcpv6sTable
      L24_43 = L21_40
      L22_41 = L22_41(L23_42, L24_43)
      L13_32 = L22_41
      L22_41 = NIL
      if L13_32 == L22_41 then
        L22_41 = _UPVALUE3_
        L22_41 = L22_41.FAILURE
        L23_42 = L18_37
        return L22_41, L23_42
      end
    else
      L22_41 = db
      L22_41 = L22_41.update
      L23_42 = dhcpv6sTable
      L24_43 = L21_40
      L25_44 = L18_37
      L22_41 = L22_41(L23_42, L24_43, L25_44)
      L13_32 = L22_41
      L22_41 = NIL
      if L13_32 == L22_41 then
        L22_41 = _UPVALUE3_
        L22_41 = L22_41.FAILURE
        L23_42 = L18_37
        return L22_41, L23_42
      end
    end
    L22_41 = bdgInterfaceName
    L23_42 = DEFAULT_BDG
    if L22_41 ~= L23_42 then
      L22_41 = _UPVALUE3_
      L22_41 = L22_41.NIL
      if L19_38 == L22_41 then
        L22_41 = {}
        L23_42 = ipv6InterfacesTable
        L24_43 = "."
        L25_44 = _UPVALUE2_
        L25_44 = L25_44.interfaceName
        L23_42 = L23_42 .. L24_43 .. L25_44
        L24_43 = bdgInterfaceName
        L22_41[L23_42] = L24_43
        L23_42 = db
        L23_42 = L23_42.insert
        L24_43 = ipv6InterfacesTable
        L25_44 = L22_41
        L23_42 = L23_42(L24_43, L25_44)
        L13_32 = L23_42
        L23_42 = NIL
        if L13_32 == L23_42 then
          L23_42 = _UPVALUE3_
          L23_42 = L23_42.FAILURE
          L24_43 = L18_37
          return L23_42, L24_43
        end
      end
    end
    L22_41 = _UPVALUE3_
    L22_41 = L22_41.NIL
    if L20_39 == L22_41 then
      L22_41 = radvdDefaultConfigAdd
      L23_42 = L14_33
      L22_41 = L22_41(L23_42)
      status1 = L22_41
      L22_41 = status1
      L23_42 = NIL
      if L22_41 == L23_42 then
        L22_41 = _UPVALUE3_
        L22_41 = L22_41.FAILURE
        L23_42 = L20_39
        return L22_41, L23_42
      end
    end
  else
    L21_40 = _UPVALUE3_
    L21_40 = L21_40.NIL
    if L18_37 ~= L21_40 then
      L21_40 = dhcpv6ServerVLANDelete
      L22_41 = L18_37
      L21_40 = L21_40(L22_41)
      L22_41 = _UPVALUE3_
      L22_41 = L22_41.SUCCESS
      if L21_40 ~= L22_41 then
        return L21_40
      end
    end
    L21_40 = _UPVALUE3_
    L21_40 = L21_40.NIL
    if L19_38 ~= L21_40 then
      L21_40 = db
      L21_40 = L21_40.deleteRow
      L22_41 = ipv6InterfacesTable
      L23_42 = ROWID
      L24_43 = L19_38
      L21_40 = L21_40(L22_41, L23_42, L24_43)
      L22_41 = NIL
      if L21_40 == L22_41 then
        L22_41 = _UPVALUE3_
        L22_41 = L22_41.FAILURE
        L23_42 = L18_37
        return L22_41, L23_42
      end
    end
    L21_40 = _UPVALUE3_
    L21_40 = L21_40.NIL
    if L20_39 ~= L21_40 then
      L21_40 = db
      L21_40 = L21_40.deleteRow
      L22_41 = radvdTable
      L23_42 = ROWID
      L24_43 = L20_39
      L21_40 = L21_40(L22_41, L23_42, L24_43)
      L22_41 = NIL
      if L21_40 == L22_41 then
        L22_41 = _UPVALUE3_
        L22_41 = L22_41.FAILURE
        L23_42 = L18_37
        return L22_41, L23_42
      end
      L22_41 = "interfaceName ='LAN"
      L23_42 = A0_19
      L24_43 = "'"
      L22_41 = L22_41 .. L23_42 .. L24_43
      where = L22_41
      L22_41 = db
      L22_41 = L22_41.deleteRowWhere
      L23_42 = radvdPrefixPoolTable
      L24_43 = where
      L22_41 = L22_41(L23_42, L24_43)
      L23_42 = NIL
      if L22_41 == L23_42 then
        L23_42 = _UPVALUE3_
        L23_42 = L23_42.FAILURE
        L24_43 = L18_37
        return L23_42, L24_43
      end
    end
    A3_22 = ""
  end
  L21_40 = {}
  L22_41 = subnetTable
  L23_42 = "."
  L24_43 = _UPVALUE2_
  L24_43 = L24_43.ipAddress
  L22_41 = L22_41 .. L23_42 .. L24_43
  L21_40[L22_41] = A3_22
  L22_41 = subnetTable
  L23_42 = "."
  L24_43 = _UPVALUE2_
  L24_43 = L24_43.prefixLength
  L22_41 = L22_41 .. L23_42 .. L24_43
  L21_40[L22_41] = A4_23
  L22_41 = _UPVALUE2_
  L22_41 = L22_41.AddressFamily
  L23_42 = " = '"
  L24_43 = IPV6_ADDRESS_FAMILY
  L25_44 = "' and "
  L22_41 = L22_41 .. L23_42 .. L24_43 .. L25_44 .. _UPVALUE2_.networkInterface .. " = '" .. L14_33 .. "'"
  L23_42 = db
  L23_42 = L23_42.getAttributeWhere
  L24_43 = subnetTable
  L25_44 = L22_41
  L23_42 = L23_42(L24_43, L25_44, ROWID)
  L24_43 = db
  L24_43 = L24_43.update
  L25_44 = subnetTable
  L24_43 = L24_43(L25_44, L21_40, L23_42)
  L25_44 = NIL
  if L24_43 == L25_44 then
    L25_44 = _UPVALUE3_
    L25_44 = L25_44.FAILURE
    return L25_44, L18_37
  end
  L25_44 = _UPVALUE2_
  L25_44 = L25_44.vlanId
  L25_44 = L25_44 .. " = '" .. A0_19 .. "'"
  return _UPVALUE3_.SUCCESS, L18_37
end
function VlanIpv6ConfigDelete(A0_45)
  local L1_46, L2_47, L3_48, L4_49
  L4_49 = LAN_NAME
  L1_46 = L4_49 .. A0_45
  L4_49 = db
  L4_49 = L4_49.getAttribute
  L4_49 = L4_49(radvdTable, _UPVALUE0_.networkInterface, L1_46, ROWID)
  L2_47 = L4_49
  L4_49 = _UPVALUE1_
  L4_49 = L4_49.NIL
  if L2_47 ~= L4_49 then
    L4_49 = db
    L4_49 = L4_49.deleteRow
    L4_49 = L4_49(radvdTable, ROWID, L2_47)
    if L4_49 == NIL then
      return _UPVALUE1_.FAILURE, L2_47
    end
  end
  L4_49 = db
  L4_49 = L4_49.getAttribute
  L4_49 = L4_49(dhcpv6sTable, _UPVALUE0_.networkInterface, L1_46, ROWID)
  if L4_49 ~= _UPVALUE1_.NIL then
    L3_48, L2_47 = dhcpv6ServerVLANDelete(L4_49)
  end
  return _UPVALUE1_.SUCCESS, L2_47
end
function dhcpv6ServerVLANDelete(A0_50)
  if db.deleteRow(dhcpv6sTable, ROWID, A0_50) == NIL then
    return _UPVALUE0_.FAILURE, A0_50
  end
  return _UPVALUE0_.SUCCESS, A0_50
end
function dhcpv6ServerVLANDeleteAll()
  local L0_51, L1_52
  L0_51 = _UPVALUE0_
  L0_51 = L0_51.networkInterface
  L1_52 = " != '"
  L0_51 = L0_51 .. L1_52 .. LAN_NAME .. "'"
  L1_52 = db
  L1_52 = L1_52.deleteRowWhere
  L1_52 = L1_52(dhcpv6sTable, L0_51)
  if L1_52 == NIL then
    return _UPVALUE1_.FAILURE, cookie
  end
  L1_52 = db.deleteRowWhere(radvdTable, L0_51)
  if L1_52 == NIL then
    return _UPVALUE1_.FAILURE, cookie
  end
  return _UPVALUE1_.SUCCESS, cookie
end
function ipv6VlanSectionGet(A0_53)
  local L1_54, L2_55, L3_56, L4_57, L5_58, L6_59, L7_60, L8_61, L9_62, L10_63, L11_64, L12_65, L13_66, L14_67, L15_68
  if tonumber(A0_53) == 1 then
    L4_57 = LAN_NAME
  else
    L4_57 = LAN_NAME .. A0_53
  end
  L1_54, L2_55, L5_58, L6_59 = ipv6VlanPrefixGrpGet(L4_57)
  if L1_54 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  L3_56, L2_55, vlanIPv6, L7_60, L8_61, L9_62, L10_63, L11_64, L12_65, L13_66, L14_67, L15_68 = ipv6VlanGet(A0_53)
  if L1_54 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE, L2_55
  end
  return _UPVALUE0_.SUCCESS, L2_55, vlanIPv6, L5_58, L6_59, L7_60, L8_61, L9_62, L10_63, L11_64, L12_65, L13_66, L14_67, L15_68
end
function ipv6VlanPrefixGrpGet(A0_69)
  local L1_70, L2_71, L3_72, L4_73, L5_74
  L1_70 = _UPVALUE0_
  L1_70 = L1_70.networkInterface
  L2_71 = "= '"
  L3_72 = A0_69
  L4_73 = "' AND "
  L5_74 = _UPVALUE0_
  L5_74 = L5_74.AddressFamily
  L1_70 = L1_70 .. L2_71 .. L3_72 .. L4_73 .. L5_74 .. " = 10"
  L2_71 = db
  L2_71 = L2_71.getRowWhere
  L3_72 = subnetTable
  L4_73 = L1_70
  L2_71 = L2_71(L3_72, L4_73)
  L3_72 = _UPVALUE1_
  L3_72 = L3_72.NIL
  if L2_71 == L3_72 then
    L3_72 = _UPVALUE1_
    L3_72 = L3_72.FAILURE
    return L3_72
  end
  L3_72 = subnetTable
  L4_73 = "."
  L5_74 = _UPVALUE0_
  L5_74 = L5_74.ipAddress
  L3_72 = L3_72 .. L4_73 .. L5_74
  L3_72 = L2_71[L3_72]
  L4_73 = subnetTable
  L5_74 = "."
  L4_73 = L4_73 .. L5_74 .. _UPVALUE0_.prefixLength
  L4_73 = L2_71[L4_73]
  L5_74 = db
  L5_74 = L5_74.getAttributeWhere
  L5_74 = L5_74(subnetTable, L1_70, ROWID)
  return _UPVALUE1_.SUCCESS, L5_74, L3_72, L4_73
end
function ipv6VlanGet(A0_75)
  local L1_76, L2_77, L3_78, L4_79, L5_80, L6_81, L7_82, L8_83, L9_84, L10_85, L11_86, L12_87, L13_88, L14_89, L15_90, L16_91
  L3_78 = ""
  L4_79, L5_80, L6_81, L7_82, L8_83, L9_84, L10_85, L11_86, L12_87, L13_88 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L14_89 = _UPVALUE0_
  L14_89 = L14_89.vlanId
  L15_90 = " = '"
  L16_91 = A0_75
  L14_89 = L14_89 .. L15_90 .. L16_91 .. "' and " .. _UPVALUE0_.portName .. " = '" .. DUMMY_PORT .. "'"
  L15_90 = db
  L15_90 = L15_90.getAttributeWhere
  L16_91 = vlanTable
  L15_90 = L15_90(L16_91, L14_89, _UPVALUE0_.vlanIPv6)
  L16_91 = DEFAULT_VLAN
  if A0_75 ~= L16_91 then
    L16_91 = LAN_NAME
    L1_76 = L16_91 .. A0_75
  else
    L1_76 = LAN_NAME
  end
  L16_91 = _UPVALUE0_
  L16_91 = L16_91.networkInterface
  L16_91 = L16_91 .. "= '" .. L1_76 .. "'"
  if db.getRowWhere(dhcpv6sTable, L16_91) == _UPVALUE1_.NIL and tonumber(L15_90) == 0 then
    L4_79, L5_80, L6_81, L7_82, L8_83, L9_84, L10_85, L11_86, L12_87, L13_88 = defaultDhcpv6Config()
  else
    L5_80 = db.getRowWhere(dhcpv6sTable, L16_91)[dhcpv6sTable .. "." .. _UPVALUE0_.dhcpv6Server]
    L6_81 = db.getRowWhere(dhcpv6sTable, L16_91)[dhcpv6sTable .. "." .. _UPVALUE0_.dhcpv6ServerMode]
    L8_83 = db.getRowWhere(dhcpv6sTable, L16_91)[dhcpv6sTable .. "." .. _UPVALUE0_.dhcpv6DomainName]
    L7_82 = db.getRowWhere(dhcpv6sTable, L16_91)[dhcpv6sTable .. "." .. _UPVALUE0_.serverPreference]
    L9_84 = db.getRowWhere(dhcpv6sTable, L16_91)[dhcpv6sTable .. "." .. _UPVALUE0_.dhcpv6ServerDnsType]
    L12_87 = db.getRowWhere(dhcpv6sTable, L16_91)[dhcpv6sTable .. "." .. _UPVALUE0_.ipv6PrimaryDNSServer]
    L13_88 = db.getRowWhere(dhcpv6sTable, L16_91)[dhcpv6sTable .. "." .. _UPVALUE0_.ipv6SecondaryDNSServer]
    L10_85 = db.getRowWhere(dhcpv6sTable, L16_91)[dhcpv6sTable .. "." .. _UPVALUE0_.ipv6LeaseTime]
    L11_86 = db.getRowWhere(dhcpv6sTable, L16_91)[dhcpv6sTable .. "." .. _UPVALUE0_.prefixDelegation]
    L3_78 = db.getAttributeWhere(dhcpv6sTable, L16_91, ROWID)
    L4_79 = _UPVALUE1_.SUCCESS
  end
  return L4_79, L3_78, L15_90, L5_80, L6_81, L8_83, L7_82, L9_84, L12_87, L13_88, L10_85, L11_86
end
function defaultDhcpv6Config()
  local L0_92, L1_93, L2_94, L3_95, L4_96, L5_97, L6_98, L7_99, L8_100, L10_101, L11_102, L12_103, L13_104, L14_105, L15_106, L16_107, L17_108, L18_109
  L0_92 = STATUS_DISABLE
  L1_93 = defaulDhcpV6Mode
  L2_94 = defaultPreference
  L3_95 = defaultDomainName
  L4_96 = defaultDhcpv6sDnsType
  L5_97 = defaultLeaseTime
  L6_98 = defaultPrefixDelegation
  L7_99 = defaultIpv6PrimaryDns
  L8_100 = defaultIpv6SecondaryDns
  L10_101 = _UPVALUE0_
  L10_101 = L10_101.SUCCESS
  L11_102 = L0_92
  L12_103 = L1_93
  L13_104 = L2_94
  L14_105 = L3_95
  L15_106 = L4_96
  L16_107 = L5_97
  L17_108 = L6_98
  L18_109 = L7_99
  return L10_101, L11_102, L12_103, L13_104, L14_105, L15_106, L16_107, L17_108, L18_109, L8_100
end
function ipv6VlanPrefixGrpCheck(A0_110, A1_111, A2_112)
  if A0_110 == _UPVALUE0_.NIL or A0_110 == "" then
    return _UPVALUE1_.PREFIX_NIL
  end
  valid = _UPVALUE2_.ipAddressCheck(10, A0_110)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE1_.INVALID_PREFIX
  end
  if A1_111 == _UPVALUE0_.NIL or A1_111 == "" then
    return _UPVALUE1_.PREFIXLENGTH_NIL
  end
  if tonumber(A1_111) < 1 or tonumber(A1_111) > 128 then
    return _UPVALUE1_.INVALID_PREFIXLENGTH
  end
  if A2_112 == _UPVALUE0_.NIL then
    return _UPVALUE1_.INVALID_DHCPV6_STATUS
  end
  valid = _UPVALUE2_.isBoolean(A2_112)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE1_.INVALID_DHCPV6_STATUS
  end
  if tonumber(A2_112) ~= 0 and tonumber(A2_112) ~= 1 then
    return _UPVALUE1_.INVALID_DHCPV6_STATUS
  end
  return _UPVALUE0_.SUCCESS
end
function dhcpv6ConfigCheck(A0_113, A1_114, A2_115, A3_116, A4_117, A5_118, A6_119, A7_120)
  if A0_113 == _UPVALUE0_.NIL then
    return _UPVALUE1_.DHCPV6_MODE_NIL
  end
  if tonumber(A0_113) ~= STATELESS and tonumber(A0_113) ~= STATEFUL then
    return _UPVALUE1_.INVALID_DHCPV6_MODE
  end
  if A1_114 == _UPVALUE0_.NIL then
    return _UPVALUE1_.DOMAIN_NAME_NIL
  end
  if A2_115 == _UPVALUE0_.NIL then
    return _UPVALUE1_.DHCPV6_SERVER_PREF_NIL
  end
  if tonumber(A2_115) < 0 or tonumber(A2_115) > 255 then
    return _UPVALUE1_.INVALID_DHCPV6_SERVER_PREF
  end
  if A3_116 == _UPVALUE0_.NIL then
    return _UPVALUE1_.DHCPV6_DNSTYPE_NIL
  end
  if tonumber(A3_116) ~= PROXY and tonumber(A3_116) ~= CUSTOM then
    if tonumber(A3_116 ~= ISP) then
      return _UPVALUE1_.INVALID_DHCPV6_DNSTYPE
    end
  end
  if tonumber(A3_116) == CUSTOM and A4_117 == _UPVALUE0_.NIL then
    return _UPVALUE1_.DHCPV6_PRI_DNS_NIL
  end
  if tonumber(A3_116) ~= CUSTOM and A4_117 ~= _UPVALUE0_.NIL then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if tonumber(A3_116) == CUSTOM and A4_117 ~= _UPVALUE0_.NIL then
    valid = _UPVALUE2_.ipAddressCheck(10, A4_117)
    if valid ~= _UPVALUE0_.SUCCESS then
      return _UPVALUE1_.INVALID_DHCPV6_PRI_DNS
    end
    returnCode = _UPVALUE2_.ipv6AddressCheck(A4_117)
    if returnCode ~= _UPVALUE0_.SUCCESS then
      return returnCode
    end
  end
  if tonumber(A3_116) == CUSTOM and A5_118 == _UPVALUE0_.NIL then
    return _UPVALUE1_.DHCPV6_SEC_DNS_NIL
  end
  if tonumber(A3_116) ~= CUSTOM and A5_118 ~= _UPVALUE0_.NIL then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if tonumber(A3_116) == CUSTOM and A5_118 ~= _UPVALUE0_.NIL then
    valid = _UPVALUE2_.ipAddressCheck(10, A5_118)
    if valid ~= _UPVALUE0_.SUCCESS then
      return _UPVALUE1_.INVALID_DHCPV6_SEC_DNS
    end
    returnCode = _UPVALUE2_.ipv6AddressCheck(A5_118)
    if returnCode ~= _UPVALUE0_.SUCCESS then
      return returnCode
    end
  end
  if A6_119 == _UPVALUE0_.NIL then
    return _UPVALUE1_.DHCPV6_LEASE_TIME_NIL
  end
  if tonumber(A6_119) ~= _UPVALUE0_.NIL then
    if tonumber(A6_119) < 0 or tonumber(A6_119) > 604800 then
      return _UPVALUE1_.INVALID_DHCPV6_LEASE_TIME
    end
  else
    return _UPVALUE1_.INVALID_DHCPV6_LEASE_TIME
  end
  if tonumber(A0_113) == STATELESS and A7_120 == _UPVALUE0_.NIL then
    return _UPVALUE1_.DHCPV6_PREFIX_DEL_NIL
  end
  if tonumber(A0_113) == STATELESS then
    valid = _UPVALUE2_.isBoolean(A7_120)
    if valid ~= _UPVALUE0_.SUCCESS then
      return _UPVALUE1_.INVALID_DHCPV6_PREFIX_DEL
    end
  end
  return _UPVALUE0_.SUCCESS
end
function radvdDefaultConfigAdd(A0_121)
  newRadvd = {}
  newRadvd[radvdTable .. "." .. _UPVALUE0_.feature] = "0"
  newRadvd[radvdTable .. "." .. _UPVALUE0_.mode] = "0"
  newRadvd[radvdTable .. "." .. _UPVALUE0_.usePrefixDelegation] = "0"
  newRadvd[radvdTable .. "." .. _UPVALUE0_.interval] = "30"
  newRadvd[radvdTable .. "." .. _UPVALUE0_.mtu] = "1500"
  newRadvd[radvdTable .. "." .. _UPVALUE0_.managed] = "0"
  newRadvd[radvdTable .. "." .. _UPVALUE0_.other] = "1"
  newRadvd[radvdTable .. "." .. _UPVALUE0_.lifetime] = "3600"
  newRadvd[radvdTable .. "." .. _UPVALUE0_.routerPreference] = "3"
  newRadvd[radvdTable .. "." .. _UPVALUE0_.networkInterface] = A0_121
  status1 = db.insert(radvdTable, newRadvd)
  if status1 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS
end
function vlanInterfaceNameGet(A0_122)
  local L1_123
  L1_123 = db
  L1_123 = L1_123.getAttribute
  L1_123 = L1_123(networkInterfaceTable, _UPVALUE0_.networkInterface, A0_122, _UPVALUE0_.interfaceName)
  if L1_123 == NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_123
end
