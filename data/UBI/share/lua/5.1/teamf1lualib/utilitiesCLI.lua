local L0_0
L0_0 = require
L0_0("teamf1lualib/tcpdump")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("validationsLuaLib")
L0_0 = require
L0_0("teamf1lualib/diagnostics_network")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/system_actions")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.diagnostics.network")
function utilCLIPing(A0_1)
  local L1_2, L2_3, L3_4, L4_5
  L1_2 = validationsLuaLib
  L1_2 = L1_2.ipAddressCheck
  L2_3 = "10"
  L3_4 = A0_1
  L1_2 = L1_2(L2_3, L3_4)
  L2_3 = validations
  L2_3 = L2_3.is_fqdn_address
  L3_4 = A0_1
  L2_3 = L2_3(L3_4)
  if L2_3 == false then
    L2_3 = validations
    L2_3 = L2_3.is_ipv4_address
    L3_4 = A0_1
    L2_3 = L2_3(L3_4)
    if L2_3 == false then
      L2_3 = tonumber
      L3_4 = L1_2
      L2_3 = L2_3(L3_4)
      if L2_3 == 1 then
        L2_3 = printCLIError
        L3_4 = " Please enter valid IP/Domain Address "
        L2_3(L3_4)
      end
    end
  else
    L2_3 = db
    L2_3 = L2_3.getAttribute
    L3_4 = "environment"
    L4_5 = "name"
    L2_3 = L2_3(L3_4, L4_5, "PING_PROGRAM", "value")
    L3_4 = db
    L3_4 = L3_4.getAttribute
    L4_5 = "environment"
    L3_4 = L3_4(L4_5, "name", "PING_FILE_NAME", "value")
    L4_5 = os
    L4_5 = L4_5.execute
    L4_5 = L4_5(L2_3 .. " " .. A0_1)
    printCLIError(L4_5)
  end
end
function utilCLIDns(A0_6)
  local L1_7, L2_8
  L1_7 = validations
  L1_7 = L1_7.is_fqdn_address
  L2_8 = A0_6
  L1_7 = L1_7(L2_8)
  if L1_7 == false then
    L1_7 = printCLIError
    L2_8 = " Please enter Valid FQDN "
    L1_7(L2_8)
  else
    L1_7 = db
    L1_7 = L1_7.getAttribute
    L2_8 = "environment"
    L1_7 = L1_7(L2_8, "name", "NSLOOKUP_PROGRAM", "value")
    L2_8 = os
    L2_8 = L2_8.execute
    L2_8 = L2_8(L1_7 .. " " .. A0_6)
    printCLIError(L2_8)
  end
end
function utilCLITrace(A0_9)
  local L1_10, L2_11, L3_12
  L1_10 = validationsLuaLib
  L1_10 = L1_10.ipAddressCheck
  L2_11 = "10"
  L3_12 = A0_9
  L1_10 = L1_10(L2_11, L3_12)
  L2_11 = validations
  L2_11 = L2_11.is_fqdn_address
  L3_12 = A0_9
  L2_11 = L2_11(L3_12)
  if L2_11 == false then
    L2_11 = validations
    L2_11 = L2_11.is_ipv4_address
    L3_12 = A0_9
    L2_11 = L2_11(L3_12)
    if L2_11 == false then
      L2_11 = tonumber
      L3_12 = L1_10
      L2_11 = L2_11(L3_12)
      if L2_11 == 1 then
        L2_11 = printCLIError
        L3_12 = " Please enter valid IP/Domain Address "
        L2_11(L3_12)
      end
    end
  else
    L2_11 = db
    L2_11 = L2_11.getAttribute
    L3_12 = "environment"
    L2_11 = L2_11(L3_12, "name", "TRACEROUTE_PROGRAM", "value")
    L3_12 = os
    L3_12 = L3_12.execute
    L3_12 = L3_12(L2_11 .. " " .. A0_9)
    printCLIError(L3_12)
  end
