local L0_0
L0_0 = module
L0_0("com.teamf1.core.ipsec.modeconfig", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vipsecure_returnCodes")
L0_0 = require
L0_0("teamf1lualib/nimf_returnCodes")
L0_0 = require
L0_0("teamf1lualib/vlan_vlan")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.vipsecure.returnCodes")
modeconfigTable = "IpsecModeConfig"
;({}).recordName = "ModeConfigRecordName"
;({}).tunnelMode = "TunnelMode"
;({}).firstPoolStartIP = "FirstPoolStartIP"
;({}).firstPoolEndIP = "FirstPoolEndIP"
;({}).secondPoolStartIP = "SecondPoolStartIP"
;({}).secondPoolEndIP = "SecondPoolEndIP"
;({}).thirdPoolStartIP = "ThirdPoolStartIP"
;({}).thirdPoolEndIP = "ThirdPoolEndIP"
;({}).WINSServerPrimaryIP = "WINSServerPrimaryIP"
;({}).WINSServerSecondaryIP = "WINSServerSecondaryIP"
;({}).DNSServerPrimaryIP = "DNSServerPrimaryIP"
;({}).DNSServerSecondaryIP = "DNSServerSecondaryIP"
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
splitDnsTable = "SplitDns"
;({}).splitDNSDomainName = "DomainName"
ROW_ID = "_ROWID_"
FULL_TUNNEL = 0
SPLIT_TUNNEL = 1
;({}).pptp_ip = "startIPAddress"
;({}).beginClientAddress = "BeginClientAddress"
function recordNameGet()
  local L0_1, L1_2
  L0_1 = db
  L0_1 = L0_1.getNextRowId
  L1_2 = "0"
  L0_1 = L0_1(L1_2, modeconfigTable)
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(modeconfigTable, ROW_ID, L0_1, _UPVALUE0_.recordName)
  if L1_2 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_1, L1_2
end
function recordNameGetNext(A0_3)
  local L1_4, L2_5
  L1_4 = _UPVALUE0_
  L1_4 = L1_4.NIL
  if A0_3 ~= L1_4 then
    L1_4 = tonumber
    L2_5 = A0_3
    L1_4 = L1_4(L2_5)
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.NIL
  elseif L1_4 == L2_5 then
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.INVALID_ARGUMENT
    return L1_4
  end
  L1_4 = db
  L1_4 = L1_4.existsRow
  L2_5 = modeconfigTable
  L1_4 = L1_4(L2_5, ROW_ID, A0_3)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.FALSE
  if L1_4 == L2_5 then
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.INVALID_ARGUMENT
    return L1_4
  end
  L1_4 = db
  L1_4 = L1_4.getNextRowId
  L2_5 = A0_3
  L1_4 = L1_4(L2_5, modeconfigTable)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if L1_4 == L2_5 then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.NOT_EXIST
    return L2_5
  end
  L2_5 = db
  L2_5 = L2_5.getAttribute
  L2_5 = L2_5(modeconfigTable, ROW_ID, L1_4, _UPVALUE1_.recordName)
  if L2_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L2_5
end
function recordNameSet(A0_6, A1_7)
  if A0_6 == _UPVALUE0_.NIL or tonumber(A0_6) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigTable, ROW_ID, A0_6) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_7 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigTable, ROW_ID, A0_6, _UPVALUE1_.recordName, A1_7) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_6
  end
  return _UPVALUE0_.SUCCESS, A0_6
end
function recordNameDelete(A0_8, A1_9)
  local L3_10
  L3_10 = _UPVALUE0_
  L3_10 = L3_10.NOT_SUPPORTED
  return L3_10, A0_8
end
function tunnelModeGet()
  local L0_11, L1_12
  L0_11 = db
  L0_11 = L0_11.getNextRowId
  L1_12 = "0"
  L0_11 = L0_11(L1_12, modeconfigTable)
  L1_12 = db
  L1_12 = L1_12.getAttribute
  L1_12 = L1_12(modeconfigTable, ROW_ID, L0_11, _UPVALUE0_.tunnelMode)
  if L1_12 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_11, L1_12
end
function tunnelModeGetNext(A0_13)
  local L1_14, L2_15
  L1_14 = _UPVALUE0_
  L1_14 = L1_14.NIL
  if A0_13 ~= L1_14 then
    L1_14 = tonumber
    L2_15 = A0_13
    L1_14 = L1_14(L2_15)
    L2_15 = _UPVALUE0_
    L2_15 = L2_15.NIL
  elseif L1_14 == L2_15 then
    L1_14 = _UPVALUE0_
    L1_14 = L1_14.INVALID_ARGUMENT
    return L1_14
  end
  L1_14 = db
  L1_14 = L1_14.existsRow
  L2_15 = modeconfigTable
  L1_14 = L1_14(L2_15, ROW_ID, A0_13)
  L2_15 = _UPVALUE0_
  L2_15 = L2_15.FALSE
  if L1_14 == L2_15 then
    L1_14 = _UPVALUE0_
    L1_14 = L1_14.INVALID_ARGUMENT
    return L1_14
  end
  L1_14 = db
  L1_14 = L1_14.getNextRowId
  L2_15 = A0_13
  L1_14 = L1_14(L2_15, modeconfigTable)
  L2_15 = _UPVALUE0_
  L2_15 = L2_15.NIL
  if L1_14 == L2_15 then
    L2_15 = _UPVALUE0_
    L2_15 = L2_15.NOT_EXIST
    return L2_15
  end
  L2_15 = db
  L2_15 = L2_15.getAttribute
  L2_15 = L2_15(modeconfigTable, ROW_ID, L1_14, _UPVALUE1_.tunnelMode)
  if L2_15 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_14
  end
  return _UPVALUE0_.SUCCESS, L1_14, L2_15
end
function tunnelModeSet(A0_16, A1_17)
  if A0_16 == _UPVALUE0_.NIL or tonumber(A0_16) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigTable, ROW_ID, A0_16) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_17 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_17) ~= FULL_TUNNEL and tonumber(A1_17) ~= SPLIT_TUNNEL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigTable, ROW_ID, A0_16, _UPVALUE1_.tunnelMode, A1_17) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_16
  end
  return _UPVALUE0_.SUCCESS, A0_16
end
function firstPoolStartIPGet()
  local L0_18, L1_19
  L0_18 = db
  L0_18 = L0_18.getNextRowId
  L1_19 = "0"
  L0_18 = L0_18(L1_19, modeconfigTable)
  L1_19 = db
  L1_19 = L1_19.getAttribute
  L1_19 = L1_19(modeconfigTable, ROW_ID, L0_18, _UPVALUE0_.firstPoolStartIP)
  if L1_19 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_18, L1_19
end
function firstPoolStartIPGetNext(A0_20)
  local L1_21, L2_22
  L1_21 = _UPVALUE0_
  L1_21 = L1_21.NIL
  if A0_20 ~= L1_21 then
    L1_21 = tonumber
    L2_22 = A0_20
    L1_21 = L1_21(L2_22)
    L2_22 = _UPVALUE0_
    L2_22 = L2_22.NIL
  elseif L1_21 == L2_22 then
    L1_21 = _UPVALUE0_
    L1_21 = L1_21.INVALID_ARGUMENT
    return L1_21
  end
  L1_21 = db
  L1_21 = L1_21.existsRow
  L2_22 = modeconfigTable
  L1_21 = L1_21(L2_22, ROW_ID, A0_20)
  L2_22 = _UPVALUE0_
  L2_22 = L2_22.FALSE
  if L1_21 == L2_22 then
    L1_21 = _UPVALUE0_
    L1_21 = L1_21.INVALID_ARGUMENT
    return L1_21
  end
  L1_21 = db
  L1_21 = L1_21.getNextRowId
  L2_22 = A0_20
  L1_21 = L1_21(L2_22, modeconfigTable)
  L2_22 = _UPVALUE0_
  L2_22 = L2_22.NIL
  if L1_21 == L2_22 then
    L2_22 = _UPVALUE0_
    L2_22 = L2_22.NOT_EXIST
    return L2_22
  end
  L2_22 = db
  L2_22 = L2_22.getAttribute
  L2_22 = L2_22(modeconfigTable, ROW_ID, L1_21, _UPVALUE1_.firstPoolStartIP)
  if L2_22 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_21
  end
  return _UPVALUE0_.SUCCESS, L1_21, L2_22
end
function firstPoolStartIPSet(A0_23, A1_24)
  if A0_23 == _UPVALUE0_.NIL or tonumber(A0_23) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigTable, ROW_ID, A0_23) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_24 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck("2", A1_24)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigTable, ROW_ID, A0_23, _UPVALUE2_.firstPoolStartIP, A1_24) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_23
  end
  return _UPVALUE0_.SUCCESS, A0_23
end
function firstPoolEndIPGet()
  local L0_25, L1_26
  L0_25 = db
  L0_25 = L0_25.getNextRowId
  L1_26 = "0"
  L0_25 = L0_25(L1_26, modeconfigTable)
  L1_26 = db
  L1_26 = L1_26.getAttribute
  L1_26 = L1_26(modeconfigTable, ROW_ID, L0_25, _UPVALUE0_.firstPoolEndIP)
  if L1_26 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_25, L1_26
end
function firstPoolEndIPGetNext(A0_27)
  local L1_28, L2_29
  L1_28 = _UPVALUE0_
  L1_28 = L1_28.NIL
  if A0_27 ~= L1_28 then
    L1_28 = tonumber
    L2_29 = A0_27
    L1_28 = L1_28(L2_29)
    L2_29 = _UPVALUE0_
    L2_29 = L2_29.NIL
  elseif L1_28 == L2_29 then
    L1_28 = _UPVALUE0_
    L1_28 = L1_28.INVALID_ARGUMENT
    return L1_28
  end
  L1_28 = db
  L1_28 = L1_28.existsRow
  L2_29 = modeconfigTable
  L1_28 = L1_28(L2_29, ROW_ID, A0_27)
  L2_29 = _UPVALUE0_
  L2_29 = L2_29.FALSE
  if L1_28 == L2_29 then
    L1_28 = _UPVALUE0_
    L1_28 = L1_28.INVALID_ARGUMENT
    return L1_28
  end
  L1_28 = db
  L1_28 = L1_28.getNextRowId
  L2_29 = A0_27
  L1_28 = L1_28(L2_29, modeconfigTable)
  L2_29 = _UPVALUE0_
  L2_29 = L2_29.NIL
  if L1_28 == L2_29 then
    L2_29 = _UPVALUE0_
    L2_29 = L2_29.NOT_EXIST
    return L2_29
  end
  L2_29 = db
  L2_29 = L2_29.getAttribute
  L2_29 = L2_29(modeconfigTable, ROW_ID, L1_28, _UPVALUE1_.firstPoolEndIP)
  if L2_29 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_28
  end
  return _UPVALUE0_.SUCCESS, L1_28, L2_29
