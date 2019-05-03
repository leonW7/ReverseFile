local L0_0
L0_0 = module
L0_0("com.teamf1.core.vpn.pptpserver", package.seeall)
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
L0_0("teamf1lualib/pptpd_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).feature = "pptpdEnable"
;({}).feature6 = "pptpd6Enable"
;({}).routingMode = "pptpRoutingMode"
;({}).startIPAddress = "startIPAddress"
;({}).endIPAddress = "endIPAddress"
;({}).authenticationType = "AuthenticationType"
;({}).papEnable = "PapEnable"
;({}).chapEnable = "ChapEnable"
;({}).msChapEnable = "MSChapEnable"
;({}).msChapv2Enable = "MSChapv2Enable"
;({}).mppe40Enable = "Mppe40Enable"
;({}).mppe128Enable = "Mppe128Enable"
;({}).mppeStatefullEnable = "MppeStatefullEnable"
;({}).userTimeOut = "UserTimeOut"
;({}).netbiosEnable = "netbiosEnable"
;({}).primaryWINSServerIP = "primWinsServerIp"
;({}).secondaryWINSServerIP = "secWinsServerIp"
;({}).userIpAddress = "remoteIP"
;({}).userName = "userName"
;({}).IPAddress = "pptpIP"
;({}).ipv6Prefix = "pptpdIpv6Prefix"
;({}).authenticationType = "AuthenticationType"
;({}).wanRoutingMode = "Enable"
;({}).dmz_interface = "LogicalIfName"
;({}).dmz_ip = "StaticIp"
;({}).l2tp_ip = "StartIPAddress"
;({}).Xl2tpdEnable = "Xl2tpdEnable"
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
function ismppe40Enabled()
  local L0_82
  L0_82 = db
  L0_82 = L0_82.getAttribute
  L0_82 = L0_82(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.mppe40Enable)
  if L0_82 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_82
end
function ismppe40EnabledNext(A0_83)
  local L2_84, L3_85
  L2_84 = _UPVALUE0_
  L2_84 = L2_84.NOT_SUPPORTED
  L3_85 = 0
  return L2_84, L3_85, 0
end
function mppe40Enable(A0_86)
  local L1_87, L2_88, L3_89, L4_90, L5_91
  L1_87 = {}
  L2_88 = db
  L2_88 = L2_88.getRow
  L3_89 = _UPVALUE0_
  L4_90 = _UPVALUE1_
  L5_91 = _UPVALUE2_
  L2_88 = L2_88(L3_89, L4_90, L5_91)
  L1_87 = L2_88
  L2_88 = _UPVALUE0_
  L3_89 = "."
  L4_90 = _UPVALUE3_
  L4_90 = L4_90.feature
  L2_88 = L2_88 .. L3_89 .. L4_90
  L2_88 = L1_87[L2_88]
  L3_89 = _UPVALUE0_
  L4_90 = "."
  L5_91 = _UPVALUE3_
  L5_91 = L5_91.msChapEnable
  L3_89 = L3_89 .. L4_90 .. L5_91
  L3_89 = L1_87[L3_89]
  L4_90 = _UPVALUE0_
  L5_91 = "."
  L4_90 = L4_90 .. L5_91 .. _UPVALUE3_.msChapv2Enable
  L4_90 = L1_87[L4_90]
  L5_91 = _UPVALUE4_
  if L2_88 ~= L5_91 then
    L5_91 = _UPVALUE5_
    L5_91 = L5_91.DEPENDENCY_NOT_MET
    return L5_91
  end
  L5_91 = _UPVALUE4_
  if L3_89 ~= L5_91 then
    L5_91 = _UPVALUE4_
    if L4_90 ~= L5_91 then
      L5_91 = _UPVALUE5_
      L5_91 = L5_91.DEPENDENCY_NOT_MET
      return L5_91
    end
  end
  L5_91 = nil
  L5_91 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.mppe40Enable, _UPVALUE4_)
  if L5_91 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_86
  end
  return _UPVALUE5_.SUCCESS, A0_86
end
function mppe40Disable(A0_92)
  local L1_93, L2_94, L3_95, L4_96, L5_97
  L1_93 = {}
  L2_94 = db
  L2_94 = L2_94.getRow
  L3_95 = _UPVALUE0_
  L4_96 = _UPVALUE1_
  L5_97 = _UPVALUE2_
  L2_94 = L2_94(L3_95, L4_96, L5_97)
  L1_93 = L2_94
  L2_94 = _UPVALUE0_
  L3_95 = "."
  L4_96 = _UPVALUE3_
  L4_96 = L4_96.feature
  L2_94 = L2_94 .. L3_95 .. L4_96
  L2_94 = L1_93[L2_94]
  L3_95 = _UPVALUE0_
  L4_96 = "."
  L5_97 = _UPVALUE3_
  L5_97 = L5_97.msChapEnable
  L3_95 = L3_95 .. L4_96 .. L5_97
  L3_95 = L1_93[L3_95]
  L4_96 = _UPVALUE0_
  L5_97 = "."
  L4_96 = L4_96 .. L5_97 .. _UPVALUE3_.msChapv2Enable
  L4_96 = L1_93[L4_96]
  L5_97 = _UPVALUE4_
  if L2_94 ~= L5_97 then
    L5_97 = _UPVALUE5_
    L5_97 = L5_97.DEPENDENCY_NOT_MET
    return L5_97
  end
  L5_97 = _UPVALUE4_
  if L3_95 ~= L5_97 then
    L5_97 = _UPVALUE4_
    if L4_96 ~= L5_97 then
      L5_97 = _UPVALUE5_
      L5_97 = L5_97.DEPENDENCY_NOT_MET
      return L5_97
    end
  end
  L5_97 = nil
  L5_97 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.mppe40Enable, _UPVALUE6_)
  if L5_97 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_92
  end
  return _UPVALUE5_.SUCCESS, A0_92
end
function ismppe128Enabled()
  local L0_98
  L0_98 = db
  L0_98 = L0_98.getAttribute
  L0_98 = L0_98(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.mppe128Enable)
  if L0_98 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_98
end
function ismppe128EnabledNext(A0_99)
  local L2_100, L3_101
  L2_100 = _UPVALUE0_
  L2_100 = L2_100.NOT_SUPPORTED
  L3_101 = 0
  return L2_100, L3_101, 0
end
function mppe128Enable(A0_102)
  local L1_103, L2_104, L3_105, L4_106, L5_107
  L1_103 = {}
  L2_104 = db
  L2_104 = L2_104.getRow
  L3_105 = _UPVALUE0_
  L4_106 = _UPVALUE1_
  L5_107 = _UPVALUE2_
  L2_104 = L2_104(L3_105, L4_106, L5_107)
  L1_103 = L2_104
  L2_104 = _UPVALUE0_
  L3_105 = "."
  L4_106 = _UPVALUE3_
  L4_106 = L4_106.feature
  L2_104 = L2_104 .. L3_105 .. L4_106
  L2_104 = L1_103[L2_104]
  L3_105 = _UPVALUE0_
  L4_106 = "."
  L5_107 = _UPVALUE3_
  L5_107 = L5_107.msChapEnable
  L3_105 = L3_105 .. L4_106 .. L5_107
  L3_105 = L1_103[L3_105]
  L4_106 = _UPVALUE0_
  L5_107 = "."
  L4_106 = L4_106 .. L5_107 .. _UPVALUE3_.msChapv2Enable
  L4_106 = L1_103[L4_106]
  L5_107 = _UPVALUE4_
  if L2_104 ~= L5_107 then
    L5_107 = _UPVALUE5_
    L5_107 = L5_107.DEPENDENCY_NOT_MET
    return L5_107
  end
  L5_107 = _UPVALUE4_
  if L3_105 ~= L5_107 then
    L5_107 = _UPVALUE4_
    if L4_106 ~= L5_107 then
      L5_107 = _UPVALUE5_
      L5_107 = L5_107.DEPENDENCY_NOT_MET
      return L5_107
    end
  end
  L5_107 = nil
  L5_107 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.mppe128Enable, _UPVALUE4_)
  if L5_107 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_102
  end
  return _UPVALUE5_.SUCCESS, A0_102
