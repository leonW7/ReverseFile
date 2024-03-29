local L0_0
L0_0 = module
L0_0("com.teamf1.core.ipsec.vpn", package.seeall)
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
L0_0("teamf1lualib/ipsec_export")
L0_0 = require
L0_0("teamf1lualib/services_routeMgmt")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.vipsecure.returnCodes")
serviceRouteTable = "ServicesRouteMgmt"
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
;({}).l2tpIpsecPolicy = "L2tpIpsecPolicy"
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
;({}).vpnPolicyName = "vpnPolicyName"
;({}).routePolicyName = "policyName"
;({}).sourceIPAddress = "sourceIPAddress"
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
elseif PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-500_Ax" or PRODUCT_ID == "DSR-500N_Ax" then
elseif UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-250N" then
else
end
function policyNameGet()
  local L0_1, L1_2
  L0_1 = db
  L0_1 = L0_1.getNextRowId
  L1_2 = "0"
  L0_1 = L0_1(L1_2, _UPVALUE0_)
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(_UPVALUE0_, _UPVALUE1_, L0_1, _UPVALUE2_.policyName)
  if L1_2 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_1, L1_2
end
function policyNameGetNext(A0_3)
  local L1_4, L2_5, L3_6
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if A0_3 ~= L2_5 then
    L2_5 = tonumber
    L3_6 = A0_3
    L2_5 = L2_5(L3_6)
    L3_6 = _UPVALUE0_
    L3_6 = L3_6.NIL
  elseif L2_5 == L3_6 then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.INVALID_ARGUMENT
    return L2_5
  end
  L2_5 = db
  L2_5 = L2_5.existsRow
  L3_6 = _UPVALUE1_
  L2_5 = L2_5(L3_6, _UPVALUE2_, A0_3)
  L3_6 = _UPVALUE0_
  L3_6 = L3_6.FALSE
  if L2_5 == L3_6 then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.INVALID_ARGUMENT
    return L2_5
  end
  L2_5 = db
  L2_5 = L2_5.getNextRowId
  L3_6 = A0_3
  L2_5 = L2_5(L3_6, _UPVALUE1_)
  L3_6 = _UPVALUE0_
  L3_6 = L3_6.NIL
  if L2_5 == L3_6 then
    L3_6 = _UPVALUE0_
    L3_6 = L3_6.NOT_EXIST
    return L3_6
  end
  L3_6 = db
  L3_6 = L3_6.getAttribute
  L3_6 = L3_6(_UPVALUE1_, _UPVALUE2_, L2_5, _UPVALUE3_.policyName)
  if L3_6 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L2_5
  end
  return _UPVALUE0_.SUCCESS, L2_5, L3_6
end
function policyNameSet(A0_7, A1_8)
  if A0_7 == _UPVALUE0_.NIL or tonumber(A0_7) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_7) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_8 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_7, _UPVALUE3_.policyName, A1_8) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_7
  end
  return _UPVALUE0_.SUCCESS, A0_7
end
function policyNameDelete(A0_9, A1_10)
  local L3_11
  L3_11 = _UPVALUE0_
  L3_11 = L3_11.NOT_SUPPORTED
  return L3_11, A0_9
end
function protocolGet()
  local L0_12, L1_13
  L0_12 = db
  L0_12 = L0_12.getNextRowId
  L1_13 = "0"
  L0_12 = L0_12(L1_13, _UPVALUE0_)
  L1_13 = db
  L1_13 = L1_13.getAttribute
  L1_13 = L1_13(_UPVALUE0_, _UPVALUE1_, L0_12, _UPVALUE2_.protocol)
  if L1_13 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_12, L1_13
end
function protocolGetNext(A0_14)
  local L1_15, L2_16, L3_17
  L2_16 = _UPVALUE0_
  L2_16 = L2_16.NIL
  if A0_14 ~= L2_16 then
    L2_16 = tonumber
    L3_17 = A0_14
    L2_16 = L2_16(L3_17)
    L3_17 = _UPVALUE0_
    L3_17 = L3_17.NIL
  elseif L2_16 == L3_17 then
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.INVALID_ARGUMENT
    return L2_16
  end
  L2_16 = db
  L2_16 = L2_16.existsRow
  L3_17 = _UPVALUE1_
  L2_16 = L2_16(L3_17, _UPVALUE2_, A0_14)
  L3_17 = _UPVALUE0_
  L3_17 = L3_17.FALSE
  if L2_16 == L3_17 then
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.INVALID_ARGUMENT
    return L2_16
  end
  L2_16 = db
  L2_16 = L2_16.getNextRowId
  L3_17 = A0_14
  L2_16 = L2_16(L3_17, _UPVALUE1_)
  L3_17 = _UPVALUE0_
  L3_17 = L3_17.NIL
  if L2_16 == L3_17 then
    L3_17 = _UPVALUE0_
    L3_17 = L3_17.NOT_EXIST
    return L3_17
  end
  L3_17 = db
  L3_17 = L3_17.getAttribute
  L3_17 = L3_17(_UPVALUE1_, _UPVALUE2_, L2_16, _UPVALUE3_.protocol)
  if L3_17 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L2_16
  end
  return _UPVALUE0_.SUCCESS, L2_16, L3_17
end
function protocolSet(A0_18, A1_19)
  if A0_18 == _UPVALUE0_.NIL or tonumber(A0_18) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_18) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_19 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_19) ~= _UPVALUE3_ and tonumber(A1_19) ~= _UPVALUE4_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_18, _UPVALUE5_.protocol, A1_19) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_18
  end
  return _UPVALUE0_.SUCCESS, A0_18
end
function ipsecModeGet()
  local L0_20, L1_21
  L0_20 = db
  L0_20 = L0_20.getNextRowId
  L1_21 = "0"
  L0_20 = L0_20(L1_21, _UPVALUE0_)
  L1_21 = db
  L1_21 = L1_21.getAttribute
  L1_21 = L1_21(_UPVALUE0_, _UPVALUE1_, L0_20, _UPVALUE2_.ipsecMode)
  if L1_21 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_20, L1_21
end
function ipsecModeGetNext(A0_22)
  local L1_23, L2_24
  L1_23 = _UPVALUE0_
  L1_23 = L1_23.NIL
  if A0_22 ~= L1_23 then
    L1_23 = tonumber
    L2_24 = A0_22
    L1_23 = L1_23(L2_24)
    L2_24 = _UPVALUE0_
    L2_24 = L2_24.NIL
  elseif L1_23 == L2_24 then
    L1_23 = _UPVALUE0_
    L1_23 = L1_23.INVALID_ARGUMENT
    return L1_23
  end
  L1_23 = db
  L1_23 = L1_23.existsRow
  L2_24 = _UPVALUE1_
  L1_23 = L1_23(L2_24, _UPVALUE2_, A0_22)
  L2_24 = _UPVALUE0_
  L2_24 = L2_24.FALSE
  if L1_23 == L2_24 then
    L1_23 = _UPVALUE0_
    L1_23 = L1_23.INVALID_ARGUMENT
    return L1_23
  end
  L1_23 = db
  L1_23 = L1_23.getNextRowId
  L2_24 = A0_22
  L1_23 = L1_23(L2_24, _UPVALUE1_)
  L2_24 = _UPVALUE0_
  L2_24 = L2_24.NIL
  if L1_23 == L2_24 then
    L2_24 = _UPVALUE0_
    L2_24 = L2_24.NOT_EXIST
    return L2_24
  end
  L2_24 = db
  L2_24 = L2_24.getAttribute
  L2_24 = L2_24(_UPVALUE1_, _UPVALUE2_, L1_23, _UPVALUE3_.ipsecMode)
  if L2_24 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_23
  end
  return _UPVALUE0_.SUCCESS, L1_23, L2_24
end
function ipsecModeSet(A0_25, A1_26)
  if A0_25 == _UPVALUE0_.NIL or tonumber(A0_25) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_25) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_26 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_26) ~= _UPVALUE3_ and tonumber(A1_26) ~= _UPVALUE4_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_25, _UPVALUE5_.ipsecMode, A1_26) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_25
  end
  return _UPVALUE0_.SUCCESS, A0_25
end
function isdhcpOverIpsecEnabled()
  local L0_27, L1_28
  L0_27 = db
  L0_27 = L0_27.getNextRowId
  L1_28 = "0"
  L0_27 = L0_27(L1_28, _UPVALUE0_)
  L1_28 = db
  L1_28 = L1_28.getAttribute
  L1_28 = L1_28(_UPVALUE0_, _UPVALUE1_, L0_27, _UPVALUE2_.dhcpOverIpsec)
  if L1_28 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_27, L1_28
end
function isdhcpOverIpsecEnabledNext(A0_29)
  local L1_30, L2_31
  L1_30 = _UPVALUE0_
  L1_30 = L1_30.NIL
  if A0_29 ~= L1_30 then
    L1_30 = tonumber
    L2_31 = A0_29
    L1_30 = L1_30(L2_31)
    L2_31 = _UPVALUE0_
    L2_31 = L2_31.NIL
  elseif L1_30 == L2_31 then
    L1_30 = _UPVALUE0_
    L1_30 = L1_30.INVALID_ARGUMENT
    return L1_30
  end
  L1_30 = db
  L1_30 = L1_30.existsRow
  L2_31 = _UPVALUE1_
  L1_30 = L1_30(L2_31, _UPVALUE2_, A0_29)
  L2_31 = _UPVALUE0_
  L2_31 = L2_31.FALSE
  if L1_30 == L2_31 then
    L1_30 = _UPVALUE0_
    L1_30 = L1_30.INVALID_ARGUMENT
    return L1_30
  end
  L1_30 = db
  L1_30 = L1_30.getNextRowId
  L2_31 = A0_29
  L1_30 = L1_30(L2_31, _UPVALUE1_)
  L2_31 = _UPVALUE0_
  L2_31 = L2_31.NIL
  if L1_30 == L2_31 then
    L2_31 = _UPVALUE0_
    L2_31 = L2_31.NOT_EXIST
    return L2_31
  end
  L2_31 = db
  L2_31 = L2_31.getAttribute
  L2_31 = L2_31(_UPVALUE1_, _UPVALUE2_, L1_30, _UPVALUE3_.dhcpOverIpsec)
  if L2_31 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_30
  end
  return _UPVALUE0_.SUCCESS, L1_30, L2_31
end
function dhcpOverIpsecEnable(A0_32)
  local L1_33
  L1_33 = _UPVALUE0_
  L1_33 = L1_33.NIL
  if A0_32 ~= L1_33 then
    L1_33 = tonumber
    L1_33 = L1_33(A0_32)
  elseif L1_33 == _UPVALUE0_.NIL then
    L1_33 = _UPVALUE0_
    L1_33 = L1_33.INVALID_ARGUMENT
    return L1_33
  end
  L1_33 = db
  L1_33 = L1_33.existsRow
  L1_33 = L1_33(_UPVALUE1_, _UPVALUE2_, A0_32)
  if L1_33 == _UPVALUE0_.FALSE then
    L1_33 = _UPVALUE0_
    L1_33 = L1_33.INVALID_ARGUMENT
    return L1_33
  end
  L1_33 = db
  L1_33 = L1_33.getAttribute
  L1_33 = L1_33(_UPVALUE1_, _UPVALUE2_, A0_32, _UPVALUE3_.ipsecMode)
  if tonumber(L1_33) == _UPVALUE4_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_32
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_32, _UPVALUE3_.dhcpOverIpsec, _UPVALUE5_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_32
  end
  return _UPVALUE0_.SUCCESS, A0_32
end
function dhcpOverIpsecDisable(A0_34)
  if A0_34 == _UPVALUE0_.NIL or tonumber(A0_34) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_34) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_34, _UPVALUE3_.dhcpOverIpsec, _UPVALUE4_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_34
  end
  return _UPVALUE0_.SUCCESS, A0_34
end
function policyTypeGet()
  local L0_35, L1_36
  L0_35 = db
  L0_35 = L0_35.getNextRowId
  L1_36 = "0"
  L0_35 = L0_35(L1_36, _UPVALUE0_)
  L1_36 = db
  L1_36 = L1_36.getAttribute
  L1_36 = L1_36(_UPVALUE0_, _UPVALUE1_, L0_35, _UPVALUE2_.policyType)
  if L1_36 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_35, L1_36
end
function policyTypeGetNext(A0_37)
  local L1_38, L2_39
  L1_38 = _UPVALUE0_
  L1_38 = L1_38.NIL
  if A0_37 ~= L1_38 then
    L1_38 = tonumber
    L2_39 = A0_37
    L1_38 = L1_38(L2_39)
    L2_39 = _UPVALUE0_
    L2_39 = L2_39.NIL
  elseif L1_38 == L2_39 then
    L1_38 = _UPVALUE0_
    L1_38 = L1_38.INVALID_ARGUMENT
    return L1_38
  end
  L1_38 = db
  L1_38 = L1_38.existsRow
  L2_39 = _UPVALUE1_
  L1_38 = L1_38(L2_39, _UPVALUE2_, A0_37)
  L2_39 = _UPVALUE0_
  L2_39 = L2_39.FALSE
  if L1_38 == L2_39 then
    L1_38 = _UPVALUE0_
    L1_38 = L1_38.INVALID_ARGUMENT
    return L1_38
  end
  L1_38 = db
  L1_38 = L1_38.getNextRowId
  L2_39 = A0_37
  L1_38 = L1_38(L2_39, _UPVALUE1_)
  L2_39 = _UPVALUE0_
  L2_39 = L2_39.NIL
  if L1_38 == L2_39 then
    L2_39 = _UPVALUE0_
    L2_39 = L2_39.NOT_EXIST
    return L2_39
  end
  L2_39 = db
  L2_39 = L2_39.getAttribute
  L2_39 = L2_39(_UPVALUE1_, _UPVALUE2_, L1_38, _UPVALUE3_.policyType)
  if L2_39 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_38
  end
  return _UPVALUE0_.SUCCESS, L1_38, L2_39
end
function policyTypeSet(A0_40, A1_41)
  if A0_40 == _UPVALUE0_.NIL or tonumber(A0_40) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_40) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_41 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_41) ~= _UPVALUE3_ and tonumber(A1_41) ~= _UPVALUE4_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_40, _UPVALUE5_.policyType, A1_41) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_40
  end
  return _UPVALUE0_.SUCCESS, A0_40
end
function localGatewayGet()
  local L0_42, L1_43
  L0_42 = db
  L0_42 = L0_42.getNextRowId
  L1_43 = "0"
  L0_42 = L0_42(L1_43, _UPVALUE0_)
  L1_43 = db
  L1_43 = L1_43.getAttribute
  L1_43 = L1_43(_UPVALUE0_, _UPVALUE1_, L0_42, _UPVALUE2_.localGateway)
  if L1_43 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_42, L1_43
end
function localGatewayGetNext(A0_44)
  local L1_45, L2_46
  L1_45 = _UPVALUE0_
  L1_45 = L1_45.NIL
  if A0_44 ~= L1_45 then
    L1_45 = tonumber
    L2_46 = A0_44
    L1_45 = L1_45(L2_46)
    L2_46 = _UPVALUE0_
    L2_46 = L2_46.NIL
  elseif L1_45 == L2_46 then
    L1_45 = _UPVALUE0_
    L1_45 = L1_45.INVALID_ARGUMENT
    return L1_45
  end
  L1_45 = db
  L1_45 = L1_45.existsRow
  L2_46 = _UPVALUE1_
  L1_45 = L1_45(L2_46, _UPVALUE2_, A0_44)
  L2_46 = _UPVALUE0_
  L2_46 = L2_46.FALSE
  if L1_45 == L2_46 then
    L1_45 = _UPVALUE0_
    L1_45 = L1_45.INVALID_ARGUMENT
    return L1_45
  end
  L1_45 = db
  L1_45 = L1_45.getNextRowId
  L2_46 = A0_44
  L1_45 = L1_45(L2_46, _UPVALUE1_)
  L2_46 = _UPVALUE0_
  L2_46 = L2_46.NIL
  if L1_45 == L2_46 then
    L2_46 = _UPVALUE0_
    L2_46 = L2_46.NOT_EXIST
    return L2_46
  end
  L2_46 = db
  L2_46 = L2_46.getAttribute
  L2_46 = L2_46(_UPVALUE1_, _UPVALUE2_, L1_45, _UPVALUE3_.localGateway)
  if L2_46 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_45
  end
  return _UPVALUE0_.SUCCESS, L1_45, L2_46
end
function localGatewaySet(A0_47, A1_48)
  if A0_47 == _UPVALUE0_.NIL or tonumber(A0_47) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_47) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_48 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_47, _UPVALUE3_.modeConfigStatus) == _UPVALUE4_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_47
  end
  if db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_47, _UPVALUE3_.dhcpOverIpsec) == _UPVALUE4_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_47
  end
  if tonumber(A1_48) ~= _UPVALUE5_ and tonumber(A1_48) ~= _UPVALUE6_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_47, _UPVALUE3_.localGateway, A1_48) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_47
  end
  return _UPVALUE0_.SUCCESS, A0_47
end
function remoteEndPointTypeGet()
  local L0_49, L1_50
  L0_49 = db
  L0_49 = L0_49.getNextRowId
  L1_50 = "0"
  L0_49 = L0_49(L1_50, _UPVALUE0_)
  L1_50 = db
  L1_50 = L1_50.getAttribute
  L1_50 = L1_50(_UPVALUE0_, _UPVALUE1_, L0_49, _UPVALUE2_.remoteEndPointType)
  if L1_50 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_49, L1_50
end
function remoteEndPointTypeGetNext(A0_51)
  local L1_52, L2_53
  L1_52 = _UPVALUE0_
  L1_52 = L1_52.NIL
  if A0_51 ~= L1_52 then
    L1_52 = tonumber
    L2_53 = A0_51
    L1_52 = L1_52(L2_53)
    L2_53 = _UPVALUE0_
    L2_53 = L2_53.NIL
  elseif L1_52 == L2_53 then
    L1_52 = _UPVALUE0_
    L1_52 = L1_52.INVALID_ARGUMENT
    return L1_52
  end
  L1_52 = db
  L1_52 = L1_52.existsRow
  L2_53 = _UPVALUE1_
  L1_52 = L1_52(L2_53, _UPVALUE2_, A0_51)
  L2_53 = _UPVALUE0_
  L2_53 = L2_53.FALSE
  if L1_52 == L2_53 then
    L1_52 = _UPVALUE0_
    L1_52 = L1_52.INVALID_ARGUMENT
    return L1_52
  end
  L1_52 = db
  L1_52 = L1_52.getNextRowId
  L2_53 = A0_51
  L1_52 = L1_52(L2_53, _UPVALUE1_)
  L2_53 = _UPVALUE0_
  L2_53 = L2_53.NIL
  if L1_52 == L2_53 then
    L2_53 = _UPVALUE0_
    L2_53 = L2_53.NOT_EXIST
    return L2_53
  end
  L2_53 = db
  L2_53 = L2_53.getAttribute
  L2_53 = L2_53(_UPVALUE1_, _UPVALUE2_, L1_52, _UPVALUE3_.remoteEndPointType)
  if L2_53 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_52
  end
  return _UPVALUE0_.SUCCESS, L1_52, L2_53
end
function remoteEndPointTypeSet(A0_54, A1_55)
  local L2_56
  L2_56 = _UPVALUE0_
  L2_56 = L2_56.NIL
  if A0_54 ~= L2_56 then
    L2_56 = tonumber
    L2_56 = L2_56(A0_54)
  elseif L2_56 == _UPVALUE0_.NIL then
    L2_56 = _UPVALUE0_
    L2_56 = L2_56.INVALID_ARGUMENT
    return L2_56
  end
  L2_56 = db
  L2_56 = L2_56.existsRow
  L2_56 = L2_56(_UPVALUE1_, _UPVALUE2_, A0_54)
  if L2_56 == _UPVALUE0_.FALSE then
    L2_56 = _UPVALUE0_
    L2_56 = L2_56.INVALID_ARGUMENT
    return L2_56
  end
  L2_56 = _UPVALUE0_
  L2_56 = L2_56.NIL
  if A1_55 == L2_56 then
    L2_56 = _UPVALUE0_
    L2_56 = L2_56.INVALID_ARGUMENT
    return L2_56
  end
  L2_56 = db
  L2_56 = L2_56.getAttribute
  L2_56 = L2_56(_UPVALUE1_, _UPVALUE2_, A0_54, _UPVALUE3_.policyType)
  if tonumber(L2_56) == _UPVALUE4_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_54
  end
  if tonumber(A1_55) ~= _UPVALUE5_ and tonumber(A1_55) ~= _UPVALUE6_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_54, _UPVALUE3_.remoteEndPointType, A1_55) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_54
  end
  return _UPVALUE0_.SUCCESS, A0_54
end
function remoteEndPointGet()
  local L0_57, L1_58
  L0_57 = db
  L0_57 = L0_57.getNextRowId
  L1_58 = "0"
  L0_57 = L0_57(L1_58, _UPVALUE0_)
  L1_58 = db
  L1_58 = L1_58.getAttribute
  L1_58 = L1_58(_UPVALUE0_, _UPVALUE1_, L0_57, _UPVALUE2_.remoteEndPoint)
  if L1_58 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_57, L1_58
end
function remoteEndPointGetNext(A0_59)
  local L1_60, L2_61
  L1_60 = _UPVALUE0_
  L1_60 = L1_60.NIL
  if A0_59 ~= L1_60 then
    L1_60 = tonumber
    L2_61 = A0_59
    L1_60 = L1_60(L2_61)
    L2_61 = _UPVALUE0_
    L2_61 = L2_61.NIL
  elseif L1_60 == L2_61 then
    L1_60 = _UPVALUE0_
    L1_60 = L1_60.INVALID_ARGUMENT
    return L1_60
  end
  L1_60 = db
  L1_60 = L1_60.existsRow
  L2_61 = _UPVALUE1_
  L1_60 = L1_60(L2_61, _UPVALUE2_, A0_59)
  L2_61 = _UPVALUE0_
  L2_61 = L2_61.FALSE
  if L1_60 == L2_61 then
    L1_60 = _UPVALUE0_
    L1_60 = L1_60.INVALID_ARGUMENT
    return L1_60
  end
  L1_60 = db
  L1_60 = L1_60.getNextRowId
  L2_61 = A0_59
  L1_60 = L1_60(L2_61, _UPVALUE1_)
  L2_61 = _UPVALUE0_
  L2_61 = L2_61.NIL
  if L1_60 == L2_61 then
    L2_61 = _UPVALUE0_
    L2_61 = L2_61.NOT_EXIST
    return L2_61
  end
  L2_61 = db
  L2_61 = L2_61.getAttribute
  L2_61 = L2_61(_UPVALUE1_, _UPVALUE2_, L1_60, _UPVALUE3_.remoteEndPoint)
  if L2_61 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_60
  end
  return _UPVALUE0_.SUCCESS, L1_60, L2_61
end
function remoteEndPointSet(A0_62, A1_63)
  local L2_64, L3_65
  L3_65 = _UPVALUE0_
  L3_65 = L3_65.NIL
  if A0_62 ~= L3_65 then
    L3_65 = tonumber
    L3_65 = L3_65(A0_62)
  elseif L3_65 == _UPVALUE0_.NIL then
    L3_65 = _UPVALUE0_
    L3_65 = L3_65.INVALID_ARGUMENT
    return L3_65
  end
  L3_65 = db
  L3_65 = L3_65.existsRow
  L3_65 = L3_65(_UPVALUE1_, _UPVALUE2_, A0_62)
  if L3_65 == _UPVALUE0_.FALSE then
    L3_65 = _UPVALUE0_
    L3_65 = L3_65.INVALID_ARGUMENT
    return L3_65
  end
  L3_65 = _UPVALUE0_
  L3_65 = L3_65.NIL
  if A1_63 == L3_65 then
    L3_65 = _UPVALUE0_
    L3_65 = L3_65.INVALID_ARGUMENT
    return L3_65
  end
  L3_65 = db
  L3_65 = L3_65.getAttribute
  L3_65 = L3_65(_UPVALUE1_, _UPVALUE2_, A0_62, _UPVALUE3_.remoteEndPointType)
  if tonumber(L3_65) == _UPVALUE4_ then
    L2_64 = _UPVALUE5_.ipAddressCheck("2", A1_63)
    if L2_64 ~= _UPVALUE0_.SUCCESS then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
  end
  if tonumber(L3_65) == _UPVALUE6_ then
    L2_64 = _UPVALUE5_.fqdnCheck(A1_63)
    if L2_64 ~= _UPVALUE0_.SUCCESS then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_62, _UPVALUE3_.remoteEndPoint, A1_63) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_62
  end
  return _UPVALUE0_.SUCCESS, A0_62
end
function isnetbiosEnabled()
  local L0_66, L1_67
  L0_66 = db
  L0_66 = L0_66.getNextRowId
  L1_67 = "0"
  L0_66 = L0_66(L1_67, _UPVALUE0_)
  L1_67 = db
  L1_67 = L1_67.getAttribute
  L1_67 = L1_67(_UPVALUE0_, _UPVALUE1_, L0_66, _UPVALUE2_.netbios)
  if L1_67 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_66, L1_67
end
function isnetbiosEnabledNext(A0_68)
  local L1_69, L2_70
  L1_69 = _UPVALUE0_
  L1_69 = L1_69.NIL
  if A0_68 ~= L1_69 then
    L1_69 = tonumber
    L2_70 = A0_68
    L1_69 = L1_69(L2_70)
    L2_70 = _UPVALUE0_
    L2_70 = L2_70.NIL
  elseif L1_69 == L2_70 then
    L1_69 = _UPVALUE0_
    L1_69 = L1_69.INVALID_ARGUMENT
    return L1_69
  end
  L1_69 = db
  L1_69 = L1_69.existsRow
  L2_70 = _UPVALUE1_
  L1_69 = L1_69(L2_70, _UPVALUE2_, A0_68)
  L2_70 = _UPVALUE0_
  L2_70 = L2_70.FALSE
  if L1_69 == L2_70 then
    L1_69 = _UPVALUE0_
    L1_69 = L1_69.INVALID_ARGUMENT
    return L1_69
  end
  L1_69 = db
  L1_69 = L1_69.getNextRowId
  L2_70 = A0_68
  L1_69 = L1_69(L2_70, _UPVALUE1_)
  L2_70 = _UPVALUE0_
  L2_70 = L2_70.NIL
  if L1_69 == L2_70 then
    L2_70 = _UPVALUE0_
    L2_70 = L2_70.NOT_EXIST
    return L2_70
  end
  L2_70 = db
  L2_70 = L2_70.getAttribute
  L2_70 = L2_70(_UPVALUE1_, _UPVALUE2_, L1_69, _UPVALUE3_.netbios)
  if L2_70 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_69
  end
  return _UPVALUE0_.SUCCESS, L1_69, L2_70
end
function netbiosEnable(A0_71)
  local L1_72
  L1_72 = _UPVALUE0_
  L1_72 = L1_72.NIL
  if A0_71 ~= L1_72 then
    L1_72 = tonumber
    L1_72 = L1_72(A0_71)
  elseif L1_72 == _UPVALUE0_.NIL then
    L1_72 = _UPVALUE0_
    L1_72 = L1_72.INVALID_ARGUMENT
    return L1_72
  end
  L1_72 = db
  L1_72 = L1_72.existsRow
  L1_72 = L1_72(_UPVALUE1_, _UPVALUE2_, A0_71)
  if L1_72 == _UPVALUE0_.FALSE then
    L1_72 = _UPVALUE0_
    L1_72 = L1_72.INVALID_ARGUMENT
    return L1_72
  end
  L1_72 = db
  L1_72 = L1_72.getAttribute
  L1_72 = L1_72(_UPVALUE1_, _UPVALUE2_, A0_71, _UPVALUE3_.ipsecMode)
  if tonumber(L1_72) == _UPVALUE4_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_71
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_71, _UPVALUE3_.netbios, _UPVALUE5_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_71
  end
  return _UPVALUE0_.SUCCESS, A0_71
end
function netbiosDisable(A0_73)
  if A0_73 == _UPVALUE0_.NIL or tonumber(A0_73) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_73) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_73, _UPVALUE3_.netbios, _UPVALUE4_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_73
  end
  return _UPVALUE0_.SUCCESS, A0_73
end
function isrolloverEnabled()
  local L0_74, L1_75
  L0_74 = db
  L0_74 = L0_74.getNextRowId
  L1_75 = "0"
  L0_74 = L0_74(L1_75, _UPVALUE0_)
  L1_75 = db
  L1_75 = L1_75.getAttribute
  L1_75 = L1_75(_UPVALUE0_, _UPVALUE1_, L0_74, _UPVALUE2_.rollover)
  if L1_75 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_74, L1_75
end
function isrolloverEnabledNext(A0_76)
  local L1_77, L2_78
  L1_77 = _UPVALUE0_
  L1_77 = L1_77.NIL
  if A0_76 ~= L1_77 then
    L1_77 = tonumber
    L2_78 = A0_76
    L1_77 = L1_77(L2_78)
    L2_78 = _UPVALUE0_
    L2_78 = L2_78.NIL
  elseif L1_77 == L2_78 then
    L1_77 = _UPVALUE0_
    L1_77 = L1_77.INVALID_ARGUMENT
    return L1_77
  end
  L1_77 = db
  L1_77 = L1_77.existsRow
  L2_78 = _UPVALUE1_
  L1_77 = L1_77(L2_78, _UPVALUE2_, A0_76)
  L2_78 = _UPVALUE0_
  L2_78 = L2_78.FALSE
  if L1_77 == L2_78 then
    L1_77 = _UPVALUE0_
    L1_77 = L1_77.INVALID_ARGUMENT
    return L1_77
  end
  L1_77 = db
  L1_77 = L1_77.getNextRowId
  L2_78 = A0_76
  L1_77 = L1_77(L2_78, _UPVALUE1_)
  L2_78 = _UPVALUE0_
  L2_78 = L2_78.NIL
  if L1_77 == L2_78 then
    L2_78 = _UPVALUE0_
    L2_78 = L2_78.NOT_EXIST
    return L2_78
  end
  L2_78 = db
  L2_78 = L2_78.getAttribute
  L2_78 = L2_78(_UPVALUE1_, _UPVALUE2_, L1_77, _UPVALUE3_.rollover)
  if L2_78 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_77
  end
  return _UPVALUE0_.SUCCESS, L1_77, L2_78
end
function rolloverEnable(A0_79)
  if A0_79 == _UPVALUE0_.NIL or tonumber(A0_79) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_79) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_79, _UPVALUE3_.rollover, _UPVALUE4_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_79
  end
  return _UPVALUE0_.SUCCESS, A0_79
end
function rolloverDisable(A0_80)
  if A0_80 == _UPVALUE0_.NIL or tonumber(A0_80) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_80) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_80, _UPVALUE3_.rollover, _UPVALUE4_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_80
  end
  return _UPVALUE0_.SUCCESS, A0_80
end
function rolloverGatewayGet()
  local L0_81, L1_82
  L0_81 = db
  L0_81 = L0_81.getNextRowId
  L1_82 = "0"
  L0_81 = L0_81(L1_82, _UPVALUE0_)
  L1_82 = db
  L1_82 = L1_82.getAttribute
  L1_82 = L1_82(_UPVALUE0_, _UPVALUE1_, L0_81, _UPVALUE2_.rolloverGateway)
  if L1_82 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_81, L1_82
end
function rolloverGatewayGetNext(A0_83)
  local L1_84, L2_85
  L1_84 = _UPVALUE0_
  L1_84 = L1_84.NIL
  if A0_83 ~= L1_84 then
    L1_84 = tonumber
    L2_85 = A0_83
    L1_84 = L1_84(L2_85)
    L2_85 = _UPVALUE0_
    L2_85 = L2_85.NIL
  elseif L1_84 == L2_85 then
    L1_84 = _UPVALUE0_
    L1_84 = L1_84.INVALID_ARGUMENT
    return L1_84
  end
  L1_84 = db
  L1_84 = L1_84.existsRow
  L2_85 = _UPVALUE1_
  L1_84 = L1_84(L2_85, _UPVALUE2_, A0_83)
  L2_85 = _UPVALUE0_
  L2_85 = L2_85.FALSE
  if L1_84 == L2_85 then
    L1_84 = _UPVALUE0_
    L1_84 = L1_84.INVALID_ARGUMENT
    return L1_84
  end
  L1_84 = db
  L1_84 = L1_84.getNextRowId
  L2_85 = A0_83
  L1_84 = L1_84(L2_85, _UPVALUE1_)
  L2_85 = _UPVALUE0_
  L2_85 = L2_85.NIL
  if L1_84 == L2_85 then
    L2_85 = _UPVALUE0_
    L2_85 = L2_85.NOT_EXIST
    return L2_85
  end
  L2_85 = db
  L2_85 = L2_85.getAttribute
  L2_85 = L2_85(_UPVALUE1_, _UPVALUE2_, L1_84, _UPVALUE3_.rolloverGateway)
  if L2_85 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_84
  end
  return _UPVALUE0_.SUCCESS, L1_84, L2_85
end
function rolloverGatewaySet(A0_86, A1_87)
  if A0_86 == _UPVALUE0_.NIL or tonumber(A0_86) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_86) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_87 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_86, _UPVALUE3_.rolloverGateway, A1_87) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_86
  end
  return _UPVALUE0_.SUCCESS, A0_86
end
function iskeepAliveEnabled()
  local L0_88, L1_89
  L0_88 = db
  L0_88 = L0_88.getNextRowId
  L1_89 = "0"
  L0_88 = L0_88(L1_89, _UPVALUE0_)
  L1_89 = db
  L1_89 = L1_89.getAttribute
  L1_89 = L1_89(_UPVALUE0_, _UPVALUE1_, L0_88, _UPVALUE2_.keepAlive)
  if L1_89 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_88, L1_89
end
function iskeepAliveEnabledNext(A0_90)
  local L1_91, L2_92
  L1_91 = _UPVALUE0_
  L1_91 = L1_91.NIL
  if A0_90 ~= L1_91 then
    L1_91 = tonumber
    L2_92 = A0_90
    L1_91 = L1_91(L2_92)
    L2_92 = _UPVALUE0_
    L2_92 = L2_92.NIL
  elseif L1_91 == L2_92 then
    L1_91 = _UPVALUE0_
    L1_91 = L1_91.INVALID_ARGUMENT
    return L1_91
  end
  L1_91 = db
  L1_91 = L1_91.existsRow
  L2_92 = _UPVALUE1_
  L1_91 = L1_91(L2_92, _UPVALUE2_, A0_90)
  L2_92 = _UPVALUE0_
  L2_92 = L2_92.FALSE
  if L1_91 == L2_92 then
    L1_91 = _UPVALUE0_
    L1_91 = L1_91.INVALID_ARGUMENT
    return L1_91
  end
  L1_91 = db
  L1_91 = L1_91.getNextRowId
  L2_92 = A0_90
  L1_91 = L1_91(L2_92, _UPVALUE1_)
  L2_92 = _UPVALUE0_
  L2_92 = L2_92.NIL
  if L1_91 == L2_92 then
    L2_92 = _UPVALUE0_
    L2_92 = L2_92.NOT_EXIST
    return L2_92
  end
  L2_92 = db
  L2_92 = L2_92.getAttribute
  L2_92 = L2_92(_UPVALUE1_, _UPVALUE2_, L1_91, _UPVALUE3_.keepAlive)
  if L2_92 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_91
  end
  return _UPVALUE0_.SUCCESS, L1_91, L2_92
