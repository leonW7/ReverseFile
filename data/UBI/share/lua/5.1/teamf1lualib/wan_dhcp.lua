local L0_0
L0_0 = module
L0_0("com.teamf1.core.wan.dhcp", package.seeall)
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
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).wanPort = "LogicalIfName"
;({}).ipAddress = "ipAddress"
;({}).gateway = "nextHopGateway"
;({}).networkMask = "subnetMask"
;({}).useIspDns = "GetDnsFromIsp"
;({}).primaryDNS = "PrimaryDns"
;({}).secondaryDNS = "SecondaryDns"
;({}).hostName = "HostName"
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
function ipAddressGet()
  local L0_14, L1_15
  L0_14 = _UPVALUE0_
  L1_15 = db
  L1_15 = L1_15.getAttribute
  L1_15 = L1_15(_UPVALUE1_, _UPVALUE2_, L0_14, _UPVALUE3_.ipAddress)
  if L1_15 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_14, L1_15
end
function ipAddressGetNext(A0_16)
  local L1_17, L2_18
  L1_17 = _UPVALUE0_
  if A0_16 ~= L1_17 then
    L1_17 = _UPVALUE1_
    L1_17 = L1_17.NOT_EXIST
    return L1_17
  end
  L1_17 = _UPVALUE2_
  L2_18 = db
  L2_18 = L2_18.getAttribute
  L2_18 = L2_18(_UPVALUE3_, _UPVALUE4_, L1_17, _UPVALUE5_.ipAddress)
  if L2_18 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE, L1_17
  end
  return _UPVALUE1_.SUCCESS, L1_17, L2_18
end
function ipAddressSet(A0_19, A1_20)
  local L3_21
  L3_21 = _UPVALUE0_
  L3_21 = L3_21.NOT_SUPPORTED
  return L3_21, A0_19
end
function gatewayGet()
  local L0_22, L1_23
  L0_22 = _UPVALUE0_
  L1_23 = db
  L1_23 = L1_23.getAttribute
  L1_23 = L1_23(_UPVALUE1_, _UPVALUE2_, L0_22, _UPVALUE3_.gateway)
  if L1_23 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_22, L1_23
end
function gatewayGetNext(A0_24)
  local L1_25, L2_26
  L1_25 = _UPVALUE0_
  if A0_24 ~= L1_25 then
    L1_25 = _UPVALUE1_
    L1_25 = L1_25.NOT_EXIST
    return L1_25
  end
  L1_25 = _UPVALUE2_
  L2_26 = db
  L2_26 = L2_26.getAttribute
  L2_26 = L2_26(_UPVALUE3_, _UPVALUE4_, L1_25, _UPVALUE5_.gateway)
  if L2_26 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE, L1_25
  end
  return _UPVALUE1_.SUCCESS, L1_25, L2_26
end
function gatewaySet(A0_27, A1_28)
  local L3_29
  L3_29 = _UPVALUE0_
  L3_29 = L3_29.NOT_SUPPORTED
  return L3_29, A0_27
end
function networkMaskGet()
  local L0_30, L1_31
  L0_30 = _UPVALUE0_
  L1_31 = db
  L1_31 = L1_31.getAttribute
  L1_31 = L1_31(_UPVALUE1_, _UPVALUE2_, L0_30, _UPVALUE3_.networkMask)
  if L1_31 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_30, L1_31
end
function networkMaskGetNext(A0_32)
  local L1_33, L2_34
  L1_33 = _UPVALUE0_
  if A0_32 ~= L1_33 then
    L1_33 = _UPVALUE1_
    L1_33 = L1_33.NOT_EXIST
    return L1_33
  end
  L1_33 = _UPVALUE2_
  L2_34 = db
  L2_34 = L2_34.getAttribute
  L2_34 = L2_34(_UPVALUE3_, _UPVALUE4_, L1_33, _UPVALUE5_.networkMask)
  if L2_34 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE, L1_33
  end
  return _UPVALUE1_.SUCCESS, L1_33, L2_34
end
function networkMaskSet(A0_35, A1_36)
  local L3_37
  L3_37 = _UPVALUE0_
  L3_37 = L3_37.NOT_SUPPORTED
  return L3_37, A0_35
end
function isuseIspDnsEnabled()
  local L0_38, L1_39
  L0_38 = db
  L0_38 = L0_38.getNextRowId
  L1_39 = _UPVALUE0_
  L0_38 = L0_38(L1_39, _UPVALUE1_)
  L1_39 = _UPVALUE2_
  L1_39 = L1_39.NIL
  if L0_38 == L1_39 then
    L1_39 = _UPVALUE2_
    L1_39 = L1_39.NOT_EXIST
    return L1_39
  end
  L1_39 = db
  L1_39 = L1_39.getAttribute
  L1_39 = L1_39(_UPVALUE1_, _UPVALUE3_, L0_38, _UPVALUE4_.useIspDns)
  if L1_39 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_38, L1_39
