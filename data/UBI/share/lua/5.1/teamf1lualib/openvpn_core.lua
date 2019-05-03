local L0_0
L0_0 = module
L0_0("com.teamf1.core.vpn.openvpn", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/openvpn_returnCodes")
L0_0 = require
L0_0("x509Lib")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
openvpnTable = "OpenVpn"
;({}).feature = "ServerEnable"
;({}).mode = "OpenVpnMode"
;({}).port = "Port"
;({}).serverIp = "RemoteIp"
;({}).serverIpType = "RemoteIpType"
;({}).failoverserverIp = "FailoverRemoteIp"
;({}).failoverserverIpType = "FailoverRemoteIpType"
;({}).network = "OpenVpnNetwork"
;({}).networkMask = "OpenVpnNetmask"
;({}).tunnelType = "TunnelType"
;({}).tunnelProtocol = "TunnelProtocol"
;({}).encryptionAlgorithm = "EncryptionAlgorithm"
;({}).crlEnabled = "BlockCertWithCRL"
;({}).hashAlgorithm = "HashAlgorithm"
;({}).clientToClient = "AllowClientToClient"
;({}).allowOnlyUserBasedAuth = "allowOnlyUserBasedAuth"
;({}).userBasedAuth = "userAuthSupportEnable"
;({}).userName = "UserName"
;({}).password = "Password"
;({}).duplicateCN = "duplicateCN"
;({}).tlsEnabled = "TlsEnabled"
;({}).authenticationType = "authServerId"
;({}).ptenable = "ptEnable"
;({}).ptuserName = "ptUserName"
;({}).ptpassword = "ptPassword"
;({}).ptclusterId = "ptClusterId"
;({}).certVer = "certificateVerification"
;({}).serverClientCerts = "serverClientCertsName"
;({}).tlsCertsName = "TlsCertsName"
;({}).crlCertsName = "CrlCertsName"
openvpnLanRoutesTable = "OpenVpnLanRoutes"
;({}).localNetwork = "Network"
;({}).localNetworkMask = "Netmask"
openvpnGwRoutesTable = "OpenVpnGwRoutes"
;({}).remoteNetwork = "Network"
;({}).remoteNetworkname = "CommonName"
;({}).remoteNetworkMask = "Netmask"
openvpnCertificatesTable = "OpenvpnCertificates"
;({}).certificateType = "certType"
;({}).certificateData = "certData"
;({}).certificateSubjectName = "subjectName"
OpenvpnClientConfigTable = "OpenvpnClientConfig"
;({}).clientName = "clientName"
authServer = {}
authServer.Local = "local"
authServer.radius = "radius"
authServer.ldap = "ldap"
authServer.pop3 = "pop3"
authServer.activeDirectory = "activeDirectory"
authServer.ntDomain = "ntDomain"
authServer.radiusType = {}
authServer.radiusType.pap = "pap"
authServer.radiusType.chap = "chap"
authServer.radiusType.mschap = "ms-chap"
authServer.radiusType.mschapv1 = "ms-chapv2"
serverValue = {}
serverValue[authServer.Local] = "0"
serverValue[authServer.ldap] = "20"
serverValue[authServer.pop3] = "50"
serverValue[authServer.radiusType.pap] = "11"
serverValue[authServer.radiusType.chap] = "12"
serverValue[authServer.radiusType.mschap] = "13"
serverValue[authServer.radiusType.mschapv1] = "14"
serverValue[authServer.activeDirectory] = "30"
serverValue[authServer.ntDomain] = "40"
ldapTable = "LDAPSettings"
ntdomainTable = "NTDomainSettings"
radiusTable = "radiusClient"
adServerTable = "ActiveDirectorySettings"
popTable = "POPProfiles"
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
else
end
function isfeatureEnabled()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(openvpnTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.feature)
  if L0_1 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L0_1
end
function isfeatureEnabledNext(A0_2)
  local L2_3, L3_4
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.NOT_SUPPORTED
  L3_4 = 0
  return L2_3, L3_4, 0
end
function featureEnable(A0_5)
  if db.setAttribute(openvpnTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.feature, _UPVALUE3_) == _UPVALUE4_.FALSE then
    return _UPVALUE4_.FAILURE, A0_5
  end
  return _UPVALUE4_.SUCCESS, A0_5
end
function featureDisable(A0_6)
  if db.setAttribute(openvpnTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.feature, _UPVALUE3_) == _UPVALUE4_.FALSE then
    return _UPVALUE4_.FAILURE, A0_6
  end
  return _UPVALUE4_.SUCCESS, A0_6
end
function modeGet()
  local L0_7
  L0_7 = db
  L0_7 = L0_7.getAttribute
  L0_7 = L0_7(openvpnTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.mode)
  if L0_7 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L0_7
end
function modeGetNext(A0_8)
  local L2_9, L3_10
  L2_9 = _UPVALUE0_
  L2_9 = L2_9.NOT_SUPPORTED
  L3_10 = 0
  return L2_9, L3_10, 0
end
function modeSet(A0_11, A1_12)
  if A1_12 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_12) ~= _UPVALUE1_ and tonumber(A1_12) ~= _UPVALUE2_ and tonumber(A1_12) ~= _UPVALUE3_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(openvpnTable, _UPVALUE4_, _UPVALUE5_, _UPVALUE6_.mode, A1_12) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_11
  end
  return _UPVALUE0_.SUCCESS, A0_11
end
function ptEnableSet(A0_13, A1_14, A2_15, A3_16, A4_17)
  if A1_14 == _UPVALUE0_.NIL then
    return _UPVALUE1_.INVALID_PTENABLE
  end
  if db.setAttribute(openvpnTable, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.ptenable, A1_14) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_13
  end
  if A1_14 == _UPVALUE5_ then
    if A2_15 == _UPVALUE0_.NIL then
      return _UPVALUE1_.INVALID_PTUSERNAME
    end
    if db.setAttribute(openvpnTable, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.ptuserName, A2_15) == _UPVALUE0_.FALSE then
      return _UPVALUE0_.FAILURE, A0_13
    end
    if A3_16 == _UPVALUE0_.NIL then
      return _UPVALUE1_.INVALID_PTPASSWORD
    end
    if db.setAttribute(openvpnTable, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.ptpassword, A3_16) == _UPVALUE0_.FALSE then
      return _UPVALUE0_.FAILURE, A0_13
    end
    if A4_17 == _UPVALUE0_.NIL then
      return _UPVALUE1_.INVALID_PTCLUSTERID
    end
    if db.setAttribute(openvpnTable, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.ptclusterId, A4_17) == _UPVALUE0_.FALSE then
      return _UPVALUE0_.FAILURE, A0_13
    end
  end
  return _UPVALUE0_.SUCCESS, A0_13
end
function portGet()
  local L0_18
  L0_18 = db
  L0_18 = L0_18.getAttribute
  L0_18 = L0_18(openvpnTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.port)
  if L0_18 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L0_18
end
function ptEnableGet()
  local L0_19, L1_20, L2_21, L3_22
  L0_19 = db.getAttribute(openvpnTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.ptenable)
  if L0_19 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  if L0_19 == _UPVALUE4_ then
    L1_20 = db.getAttribute(openvpnTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.ptuserName)
    if L1_20 == _UPVALUE3_.NIL then
      return _UPVALUE3_.FAILURE
    end
    L2_21 = db.getAttribute(openvpnTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.ptpassword)
    if L2_21 == _UPVALUE3_.NIL then
      return _UPVALUE3_.FAILURE
    end
    L3_22 = db.getAttribute(openvpnTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.ptclusterId)
    if L3_22 == _UPVALUE3_.NIL then
      return _UPVALUE3_.FAILURE
    end
  end
  return _UPVALUE3_.SUCCESS, 1, L0_19, L1_20, L2_21, L3_22
end
function portGetNext(A0_23)
  local L2_24, L3_25
  L2_24 = _UPVALUE0_
  L2_24 = L2_24.NOT_SUPPORTED
  L3_25 = 0
  return L2_24, L3_25, 0
end
function tlsEnabledGet()
  local L0_26
  L0_26 = db
  L0_26 = L0_26.getAttribute
  L0_26 = L0_26(openvpnTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.tlsEnabled)
  if L0_26 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L0_26
end
function crlEnabledGet()
  local L0_27
  L0_27 = db
  L0_27 = L0_27.getAttribute
  L0_27 = L0_27(openvpnTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.crlEnabled)
  if L0_27 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE, "1", "0"
  end
  if L0_27 == "1" then
    L0_27 = "0"
  else
    L0_27 = "1"
  end
  return _UPVALUE3_.SUCCESS, 1, L0_27
end
function portSet(A0_28, A1_29)
  local L2_30, L3_31
  if A1_29 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_29) < _UPVALUE1_ or tonumber(A1_29) > _UPVALUE2_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(openvpnTable, _UPVALUE3_, _UPVALUE4_, _UPVALUE5_.port, A1_29) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, L3_31
  end
  return _UPVALUE0_.SUCCESS, L3_31
end
function tlsEnabledSet(A0_32, A1_33)
  local L2_34, L3_35
  if A1_33 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(openvpnTable, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.tlsEnabled, A1_33) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, L3_35
  end
  return _UPVALUE0_.SUCCESS, L3_35
end
function serverIpGet()
  local L0_36
  L0_36 = db
  L0_36 = L0_36.getAttribute
  L0_36 = L0_36(openvpnTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.serverIp)
  if L0_36 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L0_36
end
function serverIpGetNext(A0_37)
  local L2_38, L3_39
  L2_38 = _UPVALUE0_
  L2_38 = L2_38.NOT_SUPPORTED
  L3_39 = 0
  return L2_38, L3_39, 0
end
function serverIpSet(A0_40, A1_41)
  local L2_42, L3_43
  if A1_41 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_42, A0_40, L3_43 = modeGet()
  if L2_42 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(L3_43) ~= _UPVALUE1_ then
    return _UPVALUE0_.NOT_SUPPORTED
  end
  L2_42 = _UPVALUE2_.ipAddressCheck("2", A1_41)
  if L2_42 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(openvpnTable, _UPVALUE3_, _UPVALUE4_, _UPVALUE5_.serverIp, A1_41) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_40
  end
  return _UPVALUE0_.SUCCESS, A0_40
end
function networkGet()
  local L0_44
  L0_44 = db
  L0_44 = L0_44.getAttribute
  L0_44 = L0_44(openvpnTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.network)
  if L0_44 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L0_44
end
function networkGetNext(A0_45)
  local L2_46, L3_47
  L2_46 = _UPVALUE0_
  L2_46 = L2_46.NOT_SUPPORTED
  L3_47 = 0
  return L2_46, L3_47, 0
end
function networkSet(A0_48, A1_49)
  local L2_50, L3_51, L4_52
  if A1_49 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_50, L3_51, L4_52 = modeGet()
  if L2_50 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(L4_52) ~= _UPVALUE1_ then
    return _UPVALUE0_.NOT_SUPPORTED
  end
  L2_50 = _UPVALUE2_.ipAddressCheck("2", A1_49)
  if L2_50 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(openvpnTable, _UPVALUE3_, _UPVALUE4_, _UPVALUE5_.network, A1_49) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, L3_51
  end
  return _UPVALUE0_.SUCCESS, L3_51
end
function networkMaskGet()
  local L0_53
  L0_53 = db
  L0_53 = L0_53.getAttribute
  L0_53 = L0_53(openvpnTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.networkMask)
  if L0_53 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L0_53
end
function networkMaskGetNext(A0_54)
  local L2_55, L3_56
  L2_55 = _UPVALUE0_
  L2_55 = L2_55.NOT_SUPPORTED
  L3_56 = 0
  return L2_55, L3_56, 0
end
function networkMaskSet(A0_57, A1_58)
  local L2_59, L3_60
  if A1_58 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_59, A0_57, L3_60 = modeGet()
  if L2_59 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(L3_60) ~= _UPVALUE1_ then
    return _UPVALUE0_.NOT_SUPPORTED
  end
  L2_59 = _UPVALUE2_.ipAddressCheck("2", A1_58)
  if L2_59 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(openvpnTable, _UPVALUE3_, _UPVALUE4_, _UPVALUE5_.networkMask, A1_58) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_57
  end
  return _UPVALUE0_.SUCCESS, A0_57
end
function tunnelTypeGet()
  local L0_61
  L0_61 = db
  L0_61 = L0_61.getAttribute
  L0_61 = L0_61(openvpnTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.tunnelType)
  if L0_61 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L0_61
end
function tunnelTypeGetNext(A0_62)
  local L2_63, L3_64
  L2_63 = _UPVALUE0_
  L2_63 = L2_63.NOT_SUPPORTED
  L3_64 = 0
  return L2_63, L3_64, 0
end
function tunnelTypeSet(A0_65, A1_66)
  local L2_67, L3_68
  if A1_66 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_66) ~= _UPVALUE1_ and tonumber(A1_66) ~= _UPVALUE2_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_67, A0_65, L3_68 = modeGet()
  if L2_67 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(L3_68) ~= _UPVALUE3_ then
    return _UPVALUE0_.NOT_SUPPORTED
  end
  if db.setAttribute(openvpnTable, _UPVALUE4_, _UPVALUE5_, _UPVALUE6_.tunnelType, A1_66) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_65
  end
  return _UPVALUE0_.SUCCESS, A0_65
end
function isclientToClientEnabled()
  local L0_69
  L0_69 = db
  L0_69 = L0_69.getAttribute
  L0_69 = L0_69(openvpnTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.clientToClient)
  if L0_69 == nil then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L0_69
end
function isclientToClientEnabledNext(A0_70)
  local L2_71, L3_72
  L2_71 = _UPVALUE0_
  L2_71 = L2_71.NOT_SUPPORTED
  L3_72 = A0_70
  return L2_71, L3_72, clientToClient
end
function clientToClientEnable(A0_73)
  if db.setAttribute(openvpnTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.clientToClient, _UPVALUE3_) == _UPVALUE4_.FALSE then
    return _UPVALUE4_.FAILURE, A0_73
  end
  return _UPVALUE4_.SUCCESS, A0_73
end
function clientToClientDisable(A0_74)
  if db.setAttribute(openvpnTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.clientToClient, _UPVALUE3_) == _UPVALUE4_.FALSE then
    return _UPVALUE4_.FAILURE, A0_74
  end
  return _UPVALUE4_.SUCCESS, A0_74
end
function tunnelProtocolGet()
  local L0_75
  L0_75 = db
  L0_75 = L0_75.getAttribute
  L0_75 = L0_75(openvpnTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.tunnelProtocol)
  if L0_75 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L0_75
end
function tunnelProtocolGetNext(A0_76)
  local L2_77, L3_78
  L2_77 = _UPVALUE0_
  L2_77 = L2_77.NOT_SUPPORTED
  L3_78 = 0
  return L2_77, L3_78, 0
end
function tunnelProtocolSet(A0_79, A1_80)
  local L2_81, L3_82
  if A1_80 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_80) ~= _UPVALUE1_ and tonumber(A1_80) ~= _UPVALUE2_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_81, A0_79, L3_82 = modeGet()
  if L2_81 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(L3_82) ~= _UPVALUE3_ and tonumber(L3_82) ~= _UPVALUE4_ then
    return _UPVALUE0_.NOT_SUPPORTED
  end
  if db.setAttribute(openvpnTable, _UPVALUE5_, _UPVALUE6_, _UPVALUE7_.tunnelProtocol, A1_80) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_79
  end
  return _UPVALUE0_.SUCCESS, A0_79
end
function encryptionAlgorithmGet()
  local L0_83
  L0_83 = db
  L0_83 = L0_83.getAttribute
  L0_83 = L0_83(openvpnTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.encryptionAlgorithm)
  if L0_83 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L0_83
end
function encryptionAlgorithmGetNext(A0_84)
  local L2_85, L3_86
  L2_85 = _UPVALUE0_
  L2_85 = L2_85.NOT_SUPPORTED
  L3_86 = 0
  return L2_85, L3_86, 0
end
function encryptionAlgorithmSet(A0_87, A1_88)
  local L2_89, L3_90
  if A1_88 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_88) ~= _UPVALUE1_ and tonumber(A1_88) ~= _UPVALUE2_ and tonumber(A1_88) ~= _UPVALUE3_ and tonumber(A1_88) ~= _UPVALUE4_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_89, A0_87, L3_90 = modeGet()
  if L2_89 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(L3_90) ~= _UPVALUE5_ and tonumber(L3_90) ~= _UPVALUE6_ then
    return _UPVALUE0_.NOT_SUPPORTED
  end
  if db.setAttribute(openvpnTable, _UPVALUE7_, _UPVALUE8_, _UPVALUE9_.encryptionAlgorithm, A1_88) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_87
  end
  return _UPVALUE0_.SUCCESS, A0_87
end
function hashAlgorithmGet()
  local L0_91
  L0_91 = db
  L0_91 = L0_91.getAttribute
  L0_91 = L0_91(openvpnTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.hashAlgorithm)
  if L0_91 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L0_91
end
function hashAlgorithmGetNext(A0_92)
  local L2_93, L3_94
  L2_93 = _UPVALUE0_
  L2_93 = L2_93.NOT_SUPPORTED
  L3_94 = 0
  return L2_93, L3_94, 0
end
function hashAlgorithmSet(A0_95, A1_96)
  local L2_97, L3_98
  if A1_96 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_96) ~= _UPVALUE1_ and tonumber(A1_96) ~= _UPVALUE2_ and tonumber(A1_96) ~= _UPVALUE3_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_97, A0_95, L3_98 = modeGet()
  if L2_97 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(L3_98) ~= _UPVALUE4_ and tonumber(L3_98) ~= _UPVALUE5_ then
    return _UPVALUE0_.NOT_SUPPORTED
  end
  if db.setAttribute(openvpnTable, _UPVALUE6_, _UPVALUE7_, _UPVALUE8_.hashAlgorithm, A1_96) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_95
  end
  return _UPVALUE0_.SUCCESS, A0_95
end
function localNetworkGet()
  local L0_99, L1_100
  L0_99 = db
  L0_99 = L0_99.getNextRowId
  L1_100 = _UPVALUE0_
  L0_99 = L0_99(L1_100, openvpnLanRoutesTable)
  L1_100 = db
  L1_100 = L1_100.getAttribute
  L1_100 = L1_100(openvpnLanRoutesTable, _UPVALUE1_, L0_99, _UPVALUE2_.localNetwork)
  if L1_100 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_99, L1_100
end
function localNetworkGetNext(A0_101)
  local L1_102, L2_103
  L1_102 = _UPVALUE0_
  L1_102 = L1_102.NIL
  if A0_101 ~= L1_102 then
    L1_102 = tonumber
    L2_103 = A0_101
    L1_102 = L1_102(L2_103)
    L2_103 = _UPVALUE0_
    L2_103 = L2_103.NIL
  elseif L1_102 == L2_103 then
    L1_102 = _UPVALUE0_
    L1_102 = L1_102.INVALID_ARGUMENT
    return L1_102
  end
  L1_102 = db
  L1_102 = L1_102.existsRow
  L2_103 = openvpnLanRoutesTable
  L1_102 = L1_102(L2_103, _UPVALUE1_, A0_101)
  L2_103 = _UPVALUE0_
  L2_103 = L2_103.FALSE
  if L1_102 == L2_103 then
    L1_102 = _UPVALUE0_
    L1_102 = L1_102.INVALID_ARGUMENT
    return L1_102
  end
  L1_102 = db
  L1_102 = L1_102.getNextRowId
  L2_103 = A0_101
  L1_102 = L1_102(L2_103, openvpnLanRoutesTable)
  L2_103 = _UPVALUE0_
  L2_103 = L2_103.NIL
  if L1_102 == L2_103 then
    L2_103 = _UPVALUE0_
    L2_103 = L2_103.TABLE_IS_FULL
    return L2_103
  end
  L2_103 = db
  L2_103 = L2_103.getAttribute
  L2_103 = L2_103(openvpnLanRoutesTable, _UPVALUE1_, L1_102, _UPVALUE2_.localNetwork)
  if L2_103 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_102
  end
  return _UPVALUE0_.SUCCESS, L1_102, L2_103
end
function localNetworkSet(A0_104, A1_105)
  local L2_106
  if A0_104 == _UPVALUE0_.NIL or tonumber(A0_104) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(openvpnLanRoutesTable, _UPVALUE1_, A0_104) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_105 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_106 = _UPVALUE2_.ipAddressCheck("2", A1_105)
  if L2_106 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(openvpnLanRoutesTable, _UPVALUE1_, A0_104, _UPVALUE3_.localNetwork, A1_105) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_104
  end
  return _UPVALUE0_.SUCCESS, A0_104
end
function localNetworkMaskGet()
  local L0_107, L1_108
  L0_107 = db
  L0_107 = L0_107.getNextRowId
  L1_108 = _UPVALUE0_
  L0_107 = L0_107(L1_108, openvpnLanRoutesTable)
  L1_108 = db
  L1_108 = L1_108.getAttribute
  L1_108 = L1_108(openvpnLanRoutesTable, _UPVALUE1_, L0_107, _UPVALUE2_.localNetworkMask)
  if L1_108 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_107, L1_108