end
function keepAliveEnable(A0_93)
  if A0_93 == _UPVALUE0_.NIL or tonumber(A0_93) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_93) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_93, _UPVALUE3_.keepAlive, _UPVALUE4_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_93
  end
  return _UPVALUE0_.SUCCESS, A0_93
end
function keepAliveDisable(A0_94)
  if A0_94 == _UPVALUE0_.NIL or tonumber(A0_94) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_94) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_94, _UPVALUE3_.keepAlive, _UPVALUE4_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_94
  end
  return _UPVALUE0_.SUCCESS, A0_94
end
function keepAliveSourceAddressGet()
  local L0_95, L1_96
  L0_95 = db
  L0_95 = L0_95.getNextRowId
  L1_96 = "0"
  L0_95 = L0_95(L1_96, _UPVALUE0_)
  L1_96 = db
  L1_96 = L1_96.getAttribute
  L1_96 = L1_96(_UPVALUE0_, _UPVALUE1_, L0_95, _UPVALUE2_.keepAliveSourceAddress)
  if L1_96 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_95, L1_96
end
function keepAliveSourceAddressGetNext(A0_97)
  local L1_98, L2_99
  L1_98 = _UPVALUE0_
  L1_98 = L1_98.NIL
  if A0_97 ~= L1_98 then
    L1_98 = tonumber
    L2_99 = A0_97
    L1_98 = L1_98(L2_99)
    L2_99 = _UPVALUE0_
    L2_99 = L2_99.NIL
  elseif L1_98 == L2_99 then
    L1_98 = _UPVALUE0_
    L1_98 = L1_98.INVALID_ARGUMENT
    return L1_98
  end
  L1_98 = db
  L1_98 = L1_98.existsRow
  L2_99 = _UPVALUE1_
  L1_98 = L1_98(L2_99, _UPVALUE2_, A0_97)
  L2_99 = _UPVALUE0_
  L2_99 = L2_99.FALSE
  if L1_98 == L2_99 then
    L1_98 = _UPVALUE0_
    L1_98 = L1_98.INVALID_ARGUMENT
    return L1_98
  end
  L1_98 = db
  L1_98 = L1_98.getNextRowId
  L2_99 = A0_97
  L1_98 = L1_98(L2_99, _UPVALUE1_)
  L2_99 = _UPVALUE0_
  L2_99 = L2_99.NIL
  if L1_98 == L2_99 then
    L2_99 = _UPVALUE0_
    L2_99 = L2_99.NOT_EXIST
    return L2_99
  end
  L2_99 = db
  L2_99 = L2_99.getAttribute
  L2_99 = L2_99(_UPVALUE1_, _UPVALUE2_, L1_98, _UPVALUE3_.keepAliveSourceAddress)
  if L2_99 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_98
  end
  return _UPVALUE0_.SUCCESS, L1_98, L2_99
end
function keepAliveSourceAddressSet(A0_100, A1_101)
  if A0_100 == _UPVALUE0_.NIL or tonumber(A0_100) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_100) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_101 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE3_.ipAddressCheck("2", A1_101)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_100, _UPVALUE4_.keepAlive) ~= _UPVALUE5_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_100
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_100, _UPVALUE4_.keepAliveSourceAddress, A1_101) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_100
  end
  return _UPVALUE0_.SUCCESS, A0_100
end
function remotePingIPAddressGet()
  local L0_102, L1_103
  L0_102 = db
  L0_102 = L0_102.getNextRowId
  L1_103 = "0"
  L0_102 = L0_102(L1_103, _UPVALUE0_)
  L1_103 = db
  L1_103 = L1_103.getAttribute
  L1_103 = L1_103(_UPVALUE0_, _UPVALUE1_, L0_102, _UPVALUE2_.remotePingIPAddress)
  if L1_103 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_102, L1_103
end
function remotePingIPAddressGetNext(A0_104)
  local L1_105, L2_106
  L1_105 = _UPVALUE0_
  L1_105 = L1_105.NIL
  if A0_104 ~= L1_105 then
    L1_105 = tonumber
    L2_106 = A0_104
    L1_105 = L1_105(L2_106)
    L2_106 = _UPVALUE0_
    L2_106 = L2_106.NIL
  elseif L1_105 == L2_106 then
    L1_105 = _UPVALUE0_
    L1_105 = L1_105.INVALID_ARGUMENT
    return L1_105
  end
  L1_105 = db
  L1_105 = L1_105.existsRow
  L2_106 = _UPVALUE1_
  L1_105 = L1_105(L2_106, _UPVALUE2_, A0_104)
  L2_106 = _UPVALUE0_
  L2_106 = L2_106.FALSE
  if L1_105 == L2_106 then
    L1_105 = _UPVALUE0_
    L1_105 = L1_105.INVALID_ARGUMENT
    return L1_105
  end
  L1_105 = db
  L1_105 = L1_105.getNextRowId
  L2_106 = A0_104
  L1_105 = L1_105(L2_106, _UPVALUE1_)
  L2_106 = _UPVALUE0_
  L2_106 = L2_106.NIL
  if L1_105 == L2_106 then
    L2_106 = _UPVALUE0_
    L2_106 = L2_106.NOT_EXIST
    return L2_106
  end
  L2_106 = db
  L2_106 = L2_106.getAttribute
  L2_106 = L2_106(_UPVALUE1_, _UPVALUE2_, L1_105, _UPVALUE3_.remotePingIPAddress)
  if L2_106 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_105
  end
  return _UPVALUE0_.SUCCESS, L1_105, L2_106
end
function remotePingIPAddressSet(A0_107, A1_108)
  if A0_107 == _UPVALUE0_.NIL or tonumber(A0_107) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_107) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_108 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE3_.ipAddressCheck("2", A1_108)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_107, _UPVALUE4_.keepAlive) ~= _UPVALUE5_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_107
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_107, _UPVALUE4_.remotePingIPAddress, A1_108) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_107
  end
  return _UPVALUE0_.SUCCESS, A0_107
end
function keepAlivePeriodGet()
  local L0_109, L1_110
  L0_109 = db
  L0_109 = L0_109.getNextRowId
  L1_110 = "0"
  L0_109 = L0_109(L1_110, _UPVALUE0_)
  L1_110 = db
  L1_110 = L1_110.getAttribute
  L1_110 = L1_110(_UPVALUE0_, _UPVALUE1_, L0_109, _UPVALUE2_.keepAlivePeriod)
  if L1_110 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_109, L1_110
end
function keepAlivePeriodGetNext(A0_111)
  local L1_112, L2_113
  L1_112 = _UPVALUE0_
  L1_112 = L1_112.NIL
  if A0_111 ~= L1_112 then
    L1_112 = tonumber
    L2_113 = A0_111
    L1_112 = L1_112(L2_113)
    L2_113 = _UPVALUE0_
    L2_113 = L2_113.NIL
  elseif L1_112 == L2_113 then
    L1_112 = _UPVALUE0_
    L1_112 = L1_112.INVALID_ARGUMENT
    return L1_112
  end
  L1_112 = db
  L1_112 = L1_112.existsRow
  L2_113 = _UPVALUE1_
  L1_112 = L1_112(L2_113, _UPVALUE2_, A0_111)
  L2_113 = _UPVALUE0_
  L2_113 = L2_113.FALSE
  if L1_112 == L2_113 then
    L1_112 = _UPVALUE0_
    L1_112 = L1_112.INVALID_ARGUMENT
    return L1_112
  end
  L1_112 = db
  L1_112 = L1_112.getNextRowId
  L2_113 = A0_111
  L1_112 = L1_112(L2_113, _UPVALUE1_)
  L2_113 = _UPVALUE0_
  L2_113 = L2_113.NIL
  if L1_112 == L2_113 then
    L2_113 = _UPVALUE0_
    L2_113 = L2_113.NOT_EXIST
    return L2_113
  end
  L2_113 = db
  L2_113 = L2_113.getAttribute
  L2_113 = L2_113(_UPVALUE1_, _UPVALUE2_, L1_112, _UPVALUE3_.keepAlivePeriod)
  if L2_113 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_112
  end
  return _UPVALUE0_.SUCCESS, L1_112, L2_113
end
function keepAlivePeriodSet(A0_114, A1_115)
  if A0_114 == _UPVALUE0_.NIL or tonumber(A0_114) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_114) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_115 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_114, _UPVALUE3_.keepAlive) ~= _UPVALUE4_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_114
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_114, _UPVALUE3_.keepAlivePeriod, A1_115) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_114
  end
  return _UPVALUE0_.SUCCESS, A0_114
end
function keepAliveFailureCountGet()
  local L0_116, L1_117
  L0_116 = db
  L0_116 = L0_116.getNextRowId
  L1_117 = "0"
  L0_116 = L0_116(L1_117, _UPVALUE0_)
  L1_117 = db
  L1_117 = L1_117.getAttribute
  L1_117 = L1_117(_UPVALUE0_, _UPVALUE1_, L0_116, _UPVALUE2_.keepAliveFailureCount)
  if L1_117 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_116, L1_117
end
function keepAliveFailureCountGetNext(A0_118)
  local L1_119, L2_120
  L1_119 = _UPVALUE0_
  L1_119 = L1_119.NIL
  if A0_118 ~= L1_119 then
    L1_119 = tonumber
    L2_120 = A0_118
    L1_119 = L1_119(L2_120)
    L2_120 = _UPVALUE0_
    L2_120 = L2_120.NIL
  elseif L1_119 == L2_120 then
    L1_119 = _UPVALUE0_
    L1_119 = L1_119.INVALID_ARGUMENT
    return L1_119
  end
  L1_119 = db
  L1_119 = L1_119.existsRow
  L2_120 = _UPVALUE1_
  L1_119 = L1_119(L2_120, _UPVALUE2_, A0_118)
  L2_120 = _UPVALUE0_
  L2_120 = L2_120.FALSE
  if L1_119 == L2_120 then
    L1_119 = _UPVALUE0_
    L1_119 = L1_119.INVALID_ARGUMENT
    return L1_119
  end
  L1_119 = db
  L1_119 = L1_119.getNextRowId
  L2_120 = A0_118
  L1_119 = L1_119(L2_120, _UPVALUE1_)
  L2_120 = _UPVALUE0_
  L2_120 = L2_120.NIL
  if L1_119 == L2_120 then
    L2_120 = _UPVALUE0_
    L2_120 = L2_120.NOT_EXIST
    return L2_120
  end
  L2_120 = db
  L2_120 = L2_120.getAttribute
  L2_120 = L2_120(_UPVALUE1_, _UPVALUE2_, L1_119, _UPVALUE3_.keepAliveFailureCount)
  if L2_120 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_119
  end
  return _UPVALUE0_.SUCCESS, L1_119, L2_120
end
function keepAliveFailureCountSet(A0_121, A1_122)
  if A0_121 == _UPVALUE0_.NIL or tonumber(A0_121) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_121) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_122 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_121, _UPVALUE3_.keepAlive) ~= _UPVALUE4_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_121
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_121, _UPVALUE3_.keepAliveFailureCount, A1_122) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_121
  end
  return _UPVALUE0_.SUCCESS, A0_121
end
function encryptionAlgoGet()
  local L0_123, L1_124
  L0_123 = db
  L0_123 = L0_123.getNextRowId
  L1_124 = "0"
  L0_123 = L0_123(L1_124, _UPVALUE0_)
  L1_124 = db
  L1_124 = L1_124.getAttribute
  L1_124 = L1_124(_UPVALUE0_, _UPVALUE1_, L0_123, _UPVALUE2_.encryptionAlgo)
  if L1_124 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_123, L1_124
end
function encryptionAlgoGetNext(A0_125)
  local L1_126, L2_127
  L1_126 = _UPVALUE0_
  L1_126 = L1_126.NIL
  if A0_125 ~= L1_126 then
    L1_126 = tonumber
    L2_127 = A0_125
    L1_126 = L1_126(L2_127)
    L2_127 = _UPVALUE0_
    L2_127 = L2_127.NIL
  elseif L1_126 == L2_127 then
    L1_126 = _UPVALUE0_
    L1_126 = L1_126.INVALID_ARGUMENT
    return L1_126
  end
  L1_126 = db
  L1_126 = L1_126.existsRow
  L2_127 = _UPVALUE1_
  L1_126 = L1_126(L2_127, _UPVALUE2_, A0_125)
  L2_127 = _UPVALUE0_
  L2_127 = L2_127.FALSE
  if L1_126 == L2_127 then
    L1_126 = _UPVALUE0_
    L1_126 = L1_126.INVALID_ARGUMENT
    return L1_126
  end
  L1_126 = db
  L1_126 = L1_126.getNextRowId
  L2_127 = A0_125
  L1_126 = L1_126(L2_127, _UPVALUE1_)
  L2_127 = _UPVALUE0_
  L2_127 = L2_127.NIL
  if L1_126 == L2_127 then
    L2_127 = _UPVALUE0_
    L2_127 = L2_127.NOT_EXIST
    return L2_127
  end
  L2_127 = db
  L2_127 = L2_127.getAttribute
  L2_127 = L2_127(_UPVALUE1_, _UPVALUE2_, L1_126, _UPVALUE3_.encryptionAlgo)
  if L2_127 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_126
  end
  return _UPVALUE0_.SUCCESS, L1_126, L2_127
end
function encryptionAlgoSet(A0_128, A1_129)
  if A0_128 == _UPVALUE0_.NIL or tonumber(A0_128) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_128) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_129 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_129) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_128, _UPVALUE3_.encryptionAlgo, A1_129) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_128
  end
  return _UPVALUE0_.SUCCESS, A0_128
end
function encryptionAlgoKeyLengthGet()
  local L0_130, L1_131
  L0_130 = db
  L0_130 = L0_130.getNextRowId
  L1_131 = "0"
  L0_130 = L0_130(L1_131, _UPVALUE0_)
  L1_131 = db
  L1_131 = L1_131.getAttribute
  L1_131 = L1_131(_UPVALUE0_, _UPVALUE1_, L0_130, _UPVALUE2_.encryptionAlgoKeyLength)
  if L1_131 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_130, L1_131
end
function encryptionAlgoKeyLengthGetNext(A0_132)
  local L1_133, L2_134
  L1_133 = _UPVALUE0_
  L1_133 = L1_133.NIL
  if A0_132 ~= L1_133 then
    L1_133 = tonumber
    L2_134 = A0_132
    L1_133 = L1_133(L2_134)
    L2_134 = _UPVALUE0_
    L2_134 = L2_134.NIL
  elseif L1_133 == L2_134 then
    L1_133 = _UPVALUE0_
    L1_133 = L1_133.INVALID_ARGUMENT
    return L1_133
  end
  L1_133 = db
  L1_133 = L1_133.existsRow
  L2_134 = _UPVALUE1_
  L1_133 = L1_133(L2_134, _UPVALUE2_, A0_132)
  L2_134 = _UPVALUE0_
  L2_134 = L2_134.FALSE
  if L1_133 == L2_134 then
    L1_133 = _UPVALUE0_
    L1_133 = L1_133.INVALID_ARGUMENT
    return L1_133
  end
  L1_133 = db
  L1_133 = L1_133.getNextRowId
  L2_134 = A0_132
  L1_133 = L1_133(L2_134, _UPVALUE1_)
  L2_134 = _UPVALUE0_
  L2_134 = L2_134.NIL
  if L1_133 == L2_134 then
    L2_134 = _UPVALUE0_
    L2_134 = L2_134.NOT_EXIST
    return L2_134
  end
  L2_134 = db
  L2_134 = L2_134.getAttribute
  L2_134 = L2_134(_UPVALUE1_, _UPVALUE2_, L1_133, _UPVALUE3_.encryptionAlgoKeyLength)
  if L2_134 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_133
  end
  return _UPVALUE0_.SUCCESS, L1_133, L2_134
end
function encryptionAlgoKeyLengthSet(A0_135, A1_136)
  if A0_135 == _UPVALUE0_.NIL or tonumber(A0_135) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_135) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_136 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_135, _UPVALUE3_.encryptionAlgoKeyLength, A1_136) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_135
  end
  return _UPVALUE0_.SUCCESS, A0_135
end
function authenticationAlgoGet()
  local L0_137, L1_138
  L0_137 = db
  L0_137 = L0_137.getNextRowId
  L1_138 = "0"
  L0_137 = L0_137(L1_138, _UPVALUE0_)
  L1_138 = db
  L1_138 = L1_138.getAttribute
  L1_138 = L1_138(_UPVALUE0_, _UPVALUE1_, L0_137, _UPVALUE2_.authenticationAlgo)
  if L1_138 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_137, L1_138
end
function authenticationAlgoGetNext(A0_139)
  local L1_140, L2_141
  L1_140 = _UPVALUE0_
  L1_140 = L1_140.NIL
  if A0_139 ~= L1_140 then
    L1_140 = tonumber
    L2_141 = A0_139
    L1_140 = L1_140(L2_141)
    L2_141 = _UPVALUE0_
    L2_141 = L2_141.NIL
  elseif L1_140 == L2_141 then
    L1_140 = _UPVALUE0_
    L1_140 = L1_140.INVALID_ARGUMENT
    return L1_140
  end
  L1_140 = db
  L1_140 = L1_140.existsRow
  L2_141 = _UPVALUE1_
  L1_140 = L1_140(L2_141, _UPVALUE2_, A0_139)
  L2_141 = _UPVALUE0_
  L2_141 = L2_141.FALSE
  if L1_140 == L2_141 then
    L1_140 = _UPVALUE0_
    L1_140 = L1_140.INVALID_ARGUMENT
    return L1_140
  end
  L1_140 = db
  L1_140 = L1_140.getNextRowId
  L2_141 = A0_139
  L1_140 = L1_140(L2_141, _UPVALUE1_)
  L2_141 = _UPVALUE0_
  L2_141 = L2_141.NIL
  if L1_140 == L2_141 then
    L2_141 = _UPVALUE0_
    L2_141 = L2_141.NOT_EXIST
    return L2_141
  end
  L2_141 = db
  L2_141 = L2_141.getAttribute
  L2_141 = L2_141(_UPVALUE1_, _UPVALUE2_, L1_140, _UPVALUE3_.authenticationAlgo)
  if L2_141 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_140
  end
  return _UPVALUE0_.SUCCESS, L1_140, L2_141
end
function authenticationAlgoSet(A0_142, A1_143)
  if A0_142 == _UPVALUE0_.NIL or tonumber(A0_142) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_142) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_143 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_143) == _UPVALUE0_.NIL then
    return returnCodesINVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_142, _UPVALUE3_.authenticationAlgo, A1_143) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_142
  end
  return _UPVALUE0_.SUCCESS, A0_142
end
function localNetworkTypeGet()
  local L0_144, L1_145
  L0_144 = db
  L0_144 = L0_144.getNextRowId
  L1_145 = "0"
  L0_144 = L0_144(L1_145, _UPVALUE0_)
  L1_145 = db
  L1_145 = L1_145.getAttribute
  L1_145 = L1_145(_UPVALUE0_, _UPVALUE1_, L0_144, _UPVALUE2_.localNetworkType)
  if L1_145 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_144, L1_145
end
function localNetworkTypeGetNext(A0_146)
  local L1_147, L2_148
  L1_147 = _UPVALUE0_
  L1_147 = L1_147.NIL
  if A0_146 ~= L1_147 then
    L1_147 = tonumber
    L2_148 = A0_146
    L1_147 = L1_147(L2_148)
    L2_148 = _UPVALUE0_
    L2_148 = L2_148.NIL
  elseif L1_147 == L2_148 then
    L1_147 = _UPVALUE0_
    L1_147 = L1_147.INVALID_ARGUMENT
    return L1_147
  end
  L1_147 = db
  L1_147 = L1_147.existsRow
  L2_148 = _UPVALUE1_
  L1_147 = L1_147(L2_148, _UPVALUE2_, A0_146)
  L2_148 = _UPVALUE0_
  L2_148 = L2_148.FALSE
  if L1_147 == L2_148 then
    L1_147 = _UPVALUE0_
    L1_147 = L1_147.INVALID_ARGUMENT
    return L1_147
  end
  L1_147 = db
  L1_147 = L1_147.getNextRowId
  L2_148 = A0_146
  L1_147 = L1_147(L2_148, _UPVALUE1_)
  L2_148 = _UPVALUE0_
  L2_148 = L2_148.NIL
  if L1_147 == L2_148 then
    L2_148 = _UPVALUE0_
    L2_148 = L2_148.NOT_EXIST
    return L2_148
  end
  L2_148 = db
  L2_148 = L2_148.getAttribute
  L2_148 = L2_148(_UPVALUE1_, _UPVALUE2_, L1_147, _UPVALUE3_.localNetworkType)
  if L2_148 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_147
  end
  return _UPVALUE0_.SUCCESS, L1_147, L2_148
end
function localNetworkTypeSet(A0_149, A1_150)
  if A0_149 == _UPVALUE0_.NIL or tonumber(A0_149) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_149) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_150 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_150) ~= _UPVALUE3_ and tonumber(A1_150) ~= _UPVALUE4_ and tonumber(A1_150) ~= _UPVALUE5_ and tonumber(A1_150) ~= _UPVALUE6_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_149, _UPVALUE7_.dhcpOverIpsec) == _UPVALUE8_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_149
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_149, _UPVALUE7_.localNetworkType, A1_150) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_149
  end
  return _UPVALUE0_.SUCCESS, A0_149
end
function localStartIPGet()
  local L0_151, L1_152
  L0_151 = db
  L0_151 = L0_151.getNextRowId
  L1_152 = "0"
  L0_151 = L0_151(L1_152, _UPVALUE0_)
  L1_152 = db
  L1_152 = L1_152.getAttribute
  L1_152 = L1_152(_UPVALUE0_, _UPVALUE1_, L0_151, _UPVALUE2_.localStartIP)
  if L1_152 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_151, L1_152
end
function localStartIPGetNext(A0_153)
  local L1_154, L2_155
  L1_154 = _UPVALUE0_
  L1_154 = L1_154.NIL
  if A0_153 ~= L1_154 then
    L1_154 = tonumber
    L2_155 = A0_153
    L1_154 = L1_154(L2_155)
    L2_155 = _UPVALUE0_
    L2_155 = L2_155.NIL
  elseif L1_154 == L2_155 then
    L1_154 = _UPVALUE0_
    L1_154 = L1_154.INVALID_ARGUMENT
    return L1_154
  end
  L1_154 = db
  L1_154 = L1_154.existsRow
  L2_155 = _UPVALUE1_
  L1_154 = L1_154(L2_155, _UPVALUE2_, A0_153)
  L2_155 = _UPVALUE0_
  L2_155 = L2_155.FALSE
  if L1_154 == L2_155 then
    L1_154 = _UPVALUE0_
    L1_154 = L1_154.INVALID_ARGUMENT
    return L1_154
  end
  L1_154 = db
  L1_154 = L1_154.getNextRowId
  L2_155 = A0_153
  L1_154 = L1_154(L2_155, _UPVALUE1_)
  L2_155 = _UPVALUE0_
  L2_155 = L2_155.NIL
  if L1_154 == L2_155 then
    L2_155 = _UPVALUE0_
    L2_155 = L2_155.NOT_EXIST
    return L2_155
  end
  L2_155 = db
  L2_155 = L2_155.getAttribute
  L2_155 = L2_155(_UPVALUE1_, _UPVALUE2_, L1_154, _UPVALUE3_.localStartIP)
  if L2_155 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_154
  end
  return _UPVALUE0_.SUCCESS, L1_154, L2_155
end
function localStartIPSet(A0_156, A1_157)
  local L2_158, L3_159
  L2_158 = _UPVALUE0_
  L2_158 = L2_158.NIL
  if A0_156 ~= L2_158 then
    L2_158 = tonumber
    L3_159 = A0_156
    L2_158 = L2_158(L3_159)
    L3_159 = _UPVALUE0_
    L3_159 = L3_159.NIL
  elseif L2_158 == L3_159 then
    L2_158 = _UPVALUE0_
    L2_158 = L2_158.INVALID_ARGUMENT
    return L2_158
  end
  L2_158 = db
  L2_158 = L2_158.existsRow
  L3_159 = _UPVALUE1_
  L2_158 = L2_158(L3_159, _UPVALUE2_, A0_156)
  L3_159 = _UPVALUE0_
  L3_159 = L3_159.FALSE
  if L2_158 == L3_159 then
    L2_158 = _UPVALUE0_
    L2_158 = L2_158.INVALID_ARGUMENT
    return L2_158
  end
  L2_158 = _UPVALUE0_
  L2_158 = L2_158.NIL
  if A1_157 == L2_158 then
    L2_158 = _UPVALUE0_
    L2_158 = L2_158.INVALID_ARGUMENT
    return L2_158
  end
  L2_158 = _UPVALUE3_
  L2_158 = L2_158.ipAddressCheck
  L3_159 = "2"
  L2_158 = L2_158(L3_159, A1_157)
  valid = L2_158
  L2_158 = valid
  L3_159 = _UPVALUE0_
  L3_159 = L3_159.SUCCESS
  if L2_158 ~= L3_159 then
    L2_158 = _UPVALUE0_
    L2_158 = L2_158.INVALID_ARGUMENT
    return L2_158
  end
  L2_158 = db
  L2_158 = L2_158.getAttribute
  L3_159 = _UPVALUE1_
  L2_158 = L2_158(L3_159, _UPVALUE2_, A0_156, _UPVALUE4_.dhcpOverIpsec)
  L3_159 = _UPVALUE5_
  if L2_158 == L3_159 then
    L3_159 = _UPVALUE0_
    L3_159 = L3_159.DEPENDENCY_NOT_MET
    return L3_159, A0_156
  end
  L3_159 = db
  L3_159 = L3_159.getAttribute
  L3_159 = L3_159(_UPVALUE1_, _UPVALUE2_, A0_156, _UPVALUE4_.localNetworkType)
  if tonumber(L3_159) == _UPVALUE6_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_156
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_156, _UPVALUE4_.localStartIP, A1_157) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_156
  end
  return _UPVALUE0_.SUCCESS, A0_156
end
function localEndIPGet()
  local L0_160, L1_161
  L0_160 = db
  L0_160 = L0_160.getNextRowId
  L1_161 = "0"
  L0_160 = L0_160(L1_161, _UPVALUE0_)
  L1_161 = db
  L1_161 = L1_161.getAttribute
  L1_161 = L1_161(_UPVALUE0_, _UPVALUE1_, L0_160, _UPVALUE2_.localEndIP)
  if L1_161 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_160, L1_161
end
function localEndIPGetNext(A0_162)
  local L1_163, L2_164
  L1_163 = _UPVALUE0_
  L1_163 = L1_163.NIL
  if A0_162 ~= L1_163 then
    L1_163 = tonumber
    L2_164 = A0_162
    L1_163 = L1_163(L2_164)
    L2_164 = _UPVALUE0_
    L2_164 = L2_164.NIL
  elseif L1_163 == L2_164 then
    L1_163 = _UPVALUE0_
    L1_163 = L1_163.INVALID_ARGUMENT
    return L1_163
  end
  L1_163 = db
  L1_163 = L1_163.existsRow
  L2_164 = _UPVALUE1_
  L1_163 = L1_163(L2_164, _UPVALUE2_, A0_162)
  L2_164 = _UPVALUE0_
  L2_164 = L2_164.FALSE
  if L1_163 == L2_164 then
    L1_163 = _UPVALUE0_
    L1_163 = L1_163.INVALID_ARGUMENT
    return L1_163
  end
  L1_163 = db
  L1_163 = L1_163.getNextRowId
  L2_164 = A0_162
  L1_163 = L1_163(L2_164, _UPVALUE1_)
  L2_164 = _UPVALUE0_
  L2_164 = L2_164.NIL
  if L1_163 == L2_164 then
    L2_164 = _UPVALUE0_
    L2_164 = L2_164.NOT_EXIST
    return L2_164
  end
  L2_164 = db
  L2_164 = L2_164.getAttribute
  L2_164 = L2_164(_UPVALUE1_, _UPVALUE2_, L1_163, _UPVALUE3_.localEndIP)
  if L2_164 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_163
  end
  return _UPVALUE0_.SUCCESS, L1_163, L2_164
end
function localEndIPSet(A0_165, A1_166)
  local L2_167, L3_168
  L2_167 = _UPVALUE0_
  L2_167 = L2_167.NIL
  if A0_165 ~= L2_167 then
    L2_167 = tonumber
    L3_168 = A0_165
    L2_167 = L2_167(L3_168)
    L3_168 = _UPVALUE0_
    L3_168 = L3_168.NIL
  elseif L2_167 == L3_168 then
    L2_167 = _UPVALUE0_
    L2_167 = L2_167.INVALID_ARGUMENT
    return L2_167
  end
  L2_167 = db
  L2_167 = L2_167.existsRow
  L3_168 = _UPVALUE1_
  L2_167 = L2_167(L3_168, _UPVALUE2_, A0_165)
  L3_168 = _UPVALUE0_
  L3_168 = L3_168.FALSE
  if L2_167 == L3_168 then
    L2_167 = _UPVALUE0_
    L2_167 = L2_167.INVALID_ARGUMENT
    return L2_167
  end
  L2_167 = _UPVALUE0_
  L2_167 = L2_167.NIL
  if A1_166 == L2_167 then
    L2_167 = _UPVALUE0_
    L2_167 = L2_167.INVALID_ARGUMENT
    return L2_167
  end
  L2_167 = _UPVALUE3_
  L2_167 = L2_167.ipAddressCheck
  L3_168 = "2"
  L2_167 = L2_167(L3_168, A1_166)
  valid = L2_167
  L2_167 = valid
  L3_168 = _UPVALUE0_
  L3_168 = L3_168.SUCCESS
  if L2_167 ~= L3_168 then
    L2_167 = _UPVALUE0_
    L2_167 = L2_167.INVALID_ARGUMENT
    return L2_167
  end
  L2_167 = db
  L2_167 = L2_167.getAttribute
  L3_168 = _UPVALUE1_
  L2_167 = L2_167(L3_168, _UPVALUE2_, A0_165, _UPVALUE4_.dhcpOverIpsec)
  L3_168 = _UPVALUE5_
  if L2_167 == L3_168 then
    L3_168 = _UPVALUE0_
    L3_168 = L3_168.DEPENDENCY_NOT_MET
    return L3_168, A0_165
  end
  L3_168 = db
  L3_168 = L3_168.getAttribute
  L3_168 = L3_168(_UPVALUE1_, _UPVALUE2_, A0_165, _UPVALUE4_.localNetworkType)
  if tonumber(L3_168) ~= _UPVALUE6_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_165
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_165, _UPVALUE4_.localEndIP, A1_166) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_165
  end
  return _UPVALUE0_.SUCCESS, A0_165
end
function localSubnetmaskGet()
  local L0_169, L1_170
  L0_169 = db
  L0_169 = L0_169.getNextRowId
  L1_170 = "0"
  L0_169 = L0_169(L1_170, _UPVALUE0_)
  L1_170 = db
  L1_170 = L1_170.getAttribute
  L1_170 = L1_170(_UPVALUE0_, _UPVALUE1_, L0_169, _UPVALUE2_.localSubnetmask)
  if L1_170 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_169, L1_170
end
function localSubnetmaskGetNext(A0_171)
  local L1_172, L2_173
  L1_172 = _UPVALUE0_
  L1_172 = L1_172.NIL
  if A0_171 ~= L1_172 then
    L1_172 = tonumber
    L2_173 = A0_171
    L1_172 = L1_172(L2_173)
    L2_173 = _UPVALUE0_
    L2_173 = L2_173.NIL
  elseif L1_172 == L2_173 then
    L1_172 = _UPVALUE0_
    L1_172 = L1_172.INVALID_ARGUMENT
    return L1_172
  end
  L1_172 = db
  L1_172 = L1_172.existsRow
  L2_173 = _UPVALUE1_
  L1_172 = L1_172(L2_173, _UPVALUE2_, A0_171)
  L2_173 = _UPVALUE0_
  L2_173 = L2_173.FALSE
  if L1_172 == L2_173 then
    L1_172 = _UPVALUE0_
    L1_172 = L1_172.INVALID_ARGUMENT
    return L1_172
  end
  L1_172 = db
  L1_172 = L1_172.getNextRowId
  L2_173 = A0_171
  L1_172 = L1_172(L2_173, _UPVALUE1_)
  L2_173 = _UPVALUE0_
  L2_173 = L2_173.NIL
  if L1_172 == L2_173 then
    L2_173 = _UPVALUE0_
    L2_173 = L2_173.NOT_EXIST
    return L2_173
  end
  L2_173 = db
  L2_173 = L2_173.getAttribute
  L2_173 = L2_173(_UPVALUE1_, _UPVALUE2_, L1_172, _UPVALUE3_.localSubnetmask)
  if L2_173 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_172
  end
  return _UPVALUE0_.SUCCESS, L1_172, L2_173
end
function localSubnetmaskSet(A0_174, A1_175)
  local L2_176, L3_177
  L2_176 = _UPVALUE0_
  L2_176 = L2_176.NIL
  if A0_174 ~= L2_176 then
    L2_176 = tonumber
    L3_177 = A0_174
    L2_176 = L2_176(L3_177)
    L3_177 = _UPVALUE0_
    L3_177 = L3_177.NIL
  elseif L2_176 == L3_177 then
    L2_176 = _UPVALUE0_
    L2_176 = L2_176.INVALID_ARGUMENT
    return L2_176
  end
  L2_176 = db
  L2_176 = L2_176.existsRow
  L3_177 = _UPVALUE1_
  L2_176 = L2_176(L3_177, _UPVALUE2_, A0_174)
  L3_177 = _UPVALUE0_
  L3_177 = L3_177.FALSE
  if L2_176 == L3_177 then
    L2_176 = _UPVALUE0_
    L2_176 = L2_176.INVALID_ARGUMENT
    return L2_176
  end
  L2_176 = _UPVALUE0_
  L2_176 = L2_176.NIL
  if A1_175 == L2_176 then
    L2_176 = _UPVALUE0_
    L2_176 = L2_176.INVALID_ARGUMENT
    return L2_176
  end
  L2_176 = _UPVALUE3_
  L2_176 = L2_176.ipAddressCheck
  L3_177 = "2"
  L2_176 = L2_176(L3_177, A1_175)
  valid = L2_176
  L2_176 = valid
  L3_177 = _UPVALUE0_
  L3_177 = L3_177.SUCCESS
  if L2_176 ~= L3_177 then
    L2_176 = _UPVALUE0_
    L2_176 = L2_176.INVALID_ARGUMENT
    return L2_176
  end
  L2_176 = db
  L2_176 = L2_176.getAttribute
  L3_177 = _UPVALUE1_
  L2_176 = L2_176(L3_177, _UPVALUE2_, A0_174, _UPVALUE4_.dhcpOverIpsec)
  L3_177 = _UPVALUE5_
  if L2_176 == L3_177 then
    L3_177 = _UPVALUE0_
    L3_177 = L3_177.DEPENDENCY_NOT_MET
    return L3_177, A0_174
  end
  L3_177 = db
  L3_177 = L3_177.getAttribute
  L3_177 = L3_177(_UPVALUE1_, _UPVALUE2_, A0_174, _UPVALUE4_.localNetworkType)
  if tonumber(L3_177) ~= _UPVALUE6_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_174
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_174, _UPVALUE4_.localSubnetmask, A1_175) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_174
  end
  return _UPVALUE0_.SUCCESS, A0_174