end
function utilCLIipv4Routing()
  local L0_13, L1_14
  returnCode, L0_13, L1_14 = _UPVALUE0_.ipv4RouteTableGet()
  if returnCode == _UPVALUE1_.SUCCESS then
    printCLIError(L1_14)
  end
end
function captureInterfaces()
  local L0_15, L1_16, L2_17, L3_18, L4_19, L5_20, L6_21, L7_22
  L0_15 = {}
  L1_16 = db
  L1_16 = L1_16.getTable
  L2_17 = "WanMode"
  L1_16 = L1_16(L2_17)
  L2_17 = db
  L2_17 = L2_17.getTable
  L3_18 = "ConfigPort"
  L2_17 = L2_17(L3_18)
  L3_18 = 0
  L4_19 = db
  L4_19 = L4_19.getRow
  L5_20 = "WanMode"
  L6_21 = "AddressFamily"
  L7_22 = "2"
  L4_19 = L4_19(L5_20, L6_21, L7_22)
  L5_20 = db
  L5_20 = L5_20.getAttribute
  L6_21 = "unitInfo"
  L7_22 = "_ROWID_"
  L5_20 = L5_20(L6_21, L7_22, "1", "modelId")
  L6_21 = L2_17[1]
  L7_22 = L4_19["WanMode.Wanmode"]
  if L7_22 == "0" then
    L7_22 = L4_19["WanMode.DedicatedLogicalIfName"]
    if L7_22 == "WAN1" then
      L7_22 = resTab
      L7_22 = L7_22.insertField
      L7_22(L0_15, "Interface", "WAN1")
    else
      L7_22 = L4_19["WanMode.DedicatedLogicalIfName"]
      if L7_22 == "WAN2" then
        L7_22 = resTab
        L7_22 = L7_22.insertField
        L7_22(L0_15, "Interface", "WAN2")
      else
        L7_22 = L4_19["WanMode.DedicatedLogicalIfName"]
        if L7_22 == "WAN3" then
          L7_22 = resTab
          L7_22 = L7_22.insertField
          L7_22(L0_15, "Interface", "WAN3")
        end
      end
    end
    L7_22 = L2_17[1]
    if L7_22["ConfigPort.LogicalIfName"] == "DMZ" then
      resTab.insertField(L0_15, "Interface", "DMZ")
    end
  else
    L7_22 = L4_19["WanMode.Wanmode"]
    if L7_22 == "1" then
      L7_22 = resTab
      L7_22 = L7_22.insertField
      L7_22(L0_15, "Interface", "WAN1")
      L7_22 = resTab
      L7_22 = L7_22.insertField
      L7_22(L0_15, "Interface", "WAN2")
      if L5_20 == "DSR-1000N" or L5_20 == "DSR-1000" or L5_20 == "DSR-1000AC" then
        L7_22 = resTab
        L7_22 = L7_22.insertField
        L7_22(L0_15, "Interface", "WAN3")
      end
    else
      L7_22 = L4_19["WanMode.Wanmode"]
      if L7_22 == "2" then
        L7_22 = L4_19["WanMode.FailoverPriLogicalIfName"]
        if L7_22 == "WAN1" then
          L7_22 = resTab
          L7_22 = L7_22.insertField
          L7_22(L0_15, "Interface", "WAN1")
        else
          L7_22 = L4_19["WanMode.FailoverPriLogicalIfName"]
          if L7_22 == "WAN2" then
            L7_22 = resTab
            L7_22 = L7_22.insertField
            L7_22(L0_15, "Interface", "WAN2")
          else
            L7_22 = L4_19["WanMode.FailoverPriLogicalIfName"]
            if L7_22 == "WAN3" then
              L7_22 = resTab
              L7_22 = L7_22.insertField
              L7_22(L0_15, "Interface", "WAN3")
            end
          end
        end
        L7_22 = L4_19["WanMode.FailoverSecLogicalIfName"]
        if L7_22 == "WAN1" then
          L7_22 = resTab
          L7_22 = L7_22.insertField
          L7_22(L0_15, "Interface", "WAN1")
        else
          L7_22 = L4_19["WanMode.FailoverSecLogicalIfName"]
          if L7_22 == "WAN2" then
            L7_22 = resTab
            L7_22 = L7_22.insertField
            L7_22(L0_15, "Interface", "WAN2")
          else
            L7_22 = L4_19["WanMode.FailoverSecLogicalIfName"]
            if L7_22 == "WAN3" then
              L7_22 = resTab
              L7_22 = L7_22.insertField
              L7_22(L0_15, "Interface", "WAN3")
            end
          end
        end
        L7_22 = L2_17[1]
        if L7_22["ConfigPort.LogicalIfName"] == "DMZ" then
          resTab.insertField(L0_15, "Interface", "DMZ")
        end
      else
        L7_22 = L4_19["WanMode.Wanmode"]
        if L7_22 == "3" then
          L7_22 = resTab
          L7_22 = L7_22.insertField
          L7_22(L0_15, "Interface", "WAN1")
          L7_22 = resTab
          L7_22 = L7_22.insertField
          L7_22(L0_15, "Interface", "WAN2")
          if L5_20 == "DSR-1000N" or L5_20 == "DSR-1000" or L5_20 == "DSR-1000AC" then
            L7_22 = resTab
            L7_22 = L7_22.insertField
            L7_22(L0_15, "Interface", "WAN3")
          end
        end
      end
    end
  end
  L7_22 = db
  L7_22 = L7_22.getRows
  L7_22 = L7_22("networkInterface", "ifType", "bridge")
  for _FORV_11_, _FORV_12_ in pairs(L7_22) do
    L3_18 = L3_18 + 1
    resTab.insertField(L0_15, "Interface", L7_22[L3_18]["networkInterface.LogicalIfName"])
  end
  resTab.print(L0_15, 0)
