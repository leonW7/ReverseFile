local L0_0
L0_0 = module
L0_0("com.teamf1.core.vpn.l2tpserver", package.seeall)
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
L0_0("teamf1lualib/l2tpd_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).feature = "Xl2tpdEnable"
;({}).feature6 = "Xl2tpd6Enable"
;({}).routingMode = "l2tpRoutingMode"
;({}).startIPAddress = "StartIPAddress"
;({}).endIPAddress = "EndIPAddress"
;({}).authenticationType = "AuthenticationType"
;({}).papEnable = "PapEnable"
;({}).chapEnable = "ChapEnable"
;({}).msChapEnable = "MSChapEnable"
;({}).msChapv2Enable = "MSChapv2Enable"
;({}).secretKeyEnable = "l2tpSecretKeyEnable"
;({}).secret = "secretKey"
;({}).userTimeOut = "UserTimeOut"
;({}).netbiosEnable = "netbiosEnable"
;({}).primaryWINSServerIP = "primWinsServer"
;({}).secondaryWINSServerIP = "secWinsServer"
;({}).userIpAddress = "RemoteIP"
;({}).userName = "userName"
;({}).IPAddress = "Xl2tpIP"
;({}).ipv6Prefix = "Xl2tpdIpv6Prefix"
;({}).wanRoutingMode = "Enable"
;({}).dmz_interface = "LogicalIfName"
;({}).dmz_ip = "StaticIp"
;({}).pptp_ip = "startIPAddress"
;({}).pptpdEnable = "pptpdEnable"
;({}).dmz_netmask = "NetMask"
;({}).openVpnMask = "OpenVpnNetmask"
;({}).ipsecVpnMask = "SubnetMask"
;({}).sslClientVpnMask = "255.255.255.0"
if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-1000N" or UNIT_NAME == "DSR-1000" then
elseif UNIT_NAME == "DSR-500AC" or UNIT_NAME == "DSR-500N" or UNIT_NAME == "DSR-500" then
elseif UNIT_NAME == "DSR-250N" or UNIT_NAME == "DSR-250" then
else
end
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
function routingModeGet()
  local L0_9
  L0_9 = db
  L0_9 = L0_9.getAttribute
  L0_9 = L0_9(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.routingMode)
  if L0_9 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_9
end
function routingModeGetNext(A0_10)
  local L2_11, L3_12
  L2_11 = _UPVALUE0_
  L2_11 = L2_11.NOT_SUPPORTED
  L3_12 = 0
  return L2_11, L3_12, 0
end
function routingModeSet(A0_13, A1_14)
  local L2_15, L3_16, L4_17
  L2_15 = db
  L2_15 = L2_15.getAttribute
  L3_16 = _UPVALUE0_
  L4_17 = _UPVALUE1_
  L2_15 = L2_15(L3_16, L4_17, _UPVALUE2_, _UPVALUE3_.feature)
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
  L3_16 = tonumber
  L4_17 = A1_14
  L3_16 = L3_16(L4_17)
  L4_17 = _UPVALUE5_
  L4_17 = L4_17.NIL
  if L3_16 == L4_17 then
    L4_17 = _UPVALUE5_
    L4_17 = L4_17.INVALID_ARGUMENT
    return L4_17
  end
  L4_17 = _UPVALUE6_
  if L3_16 ~= L4_17 then
    L4_17 = _UPVALUE7_
    if L3_16 ~= L4_17 then
      L4_17 = _UPVALUE5_
      L4_17 = L4_17.INVALID_ARGUMENT
      return L4_17
    end
  end
  L4_17 = nil
  L4_17 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.routingMode, A1_14)
  if L4_17 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_13
  end
  return _UPVALUE5_.SUCCESS, A0_13
end
function startIPAddressGet()
  local L0_18
  L0_18 = db
  L0_18 = L0_18.getAttribute
  L0_18 = L0_18(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.startIPAddress)
  if L0_18 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_18
end
function startIPAddressGetNext(A0_19)
  local L2_20, L3_21
  L2_20 = _UPVALUE0_
  L2_20 = L2_20.NOT_SUPPORTED
  L3_21 = 0
  return L2_20, L3_21, 0
end
function startIPAddressSet(A0_22, A1_23)
  local L2_24, L3_25
  L2_24 = db
  L2_24 = L2_24.getAttribute
  L3_25 = _UPVALUE0_
  L2_24 = L2_24(L3_25, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.feature)
  L3_25 = _UPVALUE4_
  if L2_24 ~= L3_25 then
    L3_25 = _UPVALUE5_
    L3_25 = L3_25.DEPENDENCY_NOT_MET
    return L3_25
  end
  L3_25 = _UPVALUE5_
  L3_25 = L3_25.NIL
  if A1_23 == L3_25 then
    L3_25 = _UPVALUE5_
    L3_25 = L3_25.INVALID_ARGUMENT
    return L3_25
  end
  L3_25 = _UPVALUE6_
  L3_25 = L3_25.ipAddressCheck
  L3_25 = L3_25(_UPVALUE7_, A1_23)
  valid = L3_25
  L3_25 = valid
  if L3_25 ~= _UPVALUE5_.SUCCESS then
    L3_25 = _UPVALUE5_
    L3_25 = L3_25.INVALID_ARGUMENT
    return L3_25
  end
  L3_25 = nil
  L3_25 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.startIPAddress, A1_23)
  if L3_25 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_22
  end
  return _UPVALUE5_.SUCCESS, A0_22
end
function endIPAddressGet()
  local L0_26
  L0_26 = db
  L0_26 = L0_26.getAttribute
  L0_26 = L0_26(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.endIPAddress)
  if L0_26 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_26
end
function endIPAddressGetNext(A0_27)
  local L2_28, L3_29
  L2_28 = _UPVALUE0_
  L2_28 = L2_28.NOT_SUPPORTED
  L3_29 = 0
  return L2_28, L3_29, 0
end
function endIPAddressSet(A0_30, A1_31)
  local L2_32, L3_33
  L2_32 = db
  L2_32 = L2_32.getAttribute
  L3_33 = _UPVALUE0_
  L2_32 = L2_32(L3_33, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.feature)
  L3_33 = _UPVALUE4_
  if L2_32 ~= L3_33 then
    L3_33 = _UPVALUE5_
    L3_33 = L3_33.DEPENDENCY_NOT_MET
    return L3_33
  end
  L3_33 = _UPVALUE5_
  L3_33 = L3_33.NIL
  if A1_31 == L3_33 then
    L3_33 = _UPVALUE5_
    L3_33 = L3_33.INVALID_ARGUMENT
    return L3_33
  end
  L3_33 = _UPVALUE6_
  L3_33 = L3_33.ipAddressCheck
  L3_33 = L3_33(_UPVALUE7_, A1_31)
  valid = L3_33
  L3_33 = valid
  if L3_33 ~= _UPVALUE5_.SUCCESS then
    L3_33 = _UPVALUE5_
    L3_33 = L3_33.INVALID_ARGUMENT
    return L3_33
  end
  L3_33 = nil
  L3_33 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.endIPAddress, A1_31)
  if L3_33 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_30
  end
  return _UPVALUE5_.SUCCESS, A0_30
end
function authenticationTypeGet()
  local L0_34
  L0_34 = db
  L0_34 = L0_34.getAttribute
  L0_34 = L0_34(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.authenticationType)
  if L0_34 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_34
end
function authenticationTypeGetNext(A0_35)
  local L2_36, L3_37
  L2_36 = _UPVALUE0_
  L2_36 = L2_36.NOT_SUPPORTED
  L3_37 = 0
  return L2_36, L3_37, 0
end
function authenticationTypeSet(A0_38, A1_39)
  local L2_40, L3_41
  L2_40 = db
  L2_40 = L2_40.getAttribute
  L3_41 = _UPVALUE0_
  L2_40 = L2_40(L3_41, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.feature)
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
  if A1_39 ~= L3_41 then
    L3_41 = _UPVALUE7_
    if A1_39 ~= L3_41 then
      L3_41 = _UPVALUE8_
      if A1_39 ~= L3_41 then
        L3_41 = _UPVALUE9_
        if A1_39 ~= L3_41 then
          L3_41 = _UPVALUE10_
          if A1_39 ~= L3_41 then
            L3_41 = _UPVALUE5_
            L3_41 = L3_41.INVALID_ARGUMENT
            return L3_41
          end
        end
      end
    end
  end
  L3_41 = nil
  L3_41 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.authenticationType, A1_39)
  if L3_41 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_38
  end
  return _UPVALUE5_.SUCCESS, A0_38
end
function ispapEnabled()
  local L0_42
  L0_42 = db
  L0_42 = L0_42.getAttribute
  L0_42 = L0_42(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.papEnable)
  if L0_42 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_42
end
function ispapEnabledNext(A0_43)
  local L2_44, L3_45
  L2_44 = _UPVALUE0_
  L2_44 = L2_44.NOT_SUPPORTED
  L3_45 = 0
  return L2_44, L3_45, 0