end
function mppe128Disable(A0_108)
  local L1_109, L2_110, L3_111, L4_112, L5_113
  L1_109 = {}
  L2_110 = db
  L2_110 = L2_110.getRow
  L3_111 = _UPVALUE0_
  L4_112 = _UPVALUE1_
  L5_113 = _UPVALUE2_
  L2_110 = L2_110(L3_111, L4_112, L5_113)
  L1_109 = L2_110
  L2_110 = _UPVALUE0_
  L3_111 = "."
  L4_112 = _UPVALUE3_
  L4_112 = L4_112.feature
  L2_110 = L2_110 .. L3_111 .. L4_112
  L2_110 = L1_109[L2_110]
  L3_111 = _UPVALUE0_
  L4_112 = "."
  L5_113 = _UPVALUE3_
  L5_113 = L5_113.msChapEnable
  L3_111 = L3_111 .. L4_112 .. L5_113
  L3_111 = L1_109[L3_111]
  L4_112 = _UPVALUE0_
  L5_113 = "."
  L4_112 = L4_112 .. L5_113 .. _UPVALUE3_.msChapv2Enable
  L4_112 = L1_109[L4_112]
  L5_113 = _UPVALUE4_
  if L2_110 ~= L5_113 then
    L5_113 = _UPVALUE5_
    L5_113 = L5_113.DEPENDENCY_NOT_MET
    return L5_113
  end
  L5_113 = _UPVALUE4_
  if L3_111 ~= L5_113 then
    L5_113 = _UPVALUE4_
    if L4_112 ~= L5_113 then
      L5_113 = _UPVALUE5_
      L5_113 = L5_113.DEPENDENCY_NOT_MET
      return L5_113
    end
  end
  L5_113 = nil
  L5_113 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.mppe128Enable, _UPVALUE6_)
  if L5_113 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_108
  end
  return _UPVALUE5_.SUCCESS, A0_108
end
function ismppeStatefullEnabled()
  local L0_114
  L0_114 = db
  L0_114 = L0_114.getAttribute
  L0_114 = L0_114(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.mppeStatefullEnable)
  if L0_114 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_114
end
function ismppeStatefullEnabledNext(A0_115)
  local L2_116, L3_117
  L2_116 = _UPVALUE0_
  L2_116 = L2_116.NOT_SUPPORTED
  L3_117 = 0
  return L2_116, L3_117, 0
end
function mppeStatefullEnable(A0_118)
  local L1_119, L2_120, L3_121, L4_122, L5_123
  L1_119 = {}
  L2_120 = db
  L2_120 = L2_120.getRow
  L3_121 = _UPVALUE0_
  L4_122 = _UPVALUE1_
  L5_123 = _UPVALUE2_
  L2_120 = L2_120(L3_121, L4_122, L5_123)
  L1_119 = L2_120
  L2_120 = _UPVALUE0_
  L3_121 = "."
  L4_122 = _UPVALUE3_
  L4_122 = L4_122.feature
  L2_120 = L2_120 .. L3_121 .. L4_122
  L2_120 = L1_119[L2_120]
  L3_121 = _UPVALUE0_
  L4_122 = "."
  L5_123 = _UPVALUE3_
  L5_123 = L5_123.msChapEnable
  L3_121 = L3_121 .. L4_122 .. L5_123
  L3_121 = L1_119[L3_121]
  L4_122 = _UPVALUE0_
  L5_123 = "."
  L4_122 = L4_122 .. L5_123 .. _UPVALUE3_.msChapv2Enable
  L4_122 = L1_119[L4_122]
  L5_123 = _UPVALUE4_
  if L2_120 ~= L5_123 then
    L5_123 = _UPVALUE5_
    L5_123 = L5_123.DEPENDENCY_NOT_MET
    return L5_123
  end
  L5_123 = _UPVALUE4_
  if L3_121 ~= L5_123 then
    L5_123 = _UPVALUE4_
    if L4_122 ~= L5_123 then
      L5_123 = _UPVALUE5_
      L5_123 = L5_123.DEPENDENCY_NOT_MET
      return L5_123
    end
  end
  L5_123 = nil
  L5_123 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.mppeStatefullEnable, _UPVALUE4_)
  if L5_123 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_118
  end
  return _UPVALUE5_.SUCCESS, A0_118
end
function mppeStatefullDisable(A0_124)
  local L1_125, L2_126, L3_127, L4_128, L5_129
  L1_125 = {}
  L2_126 = db
  L2_126 = L2_126.getRow
  L3_127 = _UPVALUE0_
  L4_128 = _UPVALUE1_
  L5_129 = _UPVALUE2_
  L2_126 = L2_126(L3_127, L4_128, L5_129)
  L1_125 = L2_126
  L2_126 = _UPVALUE0_
  L3_127 = "."
  L4_128 = _UPVALUE3_
  L4_128 = L4_128.feature
  L2_126 = L2_126 .. L3_127 .. L4_128
  L2_126 = L1_125[L2_126]
  L3_127 = _UPVALUE0_
  L4_128 = "."
  L5_129 = _UPVALUE3_
  L5_129 = L5_129.msChapEnable
  L3_127 = L3_127 .. L4_128 .. L5_129
  L3_127 = L1_125[L3_127]
  L4_128 = _UPVALUE0_
  L5_129 = "."
  L4_128 = L4_128 .. L5_129 .. _UPVALUE3_.msChapv2Enable
  L4_128 = L1_125[L4_128]
  L5_129 = _UPVALUE4_
  if L2_126 ~= L5_129 then
    L5_129 = _UPVALUE5_
    L5_129 = L5_129.DEPENDENCY_NOT_MET
    return L5_129
  end
  L5_129 = _UPVALUE4_
  if L3_127 ~= L5_129 then
    L5_129 = _UPVALUE4_
    if L4_128 ~= L5_129 then
      L5_129 = _UPVALUE5_
      L5_129 = L5_129.DEPENDENCY_NOT_MET
      return L5_129
    end
  end
  L5_129 = nil
  L5_129 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.mppeStatefullEnable, _UPVALUE6_)
  if L5_129 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_124
  end
  return _UPVALUE5_.SUCCESS, A0_124
end
function userTimeOutGet()
  local L0_130
  L0_130 = db
  L0_130 = L0_130.getAttribute
  L0_130 = L0_130(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.userTimeOut)
  if L0_130 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_130
end
function userTimeOutGetNext(A0_131)
  local L2_132, L3_133
  L2_132 = _UPVALUE0_
  L2_132 = L2_132.NOT_SUPPORTED
  L3_133 = 0
  return L2_132, L3_133, 0
end
function userTimeOutSet(A0_134, A1_135)
  local L2_136, L3_137, L4_138
  L2_136 = db
  L2_136 = L2_136.getAttribute
  L3_137 = _UPVALUE0_
  L4_138 = _UPVALUE1_
  L2_136 = L2_136(L3_137, L4_138, _UPVALUE2_, _UPVALUE3_.feature)
  L3_137 = _UPVALUE4_
  if L2_136 ~= L3_137 then
    L3_137 = _UPVALUE5_
    L3_137 = L3_137.DEPENDENCY_NOT_MET
    return L3_137
  end
  L3_137 = _UPVALUE5_
  L3_137 = L3_137.NIL
  if A1_135 == L3_137 then
    L3_137 = _UPVALUE5_
    L3_137 = L3_137.INVALID_ARGUMENT
    return L3_137
  end
  L3_137 = tonumber
  L4_138 = A1_135
  L3_137 = L3_137(L4_138)
  L4_138 = _UPVALUE5_
  L4_138 = L4_138.NIL
  if L3_137 == L4_138 then
    L4_138 = _UPVALUE5_
    L4_138 = L4_138.INVALID_ARGUMENT
    return L4_138
  end
  L4_138 = _UPVALUE6_
  if not (L3_137 < L4_138) then
    L4_138 = _UPVALUE7_
  elseif L3_137 > L4_138 then
    L4_138 = _UPVALUE5_
    L4_138 = L4_138.INVALID_ARGUMENT
    return L4_138
  end
  L4_138 = nil
  L4_138 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.userTimeOut, A1_135)
  if L4_138 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_134
  end
  return _UPVALUE5_.SUCCESS, A0_134
end
function isnetbiosEnabled()
  local L0_139
  L0_139 = db
  L0_139 = L0_139.getAttribute
  L0_139 = L0_139(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.netbiosEnable)
  if L0_139 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_139
end
function isnetbiosEnabledNext(A0_140)
  local L2_141, L3_142
  L2_141 = _UPVALUE0_
  L2_141 = L2_141.NOT_SUPPORTED
  L3_142 = 0
  return L2_141, L3_142, 0
end
function netbiosEnable(A0_143)
  local L1_144, L2_145
  L1_144 = db
  L1_144 = L1_144.getAttribute
  L2_145 = _UPVALUE0_
  L1_144 = L1_144(L2_145, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.feature)
  L2_145 = _UPVALUE4_
  if L1_144 ~= L2_145 then
    L2_145 = _UPVALUE5_
    L2_145 = L2_145.DEPENDENCY_NOT_MET
    return L2_145
  end
  L2_145 = nil
  L2_145 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.netbiosEnable, _UPVALUE4_)
  if L2_145 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_143
  end
  return _UPVALUE5_.SUCCESS, A0_143
end
function netbiosDisable(A0_146)
  local L1_147, L2_148
  L1_147 = db
  L1_147 = L1_147.getAttribute
  L2_148 = _UPVALUE0_
  L1_147 = L1_147(L2_148, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.feature)
  L2_148 = _UPVALUE4_
  if L1_147 ~= L2_148 then
    L2_148 = _UPVALUE5_
    L2_148 = L2_148.DEPENDENCY_NOT_MET
    return L2_148
  end
  L2_148 = nil
  L2_148 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.netbiosEnable, _UPVALUE6_)
  if L2_148 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_146
  end
  return _UPVALUE5_.SUCCESS, A0_146
