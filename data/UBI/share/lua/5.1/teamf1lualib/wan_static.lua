local L0_0
L0_0 = module
L0_0("com.teamf1.core.wan.static", package.seeall)
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
;({}).addressFamily = "AddressFamily"
;({}).ipAddress = "StaticIp"
;({}).gateway = "Gateway"
;({}).networkMask = "NetMask"
;({}).primaryDNS = "PrimaryDns"
;({}).secondaryDNS = "SecondaryDns"
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
  L0_1 = _UPVALUE0_
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(_UPVALUE1_, _UPVALUE2_, L0_1, _UPVALUE3_.wanPort)
  if L1_2 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_1, L1_2
end
function wanPortGetNext(A0_3)
  local L1_4, L2_5
  L1_4 = _UPVALUE0_
  if A0_3 ~= L1_4 then
    L1_4 = _UPVALUE1_
    L1_4 = L1_4.INVALID_ARGUMENT
    return L1_4
  end
  L1_4 = _UPVALUE2_
  L2_5 = db
  L2_5 = L2_5.getAttribute
  L2_5 = L2_5(_UPVALUE3_, _UPVALUE4_, L1_4, _UPVALUE5_.wanPort)
  if L2_5 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE, L1_4
  end
  return _UPVALUE1_.SUCCESS, L1_4, L2_5
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
    L1_17 = L1_17.INVALID_ARGUMENT
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
  local L2_21
  L2_21 = _UPVALUE0_
  if A0_19 ~= L2_21 then
    L2_21 = _UPVALUE1_
    if A0_19 ~= L2_21 then
      L2_21 = _UPVALUE2_
      L2_21 = L2_21.INVALID_ARGUMENT
      return L2_21
    end
  end
  L2_21 = _UPVALUE2_
  L2_21 = L2_21.NIL
  if A1_20 == L2_21 then
    L2_21 = _UPVALUE2_
    L2_21 = L2_21.INVALID_ARGUMENT
    return L2_21
  end
  L2_21 = _UPVALUE3_
  L2_21 = L2_21.ipAddressCheck
  L2_21 = L2_21(_UPVALUE4_, A1_20)
  valid = L2_21
  L2_21 = valid
  if L2_21 ~= _UPVALUE2_.SUCCESS then
    L2_21 = _UPVALUE2_
    L2_21 = L2_21.INVALID_ARGUMENT
    return L2_21
  end
  L2_21 = nil
  L2_21 = db.setAttribute(_UPVALUE5_, _UPVALUE6_, A0_19, _UPVALUE7_.ipAddress, A1_20)
  if L2_21 == _UPVALUE2_.FALSE then
    return _UPVALUE2_.FAILURE, A0_19
  end
  return _UPVALUE2_.SUCCESS, A0_19
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
    L1_25 = L1_25.INVALID_ARGUMENT
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
  local L2_29
  L2_29 = _UPVALUE0_
  if A0_27 ~= L2_29 then
    L2_29 = _UPVALUE1_
    if A0_27 ~= L2_29 then
      L2_29 = _UPVALUE2_
      L2_29 = L2_29.INVALID_ARGUMENT
      return L2_29
    end
  end
  L2_29 = _UPVALUE2_
  L2_29 = L2_29.NIL
  if A1_28 == L2_29 then
    L2_29 = _UPVALUE2_
    L2_29 = L2_29.INVALID_ARGUMENT
    return L2_29
  end
  L2_29 = _UPVALUE3_
  L2_29 = L2_29.ipAddressCheck
  L2_29 = L2_29(_UPVALUE4_, A1_28)
  valid = L2_29
  L2_29 = valid
  if L2_29 ~= _UPVALUE2_.SUCCESS then
    L2_29 = _UPVALUE2_
    L2_29 = L2_29.INVALID_ARGUMENT
    return L2_29
  end
  L2_29 = nil
  L2_29 = db.setAttribute(_UPVALUE5_, _UPVALUE6_, A0_27, _UPVALUE7_.gateway, A1_28)
  if L2_29 == _UPVALUE2_.FALSE then
    return _UPVALUE2_.FAILURE, A0_27
  end
  return _UPVALUE2_.SUCCESS, A0_27
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
    L1_33 = L1_33.INVALID_ARGUMENT
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
  local L2_37
  L2_37 = _UPVALUE0_
  if A0_35 ~= L2_37 then
    L2_37 = _UPVALUE1_
    if A0_35 ~= L2_37 then
      L2_37 = _UPVALUE2_
      L2_37 = L2_37.INVALID_ARGUMENT
      return L2_37
    end
  end
  L2_37 = _UPVALUE2_
  L2_37 = L2_37.NIL
  if A1_36 == L2_37 then
    L2_37 = _UPVALUE2_
    L2_37 = L2_37.INVALID_ARGUMENT
    return L2_37
  end
  L2_37 = _UPVALUE3_
  L2_37 = L2_37.ipAddressCheck
  L2_37 = L2_37(_UPVALUE4_, A1_36)
  valid = L2_37
  L2_37 = valid
  if L2_37 ~= _UPVALUE2_.SUCCESS then
    L2_37 = _UPVALUE2_
    L2_37 = L2_37.INVALID_ARGUMENT
    return L2_37
  end
  L2_37 = nil
  L2_37 = db.setAttribute(_UPVALUE5_, _UPVALUE6_, A0_35, _UPVALUE7_.networkMask, A1_36)
  if L2_37 == _UPVALUE2_.FALSE then
    return _UPVALUE2_.FAILURE, A0_35
  end
  return _UPVALUE2_.SUCCESS, A0_35
