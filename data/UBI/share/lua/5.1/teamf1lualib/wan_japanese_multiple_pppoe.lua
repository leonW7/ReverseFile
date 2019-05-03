local L0_0
L0_0 = module
L0_0("com.teamf1.core.wan.japanese_multiple_pppoe", package.seeall)
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
;({}).profileName = "ProfileName"
;({}).getIPFromIsp = "GetIpFromIsp"
;({}).ipAddress = "StaticIp"
;({}).networkMask = "NetMask"
;({}).userName = "UserName"
;({}).password = "Password"
;({}).service = "Service"
;({}).getDnsFromIsp = "GetDnsFromIsp"
;({}).primaryDns = "PrimaryDns"
;({}).secondaryDns = "SecondaryDns"
;({}).authenticationOptions = "AuthOpt"
;({}).status = "Status"
;({}).reconnectMode = "IdleTimeOutFlag"
;({}).idleTimeOutValue = "IdleTimeOutValue"
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
function isgetIPFromIspEnabled(A0_7, A1_8)
  local L2_9, L3_10, L4_11
  L2_9 = _UPVALUE0_
  L2_9 = L2_9.NIL
  if A0_7 == L2_9 then
    L2_9 = _UPVALUE0_
    L2_9 = L2_9.INVALID_ARGUMENT
    return L2_9
  end
  if A0_7 ~= "WAN1" and A0_7 ~= "WAN2" then
    L2_9 = _UPVALUE0_
    L2_9 = L2_9.INVALID_ARGUMENT
    return L2_9
  end
  L2_9 = _UPVALUE0_
  L2_9 = L2_9.NIL
  if A1_8 == L2_9 then
    L2_9 = _UPVALUE0_
    L2_9 = L2_9.INVALID_ARGUMENT
    return L2_9
  end
  if A1_8 ~= "pppoeProfile1" and A1_8 ~= "pppoeProfile2" then
    L2_9 = _UPVALUE0_
    L2_9 = L2_9.INVALID_ARGUMENT
    return L2_9
  end
  L2_9 = _UPVALUE1_
  L2_9 = L2_9.wanPort
  L3_10 = " = '"
  L4_11 = A0_7
  L2_9 = L2_9 .. L3_10 .. L4_11 .. "' AND " .. _UPVALUE1_.profileName .. " = '" .. A1_8 .. "'"
  L3_10 = db
  L3_10 = L3_10.getRowWhere
  L4_11 = _UPVALUE2_
  L3_10 = L3_10(L4_11, L2_9)
  L4_11 = _UPVALUE0_
  L4_11 = L4_11.NIL
  if L3_10 == L4_11 then
    L4_11 = _UPVALUE0_
    L4_11 = L4_11.FAILURE
    return L4_11
  end
  L4_11 = _UPVALUE2_
  L4_11 = L4_11 .. "." .. _UPVALUE1_.getIPFromIsp
  L4_11 = L3_10[L4_11]
  return _UPVALUE0_.SUCCESS, A0_7, A1_8, L4_11
end
function isgetIPFromIspEnabledNext(A0_12)
  return _UPVALUE0_.NOT_SUPPORTED