end
function localNetworkMaskGetNext(A0_109)
  local L1_110, L2_111
  L1_110 = _UPVALUE0_
  L1_110 = L1_110.NIL
  if A0_109 ~= L1_110 then
    L1_110 = tonumber
    L2_111 = A0_109
    L1_110 = L1_110(L2_111)
    L2_111 = _UPVALUE0_
    L2_111 = L2_111.NIL
  elseif L1_110 == L2_111 then
    L1_110 = _UPVALUE0_
    L1_110 = L1_110.INVALID_ARGUMENT
    return L1_110
  end
  L1_110 = db
  L1_110 = L1_110.existsRow
  L2_111 = openvpnLanRoutesTable
  L1_110 = L1_110(L2_111, _UPVALUE1_, A0_109)
  L2_111 = _UPVALUE0_
  L2_111 = L2_111.FALSE
  if L1_110 == L2_111 then
    L1_110 = _UPVALUE0_
    L1_110 = L1_110.INVALID_ARGUMENT
    return L1_110
  end
  L1_110 = db
  L1_110 = L1_110.getNextRowId
  L2_111 = A0_109
  L1_110 = L1_110(L2_111, openvpnLanRoutesTable)
  L2_111 = _UPVALUE0_
  L2_111 = L2_111.NIL
  if L1_110 == L2_111 then
    L2_111 = _UPVALUE0_
    L2_111 = L2_111.TABLE_IS_FULL
    return L2_111
  end
  L2_111 = db
  L2_111 = L2_111.getAttribute
  L2_111 = L2_111(openvpnLanRoutesTable, _UPVALUE1_, L1_110, _UPVALUE2_.localNetworkMask)
  if L2_111 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_110
  end
  return _UPVALUE0_.SUCCESS, L1_110, L2_111
end
function localNetworkMaskSet(A0_112, A1_113)
  local L2_114
  if A0_112 == _UPVALUE0_.NIL or tonumber(A0_112) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(openvpnLanRoutesTable, _UPVALUE1_, A0_112) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_113 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_114 = _UPVALUE2_.ipAddressCheck("2", A1_113)
  if L2_114 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(openvpnLanRoutesTable, _UPVALUE1_, A0_112, _UPVALUE3_.localNetworkMask, A1_113) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_112
  end
  return _UPVALUE0_.SUCCESS, A0_112
end
function remoteNetworkGet()
  local L0_115, L1_116
  L0_115 = db
  L0_115 = L0_115.getNextRowId
  L1_116 = _UPVALUE0_
  L0_115 = L0_115(L1_116, openvpnGwRoutesTable)
  L1_116 = db
  L1_116 = L1_116.getAttribute
  L1_116 = L1_116(openvpnGwRoutesTable, _UPVALUE1_, L0_115, _UPVALUE2_.remoteNetwork)
  if L1_116 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_115, L1_116
end
function remoteNetworkGetNext(A0_117)
  local L1_118, L2_119
  L1_118 = _UPVALUE0_
  L1_118 = L1_118.NIL
  if A0_117 ~= L1_118 then
    L1_118 = tonumber
    L2_119 = A0_117
    L1_118 = L1_118(L2_119)
    L2_119 = _UPVALUE0_
    L2_119 = L2_119.NIL
  elseif L1_118 == L2_119 then
    L1_118 = _UPVALUE0_
    L1_118 = L1_118.INVALID_ARGUMENT
    return L1_118
  end
  L1_118 = db
  L1_118 = L1_118.existsRow
  L2_119 = openvpnGwRoutesTable
  L1_118 = L1_118(L2_119, _UPVALUE1_, A0_117)
  L2_119 = _UPVALUE0_
  L2_119 = L2_119.FALSE
  if L1_118 == L2_119 then
    L1_118 = _UPVALUE0_
    L1_118 = L1_118.INVALID_ARGUMENT
    return L1_118
  end
  L1_118 = db
  L1_118 = L1_118.getNextRowId
  L2_119 = A0_117
  L1_118 = L1_118(L2_119, openvpnGwRoutesTable)
  L2_119 = _UPVALUE0_
  L2_119 = L2_119.NIL
  if L1_118 == L2_119 then
    L2_119 = _UPVALUE0_
    L2_119 = L2_119.TABLE_IS_FULL
    return L2_119
  end
  L2_119 = db
  L2_119 = L2_119.getAttribute
  L2_119 = L2_119(openvpnGwRoutesTable, _UPVALUE1_, L1_118, _UPVALUE2_.remoteNetwork)
  if L2_119 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_118
  end
  return _UPVALUE0_.SUCCESS, L1_118, L2_119
end
function remoteNetworkSet(A0_120, A1_121)
  local L2_122
  if A0_120 == _UPVALUE0_.NIL or tonumber(A0_120) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(openvpnGwRoutesTable, _UPVALUE1_, A0_120) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_121 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_122 = _UPVALUE2_.ipAddressCheck("2", A1_121)
  if L2_122 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(openvpnGwRoutesTable, _UPVALUE1_, A0_120, _UPVALUE3_.remoteNetwork, A1_121) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_120
  end
  return _UPVALUE0_.SUCCESS, A0_120
end
function remoteNetworknameGet()
  local L0_123, L1_124
  L0_123 = db
  L0_123 = L0_123.getNextRowId
  L1_124 = _UPVALUE0_
  L0_123 = L0_123(L1_124, openvpnGwRoutesTable)
  L1_124 = db
  L1_124 = L1_124.getAttribute
  L1_124 = L1_124(openvpnGwRoutesTable, _UPVALUE1_, L0_123, _UPVALUE2_.remoteNetworkname)
  if L1_124 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_123, L1_124
end
function remoteNetworknameGetNext(A0_125)
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
  L2_127 = openvpnGwRoutesTable
  L1_126 = L1_126(L2_127, _UPVALUE1_, A0_125)
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
  L1_126 = L1_126(L2_127, openvpnGwRoutesTable)
  L2_127 = _UPVALUE0_
  L2_127 = L2_127.NIL
  if L1_126 == L2_127 then
    L2_127 = _UPVALUE0_
    L2_127 = L2_127.TABLE_IS_FULL
    return L2_127
  end
  L2_127 = db
  L2_127 = L2_127.getAttribute
  L2_127 = L2_127(openvpnGwRoutesTable, _UPVALUE1_, L1_126, _UPVALUE2_.remoteNetworkname)
  if L2_127 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_126
  end
  return _UPVALUE0_.SUCCESS, L1_126, L2_127
end
function remoteNetworknameSet(A0_128, A1_129)
  if A0_128 == _UPVALUE0_.NIL or tonumber(A0_128) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(openvpnGwRoutesTable, _UPVALUE1_, A0_128) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_129 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(openvpnGwRoutesTable, _UPVALUE1_, A0_128, _UPVALUE2_.remoteNetworkname, A1_129) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_128
  end
  return _UPVALUE0_.SUCCESS, A0_128
end
function remoteNetworkMaskGet()
  local L0_130, L1_131
  L0_130 = db
  L0_130 = L0_130.getNextRowId
  L1_131 = _UPVALUE0_
  L0_130 = L0_130(L1_131, openvpnGwRoutesTable)
  L1_131 = db
  L1_131 = L1_131.getAttribute
  L1_131 = L1_131(openvpnGwRoutesTable, _UPVALUE1_, L0_130, _UPVALUE2_.remoteNetworkMask)
  if L1_131 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_130, L1_131
end
function remoteNetworkMaskGetNext(A0_132)
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
  L2_134 = openvpnGwRoutesTable
  L1_133 = L1_133(L2_134, _UPVALUE1_, A0_132)
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
  L1_133 = L1_133(L2_134, openvpnGwRoutesTable)
  L2_134 = _UPVALUE0_
  L2_134 = L2_134.NIL
  if L1_133 == L2_134 then
    L2_134 = _UPVALUE0_
    L2_134 = L2_134.TABLE_IS_FULL
    return L2_134
  end
  L2_134 = db
  L2_134 = L2_134.getAttribute
  L2_134 = L2_134(openvpnGwRoutesTable, _UPVALUE1_, L1_133, _UPVALUE2_.remoteNetworkMask)
  if L2_134 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_133
  end
  return _UPVALUE0_.SUCCESS, L1_133, L2_134
end
function remoteNetworkMaskSet(A0_135, A1_136)
  local L2_137
  if A0_135 == _UPVALUE0_.NIL or tonumber(A0_135) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(openvpnGwRoutesTable, _UPVALUE1_, A0_135) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_136 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_137 = _UPVALUE2_.ipAddressCheck("2", A1_136)
  if L2_137 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(openvpnGwRoutesTable, _UPVALUE1_, A0_135, _UPVALUE3_.remoteNetworkMask, A1_136) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_135
  end
  return _UPVALUE0_.SUCCESS, A0_135
end
function certificateDataGet()
  local L0_138, L1_139
  L0_138 = db
  L0_138 = L0_138.getNextRowId
  L1_139 = _UPVALUE0_
  L0_138 = L0_138(L1_139, openvpnCertificatesTable)
  L1_139 = db
  L1_139 = L1_139.getAttribute
  L1_139 = L1_139(openvpnCertificatesTable, _UPVALUE1_, L0_138, _UPVALUE2_.certificateData)
  if L1_139 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_138, L1_139
end
function certificateDataGetNext(A0_140)
  local L1_141, L2_142
  L1_141 = _UPVALUE0_
  L1_141 = L1_141.NIL
  if A0_140 ~= L1_141 then
    L1_141 = tonumber
    L2_142 = A0_140
    L1_141 = L1_141(L2_142)
    L2_142 = _UPVALUE0_
    L2_142 = L2_142.NIL
  elseif L1_141 == L2_142 then
    L1_141 = _UPVALUE0_
    L1_141 = L1_141.INVALID_ARGUMENT
    return L1_141
  end
  L1_141 = db
  L1_141 = L1_141.existsRow
  L2_142 = openvpnCertificatesTable
  L1_141 = L1_141(L2_142, _UPVALUE1_, A0_140)
  L2_142 = _UPVALUE0_
  L2_142 = L2_142.FALSE
  if L1_141 == L2_142 then
    L1_141 = _UPVALUE0_
    L1_141 = L1_141.INVALID_ARGUMENT
    return L1_141
  end
  L1_141 = db
  L1_141 = L1_141.getNextRowId
  L2_142 = A0_140
  L1_141 = L1_141(L2_142, openvpnCertificatesTable)
  L2_142 = _UPVALUE0_
  L2_142 = L2_142.NIL
  if L1_141 == L2_142 then
    L2_142 = _UPVALUE0_
    L2_142 = L2_142.TABLE_IS_FULL
    return L2_142
  end
  L2_142 = db
  L2_142 = L2_142.getAttribute
  L2_142 = L2_142(openvpnCertificatesTable, _UPVALUE1_, L1_141, _UPVALUE2_.certificateData)
  if L2_142 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_140
  end
  return _UPVALUE0_.SUCCESS, L1_141, L2_142
end
function certificateDataSet(A0_143, A1_144)
  if A0_143 == _UPVALUE0_.NIL or tonumber(A0_143) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(openvpnCertificatesTable, _UPVALUE1_, A0_143) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_144 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(openvpnCertificatesTable, _UPVALUE1_, A0_143, _UPVALUE2_.certificateData, A1_144) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_143
  end
  return _UPVALUE0_.SUCCESS, A0_143
end
function certificateSubjectNameGet()
  local L0_145, L1_146
  L0_145 = db
  L0_145 = L0_145.getNextRowId
  L1_146 = _UPVALUE0_
  L0_145 = L0_145(L1_146, openvpnCertificatesTable)
  L1_146 = db
  L1_146 = L1_146.getAttribute
  L1_146 = L1_146(openvpnCertificatesTable, _UPVALUE1_, L0_145, _UPVALUE2_.certificateSubjectName)
  if L1_146 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_145, L1_146
end
function certificateSubjectNameGetNext(A0_147)
  local L1_148, L2_149
  L1_148 = _UPVALUE0_
  L1_148 = L1_148.NIL
  if A0_147 ~= L1_148 then
    L1_148 = tonumber
    L2_149 = A0_147
    L1_148 = L1_148(L2_149)
    L2_149 = _UPVALUE0_
    L2_149 = L2_149.NIL
  elseif L1_148 == L2_149 then
    L1_148 = _UPVALUE0_
    L1_148 = L1_148.INVALID_ARGUMENT
    return L1_148
  end
  L1_148 = db
  L1_148 = L1_148.existsRow
  L2_149 = openvpnCertificatesTable
  L1_148 = L1_148(L2_149, _UPVALUE1_, A0_147)
  L2_149 = _UPVALUE0_
  L2_149 = L2_149.FALSE
  if L1_148 == L2_149 then
    L1_148 = _UPVALUE0_
    L1_148 = L1_148.INVALID_ARGUMENT
    return L1_148
  end
  L1_148 = db
  L1_148 = L1_148.getNextRowId
  L2_149 = A0_147
  L1_148 = L1_148(L2_149, openvpnCertificatesTable)
  L2_149 = _UPVALUE0_
  L2_149 = L2_149.NIL
  if L1_148 == L2_149 then
    L2_149 = _UPVALUE0_
    L2_149 = L2_149.TABLE_IS_FULL
    return L2_149
  end
  L2_149 = db
  L2_149 = L2_149.getAttribute
  L2_149 = L2_149(openvpnCertificatesTable, _UPVALUE1_, L1_148, _UPVALUE2_.certificateSubjectName)
  if L2_149 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_147
  end
  return _UPVALUE0_.SUCCESS, L1_148, L2_149
end
function certificateSubjectNameSet(A0_150, A1_151)
  if A0_150 == _UPVALUE0_.NIL or tonumber(A0_150) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(openvpnCertificatesTable, _UPVALUE1_, A0_150) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_151 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(openvpnCertificatesTable, _UPVALUE1_, A0_150, _UPVALUE2_.certificateSubjectName, A1_151) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_150
  end
  return _UPVALUE0_.SUCCESS, A0_150
end
function openVpnServerGet()
  local L0_152, L1_153, L2_154, L3_155, L4_156, L5_157, L6_158, L7_159, L8_160, L9_161, L10_162, L11_163, L12_164, L13_165, L14_166, L15_167, L16_168, L17_169, L18_170, L19_171, L20_172
  L0_152 = modeGet
  L2_154 = L0_152()
  L3_155 = _UPVALUE0_
  L3_155 = L3_155.SUCCESS
  if L0_152 ~= L3_155 then
    L3_155 = _UPVALUE0_
    L3_155 = L3_155.INVALID_ARGUMENT
    return L3_155
  end
  L3_155 = tonumber
  L4_156 = L2_154
  L3_155 = L3_155(L4_156)
  L4_156 = _UPVALUE1_
  if L3_155 ~= L4_156 then
    L3_155 = _UPVALUE2_
    L3_155 = L3_155.OPENVPN_SERVER_NOTCONFIGURED
    return L3_155
  end
  L3_155 = db
  L3_155 = L3_155.getRow
  L4_156 = openvpnTable
  L5_157 = _UPVALUE3_
  L6_158 = _UPVALUE4_
  L3_155 = L3_155(L4_156, L5_157, L6_158)
  L4_156 = _UPVALUE0_
  L4_156 = L4_156.NIL
  if L3_155 == L4_156 then
    L4_156 = _UPVALUE2_
    L4_156 = L4_156.OPENVPN_TABLE_NIL
    return L4_156
  end
  L4_156, L5_157, L6_158, L7_159, L8_160, L9_161, L10_162, L11_163, L12_164, L13_165, L14_166, L15_167, L16_168, L17_169 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L18_170 = openvpnTable
  L19_171 = "."
  L20_172 = _UPVALUE5_
  L20_172 = L20_172.network
  L18_170 = L18_170 .. L19_171 .. L20_172
  L4_156 = L3_155[L18_170]
  L18_170 = openvpnTable
  L19_171 = "."
  L20_172 = _UPVALUE5_
  L20_172 = L20_172.networkMask
  L18_170 = L18_170 .. L19_171 .. L20_172
  L5_157 = L3_155[L18_170]
  L18_170 = openvpnTable
  L19_171 = "."
  L20_172 = _UPVALUE5_
  L20_172 = L20_172.port
  L18_170 = L18_170 .. L19_171 .. L20_172
  L6_158 = L3_155[L18_170]
  L18_170 = openvpnTable
  L19_171 = "."
  L20_172 = _UPVALUE5_
  L20_172 = L20_172.tunnelType
  L18_170 = L18_170 .. L19_171 .. L20_172
  L7_159 = L3_155[L18_170]
  L18_170 = openvpnTable
  L19_171 = "."
  L20_172 = _UPVALUE5_
  L20_172 = L20_172.tunnelProtocol
  L18_170 = L18_170 .. L19_171 .. L20_172
  L8_160 = L3_155[L18_170]
  L18_170 = openvpnTable
  L19_171 = "."
  L20_172 = _UPVALUE5_
  L20_172 = L20_172.encryptionAlgorithm
  L18_170 = L18_170 .. L19_171 .. L20_172
  L9_161 = L3_155[L18_170]
  L18_170 = openvpnTable
  L19_171 = "."
  L20_172 = _UPVALUE5_
  L20_172 = L20_172.hashAlgorithm
  L18_170 = L18_170 .. L19_171 .. L20_172
  L10_162 = L3_155[L18_170]
  L18_170 = openvpnTable
  L19_171 = "."
  L20_172 = _UPVALUE5_
  L20_172 = L20_172.clientToClient
  L18_170 = L18_170 .. L19_171 .. L20_172
  L11_163 = L3_155[L18_170]
  L18_170 = openvpnTable
  L19_171 = "."
  L20_172 = _UPVALUE5_
  L20_172 = L20_172.tlsEnabled
  L18_170 = L18_170 .. L19_171 .. L20_172
  L12_164 = L3_155[L18_170]
  L18_170 = openvpnTable
  L19_171 = "."
  L20_172 = _UPVALUE5_
  L20_172 = L20_172.duplicateCN
  L18_170 = L18_170 .. L19_171 .. L20_172
  L13_165 = L3_155[L18_170]
  L18_170 = openvpnTable
  L19_171 = "."
  L20_172 = _UPVALUE5_
  L20_172 = L20_172.userBasedAuth
  L18_170 = L18_170 .. L19_171 .. L20_172
  L18_170 = L3_155[L18_170]
  userBasedAuth = L18_170
  L18_170 = openvpnTable
  L19_171 = "."
  L20_172 = _UPVALUE5_
  L20_172 = L20_172.authenticationType
  L18_170 = L18_170 .. L19_171 .. L20_172
  L18_170 = L3_155[L18_170]
  L19_171, L20_172 = nil, nil
  for _FORV_24_, _FORV_25_ in pairs(serverValue) do
    if _FORV_25_ == L18_170 then
      L19_171 = _FORV_24_
      break
    end
  end
  if L19_171 == authServer.radiusType.pap or L19_171 == authServer.radiusType.chap or L19_171 == authServer.radiusType.mschap or L19_171 == authServer.radiusType.mschapv1 then
    L20_172 = L19_171
    L19_171 = authServer.radius
  end
  L14_166 = L3_155[openvpnTable .. "." .. _UPVALUE5_.certVer]
  L15_167 = L3_155[openvpnTable .. "." .. _UPVALUE5_.serverClientCerts]
  L16_168 = L3_155[openvpnTable .. "." .. _UPVALUE5_.tlsCertsName]
  L17_169 = L3_155[openvpnTable .. "." .. _UPVALUE5_.crlCertsName]
  return _UPVALUE0_.SUCCESS, 1, L4_156, L5_157, L6_158, L7_159, L8_160, L9_161, L10_162, L11_163, L12_164, userBasedAuth, L13_165, L19_171, L20_172, L14_166, L15_167, L16_168, L17_169
