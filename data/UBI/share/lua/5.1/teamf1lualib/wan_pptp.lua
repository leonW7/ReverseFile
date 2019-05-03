local L0_0
L0_0 = module
L0_0("com.teamf1.core.wan.pptp", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/nimf_returnCodes")
L0_0 = require
L0_0("teamf1lualib/vlan_vlan")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).wanPort = "LogicalIfName"
;({}).userName = "UserName"
;({}).password = "Password"
;({}).useDhcp = "GetIpFromIsp"
;({}).useIspDns = "GetDnsFromIsp"
;({}).serverIPAddress = "ServerIp"
;({}).staticIPAddress = "StaticIp"
;({}).gateway = "Gateway"
;({}).netmask = "NetMask"
;({}).primaryDNS = "PrimaryDns"
;({}).secondaryDNS = "SecondaryDns"
;({}).reconnectMode = "IdleTimeOutFlag"
;({}).maxIdleTime = "IdleTimeOutValue"
;({}).splitTunnel = "SplitTunnel"
;({}).mppeEncryption = "MppeEncryptSupport"
;({}).dualAccess = "DualAccess"
;({}).myIp = "MyIp"
;({}).staticDNSIP = "StaticDNS"
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
  local L0_1, L1_2
  L0_1 = db
  L0_1 = L0_1.getNextRowId
  L1_2 = _UPVALUE0_
  L0_1 = L0_1(L1_2, _UPVALUE1_)
  L1_2 = _UPVALUE2_
  L1_2 = L1_2.NIL
  if L0_1 == L1_2 then
    L1_2 = _UPVALUE2_
    L1_2 = L1_2.NOT_EXIST
    return L1_2
  end
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(_UPVALUE1_, _UPVALUE3_, L0_1, _UPVALUE4_.wanPort)
  if L1_2 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_1, L1_2
end
function wanPortGetNext(A0_3)
  local L1_4, L2_5
  L1_4 = _UPVALUE0_
  L1_4 = L1_4.NIL
  if A0_3 == L1_4 then
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.INVALID_ARGUMENT
    return L1_4
  end
  L1_4 = tonumber
  L2_5 = A0_3
  L1_4 = L1_4(L2_5)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if L1_4 == L2_5 then
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.INVALID_ARGUMENT
    return L1_4
  end
  L1_4 = db
  L1_4 = L1_4.existsRow
  L2_5 = _UPVALUE1_
  L1_4 = L1_4(L2_5, _UPVALUE2_, A0_3)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.FALSE
  if L1_4 == L2_5 then
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.NOT_EXIST
    return L1_4
  end
  L1_4 = nil
  L2_5 = db
  L2_5 = L2_5.getNextRowId
  L2_5 = L2_5(A0_3, _UPVALUE1_)
  L1_4 = L2_5
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if L1_4 == L2_5 then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.NOT_EXIST
    return L2_5
  end
  L2_5 = db
  L2_5 = L2_5.getAttribute
  L2_5 = L2_5(_UPVALUE1_, _UPVALUE2_, L1_4, _UPVALUE3_.wanPort)
  if L2_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L2_5
end
function wanPortSet(A0_6, A1_7)
  local L3_8, L4_9
  L3_8 = _UPVALUE0_
  L3_8 = L3_8.NOT_SUPPORTED
  L4_9 = 0
  return L3_8, L4_9, 0
end
function wanPortDelete(A0_10, A1_11)
  local L3_12, L4_13
  L3_12 = _UPVALUE0_
  L3_12 = L3_12.NOT_SUPPORTED
  L4_13 = 0
  return L3_12, L4_13, 0
end
function userNameGet()
  local L0_14, L1_15
  L0_14 = db
  L0_14 = L0_14.getNextRowId
  L1_15 = _UPVALUE0_
  L0_14 = L0_14(L1_15, _UPVALUE1_)
  L1_15 = _UPVALUE2_
  L1_15 = L1_15.NIL
  if L0_14 == L1_15 then
    L1_15 = _UPVALUE2_
    L1_15 = L1_15.NOT_EXIST
    return L1_15
  end
  L1_15 = db
  L1_15 = L1_15.getAttribute
  L1_15 = L1_15(_UPVALUE1_, _UPVALUE3_, L0_14, _UPVALUE4_.userName)
  if L1_15 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_14, L1_15
end
function userNameGetNext(A0_16)
  local L1_17, L2_18
  L1_17 = _UPVALUE0_
  L1_17 = L1_17.NIL
  if A0_16 == L1_17 then
    L1_17 = _UPVALUE0_
    L1_17 = L1_17.INVALID_ARGUMENT
    return L1_17
  end
  L1_17 = tonumber
  L2_18 = A0_16
  L1_17 = L1_17(L2_18)
  L2_18 = _UPVALUE0_
  L2_18 = L2_18.NIL
  if L1_17 == L2_18 then
    L1_17 = _UPVALUE0_
    L1_17 = L1_17.INVALID_ARGUMENT
    return L1_17
  end
  L1_17 = db
  L1_17 = L1_17.existsRow
  L2_18 = _UPVALUE1_
  L1_17 = L1_17(L2_18, _UPVALUE2_, A0_16)
  L2_18 = _UPVALUE0_
  L2_18 = L2_18.FALSE
  if L1_17 == L2_18 then
    L1_17 = _UPVALUE0_
    L1_17 = L1_17.NOT_EXIST
    return L1_17
  end
  L1_17 = nil
  L2_18 = db
  L2_18 = L2_18.getNextRowId
  L2_18 = L2_18(A0_16, _UPVALUE1_)
  L1_17 = L2_18
  L2_18 = _UPVALUE0_
  L2_18 = L2_18.NIL
  if L1_17 == L2_18 then
    L2_18 = _UPVALUE0_
    L2_18 = L2_18.NOT_EXIST
    return L2_18
  end
  L2_18 = db
  L2_18 = L2_18.getAttribute
  L2_18 = L2_18(_UPVALUE1_, _UPVALUE2_, L1_17, _UPVALUE3_.userName)
  if L2_18 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_17
  end
  return _UPVALUE0_.SUCCESS, L1_17, L2_18
end
function userNameSet(A0_19, A1_20)
  local L2_21
  L2_21 = _UPVALUE0_
  L2_21 = L2_21.NIL
  if A0_19 == L2_21 then
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.INVALID_ARGUMENT
    return L2_21
  end
  L2_21 = tonumber
  L2_21 = L2_21(A0_19)
  if L2_21 == _UPVALUE0_.NIL then
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.INVALID_ARGUMENT
    return L2_21
  end
  L2_21 = db
  L2_21 = L2_21.existsRow
  L2_21 = L2_21(_UPVALUE1_, _UPVALUE2_, A0_19)
  if L2_21 == _UPVALUE0_.FALSE then
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.NOT_EXIST
    return L2_21
  end
  L2_21 = _UPVALUE0_
  L2_21 = L2_21.NIL
  if A1_20 == L2_21 then
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.INVALID_ARGUMENT
    return L2_21
  end
  L2_21 = _UPVALUE3_
  L2_21 = L2_21.stringLengthCheck
  L2_21 = L2_21(_UPVALUE4_, _UPVALUE5_, A1_20)
  if L2_21 == _UPVALUE0_.FAILURE then
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.INVALID_ARGUMENT
    return L2_21
  end
  L2_21 = nil
  L2_21 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_19, _UPVALUE6_.userName, A1_20)
  if L2_21 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_19
  end
  return _UPVALUE0_.SUCCESS, A0_19
end
function passwordGet()
  local L0_22, L1_23
  L0_22 = db
  L0_22 = L0_22.getNextRowId
  L1_23 = _UPVALUE0_
  L0_22 = L0_22(L1_23, _UPVALUE1_)
  L1_23 = _UPVALUE2_
  L1_23 = L1_23.NIL
  if L0_22 == L1_23 then
    L1_23 = _UPVALUE2_
    L1_23 = L1_23.NOT_EXIST
    return L1_23
  end
  L1_23 = db
  L1_23 = L1_23.getAttribute
  L1_23 = L1_23(_UPVALUE1_, _UPVALUE3_, L0_22, _UPVALUE4_.password)
  if L1_23 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_22, L1_23
end
function passwordGetNext(A0_24)
  local L1_25, L2_26
  L1_25 = _UPVALUE0_
  L1_25 = L1_25.NIL
  if A0_24 == L1_25 then
    L1_25 = _UPVALUE0_
    L1_25 = L1_25.INVALID_ARGUMENT
    return L1_25
  end
  L1_25 = tonumber
  L2_26 = A0_24
  L1_25 = L1_25(L2_26)
  L2_26 = _UPVALUE0_
  L2_26 = L2_26.NIL
  if L1_25 == L2_26 then
    L1_25 = _UPVALUE0_
    L1_25 = L1_25.INVALID_ARGUMENT
    return L1_25
  end
  L1_25 = db
  L1_25 = L1_25.existsRow
  L2_26 = _UPVALUE1_
  L1_25 = L1_25(L2_26, _UPVALUE2_, A0_24)
  L2_26 = _UPVALUE0_
  L2_26 = L2_26.FALSE
  if L1_25 == L2_26 then
    L1_25 = _UPVALUE0_
    L1_25 = L1_25.NOT_EXIST
    return L1_25
  end
  L1_25 = nil
  L2_26 = db
  L2_26 = L2_26.getNextRowId
  L2_26 = L2_26(A0_24, _UPVALUE1_)
  L1_25 = L2_26
  L2_26 = _UPVALUE0_
  L2_26 = L2_26.NIL
  if L1_25 == L2_26 then
    L2_26 = _UPVALUE0_
    L2_26 = L2_26.NOT_EXIST
    return L2_26
  end
  L2_26 = db
  L2_26 = L2_26.getAttribute
  L2_26 = L2_26(_UPVALUE1_, _UPVALUE2_, L1_25, _UPVALUE3_.password)
  if L2_26 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_25
  end
  return _UPVALUE0_.SUCCESS, L1_25, L2_26
end
function passwordSet(A0_27, A1_28)
  local L2_29
  L2_29 = _UPVALUE0_
  L2_29 = L2_29.NIL
  if A0_27 == L2_29 then
    L2_29 = _UPVALUE0_
    L2_29 = L2_29.INVALID_ARGUMENT
    return L2_29
  end
  L2_29 = tonumber
  L2_29 = L2_29(A0_27)
  if L2_29 == _UPVALUE0_.NIL then
    L2_29 = _UPVALUE0_
    L2_29 = L2_29.INVALID_ARGUMENT
    return L2_29
  end
  L2_29 = db
  L2_29 = L2_29.existsRow
  L2_29 = L2_29(_UPVALUE1_, _UPVALUE2_, A0_27)
  if L2_29 == _UPVALUE0_.FALSE then
    L2_29 = _UPVALUE0_
    L2_29 = L2_29.NOT_EXIST
    return L2_29
  end
  L2_29 = _UPVALUE0_
  L2_29 = L2_29.NIL
  if A1_28 == L2_29 then
    L2_29 = _UPVALUE0_
    L2_29 = L2_29.INVALID_ARGUMENT
    return L2_29
  end
  L2_29 = _UPVALUE3_
  L2_29 = L2_29.stringLengthCheck
  L2_29 = L2_29(_UPVALUE4_, _UPVALUE5_, A1_28)
  if L2_29 == _UPVALUE0_.FAILURE then
    L2_29 = _UPVALUE0_
    L2_29 = L2_29.INVALID_ARGUMENT
    return L2_29
  end
  L2_29 = nil
  L2_29 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_27, _UPVALUE6_.password, A1_28)
  if L2_29 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_27
  end
  return _UPVALUE0_.SUCCESS, A0_27
end
function isuseDhcpEnabled()
  local L0_30, L1_31
  L0_30 = db
  L0_30 = L0_30.getNextRowId
  L1_31 = _UPVALUE0_
  L0_30 = L0_30(L1_31, _UPVALUE1_)
  L1_31 = _UPVALUE2_
  L1_31 = L1_31.NIL
  if L0_30 == L1_31 then
    L1_31 = _UPVALUE2_
    L1_31 = L1_31.NOT_EXIST
    return L1_31
  end
  L1_31 = db
  L1_31 = L1_31.getAttribute
  L1_31 = L1_31(_UPVALUE1_, _UPVALUE3_, L0_30, _UPVALUE4_.useDhcp)
  if L1_31 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_30, L1_31
end
function isuseDhcpEnabledNext(A0_32)
  local L1_33, L2_34
  L1_33 = _UPVALUE0_
  L1_33 = L1_33.NIL
  if A0_32 == L1_33 then
    L1_33 = _UPVALUE0_
    L1_33 = L1_33.INVALID_ARGUMENT
    return L1_33
  end
  L1_33 = tonumber
  L2_34 = A0_32
  L1_33 = L1_33(L2_34)
  L2_34 = _UPVALUE0_
  L2_34 = L2_34.NIL
  if L1_33 == L2_34 then
    L1_33 = _UPVALUE0_
    L1_33 = L1_33.INVALID_ARGUMENT
    return L1_33
  end
  L1_33 = db
  L1_33 = L1_33.existsRow
  L2_34 = _UPVALUE1_
  L1_33 = L1_33(L2_34, _UPVALUE2_, A0_32)
  L2_34 = _UPVALUE0_
  L2_34 = L2_34.FALSE
  if L1_33 == L2_34 then
    L1_33 = _UPVALUE0_
    L1_33 = L1_33.NOT_EXIST
    return L1_33
  end
  L1_33 = nil
  L2_34 = db
  L2_34 = L2_34.getNextRowId
  L2_34 = L2_34(A0_32, _UPVALUE1_)
  L1_33 = L2_34
  L2_34 = _UPVALUE0_
  L2_34 = L2_34.NIL
  if L1_33 == L2_34 then
    L2_34 = _UPVALUE0_
    L2_34 = L2_34.NOT_EXIST
    return L2_34
  end
  L2_34 = db
  L2_34 = L2_34.getAttribute
  L2_34 = L2_34(_UPVALUE1_, _UPVALUE2_, L1_33, _UPVALUE3_.useDhcp)
  if L2_34 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_33
  end
  return _UPVALUE0_.SUCCESS, L1_33, L2_34
end
function useDhcpEnable(A0_35)
  local L1_36
  L1_36 = _UPVALUE0_
  L1_36 = L1_36.NIL
  if A0_35 == L1_36 then
    L1_36 = _UPVALUE0_
    L1_36 = L1_36.INVALID_ARGUMENT
    return L1_36
  end
  L1_36 = tonumber
  L1_36 = L1_36(A0_35)
  if L1_36 == _UPVALUE0_.NIL then
    L1_36 = _UPVALUE0_
    L1_36 = L1_36.INVALID_ARGUMENT
    return L1_36
  end
  L1_36 = db
  L1_36 = L1_36.existsRow
  L1_36 = L1_36(_UPVALUE1_, _UPVALUE2_, A0_35)
  if L1_36 == _UPVALUE0_.FALSE then
    L1_36 = _UPVALUE0_
    L1_36 = L1_36.NOT_EXIST
    return L1_36
  end
  L1_36 = nil
  L1_36 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_35, _UPVALUE3_.useDhcp, _UPVALUE4_)
  if L1_36 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_35
  end
  return _UPVALUE0_.SUCCESS, A0_35