end
function firstPoolEndIPSet(A0_30, A1_31)
  if A0_30 == _UPVALUE0_.NIL or tonumber(A0_30) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigTable, ROW_ID, A0_30) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_31 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck("2", A1_31)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigTable, ROW_ID, A0_30, _UPVALUE2_.firstPoolEndIP, A1_31) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_30
  end
  return _UPVALUE0_.SUCCESS, A0_30
end
function secondPoolStartIPGet()
  local L0_32, L1_33
  L0_32 = db
  L0_32 = L0_32.getNextRowId
  L1_33 = "0"
  L0_32 = L0_32(L1_33, modeconfigTable)
  L1_33 = db
  L1_33 = L1_33.getAttribute
  L1_33 = L1_33(modeconfigTable, ROW_ID, L0_32, _UPVALUE0_.secondPoolStartIP)
  if L1_33 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_32, L1_33
end
function secondPoolStartIPGetNext(A0_34)
  local L1_35, L2_36
  L1_35 = _UPVALUE0_
  L1_35 = L1_35.NIL
  if A0_34 ~= L1_35 then
    L1_35 = tonumber
    L2_36 = A0_34
    L1_35 = L1_35(L2_36)
    L2_36 = _UPVALUE0_
    L2_36 = L2_36.NIL
  elseif L1_35 == L2_36 then
    L1_35 = _UPVALUE0_
    L1_35 = L1_35.INVALID_ARGUMENT
    return L1_35
  end
  L1_35 = db
  L1_35 = L1_35.existsRow
  L2_36 = modeconfigTable
  L1_35 = L1_35(L2_36, ROW_ID, A0_34)
  L2_36 = _UPVALUE0_
  L2_36 = L2_36.FALSE
  if L1_35 == L2_36 then
    L1_35 = _UPVALUE0_
    L1_35 = L1_35.INVALID_ARGUMENT
    return L1_35
  end
  L1_35 = db
  L1_35 = L1_35.getNextRowId
  L2_36 = A0_34
  L1_35 = L1_35(L2_36, modeconfigTable)
  L2_36 = _UPVALUE0_
  L2_36 = L2_36.NIL
  if L1_35 == L2_36 then
    L2_36 = _UPVALUE0_
    L2_36 = L2_36.NOT_EXIST
    return L2_36
  end
  L2_36 = db
  L2_36 = L2_36.getAttribute
  L2_36 = L2_36(modeconfigTable, ROW_ID, L1_35, _UPVALUE1_.secondPoolStartIP)
  if L2_36 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_35
  end
  return _UPVALUE0_.SUCCESS, L1_35, L2_36
end
function secondPoolStartIPSet(A0_37, A1_38)
  if A0_37 == _UPVALUE0_.NIL or tonumber(A0_37) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigTable, ROW_ID, A0_37) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_38 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck("2", A1_38)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigTable, ROW_ID, A0_37, _UPVALUE2_.secondPoolStartIP, A1_38) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_37
  end
  return _UPVALUE0_.SUCCESS, A0_37
end
function secondPoolEndIPGet()
  local L0_39, L1_40
  L0_39 = db
  L0_39 = L0_39.getNextRowId
  L1_40 = "0"
  L0_39 = L0_39(L1_40, modeconfigTable)
  L1_40 = db
  L1_40 = L1_40.getAttribute
  L1_40 = L1_40(modeconfigTable, ROW_ID, L0_39, _UPVALUE0_.secondPoolEndIP)
  if L1_40 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_39, L1_40
end
function secondPoolEndIPGetNext(A0_41)
  local L1_42, L2_43
  L1_42 = _UPVALUE0_
  L1_42 = L1_42.NIL
  if A0_41 ~= L1_42 then
    L1_42 = tonumber
    L2_43 = A0_41
    L1_42 = L1_42(L2_43)
    L2_43 = _UPVALUE0_
    L2_43 = L2_43.NIL
  elseif L1_42 == L2_43 then
    L1_42 = _UPVALUE0_
    L1_42 = L1_42.INVALID_ARGUMENT
    return L1_42
  end
  L1_42 = db
  L1_42 = L1_42.existsRow
  L2_43 = modeconfigTable
  L1_42 = L1_42(L2_43, ROW_ID, A0_41)
  L2_43 = _UPVALUE0_
  L2_43 = L2_43.FALSE
  if L1_42 == L2_43 then
    L1_42 = _UPVALUE0_
    L1_42 = L1_42.INVALID_ARGUMENT
    return L1_42
  end
  L1_42 = db
  L1_42 = L1_42.getNextRowId
  L2_43 = A0_41
  L1_42 = L1_42(L2_43, modeconfigTable)
  L2_43 = _UPVALUE0_
  L2_43 = L2_43.NIL
  if L1_42 == L2_43 then
    L2_43 = _UPVALUE0_
    L2_43 = L2_43.NOT_EXIST
    return L2_43
  end
  L2_43 = db
  L2_43 = L2_43.getAttribute
  L2_43 = L2_43(modeconfigTable, ROW_ID, L1_42, _UPVALUE1_.secondPoolEndIP)
  if L2_43 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_42
  end
  return _UPVALUE0_.SUCCESS, L1_42, L2_43
end
function secondPoolEndIPSet(A0_44, A1_45)
  if A0_44 == _UPVALUE0_.NIL or tonumber(A0_44) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigTable, ROW_ID, A0_44) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_45 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck("2", A1_45)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigTable, ROW_ID, A0_44, _UPVALUE2_.secondPoolEndIP, A1_45) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_44
  end
  return _UPVALUE0_.SUCCESS, A0_44
end
function thirdPoolStartIPGet()
  local L0_46, L1_47
  L0_46 = db
  L0_46 = L0_46.getNextRowId
  L1_47 = "0"
  L0_46 = L0_46(L1_47, modeconfigTable)
  L1_47 = db
  L1_47 = L1_47.getAttribute
  L1_47 = L1_47(modeconfigTable, ROW_ID, L0_46, _UPVALUE0_.thirdPoolStartIP)
  if L1_47 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_46, L1_47
end
function thirdPoolStartIPGetNext(A0_48)
  local L1_49, L2_50
  L1_49 = _UPVALUE0_
  L1_49 = L1_49.NIL
  if A0_48 ~= L1_49 then
    L1_49 = tonumber
    L2_50 = A0_48
    L1_49 = L1_49(L2_50)
    L2_50 = _UPVALUE0_
    L2_50 = L2_50.NIL
  elseif L1_49 == L2_50 then
    L1_49 = _UPVALUE0_
    L1_49 = L1_49.INVALID_ARGUMENT
    return L1_49
  end
  L1_49 = db
  L1_49 = L1_49.existsRow
  L2_50 = modeconfigTable
  L1_49 = L1_49(L2_50, ROW_ID, A0_48)
  L2_50 = _UPVALUE0_
  L2_50 = L2_50.FALSE
  if L1_49 == L2_50 then
    L1_49 = _UPVALUE0_
    L1_49 = L1_49.INVALID_ARGUMENT
    return L1_49
  end
  L1_49 = db
  L1_49 = L1_49.getNextRowId
  L2_50 = A0_48
  L1_49 = L1_49(L2_50, modeconfigTable)
  L2_50 = _UPVALUE0_
  L2_50 = L2_50.NIL
  if L1_49 == L2_50 then
    L2_50 = _UPVALUE0_
    L2_50 = L2_50.NOT_EXIST
    return L2_50
  end
  L2_50 = db
  L2_50 = L2_50.getAttribute
  L2_50 = L2_50(modeconfigTable, ROW_ID, L1_49, _UPVALUE1_.thirdPoolStartIP)
  if L2_50 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_49
  end
  return _UPVALUE0_.SUCCESS, L1_49, L2_50
end
function thirdPoolStartIPSet(A0_51, A1_52)
  if A0_51 == _UPVALUE0_.NIL or tonumber(A0_51) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigTable, ROW_ID, A0_51) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_52 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck("2", A1_52)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigTable, ROW_ID, A0_51, _UPVALUE2_.thirdPoolStartIP, A1_52) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_51
  end
  return _UPVALUE0_.SUCCESS, A0_51
end
function thirdPoolEndIPGet()
  local L0_53, L1_54
  L0_53 = db
  L0_53 = L0_53.getNextRowId
  L1_54 = "0"
  L0_53 = L0_53(L1_54, modeconfigTable)
  L1_54 = db
  L1_54 = L1_54.getAttribute
  L1_54 = L1_54(modeconfigTable, ROW_ID, L0_53, _UPVALUE0_.thirdPoolEndIP)
  if L1_54 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_53, L1_54
end
function thirdPoolEndIPGetNext(A0_55)
  local L1_56, L2_57
  L1_56 = _UPVALUE0_
  L1_56 = L1_56.NIL
  if A0_55 ~= L1_56 then
    L1_56 = tonumber
    L2_57 = A0_55
    L1_56 = L1_56(L2_57)
    L2_57 = _UPVALUE0_
    L2_57 = L2_57.NIL
  elseif L1_56 == L2_57 then
    L1_56 = _UPVALUE0_
    L1_56 = L1_56.INVALID_ARGUMENT
    return L1_56
  end
  L1_56 = db
  L1_56 = L1_56.existsRow
  L2_57 = modeconfigTable
  L1_56 = L1_56(L2_57, ROW_ID, A0_55)
  L2_57 = _UPVALUE0_
  L2_57 = L2_57.FALSE
  if L1_56 == L2_57 then
    L1_56 = _UPVALUE0_
    L1_56 = L1_56.INVALID_ARGUMENT
    return L1_56
  end
  L1_56 = db
  L1_56 = L1_56.getNextRowId
  L2_57 = A0_55
  L1_56 = L1_56(L2_57, modeconfigTable)
  L2_57 = _UPVALUE0_
  L2_57 = L2_57.NIL
  if L1_56 == L2_57 then
    L2_57 = _UPVALUE0_
    L2_57 = L2_57.NOT_EXIST
    return L2_57
  end
  L2_57 = db
  L2_57 = L2_57.getAttribute
  L2_57 = L2_57(modeconfigTable, ROW_ID, L1_56, _UPVALUE1_.thirdPoolEndIP)
  if L2_57 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_56
  end
  return _UPVALUE0_.SUCCESS, L1_56, L2_57