end
function utilCLIipv6Routing()
  local L0_23, L1_24
  L0_23 = db
  L0_23 = L0_23.getAttribute
  L1_24 = "networkinfo"
  L0_23 = L0_23(L1_24, "_ROWID_", "1", "netWorkMode")
  L0_23 = L0_23 or "1"
  if L0_23 == "3" then
    L1_24 = db
    L1_24 = L1_24.getAttribute
    L1_24 = L1_24("environment", "name", "ROUTE6_PROGRAM", "value")
    os.execute(L1_24)
  else
    L1_24 = printCLIError
    L1_24(" IPv6 is disabled ")
  end
end
function utilCLIcapturePacketStart(A0_25)
  local L1_26, L2_27, L3_28, L4_29, L5_30
  L1_26 = {}
  L2_27 = ""
  L3_28 = ""
  L4_29 = A0_25
  L5_30 = db
  L5_30 = L5_30.getAttribute
  L5_30 = L5_30("tcpdump", "LogicalIfName", L4_29, "_ROWID_")
  if db.getAttribute("tcpdump", "tcpdumpEnabled", "1", "_ROWID_") ~= nil then
    L2_27 = "packet capture has already started on some interface, so please stop to start on this capture"
    printCLIError(L2_27)
  elseif L5_30 == nil and db.getAttribute("ConfigPort", "LogicalIfName", L4_29, "_ROWID_") == nil then
    L2_27 = "Selected interface not found. please check the available interfaces using the command <util system_chack capturePackets avail_interfaces>"
    printCLIError(L2_27)
  else
    if L5_30 == nil then
      L5_30 = db.getAttribute("tcpdump", "LogicalIfName", "WAN2", "_ROWID_")
      L1_26["tcpdump.LogicalIfName"] = "WAN2"
    else
      L1_26["tcpdump.LogicalIfName"] = L4_29
    end
    L1_26["tcpdump.tcpdumpEnabled"] = "1"
    L3_28, L2_27 = tcpdump.config(L1_26, L5_30, "edit")
    if L3_28 == "OK" then
      db.save()
      L2_27 = "Packet Capturing Started"
    elseif L2_27 == "10187" then
      L2_27 = "Administrator privillages are required"
    elseif L2_27 == "12312" then
      L2_27 = "Interface selected is down"
    elseif L2_27 == "12265" then
      L2_27 = "operation succeed"
    elseif L2_27 == "12776" then
      L2_27 = "TCP dump failed configuration"
    end
    printCLIError(L2_27)
  end