end
function isuseIspDnsEnabledNext(A0_40)
  local L1_41, L2_42
  L1_41 = _UPVALUE0_
  L1_41 = L1_41.NIL
  if A0_40 == L1_41 then
    L1_41 = _UPVALUE0_
    L1_41 = L1_41.INVALID_ARGUMENT
    return L1_41
  end
  L1_41 = tonumber
  L2_42 = A0_40
  L1_41 = L1_41(L2_42)
  L2_42 = _UPVALUE0_
  L2_42 = L2_42.NIL
  if L1_41 == L2_42 then
    L1_41 = _UPVALUE0_
    L1_41 = L1_41.INVALID_ARGUMENT
    return L1_41
  end
  L1_41 = db
  L1_41 = L1_41.existsRow
  L2_42 = _UPVALUE1_
  L1_41 = L1_41(L2_42, _UPVALUE2_, A0_40)
  L2_42 = _UPVALUE0_
  L2_42 = L2_42.FALSE
  if L1_41 == L2_42 then
    L1_41 = _UPVALUE0_
    L1_41 = L1_41.NOT_EXIST
    return L1_41
  end
  L1_41 = nil
  L2_42 = db
  L2_42 = L2_42.getNextRowId
  L2_42 = L2_42(A0_40, _UPVALUE1_)
  L1_41 = L2_42
  L2_42 = _UPVALUE0_
  L2_42 = L2_42.NIL
  if L1_41 == L2_42 then
    L2_42 = _UPVALUE0_
    L2_42 = L2_42.NOT_EXIST
    return L2_42
  end
  L2_42 = db
  L2_42 = L2_42.getAttribute
  L2_42 = L2_42(_UPVALUE1_, _UPVALUE2_, L1_41, _UPVALUE3_.useIspDns)
  if L2_42 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_41
  end
  return _UPVALUE0_.SUCCESS, L1_41, L2_42
end
function useIspDnsEnable(A0_43)
  local L1_44
  L1_44 = _UPVALUE0_
  L1_44 = L1_44.NIL
  if A0_43 == L1_44 then
    L1_44 = _UPVALUE0_
    L1_44 = L1_44.INVALID_ARGUMENT
    return L1_44
  end
  L1_44 = tonumber
  L1_44 = L1_44(A0_43)
  if L1_44 == _UPVALUE0_.NIL then
    L1_44 = _UPVALUE0_
    L1_44 = L1_44.INVALID_ARGUMENT
    return L1_44
  end
  L1_44 = db
  L1_44 = L1_44.existsRow
  L1_44 = L1_44(_UPVALUE1_, _UPVALUE2_, A0_43)
  if L1_44 == _UPVALUE0_.FALSE then
    L1_44 = _UPVALUE0_
    L1_44 = L1_44.NOT_EXIST
    return L1_44
  end
  L1_44 = nil
  L1_44 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_43, _UPVALUE3_.useIspDns, _UPVALUE4_)
  if L1_44 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_43
  end
  return _UPVALUE0_.SUCCESS, A0_43
end
function useIspDnsDisable(A0_45)
  local L1_46
  L1_46 = _UPVALUE0_
  L1_46 = L1_46.NIL
  if A0_45 == L1_46 then
    L1_46 = _UPVALUE0_
    L1_46 = L1_46.INVALID_ARGUMENT
    return L1_46
  end
  L1_46 = tonumber
  L1_46 = L1_46(A0_45)
  if L1_46 == _UPVALUE0_.NIL then
    L1_46 = _UPVALUE0_
    L1_46 = L1_46.INVALID_ARGUMENT
    return L1_46
  end
  L1_46 = db
  L1_46 = L1_46.existsRow
  L1_46 = L1_46(_UPVALUE1_, _UPVALUE2_, A0_45)
  if L1_46 == _UPVALUE0_.FALSE then
    L1_46 = _UPVALUE0_
    L1_46 = L1_46.NOT_EXIST
    return L1_46
  end
  L1_46 = nil
  L1_46 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_45, _UPVALUE3_.useIspDns, _UPVALUE4_)
  if L1_46 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_45
  end
  return _UPVALUE0_.SUCCESS, A0_45
