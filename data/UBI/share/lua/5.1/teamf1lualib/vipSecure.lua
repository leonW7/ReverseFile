local L0_0, L1_1
L0_0 = {}
vipSecure = L0_0
L0_0 = vipSecure
function L1_1(A0_2, A1_3, A2_4)
  local L3_5
  L3_5 = ACCESS_LEVEL
  if L3_5 ~= 0 then
    L3_5 = "ACCESS_DENIED"
    return L3_5, "10187"
  end
  L3_5 = db
  L3_5 = L3_5.existsRow
  L3_5 = L3_5("IpsecIKEPolicy", "IKEPolicyName", A0_2["IpsecIKEPolicy.IKEPolicyName"])
  if L3_5 then
    L3_5 = db
    L3_5 = L3_5.existsRow
    L3_5 = L3_5("IpsecIKEPolicy", "IKEPolicyName", A0_2["IpsecIKEPolicy.IKEPolicyName"])
    if L3_5 ~= A1_3 then
      return "ERROR", "10949"
    end
  end
  L3_5 = false
  if A2_4 == "edit" then
    if A0_2["IpsecIKEPolicy.LocalIdentifierType"] == "0" then
      A0_2["IpsecIKEPolicy.LocalIdentifier"] = ""
    end
    if A0_2["IpsecIKEPolicy.RemoteIdentifierType"] == "0" then
      A0_2["IpsecIKEPolicy.RemoteIdentifier"] = ""
    end
  end
  if tonumber(A0_2["IpsecIKEPolicy.XAUTHType"]) > 1 then
    A0_2["IpsecIKEPolicy.XAUTHType"] = A0_2["IpsecIKEPolicy.XAUTHType1"]
  else
    A0_2["IpsecIKEPolicy.XAUTHType"] = A0_2["IpsecIKEPolicy.XAUTHType"]
  end
  if db.typeAndRangeValidate(A0_2) then
    if A2_4 == "add" then
      L3_5 = db.insert(DBTable, A0_2)
    elseif A2_4 == "edit" then
      L3_5 = db.update(DBTable, A0_2, A1_3)
    elseif A2_4 == "delete" then
      L3_5 = db.delete(DBTable, A0_2)
    end
  end
  if L3_5 then
    return "OK", "12265"
  else
    return "ERROR", "10948"
  end
end
L0_0.ikeConfig = L1_1
L0_0 = vipSecure
function L1_1(A0_6)
  local L1_7, L2_8, L3_9
  L1_7 = ACCESS_LEVEL
  if L1_7 ~= 0 then
    L1_7 = "ACCESS_DENIED"
    L2_8 = "10187"
    return L1_7, L2_8
  end
  L1_7 = true
  L2_8 = {}
  L3_9 = A0_6["IpsecVPNPolicy.PolicyType"]
  if L3_9 == "1" then
    L3_9 = A0_6["IpsecVPNPolicy.VPNPolicyName"]
    L2_8["IpsecIKEPolicy._ROWID_"] = db.getAttribute("IpsecIKEPolicy", "IKEPolicyName", L3_9, "_ROWID_")
    L1_7 = db.delete("IpsecIKEPolicy", L2_8)
  end
  return L1_7
end
L0_0.ikeDeletePolicy = L1_1
L0_0 = vipSecure
function L1_1(A0_10)
  local L1_11, L2_12
  L1_11 = db
  L1_11 = L1_11.getRow
  L2_12 = "IpsecIKEPolicy"
  L1_11 = L1_11(L2_12, "_ROWID_", A0_10)
  L2_12 = db
  L2_12 = L2_12.getRows
  L2_12 = L2_12("IpsecVPNPolicy", "IKEPolicyName", L1_11["IpsecIKEPolicy.IKEPolicyName"])
  if L2_12 then
    for _FORV_10_, _FORV_11_ in pairs(L2_12) do
      if L2_12[0 + 1]["IpsecVPNPolicy.Status"] == "1" then
        break
      end
      if L2_12[0 + 1]["IpsecVPNPolicy.TypeofPolicy"] ~= nil and L2_12[0 + 1]["IpsecVPNPolicy.TypeofPolicy"] == "2" then
        break
      end
      if L2_12[0 + 1]["IpsecVPNPolicy.RVGStatus"] == "1" then
        if (db.getAttribute("IpsecVPNPolicy", "VPNPolicyName", L2_12[0 + 1]["IpsecVPNPolicy.BackupPolicyName"], "Status") or "") == "1" then
          break
        end
      end
    end
  end
  if "0" == "0" then
    return "ERROR", "11553"
  elseif true then
    return "ERROR", "12793"
  elseif true then
    return "ERROR", "12794"
  else
    return "OK", "12265"
  end
end
L0_0.ikeEditCheck = L1_1
L0_0 = vipSecure
function L1_1(A0_13, A1_14)
  local L2_15
  if A0_13 == nil then
    return L2_15
  end
  if A0_13["IpsecVPNPolicy.RemoteNetworkType"] == "0" then
    if A0_13["IpsecVPNPolicy.LocalNetworkType"] == "0" then
      L2_15 = db.getRowsWhere("IpsecVPNPolicy", "Status = " .. A1_14 .. " and RemoteNetworkType = 0 and LocalNetworkType = 0")
    elseif A0_13["IpsecVPNPolicy.LocalNetworkType"] == "1" then
      L2_15 = db.getRowsWhere("IpsecVPNPolicy", "Status = " .. A1_14 .. " and RemoteNetworkType = 0 and LocalNetworkType = 1 and LocalStartAddress = '" .. A0_13["IpsecVPNPolicy.LocalStartAddress"] .. "'")
    elseif A0_13["IpsecVPNPolicy.LocalNetworkType"] == "2" then
      L2_15 = db.getRowsWhere("IpsecVPNPolicy", "Status = " .. A1_14 .. " and RemoteNetworkType = 0 and LocalNetworkType = 2 and LocalStartAddress = '" .. A0_13["IpsecVPNPolicy.LocalStartAddress"] .. "' and LocalEndAddress = '" .. A0_13["IpsecVPNPolicy.LocalEndAddress"] .. "'")
    elseif A0_13["IpsecVPNPolicy.LocalNetworkType"] == "3" then
      if A0_13["IpsecVPNPolicy.AddressFamily"] == "10" then
        L2_15 = db.getRowsWhere("IpsecVPNPolicy", "Status = " .. A1_14 .. " and RemoteNetworkType = 0 and LocalNetworkType = 3 and LocalStartAddress = '" .. A0_13["IpsecVPNPolicy.LocalStartAddress"] .. "' and LocalPrefixLength = '" .. A0_13["IpsecVPNPolicy.LocalPrefixLength"] .. "'")
      else
        L2_15 = db.getRowsWhere("IpsecVPNPolicy", "Status = " .. A1_14 .. " and RemoteNetworkType = 0 and LocalNetworkType = 3 and LocalStartAddress = '" .. A0_13["IpsecVPNPolicy.LocalStartAddress"] .. "' and LocalSubnetMask = '" .. A0_13["IpsecVPNPolicy.LocalSubnetMask"] .. "'")
      end
    end
  elseif A0_13["IpsecVPNPolicy.RemoteNetworkType"] == "1" then
    if A0_13["IpsecVPNPolicy.LocalNetworkType"] == "0" then
      L2_15 = db.getRowsWhere("IpsecVPNPolicy", "Status = " .. A1_14 .. " and RemoteNetworkType = 1 and RemoteStartAddress = '" .. A0_13["IpsecVPNPolicy.RemoteStartAddress"] .. "' and LocalNetworkType = 0")
    elseif A0_13["IpsecVPNPolicy.LocalNetworkType"] == "1" then
      L2_15 = db.getRowsWhere("IpsecVPNPolicy", "Status = " .. A1_14 .. " and RemoteNetworkType = 1 and RemoteStartAddress = '" .. A0_13["IpsecVPNPolicy.RemoteStartAddress"] .. "' and LocalNetworkType = 1 and LocalStartAddress = '" .. A0_13["IpsecVPNPolicy.LocalStartAddress"] .. "'")
    elseif A0_13["IpsecVPNPolicy.LocalNetworkType"] == "2" then
      L2_15 = db.getRowsWhere("IpsecVPNPolicy", "Status = " .. A1_14 .. " and RemoteNetworkType = 1 and RemoteStartAddress = '" .. A0_13["IpsecVPNPolicy.RemoteStartAddress"] .. "' and LocalNetworkType = 2 and LocalStartAddress = '" .. A0_13["IpsecVPNPolicy.LocalStartAddress"] .. "' and LocalEndAddress = '" .. A0_13["IpsecVPNPolicy.LocalEndAddress"] .. "'")
    elseif A0_13["IpsecVPNPolicy.LocalNetworkType"] == "3" then
      if A0_13["IpsecVPNPolicy.AddressFamily"] == "10" then
        L2_15 = db.getRowsWhere("IpsecVPNPolicy", "Status = " .. A1_14 .. " and RemoteNetworkType = 1 and RemoteStartAddress = '" .. A0_13["IpsecVPNPolicy.RemoteStartAddress"] .. "' and LocalNetworkType = 3 and LocalStartAddress = '" .. A0_13["IpsecVPNPolicy.LocalStartAddress"] .. "' and LocalPrefixLength = '" .. A0_13["IpsecVPNPolicy.LocalPrefixLength"] .. "'")
      else
        L2_15 = db.getRowsWhere("IpsecVPNPolicy", "Status = " .. A1_14 .. " and RemoteNetworkType = 1 and RemoteStartAddress = '" .. A0_13["IpsecVPNPolicy.RemoteStartAddress"] .. "' and LocalNetworkType = 3 and LocalStartAddress = '" .. A0_13["IpsecVPNPolicy.LocalStartAddress"] .. "' and LocalSubnetMask = '" .. A0_13["IpsecVPNPolicy.LocalSubnetMask"] .. "'")
      end
    end
  elseif A0_13["IpsecVPNPolicy.RemoteNetworkType"] == "2" then
    if A0_13["IpsecVPNPolicy.LocalNetworkType"] == "0" then
      L2_15 = db.getRowsWhere("IpsecVPNPolicy", "Status = " .. A1_14 .. " and RemoteNetworkType = 2 and RemoteStartAddress = '" .. A0_13["IpsecVPNPolicy.RemoteStartAddress"] .. "' and RemoteEndAddress = '" .. A0_13["IpsecVPNPolicy.RemoteEndAddress"] .. "' and LocalNetworkType = 0")
    elseif A0_13["IpsecVPNPolicy.LocalNetworkType"] == "1" then
      L2_15 = db.getRowsWhere("IpsecVPNPolicy", "Status = " .. A1_14 .. " and RemoteNetworkType = 2 and RemoteStartAddress = '" .. A0_13["IpsecVPNPolicy.RemoteStartAddress"] .. "' and RemoteEndAddress = '" .. A0_13["IpsecVPNPolicy.RemoteEndAddress"] .. "' and LocalNetworkType = 1 and LocalStartAddress = '" .. A0_13["IpsecVPNPolicy.LocalStartAddress"] .. "'")
    elseif A0_13["IpsecVPNPolicy.LocalNetworkType"] == "2" then
      L2_15 = db.getRowsWhere("IpsecVPNPolicy", "Status = " .. A1_14 .. " and RemoteNetworkType = 2 and RemoteStartAddress = '" .. A0_13["IpsecVPNPolicy.RemoteStartAddress"] .. "' and RemoteEndAddress = '" .. A0_13["IpsecVPNPolicy.RemoteEndAddress"] .. "' and LocalNetworkType = 2 and LocalStartAddress = '" .. A0_13["IpsecVPNPolicy.LocalStartAddress"] .. "' and LocalEndAddress = '" .. A0_13["IpsecVPNPolicy.LocalEndAddress"] .. "'")
    elseif A0_13["IpsecVPNPolicy.LocalNetworkType"] == "3" then
      if A0_13["IpsecVPNPolicy.AddressFamily"] == "10" then
        L2_15 = db.getRowsWhere("IpsecVPNPolicy", "Status = " .. A1_14 .. " and RemoteNetworkType = 2 and RemoteStartAddress = '" .. A0_13["IpsecVPNPolicy.RemoteStartAddress"] .. "' and RemoteEndAddress = '" .. A0_13["IpsecVPNPolicy.RemoteEndAddress"] .. "' and LocalNetworkType = 3 and LocalStartAddress = '" .. A0_13["IpsecVPNPolicy.LocalStartAddress"] .. "' and LocalPrefixLength = '" .. A0_13["IpsecVPNPolicy.LocalPrefixLength"] .. "'")
      else
        L2_15 = db.getRowsWhere("IpsecVPNPolicy", "Status = " .. A1_14 .. " and RemoteNetworkType = 2 and RemoteStartAddress = '" .. A0_13["IpsecVPNPolicy.RemoteStartAddress"] .. "' and RemoteEndAddress = '" .. A0_13["IpsecVPNPolicy.RemoteEndAddress"] .. "' and LocalNetworkType = 3 and LocalStartAddress = '" .. A0_13["IpsecVPNPolicy.LocalStartAddress"] .. "' and LocalSubnetMask = '" .. A0_13["IpsecVPNPolicy.LocalSubnetMask"] .. "'")
      end
    end
  elseif A0_13["IpsecVPNPolicy.RemoteNetworkType"] == "3" then
    if A0_13["IpsecVPNPolicy.AddressFamily"] == "10" then
      if A0_13["IpsecVPNPolicy.LocalNetworkType"] == "0" then
        L2_15 = db.getRowsWhere("IpsecVPNPolicy", "Status = " .. A1_14 .. " and RemoteNetworkType = 3 and RemoteStartAddress = '" .. A0_13["IpsecVPNPolicy.RemoteStartAddress"] .. "' and RemotePrefixLength = '" .. A0_13["IpsecVPNPolicy.RemotePrefixLength"] .. "' and LocalNetworkType = 0")
      elseif A0_13["IpsecVPNPolicy.LocalNetworkType"] == "1" then
        L2_15 = db.getRowsWhere("IpsecVPNPolicy", "Status = " .. A1_14 .. " and RemoteNetworkType = 3 and RemoteStartAddress = '" .. A0_13["IpsecVPNPolicy.RemoteStartAddress"] .. "' and RemotePrefixLength = '" .. A0_13["IpsecVPNPolicy.RemotePrefixLength"] .. "' and LocalNetworkType = 1 and LocalStartAddress = '" .. A0_13["IpsecVPNPolicy.LocalStartAddress"] .. "'")
      elseif A0_13["IpsecVPNPolicy.LocalNetworkType"] == "2" then
        L2_15 = db.getRowsWhere("IpsecVPNPolicy", "Status = " .. A1_14 .. " and RemoteNetworkType = 3 and RemoteStartAddress = '" .. A0_13["IpsecVPNPolicy.RemoteStartAddress"] .. "' and RemotePrefixLength = '" .. A0_13["IpsecVPNPolicy.RemotePrefixLength"] .. "' and LocalNetworkType = 2 and LocalStartAddress = '" .. A0_13["IpsecVPNPolicy.LocalStartAddress"] .. "' and LocalEndAddress = '" .. A0_13["IpsecVPNPolicy.LocalEndAddress"] .. "'")
      elseif A0_13["IpsecVPNPolicy.LocalNetworkType"] == "3" then
        L2_15 = db.getRowsWhere("IpsecVPNPolicy", "Status = " .. A1_14 .. " and RemoteNetworkType = 3 and RemoteStartAddress = '" .. A0_13["IpsecVPNPolicy.RemoteStartAddress"] .. "' and RemotePrefixLength = '" .. A0_13["IpsecVPNPolicy.RemotePrefixLength"] .. "' and LocalNetworkType = 3 and LocalStartAddress = '" .. A0_13["IpsecVPNPolicy.LocalStartAddress"] .. "' and LocalPrefixLength = '" .. A0_13["IpsecVPNPolicy.LocalPrefixLength"] .. "'")
      end
    elseif A0_13["IpsecVPNPolicy.LocalNetworkType"] == "0" then
      L2_15 = db.getRowsWhere("IpsecVPNPolicy", "Status = " .. A1_14 .. " and RemoteNetworkType = 3 and RemoteStartAddress = '" .. A0_13["IpsecVPNPolicy.RemoteStartAddress"] .. "' and RemoteSubnetMask = '" .. A0_13["IpsecVPNPolicy.RemoteSubnetMask"] .. "' and LocalNetworkType = 0")
    elseif A0_13["IpsecVPNPolicy.LocalNetworkType"] == "1" then
      L2_15 = db.getRowsWhere("IpsecVPNPolicy", "Status = " .. A1_14 .. " and RemoteNetworkType = 3 and RemoteStartAddress = '" .. A0_13["IpsecVPNPolicy.RemoteStartAddress"] .. "' and RemoteSubnetMask = '" .. A0_13["IpsecVPNPolicy.RemoteSubnetMask"] .. "' and LocalNetworkType = 1 and LocalStartAddress = '" .. A0_13["IpsecVPNPolicy.LocalStartAddress"] .. "'")
    elseif A0_13["IpsecVPNPolicy.LocalNetworkType"] == "2" then
      L2_15 = db.getRowsWhere("IpsecVPNPolicy", "Status = " .. A1_14 .. " and RemoteNetworkType = 3 and RemoteStartAddress = '" .. A0_13["IpsecVPNPolicy.RemoteStartAddress"] .. "' and RemoteSubnetMask = '" .. A0_13["IpsecVPNPolicy.RemoteSubnetMask"] .. "' and LocalNetworkType = 2 and LocalStartAddress = '" .. A0_13["IpsecVPNPolicy.LocalStartAddress"] .. "' and LocalEndAddress = '" .. A0_13["IpsecVPNPolicy.LocalEndAddress"] .. "'")
    elseif A0_13["IpsecVPNPolicy.LocalNetworkType"] == "3" then
      L2_15 = db.getRowsWhere("IpsecVPNPolicy", "Status = " .. A1_14 .. " and RemoteNetworkType = 3 and RemoteStartAddress = '" .. A0_13["IpsecVPNPolicy.RemoteStartAddress"] .. "' and RemoteSubnetMask = '" .. A0_13["IpsecVPNPolicy.RemoteSubnetMask"] .. "' and LocalNetworkType = 3 and LocalStartAddress = '" .. A0_13["IpsecVPNPolicy.LocalStartAddress"] .. "' and LocalSubnetMask = '" .. A0_13["IpsecVPNPolicy.LocalSubnetMask"] .. "'")
    end
  end
  return L2_15
