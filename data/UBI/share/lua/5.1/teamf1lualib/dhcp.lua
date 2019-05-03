local L0_0, L1_1
L0_0 = {}
dhcp = L0_0
L0_0 = {}
inTable = L0_0
L0_0 = "DhcpfixedIpAddress"
dhcpReservedIpTable = L0_0
L0_0 = "IPMACBinding"
ipMacBindingTable = L0_0
L0_0 = "_ROWID_"
ROW_ID = L0_0
L0_0 = "AssociatingEnabled"
AssociatingEnabled = L0_0
L0_0 = "IPAddress"
IPAddressIpMac = L0_0
L0_0 = "IpAddr"
IpAddrReservedIp = L0_0
L0_0 = 512
DSR_1000_MAXLIMIT = L0_0
L0_0 = 256
DSR_500_MAXLIMIT = L0_0
L0_0 = 128
DSR_250_MAXLIMIT = L0_0
L0_0 = 64
DSR_150_MAXLIMIT = L0_0
L0_0 = DSR_1000_MAXLIMIT
RESERVED_IP_MAXLIMIT = L0_0
L0_0 = PRODUCT_ID
if L0_0 ~= "DSR-500AC_Ax" then
  L0_0 = PRODUCT_ID
  if L0_0 ~= "DSR-500_Bx" then
    L0_0 = UNIT_NAME
    if L0_0 ~= "DSR-500" then
      L0_0 = UNIT_NAME
    end
  end
else
  if L0_0 == "DSR-500N" then
    L0_0 = DSR_500_MAXLIMIT
    RESERVED_IP_MAXLIMIT = L0_0
end
else
  L0_0 = UNIT_NAME
  if L0_0 ~= "DSR-250" then
    L0_0 = UNIT_NAME
  else
    if L0_0 == "DSR-250N" then
      L0_0 = DSR_250_MAXLIMIT
      RESERVED_IP_MAXLIMIT = L0_0
  end
  else
    L0_0 = UNIT_NAME
    if L0_0 ~= "DSR-150" then
      L0_0 = UNIT_NAME
    elseif L0_0 == "DSR-150N" then
      L0_0 = DSR_150_MAXLIMIT
      RESERVED_IP_MAXLIMIT = L0_0
    end
  end
end
L0_0 = dhcp
function L1_1(A0_2, A1_3, A2_4)
  local L3_5
  L3_5 = ACCESS_LEVEL
  if L3_5 ~= 0 then
    L3_5 = "ACCESS_DENIED"
    return L3_5, "10187"
  end
  L3_5 = db
  L3_5 = L3_5.beginTransaction
  L3_5()
  L3_5 = false
  if A2_4 == "add" then
    return nil
  elseif A2_4 == "edit" then
    L3_5 = dhcp.updateConfig(A0_2, A1_3)
  elseif A2_4 == "delete" then
    return nil
  end
  if L3_5 then
    db.commitTransaction()
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10560"
  end
end
L0_0.config = L1_1
L0_0 = dhcp
function L1_1(A0_6, A1_7)
  local L2_8
  L2_8 = {}
  L2_8["dhcp.dhcpEnabled"] = A0_6["dhcp.dhcpEnabled"]
  if A0_6["dhcp.dhcpEnabled"] ~= 0 then
    L2_8["dhcp.domainName"] = A0_6["dhcp.domainName"]
    L2_8["dhcp.startAddress"] = A0_6["dhcp.startAddress"]
    L2_8["dhcp.endAddress"] = A0_6["dhcp.endAddress"]
    L2_8["dhcp.defaultGw"] = A0_6["dhcp.defaultGw"]
    L2_8["dhcp.primaryDnsServer"] = A0_6["dhcp.primaryDnsServer"]
    L2_8["dhcp.secondaryDnsServer"] = A0_6["dhcp.secondaryDnsServer"]
    L2_8["dhcp.tftpServerOption66"] = A0_6["dhcp.tftpServerOption66"]
    L2_8["dhcp.winsServer"] = A0_6["dhcp.winsServer"]
    L2_8["dhcp.leaseTime"] = A0_6["dhcp.leaseTime"]
    L2_8["dhcp.enableDnsProxy"] = A0_6["dhcp.enableDnsProxy"]
  end
  if dhcp.inputvalidate(L2_8) then
    return db.update("dhcp", L2_8, A1_7)
  end
