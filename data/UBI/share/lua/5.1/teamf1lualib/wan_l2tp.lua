local L0_0
L0_0 = module
L0_0("com.teamf1.core.wan.l2tp", package.seeall)
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
;({}).dualAccess = "DualAccess"
;({}).secret = "Secret"
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
function isdualAccessEnabled()
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
  L1_137 = L1_137(_UPVALUE1_, _UPVALUE3_, L0_136, _UPVALUE4_.dualAccess)
  if L1_137 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_136, L1_137
end
function isdualAccessEnabledNext(A0_138)
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
  L2_140 = L2_140(_UPVALUE1_, _UPVALUE2_, L1_139, _UPVALUE3_.dualAccess)
  if L2_140 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_139
  end
  return _UPVALUE0_.SUCCESS, L1_139, L2_140
end
function dualAccessEnable(A0_141)
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
  L1_142 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_141, _UPVALUE3_.dualAccess, _UPVALUE4_)
  if L1_142 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_141
  end
  return _UPVALUE0_.SUCCESS, A0_141
end
function dualAccessDisable(A0_143)
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
  L1_144 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_143, _UPVALUE3_.dualAccess, _UPVALUE4_)
  if L1_144 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_143
  end
  return _UPVALUE0_.SUCCESS, A0_143
end
function l2tpClientGroupGet()
  local L0_145, L1_146, L2_147, L3_148, L4_149, L5_150, L6_151, L7_152, L8_153, L9_154, L10_155, L11_156, L12_157, L13_158, L14_159, L15_160, L16_161, L17_162, L18_163
  L0_145 = db
  L0_145 = L0_145.getNextRowId
  L1_146 = _UPVALUE0_
  L2_147 = _UPVALUE1_
  L0_145 = L0_145(L1_146, L2_147)
  L1_146 = _UPVALUE2_
  L1_146 = L1_146.NIL
  if L0_145 == L1_146 then
    L1_146 = _UPVALUE2_
    L1_146 = L1_146.NOT_EXIST
    return L1_146
  end
  L1_146 = {}
  L2_147 = db
  L2_147 = L2_147.getRow
  L3_148 = _UPVALUE1_
  L4_149 = _UPVALUE3_
  L5_150 = L0_145
  L2_147 = L2_147(L3_148, L4_149, L5_150)
  L1_146 = L2_147
  L2_147 = _UPVALUE2_
  L2_147 = L2_147.NIL
  if L1_146 == L2_147 then
    L2_147 = _UPVALUE2_
    L2_147 = L2_147.FAILURE
    return L2_147
  end
  L2_147 = _UPVALUE1_
  L3_148 = "."
  L4_149 = _UPVALUE4_
  L4_149 = L4_149.wanPort
  L2_147 = L2_147 .. L3_148 .. L4_149
  L2_147 = L1_146[L2_147]
  L3_148 = _UPVALUE1_
  L4_149 = "."
  L5_150 = _UPVALUE4_
  L5_150 = L5_150.userName
  L3_148 = L3_148 .. L4_149 .. L5_150
  L3_148 = L1_146[L3_148]
  L4_149 = _UPVALUE1_
  L5_150 = "."
  L6_151 = _UPVALUE4_
  L6_151 = L6_151.password
  L4_149 = L4_149 .. L5_150 .. L6_151
  L4_149 = L1_146[L4_149]
  L5_150 = _UPVALUE1_
  L6_151 = "."
  L7_152 = _UPVALUE4_
  L7_152 = L7_152.useDhcp
  L5_150 = L5_150 .. L6_151 .. L7_152
  L5_150 = L1_146[L5_150]
  L6_151 = _UPVALUE1_
  L7_152 = "."
  L8_153 = _UPVALUE4_
  L8_153 = L8_153.useIspDns
  L6_151 = L6_151 .. L7_152 .. L8_153
  L6_151 = L1_146[L6_151]
  L7_152 = _UPVALUE1_
  L8_153 = "."
  L9_154 = _UPVALUE4_
  L9_154 = L9_154.serverIPAddress
  L7_152 = L7_152 .. L8_153 .. L9_154
  L7_152 = L1_146[L7_152]
  L8_153 = _UPVALUE1_
  L9_154 = "."
  L10_155 = _UPVALUE4_
  L10_155 = L10_155.staticIPAddress
  L8_153 = L8_153 .. L9_154 .. L10_155
  L8_153 = L1_146[L8_153]
  L9_154 = _UPVALUE1_
  L10_155 = "."
  L11_156 = _UPVALUE4_
  L11_156 = L11_156.gateway
  L9_154 = L9_154 .. L10_155 .. L11_156
  L9_154 = L1_146[L9_154]
  L10_155 = _UPVALUE1_
  L11_156 = "."
  L12_157 = _UPVALUE4_
  L12_157 = L12_157.netmask
  L10_155 = L10_155 .. L11_156 .. L12_157
  L10_155 = L1_146[L10_155]
  L11_156 = _UPVALUE1_
  L12_157 = "."
  L13_158 = _UPVALUE4_
  L13_158 = L13_158.primaryDNS
  L11_156 = L11_156 .. L12_157 .. L13_158
  L11_156 = L1_146[L11_156]
  L12_157 = _UPVALUE1_
  L13_158 = "."
  L14_159 = _UPVALUE4_
  L14_159 = L14_159.secondaryDNS
  L12_157 = L12_157 .. L13_158 .. L14_159
  L12_157 = L1_146[L12_157]
  L13_158 = _UPVALUE1_
  L14_159 = "."
  L15_160 = _UPVALUE4_
  L15_160 = L15_160.reconnectMode
  L13_158 = L13_158 .. L14_159 .. L15_160
  L13_158 = L1_146[L13_158]
  L14_159 = _UPVALUE1_
  L15_160 = "."
  L16_161 = _UPVALUE4_
  L16_161 = L16_161.maxIdleTime
  L14_159 = L14_159 .. L15_160 .. L16_161
  L14_159 = L1_146[L14_159]
  L15_160 = _UPVALUE1_
  L16_161 = "."
  L17_162 = _UPVALUE4_
  L17_162 = L17_162.splitTunnel
  L15_160 = L15_160 .. L16_161 .. L17_162
  L15_160 = L1_146[L15_160]
  L16_161 = _UPVALUE1_
  L17_162 = "."
  L18_163 = _UPVALUE4_
  L18_163 = L18_163.dualAccess
  L16_161 = L16_161 .. L17_162 .. L18_163
  L16_161 = L1_146[L16_161]
  L17_162 = _UPVALUE1_
  L18_163 = "."
  L17_162 = L17_162 .. L18_163 .. _UPVALUE4_.secret
  L17_162 = L1_146[L17_162]
  L18_163 = _UPVALUE1_
  L18_163 = L18_163 .. "." .. _UPVALUE4_.staticDNSIP
  L18_163 = L1_146[L18_163]
  return _UPVALUE2_.SUCCESS, L0_145, L2_147, L3_148, L4_149, L5_150, L6_151, L7_152, L8_153, L9_154, L10_155, L11_156, L12_157, L13_158, L14_159, L15_160, L16_161, L17_162, L18_163