end
function localPrefixLengthGet()
  local L0_178, L1_179
  L0_178 = db
  L0_178 = L0_178.getNextRowId
  L1_179 = "0"
  L0_178 = L0_178(L1_179, _UPVALUE0_)
  L1_179 = db
  L1_179 = L1_179.getAttribute
  L1_179 = L1_179(_UPVALUE0_, _UPVALUE1_, L0_178, _UPVALUE2_.localPrefixLength)
  if L1_179 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_178, L1_179
end
function localPrefixLengthGetNext(A0_180)
  local L1_181, L2_182
  L1_181 = _UPVALUE0_
  L1_181 = L1_181.NIL
  if A0_180 ~= L1_181 then
    L1_181 = tonumber
    L2_182 = A0_180
    L1_181 = L1_181(L2_182)
    L2_182 = _UPVALUE0_
    L2_182 = L2_182.NIL
  elseif L1_181 == L2_182 then
    L1_181 = _UPVALUE0_
    L1_181 = L1_181.INVALID_ARGUMENT
    return L1_181
  end
  L1_181 = db
  L1_181 = L1_181.existsRow
  L2_182 = _UPVALUE1_
  L1_181 = L1_181(L2_182, _UPVALUE2_, A0_180)
  L2_182 = _UPVALUE0_
  L2_182 = L2_182.FALSE
  if L1_181 == L2_182 then
    L1_181 = _UPVALUE0_
    L1_181 = L1_181.INVALID_ARGUMENT
    return L1_181
  end
  L1_181 = db
  L1_181 = L1_181.getNextRowId
  L2_182 = A0_180
  L1_181 = L1_181(L2_182, _UPVALUE1_)
  L2_182 = _UPVALUE0_
  L2_182 = L2_182.NIL
  if L1_181 == L2_182 then
    L2_182 = _UPVALUE0_
    L2_182 = L2_182.NOT_EXIST
    return L2_182
  end
  L2_182 = db
  L2_182 = L2_182.getAttribute
  L2_182 = L2_182(_UPVALUE1_, _UPVALUE2_, L1_181, _UPVALUE3_.localPrefixLength)
  if L2_182 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_181
  end
  return _UPVALUE0_.SUCCESS, L1_181, L2_182
end
function localPrefixLengthSet(A0_183, A1_184)
  if A0_183 == _UPVALUE0_.NIL or tonumber(A0_183) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_183) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_184 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_183, _UPVALUE3_.dhcpOverIpsec) == _UPVALUE4_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_183
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_183, _UPVALUE3_.localPrefixLength, A1_184) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_183
  end
  return _UPVALUE0_.SUCCESS, A0_183
end
function remoteNetworkTypeGet()
  local L0_185, L1_186
  L0_185 = db
  L0_185 = L0_185.getNextRowId
  L1_186 = "0"
  L0_185 = L0_185(L1_186, _UPVALUE0_)
  L1_186 = db
  L1_186 = L1_186.getAttribute
  L1_186 = L1_186(_UPVALUE0_, _UPVALUE1_, L0_185, _UPVALUE2_.remoteNetworkType)
  if L1_186 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_185, L1_186
end
function remoteNetworkTypeGetNext(A0_187)
  local L1_188, L2_189
  L1_188 = _UPVALUE0_
  L1_188 = L1_188.NIL
  if A0_187 ~= L1_188 then
    L1_188 = tonumber
    L2_189 = A0_187
    L1_188 = L1_188(L2_189)
    L2_189 = _UPVALUE0_
    L2_189 = L2_189.NIL
  elseif L1_188 == L2_189 then
    L1_188 = _UPVALUE0_
    L1_188 = L1_188.INVALID_ARGUMENT
    return L1_188
  end
  L1_188 = db
  L1_188 = L1_188.existsRow
  L2_189 = _UPVALUE1_
  L1_188 = L1_188(L2_189, _UPVALUE2_, A0_187)
  L2_189 = _UPVALUE0_
  L2_189 = L2_189.FALSE
  if L1_188 == L2_189 then
    L1_188 = _UPVALUE0_
    L1_188 = L1_188.INVALID_ARGUMENT
    return L1_188
  end
  L1_188 = db
  L1_188 = L1_188.getNextRowId
  L2_189 = A0_187
  L1_188 = L1_188(L2_189, _UPVALUE1_)
  L2_189 = _UPVALUE0_
  L2_189 = L2_189.NIL
  if L1_188 == L2_189 then
    L2_189 = _UPVALUE0_
    L2_189 = L2_189.NOT_EXIST
    return L2_189
  end
  L2_189 = db
  L2_189 = L2_189.getAttribute
  L2_189 = L2_189(_UPVALUE1_, _UPVALUE2_, L1_188, _UPVALUE3_.remoteNetworkType)
  if L2_189 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_188
  end
  return _UPVALUE0_.SUCCESS, L1_188, L2_189
end
function remoteNetworkTypeSet(A0_190, A1_191)
  if A0_190 == _UPVALUE0_.NIL or tonumber(A0_190) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_190) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_191 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_190, _UPVALUE3_.dhcpOverIpsec) == _UPVALUE4_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_190
  end
  if tonumber(A1_191) ~= _UPVALUE5_ and tonumber(A1_191) ~= _UPVALUE6_ and tonumber(A1_191) ~= _UPVALUE7_ and tonumber(A1_191) ~= _UPVALUE8_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_190, _UPVALUE3_.remoteNetworkType, A1_191) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_190
  end
  return _UPVALUE0_.SUCCESS, A0_190
end
function remoteStartAddressGet()
  local L0_192, L1_193
  L0_192 = db
  L0_192 = L0_192.getNextRowId
  L1_193 = "0"
  L0_192 = L0_192(L1_193, _UPVALUE0_)
  L1_193 = db
  L1_193 = L1_193.getAttribute
  L1_193 = L1_193(_UPVALUE0_, _UPVALUE1_, L0_192, _UPVALUE2_.remoteStartAddress)
  if L1_193 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_192, L1_193
end
function remoteStartAddressGetNext(A0_194)
  local L1_195, L2_196
  L1_195 = _UPVALUE0_
  L1_195 = L1_195.NIL
  if A0_194 ~= L1_195 then
    L1_195 = tonumber
    L2_196 = A0_194
    L1_195 = L1_195(L2_196)
    L2_196 = _UPVALUE0_
    L2_196 = L2_196.NIL
  elseif L1_195 == L2_196 then
    L1_195 = _UPVALUE0_
    L1_195 = L1_195.INVALID_ARGUMENT
    return L1_195
  end
  L1_195 = db
  L1_195 = L1_195.existsRow
  L2_196 = _UPVALUE1_
  L1_195 = L1_195(L2_196, _UPVALUE2_, A0_194)
  L2_196 = _UPVALUE0_
  L2_196 = L2_196.FALSE
  if L1_195 == L2_196 then
    L1_195 = _UPVALUE0_
    L1_195 = L1_195.INVALID_ARGUMENT
    return L1_195
  end
  L1_195 = db
  L1_195 = L1_195.getNextRowId
  L2_196 = A0_194
  L1_195 = L1_195(L2_196, _UPVALUE1_)
  L2_196 = _UPVALUE0_
  L2_196 = L2_196.NIL
  if L1_195 == L2_196 then
    L2_196 = _UPVALUE0_
    L2_196 = L2_196.NOT_EXIST
    return L2_196
  end
  L2_196 = db
  L2_196 = L2_196.getAttribute
  L2_196 = L2_196(_UPVALUE1_, _UPVALUE2_, L1_195, _UPVALUE3_.remoteStartAddress)
  if L2_196 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_195
  end
  return _UPVALUE0_.SUCCESS, L1_195, L2_196
end
function remoteStartAddressSet(A0_197, A1_198)
  local L2_199, L3_200
  L2_199 = _UPVALUE0_
  L2_199 = L2_199.NIL
  if A0_197 ~= L2_199 then
    L2_199 = tonumber
    L3_200 = A0_197
    L2_199 = L2_199(L3_200)
    L3_200 = _UPVALUE0_
    L3_200 = L3_200.NIL
  elseif L2_199 == L3_200 then
    L2_199 = _UPVALUE0_
    L2_199 = L2_199.INVALID_ARGUMENT
    return L2_199
  end
  L2_199 = db
  L2_199 = L2_199.existsRow
  L3_200 = _UPVALUE1_
  L2_199 = L2_199(L3_200, _UPVALUE2_, A0_197)
  L3_200 = _UPVALUE0_
  L3_200 = L3_200.FALSE
  if L2_199 == L3_200 then
    L2_199 = _UPVALUE0_
    L2_199 = L2_199.INVALID_ARGUMENT
    return L2_199
  end
  L2_199 = _UPVALUE0_
  L2_199 = L2_199.NIL
  if A1_198 == L2_199 then
    L2_199 = _UPVALUE0_
    L2_199 = L2_199.INVALID_ARGUMENT
    return L2_199
  end
  L2_199 = db
  L2_199 = L2_199.getAttribute
  L3_200 = _UPVALUE1_
  L2_199 = L2_199(L3_200, _UPVALUE2_, A0_197, _UPVALUE3_.dhcpOverIpsec)
  L3_200 = _UPVALUE4_
  if L2_199 == L3_200 then
    L3_200 = _UPVALUE0_
    L3_200 = L3_200.DEPENDENCY_NOT_MET
    return L3_200, A0_197
  end
  L3_200 = _UPVALUE5_
  L3_200 = L3_200.ipAddressCheck
  L3_200 = L3_200("2", A1_198)
  valid = L3_200
  L3_200 = valid
  if L3_200 ~= _UPVALUE0_.SUCCESS then
    L3_200 = _UPVALUE0_
    L3_200 = L3_200.INVALID_ARGUMENT
    return L3_200
  end
  L3_200 = db
  L3_200 = L3_200.getAttribute
  L3_200 = L3_200(_UPVALUE1_, _UPVALUE2_, A0_197, _UPVALUE3_.remoteNetworkType)
  if tonumber(L3_200) == _UPVALUE6_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_197
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_197, _UPVALUE3_.remoteStartAddress, A1_198) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_197
  end
  return _UPVALUE0_.SUCCESS, A0_197
end
function remoteEndAddressGet()
  local L0_201, L1_202
  L0_201 = db
  L0_201 = L0_201.getNextRowId
  L1_202 = "0"
  L0_201 = L0_201(L1_202, _UPVALUE0_)
  L1_202 = db
  L1_202 = L1_202.getAttribute
  L1_202 = L1_202(_UPVALUE0_, _UPVALUE1_, L0_201, _UPVALUE2_.remoteEndAddress)
  if L1_202 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_201, L1_202
end
function remoteEndAddressGetNext(A0_203)
  local L1_204, L2_205
  L1_204 = _UPVALUE0_
  L1_204 = L1_204.NIL
  if A0_203 ~= L1_204 then
    L1_204 = tonumber
    L2_205 = A0_203
    L1_204 = L1_204(L2_205)
    L2_205 = _UPVALUE0_
    L2_205 = L2_205.NIL
  elseif L1_204 == L2_205 then
    L1_204 = _UPVALUE0_
    L1_204 = L1_204.INVALID_ARGUMENT
    return L1_204
  end
  L1_204 = db
  L1_204 = L1_204.existsRow
  L2_205 = _UPVALUE1_
  L1_204 = L1_204(L2_205, _UPVALUE2_, A0_203)
  L2_205 = _UPVALUE0_
  L2_205 = L2_205.FALSE
  if L1_204 == L2_205 then
    L1_204 = _UPVALUE0_
    L1_204 = L1_204.INVALID_ARGUMENT
    return L1_204
  end
  L1_204 = db
  L1_204 = L1_204.getNextRowId
  L2_205 = A0_203
  L1_204 = L1_204(L2_205, _UPVALUE1_)
  L2_205 = _UPVALUE0_
  L2_205 = L2_205.NIL
  if L1_204 == L2_205 then
    L2_205 = _UPVALUE0_
    L2_205 = L2_205.NOT_EXIST
    return L2_205
  end
  L2_205 = db
  L2_205 = L2_205.getAttribute
  L2_205 = L2_205(_UPVALUE1_, _UPVALUE2_, L1_204, _UPVALUE3_.remoteEndAddress)
  if L2_205 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_204
  end
  return _UPVALUE0_.SUCCESS, L1_204, L2_205
end
function remoteEndAddressSet(A0_206, A1_207)
  local L2_208, L3_209
  L2_208 = _UPVALUE0_
  L2_208 = L2_208.NIL
  if A0_206 ~= L2_208 then
    L2_208 = tonumber
    L3_209 = A0_206
    L2_208 = L2_208(L3_209)
    L3_209 = _UPVALUE0_
    L3_209 = L3_209.NIL
  elseif L2_208 == L3_209 then
    L2_208 = _UPVALUE0_
    L2_208 = L2_208.INVALID_ARGUMENT
    return L2_208
  end
  L2_208 = db
  L2_208 = L2_208.existsRow
  L3_209 = _UPVALUE1_
  L2_208 = L2_208(L3_209, _UPVALUE2_, A0_206)
  L3_209 = _UPVALUE0_
  L3_209 = L3_209.FALSE
  if L2_208 == L3_209 then
    L2_208 = _UPVALUE0_
    L2_208 = L2_208.INVALID_ARGUMENT
    return L2_208
  end
  L2_208 = _UPVALUE0_
  L2_208 = L2_208.NIL
  if A1_207 == L2_208 then
    L2_208 = _UPVALUE0_
    L2_208 = L2_208.INVALID_ARGUMENT
    return L2_208
  end
  L2_208 = db
  L2_208 = L2_208.getAttribute
  L3_209 = _UPVALUE1_
  L2_208 = L2_208(L3_209, _UPVALUE2_, A0_206, _UPVALUE3_.dhcpOverIpsec)
  L3_209 = _UPVALUE4_
  if L2_208 == L3_209 then
    L3_209 = _UPVALUE0_
    L3_209 = L3_209.DEPENDENCY_NOT_MET
    return L3_209, A0_206
  end
  L3_209 = _UPVALUE5_
  L3_209 = L3_209.ipAddressCheck
  L3_209 = L3_209("2", A1_207)
  valid = L3_209
  L3_209 = valid
  if L3_209 ~= _UPVALUE0_.SUCCESS then
    L3_209 = _UPVALUE0_
    L3_209 = L3_209.INVALID_ARGUMENT
    return L3_209
  end
  L3_209 = db
  L3_209 = L3_209.getAttribute
  L3_209 = L3_209(_UPVALUE1_, _UPVALUE2_, A0_206, _UPVALUE3_.remoteNetworkType)
  if tonumber(L3_209) ~= _UPVALUE6_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_206
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_206, _UPVALUE3_.remoteEndAddress, A1_207) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_206
  end
  return _UPVALUE0_.SUCCESS, A0_206
end
function remoteSubnetmaskGet()
  local L0_210, L1_211
  L0_210 = db
  L0_210 = L0_210.getNextRowId
  L1_211 = "0"
  L0_210 = L0_210(L1_211, _UPVALUE0_)
  L1_211 = db
  L1_211 = L1_211.getAttribute
  L1_211 = L1_211(_UPVALUE0_, _UPVALUE1_, L0_210, _UPVALUE2_.remoteSubnetmask)
  if L1_211 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_210, L1_211
end
function remoteSubnetmaskGetNext(A0_212)
  local L1_213, L2_214
  L1_213 = _UPVALUE0_
  L1_213 = L1_213.NIL
  if A0_212 ~= L1_213 then
    L1_213 = tonumber
    L2_214 = A0_212
    L1_213 = L1_213(L2_214)
    L2_214 = _UPVALUE0_
    L2_214 = L2_214.NIL
  elseif L1_213 == L2_214 then
    L1_213 = _UPVALUE0_
    L1_213 = L1_213.INVALID_ARGUMENT
    return L1_213
  end
  L1_213 = db
  L1_213 = L1_213.existsRow
  L2_214 = _UPVALUE1_
  L1_213 = L1_213(L2_214, _UPVALUE2_, A0_212)
  L2_214 = _UPVALUE0_
  L2_214 = L2_214.FALSE
  if L1_213 == L2_214 then
    L1_213 = _UPVALUE0_
    L1_213 = L1_213.INVALID_ARGUMENT
    return L1_213
  end
  L1_213 = db
  L1_213 = L1_213.getNextRowId
  L2_214 = A0_212
  L1_213 = L1_213(L2_214, _UPVALUE1_)
  L2_214 = _UPVALUE0_
  L2_214 = L2_214.NIL
  if L1_213 == L2_214 then
    L2_214 = _UPVALUE0_
    L2_214 = L2_214.NOT_EXIST
    return L2_214
  end
  L2_214 = db
  L2_214 = L2_214.getAttribute
  L2_214 = L2_214(_UPVALUE1_, _UPVALUE2_, L1_213, _UPVALUE3_.remoteSubnetmask)
  if L2_214 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_213
  end
  return _UPVALUE0_.SUCCESS, L1_213, L2_214
end
function remoteSubnetmaskSet(A0_215, A1_216)
  local L2_217, L3_218
  L2_217 = _UPVALUE0_
  L2_217 = L2_217.NIL
  if A0_215 ~= L2_217 then
    L2_217 = tonumber
    L3_218 = A0_215
    L2_217 = L2_217(L3_218)
    L3_218 = _UPVALUE0_
    L3_218 = L3_218.NIL
  elseif L2_217 == L3_218 then
    L2_217 = _UPVALUE0_
    L2_217 = L2_217.INVALID_ARGUMENT
    return L2_217
  end
  L2_217 = db
  L2_217 = L2_217.existsRow
  L3_218 = _UPVALUE1_
  L2_217 = L2_217(L3_218, _UPVALUE2_, A0_215)
  L3_218 = _UPVALUE0_
  L3_218 = L3_218.FALSE
  if L2_217 == L3_218 then
    L2_217 = _UPVALUE0_
    L2_217 = L2_217.INVALID_ARGUMENT
    return L2_217
  end
  L2_217 = _UPVALUE0_
  L2_217 = L2_217.NIL
  if A1_216 == L2_217 then
    L2_217 = _UPVALUE0_
    L2_217 = L2_217.INVALID_ARGUMENT
    return L2_217
  end
  L2_217 = db
  L2_217 = L2_217.getAttribute
  L3_218 = _UPVALUE1_
  L2_217 = L2_217(L3_218, _UPVALUE2_, A0_215, _UPVALUE3_.dhcpOverIpsec)
  L3_218 = _UPVALUE4_
  if L2_217 == L3_218 then
    L3_218 = _UPVALUE0_
    L3_218 = L3_218.DEPENDENCY_NOT_MET
    return L3_218, A0_215
  end
  L3_218 = _UPVALUE5_
  L3_218 = L3_218.ipAddressCheck
  L3_218 = L3_218("2", A1_216)
  valid = L3_218
  L3_218 = valid
  if L3_218 ~= _UPVALUE0_.SUCCESS then
    L3_218 = _UPVALUE0_
    L3_218 = L3_218.INVALID_ARGUMENT
    return L3_218
  end
  L3_218 = db
  L3_218 = L3_218.getAttribute
  L3_218 = L3_218(_UPVALUE1_, _UPVALUE2_, A0_215, _UPVALUE3_.remoteNetworkType)
  if tonumber(L3_218) ~= _UPVALUE6_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_215
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_215, _UPVALUE3_.remoteSubnetmask, A1_216) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_215
  end
  return _UPVALUE0_.SUCCESS, A0_215
end
function remotePrefixLengthGet()
  local L0_219, L1_220
  L0_219 = db
  L0_219 = L0_219.getNextRowId
  L1_220 = "0"
  L0_219 = L0_219(L1_220, _UPVALUE0_)
  L1_220 = db
  L1_220 = L1_220.getAttribute
  L1_220 = L1_220(_UPVALUE0_, _UPVALUE1_, L0_219, _UPVALUE2_.remotePrefixLength)
  if L1_220 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_219, L1_220
end
function remotePrefixLengthGetNext(A0_221)
  local L1_222, L2_223
  L1_222 = _UPVALUE0_
  L1_222 = L1_222.NIL
  if A0_221 ~= L1_222 then
    L1_222 = tonumber
    L2_223 = A0_221
    L1_222 = L1_222(L2_223)
    L2_223 = _UPVALUE0_
    L2_223 = L2_223.NIL
  elseif L1_222 == L2_223 then
    L1_222 = _UPVALUE0_
    L1_222 = L1_222.INVALID_ARGUMENT
    return L1_222
  end
  L1_222 = db
  L1_222 = L1_222.existsRow
  L2_223 = _UPVALUE1_
  L1_222 = L1_222(L2_223, _UPVALUE2_, A0_221)
  L2_223 = _UPVALUE0_
  L2_223 = L2_223.FALSE
  if L1_222 == L2_223 then
    L1_222 = _UPVALUE0_
    L1_222 = L1_222.INVALID_ARGUMENT
    return L1_222
  end
  L1_222 = db
  L1_222 = L1_222.getNextRowId
  L2_223 = A0_221
  L1_222 = L1_222(L2_223, _UPVALUE1_)
  L2_223 = _UPVALUE0_
  L2_223 = L2_223.NIL
  if L1_222 == L2_223 then
    L2_223 = _UPVALUE0_
    L2_223 = L2_223.NOT_EXIST
    return L2_223
  end
  L2_223 = db
  L2_223 = L2_223.getAttribute
  L2_223 = L2_223(_UPVALUE1_, _UPVALUE2_, L1_222, _UPVALUE3_.remotePrefixLength)
  if L2_223 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_222
  end
  return _UPVALUE0_.SUCCESS, L1_222, L2_223
end
function remotePrefixLengthSet(A0_224, A1_225)
  if A0_224 == _UPVALUE0_.NIL or tonumber(A0_224) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_224) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_225 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_224, _UPVALUE3_.dhcpOverIpsec) == _UPVALUE4_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_224
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_224, _UPVALUE3_.remotePrefixLength, A1_225) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_224
  end
  return _UPVALUE0_.SUCCESS, A0_224
end
function ipsecSPIInGet()
  local L0_226, L1_227
  L0_226 = db
  L0_226 = L0_226.getNextRowId
  L1_227 = "0"
  L0_226 = L0_226(L1_227, _UPVALUE0_)
  L1_227 = db
  L1_227 = L1_227.getAttribute
  L1_227 = L1_227(_UPVALUE0_, _UPVALUE1_, L0_226, _UPVALUE2_.ipsecSPIIn)
  if L1_227 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_226, L1_227
end
function ipsecSPIInGetNext(A0_228)
  local L1_229, L2_230
  L1_229 = _UPVALUE0_
  L1_229 = L1_229.NIL
  if A0_228 ~= L1_229 then
    L1_229 = tonumber
    L2_230 = A0_228
    L1_229 = L1_229(L2_230)
    L2_230 = _UPVALUE0_
    L2_230 = L2_230.NIL
  elseif L1_229 == L2_230 then
    L1_229 = _UPVALUE0_
    L1_229 = L1_229.INVALID_ARGUMENT
    return L1_229
  end
  L1_229 = db
  L1_229 = L1_229.existsRow
  L2_230 = _UPVALUE1_
  L1_229 = L1_229(L2_230, _UPVALUE2_, A0_228)
  L2_230 = _UPVALUE0_
  L2_230 = L2_230.FALSE
  if L1_229 == L2_230 then
    L1_229 = _UPVALUE0_
    L1_229 = L1_229.INVALID_ARGUMENT
    return L1_229
  end
  L1_229 = db
  L1_229 = L1_229.getNextRowId
  L2_230 = A0_228
  L1_229 = L1_229(L2_230, _UPVALUE1_)
  L2_230 = _UPVALUE0_
  L2_230 = L2_230.NIL
  if L1_229 == L2_230 then
    L2_230 = _UPVALUE0_
    L2_230 = L2_230.NOT_EXIST
    return L2_230
  end
  L2_230 = db
  L2_230 = L2_230.getAttribute
  L2_230 = L2_230(_UPVALUE1_, _UPVALUE2_, L1_229, _UPVALUE3_.ipsecSPIIn)
  if L2_230 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_229
  end
  return _UPVALUE0_.SUCCESS, L1_229, L2_230
end
function ipsecSPIInSet(A0_231, A1_232)
  local L2_233
  L2_233 = _UPVALUE0_
  L2_233 = L2_233.NIL
  if A0_231 ~= L2_233 then
    L2_233 = tonumber
    L2_233 = L2_233(A0_231)
  elseif L2_233 == _UPVALUE0_.NIL then
    L2_233 = _UPVALUE0_
    L2_233 = L2_233.INVALID_ARGUMENT
    return L2_233
  end
  L2_233 = db
  L2_233 = L2_233.existsRow
  L2_233 = L2_233(_UPVALUE1_, _UPVALUE2_, A0_231)
  if L2_233 == _UPVALUE0_.FALSE then
    L2_233 = _UPVALUE0_
    L2_233 = L2_233.INVALID_ARGUMENT
    return L2_233
  end
  L2_233 = _UPVALUE0_
  L2_233 = L2_233.NIL
  if A1_232 == L2_233 then
    L2_233 = _UPVALUE0_
    L2_233 = L2_233.INVALID_ARGUMENT
    return L2_233
  end
  L2_233 = db
  L2_233 = L2_233.getAttribute
  L2_233 = L2_233(_UPVALUE1_, _UPVALUE2_, A0_231, _UPVALUE3_.policyType)
  if tonumber(L2_233) ~= _UPVALUE4_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_231
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_231, _UPVALUE3_.ipsecSPIIn, A1_232) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_231
  end
  return _UPVALUE0_.SUCCESS, A0_231
end
function ipsecSPIOutGet()
  local L0_234, L1_235
  L0_234 = db
  L0_234 = L0_234.getNextRowId
  L1_235 = "0"
  L0_234 = L0_234(L1_235, _UPVALUE0_)
  L1_235 = db
  L1_235 = L1_235.getAttribute
  L1_235 = L1_235(_UPVALUE0_, _UPVALUE1_, L0_234, _UPVALUE2_.ipsecSPIOut)
  if L1_235 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_234, L1_235
end
function ipsecSPIOutGetNext(A0_236)
  local L1_237, L2_238
  L1_237 = _UPVALUE0_
  L1_237 = L1_237.NIL
  if A0_236 ~= L1_237 then
    L1_237 = tonumber
    L2_238 = A0_236
    L1_237 = L1_237(L2_238)
    L2_238 = _UPVALUE0_
    L2_238 = L2_238.NIL
  elseif L1_237 == L2_238 then
    L1_237 = _UPVALUE0_
    L1_237 = L1_237.INVALID_ARGUMENT
    return L1_237
  end
  L1_237 = db
  L1_237 = L1_237.existsRow
  L2_238 = _UPVALUE1_
  L1_237 = L1_237(L2_238, _UPVALUE2_, A0_236)
  L2_238 = _UPVALUE0_
  L2_238 = L2_238.FALSE
  if L1_237 == L2_238 then
    L1_237 = _UPVALUE0_
    L1_237 = L1_237.INVALID_ARGUMENT
    return L1_237
  end
  L1_237 = db
  L1_237 = L1_237.getNextRowId
  L2_238 = A0_236
  L1_237 = L1_237(L2_238, _UPVALUE1_)
  L2_238 = _UPVALUE0_
  L2_238 = L2_238.NIL
  if L1_237 == L2_238 then
    L2_238 = _UPVALUE0_
    L2_238 = L2_238.NOT_EXIST
    return L2_238
  end
  L2_238 = db
  L2_238 = L2_238.getAttribute
  L2_238 = L2_238(_UPVALUE1_, _UPVALUE2_, L1_237, _UPVALUE3_.ipsecSPIOut)
  if L2_238 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_237
  end
  return _UPVALUE0_.SUCCESS, L1_237, L2_238
end
function ipsecSPIOutSet(A0_239, A1_240)
  local L2_241
  L2_241 = _UPVALUE0_
  L2_241 = L2_241.NIL
  if A0_239 ~= L2_241 then
    L2_241 = tonumber
    L2_241 = L2_241(A0_239)
  elseif L2_241 == _UPVALUE0_.NIL then
    L2_241 = _UPVALUE0_
    L2_241 = L2_241.INVALID_ARGUMENT
    return L2_241
  end
  L2_241 = db
  L2_241 = L2_241.existsRow
  L2_241 = L2_241(_UPVALUE1_, _UPVALUE2_, A0_239)
  if L2_241 == _UPVALUE0_.FALSE then
    L2_241 = _UPVALUE0_
    L2_241 = L2_241.INVALID_ARGUMENT
    return L2_241
  end
  L2_241 = _UPVALUE0_
  L2_241 = L2_241.NIL
  if A1_240 == L2_241 then
    L2_241 = _UPVALUE0_
    L2_241 = L2_241.INVALID_ARGUMENT
    return L2_241
  end
  L2_241 = db
  L2_241 = L2_241.getAttribute
  L2_241 = L2_241(_UPVALUE1_, _UPVALUE2_, A0_239, _UPVALUE3_.policyType)
  if tonumber(L2_241) ~= _UPVALUE4_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_239
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_239, _UPVALUE3_.ipsecSPIOut, A1_240) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_239
  end
  return _UPVALUE0_.SUCCESS, A0_239
end
function encryptionKeyInGet()
  local L0_242, L1_243
  L0_242 = db
  L0_242 = L0_242.getNextRowId
  L1_243 = "0"
  L0_242 = L0_242(L1_243, _UPVALUE0_)
  L1_243 = db
  L1_243 = L1_243.getAttribute
  L1_243 = L1_243(_UPVALUE0_, _UPVALUE1_, L0_242, _UPVALUE2_.encryptionKeyIn)
  if L1_243 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_242, L1_243
end
function encryptionKeyInGetNext(A0_244)
  local L1_245, L2_246
  L1_245 = _UPVALUE0_
  L1_245 = L1_245.NIL
  if A0_244 ~= L1_245 then
    L1_245 = tonumber
    L2_246 = A0_244
    L1_245 = L1_245(L2_246)
    L2_246 = _UPVALUE0_
    L2_246 = L2_246.NIL
  elseif L1_245 == L2_246 then
    L1_245 = _UPVALUE0_
    L1_245 = L1_245.INVALID_ARGUMENT
    return L1_245
  end
  L1_245 = db
  L1_245 = L1_245.existsRow
  L2_246 = _UPVALUE1_
  L1_245 = L1_245(L2_246, _UPVALUE2_, A0_244)
  L2_246 = _UPVALUE0_
  L2_246 = L2_246.FALSE
  if L1_245 == L2_246 then
    L1_245 = _UPVALUE0_
    L1_245 = L1_245.INVALID_ARGUMENT
    return L1_245
  end
  L1_245 = db
  L1_245 = L1_245.getNextRowId
  L2_246 = A0_244
  L1_245 = L1_245(L2_246, _UPVALUE1_)
  L2_246 = _UPVALUE0_
  L2_246 = L2_246.NIL
  if L1_245 == L2_246 then
    L2_246 = _UPVALUE0_
    L2_246 = L2_246.NOT_EXIST
    return L2_246
  end
  L2_246 = db
  L2_246 = L2_246.getAttribute
  L2_246 = L2_246(_UPVALUE1_, _UPVALUE2_, L1_245, _UPVALUE3_.encryptionKeyIn)
  if L2_246 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_245
  end
  return _UPVALUE0_.SUCCESS, L1_245, L2_246
end
function encryptionKeyInSet(A0_247, A1_248)
  local L2_249
  L2_249 = _UPVALUE0_
  L2_249 = L2_249.NIL
  if A0_247 ~= L2_249 then
    L2_249 = tonumber
    L2_249 = L2_249(A0_247)
  elseif L2_249 == _UPVALUE0_.NIL then
    L2_249 = _UPVALUE0_
    L2_249 = L2_249.INVALID_ARGUMENT
    return L2_249
  end
  L2_249 = db
  L2_249 = L2_249.existsRow
  L2_249 = L2_249(_UPVALUE1_, _UPVALUE2_, A0_247)
  if L2_249 == _UPVALUE0_.FALSE then
    L2_249 = _UPVALUE0_
    L2_249 = L2_249.INVALID_ARGUMENT
    return L2_249
  end
  L2_249 = _UPVALUE0_
  L2_249 = L2_249.NIL
  if A1_248 == L2_249 then
    L2_249 = _UPVALUE0_
    L2_249 = L2_249.INVALID_ARGUMENT
    return L2_249
  end
  L2_249 = db
  L2_249 = L2_249.getAttribute
  L2_249 = L2_249(_UPVALUE1_, _UPVALUE2_, A0_247, _UPVALUE3_.policyType)
  if tonumber(L2_249) ~= _UPVALUE4_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_247
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_247, _UPVALUE3_.encryptionKeyIn, A1_248) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_247
  end
  return _UPVALUE0_.SUCCESS, A0_247
end
function encryptionKeyOutGet()
  local L0_250, L1_251
  L0_250 = db
  L0_250 = L0_250.getNextRowId
  L1_251 = "0"
  L0_250 = L0_250(L1_251, _UPVALUE0_)
  L1_251 = db
  L1_251 = L1_251.getAttribute
  L1_251 = L1_251(_UPVALUE0_, _UPVALUE1_, L0_250, _UPVALUE2_.encryptionKeyOut)
  if L1_251 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_250, L1_251
end
function encryptionKeyOutGetNext(A0_252)
  local L1_253, L2_254
  L1_253 = _UPVALUE0_
  L1_253 = L1_253.NIL
  if A0_252 ~= L1_253 then
    L1_253 = tonumber
    L2_254 = A0_252
    L1_253 = L1_253(L2_254)
    L2_254 = _UPVALUE0_
    L2_254 = L2_254.NIL
  elseif L1_253 == L2_254 then
    L1_253 = _UPVALUE0_
    L1_253 = L1_253.INVALID_ARGUMENT
    return L1_253
  end
  L1_253 = db
  L1_253 = L1_253.existsRow
  L2_254 = _UPVALUE1_
  L1_253 = L1_253(L2_254, _UPVALUE2_, A0_252)
  L2_254 = _UPVALUE0_
  L2_254 = L2_254.FALSE
  if L1_253 == L2_254 then
    L1_253 = _UPVALUE0_
    L1_253 = L1_253.INVALID_ARGUMENT
    return L1_253
  end
  L1_253 = db
  L1_253 = L1_253.getNextRowId
  L2_254 = A0_252
  L1_253 = L1_253(L2_254, _UPVALUE1_)
  L2_254 = _UPVALUE0_
  L2_254 = L2_254.NIL
  if L1_253 == L2_254 then
    L2_254 = _UPVALUE0_
    L2_254 = L2_254.NOT_EXIST
    return L2_254
  end
  L2_254 = db
  L2_254 = L2_254.getAttribute
  L2_254 = L2_254(_UPVALUE1_, _UPVALUE2_, L1_253, _UPVALUE3_.encryptionKeyOut)
  if L2_254 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_253
  end
  return _UPVALUE0_.SUCCESS, L1_253, L2_254