end
function papEnable(A0_46)
  local L1_47, L2_48
  L1_47 = db
  L1_47 = L1_47.getAttribute
  L2_48 = _UPVALUE0_
  L1_47 = L1_47(L2_48, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.feature)
  L2_48 = _UPVALUE4_
  if L1_47 ~= L2_48 then
    L2_48 = _UPVALUE5_
    L2_48 = L2_48.DEPENDENCY_NOT_MET
    return L2_48
  end
  L2_48 = nil
  L2_48 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.papEnable, _UPVALUE4_)
  if L2_48 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_46
  end
  return _UPVALUE5_.SUCCESS, A0_46
end
function papDisable(A0_49)
  local L1_50, L2_51
  L1_50 = db
  L1_50 = L1_50.getAttribute
  L2_51 = _UPVALUE0_
  L1_50 = L1_50(L2_51, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.feature)
  L2_51 = _UPVALUE4_
  if L1_50 ~= L2_51 then
    L2_51 = _UPVALUE5_
    L2_51 = L2_51.DEPENDENCY_NOT_MET
    return L2_51
  end
  L2_51 = nil
  L2_51 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.papEnable, _UPVALUE6_)
  if L2_51 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_49
  end
  return _UPVALUE5_.SUCCESS, A0_49
end
function ischapEnabled()
  local L0_52
  L0_52 = db
  L0_52 = L0_52.getAttribute
  L0_52 = L0_52(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.chapEnable)
  if L0_52 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_52
end
function ischapEnabledNext(A0_53)
  local L2_54, L3_55
  L2_54 = _UPVALUE0_
  L2_54 = L2_54.NOT_SUPPORTED
  L3_55 = 0
  return L2_54, L3_55, 0
end
function chapEnable(A0_56)
  local L1_57, L2_58
  L1_57 = db
  L1_57 = L1_57.getAttribute
  L2_58 = _UPVALUE0_
  L1_57 = L1_57(L2_58, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.feature)
  L2_58 = _UPVALUE4_
  if L1_57 ~= L2_58 then
    L2_58 = _UPVALUE5_
    L2_58 = L2_58.DEPENDENCY_NOT_MET
    return L2_58
  end
  L2_58 = nil
  L2_58 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.chapEnable, _UPVALUE4_)
  if L2_58 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_56
  end
  return _UPVALUE5_.SUCCESS, A0_56
end
function chapDisable(A0_59)
  local L1_60, L2_61
  L1_60 = db
  L1_60 = L1_60.getAttribute
  L2_61 = _UPVALUE0_
  L1_60 = L1_60(L2_61, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.feature)
  L2_61 = _UPVALUE4_
  if L1_60 ~= L2_61 then
    L2_61 = _UPVALUE5_
    L2_61 = L2_61.DEPENDENCY_NOT_MET
    return L2_61
  end
  L2_61 = nil
  L2_61 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.chapEnable, _UPVALUE6_)
  if L2_61 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_59
  end
  return _UPVALUE5_.SUCCESS, A0_59
end
function ismsChapEnabled()
  local L0_62
  L0_62 = db
  L0_62 = L0_62.getAttribute
  L0_62 = L0_62(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.msChapEnable)
  if L0_62 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_62
end
function ismsChapEnabledNext(A0_63)
  local L2_64, L3_65
  L2_64 = _UPVALUE0_
  L2_64 = L2_64.NOT_SUPPORTED
  L3_65 = 0
  return L2_64, L3_65, 0
end
function msChapEnable(A0_66)
  local L1_67, L2_68
  L1_67 = db
  L1_67 = L1_67.getAttribute
  L2_68 = _UPVALUE0_
  L1_67 = L1_67(L2_68, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.feature)
  L2_68 = _UPVALUE4_
  if L1_67 ~= L2_68 then
    L2_68 = _UPVALUE5_
    L2_68 = L2_68.DEPENDENCY_NOT_MET
    return L2_68
  end
  L2_68 = nil
  L2_68 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.msChapEnable, _UPVALUE4_)
  if L2_68 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_66
  end
  return _UPVALUE5_.SUCCESS, A0_66
end
function msChapDisable(A0_69)
  local L1_70, L2_71
  L1_70 = db
  L1_70 = L1_70.getAttribute
  L2_71 = _UPVALUE0_
  L1_70 = L1_70(L2_71, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.feature)
  L2_71 = _UPVALUE4_
  if L1_70 ~= L2_71 then
    L2_71 = _UPVALUE5_
    L2_71 = L2_71.DEPENDENCY_NOT_MET
    return L2_71
  end
  L2_71 = nil
  L2_71 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.msChapEnable, _UPVALUE6_)
  if L2_71 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_69
  end
  return _UPVALUE5_.SUCCESS, A0_69
end
function ismsChapv2Enabled()
  local L0_72
  L0_72 = db
  L0_72 = L0_72.getAttribute
  L0_72 = L0_72(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.msChapv2Enable)
  if L0_72 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_72
end
function ismsChapv2EnabledNext(A0_73)
  local L2_74, L3_75
  L2_74 = _UPVALUE0_
  L2_74 = L2_74.NOT_SUPPORTED
  L3_75 = 0
  return L2_74, L3_75, 0
end
function msChapv2Enable(A0_76)
  local L1_77, L2_78
  L1_77 = db
  L1_77 = L1_77.getAttribute
  L2_78 = _UPVALUE0_
  L1_77 = L1_77(L2_78, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.feature)
  L2_78 = _UPVALUE4_
  if L1_77 ~= L2_78 then
    L2_78 = _UPVALUE5_
    L2_78 = L2_78.DEPENDENCY_NOT_MET
    return L2_78
  end
  L2_78 = nil
  L2_78 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.msChapv2Enable, _UPVALUE4_)
  if L2_78 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_76
  end
  return _UPVALUE5_.SUCCESS, A0_76
end
function msChapv2Disable(A0_79)
  local L1_80, L2_81
  L1_80 = db
  L1_80 = L1_80.getAttribute
  L2_81 = _UPVALUE0_
  L1_80 = L1_80(L2_81, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.feature)
  L2_81 = _UPVALUE4_
  if L1_80 ~= L2_81 then
    L2_81 = _UPVALUE5_
    L2_81 = L2_81.DEPENDENCY_NOT_MET
    return L2_81
  end
  L2_81 = nil
  L2_81 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.msChapv2Enable, _UPVALUE6_)
  if L2_81 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_79
  end
  return _UPVALUE5_.SUCCESS, A0_79
end
function issecretKeyEnabled()
  local L0_82
  L0_82 = db
  L0_82 = L0_82.getAttribute
  L0_82 = L0_82(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.secretKeyEnable)
  if L0_82 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_82
end
function issecretKeyEnabledNext(A0_83)
  local L2_84, L3_85
  L2_84 = _UPVALUE0_
  L2_84 = L2_84.NOT_SUPPORTED
  L3_85 = 0
  return L2_84, L3_85, 0
end
function secretKeyEnable(A0_86)
  local L1_87, L2_88, L3_89
  L1_87 = {}
  L2_88 = db
  L2_88 = L2_88.getRow
  L3_89 = _UPVALUE0_
  L2_88 = L2_88(L3_89, _UPVALUE1_, _UPVALUE2_)
  L1_87 = L2_88
  L2_88 = _UPVALUE0_
  L3_89 = "."
  L2_88 = L2_88 .. L3_89 .. _UPVALUE3_.feature
  L2_88 = L1_87[L2_88]
  L3_89 = _UPVALUE4_
  if L2_88 ~= L3_89 then
    L3_89 = _UPVALUE5_
    L3_89 = L3_89.DEPENDENCY_NOT_MET
    return L3_89
  end
  L3_89 = nil
  L3_89 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.secretKeyEnable, _UPVALUE4_)
  if L3_89 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_86
  end
  return _UPVALUE5_.SUCCESS, A0_86
end
function secretKeyDisable(A0_90)
  local L1_91, L2_92, L3_93
  L1_91 = {}
  L2_92 = db
  L2_92 = L2_92.getRow
  L3_93 = _UPVALUE0_
  L2_92 = L2_92(L3_93, _UPVALUE1_, _UPVALUE2_)
  L1_91 = L2_92
  L2_92 = _UPVALUE0_
  L3_93 = "."
  L2_92 = L2_92 .. L3_93 .. _UPVALUE3_.feature
  L2_92 = L1_91[L2_92]
  L3_93 = _UPVALUE4_
  if L2_92 ~= L3_93 then
    L3_93 = _UPVALUE5_
    L3_93 = L3_93.DEPENDENCY_NOT_MET
    return L3_93
  end
  L3_93 = nil
  L3_93 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.secretKeyEnable, _UPVALUE6_)
  if L3_93 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_90
  end
  return _UPVALUE5_.SUCCESS, A0_90
end
function secretGet()
  local L0_94
  L0_94 = db
  L0_94 = L0_94.getAttribute
  L0_94 = L0_94(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.secret)
  if L0_94 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_94
end
function secretGetNext(A0_95)
  local L2_96, L3_97
  L2_96 = _UPVALUE0_
  L2_96 = L2_96.NOT_SUPPORTED
  L3_97 = 0
  return L2_96, L3_97, 0