end
function primaryWINSServerIPGet()
  local L0_149
  L0_149 = db
  L0_149 = L0_149.getAttribute
  L0_149 = L0_149(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.primaryWINSServerIP)
  if L0_149 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_149
end
function primaryWINSServerIPGetNext(A0_150)
  local L2_151, L3_152
  L2_151 = _UPVALUE0_
  L2_151 = L2_151.NOT_SUPPORTED
  L3_152 = 0
  return L2_151, L3_152, 0
end
function primaryWINSServerIPSet(A0_153, A1_154)
  local L2_155, L3_156, L4_157, L5_158
  L2_155 = {}
  L3_156 = db
  L3_156 = L3_156.getRow
  L4_157 = _UPVALUE0_
  L5_158 = _UPVALUE1_
  L3_156 = L3_156(L4_157, L5_158, _UPVALUE2_)
  L2_155 = L3_156
  L3_156 = _UPVALUE0_
  L4_157 = "."
  L5_158 = _UPVALUE3_
  L5_158 = L5_158.feature
  L3_156 = L3_156 .. L4_157 .. L5_158
  L3_156 = L2_155[L3_156]
  L4_157 = _UPVALUE0_
  L5_158 = "."
  L4_157 = L4_157 .. L5_158 .. _UPVALUE3_.netbiosEnable
  L4_157 = L2_155[L4_157]
  L5_158 = _UPVALUE4_
  if L3_156 ~= L5_158 then
    L5_158 = _UPVALUE5_
    L5_158 = L5_158.DEPENDENCY_NOT_MET
    return L5_158
  end
  L5_158 = _UPVALUE4_
  if L4_157 ~= L5_158 then
    L5_158 = _UPVALUE5_
    L5_158 = L5_158.DEPENDENCY_NOT_MET
    return L5_158
  end
  L5_158 = _UPVALUE5_
  L5_158 = L5_158.NIL
  if A1_154 == L5_158 then
    L5_158 = _UPVALUE5_
    L5_158 = L5_158.INVALID_ARGUMENT
    return L5_158
  end
  L5_158 = _UPVALUE6_
  L5_158 = L5_158.ipAddressCheck
  L5_158 = L5_158(_UPVALUE7_, A1_154)
  valid = L5_158
  L5_158 = valid
  if L5_158 ~= _UPVALUE5_.SUCCESS then
    L5_158 = _UPVALUE5_
    L5_158 = L5_158.INVALID_ARGUMENT
    return L5_158
  end
  L5_158 = nil
  L5_158 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.primaryWINSServerIP, A1_154)
  if L5_158 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_153
  end
  return _UPVALUE5_.SUCCESS, A0_153
end
function secondaryWINSServerIPGet()
  local L0_159
  L0_159 = db
  L0_159 = L0_159.getAttribute
  L0_159 = L0_159(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.secondaryWINSServerIP)
  if L0_159 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_159
end
function secondaryWINSServerIPGetNext(A0_160)
  local L2_161, L3_162
  L2_161 = _UPVALUE0_
  L2_161 = L2_161.NOT_SUPPORTED
  L3_162 = 0
  return L2_161, L3_162, 0
end
function secondaryWINSServerIPSet(A0_163, A1_164)
  local L2_165, L3_166, L4_167, L5_168
  L2_165 = {}
  L3_166 = db
  L3_166 = L3_166.getRow
  L4_167 = _UPVALUE0_
  L5_168 = _UPVALUE1_
  L3_166 = L3_166(L4_167, L5_168, _UPVALUE2_)
  L2_165 = L3_166
  L3_166 = _UPVALUE0_
  L4_167 = "."
  L5_168 = _UPVALUE3_
  L5_168 = L5_168.feature
  L3_166 = L3_166 .. L4_167 .. L5_168
  L3_166 = L2_165[L3_166]
  L4_167 = _UPVALUE0_
  L5_168 = "."
  L4_167 = L4_167 .. L5_168 .. _UPVALUE3_.netbiosEnable
  L4_167 = L2_165[L4_167]
  L5_168 = _UPVALUE4_
  if L3_166 ~= L5_168 then
    L5_168 = _UPVALUE5_
    L5_168 = L5_168.DEPENDENCY_NOT_MET
    return L5_168
  end
  L5_168 = _UPVALUE4_
  if L4_167 ~= L5_168 then
    L5_168 = _UPVALUE5_
    L5_168 = L5_168.DEPENDENCY_NOT_MET
    return L5_168
  end
  L5_168 = _UPVALUE5_
  L5_168 = L5_168.NIL
  if A1_164 == L5_168 then
    L5_168 = _UPVALUE5_
    L5_168 = L5_168.INVALID_ARGUMENT
    return L5_168
  end
  L5_168 = _UPVALUE6_
  L5_168 = L5_168.ipAddressCheck
  L5_168 = L5_168(_UPVALUE7_, A1_164)
  valid = L5_168
  L5_168 = valid
  if L5_168 ~= _UPVALUE5_.SUCCESS then
    L5_168 = _UPVALUE5_
    L5_168 = L5_168.INVALID_ARGUMENT
    return L5_168
  end
  L5_168 = nil
  L5_168 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.secondaryWINSServerIP, A1_164)
  if L5_168 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_163
  end
  return _UPVALUE5_.SUCCESS, A0_163
end
function userIpAddressGet()
  local L0_169, L1_170
  L0_169 = db
  L0_169 = L0_169.getNextRowId
  L1_170 = _UPVALUE0_
  L0_169 = L0_169(L1_170, _UPVALUE1_)
  L1_170 = _UPVALUE2_
  L1_170 = L1_170.NIL
  if L0_169 == L1_170 then
    L1_170 = _UPVALUE2_
    L1_170 = L1_170.EXIST
    return L1_170
  end
  L1_170 = db
  L1_170 = L1_170.getAttribute
  L1_170 = L1_170(_UPVALUE1_, _UPVALUE3_, L0_169, _UPVALUE4_.userIpAddress)
  if L1_170 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_169, L1_170
end
function userIpAddressGetNext(A0_171)
  local L1_172, L2_173
  L1_172 = _UPVALUE0_
  L1_172 = L1_172.NIL
  if A0_171 == L1_172 then
    L1_172 = _UPVALUE0_
    L1_172 = L1_172.INVALID_ARGUMENT
    return L1_172
  end
  L1_172 = tonumber
  L2_173 = A0_171
  L1_172 = L1_172(L2_173)
  L2_173 = _UPVALUE0_
  L2_173 = L2_173.NIL
  if L1_172 == L2_173 then
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
    L1_172 = L1_172.EXIST
    return L1_172
  end
  L1_172 = nil
  L2_173 = db
  L2_173 = L2_173.getNextRowId
  L2_173 = L2_173(A0_171, _UPVALUE1_)
  L1_172 = L2_173
  L2_173 = _UPVALUE0_
  L2_173 = L2_173.NIL
  if L1_172 == L2_173 then
    L2_173 = _UPVALUE0_
    L2_173 = L2_173.EXIST
    return L2_173
  end
  L2_173 = db
  L2_173 = L2_173.getAttribute
  L2_173 = L2_173(_UPVALUE1_, _UPVALUE2_, L1_172, _UPVALUE3_.userIpAddress)
  if L2_173 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_172
  end
  return _UPVALUE0_.SUCCESS, L1_172, L2_173
end
function userIpAddressSet(A0_174, A1_175)
  local L3_176, L4_177
  L3_176 = _UPVALUE0_
  L3_176 = L3_176.NOT_SUPPORTED
  L4_177 = 0
  return L3_176, L4_177, 0
end
function userIpAddressDelete(A0_178, A1_179)
  local L3_180, L4_181
  L3_180 = _UPVALUE0_
  L3_180 = L3_180.NOT_SUPPORTED
  L4_181 = 0
  return L3_180, L4_181, 0
end
function userNameGet()
  local L0_182, L1_183
  L0_182 = db
  L0_182 = L0_182.getNextRowId
  L1_183 = _UPVALUE0_
  L0_182 = L0_182(L1_183, _UPVALUE1_)
  L1_183 = _UPVALUE2_
  L1_183 = L1_183.NIL
  if L0_182 == L1_183 then
    L1_183 = _UPVALUE2_
    L1_183 = L1_183.EXIST
    return L1_183
  end
  L1_183 = db
  L1_183 = L1_183.getAttribute
  L1_183 = L1_183(_UPVALUE1_, _UPVALUE3_, L0_182, _UPVALUE4_.userName)
  if L1_183 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_182, L1_183
