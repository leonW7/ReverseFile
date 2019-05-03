local L0_0
L0_0 = module
L0_0("com.teamf1.core.ipv6_wanclients.pppoe", package.seeall)
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
L0_0("teamf1lualib/returnCodes_pppoe")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
pppoeTable = "pppoe6"
;({}).wanPort = "LogicalIfName"
;({}).userName = "UserName"
;({}).password = "Password"
;({}).primaryDns = "PrimaryDns"
;({}).secondaryDns = "SecondaryDns"
;({}).authenticationOptions = "AuthOpt"
;({}).dhcpOptions = "Dhcpv6Opt"
;({}).pppoeSessions = "PppoeSessions"
;({}).ipv6Mode = "netWorkMode"
AUTO_NEGOTIATE = 1
PAP = 2
CHAP = 3
MS_CHAP = 4
MS_CHAPv2 = 5
DISABLE = 0
STATELESS = 1
STATEFUL = 2
STATELESS_WITH_PREFIX = 3
STATEFUL_WITH_PREFIX = 4
SEPARATE_SESSION = 1
COMMON_SESSION = 2
function wanPortGet()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(pppoeTable, "_ROWID_", "1", _UPVALUE0_.wanPort)
  if L0_1 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L0_1
end
function wanPortGetNext(A0_2)
  local L1_3
  L1_3 = _UPVALUE0_
  L1_3 = L1_3.NIL
  if A0_2 == L1_3 then
    L1_3 = _UPVALUE0_
    L1_3 = L1_3.INVALID_ARGUMENT
    return L1_3
  end
  L1_3 = tonumber
  L1_3 = L1_3(A0_2)
  if L1_3 ~= 2 then
    L1_3 = _UPVALUE0_
    L1_3 = L1_3.INVALID_ARGUMENT
    return L1_3
  end
  L1_3 = db
  L1_3 = L1_3.getAttribute
  L1_3 = L1_3(pppoeTable, "_ROWID_", "2", _UPVALUE1_.wanPort)
  if L1_3 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 2, L1_3
end
function wanPortSet(A0_4, A1_5)
  local L3_6
  L3_6 = _UPVALUE0_
  L3_6 = L3_6.NOT_SUPPORTED
  return L3_6, A0_4
end
function wanPortDelete(A0_7, A1_8)
  local L3_9
  L3_9 = _UPVALUE0_
  L3_9 = L3_9.NOT_SUPPORTED
  return L3_9, A0_7
end
function userNameGet()
  local L0_10
  L0_10 = db
  L0_10 = L0_10.getAttribute
  L0_10 = L0_10(pppoeTable, "_ROWID_", "1", _UPVALUE0_.userName)
  if L0_10 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L0_10
end
function userNameGetNext(A0_11)
  local L1_12
  L1_12 = _UPVALUE0_
  L1_12 = L1_12.NIL
  if A0_11 == L1_12 then
    L1_12 = _UPVALUE0_
    L1_12 = L1_12.INVALID_ARGUMENT
    return L1_12
  end
  L1_12 = tonumber
  L1_12 = L1_12(A0_11)
  if L1_12 ~= 2 then
    L1_12 = _UPVALUE0_
    L1_12 = L1_12.INVALID_ARGUMENT
    return L1_12
  end
  L1_12 = db
  L1_12 = L1_12.getAttribute
  L1_12 = L1_12(pppoeTable, "_ROWID_", "2", _UPVALUE1_.userName)
  if L1_12 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 2, L1_12
end
function userNameSet(A0_13, A1_14)
  local L2_15, L3_16, L4_17
  L2_15 = _UPVALUE0_
  L2_15 = L2_15.ipv6ModeGet
  L4_17 = L2_15()
  if tonumber(L4_17) ~= 3 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if A0_13 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if tonumber(A0_13) ~= 1 and tonumber(A0_13) ~= 2 then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if A1_14 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttributeWhere(pppoeTable, "_ROWID_  = " .. A0_13, _UPVALUE2_.userName, A1_14) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_13
  end
  return _UPVALUE1_.SUCCESS, A0_13
end
function passwordGet()
  local L0_18
  L0_18 = db
  L0_18 = L0_18.getAttribute
  L0_18 = L0_18(pppoeTable, "_ROWID_", "1", _UPVALUE0_.password)
  if L0_18 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L0_18
