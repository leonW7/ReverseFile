local L0_0
L0_0 = module
L0_0("com.teamf1.core.sslvpn.client", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/sslvpn_returnCodes")
L0_0 = require
L0_0("teamf1lualib/nimf_returnCodes")
L0_0 = require
L0_0("teamf1lualib/vlan_vlan")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.sslvpn.returnCodes")
clientTable = "SSLVPNClientConf"
;({}).fullTunnel = "EnableFullTunnel"
;({}).DNSSuffix = "DNSSuffix"
;({}).primaryDNSServer = "PrimaryDNSServer"
;({}).secondaryDNSServer = "SecondaryDNSServer"
;({}).beginClientAddress = "BeginClientAddress"
;({}).endClientAddress = "EndClientAddress"
;({}).lcpTimeout = "lcpTimeout"
;({}).dmz_interface = "LogicalIfName"
;({}).dmz_ip = "StaticIp"
;({}).dmz_netmask = "NetMask"
;({}).wan_ipAddress = "ipAddress"
;({}).wan_subnet = "subnetMask"
;({}).ipsec_startIPAddress = "StartIPAddress"
;({}).ipsec_subnetMask = "SubnetMask"
;({}).interfaceName = "LogicalIfName"
;({}).addressFamily = "addressFamily"
;({}).multiWanMode = "Wanmode"
function isfullTunnelEnabled()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(clientTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.fullTunnel)
  if L0_1 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L0_1
end
function isfullTunnelEnabledNext(A0_2)
  local L2_3, L3_4
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.NOT_SUPPORTED
  L3_4 = 0
  return L2_3, L3_4, 0
end
function fullTunnelEnable(A0_5)
  if db.setAttribute(clientTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.fullTunnel, _UPVALUE3_) == _UPVALUE4_.FALSE then
    return _UPVALUE4_.FAILURE, A0_5
  end
  return _UPVALUE4_.SUCCESS, A0_5
end
function fullTunnelDisable(A0_6)
  if db.setAttribute(clientTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.fullTunnel, _UPVALUE3_) == _UPVALUE4_.FALSE then
    return _UPVALUE4_.FAILURE, A0_6
  end
  return _UPVALUE4_.SUCCESS, A0_6
end
function DNSSuffixGet()
  local L0_7
  L0_7 = db
  L0_7 = L0_7.getAttribute
  L0_7 = L0_7(clientTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.DNSSuffix)
  if L0_7 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L0_7
end
function DNSSuffixGetNext(A0_8)
  local L2_9, L3_10
  L2_9 = _UPVALUE0_
  L2_9 = L2_9.NOT_SUPPORTED
  L3_10 = 0
  return L2_9, L3_10, 0
end
function DNSSuffixSet(A0_11, A1_12)
  if A1_12 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(clientTable, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.DNSSuffix, A1_12) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_11
  end
  return _UPVALUE0_.SUCCESS, A0_11
end
function primaryDNSServerGet()
  local L0_13
  L0_13 = db
  L0_13 = L0_13.getAttribute
  L0_13 = L0_13(clientTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.primaryDNSServer)
  if L0_13 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L0_13
end
function primaryDNSServerGetNext(A0_14)
  local L2_15, L3_16
  L2_15 = _UPVALUE0_
  L2_15 = L2_15.NOT_SUPPORTED
  L3_16 = 0
  return L2_15, L3_16, 0
end
function primaryDNSServerSet(A0_17, A1_18)
  local L2_19
  if A1_18 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_19 = _UPVALUE1_.ipAddressCheck("2", A1_18)
  if L2_19 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(clientTable, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.primaryDNSServer, A1_18) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_17
  end
  return _UPVALUE0_.SUCCESS, A0_17
end
function secondaryDNSServerGet()
  local L0_20
  L0_20 = db
  L0_20 = L0_20.getAttribute
  L0_20 = L0_20(clientTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.secondaryDNSServer)
  if L0_20 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L0_20
end
function secondaryDNSServerGetNext(A0_21)
  local L2_22, L3_23
  L2_22 = _UPVALUE0_
  L2_22 = L2_22.NOT_SUPPORTED
  L3_23 = 0
  return L2_22, L3_23, 0
end
function secondaryDNSServerSet(A0_24, A1_25)
  local L2_26
  if A1_25 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_26 = _UPVALUE1_.ipAddressCheck("2", A1_25)
  if L2_26 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(clientTable, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.secondaryDNSServer, A1_25) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_24
  end
  return _UPVALUE0_.SUCCESS, A0_24
end
function beginClientAddressGet()
  local L0_27
  L0_27 = db
  L0_27 = L0_27.getAttribute
  L0_27 = L0_27(clientTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.beginClientAddress)
  if L0_27 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L0_27
end
function beginClientAddressGetNext(A0_28)
  local L2_29, L3_30
  L2_29 = _UPVALUE0_
  L2_29 = L2_29.NOT_SUPPORTED
  L3_30 = 0
  return L2_29, L3_30, 0
end
function beginClientAddressSet(A0_31, A1_32)
  local L2_33
  if A1_32 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_33 = _UPVALUE1_.ipAddressCheck("2", A1_32)
  if L2_33 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(clientTable, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.beginClientAddress, A1_32) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_31
  end
  return _UPVALUE0_.SUCCESS, A0_31
end
function endClientAddressGet()
  local L0_34
  L0_34 = db
  L0_34 = L0_34.getAttribute
  L0_34 = L0_34(clientTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.endClientAddress)
  if L0_34 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L0_34
end
function endClientAddressGetNext(A0_35)
  local L2_36, L3_37
  L2_36 = _UPVALUE0_
  L2_36 = L2_36.NOT_SUPPORTED
  L3_37 = 0
  return L2_36, L3_37, 0
end
function endClientAddressSet(A0_38, A1_39)
  local L2_40
  if A1_39 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_40 = _UPVALUE1_.ipAddressCheck("2", A1_39)
  if L2_40 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(clientTable, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.endClientAddress, A1_39) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_38
  end
  return _UPVALUE0_.SUCCESS, A0_38
end
function lcpTimeoutGet()
  local L0_41
  L0_41 = db
  L0_41 = L0_41.getAttribute
  L0_41 = L0_41(clientTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.lcpTimeout)
  if L0_41 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L0_41
end
function lcpTimeoutGetNext(A0_42)
  local L2_43, L3_44
  L2_43 = _UPVALUE0_
  L2_43 = L2_43.NOT_SUPPORTED
  L3_44 = 0
  return L2_43, L3_44, 0
end
function lcpTimeoutSet(A0_45, A1_46)
  if A1_46 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(clientTable, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.lcpTimeout, A1_46) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_45
  end
  return _UPVALUE0_.SUCCESS, A0_45
end
function clientGet()
  local L0_47, L1_48, L2_49, L3_50, L4_51, L5_52, L6_53, L7_54
  L0_47 = db
  L0_47 = L0_47.getRow
  L1_48 = clientTable
  L2_49 = _UPVALUE0_
  L3_50 = _UPVALUE1_
  L0_47 = L0_47(L1_48, L2_49, L3_50)
  L1_48 = _UPVALUE2_
  L1_48 = L1_48.NIL
  if L0_47 == L1_48 then
    L1_48 = _UPVALUE2_
    L1_48 = L1_48.FAILURE
    return L1_48
  end
  L1_48, L2_49, L3_50, L4_51, L5_52, L6_53, L7_54 = nil, nil, nil, nil, nil, nil, nil
  L1_48 = L0_47[clientTable .. "." .. _UPVALUE3_.fullTunnel]
  L2_49 = L0_47[clientTable .. "." .. _UPVALUE3_.DNSSuffix]
  L3_50 = L0_47[clientTable .. "." .. _UPVALUE3_.primaryDNSServer]
  L3_50 = L0_47[clientTable .. "." .. _UPVALUE3_.primaryDNSServer]
  L4_51 = L0_47[clientTable .. "." .. _UPVALUE3_.secondaryDNSServer]
  L5_52 = L0_47[clientTable .. "." .. _UPVALUE3_.beginClientAddress]
  L6_53 = L0_47[clientTable .. "." .. _UPVALUE3_.endClientAddress]
  L7_54 = L0_47[clientTable .. "." .. _UPVALUE3_.lcpTimeout]
  return _UPVALUE2_.SUCCESS, 1, L1_48, L2_49, L3_50, L4_51, L5_52, L6_53, L7_54
end
function clientGetNext(A0_55)
  local L2_56, L3_57
  L2_56 = _UPVALUE0_
  L2_56 = L2_56.NOT_SUPPORTED
  L3_57 = 0
  return L2_56, L3_57, 0
end
function clientSet(A0_58, A1_59, A2_60, A3_61, A4_62, A5_63, A6_64, A7_65)
  local L8_66, L9_67, L10_68, L11_69, L12_70
  L9_67 = {}
  L10_68 = _UPVALUE0_
  L10_68 = L10_68.NIL
  if A1_59 == L10_68 then
    L10_68 = _UPVALUE0_
    L10_68 = L10_68.INVALID_ARGUMENT
    return L10_68
  end
  L10_68 = _UPVALUE1_
  L10_68 = L10_68.isBoolean
  L11_69 = A1_59
  L10_68 = L10_68(L11_69)
  L8_66 = L10_68
  L10_68 = _UPVALUE0_
  L10_68 = L10_68.SUCCESS
  if L8_66 ~= L10_68 then
    L10_68 = _UPVALUE0_
    L10_68 = L10_68.INVALID_ARGUMENT
    return L10_68
  end
  L10_68 = clientTable
  L11_69 = "."
  L12_70 = _UPVALUE2_
  L12_70 = L12_70.fullTunnel
  L10_68 = L10_68 .. L11_69 .. L12_70
  L9_67[L10_68] = A1_59
  L10_68 = _UPVALUE0_
  L10_68 = L10_68.NIL
  if A2_60 ~= L10_68 then
    L10_68 = clientTable
    L11_69 = "."
    L12_70 = _UPVALUE2_
    L12_70 = L12_70.DNSSuffix
    L10_68 = L10_68 .. L11_69 .. L12_70
    L9_67[L10_68] = A2_60
  end
  L10_68 = _UPVALUE0_
  L10_68 = L10_68.NIL
  if A3_61 ~= L10_68 then
    L10_68 = _UPVALUE0_
    L10_68 = L10_68.EMPTY
  else
    if A3_61 == L10_68 then
      L10_68 = clientTable
      L11_69 = "."
      L12_70 = _UPVALUE2_
      L12_70 = L12_70.primaryDNSServer
      L10_68 = L10_68 .. L11_69 .. L12_70
      L9_67[L10_68] = ""
  end
  else
    L10_68 = _UPVALUE1_
    L10_68 = L10_68.ipAddressCheck
    L11_69 = "2"
    L12_70 = A3_61
    L10_68 = L10_68(L11_69, L12_70)
    L8_66 = L10_68
    L10_68 = _UPVALUE0_
    L10_68 = L10_68.SUCCESS
    if L8_66 ~= L10_68 then
      L10_68 = _UPVALUE3_
      L10_68 = L10_68.SSLVPN_CLIENT_PRIMARYADDRESS_INVALID
      return L10_68
    end
    L10_68 = clientTable
    L11_69 = "."
    L12_70 = _UPVALUE2_
    L12_70 = L12_70.primaryDNSServer
    L10_68 = L10_68 .. L11_69 .. L12_70
    L9_67[L10_68] = A3_61
  end
  L10_68 = _UPVALUE0_
  L10_68 = L10_68.NIL
  if A4_62 ~= L10_68 then
    L10_68 = _UPVALUE0_
    L10_68 = L10_68.EMPTY
  else
    if A4_62 == L10_68 then
      L10_68 = clientTable
      L11_69 = "."
      L12_70 = _UPVALUE2_
      L12_70 = L12_70.secondaryDNSServer
      L10_68 = L10_68 .. L11_69 .. L12_70
      L9_67[L10_68] = ""
  end
  else
    L10_68 = _UPVALUE1_
    L10_68 = L10_68.ipAddressCheck
    L11_69 = "2"
    L12_70 = A4_62
    L10_68 = L10_68(L11_69, L12_70)
    L8_66 = L10_68
    L10_68 = _UPVALUE0_
    L10_68 = L10_68.SUCCESS
    if L8_66 ~= L10_68 then
      L10_68 = _UPVALUE3_
      L10_68 = L10_68.SSLVPN_CLIENT_SECONDARYADDRESS_INVALID
      return L10_68
    end
    L10_68 = clientTable
    L11_69 = "."
    L12_70 = _UPVALUE2_
    L12_70 = L12_70.secondaryDNSServer
    L10_68 = L10_68 .. L11_69 .. L12_70
    L9_67[L10_68] = A4_62
  end
  L10_68 = _UPVALUE0_
  L10_68 = L10_68.NIL
  if A5_63 == L10_68 then
    L10_68 = _UPVALUE0_
    L10_68 = L10_68.INVALID_ARGUMENT
    return L10_68
  end
  L10_68 = _UPVALUE1_
  L10_68 = L10_68.ipAddressCheck
  L11_69 = "2"
  L12_70 = A5_63
  L10_68 = L10_68(L11_69, L12_70)
  L8_66 = L10_68
  L10_68 = _UPVALUE0_
  L10_68 = L10_68.SUCCESS
  if L8_66 ~= L10_68 then
    L10_68 = _UPVALUE3_
    L10_68 = L10_68.SSLVPN_BEGINCLIENTADDRESS__INVALID
    return L10_68
  end
  L10_68 = clientTable
  L11_69 = "."
  L12_70 = _UPVALUE2_
  L12_70 = L12_70.beginClientAddress
  L10_68 = L10_68 .. L11_69 .. L12_70
  L9_67[L10_68] = A5_63
  L10_68 = _UPVALUE0_
  L10_68 = L10_68.NIL
  if A6_64 == L10_68 then
    L10_68 = _UPVALUE0_
    L10_68 = L10_68.INVALID_ARGUMENT
    return L10_68
  end
  L10_68 = _UPVALUE1_
  L10_68 = L10_68.ipAddressCheck
  L11_69 = "2"
  L12_70 = A6_64
  L10_68 = L10_68(L11_69, L12_70)
  L8_66 = L10_68
  L10_68 = _UPVALUE0_
  L10_68 = L10_68.SUCCESS
  if L8_66 ~= L10_68 then
    L10_68 = _UPVALUE3_
    L10_68 = L10_68.SSLVPN_ENDCLIENTADDRESS__INVALID
    return L10_68
  end
  L10_68 = "255.255.255.0"
  L11_69 = _UPVALUE1_
  L11_69 = L11_69.ipv4SingleMaskCheck
  L12_70 = A5_63
  L11_69 = L11_69(L12_70, A6_64, L10_68)
  L12_70 = _UPVALUE0_
  L12_70 = L12_70.SUCCESS
  if L11_69 ~= L12_70 then
    L12_70 = _UPVALUE3_
    L12_70 = L12_70.CLIENT_BEGIN_AND_ENDIP_NOT_INSAMESUBNET
    return L12_70
  end
  L12_70 = clientTable
  L12_70 = L12_70 .. "." .. _UPVALUE2_.endClientAddress
  L9_67[L12_70] = A6_64
  L12_70 = _UPVALUE0_
  L12_70 = L12_70.NIL
  if A7_65 == L12_70 then
    L12_70 = _UPVALUE0_
    L12_70 = L12_70.INVALID_ARGUMENT
    return L12_70
  end
  L12_70 = clientTable
  L12_70 = L12_70 .. "." .. _UPVALUE2_.lcpTimeout
  L9_67[L12_70] = A7_65
  L12_70 = staticIpSubnetCheck
  L12_70 = L12_70(A5_63, L10_68)
  if L12_70 ~= _UPVALUE0_.SUCCESS then
    return L12_70
  end
  L12_70 = staticIpSubnetCheck(A6_64, L10_68)
  if L12_70 ~= _UPVALUE0_.SUCCESS then
    return L12_70
  end
  if db.update(clientTable, L9_67, A0_58) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_58
  end
  return _UPVALUE0_.SUCCESS, A0_58
end
function clientCreate(A0_71, A1_72, A2_73, A3_74, A4_75, A5_76, A6_77)
  local L8_78
  L8_78 = _UPVALUE0_
  L8_78 = L8_78.NOT_SUPPORTED
  return L8_78, 0
end
function clientDelete(A0_79)
  local L2_80
  L2_80 = _UPVALUE0_
  L2_80 = L2_80.NOT_SUPPORTED
  return L2_80, 0
end
function staticIpSubnetCheck(A0_81, A1_82)
  local L2_83, L3_84, L4_85, L5_86, L6_87, L7_88, L8_89, L9_90, L10_91, L11_92, L12_93
  L12_93 = _UPVALUE0_
  L2_83, L8_89, L4_85, L5_86, L6_87, L3_84, L7_88, L9_90, L10_91, L11_92 = _UPVALUE1_.vlanGet(L12_93)
  if L2_83 ~= _UPVALUE2_.SUCCESS then
    return _UPVALUE3_.SUBNET_CHECK_FAILED
  end
  L2_83 = _UPVALUE4_.ipv4DualMaskCheck(L3_84, L7_88, A0_81, A1_82)
  if L2_83 == _UPVALUE2_.SUCCESS then
    return _UPVALUE3_.SAME_SUBNET_LAN
  end
  L2_83, L8_89, L4_85, L5_86, L6_87, L3_84, L7_88, L9_90, L10_91, L11_92 = _UPVALUE1_.vlanGetNext(L8_89)
  while L2_83 ~= _UPVALUE2_.NEXT_ROWID_INVALID do
    if L2_83 ~= _UPVALUE2_.SUCCESS then
      return _UPVALUE3_.SUBNET_CHECK_FAILED
    end
    L2_83 = _UPVALUE4_.ipv4DualMaskCheck(L3_84, L7_88, A0_81, A1_82)
    if L2_83 == _UPVALUE2_.SUCCESS then
      return _UPVALUE3_.SAME_SUBNET_VLAN
    end
    L2_83, L8_89, L4_85, L5_86, L6_87, L3_84, L7_88, L9_90, L10_91, L11_92 = _UPVALUE1_.vlanGetNext(L8_89)
  end
  L2_83 = _UPVALUE4_.ipv4DualMaskCheck(_UPVALUE5_, _UPVALUE6_, A0_81, A1_82)
  if L2_83 == _UPVALUE2_.SUCCESS then
    return _UPVALUE3_.SAME_SUBNET_LOCAL_IP
  end
  return _UPVALUE2_.SUCCESS
end
