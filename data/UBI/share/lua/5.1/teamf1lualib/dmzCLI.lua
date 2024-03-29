local L0_0
L0_0 = require
L0_0("teamf1lualib/lan")
L0_0 = require
L0_0("teamf1lualib/dhcp")
L0_0 = require
L0_0("teamf1lualib/nimfView")
L0_0 = require
L0_0("teamf1lualib/vlanConfig")
L0_0 = require
L0_0("validationsLuaLib")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/validations_cli")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("validationsLuaLib")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.validations")
function dmzCfgInit()
  local L0_1, L1_2
  L0_1 = "LogicalIfName = 'DMZ' AND AddressFamily = 2"
  L1_2 = db
  L1_2 = L1_2.existsRowWhere
  L1_2 = L1_2("ifStatic", L0_1)
  configRow = db.getRow("ifStatic", "_ROWID_", L1_2)
  if db.getRow("dhcp", "logicalIfName", "DMZ") ~= nil then
    configRow["dhcp.dhcpEnabled"] = db.getRow("dhcp", "logicalIfName", "DMZ")["dhcp.dhcpEnabled"]
    if configRow["dhcp.dhcpEnabled"] ~= 0 then
      configRow["dhcp.startAddress"] = db.getRow("dhcp", "logicalIfName", "DMZ")["dhcp.startAddress"]
      configRow["dhcp.endAddress"] = db.getRow("dhcp", "logicalIfName", "DMZ")["dhcp.endAddress"]
      configRow["dhcp.defaultGw"] = db.getRow("dhcp", "logicalIfName", "DMZ")["dhcp.defaultGw"]
      configRow["dhcp.primaryDnsServer"] = db.getRow("dhcp", "logicalIfName", "DMZ")["dhcp.primaryDnsServer"]
      configRow["dhcp.secondaryDnsServer"] = db.getRow("dhcp", "logicalIfName", "DMZ")["dhcp.secondaryDnsServer"]
      configRow["dhcp.winsServer"] = db.getRow("dhcp", "logicalIfName", "DMZ")["dhcp.winsServer"]
      configRow["dhcp.leaseTime"] = db.getRow("dhcp", "logicalIfName", "DMZ")["dhcp.leaseTime"]
      configRow["dhcp.enableDnsProxy"] = db.getRow("dhcp", "logicalIfName", "DMZ")["dhcp.enableDnsProxy"]
      configRow["dhcp.domainName"] = db.getRow("dhcp", "logicalIfName", "DMZ")["dhcp.domainName"]
    end
  end
  configRow["ifStatic.StaticIp"] = db.getRow("ifStatic", "LogicalIfName", "DMZ")["ifStatic.StaticIp"]
  configRow["ifStatic.NetMask"] = db.getRow("ifStatic", "LogicalIfName", "DMZ")["ifStatic.NetMask"]
  configRow["ConfigPort.LogicalIfName"] = db.getRow("ConfigPort", "_ROWID_", "1")["ConfigPort.LogicalIfName"]
  if db.getRow("DhcpRelay", "LogicalIfName", "DMZ") ~= nil then
    if db.getRow("DhcpRelay", "LogicalIfName", "DMZ")["DhcpRelay.DhcpRelayStatus"] == "1" then
      configRow["dhcp.dhcpEnabled"] = "3"
    end
    configRow["DhcpRelay.RelayGateway"] = db.getRow("DhcpRelay", "LogicalIfName", "DMZ")["DhcpRelay.RelayGateway"]
  end
  return -1, configRow