end
L0_0.updateConfig = L1_1
L0_0 = dhcp
function L1_1(A0_9)
  do return db.typeAndRangeValidate(A0_9) end
  return false
end
L0_0.inputvalidate = L1_1
L0_0 = dhcp
function L1_1(A0_10, A1_11, A2_12)
  local L3_13, L4_14, L5_15, L6_16, L7_17, L8_18, L9_19
  L3_13 = ACCESS_LEVEL
  if L3_13 ~= 0 then
    L3_13 = "ACCESS_DENIED"
    L4_14 = "10187"
    return L3_13, L4_14
  end
  if A2_12 == "add" then
    L3_13 = db
    L3_13 = L3_13.getTable
    L4_14 = "DhcpfixedIpAddress"
    L3_13 = L3_13(L4_14)
    if L3_13 ~= nil and L3_13 ~= "" then
      L4_14 = #L3_13
      if L4_14 >= L5_15 then
        L4_14 = "ERROR"
        return L4_14, L5_15
      end
      L4_14 = tonumber
      L4_14 = L4_14(L5_15)
      if L4_14 == 1 then
        L4_14 = db
        L4_14 = L4_14.getTable
        L4_14 = L4_14(L5_15)
        L3_13 = L4_14
        L4_14 = #L3_13
        if L4_14 >= L5_15 then
          L4_14 = printCLIError
          L4_14(L5_15)
          L4_14 = "ERROR"
          return L4_14, L5_15
        end
      end
    else
      L4_14 = "ERROR"
      return L4_14, L5_15
    end
    L4_14 = db
    L4_14 = L4_14.existsRow
    L4_14 = L4_14(L5_15, L6_16, L7_17)
    if L4_14 then
      L4_14 = "ERROR"
      return L4_14, L5_15
    end
    L4_14 = db
    L4_14 = L4_14.existsRow
    L4_14 = L4_14(L5_15, L6_16, L7_17)
    if L4_14 then
      L4_14 = "ERROR"
      return L4_14, L5_15
    end
    L4_14 = db
    L4_14 = L4_14.existsRow
    L4_14 = L4_14(L5_15, L6_16, L7_17)
    if L4_14 then
      L4_14 = "ERROR"
      return L4_14, L5_15
    end
  elseif A2_12 == "edit" then
    L3_13 = db
    L3_13 = L3_13.getAttribute
    L4_14 = "DhcpfixedIpAddress"
    L3_13 = L3_13(L4_14, L5_15, L6_16, L7_17)
    if L3_13 ~= nil and L3_13 ~= A1_11 then
      L4_14 = "ERROR"
      return L4_14, L5_15
    end
    L4_14 = db
    L4_14 = L4_14.getAttribute
    L8_18 = "_ROWID_"
    L4_14 = L4_14(L5_15, L6_16, L7_17, L8_18)
    L3_13 = L4_14
    if L3_13 ~= nil and L3_13 ~= A1_11 then
      L4_14 = "ERROR"
      return L4_14, L5_15
    end
    L4_14 = db
    L4_14 = L4_14.existsRow
    L4_14 = L4_14(L5_15, L6_16, L7_17)
    if L4_14 then
      L4_14 = db
      L4_14 = L4_14.getAttribute
      L8_18 = "IPAddress"
      L4_14 = L4_14(L5_15, L6_16, L7_17, L8_18)
      L8_18 = A1_11
      L9_19 = "IpAddr"
      if L4_14 ~= L5_15 then
        return L6_16, L7_17
      end
    end
    L4_14, L8_18 = nil, nil
    L9_19 = db
    L9_19 = L9_19.getAttribute
    L9_19 = L9_19("DhcpfixedIpAddress", "_ROWID_", A1_11, "IpAddr")
    L4_14 = L9_19
    L9_19 = db
    L9_19 = L9_19.getAttribute
    L9_19 = L9_19("DhcpfixedIpAddress", "_ROWID_", A1_11, "MacAddr")
    L9_19 = "SourceMACAddress"
    L9_19 = db
    L9_19 = L9_19.existsRowWhere
    L9_19 = L9_19("IPMACBinding", L7_17)
    isIPMacBindingRow = L9_19
    L9_19 = tonumber
    L9_19 = L9_19(A0_10["DhcpfixedIpAddress.AssociatingEnabled"])
    if L9_19 == 1 then
      L9_19 = isIPMacBindingRow
      if L9_19 == false then
        L9_19 = db
        L9_19 = L9_19.getTable
        L9_19 = L9_19("IPMACBinding")
        L8_18 = L9_19
        L9_19 = #L8_18
        if L9_19 >= RESERVED_IP_MAXLIMIT then
          L9_19 = printCLIError
          L9_19("Association is not allowed," .. "Max entries are configured for IP/MAC Binding.\n")
          L9_19 = "ERROR"
          return L9_19, "11097"
        end
      end
    end
  end
  L3_13 = db
  L3_13 = L3_13.beginTransaction
  L3_13()
  L3_13 = {}
  L4_14 = false
  if L5_15 == nil then
    A0_10["DhcpfixedIpAddress.AssociatingEnabled"] = ""
  end
  if L5_15 == nil then
    A0_10["DhcpfixedIpAddress.Name"] = ""
  end
  if L5_15 == nil then
    A0_10["DhcpfixedIpAddress.cloneMac"] = ""
  end
  L3_13["IPMACBinding.Name"] = L5_15
  L3_13["IPMACBinding.SourceMACAddress"] = L5_15
  L3_13["IPMACBinding.IPAddress"] = L5_15
  L3_13["IPMACBinding.AssociatingEnabled"] = L5_15
  L3_13["IPMACBinding.LogStatus"] = L5_15
  if A2_12 == "add" then
    if L5_15 == "1" then
      L8_18 = "' and "
      L9_19 = "IPAddress"
      whereSet = L5_15
      if L5_15 == false then
        L8_18 = A0_10["DhcpfixedIpAddress.MacAddr"]
        if L5_15 then
          L6_16()
          return L6_16, L7_17
        end
        L8_18 = "IPAddress"
        L9_19 = A0_10["DhcpfixedIpAddress.IpAddr"]
        if L5_15 then
          L6_16()
          return L6_16, L7_17
        end
        L8_18 = A0_10
        L4_14 = L6_16
        L8_18 = L3_13
        L4_14 = L6_16
      else
        L8_18 = A0_10["DhcpfixedIpAddress.MacAddr"]
        L9_19 = "_ROWID_"
        rowId = L5_15
        L4_14 = L5_15
        L8_18 = rowId
        L4_14 = L5_15
      end
    else
      L4_14 = L5_15
    end
  elseif A2_12 == "edit" then
    L8_18 = A1_11
    L9_19 = "IpAddr"
    ipMac_IPAddress = L5_15
    L8_18 = A1_11
    L9_19 = "AssociatingEnabled"
    oldstatus = L5_15
    L8_18 = A1_11
    L4_14 = L5_15
    if L5_15 == "1" then
      L8_18 = ipMac_IPAddress
      L9_19 = "_ROWID_"
      if L5_15 then
        L8_18 = L3_13
        L9_19 = L5_15
        L4_14 = L6_16
      else
        L8_18 = L3_13
        L4_14 = L6_16
      end
    end
    if L5_15 == "1" then
      if L5_15 == "0" then
        inTable = L5_15
        L8_18 = ipMac_IPAddress
        L9_19 = "_ROWID_"
        if L5_15 then
          L6_16["IPMACBinding._ROWID_"] = L5_15
          L8_18 = inTable
          L4_14 = L6_16
        else
          L4_14 = true
        end
      end
    end
  elseif A2_12 == "delete" then
    if L5_15 == 0 then
      L8_18 = dhcpReservedIpTable
      L9_19 = "."
      L8_18 = L8_18 .. L9_19 .. ROW_ID
      L8_18 = A0_10[L8_18]
      L9_19 = IpAddrReservedIp
      ipMac_IPAddress = L5_15
      if L5_15 ~= nil then
        if L5_15 == "1" then
          L8_18 = ipMac_IPAddress
          L9_19 = ROW_ID
          L8_18 = "."
          L9_19 = ROW_ID
          L6_16[L7_17] = L5_15
        end
      end
    else
      for L8_18, L9_19 in L5_15(L6_16) do
        ipMac_IPAddress = db.getAttribute("DhcpfixedIpAddress", "_ROWID_", L9_19, "IpAddr")
        if L9_19["DhcpfixedIpAddress.AssociatingEnabled"] == "1" then
          inTable[L8_18][ipMacBindingTable .. "." .. ROW_ID] = db.getAttribute("IPMACBinding", "IPAddress", ipMac_IPAddress, "_ROWID_")
        end
      end
    end
    L4_14 = L5_15
    L4_14 = L5_15
    if L4_14 == false then
      errStr = L5_15
    end
  end
  if L4_14 then
    L5_15()
    return L5_15, L6_16
  else
    L5_15()
    return L5_15, L6_16
  end