end
function utilCLIcapturePacketStop()
  local L0_31, L1_32, L2_33, L3_34, L4_35
  L0_31 = {}
  L1_32 = ""
  L2_33 = ""
  L3_34 = db
  L3_34 = L3_34.getAttribute
  L4_35 = "tcpdump"
  L3_34 = L3_34(L4_35, "tcpdumpEnabled", "1", "LogicalIfName")
  if L3_34 == nil then
    L1_32 = "Packet capture has not started on any interface to stop"
  else
    L4_35 = db
    L4_35 = L4_35.getAttribute
    L4_35 = L4_35("tcpdump", "LogicalIfName", L3_34, "_ROWID_")
    L0_31["tcpdump.tcpdumpEnabled"] = "0"
    L2_33, L1_32 = tcpdump.config(L0_31, L4_35, "edit")
    if L2_33 == "OK" then
      db.save()
      L1_32 = "Packet Capturing Stoped"
    elseif L1_32 == "10187" then
      L1_32 = "Administrator privillages are required"
    elseif L1_32 == "12312" then
      L1_32 = "Interface selected is down"
    elseif L1_32 == "12265" then
      L1_32 = "operation succed"
    elseif L1_32 == "12776" then
      L1_32 = "TCP dump failed configuration"
    end
  end
  L4_35 = printCLIError
  L4_35(L1_32)
end
function utilCLIcapturePacketDownload(A0_36, A1_37)
  local L2_38, L3_39
  L2_38 = db
  L2_38 = L2_38.getAttribute
  L3_39 = "tcpdump"
  L2_38 = L2_38(L3_39, "tcpdumpEnabled", "1", "LogicalIfName")
  if L2_38 ~= nil then
    L3_39 = printCLIError
    L3_39("please stop packet capture to download the capture file")
  else
    L3_39 = validationsLuaLib
    L3_39 = L3_39.ipAddressCheck
    L3_39 = L3_39("10", A1_37)
    if validations.is_fqdn_address(A1_37) == false and validations.is_ipv4_address(A1_37) == false and tonumber(L3_39) == 1 then
      print(" Please enter a valid IP/Domain Address ")
      return false
    end
    if string.find(A0_36, ";") or string.find(A0_36, "|") or string.find(A0_36, "`") then
      print(" Please enter a valid filename ")
      return false
    end
    if os.execute("tftp -p -l " .. "/var/pkt.cap" .. " -r " .. A0_36 .. " " .. A1_37) == 256 then
      printCLIError("TFTP failed ")
    end
  end
end
function utilCLIdbgLogDownload(A0_40, A1_41)
  local L2_42
  L2_42 = db
  L2_42 = L2_42.getAttribute
  L2_42 = L2_42("unitInfo", "_ROWID_", "1", "modelId")
  UNIT_NAME = L2_42
  L2_42 = "/var/dbglog.tgz"
  DBGLOG_FILE = L2_42
  L2_42 = "/var/dbglog"
  DBGLOG_FILE_DIR = L2_42
  L2_42 = "/pfrm2.0/var/www/dbglog.sh"
  DBGLOG_SCRIPT = L2_42
  L2_42 = validationsLuaLib
  L2_42 = L2_42.ipAddressCheck
  L2_42 = L2_42("10", A1_41)
  if validations.is_fqdn_address(A1_41) == false and validations.is_ipv4_address(A1_41) == false and tonumber(L2_42) == 1 then
    print(" Please enter a valid IP/Domain Address ")
    return false
  end
  if string.find(A0_40, ";") or string.find(A0_40, "|") or string.find(A0_40, "`") then
    print(" Please enter a valid filename ")
    return false
  end
  os.execute("/bin/sh " .. DBGLOG_SCRIPT .. " " .. UNIT_NAME)
  if os.execute("tftp -p -l " .. DBGLOG_FILE .. " -r " .. A0_40 .. " " .. A1_41) == 256 then
    printCLIError("TFTP failed ")
  end
  os.execute("/bin/rm -rf " .. DBGLOG_FILE_DIR .. "*")
