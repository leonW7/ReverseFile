local L0_0
L0_0 = module
L0_0("com.teamf1.core.sslvpn.server_policy", package.seeall)
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
L0_0 = L0_0("com.teamf1.core.sslvpn.returnCodes")
server_policyTable = "SSLVPNPolicy"
resourceTable = "SSLVPNResource"
;({}).feature = "feature"
;({}).policyName = "PolicyName"
;({}).policyType = "PolicyType"
;({}).policyOwnerName = "PolicyOwnerName"
;({}).policyDestinationType = "DestinationObjectType"
;({}).permission = "Permission"
;({}).serviceType = "ServiceType"
;({}).destination = "DestinationObject"
;({}).IPAddress = "Address"
;({}).maskLength = "MaskLength"
;({}).resourceName = "ResourceName"
;({}).startPort = "StartPort"
;({}).endPort = "EndPort"
;({}).icmp = "IcmpBlock"
;({}).destinationObject = "DestinationObject"
;({}).resource = "ResourceName"
;({}).service = "ServiceType"
sslvpnEnableTable = "SslvpnEnable"
;({}).feature = "sslvpnEnableStatus"
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
else
end
sslvpn_resourceTable = "SSLVPNResource"
sslvpn_resourceObjectTable = "SSLVPNResourceObject"
;({}).accessMgmt = "accessMgmtEnable"
function isfeatureEnabled()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(sslvpnEnableTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.feature)
  if L0_1 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L0_1
end
function isfeatureEnabledNext(A0_2)
  local L2_3
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.NOT_SUPPORTED
  return L2_3, 0
end
function featureEnable(A0_4)
  if db.setAttribute(sslvpnEnableTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.feature, _UPVALUE3_) == _UPVALUE4_.FALSE then
    return _UPVALUE4_.FAILURE, A0_4
  end
  return _UPVALUE4_.SUCCESS, A0_4
end
function featureDisable(A0_5)
  if db.setAttribute(sslvpnEnableTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.feature, _UPVALUE3_) == _UPVALUE4_.FALSE then
    return _UPVALUE4_.FAILURE, A0_5
  end
  return _UPVALUE4_.SUCCESS, A0_5
end
function policyNameGet()
  local L0_6, L1_7
  L0_6 = db
  L0_6 = L0_6.getNextRowId
  L1_7 = _UPVALUE0_
  L0_6 = L0_6(L1_7, server_policyTable)
  L1_7 = db
  L1_7 = L1_7.getAttribute
  L1_7 = L1_7(server_policyTable, _UPVALUE1_, L0_6, _UPVALUE2_.policyName)
  if L1_7 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_6, L1_7
end
function policyNameGetNext(A0_8)
  local L1_9, L2_10
  L1_9 = _UPVALUE0_
  L1_9 = L1_9.NIL
  if A0_8 ~= L1_9 then
    L1_9 = tonumber
    L2_10 = A0_8
    L1_9 = L1_9(L2_10)
    L2_10 = _UPVALUE0_
    L2_10 = L2_10.NIL
  elseif L1_9 == L2_10 then
    L1_9 = _UPVALUE0_
    L1_9 = L1_9.INVALID_ARGUMENT
    return L1_9
  end
  L1_9 = db
  L1_9 = L1_9.existsRow
  L2_10 = server_policyTable
  L1_9 = L1_9(L2_10, _UPVALUE1_, A0_8)
  L2_10 = _UPVALUE0_
  L2_10 = L2_10.FALSE
  if L1_9 == L2_10 then
    L1_9 = _UPVALUE0_
    L1_9 = L1_9.INVALID_ARGUMENT
    return L1_9
  end
  L1_9 = db
  L1_9 = L1_9.getNextRowId
  L2_10 = A0_8
  L1_9 = L1_9(L2_10, server_policyTable)
  L2_10 = _UPVALUE0_
  L2_10 = L2_10.NIL
  if L1_9 == L2_10 then
    L2_10 = _UPVALUE0_
    L2_10 = L2_10.NOT_EXIST
    return L2_10
  end
  L2_10 = db
  L2_10 = L2_10.getAttribute
  L2_10 = L2_10(server_policyTable, _UPVALUE1_, L1_9, _UPVALUE2_.policyName)
  if L2_10 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_9
  end
  return _UPVALUE0_.SUCCESS, L1_9, L2_10
end
function policyNameSet(A0_11, A1_12)
  if A0_11 == _UPVALUE0_.NIL or tonumber(A0_11) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(server_policyTable, _UPVALUE1_, A0_11) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_12 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(server_policyTable, _UPVALUE1_, A0_11, _UPVALUE2_.policyName, A1_12) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_11
  end
  return _UPVALUE0_.SUCCESS, A0_11
end
function policyNameDelete(A0_13, A1_14)
  local L3_15
  L3_15 = _UPVALUE0_
  L3_15 = L3_15.NOT_SUPPORTED
  return L3_15, A0_13
end
function policyTypeGet()
  local L0_16, L1_17
  L0_16 = db
  L0_16 = L0_16.getNextRowId
  L1_17 = _UPVALUE0_
  L0_16 = L0_16(L1_17, server_policyTable)
  L1_17 = db
  L1_17 = L1_17.getAttribute
  L1_17 = L1_17(server_policyTable, _UPVALUE1_, L0_16, _UPVALUE2_.policyType)
  if L1_17 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_16, L1_17
end
function policyTypeGetNext(A0_18)
  local L1_19, L2_20
  L1_19 = _UPVALUE0_
  L1_19 = L1_19.NIL
  if A0_18 ~= L1_19 then
    L1_19 = tonumber
    L2_20 = A0_18
    L1_19 = L1_19(L2_20)
    L2_20 = _UPVALUE0_
    L2_20 = L2_20.NIL
  elseif L1_19 == L2_20 then
    L1_19 = _UPVALUE0_
    L1_19 = L1_19.INVALID_ARGUMENT
    return L1_19
  end
  L1_19 = db
  L1_19 = L1_19.existsRow
  L2_20 = server_policyTable
  L1_19 = L1_19(L2_20, _UPVALUE1_, A0_18)
  L2_20 = _UPVALUE0_
  L2_20 = L2_20.FALSE
  if L1_19 == L2_20 then
    L1_19 = _UPVALUE0_
    L1_19 = L1_19.INVALID_ARGUMENT
    return L1_19
  end
  L1_19 = db
  L1_19 = L1_19.getNextRowId
  L2_20 = A0_18
  L1_19 = L1_19(L2_20, server_policyTable)
  L2_20 = _UPVALUE0_
  L2_20 = L2_20.NIL
  if L1_19 == L2_20 then
    L2_20 = _UPVALUE0_
    L2_20 = L2_20.NOT_EXIST
    return L2_20
  end
  L2_20 = db
  L2_20 = L2_20.getAttribute
  L2_20 = L2_20(server_policyTable, _UPVALUE1_, L1_19, _UPVALUE2_.policyType)
  if L2_20 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_19
  end
  return _UPVALUE0_.SUCCESS, L1_19, L2_20
end
function policyTypeSet(A0_21, A1_22)
  if A0_21 == _UPVALUE0_.NIL or tonumber(A0_21) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(server_policyTable, _UPVALUE1_, A0_21) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_22 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_22 ~= _UPVALUE2_ and A1_22 ~= _UPVALUE3_ and A1_22 ~= _UPVALUE4_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(server_policyTable, _UPVALUE1_, A0_21, _UPVALUE5_.policyType, A1_22) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_21
  end
  return _UPVALUE0_.SUCCESS, A0_21
end
function policyOwnerNameGet()
  local L0_23, L1_24
  L0_23 = db
  L0_23 = L0_23.getNextRowId
  L1_24 = _UPVALUE0_
  L0_23 = L0_23(L1_24, server_policyTable)
  L1_24 = db
  L1_24 = L1_24.getAttribute
  L1_24 = L1_24(server_policyTable, _UPVALUE1_, L0_23, _UPVALUE2_.policyOwnerName)
  if L1_24 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_23, L1_24
end
function policyOwnerNameGetNext(A0_25)
  local L1_26, L2_27
  L1_26 = _UPVALUE0_
  L1_26 = L1_26.NIL
  if A0_25 ~= L1_26 then
    L1_26 = tonumber
    L2_27 = A0_25
    L1_26 = L1_26(L2_27)
    L2_27 = _UPVALUE0_
    L2_27 = L2_27.NIL
  elseif L1_26 == L2_27 then
    L1_26 = _UPVALUE0_
    L1_26 = L1_26.INVALID_ARGUMENT
    return L1_26
  end
  L1_26 = db
  L1_26 = L1_26.existsRow
  L2_27 = server_policyTable
  L1_26 = L1_26(L2_27, _UPVALUE1_, A0_25)
  L2_27 = _UPVALUE0_
  L2_27 = L2_27.FALSE
  if L1_26 == L2_27 then
    L1_26 = _UPVALUE0_
    L1_26 = L1_26.INVALID_ARGUMENT
    return L1_26
  end
  L1_26 = db
  L1_26 = L1_26.getNextRowId
  L2_27 = A0_25
  L1_26 = L1_26(L2_27, server_policyTable)
  L2_27 = _UPVALUE0_
  L2_27 = L2_27.NIL
  if L1_26 == L2_27 then
    L2_27 = _UPVALUE0_
    L2_27 = L2_27.NOT_EXIST
    return L2_27
  end
  L2_27 = db
  L2_27 = L2_27.getAttribute
  L2_27 = L2_27(server_policyTable, _UPVALUE1_, L1_26, _UPVALUE2_.policyOwnerName)
  if L2_27 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_26
  end
  return _UPVALUE0_.SUCCESS, L1_26, L2_27
