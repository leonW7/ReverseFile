local L0_0
L0_0 = require
L0_0("teamf1lualib/radvd")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = "radvdLANPrefixPool"
radvdLANPrefixPoolTable = L0_0
L0_0 = nil
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
  L0_0 = 16
else
  L0_0 = 8
end
function radvdCfgSave(A0_1)
  DBTable = "radvd"
  errorFlag, statusCode = radvd.profileConfig(A0_1, A0_1["radvd._ROWID_"], "edit")
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  return errorFlag, statusMessage
end
function radvdCfgInit(A0_2)
  local L1_3, L2_4, L3_5, L4_6, L5_7, L6_8
  L1_3 = A0_2[1]
  L2_4 = db
  L2_4 = L2_4.getRow
  L3_5 = "vlan"
  L4_6 = "vlanId"
  L5_7 = L1_3
  L2_4 = L2_4(L3_5, L4_6, L5_7)
  if L2_4 == nil then
    L3_5 = print
    L4_6 = "Vlan doesn't exist.\n"
    L3_5(L4_6)
    L3_5 = -1
    L4_6 = {}
    return L3_5, L4_6
  end
  L3_5 = db
  L3_5 = L3_5.getAttribute
  L4_6 = "vlan"
  L5_7 = "vlanId"
  L6_8 = L1_3
  L3_5 = L3_5(L4_6, L5_7, L6_8, "vlanIPv6")
  if L3_5 ~= "1" then
    L4_6 = print
    L5_7 = "Enabled IPv6 first on selected vlan interface to configure RADVD.\n"
    L4_6(L5_7)
    L4_6 = -1
    L5_7 = {}
    return L4_6, L5_7
  end
  L4_6 = L1_3
  if L1_3 == "1" then
    L1_3 = ""
  end
  L5_7 = "LAN"
  L6_8 = L1_3
  L5_7 = L5_7 .. L6_8
  L6_8 = db
  L6_8 = L6_8.getAttribute
  L6_8 = L6_8("radvd", "LogicalIfName", L5_7, "_ROWID_")
  configRow = db.getRow("radvd", "_ROWID_", L6_8)
  configRow["radvd._ROWID_"] = L6_8
  configRow["radvd.LogicalIfName"] = L5_7
  return configRow["radvd._ROWID_"], configRow
end
function radvdCfgInputVal(A0_9)
  local L1_10, L2_11
  L1_10 = db
  L1_10 = L1_10.getAttribute
  L2_11 = "networkInfo"
  L1_10 = L1_10(L2_11, "_ROWID_", "1", "netWorkMode")
  L1_10 = L1_10 or ""
  if L1_10 == "1" then
    L2_11 = printCLIError
    L2_11("Please Set IP Mode to IPv4/IPv6 to configure RADVD.\n")
    L2_11 = false
    return L2_11
  end
  L2_11 = A0_9["radvd.UnicastOnly"]
  if L2_11 == "0" then
    L2_11 = A0_9["radvd.MaxRtrAdvInterval"]
    if L2_11 ~= nil then
      L2_11 = A0_9["radvd.MaxRtrAdvInterval"]
    elseif L2_11 == "" then
      L2_11 = printCLIError
      L2_11("Enter valid advertise interval.\n")
      L2_11 = false
      return L2_11
    end
  end
  L2_11 = tonumber
  L2_11 = L2_11(A0_9["radvd.MaxRtrAdvInterval"])
  if L2_11 < 10 or L2_11 > 1800 then
    printCLIError("Invalid advertise interval value.\n")
    return false
  end
  L2_11 = tonumber(A0_9["radvd.AdvLinkMTU"])
  if L2_11 < 1280 or L2_11 > 1500 then
    printCLIError("Invalid MTU value.\n")
    return false
  end
  L2_11 = tonumber(A0_9["radvd.AdvDefaultLifetime"])
  if L2_11 < 30 or L2_11 > 9000 then
    printCLIError("Invalid Router lifr time value.\n")
    return false
  end
  return true
