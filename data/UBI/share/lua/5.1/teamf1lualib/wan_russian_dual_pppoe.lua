local L0_0
L0_0 = module
L0_0("com.teamf1.core.wan.russian_dual_pppoe", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/returnCodes_pppoe")
L0_0 = require
L0_0("teamf1lualib/nimf_returnCodes")
L0_0 = require
L0_0("teamf1lualib/vlan_vlan")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).wanPort = "LogicalIfName"
;({}).getIPFromIsp = "GetIpFromIsp"
;({}).ipAddress = "StaticIp"
;({}).networkMask = "NetMask"
;({}).userName = "UserName"
;({}).password = "Password"
;({}).service = "Service"
;({}).getDnsFromIsp = "GetDnsFromIsp"
;({}).primaryDns = "PrimaryDns"
;({}).secondaryDns = "SecondaryDns"
;({}).authenticationOptions = "AuthOpt"
;({}).reconnectMode = "IdleTimeOutFlag"
;({}).idleTimeOutValue = "IdleTimeOutValue"
;({}).getIPFromIsp2 = "GetIpFromIspPhy"
;({}).ipAddress2 = "StaticIpPhy"
;({}).networkMask2 = "NetMaskPhy"
;({}).gateway2 = "GatewayPhy"
;({}).getDnsFromIsp2 = "GetDnsFromIspPhy"
;({}).primaryDns2 = "PrimaryDnsPhy"
;({}).secondaryDns2 = "SecondaryDnsPhy"
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
function wanPortGet()
  local L1_1
  L1_1 = _UPVALUE0_
  L1_1 = L1_1.NOT_SUPPORTED
  return L1_1
end
function wanPortGetNext(A0_2)
  return _UPVALUE0_.NOT_SUPPORTED
end
function wanPortSet(A0_3, A1_4)
  return _UPVALUE0_.NOT_SUPPORTED
end
function wanPortDelete(A0_5, A1_6)
  return _UPVALUE0_.NOT_SUPPORTED
end
function isgetIPFromIspEnabled(A0_7)
  local L1_8
  L1_8 = _UPVALUE0_
  L1_8 = L1_8.NIL
  if A0_7 == L1_8 then
    L1_8 = _UPVALUE0_
    L1_8 = L1_8.INVALID_ARGUMENT
    return L1_8
  end
  if A0_7 ~= "WAN1" and A0_7 ~= "WAN2" then
    L1_8 = _UPVALUE0_
    L1_8 = L1_8.INVALID_ARGUMENT
    return L1_8
  end
  L1_8 = db
  L1_8 = L1_8.getAttribute
  L1_8 = L1_8(_UPVALUE1_, _UPVALUE2_.wanPort, A0_7, _UPVALUE2_.getIPFromIsp)
  if L1_8 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_7, L1_8
end
function isgetIPFromIspEnabledNext(A0_9)
  return _UPVALUE0_.NOT_SUPPORTED
end
function getIPFromIspEnable(A0_10)
  if A0_10 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A0_10 ~= "WAN1" and A0_10 ~= "WAN2" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_.wanPort, A0_10, _UPVALUE2_.getIPFromIsp, _UPVALUE3_) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, A0_10
end
function getIPFromIspDisable(A0_11)
  if A0_11 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A0_11 ~= "WAN1" and A0_11 ~= "WAN2" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_.wanPort, A0_11, _UPVALUE2_.getIPFromIsp, _UPVALUE3_) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, A0_11
end
function ipAddressGet(A0_12)
  local L1_13
  L1_13 = _UPVALUE0_
  L1_13 = L1_13.NIL
  if A0_12 == L1_13 then
    L1_13 = _UPVALUE0_
    L1_13 = L1_13.INVALID_ARGUMENT
    return L1_13
  end
  if A0_12 ~= "WAN1" and A0_12 ~= "WAN2" then
    L1_13 = _UPVALUE0_
    L1_13 = L1_13.INVALID_ARGUMENT
    return L1_13
  end
  L1_13 = db
  L1_13 = L1_13.getAttribute
  L1_13 = L1_13(_UPVALUE1_, _UPVALUE2_.wanPort, A0_12, _UPVALUE2_.ipAddress)
  if L1_13 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_12, L1_13
end
function ipAddressGetNext(A0_14)
  return _UPVALUE0_.NOT_SUPPORTED
end
function ipAddressSet(A0_15, A1_16)
  local L2_17, L3_18
  L3_18 = _UPVALUE0_
  L3_18 = L3_18.NIL
  if A0_15 == L3_18 then
    L3_18 = _UPVALUE0_
    L3_18 = L3_18.INVALID_ARGUMENT
    return L3_18
  end
  if A0_15 ~= "WAN1" and A0_15 ~= "WAN2" then
    L3_18 = _UPVALUE0_
    L3_18 = L3_18.INVALID_ARGUMENT
    return L3_18
  end
  L3_18 = db
  L3_18 = L3_18.getAttribute
  L3_18 = L3_18(_UPVALUE1_, _UPVALUE2_.wanPort, A0_15, _UPVALUE2_.ipAddress)
  if tonumber(L3_18) == 1 then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if tonumber(L3_18) == 0 and A1_16 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_17 = _UPVALUE3_.ipAddressCheck(_UPVALUE4_, A1_16)
  if L2_17 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_.wanPort, A0_15, _UPVALUE2_.ipAddress, A1_16) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_15
  end
  return _UPVALUE0_.SUCCESS, A0_15
end
function networkMaskGet(A0_19)
  local L1_20
  L1_20 = _UPVALUE0_
  L1_20 = L1_20.NIL
  if A0_19 == L1_20 then
    L1_20 = _UPVALUE0_
    L1_20 = L1_20.INVALID_ARGUMENT
    return L1_20
  end
  if A0_19 ~= "WAN1" and A0_19 ~= "WAN2" then
    L1_20 = _UPVALUE0_
    L1_20 = L1_20.INVALID_ARGUMENT
    return L1_20
  end
  L1_20 = db
  L1_20 = L1_20.getAttribute
  L1_20 = L1_20(_UPVALUE1_, _UPVALUE2_.wanPort, A0_19, _UPVALUE2_.networkMask)
  if L1_20 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_19, L1_20
end
function networkMaskGetNext(A0_21)
  return _UPVALUE0_.NOT_SUPPORTED
end
function networkMaskSet(A0_22, A1_23)
  local L2_24, L3_25
  L3_25 = _UPVALUE0_
  L3_25 = L3_25.NIL
  if A0_22 == L3_25 then
    L3_25 = _UPVALUE0_
    L3_25 = L3_25.INVALID_ARGUMENT
    return L3_25
  end
  if A0_22 ~= "WAN1" and A0_22 ~= "WAN2" then
    L3_25 = _UPVALUE0_
    L3_25 = L3_25.INVALID_ARGUMENT
    return L3_25
  end
  L3_25 = db
  L3_25 = L3_25.getAttribute
  L3_25 = L3_25(_UPVALUE1_, _UPVALUE2_.wanPort, A0_22, _UPVALUE2_.getIPFromIsp)
  if tonumber(L3_25) == 1 then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if tonumber(L3_25) == 0 and A1_23 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_24 = _UPVALUE3_.ipAddressCheck(_UPVALUE4_, A1_23)
  if L2_24 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_.wanPort, A0_22, _UPVALUE2_.networkMask, A1_23) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_22
  end
  return _UPVALUE0_.SUCCESS, A0_22
end
function userNameGet(A0_26)
  local L1_27
  L1_27 = _UPVALUE0_
  L1_27 = L1_27.NIL
  if A0_26 == L1_27 then
    L1_27 = _UPVALUE0_
    L1_27 = L1_27.INVALID_ARGUMENT
    return L1_27
  end
  if A0_26 ~= "WAN1" and A0_26 ~= "WAN2" then
    L1_27 = _UPVALUE0_
    L1_27 = L1_27.INVALID_ARGUMENT
    return L1_27
  end
  L1_27 = db
  L1_27 = L1_27.getAttribute
  L1_27 = L1_27(_UPVALUE1_, _UPVALUE2_.wanPort, A0_26, _UPVALUE2_.userName)
  if L1_27 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_26, L1_27
end
function userNameGetNext(A0_28)
  return _UPVALUE0_.NOT_SUPPORTED
end
function userNameSet(A0_29, A1_30)
  if A0_29 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A0_29 ~= "WAN1" and A0_29 ~= "WAN2" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_30 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_.wanPort, A0_29, _UPVALUE2_.userName, A1_30) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, A0_29
end
function passwordGet(A0_31)
  local L1_32
  L1_32 = _UPVALUE0_
  L1_32 = L1_32.NIL
  if A0_31 == L1_32 then
    L1_32 = _UPVALUE0_
    L1_32 = L1_32.INVALID_ARGUMENT
    return L1_32
  end
  if A0_31 ~= "WAN1" and A0_31 ~= "WAN2" then
    L1_32 = _UPVALUE0_
    L1_32 = L1_32.INVALID_ARGUMENT
    return L1_32
  end
  L1_32 = db
  L1_32 = L1_32.getAttribute
  L1_32 = L1_32(_UPVALUE1_, _UPVALUE2_.wanPort, A0_31, _UPVALUE2_.password)
  if L1_32 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_31, L1_32
end
function passwordGetNext(A0_33)
  return _UPVALUE0_.NOT_SUPPORTED
end
function passwordSet(A0_34, A1_35)
  if A0_34 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A0_34 ~= "WAN1" and A0_34 ~= "WAN2" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_35 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_.wanPort, A0_34, _UPVALUE2_.password, A1_35) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, A0_34