end
function thirdPoolEndIPSet(A0_58, A1_59)
  if A0_58 == _UPVALUE0_.NIL or tonumber(A0_58) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigTable, ROW_ID, A0_58) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_59 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck("2", A1_59)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigTable, ROW_ID, A0_58, _UPVALUE2_.thirdPoolEndIP, A1_59) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_58
  end
  return _UPVALUE0_.SUCCESS, A0_58
end
function WINSServerPrimaryIPGet()
  local L0_60, L1_61
  L0_60 = db
  L0_60 = L0_60.getNextRowId
  L1_61 = "0"
  L0_60 = L0_60(L1_61, modeconfigTable)
  L1_61 = db
  L1_61 = L1_61.getAttribute
  L1_61 = L1_61(modeconfigTable, ROW_ID, L0_60, _UPVALUE0_.WINSServerPrimaryIP)
  if L1_61 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_60, L1_61
end
function WINSServerPrimaryIPGetNext(A0_62)
  local L1_63, L2_64
  L1_63 = _UPVALUE0_
  L1_63 = L1_63.NIL
  if A0_62 ~= L1_63 then
    L1_63 = tonumber
    L2_64 = A0_62
    L1_63 = L1_63(L2_64)
    L2_64 = _UPVALUE0_
    L2_64 = L2_64.NIL
  elseif L1_63 == L2_64 then
    L1_63 = _UPVALUE0_
    L1_63 = L1_63.INVALID_ARGUMENT
    return L1_63
  end
  L1_63 = db
  L1_63 = L1_63.existsRow
  L2_64 = modeconfigTable
  L1_63 = L1_63(L2_64, ROW_ID, A0_62)
  L2_64 = _UPVALUE0_
  L2_64 = L2_64.FALSE
  if L1_63 == L2_64 then
    L1_63 = _UPVALUE0_
    L1_63 = L1_63.INVALID_ARGUMENT
    return L1_63
  end
  L1_63 = db
  L1_63 = L1_63.getNextRowId
  L2_64 = A0_62
  L1_63 = L1_63(L2_64, modeconfigTable)
  L2_64 = _UPVALUE0_
  L2_64 = L2_64.NIL
  if L1_63 == L2_64 then
    L2_64 = _UPVALUE0_
    L2_64 = L2_64.NOT_EXIST
    return L2_64
  end
  L2_64 = db
  L2_64 = L2_64.getAttribute
  L2_64 = L2_64(modeconfigTable, ROW_ID, L1_63, _UPVALUE1_.WINSServerPrimaryIP)
  if L2_64 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_63
  end
  return _UPVALUE0_.SUCCESS, L1_63, L2_64
end
function WINSServerPrimaryIPSet(A0_65, A1_66)
  if A0_65 == _UPVALUE0_.NIL or tonumber(A0_65) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigTable, ROW_ID, A0_65) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_66 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck("2", A1_66)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigTable, ROW_ID, A0_65, _UPVALUE2_.WINSServerPrimaryIP, A1_66) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_65
  end
  return _UPVALUE0_.SUCCESS, A0_65
end
function WINSServerSecondaryIPGet()
  local L0_67, L1_68
  L0_67 = db
  L0_67 = L0_67.getNextRowId
  L1_68 = "0"
  L0_67 = L0_67(L1_68, modeconfigTable)
  L1_68 = db
  L1_68 = L1_68.getAttribute
  L1_68 = L1_68(modeconfigTable, ROW_ID, L0_67, _UPVALUE0_.WINSServerSecondaryIP)
  if L1_68 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_67, L1_68
end
function WINSServerSecondaryIPGetNext(A0_69)
  local L1_70, L2_71
  L1_70 = _UPVALUE0_
  L1_70 = L1_70.NIL
  if A0_69 ~= L1_70 then
    L1_70 = tonumber
    L2_71 = A0_69
    L1_70 = L1_70(L2_71)
    L2_71 = _UPVALUE0_
    L2_71 = L2_71.NIL
  elseif L1_70 == L2_71 then
    L1_70 = _UPVALUE0_
    L1_70 = L1_70.INVALID_ARGUMENT
    return L1_70
  end
  L1_70 = db
  L1_70 = L1_70.existsRow
  L2_71 = modeconfigTable
  L1_70 = L1_70(L2_71, ROW_ID, A0_69)
  L2_71 = _UPVALUE0_
  L2_71 = L2_71.FALSE
  if L1_70 == L2_71 then
    L1_70 = _UPVALUE0_
    L1_70 = L1_70.INVALID_ARGUMENT
    return L1_70
  end
  L1_70 = db
  L1_70 = L1_70.getNextRowId
  L2_71 = A0_69
  L1_70 = L1_70(L2_71, modeconfigTable)
  L2_71 = _UPVALUE0_
  L2_71 = L2_71.NIL
  if L1_70 == L2_71 then
    L2_71 = _UPVALUE0_
    L2_71 = L2_71.NOT_EXIST
    return L2_71
  end
  L2_71 = db
  L2_71 = L2_71.getAttribute
  L2_71 = L2_71(modeconfigTable, ROW_ID, L1_70, _UPVALUE1_.WINSServerSecondaryIP)
  if L2_71 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_70
  end
  return _UPVALUE0_.SUCCESS, L1_70, L2_71
end
function WINSServerSecondaryIPSet(A0_72, A1_73)
  if A0_72 == _UPVALUE0_.NIL or tonumber(A0_72) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigTable, ROW_ID, A0_72) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_73 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck("2", A1_73)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigTable, ROW_ID, A0_72, _UPVALUE2_.WINSServerSecondaryIP, A1_73) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_72
  end
  return _UPVALUE0_.SUCCESS, A0_72
end
function DNSServerPrimaryIPGet()
  local L0_74, L1_75
  L0_74 = db
  L0_74 = L0_74.getNextRowId
  L1_75 = "0"
  L0_74 = L0_74(L1_75, modeconfigTable)
  L1_75 = db
  L1_75 = L1_75.getAttribute
  L1_75 = L1_75(modeconfigTable, ROW_ID, L0_74, _UPVALUE0_.DNSServerPrimaryIP)
  if L1_75 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_74, L1_75
end
function DNSServerPrimaryIPGetNext(A0_76)
  local L1_77, L2_78
  L1_77 = _UPVALUE0_
  L1_77 = L1_77.NIL
  if A0_76 ~= L1_77 then
    L1_77 = tonumber
    L2_78 = A0_76
    L1_77 = L1_77(L2_78)
    L2_78 = _UPVALUE0_
    L2_78 = L2_78.NIL
  elseif L1_77 == L2_78 then
    L1_77 = _UPVALUE0_
    L1_77 = L1_77.INVALID_ARGUMENT
    return L1_77
  end
  L1_77 = db
  L1_77 = L1_77.existsRow
  L2_78 = modeconfigTable
  L1_77 = L1_77(L2_78, ROW_ID, A0_76)
  L2_78 = _UPVALUE0_
  L2_78 = L2_78.FALSE
  if L1_77 == L2_78 then
    L1_77 = _UPVALUE0_
    L1_77 = L1_77.INVALID_ARGUMENT
    return L1_77
  end
  L1_77 = db
  L1_77 = L1_77.getNextRowId
  L2_78 = A0_76
  L1_77 = L1_77(L2_78, modeconfigTable)
  L2_78 = _UPVALUE0_
  L2_78 = L2_78.NIL
  if L1_77 == L2_78 then
    L2_78 = _UPVALUE0_
    L2_78 = L2_78.NOT_EXIST
    return L2_78
  end
  L2_78 = db
  L2_78 = L2_78.getAttribute
  L2_78 = L2_78(modeconfigTable, ROW_ID, L1_77, _UPVALUE1_.DNSServerPrimaryIP)
  if L2_78 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_77
  end
  return _UPVALUE0_.SUCCESS, L1_77, L2_78
end
function DNSServerPrimaryIPSet(A0_79, A1_80)
  if A0_79 == _UPVALUE0_.NIL or tonumber(A0_79) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigTable, ROW_ID, A0_79) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_80 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck("2", A1_80)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigTable, ROW_ID, A0_79, _UPVALUE2_.DNSServerPrimaryIP, A1_80) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_79
  end
  return _UPVALUE0_.SUCCESS, A0_79
end
function DNSServerSecondaryIPGet()
  local L0_81, L1_82
  L0_81 = db
  L0_81 = L0_81.getNextRowId
  L1_82 = "0"
  L0_81 = L0_81(L1_82, modeconfigTable)
  L1_82 = db
  L1_82 = L1_82.getAttribute
  L1_82 = L1_82(modeconfigTable, ROW_ID, L0_81, _UPVALUE0_.DNSServerSecondaryIP)
  if L1_82 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_81, L1_82