end
function passwordGetNext(A0_19)
  local L1_20
  L1_20 = _UPVALUE0_
  L1_20 = L1_20.NIL
  if A0_19 == L1_20 then
    L1_20 = _UPVALUE0_
    L1_20 = L1_20.INVALID_ARGUMENT
    return L1_20
  end
  L1_20 = tonumber
  L1_20 = L1_20(A0_19)
  if L1_20 ~= 2 then
    L1_20 = _UPVALUE0_
    L1_20 = L1_20.INVALID_ARGUMENT
    return L1_20
  end
  L1_20 = db
  L1_20 = L1_20.getAttribute
  L1_20 = L1_20(pppoeTable, "_ROWID_", "2", _UPVALUE1_.password)
  if L1_20 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 2, L1_20
end
function passwordSet(A0_21, A1_22)
  local L2_23, L3_24, L4_25
  L2_23 = _UPVALUE0_
  L2_23 = L2_23.ipv6ModeGet
  L4_25 = L2_23()
  if tonumber(L4_25) ~= 3 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if A0_21 == _UPVALUE1_.NIL and tonumber(A0_21) ~= 1 and tonumber(A0_21) ~= 2 then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if A1_22 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttributeWhere(pppoeTable, "_ROWID_  = " .. A0_21, _UPVALUE2_.password, A1_22) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_21
  end
  return _UPVALUE1_.SUCCESS, A0_21
end
function primaryDnsGet()
  local L0_26
  L0_26 = db
  L0_26 = L0_26.getAttribute
  L0_26 = L0_26(pppoeTable, "_ROWID_", "1", _UPVALUE0_.primaryDns)
  if L0_26 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L0_26
end
function primaryDnsGetNext(A0_27)
  local L1_28
  L1_28 = _UPVALUE0_
  L1_28 = L1_28.NIL
  if A0_27 == L1_28 then
    L1_28 = _UPVALUE0_
    L1_28 = L1_28.INVALID_ARGUMENT
    return L1_28
  end
  L1_28 = tonumber
  L1_28 = L1_28(A0_27)
  if L1_28 ~= 2 then
    L1_28 = _UPVALUE0_
    L1_28 = L1_28.INVALID_ARGUMENT
    return L1_28
  end
  L1_28 = db
  L1_28 = L1_28.getAttribute
  L1_28 = L1_28(pppoeTable, "_ROWID_", "2", _UPVALUE1_.primaryDns)
  if L1_28 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 2, L1_28
end
function primaryDnsSet(A0_29, A1_30)
  local L2_31, L3_32, L4_33, L5_34
  L2_31 = _UPVALUE0_
  L2_31 = L2_31.ipv6ModeGet
  L4_33 = L2_31()
  L5_34 = tonumber
  L5_34 = L5_34(L4_33)
  if L5_34 ~= 3 then
    L5_34 = _UPVALUE1_
    L5_34 = L5_34.NOT_SUPPORTED
    return L5_34
  end
  L5_34 = nil
  if A0_29 == _UPVALUE1_.NIL and tonumber(A0_29) ~= 1 and tonumber(A0_29) ~= 2 then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if A1_30 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  L5_34 = _UPVALUE2_.ipAddressCheck(2, A1_30)
  if L5_34 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttributeWhere(pppoeTable, "_ROWID_  = " .. A0_29, _UPVALUE3_.primaryDns, A1_30) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_29
  end
  return _UPVALUE1_.SUCCESS, A0_29
end
function secondaryDnsGet()
  local L0_35
  L0_35 = db
  L0_35 = L0_35.getAttribute
  L0_35 = L0_35(pppoeTable, "_ROWID_", "1", _UPVALUE0_.secondaryDns)
  if L0_35 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L0_35
end
function secondaryDnsGetNext(A0_36)
  local L1_37
  L1_37 = _UPVALUE0_
  L1_37 = L1_37.NIL
  if A0_36 == L1_37 then
    L1_37 = _UPVALUE0_
    L1_37 = L1_37.INVALID_ARGUMENT
    return L1_37
  end
  L1_37 = tonumber
  L1_37 = L1_37(A0_36)
  if L1_37 ~= 2 then
    L1_37 = _UPVALUE0_
    L1_37 = L1_37.INVALID_ARGUMENT
    return L1_37
  end
  L1_37 = db
  L1_37 = L1_37.getAttribute
  L1_37 = L1_37(pppoeTable, "_ROWID_", "2", _UPVALUE1_.secondaryDns)
  if L1_37 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 2, L1_37
