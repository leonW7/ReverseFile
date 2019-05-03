local L0_0
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/accounting_core")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
modeTable = "networkInfo"
vlanConfig = {}
;({}).ipv6Mode = "netWorkMode"
function vlanConfig.config(A0_1, A1_2, A2_3)
  if db.typeAndRangeValidate(A0_1) then
    if A2_3 == "add" then
      return db.insert(DBTable, A0_1)
    elseif A2_3 == "edit" then
      return db.update(DBTable, A0_1, A1_2)
    elseif A2_3 == "delete" then
      return db.delete(DBTable, A0_1)
    end
  end
  return false
end
function vlanConfig.disableAllow(A0_4, A1_5, A2_6)
  local L3_7, L4_8, L5_9, L6_10
  L3_7 = "LAN"
  L4_8 = "WAN1"
  L5_9 = "WAN2"
  L6_10 = ""
  if db.getRow("tcpdump", "tcpdumpEnabled", "1") ~= nil and (db.getRow("tcpdump", "tcpdumpEnabled", "1")["tcpdump.LogicalIfName"] ~= L3_7 or db.getRow("tcpdump", "tcpdumpEnabled", "1")["tcpdump.LogicalIfName"] ~= L4_8 or db.getRow("tcpdump", "tcpdumpEnabled", "1")["tcpdump.LogicalIfName"] ~= L5_9) then
    L6_10 = L6_10 .. "Packet Capture, "
  end
  if db.getRow("igmp", "IgmpEnable", "1") ~= nil and db.getRow("igmp", "IgmpEnable", "1")["igmp.igmpLogicalIfName"] ~= "LAN" then
    L6_10 = L6_10 .. "IGMP Proxy, "
  end
  if db.getRow("upnp", "upnpEnable", "1") ~= nil and db.getRow("upnp", "upnpEnable", "1")["upnp.interfaceName"] ~= "bdg1" then
    L6_10 = L6_10 .. "UPnP, "
  end
  if 0 == 0 then
    return "ERROR", L6_10
  else
    return "OK", L6_10
  end
end
function vlanConfig.vlanStatusConfig(A0_11, A1_12, A2_13)
  local L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20, L10_21
  L3_14 = ACCESS_LEVEL
  if L3_14 ~= 0 then
    L3_14 = "ACCESS_DENIED"
    L4_15 = "10187"
    return L3_14, L4_15
  end
  L3_14 = {}
  L4_15 = A0_11["VlanStatus.VlanState"]
  L3_14["VlanStatus.VlanState"] = L4_15
  L4_15 = "OK"
  L5_16 = vlanConfig
  L5_16 = L5_16.disableAllow
  L6_17 = A0_11
  L6_17 = L5_16(L6_17, L7_18, L8_19)
  message = L6_17
  L4_15 = L5_16
  if L4_15 == "ERROR" then
    L5_16 = "Please disable "
    L6_17 = message
    L5_16 = L5_16 .. L6_17 .. L7_18
    message = L5_16
    L5_16 = "ERROR"
    L6_17 = message
    return L5_16, L6_17
  end
  L5_16 = db
  L5_16 = L5_16.beginTransaction
  L5_16()
  L5_16 = false
  L6_17 = vlanConfig
  L6_17 = L6_17.config
  L6_17 = L6_17(L7_18, L8_19, L9_20)
  L5_16 = L6_17
  L6_17 = A0_11["VlanStatus.VlanState"]
  if L6_17 == "1" then
    L6_17 = db
    L6_17 = L6_17.getTable
    L6_17 = L6_17(L7_18)
    for L10_21 = 2, #L6_17 do
      row = L6_17[L10_21]
      row["dhcp.dhcpEnabled"] = row["dhcp.oldState"]
      DBTable = "dhcp"
      L5_16 = vlanConfig.config(row, L10_21, "edit")
    end
  else
    L6_17 = db
    L6_17 = L6_17.getTable
    L6_17 = L6_17(L7_18)
    for L10_21 = 2, #L6_17 do
      row = L6_17[L10_21]
      row["dhcp.oldState"] = row["dhcp.dhcpEnabled"]
      row["dhcp.dhcpEnabled"] = "0"
      DBTable = "dhcp"
      L5_16 = vlanConfig.config(row, L10_21, "edit")
    end
  end
  if L5_16 then
    L6_17 = db
    L6_17 = L6_17.commitTransaction
    L6_17(L7_18)
    L6_17 = "OK"
    return L6_17, L7_18
  else
    L6_17 = db
    L6_17 = L6_17.rollback
    L6_17()
    L6_17 = "ERROR"
    return L6_17, L7_18
  end
end
function vlanConfig.vlanSubnettingConfig(A0_22, A1_23, A2_24)
  local L3_25
  L3_25 = ACCESS_LEVEL
  if L3_25 ~= 0 then
    L3_25 = "ACCESS_DENIED"
    return L3_25, "10187"
  end
  L3_25 = db
  L3_25 = L3_25.beginTransaction
  L3_25()
  L3_25 = false
  L3_25 = vlanConfig.config(A0_22, A1_23, A2_24)
  if L3_25 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12800"
  end