end
function radvdPoolCfgInputVal(A0_12)
  local L1_13, L2_14, L3_15, L4_16, L5_17, L6_18
  L1_13 = db
  L1_13 = L1_13.getAttribute
  L2_14 = "networkInfo"
  L3_15 = "_ROWID_"
  L4_16 = "1"
  L5_17 = "netWorkMode"
  L1_13 = L1_13(L2_14, L3_15, L4_16, L5_17)
  L1_13 = L1_13 or ""
  if L1_13 == "1" then
    L2_14 = printCLIError
    L3_15 = "Please Set IP Mode to IPv4/IPv6 to configure IPv6 RADVD.\n"
    L2_14(L3_15)
    L2_14 = false
    return L2_14
  end
  L2_14 = A0_12["radvdLANPrefixPool.vlanId"]
  if L2_14 ~= nil then
    L2_14 = A0_12["radvdLANPrefixPool.vlanId"]
  elseif L2_14 == "" then
    L2_14 = printCLIError
    L3_15 = "Enter valid vlan Id.\n"
    L2_14(L3_15)
    L2_14 = false
    return L2_14
  end
  L2_14 = A0_12["radvdLANPrefixPool.vlanId"]
  L3_15 = db
  L3_15 = L3_15.getRow
  L4_16 = "vlan"
  L5_17 = "vlanId"
  L6_18 = L2_14
  L3_15 = L3_15(L4_16, L5_17, L6_18)
  if L3_15 == nil then
    L4_16 = printCLIError
    L5_17 = "No Row exist with this Vlan ID"
    L4_16(L5_17)
    L4_16 = false
    return L4_16
  end
  if L2_14 == "1" then
    L2_14 = ""
  end
  L4_16 = "LAN"
  L5_17 = L2_14
  L4_16 = L4_16 .. L5_17
  L5_17 = db
  L5_17 = L5_17.getAttribute
  L6_18 = "radvd"
  L5_17 = L5_17(L6_18, "LogicalIfName", L4_16, "isEnabled")
  L5_17 = L5_17 or ""
  if L5_17 ~= "1" then
    L6_18 = printCLIError
    L6_18("Please Enable Radvd for this vlan interface")
    L6_18 = false
    return L6_18
  end
  A0_12["radvdLANPrefixPool.interfaceName"] = L4_16
  L6_18 = A0_12["radvdLANPrefixPool.radvdPrefixType"]
  if L6_18 ~= nil then
    L6_18 = A0_12["radvdLANPrefixPool.radvdPrefixType"]
  elseif L6_18 == "" then
    L6_18 = printCLIError
    L6_18("Enter valid ipv6 prefix type\n")
    L6_18 = false
    return L6_18
  end
  L6_18 = A0_12["radvdLANPrefixPool.radvdPrefixType"]
  if L6_18 == "3" then
    L6_18 = printCLIError
    L6_18("Prefix Obtain by DHCPv6 server supports Non-Edit format\n")
    L6_18 = false
    return L6_18
  end
  L6_18 = A0_12["radvdLANPrefixPool.radvdPrefixType"]
  if L6_18 == "2" then
    L6_18 = A0_12["radvdLANPrefixPool.radvdAdvPrefix"]
    if L6_18 ~= nil then
      L6_18 = A0_12["radvdLANPrefixPool.radvdAdvPrefix"]
    elseif L6_18 == "" then
      L6_18 = printCLIError
      L6_18("Enter valid ipv6 prefix\n")
      L6_18 = false
      return L6_18
    end
    L6_18 = _UPVALUE0_
    L6_18 = L6_18.ipAddressCheck
    L6_18 = L6_18(10, A0_12["radvdLANPrefixPool.radvdAdvPrefix"])
    if L6_18 ~= 0 then
      printCLIError("Invalid prefix value\n")
      return false
    end
    if A0_12["radvdLANPrefixPool.radvdAdvPrefixLength"] == nil or A0_12["radvdLANPrefixPool.radvdAdvPrefixLength"] == "" then
      printCLIError("Enter valid ipv6 prefix length\n")
      return false
    end
    if tonumber(A0_12["radvdLANPrefixPool.radvdAdvPrefixLength"]) < 1 or tonumber(A0_12["radvdLANPrefixPool.radvdAdvPrefixLength"]) > 128 then
      printCLIError("Invalid advertisement prefix length value")
      return false
    end
  end
  L6_18 = A0_12["radvdLANPrefixPool.radvdPrefixType"]
  if L6_18 == "1" then
    L6_18 = A0_12["radvdLANPrefixPool.SLAIdentifier"]
    if L6_18 ~= nil then
      L6_18 = A0_12["radvdLANPrefixPool.SLAIdentifier"]
    elseif L6_18 == "" then
      L6_18 = printCLIError
      L6_18("Enter valid SLA ID \n")
      L6_18 = false
      return L6_18
    end
    L6_18 = tonumber
    L6_18 = L6_18(A0_12["radvdLANPrefixPool.SLAIdentifier"])
    L6_18 = num2hex(L6_18)
    A0_12["radvdLANPrefixPool.radvdAdvPrefix"] = "2002:0:0:" .. L6_18 .. "::"
    if 1 > tonumber(A0_12["radvdLANPrefixPool.SLAIdentifier"]) or tonumber(A0_12["radvdLANPrefixPool.SLAIdentifier"]) > 999 then
      printCLIError("Invalid SLA parameter value \n")
      return false
    end
  end
  L6_18 = A0_12["radvdLANPrefixPool.radvdAdvPrefixLifetime"]
  if L6_18 ~= nil then
    L6_18 = A0_12["radvdLANPrefixPool.radvdAdvPrefixLifetime"]
  elseif L6_18 == "" then
    L6_18 = printCLIError
    L6_18("Enter valid prefix life time\n")
    L6_18 = false
    return L6_18
  end
  L6_18 = tonumber
  L6_18 = L6_18(A0_12["radvdLANPrefixPool.radvdAdvPrefixLifetime"])
  if L6_18 < 5 or L6_18 > 65536 then
    printCLIError("Invalid advertisement prefix lifetime value \n")
    return false
  end
  return true