end
function DNSServerSecondaryIPGetNext(A0_83)
  local L1_84, L2_85
  L1_84 = _UPVALUE0_
  L1_84 = L1_84.NIL
  if A0_83 ~= L1_84 then
    L1_84 = tonumber
    L2_85 = A0_83
    L1_84 = L1_84(L2_85)
    L2_85 = _UPVALUE0_
    L2_85 = L2_85.NIL
  elseif L1_84 == L2_85 then
    L1_84 = _UPVALUE0_
    L1_84 = L1_84.INVALID_ARGUMENT
    return L1_84
  end
  L1_84 = db
  L1_84 = L1_84.existsRow
  L2_85 = modeconfigTable
  L1_84 = L1_84(L2_85, ROW_ID, A0_83)
  L2_85 = _UPVALUE0_
  L2_85 = L2_85.FALSE
  if L1_84 == L2_85 then
    L1_84 = _UPVALUE0_
    L1_84 = L1_84.INVALID_ARGUMENT
    return L1_84
  end
  L1_84 = db
  L1_84 = L1_84.getNextRowId
  L2_85 = A0_83
  L1_84 = L1_84(L2_85, modeconfigTable)
  L2_85 = _UPVALUE0_
  L2_85 = L2_85.NIL
  if L1_84 == L2_85 then
    L2_85 = _UPVALUE0_
    L2_85 = L2_85.NOT_EXIST
    return L2_85
  end
  L2_85 = db
  L2_85 = L2_85.getAttribute
  L2_85 = L2_85(modeconfigTable, ROW_ID, L1_84, _UPVALUE1_.DNSServerSecondaryIP)
  if L2_85 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_84
  end
  return _UPVALUE0_.SUCCESS, L1_84, L2_85
end
function DNSServerSecondaryIPSet(A0_86, A1_87)
  if A0_86 == _UPVALUE0_.NIL or tonumber(A0_86) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigTable, ROW_ID, A0_86) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_87 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.ipAddressCheck("2", A1_87)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(modeconfigTable, ROW_ID, A0_86, _UPVALUE2_.DNSServerSecondaryIP, A1_87) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_86
  end
  return _UPVALUE0_.SUCCESS, A0_86
end
function splitDNSDomainNameGet()
  local L0_88, L1_89
  L0_88 = db
  L0_88 = L0_88.getNextRowId
  L1_89 = "0"
  L0_88 = L0_88(L1_89, splitDnsTable)
  L1_89 = db
  L1_89 = L1_89.getAttribute
  L1_89 = L1_89(modeconfigTable, ROW_ID, L0_88, _UPVALUE0_.splitDNSDomainName)
  if L1_89 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_88, L1_89
end
function splitDNSDomainNameGetNext(A0_90)
  local L1_91, L2_92
  L1_91 = _UPVALUE0_
  L1_91 = L1_91.NIL
  if A0_90 ~= L1_91 then
    L1_91 = tonumber
    L2_92 = A0_90
    L1_91 = L1_91(L2_92)
    L2_92 = _UPVALUE0_
    L2_92 = L2_92.NIL
  elseif L1_91 == L2_92 then
    L1_91 = _UPVALUE0_
    L1_91 = L1_91.INVALID_ARGUMENT
    return L1_91
  end
  L1_91 = db
  L1_91 = L1_91.existsRow
  L2_92 = splitDnsTable
  L1_91 = L1_91(L2_92, ROW_ID, A0_90)
  L2_92 = _UPVALUE0_
  L2_92 = L2_92.FALSE
  if L1_91 == L2_92 then
    L1_91 = _UPVALUE0_
    L1_91 = L1_91.INVALID_ARGUMENT
    return L1_91
  end
  L1_91 = db
  L1_91 = L1_91.getNextRowId
  L2_92 = A0_90
  L1_91 = L1_91(L2_92, splitDnsTable)
  L2_92 = _UPVALUE0_
  L2_92 = L2_92.NIL
  if L1_91 == L2_92 then
    L2_92 = _UPVALUE0_
    L2_92 = L2_92.NOT_EXIST
    return L2_92
  end
  L2_92 = db
  L2_92 = L2_92.getAttribute
  L2_92 = L2_92(splitDnsTable, ROW_ID, L1_91, _UPVALUE1_.splitDNSDomainName)
  if L2_92 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_91
  end
  return _UPVALUE0_.SUCCESS, L1_91, L2_92
end
function splitDNSDomainNameSet(A0_93, A1_94)
  if A0_93 == _UPVALUE0_.NIL or tonumber(A0_93) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(splitDnsTable, ROW_ID, A0_93) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_94 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.fqdnCheck(A1_94)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(splitDnsTable, ROW_ID, A0_93, _UPVALUE2_.splitDNSDomainName, A1_94) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_93
  end
  return _UPVALUE0_.SUCCESS, A0_93
end
function splitDNSDomainNameDelete(A0_95, A1_96)
  if A0_95 == _UPVALUE0_.NIL or tonumber(A0_95) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(splitDnsTable, ROW_ID, A0_95) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.deleteRow(splitDnsTable, ROW_ID, A0_95) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_95
  end
  return _UPVALUE0_.SUCCESS, A0_95
end
function ipsecModeConfigGet()
  local L0_97, L1_98, L2_99, L3_100, L4_101, L5_102, L6_103, L7_104, L8_105, L9_106, L10_107, L11_108, L12_109, L13_110
  L0_97 = db
  L0_97 = L0_97.getNextRowId
  L1_98 = "0"
  L2_99 = modeconfigTable
  L0_97 = L0_97(L1_98, L2_99)
  L1_98 = db
  L1_98 = L1_98.getRow
  L2_99 = modeconfigTable
  L3_100 = ROW_ID
  L4_101 = L0_97
  L1_98 = L1_98(L2_99, L3_100, L4_101)
  L2_99, L3_100, L4_101, L5_102, L6_103, L7_104, L8_105, L9_106, L10_107, L11_108, L12_109, L13_110 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  if L1_98 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L2_99 = L1_98[modeconfigTable .. "." .. _UPVALUE1_.recordName]
  L3_100 = L1_98[modeconfigTable .. "." .. _UPVALUE1_.tunnelMode]
  L4_101 = L1_98[modeconfigTable .. "." .. _UPVALUE1_.firstPoolStartIP]
  L5_102 = L1_98[modeconfigTable .. "." .. _UPVALUE1_.firstPoolEndIP]
  L6_103 = L1_98[modeconfigTable .. "." .. _UPVALUE1_.secondPoolStartIP]
  L7_104 = L1_98[modeconfigTable .. "." .. _UPVALUE1_.secondPoolEndIP]
  L8_105 = L1_98[modeconfigTable .. "." .. _UPVALUE1_.thirdPoolStartIP]
  L9_106 = L1_98[modeconfigTable .. "." .. _UPVALUE1_.thirdPoolEndIP]
  L10_107 = L1_98[modeconfigTable .. "." .. _UPVALUE1_.WINSServerPrimaryIP]
  L11_108 = L1_98[modeconfigTable .. "." .. _UPVALUE1_.WINSServerSecondaryIP]
  L12_109 = L1_98[modeconfigTable .. "." .. _UPVALUE1_.DNSServerPrimaryIP]
  L13_110 = L1_98[modeconfigTable .. "." .. _UPVALUE1_.DNSServerSecondaryIP]
  return _UPVALUE0_.SUCCESS, L0_97, L2_99, L3_100, L4_101, L5_102, L6_103, L7_104, L8_105, L9_106, L10_107, L11_108, L12_109, L13_110
end
function ipsecModeConfigGetNext(A0_111)
  local L1_112, L2_113, L3_114, L4_115, L5_116, L6_117, L7_118, L8_119, L9_120, L10_121, L11_122, L12_123, L13_124, L14_125
  L1_112 = _UPVALUE0_
  L1_112 = L1_112.NIL
  if A0_111 ~= L1_112 then
    L1_112 = tonumber
    L2_113 = A0_111
    L1_112 = L1_112(L2_113)
    L2_113 = _UPVALUE0_
    L2_113 = L2_113.NIL
  elseif L1_112 == L2_113 then
    L1_112 = _UPVALUE0_
    L1_112 = L1_112.INVALID_ARGUMENT
    return L1_112
  end
  L1_112 = db
  L1_112 = L1_112.existsRow
  L2_113 = modeconfigTable
  L3_114 = ROW_ID
  L4_115 = A0_111
  L1_112 = L1_112(L2_113, L3_114, L4_115)
  L2_113 = _UPVALUE0_
  L2_113 = L2_113.FALSE
  if L1_112 == L2_113 then
    L1_112 = _UPVALUE0_
    L1_112 = L1_112.INVALID_ARGUMENT
    return L1_112
  end
  L1_112 = db
  L1_112 = L1_112.getNextRowId
  L2_113 = A0_111
  L3_114 = modeconfigTable
  L1_112 = L1_112(L2_113, L3_114)
  L2_113 = _UPVALUE0_
  L2_113 = L2_113.NIL
  if L1_112 == L2_113 then
    L2_113 = _UPVALUE0_
    L2_113 = L2_113.NOT_EXIST
    return L2_113
  end
  L2_113 = db
  L2_113 = L2_113.getRow
  L3_114 = modeconfigTable
  L4_115 = ROW_ID
  L5_116 = L1_112
  L2_113 = L2_113(L3_114, L4_115, L5_116)
  L3_114, L4_115, L5_116, L6_117, L7_118, L8_119, L9_120, L10_121, L11_122, L12_123, L13_124, L14_125 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  if L2_113 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L3_114 = L2_113[modeconfigTable .. "." .. _UPVALUE1_.recordName]
  L4_115 = L2_113[modeconfigTable .. "." .. _UPVALUE1_.tunnelMode]
  L5_116 = L2_113[modeconfigTable .. "." .. _UPVALUE1_.firstPoolStartIP]
  L6_117 = L2_113[modeconfigTable .. "." .. _UPVALUE1_.firstPoolEndIP]
  L7_118 = L2_113[modeconfigTable .. "." .. _UPVALUE1_.secondPoolStartIP]
  L8_119 = L2_113[modeconfigTable .. "." .. _UPVALUE1_.secondPoolEndIP]
  L9_120 = L2_113[modeconfigTable .. "." .. _UPVALUE1_.thirdPoolStartIP]
  L10_121 = L2_113[modeconfigTable .. "." .. _UPVALUE1_.thirdPoolEndIP]
  L11_122 = L2_113[modeconfigTable .. "." .. _UPVALUE1_.WINSServerPrimaryIP]
  L12_123 = L2_113[modeconfigTable .. "." .. _UPVALUE1_.WINSServerSecondaryIP]
  L13_124 = L2_113[modeconfigTable .. "." .. _UPVALUE1_.DNSServerPrimaryIP]
  L14_125 = L2_113[modeconfigTable .. "." .. _UPVALUE1_.DNSServerSecondaryIP]
  return _UPVALUE0_.SUCCESS, L1_112, L3_114, L4_115, L5_116, L6_117, L7_118, L8_119, L9_120, L10_121, L11_122, L12_123, L13_124, L14_125
