local L0_0, L1_1
function L0_0()
  if db.getAttribute("networkInfo", "_ROWID_", 1, "netWorkMode") ~= "3" then
    printCLIError("Please Set IP Mode to IPv4/IPv6")
    return false
  end
  return true
end
modeCheck = L0_0
function L0_0(A0_2)
  if modeCheck() == false then
    return
  end
  tahiDefaultRouteDel()
end
tahiDefaultRouteAdd = L0_0
function L0_0()
  if modeCheck() == false then
    return
  end
end
tahiDefaultRouteDel = L0_0
function L0_0()
  if modeCheck() == false then
    return
  end
  if io.open("/tmp/radvdCheck", "r") then
    io.open("/tmp/radvdCheck", "r"):close()
    os.remove("/tmp/radvdCheck")
  end
end
tahiStopRA = L0_0
function L0_0(A0_3)
  if modeCheck() == false then
    return
  end
  tahiStopRA()
  if io.open("/tmp/radvdCheck", "w") then
    io.open("/tmp/radvdCheck", "w"):close()
  end
end
tahiStartRA = L0_0
function L0_0(A0_4)
  if modeCheck() == false then
    return
  end
  if A0_4 == 0 then
  elseif A0_4 == 1 then
  end
end
tahiProcSet = L0_0
function L0_0()
  local L0_5, L1_6, L2_7
  L0_5 = modeCheck
  L0_5 = L0_5()
  if L0_5 == false then
    return
  end
  L0_5 = tahiProcSet
  L1_6 = 1
  L0_5(L1_6)
  L0_5 = "LogicalIfName='LAN' and AddressFamily=10"
  L1_6 = db
  L1_6 = L1_6.getRowWhere
  L2_7 = "ifStatic"
  L1_6 = L1_6(L2_7, L0_5)
  L2_7 = L1_6["ifStatic.StaticIp"]
end
v6UpGlobal = L0_0
function L0_0(A0_8, A1_9)
  if modeCheck() == false then
    return
  end
end
tahiAliasAdd = L0_0
function L0_0(A0_10, A1_11)
  if modeCheck() == false then
    return
  end
end
tahiAliasDel = L0_0
function L0_0()
  if modeCheck() == false then
    return
  end
end
tahiNeighCacheDel = L0_0
function L0_0(A0_12)
  if modeCheck() == false then
    return
  end
end
tahiReachableTimeSet = L0_0
function L0_0()
  if modeCheck() == false then
    return
  end
  io.open("/var/mfc.conf", "w"):write("ff1e::1:2 from 3ffe:501:ffff:100:200:ff:fe00:100@bdg1 to eth1;\n")
  io.open("/var/mfc.conf", "w"):write("ff1f::1:2 from 3ffe:501:ffff:100:200:ff:fe00:100@bdg1 to eth1;\n")
  io.open("/var/mfc.conf", "w"):write("ff1e::1:2 from 3ffe:501:ffff:100::1@bdg1 to eth1;\n")
  io.open("/var/mfc.conf", "w"):close()
end
tahiMcastStart = L0_0
function L0_0()
  if modeCheck() == false then
    return
  end
end
tahiMcastStop = L0_0
function L0_0(A0_13, A1_14)
  if modeCheck() == false then
    return
  end
end
tahiPing6 = L0_0
function L0_0(A0_15, A1_16)
  if modeCheck() == false then
    return
  end
end
tahiBPing6 = L0_0
function L0_0(A0_17)
  if modeCheck() == false then
    return
  end
end
tahiMping6 = L0_0
function L0_0(A0_18, A1_19)
  if modeCheck() == false then
    return
  end
end
tahiRouteAdd = L0_0
function L0_0(A0_20, A1_21)
  if modeCheck() == false then
    return
  end
end
tahiRouteDel = L0_0
function L0_0(A0_22)
  if modeCheck() == false then
    return
  end
end
tahiPmtuRouteAdd = L0_0
function L0_0()
  if modeCheck() == false then
    return
  end
  if io.open("/var/fwIpv6LogoCheck", "w") then
    io.open("/var/fwIpv6LogoCheck", "w"):close()
  end
end
firewall6Disable = L0_0
function L0_0()
  local L0_23, L1_24, L2_25, L3_26
  L0_23 = modeCheck
  L0_23 = L0_23()
  if L0_23 == false then
    return
  end
  L0_23 = 0
  L1_24 = "LogicalIfName = 'LAN' AND addressFamily = '10'"
  L2_25 = db
  L2_25 = L2_25.getRowsWhere
  L3_26 = "ipAddressTable"
  L2_25 = L2_25(L3_26, L1_24)
  L3_26 = ""
  if L2_25 then
    for _FORV_7_, _FORV_8_ in pairs(L2_25) do
      L0_23 = L0_23 + 1
      L3_26 = L3_26 .. L2_25[L0_23]["ipAddressTable.ipAddress"] .. "/" .. L2_25[L0_23]["ipAddressTable.ipv6PrefixLen"]
      if L0_23 ~= #L2_25 then
        L3_26 = L3_26 .. ", "
      end
    end
    printCLIError(L3_26)
  end
end
lanIpShow = L0_0
function L0_0(A0_27, A1_28)
  local L2_29
  L2_29 = modeCheck
  L2_29 = L2_29()
  if L2_29 == false then
    return
  end
  L2_29 = db
  L2_29 = L2_29.getAttribute
  L2_29 = L2_29("networkInterface", "LogicalIfName", A0_27, "interfaceName")
  if A1_28 == "up" then
    os.execute("ifconfig " .. L2_29 .. " up")
  elseif A1_28 == "down" then
    os.execute("ifconfig " .. L2_29 .. " down")
  end