end
function encryptionKeyOutSet(A0_255, A1_256)
  local L2_257
  L2_257 = _UPVALUE0_
  L2_257 = L2_257.NIL
  if A0_255 ~= L2_257 then
    L2_257 = tonumber
    L2_257 = L2_257(A0_255)
  elseif L2_257 == _UPVALUE0_.NIL then
    L2_257 = _UPVALUE0_
    L2_257 = L2_257.INVALID_ARGUMENT
    return L2_257
  end
  L2_257 = db
  L2_257 = L2_257.existsRow
  L2_257 = L2_257(_UPVALUE1_, _UPVALUE2_, A0_255)
  if L2_257 == _UPVALUE0_.FALSE then
    L2_257 = _UPVALUE0_
    L2_257 = L2_257.INVALID_ARGUMENT
    return L2_257
  end
  L2_257 = _UPVALUE0_
  L2_257 = L2_257.NIL
  if A1_256 == L2_257 then
    L2_257 = _UPVALUE0_
    L2_257 = L2_257.INVALID_ARGUMENT
    return L2_257
  end
  L2_257 = db
  L2_257 = L2_257.getAttribute
  L2_257 = L2_257(_UPVALUE1_, _UPVALUE2_, A0_255, _UPVALUE3_.policyType)
  if tonumber(L2_257) ~= _UPVALUE4_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_255
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_255, _UPVALUE3_.encryptionKeyOut, A1_256) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_255
  end
  return _UPVALUE0_.SUCCESS, A0_255
end
function authKeyInGet()
  local L0_258, L1_259
  L0_258 = db
  L0_258 = L0_258.getNextRowId
  L1_259 = "0"
  L0_258 = L0_258(L1_259, _UPVALUE0_)
  L1_259 = db
  L1_259 = L1_259.getAttribute
  L1_259 = L1_259(_UPVALUE0_, _UPVALUE1_, L0_258, _UPVALUE2_.authKeyIn)
  if L1_259 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_258, L1_259
end
function authKeyInGetNext(A0_260)
  local L1_261, L2_262
  L1_261 = _UPVALUE0_
  L1_261 = L1_261.NIL
  if A0_260 ~= L1_261 then
    L1_261 = tonumber
    L2_262 = A0_260
    L1_261 = L1_261(L2_262)
    L2_262 = _UPVALUE0_
    L2_262 = L2_262.NIL
  elseif L1_261 == L2_262 then
    L1_261 = _UPVALUE0_
    L1_261 = L1_261.INVALID_ARGUMENT
    return L1_261
  end
  L1_261 = db
  L1_261 = L1_261.existsRow
  L2_262 = _UPVALUE1_
  L1_261 = L1_261(L2_262, _UPVALUE2_, A0_260)
  L2_262 = _UPVALUE0_
  L2_262 = L2_262.FALSE
  if L1_261 == L2_262 then
    L1_261 = _UPVALUE0_
    L1_261 = L1_261.INVALID_ARGUMENT
    return L1_261
  end
  L1_261 = db
  L1_261 = L1_261.getNextRowId
  L2_262 = A0_260
  L1_261 = L1_261(L2_262, _UPVALUE1_)
  L2_262 = _UPVALUE0_
  L2_262 = L2_262.NIL
  if L1_261 == L2_262 then
    L2_262 = _UPVALUE0_
    L2_262 = L2_262.NOT_EXIST
    return L2_262
  end
  L2_262 = db
  L2_262 = L2_262.getAttribute
  L2_262 = L2_262(_UPVALUE1_, _UPVALUE2_, L1_261, _UPVALUE3_.authKeyIn)
  if L2_262 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_261
  end
  return _UPVALUE0_.SUCCESS, L1_261, L2_262
end
function authKeyInSet(A0_263, A1_264)
  local L2_265
  L2_265 = _UPVALUE0_
  L2_265 = L2_265.NIL
  if A0_263 ~= L2_265 then
    L2_265 = tonumber
    L2_265 = L2_265(A0_263)
  elseif L2_265 == _UPVALUE0_.NIL then
    L2_265 = _UPVALUE0_
    L2_265 = L2_265.INVALID_ARGUMENT
    return L2_265
  end
  L2_265 = db
  L2_265 = L2_265.existsRow
  L2_265 = L2_265(_UPVALUE1_, _UPVALUE2_, A0_263)
  if L2_265 == _UPVALUE0_.FALSE then
    L2_265 = _UPVALUE0_
    L2_265 = L2_265.INVALID_ARGUMENT
    return L2_265
  end
  L2_265 = _UPVALUE0_
  L2_265 = L2_265.NIL
  if A1_264 == L2_265 then
    L2_265 = _UPVALUE0_
    L2_265 = L2_265.INVALID_ARGUMENT
    return L2_265
  end
  L2_265 = db
  L2_265 = L2_265.getAttribute
  L2_265 = L2_265(_UPVALUE1_, _UPVALUE2_, A0_263, _UPVALUE3_.policyType)
  if tonumber(L2_265) ~= _UPVALUE4_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_263
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_263, _UPVALUE3_.authKeyIn, A1_264) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_263
  end
  return _UPVALUE0_.SUCCESS, A0_263
end
function authKeyOutGet()
  local L0_266, L1_267
  L0_266 = db
  L0_266 = L0_266.getNextRowId
  L1_267 = "0"
  L0_266 = L0_266(L1_267, _UPVALUE0_)
  L1_267 = db
  L1_267 = L1_267.getAttribute
  L1_267 = L1_267(_UPVALUE0_, _UPVALUE1_, L0_266, _UPVALUE2_.authKeyOut)
  if L1_267 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_266, L1_267
end
function authKeyOutGetNext(A0_268)
  local L1_269, L2_270
  L1_269 = _UPVALUE0_
  L1_269 = L1_269.NIL
  if A0_268 ~= L1_269 then
    L1_269 = tonumber
    L2_270 = A0_268
    L1_269 = L1_269(L2_270)
    L2_270 = _UPVALUE0_
    L2_270 = L2_270.NIL
  elseif L1_269 == L2_270 then
    L1_269 = _UPVALUE0_
    L1_269 = L1_269.INVALID_ARGUMENT
    return L1_269
  end
  L1_269 = db
  L1_269 = L1_269.existsRow
  L2_270 = _UPVALUE1_
  L1_269 = L1_269(L2_270, _UPVALUE2_, A0_268)
  L2_270 = _UPVALUE0_
  L2_270 = L2_270.FALSE
  if L1_269 == L2_270 then
    L1_269 = _UPVALUE0_
    L1_269 = L1_269.INVALID_ARGUMENT
    return L1_269
  end
  L1_269 = db
  L1_269 = L1_269.getNextRowId
  L2_270 = A0_268
  L1_269 = L1_269(L2_270, _UPVALUE1_)
  L2_270 = _UPVALUE0_
  L2_270 = L2_270.NIL
  if L1_269 == L2_270 then
    L2_270 = _UPVALUE0_
    L2_270 = L2_270.NOT_EXIST
    return L2_270
  end
  L2_270 = db
  L2_270 = L2_270.getAttribute
  L2_270 = L2_270(_UPVALUE1_, _UPVALUE2_, L1_269, _UPVALUE3_.authKeyOut)
  if L2_270 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_269
  end
  return _UPVALUE0_.SUCCESS, L1_269, L2_270
end
function authKeyOutSet(A0_271, A1_272)
  local L2_273
  L2_273 = _UPVALUE0_
  L2_273 = L2_273.NIL
  if A0_271 ~= L2_273 then
    L2_273 = tonumber
    L2_273 = L2_273(A0_271)
  elseif L2_273 == _UPVALUE0_.NIL then
    L2_273 = _UPVALUE0_
    L2_273 = L2_273.INVALID_ARGUMENT
    return L2_273
  end
  L2_273 = db
  L2_273 = L2_273.existsRow
  L2_273 = L2_273(_UPVALUE1_, _UPVALUE2_, A0_271)
  if L2_273 == _UPVALUE0_.FALSE then
    L2_273 = _UPVALUE0_
    L2_273 = L2_273.INVALID_ARGUMENT
    return L2_273
  end
  L2_273 = _UPVALUE0_
  L2_273 = L2_273.NIL
  if A1_272 == L2_273 then
    L2_273 = _UPVALUE0_
    L2_273 = L2_273.INVALID_ARGUMENT
    return L2_273
  end
  L2_273 = db
  L2_273 = L2_273.getAttribute
  L2_273 = L2_273(_UPVALUE1_, _UPVALUE2_, A0_271, _UPVALUE3_.policyType)
  if tonumber(L2_273) ~= _UPVALUE4_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_271
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_271, _UPVALUE3_.authKeyOut, A1_272) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_271
  end
  return _UPVALUE0_.SUCCESS, A0_271
end
function autoPolicyTypeGet()
  local L0_274, L1_275
  L0_274 = db
  L0_274 = L0_274.getNextRowId
  L1_275 = "0"
  L0_274 = L0_274(L1_275, _UPVALUE0_)
  L1_275 = db
  L1_275 = L1_275.getAttribute
  L1_275 = L1_275(_UPVALUE0_, _UPVALUE1_, L0_274, _UPVALUE2_.autoPolicyType)
  if L1_275 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_274, L1_275
end
function autoPolicyTypeGetNext(A0_276)
  local L1_277, L2_278
  L1_277 = _UPVALUE0_
  L1_277 = L1_277.NIL
  if A0_276 ~= L1_277 then
    L1_277 = tonumber
    L2_278 = A0_276
    L1_277 = L1_277(L2_278)
    L2_278 = _UPVALUE0_
    L2_278 = L2_278.NIL
  elseif L1_277 == L2_278 then
    L1_277 = _UPVALUE0_
    L1_277 = L1_277.INVALID_ARGUMENT
    return L1_277
  end
  L1_277 = db
  L1_277 = L1_277.existsRow
  L2_278 = _UPVALUE1_
  L1_277 = L1_277(L2_278, _UPVALUE2_, A0_276)
  L2_278 = _UPVALUE0_
  L2_278 = L2_278.FALSE
  if L1_277 == L2_278 then
    L1_277 = _UPVALUE0_
    L1_277 = L1_277.INVALID_ARGUMENT
    return L1_277
  end
  L1_277 = db
  L1_277 = L1_277.getNextRowId
  L2_278 = A0_276
  L1_277 = L1_277(L2_278, _UPVALUE1_)
  L2_278 = _UPVALUE0_
  L2_278 = L2_278.NIL
  if L1_277 == L2_278 then
    L2_278 = _UPVALUE0_
    L2_278 = L2_278.NOT_EXIST
    return L2_278
  end
  L2_278 = db
  L2_278 = L2_278.getAttribute
  L2_278 = L2_278(_UPVALUE1_, _UPVALUE2_, L1_277, _UPVALUE3_.autoPolicyType)
  if L2_278 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_277
  end
  return _UPVALUE0_.SUCCESS, L1_277, L2_278
end
function autoPolicyTypeSet(A0_279, A1_280)
  if A0_279 == _UPVALUE0_.NIL or tonumber(A0_279) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_279) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_280 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_280) ~= _UPVALUE3_ and tonumber(A1_280) ~= _UPVALUE4_ and tonumber(A1_280) ~= _UPVALUE5_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_279, _UPVALUE6_.autoPolicyType, A1_280) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_279
  end
  return _UPVALUE0_.SUCCESS, A0_279
end
function saLifeTimeGet()
  local L0_281, L1_282
  L0_281 = db
  L0_281 = L0_281.getNextRowId
  L1_282 = "0"
  L0_281 = L0_281(L1_282, _UPVALUE0_)
  L1_282 = db
  L1_282 = L1_282.getAttribute
  L1_282 = L1_282(_UPVALUE0_, _UPVALUE1_, L0_281, _UPVALUE2_.saLifeTime)
  if L1_282 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_281, L1_282
end
function saLifeTimeGetNext(A0_283)
  local L1_284, L2_285
  L1_284 = _UPVALUE0_
  L1_284 = L1_284.NIL
  if A0_283 ~= L1_284 then
    L1_284 = tonumber
    L2_285 = A0_283
    L1_284 = L1_284(L2_285)
    L2_285 = _UPVALUE0_
    L2_285 = L2_285.NIL
  elseif L1_284 == L2_285 then
    L1_284 = _UPVALUE0_
    L1_284 = L1_284.INVALID_ARGUMENT
    return L1_284
  end
  L1_284 = db
  L1_284 = L1_284.existsRow
  L2_285 = _UPVALUE1_
  L1_284 = L1_284(L2_285, _UPVALUE2_, A0_283)
  L2_285 = _UPVALUE0_
  L2_285 = L2_285.FALSE
  if L1_284 == L2_285 then
    L1_284 = _UPVALUE0_
    L1_284 = L1_284.INVALID_ARGUMENT
    return L1_284
  end
  L1_284 = db
  L1_284 = L1_284.getNextRowId
  L2_285 = A0_283
  L1_284 = L1_284(L2_285, _UPVALUE1_)
  L2_285 = _UPVALUE0_
  L2_285 = L2_285.NIL
  if L1_284 == L2_285 then
    L2_285 = _UPVALUE0_
    L2_285 = L2_285.NOT_EXIST
    return L2_285
  end
  L2_285 = db
  L2_285 = L2_285.getAttribute
  L2_285 = L2_285(_UPVALUE1_, _UPVALUE2_, L1_284, _UPVALUE3_.saLifeTime)
  if L2_285 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_284
  end
  return _UPVALUE0_.SUCCESS, L1_284, L2_285
end
function saLifeTimeSet(A0_286, A1_287)
  local L2_288
  L2_288 = _UPVALUE0_
  L2_288 = L2_288.NIL
  if A0_286 ~= L2_288 then
    L2_288 = tonumber
    L2_288 = L2_288(A0_286)
  elseif L2_288 == _UPVALUE0_.NIL then
    L2_288 = _UPVALUE0_
    L2_288 = L2_288.INVALID_ARGUMENT
    return L2_288
  end
  L2_288 = db
  L2_288 = L2_288.existsRow
  L2_288 = L2_288(_UPVALUE1_, _UPVALUE2_, A0_286)
  if L2_288 == _UPVALUE0_.FALSE then
    L2_288 = _UPVALUE0_
    L2_288 = L2_288.INVALID_ARGUMENT
    return L2_288
  end
  L2_288 = _UPVALUE0_
  L2_288 = L2_288.NIL
  if A1_287 == L2_288 then
    L2_288 = _UPVALUE0_
    L2_288 = L2_288.INVALID_ARGUMENT
    return L2_288
  end
  L2_288 = db
  L2_288 = L2_288.getAttribute
  L2_288 = L2_288(_UPVALUE1_, _UPVALUE2_, A0_286, _UPVALUE3_.policyType)
  if tonumber(L2_288) ~= _UPVALUE4_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_286
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_286, _UPVALUE3_.saLifeTime, A1_287) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_286
  end
  return _UPVALUE0_.SUCCESS, A0_286
end
function saLifeTimeTypeGet()
  local L0_289, L1_290
  L0_289 = db
  L0_289 = L0_289.getNextRowId
  L1_290 = "0"
  L0_289 = L0_289(L1_290, _UPVALUE0_)
  L1_290 = db
  L1_290 = L1_290.getAttribute
  L1_290 = L1_290(_UPVALUE0_, _UPVALUE1_, L0_289, _UPVALUE2_.saLifeTimeType)
  if L1_290 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_289, L1_290
end
function saLifeTimeTypeGetNext(A0_291)
  local L1_292, L2_293
  L1_292 = _UPVALUE0_
  L1_292 = L1_292.NIL
  if A0_291 ~= L1_292 then
    L1_292 = tonumber
    L2_293 = A0_291
    L1_292 = L1_292(L2_293)
    L2_293 = _UPVALUE0_
    L2_293 = L2_293.NIL
  elseif L1_292 == L2_293 then
    L1_292 = _UPVALUE0_
    L1_292 = L1_292.INVALID_ARGUMENT
    return L1_292
  end
  L1_292 = db
  L1_292 = L1_292.existsRow
  L2_293 = _UPVALUE1_
  L1_292 = L1_292(L2_293, _UPVALUE2_, A0_291)
  L2_293 = _UPVALUE0_
  L2_293 = L2_293.FALSE
  if L1_292 == L2_293 then
    L1_292 = _UPVALUE0_
    L1_292 = L1_292.INVALID_ARGUMENT
    return L1_292
  end
  L1_292 = db
  L1_292 = L1_292.getNextRowId
  L2_293 = A0_291
  L1_292 = L1_292(L2_293, _UPVALUE1_)
  L2_293 = _UPVALUE0_
  L2_293 = L2_293.NIL
  if L1_292 == L2_293 then
    L2_293 = _UPVALUE0_
    L2_293 = L2_293.NOT_EXIST
    return L2_293
  end
  L2_293 = db
  L2_293 = L2_293.getAttribute
  L2_293 = L2_293(_UPVALUE1_, _UPVALUE2_, L1_292, _UPVALUE3_.saLifeTimeType)
  if L2_293 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_292
  end
  return _UPVALUE0_.SUCCESS, L1_292, L2_293
end
function saLifeTimeTypeSet(A0_294, A1_295)
  local L2_296
  L2_296 = _UPVALUE0_
  L2_296 = L2_296.NIL
  if A0_294 ~= L2_296 then
    L2_296 = tonumber
    L2_296 = L2_296(A0_294)
  elseif L2_296 == _UPVALUE0_.NIL then
    L2_296 = _UPVALUE0_
    L2_296 = L2_296.INVALID_ARGUMENT
    return L2_296
  end
  L2_296 = db
  L2_296 = L2_296.existsRow
  L2_296 = L2_296(_UPVALUE1_, _UPVALUE2_, A0_294)
  if L2_296 == _UPVALUE0_.FALSE then
    L2_296 = _UPVALUE0_
    L2_296 = L2_296.INVALID_ARGUMENT
    return L2_296
  end
  L2_296 = _UPVALUE0_
  L2_296 = L2_296.NIL
  if A1_295 == L2_296 then
    L2_296 = _UPVALUE0_
    L2_296 = L2_296.INVALID_ARGUMENT
    return L2_296
  end
  L2_296 = db
  L2_296 = L2_296.getAttribute
  L2_296 = L2_296(_UPVALUE1_, _UPVALUE2_, A0_294, _UPVALUE3_.policyType)
  if tonumber(L2_296) ~= _UPVALUE4_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_294
  end
  if tonumber(A1_295) ~= 0 and tonumber(A1_295) ~= 1 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_294, _UPVALUE3_.saLifeTimeType, A1_295) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_294
  end
  return _UPVALUE0_.SUCCESS, A0_294
end
function pfsKeyGroupGet()
  local L0_297, L1_298
  L0_297 = db
  L0_297 = L0_297.getNextRowId
  L1_298 = "0"
  L0_297 = L0_297(L1_298, _UPVALUE0_)
  L1_298 = db
  L1_298 = L1_298.getAttribute
  L1_298 = L1_298(_UPVALUE0_, _UPVALUE1_, L0_297, _UPVALUE2_.pfsKeyGroup)
  if L1_298 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_297, L1_298
end
function pfsKeyGroupGetNext(A0_299)
  local L1_300, L2_301
  L1_300 = _UPVALUE0_
  L1_300 = L1_300.NIL
  if A0_299 ~= L1_300 then
    L1_300 = tonumber
    L2_301 = A0_299
    L1_300 = L1_300(L2_301)
    L2_301 = _UPVALUE0_
    L2_301 = L2_301.NIL
  elseif L1_300 == L2_301 then
    L1_300 = _UPVALUE0_
    L1_300 = L1_300.INVALID_ARGUMENT
    return L1_300
  end
  L1_300 = db
  L1_300 = L1_300.existsRow
  L2_301 = _UPVALUE1_
  L1_300 = L1_300(L2_301, _UPVALUE2_, A0_299)
  L2_301 = _UPVALUE0_
  L2_301 = L2_301.FALSE
  if L1_300 == L2_301 then
    L1_300 = _UPVALUE0_
    L1_300 = L1_300.INVALID_ARGUMENT
    return L1_300
  end
  L1_300 = db
  L1_300 = L1_300.getNextRowId
  L2_301 = A0_299
  L1_300 = L1_300(L2_301, _UPVALUE1_)
  L2_301 = _UPVALUE0_
  L2_301 = L2_301.NIL
  if L1_300 == L2_301 then
    L2_301 = _UPVALUE0_
    L2_301 = L2_301.NOT_EXIST
    return L2_301
  end
  L2_301 = db
  L2_301 = L2_301.getAttribute
  L2_301 = L2_301(_UPVALUE1_, _UPVALUE2_, L1_300, _UPVALUE3_.pfsKeyGroup)
  if L2_301 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_300
  end
  return _UPVALUE0_.SUCCESS, L1_300, L2_301
end
function pfsKeyGroupSet(A0_302, A1_303)
  local L2_304
  L2_304 = _UPVALUE0_
  L2_304 = L2_304.NIL
  if A0_302 ~= L2_304 then
    L2_304 = tonumber
    L2_304 = L2_304(A0_302)
  elseif L2_304 == _UPVALUE0_.NIL then
    L2_304 = _UPVALUE0_
    L2_304 = L2_304.INVALID_ARGUMENT
    return L2_304
  end
  L2_304 = db
  L2_304 = L2_304.existsRow
  L2_304 = L2_304(_UPVALUE1_, _UPVALUE2_, A0_302)
  if L2_304 == _UPVALUE0_.FALSE then
    L2_304 = _UPVALUE0_
    L2_304 = L2_304.INVALID_ARGUMENT
    return L2_304
  end
  L2_304 = _UPVALUE0_
  L2_304 = L2_304.NIL
  if A1_303 == L2_304 then
    L2_304 = _UPVALUE0_
    L2_304 = L2_304.INVALID_ARGUMENT
    return L2_304
  end
  L2_304 = db
  L2_304 = L2_304.getAttribute
  L2_304 = L2_304(_UPVALUE1_, _UPVALUE2_, A0_302, _UPVALUE3_.policyType)
  if tonumber(L2_304) ~= _UPVALUE4_ then
    return _UPVALUE0_.DEPENDENCY_NOT_MET, A0_302
  end
  if tonumber(A1_303) ~= _UPVALUE5_ and tonumber(A1_303) ~= _UPVALUE6_ and tonumber(A1_303) ~= _UPVALUE7_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_302, _UPVALUE3_.pfsKeyGroup, A1_303) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_302
  end
  return _UPVALUE0_.SUCCESS, A0_302
end
function ikePolicyNameGet()
  local L0_305, L1_306
  L0_305 = db
  L0_305 = L0_305.getNextRowId
  L1_306 = "0"
  L0_305 = L0_305(L1_306, _UPVALUE0_)
  L1_306 = db
  L1_306 = L1_306.getAttribute
  L1_306 = L1_306(_UPVALUE0_, _UPVALUE1_, L0_305, _UPVALUE2_.ikePolicyName)
  if L1_306 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_305, L1_306
end
function ikePolicyNameGetNext(A0_307)
  local L1_308, L2_309
  L1_308 = _UPVALUE0_
  L1_308 = L1_308.NIL
  if A0_307 ~= L1_308 then
    L1_308 = tonumber
    L2_309 = A0_307
    L1_308 = L1_308(L2_309)
    L2_309 = _UPVALUE0_
    L2_309 = L2_309.NIL
  elseif L1_308 == L2_309 then
    L1_308 = _UPVALUE0_
    L1_308 = L1_308.INVALID_ARGUMENT
    return L1_308
  end
  L1_308 = db
  L1_308 = L1_308.existsRow
  L2_309 = _UPVALUE1_
  L1_308 = L1_308(L2_309, _UPVALUE2_, A0_307)
  L2_309 = _UPVALUE0_
  L2_309 = L2_309.FALSE
  if L1_308 == L2_309 then
    L1_308 = _UPVALUE0_
    L1_308 = L1_308.INVALID_ARGUMENT
    return L1_308
  end
  L1_308 = db
  L1_308 = L1_308.getNextRowId
  L2_309 = A0_307
  L1_308 = L1_308(L2_309, _UPVALUE1_)
  L2_309 = _UPVALUE0_
  L2_309 = L2_309.NIL
  if L1_308 == L2_309 then
    L2_309 = _UPVALUE0_
    L2_309 = L2_309.NOT_EXIST
    return L2_309
  end
  L2_309 = db
  L2_309 = L2_309.getAttribute
  L2_309 = L2_309(_UPVALUE1_, _UPVALUE2_, L1_308, _UPVALUE3_.ikePolicyName)
  if L2_309 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_308
  end
  return _UPVALUE0_.SUCCESS, L1_308, L2_309
end
function ikePolicyNameSet(A0_310, A1_311)
  if A0_310 == _UPVALUE0_.NIL or tonumber(A0_310) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_310) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_311 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_310, _UPVALUE3_.ikePolicyName, A1_311) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_310
  end
  return _UPVALUE0_.SUCCESS, A0_310
end
function isrvgStatusEnabled()
  local L0_312, L1_313
  L0_312 = db
  L0_312 = L0_312.getNextRowId
  L1_313 = "0"
  L0_312 = L0_312(L1_313, _UPVALUE0_)
  L1_313 = db
  L1_313 = L1_313.getAttribute
  L1_313 = L1_313(_UPVALUE0_, _UPVALUE1_, L0_312, _UPVALUE2_.rvgStatus)
  if L1_313 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_312, L1_313
end
function isrvgStatusEnabledNext(A0_314)
  local L1_315, L2_316
  L1_315 = _UPVALUE0_
  L1_315 = L1_315.NIL
  if A0_314 ~= L1_315 then
    L1_315 = tonumber
    L2_316 = A0_314
    L1_315 = L1_315(L2_316)
    L2_316 = _UPVALUE0_
    L2_316 = L2_316.NIL
  elseif L1_315 == L2_316 then
    L1_315 = _UPVALUE0_
    L1_315 = L1_315.INVALID_ARGUMENT
    return L1_315
  end
  L1_315 = db
  L1_315 = L1_315.existsRow
  L2_316 = _UPVALUE1_
  L1_315 = L1_315(L2_316, _UPVALUE2_, A0_314)
  L2_316 = _UPVALUE0_
  L2_316 = L2_316.FALSE
  if L1_315 == L2_316 then
    L1_315 = _UPVALUE0_
    L1_315 = L1_315.INVALID_ARGUMENT
    return L1_315
  end
  L1_315 = db
  L1_315 = L1_315.getNextRowId
  L2_316 = A0_314
  L1_315 = L1_315(L2_316, _UPVALUE1_)
  L2_316 = _UPVALUE0_
  L2_316 = L2_316.NIL
  if L1_315 == L2_316 then
    L2_316 = _UPVALUE0_
    L2_316 = L2_316.NOT_EXIST
    return L2_316
  end
  L2_316 = db
  L2_316 = L2_316.getAttribute
  L2_316 = L2_316(_UPVALUE1_, _UPVALUE2_, L1_315, _UPVALUE3_.rvgStatus)
  if L2_316 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_315
  end
  return _UPVALUE0_.SUCCESS, L1_315, L2_316
end
function rvgStatusEnable(A0_317)
  if A0_317 == _UPVALUE0_.NIL or tonumber(A0_317) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_317) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_317, _UPVALUE3_.rvgStatus, _UPVALUE4_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_317
  end
  return _UPVALUE0_.SUCCESS, A0_317
end
function rvgStatusDisable(A0_318)
  if A0_318 == _UPVALUE0_.NIL or tonumber(A0_318) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_318) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_318, _UPVALUE3_.rvgStatus, _UPVALUE4_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_318
  end
  return _UPVALUE0_.SUCCESS, A0_318
end
function isipsecStatusEnabled()
  local L0_319, L1_320
  L0_319 = db
  L0_319 = L0_319.getNextRowId
  L1_320 = "0"
  L0_319 = L0_319(L1_320, _UPVALUE0_)
  L1_320 = db
  L1_320 = L1_320.getAttribute
  L1_320 = L1_320(_UPVALUE0_, _UPVALUE1_, L0_319, _UPVALUE2_.ipsecStatus)
  if L1_320 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_319, L1_320
end
function isipsecStatusEnabledNext(A0_321)
  local L1_322, L2_323
  L1_322 = _UPVALUE0_
  L1_322 = L1_322.NIL
  if A0_321 ~= L1_322 then
    L1_322 = tonumber
    L2_323 = A0_321
    L1_322 = L1_322(L2_323)
    L2_323 = _UPVALUE0_
    L2_323 = L2_323.NIL
  elseif L1_322 == L2_323 then
    L1_322 = _UPVALUE0_
    L1_322 = L1_322.INVALID_ARGUMENT
    return L1_322
  end
  L1_322 = db
  L1_322 = L1_322.existsRow
  L2_323 = _UPVALUE1_
  L1_322 = L1_322(L2_323, _UPVALUE2_, A0_321)
  L2_323 = _UPVALUE0_
  L2_323 = L2_323.FALSE
  if L1_322 == L2_323 then
    L1_322 = _UPVALUE0_
    L1_322 = L1_322.INVALID_ARGUMENT
    return L1_322
  end
  L1_322 = db
  L1_322 = L1_322.getNextRowId
  L2_323 = A0_321
  L1_322 = L1_322(L2_323, _UPVALUE1_)
  L2_323 = _UPVALUE0_
  L2_323 = L2_323.NIL
  if L1_322 == L2_323 then
    L2_323 = _UPVALUE0_
    L2_323 = L2_323.NOT_EXIST
    return L2_323
  end
  L2_323 = db
  L2_323 = L2_323.getAttribute
  L2_323 = L2_323(_UPVALUE1_, _UPVALUE2_, L1_322, _UPVALUE3_.ipsecStatus)
  if L2_323 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_322
  end
  return _UPVALUE0_.SUCCESS, L1_322, L2_323
end
function ipsecStatusEnable(A0_324)
  if A0_324 == _UPVALUE0_.NIL or tonumber(A0_324) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_324) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_324, _UPVALUE3_.ipsecStatus, _UPVALUE4_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_324
  end
  return _UPVALUE0_.SUCCESS, A0_324
end
function ipsecStatusDisable(A0_325)
  if A0_325 == _UPVALUE0_.NIL or tonumber(A0_325) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_325) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_325, _UPVALUE3_.ipsecStatus, _UPVALUE4_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_325
  end
  return _UPVALUE0_.SUCCESS, A0_325
end
function backupPolicyNameGet()
  local L0_326, L1_327
  L0_326 = db
  L0_326 = L0_326.getNextRowId
  L1_327 = "0"
  L0_326 = L0_326(L1_327, _UPVALUE0_)
  L1_327 = db
  L1_327 = L1_327.getAttribute
  L1_327 = L1_327(_UPVALUE0_, _UPVALUE1_, L0_326, _UPVALUE2_.backupPolicyName)
  if L1_327 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_326, L1_327
end
function backupPolicyNameGetNext(A0_328)
  local L1_329, L2_330
  L1_329 = _UPVALUE0_
  L1_329 = L1_329.NIL
  if A0_328 ~= L1_329 then
    L1_329 = tonumber
    L2_330 = A0_328
    L1_329 = L1_329(L2_330)
    L2_330 = _UPVALUE0_
    L2_330 = L2_330.NIL
  elseif L1_329 == L2_330 then
    L1_329 = _UPVALUE0_
    L1_329 = L1_329.INVALID_ARGUMENT
    return L1_329
  end
  L1_329 = db
  L1_329 = L1_329.existsRow
  L2_330 = _UPVALUE1_
  L1_329 = L1_329(L2_330, _UPVALUE2_, A0_328)
  L2_330 = _UPVALUE0_
  L2_330 = L2_330.FALSE
  if L1_329 == L2_330 then
    L1_329 = _UPVALUE0_
    L1_329 = L1_329.INVALID_ARGUMENT
    return L1_329
  end
  L1_329 = db
  L1_329 = L1_329.getNextRowId
  L2_330 = A0_328
  L1_329 = L1_329(L2_330, _UPVALUE1_)
  L2_330 = _UPVALUE0_
  L2_330 = L2_330.NIL
  if L1_329 == L2_330 then
    L2_330 = _UPVALUE0_
    L2_330 = L2_330.NOT_EXIST
    return L2_330
  end
  L2_330 = db
  L2_330 = L2_330.getAttribute
  L2_330 = L2_330(_UPVALUE1_, _UPVALUE2_, L1_329, _UPVALUE3_.backupPolicyName)
  if L2_330 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_329
  end
  return _UPVALUE0_.SUCCESS, L1_329, L2_330
end
function backupPolicyNameSet(A0_331, A1_332)
  if A0_331 == _UPVALUE0_.NIL or tonumber(A0_331) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_331) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_332 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_331, _UPVALUE3_.backupPolicyName, A1_332) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_331
  end
  return _UPVALUE0_.SUCCESS, A0_331
end
function failBackTimeGet()
  local L0_333, L1_334
  L0_333 = db
  L0_333 = L0_333.getNextRowId
  L1_334 = "0"
  L0_333 = L0_333(L1_334, _UPVALUE0_)
  L1_334 = db
  L1_334 = L1_334.getAttribute
  L1_334 = L1_334(_UPVALUE0_, _UPVALUE1_, L0_333, _UPVALUE2_.failBackTime)
  if L1_334 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_333, L1_334
end
function failBackTimeGetNext(A0_335)
  local L1_336, L2_337
  L1_336 = _UPVALUE0_
  L1_336 = L1_336.NIL
  if A0_335 ~= L1_336 then
    L1_336 = tonumber
    L2_337 = A0_335
    L1_336 = L1_336(L2_337)
    L2_337 = _UPVALUE0_
    L2_337 = L2_337.NIL
  elseif L1_336 == L2_337 then
    L1_336 = _UPVALUE0_
    L1_336 = L1_336.INVALID_ARGUMENT
    return L1_336
  end
  L1_336 = db
  L1_336 = L1_336.existsRow
  L2_337 = _UPVALUE1_
  L1_336 = L1_336(L2_337, _UPVALUE2_, A0_335)
  L2_337 = _UPVALUE0_
  L2_337 = L2_337.FALSE
  if L1_336 == L2_337 then
    L1_336 = _UPVALUE0_
    L1_336 = L1_336.INVALID_ARGUMENT
    return L1_336
  end
  L1_336 = db
  L1_336 = L1_336.getNextRowId
  L2_337 = A0_335
  L1_336 = L1_336(L2_337, _UPVALUE1_)
  L2_337 = _UPVALUE0_
  L2_337 = L2_337.NIL
  if L1_336 == L2_337 then
    L2_337 = _UPVALUE0_
    L2_337 = L2_337.NOT_EXIST
    return L2_337
  end
  L2_337 = db
  L2_337 = L2_337.getAttribute
  L2_337 = L2_337(_UPVALUE1_, _UPVALUE2_, L1_336, _UPVALUE3_.failBackTime)
  if L2_337 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_336
  end
  return _UPVALUE0_.SUCCESS, L1_336, L2_337
