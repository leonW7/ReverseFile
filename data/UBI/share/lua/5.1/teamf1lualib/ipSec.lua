local L0_0, L1_1
L0_0 = {}
ipsec = L0_0
L0_0 = ipsec
function L1_1(A0_2)
  local L1_3, L2_4, L3_5
  L1_3 = {}
  L2_4 = "0"
  L3_5 = A0_2["IpsecVPNPolicy.VPNPolicyName"]
  if L3_5 ~= nil then
    L3_5 = A0_2["IpsecVPNPolicy.VPNPolicyName"]
    L1_3["IpsecVPNPolicy.VPNPolicyName"] = L3_5
  end
  L3_5 = A0_2["IpsecIKEPolicy.AddressFamily"]
  if L3_5 ~= nil then
    L3_5 = A0_2["IpsecIKEPolicy.AddressFamily"]
    L1_3["IpsecVPNPolicy.AddressFamily"] = L3_5
  end
  L3_5 = A0_2["IpsecVPNPolicy.L2tpIpsecPolicy"]
  if L3_5 ~= nil then
    L3_5 = A0_2["IpsecVPNPolicy.L2tpIpsecPolicy"]
    L1_3["IpsecVPNPolicy.L2tpIpsecPolicy"] = L3_5
  end
  L3_5 = A0_2["IpsecVPNPolicy.PolicyType"]
  if L3_5 ~= nil then
    L3_5 = A0_2["IpsecVPNPolicy.PolicyType"]
    if L3_5 == "1" then
      L3_5 = A0_2["IpsecVPNPolicy.PolicyType"]
      L1_3["IpsecVPNPolicy.PolicyType"] = L3_5
      L3_5 = A0_2["IpsecVPNPolicy.VPNPolicyName"]
      if L3_5 ~= nil then
        L3_5 = A0_2["IpsecVPNPolicy.VPNPolicyName"]
        L1_3["IpsecVPNPolicy.IKEPolicyName"] = L3_5
      end
      L3_5 = A0_2["IpsecVPNPolicy.SALifeTime"]
      if L3_5 ~= nil then
        L3_5 = A0_2["IpsecVPNPolicy.SALifeTime"]
        L1_3["IpsecVPNPolicy.SALifeTime"] = L3_5
      end
      L3_5 = A0_2["IpsecVPNPolicy.SALifeTimeType"]
      if L3_5 ~= nil then
        L3_5 = A0_2["IpsecVPNPolicy.SALifeTimeType"]
        L1_3["IpsecVPNPolicy.SALifeTimeType"] = L3_5
      end
      L3_5 = HIGH_SEC
      if L3_5 ~= "HIGH" then
        L1_3["IpsecVPNPolicy.EncryptionAlgorithm"] = "2"
        L3_5 = A0_2["IpsecVPNPolicy.AuthAlgorithm"]
        if L3_5 ~= nil then
          L3_5 = A0_2["IpsecVPNPolicy.AuthAlgorithm"]
          L1_3["IpsecVPNPolicy.AuthAlgorithm"] = L3_5
        end
      else
        L3_5 = A0_2["IpsecVPNPolicy.EncryptionAlgorithm"]
        if L3_5 ~= nil then
          L3_5 = A0_2["IpsecVPNPolicy.EncryptionAlgorithm"]
          L1_3["IpsecVPNPolicy.EncryptionAlgorithm"] = L3_5
        end
        L3_5 = A0_2["IpsecVPNPolicy.AuthAlgorithm"]
        if L3_5 ~= nil then
          L3_5 = A0_2["IpsecVPNPolicy.AuthAlgorithm"]
          L1_3["IpsecVPNPolicy.AuthAlgorithm"] = L3_5
        end
      end
      L3_5 = A0_2["IpsecVPNPolicy.KeyLength"]
      if L3_5 ~= nil then
        L3_5 = A0_2["IpsecVPNPolicy.KeyLength"]
        L1_3["IpsecVPNPolicy.KeyLength"] = L3_5
      end
      L3_5 = A0_2["IpsecVPNPolicy.PFSKeyGroup"]
      if L3_5 ~= nil then
        L3_5 = A0_2["IpsecVPNPolicy.PFSKeyGroup"]
        L1_3["IpsecVPNPolicy.PFSKeyGroup"] = L3_5
      end
      L3_5 = A0_2["IpsecVPNPolicy.PFSKeyGroup1"]
      if L3_5 ~= nil then
        L3_5 = A0_2["IpsecVPNPolicy.PFSKeyGroup1"]
        L1_3["IpsecVPNPolicy.PFSKeyGroup1"] = L3_5
      end
    else
      L3_5 = A0_2["IpsecVPNPolicy.PolicyType"]
      if L3_5 == "2" then
        L3_5 = A0_2["IpsecVPNPolicy.PolicyType"]
        L1_3["IpsecVPNPolicy.PolicyType"] = L3_5
        L3_5 = A0_2["IpsecVPNPolicy.VPNPolicyName"]
        if L3_5 ~= nil then
          L3_5 = A0_2["IpsecVPNPolicy.VPNPolicyName"]
          L1_3["IpsecVPNPolicy.IKEPolicyName"] = L3_5
        end
        L3_5 = A0_2["IpsecVPNPolicy.SPIIn"]
        if L3_5 ~= nil then
          L3_5 = A0_2["IpsecVPNPolicy.SPIIn"]
          L1_3["IpsecVPNPolicy.SPIIn"] = L3_5
        end
        L3_5 = A0_2["IpsecVPNPolicy.SPIOut"]
        if L3_5 ~= nil then
          L3_5 = A0_2["IpsecVPNPolicy.SPIOut"]
          L1_3["IpsecVPNPolicy.SPIOut"] = L3_5
        end
        L3_5 = HIGH_SEC
        if L3_5 ~= "HIGH" then
          L1_3["IpsecVPNPolicy.EncryptionAlgorithm"] = "2"
          L3_5 = A0_2["IpsecVPNPolicy.AuthAlgorithm"]
          if L3_5 ~= nil then
            L3_5 = A0_2["IpsecVPNPolicy.AuthAlgorithm"]
            L1_3["IpsecVPNPolicy.AuthAlgorithm"] = L3_5
          end
          L3_5 = A0_2["IpsecVPNPolicy.AuthKeyIn"]
          if L3_5 ~= nil then
            L3_5 = A0_2["IpsecVPNPolicy.AuthKeyIn"]
            L1_3["IpsecVPNPolicy.AuthKeyIn"] = L3_5
          end
          L3_5 = A0_2["IpsecVPNPolicy.AuthKeyOut"]
          if L3_5 ~= nil then
            L3_5 = A0_2["IpsecVPNPolicy.AuthKeyOut"]
            L1_3["IpsecVPNPolicy.AuthKeyOut"] = L3_5
          end
        else
          L3_5 = A0_2["IpsecVPNPolicy.EncryptionAlgorithm"]
          if L3_5 ~= nil then
            L3_5 = A0_2["IpsecVPNPolicy.EncryptionAlgorithm"]
            L1_3["IpsecVPNPolicy.EncryptionAlgorithm"] = L3_5
          end
          L3_5 = A0_2["IpsecVPNPolicy.AuthAlgorithm"]
          if L3_5 ~= nil then
            L3_5 = A0_2["IpsecVPNPolicy.AuthAlgorithm"]
            L1_3["IpsecVPNPolicy.AuthAlgorithm"] = L3_5
          end
          L3_5 = A0_2["IpsecVPNPolicy.AuthKeyIn"]
          if L3_5 ~= nil then
            L3_5 = A0_2["IpsecVPNPolicy.AuthKeyIn"]
            L1_3["IpsecVPNPolicy.AuthKeyIn"] = L3_5
          end
          L3_5 = A0_2["IpsecVPNPolicy.AuthKeyOut"]
          if L3_5 ~= nil then
            L3_5 = A0_2["IpsecVPNPolicy.AuthKeyOut"]
            L1_3["IpsecVPNPolicy.AuthKeyOut"] = L3_5
          end
        end
        L3_5 = A0_2["IpsecVPNPolicy.KeyLength"]
        if L3_5 ~= nil then
          L3_5 = A0_2["IpsecVPNPolicy.KeyLength"]
          L1_3["IpsecVPNPolicy.KeyLength"] = L3_5
        end
        L3_5 = A0_2["IpsecVPNPolicy.EncryptionKeyIn"]
        if L3_5 ~= nil then
          L3_5 = A0_2["IpsecVPNPolicy.EncryptionKeyIn"]
          L1_3["IpsecVPNPolicy.EncryptionKeyIn"] = L3_5
        end
        L3_5 = A0_2["IpsecVPNPolicy.EncryptionKeyOut"]
        if L3_5 ~= nil then
          L3_5 = A0_2["IpsecVPNPolicy.EncryptionKeyOut"]
          L1_3["IpsecVPNPolicy.EncryptionKeyOut"] = L3_5
        end
      end
    end
  end
  L3_5 = A0_2["IpsecVPNPolicy.modeConfigStatus"]
  if L3_5 ~= nil then
    L3_5 = A0_2["IpsecVPNPolicy.modeConfigStatus"]
    L1_3["IpsecVPNPolicy.modeConfigStatus"] = L3_5
  end
  L3_5 = A0_2["IpsecVPNPolicy.IpsecProtocol"]
  if L3_5 ~= nil then
    L3_5 = A0_2["IpsecVPNPolicy.IpsecProtocol"]
    L1_3["IpsecVPNPolicy.IpsecProtocol"] = L3_5
  end
  L3_5 = A0_2["IpsecVPNPolicy.Netbios"]
  if L3_5 ~= nil then
    L3_5 = A0_2["IpsecVPNPolicy.Netbios"]
    L1_3["IpsecVPNPolicy.Netbios"] = L3_5
  end
  L3_5 = A0_2["IpsecVPNPolicy.EnableDhcpOverIPSec"]
  if L3_5 ~= nil then
    L3_5 = A0_2["IpsecVPNPolicy.EnableDhcpOverIPSec"]
    L1_3["IpsecVPNPolicy.EnableDhcpOverIPSec"] = L3_5
  else
    L1_3["IpsecVPNPolicy.EnableDhcpOverIPSec"] = "0"
  end
  L3_5 = A0_2["IpsecVPNPolicy.Rollover"]
  if L3_5 ~= nil then
    L3_5 = A0_2["IpsecVPNPolicy.Rollover"]
    L1_3["IpsecVPNPolicy.Rollover"] = L3_5
  end
  L3_5 = A0_2["IpsecVPNPolicy.TunnelOrTransport"]
  if L3_5 ~= nil then
    L3_5 = A0_2["IpsecVPNPolicy.TunnelOrTransport"]
    L1_3["IpsecVPNPolicy.TunnelOrTransport"] = L3_5
  end
  L3_5 = A0_2["IpsecVPNPolicy.TunnelOrTransport"]
  if L3_5 == "1" then
    L3_5 = L1_3["IpsecVPNPolicy.EnableDhcpOverIPSec"]
    if L3_5 == "0" then
      L3_5 = A0_2["IpsecVPNPolicy.LocalNetworkType"]
      if L3_5 ~= nil then
        L3_5 = A0_2["IpsecVPNPolicy.LocalNetworkType"]
        L1_3["IpsecVPNPolicy.LocalNetworkType"] = L3_5
      end
      L3_5 = L1_3["IpsecVPNPolicy.LocalNetworkType"]
      if L3_5 == "1" then
        L3_5 = A0_2["IpsecVPNPolicy.LocalStartAddress"]
        if L3_5 ~= nil then
          L3_5 = A0_2["IpsecVPNPolicy.LocalStartAddress"]
          L1_3["IpsecVPNPolicy.LocalStartAddress"] = L3_5
        end
      else
        L3_5 = L1_3["IpsecVPNPolicy.LocalNetworkType"]
        if L3_5 == "2" then
          L3_5 = A0_2["IpsecVPNPolicy.LocalStartAddress"]
          if L3_5 ~= nil then
            L3_5 = A0_2["IpsecVPNPolicy.LocalStartAddress"]
            L1_3["IpsecVPNPolicy.LocalStartAddress"] = L3_5
          end
          L3_5 = A0_2["IpsecVPNPolicy.LocalEndAddress"]
          if L3_5 ~= nil then
            L3_5 = A0_2["IpsecVPNPolicy.LocalEndAddress"]
            L1_3["IpsecVPNPolicy.LocalEndAddress"] = L3_5
          end
        else
          L3_5 = L1_3["IpsecVPNPolicy.LocalNetworkType"]
          if L3_5 == "3" then
            L3_5 = A0_2["IpsecVPNPolicy.LocalStartAddress"]
            if L3_5 ~= nil then
              L3_5 = A0_2["IpsecVPNPolicy.LocalStartAddress"]
              L1_3["IpsecVPNPolicy.LocalStartAddress"] = L3_5
            end
            L3_5 = A0_2["IpsecIKEPolicy.AddressFamily"]
            if L3_5 == "10" then
              L3_5 = A0_2["IpsecVPNPolicy.LocalPrefixLength"]
              if L3_5 ~= nil then
                L3_5 = A0_2["IpsecVPNPolicy.LocalPrefixLength"]
                L1_3["IpsecVPNPolicy.LocalPrefixLength"] = L3_5
              end
            else
              L3_5 = A0_2["IpsecVPNPolicy.LocalSubnetMask"]
              if L3_5 ~= nil then
                L3_5 = A0_2["IpsecVPNPolicy.LocalSubnetMask"]
                L1_3["IpsecVPNPolicy.LocalSubnetMask"] = L3_5
              end
            end
          end
        end
      end
      L3_5 = A0_2["IpsecVPNPolicy.RemoteNetworkType"]
      if L3_5 ~= nil then
        L3_5 = A0_2["IpsecVPNPolicy.RemoteNetworkType"]
        L1_3["IpsecVPNPolicy.RemoteNetworkType"] = L3_5
      end
      L3_5 = L1_3["IpsecVPNPolicy.RemoteNetworkType"]
      if L3_5 == "1" then
        L3_5 = A0_2["IpsecVPNPolicy.RemoteStartAddress"]
        if L3_5 ~= nil then
          L3_5 = A0_2["IpsecVPNPolicy.RemoteStartAddress"]
          L1_3["IpsecVPNPolicy.RemoteStartAddress"] = L3_5
        end
      else
        L3_5 = L1_3["IpsecVPNPolicy.RemoteNetworkType"]
        if L3_5 == "2" then
          L3_5 = A0_2["IpsecVPNPolicy.RemoteStartAddress"]
          if L3_5 ~= nil then
            L3_5 = A0_2["IpsecVPNPolicy.RemoteStartAddress"]
            L1_3["IpsecVPNPolicy.RemoteStartAddress"] = L3_5
          end
          L3_5 = A0_2["IpsecVPNPolicy.RemoteEndAddress"]
          if L3_5 ~= nil then
            L3_5 = A0_2["IpsecVPNPolicy.RemoteEndAddress"]
            L1_3["IpsecVPNPolicy.RemoteEndAddress"] = L3_5
          end
        else
          L3_5 = L1_3["IpsecVPNPolicy.RemoteNetworkType"]
          if L3_5 == "3" then
            L3_5 = A0_2["IpsecVPNPolicy.RemoteStartAddress"]
            if L3_5 ~= nil then
              L3_5 = A0_2["IpsecVPNPolicy.RemoteStartAddress"]
              L1_3["IpsecVPNPolicy.RemoteStartAddress"] = L3_5
            end
            L3_5 = A0_2["IpsecIKEPolicy.AddressFamily"]
            if L3_5 == "10" then
              L3_5 = A0_2["IpsecVPNPolicy.RemotePrefixLength"]
              if L3_5 ~= nil then
                L3_5 = A0_2["IpsecVPNPolicy.RemotePrefixLength"]
                L1_3["IpsecVPNPolicy.RemotePrefixLength"] = L3_5
              end
            else
              L3_5 = A0_2["IpsecVPNPolicy.RemoteSubnetMask"]
              if L3_5 ~= nil then
                L3_5 = A0_2["IpsecVPNPolicy.RemoteSubnetMask"]
                L1_3["IpsecVPNPolicy.RemoteSubnetMask"] = L3_5
              end
            end
          end
        end
      end
    end
  else
    L3_5 = A0_2["IpsecVPNPolicy.TunnelOrTransport"]
    if L3_5 == "1" then
      L3_5 = L1_3["IpsecVPNPolicy.EnableDhcpOverIPSec"]
      if L3_5 == "1" then
        L1_3["IpsecVPNPolicy.LocalNetworkType"] = L2_4
        L1_3["IpsecVPNPolicy.RemoteNetworkType"] = L2_4
      end
    end
  end
  L3_5 = A0_2["IpsecVPNPolicy.LocalGateway"]
  if L3_5 ~= nil then
    L3_5 = A0_2["IpsecVPNPolicy.LocalGateway"]
    L1_3["IpsecVPNPolicy.LocalGateway"] = L3_5
  end
  L3_5 = A0_2["IpsecVPNPolicy.RemoteEndPointType"]
  if L3_5 ~= nil then
    L3_5 = A0_2["IpsecVPNPolicy.RemoteEndPointType"]
    L1_3["IpsecVPNPolicy.RemoteEndPointType"] = L3_5
  end
  L3_5 = A0_2["IpsecVPNPolicy.RemoteEndPoint"]
  if L3_5 ~= nil then
    L3_5 = A0_2["IpsecVPNPolicy.RemoteEndPoint"]
    L1_3["IpsecVPNPolicy.RemoteEndPoint"] = L3_5
  end
  L3_5 = A0_2["IpsecVPNPolicy.PolicyType"]
  if L3_5 == "1" then
    L3_5 = A0_2["IpsecVPNPolicy.EnableKeepAlive"]
    if L3_5 ~= nil then
      L3_5 = A0_2["IpsecVPNPolicy.EnableKeepAlive"]
      L1_3["IpsecVPNPolicy.EnableKeepAlive"] = L3_5
      L3_5 = L1_3["IpsecVPNPolicy.EnableKeepAlive"]
      if L3_5 == "1" then
        L3_5 = A0_2["IpsecVPNPolicy.RemotePingIPAddress"]
        if L3_5 ~= nil then
          L3_5 = A0_2["IpsecVPNPolicy.RemotePingIPAddress"]
          L1_3["IpsecVPNPolicy.RemotePingIPAddress"] = L3_5
        end
        L3_5 = A0_2["IpsecVPNPolicy.KeepAliveSourceAddress"]
        if L3_5 ~= nil then
          L3_5 = A0_2["IpsecVPNPolicy.KeepAliveSourceAddress"]
          L1_3["IpsecVPNPolicy.KeepAliveSourceAddress"] = L3_5
        end
        L3_5 = A0_2["IpsecVPNPolicy.KeepAlivePeriod"]
        L1_3["IpsecVPNPolicy.KeepAlivePeriod"] = L3_5
        L3_5 = A0_2["IpsecVPNPolicy.KeepAliveFailureCount"]
        L1_3["IpsecVPNPolicy.KeepAliveFailureCount"] = L3_5
      end
    end
  end
  L3_5 = A0_2["IpsecVPNPolicy.RVGStatus"]
  if L3_5 == "1" then
    L3_5 = A0_2["IpsecVPNPolicy.RVGStatus"]
    L1_3["IpsecVPNPolicy.RVGStatus"] = L3_5
    L3_5 = A0_2["IpsecVPNPolicy.BackupPolicyName"]
    if L3_5 ~= nil then
      L3_5 = A0_2["IpsecVPNPolicy.BackupPolicyName"]
      L1_3["IpsecVPNPolicy.BackupPolicyName"] = L3_5
    end
    L3_5 = A0_2["IpsecVPNPolicy.FailbackTime"]
    if L3_5 ~= nil then
      L3_5 = A0_2["IpsecVPNPolicy.FailbackTime"]
      L1_3["IpsecVPNPolicy.FailbackTime"] = L3_5
    end
  else
    L1_3["IpsecVPNPolicy.RVGStatus"] = "0"
    L1_3["IpsecVPNPolicy.BackupPolicyName"] = ""
    L1_3["IpsecVPNPolicy.FailbackTime"] = "30"
  end
  return L1_3
