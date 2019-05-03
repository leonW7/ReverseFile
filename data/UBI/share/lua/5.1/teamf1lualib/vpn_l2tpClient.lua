local L0_0
L0_0 = module
L0_0("com.teamf1.core.vpn.l2tpclient", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/vlan_vlan")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/l2tpClient_returnCodes")
L0_0 = require
L0_0("teamf1lualib/ipsec_connectionStatus")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).feature = "l2tpClientEnable"
;({}).serverIpAddress = "l2tpServerIp"
;({}).remoteNetwork = "RemoteNetwork"
;({}).remoteNetmask = "RemoteNetmask"
;({}).userName = "UserName"
;({}).password = "Password"
;({}).idleTimeOut = "IdleTimeOut"
;({}).useMppe = "EnableMppe"
;({}).connectionStatus = "connectionStatus"
;({}).actionStatus = "actionStatus"
;({}).action = "action"
;({}).name = "name"
;({}).value = "value"
;({}).demandFlag = "DemandFlag"
;({}).dmz_interface = "LogicalIfName"
;({}).dmz_ip = "StaticIp"
;({}).dmz_netmask = "NetMask"
function isfeatureEnabled()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.feature)
  if L0_1 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_1
end
function isfeatureEnabledNext(A0_2)
  local L2_3, L3_4
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.NOT_SUPPORTED
  L3_4 = 0
  return L2_3, L3_4, 0
end
function featureEnable(A0_5)
  local L1_6
  L1_6 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.feature, _UPVALUE4_)
  if L1_6 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_5
  end
  return _UPVALUE5_.SUCCESS, A0_5
end
function featureDisable(A0_7)
  local L1_8
  L1_8 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.feature, _UPVALUE4_)
  if L1_8 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_7
  end
  return _UPVALUE5_.SUCCESS, A0_7
end
function serverIpAddressGet()
  local L0_9
  L0_9 = db
  L0_9 = L0_9.getAttribute
  L0_9 = L0_9(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.serverIpAddress)
  if L0_9 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_9
end
function serverIpAddressGetNext(A0_10)
  local L2_11, L3_12
  L2_11 = _UPVALUE0_
  L2_11 = L2_11.NOT_SUPPORTED
  L3_12 = 0
  return L2_11, L3_12, 0
end
function serverIpAddressSet(A0_13, A1_14)
  local L2_15, L3_16
  L3_16 = db
  L3_16 = L3_16.getAttribute
  L3_16 = L3_16(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.feature)
  L2_15 = L3_16
  L3_16 = _UPVALUE4_
  if L2_15 ~= L3_16 then
    L3_16 = _UPVALUE5_
    L3_16 = L3_16.DEPENDENCY_NOT_MET
    return L3_16
  end
  L3_16 = _UPVALUE5_
  L3_16 = L3_16.NIL
  if A1_14 == L3_16 then
    L3_16 = _UPVALUE5_
    L3_16 = L3_16.INVALID_ARGUMENT
    return L3_16
  end
  L3_16 = _UPVALUE6_
  L3_16 = L3_16.ipAddressCheck
  L3_16 = L3_16(_UPVALUE7_, A1_14)
  valid = L3_16
  L3_16 = valid
  if L3_16 ~= _UPVALUE5_.SUCCESS then
    L3_16 = _UPVALUE5_
    L3_16 = L3_16.INVALID_ARGUMENT
    return L3_16
  end
  L3_16 = nil
  L3_16 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.serverIpAddress, A1_14)
  if L3_16 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_13
  end
  return _UPVALUE5_.SUCCESS, A0_13
end
function remoteNetworkGet()
  local L0_17
  L0_17 = db
  L0_17 = L0_17.getAttribute
  L0_17 = L0_17(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.remoteNetwork)
  if L0_17 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_17
end
function remoteNetworkGetNext(A0_18)
  local L2_19, L3_20
  L2_19 = _UPVALUE0_
  L2_19 = L2_19.NOT_SUPPORTED
  L3_20 = 0
  return L2_19, L3_20, 0
end
function remoteNetworkSet(A0_21, A1_22)
  local L2_23, L3_24
  L3_24 = db
  L3_24 = L3_24.getAttribute
  L3_24 = L3_24(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.feature)
  L2_23 = L3_24
  L3_24 = _UPVALUE4_
  if L2_23 ~= L3_24 then
    L3_24 = _UPVALUE5_
    L3_24 = L3_24.DEPENDENCY_NOT_MET
    return L3_24
  end
  L3_24 = _UPVALUE5_
  L3_24 = L3_24.NIL
  if A1_22 == L3_24 then
    L3_24 = _UPVALUE5_
    L3_24 = L3_24.INVALID_ARGUMENT
    return L3_24
  end
  L3_24 = _UPVALUE6_
  L3_24 = L3_24.ipAddressCheck
  L3_24 = L3_24(_UPVALUE7_, A1_22)
  valid = L3_24
  L3_24 = valid
  if L3_24 ~= _UPVALUE5_.SUCCESS then
    L3_24 = _UPVALUE5_
    L3_24 = L3_24.INVALID_ARGUMENT
    return L3_24
  end
  L3_24 = nil
  L3_24 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.remoteNetwork, A1_22)
  if L3_24 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_21
  end
  return _UPVALUE5_.SUCCESS, A0_21
end
function remoteNetmaskGet()
  local L0_25
  L0_25 = db
  L0_25 = L0_25.getAttribute
  L0_25 = L0_25(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.remoteNetmask)
  if L0_25 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_25
end
function remoteNetmaskGetNext(A0_26)
  local L2_27, L3_28
  L2_27 = _UPVALUE0_
  L2_27 = L2_27.NOT_SUPPORTED
  L3_28 = 0
  return L2_27, L3_28, 0