end
function ipsecModeConfigSet(A0_126, A1_127, A2_128, A3_129, A4_130, A5_131, A6_132, A7_133, A8_134, A9_135, A10_136, A11_137, A12_138)
  local L13_139, L14_140, L15_141, L16_142, L17_143, L18_144
  L14_140 = _UPVALUE0_
  L14_140 = L14_140.NIL
  if A0_126 ~= L14_140 then
    L14_140 = tonumber
    L15_141 = A0_126
    L14_140 = L14_140(L15_141)
    L15_141 = _UPVALUE0_
    L15_141 = L15_141.NIL
  elseif L14_140 == L15_141 then
    L14_140 = _UPVALUE0_
    L14_140 = L14_140.INVALID_ARGUMENT
    return L14_140
  end
  L14_140 = db
  L14_140 = L14_140.existsRow
  L15_141 = modeconfigTable
  L16_142 = ROW_ID
  L17_143 = A0_126
  L14_140 = L14_140(L15_141, L16_142, L17_143)
  L15_141 = _UPVALUE0_
  L15_141 = L15_141.FALSE
  if L14_140 == L15_141 then
    L14_140 = _UPVALUE0_
    L14_140 = L14_140.INVALID_ARGUMENT
    return L14_140
  end
  L14_140 = {}
  L15_141 = _UPVALUE0_
  L15_141 = L15_141.NIL
  if A1_127 == L15_141 then
    L15_141 = _UPVALUE0_
    L15_141 = L15_141.INVALID_ARGUMENT
    return L15_141
  end
  L15_141 = modeconfigTable
  L16_142 = "."
  L17_143 = _UPVALUE1_
  L17_143 = L17_143.recordName
  L15_141 = L15_141 .. L16_142 .. L17_143
  L14_140[L15_141] = A1_127
  L15_141 = _UPVALUE0_
  L15_141 = L15_141.NIL
  if A2_128 == L15_141 then
    L15_141 = _UPVALUE0_
    L15_141 = L15_141.INVALID_ARGUMENT
    return L15_141
  end
  L15_141 = tonumber
  L16_142 = A2_128
  L15_141 = L15_141(L16_142)
  L16_142 = FULL_TUNNEL
  if L15_141 ~= L16_142 then
    L16_142 = SPLIT_TUNNEL
    if L15_141 ~= L16_142 then
      L16_142 = _UPVALUE0_
      L16_142 = L16_142.INVALID_ARGUMENT
      return L16_142
    end
  end
  L16_142 = modeconfigTable
  L17_143 = "."
  L18_144 = _UPVALUE1_
  L18_144 = L18_144.tunnelMode
  L16_142 = L16_142 .. L17_143 .. L18_144
  L14_140[L16_142] = A2_128
  L16_142 = _UPVALUE0_
  L16_142 = L16_142.NIL
  if A3_129 == L16_142 then
    L16_142 = _UPVALUE0_
    L16_142 = L16_142.INVALID_ARGUMENT
    return L16_142
  end
  L16_142 = _UPVALUE2_
  L16_142 = L16_142.ipAddressCheck
  L17_143 = "2"
  L18_144 = A3_129
  L16_142 = L16_142(L17_143, L18_144)
  L13_139 = L16_142
  L16_142 = _UPVALUE0_
  L16_142 = L16_142.SUCCESS
  if L13_139 ~= L16_142 then
    L16_142 = _UPVALUE3_
    L16_142 = L16_142.VIPSECURE_FIRSTPOOLSTARTIP_INVALID
    return L16_142
  end
  L16_142 = modeconfigTable
  L17_143 = "."
  L18_144 = _UPVALUE1_
  L18_144 = L18_144.firstPoolStartIP
  L16_142 = L16_142 .. L17_143 .. L18_144
  L14_140[L16_142] = A3_129
  L16_142 = _UPVALUE0_
  L16_142 = L16_142.NIL
  if A4_130 == L16_142 then
    L16_142 = _UPVALUE0_
    L16_142 = L16_142.INVALID_ARGUMENT
    return L16_142
  end
  L16_142 = _UPVALUE2_
  L16_142 = L16_142.ipAddressCheck
  L17_143 = "2"
  L18_144 = A4_130
  L16_142 = L16_142(L17_143, L18_144)
  L13_139 = L16_142
  L16_142 = _UPVALUE0_
  L16_142 = L16_142.SUCCESS
  if L13_139 ~= L16_142 then
    L16_142 = _UPVALUE3_
    L16_142 = L16_142.VIPSECURE_FIRSTPOOLENDIP_INVALID
    return L16_142
  end
  L16_142 = modeconfigTable
  L17_143 = "."
  L18_144 = _UPVALUE1_
  L18_144 = L18_144.firstPoolEndIP
  L16_142 = L16_142 .. L17_143 .. L18_144
  L14_140[L16_142] = A4_130
  L16_142 = _UPVALUE0_
  L16_142 = L16_142.NIL
  if A5_131 == L16_142 then
    L16_142 = _UPVALUE0_
    L16_142 = L16_142.INVALID_ARGUMENT
    return L16_142
  end
  L16_142 = _UPVALUE2_
  L16_142 = L16_142.ipAddressCheck
  L17_143 = "2"
  L18_144 = A5_131
  L16_142 = L16_142(L17_143, L18_144)
  L13_139 = L16_142
  L16_142 = _UPVALUE0_
  L16_142 = L16_142.SUCCESS
  if L13_139 ~= L16_142 then
    L16_142 = _UPVALUE3_
    L16_142 = L16_142.VIPSECURE_SECONDPOOLSTARTIP_INVALID
    return L16_142
  end
  L16_142 = modeconfigTable
  L17_143 = "."
  L18_144 = _UPVALUE1_
  L18_144 = L18_144.secondPoolStartIP
  L16_142 = L16_142 .. L17_143 .. L18_144
  L14_140[L16_142] = A5_131
  L16_142 = _UPVALUE0_
  L16_142 = L16_142.NIL
  if A6_132 == L16_142 then
    L16_142 = _UPVALUE0_
    L16_142 = L16_142.INVALID_ARGUMENT
    return L16_142
  end
  L16_142 = _UPVALUE2_
  L16_142 = L16_142.ipAddressCheck
  L17_143 = "2"
  L18_144 = A6_132
  L16_142 = L16_142(L17_143, L18_144)
  L13_139 = L16_142
  L16_142 = _UPVALUE0_
  L16_142 = L16_142.SUCCESS
  if L13_139 ~= L16_142 then
    L16_142 = _UPVALUE3_
    L16_142 = L16_142.VIPSECURE_SECONDPOOLENDIP_INVALID
    return L16_142
  end
  L16_142 = modeconfigTable
  L17_143 = "."
  L18_144 = _UPVALUE1_
  L18_144 = L18_144.secondPoolEndIP
  L16_142 = L16_142 .. L17_143 .. L18_144
  L14_140[L16_142] = A6_132
  L16_142 = _UPVALUE0_
  L16_142 = L16_142.NIL
  if A7_133 == L16_142 then
    L16_142 = _UPVALUE0_
    L16_142 = L16_142.INVALID_ARGUMENT
    return L16_142
  end
  L16_142 = _UPVALUE2_
  L16_142 = L16_142.ipAddressCheck
  L17_143 = "2"
  L18_144 = A7_133
  L16_142 = L16_142(L17_143, L18_144)
  L13_139 = L16_142
  L16_142 = _UPVALUE0_
  L16_142 = L16_142.SUCCESS
  if L13_139 ~= L16_142 then
    L16_142 = _UPVALUE3_
    L16_142 = L16_142.VIPSECURE_THIRDPOOLSTARTIP_INVALID
    return L16_142
  end
  L16_142 = modeconfigTable
  L17_143 = "."
  L18_144 = _UPVALUE1_
  L18_144 = L18_144.thirdPoolStartIP
  L16_142 = L16_142 .. L17_143 .. L18_144
  L14_140[L16_142] = A7_133
  L16_142 = _UPVALUE0_
  L16_142 = L16_142.NIL
  if A8_134 == L16_142 then
    L16_142 = _UPVALUE0_
    L16_142 = L16_142.INVALID_ARGUMENT
    return L16_142
  end
  L16_142 = _UPVALUE2_
  L16_142 = L16_142.ipAddressCheck
  L17_143 = "2"
  L18_144 = A8_134
  L16_142 = L16_142(L17_143, L18_144)
  L13_139 = L16_142
  L16_142 = _UPVALUE0_
  L16_142 = L16_142.SUCCESS
  if L13_139 ~= L16_142 then
    L16_142 = _UPVALUE3_
    L16_142 = L16_142.VIPSECURE_THIRDPOOLENDIP_INVALID
    return L16_142
  end
  L16_142 = modeconfigTable
  L17_143 = "."
  L18_144 = _UPVALUE1_
  L18_144 = L18_144.thirdPoolEndIP
  L16_142 = L16_142 .. L17_143 .. L18_144
  L14_140[L16_142] = A8_134
  L16_142 = _UPVALUE0_
  L16_142 = L16_142.NIL
  if A9_135 ~= L16_142 then
    L16_142 = _UPVALUE2_
    L16_142 = L16_142.ipAddressCheck
    L17_143 = "2"
    L18_144 = A9_135
    L16_142 = L16_142(L17_143, L18_144)
    L13_139 = L16_142
    L16_142 = _UPVALUE0_
    L16_142 = L16_142.SUCCESS
    if L13_139 ~= L16_142 then
      L16_142 = _UPVALUE3_
      L16_142 = L16_142.VIPSECURE_WINSSERVER_PRIMARYIP_INVALID
      return L16_142
    end
    L16_142 = modeconfigTable
    L17_143 = "."
    L18_144 = _UPVALUE1_
    L18_144 = L18_144.WINSServerPrimaryIP
    L16_142 = L16_142 .. L17_143 .. L18_144
    L14_140[L16_142] = A9_135
  end
  L16_142 = _UPVALUE0_
  L16_142 = L16_142.NIL
  if A10_136 ~= L16_142 then
    L16_142 = _UPVALUE2_
    L16_142 = L16_142.ipAddressCheck
    L17_143 = "2"
    L18_144 = A10_136
    L16_142 = L16_142(L17_143, L18_144)
    L13_139 = L16_142
    L16_142 = _UPVALUE0_
    L16_142 = L16_142.SUCCESS
    if L13_139 ~= L16_142 then
      L16_142 = _UPVALUE3_
      L16_142 = L16_142.VIPSECURE_WINSSERVER_SECONDARYIP_INVALID
      return L16_142
    end
    L16_142 = modeconfigTable
    L17_143 = "."
    L18_144 = _UPVALUE1_
    L18_144 = L18_144.WINSServerSecondaryIP
    L16_142 = L16_142 .. L17_143 .. L18_144
    L14_140[L16_142] = A10_136
  end
  L16_142 = _UPVALUE0_
  L16_142 = L16_142.NIL
  if A11_137 ~= L16_142 then
    L16_142 = _UPVALUE2_
    L16_142 = L16_142.ipAddressCheck
    L17_143 = "2"
    L18_144 = A11_137
    L16_142 = L16_142(L17_143, L18_144)
    L13_139 = L16_142
    L16_142 = _UPVALUE0_
    L16_142 = L16_142.SUCCESS
    if L13_139 ~= L16_142 then
      L16_142 = _UPVALUE3_
      L16_142 = L16_142.VIPSECURE_DNSSERVER_PRIMARYIP_INVALID
      return L16_142
    end
    L16_142 = modeconfigTable
    L17_143 = "."
    L18_144 = _UPVALUE1_
    L18_144 = L18_144.DNSServerPrimaryIP
    L16_142 = L16_142 .. L17_143 .. L18_144
    L14_140[L16_142] = A11_137
  end
  L16_142 = _UPVALUE0_
  L16_142 = L16_142.NIL
  if A12_138 ~= L16_142 then
    L16_142 = _UPVALUE2_
    L16_142 = L16_142.ipAddressCheck
    L17_143 = "2"
    L18_144 = A12_138
    L16_142 = L16_142(L17_143, L18_144)
    L13_139 = L16_142
    L16_142 = _UPVALUE0_
    L16_142 = L16_142.SUCCESS
    if L13_139 ~= L16_142 then
      L16_142 = _UPVALUE3_
      L16_142 = L16_142.VIPSECURE_DNSSERVER_SECONDRYIP_INVALID
      return L16_142
    end
    L16_142 = modeconfigTable
    L17_143 = "."
    L18_144 = _UPVALUE1_
    L18_144 = L18_144.DNSServerSecondaryIP
    L16_142 = L16_142 .. L17_143 .. L18_144
    L14_140[L16_142] = A12_138
  end
  L16_142 = "255.255.255.0"
  L17_143 = _UPVALUE2_
  L17_143 = L17_143.ipv4SingleMaskCheck
  L18_144 = A3_129
  L17_143 = L17_143(L18_144, A4_130, L16_142)
  L18_144 = _UPVALUE0_
  L18_144 = L18_144.SUCCESS
  if L17_143 ~= L18_144 then
    L18_144 = _UPVALUE3_
    L18_144 = L18_144.STARTIP_ENDIP_IN_SAME_SUBNET
    return L18_144
  end
  L18_144 = staticIpSubnetCheck
  L18_144 = L18_144(A3_129, L16_142)
  if L18_144 ~= _UPVALUE0_.SUCCESS then
    return L18_144
  end
  L18_144 = staticIpSubnetCheck(A4_130, L16_142)
  if L18_144 ~= _UPVALUE0_.SUCCESS then
    return L18_144
  end
  if db.update(modeconfigTable, L14_140, A0_126) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_126
  end
  return _UPVALUE0_.SUCCESS, A0_126
