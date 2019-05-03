local L0_0
L0_0 = module
L0_0("com.teamf1.core.openvpn.server_policy", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/openvpn_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.vpn.openvpn.returnCodes")
server_policyTable = "OpenVpnConfigPolicy"
policyTable = "OpenVpnPolicy"
;({}).feature = "feature"
;({}).policyName = "PolicyName"
;({}).policyType = "PolicyType"
;({}).policyOwnerName = "PolicyOwnerName"
;({}).policyDestinationType = "DestinationObjectType"
;({}).permission = "Permission"
;({}).destination = "DestinationObject"
;({}).IPAddress = "Address"
;({}).maskLength = "MaskLength"
;({}).startPort = "StartPort"
;({}).endPort = "EndPort"
;({}).icmp = "IcmpBlock"
;({}).destinationObject = "DestinationObject"
;({}).accessMgmt = "accessMgmtEnable"
function openvpnPolicyGetCur(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13
  L1_2 = db
  L1_2 = L1_2.getRow
  L2_3 = server_policyTable
  L3_4 = _UPVALUE0_
  L4_5 = A0_1
  L1_2 = L1_2(L2_3, L3_4, L4_5)
  L2_3 = _UPVALUE1_
  L2_3 = L2_3.NIL
  if L1_2 == L2_3 then
    L2_3 = _UPVALUE1_
    L2_3 = L2_3.FAILURE
    return L2_3
  end
  L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L2_3 = L1_2[server_policyTable .. "." .. _UPVALUE2_.policyName]
  L3_4 = L1_2[server_policyTable .. "." .. _UPVALUE2_.policyType]
  L4_5 = L1_2[server_policyTable .. "." .. _UPVALUE2_.policyOwnerName]
  L5_6 = L1_2[server_policyTable .. "." .. _UPVALUE2_.policyDestinationType]
  L6_7 = L1_2[server_policyTable .. "." .. _UPVALUE2_.permission]
  L7_8 = L1_2[server_policyTable .. "." .. _UPVALUE2_.destination]
  L8_9 = L1_2[server_policyTable .. "." .. _UPVALUE2_.IPAddress]
  L9_10 = L1_2[server_policyTable .. "." .. _UPVALUE2_.maskLength]
  L10_11 = L1_2[server_policyTable .. "." .. _UPVALUE2_.startPort]
  L11_12 = L1_2[server_policyTable .. "." .. _UPVALUE2_.endPort]
  L12_13 = L1_2[server_policyTable .. "." .. _UPVALUE2_.icmp]
  return _UPVALUE1_.SUCCESS, A0_1, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13
end
function openvpnPolicyGetAll()
  local L0_14, L1_15, L2_16
  L0_14 = db
  L0_14 = L0_14.getAttribute
  L1_15 = _UPVALUE0_
  L2_16 = _UPVALUE1_
  L0_14 = L0_14(L1_15, L2_16, _UPVALUE2_, _UPVALUE3_.accessMgmt)
  L1_15 = nil
  L2_16 = _UPVALUE4_
  if L0_14 == L2_16 then
    L2_16 = _UPVALUE5_
    L1_15 = L2_16.OPENVPN_REMOTEMANAGEMENT_DISABLED
  else
    L2_16 = _UPVALUE6_
    L1_15 = L2_16.SUCCESS
  end
  L2_16 = {}
  L2_16 = db.getTable(server_policyTable, false)
  if L2_16 == _UPVALUE6_.NIL then
    return _UPVALUE6_.FAILURE
  end
  return L1_15, L2_16
end
function openvpnConfigPolicySet(A0_17, A1_18, A2_19, A3_20, A4_21, A5_22, A6_23, A7_24, A8_25, A9_26, A10_27)
  local L11_28, L12_29
  L11_28 = _UPVALUE0_
  L11_28 = L11_28.NIL
  if A0_17 ~= L11_28 then
    L11_28 = tonumber
    L12_29 = A0_17
    L11_28 = L11_28(L12_29)
    L12_29 = _UPVALUE0_
    L12_29 = L12_29.NIL
  elseif L11_28 == L12_29 then
    L11_28 = _UPVALUE0_
    L11_28 = L11_28.INVALID_ARGUMENT
    return L11_28
  end
  L11_28 = db
  L11_28 = L11_28.existsRow
  L12_29 = server_policyTable
  L11_28 = L11_28(L12_29, _UPVALUE1_, A0_17)
  L12_29 = _UPVALUE0_
  L12_29 = L12_29.FALSE
  if L11_28 == L12_29 then
    L11_28 = _UPVALUE0_
    L11_28 = L11_28.INVALID_ARGUMENT
    return L11_28
  end
  L11_28 = nil
  L12_29 = {}
  if A1_18 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L12_29[server_policyTable .. "." .. _UPVALUE2_.policyName] = A1_18
  if A2_19 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A2_19 ~= _UPVALUE3_ and A2_19 ~= _UPVALUE4_ and A2_19 ~= _UPVALUE5_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L12_29[server_policyTable .. "." .. _UPVALUE2_.policyType] = A2_19
  if A2_19 ~= _UPVALUE3_ then
    if A3_20 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    L12_29[server_policyTable .. "." .. _UPVALUE2_.policyOwnerName] = A3_20
  end
  if A4_21 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A4_21) ~= _UPVALUE6_ and tonumber(A4_21) ~= _UPVALUE7_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L12_29[server_policyTable .. "." .. _UPVALUE2_.policyDestinationType] = A4_21
  if A5_22 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A5_22 ~= _UPVALUE8_ and A5_22 ~= _UPVALUE9_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L12_29[server_policyTable .. "." .. _UPVALUE2_.permission] = A5_22
  if tonumber(A4_21) == _UPVALUE6_ or tonumber(A4_21) == _UPVALUE7_ then
    if A6_23 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    L11_28 = _UPVALUE10_.ipAddressCheck("2", A6_23)
    if L11_28 ~= _UPVALUE0_.SUCCESS then
      return _UPVALUE11_.OPENVPN_POLICYADDRESS_INVALID
    end
    L12_29[server_policyTable .. "." .. _UPVALUE2_.IPAddress] = A6_23
  end
  if tonumber(A4_21) == _UPVALUE7_ then
    if A7_24 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    L12_29[server_policyTable .. "." .. _UPVALUE2_.maskLength] = A7_24
  end
  if A8_25 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A8_25) < _UPVALUE12_ or tonumber(A8_25) > _UPVALUE13_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L12_29[server_policyTable .. "." .. _UPVALUE2_.startPort] = A8_25
  if A9_26 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A9_26) < _UPVALUE12_ or tonumber(A9_26) > _UPVALUE13_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L12_29[server_policyTable .. "." .. _UPVALUE2_.endPort] = A9_26
  if A10_27 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A10_27 ~= _UPVALUE14_ and A10_27 ~= _UPVALUE15_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L12_29[server_policyTable .. "." .. _UPVALUE2_.icmp] = A10_27
  if tonumber(A4_21) == _UPVALUE6_ then
  elseif tonumber(A4_21) == _UPVALUE7_ then
  else
  end
  L12_29[server_policyTable .. "." .. _UPVALUE2_.destinationObject] = resourceName
  if db.update(server_policyTable, L12_29, A0_17) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_17
  end
  return _UPVALUE0_.SUCCESS, A0_17