end
function remoteNetmaskSet(A0_29, A1_30)
  local L2_31, L3_32, L4_33
  L3_32 = db
  L3_32 = L3_32.getAttribute
  L4_33 = _UPVALUE0_
  L3_32 = L3_32(L4_33, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.feature)
  L2_31 = L3_32
  L3_32 = _UPVALUE4_
  if L2_31 ~= L3_32 then
    L3_32 = _UPVALUE5_
    L3_32 = L3_32.DEPENDENCY_NOT_MET
    return L3_32
  end
  L3_32 = _UPVALUE5_
  L3_32 = L3_32.NIL
  if A1_30 == L3_32 then
    L3_32 = _UPVALUE5_
    L3_32 = L3_32.INVALID_ARGUMENT
    return L3_32
  end
  L3_32 = tonumber
  L4_33 = A1_30
  L3_32 = L3_32(L4_33)
  L4_33 = _UPVALUE5_
  L4_33 = L4_33.NIL
  if L3_32 == L4_33 then
    L4_33 = _UPVALUE5_
    L4_33 = L4_33.INVALID_ARGUMENT
    return L4_33
  end
  L4_33 = _UPVALUE6_
  if not (L3_32 < L4_33) then
    L4_33 = _UPVALUE7_
  elseif L3_32 > L4_33 then
    L4_33 = _UPVALUE5_
    L4_33 = L4_33.INVALID_ARGUMENT
    return L4_33
  end
  L4_33 = nil
  L4_33 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.remoteNetmask, A1_30)
  if L4_33 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_29
  end
  return _UPVALUE5_.SUCCESS, A0_29
end
function userNameGet()
  local L0_34
  L0_34 = db
  L0_34 = L0_34.getAttribute
  L0_34 = L0_34(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.userName)
  if L0_34 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_34
end
function userNameGetNext(A0_35)
  local L2_36, L3_37
  L2_36 = _UPVALUE0_
  L2_36 = L2_36.NOT_SUPPORTED
  L3_37 = 0
  return L2_36, L3_37, 0
end
function userNameSet(A0_38, A1_39)
  local L2_40, L3_41
  L3_41 = db
  L3_41 = L3_41.getAttribute
  L3_41 = L3_41(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.feature)
  L2_40 = L3_41
  L3_41 = _UPVALUE4_
  if L2_40 ~= L3_41 then
    L3_41 = _UPVALUE5_
    L3_41 = L3_41.DEPENDENCY_NOT_MET
    return L3_41
  end
  L3_41 = _UPVALUE5_
  L3_41 = L3_41.NIL
  if A1_39 == L3_41 then
    L3_41 = _UPVALUE5_
    L3_41 = L3_41.INVALID_ARGUMENT
    return L3_41
  end
  L3_41 = _UPVALUE6_
  L3_41 = L3_41.stringLengthCheck
  L3_41 = L3_41(_UPVALUE7_, _UPVALUE8_, A1_39)
  if L3_41 ~= _UPVALUE5_.SUCCESS then
    L3_41 = _UPVALUE5_
    L3_41 = L3_41.INVALID_ARGUMENT
    return L3_41
  end
  L3_41 = nil
  L3_41 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.userName, A1_39)
  if L3_41 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_38
  end
  return _UPVALUE5_.SUCCESS, A0_38
end
function passwordGet()
  local L0_42
  L0_42 = db
  L0_42 = L0_42.getAttribute
  L0_42 = L0_42(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.password)
  if L0_42 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_42
end
function passwordGetNext(A0_43)
  local L2_44, L3_45
  L2_44 = _UPVALUE0_
  L2_44 = L2_44.NOT_SUPPORTED
  L3_45 = 0
  return L2_44, L3_45, 0
end
function passwordSet(A0_46, A1_47)
  local L2_48, L3_49
  L3_49 = db
  L3_49 = L3_49.getAttribute
  L3_49 = L3_49(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.feature)
  L2_48 = L3_49
  L3_49 = _UPVALUE4_
  if L2_48 ~= L3_49 then
    L3_49 = _UPVALUE5_
    L3_49 = L3_49.DEPENDENCY_NOT_MET
    return L3_49
  end
  L3_49 = _UPVALUE5_
  L3_49 = L3_49.NIL
  if A1_47 == L3_49 then
    L3_49 = _UPVALUE5_
    L3_49 = L3_49.INVALID_ARGUMENT
    return L3_49
  end
  L3_49 = _UPVALUE6_
  L3_49 = L3_49.stringLengthCheck
  L3_49 = L3_49(_UPVALUE7_, _UPVALUE8_, A1_47)
  if L3_49 ~= _UPVALUE5_.SUCCESS then
    L3_49 = _UPVALUE5_
    L3_49 = L3_49.INVALID_ARGUMENT
    return L3_49
  end
  L3_49 = nil
  L3_49 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.password, A1_47)
  if L3_49 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_46
  end
  return _UPVALUE5_.SUCCESS, A0_46
end
function idleTimeOutGet()
  local L0_50
  L0_50 = db
  L0_50 = L0_50.getAttribute
  L0_50 = L0_50(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.idleTimeOut)
  if L0_50 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_50
end
function idleTimeOutGetNext(A0_51)
  local L2_52, L3_53
  L2_52 = _UPVALUE0_
  L2_52 = L2_52.NOT_SUPPORTED
  L3_53 = 0
  return L2_52, L3_53, 0
end
function idleTimeOutSet(A0_54, A1_55)
  local L2_56, L3_57, L4_58
  L3_57 = db
  L3_57 = L3_57.getAttribute
  L4_58 = _UPVALUE0_
  L3_57 = L3_57(L4_58, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.feature)
  L2_56 = L3_57
  L3_57 = _UPVALUE4_
  if L2_56 ~= L3_57 then
    L3_57 = _UPVALUE5_
    L3_57 = L3_57.DEPENDENCY_NOT_MET
    return L3_57
  end
  L3_57 = _UPVALUE5_
  L3_57 = L3_57.NIL
  if A1_55 == L3_57 then
    L3_57 = _UPVALUE5_
    L3_57 = L3_57.INVALID_ARGUMENT
    return L3_57
  end
  L3_57 = tonumber
  L4_58 = A1_55
  L3_57 = L3_57(L4_58)
  L4_58 = _UPVALUE5_
  L4_58 = L4_58.NIL
  if L3_57 == L4_58 then
    L4_58 = _UPVALUE5_
    L4_58 = L4_58.INVALID_ARGUMENT
    return L4_58
  end
  L4_58 = _UPVALUE6_
  if not (L3_57 < L4_58) then
    L4_58 = _UPVALUE7_
  elseif L3_57 > L4_58 then
    L4_58 = _UPVALUE5_
    L4_58 = L4_58.INVALID_ARGUMENT
    return L4_58
  end
  L4_58 = nil
  L4_58 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.idleTimeOut, A1_55)
  if L4_58 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_54
  end
  return _UPVALUE5_.SUCCESS, A0_54