end
function userNameGetNext(A0_184)
  local L1_185, L2_186
  L1_185 = _UPVALUE0_
  L1_185 = L1_185.NIL
  if A0_184 == L1_185 then
    L1_185 = _UPVALUE0_
    L1_185 = L1_185.INVALID_ARGUMENT
    return L1_185
  end
  L1_185 = tonumber
  L2_186 = A0_184
  L1_185 = L1_185(L2_186)
  L2_186 = _UPVALUE0_
  L2_186 = L2_186.NIL
  if L1_185 == L2_186 then
    L1_185 = _UPVALUE0_
    L1_185 = L1_185.INVALID_ARGUMENT
    return L1_185
  end
  L1_185 = db
  L1_185 = L1_185.existsRow
  L2_186 = _UPVALUE1_
  L1_185 = L1_185(L2_186, _UPVALUE2_, A0_184)
  L2_186 = _UPVALUE0_
  L2_186 = L2_186.FALSE
  if L1_185 == L2_186 then
    L1_185 = _UPVALUE0_
    L1_185 = L1_185.EXIST
    return L1_185
  end
  L1_185 = nil
  L2_186 = db
  L2_186 = L2_186.getNextRowId
  L2_186 = L2_186(A0_184, _UPVALUE1_)
  L1_185 = L2_186
  L2_186 = _UPVALUE0_
  L2_186 = L2_186.NIL
  if L1_185 == L2_186 then
    L2_186 = _UPVALUE0_
    L2_186 = L2_186.EXIST
    return L2_186
  end
  L2_186 = db
  L2_186 = L2_186.getAttribute
  L2_186 = L2_186(_UPVALUE1_, _UPVALUE2_, L1_185, _UPVALUE3_.userName)
  if L2_186 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_185
  end
  return _UPVALUE0_.SUCCESS, L1_185, L2_186
end
function userNameSet(A0_187, A1_188)
  local L3_189, L4_190
  L3_189 = _UPVALUE0_
  L3_189 = L3_189.NOT_SUPPORTED
  L4_190 = 0
  return L3_189, L4_190, 0
end
function IPAddressGet()
  local L0_191, L1_192
  L0_191 = db
  L0_191 = L0_191.getNextRowId
  L1_192 = _UPVALUE0_
  L0_191 = L0_191(L1_192, _UPVALUE1_)
  L1_192 = _UPVALUE2_
  L1_192 = L1_192.NIL
  if L0_191 == L1_192 then
    L1_192 = _UPVALUE2_
    L1_192 = L1_192.EXIST
    return L1_192
  end
  L1_192 = db
  L1_192 = L1_192.getAttribute
  L1_192 = L1_192(_UPVALUE1_, _UPVALUE3_, L0_191, _UPVALUE4_.IPAddress)
  if L1_192 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_191, L1_192
end
function IPAddressGetNext(A0_193)
  local L1_194, L2_195
  L1_194 = _UPVALUE0_
  L1_194 = L1_194.NIL
  if A0_193 == L1_194 then
    L1_194 = _UPVALUE0_
    L1_194 = L1_194.INVALID_ARGUMENT
    return L1_194
  end
  L1_194 = tonumber
  L2_195 = A0_193
  L1_194 = L1_194(L2_195)
  L2_195 = _UPVALUE0_
  L2_195 = L2_195.NIL
  if L1_194 == L2_195 then
    L1_194 = _UPVALUE0_
    L1_194 = L1_194.INVALID_ARGUMENT
    return L1_194
  end
  L1_194 = db
  L1_194 = L1_194.existsRow
  L2_195 = _UPVALUE1_
  L1_194 = L1_194(L2_195, _UPVALUE2_, A0_193)
  L2_195 = _UPVALUE0_
  L2_195 = L2_195.FALSE
  if L1_194 == L2_195 then
    L1_194 = _UPVALUE0_
    L1_194 = L1_194.EXIST
    return L1_194
  end
  L1_194 = nil
  L2_195 = db
  L2_195 = L2_195.getNextRowId
  L2_195 = L2_195(A0_193, _UPVALUE1_)
  L1_194 = L2_195
  L2_195 = _UPVALUE0_
  L2_195 = L2_195.NIL
  if L1_194 == L2_195 then
    L2_195 = _UPVALUE0_
    L2_195 = L2_195.EXIST
    return L2_195
  end
  L2_195 = db
  L2_195 = L2_195.getAttribute
  L2_195 = L2_195(_UPVALUE1_, _UPVALUE2_, L1_194, _UPVALUE3_.IPAddress)
  if L2_195 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_194
  end
  return _UPVALUE0_.SUCCESS, L1_194, L2_195
end
function IPAddressSet(A0_196, A1_197)
  local L3_198, L4_199
  L3_198 = _UPVALUE0_
  L3_198 = L3_198.NOT_SUPPORTED
  L4_199 = 0
  return L3_198, L4_199, 0
end
function pptpServerConfigGet()
  local L0_200, L1_201, L2_202, L3_203, L4_204, L5_205, L6_206, L7_207, L8_208, L9_209, L10_210, L11_211, L12_212, L13_213, L14_214, L15_215, L16_216, L17_217, L18_218, L19_219
  L0_200 = {}
  L1_201 = db
  L1_201 = L1_201.getRow
  L2_202 = _UPVALUE0_
  L3_203 = _UPVALUE1_
  L4_204 = _UPVALUE2_
  L1_201 = L1_201(L2_202, L3_203, L4_204)
  L0_200 = L1_201
  L1_201 = db
  L1_201 = L1_201.getAttribute
  L2_202 = _UPVALUE3_
  L3_203 = _UPVALUE1_
  L4_204 = _UPVALUE2_
  L5_205 = _UPVALUE4_
  L5_205 = L5_205.wanRoutingMode
  L1_201 = L1_201(L2_202, L3_203, L4_204, L5_205)
  L2_202 = _UPVALUE5_
  L2_202 = L2_202.NIL
  if L0_200 ~= L2_202 then
    L2_202 = _UPVALUE5_
    L2_202 = L2_202.NIL
  elseif L1_201 == L2_202 then
    L2_202 = _UPVALUE5_
    L2_202 = L2_202.FAILURE
    return L2_202
  end
  L2_202 = nil
  L3_203 = _UPVALUE0_
  L4_204 = "."
  L5_205 = _UPVALUE4_
  L5_205 = L5_205.feature
  L3_203 = L3_203 .. L4_204 .. L5_205
  L3_203 = L0_200[L3_203]
  L4_204 = _UPVALUE0_
  L5_205 = "."
  L6_206 = _UPVALUE4_
  L6_206 = L6_206.feature6
  L4_204 = L4_204 .. L5_205 .. L6_206
  L4_204 = L0_200[L4_204]
  L5_205 = _UPVALUE0_
  L6_206 = "."
  L7_207 = _UPVALUE4_
  L7_207 = L7_207.routingMode
  L5_205 = L5_205 .. L6_206 .. L7_207
  L5_205 = L0_200[L5_205]
  L6_206 = _UPVALUE0_
  L7_207 = "."
  L8_208 = _UPVALUE4_
  L8_208 = L8_208.startIPAddress
  L6_206 = L6_206 .. L7_207 .. L8_208
  L6_206 = L0_200[L6_206]
  L7_207 = _UPVALUE0_
  L8_208 = "."
  L9_209 = _UPVALUE4_
  L9_209 = L9_209.endIPAddress
  L7_207 = L7_207 .. L8_208 .. L9_209
  L7_207 = L0_200[L7_207]
  L8_208 = _UPVALUE0_
  L9_209 = "."
  L10_210 = _UPVALUE4_
  L10_210 = L10_210.papEnable
  L8_208 = L8_208 .. L9_209 .. L10_210
  L8_208 = L0_200[L8_208]
  L9_209 = _UPVALUE0_
  L10_210 = "."
  L11_211 = _UPVALUE4_
  L11_211 = L11_211.chapEnable
  L9_209 = L9_209 .. L10_210 .. L11_211
  L9_209 = L0_200[L9_209]
  L10_210 = _UPVALUE0_
  L11_211 = "."
  L12_212 = _UPVALUE4_
  L12_212 = L12_212.msChapEnable
  L10_210 = L10_210 .. L11_211 .. L12_212
  L10_210 = L0_200[L10_210]
  L11_211 = _UPVALUE0_
  L12_212 = "."
  L13_213 = _UPVALUE4_
  L13_213 = L13_213.msChapv2Enable
  L11_211 = L11_211 .. L12_212 .. L13_213
  L11_211 = L0_200[L11_211]
  L12_212 = _UPVALUE0_
  L13_213 = "."
  L14_214 = _UPVALUE4_
  L14_214 = L14_214.mppe40Enable
  L12_212 = L12_212 .. L13_213 .. L14_214
  L12_212 = L0_200[L12_212]
  L13_213 = _UPVALUE0_
  L14_214 = "."
  L15_215 = _UPVALUE4_
  L15_215 = L15_215.mppe128Enable
  L13_213 = L13_213 .. L14_214 .. L15_215
  L13_213 = L0_200[L13_213]
  L14_214 = _UPVALUE0_
  L15_215 = "."
  L16_216 = _UPVALUE4_
  L16_216 = L16_216.mppeStatefullEnable
  L14_214 = L14_214 .. L15_215 .. L16_216
  L14_214 = L0_200[L14_214]
  L15_215 = _UPVALUE0_
  L16_216 = "."
  L17_217 = _UPVALUE4_
  L17_217 = L17_217.userTimeOut
  L15_215 = L15_215 .. L16_216 .. L17_217
  L15_215 = L0_200[L15_215]
  L16_216 = _UPVALUE0_
  L17_217 = "."
  L18_218 = _UPVALUE4_
  L18_218 = L18_218.netbiosEnable
  L16_216 = L16_216 .. L17_217 .. L18_218
  L16_216 = L0_200[L16_216]
  L17_217 = _UPVALUE0_
  L18_218 = "."
  L19_219 = _UPVALUE4_
  L19_219 = L19_219.primaryWINSServerIP
  L17_217 = L17_217 .. L18_218 .. L19_219
  L17_217 = L0_200[L17_217]
  L18_218 = _UPVALUE0_
  L19_219 = "."
  L18_218 = L18_218 .. L19_219 .. _UPVALUE4_.secondaryWINSServerIP
  L18_218 = L0_200[L18_218]
  L19_219 = _UPVALUE0_
  L19_219 = L19_219 .. "." .. _UPVALUE4_.authenticationType
  L19_219 = L0_200[L19_219]
  if L3_203 == "1" then
    L3_203 = "1"
  elseif L4_204 == "1" then
    L3_203 = "2"
    prefixSplit = util.split(L0_200[_UPVALUE0_ .. "." .. _UPVALUE4_.ipv6Prefix], "/")
    L2_202 = prefixSplit[1]
    prefixLength = prefixSplit[2]
  else
    L3_203 = "3"
  end
  return _UPVALUE5_.SUCCESS, 1, L3_203, L5_205, L6_206, L7_207, L8_208, L9_209, L10_210, L11_211, L12_212, L13_213, L14_214, L15_215, L16_216, L17_217, L18_218, L1_201, L2_202, prefixLength, L19_219
