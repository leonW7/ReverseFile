local L0_0
L0_0 = module
L0_0("com.teamf1.core.wan.multiwan", package.seeall)
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
L0_0("teamf1lualib/wan_client")
L0_0 = require
L0_0("teamf1lualib/wan_pptp")
L0_0 = require
L0_0("teamf1lualib/wan_l2tp")
L0_0 = require
L0_0("teamf1lualib/wan_japanese_multiple_pppoe")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).multiWanMode = "Wanmode"
;({}).failureDetectionMethod = "FailureDetectionMeth"
;({}).retryInterval = "RetryTime"
;({}).maxFailures = "RetryAttempts"
;({}).defaultWanPort = "DedicatedLogicalIfName"
;({}).primaryWanPort = "FailoverPriLogicalIfName"
;({}).secondaryWanPort = "FailoverSecLogicalIfName"
;({}).loadTolerance = "LoadTolerance"
;({}).maxBandwidth = "MaxBandwidth"
;({}).Unit = "Unit"
;({}).wanIpAddressPing = "PingIp"
;({}).wanIpAddressDns = "DnsIp"
;({}).nasIfaceName = "routeIfaceName"
;({}).nasIface = "nasIface"
;({}).configPortUsage = "LogicalIfName"
function multiWanModeGet()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.multiWanMode)
  if L0_1 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_1
end
function multiWanModeGetNext(A0_2)
  local L2_3, L3_4
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.NOT_SUPPORTED
  L3_4 = 0
  return L2_3, L3_4, 0
end
function multiWanModeSet(A0_5, A1_6)
  local L2_7, L3_8, L4_9
  L2_7 = _UPVALUE0_
  L2_7 = L2_7.NIL
  if A1_6 == L2_7 then
    L2_7 = _UPVALUE0_
    L2_7 = L2_7.INVALID_ARGUMENT
    return L2_7
  end
  L2_7 = tonumber
  L3_8 = A1_6
  L2_7 = L2_7(L3_8)
  L3_8 = _UPVALUE0_
  L3_8 = L3_8.NIL
  if L2_7 == L3_8 then
    L3_8 = _UPVALUE0_
    L3_8 = L3_8.INVALID_ARGUMENT
    return L3_8
  end
  L3_8 = _UPVALUE1_
  if A1_6 ~= L3_8 then
    L3_8 = _UPVALUE2_
    if A1_6 ~= L3_8 then
      L3_8 = _UPVALUE3_
      if A1_6 ~= L3_8 then
        L3_8 = _UPVALUE4_
        if A1_6 ~= L3_8 then
          L3_8 = _UPVALUE0_
          L3_8 = L3_8.INVALID_ARGUMENT
          return L3_8
        end
      end
    end
  end
  L3_8 = nil
  L4_9 = db
  L4_9 = L4_9.setAttribute
  L4_9 = L4_9(_UPVALUE5_, _UPVALUE6_, A0_5, _UPVALUE7_.multiWanMode, A1_6)
  L3_8 = L4_9
  L4_9 = _UPVALUE0_
  L4_9 = L4_9.FALSE
  if L3_8 == L4_9 then
    L4_9 = _UPVALUE0_
    L4_9 = L4_9.FAILURE
    return L4_9, A0_5
  end
  L4_9 = _UPVALUE1_
  if A1_6 ~= L4_9 then
    L4_9 = _UPVALUE2_
  elseif A1_6 == L4_9 then
    L4_9 = db
    L4_9 = L4_9.getAttribute
    L4_9 = L4_9(_UPVALUE8_, _UPVALUE6_, _UPVALUE9_, _UPVALUE7_.nasIfaceName)
    if L4_9 and L4_9 ~= _UPVALUE10_ then
      db.setAttribute(_UPVALUE8_, _UPVALUE6_, _UPVALUE9_, _UPVALUE7_.nasIfaceName, _UPVALUE10_)
    end
    L4_9 = db.getAttribute(_UPVALUE11_, _UPVALUE6_, _UPVALUE9_, _UPVALUE7_.nasIface)
    if L4_9 and L4_9 ~= _UPVALUE10_ then
      db.setAttribute(_UPVALUE11_, _UPVALUE6_, _UPVALUE9_, _UPVALUE7_.nasIface, _UPVALUE10_)
    end
  end
  L4_9 = _UPVALUE0_
  L4_9 = L4_9.SUCCESS
  return L4_9, A0_5
end
function failureDetectionMethodGet()
  local L0_10
  L0_10 = db
  L0_10 = L0_10.getAttribute
  L0_10 = L0_10(_UPVALUE0_, _UPVALUE1_, "1", _UPVALUE2_.failureDetectionMethod)
  if L0_10 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L0_10
end
function failureDetectionMethodGetNext(A0_11)
  local L2_12, L3_13
  L2_12 = _UPVALUE0_
  L2_12 = L2_12.NOT_SUPPORTED
  L3_13 = 0
  return L2_12, L3_13, 0
end
function failureDetectionMethodSet(A0_14, A1_15)
  local L2_16, L3_17, L4_18
  L2_16 = db
  L2_16 = L2_16.getAttribute
  L3_17 = _UPVALUE0_
  L4_18 = _UPVALUE1_
  L2_16 = L2_16(L3_17, L4_18, _UPVALUE2_, _UPVALUE3_.multiWanMode)
  L3_17 = _UPVALUE4_
  if L2_16 == L3_17 then
    L3_17 = _UPVALUE5_
    L3_17 = L3_17.DEPENDENCY_NOT_MET
    return L3_17
  end
  L3_17 = _UPVALUE5_
  L3_17 = L3_17.NIL
  if A1_15 == L3_17 then
    L3_17 = _UPVALUE5_
    L3_17 = L3_17.INVALID_ARGUMENT
    return L3_17
  end
  L3_17 = tonumber
  L4_18 = A1_15
  L3_17 = L3_17(L4_18)
  L4_18 = _UPVALUE5_
  L4_18 = L4_18.NIL
  if L3_17 == L4_18 then
    L4_18 = _UPVALUE5_
    L4_18 = L4_18.INVALID_ARGUMENT
    return L4_18
  end
  L4_18 = _UPVALUE6_
  if A1_15 ~= L4_18 then
    L4_18 = _UPVALUE7_
    if A1_15 ~= L4_18 then
      L4_18 = _UPVALUE8_
      if A1_15 ~= L4_18 then
        L4_18 = _UPVALUE9_
        if A1_15 ~= L4_18 then
          L4_18 = _UPVALUE5_
          L4_18 = L4_18.INVALID_ARGUMENT
          return L4_18
        end
      end
    end
  end
  L4_18 = nil
  L4_18 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, A0_14, _UPVALUE3_.failureDetectionMethod, A1_15)
  if L4_18 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_14
  end
  return _UPVALUE5_.SUCCESS, A0_14
end
function retryIntervalGet()
  local L0_19
  L0_19 = db
  L0_19 = L0_19.getAttribute
  L0_19 = L0_19(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.retryInterval)
  if L0_19 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_19
end
function retryIntervalGetNext(A0_20)
  local L2_21, L3_22
  L2_21 = _UPVALUE0_
  L2_21 = L2_21.NOT_SUPPORTED
  L3_22 = 0
  return L2_21, L3_22, 0
end
function retryIntervalSet(A0_23, A1_24)
  local L2_25, L3_26, L4_27
  L2_25 = db
  L2_25 = L2_25.getAttribute
  L3_26 = _UPVALUE0_
  L4_27 = _UPVALUE1_
  L2_25 = L2_25(L3_26, L4_27, _UPVALUE2_, _UPVALUE3_.multiWanMode)
  L3_26 = _UPVALUE4_
  if L2_25 == L3_26 then
    L3_26 = _UPVALUE5_
    L3_26 = L3_26.DEPENDENCY_NOT_MET
    return L3_26
  end
  L3_26 = _UPVALUE5_
  L3_26 = L3_26.NIL
  if A1_24 == L3_26 then
    L3_26 = _UPVALUE5_
    L3_26 = L3_26.INVALID_ARGUMENT
    return L3_26
  end
  L3_26 = tonumber
  L4_27 = A1_24
  L3_26 = L3_26(L4_27)
  L4_27 = _UPVALUE5_
  L4_27 = L4_27.NIL
  if L3_26 == L4_27 then
    L4_27 = _UPVALUE5_
    L4_27 = L4_27.INVALID_ARGUMENT
    return L4_27
  end
  L4_27 = _UPVALUE6_
  if not (L3_26 < L4_27) then
    L4_27 = _UPVALUE7_
  elseif L3_26 > L4_27 then
    L4_27 = _UPVALUE5_
    L4_27 = L4_27.INVALID_ARGUMENT
    return L4_27
  end
  L4_27 = nil
  L4_27 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, A0_23, _UPVALUE3_.retryInterval, A1_24)
  if L4_27 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_23
  end
  return _UPVALUE5_.SUCCESS, A0_23