end
function vlanConfig.configDep(A0_26, A1_27, A2_28)
  local L3_29, L4_30, L5_31, L6_32, L7_33, L8_34, L9_35, L10_36, L11_37, L12_38, L13_39, L14_40, L15_41, L16_42, L17_43, L18_44
  L3_29 = false
  if A2_28 == "delete" then
    for L7_33, L8_34 in L4_30(L5_31) do
      L9_35 = L8_34
      L10_36 = db
      L10_36 = L10_36.deleteRow
      L11_37 = "ifStatic"
      L12_38 = "LogicalIfName"
      L13_39 = "LAN"
      L14_40 = L9_35
      L13_39 = L13_39 .. L14_40
      L10_36 = L10_36(L11_37, L12_38, L13_39)
      L3_29 = L10_36
      if L3_29 then
        L10_36 = db
        L10_36 = L10_36.deleteRow
        L11_37 = "dhcp"
        L12_38 = "logicalIfName"
        L13_39 = "LAN"
        L14_40 = L9_35
        L13_39 = L13_39 .. L14_40
        L10_36 = L10_36(L11_37, L12_38, L13_39)
        L3_29 = L10_36
      end
      if L3_29 then
        L10_36 = db
        L10_36 = L10_36.deleteRow
        L11_37 = "DhcpRelay"
        L12_38 = "logicalIfName"
        L13_39 = "LAN"
        L14_40 = L9_35
        L13_39 = L13_39 .. L14_40
        L10_36 = L10_36(L11_37, L12_38, L13_39)
        L3_29 = L10_36
      end
      if L3_29 then
        L10_36 = db
        L10_36 = L10_36.deleteRow
        L11_37 = "interVLANRouting"
        L12_38 = "vlanId"
        L13_39 = L9_35
        L10_36 = L10_36(L11_37, L12_38, L13_39)
        L3_29 = L10_36
      end
      if L3_29 then
        L10_36 = db
        L10_36 = L10_36.deleteRow
        L11_37 = "interVLAN"
        L12_38 = "vlanId"
        L13_39 = L9_35
        L10_36 = L10_36(L11_37, L12_38, L13_39)
        L3_29 = L10_36
      end
      if L3_29 then
        L10_36 = db
        L10_36 = L10_36.deleteRow
        L11_37 = "bridgeTable"
        L12_38 = "bridgeIndex"
        L13_39 = L9_35
        L10_36 = L10_36(L11_37, L12_38, L13_39)
        L3_29 = L10_36
      end
      if L3_29 then
        L10_36 = db
        L10_36 = L10_36.deleteRow
        L11_37 = "tcpdump"
        L12_38 = "LogicalIfName"
        L13_39 = "LAN"
        L14_40 = L9_35
        L13_39 = L13_39 .. L14_40
        L10_36 = L10_36(L11_37, L12_38, L13_39)
        L3_29 = L10_36
      end
      if L3_29 then
        L10_36 = db
        L10_36 = L10_36.deleteRow
        L11_37 = "zones"
        L12_38 = "ZoneLogicalIfName"
        L13_39 = "LAN"
        L14_40 = L9_35
        L13_39 = L13_39 .. L14_40
        L10_36 = L10_36(L11_37, L12_38, L13_39)
        L3_29 = L10_36
      end
      L10_36 = "LAN"
      L11_37 = L9_35
      L10_36 = L10_36 .. L11_37
      L11_37 = "vlanName = '"
      L12_38 = L10_36
      L13_39 = "'"
      L11_37 = L11_37 .. L12_38 .. L13_39
      L12_38 = db
      L12_38 = L12_38.existsRowWhere
      L13_39 = "webAccessInfo"
      L14_40 = L11_37
      L12_38 = L12_38(L13_39, L14_40)
      if L12_38 and L3_29 then
        L13_39 = db
        L13_39 = L13_39.deleteRow
        L14_40 = "webAccessInfo"
        L13_39 = L13_39(L14_40, L15_41, L16_42)
        L3_29 = L13_39
      end
      L13_39 = UNIT_NAME
      if L13_39 ~= "DSR-250" then
        L13_39 = UNIT_NAME
        if L13_39 ~= "DSR-250N" then
          L13_39 = UNIT_NAME
          if L13_39 ~= "DSR-150" then
            L13_39 = UNIT_NAME
          end
        end
      elseif L13_39 == "DSR-150N" then
        L13_39 = "vlanId="
        L14_40 = L9_35
        L13_39 = L13_39 .. L14_40 .. L15_41
        if L3_29 then
          L14_40 = db
          L14_40 = L14_40.deleteRowWhere
          L14_40 = L14_40(L15_41, L16_42)
          L3_29 = L14_40
        end
      end
    end
  elseif A2_28 == "add" then
    L7_33 = 2
    L8_34 = 2
    L9_35 = "192.168.2.%"
    while true do
      L10_36 = db
      L10_36 = L10_36.existsRowLike
      L11_37 = "ifStatic"
      L12_38 = "StaticIp"
      L13_39 = L9_35
      L10_36 = L10_36(L11_37, L12_38, L13_39)
      if not L10_36 then
        L10_36 = db
        L10_36 = L10_36.existsRowLike
        L11_37 = "pptpServerIPRange"
        L12_38 = "startIPAddress"
        L13_39 = L9_35
        L10_36 = L10_36(L11_37, L12_38, L13_39)
      end
      if L10_36 and L7_33 <= 16 then
        L7_33 = L7_33 + 1
        L8_34 = L8_34 + 1
        L10_36 = "192.168."
        L11_37 = L8_34
        L12_38 = ".1"
        L10_36 = "192.168."
        L11_37 = L8_34
        L12_38 = ".%"
        L9_35 = L10_36 .. L11_37 .. L12_38
      end
    end
    L10_36 = "192.168."
    L11_37 = L8_34
    L12_38 = ".100"
    L10_36 = "192.168."
    L11_37 = L8_34
    L12_38 = ".254"
    L10_36 = db
    L10_36 = L10_36.getRow
    L11_37 = "networkInterface"
    L12_38 = "LogicalIfName"
    L13_39 = "LAN"
    L14_40 = A0_26["vlan.vlanId"]
    L13_39 = L13_39 .. L14_40
    L10_36 = L10_36(L11_37, L12_38, L13_39)
    if L10_36 ~= nil then
      L10_36["networkInterface.ipaddr"] = L4_30
      L10_36["networkInterface.subnetmask"] = "255.255.255.0"
      L11_37 = db
      L11_37 = L11_37.update
      L12_38 = "networkInterface"
      L13_39 = L10_36
      L14_40 = L10_36["networkInterface._ROWID_"]
      L11_37(L12_38, L13_39, L14_40)
    end
    L11_37 = {}
    L12_38 = "LAN"
    L13_39 = A0_26["vlan.vlanId"]
    L12_38 = L12_38 .. L13_39
    L11_37["ifStatic.LogicalIfName"] = L12_38
    L11_37["ifStatic.AddressFamily"] = "2"
    L11_37["ifStatic.StaticIp"] = L4_30
    L11_37["ifStatic.NetMask"] = "255.255.255.0"
    L11_37["ifStatic.Gateway"] = "0.0.0.0"
    L12_38 = "ifStatic"
    DBTable = L12_38
    L12_38 = vlanConfig
    L12_38 = L12_38.config
    L13_39 = L11_37
    L14_40 = "-1"
    L12_38 = L12_38(L13_39, L14_40, L15_41)
    L3_29 = L12_38
    if L3_29 then
      L12_38 = {}
      L13_39 = "LAN"
      L14_40 = A0_26["vlan.vlanId"]
      L13_39 = L13_39 .. L14_40
      L12_38["ifStatic.LogicalIfName"] = L13_39
      L12_38["ifStatic.AddressFamily"] = "10"
      L12_38["ifStatic.StaticIp"] = ""
      L12_38["ifStatic.NetMask"] = ""
      L12_38["ifStatic.Gateway"] = ""
      L12_38["ifStatic.PrefixLength"] = "64"
      L12_38["ifStatic.IspName"] = "0"
      L13_39 = "ifStatic"
      DBTable = L13_39
      L13_39 = vlanConfig
      L13_39 = L13_39.config
      L14_40 = L12_38
      L13_39 = L13_39(L14_40, L15_41, L16_42)
      L3_29 = L13_39
    end
    if L3_29 then
      L12_38 = _UPVALUE0_
      L12_38 = L12_38.accountingRouteTblUpdate
      L13_39 = L11_37["ifStatic.StaticIp"]
      L14_40 = L11_37["ifStatic.NetMask"]
      L12_38 = L12_38(L13_39, L14_40, L15_41)
      L13_39 = {}
      if A2_28 == "add" then
        L14_40 = db
        L14_40 = L14_40.getRow
        L18_44 = A0_26["vlan.vlanId"]
        L14_40 = L14_40(L15_41, L16_42, L17_43)
        if L14_40 == nil then
          L13_39["dhcp.logicalIfName"] = L15_41
          L13_39["dhcp.startAddress"] = L5_31
          L13_39["dhcp.endAddress"] = L6_32
          L13_39["dhcp.dhcpEnabled"] = "1"
          L13_39["dhcp.defaultGw"] = L4_30
          L13_39["dhcp.leaseTime"] = "24"
          L13_39["dhcp.enableDnsProxy"] = "1"
          DBTable = L15_41
          L18_44 = "add"
          L3_29 = L15_41
        else
          L14_40["dhcp.dhcpEnabled"] = "1"
          L14_40["dhcp.enableDnsProxy"] = "1"
          L14_40["dhcp.defaultGw"] = L4_30
          L14_40["dhcp.primaryDnsServer"] = ""
          L14_40["dhcp.secondaryDnsServer"] = ""
          L14_40["dhcp.winsServer"] = ""
          L14_40["dhcp.leaseTime"] = "24"
          L14_40["dhcp.startAddress"] = L5_31
          L14_40["dhcp.endAddress"] = L6_32
          L18_44 = L14_40["dhcp._ROWID_"]
          L3_29 = L15_41
        end
      end
    end
    if L3_29 then
      L12_38 = {}
      L13_39 = "LAN"
      L14_40 = A0_26["vlan.vlanId"]
      L13_39 = L13_39 .. L14_40
      L12_38["DhcpRelay.LogicalIfName"] = L13_39
      L13_39 = "bdg"
      L14_40 = A0_26["vlan.vlanId"]
      L13_39 = L13_39 .. L14_40
      L12_38["DhcpRelay.virtualIfName"] = L13_39
      L12_38["DhcpRelay.DhcpRelayStatus"] = "0"
      L12_38["DhcpRelay.RelayGateway"] = "0.0.0.0"
      L13_39 = "DhcpRelay"
      DBTable = L13_39
      L13_39 = vlanConfig
      L13_39 = L13_39.config
      L14_40 = L12_38
      L13_39 = L13_39(L14_40, L15_41, L16_42)
      L3_29 = L13_39
    end
    L12_38 = UNIT_NAME
    if L12_38 ~= "DSR-250" then
      L12_38 = UNIT_NAME
      if L12_38 ~= "DSR-250N" then
        L12_38 = UNIT_NAME
        if L12_38 ~= "DSR-150" then
          L12_38 = UNIT_NAME
        end
      end
    elseif L12_38 == "DSR-150N" and L3_29 then
      L12_38 = 63
      L13_39 = 0
      L14_40 = ""
      for L18_44 = 0, L12_38 do
        L14_40 = "/pfrm2.0/bin/vlan_table_func read " .. L18_44 .. "|/bin/grep valid|/bin/grep 0|/usr/bin/wc -l>/tmp/spe_vlan.op"
        os.execute(L14_40)
        f = io.open("/tmp/spe_vlan.op", "r")
        if f ~= nil then
          valid_val = f:read("*line")
          f:close()
        end
        if valid_val == "1" then
          L13_39 = L18_44
          break
        end
      end
      if A2_28 == "add" and L12_38 > L13_39 then
        L15_41["vlanPSEEntry.vlanId"] = L16_42
        L15_41["vlanPSEEntry.vlanIndex"] = L13_39
        DBTable = L16_42
        L18_44 = "-1"
        L3_29 = L16_42
      end
    end
    if L3_29 then
      L12_38 = {}
      L13_39 = "LAN"
      L14_40 = A0_26["vlan.vlanId"]
      L13_39 = L13_39 .. L14_40
      L12_38["zones.ZoneLogicalIfName"] = L13_39
      L12_38["zones.ZoneType"] = "SECURE"
      L13_39 = "zones"
      DBTable = L13_39
      L13_39 = vlanConfig
      L13_39 = L13_39.config
      L14_40 = L12_38
      L13_39 = L13_39(L14_40, L15_41, L16_42)
      L3_29 = L13_39
    end
    if L3_29 then
      L12_38 = {}
      L13_39 = "LAN"
      L14_40 = A0_26["vlan.vlanId"]
      L13_39 = L13_39 .. L14_40
      L12_38["tcpdump.LogicalIfName"] = L13_39
      L12_38["tcpdump.tcpdumpEnabled"] = "0"
      L13_39 = "tcpdump"
      DBTable = L13_39
      L13_39 = vlanConfig
      L13_39 = L13_39.config
      L14_40 = L12_38
      L13_39 = L13_39(L14_40, L15_41, L16_42)
      L3_29 = L13_39
    end
    if L3_29 then
      L12_38 = {}
      L13_39 = A0_26["vlan.vlanId"]
      L12_38["interVLANRouting.vlanId"] = L13_39
      L13_39 = A0_26["interVLANRouting.status"]
      L12_38["interVLANRouting.status"] = L13_39
      L13_39 = "bdg"
      L14_40 = A0_26["vlan.vlanId"]
      L13_39 = L13_39 .. L14_40
      L12_38["interVLANRouting.ifName"] = L13_39
      L13_39 = A0_26["interVLANRouting.accessType"]
      L12_38["interVLANRouting.accessType"] = L13_39
      L13_39 = "interVLANRouting"
      DBTable = L13_39
      L13_39 = vlanConfig
      L13_39 = L13_39.config
      L14_40 = L12_38
      L13_39 = L13_39(L14_40, L15_41, L16_42)
      L3_29 = L13_39
    end
    if L3_29 then
      L12_38 = {}
      L12_38["interVLAN.StaticIp"] = L4_30
      L13_39 = A0_26["vlan.vlanId"]
      L12_38["interVLAN.vlanId"] = L13_39
      L13_39 = A0_26["interVLANRouting.status"]
      L12_38["interVLAN.status"] = L13_39
      L13_39 = "bdg"
      L14_40 = A0_26["vlan.vlanId"]
      L13_39 = L13_39 .. L14_40
      L12_38["interVLAN.ifName"] = L13_39
      L13_39 = "interVLAN"
      DBTable = L13_39
      L13_39 = vlanConfig
      L13_39 = L13_39.config
      L14_40 = L12_38
      L13_39 = L13_39(L14_40, L15_41, L16_42)
      L3_29 = L13_39
    end
    if L3_29 then
      L12_38 = {}
      L13_39 = A0_26["interVLANRouting.accessType"]
      if L13_39 ~= "1" then
        L13_39 = A0_26["interVLANRouting.accessType"]
        if L13_39 ~= "2" then
          L13_39 = A0_26["interVLANRouting.accessType"]
        end
      elseif L13_39 == "3" then
        L13_39 = A0_26["vlan.vlanId"]
        L12_38["CaptivePortalVlan.vlanId"] = L13_39
        L13_39 = "bdg"
        L14_40 = A0_26["vlan.vlanId"]
        L13_39 = L13_39 .. L14_40
        L12_38["CaptivePortalVlan.ifName"] = L13_39
        L13_39 = A0_26["interVLANRouting.accessType"]
        L12_38["CaptivePortalVlan.accessType"] = L13_39
        L13_39 = A0_26["CaptivePortalVLAN.authServerId"]
        L12_38["CaptivePortalVlan.authServerId"] = L13_39
        L13_39 = A0_26["CaptivePortalVLAN.profileId"]
        L12_38["CaptivePortalVlan.profileId"] = L13_39
        L13_39 = A0_26["CaptivePortalVLAN.redirectType"]
        L12_38["CaptivePortalVlan.redirectType"] = L13_39
        L13_39 = A0_26["vlan.vlanId"]
        if L13_39 ~= nil then
          L13_39 = A0_26["vlan.vlanId"]
          if L13_39 == "1" then
            L13_39 = "LAN"
            typeName = L13_39
          end
        else
          L13_39 = A0_26["vlan.vlanId"]
          if L13_39 ~= nil then
            L13_39 = "LAN"
            L14_40 = A0_26["vlan.vlanId"]
            L13_39 = L13_39 .. L14_40
            typeName = L13_39
          end
        end
        L13_39 = "LogicalIfName = '"
        L14_40 = typeName
        L13_39 = L13_39 .. L14_40 .. L15_41
        L14_40 = db
        L14_40 = L14_40.getAttributeWhere
        L14_40 = L14_40(L15_41, L16_42, L17_43)
        if L14_40 ~= nil then
          L12_38["CaptivePortalVlan.ipAddress"] = L14_40
        end
        DBTable = L15_41
        L18_44 = "add"
        valid = L15_41
      end
    end
  end
  L4_30 = L3_29 or true
  return L4_30