end
function dmzCfgInputVal(A0_3)
  local L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10, L8_11, L9_12, L10_13, L11_14, L12_15
  L8_11 = db
  L8_11 = L8_11.getAttribute
  L9_12 = "ConfigPort"
  L10_13 = "_ROWID_"
  L11_14 = "1"
  L12_15 = "LogicalIfName"
  L8_11 = L8_11(L9_12, L10_13, L11_14, L12_15)
  L9_12 = db
  L9_12 = L9_12.getAttribute
  L10_13 = "unitInfo"
  L11_14 = "_ROWID_"
  L12_15 = "1"
  L9_12 = L9_12(L10_13, L11_14, L12_15, "modelId")
  L10_13 = A0_3["ConfigPort.LogicalIfName"]
  if L10_13 ~= "" then
    L10_13 = A0_3["ConfigPort.LogicalIfName"]
  elseif L10_13 == nil then
    L10_13 = printCLIError
    L11_14 = "Invalid DMZ status"
    L10_13(L11_14)
    L10_13 = false
    return L10_13
  end
  if L9_12 == "DSR-250" or L9_12 == "DSR-250N" or L9_12 == "DSR-150" or L9_12 == "DSR-150N" then
    if L8_11 == "LAN" then
      L10_13 = A0_3["ConfigPort.LogicalIfName"]
      if L10_13 == "LAN" then
        L10_13 = printCLIError
        L11_14 = "Enable DMZ first"
        L10_13(L11_14)
        L10_13 = false
        return L10_13
      end
    end
  elseif L8_11 == "WAN2" then
    L10_13 = printCLIError
    L11_14 = "Please enable DMZ first"
    L10_13(L11_14)
    L10_13 = false
    return L10_13
  end
  L10_13 = A0_3["ifStatic.StaticIp"]
  if L10_13 ~= nil then
    L10_13 = A0_3["ifStatic.StaticIp"]
  elseif L10_13 == "" then
    L10_13 = printCLIError
    L11_14 = "Please enter a valid IP Address"
    L10_13(L11_14)
    L10_13 = false
    return L10_13
  end
  L10_13 = UNIT_NAME
  if L10_13 ~= "DSR-1000AC" then
    L10_13 = UNIT_NAME
    if L10_13 ~= "DSR-1000N" then
      L10_13 = UNIT_NAME
    end
  else
    if L10_13 == "DSR-1000" then
      L7_10 = "1024"
  end
  else
    L10_13 = UNIT_NAME
    if L10_13 ~= "DSR-500AC" then
      L10_13 = UNIT_NAME
      if L10_13 ~= "DSR-500N" then
        L10_13 = UNIT_NAME
      end
    else
      if L10_13 == "DSR-500" then
        L7_10 = "512"
    end
    else
      L10_13 = UNIT_NAME
      if L10_13 ~= "DSR-250N" then
        L10_13 = UNIT_NAME
      else
        if L10_13 == "DSR-250" then
          L7_10 = "256"
      end
      else
        L7_10 = "128"
      end
    end
  end
  L10_13 = util
  L10_13 = L10_13.split
  L11_14 = A0_3["ifStatic.StaticIp"]
  L12_15 = "."
  L10_13 = L10_13(L11_14, L12_15)
  L2_5 = L10_13
  if L2_5 ~= nil then
    L10_13 = tonumber
    L11_14 = L2_5[1]
    L10_13 = L10_13(L11_14)
    if L10_13 ~= 224 then
      L10_13 = tonumber
      L11_14 = L2_5[1]
      L10_13 = L10_13(L11_14)
      if not (L10_13 > 224) then
        L10_13 = tonumber
        L11_14 = L2_5[1]
        L10_13 = L10_13(L11_14)
        if L10_13 ~= 0 then
          L10_13 = A0_3["ifStatic.StaticIp"]
        end
      end
    end
  elseif L10_13 == "0.0.0.0" then
    L10_13 = printCLIError
    L11_14 = "Invalid IP address. Please enter a valid IP address."
    L10_13(L11_14)
    L10_13 = false
    return L10_13
  end
  L2_5 = A0_3["ifStatic.StaticIp"]
  L10_13 = validationsLuaLib
  L10_13 = L10_13.ipv4AddrAsciiToNum
  L11_14 = L2_5
  L11_14 = L10_13(L11_14)
  L5_8 = L11_14
  _UPVALUE0_ = L10_13
  L10_13 = _UPVALUE0_
  if L10_13 == -1 then
    L10_13 = printCLIError
    L11_14 = "Invalid IP address. Please enter a valid IP address."
    L10_13(L11_14)
    L10_13 = false
    return L10_13
  end
  L10_13 = A0_3["ifStatic.StaticIp"]
  L11_14 = _UPVALUE1_
  L11_14 = L11_14.NIL
  if L10_13 ~= L11_14 then
    L10_13 = _UPVALUE2_
    L10_13 = L10_13.ipv4SingleMaskCheck
    L11_14 = _UPVALUE3_
    L12_15 = A0_3["ifStatic.StaticIp"]
    L10_13 = L10_13(L11_14, L12_15, _UPVALUE4_)
    L11_14 = _UPVALUE1_
    L11_14 = L11_14.SUCCESS
    if L10_13 == L11_14 then
      L10_13 = printCLIError
      L11_14 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
      L10_13(L11_14)
      L10_13 = false
      return L10_13
    end
  end
  L10_13 = A0_3["ifStatic.NetMask"]
  if L10_13 == nil then
    L10_13 = printCLIError
    L11_14 = "please enter a valid subnet mask"
    L10_13(L11_14)
    L10_13 = false
    return L10_13
  end
  L10_13 = A0_3["ifStatic.NetMask"]
  if L10_13 == "0.0.0.0" then
    L10_13 = printCLIError
    L11_14 = "Please enter valid CIDR subnet mask."
    L10_13(L11_14)
    L10_13 = false
    return L10_13
  end
  L10_13 = _UPVALUE2_
  L10_13 = L10_13.checkSubnetMask
  L11_14 = A0_3["ifStatic.NetMask"]
  L10_13 = L10_13(L11_14)
  L11_14 = _UPVALUE1_
  L11_14 = L11_14.FAILURE
  if L10_13 == L11_14 then
    L10_13 = printCLIError
    L11_14 = "Please enter valid subnet Mask"
    L10_13(L11_14)
    L10_13 = false
    return L10_13
  end
  L10_13 = validationsLuaLib
  L10_13 = L10_13.ipv4AddressParametersGet
  L11_14 = A0_3["ifStatic.StaticIp"]
  L12_15 = A0_3["ifStatic.NetMask"]
  L6_9, L1_4, L10_13 = _UPVALUE4_, nil, L10_13(L11_14, L12_15)
  L6_9, L1_4, L11_14 = _UPVALUE4_, nil, L10_13(L11_14, L12_15)
  L6_9, L1_4, L12_15 = _UPVALUE4_, nil, L10_13(L11_14, L12_15)
  L4_7 = L12_15
  L3_6 = L11_14
  _UPVALUE0_ = L10_13
  L10_13 = _UPVALUE0_
  if L10_13 == -1 then
    L10_13 = printCLIError
    L11_14 = "Error occured while calculating the Network address."
    L10_13(L11_14)
    L10_13 = false
    return L10_13
  end
  L10_13 = util
  L10_13 = L10_13.split
  L11_14 = L3_6
  L12_15 = "."
  L10_13 = L10_13(L11_14, L12_15)
  L2_5 = L10_13
  L10_13 = tonumber
  L11_14 = L2_5[1]
  L10_13 = L10_13(L11_14)
  if L10_13 == 0 then
    L10_13 = printCLIError
    L11_14 = "Combination of IP address/Subnet Mask is pointing to invalid network."
    L10_13(L11_14)
    L10_13 = false
    return L10_13
  end
  L10_13 = A0_3["ifStatic.StaticIp"]
  L11_14 = A0_3["ifStatic.NetMask"]
  L12_15 = A0_3["ifStatic.StaticIp"]
  if L3_6 ~= L12_15 then
    L12_15 = A0_3["ifStatic.StaticIp"]
  elseif L4_7 == L12_15 then
    L12_15 = printCLIError
    L12_15("Configured IP address cannot be a network/broadcast address.")
    L12_15 = false
    return L12_15
  end
  L12_15 = nil
  L12_15 = _UPVALUE2_.checkWanSubnetRange(L10_13, L11_14)
  if L12_15 == _UPVALUE1_.SUCCESS then
    if UNIT_NAME == "DSR-1000N" or UNIT_NAME == "DSR-1000" or UNIT_NAME == "DSR-500N" or UNIT_NAME == "DSR-500" or UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-500AC" then
      printCLIError("WAN1/WAN2 ip/subnet already configured in same subnet.Please specify IP address in a different subnet.")
    else
      printCLIError("WAN ip/subnet already configured in same subnet.Please specify IP address in a different subnet.")
    end
    return false
  end
  returnCode = _UPVALUE2_.checkIpSecSubnetRange(L10_13, L11_14)
  if returnCode == _UPVALUE1_.SUCCESS then
    printCLIError("DHCP Range Over IpSec is in the same subnet.Please specify IP address in a different subnet.")
    return false
  end
  returnCode = _UPVALUE2_.checkPptpSeverSubnetRange(L10_13, L11_14)
  if returnCode == _UPVALUE1_.SUCCESS then
    printCLIError("PPTP Server range already configured in same subnet.Please specify IP address in a different subnet.")
    return false
  end
  returnCode = _UPVALUE2_.checkL2tpSeverSubnetRange(L10_13, L11_14)
  if returnCode == _UPVALUE1_.SUCCESS then
    printCLIError("L2tp Server range already configured in same subnet.Please specify IP address in a different subnet.")
    return false
  end
  if HIGH_SEC == "HIGH" then
    L12_15 = _UPVALUE2_.checkSslClientRange(L10_13, L11_14)
    if L12_15 == _UPVALUE1_.SUCCESS then
      printCLIError("SSL-VPN client range is in the same subnet.Please specify IP address in a different subnet.")
      return false
    end
  end
  returnCode = _UPVALUE2_.checkDmzWithLan(L10_13, L11_14)
  if returnCode == _UPVALUE1_.SUCCESS then
    printCLIError("DMZ ip/subnet already configured on some other Interface.")
    return false
  end
  L12_15 = _UPVALUE2_.checkLanVlanSubnetRange(L10_13, L11_14)
  if L12_15 == _UPVALUE1_.SUCCESS then
    printCLIError("Lan/Vlan ip/subnet already configured in same subnet.Please specify IP address in a different subnet.")
    return false
  end
  if _UPVALUE2_.checkOpenVpnSubnetRange(A0_3["ifStatic.StaticIp"], A0_3["ifStatic.NetMask"]) == _UPVALUE1_.SUCCESS then
    printCLIError("OPENVPN Network/Remote Network is already " .. "configured in same subnet. Please specify IP address in " .. "different subnet.")
    return false
  end
  if A0_3["ConfigPort.LogicalIfName"] == "DMZ" then
    if A0_3["dhcp.dhcpEnabled"] == "1" and (A0_3["dhcp.startAddress"] == nil or A0_3["dhcp.startAddress"] == "" or A0_3["dhcp.startAddress"] == "0.0.0.0") then
      printCLIError("Invalid Start IP address")
      return false
    elseif A0_3["dhcp.startAddress"] == A0_3["ifStatic.StaticIp"] then
      printCLIError("Start Ip Address same as configured Ip Address")
      return false
    end
    if A0_3["dhcp.dhcpEnabled"] == "1" and (A0_3["dhcp.endAddress"] == nil or A0_3["dhcp.endAddress"] == "" or A0_3["dhcp.endAddress"] == "0.0.0.0") then
      printCLIError("Invalid End IP address")
      return false
    elseif A0_3["dhcp.endAddress"] == A0_3["ifStatic.StaticIp"] then
      printCLIError("End Ip Address same as configured Ip Address")
      return false
    end
    if A0_3["dhcp.dhcpEnabled"] == "1" then
      L2_5 = util.split(A0_3["dhcp.startAddress"], ".")
      if L2_5 == nil or tonumber(L2_5[1]) == 224 or tonumber(L2_5[1]) > 224 or tonumber(L2_5[1]) == 0 or A0_3["dhcp.startAddress"] == "0.0.0.0" then
        printCLIError("Invalid start IP address. Please enter a valid IP address.")
        return false
      end
      L2_5 = A0_3["dhcp.startAddress"]
      _UPVALUE0_, L5_8 = validationsLuaLib.ipv4AddrAsciiToNum(L2_5)
      if _UPVALUE0_ == -1 then
        printCLIError("Invalid start IP address. Please enter a valid IP address.")
        return false
      end
      if _UPVALUE2_.ipv4SingleMaskCheck(A0_3["ifStatic.StaticIp"], A0_3["dhcp.startAddress"], A0_3["ifStatic.NetMask"]) ~= _UPVALUE1_.SUCCESS then
        printCLIError("Start IP should be in same subnet .")
        return false
      end
      L2_5 = util.split(A0_3["dhcp.endAddress"], ".")
      if L2_5 == nil or tonumber(L2_5[1]) == 224 or tonumber(L2_5[1]) > 224 or tonumber(L2_5[1]) == 0 or A0_3["dhcp.endAddress"] == "0.0.0.0" then
        printCLIError("Invalid end IP address. Please enter a valid IP address.")
        return false
      end
      L2_5 = A0_3["dhcp.endAddress"]
      _UPVALUE0_, L5_8 = validationsLuaLib.ipv4AddrAsciiToNum(L2_5)
      if _UPVALUE0_ == -1 then
        printCLIError("Invalid end IP address. Please enter a valid IP address.")
        return false
      end
      if _UPVALUE2_.ipv4SingleMaskCheck(A0_3["ifStatic.StaticIp"], A0_3["dhcp.endAddress"], A0_3["ifStatic.NetMask"]) ~= _UPVALUE1_.SUCCESS then
        printCLIError("END IP should be in same subnet .")
        return false
      end
      _UPVALUE0_ = _UPVALUE2_.ipv4AddressesCompare(A0_3["dhcp.startAddress"], A0_3["dhcp.endAddress"])
      if _UPVALUE0_ == 0 or _UPVALUE0_ == 3 then
        printCLIError("End address should be higher than or equal to Start address")
        return false
      end
      if L3_6 == A0_3["dhcp.startAddress"] or L4_7 == A0_3["dhcp.startAddress"] then
        printCLIError("Configured start IP address cannot be a network/broadcast address.")
        return false
      end
      if L3_6 == A0_3["dhcp.endAddress"] or L4_7 == A0_3["dhcp.endAddress"] then
        printCLIError("Configured end IP address cannot be a network/broadcast address.")
        return false
      end
      _UPVALUE0_, range = validationsLuaLib.ipv4TotalAddressesGet(A0_3["dhcp.startAddress"], A0_3["dhcp.endAddress"])
      if _UPVALUE0_ == 0 then
        printCLIError("Invalid Start/End address")
        return false
      end
      if range > tonumber(L7_10) - 1 then
        printCLIError("upto " .. L7_10 .. " addresses are allowed to be configured.")
        return false
      end
    end
    if A0_3["dhcp.dhcpEnabled"] == "1" and (A0_3["dhcp.defaultGw"] == nil or A0_3["dhcp.defaultGw"] == "" or A0_3["dhcp.defaultGw"] == "0.0.0.0") then
      printCLIError("Invalid  default gateway")
      return false
    end
    if A0_3["dhcp.dhcpEnabled"] == "1" then
      L2_5 = util.split(A0_3["dhcp.defaultGw"], ".")
      if L2_5 == nil or tonumber(L2_5[1]) == 224 or tonumber(L2_5[1]) > 224 or tonumber(L2_5[1]) == 0 or A0_3["dhcp.defaultGw"] == "0.0.0.0" then
        printCLIError("Invalid Gateway IP address. Please enter a valid IP address.")
        return false
      end
      L2_5 = A0_3["dhcp.defaultGw"]
      _UPVALUE0_, L5_8 = validationsLuaLib.ipv4AddrAsciiToNum(L2_5)
      if _UPVALUE0_ == -1 then
        printCLIError("Invalid Gateway IP address. Please enter a valid IP address.")
        return false
      end
      if _UPVALUE2_.ipv4SingleMaskCheck(_UPVALUE3_, A0_3["dhcp.defaultGw"], _UPVALUE4_) == _UPVALUE1_.SUCCESS then
        printCLIError("Local Interface IP address is in the same subnet. Please specify Gateway address in a different subnet.")
        return false
      end
      if _UPVALUE2_.ipv4SingleMaskCheck(A0_3["ifStatic.StaticIp"], A0_3["dhcp.defaultGw"], A0_3["ifStatic.NetMask"]) ~= _UPVALUE1_.SUCCESS then
        printCLIError("DEFAULT Gateway IP should be in same subnet.")
        return false
      end
      if L3_6 == A0_3["dhcp.defaultGw"] or L4_7 == A0_3["dhcp.defaultGw"] then
        printCLIError("Configured default gateway IP address cannot be a network/broadcast address.")
        return false
      end
      if A0_3["dhcp.primaryDnsServer"] ~= nil and A0_3["dhcp.primaryDnsServer"] ~= "" then
        Octet = util.split(A0_3["dhcp.primaryDnsServer"], ".")
        if tonumber(Octet[1]) == 224 or 224 < tonumber(Octet[1]) or tonumber(Octet[1]) == 0 or A0_3["dhcp.primaryDnsServer"] == "0.0.0.0" then
          printCLIError("Invalid Primary DNS IP address. Please enter a value between 1 - 223 for octet 1")
          return false
        end
        if tonumber(Octet[4]) == 255 or tonumber(Octet[4]) > 254 or tonumber(Octet[4]) == 0 then
          printCLIError("Invalid Primary DNS IP address. Please enter a value between 1 - 254 for octet 4")
          return false
        end
      end
      if A0_3["dhcp.secondaryDnsServer"] ~= nil and A0_3["dhcp.secondaryDnsServer"] ~= "" then
        Octet = util.split(A0_3["dhcp.secondaryDnsServer"], ".")
        if tonumber(Octet[1]) == 224 or 224 < tonumber(Octet[1]) or tonumber(Octet[1]) == 0 or A0_3["dhcp.secondaryDnsServer"] == "0.0.0.0" then
          printCLIError("Invalid Secondary DNS IP address. Please enter a value between 1 - 223 for octet 1")
          return false
        end
        if tonumber(Octet[4]) == 255 or tonumber(Octet[4]) > 254 or tonumber(Octet[4]) == 0 then
          printCLIError("Invalid Secondary DNS IP address. Please enter a value between 1 - 254 for octet 4")
          return false
        end
      end
      if A0_3["dhcp.winsServer"] ~= nil and A0_3["dhcp.winsServer"] ~= "" then
        Octet = util.split(A0_3["dhcp.winsServer"], ".")
        if tonumber(Octet[1]) == 224 or 224 < tonumber(Octet[1]) or tonumber(Octet[1]) == 0 or A0_3["dhcp.winsServer"] == "0.0.0.0" then
          printCLIError("Invalid WinServer IP address. Please enter a value between 1 - 223 for octet 1")
          return false
        end
        if tonumber(Octet[4]) == 255 or tonumber(Octet[4]) > 254 or tonumber(Octet[4]) == 0 then
          printCLIError("Invalid WinServer IP address. Please enter a value between 1 - 254 for octet 4")
          return false
        end
      end
    end
    if A0_3["dhcp.dhcpEnabled"] == "1" then
      if A0_3["dhcp.domainName"] == nil or A0_3["dhcp.domainName"] == "" then
        A0_3["dhcp.domainName"] = ""
      else
        status, errStr = validationsLuaLib.domainNameValidation(A0_3["dhcp.domainName"])
        if tonumber(status) ~= 0 then
          printCLIError(errStr)
          return false
        end
      end
    end
    if A0_3["dhcp.dhcpEnabled"] == "1" and (A0_3["dhcp.leaseTime"] == "" or A0_3["dhcp.leaseTime"] == nil) then
      printCLIError("Invalid lease Time")
      return false
    end
    if A0_3["dhcp.dhcpEnabled"] == "3" and (A0_3["DhcpRelay.RelayGateway"] == nil or A0_3["DhcpRelay.RelayGateway"] == "") then
      printCLIError("Invalid relay gateway")
      return false
    end
    if A0_3["dhcp.dhcpEnabled"] == "3" and A0_3["DhcpRelay.RelayGateway"] ~= nil and A0_3["DhcpRelay.RelayGateway"] ~= "" then
      Octet = util.split(A0_3["DhcpRelay.RelayGateway"], ".")
      if tonumber(Octet[1]) == 224 or 224 < tonumber(Octet[1]) or tonumber(Octet[1]) == 0 or A0_3["DhcpRelay.RelayGateway"] == "0.0.0.0" then
        printCLIError("Invalid Relay Gateway IP address. Please enter a value between 1 - 223 for octet 1")
        return false
      end
      if tonumber(Octet[4]) == 255 or tonumber(Octet[4]) > 254 or tonumber(Octet[4]) == 0 then
        printCLIError("Invalid Relay Gateway IP address. Please enter a value between 1 - 254 for octet 4")
        return false
      end
    end
  end
  return true