end
function maxFailuresGet()
  local L0_28
  L0_28 = db
  L0_28 = L0_28.getAttribute
  L0_28 = L0_28(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.maxFailures)
  if L0_28 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_28
end
function maxFailuresGetNext(A0_29)
  local L2_30, L3_31
  L2_30 = _UPVALUE0_
  L2_30 = L2_30.NOT_SUPPORTED
  L3_31 = 0
  return L2_30, L3_31, 0
end
function maxFailuresSet(A0_32, A1_33)
  local L2_34, L3_35, L4_36
  L2_34 = db
  L2_34 = L2_34.getAttribute
  L3_35 = _UPVALUE0_
  L4_36 = _UPVALUE1_
  L2_34 = L2_34(L3_35, L4_36, _UPVALUE2_, _UPVALUE3_.multiWanMode)
  L3_35 = _UPVALUE4_
  if L2_34 == L3_35 then
    L3_35 = _UPVALUE5_
    L3_35 = L3_35.DEPENDENCY_NOT_MET
    return L3_35
  end
  L3_35 = _UPVALUE5_
  L3_35 = L3_35.NIL
  if A1_33 == L3_35 then
    L3_35 = _UPVALUE5_
    L3_35 = L3_35.INVALID_ARGUMENT
    return L3_35
  end
  L3_35 = tonumber
  L4_36 = A1_33
  L3_35 = L3_35(L4_36)
  L4_36 = _UPVALUE5_
  L4_36 = L4_36.NIL
  if L3_35 == L4_36 then
    L4_36 = _UPVALUE5_
    L4_36 = L4_36.INVALID_ARGUMENT
    return L4_36
  end
  L4_36 = _UPVALUE6_
  if not (L3_35 < L4_36) then
    L4_36 = _UPVALUE7_
  elseif L3_35 > L4_36 then
    L4_36 = _UPVALUE5_
    L4_36 = L4_36.INVALID_ARGUMENT
    return L4_36
  end
  L4_36 = nil
  L4_36 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, A0_32, _UPVALUE3_.maxFailures, A1_33)
  if L4_36 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_32
  end
  return _UPVALUE5_.SUCCESS, A0_32
end
function defaultWanPortGet()
  local L0_37
  L0_37 = db
  L0_37 = L0_37.getAttribute
  L0_37 = L0_37(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.defaultWanPort)
  if L0_37 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_37
end
function defaultWanPortGetNext(A0_38)
  local L2_39, L3_40
  L2_39 = _UPVALUE0_
  L2_39 = L2_39.NOT_SUPPORTED
  L3_40 = 0
  return L2_39, L3_40, 0
end
function defaultWanPortSet(A0_41, A1_42)
  local L2_43, L3_44, L4_45, L5_46, L6_47, L7_48
  L2_43 = db
  L2_43 = L2_43.getAttribute
  L3_44 = _UPVALUE0_
  L4_45 = _UPVALUE1_
  L5_46 = _UPVALUE2_
  L6_47 = _UPVALUE3_
  L6_47 = L6_47.multiWanMode
  L2_43 = L2_43(L3_44, L4_45, L5_46, L6_47)
  L3_44 = _UPVALUE4_
  if L2_43 ~= L3_44 then
    L3_44 = _UPVALUE5_
    L3_44 = L3_44.DEPENDENCY_NOT_MET
    return L3_44
  end
  L3_44 = _UPVALUE6_
  if A1_42 ~= L3_44 then
    L3_44 = _UPVALUE7_
    if A1_42 ~= L3_44 then
      L3_44 = configurablePortCheck
      L3_44 = L3_44()
      L4_45 = _UPVALUE5_
      L4_45 = L4_45.SUCCESS
      if L3_44 ~= L4_45 then
        return L3_44
      end
    end
  end
  L3_44 = _UPVALUE5_
  L3_44 = L3_44.NIL
  if A1_42 == L3_44 then
    L3_44 = _UPVALUE5_
    L3_44 = L3_44.INVALID_ARGUMENT
    return L3_44
  end
  L3_44 = _UPVALUE6_
  if A1_42 ~= L3_44 then
    L3_44 = _UPVALUE8_
    if A1_42 ~= L3_44 then
      L3_44 = _UPVALUE7_
      if A1_42 ~= L3_44 then
        L3_44 = _UPVALUE5_
        L3_44 = L3_44.INVALID_ARGUMENT
        return L3_44
      end
    end
  end
  L3_44 = db
  L3_44 = L3_44.getAttribute
  L4_45 = _UPVALUE9_
  L5_46 = _UPVALUE10_
  L6_47 = _UPVALUE11_
  L7_48 = _UPVALUE12_
  L3_44 = L3_44(L4_45, L5_46, L6_47, L7_48)
  L4_45 = _UPVALUE5_
  L4_45 = L4_45.NIL
  if L3_44 ~= L4_45 then
    L4_45 = _UPVALUE13_
    if L3_44 ~= L4_45 and A1_42 ~= L3_44 then
      L4_45 = _UPVALUE14_
      L4_45 = L4_45.PORT_IN_USE_CAPTURE_PACKET
      return L4_45
    end
  end
  L4_45 = nil
  L5_46 = db
  L5_46 = L5_46.setAttribute
  L6_47 = _UPVALUE0_
  L7_48 = _UPVALUE1_
  L5_46 = L5_46(L6_47, L7_48, A0_41, _UPVALUE3_.defaultWanPort, A1_42)
  L4_45 = L5_46
  L5_46 = _UPVALUE5_
  L5_46 = L5_46.FALSE
  if L4_45 == L5_46 then
    L5_46 = _UPVALUE5_
    L5_46 = L5_46.FAILURE
    L6_47 = A0_41
    return L5_46, L6_47
  end
  L5_46 = db
  L5_46 = L5_46.getTable
  L6_47 = "sixToFourTunnel"
  L5_46 = L5_46(L6_47)
  L5_46["sixToFourTunnel.LogicalIfName"] = A1_42
  L6_47 = db
  L6_47 = L6_47.update
  L7_48 = "sixToFourTunnel"
  L6_47 = L6_47(L7_48, L5_46, "1")
  L7_48 = _UPVALUE5_
  L7_48 = L7_48.FALSE
  if L6_47 == L7_48 then
    L7_48 = _UPVALUE5_
    L7_48 = L7_48.FAILURE
    return L7_48, A0_41
  end
  L7_48 = db
  L7_48 = L7_48.getTable
  L7_48 = L7_48("radvdLANPrefixPool")
  L7_48["radvdLANPrefixPool.Base6to4Interface"] = A1_42
  if db.update("radvdLANPrefixPool", L7_48, "1") == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_41
  end
  return _UPVALUE5_.SUCCESS, A0_41
end
function primaryWanPortGet()
  local L0_49
  L0_49 = db
  L0_49 = L0_49.getAttribute
  L0_49 = L0_49(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.primaryWanPort)
  if L0_49 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_49
end
function primaryWanPortGetNext(A0_50)
  local L2_51, L3_52
  L2_51 = _UPVALUE0_
  L2_51 = L2_51.NOT_SUPPORTED
  L3_52 = 0
  return L2_51, L3_52, 0
end
function primaryWanPortSet(A0_53, A1_54)
  local L2_55, L3_56, L4_57
  L2_55 = db
  L2_55 = L2_55.getAttribute
  L3_56 = _UPVALUE0_
  L4_57 = _UPVALUE1_
  L2_55 = L2_55(L3_56, L4_57, _UPVALUE2_, _UPVALUE3_.multiWanMode)
  L3_56 = _UPVALUE4_
  if L2_55 ~= L3_56 then
    L3_56 = _UPVALUE5_
    L3_56 = L3_56.DEPENDENCY_NOT_MET
    return L3_56
  end
  L3_56 = _UPVALUE5_
  L3_56 = L3_56.NIL
  if A1_54 == L3_56 then
    L3_56 = _UPVALUE5_
    L3_56 = L3_56.INVALID_ARGUMENT
    return L3_56
  end
  L3_56 = _UPVALUE6_
  if A1_54 ~= L3_56 then
    L3_56 = _UPVALUE7_
    if A1_54 ~= L3_56 then
      L3_56 = _UPVALUE5_
      L3_56 = L3_56.INVALID_ARGUMENT
      return L3_56
    end
  end
  L3_56, L4_57 = nil, nil
  if A1_54 == _UPVALUE6_ then
    L3_56 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, A0_53, _UPVALUE3_.primaryWanPort, A1_54)
    L4_57 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, A0_53, _UPVALUE3_.secondaryWanPort, _UPVALUE7_)
  end
  if A1_54 == _UPVALUE7_ then
    L3_56 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, A0_53, _UPVALUE3_.primaryWanPort, A1_54)
    L4_57 = db.setAttribute(_UPVALUE0_, _UPVALUE1_, A0_53, _UPVALUE3_.secondaryWanPort, _UPVALUE6_)
  end
  if L3_56 == _UPVALUE5_.FALSE or L4_57 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_53
  end
  return _UPVALUE5_.SUCCESS, A0_53
