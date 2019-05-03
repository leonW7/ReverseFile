local L0_0
L0_0 = require
L0_0("teamf1lualib/stats_db")
L0_0 = require
L0_0("teamf1lualib/ifDev")
L0_0 = require
L0_0("teamf1lualib/lan")
L0_0 = require
L0_0("teamf1lualib/dhcp")
L0_0 = require
L0_0("teamf1lualib/igmp")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/validations_cli")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/dproxyMgmt")
L0_0 = require
L0_0("validationsLuaLib")
L0_0 = require
L0_0("teamf1lualib/deviceStatistics_bl")
L0_0 = require
L0_0("teamf1lualib/accounting_core")
L0_0 = require
L0_0("teamf1lualib/ipv6_prefixLength_bl")
L0_0 = require
L0_0("teamf1lualib/lanClients_bl")
L0_0 = require
L0_0("teamf1lualib/errorMap")
L0_0 = require
L0_0("teamf1lualib/authentication_radius")
L0_0 = require
L0_0("teamf1lualib/vlan_vlan")
L0_0 = require
L0_0 = L0_0("com.teamf1.bl.deviceStatistics")
function lanCfgInputVal(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13
  L8_9 = A0_1["ifStatic.StaticIp"]
  if L8_9 ~= nil then
    L8_9 = A0_1["ifStatic.StaticIp"]
  elseif L8_9 == "" then
    L8_9 = printCLIError
    L9_10 = "Please enter a valid IP Address"
    L8_9(L9_10)
    L8_9 = false
    return L8_9
  end
  L8_9 = UNIT_NAME
  if L8_9 ~= "DSR-1000AC" then
    L8_9 = UNIT_NAME
    if L8_9 ~= "DSR-1000N" then
      L8_9 = UNIT_NAME
    end
  else
    if L8_9 == "DSR-1000" then
      L7_8 = "1024"
  end
  else
    L8_9 = UNIT_NAME
    if L8_9 ~= "DSR-500AC" then
      L8_9 = UNIT_NAME
      if L8_9 ~= "DSR-500N" then
        L8_9 = UNIT_NAME
      end
    else
      if L8_9 == "DSR-500" then
        L7_8 = "512"
    end
    else
      L8_9 = UNIT_NAME
      if L8_9 ~= "DSR-250N" then
        L8_9 = UNIT_NAME
      else
        if L8_9 == "DSR-250" then
          L7_8 = "256"
      end
      else
        L7_8 = "128"
      end
    end
  end
  L8_9 = A0_1["ifStatic.StaticIp"]
  L9_10 = _UPVALUE0_
  L9_10 = L9_10.NIL
  if L8_9 ~= L9_10 then
    L8_9 = _UPVALUE1_
    L8_9 = L8_9.ipv4SingleMaskCheck
    L9_10 = _UPVALUE2_
    L10_11 = A0_1["ifStatic.StaticIp"]
    L11_12 = _UPVALUE3_
    L8_9 = L8_9(L9_10, L10_11, L11_12)
    L9_10 = _UPVALUE0_
    L9_10 = L9_10.SUCCESS
    if L8_9 == L9_10 then
      L8_9 = printCLIError
      L9_10 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
      L8_9(L9_10)
      L8_9 = false
      return L8_9
    end
  end
  L8_9 = util
  L8_9 = L8_9.split
  L9_10 = A0_1["ifStatic.StaticIp"]
  L10_11 = "."
  L8_9 = L8_9(L9_10, L10_11)
  L2_3 = L8_9
  if L2_3 ~= nil then
    L8_9 = tonumber
    L9_10 = L2_3[1]
    L8_9 = L8_9(L9_10)
    if L8_9 ~= 224 then
      L8_9 = tonumber
      L9_10 = L2_3[1]
      L8_9 = L8_9(L9_10)
      if not (L8_9 > 224) then
        L8_9 = tonumber
        L9_10 = L2_3[1]
        L8_9 = L8_9(L9_10)
        if L8_9 ~= 0 then
          L8_9 = A0_1["ifStatic.StaticIp"]
        end
      end
    end
  elseif L8_9 == "0.0.0.0" then
    L8_9 = printCLIError
    L9_10 = "Invalid IP address. Please enter a valid IP address."
    L8_9(L9_10)
    L8_9 = false
    return L8_9
  end
  L2_3 = A0_1["ifStatic.StaticIp"]
  L8_9 = validationsLuaLib
  L8_9 = L8_9.ipv4AddrAsciiToNum
  L9_10 = L2_3
  L9_10 = L8_9(L9_10)
  L6_7 = L9_10
  _UPVALUE4_ = L8_9
  L8_9 = _UPVALUE4_
  if L8_9 == -1 then
    L8_9 = printCLIError
    L9_10 = "Invalid IP address. Please enter a valid IP address."
    L8_9(L9_10)
    L8_9 = false
    return L8_9
  end
  L8_9, L9_10 = nil, nil
  L10_11 = _UPVALUE1_
  L10_11 = L10_11.checkWanSubnetRange
  L11_12 = A0_1["ifStatic.StaticIp"]
  L12_13 = A0_1["ifStatic.NetMask"]
  L10_11 = L10_11(L11_12, L12_13)
  L8_9 = L10_11
  L10_11 = _UPVALUE0_
  L10_11 = L10_11.SUCCESS
  if L8_9 == L10_11 then
    L10_11 = printCLIError
    L11_12 = "WAN1/WAN2 ip/subnet already configured in same subnet.Please specify IP address in a different subnet."
    L10_11(L11_12)
    L10_11 = false
    return L10_11
  end
  L10_11 = _UPVALUE1_
  L10_11 = L10_11.checkIpSecSubnetRange
  L11_12 = A0_1["ifStatic.StaticIp"]
  L12_13 = A0_1["ifStatic.NetMask"]
  L10_11 = L10_11(L11_12, L12_13)
  L8_9 = L10_11
  L10_11 = _UPVALUE0_
  L10_11 = L10_11.SUCCESS
  if L8_9 == L10_11 then
    L10_11 = printCLIError
    L11_12 = "DHCP Range Over IpSec is in the same subnet.Please specify IP address in a different subnet."
    L10_11(L11_12)
    L10_11 = false
    return L10_11
  end
  L10_11 = _UPVALUE1_
  L10_11 = L10_11.checkPptpSeverSubnetRange
  L11_12 = A0_1["ifStatic.StaticIp"]
  L12_13 = A0_1["ifStatic.NetMask"]
  L10_11 = L10_11(L11_12, L12_13)
  L8_9 = L10_11
  L10_11 = _UPVALUE0_
  L10_11 = L10_11.SUCCESS
  if L8_9 == L10_11 then
    L10_11 = printCLIError
    L11_12 = "PPTP Server range already configured in same subnet.Please specify IP address in a different subnet."
    L10_11(L11_12)
    L10_11 = false
    return L10_11
  end
  L10_11 = _UPVALUE1_
  L10_11 = L10_11.checkL2tpSeverSubnetRange
  L11_12 = A0_1["ifStatic.StaticIp"]
  L12_13 = A0_1["ifStatic.NetMask"]
  L10_11 = L10_11(L11_12, L12_13)
  L8_9 = L10_11
  L10_11 = _UPVALUE0_
  L10_11 = L10_11.SUCCESS
  if L8_9 == L10_11 then
    L10_11 = printCLIError
    L11_12 = "L2TP Server range already configured in same subnet.Please specify IP address in a different subnet."
    L10_11(L11_12)
    L10_11 = false
    return L10_11
  end
  L10_11 = HIGH_SEC
  if L10_11 == "HIGH" then
    L10_11 = _UPVALUE1_
    L10_11 = L10_11.checkSslClientRange
    L11_12 = A0_1["ifStatic.StaticIp"]
    L12_13 = A0_1["ifStatic.NetMask"]
    L10_11 = L10_11(L11_12, L12_13)
    L8_9 = L10_11
    L10_11 = _UPVALUE0_
    L10_11 = L10_11.SUCCESS
    if L8_9 == L10_11 then
      L10_11 = printCLIError
      L11_12 = "SSL-VPN client range is in the same subnet.Please specify IP address in a different subnet."
      L10_11(L11_12)
      L10_11 = false
      return L10_11
    end
  end
  L10_11 = _UPVALUE1_
  L10_11 = L10_11.checkDmzSubnetRange
  L11_12 = A0_1["ifStatic.StaticIp"]
  L12_13 = A0_1["ifStatic.NetMask"]
  L10_11 = L10_11(L11_12, L12_13)
  L8_9 = L10_11
  L10_11 = _UPVALUE0_
  L10_11 = L10_11.SUCCESS
  if L8_9 == L10_11 then
    L10_11 = printCLIError
    L11_12 = "DMZ ip/subnet already configured in same subnet.Please specify IP address in a different subnet."
    L10_11(L11_12)
    L10_11 = false
    return L10_11
  end
  L10_11 = _UPVALUE1_
  L10_11 = L10_11.checkOpenVpnSubnetRange
  L11_12 = A0_1["ifStatic.StaticIp"]
  L12_13 = A0_1["ifStatic.NetMask"]
  L10_11 = L10_11(L11_12, L12_13)
  L8_9 = L10_11
  L10_11 = _UPVALUE0_
  L10_11 = L10_11.SUCCESS
  if L8_9 == L10_11 then
    L10_11 = printCLIError
    L11_12 = "OpenVpn server ip/subnet already configured in same subnet.Please specify IP address in a different subnet."
    L10_11(L11_12)
    L10_11 = false
    return L10_11
  end
  L10_11 = A0_1["ifStatic.NetMask"]
  if L10_11 == nil then
    L10_11 = printCLIError
    L11_12 = "please enter a valid subnet mask"
    L10_11(L11_12)
    L10_11 = false
    return L10_11
  end
  L10_11 = _UPVALUE1_
  L10_11 = L10_11.checkDmzSubnetRange
  L11_12 = A0_1["ifStatic.StaticIp"]
  L12_13 = A0_1["ifStatic.NetMask"]
  L10_11 = L10_11(L11_12, L12_13)
  L8_9 = L10_11
  L10_11 = _UPVALUE0_
  L10_11 = L10_11.SUCCESS
  if L8_9 == L10_11 then
    L10_11 = printCLIError
    L11_12 = "DMZ ip/subnet already configured in same subnet.Please specify IP address in a different subnet."
    L10_11(L11_12)
    L10_11 = false
    return L10_11
  end
  L10_11 = _UPVALUE1_
  L10_11 = L10_11.checkOpenVpnSubnetRange
  L11_12 = A0_1["ifStatic.StaticIp"]
  L12_13 = A0_1["ifStatic.NetMask"]
  L10_11 = L10_11(L11_12, L12_13)
  L8_9 = L10_11
  L10_11 = _UPVALUE0_
  L10_11 = L10_11.SUCCESS
  if L8_9 == L10_11 then
    L10_11 = printCLIError
    L11_12 = "OpenVpn server ip/subnet already configured in same subnet.Please specify IP address in a different subnet."
    L10_11(L11_12)
    L10_11 = false
    return L10_11
  end
  L10_11 = _UPVALUE1_
  L10_11 = L10_11.checkVlanIpRange
  L11_12 = A0_1["ifStatic.StaticIp"]
  L12_13 = A0_1["ifStatic.NetMask"]
  L10_11 = L10_11(L11_12, L12_13)
  L8_9 = L10_11
  L10_11 = _UPVALUE0_
  L10_11 = L10_11.SUCCESS
  if L8_9 == L10_11 then
    L10_11 = printCLIError
    L11_12 = "LAN ip/subnet already configured on some other Interface."
    L10_11(L11_12)
    L10_11 = false
    return L10_11
  end
  L10_11 = A0_1["ifStatic.NetMask"]
  if L10_11 == "0.0.0.0" then
    L10_11 = printCLIError
    L11_12 = "Please enter valid CIDR subnet mask."
    L10_11(L11_12)
    L10_11 = false
    return L10_11
  end
  L10_11 = _UPVALUE1_
  L10_11 = L10_11.checkSubnetMask
  L11_12 = A0_1["ifStatic.NetMask"]
  L10_11 = L10_11(L11_12)
  L11_12 = _UPVALUE0_
  L11_12 = L11_12.FAILURE
  if L10_11 == L11_12 then
    L10_11 = printCLIError
    L11_12 = "Please enter valid subnet Mask"
    L10_11(L11_12)
    L10_11 = false
    return L10_11
  end
  L10_11 = validationsLuaLib
  L10_11 = L10_11.ipv4AddressParametersGet
  L11_12 = A0_1["ifStatic.StaticIp"]
  L12_13 = A0_1["ifStatic.NetMask"]
  L5_6, L1_2, L10_11 = nil, nil, L10_11(L11_12, L12_13)
  L5_6, L1_2, L11_12 = nil, nil, L10_11(L11_12, L12_13)
  L5_6, L1_2, L12_13 = nil, nil, L10_11(L11_12, L12_13)
  L4_5 = L12_13
  L3_4 = L11_12
  _UPVALUE4_ = L10_11
  L10_11 = _UPVALUE4_
  if L10_11 == -1 then
    L10_11 = printCLIError
    L11_12 = "Error occured while calculating the Network address."
    L10_11(L11_12)
    L10_11 = false
    return L10_11
  end
  L10_11 = util
  L10_11 = L10_11.split
  L11_12 = L3_4
  L12_13 = "."
  L10_11 = L10_11(L11_12, L12_13)
  L2_3 = L10_11
  L10_11 = tonumber
  L11_12 = L2_3[1]
  L10_11 = L10_11(L11_12)
  if L10_11 == 0 then
    L10_11 = printCLIError
    L11_12 = "Combination of IP address/Subnet Mask is pointing to invalid network."
    L10_11(L11_12)
    L10_11 = false
    return L10_11
  end
  L10_11 = A0_1["ifStatic.StaticIp"]
  L11_12 = A0_1["ifStatic.NetMask"]
  L12_13 = A0_1["ifStatic.StaticIp"]
  if L3_4 ~= L12_13 then
    L12_13 = A0_1["ifStatic.StaticIp"]
  elseif L4_5 == L12_13 then
    L12_13 = printCLIError
    L12_13("Configured IP address cannot be a network/broadcast address.")
    L12_13 = false
    return L12_13
  end
  L12_13 = nil
  L12_13 = _UPVALUE1_.checkWanSubnetRange(L10_11, L11_12)
  if L12_13 == _UPVALUE0_.SUCCESS then
    if UNIT_NAME == "DSR-1000N" or UNIT_NAME == "DSR-1000" or UNIT_NAME == "DSR-500N" or UNIT_NAME == "DSR-500" then
      printCLIError("WAN1/WAN2 ip/subnet already configured in same subnet.Please specify IP address in a different subnet.")
    else
      printCLIError("WAN ip/subnet already configured in same subnet.Please specify IP address in a different subnet.")
    end
    return false
  end
  if HIGH_SEC == "HIGH" then
    L12_13 = _UPVALUE1_.checkSslClientRange(L10_11, L11_12)
    if L12_13 == _UPVALUE0_.SUCCESS then
      printCLIError("SSL-VPN client range is in the same subnet.Please specify IP address in a different subnet.")
      return false
    end
  end
  L12_13 = _UPVALUE1_.checkDmzSubnetRange(L10_11, L11_12)
  if L12_13 == _UPVALUE0_.SUCCESS then
    printCLIError("DMZ ip/subnet already configured in same subnet.Please specify IP address in a different subnet.")
    return false
  end
  if _UPVALUE1_.checkOpenVpnSubnetRange(A0_1["ifStatic.StaticIp"], A0_1["ifStatic.NetMask"]) == _UPVALUE0_.SUCCESS then
    printCLIError("OpenVPN Network/OpenVPN Remote Network is already " .. "configured in same subnet. Please specify IP address in different " .. "subnet.")
    return false
  end
  if A0_1["dhcp.dhcpEnabled"] == "1" and (A0_1["dhcp.startAddress"] == nil or A0_1["dhcp.startAddress"] == "" or A0_1["dhcp.startAddress"] == "0.0.0.0") then
    printCLIError("Invalid Start IP address")
    return false
  end
  if A0_1["dhcp.dhcpEnabled"] == "1" and _UPVALUE1_.ipv4SingleMaskCheck(_UPVALUE2_, A0_1["dhcp.startAddress"], _UPVALUE3_) == _UPVALUE0_.SUCCESS then
    printCLIError("Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet.")
    return false
  end
  if A0_1["dhcp.dhcpEnabled"] == "1" and _UPVALUE1_.ipv4SingleMaskCheck(A0_1["ifStatic.StaticIp"], A0_1["dhcp.startAddress"], A0_1["ifStatic.NetMask"]) ~= _UPVALUE0_.SUCCESS then
    printCLIError("Start IP should be in same subnet of LAN.")
    return false
  end
  if A0_1["dhcp.dhcpEnabled"] == "1" and _UPVALUE1_.ipv4SingleMaskCheck(A0_1["ifStatic.StaticIp"], A0_1["dhcp.endAddress"], A0_1["ifStatic.NetMask"]) ~= _UPVALUE0_.SUCCESS then
    printCLIError("End IP should be in same subnet of LAN.")
    return false
  end
  if A0_1["dhcp.dhcpEnabled"] == "1" and (A0_1["dhcp.endAddress"] == nil or A0_1["dhcp.endAddress"] == "" or A0_1["dhcp.endAddress"] == "0.0.0.0") then
    printCLIError("Invalid End IP address")
    return false
  end
  if A0_1["dhcp.dhcpEnabled"] == "1" then
    L2_3 = util.split(A0_1["dhcp.startAddress"], ".")
    if L2_3 == nil or tonumber(L2_3[1]) == 224 or tonumber(L2_3[1]) > 224 or tonumber(L2_3[1]) == 0 or A0_1["dhcp.startAddress"] == "0.0.0.0" then
      printCLIError("Invalid start IP address. Please enter a valid IP address.")
      return false
    end
    L2_3 = A0_1["dhcp.startAddress"]
    _UPVALUE4_, L6_7 = validationsLuaLib.ipv4AddrAsciiToNum(L2_3)
    if _UPVALUE4_ == -1 then
      printCLIError("Invalid start IP address. Please enter a valid IP address.")
      return false
    end
    if _UPVALUE1_.ipv4SingleMaskCheck(A0_1["ifStatic.StaticIp"], A0_1["dhcp.startAddress"], A0_1["ifStatic.NetMask"]) ~= _UPVALUE0_.SUCCESS then
      printCLIError("Start IP should be in same subnet .")
      return false
    end
    L2_3 = util.split(A0_1["dhcp.endAddress"], ".")
    if L2_3 == nil or tonumber(L2_3[1]) == 224 or tonumber(L2_3[1]) > 224 or tonumber(L2_3[1]) == 0 or A0_1["dhcp.endAddress"] == "0.0.0.0" then
      printCLIError("Invalid end IP address. Please enter a valid IP address.")
      return false
    end
    L2_3 = A0_1["dhcp.endAddress"]
    _UPVALUE4_, L6_7 = validationsLuaLib.ipv4AddrAsciiToNum(L2_3)
    if _UPVALUE4_ == -1 then
      printCLIError("Invalid end IP address. Please enter a valid IP address.")
      return false
    end
    if _UPVALUE1_.ipv4SingleMaskCheck(A0_1["ifStatic.StaticIp"], A0_1["dhcp.endAddress"], A0_1["ifStatic.NetMask"]) ~= _UPVALUE0_.SUCCESS then
      printCLIError("END IP should be in same subnet .")
      return false
    end
    _UPVALUE4_ = _UPVALUE1_.ipv4AddressesCompare(A0_1["dhcp.startAddress"], A0_1["dhcp.endAddress"])
    if _UPVALUE4_ == 0 or _UPVALUE4_ == 3 then
      printCLIError("End address should be higher than or equal to Start address")
      return false
    end
    if L3_4 == A0_1["dhcp.startAddress"] or L4_5 == A0_1["dhcp.startAddress"] then
      printCLIError("Configured start IP address cannot be a network/broadcast address.")
      return false
    end
    if L3_4 == A0_1["dhcp.endAddress"] or L4_5 == A0_1["dhcp.endAddress"] then
      printCLIError("Configured end IP address cannot be a network/broadcast address.")
      return false
    end
    _UPVALUE4_, range = validationsLuaLib.ipv4TotalAddressesGet(A0_1["dhcp.startAddress"], A0_1["dhcp.endAddress"])
    if _UPVALUE4_ == 0 then
      printCLIError("Invalid Start/End address")
      return false
    end
    if range > tonumber(L7_8) - 1 then
      printCLIError("upto " .. L7_8 .. " addresses are allowed to be configured.")
      return false
    end
  end
  if A0_1["dhcp.dhcpEnabled"] == "1" and (A0_1["dhcp.leaseTime"] == "" or A0_1["dhcp.leaseTime"] == nil) then
    printCLIError("Invalid lease Time")
    return false
  end
  if A0_1["dhcp.dhcpEnabled"] == "1" and (A0_1["dhcp.defaultGw"] == nil or A0_1["dhcp.defaultGw"] == "" or A0_1["dhcp.defaultGw"] == "0.0.0.0") then
    printCLIError("Invalid  default gateway")
    return false
  end
  if A0_1["dhcp.dhcpEnabled"] == "1" and _UPVALUE1_.ipv4SingleMaskCheck(A0_1["dhcp.defaultGw"], A0_1["ifStatic.StaticIp"], A0_1["ifStatic.NetMask"]) ~= _UPVALUE0_.SUCCESS then
    printCLIError("Default Gateway should be in LAN subnet.")
    return false
  end
  if A0_1["dhcp.dhcpEnabled"] == "1" then
    L2_3 = util.split(A0_1["dhcp.defaultGw"], ".")
    if L2_3 == nil or tonumber(L2_3[1]) == 224 or tonumber(L2_3[1]) > 224 or tonumber(L2_3[1]) == 0 or A0_1["dhcp.defaultGw"] == "0.0.0.0" then
      printCLIError("Invalid Gateway IP address. Please enter a valid IP address.")
      return false
    end
    L2_3 = A0_1["dhcp.defaultGw"]
    _UPVALUE4_, L6_7 = validationsLuaLib.ipv4AddrAsciiToNum(L2_3)
    if _UPVALUE4_ == -1 then
      printCLIError("Invalid Gateway IP address. Please enter a valid IP address.")
      return false
    end
    if _UPVALUE1_.ipv4SingleMaskCheck(_UPVALUE2_, A0_1["dhcp.defaultGw"], _UPVALUE3_) == _UPVALUE0_.SUCCESS then
      printCLIError("Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet.")
      return false
    end
    if _UPVALUE1_.ipv4SingleMaskCheck(A0_1["ifStatic.StaticIp"], A0_1["dhcp.defaultGw"], A0_1["ifStatic.NetMask"]) ~= _UPVALUE0_.SUCCESS then
      printCLIError("DEFAULT Gateway IP should be in same subnet.")
      return false
    end
    if L3_4 == A0_1["dhcp.defaultGw"] or L4_5 == A0_1["dhcp.defaultGw"] then
      printCLIError("Configured default gateway IP address cannot be a network/broadcast address.")
      return false
    end
    if A0_1["dhcp.primaryDnsServer"] ~= nil and A0_1["dhcp.primaryDnsServer"] ~= "" then
      Octet = util.split(A0_1["dhcp.primaryDnsServer"], ".")
      if tonumber(Octet[1]) == 224 or 224 < tonumber(Octet[1]) or tonumber(Octet[1]) == 0 or A0_1["dhcp.primaryDnsServer"] == "0.0.0.0" then
        printCLIError("Invalid primaryDnsServer IP address. Please enter a value between 1 - 223 for octet 1")
        return false
      end
      if tonumber(Octet[4]) == 255 or tonumber(Octet[4]) > 254 or tonumber(Octet[4]) == 0 then
        printCLIError("Invalid primaryDnsServer IP address. Please enter a value between 1 - 254 for octet 4")
        return false
      end
    end
    if A0_1["dhcp.secondaryDnsServer"] ~= nil and A0_1["dhcp.secondaryDnsServer"] ~= "" then
      Octet = util.split(A0_1["dhcp.secondaryDnsServer"], ".")
      if tonumber(Octet[1]) == 224 or 224 < tonumber(Octet[1]) or tonumber(Octet[1]) == 0 or A0_1["dhcp.secondaryDnsServer"] == "0.0.0.0" then
        printCLIError("Invalid secondaryDnsServer IP address. Please enter a value between 1 - 223 for octet 1")
        return false
      end
      if tonumber(Octet[4]) == 255 or tonumber(Octet[4]) > 254 or tonumber(Octet[4]) == 0 then
        printCLIError("Invalid secondaryDnsServer  IP address. Please enter a value between 1 - 254 for octet 4")
        return false
      end
    end
    if A0_1["dhcp.winsServer"] ~= nil and A0_1["dhcp.winsServer"] ~= "" then
      Octet = util.split(A0_1["dhcp.winsServer"], ".")
      if tonumber(Octet[1]) == 224 or 224 < tonumber(Octet[1]) or tonumber(Octet[1]) == 0 or A0_1["dhcp.winsServer"] == "0.0.0.0" then
        printCLIError("Invalid WinServer IP address. Please enter a value between 1 - 223 for octet 1")
        return false
      end
      if tonumber(Octet[4]) == 255 or tonumber(Octet[4]) > 254 or tonumber(Octet[4]) == 0 then
        printCLIError("Invalid winServer IP address. Please enter a value between 1 - 254 for octet 4")
        return false
      end
    end
  end
  if A0_1["dhcp.dhcpEnabled"] == "3" and _UPVALUE1_.ipv4SingleMaskCheck(_UPVALUE2_, A0_1["DhcpRelay.RelayGateway"], _UPVALUE3_) == _UPVALUE0_.SUCCESS then
    printCLIError("Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet")
    return false
  end
  if A0_1["dhcp.dhcpEnabled"] == "3" and (A0_1["DhcpRelay.RelayGateway"] == nil or A0_1["DhcpRelay.RelayGateway"] == "") then
    printCLIError("Invalid relay gateway")
    return false
  end
  Octet = util.split(A0_1["DhcpRelay.RelayGateway"], ".")
  if A0_1["dhcp.dhcpEnabled"] == "3" and (tonumber(Octet[1]) == 224 or 224 < tonumber(Octet[1]) or tonumber(Octet[1]) == 0 or A0_1["DhcpRelay.RelayGateway"] == "0.0.0.0") then
    printCLIError("Invalid RelayGateway IP address. Please enter a value between 1 - 223 for octet 1")
    return false
  end
  if A0_1["dhcp.dhcpEnabled"] == "3" and (tonumber(Octet[4]) == 255 or tonumber(Octet[4]) > 254 or tonumber(Octet[4]) == 0) then
    printCLIError("Invalid RelayGateway IP address. Please enter a value between 1 - 254 for octet 4")
    return false
  end
  if A0_1["dhcp.dhcpEnabled"] == "3" and _UPVALUE1_.ipv4SingleMaskCheck(_UPVALUE2_, A0_1["DhcpRelay.RelayGateway"], _UPVALUE3_) == _UPVALUE0_.SUCCESS then
    printCLIError("Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet")
    return false
  end
  if A0_1["dhcp.dhcpEnabled"] == "3" and db.getAttribute("NatTable", "_ROWID_", "1", "Enable") == _UPVALUE5_ then
    printCLIError("Dhcp relay for LAN is not configurable in Transparent Mode")
    return false
  end
  if A0_1["dhcp.domainName"] == nil then
    A0_1["dhcp.domainName"] = ""
  elseif A0_1["dhcp.domainName"] ~= "" then
    status, errStr = validationsLuaLib.domainNameValidation(A0_1["dhcp.domainName"])
    if tonumber(status) ~= 0 then
      printCLIError(errStr)
      return false
    end
  end
  return true
end
function lanIPv6CfgInputVal(A0_14)
  local L1_15, L2_16
  L1_15 = db
  L1_15 = L1_15.getRow
  L2_16 = "networkInfo"
  L1_15 = L1_15(L2_16, "_ROWID_", "1")
  L2_16 = L1_15["networkInfo.netWorkMode"]
  if L2_16 == "1" then
    L2_16 = printCLIError
    L2_16("Please Set IP Mode to IPv4/IPv6 to configure IPv6 LAN Configurations.")
    L2_16 = false
    return L2_16
  end
  L2_16 = A0_14["ifStatic.PrefixLength"]
  if L2_16 ~= nil then
    L2_16 = tonumber
    L2_16 = L2_16(A0_14["ifStatic.PrefixLength"])
    if not (L2_16 < 0) then
      L2_16 = tonumber
      L2_16 = L2_16(A0_14["ifStatic.PrefixLength"])
    end
  elseif L2_16 > 128 then
    L2_16 = printCLIError
    L2_16("Invalid Prefix. Please enter a value between 0 and 128.")
    L2_16 = false
    return L2_16
  end
  L2_16 = A0_14["ifStatic.StaticIp"]
  if L2_16 ~= "" then
    L2_16 = A0_14["ifStatic.StaticIp"]
  elseif L2_16 == nil then
    L2_16 = printCLIError
    L2_16("Please Enter valid IPv6 End Address.")
    L2_16 = false
    return L2_16
  end
  L2_16 = nil
  a, b, c = validations.ipv6AddrValidate(A0_14["ifStatic.StaticIp"], "", "")
  if b ~= "OK" then
    L2_16 = db.getAttribute("stringsMap", "stringId", b, "en_US")
    print(L2_16 .. " for LAN.")
    return false
  end
  L2_16 = validations.ipv6LoopBackCheck(A0_14["ifStatic.StaticIp"])
  if L2_16 ~= "OK" then
    printCLIError(L2_16 .. " for LAN.")
    return false
  end
  if _UPVALUE0_.ipAddressCheck("10", A0_14["ifStatic.StaticIp"]) ~= 0 then
    printCLIError("please check the number of octets for ipv6 address\n")
    return false
  end
  return true
end
function lanIPv6CfgPoolInputVal(A0_17)
  local L1_18, L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26, L10_27
  L1_18 = db
  L1_18 = L1_18.getRow
  L2_19 = "networkInfo"
  L3_20 = "_ROWID_"
  L4_21 = "1"
  L1_18 = L1_18(L2_19, L3_20, L4_21)
  L2_19 = L1_18["networkInfo.netWorkMode"]
  if L2_19 == "1" then
    L2_19 = printCLIError
    L3_20 = "Please Set IP Mode to IPv4/IPv6 to configure IPv6 LAN Configurations."
    L2_19(L3_20)
    L2_19 = false
    return L2_19
  end
  L2_19 = A0_17["dhcpv6sLANAddrPool.vlanId"]
  if L2_19 == nil then
    L2_19 = printCLIError
    L3_20 = "Vlan Id is not Valid"
    L2_19(L3_20)
    L2_19 = false
    return L2_19
  end
  L2_19 = A0_17["dhcpv6sLANAddrPool.vlanId"]
  L3_20 = db
  L3_20 = L3_20.getRow
  L4_21 = "vlan"
  L5_22 = "vlanId"
  L6_23 = L2_19
  L3_20 = L3_20(L4_21, L5_22, L6_23)
  if L3_20 == nil then
    L4_21 = printCLIError
    L5_22 = "No Row exist with this Vlan ID"
    L4_21(L5_22)
    L4_21 = false
    return L4_21
  end
  L4_21 = db
  L4_21 = L4_21.getAttribute
  L5_22 = "vlan"
  L6_23 = "vlanId"
  L7_24 = L2_19
  L8_25 = "vlanName"
  L4_21 = L4_21(L5_22, L6_23, L7_24, L8_25)
  if L4_21 then
    L5_22 = "vlanName = '"
    L6_23 = L4_21
    L7_24 = "' and vlanId = '"
    L8_25 = L2_19
    L9_26 = "'"
    L5_22 = L5_22 .. L6_23 .. L7_24 .. L8_25 .. L9_26
    L6_23 = db
    L6_23 = L6_23.getAttributeWhere
    L7_24 = "vlan"
    L8_25 = L5_22
    L9_26 = "vlanIPv6"
    L6_23 = L6_23(L7_24, L8_25, L9_26)
    if L6_23 ~= "1" then
      L7_24 = printCLIError
      L8_25 = "Enabled IPv6 first for selected vlan interface."
      L7_24(L8_25)
      L7_24 = false
      return L7_24
    end
  end
  if L2_19 == "1" then
    L2_19 = ""
  end
  L5_22 = "LAN"
  L6_23 = L2_19
  L5_22 = L5_22 .. L6_23
  A0_17["dhcpv6sLANAddrPool.interfaceName"] = L5_22
  L6_23 = "LogicalIfName = '"
  L7_24 = L5_22
  L8_25 = "' and addressFamily = 10"
  L6_23 = L6_23 .. L7_24 .. L8_25
  L7_24 = A0_17["dhcpv6sLANAddrPool.startAddress"]
  if L7_24 ~= "" then
    L7_24 = A0_17["dhcpv6sLANAddrPool.startAddress"]
  elseif L7_24 == nil then
    L7_24 = printCLIError
    L8_25 = "Please Enter valid IPv6 Start Address."
    L7_24(L8_25)
    L7_24 = false
    return L7_24
  end
  L7_24 = validations
  L7_24 = L7_24.ipv6AddrValidate
  L8_25 = A0_17["dhcpv6sLANAddrPool.startAddress"]
  L9_26 = ""
  L10_27 = ""
  L9_26 = L7_24(L8_25, L9_26, L10_27)
  field = L9_26
  status = L8_25
  flag = L7_24
  L7_24 = status
  if L7_24 ~= "OK" then
    L7_24 = printCLIError
    L8_25 = "please check the number of octets for ipv6 address\n"
    L7_24(L8_25)
    L7_24 = false
    return L7_24
  end
  L7_24 = _UPVALUE0_
  L7_24 = L7_24.ipAddressCheck
  L8_25 = "10"
  L9_26 = A0_17["dhcpv6sLANAddrPool.startAddress"]
  L7_24 = L7_24(L8_25, L9_26)
  if L7_24 ~= 0 then
    L8_25 = printCLIError
    L9_26 = "please check the number of octets for ipv6 address\n"
    L8_25(L9_26)
    L8_25 = false
    return L8_25
  end
  L8_25 = A0_17["dhcpv6sLANAddrPool.endAddress"]
  if L8_25 ~= "" then
    L8_25 = A0_17["dhcpv6sLANAddrPool.endAddress"]
  elseif L8_25 == nil then
    L8_25 = printCLIError
    L9_26 = "Please Enter valid IPv6 End Address."
    L8_25(L9_26)
    L8_25 = false
    return L8_25
  end
  L8_25 = validations
  L8_25 = L8_25.ipv6AddrValidate
  L9_26 = A0_17["dhcpv6sLANAddrPool.endAddress"]
  L10_27 = ""
  L10_27 = L8_25(L9_26, L10_27, "")
  field = L10_27
  status = L9_26
  flag = L8_25
  L8_25 = status
  if L8_25 ~= "OK" then
    L8_25 = printCLIError
    L9_26 = "please check the number of octets for ipv6 address\n"
    L8_25(L9_26)
    L8_25 = false
    return L8_25
  end
  L8_25 = _UPVALUE0_
  L8_25 = L8_25.ipAddressCheck
  L9_26 = "10"
  L10_27 = A0_17["dhcpv6sLANAddrPool.endAddress"]
  L8_25 = L8_25(L9_26, L10_27)
  if L8_25 ~= 0 then
    L9_26 = printCLIError
    L10_27 = "please check the number of octets for ipv6 address\n"
    L9_26(L10_27)
    L9_26 = false
    return L9_26
  end
  L9_26 = A0_17["dhcpv6sLANAddrPool.prefixLength"]
  if L9_26 ~= nil then
    L9_26 = tonumber
    L10_27 = A0_17["dhcpv6sLANAddrPool.prefixLength"]
    L9_26 = L9_26(L10_27)
    if not (L9_26 < 0) then
      L9_26 = tonumber
      L10_27 = A0_17["dhcpv6sLANAddrPool.prefixLength"]
      L9_26 = L9_26(L10_27)
    end
  elseif L9_26 > 128 then
    L9_26 = printCLIError
    L10_27 = "Invalid Prefix. Please enter a value between 0 and 128."
    L9_26(L10_27)
    L9_26 = false
    return L9_26
  end
  L9_26 = _UPVALUE0_
  L9_26 = L9_26.ipv6SingleMaskCheck
  L10_27 = A0_17["dhcpv6sLANAddrPool.startAddress"]
  L10_27 = L9_26(L10_27, A0_17["dhcpv6sLANAddrPool.endAddress"], A0_17["dhcpv6sLANAddrPool.prefixLength"])
  if L9_26 ~= 0 then
    printCLIError(L10_27)
    return false
  end
  if _UPVALUE0_.ipv6DualMaskCheck(A0_17["dhcpv6sLANAddrPool.startAddress"], A0_17["dhcpv6sLANAddrPool.prefixLength"], db.getRowWhere("ifStatic", L6_23)["ifStatic" .. "." .. "StaticIp"], db.getRowWhere("ifStatic", L6_23)["ifStatic" .. "." .. "PrefixLength"]) ~= 0 then
    printCLIError("Configured IPv6 addresses should belong to Interface IP address range")
    return false
  end
  return true
end
function PrefixIPv6InputVal(A0_28)
  local L1_29, L2_30, L3_31, L4_32, L5_33
  L1_29 = db
  L1_29 = L1_29.getRow
  L2_30 = "networkInfo"
  L3_31 = "_ROWID_"
  L4_32 = "1"
  L1_29 = L1_29(L2_30, L3_31, L4_32)
  L2_30 = L1_29["networkInfo.netWorkMode"]
  if L2_30 == "1" then
    L2_30 = printCLIError
    L3_31 = "Please Set IP Mode to IPv4/IPv6 to configure IPv6 LAN Configurations."
    L2_30(L3_31)
    L2_30 = false
    return L2_30
  end
  L2_30 = A0_28["dhcpv6sLANPrefixPool.vlanId"]
  if L2_30 == nil then
    L2_30 = printCLIError
    L3_31 = "Vlan Id is not Valid"
    L2_30(L3_31)
    L2_30 = false
    return L2_30
  end
  L2_30 = A0_28["dhcpv6sLANPrefixPool.vlanId"]
  L3_31 = db
  L3_31 = L3_31.getRow
  L4_32 = "vlan"
  L5_33 = "vlanId"
  L3_31 = L3_31(L4_32, L5_33, L2_30)
  if L3_31 == nil then
    L4_32 = printCLIError
    L5_33 = "No Row exist with this Vlan ID"
    L4_32(L5_33)
    L4_32 = false
    return L4_32
  end
  L4_32 = db
  L4_32 = L4_32.getAttribute
  L5_33 = "vlan"
  L4_32 = L4_32(L5_33, "vlanId", L2_30, "vlanName")
  if L4_32 then
    L5_33 = "vlanName = '"
    L5_33 = L5_33 .. L4_32 .. "' and vlanId = '" .. L2_30 .. "'"
    if db.getAttributeWhere("vlan", L5_33, "vlanIPv6") ~= "1" then
      printCLIError("Enabled IPv6 first for selected vlan interface.")
      return false
    end
  end
  if L2_30 == "1" then
    L2_30 = ""
  end
  L5_33 = "LAN"
  L5_33 = L5_33 .. L2_30
  A0_28["dhcpv6sLANPrefixPool.interfaceName"] = L5_33
  if A0_28["dhcpv6sLANPrefixPool.delegationPrefix"] == "" or A0_28["dhcpv6sLANPrefixPool.delegationPrefix"] == nil then
    printCLIError("Please Enter valid IPv6 prefix Address.")
    return false
  end
  flag, status, field = validations.ipv6AddrValidate(A0_28["dhcpv6sLANPrefixPool.delegationPrefix"], "", "")
  if status ~= "OK" then
    printCLIError("please check the number of octets for ipv6 prefix address\n")
    return false
  end
  if _UPVALUE0_.ipAddressCheck("10", A0_28["dhcpv6sLANPrefixPool.delegationPrefix"]) ~= 0 then
    printCLIError("please check the number of octets for ipv6 prefix address\n")
    return false
  end
  if A0_28["dhcpv6sLANPrefixPool.delegationPrefixLen"] == nil or 0 > tonumber(A0_28["dhcpv6sLANPrefixPool.delegationPrefixLen"]) or tonumber(A0_28["dhcpv6sLANPrefixPool.delegationPrefixLen"]) > 128 then
    printCLIError("Invalid Prefix. Please enter a value between 0 and 128.")
    return false
  end
  return true
end
function lanCfgSave(A0_34)
  local L1_35, L2_36, L3_37, L4_38, L5_39, L6_40, L7_41
  L1_35 = db
  L1_35 = L1_35.getRowWhere
  L2_36 = "ifStatic"
  L3_37 = "LogicalIfName = 'DMZ' AND AddressFamily = 2"
  L1_35 = L1_35(L2_36, L3_37)
  if L1_35 ~= nil then
    L2_36 = L1_35["ifStatic.StaticIp"]
    L3_37 = A0_34["ifStatic.StaticIp"]
    if L2_36 == L3_37 then
      L2_36 = "ERROR"
      L3_37 = "IP_CONFLICTING_WITH_DMZ_IPADDR"
      statusCode = L3_37
      errorFlag = L2_36
    end
  else
    L2_36 = "LogicalIfName = 'LAN' AND AddressFamily = 2"
    L3_37 = db
    L3_37 = L3_37.existsRowWhere
    L4_38 = "ifStatic"
    L5_39 = L2_36
    L3_37 = L3_37(L4_38, L5_39)
    L4_38 = lan
    L4_38 = L4_38.ipv4LanConfig
    L5_39 = A0_34
    L6_40 = A0_34["ifStatic._ROWID_"]
    L5_39 = L4_38(L5_39, L6_40, L7_41)
    statusCode = L5_39
    errorFlag = L4_38
    L4_38 = errorFlag
    if L4_38 == "OK" then
      L4_38 = db
      L4_38 = L4_38.existsRowWhere
      L5_39 = "vlan"
      L6_40 = "vlanId=1 and portName='dummy'"
      L4_38 = L4_38(L5_39, L6_40)
      L5_39 = db
      L5_39 = L5_39.getAttribute
      L6_40 = "vlan"
      L5_39 = L5_39(L6_40, L7_41, L4_38, "vlanName")
      L6_40 = db
      L6_40 = L6_40.getRowsWhere
      L6_40 = L6_40(L7_41, "vlanName= '" .. L5_39 .. "'")
      for _FORV_10_, _FORV_11_ in L7_41(L6_40) do
        serviceRoute = L6_40[_FORV_10_]
        serviceRoute["ServicesRouteMgmt" .. "." .. "sourceIPAddress"] = A0_34["ifStatic.StaticIp"]
      end
      db.save()
      errorFlag, statusCode = dhcp.dhcpConfigWrap(A0_34, "LAN")
      if errorFlag == "OK" then
        db.save()
        errorFlag, statusCode = dproxy.dnsConfig(A0_34)
        if errorFlag == "OK" then
          db.save()
        end
      end
    end
  end
  L2_36 = errorFlag
  if L2_36 == "OK" then
    L2_36 = db
    L2_36 = L2_36.save
    L2_36()
  end
  L2_36 = db
  L2_36 = L2_36.getAttribute
  L3_37 = "stringsMap"
  L4_38 = "stringId"
  L5_39 = statusCode
  L6_40 = LANGUAGE
  L2_36 = L2_36(L3_37, L4_38, L5_39, L6_40)
  L2_36 = L2_36 or ""
  statusMessage = L2_36
  L2_36 = errorFlag
  L3_37 = statusMessage
  return L2_36, L3_37
end
function lanIPv6CfgSave(A0_42)
  local L1_43, L2_44, L3_45, L4_46, L5_47
  L2_44 = ""
  L3_45 = nil
  L4_46 = "LogicalIfName = 'LAN' AND AddressFamily = '10'"
  L5_47 = db
  L5_47 = L5_47.existsRowWhere
  L5_47 = L5_47("ifStatic", L4_46)
  if lan.ipv6LanConfig(A0_42, L5_47, "edit") then
    L2_44 = "STATUS_OK"
    L1_43 = "OK"
    db.save()
  else
    L1_43 = "ERROR"
    L2_44 = "LAN_CONFIG_FAILED"
  end
  L3_45 = db.getAttribute("stringsMap", "stringId", L2_44, LANGUAGE)
  return L1_43, L3_45
end
function lanIPv6CfgInit(A0_48)
  local L1_49, L2_50, L3_51
  L1_49 = db
  L1_49 = L1_49.getRow
  L2_50 = "dhcpv6s"
  L3_51 = "_ROWID_"
  L1_49 = L1_49(L2_50, L3_51, "1")
  configRow = L1_49
  L1_49 = configRow
  if L1_49 == nil then
    L1_49 = db
    L1_49 = L1_49.getDefaults
    L2_50 = true
    L3_51 = "dhcpv6s"
    L1_49 = L1_49(L2_50, L3_51)
    configRow = L1_49
  end
  L1_49 = {}
  L2_50 = "LogicalIfName = 'LAN' AND AddressFamily = 10"
  L3_51 = db
  L3_51 = L3_51.existsRowWhere
  L3_51 = L3_51("ifStatic", L2_50)
  L1_49 = db.getRow("ifStatic", "_ROWID_", L3_51)
  if L1_49 ~= nil then
    configRow["ifStatic.StaticIp"] = L1_49["ifStatic.StaticIp"]
    configRow["ifStatic.PrefixLength"] = L1_49["ifStatic.PrefixLength"]
  end
  return L3_51, configRow
end
function lanCfgInit(A0_52)
  local L1_53, L2_54, L3_55, L4_56, L5_57, L6_58, L7_59, L8_60, L9_61, L10_62, L11_63
  L1_53 = "LogicalIfName = 'LAN' AND AddressFamily = 2"
  L2_54 = db
  L2_54 = L2_54.existsRowWhere
  L3_55 = "ifStatic"
  L4_56 = L1_53
  L2_54 = L2_54(L3_55, L4_56)
  L3_55 = db
  L3_55 = L3_55.getRow
  L4_56 = "ifStatic"
  L5_57 = "_ROWID_"
  L3_55 = L3_55(L4_56, L5_57, L6_58)
  configRow = L3_55
  L3_55 = configRow
  L3_55["vlan.vlanId"] = "1"
  L3_55 = db
  L3_55 = L3_55.getRow
  L4_56 = "dhcp"
  L5_57 = "logicalIfName"
  L3_55 = L3_55(L4_56, L5_57, L6_58)
  if L3_55 ~= nil then
    L4_56 = configRow
    L5_57 = L3_55["dhcp.dhcpEnabled"]
    L4_56["dhcp.dhcpEnabled"] = L5_57
    L4_56 = configRow
    L4_56 = L4_56["dhcp.dhcpEnabled"]
    if L4_56 ~= 0 then
      L4_56 = configRow
      L5_57 = L3_55["dhcp.domainName"]
      L4_56["dhcp.domainName"] = L5_57
      L4_56 = configRow
      L5_57 = L3_55["dhcp.startAddress"]
      L4_56["dhcp.startAddress"] = L5_57
      L4_56 = configRow
      L5_57 = L3_55["dhcp.endAddress"]
      L4_56["dhcp.endAddress"] = L5_57
      L4_56 = configRow
      L5_57 = L3_55["dhcp.defaultGw"]
      L4_56["dhcp.defaultGw"] = L5_57
      L4_56 = configRow
      L4_56["dhcp.primaryDnsServer"] = ""
      L4_56 = configRow
      L4_56["dhcp.secondaryDnsServer"] = ""
      L4_56 = configRow
      L4_56["dhcp.winsServer"] = ""
      L4_56 = configRow
      L5_57 = L3_55["dhcp.leaseTime"]
      L4_56["dhcp.leaseTime"] = L5_57
      L4_56 = configRow
      L4_56["dhcp.enableDnsProxy"] = "1"
    end
  end
  L4_56 = 0
  L5_57 = db
  L5_57 = L5_57.getTable
  L5_57 = L5_57(L6_58)
  for L9_61, L10_62 in L6_58(L7_59) do
    L4_56 = L4_56 + 1
    L11_63 = {}
    configRow1 = L11_63
    L11_63 = db
    L11_63 = L11_63.getRow
    L11_63 = L11_63("DnsStaticHostsMapping", "_ROWID_", L4_56)
    configRow1 = L11_63
    L11_63 = configRow1
    L11_63 = L11_63["DnsStaticHostsMapping._ROWID_"]
    configRow["DnsStaticHostsMapping.HostName" .. L11_63] = configRow1["DnsStaticHostsMapping.HostName"]
    configRow["DnsStaticHostsMapping.IpAddress" .. L11_63] = configRow1["DnsStaticHostsMapping.IpAddress"]
  end
  L9_61 = "LAN"
  if L6_58 ~= nil then
    if L7_59 == "1" then
      L7_59["dhcp.dhcpEnabled"] = "3"
    end
    L7_59["DhcpRelay.RelayGateway"] = L8_60
  end
  L9_61 = "_ROWID_"
  L10_62 = "1"
  if L7_59 ~= nil then
    L9_61 = L7_59["Igmp.IgmpEnable"]
    L8_60["Igmp.IgmpEnable"] = L9_61
  end
  L9_61 = configRow
  return L8_60, L9_61
end
function lanIPv6SetupGet(A0_64)
  local L1_65, L2_66, L3_67, L4_68, L5_69, L6_70, L7_71, L8_72, L9_73, L10_74, L11_75, L12_76, L13_77, L14_78, L15_79, L16_80, L17_81, L18_82, L19_83, L20_84
  L1_65 = {}
  L2_66 = {}
  L3_67 = db
  L3_67 = L3_67.getRow
  L4_68 = "dhcpv6s"
  L5_69 = "_ROWID_"
  L6_70 = "1"
  L3_67 = L3_67(L4_68, L5_69, L6_70)
  L4_68 = "LogicalIfName = 'LAN' AND AddressFamily = 10"
  L5_69 = db
  L5_69 = L5_69.existsRowWhere
  L6_70 = "ifStatic"
  L7_71 = L4_68
  L5_69 = L5_69(L6_70, L7_71)
  L6_70 = db
  L6_70 = L6_70.getRow
  L7_71 = "ifStatic"
  L8_72 = "_ROWID_"
  L9_73 = L5_69
  L6_70 = L6_70(L7_71, L8_72, L9_73)
  L7_71 = db
  L7_71 = L7_71.getTable
  L8_72 = "dhcpv6sLANAddrPool"
  L7_71 = L7_71(L8_72)
  L8_72 = nil
  L9_73 = 0
  L10_74 = db
  L10_74 = L10_74.getRow
  L10_74 = L10_74(L11_75, L12_76, L13_77)
  if L11_75 == "1" then
    L11_75(L12_76)
    return L11_75
  end
  L11_75(L12_76)
  L14_78 = ""
  L11_75(L12_76, L13_77, L14_78)
  if L6_70 ~= nil then
    L14_78 = L6_70["ifStatic.StaticIp"]
    L14_78 = L14_78 or ""
    L11_75(L12_76, L13_77, L14_78)
    L14_78 = L6_70["ifStatic.PrefixLength"]
    L14_78 = L14_78 or ""
    L11_75(L12_76, L13_77, L14_78)
  end
  L14_78 = ""
  L11_75(L12_76, L13_77, L14_78)
  if L3_67 ~= nil then
    if L11_75 == "1" then
      L14_78 = "Enable DHCPv6 Server"
      L11_75(L12_76, L13_77, L14_78)
    else
      L14_78 = "Disable DHCPv6 Server"
      L11_75(L12_76, L13_77, L14_78)
    end
    if L11_75 == "1" then
      L14_78 = "Stateless"
      L11_75(L12_76, L13_77, L14_78)
    else
      L14_78 = "Stateful"
      L11_75(L12_76, L13_77, L14_78)
    end
    L14_78 = L3_67["dhcpv6s.domainName"]
    L14_78 = L14_78 or ""
    L11_75(L12_76, L13_77, L14_78)
    L14_78 = L3_67["dhcpv6s.serverPreference"]
    L14_78 = L14_78 or ""
    L11_75(L12_76, L13_77, L14_78)
    if L11_75 == "1" then
      L14_78 = "Use DNS Proxy"
      L11_75(L12_76, L13_77, L14_78)
    elseif L11_75 == "2" then
      L14_78 = "Use DNS from ISP"
      L11_75(L12_76, L13_77, L14_78)
    elseif L11_75 == "3" then
      L14_78 = "Use Below"
      L11_75(L12_76, L13_77, L14_78)
      L14_78 = L3_67["dhcpv6s.primaryDNSServer"]
      L14_78 = L14_78 or ""
      L11_75(L12_76, L13_77, L14_78)
      L14_78 = L3_67["dhcpv6s.secondaryDNSServer"]
      L14_78 = L14_78 or ""
      L11_75(L12_76, L13_77, L14_78)
    end
    L14_78 = L3_67["dhcpv6s.leaseTime"]
    L14_78 = L14_78 or ""
    L11_75(L12_76, L13_77, L14_78)
  end
  for L14_78, L15_79 in L11_75(L12_76) do
    L9_73 = L9_73 + 1
    L16_80 = L7_71[L9_73]
    if L9_73 ~= nil then
      L17_81 = resTab
      L17_81 = L17_81.insertField
      L18_82 = L2_66
      L19_83 = "Start Address"
      L20_84 = L16_80["dhcpv6sLANAddrPool.startAddress"]
      L20_84 = L20_84 or ""
      L17_81(L18_82, L19_83, L20_84)
      L17_81 = resTab
      L17_81 = L17_81.insertField
      L18_82 = L2_66
      L19_83 = "End Address"
      L20_84 = L16_80["dhcpv6sLANAddrPool.endAddress"]
      L20_84 = L20_84 or ""
      L17_81(L18_82, L19_83, L20_84)
      L17_81 = resTab
      L17_81 = L17_81.insertField
      L18_82 = L2_66
      L19_83 = "Prefix Length"
      L20_84 = L16_80["dhcpv6sLANAddrPool.prefixLength"]
      L20_84 = L20_84 or ""
      L17_81(L18_82, L19_83, L20_84)
      L17_81 = L16_80["dhcpv6sLANAddrPool.interfaceName"]
      L18_82 = string
      L18_82 = L18_82.sub
      L19_83 = L17_81
      L20_84 = 4
      L18_82 = L18_82(L19_83, L20_84)
      if L18_82 == nil or L18_82 == "" then
        L18_82 = "1"
      end
      L19_83 = db
      L19_83 = L19_83.getAttribute
      L20_84 = "vlan"
      L19_83 = L19_83(L20_84, "vlanId", L18_82, "vlanName")
      L20_84 = resTab
      L20_84 = L20_84.insertField
      L20_84(L2_66, "Interface", L19_83 or "")
      if L19_83 then
        L20_84 = "vlanName = '"
        L20_84 = L20_84 .. L19_83 .. "' and vlanId = '" .. L18_82 .. "'"
        if db.getAttributeWhere("vlan", L20_84, "vlanIPv6") == "1" then
          resTab.insertField(L2_66, "IPv6 Status", "Enabled")
        else
          resTab.insertField(L2_66, "IPv6 Status", "Disabled")
        end
      end
    end
  end
  L11_75(L12_76, L13_77)
  L11_75(L12_76)
  L11_75(L12_76, L13_77)
end
function prefixIPv6SetupGet(A0_85)
  local L1_86, L2_87, L3_88, L4_89, L5_90, L6_91, L7_92, L8_93, L9_94, L10_95, L11_96, L12_97, L13_98, L14_99
  L1_86 = {}
  L2_87 = db
  L2_87 = L2_87.getTable
  L3_88 = "dhcpv6sLANPrefixPool"
  L2_87 = L2_87(L3_88)
  L3_88 = nil
  L4_89 = 0
  L5_90(L6_91)
  for L8_93, L9_94 in L5_90(L6_91) do
    L4_89 = L4_89 + 1
    L10_95 = L2_87[L4_89]
    if L4_89 ~= nil then
      L11_96 = resTab
      L11_96 = L11_96.insertField
      L12_97 = L1_86
      L13_98 = "Prefix Address"
      L14_99 = L10_95["dhcpv6sLANPrefixPool.delegationPrefix"]
      L14_99 = L14_99 or ""
      L11_96(L12_97, L13_98, L14_99)
      L11_96 = resTab
      L11_96 = L11_96.insertField
      L12_97 = L1_86
      L13_98 = "Prefix Length"
      L14_99 = L10_95["dhcpv6sLANPrefixPool.delegationPrefixLen"]
      L14_99 = L14_99 or ""
      L11_96(L12_97, L13_98, L14_99)
      L11_96 = L10_95["dhcpv6sLANPrefixPool.interfaceName"]
      L12_97 = string
      L12_97 = L12_97.sub
      L13_98 = L11_96
      L14_99 = 4
      L12_97 = L12_97(L13_98, L14_99)
      if L12_97 == nil or L12_97 == "" then
        L12_97 = "1"
      end
      L13_98 = db
      L13_98 = L13_98.getAttribute
      L14_99 = "vlan"
      L13_98 = L13_98(L14_99, "vlanId", L12_97, "vlanName")
      L14_99 = resTab
      L14_99 = L14_99.insertField
      L14_99(L1_86, "Interface", L13_98 or "")
      if L13_98 then
        L14_99 = "vlanName = '"
        L14_99 = L14_99 .. L13_98 .. "' and vlanId = '" .. L12_97 .. "'"
        if db.getAttributeWhere("vlan", L14_99, "vlanIPv6") == "1" then
          resTab.insertField(L1_86, "IPv6 Status", "Enabled")
        else
          resTab.insertField(L1_86, "IPv6 Status", "Disabled")
        end
      end
    end
  end
  L5_90(L6_91, L7_92)
end
function lanSetupGet(A0_100)
  local L1_101, L2_102, L3_103, L4_104
  L1_101 = {}
  L2_102 = nil
  L3_103 = "LogicalIfName = 'LAN' AND AddressFamily = 2"
  L4_104 = db
  L4_104 = L4_104.existsRowWhere
  L4_104 = L4_104("ifStatic", L3_103)
  printLabel("LAN Setup")
  resTab.insertField(L1_101, "LAN TCP/IP Setup", "")
  if db.getRow("ifStatic", "_ROWID_", L4_104) ~= nil then
    resTab.insertField(L1_101, "IPv4 Address", db.getRow("ifStatic", "_ROWID_", L4_104)["ifStatic.StaticIp"] or "")
    resTab.insertField(L1_101, "Subnet Mask", db.getRow("ifStatic", "_ROWID_", L4_104)["ifStatic.NetMask"] or "")
  end
  resTab.insertField(L1_101, "DHCP Setup Configuration", "")
  dhcpTable = db.getRow("dhcp", "_ROWID_", 1)
  dhcpRelayTable = db.getRow("DhcpRelay", "_ROWID_", 1)
  if dhcpTable ~= nil and dhcpRelayTable ~= nil then
    if dhcpTable["dhcp.dhcpEnabled"] == "0" and dhcpRelayTable["DhcpRelay.DhcpRelayStatus"] == "1" then
      resTab.insertField(L1_101, "DHCP Mode", "DHCP Relay")
    end
    if dhcpTable["dhcp.dhcpEnabled"] == "1" and dhcpRelayTable["DhcpRelay.DhcpRelayStatus"] == "0" then
      resTab.insertField(L1_101, "DHCP Mode", "DHCP Server")
    end
    if dhcpTable["dhcp.dhcpEnabled"] == "0" and dhcpRelayTable["DhcpRelay.DhcpRelayStatus"] == "0" then
      resTab.insertField(L1_101, "DHCP Mode", "None")
    end
    if dhcpTable["dhcp.dhcpEnabled"] == "1" then
      resTab.insertField(L1_101, "Default Gateway", dhcpTable["dhcp.defaultGw"] or "")
      resTab.insertField(L1_101, "Domain Name", dhcpTable["dhcp.domainName"] or "")
      resTab.insertField(L1_101, "Starting IP Address", dhcpTable["dhcp.startAddress"] or "")
      resTab.insertField(L1_101, "Ending IP Address", dhcpTable["dhcp.endAddress"] or "")
      resTab.insertField(L1_101, "Primary DNS Server", dhcpTable["dhcp.primaryDnsServer"] or "")
      resTab.insertField(L1_101, "Secondary DNS Server", dhcpTable["dhcp.secondaryDnsServer"] or "")
      resTab.insertField(L1_101, "WINS Server", dhcpTable["dhcp.winsServer"] or "")
      resTab.insertField(L1_101, "Lease Time in hrs ", dhcpTable["dhcp.leaseTime"] or "")
    elseif dhcpRelayTable["DhcpRelay.DhcpRelayStatus"] == "1" then
      resTab.insertField(L1_101, "Relay Gateway", dhcpRelayTable["DhcpRelay.RelayGateway"] or "")
    end
  end
  IgmpTable = db.getRow("Igmp", "_ROWID_", 1)
  resTab.insertField(L1_101, "LAN Proxies", "")
  if dhcpTable["dhcp.enableDnsProxy"] == "1" then
    resTab.insertField(L1_101, "DNS Proxy", " Enabled")
  else
    resTab.insertField(L1_101, "DNS Proxy", " Disabled")
  end
  resTab.print(L1_101, 0)
end
function lanIPv6PoolInit(A0_105)
  local L1_106, L2_107, L3_108
  L1_106 = A0_105[1]
  L2_107 = -1
  L3_108 = db
  L3_108 = L3_108.getRow
  L3_108 = L3_108("dhcpv6sLANAddrPool", "startAddress", L1_106)
  if L3_108 == nil then
    L3_108 = {}
    L3_108["dhcpv6sLANAddrPool.startAddress"] = L1_106
    L3_108["dhcpv6sLANAddrPool._ROWID_"] = "-1"
  else
    L2_107 = L3_108["dhcpv6sLANAddrPool._ROWID_"]
  end
  return L2_107, L3_108
end
function PrefixIPv6Init(A0_109)
  local L1_110, L2_111, L3_112
  L1_110 = A0_109[1]
  L2_111 = -1
  L3_112 = db
  L3_112 = L3_112.getRow
  L3_112 = L3_112("dhcpv6sLANPrefixPool", "delegationPrefix", L1_110)
  if L3_112 == nil then
    L3_112 = {}
    L3_112["dhcpv6sLANPrefixPool.delegationPrefix"] = L1_110
    L3_112["dhcpv6sLANPrefixPool._ROWID_"] = "-1"
  else
    L2_111 = L3_112["dhcpv6sLANPrefixPool._ROWID_"]
  end
  return L2_111, L3_112
end
function lanIPv6PoolSave(A0_113)
  local L1_114, L2_115, L3_116
  L2_115 = ""
  L3_116 = nil
  DBTable = "dhcpv6sLANAddrPool"
  if A0_113["dhcpv6sLANAddrPool._ROWID_"] == "-1" then
    L1_114, L2_115 = lan.poolConfig(A0_113, "-1", "add")
  else
    L1_114, L2_115 = lan.poolConfig(A0_113, A0_113["dhcpv6sLANAddrPool._ROWID_"], "edit")
  end
  if L1_114 == "OK" then
    db.save()
  end
  L3_116 = db.getAttribute("stringsMap", "stringId", L2_115, LANGUAGE)
  return L1_114, L3_116
end
function lanIPv6PoolDel(A0_117)
  local L1_118, L2_119, L3_120, L4_121, L5_122
  L2_119 = ""
  L3_120 = nil
  L4_121 = "dhcpv6sLANAddrPool"
  DBTable = L4_121
  L4_121 = A0_117
  L5_122 = -1
  if db.getRow("dhcpv6sLANAddrPool", "startAddress", L4_121) == nil then
    printCLIError("Start Address doesn't match with any of the configuration")
    return false
  else
    L5_122 = db.getRow("dhcpv6sLANAddrPool", "startAddress", L4_121)["dhcpv6sLANAddrPool._ROWID_"]
  end
  row = {}
  row._ROWID_ = db.getRow("dhcpv6sLANAddrPool", "startAddress", L4_121)["dhcpv6sLANAddrPool._ROWID_"]
  L1_118, L2_119 = lan.lanPoolsDelete(row)
  if L1_118 == "OK" then
    db.save()
    print("Row deleted")
  end
  L3_120 = db.getAttribute("stringsMap", "stringId", L2_119, LANGUAGE)
  return L1_118, L3_120
end
function PrefixIPv6Save(A0_123)
  local L1_124, L2_125, L3_126, L4_127
  L2_125 = ""
  L3_126, L4_127 = nil, nil
  DBTable = "dhcpv6sLANPrefixPool"
  A0_123["ipv6PrefixLength.prefix"] = A0_123["dhcpv6sLANPrefixPool.delegationPrefix"]
  A0_123["ipv6PrefixLength.prefixLength"] = A0_123["dhcpv6sLANPrefixPool.delegationPrefixLen"]
  A0_123["ipv6PrefixLength.vlanInterface"] = A0_123["dhcpv6sLANPrefixPool.interfaceName"]
  if A0_123["dhcpv6sLANPrefixPool._ROWID_"] == "-1" then
    L1_124, L4_127 = _UPVALUE0_.dhcpPrefixPoolSectionCreate(A0_123)
  else
    A0_123["ipv6PrefixLength.cookie"] = A0_123["dhcpv6sLANPrefixPool._ROWID_"]
    L1_124, L4_127 = _UPVALUE0_.dhcpPrefixPoolSectionSet(A0_123)
  end
  L3_126 = _UPVALUE1_.errorStringGet(L1_124)
  if L1_124 == 0 then
    L1_124 = "OK"
    db.save()
  else
    L1_124 = "ERROR"
  end
  return L1_124, L3_126
end
function PrefixIPv6Del(A0_128)
  local L1_129, L2_130, L3_131, L4_132, L5_133, L6_134, L7_135
  L2_130 = ""
  L3_131, L4_132 = nil, nil
  L5_133 = "dhcpv6sLANPrefixPool"
  DBTable = L5_133
  L5_133 = A0_128
  L6_134 = -1
  L7_135 = db
  L7_135 = L7_135.getRow
  L7_135 = L7_135("dhcpv6sLANPrefixPool", "delegationPrefix", L5_133)
  if L7_135 == nil then
    printCLIError("Prefix Address doesn't match with any of the configuration")
    return false
  else
    L6_134 = L7_135["dhcpv6sLANPrefixPool._ROWID_"]
  end
  L7_135["ipv6PrefixLength.cookie"] = L6_134
  L1_129, L4_132 = _UPVALUE0_.dhcpPrefixPoolSectionDelete(L7_135)
  L3_131 = _UPVALUE1_.errorStringGet(L1_129)
  if L1_129 == 0 then
    L1_129 = "OK"
    db.save()
    print("Row deleted")
  else
    L1_129 = "ERROR"
  end
  return L1_129, L3_131
end
function ifStatsPrint(A0_136)
  local L1_137
  L1_137 = {}
  for _FORV_5_, _FORV_6_ in pairs(A0_136) do
    resTab.insertField(L1_137, "IFACE", _FORV_6_["interfaceStats.interfaceName"])
    resTab.insertField(L1_137, "PktRx", _FORV_6_["interfaceStats.rx_packets"])
    resTab.insertField(L1_137, "PktTx", _FORV_6_["interfaceStats.tx_packets"])
    resTab.insertField(L1_137, "ByteRx", _FORV_6_["interfaceStats.rx_bytes"])
    resTab.insertField(L1_137, "ByteTx", _FORV_6_["interfaceStats.tx_bytes"])
    resTab.insertField(L1_137, "ErrRx", _FORV_6_["interfaceStats.rx_errors"])
    resTab.insertField(L1_137, "ErrTx", _FORV_6_["interfaceStats.tx_errors"])
    resTab.insertField(L1_137, "DropRx", _FORV_6_["interfaceStats.rx_dropped"])
    resTab.insertField(L1_137, "DropTx", _FORV_6_["interfaceStats.tx_dropped"])
    resTab.insertField(L1_137, "Mcast", _FORV_6_["interfaceStats.multicast"])
    resTab.insertField(L1_137, "Coll", _FORV_6_["interfaceStats.collisions"])
  end
  printLabel("Interface Statistics")
  resTab.print(L1_137, 0)
end
function bdgCLIStatsGet(A0_138)
  local L1_139, L2_140, L3_141, L4_142, L5_143, L6_144, L7_145, L8_146, L9_147, L10_148
  L1_139 = db
  L1_139 = L1_139.getAttribute
  L2_140 = "environment"
  L3_141 = "name"
  L4_142 = "IFDEVSTATS_PROGRAM"
  L1_139 = L1_139(L2_140, L3_141, L4_142, L5_143)
  L2_140 = os
  L2_140 = L2_140.execute
  L3_141 = L1_139
  L4_142 = " "
  L3_141 = L3_141 .. L4_142 .. L5_143
  L2_140(L3_141)
  L2_140 = db
  L2_140 = L2_140.getTable
  L3_141 = "bridgeTable"
  L2_140 = L2_140(L3_141)
  L3_141 = {}
  L4_142 = {}
  for L8_146, L9_147 in L5_143(L6_144) do
    L10_148 = db
    L10_148 = L10_148.getRow
    L10_148 = L10_148("interfaceStats", "interfaceStats.interfaceName", L9_147["bridgeTable.interfaceName"])
    if L10_148 ~= nil then
      table.insert(L4_142, L10_148)
    end
  end
  L5_143(L6_144)
  L5_143(L6_144, L7_145)
end
function ifCLIStatsGet(A0_149)
  local L1_150, L2_151, L3_152, L4_153, L5_154, L6_155, L7_156, L8_157
  L1_150 = {}
  L2_151 = nil
  L3_152 = db
  L3_152 = L3_152.getAttribute
  L7_156 = "value"
  L3_152 = L3_152(L4_153, L5_154, L6_155, L7_156)
  L7_156 = DB_FILE_NAME
  L4_153(L5_154)
  for L7_156, L8_157 in L4_153(L5_154) do
    L2_151 = db.getRow("interfaceStats", "interfaceStats.interfaceName", L8_157)
    if L2_151 ~= nil then
      table.insert(L1_150, L2_151)
    end
  end
  L4_153(L5_154)
end
function deviceStatGetAll()
  local L0_158, L1_159, L2_160, L3_161
  L0_158 = stats_db
  L0_158 = L0_158.connect
  L1_159 = "/tmp/stats.db"
  L0_158(L1_159)
  L0_158 = _UPVALUE0_
  L0_158 = L0_158.deviceStatisticsSectionGetAll
  L3_161 = L0_158()
  L1_159.interfaceName = "Dedicated WAN"
  L2_160.interfaceName = "Configurable Port(WAN)"
  L3_161.interfaceName = "LAN"
  ifStatsPrintCli(L3_161)
  ifStatsPrintCli(L1_159)
  if UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-250N" or UNIT_NAME == "DSR-150" or UNIT_NAME == "DSR-150N" then
    if db.getRow("ConfigPort", "_ROWID_", "1")["ConfigPort.LogicalIfName"] == "DMZ" then
      L2_160.interfaceName = "DMZ"
      ifStatsPrintCli(L2_160)
    end
  else
    ifStatsPrintCli(L2_160)
  end
end
function ifStatsPrintCli(A0_162)
  local L1_163
  L1_163 = {}
  resTab.insertField(L1_163, "PORT", A0_162.interfaceName or "")
  resTab.insertField(L1_163, "Tx Pkts", A0_162.tx_packets or "")
  resTab.insertField(L1_163, "Rx Pkts", A0_162.rx_packets or "")
  resTab.insertField(L1_163, "Collisions", A0_162.collisions or "")
  resTab.insertField(L1_163, "Tx B/s", A0_162.tx_bytes_rate or "")
  resTab.insertField(L1_163, "Rx B/s", A0_162.rx_bytes_rate or "")
  resTab.insertField(L1_163, "Up time", A0_162.wanUptime or "")
  printLabel("Interface Statistics")
  resTab.print(L1_163, 0)
end
function lanClientsGet()
  local L0_164, L1_165, L2_166, L3_167, L4_168, L5_169, L6_170, L7_171, L8_172, L9_173, L10_174, L11_175
  L0_164 = {}
  L1_165 = {}
  L2_166, L3_167 = nil, nil
  L1_165 = L5_169
  L2_166 = L4_168
  if L2_166 ~= L4_168 then
    L3_167 = L4_168
    L4_168(L5_169)
  end
  for L7_171, L8_172 in L4_168(L5_169) do
    L9_173, L10_174, L11_175 = nil, nil, nil
    L9_173 = L1_165[L7_171].IPAddr
    L10_174 = L1_165[L7_171].MacAddr
    L11_175 = L1_165[L7_171].LanType
    resTab.insertField(L0_164, "Ip Address", L9_173)
    resTab.insertField(L0_164, "Mac Address", L10_174)
    resTab.insertField(L0_164, "Type", L11_175)
  end
  L4_168(L5_169)
  L4_168(L5_169, L6_170)
end
