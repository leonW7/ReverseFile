local L0_0
L0_0 = module
L0_0("com.teamf1.core.ipv6_wanclients.static", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/ipv6_mode")
L0_0 = require
L0_0("teamf1lualib/returnCodes_ipv6_nimf")
L0_0 = require
L0_0("teamf1lualib/returnCodes_ifStatic6")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
staticTable = "ifStatic"
;({}).wanPort = "LogicalIfName"
;({}).ipAddress = "StaticIp"
;({}).gateway = "Gateway"
;({}).prefixLength = "PrefixLength"
;({}).primaryDNS = "PrimaryDns"
;({}).secondaryDNS = "SecondaryDns"
;({}).ipv6Mode = "netWorkMode"
COOKIE1 = 4
COOKIE2 = 7
function wanPortGet()
  local L0_1, L1_2
  L0_1 = db
  L0_1 = L0_1.getRowWhere
  L1_2 = staticTable
  L0_1 = L0_1(L1_2, "_ROWID_ = " .. COOKIE1)
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.NIL
  if L0_1 == L1_2 then
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.FAILURE
    return L1_2
  end
  L1_2 = staticTable
  L1_2 = L1_2 .. "." .. _UPVALUE1_.wanPort
  L1_2 = L0_1[L1_2]
  if L1_2 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, COOKIE1, L1_2
end
function wanPortGetNext(A0_3)
  local L1_4, L2_5
  L1_4 = db
  L1_4 = L1_4.getRowWhere
  L2_5 = staticTable
  L1_4 = L1_4(L2_5, "_ROWID_ = " .. COOKIE2)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if L1_4 == L2_5 then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.FAILURE
    return L2_5
  end
  L2_5 = staticTable
  L2_5 = L2_5 .. "." .. _UPVALUE1_.wanPort
  L2_5 = L1_4[L2_5]
  if L2_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, COOKIE2
  end
  return _UPVALUE0_.SUCCESS, COOKIE2, L2_5
end
function wanPortSet(A0_6, A1_7)
  local L3_8
  L3_8 = _UPVALUE0_
  L3_8 = L3_8.NOT_SUPPORTED
  return L3_8, A0_6
end
function wanPortDelete(A0_9, A1_10)
  local L3_11
  L3_11 = _UPVALUE0_
  L3_11 = L3_11.NOT_SUPPORTED
  return L3_11, A0_9
end
function ipAddressGet()
  local L0_12, L1_13
  L0_12 = db
  L0_12 = L0_12.getRowWhere
  L1_13 = staticTable
  L0_12 = L0_12(L1_13, "_ROWID_ = " .. COOKIE1)
  L1_13 = _UPVALUE0_
  L1_13 = L1_13.NIL
  if L0_12 == L1_13 then
    L1_13 = _UPVALUE0_
    L1_13 = L1_13.FAILURE
    return L1_13
  end
  L1_13 = staticTable
  L1_13 = L1_13 .. "." .. _UPVALUE1_.ipAddress
  L1_13 = L0_12[L1_13]
  return _UPVALUE0_.SUCCESS, COOKIE1, L1_13
end
function ipAddressGetNext(A0_14)
  local L1_15, L2_16
  L1_15 = db
  L1_15 = L1_15.getRowWhere
  L2_16 = staticTable
  L1_15 = L1_15(L2_16, "_ROWID_ = " .. COOKIE2)
  L2_16 = _UPVALUE0_
  L2_16 = L2_16.NIL
  if L1_15 == L2_16 then
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.FAILURE
    return L2_16, COOKIE2
  end
  L2_16 = staticTable
  L2_16 = L2_16 .. "." .. _UPVALUE1_.ipAddress
  L2_16 = L1_15[L2_16]
  return _UPVALUE0_.SUCCESS, COOKIE2, L2_16
end
function ipAddressSet(A0_17, A1_18)
  local L2_19, L3_20, L4_21, L5_22
  L2_19 = _UPVALUE0_
  L2_19 = L2_19.ipv6ModeGet
  L4_21 = L2_19()
  L5_22 = tonumber
  L5_22 = L5_22(L4_21)
  if L5_22 ~= 3 then
    L5_22 = _UPVALUE1_
    L5_22 = L5_22.NOT_SUPPORTED
    return L5_22
  end
  L5_22 = nil
  if tonumber(A0_17) ~= COOKIE1 and tonumber(A0_17) ~= COOKIE2 then
    return _UPVALUE1_.INVALID_ARGUMENT, A0_17
  end
  if A1_18 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  L5_22 = _UPVALUE2_.ipAddressCheck(10, A1_18)
  if L5_22 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttributeWhere(staticTable, "_ROWID_ = " .. A0_17, _UPVALUE3_.ipAddress, A1_18) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_17
  end
  return _UPVALUE1_.SUCCESS, A0_17
end
function gatewayGet()
  local L0_23, L1_24
  L0_23 = db
  L0_23 = L0_23.getRowWhere
  L1_24 = staticTable
  L0_23 = L0_23(L1_24, "_ROWID_ = " .. COOKIE1)
  L1_24 = _UPVALUE0_
  L1_24 = L1_24.NIL
  if L0_23 == L1_24 then
    L1_24 = _UPVALUE0_
    L1_24 = L1_24.FAILURE
    return L1_24
  end
  L1_24 = staticTable
  L1_24 = L1_24 .. "." .. _UPVALUE1_.gateway
  L1_24 = L0_23[L1_24]
  if L1_24 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, COOKIE1, L1_24
end
function gatewayGetNext(A0_25)
  local L1_26, L2_27
  L1_26 = db
  L1_26 = L1_26.getRowWhere
  L2_27 = staticTable
  L1_26 = L1_26(L2_27, "_ROWID_ = " .. COOKIE2)
  L2_27 = _UPVALUE0_
  L2_27 = L2_27.NIL
  if L1_26 == L2_27 then
    L2_27 = _UPVALUE0_
    L2_27 = L2_27.FAILURE
    return L2_27, COOKIE2
  end
  L2_27 = staticTable
  L2_27 = L2_27 .. "." .. _UPVALUE1_.gateway
  L2_27 = L1_26[L2_27]
  if L2_27 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, COOKIE2
  end
  return _UPVALUE0_.SUCCESS, COOKIE2, L2_27
end
function gatewaySet(A0_28, A1_29)
  local L2_30, L3_31, L4_32, L5_33
  L2_30 = _UPVALUE0_
  L2_30 = L2_30.ipv6ModeGet
  L4_32 = L2_30()
  L5_33 = tonumber
  L5_33 = L5_33(L4_32)
  if L5_33 ~= 3 then
    L5_33 = _UPVALUE1_
    L5_33 = L5_33.NOT_SUPPORTED
    return L5_33
  end
  L5_33 = nil
  if tonumber(A0_28) ~= COOKIE1 and tonumber(A0_28) ~= COOKIE2 then
    return _UPVALUE1_.INVALID_ARGUMENT, A0_28
  end
  if A1_29 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  L5_33 = _UPVALUE2_.ipAddressCheck(10, A1_29)
  if L5_33 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttributeWhere(staticTable, "_ROWID_ = " .. A0_28, _UPVALUE3_.gateway, A1_29) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_28
  end
  return _UPVALUE1_.SUCCESS, A0_28
end
function prefixLengthGet()
  local L0_34, L1_35
  L0_34 = db
  L0_34 = L0_34.getRowWhere
  L1_35 = staticTable
  L0_34 = L0_34(L1_35, "_ROWID_ = " .. COOKIE1)
  L1_35 = _UPVALUE0_
  L1_35 = L1_35.NIL
  if L0_34 == L1_35 then
    L1_35 = _UPVALUE0_
    L1_35 = L1_35.FAILURE
    return L1_35
  end
  L1_35 = staticTable
  L1_35 = L1_35 .. "." .. _UPVALUE1_.prefixLength
  L1_35 = L0_34[L1_35]
  if L1_35 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, COOKIE1, L1_35
end
function prefixLengthGetNext(A0_36)
  local L1_37, L2_38
  L1_37 = db
  L1_37 = L1_37.getRowWhere
  L2_38 = staticTable
  L1_37 = L1_37(L2_38, "_ROWID_ = " .. COOKIE2)
  L2_38 = _UPVALUE0_
  L2_38 = L2_38.NIL
  if L1_37 == L2_38 then
    L2_38 = _UPVALUE0_
    L2_38 = L2_38.FAILURE
    return L2_38, COOKIE2
  end
  L2_38 = staticTable
  L2_38 = L2_38 .. "." .. _UPVALUE1_.prefixLength
  L2_38 = L1_37[L2_38]
  if L2_38 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, COOKIE2
  end
  return _UPVALUE0_.SUCCESS, COOKIE2, L2_38
end
function prefixLengthSet(A0_39, A1_40)
  local L2_41, L3_42, L4_43
  L2_41 = _UPVALUE0_
  L2_41 = L2_41.ipv6ModeGet
  L4_43 = L2_41()
  if tonumber(L4_43) ~= 3 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if tonumber(A0_39) ~= COOKIE1 and tonumber(A0_39) ~= COOKIE2 then
    return _UPVALUE1_.INVALID_ARGUMENT, A0_39
  end
  if A1_40 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if tonumber(A1_40) < 1 or tonumber(A1_40) > 128 then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttribute(staticTable, "_ROWID_", A0_39, _UPVALUE2_.prefixLength, A1_40) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_39
  end
  return _UPVALUE1_.SUCCESS, A0_39
end
function primaryDNSGet()
  local L0_44, L1_45
  L0_44 = db
  L0_44 = L0_44.getRowWhere
  L1_45 = staticTable
  L0_44 = L0_44(L1_45, "_ROWID_ = " .. COOKIE1)
  L1_45 = _UPVALUE0_
  L1_45 = L1_45.NIL
  if L0_44 == L1_45 then
    L1_45 = _UPVALUE0_
    L1_45 = L1_45.FAILURE
    return L1_45
  end
  L1_45 = staticTable
  L1_45 = L1_45 .. "." .. _UPVALUE1_.primaryDNS
  L1_45 = L0_44[L1_45]
  if L1_45 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, COOKIE1, L1_45
end
function primaryDNSGetNext(A0_46)
  local L1_47, L2_48
  L1_47 = db
  L1_47 = L1_47.getRowWhere
  L2_48 = staticTable
  L1_47 = L1_47(L2_48, "_ROWID_ = " .. COOKIE2)
  L2_48 = _UPVALUE0_
  L2_48 = L2_48.NIL
  if L1_47 == L2_48 then
    L2_48 = _UPVALUE0_
    L2_48 = L2_48.FAILURE
    return L2_48, COOKIE2
  end
  L2_48 = staticTable
  L2_48 = L2_48 .. "." .. _UPVALUE1_.primaryDNS
  L2_48 = L1_47[L2_48]
  if L2_48 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, COOKIE2
  end
  return _UPVALUE0_.SUCCESS, COOKIE2, L2_48
end
function primaryDNSSet(A0_49, A1_50)
  local L2_51, L3_52, L4_53, L5_54
  L2_51 = _UPVALUE0_
  L2_51 = L2_51.ipv6ModeGet
  L4_53 = L2_51()
  L5_54 = tonumber
  L5_54 = L5_54(L4_53)
  if L5_54 ~= 3 then
    L5_54 = _UPVALUE1_
    L5_54 = L5_54.NOT_SUPPORTED
    return L5_54
  end
  L5_54 = nil
  if tonumber(A0_49) ~= COOKIE1 and tonumber(A0_49) ~= COOKIE2 then
    return _UPVALUE1_.INVALID_ARGUMENT, A0_49
  end
  if A1_50 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  L5_54 = _UPVALUE2_.ipAddressCheck(2, A1_50)
  if L5_54 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttributeWhere(staticTable, "_ROWID_ = " .. A0_49, _UPVALUE3_.primaryDNS, A1_50) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_49
  end
  return _UPVALUE1_.SUCCESS, A0_49
end
function secondaryDNSGet()
  local L0_55, L1_56
  L0_55 = db
  L0_55 = L0_55.getRowWhere
  L1_56 = staticTable
  L0_55 = L0_55(L1_56, "_ROWID_ = " .. COOKIE1)
  L1_56 = _UPVALUE0_
  L1_56 = L1_56.NIL
  if L0_55 == L1_56 then
    L1_56 = _UPVALUE0_
    L1_56 = L1_56.FAILURE
    return L1_56
  end
  L1_56 = staticTable
  L1_56 = L1_56 .. "." .. _UPVALUE1_.secondaryDNS
  L1_56 = L0_55[L1_56]
  if L1_56 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, COOKIE1, L1_56
end
function secondaryDNSGetNext(A0_57)
  local L1_58, L2_59
  L1_58 = db
  L1_58 = L1_58.getRowWhere
  L2_59 = staticTable
  L1_58 = L1_58(L2_59, "_ROWID_ = " .. COOKIE2)
  L2_59 = _UPVALUE0_
  L2_59 = L2_59.NIL
  if L1_58 == L2_59 then
    L2_59 = _UPVALUE0_
    L2_59 = L2_59.FAILURE
    return L2_59, COOKIE2
  end
  L2_59 = staticTable
  L2_59 = L2_59 .. "." .. _UPVALUE1_.secondaryDNS
  L2_59 = L1_58[L2_59]
  if L2_59 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, COOKIE2
  end
  return _UPVALUE0_.SUCCESS, COOKIE2, L2_59
end
function secondaryDNSSet(A0_60, A1_61)
  local L2_62, L3_63, L4_64, L5_65
  L2_62 = _UPVALUE0_
  L2_62 = L2_62.ipv6ModeGet
  L4_64 = L2_62()
  L5_65 = tonumber
  L5_65 = L5_65(L4_64)
  if L5_65 ~= 3 then
    L5_65 = _UPVALUE1_
    L5_65 = L5_65.NOT_SUPPORTED
    return L5_65
  end
  L5_65 = nil
  if tonumber(A0_60) ~= COOKIE1 and tonumber(A0_60) ~= COOKIE2 then
    return _UPVALUE1_.INVALID_ARGUMENT, A0_60
  end
  if A1_61 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  L5_65 = _UPVALUE2_.ipAddressCheck(2, A1_61)
  if L5_65 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttributeWhere(staticTable, "_ROWID_ = " .. A0_60, _UPVALUE3_.secondaryDNS, A1_61) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_60
  end
  return _UPVALUE1_.SUCCESS, A0_60
end
function staticIpGroupGet()
  local L0_66, L1_67, L2_68, L3_69, L4_70, L5_71, L6_72
  L0_66 = db
  L0_66 = L0_66.getRowWhere
  L1_67 = staticTable
  L2_68 = "_ROWID_ = "
  L3_69 = COOKIE1
  L2_68 = L2_68 .. L3_69
  L0_66 = L0_66(L1_67, L2_68)
  L1_67 = _UPVALUE0_
  L1_67 = L1_67.NIL
  if L0_66 == L1_67 then
    L1_67 = _UPVALUE0_
    L1_67 = L1_67.FAILURE
    return L1_67
  end
  L1_67 = staticTable
  L2_68 = "."
  L3_69 = _UPVALUE1_
  L3_69 = L3_69.wanPort
  L1_67 = L1_67 .. L2_68 .. L3_69
  L1_67 = L0_66[L1_67]
  L2_68 = staticTable
  L3_69 = "."
  L4_70 = _UPVALUE1_
  L4_70 = L4_70.ipAddress
  L2_68 = L2_68 .. L3_69 .. L4_70
  L2_68 = L0_66[L2_68]
  L3_69 = staticTable
  L4_70 = "."
  L5_71 = _UPVALUE1_
  L5_71 = L5_71.gateway
  L3_69 = L3_69 .. L4_70 .. L5_71
  L3_69 = L0_66[L3_69]
  L4_70 = staticTable
  L5_71 = "."
  L6_72 = _UPVALUE1_
  L6_72 = L6_72.prefixLength
  L4_70 = L4_70 .. L5_71 .. L6_72
  L4_70 = L0_66[L4_70]
  L5_71 = staticTable
  L6_72 = "."
  L5_71 = L5_71 .. L6_72 .. _UPVALUE1_.primaryDNS
  L5_71 = L0_66[L5_71]
  L6_72 = staticTable
  L6_72 = L6_72 .. "." .. _UPVALUE1_.secondaryDNS
  L6_72 = L0_66[L6_72]
  if L1_67 == _UPVALUE0_.NIL or L2_68 == _UPVALUE0_.NIL or L3_69 == _UPVALUE0_.NIL or L4_70 == _UPVALUE0_.NIL or L5_71 == _UPVALUE0_.NIL or L6_72 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, COOKIE1
  end
  return _UPVALUE0_.SUCCESS, COOKIE1, L1_67, L2_68, L3_69, L4_70, L5_71, L6_72
end
function staticIpGroupGetNext()
  local L0_73, L1_74, L2_75, L3_76, L4_77, L5_78, L6_79
  L0_73 = db
  L0_73 = L0_73.getRowWhere
  L1_74 = staticTable
  L2_75 = "LogicalIfName='WAN2' AND AddressFamily=10"
  L0_73 = L0_73(L1_74, L2_75)
  L1_74 = _UPVALUE0_
  L1_74 = L1_74.NIL
  if L0_73 == L1_74 then
    L1_74 = _UPVALUE0_
    L1_74 = L1_74.FAILURE
    return L1_74
  end
  L1_74 = staticTable
  L2_75 = "."
  L3_76 = _UPVALUE1_
  L3_76 = L3_76.wanPort
  L1_74 = L1_74 .. L2_75 .. L3_76
  L1_74 = L0_73[L1_74]
  L2_75 = staticTable
  L3_76 = "."
  L4_77 = _UPVALUE1_
  L4_77 = L4_77.ipAddress
  L2_75 = L2_75 .. L3_76 .. L4_77
  L2_75 = L0_73[L2_75]
  L3_76 = staticTable
  L4_77 = "."
  L5_78 = _UPVALUE1_
  L5_78 = L5_78.gateway
  L3_76 = L3_76 .. L4_77 .. L5_78
  L3_76 = L0_73[L3_76]
  L4_77 = staticTable
  L5_78 = "."
  L6_79 = _UPVALUE1_
  L6_79 = L6_79.prefixLength
  L4_77 = L4_77 .. L5_78 .. L6_79
  L4_77 = L0_73[L4_77]
  L5_78 = staticTable
  L6_79 = "."
  L5_78 = L5_78 .. L6_79 .. _UPVALUE1_.primaryDNS
  L5_78 = L0_73[L5_78]
  L6_79 = staticTable
  L6_79 = L6_79 .. "." .. _UPVALUE1_.secondaryDNS
  L6_79 = L0_73[L6_79]
  if L1_74 == _UPVALUE0_.NIL or L2_75 == _UPVALUE0_.NIL or L3_76 == _UPVALUE0_.NIL or L4_77 == _UPVALUE0_.NIL or L5_78 == _UPVALUE0_.NIL or L6_79 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, COOKIE2
  end
  return _UPVALUE0_.SUCCESS, COOKIE2, L1_74, L2_75, L3_76, L4_77, L5_78, L6_79
end
function staticIpGroupSet(A0_80, A1_81, A2_82, A3_83, A4_84, A5_85, A6_86)
  local L7_87, L8_88, L9_89, L10_90, L11_91, L12_92
  L7_87 = _UPVALUE0_
  L7_87 = L7_87.ipv6ModeGet
  L9_89 = L7_87()
  L10_90 = tonumber
  L11_91 = L9_89
  L10_90 = L10_90(L11_91)
  if L10_90 ~= 3 then
    L10_90 = _UPVALUE1_
    L10_90 = L10_90.IPV6MODE_NOT_ENABLED
    return L10_90
  end
  L10_90 = nil
  L11_91 = tonumber
  L12_92 = A0_80
  L11_91 = L11_91(L12_92)
  L12_92 = COOKIE1
  if L11_91 ~= L12_92 then
    L11_91 = tonumber
    L12_92 = A0_80
    L11_91 = L11_91(L12_92)
    L12_92 = COOKIE2
    if L11_91 ~= L12_92 then
      L11_91 = _UPVALUE2_
      L11_91 = L11_91.INVALID_ARGUMENT
      L12_92 = A0_80
      return L11_91, L12_92
    end
  end
  L11_91 = _UPVALUE2_
  L11_91 = L11_91.NIL
  if A1_81 == L11_91 then
    L11_91 = _UPVALUE2_
    L11_91 = L11_91.INVALID_ARGUMENT
    return L11_91
  end
  if A1_81 ~= "WAN1" and A1_81 ~= "WAN2" then
    L11_91 = _UPVALUE2_
    L11_91 = L11_91.INVALID_ARGUMENT
    return L11_91
  end
  L11_91 = COOKIE1
  if A0_80 ~= L11_91 or A1_81 == "WAN1" then
    L11_91 = COOKIE2
  elseif A0_80 == L11_91 and A1_81 ~= "WAN2" then
    L11_91 = _UPVALUE2_
    L11_91 = L11_91.INVALID_ARGUMENT
    return L11_91
  end
  L11_91 = _UPVALUE2_
  L11_91 = L11_91.NIL
  if A2_82 == L11_91 then
    L11_91 = _UPVALUE3_
    L11_91 = L11_91.WAN_IFSTATIC_IPV6ADDR_IS_NIL
    return L11_91
  end
  L11_91 = _UPVALUE4_
  L11_91 = L11_91.ipAddressCheck
  L12_92 = 10
  L11_91 = L11_91(L12_92, A2_82)
  L10_90 = L11_91
  L11_91 = _UPVALUE2_
  L11_91 = L11_91.SUCCESS
  if L10_90 ~= L11_91 then
    L11_91 = _UPVALUE3_
    L11_91 = L11_91.WAN_IFSTATIC_INVALID_IPV6ADDR
    return L11_91
  end
  L11_91 = _UPVALUE2_
  L11_91 = L11_91.NIL
  if A3_83 == L11_91 then
    L11_91 = _UPVALUE3_
    L11_91 = L11_91.WAN_IFSTATIC_GW_NIL
    return L11_91
  end
  L11_91 = _UPVALUE4_
  L11_91 = L11_91.ipAddressCheck
  L12_92 = 10
  L11_91 = L11_91(L12_92, A3_83)
  L10_90 = L11_91
  L11_91 = _UPVALUE2_
  L11_91 = L11_91.SUCCESS
  if L10_90 ~= L11_91 then
    L11_91 = _UPVALUE3_
    L11_91 = L11_91.WAN_IFSTATIC_INVALID_GW
    return L11_91
  end
  L11_91 = _UPVALUE2_
  L11_91 = L11_91.NIL
  if A4_84 == L11_91 then
    L11_91 = _UPVALUE3_
    L11_91 = L11_91.WAN_IFSTATIC_PREFIXLENGTH_NIL
    return L11_91
  end
  L11_91 = tonumber
  L12_92 = A4_84
  L11_91 = L11_91(L12_92)
  if L11_91 < 1 or L11_91 > 128 then
    L12_92 = _UPVALUE3_
    L12_92 = L12_92.WAN_IFSTATIC_INVALID_PREFIXLENGTH
    return L12_92
  end
  L12_92 = _UPVALUE2_
  L12_92 = L12_92.NIL
  if A5_85 == L12_92 then
    L12_92 = _UPVALUE3_
    L12_92 = L12_92.WAN_IFSTATIC_PRI_DNS_NIL
    return L12_92
  end
  L12_92 = _UPVALUE4_
  L12_92 = L12_92.ipAddressCheck
  L12_92 = L12_92(10, A5_85)
  L10_90 = L12_92
  L12_92 = _UPVALUE2_
  L12_92 = L12_92.SUCCESS
  if L10_90 ~= L12_92 then
    L12_92 = _UPVALUE3_
    L12_92 = L12_92.WAN_IFSTATIC_INVALID_PRI_DNS
    return L12_92
  end
  L12_92 = _UPVALUE2_
  L12_92 = L12_92.NIL
  if A6_86 == L12_92 then
    L12_92 = _UPVALUE3_
    L12_92 = L12_92.WAN_IFSTATIC_SEC_DNS_NIL
    return L12_92
  end
  L12_92 = _UPVALUE4_
  L12_92 = L12_92.ipAddressCheck
  L12_92 = L12_92(10, A6_86)
  L10_90 = L12_92
  L12_92 = _UPVALUE2_
  L12_92 = L12_92.SUCCESS
  if L10_90 ~= L12_92 then
    L12_92 = _UPVALUE3_
    L12_92 = L12_92.WAN_IFSTATIC_INVALID_SEC_DNS
    return L12_92
  end
  L12_92 = {}
  L12_92[staticTable .. "." .. _UPVALUE5_.wanPort] = A1_81
  L12_92[staticTable .. "." .. _UPVALUE5_.ipAddress] = A2_82
  L12_92[staticTable .. "." .. _UPVALUE5_.gateway] = A3_83
  L12_92[staticTable .. "." .. _UPVALUE5_.prefixLength] = A4_84
  L12_92[staticTable .. "." .. _UPVALUE5_.primaryDNS] = A5_85
  L12_92[staticTable .. "." .. _UPVALUE5_.secondaryDNS] = A6_86
  if db.update(staticTable, L12_92, A0_80) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_80
  end
  return _UPVALUE2_.SUCCESS, A0_80
end
function staticIpGroupCreate(A0_93, A1_94, A2_95, A3_96, A4_97, A5_98)
  return _UPVALUE0_.NOT_SUPPORTED
end
function staticIpGroupDelete(A0_99)
  local L2_100
  L2_100 = _UPVALUE0_
  L2_100 = L2_100.NOT_SUPPORTED
  return L2_100, A0_99
end