end
lanIpInterface = L0_0
function L0_0(A0_30, A1_31)
  x = os.execute("tftp -g -r " .. A0_30 .. " -l /var/mradvd.conf " .. A1_31)
  if x == 256 then
    print("TFTP failed ")
    return false
  end
  tahiStartRA("/var/mradvd.conf")
end
runTftpRadvd = L0_0
function L0_0(A0_32)
  local L1_33, L2_34, L3_35, L4_36
  L1_33 = 1
  L2_34 = {}
  L2_34.interface = nil
  L2_34.AdvSendAdvert = nil
  L2_34.MaxRtrAdvInterval = nil
  L2_34.MinRtrAdvInterval = nil
  L2_34.AdvCurHopLimit = nil
  L2_34.AdvManagedFlag = nil
  L2_34.AdvOtherConfigFlag = nil
  L2_34.AdvDefaultLifetime = nil
  L2_34.AdvReachableTime = nil
  L2_34.AdvRetransTimer = nil
  L2_34.AdvLinkMTU = nil
  L2_34.ipAddr = nil
  L2_34.prefixLength = nil
  L2_34.AdvOnLink = nil
  L2_34.AdvAutonomous = nil
  L2_34.AdvValidLifetime = nil
  L2_34.AdvPreferredLifetime = nil
  L3_35 = L1_33
  L4_36 = L2_34
  return L3_35, L4_36
end
runCustomRadvdInit = L0_0
function L0_0(A0_37)
  if A0_37.prefix == nil then
    printCLIError("need valid prefix to start RA")
    return false
  end
  if A0_37.prefixLength == nil then
    printCLIError("need valid prefix length to start RA")
    return false
  end
  if A0_37.interface == nil then
    printCLIError("need valid interface to start RA")
    return false
  end
end
customRadvdInputVal = L0_0
function L0_0(A0_38)
  local L1_39
  L1_39 = db
  L1_39 = L1_39.getAttribute
  L1_39 = L1_39("networkInterface", "LogicalIfName", A0_38.interface, "interfaceName")
  if L1_39 == nil then
    printCLIError("unable to get the interface name")
    return false
  end
  if A0_38.AdvSendAdvert == nil then
    A0_38.AdvSendAdvert = "on"
  end
  io.open("/var/cusRa.conf", "w"):write("interface " .. L1_39 .. "\n")
  io.open("/var/cusRa.conf", "w"):write("\t{\n")
  io.open("/var/cusRa.conf", "w"):write("\tAdvSendAdvert " .. A0_38.AdvSendAdvert .. ";\n")
  if A0_38.MaxRtrAdvInterval ~= nil then
    io.open("/var/cusRa.conf", "w"):write("\tMaxRtrAdvInterval " .. A0_38.MaxRtrAdvInterval .. ";\n")
  end
  if A0_38.MinRtrAdvInterval ~= nil then
    io.open("/var/cusRa.conf", "w"):write("\tMinRtrAdvInterval " .. A0_38.MinRtrAdvInterval .. ";\n")
  end
  if A0_38.AdvCurHopLimit ~= nil then
    io.open("/var/cusRa.conf", "w"):write("\tAdvCurHopLimit " .. A0_38.AdvCurHopLimit .. ";\n")
  end
  if A0_38.AdvManagedFlag ~= nil then
    io.open("/var/cusRa.conf", "w"):write("\tAdvManagedFlag " .. A0_38.AdvManagedFlag .. ";\n")
  end
  if A0_38.AdvOtherConfigFlag ~= nil then
    io.open("/var/cusRa.conf", "w"):write("\tAdvOtherConfigFlag " .. A0_38.AdvOtherConfigFlag .. ";\n")
  end
  if A0_38.AdvDefaultLifetime ~= nil then
    io.open("/var/cusRa.conf", "w"):write("\tAdvDefaultLifetime " .. A0_38.AdvDefaultLifetime .. ";\n")
  end
  if A0_38.AdvReachableTime ~= nil then
    io.open("/var/cusRa.conf", "w"):write("\tAdvReachableTime " .. A0_38.AdvReachableTime .. ";\n")
  end
  if A0_38.AdvRetransTimer ~= nil then
    io.open("/var/cusRa.conf", "w"):write("\tAdvRetransTimer " .. A0_38.AdvRetransTimer .. ";\n")
  end
  if A0_38.AdvLinkMTU ~= nil then
    io.open("/var/cusRa.conf", "w"):write("\tAdvLinkMTU " .. A0_38.AdvLinkMTU .. ";\n")
  end
  io.open("/var/cusRa.conf", "w"):write("\tprefix " .. A0_38.prefix .. "/" .. A0_38.prefixLength .. [[

		{
]])
  if A0_38.AdvOnLink ~= nil then
    io.open("/var/cusRa.conf", "w"):write("\t\tAdvOnLink " .. A0_38.AdvOnLink .. ";\n")
  end
  if A0_38.AdvAutonomous ~= nil then
    io.open("/var/cusRa.conf", "w"):write("\t\tAdvAutonomous " .. A0_38.AdvAutonomous .. ";\n")
  end
  if A0_38.AdvValidLifetime ~= nil then
    io.open("/var/cusRa.conf", "w"):write("\t\tAdvValidLifetime " .. A0_38.AdvValidLifetime .. ";\n")
  end
  if A0_38.AdvPreferredLifetime ~= nil then
    io.open("/var/cusRa.conf", "w"):write("\t\tAdvPreferredLifetime " .. A0_38.AdvPreferredLifetime .. ";\n")
  end
  io.open("/var/cusRa.conf", "w"):write([[
		};
	};
]])
  io.open("/var/cusRa.conf", "w"):close()
  tahiStartRA("/var/cusRa.conf")
  return "OK", "Successfull"
end
runCustomRadvd = L0_0