end
function dmzCfgSave(A0_16)
  local L1_17, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23
  L1_17 = "OK"
  L2_18 = ""
  L3_19 = ""
  L4_20 = db
  L4_20 = L4_20.getRowWhere
  L5_21 = "ifStatic"
  L6_22 = "LogicalIfName = 'DMZ' AND AddressFamily = 2"
  L4_20 = L4_20(L5_21, L6_22)
  L5_21 = db
  L5_21 = L5_21.getAttribute
  L6_22 = "unitInfo"
  L7_23 = "_ROWID_"
  L5_21 = L5_21(L6_22, L7_23, "1", "modelId")
  if L5_21 ~= nil and (L5_21 == "DSR-250" or L5_21 == "DSR-250N" or L5_21 == "DSR-150" or L5_21 == "DSR-150N") then
    L6_22 = nimfView
    L6_22 = L6_22.portModeConfig
    L7_23 = A0_16
    L7_23 = L6_22(L7_23, "1", "edit")
    L2_18 = L7_23
    L1_17 = L6_22
    if L1_17 == "OK" then
      L6_22 = vlanConfig
      L6_22 = L6_22.portMgmtUpdate
      L7_23 = A0_16
      L7_23 = L6_22(L7_23)
      L2_18 = L7_23
      L1_17 = L6_22
    end
  end
  if L1_17 == "OK" then
    L6_22 = "LogicalIfName = 'DMZ' AND AddressFamily = 2"
    L7_23 = db
    L7_23 = L7_23.existsRowWhere
    L7_23 = L7_23("ifStatic", L6_22)
    L1_17, L2_18 = lan.ipv4LanConfig(A0_16, L7_23, "edit")
    if L1_17 == "OK" then
      db.save()
      L1_17, L2_18 = dhcp.dhcpConfigWrap(A0_16, "DMZ")
    end
  end
  if L1_17 == "OK" then
    L6_22 = db
    L6_22 = L6_22.save
    L6_22()
  end
  L6_22 = db
  L6_22 = L6_22.getAttribute
  L7_23 = "stringsMap"
  L6_22 = L6_22(L7_23, "stringId", L2_18, LANGUAGE)
  L3_19 = L6_22 or L2_18
  L6_22 = L1_17
  L7_23 = L3_19
  return L6_22, L7_23