end
function failBackTimeSet(A0_338, A1_339)
  if A0_338 == _UPVALUE0_.NIL or tonumber(A0_338) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_338) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_339 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_338, _UPVALUE3_.failBackTime, A1_339) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_338
  end
  return _UPVALUE0_.SUCCESS, A0_338
end
function ipsecPolicyTypeGet()
  local L0_340, L1_341
  L0_340 = db
  L0_340 = L0_340.getNextRowId
  L1_341 = "0"
  L0_340 = L0_340(L1_341, _UPVALUE0_)
  L1_341 = db
  L1_341 = L1_341.getAttribute
  L1_341 = L1_341(_UPVALUE0_, _UPVALUE1_, L0_340, _UPVALUE2_.ipsecPolicyType)
  if L1_341 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_340, L1_341
end
function ipsecPolicyTypeGetNext(A0_342)
  local L1_343, L2_344
  L1_343 = _UPVALUE0_
  L1_343 = L1_343.NIL
  if A0_342 ~= L1_343 then
    L1_343 = tonumber
    L2_344 = A0_342
    L1_343 = L1_343(L2_344)
    L2_344 = _UPVALUE0_
    L2_344 = L2_344.NIL
  elseif L1_343 == L2_344 then
    L1_343 = _UPVALUE0_
    L1_343 = L1_343.INVALID_ARGUMENT
    return L1_343
  end
  L1_343 = db
  L1_343 = L1_343.existsRow
  L2_344 = _UPVALUE1_
  L1_343 = L1_343(L2_344, _UPVALUE2_, A0_342)
  L2_344 = _UPVALUE0_
  L2_344 = L2_344.FALSE
  if L1_343 == L2_344 then
    L1_343 = _UPVALUE0_
    L1_343 = L1_343.INVALID_ARGUMENT
    return L1_343
  end
  L1_343 = db
  L1_343 = L1_343.getNextRowId
  L2_344 = A0_342
  L1_343 = L1_343(L2_344, _UPVALUE1_)
  L2_344 = _UPVALUE0_
  L2_344 = L2_344.NIL
  if L1_343 == L2_344 then
    L2_344 = _UPVALUE0_
    L2_344 = L2_344.NOT_EXIST
    return L2_344
  end
  L2_344 = db
  L2_344 = L2_344.getAttribute
  L2_344 = L2_344(_UPVALUE1_, _UPVALUE2_, L1_343, _UPVALUE3_.ipsecPolicyType)
  if L2_344 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_343
  end
  return _UPVALUE0_.SUCCESS, L1_343, L2_344
end
function ipsecPolicyTypeSet(A0_345, A1_346)
  if A0_345 == _UPVALUE0_.NIL or tonumber(A0_345) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_345) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_346 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_346) ~= _UPVALUE3_ and tonumber(A1_346) ~= _UPVALUE4_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_345, _UPVALUE5_.ipsecPolicyType, A1_346) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_345
  end
  return _UPVALUE0_.SUCCESS, A0_345
end
function ismodeConfigStatusEnabled()
  local L0_347, L1_348
  L0_347 = db
  L0_347 = L0_347.getNextRowId
  L1_348 = "0"
  L0_347 = L0_347(L1_348, _UPVALUE0_)
  L1_348 = db
  L1_348 = L1_348.getAttribute
  L1_348 = L1_348(_UPVALUE0_, _UPVALUE1_, L0_347, _UPVALUE2_.modeConfigStatus)
  if L1_348 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_347, L1_348
end
function ismodeConfigStatusEnabledNext(A0_349)
  local L1_350, L2_351
  L1_350 = _UPVALUE0_
  L1_350 = L1_350.NIL
  if A0_349 ~= L1_350 then
    L1_350 = tonumber
    L2_351 = A0_349
    L1_350 = L1_350(L2_351)
    L2_351 = _UPVALUE0_
    L2_351 = L2_351.NIL
  elseif L1_350 == L2_351 then
    L1_350 = _UPVALUE0_
    L1_350 = L1_350.INVALID_ARGUMENT
    return L1_350
  end
  L1_350 = db
  L1_350 = L1_350.existsRow
  L2_351 = _UPVALUE1_
  L1_350 = L1_350(L2_351, _UPVALUE2_, A0_349)
  L2_351 = _UPVALUE0_
  L2_351 = L2_351.FALSE
  if L1_350 == L2_351 then
    L1_350 = _UPVALUE0_
    L1_350 = L1_350.INVALID_ARGUMENT
    return L1_350
  end
  L1_350 = db
  L1_350 = L1_350.getNextRowId
  L2_351 = A0_349
  L1_350 = L1_350(L2_351, _UPVALUE1_)
  L2_351 = _UPVALUE0_
  L2_351 = L2_351.NIL
  if L1_350 == L2_351 then
    L2_351 = _UPVALUE0_
    L2_351 = L2_351.NOT_EXIST
    return L2_351
  end
  L2_351 = db
  L2_351 = L2_351.getAttribute
  L2_351 = L2_351(_UPVALUE1_, _UPVALUE2_, L1_350, _UPVALUE3_.modeConfigStatus)
  if L2_351 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_350
  end
  return _UPVALUE0_.SUCCESS, L1_350, L2_351
end
function modeConfigStatusEnable(A0_352)
  if A0_352 == _UPVALUE0_.NIL or tonumber(A0_352) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_352) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_352, _UPVALUE3_.modeConfigStatus, _UPVALUE4_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_352
  end
  return _UPVALUE0_.SUCCESS, A0_352
end
function modeConfigStatusDisable(A0_353)
  if A0_353 == _UPVALUE0_.NIL or tonumber(A0_353) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_353) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_353, _UPVALUE3_.modeConfigStatus, _UPVALUE4_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_353
  end
  return _UPVALUE0_.SUCCESS, A0_353
end
function modeConfigRecordNameGet()
  local L0_354, L1_355
  L0_354 = db
  L0_354 = L0_354.getNextRowId
  L1_355 = "0"
  L0_354 = L0_354(L1_355, _UPVALUE0_)
  L1_355 = db
  L1_355 = L1_355.getAttribute
  L1_355 = L1_355(_UPVALUE0_, _UPVALUE1_, L0_354, _UPVALUE2_.modeConfigRecordName)
  if L1_355 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_354, L1_355
end
function modeConfigRecordNameGetNext(A0_356)
  local L1_357, L2_358
  L1_357 = _UPVALUE0_
  L1_357 = L1_357.NIL
  if A0_356 ~= L1_357 then
    L1_357 = tonumber
    L2_358 = A0_356
    L1_357 = L1_357(L2_358)
    L2_358 = _UPVALUE0_
    L2_358 = L2_358.NIL
  elseif L1_357 == L2_358 then
    L1_357 = _UPVALUE0_
    L1_357 = L1_357.INVALID_ARGUMENT
    return L1_357
  end
  L1_357 = db
  L1_357 = L1_357.existsRow
  L2_358 = _UPVALUE1_
  L1_357 = L1_357(L2_358, _UPVALUE2_, A0_356)
  L2_358 = _UPVALUE0_
  L2_358 = L2_358.FALSE
  if L1_357 == L2_358 then
    L1_357 = _UPVALUE0_
    L1_357 = L1_357.INVALID_ARGUMENT
    return L1_357
  end
  L1_357 = db
  L1_357 = L1_357.getNextRowId
  L2_358 = A0_356
  L1_357 = L1_357(L2_358, _UPVALUE1_)
  L2_358 = _UPVALUE0_
  L2_358 = L2_358.NIL
  if L1_357 == L2_358 then
    L2_358 = _UPVALUE0_
    L2_358 = L2_358.NOT_EXIST
    return L2_358
  end
  L2_358 = db
  L2_358 = L2_358.getAttribute
  L2_358 = L2_358(_UPVALUE1_, _UPVALUE2_, L1_357, _UPVALUE3_.modeConfigRecordName)
  if L2_358 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_357
  end
  return _UPVALUE0_.SUCCESS, L1_357, L2_358
end
function modeConfigRecordNameSet(A0_359, A1_360)
  if A0_359 == _UPVALUE0_.NIL or tonumber(A0_359) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_359) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_360 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_359, _UPVALUE3_.modeConfigRecordName, A1_360) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_359
  end
  return _UPVALUE0_.SUCCESS, A0_359
end
function addressFamilyGet()
  local L0_361, L1_362
  L0_361 = db
  L0_361 = L0_361.getNextRowId
  L1_362 = "0"
  L0_361 = L0_361(L1_362, _UPVALUE0_)
  L1_362 = db
  L1_362 = L1_362.getAttribute
  L1_362 = L1_362(_UPVALUE0_, _UPVALUE1_, L0_361, _UPVALUE2_.addressFamily)
  if L1_362 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_361, L1_362
end
function addressFamilyGetNext(A0_363)
  local L1_364, L2_365
  L1_364 = _UPVALUE0_
  L1_364 = L1_364.NIL
  if A0_363 ~= L1_364 then
    L1_364 = tonumber
    L2_365 = A0_363
    L1_364 = L1_364(L2_365)
    L2_365 = _UPVALUE0_
    L2_365 = L2_365.NIL
  elseif L1_364 == L2_365 then
    L1_364 = _UPVALUE0_
    L1_364 = L1_364.INVALID_ARGUMENT
    return L1_364
  end
  L1_364 = db
  L1_364 = L1_364.existsRow
  L2_365 = _UPVALUE1_
  L1_364 = L1_364(L2_365, _UPVALUE2_, A0_363)
  L2_365 = _UPVALUE0_
  L2_365 = L2_365.FALSE
  if L1_364 == L2_365 then
    L1_364 = _UPVALUE0_
    L1_364 = L1_364.INVALID_ARGUMENT
    return L1_364
  end
  L1_364 = db
  L1_364 = L1_364.getNextRowId
  L2_365 = A0_363
  L1_364 = L1_364(L2_365, _UPVALUE1_)
  L2_365 = _UPVALUE0_
  L2_365 = L2_365.NIL
  if L1_364 == L2_365 then
    L2_365 = _UPVALUE0_
    L2_365 = L2_365.NOT_EXIST
    return L2_365
  end
  L2_365 = db
  L2_365 = L2_365.getAttribute
  L2_365 = L2_365(_UPVALUE1_, _UPVALUE2_, L1_364, _UPVALUE3_.addressFamily)
  if L2_365 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_364
  end
  return _UPVALUE0_.SUCCESS, L1_364, L2_365
end
function addressFamilySet(A0_366, A1_367)
  if A0_366 == _UPVALUE0_.NIL or tonumber(A0_366) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_366) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_367 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_367) ~= _UPVALUE3_ and tonumber(A1_367) ~= _UPVALUE4_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_366, _UPVALUE5_.addressFamily, A1_367) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_366
  end
  return _UPVALUE0_.SUCCESS, A0_366
end
function isautoInitiativeEnabled()
  local L0_368, L1_369
  L0_368 = db
  L0_368 = L0_368.getNextRowId
  L1_369 = "0"
  L0_368 = L0_368(L1_369, _UPVALUE0_)
  L1_369 = db
  L1_369 = L1_369.getAttribute
  L1_369 = L1_369(_UPVALUE0_, _UPVALUE1_, L0_368, _UPVALUE2_.autoInitiative)
  if L1_369 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_368, L1_369
end
function isautoInitiativeEnabledNext(A0_370)
  local L1_371, L2_372
  L1_371 = _UPVALUE0_
  L1_371 = L1_371.NIL
  if A0_370 ~= L1_371 then
    L1_371 = tonumber
    L2_372 = A0_370
    L1_371 = L1_371(L2_372)
    L2_372 = _UPVALUE0_
    L2_372 = L2_372.NIL
  elseif L1_371 == L2_372 then
    L1_371 = _UPVALUE0_
    L1_371 = L1_371.INVALID_ARGUMENT
    return L1_371
  end
  L1_371 = db
  L1_371 = L1_371.existsRow
  L2_372 = _UPVALUE1_
  L1_371 = L1_371(L2_372, _UPVALUE2_, A0_370)
  L2_372 = _UPVALUE0_
  L2_372 = L2_372.FALSE
  if L1_371 == L2_372 then
    L1_371 = _UPVALUE0_
    L1_371 = L1_371.INVALID_ARGUMENT
    return L1_371
  end
  L1_371 = db
  L1_371 = L1_371.getNextRowId
  L2_372 = A0_370
  L1_371 = L1_371(L2_372, _UPVALUE1_)
  L2_372 = _UPVALUE0_
  L2_372 = L2_372.NIL
  if L1_371 == L2_372 then
    L2_372 = _UPVALUE0_
    L2_372 = L2_372.NOT_EXIST
    return L2_372
  end
  L2_372 = db
  L2_372 = L2_372.getAttribute
  L2_372 = L2_372(_UPVALUE1_, _UPVALUE2_, L1_371, _UPVALUE3_.autoInitiative)
  if L2_372 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_371
  end
  return _UPVALUE0_.SUCCESS, L1_371, L2_372
end
function autoInitiativeEnable(A0_373)
  if A0_373 == _UPVALUE0_.NIL or tonumber(A0_373) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_373) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_373, _UPVALUE3_.autoInitiative, _UPVALUE4_) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_373
  end
  return _UPVALUE0_.SUCCESS, A0_373
end
function autoInitiativeDisable(A0_374)
  if A0_374 == _UPVALUE0_.NIL or tonumber(A0_374) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_374) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_374, _UPVALUE3_.autoInitiative, _UPVALUE4_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_374
  end
  return _UPVALUE0_.SUCCESS, A0_374
end
function policyDescrGet()
  local L0_375, L1_376
  L0_375 = db
  L0_375 = L0_375.getNextRowId
  L1_376 = "0"
  L0_375 = L0_375(L1_376, _UPVALUE0_)
  L1_376 = db
  L1_376 = L1_376.getAttribute
  L1_376 = L1_376(_UPVALUE0_, _UPVALUE1_, L0_375, _UPVALUE2_.policyDescr)
  if L1_376 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_375, L1_376
end
function policyDescrGetNext(A0_377)
  local L1_378, L2_379
  L1_378 = _UPVALUE0_
  L1_378 = L1_378.NIL
  if A0_377 ~= L1_378 then
    L1_378 = tonumber
    L2_379 = A0_377
    L1_378 = L1_378(L2_379)
    L2_379 = _UPVALUE0_
    L2_379 = L2_379.NIL
  elseif L1_378 == L2_379 then
    L1_378 = _UPVALUE0_
    L1_378 = L1_378.INVALID_ARGUMENT
    return L1_378
  end
  L1_378 = db
  L1_378 = L1_378.existsRow
  L2_379 = _UPVALUE1_
  L1_378 = L1_378(L2_379, _UPVALUE2_, A0_377)
  L2_379 = _UPVALUE0_
  L2_379 = L2_379.FALSE
  if L1_378 == L2_379 then
    L1_378 = _UPVALUE0_
    L1_378 = L1_378.INVALID_ARGUMENT
    return L1_378
  end
  L1_378 = db
  L1_378 = L1_378.getNextRowId
  L2_379 = A0_377
  L1_378 = L1_378(L2_379, _UPVALUE1_)
  L2_379 = _UPVALUE0_
  L2_379 = L2_379.NIL
  if L1_378 == L2_379 then
    L2_379 = _UPVALUE0_
    L2_379 = L2_379.NOT_EXIST
    return L2_379
  end
  L2_379 = db
  L2_379 = L2_379.getAttribute
  L2_379 = L2_379(_UPVALUE1_, _UPVALUE2_, L1_378, _UPVALUE3_.policyDescr)
  if L2_379 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_378
  end
  return _UPVALUE0_.SUCCESS, L1_378, L2_379
end
function policyDescrSet(A0_380, A1_381)
  if A0_380 == _UPVALUE0_.NIL or tonumber(A0_380) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_380) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_381 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_380, _UPVALUE3_.policyDescr, A1_381) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_380
  end
  return _UPVALUE0_.SUCCESS, A0_380
end
function vpnPolicyGet()
  local L0_382, L1_383
  L0_382 = db
  L0_382 = L0_382.getNextRowId
  L1_383 = "0"
  L0_382 = L0_382(L1_383, _UPVALUE0_)
  L1_383 = db
  L1_383 = L1_383.getRow
  L1_383 = L1_383(_UPVALUE0_, _UPVALUE1_, L0_382)
  if L1_383 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_382, L1_383
end
function vpnPolicyGetNext(A0_384)
  local L1_385, L2_386
  L1_385 = _UPVALUE0_
  L1_385 = L1_385.NIL
  if A0_384 ~= L1_385 then
    L1_385 = tonumber
    L2_386 = A0_384
    L1_385 = L1_385(L2_386)
    L2_386 = _UPVALUE0_
    L2_386 = L2_386.NIL
  elseif L1_385 == L2_386 then
    L1_385 = _UPVALUE0_
    L1_385 = L1_385.INVALID_ARGUMENT
    return L1_385
  end
  L1_385 = db
  L1_385 = L1_385.existsRow
  L2_386 = _UPVALUE1_
  L1_385 = L1_385(L2_386, _UPVALUE2_, A0_384)
  L2_386 = _UPVALUE0_
  L2_386 = L2_386.FALSE
  if L1_385 == L2_386 then
    L1_385 = _UPVALUE0_
    L1_385 = L1_385.INVALID_ARGUMENT
    return L1_385
  end
  L1_385 = db
  L1_385 = L1_385.getNextRowId
  L2_386 = A0_384
  L1_385 = L1_385(L2_386, _UPVALUE1_)
  L2_386 = _UPVALUE0_
  L2_386 = L2_386.NIL
  if L1_385 == L2_386 then
    L2_386 = _UPVALUE0_
    L2_386 = L2_386.NOT_EXIST
    return L2_386
  end
  L2_386 = db
  L2_386 = L2_386.getRow
  L2_386 = L2_386(_UPVALUE1_, _UPVALUE2_, L1_385)
  if L2_386 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_384
  end
  return _UPVALUE0_.SUCCESS, L1_385, L2_386