end
L0_0.getDuplicatePolicies = L1_1
L0_0 = vipSecure
function L1_1(A0_16, A1_17, A2_18)
  local L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26, L11_27, L12_28, L13_29, L14_30, L15_31, L16_32, L17_33
  L3_19 = ACCESS_LEVEL
  if L3_19 ~= 0 then
    L3_19 = "ACCESS_DENIED"
    L4_20 = "10187"
    return L3_19, L4_20
  end
  if A2_18 == nil then
    A2_18 = false
  end
  if not A2_18 then
    L3_19 = db
    L3_19 = L3_19.beginTransaction
    L3_19()
  end
  L3_19 = false
  L4_20 = false
  L5_21 = nil
  L6_22 = {}
  L7_23 = {}
  if A1_17 then
    L7_23["IpsecVPNPolicy.Status"] = "1"
  else
    L7_23["IpsecVPNPolicy.Status"] = "0"
  end
  L8_24 = true
  for L12_28, L13_29 in L9_25(L10_26) do
    L14_30 = db
    L14_30 = L14_30.getAttribute
    L15_31 = "IpsecVPNPolicy"
    L16_32 = "_ROWID_"
    L17_33 = L13_29
    L14_30 = L14_30(L15_31, L16_32, L17_33, "Status")
    if A1_17 then
      L15_31 = db
      L15_31 = L15_31.getRow
      L16_32 = "IpsecVPNPolicy"
      L17_33 = "_ROWID_"
      L15_31 = L15_31(L16_32, L17_33, L13_29)
      L16_32 = L15_31["IpsecVPNPolicy.TunnelOrTransport"]
      if L16_32 == "1" then
        L16_32 = L15_31["IpsecVPNPolicy.EnableDhcpOverIPSec"]
        if L16_32 == "0" then
          L16_32 = vipSecure
          L16_32 = L16_32.getDuplicatePolicies
          L17_33 = L15_31
          L16_32 = L16_32(L17_33, 1)
          if L16_32 ~= nil then
            L17_33 = #L16_32
            if L17_33 == 1 then
              L17_33 = L16_32[1]
              L17_33 = L17_33["IpsecVPNPolicy._ROWID_"]
              if L17_33 ~= L13_29 then
                L17_33 = L16_32[1]
                L17_33 = L17_33["IpsecVPNPolicy.Status"]
                if L17_33 == "1" then
                  L17_33 = L16_32[1]
                  L17_33 = L17_33["IpsecVPNPolicy.TunnelOrTransport"]
                  if L17_33 ~= "0" then
                    L17_33 = L16_32[1]
                    L17_33 = L17_33["IpsecVPNPolicy.TunnelOrTransport"]
                    if L17_33 == "1" then
                      L17_33 = L16_32[1]
                      L17_33 = L17_33["IpsecVPNPolicy.EnableDhcpOverIPSec"]
                    end
                  elseif L17_33 == "0" then
                    if not A2_18 then
                      L17_33 = db
                      L17_33 = L17_33.rollback
                      L17_33()
                    end
                    L17_33 = "ERROR"
                    return L17_33, "10380"
                  end
                end
              end
            end
          end
        end
      else
        L16_32 = L15_31["IpsecVPNPolicy.TunnelOrTransport"]
        if L16_32 == "0" then
          L16_32 = db
          L16_32 = L16_32.getRowsWhere
          L17_33 = "IpsecVPNPolicy"
          L16_32 = L16_32(L17_33, "RemoteEndPoint = '" .. L15_31["IpsecVPNPolicy.RemoteEndPoint"] .. "'")
          if L16_32 ~= nil then
            L17_33 = util
            L17_33 = L17_33.appendDebugOut
            L17_33("I am here")
            L17_33 = 0
            for _FORV_21_, _FORV_22_ in pairs(L16_32) do
              L17_33 = L17_33 + 1
              util.appendDebugOut("Status" .. L16_32[L17_33]["IpsecVPNPolicy.Status"])
              if L13_29 ~= L16_32[L17_33]["IpsecVPNPolicy._ROWID_"] and L16_32[L17_33]["IpsecVPNPolicy.Status"] == "1" then
                if not A2_18 then
                  db.rollback()
                end
                return "ERROR", "11114"
              end
            end
          end
        else
          L16_32 = L15_31["IpsecVPNPolicy.TunnelOrTransport"]
          if L16_32 == "1" then
            L16_32 = L15_31["IpsecVPNPolicy.EnableDhcpOverIPSec"]
            if L16_32 == "1" then
              L16_32 = db
              L16_32 = L16_32.existsRow
              L17_33 = "IpsecVPNPolicy"
              L16_32 = L16_32(L17_33, "RemoteEndPoint", L15_31["IpsecVPNPolicy.RemoteEndPoint"])
              if L16_32 then
                L16_32 = db
                L16_32 = L16_32.existsRow
                L17_33 = "IpsecVPNPolicy"
                L16_32 = L16_32(L17_33, "RemoteEndPoint", L15_31["IpsecVPNPolicy.RemoteEndPoint"])
                L17_33 = L15_31["IpsecVPNPolicy._ROWID_"]
                if L16_32 ~= L17_33 then
                  if not A2_18 then
                    L17_33 = db
                    L17_33 = L17_33.rollback
                    L17_33()
                  end
                  L17_33 = "ERROR"
                  return L17_33, "11114"
                end
              end
            end
          end
        end
      end
    end
    L15_31 = L7_23["IpsecVPNPolicy.Status"]
    if L14_30 ~= L15_31 then
      L8_24 = false
      L15_31 = db
      L15_31 = L15_31.getAttribute
      L16_32 = "IpsecVPNPolicy"
      L17_33 = "_ROWID_"
      L15_31 = L15_31(L16_32, L17_33, L13_29, "PolicyType")
      if L15_31 ~= "2" then
        L15_31 = db
        L15_31 = L15_31.getAttribute
        L16_32 = "IpsecVPNPolicy"
        L17_33 = "_ROWID_"
        L15_31 = L15_31(L16_32, L17_33, L13_29, "IKEPolicyName")
        L15_31 = L15_31 or ""
        L16_32 = db
        L16_32 = L16_32.getAttribute
        L17_33 = "IpsecIKEPolicy"
        L16_32 = L16_32(L17_33, "IKEPolicyName", L15_31, "_ROWID_")
        L5_21 = L16_32
        if L5_21 ~= nil then
          L16_32 = db
          L16_32 = L16_32.getRow
          L17_33 = "IpsecIKEPolicy"
          L16_32 = L16_32(L17_33, "_ROWID_", L5_21)
          L6_22 = L16_32
          if A1_17 then
            L16_32 = L6_22["IpsecIKEPolicy.LocalIdentifier"]
            if L16_32 ~= "" then
              L16_32 = L6_22["IpsecIKEPolicy.RemoteIdentifier"]
            elseif L16_32 == "" then
              L16_32 = {}
              L17_33 = db
              L17_33 = L17_33.getAttribute
              L17_33 = L17_33("IpsecIKEPolicy", "_ROWID_", L5_21, "LocalIdentifierType")
              if L17_33 ~= nil and L17_33 == "0" then
                if db.getAttribute("IpsecVPNPolicy", "_ROWID_", L13_29, "LocalGateway") == "0" then
                  L16_32 = db.getRowWhere("ipAddressTable", "LogicalIfName = 'WAN1' AND addressFamily = 2")
                elseif db.getAttribute("IpsecVPNPolicy", "_ROWID_", L13_29, "LocalGateway") == "1" then
                  L16_32 = db.getRowWhere("ipAddressTable", "LogicalIfName = 'WAN2' AND addressFamily = 2")
                elseif db.getAttribute("IpsecVPNPolicy", "_ROWID_", L13_29, "LocalGateway") == "2" then
                  L16_32 = db.getRowWhere("ipAddressTable", "LogicalIfName = 'WAN3' AND addressFamily = 2")
                end
                L6_22["IpsecIKEPolicy.LocalIdentifier"] = ""
                if L16_32 ~= nil then
                  L6_22["IpsecIKEPolicy.LocalIdentifier"] = L16_32["ipAddressTable.ipAddress"]
                end
              end
              if db.getAttribute("IpsecIKEPolicy", "_ROWID_", L5_21, "RemoteIdentifierType") ~= nil and db.getAttribute("IpsecIKEPolicy", "_ROWID_", L5_21, "RemoteIdentifierType") == "0" then
                L6_22["IpsecIKEPolicy.RemoteIdentifier"] = db.getAttribute("IpsecVPNPolicy", "_ROWID_", L13_29, "RemoteEndPoint") or ""
              end
              L4_20 = true
            end
          else
            L16_32 = db
            L16_32 = L16_32.getRowsWhere
            L17_33 = "IpsecVPNPolicy"
            L16_32 = L16_32(L17_33, "IKEPolicyName = '" .. L15_31 .. "'")
            L4_20 = true
            L17_33 = 0
            for _FORV_21_, _FORV_22_ in pairs(L16_32) do
              L17_33 = L17_33 + 1
              if L16_32[L17_33]["IpsecVPNPolicy.Status"] == "1" and L16_32[L17_33]["IpsecVPNPolicy._ROWID_"] ~= L13_29 then
                L4_20 = false
                break
              end
            end
            if L4_20 then
              if L6_22["IpsecIKEPolicy.LocalIdentifierType"] == "0" then
                L6_22["IpsecIKEPolicy.LocalIdentifier"] = ""
              end
              if L6_22["IpsecIKEPolicy.RemoteIdentifierType"] == "0" then
                L6_22["IpsecIKEPolicy.RemoteIdentifier"] = ""
              end
            end
          end
        end
      end
      if A1_17 then
        L15_31 = db
        L15_31 = L15_31.getRow
        L16_32 = "IpsecVPNPolicy"
        L17_33 = "_ROWID_"
        L15_31 = L15_31(L16_32, L17_33, L13_29)
        L16_32 = L15_31["IpsecVPNPolicy.RVGStatus"]
        if L16_32 == "1" then
          L16_32 = db
          L16_32 = L16_32.getAttribute
          L17_33 = "IpsecVPNPolicy"
          L16_32 = L16_32(L17_33, "VPNPolicyName", L15_31["IpsecVPNPolicy.BackupPolicyName"], "Status")
          L16_32 = L16_32 or ""
          if L16_32 == "1" then
            if not A2_18 then
              L17_33 = db
              L17_33 = L17_33.rollback
              L17_33()
            end
            L17_33 = "ERROR"
            return L17_33, "12794"
          end
        end
        L16_32 = L15_31["IpsecVPNPolicy.PolicyType"]
        if L16_32 == "1" then
          L16_32 = L15_31["IpsecVPNPolicy.RVGStatus"]
          if L16_32 == "1" then
            L16_32 = L15_31["IpsecVPNPolicy.BackupPolicyName"]
            if L16_32 ~= nil then
              L16_32 = vipSecure
              L16_32 = L16_32.rvgConfigCheck
              L17_33 = L13_29
              L17_33 = L16_32(L17_33)
              errCode = L17_33
              configStatus = L16_32
              L16_32 = configStatus
              if L16_32 ~= "OK" then
                if not A2_18 then
                  L16_32 = db
                  L16_32 = L16_32.rollback
                  L16_32()
                end
                L16_32 = "ERROR"
                L17_33 = errCode
                return L16_32, L17_33
              end
            end
          end
        end
      end
      L15_31 = db
      L15_31 = L15_31.update
      L16_32 = "IpsecVPNPolicy"
      L17_33 = L7_23
      L15_31 = L15_31(L16_32, L17_33, L13_29)
      L3_19 = L15_31
      if L3_19 and not A1_17 then
        L15_31 = db
        L15_31 = L15_31.getRow
        L16_32 = "IpsecVPNPolicy"
        L17_33 = "_ROWID_"
        L15_31 = L15_31(L16_32, L17_33, L13_29)
        L16_32 = L15_31["IpsecVPNPolicy.TunnelOrTransport"]
        if L16_32 ~= "0" then
          L16_32 = L15_31["IpsecVPNPolicy.TunnelOrTransport"]
          if L16_32 == "1" then
            L16_32 = L15_31["IpsecVPNPolicy.EnableDhcpOverIPSec"]
          end
        elseif L16_32 == "0" then
          L16_32 = vipSecure
          L16_32 = L16_32.getDuplicatePolicies
          L17_33 = L15_31
          L16_32 = L16_32(L17_33, 0)
          if L16_32 ~= 0 then
            L17_33 = #L16_32
            if L17_33 > 0 then
              L17_33 = util
              L17_33 = L17_33.appendDebugOut
              L17_33("TABLE: " .. util.tableToStringRec(L16_32))
              L17_33 = util
              L17_33 = L17_33.appendDebugOut
              L17_33("#vpnPolicies: " .. #L16_32 .. " dup rowId " .. L16_32[1]["IpsecVPNPolicy._ROWID_"] .. " orig rowId: " .. L13_29)
            end
          end
          L17_33 = 0
          if L16_32 ~= nil and #L16_32 > 0 then
            if L16_32[1]["IpsecVPNPolicy._ROWID_"] ~= L13_29 then
              L17_33 = 1
            elseif L16_32[1]["IpsecVPNPolicy._ROWID_"] == L13_29 and #L16_32 > 1 then
              L17_33 = 2
            end
          end
          util.appendDebugOut("row: " .. L17_33)
          if L16_32 ~= nil and #L16_32 > 0 and L17_33 > 0 and L16_32[L17_33]["IpsecVPNPolicy._ROWID_"] ~= L13_29 and L15_31["IpsecVPNPolicy.RVGStatus"] == "0" and L15_31["IpsecVPNPolicy.BackupPolicyName"] ~= L16_32[L17_33]["IpsecVPNPolicy.VPNPolicyName"] and L16_32 ~= nil and #L16_32 > 0 and L17_33 > 0 and L16_32[L17_33]["IpsecVPNPolicy._ROWID_"] ~= L13_29 and L16_32[L17_33]["IpsecVPNPolicy.Status"] == "0" then
            util.appendDebugOut("line 399")
            db.setAttribute("IpsecVPNPolicy", "_ROWID_", L16_32[L17_33]["IpsecVPNPolicy._ROWID_"], "Status", "1")
          end
        end
      end
      if L3_19 and L4_20 then
        L15_31 = db
        L15_31 = L15_31.update
        L16_32 = "IpsecIKEPolicy"
        L17_33 = L6_22
        L15_31 = L15_31(L16_32, L17_33, L5_21)
        L3_19 = L15_31
        L5_21 = nil
        L15_31 = {}
        L6_22 = L15_31
        L4_20 = false
        if not L3_19 then
          break
        end
      end
    end
  end
  if L8_24 then
    if not A2_18 then
      L9_25(L10_26)
    end
    if A1_17 then
      return L9_25, L10_26
    else
      return L9_25, L10_26
    end
  end
  if L3_19 then
    if not A2_18 then
      L9_25(L10_26)
    end
    if A1_17 then
      return L9_25, L10_26
    else
      return L9_25, L10_26
    end
  else
    if not A2_18 then
      L9_25()
    end
    if A1_17 then
      return L9_25, L10_26
    else
      return L9_25, L10_26
    end
  end
end
L0_0.ipsecVPNPolicyEnable = L1_1
L0_0 = vipSecure
function L1_1(A0_34, A1_35, A2_36, A3_37)
  local L4_38, L5_39, L6_40, L7_41, L8_42, L9_43, L10_44, L11_45, L12_46, L13_47, L14_48
  L4_38 = ACCESS_LEVEL
  if L4_38 ~= 0 then
    L4_38 = "ACCESS_DENIED"
    L5_39 = "10187"
    return L4_38, L5_39
  end
  if A3_37 == nil then
    A3_37 = false
  end
  if A2_36 == "add" then
    L4_38 = db
    L4_38 = L4_38.getTable
    L5_39 = "IpsecVPNPolicy"
    L4_38 = L4_38(L5_39)
    L5_39 = #L4_38
    if L5_39 == 70 then
      L5_39 = "ERROR"
      L6_40 = "13164"
      return L5_39, L6_40
    end
  end
  if A2_36 == "edit" then
    L4_38 = db
    L4_38 = L4_38.getRow
    L5_39 = "IpsecVPNPolicy"
    L6_40 = "_ROWID_"
    L7_41 = A1_35
    L4_38 = L4_38(L5_39, L6_40, L7_41)
    L5_39 = L4_38["IpsecVPNPolicy.RVGStatus"]
    if L5_39 == "1" then
      L5_39 = db
      L5_39 = L5_39.getAttribute
      L6_40 = "IpsecVPNPolicy"
      L7_41 = "VPNPolicyName"
      L5_39 = L5_39(L6_40, L7_41, L8_42, L9_43)
      L5_39 = L5_39 or ""
      if L5_39 == "1" then
        L6_40 = db
        L6_40 = L6_40.getColNames
        L7_41 = "IpsecVPNPolicy"
        L6_40 = L6_40(L7_41)
        L7_41 = false
        for L11_45, L12_46 in L8_42(L9_43) do
          if L12_46 == "BackupPolicyName" then
            if L13_47 ~= nil then
            end
          else
            if L13_47 == L14_48 then
              if L12_46 == "FailbackTime" then
                if L13_47 ~= nil then
                end
              elseif L13_47 == L14_48 then
                if L12_46 ~= "RVGStatus" and L12_46 ~= "BackupPolicyName" and L12_46 ~= "FailbackTime" then
                  if L13_47 ~= nil then
                  end
                end
              end
          end
          elseif L13_47 ~= L14_48 then
            L7_41 = true
            break
          end
        end
        if L7_41 then
          return L8_42, L9_43
        end
      end
    end
  end
  L4_38 = A0_34["IpsecVPNPolicy.PolicyType"]
  if L4_38 == "1" then
  else
    L4_38 = db
    L4_38 = L4_38.existsRow
    L5_39 = "IpsecVPNPolicy"
    L6_40 = "RemoteEndPoint"
    L7_41 = A0_34["IpsecVPNPolicy.RemoteEndPoint"]
    L4_38 = L4_38(L5_39, L6_40, L7_41)
    if L4_38 then
      L4_38 = db
      L4_38 = L4_38.existsRow
      L5_39 = "IpsecVPNPolicy"
      L6_40 = "RemoteEndPoint"
      L7_41 = A0_34["IpsecVPNPolicy.RemoteEndPoint"]
      L4_38 = L4_38(L5_39, L6_40, L7_41)
      if L4_38 ~= A1_35 then
        L5_39 = "ERROR"
        L6_40 = "11114"
        return L5_39, L6_40
      end
    end
  end
  L4_38 = db
  L4_38 = L4_38.existsRow
  L5_39 = "IpsecVPNPolicy"
  L6_40 = "VPNPolicyName"
  L7_41 = A0_34["IpsecVPNPolicy.VPNPolicyName"]
  L4_38 = L4_38(L5_39, L6_40, L7_41)
  if L4_38 then
    L4_38 = db
    L4_38 = L4_38.existsRow
    L5_39 = "IpsecVPNPolicy"
    L6_40 = "VPNPolicyName"
    L7_41 = A0_34["IpsecVPNPolicy.VPNPolicyName"]
    L4_38 = L4_38(L5_39, L6_40, L7_41)
    if L4_38 ~= A1_35 then
      L5_39 = "ERROR"
      L6_40 = "12507"
      return L5_39, L6_40
    end
  end
  L4_38 = A0_34["IpsecVPNPolicy.PolicyType"]
  if L4_38 ~= "1" then
    L4_38 = A0_34["IpsecVPNPolicy.PolicyType"]
  else
    if L4_38 == "3" then
      L4_38 = A0_34["IpsecVPNPolicy.RemoteEndPointType"]
      if L4_38 == "1" then
        L4_38 = A0_34["IpsecVPNPolicy.RemoteNetworkType"]
        if L4_38 == "0" then
          L4_38 = db
          L4_38 = L4_38.getRow
          L5_39 = "IpsecIKEPolicy"
          L6_40 = "IKEPolicyName"
          L7_41 = A0_34["IpsecVPNPolicy.IKEPolicyName"]
          L4_38 = L4_38(L5_39, L6_40, L7_41)
          L5_39 = L4_38["IpsecIKEPolicy.LocalIdentifierType"]
          if L5_39 ~= "0" then
            A0_34["IpsecVPNPolicy.AutoPolicyType"] = "2"
          else
            A0_34["IpsecVPNPolicy.AutoPolicyType"] = "1"
          end
        end
      else
        A0_34["IpsecVPNPolicy.AutoPolicyType"] = "0"
      end
  end
  else
    A0_34["IpsecVPNPolicy.AutoPolicyType"] = "0"
  end
  L4_38 = A0_34["IpsecVPNPolicy.AutoPolicyType"]
  if L4_38 == "0" then
    L4_38 = A0_34["IpsecVPNPolicy.modeConfigStatus"]
    if L4_38 == "1" then
      if not A3_37 then
        L4_38 = db
        L4_38 = L4_38.rollback
        L4_38()
      end
      L4_38 = "ERROR"
      L5_39 = "11393"
      return L4_38, L5_39
    end
  end
  L4_38 = A0_34["IpsecVPNPolicy.AutoPolicyType"]
  if L4_38 ~= "1" then
    L4_38 = A0_34["IpsecVPNPolicy.AutoPolicyType"]
  elseif L4_38 == "2" then
    L4_38 = A0_34["IpsecVPNPolicy.EnableKeepAlive"]
    if L4_38 == "1" then
      if not A3_37 then
        L4_38 = db
        L4_38 = L4_38.rollback
        L4_38()
      end
      L4_38 = "ERROR"
      L5_39 = "13166"
      return L4_38, L5_39
    end
  end
  L4_38 = A0_34["IpsecVPNPolicy.TunnelOrTransport"]
  if L4_38 ~= "1" then
    L4_38 = A0_34["IpsecVPNPolicy.EnableDhcpOverIPSec"]
  else
    if L4_38 == "1" then
      L4_38 = A0_34["IpsecVPNPolicy.TunnelOrTransport"]
  end
  elseif L4_38 ~= "0" then
    L4_38 = vipSecure
    L4_38 = L4_38.getDuplicatePolicies
    L5_39 = A0_34
    L6_40 = 1
    L4_38 = L4_38(L5_39, L6_40)
    if A2_36 == "add" and L4_38 ~= nil then
      L5_39 = #L4_38
      if L5_39 ~= 0 then
        A0_34["IpsecVPNPolicy.Status"] = "0"
        L5_39 = A0_34["IpsecVPNPolicy.IKEPolicyName"]
        L6_40 = db
        L6_40 = L6_40.getRowsWhere
        L7_41 = "IpsecVPNPolicy"
        L6_40 = L6_40(L7_41, L8_42)
        L7_41 = #L6_40
        if L7_41 == 1 then
          L7_41 = L6_40[1]
          L7_41 = L7_41["IpsecVPNPolicy._ROWID_"]
        else
          if L7_41 == A1_35 then
            L7_41 = #L6_40
        end
        elseif L7_41 > 1 then
          L7_41 = L6_40[1]
          if L8_42 == L9_43 then
            if L8_42 == L9_43 then
              return L8_42, L9_43
            end
          end
        end
      end
    elseif A2_36 == "edit" and L4_38 ~= nil then
      L5_39 = #L4_38
      if L5_39 == 1 then
        L5_39 = L4_38[1]
        L5_39 = L5_39["IpsecVPNPolicy._ROWID_"]
        if L5_39 ~= A1_35 then
          A0_34["IpsecVPNPolicy.Status"] = "0"
          L5_39 = A0_34["IpsecVPNPolicy.IKEPolicyName"]
          L6_40 = db
          L6_40 = L6_40.getRowsWhere
          L7_41 = "IpsecVPNPolicy"
          L6_40 = L6_40(L7_41, L8_42)
          L7_41 = #L6_40
          if L7_41 == 1 then
            L7_41 = L6_40[1]
            L7_41 = L7_41["IpsecVPNPolicy._ROWID_"]
          else
            if L7_41 == A1_35 then
              L7_41 = #L6_40
          end
          elseif L7_41 > 1 then
            L7_41 = L6_40[1]
            if L8_42 == L9_43 then
              if L8_42 == L9_43 then
                return L8_42, L9_43
              end
            end
          end
        end
      end
    end
  end
  L4_38 = false
  if A2_36 == "add" then
    L5_39 = A0_34["IpsecVPNPolicy.PolicyType"]
    if L5_39 ~= "2" then
      L5_39 = db
      L5_39 = L5_39.getRow
      L6_40 = "IpsecIKEPolicy"
      L7_41 = "IKEPolicyName"
      L5_39 = L5_39(L6_40, L7_41, L8_42)
      L6_40 = L5_39["IpsecIKEPolicy.IKEPolicyName"]
      L6_40 = L6_40 or ""
      L7_41 = db
      L7_41 = L7_41.getRowsWhere
      L7_41 = L7_41(L8_42, L9_43)
      for L12_46, L13_47 in L9_43(L10_44) do
      end
      if L8_42 then
        if L9_43 == "0" then
          if L10_44 == "0" then
          elseif L10_44 == "1" then
          elseif L10_44 == "2" then
          end
          L5_39["IpsecIKEPolicy.LocalIdentifier"] = ""
          if L9_43 ~= nil then
            L5_39["IpsecIKEPolicy.LocalIdentifier"] = L10_44
          end
        end
        idType = L9_43
        if L9_43 == "0" then
          L5_39["IpsecIKEPolicy.RemoteIdentifier"] = L9_43
        end
        L4_38 = L9_43
      else
        L4_38 = true
      end
    else
      L4_38 = true
    end
  elseif A2_36 == "edit" then
    L5_39 = false
    L6_40 = db
    L6_40 = L6_40.getAttribute
    L7_41 = "IpsecVPNPolicy"
    L6_40 = L6_40(L7_41, L8_42, L9_43, L10_44)
    ikeName = L6_40
    L6_40 = db
    L6_40 = L6_40.getAttribute
    L7_41 = "IpsecVPNPolicy"
    L6_40 = L6_40(L7_41, L8_42, L9_43, L10_44)
    L7_41 = ikeName
    if L7_41 ~= nil then
      L7_41 = ikeName
      if L7_41 ~= "" then
        L7_41 = A0_34["IpsecVPNPolicy.IKEPolicyName"]
        if L7_41 ~= nil then
          L7_41 = ikeName
        else
          if L7_41 == L8_42 then
            L7_41 = A0_34["IpsecVPNPolicy.IKEPolicyName"]
        end
        else
          if L7_41 == nil then
            L5_39 = true
            L7_41 = A0_34["IpsecVPNPolicy.IKEPolicyName"]
            if L7_41 == nil then
              A0_34["IpsecVPNPolicy.IKEPolicyName"] = ""
            end
            L7_41 = db
            L7_41 = L7_41.getAttribute
            L7_41 = L7_41(L8_42, L9_43, L10_44, L11_45)
            if L7_41 ~= nil then
              if L12_46 == 1 then
              else
                for _FORV_15_, _FORV_16_ in L12_46(L13_47) do
                end
              end
              if L11_45 then
                if L12_46 == "0" then
                  L8_42["IpsecIKEPolicy.LocalIdentifier"] = ""
                end
                if L12_46 == "0" then
                  L8_42["IpsecIKEPolicy.RemoteIdentifier"] = ""
                end
              end
              if L11_45 then
                L4_38 = L12_46
              else
                L4_38 = true
              end
            end
        end
        else
          L7_41 = A0_34["IpsecVPNPolicy.RemoteEndPoint"]
          if L6_40 ~= L7_41 then
            L4_38 = true
            L5_39 = true
          else
            L4_38 = true
          end
        end
      end
    else
      L7_41 = A0_34["IpsecVPNPolicy.IKEPolicyName"]
      if L7_41 ~= nil then
        L5_39 = true
      end
      L4_38 = true
    end
    L7_41 = {}
    if L4_38 then
      if L8_42 ~= "2" and L5_39 == true then
        id = L8_42
        if L8_42 ~= nil then
          if L13_47 ~= nil then
            if L13_47 ~= "" then
              if L13_47 == L14_48 then
                if L6_40 ~= L13_47 then
                end
              end
            end
          else
            for _FORV_16_, _FORV_17_ in L13_47(L14_48) do
            end
          end
          if L12_46 and L13_47 == "1" then
            if L14_48 == "0" then
              if db.getAttribute("IpsecVPNPolicy", "VPNPolicyName", A0_34["IpsecVPNPolicy.VPNPolicyName"], "LocalGateway") == "0" then
              elseif db.getAttribute("IpsecVPNPolicy", "VPNPolicyName", A0_34["IpsecVPNPolicy.VPNPolicyName"], "LocalGateway") == "1" then
              elseif db.getAttribute("IpsecVPNPolicy", "VPNPolicyName", A0_34["IpsecVPNPolicy.VPNPolicyName"], "LocalGateway") == "2" then
              end
              L9_43["IpsecIKEPolicy.LocalIdentifier"] = ""
              if L14_48 ~= nil then
                L9_43["IpsecIKEPolicy.LocalIdentifier"] = L14_48["ipAddressTable.ipAddress"]
              end
            end
            if L14_48 == "0" then
              L9_43["IpsecIKEPolicy.RemoteIdentifier"] = L14_48
            end
          end
          if L12_46 then
            L4_38 = L14_48
          else
            L4_38 = true
          end
        end
      end
    end
  end
  if L4_38 then
    if A2_36 == "edit" then
      L5_39 = db
      L5_39 = L5_39.getRow
      L6_40 = "IpsecVPNPolicy"
      L7_41 = "_ROWID_"
      L5_39 = L5_39(L6_40, L7_41, L8_42)
      L6_40 = L5_39["IpsecVPNPolicy.RVGStatus"]
      if L6_40 == "1" then
        L6_40 = A0_34["IpsecVPNPolicy.RVGStatus"]
        if L6_40 ~= nil then
          L6_40 = A0_34["IpsecVPNPolicy.RVGStatus"]
          if L6_40 ~= "0" then
            L6_40 = A0_34["IpsecVPNPolicy.RVGStatus"]
            if L6_40 == "1" then
              L6_40 = A0_34["IpsecVPNPolicy.BackupPolicyName"]
              L7_41 = L5_39["IpsecVPNPolicy.BackupPolicyName"]
            end
          end
        elseif L6_40 ~= L7_41 then
          L6_40 = db
          L6_40 = L6_40.getRow
          L7_41 = "IpsecVPNPolicy"
          L6_40 = L6_40(L7_41, L8_42, L9_43)
          if L6_40 ~= nil then
            L7_41 = vipSecure
            L7_41 = L7_41.rvgConfig
            L7_41 = L7_41(L8_42, L9_43)
            errCode = L8_42
            configStatus = L7_41
            L7_41 = configStatus
            if L7_41 == "OK" then
              L4_38 = true
              L7_41 = A0_34["IpsecVPNPolicy.RVGStatus"]
              if L7_41 ~= nil then
                L7_41 = A0_34["IpsecVPNPolicy.RVGStatus"]
              elseif L7_41 == "0" then
                L7_41 = L5_39["IpsecVPNPolicy.BackupPolicyName"]
                if L7_41 == nil then
                  L7_41 = L5_39["IpsecVPNPolicy.BackupPolicyName"]
                elseif L7_41 ~= "" then
                  A0_34["IpsecVPNPolicy.BackupPolicyName"] = ""
                end
              end
            else
              if not A3_37 then
                L7_41 = db
                L7_41 = L7_41.rollback
                L7_41()
              end
              L7_41 = "ERROR"
              return L7_41, L8_42
            end
          end
        end
      end
    end
    L5_39 = A0_34["IpsecVPNPolicy.RVGStatus"]
    if L5_39 == "1" then
      L5_39 = vipSecure
      L5_39 = L5_39.rvgConfigCheckPrimary
      L6_40 = A0_34
      L6_40 = L5_39(L6_40)
      errCode = L6_40
      configStatus = L5_39
      L5_39 = configStatus
      if L5_39 ~= "OK" then
        if not A3_37 then
          L5_39 = db
          L5_39 = L5_39.rollback
          L5_39()
        end
        L5_39 = "ERROR"
        L6_40 = errCode
        return L5_39, L6_40
      end
    end
    L5_39 = A0_34["IpsecVPNPolicy.PolicyType"]
    if L5_39 == "1" then
      L5_39 = A0_34["IpsecVPNPolicy.RVGStatus"]
      if L5_39 == "1" then
        L5_39 = A0_34["IpsecVPNPolicy.BackupPolicyName"]
        if L5_39 ~= nil then
          L5_39 = db
          L5_39 = L5_39.getAttribute
          L6_40 = "IpsecVPNPolicy"
          L7_41 = "BackupPolicyName"
          L5_39 = L5_39(L6_40, L7_41, L8_42, L9_43)
          if L5_39 then
            L6_40 = vipSecure
            L6_40 = L6_40.rvgConfigCheck
            L7_41 = L5_39
            L7_41 = L6_40(L7_41)
            errCode = L7_41
            configStatus = L6_40
            L6_40 = configStatus
            if L6_40 ~= "OK" then
              if not A3_37 then
                L6_40 = db
                L6_40 = L6_40.rollback
                L6_40()
              end
              L6_40 = "ERROR"
              L7_41 = errCode
              return L6_40, L7_41
            end
          end
          L6_40 = db
          L6_40 = L6_40.getRow
          L7_41 = "IpsecVPNPolicy"
          L6_40 = L6_40(L7_41, L8_42, L9_43)
          if L6_40 ~= nil then
            if A2_36 == "add" then
              L7_41 = vipSecure
              L7_41 = L7_41.rvgConfig
              L7_41 = L7_41(L8_42, L9_43)
              errCode = L8_42
              configStatus = L7_41
              L7_41 = configStatus
              if L7_41 == "OK" then
                L4_38 = true
              else
                if not A3_37 then
                  L7_41 = db
                  L7_41 = L7_41.rollback
                  L7_41()
                end
                L7_41 = "ERROR"
                return L7_41, L8_42
              end
            elseif A2_36 == "edit" then
              L7_41 = db
              L7_41 = L7_41.getRow
              L7_41 = L7_41(L8_42, L9_43, L10_44)
              if L8_42 ~= L9_43 then
                errCode = L9_43
                configStatus = L8_42
                if L8_42 == "OK" then
                  L4_38 = true
                else
                  if not A3_37 then
                    L8_42()
                  end
                  return L8_42, L9_43
                end
              end
            end
          else
            if not A3_37 then
              L7_41 = db
              L7_41 = L7_41.rollback
              L7_41()
            end
            L7_41 = "ERROR"
            return L7_41, L8_42
          end
        end
      end
    else
      L4_38 = true
    end
  end
  if L4_38 then
    L5_39 = vipSecure
    L5_39 = L5_39.ipsecVPNConfig
    L6_40 = A0_34
    L7_41 = A1_35
    L5_39 = L5_39(L6_40, L7_41, L8_42)
    L4_38 = L5_39
  end
  if L4_38 then
    L5_39 = "OK"
    L6_40 = "12265"
    return L5_39, L6_40
  else
    L5_39 = "ERROR"
    L6_40 = "11113"
    return L5_39, L6_40
  end
end
L0_0.ipsecVPNPolicyConfig = L1_1
L0_0 = vipSecure
function L1_1(A0_49)
  if A0_49 == nil then
    return "ERROR", "12817"
  elseif A0_49["IpsecVPNPolicy.PolicyType"] == "2" then
    return "ERROR", "10302"
  elseif A0_49["IpsecVPNPolicy.AutoPolicyType"] == "1" or A0_49["IpsecVPNPolicy.AutoPolicyType"] == "2" then
    return "ERROR", "11931"
  elseif A0_49["IpsecVPNPolicy.IKEPolicyName"] ~= nil then
    if db.getRow("IpsecIKEPolicy", "IKEPolicyName", A0_49["IpsecVPNPolicy.IKEPolicyName"]) == nil then
      return "ERROR", "10950"
    elseif db.getRow("IpsecIKEPolicy", "IKEPolicyName", A0_49["IpsecVPNPolicy.IKEPolicyName"])["IpsecIKEPolicy.DPD"] == "0" then
      return "ERROR", "11564"
    elseif db.getRow("IpsecIKEPolicy", "IKEPolicyName", A0_49["IpsecVPNPolicy.IKEPolicyName"])["IpsecIKEPolicy.Direction"] == "1" then
      return "ERROR", "11930"
    end
  end
  return "OK", ""
end
L0_0.rvgConfigCheckPrimary = L1_1
L0_0 = vipSecure
function L1_1(A0_50)
  if db.getRow("IpsecVPNPolicy", "_ROWID_", A0_50) == nil then
    return "ERROR", "12817"
  elseif db.getRow("IpsecVPNPolicy", "_ROWID_", A0_50)["IpsecVPNPolicy.PolicyType"] == "2" then
    return "ERROR", "10302"
  elseif db.getRow("IpsecVPNPolicy", "_ROWID_", A0_50)["IpsecVPNPolicy.AutoPolicyType"] == "1" or db.getRow("IpsecVPNPolicy", "_ROWID_", A0_50)["IpsecVPNPolicy.AutoPolicyType"] == "2" then
    return "ERROR", "11931"
  elseif db.getRow("IpsecVPNPolicy", "_ROWID_", A0_50)["IpsecVPNPolicy.IKEPolicyName"] ~= nil then
    if db.getRow("IpsecIKEPolicy", "IKEPolicyName", db.getRow("IpsecVPNPolicy", "_ROWID_", A0_50)["IpsecVPNPolicy.IKEPolicyName"]) == nil then
      return "ERROR", "10950"
    elseif db.getRow("IpsecIKEPolicy", "IKEPolicyName", db.getRow("IpsecVPNPolicy", "_ROWID_", A0_50)["IpsecVPNPolicy.IKEPolicyName"])["IpsecIKEPolicy.DPD"] == "0" then
      return "ERROR", "11564"
    elseif db.getRow("IpsecIKEPolicy", "IKEPolicyName", db.getRow("IpsecVPNPolicy", "_ROWID_", A0_50)["IpsecVPNPolicy.IKEPolicyName"])["IpsecIKEPolicy.Direction"] == "1" then
      return "ERROR", "11930"
    end
  end
  return "OK", ""
end
L0_0.rvgConfigCheck = L1_1
L0_0 = vipSecure
function L1_1(A0_51, A1_52)
  local L2_53
  L2_53 = false
  if A1_52 == "1" then
    A0_51["IpsecVPNPolicy.TypeofPolicy"] = "1"
    L2_53 = vipSecure.ipsecVPNConfig(A0_51, A0_51["IpsecVPNPolicy._ROWID_"], "edit")
    if L2_53 then
      return "OK", ""
    end
  elseif A1_52 == "2" then
    if A0_51["IpsecVPNPolicy.TypeofPolicy"] ~= nil and A0_51["IpsecVPNPolicy.TypeofPolicy"] == "2" then
      return "ERROR", "12089"
    else
      if A0_51["IpsecVPNPolicy.PolicyType"] == "2" then
        return "ERROR", "10302"
      elseif A0_51["IpsecVPNPolicy.AutoPolicyType"] == "1" or A0_51["IpsecVPNPolicy.AutoPolicyType"] == "2" then
        return "ERROR", "11931"
      elseif A0_51["IpsecVPNPolicy.IKEPolicyName"] ~= nil then
        if db.getRow("IpsecIKEPolicy", "IKEPolicyName", A0_51["IpsecVPNPolicy.IKEPolicyName"]) == nil then
          return "ERROR", "10950"
        elseif db.getRow("IpsecIKEPolicy", "IKEPolicyName", A0_51["IpsecVPNPolicy.IKEPolicyName"])["IpsecIKEPolicy.DPD"] == "0" then
          return "ERROR", "11564"
        elseif db.getRow("IpsecIKEPolicy", "IKEPolicyName", A0_51["IpsecVPNPolicy.IKEPolicyName"])["IpsecIKEPolicy.Direction"] == "1" then
          return "ERROR", "11930"
        end
      end
      A0_51["IpsecVPNPolicy.TypeofPolicy"] = "2"
      A0_51["IpsecVPNPolicy.Status"] = "0"
      L2_53 = vipSecure.ipsecVPNConfig(A0_51, A0_51["IpsecVPNPolicy._ROWID_"], "edit")
      if L2_53 then
        return "OK", ""
      end
    end
  end
  return "ERROR", "12818"
end
L0_0.rvgConfig = L1_1
L0_0 = vipSecure
function L1_1(A0_54, A1_55, A2_56)
  local L3_57, L4_58, L5_59, L6_60
  L3_57 = A0_54["IpsecVPNPolicy.PolicyType"]
  if L3_57 == "2" then
    A0_54["IpsecVPNPolicy.IKEPolicyName"] = ""
  end
  L3_57 = db
  L3_57 = L3_57.typeAndRangeValidate
  L4_58 = A0_54
  L3_57 = L3_57(L4_58)
  if L3_57 then
    if A2_56 == "add" then
      L3_57 = db
      L3_57 = L3_57.insert
      L4_58 = "IpsecVPNPolicy"
      L5_59 = A0_54
      return L3_57(L4_58, L5_59)
    elseif A2_56 == "edit" then
      L3_57 = db
      L3_57 = L3_57.update
      L4_58 = "IpsecVPNPolicy"
      L5_59 = A0_54
      L6_60 = A1_55
      L5_59 = L3_57(L4_58, L5_59, L6_60)
      if L3_57 == true and L5_59 == "NOUPDATES" then
        L6_60 = db
        L6_60 = L6_60.getAttribute
        L6_60 = L6_60("IpsecVPNPolicy", "VPNPolicyName", A0_54["IpsecVPNPolicy.VPNPolicyName"], "KeyLength")
        db.setAttribute("IpsecVPNPolicy", "VPNPolicyName", A0_54["IpsecVPNPolicy.VPNPolicyName"], "KeyLength", L6_60)
      end
      return L3_57
    elseif A2_56 == "delete" then
      L3_57 = db
      L3_57 = L3_57.delete
      L4_58 = "IpsecVPNPolicy"
      L5_59 = A0_54
      return L3_57(L4_58, L5_59)
    end
  else
    L3_57 = false
    return L3_57
  end
end
L0_0.ipsecVPNConfig = L1_1
L0_0 = vipSecure
function L1_1(A0_61)
  local L1_62, L2_63, L3_64, L4_65, L5_66, L6_67, L7_68, L8_69, L9_70, L10_71, L11_72, L12_73, L13_74
  L1_62 = ACCESS_LEVEL
  if L1_62 ~= 0 then
    L1_62 = "ACCESS_DENIED"
    L2_63 = "10187"
    return L1_62, L2_63
  end
  L1_62 = false
  L2_63 = nil
  for L6_67, L7_68 in L3_64(L4_65) do
    L8_69 = {}
    L8_69["IpsecVPNPolicy._ROWID_"] = L7_68
    L9_70 = db
    L9_70 = L9_70.getAttribute
    L10_71 = "IpsecVPNPolicy"
    L11_72 = "_ROWID_"
    L12_73 = L7_68
    L13_74 = "PolicyType"
    L9_70 = L9_70(L10_71, L11_72, L12_73, L13_74)
    if L9_70 ~= "2" then
      L10_71 = db
      L10_71 = L10_71.getAttribute
      L11_72 = "IpsecVPNPolicy"
      L12_73 = "_ROWID_"
      L13_74 = L7_68
      L10_71 = L10_71(L11_72, L12_73, L13_74, "IKEPolicyName")
      if L10_71 ~= nil then
        L11_72 = db
        L11_72 = L11_72.getAttribute
        L12_73 = "IpsecIKEPolicy"
        L13_74 = "IKEPolicyName"
        L11_72 = L11_72(L12_73, L13_74, L10_71, "_ROWID_")
        if L11_72 ~= nil then
          L12_73 = db
          L12_73 = L12_73.getRow
          L13_74 = "IpsecIKEPolicy"
          L12_73 = L12_73(L13_74, "_ROWID_", L11_72)
          L13_74 = L12_73["IpsecIKEPolicy.IKEPolicyName"]
          L13_74 = L13_74 or ""
          L2_63 = db.getRowsWhere("IpsecVPNPolicy", "IKEPolicyName = '" .. L13_74 .. "'")
          if #L2_63 <= 1 then
            if L12_73["IpsecIKEPolicy.LocalIdentifierType"] == "0" then
              L12_73["IpsecIKEPolicy.LocalIdentifier"] = ""
            end
            if L12_73["IpsecIKEPolicy.RemoteIdentifierType"] == "0" then
              L12_73["IpsecIKEPolicy.RemoteIdentifier"] = ""
            end
          end
          if true then
            L1_62 = db.update("IpsecIKEPolicy", L12_73, L11_72)
          else
            L1_62 = true
          end
        else
          L1_62 = true
        end
      end
    else
      L1_62 = true
    end
    L10_71 = db
    L10_71 = L10_71.getRow
    L11_72 = "IpsecVPNPolicy"
    L12_73 = "_ROWID_"
    L13_74 = L7_68
    L10_71 = L10_71(L11_72, L12_73, L13_74)
    L11_72 = L10_71["IpsecVPNPolicy.RVGStatus"]
    if L11_72 == "1" then
      L11_72 = db
      L11_72 = L11_72.getAttribute
      L12_73 = "IpsecVPNPolicy"
      L13_74 = "VPNPolicyName"
      L11_72 = L11_72(L12_73, L13_74, L10_71["IpsecVPNPolicy.BackupPolicyName"], "Status")
      L11_72 = L11_72 or ""
      if L11_72 == "1" then
        L12_73 = db
        L12_73 = L12_73.rollback
        L12_73()
        L12_73 = "ERROR"
        L13_74 = "12794"
        return L12_73, L13_74
      end
    end
    if L1_62 then
      L11_72 = db
      L11_72 = L11_72.getRow
      L12_73 = "IpsecVPNPolicy"
      L13_74 = "_ROWID_"
      L11_72 = L11_72(L12_73, L13_74, L7_68)
      if L11_72 ~= nil then
        L12_73 = L11_72["IpsecVPNPolicy.RVGStatus"]
        if L12_73 ~= nil then
          L12_73 = L11_72["IpsecVPNPolicy.RVGStatus"]
          if L12_73 == "1" then
            L12_73 = db
            L12_73 = L12_73.getRow
            L13_74 = "IpsecVPNPolicy"
            L12_73 = L12_73(L13_74, "VPNPolicyName", L11_72["IpsecVPNPolicy.BackupPolicyName"])
            if L12_73 ~= nil then
              L13_74 = vipSecure
              L13_74 = L13_74.rvgConfig
              errCode, L13_74 = L12_73, L13_74(L12_73, "1")
              configStatus = L13_74
              L13_74 = configStatus
              if L13_74 == "OK" then
                L1_62 = true
              end
            end
          end
        end
      else
        L1_62 = true
      end
    end
    if L1_62 then
      L11_72 = db
      L11_72 = L11_72.getRow
      L12_73 = "IpsecVPNPolicy"
      L13_74 = "_ROWID_"
      L11_72 = L11_72(L12_73, L13_74, L7_68)
      L12_73 = db
      L12_73 = L12_73.delete
      L13_74 = "IpsecVPNPolicy"
      L12_73 = L12_73(L13_74, L8_69)
      L1_62 = L12_73
      if L1_62 then
        L12_73 = vipSecure
        L12_73 = L12_73.ikeDeletePolicy
        L13_74 = L11_72
        L12_73 = L12_73(L13_74)
        L1_62 = L12_73
        if L1_62 then
          L12_73 = L11_72["IpsecVPNPolicy.TunnelOrTransport"]
          if L12_73 ~= "0" then
            L12_73 = L11_72["IpsecVPNPolicy.TunnelOrTransport"]
            if L12_73 == "1" then
              L12_73 = L11_72["IpsecVPNPolicy.EnableDhcpOverIPSec"]
            end
          elseif L12_73 == "0" then
            L12_73 = vipSecure
            L12_73 = L12_73.getDuplicatePolicies
            L13_74 = L11_72
            L12_73 = L12_73(L13_74, 0)
            if L12_73 ~= 0 then
              L13_74 = #L12_73
              if L13_74 > 0 then
                L13_74 = util
                L13_74 = L13_74.appendDebugOut
                L13_74("#vpnPolicies: " .. #L12_73)
              end
            end
            if L12_73 ~= nil then
              L13_74 = #L12_73
              if L13_74 > 0 then
                L13_74 = L12_73[1]
                L13_74 = L13_74["IpsecVPNPolicy._ROWID_"]
                if L13_74 ~= L7_68 then
                  L13_74 = L12_73[1]
                  L13_74 = L13_74["IpsecVPNPolicy.Status"]
                  if L13_74 == "0" then
                    L13_74 = db
                    L13_74 = L13_74.setAttribute
                    L13_74("IpsecVPNPolicy", "_ROWID_", L12_73[1]["IpsecVPNPolicy._ROWID_"], "Status", "1")
                  end
                end
              end
            end
          end
        end
      end
    end
    if not L1_62 then
      break
    end
  end
  if L1_62 then
    L3_64(L4_65)
    return L3_64, L4_65
  else
    L3_64()
    return L3_64, L4_65
  end
end
L0_0.ipsecVPNPolicyDelete = L1_1
L0_0 = vipSecure
function L1_1(A0_75, A1_76, A2_77)
  local L3_78, L4_79, L5_80, L6_81, L7_82, L8_83
  L3_78 = ACCESS_LEVEL
  if L3_78 ~= 0 then
    L3_78 = "ACCESS_DENIED"
    L4_79 = "10187"
    return L3_78, L4_79
  end
  L3_78 = 70
  L4_79 = 35
  L5_80 = UNIT_NAME
  if L5_80 ~= "DSR-500" then
    L5_80 = UNIT_NAME
  elseif L5_80 == "DSR-500N" then
    L3_78 = L4_79
  end
  if A2_77 == "add" then
    L5_80 = db
    L5_80 = L5_80.getTable
    L6_81 = "IpsecVPNPolicy"
    L5_80 = L5_80(L6_81)
    L6_81 = #L5_80
    if L6_81 == L3_78 then
      L6_81 = "ERROR"
      L7_82 = "13164"
      return L6_81, L7_82
    end
  end
  L5_80 = db
  L5_80 = L5_80.existsRow
  L6_81 = "IpsecVPNPolicy"
  L7_82 = "RemoteEndPoint"
  L8_83 = A0_75["vpnConfig.RemoteIdentifier"]
  L5_80 = L5_80(L6_81, L7_82, L8_83)
  if L5_80 then
    L5_80 = "ERROR"
    L6_81 = "11114"
    return L5_80, L6_81
  end
  L5_80 = db
  L5_80 = L5_80.existsRow
  L6_81 = "IpsecIKEPolicy"
  L7_82 = "IKEPolicyName"
  L8_83 = A0_75["vpnConfig.ConnectionName"]
  L5_80 = L5_80(L6_81, L7_82, L8_83)
  if L5_80 then
    L5_80 = "ERROR"
    L6_81 = "12507"
    return L5_80, L6_81
  end
  L5_80 = db
  L5_80 = L5_80.existsRow
  L6_81 = "IpsecVPNPolicy"
  L7_82 = "VPNPolicyName"
  L8_83 = A0_75["vpnConfig.ConnectionName"]
  L5_80 = L5_80(L6_81, L7_82, L8_83)
  if L5_80 then
    L5_80 = "ERROR"
    L6_81 = "12507"
    return L5_80, L6_81
  end
  L5_80 = db
  L5_80 = L5_80.beginTransaction
  L5_80()
  L5_80 = false
  L6_81 = {}
  L7_82 = A0_75["vpnConfig.ConnectionName"]
  L6_81["IpsecIKEPolicy.IKEPolicyName"] = L7_82
  L7_82 = A0_75["vpnConfig.AddressFamily"]
  if L7_82 ~= nil then
    L7_82 = A0_75["vpnConfig.AddressFamily"]
    L6_81["IpsecIKEPolicy.AddressFamily"] = L7_82
  end
  L7_82 = tonumber
  L8_83 = A0_75["vpnConfig.Peer"]
  L7_82 = L7_82(L8_83)
  if L7_82 == 0 then
    L6_81["IpsecIKEPolicy.Direction"] = "2"
  else
    L6_81["IpsecIKEPolicy.Direction"] = "1"
  end
  L7_82 = A0_75["vpnConfig.IKEVersion"]
  if L7_82 ~= nil then
    L7_82 = A0_75["vpnConfig.IKEVersion"]
    L6_81["IpsecIKEPolicy.IKEVersion"] = L7_82
  end
  L7_82 = tonumber
  L8_83 = A0_75["vpnConfig.Peer"]
  L7_82 = L7_82(L8_83)
  if L7_82 == 0 then
    L6_81["IpsecIKEPolicy.ExchangeMode"] = "0"
  else
    L6_81["IpsecIKEPolicy.ExchangeMode"] = "1"
  end
  L7_82 = A0_75["vpnConfig.LocalIdentifierType"]
  L6_81["IpsecIKEPolicy.LocalIdentifierType"] = L7_82
  L7_82 = A0_75["vpnConfig.LocalIdentifier"]
  L6_81["IpsecIKEPolicy.LocalIdentifier"] = L7_82
  L7_82 = A0_75["vpnConfig.RemoteIdentifierType"]
  L6_81["IpsecIKEPolicy.RemoteIdentifierType"] = L7_82
  L7_82 = A0_75["vpnConfig.RemoteIdentifier"]
  L6_81["IpsecIKEPolicy.RemoteIdentifier"] = L7_82
  L7_82 = A0_75["vpnConfig.PresharedKey"]
  L6_81["IpsecIKEPolicy.Presharedkey"] = L7_82
  L6_81["IpsecIKEPolicy.ModeConfigStatus"] = "0"
  L7_82 = HIGH_SEC
  if L7_82 ~= "HIGH" then
    L6_81["IpsecIKEPolicy.EncryptionAlgorithm"] = "1"
    L6_81["IpsecIKEPolicy.AuthAlgorithm"] = "1"
    L6_81["IpsecIKEPolicy.DHGroup"] = "1"
  end
  L7_82 = db
  L7_82 = L7_82.typeAndRangeValidate
  L8_83 = L6_81
  L7_82 = L7_82(L8_83)
  if L7_82 then
    if A2_77 == "add" then
      L7_82 = db
      L7_82 = L7_82.insert
      L8_83 = "IpsecIKEPolicy"
      L7_82 = L7_82(L8_83, L6_81)
      L5_80 = L7_82
    elseif A2_77 == "edit" then
      L7_82 = db
      L7_82 = L7_82.update
      L8_83 = DBTable
      L7_82 = L7_82(L8_83, L6_81, A1_76)
      L5_80 = L7_82
    elseif A2_77 == "delete" then
      L7_82 = db
      L7_82 = L7_82.delete
      L8_83 = DBTable
      L7_82 = L7_82(L8_83, L6_81)
      L5_80 = L7_82
    end
  end
  L7_82 = {}
  L8_83 = A0_75["vpnConfig.ConnectionName"]
  L7_82["IpsecVPNPolicy.VPNPolicyName"] = L8_83
  L8_83 = A0_75["vpnConfig.AddressFamily"]
  if L8_83 ~= nil then
    L8_83 = A0_75["vpnConfig.AddressFamily"]
    L7_82["IpsecVPNPolicy.AddressFamily"] = L8_83
  end
  L7_82["IpsecVPNPolicy.modeConfigStatus"] = "0"
  L8_83 = tonumber
  L8_83 = L8_83(A0_75["vpnConfig.Peer"])
  if L8_83 == 0 then
    L7_82["IpsecVPNPolicy.Netbios"] = "1"
    L7_82["IpsecVPNPolicy.RemoteNetworkType"] = "3"
    L7_82["IpsecVPNPolicy.AutoPolicyType"] = "0"
  else
    L7_82["IpsecVPNPolicy.Netbios"] = "0"
    L7_82["IpsecVPNPolicy.RemoteNetworkType"] = "0"
    L8_83 = A0_75["vpnConfig.LocalIdentifierType"]
    if L8_83 ~= "0" then
      L7_82["IpsecVPNPolicy.AutoPolicyType"] = "2"
    else
      L7_82["IpsecVPNPolicy.AutoPolicyType"] = "1"
    end
  end
  L8_83 = A0_75["vpnConfig.Interface"]
  L7_82["IpsecVPNPolicy.LocalGateway"] = L8_83
  L8_83 = A0_75["IpsecVPNPolicy.EnableDhcpOverIPSec"]
  L7_82["IpsecVPNPolicy.EnableDhcpOverIPSec"] = L8_83
  L8_83 = A0_75["vpnConfig.RemoteIdentifierType"]
  L7_82["IpsecVPNPolicy.RemoteEndPointType"] = L8_83
  L8_83 = A0_75["vpnConfig.RemoteIdentifier"]
  L7_82["IpsecVPNPolicy.RemoteEndPoint"] = L8_83
  L8_83 = {}
  if A0_75["vpnConfig.AddressFamily"] == "10" then
    L8_83 = db.getRowWhere("ipAddressTable", "LogicalIfName = 'LAN' AND addressFamily = 10")
  else
    L8_83 = db.getRowWhere("ipAddressTable", "LogicalIfName = 'LAN' AND addressFamily = 2")
  end
  if tonumber(A0_75["vpnConfig.Peer"]) == 1 then
    if L8_83 ~= nil then
      if A0_75["vpnConfig.AddressFamily"] == "10" then
      else
      end
    end
    L7_82["IpsecVPNPolicy.LocalStartAddress"] = L8_83["ipAddressTable.ipAddress"]
    if A0_75["vpnConfig.AddressFamily"] == "10" then
      L7_82["IpsecVPNPolicy.LocalPrefixLength"] = L8_83["ipAddressTable.subnetMask"]
    else
      L7_82["IpsecVPNPolicy.LocalSubnetMask"] = L8_83["ipAddressTable.subnetMask"]
    end
  end
  if tonumber(A0_75["vpnConfig.Peer"]) == 0 then
    L7_82["IpsecVPNPolicy.RemoteStartAddress"] = A0_75["vpnConfig.RemoteIP"]
    if A0_75["vpnConfig.AddressFamily"] == "10" then
      L7_82["IpsecVPNPolicy.RemotePrefixLength"] = A0_75["vpnConfig.RemotePrefixLength"]
    else
      L7_82["IpsecVPNPolicy.RemoteSubnetMask"] = A0_75["vpnConfig.RemoteSubnet"]
    end
    L7_82["IpsecVPNPolicy.LocalStartAddress"] = A0_75["vpnConfig.LocalIP"]
    if A0_75["vpnConfig.AddressFamily"] == "10" then
      L7_82["IpsecVPNPolicy.LocalPrefixLength"] = A0_75["vpnConfig.LocalPrefixLength"]
    else
      L7_82["IpsecVPNPolicy.LocalSubnetMask"] = A0_75["vpnConfig.LocalSubnetmask"]
    end
    if A0_75["vpnConfig.AddressFamily"] == "10" then
    else
    end
    if vpnPolicies ~= nil and #vpnPolicies ~= 0 then
      L7_82["IpsecVPNPolicy.Status"] = "0"
    end
  end
  if HIGH_SEC ~= "HIGH" then
    L7_82["IpsecVPNPolicy.EncryptionAlgorithm"] = "2"
    L7_82["IpsecVPNPolicy.AuthAlgorithm"] = "1"
  end
  if L5_80 then
    L7_82["IpsecVPNPolicy.IKEPolicyName"] = A0_75["vpnConfig.ConnectionName"]
    if db.typeAndRangeValidate(L7_82) then
      if A2_77 == "add" then
        L5_80 = db.insert("IpsecVPNPolicy", L7_82)
      elseif A2_77 == "edit" then
        L5_80 = db.update(DBTable, L7_82, A1_76)
      elseif A2_77 == "delete" then
        L5_80 = db.delete(DBTable, L7_82)
      end
    end
  end
  if L5_80 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10948"
  end
end
L0_0.wizardConfig = L1_1
L0_0 = vipSecure
function L1_1(A0_84, A1_85, A2_86)
  local L3_87
  L3_87 = ACCESS_LEVEL
  if L3_87 ~= 0 then
    L3_87 = "ACCESS_DENIED"
    return L3_87, "10187"
  end
  L3_87 = db
  L3_87 = L3_87.existsRow
  L3_87 = L3_87("IpsecModeConfig", "ModeConfigRecordName", A0_84["IpsecModeConfig.ModeConfigRecordName"])
  if L3_87 and A2_86 == "add" then
    L3_87 = "ERROR"
    return L3_87, "11109"
  end
  L3_87 = db
  L3_87 = L3_87.beginTransaction
  L3_87()
  L3_87 = false
  if A2_86 == "add" then
    L3_87 = vipSecure.modeConfigDBconfig(A0_84, A1_85, A2_86)
  end
  if A2_86 == "edit" then
    L3_87 = vipSecure.modeConfigDBconfig(A0_84, A1_85, A2_86)
  end
  if A2_86 == "delete" then
    L3_87 = vipSecure.modeConfigDBconfig(A0_84, A1_85, A2_86)
  end
  if L3_87 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "11108"
  end
end
L0_0.modeConfigConfig = L1_1
L0_0 = vipSecure
function L1_1(A0_88, A1_89, A2_90)
  if A2_90 == "add" then
    return db.insert("IpsecModeConfig", A0_88)
  elseif A2_90 == "edit" then
    return db.update("IpsecModeConfig", A0_88, A1_89)
  elseif A2_90 == "delete" then
    return db.delete("IpsecModeConfig", A0_88)
  end
end
L0_0.modeConfigDBconfig = L1_1
L0_0 = vipSecure
function L1_1(A0_91)
  local L1_92, L2_93, L3_94, L4_95, L5_96, L6_97, L7_98, L8_99
  L1_92 = ACCESS_LEVEL
  if L1_92 ~= 0 then
    L1_92 = "ACCESS_DENIED"
    return L1_92, L2_93
  end
  L1_92 = db
  L1_92 = L1_92.beginTransaction
  L1_92()
  L1_92 = false
  for L5_96, L6_97 in L2_93(L3_94) do
    L7_98 = {}
    L7_98["IpsecModeConfig._ROWID_"] = L6_97
    L8_99 = db
    L8_99 = L8_99.getAttribute
    L8_99 = L8_99("IpsecModeConfig", "_ROWID_", L6_97, "ModeConfigRecordName")
    if db.existsRow("IpsecIKEPolicy", "ModeConfigRecordName", L8_99) then
      return "ERROR", "11111"
    else
      L1_92 = db.delete("IpsecModeConfig", L7_98)
    end
    if not L1_92 then
      break
    end
  end
  if L1_92 then
    L2_93(L3_94)
    return L2_93, L3_94
  else
    L2_93()
    return L2_93, L3_94
  end
end
L0_0.modeConfigDelete = L1_1
L0_0 = vipSecure
function L1_1(A0_100, A1_101, A2_102, A3_103, A4_104, A5_105)
  local L6_106, L7_107, L8_108, L9_109
  L6_106 = ACCESS_LEVEL
  if L6_106 ~= 0 then
    L6_106 = "ACCESS_DENIED"
    L7_107 = "10187"
    return L6_106, L7_107
  end
  L6_106 = false
  L7_107 = false
  L8_108 = {}
  L9_109 = nil
  if A5_105 == "Connect" then
    L6_106 = db.setAttribute(A0_100, A1_101, A2_102, A3_103, A4_104)
  else
    L6_106 = db.setAttribute(A0_100, A1_101, A2_102, A3_103, A4_104)
  end
  if db.getRow("ConnectionStatus", "ConnectionStatus._ROWID_", A2_102) == nil then
    return "ERROR", "10467"
  else
    L8_108["IpsecUserAction.PolicyName"] = db.getRow("ConnectionStatus", "ConnectionStatus._ROWID_", A2_102)["ConnectionStatus.PolicyName"]
    if A5_105 == "Connect" then
      L8_108["IpsecUserAction.userAction"] = "1"
    else
      L8_108["IpsecUserAction.userAction"] = "0"
    end
  end
  db.beginTransaction()
  L7_107 = db.insert("IpsecUserAction", L8_108)
  if L7_107 == false then
    L7_107 = db.setAttribute(IpsecUserAction, "PolicyName", db.getRow("ConnectionStatus", "ConnectionStatus._ROWID_", A2_102)["ConnectionStatus.PolicyName"], "userAction", L8_108["IpsecUserAction.userAction"])
  end
  if L6_106 and L7_107 then
    db.commitTransaction()
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10467"
  end
end
L0_0.ConnStatusConfig = L1_1
L0_0 = vipSecure
function L1_1(A0_110, A1_111, A2_112)
  local L3_113, L4_114, L5_115
  L3_113 = ACCESS_LEVEL
  if L3_113 ~= 0 then
    L3_113 = "ACCESS_DENIED"
    L4_114 = "10187"
    return L3_113, L4_114
  end
  L3_113 = db
  L3_113 = L3_113.beginTransaction
  L3_113()
  L3_113 = false
  L4_114 = db
  L4_114 = L4_114.typeAndRangeValidate
  L5_115 = A0_110
  L4_114 = L4_114(L5_115)
  if L4_114 then
    if A2_112 == "add" then
      L4_114 = db
      L4_114 = L4_114.insert
      L5_115 = DBTable
      L4_114 = L4_114(L5_115, A0_110)
      L3_113 = L4_114
    elseif A2_112 == "edit" then
      L4_114 = db
      L4_114 = L4_114.update
      L5_115 = DBTable
      L4_114 = L4_114(L5_115, A0_110, A1_111)
      L3_113 = L4_114
    elseif A2_112 == "delete" then
      L4_114 = db
      L4_114 = L4_114.delete
      L5_115 = DBTable
      L4_114 = L4_114(L5_115, A0_110)
      L3_113 = L4_114
    end
  end
  if L3_113 and A2_112 == "add" then
    L4_114 = A0_110.QuikVPNUserSupport
    if L4_114 ~= nil then
      L4_114 = A0_110.QuikVPNUserSupport
      if L4_114 == "1" then
        L4_114 = A0_110["dhcp.dhcpEnabled"]
        if L4_114 ~= nil then
          L4_114 = A0_110["dhcp.dhcpEnabled"]
          if L4_114 == "1" then
            L4_114 = db
            L4_114 = L4_114.getRowWhere
            L5_115 = "ifStatic"
            L4_114 = L4_114(L5_115, "LogicalIfName = 'LAN' and AddressFamily = 2")
            if L4_114 ~= nil then
              L5_115 = A0_110["ifStatic.StaticIp"]
              L4_114["ifStatic.StaticIp"] = L5_115
              L4_114["ifStatic.NetMask"] = "255.255.255.0"
              L5_115 = db
              L5_115 = L5_115.typeAndRangeValidate
              L5_115 = L5_115(L4_114)
              if L5_115 then
                L5_115 = db
                L5_115 = L5_115.update
                L5_115 = L5_115("ifStatic", L4_114, L4_114["ifStatic._ROWID_"])
                L3_113 = L5_115
              else
                L3_113 = false
              end
              L5_115 = db
              L5_115 = L5_115.getRowWhere
              L5_115 = L5_115("dhcp", "logicalIfName = 'LAN'")
              if L3_113 and L5_115 ~= nil then
                L5_115["dhcp.dhcpEnabled"] = "1"
                L5_115["dhcp.startAddress"] = A0_110["dhcp.startAddress"]
                L5_115["dhcp.endAddress"] = A0_110["dhcp.endAddress"]
                if db.typeAndRangeValidate(L5_115) then
                  L3_113 = db.update("dhcp", L5_115, L5_115["dhcp._ROWID_"])
                else
                  L3_113 = false
                end
              else
                L3_113 = false
              end
            else
              L3_113 = false
            end
          end
        end
      end
    end
  end
  if L3_113 then
    L4_114 = db
    L4_114 = L4_114.commitTransaction
    L5_115 = true
    L4_114(L5_115)
    L4_114 = "OK"
    L5_115 = "12265"
    return L4_114, L5_115
  else
    L4_114 = db
    L4_114 = L4_114.rollback
    L4_114()
    L4_114 = "ERROR"
    L5_115 = "12612"
    return L4_114, L5_115
  end
end
L0_0.xauthConfig = L1_1
L0_0 = vipSecure
function L1_1(A0_116, A1_117, A2_118)
  local L3_119
  L3_119 = ACCESS_LEVEL
  if L3_119 ~= 0 then
    L3_119 = "ACCESS_DENIED"
    return L3_119, "10187"
  end
  L3_119 = db
  L3_119 = L3_119.existsRow
  L3_119 = L3_119("IpsecModeConfig", "ModeConfigRecordName", A0_116["IpsecModeConfig.ModeConfigRecordName"])
  if L3_119 and A2_118 == "add" then
    L3_119 = "ERROR"
    return L3_119, "11109"
  end
  L3_119 = db
  L3_119 = L3_119.beginTransaction
  L3_119()
  L3_119 = false
  if A2_118 == "add" then
    L3_119 = vipSecure.modeConfigDBconfig(A0_116, A1_117, A2_118)
  end
  if A2_118 == "edit" then
    L3_119 = vipSecure.modeConfigDBconfig(A0_116, A1_117, A2_118)
  end
  if A2_118 == "delete" then
    L3_119 = vipSecure.modeConfigDBconfig(A0_116, A1_117, A2_118)
  end
  if L3_119 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12612"
  end
end
L0_0.modeConfigConfig = L1_1
L0_0 = vipSecure
function L1_1(A0_120, A1_121, A2_122)
  if A2_122 == "add" then
    return db.insert("IpsecModeConfig", A0_120)
  elseif A2_122 == "edit" then
    return db.update("IpsecModeConfig", A0_120, A1_121)
  elseif A2_122 == "delete" then
    return db.delete("IpsecModeConfig", A0_120)
  end
end
L0_0.modeConfigDBconfig = L1_1
L0_0 = vipSecure
function L1_1(A0_123)
  local L1_124, L2_125, L3_126, L4_127, L5_128, L6_129, L7_130, L8_131
  L1_124 = ACCESS_LEVEL
  if L1_124 ~= 0 then
    L1_124 = "ACCESS_DENIED"
    return L1_124, L2_125
  end
  L1_124 = db
  L1_124 = L1_124.beginTransaction
  L1_124()
  L1_124 = false
  for L5_128, L6_129 in L2_125(L3_126) do
    L7_130 = {}
    L7_130["IpsecModeConfig._ROWID_"] = L6_129
    L8_131 = db
    L8_131 = L8_131.getAttribute
    L8_131 = L8_131("IpsecModeConfig", "_ROWID_", L6_129, "ModeConfigRecordName")
    if db.existsRow("IpsecIKEPolicy", "ModeConfigRecordName", L8_131) then
      return "ERROR", "11111"
    else
      L1_124 = db.delete("IpsecModeConfig", L7_130)
    end
    if not L1_124 then
      break
    end
  end
  if L1_124 then
    L2_125(L3_126)
    return L2_125, L3_126
  else
    L2_125()
    return L2_125, L3_126
  end
end
L0_0.modeConfigDelete = L1_1
L0_0 = vipSecure
function L1_1(A0_132, A1_133, A2_134)
  local L3_135
  L3_135 = ACCESS_LEVEL
  if L3_135 ~= 0 then
    L3_135 = "ACCESS_DENIED"
    return L3_135, "12265"
  end
  L3_135 = db
  L3_135 = L3_135.existsRow
  L3_135 = L3_135("SplitDns", "DomainName", A0_132["SplitDns.DomainName"])
  if L3_135 and A2_134 == "add" then
    L3_135 = "ERROR"
    return L3_135, "13165"
  end
  L3_135 = db
  L3_135 = L3_135.beginTransaction
  L3_135()
  L3_135 = false
  if A2_134 == "add" then
    L3_135 = db.insert("SplitDns", A0_132)
  end
  if A2_134 == "edit" then
    L3_135 = db.update("SplitDns", A0_132, A1_133)
  end
  if L3_135 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12201"
  end
end
L0_0.splitDnsConfigConfig = L1_1
L0_0 = vipSecure
function L1_1(A0_136)
  local L1_137, L2_138, L3_139, L4_140, L5_141, L6_142, L7_143, L8_144
  L1_137 = ACCESS_LEVEL
  if L1_137 ~= 0 then
    L1_137 = "ACCESS_DENIED"
    return L1_137, L2_138
  end
  L1_137 = false
  L2_138()
  for L5_141, L6_142 in L2_138(L3_139) do
    L7_143 = {}
    L7_143["SplitDns._ROWID_"] = L6_142
    L8_144 = db
    L8_144 = L8_144.getAttribute
    L8_144 = L8_144("SplitDns", "_ROWID_", L6_142, "DomainName")
    if db.existsRow("SplitDns", "DomainName", L8_144) then
      L1_137 = db.delete("SplitDns", L7_143)
    else
      return "ERROR", "12205"
    end
    if not L1_137 then
      break
    end
  end
  if L1_137 then
    L2_138(L3_139)
    return L2_138, L3_139
  else
    L2_138()
    return L2_138, L3_139
  end
end
L0_0.splitDnsConfigDelete = L1_1
L0_0 = vipSecure
function L1_1(A0_145)
  return db.getRow("SplitDns", "_ROWID_", A0_145) or " "
end
L0_0.splitDnsGet = L1_1
L0_0 = vipSecure
function L1_1(A0_146)
  if tonumber(A0_146) == 7 then
    return db.getTable("ActiveDirectorySettings")
  elseif tonumber(A0_146) == 8 then
    return db.getTable("POPProfiles")
  elseif tonumber(A0_146) == 9 then
    return db.getTable("LDAPSettings")
  elseif tonumber(A0_146) == 10 then
    return db.getTable("NTDomainSettings")
  end
end
L0_0.xauthServerProfile = L1_1
