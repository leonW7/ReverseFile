require("teamf1lualib/vipSecure")
require("teamf1lualib/ipSec")
db.connect("/tmp/system.db")
ezvpn = {}
ipsecVpnConfig = {}
ipsecIkeConfig = {}
errorString = " "
exportFlag = "-10"
function ezvpn.getMaxColumn(A0_0, A1_1)
  local L2_2, L3_3, L4_4
  L4_4 = db
  L4_4 = L4_4.execute
  L3_3, L4_4 = string.format("SELECT  MAX(%s) FROM %s ", A1_1, A0_0)
  L2_2 = L4_4
  if L2_2 then
    L4_4 = L2_2.fetch
    L4_4 = L4_4(L2_2, {}, "a")
    for _FORV_8_, _FORV_9_ in pairs(L4_4) do
      return _FORV_9_
    end
  end
end
function ezvpn.CheckDataBase(A0_5, A1_6)
  local L2_7, L3_8, L4_9, L5_10, L6_11
  vpnPolicyRow = L2_7
  if L2_7 then
    flag = L2_7
    for L5_10, L6_11 in next, vpnPolicyRow, nil do
      flag = true
      for _FORV_10_, _FORV_11_ in next, L6_11, nil do
        if _FORV_10_ ~= "IpsecVPNPolicy.NodeId" and _FORV_10_ ~= "IpsecVPNPolicy.VPNPolicyName" and _FORV_10_ ~= "IpsecVPNPolicy.IKEPolicyName" and _FORV_10_ ~= "IpsecVPNPolicy._ROWID_" and _FORV_10_ ~= "IpsecVPNPolicy.Status" and vpnPolicyRow[L5_10][_FORV_10_] ~= ipsecVpnConfig[A1_6][_FORV_10_] then
          flag = false
          break
        end
      end
      if flag == true then
        return false
      end
    end
  end
  return L2_7