end
function vpnPolicySet(A0_387, A1_388, A2_389, A3_390, A4_391, A5_392, A6_393, A7_394, A8_395, A9_396, A10_397, A11_398, A12_399, A13_400, A14_401, A15_402, A16_403, A17_404, A18_405, A19_406, A20_407, A21_408, A22_409, A23_410, A24_411, A25_412, A26_413, A27_414, A28_415, A29_416, A30_417, A31_418, A32_419, A33_420, A34_421, A35_422, A36_423, A37_424, A38_425, A39_426, A40_427, A41_428, A42_429, A43_430, A44_431, A45_432, A46_433, A47_434, A48_435)
  local L49_436, L50_437, L51_438, L52_439, L53_440, L54_441, L55_442, L56_443, L57_444, L58_445, L59_446, L60_447, L61_448, L62_449, L63_450, L64_451, L65_452, L66_453, L67_454, L68_455
  L49_436 = _UPVALUE0_
  L49_436 = L49_436.NIL
  if A0_387 ~= L49_436 then
    L49_436 = tonumber
    L50_437 = A0_387
    L49_436 = L49_436(L50_437)
    L50_437 = _UPVALUE0_
    L50_437 = L50_437.NIL
  elseif L49_436 == L50_437 then
    L49_436 = _UPVALUE0_
    L49_436 = L49_436.INVALID_ARGUMENT
    return L49_436
  end
  L49_436 = db
  L49_436 = L49_436.existsRow
  L50_437 = _UPVALUE1_
  L51_438 = _UPVALUE2_
  L52_439 = A0_387
  L49_436 = L49_436(L50_437, L51_438, L52_439)
  L50_437 = _UPVALUE0_
  L50_437 = L50_437.FALSE
  if L49_436 == L50_437 then
    L49_436 = _UPVALUE0_
    L49_436 = L49_436.INVALID_ARGUMENT
    return L49_436
  end
  L49_436 = nil
  L50_437 = {}
  L51_438 = _UPVALUE0_
  L51_438 = L51_438.NIL
  if A1_388 == L51_438 then
    L51_438 = _UPVALUE0_
    L51_438 = L51_438.INVALID_ARGUMENT
    return L51_438
  end
  L51_438 = db
  L51_438 = L51_438.getAttribute
  L52_439 = "l2tpVPNClient"
  L53_440 = "_ROWID_"
  L54_441 = 1
  L55_442 = "l2tpClientEnable"
  L51_438 = L51_438(L52_439, L53_440, L54_441, L55_442)
  if A43_430 == 2 and A3_390 == 0 and L51_438 == "1" then
    L52_439 = db
    L52_439 = L52_439.setAttribute
    L53_440 = "l2tpClientConnectionStatus"
    L54_441 = _UPVALUE2_
    L55_442 = "1"
    L56_443 = "action"
    L57_444 = 0
    L52_439(L53_440, L54_441, L55_442, L56_443, L57_444)
  end
  L52_439 = _UPVALUE1_
  L53_440 = "."
  L54_441 = _UPVALUE3_
  L54_441 = L54_441.policyName
  L52_439 = L52_439 .. L53_440 .. L54_441
  L50_437[L52_439] = A1_388
  L52_439 = db
  L52_439 = L52_439.existsRow
  L53_440 = _UPVALUE4_
  L54_441 = _UPVALUE3_
  L54_441 = L54_441.vpnPolicyName
  L55_442 = A1_388
  L52_439 = L52_439(L53_440, L54_441, L55_442)
  if L52_439 then
    L52_439 = _UPVALUE5_
    L52_439 = L52_439.VPN_POLICY_IN_USE_BY_ONE_TO_ONE_NAT
    return L52_439
  end
  L52_439 = _UPVALUE0_
  L52_439 = L52_439.NIL
  if A2_389 == L52_439 then
    L52_439 = _UPVALUE0_
    L52_439 = L52_439.INVALID_ARGUMENT
    return L52_439
  end
  L52_439 = tonumber
  L53_440 = A2_389
  L52_439 = L52_439(L53_440)
  L53_440 = _UPVALUE6_
  if L52_439 ~= L53_440 then
    L53_440 = _UPVALUE7_
    if L52_439 ~= L53_440 then
      L53_440 = _UPVALUE0_
      L53_440 = L53_440.INVALID_ARGUMENT
      return L53_440
    end
  end
  L53_440 = _UPVALUE1_
  L54_441 = "."
  L55_442 = _UPVALUE3_
  L55_442 = L55_442.protocol
  L53_440 = L53_440 .. L54_441 .. L55_442
  L50_437[L53_440] = A2_389
  L53_440 = _UPVALUE0_
  L53_440 = L53_440.NIL
  if A3_390 == L53_440 then
    if A5_392 == nil then
      L53_440 = _UPVALUE0_
      L53_440 = L53_440.INVALID_ARGUMENT
      return L53_440
    end
    A3_390 = _UPVALUE8_
    L53_440 = tonumber
    L54_441 = A5_392
    L53_440 = L53_440(L54_441)
    L54_441 = _UPVALUE9_
    if L53_440 ~= L54_441 then
      if A43_430 == nil then
        L53_440 = _UPVALUE0_
        L53_440 = L53_440.INVALID_ARGUMENT
        return L53_440
      end
      L53_440 = tonumber
      L54_441 = A43_430
      L53_440 = L53_440(L54_441)
      if L53_440 ~= 0 then
        A3_390 = _UPVALUE10_
      end
    end
  end
  L53_440 = tonumber
  L54_441 = A3_390
  L53_440 = L53_440(L54_441)
  L54_441 = _UPVALUE8_
  if L53_440 ~= L54_441 then
    L54_441 = _UPVALUE10_
    if L53_440 ~= L54_441 then
      L54_441 = _UPVALUE0_
      L54_441 = L54_441.INVALID_ARGUMENT
      return L54_441
    end
  end
  L54_441 = _UPVALUE1_
  L55_442 = "."
  L56_443 = _UPVALUE3_
  L56_443 = L56_443.ipsecMode
  L54_441 = L54_441 .. L55_442 .. L56_443
  L50_437[L54_441] = A3_390
  L54_441 = _UPVALUE8_
  if L53_440 == L54_441 then
    L54_441 = _UPVALUE0_
    L54_441 = L54_441.NIL
    if A4_391 == L54_441 then
      L54_441 = _UPVALUE0_
      L54_441 = L54_441.INVALID_ARGUMENT
      return L54_441
    end
    L54_441 = _UPVALUE11_
    L54_441 = L54_441.isBoolean
    L55_442 = A4_391
    L54_441 = L54_441(L55_442)
    L49_436 = L54_441
    L54_441 = _UPVALUE0_
    L54_441 = L54_441.SUCCESS
    if L49_436 ~= L54_441 then
      L54_441 = _UPVALUE0_
      L54_441 = L54_441.INVALID_ARGUMENT
      return L54_441
    end
    L54_441 = _UPVALUE1_
    L55_442 = "."
    L56_443 = _UPVALUE3_
    L56_443 = L56_443.dhcpOverIpsec
    L54_441 = L54_441 .. L55_442 .. L56_443
    L50_437[L54_441] = A4_391
  end
  L54_441 = _UPVALUE0_
  L54_441 = L54_441.NIL
  if A5_392 == L54_441 then
    L54_441 = _UPVALUE0_
    L54_441 = L54_441.INVALID_ARGUMENT
    return L54_441
  end
  L54_441 = tonumber
  L55_442 = A5_392
  L54_441 = L54_441(L55_442)
  L55_442 = _UPVALUE9_
  if L54_441 ~= L55_442 then
    L55_442 = _UPVALUE12_
    if L54_441 ~= L55_442 then
      L55_442 = _UPVALUE0_
      L55_442 = L55_442.INVALID_ARGUMENT
      return L55_442
    end
  end
  L55_442 = _UPVALUE1_
  L56_443 = "."
  L57_444 = _UPVALUE3_
  L57_444 = L57_444.policyType
  L55_442 = L55_442 .. L56_443 .. L57_444
  L50_437[L55_442] = A5_392
  L55_442 = _UPVALUE0_
  L55_442 = L55_442.NIL
  if A6_393 == L55_442 then
    L55_442 = _UPVALUE0_
    L55_442 = L55_442.INVALID_ARGUMENT
    return L55_442
  end
  L55_442 = tonumber
  L56_443 = A6_393
  L55_442 = L55_442(L56_443)
  L56_443 = _UPVALUE13_
  if L55_442 ~= L56_443 then
    L56_443 = _UPVALUE14_
    if L55_442 ~= L56_443 then
      L56_443 = _UPVALUE15_
      if L55_442 ~= L56_443 then
        L56_443 = _UPVALUE0_
        L56_443 = L56_443.INVALID_ARGUMENT
        return L56_443
      end
    end
  end
  L56_443 = _UPVALUE1_
  L57_444 = "."
  L58_445 = _UPVALUE3_
  L58_445 = L58_445.localGateway
  L56_443 = L56_443 .. L57_444 .. L58_445
  L50_437[L56_443] = A6_393
  L56_443 = nil
  L57_444 = _UPVALUE12_
  if L54_441 == L57_444 then
    L57_444 = _UPVALUE0_
    L57_444 = L57_444.NIL
    if A7_394 == L57_444 then
      L57_444 = _UPVALUE0_
      L57_444 = L57_444.INVALID_ARGUMENT
      return L57_444
    end
    L57_444 = tonumber
    L58_445 = A7_394
    L57_444 = L57_444(L58_445)
    L56_443 = L57_444
    L57_444 = _UPVALUE16_
    if L56_443 ~= L57_444 then
      L57_444 = _UPVALUE17_
      if L56_443 ~= L57_444 then
        L57_444 = _UPVALUE0_
        L57_444 = L57_444.INVALID_ARGUMENT
        return L57_444
      end
    end
  else
    L57_444 = tostring
    L58_445 = _UPVALUE16_
    L57_444 = L57_444(L58_445)
    A7_394 = L57_444
    L56_443 = _UPVALUE16_
  end
  L57_444 = _UPVALUE1_
  L58_445 = "."
  L57_444 = L57_444 .. L58_445 .. L59_446
  L50_437[L57_444] = A7_394
  L57_444 = _UPVALUE0_
  L57_444 = L57_444.NIL
  if A8_395 == L57_444 then
    L57_444 = _UPVALUE0_
    L57_444 = L57_444.INVALID_ARGUMENT
    return L57_444
  end
  L57_444 = _UPVALUE16_
  if L56_443 == L57_444 then
    if A46_433 == "10" then
      L57_444 = _UPVALUE11_
      L57_444 = L57_444.ipAddressCheck
      L58_445 = "10"
      L57_444 = L57_444(L58_445, L59_446)
      L49_436 = L57_444
    else
      L57_444 = _UPVALUE11_
      L57_444 = L57_444.ipAddressCheck
      L58_445 = "2"
      L57_444 = L57_444(L58_445, L59_446)
      L49_436 = L57_444
    end
    L57_444 = _UPVALUE0_
    L57_444 = L57_444.SUCCESS
    if L49_436 ~= L57_444 then
      L57_444 = _UPVALUE5_
      L57_444 = L57_444.VIPSECURE_REMOTEENDPOINTIP_INVALID
      return L57_444
    end
    if A47_434 ~= "-10" then
      L57_444 = optionIpCheck
      L58_445 = A8_395
      L57_444 = L57_444(L58_445, L59_446)
      L58_445 = _UPVALUE0_
      L58_445 = L58_445.SUCCESS
      if L57_444 ~= L58_445 then
        return L57_444
      end
    end
    L57_444 = _UPVALUE1_
    L58_445 = "."
    L57_444 = L57_444 .. L58_445 .. L59_446
    L50_437[L57_444] = A8_395
  end
  L57_444 = _UPVALUE17_
  if L56_443 == L57_444 then
    if A8_395 == "0.0.0.0" then
      L57_444 = db
      L57_444 = L57_444.getRowWhere
      L58_445 = _UPVALUE1_
      L57_444 = L57_444(L58_445, L59_446)
      L57_444 = L57_444 or ""
      if L57_444 ~= nil and L57_444 ~= "" then
        L58_445 = _UPVALUE1_
        L58_445 = L58_445 .. L59_446 .. L60_447
        L58_445 = L57_444[L58_445]
        if L58_445 ~= A1_388 then
          L58_445 = _UPVALUE5_
          L58_445 = L58_445.VIPSECURE_DUPL_ANONYMOUS_POLICY
          return L58_445
        end
      end
    end
    L57_444 = _UPVALUE11_
    L57_444 = L57_444.fqdnCheck
    L58_445 = A8_395
    L57_444 = L57_444(L58_445)
    L49_436 = L57_444
    L57_444 = _UPVALUE0_
    L57_444 = L57_444.SUCCESS
    if L49_436 ~= L57_444 then
      L57_444 = _UPVALUE5_
      L57_444 = L57_444.VIPSECURE_REMOTEENDPOINTFQDN_INVALID
      return L57_444
    end
    L57_444 = _UPVALUE1_
    L58_445 = "."
    L57_444 = L57_444 .. L58_445 .. L59_446
    L50_437[L57_444] = A8_395
  end
  L57_444 = _UPVALUE8_
  if L53_440 == L57_444 then
    L57_444 = _UPVALUE0_
    L57_444 = L57_444.NIL
    if A9_396 == L57_444 then
      L57_444 = _UPVALUE0_
      L57_444 = L57_444.INVALID_ARGUMENT
      return L57_444
    end
    L57_444 = _UPVALUE11_
    L57_444 = L57_444.isBoolean
    L58_445 = A9_396
    L57_444 = L57_444(L58_445)
    L49_436 = L57_444
    L57_444 = _UPVALUE0_
    L57_444 = L57_444.SUCCESS
    if L49_436 ~= L57_444 then
      L57_444 = _UPVALUE0_
      L57_444 = L57_444.INVALID_ARGUMENT
      return L57_444
    end
    L57_444 = _UPVALUE1_
    L58_445 = "."
    L57_444 = L57_444 .. L58_445 .. L59_446
    L50_437[L57_444] = A9_396
    if A9_396 == "1" then
      A25_412 = "3"
    end
  end
  L57_444 = _UPVALUE0_
  L57_444 = L57_444.NIL
  if A10_397 == L57_444 then
    L57_444 = _UPVALUE0_
    L57_444 = L57_444.INVALID_ARGUMENT
    return L57_444
  end
  L57_444 = _UPVALUE11_
  L57_444 = L57_444.isBoolean
  L58_445 = A10_397
  L57_444 = L57_444(L58_445)
  L49_436 = L57_444
  L57_444 = _UPVALUE0_
  L57_444 = L57_444.SUCCESS
  if L49_436 ~= L57_444 then
    L57_444 = _UPVALUE0_
    L57_444 = L57_444.INVALID_ARGUMENT
    return L57_444
  end
  L57_444 = _UPVALUE1_
  L58_445 = "."
  L57_444 = L57_444 .. L58_445 .. L59_446
  L50_437[L57_444] = A10_397
  L57_444 = _UPVALUE0_
  L57_444 = L57_444.NIL
  if A11_398 ~= L57_444 then
    L57_444 = _UPVALUE1_
    L58_445 = "."
    L57_444 = L57_444 .. L58_445 .. L59_446
    L50_437[L57_444] = A11_398
  end
  L57_444 = _UPVALUE12_
  if L54_441 == L57_444 then
    L57_444 = _UPVALUE0_
    L57_444 = L57_444.NIL
    if A12_399 == L57_444 then
      L57_444 = _UPVALUE0_
      L57_444 = L57_444.INVALID_ARGUMENT
      return L57_444
    end
    L57_444 = _UPVALUE11_
    L57_444 = L57_444.isBoolean
    L58_445 = A12_399
    L57_444 = L57_444(L58_445)
    L49_436 = L57_444
    L57_444 = _UPVALUE0_
    L57_444 = L57_444.SUCCESS
    if L49_436 ~= L57_444 then
      L57_444 = _UPVALUE0_
      L57_444 = L57_444.INVALID_ARGUMENT
      return L57_444
    end
    L57_444 = _UPVALUE1_
    L58_445 = "."
    L57_444 = L57_444 .. L58_445 .. L59_446
    L50_437[L57_444] = A12_399
    L57_444 = _UPVALUE18_
    if A12_399 == L57_444 then
      L57_444 = _UPVALUE0_
      L57_444 = L57_444.NIL
      if A13_400 == L57_444 then
        L57_444 = _UPVALUE0_
        L57_444 = L57_444.INVALID_ARGUMENT
        return L57_444
      end
      if A46_433 == "10" then
        L57_444 = _UPVALUE11_
        L57_444 = L57_444.ipAddressCheck
        L58_445 = "10"
        L57_444 = L57_444(L58_445, L59_446)
        L49_436 = L57_444
      else
        L57_444 = _UPVALUE11_
        L57_444 = L57_444.ipAddressCheck
        L58_445 = "2"
        L57_444 = L57_444(L58_445, L59_446)
        L49_436 = L57_444
      end
      L57_444 = _UPVALUE0_
      L57_444 = L57_444.SUCCESS
      if L49_436 ~= L57_444 then
        L57_444 = _UPVALUE5_
        L57_444 = L57_444.VIPSECURE_KEEPALIVE_SOURCEADDRESS_INVALID
        return L57_444
      end
      L57_444 = _UPVALUE1_
      L58_445 = "."
      L57_444 = L57_444 .. L58_445 .. L59_446
      L50_437[L57_444] = A13_400
      L57_444 = _UPVALUE0_
      L57_444 = L57_444.NIL
      if A14_401 == L57_444 then
        L57_444 = _UPVALUE0_
        L57_444 = L57_444.INVALID_ARGUMENT
        return L57_444
      end
      if A46_433 == "10" then
        L57_444 = _UPVALUE11_
        L57_444 = L57_444.ipAddressCheck
        L58_445 = "10"
        L57_444 = L57_444(L58_445, L59_446)
        L49_436 = L57_444
      else
        L57_444 = _UPVALUE11_
        L57_444 = L57_444.ipAddressCheck
        L58_445 = "2"
        L57_444 = L57_444(L58_445, L59_446)
        L49_436 = L57_444
      end
      L57_444 = _UPVALUE0_
      L57_444 = L57_444.SUCCESS
      if L49_436 ~= L57_444 then
        L57_444 = _UPVALUE5_
        L57_444 = L57_444.VIPSECURE_KEEPALIVE_REMOTEPINGIP_INVALID
        return L57_444
      end
      L57_444 = _UPVALUE1_
      L58_445 = "."
      L57_444 = L57_444 .. L58_445 .. L59_446
      L50_437[L57_444] = A14_401
      L57_444 = _UPVALUE0_
      L57_444 = L57_444.NIL
      if A15_402 == L57_444 then
        L57_444 = _UPVALUE0_
        L57_444 = L57_444.INVALID_ARGUMENT
        return L57_444
      end
      L57_444 = _UPVALUE1_
      L58_445 = "."
      L57_444 = L57_444 .. L58_445 .. L59_446
      L50_437[L57_444] = A15_402
      L57_444 = _UPVALUE0_
      L57_444 = L57_444.NIL
      if A16_403 == L57_444 then
        L57_444 = _UPVALUE0_
        L57_444 = L57_444.INVALID_ARGUMENT
        return L57_444
      end
      L57_444 = _UPVALUE1_
      L58_445 = "."
      L57_444 = L57_444 .. L58_445 .. L59_446
      L50_437[L57_444] = A16_403
    end
  end
  L57_444 = _UPVALUE0_
  L57_444 = L57_444.NIL
  if A17_404 == L57_444 then
    L57_444 = _UPVALUE0_
    L57_444 = L57_444.INVALID_ARGUMENT
    return L57_444
  end
  L57_444 = tonumber
  L58_445 = A17_404
  L57_444 = L57_444(L58_445)
  L58_445 = _UPVALUE0_
  L58_445 = L58_445.NIL
  if L57_444 == L58_445 then
    L58_445 = _UPVALUE0_
    L58_445 = L58_445.INVALID_ARGUMENT
    return L58_445
  end
  if L57_444 == 0 then
    L58_445 = _UPVALUE5_
    L58_445 = L58_445.ATLEAST_ONE_ENCRYPTION
    return L58_445
  end
  L58_445 = _UPVALUE1_
  L58_445 = L58_445 .. L59_446 .. L60_447
  L50_437[L58_445] = A17_404
  L58_445 = _UPVALUE0_
  L58_445 = L58_445.NIL
  if A18_405 ~= L58_445 then
    L58_445 = util
    L58_445 = L58_445.split
    L58_445 = L58_445(L59_446, L60_447)
    if L61_448 == 2 then
    else
    end
    L62_449 = L59_446
    if L61_448 ~= 0 then
      return L61_448
    end
    if L60_447 ~= L61_448 then
      L62_449 = L60_447
      if L61_448 ~= 0 then
        return L61_448
      end
    end
    L62_449 = "."
    L63_450 = _UPVALUE3_
    L63_450 = L63_450.encryptionAlgoKeyLength
    L50_437[L61_448] = A18_405
  end
  L58_445 = _UPVALUE0_
  L58_445 = L58_445.NIL
  if A19_406 == L58_445 then
    L58_445 = _UPVALUE0_
    L58_445 = L58_445.INVALID_ARGUMENT
    return L58_445
  end
  L58_445 = tonumber
  L58_445 = L58_445(L59_446)
  A19_406 = L58_445
  L58_445 = _UPVALUE0_
  L58_445 = L58_445.NIL
  if A19_406 == L58_445 then
    L58_445 = _UPVALUE0_
    L58_445 = L58_445.INVALID_ARGUMENT
    return L58_445
  end
  if A19_406 == 0 then
    L58_445 = _UPVALUE5_
    L58_445 = L58_445.ATLEAST_ONE_AUTH
    return L58_445
  end
  L58_445 = _UPVALUE1_
  L58_445 = L58_445 .. L59_446 .. L60_447
  L50_437[L58_445] = A19_406
  L58_445 = _UPVALUE8_
  if L53_440 == L58_445 then
    L58_445 = _UPVALUE19_
    if A4_391 == L58_445 then
      L58_445 = _UPVALUE0_
      L58_445 = L58_445.NIL
      if A20_407 == L58_445 then
        L58_445 = _UPVALUE0_
        L58_445 = L58_445.INVALID_ARGUMENT
        return L58_445
      end
      L58_445 = tonumber
      L58_445 = L58_445(L59_446)
      if L58_445 ~= L59_446 then
        if L58_445 ~= L59_446 then
          if L58_445 ~= L59_446 then
            if L58_445 ~= L59_446 then
              return L59_446
            end
          end
        end
      end
      L50_437[L59_446] = A20_407
      if L58_445 ~= L59_446 then
        if A21_408 == L59_446 then
          return L59_446
        end
        if A46_433 == "10" then
          L49_436 = L59_446
          if L49_436 ~= L59_446 then
            return L59_446
          end
          L50_437[L59_446] = A21_408
        else
          L49_436 = L59_446
          if L49_436 ~= L59_446 then
            return L59_446
          end
          L50_437[L59_446] = A21_408
        end
      end
      if L58_445 == L59_446 then
        if A22_409 == L59_446 then
          return L59_446
        end
        if A46_433 == "10" then
          L49_436 = L59_446
          if L49_436 ~= L59_446 then
            return L59_446
          end
        else
          L49_436 = L59_446
          if L49_436 ~= L59_446 then
            return L59_446
          end
        end
        if A46_433 == "10" then
          L62_449 = validRange
          L63_450 = A21_408
          L62_449 = L62_449(L63_450, L64_451)
        else
          L62_449 = _UPVALUE11_
          L62_449 = L62_449.ipv4SingleMaskCheck
          L63_450 = A21_408
          L62_449 = L62_449(L63_450, L64_451, L65_452)
        end
        L62_449 = _UPVALUE0_
        L62_449 = L62_449.SUCCESS
        if L61_448 ~= L62_449 then
          L62_449 = _UPVALUE5_
          L62_449 = L62_449.LOCAL_IP_RANGE_NOTIN_SAME_SUBNET
          return L62_449
        end
        L62_449 = _UPVALUE1_
        L63_450 = "."
        L62_449 = L62_449 .. L63_450 .. L64_451
        L50_437[L62_449] = A22_409
      end
      if L58_445 == L59_446 then
        if A46_433 == "2" then
          if A23_410 == L59_446 then
            return L59_446
          end
          L49_436 = L59_446
          if L49_436 ~= L59_446 then
            return L59_446
          end
          L50_437[L59_446] = A23_410
        else
          if A24_411 == L59_446 then
            return L59_446
          end
          L50_437[L59_446] = A24_411
        end
      end
      if A25_412 == L59_446 then
        return L59_446
      end
      if L59_446 ~= L60_447 then
        if L59_446 ~= L60_447 then
          if L59_446 ~= L60_447 then
            if L59_446 ~= L60_447 then
              return L60_447
            end
          end
        end
      end
      L62_449 = _UPVALUE3_
      L62_449 = L62_449.remoteNetworkType
      L50_437[L60_447] = A25_412
      if L59_446 ~= L60_447 then
        if A26_413 == L60_447 then
          return L60_447
        end
        if A46_433 == "10" then
          L62_449 = A26_413
          L49_436 = L60_447
        else
          L62_449 = A26_413
          L49_436 = L60_447
        end
        if L49_436 ~= L60_447 then
          return L60_447
        end
        L62_449 = _UPVALUE3_
        L62_449 = L62_449.remoteStartAddress
        L50_437[L60_447] = A26_413
      end
      if L59_446 == L60_447 then
        if A27_414 == L60_447 then
          return L60_447
        end
        if A46_433 == "10" then
          L62_449 = A27_414
          L49_436 = L60_447
        else
          L62_449 = A27_414
          L49_436 = L60_447
        end
        if L49_436 ~= L60_447 then
          return L60_447
        end
        L62_449 = nil
        if A46_433 == "10" then
          L63_450 = validRange
          L63_450 = L63_450(L64_451, L65_452)
          L62_449 = L63_450
        else
          L63_450 = _UPVALUE11_
          L63_450 = L63_450.ipv4SingleMaskCheck
          L63_450 = L63_450(L64_451, L65_452, L66_453)
          L62_449 = L63_450
        end
        L63_450 = _UPVALUE0_
        L63_450 = L63_450.SUCCESS
        if L62_449 ~= L63_450 then
          L63_450 = _UPVALUE5_
          L63_450 = L63_450.REMOTE_IP_RANGE_NOTIN_SAME_SUBNET
          return L63_450
        end
        L63_450 = _UPVALUE1_
        L63_450 = L63_450 .. L64_451 .. L65_452
        L50_437[L63_450] = A27_414
      end
      if L59_446 == L60_447 then
        if A46_433 == "2" then
          if A28_415 == L60_447 then
            return L60_447
          end
          L62_449 = A28_415
          L49_436 = L60_447
          if L49_436 ~= L60_447 then
            return L60_447
          end
          L62_449 = _UPVALUE3_
          L62_449 = L62_449.remoteSubnetmask
          L50_437[L60_447] = A28_415
        else
          if A29_416 == L60_447 then
            return L60_447
          end
          L62_449 = _UPVALUE3_
          L62_449 = L62_449.remotePrefixLength
          L50_437[L60_447] = A29_416
        end
      end
    end
    L58_445 = _UPVALUE18_
    if A4_391 == L58_445 then
      A20_407 = "0"
      A25_412 = "0"
      L58_445 = _UPVALUE1_
      L58_445 = L58_445 .. L59_446 .. L60_447
      L50_437[L58_445] = A20_407
      L58_445 = _UPVALUE1_
      L58_445 = L58_445 .. L59_446 .. L60_447
      L50_437[L58_445] = A25_412
    end
  else
    A20_407 = "0"
    A25_412 = "0"
    L58_445 = _UPVALUE1_
    L58_445 = L58_445 .. L59_446 .. L60_447
    L50_437[L58_445] = A20_407
    L58_445 = _UPVALUE1_
    L58_445 = L58_445 .. L59_446 .. L60_447
    L50_437[L58_445] = A25_412
  end
  L58_445 = _UPVALUE9_
  if L54_441 == L58_445 then
    L58_445 = _UPVALUE0_
    L58_445 = L58_445.NIL
    if A30_417 == L58_445 then
      L58_445 = _UPVALUE0_
      L58_445 = L58_445.INVALID_ARGUMENT
      return L58_445
    end
    L58_445 = _UPVALUE1_
    L58_445 = L58_445 .. L59_446 .. L60_447
    L50_437[L58_445] = A30_417
    L58_445 = db
    L58_445 = L58_445.getRowsWhere
    L62_449 = _UPVALUE9_
    L58_445 = L58_445(L59_446, L60_447)
    for L62_449, L63_450 in L59_446(L60_447) do
      if L64_451 ~= A1_388 then
        if A30_417 == L64_451 then
          return L64_451
        end
      end
    end
    if A31_418 == L59_446 then
      return L59_446
    end
    L50_437[L59_446] = A31_418
    if L57_444 ~= 1 then
      if A32_419 == L59_446 then
        return L59_446
      end
      if L59_446 == L60_447 then
        return L60_447
      end
      L62_449 = L57_444
      L63_450 = A18_405
      if L60_447 ~= L61_448 then
        return L60_447
      end
      L62_449 = "."
      L63_450 = _UPVALUE3_
      L63_450 = L63_450.encryptionKeyIn
      L50_437[L61_448] = A32_419
      if A33_420 == L61_448 then
        return L61_448
      end
      L62_449 = A33_420
      L62_449 = _UPVALUE0_
      L62_449 = L62_449.EMPTY
      if L61_448 == L62_449 then
        L62_449 = _UPVALUE0_
        L62_449 = L62_449.INVALID_ARGUMENT
        return L62_449
      end
      L62_449 = encryptionKeyValidate
      L63_450 = L61_448
      L62_449 = L62_449(L63_450, L64_451, L65_452)
      L63_450 = _UPVALUE0_
      L63_450 = L63_450.SUCCESS
      if L62_449 ~= L63_450 then
        return L62_449
      end
      L63_450 = _UPVALUE1_
      L63_450 = L63_450 .. L64_451 .. L65_452
      L50_437[L63_450] = A33_420
    end
    if A34_421 == L59_446 then
      return L59_446
    end
    if L59_446 == L60_447 then
      return L60_447
    end
    L62_449 = A19_406
    if L60_447 ~= L61_448 then
      return L60_447
    end
    L62_449 = "."
    L63_450 = _UPVALUE3_
    L63_450 = L63_450.authKeyIn
    L50_437[L61_448] = A34_421
    if A35_422 == L61_448 then
      return L61_448
    end
    L62_449 = A35_422
    L62_449 = _UPVALUE0_
    L62_449 = L62_449.EMPTY
    if L61_448 == L62_449 then
      L62_449 = _UPVALUE0_
      L62_449 = L62_449.INVALID_ARGUMENT
      return L62_449
    end
    L62_449 = authKeyValidate
    L63_450 = L61_448
    L62_449 = L62_449(L63_450, L64_451)
    L63_450 = _UPVALUE0_
    L63_450 = L63_450.SUCCESS
    if L62_449 ~= L63_450 then
      return L62_449
    end
    L63_450 = _UPVALUE1_
    L63_450 = L63_450 .. L64_451 .. L65_452
    L50_437[L63_450] = A35_422
  end
  L58_445 = _UPVALUE0_
  L58_445 = L58_445.NIL
  if A36_423 == L58_445 then
    L58_445 = _UPVALUE0_
    L58_445 = L58_445.INVALID_ARGUMENT
    return L58_445
  end
  L58_445 = tonumber
  L58_445 = L58_445(L59_446)
  if L58_445 ~= L59_446 then
    if L58_445 ~= L59_446 then
      if L58_445 ~= L59_446 then
        return L59_446
      end
    end
  end
  L50_437[L59_446] = A36_423
  if L54_441 == L59_446 then
    if A38_425 == L59_446 then
      return L59_446
    end
    if L59_446 ~= 0 and L59_446 ~= 1 then
      return L60_447
    end
    L62_449 = _UPVALUE3_
    L62_449 = L62_449.saLifeTimeType
    L50_437[L60_447] = A38_425
    if A37_424 == L60_447 then
      return L60_447
    end
    if L59_446 == 0 then
      if not (L60_447 < L61_448) then
      elseif L60_447 > L61_448 then
        return L60_447
      end
    end
    L62_449 = _UPVALUE3_
    L62_449 = L62_449.saLifeTime
    L50_437[L60_447] = A37_424
    if A39_426 == L60_447 then
      return L60_447
    end
    if L60_447 ~= L61_448 then
      if L60_447 ~= L61_448 then
        if L60_447 ~= L61_448 then
          if L60_447 ~= L61_448 then
            if L60_447 ~= L61_448 then
              if L60_447 ~= L61_448 then
                if L60_447 ~= L61_448 then
                  if L60_447 ~= L61_448 then
                    if L60_447 ~= L61_448 then
                      return L61_448
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    L62_449 = "."
    L63_450 = _UPVALUE3_
    L63_450 = L63_450.pfsKeyGroup
    L50_437[L61_448] = A39_426
  end
  if A45_432 == "1" then
    if A40_427 == L59_446 then
      return L59_446
    end
    if A40_427 ~= L59_446 then
      L50_437[L59_446] = A40_427
    end
    if A41_428 ~= L59_446 then
      L50_437[L59_446] = A41_428
    end
  else
    A45_432 = "0"
    A40_427 = ""
    A41_428 = "30"
    L50_437[L59_446] = A40_427
    L50_437[L59_446] = A41_428
  end
  L50_437[L59_446] = A45_432
  if A42_429 ~= L59_446 then
    L50_437[L59_446] = A42_429
  end
  if A43_430 ~= L59_446 then
    L50_437[L59_446] = A43_430
  end
  if A5_392 == "1" then
    L50_437[L59_446] = A1_388
  end
  if A44_431 == L59_446 then
    return L59_446
  end
  L49_436 = L59_446
  if L49_436 ~= L59_446 then
    return L59_446
  end
  L50_437[L59_446] = A44_431
  if A36_423 == "0" and A44_431 == "1" then
    return L59_446
  end
  if (A36_423 == "1" or A36_423 == "2") and A12_399 == "1" then
    return L59_446
  end
  if L59_446 ~= L60_447 then
    if L59_446 ~= L60_447 then
      return L60_447
    end
  end
  L62_449 = _UPVALUE3_
  L62_449 = L62_449.addressFamily
  L50_437[L60_447] = A46_433
  if A5_392 == "2" then
    L62_449 = _UPVALUE3_
    L62_449 = L62_449.ikePolicyName
    L50_437[L60_447] = ""
  end
  if A3_390 ~= 1 and A4_391 ~= "1" or A3_390 ~= 0 then
    L62_449 = 1
    if L60_447 ~= nil then
      if L61_448 == 1 then
        L62_449 = _UPVALUE1_
        L63_450 = "."
        L62_449 = L62_449 .. L63_450 .. L64_451
        if L61_448 ~= A0_387 then
          L62_449 = "."
          L63_450 = _UPVALUE3_
          L63_450 = L63_450.ipsecStatus
          L50_437[L61_448] = "0"
          L62_449 = "."
          L63_450 = _UPVALUE3_
          L63_450 = L63_450.ikePolicyName
          L62_449 = db
          L62_449 = L62_449.getRowsWhere
          L63_450 = "IpsecVPNPolicy"
          L62_449 = L62_449(L63_450, L64_451)
          L63_450 = #L62_449
          if L63_450 == 1 then
            L63_450 = L62_449[1]
            L63_450 = L63_450[L64_451]
          else
            if L63_450 == A0_387 then
              L63_450 = #L62_449
          end
          elseif L63_450 > 1 then
            L63_450 = L62_449[1]
            if L64_451 == L65_452 then
              if L64_451 == L65_452 then
                return L64_451
              end
            end
          end
        end
      end
    end
  end
  L62_449 = "_ROWID_"
  L63_450 = A0_387
  if L61_448 == "1" then
    L62_449 = "IpsecVPNPolicy"
    L63_450 = "VPNPolicyName"
    if L61_448 == "1" then
      L62_449 = db
      L62_449 = L62_449.getColNames
      L63_450 = "IpsecVPNPolicy"
      L62_449 = L62_449(L63_450)
      L63_450 = false
      for L67_454, L68_455 in L64_451(L65_452) do
        if L68_455 == "BackupPolicyName" and L50_437["IpsecVPNPolicy" .. "." .. L68_455] ~= nil and L50_437["IpsecVPNPolicy" .. "." .. L68_455] ~= L60_447["IpsecVPNPolicy" .. "." .. L68_455] or L68_455 == "FailbackTime" and L50_437["IpsecVPNPolicy" .. "." .. L68_455] ~= nil and L50_437["IpsecVPNPolicy" .. "." .. L68_455] ~= L60_447["IpsecVPNPolicy" .. "." .. L68_455] or L68_455 ~= "RVGStatus" and L68_455 ~= "BackupPolicyName" and L68_455 ~= "FailbackTime" and L50_437["IpsecVPNPolicy" .. "." .. L68_455] ~= nil and L50_437["IpsecVPNPolicy" .. "." .. L68_455] ~= L60_447["IpsecVPNPolicy" .. "." .. L68_455] then
          L63_450 = true
          break
        end
      end
      if L63_450 then
      end
    end
  end
  L62_449 = L50_437
  L63_450 = A0_387
  L62_449 = db
  L62_449 = L62_449.getRow
  L63_450 = "IpsecVPNPolicy"
  L62_449 = L62_449(L63_450, L64_451, L65_452)
  L63_450 = L62_449["IpsecVPNPolicy.RVGStatus"]
  if L63_450 == "1" then
    L63_450 = L50_437["IpsecVPNPolicy.RVGStatus"]
    if L63_450 ~= nil then
      L63_450 = L50_437["IpsecVPNPolicy.RVGStatus"]
      if L63_450 ~= "0" then
        L63_450 = L50_437["IpsecVPNPolicy.RVGStatus"]
        if L63_450 == "1" then
          L63_450 = L50_437["IpsecVPNPolicy.BackupPolicyName"]
        end
      end
    elseif L63_450 ~= L64_451 then
      L63_450 = db
      L63_450 = L63_450.getRow
      L63_450 = L63_450(L64_451, L65_452, L66_453)
      if L63_450 ~= nil then
        if L65_452 == L66_453 then
          if L66_453 ~= nil then
          elseif L66_453 == "0" then
            if L66_453 == nil then
            elseif L66_453 ~= "" then
              L50_437["IpsecVPNPolicy.BackupPolicyName"] = ""
            end
          end
        else
          return L65_452
        end
      end
    end
  end
  if A45_432 == "1" then
    L63_450 = rvgConfigCheckPrimary
    L63_450 = L63_450(L64_451)
    if L63_450 ~= L64_451 then
      return L63_450
    end
  end
  L63_450 = L50_437["IpsecVPNPolicy.PolicyType"]
  if L63_450 == "1" then
    L63_450 = L50_437["IpsecVPNPolicy.RVGStatus"]
    if L63_450 == "1" then
      L63_450 = L50_437["IpsecVPNPolicy.BackupPolicyName"]
      if L63_450 ~= nil then
        L63_450 = db
        L63_450 = L63_450.getAttribute
        L63_450 = L63_450(L64_451, L65_452, L66_453, L67_454)
        if L63_450 then
          if L64_451 ~= L65_452 then
            return L64_451
          end
        end
        if L64_451 ~= nil then
          if L66_453 ~= L67_454 then
            return L66_453
          end
        else
          return L66_453
        end
      end
    end
  end
  L63_450 = nil
  if A47_434 ~= "-10" then
    if L65_452 ~= nil then
      for _FORV_69_, _FORV_70_ in L66_453(L67_454) do
        row = L65_452[_FORV_69_]
        row[serviceRouteTable .. "." .. _UPVALUE3_.sourceIPAddress] = getSourceIPAddressForPolicy(val_localNetworkType, A21_408)
        L63_450 = db.update(serviceRouteTable, row, row[serviceRouteTable .. "." .. _UPVALUE2_])
        if L63_450 == nil then
          return _UPVALUE0_.FAILURE
        end
      end
    end
    L63_450 = L66_453
    if L63_450 == L66_453 then
      return L66_453, L67_454
    end
  else
  end
  if A47_434 == "-10" then
    return L64_451
  else
    return L65_452, L66_453
  end
