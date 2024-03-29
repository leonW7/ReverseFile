local L0_0
L0_0 = module
L0_0("com.teamf1.bl.ipsec.policy", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/ipsec_vpn")
L0_0 = require
L0_0("teamf1lualib/ipsec_ike")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/vipsecure_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
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
;({}).policyName1 = "IKEPolicyName"
;({}).policyDirection = "Direction"
;({}).policyVersion = "IKEVersion"
;({}).l2tpIpsecPolicy = "L2tpIpsecPolicy"
;({}).exchangeMode = "ExchangeMode"
;({}).localIdentifierType = "LocalIdentifierType"
;({}).localIdentifier = "LocalIdentifier"
;({}).remoteIdentifierType = "RemoteIdentifierType"
;({}).remoteIdentifier = "RemoteIdentifier"
;({}).encryptionAlgo = "EncryptionAlgorithm"
;({}).encryptionAlgoKeyLength = "KeyLength"
;({}).authenticationAlgo = "AuthAlgorithm"
;({}).authenticationType = "AuthType"
;({}).presharedKey = "Presharedkey"
;({}).dhGroup = "DHGroup"
;({}).saLifeTime = "SALifeTime"
;({}).DPD = "DPD"
;({}).DPDDetectionPeriod = "DPDDetectionPeriod"
;({}).DPDFailureCount = "DPDFailureCount"
;({}).extendedAuthentication = "XAUTHType"
;({}).extendedAuthType = "XAUTHType"
;({}).XAUTHProfile = "XAUTHProfile"
;({}).userName = "UserName"
;({}).password = "Password"
;({}).natTraversal = "NatTraversal"
;({}).natKeepAliveTime = "NatKeepAliveTime"
;({}).addressFamily = "AddressFamily"
function policiesSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26, L26_27
  L1_2 = {}
  L2_3 = {}
  L3_4 = nil
  L4_5 = {}
  L5_6 = {}
  L6_7 = _UPVALUE0_
  L6_7 = L6_7.ikePolicyGet
  L8_9 = L6_7()
  L1_2 = L8_9
  L3_4 = L7_8
  L0_1 = L6_7
  L4_5["ikePolicy.returnCode"] = L0_1
  L4_5["ikePolicy.cookie"] = L3_4
  L6_7 = _UPVALUE1_
  L6_7 = L6_7.vpnPolicyGet
  L8_9 = L6_7()
  L2_3 = L8_9
  L3_4 = L7_8
  L0_1 = L6_7
  L5_6["vpnPolicy.returnCode"] = L0_1
  L5_6["vpnPolicy.cookie"] = L3_4
  L6_7 = _UPVALUE2_
  L6_7 = L6_7.SUCCESS
  if L0_1 ~= L6_7 then
    return L0_1
  end
  L6_7 = _UPVALUE3_
  L7_8 = "."
  L8_9 = _UPVALUE4_
  L8_9 = L8_9.policyName
  L6_7 = L6_7 .. L7_8 .. L8_9
  L6_7 = L2_3[L6_7]
  L5_6["vpnPolicy.policyName"] = L6_7
  L6_7 = _UPVALUE5_
  L7_8 = "."
  L8_9 = _UPVALUE4_
  L8_9 = L8_9.policyDirection
  L6_7 = L6_7 .. L7_8 .. L8_9
  L6_7 = L1_2[L6_7]
  L7_8 = _UPVALUE6_
  L8_9 = tonumber
  L9_10 = L6_7
  L8_9 = L8_9(L9_10)
  L8_9 = L8_9 + 1
  L7_8 = L7_8[L8_9]
  L4_5["ikePolicy.policyDirection"] = L7_8
  L7_8 = _UPVALUE5_
  L8_9 = "."
  L9_10 = _UPVALUE4_
  L9_10 = L9_10.exchangeMode
  L7_8 = L7_8 .. L8_9 .. L9_10
  L7_8 = L1_2[L7_8]
  L8_9 = _UPVALUE7_
  L9_10 = tonumber
  L10_11 = L7_8
  L9_10 = L9_10(L10_11)
  L9_10 = L9_10 + 1
  L8_9 = L8_9[L9_10]
  L4_5["ikePolicy.exchangeMode"] = L8_9
  L8_9 = _UPVALUE5_
  L9_10 = "."
  L10_11 = _UPVALUE4_
  L10_11 = L10_11.policyVersion
  L8_9 = L8_9 .. L9_10 .. L10_11
  L8_9 = L1_2[L8_9]
  L9_10 = _UPVALUE8_
  L10_11 = tonumber
  L11_12 = L8_9
  L10_11 = L10_11(L11_12)
  L9_10 = L9_10[L10_11]
  L4_5["ikePolicy.policyVersion"] = L9_10
  L9_10 = _UPVALUE5_
  L10_11 = "."
  L11_12 = _UPVALUE4_
  L11_12 = L11_12.localIdentifierType
  L9_10 = L9_10 .. L10_11 .. L11_12
  L9_10 = L1_2[L9_10]
  L10_11 = _UPVALUE9_
  L11_12 = tonumber
  L12_13 = L9_10
  L11_12 = L11_12(L12_13)
  L11_12 = L11_12 + 1
  L10_11 = L10_11[L11_12]
  L4_5["ikePolicy.localIdentifierType"] = L10_11
  L10_11 = _UPVALUE5_
  L11_12 = "."
  L12_13 = _UPVALUE4_
  L12_13 = L12_13.localIdentifier
  L10_11 = L10_11 .. L11_12 .. L12_13
  L10_11 = L1_2[L10_11]
  L4_5["ikePolicy.localIdentifier"] = L10_11
  L10_11 = _UPVALUE5_
  L11_12 = "."
  L12_13 = _UPVALUE4_
  L12_13 = L12_13.remoteIdentifierType
  L10_11 = L10_11 .. L11_12 .. L12_13
  L10_11 = L1_2[L10_11]
  L11_12 = _UPVALUE10_
  L12_13 = tonumber
  L13_14 = L10_11
  L12_13 = L12_13(L13_14)
  L12_13 = L12_13 + 1
  L11_12 = L11_12[L12_13]
  L4_5["ikePolicy.remoteIdentifierType"] = L11_12
  L11_12 = _UPVALUE5_
  L12_13 = "."
  L13_14 = _UPVALUE4_
  L13_14 = L13_14.remoteIdentifier
  L11_12 = L11_12 .. L12_13 .. L13_14
  L11_12 = L1_2[L11_12]
  L4_5["ikePolicy.remoteIdentifier"] = L11_12
  L11_12 = _UPVALUE5_
  L12_13 = "."
  L13_14 = _UPVALUE4_
  L13_14 = L13_14.encryptionAlgo
  L11_12 = L11_12 .. L12_13 .. L13_14
  L11_12 = L1_2[L11_12]
  L12_13 = ikeEncrAlgoToString
  L13_14 = L11_12
  L12_13 = L12_13(L13_14)
  L4_5["ikePolicy.encryptionAlgo"] = L12_13
  L12_13 = _UPVALUE5_
  L13_14 = "."
  L14_15 = _UPVALUE4_
  L14_15 = L14_15.encryptionAlgoKeyLength
  L12_13 = L12_13 .. L13_14 .. L14_15
  L12_13 = L1_2[L12_13]
  L4_5["ikePolicy.encryptionAlgoKeyLength"] = L12_13
  L12_13 = _UPVALUE5_
  L13_14 = "."
  L14_15 = _UPVALUE4_
  L14_15 = L14_15.authenticationAlgo
  L12_13 = L12_13 .. L13_14 .. L14_15
  L12_13 = L1_2[L12_13]
  L13_14 = ikeAuthAlgoToString
  L14_15 = L12_13
  L13_14 = L13_14(L14_15)
  L4_5["ikePolicy.authenticationAlgo"] = L13_14
  L13_14 = _UPVALUE5_
  L14_15 = "."
  L15_16 = _UPVALUE4_
  L15_16 = L15_16.authenticationType
  L13_14 = L13_14 .. L14_15 .. L15_16
  L13_14 = L1_2[L13_14]
  L14_15 = _UPVALUE11_
  L15_16 = tonumber
  L16_17 = L13_14
  L15_16 = L15_16(L16_17)
  L15_16 = L15_16 + 1
  L14_15 = L14_15[L15_16]
  L4_5["ikePolicy.authenticationType"] = L14_15
  L14_15 = _UPVALUE5_
  L15_16 = "."
  L16_17 = _UPVALUE4_
  L16_17 = L16_17.presharedKey
  L14_15 = L14_15 .. L15_16 .. L16_17
  L14_15 = L1_2[L14_15]
  L4_5["ikePolicy.presharedKey"] = L14_15
  L14_15 = _UPVALUE5_
  L15_16 = "."
  L16_17 = _UPVALUE4_
  L16_17 = L16_17.dhGroup
  L14_15 = L14_15 .. L15_16 .. L16_17
  L14_15 = L1_2[L14_15]
  L4_5["ikePolicy.dhGroup"] = L14_15
  L14_15 = _UPVALUE5_
  L15_16 = "."
  L16_17 = _UPVALUE4_
  L16_17 = L16_17.saLifeTime
  L14_15 = L14_15 .. L15_16 .. L16_17
  L14_15 = L1_2[L14_15]
  L4_5["ikePolicy.saLifeTime"] = L14_15
  L14_15 = _UPVALUE5_
  L15_16 = "."
  L16_17 = _UPVALUE4_
  L16_17 = L16_17.DPD
  L14_15 = L14_15 .. L15_16 .. L16_17
  L14_15 = L1_2[L14_15]
  L4_5["ikePolicy.DPD"] = L14_15
  L14_15 = _UPVALUE5_
  L15_16 = "."
  L16_17 = _UPVALUE4_
  L16_17 = L16_17.DPDDetectionPeriod
  L14_15 = L14_15 .. L15_16 .. L16_17
  L14_15 = L1_2[L14_15]
  L4_5["ikePolicy.DPDDetectionPeriod"] = L14_15
  L14_15 = _UPVALUE5_
  L15_16 = "."
  L16_17 = _UPVALUE4_
  L16_17 = L16_17.DPDFailureCount
  L14_15 = L14_15 .. L15_16 .. L16_17
  L14_15 = L1_2[L14_15]
  L4_5["ikePolicy.DPDFailureCount"] = L14_15
  L14_15 = _UPVALUE5_
  L15_16 = "."
  L16_17 = _UPVALUE4_
  L16_17 = L16_17.extendedAuthentication
  L14_15 = L14_15 .. L15_16 .. L16_17
  L14_15 = L1_2[L14_15]
  L15_16 = _UPVALUE12_
  L16_17 = tonumber
  L17_18 = L14_15
  L16_17 = L16_17(L17_18)
  L16_17 = L16_17 + 1
  L15_16 = L15_16[L16_17]
  L4_5["ikePolicy.extendedAuthentication"] = L15_16
  L15_16 = _UPVALUE5_
  L16_17 = "."
  L17_18 = _UPVALUE4_
  L17_18 = L17_18.extendedAuthType
  L15_16 = L15_16 .. L16_17 .. L17_18
  L15_16 = L1_2[L15_16]
  L16_17 = _UPVALUE13_
  L17_18 = tonumber
  L18_19 = L15_16
  L17_18 = L17_18(L18_19)
  L17_18 = L17_18 - 1
  L16_17 = L16_17[L17_18]
  L4_5["ikePolicy.extendedAuthType"] = L16_17
  L16_17 = _UPVALUE5_
  L17_18 = "."
  L18_19 = _UPVALUE4_
  L18_19 = L18_19.XAUTHProfile
  L16_17 = L16_17 .. L17_18 .. L18_19
  L16_17 = L1_2[L16_17]
  L4_5["ikePolicy.XAUTHProfile"] = L16_17
  L16_17 = _UPVALUE5_
  L17_18 = "."
  L18_19 = _UPVALUE4_
  L18_19 = L18_19.userName
  L16_17 = L16_17 .. L17_18 .. L18_19
  L16_17 = L1_2[L16_17]
  L4_5["ikePolicy.userName"] = L16_17
  L16_17 = _UPVALUE5_
  L17_18 = "."
  L18_19 = _UPVALUE4_
  L18_19 = L18_19.password
  L16_17 = L16_17 .. L17_18 .. L18_19
  L16_17 = L1_2[L16_17]
  L4_5["ikePolicy.password"] = L16_17
  L16_17 = _UPVALUE5_
  L17_18 = "."
  L18_19 = _UPVALUE4_
  L18_19 = L18_19.natTraversal
  L16_17 = L16_17 .. L17_18 .. L18_19
  L16_17 = L1_2[L16_17]
  L4_5["ikePolicy.natTraversal"] = L16_17
  L16_17 = _UPVALUE5_
  L17_18 = "."
  L18_19 = _UPVALUE4_
  L18_19 = L18_19.natKeepAliveTime
  L16_17 = L16_17 .. L17_18 .. L18_19
  L16_17 = L1_2[L16_17]
  L4_5["ikePolicy.natKeepAliveTime"] = L16_17
  L16_17 = _UPVALUE5_
  L17_18 = "."
  L18_19 = _UPVALUE4_
  L18_19 = L18_19.addressFamily
  L16_17 = L16_17 .. L17_18 .. L18_19
  L16_17 = L1_2[L16_17]
  if L16_17 == "IPv4" then
    L16_17 = 2
  else
    L16_17 = 10
  end
  L4_5["ikePolicy.addressFamily"] = L16_17
  L17_18 = _UPVALUE3_
  L18_19 = "."
  L19_20 = _UPVALUE4_
  L19_20 = L19_20.protocol
  L17_18 = L17_18 .. L18_19 .. L19_20
  L17_18 = L2_3[L17_18]
  L18_19 = _UPVALUE14_
  L19_20 = tonumber
  L20_21 = L17_18
  L19_20 = L19_20(L20_21)
  L19_20 = L19_20 + 1
  L18_19 = L18_19[L19_20]
  L5_6["vpnPolicy.protocol"] = L18_19
  L18_19 = _UPVALUE3_
  L19_20 = "."
  L20_21 = _UPVALUE4_
  L20_21 = L20_21.ipsecMode
  L18_19 = L18_19 .. L19_20 .. L20_21
  L18_19 = L2_3[L18_19]
  L5_6["vpnPolicy.ipsecMode"] = L18_19
  L19_20 = _UPVALUE3_
  L20_21 = "."
  L21_22 = _UPVALUE4_
  L21_22 = L21_22.dhcpOverIpsec
  L19_20 = L19_20 .. L20_21 .. L21_22
  L19_20 = L2_3[L19_20]
  L5_6["vpnPolicy.dhcpOverIpsec"] = L19_20
  L19_20 = _UPVALUE3_
  L20_21 = "."
  L21_22 = _UPVALUE4_
  L21_22 = L21_22.policyType
  L19_20 = L19_20 .. L20_21 .. L21_22
  L19_20 = L2_3[L19_20]
  L20_21 = _UPVALUE3_
  L21_22 = "."
  L22_23 = _UPVALUE4_
  L22_23 = L22_23.localGateway
  L20_21 = L20_21 .. L21_22 .. L22_23
  L20_21 = L2_3[L20_21]
  L21_22 = _UPVALUE15_
  L22_23 = tonumber
  L23_24 = L20_21
  L22_23 = L22_23(L23_24)
  L22_23 = L22_23 + 1
  L21_22 = L21_22[L22_23]
  L5_6["vpnPolicy.localGateway"] = L21_22
  L21_22 = _UPVALUE3_
  L22_23 = "."
  L23_24 = _UPVALUE4_
  L23_24 = L23_24.remoteEndPointType
  L21_22 = L21_22 .. L22_23 .. L23_24
  L21_22 = L2_3[L21_22]
  L22_23 = _UPVALUE16_
  L23_24 = tonumber
  L24_25 = L21_22
  L23_24 = L23_24(L24_25)
  L23_24 = L23_24 + 1
  L22_23 = L22_23[L23_24]
  L5_6["vpnPolicy.remoteEndPointType"] = L22_23
  L22_23 = _UPVALUE3_
  L23_24 = "."
  L24_25 = _UPVALUE4_
  L24_25 = L24_25.remoteEndPoint
  L22_23 = L22_23 .. L23_24 .. L24_25
  L22_23 = L2_3[L22_23]
  L5_6["vpnPolicy.remoteEndPoint"] = L22_23
  L22_23 = _UPVALUE3_
  L23_24 = "."
  L24_25 = _UPVALUE4_
  L24_25 = L24_25.netbios
  L22_23 = L22_23 .. L23_24 .. L24_25
  L22_23 = L2_3[L22_23]
  L5_6["vpnPolicy.netbios"] = L22_23
  L22_23 = _UPVALUE3_
  L23_24 = "."
  L24_25 = _UPVALUE4_
  L24_25 = L24_25.rollover
  L22_23 = L22_23 .. L23_24 .. L24_25
  L22_23 = L2_3[L22_23]
  L5_6["vpnPolicy.rollover"] = L22_23
  L22_23 = _UPVALUE3_
  L23_24 = "."
  L24_25 = _UPVALUE4_
  L24_25 = L24_25.rolloverGateway
  L22_23 = L22_23 .. L23_24 .. L24_25
  L22_23 = L2_3[L22_23]
  L5_6["vpnPolicy.rolloverGateway"] = L22_23
  L22_23 = _UPVALUE3_
  L23_24 = "."
  L24_25 = _UPVALUE4_
  L24_25 = L24_25.keepAlive
  L22_23 = L22_23 .. L23_24 .. L24_25
  L22_23 = L2_3[L22_23]
  L5_6["vpnPolicy.keepAlive"] = L22_23
  L22_23 = _UPVALUE3_
  L23_24 = "."
  L24_25 = _UPVALUE4_
  L24_25 = L24_25.keepAliveSourceAddress
  L22_23 = L22_23 .. L23_24 .. L24_25
  L22_23 = L2_3[L22_23]
  L5_6["vpnPolicy.keepAliveSourceAddress"] = L22_23
  L22_23 = _UPVALUE3_
  L23_24 = "."
  L24_25 = _UPVALUE4_
  L24_25 = L24_25.remotePingIPAddress
  L22_23 = L22_23 .. L23_24 .. L24_25
  L22_23 = L2_3[L22_23]
  L5_6["vpnPolicy.remotePingIPAddress"] = L22_23
  L22_23 = _UPVALUE3_
  L23_24 = "."
  L24_25 = _UPVALUE4_
  L24_25 = L24_25.keepAlivePeriod
  L22_23 = L22_23 .. L23_24 .. L24_25
  L22_23 = L2_3[L22_23]
  L5_6["vpnPolicy.keepAlivePeriod"] = L22_23
  L22_23 = _UPVALUE3_
  L23_24 = "."
  L24_25 = _UPVALUE4_
  L24_25 = L24_25.keepAliveFailureCount
  L22_23 = L22_23 .. L23_24 .. L24_25
  L22_23 = L2_3[L22_23]
  L5_6["vpnPolicy.keepAliveFailureCount"] = L22_23
  L22_23 = _UPVALUE3_
  L23_24 = "."
  L24_25 = _UPVALUE4_
  L24_25 = L24_25.encryptionAlgo
  L22_23 = L22_23 .. L23_24 .. L24_25
  L22_23 = L2_3[L22_23]
  L23_24 = encrAlgoToString
  L24_25 = L22_23
  L23_24 = L23_24(L24_25)
  L5_6["vpnPolicy.encryptionAlgo"] = L23_24
  L23_24 = _UPVALUE3_
  L24_25 = "."
  L25_26 = _UPVALUE4_
  L25_26 = L25_26.encryptionAlgoKeyLength
  L23_24 = L23_24 .. L24_25 .. L25_26
  L23_24 = L2_3[L23_24]
  L5_6["vpnPolicy.encryptionAlgoKeyLength"] = L23_24
  L23_24 = _UPVALUE3_
  L24_25 = "."
  L25_26 = _UPVALUE4_
  L25_26 = L25_26.authenticationAlgo
  L23_24 = L23_24 .. L24_25 .. L25_26
  L23_24 = L2_3[L23_24]
  L24_25 = authAlgoToString
  L25_26 = L23_24
  L24_25 = L24_25(L25_26)
  L5_6["vpnPolicy.authenticationAlgo"] = L24_25
  L24_25 = _UPVALUE3_
  L25_26 = "."
  L26_27 = _UPVALUE4_
  L26_27 = L26_27.localNetworkType
  L24_25 = L24_25 .. L25_26 .. L26_27
  L24_25 = L2_3[L24_25]
  L25_26 = _UPVALUE17_
  L26_27 = tonumber
  L26_27 = L26_27(L24_25)
  L26_27 = L26_27 + 1
  L25_26 = L25_26[L26_27]
  L5_6["vpnPolicy.localNetworkType"] = L25_26
  L25_26 = _UPVALUE3_
  L26_27 = "."
  L25_26 = L25_26 .. L26_27 .. _UPVALUE4_.localStartIP
  L25_26 = L2_3[L25_26]
  L5_6["vpnPolicy.localStartIP"] = L25_26
  L25_26 = _UPVALUE3_
  L26_27 = "."
  L25_26 = L25_26 .. L26_27 .. _UPVALUE4_.localEndIP
  L25_26 = L2_3[L25_26]
  L5_6["vpnPolicy.localEndIP"] = L25_26
  L25_26 = _UPVALUE3_
  L26_27 = "."
  L25_26 = L25_26 .. L26_27 .. _UPVALUE4_.localSubnetmask
  L25_26 = L2_3[L25_26]
  L5_6["vpnPolicy.localSubnetmask"] = L25_26
  L25_26 = _UPVALUE3_
  L26_27 = "."
  L25_26 = L25_26 .. L26_27 .. _UPVALUE4_.localPrefixLength
  L25_26 = L2_3[L25_26]
  L5_6["vpnPolicy.localPrefixLength"] = L25_26
  L25_26 = _UPVALUE3_
  L26_27 = "."
  L25_26 = L25_26 .. L26_27 .. _UPVALUE4_.remoteNetworkType
  L25_26 = L2_3[L25_26]
  L26_27 = _UPVALUE17_
  L26_27 = L26_27[tonumber(L25_26) + 1]
  L5_6["vpnPolicy.remoteNetworkType"] = L26_27
  L26_27 = _UPVALUE3_
  L26_27 = L26_27 .. "." .. _UPVALUE4_.remoteStartAddress
  L26_27 = L2_3[L26_27]
  L5_6["vpnPolicy.remoteStartAddress"] = L26_27
  L26_27 = _UPVALUE3_
  L26_27 = L26_27 .. "." .. _UPVALUE4_.remoteEndAddress
  L26_27 = L2_3[L26_27]
  L5_6["vpnPolicy.remoteEndAddress"] = L26_27
  L26_27 = _UPVALUE3_
  L26_27 = L26_27 .. "." .. _UPVALUE4_.remoteSubnetmask
  L26_27 = L2_3[L26_27]
  L5_6["vpnPolicy.remoteSubnetmask"] = L26_27
  L26_27 = _UPVALUE3_
  L26_27 = L26_27 .. "." .. _UPVALUE4_.remotePrefixLength
  L26_27 = L2_3[L26_27]
  L5_6["vpnPolicy.remotePrefixLength"] = L26_27
  L26_27 = _UPVALUE3_
  L26_27 = L26_27 .. "." .. _UPVALUE4_.ipsecSPIIn
  L26_27 = L2_3[L26_27]
  L5_6["vpnPolicy.ipsecSPIIn"] = L26_27
  L26_27 = _UPVALUE3_
  L26_27 = L26_27 .. "." .. _UPVALUE4_.ipsecSPIOut
  L26_27 = L2_3[L26_27]
  L5_6["vpnPolicy.ipsecSPIOut"] = L26_27
  L26_27 = _UPVALUE3_
  L26_27 = L26_27 .. "." .. _UPVALUE4_.encryptionKeyIn
  L26_27 = L2_3[L26_27]
  L5_6["vpnPolicy.encryptionKeyIn"] = L26_27
  L26_27 = _UPVALUE3_
  L26_27 = L26_27 .. "." .. _UPVALUE4_.encryptionKeyOut
  L26_27 = L2_3[L26_27]
  L5_6["vpnPolicy.encryptionKeyOut"] = L26_27
  L26_27 = _UPVALUE3_
  L26_27 = L26_27 .. "." .. _UPVALUE4_.authKeyIn
  L26_27 = L2_3[L26_27]
  L5_6["vpnPolicy.authKeyIn"] = L26_27
  L26_27 = _UPVALUE3_
  L26_27 = L26_27 .. "." .. _UPVALUE4_.authKeyOut
  L26_27 = L2_3[L26_27]
  L5_6["vpnPolicy.authKeyOut"] = L26_27
  L26_27 = _UPVALUE3_
  L26_27 = L26_27 .. "." .. _UPVALUE4_.autoPolicyType
  L26_27 = L2_3[L26_27]
  L5_6["vpnPolicy.autoPolicyType"] = L26_27
  L26_27 = _UPVALUE3_
  L26_27 = L26_27 .. "." .. _UPVALUE4_.saLifeTime
  L26_27 = L2_3[L26_27]
  L5_6["vpnPolicy.saLifeTime"] = L26_27
  L26_27 = _UPVALUE3_
  L26_27 = L26_27 .. "." .. _UPVALUE4_.saLifeTimeType
  L26_27 = L2_3[L26_27]
  L5_6["vpnPolicy.saLifeTimeType"] = _UPVALUE18_[tonumber(L26_27) + 1]
  L5_6["vpnPolicy.pfsKeyGroup"] = L2_3[_UPVALUE3_ .. "." .. _UPVALUE4_.pfsKeyGroup]
  L5_6["vpnPolicy.backupPolicyName"] = L2_3[_UPVALUE3_ .. "." .. _UPVALUE4_.backupPolicyName]
  L5_6["vpnPolicy.failBackTime"] = L2_3[_UPVALUE3_ .. "." .. _UPVALUE4_.failBackTime]
  L5_6["vpnPolicy.ipsecPolicyType"] = L2_3[_UPVALUE3_ .. "." .. _UPVALUE4_.ipsecPolicyType]
  L5_6["vpnPolicy.modeConfigStatus"] = L2_3[_UPVALUE3_ .. "." .. _UPVALUE4_.modeConfigStatus]
  L5_6["vpnPolicy.policyDescr"] = L2_3[_UPVALUE3_ .. "." .. _UPVALUE4_.policyDescr]
  return L4_5, L5_6
end
function policiesSectionGetNext(A0_28)
  local L1_29, L2_30, L3_31, L4_32, L5_33, L6_34, L7_35, L8_36, L9_37, L10_38, L11_39, L12_40, L13_41, L14_42, L15_43, L16_44, L17_45, L18_46, L19_47, L20_48, L21_49, L22_50, L23_51, L24_52, L25_53, L26_54, L27_55, L28_56
  L1_29 = A0_28["policies.cookie"]
  if L1_29 == nil then
    L2_30 = util
    L2_30 = L2_30.appendDebugOut
    L3_31 = "GetNext : Invalid Cookie"
    L2_30(L3_31)
    L2_30 = _UPVALUE0_
    L2_30 = L2_30.BAD_PARAMETER
    return L2_30
  end
  L2_30, L3_31 = nil, nil
  L4_32 = {}
  L5_33 = {}
  L6_34 = {}
  L7_35 = {}
  L8_36 = _UPVALUE1_
  L8_36 = L8_36.ikePolicyGetNext
  L9_37 = L1_29
  L10_38 = L8_36(L9_37)
  L4_32 = L10_38
  L3_31 = L9_37
  L2_30 = L8_36
  L6_34["ikePolicy.returnCode"] = L2_30
  L6_34["ikePolicy.cookie"] = L3_31
  L8_36 = _UPVALUE2_
  L8_36 = L8_36.vpnPolicyGetNext
  L9_37 = L1_29
  L10_38 = L8_36(L9_37)
  L5_33 = L10_38
  L3_31 = L9_37
  L2_30 = L8_36
  L7_35["vpnPolicy.returnCode"] = L2_30
  L7_35["vpnPolicy.cookie"] = L3_31
  L8_36 = _UPVALUE0_
  L8_36 = L8_36.SUCCESS
  if L2_30 ~= L8_36 then
    return L2_30
  end
  L8_36 = _UPVALUE3_
  L9_37 = "."
  L10_38 = _UPVALUE4_
  L10_38 = L10_38.policyName
  L8_36 = L8_36 .. L9_37 .. L10_38
  L8_36 = L5_33[L8_36]
  L7_35["vpnPolicy.policyName"] = L8_36
  L8_36 = _UPVALUE5_
  L9_37 = "."
  L10_38 = _UPVALUE4_
  L10_38 = L10_38.policyDirection
  L8_36 = L8_36 .. L9_37 .. L10_38
  L8_36 = L4_32[L8_36]
  L9_37 = _UPVALUE6_
  L10_38 = tonumber
  L11_39 = L8_36
  L10_38 = L10_38(L11_39)
  L10_38 = L10_38 + 1
  L9_37 = L9_37[L10_38]
  L6_34["ikePolicy.policyDirection"] = L9_37
  L9_37 = _UPVALUE5_
  L10_38 = "."
  L11_39 = _UPVALUE4_
  L11_39 = L11_39.exchangeMode
  L9_37 = L9_37 .. L10_38 .. L11_39
  L9_37 = L4_32[L9_37]
  L10_38 = _UPVALUE7_
  L11_39 = tonumber
  L12_40 = L9_37
  L11_39 = L11_39(L12_40)
  L11_39 = L11_39 + 1
  L10_38 = L10_38[L11_39]
  L6_34["ikePolicy.exchangeMode"] = L10_38
  L10_38 = _UPVALUE5_
  L11_39 = "."
  L12_40 = _UPVALUE4_
  L12_40 = L12_40.policyVersion
  L10_38 = L10_38 .. L11_39 .. L12_40
  L10_38 = L4_32[L10_38]
  L11_39 = _UPVALUE8_
  L12_40 = tonumber
  L13_41 = L10_38
  L12_40 = L12_40(L13_41)
  L11_39 = L11_39[L12_40]
  L6_34["ikePolicy.policyVersion"] = L11_39
  L11_39 = _UPVALUE5_
  L12_40 = "."
  L13_41 = _UPVALUE4_
  L13_41 = L13_41.localIdentifierType
  L11_39 = L11_39 .. L12_40 .. L13_41
  L11_39 = L4_32[L11_39]
  L12_40 = _UPVALUE9_
  L13_41 = tonumber
  L14_42 = L11_39
  L13_41 = L13_41(L14_42)
  L13_41 = L13_41 + 1
  L12_40 = L12_40[L13_41]
  L6_34["ikePolicy.localIdentifierType"] = L12_40
  L12_40 = _UPVALUE5_
  L13_41 = "."
  L14_42 = _UPVALUE4_
  L14_42 = L14_42.localIdentifier
  L12_40 = L12_40 .. L13_41 .. L14_42
  L12_40 = L4_32[L12_40]
  L6_34["ikePolicy.localIdentifier"] = L12_40
  L12_40 = _UPVALUE5_
  L13_41 = "."
  L14_42 = _UPVALUE4_
  L14_42 = L14_42.remoteIdentifierType
  L12_40 = L12_40 .. L13_41 .. L14_42
  L12_40 = L4_32[L12_40]
  L13_41 = _UPVALUE10_
  L14_42 = tonumber
  L15_43 = L12_40
  L14_42 = L14_42(L15_43)
  L14_42 = L14_42 + 1
  L13_41 = L13_41[L14_42]
  L6_34["ikePolicy.remoteIdentifierType"] = L13_41
  L13_41 = _UPVALUE5_
  L14_42 = "."
  L15_43 = _UPVALUE4_
  L15_43 = L15_43.remoteIdentifier
  L13_41 = L13_41 .. L14_42 .. L15_43
  L13_41 = L4_32[L13_41]
  L6_34["ikePolicy.remoteIdentifier"] = L13_41
  L13_41 = _UPVALUE5_
  L14_42 = "."
  L15_43 = _UPVALUE4_
  L15_43 = L15_43.encryptionAlgo
  L13_41 = L13_41 .. L14_42 .. L15_43
  L13_41 = L4_32[L13_41]
  L14_42 = ikeEncrAlgoToString
  L15_43 = L13_41
  L14_42 = L14_42(L15_43)
  L6_34["ikePolicy.encryptionAlgo"] = L14_42
  L14_42 = _UPVALUE5_
  L15_43 = "."
  L16_44 = _UPVALUE4_
  L16_44 = L16_44.encryptionAlgoKeyLength
  L14_42 = L14_42 .. L15_43 .. L16_44
  L14_42 = L4_32[L14_42]
  L6_34["ikePolicy.encryptionAlgoKeyLength"] = L14_42
  L14_42 = _UPVALUE5_
  L15_43 = "."
  L16_44 = _UPVALUE4_
  L16_44 = L16_44.authenticationAlgo
  L14_42 = L14_42 .. L15_43 .. L16_44
  L14_42 = L4_32[L14_42]
  L15_43 = ikeAuthAlgoToString
  L16_44 = L14_42
  L15_43 = L15_43(L16_44)
  L6_34["ikePolicy.authenticationAlgo"] = L15_43
  L15_43 = _UPVALUE5_
  L16_44 = "."
  L17_45 = _UPVALUE4_
  L17_45 = L17_45.authenticationType
  L15_43 = L15_43 .. L16_44 .. L17_45
  L15_43 = L4_32[L15_43]
  L16_44 = _UPVALUE11_
  L17_45 = tonumber
  L18_46 = L15_43
  L17_45 = L17_45(L18_46)
  L17_45 = L17_45 + 1
  L16_44 = L16_44[L17_45]
  L6_34["ikePolicy.authenticationType"] = L16_44
  L16_44 = _UPVALUE5_
  L17_45 = "."
  L18_46 = _UPVALUE4_
  L18_46 = L18_46.presharedKey
  L16_44 = L16_44 .. L17_45 .. L18_46
  L16_44 = L4_32[L16_44]
  L6_34["ikePolicy.presharedKey"] = L16_44
  L16_44 = _UPVALUE5_
  L17_45 = "."
  L18_46 = _UPVALUE4_
  L18_46 = L18_46.dhGroup
  L16_44 = L16_44 .. L17_45 .. L18_46
  L16_44 = L4_32[L16_44]
  L6_34["ikePolicy.dhGroup"] = L16_44
  L16_44 = _UPVALUE5_
  L17_45 = "."
  L18_46 = _UPVALUE4_
  L18_46 = L18_46.saLifeTime
  L16_44 = L16_44 .. L17_45 .. L18_46
  L16_44 = L4_32[L16_44]
  L6_34["ikePolicy.saLifeTime"] = L16_44
  L16_44 = _UPVALUE5_
  L17_45 = "."
  L18_46 = _UPVALUE4_
  L18_46 = L18_46.DPD
  L16_44 = L16_44 .. L17_45 .. L18_46
  L16_44 = L4_32[L16_44]
  L6_34["ikePolicy.DPD"] = L16_44
  L16_44 = _UPVALUE5_
  L17_45 = "."
  L18_46 = _UPVALUE4_
  L18_46 = L18_46.DPDDetectionPeriod
  L16_44 = L16_44 .. L17_45 .. L18_46
  L16_44 = L4_32[L16_44]
  L6_34["ikePolicy.DPDDetectionPeriod"] = L16_44
  L16_44 = _UPVALUE5_
  L17_45 = "."
  L18_46 = _UPVALUE4_
  L18_46 = L18_46.DPDFailureCount
  L16_44 = L16_44 .. L17_45 .. L18_46
  L16_44 = L4_32[L16_44]
  L6_34["ikePolicy.DPDFailureCount"] = L16_44
  L16_44 = _UPVALUE5_
  L17_45 = "."
  L18_46 = _UPVALUE4_
  L18_46 = L18_46.extendedAuthentication
  L16_44 = L16_44 .. L17_45 .. L18_46
  L16_44 = L4_32[L16_44]
  L17_45 = _UPVALUE12_
  L18_46 = tonumber
  L19_47 = L16_44
  L18_46 = L18_46(L19_47)
  L18_46 = L18_46 + 1
  L17_45 = L17_45[L18_46]
  L6_34["ikePolicy.extendedAuthentication"] = L17_45
  L17_45 = _UPVALUE5_
  L18_46 = "."
  L19_47 = _UPVALUE4_
  L19_47 = L19_47.extendedAuthType
  L17_45 = L17_45 .. L18_46 .. L19_47
  L17_45 = L4_32[L17_45]
  L18_46 = _UPVALUE13_
  L19_47 = tonumber
  L20_48 = L17_45
  L19_47 = L19_47(L20_48)
  L19_47 = L19_47 - 1
  L18_46 = L18_46[L19_47]
  L6_34["ikePolicy.extendedAuthType"] = L18_46
  L18_46 = _UPVALUE5_
  L19_47 = "."
  L20_48 = _UPVALUE4_
  L20_48 = L20_48.XAUTHProfile
  L18_46 = L18_46 .. L19_47 .. L20_48
  L18_46 = L4_32[L18_46]
  L6_34["ikePolicy.XAUTHProfile"] = L18_46
  L18_46 = _UPVALUE5_
  L19_47 = "."
  L20_48 = _UPVALUE4_
  L20_48 = L20_48.userName
  L18_46 = L18_46 .. L19_47 .. L20_48
  L18_46 = L4_32[L18_46]
  L6_34["ikePolicy.userName"] = L18_46
  L18_46 = _UPVALUE5_
  L19_47 = "."
  L20_48 = _UPVALUE4_
  L20_48 = L20_48.password
  L18_46 = L18_46 .. L19_47 .. L20_48
  L18_46 = L4_32[L18_46]
  L6_34["ikePolicy.password"] = L18_46
  L18_46 = _UPVALUE5_
  L19_47 = "."
  L20_48 = _UPVALUE4_
  L20_48 = L20_48.natTraversal
  L18_46 = L18_46 .. L19_47 .. L20_48
  L18_46 = L4_32[L18_46]
  L6_34["ikePolicy.natTraversal"] = L18_46
  L18_46 = _UPVALUE5_
  L19_47 = "."
  L20_48 = _UPVALUE4_
  L20_48 = L20_48.natKeepAliveTime
  L18_46 = L18_46 .. L19_47 .. L20_48
  L18_46 = L4_32[L18_46]
  L6_34["ikePolicy.natKeepAliveTime"] = L18_46
  L18_46 = _UPVALUE5_
  L19_47 = "."
  L20_48 = _UPVALUE4_
  L20_48 = L20_48.addressFamily
  L18_46 = L18_46 .. L19_47 .. L20_48
  L18_46 = L4_32[L18_46]
  if L18_46 == "IPv4" then
    L18_46 = 2
  else
    L18_46 = 10
  end
  L6_34["ikePolicy.addressFamily"] = L18_46
  L19_47 = _UPVALUE3_
  L20_48 = "."
  L21_49 = _UPVALUE4_
  L21_49 = L21_49.protocol
  L19_47 = L19_47 .. L20_48 .. L21_49
  L19_47 = L5_33[L19_47]
  L20_48 = _UPVALUE14_
  L21_49 = tonumber
  L22_50 = L19_47
  L21_49 = L21_49(L22_50)
  L21_49 = L21_49 + 1
  L20_48 = L20_48[L21_49]
  L7_35["vpnPolicy.protocol"] = L20_48
  L20_48 = _UPVALUE3_
  L21_49 = "."
  L22_50 = _UPVALUE4_
  L22_50 = L22_50.ipsecMode
  L20_48 = L20_48 .. L21_49 .. L22_50
  L20_48 = L5_33[L20_48]
  L7_35["vpnPolicy.ipsecMode"] = L20_48
  L21_49 = _UPVALUE3_
  L22_50 = "."
  L23_51 = _UPVALUE4_
  L23_51 = L23_51.dhcpOverIpsec
  L21_49 = L21_49 .. L22_50 .. L23_51
  L21_49 = L5_33[L21_49]
  L7_35["vpnPolicy.dhcpOverIpsec"] = L21_49
  L21_49 = _UPVALUE3_
  L22_50 = "."
  L23_51 = _UPVALUE4_
  L23_51 = L23_51.policyType
  L21_49 = L21_49 .. L22_50 .. L23_51
  L21_49 = L5_33[L21_49]
  L22_50 = _UPVALUE15_
  L23_51 = tonumber
  L24_52 = L21_49
  L23_51 = L23_51(L24_52)
  L22_50 = L22_50[L23_51]
  L7_35["vpnPolicy.policyType"] = L22_50
  L22_50 = _UPVALUE3_
  L23_51 = "."
  L24_52 = _UPVALUE4_
  L24_52 = L24_52.localGateway
  L22_50 = L22_50 .. L23_51 .. L24_52
  L22_50 = L5_33[L22_50]
  L23_51 = _UPVALUE16_
  L24_52 = tonumber
  L25_53 = L22_50
  L24_52 = L24_52(L25_53)
  L24_52 = L24_52 + 1
  L23_51 = L23_51[L24_52]
  L7_35["vpnPolicy.localGateway"] = L23_51
  L23_51 = _UPVALUE3_
  L24_52 = "."
  L25_53 = _UPVALUE4_
  L25_53 = L25_53.remoteEndPointType
  L23_51 = L23_51 .. L24_52 .. L25_53
  L23_51 = L5_33[L23_51]
  L24_52 = _UPVALUE17_
  L25_53 = tonumber
  L26_54 = L23_51
  L25_53 = L25_53(L26_54)
  L25_53 = L25_53 + 1
  L24_52 = L24_52[L25_53]
  L7_35["vpnPolicy.remoteEndPointType"] = L24_52
  L24_52 = _UPVALUE3_
  L25_53 = "."
  L26_54 = _UPVALUE4_
  L26_54 = L26_54.remoteEndPoint
  L24_52 = L24_52 .. L25_53 .. L26_54
  L24_52 = L5_33[L24_52]
  L7_35["vpnPolicy.remoteEndPoint"] = L24_52
  L24_52 = _UPVALUE3_
  L25_53 = "."
  L26_54 = _UPVALUE4_
  L26_54 = L26_54.netbios
  L24_52 = L24_52 .. L25_53 .. L26_54
  L24_52 = L5_33[L24_52]
  L7_35["vpnPolicy.netbios"] = L24_52
  L24_52 = _UPVALUE3_
  L25_53 = "."
  L26_54 = _UPVALUE4_
  L26_54 = L26_54.rollover
  L24_52 = L24_52 .. L25_53 .. L26_54
  L24_52 = L5_33[L24_52]
  L7_35["vpnPolicy.rollover"] = L24_52
  L24_52 = _UPVALUE3_
  L25_53 = "."
  L26_54 = _UPVALUE4_
  L26_54 = L26_54.rolloverGateway
  L24_52 = L24_52 .. L25_53 .. L26_54
  L24_52 = L5_33[L24_52]
  L7_35["vpnPolicy.rolloverGateway"] = L24_52
  L24_52 = _UPVALUE3_
  L25_53 = "."
  L26_54 = _UPVALUE4_
  L26_54 = L26_54.keepAlive
  L24_52 = L24_52 .. L25_53 .. L26_54
  L24_52 = L5_33[L24_52]
  L7_35["vpnPolicy.keepAlive"] = L24_52
  L24_52 = _UPVALUE3_
  L25_53 = "."
  L26_54 = _UPVALUE4_
  L26_54 = L26_54.keepAliveSourceAddress
  L24_52 = L24_52 .. L25_53 .. L26_54
  L24_52 = L5_33[L24_52]
  L7_35["vpnPolicy.keepAliveSourceAddress"] = L24_52
  L24_52 = _UPVALUE3_
  L25_53 = "."
  L26_54 = _UPVALUE4_
  L26_54 = L26_54.remotePingIPAddress
  L24_52 = L24_52 .. L25_53 .. L26_54
  L24_52 = L5_33[L24_52]
  L7_35["vpnPolicy.remotePingIPAddress"] = L24_52
  L24_52 = _UPVALUE3_
  L25_53 = "."
  L26_54 = _UPVALUE4_
  L26_54 = L26_54.keepAlivePeriod
  L24_52 = L24_52 .. L25_53 .. L26_54
  L24_52 = L5_33[L24_52]
  L7_35["vpnPolicy.keepAlivePeriod"] = L24_52
  L24_52 = _UPVALUE3_
  L25_53 = "."
  L26_54 = _UPVALUE4_
  L26_54 = L26_54.keepAliveFailureCount
  L24_52 = L24_52 .. L25_53 .. L26_54
  L24_52 = L5_33[L24_52]
  L7_35["vpnPolicy.keepAliveFailureCount"] = L24_52
  L24_52 = _UPVALUE3_
  L25_53 = "."
  L26_54 = _UPVALUE4_
  L26_54 = L26_54.encryptionAlgo
  L24_52 = L24_52 .. L25_53 .. L26_54
  L24_52 = L5_33[L24_52]
  L25_53 = encrAlgoToString
  L26_54 = L24_52
  L25_53 = L25_53(L26_54)
  L7_35["vpnPolicy.encryptionAlgo"] = L25_53
  L25_53 = _UPVALUE3_
  L26_54 = "."
  L27_55 = _UPVALUE4_
  L27_55 = L27_55.encryptionAlgoKeyLength
  L25_53 = L25_53 .. L26_54 .. L27_55
  L25_53 = L5_33[L25_53]
  L7_35["vpnPolicy.encryptionAlgoKeyLength"] = L25_53
  L25_53 = _UPVALUE3_
  L26_54 = "."
  L27_55 = _UPVALUE4_
  L27_55 = L27_55.authenticationAlgo
  L25_53 = L25_53 .. L26_54 .. L27_55
  L25_53 = L5_33[L25_53]
  L26_54 = authAlgoToString
  L27_55 = L25_53
  L26_54 = L26_54(L27_55)
  L7_35["vpnPolicy.authenticationAlgo"] = L26_54
  L26_54 = _UPVALUE3_
  L27_55 = "."
  L28_56 = _UPVALUE4_
  L28_56 = L28_56.localNetworkType
  L26_54 = L26_54 .. L27_55 .. L28_56
  L26_54 = L5_33[L26_54]
  L27_55 = _UPVALUE18_
  L28_56 = tonumber
  L28_56 = L28_56(L26_54)
  L28_56 = L28_56 + 1
  L27_55 = L27_55[L28_56]
  L7_35["vpnPolicy.localNetworkType"] = L27_55
  L27_55 = _UPVALUE3_
  L28_56 = "."
  L27_55 = L27_55 .. L28_56 .. _UPVALUE4_.localStartIP
  L27_55 = L5_33[L27_55]
  L7_35["vpnPolicy.localStartIP"] = L27_55
  L27_55 = _UPVALUE3_
  L28_56 = "."
  L27_55 = L27_55 .. L28_56 .. _UPVALUE4_.localEndIP
  L27_55 = L5_33[L27_55]
  L7_35["vpnPolicy.localEndIP"] = L27_55
  L27_55 = _UPVALUE3_
  L28_56 = "."
  L27_55 = L27_55 .. L28_56 .. _UPVALUE4_.localSubnetmask
  L27_55 = L5_33[L27_55]
  L7_35["vpnPolicy.localSubnetmask"] = L27_55
  L27_55 = _UPVALUE3_
  L28_56 = "."
  L27_55 = L27_55 .. L28_56 .. _UPVALUE4_.localPrefixLength
  L27_55 = L5_33[L27_55]
  L7_35["vpnPolicy.localPrefixLength"] = L27_55
  L27_55 = _UPVALUE3_
  L28_56 = "."
  L27_55 = L27_55 .. L28_56 .. _UPVALUE4_.remoteNetworkType
  L27_55 = L5_33[L27_55]
  L28_56 = _UPVALUE18_
  L28_56 = L28_56[tonumber(L27_55) + 1]
  L7_35["vpnPolicy.remoteNetworkType"] = L28_56
  L28_56 = _UPVALUE3_
  L28_56 = L28_56 .. "." .. _UPVALUE4_.remoteStartAddress
  L28_56 = L5_33[L28_56]
  L7_35["vpnPolicy.remoteStartAddress"] = L28_56
  L28_56 = _UPVALUE3_
  L28_56 = L28_56 .. "." .. _UPVALUE4_.remoteEndAddress
  L28_56 = L5_33[L28_56]
  L7_35["vpnPolicy.remoteEndAddress"] = L28_56
  L28_56 = _UPVALUE3_
  L28_56 = L28_56 .. "." .. _UPVALUE4_.remoteSubnetmask
  L28_56 = L5_33[L28_56]
  L7_35["vpnPolicy.remoteSubnetmask"] = L28_56
  L28_56 = _UPVALUE3_
  L28_56 = L28_56 .. "." .. _UPVALUE4_.remotePrefixLength
  L28_56 = L5_33[L28_56]
  L7_35["vpnPolicy.remotePrefixLength"] = L28_56
  L28_56 = _UPVALUE3_
  L28_56 = L28_56 .. "." .. _UPVALUE4_.ipsecSPIIn
  L28_56 = L5_33[L28_56]
  L7_35["vpnPolicy.ipsecSPIIn"] = L28_56
  L28_56 = _UPVALUE3_
  L28_56 = L28_56 .. "." .. _UPVALUE4_.ipsecSPIOut
  L28_56 = L5_33[L28_56]
  L7_35["vpnPolicy.ipsecSPIOut"] = L28_56
  L28_56 = _UPVALUE3_
  L28_56 = L28_56 .. "." .. _UPVALUE4_.encryptionKeyIn
  L28_56 = L5_33[L28_56]
  L7_35["vpnPolicy.encryptionKeyIn"] = L28_56
  L28_56 = _UPVALUE3_
  L28_56 = L28_56 .. "." .. _UPVALUE4_.encryptionKeyOut
  L28_56 = L5_33[L28_56]
  L7_35["vpnPolicy.encryptionKeyOut"] = L28_56
  L28_56 = _UPVALUE3_
  L28_56 = L28_56 .. "." .. _UPVALUE4_.authKeyIn
  L28_56 = L5_33[L28_56]
  L7_35["vpnPolicy.authKeyIn"] = L28_56
  L28_56 = _UPVALUE3_
  L28_56 = L28_56 .. "." .. _UPVALUE4_.authKeyOut
  L28_56 = L5_33[L28_56]
  L7_35["vpnPolicy.authKeyOut"] = L28_56
  L28_56 = _UPVALUE3_
  L28_56 = L28_56 .. "." .. _UPVALUE4_.autoPolicyType
  L28_56 = L5_33[L28_56]
  L7_35["vpnPolicy.autoPolicyType"] = L28_56
  L28_56 = _UPVALUE3_
  L28_56 = L28_56 .. "." .. _UPVALUE4_.saLifeTime
  L28_56 = L5_33[L28_56]
  L7_35["vpnPolicy.saLifeTime"] = L28_56
  L28_56 = _UPVALUE3_
  L28_56 = L28_56 .. "." .. _UPVALUE4_.saLifeTimeType
  L28_56 = L5_33[L28_56]
  L7_35["vpnPolicy.saLifeTimeType"] = _UPVALUE19_[tonumber(L28_56) + 1]
  L7_35["vpnPolicy.pfsKeyGroup"] = L5_33[_UPVALUE3_ .. "." .. _UPVALUE4_.pfsKeyGroup]
  L7_35["vpnPolicy.backupPolicyName"] = L5_33[_UPVALUE3_ .. "." .. _UPVALUE4_.backupPolicyName]
  L7_35["vpnPolicy.failBackTime"] = L5_33[_UPVALUE3_ .. "." .. _UPVALUE4_.failBackTime]
  L7_35["vpnPolicy.ipsecPolicyType"] = L5_33[_UPVALUE3_ .. "." .. _UPVALUE4_.ipsecPolicyType]
  L7_35["vpnPolicy.modeConfigStatus"] = L5_33[_UPVALUE3_ .. "." .. _UPVALUE4_.modeConfigStatus]
  L7_35["vpnPolicy.policyDescr"] = L5_33[_UPVALUE3_ .. "." .. _UPVALUE4_.policyDescr]
  return L6_34, L7_35
end
function policiesSectionSet(A0_57)
  local L1_58, L2_59, L3_60, L4_61, L5_62, L6_63, L7_64, L8_65, L9_66, L10_67, L11_68, L12_69, L13_70, L14_71, L15_72, L16_73, L17_74, L18_75, L19_76, L20_77, L21_78, L22_79, L23_80, L24_81, L25_82, L26_83, L27_84, L28_85, L29_86, L30_87, L31_88, L32_89, L33_90, L34_91, L35_92, L36_93, L37_94, L38_95, L39_96, L40_97, L41_98, L42_99, L43_100, L44_101, L45_102, L46_103, L47_104, L48_105, L49_106, L50_107, L51_108, L52_109, L53_110, L54_111, L55_112, L56_113, L57_114, L58_115, L59_116, L60_117, L61_118, L62_119, L63_120, L64_121, L65_122, L66_123, L67_124, L68_125, L69_126, L70_127, L71_128, L72_129, L73_130, L74_131, L75_132, L76_133, L77_134, L78_135, L79_136, L80_137, L81_138, L82_139, L83_140, L84_141, L85_142, L86_143, L87_144, L88_145, L89_146, L90_147, L91_148, L92_149, L93_150, L94_151, L95_152, L96_153
  L1_58 = ACCESS_LEVEL
  if L1_58 ~= 0 then
    L1_58 = util
    L1_58 = L1_58.appendDebugOut
    L2_59 = "Detected Unauthorized access for page policies PAGE"
    L1_58(L2_59)
    L1_58 = _UPVALUE0_
    L1_58 = L1_58.UNAUTHORIZED
    return L1_58
  end
  L1_58 = db
  L1_58 = L1_58.getAttribute
  L2_59 = "NatTable"
  L3_60 = "_ROWID_"
  L4_61 = "1"
  L5_62 = "Enable"
  L1_58 = L1_58(L2_59, L3_60, L4_61, L5_62)
  L2_59 = _UPVALUE1_
  if L1_58 == L2_59 then
    L2_59 = _UPVALUE2_
    L2_59 = L2_59.IPSEC_POLICIES_NOT_ALLOWED_IN_TRANSPARENT_MODE
    return L2_59
  end
  L2_59 = A0_57["policies.cookie"]
  if L2_59 == nil then
    L3_60 = util
    L3_60 = L3_60.appendDebugOut
    L4_61 = "Set : Invalid Cookie"
    L3_60(L4_61)
    L3_60 = _UPVALUE0_
    L3_60 = L3_60.BAD_PARAMETER
    return L3_60
  end
  L3_60 = _UPVALUE3_
  L3_60 = L3_60.vpnPolicyGetCur
  L4_61 = L2_59
  L5_62 = L3_60(L4_61)
  L6_63 = nil
  L7_64 = _UPVALUE4_
  L8_65 = "."
  L9_66 = _UPVALUE5_
  L9_66 = L9_66.policyName
  L7_64 = L7_64 .. L8_65 .. L9_66
  L7_64 = L5_62[L7_64]
  L8_65 = _UPVALUE4_
  L9_66 = "."
  L10_67 = _UPVALUE5_
  L10_67 = L10_67.policyType
  L8_65 = L8_65 .. L9_66 .. L10_67
  L8_65 = L5_62[L8_65]
  L9_66 = A0_57["policies.policyDirection"]
  L10_67 = A0_57["policies.dhcpOverIpsec"]
  if L10_67 == "1" and (L9_66 == "1" or L9_66 == "3") then
    L10_67 = _UPVALUE2_
    L10_67 = L10_67.DHCP_DIRECTION_INVALID
    return L10_67
  end
  L10_67 = stringTonumber
  L11_68 = L9_66
  L12_69 = _UPVALUE6_
  L13_70 = 1
  L11_68 = L10_67(L11_68, L12_69, L13_70)
  L9_66 = L11_68
  L6_63 = L10_67
  L10_67 = A0_57["policies.exchangeMode"]
  L11_68 = stringTonumber
  L12_69 = L10_67
  L13_70 = _UPVALUE7_
  L14_71 = 1
  L12_69 = L11_68(L12_69, L13_70, L14_71)
  L10_67 = L12_69
  L6_63 = L11_68
  L11_68 = A0_57["policies.policyVersion"]
  L12_69 = stringTonumber
  L13_70 = L11_68
  L14_71 = _UPVALUE8_
  L15_72 = 0
  L13_70 = L12_69(L13_70, L14_71, L15_72)
  L11_68 = L13_70
  L6_63 = L12_69
  L12_69 = A0_57["policies.localIdentifierType"]
  L13_70 = stringTonumber
  L14_71 = L12_69
  L15_72 = _UPVALUE9_
  L16_73 = 1
  L14_71 = L13_70(L14_71, L15_72, L16_73)
  L12_69 = L14_71
  L6_63 = L13_70
  L13_70 = A0_57["policies.localIdentifier"]
  L14_71 = A0_57["policies.remoteIdentifierType"]
  L15_72 = stringTonumber
  L16_73 = L14_71
  L17_74 = _UPVALUE10_
  L18_75 = 1
  L16_73 = L15_72(L16_73, L17_74, L18_75)
  L14_71 = L16_73
  L6_63 = L15_72
  L15_72 = A0_57["policies.remoteIdentifier"]
  L16_73 = A0_57["policies.L2tpIpsecPolicy"]
  if L16_73 ~= nil then
    L16_73 = A0_57["policies.L2tpIpsecPolicy"]
    if L16_73 ~= "1" then
      L16_73 = A0_57["policies.L2tpIpsecPolicy"]
    else
      if L16_73 == "2" then
        A0_57["policies.ipsecMode"] = "0"
    end
    else
      A0_57["policies.ipsecMode"] = "1"
    end
    L16_73 = A0_57["policies.L2tpIpsecPolicy"]
    if L16_73 == "1" then
      A0_57["policies.remoteEndPointType"] = "2"
      A0_57["policies.remoteEndPoint"] = "0.0.0.0"
    end
  else
    L16_73 = A0_57["policies.policyType"]
    if L16_73 == "2" then
      A0_57["policies.ipsecMode"] = "1"
      A0_57["policies.L2tpIpsecPolicy"] = "0"
    end
  end
  L16_73 = A0_57["policies.Netbios"]
  if L16_73 == "1" then
    A0_57["policies.remoteNetworkType"] = "3"
  end
  L16_73 = tonumber
  L17_74 = A0_57["policies.L2tpIpsecPolicy"]
  L16_73 = L16_73(L17_74)
  L17_74 = 0
  L18_75 = 0
  L19_76 = 0
  L20_77 = A0_57["policies.Des"]
  if L20_77 == "1" then
    L20_77 = _UPVALUE11_
    L20_77 = L20_77[1]
    L17_74 = L17_74 + L20_77
  end
  L20_77 = A0_57["policies.3Des"]
  if L20_77 == "1" then
    L20_77 = _UPVALUE11_
    L20_77 = L20_77[2]
    L17_74 = L17_74 + L20_77
  end
  L20_77 = A0_57["policies.AES128"]
  if L20_77 == "1" then
    L20_77 = _UPVALUE11_
    L20_77 = L20_77[3]
    L17_74 = L17_74 + L20_77
  end
  L20_77 = A0_57["policies.AES192"]
  if L20_77 == "1" then
    L20_77 = _UPVALUE11_
    L20_77 = L20_77[4]
    L17_74 = L17_74 + L20_77
  end
  L20_77 = A0_57["policies.AES256"]
  if L20_77 == "1" then
    L20_77 = _UPVALUE11_
    L20_77 = L20_77[5]
    L17_74 = L17_74 + L20_77
  end
  L20_77 = A0_57["policies.BLOWFISH"]
  if L20_77 == "1" then
    L20_77 = _UPVALUE11_
    L20_77 = L20_77[6]
    L17_74 = L17_74 + L20_77
    L18_75 = A0_57["policies.KeyLengthBLOWFISH"]
    L20_77 = _UPVALUE0_
    L20_77 = L20_77.NIL
    if L18_75 ~= L20_77 then
      L20_77 = tonumber
      L21_78 = L18_75
      L20_77 = L20_77(L21_78)
      if not (L20_77 < 40) then
        L20_77 = tonumber
        L21_78 = L18_75
        L20_77 = L20_77(L21_78)
      elseif L20_77 > 448 then
        L20_77 = _UPVALUE2_
        L20_77 = L20_77.ENCRYPTION_KEY_LENGTH_IN_INVALID_RANGE_BLOWFISH
        return L20_77
      end
    end
  end
  L20_77 = A0_57["policies.CAST128"]
  if L20_77 == "1" then
    L20_77 = _UPVALUE11_
    L20_77 = L20_77[7]
    L17_74 = L17_74 + L20_77
    L19_76 = A0_57["policies.KeyLengthCAST128"]
    L20_77 = _UPVALUE0_
    L20_77 = L20_77.NIL
    if L19_76 ~= L20_77 then
      L20_77 = tonumber
      L21_78 = L19_76
      L20_77 = L20_77(L21_78)
      if not (L20_77 < 40) then
        L20_77 = tonumber
        L21_78 = L19_76
        L20_77 = L20_77(L21_78)
      elseif L20_77 > 128 then
        L20_77 = _UPVALUE2_
        L20_77 = L20_77.ENCRYPTION_KEY_LENGTH_IN_INVALID_RANGE_CAST128
        return L20_77
      end
    end
  end
  L20_77 = nil
  if L17_74 ~= 0 then
    L20_77 = L17_74
  end
  L21_78 = 0
  if L18_75 ~= 0 and L19_76 ~= 0 then
    L22_79 = tostring
    L23_80 = L18_75
    L22_79 = L22_79(L23_80)
    L23_80 = ","
    L24_81 = tostring
    L25_82 = L19_76
    L24_81 = L24_81(L25_82)
    L21_78 = L22_79 .. L23_80 .. L24_81
  elseif L18_75 == 0 then
    L21_78 = L19_76
  elseif L19_76 == 0 then
    L21_78 = L18_75
  end
  L22_79 = L21_78
  L23_80 = 0
  L24_81 = A0_57["policies.Md5"]
  if L24_81 == "1" then
    L24_81 = _UPVALUE12_
    L24_81 = L24_81[1]
    L23_80 = L23_80 + L24_81
  end
  L24_81 = A0_57["policies.Sha1"]
  if L24_81 == "1" then
    L24_81 = _UPVALUE12_
    L24_81 = L24_81[2]
    L23_80 = L23_80 + L24_81
  end
  L24_81 = A0_57["policies.Sha256"]
  if L24_81 == "1" then
    L24_81 = _UPVALUE12_
    L24_81 = L24_81[3]
    L23_80 = L23_80 + L24_81
  end
  L24_81 = A0_57["policies.Sha384"]
  if L24_81 == "1" then
    L24_81 = _UPVALUE12_
    L24_81 = L24_81[4]
    L23_80 = L23_80 + L24_81
  end
  L24_81 = A0_57["policies.Sha512"]
  if L24_81 == "1" then
    L24_81 = _UPVALUE12_
    L24_81 = L24_81[5]
    L23_80 = L23_80 + L24_81
  end
  L24_81 = nil
  if L23_80 ~= 0 then
    L24_81 = L23_80
  end
  L25_82 = A0_57["policies.authenticationType"]
  L26_83 = stringTonumber
  L27_84 = L25_82
  L28_85 = _UPVALUE13_
  L29_86 = 1
  L27_84 = L26_83(L27_84, L28_85, L29_86)
  L25_82 = L27_84
  L6_63 = L26_83
  L26_83 = A0_57["policies.presharedKey"]
  L27_84 = _UPVALUE0_
  L27_84 = L27_84.NIL
  if L26_83 ~= L27_84 then
    L27_84 = string
    L27_84 = L27_84.gsub
    L28_85 = L26_83
    L29_86 = "'"
    L30_87 = "''"
    L27_84 = L27_84(L28_85, L29_86, L30_87)
    L26_83 = L27_84
  end
  L27_84 = A0_57["policies.dhGroup"]
  L28_85 = A0_57["policies.saLifeTime"]
  L29_86 = A0_57["policies.DPD"]
  L30_87 = A0_57["policies.DPDDetectionPeriod"]
  L31_88 = A0_57["policies.DPDFailureCount"]
  L32_89 = A0_57["policies.extendedAuthentication"]
  L33_90 = stringTonumber
  L34_91 = L32_89
  L35_92 = _UPVALUE14_
  L36_93 = 1
  L34_91 = L33_90(L34_91, L35_92, L36_93)
  L32_89 = L34_91
  L6_63 = L33_90
  L33_90 = nil
  L34_91 = tonumber
  L35_92 = L32_89
  L34_91 = L34_91(L35_92)
  if L34_91 ~= 0 then
    L33_90 = A0_57["policies.extendedAuthType"]
    L34_91 = stringTonumber
    L35_92 = L33_90
    L36_93 = _UPVALUE15_
    L37_94 = "-1"
    L35_92 = L34_91(L35_92, L36_93, L37_94)
    L33_90 = L35_92
    L6_63 = L34_91
  end
  L34_91 = A0_57["policies.XAUTHProfile"]
  L35_92 = A0_57["policies.userName"]
  L36_93 = A0_57["policies.password"]
  L37_94 = A0_57["policies.natTraversal"]
  L38_95 = A0_57["policies.natKeepAliveTime"]
  L39_96 = A0_57["policies.addressFamily"]
  if L39_96 == "1" then
    L39_96 = "2"
  else
    L39_96 = "10"
  end
  L40_97 = A0_57["policies.protocol"]
  L41_98 = stringTonumber
  L42_99 = L40_97
  L43_100 = _UPVALUE16_
  L44_101 = 1
  L42_99 = L41_98(L42_99, L43_100, L44_101)
  L40_97 = L42_99
  L6_63 = L41_98
  L41_98 = tonumber
  L42_99 = A0_57["policies.ipsecMode"]
  L41_98 = L41_98(L42_99)
  L42_99 = A0_57["policies.dhcpOverIpsec"]
  L43_100 = A0_57["policies.policyType"]
  L44_101 = A0_57["policies.localGateway"]
  L45_102 = stringTonumber
  L46_103 = L44_101
  L47_104 = _UPVALUE17_
  L48_105 = 1
  L46_103 = L45_102(L46_103, L47_104, L48_105)
  L44_101 = L46_103
  L6_63 = L45_102
  L45_102 = A0_57["policies.remoteEndPointType"]
  L46_103 = stringTonumber
  L47_104 = L45_102
  L48_105 = _UPVALUE18_
  L49_106 = 1
  L47_104 = L46_103(L47_104, L48_105, L49_106)
  L45_102 = L47_104
  L6_63 = L46_103
  L46_103 = A0_57["policies.remoteEndPoint"]
  L47_104 = A0_57["policies.netbios"]
  L48_105 = A0_57["policies.rollover"]
  L49_106 = A0_57["policies.rolloverGateway"]
  L50_107 = A0_57["policies.keepAlive"]
  L51_108 = A0_57["policies.keepAliveSourceAddress"]
  L52_109 = A0_57["policies.remotePingIPAddress"]
  L53_110 = A0_57["policies.keepAlivePeriod"]
  L54_111 = A0_57["policies.keepAliveFailureCount"]
  L55_112, L56_113 = nil, nil
  L57_114 = tonumber
  L58_115 = L43_100
  L57_114 = L57_114(L58_115)
  if L57_114 == 1 then
    L57_114 = tonumber
    L58_115 = L50_107
    L57_114 = L57_114(L58_115)
    if L57_114 == 1 then
      L57_114 = tonumber
      L58_115 = L9_66
      L57_114 = L57_114(L58_115)
      if L57_114 == 1 then
        L57_114 = _UPVALUE2_
        L57_114 = L57_114.KEEP_ALIVE_NOT_ALLOWED_RESPONDER
        return L57_114
      end
    end
  end
  if L43_100 == "2" then
    L55_112 = A0_57["policies.encryptionAlgoVpn"]
    L57_114 = manualEncryptionAlgo
    L58_115 = L55_112
    L57_114 = L57_114(L58_115)
    L55_112 = L57_114
    if L55_112 == "2048" or L55_112 == "4096" then
      L56_113 = A0_57["policies.encryptionAlgoKeyLengthVpn"]
      if L55_112 == "2048" then
        L57_114 = tonumber
        L58_115 = L56_113
        L57_114 = L57_114(L58_115)
        if not (L57_114 < 40) then
          L57_114 = tonumber
          L58_115 = L56_113
          L57_114 = L57_114(L58_115)
        elseif L57_114 > 448 then
          L57_114 = _UPVALUE2_
          L57_114 = L57_114.ENCRYPTION_KEY_LENGTH_IN_INVALID_RANGE_BLOWFISH
          return L57_114
        end
      else
        L57_114 = tonumber
        L58_115 = L56_113
        L57_114 = L57_114(L58_115)
        if not (L57_114 < 40) then
          L57_114 = tonumber
          L58_115 = L56_113
          L57_114 = L57_114(L58_115)
        elseif L57_114 > 128 then
          L57_114 = _UPVALUE2_
          L57_114 = L57_114.ENCRYPTION_KEY_LENGTH_IN_INVALID_RANGE_CAST128
          return L57_114
        end
      end
    end
  elseif L43_100 == "1" then
    L57_114 = 0
    L58_115 = 0
    L59_116 = 0
    L60_117 = A0_57["policies.Phase2EncrNONE"]
    if L60_117 == "1" then
      L60_117 = _UPVALUE19_
      L57_114 = L60_117[1]
    else
      L60_117 = A0_57["policies.Phase2DES"]
      if L60_117 == "1" then
        L60_117 = _UPVALUE19_
        L60_117 = L60_117[2]
        L57_114 = L57_114 + L60_117
      end
      L60_117 = A0_57["policies.Phase23DES"]
      if L60_117 == "1" then
        L60_117 = _UPVALUE19_
        L60_117 = L60_117[3]
        L57_114 = L57_114 + L60_117
      end
      L60_117 = A0_57["policies.Phase2AES128"]
      if L60_117 == "1" then
        L60_117 = _UPVALUE19_
        L60_117 = L60_117[4]
        L57_114 = L57_114 + L60_117
      end
      L60_117 = A0_57["policies.Phase2AES192"]
      if L60_117 == "1" then
        L60_117 = _UPVALUE19_
        L60_117 = L60_117[5]
        L57_114 = L57_114 + L60_117
      end
      L60_117 = A0_57["policies.Phase2AES256"]
      if L60_117 == "1" then
        L60_117 = _UPVALUE19_
        L60_117 = L60_117[6]
        L57_114 = L57_114 + L60_117
      end
      L60_117 = A0_57["policies.Phase2AESCCM"]
      if L60_117 == "1" then
        L60_117 = _UPVALUE19_
        L60_117 = L60_117[7]
        L57_114 = L57_114 + L60_117
      end
      L60_117 = A0_57["policies.Phase2AESGCM"]
      if L60_117 == "1" then
        L60_117 = _UPVALUE19_
        L60_117 = L60_117[8]
        L57_114 = L57_114 + L60_117
      end
      L60_117 = A0_57["policies.Phase2TWOFISH128"]
      if L60_117 == "1" then
        L60_117 = _UPVALUE19_
        L60_117 = L60_117[9]
        L57_114 = L57_114 + L60_117
      end
      L60_117 = A0_57["policies.Phase2TWOFISH192"]
      if L60_117 == "1" then
        L60_117 = _UPVALUE19_
        L60_117 = L60_117[10]
        L57_114 = L57_114 + L60_117
      end
      L60_117 = A0_57["policies.Phase2TWOFISH256"]
      if L60_117 == "1" then
        L60_117 = _UPVALUE19_
        L60_117 = L60_117[11]
        L57_114 = L57_114 + L60_117
      end
      L60_117 = A0_57["policies.Phase2BLOWFISH"]
      if L60_117 == "1" then
        L60_117 = _UPVALUE19_
        L60_117 = L60_117[12]
        L57_114 = L57_114 + L60_117
        L58_115 = A0_57["policies.Phase2KeyLengthBLOWFISH"]
        L60_117 = tonumber
        L61_118 = L58_115
        L60_117 = L60_117(L61_118)
        if not (L60_117 < 40) then
          L60_117 = tonumber
          L61_118 = L58_115
          L60_117 = L60_117(L61_118)
        elseif L60_117 > 448 then
          L60_117 = _UPVALUE2_
          L60_117 = L60_117.ENCRYPTION_KEY_LENGTH_IN_INVALID_RANGE_BLOWFISH
          return L60_117
        end
      end
      L60_117 = A0_57["policies.Phase2Cast128"]
      if L60_117 == "1" then
        L60_117 = _UPVALUE19_
        L60_117 = L60_117[13]
        L57_114 = L57_114 + L60_117
        L59_116 = A0_57["policies.Phase2KeyLengthCast128"]
        L60_117 = tonumber
        L61_118 = L59_116
        L60_117 = L60_117(L61_118)
        if not (L60_117 < 40) then
          L60_117 = tonumber
          L61_118 = L59_116
          L60_117 = L60_117(L61_118)
        elseif L60_117 > 128 then
          L60_117 = _UPVALUE2_
          L60_117 = L60_117.ENCRYPTION_KEY_LENGTH_IN_INVALID_RANGE_CAST128
          return L60_117
        end
      end
    end
    L55_112 = L57_114
    L60_117 = 0
    if L58_115 ~= 0 and L59_116 ~= 0 then
      L61_118 = tostring
      L62_119 = L58_115
      L61_118 = L61_118(L62_119)
      L62_119 = ","
      L63_120 = tostring
      L64_121 = L59_116
      L63_120 = L63_120(L64_121)
      L60_117 = L61_118 .. L62_119 .. L63_120
    elseif L58_115 == 0 then
      L60_117 = L59_116
    elseif L59_116 == 0 then
      L60_117 = L58_115
    end
    L56_113 = L60_117
  end
  L57_114 = nil
  L58_115 = 0
  if L43_100 == "2" then
    L57_114 = A0_57["policies.authenticationAlgoVpn"]
  elseif L43_100 == "1" then
    L59_116 = A0_57["policies.Phase2Md5"]
    if L59_116 == "1" then
      L59_116 = _UPVALUE20_
      L59_116 = L59_116[1]
      L58_115 = L58_115 + L59_116
    end
    L59_116 = A0_57["policies.Phase2Sha1"]
    if L59_116 == "1" then
      L59_116 = _UPVALUE20_
      L59_116 = L59_116[2]
      L58_115 = L58_115 + L59_116
    end
    L59_116 = A0_57["policies.Phase2Sha224"]
    if L59_116 == "1" then
      L59_116 = _UPVALUE20_
      L59_116 = L59_116[6]
      L58_115 = L58_115 + L59_116
    end
    L59_116 = A0_57["policies.Phase2Sha256"]
    if L59_116 == "1" then
      L59_116 = _UPVALUE20_
      L59_116 = L59_116[3]
      L58_115 = L58_115 + L59_116
    end
    L59_116 = A0_57["policies.Phase2Sha384"]
    if L59_116 == "1" then
      L59_116 = _UPVALUE20_
      L59_116 = L59_116[4]
      L58_115 = L58_115 + L59_116
    end
    L59_116 = A0_57["policies.Phase2Sha512"]
    if L59_116 == "1" then
      L59_116 = _UPVALUE20_
      L59_116 = L59_116[5]
      L58_115 = L58_115 + L59_116
    end
    L57_114 = L58_115
  end
  L59_116, L60_117, L61_118, L62_119, L63_120, L64_121, L65_122, L66_123, L67_124, L68_125 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L59_116 = A0_57["policies.localNetworkType"]
  L69_126 = stringTonumber
  L70_127 = L59_116
  L71_128 = _UPVALUE21_
  L72_129 = 1
  L70_127 = L69_126(L70_127, L71_128, L72_129)
  L59_116 = L70_127
  L6_63 = L69_126
  L60_117 = A0_57["policies.localStartIP"]
  L61_118 = A0_57["policies.localEndIP"]
  L62_119 = A0_57["policies.localSubnetmask"]
  L63_120 = A0_57["policies.localPrefixLength"]
  L64_121 = A0_57["policies.remoteNetworkType"]
  L69_126 = stringTonumber
  L70_127 = L64_121
  L71_128 = _UPVALUE21_
  L72_129 = 1
  L70_127 = L69_126(L70_127, L71_128, L72_129)
  L64_121 = L70_127
  L6_63 = L69_126
  L65_122 = A0_57["policies.remoteStartAddress"]
  L66_123 = A0_57["policies.remoteEndAddress"]
  L67_124 = A0_57["policies.remoteSubnetmask"]
  L69_126 = A0_57["policies.remotePrefixLength"]
  L70_127 = A0_57["policies.ipsecSPIIn"]
  L71_128 = A0_57["policies.ipsecSPIOut"]
  L72_129 = A0_57["policies.encryptionKeyIn"]
  L73_130 = A0_57["policies.encryptionKeyOut"]
  L74_131 = A0_57["policies.authKeyIn"]
  L75_132 = A0_57["policies.authKeyOut"]
  L76_133 = A0_57["policies.autoPolicyType"]
  L77_134 = A0_57["policies.saLifeTimeVpn"]
  L78_135 = A0_57["policies.saLifeTimeType"]
  L79_136 = stringTonumber
  L80_137 = L78_135
  L81_138 = _UPVALUE22_
  L82_139 = 1
  L80_137 = L79_136(L80_137, L81_138, L82_139)
  L78_135 = L80_137
  L6_63 = L79_136
  L79_136, L80_137 = nil, nil
  L80_137 = A0_57["policies.pfsKeyGroup1"]
  L79_136 = A0_57["policies.pfsKeyGroup"]
  if L79_136 == "1" then
    L79_136 = L80_137
  end
  L81_138 = A0_57["policies.backupPolicyName"]
  L82_139 = A0_57["policies.failBackTime"]
  L83_140 = A0_57["policies.ipsecPolicyType"]
  L84_141 = A0_57["policies.modeConfigStatus"]
  L85_142 = A0_57["policies.rvgStatus"]
  L86_143 = A0_57["policies.policyDescr"]
  L87_144, L88_145 = nil, nil
  if L40_97 == 0 then
    L89_146 = _UPVALUE0_
    L89_146 = L89_146.NIL
    if L42_99 == L89_146 then
      L42_99 = "0"
    end
    L89_146 = _UPVALUE0_
    L89_146 = L89_146.NIL
    if L37_94 == L89_146 then
      L37_94 = "0"
    end
    L55_112 = "1"
  end
  L89_146 = A0_57["policies.exportFlag"]
  L90_147 = nil
  if L89_146 == "-10" then
    L91_148 = "/tmp/ezvpn.cfg"
    L92_149 = io
    L92_149 = L92_149.open
    L93_150 = L91_148
    L94_151 = "w"
    L92_149 = L92_149(L93_150, L94_151)
    L90_147 = L92_149
    L92_149 = _UPVALUE23_
    if L14_71 == L92_149 then
      L15_72 = L46_103
    end
    L92_149 = _UPVALUE23_
    if L12_69 == L92_149 then
      L13_70 = ""
    end
  end
  L91_148, L92_149 = nil, nil
  L93_150 = _UPVALUE24_
  L93_150 = L93_150.start
  L93_150()
  if L43_100 == "1" then
    if L8_65 == "1" then
      L93_150 = _UPVALUE25_
      L93_150 = L93_150.ikePolicyGetCur
      L94_151 = L7_64
      L95_152 = L93_150(L94_151)
      L96_153 = _UPVALUE26_
      L96_153 = L96_153 .. "." .. "_ROWID_"
      L96_153 = L95_152[L96_153]
      L91_148, L92_149 = _UPVALUE25_.ikePolicySet(L96_153, L7_64, L9_66, L10_67, L11_68, L12_69, L13_70, L14_71, L15_72, L20_77, L22_79, L24_81, L25_82, L26_83, L27_84, L28_85, L29_86, L30_87, L31_88, L32_89, L33_90, L34_91, L35_92, L36_93, L37_94, L38_95, L39_96, L84_141, L89_146, L90_147)
      if L91_148 ~= _UPVALUE0_.SUCCESS then
        util.appendDebugOut("Error in configuring values in  policies PAGE ike group set" .. L91_148)
        _UPVALUE24_.abort()
        return L91_148
      end
    elseif L8_65 == "2" then
      L93_150 = _UPVALUE0_
      L93_150 = L93_150.NIL
      if L22_79 ~= L93_150 then
        L93_150 = _UPVALUE0_
        L93_150 = L93_150.EMPTY
      elseif L22_79 == L93_150 then
        L22_79 = "0"
      end
      L93_150 = _UPVALUE25_
      L93_150 = L93_150.ikePolicyCreate
      L94_151 = L7_64
      L95_152 = L9_66
      L96_153 = L10_67
      L94_151 = L93_150(L94_151, L95_152, L96_153, L11_68, L12_69, L13_70, L14_71, L15_72, L20_77, L22_79, L24_81, L25_82, L26_83, L27_84, L28_85, L29_86, L30_87, L31_88, L32_89, L33_90, L34_91, L35_92, L36_93, L37_94, L38_95, L39_96, L84_141)
      L92_149 = L94_151
      L91_148 = L93_150
      L93_150 = _UPVALUE0_
      L93_150 = L93_150.SUCCESS
      if L91_148 ~= L93_150 then
        L93_150 = util
        L93_150 = L93_150.appendDebugOut
        L94_151 = "Error in configuring values in  policies PAGE ike group set"
        L95_152 = L91_148
        L94_151 = L94_151 .. L95_152
        L93_150(L94_151)
        L93_150 = _UPVALUE24_
        L93_150 = L93_150.abort
        L93_150()
        return L91_148
      end
    end
  end
  if L41_98 == 0 then
    L64_121 = 0
  end
  if L45_102 == 1 and L64_121 == 0 then
    L93_150 = tostring
    L94_151 = L12_69
    L93_150 = L93_150(L94_151)
    if L93_150 ~= "0" then
      L76_133 = "2"
    else
      L76_133 = "1"
    end
  else
    L76_133 = "0"
  end
  L93_150 = _UPVALUE0_
  L93_150 = L93_150.NIL
  if L42_99 == L93_150 then
    L42_99 = "0"
  end
  L93_150 = _UPVALUE0_
  L93_150 = L93_150.NIL
  if L56_113 ~= L93_150 then
    L93_150 = _UPVALUE0_
    L93_150 = L93_150.EMPTY
  elseif L56_113 == L93_150 then
    L56_113 = "0"
  end
  L93_150 = _UPVALUE3_
  L93_150 = L93_150.vpnPolicySet
  L94_151 = L2_59
  L95_152 = L7_64
  L96_153 = L40_97
  L94_151 = L93_150(L94_151, L95_152, L96_153, L41_98, L42_99, L43_100, L44_101, L45_102, L46_103, L47_104, L48_105, L49_106, L50_107, L51_108, L52_109, L53_110, L54_111, L55_112, L56_113, L57_114, L59_116, L60_117, L61_118, L62_119, L63_120, L64_121, L65_122, L66_123, L67_124, L69_126, L70_127, L71_128, L72_129, L73_130, L74_131, L75_132, L76_133, L77_134, L78_135, L79_136, L81_138, L82_139, L83_140, L16_73, L84_141, L85_142, L39_96, L89_146, L90_147)
  L92_149 = L94_151
  L91_148 = L93_150
  L93_150 = _UPVALUE0_
  L93_150 = L93_150.SUCCESS
  if L91_148 ~= L93_150 then
    L93_150 = util
    L93_150 = L93_150.appendDebugOut
    L94_151 = "Error in configuring values in  policies PAGE vpn group set"
    L95_152 = L91_148
    L94_151 = L94_151 .. L95_152
    L93_150(L94_151)
    L93_150 = _UPVALUE24_
    L93_150 = L93_150.abort
    L93_150()
    return L91_148
  end
  if L43_100 == "2" then
    L93_150 = _UPVALUE25_
    L93_150 = L93_150.ikeDelete
    L94_151 = L7_64
    L93_150 = L93_150(L94_151)
    L94_151 = _UPVALUE0_
    L94_151 = L94_151.SUCCESS
    if L93_150 ~= L94_151 then
      L94_151 = util
      L94_151 = L94_151.appendDebugOut
      L95_152 = "Error in configuring values in  policies PAGE vpn group set"
      L96_153 = L93_150
      L95_152 = L95_152 .. L96_153
      L94_151(L95_152)
      L94_151 = _UPVALUE24_
      L94_151 = L94_151.abort
      L94_151()
      return L93_150
    end
  end
  if L89_146 == "-10" then
    L94_151 = L90_147
    L93_150 = L90_147.close
    L93_150(L94_151)
  end
  L93_150 = _UPVALUE24_
  L93_150 = L93_150.complete
  L93_150()
  L93_150 = _UPVALUE24_
  L93_150 = L93_150.save
  L93_150()
  L93_150 = _UPVALUE0_
  L93_150 = L93_150.SUCCESS
  L94_151 = L92_149
  return L93_150, L94_151
end
function policiesSectionCreate(A0_154)
  local L1_155, L2_156, L3_157, L4_158, L5_159, L6_160, L7_161, L8_162, L9_163, L10_164, L11_165, L12_166, L13_167, L14_168, L15_169, L16_170, L17_171, L18_172, L19_173, L20_174, L21_175, L22_176, L23_177, L24_178, L25_179, L26_180, L27_181, L28_182, L29_183, L30_184, L31_185, L32_186, L33_187, L34_188, L35_189, L36_190, L37_191, L38_192, L39_193, L40_194, L41_195, L42_196, L43_197, L44_198, L45_199, L46_200, L47_201, L48_202, L49_203, L50_204, L51_205, L52_206, L53_207, L54_208, L55_209, L56_210, L57_211, L58_212, L59_213, L60_214, L61_215, L62_216, L63_217, L64_218, L65_219, L66_220, L67_221, L68_222, L69_223, L70_224, L71_225, L72_226, L73_227, L74_228, L75_229, L76_230, L77_231, L78_232, L79_233, L80_234, L81_235, L82_236, L83_237
  L1_155 = ACCESS_LEVEL
  if L1_155 ~= 0 then
    L1_155 = util
    L1_155 = L1_155.appendDebugOut
    L2_156 = "Detected Unauthorized access for page policies PAGE"
    L1_155(L2_156)
    L1_155 = _UPVALUE0_
    L1_155 = L1_155.UNAUTHORIZED
    return L1_155
  end
  L1_155 = db
  L1_155 = L1_155.getAttribute
  L2_156 = "NatTable"
  L3_157 = "_ROWID_"
  L4_158 = "1"
  L5_159 = "Enable"
  L1_155 = L1_155(L2_156, L3_157, L4_158, L5_159)
  L2_156 = _UPVALUE1_
  if L1_155 == L2_156 then
    L2_156 = _UPVALUE2_
    L2_156 = L2_156.IPSEC_POLICIES_NOT_ALLOWED_IN_TRANSPARENT_MODE
    return L2_156
  end
  L2_156 = nil
  L3_157 = A0_154["policies.policyName"]
  L4_158 = A0_154["policies.policyDirection"]
  L5_159 = A0_154["policies.dhcpOverIpsec"]
  if L5_159 == "1" and (L4_158 == "1" or L4_158 == "3") then
    L5_159 = _UPVALUE2_
    L5_159 = L5_159.DHCP_DIRECTION_INVALID
    return L5_159
  end
  L5_159 = stringTonumber
  L6_160 = L4_158
  L7_161 = _UPVALUE3_
  L8_162 = 1
  L6_160 = L5_159(L6_160, L7_161, L8_162)
  L4_158 = L6_160
  L2_156 = L5_159
  L5_159 = A0_154["policies.exchangeMode"]
  L6_160 = stringTonumber
  L7_161 = L5_159
  L8_162 = _UPVALUE4_
  L9_163 = 1
  L7_161 = L6_160(L7_161, L8_162, L9_163)
  L5_159 = L7_161
  L2_156 = L6_160
  L6_160 = A0_154["policies.policyVersion"]
  L7_161 = stringTonumber
  L8_162 = L6_160
  L9_163 = _UPVALUE5_
  L10_164 = 0
  L8_162 = L7_161(L8_162, L9_163, L10_164)
  L6_160 = L8_162
  L2_156 = L7_161
  L7_161 = A0_154["policies.localIdentifierType"]
  L8_162 = stringTonumber
  L9_163 = L7_161
  L10_164 = _UPVALUE6_
  L11_165 = 1
  L9_163 = L8_162(L9_163, L10_164, L11_165)
  L7_161 = L9_163
  L2_156 = L8_162
  L8_162 = A0_154["policies.localIdentifier"]
  L9_163 = A0_154["policies.remoteIdentifierType"]
  L10_164 = stringTonumber
  L11_165 = L9_163
  L12_166 = _UPVALUE7_
  L13_167 = 1
  L11_165 = L10_164(L11_165, L12_166, L13_167)
  L9_163 = L11_165
  L2_156 = L10_164
  L10_164 = A0_154["policies.remoteIdentifier"]
  L11_165 = A0_154["policies.L2tpIpsecPolicy"]
  if L11_165 ~= nil then
    L11_165 = A0_154["policies.L2tpIpsecPolicy"]
    if L11_165 ~= "1" then
      L11_165 = A0_154["policies.L2tpIpsecPolicy"]
    else
      if L11_165 == "2" then
        A0_154["policies.ipsecMode"] = "0"
    end
    else
      A0_154["policies.ipsecMode"] = "1"
    end
    L11_165 = A0_154["policies.L2tpIpsecPolicy"]
    if L11_165 == "1" then
      A0_154["policies.remoteEndPointType"] = "2"
      A0_154["policies.remoteEndPoint"] = "0.0.0.0"
    end
  else
    L11_165 = A0_154["policies.policyType"]
    if L11_165 == "2" then
      A0_154["policies.ipsecMode"] = "1"
      A0_154["policies.L2tpIpsecPolicy"] = "0"
    end
  end
  L11_165 = A0_154["policies.Netbios"]
  if L11_165 == "1" then
    A0_154["policies.remoteNetworkType"] = "3"
  end
  L11_165 = tonumber
  L12_166 = A0_154["policies.L2tpIpsecPolicy"]
  L11_165 = L11_165(L12_166)
  L12_166 = 0
  L13_167 = 0
  L14_168 = 0
  L15_169 = A0_154["policies.Des"]
  if L15_169 == "1" then
    L15_169 = _UPVALUE8_
    L15_169 = L15_169[1]
    L12_166 = L12_166 + L15_169
  end
  L15_169 = A0_154["policies.3Des"]
  if L15_169 == "1" then
    L15_169 = _UPVALUE8_
    L15_169 = L15_169[2]
    L12_166 = L12_166 + L15_169
  end
  L15_169 = A0_154["policies.AES128"]
  if L15_169 == "1" then
    L15_169 = _UPVALUE8_
    L15_169 = L15_169[3]
    L12_166 = L12_166 + L15_169
  end
  L15_169 = A0_154["policies.AES192"]
  if L15_169 == "1" then
    L15_169 = _UPVALUE8_
    L15_169 = L15_169[4]
    L12_166 = L12_166 + L15_169
  end
  L15_169 = A0_154["policies.AES256"]
  if L15_169 == "1" then
    L15_169 = _UPVALUE8_
    L15_169 = L15_169[5]
    L12_166 = L12_166 + L15_169
  end
  L15_169 = A0_154["policies.BLOWFISH"]
  if L15_169 == "1" then
    L15_169 = _UPVALUE8_
    L15_169 = L15_169[6]
    L12_166 = L12_166 + L15_169
    L13_167 = A0_154["policies.KeyLengthBLOWFISH"]
    L15_169 = _UPVALUE0_
    L15_169 = L15_169.NIL
    if L13_167 ~= L15_169 then
      L15_169 = tonumber
      L16_170 = L13_167
      L15_169 = L15_169(L16_170)
      if not (L15_169 < 40) then
        L15_169 = tonumber
        L16_170 = L13_167
        L15_169 = L15_169(L16_170)
      elseif L15_169 > 448 then
        L15_169 = _UPVALUE2_
        L15_169 = L15_169.ENCRYPTION_KEY_LENGTH_IN_INVALID_RANGE_BLOWFISH
        return L15_169
      end
    end
  end
  L15_169 = A0_154["policies.CAST128"]
  if L15_169 == "1" then
    L15_169 = _UPVALUE8_
    L15_169 = L15_169[7]
    L12_166 = L12_166 + L15_169
    L14_168 = A0_154["policies.KeyLengthCAST128"]
    L15_169 = _UPVALUE0_
    L15_169 = L15_169.NIL
    if L14_168 ~= L15_169 then
      L15_169 = tonumber
      L16_170 = L14_168
      L15_169 = L15_169(L16_170)
      if not (L15_169 < 40) then
        L15_169 = tonumber
        L16_170 = L14_168
        L15_169 = L15_169(L16_170)
      elseif L15_169 > 128 then
        L15_169 = _UPVALUE2_
        L15_169 = L15_169.ENCRYPTION_KEY_LENGTH_IN_INVALID_RANGE_CAST128
        return L15_169
      end
    end
  end
  L15_169 = nil
  if L12_166 ~= 0 then
    L15_169 = L12_166
  end
  L16_170 = 0
  if L13_167 ~= 0 and L14_168 ~= 0 then
    L17_171 = tostring
    L18_172 = L13_167
    L17_171 = L17_171(L18_172)
    L18_172 = ","
    L19_173 = tostring
    L20_174 = L14_168
    L19_173 = L19_173(L20_174)
    L16_170 = L17_171 .. L18_172 .. L19_173
  elseif L13_167 == 0 then
    L16_170 = L14_168
  elseif L14_168 == 0 then
    L16_170 = L13_167
  end
  L17_171 = L16_170
  L18_172 = 0
  L19_173 = A0_154["policies.Md5"]
  if L19_173 == "1" then
    L19_173 = _UPVALUE9_
    L19_173 = L19_173[1]
    L18_172 = L18_172 + L19_173
  end
  L19_173 = A0_154["policies.Sha1"]
  if L19_173 == "1" then
    L19_173 = _UPVALUE9_
    L19_173 = L19_173[2]
    L18_172 = L18_172 + L19_173
  end
  L19_173 = A0_154["policies.Sha256"]
  if L19_173 == "1" then
    L19_173 = _UPVALUE9_
    L19_173 = L19_173[3]
    L18_172 = L18_172 + L19_173
  end
  L19_173 = A0_154["policies.Sha384"]
  if L19_173 == "1" then
    L19_173 = _UPVALUE9_
    L19_173 = L19_173[4]
    L18_172 = L18_172 + L19_173
  end
  L19_173 = A0_154["policies.Sha512"]
  if L19_173 == "1" then
    L19_173 = _UPVALUE9_
    L19_173 = L19_173[5]
    L18_172 = L18_172 + L19_173
  end
  L19_173 = nil
  if L18_172 ~= 0 then
    L19_173 = L18_172
  end
  L20_174 = A0_154["policies.authenticationType"]
  L21_175 = stringTonumber
  L22_176 = L20_174
  L23_177 = _UPVALUE10_
  L24_178 = 1
  L22_176 = L21_175(L22_176, L23_177, L24_178)
  L20_174 = L22_176
  L2_156 = L21_175
  L21_175 = A0_154["policies.presharedKey"]
  L22_176 = _UPVALUE0_
  L22_176 = L22_176.NIL
  if L21_175 ~= L22_176 then
    L22_176 = string
    L22_176 = L22_176.gsub
    L23_177 = L21_175
    L24_178 = "'"
    L25_179 = "''"
    L22_176 = L22_176(L23_177, L24_178, L25_179)
    L21_175 = L22_176
  end
  L22_176 = A0_154["policies.dhGroup"]
  L23_177 = A0_154["policies.saLifeTime"]
  L24_178 = A0_154["policies.DPD"]
  L25_179 = A0_154["policies.DPDDetectionPeriod"]
  L26_180 = A0_154["policies.DPDFailureCount"]
  L27_181 = A0_154["policies.extendedAuthentication"]
  L28_182 = stringTonumber
  L29_183 = L27_181
  L30_184 = _UPVALUE11_
  L31_185 = 1
  L29_183 = L28_182(L29_183, L30_184, L31_185)
  L27_181 = L29_183
  L2_156 = L28_182
  L28_182 = nil
  L29_183 = tonumber
  L30_184 = L27_181
  L29_183 = L29_183(L30_184)
  if L29_183 ~= 0 then
    L28_182 = A0_154["policies.extendedAuthType"]
    L29_183 = stringTonumber
    L30_184 = L28_182
    L31_185 = _UPVALUE12_
    L32_186 = "-1"
    L30_184 = L29_183(L30_184, L31_185, L32_186)
    L28_182 = L30_184
    L2_156 = L29_183
  end
  L29_183 = A0_154["policies.XAUTHProfile"]
  L30_184 = A0_154["policies.userName"]
  L31_185 = A0_154["policies.password"]
  L32_186 = A0_154["policies.natTraversal"]
  L33_187 = A0_154["policies.natKeepAliveTime"]
  L34_188 = A0_154["policies.addressFamily"]
  if L34_188 == "1" then
    L34_188 = "2"
  else
    L34_188 = "10"
  end
  L35_189 = A0_154["policies.protocol"]
  L36_190 = stringTonumber
  L37_191 = L35_189
  L38_192 = _UPVALUE13_
  L39_193 = 1
  L37_191 = L36_190(L37_191, L38_192, L39_193)
  L35_189 = L37_191
  L2_156 = L36_190
  L36_190 = tonumber
  L37_191 = A0_154["policies.ipsecMode"]
  L36_190 = L36_190(L37_191)
  L37_191 = A0_154["policies.dhcpOverIpsec"]
  L38_192 = A0_154["policies.policyType"]
  L39_193 = A0_154["policies.localGateway"]
  L40_194 = stringTonumber
  L41_195 = L39_193
  L42_196 = _UPVALUE14_
  L43_197 = 1
  L41_195 = L40_194(L41_195, L42_196, L43_197)
  L39_193 = L41_195
  L2_156 = L40_194
  L40_194 = A0_154["policies.remoteEndPointType"]
  L41_195 = stringTonumber
  L42_196 = L40_194
  L43_197 = _UPVALUE15_
  L44_198 = 1
  L42_196 = L41_195(L42_196, L43_197, L44_198)
  L40_194 = L42_196
  L2_156 = L41_195
  L41_195 = A0_154["policies.remoteEndPoint"]
  L42_196 = A0_154["policies.netbios"]
  L43_197 = A0_154["policies.rollover"]
  L44_198 = A0_154["policies.rolloverGateway"]
  L45_199 = A0_154["policies.keepAlive"]
  L46_200 = A0_154["policies.keepAliveSourceAddress"]
  L47_201 = A0_154["policies.remotePingIPAddress"]
  L48_202 = A0_154["policies.keepAlivePeriod"]
  L49_203 = A0_154["policies.keepAliveFailureCount"]
  L50_204, L51_205 = nil, nil
  L52_206 = tonumber
  L53_207 = L38_192
  L52_206 = L52_206(L53_207)
  if L52_206 == 1 then
    L52_206 = tonumber
    L53_207 = L45_199
    L52_206 = L52_206(L53_207)
    if L52_206 == 1 then
      L52_206 = tonumber
      L53_207 = L4_158
      L52_206 = L52_206(L53_207)
      if L52_206 == 1 then
        L52_206 = _UPVALUE2_
        L52_206 = L52_206.KEEP_ALIVE_NOT_ALLOWED_RESPONDER
        return L52_206
      end
    end
  end
  if L38_192 == "2" then
    L50_204 = A0_154["policies.encryptionAlgoVpn"]
    L52_206 = manualEncryptionAlgo
    L53_207 = L50_204
    L52_206 = L52_206(L53_207)
    L50_204 = L52_206
    if L50_204 == "2048" or L50_204 == "4096" then
      L51_205 = A0_154["policies.encryptionAlgoKeyLengthVpn"]
      if L50_204 == "2048" then
        L52_206 = tonumber
        L53_207 = L51_205
        L52_206 = L52_206(L53_207)
        if not (L52_206 < 40) then
          L52_206 = tonumber
          L53_207 = L51_205
          L52_206 = L52_206(L53_207)
        elseif L52_206 > 448 then
          L52_206 = _UPVALUE2_
          L52_206 = L52_206.ENCRYPTION_KEY_LENGTH_IN_INVALID_RANGE_BLOWFISH
          return L52_206
        end
      else
        L52_206 = tonumber
        L53_207 = L51_205
        L52_206 = L52_206(L53_207)
        if not (L52_206 < 40) then
          L52_206 = tonumber
          L53_207 = L51_205
          L52_206 = L52_206(L53_207)
        elseif L52_206 > 128 then
          L52_206 = _UPVALUE2_
          L52_206 = L52_206.ENCRYPTION_KEY_LENGTH_IN_INVALID_RANGE_CAST128
          return L52_206
        end
      end
    end
  elseif L38_192 == "1" then
    L52_206 = 0
    L53_207 = 0
    L54_208 = 0
    L55_209 = A0_154["policies.Phase2EncrNONE"]
    if L55_209 == "1" then
      L55_209 = _UPVALUE16_
      L52_206 = L55_209[1]
    else
      L55_209 = A0_154["policies.Phase2DES"]
      if L55_209 == "1" then
        L55_209 = _UPVALUE16_
        L55_209 = L55_209[2]
        L52_206 = L52_206 + L55_209
      end
      L55_209 = A0_154["policies.Phase23DES"]
      if L55_209 == "1" then
        L55_209 = _UPVALUE16_
        L55_209 = L55_209[3]
        L52_206 = L52_206 + L55_209
      end
      L55_209 = A0_154["policies.Phase2AES128"]
      if L55_209 == "1" then
        L55_209 = _UPVALUE16_
        L55_209 = L55_209[4]
        L52_206 = L52_206 + L55_209
      end
      L55_209 = A0_154["policies.Phase2AES192"]
      if L55_209 == "1" then
        L55_209 = _UPVALUE16_
        L55_209 = L55_209[5]
        L52_206 = L52_206 + L55_209
      end
      L55_209 = A0_154["policies.Phase2AES256"]
      if L55_209 == "1" then
        L55_209 = _UPVALUE16_
        L55_209 = L55_209[6]
        L52_206 = L52_206 + L55_209
      end
      L55_209 = A0_154["policies.Phase2AESCCM"]
      if L55_209 == "1" then
        L55_209 = _UPVALUE16_
        L55_209 = L55_209[7]
        L52_206 = L52_206 + L55_209
      end
      L55_209 = A0_154["policies.Phase2AESGCM"]
      if L55_209 == "1" then
        L55_209 = _UPVALUE16_
        L55_209 = L55_209[8]
        L52_206 = L52_206 + L55_209
      end
      L55_209 = A0_154["policies.Phase2TWOFISH128"]
      if L55_209 == "1" then
        L55_209 = _UPVALUE16_
        L55_209 = L55_209[9]
        L52_206 = L52_206 + L55_209
      end
      L55_209 = A0_154["policies.Phase2TWOFISH192"]
      if L55_209 == "1" then
        L55_209 = _UPVALUE16_
        L55_209 = L55_209[10]
        L52_206 = L52_206 + L55_209
      end
      L55_209 = A0_154["policies.Phase2TWOFISH256"]
      if L55_209 == "1" then
        L55_209 = _UPVALUE16_
        L55_209 = L55_209[11]
        L52_206 = L52_206 + L55_209
      end
      L55_209 = A0_154["policies.Phase2BLOWFISH"]
      if L55_209 == "1" then
        L55_209 = _UPVALUE16_
        L55_209 = L55_209[12]
        L52_206 = L52_206 + L55_209
        L53_207 = A0_154["policies.Phase2KeyLengthBLOWFISH"]
        L55_209 = tonumber
        L56_210 = L53_207
        L55_209 = L55_209(L56_210)
        if not (L55_209 < 40) then
          L55_209 = tonumber
          L56_210 = L53_207
          L55_209 = L55_209(L56_210)
        elseif L55_209 > 448 then
          L55_209 = _UPVALUE2_
          L55_209 = L55_209.ENCRYPTION_KEY_LENGTH_IN_INVALID_RANGE_BLOWFISH
          return L55_209
        end
      end
      L55_209 = A0_154["policies.Phase2Cast128"]
      if L55_209 == "1" then
        L55_209 = _UPVALUE16_
        L55_209 = L55_209[13]
        L52_206 = L52_206 + L55_209
        L54_208 = A0_154["policies.Phase2KeyLengthCast128"]
        L55_209 = tonumber
        L56_210 = L54_208
        L55_209 = L55_209(L56_210)
        if not (L55_209 < 40) then
          L55_209 = tonumber
          L56_210 = L54_208
          L55_209 = L55_209(L56_210)
        elseif L55_209 > 128 then
          L55_209 = _UPVALUE2_
          L55_209 = L55_209.ENCRYPTION_KEY_LENGTH_IN_INVALID_RANGE_CAST128
          return L55_209
        end
      end
    end
    L50_204 = L52_206
    L55_209 = 0
    if L53_207 ~= 0 and L54_208 ~= 0 then
      L56_210 = tostring
      L57_211 = L53_207
      L56_210 = L56_210(L57_211)
      L57_211 = ","
      L58_212 = tostring
      L59_213 = L54_208
      L58_212 = L58_212(L59_213)
      L55_209 = L56_210 .. L57_211 .. L58_212
    elseif L53_207 == 0 then
      L55_209 = L54_208
    elseif L54_208 == 0 then
      L55_209 = L53_207
    end
    L51_205 = L55_209
  end
  L52_206 = nil
  L53_207 = 0
  if L38_192 == "2" then
    L52_206 = A0_154["policies.authenticationAlgoVpn"]
  elseif L38_192 == "1" then
    L54_208 = A0_154["policies.Phase2Md5"]
    if L54_208 == "1" then
      L54_208 = _UPVALUE17_
      L54_208 = L54_208[1]
      L53_207 = L53_207 + L54_208
    end
    L54_208 = A0_154["policies.Phase2Sha1"]
    if L54_208 == "1" then
      L54_208 = _UPVALUE17_
      L54_208 = L54_208[2]
      L53_207 = L53_207 + L54_208
    end
    L54_208 = A0_154["policies.Phase2Sha224"]
    if L54_208 == "1" then
      L54_208 = _UPVALUE17_
      L54_208 = L54_208[6]
      L53_207 = L53_207 + L54_208
    end
    L54_208 = A0_154["policies.Phase2Sha256"]
    if L54_208 == "1" then
      L54_208 = _UPVALUE17_
      L54_208 = L54_208[3]
      L53_207 = L53_207 + L54_208
    end
    L54_208 = A0_154["policies.Phase2Sha384"]
    if L54_208 == "1" then
      L54_208 = _UPVALUE17_
      L54_208 = L54_208[4]
      L53_207 = L53_207 + L54_208
    end
    L54_208 = A0_154["policies.Phase2Sha512"]
    if L54_208 == "1" then
      L54_208 = _UPVALUE17_
      L54_208 = L54_208[5]
      L53_207 = L53_207 + L54_208
    end
    L52_206 = L53_207
  end
  L54_208, L55_209, L56_210, L57_211, L58_212, L59_213, L60_214, L61_215, L62_216, L63_217 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L54_208 = A0_154["policies.localNetworkType"]
  L64_218 = stringTonumber
  L65_219 = L54_208
  L66_220 = _UPVALUE18_
  L67_221 = 1
  L65_219 = L64_218(L65_219, L66_220, L67_221)
  L54_208 = L65_219
  L2_156 = L64_218
  L55_209 = A0_154["policies.localStartIP"]
  L56_210 = A0_154["policies.localEndIP"]
  L57_211 = A0_154["policies.localSubnetmask"]
  L58_212 = A0_154["policies.localPrefixLength"]
  L59_213 = A0_154["policies.remoteNetworkType"]
  L64_218 = stringTonumber
  L65_219 = L59_213
  L66_220 = _UPVALUE18_
  L67_221 = 1
  L65_219 = L64_218(L65_219, L66_220, L67_221)
  L59_213 = L65_219
  L2_156 = L64_218
  L60_214 = A0_154["policies.remoteStartAddress"]
  L61_215 = A0_154["policies.remoteEndAddress"]
  L62_216 = A0_154["policies.remoteSubnetmask"]
  L64_218 = A0_154["policies.remotePrefixLength"]
  L65_219 = A0_154["policies.ipsecSPIIn"]
  L66_220 = A0_154["policies.ipsecSPIOut"]
  L67_221 = A0_154["policies.encryptionKeyIn"]
  L68_222 = A0_154["policies.encryptionKeyOut"]
  L69_223 = A0_154["policies.authKeyIn"]
  L70_224 = A0_154["policies.authKeyOut"]
  L71_225 = A0_154["policies.autoPolicyType"]
  L72_226 = A0_154["policies.saLifeTimeVpn"]
  L73_227 = A0_154["policies.saLifeTimeType"]
  L74_228 = stringTonumber
  L75_229 = L73_227
  L76_230 = _UPVALUE19_
  L77_231 = 1
  L75_229 = L74_228(L75_229, L76_230, L77_231)
  L73_227 = L75_229
  L2_156 = L74_228
  L74_228, L75_229 = nil, nil
  L75_229 = A0_154["policies.pfsKeyGroup1"]
  L74_228 = A0_154["policies.pfsKeyGroup"]
  if L74_228 == "1" then
    L74_228 = L75_229
  end
  L76_230 = A0_154["policies.backupPolicyName"]
  L77_231 = A0_154["policies.failBackTime"]
  L78_232 = A0_154["policies.ipsecPolicyType"]
  L79_233 = A0_154["policies.modeConfigStatus"]
  L80_234 = A0_154["policies.rvgStatus"]
  L81_235 = A0_154["policies.policyDescr"]
  L82_236, L83_237 = nil, nil
  if L35_189 == 0 then
    if L37_191 == _UPVALUE0_.NIL then
      L37_191 = "0"
    end
    if L32_186 == _UPVALUE0_.NIL then
      L32_186 = "0"
    end
    L50_204 = "1"
  end
  _UPVALUE20_.start()
  if L38_192 == "1" then
    if L17_171 == _UPVALUE0_.NIL or L17_171 == _UPVALUE0_.EMPTY then
      L17_171 = "0"
    end
    L82_236, L83_237 = _UPVALUE21_.ikePolicyCreate(L3_157, L4_158, L5_159, L6_160, L7_161, L8_162, L9_163, L10_164, L15_169, L17_171, L19_173, L20_174, L21_175, L22_176, L23_177, L24_178, L25_179, L26_180, L27_181, L28_182, L29_183, L30_184, L31_185, L32_186, L33_187, L34_188, L79_233)
    if L82_236 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in configuring values in  policies PAGE ike group set" .. L82_236)
      _UPVALUE20_.abort()
      return L82_236
    end
  end
  if L36_190 == 0 then
    L59_213 = 0
  end
  if L40_194 == 1 and L59_213 == 0 then
    if tostring(L7_161) ~= "0" then
      L71_225 = "2"
    else
      L71_225 = "1"
    end
  else
    L71_225 = "0"
  end
  if L37_191 == _UPVALUE0_.NIL then
    L37_191 = "0"
  end
  if L51_205 == _UPVALUE0_.NIL or L51_205 == _UPVALUE0_.EMPTY then
    L51_205 = "0"
  end
  L82_236, L83_237 = _UPVALUE22_.vpnPolicyCreate(L3_157, L35_189, L36_190, L37_191, L38_192, L39_193, L40_194, L41_195, L42_196, L43_197, L44_198, L45_199, L46_200, L47_201, L48_202, L49_203, L50_204, L51_205, L52_206, L54_208, L55_209, L56_210, L57_211, L58_212, L59_213, L60_214, L61_215, L62_216, L64_218, L65_219, L66_220, L67_221, L68_222, L69_223, L70_224, L71_225, L72_226, L73_227, L74_228, L76_230, L77_231, L78_232, L11_165, L79_233, L80_234, L34_188)
  if L82_236 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in  policies PAGE vpn group set" .. L82_236)
    _UPVALUE20_.abort()
    return L82_236
  end
  _UPVALUE20_.complete()
  _UPVALUE20_.save()
  return _UPVALUE0_.SUCCESS, L83_237
end
function policiesSectionDelete(A0_238)
  local L1_239, L2_240, L3_241, L4_242, L5_243, L6_244, L7_245, L8_246, L9_247
  L1_239 = ACCESS_LEVEL
  if L1_239 ~= 0 then
    L1_239 = util
    L1_239 = L1_239.appendDebugOut
    L2_240 = "Detected Unauthorized access for page policies PAGE"
    L1_239(L2_240)
    L1_239 = _UPVALUE0_
    L1_239 = L1_239.UNAUTHORIZED
    return L1_239
  end
  L1_239 = A0_238["policies.cookie"]
  if L1_239 == nil then
    L2_240 = util
    L2_240 = L2_240.appendDebugOut
    L3_241 = "Delete : Invalid Cookie"
    L2_240(L3_241)
    L2_240 = _UPVALUE0_
    L2_240 = L2_240.BAD_PARAMETER
    return L2_240
  end
  L2_240 = {}
  L3_241 = _UPVALUE1_
  L3_241 = L3_241.vpnPolicyGetCur
  L4_242 = L1_239
  L5_243 = L3_241(L4_242)
  L6_244 = _UPVALUE0_
  L6_244 = L6_244.SUCCESS
  if L3_241 ~= L6_244 then
    return L3_241
  end
  L6_244 = _UPVALUE2_
  L7_245 = "."
  L8_246 = _UPVALUE3_
  L8_246 = L8_246.policyName
  L6_244 = L6_244 .. L7_245 .. L8_246
  L6_244 = L5_243[L6_244]
  L7_245 = _UPVALUE2_
  L8_246 = "."
  L9_247 = _UPVALUE3_
  L9_247 = L9_247.policyType
  L7_245 = L7_245 .. L8_246 .. L9_247
  L7_245 = L5_243[L7_245]
  L8_246 = _UPVALUE2_
  L9_247 = "."
  L8_246 = L8_246 .. L9_247 .. "_ROWID_"
  L8_246 = L5_243[L8_246]
  L9_247 = _UPVALUE4_
  L9_247 = L9_247.start
  L9_247()
  L9_247 = _UPVALUE5_
  L9_247 = L9_247.ikePolicyDelete
  L9_247 = L9_247(L8_246)
  if L9_247 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in  policies PAGE vpn delete" .. L9_247)
    _UPVALUE4_.abort()
    return L9_247
  end
  _UPVALUE4_.complete()
  _UPVALUE4_.save()
  return _UPVALUE0_.SUCCESS, L8_246
end
function policiesSectionGetAll()
  local L0_248, L1_249
  L1_249 = {}
  L0_248, L1_249 = _UPVALUE0_.vpnPoliciesGetAll()
  for _FORV_5_, _FORV_6_ in pairs(L1_249) do
    if L1_249[_FORV_5_].AutoPolicyType == "1" or L1_249[_FORV_5_].AutoPolicyType == "2" then
      L1_249[_FORV_5_].VPNPolicyName = L1_249[_FORV_5_].VPNPolicyName .. "*"
    end
    L1_249[_FORV_5_].TunnelOrTransport = _UPVALUE1_[tonumber(L1_249[_FORV_5_].TunnelOrTransport) + 1]
    if L1_249[_FORV_5_].TunnelOrTransport == "2" then
      L1_249[_FORV_5_].TunnelOrTransport = "Transport Mode"
    else
      L1_249[_FORV_5_].TunnelOrTransport = "Tunnel Mode"
    end
    L1_249[_FORV_5_].LocalNetworkType = _UPVALUE2_[tonumber(L1_249[_FORV_5_].LocalNetworkType) + 1]
    if L1_249[_FORV_5_].LocalNetworkType == "2" then
      L1_249[_FORV_5_].LocalNetworkType = L1_249[_FORV_5_].LocalStartAddress
    elseif L1_249[_FORV_5_].LocalNetworkType == "3" then
      L1_249[_FORV_5_].LocalNetworkType = L1_249[_FORV_5_].LocalStartAddress .. "-" .. L1_249[_FORV_5_].LocalEndAddress
    elseif L1_249[_FORV_5_].LocalNetworkType == "4" then
      if L1_249[_FORV_5_].AddressFamily == "2" then
        L1_249[_FORV_5_].LocalNetworkType = L1_249[_FORV_5_].LocalStartAddress .. "/" .. L1_249[_FORV_5_].LocalSubnetMask
      else
        L1_249[_FORV_5_].LocalNetworkType = L1_249[_FORV_5_].LocalStartAddress .. "/" .. L1_249[_FORV_5_].LocalPrefixLength
      end
    else
      L1_249[_FORV_5_].LocalNetworkType = L1_249[_FORV_5_].LocalNetworkType
      L1_249[_FORV_5_].LocalNetworkType = "Any"
    end
    L1_249[_FORV_5_].RemoteNetworkType = _UPVALUE2_[tonumber(L1_249[_FORV_5_].RemoteNetworkType) + 1]
    if L1_249[_FORV_5_].RemoteNetworkType == "2" then
      L1_249[_FORV_5_].RemoteNetworkType = L1_249[_FORV_5_].RemoteStartAddress
    elseif L1_249[_FORV_5_].RemoteNetworkType == "3" then
      L1_249[_FORV_5_].RemoteNetworkType = L1_249[_FORV_5_].RemoteStartAddress .. "-" .. L1_249[_FORV_5_].RemoteEndAddress
    elseif L1_249[_FORV_5_].RemoteNetworkType == "4" then
      if L1_249[_FORV_5_].AddressFamily == "2" then
        L1_249[_FORV_5_].RemoteNetworkType = L1_249[_FORV_5_].RemoteStartAddress .. "/" .. L1_249[_FORV_5_].RemoteSubnetMask
      else
        L1_249[_FORV_5_].RemoteNetworkType = L1_249[_FORV_5_].RemoteStartAddress .. "/" .. L1_249[_FORV_5_].RemotePrefixLength
      end
    else
      L1_249[_FORV_5_].RemoteNetworkType = L1_249[_FORV_5_].RemoteNetworkType
      L1_249[_FORV_5_].RemoteNetworkType = "Any"
    end
    L1_249[_FORV_5_].EncryptionAlgorithm = encrAlgoToString(L1_249[_FORV_5_].EncryptionAlgorithm)
    L1_249[_FORV_5_].AuthAlgorithm = authAlgoToString(L1_249[_FORV_5_].AuthAlgorithm)
  end
  return L0_248, L1_249
end
function ikepoliciesGetAll()
  local L0_250, L1_251
  L0_250 = _UPVALUE0_
  L0_250 = L0_250.ikePoliciesGetAll
  L1_251 = L0_250()
  if L0_250 ~= _UPVALUE1_.SUCCESS then
    return L0_250
  end
  return _UPVALUE1_.SUCCESS, L1_251
end
function policiesSectionGetCur(A0_252)
  local L1_253, L2_254, L3_255, L4_256, L5_257, L6_258, L7_259, L8_260, L9_261, L10_262, L11_263, L12_264, L13_265, L14_266, L15_267, L16_268, L17_269
  L2_254 = {}
  L3_255 = {}
  L4_256 = {}
  L5_257 = {}
  L6_258 = nil
  L7_259 = _UPVALUE0_
  L7_259 = L7_259.vpnPolicyGetCur
  L8_260 = A0_252
  L9_261 = L7_259(L8_260)
  L3_255 = L9_261
  A0_252 = L8_260
  L1_253 = L7_259
  L7_259 = _UPVALUE1_
  L7_259 = L7_259.SUCCESS
  if L1_253 ~= L7_259 then
    return L1_253
  end
  L7_259 = _UPVALUE2_
  L8_260 = "."
  L9_261 = _UPVALUE3_
  L9_261 = L9_261.addressFamily
  L7_259 = L7_259 .. L8_260 .. L9_261
  L7_259 = L3_255[L7_259]
  if L7_259 == "2" then
    L7_259 = "1"
  else
    L7_259 = "2"
  end
  L4_256["ikePolicy.addressFamily"] = L7_259
  L5_257["vpnPolicy.returnCode"] = L1_253
  L5_257["vpnPolicy.cookie"] = A0_252
  L8_260 = _UPVALUE2_
  L9_261 = "."
  L10_262 = _UPVALUE3_
  L10_262 = L10_262.policyName
  L8_260 = L8_260 .. L9_261 .. L10_262
  L8_260 = L3_255[L8_260]
  L5_257["vpnPolicy.policyName"] = L8_260
  L8_260 = _UPVALUE2_
  L9_261 = "."
  L10_262 = _UPVALUE3_
  L10_262 = L10_262.policyType
  L8_260 = L8_260 .. L9_261 .. L10_262
  L8_260 = L3_255[L8_260]
  if L8_260 == "1" then
    L8_260 = _UPVALUE4_
    L8_260 = L8_260.ikePolicyGetCur
    L9_261 = L5_257["vpnPolicy.policyName"]
    L10_262 = L8_260(L9_261)
    L2_254 = L10_262
    L6_258 = L9_261
    L1_253 = L8_260
    L8_260 = _UPVALUE1_
    L8_260 = L8_260.SUCCESS
    if L1_253 ~= L8_260 then
      return L1_253
    end
    L8_260 = _UPVALUE5_
    L9_261 = "."
    L10_262 = _UPVALUE3_
    L10_262 = L10_262.policyDirection
    L8_260 = L8_260 .. L9_261 .. L10_262
    L8_260 = L2_254[L8_260]
    L9_261 = _UPVALUE6_
    L10_262 = tonumber
    L11_263 = L8_260
    L10_262 = L10_262(L11_263)
    L10_262 = L10_262 + 1
    L9_261 = L9_261[L10_262]
    L4_256["ikePolicy.policyDirection"] = L9_261
    L9_261 = _UPVALUE5_
    L10_262 = "."
    L11_263 = _UPVALUE3_
    L11_263 = L11_263.exchangeMode
    L9_261 = L9_261 .. L10_262 .. L11_263
    L9_261 = L2_254[L9_261]
    L10_262 = _UPVALUE7_
    L11_263 = tonumber
    L12_264 = L9_261
    L11_263 = L11_263(L12_264)
    L11_263 = L11_263 + 1
    L10_262 = L10_262[L11_263]
    L4_256["ikePolicy.exchangeMode"] = L10_262
    L10_262 = _UPVALUE5_
    L11_263 = "."
    L12_264 = _UPVALUE3_
    L12_264 = L12_264.policyVersion
    L10_262 = L10_262 .. L11_263 .. L12_264
    L10_262 = L2_254[L10_262]
    L11_263 = _UPVALUE8_
    L12_264 = tonumber
    L13_265 = L10_262
    L12_264 = L12_264(L13_265)
    L11_263 = L11_263[L12_264]
    L4_256["ikePolicy.policyVersion"] = L11_263
    L11_263 = _UPVALUE5_
    L12_264 = "."
    L13_265 = _UPVALUE3_
    L13_265 = L13_265.localIdentifierType
    L11_263 = L11_263 .. L12_264 .. L13_265
    L11_263 = L2_254[L11_263]
    L12_264 = _UPVALUE9_
    L13_265 = tonumber
    L14_266 = L11_263
    L13_265 = L13_265(L14_266)
    L13_265 = L13_265 + 1
    L12_264 = L12_264[L13_265]
    L4_256["ikePolicy.localIdentifierType"] = L12_264
    L12_264 = _UPVALUE5_
    L13_265 = "."
    L14_266 = _UPVALUE3_
    L14_266 = L14_266.localIdentifier
    L12_264 = L12_264 .. L13_265 .. L14_266
    L12_264 = L2_254[L12_264]
    L4_256["ikePolicy.localIdentifier"] = L12_264
    L12_264 = _UPVALUE5_
    L13_265 = "."
    L14_266 = _UPVALUE3_
    L14_266 = L14_266.remoteIdentifierType
    L12_264 = L12_264 .. L13_265 .. L14_266
    L12_264 = L2_254[L12_264]
    L13_265 = _UPVALUE10_
    L14_266 = tonumber
    L15_267 = L12_264
    L14_266 = L14_266(L15_267)
    L14_266 = L14_266 + 1
    L13_265 = L13_265[L14_266]
    L4_256["ikePolicy.remoteIdentifierType"] = L13_265
    L13_265 = _UPVALUE5_
    L14_266 = "."
    L15_267 = _UPVALUE3_
    L15_267 = L15_267.remoteIdentifier
    L13_265 = L13_265 .. L14_266 .. L15_267
    L13_265 = L2_254[L13_265]
    L4_256["ikePolicy.remoteIdentifier"] = L13_265
    L13_265 = _UPVALUE5_
    L14_266 = "."
    L15_267 = _UPVALUE3_
    L15_267 = L15_267.encryptionAlgo
    L13_265 = L13_265 .. L14_266 .. L15_267
    L13_265 = L2_254[L13_265]
    if L13_265 ~= nil then
      L14_266 = ikeEncrAlgoToString
      L15_267 = L13_265
      L14_266 = L14_266(L15_267)
      L4_256["ikePolicy.encryptionAlgo"] = L14_266
      L14_266 = util
      L14_266 = L14_266.split
      L15_267 = L4_256["ikePolicy.encryptionAlgo"]
      L14_266 = L14_266(L15_267, L16_268)
      L15_267 = 0
      for _FORV_21_, _FORV_22_ in pairs(L14_266) do
        if _FORV_22_ == "DES" then
          L4_256["ikePolicy.Des"] = "1"
        end
        if _FORV_22_ == "3DES" then
          L4_256["ikePolicy.3Des"] = "1"
        end
        if _FORV_22_ == "AES-128" then
          L4_256["ikePolicy.AES128"] = "1"
        end
        if _FORV_22_ == "AES-192" then
          L4_256["ikePolicy.AES192"] = "1"
        end
        if _FORV_22_ == "AES-256" then
          L4_256["ikePolicy.AES256"] = "1"
        end
        if _FORV_22_ == "BLOWFISH" then
          L4_256["ikePolicy.BLOWFISH"] = "1"
          L15_267 = L2_254[_UPVALUE5_ .. "." .. _UPVALUE3_.encryptionAlgoKeyLength]
          L4_256["ikePolicy.KeyLengthBLOWFISH"] = L16_268
        end
        if _FORV_22_ == "CAST128" then
          L4_256["ikePolicy.CAST128"] = "1"
          L15_267 = L2_254[_UPVALUE5_ .. "." .. _UPVALUE3_.encryptionAlgoKeyLength]
          if util.split(L15_267, ",")[2] == nil then
          else
          end
          L4_256["ikePolicy.KeyLengthCAST128"] = L17_269
        end
      end
    end
    L14_266 = _UPVALUE5_
    L15_267 = "."
    L14_266 = L14_266 .. L15_267 .. L16_268
    L14_266 = L2_254[L14_266]
    if L14_266 ~= nil then
      L15_267 = ikeAuthAlgoToString
      L15_267 = L15_267(L16_268)
      L4_256["ikePolicy.authenticationAlgo"] = L15_267
      L15_267 = util
      L15_267 = L15_267.split
      L15_267 = L15_267(L16_268, L17_269)
      for _FORV_19_, _FORV_20_ in L16_268(L17_269) do
        if _FORV_20_ == "MD5" then
          L4_256["ikePolicy.Md5"] = "1"
        end
        if _FORV_20_ == "SHA1" then
          L4_256["ikePolicy.Sha1"] = "1"
        end
        if _FORV_20_ == "SHA2-256" then
          L4_256["ikePolicy.Sha2256"] = "1"
        end
        if _FORV_20_ == "SHA2-384" then
          L4_256["ikePolicy.Sha2384"] = "1"
        end
        if _FORV_20_ == "SHA2-512" then
          L4_256["ikePolicy.Sha2512"] = "1"
        end
        if _FORV_20_ == "NONE" then
          L4_256["ikePolicy.NONE"] = "1"
        end
      end
    end
    L15_267 = _UPVALUE5_
    L15_267 = L15_267 .. L16_268 .. L17_269
    L15_267 = L2_254[L15_267]
    L4_256["ikePolicy.authenticationType"] = L16_268
    L4_256["ikePolicy.presharedKey"] = L16_268
    L4_256["ikePolicy.dhGroup"] = L16_268
    L4_256["ikePolicy.saLifeTime"] = L16_268
    L4_256["ikePolicy.DPD"] = L16_268
    L4_256["ikePolicy.DPDDetectionPeriod"] = L16_268
    L4_256["ikePolicy.DPDFailureCount"] = L16_268
    if L16_268 == "0" or L16_268 == "1" then
      L4_256["ikePolicy.extendedAuthentication"] = L17_269
    else
      L4_256["ikePolicy.extendedAuthentication"] = "3"
      if L16_268 == "2" then
        L4_256["ikePolicy.extendedAuthType"] = "1"
      elseif L16_268 == "3" then
        L4_256["ikePolicy.extendedAuthType"] = "2"
      elseif L16_268 == "4" then
        L4_256["ikePolicy.extendedAuthType"] = "3"
      elseif L16_268 == "5" then
        L4_256["ikePolicy.extendedAuthType"] = "4"
      elseif L16_268 == "6" then
        L4_256["ikePolicy.extendedAuthType"] = "5"
      elseif L16_268 == "7" then
        L4_256["ikePolicy.extendedAuthType"] = "6"
      elseif L16_268 == "8" then
        L4_256["ikePolicy.extendedAuthType"] = "7"
      elseif L16_268 == "9" then
        L4_256["ikePolicy.extendedAuthType"] = "8"
      elseif L16_268 == "10" then
        L4_256["ikePolicy.extendedAuthType"] = "9"
      end
    end
    L4_256["ikePolicy.XAUTHProfile"] = L17_269
    L4_256["ikePolicy.userName"] = L17_269
    L4_256["ikePolicy.password"] = L17_269
    L4_256["ikePolicy.natTraversal"] = L17_269
    L4_256["ikePolicy.natKeepAliveTime"] = L17_269
  end
  L8_260 = _UPVALUE2_
  L9_261 = "."
  L10_262 = _UPVALUE3_
  L10_262 = L10_262.protocol
  L8_260 = L8_260 .. L9_261 .. L10_262
  L8_260 = L3_255[L8_260]
  L9_261 = _UPVALUE13_
  L10_262 = tonumber
  L11_263 = L8_260
  L10_262 = L10_262(L11_263)
  L10_262 = L10_262 + 1
  L9_261 = L9_261[L10_262]
  L5_257["vpnPolicy.protocol"] = L9_261
  L9_261 = _UPVALUE2_
  L10_262 = "."
  L11_263 = _UPVALUE3_
  L11_263 = L11_263.ipsecMode
  L9_261 = L9_261 .. L10_262 .. L11_263
  L9_261 = L3_255[L9_261]
  L10_262 = _UPVALUE14_
  L11_263 = tonumber
  L12_264 = L9_261
  L11_263 = L11_263(L12_264)
  L11_263 = L11_263 + 1
  L10_262 = L10_262[L11_263]
  L5_257["vpnPolicy.ipsecMode"] = L10_262
  L10_262 = _UPVALUE2_
  L11_263 = "."
  L12_264 = _UPVALUE3_
  L12_264 = L12_264.dhcpOverIpsec
  L10_262 = L10_262 .. L11_263 .. L12_264
  L10_262 = L3_255[L10_262]
  L5_257["vpnPolicy.dhcpOverIpsec"] = L10_262
  L10_262 = _UPVALUE2_
  L11_263 = "."
  L12_264 = _UPVALUE3_
  L12_264 = L12_264.policyType
  L10_262 = L10_262 .. L11_263 .. L12_264
  L10_262 = L3_255[L10_262]
  L11_263 = _UPVALUE15_
  L12_264 = tonumber
  L13_265 = L10_262
  L12_264 = L12_264(L13_265)
  L11_263 = L11_263[L12_264]
  L5_257["vpnPolicy.policyType"] = L11_263
  L11_263 = _UPVALUE2_
  L12_264 = "."
  L13_265 = _UPVALUE3_
  L13_265 = L13_265.l2tpIpsecPolicy
  L11_263 = L11_263 .. L12_264 .. L13_265
  L11_263 = L3_255[L11_263]
  L5_257["vpnPolicy.L2tpIpsecPolicy"] = L11_263
  L11_263 = _UPVALUE2_
  L12_264 = "."
  L13_265 = _UPVALUE3_
  L13_265 = L13_265.localGateway
  L11_263 = L11_263 .. L12_264 .. L13_265
  L11_263 = L3_255[L11_263]
  L12_264 = _UPVALUE16_
  L13_265 = tonumber
  L14_266 = L11_263
  L13_265 = L13_265(L14_266)
  L13_265 = L13_265 + 1
  L12_264 = L12_264[L13_265]
  L5_257["vpnPolicy.localGateway"] = L12_264
  L12_264 = _UPVALUE2_
  L13_265 = "."
  L14_266 = _UPVALUE3_
  L14_266 = L14_266.remoteEndPointType
  L12_264 = L12_264 .. L13_265 .. L14_266
  L12_264 = L3_255[L12_264]
  L13_265 = _UPVALUE17_
  L14_266 = tonumber
  L15_267 = L12_264
  L14_266 = L14_266(L15_267)
  L14_266 = L14_266 + 1
  L13_265 = L13_265[L14_266]
  L5_257["vpnPolicy.remoteEndPointType"] = L13_265
  L13_265 = _UPVALUE2_
  L14_266 = "."
  L15_267 = _UPVALUE3_
  L15_267 = L15_267.remoteEndPoint
  L13_265 = L13_265 .. L14_266 .. L15_267
  L13_265 = L3_255[L13_265]
  L5_257["vpnPolicy.remoteEndPoint"] = L13_265
  L13_265 = _UPVALUE2_
  L14_266 = "."
  L15_267 = _UPVALUE3_
  L15_267 = L15_267.netbios
  L13_265 = L13_265 .. L14_266 .. L15_267
  L13_265 = L3_255[L13_265]
  L5_257["vpnPolicy.netbios"] = L13_265
  L13_265 = _UPVALUE2_
  L14_266 = "."
  L15_267 = _UPVALUE3_
  L15_267 = L15_267.rollover
  L13_265 = L13_265 .. L14_266 .. L15_267
  L13_265 = L3_255[L13_265]
  L5_257["vpnPolicy.rollover"] = L13_265
  L13_265 = _UPVALUE2_
  L14_266 = "."
  L15_267 = _UPVALUE3_
  L15_267 = L15_267.rolloverGateway
  L13_265 = L13_265 .. L14_266 .. L15_267
  L13_265 = L3_255[L13_265]
  L5_257["vpnPolicy.rolloverGateway"] = L13_265
  L13_265 = _UPVALUE2_
  L14_266 = "."
  L15_267 = _UPVALUE3_
  L15_267 = L15_267.keepAlive
  L13_265 = L13_265 .. L14_266 .. L15_267
  L13_265 = L3_255[L13_265]
  L5_257["vpnPolicy.keepAlive"] = L13_265
  L13_265 = _UPVALUE2_
  L14_266 = "."
  L15_267 = _UPVALUE3_
  L15_267 = L15_267.keepAliveSourceAddress
  L13_265 = L13_265 .. L14_266 .. L15_267
  L13_265 = L3_255[L13_265]
  L5_257["vpnPolicy.keepAliveSourceAddress"] = L13_265
  L13_265 = _UPVALUE2_
  L14_266 = "."
  L15_267 = _UPVALUE3_
  L15_267 = L15_267.remotePingIPAddress
  L13_265 = L13_265 .. L14_266 .. L15_267
  L13_265 = L3_255[L13_265]
  L5_257["vpnPolicy.remotePingIPAddress"] = L13_265
  L13_265 = _UPVALUE2_
  L14_266 = "."
  L15_267 = _UPVALUE3_
  L15_267 = L15_267.keepAlivePeriod
  L13_265 = L13_265 .. L14_266 .. L15_267
  L13_265 = L3_255[L13_265]
  L5_257["vpnPolicy.keepAlivePeriod"] = L13_265
  L13_265 = _UPVALUE2_
  L14_266 = "."
  L15_267 = _UPVALUE3_
  L15_267 = L15_267.keepAliveFailureCount
  L13_265 = L13_265 .. L14_266 .. L15_267
  L13_265 = L3_255[L13_265]
  L5_257["vpnPolicy.keepAliveFailureCount"] = L13_265
  L13_265 = _UPVALUE2_
  L14_266 = "."
  L15_267 = _UPVALUE3_
  L15_267 = L15_267.encryptionAlgo
  L13_265 = L13_265 .. L14_266 .. L15_267
  L13_265 = L3_255[L13_265]
  L5_257["vpnPolicy.encryptionAlgo"] = L13_265
  L14_266 = L5_257["vpnPolicy.policyType"]
  if L14_266 == "1" then
    L14_266 = encrAlgoToString
    L15_267 = L13_265
    L14_266 = L14_266(L15_267)
    L5_257["vpnPolicy.encryptionAlgo"] = L14_266
    L14_266 = util
    L14_266 = L14_266.split
    L15_267 = L5_257["vpnPolicy.encryptionAlgo"]
    L14_266 = L14_266(L15_267, L16_268)
    L15_267 = 0
    for _FORV_21_, _FORV_22_ in pairs(L14_266) do
      if _FORV_22_ == "DES" then
        L5_257["vpnPolicy.Phase2DES"] = "1"
      end
      if _FORV_22_ == "None" then
        L5_257["vpnPolicy.Phase2EncrNONE"] = "1"
      end
      if _FORV_22_ == "3DES" then
        L5_257["vpnPolicy.Phase23DES"] = "1"
      end
      if _FORV_22_ == "AES-128" then
        L5_257["vpnPolicy.Phase2AES128"] = "1"
      end
      if _FORV_22_ == "AES-192" then
        L5_257["vpnPolicy.Phase2AES192"] = "1"
      end
      if _FORV_22_ == "AES-256" then
        L5_257["vpnPolicy.Phase2AES256"] = "1"
      end
      if _FORV_22_ == "AESCCM" then
        L5_257["vpnPolicy.Phase2AESCCM"] = "1"
      end
      if _FORV_22_ == "AESGCM" then
        L5_257["vpnPolicy.Phase2AESGCM"] = "1"
      end
      if _FORV_22_ == "TWOFISH-128" then
        L5_257["vpnPolicy.Phase2TWOFISH128"] = "1"
      end
      if _FORV_22_ == "TWOFISH-192" then
        L5_257["vpnPolicy.Phase2TWOFISH192"] = "1"
      end
      if _FORV_22_ == "TWOFISH-256" then
        L5_257["vpnPolicy.Phase2TWOFISH256"] = "1"
      end
      if _FORV_22_ == "BLOWFISH" then
        L5_257["vpnPolicy.Phase2BLOWFISH"] = "1"
        L15_267 = L3_255[_UPVALUE2_ .. "." .. _UPVALUE3_.encryptionAlgoKeyLength]
        L5_257["vpnPolicy.Phase2KeyLengthBLOWFISH"] = L16_268[1]
      end
      if _FORV_22_ == "CAST128" then
        L5_257["vpnPolicy.Phase2Cast128"] = "1"
        L15_267 = L3_255[_UPVALUE2_ .. "." .. _UPVALUE3_.encryptionAlgoKeyLength]
        if util.split(L15_267, ",")[2] == nil then
        else
        end
        L5_257["vpnPolicy.Phase2KeyLengthCast128"] = L17_269
      end
    end
  end
  L14_266 = _UPVALUE2_
  L15_267 = "."
  L14_266 = L14_266 .. L15_267 .. L16_268
  L14_266 = L3_255[L14_266]
  L5_257["vpnPolicy.encryptionAlgoKeyLength"] = L14_266
  L14_266 = _UPVALUE2_
  L15_267 = "."
  L14_266 = L14_266 .. L15_267 .. L16_268
  L14_266 = L3_255[L14_266]
  L5_257["vpnPolicy.authenticationAlgo"] = L14_266
  L15_267 = L5_257["vpnPolicy.policyType"]
  if L15_267 == "1" then
    L15_267 = authAlgoToString
    L15_267 = L15_267(L16_268)
    L5_257["vpnPolicy.authenticationAlgo"] = L15_267
    L15_267 = util
    L15_267 = L15_267.split
    L15_267 = L15_267(L16_268, L17_269)
    for _FORV_19_, _FORV_20_ in L16_268(L17_269) do
      if _FORV_20_ == "MD5" then
        L5_257["vpnPolicy.Phase2Md5"] = "1"
      end
      if _FORV_20_ == "SHA1" then
        L5_257["vpnPolicy.Phase2Sha1"] = "1"
      end
      if _FORV_20_ == "SHA2-256" then
        L5_257["vpnPolicy.Phase2Sha256"] = "1"
      end
      if _FORV_20_ == "SHA2-384" then
        L5_257["vpnPolicy.Phase2Sha384"] = "1"
      end
      if _FORV_20_ == "SHA2-512" then
        L5_257["vpnPolicy.Phase2Sha512"] = "1"
      end
      if _FORV_20_ == "SHA2-224" then
        L5_257["vpnPolicy.Phase2Sha224"] = "1"
      end
    end
  end
  L15_267 = _UPVALUE2_
  L15_267 = L15_267 .. L16_268 .. L17_269
  L15_267 = L3_255[L15_267]
  L5_257["vpnPolicy.localNetworkType"] = L16_268
  L5_257["vpnPolicy.localStartIP"] = L16_268
  L5_257["vpnPolicy.localEndIP"] = L16_268
  L5_257["vpnPolicy.localSubnetmask"] = L16_268
  L5_257["vpnPolicy.localPrefixLength"] = L16_268
  L5_257["vpnPolicy.remoteNetworkType"] = L17_269
  L5_257["vpnPolicy.remoteStartAddress"] = L17_269
  L5_257["vpnPolicy.remoteEndAddress"] = L17_269
  L5_257["vpnPolicy.remoteSubnetmask"] = L17_269
  L5_257["vpnPolicy.remotePrefixLength"] = L17_269
  L5_257["vpnPolicy.ipsecSPIIn"] = L17_269
  L5_257["vpnPolicy.ipsecSPIOut"] = L17_269
  L5_257["vpnPolicy.encryptionKeyIn"] = L17_269
  L5_257["vpnPolicy.encryptionKeyOut"] = L17_269
  L5_257["vpnPolicy.authKeyIn"] = L17_269
  L5_257["vpnPolicy.authKeyOut"] = L17_269
  L5_257["vpnPolicy.autoPolicyType"] = L17_269
  L5_257["vpnPolicy.saLifeTime"] = L17_269
  L5_257["vpnPolicy.saLifeTimeType"] = _UPVALUE19_[tonumber(L17_269) + 1]
  if L5_257["vpnPolicy.policyType"] == "1" then
    if L3_255[_UPVALUE2_ .. "." .. _UPVALUE3_.pfsKeyGroup] == "1" or L3_255[_UPVALUE2_ .. "." .. _UPVALUE3_.pfsKeyGroup] == "2" or L3_255[_UPVALUE2_ .. "." .. _UPVALUE3_.pfsKeyGroup] == "5" or L3_255[_UPVALUE2_ .. "." .. _UPVALUE3_.pfsKeyGroup] == "14" or L3_255[_UPVALUE2_ .. "." .. _UPVALUE3_.pfsKeyGroup] == "15" or L3_255[_UPVALUE2_ .. "." .. _UPVALUE3_.pfsKeyGroup] == "16" or L3_255[_UPVALUE2_ .. "." .. _UPVALUE3_.pfsKeyGroup] == "17" or L3_255[_UPVALUE2_ .. "." .. _UPVALUE3_.pfsKeyGroup] == "18" then
      L5_257["vpnPolicy.pfsKeyGroup1"], L5_257["vpnPolicy.pfsKeyGroup"] = L3_255[_UPVALUE2_ .. "." .. _UPVALUE3_.pfsKeyGroup], "1"
    else
      L5_257["vpnPolicy.pfsKeyGroup"] = "0"
    end
  end
  L5_257["vpnPolicy.backupPolicyName"] = L3_255[_UPVALUE2_ .. "." .. _UPVALUE3_.backupPolicyName]
  L5_257["vpnPolicy.failBackTime"] = L3_255[_UPVALUE2_ .. "." .. _UPVALUE3_.failBackTime]
  L5_257["vpnPolicy.ipsecPolicyType"] = L3_255[_UPVALUE2_ .. "." .. _UPVALUE3_.ipsecPolicyType]
  L5_257["vpnPolicy.modeConfigStatus"] = L3_255[_UPVALUE2_ .. "." .. _UPVALUE3_.modeConfigStatus]
  L5_257["vpnPolicy.policyDescr"] = L3_255[_UPVALUE2_ .. "." .. _UPVALUE3_.policyDescr]
  L5_257["vpnPolicy.rvgStatus"] = L3_255[_UPVALUE2_ .. "." .. _UPVALUE3_.rvgStatus]
  return _UPVALUE1_.SUCCESS, A0_252, L4_256, L5_257
end
function policiesSectionDeleteAll()
  local L0_270
  L0_270 = ACCESS_LEVEL
  if L0_270 ~= 0 then
    L0_270 = util
    L0_270 = L0_270.appendDebugOut
    L0_270("Detected Unauthorized access for page policies PAGE")
    L0_270 = _UPVALUE0_
    L0_270 = L0_270.UNAUTHORIZED
    return L0_270
  end
  L0_270 = _UPVALUE1_
  L0_270 = L0_270.start
  L0_270()
  L0_270 = _UPVALUE2_
  L0_270 = L0_270.ikePoliciesDeleteAll
  L0_270 = L0_270()
  if L0_270 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in DeleteAll Operaion in page policies PAGE vpn section" .. L0_270)
    _UPVALUE1_.abort()
    return L0_270
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function policiesStatusSet(A0_271)
  local L1_272, L2_273, L3_274, L4_275, L5_276, L6_277
  L1_272 = ACCESS_LEVEL
  if L1_272 ~= 0 then
    L1_272 = util
    L1_272 = L1_272.appendDebugOut
    L2_273 = "Detected Unauthorized access for page policies PAGE"
    L1_272(L2_273)
    L1_272 = _UPVALUE0_
    L1_272 = L1_272.UNAUTHORIZED
    return L1_272
  end
  L1_272, L2_273 = nil, nil
  L3_274 = A0_271["policies.status"]
  L4_275 = A0_271["policies.cookie"]
  L5_276 = nil
  L6_277 = _UPVALUE1_
  L6_277 = L6_277.start
  L6_277()
  if L3_274 == "1" then
    L5_276 = true
  elseif L3_274 == "0" then
    L5_276 = false
  end
  L6_277 = _UPVALUE2_
  L6_277 = L6_277.ipsecVPNPolicyEnable
  L6_277 = L6_277(L4_275, L5_276)
  if L6_277 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in enable/disable Operaion in page policies PAGE vpn section" .. L6_277)
    _UPVALUE1_.abort()
    return L6_277
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L4_275
end
function policiesSectionExport(A0_278)
  local L1_279, L2_280, L3_281
  L1_279 = ACCESS_LEVEL
  if L1_279 ~= 0 then
    L1_279 = util
    L1_279 = L1_279.appendDebugOut
    L2_280 = "Detected Unauthorized access for page policies PAGE"
    L1_279(L2_280)
    L1_279 = _UPVALUE0_
    L1_279 = L1_279.UNAUTHORIZED
    return L1_279
  end
  L1_279 = A0_278["policies.cookie"]
  L2_280 = _UPVALUE1_
  L2_280 = L2_280.exportPolicy
  L3_281 = A0_278
  L3_281 = L2_280(L3_281)
  if L2_280 ~= _UPVALUE0_.SUCCESS then
    return L2_280
  end
  return _UPVALUE0_.SUCCESS, L3_281
end
function policiesSectionDefaultGet()
  local L0_282, L1_283, L3_284, L4_285
  L0_282 = {}
  L1_283 = {}
  L0_282["ikePolicy.policyDirection"] = "3"
  L0_282["ikePolicy.natTraversal"] = "1"
  L0_282["ikePolicy.natKeepAliveTime"] = "20"
  L0_282["ikePolicy.exchangeMode"] = "1"
  L0_282["ikePolicy.policyVersion"] = "1"
  L0_282["ikePolicy.localIdentifierType"] = "1"
  L0_282["ikePolicy.remoteIdentifierType"] = "1"
  L0_282["ikePolicy.authenticationType"] = "1"
  L0_282["ikePolicy.dhGroup"] = "2"
  L0_282["ikePolicy.saLifeTime"] = "28800"
  L0_282["ikePolicy.extendedAuthentication"] = "1"
  L0_282["ikePolicy.addressFamily"] = "1"
  L1_283["vpnPolicy.protocol"] = "2"
  L1_283["vpnPolicy.L2tpIpsecPolicy"] = "0"
  L1_283["vpnPolicy.ipsecMode"] = "1"
  L1_283["vpnPolicy.policyType"] = "1"
  L1_283["vpnPolicy.localGateway"] = "1"
  L1_283["vpnPolicy.remoteEndPointType"] = "1"
  L1_283["vpnPolicy.localNetworkType"] = "4"
  L1_283["vpnPolicy.remoteNetworkType"] = "4"
  L0_282["ikePolicy.AES128"] = "1"
  L0_282["ikePolicy.Sha1"] = "1"
  L1_283["vpnPolicy.saLifeTime"] = "3600"
  L1_283["vpnPolicy.Phase2AES128"] = "1"
  L1_283["vpnPolicy.Phase2Sha1"] = "1"
  L0_282["ikePolicy.3Des"] = "1"
  L1_283["vpnPolicy.Phase23DES"] = "1"
  L3_284 = _UPVALUE0_
  L3_284 = L3_284.SUCCESS
  L4_285 = L0_282
  return L3_284, L4_285, L1_283
end
function ikeConfigGet(A0_286)
  if A0_286 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if _UPVALUE1_.ikePolicyGetCur(A0_286) ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE1_.ikePolicyGetCur(A0_286)
  end
  return _UPVALUE1_.ikePolicyGetCur(A0_286)
end
function stringTonumber(A0_287, A1_288, A2_289)
  if A0_287 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  for _FORV_6_, _FORV_7_ in pairs(A1_288) do
    if _FORV_7_ == A0_287 then
      A0_287 = _FORV_6_ - tonumber(A2_289)
      return _UPVALUE0_.SUCCESS, A0_287
    end
  end
  return _UPVALUE0_.FAILURE
end
function encrAlgoToString(A0_290)
  local L1_291
  L1_291 = ""
  A0_290 = math.floor(A0_290 / 2)
  if A0_290 % 2 ~= 0 then
    L1_291 = L1_291 .. " DES"
  end
  A0_290 = math.floor(A0_290 / 2)
  if A0_290 % 2 ~= 0 then
    L1_291 = L1_291 .. " 3DES"
  end
  A0_290 = math.floor(A0_290 / 2)
  if A0_290 % 2 ~= 0 then
    L1_291 = L1_291 .. " AES-128"
  end
  A0_290 = math.floor(A0_290 / 2)
  if A0_290 % 2 ~= 0 then
    L1_291 = L1_291 .. " AES-192"
  end
  A0_290 = math.floor(A0_290 / 2)
  if A0_290 % 2 ~= 0 then
    L1_291 = L1_291 .. " AES-256"
  end
  A0_290 = math.floor(A0_290 / 2)
  if A0_290 % 2 ~= 0 then
    L1_291 = L1_291 .. " AESCCM"
  end
  A0_290 = math.floor(A0_290 / 2)
  if A0_290 % 2 ~= 0 then
    L1_291 = L1_291 .. " AESGCM"
  end
  A0_290 = math.floor(A0_290 / 2)
  if A0_290 % 2 ~= 0 then
    L1_291 = L1_291 .. " TWOFISH-128"
  end
  A0_290 = math.floor(A0_290 / 2)
  if A0_290 % 2 ~= 0 then
    L1_291 = L1_291 .. " TWOFISH-192"
  end
  A0_290 = math.floor(A0_290 / 2)
  if A0_290 % 2 ~= 0 then
    L1_291 = L1_291 .. " TWOFISH-256"
  end
  A0_290 = math.floor(A0_290 / 2)
  if A0_290 % 2 ~= 0 then
    L1_291 = L1_291 .. " BLOWFISH"
  end
  A0_290 = math.floor(A0_290 / 2)
  if A0_290 % 2 ~= 0 then
    L1_291 = L1_291 .. " CAST128"
  end
  if L1_291 == "" then
    L1_291 = L1_291 .. "None"
  end
  return L1_291
end
function authAlgoToString(A0_292)
  local L1_293
  L1_293 = ""
  A0_292 = math.floor(A0_292 / 2)
  if A0_292 % 2 ~= 0 then
    L1_293 = L1_293 .. " MD5"
  end
  A0_292 = math.floor(A0_292 / 2)
  if A0_292 % 2 ~= 0 then
    L1_293 = L1_293 .. " SHA1"
  end
  A0_292 = math.floor(A0_292 / 2)
  if A0_292 % 2 ~= 0 then
    L1_293 = L1_293 .. " SHA2-256"
  end
  A0_292 = math.floor(A0_292 / 2)
  if A0_292 % 2 ~= 0 then
    L1_293 = L1_293 .. " SHA2-384"
  end
  A0_292 = math.floor(A0_292 / 2)
  if A0_292 % 2 ~= 0 then
    L1_293 = L1_293 .. " SHA2-512"
  end
  A0_292 = math.floor(A0_292 / 2)
  if A0_292 % 2 ~= 0 then
    L1_293 = L1_293 .. " SHA2-224"
  end
  if L1_293 == "" then
    L1_293 = L1_293 .. "None"
  end
  return L1_293
end
function ikeEncrAlgoToString(A0_294)
  local L1_295
  L1_295 = ""
  if A0_294 % 2 ~= 0 then
    L1_295 = L1_295 .. " DES"
  end
  A0_294 = math.floor(A0_294 / 2)
  if A0_294 % 2 ~= 0 then
    L1_295 = L1_295 .. " 3DES"
  end
  A0_294 = math.floor(A0_294 / 2)
  if A0_294 % 2 ~= 0 then
    L1_295 = L1_295 .. " AES-128"
  end
  A0_294 = math.floor(A0_294 / 2)
  if A0_294 % 2 ~= 0 then
    L1_295 = L1_295 .. " AES-192"
  end
  A0_294 = math.floor(A0_294 / 2)
  if A0_294 % 2 ~= 0 then
    L1_295 = L1_295 .. " AES-256"
  end
  A0_294 = math.floor(A0_294 / 2)
  if A0_294 % 2 ~= 0 then
    L1_295 = L1_295 .. " BLOWFISH"
  end
  A0_294 = math.floor(A0_294 / 2)
  if A0_294 % 2 ~= 0 then
    L1_295 = L1_295 .. " CAST128"
  end
  return L1_295
end
function ikeAuthAlgoToString(A0_296)
  local L1_297
  L1_297 = ""
  if A0_296 % 2 ~= 0 then
    L1_297 = L1_297 .. " MD5"
  end
  A0_296 = math.floor(A0_296 / 2)
  if A0_296 % 2 ~= 0 then
    L1_297 = L1_297 .. " SHA1"
  end
  A0_296 = math.floor(A0_296 / 2)
  if A0_296 % 2 ~= 0 then
    L1_297 = L1_297 .. " SHA2-256"
  end
  A0_296 = math.floor(A0_296 / 2)
  if A0_296 % 2 ~= 0 then
    L1_297 = L1_297 .. " SHA2-384"
  end
  A0_296 = math.floor(A0_296 / 2)
  if A0_296 % 2 ~= 0 then
    L1_297 = L1_297 .. " SHA2-512"
  end
  if L1_297 == "" then
    L1_297 = L1_297 .. "NONE"
  end
  return L1_297
end
function encryStringToAlgo(A0_298)
  if A0_298 == "DES" then
    A0_298 = "2"
  elseif A0_298 == "3DES" then
    A0_298 = "4"
  elseif A0_298 == "AES-128" then
    A0_298 = "8"
  elseif A0_298 == "AES-192" then
    A0_298 = "16"
  elseif A0_298 == "AES-256" then
    A0_298 = "32"
  elseif A0_298 == "AES-CCM" then
    A0_298 = "64"
  elseif A0_298 == "AES-GCM" then
    A0_298 = "128"
  elseif A0_298("TWOFISH (128)") then
    A0_298 = "256"
  elseif A0_298 == "TWOFISH (192)" then
    A0_298 = "512"
  elseif A0_298 == "NONE" then
    A0_298 = "1"
  elseif A0_298 == "TWOFISH (256)" then
    A0_298 = "1024"
  elseif A0_298 == "BLOWFISH" then
    A0_298 = "2048"
  elseif A0_298 == "CAST128" then
    A0_298 = "4096"
  end
  return A0_298
end
function ikeEncryStringToAlgo(A0_299)
  local L1_300
  if A0_299 == "DES" then
    A0_299 = "2"
  elseif A0_299 == "3DES" then
    A0_299 = "4"
  elseif A0_299 == "AES-128" then
    A0_299 = "8"
  elseif A0_299 == "AES-192" then
    A0_299 = "16"
  elseif A0_299 == "AES-256" then
    A0_299 = "32"
  elseif A0_299 == "BLOWFISH" then
    A0_299 = "64"
  elseif A0_299 == "CAST128" then
    A0_299 = "128"
  end
  return A0_299
end
function authStringToAlgo(A0_301)
  local L1_302
  if A0_301 == "MD5" then
    A0_301 = "2"
  elseif A0_301 == "SHA-1" then
    A0_301 = "4"
  elseif A0_301 == "SHA2-224" then
    A0_301 = "8"
  elseif A0_301 == "SHA2-256" then
    A0_301 = "16"
  elseif A0_301 == "SHA2-384" then
    A0_301 = "32"
  elseif A0_301 == "SHA2-512" then
    A0_301 = "64"
  end
  return A0_301
end
function manualEncryptionAlgo(A0_303)
  local L1_304
  if A0_303 == "1" then
    A0_303 = "2"
  elseif A0_303 == "2" then
    A0_303 = "1"
  elseif A0_303 == "3" then
    A0_303 = "4"
  elseif A0_303 == "4" then
    A0_303 = "8"
  elseif A0_303 == "5" then
    A0_303 = "16"
  elseif A0_303 == "6" then
    A0_303 = "32"
  elseif A0_303 == "7" then
    A0_303 = "64"
  elseif A0_303 == "8" then
    A0_303 = "128"
  elseif A0_303 == "9" then
    A0_303 = "256"
  elseif A0_303 == "10" then
    A0_303 = "512"
  elseif A0_303 == "11" then
    A0_303 = "1024"
  elseif A0_303 == "12" then
    A0_303 = "2048"
  elseif A0_303 == "13" then
    A0_303 = "4096"
  end
  return A0_303
end
function backuPolicyNameGet(A0_305)
  local L1_306
  L1_306, A0_305 = _UPVALUE0_.backupPolicyGet(A0_305)
  if L1_306 ~= _UPVALUE1_.SUCCESS then
    return L1_306
  end
  return _UPVALUE1_.SUCCESS, A0_305
end
function policiesDisableAll()
  local L0_307
  L0_307 = _UPVALUE0_.policyDisableAll()
  if L0_307 ~= _UPVALUE1_.SUCCESS then
    return L0_307
  end
  return _UPVALUE1_.SUCCESS
end