end
function secondaryDnsSet(A0_38, A1_39)
  local L2_40, L3_41, L4_42, L5_43
  L2_40 = _UPVALUE0_
  L2_40 = L2_40.ipv6ModeGet
  L4_42 = L2_40()
  L5_43 = tonumber
  L5_43 = L5_43(L4_42)
  if L5_43 ~= 3 then
    L5_43 = _UPVALUE1_
    L5_43 = L5_43.NOT_SUPPORTED
    return L5_43
  end
  L5_43 = nil
  if A0_38 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if tonumber(A0_38) ~= 1 and tonumber(A0_38) ~= 2 then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if A1_39 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  L5_43 = _UPVALUE2_.ipAddressCheck(2, A1_39)
  if L5_43 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttributeWhere(pppoeTable, "_ROWID_  = " .. A0_38, _UPVALUE3_.secondaryDns, A1_39) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_38
  end
  return _UPVALUE1_.SUCCESS, A0_38
end
function authenticationOptionsGet()
  local L0_44
  L0_44 = db
  L0_44 = L0_44.getAttribute
  L0_44 = L0_44(pppoeTable, "_ROWID_", "1", _UPVALUE0_.authenticationOptions)
  if L0_44 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L0_44
end
function authenticationOptionsGetNext(A0_45)
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
  if L1_46 ~= 2 then
    L1_46 = _UPVALUE0_
    L1_46 = L1_46.INVALID_ARGUMENT
    return L1_46
  end
  L1_46 = db
  L1_46 = L1_46.getAttribute
  L1_46 = L1_46(pppoeTable, "_ROWID_", "2", _UPVALUE1_.authenticationOptions)
  if L1_46 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 2, L1_46
end
function authenticationOptionsSet(A0_47, A1_48)
  local L2_49, L3_50, L4_51, L5_52, L6_53
  L2_49 = _UPVALUE0_
  L2_49 = L2_49.ipv6ModeGet
  L4_51 = L2_49()
  L5_52 = tonumber
  L6_53 = L4_51
  L5_52 = L5_52(L6_53)
  if L5_52 ~= 3 then
    L5_52 = _UPVALUE1_
    L5_52 = L5_52.NOT_SUPPORTED
    return L5_52
  end
  L5_52 = _UPVALUE1_
  L5_52 = L5_52.NIL
  if A0_47 == L5_52 then
    L5_52 = _UPVALUE1_
    L5_52 = L5_52.INVALID_ARGUMENT
    return L5_52
  end
  L5_52 = tonumber
  L6_53 = A0_47
  L5_52 = L5_52(L6_53)
  if L5_52 ~= 1 then
    L5_52 = tonumber
    L6_53 = A0_47
    L5_52 = L5_52(L6_53)
    if L5_52 ~= 2 then
      L5_52 = _UPVALUE1_
      L5_52 = L5_52.INVALID_ARGUMENT
      return L5_52
    end
  end
  L5_52 = _UPVALUE1_
  L5_52 = L5_52.NIL
  if A1_48 == L5_52 then
    L5_52 = _UPVALUE1_
    L5_52 = L5_52.INVALID_ARGUMENT
    return L5_52
  end
  L5_52 = AUTO_NEGOTIATE
  if A1_48 ~= L5_52 then
    L5_52 = PAP
    if A1_48 ~= L5_52 then
      L5_52 = CHAP
      if A1_48 ~= L5_52 then
        L5_52 = MS_CHAP
        if A1_48 ~= L5_52 then
          L5_52 = MS_CHAPv2
          if A1_48 ~= L5_52 then
            L5_52 = _UPVALUE1_
            L5_52 = L5_52.INVALID_ARGUMENT
            return L5_52
          end
        end
      end
    end
  end
  L5_52, L6_53 = nil, nil
  L5_52, L6_53 = db.setAttribute(pppoeTable, "_ROWID_", A0_47, _UPVALUE2_.authenticationOptions, A1_48)
  if L5_52 == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_47
  end
  return _UPVALUE1_.SUCCESS, A0_47
end
function dhcpOptionsGet()
  local L0_54
  L0_54 = db
  L0_54 = L0_54.getAttribute
  L0_54 = L0_54(pppoeTable, "_ROWID_", "1", _UPVALUE0_.dhcpOptions)
  if L0_54 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L0_54
