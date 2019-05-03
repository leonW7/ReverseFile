require("teamf1lualib/fwView")
require("teamf1lualib/vlanConfig")
require("iprouteLuaLib")
function NATInfoGet(A0_0)
  local L1_1
  L1_1 = {}
  printLabel(" Routing Mode between WAN and LAN ")
  row = db.getRow("NatTable", "NatTable._ROWID_", 1)
  if row["NatTable.Enable"] == "0" then
    print(" NAT is Disabled")
    print(" Classical Routing is Enabled")
  elseif row["NatTable.Enable"] == "1" then
    if MODEL_ID ~= "DSR-250" and MODEL_ID ~= "DSR-250N" and MODEL_ID ~= "DSR-150" and MODEL_ID ~= "DSR-150N" then
      print(" NAT is Enabled for " .. row["NatTable.NATInterfaces"])
    else
      print("NAT is Enabled")
    end
  elseif row["NatTable.Enable"] == "5" then
    print(" Transparent Routing is Enabled")
  elseif row["NatTable.Enable"] == "6" then
    print(" Bridge Routing is Enabled")
  end
end
function natCfgSave(A0_2)
  local L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L12_14, L13_15, L14_16, L15_17, L16_18, L17_19, L18_20, L19_21, L20_22, L21_23, L22_24, L23_25
  L1_3 = "OK"
  L2_4 = ""
  L3_5 = ""
  L4_6 = 5
  L5_7 = 0
  L6_8 = ""
  L7_9 = "0"
  L8_10 = "Enabling NAT will revert all DMZ and inbound firewall settings to defaults.\n"
  L9_11 = "Enabling Classical Routing will revert all DMZ and inbound firewall settings to defaults.\n"
  L10_12 = "Enabling 'Transparent' will revert all DMZ and inbound "
  L11_13 = "firewall settings to defaults and IPSEC VPN "
  L12_14 = "functionality will not work.\n"
  L10_12 = L10_12 .. L11_13 .. L12_14
  L11_13 = "Enabling 'Bridge' will revert all DMZ and inbound firewall settings to defaults.\n"
  L12_14 = "NatTable"
  DBTable = L12_14
  L12_14 = A0_2["NatTable.Enable"]
  if L12_14 == "0" then
    L12_14 = printCLIError
    L13_15 = L9_11
    L12_14(L13_15)
  else
    L12_14 = A0_2["NatTable.Enable"]
    if L12_14 == "1" then
      L12_14 = printCLIError
      L13_15 = L8_10
      L12_14(L13_15)
    else
      L12_14 = A0_2["NatTable.Enable"]
      if L12_14 == "5" then
        L12_14 = printCLIError
        L13_15 = L10_12
        L12_14(L13_15)
      else
        L12_14 = A0_2["NatTable.Enable"]
        if L12_14 == "6" then
          L12_14 = printCLIError
          L13_15 = L11_13
          L12_14(L13_15)
        end
      end
    end
  end
  while L6_8 ~= "Y" and L6_8 ~= "N" and L6_8 ~= "y" and L6_8 ~= "n" and L4_6 > L5_7 do
    L12_14 = printCLIError
    L13_15 = "Are you sure you want to proceed? [Y/N]?"
    L12_14(L13_15)
    L12_14 = io
    L12_14 = L12_14.stdin
    L13_15 = L12_14
    L12_14 = L12_14.read
    L14_16 = "*l"
    L12_14 = L12_14(L13_15, L14_16)
    L6_8 = L12_14
    L5_7 = L5_7 + 1
  end
  if L6_8 == "N" or L6_8 == "n" or L5_7 == L4_6 then
    L1_3 = "OK"
    L12_14 = printCLIError
    L13_15 = "Action Cancelled"
    L12_14(L13_15)
    L12_14 = L1_3
    L13_15 = nil
    return L12_14, L13_15
  end
  if L6_8 == "Y" or L6_8 == "y" then
    if L1_3 == "OK" then
      L12_14 = db
      L12_14 = L12_14.beginTransaction
      L12_14()
      L12_14 = db
      L12_14 = L12_14.getAttribute
      L13_15 = "NatTable"
      L14_16 = "_ROWID_"
      L15_17 = "1"
      L16_18 = "BridgeVlan"
      L12_14 = L12_14(L13_15, L14_16, L15_17, L16_18)
      L13_15 = db
      L13_15 = L13_15.getAttribute
      L14_16 = "NatTable"
      L15_17 = "_ROWID_"
      L16_18 = "1"
      L17_19 = "Enable"
      L13_15 = L13_15(L14_16, L15_17, L16_18, L17_19)
      L14_16 = A0_2["NatTable.Enable"]
      L14_16 = L14_16 or ""
      L15_17 = db
      L15_17 = L15_17.getRowWhere
      L16_18 = "ifStatic"
      L17_19 = "LogicalIfName = 'DMZ'"
      L15_17 = L15_17(L16_18, L17_19)
      L16_18 = L15_17["ifStatic._ROWID_"]
      if L14_16 == "6" then
        if L12_14 == "1" then
          L17_19 = 4088
          for L21_23 = 1, 6 do
            L22_24 = "vlanId="
            L23_25 = L17_19
            L22_24 = L22_24 .. L23_25
            L23_25 = db
            L23_25 = L23_25.getRowWhere
            L23_25 = L23_25("vlan", L22_24)
            if L23_25 ~= nil then
              L17_19 = L17_19 + 1
              L23_25 = {}
            else
              A0_2["NatTable.BridgeVlan"] = L17_19
              inputTable_all = {}
              inputTable_all["vlan.vlanId"] = A0_2["NatTable.BridgeVlan"]
              inputTable_all["vlan.vlanName"] = "bridge"
              inputTable_all["vlan.portName"] = ""
              inputTable_all["vlan.vlanInternal"] = "1"
              inputTable_all["interVLANRouting.accessType"] = "0"
              inputTable_all["interVLANRouting.status"] = "0"
              inputTable_all.insertRpt = "0"
              L1_3, L2_4 = vlanConfig.vlanConfig(inputTable_all, "-1", "add")
              if L1_3 == "OK" then
                inputTable_all = {}
                inputTable_all["vlan.vlanId"] = A0_2["NatTable.BridgeVlan"]
                inputTable_all["vlan.vlanName"] = ""
                inputTable_all["vlan.portName"] = "port10"
                inputTable_all["interVLANRouting.accessType"] = "0"
                inputTable_all["interVLANRouting.status"] = "0"
                inputTable_all.insertRpt = "1"
                inputTable_all["vlan.vlanInternal"] = "1"
                L1_3, L2_4 = vlanConfig.vlanConfig(inputTable_all, "-1", "add")
                break
              end
            end
          end
        end
        if L1_3 == "OK" then
          L17_19 = {}
          tab = L17_19
          if L12_14 ~= "1" then
            L17_19 = tab
            L17_19["VlanPortMgmt.DefaultPVID"] = L12_14
          else
            L17_19 = tab
            L17_19["VlanPortMgmt.DefaultPVID"] = L18_20
          end
          L17_19 = tab
          L17_19["VlanPortMgmt.PortVlanMode"] = "0"
          L17_19 = tab
          L17_19.vlanInternal = "1"
          L17_19 = vlanConfig
          L17_19 = L17_19.vlanConfig
          L17_19 = L17_19(L18_20, L19_21, L20_22)
          L2_4 = L18_20
          L1_3 = L17_19
          if L1_3 == "OK" then
            L17_19 = {}
            L17_19["ifStatic.AddressFamily"] = "2"
            L17_19["ifStatic.StaticIp"] = L18_20
            L17_19["ifStatic.NetMask"] = L18_20
            L17_19["ifStatic.Gateway"] = "0.0.0.0"
            L21_23 = "edit"
            L2_4 = L19_21
            L1_3 = L18_20
            if L1_3 == "OK" then
              if L12_14 ~= "1" then
              else
              end
              L21_23 = "'"
              L21_23 = "ifStatic"
              L22_24 = L19_21
              L21_23 = nil
              if L20_22 ~= nil then
                L21_23 = L20_22["ifStatic._ROWID_"]
              end
              L22_24 = {}
              L22_24["ifStatic.LogicalIfName"] = L18_20
              L22_24["ifStatic.AddressFamily"] = "2"
              L23_25 = A0_2["ifStatic.StaticIp"]
              L22_24["ifStatic.StaticIp"] = L23_25
              L23_25 = A0_2["ifStatic.NetMask"]
              L22_24["ifStatic.NetMask"] = L23_25
              L22_24["ifStatic.Gateway"] = "0.0.0.0"
              if L21_23 then
                L23_25 = vlanConfig
                L23_25 = L23_25.ifStaticConfig
                L2_4, L23_25 = L22_24, L23_25(L22_24, L21_23, "edit")
                L1_3 = L23_25
              else
                L23_25 = vlanConfig
                L23_25 = L23_25.ifStaticConfig
                L2_4, L23_25 = L22_24, L23_25(L22_24, "-1", "add")
                L1_3 = L23_25
              end
            end
          end
        end
      end
      if L1_3 == "OK" and L13_15 ~= L14_16 and L13_15 == "6" then
        L17_19 = {}
        tab = L17_19
        L17_19 = tab
        L17_19["VlanPortMgmt.DefaultPVID"] = "1"
        L17_19 = tab
        L17_19["VlanPortMgmt.PortVlanMode"] = "0"
        L17_19 = tab
        L17_19.vlanInternal = "1"
        L17_19 = vlanConfig
        L17_19 = L17_19.vlanConfig
        L17_19 = L17_19(L18_20, L19_21, L20_22)
        L2_4 = L18_20
        L1_3 = L17_19
        if L1_3 == "OK" then
          L17_19 = {}
          L17_19["ifStatic.AddressFamily"] = "2"
          L17_19["ifStatic.StaticIp"] = "172.17.100.254"
          L17_19["ifStatic.NetMask"] = "255.255.255.0"
          L17_19["ifStatic.Gateway"] = "0.0.0.0"
          L21_23 = "edit"
          L2_4 = L19_21
          L1_3 = L18_20
        end
      end
    end
    if L1_3 == "OK" then
      L12_14 = A0_2["NatTable.NATInterfaces"]
      if L12_14 == "1" then
        A0_2["NatTable.NATInterfaces"] = "WAN1"
        A0_2["NatTable.RoutedInterfaces"] = "WAN2"
      else
        L12_14 = A0_2["NatTable.NATInterfaces"]
        if L12_14 == "2" then
          A0_2["NatTable.NATInterfaces"] = "WAN2"
          A0_2["NatTable.RoutedInterfaces"] = "WAN1"
        else
          L12_14 = A0_2["NatTable.NATInterfaces"]
          if L12_14 == "3" then
            A0_2["NatTable.NATInterfaces"] = "WAN1,WAN2"
            A0_2["NatTable.RoutedInterfaces"] = ""
          else
            L12_14 = A0_2["NatTable.NATInterfaces"]
            if L12_14 == "4" then
              A0_2["NatTable.NATInterfaces"] = ""
              A0_2["NatTable.RoutedInterfaces"] = "WAN1,WAN2"
            end
          end
        end
      end
      L12_14 = fwView
      L12_14 = L12_14.nwModeConfig
      L13_15 = A0_2
      L14_16 = "1"
      L15_17 = "edit"
      L13_15 = L12_14(L13_15, L14_16, L15_17)
      L2_4 = L13_15
      L1_3 = L12_14
      if L1_3 == "OK" then
        L12_14 = db
        L12_14 = L12_14.commitTransaction
        L13_15 = true
        L12_14(L13_15)
        L12_14 = db
        L12_14 = L12_14.save
        L12_14()
      end
    end
    if L1_3 ~= "OK" then
      L12_14 = db
      L12_14 = L12_14.rollback
      L12_14()
    end
    L12_14 = db
    L12_14 = L12_14.getAttribute
    L13_15 = "stringsMap"
    L14_16 = "stringId"
    L15_17 = L2_4
    L16_18 = LANGUAGE
    L12_14 = L12_14(L13_15, L14_16, L15_17, L16_18)
    L3_5 = L12_14
    L12_14 = L1_3
    L13_15 = L3_5
    return L12_14, L13_15
  end