end
function isuseMppeEnabled()
  local L0_59
  L0_59 = db
  L0_59 = L0_59.getAttribute
  L0_59 = L0_59(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.useMppe)
  if L0_59 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_59
end
function isuseMppeEnabledNext(A0_60)
  local L2_61, L3_62
  L2_61 = _UPVALUE0_
  L2_61 = L2_61.NOT_SUPPORTED
  L3_62 = 0
  return L2_61, L3_62, 0
end
function useMppeEnable(A0_63)
  local L1_64, L2_65
  L2_65 = db
  L2_65 = L2_65.getAttribute
  L2_65 = L2_65(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.feature)
  L1_64 = L2_65
  L2_65 = _UPVALUE4_
  if L1_64 ~= L2_65 then
    L2_65 = _UPVALUE5_
    L2_65 = L2_65.DEPENDENCY_NOT_MET
    return L2_65
  end
  L2_65 = nil
  L2_65 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.useMppe, _UPVALUE4_)
  if L2_65 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_63
  end
  return _UPVALUE5_.SUCCESS, A0_63
end
function useMppeDisable(A0_66)
  local L1_67, L2_68
  L2_68 = db
  L2_68 = L2_68.getAttribute
  L2_68 = L2_68(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.feature)
  L1_67 = L2_68
  L2_68 = _UPVALUE4_
  if L1_67 ~= L2_68 then
    L2_68 = _UPVALUE5_
    L2_68 = L2_68.DEPENDENCY_NOT_MET
    return L2_68
  end
  L2_68 = nil
  L2_68 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.useMppe, _UPVALUE6_)
  if L2_68 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_66
  end
  return _UPVALUE5_.SUCCESS, A0_66
end
function connectionStatusGet()
  local L0_69
  L0_69 = db
  L0_69 = L0_69.getAttribute
  L0_69 = L0_69(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.connectionStatus)
  if L0_69 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_69
end
function connectionStatusGetNext(A0_70)
  local L2_71, L3_72
  L2_71 = _UPVALUE0_
  L2_71 = L2_71.NOT_SUPPORTED
  L3_72 = 0
  return L2_71, L3_72, 0
end
function connectionStatusSet(A0_73, A1_74)
  local L3_75, L4_76
  L3_75 = _UPVALUE0_
  L3_75 = L3_75.NOT_SUPPORTED
  L4_76 = 0
  return L3_75, L4_76, 0
end
function isactionStatusEnabled()
  local L0_77
  L0_77 = db
  L0_77 = L0_77.getAttribute
  L0_77 = L0_77(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.isactionStatus)
  if L0_77 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_77
end
function isactionStatusEnabledNext(A0_78)
  local L2_79, L3_80
  L2_79 = _UPVALUE0_
  L2_79 = L2_79.NOT_SUPPORTED
  L3_80 = 0
  return L2_79, L3_80, 0
end
function actionStatusEnable(A0_81)
  local L2_82, L3_83
  L2_82 = _UPVALUE0_
  L2_82 = L2_82.NOT_SUPPORTED
  L3_83 = 0
  return L2_82, L3_83, 0
end
function actionStatusDisable(A0_84)
  local L2_85, L3_86
  L2_85 = _UPVALUE0_
  L2_85 = L2_85.NOT_SUPPORTED
  L3_86 = 0
  return L2_85, L3_86, 0
end
function isactionEnabled()
  local L0_87
  L0_87 = db
  L0_87 = L0_87.getAttribute
  L0_87 = L0_87(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.isaction)
  if L0_87 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_87
end
function isactionEnabledNext(A0_88)
  local L2_89, L3_90
  L2_89 = _UPVALUE0_
  L2_89 = L2_89.NOT_SUPPORTED
  L3_90 = 0
  return L2_89, L3_90, 0
end
function actionEnable(A0_91)
  local L1_92
  L1_92 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.action, _UPVALUE4_)
  if L1_92 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_91
  end
  return _UPVALUE5_.SUCCESS, A0_91
end
function actionDisable(A0_93)
  local L1_94, L2_95, L3_96, L4_97, L5_98
  L2_95 = db
  L2_95 = L2_95.setAttribute
  L3_96 = _UPVALUE0_
  L4_97 = _UPVALUE1_
  L5_98 = _UPVALUE2_
  L2_95 = L2_95(L3_96, L4_97, L5_98, _UPVALUE3_.action, _UPVALUE4_)
  L1_94 = L2_95
  L2_95 = _UPVALUE5_
  L2_95 = L2_95.FALSE
  if L1_94 == L2_95 then
    L2_95 = _UPVALUE5_
    L2_95 = L2_95.FAILURE
    L3_96 = A0_93
    return L2_95, L3_96
  end
  L2_95 = db
  L2_95 = L2_95.getAttribute
  L3_96 = "l2tpVPNClient"
  L4_97 = "_ROWID_"
  L5_98 = "1"
  L2_95 = L2_95(L3_96, L4_97, L5_98, "l2tpServerIp")
  L3_96 = db
  L3_96 = L3_96.getRow
  L4_97 = "ConnectionStatus"
  L5_98 = "RemoteEndpoint"
  L3_96 = L3_96(L4_97, L5_98, L2_95)
  if L3_96 ~= nil then
    L4_97 = L3_96["ConnectionStatus.PolicyName"]
    L5_98 = db
    L5_98 = L5_98.getAttribute
    L5_98 = L5_98("IpsecVPNPolicy", "VPNPolicyName", L4_97, "L2tpIpsecPolicy")
    if L5_98 ~= nil and tonumber(L5_98) == 2 and _UPVALUE6_.ipsecConnectionStatusSet(L3_96["ConnectionStatus._ROWID_"], "0") ~= _UPVALUE5_.SUCCESS then
      return (_UPVALUE6_.ipsecConnectionStatusSet(L3_96["ConnectionStatus._ROWID_"], "0"))
    end
  end
  L4_97 = _UPVALUE5_
  L4_97 = L4_97.SUCCESS
  L5_98 = A0_93
  return L4_97, L5_98