end
function ipAddressGet()
  local L0_58, L1_59, L2_60, L3_61
  L0_58 = db
  L0_58 = L0_58.getAttribute
  L1_59 = _UPVALUE0_
  L2_60 = _UPVALUE1_
  L3_61 = _UPVALUE2_
  L0_58 = L0_58(L1_59, L2_60, L3_61, _UPVALUE3_.multiWanMode)
  L1_59 = _UPVALUE4_
  if L0_58 ~= L1_59 then
    L1_59 = _UPVALUE5_
    L1_59 = L1_59.DEPENDENCY_NOT_MET
    return L1_59
  end
  L1_59 = db
  L1_59 = L1_59.getAttribute
  L2_60 = _UPVALUE0_
  L3_61 = _UPVALUE1_
  L1_59 = L1_59(L2_60, L3_61, "1", _UPVALUE3_.failureDetectionMethod)
  L2_60 = _UPVALUE6_
  if L1_59 ~= L2_60 then
    L2_60 = _UPVALUE7_
    if L1_59 ~= L2_60 then
      L2_60 = _UPVALUE5_
      L2_60 = L2_60.DEPENDENCY_NOT_MET
      return L2_60
    end
  end
  L2_60 = db
  L2_60 = L2_60.getAttribute
  L3_61 = _UPVALUE0_
  L2_60 = L2_60(L3_61, _UPVALUE1_, "1", _UPVALUE3_.primaryWanPort)
  L3_61 = nil
  if L1_59 == _UPVALUE7_ and L2_60 == _UPVALUE8_ then
    L3_61 = db.getAttribute(_UPVALUE9_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.wanIpAddressPing)
  end
  if L1_59 == _UPVALUE7_ and L2_60 == _UPVALUE10_ then
    L3_61 = db.getAttribute(_UPVALUE9_, _UPVALUE1_, _UPVALUE11_, _UPVALUE3_.wanIpAddressPing)
  end
  if L1_59 == _UPVALUE7_ and L2_60 == _UPVALUE12_ then
    L3_61 = db.getAttribute(_UPVALUE9_, _UPVALUE1_, _UPVALUE13_, _UPVALUE3_.wanIpAddressPing)
  end
  if L1_59 == _UPVALUE6_ and L2_60 == _UPVALUE8_ then
    L3_61 = db.getAttribute(_UPVALUE9_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.wanIpAddressDns)
  end
  if L1_59 == _UPVALUE6_ and L2_60 == _UPVALUE10_ then
    L3_61 = db.getAttribute(_UPVALUE9_, _UPVALUE1_, _UPVALUE11_, _UPVALUE3_.wanIpAddressDns)
  end
  if L1_59 == _UPVALUE6_ and L2_60 == _UPVALUE12_ then
    L3_61 = db.getAttribute(_UPVALUE9_, _UPVALUE1_, _UPVALUE13_, _UPVALUE3_.wanIpAddressDns)
  end
  if L3_61 == _UPVALUE5_.NIL then
    return _UPVALUE5_.FAILURE
  end
  return _UPVALUE5_.SUCCESS, 1, L3_61
end
function ipAddressGetNext(A0_62)
  local L2_63, L3_64
  L2_63 = _UPVALUE0_
  L2_63 = L2_63.NOT_SUPPORTED
  L3_64 = 0
  return L2_63, L3_64, 0
end
function ipAddressSet(A0_65, A1_66)
  local L2_67, L3_68, L4_69, L5_70
  L2_67 = db
  L2_67 = L2_67.getAttribute
  L3_68 = _UPVALUE0_
  L4_69 = _UPVALUE1_
  L5_70 = _UPVALUE2_
  L2_67 = L2_67(L3_68, L4_69, L5_70, _UPVALUE3_.multiWanMode)
  L3_68 = _UPVALUE4_
  if L2_67 ~= L3_68 then
    L3_68 = _UPVALUE5_
    L3_68 = L3_68.DEPENDENCY_NOT_MET
    return L3_68
  end
  L3_68 = db
  L3_68 = L3_68.getAttribute
  L4_69 = _UPVALUE0_
  L5_70 = _UPVALUE1_
  L3_68 = L3_68(L4_69, L5_70, "1", _UPVALUE3_.failureDetectionMethod)
  L4_69 = _UPVALUE6_
  if L3_68 ~= L4_69 then
    L4_69 = _UPVALUE7_
    if L3_68 ~= L4_69 then
      L4_69 = _UPVALUE5_
      L4_69 = L4_69.DEPENDENCY_NOT_MET
      return L4_69
    end
  end
  L4_69 = _UPVALUE5_
  L4_69 = L4_69.NIL
  if A1_66 == L4_69 then
    L4_69 = _UPVALUE5_
    L4_69 = L4_69.INVALID_ARGUMENT
    return L4_69
  end
  L4_69 = _UPVALUE8_
  L4_69 = L4_69.ipAddressCheck
  L5_70 = _UPVALUE9_
  L4_69 = L4_69(L5_70, A1_66)
  valid = L4_69
  L4_69 = valid
  L5_70 = _UPVALUE5_
  L5_70 = L5_70.SUCCESS
  if L4_69 ~= L5_70 then
    L4_69 = _UPVALUE5_
    L4_69 = L4_69.INVALID_ARGUMENT
    return L4_69
  end
  L4_69 = db
  L4_69 = L4_69.getAttribute
  L5_70 = _UPVALUE0_
  L4_69 = L4_69(L5_70, _UPVALUE1_, "1", _UPVALUE3_.primaryWanPort)
  L5_70 = nil
  if L3_68 == _UPVALUE7_ and L4_69 == _UPVALUE10_ then
    L5_70 = db.setAttribute(_UPVALUE11_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.wanIpAddressPing, A1_66)
  end
  if L3_68 == _UPVALUE7_ and L4_69 == _UPVALUE12_ then
    L5_70 = db.setAttribute(_UPVALUE11_, _UPVALUE1_, _UPVALUE13_, _UPVALUE3_.wanIpAddressPing, A1_66)
  end
  if L3_68 == _UPVALUE7_ and L4_69 == _UPVALUE14_ then
    L5_70 = db.setAttribute(_UPVALUE11_, _UPVALUE1_, _UPVALUE15_, _UPVALUE3_.wanIpAddressPing, A1_66)
  end
  if L3_68 == _UPVALUE6_ and L4_69 == _UPVALUE10_ then
    L5_70 = db.setAttribute(_UPVALUE11_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.wanIpAddressDns, A1_66)
  end
  if L3_68 == _UPVALUE6_ and L4_69 == _UPVALUE12_ then
    L5_70 = db.setAttribute(_UPVALUE11_, _UPVALUE1_, _UPVALUE13_, _UPVALUE3_.wanIpAddressDns, A1_66)
  end
  if L3_68 == _UPVALUE6_ and L4_69 == _UPVALUE14_ then
    L5_70 = db.setAttribute(_UPVALUE11_, _UPVALUE1_, _UPVALUE15_, _UPVALUE3_.wanIpAddressDns, A1_66)
  end
  if L5_70 == _UPVALUE5_.FALSE then
    return _UPVALUE5_.FAILURE, A0_65
  end
  return _UPVALUE5_.SUCCESS, A0_65
