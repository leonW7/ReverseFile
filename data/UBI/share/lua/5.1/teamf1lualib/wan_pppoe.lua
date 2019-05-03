local L0_0
L0_0 = module
L0_0("com.teamf1.core.wan.pppoe", package.seeall)
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
;({}).domainName = "DomainName"
;({}).getDnsFromIsp = "GetDnsFromIsp"
;({}).primaryDns = "PrimaryDns"
;({}).secondaryDns = "SecondaryDns"
;({}).status = "Status"
;({}).reconnectMode = "IdleTimeOutFlag"
;({}).idleTimeOutValue = "IdleTimeOutValue"
;({}).service = "Service"
;({}).authenticationOptions = "AuthOpt"
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
function isgetIPFromIspEnabled()
  local L0_7
  L0_7 = db
  L0_7 = L0_7.getAttribute
  L0_7 = L0_7(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.getIPFromIsp)
  if L0_7 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_7
end
function isgetIPFromIspEnabledNext()
  local L0_8
  L0_8 = db
  L0_8 = L0_8.getAttribute
  L0_8 = L0_8(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.getIPFromIsp)
  if L0_8 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_8
end
function getIPFromIspEnable(A0_9)
  if tonumber(A0_9) ~= _UPVALUE0_ and tonumber(A0_9) ~= _UPVALUE1_ then
    return _UPVALUE2_.INVALID_ARGUMENT, A0_9
  end
  if db.setAttribute(_UPVALUE3_, "_ROWID_", A0_9, _UPVALUE4_.getIPFromIsp, _UPVALUE5_) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_9
  end
  return _UPVALUE2_.SUCCESS, A0_9
end
function getIPFromIspDisable(A0_10)
  if tonumber(A0_10) ~= _UPVALUE0_ and tonumber(A0_10) ~= _UPVALUE1_ then
    return _UPVALUE2_.INVALID_ARGUMENT, A0_10
  end
  if db.setAttribute(_UPVALUE3_, "_ROWID_", A0_10, _UPVALUE4_.getIPFromIsp, _UPVALUE5_) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_10
  end
  return _UPVALUE2_.SUCCESS, A0_10
end
function ipAddressGet()
  local L0_11
  L0_11 = db
  L0_11 = L0_11.getAttribute
  L0_11 = L0_11(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.ipAddress)
  if L0_11 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_11
end
function ipAddressGetNext()
  local L0_12
  L0_12 = db
  L0_12 = L0_12.getAttribute
  L0_12 = L0_12(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.ipAddress)
  if L0_12 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_12
end
function ipAddressSet(A0_13, A1_14)
  local L2_15
  L2_15 = tonumber
  L2_15 = L2_15(A0_13)
  if L2_15 ~= _UPVALUE0_ then
    L2_15 = tonumber
    L2_15 = L2_15(A0_13)
    if L2_15 ~= _UPVALUE1_ then
      L2_15 = _UPVALUE2_
      L2_15 = L2_15.INVALID_ARGUMENT
      return L2_15, A0_13
    end
  end
  L2_15 = db
  L2_15 = L2_15.getAttribute
  L2_15 = L2_15(_UPVALUE3_, "_ROWID_", A0_13, _UPVALUE4_.getIPFromIsp)
  if tonumber(L2_15) == 1 then
    return _UPVALUE2_.DEPENDENCY_NOT_MET
  end
  if tonumber(L2_15) == 0 and A1_14 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  valid = _UPVALUE5_.ipAddressCheck(2, A1_14)
  if valid ~= _UPVALUE2_.SUCCESS then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE3_, "_ROWID_", A0_13, _UPVALUE4_.ipAddress, A1_14) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_13
  end
  return _UPVALUE2_.SUCCESS, A0_13
end
function networkMaskGet()
  local L0_16
  L0_16 = db
  L0_16 = L0_16.getAttribute
  L0_16 = L0_16(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.networkMask)
  if L0_16 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_16
end
function networkMaskGetNext()
  local L0_17
  L0_17 = db
  L0_17 = L0_17.getAttribute
  L0_17 = L0_17(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.networkMask)
  if L0_17 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_17
end
function networkMaskSet(A0_18, A1_19)
  local L2_20
  L2_20 = tonumber
  L2_20 = L2_20(A0_18)
  if L2_20 ~= _UPVALUE0_ then
    L2_20 = tonumber
    L2_20 = L2_20(A0_18)
    if L2_20 ~= _UPVALUE1_ then
      L2_20 = _UPVALUE2_
      L2_20 = L2_20.INVALID_ARGUMENT
      return L2_20, A0_18
    end
  end
  L2_20 = db
  L2_20 = L2_20.getAttribute
  L2_20 = L2_20(_UPVALUE3_, "_ROWID_", A0_18, _UPVALUE4_.getIPFromIsp)
  if tonumber(L2_20) == 1 then
    return _UPVALUE2_.DEPENDENCY_NOT_MET
  end
  if tonumber(L2_20) == 0 and A1_19 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  valid = _UPVALUE5_.ipAddressCheck(2, A1_19)
  if valid ~= _UPVALUE2_.SUCCESS then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE3_, "_ROWID_", A0_18, _UPVALUE4_.networkMask, A1_19) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_18
  end
  return _UPVALUE2_.SUCCESS, A0_18
end
function userNameGet()
  local L0_21
  L0_21 = db
  L0_21 = L0_21.getAttribute
  L0_21 = L0_21(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.userName)
  if L0_21 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_21
end
function userNameGetNext()
  local L0_22
  L0_22 = db
  L0_22 = L0_22.getAttribute
  L0_22 = L0_22(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.userName)
  if L0_22 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_22
end
function userNameSet(A0_23, A1_24)
  if tonumber(A0_23) ~= _UPVALUE0_ and tonumber(A0_23) ~= _UPVALUE1_ then
    return _UPVALUE2_.INVALID_ARGUMENT, A0_23
  end
  if db.setAttribute(_UPVALUE3_, "_ROWID_", A0_23, _UPVALUE4_.userName, A1_24) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_23
  end
  return _UPVALUE2_.SUCCESS, A0_23
end
function passwordGet()
  local L0_25
  L0_25 = db
  L0_25 = L0_25.getAttribute
  L0_25 = L0_25(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.password)
  if L0_25 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_25
end
function passwordGetNext()
  local L0_26
  L0_26 = db
  L0_26 = L0_26.getAttribute
  L0_26 = L0_26(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.password)
  if L0_26 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_26
end
function passwordSet(A0_27, A1_28)
  if tonumber(A0_27) ~= _UPVALUE0_ and tonumber(A0_27) ~= _UPVALUE1_ then
    return _UPVALUE2_.INVALID_ARGUMENT, A0_27
  end
  if A1_28 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE3_, "_ROWID_", A0_27, _UPVALUE4_.password, A1_28) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_27
  end
  return _UPVALUE2_.SUCCESS, A0_27