end
function openvpnPolicySet(A0_30, A1_31, A2_32, A3_33, A4_34, A5_35, A6_36, A7_37, A8_38, A9_39, A10_40)
  local L11_41, L12_42
  L11_41 = "PolicyName = '"
  L12_42 = A1_31
  L11_41 = L11_41 .. L12_42 .. "'"
  condition = L11_41
  L11_41 = db
  L11_41 = L11_41.existsRowWhere
  L12_42 = policyTable
  L11_41 = L11_41(L12_42, condition)
  valid = L11_41
  L11_41 = valid
  if not L11_41 then
    L11_41 = _UPVALUE0_
    L11_41 = L11_41.INVALID_ARGUMENT
    return L11_41
  end
  L11_41 = nil
  L12_42 = {}
  L12_42[policyTable .. "." .. _UPVALUE1_.permission] = A5_35
  L12_42[policyTable .. "." .. _UPVALUE1_.IPAddress] = A6_36
  if val_policyDestinationType == _UPVALUE2_ then
    L12_42[policyTable .. "." .. _UPVALUE1_.maskLength] = A7_37
  end
  L12_42[policyTable .. "." .. _UPVALUE1_.startPort] = A8_38
  L12_42[policyTable .. "." .. _UPVALUE1_.endPort] = A9_39
  L12_42[policyTable .. "." .. _UPVALUE1_.icmp] = A10_40
  if tonumber(A4_34) == _UPVALUE3_ then
  elseif tonumber(A4_34) == _UPVALUE2_ then
  else
  end
  L12_42[policyTable .. "." .. _UPVALUE1_.destinationObject] = resourceName
  if db.update(policyTable, L12_42, A0_30) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_30
  end
  return _UPVALUE0_.SUCCESS, A0_30