end
function utilCLIReboot(A0_43)
  local L1_44, L2_45
  L1_44 = db
  L1_44 = L1_44.setAttribute
  L2_45 = "reboot"
  L1_44(L2_45, "reboot._ROWID_", "1", "reboot", "1")
  L1_44 = _UPVALUE0_
  L1_44 = L1_44.bootupTimeGet
  L2_45 = L1_44()
  statusMessage = "Router will be up in " .. L2_45 .. " seconds."
  printCLIError(statusMessage)
end
function cliReboot(A0_46)
  local L1_47, L2_48, L3_49, L4_50, L5_51, L6_52
  L1_47 = 5
  L2_48 = 0
  L3_49 = ""
  L4_50 = _UPVALUE0_
  L4_50 = L4_50.bootupTimeGet
  L5_51 = L4_50()
  L6_52 = "Preparing to reboot "
  L6_52 = L6_52 .. [[
.
WARNING: All current sessions will be closed and the system will ]] .. "be down for about " .. L5_51 .. " seconds.\n"
  printCLIError(L6_52)
  while L3_49 ~= "Y" and L3_49 ~= "y" and L3_49 ~= "n" and L3_49 ~= "N" and L1_47 > L2_48 do
    printCLIError("Are you sure you want to proceed [Y/N]?")
    L3_49 = io.stdin:read("*l")
    L2_48 = L2_48 + 1
  end
  if L3_49 == "N" or L3_49 == "n" or L1_47 < L2_48 then
    return
  end
  utilCLIReboot()
end
function utilCLIFactoryReset(A0_53)
  local L1_54, L2_55, L3_56, L4_57, L5_58, L6_59, L7_60
  L1_54 = 5
  L2_55 = 0
  L3_56 = ""
  L4_57 = db
  L4_57 = L4_57.getAttribute
  L5_58 = "system"
  L6_59 = "_ROWID_"
  L7_60 = "1"
  L4_57 = L4_57(L5_58, L6_59, L7_60, "name")
  L5_58 = "Preparing to restore saved settings from user-provided "
  L6_59 = [[
file.
WARNING: Current configuration will be erased.
]]
  L5_58 = L5_58 .. L6_59
  L6_59 = printCLIError
  L7_60 = L5_58
  L6_59(L7_60)
  while L3_56 ~= "Y" and L3_56 ~= "y" and L3_56 ~= "n" and L3_56 ~= "N" and L1_54 > L2_55 do
    L6_59 = printCLIError
    L7_60 = "Are you sure you want to proceed [Y/N]?"
    L6_59(L7_60)
    L6_59 = io
    L6_59 = L6_59.stdin
    L7_60 = L6_59
    L6_59 = L6_59.read
    L6_59 = L6_59(L7_60, "*l")
    L3_56 = L6_59
    L2_55 = L2_55 + 1
  end
  if L3_56 == "N" or L3_56 == "n" or L1_54 < L2_55 then
    return
  end
  L6_59 = db
  L6_59 = L6_59.getAttribute
  L7_60 = "environment"
  L6_59 = L6_59(L7_60, "name", "FACTORY_RESET_SCRIPT", "value")
  L7_60 = os
  L7_60 = L7_60.execute
  L7_60(L6_59)
  if L4_57 == "DWC-1000" then
    L7_60 = db
    L7_60 = L7_60.getAttribute
    L7_60 = L7_60("environment", "name", "FACTORY_RESET_DWC_SCRIPT", "value")
    os.execute(L7_60)
  end
  L7_60 = UNIT_NAME
  if L7_60 ~= "DSR-1000AC" then
    L7_60 = UNIT_NAME
    if L7_60 ~= "DSR-500AC" then
      L7_60 = PRODUCT_ID
      if L7_60 ~= "DSR-1000_Bx" then
        L7_60 = PRODUCT_ID
      end
    end
  else
    if L7_60 == "DSR-500_Bx" then
      L7_60 = os
      L7_60 = L7_60.execute
      L7_60("/sbin/reboot -d 10 &")
      L7_60 = db
      L7_60 = L7_60.getAttribute
      L7_60 = L7_60("environment", "name", "BOOTUP_TIME", "value")
      statusMessage = "Router will be up in " .. L7_60 .. " seconds."
      printCLIError(statusMessage)
  end
  else
    L7_60 = utilCLIReboot
    L7_60()
  end