end
L0_0.getVpnPolicyPara = L1_1
L0_0 = ipsec
function L1_1(A0_6)
  local L1_7, L2_8
  L1_7 = {}
  L2_8 = A0_6["IpsecVPNPolicy.VPNPolicyName"]
  if L2_8 ~= nil then
    L2_8 = A0_6["IpsecVPNPolicy.VPNPolicyName"]
    L1_7["IpsecIKEPolicy.IKEPolicyName"] = L2_8
  end
  L2_8 = A0_6["IpsecVPNPolicy.modeConfigStatus"]
  if L2_8 ~= nil then
    L2_8 = A0_6["IpsecVPNPolicy.modeConfigStatus"]
    L1_7["IpsecIKEPolicy.ModeConfigStatus"] = L2_8
  end
  L2_8 = A0_6["IpsecIKEPolicy.AddressFamily"]
  if L2_8 ~= nil then
    L2_8 = A0_6["IpsecIKEPolicy.AddressFamily"]
    L1_7["IpsecIKEPolicy.AddressFamily"] = L2_8
  end
  L2_8 = A0_6["IpsecIKEPolicy.ExchangeMode"]
  if L2_8 ~= nil then
    L2_8 = A0_6["IpsecIKEPolicy.ExchangeMode"]
    L1_7["IpsecIKEPolicy.ExchangeMode"] = L2_8
  end
  L2_8 = A0_6["IpsecIKEPolicy.Direction"]
  if L2_8 ~= nil then
    L2_8 = A0_6["IpsecIKEPolicy.Direction"]
    L1_7["IpsecIKEPolicy.Direction"] = L2_8
  end
  L2_8 = A0_6["IpsecIKEPolicy.NatTraversal"]
  if L2_8 ~= nil then
    L2_8 = A0_6["IpsecIKEPolicy.NatTraversal"]
    L1_7["IpsecIKEPolicy.NatTraversal"] = L2_8
    L2_8 = A0_6["IpsecIKEPolicy.NatTraversal"]
    if L2_8 == "1" then
      L2_8 = A0_6["IpsecIKEPolicy.NatKeepAliveTime"]
      if L2_8 ~= nil then
        L2_8 = A0_6["IpsecIKEPolicy.NatKeepAliveTime"]
        L1_7["IpsecIKEPolicy.NatKeepAliveTime"] = L2_8
      end
    end
  end
  L2_8 = A0_6["IpsecIKEPolicy.LocalIdentifierType"]
  if L2_8 ~= nil then
    L2_8 = A0_6["IpsecIKEPolicy.LocalIdentifierType"]
    L1_7["IpsecIKEPolicy.LocalIdentifierType"] = L2_8
    L2_8 = L1_7["IpsecIKEPolicy.LocalIdentifierType"]
    if L2_8 ~= "1" then
      L2_8 = L1_7["IpsecIKEPolicy.LocalIdentifierType"]
      if L2_8 ~= "2" then
        L2_8 = L1_7["IpsecIKEPolicy.LocalIdentifierType"]
      end
    elseif L2_8 == "3" then
      L2_8 = A0_6["IpsecIKEPolicy.LocalIdentifier"]
      L1_7["IpsecIKEPolicy.LocalIdentifier"] = L2_8
    end
  end
  L2_8 = A0_6["IpsecIKEPolicy.RemoteIdentifierType"]
  if L2_8 ~= nil then
    L2_8 = A0_6["IpsecIKEPolicy.RemoteIdentifierType"]
    L1_7["IpsecIKEPolicy.RemoteIdentifierType"] = L2_8
    L2_8 = L1_7["IpsecIKEPolicy.RemoteIdentifierType"]
    if L2_8 ~= "1" then
      L2_8 = L1_7["IpsecIKEPolicy.RemoteIdentifierType"]
      if L2_8 ~= "2" then
        L2_8 = L1_7["IpsecIKEPolicy.RemoteIdentifierType"]
      end
    elseif L2_8 == "3" then
      L2_8 = A0_6["IpsecIKEPolicy.RemoteIdentifier"]
      L1_7["IpsecIKEPolicy.RemoteIdentifier"] = L2_8
    end
  end
  L2_8 = A0_6["IpsecIKEPolicy.EncryptionAlgorithm"]
  if L2_8 ~= nil then
    L2_8 = A0_6["IpsecIKEPolicy.EncryptionAlgorithm"]
    L1_7["IpsecIKEPolicy.EncryptionAlgorithm"] = L2_8
  end
  L2_8 = A0_6["IpsecIKEPolicy.AuthAlgorithm"]
  if L2_8 ~= nil then
    L2_8 = A0_6["IpsecIKEPolicy.AuthAlgorithm"]
    L1_7["IpsecIKEPolicy.AuthAlgorithm"] = L2_8
  end
  L2_8 = A0_6["IpsecIKEPolicy.AuthType"]
  if L2_8 ~= nil then
    L2_8 = A0_6["IpsecIKEPolicy.AuthType"]
    L1_7["IpsecIKEPolicy.AuthType"] = L2_8
    L2_8 = L1_7["IpsecIKEPolicy.AuthType"]
    if L2_8 == "0" then
      L2_8 = A0_6["IpsecIKEPolicy.Presharedkey"]
      if L2_8 ~= nil then
        L2_8 = A0_6["IpsecIKEPolicy.Presharedkey"]
        L1_7["IpsecIKEPolicy.Presharedkey"] = L2_8
      end
    end
  end
  L2_8 = A0_6["IpsecIKEPolicy.DHGroup"]
  if L2_8 ~= nil then
    L2_8 = A0_6["IpsecIKEPolicy.DHGroup"]
    L1_7["IpsecIKEPolicy.DHGroup"] = L2_8
  end
  L2_8 = A0_6["IpsecIKEPolicy.SALifeTime"]
  if L2_8 ~= nil then
    L2_8 = A0_6["IpsecIKEPolicy.SALifeTime"]
    L1_7["IpsecIKEPolicy.SALifeTime"] = L2_8
  end
  L2_8 = A0_6["IpsecIKEPolicy.DPD"]
  if L2_8 ~= nil then
    L2_8 = A0_6["IpsecIKEPolicy.DPD"]
    L1_7["IpsecIKEPolicy.DPD"] = L2_8
    L2_8 = A0_6["IpsecIKEPolicy.DPD"]
    if L2_8 == "1" then
      L2_8 = A0_6["IpsecIKEPolicy.DPDDetectionPeriod"]
      if L2_8 ~= nil then
        L2_8 = A0_6["IpsecIKEPolicy.DPDDetectionPeriod"]
        L1_7["IpsecIKEPolicy.DPDDetectionPeriod"] = L2_8
      end
      L2_8 = A0_6["IpsecIKEPolicy.DPDFailureCount"]
      if L2_8 ~= nil then
        L2_8 = A0_6["IpsecIKEPolicy.DPDFailureCount"]
        L1_7["IpsecIKEPolicy.DPDFailureCount"] = L2_8
      end
    end
  end
  L2_8 = A0_6["IpsecIKEPolicy.XAUTHType"]
  if L2_8 ~= nil then
    L2_8 = A0_6["IpsecIKEPolicy.XAUTHType"]
    L1_7["IpsecIKEPolicy.XAUTHType"] = L2_8
    L2_8 = A0_6["IpsecIKEPolicy.XAUTHProfile"]
    L1_7["IpsecIKEPolicy.XAUTHProfile"] = L2_8
    L2_8 = A0_6["IpsecIKEPolicy.XAUTHType"]
    if L2_8 == "2" then
      L2_8 = A0_6["IpsecIKEPolicy.XAUTHType1"]
      L1_7["IpsecIKEPolicy.XAUTHType1"] = L2_8
    end
    L2_8 = A0_6["IpsecIKEPolicy.XAUTHType"]
    if L2_8 == "1" then
      L2_8 = A0_6["IpsecIKEPolicy.UserName"]
      if L2_8 ~= nil then
        L2_8 = A0_6["IpsecIKEPolicy.UserName"]
        L1_7["IpsecIKEPolicy.UserName"] = L2_8
      end
      L2_8 = A0_6["IpsecIKEPolicy.Password"]
      if L2_8 ~= nil then
        L2_8 = A0_6["IpsecIKEPolicy.Password"]
        L1_7["IpsecIKEPolicy.Password"] = L2_8
      end
    end
  end
  L2_8 = A0_6["IpsecIKEPolicy.KeyLength"]
  if L2_8 ~= nil then
    L2_8 = A0_6["IpsecIKEPolicy.KeyLength"]
    L1_7["IpsecIKEPolicy.KeyLength"] = L2_8
  end
  L2_8 = A0_6["IpsecIKEPolicy.IKEVersion"]
  if L2_8 ~= nil then
    L2_8 = A0_6["IpsecIKEPolicy.IKEVersion"]
    L1_7["IpsecIKEPolicy.IKEVersion"] = L2_8
  end
  return L1_7