end
function openVpnServerSet(A0_173, A1_174, A2_175, A3_176, A4_177, A5_178, A6_179, A7_180, A8_181, A9_182, A10_183, A11_184, A12_185, A13_186, A14_187, A15_188, A16_189, A17_190, A18_191, A19_192)
  local L20_193, L21_194, L22_195, L23_196, L24_197, L25_198, L26_199, L27_200
  L20_193 = {}
  L21_194 = {}
  L22_195 = openvpnTable
  L23_196 = "."
  L24_197 = _UPVALUE0_
  L24_197 = L24_197.feature
  L22_195 = L22_195 .. L23_196 .. L24_197
  L23_196 = _UPVALUE1_
  L20_193[L22_195] = L23_196
  L22_195 = openvpnTable
  L23_196 = "."
  L24_197 = _UPVALUE0_
  L24_197 = L24_197.mode
  L22_195 = L22_195 .. L23_196 .. L24_197
  L23_196 = _UPVALUE2_
  L20_193[L22_195] = L23_196
  L22_195 = _UPVALUE3_
  L22_195 = L22_195.NIL
  if A1_174 == L22_195 then
    L22_195 = _UPVALUE3_
    L22_195 = L22_195.INVALID_ARGUMENT
    return L22_195
  end
  L22_195 = _UPVALUE4_
  L22_195 = L22_195.ipAddressCheck
  L23_196 = "2"
  L24_197 = A1_174
  L22_195 = L22_195(L23_196, L24_197)
  valid = L22_195
  L22_195 = valid
  L23_196 = _UPVALUE3_
  L23_196 = L23_196.SUCCESS
  if L22_195 ~= L23_196 then
    L22_195 = _UPVALUE5_
    L22_195 = L22_195.OPENVPN_NETWORKIP_INVALID
    return L22_195
  end
  L22_195 = openvpnTable
  L23_196 = "."
  L24_197 = _UPVALUE0_
  L24_197 = L24_197.network
  L22_195 = L22_195 .. L23_196 .. L24_197
  L20_193[L22_195] = A1_174
  L22_195 = _UPVALUE3_
  L22_195 = L22_195.NIL
  if A2_175 == L22_195 then
    L22_195 = _UPVALUE3_
    L22_195 = L22_195.INVALID_ARGUMENT
    return L22_195
  end
  L22_195 = _UPVALUE4_
  L22_195 = L22_195.ipAddressCheck
  L23_196 = "2"
  L24_197 = A2_175
  L22_195 = L22_195(L23_196, L24_197)
  valid = L22_195
  L22_195 = valid
  L23_196 = _UPVALUE3_
  L23_196 = L23_196.SUCCESS
  if L22_195 ~= L23_196 then
    L22_195 = _UPVALUE5_
    L22_195 = L22_195.OPENVPN_NETWORKMASK_INVALID
    return L22_195
  end
  L22_195 = openvpnTable
  L23_196 = "."
  L24_197 = _UPVALUE0_
  L24_197 = L24_197.networkMask
  L22_195 = L22_195 .. L23_196 .. L24_197
  L20_193[L22_195] = A2_175
  L22_195 = _UPVALUE3_
  L22_195 = L22_195.NIL
  if A3_176 == L22_195 then
    L22_195 = _UPVALUE3_
    L22_195 = L22_195.INVALID_ARGUMENT
    return L22_195
  end
  L22_195 = tonumber
  L23_196 = A3_176
  L22_195 = L22_195(L23_196)
  L23_196 = _UPVALUE6_
  if not (L22_195 < L23_196) then
    L23_196 = _UPVALUE7_
  elseif L22_195 > L23_196 then
    L23_196 = _UPVALUE5_
    L23_196 = L23_196.OPENVPN_PORTNUMBER_INVALID
    return L23_196
  end
  L23_196 = openvpnTable
  L24_197 = "."
  L25_198 = _UPVALUE0_
  L25_198 = L25_198.port
  L23_196 = L23_196 .. L24_197 .. L25_198
  L20_193[L23_196] = A3_176
  L23_196 = _UPVALUE3_
  L23_196 = L23_196.NIL
  if A4_177 == L23_196 then
    L23_196 = _UPVALUE3_
    L23_196 = L23_196.INVALID_ARGUMENT
    return L23_196
  end
  L23_196 = tonumber
  L24_197 = A4_177
  L23_196 = L23_196(L24_197)
  L24_197 = _UPVALUE8_
  if L23_196 ~= L24_197 then
    L24_197 = _UPVALUE9_
    if L23_196 ~= L24_197 then
      L24_197 = _UPVALUE5_
      L24_197 = L24_197.OPENVPN_TUNNELTYPE_INVALID
      return L24_197
    end
  end
  L24_197 = openvpnTable
  L25_198 = "."
  L26_199 = _UPVALUE0_
  L26_199 = L26_199.tunnelType
  L24_197 = L24_197 .. L25_198 .. L26_199
  L20_193[L24_197] = A4_177
  L24_197 = _UPVALUE3_
  L24_197 = L24_197.NIL
  if A5_178 == L24_197 then
    L24_197 = _UPVALUE3_
    L24_197 = L24_197.INVALID_ARGUMENT
    return L24_197
  end
  L24_197 = tonumber
  L25_198 = A5_178
  L24_197 = L24_197(L25_198)
  L25_198 = _UPVALUE10_
  if L24_197 ~= L25_198 then
    L25_198 = _UPVALUE11_
    if L24_197 ~= L25_198 then
      L25_198 = _UPVALUE5_
      L25_198 = L25_198.OPENVPN_TUNNELPROTOCOL_INVALID
      return L25_198
    end
  end
  L25_198 = openvpnTable
  L26_199 = "."
  L27_200 = _UPVALUE0_
  L27_200 = L27_200.tunnelProtocol
  L25_198 = L25_198 .. L26_199 .. L27_200
  L20_193[L25_198] = A5_178
  L25_198 = _UPVALUE3_
  L25_198 = L25_198.NIL
  if A6_179 == L25_198 then
    L25_198 = _UPVALUE3_
    L25_198 = L25_198.INVALID_ARGUMENT
    return L25_198
  end
  L25_198 = tonumber
  L26_199 = A6_179
  L25_198 = L25_198(L26_199)
  L26_199 = _UPVALUE12_
  if L25_198 ~= L26_199 then
    L26_199 = _UPVALUE13_
    if L25_198 ~= L26_199 then
      L26_199 = _UPVALUE14_
      if L25_198 ~= L26_199 then
        L26_199 = _UPVALUE15_
        if L25_198 ~= L26_199 then
          L26_199 = _UPVALUE5_
          L26_199 = L26_199.OPENVPN_ENCRYPTIONALGO_INVALID
          return L26_199
        end
      end
    end
  end
  L26_199 = openvpnTable
  L27_200 = "."
  L26_199 = L26_199 .. L27_200 .. _UPVALUE0_.encryptionAlgorithm
  L20_193[L26_199] = A6_179
  L26_199 = _UPVALUE3_
  L26_199 = L26_199.NIL
  if A7_180 == L26_199 then
    L26_199 = _UPVALUE3_
    L26_199 = L26_199.INVALID_ARGUMENT
    return L26_199
  end
  L26_199 = tonumber
  L27_200 = A7_180
  L26_199 = L26_199(L27_200)
  L27_200 = _UPVALUE16_
  if L26_199 ~= L27_200 then
    L27_200 = _UPVALUE17_
    if L26_199 ~= L27_200 then
      L27_200 = _UPVALUE18_
      if L26_199 ~= L27_200 then
        L27_200 = _UPVALUE5_
        L27_200 = L27_200.OPENVPN_HASHALGO_INVALID
        return L27_200
      end
    end
  end
  L27_200 = openvpnTable
  L27_200 = L27_200 .. "." .. _UPVALUE0_.hashAlgorithm
  L20_193[L27_200] = A7_180
  L27_200 = _UPVALUE8_
  if L23_196 == L27_200 then
    L27_200 = _UPVALUE3_
    L27_200 = L27_200.NIL
    if A8_181 == L27_200 then
      L27_200 = _UPVALUE3_
      L27_200 = L27_200.INVALID_ARGUMENT
      return L27_200
    end
    L27_200 = _UPVALUE4_
    L27_200 = L27_200.isBoolean
    L27_200 = L27_200(A8_181)
    valid = L27_200
    L27_200 = valid
    if L27_200 ~= _UPVALUE3_.SUCCESS then
      L27_200 = _UPVALUE5_
      L27_200 = L27_200.OPENVPN_CLIENTTOCLIENT_COMMUNICATION_INVALID
      return L27_200
    end
    L27_200 = openvpnTable
    L27_200 = L27_200 .. "." .. _UPVALUE0_.clientToClient
    L20_193[L27_200] = A8_181
  end
  L27_200 = openvpnTable
  L27_200 = L27_200 .. "." .. _UPVALUE0_.tlsEnabled
  L20_193[L27_200] = A9_182
  L27_200 = _UPVALUE3_
  L27_200 = L27_200.NIL
  if A10_183 ~= L27_200 then
    if A10_183 == "0" then
      A10_183 = "1"
    else
      A10_183 = "0"
    end
    L27_200 = openvpnTable
    L27_200 = L27_200 .. "." .. _UPVALUE0_.crlEnabled
    L20_193[L27_200] = A10_183
  end
  L27_200 = _UPVALUE3_
  L27_200 = L27_200.NIL
  if A11_184 == L27_200 then
    L27_200 = _UPVALUE5_
    L27_200 = L27_200.INVALID_USERBASEDAUTH
    return L27_200
  end
  L27_200 = openvpnTable
  L27_200 = L27_200 .. "." .. _UPVALUE0_.userBasedAuth
  L20_193[L27_200] = A11_184
  L27_200 = openvpnTable
  L27_200 = L27_200 .. "." .. _UPVALUE0_.duplicateCN
  L20_193[L27_200] = A12_185
  if A12_185 == "1" then
    if A11_184 == "0" then
      L27_200 = _UPVALUE5_
      L27_200 = L27_200.ENABLE_USER_AUTH
      return L27_200
    end
    if A16_189 == "0" then
      L27_200 = _UPVALUE5_
      L27_200 = L27_200.ENABLE_CERTIFICATE_AUTH
      return L27_200
    end
  end
  if A11_184 ~= "1" then
    L27_200 = authServer
    L27_200 = L27_200.Local
    if A13_186 ~= L27_200 then
      L27_200 = authServer
      L27_200 = L27_200.radius
      if A13_186 ~= L27_200 then
        L27_200 = authServer
        L27_200 = L27_200.ldap
        if A13_186 ~= L27_200 then
          L27_200 = authServer
          L27_200 = L27_200.pop3
          if A13_186 ~= L27_200 then
            L27_200 = authServer
            L27_200 = L27_200.activeDirectory
            if A13_186 ~= L27_200 then
              L27_200 = authServer
              L27_200 = L27_200.ntDomain
              if A13_186 ~= L27_200 then
                L27_200 = _UPVALUE5_
                L27_200 = L27_200.AUTHTYPE_INVALID
                return L27_200
              end
            end
          end
        end
      end
    end
    L27_200 = authServer
    L27_200 = L27_200.radius
    if A13_186 == L27_200 then
      L27_200 = authServer
      L27_200 = L27_200.radiusType
      L27_200 = L27_200.pap
      if A14_187 ~= L27_200 then
        L27_200 = authServer
        L27_200 = L27_200.radiusType
        L27_200 = L27_200.chap
        if A14_187 ~= L27_200 then
          L27_200 = authServer
          L27_200 = L27_200.radiusType
          L27_200 = L27_200.mschap
          if A14_187 ~= L27_200 then
            L27_200 = authServer
            L27_200 = L27_200.radiusType
            L27_200 = L27_200.mschapv1
            if A14_187 ~= L27_200 then
              L27_200 = _UPVALUE5_
              L27_200 = L27_200.AUTHSUBTYPE_INVALID
              return L27_200
            end
          end
        end
      end
      A13_186 = A14_187
    end
    L27_200 = authServer
    L27_200 = L27_200.radius
    if A13_186 == L27_200 then
      L27_200 = db
      L27_200 = L27_200.getTable
      L27_200 = L27_200(radiusTable)
      if next(L27_200) == NIL then
        return _UPVALUE5_.RADIUS_NOT_ENABLED
      end
    else
      L27_200 = authServer
      L27_200 = L27_200.ldap
      if A13_186 == L27_200 then
        L27_200 = db
        L27_200 = L27_200.getTable
        L27_200 = L27_200(ldapTable)
        if next(L27_200) == NIL then
          return _UPVALUE5_.LDAP_SERVER_NOT_ENABLED
        end
      else
        L27_200 = authServer
        L27_200 = L27_200.ntDomain
        if A13_186 == L27_200 then
          L27_200 = db
          L27_200 = L27_200.getTable
          L27_200 = L27_200(ntdomainTable)
          if next(L27_200) == NIL then
            return _UPVALUE5_.NT_DOMAIN_NOT_ENABLED
          end
        else
          L27_200 = authServer
          L27_200 = L27_200.activeDirectory
          if A13_186 == L27_200 then
            L27_200 = db
            L27_200 = L27_200.getTable
            L27_200 = L27_200(adServerTable)
            if next(L27_200) == NIL then
              return _UPVALUE5_.AD_SERVER_NOT_ENABLED
            end
          else
            L27_200 = authServer
            L27_200 = L27_200.pop3
            if A13_186 == L27_200 then
              L27_200 = db
              L27_200 = L27_200.getTable
              L27_200 = L27_200(popTable)
              if next(L27_200) == NIL then
                return _UPVALUE5_.POP3_SERVER_NOT_ENABLED
              end
            end
          end
        end
      end
    end
    L27_200 = nil
    for _FORV_31_, _FORV_32_ in pairs(serverValue) do
      if _FORV_31_ == A13_186 then
        L27_200 = _FORV_32_
        break
      end
    end
    L20_193[openvpnTable .. "." .. _UPVALUE0_.authenticationType] = L27_200
  end
  L27_200 = openvpnTable
  L27_200 = L27_200 .. "." .. _UPVALUE0_.ptenable
  L20_193[L27_200] = A15_188
  L27_200 = openvpnTable
  L27_200 = L27_200 .. "." .. _UPVALUE0_.certVer
  L20_193[L27_200] = A16_189
  L27_200 = _UPVALUE3_
  L27_200 = L27_200.NIL
  if A17_190 == L27_200 then
    L27_200 = _UPVALUE5_
    L27_200 = L27_200.SELECT_VALID_CRT
    return L27_200
  end
  L27_200 = openvpnTable
  L27_200 = L27_200 .. "." .. _UPVALUE0_.serverClientCerts
  L20_193[L27_200] = A17_190
  L27_200 = db
  L27_200 = L27_200.getRowWhere
  L27_200 = L27_200("OpenvpnAuthCertificates", "name = '" .. A17_190 .. "'")
  L21_194 = L27_200
  L27_200 = _UPVALUE3_
  L27_200 = L27_200.NIL
  if L21_194 == L27_200 then
    L27_200 = _UPVALUE5_
    L27_200 = L27_200.SELECT_VALID_CRT
    return L27_200
  end
  L27_200 = L21_194["OpenvpnAuthCertificates.caCertData"]
  if L27_200 ~= nil then
    L27_200 = L21_194["OpenvpnAuthCertificates.crtCertData"]
    if L27_200 ~= nil then
      L27_200 = L21_194["OpenvpnAuthCertificates.keyCertData"]
      if L27_200 ~= nil then
        L27_200 = L21_194["OpenvpnAuthCertificates.dhCertData"]
      end
    end
  elseif L27_200 == nil then
    L27_200 = _UPVALUE5_
    L27_200 = L27_200.CERTS_NOT_FOUND
    return L27_200
  end
  if A9_182 == "1" then
    L27_200 = _UPVALUE3_
    L27_200 = L27_200.NIL
    if A18_191 == L27_200 then
      L27_200 = _UPVALUE5_
      L27_200 = L27_200.SELECT_VALID_CRT
      return L27_200
    end
    L27_200 = openvpnTable
    L27_200 = L27_200 .. "." .. _UPVALUE0_.tlsCertsName
    L20_193[L27_200] = A18_191
  end
  if A10_183 == "1" then
    L27_200 = _UPVALUE3_
    L27_200 = L27_200.NIL
    if A19_192 == L27_200 then
      L27_200 = _UPVALUE5_
      L27_200 = L27_200.SELECT_VALID_CRT
      return L27_200
    end
    L27_200 = openvpnTable
    L27_200 = L27_200 .. "." .. _UPVALUE0_.crlCertsName
    L20_193[L27_200] = A19_192
  end
  L27_200 = db
  L27_200 = L27_200.update
  L27_200 = L27_200(openvpnTable, L20_193, _UPVALUE19_)
  if L27_200 == _UPVALUE3_.FALSE then
    return _UPVALUE3_.FAILURE, A0_173
  end
  return _UPVALUE3_.SUCCESS, A0_173
end
function openVpnServerCreate(A0_201, A1_202, A2_203, A3_204, A4_205, A5_206, A6_207)
  local L8_208
  L8_208 = _UPVALUE0_
  L8_208 = L8_208.NOT_SUPPORTED
  return L8_208, 0
end
function openVpnServerDelete(A0_209)
  local L2_210
  L2_210 = _UPVALUE0_
  L2_210 = L2_210.NOT_SUPPORTED
  return L2_210, A0_209
end
function openVpnClientGet()
  local L0_211, L1_212, L2_213, L3_214, L4_215, L5_216, L6_217, L7_218, L8_219, L9_220, L10_221, L11_222, L12_223, L13_224, L14_225, L15_226, L16_227
  L0_211 = modeGet
  L2_213 = L0_211()
  L3_214 = _UPVALUE0_
  L3_214 = L3_214.SUCCESS
  if L0_211 ~= L3_214 then
    L3_214 = _UPVALUE0_
    L3_214 = L3_214.INVALID_ARGUMENT
    return L3_214
  end
  L3_214 = tonumber
  L4_215 = L2_213
  L3_214 = L3_214(L4_215)
  L4_215 = _UPVALUE1_
  if L3_214 ~= L4_215 then
    L3_214 = _UPVALUE2_
    L3_214 = L3_214.OPENVPN_CLIENT_NOTCONFIGURED
    return L3_214
  end
  L3_214 = db
  L3_214 = L3_214.getRow
  L4_215 = openvpnTable
  L5_216 = _UPVALUE3_
  L6_217 = _UPVALUE4_
  L3_214 = L3_214(L4_215, L5_216, L6_217)
  L4_215 = _UPVALUE0_
  L4_215 = L4_215.NIL
  if L3_214 == L4_215 then
    L4_215 = _UPVALUE2_
    L4_215 = L4_215.OPENVPN_TABLE_NIL
    return L4_215
  end
  L4_215, L5_216, L6_217, L7_218, L8_219, L9_220, L10_221, L11_222, L12_223, L13_224, L14_225, L15_226, L16_227 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L5_216 = L3_214[openvpnTable .. "." .. _UPVALUE5_.serverIp]
  L4_215 = L3_214[openvpnTable .. "." .. _UPVALUE5_.serverIpType]
  L12_223 = L3_214[openvpnTable .. "." .. _UPVALUE5_.failoverserverIpType]
  L13_224 = L3_214[openvpnTable .. "." .. _UPVALUE5_.failoverserverIp]
  L6_217 = L3_214[openvpnTable .. "." .. _UPVALUE5_.port]
  L7_218 = L3_214[openvpnTable .. "." .. _UPVALUE5_.tunnelProtocol]
  L8_219 = L3_214[openvpnTable .. "." .. _UPVALUE5_.encryptionAlgorithm]
  L9_220 = L3_214[openvpnTable .. "." .. _UPVALUE5_.hashAlgorithm]
  L10_221 = L3_214[openvpnTable .. "." .. _UPVALUE5_.tlsEnabled]
  L11_222 = L3_214[openvpnTable .. "." .. _UPVALUE5_.allowOnlyUserBasedAuth]
  userBasedAuth = L3_214[openvpnTable .. "." .. _UPVALUE5_.userBasedAuth]
  userName = L3_214[openvpnTable .. "." .. _UPVALUE5_.userName]
  password = L3_214[openvpnTable .. "." .. _UPVALUE5_.password]
  L14_225 = L3_214[openvpnTable .. "." .. _UPVALUE5_.certVer]
  L15_226 = L3_214[openvpnTable .. "." .. _UPVALUE5_.serverClientCerts]
  L16_227 = L3_214[openvpnTable .. "." .. _UPVALUE5_.tlsCertsName]
  return _UPVALUE0_.SUCCESS, 1, L4_215, L5_216, L6_217, L7_218, L8_219, L9_220, L10_221, L11_222, userBasedAuth, userName, password, L12_223, L13_224, L14_225, L15_226, L16_227