end
function radvdCfgGet(A0_19)
  local L1_20, L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27, L9_28, L10_29, L11_30, L12_31, L13_32
  L1_20 = db
  L1_20 = L1_20.getTable
  L2_21 = "radvd"
  L1_20 = L1_20(L2_21)
  L2_21 = {}
  L3_22 = 0
  L4_23 = db
  L4_23 = L4_23.getAttribute
  L8_27 = "netWorkMode"
  L4_23 = L4_23(L5_24, L6_25, L7_26, L8_27)
  L4_23 = L4_23 or ""
  if L4_23 == "1" then
    L5_24(L6_25)
  else
    L5_24(L6_25)
    for L8_27, L9_28 in L5_24(L6_25) do
      L3_22 = L3_22 + 1
      L10_29 = L1_20[L3_22]
      L11_30 = print
      L12_31 = "Row Id: "
      L13_32 = L3_22
      L12_31 = L12_31 .. L13_32 .. " "
      L11_30(L12_31)
      L11_30 = L10_29["radvd.isEnabled"]
      if L11_30 == "1" then
        L11_30 = print
        L12_31 = "RADVD Status: Enabled"
        L11_30(L12_31)
      else
        L11_30 = L10_29["radvd.isEnabled"]
        if L11_30 == "0" then
          L11_30 = print
          L12_31 = "RADVD Status: Disabled"
          L11_30(L12_31)
        end
      end
      L11_30 = L10_29["radvd.isEnabled"]
      if L11_30 == "1" then
        L11_30 = L10_29["radvd.UnicastOnly"]
        if L11_30 == "0" then
          L11_30 = print
          L12_31 = "Advertise Mode: Unsolicited Multicast."
          L11_30(L12_31)
          L11_30 = print
          L12_31 = "Advertise Interval: "
          L13_32 = L10_29["radvd.MaxRtrAdvInterval"]
          L12_31 = L12_31 .. L13_32
          if not L12_31 then
            L12_31 = ""
            L13_32 = " Seconds\n"
            L12_31 = L12_31 .. L13_32
          end
          L11_30(L12_31)
        else
          L11_30 = L10_29["radvd.UnicastOnly"]
          if L11_30 == "1" then
            L11_30 = print
            L12_31 = "Advertise Mode: Unicast only\n"
            L11_30(L12_31)
          end
        end
        L11_30 = print
        L12_31 = "RA Flags : \n"
        L11_30(L12_31)
        L11_30 = L10_29["radvd.AdvManagedFlag"]
        if L11_30 == "0" then
          L11_30 = print
          L12_31 = "Managed: Disabled"
          L11_30(L12_31)
        else
          L11_30 = L10_29["radvd.AdvManagedFlag"]
          if L11_30 == "1" then
            L11_30 = print
            L12_31 = "Managed: Enabled"
            L11_30(L12_31)
          end
        end
        L11_30 = L10_29["radvd.AdvOtherConfigFlag"]
        if L11_30 == "0" then
          L11_30 = print
          L12_31 = "Other: Disabled"
          L11_30(L12_31)
        else
          L11_30 = L10_29["radvd.AdvOtherConfigFlag"]
          if L11_30 == "1" then
            L11_30 = print
            L12_31 = "Other: Enabled"
            L11_30(L12_31)
          end
        end
        L11_30 = L10_29["radvd.AdvDefaultPreference"]
        if L11_30 == "1" then
          L11_30 = print
          L12_31 = "Router Preference: Low"
          L11_30(L12_31)
        else
          L11_30 = L10_29["radvd.AdvDefaultPreference"]
          if L11_30 == "2" then
            L11_30 = print
            L12_31 = "Router Preference: Medium"
            L11_30(L12_31)
          else
            L11_30 = L10_29["radvd.AdvDefaultPreference"]
            if L11_30 == "3" then
              L11_30 = print
              L12_31 = "Router Preference: High"
              L11_30(L12_31)
            end
          end
        end
        L11_30 = L10_29["radvd.AdvLinkMTU"]
        if L11_30 ~= nil then
          L11_30 = print
          L12_31 = "MTU: "
          L13_32 = L10_29["radvd.AdvLinkMTU"]
          L12_31 = L12_31 .. L13_32 .. " "
          L11_30(L12_31)
        end
        L11_30 = L10_29["radvd.AdvDefaultLifetime"]
        if L11_30 ~= nil then
          L11_30 = print
          L12_31 = "Router Lifetime: "
          L13_32 = L10_29["radvd.AdvDefaultLifetime"]
          L12_31 = L12_31 .. L13_32 .. " Seconds"
          L11_30(L12_31)
        end
        L11_30 = L10_29["radvd.LogicalIfName"]
        L12_31 = string
        L12_31 = L12_31.sub
        L13_32 = L11_30
        L12_31 = L12_31(L13_32, 4)
        if L12_31 == nil or L12_31 == "" then
          L12_31 = "1"
        end
        L13_32 = db
        L13_32 = L13_32.getAttribute
        L13_32 = L13_32("vlan", "vlanId", L12_31, "vlanName")
        print("Interface: " .. L13_32 .. "\n")
      end
    end
  end
  L5_24(L6_25, L7_26)