end
function useDhcpDisable(A0_37)
  local L1_38
  L1_38 = _UPVALUE0_
  L1_38 = L1_38.NIL
  if A0_37 == L1_38 then
    L1_38 = _UPVALUE0_
    L1_38 = L1_38.INVALID_ARGUMENT
    return L1_38
  end
  L1_38 = tonumber
  L1_38 = L1_38(A0_37)
  if L1_38 == _UPVALUE0_.NIL then
    L1_38 = _UPVALUE0_
    L1_38 = L1_38.INVALID_ARGUMENT
    return L1_38
  end
  L1_38 = db
  L1_38 = L1_38.existsRow
  L1_38 = L1_38(_UPVALUE1_, _UPVALUE2_, A0_37)
  if L1_38 == _UPVALUE0_.FALSE then
    L1_38 = _UPVALUE0_
    L1_38 = L1_38.NOT_EXIST
    return L1_38
  end
  L1_38 = nil
  L1_38 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_37, _UPVALUE3_.useDhcp, _UPVALUE4_)
  if L1_38 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_37
  end
  return _UPVALUE0_.SUCCESS, A0_37
end
function isuseIspDnsEnabled()
  local L0_39, L1_40
  L0_39 = db
  L0_39 = L0_39.getNextRowId
  L1_40 = _UPVALUE0_
  L0_39 = L0_39(L1_40, _UPVALUE1_)
  L1_40 = _UPVALUE2_
  L1_40 = L1_40.NIL
  if L0_39 == L1_40 then
    L1_40 = _UPVALUE2_
    L1_40 = L1_40.NOT_EXIST
    return L1_40
  end
  L1_40 = db
  L1_40 = L1_40.getAttribute
  L1_40 = L1_40(_UPVALUE1_, _UPVALUE3_, L0_39, _UPVALUE4_.useIspDns)
  if L1_40 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_39, L1_40
end
function isuseIspDnsEnabledNext(A0_41)
  local L1_42, L2_43
  L1_42 = _UPVALUE0_
  L1_42 = L1_42.NIL
  if A0_41 == L1_42 then
    L1_42 = _UPVALUE0_
    L1_42 = L1_42.INVALID_ARGUMENT
    return L1_42
  end
  L1_42 = tonumber
  L2_43 = A0_41
  L1_42 = L1_42(L2_43)
  L2_43 = _UPVALUE0_
  L2_43 = L2_43.NIL
  if L1_42 == L2_43 then
    L1_42 = _UPVALUE0_
    L1_42 = L1_42.INVALID_ARGUMENT
    return L1_42
  end
  L1_42 = db
  L1_42 = L1_42.existsRow
  L2_43 = _UPVALUE1_
  L1_42 = L1_42(L2_43, _UPVALUE2_, A0_41)
  L2_43 = _UPVALUE0_
  L2_43 = L2_43.FALSE
  if L1_42 == L2_43 then
    L1_42 = _UPVALUE0_
    L1_42 = L1_42.NOT_EXIST
    return L1_42
  end
  L1_42 = nil
  L2_43 = db
  L2_43 = L2_43.getNextRowId
  L2_43 = L2_43(A0_41, _UPVALUE1_)
  L1_42 = L2_43
  L2_43 = _UPVALUE0_
  L2_43 = L2_43.NIL
  if L1_42 == L2_43 then
    L2_43 = _UPVALUE0_
    L2_43 = L2_43.NOT_EXIST
    return L2_43
  end
  L2_43 = db
  L2_43 = L2_43.getAttribute
  L2_43 = L2_43(_UPVALUE1_, _UPVALUE2_, L1_42, _UPVALUE3_.useIspDns)
  if L2_43 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_42
  end
  return _UPVALUE0_.SUCCESS, L1_42, L2_43
end
function useIspDnsEnable(A0_44)
  local L1_45
  L1_45 = _UPVALUE0_
  L1_45 = L1_45.NIL
  if A0_44 == L1_45 then
    L1_45 = _UPVALUE0_
    L1_45 = L1_45.INVALID_ARGUMENT
    return L1_45
  end
  L1_45 = tonumber
  L1_45 = L1_45(A0_44)
  if L1_45 == _UPVALUE0_.NIL then
    L1_45 = _UPVALUE0_
    L1_45 = L1_45.INVALID_ARGUMENT
    return L1_45
  end
  L1_45 = db
  L1_45 = L1_45.existsRow
  L1_45 = L1_45(_UPVALUE1_, _UPVALUE2_, A0_44)
  if L1_45 == _UPVALUE0_.FALSE then
    L1_45 = _UPVALUE0_
    L1_45 = L1_45.NOT_EXIST
    return L1_45
  end
  L1_45 = nil
  L1_45 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_44, _UPVALUE3_.useIspDns, _UPVALUE4_)
  if L1_45 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_44
  end
  return _UPVALUE0_.SUCCESS, A0_44
end
function useIspDnsDisable(A0_46)
  local L1_47
  L1_47 = _UPVALUE0_
  L1_47 = L1_47.NIL
  if A0_46 == L1_47 then
    L1_47 = _UPVALUE0_
    L1_47 = L1_47.INVALID_ARGUMENT
    return L1_47
  end
  L1_47 = tonumber
  L1_47 = L1_47(A0_46)
  if L1_47 == _UPVALUE0_.NIL then
    L1_47 = _UPVALUE0_
    L1_47 = L1_47.INVALID_ARGUMENT
    return L1_47
  end
  L1_47 = db
  L1_47 = L1_47.existsRow
  L1_47 = L1_47(_UPVALUE1_, _UPVALUE2_, A0_46)
  if L1_47 == _UPVALUE0_.FALSE then
    L1_47 = _UPVALUE0_
    L1_47 = L1_47.NOT_EXIST
    return L1_47
  end
  L1_47 = nil
  L1_47 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_46, _UPVALUE3_.useIspDns, _UPVALUE4_)
  if L1_47 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_46
  end
  return _UPVALUE0_.SUCCESS, A0_46
end
function serverIPAddressGet()
  local L0_48, L1_49
  L0_48 = db
  L0_48 = L0_48.getNextRowId
  L1_49 = _UPVALUE0_
  L0_48 = L0_48(L1_49, _UPVALUE1_)
  L1_49 = _UPVALUE2_
  L1_49 = L1_49.NIL
  if L0_48 == L1_49 then
    L1_49 = _UPVALUE2_
    L1_49 = L1_49.NOT_EXIST
    return L1_49
  end
  L1_49 = db
  L1_49 = L1_49.getAttribute
  L1_49 = L1_49(_UPVALUE1_, _UPVALUE3_, L0_48, _UPVALUE4_.serverIPAddress)
  if L1_49 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_48, L1_49
end
function serverIPAddressGetNext(A0_50)
  local L1_51, L2_52
  L1_51 = _UPVALUE0_
  L1_51 = L1_51.NIL
  if A0_50 == L1_51 then
    L1_51 = _UPVALUE0_
    L1_51 = L1_51.INVALID_ARGUMENT
    return L1_51
  end
  L1_51 = tonumber
  L2_52 = A0_50
  L1_51 = L1_51(L2_52)
  L2_52 = _UPVALUE0_
  L2_52 = L2_52.NIL
  if L1_51 == L2_52 then
    L1_51 = _UPVALUE0_
    L1_51 = L1_51.INVALID_ARGUMENT
    return L1_51
  end
  L1_51 = db
  L1_51 = L1_51.existsRow
  L2_52 = _UPVALUE1_
  L1_51 = L1_51(L2_52, _UPVALUE2_, A0_50)
  L2_52 = _UPVALUE0_
  L2_52 = L2_52.FALSE
  if L1_51 == L2_52 then
    L1_51 = _UPVALUE0_
    L1_51 = L1_51.NOT_EXIST
    return L1_51
  end
  L1_51 = nil
  L2_52 = db
  L2_52 = L2_52.getNextRowId
  L2_52 = L2_52(A0_50, _UPVALUE1_)
  L1_51 = L2_52
  L2_52 = _UPVALUE0_
  L2_52 = L2_52.NIL
  if L1_51 == L2_52 then
    L2_52 = _UPVALUE0_
    L2_52 = L2_52.NOT_EXIST
    return L2_52
  end
  L2_52 = db
  L2_52 = L2_52.getAttribute
  L2_52 = L2_52(_UPVALUE1_, _UPVALUE2_, L1_51, _UPVALUE3_.serverIPAddress)
  if L2_52 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_51
  end
  return _UPVALUE0_.SUCCESS, L1_51, L2_52
end
function serverIPAddressSet(A0_53, A1_54)
  local L2_55
  L2_55 = _UPVALUE0_
  L2_55 = L2_55.NIL
  if A0_53 == L2_55 then
    L2_55 = _UPVALUE0_
    L2_55 = L2_55.INVALID_ARGUMENT
    return L2_55
  end
  L2_55 = tonumber
  L2_55 = L2_55(A0_53)
  if L2_55 == _UPVALUE0_.NIL then
    L2_55 = _UPVALUE0_
    L2_55 = L2_55.INVALID_ARGUMENT
    return L2_55
  end
  L2_55 = db
  L2_55 = L2_55.existsRow
  L2_55 = L2_55(_UPVALUE1_, _UPVALUE2_, A0_53)
  if L2_55 == _UPVALUE0_.FALSE then
    L2_55 = _UPVALUE0_
    L2_55 = L2_55.NOT_EXIST
    return L2_55
  end
  L2_55 = _UPVALUE0_
  L2_55 = L2_55.NIL
  if A1_54 == L2_55 then
    L2_55 = _UPVALUE0_
    L2_55 = L2_55.INVALID_ARGUMENT
    return L2_55
  end
  L2_55 = _UPVALUE3_
  L2_55 = L2_55.ipAddressCheck
  L2_55 = L2_55(_UPVALUE4_, A1_54)
  valid = L2_55
  L2_55 = valid
  if L2_55 ~= _UPVALUE0_.SUCCESS then
    L2_55 = _UPVALUE0_
    L2_55 = L2_55.INVALID_ARGUMENT
    return L2_55
  end
  L2_55 = nil
  L2_55 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_53, _UPVALUE5_.serverIPAddress, A1_54)
  if L2_55 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_53
  end
  return _UPVALUE0_.SUCCESS, A0_53
end
function myIpGet()
  local L0_56, L1_57
  L0_56 = db
  L0_56 = L0_56.getNextRowId
  L1_57 = _UPVALUE0_
  L0_56 = L0_56(L1_57, _UPVALUE1_)
  L1_57 = _UPVALUE2_
  L1_57 = L1_57.NIL
  if L0_56 == L1_57 then
    L1_57 = _UPVALUE2_
    L1_57 = L1_57.NOT_EXIST
    return L1_57
  end
  L1_57 = db
  L1_57 = L1_57.getAttribute
  L1_57 = L1_57(_UPVALUE1_, _UPVALUE3_, L0_56, _UPVALUE4_.myIp)
  if L1_57 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_56, L1_57
end
function myIpGetNext(A0_58)
  local L1_59, L2_60
  L1_59 = _UPVALUE0_
  L1_59 = L1_59.NIL
  if A0_58 == L1_59 then
    L1_59 = _UPVALUE0_
    L1_59 = L1_59.INVALID_ARGUMENT
    return L1_59
  end
  L1_59 = tonumber
  L2_60 = A0_58
  L1_59 = L1_59(L2_60)
  L2_60 = _UPVALUE0_
  L2_60 = L2_60.NIL
  if L1_59 == L2_60 then
    L1_59 = _UPVALUE0_
    L1_59 = L1_59.INVALID_ARGUMENT
    return L1_59
  end
  L1_59 = db
  L1_59 = L1_59.existsRow
  L2_60 = _UPVALUE1_
  L1_59 = L1_59(L2_60, _UPVALUE2_, A0_58)
  L2_60 = _UPVALUE0_
  L2_60 = L2_60.FALSE
  if L1_59 == L2_60 then
    L1_59 = _UPVALUE0_
    L1_59 = L1_59.NOT_EXIST
    return L1_59
  end
  L1_59 = nil
  L2_60 = db
  L2_60 = L2_60.getNextRowId
  L2_60 = L2_60(A0_58, _UPVALUE1_)
  L1_59 = L2_60
  L2_60 = _UPVALUE0_
  L2_60 = L2_60.NIL
  if L1_59 == L2_60 then
    L2_60 = _UPVALUE0_
    L2_60 = L2_60.NOT_EXIST
    return L2_60
  end
  L2_60 = db
  L2_60 = L2_60.getAttribute
  L2_60 = L2_60(_UPVALUE1_, _UPVALUE2_, L1_59, _UPVALUE3_.myIp)
  if L2_60 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_59
  end
  return _UPVALUE0_.SUCCESS, L1_59, L2_60
end
function myIpSet(A0_61, A1_62)
  local L2_63
  L2_63 = _UPVALUE0_
  L2_63 = L2_63.NIL
  if A0_61 == L2_63 then
    L2_63 = _UPVALUE0_
    L2_63 = L2_63.INVALID_ARGUMENT
    return L2_63
  end
  L2_63 = tonumber
  L2_63 = L2_63(A0_61)
  if L2_63 == _UPVALUE0_.NIL then
    L2_63 = _UPVALUE0_
    L2_63 = L2_63.INVALID_ARGUMENT
    return L2_63
  end
  L2_63 = db
  L2_63 = L2_63.existsRow
  L2_63 = L2_63(_UPVALUE1_, _UPVALUE2_, A0_61)
  if L2_63 == _UPVALUE0_.FALSE then
    L2_63 = _UPVALUE0_
    L2_63 = L2_63.NOT_EXIST
    return L2_63
  end
  L2_63 = _UPVALUE0_
  L2_63 = L2_63.NIL
  if A1_62 == L2_63 then
    L2_63 = _UPVALUE0_
    L2_63 = L2_63.INVALID_ARGUMENT
    return L2_63
  end
  L2_63 = _UPVALUE3_
  L2_63 = L2_63.ipAddressCheck
  L2_63 = L2_63(_UPVALUE4_, A1_62)
  valid = L2_63
  L2_63 = valid
  if L2_63 ~= _UPVALUE0_.SUCCESS then
    L2_63 = _UPVALUE0_
    L2_63 = L2_63.INVALID_ARGUMENT
    return L2_63
  end
  L2_63 = nil
  L2_63 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_61, _UPVALUE5_.myIp, A1_62)
  if L2_63 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_61
  end
  return _UPVALUE0_.SUCCESS, A0_61
end
function staticIPAddressGet()
  local L0_64, L1_65
  L0_64 = db
  L0_64 = L0_64.getNextRowId
  L1_65 = _UPVALUE0_
  L0_64 = L0_64(L1_65, _UPVALUE1_)
  L1_65 = _UPVALUE2_
  L1_65 = L1_65.NIL
  if L0_64 == L1_65 then
    L1_65 = _UPVALUE2_
    L1_65 = L1_65.NOT_EXIST
    return L1_65
  end
  L1_65 = db
  L1_65 = L1_65.getAttribute
  L1_65 = L1_65(_UPVALUE1_, _UPVALUE3_, L0_64, _UPVALUE4_.staticIPAddress)
  if L1_65 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_64, L1_65
