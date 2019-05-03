local L0_0
L0_0 = require
L0_0("teamf1lualib/nimfView")
L0_0 = require
L0_0("teamf1lualib/ipv6_option1Settings_bl")
L0_0 = require
L0_0("teamf1lualib/ipv6_option2Settings_bl")
L0_0 = require
L0_0("teamf1lualib/errorMap")
L0_0 = require
L0_0 = L0_0("com.teamf1.bl.ipv6.wan.option1")
function wanV6SetupGet(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10
  L1_2 = {}
  L2_3 = "AddressFamily = 10 and LogicalIfName = '"
  L3_4 = A0_1
  L4_5 = "'"
  L2_3 = L2_3 .. L3_4 .. L4_5
  L3_4 = db
  L3_4 = L3_4.getRowWhere
  L4_5 = "NimfConf"
  L5_6 = L2_3
  L3_4 = L3_4(L4_5, L5_6)
  L4_5 = "AddressFamily = 2 and LogicalIfName = '"
  L5_6 = A0_1
  L6_7 = "'"
  L4_5 = L4_5 .. L5_6 .. L6_7
  L5_6 = db
  L5_6 = L5_6.getRowWhere
  L6_7 = "NimfConf"
  L7_8 = L4_5
  L5_6 = L5_6(L6_7, L7_8)
  L6_7, L7_8, L8_9, L9_10 = nil, nil, nil, nil
  if L5_6["NimfConf.ConnectionType"] == "threeg" then
    printCLIError("Note : No IPv6 information as WAN2 is configured as threeG.")
    return true
  end
  if ipModeCfgInputVal() then
    if L3_4["NimfConf.ConnectionType6"] == "ifStatic6" then
      resTab.insertField(L1_2, "IPv6 Connection Type", "Static IPv6")
      resTab.insertField(L1_2, "Static IPv6 Configuration", "")
      setupRow = db.getRowWhere("ifStatic", "LogicalIfName='" .. A0_1 .. "' and AddressFamily=10")
      resTab.insertField(L1_2, "IPv6 Address", setupRow["ifStatic.StaticIp"] or "")
      resTab.insertField(L1_2, "IPv6 Prefix Length", setupRow["ifStatic.PrefixLength"] or "")
      resTab.insertField(L1_2, "Default IPv6 Gateway", setupRow["ifStatic.Gateway"] or "")
      resTab.insertField(L1_2, "Primary DNS Server", setupRow["ifStatic.PrimaryDns"] or "")
      resTab.insertField(L1_2, "Secondary DNS Server", setupRow["ifStatic.SecondaryDns"] or "")
    end
    if L3_4["NimfConf.ConnectionType6"] == "pppoe6" then
      resTab.insertField(L1_2, "IPv6 Connection Type", "PPPoE over IPv6")
      setupRow = db.getRowWhere("pppoe6", "LogicalIfName='" .. A0_1 .. "'")
      if tonumber(setupRow["pppoe6.PppoeSessions"]) == 1 then
        L6_7 = "Separate Session for IPv6"
        L7_8 = setupRow["pppoe6.UserName"]
        L8_9 = setupRow["pppoe6.Password"]
      elseif tonumber(setupRow["pppoe6.PppoeSessions"]) == 2 then
        L6_7 = "Common Session for IPv4 and IPv6"
        commonSetupRow = db.getRowWhere("PppoeProfile", "LogicalIfName='" .. A0_1 .. "' AND ProfileName='pppoeProfile1'")
        L7_8 = commonSetupRow["PppoeProfile.UserName"]
        L8_9 = commonSetupRow["PppoeProfile.Password"]
      end
      resTab.insertField(L1_2, "PppoeSessions", L6_7 or "")
      resTab.insertField(L1_2, "UserName", L7_8 or "")
      L9_10 = string.gsub(L8_9, ".", "*")
      resTab.insertField(L1_2, "Password", L9_10 or "")
      if setupRow["pppoe6.AuthOpt"] == "1" then
        resTab.insertField(L1_2, "Authentication Type", "Auto-negotiate")
      elseif setupRow["pppoe6.AuthOpt"] == "2" then
        resTab.insertField(L1_2, "Authentication Type", "PAP")
      elseif setupRow["pppoe6.AuthOpt"] == "3" then
        resTab.insertField(L1_2, "Authentication Type", "CHAP")
      elseif setupRow["pppoe6.AuthOpt"] == "4" then
        resTab.insertField(L1_2, "Authentication Type", "MS-CHAP")
      elseif setupRow["pppoe6.AuthOpt"] == "5" then
        resTab.insertField(L1_2, "Authentication Type", "MS-CHAPv2")
      else
        restab.insertField(L1_2, "Authentication Type", "Unknown")
      end
      if setupRow["pppoe6.Dhcpv6Opt"] == "0" then
        resTab.insertField(L1_2, "Dhcpv6 Options", "disable dhcpv6")
      elseif setupRow["pppoe6.Dhcpv6Opt"] == "1" then
        resTab.insertField(L1_2, "Dhcpv6 Options", "stateless dhcpv6")
      elseif setupRow["pppoe6.Dhcpv6Opt"] == "2" then
        resTab.insertField(L1_2, "Dhcpv6 Options", "statefull dhcpv6")
      elseif setupRow["pppoe6.Dhcpv6Opt"] == "3" then
        resTab.insertField(L1_2, "Dhcpv6 Options", "stateless dhcpv6 with Prefix delegation")
      else
        resTab.insertField(L1_2, "Dhcpv6 Options", "Unknown")
      end
      resTab.insertField(L1_2, "Primary DNS Server", setupRow["pppoe6.PrimaryDns"] or "")
      resTab.insertField(L1_2, "Secondary DNS Server", setupRow["pppoe6.SecondaryDns"] or "")
    end
    if L3_4["NimfConf.ConnectionType6"] == "dhcp6c" then
      resTab.insertField(L1_2, "IPv6 Connection Type", "Dynamic IPv6 (DHCP)")
      resTab.insertField(L1_2, "Dynamic IPv6 (DHCP) Configuration", "")
      setupRow = db.getRowWhere("dhcpv6c", "LogicalIfName='" .. A0_1 .. "'")
      if setupRow["dhcpv6c.statelessMode"] == "1" then
        resTab.insertField(L1_2, "Stateless Address Auto Configuration", "Enabled")
      elseif setupRow["dhcpv6c.statelessMode"] == "0" then
        resTab.insertField(L1_2, "Stateful Address Auto Configuration", "Enabled")
      end
    end
    printLabel("IPv6 " .. A0_1 .. " Setup")
    resTab.print(L1_2, 0)
  end
end
function wanV6StatusGet(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20, L10_21, L11_22, L12_23, L13_24, L14_25, L15_26, L16_27
  L1_12 = {}
  L2_13 = ""
  L3_14 = "AddressFamily = 10 and LogicalIfName = '"
  L4_15 = A0_11
  L5_16 = "'"
  L3_14 = L3_14 .. L4_15 .. L5_16
  L4_15 = db
  L4_15 = L4_15.getRowWhere
  L5_16 = "NimfConf"
  L6_17 = L3_14
  L4_15 = L4_15(L5_16, L6_17)
  L5_16 = "AddressFamily = 2 and LogicalIfName = '"
  L6_17 = A0_11
  L7_18 = "'"
  L5_16 = L5_16 .. L6_17 .. L7_18
  L6_17 = db
  L6_17 = L6_17.getRowWhere
  L7_18 = "NimfConf"
  L8_19 = L5_16
  L6_17 = L6_17(L7_18, L8_19)
  L7_18 = L6_17["NimfConf.ConnectionType"]
  if L7_18 == "threeg" then
    L7_18 = printCLIError
    L8_19 = "Note : No IPv6 information as WAN2 is configured as threeG."
    L7_18(L8_19)
    L7_18 = true
    return L7_18
  end
  L7_18 = ipModeCfgInputVal
  L7_18 = L7_18()
  if L7_18 then
    L7_18 = L4_15["NimfConf.ConnectionType6"]
    if L7_18 == "ifStatic6" then
      L2_13 = "Static IPv6"
    else
      L7_18 = L4_15["NimfConf.ConnectionType6"]
      if L7_18 == "dhcp6c" then
        L2_13 = "Dynamic IPv6 (DHCP)"
      else
        L7_18 = L4_15["NimfConf.ConnectionType6"]
        if L7_18 == "pppoe6" then
          L2_13 = "PPPoE over IPv6"
        end
      end
    end
    L7_18 = "/pfrm2.0/bin/nimfStatus"
    L8_19 = "/tmp/system.db"
    if L7_18 ~= nil then
      L9_20 = util
      L9_20 = L9_20.appendDebugOut
      L10_21 = "Exec = "
      L11_22 = os
      L11_22 = L11_22.execute
      L15_26 = " WAN1 2"
      L11_22 = L11_22(L12_23)
      L10_21 = L10_21 .. L11_22
      L9_20(L10_21)
      L9_20 = util
      L9_20 = L9_20.appendDebugOut
      L10_21 = "Exec = "
      L11_22 = os
      L11_22 = L11_22.execute
      L15_26 = " WAN1 10"
      L11_22 = L11_22(L12_23)
      L10_21 = L10_21 .. L11_22
      L9_20(L10_21)
      L9_20 = util
      L9_20 = L9_20.appendDebugOut
      L10_21 = "Exec = "
      L11_22 = os
      L11_22 = L11_22.execute
      L15_26 = " WAN2 2"
      L11_22 = L11_22(L12_23)
      L10_21 = L10_21 .. L11_22
      L9_20(L10_21)
      L9_20 = util
      L9_20 = L9_20.appendDebugOut
      L10_21 = "Exec = "
      L11_22 = os
      L11_22 = L11_22.execute
      L15_26 = " WAN2 10"
      L11_22 = L11_22(L12_23)
      L10_21 = L10_21 .. L11_22
      L9_20(L10_21)
      L9_20 = util
      L9_20 = L9_20.appendDebugOut
      L10_21 = "Exec = "
      L11_22 = os
      L11_22 = L11_22.execute
      L15_26 = " WAN3 2"
      L11_22 = L11_22(L12_23)
      L10_21 = L10_21 .. L11_22
      L9_20(L10_21)
      L9_20 = util
      L9_20 = L9_20.appendDebugOut
      L10_21 = "Exec = "
      L11_22 = os
      L11_22 = L11_22.execute
      L15_26 = " WAN3 10"
      L11_22 = L11_22(L12_23)
      L10_21 = L10_21 .. L11_22
      L9_20(L10_21)
    end
    L9_20 = ipMode
    L10_21 = IPV6_MODE
    if L9_20 == L10_21 then
      L7_18 = "/pfrm2.0/bin/iprouteIPv6GwAdd"
      if L7_18 ~= nil then
        L9_20 = util
        L9_20 = L9_20.appendDebugOut
        L10_21 = "Exec = "
        L11_22 = os
        L11_22 = L11_22.execute
        L11_22 = L11_22(L12_23)
        L10_21 = L10_21 .. L11_22
        L9_20(L10_21)
      end
    end
    L9_20 = db
    L9_20 = L9_20.getRowWhere
    L10_21 = "NimfStatus"
    L11_22 = "LogicalIfName = '"
    L11_22 = L11_22 .. L12_23 .. L13_24
    L9_20 = L9_20(L10_21, L11_22)
    stat6Row = L9_20
    L9_20 = resTab
    L9_20 = L9_20.insertField
    L10_21 = L1_12
    L11_22 = "IPv6 Connection Type"
    L9_20(L10_21, L11_22, L12_23)
    L9_20 = resTab
    L9_20 = L9_20.insertField
    L10_21 = L1_12
    L11_22 = "IPv6 Connection State"
    L9_20(L10_21, L11_22, L12_23)
    L9_20 = 0
    L10_21 = ""
    L11_22 = nil
    if L2_13 == "PPPoE over IPv6" then
      L15_26 = A0_11
      L16_27 = "PPPOE6' and AddressFamily = 10"
      L11_22 = L12_23
    else
      L15_26 = A0_11
      L16_27 = "' and AddressFamily = 10"
      L11_22 = L12_23
    end
    for L15_26, L16_27 in L12_23(L13_24) do
      L9_20 = L9_20 + 1
      if L11_22[L9_20]["ipAddressTable.ipAddress"] ~= nil and L11_22[L9_20]["ipAddressTable.ipAddress"] ~= "" then
        L10_21 = L10_21 .. L11_22[L9_20]["ipAddressTable.ipAddress"] .. "/" .. L11_22[L9_20]["ipAddressTable.ipv6PrefixLen"]
      end
      if L9_20 ~= #L11_22 and 1 == 1 then
        L10_21 = L10_21 .. ", "
      end
    end
    if L13_24 ~= "ifStatic6" then
    else
      if L13_24 == "dhcp6c" then
        L15_26 = "LogicalIfName = '"
        L16_27 = A0_11
        L15_26 = L15_26 .. L16_27 .. "' and addressFamily = '10' and ipv6PrefixLen != ''"
    end
    elseif L13_24 == "pppoe6" then
      L15_26 = "LogicalIfName = '"
      L16_27 = A0_11
      L15_26 = L15_26 .. L16_27 .. "PPPOE6' and addressFamily = '10' and ipv6PrefixLen != ''"
    end
    L15_26 = "IPv6 Address/Prefix"
    L16_27 = L10_21 or ""
    L13_24(L14_25, L15_26, L16_27)
    if L13_24 == "pppoe6" then
      L15_26 = "LogicalIfName='"
      L16_27 = A0_11
      L15_26 = L15_26 .. L16_27 .. "' and addressFamily=10"
      stat6Row = L13_24
      if L13_24 == nil or L13_24 == "" then
        L15_26, L16_27 = nil, nil
        L16_27 = "LogicalIfName = '" .. A0_11 .. "'"
        if tonumber(L14_25) == 2 then
          file = io.open("/tmp/pppoe6CommonSessionGW" .. "." .. A0_11, "r")
          if file then
            L15_26 = file:read("*all") or ""
            file:close()
          end
        end
      end
      L15_26 = L1_12
      L16_27 = "Default IPv6 Gateway"
      L14_25(L15_26, L16_27, L13_24 or "")
    else
      L15_26 = "LogicalIfName='"
      L16_27 = A0_11
      L15_26 = L15_26 .. L16_27 .. "' and addressFamily=10"
      stat6Row = L13_24
      if L13_24 ~= nil then
        L15_26 = "Default IPv6 Gateway"
        L16_27 = stat6Row
        L16_27 = L16_27["defaultRouters.nextHopGateway"]
        L16_27 = L16_27 or ""
        L13_24(L14_25, L15_26, L16_27)
      end
    end
    L15_26 = "LogicalIfName='"
    L16_27 = A0_11
    L15_26 = L15_26 .. L16_27 .. "' and addressFamily=10"
    stat6Row = L13_24
    if L13_24 ~= nil then
      L15_26 = "Primary DNS Server"
      L16_27 = stat6Row
      L16_27 = L16_27["resolverConfig.nameserver1"]
      L16_27 = L16_27 or ""
      L13_24(L14_25, L15_26, L16_27)
      L15_26 = "Secondary DNS Server"
      L16_27 = stat6Row
      L16_27 = L16_27["resolverConfig.nameserver2"]
      L16_27 = L16_27 or ""
      L13_24(L14_25, L15_26, L16_27)
    end
    L15_26 = A0_11
    L16_27 = " Status"
    L13_24(L14_25)
    L15_26 = 0
    L13_24(L14_25, L15_26)
  end
end
function nimf6CfgSave(A0_28)
  local L1_29, L2_30, L3_31, L4_32, L5_33, L6_34, L7_35, L8_36, L9_37, L10_38
  L1_29 = "ERROR"
  L2_30 = ""
  L3_31 = ""
  L4_32 = tonumber
  L5_33 = A0_28["Pppoe6.PppoeSessions"]
  L4_32 = L4_32(L5_33)
  if L4_32 == 2 then
    L4_32 = "LogicalIfName = 'WAN1' AND ProfileName='pppoeProfile1'"
    L5_33 = db
    L5_33 = L5_33.getRowWhere
    L6_34 = "PppoeProfile"
    L7_35 = L4_32
    L5_33 = L5_33(L6_34, L7_35)
    L6_34 = L5_33["PppoeProfile.UserName"]
    A0_28["Pppoe6.UserName"] = L6_34
    L6_34 = L5_33["PppoeProfile.Password"]
    A0_28["Pppoe6.Password"] = L6_34
    L6_34 = "LogicalIfName = 'WAN1' AND AddressFamily='2'"
    L7_35 = ""
    L8_36 = db
    L8_36 = L8_36.getRowWhere
    L9_37 = "NimfConf"
    L10_38 = L6_34
    L8_36 = L8_36(L9_37, L10_38)
    L9_37 = returnCodes
    L9_37 = L9_37.NIL
    if L8_36 == L9_37 then
      L9_37 = false
      return L9_37
    end
    L7_35 = L8_36["NimfConf.ConnectionType"]
    if L7_35 ~= "pppoe" then
      L9_37 = printCLIError
      L10_38 = "Please configure IPv4 ISP type as PPPOE"
      L9_37(L10_38)
      L9_37 = false
      return L9_37
    end
    L9_37 = nil
    L10_38 = "LogicalIfName = 'WAN1' AND ProfileName='pppoeProfile1'"
    L9_37 = db.getAttributeWhere("PppoeProfile", L10_38, "IdleTimeOutFlag")
    if tonumber(L9_37) ~= 0 then
      printCLIError("Please disable the Idle time out configured in Ipv4 PPPOE")
      return false
    end
    if A0_28["NimfConf.ConnectionType6"] == "pppoe6" then
      A0_28["NimfConf.ConnectionType6"] = "3"
    end
    A0_28["NimfConf.LogicalIfName"] = "WAN1"
    A0_28["option1Settings.conType"] = A0_28["NimfConf.ConnectionType6"]
    A0_28["option1Settings.userName"] = A0_28["Pppoe6.UserName"]
    A0_28["option1Settings.password"] = A0_28["Pppoe6.Password"]
    A0_28["option1Settings.primaryDns"] = A0_28["Pppoe6.PrimaryDns"]
    A0_28["option1Settings.secondaryDns"] = A0_28["Pppoe6.SecondaryDns"]
    A0_28["option1Settings.authenticationOptions"] = A0_28["Pppoe6.AuthOpt"]
    A0_28["option1Settings.dhcpOptions"] = A0_28["Pppoe6.Dhcpv6Opt"]
    A0_28["option1Settings.pppoeSessions"] = A0_28["Pppoe6.PppoeSessions"]
    A0_28["option1Settings.wanPort"] = A0_28["NimfConf.LogicalIfName"]
    L1_29 = _UPVALUE0_.option1SectionSet(A0_28)
    L3_31 = _UPVALUE1_.errorStringGet(L1_29)
    if L1_29 == 0 then
      L1_29 = "OK"
    else
      L1_29 = "ERROR"
    end
  else
    A0_28["NimfConf.LogicalIfName"] = "WAN1"
    L4_32 = nimfView
    L4_32 = L4_32.ipv6WanConfig
    L5_33 = A0_28
    L6_34 = "1"
    L7_35 = "edit"
    L5_33 = L4_32(L5_33, L6_34, L7_35)
    L2_30 = L5_33
    L1_29 = L4_32
    L4_32 = db
    L4_32 = L4_32.getAttribute
    L5_33 = "stringsMap"
    L6_34 = "stringId"
    L7_35 = L2_30
    L8_36 = LANGUAGE
    L4_32 = L4_32(L5_33, L6_34, L7_35, L8_36)
    L3_31 = L4_32
  end
  if L1_29 == "OK" then
    L4_32 = db
    L4_32 = L4_32.save
    L4_32()
  end
  L4_32 = L1_29
  L5_33 = L3_31
  return L4_32, L5_33
end
function nimf6CfgInit(A0_39)
  local L1_40, L2_41
  L1_40 = {}
  L2_41 = -1
  L1_40 = nimfView.ipv6WanConfigGet("WAN1")
  return L1_40["NimfConf._ROWID_"], L1_40
end
function ipModeCfgInputVal(A0_42)
  if db.getRow("networkInfo", "_ROWID_", "1")["networkInfo.netWorkMode"] == "1" then
    printCLIError("Please Set IP Mode to IPv4/IPv6 to configure IPv6 WAN Configurations.")
    return false
  end
  return true
end
function nimf6CfgInputVal(A0_43)
  local L1_44, L2_45
  L1_44 = db
  L1_44 = L1_44.getRow
  L2_45 = "networkInfo"
  L1_44 = L1_44(L2_45, "_ROWID_", "1")
  L2_45 = L1_44["networkInfo.netWorkMode"]
  if L2_45 == "1" then
    L2_45 = printCLIError
    L2_45("Please Set IP Mode to IPv4/IPv6 to configure IPv6 WAN Configurations.")
    L2_45 = false
    return L2_45
  end
  L2_45 = A0_43["NimfConf.ConnectionType6"]
  if L2_45 == "ifStatic6" then
    L2_45 = A0_43["ifStatic.StaticIp"]
    if L2_45 ~= "" then
      L2_45 = A0_43["ifStatic.StaticIp"]
    else
      if L2_45 == nil then
        L2_45 = printCLIError
        L2_45("Enter valid static ipv6 address")
        L2_45 = false
        return L2_45
    end
    else
      L2_45 = nil
      a, b, c = validations.ipv6AddrValidate(A0_43["ifStatic.StaticIp"], "", "")
      if b ~= "OK" then
        L2_45 = db.getAttribute("stringsMap", "stringId", b, "en_US")
        print(L2_45 .. " for WAN.")
        return false
      end
      L2_45 = validations.ipv6LoopBackCheck(A0_43["ifStatic.StaticIp"])
      if L2_45 ~= "OK" then
        printCLIError(L2_45 .. " for WAN.")
        return false
      end
    end
    L2_45 = A0_43["ifStatic.PrefixLength"]
    if L2_45 ~= "" then
      L2_45 = A0_43["ifStatic.PrefixLength"]
    elseif L2_45 == nil then
      L2_45 = printCLIError
      L2_45("Enter valid prefix length")
      L2_45 = false
      return L2_45
    end
    L2_45 = A0_43["ifStatic.Gateway"]
    if L2_45 ~= "" then
      L2_45 = A0_43["ifStatic.Gateway"]
    else
      if L2_45 == nil then
        L2_45 = printCLIError
        L2_45("Enter valid gateway ipv6 address")
        L2_45 = false
        return L2_45
    end
    else
      L2_45 = nil
      a, b, c = validations.ipv6AddrValidate(A0_43["ifStatic.Gateway"], "", "")
      if b ~= "OK" then
        L2_45 = db.getAttribute("stringsMap", "stringId", b, "en_US")
        print(L2_45 .. " for WAN Gateway.")
        return false
      end
      L2_45 = validations.ipv6LoopBackCheck(A0_43["ifStatic.Gateway"])
      if L2_45 ~= "OK" then
        printCLIError(L2_45 .. " for WAN Gateway")
        return false
      end
    end
    L2_45 = A0_43["ifStatic.PrimaryDns"]
    if L2_45 ~= "" then
      L2_45 = A0_43["ifStatic.PrimaryDns"]
    else
      if L2_45 == nil then
        L2_45 = printCLIError
        L2_45("Enter valid primary ipv6 dns\n")
        L2_45 = false
        return L2_45
    end
    else
      L2_45 = nil
      a, b, c = validations.ipv6AddrValidate(A0_43["ifStatic.PrimaryDns"], "", "")
      if b ~= "OK" then
        L2_45 = db.getAttribute("stringsMap", "stringId", b, "en_US")
        print(L2_45 .. " for WAN Primary Dns")
        return false
      end
      L2_45 = validations.ipv6LoopBackCheck(A0_43["ifStatic.PrimaryDns"])
      if L2_45 ~= "OK" then
        printCLIError(L2_45 .. " for WAN Primary Dns")
        return false
      end
    end
    L2_45 = A0_43["ifStatic.SecondaryDns"]
    if L2_45 ~= "" then
      L2_45 = A0_43["ifStatic.SecondaryDns"]
    else
      if L2_45 == nil then
        L2_45 = printCLIError
        L2_45("Enter valid secondary ipv6 dns")
        L2_45 = false
        return L2_45
    end
    else
      L2_45 = nil
      a, b, c = validations.ipv6AddrValidate(A0_43["ifStatic.SecondaryDns"], "", "")
      if b ~= "OK" then
        L2_45 = db.getAttribute("stringsMap", "stringId", b, "en_US")
        print(L2_45 .. " for WAN Secondary Dns.")
        return false
      end
      L2_45 = validations.ipv6LoopBackCheck(A0_43["ifStatic.SecondaryDns"])
      if L2_45 ~= "OK" then
        printCLIError(L2_45 .. " for WAN Secondary Dns")
        return false
      end
    end
  else
    L2_45 = A0_43["NimfConf.ConnectionType6"]
    if L2_45 == "dhcp6c" then
      L2_45 = A0_43["dhcpv6c.statelessMode"]
      if L2_45 ~= "" then
        L2_45 = A0_43["dhcpv6c.statelessMode"]
      elseif L2_45 == nil then
        L2_45 = printCLIError
        L2_45("Enter valid Configuration Mode for ipv6 Dhcp")
        L2_45 = false
        return L2_45
      end
      L2_45 = A0_43["dhcpv6c.prefixDelegation"]
      if L2_45 == "1" then
        L2_45 = A0_43["dhcpv6c.statelessMode"]
        if L2_45 == "0" then
          L2_45 = printCLIError
          L2_45("Prefix Delegation cannot be enabled in stateful mode")
          L2_45 = false
          return L2_45
        end
      end
    else
      L2_45 = A0_43["NimfConf.ConnectionType6"]
      if L2_45 == "pppoe6" then
        L2_45 = A0_43["Pppoe6.PppoeSessions"]
        if L2_45 ~= nil then
          L2_45 = A0_43["Pppoe6.PppoeSessions"]
        elseif L2_45 == "" then
          L2_45 = printCLIError
          L2_45("Enter Valid Session for PPPOE\n")
          L2_45 = false
          return L2_45
        end
        L2_45 = A0_43["Pppoe6.PppoeSessions"]
        if L2_45 == 1 then
          L2_45 = A0_43["Pppoe6.UserName"]
          if L2_45 ~= nil then
            L2_45 = A0_43["Pppoe6.UserName"]
          elseif L2_45 == "" then
            L2_45 = printCLIError
            L2_45("Enter Valid User Name for PPPOE\n")
            L2_45 = false
            return L2_45
          end
          L2_45 = A0_43["Pppoe6.Password"]
          if L2_45 ~= nil then
            L2_45 = A0_43["Pppoe6.Password"]
          elseif L2_45 == "" then
            L2_45 = printCLIError
            L2_45("Enter Valid Password for PPPOE\n")
            L2_45 = false
            return L2_45
          end
        end
        L2_45 = A0_43["Pppoe6.Dhcpv6Opt"]
        if L2_45 == "0" then
          L2_45 = A0_43["Pppoe6.PrimaryDns"]
          if L2_45 ~= "" then
            L2_45 = A0_43["Pppoe6.PrimaryDns"]
          else
            if L2_45 == nil then
              L2_45 = printCLIError
              L2_45("Enter valid primary dns address for PPPOE\n")
              L2_45 = false
              return L2_45
          end
          else
            L2_45 = nil
            a, b, c = validations.ipv6AddrValidate(A0_43["Pppoe6.PrimaryDns"], "", "")
            if b ~= "OK" then
              L2_45 = db.getAttribute("stringsMap", "stringId", b, "en_US")
              print(L2_45 .. " for Pppoe6 Primary Dns.")
              return false
            end
            L2_45 = validations.ipv6LoopBackCheck(A0_43["Pppoe6.PrimaryDns"])
            if L2_45 ~= "OK" then
              printCLIError(L2_45 .. " for Pppoe6 Primary Dns.")
              return false
            end
          end
          L2_45 = A0_43["Pppoe6.SecondaryDns"]
          if L2_45 ~= "" then
            L2_45 = A0_43["Pppoe6.SecondaryDns"]
          else
            if L2_45 == nil then
              L2_45 = printCLIError
              L2_45("Enter valid secondary dns address for PPPOE\n")
              L2_45 = false
              return L2_45
          end
          else
            L2_45 = nil
            a, b, c = validations.ipv6AddrValidate(A0_43["Pppoe6.SecondaryDns"], "", "")
            if b ~= "OK" then
              L2_45 = db.getAttribute("stringsMap", "stringId", b, "en_US")
              print(L2_45 .. " for Pppoe6 Secondary Dns.")
              return false
            end
            L2_45 = validations.ipv6LoopBackCheck(A0_43["Pppoe6.SecondaryDns"])
            if L2_45 ~= "OK" then
              printCLIError(L2_45 .. " for Pppoe6 Secondary Dns.")
              return false
            end
          end
        end
      end
    end
  end
  L2_45 = true
  return L2_45
end
function nimf6Wan2CfgSave(A0_46)
  local L1_47, L2_48, L3_49, L4_50, L5_51, L6_52, L7_53, L8_54, L9_55, L10_56
  L1_47 = "ERROR"
  L2_48 = ""
  L3_49 = ""
  L4_50 = tonumber
  L5_51 = A0_46["Pppoe6.PppoeSessions"]
  L4_50 = L4_50(L5_51)
  if L4_50 == 2 then
    L4_50 = "LogicalIfName = 'WAN2' AND ProfileName='pppoeProfile1'"
    L5_51 = db
    L5_51 = L5_51.getRowWhere
    L6_52 = "PppoeProfile"
    L7_53 = L4_50
    L5_51 = L5_51(L6_52, L7_53)
    L6_52 = L5_51["PppoeProfile.UserName"]
    A0_46["Pppoe6.UserName"] = L6_52
    L6_52 = L5_51["PppoeProfile.Password"]
    A0_46["Pppoe6.Password"] = L6_52
    L6_52 = "LogicalIfName = 'WAN2' AND AddressFamily='2'"
    L7_53 = ""
    L8_54 = db
    L8_54 = L8_54.getRowWhere
    L9_55 = "NimfConf"
    L10_56 = L6_52
    L8_54 = L8_54(L9_55, L10_56)
    L9_55 = returnCodes
    L9_55 = L9_55.NIL
    if L8_54 == L9_55 then
      L9_55 = false
      return L9_55
    end
    L7_53 = L8_54["NimfConf.ConnectionType"]
    if L7_53 ~= "pppoe" then
      L9_55 = printCLIError
      L10_56 = "Please configure IPv4 ISP type as PPPOE"
      L9_55(L10_56)
      L9_55 = false
      return L9_55
    end
    L9_55 = nil
    L10_56 = "LogicalIfName = 'WAN2' AND ProfileName='pppoeProfile1'"
    L9_55 = db.getAttributeWhere("PppoeProfile", L10_56, "IdleTimeOutFlag")
    if tonumber(L9_55) ~= 0 then
      printCLIError("Please disable the Idle time out configured in Ipv4 PPPOE")
      return false
    end
    if A0_46["NimfConf.ConnectionType6"] == "pppoe6" then
      A0_46["NimfConf.ConnectionType6"] = "3"
    end
    A0_46["NimfConf.LogicalIfName"] = "WAN2"
    A0_46["option2Settings.conType"] = A0_46["NimfConf.ConnectionType6"]
    A0_46["option2Settings.userName"] = A0_46["Pppoe6.UserName"]
    A0_46["option2Settings.password"] = A0_46["Pppoe6.Password"]
    A0_46["option2Settings.primaryDns"] = A0_46["Pppoe6.PrimaryDns"]
    A0_46["option2Settings.secondaryDns"] = A0_46["Pppoe6.SecondaryDns"]
    A0_46["option2Settings.authenticationOptions"] = A0_46["Pppoe6.AuthOpt"]
    A0_46["option2Settings.dhcpOptions"] = A0_46["Pppoe6.Dhcpv6Opt"]
    A0_46["option2Settings.pppoeSessions"] = A0_46["Pppoe6.PppoeSessions"]
    A0_46["option2Settings.wanPort"] = A0_46["NimfConf.LogicalIfName"]
    L1_47 = _UPVALUE0_.option2SectionSet(A0_46)
    L3_49 = _UPVALUE1_.errorStringGet(L1_47)
    if L1_47 == 0 then
      L1_47 = "OK"
    else
      L1_47 = "ERROR"
    end
  else
    A0_46["NimfConf.LogicalIfName"] = "WAN2"
    L4_50 = nimfView
    L4_50 = L4_50.ipv6WanConfig
    L5_51 = A0_46
    L6_52 = "1"
    L7_53 = "edit"
    L5_51 = L4_50(L5_51, L6_52, L7_53)
    L2_48 = L5_51
    L1_47 = L4_50
    L4_50 = db
    L4_50 = L4_50.getAttribute
    L5_51 = "stringsMap"
    L6_52 = "stringId"
    L7_53 = L2_48
    L8_54 = LANGUAGE
    L4_50 = L4_50(L5_51, L6_52, L7_53, L8_54)
    L3_49 = L4_50
  end
  if L1_47 == "OK" then
    L4_50 = db
    L4_50 = L4_50.save
    L4_50()
  end
  L4_50 = L1_47
  L5_51 = L3_49
  return L4_50, L5_51
end
function nimf6Wan2CfgInit(A0_57)
  local L1_58, L2_59
  L1_58 = {}
  L2_59 = -1
  L1_58 = nimfView.ipv6WanConfigGet("WAN2")
  return L1_58["NimfConf._ROWID_"], L1_58
end