end
function l2tpClientGroupGetNext(A0_164)
  local L1_165, L2_166, L3_167, L4_168, L5_169, L6_170, L7_171, L8_172, L9_173, L10_174, L11_175, L12_176, L13_177, L14_178, L15_179, L16_180, L17_181, L18_182, L19_183
  L1_165 = _UPVALUE0_
  L1_165 = L1_165.NIL
  if A0_164 == L1_165 then
    L1_165 = _UPVALUE0_
    L1_165 = L1_165.INVALID_ARGUMENT
    return L1_165
  end
  L1_165 = tonumber
  L2_166 = A0_164
  L1_165 = L1_165(L2_166)
  L2_166 = _UPVALUE0_
  L2_166 = L2_166.NIL
  if L1_165 == L2_166 then
    L1_165 = _UPVALUE0_
    L1_165 = L1_165.INVALID_ARGUMENT
    return L1_165
  end
  L1_165 = db
  L1_165 = L1_165.existsRow
  L2_166 = _UPVALUE1_
  L3_167 = _UPVALUE2_
  L4_168 = A0_164
  L1_165 = L1_165(L2_166, L3_167, L4_168)
  L2_166 = _UPVALUE0_
  L2_166 = L2_166.FALSE
  if L1_165 == L2_166 then
    L1_165 = _UPVALUE0_
    L1_165 = L1_165.NOT_EXIST
    return L1_165
  end
  L1_165 = nil
  L2_166 = db
  L2_166 = L2_166.getNextRowId
  L3_167 = A0_164
  L4_168 = _UPVALUE1_
  L2_166 = L2_166(L3_167, L4_168)
  L1_165 = L2_166
  L2_166 = _UPVALUE0_
  L2_166 = L2_166.NIL
  if L1_165 == L2_166 then
    L2_166 = _UPVALUE0_
    L2_166 = L2_166.NOT_EXIST
    return L2_166
  end
  L2_166 = {}
  L3_167 = db
  L3_167 = L3_167.getRow
  L4_168 = _UPVALUE1_
  L5_169 = _UPVALUE2_
  L6_170 = L1_165
  L3_167 = L3_167(L4_168, L5_169, L6_170)
  L2_166 = L3_167
  L3_167 = _UPVALUE0_
  L3_167 = L3_167.NIL
  if L2_166 == L3_167 then
    L3_167 = _UPVALUE0_
    L3_167 = L3_167.FAILURE
    L4_168 = A0_164
    return L3_167, L4_168
  end
  L3_167 = _UPVALUE1_
  L4_168 = "."
  L5_169 = _UPVALUE3_
  L5_169 = L5_169.wanPort
  L3_167 = L3_167 .. L4_168 .. L5_169
  L3_167 = L2_166[L3_167]
  L4_168 = _UPVALUE1_
  L5_169 = "."
  L6_170 = _UPVALUE3_
  L6_170 = L6_170.userName
  L4_168 = L4_168 .. L5_169 .. L6_170
  L4_168 = L2_166[L4_168]
  L5_169 = _UPVALUE1_
  L6_170 = "."
  L7_171 = _UPVALUE3_
  L7_171 = L7_171.password
  L5_169 = L5_169 .. L6_170 .. L7_171
  L5_169 = L2_166[L5_169]
  L6_170 = _UPVALUE1_
  L7_171 = "."
  L8_172 = _UPVALUE3_
  L8_172 = L8_172.useDhcp
  L6_170 = L6_170 .. L7_171 .. L8_172
  L6_170 = L2_166[L6_170]
  L7_171 = _UPVALUE1_
  L8_172 = "."
  L9_173 = _UPVALUE3_
  L9_173 = L9_173.useIspDns
  L7_171 = L7_171 .. L8_172 .. L9_173
  L7_171 = L2_166[L7_171]
  L8_172 = _UPVALUE1_
  L9_173 = "."
  L10_174 = _UPVALUE3_
  L10_174 = L10_174.serverIPAddress
  L8_172 = L8_172 .. L9_173 .. L10_174
  L8_172 = L2_166[L8_172]
  L9_173 = _UPVALUE1_
  L10_174 = "."
  L11_175 = _UPVALUE3_
  L11_175 = L11_175.staticIPAddress
  L9_173 = L9_173 .. L10_174 .. L11_175
  L9_173 = L2_166[L9_173]
  L10_174 = _UPVALUE1_
  L11_175 = "."
  L12_176 = _UPVALUE3_
  L12_176 = L12_176.gateway
  L10_174 = L10_174 .. L11_175 .. L12_176
  L10_174 = L2_166[L10_174]
  L11_175 = _UPVALUE1_
  L12_176 = "."
  L13_177 = _UPVALUE3_
  L13_177 = L13_177.netmask
  L11_175 = L11_175 .. L12_176 .. L13_177
  L11_175 = L2_166[L11_175]
  L12_176 = _UPVALUE1_
  L13_177 = "."
  L14_178 = _UPVALUE3_
  L14_178 = L14_178.primaryDNS
  L12_176 = L12_176 .. L13_177 .. L14_178
  L12_176 = L2_166[L12_176]
  L13_177 = _UPVALUE1_
  L14_178 = "."
  L15_179 = _UPVALUE3_
  L15_179 = L15_179.secondaryDNS
  L13_177 = L13_177 .. L14_178 .. L15_179
  L13_177 = L2_166[L13_177]
  L14_178 = _UPVALUE1_
  L15_179 = "."
  L16_180 = _UPVALUE3_
  L16_180 = L16_180.reconnectMode
  L14_178 = L14_178 .. L15_179 .. L16_180
  L14_178 = L2_166[L14_178]
  L15_179 = _UPVALUE1_
  L16_180 = "."
  L17_181 = _UPVALUE3_
  L17_181 = L17_181.maxIdleTime
  L15_179 = L15_179 .. L16_180 .. L17_181
  L15_179 = L2_166[L15_179]
  L16_180 = _UPVALUE1_
  L17_181 = "."
  L18_182 = _UPVALUE3_
  L18_182 = L18_182.splitTunnel
  L16_180 = L16_180 .. L17_181 .. L18_182
  L16_180 = L2_166[L16_180]
  L17_181 = _UPVALUE1_
  L18_182 = "."
  L19_183 = _UPVALUE3_
  L19_183 = L19_183.dualAccess
  L17_181 = L17_181 .. L18_182 .. L19_183
  L17_181 = L2_166[L17_181]
  L18_182 = _UPVALUE1_
  L19_183 = "."
  L18_182 = L18_182 .. L19_183 .. _UPVALUE3_.secret
  L18_182 = L2_166[L18_182]
  L19_183 = _UPVALUE1_
  L19_183 = L19_183 .. "." .. _UPVALUE3_.staticDNSIP
  L19_183 = L2_166[L19_183]
  return _UPVALUE0_.SUCCESS, L1_165, L3_167, L4_168, L5_169, L6_170, L7_171, L8_172, L9_173, L10_174, L11_175, L12_176, L13_177, L14_178, L15_179, L16_180, L17_181, L18_182, L19_183