end
function utilCLIFirmVer(A0_61)
  local L1_62
  L1_62 = db
  L1_62 = L1_62.getAttribute
  L1_62 = L1_62("system", "_ROWID_", "1", "firmwareVer")
  print("Firmware Version : " .. L1_62)
end
function utilCLIUsbTestHelp(A0_63, A1_64, A2_65)
  x = os.execute("tftp -g -r " .. A1_64 .. " -l " .. A2_65 .. A1_64 .. " " .. A0_63)
  if x == 256 then
    print("TFTP failed ")
    return false
  end
  print("Md5sum: ")
  x = os.execute("/usr/bin/md5sum " .. A2_65 .. A1_64)
  if x == 256 then
    print("Md5Sum get Failed ")
    return false
  end
  x = os.execute("rm -rf " .. A2_65 .. A1_64)
  if x == 256 then
    print("File emoving Failed")
    return false
  end
end
function utilCLIUsbTest(A0_66, A1_67)
  local L2_68, L3_69, L4_70
  L2_68 = db
  L2_68 = L2_68.getAttribute
  L3_69 = "system"
  L4_70 = "_ROWID_"
  L2_68 = L2_68(L3_69, L4_70, "1", "vendor")
  L3_69 = db
  L3_69 = L3_69.getAttribute
  L4_70 = "system"
  L3_69 = L3_69(L4_70, "_ROWID_", "1", "name")
  if L2_68 ~= "D-Link" then
    L4_70 = print
    L4_70("This box doesn't belong to D-Link family")
    L4_70 = false
    return L4_70
  end
  L4_70 = io
  L4_70 = L4_70.open
  L4_70 = L4_70("/var/usb1Info", "r")
  file1 = L4_70
  L4_70 = io
  L4_70 = L4_70.open
  L4_70 = L4_70("/var/usb2Info", "r")
  file2 = L4_70
  L4_70 = validationsLuaLib
  L4_70 = L4_70.ipAddressCheck
  L4_70 = L4_70("10", A0_66)
  if validations.is_fqdn_address(A0_66) == false and validations.is_ipv4_address(A0_66) == false and tonumber(L4_70) == 1 then
    print(" Please enter a valid IP/Domain Address ")
    return false
  end
  if string.find(A1_67, ";") or string.find(A1_67, "|") or string.find(A1_67, "`") then
    print(" Please enter a valid fileName ")
    return false
  end
  if file1 == nil and file2 == nil then
    print("No Devices connected to USB Ports")
    return false
  end
  if L3_69 ~= "DSR-500AC" and PRODUCT_ID ~= "DSR-500_Bx" then
    if file1 == nil then
      print("USB1 not connected")
    else
      fileContent = file1:read("*line")
      if string.find(fileContent, "storage") == nil then
        print("USB1 not a storage device")
      else
        print("Test for USB1:")
        utilCLIUsbTestHelp(A0_66, A1_67, "/usb1/")
      end
    end
  end
  if L3_69 == "DSR-1000AC" or L3_69 == "DSR-1000N" or L3_69 == "DSR-1000" or L3_69 == "DSR-500AC" or PRODUCT_ID == "DSR-500_Bx" then
    if file2 == nil then
      print("USB2 not connected")
    else
      fileContent = file2:read("*line")
      if string.find(fileContent, "storage") == nil then
        print("USB2 not a storage device")
      else
        print("Test for USB2:")
        utilCLIUsbTestHelp(A0_66, A1_67, "/usb2/")
      end
    end
  end
  if file1 then
    io.close(file1)
  end
  if file2 then
    io.close(file2)
  end