end
function primaryDNSGet()
  local L0_47, L1_48
  L0_47 = db
  L0_47 = L0_47.getNextRowId
  L1_48 = _UPVALUE0_
  L0_47 = L0_47(L1_48, _UPVALUE1_)
  L1_48 = _UPVALUE2_
  L1_48 = L1_48.NIL
  if L0_47 == L1_48 then
    L1_48 = _UPVALUE2_
    L1_48 = L1_48.NOT_EXIST
    return L1_48
  end
  L1_48 = db
  L1_48 = L1_48.getAttribute
  L1_48 = L1_48(_UPVALUE1_, _UPVALUE3_, L0_47, _UPVALUE4_.primaryDNS)
  if L1_48 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_47, L1_48
end
function primaryDNSGetNext(A0_49)
  local L1_50, L2_51
  L1_50 = _UPVALUE0_
  L1_50 = L1_50.NIL
  if A0_49 == L1_50 then
    L1_50 = _UPVALUE0_
    L1_50 = L1_50.INVALID_ARGUMENT
    return L1_50
  end
  L1_50 = tonumber
  L2_51 = A0_49
  L1_50 = L1_50(L2_51)
  L2_51 = _UPVALUE0_
  L2_51 = L2_51.NIL
  if L1_50 == L2_51 then
    L1_50 = _UPVALUE0_
    L1_50 = L1_50.INVALID_ARGUMENT
    return L1_50
  end
  L1_50 = db
  L1_50 = L1_50.existsRow
  L2_51 = _UPVALUE1_
  L1_50 = L1_50(L2_51, _UPVALUE2_, A0_49)
  L2_51 = _UPVALUE0_
  L2_51 = L2_51.FALSE
  if L1_50 == L2_51 then
    L1_50 = _UPVALUE0_
    L1_50 = L1_50.NOT_EXIST
    return L1_50
  end
  L1_50 = nil
  L2_51 = db
  L2_51 = L2_51.getNextRowId
  L2_51 = L2_51(A0_49, _UPVALUE1_)
  L1_50 = L2_51
  L2_51 = _UPVALUE0_
  L2_51 = L2_51.NIL
  if L1_50 == L2_51 then
    L2_51 = _UPVALUE0_
    L2_51 = L2_51.NOT_EXIST
    return L2_51
  end
  L2_51 = db
  L2_51 = L2_51.getAttribute
  L2_51 = L2_51(_UPVALUE1_, _UPVALUE2_, L1_50, _UPVALUE3_.primaryDNS)
  if L2_51 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_50
  end
  return _UPVALUE0_.SUCCESS, L1_50, L2_51
end
function primaryDNSSet(A0_52, A1_53)
  local L2_54, L3_55
  L2_54 = db
  L2_54 = L2_54.getAttribute
  L3_55 = _UPVALUE0_
  L2_54 = L2_54(L3_55, _UPVALUE1_, A0_52, _UPVALUE2_.useIspDns)
  L3_55 = tonumber
  L3_55 = L3_55(L2_54)
  if L3_55 ~= _UPVALUE3_ then
    L3_55 = _UPVALUE4_
    L3_55 = L3_55.DEPENDENCY_NOT_MET
    return L3_55
  end
  L3_55 = _UPVALUE4_
  L3_55 = L3_55.NIL
  if A0_52 == L3_55 then
    L3_55 = _UPVALUE4_
    L3_55 = L3_55.INVALID_ARGUMENT
    return L3_55
  end
  L3_55 = tonumber
  L3_55 = L3_55(A0_52)
  if L3_55 == _UPVALUE4_.NIL then
    L3_55 = _UPVALUE4_
    L3_55 = L3_55.INVALID_ARGUMENT
    return L3_55
  end
  L3_55 = db
  L3_55 = L3_55.existsRow
  L3_55 = L3_55(_UPVALUE0_, _UPVALUE1_, A0_52)
  if L3_55 == _UPVALUE4_.FALSE then
    L3_55 = _UPVALUE4_
    L3_55 = L3_55.NOT_EXIST
    return L3_55
  end
  L3_55 = _UPVALUE4_
  L3_55 = L3_55.NIL
  if A1_53 == L3_55 then
    L3_55 = _UPVALUE4_
    L3_55 = L3_55.INVALID_ARGUMENT
    return L3_55
  end
  L3_55 = _UPVALUE5_
  L3_55 = L3_55.ipAddressCheck
  L3_55 = L3_55(_UPVALUE6_, A1_53)
  valid = L3_55
  L3_55 = valid
  if L3_55 ~= _UPVALUE4_.SUCCESS then
    L3_55 = _UPVALUE4_
    L3_55 = L3_55.INVALID_ARGUMENT
    return L3_55
  end
  L3_55 = nil
  L3_55 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, A0_52, _UPVALUE2_.primaryDNS, A1_53)
  if L3_55 == _UPVALUE4_.FALSE then
    return _UPVALUE4_.FAILURE, A0_52
  end
  return _UPVALUE4_.SUCCESS, A0_52