end
L0_0.getIkePolicyPara = L1_1
L0_0 = ipsec
function L1_1(A0_9, A1_10)
  local L2_11, L3_12, L4_13, L5_14, L6_15
  L2_11 = ACCESS_LEVEL
  if L2_11 ~= 0 then
    L2_11 = "ACCESS_DENIED"
    L3_12 = "10187"
    return L2_11, L3_12
  end
  if A1_10 == nil then
    A1_10 = false
  end
  L2_11 = nil
  L3_12 = RowId
  L4_13 = exportFlag
  if L3_12 == L4_13 then
    L3_12 = "/tmp/ezvpn.cfg"
    L4_13 = io
    L4_13 = L4_13.open
    L5_14 = L3_12
    L6_15 = "w"
    L4_13 = L4_13(L5_14, L6_15)
    L2_11 = L4_13
    if not L2_11 then
      L4_13 = "ERROR"
      L5_14 = "10775"
      return L4_13, L5_14
    end
  end
  if not A1_10 then
    L3_12 = db
    L3_12 = L3_12.beginTransaction
    L3_12()
  end
  L3_12 = "OK"
  errorFlag = L3_12
  L3_12 = "12265"
  statusCode = L3_12
  L3_12 = A0_9["IpsecVPNPolicy.PolicyType"]
  if L3_12 == "1" then
    L3_12 = ipsec
    L3_12 = L3_12.getIkePolicyPara
    L4_13 = A0_9
    L3_12 = L3_12(L4_13)
    L4_13 = L3_12["IpsecIKEPolicy.KeyLength"]
    if L4_13 ~= nil then
      L4_13 = L3_12["IpsecIKEPolicy.KeyLength"]
    elseif L4_13 == "" then
      L3_12["IpsecIKEPolicy.KeyLength"] = 0
    end
    L4_13 = 1
    L5_14 = {
      L6_15,
      function()
        return validations.checkboxValidate(_UPVALUE0_["IpsecIKEPolicy.AuthType"], "0", 1)
      end,
      function()
        return validations.preShrKeyChk(_UPVALUE0_["IpsecIKEPolicy.Presharedkey"], "Pre Share Key Error")
      end,
      function()
        return validations.checkboxValidate(_UPVALUE0_["IpsecIKEPolicy.DPD"], "1", 2)
      end,
      function()
        return validations.detPeriod(_UPVALUE0_["IpsecIKEPolicy.DPDDetectionPeriod"], "Detection Period Error")
      end,
      function()
        return validations.reConCount(_UPVALUE0_["IpsecIKEPolicy.DPDFailureCount"], "Re-Con Count Error")
      end
    }
    function L6_15()
      return validations.isEmpty(_UPVALUE0_["IpsecIKEPolicy.IKEPolicyName"], "IKE Policy Name Error")
    end
    validationTable = L5_14
    while true do
      L5_14 = validationTable
      L5_14 = #L5_14
      if L4_13 <= L5_14 then
        L5_14 = validationTable
        L5_14 = L5_14[L4_13]
        validationFunc = L5_14
        L5_14 = validationFunc
        field, skipValidations, L5_14 = function()
          return validations.checkboxValidate(_UPVALUE0_["IpsecIKEPolicy.AuthType"], "0", 1)
        end, function()
          return validations.preShrKeyChk(_UPVALUE0_["IpsecIKEPolicy.Presharedkey"], "Pre Share Key Error")
        end, L5_14()
        field, skipValidations, L6_15 = function()
          return validations.checkboxValidate(_UPVALUE0_["IpsecIKEPolicy.AuthType"], "0", 1)
        end, function()
          return validations.preShrKeyChk(_UPVALUE0_["IpsecIKEPolicy.Presharedkey"], "Pre Share Key Error")
        end, L5_14()
        statusCode = L6_15
        errorFlag = L5_14
        L5_14 = errorFlag
        if L5_14 ~= 1 then
          L5_14 = errorFlag
        elseif L5_14 == "ERROR" then
          L5_14 = db
          L5_14 = L5_14.getAttribute
          L6_15 = "stringsMap"
          L5_14 = L5_14(L6_15, "stringId", statusCode, LANGUAGE)
          L5_14 = L5_14 or statusCode
          statusCode = L5_14
          L5_14 = field
          L6_15 = ": "
          L5_14 = L5_14 .. L6_15 .. statusMessage
          statusCode = L5_14
          break
        end
      end
      L5_14 = skipValidations
      if L5_14 ~= "" then
        L5_14 = skipValidations
        L5_14 = L4_13 + L5_14
        L4_13 = L5_14 + 1
      else
        L4_13 = L4_13 + 1
      end
    end
    L5_14 = "IpsecIKEPolicy"
    DBTable = L5_14
    L5_14 = errorFlag
    if L5_14 ~= "OK" then
      L5_14 = errorFlag
    elseif L5_14 == 0 then
      L5_14 = RowId
      if L5_14 == "-1" then
        L5_14 = vipSecure
        L5_14 = L5_14.ikeConfig
        L6_15 = L3_12
        L6_15 = L5_14(L6_15, "-1", "add")
        statusCode = L6_15
        errorFlag = L5_14
      else
        L5_14 = RowId
        L6_15 = exportFlag
        if L5_14 == L6_15 then
          L5_14 = L3_12["IpsecIKEPolicy.LocalIdentifierType"]
          if L5_14 == "0" then
            L3_12["IpsecIKEPolicy.LocalIdentifier"] = ""
          end
          L5_14 = L3_12["IpsecIKEPolicy.RemoteIdentifierType"]
          if L5_14 == "0" then
            L5_14 = A0_9["IpsecVPNPolicy.RemoteEndPoint"]
            L3_12["IpsecIKEPolicy.RemoteIdentifier"] = L5_14
          end
          L5_14 = tonumber
          L6_15 = L3_12["IpsecIKEPolicy.XAUTHType"]
          L5_14 = L5_14(L6_15)
          if L5_14 > 1 then
            L5_14 = L3_12["IpsecIKEPolicy.XAUTHType1"]
            L3_12["IpsecIKEPolicy.XAUTHType"] = L5_14
          else
            L5_14 = L3_12["IpsecIKEPolicy.XAUTHType"]
            L3_12["IpsecIKEPolicy.XAUTHType"] = L5_14
          end
          L5_14 = db
          L5_14 = L5_14.typeAndRangeValidate
          L6_15 = L3_12
          L5_14 = L5_14(L6_15)
          if not L5_14 then
            L5_14 = "ERROR"
            errorFlag = L5_14
            L5_14 = "10948"
            statusCode = L5_14
          end
          L5_14 = errorFlag
          if L5_14 ~= "OK" then
            L5_14 = errorFlag
          elseif L5_14 == 0 then
            L5_14 = "IpsecIKEPolicy"
            exportTable = L5_14
            L5_14 = ezvpn
            L5_14 = L5_14.exportToFile
            L6_15 = exportTable
            L6_15 = L5_14(L6_15, L3_12, L2_11)
            statusCode = L6_15
            errorFlag = L5_14
          end
        else
          L5_14 = db
          L5_14 = L5_14.getRow
          L6_15 = "IpsecVPNPolicy"
          L5_14 = L5_14(L6_15, "_ROWID_", RowId)
          if L5_14 == nil then
            L6_15 = db
            L6_15 = L6_15.rollback
            L6_15()
            L6_15 = "ERROR"
            return L6_15, "10790"
          end
          L6_15 = L5_14["IpsecVPNPolicy.PolicyType"]
          if L6_15 == "1" then
            L6_15 = db
            L6_15 = L6_15.getAttribute
            L6_15 = L6_15("IpsecIKEPolicy", "IKEPolicyName", L5_14["IpsecVPNPolicy.IKEPolicyName"], "_ROWID_")
            errorFlag, statusCode = vipSecure.ikeConfig(L3_12, L6_15, "edit")
          else
            L6_15 = vipSecure
            L6_15 = L6_15.ikeConfig
            statusCode, L6_15 = L3_12, L6_15(L3_12, "-1", "add")
            errorFlag = L6_15
          end
        end
      end
    end
    L5_14 = errorFlag
    if L5_14 == "OK" then
      L5_14 = ipsec
      L5_14 = L5_14.getVpnPolicyPara
      L6_15 = A0_9
      L5_14 = L5_14(L6_15)
      L6_15 = L5_14["IpsecVPNPolicy.VPNPolicyName"]
      L5_14["IpsecIKEPolicy.IKEPolicyName"] = L6_15
      L6_15 = L5_14["IpsecVPNPolicy.Netbios"]
      if L6_15 == "1" then
        L5_14["IpsecVPNPolicy.RemoteNetworkType"] = "3"
      end
      L6_15 = L5_14["IpsecVPNPolicy.TunnelOrTransport"]
      if L6_15 == "0" then
        L5_14["IpsecVPNPolicy.RemoteNetworkType"] = "0"
        L5_14["IpsecVPNPolicy.LocalNetworkType"] = "0"
      end
      L6_15 = L5_14["IpsecVPNPolicy.PFSKeyGroup"]
      if L6_15 == "1" then
        L6_15 = L5_14["IpsecVPNPolicy.PFSKeyGroup1"]
        L5_14["IpsecVPNPolicy.PFSKeyGroup"] = L6_15
      end
      L6_15 = L5_14["IpsecVPNPolicy.KeyLength"]
      if L6_15 ~= nil then
        L6_15 = L5_14["IpsecVPNPolicy.KeyLength"]
      elseif L6_15 == "" then
        L5_14["IpsecVPNPolicy.KeyLength"] = 0
      end
      L6_15 = "IpsecVPNPolicy"
      DBTable = L6_15
      L4_13 = 1
      L6_15 = {
        function()
          return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.RemoteEndPointType"], "0", 1)
        end,
        function()
          return validations.ipAddressValidate(_UPVALUE0_["IpsecVPNPolicy.RemoteEndPoint"], "", "Remote IP error")
        end,
        function()
          return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.LocalNetworkType"], "1", 1)
        end,
        function()
          return validations.ipAddressValidate(_UPVALUE0_["IpsecVPNPolicy.LocalStartAddress"], "", "Local IP error")
        end,
        function()
          return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.LocalNetworkType"], "2", 1)
        end,
        function()
          return validations.ipRangeValidate(_UPVALUE0_["IpsecVPNPolicy.LocalStartAddress"], _UPVALUE0_["IpsecVPNPolicy.LocalEndAddress"], "Local IP start/end error")
        end,
        function()
          return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.RemoteNetworkType"], "1", 1)
        end,
        function()
          return validations.ipAddressValidate(_UPVALUE0_["IpsecVPNPolicy.RemoteStartAddress"], "", "Remote IP error")
        end,
        function()
          return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.RemoteNetworkType"], "2", 1)
        end,
        function()
          return validations.ipRangeValidate(_UPVALUE0_["IpsecVPNPolicy.RemoteStartAddress"], _UPVALUE0_["IpsecVPNPolicy.RemoteEndAddress"], "Remote start/stop error")
        end,
        function()
          return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.SALifeTimeType"], "0", 1)
        end,
        function()
          return validations.vpnSaLifeTime(300, _UPVALUE0_["IpsecVPNPolicy.SALifeTime"], "SA lifetime error")
        end,
        function()
          return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.SALifeTimeType"], "1", 1)
        end,
        function()
          return validations.vpnSaLifeTime(1920000, _UPVALUE0_["IpsecVPNPolicy.SALifeTime"], "SA lifetime error")
        end
      }
      validationTable = L6_15
      L6_15 = {
        function()
          return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.RemoteEndPointType"], "0", 1)
        end,
        function()
          return validations.ipv6AddrValidate(_UPVALUE0_["IpsecVPNPolicy.RemoteEndPoint"], "", "Remote IP error")
        end,
        function()
          return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.LocalNetworkType"], "1", 1)
        end,
        function()
          return validations.ipv6AddrValidate(_UPVALUE0_["IpsecVPNPolicy.LocalStartAddress"], "", "Local IP error")
        end,
        function()
          return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.LocalNetworkType"], "2", 1)
        end,
        function()
          return validations.v6AddrCom(_UPVALUE0_["IpsecVPNPolicy.LocalStartAddress"], _UPVALUE0_["IpsecVPNPolicy.LocalEndAddress"], "Local IP start/end error")
        end,
        function()
          return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.RemoteNetworkType"], "1", 1)
        end,
        function()
          return validations.ipv6AddrValidate(_UPVALUE0_["IpsecVPNPolicy.RemoteStartAddress"], "", "Remote IP error")
        end,
        function()
          return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.RemoteNetworkType"], "2", 1)
        end,
        function()
          return validations.v6AddrCom(_UPVALUE0_["IpsecVPNPolicy.RemoteStartAddress"], _UPVALUE0_["IpsecVPNPolicy.RemoteEndAddress"], "Remote start/stop error")
        end,
        function()
          return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.SALifeTimeType"], "0", 1)
        end,
        function()
          return validations.vpnSaLifeTime(300, _UPVALUE0_["IpsecVPNPolicy.SALifeTime"], "SA lifetime error")
        end,
        function()
          return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.SALifeTimeType"], "1", 1)
        end,
        function()
          return validations.vpnSaLifeTime(1920000, _UPVALUE0_["IpsecVPNPolicy.SALifeTime"], "SA lifetime error")
        end
      }
      validationTable6 = L6_15
      L6_15 = L5_14["IpsecVPNPolicy.AddressFamily"]
      if L6_15 == "10" then
        while true do
          L6_15 = validationTable6
          L6_15 = #L6_15
          if L4_13 <= L6_15 then
            L6_15 = validationTable6
            L6_15 = L6_15[L4_13]
            validationFunc = L6_15
            L6_15 = validationFunc
            statusCode, field, skipValidations, L6_15 = function()
              return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.RemoteEndPointType"], "0", 1)
            end, function()
              return validations.ipv6AddrValidate(_UPVALUE0_["IpsecVPNPolicy.RemoteEndPoint"], "", "Remote IP error")
            end, function()
              return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.LocalNetworkType"], "1", 1)
            end, L6_15()
            errorFlag = L6_15
            L6_15 = errorFlag
            if L6_15 ~= 1 then
              L6_15 = errorFlag
            else
              if L6_15 == "ERROR" then
                L6_15 = db
                L6_15 = L6_15.getAttribute
                L6_15 = L6_15("stringsMap", "stringId", statusCode, LANGUAGE)
                L6_15 = L6_15 or statusCode
                statusCode = L6_15
                L6_15 = field
                L6_15 = L6_15 .. ": " .. statusMessage
                statusCode = L6_15
            end
          end
          else
            L6_15 = skipValidations
            if L6_15 ~= "" then
              L6_15 = skipValidations
              L6_15 = L4_13 + L6_15
              L4_13 = L6_15 + 1
            else
              L4_13 = L4_13 + 1
            end
            while true do
              else
                L6_15 = validationTable
                L6_15 = #L6_15
                if L4_13 <= L6_15 then
                  L6_15 = validationTable
                  L6_15 = L6_15[L4_13]
                  validationFunc = L6_15
                  L6_15 = validationFunc
                  statusCode, field, skipValidations, L6_15 = ": ", statusMessage, statusCode, L6_15()
                  errorFlag = L6_15
                  L6_15 = errorFlag
                  if L6_15 ~= 1 then
                    L6_15 = errorFlag
                  elseif L6_15 == "ERROR" then
                    L6_15 = db
                    L6_15 = L6_15.getAttribute
                    L6_15 = L6_15("stringsMap", "stringId", statusCode, LANGUAGE)
                    L6_15 = L6_15 or statusCode
                    statusCode = L6_15
                    L6_15 = field
                    L6_15 = L6_15 .. ": " .. statusMessage
                    statusCode = L6_15
                    break
                  end
                end
                L6_15 = skipValidations
                if L6_15 ~= "" then
                  L6_15 = skipValidations
                  L6_15 = L4_13 + L6_15
                  L4_13 = L6_15 + 1
                else
                  L4_13 = L4_13 + 1
                end
              end
            end
          end
        end
      L6_15 = errorFlag
      if L6_15 ~= "OK" then
        L6_15 = errorFlag
      elseif L6_15 == 0 then
        L6_15 = RowId
        if L6_15 == "-1" then
          L6_15 = vipSecure
          L6_15 = L6_15.ipsecVPNPolicyConfig
          statusCode, L6_15 = L5_14, L6_15(L5_14, RowId, "add", A1_10)
          errorFlag = L6_15
        else
          L6_15 = RowId
          if L6_15 == exportFlag then
            L6_15 = db
            L6_15 = L6_15.typeAndRangeValidate
            L6_15 = L6_15(L5_14)
            if not L6_15 then
              L6_15 = "ERROR"
              errorFlag = L6_15
              L6_15 = "11113"
              statusCode = L6_15
            end
            L6_15 = errorFlag
            if L6_15 ~= "OK" then
              L6_15 = errorFlag
            elseif L6_15 == 0 then
              L6_15 = "IpsecVPNPolicy"
              exportTable = L6_15
              L6_15 = ezvpn
              L6_15 = L6_15.exportToFile
              statusCode, L6_15 = exportTable, L6_15(exportTable, L5_14, L2_11)
              errorFlag = L6_15
            end
          else
            L6_15 = vipSecure
            L6_15 = L6_15.ipsecVPNPolicyConfig
            statusCode, L6_15 = L5_14, L6_15(L5_14, RowId, "edit", A1_10)
            errorFlag = L6_15
          end
        end
      end
    end
  else
    L3_12 = ipsec
    L3_12 = L3_12.getVpnPolicyPara
    L4_13 = A0_9
    L3_12 = L3_12(L4_13)
    L4_13 = L3_12["IpsecVPNPolicy.Netbios"]
    if L4_13 == "1" then
      L3_12["IpsecVPNPolicy.RemoteNetworkType"] = "3"
    end
    L4_13 = L3_12["IpsecVPNPolicy.TunnelOrTransport"]
    if L4_13 == "0" then
      L3_12["IpsecVPNPolicy.RemoteNetworkType"] = "0"
      L3_12["IpsecVPNPolicy.LocalNetworkType"] = "0"
    end
    L4_13 = L3_12["IpsecVPNPolicy.PFSKeyGroup"]
    if L4_13 == "1" then
      L4_13 = L3_12["IpsecVPNPolicy.PFSKeyGroup1"]
      L3_12["IpsecVPNPolicy.PFSKeyGroup"] = L4_13
    end
    L4_13 = L3_12["IpsecVPNPolicy.KeyLength"]
    if L4_13 ~= nil then
      L4_13 = L3_12["IpsecVPNPolicy.KeyLength"]
    elseif L4_13 == "" then
      L3_12["IpsecVPNPolicy.KeyLength"] = 0
    end
    L4_13 = "IpsecVPNPolicy"
    DBTable = L4_13
    L4_13 = 1
    tableIndex = L4_13
    L4_13 = "OK"
    errorFlag = L4_13
    L4_13 = {
      L5_14,
      L6_15,
      function()
        return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.LocalNetworkType"], "1", 1)
      end,
      function()
        return validations.ipAddressValidate(_UPVALUE0_["IpsecVPNPolicy.LocalStartAddress"], "", "Local IP error")
      end,
      function()
        return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.LocalNetworkType"], "2", 1)
      end,
      function()
        return validations.ipRangeValidate(_UPVALUE0_["IpsecVPNPolicy.LocalStartAddress"], _UPVALUE0_["IpsecVPNPolicy.LocalEndAddress"], "Local IP start/end error")
      end,
      function()
        return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.RemoteNetworkType"], "1", 1)
      end,
      function()
        return validations.ipAddressValidate(_UPVALUE0_["IpsecVPNPolicy.RemoteStartAddress"], "", "Remote IP error")
      end,
      function()
        return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.RemoteNetworkType"], "2", 1)
      end,
      function()
        return validations.ipRangeValidate(_UPVALUE0_["IpsecVPNPolicy.RemoteStartAddress"], _UPVALUE0_["IpsecVPNPolicy.RemoteEndAddress"], "Remote start/stop error")
      end,
      function()
        return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.SALifeTimeType"], "0", 1)
      end,
      function()
        return validations.vpnSaLifeTime(300, _UPVALUE0_["IpsecVPNPolicy.SALifeTime"], "SA lifetime error")
      end,
      function()
        return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.SALifeTimeType"], "1", 1)
      end,
      function()
        return validations.vpnSaLifeTime(1920000, _UPVALUE0_["IpsecVPNPolicy.SALifeTime"], "SA lifetime error")
      end
    }
    function L5_14()
      return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.RemoteEndPointType"], "0", 1)
    end
    function L6_15()
      return validations.ipAddressValidate(_UPVALUE0_["IpsecVPNPolicy.RemoteEndPoint"], "", "Remote IP error")
    end
    validationTable = L4_13
    L4_13 = {
      L5_14,
      L6_15,
      function()
        return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.LocalNetworkType"], "1", 1)
      end,
      function()
        return validations.ipv6AddrValidate(_UPVALUE0_["IpsecVPNPolicy.LocalStartAddress"], "", "Local IP error")
      end,
      function()
        return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.LocalNetworkType"], "2", 1)
      end,
      function()
        return validations.v6AddrCom(_UPVALUE0_["IpsecVPNPolicy.LocalStartAddress"], _UPVALUE0_["IpsecVPNPolicy.LocalEndAddress"], "Local IP start/end error")
      end,
      function()
        return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.RemoteNetworkType"], "1", 1)
      end,
      function()
        return validations.ipv6AddrValidate(_UPVALUE0_["IpsecVPNPolicy.RemoteStartAddress"], "", "Remote IP error")
      end,
      function()
        return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.RemoteNetworkType"], "2", 1)
      end,
      function()
        return validations.v6AddrCom(_UPVALUE0_["IpsecVPNPolicy.RemoteStartAddress"], _UPVALUE0_["IpsecVPNPolicy.RemoteEndAddress"], "Remote start/stop error")
      end,
      function()
        return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.SALifeTimeType"], "0", 1)
      end,
      function()
        return validations.vpnSaLifeTime(300, _UPVALUE0_["IpsecVPNPolicy.SALifeTime"], "SA lifetime error")
      end,
      function()
        return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.SALifeTimeType"], "1", 1)
      end,
      function()
        return validations.vpnSaLifeTime(1920000, _UPVALUE0_["IpsecVPNPolicy.SALifeTime"], "SA lifetime error")
      end
    }
    function L5_14()
      return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.RemoteEndPointType"], "0", 1)
    end
    function L6_15()
      return validations.ipv6AddrValidate(_UPVALUE0_["IpsecVPNPolicy.RemoteEndPoint"], "", "Remote IP error")
    end
    validationTable6 = L4_13
    L4_13 = L3_12["IpsecVPNPolicy.AddressFamily"]
    if L4_13 == "10" then
      while true do
        L4_13 = tableIndex
        L5_14 = validationTable6
        L5_14 = #L5_14
        if L4_13 <= L5_14 then
          L4_13 = validationTable6
          L5_14 = tableIndex
          L4_13 = L4_13[L5_14]
          validationFunc = L4_13
          L4_13 = validationFunc
          skipValidations, L4_13 = function()
            return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.LocalNetworkType"], "1", 1)
          end, L4_13()
          skipValidations, L5_14 = function()
            return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.LocalNetworkType"], "1", 1)
          end, L4_13()
          skipValidations, L6_15 = function()
            return validations.checkboxValidate(_UPVALUE0_["IpsecVPNPolicy.LocalNetworkType"], "1", 1)
          end, L4_13()
          field = L6_15
          statusCode = L5_14
          errorFlag = L4_13
          L4_13 = errorFlag
          if L4_13 ~= 1 then
            L4_13 = errorFlag
          else
            if L4_13 == "ERROR" then
              L4_13 = db
              L4_13 = L4_13.getAttribute
              L5_14 = "stringsMap"
              L6_15 = "stringId"
              L4_13 = L4_13(L5_14, L6_15, statusCode, LANGUAGE)
              L4_13 = L4_13 or statusCode
              statusCode = L4_13
              L4_13 = field
              L5_14 = ": "
              L6_15 = statusMessage
              L4_13 = L4_13 .. L5_14 .. L6_15
              statusCode = L4_13
          end
        end
        else
          L4_13 = skipValidations
          if L4_13 ~= "" then
            L4_13 = tableIndex
            L5_14 = skipValidations
            L4_13 = L4_13 + L5_14
            L4_13 = L4_13 + 1
            tableIndex = L4_13
          else
            L4_13 = tableIndex
            L4_13 = L4_13 + 1
            tableIndex = L4_13
          end
          while true do
            else
              L4_13 = tableIndex
              L5_14 = validationTable
              L5_14 = #L5_14
              if L4_13 <= L5_14 then
                L4_13 = validationTable
                L5_14 = tableIndex
                L4_13 = L4_13[L5_14]
                validationFunc = L4_13
                L4_13 = validationFunc
                skipValidations, L4_13 = statusCode, L4_13()
                skipValidations, L5_14 = statusCode, L4_13()
                skipValidations, L6_15 = statusCode, L4_13()
                field = L6_15
                statusCode = L5_14
                errorFlag = L4_13
                L4_13 = errorFlag
                if L4_13 ~= 1 then
                  L4_13 = errorFlag
                elseif L4_13 == "ERROR" then
                  L4_13 = db
                  L4_13 = L4_13.getAttribute
                  L5_14 = "stringsMap"
                  L6_15 = "stringId"
                  L4_13 = L4_13(L5_14, L6_15, statusCode, LANGUAGE)
                  L4_13 = L4_13 or statusCode
                  statusCode = L4_13
                  L4_13 = field
                  L5_14 = ": "
                  L6_15 = statusMessage
                  L4_13 = L4_13 .. L5_14 .. L6_15
                  statusCode = L4_13
                  break
                end
              end
              L4_13 = skipValidations
              if L4_13 ~= "" then
                L4_13 = tableIndex
                L5_14 = skipValidations
                L4_13 = L4_13 + L5_14
                L4_13 = L4_13 + 1
                tableIndex = L4_13
              else
                L4_13 = tableIndex
                L4_13 = L4_13 + 1
                tableIndex = L4_13
              end
            end
          end
        end
      end
    L4_13 = errorFlag
    if L4_13 ~= "OK" then
      L4_13 = errorFlag
    elseif L4_13 == 0 then
      L4_13 = RowId
      if L4_13 == "-1" then
        L4_13 = vipSecure
        L4_13 = L4_13.ipsecVPNPolicyConfig
        L5_14 = L3_12
        L6_15 = RowId
        L5_14 = L4_13(L5_14, L6_15, "add", A1_10)
        statusCode = L5_14
        errorFlag = L4_13
      else
        L4_13 = RowId
        L5_14 = exportFlag
        if L4_13 == L5_14 then
          L4_13 = L3_12["IpsecVPNPolicy.PolicyType"]
          if L4_13 == "2" then
            L3_12["IpsecVPNPolicy.IKEPolicyName"] = ""
          end
          L4_13 = db
          L4_13 = L4_13.typeAndRangeValidate
          L5_14 = L3_12
          L4_13 = L4_13(L5_14)
          if not L4_13 then
            L4_13 = "ERROR"
            errorFlag = L4_13
            L4_13 = "11113"
            statusCode = L4_13
          end
          L4_13 = errorFlag
          if L4_13 ~= "OK" then
            L4_13 = errorFlag
          elseif L4_13 == 0 then
            L4_13 = "IpsecVPNPolicy"
            exportTable = L4_13
            L4_13 = ezvpn
            L4_13 = L4_13.exportToFile
            L5_14 = exportTable
            L6_15 = L3_12
            L5_14 = L4_13(L5_14, L6_15, L2_11)
            statusCode = L5_14
            errorFlag = L4_13
          end
        else
          L4_13 = db
          L4_13 = L4_13.getAttribute
          L5_14 = "IpsecVPNPolicy"
          L6_15 = "_ROWID_"
          L4_13 = L4_13(L5_14, L6_15, RowId, "IKEPolicyName")
          L5_14 = vipSecure
          L5_14 = L5_14.ipsecVPNPolicyConfig
          L6_15 = L3_12
          L6_15 = L5_14(L6_15, RowId, "edit", A1_10)
          statusCode = L6_15
          errorFlag = L5_14
          L5_14 = db
          L5_14 = L5_14.getRow
          L6_15 = "IpsecIKEPolicy"
          L5_14 = L5_14(L6_15, "IKEPolicyName", L4_13)
          if L5_14 ~= nil then
            L6_15 = {}
            L6_15["IpsecIKEPolicy._ROWID_"] = L5_14["IpsecIKEPolicy._ROWID_"]
            if db.delete("IpsecIKEPolicy", L6_15) then
              errorFlag, statusCode = "OK", "12265"
            else
              errorFlag, statusCode = "ERROR", "12758"
            end
          end
        end
      end
    end
  end
  L3_12 = RowId
  L4_13 = exportFlag
  if L3_12 == L4_13 then
    L4_13 = L2_11
    L3_12 = L2_11.close
    L3_12(L4_13)
  end
  L3_12 = errorFlag
  if L3_12 == "OK" then
    if not A1_10 then
      L3_12 = db
      L3_12 = L3_12.commitTransaction
      L4_13 = true
      L3_12(L4_13)
    end
    L3_12 = errorFlag
    L4_13 = statusCode
    return L3_12, L4_13
  else
    if not A1_10 then
      L3_12 = db
      L3_12 = L3_12.rollback
      L3_12()
    end
    L3_12 = errorFlag
    L4_13 = statusCode
    return L3_12, L4_13
  end