end
function secretSet(A0_98, A1_99)
  local L2_100, L3_101, L4_102, L5_103
  L2_100 = {}
  L3_101 = db
  L3_101 = L3_101.getRow
  L4_102 = _UPVALUE0_
  L5_103 = _UPVALUE1_
  L3_101 = L3_101(L4_102, L5_103, _UPVALUE2_)
  L2_100 = L3_101
  L3_101 = _UPVALUE0_
  L4_102 = "."
  L5_103 = _UPVALUE3_
  L5_103 = L5_103.feature
  L3_101 = L3_101 .. L4_102 .. L5_103
  L3_101 = L2_100[L3_101]
  L4_102 = _UPVALUE0_
  L5_103 = "."
  L4_102 = L4_102 .. L5_103 .. _UPVALUE3_.secretKeyEnable
  L4_102 = L2_100[L4_102]
  L5_103 = _UPVALUE4_
  if L3_101 ~= L5_103 then
    L5_103 = _UPVALUE5_
    L5_103 = L5_103.DEPENDENCY_NOT_MET
    return L5_103
  end
  L5_103 = _UPVALUE4_
  if L4_102 ~= L5_103 then
    L5_103 = _UPVALUE5_
    L5_103 = L5_103.DEPENDENCY_NOT_MET
    return L5_103
  end
  L5_103 = _UPVALUE5_
  L5_103 = L5_103.NIL
  if A1_99 == L5_103 then
    L5_103 = _UPVALUE5_
    L5_103 = L5_103.INVALID_ARGUMENT
    return L5_103
  end
  L5_103 = _UPVALUE6_
  L5_103 = L5_103.stringLengthCheck
  L5_103 = L5_103(_UPVALUE7_, _UPVALUE8_, A1_99)
  if L5_103 ~= _UPVALUE5_.SUCCESS then
    L5_103 = _UPVALUE5_
    L5_103 = L5_103.INVALID_ARGUMENT
    return L5_103
  end
  L5_103 = nil
  L5_103 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.secret, A1_99)
  if L5_103 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_98
  end
  return _UPVALUE5_.SUCCESS, A0_98
end
function userTimeOutGet()
  local L0_104
  L0_104 = db
  L0_104 = L0_104.getAttribute
  L0_104 = L0_104(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.userTimeOut)
  if L0_104 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_104
end
function userTimeOutGetNext(A0_105)
  local L2_106, L3_107
  L2_106 = _UPVALUE0_
  L2_106 = L2_106.NOT_SUPPORTED
  L3_107 = 0
  return L2_106, L3_107, 0
end
function userTimeOutSet(A0_108, A1_109)
  local L2_110, L3_111, L4_112
  L2_110 = db
  L2_110 = L2_110.getAttribute
  L3_111 = _UPVALUE0_
  L4_112 = _UPVALUE1_
  L2_110 = L2_110(L3_111, L4_112, _UPVALUE2_, _UPVALUE3_.feature)
  L3_111 = _UPVALUE4_
  if L2_110 ~= L3_111 then
    L3_111 = _UPVALUE5_
    L3_111 = L3_111.DEPENDENCY_NOT_MET
    return L3_111
  end
  L3_111 = _UPVALUE5_
  L3_111 = L3_111.NIL
  if A1_109 == L3_111 then
    L3_111 = _UPVALUE5_
    L3_111 = L3_111.INVALID_ARGUMENT
    return L3_111
  end
  L3_111 = tonumber
  L4_112 = A1_109
  L3_111 = L3_111(L4_112)
  L4_112 = _UPVALUE5_
  L4_112 = L4_112.NIL
  if L3_111 == L4_112 then
    L4_112 = _UPVALUE5_
    L4_112 = L4_112.INVALID_ARGUMENT
    return L4_112
  end
  L4_112 = _UPVALUE6_
  if not (L3_111 < L4_112) then
    L4_112 = _UPVALUE7_
  elseif L3_111 > L4_112 then
    L4_112 = _UPVALUE5_
    L4_112 = L4_112.INVALID_ARGUMENT
    return L4_112
  end
  L4_112 = nil
  L4_112 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.userTimeOut, A1_109)
  if L4_112 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_108
  end
  return _UPVALUE5_.SUCCESS, A0_108
end
function isnetbiosEnabled()
  local L0_113
  L0_113 = db
  L0_113 = L0_113.getAttribute
  L0_113 = L0_113(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.netbiosEnable)
  if L0_113 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_113
end
function isnetbiosEnabledNext(A0_114)
  local L2_115, L3_116
  L2_115 = _UPVALUE0_
  L2_115 = L2_115.NOT_SUPPORTED
  L3_116 = 0
  return L2_115, L3_116, 0
end
function netbiosEnable(A0_117)
  local L1_118, L2_119
  L1_118 = db
  L1_118 = L1_118.getAttribute
  L2_119 = _UPVALUE0_
  L1_118 = L1_118(L2_119, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.feature)
  L2_119 = _UPVALUE4_
  if L1_118 ~= L2_119 then
    L2_119 = _UPVALUE5_
    L2_119 = L2_119.DEPENDENCY_NOT_MET
    return L2_119
  end
  L2_119 = nil
  L2_119 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.netbiosEnable, _UPVALUE4_)
  if L2_119 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_117
  end
  return _UPVALUE5_.SUCCESS, A0_117
end
function netbiosDisable(A0_120)
  local L1_121, L2_122
  L1_121 = db
  L1_121 = L1_121.getAttribute
  L2_122 = _UPVALUE0_
  L1_121 = L1_121(L2_122, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.feature)
  L2_122 = _UPVALUE4_
  if L1_121 ~= L2_122 then
    L2_122 = _UPVALUE5_
    L2_122 = L2_122.DEPENDENCY_NOT_MET
    return L2_122
  end
  L2_122 = nil
  L2_122 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.netbiosEnable, _UPVALUE6_)
  if L2_122 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_120
  end
  return _UPVALUE5_.SUCCESS, A0_120
end
function primaryWINSServerIPGet()
  local L0_123
  L0_123 = db
  L0_123 = L0_123.getAttribute
  L0_123 = L0_123(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.primaryWINSServerIP)
  if L0_123 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_123
end
function primaryWINSServerIPGetNext(A0_124)
  local L2_125, L3_126
  L2_125 = _UPVALUE0_
  L2_125 = L2_125.NOT_SUPPORTED
  L3_126 = 0
  return L2_125, L3_126, 0
end
function primaryWINSServerIPSet(A0_127, A1_128)
  local L2_129, L3_130, L4_131, L5_132
  L2_129 = {}
  L3_130 = db
  L3_130 = L3_130.getRow
  L4_131 = _UPVALUE0_
  L5_132 = _UPVALUE1_
  L3_130 = L3_130(L4_131, L5_132, _UPVALUE2_)
  L2_129 = L3_130
  L3_130 = _UPVALUE0_
  L4_131 = "."
  L5_132 = _UPVALUE3_
  L5_132 = L5_132.feature
  L3_130 = L3_130 .. L4_131 .. L5_132
  L3_130 = L2_129[L3_130]
  L4_131 = _UPVALUE0_
  L5_132 = "."
  L4_131 = L4_131 .. L5_132 .. _UPVALUE3_.netbiosEnable
  L4_131 = L2_129[L4_131]
  L5_132 = _UPVALUE4_
  if L3_130 ~= L5_132 then
    L5_132 = _UPVALUE5_
    L5_132 = L5_132.DEPENDENCY_NOT_MET
    return L5_132
  end
  L5_132 = _UPVALUE4_
  if L4_131 ~= L5_132 then
    L5_132 = _UPVALUE5_
    L5_132 = L5_132.DEPENDENCY_NOT_MET
    return L5_132
  end
  L5_132 = _UPVALUE5_
  L5_132 = L5_132.NIL
  if A1_128 == L5_132 then
    L5_132 = _UPVALUE5_
    L5_132 = L5_132.INVALID_ARGUMENT
    return L5_132
  end
  L5_132 = _UPVALUE6_
  L5_132 = L5_132.ipAddressCheck
  L5_132 = L5_132(_UPVALUE7_, A1_128)
  valid = L5_132
  L5_132 = valid
  if L5_132 ~= _UPVALUE5_.SUCCESS then
    L5_132 = _UPVALUE5_
    L5_132 = L5_132.INVALID_ARGUMENT
    return L5_132
  end
  L5_132 = nil
  L5_132 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.primaryWINSServerIP, A1_128)
  if L5_132 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_127
  end
  return _UPVALUE5_.SUCCESS, A0_127
end
function secondaryWINSServerIPGet()
  local L0_133
  L0_133 = db
  L0_133 = L0_133.getAttribute
  L0_133 = L0_133(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.secondaryWINSServerIP)
  if L0_133 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_133
end
function secondaryWINSServerIPGetNext(A0_134)
  local L2_135, L3_136
  L2_135 = _UPVALUE0_
  L2_135 = L2_135.NOT_SUPPORTED
  L3_136 = 0
  return L2_135, L3_136, 0