end
function l2tpClientGroupSet(A0_184, A1_185, A2_186, A3_187, A4_188, A5_189, A6_190, A7_191, A8_192, A9_193, A10_194, A11_195, A12_196, A13_197, A14_198, A15_199, A16_200)
  local L17_201, L18_202, L19_203, L20_204, L21_205
  L17_201 = {}
  L18_202 = _UPVALUE0_
  L18_202 = L18_202.NIL
  if A0_184 == L18_202 then
    L18_202 = _UPVALUE0_
    L18_202 = L18_202.INVALID_ARGUMENT
    return L18_202
  end
  L18_202 = _UPVALUE1_
  if A0_184 ~= L18_202 then
    L18_202 = _UPVALUE2_
    if A0_184 ~= L18_202 then
      L18_202 = _UPVALUE0_
      L18_202 = L18_202.INVALID_ARGUMENT
      return L18_202
    end
  end
  L18_202 = _UPVALUE0_
  L18_202 = L18_202.NIL
  if A1_185 == L18_202 then
    L18_202 = _UPVALUE0_
    L18_202 = L18_202.INVALID_ARGUMENT
    return L18_202
  end
  L18_202 = _UPVALUE3_
  L18_202 = L18_202.stringLengthCheck
  L19_203 = _UPVALUE4_
  L20_204 = _UPVALUE5_
  L21_205 = A1_185
  L18_202 = L18_202(L19_203, L20_204, L21_205)
  L19_203 = _UPVALUE0_
  L19_203 = L19_203.FAILURE
  if L18_202 == L19_203 then
    L18_202 = _UPVALUE6_
    L18_202 = L18_202.INVALID_USERNAME_LENGTH
    return L18_202
  end
  L18_202 = _UPVALUE7_
  L19_203 = "."
  L20_204 = _UPVALUE8_
  L20_204 = L20_204.userName
  L18_202 = L18_202 .. L19_203 .. L20_204
  L17_201[L18_202] = A1_185
  L18_202 = _UPVALUE0_
  L18_202 = L18_202.NIL
  if A2_186 == L18_202 then
    L18_202 = _UPVALUE0_
    L18_202 = L18_202.INVALID_ARGUMENT
    return L18_202
  end
  L18_202 = _UPVALUE3_
  L18_202 = L18_202.stringLengthCheck
  L19_203 = _UPVALUE9_
  L20_204 = _UPVALUE10_
  L21_205 = A2_186
  L18_202 = L18_202(L19_203, L20_204, L21_205)
  L19_203 = _UPVALUE0_
  L19_203 = L19_203.FAILURE
  if L18_202 == L19_203 then
    L18_202 = _UPVALUE6_
    L18_202 = L18_202.INVALID_PASSWORD_LENGTH
    return L18_202
  end
  L18_202 = util
  L18_202 = L18_202.mask
  L19_203 = A2_186
  L18_202 = L18_202(L19_203)
  if L18_202 ~= A2_186 then
    L19_203 = _UPVALUE7_
    L20_204 = "."
    L21_205 = _UPVALUE8_
    L21_205 = L21_205.password
    L19_203 = L19_203 .. L20_204 .. L21_205
    L17_201[L19_203] = A2_186
  end
  L19_203 = _UPVALUE0_
  L19_203 = L19_203.NIL
  if A3_187 == L19_203 then
    L19_203 = _UPVALUE0_
    L19_203 = L19_203.INVALID_ARGUMENT
    return L19_203
  end
  L19_203 = _UPVALUE3_
  L19_203 = L19_203.isBoolean
  L20_204 = A3_187
  L19_203 = L19_203(L20_204)
  valid = L19_203
  L19_203 = valid
  L20_204 = _UPVALUE0_
  L20_204 = L20_204.SUCCESS
  if L19_203 ~= L20_204 then
    L19_203 = _UPVALUE0_
    L19_203 = L19_203.INVALID_ARGUMENT
    return L19_203
  end
  L19_203 = _UPVALUE7_
  L20_204 = "."
  L21_205 = _UPVALUE8_
  L21_205 = L21_205.useDhcp
  L19_203 = L19_203 .. L20_204 .. L21_205
  L17_201[L19_203] = A3_187
  L19_203 = _UPVALUE0_
  L19_203 = L19_203.NIL
  if A4_188 == L19_203 then
    L19_203 = _UPVALUE0_
    L19_203 = L19_203.INVALID_ARGUMENT
    return L19_203
  end
  L19_203 = _UPVALUE3_
  L19_203 = L19_203.isBoolean
  L20_204 = A4_188
  L19_203 = L19_203(L20_204)
  valid = L19_203
  L19_203 = valid
  L20_204 = _UPVALUE0_
  L20_204 = L20_204.SUCCESS
  if L19_203 ~= L20_204 then
    L19_203 = _UPVALUE0_
    L19_203 = L19_203.INVALID_ARGUMENT
    return L19_203
  end
  L19_203 = _UPVALUE7_
  L20_204 = "."
  L21_205 = _UPVALUE8_
  L21_205 = L21_205.useIspDns
  L19_203 = L19_203 .. L20_204 .. L21_205
  L17_201[L19_203] = A4_188
  L19_203 = _UPVALUE0_
  L19_203 = L19_203.NIL
  if A5_189 == L19_203 then
    L19_203 = _UPVALUE0_
    L19_203 = L19_203.INVALID_ARGUMENT
    return L19_203
  end
  L19_203 = _UPVALUE7_
  L20_204 = "."
  L21_205 = _UPVALUE8_
  L21_205 = L21_205.serverIPAddress
  L19_203 = L19_203 .. L20_204 .. L21_205
  L17_201[L19_203] = A5_189
  L19_203 = tonumber
  L20_204 = A3_187
  L19_203 = L19_203(L20_204)
  L20_204 = _UPVALUE11_
  if L19_203 == L20_204 then
    L19_203 = _UPVALUE0_
    L19_203 = L19_203.NIL
    if A6_190 == L19_203 then
      L19_203 = _UPVALUE0_
      L19_203 = L19_203.INVALID_ARGUMENT
      return L19_203
    end
    L19_203 = _UPVALUE3_
    L19_203 = L19_203.ipAddressCheck
    L20_204 = _UPVALUE12_
    L21_205 = A6_190
    L19_203 = L19_203(L20_204, L21_205)
    valid = L19_203
    L19_203 = valid
    L20_204 = _UPVALUE0_
    L20_204 = L20_204.SUCCESS
    if L19_203 ~= L20_204 then
      L19_203 = _UPVALUE6_
      L19_203 = L19_203.WAN_L2TP_INVALID_STATIC_IP
      return L19_203
    end
    L19_203 = _UPVALUE7_
    L20_204 = "."
    L21_205 = _UPVALUE8_
    L21_205 = L21_205.staticIPAddress
    L19_203 = L19_203 .. L20_204 .. L21_205
    L17_201[L19_203] = A6_190
    L19_203 = _UPVALUE0_
    L19_203 = L19_203.NIL
    if A16_200 ~= L19_203 and A16_200 ~= "" then
      L19_203 = _UPVALUE3_
      L19_203 = L19_203.ipAddressCheck
      L20_204 = _UPVALUE12_
      L21_205 = A16_200
      L19_203 = L19_203(L20_204, L21_205)
      valid = L19_203
      L19_203 = valid
      L20_204 = _UPVALUE0_
      L20_204 = L20_204.SUCCESS
      if L19_203 ~= L20_204 then
        L19_203 = _UPVALUE6_
        L19_203 = L19_203.WAN_INVALID_STATIC_DNS_IP
        return L19_203
      end
    end
    L19_203 = _UPVALUE7_
    L20_204 = "."
    L21_205 = _UPVALUE8_
    L21_205 = L21_205.staticDNSIP
    L19_203 = L19_203 .. L20_204 .. L21_205
    L17_201[L19_203] = A16_200
    L19_203 = _UPVALUE0_
    L19_203 = L19_203.NIL
    if A7_191 == L19_203 then
      L19_203 = _UPVALUE0_
      L19_203 = L19_203.INVALID_ARGUMENT
      return L19_203
    end
    L19_203 = _UPVALUE3_
    L19_203 = L19_203.ipAddressCheck
    L20_204 = _UPVALUE12_
    L21_205 = A7_191
    L19_203 = L19_203(L20_204, L21_205)
    valid = L19_203
    L19_203 = valid
    L20_204 = _UPVALUE0_
    L20_204 = L20_204.SUCCESS
    if L19_203 ~= L20_204 then
      L19_203 = _UPVALUE6_
      L19_203 = L19_203.WAN_L2TP_INVALID_GATEWAY
      return L19_203
    end
    L19_203 = _UPVALUE7_
    L20_204 = "."
    L21_205 = _UPVALUE8_
    L21_205 = L21_205.gateway
    L19_203 = L19_203 .. L20_204 .. L21_205
    L17_201[L19_203] = A7_191
  end
  L19_203 = tonumber
  L20_204 = A3_187
  L19_203 = L19_203(L20_204)
  L20_204 = _UPVALUE11_
  if L19_203 == L20_204 then
    L19_203 = _UPVALUE0_
    L19_203 = L19_203.NIL
    if A8_192 == L19_203 then
      L19_203 = _UPVALUE0_
      L19_203 = L19_203.INVALID_ARGUMENT
      return L19_203
    end
    L19_203 = _UPVALUE3_
    L19_203 = L19_203.ipAddressCheck
    L20_204 = _UPVALUE12_
    L21_205 = A8_192
    L19_203 = L19_203(L20_204, L21_205)
    valid = L19_203
    L19_203 = valid
    L20_204 = _UPVALUE0_
    L20_204 = L20_204.SUCCESS
    if L19_203 ~= L20_204 then
      L19_203 = _UPVALUE6_
      L19_203 = L19_203.WAN_L2TP_INVALID_NETMASK
      return L19_203
    end
    L19_203 = _UPVALUE7_
    L20_204 = "."
    L21_205 = _UPVALUE8_
    L21_205 = L21_205.netmask
    L19_203 = L19_203 .. L20_204 .. L21_205
    L17_201[L19_203] = A8_192
    L19_203 = _UPVALUE3_
    L19_203 = L19_203.ipv4DualMaskCheck
    L20_204 = A6_190
    L21_205 = A8_192
    L19_203 = L19_203(L20_204, L21_205, A7_191, A8_192)
    valid = L19_203
    L19_203 = valid
    L20_204 = _UPVALUE0_
    L20_204 = L20_204.SUCCESS
    if L19_203 ~= L20_204 then
      L19_203 = _UPVALUE6_
      L19_203 = L19_203.GATEWAY_NOT_IN_SAME_SUBNET
      return L19_203
    end
    L19_203 = staticIpSubnetCheck
    L20_204 = A0_184
    L21_205 = A6_190
    L19_203 = L19_203(L20_204, L21_205, A8_192)
    valid = L19_203
    L19_203 = valid
    L20_204 = _UPVALUE0_
    L20_204 = L20_204.SUCCESS
    if L19_203 ~= L20_204 then
      L19_203 = valid
      return L19_203
    end
  end
  L19_203 = tonumber
  L20_204 = A4_188
  L19_203 = L19_203(L20_204)
  L20_204 = _UPVALUE11_
  if L19_203 == L20_204 then
    L19_203 = _UPVALUE0_
    L19_203 = L19_203.NIL
    if A9_193 == L19_203 then
      L19_203 = _UPVALUE0_
      L19_203 = L19_203.INVALID_ARGUMENT
      return L19_203
    end
    L19_203 = _UPVALUE3_
    L19_203 = L19_203.ipAddressCheck
    L20_204 = _UPVALUE12_
    L21_205 = A9_193
    L19_203 = L19_203(L20_204, L21_205)
    valid = L19_203
    L19_203 = valid
    L20_204 = _UPVALUE0_
    L20_204 = L20_204.SUCCESS
    if L19_203 ~= L20_204 then
      L19_203 = _UPVALUE6_
      L19_203 = L19_203.WAN_L2TP_INVALID_PRIMARY_DNS
      return L19_203
    end
    L19_203 = _UPVALUE7_
    L20_204 = "."
    L21_205 = _UPVALUE8_
    L21_205 = L21_205.primaryDNS
    L19_203 = L19_203 .. L20_204 .. L21_205
    L17_201[L19_203] = A9_193
    L19_203 = _UPVALUE0_
    L19_203 = L19_203.NIL
    if A10_194 == L19_203 then
      L19_203 = _UPVALUE0_
      L19_203 = L19_203.INVALID_ARGUMENT
      return L19_203
    end
    L19_203 = _UPVALUE3_
    L19_203 = L19_203.ipAddressCheck
    L20_204 = _UPVALUE12_
    L21_205 = A10_194
    L19_203 = L19_203(L20_204, L21_205)
    valid = L19_203
    L19_203 = valid
    L20_204 = _UPVALUE0_
    L20_204 = L20_204.SUCCESS
    if L19_203 ~= L20_204 then
      L19_203 = _UPVALUE6_
      L19_203 = L19_203.WAN_L2TP_INVALID_SECONDARY_DNS
      return L19_203
    end
    L19_203 = _UPVALUE7_
    L20_204 = "."
    L21_205 = _UPVALUE8_
    L21_205 = L21_205.secondaryDNS
    L19_203 = L19_203 .. L20_204 .. L21_205
    L17_201[L19_203] = A10_194
  end
  L19_203 = _UPVALUE0_
  L19_203 = L19_203.NIL
  if A11_195 == L19_203 then
    L19_203 = _UPVALUE0_
    L19_203 = L19_203.INVALID_ARGUMENT
    return L19_203
  end
  L19_203 = tonumber
  L20_204 = A11_195
  L19_203 = L19_203(L20_204)
  L20_204 = _UPVALUE0_
  L20_204 = L20_204.NIL
  if L19_203 == L20_204 then
    L20_204 = _UPVALUE0_
    L20_204 = L20_204.INVALID_ARGUMENT
    return L20_204
  end
  L20_204 = _UPVALUE13_
  if L19_203 ~= L20_204 then
    L20_204 = _UPVALUE14_
    if L19_203 ~= L20_204 then
      L20_204 = _UPVALUE0_
      L20_204 = L20_204.INVALID_ARGUMENT
      return L20_204
    end
  end
  L20_204 = _UPVALUE7_
  L21_205 = "."
  L20_204 = L20_204 .. L21_205 .. _UPVALUE8_.reconnectMode
  L17_201[L20_204] = A11_195
  L20_204 = tonumber
  L21_205 = A11_195
  L20_204 = L20_204(L21_205)
  L21_205 = _UPVALUE14_
  if L20_204 == L21_205 then
    L20_204 = idleTimeOutCheck
    L20_204 = L20_204()
    L21_205 = _UPVALUE0_
    L21_205 = L21_205.SUCCESS
    if L20_204 ~= L21_205 then
      return L20_204
    end
    L21_205 = _UPVALUE0_
    L21_205 = L21_205.NIL
    if A12_196 == L21_205 then
      L21_205 = _UPVALUE0_
      L21_205 = L21_205.INVALID_ARGUMENT
      return L21_205
    end
    L21_205 = tonumber
    L21_205 = L21_205(A12_196)
    if L21_205 < _UPVALUE15_ or L21_205 > _UPVALUE16_ then
      return _UPVALUE6_.WAN_L2TP_INVALID_TIMEOUT
    end
    L17_201[_UPVALUE7_ .. "." .. _UPVALUE8_.maxIdleTime] = A12_196
  end
  L20_204 = _UPVALUE0_
  L20_204 = L20_204.NIL
  if A13_197 == L20_204 then
    L20_204 = _UPVALUE0_
    L20_204 = L20_204.INVALID_ARGUMENT
    return L20_204
  end
  L20_204 = _UPVALUE3_
  L20_204 = L20_204.isBoolean
  L21_205 = A13_197
  L20_204 = L20_204(L21_205)
  valid = L20_204
  L20_204 = valid
  L21_205 = _UPVALUE0_
  L21_205 = L21_205.SUCCESS
  if L20_204 ~= L21_205 then
    L20_204 = _UPVALUE0_
    L20_204 = L20_204.INVALID_ARGUMENT
    return L20_204
  end
  L20_204 = _UPVALUE7_
  L21_205 = "."
  L20_204 = L20_204 .. L21_205 .. _UPVALUE8_.splitTunnel
  L17_201[L20_204] = A13_197
  L20_204 = _UPVALUE0_
  L20_204 = L20_204.NIL
  if A14_198 == L20_204 then
    L20_204 = _UPVALUE0_
    L20_204 = L20_204.INVALID_ARGUMENT
    return L20_204
  end
  L20_204 = _UPVALUE3_
  L20_204 = L20_204.isBoolean
  L21_205 = A14_198
  L20_204 = L20_204(L21_205)
  valid = L20_204
  L20_204 = valid
  L21_205 = _UPVALUE0_
  L21_205 = L21_205.SUCCESS
  if L20_204 ~= L21_205 then
    L20_204 = _UPVALUE0_
    L20_204 = L20_204.INVALID_ARGUMENT
    return L20_204
  end
  L20_204 = _UPVALUE7_
  L21_205 = "."
  L20_204 = L20_204 .. L21_205 .. _UPVALUE8_.dualAccess
  L17_201[L20_204] = A14_198
  L20_204 = _UPVALUE0_
  L20_204 = L20_204.NIL
  if A15_199 ~= L20_204 then
    L20_204 = _UPVALUE3_
    L20_204 = L20_204.stringLengthCheck
    L21_205 = _UPVALUE17_
    L20_204 = L20_204(L21_205, _UPVALUE18_, A1_185)
    L21_205 = _UPVALUE0_
    L21_205 = L21_205.FAILURE
    if L20_204 == L21_205 then
      L20_204 = _UPVALUE6_
      L20_204 = L20_204.INVALID_SECRET_LENGTH
      return L20_204
    end
    L20_204 = util
    L20_204 = L20_204.mask
    L21_205 = A15_199
    L20_204 = L20_204(L21_205)
    if L20_204 ~= A15_199 or L20_204 == "" then
      L21_205 = _UPVALUE7_
      L21_205 = L21_205 .. "." .. _UPVALUE8_.secret
      L17_201[L21_205] = A15_199
    end
  end
  L20_204 = db
  L20_204 = L20_204.getAttribute
  L21_205 = _UPVALUE7_
  L20_204 = L20_204(L21_205, _UPVALUE8_.wanPort, A0_184, _UPVALUE19_)
  L21_205 = nil
  L21_205 = db.update(_UPVALUE7_, L17_201, L20_204)
  if L21_205 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L20_204
  end
  return _UPVALUE0_.SUCCESS, L20_204