end
function policyOwnerNameSet(A0_28, A1_29)
  if A0_28 == _UPVALUE0_.NIL or tonumber(A0_28) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(server_policyTable, _UPVALUE1_, A0_28) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_29 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.getAttribute(server_policyTable, _UPVALUE1_, A0_28, _UPVALUE2_.policyType) == _UPVALUE3_ then
    return _UPVALUE0_.NOT_SUPPORTED, A0_28
  end
  if db.setAttribute(server_policyTable, _UPVALUE1_, A0_28, _UPVALUE2_.policyOwnerName, A1_29) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_28
  end
  return _UPVALUE0_.SUCCESS, A0_28
end
function policyDestinationTypeGet()
  local L0_30, L1_31
  L0_30 = db
  L0_30 = L0_30.getNextRowId
  L1_31 = _UPVALUE0_
  L0_30 = L0_30(L1_31, server_policyTable)
  L1_31 = db
  L1_31 = L1_31.getAttribute
  L1_31 = L1_31(server_policyTable, _UPVALUE1_, L0_30, _UPVALUE2_.policyDestinationType)
  if L1_31 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_30, L1_31
end
function policyDestinationTypeGetNext(A0_32)
  local L1_33, L2_34
  L1_33 = _UPVALUE0_
  L1_33 = L1_33.NIL
  if A0_32 ~= L1_33 then
    L1_33 = tonumber
    L2_34 = A0_32
    L1_33 = L1_33(L2_34)
    L2_34 = _UPVALUE0_
    L2_34 = L2_34.NIL
  elseif L1_33 == L2_34 then
    L1_33 = _UPVALUE0_
    L1_33 = L1_33.INVALID_ARGUMENT
    return L1_33
  end
  L1_33 = db
  L1_33 = L1_33.existsRow
  L2_34 = server_policyTable
  L1_33 = L1_33(L2_34, _UPVALUE1_, A0_32)
  L2_34 = _UPVALUE0_
  L2_34 = L2_34.FALSE
  if L1_33 == L2_34 then
    L1_33 = _UPVALUE0_
    L1_33 = L1_33.INVALID_ARGUMENT
    return L1_33
  end
  L1_33 = db
  L1_33 = L1_33.getNextRowId
  L2_34 = A0_32
  L1_33 = L1_33(L2_34, server_policyTable)
  L2_34 = _UPVALUE0_
  L2_34 = L2_34.NIL
  if L1_33 == L2_34 then
    L2_34 = _UPVALUE0_
    L2_34 = L2_34.NOT_EXIST
    return L2_34
  end
  L2_34 = db
  L2_34 = L2_34.getAttribute
  L2_34 = L2_34(server_policyTable, _UPVALUE1_, L1_33, _UPVALUE2_.policyDestinationType)
  if L2_34 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_33
  end
  return _UPVALUE0_.SUCCESS, L1_33, L2_34
end
function policyDestinationTypeSet(A0_35, A1_36)
  if A0_35 == _UPVALUE0_.NIL or tonumber(A0_35) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(server_policyTable, _UPVALUE1_, A0_35) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_36 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_36) ~= _UPVALUE2_ and tonumber(A1_36) ~= _UPVALUE3_ and tonumber(A1_36) ~= _UPVALUE4_ and tonumber(A1_36) ~= _UPVALUE5_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(server_policyTable, _UPVALUE1_, A0_35, _UPVALUE6_.policyDestinationType, A1_36) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_35
  end
  return _UPVALUE0_.SUCCESS, A0_35
end
function permissionGet()
  local L0_37, L1_38
  L0_37 = db
  L0_37 = L0_37.getNextRowId
  L1_38 = _UPVALUE0_
  L0_37 = L0_37(L1_38, server_policyTable)
  L1_38 = db
  L1_38 = L1_38.getAttribute
  L1_38 = L1_38(server_policyTable, _UPVALUE1_, L0_37, _UPVALUE2_.permission)
  if L1_38 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_37, L1_38
end
function permissionGetNext(A0_39)
  local L1_40, L2_41
  L1_40 = _UPVALUE0_
  L1_40 = L1_40.NIL
  if A0_39 ~= L1_40 then
    L1_40 = tonumber
    L2_41 = A0_39
    L1_40 = L1_40(L2_41)
    L2_41 = _UPVALUE0_
    L2_41 = L2_41.NIL
  elseif L1_40 == L2_41 then
    L1_40 = _UPVALUE0_
    L1_40 = L1_40.INVALID_ARGUMENT
    return L1_40
  end
  L1_40 = db
  L1_40 = L1_40.existsRow
  L2_41 = server_policyTable
  L1_40 = L1_40(L2_41, _UPVALUE1_, A0_39)
  L2_41 = _UPVALUE0_
  L2_41 = L2_41.FALSE
  if L1_40 == L2_41 then
    L1_40 = _UPVALUE0_
    L1_40 = L1_40.INVALID_ARGUMENT
    return L1_40
  end
  L1_40 = db
  L1_40 = L1_40.getNextRowId
  L2_41 = A0_39
  L1_40 = L1_40(L2_41, server_policyTable)
  L2_41 = _UPVALUE0_
  L2_41 = L2_41.NIL
  if L1_40 == L2_41 then
    L2_41 = _UPVALUE0_
    L2_41 = L2_41.NOT_EXIST
    return L2_41
  end
  L2_41 = db
  L2_41 = L2_41.getAttribute
  L2_41 = L2_41(server_policyTable, _UPVALUE1_, L1_40, _UPVALUE2_.permission)
  if L2_41 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_40
  end
  return _UPVALUE0_.SUCCESS, L1_40, L2_41
end
function permissionSet(A0_42, A1_43)
  if A0_42 == _UPVALUE0_.NIL or tonumber(A0_42) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(server_policyTable, _UPVALUE1_, A0_42) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_43 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_43 ~= _UPVALUE2_ and A1_43 ~= _UPVALUE3_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(server_policyTable, _UPVALUE1_, A0_42, _UPVALUE4_.permission, A1_43) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_42
  end
  return _UPVALUE0_.SUCCESS, A0_42
end
function serviceTypeGet()
  local L0_44, L1_45
  L0_44 = db
  L0_44 = L0_44.getNextRowId
  L1_45 = _UPVALUE0_
  L0_44 = L0_44(L1_45, server_policyTable)
  L1_45 = db
  L1_45 = L1_45.getAttribute
  L1_45 = L1_45(server_policyTable, _UPVALUE1_, L0_44, _UPVALUE2_.serviceType)
  if L1_45 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_44, L1_45
end
function serviceTypeGetNext(A0_46)
  local L1_47, L2_48
  L1_47 = _UPVALUE0_
  L1_47 = L1_47.NIL
  if A0_46 ~= L1_47 then
    L1_47 = tonumber
    L2_48 = A0_46
    L1_47 = L1_47(L2_48)
    L2_48 = _UPVALUE0_
    L2_48 = L2_48.NIL
  elseif L1_47 == L2_48 then
    L1_47 = _UPVALUE0_
    L1_47 = L1_47.INVALID_ARGUMENT
    return L1_47
  end
  L1_47 = db
  L1_47 = L1_47.existsRow
  L2_48 = server_policyTable
  L1_47 = L1_47(L2_48, _UPVALUE1_, A0_46)
  L2_48 = _UPVALUE0_
  L2_48 = L2_48.FALSE
  if L1_47 == L2_48 then
    L1_47 = _UPVALUE0_
    L1_47 = L1_47.INVALID_ARGUMENT
    return L1_47
  end
  L1_47 = db
  L1_47 = L1_47.getNextRowId
  L2_48 = A0_46
  L1_47 = L1_47(L2_48, server_policyTable)
  L2_48 = _UPVALUE0_
  L2_48 = L2_48.NIL
  if L1_47 == L2_48 then
    L2_48 = _UPVALUE0_
    L2_48 = L2_48.NOT_EXIST
    return L2_48
  end
  L2_48 = db
  L2_48 = L2_48.getAttribute
  L2_48 = L2_48(server_policyTable, _UPVALUE1_, L1_47, _UPVALUE2_.serviceType)
  if L2_48 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_47
  end
  return _UPVALUE0_.SUCCESS, L1_47, L2_48
end
function serviceTypeSet(A0_49, A1_50)
  if A0_49 == _UPVALUE0_.NIL or tonumber(A0_49) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(server_policyTable, _UPVALUE1_, A0_49) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_50 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_50 ~= _UPVALUE2_ and A1_50 ~= _UPVALUE3_ and A1_50 ~= _UPVALUE4_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(server_policyTable, _UPVALUE1_, A0_49, _UPVALUE5_.serviceType, A1_50) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_49
  end
  return _UPVALUE0_.SUCCESS, A0_49
end
function destinationGet()
  local L0_51, L1_52
  L0_51 = db
  L0_51 = L0_51.getNextRowId
  L1_52 = _UPVALUE0_
  L0_51 = L0_51(L1_52, server_policyTable)
  L1_52 = db
  L1_52 = L1_52.getAttribute
  L1_52 = L1_52(server_policyTable, _UPVALUE1_, L0_51, _UPVALUE2_.destination)
  if L1_52 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_51, L1_52