end
function serviceGet()
  local L0_29
  L0_29 = db
  L0_29 = L0_29.getAttribute
  L0_29 = L0_29(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.service)
  if L0_29 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_29
end
function serviceGetNext()
  local L0_30
  L0_30 = db
  L0_30 = L0_30.getAttribute
  L0_30 = L0_30(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.service)
  if L0_30 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_30
end
function serviceSet(A0_31, A1_32)
  if tonumber(A0_31) ~= _UPVALUE0_ and tonumber(A0_31) ~= _UPVALUE1_ then
    return _UPVALUE2_.INVALID_ARGUMENT, A0_31
  end
  if A1_32 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE3_, "_ROWID_", A0_31, _UPVALUE4_.service, A1_32) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_31
  end
  return _UPVALUE2_.SUCCESS, A0_31
end
function authenticationOptionsGet()
  local L0_33
  L0_33 = db
  L0_33 = L0_33.getAttribute
  L0_33 = L0_33(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.authenticationOptions)
  if L0_33 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_33
end
function authenticationOptionsGetNext()
  local L0_34
  L0_34 = db
  L0_34 = L0_34.getAttribute
  L0_34 = L0_34(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.authenticationOptions)
  if L0_34 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_34
end
function authenticationOptionsSet(A0_35, A1_36)
  if tonumber(A0_35) ~= _UPVALUE0_ and tonumber(A0_35) ~= _UPVALUE1_ then
    return _UPVALUE2_.INVALID_ARGUMENT, A0_35
  end
  if A1_36 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if A1_36 ~= _UPVALUE3_ and A1_36 ~= _UPVALUE4_ and A1_36 ~= _UPVALUE5_ and A1_36 ~= _UPVALUE6_ and A1_36 ~= _UPVALUE7_ then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE8_, "_ROWID_", A0_35, _UPVALUE9_.authenticationOptions, A1_36) == _UPVALUE2_.FALSE then
    return _UPVALUE2_.FAILURE, A0_35
  end
  return _UPVALUE2_.SUCCESS, A0_35
end
function isgetDnsFromIspEnabled()
  local L0_37
  L0_37 = db
  L0_37 = L0_37.getAttribute
  L0_37 = L0_37(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.getDnsFromIsp)
  if L0_37 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_37
end
function isgetDnsFromIspEnabledNext(A0_38)
  local L1_39
  L1_39 = db
  L1_39 = L1_39.getAttribute
  L1_39 = L1_39(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.getDnsFromIsp)
  if L1_39 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L1_39
end
function getDnsFromIspEnable(A0_40)
  if tonumber(A0_40) ~= _UPVALUE0_ and tonumber(A0_40) ~= _UPVALUE1_ then
    return _UPVALUE2_.INVALID_ARGUMENT, A0_40
  end
  if db.setAttribute(_UPVALUE3_, "_ROWID_", A0_40, _UPVALUE4_.getDnsFromIsp, _UPVALUE5_) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_40
  end
  return _UPVALUE2_.SUCCESS, A0_40
end
function getDnsFromIspDisable(A0_41)
  if tonumber(A0_41) ~= _UPVALUE0_ and tonumber(A0_41) ~= _UPVALUE1_ then
    return _UPVALUE2_.INVALID_ARGUMENT, A0_41
  end
  if db.setAttribute(_UPVALUE3_, "_ROWID_", A0_41, _UPVALUE4_.getDnsFromIsp, _UPVALUE5_) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_41
  end
  return _UPVALUE2_.SUCCESS, A0_41
end
function primaryDnsGet()
  local L0_42
  L0_42 = db
  L0_42 = L0_42.getAttribute
  L0_42 = L0_42(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.primaryDns)
  if L0_42 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_42
end
function primaryDnsGetNext()
  local L0_43
  L0_43 = db
  L0_43 = L0_43.getAttribute
  L0_43 = L0_43(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.primaryDns)
  if L0_43 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_43
end
function primaryDnsSet(A0_44, A1_45)
  local L2_46
  L2_46 = tonumber
  L2_46 = L2_46(A0_44)
  if L2_46 ~= _UPVALUE0_ then
    L2_46 = tonumber
    L2_46 = L2_46(A0_44)
    if L2_46 ~= _UPVALUE1_ then
      L2_46 = _UPVALUE2_
      L2_46 = L2_46.INVALID_ARGUMENT
      return L2_46, A0_44
    end
  end
  L2_46 = db
  L2_46 = L2_46.getAttribute
  L2_46 = L2_46(_UPVALUE3_, "_ROWID_", A0_44, _UPVALUE4_.getDnsFromIsp)
  if tonumber(L2_46) == 1 then
    return _UPVALUE2_.DEPENDENCY_NOT_MET
  end
  if tonumber(L2_46) == 0 and A1_45 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  valid = _UPVALUE5_.ipAddressCheck(2, A1_45)
  if valid ~= _UPVALUE2_.SUCCESS then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE3_, "_ROWID_", A0_44, _UPVALUE4_.primaryDns, A1_45) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_44
  end
  return _UPVALUE2_.SUCCESS, A0_44
end
function secondaryDnsGet()
  local L0_47
  L0_47 = db
  L0_47 = L0_47.getAttribute
  L0_47 = L0_47(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.secondaryDns)
  if L0_47 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_47
end
function secondaryDnsGetNext()
  local L0_48
  L0_48 = db
  L0_48 = L0_48.getAttribute
  L0_48 = L0_48(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.secondaryDns)
  if L0_48 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_48
end
function secondaryDnsSet(A0_49, A1_50)
  local L2_51
  L2_51 = tonumber
  L2_51 = L2_51(A0_49)
  if L2_51 ~= _UPVALUE0_ then
    L2_51 = tonumber
    L2_51 = L2_51(A0_49)
    if L2_51 ~= _UPVALUE1_ then
      L2_51 = _UPVALUE2_
      L2_51 = L2_51.INVALID_ARGUMENT
      return L2_51, A0_49
    end
  end
  L2_51 = db
  L2_51 = L2_51.getAttribute
  L2_51 = L2_51(_UPVALUE3_, "_ROWID_", A0_49, _UPVALUE4_.getDnsFromIsp)
  if tonumber(L2_51) == 1 then
    return _UPVALUE2_.DEPENDENCY_NOT_MET
  end
  if tonumber(L2_51) ~= 0 and A1_50 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  valid = _UPVALUE5_.ipAddressCheck(2, A1_50)
  if valid ~= _UPVALUE2_.SUCCESS then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE3_, "_ROWID_", A0_49, _UPVALUE4_.secondaryDns, A1_50) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_49
  end
  return _UPVALUE2_.SUCCESS, A0_49
end
function statusGet()
  local L0_52
  L0_52 = db
  L0_52 = L0_52.getAttribute
  L0_52 = L0_52(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.status)
  if L0_52 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_52