end
function serviceGet(A0_36)
  local L1_37
  L1_37 = _UPVALUE0_
  L1_37 = L1_37.NIL
  if A0_36 == L1_37 then
    L1_37 = _UPVALUE0_
    L1_37 = L1_37.INVALID_ARGUMENT
    return L1_37
  end
  if A0_36 ~= "WAN1" and A0_36 ~= "WAN2" then
    L1_37 = _UPVALUE0_
    L1_37 = L1_37.INVALID_ARGUMENT
    return L1_37
  end
  L1_37 = db
  L1_37 = L1_37.getAttribute
  L1_37 = L1_37(_UPVALUE1_, _UPVALUE2_.wanPort, A0_36, _UPVALUE2_.service)
  if L1_37 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_36, L1_37
end
function serviceGetNext(A0_38)
  return _UPVALUE0_.NOT_SUPPORTED
end
function serviceSet(A0_39, A1_40)
  if A0_39 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A0_39 ~= "WAN1" and A0_39 ~= "WAN2" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_40 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_.wanPort, A0_39, _UPVALUE2_.service, A1_40) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, A0_39
end
function isgetDnsFromIspEnabled(A0_41)
  local L1_42
  L1_42 = _UPVALUE0_
  L1_42 = L1_42.NIL
  if A0_41 == L1_42 then
    L1_42 = _UPVALUE0_
    L1_42 = L1_42.INVALID_ARGUMENT
    return L1_42
  end
  if A0_41 ~= "WAN1" and A0_41 ~= "WAN2" then
    L1_42 = _UPVALUE0_
    L1_42 = L1_42.INVALID_ARGUMENT
    return L1_42
  end
  L1_42 = db
  L1_42 = L1_42.getAttribute
  L1_42 = L1_42(_UPVALUE1_, _UPVALUE2_.wanPort, A0_41, _UPVALUE2_.getDnsFromIsp)
  if L1_42 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_41, L1_42
end
function isgetDnsFromIspEnabledNext(A0_43)
  return _UPVALUE0_.NOT_SUPPORTED
end
function getDnsFromIspEnable(A0_44)
  if A0_44 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A0_44 ~= "WAN1" and A0_44 ~= "WAN2" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_.wanPort, A0_44, _UPVALUE2_.getDnsFromIsp, _UPVALUE3_) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, A0_44
end
function getDnsFromIspDisable(A0_45)
  if A0_45 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A0_45 ~= "WAN1" and A0_45 ~= "WAN2" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_.wanPort, A0_45, _UPVALUE2_.getDnsFromIsp, _UPVALUE3_) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, A0_45
end
function primaryDnsGet(A0_46)
  local L1_47
  L1_47 = _UPVALUE0_
  L1_47 = L1_47.NIL
  if A0_46 == L1_47 then
    L1_47 = _UPVALUE0_
    L1_47 = L1_47.INVALID_ARGUMENT
    return L1_47
  end
  if A0_46 ~= "WAN1" and A0_46 ~= "WAN2" then
    L1_47 = _UPVALUE0_
    L1_47 = L1_47.INVALID_ARGUMENT
    return L1_47
  end
  L1_47 = db
  L1_47 = L1_47.getAttribute
  L1_47 = L1_47(_UPVALUE1_, _UPVALUE2_.wanPort, A0_46, _UPVALUE2_.primaryDns)
  if L1_47 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_46, L1_47
end
function primaryDnsGetNext(A0_48)
  return _UPVALUE0_.NOT_SUPPORTED
end
function primaryDnsSet(A0_49, A1_50)
  local L2_51, L3_52
  L3_52 = _UPVALUE0_
  L3_52 = L3_52.NIL
  if A0_49 == L3_52 then
    L3_52 = _UPVALUE0_
    L3_52 = L3_52.INVALID_ARGUMENT
    return L3_52
  end
  if A0_49 ~= "WAN1" and A0_49 ~= "WAN2" then
    L3_52 = _UPVALUE0_
    L3_52 = L3_52.INVALID_ARGUMENT
    return L3_52
  end
  L3_52 = db
  L3_52 = L3_52.getAttribute
  L3_52 = L3_52(_UPVALUE1_, _UPVALUE2_.wanPort, A0_49, _UPVALUE2_.getDnsFromIsp)
  if tonumber(L3_52) == 1 then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if tonumber(L3_52) == 0 and A1_50 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_51 = _UPVALUE3_.ipAddressCheck(_UPVALUE4_, A1_50)
  if L2_51 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_.wanPort, A0_49, _UPVALUE2_.primaryDns, A1_50) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, A0_49
end
function secondaryDnsGet(A0_53)
  local L1_54
  L1_54 = _UPVALUE0_
  L1_54 = L1_54.NIL
  if A0_53 == L1_54 then
    L1_54 = _UPVALUE0_
    L1_54 = L1_54.INVALID_ARGUMENT
    return L1_54
  end
  if A0_53 ~= "WAN1" and A0_53 ~= "WAN2" then
    L1_54 = _UPVALUE0_
    L1_54 = L1_54.INVALID_ARGUMENT
    return L1_54
  end
  L1_54 = db
  L1_54 = L1_54.getAttribute
  L1_54 = L1_54(_UPVALUE1_, _UPVALUE2_.wanPort, A0_53, _UPVALUE2_.secondaryDns)
  if L1_54 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_53, L1_54
end
function secondaryDnsGetNext(A0_55)
  return _UPVALUE0_.NOT_SUPPORTED
end
function secondaryDnsSet(A0_56, A1_57)
  local L2_58, L3_59
  L3_59 = _UPVALUE0_
  L3_59 = L3_59.NIL
  if A0_56 == L3_59 then
    L3_59 = _UPVALUE0_
    L3_59 = L3_59.INVALID_ARGUMENT
    return L3_59
  end
  if A0_56 ~= "WAN1" and A0_56 ~= "WAN2" then
    L3_59 = _UPVALUE0_
    L3_59 = L3_59.INVALID_ARGUMENT
    return L3_59
  end
  L3_59 = db
  L3_59 = L3_59.getAttribute
  L3_59 = L3_59(_UPVALUE1_, _UPVALUE2_.wanPort, A0_56, _UPVALUE2_.getDnsFromIsp)
  if tonumber(L3_59) == 1 then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if tonumber(L3_59) == 0 and A1_57 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_58 = _UPVALUE3_.ipAddressCheck(_UPVALUE4_, A1_57)
  if L2_58 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_.wanPort, A0_56, _UPVALUE2_.secondaryDns, A1_57) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, A0_56
end
function reconnectModeGet(A0_60)
  local L1_61
  L1_61 = _UPVALUE0_
  L1_61 = L1_61.NIL
  if A0_60 == L1_61 then
    L1_61 = _UPVALUE0_
    L1_61 = L1_61.INVALID_ARGUMENT
    return L1_61
  end
  if A0_60 ~= "WAN1" and A0_60 ~= "WAN2" then
    L1_61 = _UPVALUE0_
    L1_61 = L1_61.INVALID_ARGUMENT
    return L1_61
  end
  L1_61 = db
  L1_61 = L1_61.getAttribute
  L1_61 = L1_61(_UPVALUE1_, _UPVALUE2_.wanPort, A0_60, _UPVALUE2_.reconnectMode)
  if L1_61 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_60, L1_61
end
function reconnectModeGetNext(A0_62)
  return _UPVALUE0_.NOT_SUPPORTED
end
function reconnectModeEnable(A0_63)
  if A0_63 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A0_63 ~= "WAN1" and A0_63 ~= "WAN2" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_.wanPort, A0_63, _UPVALUE2_.reconnectMode, _UPVALUE3_) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, A0_63
end
function reconnectModeDisable(A0_64)
  if A0_64 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A0_64 ~= "WAN1" and A0_64 ~= "WAN2" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_.wanPort, A0_64, _UPVALUE2_.reconnectMode, _UPVALUE3_) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, A0_64
end
function idleTimeOutValueGet(A0_65)
  local L1_66
  L1_66 = _UPVALUE0_
  L1_66 = L1_66.NIL
  if A0_65 == L1_66 then
    L1_66 = _UPVALUE0_
    L1_66 = L1_66.INVALID_ARGUMENT
    return L1_66
  end
  if A0_65 ~= "WAN1" and A0_65 ~= "WAN2" then
    L1_66 = _UPVALUE0_
    L1_66 = L1_66.INVALID_ARGUMENT
    return L1_66
  end
  L1_66 = db
  L1_66 = L1_66.getAttribute
  L1_66 = L1_66(_UPVALUE1_, _UPVALUE2_.wanPort, A0_65, _UPVALUE2_.idleTimeOutValue)
  if L1_66 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_65, L1_66
end
function idleTimeOutValueGetNext(A0_67)
  return _UPVALUE0_.NOT_SUPPORTED
end
function idleTimeOutValueSet(A0_68, A1_69)
  local L2_70, L3_71
  L3_71 = _UPVALUE0_
  L3_71 = L3_71.NIL
  if A0_68 == L3_71 then
    L3_71 = _UPVALUE0_
    L3_71 = L3_71.INVALID_ARGUMENT
    return L3_71
  end
  if A0_68 ~= "WAN1" and A0_68 ~= "WAN2" then
    L3_71 = _UPVALUE0_
    L3_71 = L3_71.INVALID_ARGUMENT
    return L3_71
  end
  L3_71 = db
  L3_71 = L3_71.getAttribute
  L3_71 = L3_71(_UPVALUE1_, _UPVALUE2_.wanPort, A0_68, _UPVALUE2_.reconnectMode)
  if tonumber(L3_71) == 0 then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if tonumber(L3_71) == 1 and A1_69 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_69) < 1 or tonumber(A1_69) > 10 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_.wanPort, A0_68, _UPVALUE2_.idleTimeOutValue, A1_69) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_68
  end
  return _UPVALUE0_.SUCCESS, A0_68