end
function primaryDNSGet()
  local L0_38, L1_39
  L0_38 = _UPVALUE0_
  L1_39 = db
  L1_39 = L1_39.getAttribute
  L1_39 = L1_39(_UPVALUE1_, _UPVALUE2_, L0_38, _UPVALUE3_.primaryDNS)
  if L1_39 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_38, L1_39
end
function primaryDNSGetNext(A0_40)
  local L1_41, L2_42
  L1_41 = _UPVALUE0_
  if A0_40 ~= L1_41 then
    L1_41 = _UPVALUE1_
    L1_41 = L1_41.INVALID_ARGUMENT
    return L1_41
  end
  L1_41 = _UPVALUE2_
  L2_42 = db
  L2_42 = L2_42.getAttribute
  L2_42 = L2_42(_UPVALUE3_, _UPVALUE4_, L1_41, _UPVALUE5_.primaryDNS)
  if L2_42 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE, L1_41
  end
  return _UPVALUE1_.SUCCESS, L1_41, L2_42
end
function primaryDNSSet(A0_43, A1_44)
  local L2_45
  L2_45 = _UPVALUE0_
  if A0_43 ~= L2_45 then
    L2_45 = _UPVALUE1_
    if A0_43 ~= L2_45 then
      L2_45 = _UPVALUE2_
      L2_45 = L2_45.INVALID_ARGUMENT
      return L2_45
    end
  end
  L2_45 = _UPVALUE2_
  L2_45 = L2_45.NIL
  if A1_44 == L2_45 then
    L2_45 = _UPVALUE2_
    L2_45 = L2_45.INVALID_ARGUMENT
    return L2_45
  end
  L2_45 = _UPVALUE3_
  L2_45 = L2_45.ipAddressCheck
  L2_45 = L2_45(_UPVALUE4_, A1_44)
  valid = L2_45
  L2_45 = valid
  if L2_45 ~= _UPVALUE2_.SUCCESS then
    L2_45 = _UPVALUE2_
    L2_45 = L2_45.INVALID_ARGUMENT
    return L2_45
  end
  L2_45 = nil
  L2_45 = db.setAttribute(_UPVALUE5_, _UPVALUE6_, A0_43, _UPVALUE7_.primaryDNS, A1_44)
  if L2_45 == _UPVALUE2_.FALSE then
    return _UPVALUE2_.FAILURE, A0_43
  end
  return _UPVALUE2_.SUCCESS, A0_43
end
function secondaryDNSGet()
  local L0_46, L1_47
  L0_46 = _UPVALUE0_
  L1_47 = db
  L1_47 = L1_47.getAttribute
  L1_47 = L1_47(_UPVALUE1_, _UPVALUE2_, L0_46, _UPVALUE3_.secondaryDNS)
  if L1_47 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_46, L1_47
end
function secondaryDNSGetNext(A0_48)
  local L1_49, L2_50
  L1_49 = _UPVALUE0_
  if A0_48 ~= L1_49 then
    L1_49 = _UPVALUE1_
    L1_49 = L1_49.INVALID_ARGUMENT
    return L1_49
  end
  L1_49 = _UPVALUE2_
  L2_50 = db
  L2_50 = L2_50.getAttribute
  L2_50 = L2_50(_UPVALUE3_, _UPVALUE4_, L1_49, _UPVALUE5_.secondaryDNS)
  if L2_50 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE, L1_49
  end
  return _UPVALUE1_.SUCCESS, L1_49, L2_50
end
function secondaryDNSSet(A0_51, A1_52)
  local L2_53
  L2_53 = _UPVALUE0_
  if A0_51 ~= L2_53 then
    L2_53 = _UPVALUE1_
    if A0_51 ~= L2_53 then
      L2_53 = _UPVALUE2_
      L2_53 = L2_53.INVALID_ARGUMENT
      return L2_53
    end
  end
  L2_53 = _UPVALUE2_
  L2_53 = L2_53.NIL
  if A1_52 == L2_53 then
    L2_53 = _UPVALUE2_
    L2_53 = L2_53.INVALID_ARGUMENT
    return L2_53
  end
  L2_53 = _UPVALUE3_
  L2_53 = L2_53.ipAddressCheck
  L2_53 = L2_53(_UPVALUE4_, A1_52)
  valid = L2_53
  L2_53 = valid
  if L2_53 ~= _UPVALUE2_.SUCCESS then
    L2_53 = _UPVALUE2_
    L2_53 = L2_53.INVALID_ARGUMENT
    return L2_53
  end
  L2_53 = nil
  L2_53 = db.setAttribute(_UPVALUE5_, _UPVALUE6_, A0_51, _UPVALUE7_.secondaryDNS, A1_52)
  if L2_53 == _UPVALUE2_.FALSE then
    return _UPVALUE2_.FAILURE, A0_51
  end
  return _UPVALUE2_.SUCCESS, A0_51