end
function ipsecModeConfigCreate(A0_145, A1_146, A2_147, A3_148, A4_149, A5_150, A6_151, A7_152, A8_153, A9_154, A10_155, A11_156)
  local L12_157, L13_158, L14_159, L15_160
  L12_157 = {}
  L13_158 = _UPVALUE0_
  L13_158 = L13_158.NIL
  if A0_145 == L13_158 then
    L13_158 = _UPVALUE0_
    L13_158 = L13_158.INVALID_ARGUMENT
    return L13_158
  end
  L13_158 = modeconfigTable
  L14_159 = "."
  L15_160 = _UPVALUE1_
  L15_160 = L15_160.recordName
  L13_158 = L13_158 .. L14_159 .. L15_160
  L12_157[L13_158] = A0_145
  L13_158 = _UPVALUE0_
  L13_158 = L13_158.NIL
  if A1_146 == L13_158 then
    L13_158 = _UPVALUE0_
    L13_158 = L13_158.INVALID_ARGUMENT
    return L13_158
  end
  L13_158 = tonumber
  L14_159 = A1_146
  L13_158 = L13_158(L14_159)
  if L13_158 ~= 0 and L13_158 ~= 1 then
    L14_159 = _UPVALUE0_
    L14_159 = L14_159.INVALID_ARGUMENT
    return L14_159
  end
  L14_159 = modeconfigTable
  L15_160 = "."
  L14_159 = L14_159 .. L15_160 .. _UPVALUE1_.tunnelMode
  L12_157[L14_159] = A1_146
  L14_159 = _UPVALUE0_
  L14_159 = L14_159.NIL
  if A2_147 == L14_159 then
    L14_159 = _UPVALUE0_
    L14_159 = L14_159.INVALID_ARGUMENT
    return L14_159
  end
  L14_159 = _UPVALUE2_
  L14_159 = L14_159.ipAddressCheck
  L15_160 = "2"
  L14_159 = L14_159(L15_160, A2_147)
  valid = L14_159
  L14_159 = valid
  L15_160 = _UPVALUE0_
  L15_160 = L15_160.SUCCESS
  if L14_159 ~= L15_160 then
    L14_159 = _UPVALUE3_
    L14_159 = L14_159.VIPSECURE_FIRSTPOOLSTARTIP_INVALID
    return L14_159
  end
  L14_159 = modeconfigTable
  L15_160 = "."
  L14_159 = L14_159 .. L15_160 .. _UPVALUE1_.firstPoolStartIP
  L12_157[L14_159] = A2_147
  L14_159 = _UPVALUE0_
  L14_159 = L14_159.NIL
  if A3_148 == L14_159 then
    L14_159 = _UPVALUE0_
    L14_159 = L14_159.INVALID_ARGUMENT
    return L14_159
  end
  L14_159 = _UPVALUE2_
  L14_159 = L14_159.ipAddressCheck
  L15_160 = "2"
  L14_159 = L14_159(L15_160, A3_148)
  valid = L14_159
  L14_159 = valid
  L15_160 = _UPVALUE0_
  L15_160 = L15_160.SUCCESS
  if L14_159 ~= L15_160 then
    L14_159 = _UPVALUE3_
    L14_159 = L14_159.VIPSECURE_FIRSTPOOLENDIP_INVALID
    return L14_159
  end
  L14_159 = modeconfigTable
  L15_160 = "."
  L14_159 = L14_159 .. L15_160 .. _UPVALUE1_.firstPoolEndIP
  L12_157[L14_159] = A3_148
  L14_159 = _UPVALUE0_
  L14_159 = L14_159.NIL
  if A4_149 == L14_159 then
    L14_159 = _UPVALUE0_
    L14_159 = L14_159.INVALID_ARGUMENT
    return L14_159
  end
  L14_159 = _UPVALUE2_
  L14_159 = L14_159.ipAddressCheck
  L15_160 = "2"
  L14_159 = L14_159(L15_160, A4_149)
  valid = L14_159
  L14_159 = valid
  L15_160 = _UPVALUE0_
  L15_160 = L15_160.SUCCESS
  if L14_159 ~= L15_160 then
    L14_159 = _UPVALUE3_
    L14_159 = L14_159.VIPSECURE_SECONDPOOLSTARTIP_INVALID
    return L14_159
  end
  L14_159 = modeconfigTable
  L15_160 = "."
  L14_159 = L14_159 .. L15_160 .. _UPVALUE1_.secondPoolStartIP
  L12_157[L14_159] = A4_149
  L14_159 = _UPVALUE0_
  L14_159 = L14_159.NIL
  if A5_150 == L14_159 then
    L14_159 = _UPVALUE0_
    L14_159 = L14_159.INVALID_ARGUMENT
    return L14_159
  end
  L14_159 = _UPVALUE2_
  L14_159 = L14_159.ipAddressCheck
  L15_160 = "2"
  L14_159 = L14_159(L15_160, A5_150)
  valid = L14_159
  L14_159 = valid
  L15_160 = _UPVALUE0_
  L15_160 = L15_160.SUCCESS
  if L14_159 ~= L15_160 then
    L14_159 = _UPVALUE3_
    L14_159 = L14_159.VIPSECURE_SECONDPOOLENDIP_INVALID
    return L14_159
  end
  L14_159 = modeconfigTable
  L15_160 = "."
  L14_159 = L14_159 .. L15_160 .. _UPVALUE1_.secondPoolEndIP
  L12_157[L14_159] = A5_150
  L14_159 = _UPVALUE0_
  L14_159 = L14_159.NIL
  if A6_151 == L14_159 then
    L14_159 = _UPVALUE0_
    L14_159 = L14_159.INVALID_ARGUMENT
    return L14_159
  end
  L14_159 = _UPVALUE2_
  L14_159 = L14_159.ipAddressCheck
  L15_160 = "2"
  L14_159 = L14_159(L15_160, A6_151)
  valid = L14_159
  L14_159 = valid
  L15_160 = _UPVALUE0_
  L15_160 = L15_160.SUCCESS
  if L14_159 ~= L15_160 then
    L14_159 = _UPVALUE3_
    L14_159 = L14_159.VIPSECURE_THIRDPOOLSTARTIP_INVALID
    return L14_159
  end
  L14_159 = modeconfigTable
  L15_160 = "."
  L14_159 = L14_159 .. L15_160 .. _UPVALUE1_.thirdPoolStartIP
  L12_157[L14_159] = A6_151
  L14_159 = _UPVALUE0_
  L14_159 = L14_159.NIL
  if A7_152 == L14_159 then
    L14_159 = _UPVALUE0_
    L14_159 = L14_159.INVALID_ARGUMENT
    return L14_159
  end
  L14_159 = _UPVALUE2_
  L14_159 = L14_159.ipAddressCheck
  L15_160 = "2"
  L14_159 = L14_159(L15_160, A7_152)
  valid = L14_159
  L14_159 = valid
  L15_160 = _UPVALUE0_
  L15_160 = L15_160.SUCCESS
  if L14_159 ~= L15_160 then
    L14_159 = _UPVALUE3_
    L14_159 = L14_159.VIPSECURE_THIRDPOOLENDIP_INVALID
    return L14_159
  end
  L14_159 = modeconfigTable
  L15_160 = "."
  L14_159 = L14_159 .. L15_160 .. _UPVALUE1_.thirdPoolEndIP
  L12_157[L14_159] = A7_152
  L14_159 = _UPVALUE0_
  L14_159 = L14_159.NIL
  if A8_153 == L14_159 then
    L14_159 = _UPVALUE0_
    L14_159 = L14_159.INVALID_ARGUMENT
    return L14_159
  end
  L14_159 = _UPVALUE2_
  L14_159 = L14_159.ipAddressCheck
  L15_160 = "2"
  L14_159 = L14_159(L15_160, A8_153)
  valid = L14_159
  L14_159 = valid
  L15_160 = _UPVALUE0_
  L15_160 = L15_160.SUCCESS
  if L14_159 ~= L15_160 then
    L14_159 = _UPVALUE3_
    L14_159 = L14_159.VIPSECURE_WINSSERVER_PRIMARYIP_INVALID
    return L14_159
  end
  L14_159 = modeconfigTable
  L15_160 = "."
  L14_159 = L14_159 .. L15_160 .. _UPVALUE1_.WINSServerPrimaryIP
  L12_157[L14_159] = A8_153
  L14_159 = _UPVALUE0_
  L14_159 = L14_159.NIL
  if A9_154 == L14_159 then
    L14_159 = _UPVALUE0_
    L14_159 = L14_159.INVALID_ARGUMENT
    return L14_159
  end
  L14_159 = _UPVALUE2_
  L14_159 = L14_159.ipAddressCheck
  L15_160 = "2"
  L14_159 = L14_159(L15_160, A9_154)
  valid = L14_159
  L14_159 = valid
  L15_160 = _UPVALUE0_
  L15_160 = L15_160.SUCCESS
  if L14_159 ~= L15_160 then
    L14_159 = _UPVALUE3_
    L14_159 = L14_159.VIPSECURE_WINSSERVER_SECONDARYIP_INVALID
    return L14_159
  end
  L14_159 = modeconfigTable
  L15_160 = "."
  L14_159 = L14_159 .. L15_160 .. _UPVALUE1_.WINSServerSecondaryIP
  L12_157[L14_159] = A9_154
  L14_159 = _UPVALUE0_
  L14_159 = L14_159.NIL
  if A10_155 == L14_159 then
    L14_159 = _UPVALUE0_
    L14_159 = L14_159.INVALID_ARGUMENT
    return L14_159
  end
  L14_159 = _UPVALUE2_
  L14_159 = L14_159.ipAddressCheck
  L15_160 = "2"
  L14_159 = L14_159(L15_160, A10_155)
  valid = L14_159
  L14_159 = valid
  L15_160 = _UPVALUE0_
  L15_160 = L15_160.SUCCESS
  if L14_159 ~= L15_160 then
    L14_159 = _UPVALUE3_
    L14_159 = L14_159.VIPSECURE_DNSSERVER_PRIMARYIP_INVALID
    return L14_159
  end
  L14_159 = modeconfigTable
  L15_160 = "."
  L14_159 = L14_159 .. L15_160 .. _UPVALUE1_.DNSServerPrimaryIP
  L12_157[L14_159] = A10_155
  L14_159 = _UPVALUE0_
  L14_159 = L14_159.NIL
  if A11_156 == L14_159 then
    L14_159 = _UPVALUE0_
    L14_159 = L14_159.INVALID_ARGUMENT
    return L14_159
  end
  L14_159 = _UPVALUE2_
  L14_159 = L14_159.ipAddressCheck
  L15_160 = "2"
  L14_159 = L14_159(L15_160, A11_156)
  valid = L14_159
  L14_159 = valid
  L15_160 = _UPVALUE0_
  L15_160 = L15_160.SUCCESS
  if L14_159 ~= L15_160 then
    L14_159 = _UPVALUE3_
    L14_159 = L14_159.VIPSECURE_DNSSERVER_SECONDRYIP_INVALID
    return L14_159
  end
  L14_159 = modeconfigTable
  L15_160 = "."
  L14_159 = L14_159 .. L15_160 .. _UPVALUE1_.DNSServerSecondaryIP
  L12_157[L14_159] = A11_156
  L14_159 = db
  L14_159 = L14_159.insert
  L15_160 = modeconfigTable
  L14_159 = L14_159(L15_160, L12_157)
  L15_160 = _UPVALUE0_
  L15_160 = L15_160.NIL
  if L14_159 == L15_160 then
    L15_160 = _UPVALUE0_
    L15_160 = L15_160.FAILURE
    return L15_160
  end
  L15_160 = db
  L15_160 = L15_160.getAttribute
  L15_160 = L15_160(modeconfigTable, _UPVALUE1_.recordName, A0_145, ROW_ID)
  return _UPVALUE0_.SUCCESS, L15_160