end
function wan1IpAddressGet()
  local L0_71, L1_72, L2_73
  L0_71 = db
  L0_71 = L0_71.getAttribute
  L1_72 = _UPVALUE0_
  L2_73 = _UPVALUE1_
  L0_71 = L0_71(L1_72, L2_73, _UPVALUE2_, _UPVALUE3_.multiWanMode)
  L1_72 = _UPVALUE4_
  if L0_71 ~= L1_72 then
    L1_72 = _UPVALUE5_
    if L0_71 ~= L1_72 then
      L1_72 = _UPVALUE6_
      L1_72 = L1_72.DEPENDENCY_NOT_MET
      return L1_72
    end
  end
  L1_72 = db
  L1_72 = L1_72.getAttribute
  L2_73 = _UPVALUE0_
  L1_72 = L1_72(L2_73, _UPVALUE1_, "1", _UPVALUE3_.failureDetectionMethod)
  L2_73 = _UPVALUE7_
  if L1_72 ~= L2_73 then
    L2_73 = _UPVALUE8_
    if L1_72 ~= L2_73 then
      L2_73 = _UPVALUE6_
      L2_73 = L2_73.DEPENDENCY_NOT_MET
      return L2_73
    end
  end
  L2_73 = nil
  if L1_72 == _UPVALUE8_ then
    L2_73 = db.getAttribute(_UPVALUE9_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.wanIpAddressPing)
  end
  if L1_72 == _UPVALUE7_ then
    L2_73 = db.getAttribute(_UPVALUE9_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.wanIpAddressDns)
  end
  if L2_73 == _UPVALUE6_.NIL then
    return _UPVALUE6_.FAILURE
  end
  return _UPVALUE6_.SUCCESS, 1, L2_73
end
function wan1IpAddressGetNext(A0_74)
  local L2_75, L3_76
  L2_75 = _UPVALUE0_
  L2_75 = L2_75.NOT_SUPPORTED
  L3_76 = 0
  return L2_75, L3_76, 0
end
function wan1IpAddressSet(A0_77, A1_78)
  local L2_79, L3_80, L4_81
  L2_79 = db
  L2_79 = L2_79.getAttribute
  L3_80 = _UPVALUE0_
  L4_81 = _UPVALUE1_
  L2_79 = L2_79(L3_80, L4_81, _UPVALUE2_, _UPVALUE3_.multiWanMode)
  L3_80 = _UPVALUE4_
  if L2_79 ~= L3_80 then
    L3_80 = _UPVALUE5_
    if L2_79 ~= L3_80 then
      L3_80 = _UPVALUE6_
      L3_80 = L3_80.DEPENDENCY_NOT_MET
      return L3_80
    end
  end
  L3_80 = db
  L3_80 = L3_80.getAttribute
  L4_81 = _UPVALUE0_
  L3_80 = L3_80(L4_81, _UPVALUE1_, "1", _UPVALUE3_.failureDetectionMethod)
  L4_81 = _UPVALUE7_
  if L3_80 ~= L4_81 then
    L4_81 = _UPVALUE8_
    if L3_80 ~= L4_81 then
      L4_81 = _UPVALUE6_
      L4_81 = L4_81.DEPENDENCY_NOT_MET
      return L4_81
    end
  end
  L4_81 = _UPVALUE6_
  L4_81 = L4_81.NIL
  if A1_78 == L4_81 then
    L4_81 = _UPVALUE6_
    L4_81 = L4_81.INVALID_ARGUMENT
    return L4_81
  end
  L4_81 = _UPVALUE9_
  L4_81 = L4_81.ipAddressCheck
  L4_81 = L4_81(_UPVALUE10_, A1_78)
  valid = L4_81
  L4_81 = valid
  if L4_81 ~= _UPVALUE6_.SUCCESS then
    L4_81 = _UPVALUE6_
    L4_81 = L4_81.INVALID_ARGUMENT
    return L4_81
  end
  L4_81 = nil
  if L3_80 == _UPVALUE8_ then
    L4_81 = db.setAttribute(_UPVALUE11_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.wanIpAddressPing, A1_78)
  end
  if L3_80 == _UPVALUE7_ then
    L4_81 = db.setAttribute(_UPVALUE11_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.wanIpAddressDns, A1_78)
  end
  if L4_81 == _UPVALUE6_.FALSE then
    return _UPVALUE6_.FAILURE, A0_77
  end
  return _UPVALUE6_.SUCCESS, A0_77
end
function wan2IpAddressGet()
  local L0_82, L1_83, L2_84
  L0_82 = db
  L0_82 = L0_82.getAttribute
  L1_83 = _UPVALUE0_
  L2_84 = _UPVALUE1_
  L0_82 = L0_82(L1_83, L2_84, _UPVALUE2_, _UPVALUE3_.multiWanMode)
  L1_83 = _UPVALUE4_
  if L0_82 ~= L1_83 then
    L1_83 = _UPVALUE5_
    if L0_82 ~= L1_83 then
      L1_83 = _UPVALUE6_
      L1_83 = L1_83.DEPENDENCY_NOT_MET
      return L1_83
    end
  end
  L1_83 = db
  L1_83 = L1_83.getAttribute
  L2_84 = _UPVALUE0_
  L1_83 = L1_83(L2_84, _UPVALUE1_, "1", _UPVALUE3_.failureDetectionMethod)
  L2_84 = _UPVALUE7_
  if L1_83 ~= L2_84 then
    L2_84 = _UPVALUE8_
    if L1_83 ~= L2_84 then
      L2_84 = _UPVALUE6_
      L2_84 = L2_84.DEPENDENCY_NOT_MET
      return L2_84
    end
  end
  L2_84 = nil
  if L1_83 == _UPVALUE8_ then
    L2_84 = db.getAttribute(_UPVALUE9_, _UPVALUE1_, _UPVALUE10_, _UPVALUE3_.wanIpAddressPing)
  end
  if L1_83 == _UPVALUE7_ then
    L2_84 = db.getAttribute(_UPVALUE9_, _UPVALUE1_, _UPVALUE10_, _UPVALUE3_.wanIpAddressDns)
  end
  if L2_84 == _UPVALUE6_.NIL then
    return _UPVALUE6_.FAILURE
  end
  return _UPVALUE6_.SUCCESS, 1, L2_84
end
function wan3IpAddressGet()
  local L0_85, L1_86, L2_87
  L0_85 = db
  L0_85 = L0_85.getAttribute
  L1_86 = _UPVALUE0_
  L2_87 = _UPVALUE1_
  L0_85 = L0_85(L1_86, L2_87, _UPVALUE2_, _UPVALUE3_.multiWanMode)
  L1_86 = _UPVALUE4_
  if L0_85 ~= L1_86 then
    L1_86 = _UPVALUE5_
    if L0_85 ~= L1_86 then
      L1_86 = _UPVALUE6_
      L1_86 = L1_86.DEPENDENCY_NOT_MET
      return L1_86
    end
  end
  L1_86 = db
  L1_86 = L1_86.getAttribute
  L2_87 = _UPVALUE0_
  L1_86 = L1_86(L2_87, _UPVALUE1_, "1", _UPVALUE3_.failureDetectionMethod)
  L2_87 = _UPVALUE7_
  if L1_86 ~= L2_87 then
    L2_87 = _UPVALUE8_
    if L1_86 ~= L2_87 then
      L2_87 = _UPVALUE6_
      L2_87 = L2_87.DEPENDENCY_NOT_MET
      return L2_87
    end
  end
  L2_87 = nil
  if L1_86 == _UPVALUE8_ then
    L2_87 = db.getAttribute(_UPVALUE9_, _UPVALUE1_, _UPVALUE10_, _UPVALUE3_.wanIpAddressPing)
  end
  if L1_86 == _UPVALUE7_ then
    L2_87 = db.getAttribute(_UPVALUE9_, _UPVALUE1_, _UPVALUE10_, _UPVALUE3_.wanIpAddressDns)
  end
  if L2_87 == _UPVALUE6_.NIL then
    return _UPVALUE6_.FAILURE
  end
  return _UPVALUE6_.SUCCESS, 1, L2_87