end
function staticIPAddressGetNext(A0_66)
  local L1_67, L2_68
  L1_67 = _UPVALUE0_
  L1_67 = L1_67.NIL
  if A0_66 == L1_67 then
    L1_67 = _UPVALUE0_
    L1_67 = L1_67.INVALID_ARGUMENT
    return L1_67
  end
  L1_67 = tonumber
  L2_68 = A0_66
  L1_67 = L1_67(L2_68)
  L2_68 = _UPVALUE0_
  L2_68 = L2_68.NIL
  if L1_67 == L2_68 then
    L1_67 = _UPVALUE0_
    L1_67 = L1_67.INVALID_ARGUMENT
    return L1_67
  end
  L1_67 = db
  L1_67 = L1_67.existsRow
  L2_68 = _UPVALUE1_
  L1_67 = L1_67(L2_68, _UPVALUE2_, A0_66)
  L2_68 = _UPVALUE0_
  L2_68 = L2_68.FALSE
  if L1_67 == L2_68 then
    L1_67 = _UPVALUE0_
    L1_67 = L1_67.NOT_EXIST
    return L1_67
  end
  L1_67 = nil
  L2_68 = db
  L2_68 = L2_68.getNextRowId
  L2_68 = L2_68(A0_66, _UPVALUE1_)
  L1_67 = L2_68
  L2_68 = _UPVALUE0_
  L2_68 = L2_68.NIL
  if L1_67 == L2_68 then
    L2_68 = _UPVALUE0_
    L2_68 = L2_68.NOT_EXIST
    return L2_68
  end
  L2_68 = db
  L2_68 = L2_68.getAttribute
  L2_68 = L2_68(_UPVALUE1_, _UPVALUE2_, L1_67, _UPVALUE3_.staticIPAddress)
  if L2_68 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_67
  end
  return _UPVALUE0_.SUCCESS, L1_67, L2_68
end
function staticIPAddressSet(A0_69, A1_70)
  local L2_71, L3_72
  L2_71 = db
  L2_71 = L2_71.getAttribute
  L3_72 = _UPVALUE0_
  L2_71 = L2_71(L3_72, _UPVALUE1_, A0_69, _UPVALUE2_.useDhcp)
  L3_72 = tonumber
  L3_72 = L3_72(L2_71)
  if L3_72 ~= _UPVALUE3_ then
    L3_72 = _UPVALUE4_
    L3_72 = L3_72.DEPENDENCY_NOT_MET
    return L3_72
  end
  L3_72 = _UPVALUE4_
  L3_72 = L3_72.NIL
  if A0_69 == L3_72 then
    L3_72 = _UPVALUE4_
    L3_72 = L3_72.INVALID_ARGUMENT
    return L3_72
  end
  L3_72 = tonumber
  L3_72 = L3_72(A0_69)
  if L3_72 == _UPVALUE4_.NIL then
    L3_72 = _UPVALUE4_
    L3_72 = L3_72.INVALID_ARGUMENT
    return L3_72
  end
  L3_72 = db
  L3_72 = L3_72.existsRow
  L3_72 = L3_72(_UPVALUE0_, _UPVALUE1_, A0_69)
  if L3_72 == _UPVALUE4_.FALSE then
    L3_72 = _UPVALUE4_
    L3_72 = L3_72.NOT_EXIST
    return L3_72
  end
  L3_72 = _UPVALUE4_
  L3_72 = L3_72.NIL
  if A1_70 == L3_72 then
    L3_72 = _UPVALUE4_
    L3_72 = L3_72.INVALID_ARGUMENT
    return L3_72
  end
  L3_72 = _UPVALUE5_
  L3_72 = L3_72.ipAddressCheck
  L3_72 = L3_72(_UPVALUE6_, A1_70)
  valid = L3_72
  L3_72 = valid
  if L3_72 ~= _UPVALUE4_.SUCCESS then
    L3_72 = _UPVALUE4_
    L3_72 = L3_72.INVALID_ARGUMENT
    return L3_72
  end
  L3_72 = nil
  L3_72 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, A0_69, _UPVALUE2_.staticIPAddress, A1_70)
  if L3_72 == _UPVALUE4_.FALSE then
    return _UPVALUE4_.FAILURE, A0_69
  end
  return _UPVALUE4_.SUCCESS, A0_69
end
function gatewayGet()
  local L0_73, L1_74
  L0_73 = db
  L0_73 = L0_73.getNextRowId
  L1_74 = _UPVALUE0_
  L0_73 = L0_73(L1_74, _UPVALUE1_)
  L1_74 = _UPVALUE2_
  L1_74 = L1_74.NIL
  if L0_73 == L1_74 then
    L1_74 = _UPVALUE2_
    L1_74 = L1_74.NOT_EXIST
    return L1_74
  end
  L1_74 = db
  L1_74 = L1_74.getAttribute
  L1_74 = L1_74(_UPVALUE1_, _UPVALUE3_, L0_73, _UPVALUE4_.gateway)
  if L1_74 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_73, L1_74
end
function gatewayGetNext(A0_75)
  local L1_76, L2_77
  L1_76 = _UPVALUE0_
  L1_76 = L1_76.NIL
  if A0_75 == L1_76 then
    L1_76 = _UPVALUE0_
    L1_76 = L1_76.INVALID_ARGUMENT
    return L1_76
  end
  L1_76 = tonumber
  L2_77 = A0_75
  L1_76 = L1_76(L2_77)
  L2_77 = _UPVALUE0_
  L2_77 = L2_77.NIL
  if L1_76 == L2_77 then
    L1_76 = _UPVALUE0_
    L1_76 = L1_76.INVALID_ARGUMENT
    return L1_76
  end
  L1_76 = db
  L1_76 = L1_76.existsRow
  L2_77 = _UPVALUE1_
  L1_76 = L1_76(L2_77, _UPVALUE2_, A0_75)
  L2_77 = _UPVALUE0_
  L2_77 = L2_77.FALSE
  if L1_76 == L2_77 then
    L1_76 = _UPVALUE0_
    L1_76 = L1_76.NOT_EXIST
    return L1_76
  end
  L1_76 = nil
  L2_77 = db
  L2_77 = L2_77.getNextRowId
  L2_77 = L2_77(A0_75, _UPVALUE1_)
  L1_76 = L2_77
  L2_77 = _UPVALUE0_
  L2_77 = L2_77.NIL
  if L1_76 == L2_77 then
    L2_77 = _UPVALUE0_
    L2_77 = L2_77.NOT_EXIST
    return L2_77
  end
  L2_77 = db
  L2_77 = L2_77.getAttribute
  L2_77 = L2_77(_UPVALUE1_, _UPVALUE2_, L1_76, _UPVALUE3_.gateway)
  if L2_77 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_76
  end
  return _UPVALUE0_.SUCCESS, L1_76, L2_77
end
function gatewaySet(A0_78, A1_79)
  local L2_80
  L2_80 = _UPVALUE0_
  L2_80 = L2_80.NIL
  if A0_78 == L2_80 then
    L2_80 = _UPVALUE0_
    L2_80 = L2_80.INVALID_ARGUMENT
    return L2_80
  end
  L2_80 = tonumber
  L2_80 = L2_80(A0_78)
  if L2_80 == _UPVALUE0_.NIL then
    L2_80 = _UPVALUE0_
    L2_80 = L2_80.INVALID_ARGUMENT
    return L2_80
  end
  L2_80 = db
  L2_80 = L2_80.existsRow
  L2_80 = L2_80(_UPVALUE1_, _UPVALUE2_, A0_78)
  if L2_80 == _UPVALUE0_.FALSE then
    L2_80 = _UPVALUE0_
    L2_80 = L2_80.NOT_EXIST
    return L2_80
  end
  L2_80 = _UPVALUE0_
  L2_80 = L2_80.NIL
  if A1_79 == L2_80 then
    L2_80 = _UPVALUE0_
    L2_80 = L2_80.INVALID_ARGUMENT
    return L2_80
  end
  L2_80 = _UPVALUE3_
  L2_80 = L2_80.ipAddressCheck
  L2_80 = L2_80(_UPVALUE4_, A1_79)
  valid = L2_80
  L2_80 = valid
  if L2_80 ~= _UPVALUE0_.SUCCESS then
    L2_80 = _UPVALUE0_
    L2_80 = L2_80.INVALID_ARGUMENT
    return L2_80
  end
  L2_80 = nil
  L2_80 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_78, _UPVALUE5_.gateway, A1_79)
  if L2_80 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_78
  end
  return _UPVALUE0_.SUCCESS, A0_78
end
function netmaskGet()
  local L0_81, L1_82
  L0_81 = db
  L0_81 = L0_81.getNextRowId
  L1_82 = _UPVALUE0_
  L0_81 = L0_81(L1_82, _UPVALUE1_)
  L1_82 = _UPVALUE2_
  L1_82 = L1_82.NIL
  if L0_81 == L1_82 then
    L1_82 = _UPVALUE2_
    L1_82 = L1_82.NOT_EXIST
    return L1_82
  end
  L1_82 = db
  L1_82 = L1_82.getAttribute
  L1_82 = L1_82(_UPVALUE1_, _UPVALUE3_, L0_81, _UPVALUE4_.netmask)
  if L1_82 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_81, L1_82
end
function netmaskGetNext(A0_83)
  local L1_84, L2_85
  L1_84 = _UPVALUE0_
  L1_84 = L1_84.NIL
  if A0_83 == L1_84 then
    L1_84 = _UPVALUE0_
    L1_84 = L1_84.INVALID_ARGUMENT
    return L1_84
  end
  L1_84 = tonumber
  L2_85 = A0_83
  L1_84 = L1_84(L2_85)
  L2_85 = _UPVALUE0_
  L2_85 = L2_85.NIL
  if L1_84 == L2_85 then
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
    L1_84 = L1_84.NOT_EXIST
    return L1_84
  end
  L1_84 = nil
  L2_85 = db
  L2_85 = L2_85.getNextRowId
  L2_85 = L2_85(A0_83, _UPVALUE1_)
  L1_84 = L2_85
  L2_85 = _UPVALUE0_
  L2_85 = L2_85.NIL
  if L1_84 == L2_85 then
    L2_85 = _UPVALUE0_
    L2_85 = L2_85.NOT_EXIST
    return L2_85
  end
  L2_85 = db
  L2_85 = L2_85.getAttribute
  L2_85 = L2_85(_UPVALUE1_, _UPVALUE2_, L1_84, _UPVALUE3_.netmask)
  if L2_85 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_84
  end
  return _UPVALUE0_.SUCCESS, L1_84, L2_85
end
function netmaskSet(A0_86, A1_87)
  local L2_88, L3_89
  L2_88 = db
  L2_88 = L2_88.getAttribute
  L3_89 = _UPVALUE0_
  L2_88 = L2_88(L3_89, _UPVALUE1_, A0_86, _UPVALUE2_.useDhcp)
  L3_89 = tonumber
  L3_89 = L3_89(L2_88)
  if L3_89 ~= _UPVALUE3_ then
    L3_89 = _UPVALUE4_
    L3_89 = L3_89.DEPENDENCY_NOT_MET
    return L3_89
  end
  L3_89 = _UPVALUE4_
  L3_89 = L3_89.NIL
  if A0_86 == L3_89 then
    L3_89 = _UPVALUE4_
    L3_89 = L3_89.INVALID_ARGUMENT
    return L3_89
  end
  L3_89 = tonumber
  L3_89 = L3_89(A0_86)
  if L3_89 == _UPVALUE4_.NIL then
    L3_89 = _UPVALUE4_
    L3_89 = L3_89.INVALID_ARGUMENT
    return L3_89
  end
  L3_89 = db
  L3_89 = L3_89.existsRow
  L3_89 = L3_89(_UPVALUE0_, _UPVALUE1_, A0_86)
  if L3_89 == _UPVALUE4_.FALSE then
    L3_89 = _UPVALUE4_
    L3_89 = L3_89.NOT_EXIST
    return L3_89
  end
  L3_89 = _UPVALUE4_
  L3_89 = L3_89.NIL
  if A1_87 == L3_89 then
    L3_89 = _UPVALUE4_
    L3_89 = L3_89.INVALID_ARGUMENT
    return L3_89
  end
  L3_89 = _UPVALUE5_
  L3_89 = L3_89.ipAddressCheck
  L3_89 = L3_89(_UPVALUE6_, A1_87)
  valid = L3_89
  L3_89 = valid
  if L3_89 ~= _UPVALUE4_.SUCCESS then
    L3_89 = _UPVALUE4_
    L3_89 = L3_89.INVALID_ARGUMENT
    return L3_89
  end
  L3_89 = nil
  L3_89 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, A0_86, _UPVALUE2_.netmask, A1_87)
  if L3_89 == _UPVALUE4_.FALSE then
    return _UPVALUE4_.FAILURE, A0_86
  end
  return _UPVALUE4_.SUCCESS, A0_86
end
function primaryDNSGet()
  local L0_90, L1_91
  L0_90 = db
  L0_90 = L0_90.getNextRowId
  L1_91 = _UPVALUE0_
  L0_90 = L0_90(L1_91, _UPVALUE1_)
  L1_91 = _UPVALUE2_
  L1_91 = L1_91.NIL
  if L0_90 == L1_91 then
    L1_91 = _UPVALUE2_
    L1_91 = L1_91.NOT_EXIST
    return L1_91
  end
  L1_91 = db
  L1_91 = L1_91.getAttribute
  L1_91 = L1_91(_UPVALUE1_, _UPVALUE3_, L0_90, _UPVALUE4_.primaryDNS)
  if L1_91 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_90, L1_91
end
function primaryDNSGetNext(A0_92)
  local L1_93, L2_94
  L1_93 = _UPVALUE0_
  L1_93 = L1_93.NIL
  if A0_92 == L1_93 then
    L1_93 = _UPVALUE0_
    L1_93 = L1_93.INVALID_ARGUMENT
    return L1_93
  end
  L1_93 = tonumber
  L2_94 = A0_92
  L1_93 = L1_93(L2_94)
  L2_94 = _UPVALUE0_
  L2_94 = L2_94.NIL
  if L1_93 == L2_94 then
    L1_93 = _UPVALUE0_
    L1_93 = L1_93.INVALID_ARGUMENT
    return L1_93
  end
  L1_93 = db
  L1_93 = L1_93.existsRow
  L2_94 = _UPVALUE1_
  L1_93 = L1_93(L2_94, _UPVALUE2_, A0_92)
  L2_94 = _UPVALUE0_
  L2_94 = L2_94.FALSE
  if L1_93 == L2_94 then
    L1_93 = _UPVALUE0_
    L1_93 = L1_93.NOT_EXIST
    return L1_93
  end
  L1_93 = nil
  L2_94 = db
  L2_94 = L2_94.getNextRowId
  L2_94 = L2_94(A0_92, _UPVALUE1_)
  L1_93 = L2_94
  L2_94 = _UPVALUE0_
  L2_94 = L2_94.NIL
  if L1_93 == L2_94 then
    L2_94 = _UPVALUE0_
    L2_94 = L2_94.NOT_EXIST
    return L2_94
  end
  L2_94 = db
  L2_94 = L2_94.getAttribute
  L2_94 = L2_94(_UPVALUE1_, _UPVALUE2_, L1_93, _UPVALUE3_.primaryDNS)
  if L2_94 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_93
  end
  return _UPVALUE0_.SUCCESS, L1_93, L2_94