end
function vpnPolicyCreate(A0_456, A1_457, A2_458, A3_459, A4_460, A5_461, A6_462, A7_463, A8_464, A9_465, A10_466, A11_467, A12_468, A13_469, A14_470, A15_471, A16_472, A17_473, A18_474, A19_475, A20_476, A21_477, A22_478, A23_479, A24_480, A25_481, A26_482, A27_483, A28_484, A29_485, A30_486, A31_487, A32_488, A33_489, A34_490, A35_491, A36_492, A37_493, A38_494, A39_495, A40_496, A41_497, A42_498, A43_499, A44_500, A45_501)
  local L46_502, L47_503, L48_504, L49_505, L50_506, L51_507, L52_508, L53_509, L54_510, L55_511, L56_512, L57_513, L58_514, L59_515, L60_516, L61_517, L62_518
  L46_502 = db
  L46_502 = L46_502.existsRow
  L47_503 = _UPVALUE0_
  L48_504 = _UPVALUE1_
  L48_504 = L48_504.policyName
  L49_505 = A0_456
  L46_502 = L46_502(L47_503, L48_504, L49_505)
  L47_503 = _UPVALUE2_
  L47_503 = L47_503.FALSE
  if L46_502 ~= L47_503 then
    L46_502 = _UPVALUE3_
    L46_502 = L46_502.VPN_POLICY_EXIST
    return L46_502
  end
  L46_502 = db
  L46_502 = L46_502.getTable
  L47_503 = _UPVALUE0_
  L46_502 = L46_502(L47_503)
  L47_503 = #L46_502
  L48_504 = _UPVALUE4_
  if L47_503 >= L48_504 then
    L47_503 = _UPVALUE3_
    L47_503 = L47_503.MAX_VPN_LIMIT_REACHED
    return L47_503
  end
  L47_503 = nil
  L48_504 = {}
  L49_505 = _UPVALUE2_
  L49_505 = L49_505.NIL
  if A0_456 == L49_505 then
    L49_505 = _UPVALUE2_
    L49_505 = L49_505.INVALID_ARGUMENT
    return L49_505
  end
  L49_505 = db
  L49_505 = L49_505.getAttribute
  L50_506 = "l2tpVPNClient"
  L51_507 = "_ROWID_"
  L52_508 = 1
  L53_509 = "l2tpClientEnable"
  L49_505 = L49_505(L50_506, L51_507, L52_508, L53_509)
  if A42_498 == 2 and A2_458 == 0 and L49_505 == "1" then
    L50_506 = db
    L50_506 = L50_506.setAttribute
    L51_507 = "l2tpClientConnectionStatus"
    L52_508 = _UPVALUE5_
    L53_509 = "1"
    L54_510 = "action"
    L55_511 = 0
    L50_506(L51_507, L52_508, L53_509, L54_510, L55_511)
  end
  L50_506 = _UPVALUE0_
  L51_507 = "."
  L52_508 = _UPVALUE1_
  L52_508 = L52_508.policyName
  L50_506 = L50_506 .. L51_507 .. L52_508
  L48_504[L50_506] = A0_456
  L50_506 = _UPVALUE2_
  L50_506 = L50_506.NIL
  if A1_457 == L50_506 then
    L50_506 = _UPVALUE2_
    L50_506 = L50_506.INVALID_ARGUMENT
    return L50_506
  end
  L50_506 = tonumber
  L51_507 = A1_457
  L50_506 = L50_506(L51_507)
  L51_507 = _UPVALUE6_
  if L50_506 ~= L51_507 then
    L51_507 = _UPVALUE7_
    if L50_506 ~= L51_507 then
      L51_507 = _UPVALUE2_
      L51_507 = L51_507.INVALID_ARGUMENT
      return L51_507
    end
  end
  L51_507 = _UPVALUE0_
  L52_508 = "."
  L53_509 = _UPVALUE1_
  L53_509 = L53_509.protocol
  L51_507 = L51_507 .. L52_508 .. L53_509
  L48_504[L51_507] = A1_457
  L51_507 = _UPVALUE2_
  L51_507 = L51_507.NIL
  if A2_458 == L51_507 then
    if A4_460 == nil then
      L51_507 = _UPVALUE2_
      L51_507 = L51_507.INVALID_ARGUMENT
      return L51_507
    end
    A2_458 = _UPVALUE8_
    L51_507 = tonumber
    L52_508 = A4_460
    L51_507 = L51_507(L52_508)
    L52_508 = _UPVALUE9_
    if L51_507 ~= L52_508 then
      if A42_498 == nil then
        L51_507 = _UPVALUE2_
        L51_507 = L51_507.INVALID_ARGUMENT
        return L51_507
      end
      L51_507 = tonumber
      L52_508 = A42_498
      L51_507 = L51_507(L52_508)
      if L51_507 ~= 0 then
        A2_458 = _UPVALUE10_
      end
    end
  end
  L51_507 = tonumber
  L52_508 = A2_458
  L51_507 = L51_507(L52_508)
  L52_508 = _UPVALUE8_
  if L51_507 ~= L52_508 then
    L52_508 = _UPVALUE10_
    if L51_507 ~= L52_508 then
      L52_508 = _UPVALUE2_
      L52_508 = L52_508.INVALID_ARGUMENT
      return L52_508
    end
  end
  L52_508 = _UPVALUE0_
  L53_509 = "."
  L54_510 = _UPVALUE1_
  L54_510 = L54_510.ipsecMode
  L52_508 = L52_508 .. L53_509 .. L54_510
  L48_504[L52_508] = A2_458
  L52_508 = _UPVALUE8_
  if L51_507 == L52_508 then
    L52_508 = _UPVALUE2_
    L52_508 = L52_508.NIL
    if A3_459 == L52_508 then
      L52_508 = _UPVALUE2_
      L52_508 = L52_508.INVALID_ARGUMENT
      return L52_508
    end
    L52_508 = _UPVALUE11_
    L52_508 = L52_508.isBoolean
    L53_509 = A3_459
    L52_508 = L52_508(L53_509)
    L47_503 = L52_508
    L52_508 = _UPVALUE2_
    L52_508 = L52_508.SUCCESS
    if L47_503 ~= L52_508 then
      L52_508 = _UPVALUE2_
      L52_508 = L52_508.INVALID_ARGUMENT
      return L52_508
    end
    L52_508 = _UPVALUE0_
    L53_509 = "."
    L54_510 = _UPVALUE1_
    L54_510 = L54_510.dhcpOverIpsec
    L52_508 = L52_508 .. L53_509 .. L54_510
    L48_504[L52_508] = A3_459
  end
  L52_508 = _UPVALUE2_
  L52_508 = L52_508.NIL
  if A4_460 == L52_508 then
    L52_508 = _UPVALUE2_
    L52_508 = L52_508.INVALID_ARGUMENT
    return L52_508
  end
  L52_508 = tonumber
  L53_509 = A4_460
  L52_508 = L52_508(L53_509)
  L53_509 = _UPVALUE9_
  if L52_508 ~= L53_509 then
    L53_509 = _UPVALUE12_
    if L52_508 ~= L53_509 then
      L53_509 = _UPVALUE2_
      L53_509 = L53_509.INVALID_ARGUMENT
      return L53_509
    end
  end
  L53_509 = _UPVALUE0_
  L54_510 = "."
  L55_511 = _UPVALUE1_
  L55_511 = L55_511.policyType
  L53_509 = L53_509 .. L54_510 .. L55_511
  L48_504[L53_509] = A4_460
  L53_509 = _UPVALUE2_
  L53_509 = L53_509.NIL
  if A42_498 ~= L53_509 then
    L53_509 = _UPVALUE0_
    L54_510 = "."
    L55_511 = _UPVALUE1_
    L55_511 = L55_511.l2tpIpsecPolicy
    L53_509 = L53_509 .. L54_510 .. L55_511
    L48_504[L53_509] = A42_498
  end
  L53_509 = _UPVALUE2_
  L53_509 = L53_509.NIL
  if A5_461 == L53_509 then
    L53_509 = _UPVALUE2_
    L53_509 = L53_509.INVALID_ARGUMENT
    return L53_509
  end
  L53_509 = tonumber
  L54_510 = A5_461
  L53_509 = L53_509(L54_510)
  L54_510 = _UPVALUE13_
  if L53_509 ~= L54_510 then
    L54_510 = _UPVALUE14_
    if L53_509 ~= L54_510 then
      L54_510 = _UPVALUE15_
      if L53_509 ~= L54_510 then
        L54_510 = _UPVALUE2_
        L54_510 = L54_510.INVALID_ARGUMENT
        return L54_510
      end
    end
  end
  L54_510 = _UPVALUE0_
  L55_511 = "."
  L56_512 = _UPVALUE1_
  L56_512 = L56_512.localGateway
  L54_510 = L54_510 .. L55_511 .. L56_512
  L48_504[L54_510] = A5_461
  L54_510 = nil
  L55_511 = _UPVALUE12_
  if L52_508 == L55_511 then
    L55_511 = _UPVALUE2_
    L55_511 = L55_511.NIL
    if A6_462 == L55_511 then
      L55_511 = _UPVALUE2_
      L55_511 = L55_511.INVALID_ARGUMENT
      return L55_511
    end
    L55_511 = tonumber
    L56_512 = A6_462
    L55_511 = L55_511(L56_512)
    L54_510 = L55_511
    L55_511 = _UPVALUE16_
    if L54_510 ~= L55_511 then
      L55_511 = _UPVALUE17_
      if L54_510 ~= L55_511 then
        L55_511 = _UPVALUE2_
        L55_511 = L55_511.INVALID_ARGUMENT
        return L55_511
      end
    end
  else
    L55_511 = tostring
    L56_512 = _UPVALUE16_
    L55_511 = L55_511(L56_512)
    A6_462 = L55_511
    L54_510 = _UPVALUE16_
  end
  L55_511 = _UPVALUE0_
  L56_512 = "."
  L55_511 = L55_511 .. L56_512 .. L57_513
  L48_504[L55_511] = A6_462
  L55_511 = _UPVALUE2_
  L55_511 = L55_511.NIL
  if A7_463 == L55_511 then
    L55_511 = _UPVALUE2_
    L55_511 = L55_511.INVALID_ARGUMENT
    return L55_511
  end
  L55_511 = _UPVALUE16_
  if L54_510 == L55_511 then
    if A45_501 == "10" then
      L55_511 = _UPVALUE11_
      L55_511 = L55_511.ipAddressCheck
      L56_512 = "10"
      L55_511 = L55_511(L56_512, L57_513)
      L47_503 = L55_511
    else
      L55_511 = _UPVALUE11_
      L55_511 = L55_511.ipAddressCheck
      L56_512 = "2"
      L55_511 = L55_511(L56_512, L57_513)
      L47_503 = L55_511
    end
    L55_511 = _UPVALUE2_
    L55_511 = L55_511.SUCCESS
    if L47_503 ~= L55_511 then
      L55_511 = _UPVALUE3_
      L55_511 = L55_511.VIPSECURE_REMOTEENDPOINTIP_INVALID
      return L55_511
    end
    L55_511 = optionIpCheck
    L56_512 = A7_463
    L55_511 = L55_511(L56_512, L57_513)
    L56_512 = _UPVALUE2_
    L56_512 = L56_512.SUCCESS
    if L55_511 ~= L56_512 then
      return L55_511
    end
    L56_512 = _UPVALUE0_
    L56_512 = L56_512 .. L57_513 .. L58_514
    L48_504[L56_512] = A7_463
  end
  L55_511 = _UPVALUE17_
  if L54_510 == L55_511 then
    if A7_463 == "0.0.0.0" then
      L55_511 = db
      L55_511 = L55_511.getRowWhere
      L56_512 = _UPVALUE0_
      L55_511 = L55_511(L56_512, L57_513)
      L55_511 = L55_511 or ""
      if L55_511 ~= nil and L55_511 ~= "" then
        L56_512 = _UPVALUE3_
        L56_512 = L56_512.VIPSECURE_DUPL_ANONYMOUS_POLICY
        return L56_512
      end
    end
    L55_511 = _UPVALUE11_
    L55_511 = L55_511.fqdnCheck
    L56_512 = A7_463
    L55_511 = L55_511(L56_512)
    L47_503 = L55_511
    L55_511 = _UPVALUE2_
    L55_511 = L55_511.SUCCESS
    if L47_503 ~= L55_511 then
      L55_511 = _UPVALUE3_
      L55_511 = L55_511.VIPSECURE_REMOTEENDPOINTFQDN_INVALID
      return L55_511
    end
    L55_511 = _UPVALUE0_
    L56_512 = "."
    L55_511 = L55_511 .. L56_512 .. L57_513
    L48_504[L55_511] = A7_463
  end
  L55_511 = _UPVALUE8_
  if L51_507 == L55_511 then
    L55_511 = _UPVALUE2_
    L55_511 = L55_511.NIL
    if A8_464 == L55_511 then
      L55_511 = _UPVALUE2_
      L55_511 = L55_511.INVALID_ARGUMENT
      return L55_511
    end
    L55_511 = _UPVALUE11_
    L55_511 = L55_511.isBoolean
    L56_512 = A8_464
    L55_511 = L55_511(L56_512)
    L47_503 = L55_511
    L55_511 = _UPVALUE2_
    L55_511 = L55_511.SUCCESS
    if L47_503 ~= L55_511 then
      L55_511 = _UPVALUE2_
      L55_511 = L55_511.INVALID_ARGUMENT
      return L55_511
    end
    L55_511 = _UPVALUE0_
    L56_512 = "."
    L55_511 = L55_511 .. L56_512 .. L57_513
    L48_504[L55_511] = A8_464
  end
  L55_511 = _UPVALUE2_
  L55_511 = L55_511.NIL
  if A9_465 == L55_511 then
    L55_511 = _UPVALUE2_
    L55_511 = L55_511.INVALID_ARGUMENT
    return L55_511
  end
  L55_511 = _UPVALUE11_
  L55_511 = L55_511.isBoolean
  L56_512 = A9_465
  L55_511 = L55_511(L56_512)
  L47_503 = L55_511
  L55_511 = _UPVALUE2_
  L55_511 = L55_511.SUCCESS
  if L47_503 ~= L55_511 then
    L55_511 = _UPVALUE2_
    L55_511 = L55_511.INVALID_ARGUMENT
    return L55_511
  end
  L55_511 = _UPVALUE0_
  L56_512 = "."
  L55_511 = L55_511 .. L56_512 .. L57_513
  L48_504[L55_511] = A9_465
  L55_511 = _UPVALUE2_
  L55_511 = L55_511.NIL
  if A10_466 ~= L55_511 then
    L55_511 = _UPVALUE0_
    L56_512 = "."
    L55_511 = L55_511 .. L56_512 .. L57_513
    L48_504[L55_511] = A10_466
  end
  L55_511 = _UPVALUE12_
  if L52_508 == L55_511 then
    L55_511 = _UPVALUE2_
    L55_511 = L55_511.NIL
    if A11_467 == L55_511 then
      L55_511 = _UPVALUE2_
      L55_511 = L55_511.INVALID_ARGUMENT
      return L55_511
    end
    L55_511 = _UPVALUE11_
    L55_511 = L55_511.isBoolean
    L56_512 = A11_467
    L55_511 = L55_511(L56_512)
    L47_503 = L55_511
    L55_511 = _UPVALUE2_
    L55_511 = L55_511.SUCCESS
    if L47_503 ~= L55_511 then
      L55_511 = _UPVALUE2_
      L55_511 = L55_511.INVALID_ARGUMENT
      return L55_511
    end
    L55_511 = _UPVALUE0_
    L56_512 = "."
    L55_511 = L55_511 .. L56_512 .. L57_513
    L48_504[L55_511] = A11_467
    L55_511 = _UPVALUE18_
    if A11_467 == L55_511 then
      L55_511 = _UPVALUE2_
      L55_511 = L55_511.NIL
      if A12_468 == L55_511 then
        L55_511 = _UPVALUE2_
        L55_511 = L55_511.INVALID_ARGUMENT
        return L55_511
      end
      if A45_501 == "10" then
        L55_511 = _UPVALUE11_
        L55_511 = L55_511.ipAddressCheck
        L56_512 = "10"
        L55_511 = L55_511(L56_512, L57_513)
        L47_503 = L55_511
      else
        L55_511 = _UPVALUE11_
        L55_511 = L55_511.ipAddressCheck
        L56_512 = "2"
        L55_511 = L55_511(L56_512, L57_513)
        L47_503 = L55_511
      end
      L55_511 = _UPVALUE2_
      L55_511 = L55_511.SUCCESS
      if L47_503 ~= L55_511 then
        L55_511 = _UPVALUE3_
        L55_511 = L55_511.VIPSECURE_KEEPALIVE_SOURCEADDRESS_INVALID
        return L55_511
      end
      L55_511 = _UPVALUE0_
      L56_512 = "."
      L55_511 = L55_511 .. L56_512 .. L57_513
      L48_504[L55_511] = A12_468
      L55_511 = _UPVALUE2_
      L55_511 = L55_511.NIL
      if A13_469 == L55_511 then
        L55_511 = _UPVALUE2_
        L55_511 = L55_511.INVALID_ARGUMENT
        return L55_511
      end
      if A45_501 == "10" then
        L55_511 = _UPVALUE11_
        L55_511 = L55_511.ipAddressCheck
        L56_512 = "10"
        L55_511 = L55_511(L56_512, L57_513)
        L47_503 = L55_511
      else
        L55_511 = _UPVALUE11_
        L55_511 = L55_511.ipAddressCheck
        L56_512 = "2"
        L55_511 = L55_511(L56_512, L57_513)
        L47_503 = L55_511
      end
      L55_511 = _UPVALUE2_
      L55_511 = L55_511.SUCCESS
      if L47_503 ~= L55_511 then
        L55_511 = _UPVALUE3_
        L55_511 = L55_511.VIPSECURE_KEEPALIVE_REMOTEPINGIP_INVALID
        return L55_511
      end
      L55_511 = _UPVALUE0_
      L56_512 = "."
      L55_511 = L55_511 .. L56_512 .. L57_513
      L48_504[L55_511] = A13_469
      L55_511 = _UPVALUE2_
      L55_511 = L55_511.NIL
      if A14_470 == L55_511 then
        L55_511 = _UPVALUE2_
        L55_511 = L55_511.INVALID_ARGUMENT
        return L55_511
      end
      L55_511 = _UPVALUE0_
      L56_512 = "."
      L55_511 = L55_511 .. L56_512 .. L57_513
      L48_504[L55_511] = A14_470
      L55_511 = _UPVALUE2_
      L55_511 = L55_511.NIL
      if A15_471 == L55_511 then
        L55_511 = _UPVALUE2_
        L55_511 = L55_511.INVALID_ARGUMENT
        return L55_511
      end
      L55_511 = _UPVALUE0_
      L56_512 = "."
      L55_511 = L55_511 .. L56_512 .. L57_513
      L48_504[L55_511] = A15_471
    end
  end
  L55_511 = _UPVALUE2_
  L55_511 = L55_511.NIL
  if A16_472 == L55_511 then
    L55_511 = _UPVALUE2_
    L55_511 = L55_511.INVALID_ARGUMENT
    return L55_511
  end
  L55_511 = tonumber
  L56_512 = A16_472
  L55_511 = L55_511(L56_512)
  L56_512 = _UPVALUE2_
  L56_512 = L56_512.NIL
  if L55_511 == L56_512 then
    L56_512 = _UPVALUE2_
    L56_512 = L56_512.INVALID_ARGUMENT
    return L56_512
  end
  if L55_511 == 0 then
    L56_512 = _UPVALUE3_
    L56_512 = L56_512.ATLEAST_ONE_ENCRYPTION
    return L56_512
  end
  L56_512 = _UPVALUE0_
  L56_512 = L56_512 .. L57_513 .. L58_514
  L48_504[L56_512] = A16_472
  L56_512 = _UPVALUE2_
  L56_512 = L56_512.NIL
  if A17_473 ~= L56_512 then
    L56_512 = util
    L56_512 = L56_512.split
    L56_512 = L56_512(L57_513, L58_514)
    if L59_515 == 2 then
    else
    end
    L60_516 = L57_513
    if L59_515 ~= 0 then
      return L59_515
    end
    if L58_514 ~= L59_515 then
      L60_516 = L58_514
      if L59_515 ~= 0 then
        return L59_515
      end
    end
    L60_516 = "."
    L61_517 = _UPVALUE1_
    L61_517 = L61_517.encryptionAlgoKeyLength
    L48_504[L59_515] = A17_473
  end
  L56_512 = _UPVALUE2_
  L56_512 = L56_512.NIL
  if A18_474 == L56_512 then
    L56_512 = _UPVALUE2_
    L56_512 = L56_512.INVALID_ARGUMENT
    return L56_512
  end
  L56_512 = tonumber
  L56_512 = L56_512(L57_513)
  A18_474 = L56_512
  L56_512 = _UPVALUE2_
  L56_512 = L56_512.NIL
  if A18_474 == L56_512 then
    L56_512 = _UPVALUE2_
    L56_512 = L56_512.INVALID_ARGUMENT
    return L56_512
  end
  if A18_474 == 0 then
    L56_512 = _UPVALUE3_
    L56_512 = L56_512.ATLEAST_ONE_AUTH
    return L56_512
  end
  L56_512 = _UPVALUE0_
  L56_512 = L56_512 .. L57_513 .. L58_514
  L48_504[L56_512] = A18_474
  L56_512 = _UPVALUE8_
  if L51_507 == L56_512 then
    L56_512 = _UPVALUE19_
    if A3_459 == L56_512 then
      L56_512 = _UPVALUE2_
      L56_512 = L56_512.NIL
      if A19_475 == L56_512 then
        L56_512 = _UPVALUE2_
        L56_512 = L56_512.INVALID_ARGUMENT
        return L56_512
      end
      L56_512 = tonumber
      L56_512 = L56_512(L57_513)
      if L56_512 ~= L57_513 then
        if L56_512 ~= L57_513 then
          if L56_512 ~= L57_513 then
            if L56_512 ~= L57_513 then
              return L57_513
            end
          end
        end
      end
      L48_504[L57_513] = A19_475
      if L56_512 ~= L57_513 then
        if A20_476 == L57_513 then
          return L57_513
        end
        if A45_501 == "10" then
          L47_503 = L57_513
        else
          L47_503 = L57_513
        end
        if L47_503 ~= L57_513 then
          return L57_513
        end
        L48_504[L57_513] = A20_476
      end
      if L56_512 == L57_513 then
        if A21_477 == L57_513 then
          return L57_513
        end
        if A45_501 == "10" then
          L47_503 = L57_513
        else
          L47_503 = L57_513
        end
        if L47_503 ~= L57_513 then
          return L57_513
        end
        if A45_501 == "10" then
          L60_516 = validRange
          L61_517 = A20_476
          L60_516 = L60_516(L61_517, L62_518)
        else
          L60_516 = _UPVALUE11_
          L60_516 = L60_516.ipv4SingleMaskCheck
          L61_517 = A20_476
          L60_516 = L60_516(L61_517, L62_518, L57_513)
        end
        L60_516 = _UPVALUE2_
        L60_516 = L60_516.SUCCESS
        if L59_515 ~= L60_516 then
          L60_516 = _UPVALUE3_
          L60_516 = L60_516.LOCAL_IP_RANGE_NOTIN_SAME_SUBNET
          return L60_516
        end
        L60_516 = _UPVALUE0_
        L61_517 = "."
        L60_516 = L60_516 .. L61_517 .. L62_518
        L48_504[L60_516] = A21_477
      end
      if L56_512 == L57_513 then
        if A45_501 == "2" then
          if A22_478 == L57_513 then
            return L57_513
          end
          L47_503 = L57_513
          if L47_503 ~= L57_513 then
            return L57_513
          end
          L48_504[L57_513] = A22_478
        end
        if A45_501 == "10" then
          if A23_479 == L57_513 then
            return L57_513
          end
          L48_504[L57_513] = A23_479
        end
      end
      if A24_480 == L57_513 then
        return L57_513
      end
      if L57_513 ~= L58_514 then
        if L57_513 ~= L58_514 then
          if L57_513 ~= L58_514 then
            if L57_513 ~= L58_514 then
              return L58_514
            end
          end
        end
      end
      L60_516 = _UPVALUE1_
      L60_516 = L60_516.remoteNetworkType
      L48_504[L58_514] = A24_480
      if L57_513 ~= L58_514 then
        if A25_481 == L58_514 then
          return L58_514
        end
        if A45_501 == "10" then
          L60_516 = A25_481
          L47_503 = L58_514
          if L47_503 ~= L58_514 then
            return L58_514
          end
          L60_516 = _UPVALUE1_
          L60_516 = L60_516.remoteStartAddress
          L48_504[L58_514] = A25_481
        else
          L60_516 = A25_481
          L47_503 = L58_514
          if L47_503 ~= L58_514 then
            return L58_514
          end
          L60_516 = _UPVALUE1_
          L60_516 = L60_516.remoteStartAddress
          L48_504[L58_514] = A25_481
        end
      end
      if L57_513 == L58_514 then
        if A26_482 == L58_514 then
          return L58_514
        end
        if A45_501 == "10" then
          L60_516 = A26_482
          L47_503 = L58_514
          if L47_503 ~= L58_514 then
            return L58_514
          end
        else
          L60_516 = A26_482
          L47_503 = L58_514
          if L47_503 ~= L58_514 then
            return L58_514
          end
        end
        L60_516 = nil
        if A45_501 == "10" then
          L61_517 = validRange
          L61_517 = L61_517(L62_518, A26_482)
          L60_516 = L61_517
        else
          L61_517 = _UPVALUE11_
          L61_517 = L61_517.ipv4SingleMaskCheck
          L61_517 = L61_517(L62_518, A26_482, L58_514)
          L60_516 = L61_517
        end
        L61_517 = _UPVALUE2_
        L61_517 = L61_517.SUCCESS
        if L60_516 ~= L61_517 then
          L61_517 = _UPVALUE3_
          L61_517 = L61_517.REMOTE_IP_RANGE_NOTIN_SAME_SUBNET
          return L61_517
        end
        L61_517 = _UPVALUE0_
        L61_517 = L61_517 .. L62_518 .. _UPVALUE1_.remoteEndAddress
        L48_504[L61_517] = A26_482
      end
      if L57_513 == L58_514 then
        if A45_501 == "2" then
          if A27_483 == L58_514 then
            return L58_514
          end
          L60_516 = A27_483
          L47_503 = L58_514
          if L47_503 ~= L58_514 then
            return L58_514
          end
          L60_516 = _UPVALUE1_
          L60_516 = L60_516.remoteSubnetmask
          L48_504[L58_514] = A27_483
        else
          if A28_484 == L58_514 then
            return L58_514
          end
          L60_516 = _UPVALUE1_
          L60_516 = L60_516.remotePrefixLength
          L48_504[L58_514] = A28_484
        end
      end
    end
    L56_512 = _UPVALUE18_
    if A3_459 == L56_512 then
      A19_475 = "0"
      A24_480 = "0"
      L56_512 = _UPVALUE0_
      L56_512 = L56_512 .. L57_513 .. L58_514
      L48_504[L56_512] = A19_475
      L56_512 = _UPVALUE0_
      L56_512 = L56_512 .. L57_513 .. L58_514
      L48_504[L56_512] = A24_480
    end
  else
    A19_475 = "0"
    A24_480 = "0"
    L56_512 = _UPVALUE0_
    L56_512 = L56_512 .. L57_513 .. L58_514
    L48_504[L56_512] = A19_475
    L56_512 = _UPVALUE0_
    L56_512 = L56_512 .. L57_513 .. L58_514
    L48_504[L56_512] = A24_480
  end
  L56_512 = _UPVALUE9_
  if L52_508 == L56_512 then
    L56_512 = _UPVALUE2_
    L56_512 = L56_512.NIL
    if A29_485 == L56_512 then
      L56_512 = _UPVALUE2_
      L56_512 = L56_512.INVALID_ARGUMENT
      return L56_512
    end
    L56_512 = _UPVALUE0_
    L56_512 = L56_512 .. L57_513 .. L58_514
    L48_504[L56_512] = A29_485
    L56_512 = db
    L56_512 = L56_512.getRowsWhere
    L60_516 = _UPVALUE9_
    L56_512 = L56_512(L57_513, L58_514)
    for L60_516, L61_517 in L57_513(L58_514) do
      if A29_485 == L62_518 then
        return L62_518
      end
    end
    if A30_486 == L57_513 then
      return L57_513
    end
    L48_504[L57_513] = A30_486
    if L55_511 ~= 1 then
      if A31_487 == L57_513 then
        return L57_513
      end
      if L57_513 == L58_514 then
        return L58_514
      end
      L60_516 = L55_511
      L61_517 = A17_473
      if L58_514 ~= L59_515 then
        return L58_514
      end
      L60_516 = "."
      L61_517 = _UPVALUE1_
      L61_517 = L61_517.encryptionKeyIn
      L48_504[L59_515] = A31_487
      if A32_488 == L59_515 then
        return L59_515
      end
      L60_516 = A32_488
      L60_516 = _UPVALUE2_
      L60_516 = L60_516.EMPTY
      if L59_515 == L60_516 then
        L60_516 = _UPVALUE2_
        L60_516 = L60_516.INVALID_ARGUMENT
        return L60_516
      end
      L60_516 = encryptionKeyValidate
      L61_517 = L59_515
      L60_516 = L60_516(L61_517, L62_518, A17_473)
      L61_517 = _UPVALUE2_
      L61_517 = L61_517.SUCCESS
      if L60_516 ~= L61_517 then
        return L60_516
      end
      L61_517 = _UPVALUE0_
      L61_517 = L61_517 .. L62_518 .. _UPVALUE1_.encryptionKeyOut
      L48_504[L61_517] = A32_488
    end
    if A33_489 == L57_513 then
      return L57_513
    end
    if L57_513 == L58_514 then
      return L58_514
    end
    L60_516 = A18_474
    if L58_514 ~= L59_515 then
      return L58_514
    end
    L60_516 = "."
    L61_517 = _UPVALUE1_
    L61_517 = L61_517.authKeyIn
    L48_504[L59_515] = A33_489
    if A34_490 == L59_515 then
      return L59_515
    end
    L60_516 = A34_490
    L60_516 = _UPVALUE2_
    L60_516 = L60_516.EMPTY
    if L59_515 == L60_516 then
      L60_516 = _UPVALUE2_
      L60_516 = L60_516.INVALID_ARGUMENT
      return L60_516
    end
    L60_516 = authKeyValidate
    L61_517 = L59_515
    L60_516 = L60_516(L61_517, L62_518)
    L61_517 = _UPVALUE2_
    L61_517 = L61_517.SUCCESS
    if L60_516 ~= L61_517 then
      return L60_516
    end
    L61_517 = _UPVALUE0_
    L61_517 = L61_517 .. L62_518 .. _UPVALUE1_.authKeyOut
    L48_504[L61_517] = A34_490
  end
  L56_512 = _UPVALUE2_
  L56_512 = L56_512.NIL
  if A35_491 == L56_512 then
    L56_512 = _UPVALUE2_
    L56_512 = L56_512.INVALID_ARGUMENT
    return L56_512
  end
  L56_512 = tonumber
  L56_512 = L56_512(L57_513)
  if L56_512 ~= L57_513 then
    if L56_512 ~= L57_513 then
      if L56_512 ~= L57_513 then
        return L57_513
      end
    end
  end
  L48_504[L57_513] = A35_491
  if L52_508 == L57_513 then
    if A37_493 == L57_513 then
      return L57_513
    end
    if L57_513 ~= 0 and L57_513 ~= 1 then
      return L58_514
    end
    L60_516 = _UPVALUE1_
    L60_516 = L60_516.saLifeTimeType
    L48_504[L58_514] = A37_493
    if A36_492 == L58_514 then
      return L58_514
    end
    if L57_513 == 0 then
      if not (L58_514 < L59_515) then
      elseif L58_514 > L59_515 then
        return L58_514
      end
    end
    L60_516 = _UPVALUE1_
    L60_516 = L60_516.saLifeTime
    L48_504[L58_514] = A36_492
    if A38_494 == L58_514 then
      return L58_514
    end
    if L58_514 ~= L59_515 then
      if L58_514 ~= L59_515 then
        if L58_514 ~= L59_515 then
          if L58_514 ~= L59_515 then
            if L58_514 ~= L59_515 then
              if L58_514 ~= L59_515 then
                if L58_514 ~= L59_515 then
                  if L58_514 ~= L59_515 then
                    if L58_514 ~= L59_515 then
                      return L59_515
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    L60_516 = "."
    L61_517 = _UPVALUE1_
    L61_517 = L61_517.pfsKeyGroup
    L48_504[L59_515] = A38_494
  end
  if A44_500 == "1" then
    if A39_495 == L57_513 then
      return L57_513
    end
    if A39_495 ~= L57_513 then
      L48_504[L57_513] = A39_495
    end
    if A40_496 ~= L57_513 then
      L48_504[L57_513] = A40_496
    end
  else
    A44_500 = "0"
    A39_495 = ""
    A40_496 = "30"
    L48_504[L57_513] = A39_495
    L48_504[L57_513] = A40_496
  end
  L48_504[L57_513] = A44_500
  if A41_497 ~= L57_513 then
    L48_504[L57_513] = A41_497
  end
  if A4_460 == "1" then
    L48_504[L57_513] = A0_456
  end
  if A43_499 == L57_513 then
    return L57_513
  end
  L47_503 = L57_513
  if L47_503 ~= L57_513 then
    return L57_513
  end
  L48_504[L57_513] = A43_499
  if A35_491 == "0" and A43_499 == "1" then
    return L57_513
  end
  if (A35_491 == "1" or A35_491 == "2") and A11_467 == "1" then
    return L57_513
  end
  if L57_513 ~= L58_514 then
    if L57_513 ~= L58_514 then
      return L58_514
    end
  end
  L60_516 = _UPVALUE1_
  L60_516 = L60_516.addressFamily
  L48_504[L58_514] = A45_501
  if A4_460 == "2" then
    L60_516 = _UPVALUE1_
    L60_516 = L60_516.ikePolicyName
    L48_504[L58_514] = ""
  end
  if A2_458 ~= 1 and A3_459 ~= "1" or A2_458 ~= 0 then
    L60_516 = 1
    if L58_514 ~= L59_515 then
      if L59_515 ~= 0 then
        L60_516 = A39_495
        L61_517 = L58_514
        L60_516 = tonumber
        L61_517 = A44_500
        L60_516 = L60_516(L61_517)
        if L60_516 == 1 then
          L60_516 = tonumber
          L61_517 = L59_515
          L60_516 = L60_516(L61_517)
          if L60_516 == 1 then
          end
        else
          L60_516 = _UPVALUE0_
          L61_517 = "."
          L60_516 = L60_516 .. L61_517 .. L62_518
          L48_504[L60_516] = "0"
          L60_516 = _UPVALUE0_
          L61_517 = "."
          L60_516 = L60_516 .. L61_517 .. L62_518
          L60_516 = L48_504[L60_516]
          L61_517 = db
          L61_517 = L61_517.getRowsWhere
          L61_517 = L61_517(L62_518, _UPVALUE1_.ikePolicyName .. " = '" .. L60_516 .. "'")
          if L62_518 == 1 then
          else
            if L62_518 == "-1" then
          end
          elseif L62_518 > 1 then
            if L62_518[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteEndPointType] == A6_462 and L62_518[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteEndPoint] == A7_463 then
              return _UPVALUE3_.VPNCONF_FAILED
            end
          end
        end
      end
    end
  end
  if A4_460 ~= "2" then
    L60_516 = _UPVALUE1_
    L60_516 = L60_516.ikePolicyName
    L61_517 = A0_456
    L60_516 = "."
    L61_517 = _UPVALUE1_
    L61_517 = L61_517.ikePolicyName
    L60_516 = db
    L60_516 = L60_516.getRowsWhere
    L61_517 = _UPVALUE0_
    L60_516 = L60_516(L61_517, L62_518)
    L61_517 = true
    for _FORV_65_, _FORV_66_ in L62_518(L60_516) do
      if _FORV_66_[_UPVALUE0_ .. "." .. _UPVALUE1_.ipsecStatus] == "1" then
        L61_517 = false
      end
    end
    if L61_517 then
      L61_517 = false
      if L62_518 == "0" then
        if L48_504[_UPVALUE0_ .. "." .. _UPVALUE1_.localGateway] == 0 then
        elseif L48_504[_UPVALUE0_ .. "." .. _UPVALUE1_.localGateway] == 1 then
        elseif L48_504[_UPVALUE0_ .. "." .. _UPVALUE1_.localGateway] == 2 then
        end
        L58_514[_UPVALUE41_ .. "." .. _UPVALUE1_.localIdentifier] = ""
        if L62_518 ~= nil then
          L58_514[_UPVALUE41_ .. "." .. _UPVALUE1_.localIdentifier] = L62_518["ipAddressTable.ipAddress"]
        end
      end
      idType = L62_518
      if L62_518 == "0" then
        L58_514[L62_518] = L48_504[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteEndPoint]
      end
      L47_503 = L62_518
    else
      L47_503 = true
    end
  else
    L47_503 = true
  end
  if A44_500 == "1" then
    if L58_514 ~= L59_515 then
      return L58_514
    end
  end
  L60_516 = _UPVALUE1_
  L60_516 = L60_516.policyType
  if L58_514 == "1" then
    L60_516 = _UPVALUE1_
    L60_516 = L60_516.rvgStatus
    if L58_514 == "1" then
      L60_516 = _UPVALUE1_
      L60_516 = L60_516.backupPolicyName
      if L58_514 ~= nil then
        L60_516 = _UPVALUE1_
        L60_516 = L60_516.backupPolicyName
        L61_517 = _UPVALUE0_
        L61_517 = L61_517 .. L62_518 .. _UPVALUE1_.backupPolicyName
        L61_517 = L48_504[L61_517]
        if L58_514 then
          L60_516 = L58_514
          L60_516 = _UPVALUE2_
          L60_516 = L60_516.SUCCESS
          if L59_515 ~= L60_516 then
            return L59_515
          end
        end
        L60_516 = _UPVALUE0_
        L61_517 = _UPVALUE1_
        L61_517 = L61_517.policyName
        L60_516 = L48_504["IpsecVPNPolicy.Status"]
        if L59_515 ~= nil then
          L61_517 = rvgConfig
          L61_517 = L61_517(L62_518, "2", L60_516)
          if L61_517 ~= L62_518 then
            return L61_517
          end
        else
          L61_517 = _UPVALUE3_
          L61_517 = L61_517.BACKUP_POLICY_CONFIG_FAILED
          return L61_517
        end
      end
    end
  end
  L60_516 = L48_504
  if L58_514 == L59_515 then
    return L59_515
  end
  L60_516 = _UPVALUE0_
  L61_517 = _UPVALUE1_
  L61_517 = L61_517.policyName
  L60_516 = _UPVALUE2_
  L60_516 = L60_516.SUCCESS
  L61_517 = L59_515
  return L60_516, L61_517
end
function vpnPolicyDelete(A0_519)
  if A0_519 == _UPVALUE0_.NIL or tonumber(A0_519) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_519) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.deleteRow(_UPVALUE1_, _UPVALUE2_, A0_519) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_519
  end
  return _UPVALUE0_.SUCCESS, A0_519
end
function vpnPoliciesGetAll()
  local L0_520
  L0_520 = db
  L0_520 = L0_520.getTable
  L0_520 = L0_520(_UPVALUE0_, false)
  if L0_520 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_520
end
function vpnPoliciesDeleteAll()
  if db.deleteAllRows(_UPVALUE0_) == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS
end
function vpnPolicyGetCur(A0_521)
  local L1_522
  L1_522 = db
  L1_522 = L1_522.getRow
  L1_522 = L1_522(_UPVALUE0_, _UPVALUE1_, A0_521)
  if L1_522 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, A0_521, L1_522
end
function rvgConfig(A0_523, A1_524, A2_525)
  local L3_526
  L3_526 = false
  if A1_524 == "1" then
    A0_523[_UPVALUE0_ .. "." .. _UPVALUE1_.ipsecPolicyType] = "1"
    L3_526 = db.update(_UPVALUE0_, A0_523, A0_523[_UPVALUE0_ .. "." .. _UPVALUE2_])
    if L3_526 then
      return _UPVALUE3_.SUCCESS
    end
  elseif A1_524 == "2" then
    if A0_523[_UPVALUE0_ .. "." .. _UPVALUE1_.policyType] == "2" then
      return _UPVALUE4_.MANNUAL_CANT_SET_AS_BACKUP
    elseif A0_523[_UPVALUE0_ .. "." .. _UPVALUE1_.autoPolicyType] == "1" then
      return _UPVALUE4_.CLIENT_POLICY_CANT_SET_AS_BACKUP
    elseif A0_523[_UPVALUE0_ .. "." .. _UPVALUE1_.ikePolicyName] ~= nil then
      if db.getRow(_UPVALUE5_, _UPVALUE1_.ikePolicyName, A0_523[_UPVALUE0_ .. "." .. _UPVALUE1_.ikePolicyName]) == _UPVALUE3_.NIL then
        return _UPVALUE4_.IKEPOLICY_NOT_FOUND
      elseif db.getRow(_UPVALUE5_, _UPVALUE1_.ikePolicyName, A0_523[_UPVALUE0_ .. "." .. _UPVALUE1_.ikePolicyName])[_UPVALUE5_ .. "." .. _UPVALUE1_.DPD] == "0" then
        return _UPVALUE4_.DPD_NOT_ENABLED
      elseif db.getRow(_UPVALUE5_, _UPVALUE1_.ikePolicyName, A0_523[_UPVALUE0_ .. "." .. _UPVALUE1_.ikePolicyName])[_UPVALUE5_ .. "." .. _UPVALUE1_.policyDirection] == "1" then
        return _UPVALUE4_.DIRECTION_SET_TO_RESPOND
      elseif db.getRow(_UPVALUE5_, _UPVALUE1_.ikePolicyName, A0_523[_UPVALUE0_ .. "." .. _UPVALUE1_.ikePolicyName])[_UPVALUE5_ .. "." .. _UPVALUE1_.extendedAuthType] == "2" then
        return _UPVALUE4_.XAUTH_SET_TO_USERDB
      end
    end
    if A0_523[_UPVALUE0_ .. "." .. _UPVALUE1_.ipsecPolicyType] ~= "2" then
      A0_523[_UPVALUE0_ .. "." .. _UPVALUE1_.ipsecStatus] = "0"
    end
    A0_523[_UPVALUE0_ .. "." .. _UPVALUE1_.ipsecPolicyType] = "2"
    L3_526 = db.update(_UPVALUE0_, A0_523, A0_523[_UPVALUE0_ .. "." .. _UPVALUE2_])
    if L3_526 then
      return _UPVALUE3_.SUCCESS
    end
  end
  return _UPVALUE4_.BACKUP_CONFIG_FAILED
end
function rvgConfigCheckPrimary(A0_527)
  if A0_527 == nil then
    return _UPVALUE0_.PRIMARY_VPN_CONF_NOT_FOUND
  elseif A0_527[_UPVALUE1_ .. "." .. _UPVALUE2_.policyType] == "2" then
    return _UPVALUE0_.BACKUP_POLICY_SETTING_NOTALLOWEDFOR_MANUAL
  elseif A0_527[_UPVALUE1_ .. "." .. _UPVALUE2_.autoPolicyType] == "1" then
    return _UPVALUE0_.REDUNDANT_GW_NOTFOR_CLIENT_POLICIES
  elseif A0_527[_UPVALUE1_ .. "." .. _UPVALUE2_.ikePolicyName] ~= nil then
    if db.getRow(_UPVALUE3_, _UPVALUE2_.ikePolicyName, A0_527[_UPVALUE1_ .. "." .. _UPVALUE2_.ikePolicyName]) == nil then
      return _UPVALUE0_.IKECONF_NOT_FOUND
    elseif db.getRow(_UPVALUE3_, _UPVALUE2_.ikePolicyName, A0_527[_UPVALUE1_ .. "." .. _UPVALUE2_.ikePolicyName])[_UPVALUE3_ .. "." .. _UPVALUE2_.DPD] == "0" then
      return _UPVALUE0_.ENABLE_DPD
    elseif db.getRow(_UPVALUE3_, _UPVALUE2_.ikePolicyName, A0_527[_UPVALUE1_ .. "." .. _UPVALUE2_.ikePolicyName])[_UPVALUE3_ .. "." .. _UPVALUE2_.policyDirection] == "1" then
      return _UPVALUE0_.REDUNDANT_GW_ISFOR_INITIATORS_ONLY
    elseif db.getRow(_UPVALUE3_, _UPVALUE2_.ikePolicyName, A0_527[_UPVALUE1_ .. "." .. _UPVALUE2_.ikePolicyName])[_UPVALUE3_ .. "." .. _UPVALUE2_.extendedAuthType] == "1" then
      return _UPVALUE0_.DISABLE_XAUTH_USERDB
    end
  end
  return _UPVALUE4_.SUCCESS
end
function rvgConfigCheck(A0_528)
  if db.getRow(_UPVALUE0_, _UPVALUE1_, A0_528) == nil then
    return _UPVALUE2_.PRIMARY_POLICY_CONFIG_FAILED
  elseif db.getRow(_UPVALUE0_, _UPVALUE1_, A0_528)[_UPVALUE0_ .. "." .. _UPVALUE3_.policyType] == "2" then
    return _UPVALUE2_.MANNUAL_CANT_SET_AS_BACKUP
  elseif db.getRow(_UPVALUE0_, _UPVALUE1_, A0_528)[_UPVALUE0_ .. "." .. _UPVALUE3_.autoPolicyType] == "1" then
    return _UPVALUE2_.CLIENT_POLICY_CANT_SET_AS_BACKUP
  elseif db.getRow(_UPVALUE0_, _UPVALUE1_, A0_528)[_UPVALUE0_ .. "." .. _UPVALUE3_.ikePolicyName] ~= nil then
    if db.getRow(_UPVALUE4_, _UPVALUE3_.ikePolicyName, db.getRow(_UPVALUE0_, _UPVALUE1_, A0_528)[_UPVALUE0_ .. "." .. _UPVALUE3_.ikePolicyName]) == nil then
      return _UPVALUE2_.IKECONF_NOT_FOUND
    elseif db.getRow(_UPVALUE4_, _UPVALUE3_.ikePolicyName, db.getRow(_UPVALUE0_, _UPVALUE1_, A0_528)[_UPVALUE0_ .. "." .. _UPVALUE3_.ikePolicyName])[_UPVALUE4_ .. "." .. _UPVALUE3_.DPD] == "0" then
      return _UPVALUE2_.ENABLE_DPD
    elseif db.getRow(_UPVALUE4_, _UPVALUE3_.ikePolicyName, db.getRow(_UPVALUE0_, _UPVALUE1_, A0_528)[_UPVALUE0_ .. "." .. _UPVALUE3_.ikePolicyName])[_UPVALUE4_ .. "." .. _UPVALUE3_.policyDirection] == "1" then
      return _UPVALUE2_.DIRECTION_SET_TO_RESPOND
    elseif db.getRow(_UPVALUE4_, _UPVALUE3_.ikePolicyName, db.getRow(_UPVALUE0_, _UPVALUE1_, A0_528)[_UPVALUE0_ .. "." .. _UPVALUE3_.ikePolicyName])[_UPVALUE4_ .. "." .. _UPVALUE3_.extendedAuthType] == "2" then
      return _UPVALUE2_.XAUTH_SET_TO_USERDB
    end
  end
  return _UPVALUE5_.SUCCESS