end
function authenticationOptionsGet(A0_72)
  local L1_73
  L1_73 = _UPVALUE0_
  L1_73 = L1_73.NIL
  if A0_72 == L1_73 then
    L1_73 = _UPVALUE0_
    L1_73 = L1_73.INVALID_ARGUMENT
    return L1_73
  end
  if A0_72 ~= "WAN1" and A0_72 ~= "WAN2" then
    L1_73 = _UPVALUE0_
    L1_73 = L1_73.INVALID_ARGUMENT
    return L1_73
  end
  L1_73 = db
  L1_73 = L1_73.getAttribute
  L1_73 = L1_73(_UPVALUE1_, _UPVALUE2_.wanPort, A0_72, _UPVALUE2_.authenticationOptions)
  if L1_73 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_72, L1_73
end
function authenticationOptionsGetNext(A0_74)
  return _UPVALUE0_.NOT_SUPPORTED
end
function authenticationOptionsSet(A0_75, A1_76)
  local L2_77
  if A0_75 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A0_75 ~= "WAN1" and A0_75 ~= "WAN2" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_76 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_76 ~= _UPVALUE1_ and A1_76 ~= _UPVALUE2_ and A1_76 ~= _UPVALUE3_ and A1_76 ~= _UPVALUE4_ and A1_76 ~= _UPVALUE5_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE6_, _UPVALUE7_.wanPort, A0_75, _UPVALUE7_.authenticationOptions, A1_76) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, A0_75
end
function isgetIPFromIsp2Enabled(A0_78)
  local L1_79
  L1_79 = _UPVALUE0_
  L1_79 = L1_79.NIL
  if A0_78 == L1_79 then
    L1_79 = _UPVALUE0_
    L1_79 = L1_79.INVALID_ARGUMENT
    return L1_79
  end
  if A0_78 ~= "WAN1" and A0_78 ~= "WAN2" then
    L1_79 = _UPVALUE0_
    L1_79 = L1_79.INVALID_ARGUMENT
    return L1_79
  end
  L1_79 = db
  L1_79 = L1_79.getAttribute
  L1_79 = L1_79(_UPVALUE1_, _UPVALUE2_.wanPort, A0_78, _UPVALUE2_.getIPFromIsp2)
  if L1_79 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_78, L1_79
end
function isgetIPFromIsp2EnabledNext(A0_80)
  return _UPVALUE0_.NOT_SUPPORTED
end
function getIPFromIsp2Enable(A0_81)
  if A0_81 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A0_81 ~= "WAN1" and A0_81 ~= "WAN2" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_.wanPort, A0_81, _UPVALUE2_.getIPFromIsp2, _UPVALUE3_) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, A0_81
end
function getIPFromIsp2Disable(A0_82)
  if A0_82 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A0_82 ~= "WAN1" and A0_82 ~= "WAN2" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_.wanPort, A0_82, _UPVALUE2_.getIPFromIsp2, _UPVALUE3_) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, A0_82
end
function ipAddress2Get(A0_83)
  local L1_84
  L1_84 = _UPVALUE0_
  L1_84 = L1_84.NIL
  if A0_83 == L1_84 then
    L1_84 = _UPVALUE0_
    L1_84 = L1_84.INVALID_ARGUMENT
    return L1_84
  end
  if A0_83 ~= "WAN1" and A0_83 ~= "WAN2" then
    L1_84 = _UPVALUE0_
    L1_84 = L1_84.INVALID_ARGUMENT
    return L1_84
  end
  L1_84 = db
  L1_84 = L1_84.getAttribute
  L1_84 = L1_84(_UPVALUE1_, _UPVALUE2_.wanPort, A0_83, _UPVALUE2_.ipAddress2)
  if L1_84 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_83, L1_84
end
function ipAddress2GetNext(A0_85)
  return _UPVALUE0_.NOT_SUPPORTED
end
function ipAddress2Set(A0_86, A1_87)
  local L2_88, L3_89
  L3_89 = _UPVALUE0_
  L3_89 = L3_89.NIL
  if A0_86 == L3_89 then
    L3_89 = _UPVALUE0_
    L3_89 = L3_89.INVALID_ARGUMENT
    return L3_89
  end
  if A0_86 ~= "WAN1" and A0_86 ~= "WAN2" then
    L3_89 = _UPVALUE0_
    L3_89 = L3_89.INVALID_ARGUMENT
    return L3_89
  end
  L3_89 = db
  L3_89 = L3_89.getAttribute
  L3_89 = L3_89(_UPVALUE1_, _UPVALUE2_.wanPort, A0_86, _UPVALUE2_.getIPFromIsp2)
  if tonumber(L3_89) == 1 then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if tonumber(L3_89) == 0 and A1_87 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_88 = _UPVALUE3_.ipAddressCheck(_UPVALUE4_, A1_87)
  if L2_88 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_.wanPort, A0_86, _UPVALUE2_.ipAddress2, A1_87) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, A0_86
end
function networkMask2Get(A0_90)
  local L1_91
  L1_91 = _UPVALUE0_
  L1_91 = L1_91.NIL
  if A0_90 == L1_91 then
    L1_91 = _UPVALUE0_
    L1_91 = L1_91.INVALID_ARGUMENT
    return L1_91
  end
  if A0_90 ~= "WAN1" and A0_90 ~= "WAN2" then
    L1_91 = _UPVALUE0_
    L1_91 = L1_91.INVALID_ARGUMENT
    return L1_91
  end
  L1_91 = db
  L1_91 = L1_91.getAttribute
  L1_91 = L1_91(_UPVALUE1_, _UPVALUE2_.wanPort, A0_90, _UPVALUE2_.networkMask2)
  if L1_91 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_90, L1_91
end
function networkMask2GetNext(A0_92)
  return _UPVALUE0_.NOT_SUPPORTED
end
function networkMask2Set(A0_93, A1_94)
  local L2_95, L3_96
  L3_96 = _UPVALUE0_
  L3_96 = L3_96.NIL
  if A0_93 == L3_96 then
    L3_96 = _UPVALUE0_
    L3_96 = L3_96.INVALID_ARGUMENT
    return L3_96
  end
  if A0_93 ~= "WAN1" and A0_93 ~= "WAN2" then
    L3_96 = _UPVALUE0_
    L3_96 = L3_96.INVALID_ARGUMENT
    return L3_96
  end
  L3_96 = db
  L3_96 = L3_96.getAttribute
  L3_96 = L3_96(_UPVALUE1_, _UPVALUE2_.wanPort, A0_93, _UPVALUE2_.getIPFromIsp2)
  if tonumber(L3_96) == 1 then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if tonumber(L3_96) == 0 and A1_94 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_95 = _UPVALUE3_.ipAddressCheck(_UPVALUE4_, A1_94)
  if L2_95 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_.wanPort, A0_93, _UPVALUE2_.networkMask2, A1_94) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_93
  end
  return _UPVALUE0_.SUCCESS, A0_93
end
function gateway2Get(A0_97)
  local L1_98
  L1_98 = _UPVALUE0_
  L1_98 = L1_98.NIL
  if A0_97 == L1_98 then
    L1_98 = _UPVALUE0_
    L1_98 = L1_98.INVALID_ARGUMENT
    return L1_98
  end
  if A0_97 ~= "WAN1" and A0_97 ~= "WAN2" then
    L1_98 = _UPVALUE0_
    L1_98 = L1_98.INVALID_ARGUMENT
    return L1_98
  end
  L1_98 = db
  L1_98 = L1_98.getAttribute
  L1_98 = L1_98(_UPVALUE1_, _UPVALUE2_.wanPort, A0_97, _UPVALUE2_.gateway2)
  if L1_98 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_97, L1_98
end
function gateway2GetNext(A0_99)
  return _UPVALUE0_.NOT_SUPPORTED
end
function gateway2Set(A0_100, A1_101)
  local L2_102, L3_103
  L3_103 = _UPVALUE0_
  L3_103 = L3_103.NIL
  if A0_100 == L3_103 then
    L3_103 = _UPVALUE0_
    L3_103 = L3_103.INVALID_ARGUMENT
    return L3_103
  end
  if A0_100 ~= "WAN1" and A0_100 ~= "WAN2" then
    L3_103 = _UPVALUE0_
    L3_103 = L3_103.INVALID_ARGUMENT
    return L3_103
  end
  L3_103 = db
  L3_103 = L3_103.getAttribute
  L3_103 = L3_103(_UPVALUE1_, _UPVALUE2_.wanPort, A0_100, _UPVALUE2_.getIPFromIsp2)
  if tonumber(L3_103) == 1 then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if tonumber(L3_103) == 0 and A1_101 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_102 = _UPVALUE3_.ipAddressCheck(_UPVALUE4_, A1_101)
  if L2_102 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_.wanPort, A0_100, _UPVALUE2_.gateway2, A1_101) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, A0_100
end
function isgetDnsFromIsp2Enabled(A0_104)
  local L1_105
  L1_105 = _UPVALUE0_
  L1_105 = L1_105.NIL
  if A0_104 == L1_105 then
    L1_105 = _UPVALUE0_
    L1_105 = L1_105.INVALID_ARGUMENT
    return L1_105
  end
  if A0_104 ~= "WAN1" and A0_104 ~= "WAN2" then
    L1_105 = _UPVALUE0_
    L1_105 = L1_105.INVALID_ARGUMENT
    return L1_105
  end
  L1_105 = db
  L1_105 = L1_105.getAttribute
  L1_105 = L1_105(_UPVALUE1_, _UPVALUE2_.wanPort, A0_104, _UPVALUE2_.getDnsFromIsp2)
  if L1_105 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_104, L1_105
end
function isgetDnsFromIsp2EnabledNext(A0_106)
  return _UPVALUE0_.NOT_SUPPORTED
end
function getDnsFromIsp2Enable(A0_107)
  if A0_107 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A0_107 ~= "WAN1" and A0_107 ~= "WAN2" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_.wanPort, A0_107, _UPVALUE2_.getDnsFromIsp2, _UPVALUE3_) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, A0_107
