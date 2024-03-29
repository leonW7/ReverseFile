local L0_0, L1_1, L2_2
L0_0 = require
L1_1 = "teamf1lualib/nimfView"
L0_0(L1_1)
L0_0, L1_1, L2_2 = nil, nil, nil
if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-500AC" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" then
  require("teamf1lualib/bl_teredoTunnel")
  require("teamf1lualib/returnCodes")
  require("teamf1lualib/errorMap")
  L0_0 = require("com.teamf1.bl.ipv6.teredo")
  L1_1 = require("com.teamf1.core.errorMap")
  L2_2 = require("com.teamf1.core.returnCodes")
end
function sixToFourTunnelCfgInit(A0_3)
  configRow = db.getRow("sixToFourTunnel", "_ROWID_", "1")
  if configRow == nil then
    configRow = db.getDefaults(true, "sixToFourTunnel")
  end
  return 1, configRow
end
function sixToFourTunnelCfgSave(A0_4)
  DBTable = "sixToFourTunnel"
  errorFlag, statusCode = nimfView.sixtoFourTunnelConfig(A0_4, "1", "edit")
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  return errorFlag, statusMessage
end
function sixToFourTunnelCfgInputVal(A0_5)
  if db.getAttribute("networkInfo", "_ROWID_", "1", "netWorkMode") == "1" then
    printCLIError("Please Set IP Mode to IPv4/IPv6 to configure IPv6 Tunnels.")
    return false
  end
  return true
end
function ipv6TunnelsCfgGet(A0_6)
  local L1_7, L2_8, L3_9, L4_10, L5_11, L6_12, L7_13, L8_14, L9_15, L10_16, L11_17
  L1_7 = {}
  L2_8 = db
  L2_8 = L2_8.getRow
  L3_9 = "sixToFourTunnel"
  L4_10 = "_ROWID_"
  L2_8 = L2_8(L3_9, L4_10, L5_11)
  L3_9 = printLabel
  L4_10 = "IPv6 Tunnels"
  L3_9(L4_10)
  L3_9 = sixToFourTunnelCfgInputVal
  L3_9 = L3_9()
  if L3_9 then
    L3_9 = print
    L4_10 = "6 to 4 Tunneling\n"
    L3_9(L4_10)
    L3_9 = L2_8["sixToFourTunnel.tunnelStatus"]
    if L3_9 == "1" then
      L3_9 = print
      L4_10 = "Automatic Tunneling is Enabled\n"
      L3_9(L4_10)
    else
      L3_9 = L2_8["sixToFourTunnel.tunnelStatus"]
      if L3_9 == "0" then
        L3_9 = print
        L4_10 = "Automatic Tunneling is Disabled\n"
        L3_9(L4_10)
      end
    end
    L3_9 = UNIT_NAME
    if L3_9 ~= "DSR-1000AC" then
      L3_9 = UNIT_NAME
      if L3_9 ~= "DSR-500AC" then
        L3_9 = PRODUCT_ID
        if L3_9 ~= "DSR-1000_Bx" then
          L3_9 = PRODUCT_ID
        end
      end
    elseif L3_9 == "DSR-500_Bx" then
      L3_9 = _UPVALUE0_
      L3_9 = L3_9.teredoConfigGet
      L4_10 = L3_9()
      L8_14 = "Teredo Tunneling\n"
      L7_13(L8_14)
      if L4_10 == "1" then
        L8_14 = "Teredo Tunneling is Enabled\n"
        L7_13(L8_14)
        L8_14 = "Primary Server :\t"
        L9_15 = L5_11
        L10_16 = "\n"
        L8_14 = L8_14 .. L9_15 .. L10_16
        L7_13(L8_14)
        L8_14 = "Secondary Server :\t"
        L9_15 = L6_12
        L10_16 = "\n"
        L8_14 = L8_14 .. L9_15 .. L10_16
        L7_13(L8_14)
      else
        L8_14 = "Teredo Tunneling is Disabled\n"
        L7_13(L8_14)
      end
    end
    L3_9 = print
    L4_10 = "List of Available ISATAP Tunnels\n"
    L3_9(L4_10)
    L3_9 = 0
    L4_10 = db
    L4_10 = L4_10.getTable
    L4_10 = L4_10(L5_11)
    for L8_14, L9_15 in L5_11(L6_12) do
      L3_9 = L3_9 + 1
      L10_16 = L4_10[L3_9]
      L11_17 = L10_16["isatapTunnel.localIPv4Address"]
      L11_17 = L11_17 or ""
      if L10_16["isatapTunnel.useLanAddress"] == "1" and db.getRowWhere("ipAddressTable", "LogicalIfName='LAN' AND AddressFamily=2") ~= nil then
        L11_17 = db.getRowWhere("ipAddressTable", "LogicalIfName='LAN' AND AddressFamily=2")["ipAddressTable.ipAddress"] or ""
      end
      resTab.insertField(L1_7, "ROW ID", L10_16["isatapTunnel._ROWID_"] or "")
      resTab.insertField(L1_7, "LocalEndpoint", L11_17)
      resTab.insertField(L1_7, "ISATAP Subnet Prefix", L10_16["isatapTunnel.isatapPrefix"] or "")
    end
    L5_11(L6_12, L7_13)
  end