end
function destinationGetNext(A0_53)
  local L1_54, L2_55
  L1_54 = _UPVALUE0_
  L1_54 = L1_54.NIL
  if A0_53 ~= L1_54 then
    L1_54 = tonumber
    L2_55 = A0_53
    L1_54 = L1_54(L2_55)
    L2_55 = _UPVALUE0_
    L2_55 = L2_55.NIL
  elseif L1_54 == L2_55 then
    L1_54 = _UPVALUE0_
    L1_54 = L1_54.INVALID_ARGUMENT
    return L1_54
  end
  L1_54 = db
  L1_54 = L1_54.existsRow
  L2_55 = server_policyTable
  L1_54 = L1_54(L2_55, _UPVALUE1_, A0_53)
  L2_55 = _UPVALUE0_
  L2_55 = L2_55.FALSE
  if L1_54 == L2_55 then
    L1_54 = _UPVALUE0_
    L1_54 = L1_54.INVALID_ARGUMENT
    return L1_54
  end
  L1_54 = db
  L1_54 = L1_54.getNextRowId
  L2_55 = A0_53
  L1_54 = L1_54(L2_55, server_policyTable)
  L2_55 = _UPVALUE0_
  L2_55 = L2_55.NIL
  if L1_54 == L2_55 then
    L2_55 = _UPVALUE0_
    L2_55 = L2_55.NOT_EXIST
    return L2_55
  end
  L2_55 = db
  L2_55 = L2_55.getAttribute
  L2_55 = L2_55(server_policyTable, _UPVALUE1_, L1_54, _UPVALUE2_.destination)
  if L2_55 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_54
  end
  return _UPVALUE0_.SUCCESS, L1_54, L2_55
end
function destinationSet(A0_56, A1_57)
  local L3_58
  L3_58 = _UPVALUE0_
  L3_58 = L3_58.NOT_SUPPORTED
  return L3_58, A0_56
end
function IPAddressGet()
  local L0_59, L1_60
  L0_59 = db
  L0_59 = L0_59.getNextRowId
  L1_60 = _UPVALUE0_
  L0_59 = L0_59(L1_60, server_policyTable)
  L1_60 = db
  L1_60 = L1_60.getAttribute
  L1_60 = L1_60(server_policyTable, _UPVALUE1_, L0_59, _UPVALUE2_.IPAddress)
  if L1_60 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_59, L1_60
end
function IPAddressGetNext(A0_61)
  local L1_62, L2_63
  L1_62 = _UPVALUE0_
  L1_62 = L1_62.NIL
  if A0_61 ~= L1_62 then
    L1_62 = tonumber
    L2_63 = A0_61
    L1_62 = L1_62(L2_63)
    L2_63 = _UPVALUE0_
    L2_63 = L2_63.NIL
  elseif L1_62 == L2_63 then
    L1_62 = _UPVALUE0_
    L1_62 = L1_62.INVALID_ARGUMENT
    return L1_62
  end
  L1_62 = db
  L1_62 = L1_62.existsRow
  L2_63 = server_policyTable
  L1_62 = L1_62(L2_63, _UPVALUE1_, A0_61)
  L2_63 = _UPVALUE0_
  L2_63 = L2_63.FALSE
  if L1_62 == L2_63 then
    L1_62 = _UPVALUE0_
    L1_62 = L1_62.INVALID_ARGUMENT
    return L1_62
  end
  L1_62 = db
  L1_62 = L1_62.getNextRowId
  L2_63 = A0_61
  L1_62 = L1_62(L2_63, server_policyTable)
  L2_63 = _UPVALUE0_
  L2_63 = L2_63.NIL
  if L1_62 == L2_63 then
    L2_63 = _UPVALUE0_
    L2_63 = L2_63.NOT_EXIST
    return L2_63
  end
  L2_63 = db
  L2_63 = L2_63.getAttribute
  L2_63 = L2_63(server_policyTable, _UPVALUE1_, L1_62, _UPVALUE2_.IPAddress)
  if L2_63 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_62
  end
  return _UPVALUE0_.SUCCESS, L1_62, L2_63
end
function IPAddressSet(A0_64, A1_65)
  local L2_66, L3_67
  L2_66 = _UPVALUE0_
  L2_66 = L2_66.NIL
  if A0_64 ~= L2_66 then
    L2_66 = tonumber
    L3_67 = A0_64
    L2_66 = L2_66(L3_67)
    L3_67 = _UPVALUE0_
    L3_67 = L3_67.NIL
  elseif L2_66 == L3_67 then
    L2_66 = _UPVALUE0_
    L2_66 = L2_66.INVALID_ARGUMENT
    return L2_66
  end
  L2_66 = db
  L2_66 = L2_66.existsRow
  L3_67 = server_policyTable
  L2_66 = L2_66(L3_67, _UPVALUE1_, A0_64)
  L3_67 = _UPVALUE0_
  L3_67 = L3_67.FALSE
  if L2_66 == L3_67 then
    L2_66 = _UPVALUE0_
    L2_66 = L2_66.INVALID_ARGUMENT
    return L2_66
  end
  L2_66 = db
  L2_66 = L2_66.getAttribute
  L3_67 = server_policyTable
  L2_66 = L2_66(L3_67, _UPVALUE1_, A0_64, _UPVALUE2_.policyDestinationType)
  L3_67 = tonumber
  L3_67 = L3_67(L2_66)
  if L3_67 ~= _UPVALUE3_ then
    L3_67 = tonumber
    L3_67 = L3_67(L2_66)
    if L3_67 ~= _UPVALUE4_ then
      L3_67 = _UPVALUE0_
      L3_67 = L3_67.NOT_SUPPORTED
      return L3_67, A0_64
    end
  end
  L3_67 = nil
  if A1_65 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L3_67 = _UPVALUE5_.ipAddressCheck("2", A1_65)
  if L3_67 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(server_policyTable, _UPVALUE1_, A0_64, _UPVALUE2_.IPAddress, A1_65) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_64
  end
  return _UPVALUE0_.SUCCESS, A0_64
end
function maskLengthGet()
  local L0_68, L1_69
  L0_68 = db
  L0_68 = L0_68.getNextRowId
  L1_69 = _UPVALUE0_
  L0_68 = L0_68(L1_69, server_policyTable)
  L1_69 = db
  L1_69 = L1_69.getAttribute
  L1_69 = L1_69(server_policyTable, _UPVALUE1_, L0_68, _UPVALUE2_.maskLength)
  if L1_69 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_68, L1_69
end
function maskLengthGetNext(A0_70)
  local L1_71, L2_72
  L1_71 = _UPVALUE0_
  L1_71 = L1_71.NIL
  if A0_70 ~= L1_71 then
    L1_71 = tonumber
    L2_72 = A0_70
    L1_71 = L1_71(L2_72)
    L2_72 = _UPVALUE0_
    L2_72 = L2_72.NIL
  elseif L1_71 == L2_72 then
    L1_71 = _UPVALUE0_
    L1_71 = L1_71.INVALID_ARGUMENT
    return L1_71
  end
  L1_71 = db
  L1_71 = L1_71.existsRow
  L2_72 = server_policyTable
  L1_71 = L1_71(L2_72, _UPVALUE1_, A0_70)
  L2_72 = _UPVALUE0_
  L2_72 = L2_72.FALSE
  if L1_71 == L2_72 then
    L1_71 = _UPVALUE0_
    L1_71 = L1_71.INVALID_ARGUMENT
    return L1_71
  end
  L1_71 = db
  L1_71 = L1_71.getNextRowId
  L2_72 = A0_70
  L1_71 = L1_71(L2_72, server_policyTable)
  L2_72 = _UPVALUE0_
  L2_72 = L2_72.NIL
  if L1_71 == L2_72 then
    L2_72 = _UPVALUE0_
    L2_72 = L2_72.NOT_EXIST
    return L2_72
  end
  L2_72 = db
  L2_72 = L2_72.getAttribute
  L2_72 = L2_72(server_policyTable, _UPVALUE1_, L1_71, _UPVALUE2_.maskLength)
  if L2_72 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_71
  end
  return _UPVALUE0_.SUCCESS, L1_71, L2_72
end
function maskLengthSet(A0_73, A1_74)
  local L2_75
  L2_75 = _UPVALUE0_
  L2_75 = L2_75.NIL
  if A0_73 ~= L2_75 then
    L2_75 = tonumber
    L2_75 = L2_75(A0_73)
  elseif L2_75 == _UPVALUE0_.NIL then
    L2_75 = _UPVALUE0_
    L2_75 = L2_75.INVALID_ARGUMENT
    return L2_75
  end
  L2_75 = db
  L2_75 = L2_75.existsRow
  L2_75 = L2_75(server_policyTable, _UPVALUE1_, A0_73)
  if L2_75 == _UPVALUE0_.FALSE then
    L2_75 = _UPVALUE0_
    L2_75 = L2_75.INVALID_ARGUMENT
    return L2_75
  end
  L2_75 = _UPVALUE0_
  L2_75 = L2_75.NIL
  if A1_74 == L2_75 then
    L2_75 = _UPVALUE0_
    L2_75 = L2_75.INVALID_ARGUMENT
    return L2_75
  end
  L2_75 = db
  L2_75 = L2_75.getAttribute
  L2_75 = L2_75(server_policyTable, _UPVALUE1_, A0_73, _UPVALUE2_.policyDestinationType)
  if tonumber(L2_75) ~= _UPVALUE3_ then
    return _UPVALUE0_.NOT_SUPPORTED, A0_73
  end
  if db.setAttribute(server_policyTable, _UPVALUE1_, A0_73, _UPVALUE2_.maskLength, A1_74) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_73
  end
  return _UPVALUE0_.SUCCESS, A0_73