end
function getDnsFromIsp2Disable(A0_108)
  if A0_108 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A0_108 ~= "WAN1" and A0_108 ~= "WAN2" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_.wanPort, A0_108, _UPVALUE2_.getDnsFromIsp2, _UPVALUE3_) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, A0_108
end
function primaryDns2Get(A0_109)
  local L1_110
  L1_110 = _UPVALUE0_
  L1_110 = L1_110.NIL
  if A0_109 == L1_110 then
    L1_110 = _UPVALUE0_
    L1_110 = L1_110.INVALID_ARGUMENT
    return L1_110
  end
  if A0_109 ~= "WAN1" and A0_109 ~= "WAN2" then
    L1_110 = _UPVALUE0_
    L1_110 = L1_110.INVALID_ARGUMENT
    return L1_110
  end
  L1_110 = db
  L1_110 = L1_110.getAttribute
  L1_110 = L1_110(_UPVALUE1_, _UPVALUE2_.wanPort, A0_109, _UPVALUE2_.primaryDns2)
  if L1_110 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_109, L1_110
end
function primaryDns2GetNext(A0_111)
  return _UPVALUE0_.NOT_SUPPORTED
end
function primaryDns2Set(A0_112, A1_113)
  local L2_114, L3_115
  L3_115 = _UPVALUE0_
  L3_115 = L3_115.NIL
  if A0_112 == L3_115 then
    L3_115 = _UPVALUE0_
    L3_115 = L3_115.INVALID_ARGUMENT
    return L3_115
  end
  if A0_112 ~= "WAN1" and A0_112 ~= "WAN2" then
    L3_115 = _UPVALUE0_
    L3_115 = L3_115.INVALID_ARGUMENT
    return L3_115
  end
  L3_115 = db
  L3_115 = L3_115.getAttribute
  L3_115 = L3_115(_UPVALUE1_, _UPVALUE2_.wanPort, A0_112, _UPVALUE2_.getDnsFromIsp2)
  if tonumber(L3_115) == 1 then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if tonumber(L3_115) == 0 and A1_113 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_114 = _UPVALUE3_.ipAddressCheck(_UPVALUE4_, A1_113)
  if L2_114 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_.wanPort, A0_112, _UPVALUE2_.primaryDns2, A1_113) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, A0_112
end
function secondaryDns2Get(A0_116)
  local L1_117
  L1_117 = _UPVALUE0_
  L1_117 = L1_117.NIL
  if A0_116 == L1_117 then
    L1_117 = _UPVALUE0_
    L1_117 = L1_117.INVALID_ARGUMENT
    return L1_117
  end
  if A0_116 ~= "WAN1" and A0_116 ~= "WAN2" then
    L1_117 = _UPVALUE0_
    L1_117 = L1_117.INVALID_ARGUMENT
    return L1_117
  end
  L1_117 = db
  L1_117 = L1_117.getAttribute
  L1_117 = L1_117(_UPVALUE1_, _UPVALUE2_.wanPort, A0_116, _UPVALUE2_.secondaryDns2)
  if L1_117 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_116, L1_117
end
function secondaryDns2GetNext(A0_118)
  return _UPVALUE0_.NOT_SUPPORTED
end
function secondaryDns2Set(A0_119, A1_120)
  local L2_121, L3_122
  L3_122 = _UPVALUE0_
  L3_122 = L3_122.NIL
  if A0_119 == L3_122 then
    L3_122 = _UPVALUE0_
    L3_122 = L3_122.INVALID_ARGUMENT
    return L3_122
  end
  if A0_119 ~= "WAN1" and A0_119 ~= "WAN2" then
    L3_122 = _UPVALUE0_
    L3_122 = L3_122.INVALID_ARGUMENT
    return L3_122
  end
  L3_122 = db
  L3_122 = L3_122.getAttribute
  L3_122 = L3_122(_UPVALUE1_, _UPVALUE2_.wanPort, A0_119, _UPVALUE2_.getDnsFromIsp2)
  if tonumber(L3_122) == 1 then
    return _UPVALUE0_.DEPENDENCY_NOT_MET
  end
  if tonumber(L3_122) == 0 and A1_120 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_121 = _UPVALUE3_.ipAddressCheck(_UPVALUE4_, A1_120)
  if L2_121 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE1_, _UPVALUE2_.wanPort, A0_119, _UPVALUE2_.secondaryDns2, A1_120) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, A0_119
end
function russiaPPPoEConnectionGet(A0_123)
  local L1_124, L2_125, L3_126, L4_127, L5_128, L6_129, L7_130, L8_131, L9_132, L10_133, L11_134, L12_135, L13_136, L14_137, L15_138, L16_139, L17_140, L18_141, L19_142, L20_143
  L1_124 = _UPVALUE0_
  L1_124 = L1_124.NIL
  if A0_123 == L1_124 then
    L1_124 = _UPVALUE0_
    L1_124 = L1_124.INVALID_ARGUMENT
    return L1_124
  end
  if A0_123 ~= "WAN1" and A0_123 ~= "WAN2" then
    L1_124 = _UPVALUE0_
    L1_124 = L1_124.INVALID_ARGUMENT
    return L1_124
  end
  L1_124 = db
  L1_124 = L1_124.getRowWhere
  L2_125 = _UPVALUE1_
  L3_126 = _UPVALUE2_
  L3_126 = L3_126.wanPort
  L4_127 = " = '"
  L5_128 = A0_123
  L6_129 = "'"
  L3_126 = L3_126 .. L4_127 .. L5_128 .. L6_129
  L1_124 = L1_124(L2_125, L3_126)
  L2_125 = _UPVALUE0_
  L2_125 = L2_125.NIL
  if L1_124 == L2_125 then
    L2_125 = _UPVALUE0_
    L2_125 = L2_125.FAILURE
    return L2_125
  end
  L2_125 = _UPVALUE1_
  L3_126 = "."
  L4_127 = _UPVALUE2_
  L4_127 = L4_127.getIPFromIsp
  L2_125 = L2_125 .. L3_126 .. L4_127
  L2_125 = L1_124[L2_125]
  L3_126 = _UPVALUE1_
  L4_127 = "."
  L5_128 = _UPVALUE2_
  L5_128 = L5_128.ipAddress
  L3_126 = L3_126 .. L4_127 .. L5_128
  L3_126 = L1_124[L3_126]
  L4_127 = _UPVALUE1_
  L5_128 = "."
  L6_129 = _UPVALUE2_
  L6_129 = L6_129.networkMask
  L4_127 = L4_127 .. L5_128 .. L6_129
  L4_127 = L1_124[L4_127]
  L5_128 = _UPVALUE1_
  L6_129 = "."
  L7_130 = _UPVALUE2_
  L7_130 = L7_130.userName
  L5_128 = L5_128 .. L6_129 .. L7_130
  L5_128 = L1_124[L5_128]
  L6_129 = _UPVALUE1_
  L7_130 = "."
  L8_131 = _UPVALUE2_
  L8_131 = L8_131.password
  L6_129 = L6_129 .. L7_130 .. L8_131
  L6_129 = L1_124[L6_129]
  L7_130 = _UPVALUE1_
  L8_131 = "."
  L9_132 = _UPVALUE2_
  L9_132 = L9_132.service
  L7_130 = L7_130 .. L8_131 .. L9_132
  L7_130 = L1_124[L7_130]
  L8_131 = _UPVALUE1_
  L9_132 = "."
  L10_133 = _UPVALUE2_
  L10_133 = L10_133.getDnsFromIsp
  L8_131 = L8_131 .. L9_132 .. L10_133
  L8_131 = L1_124[L8_131]
  L9_132 = _UPVALUE1_
  L10_133 = "."
  L11_134 = _UPVALUE2_
  L11_134 = L11_134.primaryDns
  L9_132 = L9_132 .. L10_133 .. L11_134
  L9_132 = L1_124[L9_132]
  L10_133 = _UPVALUE1_
  L11_134 = "."
  L12_135 = _UPVALUE2_
  L12_135 = L12_135.secondaryDns
  L10_133 = L10_133 .. L11_134 .. L12_135
  L10_133 = L1_124[L10_133]
  L11_134 = _UPVALUE1_
  L12_135 = "."
  L13_136 = _UPVALUE2_
  L13_136 = L13_136.authenticationOptions
  L11_134 = L11_134 .. L12_135 .. L13_136
  L11_134 = L1_124[L11_134]
  L12_135 = _UPVALUE1_
  L13_136 = "."
  L14_137 = _UPVALUE2_
  L14_137 = L14_137.getIPFromIsp2
  L12_135 = L12_135 .. L13_136 .. L14_137
  L12_135 = L1_124[L12_135]
  L13_136 = _UPVALUE1_
  L14_137 = "."
  L15_138 = _UPVALUE2_
  L15_138 = L15_138.ipAddress2
  L13_136 = L13_136 .. L14_137 .. L15_138
  L13_136 = L1_124[L13_136]
  L14_137 = _UPVALUE1_
  L15_138 = "."
  L16_139 = _UPVALUE2_
  L16_139 = L16_139.networkMask2
  L14_137 = L14_137 .. L15_138 .. L16_139
  L14_137 = L1_124[L14_137]
  L15_138 = _UPVALUE1_
  L16_139 = "."
  L17_140 = _UPVALUE2_
  L17_140 = L17_140.gateway2
  L15_138 = L15_138 .. L16_139 .. L17_140
  L15_138 = L1_124[L15_138]
  L16_139 = _UPVALUE1_
  L17_140 = "."
  L18_141 = _UPVALUE2_
  L18_141 = L18_141.getDnsFromIsp2
  L16_139 = L16_139 .. L17_140 .. L18_141
  L16_139 = L1_124[L16_139]
  L17_140 = _UPVALUE1_
  L18_141 = "."
  L19_142 = _UPVALUE2_
  L19_142 = L19_142.primaryDns2
  L17_140 = L17_140 .. L18_141 .. L19_142
  L17_140 = L1_124[L17_140]
  L18_141 = _UPVALUE1_
  L19_142 = "."
  L20_143 = _UPVALUE2_
  L20_143 = L20_143.secondaryDns2
  L18_141 = L18_141 .. L19_142 .. L20_143
  L18_141 = L1_124[L18_141]
  L19_142 = _UPVALUE1_
  L20_143 = "."
  L19_142 = L19_142 .. L20_143 .. _UPVALUE2_.reconnectMode
  L19_142 = L1_124[L19_142]
  L20_143 = _UPVALUE1_
  L20_143 = L20_143 .. "." .. _UPVALUE2_.idleTimeOutValue
  L20_143 = L1_124[L20_143]
  return _UPVALUE0_.SUCCESS, A0_123, L2_125, L3_126, L4_127, L5_128, L6_129, L7_130, L8_131, L9_132, L10_133, L11_134, L12_135, L13_136, L14_137, L15_138, L16_139, L17_140, L18_141, L19_142, L20_143