end
function wan3IpAddressSet(A0_88, A1_89)
  local L2_90, L3_91, L4_92
  L2_90 = db
  L2_90 = L2_90.getAttribute
  L3_91 = _UPVALUE0_
  L4_92 = _UPVALUE1_
  L2_90 = L2_90(L3_91, L4_92, _UPVALUE2_, _UPVALUE3_.multiWanMode)
  L3_91 = _UPVALUE4_
  if L2_90 ~= L3_91 then
    L3_91 = _UPVALUE5_
    if L2_90 ~= L3_91 then
      L3_91 = _UPVALUE6_
      L3_91 = L3_91.DEPENDENCY_NOT_MET
      return L3_91
    end
  end
  L3_91 = db
  L3_91 = L3_91.getAttribute
  L4_92 = _UPVALUE0_
  L3_91 = L3_91(L4_92, _UPVALUE1_, "1", _UPVALUE3_.failureDetectionMethod)
  L4_92 = _UPVALUE7_
  if L3_91 ~= L4_92 then
    L4_92 = _UPVALUE8_
    if L3_91 ~= L4_92 then
      L4_92 = _UPVALUE6_
      L4_92 = L4_92.DEPENDENCY_NOT_MET
      return L4_92
    end
  end
  L4_92 = _UPVALUE6_
  L4_92 = L4_92.NIL
  if A1_89 == L4_92 then
    L4_92 = _UPVALUE6_
    L4_92 = L4_92.INVALID_ARGUMENT
    return L4_92
  end
  L4_92 = _UPVALUE9_
  L4_92 = L4_92.ipAddressCheck
  L4_92 = L4_92(_UPVALUE10_, A1_89)
  valid = L4_92
  L4_92 = valid
  if L4_92 ~= _UPVALUE6_.SUCCESS then
    L4_92 = _UPVALUE6_
    L4_92 = L4_92.INVALID_ARGUMENT
    return L4_92
  end
  L4_92 = nil
  if L3_91 == _UPVALUE8_ then
    L4_92 = db.setAttribute(_UPVALUE11_, _UPVALUE1_, _UPVALUE12_, _UPVALUE3_.wanIpAddressPing, A1_89)
  end
  if L3_91 == _UPVALUE7_ then
    L4_92 = db.setAttribute(_UPVALUE11_, _UPVALUE1_, _UPVALUE12_, _UPVALUE3_.wanIpAddressDns, A1_89)
  end
  if L4_92 == _UPVALUE6_.FALSE then
    return _UPVALUE6_.FAILURE, A0_88
  end
  return _UPVALUE6_.SUCCESS, A0_88
end
function wan2IpAddressGetNext(A0_93)
  local L2_94, L3_95
  L2_94 = _UPVALUE0_
  L2_94 = L2_94.NOT_SUPPORTED
  L3_95 = 0
  return L2_94, L3_95, 0
end
function wan2IpAddressSet(A0_96, A1_97)
  local L2_98, L3_99, L4_100
  L2_98 = db
  L2_98 = L2_98.getAttribute
  L3_99 = _UPVALUE0_
  L4_100 = _UPVALUE1_
  L2_98 = L2_98(L3_99, L4_100, _UPVALUE2_, _UPVALUE3_.multiWanMode)
  L3_99 = _UPVALUE4_
  if L2_98 ~= L3_99 then
    L3_99 = _UPVALUE5_
    if L2_98 ~= L3_99 then
      L3_99 = _UPVALUE6_
      L3_99 = L3_99.DEPENDENCY_NOT_MET
      return L3_99
    end
  end
  L3_99 = db
  L3_99 = L3_99.getAttribute
  L4_100 = _UPVALUE0_
  L3_99 = L3_99(L4_100, _UPVALUE1_, "1", _UPVALUE3_.failureDetectionMethod)
  L4_100 = _UPVALUE7_
  if L3_99 ~= L4_100 then
    L4_100 = _UPVALUE8_
    if L3_99 ~= L4_100 then
      L4_100 = _UPVALUE6_
      L4_100 = L4_100.DEPENDENCY_NOT_MET
      return L4_100
    end
  end
  L4_100 = _UPVALUE6_
  L4_100 = L4_100.NIL
  if A1_97 == L4_100 then
    L4_100 = _UPVALUE6_
    L4_100 = L4_100.INVALID_ARGUMENT
    return L4_100
  end
  L4_100 = _UPVALUE9_
  L4_100 = L4_100.ipAddressCheck
  L4_100 = L4_100(_UPVALUE10_, A1_97)
  valid = L4_100
  L4_100 = valid
  if L4_100 ~= _UPVALUE6_.SUCCESS then
    L4_100 = _UPVALUE6_
    L4_100 = L4_100.INVALID_ARGUMENT
    return L4_100
  end
  L4_100 = nil
  if L3_99 == _UPVALUE8_ then
    L4_100 = db.setAttribute(_UPVALUE11_, _UPVALUE1_, _UPVALUE12_, _UPVALUE3_.wanIpAddressPing, A1_97)
  end
  if L3_99 == _UPVALUE7_ then
    L4_100 = db.setAttribute(_UPVALUE11_, _UPVALUE1_, _UPVALUE12_, _UPVALUE3_.wanIpAddressDns, A1_97)
  end
  if L4_100 == _UPVALUE6_.FALSE then
    return _UPVALUE6_.FAILURE, A0_96
  end
  return _UPVALUE6_.SUCCESS, A0_96
end
function autoRollOverGroupGet()
  local L0_101, L1_102, L2_103, L3_104, L4_105, L5_106, L6_107, L7_108, L8_109
  L0_101 = db
  L0_101 = L0_101.getRow
  L1_102 = _UPVALUE0_
  L2_103 = _UPVALUE1_
  L3_104 = _UPVALUE2_
  L0_101 = L0_101(L1_102, L2_103, L3_104)
  L1_102 = ipAddressGet
  L3_104 = L1_102()
  L4_105 = _UPVALUE3_
  L4_105 = L4_105.NIL
  if L0_101 ~= L4_105 then
    L4_105 = _UPVALUE3_
    L4_105 = L4_105.FAILURE
  elseif L1_102 == L4_105 then
    L4_105 = _UPVALUE3_
    L4_105 = L4_105.FAILURE
    return L4_105
  end
  L4_105 = _UPVALUE0_
  L5_106 = "."
  L6_107 = _UPVALUE4_
  L6_107 = L6_107.primaryWanPort
  L4_105 = L4_105 .. L5_106 .. L6_107
  L4_105 = L0_101[L4_105]
  L5_106 = _UPVALUE0_
  L6_107 = "."
  L7_108 = _UPVALUE4_
  L7_108 = L7_108.secondaryWanPort
  L5_106 = L5_106 .. L6_107 .. L7_108
  L5_106 = L0_101[L5_106]
  L6_107 = _UPVALUE0_
  L7_108 = "."
  L8_109 = _UPVALUE4_
  L8_109 = L8_109.failureDetectionMethod
  L6_107 = L6_107 .. L7_108 .. L8_109
  L6_107 = L0_101[L6_107]
  L7_108 = _UPVALUE0_
  L8_109 = "."
  L7_108 = L7_108 .. L8_109 .. _UPVALUE4_.retryInterval
  L7_108 = L0_101[L7_108]
  L8_109 = _UPVALUE0_
  L8_109 = L8_109 .. "." .. _UPVALUE4_.maxFailures
  L8_109 = L0_101[L8_109]
  return _UPVALUE3_.SUCCESS, 1, L4_105, L6_107, L3_104, L7_108, L8_109, L5_106
end
function autoRollOverGroupGetNext(A0_110)
  local L2_111, L3_112
  L2_111 = _UPVALUE0_
  L2_111 = L2_111.NOT_SUPPORTED
  L3_112 = 0
  return L2_111, L3_112, 0