end
function staticIpGroupGet()
  local L0_54, L1_55, L2_56, L3_57, L4_58, L5_59, L6_60, L7_61
  L0_54 = _UPVALUE0_
  L1_55 = {}
  L2_56 = db
  L2_56 = L2_56.getRow
  L3_57 = _UPVALUE1_
  L4_58 = _UPVALUE2_
  L5_59 = L0_54
  L2_56 = L2_56(L3_57, L4_58, L5_59)
  L1_55 = L2_56
  L2_56 = _UPVALUE3_
  L2_56 = L2_56.NIL
  if L1_55 == L2_56 then
    L2_56 = _UPVALUE3_
    L2_56 = L2_56.FAILURE
    L3_57 = L0_54
    return L2_56, L3_57
  end
  L2_56 = _UPVALUE1_
  L3_57 = "."
  L4_58 = _UPVALUE4_
  L4_58 = L4_58.wanPort
  L2_56 = L2_56 .. L3_57 .. L4_58
  L2_56 = L1_55[L2_56]
  L3_57 = _UPVALUE1_
  L4_58 = "."
  L5_59 = _UPVALUE4_
  L5_59 = L5_59.ipAddress
  L3_57 = L3_57 .. L4_58 .. L5_59
  L3_57 = L1_55[L3_57]
  L4_58 = _UPVALUE1_
  L5_59 = "."
  L6_60 = _UPVALUE4_
  L6_60 = L6_60.gateway
  L4_58 = L4_58 .. L5_59 .. L6_60
  L4_58 = L1_55[L4_58]
  L5_59 = _UPVALUE1_
  L6_60 = "."
  L7_61 = _UPVALUE4_
  L7_61 = L7_61.networkMask
  L5_59 = L5_59 .. L6_60 .. L7_61
  L5_59 = L1_55[L5_59]
  L6_60 = _UPVALUE1_
  L7_61 = "."
  L6_60 = L6_60 .. L7_61 .. _UPVALUE4_.primaryDNS
  L6_60 = L1_55[L6_60]
  L7_61 = _UPVALUE1_
  L7_61 = L7_61 .. "." .. _UPVALUE4_.secondaryDNS
  L7_61 = L1_55[L7_61]
  return _UPVALUE3_.SUCCESS, L0_54, L2_56, L3_57, L4_58, L5_59, L6_60, L7_61
end
function staticGroupGet(A0_62, A1_63)
  local L2_64, L3_65, L4_66, L5_67, L6_68, L7_69, L8_70, L9_71, L10_72
  L2_64 = _UPVALUE0_
  L2_64 = L2_64.NIL
  if A0_62 == L2_64 then
    L2_64 = _UPVALUE0_
    L2_64 = L2_64.INVALID_ARGUMENT
    return L2_64
  end
  L2_64 = _UPVALUE0_
  L2_64 = L2_64.NIL
  if A1_63 == L2_64 then
    L2_64 = _UPVALUE0_
    L2_64 = L2_64.INVALID_ARGUMENT
    return L2_64
  end
  L2_64 = _UPVALUE1_
  if A0_62 ~= L2_64 then
    L2_64 = _UPVALUE2_
    if A0_62 ~= L2_64 then
      L2_64 = _UPVALUE0_
      L2_64 = L2_64.INVALID_ARGUMENT
      return L2_64
    end
  end
  L2_64 = _UPVALUE3_
  if A1_63 ~= L2_64 then
    L2_64 = _UPVALUE4_
    if A1_63 ~= L2_64 then
      L2_64 = _UPVALUE0_
      L2_64 = L2_64.INVALID_ARGUMENT
      return L2_64
    end
  end
  L2_64 = _UPVALUE5_
  L2_64 = L2_64.wanPort
  L3_65 = " = '"
  L4_66 = A0_62
  L5_67 = "' AND "
  L6_68 = _UPVALUE5_
  L6_68 = L6_68.addressFamily
  L7_69 = " = '"
  L8_70 = A1_63
  L9_71 = "'"
  L2_64 = L2_64 .. L3_65 .. L4_66 .. L5_67 .. L6_68 .. L7_69 .. L8_70 .. L9_71
  L3_65 = nil
  L4_66 = db
  L4_66 = L4_66.getAttributeWhere
  L5_67 = _UPVALUE6_
  L6_68 = L2_64
  L7_69 = _UPVALUE7_
  L4_66 = L4_66(L5_67, L6_68, L7_69)
  L3_65 = L4_66
  L4_66 = _UPVALUE0_
  L4_66 = L4_66.NIL
  if L3_65 == L4_66 then
    L4_66 = _UPVALUE0_
    L4_66 = L4_66.NOT_EXIST
    return L4_66
  end
  L4_66 = {}
  L5_67 = db
  L5_67 = L5_67.getRow
  L6_68 = _UPVALUE6_
  L7_69 = _UPVALUE7_
  L8_70 = L3_65
  L5_67 = L5_67(L6_68, L7_69, L8_70)
  L4_66 = L5_67
  L5_67 = _UPVALUE0_
  L5_67 = L5_67.NIL
  if L4_66 == L5_67 then
    L5_67 = _UPVALUE0_
    L5_67 = L5_67.FAILURE
    L6_68 = L3_65
    return L5_67, L6_68
  end
  L5_67 = _UPVALUE6_
  L6_68 = "."
  L7_69 = _UPVALUE5_
  L7_69 = L7_69.wanPort
  L5_67 = L5_67 .. L6_68 .. L7_69
  L5_67 = L4_66[L5_67]
  L6_68 = _UPVALUE6_
  L7_69 = "."
  L8_70 = _UPVALUE5_
  L8_70 = L8_70.ipAddress
  L6_68 = L6_68 .. L7_69 .. L8_70
  L6_68 = L4_66[L6_68]
  L7_69 = _UPVALUE6_
  L8_70 = "."
  L9_71 = _UPVALUE5_
  L9_71 = L9_71.gateway
  L7_69 = L7_69 .. L8_70 .. L9_71
  L7_69 = L4_66[L7_69]
  L8_70 = _UPVALUE6_
  L9_71 = "."
  L10_72 = _UPVALUE5_
  L10_72 = L10_72.networkMask
  L8_70 = L8_70 .. L9_71 .. L10_72
  L8_70 = L4_66[L8_70]
  L9_71 = _UPVALUE6_
  L10_72 = "."
  L9_71 = L9_71 .. L10_72 .. _UPVALUE5_.primaryDNS
  L9_71 = L4_66[L9_71]
  L10_72 = _UPVALUE6_
  L10_72 = L10_72 .. "." .. _UPVALUE5_.secondaryDNS
  L10_72 = L4_66[L10_72]
  return _UPVALUE0_.SUCCESS, L3_65, L5_67, L6_68, L7_69, L8_70, L9_71, L10_72