end
function dhcpOptionsGetNext(A0_55)
  local L1_56
  L1_56 = _UPVALUE0_
  L1_56 = L1_56.NIL
  if A0_55 == L1_56 then
    L1_56 = _UPVALUE0_
    L1_56 = L1_56.INVALID_ARGUMENT
    return L1_56
  end
  L1_56 = tonumber
  L1_56 = L1_56(A0_55)
  if L1_56 ~= 2 then
    L1_56 = _UPVALUE0_
    L1_56 = L1_56.INVALID_ARGUMENT
    return L1_56
  end
  L1_56 = db
  L1_56 = L1_56.getAttribute
  L1_56 = L1_56(pppoeTable, "_ROWID_", "2", _UPVALUE1_.dhcpOptions)
  if L1_56 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 2, L1_56
end
function dhcpOptionsSet(A0_57, A1_58)
  local L2_59, L3_60, L4_61
  L2_59 = _UPVALUE0_
  L2_59 = L2_59.ipv6ModeGet
  L4_61 = L2_59()
  if tonumber(L4_61) ~= 3 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if A0_57 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if tonumber(A0_57) ~= 1 and tonumber(A0_57) ~= 2 then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if A1_58 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if A1_58 ~= DISABLE and A1_58 ~= STATELESS and A1_58 ~= STATEFUL and A1_58 ~= STATELESS_WITH_PREFIX and A1_58 ~= STATEFUL_WITH_PREFIX then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttribute(pppoeTable, "_ROWID_", A0_57, _UPVALUE2_.dhcpOptions, A1_58) == _UPVALUE1_.FALSE then
    return _UPVALUE1_.FAILURE, A0_57
  end
  return _UPVALUE1_.SUCCESS, A0_57
end
function pppoeConnectionGet()
  local L0_62, L1_63, L2_64, L3_65, L4_66, L5_67, L6_68, L7_69, L8_70
  L0_62 = db
  L0_62 = L0_62.getRow
  L1_63 = pppoeTable
  L2_64 = "_ROWID_"
  L3_65 = "1"
  L0_62 = L0_62(L1_63, L2_64, L3_65)
  L1_63 = _UPVALUE0_
  L1_63 = L1_63.NIL
  if L0_62 == L1_63 then
    L1_63 = _UPVALUE0_
    L1_63 = L1_63.FAILURE
    return L1_63
  end
  L1_63 = pppoeTable
  L2_64 = "."
  L3_65 = _UPVALUE1_
  L3_65 = L3_65.wanPort
  L1_63 = L1_63 .. L2_64 .. L3_65
  L1_63 = L0_62[L1_63]
  L2_64 = pppoeTable
  L3_65 = "."
  L4_66 = _UPVALUE1_
  L4_66 = L4_66.userName
  L2_64 = L2_64 .. L3_65 .. L4_66
  L2_64 = L0_62[L2_64]
  L3_65 = pppoeTable
  L4_66 = "."
  L5_67 = _UPVALUE1_
  L5_67 = L5_67.password
  L3_65 = L3_65 .. L4_66 .. L5_67
  L3_65 = L0_62[L3_65]
  L4_66 = pppoeTable
  L5_67 = "."
  L6_68 = _UPVALUE1_
  L6_68 = L6_68.primaryDns
  L4_66 = L4_66 .. L5_67 .. L6_68
  L4_66 = L0_62[L4_66]
  L5_67 = pppoeTable
  L6_68 = "."
  L7_69 = _UPVALUE1_
  L7_69 = L7_69.secondaryDns
  L5_67 = L5_67 .. L6_68 .. L7_69
  L5_67 = L0_62[L5_67]
  L6_68 = pppoeTable
  L7_69 = "."
  L8_70 = _UPVALUE1_
  L8_70 = L8_70.authenticationOptions
  L6_68 = L6_68 .. L7_69 .. L8_70
  L6_68 = L0_62[L6_68]
  L7_69 = pppoeTable
  L8_70 = "."
  L7_69 = L7_69 .. L8_70 .. _UPVALUE1_.dhcpOptions
  L7_69 = L0_62[L7_69]
  L8_70 = pppoeTable
  L8_70 = L8_70 .. "." .. _UPVALUE1_.pppoeSessions
  L8_70 = L0_62[L8_70]
  return _UPVALUE0_.SUCCESS, 1, L1_63, L2_64, L3_65, L4_66, L5_67, L6_68, L7_69, L8_70
