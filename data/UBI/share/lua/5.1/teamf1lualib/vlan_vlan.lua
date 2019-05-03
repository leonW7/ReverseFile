local L0_0
L0_0 = module
L0_0("com.teamf1.core.vlan.vlan", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vlan_returnCodes")
L0_0 = require
L0_0("teamf1lualib/vlan_validation")
L0_0 = require
L0_0("teamf1lualib/fwIpv4firewallRules")
L0_0 = require
L0_0("teamf1lualib/services_upnp")
L0_0 = require
L0_0("teamf1lualib/vlan_captivePortal")
L0_0 = require
L0_0("teamf1lualib/accounting_core")
L0_0 = require
L0_0("teamf1lualib/authentication_radius")
L0_0 = require
L0_0("teamf1lualib/ipv6_mode")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.authentication.radius")
lanaddresspoolsTable = "dhcpv6sLANAddrPool"
radvdLANPrefixPoolTable = "radvdLANPrefixPool"
lanprefixpoolsTable = "dhcpv6sLANPrefixPool"
vlanTable = "vlan"
intervlanTable = "interVLANRouting"
intervlanTbl = "interVLAN"
subnetTable = "ifStatic"
dhcpTable = "dhcp"
dhcpRelayTable = "DhcpRelay"
networkInterfaceTable = "networkInterface"
ipAddressTable = "ipAddressTable"
webAccessTable = "webAccessInfo"
configPortTable = "ConfigPort"
vlanPSEntryTable = "vlanPSEEntry"
vlanPortMgmtTable = "VlanPortMgmt"
defaultGrpInfoTable = "DefaultIfGrpInfo"
vlanStatusTable = "VlanStatus"
igmpPortMapTbl = "igmpPortMap"
serviceRouteTable = "ServicesRouteMgmt"
ipv6InterfacesTable = "ipv6Interfaces"
sessionLimitTable = "sessionLimitProfiles"
;({}).vlanId = "vlanId"
;({}).name = "vlanName"
;({}).interVlanRouting = "status"
;({}).vlanSubnetting = "vlanSubnetting"
;({}).ipAddress = "StaticIp"
;({}).subnetMask = "NetMask"
;({}).dhcpType = "dhcpEnabled"
;({}).gateWay = "Gateway"
;({}).dnsProxy = "enableDnsProxy"
;({}).dhcpRelayIpAddress = "RelayGateway"
;({}).portName = "portName"
;({}).ifName = "ifName"
;({}).accessType = "accessType"
;({}).logicalIfName = "logicalIfName"
;({}).interfaceName = "LogicalIfName"
;({}).addressFamily = "AddressFamily"
;({}).virtualIfName = "virtualIfName"
;({}).DhcpRelayStatus = "DhcpRelayStatus"
;({}).networkInterfaceName = "interfaceName"
;({}).VirtualIfName = "VirtualIfName"
;({}).ConnectionType = "ConnectionType"
;({}).ConnectionType6 = "ConnectionType6"
;({}).ifType = "ifType"
;({}).MTU = "MTU"
;({}).ipAddr = "ipaddr"
;({}).subnetmask = "subnetmask"
;({}).gateway = "gateway"
;({}).IfStatus = "IfStatus"
;({}).refreshInterval = "refreshInterval"
;({}).autoRefreshFlag = "autoRefreshFlag"
;({}).capabilities = "capabilities"
;({}).restartFwForMe = "restartFwForMe"
;({}).ifGroupId = "ifGroupId"
;({}).oldState = "oldState"
;({}).dhcpEnabled = "dhcpEnabled"
;({}).portType = "PortType"
;({}).defaultPVID = "DefaultPVID"
;({}).portVlanMode = "PortVlanMode"
;({}).vlanState = "VlanState"
;({}).igmpPortMap = "igmpPortMap"
;({}).sourceIPAddress = "sourceIPAddress"
;({}).vlanIPv6 = "vlanIPv6"
;({}).sessInterface = "interface"
;({}).dns1 = "dns1"
;({}).dns2 = "dns2"
;({}).DHCP = "DHCP"
;({}).vlanIndex = "vlanIndex"
;({}).ifgroupId = "IfGroupId"
BRIDGE_CONNECTION = "bridge"
STATIC_CONNECTION = "ifStatic"
DEFAULT_MTU = "1500"
REFRESH_TIME = "5"
DefaultVlan = "1"
COOKIE = "cookie"
IPv6_CAP = "3"
;({}).AddressFamily = "addressFamily"
;({}).isStatic = "isStatic"
;({}).ipaddress = "ipAddress"
;({}).ipDstAddres = "ipDstAddres"
;({}).ipv6PrefixLen = "ipv6PrefixLen"
;({}).subnetMaskIp = "subnetMask"
VlanOverWanTable = "VlanOverWan"
VlanOverWanTableAttr = {}
VlanOverWanTableAttr.VlanID = "VlanId"
usbSharePortTable = "SharePortVlan"
;({}).attribute = {}
;({}).attribute.vlanId = "vlanId"
;({}).attribute.vlanName = "vlanName"
;({}).attribute.interfaceName = "interfaceName"
;({}).attribute.storageSharing = "storageSharing"
;({}).attribute.printerSharing = "printerSharing"
tcpdumpTable = "tcpdump"
;({}).attribute = {}
;({}).attribute.LogicalIfName = "LogicalIfName"
;({}).attribute.tcpdumpEnabled = "tcpdumpEnabled"
zonesTable = "Zones"
;({}).attribute = {}
;({}).attribute.zonetype = "ZoneType"
;({}).attribute.zonelogicalIfname = "ZoneLogicalIfName"
dhcpWorkType = {}
dhcpWorkType.none = "None"
dhcpWorkType.server = "Server"
dhcpWorkType.relay = "Relay"
ENABLE = "1"
DISABLE = "0"
IPV6_ENABLE = 1
vlanMinNumber = 1
vlanMaxNumber = 4093
ROWID = "_ROWID_"
LAN_NAME = "LAN"
DMZ_NAME = "DMZ"
WAN1_NAME = "WAN1"
WAN2_NAME = "WAN2"
BDG_NAME = "bdg"
DEFAULT_BDG = "bdg1"
DUMMY_PORT = "dummy"
PORT10 = "port10"
PORT100 = "port100"
PORT200 = "port200"
DEFAULT_ACCESSTYPE = "0"
DEFAULT_GATEWAY = "0.0.0.0"
DEFAULT_RELAY_ADDRESS = "0.0.0.0"
IPV4_ADDRESS_FAMILY = "2"
DEFAULT_VLANID = "1"
VLAN_LOCAL_ID = "4094"
DMZ_LOCAL_ID = "4093"
MIN_NAME_LENGTH = "1"
MAX_NAME_LENGTH = "25"
LOOPBACK_ADDRESS = "127.0.0.0"
LOOPBACK_SUBNET = "255.0.0.0"
DEFAULTADDRESS = "0.0.0.0"
firewallRuleFromZoneId = "FirewallRules.FromZoneVlanId"
firewallRuleToZoneId = "FirewallRules.ToZoneVlanId"
voiceVlanName = "voiceVlan"
firewallRuleTable = "FirewallRules"
ProtocolVlanConfigTable = "ProtocolVlanConfig"
VoiceVlanInterfaceConfigTable = "VoiceVlanInterfaceConfig"
MacVlanConfigTable = "MacVlanConfig"
;({}).interface = "interfaceName"
function vlanNameByIdGet(A0_1)
  local L1_2
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(vlanTable, _UPVALUE0_.vlanId, A0_1, _UPVALUE0_.name)
  if L1_2 == NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_2
end
function ipv6StatusGet(A0_3)
  local L1_4
  L1_4 = db
  L1_4 = L1_4.getAttribute
  L1_4 = L1_4(vlanTable, _UPVALUE0_.name, A0_3, "vlanIPv6")
  if L1_4 == NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_4
end
function wanVlanIDConfiguredCheck(A0_5)
  local L1_6, L2_7, L3_8
  L1_6 = _UPVALUE0_
  L1_6 = L1_6.NIL
  L2_7 = _UPVALUE0_
  L2_7 = L2_7.SUCCESS
  L3_8 = _UPVALUE0_
  L3_8 = L3_8.NIL
  L1_6 = "VlanPortMode=2 and VlanId=" .. A0_5
  L3_8 = db.existsRowWhere(VlanOverWanTable, L1_6)
  if L3_8 ~= false then
    L2_7 = _UPVALUE1_.COMP_VLAN_VLANID_ALREADY_EXISTS
  end
  return L2_7
end
function vlanIdGet()
  local L0_9, L1_10
  L0_9 = firstCookieGet
  L1_10 = vlanTable
  L0_9 = L0_9(L1_10)
  L1_10 = db
  L1_10 = L1_10.getAttribute
  L1_10 = L1_10(vlanTable, ROWID, L0_9, _UPVALUE0_.vlanId)
  if L1_10 == NIL then
    return _UPVALUE1_.FAILURE, L0_9
  end
  return _UPVALUE1_.SUCCESS, L0_9, L1_10
end
function vlanIdGetAll()
  local L0_11, L1_12
  L0_11 = "SELECT * from "
  L1_12 = vlanTable
  L0_11 = L0_11 .. L1_12 .. " where portName ='" .. DUMMY_PORT .. "'"
  L1_12 = db
  L1_12 = L1_12.getTable
  L1_12 = L1_12(vlanTable, false, L0_11)
  if L1_12 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_12
end
function vlanIdNameGetAll()
  local L0_13, L1_14
  L0_13 = "SELECT "
  L1_14 = _UPVALUE0_
  L1_14 = L1_14.vlanId
  L0_13 = L0_13 .. L1_14 .. "," .. _UPVALUE0_.name .. " from " .. vlanTable .. " where portName ='" .. DUMMY_PORT .. "'"
  L1_14 = db
  L1_14 = L1_14.getTable
  L1_14 = L1_14(vlanTable, false, L0_13)
  if L1_14 == NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_14
end
function vlanIdGetNext(A0_15)
  local L1_16, L2_17, L3_18
  L1_16 = nextCookieGet
  L2_17 = A0_15
  L3_18 = vlanTable
  L2_17 = L1_16(L2_17, L3_18)
  L3_18 = FALSE
  if L1_16 == L3_18 then
    L3_18 = NIL
    if L2_17 == L3_18 then
      L3_18 = _UPVALUE0_
      L3_18 = L3_18.NEXT_ROWID_INVALID
      return L3_18
    else
      L3_18 = _UPVALUE0_
      L3_18 = L3_18.INVALID_COOKIE
      return L3_18
    end
  end
  L3_18 = db
  L3_18 = L3_18.getAttribute
  L3_18 = L3_18(vlanTable, ROWID, L1_16, _UPVALUE1_.vlanId)
  if L3_18 == NIL then
    return _UPVALUE0_.FAILURE, L1_16
  end
  return _UPVALUE0_.SUCCESS, L1_16, L3_18
end
function vlanIdSet(A0_19, A1_20)
  local L3_21
  L3_21 = _UPVALUE0_
  L3_21 = L3_21.NOT_SUPPORTED
  return L3_21, A0_19
end
function vlanIdDelete(A0_22)
  local L1_23
  L1_23 = checkCookieExists
  L1_23 = L1_23(A0_22, vlanTable)
  if L1_23 == FALSE then
    L1_23 = _UPVALUE0_
    L1_23 = L1_23.INVALID_COOKIE
    return L1_23
  end
  L1_23 = db
  L1_23 = L1_23.getAttribute
  L1_23 = L1_23(vlanTable, ROWID, A0_22, _UPVALUE1_.vlanId)
  if L1_23 == NIL then
    return _UPVALUE0_.FAILURE, A0_22
  end
  if L1_23 == DefaultVlan then
    return _UPVALUE0_.NOT_SUPPORTED, A0_22
  end
  if db.deleteRow(vlanTable, ROWID, A0_22) == NIL then
    return _UPVALUE0_.FAILURE, A0_22
  end
  if db.deleteRow(intervlanTable, _UPVALUE1_.vlanId, L1_23) == NIL then
    return _UPVALUE0_.FAILURE, A0_22
  end
  if db.deleteRow(subnetTable, _UPVALUE1_.interfaceName, lanName) == NIL then
    return _UPVALUE0_.FAILURE, A0_22
  end
  if db.deleteRow(dhcpRelayTable, _UPVALUE1_.interfaceName, lanName) == NIL then
    return _UPVALUE0_.FAILURE, A0_22
  end
  if db.deleteRow(dhcpTable, _UPVALUE1_.logicalIfName, lanName) == NIL then
    return _UPVALUE0_.FAILURE, A0_22
  end
  return _UPVALUE0_.SUCCESS, A0_22
end
function nameGet(A0_24)
  local L1_25
  L1_25 = db
  L1_25 = L1_25.getAttribute
  L1_25 = L1_25(vlanTable, ROWID, A0_24, _UPVALUE0_.name)
  if L1_25 == NIL then
    return _UPVALUE1_.FAILURE, A0_24
  end
  return _UPVALUE1_.SUCCESS, A0_24, L1_25
end
function nameGetNext(A0_26)
  local L1_27, L2_28, L3_29
  L1_27 = nextCookieGet
  L2_28 = A0_26
  L3_29 = vlanTable
  L2_28 = L1_27(L2_28, L3_29)
  L3_29 = FALSE
  if L1_27 == L3_29 then
    L3_29 = NIL
    if L2_28 == L3_29 then
      L3_29 = _UPVALUE0_
      L3_29 = L3_29.NEXT_ROWID_INVALID
      return L3_29
    else
      L3_29 = _UPVALUE0_
      L3_29 = L3_29.INVALID_COOKIE
      return L3_29
    end
  end
  L3_29 = db
  L3_29 = L3_29.getAttribute
  L3_29 = L3_29(vlanTable, ROWID, L1_27, _UPVALUE1_.name)
  if L3_29 == NIL then
    return _UPVALUE0_.FAILURE, L1_27
  end
  return _UPVALUE0_.SUCCESS, L1_27, L3_29
end
function nameSet(A0_30, A1_31)
  local L3_32
  L3_32 = _UPVALUE0_
  L3_32 = L3_32.NOT_SUPPORTED
  return L3_32, A0_30
end
function isinterVlanRoutingEnabled()
  local L0_33, L1_34, L2_35
  L0_33 = firstCookieGet
  L1_34 = vlanTable
  L0_33 = L0_33(L1_34)
  L1_34 = db
  L1_34 = L1_34.getAttribute
  L2_35 = vlanTable
  L1_34 = L1_34(L2_35, ROWID, L0_33, _UPVALUE0_.vlanId)
  L2_35 = NIL
  if L1_34 == L2_35 then
    L2_35 = _UPVALUE1_
    L2_35 = L2_35.FAILURE
    return L2_35, L0_33
  end
  L2_35 = db
  L2_35 = L2_35.getAttribute
  L2_35 = L2_35(intervlanTable, _UPVALUE0_.vlanId, L1_34, _UPVALUE0_.interVlanRouting)
  if L2_35 == NIL then
    return _UPVALUE1_.FAILURE, L0_33
  end
  return _UPVALUE1_.SUCCESS, L0_33, L2_35
end
function isinterVlanRoutingEnabledNext(A0_36)
  local L1_37, L2_38, L3_39, L4_40
  L1_37 = nextCookieGet
  L2_38 = A0_36
  L3_39 = vlanTable
  L2_38 = L1_37(L2_38, L3_39)
  L3_39 = FALSE
  if L1_37 == L3_39 then
    L3_39 = NIL
    if L2_38 == L3_39 then
      L3_39 = _UPVALUE0_
      L3_39 = L3_39.NEXT_ROWID_INVALID
      return L3_39
    else
      L3_39 = _UPVALUE0_
      L3_39 = L3_39.INVALID_COOKIE
      return L3_39
    end
  end
  L3_39 = db
  L3_39 = L3_39.getAttribute
  L4_40 = vlanTable
  L3_39 = L3_39(L4_40, ROWID, L1_37, _UPVALUE1_.vlanId)
  L4_40 = NIL
  if L3_39 == L4_40 then
    L4_40 = _UPVALUE0_
    L4_40 = L4_40.FAILURE
    return L4_40, A0_36
  end
  L4_40 = db
  L4_40 = L4_40.getAttribute
  L4_40 = L4_40(intervlanTable, _UPVALUE1_.vlanId, L3_39, _UPVALUE1_.interVlanRouting)
  if L4_40 == NIL then
    return _UPVALUE0_.FAILURE, L1_37
  end
  return _UPVALUE0_.SUCCESS, L1_37, L4_40
end
function interVlanRoutingEnable(A0_41)
  local L1_42
  L1_42 = checkCookieExists
  L1_42 = L1_42(A0_41, vlanTable)
  if L1_42 == FALSE then
    L1_42 = _UPVALUE0_
    L1_42 = L1_42.INVALID_COOKIE
    return L1_42
  end
  L1_42 = db
  L1_42 = L1_42.getAttribute
  L1_42 = L1_42(vlanTable, ROWID, rowId, _UPVALUE1_.vlanId)
  if L1_42 == NIL then
    return _UPVALUE0_.FAILURE, A0_41
  end
  if db.setAttribute(intervlanTable, _UPVALUE1_.vlanId, L1_42, ENABLE) == NIL then
    return _UPVALUE0_.FAILURE, A0_41
  end
  return _UPVALUE0_.SUCCESS, A0_41
end
function interVlanRoutingDisable(A0_43)
  if checkCookieExists(A0_43, vlanTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if db.getAttribute(vlanTable, ROWID, A0_43, _UPVALUE1_.vlanId) == NIL then
    return _UPVALUE0_.FAILURE, A0_43
  end
  if db.setAttribute(intervlanTable, _UPVALUE1_.vlanId, _UPVALUE1_.interVlanRouting, DISABLE) == NIL then
    return _UPVALUE0_.FAILURE, A0_43
  end
  return _UPVALUE0_.SUCCESS, A0_43
end
function ipAddressGet()
  local L0_44, L1_45, L2_46, L3_47
  L0_44 = firstCookieGet
  L1_45 = vlanTable
  L0_44 = L0_44(L1_45)
  L1_45 = db
  L1_45 = L1_45.getAttribute
  L2_46 = vlanTable
  L3_47 = ROWID
  L1_45 = L1_45(L2_46, L3_47, L0_44, _UPVALUE0_.vlanId)
  L2_46 = NIL
  if L1_45 == L2_46 then
    L2_46 = _UPVALUE1_
    L2_46 = L2_46.FAILURE
    L3_47 = L0_44
    return L2_46, L3_47
  end
  L2_46 = nil
  if L1_45 == "1" then
    L2_46 = LAN_NAME
  else
    L3_47 = LAN_NAME
    L2_46 = L3_47 .. L1_45
  end
  L3_47 = db
  L3_47 = L3_47.getAttribute
  L3_47 = L3_47(subnetTable, _UPVALUE0_.logicalIfName, L2_46, _UPVALUE0_.ipAddress)
  if L3_47 == NIL then
    return _UPVALUE1_.FAILURE, L0_44
  end
  return _UPVALUE1_.SUCCESS, L0_44, L3_47
end
function ipAddressGetNext(A0_48)
  local L1_49, L2_50, L3_51, L4_52, L5_53
  L1_49 = nextCookieGet
  L2_50 = A0_48
  L3_51 = vlanTable
  L2_50 = L1_49(L2_50, L3_51)
  L3_51 = FALSE
  if L1_49 == L3_51 then
    L3_51 = NIL
    if L2_50 == L3_51 then
      L3_51 = _UPVALUE0_
      L3_51 = L3_51.NEXT_ROWID_INVALID
      return L3_51
    else
      L3_51 = _UPVALUE0_
      L3_51 = L3_51.INVALID_COOKIE
      return L3_51
    end
  end
  L3_51 = db
  L3_51 = L3_51.getAttribute
  L4_52 = vlanTable
  L5_53 = ROWID
  L3_51 = L3_51(L4_52, L5_53, L1_49, _UPVALUE1_.vlanId)
  L4_52 = NIL
  if L3_51 == L4_52 then
    L4_52 = _UPVALUE0_
    L4_52 = L4_52.FAILURE
    L5_53 = A0_48
    return L4_52, L5_53
  end
  L4_52 = nil
  if L3_51 == "1" then
    L4_52 = LAN_NAME
  else
    L5_53 = LAN_NAME
    L4_52 = L5_53 .. L3_51
  end
  L5_53 = db
  L5_53 = L5_53.getAttribute
  L5_53 = L5_53(subnetTable, _UPVALUE1_.interfaceName, L4_52, _UPVALUE1_.ipAddress)
  if L5_53 == NIL then
    return _UPVALUE0_.FAILURE, A0_48
  end
  return _UPVALUE0_.SUCCESS, A0_48, L5_53
end
function ipAddressSet(A0_54, A1_55)
  local L2_56, L3_57
  L2_56 = checkCookieExists
  L3_57 = A0_54
  L2_56 = L2_56(L3_57, vlanTable)
  L3_57 = FALSE
  if L2_56 == L3_57 then
    L2_56 = _UPVALUE0_
    L2_56 = L2_56.INVALID_COOKIE
    return L2_56
  end
  L2_56 = NIL
  if A1_55 == L2_56 then
    L2_56 = _UPVALUE0_
    L2_56 = L2_56.INVALID_ARGUMENT
    return L2_56
  end
  L2_56 = _UPVALUE1_
  L2_56 = L2_56.ipAddressCheck
  L3_57 = IPV4_ADDRESS_FAMILY
  L2_56 = L2_56(L3_57, A1_55)
  valid = L2_56
  L2_56 = valid
  L3_57 = _UPVALUE0_
  L3_57 = L3_57.ERROR
  if L2_56 == L3_57 then
    L2_56 = _UPVALUE0_
    L2_56 = L2_56.INVALID_ARGUMENT
    return L2_56
  end
  L2_56 = db
  L2_56 = L2_56.getAttribute
  L3_57 = vlanTable
  L2_56 = L2_56(L3_57, ROWID, A0_54, _UPVALUE2_.vlanId)
  L3_57 = NIL
  if L2_56 == L3_57 then
    L3_57 = _UPVALUE0_
    L3_57 = L3_57.FAILURE
    return L3_57, A0_54
  end
  L3_57 = nil
  if L2_56 == "1" then
    L3_57 = LAN_NAME
  else
    L3_57 = LAN_NAME .. L2_56
  end
  if db.setAttribute(subnetTable, _UPVALUE2_.interfaceName, L3_57, _UPVALUE2_.ipAddress, A1_55) == NIL then
    return _UPVALUE0_.FAILURE, A0_54
  end
  return _UPVALUE0_.SUCCESS, A0_54
end
function subnetMaskGet()
  local L0_58, L1_59, L2_60, L3_61
  L0_58 = firstCookieGet
  L1_59 = vlanTable
  L0_58 = L0_58(L1_59)
  L1_59 = db
  L1_59 = L1_59.getAttribute
  L2_60 = vlanTable
  L3_61 = ROWID
  L1_59 = L1_59(L2_60, L3_61, L0_58, _UPVALUE0_.vlanId)
  L2_60 = NIL
  if L1_59 == L2_60 then
    L2_60 = _UPVALUE1_
    L2_60 = L2_60.FAILURE
    L3_61 = L0_58
    return L2_60, L3_61
  end
  L2_60 = nil
  if L1_59 == "1" then
    L2_60 = LAN_NAME
  else
    L3_61 = LAN_NAME
    L2_60 = L3_61 .. L1_59
  end
  L3_61 = db
  L3_61 = L3_61.getAttribute
  L3_61 = L3_61(subnetTable, _UPVALUE0_.interfaceName, L2_60, _UPVALUE0_.subnetMask)
  if L3_61 == NIL then
    return _UPVALUE1_.FAILURE, L0_58
  end
  return _UPVALUE1_.SUCCESS, L0_58, L3_61
end
function subnetMaskGetNext(A0_62)
  local L1_63, L2_64, L3_65, L4_66, L5_67
  L1_63 = nextCookieGet
  L2_64 = A0_62
  L3_65 = vlanTable
  L2_64 = L1_63(L2_64, L3_65)
  L3_65 = FALSE
  if L1_63 == L3_65 then
    L3_65 = NIL
    if L2_64 == L3_65 then
      L3_65 = _UPVALUE0_
      L3_65 = L3_65.NEXT_ROWID_INVALID
      return L3_65
    else
      L3_65 = _UPVALUE0_
      L3_65 = L3_65.INVALID_COOKIE
      return L3_65
    end
  end
  L3_65 = db
  L3_65 = L3_65.getAttribute
  L4_66 = vlanTable
  L5_67 = ROWID
  L3_65 = L3_65(L4_66, L5_67, L1_63, _UPVALUE1_.vlanId)
  L4_66 = NIL
  if L3_65 == L4_66 then
    L4_66 = _UPVALUE0_
    L4_66 = L4_66.FAILURE
    L5_67 = A0_62
    return L4_66, L5_67
  end
  L4_66 = nil
  if L3_65 == "1" then
    L4_66 = LAN_NAME
  else
    L5_67 = LAN_NAME
    L4_66 = L5_67 .. L3_65
  end
  L5_67 = db
  L5_67 = L5_67.getAttribute
  L5_67 = L5_67(subnetTable, _UPVALUE1_.interfaceName, L4_66, _UPVALUE1_.subnetMask)
  if L5_67 == NIL then
    return _UPVALUE0_.FAILURE, A0_62
  end
  return _UPVALUE0_.SUCCESS, A0_62, L5_67
end
function subnetMaskSet(A0_68, A1_69)
  local L2_70, L3_71
  L2_70 = NIL
  if A1_69 == L2_70 then
    L2_70 = _UPVALUE0_
    L2_70 = L2_70.INVALID_ARGUMENT
    return L2_70
  end
  L2_70 = _UPVALUE1_
  L2_70 = L2_70.ipAddressCheck
  L3_71 = IPV4_ADDRESS_FAMILY
  L2_70 = L2_70(L3_71, A1_69)
  valid = L2_70
  L2_70 = valid
  L3_71 = _UPVALUE0_
  L3_71 = L3_71.ERROR
  if L2_70 == L3_71 then
    L2_70 = _UPVALUE0_
    L2_70 = L2_70.INVALID_ARGUMENT
    return L2_70
  end
  L2_70 = checkCookieExists
  L3_71 = A0_68
  L2_70 = L2_70(L3_71, vlanTable)
  L3_71 = FALSE
  if L2_70 == L3_71 then
    L2_70 = _UPVALUE0_
    L2_70 = L2_70.INVALID_COOKIE
    return L2_70
  end
  L2_70 = db
  L2_70 = L2_70.getAttribute
  L3_71 = vlanTable
  L2_70 = L2_70(L3_71, ROWID, A0_68, _UPVALUE2_.vlanId)
  L3_71 = NIL
  if L2_70 == L3_71 then
    L3_71 = _UPVALUE0_
    L3_71 = L3_71.FAILURE
    return L3_71, A0_68
  end
  L3_71 = nil
  if L2_70 == "1" then
    L3_71 = LAN_NAME
  else
    L3_71 = LAN_NAME .. L2_70
  end
  if db.setAttribute(subnetTable, _UPVALUE2_.interfaceName, L3_71, _UPVALUE2_.subnetMask, A1_69) == NIL then
    return _UPVALUE0_.FAILURE, A0_68
  end
  return _UPVALUE0_.SUCCESS, A0_68
end
function dhcpTypeGet()
  local L0_72, L1_73, L2_74, L3_75, L4_76, L5_77
  L0_72 = firstCookieGet
  L1_73 = vlanTable
  L0_72 = L0_72(L1_73)
  L1_73 = db
  L1_73 = L1_73.getAttribute
  L2_74 = vlanTable
  L3_75 = ROWID
  L4_76 = L0_72
  L5_77 = _UPVALUE0_
  L5_77 = L5_77.vlanId
  L1_73 = L1_73(L2_74, L3_75, L4_76, L5_77)
  L2_74 = NIL
  if L1_73 == L2_74 then
    L2_74 = _UPVALUE1_
    L2_74 = L2_74.FAILURE
    L3_75 = L0_72
    return L2_74, L3_75
  end
  L2_74 = nil
  if L1_73 == "1" then
    L2_74 = LAN_NAME
  else
    L3_75 = LAN_NAME
    L4_76 = vlanID
    L2_74 = L3_75 .. L4_76
  end
  L3_75 = db
  L3_75 = L3_75.getAttribute
  L4_76 = dhcpTable
  L5_77 = _UPVALUE0_
  L5_77 = L5_77.logicalIfName
  L3_75 = L3_75(L4_76, L5_77, L2_74, _UPVALUE0_.dhcpType)
  L4_76 = db
  L4_76 = L4_76.getAttribute
  L5_77 = dhcpRelayTable
  L4_76 = L4_76(L5_77, _UPVALUE0_.interfaceName, L2_74, _UPVALUE0_.DhcpRelayStatus)
  L5_77 = nil
  if L3_75 == DISABLE and L4_76 == DISABLE then
    L5_77 = dhcpWorkType.none
  elseif L3_75 == ENABLE then
    L5_77 = dhcpWorkType.server
  elseif L4_76 == ENABLE then
    L5_77 = dhcpWorkType.relay
  end
  if L5_77 == NIL then
    return _UPVALUE1_.FAILURE, L0_72
  end
  return _UPVALUE1_.SUCCESS, L0_72, L5_77
end
function dhcpTypeGetNext(A0_78)
  local L1_79, L2_80, L3_81, L4_82, L5_83, L6_84, L7_85
  L1_79 = nextCookieGet
  L2_80 = A0_78
  L3_81 = vlanTable
  L2_80 = L1_79(L2_80, L3_81)
  L3_81 = FALSE
  if L1_79 == L3_81 then
    L3_81 = NIL
    if L2_80 == L3_81 then
      L3_81 = _UPVALUE0_
      L3_81 = L3_81.NEXT_ROWID_INVALID
      return L3_81
    else
      L3_81 = _UPVALUE0_
      L3_81 = L3_81.INVALID_COOKIE
      return L3_81
    end
  end
  L3_81 = db
  L3_81 = L3_81.getAttribute
  L4_82 = vlanTable
  L5_83 = ROWID
  L6_84 = L1_79
  L7_85 = _UPVALUE1_
  L7_85 = L7_85.vlanId
  L3_81 = L3_81(L4_82, L5_83, L6_84, L7_85)
  L4_82 = NIL
  if L3_81 == L4_82 then
    L4_82 = _UPVALUE0_
    L4_82 = L4_82.FAILURE
    L5_83 = A0_78
    return L4_82, L5_83
  end
  L4_82 = nil
  if L3_81 == "1" then
    L4_82 = LAN_NAME
  else
    L5_83 = LAN_NAME
    L6_84 = L3_81
    L4_82 = L5_83 .. L6_84
  end
  L5_83 = db
  L5_83 = L5_83.getAttribute
  L6_84 = dhcpTable
  L7_85 = _UPVALUE1_
  L7_85 = L7_85.logicalIfName
  L5_83 = L5_83(L6_84, L7_85, L4_82, _UPVALUE1_.dhcpType)
  L6_84 = db
  L6_84 = L6_84.getAttribute
  L7_85 = dhcpRelayTable
  L6_84 = L6_84(L7_85, _UPVALUE1_.interfaceName, L4_82, _UPVALUE1_.DhcpRelayStatus)
  L7_85 = nil
  if L5_83 == DISABLE and L6_84 == DISABLE then
    L7_85 = dhcpWorkType.none
  elseif L5_83 == ENABLE then
    L7_85 = dhcpWorkType.server
  elseif L6_84 == ENABLE then
    L7_85 = dhcpWorkType.relay
  end
  if L7_85 == NIL then
    return _UPVALUE0_.FAILURE, A0_78
  end
  return _UPVALUE0_.SUCCESS, A0_78, L7_85
end
function dhcpTypeSet(A0_86, A1_87)
  local L2_88, L3_89, L4_90, L5_91
  L2_88 = checkCookieExists
  L3_89 = A0_86
  L4_90 = vlanTable
  L2_88 = L2_88(L3_89, L4_90)
  L3_89 = FALSE
  if L2_88 == L3_89 then
    L2_88 = _UPVALUE0_
    L2_88 = L2_88.INVALID_COOKIE
    return L2_88
  end
  L2_88 = db
  L2_88 = L2_88.getAttribute
  L3_89 = vlanTable
  L4_90 = ROWID
  L5_91 = A0_86
  L2_88 = L2_88(L3_89, L4_90, L5_91, _UPVALUE1_.vlanId)
  L3_89 = NIL
  if L2_88 == L3_89 then
    L3_89 = _UPVALUE0_
    L3_89 = L3_89.FAILURE
    L4_90 = A0_86
    return L3_89, L4_90
  end
  L3_89 = nil
  if L2_88 == "1" then
    L3_89 = LAN_NAME
  else
    L4_90 = LAN_NAME
    L5_91 = L2_88
    L3_89 = L4_90 .. L5_91
  end
  L4_90 = NIL
  if A1_87 == L4_90 then
    L4_90 = _UPVALUE0_
    L4_90 = L4_90.INVALID_ARGUMENT
    return L4_90
  end
  L4_90 = dhcpWorkType
  L4_90 = L4_90.none
  if A1_87 ~= L4_90 then
    L4_90 = dhcpWorkType
    L4_90 = L4_90.server
    if A1_87 ~= L4_90 then
      L4_90 = dhcpWorkType
      L4_90 = L4_90.relay
      if A1_87 ~= L4_90 then
        L4_90 = _UPVALUE0_
        L4_90 = L4_90.INVALID_ARGUMENT
        return L4_90
      end
    end
  end
  L4_90, L5_91 = nil, nil
  if A1_87 == dhcpWorkType.none then
    L4_90 = DISABLE
    L5_91 = DISABLE
  elseif A1_87 == dhcpWorkType.server then
    L4_90 = ENABLE
    L5_91 = DISABLE
  elseif A1_87 == dhcpWorkType.relay then
    L4_90 = DISABLE
    L5_91 = ENABLE
  end
  if db.setAttribute(dhcpTable, _UPVALUE1_.logicalIfName, L3_89, _UPVALUE1_.dhcpType, L4_90) == NIL then
    return _UPVALUE0_.FAILURE, A0_86
  end
  if db.setAttribute(dhcpRelayTable, _UPVALUE1_.interfaceName, L3_89, _UPVALUE1_.DhcpRelayStatus, L5_91) == NIL then
    return _UPVALUE0_.FAILURE, A0_86
  end
  return _UPVALUE0_.SUCCESS, A0_86
end
function isdnsProxyEnabled()
  local L0_92, L1_93, L2_94, L3_95
  L0_92 = firstCookieGet
  L1_93 = vlanTable
  L0_92 = L0_92(L1_93)
  L1_93 = db
  L1_93 = L1_93.getAttribute
  L2_94 = vlanTable
  L3_95 = ROWID
  L1_93 = L1_93(L2_94, L3_95, L0_92, _UPVALUE0_.vlanId)
  L2_94 = NIL
  if L1_93 == L2_94 then
    L2_94 = _UPVALUE1_
    L2_94 = L2_94.FAILURE
    L3_95 = L0_92
    return L2_94, L3_95
  end
  L2_94 = nil
  if L1_93 == "1" then
    L2_94 = LAN_NAME
  else
    L3_95 = LAN_NAME
    L2_94 = L3_95 .. L1_93
  end
  L3_95 = db
  L3_95 = L3_95.getAttribute
  L3_95 = L3_95(dhcpTable, _UPVALUE0_.logicalIfName, L2_94, _UPVALUE0_.dnsProxy)
  if L3_95 == NIL then
    return _UPVALUE1_.FAILURE, L0_92
  end
  return _UPVALUE1_.SUCCESS, L0_92, L3_95
end
function isdnsProxyEnabledNext(A0_96)
  local L1_97, L2_98, L3_99, L4_100, L5_101
  L1_97 = nextCookieGet
  L2_98 = A0_96
  L3_99 = vlanTable
  L2_98 = L1_97(L2_98, L3_99)
  L3_99 = FALSE
  if L1_97 == L3_99 then
    L3_99 = NIL
    if L2_98 == L3_99 then
      L3_99 = _UPVALUE0_
      L3_99 = L3_99.NEXT_ROWID_INVALID
      return L3_99
    else
      L3_99 = _UPVALUE0_
      L3_99 = L3_99.INVALID_COOKIE
      return L3_99
    end
  end
  L3_99 = db
  L3_99 = L3_99.getAttribute
  L4_100 = vlanTable
  L5_101 = ROWID
  L3_99 = L3_99(L4_100, L5_101, L1_97, _UPVALUE1_.vlanId)
  L4_100 = NIL
  if L3_99 == L4_100 then
    L4_100 = _UPVALUE0_
    L4_100 = L4_100.FAILURE
    L5_101 = A0_96
    return L4_100, L5_101
  end
  L4_100 = nil
  if L3_99 == "1" then
    L4_100 = LAN_NAME
  else
    L5_101 = LAN_NAME
    L4_100 = L5_101 .. L3_99
  end
  L5_101 = db
  L5_101 = L5_101.getAttribute
  L5_101 = L5_101(dhcpTable, _UPVALUE1_.logicalIfName, L4_100, _UPVALUE1_.dnsProxy)
  if L5_101 == NIL then
    return _UPVALUE0_.FAILURE, L1_97
  end
  return _UPVALUE0_.SUCCESS, L1_97, L5_101
end
function dnsProxyEnable(A0_102)
  local L1_103, L2_104
  L1_103 = checkCookieExists
  L2_104 = A0_102
  L1_103 = L1_103(L2_104, vlanTable)
  L2_104 = FALSE
  if L1_103 == L2_104 then
    L1_103 = _UPVALUE0_
    L1_103 = L1_103.INVALID_COOKIE
    return L1_103
  end
  L1_103 = db
  L1_103 = L1_103.getAttribute
  L2_104 = vlanTable
  L1_103 = L1_103(L2_104, ROWID, A0_102, _UPVALUE1_.vlanId)
  L2_104 = NIL
  if L1_103 == L2_104 then
    L2_104 = _UPVALUE0_
    L2_104 = L2_104.FAILURE
    return L2_104, A0_102
  end
  L2_104 = nil
  if L1_103 == "1" then
    L2_104 = LAN_NAME
  else
    L2_104 = LAN_NAME .. L1_103
  end
  if db.setAttribute(dhcpTable, _UPVALUE1_.logicalIfName, L2_104, _UPVALUE1_.dnsProxy, ENABLE) == NIL then
    return _UPVALUE0_.FAILURE, A0_102
  end
  return _UPVALUE0_.SUCCESS, A0_102
end
function dnsProxyDisable(A0_105)
  local L1_106, L2_107
  L1_106 = checkCookieExists
  L2_107 = A0_105
  L1_106 = L1_106(L2_107, vlanTable)
  L2_107 = FALSE
  if L1_106 == L2_107 then
    L1_106 = _UPVALUE0_
    L1_106 = L1_106.INVALID_COOKIE
    return L1_106
  end
  L1_106 = db
  L1_106 = L1_106.getAttribute
  L2_107 = vlanTable
  L1_106 = L1_106(L2_107, ROWID, A0_105, _UPVALUE1_.vlanId)
  L2_107 = NIL
  if L1_106 == L2_107 then
    L2_107 = _UPVALUE0_
    L2_107 = L2_107.FAILURE
    return L2_107, A0_105
  end
  L2_107 = nil
  if L1_106 == "1" then
    L2_107 = LAN_NAME
  else
    L2_107 = LAN_NAME .. L1_106
  end
  if db.setAttribute(dhcpTable, _UPVALUE1_.logicalIfName, L2_107, _UPVALUE1_.dnsProxy, DISABLE) == NIL then
    return _UPVALUE0_.FAILURE, A0_105
  end
  return _UPVALUE0_.SUCCESS, A0_105
end
function dhcpRelayIpAddressGet()
  local L0_108, L1_109, L2_110, L3_111
  L0_108 = firstCookieGet
  L1_109 = vlanTable
  L0_108 = L0_108(L1_109)
  L1_109 = db
  L1_109 = L1_109.getAttribute
  L2_110 = vlanTable
  L3_111 = ROWID
  L1_109 = L1_109(L2_110, L3_111, L0_108, _UPVALUE0_.vlanId)
  L2_110 = NIL
  if L1_109 == L2_110 then
    L2_110 = _UPVALUE1_
    L2_110 = L2_110.FAILURE
    L3_111 = L0_108
    return L2_110, L3_111
  end
  L2_110 = nil
  if L1_109 == "1" then
    L2_110 = LAN_NAME
  else
    L3_111 = LAN_NAME
    L2_110 = L3_111 .. L1_109
  end
  L3_111 = db
  L3_111 = L3_111.getAttribute
  L3_111 = L3_111(dhcpRelayTable, _UPVALUE0_.interfaceName, L2_110, _UPVALUE0_.dhcpRelayIpAddress)
  if L3_111 == NIL then
    return _UPVALUE1_.FAILURE, L0_108
  end
  return _UPVALUE1_.SUCCESS, L0_108, L3_111
end
function dhcpRelayIpAddressGetNext(A0_112)
  local L1_113, L2_114, L3_115, L4_116, L5_117
  L1_113 = nextCookieGet
  L2_114 = A0_112
  L3_115 = vlanTable
  L2_114 = L1_113(L2_114, L3_115)
  L3_115 = FALSE
  if L1_113 == L3_115 then
    L3_115 = NIL
    if L2_114 == L3_115 then
      L3_115 = _UPVALUE0_
      L3_115 = L3_115.NEXT_ROWID_INVALID
      return L3_115
    else
      L3_115 = _UPVALUE0_
      L3_115 = L3_115.INVALID_COOKIE
      return L3_115
    end
  end
  L3_115 = db
  L3_115 = L3_115.getAttribute
  L4_116 = vlanTable
  L5_117 = ROWID
  L3_115 = L3_115(L4_116, L5_117, L1_113, _UPVALUE1_.vlanId)
  L4_116 = NIL
  if L3_115 == L4_116 then
    L4_116 = _UPVALUE0_
    L4_116 = L4_116.FAILURE
    L5_117 = A0_112
    return L4_116, L5_117
  end
  L4_116 = nil
  if L3_115 == "1" then
    L4_116 = LAN_NAME
  else
    L5_117 = LAN_NAME
    L4_116 = L5_117 .. L3_115
  end
  L5_117 = db
  L5_117 = L5_117.getAttribute
  L5_117 = L5_117(dhcpRelayTable, _UPVALUE1_.interfaceName, L4_116, _UPVALUE1_.dhcpRelayIpAddress)
  if L5_117 == NIL then
    return _UPVALUE0_.FAILURE, A0_112
  end
  return _UPVALUE0_.SUCCESS, A0_112, L5_117
end
function dhcpRelayIpAddressSet(A0_118, A1_119)
  local L2_120, L3_121, L4_122
  L3_121 = checkCookieExists
  L4_122 = A0_118
  L3_121 = L3_121(L4_122, vlanTable)
  L4_122 = FALSE
  if L3_121 == L4_122 then
    L3_121 = _UPVALUE0_
    L3_121 = L3_121.INVALID_COOKIE
    return L3_121
  end
  L3_121 = db
  L3_121 = L3_121.getAttribute
  L4_122 = vlanTable
  L3_121 = L3_121(L4_122, ROWID, A0_118, _UPVALUE1_.vlanId)
  L4_122 = NIL
  if L3_121 == L4_122 then
    L4_122 = _UPVALUE0_
    L4_122 = L4_122.FAILURE
    return L4_122, A0_118
  end
  L4_122 = nil
  if L3_121 == "1" then
    L4_122 = LAN_NAME
  else
    L4_122 = LAN_NAME .. L3_121
  end
  if A1_119 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_120 = _UPVALUE2_.ipAddressCheck(IPV4_ADDRESS_FAMILY, A1_119)
  if L2_120 == _UPVALUE0_.ERROR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(dhcpRelayTable, _UPVALUE1_.interfaceName, L4_122, _UPVALUE1_.dhcpRelayIpAddress, A1_119) == NIL then
    return _UPVALUE0_.FAILURE, A0_118
  end
  return _UPVALUE0_.SUCCESS, A0_118
end
function vlanGet(A0_123)
  local L1_124, L2_125, L3_126, L4_127, L5_128, L6_129, L7_130, L8_131, L9_132, L10_133
  L1_124 = db
  L1_124 = L1_124.getAttribute
  L2_125 = vlanTable
  L3_126 = ROWID
  L4_127 = A0_123
  L5_128 = _UPVALUE0_
  L5_128 = L5_128.vlanId
  L1_124 = L1_124(L2_125, L3_126, L4_127, L5_128)
  L2_125 = NIL
  if L1_124 == L2_125 then
    L2_125 = _UPVALUE1_
    L2_125 = L2_125.FAILURE
    L3_126 = A0_123
    return L2_125, L3_126
  end
  L2_125 = nil
  L3_126 = DEFAULT_VLANID
  if L1_124 == L3_126 then
    L2_125 = LAN_NAME
  else
    L3_126 = LAN_NAME
    L4_127 = L1_124
    L2_125 = L3_126 .. L4_127
  end
  L3_126 = getRowJoinTable
  L4_127 = vlanTable
  L5_128 = intervlanTable
  L6_129 = _UPVALUE0_
  L6_129 = L6_129.vlanId
  L7_130 = L1_124
  L3_126 = L3_126(L4_127, L5_128, L6_129, L7_130)
  L4_127 = NIL
  if L3_126 == L4_127 then
    L4_127 = _UPVALUE1_
    L4_127 = L4_127.FAILURE
    L5_128 = A0_123
    return L4_127, L5_128
  end
  L4_127 = getRowJoinTable
  L5_128 = subnetTable
  L6_129 = dhcpRelayTable
  L7_130 = _UPVALUE0_
  L7_130 = L7_130.interfaceName
  L8_131 = L2_125
  L4_127 = L4_127(L5_128, L6_129, L7_130, L8_131)
  L5_128 = NIL
  if L4_127 == L5_128 then
    L5_128 = _UPVALUE1_
    L5_128 = L5_128.FAILURE
    L6_129 = A0_123
    return L5_128, L6_129
  end
  L5_128 = db
  L5_128 = L5_128.getRow
  L6_129 = dhcpTable
  L7_130 = _UPVALUE0_
  L7_130 = L7_130.logicalIfName
  L8_131 = L2_125
  L5_128 = L5_128(L6_129, L7_130, L8_131)
  L6_129 = NIL
  if L5_128 == L6_129 then
    L6_129 = _UPVALUE1_
    L6_129 = L6_129.FAILURE
    L7_130 = A0_123
    return L6_129, L7_130
  end
  L6_129 = nil
  L7_130 = dhcpTable
  L8_131 = "."
  L9_132 = _UPVALUE0_
  L9_132 = L9_132.dhcpType
  L7_130 = L7_130 .. L8_131 .. L9_132
  L7_130 = L5_128[L7_130]
  L8_131 = dhcpRelayTable
  L9_132 = "."
  L10_133 = _UPVALUE0_
  L10_133 = L10_133.DhcpRelayStatus
  L8_131 = L8_131 .. L9_132 .. L10_133
  L8_131 = L4_127[L8_131]
  L9_132 = DISABLE
  if L7_130 == L9_132 then
    L9_132 = DISABLE
    if L8_131 == L9_132 then
      L9_132 = dhcpWorkType
      L6_129 = L9_132.none
    end
  else
    L9_132 = ENABLE
    if L7_130 == L9_132 then
      L9_132 = dhcpWorkType
      L6_129 = L9_132.server
    else
      L9_132 = dhcpWorkType
      L6_129 = L9_132.relay
    end
  end
  L9_132 = _UPVALUE0_
  L9_132 = L9_132.vlanId
  L10_133 = " = '"
  L9_132 = L9_132 .. L10_133 .. L3_126[vlanTable .. "." .. _UPVALUE0_.vlanId] .. "' and " .. _UPVALUE0_.portName .. " = '" .. DUMMY_PORT .. "'"
  L10_133 = db
  L10_133 = L10_133.getAttributeWhere
  L10_133 = L10_133(vlanTable, L9_132, _UPVALUE0_.name)
  return _UPVALUE1_.SUCCESS, A0_123, L3_126[vlanTable .. "." .. _UPVALUE0_.vlanId], L10_133, L3_126[intervlanTable .. "." .. _UPVALUE0_.interVlanRouting], L4_127[subnetTable .. "." .. _UPVALUE0_.ipAddress], L4_127[subnetTable .. "." .. _UPVALUE0_.subnetMask], L6_129, L5_128[dhcpTable .. "." .. _UPVALUE0_.dnsProxy], L4_127[dhcpRelayTable .. "." .. _UPVALUE0_.dhcpRelayIpAddress]
end
function vlanGetAll()
  local L0_134, L1_135, L2_136, L3_137, L4_138, L5_139, L6_140, L7_141, L8_142, L9_143, L10_144, L11_145, L12_146, L13_147, L14_148, L15_149, L16_150, L17_151
  L0_134 = "portName='dummy' and vlanName !=''"
  L1_135 = db
  L1_135 = L1_135.getRowsWhere
  L2_136 = vlanTable
  L3_137 = L0_134
  L1_135 = L1_135(L2_136, L3_137)
  L2_136 = NIL
  if L1_135 == L2_136 then
    L2_136 = _UPVALUE0_
    L2_136 = L2_136.FAILURE
    return L2_136
  end
  L2_136 = db
  L2_136 = L2_136.getTable
  L3_137 = intervlanTable
  L2_136 = L2_136(L3_137)
  L3_137 = NIL
  if L1_135 == L3_137 then
    L3_137 = _UPVALUE0_
    L3_137 = L3_137.FAILURE
    return L3_137
  end
  L3_137 = merge2DTable
  L4_138 = L1_135
  L5_139 = L2_136
  L3_137 = L3_137(L4_138, L5_139)
  L4_138 = NIL
  if L1_135 == L4_138 then
    L4_138 = _UPVALUE0_
    L4_138 = L4_138.FAILURE
    return L4_138
  end
  L4_138 = _UPVALUE1_
  L4_138 = L4_138.logicalIfName
  L5_139 = " != '"
  L6_140 = DMZ_NAME
  L7_141 = "'"
  L4_138 = L4_138 .. L5_139 .. L6_140 .. L7_141
  L5_139 = db
  L5_139 = L5_139.getRowsWhere
  L6_140 = dhcpTable
  L7_141 = L4_138
  L5_139 = L5_139(L6_140, L7_141)
  L6_140 = NIL
  if L5_139 == L6_140 then
    L6_140 = _UPVALUE0_
    L6_140 = L6_140.FAILURE
    return L6_140
  end
  L6_140 = _UPVALUE1_
  L6_140 = L6_140.interfaceName
  L7_141 = " != '"
  L8_142 = DMZ_NAME
  L9_143 = "'"
  L6_140 = L6_140 .. L7_141 .. L8_142 .. L9_143
  L7_141 = db
  L7_141 = L7_141.getRowsWhere
  L8_142 = dhcpRelayTable
  L9_143 = L6_140
  L7_141 = L7_141(L8_142, L9_143)
  L8_142 = NIL
  if L7_141 == L8_142 then
    L8_142 = _UPVALUE0_
    L8_142 = L8_142.FAILURE
    return L8_142
  end
  L8_142 = _UPVALUE1_
  L8_142 = L8_142.addressFamily
  L9_143 = " = '"
  L10_144 = IPV4_ADDRESS_FAMILY
  L11_145 = "' and "
  L12_146 = _UPVALUE1_
  L12_146 = L12_146.interfaceName
  L16_150 = " and "
  L17_151 = _UPVALUE1_
  L17_151 = L17_151.interfaceName
  L8_142 = L8_142 .. L9_143 .. L10_144 .. L11_145 .. L12_146 .. L13_147 .. L14_148 .. L15_149 .. L16_150 .. L17_151 .. " != '" .. WAN1_NAME .. "'" .. " and " .. _UPVALUE1_.interfaceName .. " != '" .. WAN2_NAME .. "'"
  L9_143 = db
  L9_143 = L9_143.getRowsWhere
  L10_144 = subnetTable
  L11_145 = L8_142
  L9_143 = L9_143(L10_144, L11_145)
  L10_144 = NIL
  if L9_143 == L10_144 then
    L10_144 = _UPVALUE0_
    L10_144 = L10_144.FAILURE
    return L10_144
  end
  L10_144 = merge2DTable
  L11_145 = L5_139
  L12_146 = L9_143
  L10_144 = L10_144(L11_145, L12_146)
  L11_145 = NIL
  if L10_144 == L11_145 then
    L11_145 = _UPVALUE0_
    L11_145 = L11_145.FAILURE
    return L11_145
  end
  L11_145 = merge2DTable
  L12_146 = L3_137
  L11_145 = L11_145(L12_146, L13_147)
  L12_146 = NIL
  if L11_145 == L12_146 then
    L12_146 = _UPVALUE0_
    L12_146 = L12_146.FAILURE
    return L12_146
  end
  L12_146 = merge2DTable
  L12_146 = L12_146(L13_147, L14_148)
  if L12_146 == L13_147 then
    return L13_147
  end
  for L16_150, L17_151 in L13_147(L14_148) do
    for _FORV_21_, _FORV_22_ in pairs(L17_151) do
      if _FORV_21_ == vlanTable .. "." .. ROWID then
        L17_151[vlanTable .. "." .. COOKIE] = _FORV_22_
      end
    end
  end
  return L13_147, L14_148
end
function vlanGetNext(A0_152)
  local L1_153, L2_154, L3_155, L4_156, L5_157, L6_158, L7_159, L8_160, L9_161, L10_162, L11_163, L12_164, L13_165
  L1_153 = nextCookieGet
  L2_154 = A0_152
  L3_155 = vlanTable
  L2_154 = L1_153(L2_154, L3_155)
  L3_155 = FALSE
  if L1_153 ~= L3_155 then
    L3_155 = _UPVALUE0_
    L3_155 = L3_155.FALSE
  elseif L1_153 == L3_155 then
    L3_155 = NIL
    if L2_154 == L3_155 then
      L3_155 = _UPVALUE0_
      L3_155 = L3_155.NEXT_ROWID_INVALID
      return L3_155
    else
      L3_155 = _UPVALUE0_
      L3_155 = L3_155.INVALID_COOKIE
      return L3_155
    end
  end
  L3_155 = db
  L3_155 = L3_155.getRow
  L4_156 = vlanTable
  L5_157 = ROWID
  L6_158 = L1_153
  L3_155 = L3_155(L4_156, L5_157, L6_158)
  L4_156 = NIL
  if L3_155 == L4_156 then
    L4_156 = _UPVALUE0_
    L4_156 = L4_156.FAILURE
    L5_157 = A0_152
    return L4_156, L5_157
  end
  L4_156 = db
  L4_156 = L4_156.getAttribute
  L5_157 = vlanTable
  L6_158 = ROWID
  L7_159 = L1_153
  L8_160 = _UPVALUE1_
  L8_160 = L8_160.vlanId
  L4_156 = L4_156(L5_157, L6_158, L7_159, L8_160)
  L5_157 = NIL
  if L4_156 == L5_157 then
    L5_157 = _UPVALUE0_
    L5_157 = L5_157.FAILURE
    L6_158 = A0_152
    return L5_157, L6_158
  end
  L5_157 = nil
  if L4_156 == "1" then
    L5_157 = LAN_NAME
  else
    L6_158 = LAN_NAME
    L7_159 = L4_156
    L5_157 = L6_158 .. L7_159
  end
  L6_158 = getRowJoinTable
  L7_159 = vlanTable
  L8_160 = intervlanTable
  L9_161 = _UPVALUE1_
  L9_161 = L9_161.vlanId
  L10_162 = L4_156
  L6_158 = L6_158(L7_159, L8_160, L9_161, L10_162)
  L7_159 = NIL
  if L6_158 == L7_159 then
    L7_159 = _UPVALUE0_
    L7_159 = L7_159.FAILURE
    L8_160 = A0_152
    return L7_159, L8_160
  end
  L7_159 = getRowJoinTable
  L8_160 = subnetTable
  L9_161 = dhcpRelayTable
  L10_162 = _UPVALUE1_
  L10_162 = L10_162.interfaceName
  L11_163 = L5_157
  L7_159 = L7_159(L8_160, L9_161, L10_162, L11_163)
  L8_160 = NIL
  if L7_159 == L8_160 then
    L8_160 = _UPVALUE0_
    L8_160 = L8_160.FAILURE
    L9_161 = A0_152
    return L8_160, L9_161
  end
  L8_160 = db
  L8_160 = L8_160.getRow
  L9_161 = dhcpTable
  L10_162 = _UPVALUE1_
  L10_162 = L10_162.logicalIfName
  L11_163 = L5_157
  L8_160 = L8_160(L9_161, L10_162, L11_163)
  L9_161 = NIL
  if L8_160 == L9_161 then
    L9_161 = _UPVALUE0_
    L9_161 = L9_161.FAILURE
    L10_162 = A0_152
    return L9_161, L10_162
  end
  L9_161 = nil
  L10_162 = dhcpTable
  L11_163 = "."
  L12_164 = _UPVALUE1_
  L12_164 = L12_164.dhcpType
  L10_162 = L10_162 .. L11_163 .. L12_164
  L10_162 = L7_159[L10_162]
  L11_163 = dhcpRelayTable
  L12_164 = "."
  L13_165 = _UPVALUE1_
  L13_165 = L13_165.DhcpRelayStatus
  L11_163 = L11_163 .. L12_164 .. L13_165
  L11_163 = L8_160[L11_163]
  L12_164 = DISABLE
  if L10_162 == L12_164 then
    L12_164 = DISABLE
    if L11_163 == L12_164 then
      L12_164 = dhcpWorkType
      L9_161 = L12_164.none
    end
  else
    L12_164 = ENABLE
    if L10_162 == L12_164 then
      L12_164 = dhcpWorkType
      L9_161 = L12_164.server
    else
      L12_164 = dhcpWorkType
      L9_161 = L12_164.relay
    end
  end
  L12_164 = _UPVALUE1_
  L12_164 = L12_164.vlanId
  L13_165 = " = '"
  L12_164 = L12_164 .. L13_165 .. L6_158[vlanTable .. "." .. _UPVALUE1_.vlanId] .. "' and " .. _UPVALUE1_.portName .. " = '" .. DUMMY_PORT .. "'"
  L13_165 = db
  L13_165 = L13_165.getAttributeWhere
  L13_165 = L13_165(vlanTable, L12_164, _UPVALUE1_.name)
  return _UPVALUE0_.SUCCESS, L1_153, L6_158[vlanTable .. "." .. _UPVALUE1_.vlanId], L13_165, L6_158[intervlanTable .. "." .. _UPVALUE1_.interVlanRouting], L7_159[subnetTable .. "." .. _UPVALUE1_.ipAddress], L7_159[subnetTable .. "." .. _UPVALUE1_.subnetMask], L9_161, L8_160[dhcpTable .. "." .. _UPVALUE1_.dnsProxy], L7_159[dhcpRelayTable .. "." .. _UPVALUE1_.dhcpRelayIpAddress]
end
function vlanSet(A0_166, A1_167, A2_168, A3_169, A4_170, A5_171, A6_172, A7_173, A8_174)
  local L9_175, L10_176, L11_177, L12_178, L13_179, L14_180, L15_181, L16_182, L17_183, L18_184, L19_185, L20_186, L21_187, L22_188, L23_189, L24_190, L25_191, L26_192, L27_193, L28_194, L29_195, L30_196, L31_197, L32_198, L33_199, L34_200, L35_201, L36_202, L37_203, L38_204, L39_205, L40_206, L41_207, L42_208
  L10_176 = _UPVALUE0_
  L10_176 = L10_176.ipv6ModeGet
  L12_178 = L10_176()
  L13_179 = checkCookieExists
  L14_180 = A0_166
  L15_181 = vlanTable
  L13_179 = L13_179(L14_180, L15_181)
  L14_180 = FALSE
  if L13_179 == L14_180 then
    L13_179 = _UPVALUE1_
    L13_179 = L13_179.INVALID_COOKIE
    return L13_179
  end
  L13_179 = NIL
  if A1_167 == L13_179 then
    L13_179 = _UPVALUE2_
    L13_179 = L13_179.COMP_VLAN_ADDRESSING_VLANID_NIL
    return L13_179
  end
  L13_179 = tonumber
  L14_180 = A1_167
  L13_179 = L13_179(L14_180)
  L14_180 = vlanMinNumber
  if not (L13_179 < L14_180) then
    L14_180 = vlanMaxNumber
  elseif L13_179 > L14_180 then
    L14_180 = _UPVALUE2_
    L14_180 = L14_180.COMP_VLAN_ADDRESSING_VLANID_NIL
    return L14_180
  end
  L14_180 = NIL
  if A2_168 == L14_180 then
    L14_180 = _UPVALUE2_
    L14_180 = L14_180.COMP_VLAN_ADDRESSING_VLANNAME_NIL
    return L14_180
  end
  L14_180 = NIL
  if A3_169 == L14_180 then
    L14_180 = _UPVALUE2_
    L14_180 = L14_180.COMP_VLAN_ADDRESSING_INTERVLAN_ROUTING_NIL
    return L14_180
  end
  L14_180 = _UPVALUE3_
  L14_180 = L14_180.isBoolean
  L15_181 = A3_169
  L14_180 = L14_180(L15_181)
  L9_175 = L14_180
  L14_180 = _UPVALUE1_
  L14_180 = L14_180.ERROR
  if L9_175 == L14_180 then
    L14_180 = _UPVALUE2_
    L14_180 = L14_180.COMP_VLAN_ADDRESSING_INTERVLAN_ROUTING_INVALID
    return L14_180
  end
  L14_180 = NIL
  if A4_170 == L14_180 then
    L14_180 = _UPVALUE2_
    L14_180 = L14_180.COMP_VLAN_ADDRESSING_IPADDRESS_NIL
    return L14_180
  end
  L14_180 = _UPVALUE3_
  L14_180 = L14_180.ipAddressCheck
  L15_181 = IPV4_ADDRESS_FAMILY
  L16_182 = A4_170
  L14_180 = L14_180(L15_181, L16_182)
  L9_175 = L14_180
  L14_180 = _UPVALUE1_
  L14_180 = L14_180.ERROR
  if L9_175 == L14_180 then
    L14_180 = _UPVALUE2_
    L14_180 = L14_180.COMP_VLAN_ADDRESSING_IPADDRESS_INVALID
    return L14_180
  end
  L14_180 = NIL
  if A5_171 == L14_180 then
    L14_180 = _UPVALUE2_
    L14_180 = L14_180.COMP_VLAN_ADDRESSING_SUNBET_NIL
    return L14_180
  end
  L14_180 = _UPVALUE3_
  L14_180 = L14_180.ipAddressCheck
  L15_181 = IPV4_ADDRESS_FAMILY
  L16_182 = A5_171
  L14_180 = L14_180(L15_181, L16_182)
  L9_175 = L14_180
  L14_180 = _UPVALUE1_
  L14_180 = L14_180.ERROR
  if L9_175 == L14_180 then
    L14_180 = _UPVALUE2_
    L14_180 = L14_180.COMP_VLAN_ADDRESSING_SUNBET_INVALID
    return L14_180
  end
  L14_180 = NIL
  if A6_172 == L14_180 then
    L14_180 = _UPVALUE2_
    L14_180 = L14_180.COMP_VLAN_ADDRESSING_DHCPTYPE_NIL
    return L14_180
  end
  L14_180 = dhcpWorkType
  L14_180 = L14_180.none
  if A6_172 ~= L14_180 then
    L14_180 = dhcpWorkType
    L14_180 = L14_180.server
    if A6_172 ~= L14_180 then
      L14_180 = dhcpWorkType
      L14_180 = L14_180.relay
      if A6_172 ~= L14_180 then
        L14_180 = _UPVALUE2_
        L14_180 = L14_180.COMP_VLAN_ADDRESSING_DHCPTYPE_INVALID
        return L14_180
      end
    end
  end
  L14_180, L15_181 = nil, nil
  L16_182 = dhcpWorkType
  L16_182 = L16_182.none
  if A6_172 == L16_182 then
    L14_180 = DISABLE
    L15_181 = DISABLE
  else
    L16_182 = dhcpWorkType
    L16_182 = L16_182.server
    if A6_172 == L16_182 then
      L14_180 = ENABLE
      L15_181 = DISABLE
    else
      L16_182 = dhcpWorkType
      L16_182 = L16_182.relay
      if A6_172 == L16_182 then
        L14_180 = DISABLE
        L15_181 = ENABLE
      end
    end
  end
  L16_182 = NIL
  if A7_173 == L16_182 then
    L16_182 = _UPVALUE2_
    L16_182 = L16_182.COMP_VLAN_ADDRESSING_DNSPROXY_NIL
    return L16_182
  end
  L16_182 = _UPVALUE3_
  L16_182 = L16_182.isBoolean
  L17_183 = A7_173
  L16_182 = L16_182(L17_183)
  L9_175 = L16_182
  L16_182 = _UPVALUE1_
  L16_182 = L16_182.ERROR
  if L9_175 == L16_182 then
    L16_182 = _UPVALUE2_
    L16_182 = L16_182.COMP_VLAN_ADDRESSING_DNSPROXY_INVALID
    return L16_182
  end
  L16_182 = NIL
  if A8_174 == L16_182 then
    A8_174 = DEFAULT_RELAY_ADDRESS
  end
  L16_182 = nil
  if A1_167 == "1" then
    L16_182 = "LAN"
  else
    L17_183 = "LAN"
    L18_184 = A1_167
    L16_182 = L17_183 .. L18_184
  end
  L17_183 = db
  L17_183 = L17_183.getAttribute
  L18_184 = subnetTable
  L19_185 = _UPVALUE4_
  L19_185 = L19_185.logicalIfName
  L20_186 = L16_182
  L21_187 = ROWID
  L17_183 = L17_183(L18_184, L19_185, L20_186, L21_187)
  L18_184 = {}
  L19_185 = subnetTable
  L20_186 = "."
  L21_187 = _UPVALUE4_
  L21_187 = L21_187.logicalIfName
  L19_185 = L19_185 .. L20_186 .. L21_187
  L18_184[L19_185] = L16_182
  L19_185 = subnetTable
  L20_186 = "."
  L21_187 = _UPVALUE4_
  L21_187 = L21_187.ipAddress
  L19_185 = L19_185 .. L20_186 .. L21_187
  L18_184[L19_185] = A4_170
  L19_185 = subnetTable
  L20_186 = "."
  L21_187 = _UPVALUE4_
  L21_187 = L21_187.subnetMask
  L19_185 = L19_185 .. L20_186 .. L21_187
  L18_184[L19_185] = A5_171
  L19_185 = db
  L19_185 = L19_185.update
  L20_186 = subnetTable
  L21_187 = L18_184
  L22_188 = L17_183
  L19_185 = L19_185(L20_186, L21_187, L22_188)
  L20_186 = NIL
  if L19_185 == L20_186 then
    L20_186 = _UPVALUE1_
    L20_186 = L20_186.FAILURE
    L21_187 = A0_166
    return L20_186, L21_187
  end
  L20_186 = db
  L20_186 = L20_186.getAttribute
  L21_187 = vlanTable
  L22_188 = ROWID
  L23_189 = A0_166
  L24_190 = _UPVALUE4_
  L24_190 = L24_190.vlanId
  L20_186 = L20_186(L21_187, L22_188, L23_189, L24_190)
  L21_187 = db
  L21_187 = L21_187.getAttribute
  L22_188 = intervlanTable
  L23_189 = _UPVALUE4_
  L23_189 = L23_189.vlanId
  L24_190 = A1_167
  L25_191 = ROWID
  L21_187 = L21_187(L22_188, L23_189, L24_190, L25_191)
  L22_188 = {}
  L23_189 = intervlanTable
  L24_190 = "."
  L25_191 = _UPVALUE4_
  L25_191 = L25_191.vlanId
  L23_189 = L23_189 .. L24_190 .. L25_191
  L22_188[L23_189] = A1_167
  L23_189 = intervlanTable
  L24_190 = "."
  L25_191 = _UPVALUE4_
  L25_191 = L25_191.ifName
  L23_189 = L23_189 .. L24_190 .. L25_191
  L24_190 = BDG_NAME
  L25_191 = A1_167
  L24_190 = L24_190 .. L25_191
  L22_188[L23_189] = L24_190
  L23_189 = intervlanTable
  L24_190 = "."
  L25_191 = _UPVALUE4_
  L25_191 = L25_191.interVlanRouting
  L23_189 = L23_189 .. L24_190 .. L25_191
  L22_188[L23_189] = A3_169
  L23_189 = db
  L23_189 = L23_189.update
  L24_190 = intervlanTable
  L25_191 = L22_188
  L26_192 = L21_187
  L23_189 = L23_189(L24_190, L25_191, L26_192)
  L24_190 = NIL
  if L23_189 == L24_190 then
    L24_190 = _UPVALUE1_
    L24_190 = L24_190.FAILURE
    L25_191 = A0_166
    return L24_190, L25_191
  end
  L24_190 = db
  L24_190 = L24_190.getAttribute
  L25_191 = intervlanTbl
  L26_192 = _UPVALUE4_
  L26_192 = L26_192.vlanId
  L27_193 = A1_167
  L28_194 = ROWID
  L24_190 = L24_190(L25_191, L26_192, L27_193, L28_194)
  L25_191 = {}
  L26_192 = intervlanTbl
  L27_193 = "."
  L28_194 = _UPVALUE4_
  L28_194 = L28_194.vlanId
  L26_192 = L26_192 .. L27_193 .. L28_194
  L25_191[L26_192] = A1_167
  L26_192 = intervlanTbl
  L27_193 = "."
  L28_194 = _UPVALUE4_
  L28_194 = L28_194.ifName
  L26_192 = L26_192 .. L27_193 .. L28_194
  L27_193 = BDG_NAME
  L28_194 = A1_167
  L27_193 = L27_193 .. L28_194
  L25_191[L26_192] = L27_193
  L26_192 = intervlanTbl
  L27_193 = "."
  L28_194 = _UPVALUE4_
  L28_194 = L28_194.interVlanRouting
  L26_192 = L26_192 .. L27_193 .. L28_194
  L25_191[L26_192] = A3_169
  L26_192 = intervlanTbl
  L27_193 = "."
  L28_194 = _UPVALUE4_
  L28_194 = L28_194.ipAddress
  L26_192 = L26_192 .. L27_193 .. L28_194
  L25_191[L26_192] = A4_170
  L26_192 = db
  L26_192 = L26_192.update
  L27_193 = intervlanTbl
  L28_194 = L25_191
  L29_195 = L24_190
  L26_192 = L26_192(L27_193, L28_194, L29_195)
  L23_189 = L26_192
  L26_192 = NIL
  if L23_189 == L26_192 then
    L26_192 = _UPVALUE1_
    L26_192 = L26_192.FAILURE
    L27_193 = L24_190
    return L26_192, L27_193
  end
  L26_192 = nil
  L27_193 = DEFAULT_VLANID
  if A1_167 == L27_193 then
    L26_192 = LAN_NAME
  else
    L27_193 = LAN_NAME
    L28_194 = A1_167
    L26_192 = L27_193 .. L28_194
  end
  L27_193 = db
  L27_193 = L27_193.getAttribute
  L28_194 = dhcpRelayTable
  L29_195 = _UPVALUE4_
  L29_195 = L29_195.interfaceName
  L30_196 = L26_192
  L31_197 = ROWID
  L27_193 = L27_193(L28_194, L29_195, L30_196, L31_197)
  L28_194 = {}
  L29_195 = dhcpRelayTable
  L30_196 = "."
  L31_197 = _UPVALUE4_
  L31_197 = L31_197.interfaceName
  L29_195 = L29_195 .. L30_196 .. L31_197
  L28_194[L29_195] = L26_192
  L29_195 = dhcpRelayTable
  L30_196 = "."
  L31_197 = _UPVALUE4_
  L31_197 = L31_197.virtualIfName
  L29_195 = L29_195 .. L30_196 .. L31_197
  L30_196 = BDG_NAME
  L31_197 = A1_167
  L30_196 = L30_196 .. L31_197
  L28_194[L29_195] = L30_196
  L29_195 = dhcpRelayTable
  L30_196 = "."
  L31_197 = _UPVALUE4_
  L31_197 = L31_197.DhcpRelayStatus
  L29_195 = L29_195 .. L30_196 .. L31_197
  L28_194[L29_195] = L15_181
  L29_195 = dhcpRelayTable
  L30_196 = "."
  L31_197 = _UPVALUE4_
  L31_197 = L31_197.dhcpRelayIpAddress
  L29_195 = L29_195 .. L30_196 .. L31_197
  L28_194[L29_195] = A8_174
  L29_195 = db
  L29_195 = L29_195.update
  L30_196 = dhcpRelayTable
  L31_197 = L28_194
  L32_198 = L27_193
  L29_195 = L29_195(L30_196, L31_197, L32_198)
  L30_196 = NIL
  if L29_195 == L30_196 then
    L30_196 = _UPVALUE1_
    L30_196 = L30_196.FAILURE
    L31_197 = A0_166
    return L30_196, L31_197
  end
  L30_196 = db
  L30_196 = L30_196.getAttribute
  L31_197 = dhcpTable
  L32_198 = _UPVALUE4_
  L32_198 = L32_198.logicalIfName
  L33_199 = L26_192
  L34_200 = ROWID
  L30_196 = L30_196(L31_197, L32_198, L33_199, L34_200)
  L31_197 = {}
  L32_198 = dhcpTable
  L33_199 = "."
  L34_200 = _UPVALUE4_
  L34_200 = L34_200.dhcpType
  L32_198 = L32_198 .. L33_199 .. L34_200
  L31_197[L32_198] = L14_180
  L32_198 = dhcpTable
  L33_199 = "."
  L34_200 = _UPVALUE4_
  L34_200 = L34_200.dnsProxy
  L32_198 = L32_198 .. L33_199 .. L34_200
  L31_197[L32_198] = A7_173
  L32_198 = db
  L32_198 = L32_198.update
  L33_199 = dhcpTable
  L34_200 = L31_197
  L35_201 = L30_196
  L32_198 = L32_198(L33_199, L34_200, L35_201)
  L33_199 = NIL
  if L32_198 == L33_199 then
    L33_199 = _UPVALUE1_
    L33_199 = L33_199.FAILURE
    L34_200 = A0_166
    return L33_199, L34_200
  end
  L33_199 = {}
  L34_200 = networkInterfaceTable
  L35_201 = "."
  L36_202 = _UPVALUE4_
  L36_202 = L36_202.ipAddr
  L34_200 = L34_200 .. L35_201 .. L36_202
  L33_199[L34_200] = A4_170
  L34_200 = networkInterfaceTable
  L35_201 = "."
  L36_202 = _UPVALUE4_
  L36_202 = L36_202.subnetmask
  L34_200 = L34_200 .. L35_201 .. L36_202
  L33_199[L34_200] = A5_171
  L34_200 = db
  L34_200 = L34_200.getAttribute
  L35_201 = networkInterfaceTable
  L36_202 = _UPVALUE4_
  L36_202 = L36_202.networkInterfaceName
  L37_203 = BDG_NAME
  L38_204 = A1_167
  L37_203 = L37_203 .. L38_204
  L38_204 = ROWID
  L34_200 = L34_200(L35_201, L36_202, L37_203, L38_204)
  L35_201 = db
  L35_201 = L35_201.getAttribute
  L36_202 = networkInterfaceTable
  L37_203 = _UPVALUE4_
  L37_203 = L37_203.networkInterfaceName
  L38_204 = BDG_NAME
  L39_205 = A1_167
  L38_204 = L38_204 .. L39_205
  L39_205 = _UPVALUE4_
  L39_205 = L39_205.capabilities
  L35_201 = L35_201(L36_202, L37_203, L38_204, L39_205)
  L36_202 = tonumber
  L37_203 = L12_178
  L36_202 = L36_202(L37_203)
  if L36_202 == 3 then
    L36_202 = IPv6_CAP
    if L35_201 ~= L36_202 then
      L36_202 = networkInterfaceTable
      L37_203 = "."
      L38_204 = _UPVALUE4_
      L38_204 = L38_204.capabilities
      L36_202 = L36_202 .. L37_203 .. L38_204
      L37_203 = IPv6_CAP
      L33_199[L36_202] = L37_203
    end
  end
  L36_202 = db
  L36_202 = L36_202.update
  L37_203 = networkInterfaceTable
  L38_204 = L33_199
  L39_205 = L34_200
  L36_202 = L36_202(L37_203, L38_204, L39_205)
  L37_203 = NIL
  if L36_202 == L37_203 then
    L37_203 = _UPVALUE1_
    L37_203 = L37_203.FAILURE
    L38_204 = A0_166
    return L37_203, L38_204
  end
  L37_203 = {}
  L38_204 = ipAddressTable
  L39_205 = "."
  L40_206 = _UPVALUE4_
  L40_206 = L40_206.ipaddress
  L38_204 = L38_204 .. L39_205 .. L40_206
  L37_203[L38_204] = A4_170
  L38_204 = ipAddressTable
  L39_205 = "."
  L40_206 = _UPVALUE4_
  L40_206 = L40_206.subnetMaskIp
  L38_204 = L38_204 .. L39_205 .. L40_206
  L37_203[L38_204] = A5_171
  L38_204 = nil
  L39_205 = DEFAULT_VLANID
  if A1_167 == L39_205 then
    L39_205 = db
    L39_205 = L39_205.getAttribute
    L40_206 = ipAddressTable
    L41_207 = _UPVALUE4_
    L41_207 = L41_207.interfaceName
    L42_208 = LAN_NAME
    L39_205 = L39_205(L40_206, L41_207, L42_208, ROWID)
    L38_204 = L39_205
  else
    L39_205 = db
    L39_205 = L39_205.getAttribute
    L40_206 = ipAddressTable
    L41_207 = _UPVALUE4_
    L41_207 = L41_207.interfaceName
    L42_208 = LAN_NAME
    L42_208 = L42_208 .. A1_167
    L39_205 = L39_205(L40_206, L41_207, L42_208, ROWID)
    L38_204 = L39_205
  end
  L39_205 = db
  L39_205 = L39_205.update
  L40_206 = ipAddressTable
  L41_207 = L37_203
  L42_208 = L38_204
  L39_205 = L39_205(L40_206, L41_207, L42_208)
  L40_206 = NIL
  if L39_205 == L40_206 then
    L40_206 = _UPVALUE1_
    L40_206 = L40_206.FAILURE
    L41_207 = A0_166
    return L40_206, L41_207
  end
  if A1_167 == "1" then
    L40_206 = db
    L40_206 = L40_206.setAttribute
    L41_207 = webAccessTable
    L42_208 = "vlanName"
    L40_206 = L40_206(L41_207, L42_208, LAN_NAME, "vlanIpAddr", A4_170)
    L41_207 = db
    L41_207 = L41_207.setAttribute
    L42_208 = webAccessTable
    L41_207 = L41_207(L42_208, "vlanName", LAN_NAME, "vlanSubnet", A5_171)
  else
    L40_206 = db
    L40_206 = L40_206.setAttribute
    L41_207 = webAccessTable
    L42_208 = "vlanName"
    L40_206 = L40_206(L41_207, L42_208, LAN_NAME .. A1_167, "vlanIpAddr", A4_170)
    L41_207 = db
    L41_207 = L41_207.setAttribute
    L42_208 = webAccessTable
    L41_207 = L41_207(L42_208, "vlanName", LAN_NAME .. A1_167, "vlanSubnet", A5_171)
  end
  L40_206 = _UPVALUE4_
  L40_206 = L40_206.interface
  L41_207 = "='"
  L42_208 = L16_182
  L40_206 = L40_206 .. L41_207 .. L42_208 .. "'"
  whereSt = L40_206
  L40_206 = db
  L40_206 = L40_206.existsRowWhere
  L41_207 = _UPVALUE5_
  L42_208 = whereSt
  L40_206 = L40_206(L41_207, L42_208)
  if L40_206 then
    L41_207 = db
    L41_207 = L41_207.setAttribute
    L42_208 = _UPVALUE5_
    L41_207(L42_208, _UPVALUE4_.interface, L16_182, _UPVALUE4_.interface, L16_182)
  end
  L41_207 = db
  L41_207 = L41_207.getAttribute
  L42_208 = vlanTable
  L41_207 = L41_207(L42_208, ROWID, A0_166, _UPVALUE4_.name)
  L42_208 = db
  L42_208 = L42_208.getRowsWhere
  L42_208 = L42_208(serviceRouteTable, _UPVALUE4_.name .. "= '" .. L41_207 .. "'")
  for _FORV_46_, _FORV_47_ in pairs(L42_208) do
    configRow = L42_208[_FORV_46_]
    configRow[serviceRouteTable .. "." .. _UPVALUE4_.sourceIPAddress] = A4_170
    if db.update(serviceRouteTable, configRow, configRow[serviceRouteTable .. "." .. ROWID]) == nil then
      return _UPVALUE1_.FAILURE
    end
  end
  L9_175 = _UPVALUE6_.accountingRouteTblUpdate(A4_170, A5_171, A1_167)
  status = _UPVALUE7_.authenticationTblUpdate(A4_170, A5_171, A1_167)
  return _UPVALUE1_.SUCCESS, A0_166
end
function vlanCreate(A0_209, A1_210, A2_211, A3_212, A4_213, A5_214, A6_215, A7_216, A8_217)
  local L9_218, L10_219, L11_220, L12_221, L13_222, L14_223, L15_224, L16_225, L17_226, L18_227, L19_228, L20_229, L21_230, L22_231, L23_232, L24_233, L25_234, L26_235, L27_236, L28_237, L29_238, L30_239, L31_240, L32_241, L33_242, L34_243, L35_244, L36_245, L37_246, L38_247, L39_248, L40_249, L41_250, L42_251, L43_252
  L12_221 = NIL
  if A0_209 == L12_221 then
    L12_221 = _UPVALUE0_
    L12_221 = L12_221.COMP_VLAN_ADDRESSING_VLANID_NIL
    return L12_221
  end
  L12_221 = DefaultVlan
  if A0_209 == L12_221 then
    L12_221 = _UPVALUE1_
    L12_221 = L12_221.NOT_SUPPORTED
    L13_222 = cookie
    return L12_221, L13_222
  end
  L12_221 = VLAN_LOCAL_ID
  if A0_209 == L12_221 then
    L12_221 = db
    L12_221 = L12_221.getAttribute
    L13_222 = configPortTable
    L14_223 = ROWID
    L15_224 = "1"
    L16_225 = _UPVALUE2_
    L16_225 = L16_225.interfaceName
    L12_221 = L12_221(L13_222, L14_223, L15_224, L16_225)
    L13_222 = returnCode
    L13_222 = L13_222.NIL
    if L12_221 ~= L13_222 then
      L13_222 = LAN_NAME
      if L12_221 ~= L13_222 then
        L13_222 = _UPVALUE0_
        L13_222 = L13_222.COMP_VLAN_PORT_RESERVEDFOR_WAN_DMZ
        return L13_222
      end
    end
  end
  L12_221 = UNIT_NAME
  if L12_221 ~= "DSR-250N" then
    L12_221 = UNIT_NAME
    if L12_221 ~= "DSR-250" then
      L12_221 = UNIT_NAME
      if L12_221 ~= "DSR-150N" then
        L12_221 = UNIT_NAME
      end
    end
  elseif L12_221 == "DSR-150" then
    L12_221 = DMZ_LOCAL_ID
    if A0_209 == L12_221 then
      L12_221 = _UPVALUE0_
      L12_221 = L12_221.COMP_VLAN_PORT_RESERVEDFOR_LAN_DMZ
      return L12_221
    end
  end
  L12_221 = db
  L12_221 = L12_221.getRows
  L13_222 = vlanTable
  L14_223 = _UPVALUE2_
  L14_223 = L14_223.portName
  L15_224 = DUMMY_PORT
  L12_221 = L12_221(L13_222, L14_223, L15_224)
  L10_219 = L12_221
  L12_221 = PRODUCT_ID
  if L12_221 ~= "DSR-1000AC_Ax" then
    L12_221 = PRODUCT_ID
    if L12_221 ~= "DSR-500AC_Ax" then
      L12_221 = PRODUCT_ID
      if L12_221 ~= "DSR-1000_Bx" then
        L12_221 = PRODUCT_ID
      end
    end
  else
    if L12_221 == "DSR-500_Bx" then
      L12_221 = #L10_219
      if L12_221 >= 16 then
        L12_221 = _UPVALUE0_
        L12_221 = L12_221.COMP_VLAN_ADDRESSING_MAX_LIMIT
        return L12_221
      end
  end
  else
    L12_221 = #L10_219
    if L12_221 >= 5 then
      L12_221 = _UPVALUE0_
      L12_221 = L12_221.COMP_VLAN_ADDRESSING_MAX_LIMIT
      return L12_221
    end
  end
  L12_221 = UNIT_NAME
  if L12_221 ~= "DSR-250N" then
    L12_221 = UNIT_NAME
    if L12_221 ~= "DSR-250" then
      L12_221 = UNIT_NAME
      if L12_221 ~= "DSR-150N" then
        L12_221 = UNIT_NAME
      end
    end
  else
    if L12_221 == "DSR-150" then
      L12_221 = _UPVALUE2_
      L12_221 = L12_221.vlanId
      L13_222 = " = '"
      L14_223 = A0_209
      L15_224 = "'"
      L11_220 = L12_221 .. L13_222 .. L14_223 .. L15_224
  end
  else
    L12_221 = _UPVALUE2_
    L12_221 = L12_221.vlanId
    L13_222 = " = '"
    L14_223 = A0_209
    L15_224 = "' AND "
    L16_225 = _UPVALUE2_
    L16_225 = L16_225.portName
    L17_226 = " = '"
    L18_227 = DUMMY_PORT
    L19_228 = "'"
    L11_220 = L12_221 .. L13_222 .. L14_223 .. L15_224 .. L16_225 .. L17_226 .. L18_227 .. L19_228
  end
  L12_221 = db
  L12_221 = L12_221.existsRowWhere
  L13_222 = vlanTable
  L14_223 = L11_220
  L12_221 = L12_221(L13_222, L14_223)
  if L12_221 then
    L13_222 = _UPVALUE0_
    L13_222 = L13_222.COMP_VLAN_VLANID_ALREADY_EXISTS
    return L13_222
  end
  L13_222 = _UPVALUE3_
  L13_222 = L13_222.stringLengthCheck
  L14_223 = MIN_NAME_LENGTH
  L15_224 = MAX_NAME_LENGTH
  L16_225 = A1_210
  L13_222 = L13_222(L14_223, L15_224, L16_225)
  L9_218 = L13_222
  L13_222 = _UPVALUE1_
  L13_222 = L13_222.ERROR
  if L9_218 == L13_222 then
    L13_222 = _UPVALUE0_
    L13_222 = L13_222.COMP_VLAN_VLANNAME_LENGTH_INVALID
    return L13_222
  end
  L13_222 = db
  L13_222 = L13_222.existsRow
  L14_223 = vlanTable
  L15_224 = _UPVALUE2_
  L15_224 = L15_224.name
  L16_225 = A1_210
  L13_222 = L13_222(L14_223, L15_224, L16_225)
  if L13_222 then
    L14_223 = _UPVALUE0_
    L14_223 = L14_223.COMP_VLAN_VLANNAME_ALREADY_EXISTS
    return L14_223
  end
  L14_223 = tonumber
  L15_224 = A0_209
  L14_223 = L14_223(L15_224)
  L15_224 = vlanMinNumber
  if not (L14_223 < L15_224) then
    L15_224 = vlanMaxNumber
  elseif L14_223 > L15_224 then
    L15_224 = _UPVALUE0_
    L15_224 = L15_224.COMP_VLAN_ADDRESSING_VLANID_INVALID
    return L15_224
  end
  L15_224 = NIL
  if A1_210 == L15_224 then
    L15_224 = _UPVALUE0_
    L15_224 = L15_224.COMP_VLAN_ADDRESSING_VLANNAME_NIL
    return L15_224
  end
  L15_224 = NIL
  if A3_212 == L15_224 then
    L15_224 = _UPVALUE0_
    L15_224 = L15_224.COMP_VLAN_ADDRESSING_INTERVLAN_ROUTING_NIL
    return L15_224
  end
  L15_224 = _UPVALUE3_
  L15_224 = L15_224.isBoolean
  L16_225 = A3_212
  L15_224 = L15_224(L16_225)
  L9_218 = L15_224
  L15_224 = _UPVALUE1_
  L15_224 = L15_224.ERROR
  if L9_218 == L15_224 then
    L15_224 = _UPVALUE0_
    L15_224 = L15_224.COMP_VLAN_ADDRESSING_INTERVLAN_ROUTING_INVALID
    return L15_224
  end
  L15_224 = NIL
  if A4_213 == L15_224 then
    L15_224 = _UPVALUE0_
    L15_224 = L15_224.COMP_VLAN_ADDRESSING_IPADDRESS_NIL
    return L15_224
  end
  L15_224 = _UPVALUE3_
  L15_224 = L15_224.ipAddressCheck
  L16_225 = IPV4_ADDRESS_FAMILY
  L17_226 = A4_213
  L15_224 = L15_224(L16_225, L17_226)
  L9_218 = L15_224
  L15_224 = _UPVALUE1_
  L15_224 = L15_224.ERROR
  if L9_218 == L15_224 then
    L15_224 = _UPVALUE0_
    L15_224 = L15_224.COMP_VLAN_ADDRESSING_IPADDRESS_INVALID
    return L15_224
  end
  L15_224 = NIL
  if A5_214 == L15_224 then
    L15_224 = _UPVALUE0_
    L15_224 = L15_224.COMP_VLAN_ADDRESSING_SUNBET_NIL
    return L15_224
  end
  L15_224 = _UPVALUE3_
  L15_224 = L15_224.ipAddressCheck
  L16_225 = IPV4_ADDRESS_FAMILY
  L17_226 = A5_214
  L15_224 = L15_224(L16_225, L17_226)
  L9_218 = L15_224
  L15_224 = _UPVALUE1_
  L15_224 = L15_224.ERROR
  if L9_218 == L15_224 then
    L15_224 = _UPVALUE0_
    L15_224 = L15_224.COMP_VLAN_ADDRESSING_SUNBET_INVALID
    return L15_224
  end
  L15_224 = NIL
  if A6_215 == L15_224 then
    L15_224 = _UPVALUE0_
    L15_224 = L15_224.COMP_VLAN_ADDRESSING_DHCPTYPE_NIL
    return L15_224
  end
  L15_224 = dhcpWorkType
  L15_224 = L15_224.none
  if A6_215 ~= L15_224 then
    L15_224 = dhcpWorkType
    L15_224 = L15_224.server
    if A6_215 ~= L15_224 then
      L15_224 = dhcpWorkType
      L15_224 = L15_224.relay
      if A6_215 ~= L15_224 then
        L15_224 = _UPVALUE0_
        L15_224 = L15_224.COMP_VLAN_ADDRESSING_DHCPTYPE_INVALID
        return L15_224
      end
    end
  end
  L15_224 = NIL
  if A2_211 == L15_224 then
    L15_224 = _UPVALUE0_
    L15_224 = L15_224.COMP_VLAN_ADDRESSING_VLANIPV6_NIL
    return L15_224
  end
  L15_224, L16_225 = nil, nil
  L17_226 = dhcpWorkType
  L17_226 = L17_226.none
  if A6_215 == L17_226 then
    L15_224 = DISABLE
    L16_225 = DISABLE
  else
    L17_226 = dhcpWorkType
    L17_226 = L17_226.server
    if A6_215 == L17_226 then
      L15_224 = ENABLE
      L16_225 = DISABLE
    else
      L17_226 = dhcpWorkType
      L17_226 = L17_226.relay
      if A6_215 == L17_226 then
        L15_224 = DISABLE
        L16_225 = ENABLE
      end
    end
  end
  L17_226 = NIL
  if A7_216 == L17_226 then
    L17_226 = _UPVALUE0_
    L17_226 = L17_226.COMP_VLAN_ADDRESSING_DNSPROXY_NIL
    return L17_226
  end
  L17_226 = _UPVALUE3_
  L17_226 = L17_226.isBoolean
  L18_227 = A7_216
  L17_226 = L17_226(L18_227)
  L9_218 = L17_226
  L17_226 = _UPVALUE1_
  L17_226 = L17_226.ERROR
  if L9_218 == L17_226 then
    L17_226 = _UPVALUE0_
    L17_226 = L17_226.COMP_VLAN_ADDRESSING_DNSPROXY_INVALID
    return L17_226
  end
  L17_226 = NIL
  if A8_217 == L17_226 then
    A8_217 = DEFAULT_RELAY_ADDRESS
  end
  L17_226 = {}
  L18_227 = vlanTable
  L19_228 = "."
  L20_229 = _UPVALUE2_
  L20_229 = L20_229.vlanId
  L18_227 = L18_227 .. L19_228 .. L20_229
  L17_226[L18_227] = A0_209
  L18_227 = vlanTable
  L19_228 = "."
  L20_229 = _UPVALUE2_
  L20_229 = L20_229.name
  L18_227 = L18_227 .. L19_228 .. L20_229
  L17_226[L18_227] = A1_210
  L18_227 = vlanTable
  L19_228 = "."
  L20_229 = _UPVALUE2_
  L20_229 = L20_229.portName
  L18_227 = L18_227 .. L19_228 .. L20_229
  L19_228 = DUMMY_PORT
  L17_226[L18_227] = L19_228
  L18_227 = vlanTable
  L19_228 = "."
  L20_229 = _UPVALUE2_
  L20_229 = L20_229.vlanIPv6
  L18_227 = L18_227 .. L19_228 .. L20_229
  L17_226[L18_227] = A2_211
  L18_227 = db
  L18_227 = L18_227.insert
  L19_228 = vlanTable
  L20_229 = L17_226
  L18_227 = L18_227(L19_228, L20_229)
  L19_228 = db
  L19_228 = L19_228.getAttribute
  L20_229 = vlanTable
  L21_230 = _UPVALUE2_
  L21_230 = L21_230.vlanId
  L22_231 = A0_209
  L23_232 = ROWID
  L19_228 = L19_228(L20_229, L21_230, L22_231, L23_232)
  L20_229 = NIL
  if L18_227 == L20_229 then
    L20_229 = _UPVALUE1_
    L20_229 = L20_229.FAILURE
    L21_230 = L19_228
    return L20_229, L21_230
  end
  L20_229 = {}
  L21_230 = vlanTable
  L22_231 = "."
  L23_232 = _UPVALUE2_
  L23_232 = L23_232.vlanId
  L21_230 = L21_230 .. L22_231 .. L23_232
  L20_229[L21_230] = A0_209
  L21_230 = vlanTable
  L22_231 = "."
  L23_232 = _UPVALUE2_
  L23_232 = L23_232.name
  L21_230 = L21_230 .. L22_231 .. L23_232
  L22_231 = _UPVALUE4_
  L20_229[L21_230] = L22_231
  L21_230 = vlanTable
  L22_231 = "."
  L23_232 = _UPVALUE2_
  L23_232 = L23_232.portName
  L21_230 = L21_230 .. L22_231 .. L23_232
  L22_231 = PORT10
  L20_229[L21_230] = L22_231
  L21_230 = vlanTable
  L22_231 = "."
  L23_232 = _UPVALUE2_
  L23_232 = L23_232.vlanIPv6
  L21_230 = L21_230 .. L22_231 .. L23_232
  L20_229[L21_230] = A2_211
  L21_230 = db
  L21_230 = L21_230.insert
  L22_231 = vlanTable
  L23_232 = L20_229
  L21_230 = L21_230(L22_231, L23_232)
  L22_231 = db
  L22_231 = L22_231.getAttribute
  L23_232 = vlanTable
  L24_233 = _UPVALUE2_
  L24_233 = L24_233.vlanId
  L25_234 = A0_209
  L26_235 = ROWID
  L22_231 = L22_231(L23_232, L24_233, L25_234, L26_235)
  L23_232 = NIL
  if L21_230 == L23_232 then
    L23_232 = _UPVALUE1_
    L23_232 = L23_232.FAILURE
    L24_233 = L22_231
    return L23_232, L24_233
  end
  L23_232 = {}
  L24_233 = intervlanTable
  L25_234 = "."
  L26_235 = _UPVALUE2_
  L26_235 = L26_235.vlanId
  L24_233 = L24_233 .. L25_234 .. L26_235
  L23_232[L24_233] = A0_209
  L24_233 = intervlanTable
  L25_234 = "."
  L26_235 = _UPVALUE2_
  L26_235 = L26_235.ifName
  L24_233 = L24_233 .. L25_234 .. L26_235
  L25_234 = BDG_NAME
  L26_235 = A0_209
  L25_234 = L25_234 .. L26_235
  L23_232[L24_233] = L25_234
  L24_233 = intervlanTable
  L25_234 = "."
  L26_235 = _UPVALUE2_
  L26_235 = L26_235.interVlanRouting
  L24_233 = L24_233 .. L25_234 .. L26_235
  L23_232[L24_233] = A3_212
  L24_233 = intervlanTable
  L25_234 = "."
  L26_235 = _UPVALUE2_
  L26_235 = L26_235.accessType
  L24_233 = L24_233 .. L25_234 .. L26_235
  L25_234 = DEFAULT_ACCESSTYPE
  L23_232[L24_233] = L25_234
  L24_233 = db
  L24_233 = L24_233.insert
  L25_234 = intervlanTable
  L26_235 = L23_232
  L24_233 = L24_233(L25_234, L26_235)
  L25_234 = NIL
  if L24_233 == L25_234 then
    L25_234 = _UPVALUE1_
    L25_234 = L25_234.FAILURE
    L26_235 = L22_231
    return L25_234, L26_235
  end
  L25_234 = {}
  L26_235 = intervlanTbl
  L27_236 = "."
  L28_237 = _UPVALUE2_
  L28_237 = L28_237.vlanId
  L26_235 = L26_235 .. L27_236 .. L28_237
  L25_234[L26_235] = A0_209
  L26_235 = intervlanTbl
  L27_236 = "."
  L28_237 = _UPVALUE2_
  L28_237 = L28_237.ifName
  L26_235 = L26_235 .. L27_236 .. L28_237
  L27_236 = BDG_NAME
  L28_237 = A0_209
  L27_236 = L27_236 .. L28_237
  L25_234[L26_235] = L27_236
  L26_235 = intervlanTbl
  L27_236 = "."
  L28_237 = _UPVALUE2_
  L28_237 = L28_237.interVlanRouting
  L26_235 = L26_235 .. L27_236 .. L28_237
  L25_234[L26_235] = A3_212
  L26_235 = intervlanTbl
  L27_236 = "."
  L28_237 = _UPVALUE2_
  L28_237 = L28_237.ipAddress
  L26_235 = L26_235 .. L27_236 .. L28_237
  L25_234[L26_235] = A4_213
  L26_235 = db
  L26_235 = L26_235.insert
  L27_236 = intervlanTbl
  L28_237 = L25_234
  L26_235 = L26_235(L27_236, L28_237)
  L24_233 = L26_235
  L26_235 = NIL
  if L24_233 == L26_235 then
    L26_235 = _UPVALUE1_
    L26_235 = L26_235.FAILURE
    L27_236 = L22_231
    return L26_235, L27_236
  end
  L26_235 = {}
  L27_236 = dhcpRelayTable
  L28_237 = "."
  L29_238 = _UPVALUE2_
  L29_238 = L29_238.interfaceName
  L27_236 = L27_236 .. L28_237 .. L29_238
  L28_237 = LAN_NAME
  L29_238 = A0_209
  L28_237 = L28_237 .. L29_238
  L26_235[L27_236] = L28_237
  L27_236 = dhcpRelayTable
  L28_237 = "."
  L29_238 = _UPVALUE2_
  L29_238 = L29_238.virtualIfName
  L27_236 = L27_236 .. L28_237 .. L29_238
  L28_237 = BDG_NAME
  L29_238 = A0_209
  L28_237 = L28_237 .. L29_238
  L26_235[L27_236] = L28_237
  L27_236 = dhcpRelayTable
  L28_237 = "."
  L29_238 = _UPVALUE2_
  L29_238 = L29_238.DhcpRelayStatus
  L27_236 = L27_236 .. L28_237 .. L29_238
  L26_235[L27_236] = L16_225
  L27_236 = dhcpRelayTable
  L28_237 = "."
  L29_238 = _UPVALUE2_
  L29_238 = L29_238.dhcpRelayIpAddress
  L27_236 = L27_236 .. L28_237 .. L29_238
  L26_235[L27_236] = A8_217
  L27_236 = db
  L27_236 = L27_236.insert
  L28_237 = dhcpRelayTable
  L29_238 = L26_235
  L27_236 = L27_236(L28_237, L29_238)
  L28_237 = NIL
  if L27_236 == L28_237 then
    L28_237 = _UPVALUE1_
    L28_237 = L28_237.FAILURE
    L29_238 = L22_231
    return L28_237, L29_238
  end
  L28_237 = {}
  L29_238 = dhcpTable
  L30_239 = "."
  L31_240 = _UPVALUE2_
  L31_240 = L31_240.dhcpType
  L29_238 = L29_238 .. L30_239 .. L31_240
  L28_237[L29_238] = L15_224
  L29_238 = dhcpTable
  L30_239 = "."
  L31_240 = _UPVALUE2_
  L31_240 = L31_240.dnsProxy
  L29_238 = L29_238 .. L30_239 .. L31_240
  L28_237[L29_238] = A7_216
  L29_238 = db
  L29_238 = L29_238.getAttribute
  L30_239 = dhcpTable
  L31_240 = _UPVALUE2_
  L31_240 = L31_240.logicalIfName
  L32_241 = LAN_NAME
  L33_242 = A0_209
  L32_241 = L32_241 .. L33_242
  L33_242 = ROWID
  L29_238 = L29_238(L30_239, L31_240, L32_241, L33_242)
  L30_239 = db
  L30_239 = L30_239.update
  L31_240 = dhcpTable
  L32_241 = L28_237
  L33_242 = L29_238
  L30_239 = L30_239(L31_240, L32_241, L33_242)
  L31_240 = NIL
  if L30_239 == L31_240 then
    L31_240 = _UPVALUE1_
    L31_240 = L31_240.FAILURE
    L32_241 = L22_231
    return L31_240, L32_241
  end
  L31_240 = {}
  L32_241 = usbSharePortTable
  L33_242 = "."
  L34_243 = _UPVALUE5_
  L34_243 = L34_243.attribute
  L34_243 = L34_243.vlanId
  L32_241 = L32_241 .. L33_242 .. L34_243
  L31_240[L32_241] = A0_209
  L32_241 = usbSharePortTable
  L33_242 = "."
  L34_243 = _UPVALUE5_
  L34_243 = L34_243.attribute
  L34_243 = L34_243.vlanName
  L32_241 = L32_241 .. L33_242 .. L34_243
  L31_240[L32_241] = A1_210
  L32_241 = usbSharePortTable
  L33_242 = "."
  L34_243 = _UPVALUE5_
  L34_243 = L34_243.attribute
  L34_243 = L34_243.interfaceName
  L32_241 = L32_241 .. L33_242 .. L34_243
  L33_242 = BDG_NAME
  L34_243 = A0_209
  L33_242 = L33_242 .. L34_243
  L31_240[L32_241] = L33_242
  L32_241 = usbSharePortTable
  L33_242 = "."
  L34_243 = _UPVALUE5_
  L34_243 = L34_243.attribute
  L34_243 = L34_243.storageSharing
  L32_241 = L32_241 .. L33_242 .. L34_243
  L33_242 = DISABLE
  L31_240[L32_241] = L33_242
  L32_241 = usbSharePortTable
  L33_242 = "."
  L34_243 = _UPVALUE5_
  L34_243 = L34_243.attribute
  L34_243 = L34_243.printerSharing
  L32_241 = L32_241 .. L33_242 .. L34_243
  L33_242 = DISABLE
  L31_240[L32_241] = L33_242
  L32_241 = db
  L32_241 = L32_241.insert
  L33_242 = usbSharePortTable
  L34_243 = L31_240
  L32_241 = L32_241(L33_242, L34_243)
  L33_242 = NIL
  if L32_241 == L33_242 then
    L33_242 = _UPVALUE1_
    L33_242 = L33_242.FAILURE
    L34_243 = L22_231
    return L33_242, L34_243
  end
  L33_242 = {}
  L33_242["fbwifivlan.vlanId"] = A0_209
  L33_242["fbwifivlan.vlanName"] = A1_210
  L34_243 = BDG_NAME
  L35_244 = A0_209
  L34_243 = L34_243 .. L35_244
  L33_242["fbwifivlan.interfaceName"] = L34_243
  L33_242["fbwifivlan.fbwifion"] = "0"
  L34_243 = db
  L34_243 = L34_243.insert
  L35_244 = "fbwifivlan"
  L36_245 = L33_242
  L34_243 = L34_243(L35_244, L36_245)
  L35_244 = NIL
  if L34_243 == L35_244 then
    L35_244 = _UPVALUE1_
    L35_244 = L35_244.FAILURE
    L36_245 = L22_231
    return L35_244, L36_245
  end
  L35_244 = {}
  L36_245 = tcpdumpTable
  L37_246 = "."
  L38_247 = _UPVALUE6_
  L38_247 = L38_247.attribute
  L38_247 = L38_247.LogicalIfName
  L36_245 = L36_245 .. L37_246 .. L38_247
  L37_246 = LAN_NAME
  L38_247 = A0_209
  L37_246 = L37_246 .. L38_247
  L35_244[L36_245] = L37_246
  L36_245 = tcpdumpTable
  L37_246 = "."
  L38_247 = _UPVALUE6_
  L38_247 = L38_247.attribute
  L38_247 = L38_247.tcpdumpEnabled
  L36_245 = L36_245 .. L37_246 .. L38_247
  L37_246 = DISABLE
  L35_244[L36_245] = L37_246
  L36_245 = db
  L36_245 = L36_245.insert
  L37_246 = tcpdumpTable
  L38_247 = L35_244
  L36_245 = L36_245(L37_246, L38_247)
  L37_246 = NIL
  if L36_245 == L37_246 then
    L37_246 = _UPVALUE1_
    L37_246 = L37_246.FAILURE
    L38_247 = L22_231
    return L37_246, L38_247
  end
  L37_246 = UNIT_NAME
  if L37_246 ~= "DSR-250" then
    L37_246 = UNIT_NAME
    if L37_246 ~= "DSR-250N" then
      L37_246 = UNIT_NAME
      if L37_246 ~= "DSR-150" then
        L37_246 = UNIT_NAME
      end
    end
  elseif L37_246 == "DSR-150N" then
    L37_246 = 63
    L38_247 = 0
    L39_248 = ""
    for L43_252 = 0, L37_246 do
      L39_248 = "/pfrm2.0/bin/vlan_table_func read " .. L43_252 .. "|/bin/grep valid|/bin/grep 0|/usr/bin/wc -l>/tmp/spe_vlan.op"
      os.execute(L39_248)
      f = io.open("/tmp/spe_vlan.op", "r")
      if f ~= nil then
        valid_val = f:read("*line")
        f:close()
      end
      if valid_val == "1" then
        L38_247 = L43_252
        break
      end
    end
    if L37_246 > L38_247 then
      L43_252 = _UPVALUE2_
      L43_252 = L43_252.vlanId
      L40_249[L41_250] = A0_209
      L43_252 = _UPVALUE2_
      L43_252 = L43_252.vlanIndex
      L40_249[L41_250] = L38_247
      L43_252 = L40_249
      L34_243 = L41_250
      if L34_243 == L41_250 then
        return L41_250, L42_251
      end
    end
  end
  L37_246 = {}
  L38_247 = zonesTable
  L39_248 = "."
  L38_247 = L38_247 .. L39_248 .. L40_249
  L39_248 = _UPVALUE8_
  L37_246[L38_247] = L39_248
  L38_247 = zonesTable
  L39_248 = "."
  L38_247 = L38_247 .. L39_248 .. L40_249
  L39_248 = LAN_NAME
  L39_248 = L39_248 .. L40_249
  L37_246[L38_247] = L39_248
  L38_247 = db
  L38_247 = L38_247.insert
  L39_248 = zonesTable
  L38_247 = L38_247(L39_248, L40_249)
  L39_248 = NIL
  if L38_247 == L39_248 then
    L39_248 = _UPVALUE1_
    L39_248 = L39_248.FAILURE
    return L39_248, L40_249
  end
  L39_248 = {}
  L39_248[L40_249] = A0_209
  L39_248[L40_249] = "--"
  if L40_249 == L41_250 then
    return L41_250, L42_251
  end
  L43_252 = A5_214
  L34_243 = L41_250
  L43_252 = A5_214
  L34_243 = L41_250
  return L41_250, L42_251
end
function vlanDelete(A0_253)
  local L1_254, L2_255, L3_256, L4_257, L5_258, L6_259, L7_260, L8_261, L9_262, L10_263, L11_264, L12_265, L13_266, L14_267, L15_268, L16_269, L17_270, L18_271, L19_272, L20_273, L21_274, L22_275, L23_276, L24_277, L25_278, L26_279, L27_280, L28_281, L29_282, L30_283, L31_284, L32_285, L33_286, L34_287, L35_288, L36_289
  L2_255 = checkCookieExists
  L3_256 = A0_253
  L4_257 = vlanTable
  L2_255 = L2_255(L3_256, L4_257)
  L3_256 = FALSE
  if L2_255 == L3_256 then
    L2_255 = _UPVALUE0_
    L2_255 = L2_255.INVALID_COOKIE
    return L2_255
  end
  L2_255 = db
  L2_255 = L2_255.getAttribute
  L3_256 = vlanTable
  L4_257 = ROWID
  L5_258 = A0_253
  L6_259 = _UPVALUE1_
  L6_259 = L6_259.vlanId
  L2_255 = L2_255(L3_256, L4_257, L5_258, L6_259)
  L3_256 = DefaultVlan
  if L2_255 == L3_256 then
    L3_256 = _UPVALUE0_
    L3_256 = L3_256.NOT_SUPPORTED
    L4_257 = A0_253
    return L3_256, L4_257
  end
  L3_256 = NIL
  if L2_255 == L3_256 then
    L3_256 = _UPVALUE0_
    L3_256 = L3_256.FAILURE
    L4_257 = A0_253
    return L3_256, L4_257
  end
  L3_256 = nil
  L4_257 = LAN_NAME
  L5_258 = L2_255
  L3_256 = L4_257 .. L5_258
  L4_257 = db
  L4_257 = L4_257.getAttribute
  L5_258 = vlanTable
  L6_259 = ROWID
  L7_260 = A0_253
  L8_261 = _UPVALUE1_
  L8_261 = L8_261.name
  L4_257 = L4_257(L5_258, L6_259, L7_260, L8_261)
  L5_258 = db
  L5_258 = L5_258.existsRow
  L6_259 = serviceRouteTable
  L7_260 = _UPVALUE1_
  L7_260 = L7_260.name
  L8_261 = L4_257
  L5_258 = L5_258(L6_259, L7_260, L8_261)
  if L5_258 then
    L5_258 = _UPVALUE0_
    L5_258 = L5_258.VLAN_IN_USE_BY_SERVICEROUTE
    return L5_258
  end
  L5_258 = db
  L5_258 = L5_258.existsRow
  L6_259 = lanaddresspoolsTable
  L7_260 = _UPVALUE1_
  L7_260 = L7_260.networkInterfaceName
  L8_261 = L3_256
  L5_258 = L5_258(L6_259, L7_260, L8_261)
  if L5_258 then
    L5_258 = _UPVALUE0_
    L5_258 = L5_258.VLAN_IN_USE_BY_ADDRESSPOOL
    return L5_258
  end
  L5_258 = db
  L5_258 = L5_258.existsRow
  L6_259 = radvdLANPrefixPoolTable
  L7_260 = _UPVALUE1_
  L7_260 = L7_260.networkInterfaceName
  L8_261 = L3_256
  L5_258 = L5_258(L6_259, L7_260, L8_261)
  if L5_258 then
    L5_258 = _UPVALUE0_
    L5_258 = L5_258.VLAN_IN_USE_BY_ADVERTISEMENT_PREFIXES
    return L5_258
  end
  L5_258 = db
  L5_258 = L5_258.existsRow
  L6_259 = lanprefixpoolsTable
  L7_260 = _UPVALUE1_
  L7_260 = L7_260.networkInterfaceName
  L8_261 = L3_256
  L5_258 = L5_258(L6_259, L7_260, L8_261)
  if L5_258 then
    L5_258 = _UPVALUE0_
    L5_258 = L5_258.VLAN_IN_USE_BY_ADDRESS_PREFIXPOOL
    return L5_258
  end
  L5_258 = db
  L5_258 = L5_258.existsRow
  L6_259 = sessionLimitTable
  L7_260 = _UPVALUE1_
  L7_260 = L7_260.sessInterface
  L8_261 = L3_256
  L5_258 = L5_258(L6_259, L7_260, L8_261)
  if L5_258 then
    L5_258 = _UPVALUE0_
    L5_258 = L5_258.VLAN_IN_USE_BY_SESSION_LIMIT
    return L5_258
  end
  L5_258 = UNIT_NAME
  if L5_258 ~= "DSR-250N" then
    L5_258 = UNIT_NAME
    if L5_258 ~= "DSR-250" then
      L5_258 = UNIT_NAME
      if L5_258 ~= "DSR-150N" then
        L5_258 = UNIT_NAME
      end
    end
  else
    if L5_258 == "DSR-150" then
      L5_258 = _UPVALUE1_
      L5_258 = L5_258.vlanId
      L6_259 = " = '"
      L7_260 = L2_255
      L8_261 = "' and "
      L9_262 = _UPVALUE1_
      L9_262 = L9_262.portName
      L10_263 = " != '"
      L11_264 = DUMMY_PORT
      L12_265 = "' and "
      L13_266 = _UPVALUE1_
      L13_266 = L13_266.portName
      L14_267 = " != '"
      L15_268 = PORT10
      L16_269 = "'"
      L1_254 = L5_258 .. L6_259 .. L7_260 .. L8_261 .. L9_262 .. L10_263 .. L11_264 .. L12_265 .. L13_266 .. L14_267 .. L15_268 .. L16_269
  end
  else
    L5_258 = _UPVALUE1_
    L5_258 = L5_258.vlanId
    L6_259 = " = '"
    L7_260 = L2_255
    L8_261 = "' and "
    L9_262 = _UPVALUE1_
    L9_262 = L9_262.portName
    L10_263 = " != '"
    L11_264 = DUMMY_PORT
    L12_265 = "' and "
    L13_266 = _UPVALUE1_
    L13_266 = L13_266.portName
    L14_267 = " != '"
    L15_268 = PORT10
    L16_269 = "' and "
    L20_273 = "' and "
    L21_274 = _UPVALUE1_
    L21_274 = L21_274.portName
    L22_275 = " != '"
    L23_276 = PORT200
    L24_277 = "'"
    L1_254 = L5_258 .. L6_259 .. L7_260 .. L8_261 .. L9_262 .. L10_263 .. L11_264 .. L12_265 .. L13_266 .. L14_267 .. L15_268 .. L16_269 .. L17_270 .. L18_271 .. L19_272 .. L20_273 .. L21_274 .. L22_275 .. L23_276 .. L24_277
  end
  L5_258 = db
  L5_258 = L5_258.existsRowWhere
  L6_259 = vlanTable
  L7_260 = L1_254
  L5_258 = L5_258(L6_259, L7_260)
  if L5_258 then
    L6_259 = _UPVALUE2_
    L6_259 = L6_259.COMP_VLAN_ADDRESSING_IN_USE
    return L6_259
  end
  L6_259 = firewallRuleToZoneId
  L7_260 = "='"
  L8_261 = L2_255
  L9_262 = "' or "
  L10_263 = firewallRuleFromZoneId
  L11_264 = "='"
  L12_265 = L2_255
  L13_266 = "'"
  L6_259 = L6_259 .. L7_260 .. L8_261 .. L9_262 .. L10_263 .. L11_264 .. L12_265 .. L13_266
  L7_260 = db
  L7_260 = L7_260.existsRowWhere
  L8_261 = firewallRuleTable
  L9_262 = L6_259
  L7_260 = L7_260(L8_261, L9_262)
  if L7_260 then
    L8_261 = _UPVALUE2_
    L8_261 = L8_261.COMP_VLAN_ADDRESSING_IN_USE_FIREWALL
    return L8_261
  end
  L8_261 = _UPVALUE1_
  L8_261 = L8_261.interface
  L9_262 = "='"
  L10_263 = L3_256
  L11_264 = "'"
  L1_254 = L8_261 .. L9_262 .. L10_263 .. L11_264
  L8_261 = db
  L8_261 = L8_261.existsRowWhere
  L9_262 = _UPVALUE3_
  L10_263 = L1_254
  L8_261 = L8_261(L9_262, L10_263)
  L7_260 = L8_261
  if L7_260 then
    L8_261 = _UPVALUE2_
    L8_261 = L8_261.COMP_VLAN_ADDRESSING_IN_USE_URLFILTERING_ACL
    return L8_261
  end
  L8_261 = voiceVlanName
  L9_262 = "='"
  L10_263 = L2_255
  L11_264 = "'"
  L6_259 = L8_261 .. L9_262 .. L10_263 .. L11_264
  L8_261 = db
  L8_261 = L8_261.existsRowWhere
  L9_262 = VoiceVlanInterfaceConfigTable
  L10_263 = L6_259
  L8_261 = L8_261(L9_262, L10_263)
  if L8_261 then
    L9_262 = _UPVALUE2_
    L9_262 = L9_262.COMP_VLAN_ADDRESSING_IN_USE_VOICE_VLAN
    return L9_262
  end
  L9_262 = _UPVALUE1_
  L9_262 = L9_262.vlanId
  L10_263 = "='"
  L11_264 = L2_255
  L12_265 = "'"
  L6_259 = L9_262 .. L10_263 .. L11_264 .. L12_265
  L9_262 = db
  L9_262 = L9_262.existsRowWhere
  L10_263 = MacVlanConfigTable
  L11_264 = L6_259
  L9_262 = L9_262(L10_263, L11_264)
  if L9_262 then
    L10_263 = _UPVALUE2_
    L10_263 = L10_263.COMP_VLAN_ADDRESSING_IN_USE_MAC_VLAN
    return L10_263
  end
  L10_263 = _UPVALUE1_
  L10_263 = L10_263.vlanId
  L11_264 = "='"
  L12_265 = L2_255
  L13_266 = "'"
  L6_259 = L10_263 .. L11_264 .. L12_265 .. L13_266
  L10_263 = db
  L10_263 = L10_263.existsRowWhere
  L11_264 = ProtocolVlanConfigTable
  L12_265 = L6_259
  L10_263 = L10_263(L11_264, L12_265)
  if L10_263 then
    L11_264 = _UPVALUE2_
    L11_264 = L11_264.COMP_VLAN_ADDRESSING_IN_USE_PROTOCOL_VLAN
    return L11_264
  end
  L11_264 = _UPVALUE1_
  L11_264 = L11_264.vlanId
  L12_265 = "='"
  L13_266 = L2_255
  L14_267 = "'"
  L6_259 = L11_264 .. L12_265 .. L13_266 .. L14_267
  L11_264 = db
  L11_264 = L11_264.existsRowWhere
  L12_265 = _UPVALUE4_
  L13_266 = L6_259
  L11_264 = L11_264(L12_265, L13_266)
  if L11_264 then
    L12_265 = _UPVALUE2_
    L12_265 = L12_265.COMP_VLAN_ADDRESSING_IN_USE_TRAFFIC_SHAPING
    return L12_265
  end
  L12_265 = _UPVALUE5_
  L13_266 = "='"
  L14_267 = L2_255
  L15_268 = "'"
  L6_259 = L12_265 .. L13_266 .. L14_267 .. L15_268
  L12_265 = db
  L12_265 = L12_265.existsRowWhere
  L13_266 = _UPVALUE6_
  L14_267 = L6_259
  L12_265 = L12_265(L13_266, L14_267)
  if L12_265 then
    L13_266 = _UPVALUE2_
    L13_266 = L13_266.COMP_VLAN_ADDRESSING_IN_USE_ADVANCED_QOS
    return L13_266
  end
  L13_266 = _UPVALUE7_
  L13_266 = L13_266.attribute
  L13_266 = L13_266.LogicalIfName
  L14_267 = "='"
  L15_268 = _UPVALUE8_
  L16_269 = L2_255
  L20_273 = ENABLE
  L21_274 = "'"
  L6_259 = L13_266 .. L14_267 .. L15_268 .. L16_269 .. L17_270 .. L18_271 .. L19_272 .. L20_273 .. L21_274
  L13_266 = db
  L13_266 = L13_266.existsRowWhere
  L14_267 = tcpdumpTable
  L15_268 = L6_259
  L13_266 = L13_266(L14_267, L15_268)
  if L13_266 then
    L14_267 = _UPVALUE2_
    L14_267 = L14_267.COMP_VLAN_ADDRESSING_CAPTURE_PACKET_IN_PROGRESS
    return L14_267
  end
  L14_267 = {}
  L15_268 = nil
  L16_269 = staticRoutesGetAll
  L16_269 = L16_269()
  L14_267 = L17_270
  L15_268 = L16_269
  L16_269 = ""
  for L20_273, L21_274 in L17_270(L18_271) do
    L22_275 = _UPVALUE9_
    L23_276 = "."
    L24_277 = _UPVALUE1_
    L24_277 = L24_277.interface
    L22_275 = L22_275 .. L23_276 .. L24_277
    L16_269 = L21_274[L22_275]
    L22_275 = string
    L22_275 = L22_275.sub
    L23_276 = L16_269
    L24_277 = 1
    L25_278 = 3
    L22_275 = L22_275(L23_276, L24_277, L25_278)
    L23_276 = string
    L23_276 = L23_276.sub
    L24_277 = L16_269
    L25_278 = 4
    L23_276 = L23_276(L24_277, L25_278)
    if L22_275 == "LAN" then
      L24_277 = tonumber
      L25_278 = L23_276
      L24_277 = L24_277(L25_278)
      L25_278 = tonumber
      L26_279 = L2_255
      L25_278 = L25_278(L26_279)
      if L24_277 == L25_278 then
        L24_277 = _UPVALUE2_
        L24_277 = L24_277.COMP_VLAN_STATIC_ROUTING_IN_USE
        return L24_277
      end
    end
  end
  L22_275 = L17_270()
  L23_276 = BDG_NAME
  L24_277 = L2_255
  L23_276 = L23_276 .. L24_277
  if L20_273 == L23_276 then
    L23_276 = _UPVALUE2_
    L23_276 = L23_276.COMP_VLAN_ADDRESSING_IN_USE_UPNP
    return L23_276
  end
  L23_276 = db
  L23_276 = L23_276.existsRowWhere
  L24_277 = "fbwifivlan"
  L25_278 = "vlanId = "
  L26_279 = L2_255
  L27_280 = " and fbwifion = 1"
  L25_278 = L25_278 .. L26_279 .. L27_280
  L23_276 = L23_276(L24_277, L25_278)
  if L23_276 then
    L24_277 = "VLAN_FBWIFI_ENABLED"
    return L24_277
  end
  L24_277 = _UPVALUE1_
  L24_277 = L24_277.vlanId
  L25_278 = " = '"
  L26_279 = L2_255
  L27_280 = "' and "
  L28_281 = _UPVALUE1_
  L28_281 = L28_281.portName
  L29_282 = " = '"
  L30_283 = PORT10
  L31_284 = "'"
  L24_277 = L24_277 .. L25_278 .. L26_279 .. L27_280 .. L28_281 .. L29_282 .. L30_283 .. L31_284
  L25_278 = db
  L25_278 = L25_278.deleteRowWhere
  L26_279 = vlanTable
  L27_280 = L24_277
  L25_278 = L25_278(L26_279, L27_280)
  L26_279 = NIL
  if L25_278 == L26_279 then
    L26_279 = _UPVALUE0_
    L26_279 = L26_279.FAILURE
    L27_280 = A0_253
    return L26_279, L27_280
  end
  L26_279 = _UPVALUE1_
  L26_279 = L26_279.vlanId
  L27_280 = " = '"
  L28_281 = L2_255
  L29_282 = "' and "
  L30_283 = _UPVALUE1_
  L30_283 = L30_283.portName
  L31_284 = " = '"
  L32_285 = DUMMY_PORT
  L33_286 = "'"
  L24_277 = L26_279 .. L27_280 .. L28_281 .. L29_282 .. L30_283 .. L31_284 .. L32_285 .. L33_286
  L26_279 = db
  L26_279 = L26_279.deleteRowWhere
  L27_280 = vlanTable
  L28_281 = L24_277
  L26_279 = L26_279(L27_280, L28_281)
  L27_280 = NIL
  if L26_279 == L27_280 then
    L27_280 = _UPVALUE0_
    L27_280 = L27_280.FAILURE
    L28_281 = A0_253
    return L27_280, L28_281
  end
  L27_280 = db
  L27_280 = L27_280.deleteRow
  L28_281 = intervlanTable
  L29_282 = _UPVALUE1_
  L29_282 = L29_282.vlanId
  L30_283 = L2_255
  L27_280 = L27_280(L28_281, L29_282, L30_283)
  L28_281 = NIL
  if L27_280 == L28_281 then
    L28_281 = _UPVALUE0_
    L28_281 = L28_281.FAILURE
    L29_282 = A0_253
    return L28_281, L29_282
  end
  L28_281 = db
  L28_281 = L28_281.deleteRow
  L29_282 = intervlanTbl
  L30_283 = _UPVALUE1_
  L30_283 = L30_283.vlanId
  L31_284 = L2_255
  L28_281 = L28_281(L29_282, L30_283, L31_284)
  L27_280 = L28_281
  L28_281 = NIL
  if L27_280 == L28_281 then
    L28_281 = _UPVALUE0_
    L28_281 = L28_281.FAILURE
    L29_282 = A0_253
    return L28_281, L29_282
  end
  L28_281 = db
  L28_281 = L28_281.deleteRow
  L29_282 = subnetTable
  L30_283 = _UPVALUE1_
  L30_283 = L30_283.interfaceName
  L31_284 = L3_256
  L28_281 = L28_281(L29_282, L30_283, L31_284)
  L29_282 = NIL
  if L28_281 == L29_282 then
    L29_282 = _UPVALUE0_
    L29_282 = L29_282.FAILURE
    L30_283 = A0_253
    return L29_282, L30_283
  end
  L29_282 = db
  L29_282 = L29_282.deleteRow
  L30_283 = dhcpRelayTable
  L31_284 = _UPVALUE1_
  L31_284 = L31_284.interfaceName
  L32_285 = L3_256
  L29_282 = L29_282(L30_283, L31_284, L32_285)
  L30_283 = NIL
  if L29_282 == L30_283 then
    L30_283 = _UPVALUE0_
    L30_283 = L30_283.FAILURE
    L31_284 = A0_253
    return L30_283, L31_284
  end
  L30_283 = db
  L30_283 = L30_283.deleteRow
  L31_284 = networkInterfaceTable
  L32_285 = _UPVALUE1_
  L32_285 = L32_285.interfaceName
  L33_286 = L3_256
  L30_283 = L30_283(L31_284, L32_285, L33_286)
  L31_284 = NIL
  if L30_283 == L31_284 then
    L31_284 = _UPVALUE0_
    L31_284 = L31_284.FAILURE
    L32_285 = A0_253
    return L31_284, L32_285
  end
  L31_284 = db
  L31_284 = L31_284.deleteRow
  L32_285 = ipAddressTable
  L33_286 = _UPVALUE1_
  L33_286 = L33_286.interfaceName
  L34_287 = L3_256
  L31_284 = L31_284(L32_285, L33_286, L34_287)
  L32_285 = NIL
  if L31_284 == L32_285 then
    L32_285 = _UPVALUE0_
    L32_285 = L32_285.FAILURE
    L33_286 = A0_253
    return L32_285, L33_286
  end
  L32_285 = BDG_NAME
  L33_286 = L2_255
  L32_285 = L32_285 .. L33_286
  L33_286 = DEFAULT_BDG
  if L32_285 ~= L33_286 then
    L33_286 = db
    L33_286 = L33_286.deleteRow
    L34_287 = ipv6InterfacesTable
    L35_288 = _UPVALUE1_
    L35_288 = L35_288.networkInterfaceName
    L36_289 = L32_285
    L33_286 = L33_286(L34_287, L35_288, L36_289)
    L31_284 = L33_286
    L33_286 = NIL
    if L31_284 == L33_286 then
      L33_286 = _UPVALUE0_
      L33_286 = L33_286.FAILURE
      L34_287 = A0_253
      return L33_286, L34_287
    end
  end
  L33_286 = db
  L33_286 = L33_286.deleteRow
  L34_287 = usbSharePortTable
  L35_288 = _UPVALUE11_
  L35_288 = L35_288.attribute
  L35_288 = L35_288.vlanId
  L36_289 = L2_255
  L33_286 = L33_286(L34_287, L35_288, L36_289)
  L34_287 = NIL
  if L33_286 == L34_287 then
    L34_287 = _UPVALUE0_
    L34_287 = L34_287.FAILURE
    L35_288 = A0_253
    return L34_287, L35_288
  end
  L34_287 = db
  L34_287 = L34_287.deleteRow
  L35_288 = tcpdumpTable
  L36_289 = _UPVALUE7_
  L36_289 = L36_289.attribute
  L36_289 = L36_289.LogicalIfName
  L34_287 = L34_287(L35_288, L36_289, LAN_NAME .. L2_255)
  L35_288 = NIL
  if L34_287 == L35_288 then
    L35_288 = _UPVALUE0_
    L35_288 = L35_288.FAILURE
    L36_289 = A0_253
    return L35_288, L36_289
  end
  L35_288 = db
  L35_288 = L35_288.deleteRow
  L36_289 = zonesTable
  L35_288 = L35_288(L36_289, _UPVALUE12_.attribute.zonelogicalIfname, LAN_NAME .. L2_255)
  L36_289 = NIL
  if L35_288 == L36_289 then
    L36_289 = _UPVALUE0_
    L36_289 = L36_289.FAILURE
    return L36_289, A0_253
  end
  L36_289 = UNIT_NAME
  if L36_289 ~= "DSR-250" then
    L36_289 = UNIT_NAME
    if L36_289 ~= "DSR-250N" then
      L36_289 = UNIT_NAME
      if L36_289 ~= "DSR-150" then
        L36_289 = UNIT_NAME
      end
    end
  elseif L36_289 == "DSR-150N" then
    L36_289 = _UPVALUE1_
    L36_289 = L36_289.vlanId
    L36_289 = L36_289 .. "=" .. L2_255 .. " AND LogicalIfName ='LAN'"
    status8 = db.deleteRowWhere(vlanPSEntryTable, L36_289)
    if status8 == NIL then
      return _UPVALUE0_.FAILURE, A0_253
    end
  end
  L36_289 = db
  L36_289 = L36_289.deleteRow
  L36_289 = L36_289(webAccessTable, "vlanName", LAN_NAME .. L2_255)
  if L36_289 == NIL then
    return _UPVALUE0_.FAILURE, A0_253
  end
  if db.deleteRow(igmpPortMapTbl, _UPVALUE1_.vlanId, L2_255) == NIL then
    return _UPVALUE0_.FAILURE, A0_253
  end
  if db.existsRow("fbwifivlan", "vlanId", L2_255) ~= nil then
    L5_258 = db.deleteRow("fbwifivlan", "vlanId", L2_255)
    if L5_258 == NIL then
      return _UPVALUE0_.FAILURE, A0_253
    end
  end
  _UPVALUE13_.accountingVlanServerDelete(L2_255)
  _UPVALUE14_.authenticatingVlanServerDelete(L2_255)
  return _UPVALUE0_.SUCCESS, A0_253
end
function vlanDeleteAll()
  local L0_290, L1_291, L2_292, L3_293, L4_294, L5_295, L6_296, L7_297, L8_298, L9_299, L10_300, L11_301, L12_302, L13_303, L14_304, L15_305, L16_306, L17_307, L18_308, L19_309, L20_310, L21_311, L22_312, L23_313, L24_314, L25_315, L26_316, L27_317, L28_318, L29_319, L30_320, L31_321, L32_322, L33_323, L34_324, L35_325, L36_326
  L1_291 = vlanIdGetAll
  L2_292 = L1_291()
  if L1_291 ~= L3_293 then
    return L3_293, L4_294
  end
  for L6_296, L7_297 in L3_293(L4_294) do
    L8_298 = _UPVALUE1_
    L8_298 = L8_298.vlanId
    L8_298 = L7_297[L8_298]
    L12_302 = _UPVALUE1_
    L12_302 = L12_302.name
    L13_303 = L9_299
    if L10_300 then
      return L10_300
    end
    L12_302 = _UPVALUE1_
    L12_302 = L12_302.networkInterfaceName
    L13_303 = LAN_NAME
    L14_304 = L8_298
    L13_303 = L13_303 .. L14_304
    if L10_300 then
      return L10_300
    end
    L12_302 = _UPVALUE1_
    L12_302 = L12_302.networkInterfaceName
    L13_303 = LAN_NAME
    L14_304 = L8_298
    L13_303 = L13_303 .. L14_304
    if L10_300 then
      return L10_300
    end
    L12_302 = _UPVALUE1_
    L12_302 = L12_302.networkInterfaceName
    L13_303 = LAN_NAME
    L14_304 = L8_298
    L13_303 = L13_303 .. L14_304
    if L10_300 then
      return L10_300
    end
    L12_302 = _UPVALUE1_
    L12_302 = L12_302.sessInterface
    L13_303 = LAN_NAME
    L14_304 = L8_298
    L13_303 = L13_303 .. L14_304
    if L10_300 then
      return L10_300
    end
    if L8_298 ~= L10_300 then
      if L10_300 ~= "DSR-250N" then
      else
        if L10_300 == "DSR-150" then
          L12_302 = L8_298
          L13_303 = "' and "
          L14_304 = _UPVALUE1_
          L14_304 = L14_304.portName
          L15_305 = " != '"
          L16_306 = DUMMY_PORT
          L17_307 = "' and "
          L18_308 = _UPVALUE1_
          L18_308 = L18_308.portName
          L19_309 = " != '"
          L20_310 = PORT10
          L21_311 = "'"
          L0_290 = L10_300 .. L11_301 .. L12_302 .. L13_303 .. L14_304 .. L15_305 .. L16_306 .. L17_307 .. L18_308 .. L19_309 .. L20_310 .. L21_311
      end
      else
        L12_302 = L8_298
        L13_303 = "' and "
        L14_304 = _UPVALUE1_
        L14_304 = L14_304.portName
        L15_305 = " != '"
        L16_306 = DUMMY_PORT
        L17_307 = "' and "
        L18_308 = _UPVALUE1_
        L18_308 = L18_308.portName
        L19_309 = " != '"
        L20_310 = PORT10
        L21_311 = "' and "
        L22_312 = _UPVALUE1_
        L22_312 = L22_312.portName
        L23_313 = " != '"
        L24_314 = PORT100
        L25_315 = "' and "
        L26_316 = _UPVALUE1_
        L26_316 = L26_316.portName
        L27_317 = " != '"
        L28_318 = PORT200
        L29_319 = "'"
        L0_290 = L10_300 .. L11_301 .. L12_302 .. L13_303 .. L14_304 .. L15_305 .. L16_306 .. L17_307 .. L18_308 .. L19_309 .. L20_310 .. L21_311 .. L22_312 .. L23_313 .. L24_314 .. L25_315 .. L26_316 .. L27_317 .. L28_318 .. L29_319
      end
      L12_302 = L0_290
      if L10_300 then
        return L11_301
      end
      L12_302 = "='"
      L13_303 = L8_298
      L14_304 = "' or "
      L15_305 = firewallRuleFromZoneId
      L16_306 = "='"
      L17_307 = L8_298
      L18_308 = "'"
      L12_302 = db
      L12_302 = L12_302.existsRowWhere
      L13_303 = firewallRuleTable
      L14_304 = L11_301
      L12_302 = L12_302(L13_303, L14_304)
      if L12_302 then
        L13_303 = _UPVALUE2_
        L13_303 = L13_303.COMP_VLAN_ADDRESSING_IN_USE_FIREWALL
        return L13_303
      end
      L13_303 = LAN_NAME
      L14_304 = L8_298
      L13_303 = L13_303 .. L14_304
      L14_304 = _UPVALUE1_
      L14_304 = L14_304.interface
      L15_305 = "='"
      L16_306 = L13_303
      L17_307 = "'"
      L0_290 = L14_304 .. L15_305 .. L16_306 .. L17_307
      L14_304 = db
      L14_304 = L14_304.existsRowWhere
      L15_305 = _UPVALUE3_
      L16_306 = L0_290
      L14_304 = L14_304(L15_305, L16_306)
      L12_302 = L14_304
      if L12_302 then
        L14_304 = _UPVALUE2_
        L14_304 = L14_304.COMP_VLAN_ADDRESSING_IN_USE_URLFILTERING_ACL
        return L14_304
      end
      L14_304 = voiceVlanName
      L15_305 = "='"
      L16_306 = L8_298
      L17_307 = "'"
      L14_304 = db
      L14_304 = L14_304.existsRowWhere
      L15_305 = VoiceVlanInterfaceConfigTable
      L16_306 = L11_301
      L14_304 = L14_304(L15_305, L16_306)
      if L14_304 then
        L15_305 = _UPVALUE2_
        L15_305 = L15_305.COMP_VLAN_ADDRESSING_IN_USE_VOICE_VLAN
        return L15_305
      end
      L15_305 = _UPVALUE1_
      L15_305 = L15_305.vlanId
      L16_306 = "='"
      L17_307 = L8_298
      L18_308 = "'"
      L15_305 = db
      L15_305 = L15_305.existsRowWhere
      L16_306 = MacVlanConfigTable
      L17_307 = L11_301
      L15_305 = L15_305(L16_306, L17_307)
      if L15_305 then
        L16_306 = _UPVALUE2_
        L16_306 = L16_306.COMP_VLAN_ADDRESSING_IN_USE_MAC_VLAN
        return L16_306
      end
      L16_306 = _UPVALUE1_
      L16_306 = L16_306.vlanId
      L17_307 = "='"
      L18_308 = L8_298
      L19_309 = "'"
      L16_306 = db
      L16_306 = L16_306.existsRowWhere
      L17_307 = ProtocolVlanConfigTable
      L18_308 = L11_301
      L16_306 = L16_306(L17_307, L18_308)
      if L16_306 then
        L17_307 = _UPVALUE2_
        L17_307 = L17_307.COMP_VLAN_ADDRESSING_IN_USE_PROTOCOL_VLAN
        return L17_307
      end
      L17_307 = _UPVALUE1_
      L17_307 = L17_307.vlanId
      L18_308 = "='"
      L19_309 = L8_298
      L20_310 = "'"
      L17_307 = db
      L17_307 = L17_307.existsRowWhere
      L18_308 = _UPVALUE4_
      L19_309 = L11_301
      L17_307 = L17_307(L18_308, L19_309)
      if L17_307 then
        L18_308 = _UPVALUE2_
        L18_308 = L18_308.COMP_VLAN_ADDRESSING_IN_USE_TRAFFIC_SHAPING
        return L18_308
      end
      L18_308 = _UPVALUE5_
      L19_309 = "='"
      L20_310 = L8_298
      L21_311 = "'"
      L18_308 = db
      L18_308 = L18_308.existsRowWhere
      L19_309 = _UPVALUE6_
      L20_310 = L11_301
      L18_308 = L18_308(L19_309, L20_310)
      if L18_308 then
        L19_309 = _UPVALUE2_
        L19_309 = L19_309.COMP_VLAN_ADDRESSING_IN_USE_ADVANCED_QOS
        return L19_309
      end
      L19_309 = _UPVALUE7_
      L19_309 = L19_309.attribute
      L19_309 = L19_309.LogicalIfName
      L20_310 = "='"
      L21_311 = _UPVALUE8_
      L22_312 = L8_298
      L23_313 = "' and "
      L24_314 = _UPVALUE7_
      L24_314 = L24_314.attribute
      L24_314 = L24_314.tcpdumpEnabled
      L25_315 = "='"
      L26_316 = ENABLE
      L27_317 = "'"
      L19_309 = db
      L19_309 = L19_309.existsRowWhere
      L20_310 = tcpdumpTable
      L21_311 = L11_301
      L19_309 = L19_309(L20_310, L21_311)
      if L19_309 then
        L20_310 = _UPVALUE2_
        L20_310 = L20_310.COMP_VLAN_ADDRESSING_CAPTURE_PACKET_IN_PROGRESS
        return L20_310
      end
      L20_310 = _UPVALUE9_
      L20_310 = L20_310.upnpConfigGet
      L25_315 = L20_310()
      L26_316 = BDG_NAME
      L27_317 = L8_298
      L26_316 = L26_316 .. L27_317
      if L23_313 == L26_316 then
        L26_316 = _UPVALUE2_
        L26_316 = L26_316.COMP_VLAN_ADDRESSING_IN_USE_UPNP
        return L26_316
      end
      L26_316 = db
      L26_316 = L26_316.existsRowWhere
      L27_317 = "fbwifivlan"
      L28_318 = "vlanId = "
      L29_319 = L8_298
      L28_318 = L28_318 .. L29_319 .. L30_320
      L26_316 = L26_316(L27_317, L28_318)
      if L26_316 then
        L27_317 = "VLAN_FBWIFI_ENABLED"
        return L27_317
      end
      L27_317 = {}
      L28_318 = nil
      L29_319 = staticRoutesGetAll
      L29_319 = L29_319()
      L27_317 = L30_320
      L28_318 = L29_319
      L29_319 = ""
      for L33_323, L34_324 in L30_320(L31_321) do
        L35_325 = _UPVALUE10_
        L36_326 = "."
        L35_325 = L35_325 .. L36_326 .. _UPVALUE1_.interface
        L29_319 = L34_324[L35_325]
        L35_325 = string
        L35_325 = L35_325.sub
        L36_326 = L29_319
        L35_325 = L35_325(L36_326, 1, 3)
        L36_326 = string
        L36_326 = L36_326.sub
        L36_326 = L36_326(L29_319, 4)
        if L35_325 == "LAN" and tonumber(L36_326) == tonumber(L8_298) then
          return _UPVALUE2_.COMP_VLAN_STATIC_ROUTING_IN_USE
        end
      end
      if L30_320 ~= "DSR-250" then
      elseif L30_320 == "DSR-150N" then
        L33_323 = " AND LogicalIfName ='LAN'"
        L33_323 = L30_320
        status8 = L31_321
        if L31_321 == L32_322 then
          return L31_321, L32_322
        end
      end
      L30_320(L31_321)
      L30_320(L31_321)
    end
  end
  L6_296 = "' and "
  L7_297 = _UPVALUE1_
  L7_297 = L7_297.vlanId
  L8_298 = " != '"
  L6_296 = L3_293
  if L4_294 == L5_295 then
    L6_296 = cookie
    return L5_295, L6_296
  end
  L6_296 = " != '"
  L7_297 = DEFAULT_VLANID
  L8_298 = "'"
  L6_296 = intervlanTable
  L7_297 = L3_293
  L6_296 = NIL
  if L5_295 == L6_296 then
    L6_296 = _UPVALUE0_
    L6_296 = L6_296.FAILURE
    L7_297 = cookie
    return L6_296, L7_297
  end
  L6_296 = db
  L6_296 = L6_296.deleteRowWhere
  L7_297 = "fbwifivlan"
  L8_298 = L3_293
  L6_296 = L6_296(L7_297, L8_298)
  L7_297 = NIL
  if L6_296 == L7_297 then
    L7_297 = _UPVALUE0_
    L7_297 = L7_297.FAILURE
    L8_298 = cookie
    return L7_297, L8_298
  end
  L7_297 = db
  L7_297 = L7_297.deleteRowWhere
  L8_298 = intervlanTbl
  L7_297 = L7_297(L8_298, L9_299)
  L6_296 = L7_297
  L7_297 = NIL
  if L6_296 == L7_297 then
    L7_297 = _UPVALUE0_
    L7_297 = L7_297.FAILURE
    L8_298 = cookie
    return L7_297, L8_298
  end
  L7_297 = _UPVALUE1_
  L7_297 = L7_297.interfaceName
  L8_298 = " != '"
  L12_302 = " != '"
  L13_303 = DMZ_NAME
  L14_304 = "' and "
  L15_305 = _UPVALUE1_
  L15_305 = L15_305.interfaceName
  L16_306 = " != '"
  L17_307 = WAN1_NAME
  L18_308 = "' and "
  L19_309 = _UPVALUE1_
  L19_309 = L19_309.interfaceName
  L20_310 = " != '"
  L21_311 = WAN2_NAME
  L22_312 = "'"
  L7_297 = db
  L7_297 = L7_297.deleteRowWhere
  L8_298 = subnetTable
  L7_297 = L7_297(L8_298, L9_299)
  L8_298 = NIL
  if L7_297 == L8_298 then
    L8_298 = _UPVALUE0_
    L8_298 = L8_298.FAILURE
    return L8_298, L9_299
  end
  L8_298 = db
  L8_298 = L8_298.deleteRowWhere
  L8_298 = L8_298(L9_299, L10_300)
  if L8_298 == L9_299 then
    return L9_299, L10_300
  end
  for L12_302, L13_303 in L9_299(L10_300) do
    L14_304 = _UPVALUE1_
    L14_304 = L14_304.vlanId
    L14_304 = L13_303[L14_304]
    L15_305 = DefaultVlan
    if L14_304 ~= L15_305 then
      L14_304 = db
      L14_304 = L14_304.deleteRow
      L15_305 = networkInterfaceTable
      L16_306 = _UPVALUE1_
      L16_306 = L16_306.networkInterfaceName
      L17_307 = BDG_NAME
      L18_308 = _UPVALUE1_
      L18_308 = L18_308.vlanId
      L18_308 = L13_303[L18_308]
      L17_307 = L17_307 .. L18_308
      L14_304 = L14_304(L15_305, L16_306, L17_307)
      L15_305 = NIL
      if L14_304 == L15_305 then
        L15_305 = _UPVALUE0_
        L15_305 = L15_305.FAILURE
        L16_306 = cookie
        return L15_305, L16_306
      end
      L15_305 = db
      L15_305 = L15_305.deleteRow
      L16_306 = ipAddressTable
      L17_307 = _UPVALUE1_
      L17_307 = L17_307.interfaceName
      L18_308 = LAN_NAME
      L19_309 = _UPVALUE1_
      L19_309 = L19_309.vlanId
      L19_309 = L13_303[L19_309]
      L18_308 = L18_308 .. L19_309
      L15_305 = L15_305(L16_306, L17_307, L18_308)
      L16_306 = NIL
      if L15_305 == L16_306 then
        L16_306 = _UPVALUE0_
        L16_306 = L16_306.FAILURE
        L17_307 = cookie
        return L16_306, L17_307
      end
      L16_306 = db
      L16_306 = L16_306.deleteRow
      L17_307 = ipv6InterfacesTable
      L18_308 = _UPVALUE1_
      L18_308 = L18_308.networkInterfaceName
      L19_309 = BDG_NAME
      L20_310 = _UPVALUE1_
      L20_310 = L20_310.vlanId
      L20_310 = L13_303[L20_310]
      L19_309 = L19_309 .. L20_310
      L16_306 = L16_306(L17_307, L18_308, L19_309)
      L15_305 = L16_306
      L16_306 = NIL
      if L15_305 == L16_306 then
        L16_306 = _UPVALUE0_
        L16_306 = L16_306.FAILURE
        L17_307 = cookie
        return L16_306, L17_307
      end
      L16_306 = db
      L16_306 = L16_306.deleteRow
      L17_307 = zonesTable
      L18_308 = _UPVALUE13_
      L18_308 = L18_308.attribute
      L18_308 = L18_308.zonelogicalIfname
      L19_309 = LAN_NAME
      L20_310 = _UPVALUE1_
      L20_310 = L20_310.vlanId
      L20_310 = L13_303[L20_310]
      L19_309 = L19_309 .. L20_310
      L16_306 = L16_306(L17_307, L18_308, L19_309)
      L17_307 = NIL
      if L16_306 == L17_307 then
        L17_307 = _UPVALUE0_
        L17_307 = L17_307.FAILURE
        L18_308 = cookie
        return L17_307, L18_308
      end
      L17_307 = db
      L17_307 = L17_307.deleteRow
      L18_308 = igmpPortMapTbl
      L19_309 = _UPVALUE1_
      L19_309 = L19_309.vlanId
      L20_310 = _UPVALUE1_
      L20_310 = L20_310.vlanId
      L20_310 = L13_303[L20_310]
      L17_307 = L17_307(L18_308, L19_309, L20_310)
      L18_308 = NIL
      if L17_307 == L18_308 then
        L18_308 = _UPVALUE0_
        L18_308 = L18_308.FAILURE
        L19_309 = cookie
        return L18_308, L19_309
      end
    end
  end
  L12_302 = "'"
  if L9_299 == L10_300 then
    return L10_300, L11_301
  end
  L12_302 = LAN_NAME
  L13_303 = "' and "
  L14_304 = _UPVALUE7_
  L14_304 = L14_304.attribute
  L14_304 = L14_304.LogicalIfName
  L15_305 = " != '"
  L16_306 = WAN1_NAME
  L17_307 = "' and "
  L18_308 = _UPVALUE7_
  L18_308 = L18_308.attribute
  L18_308 = L18_308.LogicalIfName
  L19_309 = " != '"
  L20_310 = WAN2_NAME
  L21_311 = "'"
  L12_302 = L3_293
  if L10_300 == L11_301 then
    L12_302 = cookie
    return L11_301, L12_302
  end
  L12_302 = webAccessTable
  L13_303 = L3_293
  L12_302 = NIL
  if L11_301 == L12_302 then
    L12_302 = _UPVALUE0_
    L12_302 = L12_302.FAILURE
    L13_303 = cookie
    return L12_302, L13_303
  end
  L12_302 = _UPVALUE0_
  L12_302 = L12_302.SUCCESS
  L13_303 = cookie
  return L12_302, L13_303
end
function vlanTypeGet(A0_327)
  local L1_328
  L1_328 = NIL
  if A0_327 == L1_328 then
    L1_328 = _UPVALUE0_
    L1_328 = L1_328.FAILURE
    return L1_328, A0_327
  end
  L1_328 = db
  L1_328 = L1_328.getAttribute
  L1_328 = L1_328(vlanTable, ROWID, A0_327, _UPVALUE1_.vlanId)
  return _UPVALUE0_.SUCESS, L1_328
end
function vlanIntervlanAccessTypeSet(A0_329, A1_330)
  local L2_331, L3_332
  L2_331 = NIL
  if A0_329 == L2_331 then
    L2_331 = _UPVALUE0_
    L2_331 = L2_331.FAILURE
    L3_332 = A0_329
    return L2_331, L3_332
  end
  L2_331 = db
  L2_331 = L2_331.getAttribute
  L3_332 = vlanTable
  L2_331 = L2_331(L3_332, ROWID, A0_329, _UPVALUE1_.vlanId)
  L3_332 = db
  L3_332 = L3_332.getAttribute
  L3_332 = L3_332(intervlanTable, _UPVALUE1_.vlanId, L2_331, ROWID)
  if db.setAttribute(intervlanTable, ROWID, L3_332, _UPVALUE1_.accessType, A1_330) == NIL then
    return _UPVALUE0_.ERROR
  end
  return _UPVALUE0_.SUCCESS
end
function staticRoutesGetAll()
  local L0_333, L1_334
  L0_333 = _UPVALUE0_
  L0_333 = L0_333.interface
  L1_334 = " !='WAN2PPPOE2' and "
  L0_333 = L0_333 .. L1_334 .. _UPVALUE0_.interface .. " !='WAN1PPPOE2'"
  L1_334 = db
  L1_334 = L1_334.getRowsWhere
  L1_334 = L1_334(_UPVALUE1_, L0_333)
  if L1_334 == NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L1_334
end
function portMappingSet(A0_335)
  local L1_336, L2_337, L3_338, L4_339, L5_340, L6_341, L7_342, L8_343, L9_344, L10_345, L11_346, L12_347, L13_348
  L1_336 = 2
  L2_337 = 5
  L3_338 = {}
  L4_339 = configPortTable
  L5_340 = "."
  L6_341 = _UPVALUE0_
  L6_341 = L6_341.interfaceName
  L4_339 = L4_339 .. L5_340 .. L6_341
  L3_338[L4_339] = A0_335
  L4_339 = LAN_NAME
  if A0_335 ~= L4_339 then
    L4_339 = db
    L4_339 = L4_339.existsRow
    L5_340 = vlanTable
    L6_341 = _UPVALUE0_
    L6_341 = L6_341.vlanId
    L7_342 = DMZ_LOCAL_ID
    L4_339 = L4_339(L5_340, L6_341, L7_342)
    if L4_339 then
      L5_340 = _UPVALUE1_
      L5_340 = L5_340.COMP_VLAN_DMZPORT_ALREADY_EXISTS
      return L5_340
    end
    L5_340 = db
    L5_340 = L5_340.getRowsWhere
    L6_341 = vlanPortMgmtTable
    L7_342 = "DefaultPVID = 4093 and PortName != 'OptionalPort'"
    L5_340 = L5_340(L6_341, L7_342)
    L6_341 = #L5_340
    if L6_341 ~= 0 then
      L6_341 = _UPVALUE1_
      L6_341 = L6_341.COMP_VLAN_DMZPVID_ALREADY_EXISTS
      return L6_341
    end
    L6_341 = db
    L6_341 = L6_341.existsRow
    L7_342 = "TrafficSelector"
    L6_341 = L6_341(L7_342, L8_343, L9_344)
    if L6_341 then
      L7_342 = _UPVALUE1_
      L7_342 = L7_342.COMP_VLAN_TRAFFICSELECTOR_ALREADY_EXISTS_ON_DMZPORT
      return L7_342
    end
  end
  L4_339 = DMZ_NAME
  if A0_335 == L4_339 then
    L1_336 = 4
  else
    L4_339 = LAN_NAME
    if A0_335 == L4_339 then
      L1_336 = 1
    else
      L4_339 = WAN2_NAME
      if A0_335 == L4_339 then
        L1_336 = 2
      end
    end
  end
  L4_339 = DMZ_LOCAL_ID
  L5_340 = 63
  L6_341 = 0
  L7_342 = ""
  for L11_346 = 0, L5_340 do
    L12_347 = "/pfrm2.0/bin/vlan_table_func read "
    L13_348 = L11_346
    L7_342 = L12_347 .. L13_348 .. "|/bin/grep valid|/bin/grep 0|/usr/bin/wc -l>/tmp/spe_vlan.op"
    L12_347 = os
    L12_347 = L12_347.execute
    L13_348 = L7_342
    L12_347(L13_348)
    L12_347 = io
    L12_347 = L12_347.open
    L13_348 = "/tmp/spe_vlan.op"
    L12_347 = L12_347(L13_348, "r")
    f = L12_347
    L12_347 = f
    if L12_347 ~= nil then
      L12_347 = f
      L13_348 = L12_347
      L12_347 = L12_347.read
      L12_347 = L12_347(L13_348, "*line")
      valid_val = L12_347
      L12_347 = f
      L13_348 = L12_347
      L12_347 = L12_347.close
      L12_347(L13_348)
    end
    L12_347 = valid_val
    if L12_347 == "1" then
      L6_341 = L11_346
      break
    end
  end
  if A0_335 ~= L8_343 then
  else
    if A0_335 == L8_343 then
      L11_346 = " = '"
      L12_347 = L4_339
      L13_348 = "'"
      if L9_344 == 0 and L5_340 > L6_341 then
        L11_346 = "."
        L12_347 = _UPVALUE0_
        L12_347 = L12_347.vlanId
        L9_344[L10_345] = L4_339
        L11_346 = "."
        L12_347 = _UPVALUE0_
        L12_347 = L12_347.vlanIndex
        L9_344[L10_345] = L6_341
        L11_346 = vlanPSEntryTable
        L12_347 = L9_344
        status = L10_345
        L11_346 = NIL
        if L10_345 == L11_346 then
          L11_346 = cookie
          return L10_345, L11_346
        end
      end
  end
  elseif A0_335 == L8_343 then
    L11_346 = " AND LogicalIfName ='LAN'"
    L11_346 = L8_343
    status = L9_344
    if L9_344 == L10_345 then
      return L9_344, L10_345
    end
  end
  L11_346 = "1"
  if L8_343 then
    L11_346 = "."
    L12_347 = _UPVALUE0_
    L12_347 = L12_347.interfaceName
    L9_344[L10_345] = A0_335
    L11_346 = "."
    L12_347 = _UPVALUE0_
    L12_347 = L12_347.ifgroupId
    L9_344[L10_345] = L1_336
    L11_346 = defaultGrpInfoTable
    L12_347 = L9_344
    L13_348 = L2_337
    status = L10_345
    L11_346 = NIL
    if L10_345 == L11_346 then
      return L10_345
    end
    L11_346 = configPortTable
    L12_347 = L3_338
    L13_348 = "1"
    status = L10_345
    L11_346 = NIL
    if L10_345 == L11_346 then
      return L10_345
    end
  else
    L11_346 = L3_338
    status = L9_344
    if L9_344 == L10_345 then
      return L9_344
    end
  end
  L11_346 = _UPVALUE0_
  L11_346 = L11_346.logicalIfName
  L12_347 = DMZ_NAME
  if L9_344 ~= L10_345 then
    if A0_335 ~= L10_345 then
      L11_346 = "."
      L12_347 = _UPVALUE0_
      L12_347 = L12_347.dhcpEnabled
      if L10_345 == "1" then
        L11_346 = "."
        L12_347 = _UPVALUE0_
        L12_347 = L12_347.oldState
        L9_344[L10_345] = "1"
        L11_346 = "."
        L12_347 = _UPVALUE0_
        L12_347 = L12_347.dhcpEnabled
        L9_344[L10_345] = "0"
      end
    elseif A0_335 == L10_345 then
      L11_346 = "."
      L12_347 = _UPVALUE0_
      L12_347 = L12_347.oldState
      if L10_345 == "1" then
        L11_346 = subnetTable
        L12_347 = "LogicalIfName = 'DMZ' and AddressFamily = 2"
        if L10_345 ~= nil then
          L11_346 = db
          L11_346 = L11_346.setAttribute
          L12_347 = subnetTable
          L13_348 = ROWID
          L11_346(L12_347, L13_348, L10_345["ifStatic._ROWID_"], _UPVALUE0_.interfaceName, L10_345["ifStatic.LogicalIfName"])
        end
        L11_346 = dhcpTable
        L12_347 = "."
        L13_348 = _UPVALUE0_
        L13_348 = L13_348.oldState
        L11_346 = L11_346 .. L12_347 .. L13_348
        L9_344[L11_346] = "0"
        L11_346 = dhcpTable
        L12_347 = "."
        L13_348 = _UPVALUE0_
        L13_348 = L13_348.dhcpEnabled
        L11_346 = L11_346 .. L12_347 .. L13_348
        L9_344[L11_346] = "1"
      end
    end
    L11_346 = dhcpTable
    L12_347 = L9_344
    L13_348 = dhcpTable
    L13_348 = L13_348 .. "." .. ROWID
    L13_348 = L9_344[L13_348]
    valid = L10_345
  end
  L11_346 = vlanPortMgmtTable
  L12_347 = "PortName = 'OptionalPort'"
  if L10_345 ~= nil then
    L11_346 = LAN_NAME
    if A0_335 == L11_346 then
      L11_346 = vlanPortMgmtTable
      L12_347 = "."
      L13_348 = _UPVALUE0_
      L13_348 = L13_348.portType
      L11_346 = L11_346 .. L12_347 .. L13_348
      L10_345[L11_346] = A0_335
      L11_346 = vlanPortMgmtTable
      L12_347 = "."
      L13_348 = _UPVALUE0_
      L13_348 = L13_348.defaultPVID
      L11_346 = L11_346 .. L12_347 .. L13_348
      L10_345[L11_346] = "1"
    else
      L11_346 = vlanPortMgmtTable
      L12_347 = "."
      L13_348 = _UPVALUE0_
      L13_348 = L13_348.portType
      L11_346 = L11_346 .. L12_347 .. L13_348
      L10_345[L11_346] = A0_335
      L11_346 = vlanPortMgmtTable
      L12_347 = "."
      L13_348 = _UPVALUE0_
      L13_348 = L13_348.defaultPVID
      L11_346 = L11_346 .. L12_347 .. L13_348
      L12_347 = DMZ_LOCAL_ID
      L10_345[L11_346] = L12_347
      L11_346 = vlanPortMgmtTable
      L12_347 = "."
      L13_348 = _UPVALUE0_
      L13_348 = L13_348.portVlanMode
      L11_346 = L11_346 .. L12_347 .. L13_348
      L10_345[L11_346] = "0"
      L11_346 = false
      L12_347 = "vlan."
      L13_348 = L10_345["VlanPortMgmt.PortLogicalName"]
      L12_347 = L12_347 .. L13_348
      L13_348 = db
      L13_348 = L13_348.getTable
      L13_348 = L13_348(vlanTable)
      for _FORV_18_, _FORV_19_ in pairs(L13_348) do
        if L13_348[0 + 1]["vlan.portName"] == L10_345["VlanPortMgmt.PortLogicalName"] then
          valid = db.delete(vlanTable, {
            L13_348[0 + 1]["vlan._ROWID_"]
          })
          if not valid then
            L11_346 = true
            break
          end
        end
      end
      if L11_346 then
        return _UPVALUE1_.COMP_VLAN_CONFIGURATION_FAILED
      end
    end
    L11_346 = db
    L11_346 = L11_346.update
    L12_347 = vlanPortMgmtTable
    L13_348 = L10_345
    L11_346 = L11_346(L12_347, L13_348, L10_345["VlanPortMgmt._ROWID_"])
    valid = L11_346
    L11_346 = valid
    if L11_346 then
      L11_346 = vlanPortMgmtTable
      L12_347 = "."
      L13_348 = _UPVALUE0_
      L13_348 = L13_348.portType
      L11_346 = L11_346 .. L12_347 .. L13_348
      L11_346 = L10_345[L11_346]
      L12_347 = LAN_NAME
      if L11_346 ~= L12_347 then
        L11_346 = vlanPortMgmtTable
        L12_347 = "."
        L13_348 = _UPVALUE0_
        L13_348 = L13_348.portType
        L11_346 = L11_346 .. L12_347 .. L13_348
        L11_346 = L10_345[L11_346]
      elseif L11_346 == "BRIDGE" then
        L11_346 = "vlan."
        L12_347 = L10_345["VlanPortMgmt.PortLogicalName"]
        L11_346 = L11_346 .. L12_347
        L12_347 = db
        L12_347 = L12_347.getRow
        L13_348 = vlanTable
        L12_347 = L12_347(L13_348, _UPVALUE0_.vlanId, "1")
        if L12_347 ~= nil then
          L13_348 = {}
          locTable = L13_348
          L13_348 = locTable
          L13_348["vlan.vlanId"] = 1
          L13_348 = locTable
          L13_348["vlan.vlanName"] = db.getAttribute(vlanTable, _UPVALUE0_.vlanId, "1", "vlanName")
          L13_348 = locTable
          L13_348["vlan.portName"] = L10_345["VlanPortMgmt.PortLogicalName"]
          L13_348 = db
          L13_348 = L13_348.insert
          L13_348(vlanTable, locTable)
        end
        L13_348 = valid
        if not L13_348 then
          L13_348 = _UPVALUE1_
          L13_348 = L13_348.COMP_VLAN_CONFIGURATION_FAILED
          return L13_348
        end
      end
    end
  end
  L11_346 = _UPVALUE2_
  L11_346 = L11_346.SUCCESS
  L12_347 = cookie
  return L11_346, L12_347
end
function vlanStateGet()
  local L0_349
  L0_349 = db
  L0_349 = L0_349.getAttribute
  L0_349 = L0_349(vlanStatusTable, ROWID, "1", _UPVALUE0_.vlanState)
  if L0_349 == NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_349
end
function vlanStateSet(A0_350, A1_351)
  if A1_351 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.isBoolean(A1_351)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(vlanStatusTable, ROWID, A0_350, _UPVALUE2_.vlanState, A1_351) == NIL then
    return _UPVALUE0_.FAILURE, A0_350
  end
  return _UPVALUE0_.SUCCESS, A0_350
end
function vlanTbleGet()
  local L0_352, L1_353, L2_354, L3_355, L4_356, L5_357, L6_358, L7_359, L8_360, L9_361, L10_362, L11_363, L12_364, L13_365, L14_366, L15_367, L16_368, L17_369
  L0_352 = {}
  L1_353 = 0
  L2_354 = ""
  L3_355 = nil
  L4_356 = "select *, _ROWID_ from vlan where portName = 'dummy'"
  L8_360 = L4_356
  L3_355 = L5_357
  if L3_355 == nil then
    return L5_357, L6_358
  end
  for L8_360, L9_361 in L5_357(L6_358) do
    L10_362 = L9_361["vlan.vlanId"]
    if L10_362 == "1" then
      L2_354 = "LAN"
    else
      L10_362 = "LAN"
      L11_363 = L9_361["vlan.vlanId"]
      L2_354 = L10_362 .. L11_363
    end
    L10_362 = "LogicalIfName='"
    L11_363 = L2_354
    L12_364 = "' and AddressFamily=2"
    L10_362 = L10_362 .. L11_363 .. L12_364
    L11_363 = db
    L11_363 = L11_363.getRowWhere
    L12_364 = "ifStatic"
    L13_365 = L10_362
    L11_363 = L11_363(L12_364, L13_365)
    if L11_363 == nil then
      L12_364 = _UPVALUE0_
      L12_364 = L12_364.FAILURE
      L13_365 = cookie
      return L12_364, L13_365
    end
    L12_364 = "vlanId ="
    L13_365 = L9_361["vlan.vlanId"]
    L12_364 = L12_364 .. L13_365
    L13_365 = db
    L13_365 = L13_365.getRowWhere
    L14_366 = "CaptivePortalVlan"
    L15_367 = L12_364
    L13_365 = L13_365(L14_366, L15_367)
    if L13_365 == nil then
      L14_366 = {}
      L13_365 = L14_366
      L13_365["CaptivePortalVlan.accessType"] = "1"
    end
    L14_366 = _UPVALUE1_
    L14_366 = L14_366.authenticationTypeGetCurrent
    L15_367 = L9_361["vlan.vlanId"]
    L16_368 = L14_366(L15_367)
    if L16_368 == nil then
      L16_368 = "none"
    end
    L17_369 = "LogicalIfName='"
    L17_369 = L17_369 .. L2_354 .. "' and AddressFamily=10"
    if db.getRowWhere("ifStatic", L17_369) == nil then
      return _UPVALUE0_.FAILURE, L15_367
    end
    L1_353 = L1_353 + 1
    L0_352[L1_353] = {}
    L0_352[L1_353]["vlanSettings.rowId"] = L9_361["vlan.rowid"]
    L0_352[L1_353]["vlanSettings.vlanId"] = L9_361["vlan.vlanId"]
    L0_352[L1_353]["vlanSettings.vlanName"] = L9_361["vlan.vlanName"]
    L0_352[L1_353]["vlanSettings.vlanIPv6"] = L9_361["vlan.vlanIPv6"]
    L0_352[L1_353]["vlanSettings.StaticIp"] = L11_363["ifStatic.StaticIp"]
    L0_352[L1_353]["vlanSettings.NetMask"] = L11_363["ifStatic.NetMask"]
    L0_352[L1_353]["vlanSettings.accessType"] = L13_365["CaptivePortalVlan.accessType"]
    L0_352[L1_353]["vlanSettings.authenticationTypeName"] = L16_368
    L0_352[L1_353]["vlanSettings.prefix"] = db.getRowWhere("ifStatic", L17_369)["ifStatic.StaticIp"]
    L0_352[L1_353]["vlanSettings.prefixLength"] = db.getRowWhere("ifStatic", L17_369)["ifStatic.PrefixLength"]
    if L0_352[L1_353]["vlanSettings.prefix"] == _UPVALUE0_.NIL or L0_352[L1_353]["vlanSettings.prefix"] == "" or L0_352[L1_353]["vlanSettings.vlanIPv6"] == "0" then
      L0_352[L1_353]["vlanSettings.prefix"] = "N/A"
      L0_352[L1_353]["vlanSettings.prefixLength"] = "N/A"
    end
  end
  return L5_357, L6_358
end
function ipv6VlanIdGetAll()
  local L0_370, L1_371
  L0_370 = "SELECT * from "
  L1_371 = vlanTable
  L0_370 = L0_370 .. L1_371 .. " where portName ='" .. DUMMY_PORT .. "' and vlanIPv6 = '" .. IPV6_ENABLE .. "'"
  L1_371 = db
  L1_371 = L1_371.getTable
  L1_371 = L1_371(vlanTable, false, L0_370)
  if L1_371 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_371
end
function firewallRulesUpdate(A0_372, A1_373, A2_374)
  local L3_375, L4_376, L5_377, L6_378, L7_379, L8_380, L9_381, L10_382, L11_383, L12_384
  L6_378 = validationsLuaLib
  L6_378 = L6_378.ipAddressRangeGet
  L7_379 = A1_373
  L7_379 = L6_378(L7_379, L8_380)
  L4_376 = L8_380
  L3_375 = L7_379
  L5_377 = L6_378
  L6_378 = _UPVALUE0_
  L6_378 = L6_378.SUCCESS
  if L5_377 == L6_378 then
    L6_378 = util
    L6_378 = L6_378.appendDebugOut
    L7_379 = "Failed to get ipAddressRange"
    L7_379 = L7_379 .. L8_380
    L6_378(L7_379)
    L6_378 = _UPVALUE0_
    L6_378 = L6_378.BAD_PARAMETER
    return L6_378
  end
  L6_378 = "(FromZoneVlanId="
  L7_379 = A0_372
  L6_378 = L6_378 .. L7_379 .. L8_380 .. L9_381 .. L10_382
  L7_379 = db
  L7_379 = L7_379.getRowsWhere
  L7_379 = L7_379(L8_380, L9_381)
  if L7_379 ~= nil then
    for L11_383, L12_384 in L8_380(L9_381) do
      if L12_384["firewallRules.FromZoneVlanId"] == A0_372 then
        if L12_384["firewallRules.SourceAddressStart"] == L3_375 and L12_384["firewallRules.SourceAddressEnd"] == L4_376 then
          break
        end
        L12_384["firewallRules.SourceAddressStart"] = L3_375
        L12_384["firewallRules.SourceAddressEnd"] = L4_376
        if db.update("firewallRules", L12_384, L12_384["firewallRules._ROWID_"]) == NIL then
          return _UPVALUE0_.FAILURE
        end
      elseif L12_384["firewallRules.ToZoneVlanId"] == A0_372 then
        if L12_384["firewallRules.DestinationAddressStart"] == L3_375 and L12_384["firewallRules.DestinationAddressEnd"] == L4_376 then
          break
        end
        L12_384["firewallRules.DestinationAddressStart"] = L3_375
        L12_384["firewallRules.DestinationAddressEnd"] = L4_376
        if db.update("firewallRules", L12_384, L12_384["firewallRules._ROWID_"]) == NIL then
          return _UPVALUE0_.FAILURE
        end
      end
    end
  end
  return L8_380
end