end
function secondaryDNSGet()
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
  L1_57 = L1_57(_UPVALUE1_, _UPVALUE3_, L0_56, _UPVALUE4_.secondaryDNS)
  if L1_57 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_56, L1_57
end
function secondaryDNSGetNext(A0_58)
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
  L2_60 = L2_60(_UPVALUE1_, _UPVALUE2_, L1_59, _UPVALUE3_.secondaryDNS)
  if L2_60 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_59
  end
  return _UPVALUE0_.SUCCESS, L1_59, L2_60
end
function secondaryDNSSet(A0_61, A1_62)
  local L2_63, L3_64
  L2_63 = db
  L2_63 = L2_63.getAttribute
  L3_64 = _UPVALUE0_
  L2_63 = L2_63(L3_64, _UPVALUE1_, A0_61, _UPVALUE2_.useIspDns)
  L3_64 = tonumber
  L3_64 = L3_64(L2_63)
  if L3_64 ~= _UPVALUE3_ then
    L3_64 = _UPVALUE4_
    L3_64 = L3_64.DEPENDENCY_NOT_MET
    return L3_64
  end
  L3_64 = _UPVALUE4_
  L3_64 = L3_64.NIL
  if A0_61 == L3_64 then
    L3_64 = _UPVALUE4_
    L3_64 = L3_64.INVALID_ARGUMENT
    return L3_64
  end
  L3_64 = tonumber
  L3_64 = L3_64(A0_61)
  if L3_64 == _UPVALUE4_.NIL then
    L3_64 = _UPVALUE4_
    L3_64 = L3_64.INVALID_ARGUMENT
    return L3_64
  end
  L3_64 = db
  L3_64 = L3_64.existsRow
  L3_64 = L3_64(_UPVALUE0_, _UPVALUE1_, A0_61)
  if L3_64 == _UPVALUE4_.FALSE then
    L3_64 = _UPVALUE4_
    L3_64 = L3_64.NOT_EXIST
    return L3_64
  end
  L3_64 = _UPVALUE4_
  L3_64 = L3_64.NIL
  if A1_62 == L3_64 then
    L3_64 = _UPVALUE4_
    L3_64 = L3_64.INVALID_ARGUMENT
    return L3_64
  end
  L3_64 = _UPVALUE5_
  L3_64 = L3_64.ipAddressCheck
  L3_64 = L3_64(_UPVALUE6_, A1_62)
  valid = L3_64
  L3_64 = valid
  if L3_64 ~= _UPVALUE4_.SUCCESS then
    L3_64 = _UPVALUE4_
    L3_64 = L3_64.INVALID_ARGUMENT
    return L3_64
  end
  L3_64 = nil
  L3_64 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, A0_61, _UPVALUE2_.secondaryDNS, A1_62)
  if L3_64 == _UPVALUE4_.FALSE then
    return _UPVALUE4_.FAILURE, A0_61
  end
  return _UPVALUE4_.SUCCESS, A0_61
end
function hostNameGet()
  local L0_65, L1_66
  L0_65 = db
  L0_65 = L0_65.getNextRowId
  L1_66 = _UPVALUE0_
  L0_65 = L0_65(L1_66, _UPVALUE1_)
  L1_66 = _UPVALUE2_
  L1_66 = L1_66.NIL
  if L0_65 == L1_66 then
    L1_66 = _UPVALUE2_
    L1_66 = L1_66.NOT_EXIST
    return L1_66
  end
  L1_66 = db
  L1_66 = L1_66.getAttribute
  L1_66 = L1_66(_UPVALUE1_, _UPVALUE3_, L0_65, _UPVALUE4_.hostName)
  if L1_66 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_65, L1_66
