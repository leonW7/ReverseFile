local L0_0
L0_0 = module
L0_0("com.teamf1.core.vpn.pptpclient", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vlan_vlan")
L0_0 = require
L0_0("teamf1lualib/pptpClient_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).feature = "pptpClientEnable"
;({}).serverIpAddress = "ServerIp"
;({}).remoteNetwork = "RemoteNetwork"
;({}).remoteNetmask = "RemoteNetmask"
;({}).userName = "UserName"
;({}).password = "Password"
;({}).idleTimeOut = "IdleTimeOut"
;({}).useMppe = "MppeEncryptionEnable"
;({}).connectionStatus = "connectionStatus"
;({}).actionStatus = "actionStatus"
;({}).action = "action"
;({}).name = "name"
;({}).value = "value"
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
  local L1_94
  L1_94 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.action, _UPVALUE4_)
  if L1_94 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_93
  end
  return _UPVALUE5_.SUCCESS, A0_93
end
function pptpVpnClientConnectionStatusGet()
  local L0_95
  L0_95 = pptpClientLuaLib
  L0_95 = L0_95.connStatusGet
  L0_95 = L0_95()
  if L0_95 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_95
end
function pptpVpnClientGet()
  local L0_96, L1_97, L2_98, L3_99, L4_100, L5_101, L6_102, L7_103, L8_104, L9_105, L10_106
  L0_96 = {}
  L1_97 = db
  L1_97 = L1_97.getRow
  L2_98 = _UPVALUE0_
  L3_99 = _UPVALUE1_
  L4_100 = _UPVALUE2_
  L1_97 = L1_97(L2_98, L3_99, L4_100)
  L0_96 = L1_97
  L1_97 = db
  L1_97 = L1_97.getAttribute
  L2_98 = _UPVALUE3_
  L3_99 = "_ROWID_"
  L4_100 = "1"
  L5_101 = "action"
  L1_97 = L1_97(L2_98, L3_99, L4_100, L5_101)
  L2_98 = _UPVALUE4_
  L2_98 = L2_98.NIL
  if L1_97 == L2_98 then
    L2_98 = _UPVALUE4_
    L2_98 = L2_98.FAILURE
    return L2_98
  end
  L2_98 = db
  L2_98 = L2_98.getAttribute
  L3_99 = _UPVALUE3_
  L4_100 = "_ROWID_"
  L5_101 = "1"
  L6_102 = "time"
  L2_98 = L2_98(L3_99, L4_100, L5_101, L6_102)
  L3_99 = _UPVALUE4_
  L3_99 = L3_99.NIL
  if L2_98 == L3_99 then
    L3_99 = _UPVALUE4_
    L3_99 = L3_99.FAILURE
    return L3_99
  end
  L3_99 = _UPVALUE4_
  L3_99 = L3_99.NIL
  if L0_96 == L3_99 then
    L3_99 = _UPVALUE4_
    L3_99 = L3_99.FAILURE
    return L3_99
  end
  L3_99 = _UPVALUE0_
  L4_100 = "."
  L5_101 = _UPVALUE5_
  L5_101 = L5_101.feature
  L3_99 = L3_99 .. L4_100 .. L5_101
  L3_99 = L0_96[L3_99]
  L4_100 = _UPVALUE0_
  L5_101 = "."
  L6_102 = _UPVALUE5_
  L6_102 = L6_102.serverIpAddress
  L4_100 = L4_100 .. L5_101 .. L6_102
  L4_100 = L0_96[L4_100]
  L5_101 = _UPVALUE0_
  L6_102 = "."
  L7_103 = _UPVALUE5_
  L7_103 = L7_103.remoteNetwork
  L5_101 = L5_101 .. L6_102 .. L7_103
  L5_101 = L0_96[L5_101]
  L6_102 = _UPVALUE0_
  L7_103 = "."
  L8_104 = _UPVALUE5_
  L8_104 = L8_104.remoteNetmask
  L6_102 = L6_102 .. L7_103 .. L8_104
  L6_102 = L0_96[L6_102]
  L7_103 = _UPVALUE0_
  L8_104 = "."
  L9_105 = _UPVALUE5_
  L9_105 = L9_105.userName
  L7_103 = L7_103 .. L8_104 .. L9_105
  L7_103 = L0_96[L7_103]
  L8_104 = _UPVALUE0_
  L9_105 = "."
  L10_106 = _UPVALUE5_
  L10_106 = L10_106.password
  L8_104 = L8_104 .. L9_105 .. L10_106
  L8_104 = L0_96[L8_104]
  L9_105 = _UPVALUE0_
  L10_106 = "."
  L9_105 = L9_105 .. L10_106 .. _UPVALUE5_.idleTimeOut
  L9_105 = L0_96[L9_105]
  L10_106 = _UPVALUE0_
  L10_106 = L10_106 .. "." .. _UPVALUE5_.useMppe
  L10_106 = L0_96[L10_106]
  return _UPVALUE4_.SUCCESS, 1, L3_99, L4_100, L5_101, L6_102, L7_103, L8_104, L9_105, L10_106, L1_97, L2_98
end
function pptpVpnClientGetNext(A0_107)
  local L2_108, L3_109
  L2_108 = _UPVALUE0_
  L2_108 = L2_108.NOT_SUPPORTED
  L3_109 = 0
  return L2_108, L3_109, 0
end
function pptpVpnClientSet(A0_110, A1_111, A2_112, A3_113, A4_114, A5_115, A6_116, A7_117, A8_118, A9_119, A10_120)
  local L11_121, L12_122, L13_123, L14_124, L15_125, L16_126, L17_127
  L11_121 = {}
  L12_122 = {}
  L13_123 = {}
  L14_124 = _UPVALUE0_
  if A1_111 == L14_124 then
    L14_124 = _UPVALUE1_
    L15_125 = "."
    L16_126 = "action"
    L14_124 = L14_124 .. L15_125 .. L16_126
    L12_122[L14_124] = A9_119
  else
    L14_124 = _UPVALUE1_
    L15_125 = "."
    L16_126 = "action"
    L14_124 = L14_124 .. L15_125 .. L16_126
    L12_122[L14_124] = 0
  end
  L14_124 = _UPVALUE0_
  if A9_119 == L14_124 then
    L14_124 = _UPVALUE1_
    L15_125 = "."
    L16_126 = "time"
    L14_124 = L14_124 .. L15_125 .. L16_126
    L12_122[L14_124] = A10_120
  else
    L14_124 = _UPVALUE1_
    L15_125 = "."
    L16_126 = "time"
    L14_124 = L14_124 .. L15_125 .. L16_126
    L12_122[L14_124] = 2
  end
  L14_124 = _UPVALUE2_
  L14_124 = L14_124.NIL
  if A1_111 == L14_124 then
    L14_124 = _UPVALUE2_
    L14_124 = L14_124.INVALID_ARGUMENT
    return L14_124
  end
  L14_124 = _UPVALUE3_
  L14_124 = L14_124.isBoolean
  L15_125 = A1_111
  L14_124 = L14_124(L15_125)
  valid = L14_124
  L14_124 = valid
  L15_125 = _UPVALUE2_
  L15_125 = L15_125.SUCCESS
  if L14_124 ~= L15_125 then
    L14_124 = _UPVALUE2_
    L14_124 = L14_124.INVALID_ARGUMENT
    return L14_124
  end
  L14_124 = _UPVALUE4_
  L15_125 = "."
  L16_126 = _UPVALUE5_
  L16_126 = L16_126.feature
  L14_124 = L14_124 .. L15_125 .. L16_126
  L11_121[L14_124] = A1_111
  L14_124 = _UPVALUE6_
  if A1_111 == L14_124 then
    L14_124 = _UPVALUE7_
    L15_125 = "."
    L16_126 = _UPVALUE5_
    L16_126 = L16_126.action
    L14_124 = L14_124 .. L15_125 .. L16_126
    L13_123[L14_124] = "0"
  end
  L14_124 = _UPVALUE0_
  if A1_111 == L14_124 then
    L14_124 = _UPVALUE2_
    L14_124 = L14_124.NIL
    if A2_112 == L14_124 then
      L14_124 = _UPVALUE2_
      L14_124 = L14_124.INVALID_ARGUMENT
      return L14_124
    end
    L14_124 = _UPVALUE4_
    L15_125 = "."
    L16_126 = _UPVALUE5_
    L16_126 = L16_126.serverIpAddress
    L14_124 = L14_124 .. L15_125 .. L16_126
    L11_121[L14_124] = A2_112
    L14_124 = _UPVALUE2_
    L14_124 = L14_124.NIL
    if A3_113 == L14_124 then
      L14_124 = _UPVALUE2_
      L14_124 = L14_124.INVALID_ARGUMENT
      return L14_124
    end
    L14_124 = _UPVALUE3_
    L14_124 = L14_124.ipAddressCheck
    L15_125 = _UPVALUE8_
    L16_126 = A3_113
    L14_124 = L14_124(L15_125, L16_126)
    valid = L14_124
    L14_124 = valid
    L15_125 = _UPVALUE2_
    L15_125 = L15_125.SUCCESS
    if L14_124 ~= L15_125 then
      L14_124 = _UPVALUE9_
      L14_124 = L14_124.PPTP_CLIENT_INVALID_REMOTE_NETWORK
      return L14_124
    end
    L14_124 = _UPVALUE2_
    L14_124 = L14_124.NIL
    if A4_114 == L14_124 then
      L14_124 = _UPVALUE2_
      L14_124 = L14_124.INVALID_ARGUMENT
      return L14_124
    end
    L14_124 = tonumber
    L15_125 = A4_114
    L14_124 = L14_124(L15_125)
    L15_125 = _UPVALUE2_
    L15_125 = L15_125.NIL
    if L14_124 == L15_125 then
      L15_125 = _UPVALUE2_
      L15_125 = L15_125.INVALID_ARGUMENT
      return L15_125
    end
    L15_125 = _UPVALUE10_
    if not (L14_124 < L15_125) then
      L15_125 = _UPVALUE11_
    elseif L14_124 > L15_125 then
      L15_125 = _UPVALUE9_
      L15_125 = L15_125.PPTP_CLIENT_INVALID_REMOTE_NETMASK
      return L15_125
    end
    L15_125 = pptpSubnetCheckValidation
    L16_126 = A3_113
    L17_127 = A4_114
    L15_125 = L15_125(L16_126, L17_127)
    valid = L15_125
    L15_125 = valid
    L16_126 = _UPVALUE2_
    L16_126 = L16_126.SUCCESS
    if L15_125 ~= L16_126 then
      L15_125 = valid
      return L15_125
    end
    L15_125 = _UPVALUE4_
    L16_126 = "."
    L17_127 = _UPVALUE5_
    L17_127 = L17_127.remoteNetwork
    L15_125 = L15_125 .. L16_126 .. L17_127
    L11_121[L15_125] = A3_113
    L15_125 = _UPVALUE4_
    L16_126 = "."
    L17_127 = _UPVALUE5_
    L17_127 = L17_127.remoteNetmask
    L15_125 = L15_125 .. L16_126 .. L17_127
    L11_121[L15_125] = A4_114
    L15_125 = _UPVALUE2_
    L15_125 = L15_125.NIL
    if A5_115 == L15_125 then
      L15_125 = _UPVALUE2_
      L15_125 = L15_125.INVALID_ARGUMENT
      return L15_125
    end
    L15_125 = _UPVALUE3_
    L15_125 = L15_125.stringLengthCheck
    L16_126 = _UPVALUE12_
    L17_127 = _UPVALUE13_
    L15_125 = L15_125(L16_126, L17_127, A5_115)
    L16_126 = _UPVALUE2_
    L16_126 = L16_126.SUCCESS
    if L15_125 ~= L16_126 then
      L15_125 = _UPVALUE2_
      L15_125 = L15_125.INVALID_ARGUMENT
      return L15_125
    end
    L15_125 = _UPVALUE4_
    L16_126 = "."
    L17_127 = _UPVALUE5_
    L17_127 = L17_127.userName
    L15_125 = L15_125 .. L16_126 .. L17_127
    L11_121[L15_125] = A5_115
    L15_125 = _UPVALUE2_
    L15_125 = L15_125.NIL
    if A6_116 == L15_125 then
      L15_125 = _UPVALUE2_
      L15_125 = L15_125.INVALID_ARGUMENT
      return L15_125
    end
    L15_125 = _UPVALUE3_
    L15_125 = L15_125.stringLengthCheck
    L16_126 = _UPVALUE14_
    L17_127 = _UPVALUE15_
    L15_125 = L15_125(L16_126, L17_127, A6_116)
    L16_126 = _UPVALUE2_
    L16_126 = L16_126.SUCCESS
    if L15_125 ~= L16_126 then
      L15_125 = _UPVALUE2_
      L15_125 = L15_125.INVALID_ARGUMENT
      return L15_125
    end
    L15_125 = _UPVALUE4_
    L16_126 = "."
    L17_127 = _UPVALUE5_
    L17_127 = L17_127.password
    L15_125 = L15_125 .. L16_126 .. L17_127
    L11_121[L15_125] = A6_116
    L15_125 = _UPVALUE2_
    L15_125 = L15_125.NIL
    if A7_117 == L15_125 then
      L15_125 = _UPVALUE2_
      L15_125 = L15_125.INVALID_ARGUMENT
      return L15_125
    end
    L15_125 = tonumber
    L16_126 = A7_117
    L15_125 = L15_125(L16_126)
    L16_126 = _UPVALUE2_
    L16_126 = L16_126.NIL
    if L15_125 == L16_126 then
      L16_126 = _UPVALUE2_
      L16_126 = L16_126.INVALID_ARGUMENT
      return L16_126
    end
    L16_126 = _UPVALUE16_
    if not (L15_125 < L16_126) then
      L16_126 = _UPVALUE17_
    elseif L15_125 > L16_126 then
      L16_126 = _UPVALUE9_
      L16_126 = L16_126.PPTP_CLIENT_INVALID_TIMEOUT
      return L16_126
    end
    L16_126 = _UPVALUE4_
    L17_127 = "."
    L16_126 = L16_126 .. L17_127 .. _UPVALUE5_.idleTimeOut
    L11_121[L16_126] = A7_117
    L16_126 = _UPVALUE2_
    L16_126 = L16_126.NIL
    if A8_118 == L16_126 then
      L16_126 = _UPVALUE2_
      L16_126 = L16_126.INVALID_ARGUMENT
      return L16_126
    end
    L16_126 = _UPVALUE3_
    L16_126 = L16_126.isBoolean
    L17_127 = A8_118
    L16_126 = L16_126(L17_127)
    valid = L16_126
    L16_126 = valid
    L17_127 = _UPVALUE2_
    L17_127 = L17_127.SUCCESS
    if L16_126 ~= L17_127 then
      L16_126 = _UPVALUE2_
      L16_126 = L16_126.INVALID_ARGUMENT
      return L16_126
    end
    L16_126 = _UPVALUE4_
    L17_127 = "."
    L16_126 = L16_126 .. L17_127 .. _UPVALUE5_.useMppe
    L11_121[L16_126] = A8_118
  end
  L14_124, L15_125 = nil, nil
  L16_126 = io
  L16_126 = L16_126.open
  L17_127 = _UPVALUE18_
  L16_126 = L16_126(L17_127, "r")
  L15_125 = L16_126
  if L15_125 then
    L17_127 = L15_125
    L16_126 = L15_125.read
    L16_126 = L16_126(L17_127, "*all")
    L14_124 = L16_126
    L17_127 = L15_125
    L16_126 = L15_125.close
    L16_126(L17_127)
    L16_126 = os
    L16_126 = L16_126.execute
    L17_127 = _UPVALUE19_
    L17_127 = L17_127 .. " -9 " .. L14_124
    L16_126(L17_127)
  end
  L16_126 = io
  L16_126 = L16_126.open
  L17_127 = _UPVALUE20_
  L16_126 = L16_126(L17_127, "r")
  L15_125 = L16_126
  if L15_125 then
    L17_127 = L15_125
    L16_126 = L15_125.read
    L16_126 = L16_126(L17_127, "*all")
    L14_124 = L16_126
    L17_127 = L15_125
    L16_126 = L15_125.close
    L16_126(L17_127)
    L16_126 = os
    L16_126 = L16_126.execute
    L17_127 = _UPVALUE19_
    L17_127 = L17_127 .. " -9 " .. L14_124
    L16_126(L17_127)
    L16_126 = os
    L16_126 = L16_126.remove
    L17_127 = _UPVALUE20_
    L16_126(L17_127)
  end
  L16_126 = os
  L16_126 = L16_126.remove
  L17_127 = _UPVALUE21_
  L16_126(L17_127)
  L16_126 = nil
  L17_127 = db
  L17_127 = L17_127.update
  L17_127 = L17_127(_UPVALUE4_, L11_121, _UPVALUE22_)
  L16_126 = L17_127
  L17_127 = nil
  L17_127 = db.update(_UPVALUE1_, L12_122, "1")
  if L17_127 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_110
  end
  if L16_126 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_110
  end
  if A1_111 == _UPVALUE6_ and db.update(_UPVALUE7_, L13_123, _UPVALUE22_) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_110
  end
  return _UPVALUE2_.SUCCESS, A0_110
end
function pptpSubnetCheckValidation(A0_128, A1_129)
  local L2_130, L3_131, L4_132, L5_133, L6_134
  L2_130 = 1
  L3_131 = _UPVALUE0_
  L3_131 = L3_131.NIL
  L4_132 = _UPVALUE1_
  L5_133 = _UPVALUE2_
  L5_133 = L5_133.ipv4SubnetMaskGet
  L6_134 = A1_129
  L6_134 = L5_133(L6_134)
  L3_131 = L6_134
  L2_130 = L5_133
  L5_133 = _UPVALUE0_
  L5_133 = L5_133.NIL
  if L3_131 == L5_133 then
    L5_133 = _UPVALUE3_
    L5_133 = L5_133.PPTP_CLIENT_INVALID_REMOTE_NETMASK
    return L5_133
  end
  L5_133 = _UPVALUE4_
  L5_133 = L5_133.vlanGet
  L6_134 = L4_132
  vlanId, vlanName, interRouting, vlanIP, vlanSubnet, dhcpType, dnsProxy, dhcpRelay, L5_133 = nil, nil, nil, nil, nil, nil, nil, nil, L5_133(L6_134)
  vlanId, vlanName, interRouting, vlanIP, vlanSubnet, dhcpType, dnsProxy, dhcpRelay, L6_134 = nil, nil, nil, nil, nil, nil, nil, nil, L5_133(L6_134)
  vlanCookie = L6_134
  L2_130 = L5_133
  L5_133 = _UPVALUE0_
  L5_133 = L5_133.SUCCESS
  if L2_130 ~= L5_133 then
    L5_133 = _UPVALUE3_
    L5_133 = L5_133.PPTP_CLIENT_VALIDATION_CHECK_FAILED
    return L5_133
  end
  L5_133 = vlanSubnet
  def_LAN_Subnet = L5_133
  L5_133 = _UPVALUE2_
  L5_133 = L5_133.ipv4DualMaskCheck
  L6_134 = vlanIP
  L5_133 = L5_133(L6_134, vlanSubnet, A0_128, L3_131)
  L2_130 = L5_133
  L5_133 = _UPVALUE0_
  L5_133 = L5_133.SUCCESS
  if L2_130 == L5_133 then
    L5_133 = _UPVALUE0_
    L5_133 = L5_133.LAN_VLAN_ALREADY_CONFIGURED
    return L5_133
  end
  L5_133 = _UPVALUE4_
  L5_133 = L5_133.vlanGetNext
  L6_134 = vlanCookie
  vlanId, vlanName, interRouting, vlanIP, vlanSubnet, dhcpType, dnsProxy, dhcpRelay, L5_133 = vlanSubnet, A0_128, L3_131, L5_133(L6_134)
  vlanId, vlanName, interRouting, vlanIP, vlanSubnet, dhcpType, dnsProxy, dhcpRelay, L6_134 = vlanSubnet, A0_128, L3_131, L5_133(L6_134)
  vlanCookie = L6_134
  L2_130 = L5_133
  while true do
    L5_133 = _UPVALUE0_
    L5_133 = L5_133.NEXT_ROWID_INVALID
    if L2_130 ~= L5_133 then
      L5_133 = _UPVALUE0_
      L5_133 = L5_133.SUCCESS
      if L2_130 ~= L5_133 then
        L5_133 = _UPVALUE3_
        L5_133 = L5_133.PPTP_CLIENT_VALIDATION_CHECK_FAILED
        return L5_133
      end
      L5_133 = _UPVALUE2_
      L5_133 = L5_133.ipv4DualMaskCheck
      L6_134 = vlanIP
      L5_133 = L5_133(L6_134, vlanSubnet, A0_128, L3_131)
      L2_130 = L5_133
      L5_133 = _UPVALUE0_
      L5_133 = L5_133.SUCCESS
      if L2_130 == L5_133 then
        L5_133 = _UPVALUE0_
        L5_133 = L5_133.LAN_VLAN_ALREADY_CONFIGURED
        return L5_133
      end
      L5_133 = _UPVALUE4_
      L5_133 = L5_133.vlanGetNext
      L6_134 = vlanCookie
      vlanId, vlanName, interRouting, vlanIP, vlanSubnet, dhcpType, dnsProxy, dhcpRelay, L5_133 = vlanSubnet, A0_128, L3_131, L5_133(L6_134)
      vlanId, vlanName, interRouting, vlanIP, vlanSubnet, dhcpType, dnsProxy, dhcpRelay, L6_134 = vlanSubnet, A0_128, L3_131, L5_133(L6_134)
      vlanCookie = L6_134
      L2_130 = L5_133
    end
  end
  L5_133 = db
  L5_133 = L5_133.getAttribute
  L6_134 = _UPVALUE5_
  L5_133 = L5_133(L6_134, _UPVALUE6_.dmz_interface, _UPVALUE7_, _UPVALUE6_.dmz_ip)
  L6_134 = db
  L6_134 = L6_134.getAttribute
  L6_134 = L6_134(_UPVALUE5_, _UPVALUE6_.dmz_interface, _UPVALUE7_, _UPVALUE6_.dmz_netmask)
  if L5_133 ~= _UPVALUE0_.NIL and L5_133 ~= _UPVALUE8_ and L6_134 ~= _UPVALUE0_.NIL and L6_134 ~= _UPVALUE8_ then
    L2_130 = _UPVALUE2_.ipv4DualMaskCheck(L5_133, L6_134, A0_128, L3_131)
    if L2_130 == _UPVALUE0_.SUCCESS then
      return _UPVALUE0_.DMZ_ALREADY_CONFIGURED
    end
  end
  result = _UPVALUE2_.checkWanSubnetRange(A0_128, L3_131)
  if result == _UPVALUE0_.SUCCESS then
    if UNIT_NAME ~= "DSR-150N" and UNIT_NAME ~= "DSR-150" and UNIT_NAME ~= "DSR-250N" and UNIT_NAME ~= "DSR-250" then
      return _UPVALUE0_.WAN_ALREADY_CONFIGURED
    else
      return _UPVALUE0_.WAN_ECONA_ALREADY_CONFIGURED
    end
  end
  return _UPVALUE0_.SUCCESS
end
function pptpVpnClientCreate(A0_135, A1_136, A2_137, A3_138, A4_139, A5_140, A6_141, A7_142)
  local L9_143, L10_144
  L9_143 = _UPVALUE0_
  L9_143 = L9_143.NOT_SUPPORTED
  L10_144 = 0
  return L9_143, L10_144, 0
end
function pptpVpnClientDelete(A0_145)
  local L2_146, L3_147
  L2_146 = _UPVALUE0_
  L2_146 = L2_146.NOT_SUPPORTED
  L3_147 = 0
  return L2_146, L3_147, 0
end
function activePptpVpnClientsGet()
  local L0_148, L1_149, L2_150, L3_151
  L0_148 = {}
  L1_149 = db
  L1_149 = L1_149.getRow
  L2_150 = _UPVALUE0_
  L3_151 = _UPVALUE1_
  L1_149 = L1_149(L2_150, L3_151, _UPVALUE2_)
  L0_148 = L1_149
  L1_149 = _UPVALUE3_
  L1_149 = L1_149.NIL
  if L0_148 == L1_149 then
    L1_149 = _UPVALUE3_
    L1_149 = L1_149.FAILURE
    return L1_149
  end
  L1_149 = _UPVALUE0_
  L2_150 = "."
  L3_151 = _UPVALUE4_
  L3_151 = L3_151.connectionStatus
  L1_149 = L1_149 .. L2_150 .. L3_151
  L1_149 = L0_148[L1_149]
  L2_150 = _UPVALUE0_
  L3_151 = "."
  L2_150 = L2_150 .. L3_151 .. _UPVALUE4_.actionStatus
  L2_150 = L0_148[L2_150]
  L3_151 = _UPVALUE0_
  L3_151 = L3_151 .. "." .. _UPVALUE4_.action
  L3_151 = L0_148[L3_151]
  return _UPVALUE3_.SUCCESS, 1, L1_149, L2_150, L3_151
end
function activePptpVpnClientsGetNext(A0_152)
  local L2_153, L3_154
  L2_153 = _UPVALUE0_
  L2_153 = L2_153.NOT_SUPPORTED
  L3_154 = 0
  return L2_153, L3_154, 0
end
function activePptpVpnClientsSet(A0_155, A1_156, A2_157, A3_158)
  local L5_159, L6_160
  L5_159 = _UPVALUE0_
  L5_159 = L5_159.NOT_SUPPORTED
  L6_160 = 0
  return L5_159, L6_160, 0
end
function activePptpVpnClientsCreate(A0_161, A1_162, A2_163)
  local L4_164, L5_165
  L4_164 = _UPVALUE0_
  L4_164 = L4_164.NOT_SUPPORTED
  L5_165 = 0
  return L4_164, L5_165, 0
end
function activePptpVpnClientsDelete(A0_166)
  local L2_167, L3_168
  L2_167 = _UPVALUE0_
  L2_167 = L2_167.NOT_SUPPORTED
  L3_168 = 0
  return L2_167, L3_168, 0
end