end
function statusGetNext()
  local L0_53
  L0_53 = db
  L0_53 = L0_53.getAttribute
  L0_53 = L0_53(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.status)
  if L0_53 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_53
end
function statusSet(A0_54, A1_55)
  if tonumber(A0_54) ~= _UPVALUE0_ and tonumber(A0_54) ~= _UPVALUE1_ then
    return _UPVALUE2_.INVALID_ARGUMENT, A0_54
  end
  if A1_55 == NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  valid = _UPVALUE3_.isBoolean(A1_55)
  if valid ~= _UPVALUE2_.SUCCESS then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE4_, "_ROWID_", A0_54, _UPVALUE5_.status, A1_55) == _UPVALUE2_.FALSE then
    return _UPVALUE2_.FAILURE, A0_54
  end
  return _UPVALUE2_.SUCCESS, A0_54
end
function reconnectModeGet()
  local L0_56
  L0_56 = db
  L0_56 = L0_56.getAttribute
  L0_56 = L0_56(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.reconnectMode)
  if L0_56 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_56
end
function reconnectModeGetNext()
  local L0_57
  L0_57 = db
  L0_57 = L0_57.getAttribute
  L0_57 = L0_57(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.reconnectMode)
  if L0_57 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_57
end
function reconnectModeEnable(A0_58)
  if tonumber(A0_58) ~= _UPVALUE0_ and tonumber(A0_58) ~= _UPVALUE1_ then
    return _UPVALUE2_.INVALID_ARGUMENT, A0_58
  end
  if db.setAttribute(_UPVALUE3_, "_ROWID_", A0_58, _UPVALUE4_.reconnectMode, _UPVALUE5_) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_58
  end
  return _UPVALUE2_.SUCCESS, A0_58
end
function reconnectModeDisable(A0_59)
  if tonumber(A0_59) ~= _UPVALUE0_ and tonumber(A0_59) ~= _UPVALUE1_ then
    return _UPVALUE2_.INVALID_ARGUMENT, A0_59
  end
  if db.setAttribute(_UPVALUE3_, "_ROWID_", A0_59, _UPVALUE4_.reconnectMode, _UPVALUE5_) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_59
  end
  return _UPVALUE2_.SUCCESS, A0_59
end
function idleTimeOutValueGet()
  local L0_60
  L0_60 = db
  L0_60 = L0_60.getAttribute
  L0_60 = L0_60(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.idleTimeOutValue)
  if L0_60 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE4_, L0_60
end
function idleTimeOutValueGetNext()
  local L0_61
  L0_61 = db
  L0_61 = L0_61.getAttribute
  L0_61 = L0_61(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.idleTimeOutValue)
  if L0_61 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_61
end
function idleTimeOutValueSet(A0_62, A1_63)
  local L2_64
  L2_64 = tonumber
  L2_64 = L2_64(A0_62)
  if L2_64 ~= _UPVALUE0_ then
    L2_64 = tonumber
    L2_64 = L2_64(A0_62)
    if L2_64 ~= _UPVALUE1_ then
      L2_64 = _UPVALUE2_
      L2_64 = L2_64.INVALID_ARGUMENT
      return L2_64, A0_62
    end
  end
  L2_64 = db
  L2_64 = L2_64.getAttribute
  L2_64 = L2_64(_UPVALUE3_, "_ROWID_", A0_62, _UPVALUE4_.reconnectMode)
  if tonumber(L2_64) == 0 then
    return _UPVALUE2_.DEPENDENCY_NOT_MET
  end
  if tonumber(L2_64) ~= 1 and A1_63 == _UPVALUE2_.NIL then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if 1 > tonumber(idleTimeout) or tonumber(idleTimeout) > 10 then
    return _UPVALUE2_.INVALID_ARGUMENT
  end
  if db.setAttribute(_UPVALUE3_, "_ROWID_", A0_62, _UPVALUE4_.idleTimeOutValue, A1_63) == _UPVALUE2_.FALSE then
    return _UPVALUE2_.FAILURE, A0_62
  end
  return _UPVALUE2_.SUCCESS, A0_62
end
function PPPoEConnectionGet()
  local L0_65, L1_66, L2_67, L3_68, L4_69, L5_70, L6_71, L7_72, L8_73, L9_74, L10_75, L11_76, L12_77, L13_78
  L0_65 = db
  L0_65 = L0_65.getRow
  L1_66 = _UPVALUE0_
  L2_67 = "_ROWID_"
  L3_68 = _UPVALUE1_
  L0_65 = L0_65(L1_66, L2_67, L3_68)
  L1_66 = _UPVALUE2_
  L1_66 = L1_66.NIL
  if L0_65 == L1_66 then
    L1_66 = _UPVALUE2_
    L1_66 = L1_66.FAILURE
    L2_67 = _UPVALUE1_
    return L1_66, L2_67
  end
  L1_66 = _UPVALUE0_
  L2_67 = "."
  L3_68 = _UPVALUE3_
  L3_68 = L3_68.getIPFromIsp
  L1_66 = L1_66 .. L2_67 .. L3_68
  L1_66 = L0_65[L1_66]
  L2_67 = _UPVALUE0_
  L3_68 = "."
  L4_69 = _UPVALUE3_
  L4_69 = L4_69.ipAddress
  L2_67 = L2_67 .. L3_68 .. L4_69
  L2_67 = L0_65[L2_67]
  L3_68 = _UPVALUE0_
  L4_69 = "."
  L5_70 = _UPVALUE3_
  L5_70 = L5_70.networkMask
  L3_68 = L3_68 .. L4_69 .. L5_70
  L3_68 = L0_65[L3_68]
  L4_69 = _UPVALUE0_
  L5_70 = "."
  L6_71 = _UPVALUE3_
  L6_71 = L6_71.userName
  L4_69 = L4_69 .. L5_70 .. L6_71
  L4_69 = L0_65[L4_69]
  L5_70 = _UPVALUE0_
  L6_71 = "."
  L7_72 = _UPVALUE3_
  L7_72 = L7_72.password
  L5_70 = L5_70 .. L6_71 .. L7_72
  L5_70 = L0_65[L5_70]
  L6_71 = _UPVALUE0_
  L7_72 = "."
  L8_73 = _UPVALUE3_
  L8_73 = L8_73.service
  L6_71 = L6_71 .. L7_72 .. L8_73
  L6_71 = L0_65[L6_71]
  L7_72 = _UPVALUE0_
  L8_73 = "."
  L9_74 = _UPVALUE3_
  L9_74 = L9_74.getDnsFromIsp
  L7_72 = L7_72 .. L8_73 .. L9_74
  L7_72 = L0_65[L7_72]
  L8_73 = _UPVALUE0_
  L9_74 = "."
  L10_75 = _UPVALUE3_
  L10_75 = L10_75.primaryDns
  L8_73 = L8_73 .. L9_74 .. L10_75
  L8_73 = L0_65[L8_73]
  L9_74 = _UPVALUE0_
  L10_75 = "."
  L11_76 = _UPVALUE3_
  L11_76 = L11_76.secondaryDns
  L9_74 = L9_74 .. L10_75 .. L11_76
  L9_74 = L0_65[L9_74]
  L10_75 = _UPVALUE0_
  L11_76 = "."
  L12_77 = _UPVALUE3_
  L12_77 = L12_77.status
  L10_75 = L10_75 .. L11_76 .. L12_77
  L10_75 = L0_65[L10_75]
  L11_76 = _UPVALUE0_
  L12_77 = "."
  L13_78 = _UPVALUE3_
  L13_78 = L13_78.reconnectMode
  L11_76 = L11_76 .. L12_77 .. L13_78
  L11_76 = L0_65[L11_76]
  L12_77 = _UPVALUE0_
  L13_78 = "."
  L12_77 = L12_77 .. L13_78 .. _UPVALUE3_.idleTimeOutValue
  L12_77 = L0_65[L12_77]
  L13_78 = _UPVALUE0_
  L13_78 = L13_78 .. "." .. _UPVALUE3_.authenticationOptions
  L13_78 = L0_65[L13_78]
  return _UPVALUE2_.SUCCESS, _UPVALUE1_, L1_66, L2_67, L3_68, L4_69, L5_70, L6_71, L7_72, L8_73, L9_74, L10_75, L11_76, L12_77, L13_78