end
function hostNameGetNext(A0_67)
  local L1_68, L2_69
  L1_68 = _UPVALUE0_
  L1_68 = L1_68.NIL
  if A0_67 == L1_68 then
    L1_68 = _UPVALUE0_
    L1_68 = L1_68.INVALID_ARGUMENT
    return L1_68
  end
  L1_68 = tonumber
  L2_69 = A0_67
  L1_68 = L1_68(L2_69)
  L2_69 = _UPVALUE0_
  L2_69 = L2_69.NIL
  if L1_68 == L2_69 then
    L1_68 = _UPVALUE0_
    L1_68 = L1_68.INVALID_ARGUMENT
    return L1_68
  end
  L1_68 = db
  L1_68 = L1_68.existsRow
  L2_69 = _UPVALUE1_
  L1_68 = L1_68(L2_69, _UPVALUE2_, A0_67)
  L2_69 = _UPVALUE0_
  L2_69 = L2_69.FALSE
  if L1_68 == L2_69 then
    L1_68 = _UPVALUE0_
    L1_68 = L1_68.NOT_EXIST
    return L1_68
  end
  L1_68 = nil
  L2_69 = db
  L2_69 = L2_69.getNextRowId
  L2_69 = L2_69(A0_67, _UPVALUE1_)
  L1_68 = L2_69
  L2_69 = _UPVALUE0_
  L2_69 = L2_69.NIL
  if L1_68 == L2_69 then
    L2_69 = _UPVALUE0_
    L2_69 = L2_69.NOT_EXIST
    return L2_69
  end
  L2_69 = db
  L2_69 = L2_69.getAttribute
  L2_69 = L2_69(_UPVALUE1_, _UPVALUE2_, L1_68, _UPVALUE3_.hostName)
  if L2_69 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_68
  end
  return _UPVALUE0_.SUCCESS, L1_68, L2_69
end
function hostNameSet(A0_70, A1_71)
  local L2_72
  L2_72 = _UPVALUE0_
  L2_72 = L2_72.NIL
  if A0_70 == L2_72 then
    L2_72 = _UPVALUE0_
    L2_72 = L2_72.INVALID_ARGUMENT
    return L2_72
  end
  L2_72 = tonumber
  L2_72 = L2_72(A0_70)
  if L2_72 == _UPVALUE0_.NIL then
    L2_72 = _UPVALUE0_
    L2_72 = L2_72.INVALID_ARGUMENT
    return L2_72
  end
  L2_72 = db
  L2_72 = L2_72.existsRow
  L2_72 = L2_72(_UPVALUE1_, _UPVALUE2_, A0_70)
  if L2_72 == _UPVALUE0_.FALSE then
    L2_72 = _UPVALUE0_
    L2_72 = L2_72.NOT_EXIST
    return L2_72
  end
  L2_72 = _UPVALUE0_
  L2_72 = L2_72.NIL
  if A1_71 == L2_72 then
    L2_72 = _UPVALUE0_
    L2_72 = L2_72.INVALID_ARGUMENT
    return L2_72
  end
  L2_72 = _UPVALUE3_
  L2_72 = L2_72.stringLengthCheck
  L2_72 = L2_72(_UPVALUE4_, _UPVALUE5_, A1_71)
  if L2_72 == _UPVALUE0_.FAILURE then
    L2_72 = _UPVALUE0_
    L2_72 = L2_72.INVALID_ARGUMENT
    return L2_72
  end
  L2_72 = nil
  L2_72 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_70, _UPVALUE6_.hostName, A1_71)
  if L2_72 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_70
  end
  return _UPVALUE0_.SUCCESS, A0_70