end
function primaryDNSSet(A0_95, A1_96)
  local L2_97, L3_98
  L2_97 = db
  L2_97 = L2_97.getAttribute
  L3_98 = _UPVALUE0_
  L2_97 = L2_97(L3_98, _UPVALUE1_, A0_95, _UPVALUE2_.useIspDns)
  L3_98 = tonumber
  L3_98 = L3_98(L2_97)
  if L3_98 ~= _UPVALUE3_ then
    L3_98 = _UPVALUE4_
    L3_98 = L3_98.DEPENDENCY_NOT_MET
    return L3_98
  end
  L3_98 = _UPVALUE4_
  L3_98 = L3_98.NIL
  if A0_95 == L3_98 then
    L3_98 = _UPVALUE4_
    L3_98 = L3_98.INVALID_ARGUMENT
    return L3_98
  end
  L3_98 = tonumber
  L3_98 = L3_98(A0_95)
  if L3_98 == _UPVALUE4_.NIL then
    L3_98 = _UPVALUE4_
    L3_98 = L3_98.INVALID_ARGUMENT
    return L3_98
  end
  L3_98 = db
  L3_98 = L3_98.existsRow
  L3_98 = L3_98(_UPVALUE0_, _UPVALUE1_, A0_95)
  if L3_98 == _UPVALUE4_.FALSE then
    L3_98 = _UPVALUE4_
    L3_98 = L3_98.NOT_EXIST
    return L3_98
  end
  L3_98 = _UPVALUE4_
  L3_98 = L3_98.NIL
  if A1_96 == L3_98 then
    L3_98 = _UPVALUE4_
    L3_98 = L3_98.INVALID_ARGUMENT
    return L3_98
  end
  L3_98 = _UPVALUE5_
  L3_98 = L3_98.ipAddressCheck
  L3_98 = L3_98(_UPVALUE6_, A1_96)
  valid = L3_98
  L3_98 = valid
  if L3_98 ~= _UPVALUE4_.SUCCESS then
    L3_98 = _UPVALUE4_
    L3_98 = L3_98.INVALID_ARGUMENT
    return L3_98
  end
  L3_98 = nil
  L3_98 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, A0_95, _UPVALUE2_.primaryDNS, A1_96)
  if L3_98 == _UPVALUE4_.FALSE then
    return _UPVALUE4_.FAILURE, A0_95
  end
  return _UPVALUE4_.SUCCESS, A0_95
end
function secondaryDNSGet()
  local L0_99, L1_100
  L0_99 = db
  L0_99 = L0_99.getNextRowId
  L1_100 = _UPVALUE0_
  L0_99 = L0_99(L1_100, _UPVALUE1_)
  L1_100 = _UPVALUE2_
  L1_100 = L1_100.NIL
  if L0_99 == L1_100 then
    L1_100 = _UPVALUE2_
    L1_100 = L1_100.NOT_EXIST
    return L1_100
  end
  L1_100 = db
  L1_100 = L1_100.getAttribute
  L1_100 = L1_100(_UPVALUE1_, _UPVALUE3_, L0_99, _UPVALUE4_.secondaryDNS)
  if L1_100 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_99, L1_100
end
function secondaryDNSGetNext(A0_101)
  local L1_102, L2_103
  L1_102 = _UPVALUE0_
  L1_102 = L1_102.NIL
  if A0_101 == L1_102 then
    L1_102 = _UPVALUE0_
    L1_102 = L1_102.INVALID_ARGUMENT
    return L1_102
  end
  L1_102 = tonumber
  L2_103 = A0_101
  L1_102 = L1_102(L2_103)
  L2_103 = _UPVALUE0_
  L2_103 = L2_103.NIL
  if L1_102 == L2_103 then
    L1_102 = _UPVALUE0_
    L1_102 = L1_102.INVALID_ARGUMENT
    return L1_102
  end
  L1_102 = db
  L1_102 = L1_102.existsRow
  L2_103 = _UPVALUE1_
  L1_102 = L1_102(L2_103, _UPVALUE2_, A0_101)
  L2_103 = _UPVALUE0_
  L2_103 = L2_103.FALSE
  if L1_102 == L2_103 then
    L1_102 = _UPVALUE0_
    L1_102 = L1_102.NOT_EXIST
    return L1_102
  end
  L1_102 = nil
  L2_103 = db
  L2_103 = L2_103.getNextRowId
  L2_103 = L2_103(A0_101, _UPVALUE1_)
  L1_102 = L2_103
  L2_103 = _UPVALUE0_
  L2_103 = L2_103.NIL
  if L1_102 == L2_103 then
    L2_103 = _UPVALUE0_
    L2_103 = L2_103.NOT_EXIST
    return L2_103
  end
  L2_103 = db
  L2_103 = L2_103.getAttribute
  L2_103 = L2_103(_UPVALUE1_, _UPVALUE2_, L1_102, _UPVALUE3_.secondaryDNS)
  if L2_103 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_102
  end
  return _UPVALUE0_.SUCCESS, L1_102, L2_103
end
function secondaryDNSSet(A0_104, A1_105)
  local L2_106, L3_107
  L2_106 = db
  L2_106 = L2_106.getAttribute
  L3_107 = _UPVALUE0_
  L2_106 = L2_106(L3_107, _UPVALUE1_, A0_104, _UPVALUE2_.useIspDns)
  L3_107 = tonumber
  L3_107 = L3_107(L2_106)
  if L3_107 ~= _UPVALUE3_ then
    L3_107 = _UPVALUE4_
    L3_107 = L3_107.DEPENDENCY_NOT_MET
    return L3_107
  end
  L3_107 = _UPVALUE4_
  L3_107 = L3_107.NIL
  if A0_104 == L3_107 then
    L3_107 = _UPVALUE4_
    L3_107 = L3_107.INVALID_ARGUMENT
    return L3_107
  end
  L3_107 = tonumber
  L3_107 = L3_107(A0_104)
  if L3_107 == _UPVALUE4_.NIL then
    L3_107 = _UPVALUE4_
    L3_107 = L3_107.INVALID_ARGUMENT
    return L3_107
  end
  L3_107 = db
  L3_107 = L3_107.existsRow
  L3_107 = L3_107(_UPVALUE0_, _UPVALUE1_, A0_104)
  if L3_107 == _UPVALUE4_.FALSE then
    L3_107 = _UPVALUE4_
    L3_107 = L3_107.NOT_EXIST
    return L3_107
  end
  L3_107 = _UPVALUE4_
  L3_107 = L3_107.NIL
  if A1_105 == L3_107 then
    L3_107 = _UPVALUE4_
    L3_107 = L3_107.INVALID_ARGUMENT
    return L3_107
  end
  L3_107 = _UPVALUE5_
  L3_107 = L3_107.ipAddressCheck
  L3_107 = L3_107(_UPVALUE6_, A1_105)
  valid = L3_107
  L3_107 = valid
  if L3_107 ~= _UPVALUE4_.SUCCESS then
    L3_107 = _UPVALUE4_
    L3_107 = L3_107.INVALID_ARGUMENT
    return L3_107
  end
  L3_107 = nil
  L3_107 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, A0_104, _UPVALUE2_.secondaryDNS, A1_105)
  if L3_107 == _UPVALUE4_.FALSE then
    return _UPVALUE4_.FAILURE, A0_104
  end
  return _UPVALUE4_.SUCCESS, A0_104
end
function reconnectModeGet()
  local L0_108, L1_109
  L0_108 = db
  L0_108 = L0_108.getNextRowId
  L1_109 = _UPVALUE0_
  L0_108 = L0_108(L1_109, _UPVALUE1_)
  L1_109 = _UPVALUE2_
  L1_109 = L1_109.NIL
  if L0_108 == L1_109 then
    L1_109 = _UPVALUE2_
    L1_109 = L1_109.NOT_EXIST
    return L1_109
  end
  L1_109 = db
  L1_109 = L1_109.getAttribute
  L1_109 = L1_109(_UPVALUE1_, _UPVALUE3_, L0_108, _UPVALUE4_.reconnectMode)
  if L1_109 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_108, L1_109
end
function reconnectModeGetNext(A0_110)
  local L1_111, L2_112
  L1_111 = _UPVALUE0_
  L1_111 = L1_111.NIL
  if A0_110 == L1_111 then
    L1_111 = _UPVALUE0_
    L1_111 = L1_111.INVALID_ARGUMENT
    return L1_111
  end
  L1_111 = tonumber
  L2_112 = A0_110
  L1_111 = L1_111(L2_112)
  L2_112 = _UPVALUE0_
  L2_112 = L2_112.NIL
  if L1_111 == L2_112 then
    L1_111 = _UPVALUE0_
    L1_111 = L1_111.INVALID_ARGUMENT
    return L1_111
  end
  L1_111 = db
  L1_111 = L1_111.existsRow
  L2_112 = _UPVALUE1_
  L1_111 = L1_111(L2_112, _UPVALUE2_, A0_110)
  L2_112 = _UPVALUE0_
  L2_112 = L2_112.FALSE
  if L1_111 == L2_112 then
    L1_111 = _UPVALUE0_
    L1_111 = L1_111.NOT_EXIST
    return L1_111
  end
  L1_111 = nil
  L2_112 = db
  L2_112 = L2_112.getNextRowId
  L2_112 = L2_112(A0_110, _UPVALUE1_)
  L1_111 = L2_112
  L2_112 = _UPVALUE0_
  L2_112 = L2_112.NIL
  if L1_111 == L2_112 then
    L2_112 = _UPVALUE0_
    L2_112 = L2_112.NOT_EXIST
    return L2_112
  end
  L2_112 = db
  L2_112 = L2_112.getAttribute
  L2_112 = L2_112(_UPVALUE1_, _UPVALUE2_, L1_111, _UPVALUE3_.reconnectMode)
  if L2_112 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_111
  end
  return _UPVALUE0_.SUCCESS, L1_111, L2_112
end
function reconnectModeSet(A0_113, A1_114)
  local L2_115, L3_116
  L2_115 = _UPVALUE0_
  L2_115 = L2_115.NIL
  if A0_113 == L2_115 then
    L2_115 = _UPVALUE0_
    L2_115 = L2_115.INVALID_ARGUMENT
    return L2_115
  end
  L2_115 = tonumber
  L3_116 = A0_113
  L2_115 = L2_115(L3_116)
  L3_116 = _UPVALUE0_
  L3_116 = L3_116.NIL
  if L2_115 == L3_116 then
    L2_115 = _UPVALUE0_
    L2_115 = L2_115.INVALID_ARGUMENT
    return L2_115
  end
  L2_115 = db
  L2_115 = L2_115.existsRow
  L3_116 = _UPVALUE1_
  L2_115 = L2_115(L3_116, _UPVALUE2_, A0_113)
  L3_116 = _UPVALUE0_
  L3_116 = L3_116.FALSE
  if L2_115 == L3_116 then
    L2_115 = _UPVALUE0_
    L2_115 = L2_115.NOT_EXIST
    return L2_115
  end
  L2_115 = _UPVALUE0_
  L2_115 = L2_115.NIL
  if A1_114 == L2_115 then
    L2_115 = _UPVALUE0_
    L2_115 = L2_115.INVALID_ARGUMENT
    return L2_115
  end
  L2_115 = tonumber
  L3_116 = A1_114
  L2_115 = L2_115(L3_116)
  L3_116 = _UPVALUE0_
  L3_116 = L3_116.NIL
  if L2_115 == L3_116 then
    L3_116 = _UPVALUE0_
    L3_116 = L3_116.INVALID_ARGUMENT
    return L3_116
  end
  L3_116 = _UPVALUE3_
  if L2_115 ~= L3_116 then
    L3_116 = _UPVALUE4_
    if L2_115 ~= L3_116 then
      L3_116 = _UPVALUE0_
      L3_116 = L3_116.INVALID_ARGUMENT
      return L3_116
    end
  end
  L3_116 = nil
  L3_116 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_113, _UPVALUE5_.reconnectMode, A1_114)
  if L3_116 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_113
  end
  return _UPVALUE0_.SUCCESS, A0_113
end
function maxIdleTimeGet()
  local L0_117, L1_118
  L0_117 = db
  L0_117 = L0_117.getNextRowId
  L1_118 = _UPVALUE0_
  L0_117 = L0_117(L1_118, _UPVALUE1_)
  L1_118 = _UPVALUE2_
  L1_118 = L1_118.NIL
  if L0_117 == L1_118 then
    L1_118 = _UPVALUE2_
    L1_118 = L1_118.NOT_EXIST
    return L1_118
  end
  L1_118 = db
  L1_118 = L1_118.getAttribute
  L1_118 = L1_118(_UPVALUE1_, _UPVALUE3_, L0_117, _UPVALUE4_.maxIdleTime)
  if L1_118 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_117, L1_118
end
function maxIdleTimeGetNext(A0_119)
  local L1_120, L2_121
  L1_120 = _UPVALUE0_
  L1_120 = L1_120.NIL
  if A0_119 == L1_120 then
    L1_120 = _UPVALUE0_
    L1_120 = L1_120.INVALID_ARGUMENT
    return L1_120
  end
  L1_120 = tonumber
  L2_121 = A0_119
  L1_120 = L1_120(L2_121)
  L2_121 = _UPVALUE0_
  L2_121 = L2_121.NIL
  if L1_120 == L2_121 then
    L1_120 = _UPVALUE0_
    L1_120 = L1_120.INVALID_ARGUMENT
    return L1_120
  end
  L1_120 = db
  L1_120 = L1_120.existsRow
  L2_121 = _UPVALUE1_
  L1_120 = L1_120(L2_121, _UPVALUE2_, A0_119)
  L2_121 = _UPVALUE0_
  L2_121 = L2_121.FALSE
  if L1_120 == L2_121 then
    L1_120 = _UPVALUE0_
    L1_120 = L1_120.NOT_EXIST
    return L1_120
  end
  L1_120 = nil
  L2_121 = db
  L2_121 = L2_121.getNextRowId
  L2_121 = L2_121(A0_119, _UPVALUE1_)
  L1_120 = L2_121
  L2_121 = _UPVALUE0_
  L2_121 = L2_121.NIL
  if L1_120 == L2_121 then
    L2_121 = _UPVALUE0_
    L2_121 = L2_121.NOT_EXIST
    return L2_121
  end
  L2_121 = db
  L2_121 = L2_121.getAttribute
  L2_121 = L2_121(_UPVALUE1_, _UPVALUE2_, L1_120, _UPVALUE3_.maxIdleTime)
  if L2_121 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_120
  end
  return _UPVALUE0_.SUCCESS, L1_120, L2_121