end
function resourceNameGet()
  local L0_76, L1_77
  L0_76 = db
  L0_76 = L0_76.getNextRowId
  L1_77 = _UPVALUE0_
  L0_76 = L0_76(L1_77, server_policyTable)
  L1_77 = db
  L1_77 = L1_77.getAttribute
  L1_77 = L1_77(server_policyTable, _UPVALUE1_, L0_76, _UPVALUE2_.resourceName)
  if L1_77 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_76, L1_77
end
function resourceNameGetNext(A0_78)
  local L1_79, L2_80
  L1_79 = _UPVALUE0_
  L1_79 = L1_79.NIL
  if A0_78 ~= L1_79 then
    L1_79 = tonumber
    L2_80 = A0_78
    L1_79 = L1_79(L2_80)
    L2_80 = _UPVALUE0_
    L2_80 = L2_80.NIL
  elseif L1_79 == L2_80 then
    L1_79 = _UPVALUE0_
    L1_79 = L1_79.INVALID_ARGUMENT
    return L1_79
  end
  L1_79 = db
  L1_79 = L1_79.existsRow
  L2_80 = server_policyTable
  L1_79 = L1_79(L2_80, _UPVALUE1_, A0_78)
  L2_80 = _UPVALUE0_
  L2_80 = L2_80.FALSE
  if L1_79 == L2_80 then
    L1_79 = _UPVALUE0_
    L1_79 = L1_79.INVALID_ARGUMENT
    return L1_79
  end
  L1_79 = db
  L1_79 = L1_79.getNextRowId
  L2_80 = A0_78
  L1_79 = L1_79(L2_80, server_policyTable)
  L2_80 = _UPVALUE0_
  L2_80 = L2_80.NIL
  if L1_79 == L2_80 then
    L2_80 = _UPVALUE0_
    L2_80 = L2_80.NOT_EXIST
    return L2_80
  end
  L2_80 = db
  L2_80 = L2_80.getAttribute
  L2_80 = L2_80(server_policyTable, _UPVALUE1_, L1_79, _UPVALUE2_.resourceName)
  if L2_80 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_79
  end
  return _UPVALUE0_.SUCCESS, L1_79, L2_80
end
function resourceNameSet(A0_81, A1_82)
  if A0_81 == _UPVALUE0_.NIL or tonumber(A0_81) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(server_policyTable, _UPVALUE1_, A0_81) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_82 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(server_policyTable, _UPVALUE1_, A0_81, _UPVALUE2_.resourceName, A1_82) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_81
  end
  return _UPVALUE0_.SUCCESS, A0_81
end
function icmpGet()
  local L0_83, L1_84
  L0_83 = db
  L0_83 = L0_83.getNextRowId
  L1_84 = _UPVALUE0_
  L0_83 = L0_83(L1_84, server_policyTable)
  L1_84 = db
  L1_84 = L1_84.getAttribute
  L1_84 = L1_84(server_policyTable, _UPVALUE1_, L0_83, _UPVALUE2_.icmp)
  if L1_84 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_83, L1_84
end
function icmpGetNext(A0_85)
  local L1_86, L2_87
  L1_86 = _UPVALUE0_
  L1_86 = L1_86.NIL
  if A0_85 ~= L1_86 then
    L1_86 = tonumber
    L2_87 = A0_85
    L1_86 = L1_86(L2_87)
    L2_87 = _UPVALUE0_
    L2_87 = L2_87.NIL
  elseif L1_86 == L2_87 then
    L1_86 = _UPVALUE0_
    L1_86 = L1_86.INVALID_ARGUMENT
    return L1_86
  end
  L1_86 = db
  L1_86 = L1_86.existsRow
  L2_87 = server_policyTable
  L1_86 = L1_86(L2_87, _UPVALUE1_, A0_85)
  L2_87 = _UPVALUE0_
  L2_87 = L2_87.FALSE
  if L1_86 == L2_87 then
    L1_86 = _UPVALUE0_
    L1_86 = L1_86.INVALID_ARGUMENT
    return L1_86
  end
  L1_86 = db
  L1_86 = L1_86.getNextRowId
  L2_87 = A0_85
  L1_86 = L1_86(L2_87, server_policyTable)
  L2_87 = _UPVALUE0_
  L2_87 = L2_87.NIL
  if L1_86 == L2_87 then
    L2_87 = _UPVALUE0_
    L2_87 = L2_87.NOT_EXIST
    return L2_87
  end
  L2_87 = db
  L2_87 = L2_87.getAttribute
  L2_87 = L2_87(server_policyTable, _UPVALUE1_, L1_86, _UPVALUE2_.icmp)
  if L2_87 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_86, L2_87
end
function icmpSet(A0_88, A1_89)
  if A0_88 == _UPVALUE0_.NIL or tonumber(A0_88) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(server_policyTable, _UPVALUE1_, A0_88) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_89 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(server_policyTable, _UPVALUE1_, A0_88, _UPVALUE2_.icmp, A1_89) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_88
  end
  return _UPVALUE0_.SUCCESS, A0_88
end
function startPortGet()
  local L0_90, L1_91
  L0_90 = db
  L0_90 = L0_90.getNextRowId
  L1_91 = _UPVALUE0_
  L0_90 = L0_90(L1_91, server_policyTable)
  L1_91 = db
  L1_91 = L1_91.getAttribute
  L1_91 = L1_91(server_policyTable, _UPVALUE1_, L0_90, _UPVALUE2_.startPort)
  if L1_91 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_90, L1_91
end
function startPortGetNext(A0_92)
  local L1_93, L2_94
  L1_93 = _UPVALUE0_
  L1_93 = L1_93.NIL
  if A0_92 ~= L1_93 then
    L1_93 = tonumber
    L2_94 = A0_92
    L1_93 = L1_93(L2_94)
    L2_94 = _UPVALUE0_
    L2_94 = L2_94.NIL
  elseif L1_93 == L2_94 then
    L1_93 = _UPVALUE0_
    L1_93 = L1_93.INVALID_ARGUMENT
    return L1_93
  end
  L1_93 = db
  L1_93 = L1_93.existsRow
  L2_94 = server_policyTable
  L1_93 = L1_93(L2_94, _UPVALUE1_, A0_92)
  L2_94 = _UPVALUE0_
  L2_94 = L2_94.FALSE
  if L1_93 == L2_94 then
    L1_93 = _UPVALUE0_
    L1_93 = L1_93.INVALID_ARGUMENT
    return L1_93
  end
  L1_93 = db
  L1_93 = L1_93.getNextRowId
  L2_94 = A0_92
  L1_93 = L1_93(L2_94, server_policyTable)
  L2_94 = _UPVALUE0_
  L2_94 = L2_94.NIL
  if L1_93 == L2_94 then
    L2_94 = _UPVALUE0_
    L2_94 = L2_94.NOT_EXIST
    return L2_94
  end
  L2_94 = db
  L2_94 = L2_94.getAttribute
  L2_94 = L2_94(server_policyTable, _UPVALUE1_, L1_93, _UPVALUE2_.startPort)
  if L2_94 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_93
  end
  return _UPVALUE0_.SUCCESS, L1_93, L2_94
end
function startPortSet(A0_95, A1_96)
  local L2_97, L3_98
  L2_97 = _UPVALUE0_
  L2_97 = L2_97.NIL
  if A0_95 ~= L2_97 then
    L2_97 = tonumber
    L3_98 = A0_95
    L2_97 = L2_97(L3_98)
    L3_98 = _UPVALUE0_
    L3_98 = L3_98.NIL
  elseif L2_97 == L3_98 then
    L2_97 = _UPVALUE0_
    L2_97 = L2_97.INVALID_ARGUMENT
    return L2_97
  end
  L2_97 = db
  L2_97 = L2_97.existsRow
  L3_98 = server_policyTable
  L2_97 = L2_97(L3_98, _UPVALUE1_, A0_95)
  L3_98 = _UPVALUE0_
  L3_98 = L3_98.FALSE
  if L2_97 == L3_98 then
    L2_97 = _UPVALUE0_
    L2_97 = L2_97.INVALID_ARGUMENT
    return L2_97
  end
  L2_97 = _UPVALUE0_
  L2_97 = L2_97.NIL
  if A1_96 == L2_97 then
    L2_97 = _UPVALUE0_
    L2_97 = L2_97.INVALID_ARGUMENT
    return L2_97
  end
  L2_97 = tonumber
  L3_98 = A1_96
  L2_97 = L2_97(L3_98)
  L3_98 = _UPVALUE2_
  if not (L2_97 < L3_98) then
    L3_98 = _UPVALUE3_
  elseif L2_97 > L3_98 then
    L3_98 = _UPVALUE0_
    L3_98 = L3_98.INVALID_ARGUMENT
    return L3_98
  end
  L3_98 = db
  L3_98 = L3_98.getAttribute
  L3_98 = L3_98(server_policyTable, _UPVALUE1_, A0_95, _UPVALUE4_.policyDestinationType)
  if tonumber(L3_98) == _UPVALUE5_ then
    return _UPVALUE0_.NOT_SUPPORTED, A0_95
  end
  if db.setAttribute(server_policyTable, _UPVALUE1_, A0_95, _UPVALUE4_.startPort, A1_96) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_95
  end
  return _UPVALUE0_.SUCCESS, A0_95