end
function ezvpn.vpnImport(A0_12)
  local L1_13, L2_14, L3_15, L4_16, L5_17, L6_18, L7_19, L8_20, L9_21, L10_22, L11_23, L12_24, L13_25, L14_26, L15_27, L16_28, L17_29, L18_30, L19_31, L20_32, L21_33, L22_34, L23_35, L24_36, L25_37, L26_38
  L1_13 = ACCESS_LEVEL
  if L1_13 ~= 0 then
    L1_13 = 0
    L2_14 = "12744"
    return L1_13, L2_14
  end
  L1_13 = "/tmp/"
  L2_14 = "ezvpn.cfg"
  L3_15 = A0_12["file.easysetup"]
  L3_15 = L3_15.filename
  L4_16 = cgilua
  L4_16 = L4_16.cookies
  L4_16 = L4_16.get
  L5_17 = "TeamF1Login"
  L4_16 = L4_16(L5_17)
  L5_17 = "mv"
  L6_18 = " "
  L7_19 = "/tmp/"
  L8_20 = L4_16
  L5_17 = L5_17 .. L6_18 .. L7_19 .. L8_20 .. L9_21 .. L10_22 .. L11_23
  L6_18 = os
  L6_18 = L6_18.execute
  L7_19 = L5_17
  L6_18 = L6_18(L7_19)
  L7_19 = "/usr/bin/dos2unix"
  L8_20 = " "
  L7_19 = L7_19 .. L8_20 .. L9_21 .. L10_22
  L8_20 = os
  L8_20 = L8_20.execute
  L8_20 = L8_20(L9_21)
  tempFile = L9_21
  L26_38 = L10_22(L11_23)
  if L9_21 then
    L9_21(L10_22)
  else
    return L9_21, L10_22
  end
  tempVpn = L9_21
  tempIke = L9_21
  if L9_21 then
    vpnCount = L9_21
    ipsecVpnConfig = L9_21
    for L12_24, L13_25 in next, tempVpn, nil do
      L14_26[L12_24] = L15_27
      for L17_29, L18_30 in next, L13_25, nil do
        L19_31 = ipsecVpnConfig
        L20_32 = vpnCount
        L19_31 = L19_31[L20_32]
        L20_32 = "IpsecVPNPolicy."
        L21_33 = L17_29
        L20_32 = L20_32 .. L21_33
        L19_31[L20_32] = L18_30
      end
      vpnCount = L14_26
    end
  end
  if L9_21 then
    ikeCount = L9_21
    ipsecIkeConfig = L9_21
    for L12_24, L13_25 in next, tempIke, nil do
      L14_26[L12_24] = L15_27
      for L17_29, L18_30 in next, L13_25, nil do
        L19_31 = ipsecIkeConfig
        L20_32 = ikeCount
        L19_31 = L19_31[L20_32]
        L20_32 = "IpsecIKEPolicy."
        L21_33 = L17_29
        L20_32 = L20_32 .. L21_33
        L19_31[L20_32] = L18_30
      end
      ikeCount = L14_26
    end
  end
  maxNodeId = L9_21
  maxROWID = L9_21
  if L9_21 ~= nil then
    for L12_24 = 1, L10_22 - 1 do
      L13_25 = ipsecVpnConfig
      L13_25 = L13_25[L12_24]
      L13_25["IpsecVPNPolicy.NodeId"] = L14_26
      L13_25 = ipsecVpnConfig
      L13_25 = L13_25[L12_24]
      L13_25["IpsecVPNPolicy._ROWID_"] = L14_26
    end
  else
    for L12_24 = 1, L10_22 - 1 do
      L13_25 = ipsecVpnConfig
      L13_25 = L13_25[L12_24]
      L13_25["IpsecVPNPolicy.NodeId"] = L12_24
      L13_25 = ipsecVpnConfig
      L13_25 = L13_25[L12_24]
      L13_25["IpsecVPNPolicy._ROWID_"] = L12_24
    end
  end
  if L9_21 then
    maxROWID = L9_21
    if L9_21 ~= nil then
      for L12_24 = 1, L10_22 - 1 do
        L13_25 = ipsecIkeConfig
        L13_25 = L13_25[L12_24]
        L13_25["IpsecIKEPolicy._ROWID_"] = L14_26
      end
    else
      for L12_24 = 1, L10_22 - 1 do
        L13_25 = ipsecIkeConfig
        L13_25 = L13_25[L12_24]
        L13_25["IpsecIKEPolicy._ROWID_"] = L12_24
      end
    end
  end
  errorCode = L9_21
  policyExistCount = L9_21
  NumberOfAddedPolicies = L9_21
  for L12_24 = 1, L10_22 - 1 do
    L13_25 = nil
    L17_29 = ipsecVpnConfig
    L17_29 = L17_29[L12_24]
    L17_29 = L17_29["IpsecVPNPolicy.VPNPolicyName"]
    L18_30 = ipsecVpnConfig
    L18_30 = L18_30[L12_24]
    L18_30 = L18_30["IpsecVPNPolicy.TunnelOrTransport"]
    L19_31 = ipsecVpnConfig
    L19_31 = L19_31[L12_24]
    L19_31 = L19_31["IpsecVPNPolicy.EnableDhcpOverIPSec"]
    L20_32 = "VPNPolicyName = '"
    L21_33 = ipsecVpnConfig
    L21_33 = L21_33[L12_24]
    L21_33 = L21_33["IpsecVPNPolicy.VPNPolicyName"]
    L22_34 = "'"
    L20_32 = L20_32 .. L21_33 .. L22_34
    L21_33 = "IpsecVPNPolicy.RemoteEndPoint"
    L22_34 = ezvpn
    L22_34 = L22_34.CheckDataBase
    L23_35 = "RemoteEndPoint = '"
    L24_36 = ipsecVpnConfig
    L24_36 = L24_36[L12_24]
    L24_36 = L24_36[L21_33]
    L25_37 = "'"
    L23_35 = L23_35 .. L24_36 .. L25_37
    L24_36 = L12_24
    L22_34 = L22_34(L23_35, L24_36)
    CheckDB = L22_34
    L22_34 = CheckDB
    if L22_34 then
      if L18_30 == "1" and L19_31 == "0" then
        L22_34 = vipSecure
        L22_34 = L22_34.getDuplicatePolicies
        L23_35 = ipsecVpnConfig
        L23_35 = L23_35[L12_24]
        L24_36 = 1
        L22_34 = L22_34(L23_35, L24_36)
        L23_35 = L22_34[1]
        if L23_35 then
          L23_35 = ipsecVpnConfig
          L23_35 = L23_35[L12_24]
          L23_35["IpsecVPNPolicy.Status"] = "0"
        end
      elseif L18_30 == "1" and L19_31 == "1" then
        L22_34 = "IpsecVPNPolicy.RemoteEndPoint"
        L23_35 = "RemoteEndPoint = '"
        L24_36 = ipsecVpnConfig
        L24_36 = L24_36[L12_24]
        L24_36 = L24_36[L22_34]
        L25_37 = "'"
        L23_35 = L23_35 .. L24_36 .. L25_37
        L24_36 = db
        L24_36 = L24_36.getRowsWhere
        L25_37 = "IpsecVPNPolicy"
        L26_38 = L23_35
        L24_36 = L24_36(L25_37, L26_38)
        L25_37 = L24_36[1]
        if L25_37 then
          L23_35 = "Status = 1 and RemoteNetworkType = 0 and LocalNetworkType = 0"
          L25_37 = db
          L25_37 = L25_37.getRowsWhere
          L26_38 = "IpsecVPNPolicy"
          L25_37 = L25_37(L26_38, L23_35)
          L13_25 = L25_37
          L25_37 = L13_25[1]
          if L25_37 then
            L25_37 = ipsecVpnConfig
            L25_37 = L25_37[L12_24]
            L25_37["IpsecVPNPolicy.Status"] = "0"
          end
        end
      elseif L18_30 == "0" then
        L22_34 = "IpsecVPNPolicy.RemoteEndPoint"
        L23_35 = "RemoteEndPoint = '"
        L24_36 = ipsecVpnConfig
        L24_36 = L24_36[L12_24]
        L24_36 = L24_36[L22_34]
        L25_37 = "'"
        L23_35 = L23_35 .. L24_36 .. L25_37
        L24_36 = db
        L24_36 = L24_36.getRowsWhere
        L25_37 = "IpsecVPNPolicy"
        L26_38 = L23_35
        L24_36 = L24_36(L25_37, L26_38)
        L25_37 = L24_36[1]
        if L25_37 then
          L25_37 = ipsecVpnConfig
          L25_37 = L25_37[L12_24]
          L25_37["IpsecVPNPolicy.Status"] = "0"
        end
      end
      L22_34 = db
      L22_34 = L22_34.getRowsWhere
      L23_35 = "IpsecVPNPolicy"
      L24_36 = "VPNPolicyName = '"
      L25_37 = L17_29
      L26_38 = "'"
      L24_36 = L24_36 .. L25_37 .. L26_38
      L22_34 = L22_34(L23_35, L24_36)
      L23_35 = L22_34[1]
      if L23_35 then
        L23_35 = "IpsecVPNPolicy.VPNPolicyName"
        L24_36 = "IpsecVPNPolicy.IKEPolicyName"
        L25_37 = "IpsecIKEPolicy.IKEPolicyName"
        L26_38 = ipsecVpnConfig
        L26_38 = L26_38[L12_24]
        L26_38 = L26_38["IpsecVPNPolicy.NodeId"]
        ipsecVpnConfig[L12_24][L23_35] = ipsecVpnConfig[L12_24][L23_35] .. "_" .. L26_38
        ipsecVpnConfig[L12_24][L24_36] = ipsecVpnConfig[L12_24][L24_36] .. "_" .. L26_38
        if tempIke then
          ipsecIkeConfig[L12_24][L25_37] = ipsecIkeConfig[L12_24][L25_37] .. "_" .. L26_38
        end
      end
      L23_35 = ipsecVpnConfig
      L23_35 = L23_35[L12_24]
      L23_35 = L23_35["IpsecVPNPolicy.PolicyType"]
      if L23_35 == "1" then
        L23_35 = db
        L23_35 = L23_35.insert
        L24_36 = "IpsecIKEPolicy"
        L25_37 = ipsecIkeConfig
        L25_37 = L25_37[L12_24]
        L23_35 = L23_35(L24_36, L25_37)
      else
      end
      L23_35 = db
      L23_35 = L23_35.insert
      L24_36 = "IpsecVPNPolicy"
      L25_37 = ipsecVpnConfig
      L25_37 = L25_37[L12_24]
      L23_35 = L23_35(L24_36, L25_37)
      if L15_27 and L16_28 then
        L23_35 = "OK"
        errorFlag = L23_35
      else
        L23_35 = "ERROR"
        errorFlag = L23_35
      end
      L23_35 = errorFlag
      if L23_35 == "OK" then
        L23_35 = db
        L23_35 = L23_35.commitTransaction
        L24_36 = true
        L23_35(L24_36)
        L23_35 = NumberOfAddedPolicies
        L23_35 = L23_35 + 1
        NumberOfAddedPolicies = L23_35
      else
        L23_35 = db
        L23_35 = L23_35.rollback
        L23_35()
        L23_35 = "ERROR"
        errorCode = L23_35
        L23_35 = errorString
        L24_36 = L17_29
        L25_37 = ": Failed To Add </br> "
        L23_35 = L23_35 .. L24_36 .. L25_37
        errorString = L23_35
      end
    else
      L22_34 = policyExistCount
      L22_34 = L22_34 + 1
      policyExistCount = L22_34
      L22_34 = "ERROR"
      errorCode = L22_34
    end
  end
  if L9_21 == "OK" then
    return L9_21, L10_22
  else
    if L9_21 == L10_22 then
      return L9_21, L10_22
    end
    return L9_21, L10_22
  end
