local L0_0
L0_0 = module
L0_0("com.teamf1.core.ipsec.import", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vipsecure_returnCodes")
L0_0 = require
L0_0("teamf1lualib/ipsec_vpn")
L0_0 = require
L0_0("teamf1lualib/ipsec_ike")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.vipsecure.returnCodes")
;({}).policyName = "VPNPolicyName"
;({}).protocol = "IpsecProtocol"
;({}).ipsecMode = "TunnelOrTransport"
;({}).dhcpOverIpsec = "EnableDhcpOverIPSec"
;({}).policyType = "PolicyType"
;({}).localGateway = "LocalGateway"
;({}).remoteEndPointType = "RemoteEndPointType"
;({}).remoteEndPoint = "RemoteEndPoint"
;({}).netbios = "Netbios"
;({}).rollover = "Rollover"
;({}).rolloverGateway = "RolloverGateway"
;({}).keepAlive = "EnableKeepAlive"
;({}).keepAliveSourceAddress = "KeepAliveSourceAddress"
;({}).remotePingIPAddress = "RemotePingIPAddress"
;({}).keepAlivePeriod = "KeepAlivePeriod"
;({}).keepAliveFailureCount = "KeepAliveFailureCount"
;({}).encryptionAlgo = "EncryptionAlgorithm"
;({}).encryptionAlgoKeyLength = "KeyLength"
;({}).authenticationAlgo = "AuthAlgorithm"
;({}).localNetworkType = "LocalNetworkType"
;({}).localStartIP = "LocalStartAddress"
;({}).localEndIP = "LocalEndAddress"
;({}).localSubnetmask = "LocalSubnetMask"
;({}).localPrefixLength = "LocalPrefixLength"
;({}).remoteNetworkType = "RemoteNetworkType"
;({}).remoteStartAddress = "RemoteStartAddress"
;({}).remoteEndAddress = "RemoteEndAddress"
;({}).remoteSubnetmask = "RemoteSubnetMask"
;({}).remotePrefixLength = "RemotePrefixLength"
;({}).ipsecSPIIn = "SPIIn"
;({}).ipsecSPIOut = "SPIOut"
;({}).encryptionKeyIn = "EncryptionKeyIn"
;({}).encryptionKeyOut = "EncryptionKeyOut"
;({}).authKeyIn = "AuthKeyIn"
;({}).authKeyOut = "AuthKeyOut"
;({}).autoPolicyType = "AutoPolicyType"
;({}).saLifeTime = "SALifeTime"
;({}).saLifeTimeType = "SALifeTimeType"
;({}).pfsKeyGroup = "PFSKeyGroup"
;({}).ikePolicyName = "IKEPolicyName"
;({}).rvgStatus = "RVGStatus"
;({}).ipsecStatus = "Status"
;({}).backupPolicyName = "BackupPolicyName"
;({}).failBackTime = "FailbackTime"
;({}).ipsecPolicyType = "TypeofPolicy"
;({}).modeConfigStatus = "modeConfigStatus"
;({}).modeConfigRecordName = "ModeConfigRecordName"
;({}).addressFamily = "AddressFamily"
;({}).autoInitiative = "AutoInitiate"
;({}).policyDescr = "VPNPolicyDescr"
;({}).wan_ipAddress = "ipAddress"
;({}).interfaceName = "LogicalIfName"
;({}).localIdentifierType = "LocalIdentifierType"
;({}).localIdentifier = "LocalIdentifier"
;({}).remoteIdentifierType = "RemoteIdentifierType"
;({}).remoteIdentifier = "RemoteIdentifier"
;({}).DPD = "DPD"
;({}).policyDirection = "Direction"
;({}).extendedAuthType = "XAUTHType"
;({}).policyNodeId = "NodeId"
function getMaxColumn(A0_1, A1_2)
  local L2_3, L3_4, L4_5
  L4_5 = db
  L4_5 = L4_5.execute
  L3_4, L4_5 = string.format("SELECT  MAX(%s) FROM %s ", A1_2, A0_1)
  L2_3 = L4_5
  if L2_3 then
    L4_5 = L2_3.fetch
    L4_5 = L4_5(L2_3, {}, "a")
    for _FORV_8_, _FORV_9_ in pairs(L4_5) do
      return _FORV_9_
    end
  end
end
function CheckDataBase(A0_6, A1_7)
  local L2_8, L3_9, L4_10, L5_11, L6_12
  vpnPolicyRow = L2_8
  if L2_8 then
    flag = L2_8
    for L5_11, L6_12 in next, vpnPolicyRow, nil do
      flag = true
      for _FORV_10_, _FORV_11_ in next, L6_12, nil do
        if _FORV_10_ ~= _UPVALUE0_ .. "." .. _UPVALUE1_.policyNodeId and _FORV_10_ ~= _UPVALUE0_ .. "." .. _UPVALUE1_.policyName and _FORV_10_ ~= _UPVALUE0_ .. "." .. _UPVALUE1_.ikePolicyName and _FORV_10_ ~= _UPVALUE0_ .. "." .. _UPVALUE2_ and _FORV_10_ ~= _UPVALUE0_ .. "." .. _UPVALUE1_.ipsecStatus and vpnPolicyRow[L5_11][_FORV_10_] ~= ipsecVpnConfig[A1_7][_FORV_10_] then
          flag = false
          break
        end
      end
      if flag == true then
        return false
      end
    end
  end
  return L2_8
end
function importPolicy(A0_13)
  local L1_14, L2_15, L3_16, L4_17, L5_18, L6_19, L7_20, L8_21, L9_22, L10_23, L11_24, L12_25, L13_26, L14_27, L15_28, L16_29, L17_30, L18_31, L19_32, L20_33, L21_34, L22_35, L23_36, L24_37, L25_38, L26_39
  L1_14 = "/tmp/"
  L2_15 = "ezvpn.cfg"
  L3_16 = cgilua
  L3_16 = L3_16.cookies
  L3_16 = L3_16.get
  L4_17 = "TeamF1Login"
  L3_16 = L3_16(L4_17)
  L4_17 = "mv"
  L5_18 = " "
  L6_19 = "/tmp/"
  L7_20 = L3_16
  L8_21 = " "
  L4_17 = L4_17 .. L5_18 .. L6_19 .. L7_20 .. L8_21 .. L9_22 .. L10_23
  L5_18 = os
  L5_18 = L5_18.execute
  L6_19 = L4_17
  L5_18 = L5_18(L6_19)
  L6_19 = "/usr/bin/dos2unix"
  L7_20 = " "
  L8_21 = L1_14
  L6_19 = L6_19 .. L7_20 .. L8_21 .. L9_22
  L7_20 = os
  L7_20 = L7_20.execute
  L8_21 = L6_19
  L7_20 = L7_20(L8_21)
  L8_21 = L1_14
  L8_21 = L8_21 .. L9_22
  tempFile = L8_21
  L8_21 = io
  L8_21 = L8_21.open
  L8_21 = L8_21(L9_22, L10_23)
  if L8_21 then
    if L9_22 == nil then
      return L9_22
    end
    L9_22(L10_23)
  end
  L26_39 = L10_23(L11_24)
  if L9_22 then
    L9_22(L10_23)
  else
    return L9_22
  end
  tempVpn = L9_22
  tempIke = L9_22
  if L9_22 then
    vpnCount = L9_22
    ipsecVpnConfig = L9_22
    for L12_25, L13_26 in next, tempVpn, nil do
      L14_27[L12_25] = L15_28
      for L17_30, L18_31 in next, L13_26, nil do
        L19_32 = ipsecVpnConfig
        L20_33 = vpnCount
        L19_32 = L19_32[L20_33]
        L20_33 = _UPVALUE2_
        L21_34 = "."
        L22_35 = L17_30
        L20_33 = L20_33 .. L21_34 .. L22_35
        L19_32[L20_33] = L18_31
      end
      vpnCount = L14_27
    end
  else
    return L9_22
  end
  if L9_22 then
    ikeCount = L9_22
    ipsecIkeConfig = L9_22
    for L12_25, L13_26 in next, tempIke, nil do
      L14_27[L12_25] = L15_28
      for L17_30, L18_31 in next, L13_26, nil do
        L19_32 = ipsecIkeConfig
        L20_33 = ikeCount
        L19_32 = L19_32[L20_33]
        L20_33 = _UPVALUE3_
        L21_34 = "."
        L22_35 = L17_30
        L20_33 = L20_33 .. L21_34 .. L22_35
        L19_32[L20_33] = L18_31
      end
      ikeCount = L14_27
    end
  end
  maxNodeId = L9_22
  maxROWID = L9_22
  if L9_22 ~= L10_23 then
    for L12_25 = 1, L10_23 - 1 do
      L13_26 = ipsecVpnConfig
      L13_26 = L13_26[L12_25]
      L13_26[L14_27] = L15_28
      L13_26 = ipsecVpnConfig
      L13_26 = L13_26[L12_25]
      L13_26[L14_27] = L15_28
    end
  else
    for L12_25 = 1, L10_23 - 1 do
      L13_26 = ipsecVpnConfig
      L13_26 = L13_26[L12_25]
      L13_26[L14_27] = L12_25
      L13_26 = ipsecVpnConfig
      L13_26 = L13_26[L12_25]
      L13_26[L14_27] = L12_25
    end
  end
  if L9_22 then
    maxROWID = L9_22
    if L9_22 ~= L10_23 then
      for L12_25 = 1, L10_23 - 1 do
        L13_26 = ipsecIkeConfig
        L13_26 = L13_26[L12_25]
        L13_26[L14_27] = L15_28
      end
    else
      for L12_25 = 1, L10_23 - 1 do
        L13_26 = ipsecIkeConfig
        L13_26 = L13_26[L12_25]
        L13_26[L14_27] = L12_25
      end
    end
  end
  errorCode = L9_22
  policyExistCount = L9_22
  NumberOfAddedPolicies = L9_22
  for L12_25 = 1, L10_23 - 1 do
    L13_26 = nil
    L17_30 = ipsecVpnConfig
    L17_30 = L17_30[L12_25]
    L18_31 = _UPVALUE2_
    L19_32 = "."
    L20_33 = _UPVALUE4_
    L20_33 = L20_33.policyName
    L18_31 = L18_31 .. L19_32 .. L20_33
    L17_30 = L17_30[L18_31]
    L18_31 = ipsecVpnConfig
    L18_31 = L18_31[L12_25]
    L19_32 = _UPVALUE2_
    L20_33 = "."
    L21_34 = _UPVALUE4_
    L21_34 = L21_34.ipsecMode
    L19_32 = L19_32 .. L20_33 .. L21_34
    L18_31 = L18_31[L19_32]
    L19_32 = ipsecVpnConfig
    L19_32 = L19_32[L12_25]
    L20_33 = _UPVALUE2_
    L21_34 = "."
    L22_35 = _UPVALUE4_
    L22_35 = L22_35.dhcpOverIpsec
    L20_33 = L20_33 .. L21_34 .. L22_35
    L19_32 = L19_32[L20_33]
    L20_33 = _UPVALUE4_
    L20_33 = L20_33.policyName
    L21_34 = " = '"
    L22_35 = ipsecVpnConfig
    L22_35 = L22_35[L12_25]
    L23_36 = _UPVALUE2_
    L24_37 = "."
    L25_38 = _UPVALUE4_
    L25_38 = L25_38.policyName
    L23_36 = L23_36 .. L24_37 .. L25_38
    L22_35 = L22_35[L23_36]
    L23_36 = "'"
    L20_33 = L20_33 .. L21_34 .. L22_35 .. L23_36
    L21_34 = _UPVALUE2_
    L22_35 = "."
    L23_36 = _UPVALUE4_
    L23_36 = L23_36.remoteEndPoint
    L21_34 = L21_34 .. L22_35 .. L23_36
    L22_35 = CheckDataBase
    L23_36 = _UPVALUE4_
    L23_36 = L23_36.remoteEndPoint
    L24_37 = " = '"
    L25_38 = ipsecVpnConfig
    L25_38 = L25_38[L12_25]
    L25_38 = L25_38[L21_34]
    L26_39 = "'"
    L23_36 = L23_36 .. L24_37 .. L25_38 .. L26_39
    L24_37 = L12_25
    L22_35 = L22_35(L23_36, L24_37)
    CheckDB = L22_35
    L22_35 = CheckDB
    if L22_35 then
      L22_35 = _UPVALUE6_
      if L18_31 == L22_35 then
        L22_35 = _UPVALUE7_
        if L19_32 == L22_35 then
          L22_35 = _UPVALUE8_
          L22_35 = L22_35.getDuplicatePolicies
          L23_36 = ipsecVpnConfig
          L23_36 = L23_36[L12_25]
          L24_37 = 1
          L22_35 = L22_35(L23_36, L24_37)
          L23_36 = L22_35[1]
          if L23_36 then
            L23_36 = ipsecVpnConfig
            L23_36 = L23_36[L12_25]
            L24_37 = _UPVALUE2_
            L25_38 = "."
            L26_39 = _UPVALUE4_
            L26_39 = L26_39.ipsecStatus
            L24_37 = L24_37 .. L25_38 .. L26_39
            L25_38 = _UPVALUE7_
            L23_36[L24_37] = L25_38
          end
        end
      else
        L22_35 = _UPVALUE6_
        if L18_31 == L22_35 then
          L22_35 = _UPVALUE6_
          if L19_32 == L22_35 then
            L22_35 = _UPVALUE2_
            L23_36 = "."
            L24_37 = _UPVALUE4_
            L24_37 = L24_37.remoteEndPoint
            L22_35 = L22_35 .. L23_36 .. L24_37
            L23_36 = _UPVALUE4_
            L23_36 = L23_36.remoteEndPoint
            L24_37 = " = '"
            L25_38 = ipsecVpnConfig
            L25_38 = L25_38[L12_25]
            L25_38 = L25_38[L22_35]
            L26_39 = "'"
            L23_36 = L23_36 .. L24_37 .. L25_38 .. L26_39
            L24_37 = db
            L24_37 = L24_37.getRowsWhere
            L25_38 = _UPVALUE2_
            L26_39 = L23_36
            L24_37 = L24_37(L25_38, L26_39)
            L25_38 = L24_37[1]
            if L25_38 then
              L25_38 = ipsecStatus
              L26_39 = " = 1 and "
              L23_36 = L25_38 .. L26_39 .. _UPVALUE4_.remoteNetworkType .. " = 0 and " .. _UPVALUE4_.localNetworkType .. " = 0"
              L25_38 = db
              L25_38 = L25_38.getRowsWhere
              L26_39 = _UPVALUE2_
              L25_38 = L25_38(L26_39, L23_36)
              L13_26 = L25_38
              L25_38 = L13_26[1]
              if L25_38 then
                L25_38 = ipsecVpnConfig
                L25_38 = L25_38[L12_25]
                L26_39 = _UPVALUE2_
                L26_39 = L26_39 .. "." .. _UPVALUE4_.ipsecStatus
                L25_38[L26_39] = _UPVALUE7_
              end
            end
          end
        else
          L22_35 = _UPVALUE7_
          if L18_31 == L22_35 then
            L22_35 = _UPVALUE2_
            L23_36 = "."
            L24_37 = _UPVALUE4_
            L24_37 = L24_37.remoteEndPoint
            L22_35 = L22_35 .. L23_36 .. L24_37
            L23_36 = _UPVALUE4_
            L23_36 = L23_36.remoteEndPoint
            L24_37 = " = '"
            L25_38 = ipsecVpnConfig
            L25_38 = L25_38[L12_25]
            L25_38 = L25_38[L22_35]
            L26_39 = "'"
            L23_36 = L23_36 .. L24_37 .. L25_38 .. L26_39
            L24_37 = db
            L24_37 = L24_37.getRowsWhere
            L25_38 = _UPVALUE2_
            L26_39 = L23_36
            L24_37 = L24_37(L25_38, L26_39)
            L25_38 = L24_37[1]
            if L25_38 then
              L25_38 = ipsecVpnConfig
              L25_38 = L25_38[L12_25]
              L26_39 = _UPVALUE2_
              L26_39 = L26_39 .. "." .. _UPVALUE4_.ipsecStatus
              L25_38[L26_39] = _UPVALUE7_
            end
          end
        end
      end
      L22_35 = db
      L22_35 = L22_35.getRowsWhere
      L23_36 = _UPVALUE2_
      L24_37 = _UPVALUE4_
      L24_37 = L24_37.policyName
      L25_38 = " = '"
      L26_39 = L17_30
      L24_37 = L24_37 .. L25_38 .. L26_39 .. "'"
      L22_35 = L22_35(L23_36, L24_37)
      L23_36 = L22_35[1]
      if L23_36 then
        L23_36 = _UPVALUE2_
        L24_37 = "."
        L25_38 = _UPVALUE4_
        L25_38 = L25_38.policyName
        L23_36 = L23_36 .. L24_37 .. L25_38
        L24_37 = _UPVALUE2_
        L25_38 = "."
        L26_39 = _UPVALUE4_
        L26_39 = L26_39.ikePolicyName
        L24_37 = L24_37 .. L25_38 .. L26_39
        L25_38 = _UPVALUE3_
        L26_39 = "."
        L25_38 = L25_38 .. L26_39 .. _UPVALUE4_.ikePolicyName
        L26_39 = ipsecVpnConfig
        L26_39 = L26_39[L12_25]
        L26_39 = L26_39[_UPVALUE2_ .. "." .. _UPVALUE4_.policyNodeId]
        ipsecVpnConfig[L12_25][L23_36] = ipsecVpnConfig[L12_25][L23_36] .. "_" .. L26_39
        ipsecVpnConfig[L12_25][L24_37] = ipsecVpnConfig[L12_25][L24_37] .. "_" .. L26_39
        if tempIke then
          ipsecIkeConfig[L12_25][L25_38] = ipsecIkeConfig[L12_25][L25_38] .. "_" .. L26_39
        end
      end
      L23_36 = ipsecVpnConfig
      L23_36 = L23_36[L12_25]
      L24_37 = _UPVALUE2_
      L25_38 = "."
      L26_39 = _UPVALUE4_
      L26_39 = L26_39.policyType
      L24_37 = L24_37 .. L25_38 .. L26_39
      L23_36 = L23_36[L24_37]
      if L23_36 == "1" then
        L23_36 = db
        L23_36 = L23_36.insert
        L24_37 = _UPVALUE3_
        L25_38 = ipsecIkeConfig
        L25_38 = L25_38[L12_25]
        L23_36 = L23_36(L24_37, L25_38)
      else
      end
      L23_36 = db
      L23_36 = L23_36.insert
      L24_37 = _UPVALUE2_
      L25_38 = ipsecVpnConfig
      L25_38 = L25_38[L12_25]
      L23_36 = L23_36(L24_37, L25_38)
      if L15_28 and L16_29 then
        L23_36 = "OK"
        errorFlag = L23_36
      else
        L23_36 = "ERROR"
        errorFlag = L23_36
      end
      L23_36 = errorFlag
      if L23_36 == "OK" then
        L23_36 = db
        L23_36 = L23_36.commitTransaction
        L24_37 = true
        L23_36(L24_37)
        L23_36 = db
        L23_36 = L23_36.save
        L23_36()
        L23_36 = NumberOfAddedPolicies
        L23_36 = L23_36 + 1
        NumberOfAddedPolicies = L23_36
      else
        L23_36 = db
        L23_36 = L23_36.rollback
        L23_36()
        L23_36 = "ERROR"
        errorCode = L23_36
        L23_36 = errorString
        L24_37 = L17_30
        L25_38 = ": Failed To Add </br> "
        L23_36 = L23_36 .. L24_37 .. L25_38
        errorString = L23_36
      end
    else
      L22_35 = policyExistCount
      L22_35 = L22_35 + 1
      policyExistCount = L22_35
      L22_35 = "ERROR"
      errorCode = L22_35
    end
  end
  if L9_22 == "OK" then
    return L9_22
  elseif L9_22 == L10_23 then
    return L9_22
  else
    return L9_22
  end
end