end
function endPortGet()
  local L0_99, L1_100
  L0_99 = db
  L0_99 = L0_99.getNextRowId
  L1_100 = _UPVALUE0_
  L0_99 = L0_99(L1_100, server_policyTable)
  L1_100 = db
  L1_100 = L1_100.getAttribute
  L1_100 = L1_100(server_policyTable, _UPVALUE1_, L0_99, _UPVALUE2_.endPort)
  if L1_100 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_99, L1_100
end
function endPortGetNext(A0_101)
  local L1_102, L2_103
  L1_102 = _UPVALUE0_
  L1_102 = L1_102.NIL
  if A0_101 ~= L1_102 then
    L1_102 = tonumber
    L2_103 = A0_101
    L1_102 = L1_102(L2_103)
    L2_103 = _UPVALUE0_
    L2_103 = L2_103.NIL
  elseif L1_102 == L2_103 then
    L1_102 = _UPVALUE0_
    L1_102 = L1_102.INVALID_ARGUMENT
    return L1_102
  end
  L1_102 = db
  L1_102 = L1_102.existsRow
  L2_103 = server_policyTable
  L1_102 = L1_102(L2_103, _UPVALUE1_, A0_101)
  L2_103 = _UPVALUE0_
  L2_103 = L2_103.FALSE
  if L1_102 == L2_103 then
    L1_102 = _UPVALUE0_
    L1_102 = L1_102.INVALID_ARGUMENT
    return L1_102
  end
  L1_102 = db
  L1_102 = L1_102.getNextRowId
  L2_103 = A0_101
  L1_102 = L1_102(L2_103, server_policyTable)
  L2_103 = _UPVALUE0_
  L2_103 = L2_103.NIL
  if L1_102 == L2_103 then
    L2_103 = _UPVALUE0_
    L2_103 = L2_103.NOT_EXIST
    return L2_103
  end
  L2_103 = db
  L2_103 = L2_103.getAttribute
  L2_103 = L2_103(server_policyTable, _UPVALUE1_, L1_102, _UPVALUE2_.endPort)
  if L2_103 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_102
  end
  return _UPVALUE0_.SUCCESS, L1_102, L2_103
end
function endPortSet(A0_104, A1_105)
  local L2_106, L3_107
  L2_106 = _UPVALUE0_
  L2_106 = L2_106.NIL
  if A0_104 ~= L2_106 then
    L2_106 = tonumber
    L3_107 = A0_104
    L2_106 = L2_106(L3_107)
    L3_107 = _UPVALUE0_
    L3_107 = L3_107.NIL
  elseif L2_106 == L3_107 then
    L2_106 = _UPVALUE0_
    L2_106 = L2_106.INVALID_ARGUMENT
    return L2_106
  end
  L2_106 = db
  L2_106 = L2_106.existsRow
  L3_107 = server_policyTable
  L2_106 = L2_106(L3_107, _UPVALUE1_, A0_104)
  L3_107 = _UPVALUE0_
  L3_107 = L3_107.FALSE
  if L2_106 == L3_107 then
    L2_106 = _UPVALUE0_
    L2_106 = L2_106.INVALID_ARGUMENT
    return L2_106
  end
  L2_106 = _UPVALUE0_
  L2_106 = L2_106.NIL
  if A1_105 == L2_106 then
    L2_106 = _UPVALUE0_
    L2_106 = L2_106.INVALID_ARGUMENT
    return L2_106
  end
  L2_106 = tonumber
  L3_107 = A1_105
  L2_106 = L2_106(L3_107)
  L3_107 = _UPVALUE2_
  if not (L2_106 < L3_107) then
    L3_107 = _UPVALUE3_
  elseif L2_106 > L3_107 then
    L3_107 = _UPVALUE0_
    L3_107 = L3_107.INVALID_ARGUMENT
    return L3_107
  end
  L3_107 = db
  L3_107 = L3_107.getAttribute
  L3_107 = L3_107(server_policyTable, _UPVALUE1_, A0_104, _UPVALUE4_.policyDestinationType)
  if tonumber(L3_107) == _UPVALUE5_ then
    return _UPVALUE0_.NOT_SUPPORTED, A0_104
  end
  if db.setAttribute(server_policyTable, _UPVALUE1_, A0_104, _UPVALUE4_.endPort, A1_105) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_104
  end
  return _UPVALUE0_.SUCCESS, A0_104
end
function sslvpnPolicyGet()
  local L0_108, L1_109, L2_110, L3_111, L4_112, L5_113, L6_114, L7_115, L8_116, L9_117, L10_118, L11_119, L12_120, L13_121, L14_122, L15_123
  L0_108 = db
  L0_108 = L0_108.getAttribute
  L1_109 = _UPVALUE0_
  L2_110 = _UPVALUE1_
  L3_111 = _UPVALUE2_
  L4_112 = _UPVALUE3_
  L4_112 = L4_112.accessMgmt
  L0_108 = L0_108(L1_109, L2_110, L3_111, L4_112)
  L1_109 = _UPVALUE4_
  if L0_108 == L1_109 then
    L1_109 = _UPVALUE5_
    L1_109 = L1_109.SSLVPN_REMOTEMANAGEMENT_DISABLED
    return L1_109
  end
  L1_109 = db
  L1_109 = L1_109.getNextRowId
  L2_110 = _UPVALUE2_
  L3_111 = server_policyTable
  L1_109 = L1_109(L2_110, L3_111)
  L2_110 = db
  L2_110 = L2_110.getRow
  L3_111 = server_policyTable
  L4_112 = _UPVALUE1_
  L5_113 = L1_109
  L2_110 = L2_110(L3_111, L4_112, L5_113)
  L3_111 = _UPVALUE6_
  L3_111 = L3_111.NIL
  if L2_110 == L3_111 then
    L3_111 = _UPVALUE6_
    L3_111 = L3_111.FAILURE
    return L3_111
  end
  L3_111, L4_112, L5_113, L6_114, L7_115, L8_116, L9_117, L10_118, L11_119, L12_120, L13_121, L14_122, L15_123 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L3_111 = L2_110[server_policyTable .. "." .. _UPVALUE3_.policyName]
  L4_112 = L2_110[server_policyTable .. "." .. _UPVALUE3_.policyType]
  L5_113 = L2_110[server_policyTable .. "." .. _UPVALUE3_.policyOwnerName]
  L6_114 = L2_110[server_policyTable .. "." .. _UPVALUE3_.policyDestinationType]
  L7_115 = L2_110[server_policyTable .. "." .. _UPVALUE3_.permission]
  L8_116 = L2_110[server_policyTable .. "." .. _UPVALUE3_.serviceType]
  L9_117 = L2_110[server_policyTable .. "." .. _UPVALUE3_.destination]
  L10_118 = L2_110[server_policyTable .. "." .. _UPVALUE3_.IPAddress]
  L11_119 = L2_110[server_policyTable .. "." .. _UPVALUE3_.maskLength]
  L12_120 = L2_110[server_policyTable .. "." .. _UPVALUE3_.resourceName]
  L13_121 = L2_110[server_policyTable .. "." .. _UPVALUE3_.startPort]
  L14_122 = L2_110[server_policyTable .. "." .. _UPVALUE3_.endPort]
  L15_123 = L2_110[server_policyTable .. "." .. _UPVALUE3_.icmp]
  return _UPVALUE6_.SUCCESS, L1_109, L3_111, L4_112, L5_113, L6_114, L7_115, L8_116, L9_117, L10_118, L11_119, L12_120, L13_121, L14_122, L15_123
end
function sslvpnPolicyGetCur(A0_124)
  local L1_125, L2_126, L3_127, L4_128, L5_129, L6_130, L7_131, L8_132, L9_133, L10_134, L11_135, L12_136, L13_137, L14_138
  L1_125 = db
  L1_125 = L1_125.getRow
  L2_126 = server_policyTable
  L3_127 = _UPVALUE0_
  L4_128 = A0_124
  L1_125 = L1_125(L2_126, L3_127, L4_128)
  L2_126 = _UPVALUE1_
  L2_126 = L2_126.NIL
  if L1_125 == L2_126 then
    L2_126 = _UPVALUE1_
    L2_126 = L2_126.FAILURE
    return L2_126
  end
  L2_126, L3_127, L4_128, L5_129, L6_130, L7_131, L8_132, L9_133, L10_134, L11_135, L12_136, L13_137, L14_138 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L2_126 = L1_125[server_policyTable .. "." .. _UPVALUE2_.policyName]
  L3_127 = L1_125[server_policyTable .. "." .. _UPVALUE2_.policyType]
  L4_128 = L1_125[server_policyTable .. "." .. _UPVALUE2_.policyOwnerName]
  L5_129 = L1_125[server_policyTable .. "." .. _UPVALUE2_.policyDestinationType]
  L6_130 = L1_125[server_policyTable .. "." .. _UPVALUE2_.permission]
  L7_131 = L1_125[server_policyTable .. "." .. _UPVALUE2_.serviceType]
  L8_132 = L1_125[server_policyTable .. "." .. _UPVALUE2_.destination]
  L9_133 = L1_125[server_policyTable .. "." .. _UPVALUE2_.IPAddress]
  L10_134 = L1_125[server_policyTable .. "." .. _UPVALUE2_.maskLength]
  L11_135 = L1_125[server_policyTable .. "." .. _UPVALUE2_.resourceName]
  L12_136 = L1_125[server_policyTable .. "." .. _UPVALUE2_.startPort]
  L13_137 = L1_125[server_policyTable .. "." .. _UPVALUE2_.endPort]
  L14_138 = L1_125[server_policyTable .. "." .. _UPVALUE2_.icmp]
  return _UPVALUE1_.SUCCESS, A0_124, L2_126, L3_127, L4_128, L5_129, L6_130, L7_131, L8_132, L9_133, L10_134, L11_135, L12_136, L13_137, L14_138