end
function ezvpn.vpnExport(A0_39)
  local L1_40, L2_41, L3_42, L4_43, L5_44, L6_45
  L1_40 = ACCESS_LEVEL
  if L1_40 ~= 0 then
    L1_40 = "ACCESS_DENIED"
    L2_41 = "10187"
    return L1_40, L2_41
  end
  L1_40 = "/tmp/ezvpn.cfg"
  L2_41 = RowId
  configRowId = L2_41
  L2_41 = configRowId
  if L2_41 ~= nil then
    L2_41 = db
    L2_41 = L2_41.getRow
    L3_42 = "IpsecVPNPolicy"
    L4_43 = "_ROWID_"
    L5_44 = configRowId
    L2_41 = L2_41(L3_42, L4_43, L5_44)
    L3_42 = A0_39["IpsecVPNPolicy.LocalGateway"]
    if L3_42 ~= nil then
      L3_42 = A0_39["IpsecVPNPolicy.LocalGateway"]
      L4_43 = L2_41["IpsecVPNPolicy.LocalGateway"]
      if L3_42 ~= L4_43 then
        L3_42 = A0_39["IpsecVPNPolicy.LocalGateway"]
        L2_41["IpsecVPNPolicy.LocalGateway"] = L3_42
      end
    end
    L3_42 = A0_39["IpsecVPNPolicy.RemoteEndPointType"]
    if L3_42 ~= nil then
      L3_42 = A0_39["IpsecVPNPolicy.RemoteEndPointType"]
      L4_43 = L2_41["IpsecVPNPolicy.RemoteEndPointType"]
      if L3_42 ~= L4_43 then
        L3_42 = A0_39["IpsecVPNPolicy.RemoteEndPointType"]
        L2_41["IpsecVPNPolicy.RemoteEndPointType"] = L3_42
      end
    end
    L3_42 = A0_39["IpsecVPNPolicy.RemoteEndPoint"]
    if L3_42 ~= nil then
      L3_42 = L2_41["IpsecVPNPolicy.RemoteEndPoint"]
      L4_43 = A0_39["IpsecVPNPolicy.RemoteEndPoint"]
      if L3_42 ~= L4_43 then
        L3_42 = A0_39["IpsecVPNPolicy.RemoteEndPoint"]
        L2_41["IpsecVPNPolicy.RemoteEndPoint"] = L3_42
      end
    end
    L3_42 = A0_39["IpsecVPNPolicy.LocalNetworkType"]
    if L3_42 ~= nil then
      L3_42 = L2_41["IpsecVPNPolicy.LocalNetworkType"]
      L4_43 = A0_39["IpsecVPNPolicy.LocalNetworkType"]
      if L3_42 ~= L4_43 then
        L3_42 = A0_39["IpsecVPNPolicy.LocalNetworkType"]
        L2_41["IpsecVPNPolicy.LocalNetworkType"] = L3_42
      end
    end
    L3_42 = A0_39["IpsecVPNPolicy.LocalStartAddress"]
    if L3_42 ~= nil then
      L3_42 = L2_41["IpsecVPNPolicy.LocalStartAddress"]
      L4_43 = A0_39["IpsecVPNPolicy.LocalStartAddress"]
      if L3_42 ~= L4_43 then
        L3_42 = A0_39["IpsecVPNPolicy.LocalStartAddress"]
        L2_41["IpsecVPNPolicy.LocalStartAddress"] = L3_42
      end
    end
    L3_42 = A0_39["IpsecVPNPolicy.LocalEndAddress"]
    if L3_42 ~= nil then
      L3_42 = L2_41["IpsecVPNPolicy.LocalEndAddress"]
      L4_43 = A0_39["IpsecVPNPolicy.LocalEndAddress"]
      if L3_42 ~= L4_43 then
        L3_42 = A0_39["IpsecVPNPolicy.LocalEndAddress"]
        L2_41["IpsecVPNPolicy.LocalEndAddress"] = L3_42
      end
    end
    L3_42 = A0_39["IpsecVPNPolicy.LocalSubnetMask"]
    if L3_42 ~= nil then
      L3_42 = L2_41["IpsecVPNPolicy.LocalSubnetMask"]
      L4_43 = A0_39["IpsecVPNPolicy.LocalSubnetMask"]
      if L3_42 ~= L4_43 then
        L3_42 = A0_39["IpsecVPNPolicy.LocalSubnetMask"]
        L2_41["IpsecVPNPolicy.LocalSubnetMask"] = L3_42
      end
    end
    L3_42 = A0_39["IpsecVPNPolicy.RemoteNetworkType"]
    if L3_42 ~= nil then
      L3_42 = L2_41["IpsecVPNPolicy.RemoteNetworkType"]
      L4_43 = A0_39["IpsecVPNPolicy.RemoteNetworkType"]
      if L3_42 ~= L4_43 then
        L3_42 = A0_39["IpsecVPNPolicy.RemoteNetworkType"]
        L2_41["IpsecVPNPolicy.RemoteNetworkType"] = L3_42
      end
    end
    L3_42 = A0_39["IpsecVPNPolicy.RemoteStartAddress"]
    if L3_42 ~= nil then
      L3_42 = L2_41["IpsecVPNPolicy.RemoteStartAddress"]
      L4_43 = A0_39["IpsecVPNPolicy.RemoteStartAddress"]
      if L3_42 ~= L4_43 then
        L3_42 = A0_39["IpsecVPNPolicy.RemoteStartAddress"]
        L2_41["IpsecVPNPolicy.RemoteStartAddress"] = L3_42
      end
    end
    L3_42 = A0_39["IpsecVPNPolicy.RemoteEndAddress"]
    if L3_42 ~= nil then
      L3_42 = L2_41["IpsecVPNPolicy.RemoteEndAddress"]
      L4_43 = A0_39["IpsecVPNPolicy.RemoteEndAddress"]
      if L3_42 ~= L4_43 then
        L3_42 = A0_39["IpsecVPNPolicy.RemoteEndAddress"]
        L2_41["IpsecVPNPolicy.RemoteEndAddress"] = L3_42
      end
    end
    L3_42 = A0_39["IpsecVPNPolicy.RemoteSubnetMask"]
    if L3_42 ~= nil then
      L3_42 = L2_41["IpsecVPNPolicy.RemoteSubnetMask"]
      L4_43 = A0_39["IpsecVPNPolicy.RemoteSubnetMask"]
      if L3_42 ~= L4_43 then
        L3_42 = A0_39["IpsecVPNPolicy.RemoteSubnetMask"]
        L2_41["IpsecVPNPolicy.RemoteSubnetMask"] = L3_42
      end
    end
    L3_42 = A0_39["IpsecVPNPolicy.SPIIn"]
    if L3_42 ~= nil then
      L3_42 = L2_41["IpsecVPNPolicy.SPIIn"]
      L4_43 = A0_39["IpsecVPNPolicy.SPIIn"]
      if L3_42 ~= L4_43 then
        L3_42 = A0_39["IpsecVPNPolicy.SPIIn"]
        L2_41["IpsecVPNPolicy.SPIIn"] = L3_42
      end
    end
    L3_42 = A0_39["IpsecVPNPolicy.SPIOut"]
    if L3_42 ~= nil then
      L3_42 = L2_41["IpsecVPNPolicy.SPIOut"]
      L4_43 = A0_39["IpsecVPNPolicy.SPIOut"]
      if L3_42 ~= L4_43 then
        L3_42 = A0_39["IpsecVPNPolicy.SPIOut"]
        L2_41["IpsecVPNPolicy.SPIOut"] = L3_42
      end
    end
    L3_42 = A0_39["IpsecVPNPolicy.EncryptionKeyIn"]
    if L3_42 ~= nil then
      L3_42 = L2_41["IpsecVPNPolicy.EncryptionKeyIn"]
      L4_43 = A0_39["IpsecVPNPolicy.EncryptionKeyIn"]
      if L3_42 ~= L4_43 then
        L3_42 = A0_39["IpsecVPNPolicy.EncryptionKeyIn"]
        L2_41["IpsecVPNPolicy.EncryptionKeyIn"] = L3_42
      end
    end
    L3_42 = A0_39["IpsecVPNPolicy.EncryptionKeyOut"]
    if L3_42 ~= nil then
      L3_42 = L2_41["IpsecVPNPolicy.EncryptionKeyOut"]
      L4_43 = A0_39["IpsecVPNPolicy.EncryptionKeyOut"]
      if L3_42 ~= L4_43 then
        L3_42 = A0_39["IpsecVPNPolicy.EncryptionKeyOut"]
        L2_41["IpsecVPNPolicy.EncryptionKeyOut"] = L3_42
      end
    end
    L3_42 = A0_39["IpsecVPNPolicy.AuthKeyIn"]
    if L3_42 ~= nil then
      L3_42 = L2_41["IpsecVPNPolicy.AuthKeyIn"]
      L4_43 = A0_39["IpsecVPNPolicy.AuthKeyIn"]
      if L3_42 ~= L4_43 then
        L3_42 = A0_39["IpsecVPNPolicy.AuthKeyIn"]
        L2_41["IpsecVPNPolicy.AuthKeyIn"] = L3_42
      end
    end
    L3_42 = A0_39["IpsecVPNPolicy.AuthKeyOut"]
    if L3_42 ~= nil then
      L3_42 = L2_41["IpsecVPNPolicy.AuthKeyOutk"]
      L4_43 = A0_39["IpsecVPNPolicy.AuthKeyOut"]
      if L3_42 ~= L4_43 then
        L3_42 = A0_39["IpsecVPNPolicy.AuthKeyOut"]
        L2_41["IpsecVPNPolicy.AuthKeyOut"] = L3_42
      end
    end
    L3_42 = db
    L3_42 = L3_42.getAttribute
    L4_43 = "IpsecVPNPolicy"
    L5_44 = "_ROWID_"
    L6_45 = configRowId
    L3_42 = L3_42(L4_43, L5_44, L6_45, "PolicyType")
    if L3_42 ~= "2" then
      L4_43 = db
      L4_43 = L4_43.getAttribute
      L5_44 = "IpsecVPNPolicy"
      L6_45 = "_ROWID_"
      L4_43 = L4_43(L5_44, L6_45, configRowId, "IKEPolicyName")
      if L4_43 ~= nil then
        L5_44 = db
        L5_44 = L5_44.getAttribute
        L6_45 = "IpsecIKEPolicy"
        L5_44 = L5_44(L6_45, "IKEPolicyName", L4_43, "_ROWID_")
        if L5_44 ~= nil then
          L6_45 = db
          L6_45 = L6_45.getRow
          L6_45 = L6_45("IpsecIKEPolicy", "_ROWID_", L5_44)
          util.tableAppend(L2_41, L6_45)
          if A0_39["IpsecIKEPolicy.LocalIdentifierType"] ~= nil then
            L2_41["IpsecIKEPolicy.LocalIdentifierType"] = A0_39["IpsecIKEPolicy.LocalIdentifierType"]
          end
          if A0_39["IpsecIKEPolicy.LocalIdentifier"] ~= nil then
            L2_41["IpsecIKEPolicy.LocalIdentifier"] = A0_39["IpsecIKEPolicy.LocalIdentifier"]
          end
          if A0_39["IpsecIKEPolicy.RemoteIdentifierType"] ~= nil then
            L2_41["IpsecIKEPolicy.RemoteIdentifierType"] = A0_39["IpsecIKEPolicy.RemoteIdentifierType"]
          end
          if A0_39["IpsecIKEPolicy.RemoteIdentifier"] ~= nil then
            L2_41["IpsecIKEPolicy.RemoteIdentifier"] = A0_39["IpsecIKEPolicy.RemoteIdentifier"]
          end
        end
      end
    end
    L4_43 = "OK"
    errorFlag = L4_43
    L4_43 = "12265"
    statusCode = L4_43
    L4_43 = exportFlag
    RowId = L4_43
    L4_43 = ipsec
    L4_43 = L4_43.ipsecPolicyConfig
    L5_44 = L2_41
    L5_44 = L4_43(L5_44)
    statusCode = L5_44
    errorFlag = L4_43
    L4_43 = configRowId
    RowId = L4_43
  end
  L2_41 = "ezvpn"
  L3_42 = web
  L3_42 = L3_42.download
  L4_43 = L1_40
  L5_44 = L2_41
  L6_45 = ".cfg"
  L5_44 = L5_44 .. L6_45
  L3_42(L4_43, L5_44)