end
function vlanConfig.vlanConfig(A0_45, A1_46, A2_47)
  local L3_48, L4_49, L5_50, L6_51, L7_52, L8_53, L9_54, L10_55, L11_56, L12_57, L13_58, L14_59, L15_60, L16_61, L17_62
  L3_48 = ACCESS_LEVEL
  if L3_48 ~= 0 then
    L3_48 = "ACCESS_DENIED"
    L4_49 = "10187"
    return L3_48, L4_49
  end
  L3_48 = A0_45.vlanInternal
  if L3_48 == "1" then
    L3_48 = "VlanPortMgmt"
    DBTable = L3_48
  end
  L3_48 = false
  if A2_47 == "add" then
    L4_49 = A0_45["interVLANRouting.status"]
    if L4_49 ~= nil then
      L4_49 = A0_45["interVLANRouting.accessType"]
      if L4_49 ~= nil then
        L4_49 = A0_45.insertRpt
        if L4_49 ~= "1" then
          L4_49 = {}
          L5_50 = db
          L5_50 = L5_50.getDefaults
          L6_51 = "bridgeTable"
          L5_50 = L5_50(L6_51)
          L4_49 = L5_50
          L5_50 = tonumber
          L6_51 = A0_45["vlan.vlanId"]
          L5_50 = L5_50(L6_51)
          L4_49["bridgeTable.bridgeIndex"] = L5_50
          L5_50 = "bdg"
          L6_51 = A0_45["vlan.vlanId"]
          L5_50 = L5_50 .. L6_51
          L4_49["bridgeTable.interfaceName"] = L5_50
          L5_50 = "bridgeTable"
          DBTable = L5_50
          L5_50 = vlanConfig
          L5_50 = L5_50.config
          L6_51 = L4_49
          L7_52 = "-1"
          L5_50 = L5_50(L6_51, L7_52, L8_53)
          L3_48 = L5_50
        end
      end
    end
  end
  L4_49 = db
  L4_49 = L4_49.getAttribute
  L5_50 = modeTable
  L6_51 = "_ROWID_"
  L7_52 = 1
  L4_49 = L4_49(L5_50, L6_51, L7_52, L8_53)
  L5_50 = "1"
  L6_51 = tonumber
  L7_52 = L4_49
  L6_51 = L6_51(L7_52)
  if L6_51 == 3 then
    L5_50 = "3"
  end
  if A2_47 == "add" then
    L6_51 = {}
    L7_52 = "bdg"
    L7_52 = L7_52 .. L8_53
    L6_51["networkInterface.interfaceName"] = L7_52
    L7_52 = "LAN"
    L7_52 = L7_52 .. L8_53
    L6_51["networkInterface.LogicalIfName"] = L7_52
    L7_52 = "bdg"
    L7_52 = L7_52 .. L8_53
    L6_51["networkInterface.VirtualIfName"] = L7_52
    L6_51["networkInterface.ConnectionType"] = "ifStatic"
    L6_51["networkInterface.ConnectionType6"] = ""
    L6_51["networkInterface.ifType"] = "bridge"
    L6_51["networkInterface.MTU"] = "1500"
    L6_51["networkInterface.ipaddr"] = "0.0.0.0"
    L6_51["networkInterface.subnetmask"] = "0.0.0.0"
    L6_51["networkInterface.gateway"] = "0.0.0.0"
    L6_51["networkInterface.dns1"] = "0.0.0.0"
    L6_51["networkInterface.dns2"] = "0.0.0.0"
    L6_51["networkInterface.DHCP"] = "0"
    L6_51["networkInterface.IfStatus"] = "1"
    L6_51["networkInterface.refreshInterval"] = "5"
    L6_51["networkInterface.autoRefreshFlag"] = "0"
    L6_51["networkInterface.capabilities"] = L5_50
    L6_51["networkInterface.restartFwForMe"] = "1"
    L6_51["networkInterface.ifGroupId"] = "1"
    L7_52 = "networkInterface"
    DBTable = L7_52
    L7_52 = vlanConfig
    L7_52 = L7_52.config
    L7_52 = L7_52(L8_53, L9_54, L10_55)
    L3_48 = L7_52
    L7_52 = "vlan"
    DBTable = L7_52
  end
  L6_51 = db
  L6_51 = L6_51.getAttribute
  L7_52 = "unitInfo"
  L6_51 = L6_51(L7_52, L8_53, L9_54, L10_55)
  L7_52 = L6_51
  if L6_51 ~= nil and L6_51 ~= "WRVS5110" then
    L6_51 = true
  else
    L6_51 = false
  end
  if A2_47 == "add" or A2_47 == "edit" then
    if L6_51 then
      if L8_53 == "vlan" then
        if L8_53 == "4094" then
          L11_56 = "1"
          if L8_53 ~= nil and L8_53 ~= "LAN" then
            return L9_54, L10_55
          end
        end
        if L7_52 == "DSR-250N" or L7_52 == "DSR-250" or L7_52 == "DSR-150N" or L7_52 == "DSR-150" then
          if L8_53 == 4093 then
            return L8_53, L9_54
          end
        end
      end
    elseif L6_51 then
      if L8_53 == "VlanPortMgmt" then
        if L8_53 == "0" then
          L11_56 = "_ROWID_"
          L11_56 = 0
          for L15_60, L16_61 in L12_57(L13_58) do
            L11_56 = L11_56 + 1
            if L17_62 ~= nil and L17_62[L8_53] ~= nil and L17_62[L8_53] == "1" and L17_62["vlan.vlanId"] ~= A0_45["VlanPortMgmt.DefaultPVID"] then
              break
            elseif (L17_62[L8_53] ~= nil or L17_62[L8_53] == "0") and L17_62["vlan.vlanId"] == A0_45["VlanPortMgmt.DefaultPVID"] then
              L17_62[L8_53] = "1"
              db.update("vlan", L17_62, L17_62["vlan._ROWID_"])
            end
          end
          if L10_55 then
            return L12_57, L13_58
          end
        end
        if L8_53 == "4094" then
          L11_56 = "1"
          if L8_53 ~= nil and L8_53 ~= "LAN" then
            return L9_54, L10_55
          end
        end
        L11_56 = A0_45["VlanPortMgmt.DefaultPVID"]
        if L8_53 == nil then
          L11_56 = "dummy"
          L11_56 = "VlanPortMgmt"
          if L10_55 >= 17 then
            L11_56 = "11355"
            return L10_55, L11_56
          end
          L11_56 = tonumber
          L11_56 = L11_56(L12_57)
          L10_55["vlan.vlanId"] = L11_56
        else
          L11_56 = tonumber
          L11_56 = L11_56(L12_57)
          L11_56 = "_ROWID_"
        end
      end
    elseif L8_53 == "VlanPortMgmt" then
      if L8_53 == "0" then
        L11_56 = "_ROWID_"
        L11_56 = 0
        for L15_60, L16_61 in L12_57(L13_58) do
          L11_56 = L11_56 + 1
          if L17_62 ~= nil and L17_62[L8_53] ~= nil and L17_62[L8_53] == "1" and L17_62["vlan.vlanId"] ~= A0_45["VlanPortMgmt.DefaultPVID"] then
            break
          elseif (L17_62[L8_53] ~= nil or L17_62[L8_53] == "0") and L17_62["vlan.vlanId"] == A0_45["VlanPortMgmt.DefaultPVID"] then
            L17_62[L8_53] = "1"
            db.update("vlan", L17_62, L17_62["vlan._ROWID_"])
          end
        end
        if L10_55 then
          return L12_57, L13_58
        end
      end
      L11_56 = A0_45["VlanPortMgmt.DefaultPVID"]
      if L8_53 == nil then
        L11_56 = "dummy"
        L11_56 = "VlanPortMgmt"
        if L10_55 >= 17 then
          L11_56 = "11355"
          return L10_55, L11_56
        end
        L11_56 = tonumber
        L11_56 = L11_56(L12_57)
        L10_55["vlan.vlanId"] = L11_56
        L11_56 = db
        L11_56 = L11_56.insert
        L11_56 = L11_56(L12_57, L13_58)
        L3_48 = L11_56
        if not L3_48 then
          L11_56 = "ERROR"
          return L11_56, L12_57
        end
      else
        L11_56 = A0_45["VlanPortMgmt.DefaultPVID"]
        L11_56 = "_ROWID_"
      end
    end
  elseif A2_47 == "delete" then
    for L11_56, L12_57 in L8_53(L9_54) do
      if L14_59 then
        if L16_61 then
          return L17_62, "12504"
        end
        if L17_62 ~= nil then
        end
        if db.existsRow("SharePortVlan", "vlanId", L13_58) ~= nil then
        end
        if db.existsRow("fbwifivlan", "vlanId", L13_58) ~= nil then
        end
        rows = db.getRowsWhere("vlan", "vlanId=" .. L13_58)
        for _FORV_23_, _FORV_24_ in pairs(rows) do
          if _FORV_24_["vlan.vlanName"] ~= "vlanWan1" then
          end
        end
      end
    end
  end
  L11_56 = nil
  if L12_57 == "VlanPortMgmt" then
  end
  if A2_47 ~= "delete" then
    L3_48 = L12_57
    if not L3_48 then
      return L12_57, L13_58
    end
  end
  if L12_57 == "VlanPortMgmt" then
    L11_56 = L12_57
  end
  if L3_48 then
    if L12_57 == "VlanPortMgmt" and (L8_53 ~= nil and L9_54 ~= nil and L8_53 ~= L9_54 or L10_55 ~= nil and L11_56 ~= nil and L10_55 ~= L11_56) then
      for _FORV_18_, _FORV_19_ in L15_60(L16_61) do
        if L13_58[L14_59] ~= nil then
          if true then
            db.setAttribute("vlan", "_ROWID_", L13_58[L14_59]["vlan._ROWID_"], db.getAttribute("VlanPortMgmt", "_ROWID_", A1_46, "PortLogicalName"), L13_58[L14_59][L12_57])
          end
        end
      end
    end
  end
  if L3_48 then
    if L12_57 == "VlanPortMgmt" then
      L3_48 = L12_57
    end
  end
  if L3_48 then
    if L12_57 == "VlanPortMgmt" then
      if L12_57 == "0" then
        locTable = L12_57
        DBTable = L12_57
        L12_57[L13_58] = L14_59
        L3_48 = L12_57
        if not L3_48 then
          return L12_57, L13_58
        end
        DBTable = L12_57
      end
    end
  elseif L3_48 then
    if L12_57 == "VlanPortMgmt" then
      L12_57["vlan.vlanId"] = L13_58
      L12_57["vlan.vlanName"] = L13_58
      L12_57["vlan.portName"] = L13_58
      L13_58(L14_59, L15_60)
    end
  end
  if A2_47 ~= "delete" then
  else
    if L12_57 ~= "1" then
      if L12_57 == "1" then
        DBTable = L12_57
      else
        L3_48 = L12_57
        DBTable = L12_57
      end
  end
  elseif A2_47 == "edit" then
    if L12_57 ~= "VlanPortMgmt" then
      if L13_58 ~= nil then
        L13_58["interVLANRouting.status"] = L16_61
        L13_58["interVLANRouting.accessType"] = L16_61
        DBTable = L16_61
        L3_48 = L16_61
      end
      if L14_59 ~= nil then
        L14_59["interVLAN.status"] = L16_61
        DBTable = L16_61
        L3_48 = L16_61
      end
      if L16_61 ~= "1" then
      else
        if L16_61 == "3" then
          if L15_60 == nil then
            L15_60["CaptivePortalVlan.vlanId"] = L16_61
            L15_60["CaptivePortalVlan.ifName"] = L16_61
            L15_60["CaptivePortalVlan.accessType"] = L16_61
            L15_60["CaptivePortalVlan.authServerId"] = L16_61
            L15_60["CaptivePortalVlan.profileId"] = L16_61
            L15_60["CaptivePortalVlan.redirectType"] = L16_61
            if L16_61 ~= nil then
              if L16_61 == "1" then
                typeName = L16_61
              end
            elseif L16_61 ~= nil then
              typeName = L16_61
            end
            if L17_62 ~= nil then
              L15_60["CaptivePortalVlan.ipAddress"] = L17_62
            end
            DBTable = "CaptivePortalVlan"
            L3_48 = captivePortal.Config(L15_60, "-1", "add")
          else
            L15_60["CaptivePortalVlan.accessType"] = L16_61
            L15_60["CaptivePortalVlan.authServerId"] = L16_61
            L15_60["CaptivePortalVlan.profileId"] = L16_61
            L15_60["CaptivePortalVlan.redirectType"] = L16_61
            if L16_61 ~= nil then
              if L16_61 == "1" then
                typeName = L16_61
              end
            elseif L16_61 ~= nil then
              typeName = L16_61
            end
            if L17_62 ~= nil then
              L15_60["CaptivePortalVlan.ipAddress"] = L17_62
            end
            DBTable = "CaptivePortalVlan"
            L3_48 = captivePortal.Config(L15_60, L15_60["CaptivePortalVlan._ROWID_"], "edit")
          end
      end
      elseif L15_60 ~= nil then
        if L16_61 == "0" then
          L3_48 = L16_61
        end
      end
    end
  end
  if L3_48 then
    return L12_57, L13_58
  else
    return L12_57, L13_58
  end