end
function sslvpnPolicyGetNext(A0_139)
  local L1_140, L2_141, L3_142, L4_143, L5_144, L6_145, L7_146, L8_147, L9_148, L10_149, L11_150, L12_151, L13_152, L14_153, L15_154
  L1_140 = _UPVALUE0_
  L1_140 = L1_140.NIL
  if A0_139 ~= L1_140 then
    L1_140 = tonumber
    L2_141 = A0_139
    L1_140 = L1_140(L2_141)
    L2_141 = _UPVALUE0_
    L2_141 = L2_141.NIL
  elseif L1_140 == L2_141 then
    L1_140 = _UPVALUE0_
    L1_140 = L1_140.INVALID_ARGUMENT
    return L1_140
  end
  L1_140 = db
  L1_140 = L1_140.existsRow
  L2_141 = server_policyTable
  L3_142 = _UPVALUE1_
  L4_143 = A0_139
  L1_140 = L1_140(L2_141, L3_142, L4_143)
  L2_141 = _UPVALUE0_
  L2_141 = L2_141.FALSE
  if L1_140 == L2_141 then
    L1_140 = _UPVALUE0_
    L1_140 = L1_140.INVALID_ARGUMENT
    return L1_140
  end
  L1_140 = db
  L1_140 = L1_140.getNextRowId
  L2_141 = A0_139
  L3_142 = server_policyTable
  L1_140 = L1_140(L2_141, L3_142)
  L2_141 = _UPVALUE0_
  L2_141 = L2_141.NIL
  if L1_140 == L2_141 then
    L2_141 = _UPVALUE0_
    L2_141 = L2_141.NOT_EXIST
    return L2_141
  end
  L2_141 = db
  L2_141 = L2_141.getRow
  L3_142 = server_policyTable
  L4_143 = _UPVALUE1_
  L5_144 = L1_140
  L2_141 = L2_141(L3_142, L4_143, L5_144)
  L3_142 = _UPVALUE0_
  L3_142 = L3_142.NIL
  if L2_141 == L3_142 then
    L3_142 = _UPVALUE0_
    L3_142 = L3_142.FAILURE
    return L3_142
  end
  L3_142, L4_143, L5_144, L6_145, L7_146, L8_147, L9_148, L10_149, L11_150, L12_151, L13_152, L14_153, L15_154 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L3_142 = L2_141[server_policyTable .. "." .. _UPVALUE2_.policyName]
  L4_143 = L2_141[server_policyTable .. "." .. _UPVALUE2_.policyType]
  L5_144 = L2_141[server_policyTable .. "." .. _UPVALUE2_.policyOwnerName]
  L6_145 = L2_141[server_policyTable .. "." .. _UPVALUE2_.policyDestinationType]
  L7_146 = L2_141[server_policyTable .. "." .. _UPVALUE2_.permission]
  L8_147 = L2_141[server_policyTable .. "." .. _UPVALUE2_.serviceType]
  L9_148 = L2_141[server_policyTable .. "." .. _UPVALUE2_.destination]
  L10_149 = L2_141[server_policyTable .. "." .. _UPVALUE2_.IPAddress]
  L11_150 = L2_141[server_policyTable .. "." .. _UPVALUE2_.maskLength]
  L12_151 = L2_141[server_policyTable .. "." .. _UPVALUE2_.resourceName]
  L13_152 = L2_141[server_policyTable .. "." .. _UPVALUE2_.startPort]
  L14_153 = L2_141[server_policyTable .. "." .. _UPVALUE2_.endPort]
  L15_154 = L2_141[server_policyTable .. "." .. _UPVALUE2_.icmp]
  return _UPVALUE0_.SUCCESS, L1_140, L3_142, L4_143, L5_144, L6_145, L7_146, L8_147, L9_148, L10_149, L11_150, L12_151, L13_152, L14_153, L15_154
end
function sslvpnPolicyGetAll()
  local L0_155, L1_156, L2_157, L3_158
  L0_155 = db
  L0_155 = L0_155.getAttribute
  L1_156 = _UPVALUE0_
  L2_157 = _UPVALUE1_
  L3_158 = _UPVALUE2_
  L0_155 = L0_155(L1_156, L2_157, L3_158, _UPVALUE3_.accessMgmt)
  L1_156 = nil
  L2_157 = _UPVALUE4_
  if L0_155 == L2_157 then
    L2_157 = _UPVALUE5_
    L1_156 = L2_157.SSLVPN_REMOTEMANAGEMENT_DISABLED
  else
    L2_157 = _UPVALUE6_
    L1_156 = L2_157.SUCCESS
  end
  L2_157 = {}
  L3_158 = db
  L3_158 = L3_158.getTable
  L3_158 = L3_158(server_policyTable, false)
  L2_157 = L3_158
  L3_158 = _UPVALUE6_
  L3_158 = L3_158.NIL
  if L2_157 == L3_158 then
    L3_158 = _UPVALUE6_
    L3_158 = L3_158.FAILURE
    return L3_158
  end
  L3_158 = nil
  for _FORV_7_, _FORV_8_ in pairs(L2_157) do
    if tonumber(L2_157[_FORV_7_][_UPVALUE3_.policyDestinationType]) == _UPVALUE7_ then
      L3_158 = L2_157[_FORV_7_][_UPVALUE3_.resourceName]
      L2_157[_FORV_7_][_UPVALUE3_.serviceType] = db.getAttribute(sslvpn_resourceTable, _UPVALUE3_.resourceName, L3_158, _UPVALUE3_.serviceType)
    end
  end
  return L1_156, L2_157
end
function sslvpnPolicySet(A0_159, A1_160, A2_161, A3_162, A4_163, A5_164, A6_165, A7_166, A8_167, A9_168, A10_169, A11_170, A12_171)
  local L13_172, L14_173
  L13_172 = _UPVALUE0_
  L13_172 = L13_172.NIL
  if A0_159 ~= L13_172 then
    L13_172 = tonumber
    L14_173 = A0_159
    L13_172 = L13_172(L14_173)
    L14_173 = _UPVALUE0_
    L14_173 = L14_173.NIL
  elseif L13_172 == L14_173 then
    L13_172 = _UPVALUE0_
    L13_172 = L13_172.INVALID_ARGUMENT
    return L13_172
  end
  L13_172 = db
  L13_172 = L13_172.existsRow
  L14_173 = server_policyTable
  L13_172 = L13_172(L14_173, _UPVALUE1_, A0_159)
  L14_173 = _UPVALUE0_
  L14_173 = L14_173.FALSE
  if L13_172 == L14_173 then
    L13_172 = _UPVALUE0_
    L13_172 = L13_172.INVALID_ARGUMENT
    return L13_172
  end
  L13_172 = nil
  L14_173 = {}
  if A1_160 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L14_173[server_policyTable .. "." .. _UPVALUE2_.policyName] = A1_160
  if A2_161 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A2_161 ~= _UPVALUE3_ and A2_161 ~= _UPVALUE4_ and A2_161 ~= _UPVALUE5_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L14_173[server_policyTable .. "." .. _UPVALUE2_.policyType] = A2_161
  if A2_161 ~= _UPVALUE3_ then
    if A3_162 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    L14_173[server_policyTable .. "." .. _UPVALUE2_.policyOwnerName] = A3_162
  end
  if A4_163 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A4_163) ~= _UPVALUE6_ and tonumber(A4_163) ~= _UPVALUE7_ and tonumber(A4_163) ~= _UPVALUE8_ and tonumber(A4_163) ~= _UPVALUE9_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L14_173[server_policyTable .. "." .. _UPVALUE2_.policyDestinationType] = A4_163
  if A5_164 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A5_164 ~= _UPVALUE10_ and A5_164 ~= _UPVALUE11_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L14_173[server_policyTable .. "." .. _UPVALUE2_.permission] = A5_164
  if tonumber(A4_163) == _UPVALUE7_ or tonumber(A4_163) == _UPVALUE8_ then
    if A7_166 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    L13_172 = _UPVALUE12_.ipAddressCheck("2", A7_166)
    if L13_172 ~= _UPVALUE0_.SUCCESS then
      return _UPVALUE13_.SSLVPN_POLICYADDRESS_INVALID
    end
    L14_173[server_policyTable .. "." .. _UPVALUE2_.IPAddress] = A7_166
  end
  if tonumber(A4_163) == _UPVALUE8_ then
    if A8_167 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    L14_173[server_policyTable .. "." .. _UPVALUE2_.maskLength] = A8_167
  end
  if tonumber(A4_163) == _UPVALUE6_ then
    if A9_168 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if db.existsRow(sslvpn_resourceTable, _UPVALUE2_.resourceName, A9_168) == _UPVALUE0_.FALSE then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    L14_173[server_policyTable .. "." .. _UPVALUE2_.resourceName] = A9_168
  end
  if tonumber(A4_163) ~= _UPVALUE6_ then
    if A6_165 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if A6_165 ~= _UPVALUE14_ and A6_165 ~= _UPVALUE15_ and A6_165 ~= _UPVALUE16_ then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    L14_173[server_policyTable .. "." .. _UPVALUE2_.serviceType] = A6_165
    if A10_169 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if tonumber(A10_169) < _UPVALUE17_ or tonumber(A10_169) > _UPVALUE18_ then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    L14_173[server_policyTable .. "." .. _UPVALUE2_.startPort] = A10_169
  end
  if tonumber(A4_163) ~= _UPVALUE6_ then
    if A11_170 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if tonumber(A11_170) < _UPVALUE17_ or tonumber(A11_170) > _UPVALUE18_ then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    L14_173[server_policyTable .. "." .. _UPVALUE2_.endPort] = A11_170
  end
  if A12_171 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A12_171 ~= _UPVALUE19_ and A12_171 ~= _UPVALUE20_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L14_173[server_policyTable .. "." .. _UPVALUE2_.icmp] = A12_171
  if tonumber(A4_163) == _UPVALUE7_ then
  elseif tonumber(A4_163) == _UPVALUE8_ then
  elseif tonumber(A4_163) == _UPVALUE9_ then
  else
  end
  L14_173[server_policyTable .. "." .. _UPVALUE2_.destinationObject] = A9_168
  if db.update(server_policyTable, L14_173, A0_159) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_159
  end
  return _UPVALUE0_.SUCCESS, A0_159