end
function pppoeConnectionGetNext(A0_71)
  local L1_72, L2_73, L3_74, L4_75, L5_76, L6_77, L7_78, L8_79, L9_80
  L1_72 = _UPVALUE0_
  L1_72 = L1_72.NIL
  if A0_71 == L1_72 then
    L1_72 = _UPVALUE0_
    L1_72 = L1_72.INVALID_ARGUMENT
    return L1_72
  end
  L1_72 = tonumber
  L2_73 = A0_71
  L1_72 = L1_72(L2_73)
  if L1_72 ~= 2 then
    L1_72 = _UPVALUE0_
    L1_72 = L1_72.INVALID_ARGUMENT
    return L1_72
  end
  L1_72 = db
  L1_72 = L1_72.getRow
  L2_73 = pppoeTable
  L3_74 = "_ROWID_"
  L4_75 = "2"
  L1_72 = L1_72(L2_73, L3_74, L4_75)
  L2_73 = _UPVALUE0_
  L2_73 = L2_73.NIL
  if L1_72 == L2_73 then
    L2_73 = _UPVALUE0_
    L2_73 = L2_73.FAILURE
    return L2_73
  end
  L2_73 = pppoeTable
  L3_74 = "."
  L4_75 = _UPVALUE1_
  L4_75 = L4_75.wanPort
  L2_73 = L2_73 .. L3_74 .. L4_75
  L2_73 = L1_72[L2_73]
  L3_74 = pppoeTable
  L4_75 = "."
  L5_76 = _UPVALUE1_
  L5_76 = L5_76.userName
  L3_74 = L3_74 .. L4_75 .. L5_76
  L3_74 = L1_72[L3_74]
  L4_75 = pppoeTable
  L5_76 = "."
  L6_77 = _UPVALUE1_
  L6_77 = L6_77.password
  L4_75 = L4_75 .. L5_76 .. L6_77
  L4_75 = L1_72[L4_75]
  L5_76 = pppoeTable
  L6_77 = "."
  L7_78 = _UPVALUE1_
  L7_78 = L7_78.primaryDns
  L5_76 = L5_76 .. L6_77 .. L7_78
  L5_76 = L1_72[L5_76]
  L6_77 = pppoeTable
  L7_78 = "."
  L8_79 = _UPVALUE1_
  L8_79 = L8_79.secondaryDns
  L6_77 = L6_77 .. L7_78 .. L8_79
  L6_77 = L1_72[L6_77]
  L7_78 = pppoeTable
  L8_79 = "."
  L9_80 = _UPVALUE1_
  L9_80 = L9_80.authenticationOptions
  L7_78 = L7_78 .. L8_79 .. L9_80
  L7_78 = L1_72[L7_78]
  L8_79 = pppoeTable
  L9_80 = "."
  L8_79 = L8_79 .. L9_80 .. _UPVALUE1_.dhcpOptions
  L8_79 = L1_72[L8_79]
  L9_80 = pppoeTable
  L9_80 = L9_80 .. "." .. _UPVALUE1_.pppoeSessions
  L9_80 = L1_72[L9_80]
  return _UPVALUE0_.SUCCESS, 2, L2_73, L3_74, L4_75, L5_76, L6_77, L7_78, L8_79, L9_80