end
function dhcpGet()
  local L0_73, L1_74, L2_75, L3_76, L4_77, L5_78, L6_79, L7_80, L8_81, L9_82, L10_83, L11_84
  L0_73 = db
  L0_73 = L0_73.getNextRowId
  L1_74 = _UPVALUE0_
  L2_75 = _UPVALUE1_
  L0_73 = L0_73(L1_74, L2_75)
  L1_74 = _UPVALUE2_
  L1_74 = L1_74.NIL
  if L0_73 == L1_74 then
    L1_74 = _UPVALUE2_
    L1_74 = L1_74.NOT_EXIST
    return L1_74
  end
  L1_74 = {}
  L2_75 = {}
  L3_76 = {}
  L4_77 = db
  L4_77 = L4_77.getRow
  L5_78 = _UPVALUE1_
  L6_79 = _UPVALUE3_
  L7_80 = L0_73
  L4_77 = L4_77(L5_78, L6_79, L7_80)
  L1_74 = L4_77
  L4_77 = db
  L4_77 = L4_77.getRow
  L5_78 = _UPVALUE4_
  L6_79 = _UPVALUE3_
  L7_80 = _UPVALUE5_
  L4_77 = L4_77(L5_78, L6_79, L7_80)
  L2_75 = L4_77
  L4_77 = db
  L4_77 = L4_77.getRow
  L5_78 = _UPVALUE6_
  L6_79 = _UPVALUE3_
  L7_80 = _UPVALUE7_
  L4_77 = L4_77(L5_78, L6_79, L7_80)
  L3_76 = L4_77
  L4_77 = _UPVALUE2_
  L4_77 = L4_77.NIL
  if L1_74 ~= L4_77 then
    L4_77 = _UPVALUE2_
    L4_77 = L4_77.NIL
    if L2_75 ~= L4_77 then
      L4_77 = _UPVALUE2_
      L4_77 = L4_77.NIL
    end
  elseif L3_76 == L4_77 then
    L4_77 = _UPVALUE2_
    L4_77 = L4_77.FAILURE
    L5_78 = L0_73
    return L4_77, L5_78
  end
  L4_77 = _UPVALUE1_
  L5_78 = "."
  L6_79 = _UPVALUE8_
  L6_79 = L6_79.wanPort
  L4_77 = L4_77 .. L5_78 .. L6_79
  L4_77 = L1_74[L4_77]
  L5_78 = _UPVALUE4_
  L6_79 = "."
  L7_80 = _UPVALUE8_
  L7_80 = L7_80.ipAddress
  L5_78 = L5_78 .. L6_79 .. L7_80
  L5_78 = L2_75[L5_78]
  L6_79 = _UPVALUE6_
  L7_80 = "."
  L8_81 = _UPVALUE8_
  L8_81 = L8_81.gateway
  L6_79 = L6_79 .. L7_80 .. L8_81
  L6_79 = L3_76[L6_79]
  L7_80 = _UPVALUE4_
  L8_81 = "."
  L9_82 = _UPVALUE8_
  L9_82 = L9_82.networkMask
  L7_80 = L7_80 .. L8_81 .. L9_82
  L7_80 = L2_75[L7_80]
  L8_81 = _UPVALUE1_
  L9_82 = "."
  L10_83 = _UPVALUE8_
  L10_83 = L10_83.useIspDns
  L8_81 = L8_81 .. L9_82 .. L10_83
  L8_81 = L1_74[L8_81]
  L9_82 = _UPVALUE1_
  L10_83 = "."
  L11_84 = _UPVALUE8_
  L11_84 = L11_84.primaryDNS
  L9_82 = L9_82 .. L10_83 .. L11_84
  L9_82 = L1_74[L9_82]
  L10_83 = _UPVALUE1_
  L11_84 = "."
  L10_83 = L10_83 .. L11_84 .. _UPVALUE8_.secondaryDNS
  L10_83 = L1_74[L10_83]
  L11_84 = _UPVALUE1_
  L11_84 = L11_84 .. "." .. _UPVALUE8_.hostName
  L11_84 = L1_74[L11_84]
  return _UPVALUE2_.SUCCESS, L0_73, L4_77, L5_78, L6_79, L7_80, L8_81, L9_82, L10_83, L11_84