end
function maxIdleTimeSet(A0_122, A1_123)
  local L2_124, L3_125, L4_126
  L2_124 = db
  L2_124 = L2_124.getAttribute
  L3_125 = _UPVALUE0_
  L4_126 = _UPVALUE1_
  L2_124 = L2_124(L3_125, L4_126, A0_122, _UPVALUE2_.reconnectMode)
  L3_125 = tonumber
  L4_126 = L2_124
  L3_125 = L3_125(L4_126)
  L2_124 = L3_125
  L3_125 = _UPVALUE3_
  if L2_124 ~= L3_125 then
    L3_125 = _UPVALUE4_
    L3_125 = L3_125.DEPENDENCY_NOT_MET
    return L3_125
  end
  L3_125 = _UPVALUE4_
  L3_125 = L3_125.NIL
  if A0_122 == L3_125 then
    L3_125 = _UPVALUE4_
    L3_125 = L3_125.INVALID_ARGUMENT
    return L3_125
  end
  L3_125 = tonumber
  L4_126 = A0_122
  L3_125 = L3_125(L4_126)
  L4_126 = _UPVALUE4_
  L4_126 = L4_126.NIL
  if L3_125 == L4_126 then
    L3_125 = _UPVALUE4_
    L3_125 = L3_125.INVALID_ARGUMENT
    return L3_125
  end
  L3_125 = db
  L3_125 = L3_125.existsRow
  L4_126 = _UPVALUE0_
  L3_125 = L3_125(L4_126, _UPVALUE1_, A0_122)
  L4_126 = _UPVALUE4_
  L4_126 = L4_126.FALSE
  if L3_125 == L4_126 then
    L3_125 = _UPVALUE4_
    L3_125 = L3_125.NOT_EXIST
    return L3_125
  end
  L3_125 = _UPVALUE4_
  L3_125 = L3_125.NIL
  if A1_123 == L3_125 then
    L3_125 = _UPVALUE4_
    L3_125 = L3_125.INVALID_ARGUMENT
    return L3_125
  end
  L3_125 = tonumber
  L4_126 = A1_123
  L3_125 = L3_125(L4_126)
  L4_126 = _UPVALUE5_
  if not (L3_125 < L4_126) then
    L4_126 = _UPVALUE6_
  elseif L3_125 > L4_126 then
    L4_126 = _UPVALUE4_
    L4_126 = L4_126.INVALID_ARGUMENT
    return L4_126
  end
  L4_126 = nil
  L4_126 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, A0_122, _UPVALUE2_.maxIdleTime, A1_123)
  if L4_126 == _UPVALUE4_.FALSE then
    return _UPVALUE4_.FAILURE, A0_122
  end
  return _UPVALUE4_.SUCCESS, A0_122
end
function issplitTunnelEnabled()
  local L0_127, L1_128
  L0_127 = db
  L0_127 = L0_127.getNextRowId
  L1_128 = _UPVALUE0_
  L0_127 = L0_127(L1_128, _UPVALUE1_)
  L1_128 = _UPVALUE2_
  L1_128 = L1_128.NIL
  if L0_127 == L1_128 then
    L1_128 = _UPVALUE2_
    L1_128 = L1_128.NOT_EXIST
    return L1_128
  end
  L1_128 = db
  L1_128 = L1_128.getAttribute
  L1_128 = L1_128(_UPVALUE1_, _UPVALUE3_, L0_127, _UPVALUE4_.splitTunnel)
  if L1_128 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_127, L1_128
end
function issplitTunnelEnabledNext(A0_129)
  local L1_130, L2_131
  L1_130 = _UPVALUE0_
  L1_130 = L1_130.NIL
  if A0_129 == L1_130 then
    L1_130 = _UPVALUE0_
    L1_130 = L1_130.INVALID_ARGUMENT
    return L1_130
  end
  L1_130 = tonumber
  L2_131 = A0_129
  L1_130 = L1_130(L2_131)
  L2_131 = _UPVALUE0_
  L2_131 = L2_131.NIL
  if L1_130 == L2_131 then
    L1_130 = _UPVALUE0_
    L1_130 = L1_130.INVALID_ARGUMENT
    return L1_130
  end
  L1_130 = db
  L1_130 = L1_130.existsRow
  L2_131 = _UPVALUE1_
  L1_130 = L1_130(L2_131, _UPVALUE2_, A0_129)
  L2_131 = _UPVALUE0_
  L2_131 = L2_131.FALSE
  if L1_130 == L2_131 then
    L1_130 = _UPVALUE0_
    L1_130 = L1_130.NOT_EXIST
    return L1_130
  end
  L1_130 = nil
  L2_131 = db
  L2_131 = L2_131.getNextRowId
  L2_131 = L2_131(A0_129, _UPVALUE1_)
  L1_130 = L2_131
  L2_131 = _UPVALUE0_
  L2_131 = L2_131.NIL
  if L1_130 == L2_131 then
    L2_131 = _UPVALUE0_
    L2_131 = L2_131.NOT_EXIST
    return L2_131
  end
  L2_131 = db
  L2_131 = L2_131.getAttribute
  L2_131 = L2_131(_UPVALUE1_, _UPVALUE2_, L1_130, _UPVALUE3_.splitTunnel)
  if L2_131 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_130
  end
  return _UPVALUE0_.SUCCESS, L1_130, L2_131
end
function splitTunnelEnable(A0_132)
  local L1_133
  L1_133 = _UPVALUE0_
  L1_133 = L1_133.NIL
  if A0_132 == L1_133 then
    L1_133 = _UPVALUE0_
    L1_133 = L1_133.INVALID_ARGUMENT
    return L1_133
  end
  L1_133 = tonumber
  L1_133 = L1_133(A0_132)
  if L1_133 == _UPVALUE0_.NIL then
    L1_133 = _UPVALUE0_
    L1_133 = L1_133.INVALID_ARGUMENT
    return L1_133
  end
  L1_133 = db
  L1_133 = L1_133.existsRow
  L1_133 = L1_133(_UPVALUE1_, _UPVALUE2_, A0_132)
  if L1_133 == _UPVALUE0_.FALSE then
    L1_133 = _UPVALUE0_
    L1_133 = L1_133.NOT_EXIST
    return L1_133
  end
  L1_133 = nil
  L1_133 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_132, _UPVALUE3_.splitTunnel, _UPVALUE4_)
  if L1_133 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_132
  end
  return _UPVALUE0_.SUCCESS, A0_132
end
function splitTunnelDisable(A0_134)
  local L1_135
  L1_135 = _UPVALUE0_
  L1_135 = L1_135.NIL
  if A0_134 == L1_135 then
    L1_135 = _UPVALUE0_
    L1_135 = L1_135.INVALID_ARGUMENT
    return L1_135
  end
  L1_135 = tonumber
  L1_135 = L1_135(A0_134)
  if L1_135 == _UPVALUE0_.NIL then
    L1_135 = _UPVALUE0_
    L1_135 = L1_135.INVALID_ARGUMENT
    return L1_135
  end
  L1_135 = db
  L1_135 = L1_135.existsRow
  L1_135 = L1_135(_UPVALUE1_, _UPVALUE2_, A0_134)
  if L1_135 == _UPVALUE0_.FALSE then
    L1_135 = _UPVALUE0_
    L1_135 = L1_135.NOT_EXIST
    return L1_135
  end
  L1_135 = nil
  L1_135 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_134, _UPVALUE3_.splitTunnel, _UPVALUE4_)
  if L1_135 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_134
  end
  return _UPVALUE0_.SUCCESS, A0_134
end
function ismppeEncryptionEnabled()
  local L0_136, L1_137
  L0_136 = db
  L0_136 = L0_136.getNextRowId
  L1_137 = _UPVALUE0_
  L0_136 = L0_136(L1_137, _UPVALUE1_)
  L1_137 = _UPVALUE2_
  L1_137 = L1_137.NIL
  if L0_136 == L1_137 then
    L1_137 = _UPVALUE2_
    L1_137 = L1_137.NOT_EXIST
    return L1_137
  end
  L1_137 = db
  L1_137 = L1_137.getAttribute
  L1_137 = L1_137(_UPVALUE1_, _UPVALUE3_, L0_136, _UPVALUE4_.mppeEncryption)
  if L1_137 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_136, L1_137
end
function ismppeEncryptionEnabledNext(A0_138)
  local L1_139, L2_140
  L1_139 = _UPVALUE0_
  L1_139 = L1_139.NIL
  if A0_138 == L1_139 then
    L1_139 = _UPVALUE0_
    L1_139 = L1_139.INVALID_ARGUMENT
    return L1_139
  end
  L1_139 = tonumber
  L2_140 = A0_138
  L1_139 = L1_139(L2_140)
  L2_140 = _UPVALUE0_
  L2_140 = L2_140.NIL
  if L1_139 == L2_140 then
    L1_139 = _UPVALUE0_
    L1_139 = L1_139.INVALID_ARGUMENT
    return L1_139
  end
  L1_139 = db
  L1_139 = L1_139.existsRow
  L2_140 = _UPVALUE1_
  L1_139 = L1_139(L2_140, _UPVALUE2_, A0_138)
  L2_140 = _UPVALUE0_
  L2_140 = L2_140.FALSE
  if L1_139 == L2_140 then
    L1_139 = _UPVALUE0_
    L1_139 = L1_139.NOT_EXIST
    return L1_139
  end
  L1_139 = nil
  L2_140 = db
  L2_140 = L2_140.getNextRowId
  L2_140 = L2_140(A0_138, _UPVALUE1_)
  L1_139 = L2_140
  L2_140 = _UPVALUE0_
  L2_140 = L2_140.NIL
  if L1_139 == L2_140 then
    L2_140 = _UPVALUE0_
    L2_140 = L2_140.NOT_EXIST
    return L2_140
  end
  L2_140 = db
  L2_140 = L2_140.getAttribute
  L2_140 = L2_140(_UPVALUE1_, _UPVALUE2_, L1_139, _UPVALUE3_.mppeEncryption)
  if L2_140 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_139
  end
  return _UPVALUE0_.SUCCESS, L1_139, L2_140
end
function mppeEncryptionEnable(A0_141)
  local L1_142
  L1_142 = _UPVALUE0_
  L1_142 = L1_142.NIL
  if A0_141 == L1_142 then
    L1_142 = _UPVALUE0_
    L1_142 = L1_142.INVALID_ARGUMENT
    return L1_142
  end
  L1_142 = tonumber
  L1_142 = L1_142(A0_141)
  if L1_142 == _UPVALUE0_.NIL then
    L1_142 = _UPVALUE0_
    L1_142 = L1_142.INVALID_ARGUMENT
    return L1_142
  end
  L1_142 = db
  L1_142 = L1_142.existsRow
  L1_142 = L1_142(_UPVALUE1_, _UPVALUE2_, A0_141)
  if L1_142 == _UPVALUE0_.FALSE then
    L1_142 = _UPVALUE0_
    L1_142 = L1_142.NOT_EXIST
    return L1_142
  end
  L1_142 = nil
  L1_142 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_141, _UPVALUE3_.mppeEncryption, _UPVALUE4_)
  if L1_142 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_141
  end
  return _UPVALUE0_.SUCCESS, A0_141
end
function mppeEncryptionDisable(A0_143)
  local L1_144
  L1_144 = _UPVALUE0_
  L1_144 = L1_144.NIL
  if A0_143 == L1_144 then
    L1_144 = _UPVALUE0_
    L1_144 = L1_144.INVALID_ARGUMENT
    return L1_144
  end
  L1_144 = tonumber
  L1_144 = L1_144(A0_143)
  if L1_144 == _UPVALUE0_.NIL then
    L1_144 = _UPVALUE0_
    L1_144 = L1_144.INVALID_ARGUMENT
    return L1_144
  end
  L1_144 = db
  L1_144 = L1_144.existsRow
  L1_144 = L1_144(_UPVALUE1_, _UPVALUE2_, A0_143)
  if L1_144 == _UPVALUE0_.FALSE then
    L1_144 = _UPVALUE0_
    L1_144 = L1_144.NOT_EXIST
    return L1_144
  end
  L1_144 = nil
  L1_144 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_143, _UPVALUE3_.mppeEncryption, _UPVALUE4_)
  if L1_144 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_143
  end
  return _UPVALUE0_.SUCCESS, A0_143
end
function isdualAccessEnabled()
  local L0_145, L1_146
  L0_145 = db
  L0_145 = L0_145.getNextRowId
  L1_146 = _UPVALUE0_
  L0_145 = L0_145(L1_146, _UPVALUE1_)
  L1_146 = _UPVALUE2_
  L1_146 = L1_146.NIL
  if L0_145 == L1_146 then
    L1_146 = _UPVALUE2_
    L1_146 = L1_146.NOT_EXIST
    return L1_146
  end
  L1_146 = db
  L1_146 = L1_146.getAttribute
  L1_146 = L1_146(_UPVALUE1_, _UPVALUE3_, L0_145, _UPVALUE4_.dualAccess)
  if L1_146 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_145, L1_146
end
function isdualAccessEnabledNext(A0_147)
  local L1_148, L2_149
  L1_148 = _UPVALUE0_
  L1_148 = L1_148.NIL
  if A0_147 == L1_148 then
    L1_148 = _UPVALUE0_
    L1_148 = L1_148.INVALID_ARGUMENT
    return L1_148
  end
  L1_148 = tonumber
  L2_149 = A0_147
  L1_148 = L1_148(L2_149)
  L2_149 = _UPVALUE0_
  L2_149 = L2_149.NIL
  if L1_148 == L2_149 then
    L1_148 = _UPVALUE0_
    L1_148 = L1_148.INVALID_ARGUMENT
    return L1_148
  end
  L1_148 = db
  L1_148 = L1_148.existsRow
  L2_149 = _UPVALUE1_
  L1_148 = L1_148(L2_149, _UPVALUE2_, A0_147)
  L2_149 = _UPVALUE0_
  L2_149 = L2_149.FALSE
  if L1_148 == L2_149 then
    L1_148 = _UPVALUE0_
    L1_148 = L1_148.NOT_EXIST
    return L1_148
  end
  L1_148 = nil
  L2_149 = db
  L2_149 = L2_149.getNextRowId
  L2_149 = L2_149(A0_147, _UPVALUE1_)
  L1_148 = L2_149
  L2_149 = _UPVALUE0_
  L2_149 = L2_149.NIL
  if L1_148 == L2_149 then
    L2_149 = _UPVALUE0_
    L2_149 = L2_149.NOT_EXIST
    return L2_149
  end
  L2_149 = db
  L2_149 = L2_149.getAttribute
  L2_149 = L2_149(_UPVALUE1_, _UPVALUE2_, L1_148, _UPVALUE3_.dualAccess)
  if L2_149 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_148
  end
  return _UPVALUE0_.SUCCESS, L1_148, L2_149
end
function dualAccessEnable(A0_150)
  local L1_151
  L1_151 = _UPVALUE0_
  L1_151 = L1_151.NIL
  if A0_150 == L1_151 then
    L1_151 = _UPVALUE0_
    L1_151 = L1_151.INVALID_ARGUMENT
    return L1_151
  end
  L1_151 = tonumber
  L1_151 = L1_151(A0_150)
  if L1_151 == _UPVALUE0_.NIL then
    L1_151 = _UPVALUE0_
    L1_151 = L1_151.INVALID_ARGUMENT
    return L1_151
  end
  L1_151 = db
  L1_151 = L1_151.existsRow
  L1_151 = L1_151(_UPVALUE1_, _UPVALUE2_, A0_150)
  if L1_151 == _UPVALUE0_.FALSE then
    L1_151 = _UPVALUE0_
    L1_151 = L1_151.NOT_EXIST
    return L1_151
  end
  L1_151 = nil
  L1_151 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_150, _UPVALUE3_.dualAccess, _UPVALUE4_)
  if L1_151 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_150
  end
  return _UPVALUE0_.SUCCESS, A0_150