end
function ipsecModeConfigDelete(A0_161)
  if A0_161 == _UPVALUE0_.NIL or tonumber(A0_161) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(modeconfigTable, ROW_ID, A0_161) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.deleteRow(modeconfigTable, ROW_ID, A0_161) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_161
  end
  return _UPVALUE0_.SUCCESS, A0_161
end
function splitDnsGet()
  local L0_162, L1_163
  L0_162 = db
  L0_162 = L0_162.getNextRowId
  L1_163 = "0"
  L0_162 = L0_162(L1_163, splitDnsTable)
  L1_163 = db
  L1_163 = L1_163.getAttribute
  L1_163 = L1_163(splitDnsTable, ROW_ID, L0_162, _UPVALUE0_.splitDNSDomainName)
  if L1_163 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_162, L1_163
end
function splitDnsGetNext(A0_164)
  local L1_165, L2_166
  L1_165 = _UPVALUE0_
  L1_165 = L1_165.NIL
  if A0_164 ~= L1_165 then
    L1_165 = tonumber
    L2_166 = A0_164
    L1_165 = L1_165(L2_166)
    L2_166 = _UPVALUE0_
    L2_166 = L2_166.NIL
  elseif L1_165 == L2_166 then
    L1_165 = _UPVALUE0_
    L1_165 = L1_165.INVALID_ARGUMENT
    return L1_165
  end
  L1_165 = db
  L1_165 = L1_165.existsRow
  L2_166 = splitDnsTable
  L1_165 = L1_165(L2_166, ROW_ID, A0_164)
  L2_166 = _UPVALUE0_
  L2_166 = L2_166.FALSE
  if L1_165 == L2_166 then
    L1_165 = _UPVALUE0_
    L1_165 = L1_165.INVALID_ARGUMENT
    return L1_165
  end
  L1_165 = db
  L1_165 = L1_165.getNextRowId
  L2_166 = A0_164
  L1_165 = L1_165(L2_166, splitDnsTable)
  L2_166 = _UPVALUE0_
  L2_166 = L2_166.NIL
  if L1_165 == L2_166 then
    L2_166 = _UPVALUE0_
    L2_166 = L2_166.NOT_EXIST
    return L2_166
  end
  L2_166 = db
  L2_166 = L2_166.getAttribute
  L2_166 = L2_166(splitDnsTable, ROW_ID, L1_165, _UPVALUE1_.splitDNSDomainName)
  if L2_166 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_165
  end
  return _UPVALUE0_.SUCCESS, L1_165, L2_166
end
function splitDnsSet(A0_167, A1_168)
  if A0_167 == _UPVALUE0_.NIL or tonumber(A0_167) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(splitDnsTable, ROW_ID, A0_167) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_168 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.fqdnCheck(A1_168)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(splitDnsTable, ROW_ID, A0_167, _UPVALUE2_.splitDNSDomainName, A1_168) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_167
  end
  return _UPVALUE0_.SUCCESS, A0_167
end
function splitDnsCreate(A0_169)
  local L1_170, L2_171, L3_172, L4_173, L5_174, L6_175, L7_176
  L1_170 = tunnelModeGet
  L3_172 = L1_170()
  if L3_172 ~= "1" then
    L4_173 = _UPVALUE0_
    L4_173 = L4_173.ENABLE_MODECONFIG_IN_SPLITTUNNEL
    return L4_173
  end
  L4_173 = db
  L4_173 = L4_173.existsRow
  L5_174 = splitDnsTable
  L6_175 = _UPVALUE1_
  L6_175 = L6_175.splitDNSDomainName
  L7_176 = A0_169
  L4_173 = L4_173(L5_174, L6_175, L7_176)
  L5_174 = _UPVALUE2_
  L5_174 = L5_174.FALSE
  if L4_173 ~= L5_174 then
    L4_173 = _UPVALUE0_
    L4_173 = L4_173.SPLITDNS_ALREADY_EXIST
    return L4_173
  end
  L4_173 = nil
  L5_174 = {}
  L6_175 = _UPVALUE2_
  L6_175 = L6_175.NIL
  if A0_169 == L6_175 then
    L6_175 = _UPVALUE2_
    L6_175 = L6_175.INVALID_ARGUMENT
    return L6_175
  end
  L6_175 = _UPVALUE3_
  L6_175 = L6_175.fqdnCheck
  L7_176 = A0_169
  L6_175 = L6_175(L7_176)
  L4_173 = L6_175
  L6_175 = _UPVALUE2_
  L6_175 = L6_175.SUCCESS
  if L4_173 ~= L6_175 then
    L6_175 = _UPVALUE2_
    L6_175 = L6_175.INVALID_ARGUMENT
    return L6_175
  end
  L6_175 = splitDnsTable
  L7_176 = "."
  L6_175 = L6_175 .. L7_176 .. _UPVALUE1_.splitDNSDomainName
  L5_174[L6_175] = A0_169
  L6_175 = db
  L6_175 = L6_175.insert
  L7_176 = splitDnsTable
  L6_175 = L6_175(L7_176, L5_174)
  L7_176 = _UPVALUE2_
  L7_176 = L7_176.NIL
  if L6_175 == L7_176 then
    L7_176 = _UPVALUE2_
    L7_176 = L7_176.FAILURE
    return L7_176
  end
  L7_176 = db
  L7_176 = L7_176.getAttribute
  L7_176 = L7_176(splitDnsTable, _UPVALUE1_.splitDNSDomainName, A0_169, ROW_ID)
  return _UPVALUE2_.SUCCESS, L7_176