end
function sslvpnPolicyCreate(A0_174, A1_175, A2_176, A3_177, A4_178, A5_179, A6_180, A7_181, A8_182, A9_183, A10_184, A11_185)
  local L12_186, L13_187, L14_188, L15_189, L16_190, L17_191, L18_192
  L12_186 = db
  L12_186 = L12_186.existsRow
  L13_187 = server_policyTable
  L14_188 = _UPVALUE0_
  L14_188 = L14_188.policyName
  L15_189 = A0_174
  L12_186 = L12_186(L13_187, L14_188, L15_189)
  L13_187 = _UPVALUE1_
  L13_187 = L13_187.FALSE
  if L12_186 ~= L13_187 then
    L12_186 = _UPVALUE2_
    L12_186 = L12_186.POLICY_ALREADY_EXIST
    return L12_186
  end
  L12_186 = nil
  L13_187 = {}
  L14_188 = _UPVALUE1_
  L14_188 = L14_188.NIL
  if A0_174 == L14_188 then
    L14_188 = _UPVALUE1_
    L14_188 = L14_188.INVALID_ARGUMENT
    return L14_188
  end
  L14_188 = server_policyTable
  L15_189 = "."
  L16_190 = _UPVALUE0_
  L16_190 = L16_190.policyName
  L14_188 = L14_188 .. L15_189 .. L16_190
  L13_187[L14_188] = A0_174
  L14_188 = _UPVALUE1_
  L14_188 = L14_188.NIL
  if A1_175 == L14_188 then
    L14_188 = _UPVALUE1_
    L14_188 = L14_188.INVALID_ARGUMENT
    return L14_188
  end
  L14_188 = _UPVALUE3_
  if A1_175 ~= L14_188 then
    L14_188 = _UPVALUE4_
    if A1_175 ~= L14_188 then
      L14_188 = _UPVALUE5_
      if A1_175 ~= L14_188 then
        L14_188 = _UPVALUE1_
        L14_188 = L14_188.INVALID_ARGUMENT
        return L14_188
      end
    end
  end
  L14_188 = server_policyTable
  L15_189 = "."
  L16_190 = _UPVALUE0_
  L16_190 = L16_190.policyType
  L14_188 = L14_188 .. L15_189 .. L16_190
  L13_187[L14_188] = A1_175
  L14_188 = _UPVALUE3_
  if A1_175 ~= L14_188 then
    L14_188 = _UPVALUE1_
    L14_188 = L14_188.NIL
    if A2_176 == L14_188 then
      L14_188 = _UPVALUE1_
      L14_188 = L14_188.INVALID_ARGUMENT
      return L14_188
    end
    L14_188 = server_policyTable
    L15_189 = "."
    L16_190 = _UPVALUE0_
    L16_190 = L16_190.policyOwnerName
    L14_188 = L14_188 .. L15_189 .. L16_190
    L13_187[L14_188] = A2_176
  end
  L14_188 = _UPVALUE1_
  L14_188 = L14_188.NIL
  if A3_177 == L14_188 then
    L14_188 = _UPVALUE1_
    L14_188 = L14_188.INVALID_ARGUMENT
    return L14_188
  end
  L14_188 = tonumber
  L15_189 = A3_177
  L14_188 = L14_188(L15_189)
  L15_189 = _UPVALUE6_
  if L14_188 ~= L15_189 then
    L15_189 = _UPVALUE7_
    if L14_188 ~= L15_189 then
      L15_189 = _UPVALUE8_
      if L14_188 ~= L15_189 then
        L15_189 = _UPVALUE9_
        if L14_188 ~= L15_189 then
          L15_189 = _UPVALUE1_
          L15_189 = L15_189.INVALID_ARGUMENT
          return L15_189
        end
      end
    end
  end
  L15_189 = server_policyTable
  L16_190 = "."
  L17_191 = _UPVALUE0_
  L17_191 = L17_191.policyDestinationType
  L15_189 = L15_189 .. L16_190 .. L17_191
  L13_187[L15_189] = A3_177
  L15_189 = _UPVALUE1_
  L15_189 = L15_189.NIL
  if A4_178 == L15_189 then
    L15_189 = _UPVALUE1_
    L15_189 = L15_189.INVALID_ARGUMENT
    return L15_189
  end
  L15_189 = _UPVALUE10_
  if A4_178 ~= L15_189 then
    L15_189 = _UPVALUE11_
    if A4_178 ~= L15_189 then
      L15_189 = _UPVALUE1_
      L15_189 = L15_189.INVALID_ARGUMENT
      return L15_189
    end
  end
  L15_189 = server_policyTable
  L16_190 = "."
  L17_191 = _UPVALUE0_
  L17_191 = L17_191.permission
  L15_189 = L15_189 .. L16_190 .. L17_191
  L13_187[L15_189] = A4_178
  L15_189 = _UPVALUE7_
  if L14_188 ~= L15_189 then
    L15_189 = _UPVALUE8_
  elseif L14_188 == L15_189 then
    L15_189 = _UPVALUE1_
    L15_189 = L15_189.NIL
    if A6_180 == L15_189 then
      L15_189 = _UPVALUE1_
      L15_189 = L15_189.INVALID_ARGUMENT
      return L15_189
    end
    L15_189 = _UPVALUE12_
    L15_189 = L15_189.ipAddressCheck
    L16_190 = "2"
    L17_191 = A6_180
    L15_189 = L15_189(L16_190, L17_191)
    L12_186 = L15_189
    L15_189 = _UPVALUE1_
    L15_189 = L15_189.SUCCESS
    if L12_186 ~= L15_189 then
      L15_189 = _UPVALUE2_
      L15_189 = L15_189.SSLVPN_POLICYADDRESS_INVALID
      return L15_189
    end
    L15_189 = server_policyTable
    L16_190 = "."
    L17_191 = _UPVALUE0_
    L17_191 = L17_191.IPAddress
    L15_189 = L15_189 .. L16_190 .. L17_191
    L13_187[L15_189] = A6_180
  end
  L15_189 = _UPVALUE8_
  if L14_188 == L15_189 then
    L15_189 = _UPVALUE1_
    L15_189 = L15_189.NIL
    if A7_181 == L15_189 then
      L15_189 = _UPVALUE1_
      L15_189 = L15_189.INVALID_ARGUMENT
      return L15_189
    end
    L15_189 = server_policyTable
    L16_190 = "."
    L17_191 = _UPVALUE0_
    L17_191 = L17_191.maskLength
    L15_189 = L15_189 .. L16_190 .. L17_191
    L13_187[L15_189] = A7_181
  end
  L15_189 = _UPVALUE6_
  if L14_188 == L15_189 then
    L15_189 = _UPVALUE1_
    L15_189 = L15_189.NIL
    if A8_182 == L15_189 then
      L15_189 = _UPVALUE1_
      L15_189 = L15_189.INVALID_ARGUMENT
      return L15_189
    end
    L15_189 = db
    L15_189 = L15_189.existsRow
    L16_190 = sslvpn_resourceTable
    L17_191 = _UPVALUE0_
    L17_191 = L17_191.resourceName
    L18_192 = A8_182
    L15_189 = L15_189(L16_190, L17_191, L18_192)
    L16_190 = _UPVALUE1_
    L16_190 = L16_190.FALSE
    if L15_189 == L16_190 then
      L15_189 = _UPVALUE1_
      L15_189 = L15_189.INVALID_ARGUMENT
      return L15_189
    end
    L15_189 = server_policyTable
    L16_190 = "."
    L17_191 = _UPVALUE0_
    L17_191 = L17_191.resourceName
    L15_189 = L15_189 .. L16_190 .. L17_191
    L13_187[L15_189] = A8_182
    L15_189 = db
    L15_189 = L15_189.getAttribute
    L16_190 = sslvpn_resourceTable
    L17_191 = _UPVALUE0_
    L17_191 = L17_191.resourceName
    L18_192 = A8_182
    L15_189 = L15_189(L16_190, L17_191, L18_192, "UseCount")
    L16_190 = tonumber
    L17_191 = L15_189
    L16_190 = L16_190(L17_191)
    L15_189 = L16_190 + 1
    L16_190 = db
    L16_190 = L16_190.setAttribute
    L17_191 = sslvpn_resourceTable
    L18_192 = _UPVALUE0_
    L18_192 = L18_192.resourceName
    L16_190 = L16_190(L17_191, L18_192, A8_182, "UseCount", L15_189)
  end
  L15_189 = _UPVALUE6_
  if L14_188 ~= L15_189 then
    L15_189 = _UPVALUE1_
    L15_189 = L15_189.NIL
    if A5_179 == L15_189 then
      L15_189 = _UPVALUE1_
      L15_189 = L15_189.INVALID_ARGUMENT
      return L15_189
    end
    L15_189 = _UPVALUE13_
    if A5_179 ~= L15_189 then
      L15_189 = _UPVALUE14_
      if A5_179 ~= L15_189 then
        L15_189 = _UPVALUE15_
        if A5_179 ~= L15_189 then
          L15_189 = _UPVALUE1_
          L15_189 = L15_189.INVALID_ARGUMENT
          return L15_189
        end
      end
    end
    L15_189 = server_policyTable
    L16_190 = "."
    L17_191 = _UPVALUE0_
    L17_191 = L17_191.serviceType
    L15_189 = L15_189 .. L16_190 .. L17_191
    L13_187[L15_189] = A5_179
    L15_189 = _UPVALUE1_
    L15_189 = L15_189.NIL
    if A9_183 == L15_189 then
      L15_189 = _UPVALUE1_
      L15_189 = L15_189.INVALID_ARGUMENT
      return L15_189
    end
    L15_189 = tonumber
    L16_190 = A9_183
    L15_189 = L15_189(L16_190)
    L16_190 = _UPVALUE16_
    if not (L15_189 < L16_190) then
      L16_190 = _UPVALUE17_
    elseif L15_189 > L16_190 then
      L16_190 = _UPVALUE1_
      L16_190 = L16_190.INVALID_ARGUMENT
      return L16_190
    end
    L16_190 = server_policyTable
    L17_191 = "."
    L18_192 = _UPVALUE0_
    L18_192 = L18_192.startPort
    L16_190 = L16_190 .. L17_191 .. L18_192
    L13_187[L16_190] = A9_183
  end
  L15_189 = _UPVALUE6_
  if L14_188 ~= L15_189 then
    L15_189 = _UPVALUE1_
    L15_189 = L15_189.NIL
    if A10_184 == L15_189 then
      L15_189 = _UPVALUE1_
      L15_189 = L15_189.INVALID_ARGUMENT
      return L15_189
    end
    L15_189 = tonumber
    L16_190 = A10_184
    L15_189 = L15_189(L16_190)
    L16_190 = _UPVALUE16_
    if not (L15_189 < L16_190) then
      L16_190 = _UPVALUE17_
    elseif L15_189 > L16_190 then
      L16_190 = _UPVALUE1_
      L16_190 = L16_190.INVALID_ARGUMENT
      return L16_190
    end
    L16_190 = server_policyTable
    L17_191 = "."
    L18_192 = _UPVALUE0_
    L18_192 = L18_192.endPort
    L16_190 = L16_190 .. L17_191 .. L18_192
    L13_187[L16_190] = A10_184
  end
  L15_189 = _UPVALUE1_
  L15_189 = L15_189.NIL
  if A11_185 == L15_189 then
    L15_189 = _UPVALUE1_
    L15_189 = L15_189.INVALID_ARGUMENT
    return L15_189
  end
  L15_189 = _UPVALUE18_
  if A11_185 ~= L15_189 then
    L15_189 = _UPVALUE19_
    if A11_185 ~= L15_189 then
      L15_189 = _UPVALUE1_
      L15_189 = L15_189.INVALID_ARGUMENT
      return L15_189
    end
  end
  L15_189 = server_policyTable
  L16_190 = "."
  L17_191 = _UPVALUE0_
  L17_191 = L17_191.icmp
  L15_189 = L15_189 .. L16_190 .. L17_191
  L13_187[L15_189] = A11_185
  L15_189 = nil
  L16_190 = _UPVALUE7_
  if L14_188 == L16_190 then
    L16_190 = A6_180
    L17_191 = ":"
    L18_192 = A9_183
    L15_189 = L16_190 .. L17_191 .. L18_192 .. "-" .. A10_184
  else
    L16_190 = _UPVALUE8_
    if L14_188 == L16_190 then
      L16_190 = A6_180
      L17_191 = "/"
      L18_192 = A7_181
      L15_189 = L16_190 .. L17_191 .. L18_192 .. ":" .. A9_183 .. "-" .. A10_184
    else
      L16_190 = _UPVALUE9_
      if L14_188 == L16_190 then
        L16_190 = "0.0.0.0"
        L17_191 = "/"
        L18_192 = A9_183
        L15_189 = L16_190 .. L17_191 .. L18_192 .. "-" .. A10_184
      else
        L15_189 = A8_182
      end
    end
  end
  L16_190 = server_policyTable
  L17_191 = "."
  L18_192 = _UPVALUE0_
  L18_192 = L18_192.destinationObject
  L16_190 = L16_190 .. L17_191 .. L18_192
  L13_187[L16_190] = L15_189
  L16_190 = db
  L16_190 = L16_190.getTable
  L17_191 = server_policyTable
  L16_190 = L16_190(L17_191)
  if L16_190 ~= nil then
    L17_191 = #L16_190
    L18_192 = _UPVALUE20_
    if L17_191 >= L18_192 then
      L17_191 = _UPVALUE1_
      L17_191 = L17_191.MAX_LIMIT_REACHED
      return L17_191
    end
  end
  L17_191 = db
  L17_191 = L17_191.insert
  L18_192 = server_policyTable
  L17_191 = L17_191(L18_192, L13_187)
  L18_192 = _UPVALUE1_
  L18_192 = L18_192.NIL
  if L17_191 == L18_192 then
    L18_192 = _UPVALUE1_
    L18_192 = L18_192.FAILURE
    return L18_192
  end
  L18_192 = db
  L18_192 = L18_192.getAttribute
  L18_192 = L18_192(server_policyTable, _UPVALUE0_.policyName, A0_174, _UPVALUE21_)
  return _UPVALUE1_.SUCCESS, L18_192