end
function staticIpGroupGetNext(A0_73)
  local L1_74, L2_75, L3_76, L4_77, L5_78, L6_79, L7_80, L8_81
  L1_74 = _UPVALUE0_
  if A0_73 ~= L1_74 then
    L1_74 = _UPVALUE1_
    L1_74 = L1_74.INVALID_ARGUMENT
    return L1_74
  end
  L1_74 = _UPVALUE2_
  L2_75 = {}
  L3_76 = db
  L3_76 = L3_76.getRow
  L4_77 = _UPVALUE3_
  L5_78 = _UPVALUE4_
  L6_79 = L1_74
  L3_76 = L3_76(L4_77, L5_78, L6_79)
  L2_75 = L3_76
  L3_76 = _UPVALUE1_
  L3_76 = L3_76.NIL
  if L2_75 == L3_76 then
    L3_76 = _UPVALUE1_
    L3_76 = L3_76.FAILURE
    L4_77 = L1_74
    return L3_76, L4_77
  end
  L3_76 = _UPVALUE3_
  L4_77 = "."
  L5_78 = _UPVALUE5_
  L5_78 = L5_78.wanPort
  L3_76 = L3_76 .. L4_77 .. L5_78
  L3_76 = L2_75[L3_76]
  L4_77 = _UPVALUE3_
  L5_78 = "."
  L6_79 = _UPVALUE5_
  L6_79 = L6_79.ipAddress
  L4_77 = L4_77 .. L5_78 .. L6_79
  L4_77 = L2_75[L4_77]
  L5_78 = _UPVALUE3_
  L6_79 = "."
  L7_80 = _UPVALUE5_
  L7_80 = L7_80.gateway
  L5_78 = L5_78 .. L6_79 .. L7_80
  L5_78 = L2_75[L5_78]
  L6_79 = _UPVALUE3_
  L7_80 = "."
  L8_81 = _UPVALUE5_
  L8_81 = L8_81.networkMask
  L6_79 = L6_79 .. L7_80 .. L8_81
  L6_79 = L2_75[L6_79]
  L7_80 = _UPVALUE3_
  L8_81 = "."
  L7_80 = L7_80 .. L8_81 .. _UPVALUE5_.primaryDNS
  L7_80 = L2_75[L7_80]
  L8_81 = _UPVALUE3_
  L8_81 = L8_81 .. "." .. _UPVALUE5_.secondaryDNS
  L8_81 = L2_75[L8_81]
  return _UPVALUE1_.SUCCESS, L1_74, L3_76, L4_77, L5_78, L6_79, L7_80, L8_81