end
function l2tpVpnClientConnectionStatusGet()
  local L0_99
  L0_99 = l2tpClientLuaLib
  L0_99 = L0_99.connStatusGet
  L0_99 = L0_99()
  connMode = db.getAttribute(_UPVALUE0_, _UPVALUE1_, 1, _UPVALUE2_.demandFlag)
  return _UPVALUE3_.SUCCESS, L0_99, connMode
end
function l2tpVpnClientGet()
  local L0_100, L1_101, L2_102, L3_103, L4_104, L5_105, L6_106, L7_107, L8_108, L9_109, L10_110, L11_111
  L0_100 = {}
  L1_101 = db
  L1_101 = L1_101.getRow
  L2_102 = _UPVALUE0_
  L3_103 = _UPVALUE1_
  L4_104 = _UPVALUE2_
  L1_101 = L1_101(L2_102, L3_103, L4_104)
  L0_100 = L1_101
  L1_101 = db
  L1_101 = L1_101.getAttribute
  L2_102 = _UPVALUE3_
  L3_103 = "_ROWID_"
  L4_104 = "1"
  L5_105 = "action"
  L1_101 = L1_101(L2_102, L3_103, L4_104, L5_105)
  L2_102 = _UPVALUE4_
  L2_102 = L2_102.NIL
  if L1_101 == L2_102 then
    L2_102 = _UPVALUE4_
    L2_102 = L2_102.FAILURE
    return L2_102
  end
  L2_102 = db
  L2_102 = L2_102.getAttribute
  L3_103 = _UPVALUE3_
  L4_104 = "_ROWID_"
  L5_105 = "1"
  L6_106 = "time"
  L2_102 = L2_102(L3_103, L4_104, L5_105, L6_106)
  L3_103 = _UPVALUE4_
  L3_103 = L3_103.NIL
  if L2_102 == L3_103 then
    L3_103 = _UPVALUE4_
    L3_103 = L3_103.FAILURE
    return L3_103
  end
  L3_103 = _UPVALUE4_
  L3_103 = L3_103.NIL
  if L0_100 == L3_103 then
    L3_103 = _UPVALUE4_
    L3_103 = L3_103.FAILURE
    return L3_103
  end
  L3_103 = _UPVALUE0_
  L4_104 = "."
  L5_105 = _UPVALUE5_
  L5_105 = L5_105.feature
  L3_103 = L3_103 .. L4_104 .. L5_105
  L3_103 = L0_100[L3_103]
  L4_104 = _UPVALUE0_
  L5_105 = "."
  L6_106 = _UPVALUE5_
  L6_106 = L6_106.serverIpAddress
  L4_104 = L4_104 .. L5_105 .. L6_106
  L4_104 = L0_100[L4_104]
  L5_105 = _UPVALUE0_
  L6_106 = "."
  L7_107 = _UPVALUE5_
  L7_107 = L7_107.remoteNetwork
  L5_105 = L5_105 .. L6_106 .. L7_107
  L5_105 = L0_100[L5_105]
  L6_106 = _UPVALUE0_
  L7_107 = "."
  L8_108 = _UPVALUE5_
  L8_108 = L8_108.remoteNetmask
  L6_106 = L6_106 .. L7_107 .. L8_108
  L6_106 = L0_100[L6_106]
  L7_107 = _UPVALUE0_
  L8_108 = "."
  L9_109 = _UPVALUE5_
  L9_109 = L9_109.userName
  L7_107 = L7_107 .. L8_108 .. L9_109
  L7_107 = L0_100[L7_107]
  L8_108 = _UPVALUE0_
  L9_109 = "."
  L10_110 = _UPVALUE5_
  L10_110 = L10_110.password
  L8_108 = L8_108 .. L9_109 .. L10_110
  L8_108 = L0_100[L8_108]
  L9_109 = _UPVALUE0_
  L10_110 = "."
  L11_111 = _UPVALUE5_
  L11_111 = L11_111.idleTimeOut
  L9_109 = L9_109 .. L10_110 .. L11_111
  L9_109 = L0_100[L9_109]
  L10_110 = _UPVALUE0_
  L11_111 = "."
  L10_110 = L10_110 .. L11_111 .. _UPVALUE5_.useMppe
  L10_110 = L0_100[L10_110]
  L11_111 = _UPVALUE0_
  L11_111 = L11_111 .. "." .. _UPVALUE5_.demandFlag
  L11_111 = L0_100[L11_111]
  return _UPVALUE4_.SUCCESS, 1, L3_103, L4_104, L5_105, L6_106, L7_107, L8_108, L9_109, L10_110, L11_111, L1_101, L2_102
end
function l2tpVpnClientGetNext(A0_112)
  local L2_113, L3_114
  L2_113 = _UPVALUE0_
  L2_113 = L2_113.NOT_SUPPORTED
  L3_114 = 0
  return L2_113, L3_114, 0