end
function autoRollOverGroupSet(A0_113, A1_114, A2_115, A3_116, A4_117, A5_118, A6_119)
  local L7_120, L8_121, L9_122, L10_123, L11_124, L12_125, L13_126
  L7_120 = configurablePortCheck
  L7_120 = L7_120()
  L8_121 = _UPVALUE0_
  L8_121 = L8_121.SUCCESS
  if L7_120 ~= L8_121 then
    return L7_120
  end
  L8_121 = db
  L8_121 = L8_121.getAttribute
  L9_122 = _UPVALUE1_
  L10_123 = _UPVALUE2_
  L11_124 = _UPVALUE3_
  L12_125 = _UPVALUE4_
  L12_125 = L12_125.multiWanMode
  L8_121 = L8_121(L9_122, L10_123, L11_124, L12_125)
  L9_122 = _UPVALUE5_
  if L8_121 ~= L9_122 then
    L9_122 = _UPVALUE0_
    L9_122 = L9_122.DEPENDENCY_NOT_MET
    return L9_122
  end
  L9_122 = {}
  L10_123 = _UPVALUE0_
  L10_123 = L10_123.NIL
  if A1_114 == L10_123 then
    L10_123 = _UPVALUE0_
    L10_123 = L10_123.INVALID_ARGUMENT
    return L10_123
  end
  L10_123 = _UPVALUE6_
  if A1_114 ~= L10_123 then
    L10_123 = _UPVALUE7_
    if A1_114 ~= L10_123 then
      L10_123 = _UPVALUE8_
      if A1_114 ~= L10_123 then
        L10_123 = _UPVALUE0_
        L10_123 = L10_123.INVALID_ARGUMENT
        return L10_123
      end
    end
  end
  L10_123 = _UPVALUE1_
  L11_124 = "."
  L12_125 = _UPVALUE4_
  L12_125 = L12_125.primaryWanPort
  L10_123 = L10_123 .. L11_124 .. L12_125
  L9_122[L10_123] = A1_114
  L10_123 = _UPVALUE6_
  if A6_119 ~= L10_123 then
    L10_123 = _UPVALUE7_
    if A6_119 ~= L10_123 then
      L10_123 = _UPVALUE8_
      if A6_119 ~= L10_123 then
        L10_123 = _UPVALUE0_
        L10_123 = L10_123.INVALID_ARGUMENT
        return L10_123
      end
    end
  end
  L10_123 = _UPVALUE1_
  L11_124 = "."
  L12_125 = _UPVALUE4_
  L12_125 = L12_125.secondaryWanPort
  L10_123 = L10_123 .. L11_124 .. L12_125
  L9_122[L10_123] = A6_119
  L10_123 = _UPVALUE0_
  L10_123 = L10_123.NIL
  if A2_115 == L10_123 then
    L10_123 = _UPVALUE0_
    L10_123 = L10_123.INVALID_ARGUMENT
    return L10_123
  end
  L10_123 = _UPVALUE9_
  if A2_115 ~= L10_123 then
    L10_123 = _UPVALUE10_
    if A2_115 ~= L10_123 then
      L10_123 = _UPVALUE11_
      if A2_115 ~= L10_123 then
        L10_123 = _UPVALUE12_
        if A2_115 ~= L10_123 then
          L10_123 = _UPVALUE0_
          L10_123 = L10_123.INVALID_ARGUMENT
          return L10_123
        end
      end
    end
  end
  L10_123 = _UPVALUE1_
  L11_124 = "."
  L12_125 = _UPVALUE4_
  L12_125 = L12_125.failureDetectionMethod
  L10_123 = L10_123 .. L11_124 .. L12_125
  L9_122[L10_123] = A2_115
  L10_123 = _UPVALUE10_
  if A2_115 ~= L10_123 then
    L10_123 = _UPVALUE11_
  elseif A2_115 == L10_123 then
    L10_123 = _UPVALUE0_
    L10_123 = L10_123.NIL
    if A3_116 == L10_123 then
      L10_123 = _UPVALUE0_
      L10_123 = L10_123.INVALID_ARGUMENT
      return L10_123
    end
    L10_123 = _UPVALUE13_
    L10_123 = L10_123.ipAddressCheck
    L11_124 = _UPVALUE14_
    L12_125 = A3_116
    L10_123 = L10_123(L11_124, L12_125)
    valid = L10_123
    L10_123 = valid
    L11_124 = _UPVALUE0_
    L11_124 = L11_124.SUCCESS
    if L10_123 ~= L11_124 then
      L10_123 = _UPVALUE15_
      L10_123 = L10_123.OPTION_MODE_INVALID_ROLLOVER_IP
      return L10_123
    end
  end
  L10_123 = _UPVALUE0_
  L10_123 = L10_123.NIL
  if A4_117 == L10_123 then
    L10_123 = _UPVALUE0_
    L10_123 = L10_123.INVALID_ARGUMENT
    return L10_123
  end
  L10_123 = tonumber
  L11_124 = A4_117
  L10_123 = L10_123(L11_124)
  L11_124 = _UPVALUE0_
  L11_124 = L11_124.NIL
  if L10_123 == L11_124 then
    L11_124 = _UPVALUE0_
    L11_124 = L11_124.INVALID_ARGUMENT
    return L11_124
  end
  L11_124 = _UPVALUE16_
  if not (L10_123 < L11_124) then
    L11_124 = _UPVALUE17_
  elseif L10_123 > L11_124 then
    L11_124 = _UPVALUE15_
    L11_124 = L11_124.OPTION_MODE_INVALID_RETRY_INTERVAL
    return L11_124
  end
  L11_124 = _UPVALUE1_
  L12_125 = "."
  L13_126 = _UPVALUE4_
  L13_126 = L13_126.retryInterval
  L11_124 = L11_124 .. L12_125 .. L13_126
  L9_122[L11_124] = A4_117
  L11_124 = _UPVALUE0_
  L11_124 = L11_124.NIL
  if A5_118 == L11_124 then
    L11_124 = _UPVALUE0_
    L11_124 = L11_124.INVALID_ARGUMENT
    return L11_124
  end
  L11_124 = tonumber
  L12_125 = A5_118
  L11_124 = L11_124(L12_125)
  L12_125 = _UPVALUE0_
  L12_125 = L12_125.NIL
  if L11_124 == L12_125 then
    L12_125 = _UPVALUE0_
    L12_125 = L12_125.INVALID_ARGUMENT
    return L12_125
  end
  L12_125 = _UPVALUE18_
  if not (L11_124 < L12_125) then
    L12_125 = _UPVALUE19_
  elseif L11_124 > L12_125 then
    L12_125 = _UPVALUE15_
    L12_125 = L12_125.OPTION_MODE_INVALID_MAX_FAILURES
    return L12_125
  end
  L12_125 = _UPVALUE1_
  L13_126 = "."
  L12_125 = L12_125 .. L13_126 .. _UPVALUE4_.maxFailures
  L9_122[L12_125] = A5_118
  L12_125 = nil
  L13_126 = db
  L13_126 = L13_126.update
  L13_126 = L13_126(_UPVALUE1_, L9_122, A0_113)
  L12_125 = L13_126
  L13_126 = nil
  if A2_115 == _UPVALUE10_ or A2_115 == _UPVALUE11_ then
    L13_126 = ipAddressSet(A0_113, A3_116)
    if L13_126 == _UPVALUE0_.FAILURE then
      return _UPVALUE0_.FAILURE, A0_113
    end
  end
  if L12_125 == _UPVALUE0_.NIL or L13_126 == _UPVALUE0_.FAILURE then
    return _UPVALUE0_.FAILURE, A0_113
  end
  return _UPVALUE0_.SUCCESS, A0_113
end
function autoRollOverGroupCreate(A0_127, A1_128, A2_129, A3_130, A4_131)
  local L6_132, L7_133
  L6_132 = _UPVALUE0_
  L6_132 = L6_132.NOT_SUPPORTED
  L7_133 = 0
  return L6_132, L7_133, 0
end
function autoRollOverGroupDelete(A0_134)
  local L2_135, L3_136
  L2_135 = _UPVALUE0_
  L2_135 = L2_135.NOT_SUPPORTED
  L3_136 = 0
  return L2_135, L3_136, 0
end
function loadbalanceGroupGet()
  local L0_137, L1_138, L2_139, L3_140, L4_141, L5_142, L6_143, L7_144, L8_145, L9_146, L10_147, L11_148, L12_149, L13_150, L14_151, L15_152, L16_153
  L0_137 = {}
  L1_138 = db
  L1_138 = L1_138.getRow
  L2_139 = _UPVALUE0_
  L3_140 = _UPVALUE1_
  L4_141 = _UPVALUE2_
  L1_138 = L1_138(L2_139, L3_140, L4_141)
  L0_137 = L1_138
  L1_138 = wan1IpAddressGet
  L3_140 = L1_138()
  L4_141 = wan2IpAddressGet
  L6_143 = L4_141()
  L7_144 = wan3IpAddressGet
  L9_146 = L7_144()
  L10_147 = _UPVALUE3_
  L10_147 = L10_147.NIL
  if L0_137 ~= L10_147 then
    L10_147 = _UPVALUE3_
    L10_147 = L10_147.FAILURE
    if L1_138 ~= L10_147 then
      L10_147 = _UPVALUE3_
      L10_147 = L10_147.FAILURE
    end
  elseif L4_141 == L10_147 then
    L10_147 = _UPVALUE3_
    L10_147 = L10_147.FAILURE
    return L10_147
  end
  L10_147 = _UPVALUE0_
  L11_148 = "."
  L12_149 = _UPVALUE4_
  L12_149 = L12_149.multiWanMode
  L10_147 = L10_147 .. L11_148 .. L12_149
  L10_147 = L0_137[L10_147]
  L11_148 = _UPVALUE0_
  L12_149 = "."
  L13_150 = _UPVALUE4_
  L13_150 = L13_150.failureDetectionMethod
  L11_148 = L11_148 .. L12_149 .. L13_150
  L11_148 = L0_137[L11_148]
  L12_149 = _UPVALUE0_
  L13_150 = "."
  L14_151 = _UPVALUE4_
  L14_151 = L14_151.retryInterval
  L12_149 = L12_149 .. L13_150 .. L14_151
  L12_149 = L0_137[L12_149]
  L13_150 = _UPVALUE0_
  L14_151 = "."
  L15_152 = _UPVALUE4_
  L15_152 = L15_152.maxFailures
  L13_150 = L13_150 .. L14_151 .. L15_152
  L13_150 = L0_137[L13_150]
  L14_151 = _UPVALUE0_
  L15_152 = "."
  L16_153 = _UPVALUE4_
  L16_153 = L16_153.loadTolerance
  L14_151 = L14_151 .. L15_152 .. L16_153
  L14_151 = L0_137[L14_151]
  L15_152 = _UPVALUE0_
  L16_153 = "."
  L15_152 = L15_152 .. L16_153 .. _UPVALUE4_.maxBandwidth
  L15_152 = L0_137[L15_152]
  L16_153 = _UPVALUE0_
  L16_153 = L16_153 .. "." .. _UPVALUE4_.Unit
  L16_153 = L0_137[L16_153]
  return _UPVALUE3_.SUCCESS, 1, L10_147, L11_148, L3_140, L6_143, L12_149, L13_150, L14_151, L15_152, L9_146, L16_153