end
function pptpServerConfigGetNext(A0_220)
  local L2_221, L3_222
  L2_221 = _UPVALUE0_
  L2_221 = L2_221.NOT_SUPPORTED
  L3_222 = 0
  return L2_221, L3_222, 0
end
function pptpServerConfigSet(A0_223, A1_224, A2_225, A3_226, A4_227, A5_228, A6_229, A7_230, A8_231, A9_232, A10_233, A11_234, A12_235, A13_236, A14_237, A15_238, A16_239, A17_240, A18_241)
  local L19_242, L20_243
  L19_242 = {}
  L20_243 = _UPVALUE0_
  L20_243 = L20_243.NIL
  if A1_224 == L20_243 then
    L20_243 = _UPVALUE0_
    L20_243 = L20_243.INVALID_ARGUMENT
    return L20_243
  end
  if A1_224 == "1" then
    L20_243 = _UPVALUE1_
    L20_243 = L20_243 .. "." .. _UPVALUE2_.feature
    L19_242[L20_243] = 1
    L20_243 = _UPVALUE1_
    L20_243 = L20_243 .. "." .. _UPVALUE2_.feature6
    L19_242[L20_243] = 0
  elseif A1_224 == "2" then
    L20_243 = _UPVALUE1_
    L20_243 = L20_243 .. "." .. _UPVALUE2_.feature6
    L19_242[L20_243] = 1
    L20_243 = _UPVALUE1_
    L20_243 = L20_243 .. "." .. _UPVALUE2_.feature
    L19_242[L20_243] = 0
  else
    L20_243 = _UPVALUE1_
    L20_243 = L20_243 .. "." .. _UPVALUE2_.feature
    L19_242[L20_243] = 0
    L20_243 = _UPVALUE1_
    L20_243 = L20_243 .. "." .. _UPVALUE2_.feature6
    L19_242[L20_243] = 0
  end
  if A1_224 == "1" or A1_224 == "2" then
    L20_243 = _UPVALUE0_
    L20_243 = L20_243.NIL
    if A2_225 ~= L20_243 then
      L20_243 = tonumber
      L20_243 = L20_243(A2_225)
      if L20_243 == _UPVALUE0_.NIL then
        return _UPVALUE0_.INVALID_ARGUMENT
      end
      if L20_243 ~= _UPVALUE3_ and L20_243 ~= _UPVALUE4_ then
        return _UPVALUE0_.INVALID_ARGUMENT
      end
    else
      L20_243 = _UPVALUE0_
      L20_243 = L20_243.NIL
      if A2_225 == L20_243 then
        A2_225 = _UPVALUE3_
      end
    end
    L20_243 = _UPVALUE1_
    L20_243 = L20_243 .. "." .. _UPVALUE2_.routingMode
    L19_242[L20_243] = A2_225
    L20_243 = _UPVALUE0_
    L20_243 = L20_243.NIL
    if A3_226 == L20_243 then
      L20_243 = _UPVALUE0_
      L20_243 = L20_243.INVALID_ARGUMENT
      return L20_243
    end
    L20_243 = _UPVALUE5_
    L20_243 = L20_243.ipAddressCheck
    L20_243 = L20_243(_UPVALUE6_, A3_226)
    valid = L20_243
    L20_243 = valid
    if L20_243 ~= _UPVALUE0_.SUCCESS then
      L20_243 = _UPVALUE7_
      L20_243 = L20_243.PPTP_SERVER_INVALID_START_IP
      return L20_243
    end
    L20_243 = _UPVALUE0_
    L20_243 = L20_243.NIL
    if A4_227 == L20_243 then
      L20_243 = _UPVALUE0_
      L20_243 = L20_243.INVALID_ARGUMENT
      return L20_243
    end
    L20_243 = _UPVALUE5_
    L20_243 = L20_243.ipAddressCheck
    L20_243 = L20_243(_UPVALUE6_, A4_227)
    valid = L20_243
    L20_243 = valid
    if L20_243 ~= _UPVALUE0_.SUCCESS then
      L20_243 = _UPVALUE7_
      L20_243 = L20_243.PPTP_SERVER_INVALID_END_IP
      return L20_243
    end
    L20_243 = subnetCheckValidation
    L20_243 = L20_243(A3_226, A4_227)
    valid = L20_243
    L20_243 = valid
    if L20_243 ~= _UPVALUE0_.SUCCESS then
      L20_243 = valid
      return L20_243
    end
    L20_243 = _UPVALUE1_
    L20_243 = L20_243 .. "." .. _UPVALUE2_.startIPAddress
    L19_242[L20_243] = A3_226
    L20_243 = _UPVALUE1_
    L20_243 = L20_243 .. "." .. _UPVALUE2_.endIPAddress
    L19_242[L20_243] = A4_227
    L20_243 = _UPVALUE0_
    L20_243 = L20_243.NIL
    if A5_228 == L20_243 then
      L20_243 = _UPVALUE0_
      L20_243 = L20_243.INVALID_ARGUMENT
      return L20_243
    end
    L20_243 = _UPVALUE5_
    L20_243 = L20_243.isBoolean
    L20_243 = L20_243(A5_228)
    valid = L20_243
    L20_243 = valid
    if L20_243 ~= _UPVALUE0_.SUCCESS then
      L20_243 = _UPVALUE0_
      L20_243 = L20_243.INVALID_ARGUMENT
      return L20_243
    end
    L20_243 = _UPVALUE1_
    L20_243 = L20_243 .. "." .. _UPVALUE2_.papEnable
    L19_242[L20_243] = A5_228
    L20_243 = _UPVALUE0_
    L20_243 = L20_243.NIL
    if A6_229 == L20_243 then
      L20_243 = _UPVALUE0_
      L20_243 = L20_243.INVALID_ARGUMENT
      return L20_243
    end
    L20_243 = _UPVALUE5_
    L20_243 = L20_243.isBoolean
    L20_243 = L20_243(A6_229)
    valid = L20_243
    L20_243 = valid
    if L20_243 ~= _UPVALUE0_.SUCCESS then
      L20_243 = _UPVALUE0_
      L20_243 = L20_243.INVALID_ARGUMENT
      return L20_243
    end
    L20_243 = _UPVALUE1_
    L20_243 = L20_243 .. "." .. _UPVALUE2_.chapEnable
    L19_242[L20_243] = A6_229
    L20_243 = _UPVALUE0_
    L20_243 = L20_243.NIL
    if A7_230 == L20_243 then
      L20_243 = _UPVALUE0_
      L20_243 = L20_243.INVALID_ARGUMENT
      return L20_243
    end
    L20_243 = _UPVALUE5_
    L20_243 = L20_243.isBoolean
    L20_243 = L20_243(A7_230)
    valid = L20_243
    L20_243 = valid
    if L20_243 ~= _UPVALUE0_.SUCCESS then
      L20_243 = _UPVALUE0_
      L20_243 = L20_243.INVALID_ARGUMENT
      return L20_243
    end
    L20_243 = _UPVALUE1_
    L20_243 = L20_243 .. "." .. _UPVALUE2_.msChapEnable
    L19_242[L20_243] = A7_230
    L20_243 = _UPVALUE0_
    L20_243 = L20_243.NIL
    if A8_231 == L20_243 then
      L20_243 = _UPVALUE0_
      L20_243 = L20_243.INVALID_ARGUMENT
      return L20_243
    end
    L20_243 = _UPVALUE5_
    L20_243 = L20_243.isBoolean
    L20_243 = L20_243(A8_231)
    valid = L20_243
    L20_243 = valid
    if L20_243 ~= _UPVALUE0_.SUCCESS then
      L20_243 = _UPVALUE0_
      L20_243 = L20_243.INVALID_ARGUMENT
      return L20_243
    end
    L20_243 = _UPVALUE1_
    L20_243 = L20_243 .. "." .. _UPVALUE2_.msChapv2Enable
    L19_242[L20_243] = A8_231
    L20_243 = _UPVALUE8_
    if A7_230 ~= L20_243 then
      L20_243 = _UPVALUE8_
    elseif A8_231 == L20_243 then
      L20_243 = _UPVALUE0_
      L20_243 = L20_243.NIL
      if A9_232 == L20_243 then
        L20_243 = _UPVALUE0_
        L20_243 = L20_243.INVALID_ARGUMENT
        return L20_243
      end
      L20_243 = _UPVALUE5_
      L20_243 = L20_243.isBoolean
      L20_243 = L20_243(A9_232)
      valid = L20_243
      L20_243 = valid
      if L20_243 ~= _UPVALUE0_.SUCCESS then
        L20_243 = _UPVALUE0_
        L20_243 = L20_243.INVALID_ARGUMENT
        return L20_243
      end
      L20_243 = _UPVALUE1_
      L20_243 = L20_243 .. "." .. _UPVALUE2_.mppe40Enable
      L19_242[L20_243] = A9_232
      L20_243 = _UPVALUE0_
      L20_243 = L20_243.NIL
      if A10_233 == L20_243 then
        L20_243 = _UPVALUE0_
        L20_243 = L20_243.INVALID_ARGUMENT
        return L20_243
      end
      L20_243 = _UPVALUE5_
      L20_243 = L20_243.isBoolean
      L20_243 = L20_243(A10_233)
      valid = L20_243
      L20_243 = valid
      if L20_243 ~= _UPVALUE0_.SUCCESS then
        L20_243 = _UPVALUE0_
        L20_243 = L20_243.INVALID_ARGUMENT
        return L20_243
      end
      L20_243 = _UPVALUE1_
      L20_243 = L20_243 .. "." .. _UPVALUE2_.mppe128Enable
      L19_242[L20_243] = A10_233
      L20_243 = _UPVALUE0_
      L20_243 = L20_243.NIL
      if A11_234 == L20_243 then
        L20_243 = _UPVALUE0_
        L20_243 = L20_243.INVALID_ARGUMENT
        return L20_243
      end
      L20_243 = _UPVALUE5_
      L20_243 = L20_243.isBoolean
      L20_243 = L20_243(A11_234)
      valid = L20_243
      L20_243 = valid
      if L20_243 ~= _UPVALUE0_.SUCCESS then
        L20_243 = _UPVALUE0_
        L20_243 = L20_243.INVALID_ARGUMENT
        return L20_243
      end
      L20_243 = _UPVALUE1_
      L20_243 = L20_243 .. "." .. _UPVALUE2_.mppeStatefullEnable
      L19_242[L20_243] = A11_234
    end
    L20_243 = _UPVALUE0_
    L20_243 = L20_243.NIL
    if A12_235 == L20_243 then
      L20_243 = _UPVALUE0_
      L20_243 = L20_243.INVALID_ARGUMENT
      return L20_243
    end
    L20_243 = tonumber
    L20_243 = L20_243(A12_235)
    if L20_243 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if L20_243 < _UPVALUE9_ or L20_243 > _UPVALUE10_ then
      return _UPVALUE7_.INVALID_TIMEOUT
    end
    L19_242[_UPVALUE1_ .. "." .. _UPVALUE2_.userTimeOut] = A12_235
    if A13_236 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    valid = _UPVALUE5_.isBoolean(A13_236)
    if valid ~= _UPVALUE0_.SUCCESS then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    L19_242[_UPVALUE1_ .. "." .. _UPVALUE2_.netbiosEnable] = A13_236
    if A13_236 == _UPVALUE8_ then
      if A14_237 == _UPVALUE0_.NIL then
        return _UPVALUE0_.INVALID_ARGUMENT
      end
      valid = _UPVALUE5_.ipAddressCheck(_UPVALUE6_, A14_237)
      if valid ~= _UPVALUE0_.SUCCESS then
        return _UPVALUE0_.INVALID_ARGUMENT
      end
      L19_242[_UPVALUE1_ .. "." .. _UPVALUE2_.primaryWINSServerIP] = A14_237
      if A15_238 == _UPVALUE0_.NIL then
        return _UPVALUE0_.INVALID_ARGUMENT
      end
      valid = _UPVALUE5_.ipAddressCheck(_UPVALUE6_, A15_238)
      if valid ~= _UPVALUE0_.SUCCESS then
        return _UPVALUE0_.INVALID_ARGUMENT
      end
      L19_242[_UPVALUE1_ .. "." .. _UPVALUE2_.secondaryWINSServerIP] = A15_238
    end
    if A18_241 ~= "0" and A18_241 ~= "1" and A18_241 ~= "2" and A18_241 ~= "3" and A18_241 ~= "4" and A18_241 ~= "5" and A18_241 ~= "6" then
      return _UPVALUE7_.INVALID_AUTHENTICATION_TYPE
    end
    if A18_241 == "2" then
      if db.getTable("LDAPSettings") == nil or #db.getTable("LDAPSettings") == 0 then
        return _UPVALUE7_.LDAP_NOT_CONFIGURED
      end
    elseif A18_241 == "3" then
      if db.getTable("ActiveDirectorySettings") == nil or #db.getTable("ActiveDirectorySettings") == 0 then
        return _UPVALUE7_.ACTIVE_DIRECTORY_NOT_CONFIGURED
      end
    elseif A18_241 == "4" then
      if db.getTable("NTDomainSettings") == nil or #db.getTable("NTDomainSettings") == 0 then
        return _UPVALUE7_.NT_DOMAIN_SERVER_NOT_CONFIGURED
      end
    elseif A18_241 == "5" then
      if db.getTable("POPProfiles") == nil or #db.getTable("POPProfiles") == 0 then
        return _UPVALUE7_.POP3_NOT_CONFIGURED
      end
    elseif A18_241 == "1" and (db.getTable("radiusClient") == nil or #db.getTable("radiusClient") == 0) then
      return _UPVALUE7_.RADIUS_SERVER_NOT_CONFIGURED
    end
    L19_242[_UPVALUE1_ .. "." .. _UPVALUE2_.authenticationType] = A18_241
  end
  if A1_224 == "2" then
    L20_243 = _UPVALUE0_
    L20_243 = L20_243.NIL
    if A16_239 == L20_243 then
      L20_243 = _UPVALUE0_
      L20_243 = L20_243.INVALID_ARGUMENT
      return L20_243
    end
    L20_243 = _UPVALUE5_
    L20_243 = L20_243.ipAddressCheck
    L20_243 = L20_243(_UPVALUE11_, A16_239)
    valid = L20_243
    L20_243 = valid
    if L20_243 ~= _UPVALUE0_.SUCCESS then
      L20_243 = _UPVALUE0_
      L20_243 = L20_243.INVALID_ARGUMENT
      return L20_243
    end
    L20_243 = _UPVALUE0_
    L20_243 = L20_243.NIL
    if A17_240 == L20_243 then
      L20_243 = _UPVALUE0_
      L20_243 = L20_243.INVALID_ARGUMENT
      return L20_243
    end
    L20_243 = _UPVALUE1_
    L20_243 = L20_243 .. "." .. _UPVALUE2_.ipv6Prefix
    L19_242[L20_243] = A16_239 .. "/" .. A17_240
  end
  L20_243 = nil
  L20_243 = db.update(_UPVALUE1_, L19_242, _UPVALUE12_)
  if L20_243 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_223
  end
  return _UPVALUE0_.SUCCESS, A0_223
end
function pptpServerConfigCreate(A0_244, A1_245, A2_246, A3_247, A4_248, A5_249, A6_250, A7_251, A8_252, A9_253, A10_254, A11_255, A12_256, A13_257, A14_258, A15_259)
  local L17_260, L18_261
  L17_260 = _UPVALUE0_
  L17_260 = L17_260.NOT_SUPPORTED
  L18_261 = 0
  return L17_260, L18_261, 0
end
function pptpUserGet()
  local L0_262, L1_263, L2_264, L3_265, L4_266
  L0_262 = db
  L0_262 = L0_262.getNextRowId
  L1_263 = _UPVALUE0_
  L2_264 = _UPVALUE1_
  L0_262 = L0_262(L1_263, L2_264)
  L1_263 = _UPVALUE2_
  L1_263 = L1_263.NIL
  if L0_262 == L1_263 then
    L1_263 = _UPVALUE2_
    L1_263 = L1_263.EXIST
    return L1_263
  end
  L1_263 = {}
  L2_264 = db
  L2_264 = L2_264.getRow
  L3_265 = _UPVALUE1_
  L4_266 = _UPVALUE3_
  L2_264 = L2_264(L3_265, L4_266, L0_262)
  L1_263 = L2_264
  L2_264 = _UPVALUE2_
  L2_264 = L2_264.NIL
  if L1_263 == L2_264 then
    L2_264 = _UPVALUE2_
    L2_264 = L2_264.FAILURE
    return L2_264
  end
  L2_264 = _UPVALUE1_
  L3_265 = "."
  L4_266 = _UPVALUE4_
  L4_266 = L4_266.userIpAddress
  L2_264 = L2_264 .. L3_265 .. L4_266
  L2_264 = L1_263[L2_264]
  L3_265 = _UPVALUE1_
  L4_266 = "."
  L3_265 = L3_265 .. L4_266 .. _UPVALUE4_.userName
  L3_265 = L1_263[L3_265]
  L4_266 = _UPVALUE1_
  L4_266 = L4_266 .. "." .. _UPVALUE4_.IPAddress
  L4_266 = L1_263[L4_266]
  return _UPVALUE2_.SUCCESS, L0_262, L2_264, L3_265, L4_266
end
function pptpUserGetNext(A0_267)
  local L1_268, L2_269, L3_270, L4_271
  L1_268 = _UPVALUE0_
  L1_268 = L1_268.NIL
  if A0_267 == L1_268 then
    L1_268 = _UPVALUE0_
    L1_268 = L1_268.INVALID_ARGUMENT
    return L1_268
  end
  L1_268 = tonumber
  L2_269 = A0_267
  L1_268 = L1_268(L2_269)
  L2_269 = _UPVALUE0_
  L2_269 = L2_269.NIL
  if L1_268 == L2_269 then
    L1_268 = _UPVALUE0_
    L1_268 = L1_268.INVALID_ARGUMENT
    return L1_268
  end
  L1_268 = db
  L1_268 = L1_268.existsRow
  L2_269 = _UPVALUE1_
  L3_270 = _UPVALUE2_
  L4_271 = A0_267
  L1_268 = L1_268(L2_269, L3_270, L4_271)
  L2_269 = _UPVALUE0_
  L2_269 = L2_269.FALSE
  if L1_268 == L2_269 then
    L1_268 = _UPVALUE0_
    L1_268 = L1_268.EXIST
    return L1_268
  end
  L1_268 = nil
  L2_269 = db
  L2_269 = L2_269.getNextRowId
  L3_270 = A0_267
  L4_271 = _UPVALUE1_
  L2_269 = L2_269(L3_270, L4_271)
  L1_268 = L2_269
  L2_269 = _UPVALUE0_
  L2_269 = L2_269.NIL
  if L1_268 == L2_269 then
    L2_269 = _UPVALUE0_
    L2_269 = L2_269.EXIST
    return L2_269
  end
  L2_269 = db
  L2_269 = L2_269.getRow
  L3_270 = _UPVALUE1_
  L4_271 = _UPVALUE2_
  L2_269 = L2_269(L3_270, L4_271, L1_268)
  pptpUser = L2_269
  L2_269 = pptpUser
  L3_270 = _UPVALUE0_
  L3_270 = L3_270.NIL
  if L2_269 == L3_270 then
    L2_269 = _UPVALUE0_
    L2_269 = L2_269.FAILURE
    return L2_269
  end
  L2_269 = pptpUser
  L3_270 = _UPVALUE1_
  L4_271 = "."
  L3_270 = L3_270 .. L4_271 .. _UPVALUE3_.userIpAddress
  L2_269 = L2_269[L3_270]
  L3_270 = pptpUser
  L4_271 = _UPVALUE1_
  L4_271 = L4_271 .. "." .. _UPVALUE3_.userName
  L3_270 = L3_270[L4_271]
  L4_271 = pptpUser
  L4_271 = L4_271[_UPVALUE1_ .. "." .. _UPVALUE3_.IPAddress]
  return _UPVALUE0_.SUCCESS, L1_268, L2_269, L3_270, L4_271
end
function pptpUserGetAll()
  local L0_272, L1_273, L2_274, L3_275, L4_276, L5_277, L6_278, L7_279, L8_280, L9_281
  L0_272 = lines_from
  L1_273 = _UPVALUE0_
  L0_272 = L0_272(L1_273)
  L1_273 = lines_from
  L2_274 = _UPVALUE1_
  L1_273 = L1_273(L2_274)
  L2_274 = {}
  L3_275 = {}
  for L7_279, L8_280 in L4_276(L5_277) do
    L9_281 = {}
    L2_274[L7_279] = L9_281
    L9_281 = 1
    for _FORV_14_ in L8_280:gmatch("%S+") do
      ({})[L9_281] = _FORV_14_
      L9_281 = L9_281 + 1
    end
    if L9_281 < 4 then
      L2_274[L7_279].user = "*"
      L2_274[L7_279].rmoteip = ({})[1]
      L2_274[L7_279].server = ({})[2]
    else
      L2_274[L7_279].user = ({})[1]
      L2_274[L7_279].rmoteip = ({})[2]
      L2_274[L7_279].server = ({})[3]
    end
  end
  for L7_279, L8_280 in L4_276(L5_277) do
    L9_281 = {}
    L3_275[L7_279] = L9_281
    L9_281 = 1
    for _FORV_14_ in L8_280:gmatch("%S+") do
      ({})[L9_281] = _FORV_14_
      L9_281 = L9_281 + 1
    end
    L3_275[L7_279].user = ({})[1]:sub(2, string.len(({})[1]) - 1)
    L3_275[L7_279].server = ({})[2]
  end
  L7_279 = _UPVALUE2_
  L8_280 = _UPVALUE3_
  L9_281 = "1"
  L7_279 = _UPVALUE2_
  L8_280 = "."
  L9_281 = _UPVALUE4_
  L9_281 = L9_281.startIPAddress
  L7_279 = L7_279 .. L8_280 .. L9_281
  L7_279 = L6_278[L7_279]
  L8_280 = _UPVALUE2_
  L9_281 = "."
  L8_280 = L8_280 .. L9_281 .. _UPVALUE4_.endIPAddress
  L8_280 = L6_278[L8_280]
  L9_281 = _UPVALUE2_
  L9_281 = L9_281 .. "." .. _UPVALUE4_.authenticationType
  L9_281 = L6_278[L9_281]
  for _FORV_13_, _FORV_14_ in pairs(L2_274) do
    if 0 ~= tonumber(L9_281) then
      if _UPVALUE5_.ipv4AddressesCompare(L7_279, L2_274[_FORV_13_].rmoteip) == _UPVALUE5_.ipv4AddressesCompare(L2_274[_FORV_13_].rmoteip, L8_280) then
        L4_276[L5_277] = {}
        if "NON_AUTH_USER_" .. L2_274[_FORV_13_].rmoteip == L2_274[_FORV_13_].user then
          L4_276[L5_277].userName = ""
        else
          L4_276[L5_277].userName = L2_274[_FORV_13_].user
        end
        L4_276[L5_277].remoteIP = L2_274[_FORV_13_].rmoteip
        L4_276[L5_277].pptpIP = L7_279 or "0"
      end
    else
      for _FORV_19_, _FORV_20_ in pairs(L3_275) do
        if L2_274[_FORV_13_].user == L3_275[_FORV_19_].user and L3_275[_FORV_19_].server == "pptpServer" then
          L4_276[L5_277] = {}
          L4_276[L5_277].userName = L2_274[_FORV_13_].user
          L4_276[L5_277].remoteIP = L2_274[_FORV_13_].rmoteip
          L4_276[L5_277].pptpIP = L7_279 or "0"
        end
      end
    end
  end
  if L4_276 == _UPVALUE6_.NIL then
    return _UPVALUE6_.FAILURE
  end
  return _UPVALUE6_.SUCCESS, L4_276
end
function pptpUserSet(A0_282, A1_283, A2_284, A3_285)
  local L5_286, L6_287
  L5_286 = _UPVALUE0_
  L5_286 = L5_286.NOT_SUPPORTED
  L6_287 = 0
  return L5_286, L6_287, 0
end
function pptpUserCreate(A0_288, A1_289, A2_290)
  local L4_291, L5_292
  L4_291 = _UPVALUE0_
  L4_291 = L4_291.NOT_SUPPORTED
  L5_292 = 0
  return L4_291, L5_292, 0
end
function pptpUserDelete(A0_293)
  local L2_294, L3_295
  L2_294 = _UPVALUE0_
  L2_294 = L2_294.NOT_SUPPORTED
  L3_295 = 0
  return L2_294, L3_295, 0
end
function subnetCheckValidation(A0_296, A1_297)
  local L2_298, L3_299, L4_300, L5_301, L6_302, L7_303, L8_304, L9_305, L10_306, L11_307, L12_308, L13_309, L14_310, L15_311, L16_312, L17_313, L18_314, L19_315, L20_316, L21_317, L22_318, L23_319, L24_320, L25_321, L26_322, L27_323
  L2_298 = A0_296
  L3_299, L4_300, L5_301, L6_302, L7_303, L8_304, L9_305, L10_306, L11_307, L12_308 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L13_309 = _UPVALUE0_
  L14_310 = _UPVALUE1_
  L14_310 = L14_310.ipv4SingleMaskCheck
  L15_311 = A0_296
  L16_312 = A1_297
  L17_313 = _UPVALUE2_
  L14_310 = L14_310(L15_311, L16_312, L17_313)
  L3_299 = L14_310
  L14_310 = _UPVALUE3_
  L14_310 = L14_310.SUCCESS
  if L3_299 ~= L14_310 then
    L14_310 = _UPVALUE4_
    L14_310 = L14_310.PPTP_SERVER_START_END_INVALID_MASK
    return L14_310
  end
  L15_311 = A0_296
  L14_310 = A0_296.match
  L16_312 = "^(%d+)%.(%d+)%.(%d+)%.(%d+)$"
  L17_313 = L14_310(L15_311, L16_312)
  L19_315 = A1_297
  L18_314 = A1_297.match
  L20_316 = "^(%d+)%.(%d+)%.(%d+)%.(%d+)$"
  L21_317 = L18_314(L19_315, L20_316)
  L22_318 = tonumber
  L23_319 = L21_317
  L22_318 = L22_318(L23_319)
  L23_319 = tonumber
  L24_320 = L17_313
  L23_319 = L23_319(L24_320)
  L22_318 = L22_318 - L23_319
  if L22_318 < 0 then
    L23_319 = _UPVALUE4_
    L23_319 = L23_319.PPTP_SERVER_END_IP_RANGE_INVALID
    return L23_319
  else
    L23_319 = _UPVALUE5_
    if L22_318 >= L23_319 then
      L23_319 = _UPVALUE3_
      L23_319 = L23_319.MAX_LIMIT_REACHED
      return L23_319
    end
  end
  L23_319 = db
  L23_319 = L23_319.getAttribute
  L24_320 = _UPVALUE6_
  L25_321 = _UPVALUE7_
  L25_321 = L25_321.dmz_interface
  L26_322 = _UPVALUE8_
  L27_323 = _UPVALUE7_
  L27_323 = L27_323.dmz_ip
  L23_319 = L23_319(L24_320, L25_321, L26_322, L27_323)
  L24_320 = db
  L24_320 = L24_320.getAttribute
  L25_321 = _UPVALUE6_
  L26_322 = _UPVALUE7_
  L26_322 = L26_322.dmz_interface
  L27_323 = _UPVALUE8_
  L24_320 = L24_320(L25_321, L26_322, L27_323, _UPVALUE7_.dmz_netmask)
  L25_321 = _UPVALUE3_
  L25_321 = L25_321.NIL
  if L23_319 ~= L25_321 then
    L25_321 = _UPVALUE9_
    if L23_319 ~= L25_321 then
      L25_321 = _UPVALUE3_
      L25_321 = L25_321.NIL
      if L24_320 ~= L25_321 then
        L25_321 = _UPVALUE9_
        if L24_320 ~= L25_321 then
          L25_321 = _UPVALUE1_
          L25_321 = L25_321.ipv4DualMaskCheck
          L26_322 = L23_319
          L27_323 = L24_320
          L25_321 = L25_321(L26_322, L27_323, L2_298, L24_320)
          L3_299 = L25_321
          L25_321 = _UPVALUE3_
          L25_321 = L25_321.SUCCESS
          if L3_299 == L25_321 then
            L25_321 = _UPVALUE4_
            L25_321 = L25_321.PPTP_SERVER_INVALID_IP_SAME_SUBNET_DMZ
            return L25_321
          end
        end
      end
    end
  end
  L25_321 = db
  L25_321 = L25_321.getAttribute
  L26_322 = _UPVALUE10_
  L27_323 = _UPVALUE11_
  L25_321 = L25_321(L26_322, L27_323, _UPVALUE0_, _UPVALUE7_.Xl2tpdEnable)
  l2tp_Server_Status = L25_321
  L25_321 = _UPVALUE2_
  L26_322 = l2tp_Server_Status
  if L26_322 ~= nil then
    L26_322 = tonumber
    L27_323 = l2tp_Server_Status
    L26_322 = L26_322(L27_323)
    if L26_322 == 1 then
      L26_322 = db
      L26_322 = L26_322.getAttribute
      L27_323 = _UPVALUE10_
      L26_322 = L26_322(L27_323, _UPVALUE11_, _UPVALUE0_, _UPVALUE7_.l2tp_ip)
      L27_323 = _UPVALUE3_
      L27_323 = L27_323.NIL
      if L26_322 ~= L27_323 then
        L27_323 = _UPVALUE9_
        if L26_322 ~= L27_323 then
          L27_323 = _UPVALUE1_
          L27_323 = L27_323.ipv4DualMaskCheck
          L27_323 = L27_323(L26_322, L25_321, L2_298, L25_321)
          L3_299 = L27_323
          L27_323 = _UPVALUE3_
          L27_323 = L27_323.SUCCESS
          if L3_299 == L27_323 then
            L27_323 = _UPVALUE4_
            L27_323 = L27_323.PPTP_SERVER_INVALID_IP_SAME_SUBNET_L2TP
            return L27_323
          end
        end
      end
    end
  end
  L26_322 = db
  L26_322 = L26_322.getAttribute
  L27_323 = _UPVALUE12_
  L26_322 = L26_322(L27_323, _UPVALUE11_, _UPVALUE0_, _UPVALUE7_.openVpnMask)
  L27_323 = _UPVALUE3_
  L27_323 = L27_323.NIL
  if L26_322 ~= L27_323 then
    L27_323 = _UPVALUE9_
    if L26_322 ~= L27_323 then
      L27_323 = _UPVALUE1_
      L27_323 = L27_323.checkOpenVpnSubnetRange
      L27_323 = L27_323(L2_298, L26_322)
      returnCode = L27_323
      L27_323 = returnCode
      if L27_323 == _UPVALUE3_.SUCCESS then
        L27_323 = util
        L27_323 = L27_323.appendDebugOut
        L27_323("Set : Invalid ipaddress")
        L27_323 = _UPVALUE3_
        L27_323 = L27_323.IP_IN_OPENVPN_NETWORK
        return L27_323
      end
    end
  end
  L27_323 = db
  L27_323 = L27_323.getAttribute
  L27_323 = L27_323(_UPVALUE13_, _UPVALUE11_, _UPVALUE0_, _UPVALUE7_.ipsecVpnMask)
  if L27_323 ~= _UPVALUE3_.NIL and L27_323 ~= _UPVALUE9_ then
    result = _UPVALUE1_.checkIpSecSubnetRange(L2_298, L27_323)
    if result == _UPVALUE3_.SUCCESS then
      return _UPVALUE3_.IPSEC_DHCP_ALREADY_CONFIGURED
    end
  end
  if HIGH_SEC == "HIGH" then
    result = _UPVALUE1_.checkSslClientRange(L2_298, _UPVALUE7_.sslClientVpnMask)
    if result == _UPVALUE3_.SUCCESS then
      return _UPVALUE3_.SSLVPN_CLIENT_ALREADY_CONFIGURED
    end
  end
  result = _UPVALUE1_.checkWanSubnetRange(L2_298, _UPVALUE2_)
  if result == _UPVALUE3_.SUCCESS then
    if UNIT_NAME ~= "DSR-150N" and UNIT_NAME ~= "DSR-150" and UNIT_NAME ~= "DSR-250N" and UNIT_NAME ~= "DSR-250" then
      return _UPVALUE3_.WAN_ALREADY_CONFIGURED
    else
      return _UPVALUE3_.WAN_ECONA_ALREADY_CONFIGURED
    end
  end
  return _UPVALUE3_.SUCCESS
end
function file_exists(A0_324)
  if io.open(A0_324, "rb") then
    io.open(A0_324, "rb"):close()
  end
  return io.open(A0_324, "rb") ~= nil
end
function lines_from(A0_325)
  if not file_exists(A0_325) then
    return {}
  end
  lines = {}
  for _FORV_4_ in io.lines(A0_325) do
    lines[#lines + 1] = _FORV_4_
  end
  return lines
end