end
function staticIpGroupSet(A0_82, A1_83, A2_84, A3_85, A4_86, A5_87)
  local L6_88, L7_89, L8_90, L9_91
  L6_88 = {}
  L7_89 = _UPVALUE0_
  L7_89 = L7_89.NIL
  if A0_82 == L7_89 then
    L7_89 = _UPVALUE0_
    L7_89 = L7_89.INVALID_ARGUMENT
    return L7_89
  end
  L7_89 = _UPVALUE1_
  if A0_82 ~= L7_89 then
    L7_89 = _UPVALUE2_
    if A0_82 ~= L7_89 then
      L7_89 = _UPVALUE0_
      L7_89 = L7_89.INVALID_ARGUMENT
      return L7_89
    end
  end
  L7_89 = _UPVALUE0_
  L7_89 = L7_89.NIL
  if A1_83 == L7_89 then
    L7_89 = _UPVALUE0_
    L7_89 = L7_89.INVALID_ARGUMENT
    return L7_89
  end
  L7_89 = _UPVALUE3_
  L7_89 = L7_89.ipAddressCheck
  L8_90 = _UPVALUE4_
  L9_91 = A1_83
  L7_89 = L7_89(L8_90, L9_91)
  valid = L7_89
  L7_89 = valid
  L8_90 = _UPVALUE0_
  L8_90 = L8_90.SUCCESS
  if L7_89 ~= L8_90 then
    L7_89 = _UPVALUE5_
    L7_89 = L7_89.WAN_STATIC_INVALID_STATIC_IP
    return L7_89
  end
  L7_89 = _UPVALUE6_
  L8_90 = "."
  L9_91 = _UPVALUE7_
  L9_91 = L9_91.ipAddress
  L7_89 = L7_89 .. L8_90 .. L9_91
  L6_88[L7_89] = A1_83
  L7_89 = _UPVALUE0_
  L7_89 = L7_89.NIL
  if A2_84 == L7_89 then
    L7_89 = _UPVALUE0_
    L7_89 = L7_89.INVALID_ARGUMENT
    return L7_89
  end
  L7_89 = _UPVALUE3_
  L7_89 = L7_89.ipAddressCheck
  L8_90 = _UPVALUE4_
  L9_91 = A2_84
  L7_89 = L7_89(L8_90, L9_91)
  valid = L7_89
  L7_89 = valid
  L8_90 = _UPVALUE0_
  L8_90 = L8_90.SUCCESS
  if L7_89 ~= L8_90 then
    L7_89 = _UPVALUE5_
    L7_89 = L7_89.WAN_STATIC_INVALID_GATEWAY
    return L7_89
  end
  L7_89 = _UPVALUE6_
  L8_90 = "."
  L9_91 = _UPVALUE7_
  L9_91 = L9_91.gateway
  L7_89 = L7_89 .. L8_90 .. L9_91
  L6_88[L7_89] = A2_84
  L7_89 = _UPVALUE0_
  L7_89 = L7_89.NIL
  if A3_85 == L7_89 then
    L7_89 = _UPVALUE0_
    L7_89 = L7_89.INVALID_ARGUMENT
    return L7_89
  end
  L7_89 = _UPVALUE3_
  L7_89 = L7_89.ipAddressCheck
  L8_90 = _UPVALUE4_
  L9_91 = A3_85
  L7_89 = L7_89(L8_90, L9_91)
  valid = L7_89
  L7_89 = valid
  L8_90 = _UPVALUE0_
  L8_90 = L8_90.SUCCESS
  if L7_89 ~= L8_90 then
    L7_89 = _UPVALUE5_
    L7_89 = L7_89.WAN_STATIC_INVALID_NETMASK
    return L7_89
  end
  L7_89 = _UPVALUE6_
  L8_90 = "."
  L9_91 = _UPVALUE7_
  L9_91 = L9_91.networkMask
  L7_89 = L7_89 .. L8_90 .. L9_91
  L6_88[L7_89] = A3_85
  L7_89 = _UPVALUE3_
  L7_89 = L7_89.ipv4DualMaskCheck
  L8_90 = A1_83
  L9_91 = A3_85
  L7_89 = L7_89(L8_90, L9_91, A2_84, A3_85)
  valid = L7_89
  L7_89 = valid
  L8_90 = _UPVALUE0_
  L8_90 = L8_90.SUCCESS
  if L7_89 ~= L8_90 then
    L7_89 = _UPVALUE5_
    L7_89 = L7_89.GATEWAY_NOT_IN_SAME_SUBNET
    return L7_89
  end
  L7_89 = staticIpSubnetCheck
  L8_90 = A0_82
  L9_91 = A1_83
  L7_89 = L7_89(L8_90, L9_91, A3_85)
  valid = L7_89
  L7_89 = valid
  L8_90 = _UPVALUE0_
  L8_90 = L8_90.SUCCESS
  if L7_89 ~= L8_90 then
    L7_89 = valid
    return L7_89
  end
  L7_89 = _UPVALUE0_
  L7_89 = L7_89.NIL
  if A4_86 == L7_89 then
    L7_89 = _UPVALUE0_
    L7_89 = L7_89.INVALID_ARGUMENT
    return L7_89
  end
  L7_89 = _UPVALUE3_
  L7_89 = L7_89.ipAddressCheck
  L8_90 = _UPVALUE4_
  L9_91 = A4_86
  L7_89 = L7_89(L8_90, L9_91)
  valid = L7_89
  L7_89 = valid
  L8_90 = _UPVALUE0_
  L8_90 = L8_90.SUCCESS
  if L7_89 ~= L8_90 then
    L7_89 = _UPVALUE5_
    L7_89 = L7_89.WAN_STATIC_INVALID_PRIMARY_DNS
    return L7_89
  end
  L7_89 = _UPVALUE6_
  L8_90 = "."
  L9_91 = _UPVALUE7_
  L9_91 = L9_91.primaryDNS
  L7_89 = L7_89 .. L8_90 .. L9_91
  L6_88[L7_89] = A4_86
  L7_89 = _UPVALUE0_
  L7_89 = L7_89.NIL
  if A5_87 == L7_89 then
    L7_89 = _UPVALUE0_
    L7_89 = L7_89.INVALID_ARGUMENT
    return L7_89
  end
  L7_89 = _UPVALUE3_
  L7_89 = L7_89.ipAddressCheck
  L8_90 = _UPVALUE4_
  L9_91 = A5_87
  L7_89 = L7_89(L8_90, L9_91)
  valid = L7_89
  L7_89 = valid
  L8_90 = _UPVALUE0_
  L8_90 = L8_90.SUCCESS
  if L7_89 ~= L8_90 then
    L7_89 = _UPVALUE5_
    L7_89 = L7_89.WAN_STATIC_INVALID_SECONDARY_DNS
    return L7_89
  end
  L7_89 = _UPVALUE6_
  L8_90 = "."
  L9_91 = _UPVALUE7_
  L9_91 = L9_91.secondaryDNS
  L7_89 = L7_89 .. L8_90 .. L9_91
  L6_88[L7_89] = A5_87
  L7_89 = _UPVALUE7_
  L7_89 = L7_89.wanPort
  L8_90 = " = '"
  L9_91 = A0_82
  L7_89 = L7_89 .. L8_90 .. L9_91 .. "' AND " .. _UPVALUE7_.addressFamily .. " = '" .. _UPVALUE8_ .. "'"
  L8_90 = nil
  L9_91 = db
  L9_91 = L9_91.getAttributeWhere
  L9_91 = L9_91(_UPVALUE6_, L7_89, _UPVALUE9_)
  L8_90 = L9_91
  L9_91 = nil
  L9_91 = db.update(_UPVALUE6_, L6_88, L8_90)
  if L9_91 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L8_90
  end
  return _UPVALUE0_.SUCCESS, L8_90