end
function natCfgInit(A0_26)
  local L1_27, L2_28, L3_29, L4_30, L5_31, L6_32
  L1_27 = 1
  L2_28 = db
  L2_28 = L2_28.getRow
  L3_29 = "NatTable"
  L4_30 = "_ROWID_"
  L5_31 = L1_27
  L2_28 = L2_28(L3_29, L4_30, L5_31)
  L3_29 = {}
  L4_30 = db
  L4_30 = L4_30.getRowWhere
  L5_31 = "ifStatic"
  L6_32 = "LogicalIfName = 'DMZ'"
  L4_30 = L4_30(L5_31, L6_32)
  L5_31 = L4_30["ifStatic.StaticIp"]
  L3_29["ifStatic.dmzInterfaceIpAddr"] = L5_31
  L5_31 = db
  L5_31 = L5_31.getAttribute
  L6_32 = "NatTable"
  L5_31 = L5_31(L6_32, "_ROWID_", "1", "BridgeVlan")
  bridgeModeVlan = L5_31
  L5_31 = "LAN"
  L6_32 = bridgeModeVlan
  L5_31 = L5_31 .. L6_32
  L6_32 = "LogicalIfName = '"
  L6_32 = L6_32 .. L5_31 .. "'"
  if db.getRowWhere("ifStatic", L6_32) ~= nil then
    L3_29["ifStatic.bridgeVlanIpAddr"] = db.getRowWhere("ifStatic", L6_32)["ifStatic.StaticIp"]
    L3_29["ifStatic.subnetMask"] = db.getRowWhere("ifStatic", L6_32)["ifStatic.NetMask"]
  else
    L3_29["ifStatic.bridgeVlanIpAddr"] = "0.0.0.0"
    L3_29["ifStatic.subnetMask"] = L4_30["ifStatic.NetMask"]
  end
  if L2_28["ifStatic.StaticIp1"] == nil or L2_28["ifStatic.StaticIp1"] == "" then
    L2_28["ifStatic.StaticIp1"] = L3_29["ifStatic.dmzInterfaceIpAddr"]
  end
  if L2_28["ifStatic.StaticIp"] == nil or L2_28["ifStatic.StaticIp"] == "" then
    L2_28["ifStatic.StaticIp"] = L3_29["ifStatic.bridgeVlanIpAddr"]
  end
  if L2_28["ifStatic.subnetMask"] == nil or L2_28["ifStatic.subnetMask"] == "" then
    L2_28["ifStatic.NetMask"] = L3_29["ifStatic.subnetMask"]
  end
  if L2_28 == nil then
    return L1_27, {}
  end
  L1_27 = L2_28["NatTable._ROWID_"]
  return L1_27, L2_28