end
function vlanConfig.portVlanConfig(A0_63, A1_64, A2_65)
  local L3_66, L4_67, L5_68, L6_69, L7_70, L8_71, L9_72, L10_73, L11_74, L12_75, L13_76, L14_77, L15_78, L16_79
  L3_66 = ACCESS_LEVEL
  if L3_66 ~= 0 then
    L3_66 = "ACCESS_DENIED"
    L4_67 = "10187"
    return L3_66, L4_67
  end
  if A2_65 ~= 1 then
    L3_66 = db
    L3_66 = L3_66.beginTransaction
    L3_66()
  end
  L3_66 = false
  L4_67 = false
  L5_68 = "vlan."
  L6_69 = db
  L6_69 = L6_69.getAttribute
  L7_70 = "VlanPortMgmt"
  L8_71 = "_ROWID_"
  L6_69 = L6_69(L7_70, L8_71, L9_72, L10_73)
  L5_68 = L5_68 .. L6_69
  L6_69 = db
  L6_69 = L6_69.getAttribute
  L7_70 = "VlanPortMgmt"
  L8_71 = "_ROWID_"
  L6_69 = L6_69(L7_70, L8_71, L9_72, L10_73)
  L7_70 = db
  L7_70 = L7_70.getTable
  L8_71 = "vlan"
  L7_70 = L7_70(L8_71)
  L8_71 = 0
  for L12_75, L13_76 in L9_72(L10_73) do
    L8_71 = L8_71 + 1
    L14_77 = L7_70[L8_71]
    L15_78 = false
    if L14_77 ~= nil then
      L16_79 = "vlan.row_"
      L16_79 = L16_79 .. L14_77["vlan._ROWID_"]
      L16_79 = A0_63[L16_79]
      if L16_79 == nil then
        L16_79 = L14_77["vlan.portName"]
        if L16_79 ~= nil then
          L16_79 = "vlan."
          L16_79 = L16_79 .. L14_77["vlan.portName"]
          if L16_79 == L5_68 then
            L16_79 = L14_77["vlan.vlanId"]
            if L6_69 ~= L16_79 then
              L16_79 = vlanConfig
              L16_79 = L16_79.config
              L16_79 = L16_79({
                L14_77["vlan._ROWID_"]
              }, -1, "delete")
              L3_66 = L16_79
            else
              L3_66 = true
            end
            L4_67 = true
            if not L3_66 then
              break
            end
          end
        end
      end
    end
  end
  L8_71 = 0
  for L12_75, L13_76 in L9_72(L10_73) do
    L8_71 = L8_71 + 1
    L14_77 = L7_70[L8_71]
    L15_78 = false
    if L14_77 ~= nil then
      L16_79 = "vlan.new_vlanId_"
      L16_79 = L16_79 .. L14_77["vlan.vlanId"]
      L16_79 = A0_63[L16_79]
      if L16_79 ~= nil then
        L16_79 = {}
        L16_79["vlan.vlanId"] = A0_63["vlan.new_vlanId_" .. L14_77["vlan.vlanId"]]
        L16_79["vlan.vlanName"] = db.getAttribute("vlan", "vlanId", L16_79["vlan.vlanId"], "vlanName")
        L16_79["vlan.portName"] = db.getAttribute("VlanPortMgmt", "_ROWID_", A1_64, "PortLogicalName")
        vlanConfig.config(L16_79, -1, "add")
      end
    end
  end
  if not L4_67 then
    L3_66 = true
  end
  if A2_65 == 1 then
    return L3_66
  end
  if L3_66 then
    L9_72(L10_73)
    return L9_72, L10_73
  else
    L9_72()
    return L9_72, L10_73
  end