end
function openvpnPolicyCreate(A0_43, A1_44, A2_45, A3_46, A4_47, A5_48, A6_49, A7_50, A8_51, A9_52)
  local L10_53, L11_54, L12_55, L13_56, L14_57, L15_58, L16_59, L17_60
  L10_53 = db
  L10_53 = L10_53.existsRow
  L11_54 = server_policyTable
  L12_55 = _UPVALUE0_
  L12_55 = L12_55.policyName
  L13_56 = A0_43
  L10_53 = L10_53(L11_54, L12_55, L13_56)
  L11_54 = _UPVALUE1_
  L11_54 = L11_54.FALSE
  if L10_53 ~= L11_54 then
    L10_53 = _UPVALUE2_
    L10_53 = L10_53.POLICY_ALREADY_EXIST
    return L10_53
  end
  L10_53 = db
  L10_53 = L10_53.existsRow
  L11_54 = server_policyTable
  L12_55 = _UPVALUE0_
  L12_55 = L12_55.policyOwnerName
  L13_56 = A2_45
  L10_53 = L10_53(L11_54, L12_55, L13_56)
  L11_54 = _UPVALUE1_
  L11_54 = L11_54.FALSE
  if L10_53 ~= L11_54 then
    L10_53 = _UPVALUE2_
    L10_53 = L10_53.POLICY_ALREADY_EXIST
    return L10_53
  end
  L10_53 = nil
  L11_54 = {}
  L12_55 = _UPVALUE1_
  L12_55 = L12_55.NIL
  if A0_43 == L12_55 then
    L12_55 = _UPVALUE1_
    L12_55 = L12_55.INVALID_ARGUMENT
    return L12_55
  end
  L12_55 = server_policyTable
  L13_56 = "."
  L14_57 = _UPVALUE0_
  L14_57 = L14_57.policyName
  L12_55 = L12_55 .. L13_56 .. L14_57
  L11_54[L12_55] = A0_43
  L12_55 = _UPVALUE1_
  L12_55 = L12_55.NIL
  if A1_44 == L12_55 then
    L12_55 = _UPVALUE1_
    L12_55 = L12_55.INVALID_ARGUMENT
    return L12_55
  end
  L12_55 = _UPVALUE3_
  if A1_44 ~= L12_55 then
    L12_55 = _UPVALUE4_
    if A1_44 ~= L12_55 then
      L12_55 = _UPVALUE5_
      if A1_44 ~= L12_55 then
        L12_55 = _UPVALUE1_
        L12_55 = L12_55.INVALID_ARGUMENT
        return L12_55
      end
    end
  end
  L12_55 = server_policyTable
  L13_56 = "."
  L14_57 = _UPVALUE0_
  L14_57 = L14_57.policyType
  L12_55 = L12_55 .. L13_56 .. L14_57
  L11_54[L12_55] = A1_44
  L12_55 = _UPVALUE3_
  if A1_44 ~= L12_55 then
    L12_55 = _UPVALUE1_
    L12_55 = L12_55.NIL
    if A2_45 == L12_55 then
      L12_55 = _UPVALUE1_
      L12_55 = L12_55.INVALID_ARGUMENT
      return L12_55
    end
    L12_55 = server_policyTable
    L13_56 = "."
    L14_57 = _UPVALUE0_
    L14_57 = L14_57.policyOwnerName
    L12_55 = L12_55 .. L13_56 .. L14_57
    L11_54[L12_55] = A2_45
  end
  L12_55 = _UPVALUE3_
  if A1_44 == L12_55 then
    L12_55 = server_policyTable
    L13_56 = "."
    L14_57 = _UPVALUE0_
    L14_57 = L14_57.policyOwnerName
    L12_55 = L12_55 .. L13_56 .. L14_57
    L11_54[L12_55] = "global"
  end
  L12_55 = _UPVALUE1_
  L12_55 = L12_55.NIL
  if A3_46 == L12_55 then
    L12_55 = _UPVALUE1_
    L12_55 = L12_55.INVALID_ARGUMENT
    return L12_55
  end
  L12_55 = tonumber
  L13_56 = A3_46
  L12_55 = L12_55(L13_56)
  L13_56 = _UPVALUE6_
  if L12_55 ~= L13_56 then
    L13_56 = _UPVALUE7_
    if L12_55 ~= L13_56 then
      L13_56 = _UPVALUE1_
      L13_56 = L13_56.INVALID_ARGUMENT
      return L13_56
    end
  end
  L13_56 = server_policyTable
  L14_57 = "."
  L15_58 = _UPVALUE0_
  L15_58 = L15_58.policyDestinationType
  L13_56 = L13_56 .. L14_57 .. L15_58
  L11_54[L13_56] = A3_46
  L13_56 = _UPVALUE1_
  L13_56 = L13_56.NIL
  if A4_47 == L13_56 then
    L13_56 = _UPVALUE1_
    L13_56 = L13_56.INVALID_ARGUMENT
    return L13_56
  end
  L13_56 = _UPVALUE8_
  if A4_47 ~= L13_56 then
    L13_56 = _UPVALUE9_
    if A4_47 ~= L13_56 then
      L13_56 = _UPVALUE1_
      L13_56 = L13_56.INVALID_ARGUMENT
      return L13_56
    end
  end
  L13_56 = server_policyTable
  L14_57 = "."
  L15_58 = _UPVALUE0_
  L15_58 = L15_58.permission
  L13_56 = L13_56 .. L14_57 .. L15_58
  L11_54[L13_56] = A4_47
  L13_56 = _UPVALUE6_
  if L12_55 ~= L13_56 then
    L13_56 = _UPVALUE7_
  elseif L12_55 == L13_56 then
    L13_56 = _UPVALUE1_
    L13_56 = L13_56.NIL
    if A5_48 == L13_56 then
      L13_56 = _UPVALUE1_
      L13_56 = L13_56.INVALID_ARGUMENT
      return L13_56
    end
    L13_56 = _UPVALUE10_
    L13_56 = L13_56.ipAddressCheck
    L14_57 = "2"
    L15_58 = A5_48
    L13_56 = L13_56(L14_57, L15_58)
    L10_53 = L13_56
    L13_56 = _UPVALUE1_
    L13_56 = L13_56.SUCCESS
    if L10_53 ~= L13_56 then
      L13_56 = _UPVALUE2_
      L13_56 = L13_56.OPENVPN_POLICYADDRESS_INVALID
      return L13_56
    end
    L13_56 = server_policyTable
    L14_57 = "."
    L15_58 = _UPVALUE0_
    L15_58 = L15_58.IPAddress
    L13_56 = L13_56 .. L14_57 .. L15_58
    L11_54[L13_56] = A5_48
  end
  L13_56 = _UPVALUE7_
  if L12_55 == L13_56 then
    L13_56 = _UPVALUE1_
    L13_56 = L13_56.NIL
    if A6_49 == L13_56 then
      L13_56 = _UPVALUE1_
      L13_56 = L13_56.INVALID_ARGUMENT
      return L13_56
    end
    L13_56 = server_policyTable
    L14_57 = "."
    L15_58 = _UPVALUE0_
    L15_58 = L15_58.maskLength
    L13_56 = L13_56 .. L14_57 .. L15_58
    L11_54[L13_56] = A6_49
  end
  L13_56 = _UPVALUE1_
  L13_56 = L13_56.NIL
  if A7_50 == L13_56 then
    L13_56 = _UPVALUE1_
    L13_56 = L13_56.INVALID_ARGUMENT
    return L13_56
  end
  L13_56 = tonumber
  L14_57 = A7_50
  L13_56 = L13_56(L14_57)
  L14_57 = _UPVALUE11_
  if not (L13_56 < L14_57) then
    L14_57 = _UPVALUE12_
  elseif L13_56 > L14_57 then
    L14_57 = _UPVALUE1_
    L14_57 = L14_57.INVALID_ARGUMENT
    return L14_57
  end
  L14_57 = server_policyTable
  L15_58 = "."
  L16_59 = _UPVALUE0_
  L16_59 = L16_59.startPort
  L14_57 = L14_57 .. L15_58 .. L16_59
  L11_54[L14_57] = A7_50
  L14_57 = _UPVALUE1_
  L14_57 = L14_57.NIL
  if A8_51 == L14_57 then
    L14_57 = _UPVALUE1_
    L14_57 = L14_57.INVALID_ARGUMENT
    return L14_57
  end
  L14_57 = tonumber
  L15_58 = A8_51
  L14_57 = L14_57(L15_58)
  L15_58 = _UPVALUE11_
  if not (L14_57 < L15_58) then
    L15_58 = _UPVALUE12_
  elseif L14_57 > L15_58 then
    L15_58 = _UPVALUE1_
    L15_58 = L15_58.INVALID_ARGUMENT
    return L15_58
  end
  L15_58 = server_policyTable
  L16_59 = "."
  L17_60 = _UPVALUE0_
  L17_60 = L17_60.endPort
  L15_58 = L15_58 .. L16_59 .. L17_60
  L11_54[L15_58] = A8_51
  L15_58 = _UPVALUE1_
  L15_58 = L15_58.NIL
  if A9_52 == L15_58 then
    L15_58 = _UPVALUE1_
    L15_58 = L15_58.INVALID_ARGUMENT
    return L15_58
  end
  L15_58 = _UPVALUE13_
  if A9_52 ~= L15_58 then
    L15_58 = _UPVALUE14_
    if A9_52 ~= L15_58 then
      L15_58 = _UPVALUE1_
      L15_58 = L15_58.INVALID_ARGUMENT
      return L15_58
    end
  end
  L15_58 = server_policyTable
  L16_59 = "."
  L17_60 = _UPVALUE0_
  L17_60 = L17_60.icmp
  L15_58 = L15_58 .. L16_59 .. L17_60
  L11_54[L15_58] = A9_52
  L15_58 = nil
  L16_59 = _UPVALUE6_
  if L12_55 == L16_59 then
    L16_59 = A5_48
    L17_60 = ":"
    L15_58 = L16_59 .. L17_60 .. A7_50 .. "-" .. A8_51
  else
    L16_59 = _UPVALUE7_
    if L12_55 == L16_59 then
      L16_59 = A5_48
      L17_60 = "/"
      L15_58 = L16_59 .. L17_60 .. A6_49 .. ":" .. A7_50 .. "-" .. A8_51
    else
      L15_58 = resourceName
    end
  end
  L16_59 = server_policyTable
  L17_60 = "."
  L16_59 = L16_59 .. L17_60 .. _UPVALUE0_.destinationObject
  L11_54[L16_59] = L15_58
  L16_59 = db
  L16_59 = L16_59.insert
  L17_60 = server_policyTable
  L16_59 = L16_59(L17_60, L11_54)
  L17_60 = _UPVALUE1_
  L17_60 = L17_60.NIL
  if L16_59 == L17_60 then
    L17_60 = _UPVALUE1_
    L17_60 = L17_60.FAILURE
    return L17_60
  end
  L17_60 = db
  L17_60 = L17_60.getAttribute
  L17_60 = L17_60(server_policyTable, _UPVALUE0_.policyName, A0_43, _UPVALUE15_)
  return _UPVALUE1_.SUCCESS, L17_60