end
function radvdpoolCfgGet(A0_33)
  local L1_34, L2_35, L3_36, L4_37, L5_38, L6_39, L7_40, L8_41, L9_42, L10_43, L11_44, L12_45
  L1_34 = db
  L1_34 = L1_34.getTable
  L2_35 = "radvdLANPrefixPool"
  L1_34 = L1_34(L2_35)
  L2_35 = {}
  L3_36 = 0
  L4_37(L5_38)
  for L7_40, L8_41 in L4_37(L5_38) do
    L3_36 = L3_36 + 1
    L9_42 = L1_34[L3_36]
    L10_43 = L9_42["radvdLANPrefixPool.interfaceName"]
    L11_44 = db
    L11_44 = L11_44.getAttribute
    L12_45 = "radvd"
    L11_44 = L11_44(L12_45, "LogicalIfName", L10_43, "isEnabled")
    L11_44 = L11_44 or ""
    if L11_44 == "1" then
      L12_45 = resTab
      L12_45 = L12_45.insertField
      L12_45(L2_35, "Radvd Status", "Enabled")
    else
      L12_45 = resTab
      L12_45 = L12_45.insertField
      L12_45(L2_35, "Radvd Status", "Disabled")
    end
    L12_45 = resTab
    L12_45 = L12_45.insertField
    L12_45(L2_35, "ROW ID", L9_42["radvdLANPrefixPool._ROWID_"] or "")
    L12_45 = resTab
    L12_45 = L12_45.insertField
    L12_45(L2_35, "IPv6 Prefix", L9_42["radvdLANPrefixPool.radvdAdvPrefix"] or "")
    L12_45 = resTab
    L12_45 = L12_45.insertField
    L12_45(L2_35, "IPv6 Prefix Length", L9_42["radvdLANPrefixPool.radvdAdvPrefixLength"] or "")
    L12_45 = resTab
    L12_45 = L12_45.insertField
    L12_45(L2_35, "Life Time", L9_42["radvdLANPrefixPool.radvdAdvPrefixLifetime"] or "")
    L12_45 = string
    L12_45 = L12_45.sub
    L12_45 = L12_45(L10_43, 4)
    if L12_45 == nil or L12_45 == "" then
      L12_45 = "1"
    end
    resTab.insertField(L2_35, "Interface", db.getAttribute("vlan", "vlanId", L12_45, "vlanName") or "")
  end
  L4_37(L5_38, L6_39)