end
function dualAccessDisable(A0_152)
  local L1_153
  L1_153 = _UPVALUE0_
  L1_153 = L1_153.NIL
  if A0_152 == L1_153 then
    L1_153 = _UPVALUE0_
    L1_153 = L1_153.INVALID_ARGUMENT
    return L1_153
  end
  L1_153 = tonumber
  L1_153 = L1_153(A0_152)
  if L1_153 == _UPVALUE0_.NIL then
    L1_153 = _UPVALUE0_
    L1_153 = L1_153.INVALID_ARGUMENT
    return L1_153
  end
  L1_153 = db
  L1_153 = L1_153.existsRow
  L1_153 = L1_153(_UPVALUE1_, _UPVALUE2_, A0_152)
  if L1_153 == _UPVALUE0_.FALSE then
    L1_153 = _UPVALUE0_
    L1_153 = L1_153.NOT_EXIST
    return L1_153
  end
  L1_153 = nil
  L1_153 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_152, _UPVALUE3_.dualAccess, _UPVALUE4_)
  if L1_153 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_152
  end
  return _UPVALUE0_.SUCCESS, A0_152
end
function pptpClientGroupGet()
  local L0_154, L1_155, L2_156, L3_157, L4_158, L5_159, L6_160, L7_161, L8_162, L9_163, L10_164, L11_165, L12_166, L13_167, L14_168, L15_169, L16_170, L17_171, L18_172
  L0_154 = db
  L0_154 = L0_154.getNextRowId
  L1_155 = _UPVALUE0_
  L2_156 = _UPVALUE1_
  L0_154 = L0_154(L1_155, L2_156)
  L1_155 = _UPVALUE2_
  L1_155 = L1_155.NIL
  if L0_154 == L1_155 then
    L1_155 = _UPVALUE2_
    L1_155 = L1_155.NOT_EXIST
    return L1_155
  end
  L1_155 = {}
  L2_156 = db
  L2_156 = L2_156.getRow
  L3_157 = _UPVALUE1_
  L4_158 = _UPVALUE3_
  L5_159 = L0_154
  L2_156 = L2_156(L3_157, L4_158, L5_159)
  L1_155 = L2_156
  L2_156 = _UPVALUE2_
  L2_156 = L2_156.NIL
  if L1_155 == L2_156 then
    L2_156 = _UPVALUE2_
    L2_156 = L2_156.FAILURE
    return L2_156
  end
  L2_156 = _UPVALUE1_
  L3_157 = "."
  L4_158 = _UPVALUE4_
  L4_158 = L4_158.wanPort
  L2_156 = L2_156 .. L3_157 .. L4_158
  L2_156 = L1_155[L2_156]
  L3_157 = _UPVALUE1_
  L4_158 = "."
  L5_159 = _UPVALUE4_
  L5_159 = L5_159.userName
  L3_157 = L3_157 .. L4_158 .. L5_159
  L3_157 = L1_155[L3_157]
  L4_158 = _UPVALUE1_
  L5_159 = "."
  L6_160 = _UPVALUE4_
  L6_160 = L6_160.password
  L4_158 = L4_158 .. L5_159 .. L6_160
  L4_158 = L1_155[L4_158]
  L5_159 = _UPVALUE1_
  L6_160 = "."
  L7_161 = _UPVALUE4_
  L7_161 = L7_161.useDhcp
  L5_159 = L5_159 .. L6_160 .. L7_161
  L5_159 = L1_155[L5_159]
  L6_160 = _UPVALUE1_
  L7_161 = "."
  L8_162 = _UPVALUE4_
  L8_162 = L8_162.useIspDns
  L6_160 = L6_160 .. L7_161 .. L8_162
  L6_160 = L1_155[L6_160]
  L7_161 = _UPVALUE1_
  L8_162 = "."
  L9_163 = _UPVALUE4_
  L9_163 = L9_163.serverIPAddress
  L7_161 = L7_161 .. L8_162 .. L9_163
  L7_161 = L1_155[L7_161]
  L8_162 = _UPVALUE1_
  L9_163 = "."
  L10_164 = _UPVALUE4_
  L10_164 = L10_164.staticIPAddress
  L8_162 = L8_162 .. L9_163 .. L10_164
  L8_162 = L1_155[L8_162]
  L9_163 = _UPVALUE1_
  L10_164 = "."
  L11_165 = _UPVALUE4_
  L11_165 = L11_165.gateway
  L9_163 = L9_163 .. L10_164 .. L11_165
  L9_163 = L1_155[L9_163]
  L10_164 = _UPVALUE1_
  L11_165 = "."
  L12_166 = _UPVALUE4_
  L12_166 = L12_166.netmask
  L10_164 = L10_164 .. L11_165 .. L12_166
  L10_164 = L1_155[L10_164]
  L11_165 = _UPVALUE1_
  L12_166 = "."
  L13_167 = _UPVALUE4_
  L13_167 = L13_167.primaryDNS
  L11_165 = L11_165 .. L12_166 .. L13_167
  L11_165 = L1_155[L11_165]
  L12_166 = _UPVALUE1_
  L13_167 = "."
  L14_168 = _UPVALUE4_
  L14_168 = L14_168.secondaryDNS
  L12_166 = L12_166 .. L13_167 .. L14_168
  L12_166 = L1_155[L12_166]
  L13_167 = _UPVALUE1_
  L14_168 = "."
  L15_169 = _UPVALUE4_
  L15_169 = L15_169.reconnectMode
  L13_167 = L13_167 .. L14_168 .. L15_169
  L13_167 = L1_155[L13_167]
  L14_168 = _UPVALUE1_
  L15_169 = "."
  L16_170 = _UPVALUE4_
  L16_170 = L16_170.maxIdleTime
  L14_168 = L14_168 .. L15_169 .. L16_170
  L14_168 = L1_155[L14_168]
  L15_169 = _UPVALUE1_
  L16_170 = "."
  L17_171 = _UPVALUE4_
  L17_171 = L17_171.splitTunnel
  L15_169 = L15_169 .. L16_170 .. L17_171
  L15_169 = L1_155[L15_169]
  L16_170 = _UPVALUE1_
  L17_171 = "."
  L18_172 = _UPVALUE4_
  L18_172 = L18_172.mppeEncryption
  L16_170 = L16_170 .. L17_171 .. L18_172
  L16_170 = L1_155[L16_170]
  L17_171 = _UPVALUE1_
  L18_172 = "."
  L17_171 = L17_171 .. L18_172 .. _UPVALUE4_.dualAccess
  L17_171 = L1_155[L17_171]
  L18_172 = _UPVALUE1_
  L18_172 = L18_172 .. "." .. _UPVALUE4_.staticDNSIP
  L18_172 = L1_155[L18_172]
  return _UPVALUE2_.SUCCESS, L0_154, L2_156, L3_157, L4_158, L5_159, L6_160, L7_161, L8_162, L9_163, L10_164, L11_165, L12_166, L13_167, L14_168, L15_169, L16_170, L17_171, L18_172
end
function pptpClientGroupGetNext(A0_173)
  local L1_174, L2_175, L3_176, L4_177, L5_178, L6_179, L7_180, L8_181, L9_182, L10_183, L11_184, L12_185, L13_186, L14_187, L15_188, L16_189, L17_190, L18_191, L19_192
  L1_174 = _UPVALUE0_
  L1_174 = L1_174.NIL
  if A0_173 == L1_174 then
    L1_174 = _UPVALUE0_
    L1_174 = L1_174.INVALID_ARGUMENT
    return L1_174
  end
  L1_174 = tonumber
  L2_175 = A0_173
  L1_174 = L1_174(L2_175)
  L2_175 = _UPVALUE0_
  L2_175 = L2_175.NIL
  if L1_174 == L2_175 then
    L1_174 = _UPVALUE0_
    L1_174 = L1_174.INVALID_ARGUMENT
    return L1_174
  end
  L1_174 = db
  L1_174 = L1_174.existsRow
  L2_175 = _UPVALUE1_
  L3_176 = _UPVALUE2_
  L4_177 = A0_173
  L1_174 = L1_174(L2_175, L3_176, L4_177)
  L2_175 = _UPVALUE0_
  L2_175 = L2_175.FALSE
  if L1_174 == L2_175 then
    L1_174 = _UPVALUE0_
    L1_174 = L1_174.NOT_EXIST
    return L1_174
  end
  L1_174 = nil
  L2_175 = db
  L2_175 = L2_175.getNextRowId
  L3_176 = A0_173
  L4_177 = _UPVALUE1_
  L2_175 = L2_175(L3_176, L4_177)
  L1_174 = L2_175
  L2_175 = _UPVALUE0_
  L2_175 = L2_175.NIL
  if L1_174 == L2_175 then
    L2_175 = _UPVALUE0_
    L2_175 = L2_175.NOT_EXIST
    return L2_175
  end
  L2_175 = {}
  L3_176 = db
  L3_176 = L3_176.getRow
  L4_177 = _UPVALUE1_
  L5_178 = _UPVALUE2_
  L6_179 = L1_174
  L3_176 = L3_176(L4_177, L5_178, L6_179)
  L2_175 = L3_176
  L3_176 = _UPVALUE0_
  L3_176 = L3_176.NIL
  if L2_175 == L3_176 then
    L3_176 = _UPVALUE0_
    L3_176 = L3_176.FAILURE
    L4_177 = A0_173
    return L3_176, L4_177
  end
  L3_176 = _UPVALUE1_
  L4_177 = "."
  L5_178 = _UPVALUE3_
  L5_178 = L5_178.wanPort
  L3_176 = L3_176 .. L4_177 .. L5_178
  L3_176 = L2_175[L3_176]
  L4_177 = _UPVALUE1_
  L5_178 = "."
  L6_179 = _UPVALUE3_
  L6_179 = L6_179.userName
  L4_177 = L4_177 .. L5_178 .. L6_179
  L4_177 = L2_175[L4_177]
  L5_178 = _UPVALUE1_
  L6_179 = "."
  L7_180 = _UPVALUE3_
  L7_180 = L7_180.password
  L5_178 = L5_178 .. L6_179 .. L7_180
  L5_178 = L2_175[L5_178]
  L6_179 = _UPVALUE1_
  L7_180 = "."
  L8_181 = _UPVALUE3_
  L8_181 = L8_181.useDhcp
  L6_179 = L6_179 .. L7_180 .. L8_181
  L6_179 = L2_175[L6_179]
  L7_180 = _UPVALUE1_
  L8_181 = "."
  L9_182 = _UPVALUE3_
  L9_182 = L9_182.useIspDns
  L7_180 = L7_180 .. L8_181 .. L9_182
  L7_180 = L2_175[L7_180]
  L8_181 = _UPVALUE1_
  L9_182 = "."
  L10_183 = _UPVALUE3_
  L10_183 = L10_183.serverIPAddress
  L8_181 = L8_181 .. L9_182 .. L10_183
  L8_181 = L2_175[L8_181]
  L9_182 = _UPVALUE1_
  L10_183 = "."
  L11_184 = _UPVALUE3_
  L11_184 = L11_184.staticIPAddress
  L9_182 = L9_182 .. L10_183 .. L11_184
  L9_182 = L2_175[L9_182]
  L10_183 = _UPVALUE1_
  L11_184 = "."
  L12_185 = _UPVALUE3_
  L12_185 = L12_185.gateway
  L10_183 = L10_183 .. L11_184 .. L12_185
  L10_183 = L2_175[L10_183]
  L11_184 = _UPVALUE1_
  L12_185 = "."
  L13_186 = _UPVALUE3_
  L13_186 = L13_186.netmask
  L11_184 = L11_184 .. L12_185 .. L13_186
  L11_184 = L2_175[L11_184]
  L12_185 = _UPVALUE1_
  L13_186 = "."
  L14_187 = _UPVALUE3_
  L14_187 = L14_187.primaryDNS
  L12_185 = L12_185 .. L13_186 .. L14_187
  L12_185 = L2_175[L12_185]
  L13_186 = _UPVALUE1_
  L14_187 = "."
  L15_188 = _UPVALUE3_
  L15_188 = L15_188.secondaryDNS
  L13_186 = L13_186 .. L14_187 .. L15_188
  L13_186 = L2_175[L13_186]
  L14_187 = _UPVALUE1_
  L15_188 = "."
  L16_189 = _UPVALUE3_
  L16_189 = L16_189.reconnectMode
  L14_187 = L14_187 .. L15_188 .. L16_189
  L14_187 = L2_175[L14_187]
  L15_188 = _UPVALUE1_
  L16_189 = "."
  L17_190 = _UPVALUE3_
  L17_190 = L17_190.maxIdleTime
  L15_188 = L15_188 .. L16_189 .. L17_190
  L15_188 = L2_175[L15_188]
  L16_189 = _UPVALUE1_
  L17_190 = "."
  L18_191 = _UPVALUE3_
  L18_191 = L18_191.splitTunnel
  L16_189 = L16_189 .. L17_190 .. L18_191
  L16_189 = L2_175[L16_189]
  L17_190 = _UPVALUE1_
  L18_191 = "."
  L19_192 = _UPVALUE3_
  L19_192 = L19_192.mppeEncryption
  L17_190 = L17_190 .. L18_191 .. L19_192
  L17_190 = L2_175[L17_190]
  L18_191 = _UPVALUE1_
  L19_192 = "."
  L18_191 = L18_191 .. L19_192 .. _UPVALUE3_.dualAccess
  L18_191 = L2_175[L18_191]
  L19_192 = _UPVALUE1_
  L19_192 = L19_192 .. "." .. _UPVALUE3_.staticDNSIP
  L19_192 = L2_175[L19_192]
  return _UPVALUE0_.SUCCESS, L1_174, L3_176, L4_177, L5_178, L6_179, L7_180, L8_181, L9_182, L10_183, L11_184, L12_185, L13_186, L14_187, L15_188, L16_189, L17_190, L18_191, L19_192