end
function splitDnsDelete(A0_177)
  if A0_177 == _UPVALUE0_.NIL or tonumber(A0_177) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(splitDnsTable, ROW_ID, A0_177) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.deleteRow(splitDnsTable, ROW_ID, A0_177) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_177
  end
  return _UPVALUE0_.SUCCESS, A0_177
end
function splitDnsGetAll()
  local L0_178, L1_179, L2_180, L3_181
  L0_178 = tunnelModeGet
  L2_180 = L0_178()
  if L2_180 ~= "1" then
    L3_181 = _UPVALUE0_
    L3_181 = L3_181.ENABLE_MODECONFIG_IN_SPLITTUNNEL
    return L3_181
  end
  L3_181 = {}
  L3_181 = db.getTable(splitDnsTable, false)
  if L3_181 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L3_181
end
function splitDnsDeleteAll()
  local L0_182
  L0_182 = {}
  L0_182 = db.deleteAllRows(splitDnsTable)
  if not L0_182 then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function splitDnsGetCur(A0_183)
  local L1_184, L2_185
  L2_185 = db.getAttribute(splitDnsTable, ROW_ID, A0_183, _UPVALUE0_.splitDNSDomainName)
  if L2_185 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L2_185
end
function staticIpSubnetCheck(A0_186, A1_187)
  local L2_188, L3_189, L4_190, L5_191, L6_192, L7_193, L8_194, L9_195, L10_196, L11_197, L12_198, L13_199, L14_200, L15_201, L16_202, L17_203, L18_204
  L12_198 = _UPVALUE0_
  L13_199 = _UPVALUE1_
  L13_199 = L13_199.vlanGet
  L14_200 = L12_198
  L7_193, L9_195, L10_196, L11_197, L13_199 = nil, nil, nil, nil, L13_199(L14_200)
  L7_193, L9_195, L10_196, L11_197, L14_200 = nil, nil, nil, nil, L13_199(L14_200)
  L7_193, L9_195, L10_196, L11_197, L15_201 = nil, nil, nil, nil, L13_199(L14_200)
  L7_193, L9_195, L10_196, L11_197, L16_202 = nil, nil, nil, nil, L13_199(L14_200)
  L7_193, L9_195, L10_196, L11_197, L17_203 = nil, nil, nil, nil, L13_199(L14_200)
  L7_193, L9_195, L10_196, L11_197, L18_204 = nil, nil, nil, nil, L13_199(L14_200)
  L3_189 = L18_204
  L6_192 = L17_203
  L5_191 = L16_202
  L4_190 = L15_201
  L8_194 = L14_200
  L2_188 = L13_199
  L13_199 = _UPVALUE2_
  L13_199 = L13_199.SUCCESS
  if L2_188 ~= L13_199 then
    L13_199 = _UPVALUE3_
    L13_199 = L13_199.SUBNET_CHECK_FAILED
    return L13_199
  end
  L13_199 = _UPVALUE4_
  L13_199 = L13_199.ipv4DualMaskCheck
  L14_200 = L3_189
  L15_201 = L7_193
  L16_202 = A0_186
  L17_203 = A1_187
  L13_199 = L13_199(L14_200, L15_201, L16_202, L17_203)
  L2_188 = L13_199
  L13_199 = _UPVALUE2_
  L13_199 = L13_199.SUCCESS
  if L2_188 == L13_199 then
    L13_199 = _UPVALUE3_
    L13_199 = L13_199.SAME_SUBNET_LAN
    return L13_199
  end
  L13_199 = _UPVALUE1_
  L13_199 = L13_199.vlanGetNext
  L14_200 = L8_194
  L7_193, L9_195, L10_196, L11_197, L18_204 = L13_199(L14_200)
  L3_189 = L18_204
  L6_192 = L17_203
  L5_191 = L16_202
  L4_190 = L15_201
  L8_194 = L14_200
  L2_188 = L13_199
  while true do
    L13_199 = _UPVALUE2_
    L13_199 = L13_199.NEXT_ROWID_INVALID
    if L2_188 ~= L13_199 then
      L13_199 = _UPVALUE2_
      L13_199 = L13_199.SUCCESS
      if L2_188 ~= L13_199 then
        L13_199 = _UPVALUE3_
        L13_199 = L13_199.SUBNET_CHECK_FAILED
        return L13_199
      end
      L13_199 = _UPVALUE4_
      L13_199 = L13_199.ipv4DualMaskCheck
      L14_200 = L3_189
      L15_201 = L7_193
      L16_202 = A0_186
      L17_203 = A1_187
      L13_199 = L13_199(L14_200, L15_201, L16_202, L17_203)
      L2_188 = L13_199
      L13_199 = _UPVALUE2_
      L13_199 = L13_199.SUCCESS
      if L2_188 == L13_199 then
        L13_199 = _UPVALUE3_
        L13_199 = L13_199.SAME_SUBNET_VLAN
        return L13_199
      end
      L13_199 = _UPVALUE1_
      L13_199 = L13_199.vlanGetNext
      L14_200 = L8_194
      L7_193, L9_195, L10_196, L11_197, L18_204 = L13_199(L14_200)
      L3_189 = L18_204
      L6_192 = L17_203
      L5_191 = L16_202
      L4_190 = L15_201
      L8_194 = L14_200
      L2_188 = L13_199
    end
  end
  L13_199 = db
  L13_199 = L13_199.getAttribute
  L14_200 = _UPVALUE5_
  L15_201 = _UPVALUE6_
  L15_201 = L15_201.dmz_interface
  L16_202 = _UPVALUE7_
  L17_203 = _UPVALUE6_
  L17_203 = L17_203.dmz_ip
  L13_199 = L13_199(L14_200, L15_201, L16_202, L17_203)
  L14_200 = db
  L14_200 = L14_200.getAttribute
  L15_201 = _UPVALUE5_
  L16_202 = _UPVALUE6_
  L16_202 = L16_202.dmz_interface
  L17_203 = _UPVALUE7_
  L18_204 = _UPVALUE6_
  L18_204 = L18_204.dmz_netmask
  L14_200 = L14_200(L15_201, L16_202, L17_203, L18_204)
  L15_201 = _UPVALUE2_
  L15_201 = L15_201.NIL
  if L13_199 ~= L15_201 then
    L15_201 = _UPVALUE8_
    if L13_199 ~= L15_201 then
      L15_201 = _UPVALUE2_
      L15_201 = L15_201.NIL
      if L14_200 ~= L15_201 then
        L15_201 = _UPVALUE8_
        if L14_200 ~= L15_201 then
          L15_201 = _UPVALUE4_
          L15_201 = L15_201.ipv4DualMaskCheck
          L16_202 = L13_199
          L17_203 = L14_200
          L18_204 = A0_186
          L15_201 = L15_201(L16_202, L17_203, L18_204, A1_187)
          L2_188 = L15_201
          L15_201 = _UPVALUE2_
          L15_201 = L15_201.SUCCESS
          if L2_188 == L15_201 then
            L15_201 = _UPVALUE3_
            L15_201 = L15_201.SAME_SUBNET_DMZ
            return L15_201
          end
        end
      end
    end
  end
  L15_201 = _UPVALUE4_
  L15_201 = L15_201.ipv4DualMaskCheck
  L16_202 = _UPVALUE9_
  L17_203 = _UPVALUE10_
  L18_204 = A0_186
  L15_201 = L15_201(L16_202, L17_203, L18_204, A1_187)
  L2_188 = L15_201
  L15_201 = _UPVALUE2_
  L15_201 = L15_201.SUCCESS
  if L2_188 == L15_201 then
    L15_201 = _UPVALUE3_
    L15_201 = L15_201.SAME_SUBNET_LOCAL_IP
    return L15_201
  end
  L15_201 = db
  L15_201 = L15_201.getAttribute
  L16_202 = _UPVALUE11_
  L17_203 = ROW_ID
  L18_204 = _UPVALUE0_
  L15_201 = L15_201(L16_202, L17_203, L18_204, _UPVALUE6_.pptp_ip)
  L16_202 = _UPVALUE12_
  L17_203 = _UPVALUE2_
  L17_203 = L17_203.NIL
  if L15_201 ~= L17_203 then
    L17_203 = _UPVALUE8_
    if L15_201 ~= L17_203 then
      L17_203 = _UPVALUE4_
      L17_203 = L17_203.ipv4DualMaskCheck
      L18_204 = L15_201
      L17_203 = L17_203(L18_204, L16_202, A0_186, A1_187)
      L2_188 = L17_203
      L17_203 = _UPVALUE2_
      L17_203 = L17_203.SUCCESS
      if L2_188 == L17_203 then
        L17_203 = _UPVALUE13_
        L17_203 = L17_203.SAME_SUBNET_PPTP
        return L17_203
      end
    end
  end
  L17_203 = db
  L17_203 = L17_203.getAttribute
  L18_204 = _UPVALUE14_
  L17_203 = L17_203(L18_204, ROW_ID, _UPVALUE0_, _UPVALUE6_.beginClientAddress)
  L18_204 = _UPVALUE12_
  if L17_203 ~= _UPVALUE2_.NIL and L17_203 ~= _UPVALUE8_ then
    L2_188 = _UPVALUE4_.ipv4DualMaskCheck(L17_203, L18_204, A0_186, A1_187)
    if L2_188 == _UPVALUE2_.SUCCESS then
      return _UPVALUE13_.SAME_SUBNET_SSLCLIENT
    end
  end
  return _UPVALUE2_.SUCCESS
end