end
function openVpnClientSet(A0_228, A1_229, A2_230, A3_231, A4_232, A5_233, A6_234, A7_235, A8_236, A9_237, A10_238, A11_239, A12_240, A13_241, A14_242, A15_243, A16_244, A17_245)
  local L18_246, L19_247, L20_248
  L20_248 = {}
  L20_248[openvpnTable .. "." .. _UPVALUE0_.feature] = _UPVALUE1_
  L20_248[openvpnTable .. "." .. _UPVALUE0_.mode] = _UPVALUE2_
  if A1_229 == _UPVALUE3_.NIL then
    return _UPVALUE3_.INVALID_ARGUMENT
  end
  L20_248[openvpnTable .. "." .. _UPVALUE0_.serverIpType] = A1_229
  if A2_230 == _UPVALUE3_.NIL then
    return _UPVALUE3_.INVALID_ARGUMENT
  end
  if A1_229 == "0" then
    L18_246 = _UPVALUE4_.ipAddressCheck("2", A2_230)
    if L18_246 ~= _UPVALUE3_.SUCCESS then
      return _UPVALUE5_.OPENVPN_SERVERIP_INVALID
    end
  end
  if A1_229 == "1" then
    L18_246 = _UPVALUE4_.is_fqdn_address(A2_230)
    if L18_246 ~= true then
      return _UPVALUE5_.OPENVPN_SERVERIP_INVALID
    end
  end
  L20_248[openvpnTable .. "." .. _UPVALUE0_.serverIp] = A2_230
  if A12_240 == _UPVALUE3_.NIL then
    return _UPVALUE3_.INVALID_ARGUMENT
  end
  L20_248[openvpnTable .. "." .. _UPVALUE0_.failoverserverIpType] = A12_240
  if A12_240 == "0" and A13_241 ~= "" then
    L18_246 = _UPVALUE4_.ipAddressCheck("2", A13_241)
    if L18_246 ~= _UPVALUE3_.SUCCESS then
      return _UPVALUE5_.OPENVPN_SERVERIP_INVALID
    end
  end
  if A12_240 == "1" and A13_241 ~= "" then
    L18_246 = _UPVALUE4_.is_fqdn_address(A13_241)
    if L18_246 ~= true then
      return _UPVALUE5_.OPENVPN_SERVERIP_INVALID
    end
  end
  if A13_241 ~= "" then
    L20_248[openvpnTable .. "." .. _UPVALUE0_.failoverserverIp] = A13_241
  else
    L20_248[openvpnTable .. "." .. _UPVALUE0_.failoverserverIp] = "None"
  end
  if A3_231 == _UPVALUE3_.NIL then
    return _UPVALUE3_.INVALID_ARGUMENT
  end
  if tonumber(A3_231) < _UPVALUE6_ or tonumber(A3_231) > _UPVALUE7_ then
    return _UPVALUE5_.OPENVPN_PORTNUMBER_INVALID
  end
  L20_248[openvpnTable .. "." .. _UPVALUE0_.port] = A3_231
  if A4_232 == _UPVALUE3_.NIL then
    return _UPVALUE3_.INVALID_ARGUMENT
  end
  if tonumber(A4_232) ~= _UPVALUE8_ and tonumber(A4_232) ~= _UPVALUE9_ then
    return _UPVALUE5_.OPENVPN_TUNNELPROTOCOL_INVALID
  end
  L20_248[openvpnTable .. "." .. _UPVALUE0_.tunnelProtocol] = A4_232
  if A5_233 == _UPVALUE3_.NIL then
    return _UPVALUE3_.INVALID_ARGUMENT
  end
  if tonumber(A5_233) ~= _UPVALUE10_ and tonumber(A5_233) ~= _UPVALUE11_ and tonumber(A5_233) ~= _UPVALUE12_ and tonumber(A5_233) ~= _UPVALUE13_ then
    return _UPVALUE5_.OPENVPN_ENCRYPTIONALGO_INVALID
  end
  L20_248[openvpnTable .. "." .. _UPVALUE0_.encryptionAlgorithm] = A5_233
  if A6_234 == _UPVALUE3_.NIL then
    return _UPVALUE3_.INVALID_ARGUMENT
  end
  if tonumber(A6_234) ~= _UPVALUE14_ and tonumber(A6_234) ~= _UPVALUE15_ and tonumber(A6_234) ~= _UPVALUE16_ then
    return _UPVALUE5_.OPENVPN_HASHALGO_INVALID
  end
  L20_248[openvpnTable .. "." .. _UPVALUE0_.hashAlgorithm] = A6_234
  L20_248[openvpnTable .. "." .. _UPVALUE0_.tlsEnabled] = A7_235
  if A9_237 == _UPVALUE3_.NIL then
    return _UPVALUE5_.INVALID_USERBASEDAUTH
  end
  L20_248[openvpnTable .. "." .. _UPVALUE0_.userBasedAuth] = A9_237
  if A9_237 == _UPVALUE1_ then
    if A10_238 == _UPVALUE3_.NIL then
      return _UPVALUE5_.INVALID_USERNAME
    end
    L20_248[openvpnTable .. "." .. _UPVALUE0_.userName] = A10_238
    if A11_239 == _UPVALUE3_.NIL then
      return _UPVALUE5_.INVALID_PASSWORD
    end
    L20_248[openvpnTable .. "." .. _UPVALUE0_.password] = A11_239
  end
  L20_248[openvpnTable .. "." .. _UPVALUE0_.ptenable] = A14_242
  L20_248[openvpnTable .. "." .. _UPVALUE0_.certVer] = A15_243
  if A16_244 == _UPVALUE3_.NIL then
    return _UPVALUE5_.SELECT_VALID_CRT
  end
  L20_248[openvpnTable .. "." .. _UPVALUE0_.serverClientCerts] = A16_244
  inputTab = db.getRowWhere("OpenvpnAuthCertificates", "name = '" .. A16_244 .. "'")
  if inputTab == _UPVALUE3_.NIL then
    return _UPVALUE5_.SELECT_VALID_CRT
  end
  if A15_243 == "1" then
    if inputTab["OpenvpnAuthCertificates.caCertData"] == nil or inputTab["OpenvpnAuthCertificates.crtCertData"] == nil or inputTab["OpenvpnAuthCertificates.keyCertData"] == nil then
      return _UPVALUE5_.CERTS_NOT_FOUND
    end
  elseif inputTab["OpenvpnAuthCertificates.caCertData"] == NULL then
    return _UPVALUE5_.CERTS_NOT_FOUND
  end
  if A7_235 == _UPVALUE1_ then
    if A17_245 == _UPVALUE3_.NIL then
      return _UPVALUE5_.SELECT_VALID_CRT
    end
    L20_248[openvpnTable .. "." .. _UPVALUE0_.tlsCertsName] = A17_245
  end
  if db.update(openvpnTable, L20_248, _UPVALUE17_) == _UPVALUE3_.FALSE then
    return _UPVALUE3_.FAILURE, L19_247
  end
  return _UPVALUE3_.SUCCESS, L19_247