end
function secondaryWINSServerIPSet(A0_137, A1_138)
  local L2_139, L3_140, L4_141, L5_142
  L2_139 = {}
  L3_140 = db
  L3_140 = L3_140.getRow
  L4_141 = _UPVALUE0_
  L5_142 = _UPVALUE1_
  L3_140 = L3_140(L4_141, L5_142, _UPVALUE2_)
  L2_139 = L3_140
  L3_140 = _UPVALUE0_
  L4_141 = "."
  L5_142 = _UPVALUE3_
  L5_142 = L5_142.feature
  L3_140 = L3_140 .. L4_141 .. L5_142
  L3_140 = L2_139[L3_140]
  L4_141 = _UPVALUE0_
  L5_142 = "."
  L4_141 = L4_141 .. L5_142 .. _UPVALUE3_.netbiosEnable
  L4_141 = L2_139[L4_141]
  L5_142 = _UPVALUE4_
  if L3_140 ~= L5_142 then
    L5_142 = _UPVALUE5_
    L5_142 = L5_142.DEPENDENCY_NOT_MET
    return L5_142
  end
  L5_142 = _UPVALUE4_
  if L4_141 ~= L5_142 then
    L5_142 = _UPVALUE5_
    L5_142 = L5_142.DEPENDENCY_NOT_MET
    return L5_142
  end
  L5_142 = _UPVALUE5_
  L5_142 = L5_142.NIL
  if A1_138 == L5_142 then
    L5_142 = _UPVALUE5_
    L5_142 = L5_142.INVALID_ARGUMENT
    return L5_142
  end
  L5_142 = _UPVALUE6_
  L5_142 = L5_142.ipAddressCheck
  L5_142 = L5_142(_UPVALUE7_, A1_138)
  valid = L5_142
  L5_142 = valid
  if L5_142 ~= _UPVALUE5_.SUCCESS then
    L5_142 = _UPVALUE5_
    L5_142 = L5_142.INVALID_ARGUMENT
    return L5_142
  end
  L5_142 = nil
  L5_142 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.secondaryWINSServerIP, A1_138)
  if L5_142 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_137
  end
  return _UPVALUE5_.SUCCESS, A0_137
end
function userIpAddressGet()
  local L0_143, L1_144
  L0_143 = db
  L0_143 = L0_143.getNextRowId
  L1_144 = _UPVALUE0_
  L0_143 = L0_143(L1_144, _UPVALUE1_)
  L1_144 = _UPVALUE2_
  L1_144 = L1_144.NIL
  if L0_143 == L1_144 then
    L1_144 = _UPVALUE2_
    L1_144 = L1_144.EXIST
    return L1_144
  end
  L1_144 = db
  L1_144 = L1_144.getAttribute
  L1_144 = L1_144(_UPVALUE1_, _UPVALUE3_, L0_143, _UPVALUE4_.userIpAddress)
  if L1_144 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_143, L1_144
end
function userIpAddressGetNext(A0_145)
  local L1_146, L2_147
  L1_146 = _UPVALUE0_
  L1_146 = L1_146.NIL
  if A0_145 == L1_146 then
    L1_146 = _UPVALUE0_
    L1_146 = L1_146.INVALID_ARGUMENT
    return L1_146
  end
  L1_146 = tonumber
  L2_147 = A0_145
  L1_146 = L1_146(L2_147)
  L2_147 = _UPVALUE0_
  L2_147 = L2_147.NIL
  if L1_146 == L2_147 then
    L1_146 = _UPVALUE0_
    L1_146 = L1_146.INVALID_ARGUMENT
    return L1_146
  end
  L1_146 = db
  L1_146 = L1_146.existsRow
  L2_147 = _UPVALUE1_
  L1_146 = L1_146(L2_147, _UPVALUE2_, A0_145)
  L2_147 = _UPVALUE0_
  L2_147 = L2_147.FALSE
  if L1_146 == L2_147 then
    L1_146 = _UPVALUE0_
    L1_146 = L1_146.EXIST
    return L1_146
  end
  L1_146 = nil
  L2_147 = db
  L2_147 = L2_147.getNextRowId
  L2_147 = L2_147(A0_145, _UPVALUE1_)
  L1_146 = L2_147
  L2_147 = _UPVALUE0_
  L2_147 = L2_147.NIL
  if L1_146 == L2_147 then
    L2_147 = _UPVALUE0_
    L2_147 = L2_147.EXIST
    return L2_147
  end
  L2_147 = db
  L2_147 = L2_147.getAttribute
  L2_147 = L2_147(_UPVALUE1_, _UPVALUE2_, L1_146, _UPVALUE3_.userIpAddress)
  if L2_147 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_146
  end
  return _UPVALUE0_.SUCCESS, L1_146, L2_147
end
function userIpAddressSet(A0_148, A1_149)
  local L3_150, L4_151
  L3_150 = _UPVALUE0_
  L3_150 = L3_150.NOT_SUPPORTED
  L4_151 = 0
  return L3_150, L4_151, 0
end
function userIpAddressDelete(A0_152, A1_153)
  local L3_154, L4_155
  L3_154 = _UPVALUE0_
  L3_154 = L3_154.NOT_SUPPORTED
  L4_155 = 0
  return L3_154, L4_155, 0
end
function userNameGet()
  local L0_156, L1_157
  L0_156 = db
  L0_156 = L0_156.getNextRowId
  L1_157 = _UPVALUE0_
  L0_156 = L0_156(L1_157, _UPVALUE1_)
  L1_157 = _UPVALUE2_
  L1_157 = L1_157.NIL
  if L0_156 == L1_157 then
    L1_157 = _UPVALUE2_
    L1_157 = L1_157.EXIST
    return L1_157
  end
  L1_157 = db
  L1_157 = L1_157.getAttribute
  L1_157 = L1_157(_UPVALUE1_, _UPVALUE3_, L0_156, _UPVALUE4_.userName)
  if L1_157 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_156, L1_157
end
function userNameGetNext(A0_158)
  local L1_159, L2_160
  L1_159 = _UPVALUE0_
  L1_159 = L1_159.NIL
  if A0_158 == L1_159 then
    L1_159 = _UPVALUE0_
    L1_159 = L1_159.INVALID_ARGUMENT
    return L1_159
  end
  L1_159 = tonumber
  L2_160 = A0_158
  L1_159 = L1_159(L2_160)
  L2_160 = _UPVALUE0_
  L2_160 = L2_160.NIL
  if L1_159 == L2_160 then
    L1_159 = _UPVALUE0_
    L1_159 = L1_159.INVALID_ARGUMENT
    return L1_159
  end
  L1_159 = db
  L1_159 = L1_159.existsRow
  L2_160 = _UPVALUE1_
  L1_159 = L1_159(L2_160, _UPVALUE2_, A0_158)
  L2_160 = _UPVALUE0_
  L2_160 = L2_160.FALSE
  if L1_159 == L2_160 then
    L1_159 = _UPVALUE0_
    L1_159 = L1_159.EXIST
    return L1_159
  end
  L1_159 = nil
  L2_160 = db
  L2_160 = L2_160.getNextRowId
  L2_160 = L2_160(A0_158, _UPVALUE1_)
  L1_159 = L2_160
  L2_160 = _UPVALUE0_
  L2_160 = L2_160.NIL
  if L1_159 == L2_160 then
    L2_160 = _UPVALUE0_
    L2_160 = L2_160.EXIST
    return L2_160
  end
  L2_160 = db
  L2_160 = L2_160.getAttribute
  L2_160 = L2_160(_UPVALUE1_, _UPVALUE2_, L1_159, _UPVALUE3_.userName)
  if L2_160 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_159
  end
  return _UPVALUE0_.SUCCESS, L1_159, L2_160
end
function userNameSet(A0_161, A1_162)
  local L3_163, L4_164
  L3_163 = _UPVALUE0_
  L3_163 = L3_163.NOT_SUPPORTED
  L4_164 = 0
  return L3_163, L4_164, 0
end
function IPAddressGet()
  local L0_165, L1_166
  L0_165 = db
  L0_165 = L0_165.getNextRowId
  L1_166 = _UPVALUE0_
  L0_165 = L0_165(L1_166, _UPVALUE1_)
  L1_166 = _UPVALUE2_
  L1_166 = L1_166.NIL
  if L0_165 == L1_166 then
    L1_166 = _UPVALUE2_
    L1_166 = L1_166.EXIST
    return L1_166
  end
  L1_166 = db
  L1_166 = L1_166.getAttribute
  L1_166 = L1_166(_UPVALUE1_, _UPVALUE3_, L0_165, _UPVALUE4_.IPAddress)
  if L1_166 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_165, L1_166
end
function IPAddressGetNext(A0_167)
  local L1_168, L2_169
  L1_168 = _UPVALUE0_
  L1_168 = L1_168.NIL
  if A0_167 == L1_168 then
    L1_168 = _UPVALUE0_
    L1_168 = L1_168.INVALID_ARGUMENT
    return L1_168
  end
  L1_168 = tonumber
  L2_169 = A0_167
  L1_168 = L1_168(L2_169)
  L2_169 = _UPVALUE0_
  L2_169 = L2_169.NIL
  if L1_168 == L2_169 then
    L1_168 = _UPVALUE0_
    L1_168 = L1_168.INVALID_ARGUMENT
    return L1_168
  end
  L1_168 = db
  L1_168 = L1_168.existsRow
  L2_169 = _UPVALUE1_
  L1_168 = L1_168(L2_169, _UPVALUE2_, A0_167)
  L2_169 = _UPVALUE0_
  L2_169 = L2_169.FALSE
  if L1_168 == L2_169 then
    L1_168 = _UPVALUE0_
    L1_168 = L1_168.EXIST
    return L1_168
  end
  L1_168 = nil
  L2_169 = db
  L2_169 = L2_169.getNextRowId
  L2_169 = L2_169(A0_167, _UPVALUE1_)
  L1_168 = L2_169
  L2_169 = _UPVALUE0_
  L2_169 = L2_169.NIL
  if L1_168 == L2_169 then
    L2_169 = _UPVALUE0_
    L2_169 = L2_169.EXIST
    return L2_169
  end
  L2_169 = db
  L2_169 = L2_169.getAttribute
  L2_169 = L2_169(_UPVALUE1_, _UPVALUE2_, L1_168, _UPVALUE3_.IPAddress)
  if L2_169 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_168
  end
  return _UPVALUE0_.SUCCESS, L1_168, L2_169