end
function PPPoEConnectionGetNext()
  local L0_79, L1_80, L2_81, L3_82, L4_83, L5_84, L6_85, L7_86, L8_87, L9_88, L10_89, L11_90, L12_91, L13_92
  L0_79 = db
  L0_79 = L0_79.getRow
  L1_80 = _UPVALUE0_
  L2_81 = "_ROWID_"
  L3_82 = _UPVALUE1_
  L0_79 = L0_79(L1_80, L2_81, L3_82)
  L1_80 = _UPVALUE2_
  L1_80 = L1_80.NIL
  if L0_79 == L1_80 then
    L1_80 = _UPVALUE2_
    L1_80 = L1_80.FAILURE
    L2_81 = _UPVALUE1_
    return L1_80, L2_81
  end
  L1_80 = _UPVALUE0_
  L2_81 = "."
  L3_82 = _UPVALUE3_
  L3_82 = L3_82.getIPFromIsp
  L1_80 = L1_80 .. L2_81 .. L3_82
  L1_80 = L0_79[L1_80]
  L2_81 = _UPVALUE0_
  L3_82 = "."
  L4_83 = _UPVALUE3_
  L4_83 = L4_83.ipAddress
  L2_81 = L2_81 .. L3_82 .. L4_83
  L2_81 = L0_79[L2_81]
  L3_82 = _UPVALUE0_
  L4_83 = "."
  L5_84 = _UPVALUE3_
  L5_84 = L5_84.networkMask
  L3_82 = L3_82 .. L4_83 .. L5_84
  L3_82 = L0_79[L3_82]
  L4_83 = _UPVALUE0_
  L5_84 = "."
  L6_85 = _UPVALUE3_
  L6_85 = L6_85.userName
  L4_83 = L4_83 .. L5_84 .. L6_85
  L4_83 = L0_79[L4_83]
  L5_84 = _UPVALUE0_
  L6_85 = "."
  L7_86 = _UPVALUE3_
  L7_86 = L7_86.password
  L5_84 = L5_84 .. L6_85 .. L7_86
  L5_84 = L0_79[L5_84]
  L6_85 = _UPVALUE0_
  L7_86 = "."
  L8_87 = _UPVALUE3_
  L8_87 = L8_87.service
  L6_85 = L6_85 .. L7_86 .. L8_87
  L6_85 = L0_79[L6_85]
  L7_86 = _UPVALUE0_
  L8_87 = "."
  L9_88 = _UPVALUE3_
  L9_88 = L9_88.getDnsFromIsp
  L7_86 = L7_86 .. L8_87 .. L9_88
  L7_86 = L0_79[L7_86]
  L8_87 = _UPVALUE0_
  L9_88 = "."
  L10_89 = _UPVALUE3_
  L10_89 = L10_89.primaryDns
  L8_87 = L8_87 .. L9_88 .. L10_89
  L8_87 = L0_79[L8_87]
  L9_88 = _UPVALUE0_
  L10_89 = "."
  L11_90 = _UPVALUE3_
  L11_90 = L11_90.secondaryDns
  L9_88 = L9_88 .. L10_89 .. L11_90
  L9_88 = L0_79[L9_88]
  L10_89 = _UPVALUE0_
  L11_90 = "."
  L12_91 = _UPVALUE3_
  L12_91 = L12_91.status
  L10_89 = L10_89 .. L11_90 .. L12_91
  L10_89 = L0_79[L10_89]
  L11_90 = _UPVALUE0_
  L12_91 = "."
  L13_92 = _UPVALUE3_
  L13_92 = L13_92.reconnectMode
  L11_90 = L11_90 .. L12_91 .. L13_92
  L11_90 = L0_79[L11_90]
  L12_91 = _UPVALUE0_
  L13_92 = "."
  L12_91 = L12_91 .. L13_92 .. _UPVALUE3_.idleTimeOutValue
  L12_91 = L0_79[L12_91]
  L13_92 = _UPVALUE0_
  L13_92 = L13_92 .. "." .. _UPVALUE3_.authenticationOptions
  L13_92 = L0_79[L13_92]
  return _UPVALUE2_.SUCCESS, _UPVALUE1_, L1_80, L2_81, L3_82, L4_83, L5_84, L6_85, L7_86, L8_87, L9_88, L10_89, L11_90, L12_91, L13_92