end
function vlanConfig.portMgmtUpdate(A0_80)
  local L1_81, L2_82, L3_83, L4_84, L5_85, L6_86, L7_87
  L1_81 = ACCESS_LEVEL
  if L1_81 ~= 0 then
    L1_81 = "ACCESS_DENIED"
    L2_82 = "10187"
    return L1_81, L2_82
  end
  L1_81 = db
  L1_81 = L1_81.beginTransaction
  L1_81()
  L1_81 = false
  L2_82 = db
  L2_82 = L2_82.getAttribute
  L3_83 = "unitName"
  L4_84 = "_ROWID_"
  L5_85 = "1"
  L6_86 = "unitName"
  L2_82 = L2_82(L3_83, L4_84, L5_85, L6_86)
  L3_83 = db
  L3_83 = L3_83.getAttribute
  L4_84 = "unitInfo"
  L5_85 = "_ROWID_"
  L6_86 = "1"
  L7_87 = "modelId"
  L3_83 = L3_83(L4_84, L5_85, L6_86, L7_87)
  L4_84 = db
  L4_84 = L4_84.getRowWhere
  L5_85 = "VlanPortMgmt"
  L6_86 = "PortName = 'OptionalPort'"
  L4_84 = L4_84(L5_85, L6_86)
  if L4_84 ~= nil then
    L5_85 = A0_80["ConfigPort.LogicalIfName"]
    if L5_85 == "LAN" then
      if L2_82 ~= nil and L2_82 ~= "WRVS5110" or L3_83 ~= nil and (L3_83 == "DSR-250" or L3_83 == "DSR-250N" or L3_83 == "DSR-150" or L3_83 == "DSR-150N") then
        L5_85 = A0_80["ConfigPort.LogicalIfName"]
        L4_84["VlanPortMgmt.PortType"] = L5_85
        L4_84["VlanPortMgmt.DefaultPVID"] = "1"
      else
        L4_84["VlanPortMgmt.PortType"] = "BRIDGE"
      end
    else
      L5_85 = A0_80["ConfigPort.LogicalIfName"]
      if L5_85 == "WAN2" then
        L4_84["VlanPortMgmt.PortType"] = "WAN"
      else
        L5_85 = A0_80["ConfigPort.LogicalIfName"]
        L4_84["VlanPortMgmt.PortType"] = L5_85
      end
      if L2_82 ~= nil and L2_82 ~= "WRVS5110" then
        L4_84["VlanPortMgmt.DefaultPVID"] = "4094"
      elseif L3_83 ~= nil and (L3_83 == "DSR-250" or L3_83 == "DSR-250N" or L3_83 == "DSR-150" or L3_83 == "DSR-150N") then
        L4_84["VlanPortMgmt.DefaultPVID"] = "4093"
      else
        L4_84["VlanPortMgmt.DefaultPVID"] = "1"
      end
      L4_84["VlanPortMgmt.PortVlanMode"] = "0"
      L5_85 = false
      L6_86 = "vlan."
      L7_87 = L4_84["VlanPortMgmt.PortLogicalName"]
      L6_86 = L6_86 .. L7_87
      L7_87 = db
      L7_87 = L7_87.getTable
      L7_87 = L7_87("vlan")
      for _FORV_12_, _FORV_13_ in pairs(L7_87) do
        if L7_87[0 + 1]["vlan.portName"] == L4_84["VlanPortMgmt.PortLogicalName"] then
          L1_81 = db.delete("vlan", {
            L7_87[0 + 1]["vlan._ROWID_"]
          })
          if not L1_81 then
            L5_85 = true
            break
          end
        end
      end
      if L5_85 then
        db.rollback()
        return "ERROR", "12497"
      end
    end
    L5_85 = db
    L5_85 = L5_85.update
    L6_86 = "VlanPortMgmt"
    L7_87 = L4_84
    L5_85 = L5_85(L6_86, L7_87, L4_84["VlanPortMgmt._ROWID_"])
    L1_81 = L5_85
    if L1_81 then
      L5_85 = L4_84["VlanPortMgmt.PortType"]
      if L5_85 ~= "LAN" then
        L5_85 = L4_84["VlanPortMgmt.PortType"]
      elseif L5_85 == "BRIDGE" and (L2_82 ~= nil or L3_83 ~= nil) then
        L5_85 = "vlan."
        L6_86 = L4_84["VlanPortMgmt.PortLogicalName"]
        L5_85 = L5_85 .. L6_86
        L6_86 = db
        L6_86 = L6_86.getRow
        L7_87 = "vlan"
        L6_86 = L6_86(L7_87, "vlanId", "1")
        if L6_86 ~= nil then
          L7_87 = {}
          locTable = L7_87
          L7_87 = locTable
          L7_87["vlan.vlanId"] = 1
          L7_87 = locTable
          L7_87["vlan.vlanName"] = db.getAttribute("vlan", "vlanId", "1", "vlanName")
          L7_87 = locTable
          L7_87["vlan.portName"] = L4_84["VlanPortMgmt.PortLogicalName"]
          L7_87 = db
          L7_87 = L7_87.insert
          L7_87("vlan", locTable)
        end
        if not L1_81 then
          L7_87 = db
          L7_87 = L7_87.rollback
          L7_87()
          L7_87 = "ERROR"
          return L7_87, "12497"
        end
      end
    end
  else
    L1_81 = true
  end
  if L3_83 ~= nil and (L3_83 == "DSR-250" or L3_83 == "DSR-250N" or L3_83 == "DSR-150" or L3_83 == "DSR-150N") then
    L5_85 = A0_80["ConfigPort.LogicalIfName"]
    if L5_85 == "DMZ" then
      L5_85 = vlanConfig
      L5_85 = L5_85.vlanPSEConfig
      L6_86 = "4093"
      L7_87 = "add"
      L5_85(L6_86, L7_87)
    else
      L5_85 = A0_80["ConfigPort.LogicalIfName"]
      if L5_85 == "LAN" then
        L5_85 = vlanConfig
        L5_85 = L5_85.vlanPSEConfig
        L6_86 = "4093"
        L7_87 = "delete"
        L5_85(L6_86, L7_87)
      end
    end
  end
  if L1_81 then
    L5_85 = db
    L5_85 = L5_85.commitTransaction
    L6_86 = true
    L5_85(L6_86)
    L5_85 = "OK"
    L6_86 = "12265"
    return L5_85, L6_86
  else
    L5_85 = db
    L5_85 = L5_85.rollback
    L5_85()
    L5_85 = "ERROR"
    L6_86 = "11805"
    return L5_85, L6_86
  end
end
function vlanConfig.vlanPSEConfig(A0_88, A1_89)
  local L2_90, L3_91, L4_92, L5_93, L6_94, L7_95, L8_96
  L2_90 = 63
  L3_91 = 0
  L4_92 = ""
  for L8_96 = 0, L2_90 do
    L4_92 = "/pfrm2.0/bin/vlan_table_func read " .. L8_96 .. "|/bin/grep valid|/bin/grep 0|/usr/bin/wc -l>/tmp/spe_vlan.op"
    os.execute(L4_92)
    f = io.open("/tmp/spe_vlan.op", "r")
    if f ~= nil then
      valid_val = f:read("*line")
      f:close()
    end
    if valid_val == "1" then
      L3_91 = L8_96
      break
    end
  end
  if A1_89 == "add" then
    if L2_90 > L3_91 then
      L5_93["vlanPSEEntry.vlanId"] = A0_88
      L5_93["vlanPSEEntry.vlanIndex"] = L3_91
      DBTable = L6_94
      L8_96 = "-1"
      valid1 = L6_94
    end
  elseif A1_89 == "delete" then
    L8_96 = L5_93
    if L6_94 then
      L8_96 = "vlanPSEEntry"
      L7_95(L8_96, L5_93)
    end
  end