end
function l2tpClientGroupCreate(A0_206, A1_207, A2_208, A3_209, A4_210, A5_211, A6_212, A7_213, A8_214, A9_215, A10_216, A11_217, A12_218, A13_219, A14_220)
  local L16_221, L17_222
  L16_221 = _UPVALUE0_
  L16_221 = L16_221.NOT_SUPPORTED
  L17_222 = 0
  return L16_221, L17_222, 0
end
function l2tpClientGroupDelete(A0_223)
  local L2_224, L3_225
  L2_224 = _UPVALUE0_
  L2_224 = L2_224.NOT_SUPPORTED
  L3_225 = 0
  return L2_224, L3_225, 0
end
function staticIpSubnetCheck(A0_226, A1_227, A2_228)
  local L3_229, L4_230, L5_231, L6_232, L7_233, L8_234, L9_235, L10_236, L11_237, L12_238, L13_239, L14_240, L15_241, L16_242, L17_243, L18_244, L19_245
  L13_239 = _UPVALUE0_
  L14_240 = _UPVALUE1_
  L14_240 = L14_240.vlanGet
  L15_241 = L13_239
  L8_234, L10_236, L11_237, L12_238, L14_240 = nil, nil, nil, nil, L14_240(L15_241)
  L8_234, L10_236, L11_237, L12_238, L15_241 = nil, nil, nil, nil, L14_240(L15_241)
  L8_234, L10_236, L11_237, L12_238, L16_242 = nil, nil, nil, nil, L14_240(L15_241)
  L8_234, L10_236, L11_237, L12_238, L17_243 = nil, nil, nil, nil, L14_240(L15_241)
  L8_234, L10_236, L11_237, L12_238, L18_244 = nil, nil, nil, nil, L14_240(L15_241)
  L8_234, L10_236, L11_237, L12_238, L19_245 = nil, nil, nil, nil, L14_240(L15_241)
  L4_230 = L19_245
  L7_233 = L18_244
  L6_232 = L17_243
  L5_231 = L16_242
  L9_235 = L15_241
  L3_229 = L14_240
  L14_240 = _UPVALUE2_
  L14_240 = L14_240.SUCCESS
  if L3_229 ~= L14_240 then
    L14_240 = _UPVALUE3_
    L14_240 = L14_240.SUBNET_CHECK_FAILED
    return L14_240
  end
  L14_240 = _UPVALUE4_
  L14_240 = L14_240.ipv4DualMaskCheck
  L15_241 = L4_230
  L16_242 = L8_234
  L17_243 = A1_227
  L18_244 = A2_228
  L14_240 = L14_240(L15_241, L16_242, L17_243, L18_244)
  L3_229 = L14_240
  L14_240 = _UPVALUE2_
  L14_240 = L14_240.SUCCESS
  if L3_229 == L14_240 then
    L14_240 = _UPVALUE3_
    L14_240 = L14_240.SAME_SUBNET_LAN
    return L14_240
  end
  L14_240 = _UPVALUE1_
  L14_240 = L14_240.vlanGetNext
  L15_241 = L9_235
  L8_234, L10_236, L11_237, L12_238, L19_245 = L14_240(L15_241)
  L4_230 = L19_245
  L7_233 = L18_244
  L6_232 = L17_243
  L5_231 = L16_242
  L9_235 = L15_241
  L3_229 = L14_240
  while true do
    L14_240 = _UPVALUE2_
    L14_240 = L14_240.NEXT_ROWID_INVALID
    if L3_229 ~= L14_240 then
      L14_240 = _UPVALUE2_
      L14_240 = L14_240.SUCCESS
      if L3_229 ~= L14_240 then
        L14_240 = _UPVALUE3_
        L14_240 = L14_240.SUBNET_CHECK_FAILED
        return L14_240
      end
      L14_240 = _UPVALUE4_
      L14_240 = L14_240.ipv4DualMaskCheck
      L15_241 = L4_230
      L16_242 = L8_234
      L17_243 = A1_227
      L18_244 = A2_228
      L14_240 = L14_240(L15_241, L16_242, L17_243, L18_244)
      L3_229 = L14_240
      L14_240 = _UPVALUE2_
      L14_240 = L14_240.SUCCESS
      if L3_229 == L14_240 then
        L14_240 = _UPVALUE3_
        L14_240 = L14_240.SAME_SUBNET_VLAN
        return L14_240
      end
      L14_240 = _UPVALUE1_
      L14_240 = L14_240.vlanGetNext
      L15_241 = L9_235
      L8_234, L10_236, L11_237, L12_238, L19_245 = L14_240(L15_241)
      L4_230 = L19_245
      L7_233 = L18_244
      L6_232 = L17_243
      L5_231 = L16_242
      L9_235 = L15_241
      L3_229 = L14_240
    end
  end
  L14_240 = db
  L14_240 = L14_240.getAttribute
  L15_241 = _UPVALUE5_
  L16_242 = _UPVALUE6_
  L16_242 = L16_242.dmz_interface
  L17_243 = _UPVALUE7_
  L18_244 = _UPVALUE6_
  L18_244 = L18_244.dmz_ip
  L14_240 = L14_240(L15_241, L16_242, L17_243, L18_244)
  L15_241 = db
  L15_241 = L15_241.getAttribute
  L16_242 = _UPVALUE5_
  L17_243 = _UPVALUE6_
  L17_243 = L17_243.dmz_interface
  L18_244 = _UPVALUE7_
  L19_245 = _UPVALUE6_
  L19_245 = L19_245.dmz_netmask
  L15_241 = L15_241(L16_242, L17_243, L18_244, L19_245)
  L16_242 = _UPVALUE2_
  L16_242 = L16_242.NIL
  if L14_240 ~= L16_242 then
    L16_242 = _UPVALUE8_
    if L14_240 ~= L16_242 then
      L16_242 = _UPVALUE2_
      L16_242 = L16_242.NIL
      if L15_241 ~= L16_242 then
        L16_242 = _UPVALUE8_
        if L15_241 ~= L16_242 then
          L16_242 = _UPVALUE4_
          L16_242 = L16_242.ipv4DualMaskCheck
          L17_243 = L14_240
          L18_244 = L15_241
          L19_245 = A1_227
          L16_242 = L16_242(L17_243, L18_244, L19_245, A2_228)
          L3_229 = L16_242
          L16_242 = _UPVALUE2_
          L16_242 = L16_242.SUCCESS
          if L3_229 == L16_242 then
            L16_242 = _UPVALUE3_
            L16_242 = L16_242.SAME_SUBNET_DMZ
            return L16_242
          end
        end
      end
    end
  end
  L16_242 = UNIT_NAME
  if L16_242 ~= "DSR-1000N" then
    L16_242 = UNIT_NAME
    if L16_242 ~= "DSR-1000" then
      L16_242 = UNIT_NAME
      if L16_242 ~= "DSR-500N" then
        L16_242 = UNIT_NAME
        if L16_242 ~= "DSR-500" then
          L16_242 = PRODUCT_ID
          if L16_242 ~= "DSR-1000AC_Ax" then
            L16_242 = PRODUCT_ID
            if L16_242 ~= "DSR-500AC_Ax" then
              L16_242 = PRODUCT_ID
              if L16_242 ~= "DSR-1000_Bx" then
                L16_242 = PRODUCT_ID
              end
            end
          end
        end
      end
    end
  elseif L16_242 == "DSR-500_Bx" then
    L16_242 = _UPVALUE4_
    L16_242 = L16_242.checkOpenVpnSubnetRange
    L17_243 = A1_227
    L18_244 = A2_228
    L16_242 = L16_242(L17_243, L18_244)
    L3_229 = L16_242
    L16_242 = _UPVALUE2_
    L16_242 = L16_242.SUCCESS
    if L3_229 == L16_242 then
      L16_242 = _UPVALUE2_
      L16_242 = L16_242.OPENVPN_ALREADY_CONFIGURED
      return L16_242
    end
  end
  L16_242 = _UPVALUE4_
  L16_242 = L16_242.ipv4DualMaskCheck
  L17_243 = _UPVALUE9_
  L18_244 = _UPVALUE10_
  L19_245 = A1_227
  L16_242 = L16_242(L17_243, L18_244, L19_245, A2_228)
  L3_229 = L16_242
  L16_242 = _UPVALUE2_
  L16_242 = L16_242.SUCCESS
  if L3_229 == L16_242 then
    L16_242 = _UPVALUE3_
    L16_242 = L16_242.SAME_SUBNET_LOCAL_IP
    return L16_242
  end
  L16_242 = db
  L16_242 = L16_242.getAttribute
  L17_243 = _UPVALUE11_
  L18_244 = _UPVALUE12_
  L19_245 = "1"
  L16_242 = L16_242(L17_243, L18_244, L19_245, _UPVALUE6_.ipsec_startIPAddress)
  L17_243 = db
  L17_243 = L17_243.getAttribute
  L18_244 = _UPVALUE11_
  L19_245 = _UPVALUE12_
  L17_243 = L17_243(L18_244, L19_245, "1", _UPVALUE6_.ipsec_subnetMask)
  L18_244 = _UPVALUE2_
  L18_244 = L18_244.NIL
  if L16_242 ~= L18_244 then
    L18_244 = _UPVALUE8_
    if L16_242 ~= L18_244 then
      L18_244 = _UPVALUE2_
      L18_244 = L18_244.NIL
      if L17_243 ~= L18_244 then
        L18_244 = _UPVALUE8_
        if L17_243 ~= L18_244 then
          L18_244 = _UPVALUE4_
          L18_244 = L18_244.ipv4DualMaskCheck
          L19_245 = L16_242
          L18_244 = L18_244(L19_245, L17_243, A1_227, A2_228)
          L3_229 = L18_244
          L18_244 = _UPVALUE2_
          L18_244 = L18_244.SUCCESS
          if L3_229 == L18_244 then
            L18_244 = _UPVALUE3_
            L18_244 = L18_244.SAME_SUBNET_IPSEC
            return L18_244
          end
        end
      end
    end
  end
  L18_244 = _UPVALUE13_
  if A0_226 == L18_244 then
    L18_244 = db
    L18_244 = L18_244.getAttributeWhere
    L19_245 = _UPVALUE14_
    L18_244 = L18_244(L19_245, _UPVALUE6_.interfaceName .. " = '" .. _UPVALUE15_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE16_, _UPVALUE6_.wan_ipAddress)
    L19_245 = db
    L19_245 = L19_245.getAttributeWhere
    L19_245 = L19_245(_UPVALUE14_, _UPVALUE6_.interfaceName .. " = '" .. _UPVALUE15_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE16_, _UPVALUE6_.wan_subnet)
    if L18_244 ~= _UPVALUE2_.NIL and L18_244 ~= _UPVALUE8_ and L19_245 ~= _UPVALUE2_.NIL and L19_245 ~= _UPVALUE8_ then
      L3_229 = _UPVALUE4_.ipv4DualMaskCheck(L18_244, L19_245, A1_227, A2_228)
      if L3_229 == _UPVALUE2_.SUCCESS then
        return _UPVALUE3_.SAME_SUBNET_WAN2
      end
    end
  end
  L18_244 = _UPVALUE15_
  if A0_226 == L18_244 then
    L18_244 = db
    L18_244 = L18_244.getAttributeWhere
    L19_245 = _UPVALUE14_
    L18_244 = L18_244(L19_245, _UPVALUE6_.interfaceName .. " = '" .. _UPVALUE13_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE16_, _UPVALUE6_.wan_ipAddress)
    L19_245 = db
    L19_245 = L19_245.getAttributeWhere
    L19_245 = L19_245(_UPVALUE14_, _UPVALUE6_.interfaceName .. " = '" .. _UPVALUE13_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE16_, _UPVALUE6_.wan_subnet)
    if L18_244 ~= _UPVALUE2_.NIL and L18_244 ~= _UPVALUE8_ and L19_245 ~= _UPVALUE2_.NIL and L19_245 ~= _UPVALUE8_ then
      L3_229 = _UPVALUE4_.ipv4DualMaskCheck(L18_244, L19_245, A1_227, A2_228)
      if L3_229 == _UPVALUE2_.SUCCESS then
        return _UPVALUE3_.SAME_SUBNET_WAN1
      end
    end
  end
  L18_244 = _UPVALUE2_
  L18_244 = L18_244.SUCCESS
  return L18_244
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