end
function pptpClientGroupSet(A0_193, A1_194, A2_195, A3_196, A4_197, A5_198, A6_199, A7_200, A8_201, A9_202, A10_203, A11_204, A12_205, A13_206, A14_207, A15_208, A16_209)
  local L17_210, L18_211, L19_212, L20_213, L21_214
  L17_210 = {}
  L18_211 = _UPVALUE0_
  L18_211 = L18_211.NIL
  if A0_193 == L18_211 then
    L18_211 = _UPVALUE0_
    L18_211 = L18_211.INVALID_ARGUMENT
    return L18_211
  end
  L18_211 = _UPVALUE1_
  if A0_193 ~= L18_211 then
    L18_211 = _UPVALUE2_
    if A0_193 ~= L18_211 then
      L18_211 = _UPVALUE0_
      L18_211 = L18_211.INVALID_ARGUMENT
      return L18_211
    end
  end
  L18_211 = _UPVALUE0_
  L18_211 = L18_211.NIL
  if A1_194 == L18_211 then
    L18_211 = _UPVALUE0_
    L18_211 = L18_211.INVALID_ARGUMENT
    return L18_211
  end
  L18_211 = _UPVALUE3_
  L18_211 = L18_211.stringLengthCheck
  L19_212 = _UPVALUE4_
  L20_213 = _UPVALUE5_
  L21_214 = A1_194
  L18_211 = L18_211(L19_212, L20_213, L21_214)
  L19_212 = _UPVALUE0_
  L19_212 = L19_212.FAILURE
  if L18_211 == L19_212 then
    L18_211 = _UPVALUE6_
    L18_211 = L18_211.INVALID_USERNAME_LENGTH
    return L18_211
  end
  L18_211 = _UPVALUE7_
  L19_212 = "."
  L20_213 = _UPVALUE8_
  L20_213 = L20_213.userName
  L18_211 = L18_211 .. L19_212 .. L20_213
  L17_210[L18_211] = A1_194
  L18_211 = _UPVALUE0_
  L18_211 = L18_211.NIL
  if A2_195 == L18_211 then
    L18_211 = _UPVALUE0_
    L18_211 = L18_211.INVALID_ARGUMENT
    return L18_211
  end
  L18_211 = _UPVALUE3_
  L18_211 = L18_211.stringLengthCheck
  L19_212 = _UPVALUE9_
  L20_213 = _UPVALUE10_
  L21_214 = A2_195
  L18_211 = L18_211(L19_212, L20_213, L21_214)
  L19_212 = _UPVALUE0_
  L19_212 = L19_212.FAILURE
  if L18_211 == L19_212 then
    L18_211 = _UPVALUE6_
    L18_211 = L18_211.INVALID_PASSWORD_LENGTH
    return L18_211
  end
  L18_211 = util
  L18_211 = L18_211.mask
  L19_212 = A2_195
  L18_211 = L18_211(L19_212)
  if L18_211 ~= A2_195 then
    L19_212 = _UPVALUE7_
    L20_213 = "."
    L21_214 = _UPVALUE8_
    L21_214 = L21_214.password
    L19_212 = L19_212 .. L20_213 .. L21_214
    L17_210[L19_212] = A2_195
  end
  L19_212 = _UPVALUE0_
  L19_212 = L19_212.NIL
  if A3_196 == L19_212 then
    L19_212 = _UPVALUE0_
    L19_212 = L19_212.INVALID_ARGUMENT
    return L19_212
  end
  L19_212 = _UPVALUE3_
  L19_212 = L19_212.isBoolean
  L20_213 = A3_196
  L19_212 = L19_212(L20_213)
  valid = L19_212
  L19_212 = valid
  L20_213 = _UPVALUE0_
  L20_213 = L20_213.SUCCESS
  if L19_212 ~= L20_213 then
    L19_212 = _UPVALUE0_
    L19_212 = L19_212.INVALID_ARGUMENT
    return L19_212
  end
  L19_212 = _UPVALUE7_
  L20_213 = "."
  L21_214 = _UPVALUE8_
  L21_214 = L21_214.useDhcp
  L19_212 = L19_212 .. L20_213 .. L21_214
  L17_210[L19_212] = A3_196
  L19_212 = _UPVALUE0_
  L19_212 = L19_212.NIL
  if A4_197 == L19_212 then
    L19_212 = _UPVALUE0_
    L19_212 = L19_212.INVALID_ARGUMENT
    return L19_212
  end
  L19_212 = _UPVALUE3_
  L19_212 = L19_212.isBoolean
  L20_213 = A4_197
  L19_212 = L19_212(L20_213)
  valid = L19_212
  L19_212 = valid
  L20_213 = _UPVALUE0_
  L20_213 = L20_213.SUCCESS
  if L19_212 ~= L20_213 then
    L19_212 = _UPVALUE0_
    L19_212 = L19_212.INVALID_ARGUMENT
    return L19_212
  end
  L19_212 = _UPVALUE7_
  L20_213 = "."
  L21_214 = _UPVALUE8_
  L21_214 = L21_214.useIspDns
  L19_212 = L19_212 .. L20_213 .. L21_214
  L17_210[L19_212] = A4_197
  L19_212 = _UPVALUE0_
  L19_212 = L19_212.NIL
  if A5_198 == L19_212 then
    L19_212 = _UPVALUE0_
    L19_212 = L19_212.INVALID_ARGUMENT
    return L19_212
  end
  L19_212 = _UPVALUE7_
  L20_213 = "."
  L21_214 = _UPVALUE8_
  L21_214 = L21_214.serverIPAddress
  L19_212 = L19_212 .. L20_213 .. L21_214
  L17_210[L19_212] = A5_198
  L19_212 = tonumber
  L20_213 = A3_196
  L19_212 = L19_212(L20_213)
  L20_213 = _UPVALUE11_
  if L19_212 == L20_213 then
    L19_212 = _UPVALUE0_
    L19_212 = L19_212.NIL
    if A6_199 == L19_212 then
      L19_212 = _UPVALUE0_
      L19_212 = L19_212.INVALID_ARGUMENT
      return L19_212
    end
    L19_212 = _UPVALUE3_
    L19_212 = L19_212.ipAddressCheck
    L20_213 = _UPVALUE12_
    L21_214 = A6_199
    L19_212 = L19_212(L20_213, L21_214)
    valid = L19_212
    L19_212 = valid
    L20_213 = _UPVALUE0_
    L20_213 = L20_213.SUCCESS
    if L19_212 ~= L20_213 then
      L19_212 = _UPVALUE6_
      L19_212 = L19_212.WAN_PPTP_INVALID_STATIC_IP
      return L19_212
    end
    L19_212 = _UPVALUE7_
    L20_213 = "."
    L21_214 = _UPVALUE8_
    L21_214 = L21_214.staticIPAddress
    L19_212 = L19_212 .. L20_213 .. L21_214
    L17_210[L19_212] = A6_199
    L19_212 = _UPVALUE0_
    L19_212 = L19_212.NIL
    if A16_209 ~= L19_212 and A16_209 ~= "" then
      L19_212 = _UPVALUE3_
      L19_212 = L19_212.ipAddressCheck
      L20_213 = _UPVALUE12_
      L21_214 = A16_209
      L19_212 = L19_212(L20_213, L21_214)
      valid = L19_212
      L19_212 = valid
      L20_213 = _UPVALUE0_
      L20_213 = L20_213.SUCCESS
      if L19_212 ~= L20_213 then
        L19_212 = _UPVALUE6_
        L19_212 = L19_212.WAN_INVALID_STATIC_DNS_IP
        return L19_212
      end
    end
    L19_212 = _UPVALUE7_
    L20_213 = "."
    L21_214 = _UPVALUE8_
    L21_214 = L21_214.staticDNSIP
    L19_212 = L19_212 .. L20_213 .. L21_214
    L17_210[L19_212] = A16_209
    L19_212 = _UPVALUE0_
    L19_212 = L19_212.NIL
    if A7_200 == L19_212 then
      L19_212 = _UPVALUE0_
      L19_212 = L19_212.INVALID_ARGUMENT
      return L19_212
    end
    L19_212 = _UPVALUE3_
    L19_212 = L19_212.ipAddressCheck
    L20_213 = _UPVALUE12_
    L21_214 = A7_200
    L19_212 = L19_212(L20_213, L21_214)
    valid = L19_212
    L19_212 = valid
    L20_213 = _UPVALUE0_
    L20_213 = L20_213.SUCCESS
    if L19_212 ~= L20_213 then
      L19_212 = _UPVALUE6_
      L19_212 = L19_212.WAN_PPTP_INVALID_GATEWAY
      return L19_212
    end
    L19_212 = _UPVALUE7_
    L20_213 = "."
    L21_214 = _UPVALUE8_
    L21_214 = L21_214.gateway
    L19_212 = L19_212 .. L20_213 .. L21_214
    L17_210[L19_212] = A7_200
  end
  L19_212 = tonumber
  L20_213 = A3_196
  L19_212 = L19_212(L20_213)
  L20_213 = _UPVALUE11_
  if L19_212 == L20_213 then
    L19_212 = _UPVALUE0_
    L19_212 = L19_212.NIL
    if A8_201 == L19_212 then
      L19_212 = _UPVALUE0_
      L19_212 = L19_212.INVALID_ARGUMENT
      return L19_212
    end
    L19_212 = _UPVALUE3_
    L19_212 = L19_212.ipAddressCheck
    L20_213 = _UPVALUE12_
    L21_214 = A8_201
    L19_212 = L19_212(L20_213, L21_214)
    valid = L19_212
    L19_212 = valid
    L20_213 = _UPVALUE0_
    L20_213 = L20_213.SUCCESS
    if L19_212 ~= L20_213 then
      L19_212 = _UPVALUE6_
      L19_212 = L19_212.WAN_PPTP_INVALID_NETMASK
      return L19_212
    end
    L19_212 = _UPVALUE7_
    L20_213 = "."
    L21_214 = _UPVALUE8_
    L21_214 = L21_214.netmask
    L19_212 = L19_212 .. L20_213 .. L21_214
    L17_210[L19_212] = A8_201
    L19_212 = _UPVALUE3_
    L19_212 = L19_212.ipv4DualMaskCheck
    L20_213 = A6_199
    L21_214 = A8_201
    L19_212 = L19_212(L20_213, L21_214, A7_200, A8_201)
    valid = L19_212
    L19_212 = valid
    L20_213 = _UPVALUE0_
    L20_213 = L20_213.SUCCESS
    if L19_212 ~= L20_213 then
      L19_212 = _UPVALUE6_
      L19_212 = L19_212.GATEWAY_NOT_IN_SAME_SUBNET
      return L19_212
    end
    L19_212 = staticIpSubnetCheck
    L20_213 = A0_193
    L21_214 = A6_199
    L19_212 = L19_212(L20_213, L21_214, A8_201)
    valid = L19_212
    L19_212 = valid
    L20_213 = _UPVALUE0_
    L20_213 = L20_213.SUCCESS
    if L19_212 ~= L20_213 then
      L19_212 = valid
      return L19_212
    end
  end
  L19_212 = tonumber
  L20_213 = A4_197
  L19_212 = L19_212(L20_213)
  L20_213 = _UPVALUE11_
  if L19_212 == L20_213 then
    L19_212 = _UPVALUE0_
    L19_212 = L19_212.NIL
    if A9_202 == L19_212 then
      L19_212 = _UPVALUE0_
      L19_212 = L19_212.INVALID_ARGUMENT
      return L19_212
    end
    L19_212 = _UPVALUE3_
    L19_212 = L19_212.ipAddressCheck
    L20_213 = _UPVALUE12_
    L21_214 = A9_202
    L19_212 = L19_212(L20_213, L21_214)
    valid = L19_212
    L19_212 = valid
    L20_213 = _UPVALUE0_
    L20_213 = L20_213.SUCCESS
    if L19_212 ~= L20_213 then
      L19_212 = _UPVALUE6_
      L19_212 = L19_212.WAN_PPTP_INVALID_PRIMARY_DNS
      return L19_212
    end
    L19_212 = _UPVALUE7_
    L20_213 = "."
    L21_214 = _UPVALUE8_
    L21_214 = L21_214.primaryDNS
    L19_212 = L19_212 .. L20_213 .. L21_214
    L17_210[L19_212] = A9_202
    L19_212 = _UPVALUE0_
    L19_212 = L19_212.NIL
    if A10_203 == L19_212 then
      L19_212 = _UPVALUE0_
      L19_212 = L19_212.INVALID_ARGUMENT
      return L19_212
    end
    L19_212 = _UPVALUE3_
    L19_212 = L19_212.ipAddressCheck
    L20_213 = _UPVALUE12_
    L21_214 = A10_203
    L19_212 = L19_212(L20_213, L21_214)
    valid = L19_212
    L19_212 = valid
    L20_213 = _UPVALUE0_
    L20_213 = L20_213.SUCCESS
    if L19_212 ~= L20_213 then
      L19_212 = _UPVALUE6_
      L19_212 = L19_212.WAN_PPTP_INVALID_SECONDARY_DNS
      return L19_212
    end
    L19_212 = _UPVALUE7_
    L20_213 = "."
    L21_214 = _UPVALUE8_
    L21_214 = L21_214.secondaryDNS
    L19_212 = L19_212 .. L20_213 .. L21_214
    L17_210[L19_212] = A10_203
  end
  L19_212 = _UPVALUE0_
  L19_212 = L19_212.NIL
  if A11_204 == L19_212 then
    L19_212 = _UPVALUE0_
    L19_212 = L19_212.INVALID_ARGUMENT
    return L19_212
  end
  L19_212 = tonumber
  L20_213 = A11_204
  L19_212 = L19_212(L20_213)
  L20_213 = _UPVALUE0_
  L20_213 = L20_213.NIL
  if L19_212 == L20_213 then
    L20_213 = _UPVALUE0_
    L20_213 = L20_213.INVALID_ARGUMENT
    return L20_213
  end
  L20_213 = _UPVALUE13_
  if L19_212 ~= L20_213 then
    L20_213 = _UPVALUE14_
    if L19_212 ~= L20_213 then
      L20_213 = _UPVALUE0_
      L20_213 = L20_213.INVALID_ARGUMENT
      return L20_213
    end
  end
  L20_213 = _UPVALUE7_
  L21_214 = "."
  L20_213 = L20_213 .. L21_214 .. _UPVALUE8_.reconnectMode
  L17_210[L20_213] = A11_204
  L20_213 = tonumber
  L21_214 = A11_204
  L20_213 = L20_213(L21_214)
  L21_214 = _UPVALUE14_
  if L20_213 == L21_214 then
    L20_213 = idleTimeOutCheck
    L20_213 = L20_213()
    L21_214 = _UPVALUE0_
    L21_214 = L21_214.SUCCESS
    if L20_213 ~= L21_214 then
      return L20_213
    end
    L21_214 = _UPVALUE0_
    L21_214 = L21_214.NIL
    if A12_205 == L21_214 then
      L21_214 = _UPVALUE0_
      L21_214 = L21_214.INVALID_ARGUMENT
      return L21_214
    end
    L21_214 = tonumber
    L21_214 = L21_214(A12_205)
    if L21_214 < _UPVALUE15_ or L21_214 > _UPVALUE16_ then
      return _UPVALUE6_.WAN_PPTP_INVALID_TIMEOUT
    end
    L17_210[_UPVALUE7_ .. "." .. _UPVALUE8_.maxIdleTime] = A12_205
  end
  L20_213 = _UPVALUE0_
  L20_213 = L20_213.NIL
  if A13_206 == L20_213 then
    L20_213 = _UPVALUE0_
    L20_213 = L20_213.INVALID_ARGUMENT
    return L20_213
  end
  L20_213 = _UPVALUE3_
  L20_213 = L20_213.isBoolean
  L21_214 = A13_206
  L20_213 = L20_213(L21_214)
  valid = L20_213
  L20_213 = valid
  L21_214 = _UPVALUE0_
  L21_214 = L21_214.SUCCESS
  if L20_213 ~= L21_214 then
    L20_213 = _UPVALUE0_
    L20_213 = L20_213.INVALID_ARGUMENT
    return L20_213
  end
  L20_213 = _UPVALUE7_
  L21_214 = "."
  L20_213 = L20_213 .. L21_214 .. _UPVALUE8_.splitTunnel
  L17_210[L20_213] = A13_206
  L20_213 = _UPVALUE0_
  L20_213 = L20_213.NIL
  if A14_207 == L20_213 then
    L20_213 = _UPVALUE0_
    L20_213 = L20_213.INVALID_ARGUMENT
    return L20_213
  end
  L20_213 = _UPVALUE3_
  L20_213 = L20_213.isBoolean
  L21_214 = A14_207
  L20_213 = L20_213(L21_214)
  valid = L20_213
  L20_213 = valid
  L21_214 = _UPVALUE0_
  L21_214 = L21_214.SUCCESS
  if L20_213 ~= L21_214 then
    L20_213 = _UPVALUE0_
    L20_213 = L20_213.INVALID_ARGUMENT
    return L20_213
  end
  L20_213 = _UPVALUE7_
  L21_214 = "."
  L20_213 = L20_213 .. L21_214 .. _UPVALUE8_.mppeEncryption
  L17_210[L20_213] = A14_207
  L20_213 = _UPVALUE0_
  L20_213 = L20_213.NIL
  if A15_208 == L20_213 then
    L20_213 = _UPVALUE0_
    L20_213 = L20_213.INVALID_ARGUMENT
    return L20_213
  end
  L20_213 = _UPVALUE3_
  L20_213 = L20_213.isBoolean
  L21_214 = A15_208
  L20_213 = L20_213(L21_214)
  valid = L20_213
  L20_213 = valid
  L21_214 = _UPVALUE0_
  L21_214 = L21_214.SUCCESS
  if L20_213 ~= L21_214 then
    L20_213 = _UPVALUE0_
    L20_213 = L20_213.INVALID_ARGUMENT
    return L20_213
  end
  L20_213 = _UPVALUE7_
  L21_214 = "."
  L20_213 = L20_213 .. L21_214 .. _UPVALUE8_.dualAccess
  L17_210[L20_213] = A15_208
  L20_213 = db
  L20_213 = L20_213.getAttribute
  L21_214 = _UPVALUE7_
  L20_213 = L20_213(L21_214, _UPVALUE8_.wanPort, A0_193, _UPVALUE17_)
  L21_214 = nil
  L21_214 = db.update(_UPVALUE7_, L17_210, L20_213)
  if L21_214 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L20_213
  end
  return _UPVALUE0_.SUCCESS, L20_213