end
function l2tpVpnClientSet(A0_115, A1_116, A2_117, A3_118, A4_119, A5_120, A6_121, A7_122, A8_123, A9_124, A10_125, A11_126)
  local L12_127, L13_128, L14_129, L15_130, L16_131, L17_132, L18_133, L19_134, L20_135
  L12_127 = {}
  L13_128 = {}
  L14_129 = {}
  L15_130 = _UPVALUE0_
  if A1_116 == L15_130 then
    L15_130 = _UPVALUE1_
    L16_131 = "."
    L17_132 = "action"
    L15_130 = L15_130 .. L16_131 .. L17_132
    L13_128[L15_130] = A10_125
  else
    L15_130 = _UPVALUE1_
    L16_131 = "."
    L17_132 = "action"
    L15_130 = L15_130 .. L16_131 .. L17_132
    L13_128[L15_130] = 0
  end
  L15_130 = _UPVALUE0_
  if A10_125 == L15_130 then
    L15_130 = _UPVALUE1_
    L16_131 = "."
    L17_132 = "time"
    L15_130 = L15_130 .. L16_131 .. L17_132
    L13_128[L15_130] = A11_126
  else
    L15_130 = _UPVALUE1_
    L16_131 = "."
    L17_132 = "time"
    L15_130 = L15_130 .. L16_131 .. L17_132
    L13_128[L15_130] = 2
  end
  L15_130 = _UPVALUE2_
  L15_130 = L15_130.NIL
  if A1_116 == L15_130 then
    L15_130 = _UPVALUE2_
    L15_130 = L15_130.INVALID_ARGUMENT
    return L15_130
  end
  L15_130 = _UPVALUE3_
  L15_130 = L15_130.isBoolean
  L16_131 = A1_116
  L15_130 = L15_130(L16_131)
  valid = L15_130
  L15_130 = valid
  L16_131 = _UPVALUE2_
  L16_131 = L16_131.SUCCESS
  if L15_130 ~= L16_131 then
    L15_130 = _UPVALUE2_
    L15_130 = L15_130.INVALID_ARGUMENT
    return L15_130
  end
  L15_130 = _UPVALUE4_
  L16_131 = "."
  L17_132 = _UPVALUE5_
  L17_132 = L17_132.feature
  L15_130 = L15_130 .. L16_131 .. L17_132
  L12_127[L15_130] = A1_116
  L15_130 = _UPVALUE6_
  if A1_116 == L15_130 then
    L15_130 = _UPVALUE7_
    L16_131 = "."
    L17_132 = _UPVALUE5_
    L17_132 = L17_132.action
    L15_130 = L15_130 .. L16_131 .. L17_132
    L14_129[L15_130] = "0"
    L15_130 = _UPVALUE7_
    L16_131 = "."
    L17_132 = _UPVALUE5_
    L17_132 = L17_132.connectionStatus
    L15_130 = L15_130 .. L16_131 .. L17_132
    L14_129[L15_130] = "0"
  end
  L15_130 = _UPVALUE0_
  if A1_116 == L15_130 then
    L15_130 = _UPVALUE2_
    L15_130 = L15_130.NIL
    if A2_117 == L15_130 then
      L15_130 = _UPVALUE2_
      L15_130 = L15_130.INVALID_ARGUMENT
      return L15_130
    end
    L15_130 = _UPVALUE4_
    L16_131 = "."
    L17_132 = _UPVALUE5_
    L17_132 = L17_132.serverIpAddress
    L15_130 = L15_130 .. L16_131 .. L17_132
    L12_127[L15_130] = A2_117
    L15_130 = _UPVALUE2_
    L15_130 = L15_130.NIL
    if A3_118 == L15_130 then
      L15_130 = _UPVALUE2_
      L15_130 = L15_130.INVALID_ARGUMENT
      return L15_130
    end
    L15_130 = _UPVALUE3_
    L15_130 = L15_130.ipAddressCheck
    L16_131 = _UPVALUE8_
    L17_132 = A3_118
    L15_130 = L15_130(L16_131, L17_132)
    valid = L15_130
    L15_130 = valid
    L16_131 = _UPVALUE2_
    L16_131 = L16_131.SUCCESS
    if L15_130 ~= L16_131 then
      L15_130 = _UPVALUE9_
      L15_130 = L15_130.L2TP_CLIENT_INVALID_REMOTE_NETWORK
      return L15_130
    end
    L15_130 = _UPVALUE2_
    L15_130 = L15_130.NIL
    if A4_119 == L15_130 then
      L15_130 = _UPVALUE2_
      L15_130 = L15_130.INVALID_ARGUMENT
      return L15_130
    end
    L15_130 = tonumber
    L16_131 = A4_119
    L15_130 = L15_130(L16_131)
    L16_131 = _UPVALUE2_
    L16_131 = L16_131.NIL
    if L15_130 == L16_131 then
      L16_131 = _UPVALUE2_
      L16_131 = L16_131.INVALID_ARGUMENT
      return L16_131
    end
    L16_131 = _UPVALUE10_
    if not (L15_130 < L16_131) then
      L16_131 = _UPVALUE11_
    elseif L15_130 > L16_131 then
      L16_131 = _UPVALUE9_
      L16_131 = L16_131.L2TP_CLIENT_INVALID_REMOTE_NETMASK
      return L16_131
    end
    L16_131 = l2tpSubnetCheckValidation
    L17_132 = A3_118
    L18_133 = A4_119
    L16_131 = L16_131(L17_132, L18_133)
    valid = L16_131
    L16_131 = valid
    L17_132 = _UPVALUE2_
    L17_132 = L17_132.SUCCESS
    if L16_131 ~= L17_132 then
      L16_131 = valid
      return L16_131
    end
    L16_131 = _UPVALUE4_
    L17_132 = "."
    L18_133 = _UPVALUE5_
    L18_133 = L18_133.remoteNetwork
    L16_131 = L16_131 .. L17_132 .. L18_133
    L12_127[L16_131] = A3_118
    L16_131 = _UPVALUE4_
    L17_132 = "."
    L18_133 = _UPVALUE5_
    L18_133 = L18_133.remoteNetmask
    L16_131 = L16_131 .. L17_132 .. L18_133
    L12_127[L16_131] = A4_119
    L16_131 = _UPVALUE2_
    L16_131 = L16_131.NIL
    if A5_120 == L16_131 then
      L16_131 = _UPVALUE2_
      L16_131 = L16_131.INVALID_ARGUMENT
      return L16_131
    end
    L16_131 = _UPVALUE3_
    L16_131 = L16_131.stringLengthCheck
    L17_132 = _UPVALUE12_
    L18_133 = _UPVALUE13_
    L19_134 = A5_120
    L16_131 = L16_131(L17_132, L18_133, L19_134)
    L17_132 = _UPVALUE2_
    L17_132 = L17_132.SUCCESS
    if L16_131 ~= L17_132 then
      L16_131 = _UPVALUE2_
      L16_131 = L16_131.INVALID_ARGUMENT
      return L16_131
    end
    L16_131 = _UPVALUE4_
    L17_132 = "."
    L18_133 = _UPVALUE5_
    L18_133 = L18_133.userName
    L16_131 = L16_131 .. L17_132 .. L18_133
    L12_127[L16_131] = A5_120
    L16_131 = _UPVALUE2_
    L16_131 = L16_131.NIL
    if A6_121 == L16_131 then
      L16_131 = _UPVALUE2_
      L16_131 = L16_131.INVALID_ARGUMENT
      return L16_131
    end
    L16_131 = _UPVALUE3_
    L16_131 = L16_131.stringLengthCheck
    L17_132 = _UPVALUE14_
    L18_133 = _UPVALUE15_
    L19_134 = A6_121
    L16_131 = L16_131(L17_132, L18_133, L19_134)
    L17_132 = _UPVALUE2_
    L17_132 = L17_132.SUCCESS
    if L16_131 ~= L17_132 then
      L16_131 = _UPVALUE2_
      L16_131 = L16_131.INVALID_ARGUMENT
      return L16_131
    end
    L16_131 = _UPVALUE4_
    L17_132 = "."
    L18_133 = _UPVALUE5_
    L18_133 = L18_133.password
    L16_131 = L16_131 .. L17_132 .. L18_133
    L12_127[L16_131] = A6_121
    L16_131 = _UPVALUE2_
    L16_131 = L16_131.NIL
    if A9_124 == L16_131 then
      L16_131 = _UPVALUE2_
      L16_131 = L16_131.INVALID_ARGUMENT
      return L16_131
    end
    L16_131 = _UPVALUE4_
    L17_132 = "."
    L18_133 = _UPVALUE5_
    L18_133 = L18_133.demandFlag
    L16_131 = L16_131 .. L17_132 .. L18_133
    L12_127[L16_131] = A9_124
    if A9_124 == "1" then
      L16_131 = _UPVALUE2_
      L16_131 = L16_131.NIL
      if A7_122 == L16_131 then
        L16_131 = _UPVALUE2_
        L16_131 = L16_131.INVALID_ARGUMENT
        return L16_131
      end
      L16_131 = tonumber
      L17_132 = A7_122
      L16_131 = L16_131(L17_132)
      L17_132 = _UPVALUE2_
      L17_132 = L17_132.NIL
      if L16_131 == L17_132 then
        L17_132 = _UPVALUE2_
        L17_132 = L17_132.INVALID_ARGUMENT
        return L17_132
      end
      L17_132 = _UPVALUE16_
      if not (L16_131 < L17_132) then
        L17_132 = _UPVALUE17_
      elseif L16_131 > L17_132 then
        L17_132 = _UPVALUE9_
        L17_132 = L17_132.L2TP_CLIENT_INVALID_TIMEOUT
        return L17_132
      end
      L17_132 = _UPVALUE4_
      L18_133 = "."
      L19_134 = _UPVALUE5_
      L19_134 = L19_134.idleTimeOut
      L17_132 = L17_132 .. L18_133 .. L19_134
      L12_127[L17_132] = A7_122
    end
    L16_131 = _UPVALUE2_
    L16_131 = L16_131.NIL
    if A8_123 == L16_131 then
      L16_131 = _UPVALUE2_
      L16_131 = L16_131.INVALID_ARGUMENT
      return L16_131
    end
    L16_131 = _UPVALUE3_
    L16_131 = L16_131.isBoolean
    L17_132 = A8_123
    L16_131 = L16_131(L17_132)
    valid = L16_131
    L16_131 = valid
    L17_132 = _UPVALUE2_
    L17_132 = L17_132.SUCCESS
    if L16_131 ~= L17_132 then
      L16_131 = _UPVALUE2_
      L16_131 = L16_131.INVALID_ARGUMENT
      return L16_131
    end
    L16_131 = _UPVALUE4_
    L17_132 = "."
    L18_133 = _UPVALUE5_
    L18_133 = L18_133.useMppe
    L16_131 = L16_131 .. L17_132 .. L18_133
    L12_127[L16_131] = A8_123
  end
  L15_130, L16_131 = nil, nil
  L17_132 = io
  L17_132 = L17_132.open
  L18_133 = _UPVALUE18_
  L19_134 = "r"
  L17_132 = L17_132(L18_133, L19_134)
  L16_131 = L17_132
  if L16_131 then
    L18_133 = L16_131
    L17_132 = L16_131.read
    L19_134 = "*all"
    L17_132 = L17_132(L18_133, L19_134)
    L15_130 = L17_132
    L18_133 = L16_131
    L17_132 = L16_131.close
    L17_132(L18_133)
    L17_132 = os
    L17_132 = L17_132.execute
    L18_133 = _UPVALUE19_
    L19_134 = " -9 "
    L20_135 = L15_130
    L18_133 = L18_133 .. L19_134 .. L20_135
    L17_132(L18_133)
    L17_132 = os
    L17_132 = L17_132.remove
    L18_133 = _UPVALUE18_
    L17_132(L18_133)
  end
  L17_132 = io
  L17_132 = L17_132.open
  L18_133 = _UPVALUE20_
  L19_134 = "r"
  L17_132 = L17_132(L18_133, L19_134)
  L16_131 = L17_132
  if L16_131 then
    L18_133 = L16_131
    L17_132 = L16_131.read
    L19_134 = "*all"
    L17_132 = L17_132(L18_133, L19_134)
    L15_130 = L17_132
    L18_133 = L16_131
    L17_132 = L16_131.close
    L17_132(L18_133)
    L17_132 = os
    L17_132 = L17_132.execute
    L18_133 = _UPVALUE19_
    L19_134 = " -9 "
    L20_135 = L15_130
    L18_133 = L18_133 .. L19_134 .. L20_135
    L17_132(L18_133)
    L17_132 = os
    L17_132 = L17_132.remove
    L18_133 = _UPVALUE20_
    L17_132(L18_133)
  end
  L17_132 = os
  L17_132 = L17_132.remove
  L18_133 = _UPVALUE21_
  L17_132(L18_133)
  L17_132 = db
  L17_132 = L17_132.getAttribute
  L18_133 = "l2tpVPNClient"
  L19_134 = "_ROWID_"
  L20_135 = "1"
  L17_132 = L17_132(L18_133, L19_134, L20_135, "l2tpServerIp")
  L18_133 = db
  L18_133 = L18_133.getRow
  L19_134 = "ConnectionStatus"
  L20_135 = "RemoteEndpoint"
  L18_133 = L18_133(L19_134, L20_135, L17_132)
  if L18_133 ~= nil then
    L19_134 = L18_133["ConnectionStatus.PolicyName"]
    L20_135 = db
    L20_135 = L20_135.getAttribute
    L20_135 = L20_135("IpsecVPNPolicy", "VPNPolicyName", L19_134, "L2tpIpsecPolicy")
    if L20_135 ~= nil and tonumber(L20_135) == 2 and _UPVALUE22_.ipsecConnectionStatusSet(L18_133["ConnectionStatus._ROWID_"], "0") ~= _UPVALUE2_.SUCCESS then
      return (_UPVALUE22_.ipsecConnectionStatusSet(L18_133["ConnectionStatus._ROWID_"], "0"))
    end
  end
  L19_134 = nil
  L20_135 = _UPVALUE0_
  if A1_116 == L20_135 then
    L20_135 = _UPVALUE4_
    L20_135 = L20_135 .. "." .. _UPVALUE5_.feature
    L12_127[L20_135] = _UPVALUE6_
    L20_135 = db
    L20_135 = L20_135.update
    L20_135 = L20_135(_UPVALUE4_, L12_127, _UPVALUE23_)
    L19_134 = L20_135
    L20_135 = _UPVALUE2_
    L20_135 = L20_135.NIL
    if L19_134 == L20_135 then
      L20_135 = _UPVALUE2_
      L20_135 = L20_135.FAILURE
      return L20_135, A0_115
    end
    L20_135 = _UPVALUE4_
    L20_135 = L20_135 .. "." .. _UPVALUE5_.feature
    L12_127[L20_135] = _UPVALUE0_
    L20_135 = db
    L20_135 = L20_135.update
    L20_135 = L20_135(_UPVALUE4_, L12_127, _UPVALUE23_)
    L19_134 = L20_135
    L20_135 = _UPVALUE2_
    L20_135 = L20_135.NIL
    if L19_134 == L20_135 then
      L20_135 = _UPVALUE2_
      L20_135 = L20_135.FAILURE
      return L20_135, A0_115
    end
  else
    L20_135 = db
    L20_135 = L20_135.update
    L20_135 = L20_135(_UPVALUE4_, L12_127, _UPVALUE23_)
    L19_134 = L20_135
    L20_135 = db
    L20_135 = L20_135.update
    L20_135 = L20_135(_UPVALUE7_, L14_129, _UPVALUE23_)
    if L20_135 == _UPVALUE2_.NIL then
      return _UPVALUE2_.FAILURE, A0_115
    end
  end
  L20_135 = nil
  L20_135 = db.update(_UPVALUE1_, L13_128, "1")
  if L19_134 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_115
  end
  if L20_135 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_115
  end
  return _UPVALUE2_.SUCCESS, A0_115