end
function pppoeConnectionSet(A0_81, A1_82, A2_83, A3_84, A4_85, A5_86, A6_87, A7_88, A8_89)
  local L9_90, L10_91, L11_92, L12_93, L13_94, L14_95, L15_96, L16_97, L17_98, L18_99
  L9_90 = _UPVALUE0_
  L9_90 = L9_90.ipv6ModeGet
  L11_92 = L9_90()
  L12_93 = nil
  L13_94 = tonumber
  L14_95 = L11_92
  L13_94 = L13_94(L14_95)
  if L13_94 ~= 3 then
    L13_94 = _UPVALUE1_
    L13_94 = L13_94.IPV6MODE_NOT_ENABLED
    return L13_94
  end
  L13_94 = _UPVALUE2_
  L13_94 = L13_94.NIL
  if A0_81 == L13_94 then
    L13_94 = tonumber
    L14_95 = A0_81
    L13_94 = L13_94(L14_95)
    if L13_94 ~= 1 then
      L13_94 = tonumber
      L14_95 = A0_81
      L13_94 = L13_94(L14_95)
      if L13_94 ~= 2 then
        L13_94 = _UPVALUE2_
        L13_94 = L13_94.INVALID_ARGUMENT
        return L13_94
      end
    end
  end
  L13_94 = tonumber
  L14_95 = A0_81
  L13_94 = L13_94(L14_95)
  if L13_94 ~= 1 or A1_82 == "WAN1" then
    L13_94 = tonumber
    L14_95 = A0_81
    L13_94 = L13_94(L14_95)
  elseif L13_94 == 2 and A1_82 ~= "WAN2" then
    L13_94 = _UPVALUE2_
    L13_94 = L13_94.INVALID_ARGUMENT
    return L13_94
  end
  L13_94 = _UPVALUE2_
  L13_94 = L13_94.NIL
  if A1_82 == L13_94 then
    L13_94 = _UPVALUE2_
    L13_94 = L13_94.INVALID_ARGUMENT
    return L13_94
  end
  if A1_82 ~= "WAN1" and A1_82 ~= "WAN2" then
    L13_94 = _UPVALUE2_
    L13_94 = L13_94.INVALID_ARGUMENT
    return L13_94
  end
  L13_94 = _UPVALUE2_
  L13_94 = L13_94.NIL
  if A2_83 == L13_94 then
    L13_94 = _UPVALUE3_
    L13_94 = L13_94.WAN_PPPOE_USERNAME_NIL
    return L13_94
  end
  L13_94 = _UPVALUE2_
  L13_94 = L13_94.NIL
  if A3_84 == L13_94 then
    L13_94 = _UPVALUE3_
    L13_94 = L13_94.WAN_PPPOE_PWD_NIL
    return L13_94
  end
  L13_94 = tonumber
  L14_95 = A7_88
  L13_94 = L13_94(L14_95)
  L14_95 = DISABLE
  if L13_94 == L14_95 then
    L13_94 = _UPVALUE2_
    L13_94 = L13_94.NIL
    if A4_85 == L13_94 then
      L13_94 = _UPVALUE3_
      L13_94 = L13_94.WAN_PPPOE_PRI_DNS_NIL
      return L13_94
    end
    L13_94 = _UPVALUE4_
    L13_94 = L13_94.ipAddressCheck
    L14_95 = 10
    L15_96 = A4_85
    L13_94 = L13_94(L14_95, L15_96)
    L12_93 = L13_94
    L13_94 = _UPVALUE2_
    L13_94 = L13_94.SUCCESS
    if L12_93 ~= L13_94 then
      L13_94 = _UPVALUE3_
      L13_94 = L13_94.WAN_PPPOE_INVALID_PRI_DNS
      return L13_94
    end
    L13_94 = _UPVALUE2_
    L13_94 = L13_94.NIL
    if A5_86 == L13_94 then
      L13_94 = _UPVALUE3_
      L13_94 = L13_94.WAN_PPPOE_SEC_DNS_NIL
      return L13_94
    end
    L13_94 = _UPVALUE4_
    L13_94 = L13_94.ipAddressCheck
    L14_95 = 10
    L15_96 = A5_86
    L13_94 = L13_94(L14_95, L15_96)
    L12_93 = L13_94
    L13_94 = _UPVALUE2_
    L13_94 = L13_94.SUCCESS
    if L12_93 ~= L13_94 then
      L13_94 = _UPVALUE3_
      L13_94 = L13_94.WAN_PPPOE_INVALID_SEC_DNS
      return L13_94
    end
  end
  L13_94 = tonumber
  L14_95 = A6_87
  L13_94 = L13_94(L14_95)
  L14_95 = _UPVALUE2_
  L14_95 = L14_95.NIL
  if L13_94 == L14_95 then
    L13_94 = _UPVALUE3_
    L13_94 = L13_94.WAN_PPPOE_AUTH_OPT_NIL
    return L13_94
  end
  L13_94 = tonumber
  L14_95 = A6_87
  L13_94 = L13_94(L14_95)
  L14_95 = AUTO_NEGOTIATE
  if L13_94 ~= L14_95 then
    L13_94 = tonumber
    L14_95 = A6_87
    L13_94 = L13_94(L14_95)
    L14_95 = PAP
    if L13_94 ~= L14_95 then
      L13_94 = tonumber
      L14_95 = A6_87
      L13_94 = L13_94(L14_95)
      L14_95 = CHAP
      if L13_94 ~= L14_95 then
        L13_94 = tonumber
        L14_95 = A6_87
        L13_94 = L13_94(L14_95)
        L14_95 = MS_CHAP
        if L13_94 ~= L14_95 then
          L13_94 = tonumber
          L14_95 = A6_87
          L13_94 = L13_94(L14_95)
          L14_95 = MS_CHAPv2
          if L13_94 ~= L14_95 then
            L13_94 = _UPVALUE3_
            L13_94 = L13_94.WAN_PPPOE_INVALID_AUTH_OPT
            return L13_94
          end
        end
      end
    end
  end
  L13_94 = tonumber
  L14_95 = A7_88
  L13_94 = L13_94(L14_95)
  L14_95 = _UPVALUE2_
  L14_95 = L14_95.NIL
  if L13_94 == L14_95 then
    L13_94 = _UPVALUE3_
    L13_94 = L13_94.WAN_PPPOE_DHCP_OPT_NIL
    return L13_94
  end
  L13_94 = tonumber
  L14_95 = A7_88
  L13_94 = L13_94(L14_95)
  L14_95 = DISABLE
  if L13_94 ~= L14_95 then
    L13_94 = tonumber
    L14_95 = A7_88
    L13_94 = L13_94(L14_95)
    L14_95 = STATELESS
    if L13_94 ~= L14_95 then
      L13_94 = tonumber
      L14_95 = A7_88
      L13_94 = L13_94(L14_95)
      L14_95 = STATEFUL
      if L13_94 ~= L14_95 then
        L13_94 = tonumber
        L14_95 = A7_88
        L13_94 = L13_94(L14_95)
        L14_95 = STATELESS_WITH_PREFIX
        if L13_94 ~= L14_95 then
          L13_94 = tonumber
          L14_95 = A7_88
          L13_94 = L13_94(L14_95)
          L14_95 = STATEFUL_WITH_PREFIX
          if L13_94 ~= L14_95 then
            L13_94 = _UPVALUE3_
            L13_94 = L13_94.WAN_PPPOE_INVALID_DHCP_OPT
            return L13_94
          end
        end
      end
    end
  end
  L13_94 = tonumber
  L14_95 = A8_89
  L13_94 = L13_94(L14_95)
  L14_95 = _UPVALUE2_
  L14_95 = L14_95.NIL
  if L13_94 == L14_95 then
    L13_94 = _UPVALUE3_
    L13_94 = L13_94.WAN_PPPOE_DHCP_OPT_NIL
    return L13_94
  end
  L13_94 = tonumber
  L14_95 = A8_89
  L13_94 = L13_94(L14_95)
  L14_95 = SEPARATE_SESSION
  if L13_94 ~= L14_95 then
    L13_94 = tonumber
    L14_95 = A8_89
    L13_94 = L13_94(L14_95)
    L14_95 = COMMON_SESSION
    if L13_94 ~= L14_95 then
      L13_94 = _UPVALUE3_
      L13_94 = L13_94.WAN_PPPOE_INVALID_DHCP_OPT
      return L13_94
    end
  end
  L13_94 = {}
  L14_95 = pppoeTable
  L15_96 = "."
  L16_97 = _UPVALUE5_
  L16_97 = L16_97.wanPort
  L14_95 = L14_95 .. L15_96 .. L16_97
  L13_94[L14_95] = A1_82
  L14_95 = pppoeTable
  L15_96 = "."
  L16_97 = _UPVALUE5_
  L16_97 = L16_97.userName
  L14_95 = L14_95 .. L15_96 .. L16_97
  L13_94[L14_95] = A2_83
  L14_95 = pppoeTable
  L15_96 = "."
  L16_97 = _UPVALUE5_
  L16_97 = L16_97.password
  L14_95 = L14_95 .. L15_96 .. L16_97
  L13_94[L14_95] = A3_84
  L14_95 = pppoeTable
  L15_96 = "."
  L16_97 = _UPVALUE5_
  L16_97 = L16_97.primaryDns
  L14_95 = L14_95 .. L15_96 .. L16_97
  L13_94[L14_95] = A4_85
  L14_95 = pppoeTable
  L15_96 = "."
  L16_97 = _UPVALUE5_
  L16_97 = L16_97.secondaryDns
  L14_95 = L14_95 .. L15_96 .. L16_97
  L13_94[L14_95] = A5_86
  L14_95 = pppoeTable
  L15_96 = "."
  L16_97 = _UPVALUE5_
  L16_97 = L16_97.authenticationOptions
  L14_95 = L14_95 .. L15_96 .. L16_97
  L13_94[L14_95] = A6_87
  L14_95 = pppoeTable
  L15_96 = "."
  L16_97 = _UPVALUE5_
  L16_97 = L16_97.dhcpOptions
  L14_95 = L14_95 .. L15_96 .. L16_97
  L13_94[L14_95] = A7_88
  L14_95 = pppoeTable
  L15_96 = "."
  L16_97 = _UPVALUE5_
  L16_97 = L16_97.pppoeSessions
  L14_95 = L14_95 .. L15_96 .. L16_97
  L13_94[L14_95] = A8_89
  L14_95 = db
  L14_95 = L14_95.update
  L15_96 = pppoeTable
  L16_97 = L13_94
  L17_98 = A0_81
  L16_97 = L14_95(L15_96, L16_97, L17_98)
  L17_98 = _UPVALUE2_
  L17_98 = L17_98.NIL
  if L15_96 == L17_98 then
    L17_98 = _UPVALUE2_
    L17_98 = L17_98.FAILURE
    L18_99 = A0_81
    return L17_98, L18_99
  end
  L17_98 = db
  L17_98 = L17_98.existsRowWhere
  L18_99 = "dhcpv6c"
  L17_98 = L17_98(L18_99, "LogicalIfName='" .. A1_82 .. "PPPOE6'")
  if L17_98 then
    L17_98 = {}
    L18_99 = tonumber
    L18_99 = L18_99(A7_88)
    if L18_99 == STATELESS then
      L17_98["dhcpv6c.statelessMode"] = "1"
      L17_98["dhcpv6c.prefixDelegation"] = "0"
    else
      L18_99 = tonumber
      L18_99 = L18_99(A7_88)
      if L18_99 == STATEFUL then
        L17_98["dhcpv6c.statelessMode"] = "0"
        L17_98["dhcpv6c.prefixDelegation"] = "0"
      else
        L18_99 = tonumber
        L18_99 = L18_99(A7_88)
        if L18_99 == STATELESS_WITH_PREFIX then
          L17_98["dhcpv6c.statelessMode"] = "1"
          L17_98["dhcpv6c.prefixDelegation"] = "1"
        else
          L18_99 = tonumber
          L18_99 = L18_99(A7_88)
          if L18_99 == STATEFUL_WITH_PREFIX then
            L17_98["dhcpv6c.statelessMode"] = "0"
            L17_98["dhcpv6c.prefixDelegation"] = "1"
          end
        end
      end
    end
    if L17_98 ~= nil then
      L18_99 = db
      L18_99 = L18_99.existsRowWhere
      L18_99 = L18_99("dhcpv6c", "LogicalIfName='" .. A1_82 .. "PPPOE6'")
      if L18_99 ~= nil then
        L12_93 = dhcp6Config(L17_98, L18_99, "edit")
        if L12_93 == _UPVALUE2_.NIL then
          return _UPVALUE2_.FAILURE, A0_81
        end
      else
        return _UPVALUE2_.FAILURE, A0_81
      end
    end
  end
  L17_98 = _UPVALUE2_
  L17_98 = L17_98.SUCCESS
  L18_99 = A0_81
  return L17_98, L18_99
end
function pppoeConnectionCreate(A0_100, A1_101, A2_102, A3_103, A4_104, A5_105, A6_106)
  return _UPVALUE0_.NOT_SUPPORTED
end
function pppoeConnectionDelete(A0_107)
  local L2_108
  L2_108 = _UPVALUE0_
  L2_108 = L2_108.NOT_SUPPORTED
  return L2_108, A0_107
end
function dhcp6Config(A0_109, A1_110, A2_111)
  if db.typeAndRangeValidate(A0_109) then
    if A2_111 == "add" then
      return db.insert("dhcpv6c", A0_109)
    elseif A2_111 == "edit" then
      return db.update("dhcpv6c", A0_109, A1_110)
    elseif A2_111 == "delete" then
      return nil
    end
  end
  return false
end