end
function IPAddressSet(A0_170, A1_171)
  local L3_172, L4_173
  L3_172 = _UPVALUE0_
  L3_172 = L3_172.NOT_SUPPORTED
  L4_173 = 0
  return L3_172, L4_173, 0
end
function l2tpServerConfigGet()
  local L0_174, L1_175, L2_176, L3_177, L4_178, L5_179, L6_180, L7_181, L8_182, L9_183, L10_184, L11_185, L12_186, L13_187, L14_188
  L0_174 = {}
  L1_175 = db
  L1_175 = L1_175.getRow
  L2_176 = _UPVALUE0_
  L3_177 = _UPVALUE1_
  L4_178 = _UPVALUE2_
  L1_175 = L1_175(L2_176, L3_177, L4_178)
  L0_174 = L1_175
  L1_175 = db
  L1_175 = L1_175.getAttribute
  L2_176 = _UPVALUE3_
  L3_177 = _UPVALUE1_
  L4_178 = _UPVALUE2_
  L5_179 = _UPVALUE4_
  L5_179 = L5_179.wanRoutingMode
  L1_175 = L1_175(L2_176, L3_177, L4_178, L5_179)
  L2_176 = _UPVALUE5_
  L2_176 = L2_176.NIL
  if L0_174 ~= L2_176 then
    L2_176 = _UPVALUE5_
    L2_176 = L2_176.NIL
  elseif L1_175 == L2_176 then
    L2_176 = _UPVALUE5_
    L2_176 = L2_176.FAILURE
    return L2_176
  end
  L2_176 = _UPVALUE0_
  L3_177 = "."
  L4_178 = _UPVALUE4_
  L4_178 = L4_178.feature
  L2_176 = L2_176 .. L3_177 .. L4_178
  L2_176 = L0_174[L2_176]
  L3_177 = _UPVALUE0_
  L4_178 = "."
  L5_179 = _UPVALUE4_
  L5_179 = L5_179.feature6
  L3_177 = L3_177 .. L4_178 .. L5_179
  L3_177 = L0_174[L3_177]
  L4_178 = _UPVALUE0_
  L5_179 = "."
  L6_180 = _UPVALUE4_
  L6_180 = L6_180.routingMode
  L4_178 = L4_178 .. L5_179 .. L6_180
  L4_178 = L0_174[L4_178]
  L5_179 = _UPVALUE0_
  L6_180 = "."
  L7_181 = _UPVALUE4_
  L7_181 = L7_181.startIPAddress
  L5_179 = L5_179 .. L6_180 .. L7_181
  L5_179 = L0_174[L5_179]
  L6_180 = _UPVALUE0_
  L7_181 = "."
  L8_182 = _UPVALUE4_
  L8_182 = L8_182.endIPAddress
  L6_180 = L6_180 .. L7_181 .. L8_182
  L6_180 = L0_174[L6_180]
  L7_181 = _UPVALUE0_
  L8_182 = "."
  L9_183 = _UPVALUE4_
  L9_183 = L9_183.papEnable
  L7_181 = L7_181 .. L8_182 .. L9_183
  L7_181 = L0_174[L7_181]
  L8_182 = _UPVALUE0_
  L9_183 = "."
  L10_184 = _UPVALUE4_
  L10_184 = L10_184.chapEnable
  L8_182 = L8_182 .. L9_183 .. L10_184
  L8_182 = L0_174[L8_182]
  L9_183 = _UPVALUE0_
  L10_184 = "."
  L11_185 = _UPVALUE4_
  L11_185 = L11_185.msChapEnable
  L9_183 = L9_183 .. L10_184 .. L11_185
  L9_183 = L0_174[L9_183]
  L10_184 = _UPVALUE0_
  L11_185 = "."
  L12_186 = _UPVALUE4_
  L12_186 = L12_186.msChapv2Enable
  L10_184 = L10_184 .. L11_185 .. L12_186
  L10_184 = L0_174[L10_184]
  L11_185 = _UPVALUE0_
  L12_186 = "."
  L13_187 = _UPVALUE4_
  L13_187 = L13_187.secretKeyEnable
  L11_185 = L11_185 .. L12_186 .. L13_187
  L11_185 = L0_174[L11_185]
  L12_186 = _UPVALUE0_
  L13_187 = "."
  L14_188 = _UPVALUE4_
  L14_188 = L14_188.secret
  L12_186 = L12_186 .. L13_187 .. L14_188
  L12_186 = L0_174[L12_186]
  L13_187 = _UPVALUE0_
  L14_188 = "."
  L13_187 = L13_187 .. L14_188 .. _UPVALUE4_.userTimeOut
  L13_187 = L0_174[L13_187]
  L14_188 = _UPVALUE0_
  L14_188 = L14_188 .. "." .. _UPVALUE4_.authenticationType
  L14_188 = L0_174[L14_188]
  if L2_176 == "1" then
    L2_176 = "1"
  elseif L3_177 == "1" then
    L2_176 = "2"
    prefixSplit = util.split(L0_174[_UPVALUE0_ .. "." .. _UPVALUE4_.ipv6Prefix], "/")
    prefix = prefixSplit[1]
    prefixLength = prefixSplit[2]
  else
    L2_176 = "3"
  end
  return _UPVALUE5_.SUCCESS, 1, L2_176, L4_178, L5_179, L6_180, L7_181, L8_182, L9_183, L10_184, L11_185, L12_186, L13_187, L1_175, prefix, prefixLength, L14_188
end
function l2tpServerConfigGetNext(A0_189)
  local L2_190, L3_191
  L2_190 = _UPVALUE0_
  L2_190 = L2_190.NOT_SUPPORTED
  L3_191 = 0
  return L2_190, L3_191, 0