end
function PPPoEConnectionSet(A0_93, A1_94, A2_95, A3_96, A4_97, A5_98, A6_99, A7_100, A8_101, A9_102, A10_103, A11_104, A12_105)
  local L13_106, L14_107, L15_108, L16_109, L17_110, L18_111, L19_112
  L14_107 = tonumber
  L15_108 = A0_93
  L14_107 = L14_107(L15_108)
  L15_108 = _UPVALUE0_
  if L14_107 ~= L15_108 then
    L14_107 = tonumber
    L15_108 = A0_93
    L14_107 = L14_107(L15_108)
    L15_108 = _UPVALUE1_
    if L14_107 ~= L15_108 then
      L14_107 = _UPVALUE2_
      L14_107 = L14_107.INVALID_ARGUMENT
      return L14_107
    end
  end
  L14_107 = _UPVALUE2_
  L14_107 = L14_107.NIL
  if A1_94 == L14_107 then
    L14_107 = _UPVALUE3_
    L14_107 = L14_107.GET_IP_FROM_ISP_NIL
    return L14_107
  end
  L14_107 = _UPVALUE4_
  L14_107 = L14_107.isBoolean
  L15_108 = A1_94
  L14_107 = L14_107(L15_108)
  L13_106 = L14_107
  L14_107 = _UPVALUE2_
  L14_107 = L14_107.SUCCESS
  if L13_106 ~= L14_107 then
    L14_107 = _UPVALUE3_
    L14_107 = L14_107.INVALID_GET_IP_FROM_ISP
    return L14_107
  end
  L14_107 = tonumber
  L15_108 = A1_94
  L14_107 = L14_107(L15_108)
  if L14_107 == 1 then
    L14_107 = _UPVALUE2_
    L14_107 = L14_107.NIL
    if A2_95 ~= L14_107 then
      L14_107 = _UPVALUE2_
      L14_107 = L14_107.DEPENDENCY_NOT_MET
      return L14_107
    end
  end
  L14_107 = tonumber
  L15_108 = A1_94
  L14_107 = L14_107(L15_108)
  if L14_107 == 0 then
    L14_107 = _UPVALUE2_
    L14_107 = L14_107.NIL
    if A2_95 == L14_107 then
      L14_107 = _UPVALUE3_
      L14_107 = L14_107.IP_NIL
      return L14_107
    end
  end
  L14_107 = tonumber
  L15_108 = A1_94
  L14_107 = L14_107(L15_108)
  if L14_107 == 0 then
    L14_107 = _UPVALUE4_
    L14_107 = L14_107.ipAddressCheck
    L15_108 = 2
    L16_109 = A2_95
    L14_107 = L14_107(L15_108, L16_109)
    L13_106 = L14_107
    L14_107 = _UPVALUE2_
    L14_107 = L14_107.SUCCESS
    if L13_106 ~= L14_107 then
      L14_107 = _UPVALUE3_
      L14_107 = L14_107.INVALID_IP
      return L14_107
    end
    L14_107 = _UPVALUE4_
    L14_107 = L14_107.ipAddressCheck
    L15_108 = 2
    L16_109 = A3_96
    L14_107 = L14_107(L15_108, L16_109)
    L13_106 = L14_107
    L14_107 = _UPVALUE2_
    L14_107 = L14_107.SUCCESS
    if L13_106 ~= L14_107 then
      L14_107 = _UPVALUE3_
      L14_107 = L14_107.INVALID_NETMASK
      return L14_107
    end
    L14_107 = _UPVALUE0_
    if A0_93 == L14_107 then
      L14_107 = "WAN1"
      wanPort = L14_107
    end
    L14_107 = _UPVALUE1_
    if A0_93 == L14_107 then
      L14_107 = "WAN2"
      wanPort = L14_107
    end
    L14_107 = staticIpSubnetCheck
    L15_108 = wanPort
    L16_109 = A2_95
    L17_110 = A3_96
    L14_107 = L14_107(L15_108, L16_109, L17_110)
    L13_106 = L14_107
    L14_107 = _UPVALUE2_
    L14_107 = L14_107.SUCCESS
    if L13_106 ~= L14_107 then
      return L13_106
    end
  end
  L14_107 = tonumber
  L15_108 = A1_94
  L14_107 = L14_107(L15_108)
  if L14_107 == 1 then
    L14_107 = _UPVALUE2_
    L14_107 = L14_107.NIL
    if A3_96 ~= L14_107 then
      L14_107 = _UPVALUE2_
      L14_107 = L14_107.DEPENDENCY_NOT_MET
      return L14_107
    end
  end
  L14_107 = tonumber
  L15_108 = A1_94
  L14_107 = L14_107(L15_108)
  if L14_107 == 0 then
    L14_107 = _UPVALUE2_
    L14_107 = L14_107.NIL
    if A3_96 == L14_107 then
      L14_107 = _UPVALUE3_
      L14_107 = L14_107.NETMASK_NIL
      return L14_107
    end
  end
  L14_107 = _UPVALUE2_
  L14_107 = L14_107.NIL
  if A4_97 == L14_107 then
    L14_107 = _UPVALUE3_
    L14_107 = L14_107.USERNAME_NIL
    return L14_107
  end
  L14_107 = _UPVALUE2_
  L14_107 = L14_107.NIL
  if A5_98 == L14_107 then
    L14_107 = _UPVALUE3_
    L14_107 = L14_107.PWD_NIL
    return L14_107
  end
  L14_107 = _UPVALUE2_
  L14_107 = L14_107.NIL
  if A8_101 == L14_107 then
    L14_107 = _UPVALUE3_
    L14_107 = L14_107.GET_DNS_FROM_ISP_NIL
    return L14_107
  end
  L14_107 = _UPVALUE2_
  L14_107 = L14_107.NIL
  if A7_100 == L14_107 then
    L14_107 = _UPVALUE3_
    L14_107 = L14_107.AUTH_OPT_NIL
    return L14_107
  end
  L14_107 = _UPVALUE5_
  if A7_100 ~= L14_107 then
    L14_107 = _UPVALUE6_
    if A7_100 ~= L14_107 then
      L14_107 = _UPVALUE7_
      if A7_100 ~= L14_107 then
        L14_107 = _UPVALUE8_
        if A7_100 ~= L14_107 then
          L14_107 = _UPVALUE9_
          if A7_100 ~= L14_107 then
            L14_107 = _UPVALUE3_
            L14_107 = L14_107.INVALID_AUTH_OPT
            return L14_107
          end
        end
      end
    end
  end
  L14_107 = _UPVALUE4_
  L14_107 = L14_107.isBoolean
  L15_108 = A8_101
  L14_107 = L14_107(L15_108)
  L13_106 = L14_107
  L14_107 = _UPVALUE2_
  L14_107 = L14_107.SUCCESS
  if L13_106 ~= L14_107 then
    L14_107 = _UPVALUE3_
    L14_107 = L14_107.INVALID_GET_DNS_FROM_ISP
    return L14_107
  end
  L14_107 = tonumber
  L15_108 = A8_101
  L14_107 = L14_107(L15_108)
  if L14_107 == 1 then
    L14_107 = _UPVALUE2_
    L14_107 = L14_107.NIL
    if A9_102 ~= L14_107 then
      L14_107 = _UPVALUE2_
      L14_107 = L14_107.DEPENDENCY_NOT_MET
      return L14_107
    end
  end
  L14_107 = tonumber
  L15_108 = A8_101
  L14_107 = L14_107(L15_108)
  if L14_107 == 0 then
    L14_107 = _UPVALUE2_
    L14_107 = L14_107.NIL
    if A9_102 == L14_107 then
      L14_107 = _UPVALUE3_
      L14_107 = L14_107.PRI_DNS_NIL
      return L14_107
    else
      L14_107 = _UPVALUE4_
      L14_107 = L14_107.ipAddressCheck
      L15_108 = 2
      L16_109 = A9_102
      L14_107 = L14_107(L15_108, L16_109)
      L13_106 = L14_107
      L14_107 = _UPVALUE2_
      L14_107 = L14_107.SUCCESS
      if L13_106 ~= L14_107 then
        L14_107 = _UPVALUE3_
        L14_107 = L14_107.INVALID_PRI_DNS
        return L14_107
      end
    end
  end
  L14_107 = tonumber
  L15_108 = A8_101
  L14_107 = L14_107(L15_108)
  if L14_107 == 1 then
    L14_107 = _UPVALUE2_
    L14_107 = L14_107.NIL
    if A10_103 ~= L14_107 then
      L14_107 = _UPVALUE2_
      L14_107 = L14_107.DEPENDENCY_NOT_MET
      return L14_107
    end
  end
  L14_107 = tonumber
  L15_108 = A8_101
  L14_107 = L14_107(L15_108)
  if L14_107 == 0 then
    L14_107 = _UPVALUE2_
    L14_107 = L14_107.NIL
    if A10_103 == L14_107 then
      L14_107 = _UPVALUE3_
      L14_107 = L14_107.SEC_DNS_NIL
      return L14_107
    else
      L14_107 = _UPVALUE4_
      L14_107 = L14_107.ipAddressCheck
      L15_108 = 2
      L16_109 = A10_103
      L14_107 = L14_107(L15_108, L16_109)
      L13_106 = L14_107
      L14_107 = _UPVALUE2_
      L14_107 = L14_107.SUCCESS
      if L13_106 ~= L14_107 then
        L14_107 = _UPVALUE3_
        L14_107 = L14_107.INVALID_SEC_DNS
        return L14_107
      end
    end
  end
  L14_107 = _UPVALUE2_
  L14_107 = L14_107.NIL
  if A11_104 == L14_107 then
    L14_107 = _UPVALUE3_
    L14_107 = L14_107.RECONNECT_MODE_NIL
    return L14_107
  end
  L14_107 = _UPVALUE4_
  L14_107 = L14_107.isBoolean
  L15_108 = A11_104
  L14_107 = L14_107(L15_108)
  L13_106 = L14_107
  L14_107 = _UPVALUE2_
  L14_107 = L14_107.SUCCESS
  if L13_106 ~= L14_107 then
    L14_107 = _UPVALUE3_
    L14_107 = L14_107.INVALID_RECONNECT_MODE
    return L14_107
  end
  L14_107 = tonumber
  L15_108 = A11_104
  L14_107 = L14_107(L15_108)
  if L14_107 == 0 then
    L14_107 = _UPVALUE2_
    L14_107 = L14_107.NIL
    if A12_105 ~= L14_107 then
      L14_107 = _UPVALUE2_
      L14_107 = L14_107.DEPENDENCY_NOT_MET
      return L14_107
    end
  end
  L14_107 = tonumber
  L15_108 = A11_104
  L14_107 = L14_107(L15_108)
  if L14_107 == 1 then
    L14_107 = _UPVALUE2_
    L14_107 = L14_107.NIL
    if A12_105 == L14_107 then
      L14_107 = _UPVALUE3_
      L14_107 = L14_107.IDLE_TIMEOUT_NIL
      return L14_107
    end
  end
  L14_107 = tonumber
  L15_108 = A11_104
  L14_107 = L14_107(L15_108)
  if L14_107 == 1 then
    L14_107 = idleTimeOutCheck
    L14_107 = L14_107()
    L15_108 = _UPVALUE2_
    L15_108 = L15_108.SUCCESS
    if L14_107 ~= L15_108 then
      return L14_107
    end
  end
  L14_107 = tonumber
  L15_108 = A11_104
  L14_107 = L14_107(L15_108)
  if L14_107 == 1 then
    L14_107 = tonumber
    L15_108 = A12_105
    L14_107 = L14_107(L15_108)
    if L14_107 < 1 or L14_107 > 10 then
      L15_108 = _UPVALUE3_
      L15_108 = L15_108.INVALID_IDLE_TIMEOUT
      return L15_108
    end
  end
  L14_107 = {}
  L15_108 = _UPVALUE10_
  L16_109 = "."
  L17_110 = _UPVALUE11_
  L17_110 = L17_110.getIPFromIsp
  L15_108 = L15_108 .. L16_109 .. L17_110
  L14_107[L15_108] = A1_94
  L15_108 = _UPVALUE10_
  L16_109 = "."
  L17_110 = _UPVALUE11_
  L17_110 = L17_110.ipAddress
  L15_108 = L15_108 .. L16_109 .. L17_110
  L14_107[L15_108] = A2_95
  L15_108 = _UPVALUE10_
  L16_109 = "."
  L17_110 = _UPVALUE11_
  L17_110 = L17_110.networkMask
  L15_108 = L15_108 .. L16_109 .. L17_110
  L14_107[L15_108] = A3_96
  L15_108 = _UPVALUE10_
  L16_109 = "."
  L17_110 = _UPVALUE11_
  L17_110 = L17_110.userName
  L15_108 = L15_108 .. L16_109 .. L17_110
  L14_107[L15_108] = A4_97
  L15_108 = util
  L15_108 = L15_108.mask
  L16_109 = A5_98
  L15_108 = L15_108(L16_109)
  if L15_108 ~= A5_98 then
    L16_109 = _UPVALUE10_
    L17_110 = "."
    L18_111 = _UPVALUE11_
    L18_111 = L18_111.password
    L16_109 = L16_109 .. L17_110 .. L18_111
    L14_107[L16_109] = A5_98
  end
  L16_109 = _UPVALUE10_
  L17_110 = "."
  L18_111 = _UPVALUE11_
  L18_111 = L18_111.service
  L16_109 = L16_109 .. L17_110 .. L18_111
  L14_107[L16_109] = A6_99
  L16_109 = _UPVALUE10_
  L17_110 = "."
  L18_111 = _UPVALUE11_
  L18_111 = L18_111.authenticationOptions
  L16_109 = L16_109 .. L17_110 .. L18_111
  L14_107[L16_109] = A7_100
  L16_109 = _UPVALUE10_
  L17_110 = "."
  L18_111 = _UPVALUE11_
  L18_111 = L18_111.getDnsFromIsp
  L16_109 = L16_109 .. L17_110 .. L18_111
  L14_107[L16_109] = A8_101
  L16_109 = _UPVALUE10_
  L17_110 = "."
  L18_111 = _UPVALUE11_
  L18_111 = L18_111.primaryDns
  L16_109 = L16_109 .. L17_110 .. L18_111
  L14_107[L16_109] = A9_102
  L16_109 = _UPVALUE10_
  L17_110 = "."
  L18_111 = _UPVALUE11_
  L18_111 = L18_111.secondaryDns
  L16_109 = L16_109 .. L17_110 .. L18_111
  L14_107[L16_109] = A10_103
  L16_109 = _UPVALUE10_
  L17_110 = "."
  L18_111 = _UPVALUE11_
  L18_111 = L18_111.status
  L16_109 = L16_109 .. L17_110 .. L18_111
  L17_110 = _UPVALUE12_
  L14_107[L16_109] = L17_110
  L16_109 = _UPVALUE10_
  L17_110 = "."
  L18_111 = _UPVALUE11_
  L18_111 = L18_111.reconnectMode
  L16_109 = L16_109 .. L17_110 .. L18_111
  L14_107[L16_109] = A11_104
  L16_109 = _UPVALUE10_
  L17_110 = "."
  L18_111 = _UPVALUE11_
  L18_111 = L18_111.idleTimeOutValue
  L16_109 = L16_109 .. L17_110 .. L18_111
  L14_107[L16_109] = A12_105
  L16_109 = db
  L16_109 = L16_109.update
  L17_110 = _UPVALUE10_
  L18_111 = L14_107
  L19_112 = A0_93
  L18_111 = L16_109(L17_110, L18_111, L19_112)
  L19_112 = {}
  L19_112[_UPVALUE10_ .. "." .. _UPVALUE11_.status] = _UPVALUE13_
  if db.update(_UPVALUE10_, L19_112, tonumber(A0_93) + 1) == _UPVALUE2_.NIL or L16_109 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_93
  end
  return _UPVALUE2_.SUCCESS, A0_93