end
function autoBackupSupport(A0_71)
  if db.setAttribute("ConfigSupport", "_ROWID_", "1", "EnableAutoBackup", A0_71) == false then
    print("Operation Failed")
  else
    db.save()
    print("Operation Succeeded")
  end
end
function configEncryptionSupport(A0_72)
  if db.setAttribute("ConfigSupport", "_ROWID_", "1", "EncryptEnable", A0_72) == false then
    print("Operation Failed")
  else
    db.save()
    print("Operation Succeeded")
  end
end
function utilCLIFirmUpgrade(A0_73, A1_74, A2_75)
  local L3_76, L4_77, L5_78, L6_79, L7_80, L8_81, L9_82, L10_83, L11_84, L12_85, L13_86, L14_87
  L3_76 = require
  L4_77 = "teamf1lualib/firmware"
  L3_76(L4_77)
  L3_76 = validationsLuaLib
  L3_76 = L3_76.ipAddressCheck
  L4_77 = "10"
  L5_78 = A0_73
  L3_76 = L3_76(L4_77, L5_78)
  L4_77 = validations
  L4_77 = L4_77.is_fqdn_address
  L5_78 = A0_73
  L4_77 = L4_77(L5_78)
  if L4_77 == false then
    L4_77 = validations
    L4_77 = L4_77.is_ipv4_address
    L5_78 = A0_73
    L4_77 = L4_77(L5_78)
    if L4_77 == false then
      L4_77 = tonumber
      L5_78 = L3_76
      L4_77 = L4_77(L5_78)
      if L4_77 == 1 then
        L4_77 = print
        L5_78 = " Please enter a valid IP/Domain Address "
        L4_77(L5_78)
        L4_77 = false
        return L4_77
      end
    end
  end
  L4_77 = string
  L4_77 = L4_77.find
  L5_78 = A1_74
  L6_79 = ";"
  L4_77 = L4_77(L5_78, L6_79)
  if not L4_77 then
    L4_77 = string
    L4_77 = L4_77.find
    L5_78 = A1_74
    L6_79 = "|"
    L4_77 = L4_77(L5_78, L6_79)
  elseif L4_77 then
    L4_77 = print
    L5_78 = " Please enter a valid fileName "
    L4_77(L5_78)
    L4_77 = false
    return L4_77
  end
  A2_75 = "/tmp/"
  L4_77 = ""
  L5_78 = print
  L6_79 = "PLease wait firmware is getting upgraded, It will take time."
  L5_78(L6_79)
  L5_78 = os
  L5_78 = L5_78.execute
  L6_79 = "tftp -g -r "
  L7_80 = A1_74
  L8_81 = " -l "
  L9_82 = A2_75
  L10_83 = A1_74
  L11_84 = " "
  L12_85 = A0_73
  L6_79 = L6_79 .. L7_80 .. L8_81 .. L9_82 .. L10_83 .. L11_84 .. L12_85
  L5_78 = L5_78(L6_79)
  x = L5_78
  L5_78 = x
  if L5_78 == 256 then
    L5_78 = print
    L6_79 = "TFTP failed "
    L5_78(L6_79)
    L5_78 = false
    return L5_78
  end
  L5_78 = ""
  L6_79 = os
  L6_79 = L6_79.execute
  L7_80 = "/pfrm2.0/bin/upgradeCopy.sh"
  L6_79(L7_80)
  L6_79 = db
  L6_79 = L6_79.getAttribute
  L7_80 = "environment"
  L8_81 = "name"
  L9_82 = "UPGRADE_PROGRAM"
  L10_83 = "value"
  L6_79 = L6_79(L7_80, L8_81, L9_82, L10_83)
  L7_80 = db
  L7_80 = L7_80.getAttribute
  L8_81 = "environment"
  L9_82 = "name"
  L10_83 = "DEVICE_NAME"
  L11_84 = "value"
  L7_80 = L7_80(L8_81, L9_82, L10_83, L11_84)
  L5_78 = L7_80
  L7_80 = db
  L7_80 = L7_80.getAttribute
  L8_81 = "environment"
  L9_82 = "name"
  L10_83 = "KERNEL_PARTITION"
  L11_84 = "value"
  L7_80 = L7_80(L8_81, L9_82, L10_83, L11_84)
  L8_81 = db
  L8_81 = L8_81.getAttribute
  L9_82 = "environment"
  L10_83 = "name"
  L11_84 = "ROOTFS_PARTITION"
  L12_85 = "value"
  L8_81 = L8_81(L9_82, L10_83, L11_84, L12_85)
  L9_82 = db
  L9_82 = L9_82.getAttribute
  L10_83 = "environment"
  L11_84 = "name"
  L12_85 = "CONFIG_PARTITION"
  L13_86 = "value"
  L9_82 = L9_82(L10_83, L11_84, L12_85, L13_86)
  L10_83 = db
  L10_83 = L10_83.getAttribute
  L11_84 = "unitInfo"
  L12_85 = "_ROWID_"
  L13_86 = "1"
  L14_87 = "hardwareVersion"
  L10_83 = L10_83(L11_84, L12_85, L13_86, L14_87)
  L11_84 = db
  L11_84 = L11_84.getAttribute
  L12_85 = "environment"
  L13_86 = "name"
  L14_87 = "FIRMWARE_PARTITION"
  L11_84 = L11_84(L12_85, L13_86, L14_87, "value")
  L12_85 = db
  L12_85 = L12_85.getAttribute
  L13_86 = "system"
  L14_87 = "_ROWID_"
  L12_85 = L12_85(L13_86, L14_87, "1", "firmwareVerInt")
  L13_86 = print
  L14_87 = "upgrading will take time, please wait\n"
  L13_86(L14_87)
  L13_86 = os
  L13_86 = L13_86.execute
  L14_87 = L6_79
  L14_87 = L14_87 .. " " .. "/tmp/" .. A1_74 .. " " .. L5_78 .. " " .. L7_80 .. " " .. L8_81 .. " " .. L12_85 .. " " .. L9_82 .. " " .. L10_83 .. " " .. L11_84 .. " "
  L13_86 = L13_86(L14_87)
  if L13_86 == 0 then
    L14_87 = true
    displayCountDown = L14_87
  elseif L13_86 == 512 then
    L14_87 = "RU_FIRMWARE_UPGRADE_DENIED"
    statusCode = L14_87
  else
    L14_87 = "FIRMWARE_INVALID_FILE"
    statusCode = L14_87
  end
  if L13_86 ~= 0 then
    L14_87 = db
    L14_87 = L14_87.getAttribute
    L14_87 = L14_87("stringsMap", "stringId", statusCode, LANGUAGE)
    statusMessage = L14_87
    L14_87 = print
    L14_87(statusMessage)
    L14_87 = os
    L14_87 = L14_87.execute
    L14_87 = L14_87("rm -rf " .. A2_75 .. A1_74)
    x = L14_87
    L14_87 = x
    if L14_87 == 256 then
      L14_87 = print
      L14_87("File removing Failed")
      L14_87 = false
      return L14_87
    end
  end
  L14_87 = ""
  if displayCountDown then
    print("Image is upgraded\n")
    print("Box will be rebooted in 5 seconds\n")
    L14_87 = db.getAttribute("environment", "name", "BOOTUP_TIME", "value")
    statatusMessage = "Router will be up in " .. L14_87 .. " seconds"
    print(statatusMessage)
  end
end
function utilCLIThirdPartyLogCtrl(A0_88)
  db.setAttribute("logCtrlTbl", "_ROWID_", "1", "logEnable", A0_88)
end