end
function russiaPPPoEConnectionGetNext(A0_144)
  return _UPVALUE0_.NOT_SUPPORTED
end
function russiaPPPoEConnectionSet(A0_145, A1_146, A2_147, A3_148, A4_149, A5_150, A6_151, A7_152, A8_153, A9_154, A10_155, A11_156, A12_157, A13_158, A14_159, A15_160, A16_161, A17_162, A18_163, A19_164)
  local L20_165, L21_166, L22_167, L23_168, L24_169, L25_170
  L21_166 = _UPVALUE0_
  L21_166 = L21_166.NIL
  if A0_145 == L21_166 then
    L21_166 = _UPVALUE1_
    L21_166 = L21_166.RUSSIAN_WANPORT_NIL
    return L21_166
  end
  if A0_145 ~= "WAN1" and A0_145 ~= "WAN2" then
    L21_166 = _UPVALUE1_
    L21_166 = L21_166.RUSSIAN_INVALID_WANPORT
    return L21_166
  end
  L21_166 = _UPVALUE0_
  L21_166 = L21_166.NIL
  if A1_146 == L21_166 then
    L21_166 = _UPVALUE1_
    L21_166 = L21_166.RUSSIAN_GET_IP_FROM_ISP_NIL
    return L21_166
  end
  L21_166 = _UPVALUE2_
  L21_166 = L21_166.isBoolean
  L22_167 = A1_146
  L21_166 = L21_166(L22_167)
  L20_165 = L21_166
  L21_166 = _UPVALUE0_
  L21_166 = L21_166.SUCCESS
  if L20_165 ~= L21_166 then
    L21_166 = _UPVALUE1_
    L21_166 = L21_166.RUSSIAN_INVALID_GET_IP_FROM_ISP
    return L21_166
  end
  L21_166 = tonumber
  L22_167 = A1_146
  L21_166 = L21_166(L22_167)
  if L21_166 == 0 then
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.NIL
    if A2_147 == L21_166 then
      L21_166 = _UPVALUE1_
      L21_166 = L21_166.RUSSIAN_IP_NIL
      return L21_166
    end
  end
  L21_166 = tonumber
  L22_167 = A1_146
  L21_166 = L21_166(L22_167)
  if L21_166 == 1 then
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.NIL
    if A2_147 ~= L21_166 then
      L21_166 = _UPVALUE0_
      L21_166 = L21_166.DEPENDENCY_NOT_MET
      return L21_166
    end
  end
  L21_166 = _UPVALUE0_
  L21_166 = L21_166.NIL
  if A2_147 ~= L21_166 then
    L21_166 = _UPVALUE2_
    L21_166 = L21_166.ipAddressCheck
    L22_167 = _UPVALUE3_
    L23_168 = A2_147
    L21_166 = L21_166(L22_167, L23_168)
    L20_165 = L21_166
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.SUCCESS
    if L20_165 ~= L21_166 then
      L21_166 = _UPVALUE1_
      L21_166 = L21_166.RUSSIAN_INVALID_IP
      return L21_166
    end
  end
  L21_166 = tonumber
  L22_167 = A1_146
  L21_166 = L21_166(L22_167)
  if L21_166 == 1 then
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.NIL
    if A3_148 ~= L21_166 then
      L21_166 = _UPVALUE0_
      L21_166 = L21_166.DEPENDENCY_NOT_MET
      return L21_166
    end
  end
  L21_166 = tonumber
  L22_167 = A1_146
  L21_166 = L21_166(L22_167)
  if L21_166 == 0 then
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.NIL
    if A3_148 == L21_166 then
      L21_166 = _UPVALUE1_
      L21_166 = L21_166.RUSSIAN_NETMASK_NIL
      return L21_166
    end
  end
  L21_166 = _UPVALUE0_
  L21_166 = L21_166.NIL
  if A3_148 ~= L21_166 then
    L21_166 = _UPVALUE2_
    L21_166 = L21_166.ipAddressCheck
    L22_167 = _UPVALUE3_
    L23_168 = A3_148
    L21_166 = L21_166(L22_167, L23_168)
    L20_165 = L21_166
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.SUCCESS
    if L20_165 ~= L21_166 then
      L21_166 = _UPVALUE1_
      L21_166 = L21_166.RUSSIAN_INVALID_NETMASK
      return L21_166
    end
  end
  L21_166 = _UPVALUE0_
  L21_166 = L21_166.NIL
  if A2_147 ~= L21_166 then
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.NIL
    if A3_148 ~= L21_166 then
      L21_166 = staticIpSubnetCheck
      L22_167 = A0_145
      L23_168 = A2_147
      L24_169 = A3_148
      L21_166 = L21_166(L22_167, L23_168, L24_169)
      L20_165 = L21_166
      L21_166 = _UPVALUE0_
      L21_166 = L21_166.SUCCESS
      if L20_165 ~= L21_166 then
        return L20_165
      end
    end
  end
  L21_166 = _UPVALUE0_
  L21_166 = L21_166.NIL
  if A4_149 == L21_166 then
    L21_166 = _UPVALUE1_
    L21_166 = L21_166.RUSSIAN_USERNAME_NIL
    return L21_166
  end
  L21_166 = _UPVALUE0_
  L21_166 = L21_166.NIL
  if A5_150 == L21_166 then
    L21_166 = _UPVALUE1_
    L21_166 = L21_166.RUSSIAN_PWD_NIL
    return L21_166
  end
  L21_166 = _UPVALUE0_
  L21_166 = L21_166.NIL
  if A7_152 == L21_166 then
    L21_166 = _UPVALUE1_
    L21_166 = L21_166.RUSSIAN_GET_DNS_FROM_ISP_NIL
    return L21_166
  end
  L21_166 = _UPVALUE2_
  L21_166 = L21_166.isBoolean
  L22_167 = A7_152
  L21_166 = L21_166(L22_167)
  L20_165 = L21_166
  L21_166 = _UPVALUE0_
  L21_166 = L21_166.SUCCESS
  if L20_165 ~= L21_166 then
    L21_166 = _UPVALUE1_
    L21_166 = L21_166.RUSSIAN_INVALID_GET_DNS_FROM_ISP
    return L21_166
  end
  L21_166 = tonumber
  L22_167 = A7_152
  L21_166 = L21_166(L22_167)
  if L21_166 == 1 then
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.NIL
    if A8_153 ~= L21_166 then
      L21_166 = _UPVALUE0_
      L21_166 = L21_166.DEPENDENCY_NOT_MET
      return L21_166
    end
  end
  L21_166 = tonumber
  L22_167 = A7_152
  L21_166 = L21_166(L22_167)
  if L21_166 == 0 then
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.NIL
    if A8_153 == L21_166 then
      L21_166 = _UPVALUE1_
      L21_166 = L21_166.RUSSIAN_PRI_DNS_NIL
      return L21_166
    end
  end
  L21_166 = tonumber
  L22_167 = A7_152
  L21_166 = L21_166(L22_167)
  if L21_166 == 0 then
    L21_166 = _UPVALUE2_
    L21_166 = L21_166.ipAddressCheck
    L22_167 = _UPVALUE3_
    L23_168 = A8_153
    L21_166 = L21_166(L22_167, L23_168)
    L20_165 = L21_166
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.SUCCESS
    if L20_165 ~= L21_166 then
      L21_166 = _UPVALUE1_
      L21_166 = L21_166.RUSSIAN_INVALID_PRI_DNS
      return L21_166
    end
    L21_166 = _UPVALUE2_
    L21_166 = L21_166.ipAddressCheck
    L22_167 = _UPVALUE3_
    L23_168 = A9_154
    L21_166 = L21_166(L22_167, L23_168)
    L20_165 = L21_166
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.SUCCESS
    if L20_165 ~= L21_166 then
      L21_166 = _UPVALUE1_
      L21_166 = L21_166.RUSSIAN_INVALID_SEC_DNS
      return L21_166
    end
  end
  L21_166 = tonumber
  L22_167 = A7_152
  L21_166 = L21_166(L22_167)
  if L21_166 == 1 then
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.NIL
    if A9_154 ~= L21_166 then
      L21_166 = _UPVALUE0_
      L21_166 = L21_166.DEPENDENCY_NOT_MET
      return L21_166
    end
  end
  L21_166 = tonumber
  L22_167 = A7_152
  L21_166 = L21_166(L22_167)
  if L21_166 == 0 then
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.NIL
    if A9_154 == L21_166 then
      L21_166 = _UPVALUE1_
      L21_166 = L21_166.RUSSIAN_SEC_DNS_NIL
      return L21_166
    end
  end
  L21_166 = _UPVALUE0_
  L21_166 = L21_166.NIL
  if A11_156 == L21_166 then
    L21_166 = _UPVALUE1_
    L21_166 = L21_166.RUSSIAN_RECONNECT_MODE_NIL
    return L21_166
  end
  L21_166 = _UPVALUE2_
  L21_166 = L21_166.isBoolean
  L22_167 = A11_156
  L21_166 = L21_166(L22_167)
  L20_165 = L21_166
  L21_166 = _UPVALUE0_
  L21_166 = L21_166.SUCCESS
  if L20_165 ~= L21_166 then
    L21_166 = _UPVALUE1_
    L21_166 = L21_166.RUSSIAN_INVALID_RECONNECT_MODE
    return L21_166
  end
  L21_166 = tonumber
  L22_167 = A11_156
  L21_166 = L21_166(L22_167)
  if L21_166 == 1 then
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.NIL
    if A12_157 == L21_166 then
      L21_166 = _UPVALUE1_
      L21_166 = L21_166.RUSSIAN_IDLE_TIMEOUT_NIL
      return L21_166
    end
  end
  L21_166 = tonumber
  L22_167 = A11_156
  L21_166 = L21_166(L22_167)
  if L21_166 == 1 then
    L21_166 = tonumber
    L22_167 = A12_157
    L21_166 = L21_166(L22_167)
    if L21_166 < 1 or L21_166 > 10 then
      L22_167 = _UPVALUE1_
      L22_167 = L22_167.RUSSIAN_INVALID_IDLE_TIMEOUT_VAL
      return L22_167
    end
  end
  L21_166 = tonumber
  L22_167 = A11_156
  L21_166 = L21_166(L22_167)
  if L21_166 == 1 then
    L21_166 = idleTimeOutCheck
    L21_166 = L21_166()
    L22_167 = _UPVALUE0_
    L22_167 = L22_167.SUCCESS
    if L21_166 ~= L22_167 then
      return L21_166
    end
  end
  L21_166 = _UPVALUE0_
  L21_166 = L21_166.NIL
  if A10_155 == L21_166 then
    L21_166 = _UPVALUE1_
    L21_166 = L21_166.RUSSIAN_AUTH_OPT_NIL
    return L21_166
  end
  L21_166 = _UPVALUE4_
  if A10_155 ~= L21_166 then
    L21_166 = _UPVALUE5_
    if A10_155 ~= L21_166 then
      L21_166 = _UPVALUE6_
      if A10_155 ~= L21_166 then
        L21_166 = _UPVALUE7_
        if A10_155 ~= L21_166 then
          L21_166 = _UPVALUE8_
          if A10_155 ~= L21_166 then
            L21_166 = _UPVALUE1_
            L21_166 = L21_166.RUSSIAN_INVALID_AUTH_OPT
            return L21_166
          end
        end
      end
    end
  end
  L21_166 = _UPVALUE0_
  L21_166 = L21_166.NIL
  if A13_158 == L21_166 then
    L21_166 = _UPVALUE1_
    L21_166 = L21_166.RUSSIAN_GET_IP_FROM_ISP2_NIL
    return L21_166
  end
  L21_166 = _UPVALUE2_
  L21_166 = L21_166.isBoolean
  L22_167 = A13_158
  L21_166 = L21_166(L22_167)
  L20_165 = L21_166
  L21_166 = _UPVALUE0_
  L21_166 = L21_166.SUCCESS
  if L20_165 ~= L21_166 then
    L21_166 = _UPVALUE1_
    L21_166 = L21_166.RUSSIAN_INVALID_GET_IP_FROM_ISP2
    return L21_166
  end
  L21_166 = tonumber
  L22_167 = A13_158
  L21_166 = L21_166(L22_167)
  if L21_166 == 1 then
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.NIL
    if A14_159 ~= L21_166 then
      L21_166 = _UPVALUE0_
      L21_166 = L21_166.DEPENDENCY_NOT_MET
      return L21_166
    end
  end
  L21_166 = tonumber
  L22_167 = A13_158
  L21_166 = L21_166(L22_167)
  if L21_166 == 0 then
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.NIL
    if A14_159 == L21_166 then
      L21_166 = _UPVALUE1_
      L21_166 = L21_166.RUSSIAN_IP2_NIL
      return L21_166
    end
  end
  L21_166 = _UPVALUE0_
  L21_166 = L21_166.NIL
  if A14_159 ~= L21_166 then
    L21_166 = _UPVALUE2_
    L21_166 = L21_166.ipAddressCheck
    L22_167 = _UPVALUE3_
    L23_168 = A14_159
    L21_166 = L21_166(L22_167, L23_168)
    L20_165 = L21_166
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.SUCCESS
    if L20_165 ~= L21_166 then
      L21_166 = _UPVALUE1_
      L21_166 = L21_166.RUSSIAN_INVALID_IP2
      return L21_166
    end
  end
  L21_166 = tonumber
  L22_167 = A13_158
  L21_166 = L21_166(L22_167)
  if L21_166 == 1 then
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.NIL
    if A15_160 ~= L21_166 then
      L21_166 = _UPVALUE0_
      L21_166 = L21_166.DEPENDENCY_NOT_MET
      return L21_166
    end
  end
  L21_166 = tonumber
  L22_167 = A13_158
  L21_166 = L21_166(L22_167)
  if L21_166 == 0 then
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.NIL
    if A15_160 == L21_166 then
      L21_166 = _UPVALUE1_
      L21_166 = L21_166.RUSSIAN_NETMASK2_NIL
      return L21_166
    end
  end
  L21_166 = _UPVALUE0_
  L21_166 = L21_166.NIL
  if A15_160 ~= L21_166 then
    L21_166 = _UPVALUE2_
    L21_166 = L21_166.ipAddressCheck
    L22_167 = _UPVALUE3_
    L23_168 = A15_160
    L21_166 = L21_166(L22_167, L23_168)
    L20_165 = L21_166
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.SUCCESS
    if L20_165 ~= L21_166 then
      L21_166 = _UPVALUE1_
      L21_166 = L21_166.RUSSIAN_INVALID_NETMASK2
      return L21_166
    end
  end
  L21_166 = _UPVALUE0_
  L21_166 = L21_166.NIL
  if A14_159 ~= L21_166 then
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.NIL
    if A15_160 ~= L21_166 then
      L21_166 = staticIpSubnetCheck
      L22_167 = A0_145
      L23_168 = A14_159
      L24_169 = A15_160
      L21_166 = L21_166(L22_167, L23_168, L24_169)
      L20_165 = L21_166
      L21_166 = _UPVALUE0_
      L21_166 = L21_166.SUCCESS
      if L20_165 ~= L21_166 then
        return L20_165
      end
    end
  end
  L21_166 = tonumber
  L22_167 = A13_158
  L21_166 = L21_166(L22_167)
  if L21_166 == 0 then
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.NIL
    if A16_161 == L21_166 then
      L21_166 = _UPVALUE1_
      L21_166 = L21_166.RUSSIAN_GW2_NIL
      return L21_166
    end
  end
  L21_166 = _UPVALUE0_
  L21_166 = L21_166.NIL
  if A16_161 ~= L21_166 then
    L21_166 = _UPVALUE2_
    L21_166 = L21_166.ipAddressCheck
    L22_167 = _UPVALUE3_
    L23_168 = A16_161
    L21_166 = L21_166(L22_167, L23_168)
    L20_165 = L21_166
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.SUCCESS
    if L20_165 ~= L21_166 then
      L21_166 = _UPVALUE0_
      L22_167 = pppoe
      L22_167 = L22_167.RUSSIAN_INVALID_GW2
      L21_166 = L21_166 - L22_167
      return L21_166
    end
  end
  L21_166 = _UPVALUE0_
  L21_166 = L21_166.NIL
  if A17_162 == L21_166 then
    L21_166 = _UPVALUE1_
    L21_166 = L21_166.RUSSIAN_GET_DNS_FROM_ISP2_NIL
    return L21_166
  end
  L21_166 = _UPVALUE2_
  L21_166 = L21_166.isBoolean
  L22_167 = A17_162
  L21_166 = L21_166(L22_167)
  L20_165 = L21_166
  L21_166 = _UPVALUE0_
  L21_166 = L21_166.SUCCESS
  if L20_165 ~= L21_166 then
    L21_166 = _UPVALUE1_
    L21_166 = L21_166.RUSSIAN_INVALID_GET_DNS_FROM_ISP2
    return L21_166
  end
  L21_166 = tonumber
  L22_167 = A17_162
  L21_166 = L21_166(L22_167)
  if L21_166 == 1 then
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.NIL
    if A18_163 ~= L21_166 then
      L21_166 = _UPVALUE0_
      L21_166 = L21_166.DEPENDENCY_NOT_MET
      return L21_166
    end
  end
  L21_166 = tonumber
  L22_167 = A17_162
  L21_166 = L21_166(L22_167)
  if L21_166 == 0 then
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.NIL
    if A18_163 == L21_166 then
      L21_166 = _UPVALUE1_
      L21_166 = L21_166.RUSSIAN_PRI_DNS2_NIL
      return L21_166
    end
  end
  L21_166 = _UPVALUE0_
  L21_166 = L21_166.NIL
  if A18_163 ~= L21_166 then
    L21_166 = _UPVALUE2_
    L21_166 = L21_166.ipAddressCheck
    L22_167 = _UPVALUE3_
    L23_168 = A18_163
    L21_166 = L21_166(L22_167, L23_168)
    L20_165 = L21_166
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.SUCCESS
    if L20_165 ~= L21_166 then
      L21_166 = _UPVALUE1_
      L21_166 = L21_166.RUSSIAN_INVALID_PRI_DNS2
      return L21_166
    end
  end
  L21_166 = tonumber
  L22_167 = A17_162
  L21_166 = L21_166(L22_167)
  if L21_166 == 1 then
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.NIL
    if A19_164 ~= L21_166 then
      L21_166 = _UPVALUE0_
      L21_166 = L21_166.DEPENDENCY_NOT_MET
      return L21_166
    end
  end
  L21_166 = tonumber
  L22_167 = A17_162
  L21_166 = L21_166(L22_167)
  if L21_166 == 0 then
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.NIL
    if A19_164 == L21_166 then
      L21_166 = _UPVALUE1_
      L21_166 = L21_166.RUSSIAN_SEC_DNS2_NIL
      return L21_166
    end
  end
  L21_166 = _UPVALUE0_
  L21_166 = L21_166.NIL
  if A19_164 ~= L21_166 then
    L21_166 = _UPVALUE2_
    L21_166 = L21_166.ipAddressCheck
    L22_167 = _UPVALUE3_
    L23_168 = A19_164
    L21_166 = L21_166(L22_167, L23_168)
    L20_165 = L21_166
    L21_166 = _UPVALUE0_
    L21_166 = L21_166.SUCCESS
    if L20_165 ~= L21_166 then
      L21_166 = _UPVALUE1_
      L21_166 = L21_166.RUSSIAN_INVALID_SEC_DNS2
      return L21_166
    end
  end
  L21_166 = {}
  L22_167 = _UPVALUE9_
  L23_168 = "."
  L24_169 = _UPVALUE10_
  L24_169 = L24_169.getIPFromIsp
  L22_167 = L22_167 .. L23_168 .. L24_169
  L21_166[L22_167] = A1_146
  L22_167 = _UPVALUE9_
  L23_168 = "."
  L24_169 = _UPVALUE10_
  L24_169 = L24_169.ipAddress
  L22_167 = L22_167 .. L23_168 .. L24_169
  L21_166[L22_167] = A2_147
  L22_167 = _UPVALUE9_
  L23_168 = "."
  L24_169 = _UPVALUE10_
  L24_169 = L24_169.networkMask
  L22_167 = L22_167 .. L23_168 .. L24_169
  L21_166[L22_167] = A3_148
  L22_167 = _UPVALUE9_
  L23_168 = "."
  L24_169 = _UPVALUE10_
  L24_169 = L24_169.userName
  L22_167 = L22_167 .. L23_168 .. L24_169
  L21_166[L22_167] = A4_149
  L22_167 = util
  L22_167 = L22_167.mask
  L23_168 = A5_150
  L22_167 = L22_167(L23_168)
  if L22_167 ~= A5_150 then
    L23_168 = _UPVALUE9_
    L24_169 = "."
    L25_170 = _UPVALUE10_
    L25_170 = L25_170.password
    L23_168 = L23_168 .. L24_169 .. L25_170
    L21_166[L23_168] = A5_150
  end
  L23_168 = _UPVALUE9_
  L24_169 = "."
  L25_170 = _UPVALUE10_
  L25_170 = L25_170.service
  L23_168 = L23_168 .. L24_169 .. L25_170
  L21_166[L23_168] = A6_151
  L23_168 = _UPVALUE9_
  L24_169 = "."
  L25_170 = _UPVALUE10_
  L25_170 = L25_170.getDnsFromIsp
  L23_168 = L23_168 .. L24_169 .. L25_170
  L21_166[L23_168] = A7_152
  L23_168 = _UPVALUE9_
  L24_169 = "."
  L25_170 = _UPVALUE10_
  L25_170 = L25_170.primaryDns
  L23_168 = L23_168 .. L24_169 .. L25_170
  L21_166[L23_168] = A8_153
  L23_168 = _UPVALUE9_
  L24_169 = "."
  L25_170 = _UPVALUE10_
  L25_170 = L25_170.secondaryDns
  L23_168 = L23_168 .. L24_169 .. L25_170
  L21_166[L23_168] = A9_154
  L23_168 = _UPVALUE9_
  L24_169 = "."
  L25_170 = _UPVALUE10_
  L25_170 = L25_170.reconnectMode
  L23_168 = L23_168 .. L24_169 .. L25_170
  L21_166[L23_168] = A11_156
  L23_168 = _UPVALUE9_
  L24_169 = "."
  L25_170 = _UPVALUE10_
  L25_170 = L25_170.idleTimeOutValue
  L23_168 = L23_168 .. L24_169 .. L25_170
  L21_166[L23_168] = A12_157
  L23_168 = _UPVALUE9_
  L24_169 = "."
  L25_170 = _UPVALUE10_
  L25_170 = L25_170.authenticationOptions
  L23_168 = L23_168 .. L24_169 .. L25_170
  L21_166[L23_168] = A10_155
  L23_168 = _UPVALUE9_
  L24_169 = "."
  L25_170 = _UPVALUE10_
  L25_170 = L25_170.getIPFromIsp2
  L23_168 = L23_168 .. L24_169 .. L25_170
  L21_166[L23_168] = A13_158
  L23_168 = _UPVALUE9_
  L24_169 = "."
  L25_170 = _UPVALUE10_
  L25_170 = L25_170.ipAddress2
  L23_168 = L23_168 .. L24_169 .. L25_170
  L21_166[L23_168] = A14_159
  L23_168 = _UPVALUE9_
  L24_169 = "."
  L25_170 = _UPVALUE10_
  L25_170 = L25_170.networkMask2
  L23_168 = L23_168 .. L24_169 .. L25_170
  L21_166[L23_168] = A15_160
  L23_168 = _UPVALUE9_
  L24_169 = "."
  L25_170 = _UPVALUE10_
  L25_170 = L25_170.gateway2
  L23_168 = L23_168 .. L24_169 .. L25_170
  L21_166[L23_168] = A16_161
  L23_168 = _UPVALUE9_
  L24_169 = "."
  L25_170 = _UPVALUE10_
  L25_170 = L25_170.getDnsFromIsp2
  L23_168 = L23_168 .. L24_169 .. L25_170
  L21_166[L23_168] = A17_162
  L23_168 = _UPVALUE9_
  L24_169 = "."
  L25_170 = _UPVALUE10_
  L25_170 = L25_170.primaryDns2
  L23_168 = L23_168 .. L24_169 .. L25_170
  L21_166[L23_168] = A18_163
  L23_168 = _UPVALUE9_
  L24_169 = "."
  L25_170 = _UPVALUE10_
  L25_170 = L25_170.secondaryDns2
  L23_168 = L23_168 .. L24_169 .. L25_170
  L21_166[L23_168] = A19_164
  L23_168, L24_169, L25_170 = nil, nil, nil
  if A0_145 == "WAN1" then
    L23_168, L24_169, L25_170 = db.update(_UPVALUE9_, L21_166, 1)
  else
    L23_168, L24_169, L25_170 = db.update(_UPVALUE9_, L21_166, 2)
  end
  if L23_168 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_145
  end
  return _UPVALUE0_.SUCCESS, A0_145