end
function openVpnAccessServerClientSet(A0_249, A1_250, A2_251, A3_252, A4_253, A5_254, A6_255, A7_256)
  local L8_257, L9_258
  L8_257 = _UPVALUE0_
  L8_257 = L8_257.NIL
  if A1_250 == L8_257 then
    L8_257 = _UPVALUE0_
    L8_257 = L8_257.INVALID_ARGUMENT
    return L8_257
  end
  L8_257 = tonumber
  L9_258 = A1_250
  L8_257 = L8_257(L9_258)
  L9_258 = _UPVALUE1_
  if L8_257 ~= L9_258 then
    L9_258 = _UPVALUE2_
    if L8_257 ~= L9_258 then
      L9_258 = _UPVALUE3_
      if L8_257 ~= L9_258 then
        L9_258 = _UPVALUE0_
        L9_258 = L9_258.INVALID_ARGUMENT
        return L9_258
      end
    end
  end
  L9_258 = {}
  L9_258[openvpnTable .. "." .. _UPVALUE4_.feature] = _UPVALUE5_
  L9_258[openvpnTable .. "." .. _UPVALUE4_.mode] = A1_250
  if A2_251 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A2_251) < _UPVALUE6_ or tonumber(A2_251) > _UPVALUE7_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L9_258[openvpnTable .. "." .. _UPVALUE4_.port] = A2_251
  if A3_252 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L9_258[openvpnTable .. "." .. _UPVALUE4_.tlsEnabled] = A3_252
  if A4_253 == _UPVALUE0_.NIL then
    return _UPVALUE8_.INVALID_PTENABLE
  end
  L9_258[openvpnTable .. "." .. _UPVALUE4_.ptenable] = A4_253
  if A4_253 == _UPVALUE5_ then
    if A5_254 == _UPVALUE0_.NIL then
      return _UPVALUE8_.INVALID_PTUSERNAME
    end
    L9_258[openvpnTable .. "." .. _UPVALUE4_.ptuserName] = A5_254
    if A6_255 == _UPVALUE0_.NIL then
      return _UPVALUE8_.INVALID_PTPASSWORD
    end
    L9_258[openvpnTable .. "." .. _UPVALUE4_.ptpassword] = A6_255
    if A7_256 == _UPVALUE0_.NIL then
      return _UPVALUE8_.INVALID_PTCLUSTERID
    end
    L9_258[openvpnTable .. "." .. _UPVALUE4_.ptclusterId] = A7_256
  end
  if db.update(openvpnTable, L9_258, _UPVALUE9_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_249
  end
  return _UPVALUE0_.SUCCESS, A0_249
end
function openVpnClientCreate(A0_259, A1_260, A2_261, A3_262, A4_263)
  local L6_264
  L6_264 = _UPVALUE0_
  L6_264 = L6_264.NOT_SUPPORTED
  return L6_264, 0
end
function openVpnClientDelete(A0_265)
  local L2_266
  L2_266 = _UPVALUE0_
  L2_266 = L2_266.NOT_SUPPORTED
  return L2_266, A0_265
end
function lanRouteGet()
  local L0_267, L1_268, L2_269, L3_270, L4_271, L5_272, L6_273
  L0_267 = tunnelTypeGet
  L2_269 = L0_267()
  L3_270 = tonumber
  L4_271 = L2_269
  L3_270 = L3_270(L4_271)
  L4_271 = _UPVALUE0_
  if L3_270 ~= L4_271 then
    L3_270 = _UPVALUE1_
    L3_270 = L3_270.OPENVPN_TUNNELTYPE_NOTSPLITTUNNEL
    return L3_270
  end
  L3_270 = db
  L3_270 = L3_270.getNextRowId
  L4_271 = _UPVALUE2_
  L5_272 = openvpnLanRoutesTable
  L3_270 = L3_270(L4_271, L5_272)
  L4_271 = db
  L4_271 = L4_271.getRow
  L5_272 = openvpnLanRoutesTable
  L6_273 = _UPVALUE3_
  L4_271 = L4_271(L5_272, L6_273, L3_270)
  L5_272 = _UPVALUE4_
  L5_272 = L5_272.NIL
  if L4_271 == L5_272 then
    L5_272 = _UPVALUE4_
    L5_272 = L5_272.FAILURE
    return L5_272
  end
  L5_272, L6_273 = nil, nil
  L5_272 = L4_271[openvpnLanRoutesTable .. "." .. _UPVALUE5_.localNetwork]
  L6_273 = L4_271[openvpnLanRoutesTable .. "." .. _UPVALUE5_.localNetworkMask]
  return _UPVALUE4_.SUCCESS, L3_270, L5_272, L6_273
end
function lanRouteGetNext(A0_274)
  local L1_275, L2_276, L3_277, L4_278
  L1_275 = _UPVALUE0_
  L1_275 = L1_275.NIL
  if A0_274 ~= L1_275 then
    L1_275 = tonumber
    L2_276 = A0_274
    L1_275 = L1_275(L2_276)
    L2_276 = _UPVALUE0_
    L2_276 = L2_276.NIL
  elseif L1_275 == L2_276 then
    L1_275 = _UPVALUE0_
    L1_275 = L1_275.INVALID_ARGUMENT
    return L1_275
  end
  L1_275 = db
  L1_275 = L1_275.existsRow
  L2_276 = openvpnLanRoutesTable
  L3_277 = _UPVALUE1_
  L4_278 = A0_274
  L1_275 = L1_275(L2_276, L3_277, L4_278)
  L2_276 = _UPVALUE0_
  L2_276 = L2_276.FALSE
  if L1_275 == L2_276 then
    L1_275 = _UPVALUE2_
    L1_275 = L1_275.OPENVPN_INVALID_COOKIE
    return L1_275
  end
  L1_275 = db
  L1_275 = L1_275.getNextRowId
  L2_276 = A0_274
  L3_277 = openvpnLanRoutesTable
  L1_275 = L1_275(L2_276, L3_277)
  L2_276 = _UPVALUE0_
  L2_276 = L2_276.NIL
  if L1_275 == L2_276 then
    L2_276 = _UPVALUE2_
    L2_276 = L2_276.OPENVPN_INVALID_NEXTCOOKIE
    return L2_276
  end
  L2_276 = db
  L2_276 = L2_276.getRow
  L3_277 = openvpnLanRoutesTable
  L4_278 = _UPVALUE1_
  L2_276 = L2_276(L3_277, L4_278, L1_275)
  L3_277 = _UPVALUE0_
  L3_277 = L3_277.NIL
  if L2_276 == L3_277 then
    L3_277 = _UPVALUE0_
    L3_277 = L3_277.FAILURE
    return L3_277
  end
  L3_277, L4_278 = nil, nil
  L3_277 = L2_276[openvpnLanRoutesTable .. "." .. _UPVALUE3_.localNetwork]
  L4_278 = L2_276[openvpnLanRoutesTable .. "." .. _UPVALUE3_.localNetworkMask]
  return _UPVALUE0_.SUCCESS, L1_275, L3_277, L4_278
end
function lanRouteSet(A0_279, A1_280, A2_281)
  local L3_282
  L3_282 = {}
  if A0_279 == _UPVALUE0_.NIL or tonumber(A0_279) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(openvpnLanRoutesTable, _UPVALUE1_, A0_279) == _UPVALUE0_.FALSE then
    return _UPVALUE2_.OPENVPN_INVALID_COOKIE
  end
  if A1_280 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE3_.ipAddressCheck("2", A1_280)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE2_.OPENVPN_LANNETWORKS_NETWORKIP_INVALID
  end
  L3_282[openvpnLanRoutesTable .. "." .. _UPVALUE4_.localNetwork] = A1_280
  if A2_281 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE3_.ipAddressCheck("2", A2_281)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE2_.OPENVPN_LANNETWORKS_NETWORKMASK_INVALID
  end
  valid = db.existsRowWhere(openvpnLanRoutesTable, "Network = '" .. A1_280 .. "'")
  if valid and valid ~= A0_279 then
    return _UPVALUE0_.ALREADY_CONFIGURED
  end
  L3_282[openvpnLanRoutesTable .. "." .. _UPVALUE4_.localNetworkMask] = A2_281
  if db.update(openvpnLanRoutesTable, L3_282, A0_279) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_279
end
function lanRouteCreate(A0_283, A1_284)
  local L2_285, L3_286, L4_287, L5_288, L6_289, L7_290, L8_291, L9_292
  L2_285 = tunnelTypeGet
  L4_287 = L2_285()
  L5_288 = tonumber
  L6_289 = L4_287
  L5_288 = L5_288(L6_289)
  L6_289 = _UPVALUE0_
  if L5_288 ~= L6_289 then
    L5_288 = _UPVALUE1_
    L5_288 = L5_288.OPENVPN_TUNNELTYPE_NOTSPLITTUNNEL
    return L5_288
  end
  L5_288 = nil
  L6_289 = {}
  L7_290 = _UPVALUE2_
  L7_290 = L7_290.NIL
  if A0_283 == L7_290 then
    L7_290 = _UPVALUE2_
    L7_290 = L7_290.INVALID_ARGUMENT
    return L7_290
  end
  L7_290 = _UPVALUE3_
  L7_290 = L7_290.ipAddressCheck
  L8_291 = "2"
  L9_292 = A0_283
  L7_290 = L7_290(L8_291, L9_292)
  L5_288 = L7_290
  L7_290 = _UPVALUE2_
  L7_290 = L7_290.SUCCESS
  if L5_288 ~= L7_290 then
    L7_290 = _UPVALUE1_
    L7_290 = L7_290.OPENVPN_LANNETWORKS_NETWORKIP_INVALID
    return L7_290
  end
  L7_290 = openvpnLanRoutesTable
  L8_291 = "."
  L9_292 = _UPVALUE4_
  L9_292 = L9_292.localNetwork
  L7_290 = L7_290 .. L8_291 .. L9_292
  L6_289[L7_290] = A0_283
  L7_290 = _UPVALUE2_
  L7_290 = L7_290.NIL
  if A1_284 == L7_290 then
    L7_290 = _UPVALUE2_
    L7_290 = L7_290.INVALID_ARGUMENT
    return L7_290
  end
  L7_290 = _UPVALUE3_
  L7_290 = L7_290.ipAddressCheck
  L8_291 = "2"
  L9_292 = A1_284
  L7_290 = L7_290(L8_291, L9_292)
  L5_288 = L7_290
  L7_290 = _UPVALUE2_
  L7_290 = L7_290.SUCCESS
  if L5_288 ~= L7_290 then
    L7_290 = _UPVALUE2_
    L7_290 = L7_290.LANNETWORKS_NETWORKMASK_INVALID
    return L7_290
  end
  L7_290 = db
  L7_290 = L7_290.existsRowWhere
  L8_291 = openvpnLanRoutesTable
  L9_292 = "Network = '"
  L9_292 = L9_292 .. A0_283 .. "'"
  L7_290 = L7_290(L8_291, L9_292)
  L5_288 = L7_290
  if L5_288 then
    L7_290 = _UPVALUE2_
    L7_290 = L7_290.ALREADY_CONFIGURED
    return L7_290
  end
  L7_290 = openvpnLanRoutesTable
  L8_291 = "."
  L9_292 = _UPVALUE4_
  L9_292 = L9_292.localNetworkMask
  L7_290 = L7_290 .. L8_291 .. L9_292
  L6_289[L7_290] = A1_284
  L7_290 = db
  L7_290 = L7_290.getTable
  L8_291 = openvpnLanRoutesTable
  L7_290 = L7_290(L8_291)
  if L7_290 ~= nil then
    L8_291 = #L7_290
    L9_292 = _UPVALUE5_
    if L8_291 >= L9_292 then
      L8_291 = _UPVALUE2_
      L8_291 = L8_291.MAX_LIMIT_REACHED
      return L8_291
    end
  end
  L8_291 = db
  L8_291 = L8_291.insert
  L9_292 = openvpnLanRoutesTable
  L8_291 = L8_291(L9_292, L6_289)
  L9_292 = _UPVALUE2_
  L9_292 = L9_292.NIL
  if L8_291 == L9_292 then
    L9_292 = _UPVALUE2_
    L9_292 = L9_292.FAILURE
    return L9_292
  end
  L9_292 = db
  L9_292 = L9_292.getAttributeWhere
  L9_292 = L9_292(openvpnLanRoutesTable, _UPVALUE4_.localNetwork .. " ='" .. A0_283 .. "' AND " .. _UPVALUE4_.localNetworkMask .. " ='" .. A1_284 .. "'", _UPVALUE6_)
  return _UPVALUE2_.SUCCESS, L9_292
end
function lanRouteDelete(A0_293)
  if A0_293 == _UPVALUE0_.NIL or tonumber(A0_293) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(openvpnLanRoutesTable, _UPVALUE1_, A0_293) == _UPVALUE0_.FALSE then
    return _UPVALUE2_.OPENVPN_INVALID_COOKIE
  end
  if db.deleteRow(openvpnLanRoutesTable, _UPVALUE1_, A0_293) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_293
  end
  return _UPVALUE0_.SUCCESS, A0_293
end
function gatewayRouteGet()
  local L0_294, L1_295, L2_296, L3_297, L4_298
  L0_294 = db
  L0_294 = L0_294.getNextRowId
  L1_295 = _UPVALUE0_
  L2_296 = openvpnGwRoutesTable
  L0_294 = L0_294(L1_295, L2_296)
  L1_295 = db
  L1_295 = L1_295.getRow
  L2_296 = openvpnGwRoutesTable
  L3_297 = _UPVALUE1_
  L4_298 = L0_294
  L1_295 = L1_295(L2_296, L3_297, L4_298)
  L2_296 = _UPVALUE2_
  L2_296 = L2_296.NIL
  if L1_295 == L2_296 then
    L2_296 = _UPVALUE2_
    L2_296 = L2_296.FAILURE
    return L2_296
  end
  L2_296, L3_297, L4_298 = nil, nil, nil
  L2_296 = L1_295[openvpnGwRoutesTable .. "." .. _UPVALUE3_.remoteNetwork]
  L3_297 = L1_295[openvpnGwRoutesTable .. "." .. _UPVALUE3_.remoteNetworkname]
  L4_298 = L1_295[openvpnGwRoutesTable .. "." .. _UPVALUE3_.remoteNetworkMask]
  return _UPVALUE2_.SUCCESS, L0_294, L2_296, L3_297, L4_298
end
function gatewayRouteGetNext(A0_299)
  local L1_300, L2_301, L3_302, L4_303, L5_304
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
  L2_301 = openvpnGwRoutesTable
  L3_302 = _UPVALUE1_
  L4_303 = A0_299
  L1_300 = L1_300(L2_301, L3_302, L4_303)
  L2_301 = _UPVALUE0_
  L2_301 = L2_301.FALSE
  if L1_300 == L2_301 then
    L1_300 = _UPVALUE2_
    L1_300 = L1_300.OPENVPN_INVALID_COOKIE
    return L1_300
  end
  L1_300 = db
  L1_300 = L1_300.getNextRowId
  L2_301 = A0_299
  L3_302 = openvpnGwRoutesTable
  L1_300 = L1_300(L2_301, L3_302)
  L2_301 = _UPVALUE0_
  L2_301 = L2_301.NIL
  if L1_300 == L2_301 then
    L2_301 = _UPVALUE2_
    L2_301 = L2_301.OPENVPN_INVALID_NEXTCOOKIE
    return L2_301
  end
  L2_301 = db
  L2_301 = L2_301.getRow
  L3_302 = openvpnGwRoutesTable
  L4_303 = _UPVALUE1_
  L5_304 = L1_300
  L2_301 = L2_301(L3_302, L4_303, L5_304)
  L3_302 = _UPVALUE0_
  L3_302 = L3_302.NIL
  if L2_301 == L3_302 then
    L3_302 = _UPVALUE0_
    L3_302 = L3_302.FAILURE
    return L3_302
  end
  L3_302, L4_303, L5_304 = nil, nil, nil
  L3_302 = L2_301[openvpnGwRoutesTable .. "." .. _UPVALUE3_.remoteNetwork]
  L4_303 = L2_301[openvpnGwRoutesTable .. "." .. _UPVALUE3_.remoteNetworkname]
  L5_304 = L2_301[openvpnGwRoutesTable .. "." .. _UPVALUE3_.remoteNetworkMask]
  return _UPVALUE0_.SUCCESS, L1_300, L3_302, L4_303, L5_304
end
function gatewayRouteSet(A0_305, A1_306, A2_307, A3_308)
  local L4_309, L5_310
  L5_310 = {}
  if A0_305 == _UPVALUE0_.NIL or tonumber(A0_305) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(openvpnGwRoutesTable, _UPVALUE1_, A0_305) == _UPVALUE0_.FALSE then
    return _UPVALUE2_.OPENVPN_INVALID_COOKIE
  end
  if A1_306 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L4_309 = _UPVALUE3_.ipAddressCheck("2", A1_306)
  if L4_309 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE2_.OPENVPN_REMOTENETWORKS_NETWORKIP_INVALID
  end
  L4_309 = _UPVALUE3_.checkLanVlanSubnetRange(A1_306, A3_308)
  if L4_309 == _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.LAN_VLAN_ALREADY_CONFIGURED
  end
  L4_309 = _UPVALUE3_.checkWanSubnetRange(A1_306, A3_308)
  if L4_309 == _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.OPTION_ALREADY_CONFIGURED
  end
  L4_309 = _UPVALUE3_.checkDmzSubnetRange(A1_306, A3_308)
  if L4_309 == _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.DMZ_ALREADY_CONFIGURED
  end
  L4_309 = _UPVALUE3_.checkSslClientRange(A1_306, A3_308)
  if L4_309 == _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.SSLVPN_CLIENT_ALREADY_CONFIGURED
  end
  L5_310[openvpnGwRoutesTable .. "." .. _UPVALUE4_.remoteNetwork] = A1_306
  if A2_307 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L5_310[openvpnGwRoutesTable .. "." .. _UPVALUE4_.remoteNetworkname] = A2_307
  if A3_308 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L4_309 = _UPVALUE3_.ipAddressCheck("2", A3_308)
  if L4_309 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE2_.OPENVPN_REMOTENETWORKS_NETWORKMASK_INVALID
  end
  L4_309 = _UPVALUE3_.checkLanVlanSubnetRange(A1_306, A3_308)
  if L4_309 == _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.LAN_VLAN_ALREADY_CONFIGURED
  end
  L4_309 = db.existsRow("OpenVpngwRoutes", "Network", A1_306)
  if L4_309 and L4_309 ~= A0_305 then
    return _UPVALUE0_.ALREADY_CONFIGURED
  end
  L4_309 = db.existsRow("OpenVpngwRoutes", "CommonName", A2_307)
  if L4_309 and L4_309 ~= A0_305 then
    return _UPVALUE0_.ALREADY_CONFIGURED
  end
  L5_310[openvpnGwRoutesTable .. "." .. _UPVALUE4_.remoteNetworkMask] = A3_308
  if db.update(openvpnGwRoutesTable, L5_310, A0_305) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_305
  end
  return _UPVALUE0_.SUCCESS, A0_305
end
function gatewayRouteCreate(A0_311, A1_312, A2_313)
  local L3_314, L4_315, L5_316, L6_317, L7_318
  L4_315 = {}
  L5_316 = _UPVALUE0_
  L5_316 = L5_316.NIL
  if A0_311 == L5_316 then
    L5_316 = _UPVALUE0_
    L5_316 = L5_316.INVALID_ARGUMENT
    return L5_316
  end
  L5_316 = _UPVALUE1_
  L5_316 = L5_316.ipAddressCheck
  L6_317 = "2"
  L7_318 = A0_311
  L5_316 = L5_316(L6_317, L7_318)
  L3_314 = L5_316
  L5_316 = _UPVALUE0_
  L5_316 = L5_316.SUCCESS
  if L3_314 ~= L5_316 then
    L5_316 = _UPVALUE2_
    L5_316 = L5_316.OPENVPN_REMOTENETWORKS_NETWORKIP_INVALID
    return L5_316
  end
  L5_316 = _UPVALUE1_
  L5_316 = L5_316.checkLanVlanSubnetRange
  L6_317 = A0_311
  L7_318 = A2_313
  L5_316 = L5_316(L6_317, L7_318)
  L3_314 = L5_316
  L5_316 = _UPVALUE0_
  L5_316 = L5_316.SUCCESS
  if L3_314 == L5_316 then
    L5_316 = _UPVALUE0_
    L5_316 = L5_316.LAN_VLAN_ALREADY_CONFIGURED
    return L5_316
  end
  L5_316 = _UPVALUE1_
  L5_316 = L5_316.checkWanSubnetRange
  L6_317 = A0_311
  L7_318 = A2_313
  L5_316 = L5_316(L6_317, L7_318)
  L3_314 = L5_316
  L5_316 = _UPVALUE0_
  L5_316 = L5_316.SUCCESS
  if L3_314 == L5_316 then
    L5_316 = _UPVALUE0_
    L5_316 = L5_316.OPTION_ALREADY_CONFIGURED
    return L5_316
  end
  L5_316 = _UPVALUE1_
  L5_316 = L5_316.checkDmzSubnetRange
  L6_317 = A0_311
  L7_318 = A2_313
  L5_316 = L5_316(L6_317, L7_318)
  L3_314 = L5_316
  L5_316 = _UPVALUE0_
  L5_316 = L5_316.SUCCESS
  if L3_314 == L5_316 then
    L5_316 = _UPVALUE0_
    L5_316 = L5_316.DMZ_ALREADY_CONFIGURED
    return L5_316
  end
  L5_316 = _UPVALUE1_
  L5_316 = L5_316.checkSslClientRange
  L6_317 = A0_311
  L7_318 = A2_313
  L5_316 = L5_316(L6_317, L7_318)
  L3_314 = L5_316
  L5_316 = _UPVALUE0_
  L5_316 = L5_316.SUCCESS
  if L3_314 == L5_316 then
    L5_316 = _UPVALUE0_
    L5_316 = L5_316.SSLVPN_CLIENT_ALREADY_CONFIGURED
    return L5_316
  end
  L5_316 = openvpnGwRoutesTable
  L6_317 = "."
  L7_318 = _UPVALUE3_
  L7_318 = L7_318.remoteNetwork
  L5_316 = L5_316 .. L6_317 .. L7_318
  L4_315[L5_316] = A0_311
  L5_316 = _UPVALUE0_
  L5_316 = L5_316.NIL
  if A1_312 == L5_316 then
    L5_316 = _UPVALUE0_
    L5_316 = L5_316.INVALID_ARGUMENT
    return L5_316
  end
  L5_316 = openvpnGwRoutesTable
  L6_317 = "."
  L7_318 = _UPVALUE3_
  L7_318 = L7_318.remoteNetworkname
  L5_316 = L5_316 .. L6_317 .. L7_318
  L4_315[L5_316] = A1_312
  L5_316 = _UPVALUE0_
  L5_316 = L5_316.NIL
  if A2_313 == L5_316 then
    L5_316 = _UPVALUE0_
    L5_316 = L5_316.INVALID_ARGUMENT
    return L5_316
  end
  L5_316 = _UPVALUE1_
  L5_316 = L5_316.ipAddressCheck
  L6_317 = "2"
  L7_318 = A2_313
  L5_316 = L5_316(L6_317, L7_318)
  L3_314 = L5_316
  L5_316 = _UPVALUE0_
  L5_316 = L5_316.SUCCESS
  if L3_314 ~= L5_316 then
    L5_316 = _UPVALUE2_
    L5_316 = L5_316.OPENVPN_REMOTENETWORKS_NETWORKMASK_INVALID
    return L5_316
  end
  L5_316 = openvpnGwRoutesTable
  L6_317 = "."
  L7_318 = _UPVALUE3_
  L7_318 = L7_318.remoteNetworkMask
  L5_316 = L5_316 .. L6_317 .. L7_318
  L4_315[L5_316] = A2_313
  L5_316 = _UPVALUE1_
  L5_316 = L5_316.checkLanVlanSubnetRange
  L6_317 = A0_311
  L7_318 = A2_313
  L5_316 = L5_316(L6_317, L7_318)
  L3_314 = L5_316
  L5_316 = _UPVALUE0_
  L5_316 = L5_316.SUCCESS
  if L3_314 == L5_316 then
    L5_316 = _UPVALUE0_
    L5_316 = L5_316.LAN_VLAN_ALREADY_CONFIGURED
    return L5_316
  end
  L5_316 = db
  L5_316 = L5_316.existsRow
  L6_317 = "OpenVpngwRoutes"
  L7_318 = "Network"
  L5_316 = L5_316(L6_317, L7_318, A0_311)
  L3_314 = L5_316
  if L3_314 then
    L5_316 = _UPVALUE0_
    L5_316 = L5_316.ALREADY_CONFIGURED
    return L5_316
  end
  L5_316 = db
  L5_316 = L5_316.existsRow
  L6_317 = "OpenVpngwRoutes"
  L7_318 = "CommonName"
  L5_316 = L5_316(L6_317, L7_318, A1_312)
  L3_314 = L5_316
  if L3_314 then
    L5_316 = _UPVALUE0_
    L5_316 = L5_316.ALREADY_CONFIGURED
    return L5_316
  end
  L5_316 = db
  L5_316 = L5_316.getTable
  L6_317 = openvpnGwRoutesTable
  L5_316 = L5_316(L6_317)
  if L5_316 ~= nil then
    L6_317 = #L5_316
    L7_318 = _UPVALUE4_
    if L6_317 >= L7_318 then
      L6_317 = _UPVALUE0_
      L6_317 = L6_317.MAX_LIMIT_REACHED
      return L6_317
    end
  end
  L6_317 = db
  L6_317 = L6_317.insert
  L7_318 = openvpnGwRoutesTable
  L6_317 = L6_317(L7_318, L4_315)
  L7_318 = _UPVALUE0_
  L7_318 = L7_318.NIL
  if L6_317 == L7_318 then
    L7_318 = _UPVALUE0_
    L7_318 = L7_318.FAILURE
    return L7_318
  end
  L7_318 = db
  L7_318 = L7_318.getAttributeWhere
  L7_318 = L7_318(openvpnGwRoutesTable, _UPVALUE3_.remoteNetwork .. " ='" .. A0_311 .. "' AND " .. _UPVALUE3_.remoteNetworkMask .. " ='" .. A2_313 .. "' AND " .. _UPVALUE3_.remoteNetworkname .. " ='" .. A1_312 .. "'", _UPVALUE5_)
  return _UPVALUE0_.SUCCESS, L7_318
end
function gatewayRouteDelete(A0_319)
  if A0_319 == _UPVALUE0_.NIL or tonumber(A0_319) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(openvpnGwRoutesTable, _UPVALUE1_, A0_319) == _UPVALUE0_.FALSE then
    return _UPVALUE2_.OPENVPN_INVALID_COOKIE
  end
  if db.deleteRow(openvpnGwRoutesTable, _UPVALUE1_, A0_319) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_319
  end
  return _UPVALUE0_.SUCCESS, A0_319
end
function lanRoutesGetAll()
  local L0_320, L1_321, L2_322, L3_323
  L0_320 = tunnelTypeGet
  L2_322 = L0_320()
  L3_323 = tonumber
  L3_323 = L3_323(L2_322)
  if L3_323 ~= _UPVALUE0_ then
    L3_323 = _UPVALUE1_
    L3_323 = L3_323.OPENVPN_TUNNELTYPE_NOTSPLITTUNNEL
    return L3_323
  end
  L3_323 = db
  L3_323 = L3_323.getTable
  L3_323 = L3_323(openvpnLanRoutesTable, false)
  if L3_323 == _UPVALUE2_.NIL then
    return _UPVALUE1_.OPENVPN_LANNETWORKS_TABLENIL
  end
  return _UPVALUE2_.SUCCESS, L3_323
end
function gatewayRoutesGetAll()
  local L0_324
  L0_324 = db
  L0_324 = L0_324.getTable
  L0_324 = L0_324(openvpnGwRoutesTable, false)
  if L0_324 == _UPVALUE0_.NIL then
    return _UPVALUE1_.OPENVPN_REMOTENETWORKS_TABLENIL
  end
  return _UPVALUE0_.SUCCESS, L0_324
end
function lanRoutesDeleteAll()
  if db.deleteAllRows(openvpnLanRoutesTable) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function gatewayRoutesDeleteAll()
  if db.deleteAllRows(openvpnGwRoutesTable) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function lanRouteGetCur(A0_325)
  local L1_326, L2_327, L3_328
  L1_326 = db
  L1_326 = L1_326.getRow
  L2_327 = openvpnLanRoutesTable
  L3_328 = _UPVALUE0_
  L1_326 = L1_326(L2_327, L3_328, A0_325)
  L2_327 = _UPVALUE1_
  L2_327 = L2_327.NIL
  if L1_326 == L2_327 then
    L2_327 = _UPVALUE1_
    L2_327 = L2_327.FAILURE
    return L2_327
  end
  L2_327, L3_328 = nil, nil
  L2_327 = L1_326[openvpnLanRoutesTable .. "." .. _UPVALUE2_.localNetwork]
  L3_328 = L1_326[openvpnLanRoutesTable .. "." .. _UPVALUE2_.localNetworkMask]
  return _UPVALUE1_.SUCCESS, L2_327, L3_328
end
function gatewayRouteGetCur(A0_329)
  local L1_330, L2_331, L3_332, L4_333
  L1_330 = db
  L1_330 = L1_330.getRow
  L2_331 = openvpnGwRoutesTable
  L3_332 = _UPVALUE0_
  L4_333 = A0_329
  L1_330 = L1_330(L2_331, L3_332, L4_333)
  L2_331 = _UPVALUE1_
  L2_331 = L2_331.NIL
  if L1_330 == L2_331 then
    L2_331 = _UPVALUE1_
    L2_331 = L2_331.FAILURE
    return L2_331
  end
  L2_331, L3_332, L4_333 = nil, nil, nil
  L2_331 = L1_330[openvpnGwRoutesTable .. "." .. _UPVALUE2_.remoteNetwork]
  L3_332 = L1_330[openvpnGwRoutesTable .. "." .. _UPVALUE2_.remoteNetworkname]
  L4_333 = L1_330[openvpnGwRoutesTable .. "." .. _UPVALUE2_.remoteNetworkMask]
  return _UPVALUE1_.SUCCESS, L2_331, L3_332, L4_333
end
function uploadSet(A0_334, A1_335, A2_336)
  local L3_337, L4_338, L5_339, L6_340, L7_341, L8_342
  L5_339 = _UPVALUE0_
  if A0_334 == L5_339 then
    L5_339 = os
    L5_339 = L5_339.execute
    L6_340 = "mv /tmp/"
    L7_341 = A1_335
    L8_342 = " "
    L6_340 = L6_340 .. L7_341 .. L8_342 .. A2_336 .. _UPVALUE1_
    L5_339 = L5_339(L6_340)
    L3_337 = L5_339
    L5_339 = util
    L5_339 = L5_339.fileToString
    L6_340 = A2_336
    L7_341 = _UPVALUE1_
    L6_340 = L6_340 .. L7_341
    L5_339 = L5_339(L6_340)
    L6_340 = x509Lib
    L6_340 = L6_340.certLoad
    L7_341 = L5_339
    L8_342 = _UPVALUE0_
    L8_342 = L6_340(L7_341, L8_342)
    if string.find(L8_342, "CN=") == nil then
      os.execute("rm" .. " /var/certs/ca.crt")
      return _UPVALUE2_.OPENVPN_CACERTIFICATE_LOAD_FAILED_ERR1
    end
    if L6_340 == -1 or string.find(L5_339, _UPVALUE3_) == _UPVALUE4_.NIL or string.find(L5_339, _UPVALUE5_) == _UPVALUE4_.NIL then
      os.remove(A2_336 .. _UPVALUE1_)
      return _UPVALUE2_.OPENVPN_CACERTIFICATE_LOAD_FAILED
    end
    return _UPVALUE4_.SUCCESS
  else
    L5_339 = _UPVALUE6_
    if A0_334 == L5_339 then
      L5_339 = os
      L5_339 = L5_339.execute
      L6_340 = "mv /tmp/"
      L7_341 = A1_335
      L8_342 = " "
      L6_340 = L6_340 .. L7_341 .. L8_342 .. A2_336 .. _UPVALUE7_
      L5_339 = L5_339(L6_340)
      L3_337 = L5_339
      L5_339 = util
      L5_339 = L5_339.fileToString
      L6_340 = A2_336
      L7_341 = _UPVALUE7_
      L6_340 = L6_340 .. L7_341
      L5_339 = L5_339(L6_340)
      L6_340 = x509Lib
      L6_340 = L6_340.certLoad
      L7_341 = L5_339
      L8_342 = _UPVALUE6_
      L8_342 = L6_340(L7_341, L8_342)
      if string.find(L8_342, "CN=") == nil then
        os.remove(A2_336 .. _UPVALUE7_)
        return _UPVALUE2_.OPENVPN_CACERTIFICATE_LOAD_FAILED_ERR1
      end
      if L6_340 == -1 or string.find(L5_339, _UPVALUE3_) == _UPVALUE4_.NIL or string.find(L5_339, _UPVALUE5_) == _UPVALUE4_.NIL then
        os.remove(A2_336 .. _UPVALUE7_)
        return _UPVALUE2_.OPENVPN_SERVERCERTIFICATE_LOAD_FAILED
      end
      return _UPVALUE4_.SUCCESS
    else
      L5_339 = _UPVALUE8_
      if A0_334 == L5_339 then
        L5_339 = os
        L5_339 = L5_339.execute
        L6_340 = "mv /tmp/"
        L7_341 = A1_335
        L8_342 = " "
        L6_340 = L6_340 .. L7_341 .. L8_342 .. A2_336 .. _UPVALUE9_
        L5_339 = L5_339(L6_340)
        L3_337 = L5_339
        L5_339 = util
        L5_339 = L5_339.fileToString
        L6_340 = A2_336
        L7_341 = _UPVALUE9_
        L6_340 = L6_340 .. L7_341
        L5_339 = L5_339(L6_340)
        L6_340 = string
        L6_340 = L6_340.find
        L7_341 = L5_339
        L8_342 = _UPVALUE10_
        L6_340 = L6_340(L7_341, L8_342)
        L7_341 = _UPVALUE4_
        L7_341 = L7_341.NIL
        if L6_340 ~= L7_341 then
          L6_340 = string
          L6_340 = L6_340.find
          L7_341 = L5_339
          L8_342 = _UPVALUE11_
          L6_340 = L6_340(L7_341, L8_342)
          L7_341 = _UPVALUE4_
          L7_341 = L7_341.NIL
        elseif L6_340 == L7_341 then
          L6_340 = string
          L6_340 = L6_340.find
          L7_341 = L5_339
          L8_342 = _UPVALUE12_
          L6_340 = L6_340(L7_341, L8_342)
          L7_341 = _UPVALUE4_
          L7_341 = L7_341.NIL
          if L6_340 ~= L7_341 then
            L6_340 = string
            L6_340 = L6_340.find
            L7_341 = L5_339
            L8_342 = _UPVALUE13_
            L6_340 = L6_340(L7_341, L8_342)
            L7_341 = _UPVALUE4_
            L7_341 = L7_341.NIL
          elseif L6_340 == L7_341 then
            L6_340 = os
            L6_340 = L6_340.remove
            L7_341 = A2_336
            L8_342 = _UPVALUE9_
            L7_341 = L7_341 .. L8_342
            L6_340(L7_341)
            L6_340 = _UPVALUE2_
            L6_340 = L6_340.OPENVPN_SERVERKEYCERTIFICATE_LOAD_FAILED
            return L6_340
          end
        end
        L6_340 = _UPVALUE4_
        L6_340 = L6_340.SUCCESS
        return L6_340
      else
        L5_339 = _UPVALUE14_
        if A0_334 == L5_339 then
          L5_339 = os
          L5_339 = L5_339.execute
          L6_340 = "mv /tmp/"
          L7_341 = A1_335
          L8_342 = " "
          L6_340 = L6_340 .. L7_341 .. L8_342 .. A2_336 .. _UPVALUE15_
          L5_339 = L5_339(L6_340)
          L3_337 = L5_339
          L5_339 = util
          L5_339 = L5_339.fileToString
          L6_340 = A2_336
          L7_341 = _UPVALUE15_
          L6_340 = L6_340 .. L7_341
          L5_339 = L5_339(L6_340)
          L6_340 = string
          L6_340 = L6_340.find
          L7_341 = L5_339
          L8_342 = _UPVALUE16_
          L6_340 = L6_340(L7_341, L8_342)
          L7_341 = _UPVALUE4_
          L7_341 = L7_341.NIL
          if L6_340 ~= L7_341 then
            L6_340 = string
            L6_340 = L6_340.find
            L7_341 = L5_339
            L8_342 = _UPVALUE17_
            L6_340 = L6_340(L7_341, L8_342)
            L7_341 = _UPVALUE4_
            L7_341 = L7_341.NIL
          elseif L6_340 == L7_341 then
            L6_340 = os
            L6_340 = L6_340.remove
            L7_341 = A2_336
            L8_342 = _UPVALUE15_
            L7_341 = L7_341 .. L8_342
            L6_340(L7_341)
            L6_340 = _UPVALUE2_
            L6_340 = L6_340.OPENVPN_DHCERTIFICATE_LOAD_FAILED
            return L6_340
          end
          L6_340 = _UPVALUE4_
          L6_340 = L6_340.SUCCESS
          return L6_340
        else
          L5_339 = _UPVALUE18_
          if A0_334 == L5_339 then
            L5_339 = os
            L5_339 = L5_339.execute
            L6_340 = "mv /tmp/"
            L7_341 = A1_335
            L8_342 = " "
            L6_340 = L6_340 .. L7_341 .. L8_342 .. A2_336 .. _UPVALUE19_
            L5_339(L6_340)
            L5_339 = util
            L5_339 = L5_339.fileToString
            L6_340 = A2_336
            L7_341 = _UPVALUE19_
            L6_340 = L6_340 .. L7_341
            L5_339 = L5_339(L6_340)
            L6_340 = string
            L6_340 = L6_340.find
            L7_341 = L5_339
            L8_342 = "client"
            L6_340 = L6_340(L7_341, L8_342)
            L7_341 = _UPVALUE4_
            L7_341 = L7_341.NIL
            L3_337 = L6_340 ~= L7_341 and L6_340 ~= L7_341 and L6_340 ~= L7_341
            if L3_337 then
              L6_340 = _UPVALUE4_
              L6_340 = L6_340.SUCCESS
              return L6_340
            else
              L6_340 = os
              L6_340 = L6_340.remove
              L7_341 = A2_336
              L8_342 = _UPVALUE19_
              L7_341 = L7_341 .. L8_342
              L6_340(L7_341)
              L6_340 = _UPVALUE2_
              L6_340 = L6_340.OPENVPN_ACCESSCERTIFICATE_LOAD_FAILED
              return L6_340
            end
          end
        end
      end
    end
  end
end
function uploadCertsCreate(A0_343)
  local L1_344, L2_345, L3_346, L4_347, L5_348, L6_349, L7_350, L8_351, L9_352, L10_353, L11_354, L12_355, L13_356, L14_357, L15_358, L16_359, L17_360, L18_361, L19_362
  L3_346 = {}
  L4_347, L5_348, L6_349, L7_350, L8_351, L9_352 = nil, nil, nil, nil, nil, nil
  L10_353 = util
  L10_353 = L10_353.fileExists
  L11_354 = "/var/certs/ca.crt"
  L10_353 = L10_353(L11_354)
  L11_354 = util
  L11_354 = L11_354.fileExists
  L12_355 = "/var/certs/server.crt"
  L11_354 = L11_354(L12_355)
  L12_355 = util
  L12_355 = L12_355.fileExists
  L13_356 = "/var/certs/server.key"
  L12_355 = L12_355(L13_356)
  L13_356 = util
  L13_356 = L13_356.fileExists
  L14_357 = "/var/certs/dh.pem"
  L13_356 = L13_356(L14_357)
  if L10_353 then
    L14_357 = util
    L14_357 = L14_357.fileToString
    L15_358 = "/var/certs/ca.crt"
    L14_357 = L14_357(L15_358)
    L4_347 = L14_357
    L14_357, L15_358, L16_359, L17_360, L18_361, L19_362 = nil, nil, nil, nil, nil, nil
    L14_357, L15_358, L5_348, L16_359, L17_360, L18_361, L19_362 = x509Lib.certLoad(L4_347, "ca")
    if L14_357 == -1 then
      return false
    end
    os.execute("rm" .. " /var/certs/ca.crt")
  else
    L14_357 = _UPVALUE0_
    L14_357 = L14_357.CA_UPLOAD_BUTTON
    return L14_357
  end
  if L11_354 ~= true or L12_355 == true then
  else
    L14_357 = _UPVALUE0_
    L14_357 = L14_357.SERVER_CERT_KEY_UPLOAD_BUTTON
    return L14_357
  end
  if L11_354 then
    L14_357 = util
    L14_357 = L14_357.fileToString
    L15_358 = "/var/certs/server.crt"
    L14_357 = L14_357(L15_358)
    L7_350 = L14_357
    L14_357, L15_358, L16_359, L17_360, L18_361, L19_362 = nil, nil, nil, nil, nil, nil
    L14_357, L15_358, L6_349, L16_359, L17_360, L18_361, L19_362 = x509Lib.certLoad(L7_350, "crt")
    if L14_357 == -1 then
      return false
    end
    os.execute("rm" .. " /var/certs/server.crt")
  end
  if L12_355 then
    L14_357 = util
    L14_357 = L14_357.fileToString
    L15_358 = "/var/certs/server.key"
    L14_357 = L14_357(L15_358)
    L8_351 = L14_357
    L14_357 = os
    L14_357 = L14_357.execute
    L15_358 = "rm"
    L16_359 = " /var/certs/server.key"
    L15_358 = L15_358 .. L16_359
    L14_357(L15_358)
  end
  if L13_356 then
    L14_357 = util
    L14_357 = L14_357.fileToString
    L15_358 = "/var/certs/dh.pem"
    L14_357 = L14_357(L15_358)
    L9_352 = L14_357
    L14_357 = os
    L14_357 = L14_357.execute
    L15_358 = "rm"
    L16_359 = " /var/certs/dh.pem"
    L15_358 = L15_358 .. L16_359
    L14_357(L15_358)
  end
  L3_346["OpenvpnAuthCertificates.name"] = A0_343
  L3_346["OpenvpnAuthCertificates.caSubjectName"] = L5_348
  L3_346["OpenvpnAuthCertificates.crtSubjectName"] = L6_349
  L3_346["OpenvpnAuthCertificates.caCertData"] = L4_347
  L3_346["OpenvpnAuthCertificates.crtCertData"] = L7_350
  L3_346["OpenvpnAuthCertificates.keyCertData"] = L8_351
  L3_346["OpenvpnAuthCertificates.dhCertData"] = L9_352
  if L8_351 then
    L3_346["OpenvpnAuthCertificates.keyExist"] = "yes"
  else
    L3_346["OpenvpnAuthCertificates.keyExist"] = "no"
  end
  if L9_352 then
    L3_346["OpenvpnAuthCertificates.dhExist"] = "yes"
  else
    L3_346["OpenvpnAuthCertificates.dhExist"] = "no"
  end
  L14_357 = db
  L14_357 = L14_357.insert
  L15_358 = "OpenvpnAuthCertificates"
  L16_359 = L3_346
  L14_357 = L14_357(L15_358, L16_359)
  L1_344 = L14_357
  if L1_344 then
  else
    L14_357 = _UPVALUE0_
    L14_357 = L14_357.CERTS_NOT_FOUND
    return L14_357
  end
  L14_357 = _UPVALUE1_
  L14_357 = L14_357.SUCCESS
  return L14_357
end
function uploadTlsCrlSet(A0_363, A1_364, A2_365, A3_366)
  local L4_367, L5_368, L6_369
  L5_368 = {}
  L6_369 = nil
  if A0_363 == _UPVALUE0_ then
    L4_367 = os.execute("mv /tmp/" .. A1_364 .. " " .. A2_365 .. _UPVALUE1_)
    L6_369 = util.fileToString(A2_365 .. _UPVALUE1_)
    if string.find(L6_369, _UPVALUE2_) == _UPVALUE3_.NIL or string.find(L6_369, _UPVALUE4_) == _UPVALUE3_.NIL then
      os.remove(A2_365 .. _UPVALUE1_)
      return _UPVALUE5_.OPENVPN_TACERTIFICATE_LOAD_FAILED
    end
    L5_368["OpenvpnTlsCertificates.name"] = A3_366
    L5_368["OpenvpnTlsCertificates.tlsCertData"] = L6_369
    if L6_369 then
      L5_368["OpenvpnTlsCertificates.tlsExist"] = "yes"
    else
      L5_368["OpenvpnTlsCertificates.tlsExist"] = "no"
    end
    L4_367 = db.insert("OpenvpnTlsCertificates", L5_368)
  elseif A0_363 == _UPVALUE6_ then
    L4_367 = os.execute("mv /tmp/" .. A1_364 .. " " .. A2_365 .. "openvpn/" .. _UPVALUE7_)
    L6_369 = util.fileToString(A2_365 .. "openvpn/" .. _UPVALUE7_)
    if string.find(L6_369, _UPVALUE8_) == nil or string.find(L6_369, _UPVALUE9_) == nil then
      os.remove(A2_365 .. "openvpn/" .. _UPVALUE7_)
      return _UPVALUE5_.OPENVPN_CRLCERTIFICATE_LOAD_FAILED
    end
    L5_368["OpenvpnCrlCertificates.name"] = A3_366
    L5_368["OpenvpnCrlCertificates.crlCertData"] = L6_369
    if L6_369 then
      L5_368["OpenvpnCrlCertificates.crlExist"] = "yes"
    else
      L5_368["OpenvpnCrlCertificates.crlExist"] = "no"
    end
    L4_367 = db.insert("OpenvpnCrlCertificates", L5_368)
  end
  if L4_367 then
  else
    return _UPVALUE5_.CERTS_NOT_FOUND
  end
  return _UPVALUE3_.SUCCESS
end
function uploadStatusGet(A0_370)
  local L1_371
  L1_371 = false
  if A0_370 == _UPVALUE0_ then
    L1_371 = util.fileExists(_UPVALUE1_ .. _UPVALUE2_) or util.fileExists(_UPVALUE1_ .. "openvpn/" .. _UPVALUE2_)
    return L1_371
  elseif A0_370 == _UPVALUE3_ then
    L1_371 = util.fileExists(_UPVALUE1_ .. _UPVALUE4_) or util.fileExists(_UPVALUE1_ .. "openvpn/" .. _UPVALUE4_)
    return L1_371
  elseif A0_370 == _UPVALUE5_ then
    L1_371 = util.fileExists(_UPVALUE1_ .. _UPVALUE6_) or util.fileExists(_UPVALUE1_ .. "openvpn/" .. _UPVALUE6_)
    return L1_371
  elseif A0_370 == _UPVALUE7_ then
    L1_371 = util.fileExists(_UPVALUE1_ .. _UPVALUE8_) or util.fileExists(_UPVALUE1_ .. "openvpn/" .. _UPVALUE8_)
    return L1_371
  elseif A0_370 == _UPVALUE9_ then
    L1_371 = util.fileExists(_UPVALUE1_ .. _UPVALUE10_) or util.fileExists(_UPVALUE1_ .. "openvpn/" .. _UPVALUE10_)
    return L1_371
  elseif A0_370 == _UPVALUE11_ then
    L1_371 = util.fileExists(_UPVALUE1_ .. _UPVALUE12_) or util.fileExists(_UPVALUE1_ .. "openvpn/" .. _UPVALUE12_)
    return L1_371
  elseif A0_370 == _UPVALUE13_ then
    L1_371 = util.fileExists(_UPVALUE1_ .. _UPVALUE14_) or util.fileExists("/var/" .. "openvpn/" .. _UPVALUE14_)
    return L1_371
  end
end
function openvpnCertsAdd(A0_372, A1_373, A2_374, A3_375, A4_376)
  local L5_377, L6_378, L7_379, L8_380, L9_381, L10_382, L11_383, L12_384, L13_385, L14_386, L15_387, L16_388, L17_389, L18_390, L19_391, L20_392
  L5_377 = false
  L6_378 = true
  L7_379 = util
  L7_379 = L7_379.fileExists
  L8_380 = "/var/certs/ca.crt"
  L7_379 = L7_379(L8_380)
  L8_380 = util
  L8_380 = L8_380.fileExists
  L9_381 = "/var/certs/server.crt"
  L8_380 = L8_380(L9_381)
  L9_381 = util
  L9_381 = L9_381.fileExists
  L10_382 = "/var/certs/server.key"
  L9_381 = L9_381(L10_382)
  L10_382 = util
  L10_382 = L10_382.fileExists
  L11_383 = "/var/certs/dh.pem"
  L10_382 = L10_382(L11_383)
  L11_383 = db
  L11_383 = L11_383.getAttribute
  L12_384 = "OpenvpnCertificates"
  L13_385 = "certType"
  L14_386 = "ca"
  L15_387 = "certData"
  L11_383 = L11_383(L12_384, L13_385, L14_386, L15_387)
  L12_384 = db
  L12_384 = L12_384.getAttribute
  L13_385 = "OpenvpnCertificates"
  L14_386 = "certType"
  L15_387 = "crt"
  L16_388 = "certData"
  L12_384 = L12_384(L13_385, L14_386, L15_387, L16_388)
  L13_385 = db
  L13_385 = L13_385.getAttribute
  L14_386 = "OpenvpnCertificates"
  L15_387 = "certType"
  L16_388 = "key"
  L17_389 = "certData"
  L13_385 = L13_385(L14_386, L15_387, L16_388, L17_389)
  L14_386 = db
  L14_386 = L14_386.getAttribute
  L15_387 = "OpenvpnCertificates"
  L16_388 = "certType"
  L17_389 = "dh"
  L18_390 = "certData"
  L14_386 = L14_386(L15_387, L16_388, L17_389, L18_390)
  L15_387 = db
  L15_387 = L15_387.getAttribute
  L16_388 = openvpnTable
  L17_389 = _UPVALUE0_
  L18_390 = _UPVALUE1_
  L19_391 = _UPVALUE2_
  L19_391 = L19_391.mode
  L15_387 = L15_387(L16_388, L17_389, L18_390, L19_391)
  L16_388 = db
  L16_388 = L16_388.getAttribute
  L17_389 = "OpenVpn"
  L18_390 = "_ROWID_"
  L19_391 = "1"
  L20_392 = "UploadCaOnly"
  L16_388 = L16_388(L17_389, L18_390, L19_391, L20_392)
  if L7_379 == true and L8_380 == true and L9_381 == true and L11_383 == nil and L12_384 == nil and L13_385 == nil then
    L17_389 = A0_372["PrimaryCertTable.Check"]
    if L17_389 == "1" then
      L17_389 = addSet
      L18_390 = "ca"
      L17_389 = L17_389(L18_390)
      L6_378 = L17_389 and L6_378
      L17_389 = os
      L17_389 = L17_389.execute
      L18_390 = "rm"
      L19_391 = " /var/certs/ca.crt"
      L18_390 = L18_390 .. L19_391
      L17_389(L18_390)
      L17_389 = addSet
      L18_390 = "crt"
      L17_389 = L17_389(L18_390)
      L6_378 = L17_389 and L6_378
      L17_389 = os
      L17_389 = L17_389.execute
      L18_390 = "rm"
      L19_391 = " /var/certs/server.crt"
      L18_390 = L18_390 .. L19_391
      L17_389(L18_390)
      L17_389 = addSet
      L18_390 = "key"
      L17_389 = L17_389(L18_390)
      L6_378 = L17_389 and L6_378
      L17_389 = os
      L17_389 = L17_389.execute
      L18_390 = "rm"
      L19_391 = " /var/certs/server.key"
      L18_390 = L18_390 .. L19_391
      L17_389(L18_390)
      if A4_376 == "server" then
        L17_389 = addSet
        L18_390 = "dh"
        L17_389 = L17_389(L18_390)
        L6_378 = L17_389 and L6_378
        L17_389 = os
        L17_389 = L17_389.execute
        L18_390 = "rm"
        L19_391 = " /var/certs/dh.pem"
        L18_390 = L18_390 .. L19_391
        L17_389(L18_390)
        L10_382 = false
      end
      if L6_378 then
      else
        L17_389 = _UPVALUE3_
        L17_389 = L17_389.CERTS_NOT_FOUND
        return L17_389
      end
    end
  elseif L10_382 == true and A4_376 == "server" and L14_386 == nil then
    L17_389 = A0_372["PrimaryCertTable.Check"]
    if L17_389 == "1" then
      L17_389 = db
      L17_389 = L17_389.getAttribute
      L18_390 = "OpenvpnCertificates"
      L19_391 = "certType"
      L20_392 = "dh"
      L17_389 = L17_389(L18_390, L19_391, L20_392, "_ROWID_")
      if L17_389 ~= nil then
        L18_390 = editSet
        L19_391 = "dh"
        L20_392 = L17_389
        L18_390 = L18_390(L19_391, L20_392)
        L6_378 = L18_390 and L6_378
      else
        L18_390 = addSet
        L19_391 = "dh"
        L18_390 = L18_390(L19_391)
        L6_378 = L18_390 and L6_378
      end
      L18_390 = os
      L18_390 = L18_390.execute
      L19_391 = "rm"
      L20_392 = " /var/certs/dh.pem"
      L19_391 = L19_391 .. L20_392
      L18_390(L19_391)
      L10_382 = false
      if L6_378 then
      else
        L18_390 = _UPVALUE3_
        L18_390 = L18_390.CERTS_NOT_FOUND
        return L18_390
      end
    end
  elseif A4_376 == "server" and L10_382 == false and L14_386 == nil then
    L17_389 = _UPVALUE3_
    L17_389 = L17_389.CERTS_NOT_FOUND
    return L17_389
  end
  if L11_383 ~= nil and L12_384 ~= nil and L13_385 ~= nil then
    L17_389 = A0_372["PrimaryCertTable.Check"]
    if L17_389 == "1" and A4_376 == "server" and L15_387 ~= nil then
      L17_389 = tonumber
      L18_390 = L15_387
      L17_389 = L17_389(L18_390)
      if L17_389 ~= 0 and L10_382 == true then
        L17_389 = addSet
        L18_390 = "dh"
        L17_389 = L17_389(L18_390)
        L6_378 = L17_389 and L6_378
        L17_389 = os
        L17_389 = L17_389.execute
        L18_390 = "rm"
        L19_391 = " /var/certs/dh.pem"
        L18_390 = L18_390 .. L19_391
        L17_389(L18_390)
      end
    end
  end
  if L7_379 == true and L8_380 == true and L9_381 == true and L11_383 ~= nil and L12_384 ~= nil and L13_385 ~= nil then
    L17_389 = A1_373["SecondaryCertTable.Check"]
    if L17_389 == "1" then
      L17_389 = db
      L17_389 = L17_389.getAttribute
      L18_390 = "OpenvpnCertificates"
      L19_391 = "certType"
      L20_392 = "ca"
      L17_389 = L17_389(L18_390, L19_391, L20_392, "_ROWID_")
      L18_390 = editSet
      L19_391 = "ca"
      L20_392 = L17_389
      L18_390 = L18_390(L19_391, L20_392)
      L6_378 = L18_390 and L6_378
      L18_390 = os
      L18_390 = L18_390.execute
      L19_391 = "rm"
      L20_392 = " /var/certs/ca.crt"
      L19_391 = L19_391 .. L20_392
      L18_390(L19_391)
      L18_390 = db
      L18_390 = L18_390.getAttribute
      L19_391 = "OpenvpnCertificates"
      L20_392 = "certType"
      L18_390 = L18_390(L19_391, L20_392, "crt", "_ROWID_")
      L19_391 = editSet
      L20_392 = "crt"
      L19_391 = L19_391(L20_392, L18_390)
      L6_378 = L19_391 and L6_378
      L19_391 = os
      L19_391 = L19_391.execute
      L20_392 = "rm"
      L20_392 = L20_392 .. " /var/certs/server.crt"
      L19_391(L20_392)
      L19_391 = db
      L19_391 = L19_391.getAttribute
      L20_392 = "OpenvpnCertificates"
      L19_391 = L19_391(L20_392, "certType", "key", "_ROWID_")
      L20_392 = editSet
      L20_392 = L20_392("key", L19_391)
      L6_378 = L20_392 and L6_378
      L20_392 = os
      L20_392 = L20_392.execute
      L20_392("rm" .. " /var/certs/server.key")
      if A4_376 == "server" then
        L20_392 = db
        L20_392 = L20_392.getAttribute
        L20_392 = L20_392("OpenvpnCertificates", "certType", "dh", "_ROWID_")
        if L20_392 ~= nil then
          L6_378 = editSet("dh", L20_392) and L6_378
        else
          L6_378 = addSet("dh") and L6_378
        end
        os.execute("rm" .. " /var/certs/dh.pem")
      end
      if L6_378 then
      else
        L20_392 = _UPVALUE3_
        L20_392 = L20_392.CERTS_NOT_FOUND
        return L20_392
      end
    end
  end
  if A2_374 == "1" then
    L17_389 = util
    L17_389 = L17_389.fileExists
    L18_390 = "/var/certs/ta.key"
    L17_389 = L17_389(L18_390)
    if L17_389 then
      L17_389 = db
      L17_389 = L17_389.getAttribute
      L18_390 = "OpenvpnCertificates"
      L19_391 = "certType"
      L20_392 = "ta"
      L17_389 = L17_389(L18_390, L19_391, L20_392, "_ROWID_")
      if L17_389 == nil then
        L18_390 = addSet
        L19_391 = "ta"
        L18_390 = L18_390(L19_391)
        L6_378 = L18_390 and L6_378
      else
        L18_390 = editSet
        L19_391 = "ta"
        L20_392 = L17_389
        L18_390 = L18_390(L19_391, L20_392)
        L6_378 = L18_390 and L6_378
      end
      if L6_378 then
      else
        L18_390 = _UPVALUE3_
        L18_390 = L18_390.TA_CERT_FAILED
        return L18_390
      end
      L18_390 = os
      L18_390 = L18_390.execute
      L19_391 = "rm"
      L20_392 = " /var/certs/ta.key"
      L19_391 = L19_391 .. L20_392
      L18_390(L19_391)
    end
  end
  if A3_375 ~= nil and A3_375 == "1" then
    L17_389 = util
    L17_389 = L17_389.fileExists
    L18_390 = "/var/certs/openvpn/crl.pem"
    L17_389 = L17_389(L18_390)
    if L17_389 then
      L17_389 = db
      L17_389 = L17_389.getAttribute
      L18_390 = "OpenvpnCertificates"
      L19_391 = "certType"
      L20_392 = "crl"
      L17_389 = L17_389(L18_390, L19_391, L20_392, "_ROWID_")
      if L17_389 == nil then
        L18_390 = addSet
        L19_391 = "crl"
        L18_390 = L18_390(L19_391)
        L6_378 = L18_390 and L6_378
      else
        L18_390 = editSet
        L19_391 = "crl"
        L20_392 = L17_389
        L18_390 = L18_390(L19_391, L20_392)
        L6_378 = L18_390 and L6_378
      end
      if L6_378 then
      else
        L18_390 = _UPVALUE3_
        L18_390 = L18_390.CRL_CERT_FAILED
        return L18_390
      end
      L18_390 = os
      L18_390 = L18_390.execute
      L19_391 = "rm"
      L20_392 = " /var/certs/openvpn/crl.pem"
      L19_391 = L19_391 .. L20_392
      L18_390(L19_391)
    end
  end
  if L7_379 == true and L11_383 == nil and A4_376 ~= "server" then
    L17_389 = tonumber
    L18_390 = L16_388
    L17_389 = L17_389(L18_390)
    if L17_389 == 1 then
      L17_389 = addSet
      L18_390 = "ca"
      L17_389 = L17_389(L18_390)
      L6_378 = L17_389 and L6_378
      L17_389 = os
      L17_389 = L17_389.execute
      L18_390 = "rm"
      L19_391 = " /var/certs/ca.crt"
      L18_390 = L18_390 .. L19_391
      L17_389(L18_390)
      if L6_378 then
      else
        L17_389 = _UPVALUE3_
        L17_389 = L17_389.CERTS_NOT_FOUND
        return L17_389
      end
    end
  elseif L7_379 == true and L11_383 ~= nil and A4_376 ~= "server" then
    L17_389 = tonumber
    L18_390 = L16_388
    L17_389 = L17_389(L18_390)
    if L17_389 == 1 then
      L17_389 = db
      L17_389 = L17_389.getAttribute
      L18_390 = "OpenvpnCertificates"
      L19_391 = "certType"
      L20_392 = "ca"
      L17_389 = L17_389(L18_390, L19_391, L20_392, "_ROWID_")
      L18_390 = editSet
      L19_391 = "ca"
      L20_392 = L17_389
      L18_390 = L18_390(L19_391, L20_392)
      L6_378 = L18_390 and L6_378
      L18_390 = os
      L18_390 = L18_390.execute
      L19_391 = "rm"
      L20_392 = " /var/certs/ca.crt"
      L19_391 = L19_391 .. L20_392
      L18_390(L19_391)
      if L6_378 then
      else
        L18_390 = _UPVALUE3_
        L18_390 = L18_390.CERTS_NOT_FOUND
        return L18_390
      end
    end
  end
  L17_389 = _UPVALUE4_
  L17_389 = L17_389.SUCCESS
  return L17_389
end
function addSet(A0_393)
  local L1_394, L2_395, L3_396
  L1_394 = false
  if A0_393 == "ca" then
    L2_395 = {}
    L3_396 = nil
    L3_396 = util.fileToString("/var/certs/ca.crt")
    if x509Lib.certLoad(L3_396, "ca") == -1 then
      return false
    end
    L2_395["OpenvpnCertificates.format"], L2_395["OpenvpnCertificates.serialNumber"], L2_395["OpenvpnCertificates.expiryTime"], L2_395["OpenvpnCertificates.issuerName"], L2_395["OpenvpnCertificates.subjectName"], L2_395["OpenvpnCertificates.name"] = x509Lib.certLoad(L3_396, "ca")
    L2_395["OpenvpnCertificates.certType"] = "ca"
    L2_395["OpenvpnCertificates.certData"] = L3_396
    L1_394 = db.insert("OpenvpnCertificates", L2_395)
    return L1_394
  elseif A0_393 == "crt" then
    L2_395 = {}
    L3_396 = nil
    L3_396 = util.fileToString("/var/certs/server.crt")
    if x509Lib.certLoad(L3_396, "crt") == -1 then
      return false
    end
    L2_395["OpenvpnCertificates.format"], L2_395["OpenvpnCertificates.serialNumber"], L2_395["OpenvpnCertificates.expiryTime"], L2_395["OpenvpnCertificates.issuerName"], L2_395["OpenvpnCertificates.subjectName"], L2_395["OpenvpnCertificates.name"] = x509Lib.certLoad(L3_396, "crt")
    L2_395["OpenvpnCertificates.certType"] = "crt"
    L2_395["OpenvpnCertificates.certData"] = L3_396
    L1_394 = db.insert("OpenvpnCertificates", L2_395)
    return L1_394
  elseif A0_393 == "key" then
    L2_395 = {}
    L3_396 = nil
    L3_396 = util.fileToString("/var/certs/server.key")
    L2_395["OpenvpnCertificates.certType"] = "key"
    L2_395["OpenvpnCertificates.certData"] = L3_396
    L1_394 = db.insert("OpenvpnCertificates", L2_395)
    return L1_394
  elseif A0_393 == "dh" then
    L2_395 = {}
    L3_396 = nil
    L3_396 = util.fileToString("/var/certs/dh.pem")
    L2_395["OpenvpnCertificates.certType"] = "dh"
    L2_395["OpenvpnCertificates.certData"] = L3_396
    L1_394 = db.insert("OpenvpnCertificates", L2_395)
    return L1_394
  elseif A0_393 == "ta" then
    L2_395 = {}
    L3_396 = nil
    L3_396 = util.fileToString("/var/certs/ta.key")
    L2_395["OpenvpnCertificates.certType"] = "ta"
    L2_395["OpenvpnCertificates.certData"] = L3_396
    L1_394 = db.insert("OpenvpnCertificates", L2_395)
    return L1_394
  else
    L2_395 = _UPVALUE0_
    if A0_393 == L2_395 then
      L2_395 = {}
      L3_396 = nil
      L3_396 = util.fileToString("/var/certs/openvpn/crl.pem")
      L2_395["OpenvpnCertificates.certType"] = "crl"
      L2_395["OpenvpnCertificates.certData"] = L3_396
      L1_394 = db.insert("OpenvpnCertificates", L2_395)
      return L1_394
    elseif A0_393 == "config" then
      L2_395 = {}
      L3_396 = nil
      assert(io.open("/var/certs/client.ovpn", "a")):write("daemon\n")
      assert(io.open("/var/certs/client.ovpn", "a")):write("writepid /var/run/openvpn.pid\n")
      assert(io.open("/var/certs/client.ovpn", "a")):write("log /var/openvpn/openvpn.log\n")
      assert(io.open("/var/certs/client.ovpn", "a")):close()
      L3_396 = util.fileToString("/var/certs/client.ovpn")
      L3_396 = string.gsub(L3_396, "'", "")
      L2_395["OpenvpnCertificates.certType"] = "config"
      L2_395["OpenvpnCertificates.certData"] = L3_396
      L1_394 = db.insert("OpenvpnCertificates", L2_395)
      return L1_394
    end
  end
end
function editSet(A0_397, A1_398)
  local L2_399, L3_400, L4_401, L5_402, L6_403
  L2_399 = false
  L3_400 = db
  L3_400 = L3_400.getRow
  L4_401 = "OpenvpnCertificates"
  L5_402 = "_ROWID_"
  L6_403 = A1_398
  L3_400 = L3_400(L4_401, L5_402, L6_403)
  L4_401 = L3_400["OpenvpnCertificates.certType"]
  if L4_401 == "ca" then
    L4_401 = nil
    L5_402 = util
    L5_402 = L5_402.fileToString
    L6_403 = "/var/certs/ca.crt"
    L5_402 = L5_402(L6_403)
    L4_401 = L5_402
    L5_402 = x509Lib
    L5_402 = L5_402.certLoad
    L6_403 = L4_401
    L6_403 = L5_402(L6_403, "ca")
    if L5_402 == -1 then
      return false
    end
    L3_400["OpenvpnCertificates.format"], L3_400["OpenvpnCertificates.serialNumber"], L3_400["OpenvpnCertificates.expiryTime"], L3_400["OpenvpnCertificates.issuerName"], L3_400["OpenvpnCertificates.subjectName"], L3_400["OpenvpnCertificates.name"] = L5_402(L6_403, "ca")
    L3_400["OpenvpnCertificates.format"], L3_400["OpenvpnCertificates.serialNumber"], L3_400["OpenvpnCertificates.expiryTime"], L3_400["OpenvpnCertificates.issuerName"], L3_400["OpenvpnCertificates.subjectName"], L3_400["OpenvpnCertificates.name"] = L5_402(L6_403, "ca")
    L3_400["OpenvpnCertificates.certData"] = L4_401
    L5_402 = db.update("OpenvpnCertificates", L3_400, A1_398)
    return L5_402
  else
    L4_401 = L3_400["OpenvpnCertificates.certType"]
    if L4_401 == "crt" then
      L4_401 = {}
      L5_402 = nil
      L6_403 = util
      L6_403 = L6_403.fileToString
      L6_403 = L6_403("/var/certs/server.crt")
      L5_402 = L6_403
      L6_403 = x509Lib
      L6_403 = L6_403.certLoad
      L6_403 = L6_403(L5_402, "crt")
      if L6_403 == -1 then
        return false
      end
      L4_401["OpenvpnCertificates.format"], L4_401["OpenvpnCertificates.serialNumber"], L4_401["OpenvpnCertificates.expiryTime"], L4_401["OpenvpnCertificates.issuerName"], L4_401["OpenvpnCertificates.subjectName"], L4_401["OpenvpnCertificates.name"] = L6_403(L5_402, "crt")
      L4_401["OpenvpnCertificates.certData"] = L5_402
      L6_403 = db.update("OpenvpnCertificates", L4_401, A1_398)
      return L6_403
    else
      L4_401 = L3_400["OpenvpnCertificates.certType"]
      if L4_401 == "key" then
        L4_401 = {}
        L5_402 = nil
        L6_403 = util
        L6_403 = L6_403.fileToString
        L6_403 = L6_403("/var/certs/server.key")
        L5_402 = L6_403
        L4_401["OpenvpnCertificates.certData"] = L5_402
        L6_403 = db
        L6_403 = L6_403.update
        L6_403 = L6_403("OpenvpnCertificates", L4_401, A1_398)
        L2_399 = L6_403
        return L2_399
      else
        L4_401 = L3_400["OpenvpnCertificates.certType"]
        if L4_401 == "dh" then
          L4_401 = {}
          L5_402 = nil
          L6_403 = util
          L6_403 = L6_403.fileToString
          L6_403 = L6_403("/var/certs/dh.pem")
          L5_402 = L6_403
          L4_401["OpenvpnCertificates.certData"] = L5_402
          L6_403 = db
          L6_403 = L6_403.update
          L6_403 = L6_403("OpenvpnCertificates", L4_401, A1_398)
          L2_399 = L6_403
          return L2_399
        else
          L4_401 = L3_400["OpenvpnCertificates.certType"]
          if L4_401 == "ta" then
            L4_401 = {}
            L5_402 = nil
            L6_403 = util
            L6_403 = L6_403.fileToString
            L6_403 = L6_403("/var/certs/ta.key")
            L5_402 = L6_403
            L4_401["OpenvpnCertificates.certData"] = L5_402
            L6_403 = db
            L6_403 = L6_403.update
            L6_403 = L6_403("OpenvpnCertificates", L4_401, A1_398)
            L2_399 = L6_403
            return L2_399
          else
            L4_401 = L3_400["OpenvpnCertificates.certType"]
            L5_402 = _UPVALUE0_
            if L4_401 == L5_402 then
              L4_401 = {}
              L5_402 = nil
              L6_403 = util
              L6_403 = L6_403.fileToString
              L6_403 = L6_403("/var/certs/openvpn/crl.pem")
              L5_402 = L6_403
              L4_401["OpenvpnCertificates.certData"] = L5_402
              L6_403 = db
              L6_403 = L6_403.update
              L6_403 = L6_403("OpenvpnCertificates", L4_401, A1_398)
              L2_399 = L6_403
              return L2_399
            else
              L4_401 = L3_400["OpenvpnCertificates.certType"]
              if L4_401 == "config" then
                L4_401 = {}
                L5_402 = nil
                L6_403 = assert
                L6_403 = L6_403(io.open("/var/certs/client.ovpn", "a"))
                L6_403:write("daemon\n")
                L6_403:write("writepid /var/run/openvpn.pid\n")
                L6_403:write("log /var/openvpn/openvpn.log\n")
                L6_403:close()
                L5_402 = util.fileToString("/var/certs/client.ovpn")
                L5_402 = string.gsub(L5_402, "'", "")
                L4_401["OpenvpnCertificates.certData"] = L5_402
                L2_399 = db.update("OpenvpnCertificates", L4_401, A1_398)
                return L2_399
              end
            end
          end
        end
      end
    end
  end
end
function openvpnAccessCertsAdd()
  local L0_404
  L0_404 = db
  L0_404 = L0_404.getAttribute
  L0_404 = L0_404("OpenvpnCertificates", "certType", "config", "_ROWID_")
  if L0_404 == nil then
    status = addSet("config") and status
  else
    status = editSet("config", L0_404) and status
  end
  if status then
  else
    return _UPVALUE0_.ACCESS_CERT_FAILED
  end
  os.execute("rm" .. " /var/certs/client.ovpn")
  return _UPVALUE1_.SUCCESS
end
function verifyCertificatesStatus(A0_405)
  local L1_406, L2_407, L3_408, L4_409, L5_410, L6_411, L7_412, L8_413
  L1_406 = false
  L2_407 = db
  L2_407 = L2_407.getAttribute
  L3_408 = "OpenvpnCertificates"
  L4_409 = "certType"
  L5_410 = "ca"
  L6_411 = "certData"
  L2_407 = L2_407(L3_408, L4_409, L5_410, L6_411)
  L3_408 = db
  L3_408 = L3_408.getAttribute
  L4_409 = "OpenvpnCertificates"
  L5_410 = "certType"
  L6_411 = "crt"
  L7_412 = "certData"
  L3_408 = L3_408(L4_409, L5_410, L6_411, L7_412)
  L4_409 = db
  L4_409 = L4_409.getAttribute
  L5_410 = "OpenvpnCertificates"
  L6_411 = "certType"
  L7_412 = "key"
  L8_413 = "certData"
  L4_409 = L4_409(L5_410, L6_411, L7_412, L8_413)
  L5_410 = db
  L5_410 = L5_410.getAttribute
  L6_411 = "OpenvpnCertificates"
  L7_412 = "certType"
  L8_413 = "dh"
  L5_410 = L5_410(L6_411, L7_412, L8_413, "certData")
  L6_411 = db
  L6_411 = L6_411.getAttribute
  L7_412 = openvpnTable
  L8_413 = _UPVALUE0_
  L6_411 = L6_411(L7_412, L8_413, _UPVALUE1_, _UPVALUE2_.mode)
  L7_412 = db
  L7_412 = L7_412.getAttribute
  L8_413 = "OpenVpn"
  L7_412 = L7_412(L8_413, "_ROWID_", "1", "UploadCaOnly")
  L8_413 = false
  if L2_407 ~= nil and L3_408 ~= nil and L4_409 ~= nil then
    if L5_410 ~= nil and A0_405 == "server" or A0_405 == "client" then
      return false
    elseif util.fileExists("/var/certs/dh.pem") and L6_411 ~= nil and L6_411 ~= 0 and A0_405 == "server" then
      return false
    end
  elseif L2_407 ~= nil and L7_412 == "1" then
    return false
  end
  L1_406 = util.fileExists("/var/certs/ca.crt") and util.fileExists("/var/certs/server.crt") and util.fileExists("/var/certs/server.key")
  L8_413 = util.fileExists("/var/certs/ca.crt")
  if L1_406 and util.fileExists("/var/certs/dh.pem") and A0_405 == "server" or L1_406 and A0_405 == "client" then
    return false
  elseif L8_413 and L7_412 == "1" then
    return false
  else
    return true
  end
end
function certsEditGet()
  local L0_414, L1_415, L2_416, L3_417, L4_418, L5_419, L6_420, L7_421, L8_422, L9_423, L10_424, L11_425, L12_426, L13_427, L14_428, L15_429, L16_430, L17_431, L18_432, L19_433, L20_434, L21_435, L22_436
  L0_414 = {}
  L1_415 = {}
  L2_416 = util
  L2_416 = L2_416.fileExists
  L3_417 = "/var/certs/ca.crt"
  L2_416 = L2_416(L3_417)
  L3_417 = util
  L3_417 = L3_417.fileExists
  L4_418 = "/var/certs/server.crt"
  L3_417 = L3_417(L4_418)
  L4_418 = util
  L4_418 = L4_418.fileExists
  L5_419 = "/var/certs/server.key"
  L4_418 = L4_418(L5_419)
  L5_419 = util
  L5_419 = L5_419.fileExists
  L6_420 = "/var/certs/dh.pem"
  L5_419 = L5_419(L6_420)
  L6_420 = db
  L6_420 = L6_420.getAttribute
  L7_421 = "OpenvpnCertificates"
  L8_422 = "certType"
  L9_423 = "ca"
  L10_424 = "certData"
  L6_420 = L6_420(L7_421, L8_422, L9_423, L10_424)
  L7_421 = db
  L7_421 = L7_421.getAttribute
  L8_422 = "OpenvpnCertificates"
  L9_423 = "certType"
  L10_424 = "crt"
  L11_425 = "certData"
  L7_421 = L7_421(L8_422, L9_423, L10_424, L11_425)
  L8_422 = db
  L8_422 = L8_422.getAttribute
  L9_423 = "OpenvpnCertificates"
  L10_424 = "certType"
  L11_425 = "key"
  L12_426 = "certData"
  L8_422 = L8_422(L9_423, L10_424, L11_425, L12_426)
  L9_423 = db
  L9_423 = L9_423.getAttribute
  L10_424 = "OpenvpnCertificates"
  L11_425 = "certType"
  L12_426 = "dh"
  L13_427 = "certData"
  L9_423 = L9_423(L10_424, L11_425, L12_426, L13_427)
  L10_424 = tonumber
  L11_425 = db
  L11_425 = L11_425.getAttribute
  L12_426 = "OpenVpn"
  L13_427 = "_ROWID_"
  L14_428 = "1"
  L15_429 = "OpenVpnMode"
  L22_436 = L11_425(L12_426, L13_427, L14_428, L15_429)
  L10_424 = L10_424(L11_425, L12_426, L13_427, L14_428, L15_429, L16_430, L17_431, L18_432, L19_433, L20_434, L21_435, L22_436, L11_425(L12_426, L13_427, L14_428, L15_429))
  L11_425 = db
  L11_425 = L11_425.getAttribute
  L12_426 = "OpenVpn"
  L13_427 = "_ROWID_"
  L14_428 = "1"
  L15_429 = "UploadCaOnly"
  L11_425 = L11_425(L12_426, L13_427, L14_428, L15_429)
  if L11_425 == "1" then
    if L2_416 == false and L6_420 == nil then
      L0_414["PrimaryCertTable.Check"] = nil
      L1_415["SecondaryCertTable.Check"] = nil
      L12_426 = L0_414
      L13_427 = L1_415
      return L12_426, L13_427
    end
    if L2_416 == true and L6_420 == nil then
      L0_414["PrimaryCertTable.Check"] = "0"
      L12_426 = nil
      L13_427 = util
      L13_427 = L13_427.fileToString
      L14_428 = "/var/certs/ca.crt"
      L13_427 = L13_427(L14_428)
      L12_426 = L13_427
      L13_427 = x509Lib
      L13_427 = L13_427.certLoad
      L14_428 = L12_426
      L15_429 = "ca"
      L19_433 = L13_427(L14_428, L15_429)
      L20_434 = process
      L21_435 = L15_429
      L20_434 = L20_434(L21_435)
      L0_414["PrimaryCertTable.CaSubName"] = L20_434
      L1_415["SecondaryCertTable.Check"] = nil
      L1_415["SecondaryCertTable.CaSubName"] = ""
      L20_434 = L0_414
      L21_435 = L1_415
      return L20_434, L21_435
    end
    if L2_416 == false and L6_420 ~= nil then
      L0_414["PrimaryCertTable.Check"] = "1"
      L12_426 = process
      L13_427 = db
      L13_427 = L13_427.getAttribute
      L14_428 = "OpenvpnCertificates"
      L15_429 = "certType"
      L16_430 = "ca"
      L17_431 = "subjectName"
      L22_436 = L13_427(L14_428, L15_429, L16_430, L17_431)
      L12_426 = L12_426(L13_427, L14_428, L15_429, L16_430, L17_431, L18_432, L19_433, L20_434, L21_435, L22_436, L13_427(L14_428, L15_429, L16_430, L17_431))
      L0_414["PrimaryCertTable.CaSubName"] = L12_426
      L1_415["SecondaryCertTable.Check"] = nil
      L1_415["SecondaryCertTable.CaSubName"] = ""
      L12_426 = L0_414
      L13_427 = L1_415
      return L12_426, L13_427
    end
    if L2_416 == true and L6_420 ~= nil then
      L0_414["PrimaryCertTable.Check"] = "1"
      L12_426 = process
      L13_427 = db
      L13_427 = L13_427.getAttribute
      L14_428 = "OpenvpnCertificates"
      L15_429 = "certType"
      L16_430 = "ca"
      L17_431 = "subjectName"
      L22_436 = L13_427(L14_428, L15_429, L16_430, L17_431)
      L12_426 = L12_426(L13_427, L14_428, L15_429, L16_430, L17_431, L18_432, L19_433, L20_434, L21_435, L22_436, L13_427(L14_428, L15_429, L16_430, L17_431))
      L0_414["PrimaryCertTable.CaSubName"] = L12_426
      L12_426 = nil
      L13_427 = util
      L13_427 = L13_427.fileToString
      L14_428 = "/var/certs/ca.crt"
      L13_427 = L13_427(L14_428)
      L12_426 = L13_427
      L13_427 = x509Lib
      L13_427 = L13_427.certLoad
      L14_428 = L12_426
      L15_429 = "ca"
      L19_433 = L13_427(L14_428, L15_429)
      L1_415["SecondaryCertTable.Check"] = "0"
      L20_434 = process
      L21_435 = L15_429
      L20_434 = L20_434(L21_435)
      L1_415["SecondaryCertTable.CaSubName"] = L20_434
      L20_434 = L0_414
      L21_435 = L1_415
      return L20_434, L21_435
    end
  end
  if L2_416 == false and L3_417 == false and L4_418 == false and L6_420 == nil and L7_421 == nil and L8_422 == nil then
    L0_414["PrimaryCertTable.Check"] = nil
    if L5_419 then
      L0_414["PrimaryCertTable.DhExists"] = "yes"
    else
      L0_414["PrimaryCertTable.DhExists"] = ""
    end
    L1_415["SecondaryCertTable.Check"] = nil
    L12_426 = L0_414
    L13_427 = L1_415
    return L12_426, L13_427
  end
  if L2_416 == true and L3_417 == true and L4_418 == true and L6_420 == nil and L7_421 == nil and L8_422 == nil then
    L0_414["PrimaryCertTable.Check"] = "0"
    L12_426 = nil
    L13_427 = util
    L13_427 = L13_427.fileToString
    L14_428 = "/var/certs/ca.crt"
    L13_427 = L13_427(L14_428)
    L12_426 = L13_427
    L13_427 = x509Lib
    L13_427 = L13_427.certLoad
    L14_428 = L12_426
    L15_429 = "ca"
    L19_433 = L13_427(L14_428, L15_429)
    L20_434 = process
    L21_435 = L15_429
    L20_434 = L20_434(L21_435)
    L0_414["PrimaryCertTable.CaSubName"] = L20_434
    L20_434 = util
    L20_434 = L20_434.fileToString
    L21_435 = "/var/certs/server.crt"
    L20_434 = L20_434(L21_435)
    L12_426 = L20_434
    L20_434 = x509Lib
    L20_434 = L20_434.certLoad
    L21_435 = L12_426
    L22_436 = "crt"
    L22_436 = L20_434(L21_435, L22_436)
    L0_414["PrimaryCertTable.CertSubName"] = process(L22_436)
    L0_414["PrimaryCertTable.KeyExists"] = "yes"
    if L5_419 then
      L0_414["PrimaryCertTable.DhExists"] = "yes"
    else
      L0_414["PrimaryCertTable.DhExists"] = ""
    end
    L1_415["SecondaryCertTable.Check"] = nil
    L1_415["SecondaryCertTable.CaSubName"] = ""
    L1_415["SecondaryCertTable.CertSubName"] = ""
    L1_415["SecondaryCertTable.KeyExists"] = ""
    L1_415["SecondaryCertTable.DhExists"] = ""
    return L0_414, L1_415
  end
  if L2_416 == false and L3_417 == false and L4_418 == false and L6_420 ~= nil and L7_421 ~= nil and L8_422 ~= nil then
    L0_414["PrimaryCertTable.Check"] = "1"
    L12_426 = process
    L13_427 = db
    L13_427 = L13_427.getAttribute
    L14_428 = "OpenvpnCertificates"
    L15_429 = "certType"
    L16_430 = "ca"
    L17_431 = "subjectName"
    L22_436 = L13_427(L14_428, L15_429, L16_430, L17_431)
    L12_426 = L12_426(L13_427, L14_428, L15_429, L16_430, L17_431, L18_432, L19_433, L20_434, L21_435, L22_436, L13_427(L14_428, L15_429, L16_430, L17_431))
    L0_414["PrimaryCertTable.CaSubName"] = L12_426
    L12_426 = process
    L13_427 = db
    L13_427 = L13_427.getAttribute
    L14_428 = "OpenvpnCertificates"
    L15_429 = "certType"
    L16_430 = "crt"
    L17_431 = "subjectName"
    L22_436 = L13_427(L14_428, L15_429, L16_430, L17_431)
    L12_426 = L12_426(L13_427, L14_428, L15_429, L16_430, L17_431, L18_432, L19_433, L20_434, L21_435, L22_436, L13_427(L14_428, L15_429, L16_430, L17_431))
    L0_414["PrimaryCertTable.CertSubName"] = L12_426
    L0_414["PrimaryCertTable.KeyExists"] = "yes"
    if (L9_423 ~= nil or L5_419) and L10_424 == 0 then
      L0_414["PrimaryCertTable.DhExists"] = "yes"
    elseif L10_424 ~= 0 and L10_424 ~= nil then
      L0_414["PrimaryCertTable.DhExists"] = "N/A"
    else
      L0_414["PrimaryCertTable.DhExists"] = ""
    end
    L1_415["SecondaryCertTable.Check"] = nil
    L1_415["SecondaryCertTable.CaSubName"] = ""
    L1_415["SecondaryCertTable.CertSubName"] = ""
    L1_415["SecondaryCertTable.KeyExists"] = ""
    L1_415["SecondaryCertTable.DhExists"] = ""
    L12_426 = L0_414
    L13_427 = L1_415
    return L12_426, L13_427
  end
  if L2_416 == true and L3_417 == true and L4_418 == true and L6_420 ~= nil and L7_421 ~= nil and L8_422 ~= nil then
    L0_414["PrimaryCertTable.Check"] = "1"
    L12_426 = process
    L13_427 = db
    L13_427 = L13_427.getAttribute
    L14_428 = "OpenvpnCertificates"
    L15_429 = "certType"
    L16_430 = "ca"
    L17_431 = "subjectName"
    L22_436 = L13_427(L14_428, L15_429, L16_430, L17_431)
    L12_426 = L12_426(L13_427, L14_428, L15_429, L16_430, L17_431, L18_432, L19_433, L20_434, L21_435, L22_436, L13_427(L14_428, L15_429, L16_430, L17_431))
    L0_414["PrimaryCertTable.CaSubName"] = L12_426
    L12_426 = process
    L13_427 = db
    L13_427 = L13_427.getAttribute
    L14_428 = "OpenvpnCertificates"
    L15_429 = "certType"
    L16_430 = "crt"
    L17_431 = "subjectName"
    L22_436 = L13_427(L14_428, L15_429, L16_430, L17_431)
    L12_426 = L12_426(L13_427, L14_428, L15_429, L16_430, L17_431, L18_432, L19_433, L20_434, L21_435, L22_436, L13_427(L14_428, L15_429, L16_430, L17_431))
    L0_414["PrimaryCertTable.CertSubName"] = L12_426
    L0_414["PrimaryCertTable.KeyExists"] = "yes"
    if (L9_423 ~= nil or L5_419) and L10_424 == 0 then
      L0_414["PrimaryCertTable.DhExists"] = "yes"
    elseif L10_424 ~= 0 and L10_424 ~= nil then
      L0_414["PrimaryCertTable.DhExists"] = "N/A"
    else
      L0_414["PrimaryCertTable.DhExists"] = ""
    end
    L12_426 = nil
    L13_427 = util
    L13_427 = L13_427.fileToString
    L14_428 = "/var/certs/ca.crt"
    L13_427 = L13_427(L14_428)
    L12_426 = L13_427
    L13_427 = x509Lib
    L13_427 = L13_427.certLoad
    L14_428 = L12_426
    L15_429 = "ca"
    L19_433 = L13_427(L14_428, L15_429)
    L1_415["SecondaryCertTable.Check"] = "0"
    L20_434 = process
    L21_435 = L15_429
    L20_434 = L20_434(L21_435)
    L1_415["SecondaryCertTable.CaSubName"] = L20_434
    L20_434 = util
    L20_434 = L20_434.fileToString
    L21_435 = "/var/certs/server.crt"
    L20_434 = L20_434(L21_435)
    L12_426 = L20_434
    L20_434 = x509Lib
    L20_434 = L20_434.certLoad
    L21_435 = L12_426
    L22_436 = "crt"
    L22_436 = L20_434(L21_435, L22_436)
    L1_415["SecondaryCertTable.CertSubName"] = process(L22_436)
    L1_415["SecondaryCertTable.KeyExists"] = "yes"
    if L5_419 and L9_423 ~= nil and L10_424 == 0 then
      L1_415["SecondaryCertTable.DhExists"] = "yes"
    elseif L10_424 ~= 0 and L10_424 ~= nil then
      L1_415["SecondaryCertTable.DhExists"] = "N/A"
    else
      L1_415["SecondaryCertTable.DhExists"] = ""
    end
    if L0_414["PrimaryCertTable.CertSubName"] == L1_415["SecondaryCertTable.CertSubName"] then
      L1_415["SecondaryCertTable.Check"] = nil
      L1_415["SecondaryCertTable.CaSubName"] = ""
      L1_415["SecondaryCertTable.CertSubName"] = ""
      L1_415["SecondaryCertTable.KeyExists"] = ""
      L1_415["SecondaryCertTable.DhExists"] = ""
      os.execute("rm" .. " /var/certs/ca.crt")
      os.execute("rm" .. " /var/certs/server.crt")
      os.execute("rm" .. " /var/certs/server.key")
      os.execute("rm" .. " /var/certs/dh.pem")
    end
    return L0_414, L1_415
  end
  if (L2_416 == true or L3_417 == true or L4_418 == true or L5_419 == true) and L6_420 ~= nil and L7_421 ~= nil and L8_422 ~= nil then
    L0_414["PrimaryCertTable.Check"] = "1"
    L12_426 = process
    L13_427 = db
    L13_427 = L13_427.getAttribute
    L14_428 = "OpenvpnCertificates"
    L15_429 = "certType"
    L16_430 = "ca"
    L17_431 = "subjectName"
    L22_436 = L13_427(L14_428, L15_429, L16_430, L17_431)
    L12_426 = L12_426(L13_427, L14_428, L15_429, L16_430, L17_431, L18_432, L19_433, L20_434, L21_435, L22_436, L13_427(L14_428, L15_429, L16_430, L17_431))
    L0_414["PrimaryCertTable.CaSubName"] = L12_426
    L12_426 = process
    L13_427 = db
    L13_427 = L13_427.getAttribute
    L14_428 = "OpenvpnCertificates"
    L15_429 = "certType"
    L16_430 = "crt"
    L17_431 = "subjectName"
    L22_436 = L13_427(L14_428, L15_429, L16_430, L17_431)
    L12_426 = L12_426(L13_427, L14_428, L15_429, L16_430, L17_431, L18_432, L19_433, L20_434, L21_435, L22_436, L13_427(L14_428, L15_429, L16_430, L17_431))
    L0_414["PrimaryCertTable.CertSubName"] = L12_426
    L0_414["PrimaryCertTable.KeyExists"] = "yes"
    if (L9_423 ~= nil or L5_419) and L10_424 == 0 then
      L0_414["PrimaryCertTable.DhExists"] = "yes"
    elseif L10_424 ~= 0 and L10_424 ~= nil then
      L0_414["PrimaryCertTable.DhExists"] = "N/A"
    else
      L0_414["PrimaryCertTable.DhExists"] = ""
    end
    L12_426, L13_427 = nil, nil
    if L2_416 then
      L14_428 = util
      L14_428 = L14_428.fileToString
      L15_429 = "/var/certs/ca.crt"
      L14_428 = L14_428(L15_429)
      L12_426 = L14_428
      L14_428 = x509Lib
      L14_428 = L14_428.certLoad
      L15_429 = L12_426
      L16_430 = "ca"
      L20_434 = L14_428(L15_429, L16_430)
      L21_435 = process
      L22_436 = L16_430
      L21_435 = L21_435(L22_436)
      L13_427 = L21_435
    else
      L14_428 = ""
      L13_427 = L14_428
    end
    L1_415["SecondaryCertTable.Check"] = nil
    L1_415["SecondaryCertTable.CaSubName"] = L13_427
    if L3_417 then
      L14_428 = util
      L14_428 = L14_428.fileToString
      L15_429 = "/var/certs/server.crt"
      L14_428 = L14_428(L15_429)
      L12_426 = L14_428
      L14_428 = x509Lib
      L14_428 = L14_428.certLoad
      L15_429 = L12_426
      L16_430 = "crt"
      L20_434 = L14_428(L15_429, L16_430)
      L21_435 = process
      L22_436 = L16_430
      L21_435 = L21_435(L22_436)
      L13_427 = L21_435
    else
      L14_428 = ""
      L13_427 = L14_428
    end
    L1_415["SecondaryCertTable.CertSubName"] = L13_427
    if L4_418 then
      L1_415["SecondaryCertTable.KeyExists"] = "yes"
    else
      L1_415["SecondaryCertTable.KeyExists"] = ""
    end
    if L10_424 ~= 0 and L10_424 ~= nil then
      L1_415["SecondaryCertTable.DhExists"] = "N/A"
    else
      L1_415["SecondaryCertTable.DhExists"] = ""
    end
    L14_428 = L0_414
    L15_429 = L1_415
    return L14_428, L15_429
  end
  if (L2_416 == true or L3_417 == true or L4_418 == true or L5_419 == true) and L6_420 == nil and L7_421 == nil and L8_422 == nil then
    L0_414["PrimaryCertTable.Check"] = nil
    L12_426, L13_427 = nil, nil
    if L2_416 then
      L14_428 = util
      L14_428 = L14_428.fileToString
      L15_429 = "/var/certs/ca.crt"
      L14_428 = L14_428(L15_429)
      L12_426 = L14_428
      L14_428 = x509Lib
      L14_428 = L14_428.certLoad
      L15_429 = L12_426
      L16_430 = "ca"
      L20_434 = L14_428(L15_429, L16_430)
      L21_435 = process
      L22_436 = L16_430
      L21_435 = L21_435(L22_436)
      L13_427 = L21_435
    else
      L14_428 = ""
      L13_427 = L14_428
    end
    L0_414["PrimaryCertTable.CaSubName"] = L13_427
    if L3_417 then
      L14_428 = util
      L14_428 = L14_428.fileToString
      L15_429 = "/var/certs/server.crt"
      L14_428 = L14_428(L15_429)
      L12_426 = L14_428
      L14_428 = x509Lib
      L14_428 = L14_428.certLoad
      L15_429 = L12_426
      L16_430 = "crt"
      L20_434 = L14_428(L15_429, L16_430)
      L21_435 = process
      L22_436 = L16_430
      L21_435 = L21_435(L22_436)
      L13_427 = L21_435
    else
      L14_428 = ""
      L13_427 = L14_428
    end
    L0_414["PrimaryCertTable.CertSubName"] = L13_427
    if L4_418 then
      L0_414["PrimaryCertTable.KeyExists"] = "yes"
    else
      L0_414["PrimaryCertTable.KeyExists"] = ""
    end
    if L5_419 then
      L0_414["PrimaryCertTable.DhExists"] = "yes"
    else
      L0_414["PrimaryCertTable.DhExists"] = ""
    end
    L1_415["SecondaryCertTable.Check"] = nil
    L1_415["SecondaryCertTable.CaSubName"] = ""
    L1_415["SecondaryCertTable.CertSubName"] = ""
    L1_415["SecondaryCertTable.KeyExists"] = ""
    L1_415["SecondaryCertTable.DhExists"] = ""
    L14_428 = L0_414
    L15_429 = L1_415
    return L14_428, L15_429
  end
end
function process(A0_437)
  local L1_438, L2_439
  if A0_437 ~= nil then
    L1_438 = string
    L1_438 = L1_438.find
    L2_439 = A0_437
    L1_438 = L1_438(L2_439, "CN=")
    if L1_438 ~= nil then
      L2_439 = L1_438 + 12
      return string.sub(A0_437, 1, L2_439) .. " ..."
    else
      return A0_437
    end
  else
    L1_438 = ""
    return L1_438
  end
end
function openvpnCertsdelete()
  local L0_440
  if util.fileExists(_UPVALUE0_ .. "openvpn/" .. _UPVALUE1_) then
    os.execute("rm" .. " /var/certs/openvpn/ca.crt")
  end
  if util.fileExists(_UPVALUE0_ .. _UPVALUE1_) then
    os.execute("rm" .. " /var/certs/ca.crt")
  end
  if util.fileExists(_UPVALUE0_ .. "openvpn/" .. _UPVALUE2_) then
    os.execute("rm" .. " /var/certs/openvpn/server.crt")
  end
  if util.fileExists(_UPVALUE0_ .. _UPVALUE2_) then
    os.execute("rm" .. " /var/certs/server.crt")
  end
  if util.fileExists(_UPVALUE0_ .. "openvpn/" .. _UPVALUE3_) then
    os.execute("rm" .. " /var/certs/openvpn/server.key")
  end
  if util.fileExists(_UPVALUE0_ .. _UPVALUE3_) then
    os.execute("rm" .. " /var/certs/server.key")
  end
  if util.fileExists(_UPVALUE0_ .. "openvpn/" .. _UPVALUE4_) then
    os.execute("rm" .. " /var/certs/openvpn/dh.pem")
  end
  if util.fileExists(_UPVALUE0_ .. _UPVALUE4_) then
    os.execute("rm" .. " /var/certs/dh.pem")
  end
  if util.fileExists(_UPVALUE0_ .. _UPVALUE5_) then
    os.execute("rm" .. " /var/certs/ta.key")
  end
  if util.fileExists(_UPVALUE0_ .. "openvpn/" .. _UPVALUE5_) then
    os.execute("rm" .. " /var/certs/openvpn/ta.key")
  end
  if util.fileExists(_UPVALUE0_ .. _UPVALUE6_) then
    os.execute("rm" .. " /var/certs/crl.pem")
  end
  if util.fileExists(_UPVALUE0_ .. "openvpn/" .. _UPVALUE6_) then
    os.execute("rm" .. " /var/certs/openvpn/crl.pem")
  end
  tableData = db.getTable(openvpnCertificatesTable, false)
  if tableData == nil then
    return nil
  end
  for _FORV_4_, _FORV_5_ in pairs(tableData) do
    keyname = "_ROWID_"
    keyvalue = _FORV_5_._ROWID_
    cur = db.deleteRow(openvpnCertificatesTable, keyname, keyvalue)
    if cur == nil then
      return nil
    end
  end
  return cur, errstr
end
function uploadCaOnlyCheck(A0_441, A1_442)
  if db.getAttribute("OpenVpn", "_ROWID_", "1", "UploadCaOnly") == "1" and A0_441 == "0" and A1_442 == "2" then
    return _UPVALUE0_.ENABLEALLOWONLYUSERBASED
  elseif db.getAttribute("OpenVpn", "_ROWID_", "1", "UploadCaOnly") == "0" and A0_441 == "1" and A1_442 == "2" then
    return _UPVALUE0_.ENABLEUPLOADONLYCACERT
  end
  return _UPVALUE1_.SUCCESS
end
function omniSslClientSet(A0_443, A1_444)
  local L2_445
  L2_445 = _UPVALUE0_
  L2_445 = L2_445.NIL
  if A1_444 == L2_445 then
    L2_445 = _UPVALUE0_
    L2_445 = L2_445.INVALID_ARGUMENT
    return L2_445
  end
  L2_445 = {}
  L2_445[OpenvpnClientConfigTable .. "." .. _UPVALUE1_.clientName] = A1_444
  if db.update(OpenvpnClientConfigTable, L2_445, A0_443) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_443
end
function omniSslClientGet(A0_446)
  if db.getRow(OpenvpnClientConfigTable, _UPVALUE0_, _UPVALUE1_) == _UPVALUE2_.NIL then
    return _UPVALUE3_.OPENVPN_TABLE_NIL
  end
  return _UPVALUE2_.SUCCESS, 1, clientName
end
function openvpnAuthConfigGet()
  local L0_447
  L0_447 = db
  L0_447 = L0_447.getTable
  L0_447 = L0_447("OpenvpnAuthCertificates", false)
  if L0_447 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_447
end
function openvpnTlsSectionGet()
  local L0_448
  L0_448 = db
  L0_448 = L0_448.getTable
  L0_448 = L0_448("OpenvpnTlsCertificates", false)
  if L0_448 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_448
end
function openvpnCrlSectionGet()
  local L0_449
  L0_449 = db
  L0_449 = L0_449.getTable
  L0_449 = L0_449("OpenvpnCrlCertificates", false)
  if L0_449 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_449
end
function tlsCertificatesDelete(A0_450)
  local L1_451, L2_452
  if A0_450 == _UPVALUE0_.NIL or tonumber(A0_450) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  tlsCertConfig = db.getRow("OpenvpnTlsCertificates", _UPVALUE1_, A0_450)
  if tlsCertConfig == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L1_451 = db.deleteRow("OpenvpnTlsCertificates", _UPVALUE1_, A0_450)
  if L1_451 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function tlsCertificatesDeleteAll()
  if db.deleteAllRows("OpenvpnTlsCertificates") == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function crlCertificatesDelete(A0_453)
  local L1_454, L2_455
  if A0_453 == _UPVALUE0_.NIL or tonumber(A0_453) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  crlCertConfig = db.getRow("OpenvpnCrlCertificates", _UPVALUE1_, A0_453)
  if crlCertConfig == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L1_454 = db.deleteRow("OpenvpnCrlCertificates", _UPVALUE1_, A0_453)
  if L1_454 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function crlCertificatesDeleteAll()
  if db.deleteAllRows("OpenvpnCrlCertificates") == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function authCertsDelete(A0_456)
  local L1_457, L2_458
  if A0_456 == _UPVALUE0_.NIL or tonumber(A0_456) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_456) == 1 then
    return _UPVALUE1_.DEFAULT_ROW
  end
  L2_458 = db.getRow("OpenvpnAuthCertificates", _UPVALUE2_, A0_456)
  if L2_458 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L1_457 = db.deleteRow("OpenvpnAuthCertificates", _UPVALUE2_, A0_456)
  if L1_457 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