end
function getIPFromIspEnable(A0_13, A1_14)
  local L2_15
  L2_15 = _UPVALUE0_
  L2_15 = L2_15.NIL
  if A0_13 == L2_15 then
    L2_15 = _UPVALUE0_
    L2_15 = L2_15.INVALID_ARGUMENT
    return L2_15
  end
  if A0_13 ~= "WAN1" and A0_13 ~= "WAN2" then
    L2_15 = _UPVALUE0_
    L2_15 = L2_15.INVALID_ARGUMENT
    return L2_15
  end
  L2_15 = _UPVALUE0_
  L2_15 = L2_15.NIL
  if A1_14 == L2_15 then
    L2_15 = _UPVALUE0_
    L2_15 = L2_15.INVALID_ARGUMENT
    return L2_15
  end
  if A1_14 ~= "pppoeProfile1" and A1_14 ~= "pppoeProfile2" then
    L2_15 = _UPVALUE0_
    L2_15 = L2_15.INVALID_ARGUMENT
    return L2_15
  end
  L2_15 = _UPVALUE1_
  L2_15 = L2_15.wanPort
  L2_15 = L2_15 .. " = '" .. A0_13 .. "' AND " .. _UPVALUE1_.profileName .. " = '" .. A1_14 .. "'"
  if db.setAttributeWhere(_UPVALUE2_, L2_15, _UPVALUE1_.getIPFromIsp, _UPVALUE3_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_13, A1_14
  end
  return _UPVALUE0_.SUCCESS, A0_13, A1_14
end
function getIPFromIspDisable(A0_16, A1_17)
  local L2_18
  L2_18 = _UPVALUE0_
  L2_18 = L2_18.NIL
  if A0_16 == L2_18 then
    L2_18 = _UPVALUE0_
    L2_18 = L2_18.INVALID_ARGUMENT
    return L2_18
  end
  if A0_16 ~= "WAN1" and A0_16 ~= "WAN2" then
    L2_18 = _UPVALUE0_
    L2_18 = L2_18.INVALID_ARGUMENT
    return L2_18
  end
  L2_18 = _UPVALUE0_
  L2_18 = L2_18.NIL
  if A1_17 == L2_18 then
    L2_18 = _UPVALUE0_
    L2_18 = L2_18.INVALID_ARGUMENT
    return L2_18
  end
  if A1_17 ~= "pppoeProfile1" and A1_17 ~= "pppoeProfile2" then
    L2_18 = _UPVALUE0_
    L2_18 = L2_18.INVALID_ARGUMENT
    return L2_18
  end
  L2_18 = _UPVALUE1_
  L2_18 = L2_18.wanPort
  L2_18 = L2_18 .. " = '" .. A0_16 .. "' AND " .. _UPVALUE1_.profileName .. " = '" .. A1_17 .. "'"
  if db.setAttributeWhere(_UPVALUE2_, L2_18, _UPVALUE1_.getIPFromIsp, _UPVALUE3_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_16, A1_17
  end
  return _UPVALUE0_.SUCCESS, A0_16, A1_17
end
function ipAddressGet(A0_19, A1_20)
  local L2_21, L3_22, L4_23
  L2_21 = _UPVALUE0_
  L2_21 = L2_21.NIL
  if A0_19 == L2_21 then
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.INVALID_ARGUMENT
    return L2_21
  end
  if A0_19 ~= "WAN1" and A0_19 ~= "WAN2" then
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.INVALID_ARGUMENT
    return L2_21
  end
  L2_21 = _UPVALUE0_
  L2_21 = L2_21.NIL
  if A1_20 == L2_21 then
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.INVALID_ARGUMENT
    return L2_21
  end
  if A1_20 ~= "pppoeProfile1" and A1_20 ~= "pppoeProfile2" then
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.INVALID_ARGUMENT
    return L2_21
  end
  L2_21 = _UPVALUE1_
  L2_21 = L2_21.wanPort
  L3_22 = " = '"
  L4_23 = A0_19
  L2_21 = L2_21 .. L3_22 .. L4_23 .. "' AND " .. _UPVALUE1_.profileName .. " = '" .. A1_20 .. "'"
  L3_22 = db
  L3_22 = L3_22.getRowWhere
  L4_23 = _UPVALUE2_
  L3_22 = L3_22(L4_23, L2_21)
  L4_23 = _UPVALUE0_
  L4_23 = L4_23.NIL
  if L3_22 == L4_23 then
    L4_23 = _UPVALUE0_
    L4_23 = L4_23.FAILURE
    return L4_23
  end
  L4_23 = _UPVALUE2_
  L4_23 = L4_23 .. "." .. _UPVALUE1_.ipAddress
  L4_23 = L3_22[L4_23]
  return _UPVALUE0_.SUCCESS, A0_19, A1_20, L4_23
end
function ipAddressGetNext(A0_24)
  return _UPVALUE0_.NOT_SUPPORTED
end
function ipAddressSet(A0_25, A1_26, A2_27)
  local L3_28, L4_29, L5_30, L6_31, L7_32, L8_33
  L4_29 = _UPVALUE0_
  L4_29 = L4_29.NIL
  if A0_25 == L4_29 then
    L4_29 = _UPVALUE0_
    L4_29 = L4_29.INVALID_ARGUMENT
    return L4_29
  end
  if A0_25 ~= "WAN1" and A0_25 ~= "WAN2" then
    L4_29 = _UPVALUE0_
    L4_29 = L4_29.INVALID_ARGUMENT
    return L4_29
  end
  L4_29 = _UPVALUE0_
  L4_29 = L4_29.NIL
  if A1_26 == L4_29 then
    L4_29 = _UPVALUE0_
    L4_29 = L4_29.INVALID_ARGUMENT
    return L4_29
  end
  if A1_26 ~= "pppoeProfile1" and A1_26 ~= "pppoeProfile2" then
    L4_29 = _UPVALUE0_
    L4_29 = L4_29.INVALID_ARGUMENT
    return L4_29
  end
  L4_29 = isgetIPFromIspEnabled
  L5_30 = A0_25
  L6_31 = A1_26
  L7_32 = L4_29(L5_30, L6_31)
  L8_33 = tonumber
  L8_33 = L8_33(L7_32)
  if L8_33 == 0 then
    L8_33 = _UPVALUE0_
    L8_33 = L8_33.NIL
    if A2_27 == L8_33 then
      L8_33 = _UPVALUE0_
      L8_33 = L8_33.INVALID_ARGUMENT
      return L8_33
    end
  end
  L8_33 = tonumber
  L8_33 = L8_33(L7_32)
  if L8_33 == 1 then
    L8_33 = _UPVALUE0_
    L8_33 = L8_33.DEPENDENCY_NOT_MET
    return L8_33
  end
  L8_33 = _UPVALUE1_
  L8_33 = L8_33.ipAddressCheck
  L8_33 = L8_33(_UPVALUE2_, A2_27)
  L3_28 = L8_33
  L8_33 = _UPVALUE0_
  L8_33 = L8_33.SUCCESS
  if L3_28 ~= L8_33 then
    L8_33 = _UPVALUE0_
    L8_33 = L8_33.INVALID_ARGUMENT
    return L8_33
  end
  L8_33 = _UPVALUE3_
  L8_33 = L8_33.wanPort
  L8_33 = L8_33 .. " = '" .. A0_25 .. "' AND " .. _UPVALUE3_.profileName .. " = '" .. A1_26 .. "'"
  if db.setAttributeWhere(_UPVALUE4_, L8_33, _UPVALUE3_.ipAddress, A2_27) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_25, A1_26
  end
  return _UPVALUE0_.SUCCESS, A0_25, A1_26
end
function networkMaskGet(A0_34, A1_35)
  local L2_36, L3_37, L4_38
  L2_36 = _UPVALUE0_
  L2_36 = L2_36.NIL
  if A0_34 == L2_36 then
    L2_36 = _UPVALUE0_
    L2_36 = L2_36.INVALID_ARGUMENT
    return L2_36
  end
  if A0_34 ~= "WAN1" and A0_34 ~= "WAN2" then
    L2_36 = _UPVALUE0_
    L2_36 = L2_36.INVALID_ARGUMENT
    return L2_36
  end
  L2_36 = _UPVALUE0_
  L2_36 = L2_36.NIL
  if A1_35 == L2_36 then
    L2_36 = _UPVALUE0_
    L2_36 = L2_36.INVALID_ARGUMENT
    return L2_36
  end
  if A1_35 ~= "pppoeProfile1" and A1_35 ~= "pppoeProfile2" then
    L2_36 = _UPVALUE0_
    L2_36 = L2_36.INVALID_ARGUMENT
    return L2_36
  end
  L2_36 = _UPVALUE1_
  L2_36 = L2_36.wanPort
  L3_37 = " = '"
  L4_38 = A0_34
  L2_36 = L2_36 .. L3_37 .. L4_38 .. "' AND " .. _UPVALUE1_.profileName .. " = '" .. A1_35 .. "'"
  L3_37 = db
  L3_37 = L3_37.getRowWhere
  L4_38 = _UPVALUE2_
  L3_37 = L3_37(L4_38, L2_36)
  L4_38 = _UPVALUE0_
  L4_38 = L4_38.NIL
  if L3_37 == L4_38 then
    L4_38 = _UPVALUE0_
    L4_38 = L4_38.FAILURE
    return L4_38
  end
  L4_38 = _UPVALUE2_
  L4_38 = L4_38 .. "." .. _UPVALUE1_.networkMask
  L4_38 = L3_37[L4_38]
  return _UPVALUE0_.SUCCESS, A0_34, A1_35, L4_38
end
function networkMaskGetNext(A0_39)
  return _UPVALUE0_.NOT_SUPPORTED
end
function networkMaskSet(A0_40, A1_41, A2_42)
  local L3_43, L4_44, L5_45, L6_46, L7_47, L8_48
  L4_44 = _UPVALUE0_
  L4_44 = L4_44.NIL
  if A0_40 == L4_44 then
    L4_44 = _UPVALUE0_
    L4_44 = L4_44.INVALID_ARGUMENT
    return L4_44
  end
  if A0_40 ~= "WAN1" and A0_40 ~= "WAN2" then
    L4_44 = _UPVALUE0_
    L4_44 = L4_44.INVALID_ARGUMENT
    return L4_44
  end
  L4_44 = _UPVALUE0_
  L4_44 = L4_44.NIL
  if A1_41 == L4_44 then
    L4_44 = _UPVALUE0_
    L4_44 = L4_44.INVALID_ARGUMENT
    return L4_44
  end
  if A1_41 ~= "pppoeProfile1" and A1_41 ~= "pppoeProfile2" then
    L4_44 = _UPVALUE0_
    L4_44 = L4_44.INVALID_ARGUMENT
    return L4_44
  end
  L4_44 = isgetIPFromIspEnabled
  L5_45 = A0_40
  L6_46 = A1_41
  L7_47 = L4_44(L5_45, L6_46)
  L8_48 = tonumber
  L8_48 = L8_48(L7_47)
  if L8_48 == 0 then
    L8_48 = _UPVALUE0_
    L8_48 = L8_48.NIL
    if A2_42 == L8_48 then
      L8_48 = _UPVALUE0_
      L8_48 = L8_48.INVALID_ARGUMENT
      return L8_48
    end
  end
  L8_48 = tonumber
  L8_48 = L8_48(L7_47)
  if L8_48 == 1 then
    L8_48 = _UPVALUE0_
    L8_48 = L8_48.DEPENDENCY_NOT_MET
    return L8_48
  end
  L8_48 = _UPVALUE1_
  L8_48 = L8_48.ipAddressCheck
  L8_48 = L8_48(_UPVALUE2_, A2_42)
  L3_43 = L8_48
  L8_48 = _UPVALUE0_
  L8_48 = L8_48.SUCCESS
  if L3_43 ~= L8_48 then
    L8_48 = _UPVALUE0_
    L8_48 = L8_48.INVALID_ARGUMENT
    return L8_48
  end
  L8_48 = _UPVALUE3_
  L8_48 = L8_48.wanPort
  L8_48 = L8_48 .. " = '" .. A0_40 .. "' AND " .. _UPVALUE3_.profileName .. " = '" .. A1_41 .. "'"
  if db.setAttributeWhere(_UPVALUE4_, L8_48, _UPVALUE3_.networkMask, A2_42) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_40, A1_41
  end
  return _UPVALUE0_.SUCCESS, A0_40, A1_41
end
function userNameGet(A0_49, A1_50)
  local L2_51, L3_52, L4_53
  L2_51 = _UPVALUE0_
  L2_51 = L2_51.NIL
  if A0_49 == L2_51 then
    L2_51 = _UPVALUE0_
    L2_51 = L2_51.INVALID_ARGUMENT
    return L2_51
  end
  if A0_49 ~= "WAN1" and A0_49 ~= "WAN2" then
    L2_51 = _UPVALUE0_
    L2_51 = L2_51.INVALID_ARGUMENT
    return L2_51
  end
  L2_51 = _UPVALUE0_
  L2_51 = L2_51.NIL
  if A1_50 == L2_51 then
    L2_51 = _UPVALUE0_
    L2_51 = L2_51.INVALID_ARGUMENT
    return L2_51
  end
  if A1_50 ~= "pppoeProfile1" and A1_50 ~= "pppoeProfile2" then
    L2_51 = _UPVALUE0_
    L2_51 = L2_51.INVALID_ARGUMENT
    return L2_51
  end
  L2_51 = _UPVALUE1_
  L2_51 = L2_51.wanPort
  L3_52 = " = '"
  L4_53 = A0_49
  L2_51 = L2_51 .. L3_52 .. L4_53 .. "' AND " .. _UPVALUE1_.profileName .. " = '" .. A1_50 .. "'"
  L3_52 = db
  L3_52 = L3_52.getRowWhere
  L4_53 = _UPVALUE2_
  L3_52 = L3_52(L4_53, L2_51)
  L4_53 = _UPVALUE0_
  L4_53 = L4_53.NIL
  if L3_52 == L4_53 then
    L4_53 = _UPVALUE0_
    L4_53 = L4_53.FAILURE
    return L4_53
  end
  L4_53 = _UPVALUE2_
  L4_53 = L4_53 .. "." .. _UPVALUE1_.userName
  L4_53 = L3_52[L4_53]
  return _UPVALUE0_.SUCCESS, A0_49, A1_50, L4_53
end
function userNameGetNext(A0_54)
  return _UPVALUE0_.NOT_SUPPORTED
end
function userNameSet(A0_55, A1_56, A2_57)
  local L3_58, L4_59
  L4_59 = _UPVALUE0_
  L4_59 = L4_59.NIL
  if A0_55 == L4_59 then
    L4_59 = _UPVALUE0_
    L4_59 = L4_59.INVALID_ARGUMENT
    return L4_59
  end
  if A0_55 ~= "WAN1" and A0_55 ~= "WAN2" then
    L4_59 = _UPVALUE0_
    L4_59 = L4_59.INVALID_ARGUMENT
    return L4_59
  end
  L4_59 = _UPVALUE0_
  L4_59 = L4_59.NIL
  if A1_56 == L4_59 then
    L4_59 = _UPVALUE0_
    L4_59 = L4_59.INVALID_ARGUMENT
    return L4_59
  end
  if A1_56 ~= "pppoeProfile1" and A1_56 ~= "pppoeProfile2" then
    L4_59 = _UPVALUE0_
    L4_59 = L4_59.INVALID_ARGUMENT
    return L4_59
  end
  L4_59 = _UPVALUE0_
  L4_59 = L4_59.NIL
  if A2_57 == L4_59 then
    L4_59 = _UPVALUE0_
    L4_59 = L4_59.INVALID_ARGUMENT
    return L4_59
  end
  L4_59 = _UPVALUE1_
  L4_59 = L4_59.wanPort
  L4_59 = L4_59 .. " = '" .. A0_55 .. "' AND " .. _UPVALUE1_.profileName .. " = '" .. A1_56 .. "'"
  if db.setAttributeWhere(_UPVALUE2_, L4_59, _UPVALUE1_.userName, A2_57) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_55, A1_56
  end
  return _UPVALUE0_.SUCCESS, A0_55, A1_56
end
function passwordGet(A0_60, A1_61)
  local L2_62, L3_63, L4_64
  L2_62 = _UPVALUE0_
  L2_62 = L2_62.NIL
  if A0_60 == L2_62 then
    L2_62 = _UPVALUE0_
    L2_62 = L2_62.INVALID_ARGUMENT
    return L2_62
  end
  if A0_60 ~= "WAN1" and A0_60 ~= "WAN2" then
    L2_62 = _UPVALUE0_
    L2_62 = L2_62.INVALID_ARGUMENT
    return L2_62
  end
  L2_62 = _UPVALUE0_
  L2_62 = L2_62.NIL
  if A1_61 == L2_62 then
    L2_62 = _UPVALUE0_
    L2_62 = L2_62.INVALID_ARGUMENT
    return L2_62
  end
  if A1_61 ~= "pppoeProfile1" and A1_61 ~= "pppoeProfile2" then
    L2_62 = _UPVALUE0_
    L2_62 = L2_62.INVALID_ARGUMENT
    return L2_62
  end
  L2_62 = _UPVALUE1_
  L2_62 = L2_62.wanPort
  L3_63 = " = '"
  L4_64 = A0_60
  L2_62 = L2_62 .. L3_63 .. L4_64 .. "' AND " .. _UPVALUE1_.profileName .. " = '" .. A1_61 .. "'"
  L3_63 = db
  L3_63 = L3_63.getRowWhere
  L4_64 = _UPVALUE2_
  L3_63 = L3_63(L4_64, L2_62)
  L4_64 = _UPVALUE0_
  L4_64 = L4_64.NIL
  if L3_63 == L4_64 then
    L4_64 = _UPVALUE0_
    L4_64 = L4_64.FAILURE
    return L4_64
  end
  L4_64 = _UPVALUE2_
  L4_64 = L4_64 .. "." .. _UPVALUE1_.password
  L4_64 = L3_63[L4_64]
  return _UPVALUE0_.SUCCESS, A0_60, A1_61, L4_64
end
function passwordGetNext(A0_65)
  return _UPVALUE0_.NOT_SUPPORTED
end
function passwordSet(A0_66, A1_67, A2_68)
  local L3_69, L4_70
  L4_70 = _UPVALUE0_
  L4_70 = L4_70.NIL
  if A0_66 == L4_70 then
    L4_70 = _UPVALUE0_
    L4_70 = L4_70.INVALID_ARGUMENT
    return L4_70
  end
  if A0_66 ~= "WAN1" and A0_66 ~= "WAN2" then
    L4_70 = _UPVALUE0_
    L4_70 = L4_70.INVALID_ARGUMENT
    return L4_70
  end
  L4_70 = _UPVALUE0_
  L4_70 = L4_70.NIL
  if A1_67 == L4_70 then
    L4_70 = _UPVALUE0_
    L4_70 = L4_70.INVALID_ARGUMENT
    return L4_70
  end
  if A1_67 ~= "pppoeProfile1" and A1_67 ~= "pppoeProfile2" then
    L4_70 = _UPVALUE0_
    L4_70 = L4_70.INVALID_ARGUMENT
    return L4_70
  end
  L4_70 = _UPVALUE0_
  L4_70 = L4_70.NIL
  if A2_68 == L4_70 then
    L4_70 = _UPVALUE0_
    L4_70 = L4_70.INVALID_ARGUMENT
    return L4_70
  end
  L4_70 = _UPVALUE1_
  L4_70 = L4_70.wanPort
  L4_70 = L4_70 .. " = '" .. A0_66 .. "' AND " .. _UPVALUE1_.profileName .. " = '" .. A1_67 .. "'"
  if db.setAttributeWhere(_UPVALUE2_, L4_70, _UPVALUE1_.password, A2_68) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_66, A1_67
  end
  return _UPVALUE0_.SUCCESS, A0_66, A1_67
end
function serviceGet(A0_71, A1_72)
  local L2_73, L3_74, L4_75
  L2_73 = _UPVALUE0_
  L2_73 = L2_73.NIL
  if A0_71 == L2_73 then
    L2_73 = _UPVALUE0_
    L2_73 = L2_73.INVALID_ARGUMENT
    return L2_73
  end
  if A0_71 ~= "WAN1" and A0_71 ~= "WAN2" then
    L2_73 = _UPVALUE0_
    L2_73 = L2_73.INVALID_ARGUMENT
    return L2_73
  end
  L2_73 = _UPVALUE0_
  L2_73 = L2_73.NIL
  if A1_72 == L2_73 then
    L2_73 = _UPVALUE0_
    L2_73 = L2_73.INVALID_ARGUMENT
    return L2_73
  end
  if A1_72 ~= "pppoeProfile1" and A1_72 ~= "pppoeProfile2" then
    L2_73 = _UPVALUE0_
    L2_73 = L2_73.INVALID_ARGUMENT
    return L2_73
  end
  L2_73 = _UPVALUE1_
  L2_73 = L2_73.wanPort
  L3_74 = " = '"
  L4_75 = A0_71
  L2_73 = L2_73 .. L3_74 .. L4_75 .. "' AND " .. _UPVALUE1_.profileName .. " = '" .. A1_72 .. "'"
  L3_74 = db
  L3_74 = L3_74.getRowWhere
  L4_75 = _UPVALUE2_
  L3_74 = L3_74(L4_75, L2_73)
  L4_75 = _UPVALUE0_
  L4_75 = L4_75.NIL
  if L3_74 == L4_75 then
    L4_75 = _UPVALUE0_
    L4_75 = L4_75.FAILURE
    return L4_75
  end
  L4_75 = _UPVALUE2_
  L4_75 = L4_75 .. "." .. _UPVALUE1_.service
  L4_75 = L3_74[L4_75]
  return _UPVALUE0_.SUCCESS, A0_71, A1_72, L4_75
end
function serviceGetNext(A0_76)
  return _UPVALUE0_.NOT_SUPPORTED
end
function serviceSet(A0_77, A1_78, A2_79)
  local L3_80
  L3_80 = _UPVALUE0_
  L3_80 = L3_80.NIL
  if A0_77 == L3_80 then
    L3_80 = _UPVALUE0_
    L3_80 = L3_80.INVALID_ARGUMENT
    return L3_80
  end
  if A0_77 ~= "WAN1" and A0_77 ~= "WAN2" then
    L3_80 = _UPVALUE0_
    L3_80 = L3_80.INVALID_ARGUMENT
    return L3_80
  end
  L3_80 = _UPVALUE0_
  L3_80 = L3_80.NIL
  if A1_78 == L3_80 then
    L3_80 = _UPVALUE0_
    L3_80 = L3_80.INVALID_ARGUMENT
    return L3_80
  end
  if A1_78 ~= "pppoeProfile1" and A1_78 ~= "pppoeProfile2" then
    L3_80 = _UPVALUE0_
    L3_80 = L3_80.INVALID_ARGUMENT
    return L3_80
  end
  L3_80 = _UPVALUE0_
  L3_80 = L3_80.NIL
  if A2_79 == L3_80 then
    L3_80 = _UPVALUE0_
    L3_80 = L3_80.INVALID_ARGUMENT
    return L3_80
  end
  L3_80 = _UPVALUE1_
  L3_80 = L3_80.wanPort
  L3_80 = L3_80 .. " = '" .. A0_77 .. "' AND " .. _UPVALUE1_.profileName .. " = '" .. A1_78 .. "'"
  if db.setAttributeWhere(_UPVALUE2_, L3_80, _UPVALUE1_.service, A2_79) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_77, A1_78
  end
  return _UPVALUE0_.SUCCESS, A0_77, A1_78
end
function isgetDnsFromIspEnabled(A0_81, A1_82)
  local L2_83, L3_84, L4_85
  L2_83 = _UPVALUE0_
  L2_83 = L2_83.NIL
  if A0_81 == L2_83 then
    L2_83 = _UPVALUE0_
    L2_83 = L2_83.INVALID_ARGUMENT
    return L2_83
  end
  if A0_81 ~= "WAN1" and A0_81 ~= "WAN2" then
    L2_83 = _UPVALUE0_
    L2_83 = L2_83.INVALID_ARGUMENT
    return L2_83
  end
  L2_83 = _UPVALUE0_
  L2_83 = L2_83.NIL
  if A1_82 == L2_83 then
    L2_83 = _UPVALUE0_
    L2_83 = L2_83.INVALID_ARGUMENT
    return L2_83
  end
  if A1_82 ~= "pppoeProfile1" and A1_82 ~= "pppoeProfile2" then
    L2_83 = _UPVALUE0_
    L2_83 = L2_83.INVALID_ARGUMENT
    return L2_83
  end
  L2_83 = _UPVALUE1_
  L2_83 = L2_83.wanPort
  L3_84 = " = '"
  L4_85 = A0_81
  L2_83 = L2_83 .. L3_84 .. L4_85 .. "' AND " .. _UPVALUE1_.profileName .. " = '" .. A1_82 .. "'"
  L3_84 = db
  L3_84 = L3_84.getRowWhere
  L4_85 = _UPVALUE2_
  L3_84 = L3_84(L4_85, L2_83)
  L4_85 = _UPVALUE0_
  L4_85 = L4_85.NIL
  if L3_84 == L4_85 then
    L4_85 = _UPVALUE0_
    L4_85 = L4_85.FAILURE
    return L4_85
  end
  L4_85 = _UPVALUE2_
  L4_85 = L4_85 .. "." .. _UPVALUE1_.getDnsFromIsp
  L4_85 = L3_84[L4_85]
  return _UPVALUE0_.SUCCESS, A0_81, A1_82, L4_85
end
function isgetDnsFromIspEnabledNext(A0_86)
  return _UPVALUE0_.NOT_SUPPORTED
end
function getDnsFromIspEnable(A0_87, A1_88)
  local L2_89
  L2_89 = _UPVALUE0_
  L2_89 = L2_89.NIL
  if A0_87 == L2_89 then
    L2_89 = _UPVALUE0_
    L2_89 = L2_89.INVALID_ARGUMENT
    return L2_89
  end
  if A0_87 ~= "WAN1" and A0_87 ~= "WAN2" then
    L2_89 = _UPVALUE0_
    L2_89 = L2_89.INVALID_ARGUMENT
    return L2_89
  end
  L2_89 = _UPVALUE0_
  L2_89 = L2_89.NIL
  if A1_88 == L2_89 then
    L2_89 = _UPVALUE0_
    L2_89 = L2_89.INVALID_ARGUMENT
    return L2_89
  end
  if A1_88 ~= "pppoeProfile1" and A1_88 ~= "pppoeProfile2" then
    L2_89 = _UPVALUE0_
    L2_89 = L2_89.INVALID_ARGUMENT
    return L2_89
  end
  L2_89 = _UPVALUE1_
  L2_89 = L2_89.wanPort
  L2_89 = L2_89 .. " = '" .. A0_87 .. "' AND " .. _UPVALUE1_.profileName .. " = '" .. A1_88 .. "'"
  if db.setAttributeWhere(_UPVALUE2_, L2_89, _UPVALUE1_.getDnsFromIsp, _UPVALUE3_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_87, A1_88
  end
  return _UPVALUE0_.SUCCESS, A0_87, A1_88
end
function getDnsFromIspDisable(A0_90, A1_91)
  local L2_92
  L2_92 = _UPVALUE0_
  L2_92 = L2_92.NIL
  if A0_90 == L2_92 then
    L2_92 = _UPVALUE0_
    L2_92 = L2_92.INVALID_ARGUMENT
    return L2_92
  end
  if A0_90 ~= "WAN1" and A0_90 ~= "WAN2" then
    L2_92 = _UPVALUE0_
    L2_92 = L2_92.INVALID_ARGUMENT
    return L2_92
  end
  L2_92 = _UPVALUE0_
  L2_92 = L2_92.NIL
  if A1_91 == L2_92 then
    L2_92 = _UPVALUE0_
    L2_92 = L2_92.INVALID_ARGUMENT
    return L2_92
  end
  if A1_91 ~= "pppoeProfile1" and A1_91 ~= "pppoeProfile2" then
    L2_92 = _UPVALUE0_
    L2_92 = L2_92.INVALID_ARGUMENT
    return L2_92
  end
  L2_92 = _UPVALUE1_
  L2_92 = L2_92.wanPort
  L2_92 = L2_92 .. " = '" .. A0_90 .. "' AND " .. _UPVALUE1_.profileName .. " = '" .. A1_91 .. "'"
  if db.setAttributeWhere(_UPVALUE2_, L2_92, _UPVALUE1_.getDnsFromIsp, _UPVALUE3_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_90, A1_91
  end
  return _UPVALUE0_.SUCCESS, A0_90, A1_91
end
function primaryDnsGet(A0_93, A1_94)
  local L2_95, L3_96, L4_97
  L2_95 = _UPVALUE0_
  L2_95 = L2_95.NIL
  if A0_93 == L2_95 then
    L2_95 = _UPVALUE0_
    L2_95 = L2_95.INVALID_ARGUMENT
    return L2_95
  end
  if A0_93 ~= "WAN1" and A0_93 ~= "WAN2" then
    L2_95 = _UPVALUE0_
    L2_95 = L2_95.INVALID_ARGUMENT
    return L2_95
  end
  L2_95 = _UPVALUE0_
  L2_95 = L2_95.NIL
  if A1_94 == L2_95 then
    L2_95 = _UPVALUE0_
    L2_95 = L2_95.INVALID_ARGUMENT
    return L2_95
  end
  if A1_94 ~= "pppoeProfile1" and A1_94 ~= "pppoeProfile2" then
    L2_95 = _UPVALUE0_
    L2_95 = L2_95.INVALID_ARGUMENT
    return L2_95
  end
  L2_95 = _UPVALUE1_
  L2_95 = L2_95.wanPort
  L3_96 = " = '"
  L4_97 = A0_93
  L2_95 = L2_95 .. L3_96 .. L4_97 .. "' AND " .. _UPVALUE1_.profileName .. " = '" .. A1_94 .. "'"
  L3_96 = db
  L3_96 = L3_96.getRowWhere
  L4_97 = _UPVALUE2_
  L3_96 = L3_96(L4_97, L2_95)
  L4_97 = _UPVALUE0_
  L4_97 = L4_97.NIL
  if L3_96 == L4_97 then
    L4_97 = _UPVALUE0_
    L4_97 = L4_97.FAILURE
    return L4_97
  end
  L4_97 = _UPVALUE2_
  L4_97 = L4_97 .. "." .. _UPVALUE1_.primaryDns
  L4_97 = L3_96[L4_97]
  return _UPVALUE0_.SUCCESS, A0_93, A1_94, L4_97
end
function primaryDnsGetNext(A0_98)
  return _UPVALUE0_.NOT_SUPPORTED
end
function primaryDnsSet(A0_99, A1_100, A2_101)
  local L3_102, L4_103, L5_104, L6_105, L7_106, L8_107
  L4_103 = _UPVALUE0_
  L4_103 = L4_103.NIL
  if A0_99 == L4_103 then
    L4_103 = _UPVALUE0_
    L4_103 = L4_103.INVALID_ARGUMENT
    return L4_103
  end
  if A0_99 ~= "WAN1" and A0_99 ~= "WAN2" then
    L4_103 = _UPVALUE0_
    L4_103 = L4_103.INVALID_ARGUMENT
    return L4_103
  end
  L4_103 = _UPVALUE0_
  L4_103 = L4_103.NIL
  if A1_100 == L4_103 then
    L4_103 = _UPVALUE0_
    L4_103 = L4_103.INVALID_ARGUMENT
    return L4_103
  end
  if A1_100 ~= "pppoeProfile1" and A1_100 ~= "pppoeProfile2" then
    L4_103 = _UPVALUE0_
    L4_103 = L4_103.INVALID_ARGUMENT
    return L4_103
  end
  L4_103 = isgetDnsFromIspEnabled
  L5_104 = A0_99
  L6_105 = A1_100
  L7_106 = L4_103(L5_104, L6_105)
  L8_107 = tonumber
  L8_107 = L8_107(L7_106)
  if L8_107 == 0 then
    L8_107 = _UPVALUE0_
    L8_107 = L8_107.NIL
    if A2_101 == L8_107 then
      L8_107 = _UPVALUE0_
      L8_107 = L8_107.INVALID_ARGUMENT
      return L8_107
    end
  end
  L8_107 = tonumber
  L8_107 = L8_107(L7_106)
  if L8_107 == 1 then
    L8_107 = _UPVALUE0_
    L8_107 = L8_107.DEPENDENCY_NOT_MET
    return L8_107
  end
  L8_107 = _UPVALUE1_
  L8_107 = L8_107.ipAddressCheck
  L8_107 = L8_107(_UPVALUE2_, A2_101)
  L3_102 = L8_107
  L8_107 = _UPVALUE0_
  L8_107 = L8_107.SUCCESS
  if L3_102 ~= L8_107 then
    L8_107 = _UPVALUE0_
    L8_107 = L8_107.INVALID_ARGUMENT
    return L8_107
  end
  L8_107 = _UPVALUE3_
  L8_107 = L8_107.wanPort
  L8_107 = L8_107 .. " = '" .. A0_99 .. "' AND " .. _UPVALUE3_.profileName .. " = '" .. A1_100 .. "'"
  if db.setAttributeWhere(_UPVALUE4_, L8_107, _UPVALUE3_.primaryDns, A2_101) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_99, A1_100
  end
  return _UPVALUE0_.SUCCESS, A0_99, A1_100
end
function secondaryDnsGet(A0_108, A1_109)
  local L2_110, L3_111, L4_112
  L2_110 = _UPVALUE0_
  L2_110 = L2_110.NIL
  if A0_108 == L2_110 then
    L2_110 = _UPVALUE0_
    L2_110 = L2_110.INVALID_ARGUMENT
    return L2_110
  end
  if A0_108 ~= "WAN1" and A0_108 ~= "WAN2" then
    L2_110 = _UPVALUE0_
    L2_110 = L2_110.INVALID_ARGUMENT
    return L2_110
  end
  L2_110 = _UPVALUE0_
  L2_110 = L2_110.NIL
  if A1_109 == L2_110 then
    L2_110 = _UPVALUE0_
    L2_110 = L2_110.INVALID_ARGUMENT
    return L2_110
  end
  if A1_109 ~= "pppoeProfile1" and A1_109 ~= "pppoeProfile2" then
    L2_110 = _UPVALUE0_
    L2_110 = L2_110.INVALID_ARGUMENT
    return L2_110
  end
  L2_110 = _UPVALUE1_
  L2_110 = L2_110.wanPort
  L3_111 = " = '"
  L4_112 = A0_108
  L2_110 = L2_110 .. L3_111 .. L4_112 .. "' AND " .. _UPVALUE1_.profileName .. " = '" .. A1_109 .. "'"
  L3_111 = db
  L3_111 = L3_111.getRowWhere
  L4_112 = _UPVALUE2_
  L3_111 = L3_111(L4_112, L2_110)
  L4_112 = _UPVALUE0_
  L4_112 = L4_112.NIL
  if L3_111 == L4_112 then
    L4_112 = _UPVALUE0_
    L4_112 = L4_112.FAILURE
    return L4_112
  end
  L4_112 = _UPVALUE2_
  L4_112 = L4_112 .. "." .. _UPVALUE1_.secondaryDns
  L4_112 = L3_111[L4_112]
  return _UPVALUE0_.SUCCESS, A0_108, A1_109, L4_112
end
function secondaryDnsGetNext(A0_113)
  return _UPVALUE0_.NOT_SUPPORTED
end
function secondaryDnsSet(A0_114, A1_115, A2_116)
  local L3_117, L4_118, L5_119, L6_120, L7_121, L8_122
  L4_118 = _UPVALUE0_
  L4_118 = L4_118.NIL
  if A0_114 == L4_118 then
    L4_118 = _UPVALUE0_
    L4_118 = L4_118.INVALID_ARGUMENT
    return L4_118
  end
  if A0_114 ~= "WAN1" and A0_114 ~= "WAN2" then
    L4_118 = _UPVALUE0_
    L4_118 = L4_118.INVALID_ARGUMENT
    return L4_118
  end
  L4_118 = _UPVALUE0_
  L4_118 = L4_118.NIL
  if A1_115 == L4_118 then
    L4_118 = _UPVALUE0_
    L4_118 = L4_118.INVALID_ARGUMENT
    return L4_118
  end
  if A1_115 ~= "pppoeProfile1" and A1_115 ~= "pppoeProfile2" then
    L4_118 = _UPVALUE0_
    L4_118 = L4_118.INVALID_ARGUMENT
    return L4_118
  end
  L4_118 = isgetDnsFromIspEnabled
  L5_119 = A0_114
  L6_120 = A1_115
  L7_121 = L4_118(L5_119, L6_120)
  L8_122 = tonumber
  L8_122 = L8_122(L7_121)
  if L8_122 == 0 then
    L8_122 = _UPVALUE0_
    L8_122 = L8_122.NIL
    if A2_116 == L8_122 then
      L8_122 = _UPVALUE0_
      L8_122 = L8_122.INVALID_ARGUMENT
      return L8_122
    end
  end
  L8_122 = tonumber
  L8_122 = L8_122(L7_121)
  if L8_122 == 1 then
    L8_122 = _UPVALUE0_
    L8_122 = L8_122.DEPENDENCY_NOT_MET
    return L8_122
  end
  L8_122 = _UPVALUE1_
  L8_122 = L8_122.ipAddressCheck
  L8_122 = L8_122(_UPVALUE2_, A2_116)
  L3_117 = L8_122
  L8_122 = _UPVALUE0_
  L8_122 = L8_122.SUCCESS
  if L3_117 ~= L8_122 then
    L8_122 = _UPVALUE0_
    L8_122 = L8_122.INVALID_ARGUMENT
    return L8_122
  end
  L8_122 = _UPVALUE3_
  L8_122 = L8_122.wanPort
  L8_122 = L8_122 .. " = '" .. A0_114 .. "' AND " .. _UPVALUE3_.profileName .. " = '" .. A1_115 .. "'"
  if db.setAttributeWhere(_UPVALUE4_, L8_122, _UPVALUE3_.secondaryDns, A2_116) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_114, A1_115
  end
  return _UPVALUE0_.SUCCESS, A0_114, A1_115
end
function authenticationOptionsGet(A0_123, A1_124)
  local L2_125, L3_126, L4_127
  L2_125 = _UPVALUE0_
  L2_125 = L2_125.NIL
  if A0_123 == L2_125 then
    L2_125 = _UPVALUE0_
    L2_125 = L2_125.INVALID_ARGUMENT
    return L2_125
  end
  if A0_123 ~= "WAN1" and A0_123 ~= "WAN2" then
    L2_125 = _UPVALUE0_
    L2_125 = L2_125.INVALID_ARGUMENT
    return L2_125
  end
  L2_125 = _UPVALUE0_
  L2_125 = L2_125.NIL
  if A1_124 == L2_125 then
    L2_125 = _UPVALUE0_
    L2_125 = L2_125.INVALID_ARGUMENT
    return L2_125
  end
  if A1_124 ~= "pppoeProfile1" and A1_124 ~= "pppoeProfile2" then
    L2_125 = _UPVALUE0_
    L2_125 = L2_125.INVALID_ARGUMENT
    return L2_125
  end
  L2_125 = _UPVALUE1_
  L2_125 = L2_125.wanPort
  L3_126 = " = '"
  L4_127 = A0_123
  L2_125 = L2_125 .. L3_126 .. L4_127 .. "' AND " .. _UPVALUE1_.profileName .. " = '" .. A1_124 .. "'"
  L3_126 = db
  L3_126 = L3_126.getRowWhere
  L4_127 = _UPVALUE2_
  L3_126 = L3_126(L4_127, L2_125)
  L4_127 = _UPVALUE0_
  L4_127 = L4_127.NIL
  if L3_126 == L4_127 then
    L4_127 = _UPVALUE0_
    L4_127 = L4_127.FAILURE
    return L4_127
  end
  L4_127 = _UPVALUE2_
  L4_127 = L4_127 .. "." .. _UPVALUE1_.authenticationOptions
  L4_127 = L3_126[L4_127]
  return _UPVALUE0_.SUCCESS, A0_123, A1_124, L4_127
end
function authenticationOptionsGetNext(A0_128)
  return _UPVALUE0_.NOT_SUPPORTED
end
function authenticationOptionsSet(A0_129, A1_130, A2_131)
  local L3_132
  L3_132 = _UPVALUE0_
  L3_132 = L3_132.NIL
  if A0_129 == L3_132 then
    L3_132 = _UPVALUE0_
    L3_132 = L3_132.INVALID_ARGUMENT
    return L3_132
  end
  if A0_129 ~= "WAN1" and A0_129 ~= "WAN2" then
    L3_132 = _UPVALUE0_
    L3_132 = L3_132.INVALID_ARGUMENT
    return L3_132
  end
  L3_132 = _UPVALUE0_
  L3_132 = L3_132.NIL
  if A1_130 == L3_132 then
    L3_132 = _UPVALUE0_
    L3_132 = L3_132.INVALID_ARGUMENT
    return L3_132
  end
  if A1_130 ~= "pppoeProfile1" and A1_130 ~= "pppoeProfile2" then
    L3_132 = _UPVALUE0_
    L3_132 = L3_132.INVALID_ARGUMENT
    return L3_132
  end
  L3_132 = _UPVALUE0_
  L3_132 = L3_132.NIL
  if A2_131 == L3_132 then
    L3_132 = _UPVALUE0_
    L3_132 = L3_132.INVALID_ARGUMENT
    return L3_132
  end
  L3_132 = _UPVALUE1_
  if A2_131 ~= L3_132 then
    L3_132 = _UPVALUE2_
    if A2_131 ~= L3_132 then
      L3_132 = _UPVALUE3_
      if A2_131 ~= L3_132 then
        L3_132 = _UPVALUE4_
        if A2_131 ~= L3_132 then
          L3_132 = _UPVALUE5_
          if A2_131 ~= L3_132 then
            L3_132 = _UPVALUE0_
            L3_132 = L3_132.INVALID_ARGUMENT
            return L3_132
          end
        end
      end
    end
  end
  L3_132 = _UPVALUE6_
  L3_132 = L3_132.wanPort
  L3_132 = L3_132 .. " = '" .. A0_129 .. "' AND " .. _UPVALUE6_.profileName .. " = '" .. A1_130 .. "'"
  if db.setAttributeWhere(_UPVALUE7_, L3_132, _UPVALUE6_.authenticationOptions, A2_131) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_129, A1_130
  end
  return _UPVALUE0_.SUCCESS, A0_129, A1_130
end
function statusGet(A0_133, A1_134)
  local L2_135, L3_136, L4_137
  L2_135 = _UPVALUE0_
  L2_135 = L2_135.NIL
  if A0_133 == L2_135 then
    L2_135 = _UPVALUE0_
    L2_135 = L2_135.INVALID_ARGUMENT
    return L2_135
  end
  if A0_133 ~= "WAN1" and A0_133 ~= "WAN2" then
    L2_135 = _UPVALUE0_
    L2_135 = L2_135.INVALID_ARGUMENT
    return L2_135
  end
  L2_135 = _UPVALUE0_
  L2_135 = L2_135.NIL
  if A1_134 == L2_135 then
    L2_135 = _UPVALUE0_
    L2_135 = L2_135.INVALID_ARGUMENT
    return L2_135
  end
  if A1_134 ~= "pppoeProfile1" and A1_134 ~= "pppoeProfile2" then
    L2_135 = _UPVALUE0_
    L2_135 = L2_135.INVALID_ARGUMENT
    return L2_135
  end
  L2_135 = _UPVALUE1_
  L2_135 = L2_135.wanPort
  L3_136 = " = '"
  L4_137 = A0_133
  L2_135 = L2_135 .. L3_136 .. L4_137 .. "' AND " .. _UPVALUE1_.profileName .. " = '" .. A1_134 .. "'"
  L3_136 = db
  L3_136 = L3_136.getRowWhere
  L4_137 = _UPVALUE2_
  L3_136 = L3_136(L4_137, L2_135)
  L4_137 = _UPVALUE0_
  L4_137 = L4_137.NIL
  if L3_136 == L4_137 then
    L4_137 = _UPVALUE0_
    L4_137 = L4_137.FAILURE
    return L4_137
  end
  L4_137 = _UPVALUE2_
  L4_137 = L4_137 .. "." .. _UPVALUE1_.status
  L4_137 = L3_136[L4_137]
  return _UPVALUE0_.SUCCESS, A0_133, A1_134, L4_137
end
function statusGetNext(A0_138)
  return _UPVALUE0_.NOT_SUPPORTED
end
function statusEnable(A0_139)
  local L1_140
  L1_140 = _UPVALUE0_
  L1_140 = L1_140.NIL
  if A0_139 == L1_140 then
    L1_140 = _UPVALUE0_
    L1_140 = L1_140.INVALID_ARGUMENT
    return L1_140
  end
  if A0_139 ~= "WAN1" and A0_139 ~= "WAN2" then
    L1_140 = _UPVALUE0_
    L1_140 = L1_140.INVALID_ARGUMENT
    return L1_140
  end
  L1_140 = _UPVALUE1_
  L1_140 = L1_140.wanPort
  L1_140 = L1_140 .. " = '" .. A0_139 .. "'"
  if db.setAttributeWhere(_UPVALUE2_, L1_140, _UPVALUE1_.status, _UPVALUE3_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_139
  end
  return _UPVALUE0_.SUCCESS, A0_139
end
function statusDisable(A0_141)
  local L1_142
  L1_142 = _UPVALUE0_
  L1_142 = L1_142.NIL
  if A0_141 == L1_142 then
    L1_142 = _UPVALUE0_
    L1_142 = L1_142.INVALID_ARGUMENT
    return L1_142
  end
  if A0_141 ~= "WAN1" and A0_141 ~= "WAN2" then
    L1_142 = _UPVALUE0_
    L1_142 = L1_142.INVALID_ARGUMENT
    return L1_142
  end
  L1_142 = _UPVALUE1_
  L1_142 = L1_142.wanPort
  L1_142 = L1_142 .. " = '" .. A0_141 .. "'"
  if db.setAttributeWhere(_UPVALUE2_, L1_142, _UPVALUE1_.status, _UPVALUE3_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_141
  end
  return _UPVALUE0_.SUCCESS, A0_141
end
function reconnectModeGet(A0_143, A1_144)
  local L2_145, L3_146, L4_147
  L2_145 = _UPVALUE0_
  L2_145 = L2_145.NIL
  if A0_143 == L2_145 then
    L2_145 = _UPVALUE0_
    L2_145 = L2_145.INVALID_ARGUMENT
    return L2_145
  end
  if A0_143 ~= "WAN1" and A0_143 ~= "WAN2" then
    L2_145 = _UPVALUE0_
    L2_145 = L2_145.INVALID_ARGUMENT
    return L2_145
  end
  L2_145 = _UPVALUE0_
  L2_145 = L2_145.NIL
  if A1_144 == L2_145 then
    L2_145 = _UPVALUE0_
    L2_145 = L2_145.INVALID_ARGUMENT
    return L2_145
  end
  if A1_144 ~= "pppoeProfile1" and A1_144 ~= "pppoeProfile2" then
    L2_145 = _UPVALUE0_
    L2_145 = L2_145.INVALID_ARGUMENT
    return L2_145
  end
  L2_145 = _UPVALUE1_
  L2_145 = L2_145.wanPort
  L3_146 = " = '"
  L4_147 = A0_143
  L2_145 = L2_145 .. L3_146 .. L4_147 .. "' AND " .. _UPVALUE1_.profileName .. " = '" .. A1_144 .. "'"
  L3_146 = db
  L3_146 = L3_146.getRowWhere
  L4_147 = _UPVALUE2_
  L3_146 = L3_146(L4_147, L2_145)
  L4_147 = _UPVALUE0_
  L4_147 = L4_147.NIL
  if L3_146 == L4_147 then
    L4_147 = _UPVALUE0_
    L4_147 = L4_147.FAILURE
    return L4_147
  end
  L4_147 = _UPVALUE2_
  L4_147 = L4_147 .. "." .. _UPVALUE1_.reconnectMode
  L4_147 = L3_146[L4_147]
  return _UPVALUE0_.SUCCESS, A0_143, A1_144, L4_147
end
function reconnectModeGetNext(A0_148, A1_149)
  return _UPVALUE0_.NOT_SUPPORTED
end
function reconnectModeEnable(A0_150)
  local L1_151
  L1_151 = _UPVALUE0_
  L1_151 = L1_151.NIL
  if A0_150 == L1_151 then
    L1_151 = _UPVALUE0_
    L1_151 = L1_151.INVALID_ARGUMENT
    return L1_151
  end
  if A0_150 ~= "WAN1" and A0_150 ~= "WAN2" then
    L1_151 = _UPVALUE0_
    L1_151 = L1_151.INVALID_ARGUMENT
    return L1_151
  end
  L1_151 = _UPVALUE1_
  L1_151 = L1_151.wanPort
  L1_151 = L1_151 .. " = '" .. A0_150 .. "'"
  if db.setAttributeWhere(_UPVALUE2_, L1_151, _UPVALUE1_.reconnectMode, _UPVALUE3_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_150
  end
  return _UPVALUE0_.SUCCESS, A0_150
end
function reconnectModeDisable(A0_152)
  local L1_153
  L1_153 = _UPVALUE0_
  L1_153 = L1_153.NIL
  if A0_152 == L1_153 then
    L1_153 = _UPVALUE0_
    L1_153 = L1_153.INVALID_ARGUMENT
    return L1_153
  end
  if A0_152 ~= "WAN1" and A0_152 ~= "WAN2" then
    L1_153 = _UPVALUE0_
    L1_153 = L1_153.INVALID_ARGUMENT
    return L1_153
  end
  L1_153 = _UPVALUE1_
  L1_153 = L1_153.wanPort
  L1_153 = L1_153 .. " = '" .. A0_152 .. "'"
  if db.setAttributeWhere(_UPVALUE2_, L1_153, _UPVALUE1_.reconnectMode, _UPVALUE3_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_152
  end
  return _UPVALUE0_.SUCCESS, A0_152
end
function idleTimeOutValueGet(A0_154, A1_155)
  local L2_156, L3_157, L4_158
  L2_156 = _UPVALUE0_
  L2_156 = L2_156.NIL
  if A0_154 == L2_156 then
    L2_156 = _UPVALUE0_
    L2_156 = L2_156.INVALID_ARGUMENT
    return L2_156
  end
  if A0_154 ~= "WAN1" and A0_154 ~= "WAN2" then
    L2_156 = _UPVALUE0_
    L2_156 = L2_156.INVALID_ARGUMENT
    return L2_156
  end
  L2_156 = _UPVALUE0_
  L2_156 = L2_156.NIL
  if A1_155 == L2_156 then
    L2_156 = _UPVALUE0_
    L2_156 = L2_156.INVALID_ARGUMENT
    return L2_156
  end
  if A1_155 ~= "pppoeProfile1" and A1_155 ~= "pppoeProfile2" then
    L2_156 = _UPVALUE0_
    L2_156 = L2_156.INVALID_ARGUMENT
    return L2_156
  end
  L2_156 = _UPVALUE1_
  L2_156 = L2_156.wanPort
  L3_157 = " = '"
  L4_158 = A0_154
  L2_156 = L2_156 .. L3_157 .. L4_158 .. "' AND " .. _UPVALUE1_.profileName .. " = '" .. A1_155 .. "'"
  L3_157 = db
  L3_157 = L3_157.getRowWhere
  L4_158 = _UPVALUE2_
  L3_157 = L3_157(L4_158, L2_156)
  L4_158 = _UPVALUE0_
  L4_158 = L4_158.NIL
  if L3_157 == L4_158 then
    L4_158 = _UPVALUE0_
    L4_158 = L4_158.FAILURE
    return L4_158
  end
  L4_158 = _UPVALUE2_
  L4_158 = L4_158 .. "." .. _UPVALUE1_.idleTimeOutValue
  L4_158 = L3_157[L4_158]
  return _UPVALUE0_.SUCCESS, A0_154, A1_155, L4_158
end
function idleTimeOutValueGetNext(A0_159, A1_160)
  return _UPVALUE0_.NOT_SUPPORTED
end
function idleTimeOutValueSet(A0_161, A1_162, A2_163)
  local L3_164, L4_165, L5_166, L6_167, L7_168, L8_169, L9_170
  L4_165 = _UPVALUE0_
  L4_165 = L4_165.NIL
  if A0_161 == L4_165 then
    L4_165 = _UPVALUE0_
    L4_165 = L4_165.INVALID_ARGUMENT
    return L4_165
  end
  if A0_161 ~= "WAN1" and A0_161 ~= "WAN2" then
    L4_165 = _UPVALUE0_
    L4_165 = L4_165.INVALID_ARGUMENT
    return L4_165
  end
  L4_165 = _UPVALUE0_
  L4_165 = L4_165.NIL
  if A1_162 == L4_165 then
    L4_165 = _UPVALUE0_
    L4_165 = L4_165.INVALID_ARGUMENT
    return L4_165
  end
  if A1_162 ~= "pppoeProfile1" and A1_162 ~= "pppoeProfile2" then
    L4_165 = _UPVALUE0_
    L4_165 = L4_165.INVALID_ARGUMENT
    return L4_165
  end
  L4_165 = reconnectModeGet
  L5_166 = A0_161
  L6_167 = A1_162
  L7_168 = L4_165(L5_166, L6_167)
  L8_169 = tonumber
  L9_170 = L7_168
  L8_169 = L8_169(L9_170)
  if L8_169 == 0 then
    L8_169 = _UPVALUE0_
    L8_169 = L8_169.NIL
    if A2_163 ~= L8_169 then
      L8_169 = _UPVALUE0_
      L8_169 = L8_169.DEPENDENCY_NOT_MET
      return L8_169
    end
  end
  L8_169 = tonumber
  L9_170 = L7_168
  L8_169 = L8_169(L9_170)
  if L8_169 == 1 then
    L8_169 = _UPVALUE0_
    L8_169 = L8_169.NIL
    if A2_163 == L8_169 then
      L8_169 = _UPVALUE0_
      L8_169 = L8_169.INVALID_ARGUMENT
      return L8_169
    end
  end
  L8_169 = tonumber
  L9_170 = A2_163
  L8_169 = L8_169(L9_170)
  if L8_169 < 1 or L8_169 > 10 then
    L9_170 = _UPVALUE0_
    L9_170 = L9_170.INVALID_ARGUMENT
    return L9_170
  end
  L9_170 = _UPVALUE1_
  L9_170 = L9_170.wanPort
  L9_170 = L9_170 .. " = '" .. A0_161 .. "' AND " .. _UPVALUE1_.profileName .. " = '" .. A1_162 .. "'"
  if db.setAttributeWhere(_UPVALUE2_, L9_170, _UPVALUE1_.idleTimeOutValue, A2_163) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_161, A1_162
  end
  return _UPVALUE0_.SUCCESS, A0_161, A1_162
end
function japanPPPoEConnectionGet(A0_171, A1_172)
  local L2_173, L3_174, L4_175, L5_176, L6_177, L7_178, L8_179, L9_180, L10_181, L11_182, L12_183, L13_184, L14_185, L15_186, L16_187
  L2_173 = _UPVALUE0_
  L2_173 = L2_173.NIL
  if A0_171 == L2_173 then
    L2_173 = _UPVALUE0_
    L2_173 = L2_173.INVALID_ARGUMENT
    return L2_173
  end
  if A0_171 ~= "WAN1" and A0_171 ~= "WAN2" then
    L2_173 = _UPVALUE0_
    L2_173 = L2_173.INVALID_ARGUMENT
    return L2_173
  end
  L2_173 = _UPVALUE0_
  L2_173 = L2_173.NIL
  if A1_172 == L2_173 then
    L2_173 = _UPVALUE0_
    L2_173 = L2_173.INVALID_ARGUMENT
    return L2_173
  end
  if A1_172 ~= "pppoeProfile1" and A1_172 ~= "pppoeProfile2" then
    L2_173 = _UPVALUE0_
    L2_173 = L2_173.INVALID_ARGUMENT
    return L2_173
  end
  L2_173 = _UPVALUE1_
  L2_173 = L2_173.wanPort
  L3_174 = " = '"
  L4_175 = A0_171
  L5_176 = "' AND "
  L6_177 = _UPVALUE1_
  L6_177 = L6_177.profileName
  L7_178 = " = '"
  L8_179 = A1_172
  L9_180 = "'"
  L2_173 = L2_173 .. L3_174 .. L4_175 .. L5_176 .. L6_177 .. L7_178 .. L8_179 .. L9_180
  L3_174 = db
  L3_174 = L3_174.getRowWhere
  L4_175 = _UPVALUE2_
  L5_176 = L2_173
  L3_174 = L3_174(L4_175, L5_176)
  L4_175 = _UPVALUE0_
  L4_175 = L4_175.NIL
  if L3_174 == L4_175 then
    L4_175 = _UPVALUE0_
    L4_175 = L4_175.FAILURE
    L5_176 = A0_171
    L6_177 = A1_172
    return L4_175, L5_176, L6_177
  end
  L4_175 = _UPVALUE2_
  L5_176 = "."
  L6_177 = _UPVALUE1_
  L6_177 = L6_177.getIPFromIsp
  L4_175 = L4_175 .. L5_176 .. L6_177
  L4_175 = L3_174[L4_175]
  L5_176 = _UPVALUE2_
  L6_177 = "."
  L7_178 = _UPVALUE1_
  L7_178 = L7_178.ipAddress
  L5_176 = L5_176 .. L6_177 .. L7_178
  L5_176 = L3_174[L5_176]
  L6_177 = _UPVALUE2_
  L7_178 = "."
  L8_179 = _UPVALUE1_
  L8_179 = L8_179.networkMask
  L6_177 = L6_177 .. L7_178 .. L8_179
  L6_177 = L3_174[L6_177]
  L7_178 = _UPVALUE2_
  L8_179 = "."
  L9_180 = _UPVALUE1_
  L9_180 = L9_180.userName
  L7_178 = L7_178 .. L8_179 .. L9_180
  L7_178 = L3_174[L7_178]
  L8_179 = _UPVALUE2_
  L9_180 = "."
  L10_181 = _UPVALUE1_
  L10_181 = L10_181.password
  L8_179 = L8_179 .. L9_180 .. L10_181
  L8_179 = L3_174[L8_179]
  L9_180 = _UPVALUE2_
  L10_181 = "."
  L11_182 = _UPVALUE1_
  L11_182 = L11_182.service
  L9_180 = L9_180 .. L10_181 .. L11_182
  L9_180 = L3_174[L9_180]
  L10_181 = _UPVALUE2_
  L11_182 = "."
  L12_183 = _UPVALUE1_
  L12_183 = L12_183.getDnsFromIsp
  L10_181 = L10_181 .. L11_182 .. L12_183
  L10_181 = L3_174[L10_181]
  L11_182 = _UPVALUE2_
  L12_183 = "."
  L13_184 = _UPVALUE1_
  L13_184 = L13_184.primaryDns
  L11_182 = L11_182 .. L12_183 .. L13_184
  L11_182 = L3_174[L11_182]
  L12_183 = _UPVALUE2_
  L13_184 = "."
  L14_185 = _UPVALUE1_
  L14_185 = L14_185.secondaryDns
  L12_183 = L12_183 .. L13_184 .. L14_185
  L12_183 = L3_174[L12_183]
  L13_184 = _UPVALUE2_
  L14_185 = "."
  L15_186 = _UPVALUE1_
  L15_186 = L15_186.authenticationOptions
  L13_184 = L13_184 .. L14_185 .. L15_186
  L13_184 = L3_174[L13_184]
  L14_185 = _UPVALUE2_
  L15_186 = "."
  L16_187 = _UPVALUE1_
  L16_187 = L16_187.status
  L14_185 = L14_185 .. L15_186 .. L16_187
  L14_185 = L3_174[L14_185]
  L15_186 = _UPVALUE2_
  L16_187 = "."
  L15_186 = L15_186 .. L16_187 .. _UPVALUE1_.reconnectMode
  L15_186 = L3_174[L15_186]
  L16_187 = _UPVALUE2_
  L16_187 = L16_187 .. "." .. _UPVALUE1_.idleTimeOutValue
  L16_187 = L3_174[L16_187]
  return _UPVALUE0_.SUCCESS, A0_171, A1_172, L4_175, L5_176, L6_177, L7_178, L8_179, L9_180, L10_181, L11_182, L12_183, L13_184, L14_185, L15_186, L16_187
end
function japanPPPoEConnectionGetNext(A0_188)
  return _UPVALUE0_.NOT_SUPPORTED
end
function japanPPPoEConnectionSet(A0_189, A1_190, A2_191, A3_192, A4_193, A5_194, A6_195, A7_196, A8_197, A9_198, A10_199, A11_200, A12_201, A13_202)
  local L14_203, L15_204, L16_205, L17_206, L18_207, L19_208, L20_209
  L15_204 = _UPVALUE0_
  L15_204 = L15_204.NIL
  if A1_190 == L15_204 then
    L15_204 = _UPVALUE1_
    L15_204 = L15_204.JPPPOE_PROFILENAME_NIL
    return L15_204
  end
  if A1_190 ~= "pppoeProfile1" and A1_190 ~= "pppoeProfile2" then
    L15_204 = _UPVALUE1_
    L15_204 = L15_204.JPPPOE_INVALID_PROFILENAME
    return L15_204
  end
  L15_204 = _UPVALUE0_
  L15_204 = L15_204.NIL
  if A0_189 == L15_204 then
    L15_204 = _UPVALUE1_
    L15_204 = L15_204.JPPPOE_WANPORT_NIL
    return L15_204
  end
  if A0_189 ~= "WAN1" and A0_189 ~= "WAN2" then
    L15_204 = _UPVALUE1_
    L15_204 = L15_204.JPPPOE_INVALID_WANPORT
    return L15_204
  end
  L15_204 = nil
  if A0_189 == "WAN1" then
    if A1_190 == "pppoeProfile1" then
      L15_204 = 1
    else
      L15_204 = 2
    end
  elseif A1_190 == "pppoeProfile1" then
    L15_204 = 3
  else
    L15_204 = 4
  end
  L16_205 = _UPVALUE0_
  L16_205 = L16_205.NIL
  if A2_191 == L16_205 then
    L16_205 = _UPVALUE1_
    L16_205 = L16_205.JPPPOE_GET_IP_FROM_ISP_NIL
    return L16_205
  end
  L16_205 = _UPVALUE2_
  L16_205 = L16_205.isBoolean
  L17_206 = A2_191
  L16_205 = L16_205(L17_206)
  L14_203 = L16_205
  L16_205 = _UPVALUE0_
  L16_205 = L16_205.SUCCESS
  if L14_203 ~= L16_205 then
    L16_205 = _UPVALUE1_
    L16_205 = L16_205.JPPPOE_INVALID_GET_IP_FROM_ISP
    return L16_205
  end
  L16_205 = tonumber
  L17_206 = A2_191
  L16_205 = L16_205(L17_206)
  if L16_205 == 0 then
    L16_205 = _UPVALUE0_
    L16_205 = L16_205.NIL
    if A3_192 == L16_205 then
      L16_205 = _UPVALUE1_
      L16_205 = L16_205.JPPPOE_IP_NIL
      return L16_205
    end
  end
  L16_205 = tonumber
  L17_206 = A2_191
  L16_205 = L16_205(L17_206)
  if L16_205 == 1 then
    L16_205 = _UPVALUE0_
    L16_205 = L16_205.NIL
    if A3_192 ~= L16_205 then
      L16_205 = _UPVALUE0_
      L16_205 = L16_205.DEPENDENCY_NOT_MET
      return L16_205
    end
  end
  L16_205 = _UPVALUE0_
  L16_205 = L16_205.NIL
  if A3_192 ~= L16_205 then
    L16_205 = _UPVALUE2_
    L16_205 = L16_205.ipAddressCheck
    L17_206 = _UPVALUE3_
    L18_207 = A3_192
    L16_205 = L16_205(L17_206, L18_207)
    L14_203 = L16_205
    L16_205 = _UPVALUE0_
    L16_205 = L16_205.SUCCESS
    if L14_203 ~= L16_205 then
      L16_205 = _UPVALUE1_
      L16_205 = L16_205.JPPPOE_INVALID_IP
      return L16_205
    end
  end
  L16_205 = tonumber
  L17_206 = A2_191
  L16_205 = L16_205(L17_206)
  if L16_205 == 0 then
    L16_205 = _UPVALUE0_
    L16_205 = L16_205.NIL
    if A4_193 == L16_205 then
      L16_205 = _UPVALUE1_
      L16_205 = L16_205.JPPPOE_NETMASK_NIL
      return L16_205
    end
  end
  L16_205 = tonumber
  L17_206 = A2_191
  L16_205 = L16_205(L17_206)
  if L16_205 == 1 then
    L16_205 = _UPVALUE0_
    L16_205 = L16_205.NIL
    if A4_193 ~= L16_205 then
      L16_205 = _UPVALUE0_
      L16_205 = L16_205.DEPENDENCY_NOT_MET
      return L16_205
    end
  end
  L16_205 = _UPVALUE0_
  L16_205 = L16_205.NIL
  if A4_193 ~= L16_205 then
    L16_205 = _UPVALUE2_
    L16_205 = L16_205.ipAddressCheck
    L17_206 = _UPVALUE3_
    L18_207 = A4_193
    L16_205 = L16_205(L17_206, L18_207)
    L14_203 = L16_205
    L16_205 = _UPVALUE0_
    L16_205 = L16_205.SUCCESS
    if L14_203 ~= L16_205 then
      L16_205 = _UPVALUE1_
      L16_205 = L16_205.JPPPOE_INVALID_NETMASK
      return L16_205
    end
  end
  L16_205 = _UPVALUE0_
  L16_205 = L16_205.NIL
  if A3_192 ~= L16_205 then
    L16_205 = _UPVALUE0_
    L16_205 = L16_205.NIL
    if A4_193 ~= L16_205 then
      L16_205 = staticIpSubnetCheck
      L17_206 = A0_189
      L18_207 = A3_192
      L19_208 = A4_193
      L16_205 = L16_205(L17_206, L18_207, L19_208)
      L14_203 = L16_205
      L16_205 = _UPVALUE0_
      L16_205 = L16_205.SUCCESS
      if L14_203 ~= L16_205 then
        return L14_203
      end
    end
  end
  L16_205 = _UPVALUE0_
  L16_205 = L16_205.NIL
  if A5_194 == L16_205 then
    L16_205 = _UPVALUE1_
    L16_205 = L16_205.JPPPOE_USERNAME_NIL
    return L16_205
  end
  L16_205 = _UPVALUE0_
  L16_205 = L16_205.NIL
  if A6_195 == L16_205 then
    L16_205 = _UPVALUE1_
    L16_205 = L16_205.JPPPOE_PWD_NIL
    return L16_205
  end
  L16_205 = _UPVALUE0_
  L16_205 = L16_205.NIL
  if A8_197 == L16_205 then
    L16_205 = _UPVALUE1_
    L16_205 = L16_205.JPPPOE_GET_DNS_FROM_ISP_NIL
    return L16_205
  end
  L16_205 = _UPVALUE2_
  L16_205 = L16_205.isBoolean
  L17_206 = A8_197
  L16_205 = L16_205(L17_206)
  L14_203 = L16_205
  L16_205 = _UPVALUE0_
  L16_205 = L16_205.SUCCESS
  if L14_203 ~= L16_205 then
    L16_205 = _UPVALUE1_
    L16_205 = L16_205.JPPPOE_INVALID_GET_DNS_FROM_ISP
    return L16_205
  end
  L16_205 = tonumber
  L17_206 = A8_197
  L16_205 = L16_205(L17_206)
  if L16_205 == 0 then
    L16_205 = _UPVALUE0_
    L16_205 = L16_205.NIL
    if A9_198 == L16_205 then
      L16_205 = _UPVALUE1_
      L16_205 = L16_205.JPPPOE_PRI_DNS_NIL
      return L16_205
    end
  end
  L16_205 = tonumber
  L17_206 = A8_197
  L16_205 = L16_205(L17_206)
  if L16_205 == 1 then
    L16_205 = _UPVALUE0_
    L16_205 = L16_205.NIL
    if A9_198 ~= L16_205 then
      L16_205 = _UPVALUE0_
      L16_205 = L16_205.DEPENDENCY_NOT_MET
      return L16_205
    end
  end
  L16_205 = _UPVALUE0_
  L16_205 = L16_205.NIL
  if A9_198 ~= L16_205 then
    L16_205 = _UPVALUE2_
    L16_205 = L16_205.ipAddressCheck
    L17_206 = _UPVALUE3_
    L18_207 = A9_198
    L16_205 = L16_205(L17_206, L18_207)
    L14_203 = L16_205
    L16_205 = _UPVALUE0_
    L16_205 = L16_205.SUCCESS
    if L14_203 ~= L16_205 then
      L16_205 = returnCode_pppoe
      L16_205 = L16_205.JPPPOE_INVALID_PRI_DNS
      return L16_205
    end
  end
  L16_205 = tonumber
  L17_206 = A8_197
  L16_205 = L16_205(L17_206)
  if L16_205 == 0 then
    L16_205 = _UPVALUE0_
    L16_205 = L16_205.NIL
    if A10_199 == L16_205 then
      L16_205 = _UPVALUE1_
      L16_205 = L16_205.JPPPOE_SEC_DNS_NIL
      return L16_205
    end
  end
  L16_205 = tonumber
  L17_206 = A8_197
  L16_205 = L16_205(L17_206)
  if L16_205 == 1 then
    L16_205 = _UPVALUE0_
    L16_205 = L16_205.NIL
    if A10_199 ~= L16_205 then
      L16_205 = _UPVALUE0_
      L16_205 = L16_205.DEPENDENCY_NOT_MET
      return L16_205
    end
  end
  L16_205 = _UPVALUE0_
  L16_205 = L16_205.NIL
  if A10_199 ~= L16_205 then
    L16_205 = _UPVALUE2_
    L16_205 = L16_205.ipAddressCheck
    L17_206 = _UPVALUE3_
    L18_207 = A10_199
    L16_205 = L16_205(L17_206, L18_207)
    L14_203 = L16_205
    L16_205 = _UPVALUE0_
    L16_205 = L16_205.SUCCESS
    if L14_203 ~= L16_205 then
      L16_205 = _UPVALUE1_
      L16_205 = L16_205.JPPPOE_INVALID_SEC_DNS
      return L16_205
    end
  end
  L16_205 = _UPVALUE0_
  L16_205 = L16_205.NIL
  if A11_200 == L16_205 then
    L16_205 = _UPVALUE1_
    L16_205 = L16_205.JPPPOE_AUTH_OPT_NIL
    return L16_205
  end
  L16_205 = _UPVALUE4_
  if A11_200 ~= L16_205 then
    L16_205 = _UPVALUE5_
    if A11_200 ~= L16_205 then
      L16_205 = _UPVALUE6_
      if A11_200 ~= L16_205 then
        L16_205 = _UPVALUE7_
        if A11_200 ~= L16_205 then
          L16_205 = _UPVALUE8_
          if A11_200 ~= L16_205 then
            L16_205 = _UPVALUE1_
            L16_205 = L16_205.JPPPOE_INVALID_AUTH_OPT
            return L16_205
          end
        end
      end
    end
  end
  L16_205 = _UPVALUE0_
  L16_205 = L16_205.NIL
  if A12_201 == L16_205 then
    L16_205 = _UPVALUE1_
    L16_205 = L16_205.JPPPOE_RECONNECT_MODE_NIL
    return L16_205
  end
  L16_205 = _UPVALUE2_
  L16_205 = L16_205.isBoolean
  L17_206 = A12_201
  L16_205 = L16_205(L17_206)
  L14_203 = L16_205
  L16_205 = _UPVALUE0_
  L16_205 = L16_205.SUCCESS
  if L14_203 ~= L16_205 then
    L16_205 = _UPVALUE1_
    L16_205 = L16_205.JPPPOE_INVALID_RECONNECT_MODE
    return L16_205
  end
  L16_205 = tonumber
  L17_206 = A12_201
  L16_205 = L16_205(L17_206)
  if L16_205 == 0 then
    L16_205 = _UPVALUE0_
    L16_205 = L16_205.NIL
    if A13_202 ~= L16_205 then
      L16_205 = _UPVALUE0_
      L16_205 = L16_205.DEPENDENCY_NOT_MET
      return L16_205
    end
  end
  L16_205 = tonumber
  L17_206 = A12_201
  L16_205 = L16_205(L17_206)
  if L16_205 == 1 then
    L16_205 = _UPVALUE0_
    L16_205 = L16_205.NIL
    if A13_202 == L16_205 then
      L16_205 = _UPVALUE1_
      L16_205 = L16_205.JPPPOE_IDLE_TIMEOUT_NIL
      return L16_205
    end
  end
  L16_205 = tonumber
  L17_206 = A12_201
  L16_205 = L16_205(L17_206)
  if L16_205 == 1 then
    L16_205 = tonumber
    L17_206 = A13_202
    L16_205 = L16_205(L17_206)
    if L16_205 < 1 or L16_205 > 10 then
      L17_206 = _UPVALUE1_
      L17_206 = L17_206.JPPPOE_INVALID_IDLE_TIMEOUT_VAL
      return L17_206
    end
  end
  L16_205 = tonumber
  L17_206 = A12_201
  L16_205 = L16_205(L17_206)
  if L16_205 == 1 then
    L16_205 = idleTimeOutCheck
    L16_205 = L16_205()
    L17_206 = _UPVALUE0_
    L17_206 = L17_206.SUCCESS
    if L16_205 ~= L17_206 then
      return L16_205
    end
  end
  L16_205 = {}
  L17_206 = _UPVALUE9_
  L18_207 = "."
  L19_208 = _UPVALUE10_
  L19_208 = L19_208.getIPFromIsp
  L17_206 = L17_206 .. L18_207 .. L19_208
  L16_205[L17_206] = A2_191
  L17_206 = _UPVALUE9_
  L18_207 = "."
  L19_208 = _UPVALUE10_
  L19_208 = L19_208.ipAddress
  L17_206 = L17_206 .. L18_207 .. L19_208
  L16_205[L17_206] = A3_192
  L17_206 = _UPVALUE9_
  L18_207 = "."
  L19_208 = _UPVALUE10_
  L19_208 = L19_208.networkMask
  L17_206 = L17_206 .. L18_207 .. L19_208
  L16_205[L17_206] = A4_193
  L17_206 = _UPVALUE9_
  L18_207 = "."
  L19_208 = _UPVALUE10_
  L19_208 = L19_208.userName
  L17_206 = L17_206 .. L18_207 .. L19_208
  L16_205[L17_206] = A5_194
  L17_206 = util
  L17_206 = L17_206.mask
  L18_207 = A6_195
  L17_206 = L17_206(L18_207)
  if L17_206 ~= A6_195 then
    L18_207 = _UPVALUE9_
    L19_208 = "."
    L20_209 = _UPVALUE10_
    L20_209 = L20_209.password
    L18_207 = L18_207 .. L19_208 .. L20_209
    L16_205[L18_207] = A6_195
  end
  L18_207 = _UPVALUE9_
  L19_208 = "."
  L20_209 = _UPVALUE10_
  L20_209 = L20_209.service
  L18_207 = L18_207 .. L19_208 .. L20_209
  L16_205[L18_207] = A7_196
  L18_207 = _UPVALUE9_
  L19_208 = "."
  L20_209 = _UPVALUE10_
  L20_209 = L20_209.getDnsFromIsp
  L18_207 = L18_207 .. L19_208 .. L20_209
  L16_205[L18_207] = A8_197
  L18_207 = _UPVALUE9_
  L19_208 = "."
  L20_209 = _UPVALUE10_
  L20_209 = L20_209.primaryDns
  L18_207 = L18_207 .. L19_208 .. L20_209
  L16_205[L18_207] = A9_198
  L18_207 = _UPVALUE9_
  L19_208 = "."
  L20_209 = _UPVALUE10_
  L20_209 = L20_209.secondaryDns
  L18_207 = L18_207 .. L19_208 .. L20_209
  L16_205[L18_207] = A10_199
  L18_207 = _UPVALUE9_
  L19_208 = "."
  L20_209 = _UPVALUE10_
  L20_209 = L20_209.authenticationOptions
  L18_207 = L18_207 .. L19_208 .. L20_209
  L16_205[L18_207] = A11_200
  L18_207 = _UPVALUE9_
  L19_208 = "."
  L20_209 = _UPVALUE10_
  L20_209 = L20_209.reconnectMode
  L18_207 = L18_207 .. L19_208 .. L20_209
  L16_205[L18_207] = A12_201
  L18_207 = _UPVALUE9_
  L19_208 = "."
  L20_209 = _UPVALUE10_
  L20_209 = L20_209.idleTimeOutValue
  L18_207 = L18_207 .. L19_208 .. L20_209
  L16_205[L18_207] = A13_202
  L18_207 = db
  L18_207 = L18_207.update
  L19_208 = _UPVALUE9_
  L20_209 = L16_205
  L19_208 = L18_207(L19_208, L20_209, L15_204)
  L20_209 = _UPVALUE10_
  L20_209 = L20_209.wanPort
  L20_209 = L20_209 .. " = '" .. A0_189 .. "'"
  if L19_208 == _UPVALUE0_.NIL or db.setAttributeWhere(_UPVALUE9_, L20_209, _UPVALUE10_.status, _UPVALUE11_) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_189, A1_190
  end
  return _UPVALUE0_.SUCCESS, A0_189, A1_190
end
function japanPPPoEConnectionCreate(A0_210, A1_211, A2_212, A3_213, A4_214, A5_215, A6_216, A7_217, A8_218, A9_219, A10_220)
  return _UPVALUE0_.NOT_SUPPORTED
end
function japanPPPoEConnectionDelete(A0_221)
  return _UPVALUE0_.NOT_SUPPORTED
end
function staticIpSubnetCheck(A0_222, A1_223, A2_224)
  local L3_225, L4_226, L5_227, L6_228, L7_229, L8_230, L9_231, L10_232, L11_233, L12_234, L13_235, L14_236, L15_237, L16_238, L17_239, L18_240, L19_241
  L13_235 = _UPVALUE0_
  L14_236 = _UPVALUE1_
  L14_236 = L14_236.vlanGet
  L15_237 = L13_235
  L8_230, L10_232, L11_233, L12_234, L14_236 = nil, nil, nil, nil, L14_236(L15_237)
  L8_230, L10_232, L11_233, L12_234, L15_237 = nil, nil, nil, nil, L14_236(L15_237)
  L8_230, L10_232, L11_233, L12_234, L16_238 = nil, nil, nil, nil, L14_236(L15_237)
  L8_230, L10_232, L11_233, L12_234, L17_239 = nil, nil, nil, nil, L14_236(L15_237)
  L8_230, L10_232, L11_233, L12_234, L18_240 = nil, nil, nil, nil, L14_236(L15_237)
  L8_230, L10_232, L11_233, L12_234, L19_241 = nil, nil, nil, nil, L14_236(L15_237)
  L4_226 = L19_241
  L7_229 = L18_240
  L6_228 = L17_239
  L5_227 = L16_238
  L9_231 = L15_237
  L3_225 = L14_236
  L14_236 = _UPVALUE2_
  L14_236 = L14_236.SUCCESS
  if L3_225 ~= L14_236 then
    L14_236 = _UPVALUE3_
    L14_236 = L14_236.SUBNET_CHECK_FAILED
    return L14_236
  end
  L14_236 = _UPVALUE4_
  L14_236 = L14_236.ipv4DualMaskCheck
  L15_237 = L4_226
  L16_238 = L8_230
  L17_239 = A1_223
  L18_240 = A2_224
  L14_236 = L14_236(L15_237, L16_238, L17_239, L18_240)
  L3_225 = L14_236
  L14_236 = _UPVALUE2_
  L14_236 = L14_236.SUCCESS
  if L3_225 == L14_236 then
    L14_236 = _UPVALUE3_
    L14_236 = L14_236.SAME_SUBNET_LAN
    return L14_236
  end
  L14_236 = _UPVALUE1_
  L14_236 = L14_236.vlanGetNext
  L15_237 = L9_231
  L8_230, L10_232, L11_233, L12_234, L19_241 = L14_236(L15_237)
  L4_226 = L19_241
  L7_229 = L18_240
  L6_228 = L17_239
  L5_227 = L16_238
  L9_231 = L15_237
  L3_225 = L14_236
  while true do
    L14_236 = _UPVALUE2_
    L14_236 = L14_236.NEXT_ROWID_INVALID
    if L3_225 ~= L14_236 then
      L14_236 = _UPVALUE2_
      L14_236 = L14_236.SUCCESS
      if L3_225 ~= L14_236 then
        L14_236 = _UPVALUE3_
        L14_236 = L14_236.SUBNET_CHECK_FAILED
        return L14_236
      end
      L14_236 = _UPVALUE4_
      L14_236 = L14_236.ipv4DualMaskCheck
      L15_237 = L4_226
      L16_238 = L8_230
      L17_239 = A1_223
      L18_240 = A2_224
      L14_236 = L14_236(L15_237, L16_238, L17_239, L18_240)
      L3_225 = L14_236
      L14_236 = _UPVALUE2_
      L14_236 = L14_236.SUCCESS
      if L3_225 == L14_236 then
        L14_236 = _UPVALUE3_
        L14_236 = L14_236.SAME_SUBNET_VLAN
        return L14_236
      end
      L14_236 = _UPVALUE1_
      L14_236 = L14_236.vlanGetNext
      L15_237 = L9_231
      L8_230, L10_232, L11_233, L12_234, L19_241 = L14_236(L15_237)
      L4_226 = L19_241
      L7_229 = L18_240
      L6_228 = L17_239
      L5_227 = L16_238
      L9_231 = L15_237
      L3_225 = L14_236
    end
  end
  L14_236 = db
  L14_236 = L14_236.getAttribute
  L15_237 = _UPVALUE5_
  L16_238 = _UPVALUE6_
  L16_238 = L16_238.dmz_interface
  L17_239 = _UPVALUE7_
  L18_240 = _UPVALUE6_
  L18_240 = L18_240.dmz_ip
  L14_236 = L14_236(L15_237, L16_238, L17_239, L18_240)
  L15_237 = db
  L15_237 = L15_237.getAttribute
  L16_238 = _UPVALUE5_
  L17_239 = _UPVALUE6_
  L17_239 = L17_239.dmz_interface
  L18_240 = _UPVALUE7_
  L19_241 = _UPVALUE6_
  L19_241 = L19_241.dmz_netmask
  L15_237 = L15_237(L16_238, L17_239, L18_240, L19_241)
  L16_238 = _UPVALUE2_
  L16_238 = L16_238.NIL
  if L14_236 ~= L16_238 then
    L16_238 = _UPVALUE8_
    if L14_236 ~= L16_238 then
      L16_238 = _UPVALUE2_
      L16_238 = L16_238.NIL
      if L15_237 ~= L16_238 then
        L16_238 = _UPVALUE8_
        if L15_237 ~= L16_238 then
          L16_238 = _UPVALUE4_
          L16_238 = L16_238.ipv4DualMaskCheck
          L17_239 = L14_236
          L18_240 = L15_237
          L19_241 = A1_223
          L16_238 = L16_238(L17_239, L18_240, L19_241, A2_224)
          L3_225 = L16_238
          L16_238 = _UPVALUE2_
          L16_238 = L16_238.SUCCESS
          if L3_225 == L16_238 then
            L16_238 = _UPVALUE3_
            L16_238 = L16_238.SAME_SUBNET_DMZ
            return L16_238
          end
        end
      end
    end
  end
  L16_238 = UNIT_NAME
  if L16_238 ~= "DSR-1000N" then
    L16_238 = UNIT_NAME
    if L16_238 ~= "DSR-1000" then
      L16_238 = UNIT_NAME
      if L16_238 ~= "DSR-500N" then
        L16_238 = UNIT_NAME
        if L16_238 ~= "DSR-500" then
          L16_238 = PRODUCT_ID
          if L16_238 ~= "DSR-1000AC_Ax" then
            L16_238 = PRODUCT_ID
            if L16_238 ~= "DSR-500AC_Ax" then
              L16_238 = PRODUCT_ID
              if L16_238 ~= "DSR-1000_Bx" then
                L16_238 = PRODUCT_ID
              end
            end
          end
        end
      end
    end
  elseif L16_238 == "DSR-500_Bx" then
    L16_238 = _UPVALUE4_
    L16_238 = L16_238.checkOpenVpnSubnetRange
    L17_239 = A1_223
    L18_240 = A2_224
    L16_238 = L16_238(L17_239, L18_240)
    L3_225 = L16_238
    L16_238 = _UPVALUE2_
    L16_238 = L16_238.SUCCESS
    if L3_225 == L16_238 then
      L16_238 = _UPVALUE2_
      L16_238 = L16_238.OPENVPN_ALREADY_CONFIGURED
      return L16_238
    end
  end
  L16_238 = _UPVALUE4_
  L16_238 = L16_238.ipv4DualMaskCheck
  L17_239 = _UPVALUE9_
  L18_240 = _UPVALUE10_
  L19_241 = A1_223
  L16_238 = L16_238(L17_239, L18_240, L19_241, A2_224)
  L3_225 = L16_238
  L16_238 = _UPVALUE2_
  L16_238 = L16_238.SUCCESS
  if L3_225 == L16_238 then
    L16_238 = _UPVALUE3_
    L16_238 = L16_238.SAME_SUBNET_LOCAL_IP
    return L16_238
  end
  L16_238 = db
  L16_238 = L16_238.getAttribute
  L17_239 = _UPVALUE11_
  L18_240 = _UPVALUE12_
  L19_241 = "1"
  L16_238 = L16_238(L17_239, L18_240, L19_241, _UPVALUE6_.ipsec_startIPAddress)
  L17_239 = db
  L17_239 = L17_239.getAttribute
  L18_240 = _UPVALUE11_
  L19_241 = _UPVALUE12_
  L17_239 = L17_239(L18_240, L19_241, "1", _UPVALUE6_.ipsec_subnetMask)
  L18_240 = _UPVALUE2_
  L18_240 = L18_240.NIL
  if L16_238 ~= L18_240 then
    L18_240 = _UPVALUE8_
    if L16_238 ~= L18_240 then
      L18_240 = _UPVALUE2_
      L18_240 = L18_240.NIL
      if L17_239 ~= L18_240 then
        L18_240 = _UPVALUE8_
        if L17_239 ~= L18_240 then
          L18_240 = _UPVALUE4_
          L18_240 = L18_240.ipv4DualMaskCheck
          L19_241 = L16_238
          L18_240 = L18_240(L19_241, L17_239, A1_223, A2_224)
          L3_225 = L18_240
          L18_240 = _UPVALUE2_
          L18_240 = L18_240.SUCCESS
          if L3_225 == L18_240 then
            L18_240 = _UPVALUE3_
            L18_240 = L18_240.SAME_SUBNET_IPSEC
            return L18_240
          end
        end
      end
    end
  end
  L18_240 = _UPVALUE13_
  if A0_222 == L18_240 then
    L18_240 = db
    L18_240 = L18_240.getAttributeWhere
    L19_241 = _UPVALUE14_
    L18_240 = L18_240(L19_241, _UPVALUE6_.interfaceName .. " = '" .. _UPVALUE15_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE16_, _UPVALUE6_.wan_ipAddress)
    L19_241 = db
    L19_241 = L19_241.getAttributeWhere
    L19_241 = L19_241(_UPVALUE14_, _UPVALUE6_.interfaceName .. " = '" .. _UPVALUE15_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE16_, _UPVALUE6_.wan_subnet)
    if L18_240 ~= _UPVALUE2_.NIL and L18_240 ~= _UPVALUE8_ and L19_241 ~= _UPVALUE2_.NIL and L19_241 ~= _UPVALUE8_ then
      L3_225 = _UPVALUE4_.ipv4DualMaskCheck(L18_240, L19_241, A1_223, A2_224)
      if L3_225 == _UPVALUE2_.SUCCESS then
        return _UPVALUE3_.SAME_SUBNET_WAN2
      end
    end
  end
  L18_240 = _UPVALUE15_
  if A0_222 == L18_240 then
    L18_240 = db
    L18_240 = L18_240.getAttributeWhere
    L19_241 = _UPVALUE14_
    L18_240 = L18_240(L19_241, _UPVALUE6_.interfaceName .. " = '" .. _UPVALUE13_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE16_, _UPVALUE6_.wan_ipAddress)
    L19_241 = db
    L19_241 = L19_241.getAttributeWhere
    L19_241 = L19_241(_UPVALUE14_, _UPVALUE6_.interfaceName .. " = '" .. _UPVALUE13_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE16_, _UPVALUE6_.wan_subnet)
    if L18_240 ~= _UPVALUE2_.NIL and L18_240 ~= _UPVALUE8_ and L19_241 ~= _UPVALUE2_.NIL and L19_241 ~= _UPVALUE8_ then
      L3_225 = _UPVALUE4_.ipv4DualMaskCheck(L18_240, L19_241, A1_223, A2_224)
      if L3_225 == _UPVALUE2_.SUCCESS then
        return _UPVALUE3_.SAME_SUBNET_WAN1
      end
    end
  end
  L18_240 = _UPVALUE2_
  L18_240 = L18_240.SUCCESS
  return L18_240
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