end
function natCfgVal(A0_33)
  local L1_34, L2_35, L3_36, L4_37, L5_38, L6_39, L7_40, L8_41, L9_42, L10_43, L11_44, L12_45, L13_46
  L1_34 = db
  L1_34 = L1_34.getAttribute
  L2_35 = "ConfigPort"
  L3_36 = "_ROWID_"
  L4_37 = "1"
  L5_38 = "LogicalIfName"
  L1_34 = L1_34(L2_35, L3_36, L4_37, L5_38)
  dmzstatus = L1_34
  L1_34 = A0_33["NatTable.Enable"]
  if L1_34 == "5" then
    L1_34 = dmzstatus
    if L1_34 == "WAN2" then
      L1_34 = printCLIError
      L2_35 = "Configurable Port is set to  WAN2, So we can't configure routing as Transparent mode\n"
      L1_34(L2_35)
      L1_34 = false
      return L1_34
    end
  end
  L1_34 = A0_33["NatTable.Enable"]
  if L1_34 == "5" then
    L1_34 = dmzstatus
    if L1_34 == "DMZ" then
      L1_34 = printCLIError
      L2_35 = "Configured WAN is in DMZ Mode, So we can't configure routing as Transparent mode\n"
      L1_34(L2_35)
      L1_34 = false
      return L1_34
    end
  end
  L1_34 = A0_33["NatTable.Enable"]
  if L1_34 == "6" then
    L1_34 = dmzstatus
    if L1_34 ~= "DMZ" then
      L1_34 = printCLIError
      L2_35 = "Configure WAN in DMZ Mode to Enable routing as BRIDGE mode"
      L1_34(L2_35)
      L1_34 = false
      return L1_34
    end
    L1_34 = iprouteLuaLib
    L1_34 = L1_34.ipSubnetCheck
    L2_35 = A0_33["ifStatic.StaticIp1"]
    L3_36 = A0_33["ifStatic.StaticIp"]
    L4_37 = A0_33["ifStatic.NetMask"]
    L1_34 = L1_34(L2_35, L3_36, L4_37)
    if not L1_34 then
      L1_34 = printCLIError
      L2_35 = "Please give Ip  in the same subnet of Bridge"
      L1_34(L2_35)
      L1_34 = false
      return L1_34
    end
    L1_34 = A0_33["NatTable.NATInterfaces"]
    if L1_34 ~= "2" then
      L1_34 = A0_33["NatTable.NATInterfaces"]
      if L1_34 ~= "3" then
        L1_34 = A0_33["NatTable.NATInterfaces"]
      end
    elseif L1_34 == "4" then
      L1_34 = printCLIError
      L2_35 = "WAN2 cannot be changed into NAT in BRIDGE Mode"
      L1_34(L2_35)
      L1_34 = false
      return L1_34
    end
    L1_34 = 0
    L2_35 = db
    L2_35 = L2_35.getAttribute
    L3_36 = "NatTable"
    L4_37 = "_ROWID_"
    L5_38 = "1"
    L2_35 = L2_35(L3_36, L4_37, L5_38, L6_39)
    L3_36 = "LAN"
    L4_37 = L2_35
    L3_36 = L3_36 .. L4_37
    L4_37 = "ifType = 'bridge'"
    L5_38 = db
    L5_38 = L5_38.getRowsWhere
    L5_38 = L5_38(L6_39, L7_40)
    for L9_42, L10_43 in L6_39(L7_40) do
      L11_44 = "'"
      L12_45 = L10_43["networkInterface.LogicalIfName"]
      L13_46 = "'"
      L11_44 = L11_44 .. L12_45 .. L13_46
      L12_45 = "LogicalIfName = "
      L13_46 = L11_44
      L4_37 = L12_45 .. L13_46 .. " and AddressFamily=2"
      L12_45 = db
      L12_45 = L12_45.getRowWhere
      L13_46 = "ifStatic"
      L12_45 = L12_45(L13_46, L4_37)
      L1_34 = L1_34 + 1
      L13_46 = L12_45["ifStatic.StaticIp"]
      if iprouteLuaLib.ipSubnetCheck(A0_33["ifStatic.StaticIp"], L13_46, A0_33["ifStatic.NetMask"]) and L12_45["ifStatic.LogicalIfName"] ~= L3_36 then
        printCLIError("LAN/VLAN is configured in the same subnet. Please configure different IP.")
        return false
      end
    end
  end
end