end
function russiaPPPoEConnectionCreate(A0_171, A1_172, A2_173, A3_174, A4_175, A5_176, A6_177, A7_178, A8_179, A9_180, A10_181, A11_182, A12_183, A13_184, A14_185, A15_186, A16_187, A17_188)
  return _UPVALUE0_.NOT_SUPPORTED
end
function russiaPPPoEConnectionDelete(A0_189)
  return _UPVALUE0_.NOT_SUPPORTED
end
function staticIpSubnetCheck(A0_190, A1_191, A2_192)
  local L3_193, L4_194, L5_195, L6_196, L7_197, L8_198, L9_199, L10_200, L11_201, L12_202, L13_203, L14_204, L15_205, L16_206, L17_207, L18_208, L19_209
  L13_203 = _UPVALUE0_
  L14_204 = _UPVALUE1_
  L14_204 = L14_204.vlanGet
  L15_205 = L13_203
  L8_198, L10_200, L11_201, L12_202, L14_204 = nil, nil, nil, nil, L14_204(L15_205)
  L8_198, L10_200, L11_201, L12_202, L15_205 = nil, nil, nil, nil, L14_204(L15_205)
  L8_198, L10_200, L11_201, L12_202, L16_206 = nil, nil, nil, nil, L14_204(L15_205)
  L8_198, L10_200, L11_201, L12_202, L17_207 = nil, nil, nil, nil, L14_204(L15_205)
  L8_198, L10_200, L11_201, L12_202, L18_208 = nil, nil, nil, nil, L14_204(L15_205)
  L8_198, L10_200, L11_201, L12_202, L19_209 = nil, nil, nil, nil, L14_204(L15_205)
  L4_194 = L19_209
  L7_197 = L18_208
  L6_196 = L17_207
  L5_195 = L16_206
  L9_199 = L15_205
  L3_193 = L14_204
  L14_204 = _UPVALUE2_
  L14_204 = L14_204.SUCCESS
  if L3_193 ~= L14_204 then
    L14_204 = _UPVALUE3_
    L14_204 = L14_204.SUBNET_CHECK_FAILED
    return L14_204
  end
  L14_204 = _UPVALUE4_
  L14_204 = L14_204.ipv4DualMaskCheck
  L15_205 = L4_194
  L16_206 = L8_198
  L17_207 = A1_191
  L18_208 = A2_192
  L14_204 = L14_204(L15_205, L16_206, L17_207, L18_208)
  L3_193 = L14_204
  L14_204 = _UPVALUE2_
  L14_204 = L14_204.SUCCESS
  if L3_193 == L14_204 then
    L14_204 = _UPVALUE3_
    L14_204 = L14_204.SAME_SUBNET_LAN
    return L14_204
  end
  L14_204 = _UPVALUE1_
  L14_204 = L14_204.vlanGetNext
  L15_205 = L9_199
  L8_198, L10_200, L11_201, L12_202, L19_209 = L14_204(L15_205)
  L4_194 = L19_209
  L7_197 = L18_208
  L6_196 = L17_207
  L5_195 = L16_206
  L9_199 = L15_205
  L3_193 = L14_204
  while true do
    L14_204 = _UPVALUE2_
    L14_204 = L14_204.NEXT_ROWID_INVALID
    if L3_193 ~= L14_204 then
      L14_204 = _UPVALUE2_
      L14_204 = L14_204.SUCCESS
      if L3_193 ~= L14_204 then
        L14_204 = _UPVALUE3_
        L14_204 = L14_204.SUBNET_CHECK_FAILED
        return L14_204
      end
      L14_204 = _UPVALUE4_
      L14_204 = L14_204.ipv4DualMaskCheck
      L15_205 = L4_194
      L16_206 = L8_198
      L17_207 = A1_191
      L18_208 = A2_192
      L14_204 = L14_204(L15_205, L16_206, L17_207, L18_208)
      L3_193 = L14_204
      L14_204 = _UPVALUE2_
      L14_204 = L14_204.SUCCESS
      if L3_193 == L14_204 then
        L14_204 = _UPVALUE3_
        L14_204 = L14_204.SAME_SUBNET_VLAN
        return L14_204
      end
      L14_204 = _UPVALUE1_
      L14_204 = L14_204.vlanGetNext
      L15_205 = L9_199
      L8_198, L10_200, L11_201, L12_202, L19_209 = L14_204(L15_205)
      L4_194 = L19_209
      L7_197 = L18_208
      L6_196 = L17_207
      L5_195 = L16_206
      L9_199 = L15_205
      L3_193 = L14_204
    end
  end
  L14_204 = db
  L14_204 = L14_204.getAttribute
  L15_205 = _UPVALUE5_
  L16_206 = _UPVALUE6_
  L16_206 = L16_206.dmz_interface
  L17_207 = _UPVALUE7_
  L18_208 = _UPVALUE6_
  L18_208 = L18_208.dmz_ip
  L14_204 = L14_204(L15_205, L16_206, L17_207, L18_208)
  L15_205 = db
  L15_205 = L15_205.getAttribute
  L16_206 = _UPVALUE5_
  L17_207 = _UPVALUE6_
  L17_207 = L17_207.dmz_interface
  L18_208 = _UPVALUE7_
  L19_209 = _UPVALUE6_
  L19_209 = L19_209.dmz_netmask
  L15_205 = L15_205(L16_206, L17_207, L18_208, L19_209)
  L16_206 = _UPVALUE2_
  L16_206 = L16_206.NIL
  if L14_204 ~= L16_206 then
    L16_206 = _UPVALUE8_
    if L14_204 ~= L16_206 then
      L16_206 = _UPVALUE2_
      L16_206 = L16_206.NIL
      if L15_205 ~= L16_206 then
        L16_206 = _UPVALUE8_
        if L15_205 ~= L16_206 then
          L16_206 = _UPVALUE4_
          L16_206 = L16_206.ipv4DualMaskCheck
          L17_207 = L14_204
          L18_208 = L15_205
          L19_209 = A1_191
          L16_206 = L16_206(L17_207, L18_208, L19_209, A2_192)
          L3_193 = L16_206
          L16_206 = _UPVALUE2_
          L16_206 = L16_206.SUCCESS
          if L3_193 == L16_206 then
            L16_206 = _UPVALUE3_
            L16_206 = L16_206.SAME_SUBNET_DMZ
            return L16_206
          end
        end
      end
    end
  end
  L16_206 = UNIT_NAME
  if L16_206 ~= "DSR-1000N" then
    L16_206 = UNIT_NAME
    if L16_206 ~= "DSR-1000" then
      L16_206 = UNIT_NAME
      if L16_206 ~= "DSR-500N" then
        L16_206 = UNIT_NAME
        if L16_206 ~= "DSR-500" then
          L16_206 = PRODUCT_ID
          if L16_206 ~= "DSR-1000AC_Ax" then
            L16_206 = PRODUCT_ID
            if L16_206 ~= "DSR-500AC_Ax" then
              L16_206 = PRODUCT_ID
              if L16_206 ~= "DSR-1000_Bx" then
                L16_206 = PRODUCT_ID
              end
            end
          end
        end
      end
    end
  elseif L16_206 == "DSR-500_Bx" then
    L16_206 = _UPVALUE4_
    L16_206 = L16_206.checkOpenVpnSubnetRange
    L17_207 = A1_191
    L18_208 = A2_192
    L16_206 = L16_206(L17_207, L18_208)
    L3_193 = L16_206
    L16_206 = _UPVALUE2_
    L16_206 = L16_206.SUCCESS
    if L3_193 == L16_206 then
      L16_206 = _UPVALUE2_
      L16_206 = L16_206.OPENVPN_ALREADY_CONFIGURED
      return L16_206
    end
  end
  L16_206 = _UPVALUE4_
  L16_206 = L16_206.ipv4DualMaskCheck
  L17_207 = _UPVALUE9_
  L18_208 = _UPVALUE10_
  L19_209 = A1_191
  L16_206 = L16_206(L17_207, L18_208, L19_209, A2_192)
  L3_193 = L16_206
  L16_206 = _UPVALUE2_
  L16_206 = L16_206.SUCCESS
  if L3_193 == L16_206 then
    L16_206 = _UPVALUE3_
    L16_206 = L16_206.SAME_SUBNET_LOCAL_IP
    return L16_206
  end
  L16_206 = db
  L16_206 = L16_206.getAttribute
  L17_207 = _UPVALUE11_
  L18_208 = _UPVALUE12_
  L19_209 = "1"
  L16_206 = L16_206(L17_207, L18_208, L19_209, _UPVALUE6_.ipsec_startIPAddress)
  L17_207 = db
  L17_207 = L17_207.getAttribute
  L18_208 = _UPVALUE11_
  L19_209 = _UPVALUE12_
  L17_207 = L17_207(L18_208, L19_209, "1", _UPVALUE6_.ipsec_subnetMask)
  L18_208 = _UPVALUE2_
  L18_208 = L18_208.NIL
  if L16_206 ~= L18_208 then
    L18_208 = _UPVALUE8_
    if L16_206 ~= L18_208 then
      L18_208 = _UPVALUE2_
      L18_208 = L18_208.NIL
      if L17_207 ~= L18_208 then
        L18_208 = _UPVALUE8_
        if L17_207 ~= L18_208 then
          L18_208 = _UPVALUE4_
          L18_208 = L18_208.ipv4DualMaskCheck
          L19_209 = L16_206
          L18_208 = L18_208(L19_209, L17_207, A1_191, A2_192)
          L3_193 = L18_208
          L18_208 = _UPVALUE2_
          L18_208 = L18_208.SUCCESS
          if L3_193 == L18_208 then
            L18_208 = _UPVALUE3_
            L18_208 = L18_208.SAME_SUBNET_IPSEC
            return L18_208
          end
        end
      end
    end
  end
  L18_208 = _UPVALUE13_
  if A0_190 == L18_208 then
    L18_208 = db
    L18_208 = L18_208.getAttributeWhere
    L19_209 = _UPVALUE14_
    L18_208 = L18_208(L19_209, _UPVALUE6_.interfaceName .. " = '" .. _UPVALUE15_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE16_, _UPVALUE6_.wan_ipAddress)
    L19_209 = db
    L19_209 = L19_209.getAttributeWhere
    L19_209 = L19_209(_UPVALUE14_, _UPVALUE6_.interfaceName .. " = '" .. _UPVALUE15_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE16_, _UPVALUE6_.wan_subnet)
    if L18_208 ~= _UPVALUE2_.NIL and L18_208 ~= _UPVALUE8_ and L19_209 ~= _UPVALUE2_.NIL and L19_209 ~= _UPVALUE8_ then
      L3_193 = _UPVALUE4_.ipv4DualMaskCheck(L18_208, L19_209, A1_191, A2_192)
      if L3_193 == _UPVALUE2_.SUCCESS then
        return _UPVALUE3_.SAME_SUBNET_WAN2
      end
    end
  end
  L18_208 = _UPVALUE15_
  if A0_190 == L18_208 then
    L18_208 = db
    L18_208 = L18_208.getAttributeWhere
    L19_209 = _UPVALUE14_
    L18_208 = L18_208(L19_209, _UPVALUE6_.interfaceName .. " = '" .. _UPVALUE13_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE16_, _UPVALUE6_.wan_ipAddress)
    L19_209 = db
    L19_209 = L19_209.getAttributeWhere
    L19_209 = L19_209(_UPVALUE14_, _UPVALUE6_.interfaceName .. " = '" .. _UPVALUE13_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE16_, _UPVALUE6_.wan_subnet)
    if L18_208 ~= _UPVALUE2_.NIL and L18_208 ~= _UPVALUE8_ and L19_209 ~= _UPVALUE2_.NIL and L19_209 ~= _UPVALUE8_ then
      L3_193 = _UPVALUE4_.ipv4DualMaskCheck(L18_208, L19_209, A1_191, A2_192)
      if L3_193 == _UPVALUE2_.SUCCESS then
        return _UPVALUE3_.SAME_SUBNET_WAN1
      end
    end
  end
  L18_208 = _UPVALUE2_
  L18_208 = L18_208.SUCCESS
  return L18_208
end
function idleTimeOutCheck()
  if db.getAttribute(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.multiWanMode) == _UPVALUE3_.NIL then
    return _UPVALUE4_.IDLE_TIMEOUT_CHECK_FAILED
  end
  if db.getAttribute(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.multiWanMode) == _UPVALUE5_ or db.getAttribute(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.multiWanMode) == _UPVALUE6_ then
    return _UPVALUE4_.WAN_IN_LOAD_BALANCE
  end
  return _UPVALUE3_.SUCCESS
end