end
function getDuplicatePolicies(A0_529, A1_530)
  local L2_531
  if A0_529 == nil then
    return L2_531
  end
  if A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteNetworkType] == 0 or A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteNetworkType] == "0" then
    if A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == 0 or A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == "0" then
      L2_531 = db.getRowsWhere(_UPVALUE0_, "Status = " .. A1_530 .. " and RemoteNetworkType = 0 and LocalNetworkType = 0")
    elseif A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == 1 or A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == "1" then
      L2_531 = db.getRowsWhere(_UPVALUE0_, "Status = " .. A1_530 .. " and RemoteNetworkType = 0 and LocalNetworkType = 1 and LocalStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localStartIP] .. "'")
    elseif A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == 2 or A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == "2" then
      L2_531 = db.getRowsWhere(_UPVALUE0_, "Status = " .. A1_530 .. " and RemoteNetworkType = 0 and LocalNetworkType = 2 and LocalStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localStartIP] .. "' and LocalEndAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localEndIP] .. "'")
    elseif A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == 3 or A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == "3" then
      if A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.addressFamily] == "10" then
        L2_531 = db.getRowsWhere(_UPVALUE0_, "Status = " .. A1_530 .. " and RemoteNetworkType = 0 and LocalNetworkType = 3 and LocalStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localStartIP] .. "' and LocalPrefixLength = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localPrefixLength] .. "'")
      else
        L2_531 = db.getRowsWhere(_UPVALUE0_, "Status = " .. A1_530 .. " and RemoteNetworkType = 0 and LocalNetworkType = 3 and LocalStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localStartIP] .. "' and LocalSubnetMask = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localSubnetmask] .. "'")
      end
    end
  elseif A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteNetworkType] == 1 or A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteNetworkType] == "1" then
    if A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == 0 or A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == "0" then
      L2_531 = db.getRowsWhere(_UPVALUE0_, "Status = " .. A1_530 .. " and RemoteNetworkType = 1 and RemoteStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteStartAddress] .. "' and LocalNetworkType = 0")
    elseif A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == 1 or A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == "1" then
      L2_531 = db.getRowsWhere(_UPVALUE0_, "Status = " .. A1_530 .. " and RemoteNetworkType = 1 and RemoteStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteStartAddress] .. "' and LocalNetworkType = 1 and LocalStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localStartIP] .. "'")
    elseif A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == 2 or A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == "2" then
      L2_531 = db.getRowsWhere(_UPVALUE0_, "Status = " .. A1_530 .. " and RemoteNetworkType = 1 and RemoteStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteStartAddress] .. "' and LocalNetworkType = 2 and LocalStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localStartIP] .. "' and LocalEndAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localEndIP] .. "'")
    elseif A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == 3 or A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == "3" then
      if A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.addressFamily] == "10" then
        L2_531 = db.getRowsWhere(_UPVALUE0_, "Status = " .. A1_530 .. " and RemoteNetworkType = 1 and RemoteStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteStartAddress] .. "' and LocalNetworkType = 3 and LocalStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localStartIP] .. "' and LocalPrefixLength = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localPrefixLength] .. "'")
      else
        L2_531 = db.getRowsWhere(_UPVALUE0_, "Status = " .. A1_530 .. " and RemoteNetworkType = 1 and RemoteStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteStartAddress] .. "' and LocalNetworkType = 3 and LocalStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localStartIP] .. "' and LocalSubnetMask = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localSubnetmask] .. "'")
      end
    end
  elseif A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteNetworkType] == 2 or A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteNetworkType] == "2" then
    if A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == 0 or A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == "0" then
      L2_531 = db.getRowsWhere(_UPVALUE0_, "Status = " .. A1_530 .. " and RemoteNetworkType = 2 and RemoteStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteStartAddress] .. "' and RemoteEndAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteEndAddress] .. "' and LocalNetworkType = 0")
    elseif A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == 1 or A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == "1" then
      L2_531 = db.getRowsWhere(_UPVALUE0_, "Status = " .. A1_530 .. " and RemoteNetworkType = 2 and RemoteStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteStartAddress] .. "' and RemoteEndAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteEndAddress] .. "' and LocalNetworkType = 1 and LocalStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localStartIP] .. "'")
    elseif A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == 2 or A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == "2" then
      L2_531 = db.getRowsWhere(_UPVALUE0_, "Status = " .. A1_530 .. " and RemoteNetworkType = 2 and RemoteStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteStartAddress] .. "' and RemoteEndAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteEndAddress] .. "' and LocalNetworkType = 2 and LocalStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localStartIP] .. "' and LocalEndAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localEndIP] .. "'")
    elseif A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == 3 or A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == "3" then
      if A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.addressFamily] == "10" then
        L2_531 = db.getRowsWhere(_UPVALUE0_, "Status = " .. A1_530 .. " and RemoteNetworkType = 2 and RemoteStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteStartAddress] .. "' and RemoteEndAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteEndAddress] .. "' and LocalNetworkType = 3 and LocalStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localStartIP] .. "' and LocalPrefixLength = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localPrefixLength] .. "'")
      else
        L2_531 = db.getRowsWhere(_UPVALUE0_, "Status = " .. A1_530 .. " and RemoteNetworkType = 2 and RemoteStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteStartAddress] .. "' and RemoteEndAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteEndAddress] .. "' and LocalNetworkType = 3 and LocalStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localStartIP] .. "' and LocalSubnetMask = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localSubnetmask] .. "'")
      end
    end
  elseif A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteNetworkType] == 3 or A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteNetworkType] == "3" then
    if A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.addressFamily] == "10" then
      if A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == 0 or A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == "0" then
        L2_531 = db.getRowsWhere(_UPVALUE0_, "Status = " .. A1_530 .. " and RemoteNetworkType = 3 and RemoteStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteStartAddress] .. "' and RemotePrefixLength = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remotePrefixLength] .. "' and LocalNetworkType = 0")
      elseif A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == 1 or A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == "1" then
        L2_531 = db.getRowsWhere(_UPVALUE0_, "Status = " .. A1_530 .. " and RemoteNetworkType = 3 and RemoteStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteStartAddress] .. "' and RemotePrefixLength = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remotePrefixLength] .. "' and LocalNetworkType = 1 and LocalStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localStartIP] .. "'")
      elseif A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == 2 or A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == "2" then
        L2_531 = db.getRowsWhere(_UPVALUE0_, "Status = " .. A1_530 .. " and RemoteNetworkType = 3 and RemoteStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteStartAddress] .. "' and RemotePrefixLength = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remotePrefixLength] .. "' and LocalNetworkType = 2 and LocalStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localStartIP] .. "' and LocalEndAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localEndIP] .. "'")
      elseif A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == 3 or A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == "3" then
        L2_531 = db.getRowsWhere(_UPVALUE0_, "Status = " .. A1_530 .. " and RemoteNetworkType = 3 and RemoteStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteStartAddress] .. "' and RemotePrefixLength = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remotePrefixLength] .. "' and LocalNetworkType = 3 and LocalStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localStartIP] .. "' and LocalPrefixLength = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localPrefixLength] .. "'")
      end
    elseif A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == 0 or A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == "0" then
      L2_531 = db.getRowsWhere(_UPVALUE0_, "Status = " .. A1_530 .. " and RemoteNetworkType = 3 and RemoteStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteStartAddress] .. "' and RemoteSubnetMask = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteSubnetmask] .. "' and LocalNetworkType = 0")
    elseif A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == 1 or A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == "1" then
      L2_531 = db.getRowsWhere(_UPVALUE0_, "Status = " .. A1_530 .. " and RemoteNetworkType = 3 and RemoteStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteStartAddress] .. "' and RemoteSubnetMask = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteSubnetmask] .. "' and LocalNetworkType = 1 and LocalStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localStartIP] .. "'")
    elseif A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == 2 or A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == "2" then
      L2_531 = db.getRowsWhere(_UPVALUE0_, "Status = " .. A1_530 .. " and RemoteNetworkType = 3 and RemoteStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteStartAddress] .. "' and RemoteSubnetMask = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteSubnetmask] .. "' and LocalNetworkType = 2 and LocalStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localStartIP] .. "' and LocalEndAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localEndIP] .. "'")
    elseif A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == 3 or A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localNetworkType] == "3" then
      L2_531 = db.getRowsWhere(_UPVALUE0_, "Status = " .. A1_530 .. " and RemoteNetworkType = 3 and RemoteStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteStartAddress] .. "' and RemoteSubnetMask = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.remoteSubnetmask] .. "' and LocalNetworkType = 3 and LocalStartAddress = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localStartIP] .. "' and LocalSubnetMask = '" .. A0_529[_UPVALUE0_ .. "." .. _UPVALUE1_.localSubnetmask] .. "'")
    end
  end
  return L2_531
end
function updateLocalRemoteGateways(A0_532, A1_533)
  local L2_534, L3_535, L4_536, L5_537, L6_538, L7_539, L8_540, L9_541, L10_542, L11_543
  L2_534 = false
  L3_535 = db
  L3_535 = L3_535.getAttribute
  L4_536 = _UPVALUE0_
  L5_537 = _UPVALUE1_
  L6_538 = A1_533
  L7_539 = _UPVALUE2_
  L7_539 = L7_539.ikePolicyName
  L3_535 = L3_535(L4_536, L5_537, L6_538, L7_539)
  ikeName = L3_535
  L3_535 = db
  L3_535 = L3_535.getAttribute
  L4_536 = _UPVALUE0_
  L5_537 = _UPVALUE1_
  L6_538 = A1_533
  L7_539 = _UPVALUE2_
  L7_539 = L7_539.remoteEndPoint
  L3_535 = L3_535(L4_536, L5_537, L6_538, L7_539)
  L4_536 = ikeName
  if L4_536 ~= nil then
    L4_536 = ikeName
    if L4_536 ~= "" then
      L4_536 = _UPVALUE0_
      L5_537 = "."
      L6_538 = _UPVALUE2_
      L6_538 = L6_538.ikePolicyName
      L4_536 = L4_536 .. L5_537 .. L6_538
      L4_536 = A0_532[L4_536]
      if L4_536 ~= nil then
        L4_536 = ikeName
        L5_537 = _UPVALUE0_
        L6_538 = "."
        L7_539 = _UPVALUE2_
        L7_539 = L7_539.ikePolicyName
        L5_537 = L5_537 .. L6_538 .. L7_539
        L5_537 = A0_532[L5_537]
      else
        if L4_536 == L5_537 then
          L4_536 = _UPVALUE0_
          L5_537 = "."
          L6_538 = _UPVALUE2_
          L6_538 = L6_538.ikePolicyName
          L4_536 = L4_536 .. L5_537 .. L6_538
          L4_536 = A0_532[L4_536]
      end
      else
        if L4_536 == nil then
          L2_534 = true
          L4_536 = _UPVALUE0_
          L5_537 = "."
          L6_538 = _UPVALUE2_
          L6_538 = L6_538.ikePolicyName
          L4_536 = L4_536 .. L5_537 .. L6_538
          L4_536 = A0_532[L4_536]
          if L4_536 == nil then
            L4_536 = _UPVALUE0_
            L5_537 = "."
            L6_538 = _UPVALUE2_
            L6_538 = L6_538.ikePolicyName
            L4_536 = L4_536 .. L5_537 .. L6_538
            A0_532[L4_536] = ""
          end
          L4_536 = db
          L4_536 = L4_536.getAttribute
          L5_537 = _UPVALUE3_
          L6_538 = _UPVALUE2_
          L6_538 = L6_538.ikePolicyName
          L7_539 = ikeName
          L8_540 = _UPVALUE1_
          L4_536 = L4_536(L5_537, L6_538, L7_539, L8_540)
          if L4_536 ~= nil then
            L5_537 = db
            L5_537 = L5_537.getRow
            L6_538 = _UPVALUE3_
            L7_539 = _UPVALUE1_
            L8_540 = L4_536
            L5_537 = L5_537(L6_538, L7_539, L8_540)
            L6_538 = _UPVALUE3_
            L7_539 = "."
            L8_540 = _UPVALUE2_
            L8_540 = L8_540.ikePolicyName
            L6_538 = L6_538 .. L7_539 .. L8_540
            L6_538 = L5_537[L6_538]
            L6_538 = L6_538 or ""
            L7_539 = db
            L7_539 = L7_539.getRowsWhere
            L8_540 = _UPVALUE0_
            L7_539 = L7_539(L8_540, L9_541)
            L8_540 = true
            if L9_541 == 1 then
              L8_540 = true
            else
              for _FORV_12_, _FORV_13_ in L9_541(L10_542) do
                if _FORV_13_[_UPVALUE0_ .. "." .. _UPVALUE1_] ~= A1_533 and _FORV_13_[_UPVALUE0_ .. "." .. _UPVALUE2_.ipsecStatus] == "1" then
                  L8_540 = false
                end
              end
            end
            if L8_540 then
              L8_540 = false
              if L9_541 == "0" then
                L5_537[L9_541] = ""
                L8_540 = true
              end
              if L9_541 == "0" then
                L5_537[L9_541] = ""
                L8_540 = true
              end
            end
            if L8_540 then
              valid = L9_541
            else
              valid = L9_541
            end
          end
      end
      else
        L4_536 = A0_532["IpsecVPNPolicy.RemoteEndPoint"]
        if L3_535 ~= L4_536 then
          L4_536 = true
          valid = L4_536
          L2_534 = true
        else
          L4_536 = true
          valid = L4_536
        end
      end
    end
  else
    L4_536 = _UPVALUE0_
    L5_537 = "."
    L6_538 = _UPVALUE2_
    L6_538 = L6_538.ikePolicyName
    L4_536 = L4_536 .. L5_537 .. L6_538
    L4_536 = A0_532[L4_536]
    if L4_536 ~= nil then
      L2_534 = true
    end
    L4_536 = true
    valid = L4_536
  end
  L4_536 = {}
  L5_537 = valid
  if L5_537 then
    L5_537 = A0_532["IpsecVPNPolicy.PolicyType"]
    if L5_537 ~= "2" and L2_534 == true then
      L5_537 = db
      L5_537 = L5_537.getAttribute
      L6_538 = "IpsecIKEPolicy"
      L7_539 = "IKEPolicyName"
      L8_540 = _UPVALUE0_
      L8_540 = L8_540 .. L9_541 .. L10_542
      L8_540 = A0_532[L8_540]
      L5_537 = L5_537(L6_538, L7_539, L8_540, L9_541)
      id = L5_537
      L5_537 = id
      if L5_537 ~= nil then
        L5_537 = false
        L6_538 = db
        L6_538 = L6_538.getRow
        L7_539 = "IpsecIKEPolicy"
        L8_540 = "_ROWID_"
        L6_538 = L6_538(L7_539, L8_540, L9_541)
        L7_539 = L6_538["IpsecIKEPolicy.IKEPolicyName"]
        L7_539 = L7_539 or ""
        L8_540 = db
        L8_540 = L8_540.getRowsWhere
        L8_540 = L8_540(L9_541, L10_542)
        for _FORV_13_, _FORV_14_ in L10_542(L11_543) do
        end
        if L9_541 and L10_542 == "1" then
          if L11_543 == "0" then
            if db.getAttribute("IpsecVPNPolicy", "VPNPolicyName", A0_532["IpsecVPNPolicy.VPNPolicyName"], "LocalGateway") == "0" then
            elseif db.getAttribute("IpsecVPNPolicy", "VPNPolicyName", A0_532["IpsecVPNPolicy.VPNPolicyName"], "LocalGateway") == "1" then
            elseif db.getAttribute("IpsecVPNPolicy", "VPNPolicyName", A0_532["IpsecVPNPolicy.VPNPolicyName"], "LocalGateway") == "2" then
            end
            L6_538["IpsecIKEPolicy.LocalIdentifier"] = ""
            if L11_543 ~= nil then
              L6_538["IpsecIKEPolicy.LocalIdentifier"] = L11_543["ipAddressTable.ipAddress"]
            end
          end
          if L11_543 == "0" then
            L6_538["IpsecIKEPolicy.RemoteIdentifier"] = L11_543
          end
        end
        if L9_541 then
          valid = L11_543
        else
          valid = L11_543
        end
      end
    end
  end
end
function ipsecVPNPolicyEnable(A0_544, A1_545)
  local L2_546, L3_547, L4_548, L5_549, L6_550, L7_551, L8_552, L9_553, L10_554, L11_555, L12_556
  L2_546 = false
  L3_547 = false
  L4_548 = nil
  L5_549 = {}
  L6_550 = {}
  if A1_545 then
    L7_551 = _UPVALUE0_
    L8_552 = "."
    L9_553 = _UPVALUE1_
    L9_553 = L9_553.ipsecStatus
    L7_551 = L7_551 .. L8_552 .. L9_553
    L6_550[L7_551] = "1"
  else
    L7_551 = _UPVALUE0_
    L8_552 = "."
    L9_553 = _UPVALUE1_
    L9_553 = L9_553.ipsecStatus
    L7_551 = L7_551 .. L8_552 .. L9_553
    L6_550[L7_551] = "0"
  end
  L7_551 = A0_544
  L8_552 = true
  L9_553 = db
  L9_553 = L9_553.getAttribute
  L10_554 = "IpsecVPNPolicy"
  L11_555 = "_ROWID_"
  L12_556 = L7_551
  L9_553 = L9_553(L10_554, L11_555, L12_556, "Status")
  L10_554 = db
  L10_554 = L10_554.getAttribute
  L11_555 = "l2tpVPNClient"
  L12_556 = "_ROWID_"
  L10_554 = L10_554(L11_555, L12_556, 1, "l2tpClientEnable")
  if A1_545 then
    L11_555 = db
    L11_555 = L11_555.getRow
    L12_556 = "IpsecVPNPolicy"
    L11_555 = L11_555(L12_556, "_ROWID_", L7_551)
    L12_556 = L11_555["IpsecVPNPolicy.L2tpIpsecPolicy"]
    if L12_556 == "2" then
      L12_556 = L11_555["IpsecVPNPolicy.TunnelOrTransport"]
      if L12_556 == "0" and L10_554 == "1" then
        L12_556 = db
        L12_556 = L12_556.setAttribute
        L12_556("l2tpClientConnectionStatus", _UPVALUE2_, "1", "action", 0)
      end
    end
    L12_556 = L11_555["IpsecVPNPolicy.TunnelOrTransport"]
    if L12_556 == "1" then
      L12_556 = L11_555["IpsecVPNPolicy.EnableDhcpOverIPSec"]
      if L12_556 == "0" then
        L12_556 = getDuplicatePolicies
        L12_556 = L12_556(L11_555, 1)
        if L12_556 ~= nil and #L12_556 == 1 and L12_556[1][_UPVALUE0_ .. "." .. _UPVALUE2_] ~= L7_551 and L12_556[1][_UPVALUE0_ .. "." .. _UPVALUE1_.ipsecStatus] == "1" and (L12_556[1]["IpsecVPNPolicy.TunnelOrTransport"] == "0" or L12_556[1]["IpsecVPNPolicy.TunnelOrTransport"] == "1" and L12_556[1]["IpsecVPNPolicy.EnableDhcpOverIPSec"] == "0") then
          return _UPVALUE3_.CANT_ENABLE_TWO_POLICIES_WITH_SAME_TRAFFICSELECTORS
        end
      end
    else
      L12_556 = L11_555["IpsecVPNPolicy.TunnelOrTransport"]
      if L12_556 == "0" then
        L12_556 = db
        L12_556 = L12_556.getRowsWhere
        L12_556 = L12_556("IpsecVPNPolicy", "RemoteEndPoint = '" .. L11_555["IpsecVPNPolicy.RemoteEndPoint"] .. "'")
        if L12_556 ~= nil then
          util.appendDebugOut("I am here")
          for _FORV_17_, _FORV_18_ in pairs(L12_556) do
            util.appendDebugOut("Status" .. L12_556[0 + 1][_UPVALUE0_ .. "." .. _UPVALUE1_.ipsecStatus])
            if L7_551 ~= L12_556[0 + 1][_UPVALUE0_ .. "." .. _UPVALUE2_] and L12_556[0 + 1][_UPVALUE0_ .. "." .. _UPVALUE1_.ipsecStatus] == "1" then
              return _UPVALUE3_.IPSEC_VPN_REMOTECONFIG_FAILED
            end
          end
        end
      else
        L12_556 = L11_555["IpsecVPNPolicy.TunnelOrTransport"]
        if L12_556 == "1" then
          L12_556 = L11_555["IpsecVPNPolicy.EnableDhcpOverIPSec"]
          if L12_556 == "1" then
            L12_556 = db
            L12_556 = L12_556.existsRow
            L12_556 = L12_556("IpsecVPNPolicy", "RemoteEndPoint", L11_555["IpsecVPNPolicy.RemoteEndPoint"])
            if L12_556 then
              L12_556 = db
              L12_556 = L12_556.existsRow
              L12_556 = L12_556("IpsecVPNPolicy", "RemoteEndPoint", L11_555["IpsecVPNPolicy.RemoteEndPoint"])
              if L12_556 ~= L11_555[_UPVALUE0_ .. "." .. _UPVALUE2_] then
                return _UPVALUE3_.IPSEC_VPN_REMOTECONFIG_FAILED
              end
            end
          end
        end
      end
    end
  end
  L11_555 = _UPVALUE0_
  L12_556 = "."
  L11_555 = L11_555 .. L12_556 .. _UPVALUE1_.ipsecStatus
  L11_555 = L6_550[L11_555]
  if L9_553 ~= L11_555 then
    L8_552 = false
    L11_555 = db
    L11_555 = L11_555.getAttribute
    L12_556 = "IpsecVPNPolicy"
    L11_555 = L11_555(L12_556, "_ROWID_", L7_551, "PolicyType")
    if L11_555 ~= "2" then
      L11_555 = db
      L11_555 = L11_555.getAttribute
      L12_556 = "IpsecVPNPolicy"
      L11_555 = L11_555(L12_556, "_ROWID_", L7_551, "IKEPolicyName")
      L11_555 = L11_555 or ""
      L12_556 = db
      L12_556 = L12_556.getAttribute
      L12_556 = L12_556("IpsecIKEPolicy", "IKEPolicyName", L11_555, "_ROWID_")
      L4_548 = L12_556
      if L4_548 ~= nil then
        L12_556 = db
        L12_556 = L12_556.getRow
        L12_556 = L12_556("IpsecIKEPolicy", "_ROWID_", L4_548)
        L5_549 = L12_556
        if A1_545 then
          L12_556 = L5_549["IpsecIKEPolicy.LocalIdentifier"]
          if L12_556 ~= "" then
            L12_556 = L5_549["IpsecIKEPolicy.RemoteIdentifier"]
          elseif L12_556 == "" then
            L12_556 = {}
            if db.getAttribute("IpsecIKEPolicy", "_ROWID_", L4_548, "LocalIdentifierType") ~= nil and db.getAttribute("IpsecIKEPolicy", "_ROWID_", L4_548, "LocalIdentifierType") == "0" then
              if db.getAttribute("IpsecVPNPolicy", "_ROWID_", L7_551, "LocalGateway") == "0" then
                L12_556 = db.getRowWhere("ipAddressTable", "LogicalIfName = 'WAN1' AND addressFamily = 2")
              elseif db.getAttribute("IpsecVPNPolicy", "_ROWID_", L7_551, "LocalGateway") == "1" then
                L12_556 = db.getRowWhere("ipAddressTable", "LogicalIfName = 'WAN2' AND addressFamily = 2")
              elseif db.getAttribute("IpsecVPNPolicy", "_ROWID_", L7_551, "LocalGateway") == "2" then
                L12_556 = db.getRowWhere("ipAddressTable", "LogicalIfName = 'WAN3' AND addressFamily = 2")
              end
              L5_549["IpsecIKEPolicy.LocalIdentifier"] = ""
              if L12_556 ~= nil then
                L5_549["IpsecIKEPolicy.LocalIdentifier"] = L12_556["ipAddressTable.ipAddress"]
              end
            end
            if db.getAttribute("IpsecIKEPolicy", "_ROWID_", L4_548, "RemoteIdentifierType") ~= nil and db.getAttribute("IpsecIKEPolicy", "_ROWID_", L4_548, "RemoteIdentifierType") == "0" then
              L5_549["IpsecIKEPolicy.RemoteIdentifier"] = db.getAttribute("IpsecVPNPolicy", "_ROWID_", L7_551, "RemoteEndPoint") or ""
            end
            L3_547 = true
          end
        else
          L12_556 = db
          L12_556 = L12_556.getRowsWhere
          L12_556 = L12_556("IpsecVPNPolicy", "IKEPolicyName = '" .. L11_555 .. "'")
          L3_547 = true
          for _FORV_17_, _FORV_18_ in pairs(L12_556) do
            if L12_556[0 + 1][_UPVALUE0_ .. "." .. _UPVALUE1_.ipsecStatus] == "1" and L12_556[0 + 1][_UPVALUE0_ .. "." .. _UPVALUE2_] ~= L7_551 then
              L3_547 = false
              break
            end
          end
          if L3_547 then
            if L5_549["IpsecIKEPolicy.LocalIdentifierType"] == "0" then
              L5_549["IpsecIKEPolicy.LocalIdentifier"] = ""
            end
            if L5_549["IpsecIKEPolicy.RemoteIdentifierType"] == "0" then
              L5_549["IpsecIKEPolicy.RemoteIdentifier"] = ""
            end
          end
        end
      end
    end
    if A1_545 then
      L11_555 = db
      L11_555 = L11_555.getRow
      L12_556 = "IpsecVPNPolicy"
      L11_555 = L11_555(L12_556, "_ROWID_", L7_551)
      L12_556 = L11_555["IpsecVPNPolicy.RVGStatus"]
      if L12_556 == "1" then
        L12_556 = db
        L12_556 = L12_556.getAttribute
        L12_556 = L12_556("IpsecVPNPolicy", "VPNPolicyName", L11_555["IpsecVPNPolicy.BackupPolicyName"], "Status")
        L12_556 = L12_556 or ""
        if L12_556 == "1" then
          return _UPVALUE3_.BACKUP_POLICY_UPAND_RUNNING
        end
      end
      L12_556 = L11_555["IpsecVPNPolicy.PolicyType"]
      if L12_556 == "1" then
        L12_556 = L11_555["IpsecVPNPolicy.RVGStatus"]
        if L12_556 == "1" then
          L12_556 = L11_555["IpsecVPNPolicy.BackupPolicyName"]
          if L12_556 ~= nil then
            L12_556 = rvgConfigCheck
            L12_556 = L12_556(L7_551)
            if L12_556 ~= _UPVALUE4_.SUCCESS then
              return L12_556
            end
          end
        end
      end
    end
    L11_555 = db
    L11_555 = L11_555.update
    L12_556 = "IpsecVPNPolicy"
    L11_555 = L11_555(L12_556, L6_550, L7_551)
    L2_546 = L11_555
    if L2_546 and L3_547 then
      L11_555 = db
      L11_555 = L11_555.update
      L12_556 = "IpsecIKEPolicy"
      L11_555 = L11_555(L12_556, L5_549, L4_548)
      L2_546 = L11_555
      L4_548 = nil
      L11_555 = {}
      L5_549 = L11_555
      L3_547 = false
    end
  end
  if L8_552 then
    L11_555 = _UPVALUE4_
    L11_555 = L11_555.SUCCESS
    return L11_555
  end
  if L2_546 then
    L11_555 = _UPVALUE4_
    L11_555 = L11_555.SUCCESS
    return L11_555
  else
    L11_555 = _UPVALUE4_
    L11_555 = L11_555.FAILURE
    return L11_555
  end
end
function encryptionKeyValidate(A0_557, A1_558, A2_559)
  if A1_558 == 2 then
    if A0_557 ~= 8 then
      return _UPVALUE0_.ENCRYPTION_KEY_LIMIT_DES
    end
  elseif A1_558 == 4 then
    if A0_557 ~= 24 then
      return _UPVALUE0_.ENCRYPTION_KEY_LIMIT_3DES
    end
  elseif A1_558 == 8 then
    if A0_557 ~= 16 then
      return _UPVALUE0_.ENCRYPTION_KEY_LIMIT_AES128
    end
  elseif A1_558 == 16 then
    if A0_557 ~= 24 then
      return _UPVALUE0_.ENCRYPTION_KEY_LIMIT_AES192
    end
  elseif A1_558 == 32 then
    if A0_557 ~= 32 then
      return _UPVALUE0_.ENCRYPTION_KEY_LIMIT_AES256
    end
  elseif A1_558 == 64 then
    if A0_557 ~= 16 then
      return _UPVALUE0_.ENCRYPTION_KEY_LIMIT_AESCCM
    end
  elseif A1_558 == 128 then
    if A0_557 ~= 20 then
      return _UPVALUE0_.ENCRYPTION_KEY_LIMIT_AESGCM
    end
  elseif A1_558 == 256 then
    if A0_557 ~= 16 then
      return _UPVALUE0_.ENCRYPTION_KEY_LIMIT_TWOFISH128
    end
  elseif A1_558 == 512 then
    if A0_557 ~= 24 then
      return _UPVALUE0_.ENCRYPTION_KEY_LIMIT_TWOFISH192
    end
  elseif A1_558 == 1024 then
    if A0_557 ~= 32 then
      return _UPVALUE0_.ENCRYPTION_KEY_LIMIT_TWOFISH256
    end
  elseif A1_558 == 2048 then
    if A0_557 ~= tonumber(A2_559) / 8 then
      return _UPVALUE0_.ENCRYPTION_KEY_LIMIT_BLOWFISH
    end
  elseif A1_558 == 4096 and A0_557 ~= tonumber(A2_559) / 8 then
    return _UPVALUE0_.ENCRYPTION_KEY_LIMIT_CAST128
  end
  return _UPVALUE1_.SUCCESS
end
function optionIpCheck(A0_560, A1_561)
  if A0_560 == db.getAttributeWhere(_UPVALUE0_, _UPVALUE1_.interfaceName .. " = '" .. _UPVALUE2_ .. "' AND " .. _UPVALUE1_.addressFamily .. " = " .. A1_561, _UPVALUE1_.wan_ipAddress) then
    return _UPVALUE4_.REMOTEENDPOINT_OPTION1IP
  elseif A0_560 == db.getAttributeWhere(_UPVALUE0_, _UPVALUE1_.interfaceName .. " = '" .. _UPVALUE3_ .. "' AND " .. _UPVALUE1_.addressFamily .. " = " .. A1_561, _UPVALUE1_.wan_ipAddress) then
    return _UPVALUE4_.REMOTEENDPOINT_OPTION2IP
  end
  return _UPVALUE5_.SUCCESS
end
function authKeyValidate(A0_562, A1_563)
  local L2_564
  if A1_563 == 2 then
    if A0_562 ~= 16 then
      L2_564 = _UPVALUE0_
      L2_564 = L2_564.AUTH_KEY_LIMIT_MD5
      return L2_564
    end
  elseif A1_563 == 4 then
    if A0_562 ~= 20 then
      L2_564 = _UPVALUE0_
      L2_564 = L2_564.AUTH_KEY_LIMIT_SHA1
      return L2_564
    end
  elseif A1_563 == 8 then
    if A0_562 ~= 32 then
      L2_564 = _UPVALUE0_
      L2_564 = L2_564.AUTH_KEY_LIMIT_SHA2256
      return L2_564
    end
  elseif A1_563 == 16 then
    if A0_562 ~= 48 then
      L2_564 = _UPVALUE0_
      L2_564 = L2_564.AUTH_KEY_LIMIT_SHA2384
      return L2_564
    end
  elseif A1_563 == 32 then
    if A0_562 ~= 64 then
      L2_564 = _UPVALUE0_
      L2_564 = L2_564.AUTH_KEY_LIMIT_SHA2512
      return L2_564
    end
  elseif A1_563 == 64 and A0_562 ~= 28 then
    L2_564 = _UPVALUE0_
    L2_564 = L2_564.AUTH_KEY_LIMIT_SHA2224
    return L2_564
  end
  L2_564 = _UPVALUE1_
  L2_564 = L2_564.SUCCESS
  return L2_564
end
function validRange(A0_565, A1_566)
  local L2_567, L3_568, L4_569, L5_570
  L2_567 = string
  L2_567 = L2_567.reverse
  L3_568 = A0_565
  L2_567 = L2_567(L3_568)
  L3_568 = string
  L3_568 = L3_568.reverse
  L4_569 = A1_566
  L3_568 = L3_568(L4_569)
  L4_569 = string
  L4_569 = L4_569.find
  L5_570 = L2_567
  L4_569 = L4_569(L5_570, ":")
  L5_570 = string
  L5_570 = L5_570.find
  L5_570 = L5_570(L3_568, ":")
  if string.sub(L2_567, L4_569) == string.sub(L3_568, L5_570) then
    return _UPVALUE0_.SUCCESS
  else
    return _UPVALUE0_.FAILURE
  end
end
function backupPolicyGet(A0_571)
  local L1_572
  L1_572 = db
  L1_572 = L1_572.getAttribute
  L1_572 = L1_572(_UPVALUE0_, _UPVALUE1_.backupPolicyName, A0_571, _UPVALUE1_.policyName)
  if L1_572 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L1_572
end
function policyDisableAll()
  local L0_573, L1_574
  L1_574 = db
  L1_574 = L1_574.getTable
  L1_574 = L1_574(_UPVALUE0_, false)
  for _FORV_5_, _FORV_6_ in pairs(L1_574) do
    L0_573 = ipsecVPNPolicyEnable(_FORV_6_[_UPVALUE1_], false)
    if L0_573 ~= _UPVALUE2_.SUCCESS then
      return _UPVALUE2_.FAILURE
    end
  end
  return _UPVALUE2_.SUCCESS
end
function existingVPNPolicyCheck(A0_575, A1_576)
  for _FORV_5_, _FORV_6_ in pairs(A1_576) do
    if _FORV_6_["IpsecVPNPolicy.VPNPolicyName"] == A0_575 then
      return 1
    end
  end
  return 0
end
function getSourceIPAddressForPolicy(A0_577, A1_578)
  local L2_579
  if A0_577 == _UPVALUE0_ then
    interfaceName = "LAN"
    L2_579 = db.getAttributeWhere(ifStaticTable, _UPVALUE1_.LogicalIfName .. "='" .. interfaceName .. "' AND " .. _UPVALUE1_.addrFamily .. "= 2", _UPVALUE1_.StaticIp)
  else
    L2_579 = _UPVALUE2_.getSourceIPAddress(A1_578)
  end
  return L2_579
end