end
L0_0.ipsecPolicyConfig = L1_1
function L0_0(A0_16)
  local L1_17
  L1_17 = ""
  A0_16 = math.floor(A0_16 / 2)
  if A0_16 % 2 ~= 0 then
    L1_17 = L1_17 .. " MD5"
  end
  A0_16 = math.floor(A0_16 / 2)
  if A0_16 % 2 ~= 0 then
    L1_17 = L1_17 .. " SHA1"
  end
  A0_16 = math.floor(A0_16 / 2)
  if A0_16 % 2 ~= 0 then
    L1_17 = L1_17 .. " SHA2-256"
  end
  A0_16 = math.floor(A0_16 / 2)
  if A0_16 % 2 ~= 0 then
    L1_17 = L1_17 .. " SHA2-384"
  end
  A0_16 = math.floor(A0_16 / 2)
  if A0_16 % 2 ~= 0 then
    L1_17 = L1_17 .. " SHA2-512"
  end
  A0_16 = math.floor(A0_16 / 2)
  if A0_16 % 2 ~= 0 then
    L1_17 = L1_17 .. " SHA2-224"
  end
  if L1_17 == "" then
    L1_17 = L1_17 .. "None"
  end
  return L1_17
end
authAlgoToSting = L0_0
function L0_0(A0_18)
  local L1_19
  L1_19 = ""
  A0_18 = math.floor(A0_18 / 2)
  if A0_18 % 2 ~= 0 then
    L1_19 = L1_19 .. " DES"
  end
  A0_18 = math.floor(A0_18 / 2)
  if A0_18 % 2 ~= 0 then
    L1_19 = L1_19 .. " 3DES"
  end
  A0_18 = math.floor(A0_18 / 2)
  if A0_18 % 2 ~= 0 then
    L1_19 = L1_19 .. " AES-128"
  end
  A0_18 = math.floor(A0_18 / 2)
  if A0_18 % 2 ~= 0 then
    L1_19 = L1_19 .. " AES-192"
  end
  A0_18 = math.floor(A0_18 / 2)
  if A0_18 % 2 ~= 0 then
    L1_19 = L1_19 .. " AES-256"
  end
  A0_18 = math.floor(A0_18 / 2)
  if A0_18 % 2 ~= 0 then
    L1_19 = L1_19 .. " AESCCM"
  end
  A0_18 = math.floor(A0_18 / 2)
  if A0_18 % 2 ~= 0 then
    L1_19 = L1_19 .. " AESGCM"
  end
  A0_18 = math.floor(A0_18 / 2)
  if A0_18 % 2 ~= 0 then
    L1_19 = L1_19 .. " TWOFISH-128"
  end
  A0_18 = math.floor(A0_18 / 2)
  if A0_18 % 2 ~= 0 then
    L1_19 = L1_19 .. " TWOFISH-192"
  end
  A0_18 = math.floor(A0_18 / 2)
  if A0_18 % 2 ~= 0 then
    L1_19 = L1_19 .. " TWOFISH-256"
  end
  A0_18 = math.floor(A0_18 / 2)
  if A0_18 % 2 ~= 0 then
    L1_19 = L1_19 .. " BLOWFISH"
  end
  A0_18 = math.floor(A0_18 / 2)
  if A0_18 % 2 ~= 0 then
    L1_19 = L1_19 .. " CAST128"
  end
  if L1_19 == "" then
    L1_19 = L1_19 .. "None"
  end
  return L1_19