end
function loadbalanceGroupGetNext(A0_154)
  local L2_155, L3_156
  L2_155 = _UPVALUE0_
  L2_155 = L2_155.NOT_SUPPORTED
  L3_156 = 0
  return L2_155, L3_156, 0
end
function loadbalanceGroupSet(A0_157, A1_158, A2_159, A3_160, A4_161, A5_162, A6_163, A7_164, A8_165, A9_166, A10_167, A11_168)
  local L12_169, L13_170, L14_171, L15_172, L16_173, L17_174
  L12_169 = configurablePortCheck
  L12_169 = L12_169()
  L13_170 = _UPVALUE0_
  L13_170 = L13_170.SUCCESS
  if L12_169 ~= L13_170 then
    return L12_169
  end
  L13_170 = {}
  L14_171 = _UPVALUE0_
  L14_171 = L14_171.NIL
  if A1_158 == L14_171 then
    L14_171 = _UPVALUE0_
    L14_171 = L14_171.INVALID_ARGUMENT
    return L14_171
  end
  L14_171 = _UPVALUE1_
  if A1_158 ~= L14_171 then
    L14_171 = _UPVALUE2_
    if A1_158 ~= L14_171 then
      L14_171 = _UPVALUE0_
      L14_171 = L14_171.INVALID_ARGUMENT
      return L14_171
    end
  end
  L14_171 = idleTimeOutCheck
  L14_171 = L14_171()
  L15_172 = _UPVALUE0_
  L15_172 = L15_172.SUCCESS
  if L14_171 ~= L15_172 then
    return L14_171
  end
  L15_172 = _UPVALUE3_
  if A11_168 == L15_172 then
    L15_172 = _UPVALUE4_
    L15_172 = L15_172.ON_DEMAND_MODE_LOAD_BALANCE_NOT_SUPPORTED
    return L15_172
  end
  L15_172 = _UPVALUE5_
  L16_173 = "."
  L17_174 = _UPVALUE6_
  L17_174 = L17_174.multiWanMode
  L15_172 = L15_172 .. L16_173 .. L17_174
  L13_170[L15_172] = A1_158
  L15_172 = _UPVALUE0_
  L15_172 = L15_172.NIL
  if A2_159 == L15_172 then
    L15_172 = _UPVALUE0_
    L15_172 = L15_172.INVALID_ARGUMENT
    return L15_172
  end
  L15_172 = _UPVALUE7_
  if A2_159 ~= L15_172 then
    L15_172 = _UPVALUE8_
    if A2_159 ~= L15_172 then
      L15_172 = _UPVALUE9_
      if A2_159 ~= L15_172 then
        L15_172 = _UPVALUE10_
        if A2_159 ~= L15_172 then
          L15_172 = _UPVALUE0_
          L15_172 = L15_172.INVALID_ARGUMENT
          return L15_172
        end
      end
    end
  end
  L15_172 = _UPVALUE5_
  L16_173 = "."
  L17_174 = _UPVALUE6_
  L17_174 = L17_174.failureDetectionMethod
  L15_172 = L15_172 .. L16_173 .. L17_174
  L13_170[L15_172] = A2_159
  L15_172 = _UPVALUE8_
  if A2_159 ~= L15_172 then
    L15_172 = _UPVALUE9_
  elseif A2_159 == L15_172 then
    L15_172 = _UPVALUE0_
    L15_172 = L15_172.NIL
    if A3_160 == L15_172 then
      L15_172 = _UPVALUE0_
      L15_172 = L15_172.INVALID_ARGUMENT
      return L15_172
    end
    L15_172 = _UPVALUE11_
    L15_172 = L15_172.ipAddressCheck
    L16_173 = _UPVALUE12_
    L17_174 = A3_160
    L15_172 = L15_172(L16_173, L17_174)
    valid = L15_172
    L15_172 = valid
    L16_173 = _UPVALUE0_
    L16_173 = L16_173.SUCCESS
    if L15_172 ~= L16_173 then
      L15_172 = _UPVALUE4_
      L15_172 = L15_172.OPTION_MODE_INVALID_WAN1_IP
      return L15_172
    end
    L15_172 = _UPVALUE0_
    L15_172 = L15_172.NIL
    if A4_161 == L15_172 then
      L15_172 = _UPVALUE0_
      L15_172 = L15_172.INVALID_ARGUMENT
      return L15_172
    end
    L15_172 = _UPVALUE11_
    L15_172 = L15_172.ipAddressCheck
    L16_173 = _UPVALUE12_
    L17_174 = A4_161
    L15_172 = L15_172(L16_173, L17_174)
    valid = L15_172
    L15_172 = valid
    L16_173 = _UPVALUE0_
    L16_173 = L16_173.SUCCESS
    if L15_172 ~= L16_173 then
      L15_172 = _UPVALUE4_
      L15_172 = L15_172.OPTION_MODE_INVALID_WAN2_IP
      return L15_172
    end
    L15_172 = _UPVALUE0_
    L15_172 = L15_172.NIL
    if A9_166 ~= L15_172 then
      L15_172 = _UPVALUE11_
      L15_172 = L15_172.ipAddressCheck
      L16_173 = _UPVALUE12_
      L17_174 = A9_166
      L15_172 = L15_172(L16_173, L17_174)
      valid = L15_172
      L15_172 = valid
      L16_173 = _UPVALUE0_
      L16_173 = L16_173.SUCCESS
      if L15_172 ~= L16_173 then
        L15_172 = _UPVALUE4_
        L15_172 = L15_172.OPTION_MODE_INVALID_WAN3_IP
        return L15_172
      end
    end
  end
  L15_172 = _UPVALUE10_
  if A2_159 ~= L15_172 then
    L15_172 = _UPVALUE0_
    L15_172 = L15_172.NIL
    if A5_162 == L15_172 then
      L15_172 = _UPVALUE0_
      L15_172 = L15_172.INVALID_ARGUMENT
      return L15_172
    end
    L15_172 = tonumber
    L16_173 = A5_162
    L15_172 = L15_172(L16_173)
    L16_173 = _UPVALUE0_
    L16_173 = L16_173.NIL
    if L15_172 == L16_173 then
      L16_173 = _UPVALUE0_
      L16_173 = L16_173.INVALID_ARGUMENT
      return L16_173
    end
    L16_173 = _UPVALUE13_
    if not (L15_172 < L16_173) then
      L16_173 = _UPVALUE14_
    elseif L15_172 > L16_173 then
      L16_173 = _UPVALUE4_
      L16_173 = L16_173.OPTION_MODE_INVALID_RETRY_INTERVAL
      return L16_173
    end
    L16_173 = _UPVALUE5_
    L17_174 = "."
    L16_173 = L16_173 .. L17_174 .. _UPVALUE6_.retryInterval
    L13_170[L16_173] = A5_162
    L16_173 = _UPVALUE0_
    L16_173 = L16_173.NIL
    if A6_163 == L16_173 then
      L16_173 = _UPVALUE0_
      L16_173 = L16_173.INVALID_ARGUMENT
      return L16_173
    end
    L16_173 = tonumber
    L17_174 = A6_163
    L16_173 = L16_173(L17_174)
    L17_174 = _UPVALUE0_
    L17_174 = L17_174.NIL
    if L16_173 == L17_174 then
      L17_174 = _UPVALUE0_
      L17_174 = L17_174.INVALID_ARGUMENT
      return L17_174
    end
    L17_174 = _UPVALUE15_
    if not (L16_173 < L17_174) then
      L17_174 = _UPVALUE16_
    elseif L16_173 > L17_174 then
      L17_174 = _UPVALUE4_
      L17_174 = L17_174.OPTION_MODE_INVALID_MAX_FAILURES
      return L17_174
    end
    L17_174 = _UPVALUE5_
    L17_174 = L17_174 .. "." .. _UPVALUE6_.maxFailures
    L13_170[L17_174] = A6_163
  end
  L15_172 = _UPVALUE2_
  if A1_158 == L15_172 then
    L15_172 = _UPVALUE0_
    L15_172 = L15_172.NIL
    if A7_164 == L15_172 then
      L15_172 = _UPVALUE0_
      L15_172 = L15_172.INVALID_ARGUMENT
      return L15_172
    end
    L15_172 = tonumber
    L16_173 = A7_164
    L15_172 = L15_172(L16_173)
    L16_173 = _UPVALUE0_
    L16_173 = L16_173.NIL
    if L15_172 == L16_173 then
      L16_173 = _UPVALUE0_
      L16_173 = L16_173.INVALID_ARGUMENT
      return L16_173
    end
    L16_173 = _UPVALUE17_
    if not (L15_172 < L16_173) then
      L16_173 = _UPVALUE18_
    elseif L15_172 > L16_173 then
      L16_173 = _UPVALUE0_
      L16_173 = L16_173.INVALID_ARGUMENT
      return L16_173
    end
    L16_173 = _UPVALUE5_
    L17_174 = "."
    L16_173 = L16_173 .. L17_174 .. _UPVALUE6_.loadTolerance
    L13_170[L16_173] = A7_164
    L16_173 = _UPVALUE0_
    L16_173 = L16_173.NIL
    if A8_165 == L16_173 then
      L16_173 = _UPVALUE0_
      L16_173 = L16_173.INVALID_ARGUMENT
      return L16_173
    end
    L16_173 = tonumber
    L17_174 = A8_165
    L16_173 = L16_173(L17_174)
    L17_174 = _UPVALUE0_
    L17_174 = L17_174.NIL
    if L16_173 == L17_174 then
      L17_174 = _UPVALUE0_
      L17_174 = L17_174.INVALID_ARGUMENT
      return L17_174
    end
    L17_174 = _UPVALUE0_
    L17_174 = L17_174.NIL
    if A10_167 ~= L17_174 then
      if A10_167 == "0" then
        L17_174 = _UPVALUE19_
        if not (L16_173 < L17_174) then
          L17_174 = _UPVALUE20_
        elseif L16_173 > L17_174 then
          L17_174 = _UPVALUE4_
          L17_174 = L17_174.INVALID_ARGUMENT_BPS
          return L17_174
        end
      elseif A10_167 == "1" then
        L17_174 = _UPVALUE21_
        if not (L16_173 < L17_174) then
          L17_174 = _UPVALUE22_
        elseif L16_173 > L17_174 then
          L17_174 = _UPVALUE4_
          L17_174 = L17_174.INVALID_ARGUMENT_KBPS
          return L17_174
        end
      else
        L17_174 = _UPVALUE23_
        if not (L16_173 < L17_174) then
          L17_174 = _UPVALUE24_
        elseif L16_173 > L17_174 then
          L17_174 = _UPVALUE4_
          L17_174 = L17_174.INVALID_ARGUMENT_MBPS
          return L17_174
        end
      end
    end
    L17_174 = _UPVALUE5_
    L17_174 = L17_174 .. "." .. _UPVALUE6_.maxBandwidth
    L13_170[L17_174] = A8_165
    L17_174 = _UPVALUE5_
    L17_174 = L17_174 .. "." .. _UPVALUE6_.Unit
    L13_170[L17_174] = A10_167
  end
  L15_172 = nil
  L16_173 = db
  L16_173 = L16_173.update
  L17_174 = _UPVALUE5_
  L16_173 = L16_173(L17_174, L13_170, A0_157)
  L15_172 = L16_173
  L16_173, L17_174 = nil, nil
  if A0_157 == _UPVALUE25_ and (A2_159 == _UPVALUE8_ or A2_159 == _UPVALUE9_) then
    L16_173 = wan1IpAddressSet(A0_157, A3_160)
    L17_174 = wan2IpAddressSet(A0_157, A4_161)
    if A9_166 ~= _UPVALUE0_.NIL then
      status3 = wan3IpAddressSet(A0_157, A9_166)
    end
    if L16_173 == _UPVALUE0_.FAILURE or L17_174 == _UPVALUE0_.FAILURE then
      return _UPVALUE0_.FAILURE, A0_157
    end
  end
  if L15_172 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_157
  end
  return _UPVALUE0_.SUCCESS, A0_157