end
function l2tpSubnetCheckValidation(A0_136, A1_137)
  local L2_138, L3_139, L4_140, L5_141, L6_142
  L2_138 = 1
  L3_139 = _UPVALUE0_
  L3_139 = L3_139.NIL
  L4_140 = _UPVALUE1_
  L5_141 = _UPVALUE2_
  L5_141 = L5_141.ipv4SubnetMaskGet
  L6_142 = A1_137
  L6_142 = L5_141(L6_142)
  L3_139 = L6_142
  L2_138 = L5_141
  L5_141 = _UPVALUE0_
  L5_141 = L5_141.NIL
  if L3_139 == L5_141 then
    L5_141 = _UPVALUE3_
    L5_141 = L5_141.L2TP_CLIENT_INVALID_REMOTE_NETMASK
    return L5_141
  end
  L5_141 = _UPVALUE4_
  L5_141 = L5_141.vlanGet
  L6_142 = L4_140
  vlanId, vlanName, interRouting, vlanIP, vlanSubnet, dhcpType, dnsProxy, dhcpRelay, L5_141 = nil, nil, nil, nil, nil, nil, nil, nil, L5_141(L6_142)
  vlanId, vlanName, interRouting, vlanIP, vlanSubnet, dhcpType, dnsProxy, dhcpRelay, L6_142 = nil, nil, nil, nil, nil, nil, nil, nil, L5_141(L6_142)
  vlanCookie = L6_142
  L2_138 = L5_141
  L5_141 = _UPVALUE0_
  L5_141 = L5_141.SUCCESS
  if L2_138 ~= L5_141 then
    L5_141 = _UPVALUE3_
    L5_141 = L5_141.L2TP_CLIENT_VALIDATION_CHECK_FAILED
    return L5_141
  end
  L5_141 = vlanSubnet
  def_LAN_Subnet = L5_141
  L5_141 = _UPVALUE2_
  L5_141 = L5_141.ipv4DualMaskCheck
  L6_142 = vlanIP
  L5_141 = L5_141(L6_142, vlanSubnet, A0_136, L3_139)
  L2_138 = L5_141
  L5_141 = _UPVALUE0_
  L5_141 = L5_141.SUCCESS
  if L2_138 == L5_141 then
    L5_141 = _UPVALUE0_
    L5_141 = L5_141.LAN_VLAN_ALREADY_CONFIGURED
    return L5_141
  end
  L5_141 = _UPVALUE4_
  L5_141 = L5_141.vlanGetNext
  L6_142 = vlanCookie
  vlanId, vlanName, interRouting, vlanIP, vlanSubnet, dhcpType, dnsProxy, dhcpRelay, L5_141 = vlanSubnet, A0_136, L3_139, L5_141(L6_142)
  vlanId, vlanName, interRouting, vlanIP, vlanSubnet, dhcpType, dnsProxy, dhcpRelay, L6_142 = vlanSubnet, A0_136, L3_139, L5_141(L6_142)
  vlanCookie = L6_142
  L2_138 = L5_141
  while true do
    L5_141 = _UPVALUE0_
    L5_141 = L5_141.NEXT_ROWID_INVALID
    if L2_138 ~= L5_141 then
      L5_141 = _UPVALUE0_
      L5_141 = L5_141.SUCCESS
      if L2_138 ~= L5_141 then
        L5_141 = _UPVALUE3_
        L5_141 = L5_141.L2TP_CLIENT_VALIDATION_CHECK_FAILED
        return L5_141
      end
      L5_141 = _UPVALUE2_
      L5_141 = L5_141.ipv4DualMaskCheck
      L6_142 = vlanIP
      L5_141 = L5_141(L6_142, vlanSubnet, A0_136, L3_139)
      L2_138 = L5_141
      L5_141 = _UPVALUE0_
      L5_141 = L5_141.SUCCESS
      if L2_138 == L5_141 then
        L5_141 = _UPVALUE0_
        L5_141 = L5_141.LAN_VLAN_ALREADY_CONFIGURED
        return L5_141
      end
      L5_141 = _UPVALUE4_
      L5_141 = L5_141.vlanGetNext
      L6_142 = vlanCookie
      vlanId, vlanName, interRouting, vlanIP, vlanSubnet, dhcpType, dnsProxy, dhcpRelay, L5_141 = vlanSubnet, A0_136, L3_139, L5_141(L6_142)
      vlanId, vlanName, interRouting, vlanIP, vlanSubnet, dhcpType, dnsProxy, dhcpRelay, L6_142 = vlanSubnet, A0_136, L3_139, L5_141(L6_142)
      vlanCookie = L6_142
      L2_138 = L5_141
    end
  end
  L5_141 = db
  L5_141 = L5_141.getAttribute
  L6_142 = _UPVALUE5_
  L5_141 = L5_141(L6_142, _UPVALUE6_.dmz_interface, _UPVALUE7_, _UPVALUE6_.dmz_ip)
  L6_142 = db
  L6_142 = L6_142.getAttribute
  L6_142 = L6_142(_UPVALUE5_, _UPVALUE6_.dmz_interface, _UPVALUE7_, _UPVALUE6_.dmz_netmask)
  if L5_141 ~= _UPVALUE0_.NIL and L5_141 ~= _UPVALUE8_ and L6_142 ~= _UPVALUE0_.NIL and L6_142 ~= _UPVALUE8_ then
    L2_138 = _UPVALUE2_.ipv4DualMaskCheck(L5_141, L6_142, A0_136, L3_139)
    if L2_138 == _UPVALUE0_.SUCCESS then
      return _UPVALUE0_.DMZ_ALREADY_CONFIGURED
    end
  end
  result = _UPVALUE2_.checkWanSubnetRange(A0_136, L3_139)
  if result == _UPVALUE0_.SUCCESS then
    if UNIT_NAME ~= "DSR-150N" and UNIT_NAME ~= "DSR-150" and UNIT_NAME ~= "DSR-250N" and UNIT_NAME ~= "DSR-250" then
      return _UPVALUE0_.WAN_ALREADY_CONFIGURED
    else
      return _UPVALUE0_.WAN_ECONA_ALREADY_CONFIGURED
    end
  end
  return _UPVALUE0_.SUCCESS