end
encrAlgoToSting = L0_0
function L0_0(A0_20)
  local L1_21
  L1_21 = ""
  if A0_20 % 2 ~= 0 then
    L1_21 = L1_21 .. " DES"
  end
  A0_20 = math.floor(A0_20 / 2)
  if A0_20 % 2 ~= 0 then
    L1_21 = L1_21 .. " 3DES"
  end
  A0_20 = math.floor(A0_20 / 2)
  if A0_20 % 2 ~= 0 then
    L1_21 = L1_21 .. " AES-128"
  end
  A0_20 = math.floor(A0_20 / 2)
  if A0_20 % 2 ~= 0 then
    L1_21 = L1_21 .. " AES-192"
  end
  A0_20 = math.floor(A0_20 / 2)
  if A0_20 % 2 ~= 0 then
    L1_21 = L1_21 .. " AES-256"
  end
  A0_20 = math.floor(A0_20 / 2)
  if A0_20 % 2 ~= 0 then
    L1_21 = L1_21 .. " BLOWFISH"
  end
  A0_20 = math.floor(A0_20 / 2)
  if A0_20 % 2 ~= 0 then
    L1_21 = L1_21 .. " CAST128"
  end
  return L1_21
end
ikeEncrAlgoToSting = L0_0
function L0_0(A0_22)
  local L1_23
  L1_23 = ""
  if A0_22 % 2 ~= 0 then
    L1_23 = L1_23 .. " MD5"
  end
  A0_22 = math.floor(A0_22 / 2)
  if A0_22 % 2 ~= 0 then
    L1_23 = L1_23 .. " SHA1"
  end
  A0_22 = math.floor(A0_22 / 2)
  if A0_22 % 2 ~= 0 then
    L1_23 = L1_23 .. " SHA2-256"
  end
  A0_22 = math.floor(A0_22 / 2)
  if A0_22 % 2 ~= 0 then
    L1_23 = L1_23 .. " SHA2-384"
  end
  A0_22 = math.floor(A0_22 / 2)
  if A0_22 % 2 ~= 0 then
    L1_23 = L1_23 .. " SHA2-512"
  end
  if L1_23 == "" then
    L1_23 = L1_23 .. "NONE"
  end
  return L1_23