end
function loadbalanceGroupCreate(A0_175, A1_176, A2_177, A3_178, A4_179)
  local L6_180, L7_181
  L6_180 = _UPVALUE0_
  L6_180 = L6_180.NOT_SUPPORTED
  L7_181 = 0
  return L6_180, L7_181, 0
end
function loadbalanceGroupDelete(A0_182)
  local L2_183, L3_184
  L2_183 = _UPVALUE0_
  L2_183 = L2_183.NOT_SUPPORTED
  L3_184 = 0
  return L2_183, L3_184, 0
end
function idleTimeOutCheck()
  local L0_185, L1_186, L2_187, L3_188, L4_189, L5_190, L6_191, L7_192, L8_193
  L0_185, L1_186, L3_188 = _UPVALUE0_.connectionTypeGet(_UPVALUE1_, _UPVALUE2_)
  if L3_188 == _UPVALUE3_ then
    L0_185, L1_186, L4_189 = _UPVALUE4_.reconnectModeGet()
  elseif L3_188 == _UPVALUE5_ then
    L0_185, L1_186, L4_189 = _UPVALUE6_.reconnectModeGet()
  elseif L3_188 == _UPVALUE7_ then
    L0_185, L1_186, L4_189 = _UPVALUE8_.reconnectModeGet(_UPVALUE1_, _UPVALUE9_)
    L0_185, L1_186, L2_187, L8_193 = _UPVALUE8_.statusGet(_UPVALUE1_, _UPVALUE10_)
    if L8_193 == _UPVALUE11_ then
      L0_185, L1_186, L2_187, L6_191 = _UPVALUE8_.reconnectModeGet(_UPVALUE1_, _UPVALUE10_)
    end
  end
  L0_185, L1_186, L3_188 = _UPVALUE0_.connectionTypeGet(_UPVALUE12_, _UPVALUE2_)
  if L3_188 == _UPVALUE3_ then
    L0_185, L1_186, L5_190 = _UPVALUE4_.reconnectModeGetNext(_UPVALUE13_)
  elseif L3_188 == _UPVALUE5_ then
    L0_185, L1_186, L5_190 = _UPVALUE6_.reconnectModeGetNext(_UPVALUE13_)
  elseif L3_188 == _UPVALUE7_ then
    L0_185, L1_186, L5_190 = _UPVALUE8_.reconnectModeGet(_UPVALUE12_, _UPVALUE9_)
    L0_185, L1_186, L2_187, L8_193 = _UPVALUE8_.statusGet(_UPVALUE12_, _UPVALUE10_)
    if L8_193 == _UPVALUE11_ then
      L0_185, L1_186, L2_187, L7_192 = _UPVALUE8_.reconnectModeGet(_UPVALUE12_, _UPVALUE10_)
    end
  end
  if L0_185 ~= _UPVALUE14_.SUCCESS then
    return _UPVALUE15_.IDLE_TIMEOUT_CHECK_FAILED
  end
  if L4_189 == _UPVALUE11_ or L5_190 == _UPVALUE11_ or L6_191 == _UPVALUE11_ or L7_192 == _UPVALUE11_ then
    return _UPVALUE15_.IDLE_TIMEOUT_ENABLED
  end
  return _UPVALUE14_.SUCCESS
end
function configurablePortCheck()
  if db.getAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.configPortUsage) == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  if (db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500N" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500AC") and db.getAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.configPortUsage) == _UPVALUE5_ then
    return _UPVALUE6_.CONFIGURABLE_PORT_DMZ
  end
  return _UPVALUE4_.SUCCESS
end
function optionIpModeGet()
  return "1"
end
function configPortGet()
  local L0_194
  L0_194 = db
  L0_194 = L0_194.getAttribute
  L0_194 = L0_194(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.configPortUsage)
  if L0_194 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, L0_194
end