end
function vlanConfig.vlanDeleteCheck(A0_97)
  local L1_98, L2_99, L3_100, L4_101, L5_102, L6_103, L7_104, L8_105, L9_106, L10_107, L11_108
  for L4_101, L5_102 in L1_98(L2_99) do
    L6_103 = db
    L6_103 = L6_103.getRow
    L7_104 = "vlan"
    L8_105 = "vlanId"
    L9_106 = L5_102
    L6_103 = L6_103(L7_104, L8_105, L9_106)
    L7_104 = db
    L7_104 = L7_104.getRowsWhere
    L8_105 = "TrafficSelector"
    L9_106 = "MatchType = 4 and VlanId = "
    L10_107 = L6_103["vlan.vlanId"]
    L9_106 = L9_106 .. L10_107
    L7_104 = L7_104(L8_105, L9_106)
    if L7_104 ~= nil then
      L8_105 = #L7_104
      if L8_105 ~= 0 then
        L8_105 = "ERROR"
        L9_106 = "12802"
        return L8_105, L9_106
      end
    end
    L8_105 = db
    L8_105 = L8_105.existsRowWhere
    L9_106 = "SharePortVlan"
    L10_107 = "vlanId = "
    L11_108 = L6_103["vlan.vlanId"]
    L10_107 = L10_107 .. L11_108 .. " and storagesharing=1 or printersharing=1"
    L8_105 = L8_105(L9_106, L10_107)
    if L8_105 then
      L9_106 = "ERROR"
      L10_107 = "12803"
      return L9_106, L10_107
    end
    L9_106 = db
    L9_106 = L9_106.existsRowWhere
    L10_107 = "fbwifivlan"
    L11_108 = "vlanId = "
    L11_108 = L11_108 .. L6_103["vlan.vlanId"] .. " and fbwifion = 1"
    L9_106 = L9_106(L10_107, L11_108)
    if L9_106 then
      L10_107 = "ERROR"
      L11_108 = "VLAN_FBWIFI_ENABLED"
      return L10_107, L11_108
    end
    L10_107 = db
    L10_107 = L10_107.existsRowWhere
    L11_108 = "vlan"
    L10_107 = L10_107(L11_108, "vlanId=" .. L6_103["vlan.vlanId"] .. " and portName='dummy'")
    L11_108 = db
    L11_108 = L11_108.getAttribute
    L11_108 = L11_108("vlan", "_ROWID_", L10_107, "vlanName")
    if db.existsRow("ServicesRouteMgmt", "vlanName", L11_108) then
      return "ERROR", _UPVALUE0_.VLAN_IN_USE_BY_SERVICEROUTE
    end
  end
  for L4_101, L5_102 in L1_98(L2_99) do
    L6_103 = db
    L6_103 = L6_103.getRow
    L7_104 = "vlan"
    L8_105 = "vlanId"
    L9_106 = L5_102
    L6_103 = L6_103(L7_104, L8_105, L9_106)
    L7_104 = db
    L7_104 = L7_104.getRowsWhere
    L8_105 = "FirewallRules"
    L9_106 = "FromZoneVlanId = "
    L10_107 = L6_103["vlan.vlanId"]
    L11_108 = " or ToZoneVlanId = "
    L9_106 = L9_106 .. L10_107 .. L11_108 .. L6_103["vlan.vlanId"]
    L7_104 = L7_104(L8_105, L9_106)
    if L7_104 ~= nil then
      L8_105 = #L7_104
      if L8_105 ~= 0 then
        L8_105 = "ERROR"
        L9_106 = "11807"
        return L8_105, L9_106
      end
    end
    if L5_102 ~= "1" then
      L8_105 = db
      L8_105 = L8_105.getRowsWhere
      L9_106 = "DhcpfixedIpAddress"
      L10_107 = "logicalIfName='LAN"
      L11_108 = L5_102
      L10_107 = L10_107 .. L11_108 .. "'"
      L8_105 = L8_105(L9_106, L10_107)
      if L8_105 ~= nil then
        L9_106 = #L8_105
        if L9_106 ~= 0 then
          L9_106 = "ERROR"
          L10_107 = "12804"
          return L9_106, L10_107
        end
      end
    end
  end
  for L4_101, L5_102 in L1_98(L2_99) do
    L6_103 = db
    L6_103 = L6_103.getRow
    L7_104 = "vlan"
    L8_105 = "vlanId"
    L9_106 = L5_102
    L6_103 = L6_103(L7_104, L8_105, L9_106)
    L7_104 = db
    L7_104 = L7_104.getRowsWhere
    L8_105 = "BandWidthProfile"
    L9_106 = "WANID ='LAN"
    L10_107 = L5_102
    L11_108 = "'"
    L9_106 = L9_106 .. L10_107 .. L11_108
    L7_104 = L7_104(L8_105, L9_106)
    if L7_104 ~= nil then
      L8_105 = #L7_104
      if L8_105 ~= 0 then
        L8_105 = "ERROR"
        L9_106 = "12802"
        return L8_105, L9_106
      end
    end
  end
  return L1_98, L2_99
end
function vlanConfig.portVlanEditCheck(A0_109)
  local L1_110, L2_111, L3_112, L4_113, L5_114
  L1_110 = UNIT_NAME
  if L1_110 ~= "DSR-250" then
    L1_110 = UNIT_NAME
    if L1_110 ~= "DSR-250N" then
      L1_110 = UNIT_NAME
      if L1_110 ~= "DSR-500" then
        L1_110 = UNIT_NAME
        if L1_110 ~= "DSR-500N" then
          L1_110 = UNIT_NAME
          if L1_110 ~= "DSR-1000" then
            L1_110 = UNIT_NAME
            if L1_110 ~= "DSR-1000N" then
              L1_110 = UNIT_NAME
              if L1_110 ~= "DSR-150" then
                L1_110 = UNIT_NAME
              end
            end
          end
        end
      end
    end
  else
    if L1_110 == "DSR-150N" then
      L1_110 = db
      L1_110 = L1_110.getRow
      L2_111 = "VlanPortMgmt"
      L3_112 = "_ROWID_"
      L4_113 = A0_109
      L1_110 = L1_110(L2_111, L3_112, L4_113)
      L2_111 = db
      L2_111 = L2_111.getAttribute
      L3_112 = "BandwidthProfileStatus"
      L4_113 = "_ROWID_"
      L5_114 = "1"
      L2_111 = L2_111(L3_112, L4_113, L5_114, "Status")
      if L1_110 ~= nil then
        L3_112 = db
        L3_112 = L3_112.getRowsWhere
        L4_113 = "TrafficSelector"
        L5_114 = "MatchType = 3 and PortName = '"
        L5_114 = L5_114 .. L1_110["VlanPortMgmt.PortName"] .. "'"
        L3_112 = L3_112(L4_113, L5_114)
        if L3_112 ~= nil then
          L4_113 = #L3_112
          if L4_113 ~= 0 and L2_111 ~= "0" then
            L4_113 = "ERROR"
            L5_114 = "11806"
            return L4_113, L5_114
          end
        end
      end
      L3_112 = "OK"
      L4_113 = "12265"
      return L3_112, L4_113
  end
  else
    L1_110 = "_ROWID_="
    L2_111 = A0_109
    L3_112 = " and PortType='LAN'"
    L1_110 = L1_110 .. L2_111 .. L3_112
    L2_111 = db
    L2_111 = L2_111.getRowWhere
    L3_112 = "VlanPortMgmt"
    L4_113 = L1_110
    L2_111 = L2_111(L3_112, L4_113)
    L3_112 = db
    L3_112 = L3_112.getAttribute
    L4_113 = "qosProfile"
    L5_114 = "_ROWID_"
    L3_112 = L3_112(L4_113, L5_114, "1", "BandwidthProfileStatus")
    if L2_111 ~= nil then
      L4_113 = string
      L4_113 = L4_113.len
      L5_114 = "port"
      L4_113 = L4_113(L5_114)
      L4_113 = L4_113 + 1
      L5_114 = string
      L5_114 = L5_114.sub
      L5_114 = L5_114(L2_111["VlanPortMgmt.PortLogicalName"], L4_113)
      if db.getRowsWhere("qosClassification", "OutOfBandInfo = " .. L5_114 .. "") ~= nil and #db.getRowsWhere("qosClassification", "OutOfBandInfo = " .. L5_114 .. "") ~= 0 and L3_112 ~= "0" then
        return "ERROR", "11806"
      end
    end
    L4_113 = "OK"
    L5_114 = "12265"
    return L4_113, L5_114
  end
end
function vlanConfig.ifStaticConfig(A0_115, A1_116, A2_117)
  local L3_118
  L3_118 = ACCESS_LEVEL
  if L3_118 ~= 0 then
    L3_118 = "ACCESS_DENIED"
    return L3_118, "10187"
  end
  L3_118 = false
  DBTable = "ifStatic"
  L3_118 = vlanConfig.config(A0_115, A1_116, A2_117)
  if L3_118 then
    return "OK", "12265"
  else
    return "ERROR", "12800"
  end
end
function vlanConfig.wanIfNameMapUpdate(A0_119, A1_120, A2_121)
  local L3_122
  L3_122 = {}
  wanIfNameMapTab = db.getRow("WanIfNameMap", "LogicalIfName", A0_119)
  if wanIfNameMapTab == nil then
    return "ERROR"
  end
  if tonumber(A2_121) == 1 then
    wanIfNameMapTab["WanIfNameMap" .. "." .. "VlanPortMode"] = "2"
    wanIfNameMapTab["WanIfNameMap" .. "." .. "InterfaceName"] = A1_120
  else
    wanIfNameMapTab["WanIfNameMap" .. "." .. "VlanPortMode"] = "0"
    wanIfNameMapTab["WanIfNameMap" .. "." .. "InterfaceName"] = A1_120
  end
  valid = db.update("WanIfNameMap", wanIfNameMapTab, wanIfNameMapTab["WanIfNameMap" .. "." .. "_ROWID_"])
  if not valid then
    return "ERROR"
  end
  return "OK"