end
ikeAuthAlgoToSting = L0_0
L0_0 = ipsec
function L1_1(A0_24)
  if ACCESS_LEVEL ~= 0 then
    return "ACCESS_DENIED", "10187"
  end
  if A0_24["IpsecVPNPolicy.L2tpIpsecPolicy"] ~= nil then
    if A0_24["IpsecVPNPolicy.L2tpIpsecPolicy"] == "1" or A0_24["IpsecVPNPolicy.L2tpIpsecPolicy"] == "2" then
      A0_24["IpsecVPNPolicy.TunnelOrTransport"] = "0"
    else
      A0_24["IpsecVPNPolicy.TunnelOrTransport"] = "1"
    end
  elseif A0_24["IpsecVPNPolicy.PolicyType"] == "2" then
    A0_24["IpsecVPNPolicy.TunnelOrTransport"] = "1"
    A0_24["IpsecVPNPolicy.L2tpIpsecPolicy"] = "0"
  end
  if A0_24["IpsecVPNPolicy.L2tpIpsecPolicy"] ~= nil and A0_24["IpsecVPNPolicy.L2tpIpsecPolicy"] == "1" then
    A0_24["IpsecVPNPolicy.RemoteEndPointType"] = "1"
    A0_24["IpsecVPNPolicy.RemoteEndPoint"] = "0.0.0.0"
  end
  if A0_24["IpsecVPNPolicy.Netbios"] == "1" then
    A0_24["IpsecVPNPolicy.RemoteNetworkType"] = "3"
  end
  return ipsec.ipsecPolicyConfig(A0_24)
end
L0_0.l2tpIpsecPolicyConfig = L1_1