end
L0_0.fixedIpConfig = L1_1
L0_0 = dhcp
function L1_1(A0_20, A1_21)
  local L2_22, L3_23, L4_24, L5_25, L6_26, L7_27, L8_28
  L2_22 = ACCESS_LEVEL
  if L2_22 ~= 0 then
    L2_22 = "ACCESS_DENIED"
    L3_23 = "10187"
    return L2_22, L3_23
  end
  L2_22 = db
  L2_22 = L2_22.beginTransaction
  L2_22()
  L2_22 = false
  L3_23 = false
  L4_24 = "LogicalIfName = '"
  L5_25 = A1_21
  L6_26 = "'"
  L4_24 = L4_24 .. L5_25 .. L6_26
  L5_25 = db
  L5_25 = L5_25.getRowWhere
  L6_26 = "dhcp"
  L7_27 = L4_24
  L5_25 = L5_25(L6_26, L7_27)
  L6_26 = db
  L6_26 = L6_26.getRowWhere
  L7_27 = "DhcpRelay"
  L8_28 = L4_24
  L6_26 = L6_26(L7_27, L8_28)
  L7_27 = {}
  L8_28 = A0_20["dhcp.dhcpEnabled"]
  if L8_28 == "3" then
    A0_20["dhcp.dhcpEnabled"] = "0"
    L7_27["DhcpRelay.DhcpRelayStatus"] = "1"
    L8_28 = A0_20["DhcpRelay.RelayGateway"]
    L7_27["DhcpRelay.RelayGateway"] = L8_28
  else
    L7_27["DhcpRelay.DhcpRelayStatus"] = "0"
  end
  L8_28 = nil
  if L5_25 ~= nil then
    L8_28 = L5_25["dhcp._ROWID_"]
  end
  if L8_28 ~= nil then
    L3_23 = dhcp.updateConfig(A0_20, L8_28)
  end
  if L3_23 and L6_26 ~= nil then
    L8_28 = L6_26["DhcpRelay._ROWID_"]
    L3_23 = L3_23 and db.update("DhcpRelay", L7_27, L8_28)
  end
  if L3_23 then
    db.commitTransaction()
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10560"
  end
end
L0_0.dhcpConfigWrap = L1_1