end
function vlanConfig.vlanWAN1Config(A0_123)
  local L1_124, L2_125
  L1_124 = ACCESS_LEVEL
  if L1_124 ~= 0 then
    L1_124 = "ACCESS_DENIED"
    L2_125 = "10187"
    return L1_124, L2_125
  end
  L1_124 = false
  L2_125 = {}
  L2_125 = db.getRow("VlanPortMgmt", "PortLogicalName", "port100")
  if A0_123["vlanWan1Status.vlanWan1Status"] == "1" then
    L2_125["VlanPortMgmt.PortVlanMode"] = "2"
  else
    L2_125["VlanPortMgmt.PortVlanMode"] = "0"
  end
  L1_124 = db.update("VlanPortMgmt", L2_125, L2_125["VlanPortMgmt._ROWID_"])
  if UNIT_NAME ~= "DSR-250" and UNIT_NAME ~= "DSR-250N" and UNIT_NAME ~= "DSR-150" and UNIT_NAME ~= "DSR-150N" then
    L2_125 = db.getRow("VlanPortMgmt", "PortLogicalName", "port5")
    if A0_123["vlanWan1Status.vlanWan1Status"] == "1" then
      L2_125["VlanPortMgmt.PortVlanMode"] = "2"
    else
      L2_125["VlanPortMgmt.PortVlanMode"] = "0"
    end
    L1_124 = db.update("VlanPortMgmt", L2_125, L2_125["VlanPortMgmt._ROWID_"])
    L2_125 = db.getRow("VlanPortMgmt", "PortLogicalName", "port6")
    if A0_123["vlanWan1Status.vlanWan1Status"] == "1" then
      L2_125["VlanPortMgmt.PortVlanMode"] = "2"
    else
      L2_125["VlanPortMgmt.PortVlanMode"] = "0"
    end
    L1_124 = L1_124 and db.update("VlanPortMgmt", L2_125, L2_125["VlanPortMgmt._ROWID_"])
  end
  if L1_124 then
    if tonumber(A0_123["vlanWan1Status.vlanWan1Status"]) == 1 then
      interfaceName = "bdgWAN1"
    else
      interfaceName = "eth1"
    end
    vlanOnWANStatus = A0_123["vlanWan1Status.vlanWan1Status"]
    if vlanConfig.wanIfNameMapUpdate("WAN1", interfaceName, vlanOnWANStatus) ~= "OK" then
      return "ERROR", "12800"
    end
  end
  if L1_124 then
    return "OK", "12265"
  else
    return "ERROR", "12800"
  end
end
function vlanConfig.vlanWAN2Config(A0_126)
  local L1_127, L2_128
  L1_127 = ACCESS_LEVEL
  if L1_127 ~= 0 then
    L1_127 = "ACCESS_DENIED"
    L2_128 = "10187"
    return L1_127, L2_128
  end
  L1_127 = false
  L2_128 = {}
  L2_128 = db.getRow("VlanPortMgmt", "PortLogicalName", "port200")
  if A0_126["vlanWan2Status.vlanWan2Status"] == "1" then
    L2_128["VlanPortMgmt.PortVlanMode"] = "2"
  else
    L2_128["VlanPortMgmt.PortVlanMode"] = "0"
  end
  L1_127 = db.update("VlanPortMgmt", L2_128, L2_128["VlanPortMgmt._ROWID_"])
  if L1_127 then
    if tonumber(A0_126["vlanWan2Status.vlanWan2Status"]) == 1 then
      interfaceName = "bdgWAN2"
    else
      interfaceName = "eth2"
    end
    vlanOnWANStatus = A0_126["vlanWan2Status.vlanWan2Status"]
    if vlanConfig.wanIfNameMapUpdate("WAN2", interfaceName, vlanOnWANStatus) ~= "OK" then
      return "ERROR", "12800"
    end
  end
  if L1_127 then
    return "OK", "12265"
  else
    return "ERROR", "12800"
  end