end
function openvpnPolicyDelete(A0_61)
  local L1_62, L2_63, L3_64
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
  L3_64 = _UPVALUE1_
  L1_62 = L1_62(L2_63, L3_64, A0_61)
  L2_63 = _UPVALUE0_
  L2_63 = L2_63.FALSE
  if L1_62 == L2_63 then
    L1_62 = _UPVALUE0_
    L1_62 = L1_62.INVALID_ARGUMENT
    return L1_62
  end
  L1_62 = db
  L1_62 = L1_62.getAttribute
  L2_63 = server_policyTable
  L3_64 = _UPVALUE1_
  L1_62 = L1_62(L2_63, L3_64, A0_61, _UPVALUE2_.policyOwnerName)
  L2_63 = db
  L2_63 = L2_63.deleteRow
  L3_64 = server_policyTable
  L2_63 = L2_63(L3_64, _UPVALUE1_, A0_61)
  L3_64 = _UPVALUE0_
  L3_64 = L3_64.NIL
  if L2_63 == L3_64 then
    L3_64 = _UPVALUE0_
    L3_64 = L3_64.FAILURE
    return L3_64, A0_61
  end
  L3_64 = "/var/openvpn/gateway/"
  L3_64 = L3_64 .. L1_62
  if util.fileExists(L3_64) then
    os.execute("rm -rf " .. "/var/openvpn/gateway/" .. L1_62)
  end
  return _UPVALUE0_.SUCCESS, A0_61
end
function openvpnPolicyDeleteAll()
  local L0_65
  L0_65 = {}
  L0_65 = db.deleteAllRows(server_policyTable)
  if not L0_65 then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