end
function ezvpn.exportToFile(A0_46, A1_47, A2_48)
  local L3_49, L4_50, L5_51, L6_52, L7_53, L8_54, L9_55, L10_56
  L3_49 = "OK"
  errorFlag = L3_49
  L3_49 = "12265"
  statusCode = L3_49
  if not A2_48 then
    L3_49 = "ERROR"
    L4_50 = "10775"
    return L3_49, L4_50
  end
  L3_49 = db
  L3_49 = L3_49.getColNames
  L4_50 = A0_46
  L3_49 = L3_49(L4_50)
  L4_50 = db
  L4_50 = L4_50.getDefaults
  L5_51 = false
  L4_50 = L4_50(L5_51, L6_52)
  L5_51 = A2_48.write
  L5_51(L6_52, L7_53)
  L5_51 = A0_46
  L5_51 = L5_51 .. L6_52
  L9_55 = "\n"
  L6_52(L7_53, L8_54)
  for L9_55, L10_56 in L6_52(L7_53) do
    if L10_56 == "_ROWID_" then
    elseif util.tableKeyExists(A1_47, A0_46 .. "." .. L10_56) then
      L5_51 = A0_46 .. "[1][\"" .. L10_56 .. "\"] = \"" .. A1_47[A0_46 .. "." .. L10_56] .. "\""
      A2_48:write(L5_51 .. "\n")
    elseif L4_50[A0_46 .. "." .. L10_56] then
      L5_51 = A0_46 .. "[1][\"" .. L10_56 .. "\"] = \"" .. L4_50[A0_46 .. "." .. L10_56] .. "\""
      A2_48:write(L5_51 .. "\n")
    end
  end
  return L6_52, L7_53
end