end
function dhcpGetNext(A0_85)
  local L1_86, L2_87, L3_88, L4_89, L5_90, L6_91, L7_92, L8_93, L9_94, L10_95, L11_96, L12_97
  L1_86 = _UPVALUE0_
  L1_86 = L1_86.NIL
  if A0_85 == L1_86 then
    L1_86 = _UPVALUE0_
    L1_86 = L1_86.INVALID_ARGUMENT
    return L1_86
  end
  L1_86 = tonumber
  L2_87 = A0_85
  L1_86 = L1_86(L2_87)
  L2_87 = _UPVALUE0_
  L2_87 = L2_87.NIL
  if L1_86 == L2_87 then
    L1_86 = _UPVALUE0_
    L1_86 = L1_86.INVALID_ARGUMENT
    return L1_86
  end
  L1_86 = db
  L1_86 = L1_86.existsRow
  L2_87 = _UPVALUE1_
  L3_88 = _UPVALUE2_
  L4_89 = A0_85
  L1_86 = L1_86(L2_87, L3_88, L4_89)
  L2_87 = _UPVALUE0_
  L2_87 = L2_87.FALSE
  if L1_86 == L2_87 then
    L1_86 = _UPVALUE0_
    L1_86 = L1_86.NOT_EXIST
    return L1_86
  end
  L1_86 = nil
  L2_87 = db
  L2_87 = L2_87.getNextRowId
  L3_88 = A0_85
  L4_89 = _UPVALUE1_
  L2_87 = L2_87(L3_88, L4_89)
  L1_86 = L2_87
  L2_87 = _UPVALUE0_
  L2_87 = L2_87.NIL
  if L1_86 == L2_87 then
    L2_87 = _UPVALUE0_
    L2_87 = L2_87.NOT_EXIST
    return L2_87
  end
  L2_87 = {}
  L3_88 = {}
  L4_89 = {}
  L5_90 = db
  L5_90 = L5_90.getRow
  L6_91 = _UPVALUE1_
  L7_92 = _UPVALUE2_
  L8_93 = L1_86
  L5_90 = L5_90(L6_91, L7_92, L8_93)
  L2_87 = L5_90
  L5_90 = db
  L5_90 = L5_90.getRow
  L6_91 = _UPVALUE3_
  L7_92 = _UPVALUE2_
  L8_93 = _UPVALUE4_
  L5_90 = L5_90(L6_91, L7_92, L8_93)
  L3_88 = L5_90
  L5_90 = db
  L5_90 = L5_90.getRow
  L6_91 = _UPVALUE5_
  L7_92 = _UPVALUE2_
  L8_93 = _UPVALUE6_
  L5_90 = L5_90(L6_91, L7_92, L8_93)
  L4_89 = L5_90
  L5_90 = _UPVALUE0_
  L5_90 = L5_90.NIL
  if L2_87 ~= L5_90 then
    L5_90 = _UPVALUE0_
    L5_90 = L5_90.NIL
    if L3_88 ~= L5_90 then
      L5_90 = _UPVALUE0_
      L5_90 = L5_90.NIL
    end
  elseif L4_89 == L5_90 then
    L5_90 = _UPVALUE0_
    L5_90 = L5_90.FAILURE
    L6_91 = L1_86
    return L5_90, L6_91
  end
  L5_90 = _UPVALUE1_
  L6_91 = "."
  L7_92 = _UPVALUE7_
  L7_92 = L7_92.wanPort
  L5_90 = L5_90 .. L6_91 .. L7_92
  L5_90 = L2_87[L5_90]
  L6_91 = _UPVALUE3_
  L7_92 = "."
  L8_93 = _UPVALUE7_
  L8_93 = L8_93.ipAddress
  L6_91 = L6_91 .. L7_92 .. L8_93
  L6_91 = L3_88[L6_91]
  L7_92 = _UPVALUE5_
  L8_93 = "."
  L9_94 = _UPVALUE7_
  L9_94 = L9_94.gateway
  L7_92 = L7_92 .. L8_93 .. L9_94
  L7_92 = L4_89[L7_92]
  L8_93 = _UPVALUE3_
  L9_94 = "."
  L10_95 = _UPVALUE7_
  L10_95 = L10_95.networkMask
  L8_93 = L8_93 .. L9_94 .. L10_95
  L8_93 = L3_88[L8_93]
  L9_94 = _UPVALUE1_
  L10_95 = "."
  L11_96 = _UPVALUE7_
  L11_96 = L11_96.useIspDns
  L9_94 = L9_94 .. L10_95 .. L11_96
  L9_94 = L2_87[L9_94]
  L10_95 = _UPVALUE1_
  L11_96 = "."
  L12_97 = _UPVALUE7_
  L12_97 = L12_97.primaryDNS
  L10_95 = L10_95 .. L11_96 .. L12_97
  L10_95 = L2_87[L10_95]
  L11_96 = _UPVALUE1_
  L12_97 = "."
  L11_96 = L11_96 .. L12_97 .. _UPVALUE7_.secondaryDNS
  L11_96 = L2_87[L11_96]
  L12_97 = _UPVALUE1_
  L12_97 = L12_97 .. "." .. _UPVALUE7_.hostName
  L12_97 = L2_87[L12_97]
  return _UPVALUE0_.SUCCESS, L1_86, L5_90, L6_91, L7_92, L8_93, L9_94, L10_95, L11_96, L12_97