end
function PPPoEConnectionCreate(A0_113, A1_114, A2_115, A3_116, A4_117, A5_118, A6_119, A7_120, A8_121)
  return _UPVALUE0_.NOT_SUPPORTED
end
function PPPoEConnectionDelete(A0_122)
  return _UPVALUE0_.NOT_SUPPORTED
end
function staticIpSubnetCheck(A0_123, A1_124, A2_125)
  local L3_126, L4_127, L5_128, L6_129, L7_130, L8_131, L9_132, L10_133, L11_134, L12_135, L13_136, L14_137, L15_138, L16_139, L17_140, L18_141, L19_142
  L13_136 = _UPVALUE0_
  L14_137 = _UPVALUE1_
  L14_137 = L14_137.vlanGet
  L15_138 = L13_136
  L8_131, L10_133, L11_134, L12_135, L14_137 = nil, nil, nil, nil, L14_137(L15_138)
  L8_131, L10_133, L11_134, L12_135, L15_138 = nil, nil, nil, nil, L14_137(L15_138)
  L8_131, L10_133, L11_134, L12_135, L16_139 = nil, nil, nil, nil, L14_137(L15_138)
  L8_131, L10_133, L11_134, L12_135, L17_140 = nil, nil, nil, nil, L14_137(L15_138)
  L8_131, L10_133, L11_134, L12_135, L18_141 = nil, nil, nil, nil, L14_137(L15_138)
  L8_131, L10_133, L11_134, L12_135, L19_142 = nil, nil, nil, nil, L14_137(L15_138)
  L4_127 = L19_142
  L7_130 = L18_141
  L6_129 = L17_140
  L5_128 = L16_139
  L9_132 = L15_138
  L3_126 = L14_137
  L14_137 = _UPVALUE2_
  L14_137 = L14_137.SUCCESS
  if L3_126 ~= L14_137 then
    L14_137 = _UPVALUE3_
    L14_137 = L14_137.SUBNET_CHECK_FAILED
    return L14_137
  end
  L14_137 = _UPVALUE4_
  L14_137 = L14_137.ipv4DualMaskCheck
  L15_138 = L4_127
  L16_139 = L8_131
  L17_140 = A1_124
  L18_141 = A2_125
  L14_137 = L14_137(L15_138, L16_139, L17_140, L18_141)
  L3_126 = L14_137
  L14_137 = _UPVALUE2_
  L14_137 = L14_137.SUCCESS
  if L3_126 == L14_137 then
    L14_137 = _UPVALUE3_
    L14_137 = L14_137.SAME_SUBNET_LAN
    return L14_137
  end
  L14_137 = _UPVALUE1_
  L14_137 = L14_137.vlanGetNext
  L15_138 = L9_132
  L8_131, L10_133, L11_134, L12_135, L19_142 = L14_137(L15_138)
  L4_127 = L19_142
  L7_130 = L18_141
  L6_129 = L17_140
  L5_128 = L16_139
  L9_132 = L15_138
  L3_126 = L14_137
  while true do
    L14_137 = _UPVALUE2_
    L14_137 = L14_137.NEXT_ROWID_INVALID
    if L3_126 ~= L14_137 then
      L14_137 = _UPVALUE2_
      L14_137 = L14_137.SUCCESS
      if L3_126 ~= L14_137 then
        L14_137 = _UPVALUE3_
        L14_137 = L14_137.SUBNET_CHECK_FAILED
        return L14_137
      end
      L14_137 = _UPVALUE4_
      L14_137 = L14_137.ipv4DualMaskCheck
      L15_138 = L4_127
      L16_139 = L8_131
      L17_140 = A1_124
      L18_141 = A2_125
      L14_137 = L14_137(L15_138, L16_139, L17_140, L18_141)
      L3_126 = L14_137
      L14_137 = _UPVALUE2_
      L14_137 = L14_137.SUCCESS
      if L3_126 == L14_137 then
        L14_137 = _UPVALUE3_
        L14_137 = L14_137.SAME_SUBNET_VLAN
        return L14_137
      end
      L14_137 = _UPVALUE1_
      L14_137 = L14_137.vlanGetNext
      L15_138 = L9_132
      L8_131, L10_133, L11_134, L12_135, L19_142 = L14_137(L15_138)
      L4_127 = L19_142
      L7_130 = L18_141
      L6_129 = L17_140
      L5_128 = L16_139
      L9_132 = L15_138
      L3_126 = L14_137
    end
  end
  L14_137 = db
  L14_137 = L14_137.getAttribute
  L15_138 = _UPVALUE5_
  L16_139 = _UPVALUE6_
  L16_139 = L16_139.dmz_interface
  L17_140 = _UPVALUE7_
  L18_141 = _UPVALUE6_
  L18_141 = L18_141.dmz_ip
  L14_137 = L14_137(L15_138, L16_139, L17_140, L18_141)
  L15_138 = db
  L15_138 = L15_138.getAttribute
  L16_139 = _UPVALUE5_
  L17_140 = _UPVALUE6_
  L17_140 = L17_140.dmz_interface
  L18_141 = _UPVALUE7_
  L19_142 = _UPVALUE6_
  L19_142 = L19_142.dmz_netmask
  L15_138 = L15_138(L16_139, L17_140, L18_141, L19_142)
  L16_139 = _UPVALUE2_
  L16_139 = L16_139.NIL
  if L14_137 ~= L16_139 then
    L16_139 = _UPVALUE8_
    if L14_137 ~= L16_139 then
      L16_139 = _UPVALUE2_
      L16_139 = L16_139.NIL
      if L15_138 ~= L16_139 then
        L16_139 = _UPVALUE8_
        if L15_138 ~= L16_139 then
          L16_139 = _UPVALUE4_
          L16_139 = L16_139.ipv4DualMaskCheck
          L17_140 = L14_137
          L18_141 = L15_138
          L19_142 = A1_124
          L16_139 = L16_139(L17_140, L18_141, L19_142, A2_125)
          L3_126 = L16_139
          L16_139 = _UPVALUE2_
          L16_139 = L16_139.SUCCESS
          if L3_126 == L16_139 then
            L16_139 = _UPVALUE3_
            L16_139 = L16_139.SAME_SUBNET_DMZ
            return L16_139
          end
        end
      end
    end
  end
  L16_139 = UNIT_NAME
  if L16_139 ~= "DSR-1000N" then
    L16_139 = UNIT_NAME
    if L16_139 ~= "DSR-1000" then
      L16_139 = UNIT_NAME
      if L16_139 ~= "DSR-500N" then
        L16_139 = UNIT_NAME
        if L16_139 ~= "DSR-500" then
          L16_139 = PRODUCT_ID
          if L16_139 ~= "DSR-1000AC_Ax" then
            L16_139 = PRODUCT_ID
            if L16_139 ~= "DSR-500AC_Ax" then
              L16_139 = PRODUCT_ID
              if L16_139 ~= "DSR-1000_Bx" then
                L16_139 = PRODUCT_ID
              end
            end
          end
        end
      end
    end
  elseif L16_139 == "DSR-500_Bx" then
    L16_139 = _UPVALUE4_
    L16_139 = L16_139.checkOpenVpnSubnetRange
    L17_140 = A1_124
    L18_141 = A2_125
    L16_139 = L16_139(L17_140, L18_141)
    L3_126 = L16_139
    L16_139 = _UPVALUE2_
    L16_139 = L16_139.SUCCESS
    if L3_126 == L16_139 then
      L16_139 = _UPVALUE2_
      L16_139 = L16_139.OPENVPN_ALREADY_CONFIGURED
      return L16_139
    end
  end
  L16_139 = _UPVALUE4_
  L16_139 = L16_139.ipv4DualMaskCheck
  L17_140 = _UPVALUE9_
  L18_141 = _UPVALUE10_
  L19_142 = A1_124
  L16_139 = L16_139(L17_140, L18_141, L19_142, A2_125)
  L3_126 = L16_139
  L16_139 = _UPVALUE2_
  L16_139 = L16_139.SUCCESS
  if L3_126 == L16_139 then
    L16_139 = _UPVALUE3_
    L16_139 = L16_139.SAME_SUBNET_LOCAL_IP
    return L16_139
  end
  L16_139 = db
  L16_139 = L16_139.getAttribute
  L17_140 = _UPVALUE11_
  L18_141 = _UPVALUE12_
  L19_142 = "1"
  L16_139 = L16_139(L17_140, L18_141, L19_142, _UPVALUE6_.ipsec_startIPAddress)
  L17_140 = db
  L17_140 = L17_140.getAttribute
  L18_141 = _UPVALUE11_
  L19_142 = _UPVALUE12_
  L17_140 = L17_140(L18_141, L19_142, "1", _UPVALUE6_.ipsec_subnetMask)
  L18_141 = _UPVALUE2_
  L18_141 = L18_141.NIL
  if L16_139 ~= L18_141 then
    L18_141 = _UPVALUE8_
    if L16_139 ~= L18_141 then
      L18_141 = _UPVALUE2_
      L18_141 = L18_141.NIL
      if L17_140 ~= L18_141 then
        L18_141 = _UPVALUE8_
        if L17_140 ~= L18_141 then
          L18_141 = _UPVALUE4_
          L18_141 = L18_141.ipv4DualMaskCheck
          L19_142 = L16_139
          L18_141 = L18_141(L19_142, L17_140, A1_124, A2_125)
          L3_126 = L18_141
          L18_141 = _UPVALUE2_
          L18_141 = L18_141.SUCCESS
          if L3_126 == L18_141 then
            L18_141 = _UPVALUE3_
            L18_141 = L18_141.SAME_SUBNET_IPSEC
            return L18_141
          end
        end
      end
    end
  end
  L18_141 = _UPVALUE13_
  if A0_123 == L18_141 then
    L18_141 = db
    L18_141 = L18_141.getAttributeWhere
    L19_142 = _UPVALUE14_
    L18_141 = L18_141(L19_142, _UPVALUE6_.interfaceName .. " = '" .. _UPVALUE15_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE16_, _UPVALUE6_.wan_ipAddress)
    L19_142 = db
    L19_142 = L19_142.getAttributeWhere
    L19_142 = L19_142(_UPVALUE14_, _UPVALUE6_.interfaceName .. " = '" .. _UPVALUE15_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE16_, _UPVALUE6_.wan_subnet)
    if L18_141 ~= _UPVALUE2_.NIL and L18_141 ~= _UPVALUE8_ and L19_142 ~= _UPVALUE2_.NIL and L19_142 ~= _UPVALUE8_ then
      L3_126 = _UPVALUE4_.ipv4DualMaskCheck(L18_141, L19_142, A1_124, A2_125)
      if L3_126 == _UPVALUE2_.SUCCESS then
        return _UPVALUE3_.SAME_SUBNET_WAN2
      end
    end
  end
  L18_141 = _UPVALUE15_
  if A0_123 == L18_141 then
    L18_141 = db
    L18_141 = L18_141.getAttributeWhere
    L19_142 = _UPVALUE14_
    L18_141 = L18_141(L19_142, _UPVALUE6_.interfaceName .. " = '" .. _UPVALUE13_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE16_, _UPVALUE6_.wan_ipAddress)
    L19_142 = db
    L19_142 = L19_142.getAttributeWhere
    L19_142 = L19_142(_UPVALUE14_, _UPVALUE6_.interfaceName .. " = '" .. _UPVALUE13_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE16_, _UPVALUE6_.wan_subnet)
    if L18_141 ~= _UPVALUE2_.NIL and L18_141 ~= _UPVALUE8_ and L19_142 ~= _UPVALUE2_.NIL and L19_142 ~= _UPVALUE8_ then
      L3_126 = _UPVALUE4_.ipv4DualMaskCheck(L18_141, L19_142, A1_124, A2_125)
      if L3_126 == _UPVALUE2_.SUCCESS then
        return _UPVALUE3_.SAME_SUBNET_WAN1
      end
    end
  end
  L18_141 = _UPVALUE2_
  L18_141 = L18_141.SUCCESS
  return L18_141
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