end
function ipv6TunnelsStatusGet(A0_18)
  local L1_19, L2_20, L3_21, L4_22, L5_23, L6_24, L7_25, L8_26, L9_27, L10_28, L11_29, L12_30, L13_31, L14_32, L15_33, L16_34, L17_35, L18_36, L19_37, L20_38
  L1_19 = {}
  L2_20 = 0
  L3_21 = {}
  L4_22 = printLabel
  L4_22(L5_23)
  L4_22 = print
  L4_22(L5_23)
  L4_22 = sixToFourTunnelCfgInputVal
  L4_22 = L4_22()
  if L4_22 then
    L4_22 = db
    L4_22 = L4_22.getRowsWhere
    L4_22 = L4_22(L5_23, L6_24)
    for L8_26, L9_27 in L5_23(L6_24) do
      L2_20 = L2_20 + 1
      L10_28 = L4_22[L2_20]
      L11_29 = db
      L11_29 = L11_29.getAttribute
      L12_30 = "WanMode"
      L13_31 = "_ROWID_"
      L14_32 = "1"
      L15_33 = "DedicatedLogicalIfName"
      L11_29 = L11_29(L12_30, L13_31, L14_32, L15_33)
      L11_29 = L11_29 or ""
      if L11_29 == "WAN1" then
        L11_29 = "sit0-WAN1"
      else
        L11_29 = "sit0-WAN2"
      end
      L12_30 = L10_28["networkInterface.LogicalIfName"]
      L12_30 = L12_30 or ""
      L13_31 = db
      L13_31 = L13_31.getRowsWhere
      L14_32 = "ipAddressTable"
      L15_33 = "LogicalIfName='"
      L15_33 = L15_33 .. L16_34 .. L17_35
      L13_31 = L13_31(L14_32, L15_33)
      L14_32 = ""
      L15_33 = 0
      if L12_30 == "sit0-WAN1" or L12_30 == "sit0-WAN2" then
        if L11_29 == L12_30 then
          for L19_37, L20_38 in L16_34(L17_35) do
            L15_33 = L15_33 + 1
            if L14_32 == "" then
              L14_32 = L13_31[L15_33]["ipAddressTable.ipAddress"] .. "/" .. L13_31[L15_33]["ipAddressTable.ipv6PrefixLen"]
            else
              L14_32 = L14_32 .. ", " .. L13_31[L15_33]["ipAddressTable.ipAddress"] .. "/" .. L13_31[L15_33]["ipAddressTable.ipv6PrefixLen"]
            end
          end
        end
      else
        for L19_37, L20_38 in L16_34(L17_35) do
          L15_33 = L15_33 + 1
          if L14_32 == "" then
            L14_32 = L13_31[L15_33]["ipAddressTable.ipAddress"] .. " / " .. L13_31[L15_33]["ipAddressTable.ipv6PrefixLen"]
          else
            L14_32 = L14_32 .. ", " .. L13_31[L15_33]["ipAddressTable.ipAddress"] .. " / " .. L13_31[L15_33]["ipAddressTable.ipv6PrefixLen"]
          end
        end
      end
      if L16_34 ~= "DSR-1000AC" then
      elseif L16_34 == "DSR-500_Bx" then
        if L17_35 ~= 0 then
          L3_21[L17_35] = L18_36
        end
      end
      L19_37 = L12_30
      L16_34(L17_35, L18_36, L19_37)
      L19_37 = L14_32
      L16_34(L17_35, L18_36, L19_37)
      if L16_34 ~= "DSR-1000AC" then
      elseif L16_34 == "DSR-500_Bx" then
        for L19_37, L20_38 in L16_34(L17_35) do
          resTab.insertField(L1_19, "Tunnel Name", L19_37)
          resTab.insertField(L1_19, "IPv6 Address(es)", L20_38)
        end
      end
    end
    L5_23(L6_24, L7_25)
  end
end