end
function dhcpSet(A0_98, A1_99, A2_100, A3_101, A4_102)
  local L5_103, L6_104, L7_105
  L5_103 = {}
  L6_104 = _UPVALUE0_
  L6_104 = L6_104.NIL
  if A0_98 == L6_104 then
    L6_104 = _UPVALUE0_
    L6_104 = L6_104.INVALID_ARGUMENT
    return L6_104
  end
  L6_104 = _UPVALUE1_
  if A0_98 ~= L6_104 then
    L6_104 = _UPVALUE2_
    if A0_98 ~= L6_104 then
      L6_104 = _UPVALUE3_
      if A0_98 ~= L6_104 then
        L6_104 = _UPVALUE0_
        L6_104 = L6_104.INVALID_ARGUMENT
        return L6_104
      end
    end
  end
  L6_104 = _UPVALUE0_
  L6_104 = L6_104.NIL
  if A1_99 == L6_104 then
    L6_104 = _UPVALUE0_
    L6_104 = L6_104.INVALID_ARGUMENT
    return L6_104
  end
  L6_104 = _UPVALUE4_
  L6_104 = L6_104.isBoolean
  L7_105 = A1_99
  L6_104 = L6_104(L7_105)
  valid = L6_104
  L6_104 = valid
  L7_105 = _UPVALUE0_
  L7_105 = L7_105.SUCCESS
  if L6_104 ~= L7_105 then
    L6_104 = _UPVALUE0_
    L6_104 = L6_104.INVALID_ARGUMENT
    return L6_104
  end
  L6_104 = _UPVALUE5_
  L7_105 = "."
  L6_104 = L6_104 .. L7_105 .. _UPVALUE6_.useIspDns
  L5_103[L6_104] = A1_99
  L6_104 = tonumber
  L7_105 = A1_99
  L6_104 = L6_104(L7_105)
  L7_105 = _UPVALUE7_
  if L6_104 == L7_105 then
    L6_104 = _UPVALUE0_
    L6_104 = L6_104.NIL
    if A2_100 == L6_104 then
      L6_104 = _UPVALUE0_
      L6_104 = L6_104.INVALID_ARGUMENT
      return L6_104
    end
    L6_104 = _UPVALUE4_
    L6_104 = L6_104.ipAddressCheck
    L7_105 = _UPVALUE8_
    L6_104 = L6_104(L7_105, A2_100)
    valid = L6_104
    L6_104 = valid
    L7_105 = _UPVALUE0_
    L7_105 = L7_105.SUCCESS
    if L6_104 ~= L7_105 then
      L6_104 = _UPVALUE9_
      L6_104 = L6_104.WAN_DHCP_INVALID_PRIMARY_DNS
      return L6_104
    end
    L6_104 = _UPVALUE5_
    L7_105 = "."
    L6_104 = L6_104 .. L7_105 .. _UPVALUE6_.primaryDNS
    L5_103[L6_104] = A2_100
    L6_104 = _UPVALUE0_
    L6_104 = L6_104.NIL
    if A3_101 == L6_104 then
      L6_104 = _UPVALUE0_
      L6_104 = L6_104.INVALID_ARGUMENT
      return L6_104
    end
    L6_104 = _UPVALUE4_
    L6_104 = L6_104.ipAddressCheck
    L7_105 = _UPVALUE8_
    L6_104 = L6_104(L7_105, A3_101)
    valid = L6_104
    L6_104 = valid
    L7_105 = _UPVALUE0_
    L7_105 = L7_105.SUCCESS
    if L6_104 ~= L7_105 then
      L6_104 = _UPVALUE9_
      L6_104 = L6_104.WAN_DHCP_INVALID_SECONDARY_DNS
      return L6_104
    end
    L6_104 = _UPVALUE5_
    L7_105 = "."
    L6_104 = L6_104 .. L7_105 .. _UPVALUE6_.secondaryDNS
    L5_103[L6_104] = A3_101
  end
  L6_104 = _UPVALUE0_
  L6_104 = L6_104.NIL
  if A4_102 ~= L6_104 and A4_102 ~= "" then
    L6_104 = _UPVALUE4_
    L6_104 = L6_104.stringLengthCheck
    L7_105 = _UPVALUE10_
    L6_104 = L6_104(L7_105, _UPVALUE11_, A4_102)
    L7_105 = _UPVALUE0_
    L7_105 = L7_105.FAILURE
    if L6_104 == L7_105 then
      L6_104 = _UPVALUE0_
      L6_104 = L6_104.INVALID_ARGUMENT
      return L6_104
    end
  else
    A4_102 = ""
  end
  L6_104 = _UPVALUE5_
  L7_105 = "."
  L6_104 = L6_104 .. L7_105 .. _UPVALUE6_.hostName
  L5_103[L6_104] = A4_102
  L6_104 = db
  L6_104 = L6_104.getAttribute
  L7_105 = _UPVALUE5_
  L6_104 = L6_104(L7_105, _UPVALUE6_.wanPort, A0_98, _UPVALUE12_)
  L7_105 = nil
  L7_105 = db.update(_UPVALUE5_, L5_103, L6_104)
  if L7_105 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L6_104
  end
  return _UPVALUE0_.SUCCESS, L6_104
end
function dhcpIpGroupCreate(A0_106, A1_107, A2_108)
  local L4_109, L5_110
  L4_109 = _UPVALUE0_
  L4_109 = L4_109.NOT_SUPPORTED
  L5_110 = 0
  return L4_109, L5_110, 0
end
function dhcpIpGroupDelete(A0_111)
  local L2_112, L3_113
  L2_112 = _UPVALUE0_
  L2_112 = L2_112.NOT_SUPPORTED
  L3_113 = 0
  return L2_112, L3_113, 0
end