end
function vlanConfig.vlanWAN1AddEdit(A0_129)
  local L1_130, L2_131, L3_132, L4_133, L5_134, L6_135, L7_136, L8_137, L9_138, L10_139, L11_140
  L1_130 = ACCESS_LEVEL
  if L1_130 ~= 0 then
    L1_130 = "ACCESS_DENIED"
    L2_131 = "10187"
    return L1_130, L2_131
  end
  L1_130 = {}
  L2_131 = {}
  L3_132 = {}
  L4_133 = {}
  L5_134 = db
  L5_134 = L5_134.getRows
  L6_135 = "vlan"
  L7_136 = "vlanName"
  L5_134 = L5_134(L6_135, L7_136, L8_137)
  L1_130 = L5_134
  if L1_130 == nil then
    L5_134 = A0_129["vlanWan1Status.vlanWan1Status"]
    if L5_134 == "1" then
      L5_134 = {}
      L2_131 = L5_134
      L2_131["vlan.portName"] = "port100"
      L5_134 = A0_129["vlan.vlanId"]
      L2_131["vlan.vlanId"] = L5_134
      L2_131["vlan.vlanName"] = "vlanWan1"
      L2_131["vlan.vlanInternal"] = "0"
      L5_134 = UNIT_NAME
      if L5_134 ~= "DSR-250" then
        L5_134 = UNIT_NAME
        if L5_134 ~= "DSR-250N" then
          L5_134 = UNIT_NAME
          if L5_134 ~= "DSR-150" then
            L5_134 = UNIT_NAME
            if L5_134 ~= "DSR-150N" then
              L5_134 = {}
              L3_132 = L5_134
              L3_132["vlan.portName"] = "port5"
              L5_134 = A0_129["vlan.vlanId"]
              L3_132["vlan.vlanId"] = L5_134
              L3_132["vlan.vlanName"] = "vlanWan1"
              L3_132["vlan.vlanInternal"] = "0"
              L5_134 = {}
              L4_133 = L5_134
              L4_133["vlan.portName"] = "port6"
              L5_134 = A0_129["vlan.vlanId"]
              L4_133["vlan.vlanId"] = L5_134
              L4_133["vlan.vlanName"] = "vlanWan1"
              L4_133["vlan.vlanInternal"] = "0"
            end
          end
        end
      end
      L5_134 = db
      L5_134 = L5_134.insert
      L6_135 = "vlan"
      L7_136 = L2_131
      L5_134 = L5_134(L6_135, L7_136)
      valid = L5_134
      L5_134 = UNIT_NAME
      if L5_134 ~= "DSR-250" then
        L5_134 = UNIT_NAME
        if L5_134 ~= "DSR-250N" then
          L5_134 = UNIT_NAME
          if L5_134 ~= "DSR-150" then
            L5_134 = UNIT_NAME
            if L5_134 ~= "DSR-150N" then
              L5_134 = valid
              if L5_134 then
                L5_134 = db
                L5_134 = L5_134.insert
                L6_135 = "vlan"
                L7_136 = L3_132
                L5_134 = L5_134(L6_135, L7_136)
              end
              valid = L5_134
              L5_134 = valid
              if L5_134 then
                L5_134 = db
                L5_134 = L5_134.insert
                L6_135 = "vlan"
                L7_136 = L4_133
                L5_134 = L5_134(L6_135, L7_136)
              end
              valid = L5_134
            end
          end
        end
      end
      L5_134 = UNIT_NAME
      if L5_134 ~= "DSR-250" then
        L5_134 = UNIT_NAME
        if L5_134 ~= "DSR-250N" then
          L5_134 = UNIT_NAME
          if L5_134 ~= "DSR-150" then
            L5_134 = UNIT_NAME
          end
        end
      elseif L5_134 == "DSR-150N" then
        L5_134 = valid
        if L5_134 then
          L5_134 = 63
          L6_135 = 0
          L7_136 = ""
          for L11_140 = 0, L5_134 do
            L7_136 = "/pfrm2.0/bin/vlan_table_func read " .. L11_140 .. "|/bin/grep valid|/bin/grep 0|/usr/bin/wc -l>/tmp/spe_vlan.op"
            os.execute(L7_136)
            f = io.open("/tmp/spe_vlan.op", "r")
            if f ~= nil then
              valid_val = f:read("*line")
              f:close()
            end
            if valid_val == "1" then
              L6_135 = L11_140
              break
            end
          end
          if L5_134 > L6_135 then
            L8_137["vlanPSEEntry.vlanId"] = L9_138
            L8_137["vlanPSEEntry.vlanIndex"] = L6_135
            L8_137["vlanPSEEntry.LogicalIfName"] = "WAN1"
            DBTable = L9_138
            L11_140 = "-1"
            valid = L9_138
          end
        end
      end
      L5_134 = valid
      if L5_134 then
        L5_134 = "OK"
        L6_135 = "12265"
        return L5_134, L6_135
      else
        L5_134 = "ERROR"
        L6_135 = "12800"
        return L5_134, L6_135
      end
    end
  elseif L1_130 ~= nil then
    L5_134 = A0_129["vlanWan1Status.vlanWan1Status"]
    if L5_134 == "1" then
      L5_134 = vlanConfig
      L5_134 = L5_134.vlanWAN1Delete
      L6_135 = A0_129
      L6_135 = L5_134(L6_135)
      statusCode = L6_135
      errorFlag = L5_134
      L5_134 = errorFlag
      if L5_134 == "OK" then
        L5_134 = {}
        L2_131 = L5_134
        L2_131["vlan.portName"] = "port100"
        L5_134 = A0_129["vlan.vlanId"]
        L2_131["vlan.vlanId"] = L5_134
        L2_131["vlan.vlanName"] = "vlanWan1"
        L2_131["vlan.vlanInternal"] = "0"
        L5_134 = UNIT_NAME
        if L5_134 ~= "DSR-250" then
          L5_134 = UNIT_NAME
          if L5_134 ~= "DSR-250N" then
            L5_134 = UNIT_NAME
            if L5_134 ~= "DSR-150" then
              L5_134 = UNIT_NAME
              if L5_134 ~= "DSR-150N" then
                L5_134 = {}
                L3_132 = L5_134
                L3_132["vlan.portName"] = "port5"
                L5_134 = A0_129["vlan.vlanId"]
                L3_132["vlan.vlanId"] = L5_134
                L3_132["vlan.vlanName"] = "vlanWan1"
                L3_132["vlan.vlanInternal"] = "0"
                L5_134 = {}
                L4_133 = L5_134
                L4_133["vlan.portName"] = "port6"
                L5_134 = A0_129["vlan.vlanId"]
                L4_133["vlan.vlanId"] = L5_134
                L4_133["vlan.vlanName"] = "vlanWan1"
                L4_133["vlan.vlanInternal"] = "0"
              end
            end
          end
        end
        L5_134 = db
        L5_134 = L5_134.insert
        L6_135 = "vlan"
        L7_136 = L2_131
        L5_134 = L5_134(L6_135, L7_136)
        valid = L5_134
        L5_134 = UNIT_NAME
        if L5_134 ~= "DSR-250" then
          L5_134 = UNIT_NAME
          if L5_134 ~= "DSR-250N" then
            L5_134 = UNIT_NAME
            if L5_134 ~= "DSR-150" then
              L5_134 = UNIT_NAME
              if L5_134 ~= "DSR-150N" then
                L5_134 = valid
                if L5_134 then
                  L5_134 = db
                  L5_134 = L5_134.insert
                  L6_135 = "vlan"
                  L7_136 = L3_132
                  L5_134 = L5_134(L6_135, L7_136)
                end
                valid = L5_134
                L5_134 = valid
                if L5_134 then
                  L5_134 = db
                  L5_134 = L5_134.insert
                  L6_135 = "vlan"
                  L7_136 = L4_133
                  L5_134 = L5_134(L6_135, L7_136)
                end
                valid = L5_134
              end
            end
          end
        end
        L5_134 = UNIT_NAME
        if L5_134 ~= "DSR-250" then
          L5_134 = UNIT_NAME
          if L5_134 ~= "DSR-250N" then
            L5_134 = UNIT_NAME
            if L5_134 ~= "DSR-150" then
              L5_134 = UNIT_NAME
            end
          end
        elseif L5_134 == "DSR-150N" then
          L5_134 = valid
          if L5_134 then
            L5_134 = 63
            L6_135 = 0
            L7_136 = ""
            for L11_140 = 0, L5_134 do
              L7_136 = "/pfrm2.0/bin/vlan_table_func read " .. L11_140 .. "|/bin/grep valid|/bin/grep 0|/usr/bin/wc -l>/tmp/spe_vlan.op"
              os.execute(L7_136)
              f = io.open("/tmp/spe_vlan.op", "r")
              if f ~= nil then
                valid_val = f:read("*line")
                f:close()
              end
              if valid_val == "1" then
                L6_135 = L11_140
                break
              end
            end
            if L5_134 > L6_135 then
              L8_137["vlanPSEEntry.vlanId"] = L9_138
              L8_137["vlanPSEEntry.vlanIndex"] = L6_135
              L8_137["vlanPSEEntry.LogicalIfName"] = "WAN1"
              DBTable = L9_138
              L11_140 = "-1"
              valid = L9_138
            end
          end
        end
        L5_134 = valid
        if L5_134 then
          L5_134 = "OK"
          L6_135 = "12265"
          return L5_134, L6_135
        else
          L5_134 = "ERROR"
          L6_135 = "12800"
          return L5_134, L6_135
        end
      else
        L5_134 = "ERROR"
        L6_135 = "12800"
        return L5_134, L6_135
      end
    end
  elseif L1_130 ~= nil then
    L5_134 = A0_129["vlanWan1Status.vlanWan1Status"]
    if L5_134 ~= nil then
      L5_134 = A0_129["vlanWan1Status.vlanWan1Status"]
    elseif L5_134 == "0" then
      L5_134 = vlanConfig
      L5_134 = L5_134.vlanWAN1Delete
      L6_135 = A0_129
      L6_135 = L5_134(L6_135)
      statusCode = L6_135
      errorFlag = L5_134
      L5_134 = errorFlag
      if L5_134 == "OK" then
        L5_134 = "OK"
        L6_135 = "12265"
        return L5_134, L6_135
      else
        L5_134 = "ERROR"
        L6_135 = "12800"
        return L5_134, L6_135
      end
    end
  elseif L1_130 == nil then
    L5_134 = A0_129["vlanWan1Status.vlanWan1Status"]
    if L5_134 ~= nil then
      L5_134 = A0_129["vlanWan1Status.vlanWan1Status"]
    elseif L5_134 == "0" then
      L5_134 = "OK"
      L6_135 = "12265"
      return L5_134, L6_135
    end
  end
end
function vlanConfig.vlanWAN1Delete(A0_141)
  local L1_142, L2_143
  L2_143 = db
  L2_143 = L2_143.deleteRow
  L2_143 = L2_143("vlan", "vlanName", "vlanWan1")
  L1_142 = L2_143
  L2_143 = UNIT_NAME
  if L2_143 ~= "DSR-250" then
    L2_143 = UNIT_NAME
    if L2_143 ~= "DSR-250N" then
      L2_143 = UNIT_NAME
      if L2_143 ~= "DSR-150" then
        L2_143 = UNIT_NAME
      end
    end
  elseif L2_143 == "DSR-150N" then
    L2_143 = "LogicalIfName = 'WAN1'"
    L1_142 = db.deleteRowWhere("vlanPSEEntry", L2_143)
  end
  if L1_142 then
    L2_143 = "OK"
    return L2_143, "12265"
  else
    L2_143 = "ERROR"
    return L2_143, "12800"
  end
end
function vlanConfig.vlanWAN2AddEdit(A0_144)
  local L1_145, L2_146
  L1_145 = ACCESS_LEVEL
  if L1_145 ~= 0 then
    L1_145 = "ACCESS_DENIED"
    L2_146 = "10187"
    return L1_145, L2_146
  end
  L1_145 = {}
  L2_146 = {}
  if L1_145 == nil and A0_144["vlanWan2Status.vlanWan2Status"] == "1" then
    L2_146 = {}
    L2_146["vlan.portName"] = "port200"
    L2_146["vlan.vlanId"] = A0_144["vlan.vlanId"]
    L2_146["vlan.vlanName"] = "vlanWan2"
    L2_146["vlan.vlanInternal"] = "0"
    valid = db.insert("vlan", L2_146)
    if valid then
      return "OK", "12265"
    else
      return "ERROR", "12800"
    end
  elseif L1_145 ~= nil and A0_144["vlanWan2Status.vlanWan2Status"] == "1" then
    errorFlag, statusCode = vlanConfig.vlanWAN2Delete(A0_144)
    if errorFlag == "OK" then
      L2_146 = {}
      L2_146["vlan.portName"] = "port200"
      L2_146["vlan.vlanId"] = A0_144["vlan.vlanId"]
      L2_146["vlan.vlanName"] = "vlanWan2"
      L2_146["vlan.vlanInternal"] = "0"
      valid = db.insert("vlan", L2_146)
      if valid then
        return "OK", "12265"
      else
        return "ERROR", "12800"
      end
    else
      return "ERROR", "12800"
    end
  elseif L1_145 ~= nil and (A0_144["vlanWan2Status.vlanWan2Status"] == nil or A0_144["vlanWan2Status.vlanWan2Status"] == "0") then
    errorFlag, statusCode = vlanConfig.vlanWAN2Delete(A0_144)
    if errorFlag == "OK" then
      return "OK", "12265"
    else
      return "ERROR", "12800"
    end
  elseif L1_145 == nil and (A0_144["vlanWan2Status.vlanWan2Status"] == nil or A0_144["vlanWan2Status.vlanWan2Status"] == "0") then
    return "OK", "12265"
  end
end
function vlanConfig.vlanWAN2Delete(A0_147)
  local L1_148, L2_149
  L2_149 = db
  L2_149 = L2_149.deleteRow
  L2_149 = L2_149("vlan", "vlanName", "vlanWan2")
  L1_148 = L2_149
  L2_149 = UNIT_NAME
  if L2_149 ~= "DSR-250" then
    L2_149 = UNIT_NAME
    if L2_149 ~= "DSR-250N" then
      L2_149 = UNIT_NAME
      if L2_149 ~= "DSR-150" then
        L2_149 = UNIT_NAME
      end
    end
  elseif L2_149 == "DSR-150N" then
    L2_149 = "LogicalIfName = 'WAN2'"
    L1_148 = db.deleteRowWhere("vlanPSEEntry", L2_149)
  end
  if L1_148 then
    L2_149 = "OK"
    return L2_149, "12265"
  else
    L2_149 = "ERROR"
    return L2_149, "12800"
  end
end