end
function staticIpGroupCreate(A0_92, A1_93, A2_94, A3_95, A4_96, A5_97)
  local L7_98, L8_99
  L7_98 = _UPVALUE0_
  L7_98 = L7_98.NOT_SUPPORTED
  L8_99 = 0
  return L7_98, L8_99, 0
end
function staticIpGroupDelete(A0_100)
  local L2_101, L3_102
  L2_101 = _UPVALUE0_
  L2_101 = L2_101.NOT_SUPPORTED
  L3_102 = 0
  return L2_101, L3_102, 0
end
function staticIpSubnetCheck(A0_103, A1_104, A2_105)
  local L3_106, L4_107, L5_108, L6_109, L7_110, L8_111, L9_112, L10_113, L11_114, L12_115, L13_116, L14_117, L15_118, L16_119, L17_120, L18_121, L19_122
  L13_116 = _UPVALUE0_
  L14_117 = _UPVALUE1_
  L14_117 = L14_117.vlanGet
  L15_118 = L13_116
  L8_111, L10_113, L11_114, L12_115, L14_117 = nil, nil, nil, nil, L14_117(L15_118)
  L8_111, L10_113, L11_114, L12_115, L15_118 = nil, nil, nil, nil, L14_117(L15_118)
  L8_111, L10_113, L11_114, L12_115, L16_119 = nil, nil, nil, nil, L14_117(L15_118)
  L8_111, L10_113, L11_114, L12_115, L17_120 = nil, nil, nil, nil, L14_117(L15_118)
  L8_111, L10_113, L11_114, L12_115, L18_121 = nil, nil, nil, nil, L14_117(L15_118)
  L8_111, L10_113, L11_114, L12_115, L19_122 = nil, nil, nil, nil, L14_117(L15_118)
  L4_107 = L19_122
  L7_110 = L18_121
  L6_109 = L17_120
  L5_108 = L16_119
  L9_112 = L15_118
  L3_106 = L14_117
  L14_117 = _UPVALUE2_
  L14_117 = L14_117.SUCCESS
  if L3_106 ~= L14_117 then
    L14_117 = _UPVALUE3_
    L14_117 = L14_117.SUBNET_CHECK_FAILED
    return L14_117
  end
  L14_117 = _UPVALUE4_
  L14_117 = L14_117.ipv4DualMaskCheck
  L15_118 = L4_107
  L16_119 = L8_111
  L17_120 = A1_104
  L18_121 = A2_105
  L14_117 = L14_117(L15_118, L16_119, L17_120, L18_121)
  L3_106 = L14_117
  L14_117 = _UPVALUE2_
  L14_117 = L14_117.SUCCESS
  if L3_106 == L14_117 then
    L14_117 = _UPVALUE3_
    L14_117 = L14_117.SAME_SUBNET_LAN
    return L14_117
  end
  L14_117 = _UPVALUE1_
  L14_117 = L14_117.vlanGetNext
  L15_118 = L9_112
  L8_111, L10_113, L11_114, L12_115, L19_122 = L14_117(L15_118)
  L4_107 = L19_122
  L7_110 = L18_121
  L6_109 = L17_120
  L5_108 = L16_119
  L9_112 = L15_118
  L3_106 = L14_117
  while true do
    L14_117 = _UPVALUE2_
    L14_117 = L14_117.NEXT_ROWID_INVALID
    if L3_106 ~= L14_117 then
      L14_117 = _UPVALUE2_
      L14_117 = L14_117.SUCCESS
      if L3_106 ~= L14_117 then
        L14_117 = _UPVALUE3_
        L14_117 = L14_117.SUBNET_CHECK_FAILED
        return L14_117
      end
      L14_117 = _UPVALUE4_
      L14_117 = L14_117.ipv4DualMaskCheck
      L15_118 = L4_107
      L16_119 = L8_111
      L17_120 = A1_104
      L18_121 = A2_105
      L14_117 = L14_117(L15_118, L16_119, L17_120, L18_121)
      L3_106 = L14_117
      L14_117 = _UPVALUE2_
      L14_117 = L14_117.SUCCESS
      if L3_106 == L14_117 then
        L14_117 = _UPVALUE3_
        L14_117 = L14_117.SAME_SUBNET_VLAN
        return L14_117
      end
      L14_117 = _UPVALUE1_
      L14_117 = L14_117.vlanGetNext
      L15_118 = L9_112
      L8_111, L10_113, L11_114, L12_115, L19_122 = L14_117(L15_118)
      L4_107 = L19_122
      L7_110 = L18_121
      L6_109 = L17_120
      L5_108 = L16_119
      L9_112 = L15_118
      L3_106 = L14_117
    end
  end
  L14_117 = db
  L14_117 = L14_117.getAttribute
  L15_118 = _UPVALUE5_
  L16_119 = _UPVALUE6_
  L16_119 = L16_119.dmz_interface
  L17_120 = _UPVALUE7_
  L18_121 = _UPVALUE6_
  L18_121 = L18_121.dmz_ip
  L14_117 = L14_117(L15_118, L16_119, L17_120, L18_121)
  L15_118 = db
  L15_118 = L15_118.getAttribute
  L16_119 = _UPVALUE5_
  L17_120 = _UPVALUE6_
  L17_120 = L17_120.dmz_interface
  L18_121 = _UPVALUE7_
  L19_122 = _UPVALUE6_
  L19_122 = L19_122.dmz_netmask
  L15_118 = L15_118(L16_119, L17_120, L18_121, L19_122)
  L16_119 = _UPVALUE2_
  L16_119 = L16_119.NIL
  if L14_117 ~= L16_119 then
    L16_119 = _UPVALUE8_
    if L14_117 ~= L16_119 then
      L16_119 = _UPVALUE2_
      L16_119 = L16_119.NIL
      if L15_118 ~= L16_119 then
        L16_119 = _UPVALUE8_
        if L15_118 ~= L16_119 then
          L16_119 = _UPVALUE4_
          L16_119 = L16_119.ipv4DualMaskCheck
          L17_120 = L14_117
          L18_121 = L15_118
          L19_122 = A1_104
          L16_119 = L16_119(L17_120, L18_121, L19_122, A2_105)
          L3_106 = L16_119
          L16_119 = _UPVALUE2_
          L16_119 = L16_119.SUCCESS
          if L3_106 == L16_119 then
            L16_119 = _UPVALUE3_
            L16_119 = L16_119.SAME_SUBNET_DMZ
            return L16_119
          end
        end
      end
    end
  end
  L16_119 = UNIT_NAME
  if L16_119 ~= "DSR-1000N" then
    L16_119 = UNIT_NAME
    if L16_119 ~= "DSR-1000" then
      L16_119 = UNIT_NAME
      if L16_119 ~= "DSR-500N" then
        L16_119 = UNIT_NAME
        if L16_119 ~= "DSR-500" then
          L16_119 = PRODUCT_ID
          if L16_119 ~= "DSR-1000AC_Ax" then
            L16_119 = PRODUCT_ID
            if L16_119 ~= "DSR-500AC_Ax" then
              L16_119 = PRODUCT_ID
              if L16_119 ~= "DSR-1000_Bx" then
                L16_119 = PRODUCT_ID
              end
            end
          end
        end
      end
    end
  elseif L16_119 == "DSR-500_Bx" then
    L16_119 = _UPVALUE4_
    L16_119 = L16_119.checkOpenVpnSubnetRange
    L17_120 = A1_104
    L18_121 = A2_105
    L16_119 = L16_119(L17_120, L18_121)
    L3_106 = L16_119
    L16_119 = _UPVALUE2_
    L16_119 = L16_119.SUCCESS
    if L3_106 == L16_119 then
      L16_119 = _UPVALUE2_
      L16_119 = L16_119.OPENVPN_ALREADY_CONFIGURED
      return L16_119
    end
  end
  L16_119 = _UPVALUE4_
  L16_119 = L16_119.ipv4DualMaskCheck
  L17_120 = _UPVALUE9_
  L18_121 = _UPVALUE10_
  L19_122 = A1_104
  L16_119 = L16_119(L17_120, L18_121, L19_122, A2_105)
  L3_106 = L16_119
  L16_119 = _UPVALUE2_
  L16_119 = L16_119.SUCCESS
  if L3_106 == L16_119 then
    L16_119 = _UPVALUE3_
    L16_119 = L16_119.SAME_SUBNET_LOCAL_IP
    return L16_119
  end
  L16_119 = db
  L16_119 = L16_119.getAttribute
  L17_120 = _UPVALUE11_
  L18_121 = _UPVALUE12_
  L19_122 = "1"
  L16_119 = L16_119(L17_120, L18_121, L19_122, _UPVALUE6_.ipsec_startIPAddress)
  L17_120 = db
  L17_120 = L17_120.getAttribute
  L18_121 = _UPVALUE11_
  L19_122 = _UPVALUE12_
  L17_120 = L17_120(L18_121, L19_122, "1", _UPVALUE6_.ipsec_subnetMask)
  L18_121 = _UPVALUE2_
  L18_121 = L18_121.NIL
  if L16_119 ~= L18_121 then
    L18_121 = _UPVALUE8_
    if L16_119 ~= L18_121 then
      L18_121 = _UPVALUE2_
      L18_121 = L18_121.NIL
      if L17_120 ~= L18_121 then
        L18_121 = _UPVALUE8_
        if L17_120 ~= L18_121 then
          L18_121 = _UPVALUE4_
          L18_121 = L18_121.ipv4DualMaskCheck
          L19_122 = L16_119
          L18_121 = L18_121(L19_122, L17_120, A1_104, A2_105)
          L3_106 = L18_121
          L18_121 = _UPVALUE2_
          L18_121 = L18_121.SUCCESS
          if L3_106 == L18_121 then
            L18_121 = _UPVALUE3_
            L18_121 = L18_121.SAME_SUBNET_IPSEC
            return L18_121
          end
        end
      end
    end
  end
  L18_121 = _UPVALUE13_
  if A0_103 == L18_121 then
    L18_121 = db
    L18_121 = L18_121.getAttributeWhere
    L19_122 = _UPVALUE14_
    L18_121 = L18_121(L19_122, _UPVALUE6_.interfaceName .. " = '" .. _UPVALUE15_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE16_, _UPVALUE6_.wan_ipAddress)
    L19_122 = db
    L19_122 = L19_122.getAttributeWhere
    L19_122 = L19_122(_UPVALUE14_, _UPVALUE6_.interfaceName .. " = '" .. _UPVALUE15_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE16_, _UPVALUE6_.wan_subnet)
    if L18_121 ~= _UPVALUE2_.NIL and L18_121 ~= _UPVALUE8_ and L19_122 ~= _UPVALUE2_.NIL and L19_122 ~= _UPVALUE8_ then
      L3_106 = _UPVALUE4_.ipv4DualMaskCheck(L18_121, L19_122, A1_104, A2_105)
      if L3_106 == _UPVALUE2_.SUCCESS then
        return _UPVALUE3_.SAME_SUBNET_WAN2
      end
    end
  end
  L18_121 = _UPVALUE15_
  if A0_103 == L18_121 then
    L18_121 = db
    L18_121 = L18_121.getAttributeWhere
    L19_122 = _UPVALUE14_
    L18_121 = L18_121(L19_122, _UPVALUE6_.interfaceName .. " = '" .. _UPVALUE13_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE16_, _UPVALUE6_.wan_ipAddress)
    L19_122 = db
    L19_122 = L19_122.getAttributeWhere
    L19_122 = L19_122(_UPVALUE14_, _UPVALUE6_.interfaceName .. " = '" .. _UPVALUE13_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE16_, _UPVALUE6_.wan_subnet)
    if L18_121 ~= _UPVALUE2_.NIL and L18_121 ~= _UPVALUE8_ and L19_122 ~= _UPVALUE2_.NIL and L19_122 ~= _UPVALUE8_ then
      L3_106 = _UPVALUE4_.ipv4DualMaskCheck(L18_121, L19_122, A1_104, A2_105)
      if L3_106 == _UPVALUE2_.SUCCESS then
        return _UPVALUE3_.SAME_SUBNET_WAN1
      end
    end
  end
  L18_121 = _UPVALUE2_
  L18_121 = L18_121.SUCCESS
  return L18_121
end