end
function dmzSetupGet()
  local L0_24, L1_25, L2_26, L3_27, L4_28, L5_29, L6_30, L7_31, L8_32, L9_33
  L0_24 = {}
  L1_25 = nil
  L2_26 = "LogicalIfName = 'DMZ' AND AddressFamily = 2"
  L3_27 = db
  L3_27 = L3_27.existsRowWhere
  L4_28 = "ifStatic"
  L5_29 = L2_26
  L3_27 = L3_27(L4_28, L5_29)
  L4_28 = db
  L4_28 = L4_28.getRow
  L5_29 = "ifStatic"
  L6_30 = "_ROWID_"
  L7_31 = L3_27
  L4_28 = L4_28(L5_29, L6_30, L7_31)
  L5_29 = printLabel
  L6_30 = "DMZ Setup"
  L5_29(L6_30)
  L5_29 = db
  L5_29 = L5_29.getRow
  L6_30 = "ConfigPort"
  L7_31 = "_ROWID_"
  L8_32 = "1"
  L5_29 = L5_29(L6_30, L7_31, L8_32)
  L6_30 = L5_29["ConfigPort.LogicalIfName"]
  if L6_30 == "DMZ" then
    L6_30 = resTab
    L6_30 = L6_30.insertField
    L7_31 = L0_24
    L8_32 = "dmz status"
    L9_33 = " enabled"
    L6_30(L7_31, L8_32, L9_33)
  else
    L6_30 = resTab
    L6_30 = L6_30.insertField
    L7_31 = L0_24
    L8_32 = "dmz status"
    L9_33 = " disabled"
    L6_30(L7_31, L8_32, L9_33)
  end
  if L4_28 ~= nil then
    L6_30 = resTab
    L6_30 = L6_30.insertField
    L7_31 = L0_24
    L8_32 = "IPv4 Address"
    L9_33 = L4_28["ifStatic.StaticIp"]
    L9_33 = L9_33 or ""
    L6_30(L7_31, L8_32, L9_33)
    L6_30 = resTab
    L6_30 = L6_30.insertField
    L7_31 = L0_24
    L8_32 = "Subnet Mask"
    L9_33 = L4_28["ifStatic.NetMask"]
    L9_33 = L9_33 or ""
    L6_30(L7_31, L8_32, L9_33)
  end
  L6_30 = resTab
  L6_30 = L6_30.insertField
  L7_31 = L0_24
  L8_32 = "DHCP Setup Configuration"
  L9_33 = ""
  L6_30(L7_31, L8_32, L9_33)
  L6_30 = "logicalIfName = 'DMZ'"
  L7_31 = db
  L7_31 = L7_31.existsRowWhere
  L8_32 = "dhcp"
  L9_33 = L6_30
  L7_31 = L7_31(L8_32, L9_33)
  L8_32 = db
  L8_32 = L8_32.getRow
  L9_33 = "dhcp"
  L8_32 = L8_32(L9_33, "_ROWID_", L7_31)
  dhcpTable = L8_32
  L8_32 = "LogicalIfName = 'DMZ'"
  L9_33 = db
  L9_33 = L9_33.existsRowWhere
  L9_33 = L9_33("DhcpRelay", L8_32)
  dhcpRelayTable = db.getRow("DhcpRelay", "_ROWID_", L9_33)
  if dhcpTable ~= nil and dhcpRelayTable ~= nil then
    if dhcpTable["dhcp.dhcpEnabled"] == "0" and dhcpRelayTable["DhcpRelay.DhcpRelayStatus"] == "1" then
      resTab.insertField(L0_24, "DHCP Mode", "DHCP Relay")
    end
    if dhcpTable["dhcp.dhcpEnabled"] == "1" and dhcpRelayTable["DhcpRelay.DhcpRelayStatus"] == "0" then
      resTab.insertField(L0_24, "DHCP Mode", "DHCP Server")
    end
    if dhcpTable["dhcp.dhcpEnabled"] == "0" and dhcpRelayTable["DhcpRelay.DhcpRelayStatus"] == "0" then
      resTab.insertField(L0_24, "DHCP Mode", "None")
    end
    if dhcpTable["dhcp.dhcpEnabled"] == "1" then
      resTab.insertField(L0_24, "Domain Name", dhcpTable["dhcp.domainName"] or "")
      resTab.insertField(L0_24, "Starting IP Address", dhcpTable["dhcp.startAddress"] or "")
      resTab.insertField(L0_24, "Ending IP Address", dhcpTable["dhcp.endAddress"] or "")
      resTab.insertField(L0_24, "Primary DNS Server", dhcpTable["dhcp.primaryDnsServer"] or "")
      resTab.insertField(L0_24, "Secondary DNS Server", dhcpTable["dhcp.secondaryDnsServer"] or "")
      resTab.insertField(L0_24, "WINS Server", dhcpTable["dhcp.winsServer"] or "")
      resTab.insertField(L0_24, "Lease Time in hrs ", dhcpTable["dhcp.leaseTime"] or "")
    elseif dhcpRelayTable["DhcpRelay.DhcpRelayStatus"] == "1" then
      resTab.insertField(L0_24, "Relay Gateway", dhcpRelayTable["DhcpRelay.RelayGateway"] or "")
    end
  end
  IgmpTable = db.getRow("Igmp", "_ROWID_", 1)
  resTab.insertField(L0_24, "DMZ Proxies", "")
  if dhcpTable["dhcp.enableDnsProxy"] == "1" then
    resTab.insertField(L0_24, "DNS Proxy", " Enabled")
  else
    resTab.insertField(L0_24, "DNS Proxy", " Disabled")
  end
  resTab.print(L0_24, 0)
  return true
end