end
function sslvpnPolicyDelete(A0_193)
  local L1_194, L2_195
  L1_194 = _UPVALUE0_
  L1_194 = L1_194.NIL
  if A0_193 ~= L1_194 then
    L1_194 = tonumber
    L2_195 = A0_193
    L1_194 = L1_194(L2_195)
    L2_195 = _UPVALUE0_
    L2_195 = L2_195.NIL
  elseif L1_194 == L2_195 then
    L1_194 = _UPVALUE0_
    L1_194 = L1_194.INVALID_ARGUMENT
    return L1_194
  end
  L1_194 = db
  L1_194 = L1_194.existsRow
  L2_195 = server_policyTable
  L1_194 = L1_194(L2_195, _UPVALUE1_, A0_193)
  L2_195 = _UPVALUE0_
  L2_195 = L2_195.FALSE
  if L1_194 == L2_195 then
    L1_194 = _UPVALUE0_
    L1_194 = L1_194.INVALID_ARGUMENT
    return L1_194
  end
  L1_194 = db
  L1_194 = L1_194.getAttribute
  L2_195 = server_policyTable
  L1_194 = L1_194(L2_195, _UPVALUE1_, A0_193, _UPVALUE2_.resourceName)
  L2_195 = _UPVALUE0_
  L2_195 = L2_195.NIL
  if L1_194 ~= L2_195 then
    L2_195 = db
    L2_195 = L2_195.getAttribute
    L2_195 = L2_195(sslvpn_resourceTable, _UPVALUE2_.resourceName, L1_194, "UseCount")
    L2_195 = tonumber(L2_195) - 1
  end
  L2_195 = db
  L2_195 = L2_195.deleteRow
  L2_195 = L2_195(server_policyTable, _UPVALUE1_, A0_193)
  if L2_195 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_193
  end
  return _UPVALUE0_.SUCCESS, A0_193
end
function sslvpnPolicyDeleteAll()
  local L0_196, L1_197
  L0_196 = {}
  L1_197 = db
  L1_197 = L1_197.getTable
  L1_197 = L1_197(server_policyTable, false)
  for _FORV_5_, _FORV_6_ in pairs(L1_197) do
    if L1_197[_FORV_5_].ResourceName ~= _UPVALUE0_.NIL then
    end
  end
  L0_196 = db.deleteAllRows(server_policyTable)
  if not L0_196 then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