end
function pptpClientGroupCreate(A0_215, A1_216, A2_217, A3_218, A4_219, A5_220, A6_221, A7_222, A8_223, A9_224, A10_225, A11_226, A12_227, A13_228, A14_229, A15_230)
  local L17_231, L18_232
  L17_231 = _UPVALUE0_
  L17_231 = L17_231.NOT_SUPPORTED
  L18_232 = 0
  return L17_231, L18_232, 0
end
function pptpClientGroupDelete(A0_233)
  local L2_234, L3_235
  L2_234 = _UPVALUE0_
  L2_234 = L2_234.NOT_SUPPORTED
  L3_235 = 0
  return L2_234, L3_235, 0
end
function staticIpSubnetCheck(A0_236, A1_237, A2_238)
  local L3_239, L4_240, L5_241, L6_242, L7_243, L8_244, L9_245, L10_246, L11_247, L12_248, L13_249, L14_250, L15_251, L16_252, L17_253, L18_254, L19_255
  L13_249 = _UPVALUE0_
  L14_250 = _UPVALUE1_
  L14_250 = L14_250.vlanGet
  L15_251 = L13_249
  L8_244, L10_246, L11_247, L12_248, L14_250 = nil, nil, nil, nil, L14_250(L15_251)
  L8_244, L10_246, L11_247, L12_248, L15_251 = nil, nil, nil, nil, L14_250(L15_251)
  L8_244, L10_246, L11_247, L12_248, L16_252 = nil, nil, nil, nil, L14_250(L15_251)
  L8_244, L10_246, L11_247, L12_248, L17_253 = nil, nil, nil, nil, L14_250(L15_251)
  L8_244, L10_246, L11_247, L12_248, L18_254 = nil, nil, nil, nil, L14_250(L15_251)
  L8_244, L10_246, L11_247, L12_248, L19_255 = nil, nil, nil, nil, L14_250(L15_251)
  L4_240 = L19_255
  L7_243 = L18_254
  L6_242 = L17_253
  L5_241 = L16_252
  L9_245 = L15_251
  L3_239 = L14_250
  L14_250 = _UPVALUE2_
  L14_250 = L14_250.SUCCESS
  if L3_239 ~= L14_250 then
    L14_250 = _UPVALUE3_
    L14_250 = L14_250.SUBNET_CHECK_FAILED
    return L14_250
  end
  L14_250 = _UPVALUE4_
  L14_250 = L14_250.ipv4DualMaskCheck
  L15_251 = L4_240
  L16_252 = L8_244
  L17_253 = A1_237
  L18_254 = A2_238
  L14_250 = L14_250(L15_251, L16_252, L17_253, L18_254)
  L3_239 = L14_250
  L14_250 = _UPVALUE2_
  L14_250 = L14_250.SUCCESS
  if L3_239 == L14_250 then
    L14_250 = _UPVALUE3_
    L14_250 = L14_250.SAME_SUBNET_LAN
    return L14_250
  end
  L14_250 = _UPVALUE1_
  L14_250 = L14_250.vlanGetNext
  L15_251 = L9_245
  L8_244, L10_246, L11_247, L12_248, L19_255 = L14_250(L15_251)
  L4_240 = L19_255
  L7_243 = L18_254
  L6_242 = L17_253
  L5_241 = L16_252
  L9_245 = L15_251
  L3_239 = L14_250
  while true do
    L14_250 = _UPVALUE2_
    L14_250 = L14_250.NEXT_ROWID_INVALID
    if L3_239 ~= L14_250 then
      L14_250 = _UPVALUE2_
      L14_250 = L14_250.SUCCESS
      if L3_239 ~= L14_250 then
        L14_250 = _UPVALUE3_
        L14_250 = L14_250.SUBNET_CHECK_FAILED
        return L14_250
      end
      L14_250 = _UPVALUE4_
      L14_250 = L14_250.ipv4DualMaskCheck
      L15_251 = L4_240
      L16_252 = L8_244
      L17_253 = A1_237
      L18_254 = A2_238
      L14_250 = L14_250(L15_251, L16_252, L17_253, L18_254)
      L3_239 = L14_250
      L14_250 = _UPVALUE2_
      L14_250 = L14_250.SUCCESS
      if L3_239 == L14_250 then
        L14_250 = _UPVALUE3_
        L14_250 = L14_250.SAME_SUBNET_VLAN
        return L14_250
      end
      L14_250 = _UPVALUE1_
      L14_250 = L14_250.vlanGetNext
      L15_251 = L9_245
      L8_244, L10_246, L11_247, L12_248, L19_255 = L14_250(L15_251)
      L4_240 = L19_255
      L7_243 = L18_254
      L6_242 = L17_253
      L5_241 = L16_252
      L9_245 = L15_251
      L3_239 = L14_250
    end
  end
  L14_250 = db
  L14_250 = L14_250.getAttribute
  L15_251 = _UPVALUE5_
  L16_252 = _UPVALUE6_
  L16_252 = L16_252.dmz_interface
  L17_253 = _UPVALUE7_
  L18_254 = _UPVALUE6_
  L18_254 = L18_254.dmz_ip
  L14_250 = L14_250(L15_251, L16_252, L17_253, L18_254)
  L15_251 = db
  L15_251 = L15_251.getAttribute
  L16_252 = _UPVALUE5_
  L17_253 = _UPVALUE6_
  L17_253 = L17_253.dmz_interface
  L18_254 = _UPVALUE7_
  L19_255 = _UPVALUE6_
  L19_255 = L19_255.dmz_netmask
  L15_251 = L15_251(L16_252, L17_253, L18_254, L19_255)
  L16_252 = _UPVALUE2_
  L16_252 = L16_252.NIL
  if L14_250 ~= L16_252 then
    L16_252 = _UPVALUE8_
    if L14_250 ~= L16_252 then
      L16_252 = _UPVALUE2_
      L16_252 = L16_252.NIL
      if L15_251 ~= L16_252 then
        L16_252 = _UPVALUE8_
        if L15_251 ~= L16_252 then
          L16_252 = _UPVALUE4_
          L16_252 = L16_252.ipv4DualMaskCheck
          L17_253 = L14_250
          L18_254 = L15_251
          L19_255 = A1_237
          L16_252 = L16_252(L17_253, L18_254, L19_255, A2_238)
          L3_239 = L16_252
          L16_252 = _UPVALUE2_
          L16_252 = L16_252.SUCCESS
          if L3_239 == L16_252 then
            L16_252 = _UPVALUE3_
            L16_252 = L16_252.SAME_SUBNET_DMZ
            return L16_252
          end
        end
      end
    end
  end
  L16_252 = UNIT_NAME
  if L16_252 ~= "DSR-1000N" then
    L16_252 = UNIT_NAME
    if L16_252 ~= "DSR-1000" then
      L16_252 = UNIT_NAME
      if L16_252 ~= "DSR-500N" then
        L16_252 = UNIT_NAME
        if L16_252 ~= "DSR-500" then
          L16_252 = PRODUCT_ID
          if L16_252 ~= "DSR-1000AC_Ax" then
            L16_252 = PRODUCT_ID
            if L16_252 ~= "DSR-500AC_Ax" then
              L16_252 = PRODUCT_ID
              if L16_252 ~= "DSR-1000_Bx" then
                L16_252 = PRODUCT_ID
              end
            end
          end
        end
      end
    end
  elseif L16_252 == "DSR-500_Bx" then
    L16_252 = _UPVALUE4_
    L16_252 = L16_252.checkOpenVpnSubnetRange
    L17_253 = A1_237
    L18_254 = A2_238
    L16_252 = L16_252(L17_253, L18_254)
    L3_239 = L16_252
    L16_252 = _UPVALUE2_
    L16_252 = L16_252.SUCCESS
    if L3_239 == L16_252 then
      L16_252 = _UPVALUE2_
      L16_252 = L16_252.OPENVPN_ALREADY_CONFIGURED
      return L16_252
    end
  end
  L16_252 = _UPVALUE4_
  L16_252 = L16_252.ipv4DualMaskCheck
  L17_253 = _UPVALUE9_
  L18_254 = _UPVALUE10_
  L19_255 = A1_237
  L16_252 = L16_252(L17_253, L18_254, L19_255, A2_238)
  L3_239 = L16_252
  L16_252 = _UPVALUE2_
  L16_252 = L16_252.SUCCESS
  if L3_239 == L16_252 then
    L16_252 = _UPVALUE3_
    L16_252 = L16_252.SAME_SUBNET_LOCAL_IP
    return L16_252
  end
  L16_252 = db
  L16_252 = L16_252.getAttribute
  L17_253 = _UPVALUE11_
  L18_254 = _UPVALUE12_
  L19_255 = "1"
  L16_252 = L16_252(L17_253, L18_254, L19_255, _UPVALUE6_.ipsec_startIPAddress)
  L17_253 = db
  L17_253 = L17_253.getAttribute
  L18_254 = _UPVALUE11_
  L19_255 = _UPVALUE12_
  L17_253 = L17_253(L18_254, L19_255, "1", _UPVALUE6_.ipsec_subnetMask)
  L18_254 = _UPVALUE2_
  L18_254 = L18_254.NIL
  if L16_252 ~= L18_254 then
    L18_254 = _UPVALUE8_
    if L16_252 ~= L18_254 then
      L18_254 = _UPVALUE2_
      L18_254 = L18_254.NIL
      if L17_253 ~= L18_254 then
        L18_254 = _UPVALUE8_
        if L17_253 ~= L18_254 then
          L18_254 = _UPVALUE4_
          L18_254 = L18_254.ipv4DualMaskCheck
          L19_255 = L16_252
          L18_254 = L18_254(L19_255, L17_253, A1_237, A2_238)
          L3_239 = L18_254
          L18_254 = _UPVALUE2_
          L18_254 = L18_254.SUCCESS
          if L3_239 == L18_254 then
            L18_254 = _UPVALUE3_
            L18_254 = L18_254.SAME_SUBNET_IPSEC
            return L18_254
          end
        end
      end
    end
  end
  L18_254 = _UPVALUE13_
  if A0_236 == L18_254 then
    L18_254 = db
    L18_254 = L18_254.getAttributeWhere
    L19_255 = _UPVALUE14_
    L18_254 = L18_254(L19_255, _UPVALUE6_.interfaceName .. " = '" .. _UPVALUE15_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE16_, _UPVALUE6_.wan_ipAddress)
    L19_255 = db
    L19_255 = L19_255.getAttributeWhere
    L19_255 = L19_255(_UPVALUE14_, _UPVALUE6_.interfaceName .. " = '" .. _UPVALUE15_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE16_, _UPVALUE6_.wan_subnet)
    if L18_254 ~= _UPVALUE2_.NIL and L18_254 ~= _UPVALUE8_ and L19_255 ~= _UPVALUE2_.NIL and L19_255 ~= _UPVALUE8_ then
      L3_239 = _UPVALUE4_.ipv4DualMaskCheck(L18_254, L19_255, A1_237, A2_238)
      if L3_239 == _UPVALUE2_.SUCCESS then
        return _UPVALUE3_.SAME_SUBNET_WAN2
      end
    end
  end
  L18_254 = _UPVALUE15_
  if A0_236 == L18_254 then
    L18_254 = db
    L18_254 = L18_254.getAttributeWhere
    L19_255 = _UPVALUE14_
    L18_254 = L18_254(L19_255, _UPVALUE6_.interfaceName .. " = '" .. _UPVALUE13_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE16_, _UPVALUE6_.wan_ipAddress)
    L19_255 = db
    L19_255 = L19_255.getAttributeWhere
    L19_255 = L19_255(_UPVALUE14_, _UPVALUE6_.interfaceName .. " = '" .. _UPVALUE13_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE16_, _UPVALUE6_.wan_subnet)
    if L18_254 ~= _UPVALUE2_.NIL and L18_254 ~= _UPVALUE8_ and L19_255 ~= _UPVALUE2_.NIL and L19_255 ~= _UPVALUE8_ then
      L3_239 = _UPVALUE4_.ipv4DualMaskCheck(L18_254, L19_255, A1_237, A2_238)
      if L3_239 == _UPVALUE2_.SUCCESS then
        return _UPVALUE3_.SAME_SUBNET_WAN1
      end
    end
  end
  L18_254 = _UPVALUE2_
  L18_254 = L18_254.SUCCESS
  return L18_254
end
function idleTimeOutCheck()
  if db.getAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.multiWanMode) == _UPVALUE4_.NIL then
    return _UPVALUE5_.IDLE_TIMEOUT_CHECK_FAILED
  end
  if db.getAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.multiWanMode) == _UPVALUE6_ or db.getAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.multiWanMode) == _UPVALUE7_ then
    return _UPVALUE5_.WAN_IN_LOAD_BALANCE
  end
  return _UPVALUE4_.SUCCESS
end