end
function radvdPoolCfgInit(A0_46)
  local L1_47, L2_48, L3_49
  if A0_46[1] == nil then
    configRow = {}
    configRow["radvdLANPrefixPool._ROWID_"] = "-1"
    configRow["radvdLANPrefixPool.radvdAdvPrefixLength"] = "64"
    configRow["radvdLANPrefixPool.Base6to4Interface"] = db.getAttribute("WanMode", "_ROWID_", "1", "DedicatedLogicalIfName")
  else
    L1_47 = A0_46[1]
    L2_48 = L1_47
    if L1_47 == "1" then
      L1_47 = ""
    end
    L3_49 = "LAN" .. L1_47
    configRow = db.getRow("radvdLANPrefixPool", "interfaceName", L3_49)
  end
  if configRow == nil then
    print("Row doesn't exist.\n")
    return -1, {}
  end
  if A0_46[1] ~= nil then
    configRow["radvdLANPrefixPool._ROWID_"] = db.getAttribute("radvdLANPrefixPool", "interfaceName", L3_49, "_ROWID_")
    configRow["radvdLANPrefixPool.vlanId"] = L2_48
  end
  return configRow["radvdLANPrefixPool._ROWID_"], configRow
end
function radvdPoolCfgSave(A0_50)
  DBTable = "radvdLANPrefixPool"
  if db.getTable(radvdLANPrefixPoolTable) ~= nil and #db.getTable(radvdLANPrefixPoolTable) >= _UPVALUE0_ then
    statusMessage = "Maximum limit for Advertisement prefixes is reached."
    return "ERROR", statusMessage
  end
  if A0_50["radvdLANPrefixPool._ROWID_"] == "-1" then
    errorFlag, statusCode = radvd.profileConfig(A0_50, A0_50["radvdLANPrefixPool._ROWID_"], "add")
  else
    errorFlag, statusCode = radvd.profileConfig(A0_50, A0_50["radvdLANPrefixPool._ROWID_"], "edit")
  end
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  return errorFlag, statusMessage
end
function radvdPoolCfgDel(A0_51)
  DBTable = "radvdLANPrefixPool"
  rows = {}
  rows.rowid = A0_51["radvdLANPrefixPool._ROWID_"]
  if rows then
    errorFlag, statusCode = radvdPrefix.deleteProfiles(rows)
  end
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  return errorFlag, statusMessage
end