end
function l2tpServerConfigSet(A0_192, A1_193, A2_194, A3_195, A4_196, A5_197, A6_198, A7_199, A8_200, A9_201, A10_202, A11_203, A12_204, A13_205, A14_206)
  local L15_207, L16_208
  L15_207 = {}
  L16_208 = _UPVALUE0_
  L16_208 = L16_208.NIL
  if A1_193 == L16_208 then
    L16_208 = _UPVALUE0_
    L16_208 = L16_208.INVALID_ARGUMENT
    return L16_208
  end
  if A1_193 == "1" then
    L16_208 = _UPVALUE1_
    L16_208 = L16_208 .. "." .. _UPVALUE2_.feature
    L15_207[L16_208] = 1
    L16_208 = _UPVALUE1_
    L16_208 = L16_208 .. "." .. _UPVALUE2_.feature6
    L15_207[L16_208] = 0
  elseif A1_193 == "2" then
    L16_208 = _UPVALUE1_
    L16_208 = L16_208 .. "." .. _UPVALUE2_.feature6
    L15_207[L16_208] = 1
    L16_208 = _UPVALUE1_
    L16_208 = L16_208 .. "." .. _UPVALUE2_.feature
    L15_207[L16_208] = 0
  else
    L16_208 = _UPVALUE1_
    L16_208 = L16_208 .. "." .. _UPVALUE2_.feature
    L15_207[L16_208] = 0
    L16_208 = _UPVALUE1_
    L16_208 = L16_208 .. "." .. _UPVALUE2_.feature6
    L15_207[L16_208] = 0
  end
  if A1_193 == "1" or A1_193 == "2" then
    L16_208 = _UPVALUE0_
    L16_208 = L16_208.NIL
    if A2_194 ~= L16_208 then
      L16_208 = tonumber
      L16_208 = L16_208(A2_194)
      if L16_208 == _UPVALUE0_.NIL then
        return _UPVALUE0_.INVALID_ARGUMENT
      end
      if L16_208 ~= _UPVALUE3_ and L16_208 ~= _UPVALUE4_ then
        return _UPVALUE0_.INVALID_ARGUMENT
      end
    else
      L16_208 = _UPVALUE0_
      L16_208 = L16_208.NIL
      if A2_194 == L16_208 then
        A2_194 = _UPVALUE3_
      end
    end
    L16_208 = _UPVALUE1_
    L16_208 = L16_208 .. "." .. _UPVALUE2_.routingMode
    L15_207[L16_208] = A2_194
    L16_208 = _UPVALUE0_
    L16_208 = L16_208.NIL
    if A3_195 == L16_208 then
      L16_208 = _UPVALUE0_
      L16_208 = L16_208.INVALID_ARGUMENT
      return L16_208
    end
    L16_208 = _UPVALUE5_
    L16_208 = L16_208.ipAddressCheck
    L16_208 = L16_208(_UPVALUE6_, A3_195)
    valid = L16_208
    L16_208 = valid
    if L16_208 ~= _UPVALUE0_.SUCCESS then
      L16_208 = _UPVALUE7_
      L16_208 = L16_208.L2TP_SERVER_INVALID_START_IP
      return L16_208
    end
    L16_208 = _UPVALUE0_
    L16_208 = L16_208.NIL
    if A4_196 == L16_208 then
      L16_208 = _UPVALUE0_
      L16_208 = L16_208.INVALID_ARGUMENT
      return L16_208
    end
    L16_208 = _UPVALUE5_
    L16_208 = L16_208.ipAddressCheck
    L16_208 = L16_208(_UPVALUE6_, A4_196)
    valid = L16_208
    L16_208 = valid
    if L16_208 ~= _UPVALUE0_.SUCCESS then
      L16_208 = _UPVALUE7_
      L16_208 = L16_208.L2TP_SERVER_INVALID_END_IP
      return L16_208
    end
    L16_208 = subnetCheckValidation
    L16_208 = L16_208(A3_195, A4_196)
    valid = L16_208
    L16_208 = valid
    if L16_208 ~= _UPVALUE0_.SUCCESS then
      L16_208 = valid
      return L16_208
    end
    L16_208 = _UPVALUE1_
    L16_208 = L16_208 .. "." .. _UPVALUE2_.startIPAddress
    L15_207[L16_208] = A3_195
    L16_208 = _UPVALUE1_
    L16_208 = L16_208 .. "." .. _UPVALUE2_.endIPAddress
    L15_207[L16_208] = A4_196
    L16_208 = _UPVALUE0_
    L16_208 = L16_208.NIL
    if A5_197 == L16_208 then
      L16_208 = _UPVALUE0_
      L16_208 = L16_208.INVALID_ARGUMENT
      return L16_208
    end
    L16_208 = _UPVALUE5_
    L16_208 = L16_208.isBoolean
    L16_208 = L16_208(A5_197)
    valid = L16_208
    L16_208 = valid
    if L16_208 ~= _UPVALUE0_.SUCCESS then
      L16_208 = _UPVALUE0_
      L16_208 = L16_208.INVALID_ARGUMENT
      return L16_208
    end
    L16_208 = _UPVALUE1_
    L16_208 = L16_208 .. "." .. _UPVALUE2_.papEnable
    L15_207[L16_208] = A5_197
    L16_208 = _UPVALUE0_
    L16_208 = L16_208.NIL
    if A6_198 == L16_208 then
      L16_208 = _UPVALUE0_
      L16_208 = L16_208.INVALID_ARGUMENT
      return L16_208
    end
    L16_208 = _UPVALUE5_
    L16_208 = L16_208.isBoolean
    L16_208 = L16_208(A6_198)
    valid = L16_208
    L16_208 = valid
    if L16_208 ~= _UPVALUE0_.SUCCESS then
      L16_208 = _UPVALUE0_
      L16_208 = L16_208.INVALID_ARGUMENT
      return L16_208
    end
    L16_208 = _UPVALUE1_
    L16_208 = L16_208 .. "." .. _UPVALUE2_.chapEnable
    L15_207[L16_208] = A6_198
    L16_208 = _UPVALUE0_
    L16_208 = L16_208.NIL
    if A7_199 == L16_208 then
      L16_208 = _UPVALUE0_
      L16_208 = L16_208.INVALID_ARGUMENT
      return L16_208
    end
    L16_208 = _UPVALUE5_
    L16_208 = L16_208.isBoolean
    L16_208 = L16_208(A7_199)
    valid = L16_208
    L16_208 = valid
    if L16_208 ~= _UPVALUE0_.SUCCESS then
      L16_208 = _UPVALUE0_
      L16_208 = L16_208.INVALID_ARGUMENT
      return L16_208
    end
    L16_208 = _UPVALUE1_
    L16_208 = L16_208 .. "." .. _UPVALUE2_.msChapEnable
    L15_207[L16_208] = A7_199
    L16_208 = _UPVALUE0_
    L16_208 = L16_208.NIL
    if A8_200 == L16_208 then
      L16_208 = _UPVALUE0_
      L16_208 = L16_208.INVALID_ARGUMENT
      return L16_208
    end
    L16_208 = _UPVALUE5_
    L16_208 = L16_208.isBoolean
    L16_208 = L16_208(A8_200)
    valid = L16_208
    L16_208 = valid
    if L16_208 ~= _UPVALUE0_.SUCCESS then
      L16_208 = _UPVALUE0_
      L16_208 = L16_208.INVALID_ARGUMENT
      return L16_208
    end
    L16_208 = _UPVALUE1_
    L16_208 = L16_208 .. "." .. _UPVALUE2_.msChapv2Enable
    L15_207[L16_208] = A8_200
    L16_208 = _UPVALUE0_
    L16_208 = L16_208.NIL
    if A9_201 == L16_208 then
      L16_208 = _UPVALUE0_
      L16_208 = L16_208.INVALID_ARGUMENT
      return L16_208
    end
    L16_208 = _UPVALUE5_
    L16_208 = L16_208.isBoolean
    L16_208 = L16_208(A9_201)
    valid = L16_208
    L16_208 = valid
    if L16_208 ~= _UPVALUE0_.SUCCESS then
      L16_208 = _UPVALUE0_
      L16_208 = L16_208.INVALID_ARGUMENT
      return L16_208
    end
    L16_208 = _UPVALUE1_
    L16_208 = L16_208 .. "." .. _UPVALUE2_.secretKeyEnable
    L15_207[L16_208] = A9_201
    L16_208 = _UPVALUE8_
    if A9_201 == L16_208 then
      L16_208 = _UPVALUE0_
      L16_208 = L16_208.NIL
      if A10_202 == L16_208 then
        L16_208 = _UPVALUE0_
        L16_208 = L16_208.INVALID_ARGUMENT
        return L16_208
      end
      L16_208 = _UPVALUE5_
      L16_208 = L16_208.stringLengthCheck
      L16_208 = L16_208(_UPVALUE9_, _UPVALUE10_, A10_202)
      if L16_208 ~= _UPVALUE0_.SUCCESS then
        L16_208 = _UPVALUE0_
        L16_208 = L16_208.INVALID_ARGUMENT
        return L16_208
      end
      L16_208 = _UPVALUE1_
      L16_208 = L16_208 .. "." .. _UPVALUE2_.secret
      L15_207[L16_208] = A10_202
    end
    L16_208 = _UPVALUE0_
    L16_208 = L16_208.NIL
    if A11_203 == L16_208 then
      L16_208 = _UPVALUE0_
      L16_208 = L16_208.INVALID_ARGUMENT
      return L16_208
    end
    L16_208 = tonumber
    L16_208 = L16_208(A11_203)
    if L16_208 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if L16_208 < _UPVALUE11_ or L16_208 > _UPVALUE12_ then
      return _UPVALUE7_.L2TP_SERVER_INVALID_TIMEOUT
    end
    L15_207[_UPVALUE1_ .. "." .. _UPVALUE2_.userTimeOut] = A11_203
    if A14_206 ~= "0" and A14_206 ~= "1" and A14_206 ~= "2" and A14_206 ~= "3" and A14_206 ~= "4" and A14_206 ~= "5" and A14_206 ~= "6" then
      return _UPVALUE7_.INVALID_AUTHENTICATION_TYPE
    end
    if A14_206 == "2" then
      if db.getTable("LDAPSettings") == nil or #db.getTable("LDAPSettings") == 0 then
        return _UPVALUE7_.LDAP_NOT_CONFIGURED
      end
    elseif A14_206 == "3" then
      if db.getTable("ActiveDirectorySettings") == nil or #db.getTable("ActiveDirectorySettings") == 0 then
        return _UPVALUE7_.ACTIVE_DIRECTORY_NOT_CONFIGURED
      end
    elseif A14_206 == "4" then
      if db.getTable("NTDomainSettings") == nil or #db.getTable("NTDomainSettings") == 0 then
        return _UPVALUE7_.NT_DOMAIN_SERVER_NOT_CONFIGURED
      end
    elseif A14_206 == "5" then
      if db.getTable("POPProfiles") == nil or #db.getTable("POPProfiles") == 0 then
        return _UPVALUE7_.POP3_NOT_CONFIGURED
      end
    elseif A14_206 == "1" and (db.getTable("radiusClient") == nil or #db.getTable("radiusClient") == 0) then
      return _UPVALUE7_.RADIUS_SERVER_NOT_CONFIGURED
    end
    L15_207[_UPVALUE1_ .. "." .. _UPVALUE2_.authenticationType] = A14_206
  end
  if A1_193 == "2" then
    L16_208 = _UPVALUE0_
    L16_208 = L16_208.NIL
    if A12_204 == L16_208 then
      L16_208 = _UPVALUE0_
      L16_208 = L16_208.INVALID_ARGUMENT
      return L16_208
    end
    L16_208 = _UPVALUE5_
    L16_208 = L16_208.ipAddressCheck
    L16_208 = L16_208(_UPVALUE13_, A12_204)
    valid = L16_208
    L16_208 = valid
    if L16_208 ~= _UPVALUE0_.SUCCESS then
      L16_208 = _UPVALUE0_
      L16_208 = L16_208.INVALID_ARGUMENT
      return L16_208
    end
    L16_208 = _UPVALUE0_
    L16_208 = L16_208.NIL
    if A13_205 == L16_208 then
      L16_208 = _UPVALUE0_
      L16_208 = L16_208.INVALID_ARGUMENT
      return L16_208
    end
    L16_208 = _UPVALUE1_
    L16_208 = L16_208 .. "." .. _UPVALUE2_.ipv6Prefix
    L15_207[L16_208] = A12_204 .. "/" .. A13_205
  end
  L16_208 = nil
  L16_208 = db.update(_UPVALUE1_, L15_207, _UPVALUE14_)
  if L16_208 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_192
  end
  return _UPVALUE0_.SUCCESS, A0_192
end
function l2tpServerConfigCreate(A0_209, A1_210, A2_211, A3_212, A4_213, A5_214, A6_215, A7_216, A8_217, A9_218, A10_219, A11_220, A12_221, A13_222, A14_223)
  local L16_224, L17_225
  L16_224 = _UPVALUE0_
  L16_224 = L16_224.NOT_SUPPORTED
  L17_225 = 0
  return L16_224, L17_225, 0
end
function l2tpUserGet()
  local L0_226, L1_227, L2_228, L3_229, L4_230
  L0_226 = db
  L0_226 = L0_226.getNextRowId
  L1_227 = _UPVALUE0_
  L2_228 = _UPVALUE1_
  L0_226 = L0_226(L1_227, L2_228)
  L1_227 = _UPVALUE2_
  L1_227 = L1_227.NIL
  if L0_226 == L1_227 then
    L1_227 = _UPVALUE2_
    L1_227 = L1_227.EXIST
    return L1_227
  end
  L1_227 = {}
  L2_228 = db
  L2_228 = L2_228.getRow
  L3_229 = _UPVALUE1_
  L4_230 = _UPVALUE3_
  L2_228 = L2_228(L3_229, L4_230, L0_226)
  L1_227 = L2_228
  L2_228 = _UPVALUE2_
  L2_228 = L2_228.NIL
  if L1_227 == L2_228 then
    L2_228 = _UPVALUE2_
    L2_228 = L2_228.FAILURE
    return L2_228
  end
  L2_228 = _UPVALUE1_
  L3_229 = "."
  L4_230 = _UPVALUE4_
  L4_230 = L4_230.userIpAddress
  L2_228 = L2_228 .. L3_229 .. L4_230
  L2_228 = L1_227[L2_228]
  L3_229 = _UPVALUE1_
  L4_230 = "."
  L3_229 = L3_229 .. L4_230 .. _UPVALUE4_.userName
  L3_229 = L1_227[L3_229]
  L4_230 = _UPVALUE1_
  L4_230 = L4_230 .. "." .. _UPVALUE4_.IPAddress
  L4_230 = L1_227[L4_230]
  return _UPVALUE2_.SUCCESS, L0_226, L2_228, L3_229, L4_230
end
function l2tpUserGetAll()
  local L0_231, L1_232, L2_233, L3_234, L4_235, L5_236, L6_237, L7_238, L8_239, L9_240
  L0_231 = lines_from
  L1_232 = _UPVALUE0_
  L0_231 = L0_231(L1_232)
  L1_232 = lines_from
  L2_233 = _UPVALUE1_
  L1_232 = L1_232(L2_233)
  L2_233 = {}
  L3_234 = {}
  for L7_238, L8_239 in L4_235(L5_236) do
    L9_240 = {}
    L2_233[L7_238] = L9_240
    L9_240 = 1
    for _FORV_14_ in L8_239:gmatch("%S+") do
      ({})[L9_240] = _FORV_14_
      L9_240 = L9_240 + 1
    end
    if L9_240 < 4 then
      L2_233[L7_238].user = "*"
      L2_233[L7_238].rmoteip = ({})[1]
      L2_233[L7_238].server = ({})[2]
    else
      L2_233[L7_238].user = ({})[1]
      L2_233[L7_238].rmoteip = ({})[2]
      L2_233[L7_238].server = ({})[3]
    end
  end
  for L7_238, L8_239 in L4_235(L5_236) do
    L9_240 = {}
    L3_234[L7_238] = L9_240
    L9_240 = 1
    for _FORV_14_ in L8_239:gmatch("%S+") do
      ({})[L9_240] = _FORV_14_
      L9_240 = L9_240 + 1
    end
    L3_234[L7_238].user = ({})[1]:sub(2, string.len(({})[1]) - 1)
    L3_234[L7_238].server = ({})[2]
  end
  L7_238 = _UPVALUE2_
  L8_239 = _UPVALUE3_
  L9_240 = "1"
  L7_238 = _UPVALUE2_
  L8_239 = "."
  L9_240 = _UPVALUE4_
  L9_240 = L9_240.startIPAddress
  L7_238 = L7_238 .. L8_239 .. L9_240
  L7_238 = L6_237[L7_238]
  L8_239 = _UPVALUE2_
  L9_240 = "."
  L8_239 = L8_239 .. L9_240 .. _UPVALUE4_.endIPAddress
  L8_239 = L6_237[L8_239]
  L9_240 = _UPVALUE2_
  L9_240 = L9_240 .. "." .. _UPVALUE4_.authenticationType
  L9_240 = L6_237[L9_240]
  for _FORV_13_, _FORV_14_ in pairs(L2_233) do
    if 0 ~= tonumber(L9_240) then
      if _UPVALUE5_.ipv4AddressesCompare(L7_238, L2_233[_FORV_13_].rmoteip) == _UPVALUE5_.ipv4AddressesCompare(L2_233[_FORV_13_].rmoteip, L8_239) then
        L4_235[L5_236] = {}
        if "NON_AUTH_USER_" .. L2_233[_FORV_13_].rmoteip == L2_233[_FORV_13_].user then
          L4_235[L5_236][_UPVALUE4_.userName] = ""
        else
          L4_235[L5_236][_UPVALUE4_.userName] = L2_233[_FORV_13_].user
        end
        L4_235[L5_236][_UPVALUE4_.userIpAddress] = L2_233[_FORV_13_].rmoteip
        L4_235[L5_236][_UPVALUE4_.IPAddress] = L7_238 or "0"
      end
    else
      for _FORV_19_, _FORV_20_ in pairs(L3_234) do
        if L2_233[_FORV_13_].user == L3_234[_FORV_19_].user and L3_234[_FORV_19_].server == "l2tpServer" then
          L4_235[L5_236] = {}
          L4_235[L5_236][_UPVALUE4_.userName] = L2_233[_FORV_13_].user
          L4_235[L5_236][_UPVALUE4_.userIpAddress] = L2_233[_FORV_13_].rmoteip
          L4_235[L5_236][_UPVALUE4_.IPAddress] = L7_238 or "0"
        end
      end
    end
  end
  if L4_235 == _UPVALUE6_.NIL then
    return _UPVALUE6_.FAILURE
  end
  return _UPVALUE6_.SUCCESS, L4_235
end
function l2tpUserGetNext(A0_241)
  local L1_242, L2_243, L3_244, L4_245
  L1_242 = _UPVALUE0_
  L1_242 = L1_242.NIL
  if A0_241 == L1_242 then
    L1_242 = _UPVALUE0_
    L1_242 = L1_242.INVALID_ARGUMENT
    return L1_242
  end
  L1_242 = tonumber
  L2_243 = A0_241
  L1_242 = L1_242(L2_243)
  L2_243 = _UPVALUE0_
  L2_243 = L2_243.NIL
  if L1_242 == L2_243 then
    L1_242 = _UPVALUE0_
    L1_242 = L1_242.INVALID_ARGUMENT
    return L1_242
  end
  L1_242 = db
  L1_242 = L1_242.existsRow
  L2_243 = _UPVALUE1_
  L3_244 = _UPVALUE2_
  L4_245 = A0_241
  L1_242 = L1_242(L2_243, L3_244, L4_245)
  L2_243 = _UPVALUE0_
  L2_243 = L2_243.FALSE
  if L1_242 == L2_243 then
    L1_242 = _UPVALUE0_
    L1_242 = L1_242.EXIST
    return L1_242
  end
  L1_242 = nil
  L2_243 = db
  L2_243 = L2_243.getNextRowId
  L3_244 = A0_241
  L4_245 = _UPVALUE1_
  L2_243 = L2_243(L3_244, L4_245)
  L1_242 = L2_243
  L2_243 = _UPVALUE0_
  L2_243 = L2_243.NIL
  if L1_242 == L2_243 then
    L2_243 = _UPVALUE0_
    L2_243 = L2_243.EXIST
    return L2_243
  end
  L2_243 = db
  L2_243 = L2_243.getRow
  L3_244 = _UPVALUE1_
  L4_245 = _UPVALUE2_
  L2_243 = L2_243(L3_244, L4_245, L1_242)
  l2tpUser = L2_243
  L2_243 = l2tpUser
  L3_244 = _UPVALUE0_
  L3_244 = L3_244.NIL
  if L2_243 == L3_244 then
    L2_243 = _UPVALUE0_
    L2_243 = L2_243.FAILURE
    return L2_243
  end
  L2_243 = l2tpUser
  L3_244 = _UPVALUE1_
  L4_245 = "."
  L3_244 = L3_244 .. L4_245 .. _UPVALUE3_.userIpAddress
  L2_243 = L2_243[L3_244]
  L3_244 = l2tpUser
  L4_245 = _UPVALUE1_
  L4_245 = L4_245 .. "." .. _UPVALUE3_.userName
  L3_244 = L3_244[L4_245]
  L4_245 = l2tpUser
  L4_245 = L4_245[_UPVALUE1_ .. "." .. _UPVALUE3_.IPAddress]
  return _UPVALUE0_.SUCCESS, L1_242, L2_243, L3_244, L4_245
end
function l2tpUserSet(A0_246, A1_247, A2_248, A3_249)
  local L5_250, L6_251
  L5_250 = _UPVALUE0_
  L5_250 = L5_250.NOT_SUPPORTED
  L6_251 = 0
  return L5_250, L6_251, 0
end
function l2tpUserCreate(A0_252, A1_253, A2_254)
  local L4_255, L5_256
  L4_255 = _UPVALUE0_
  L4_255 = L4_255.NOT_SUPPORTED
  L5_256 = 0
  return L4_255, L5_256, 0
end
function l2tpUserDelete(A0_257)
  local L2_258, L3_259
  L2_258 = _UPVALUE0_
  L2_258 = L2_258.NOT_SUPPORTED
  L3_259 = 0
  return L2_258, L3_259, 0
end
function subnetCheckValidation(A0_260, A1_261)
  local L2_262, L3_263, L4_264, L5_265, L6_266, L7_267, L8_268, L9_269, L10_270, L11_271, L12_272, L13_273, L14_274, L15_275, L16_276, L17_277, L18_278, L19_279, L20_280, L21_281, L22_282, L23_283, L24_284, L25_285, L26_286
  L2_262 = A0_260
  L3_263, L4_264, L5_265, L6_266, L7_267, L8_268, L9_269, L10_270, L11_271, L12_272 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L13_273 = _UPVALUE0_
  L14_274 = _UPVALUE1_
  L14_274 = L14_274.ipv4SingleMaskCheck
  L15_275 = A0_260
  L16_276 = A1_261
  L17_277 = _UPVALUE2_
  L14_274 = L14_274(L15_275, L16_276, L17_277)
  L3_263 = L14_274
  L14_274 = _UPVALUE3_
  L14_274 = L14_274.SUCCESS
  if L3_263 ~= L14_274 then
    L14_274 = _UPVALUE4_
    L14_274 = L14_274.L2TP_SERVER_START_END_INVALID_MASK
    return L14_274
  end
  L15_275 = A0_260
  L14_274 = A0_260.match
  L16_276 = "^(%d+)%.(%d+)%.(%d+)%.(%d+)$"
  L17_277 = L14_274(L15_275, L16_276)
  L19_279 = A1_261
  L18_278 = A1_261.match
  L20_280 = "^(%d+)%.(%d+)%.(%d+)%.(%d+)$"
  L21_281 = L18_278(L19_279, L20_280)
  L22_282 = tonumber
  L23_283 = L21_281
  L22_282 = L22_282(L23_283)
  L23_283 = tonumber
  L24_284 = L17_277
  L23_283 = L23_283(L24_284)
  L22_282 = L22_282 - L23_283
  if L22_282 < 0 then
    L23_283 = _UPVALUE4_
    L23_283 = L23_283.L2TP_SERVER_END_IP_RANGE_INVALID
    return L23_283
  else
    L23_283 = _UPVALUE5_
    if L22_282 >= L23_283 then
      L23_283 = _UPVALUE3_
      L23_283 = L23_283.MAX_LIMIT_REACHED
      return L23_283
    end
  end
  L23_283 = db
  L23_283 = L23_283.getAttribute
  L24_284 = _UPVALUE6_
  L25_285 = _UPVALUE7_
  L25_285 = L25_285.dmz_interface
  L26_286 = _UPVALUE8_
  L23_283 = L23_283(L24_284, L25_285, L26_286, _UPVALUE7_.dmz_ip)
  L24_284 = db
  L24_284 = L24_284.getAttribute
  L25_285 = _UPVALUE6_
  L26_286 = _UPVALUE7_
  L26_286 = L26_286.dmz_interface
  L24_284 = L24_284(L25_285, L26_286, _UPVALUE8_, _UPVALUE7_.dmz_netmask)
  L25_285 = _UPVALUE3_
  L25_285 = L25_285.NIL
  if L23_283 ~= L25_285 then
    L25_285 = _UPVALUE9_
    if L23_283 ~= L25_285 then
      L25_285 = _UPVALUE3_
      L25_285 = L25_285.NIL
      if L24_284 ~= L25_285 then
        L25_285 = _UPVALUE9_
        if L24_284 ~= L25_285 then
          L25_285 = _UPVALUE1_
          L25_285 = L25_285.ipv4DualMaskCheck
          L26_286 = L23_283
          L25_285 = L25_285(L26_286, L24_284, L2_262, L24_284)
          L3_263 = L25_285
          L25_285 = _UPVALUE3_
          L25_285 = L25_285.SUCCESS
          if L3_263 == L25_285 then
            L25_285 = _UPVALUE4_
            L25_285 = L25_285.L2TP_SERVER_INVALID_IP_SAME_SUBNET_DMZ
            return L25_285
          end
        end
      end
    end
  end
  L25_285 = db
  L25_285 = L25_285.getAttribute
  L26_286 = _UPVALUE10_
  L25_285 = L25_285(L26_286, _UPVALUE11_, _UPVALUE0_, _UPVALUE7_.pptpdEnable)
  pptp_Server_Status = L25_285
  L25_285 = pptp_Server_Status
  if L25_285 ~= nil then
    L25_285 = tonumber
    L26_286 = pptp_Server_Status
    L25_285 = L25_285(L26_286)
    if L25_285 == 1 then
      L25_285 = db
      L25_285 = L25_285.getAttribute
      L26_286 = _UPVALUE10_
      L25_285 = L25_285(L26_286, _UPVALUE11_, _UPVALUE0_, _UPVALUE7_.pptp_ip)
      L26_286 = _UPVALUE2_
      if L25_285 ~= _UPVALUE3_.NIL and L25_285 ~= _UPVALUE9_ then
        L3_263 = _UPVALUE1_.ipv4DualMaskCheck(L25_285, L26_286, L2_262, L26_286)
        if L3_263 == _UPVALUE3_.SUCCESS then
          return _UPVALUE4_.L2TP_SERVER_INVALID_IP_SAME_SUBNET_PPTP
        end
      end
    end
  end
  L25_285 = db
  L25_285 = L25_285.getAttribute
  L26_286 = _UPVALUE12_
  L25_285 = L25_285(L26_286, _UPVALUE11_, _UPVALUE0_, _UPVALUE7_.openVpnMask)
  L26_286 = _UPVALUE3_
  L26_286 = L26_286.NIL
  if L25_285 ~= L26_286 then
    L26_286 = _UPVALUE9_
    if L25_285 ~= L26_286 then
      L26_286 = _UPVALUE1_
      L26_286 = L26_286.checkOpenVpnSubnetRange
      L26_286 = L26_286(L2_262, L25_285)
      returnCode = L26_286
      L26_286 = returnCode
      if L26_286 == _UPVALUE3_.SUCCESS then
        L26_286 = util
        L26_286 = L26_286.appendDebugOut
        L26_286("Set : Invalid ipaddress")
        L26_286 = _UPVALUE3_
        L26_286 = L26_286.IP_IN_OPENVPN_NETWORK
        return L26_286
      end
    end
  end
  L26_286 = db
  L26_286 = L26_286.getAttribute
  L26_286 = L26_286(_UPVALUE13_, _UPVALUE11_, _UPVALUE0_, _UPVALUE7_.ipsecVpnMask)
  if L26_286 ~= _UPVALUE3_.NIL and L26_286 ~= _UPVALUE9_ then
    result = _UPVALUE1_.checkIpSecSubnetRange(L2_262, L26_286)
    if result == _UPVALUE3_.SUCCESS then
      return _UPVALUE3_.IPSEC_DHCP_ALREADY_CONFIGURED
    end
  end
  if HIGH_SEC == "HIGH" then
    result = _UPVALUE1_.checkSslClientRange(L2_262, _UPVALUE7_.sslClientVpnMask)
    if result == _UPVALUE3_.SUCCESS then
      return _UPVALUE3_.SSLVPN_CLIENT_ALREADY_CONFIGURED
    end
  end
  result = _UPVALUE1_.checkWanSubnetRange(L2_262, _UPVALUE2_)
  if result == _UPVALUE3_.SUCCESS then
    if UNIT_NAME ~= "DSR-150N" and UNIT_NAME ~= "DSR-150" and UNIT_NAME ~= "DSR-250N" and UNIT_NAME ~= "DSR-250" then
      return _UPVALUE3_.WAN_ALREADY_CONFIGURED
    else
      return _UPVALUE3_.WAN_ECONA_ALREADY_CONFIGURED
    end
  end
  return _UPVALUE3_.SUCCESS
end
function file_exists(A0_287)
  if io.open(A0_287, "rb") then
    io.open(A0_287, "rb"):close()
  end
  return io.open(A0_287, "rb") ~= nil
end
function lines_from(A0_288)
  if not file_exists(A0_288) then
    return {}
  end
  lines = {}
  for _FORV_4_ in io.lines(A0_288) do
    lines[#lines + 1] = _FORV_4_
  end
  return lines
end