end
function l2tpVpnClientCreate(A0_143, A1_144, A2_145, A3_146, A4_147, A5_148, A6_149, A7_150)
  local L9_151, L10_152
  L9_151 = _UPVALUE0_
  L9_151 = L9_151.NOT_SUPPORTED
  L10_152 = 0
  return L9_151, L10_152, 0
end
function l2tpVpnClientDelete(A0_153)
  local L2_154, L3_155
  L2_154 = _UPVALUE0_
  L2_154 = L2_154.NOT_SUPPORTED
  L3_155 = 0
  return L2_154, L3_155, 0
end
function activeL2tpVpnClientsGet()
  local L0_156, L1_157, L2_158, L3_159
  L0_156 = {}
  L1_157 = db
  L1_157 = L1_157.getRow
  L2_158 = _UPVALUE0_
  L3_159 = _UPVALUE1_
  L1_157 = L1_157(L2_158, L3_159, _UPVALUE2_)
  L0_156 = L1_157
  L1_157 = _UPVALUE3_
  L1_157 = L1_157.NIL
  if L0_156 == L1_157 then
    L1_157 = _UPVALUE3_
    L1_157 = L1_157.FAILURE
    return L1_157
  end
  L1_157 = _UPVALUE0_
  L2_158 = "."
  L3_159 = _UPVALUE4_
  L3_159 = L3_159.connectionStatus
  L1_157 = L1_157 .. L2_158 .. L3_159
  L1_157 = L0_156[L1_157]
  L2_158 = _UPVALUE0_
  L3_159 = "."
  L2_158 = L2_158 .. L3_159 .. _UPVALUE4_.actionStatus
  L2_158 = L0_156[L2_158]
  L3_159 = _UPVALUE0_
  L3_159 = L3_159 .. "." .. _UPVALUE4_.action
  L3_159 = L0_156[L3_159]
  return _UPVALUE3_.SUCCESS, 1, L1_157, L2_158, L3_159
end
function activeL2tpVpnClientsGetNext(A0_160)
  local L2_161, L3_162
  L2_161 = _UPVALUE0_
  L2_161 = L2_161.NOT_SUPPORTED
  L3_162 = 0
  return L2_161, L3_162, 0
end
function activeL2tpVpnClientsSet(A0_163, A1_164, A2_165, A3_166)
  local L5_167, L6_168
  L5_167 = _UPVALUE0_
  L5_167 = L5_167.NOT_SUPPORTED
  L6_168 = 0
  return L5_167, L6_168, 0
end
function activeL2tpVpnClientsCreate(A0_169, A1_170, A2_171)
  local L4_172, L5_173
  L4_172 = _UPVALUE0_
  L4_172 = L4_172.NOT_SUPPORTED
  L5_173 = 0
  return L4_172, L5_173, 0
end
function activeL2tpVpnClientsDelete(A0_174)
  local L2_175, L3_176
  L2_175 = _UPVALUE0_
  L2_175 = L2_175.NOT_SUPPORTED
  L3_176 = 0
  return L2_175, L3_176, 0
end
function autol2tpSet(A0_177, A1_178)
  local L2_179
  L2_179 = {}
  L2_179[_UPVALUE0_ .. "." .. "action"] = A0_177
  L2_179[_UPVALUE0_ .. "." .. "time"] = A1_178
  if db.update(_UPVALUE0_, L2_179, "1") == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS
end
function autol2tpClientGet()
  local L0_180, L1_181, L2_182, L3_183, L4_184
  L3_183 = db
  L3_183 = L3_183.getAttribute
  L4_184 = _UPVALUE0_
  L3_183 = L3_183(L4_184, "_ROWID_", "1", "action")
  L4_184 = _UPVALUE1_
  L4_184 = L4_184.NIL
  if L3_183 == L4_184 then
    L4_184 = _UPVALUE1_
    L4_184 = L4_184.FAILURE
    return L4_184
  end
  L4_184 = db
  L4_184 = L4_184.getAttribute
  L4_184 = L4_184(_UPVALUE0_, "_ROWID_", "1", "time")
  if L4_184 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L3_183, L4_184
end
