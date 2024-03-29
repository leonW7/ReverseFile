local L0_0
L0_0 = module
L0_0("com.teamf1.core.wan.ipaliasing", package.seeall)
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
L0_0("teamf1lualib/wan_client")
L0_0 = require
L0_0("teamf1lualib/wan_multiwan")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).wanPort = "LogicalIfName"
;({}).ipAddress = "IPAddress"
;({}).subnetMask = "SubnetMask"
;({}).phyIfName = "PhyIfName"
;({}).vitualInterface = "VirtualIfName"
;({}).ruletype = "RuleType"
;({}).action = "Action"
;({}).destinationPublicInterface = "DestinationPublicInterface"
;({}).destinationPublicAddress = "DestinationPublicAddress"
;({}).SNATAddressType = "SNATAddressType"
;({}).SNATAddress = "SNATAddress"
;({}).ServerIp = "ServerIp"
function wanPortGet()
  local L0_1, L1_2
  L1_2 = db
  L1_2 = L1_2.getNextRowId
  L1_2 = L1_2(_UPVALUE0_, _UPVALUE1_)
  L0_1 = L1_2
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
  return _UPVALUE2_.SUCCESS, 1, L1_2
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
  local L2_8
  L2_8 = _UPVALUE0_
  L2_8 = L2_8.NIL
  if A0_6 == L2_8 then
    L2_8 = _UPVALUE0_
    L2_8 = L2_8.INVALID_ARGUMENT
    return L2_8
  end
  L2_8 = tonumber
  L2_8 = L2_8(A0_6)
  if L2_8 == _UPVALUE0_.NIL then
    L2_8 = _UPVALUE0_
    L2_8 = L2_8.INVALID_ARGUMENT
    return L2_8
  end
  L2_8 = db
  L2_8 = L2_8.existsRow
  L2_8 = L2_8(_UPVALUE1_, _UPVALUE2_, A0_6)
  if L2_8 == _UPVALUE0_.FALSE then
    L2_8 = _UPVALUE0_
    L2_8 = L2_8.NOT_EXIST
    return L2_8
  end
  L2_8 = _UPVALUE0_
  L2_8 = L2_8.NIL
  if A1_7 == L2_8 then
    L2_8 = _UPVALUE0_
    L2_8 = L2_8.INVALID_ARGUMENT
    return L2_8
  end
  L2_8 = _UPVALUE3_
  if A1_7 ~= L2_8 then
    L2_8 = _UPVALUE4_
    if A1_7 ~= L2_8 then
      L2_8 = _UPVALUE0_
      L2_8 = L2_8.INVALID_ARGUMENT
      return L2_8
    end
  end
  L2_8 = nil
  L2_8 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_6, _UPVALUE5_.wanPort, A1_7)
  if L2_8 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_6
  end
  return _UPVALUE0_.SUCCESS, A0_6
end
function ipAddressGet()
  local L0_9, L1_10
  L1_10 = db
  L1_10 = L1_10.getNextRowId
  L1_10 = L1_10(_UPVALUE0_, _UPVALUE1_)
  L0_9 = L1_10
  L1_10 = _UPVALUE2_
  L1_10 = L1_10.NIL
  if L0_9 == L1_10 then
    L1_10 = _UPVALUE2_
    L1_10 = L1_10.NOT_EXIST
    return L1_10
  end
  L1_10 = db
  L1_10 = L1_10.getAttribute
  L1_10 = L1_10(_UPVALUE1_, _UPVALUE3_, L0_9, _UPVALUE4_.ipAddress)
  if L1_10 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L1_10
end
function ipAddressGetNext(A0_11)
  local L1_12, L2_13
  L1_12 = _UPVALUE0_
  L1_12 = L1_12.NIL
  if A0_11 == L1_12 then
    L1_12 = _UPVALUE0_
    L1_12 = L1_12.INVALID_ARGUMENT
    return L1_12
  end
  L1_12 = tonumber
  L2_13 = A0_11
  L1_12 = L1_12(L2_13)
  L2_13 = _UPVALUE0_
  L2_13 = L2_13.NIL
  if L1_12 == L2_13 then
    L1_12 = _UPVALUE0_
    L1_12 = L1_12.INVALID_ARGUMENT
    return L1_12
  end
  L1_12 = db
  L1_12 = L1_12.existsRow
  L2_13 = _UPVALUE1_
  L1_12 = L1_12(L2_13, _UPVALUE2_, A0_11)
  L2_13 = _UPVALUE0_
  L2_13 = L2_13.FALSE
  if L1_12 == L2_13 then
    L1_12 = _UPVALUE0_
    L1_12 = L1_12.NOT_EXIST
    return L1_12
  end
  L1_12 = nil
  L2_13 = db
  L2_13 = L2_13.getNextRowId
  L2_13 = L2_13(A0_11, _UPVALUE1_)
  L1_12 = L2_13
  L2_13 = _UPVALUE0_
  L2_13 = L2_13.NIL
  if L1_12 == L2_13 then
    L2_13 = _UPVALUE0_
    L2_13 = L2_13.NOT_EXIST
    return L2_13
  end
  L2_13 = db
  L2_13 = L2_13.getAttribute
  L2_13 = L2_13(_UPVALUE1_, _UPVALUE2_, L1_12, _UPVALUE3_.ipAddress)
  if L2_13 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_12
  end
  return _UPVALUE0_.SUCCESS, L1_12, L2_13
end
function ipAddressSet(A0_14, A1_15)
  local L2_16
  L2_16 = _UPVALUE0_
  L2_16 = L2_16.NIL
  if A0_14 == L2_16 then
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.INVALID_ARGUMENT
    return L2_16
  end
  L2_16 = tonumber
  L2_16 = L2_16(A0_14)
  if L2_16 == _UPVALUE0_.NIL then
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.INVALID_ARGUMENT
    return L2_16
  end
  L2_16 = db
  L2_16 = L2_16.existsRow
  L2_16 = L2_16(_UPVALUE1_, _UPVALUE2_, A0_14)
  if L2_16 == _UPVALUE0_.FALSE then
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.NOT_EXIST
    return L2_16
  end
  L2_16 = _UPVALUE0_
  L2_16 = L2_16.NIL
  if A1_15 == L2_16 then
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.INVALID_ARGUMENT
    return L2_16
  end
  L2_16 = _UPVALUE3_
  L2_16 = L2_16.ipv4Check
  L2_16 = L2_16(A1_15)
  valid = L2_16
  L2_16 = valid
  if L2_16 ~= _UPVALUE0_.SUCCESS then
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.INVALID_ARGUMENT
    return L2_16
  end
  L2_16 = nil
  L2_16 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_14, _UPVALUE4_.ipAddress, A1_15)
  if L2_16 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_14
  end
  return _UPVALUE0_.SUCCESS, A0_14
end
function subnetMaskGet()
  local L0_17, L1_18
  L1_18 = db
  L1_18 = L1_18.getNextRowId
  L1_18 = L1_18(_UPVALUE0_, _UPVALUE1_)
  L0_17 = L1_18
  L1_18 = _UPVALUE2_
  L1_18 = L1_18.NIL
  if L0_17 == L1_18 then
    L1_18 = _UPVALUE2_
    L1_18 = L1_18.NOT_EXIST
    return L1_18
  end
  L1_18 = db
  L1_18 = L1_18.getAttribute
  L1_18 = L1_18(_UPVALUE1_, _UPVALUE3_, L0_17, _UPVALUE4_.subnetMask)
  if L1_18 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L1_18
end
function subnetMaskGetNext(A0_19)
  local L1_20, L2_21
  L1_20 = _UPVALUE0_
  L1_20 = L1_20.NIL
  if A0_19 == L1_20 then
    L1_20 = _UPVALUE0_
    L1_20 = L1_20.INVALID_ARGUMENT
    return L1_20
  end
  L1_20 = tonumber
  L2_21 = A0_19
  L1_20 = L1_20(L2_21)
  L2_21 = _UPVALUE0_
  L2_21 = L2_21.NIL
  if L1_20 == L2_21 then
    L1_20 = _UPVALUE0_
    L1_20 = L1_20.INVALID_ARGUMENT
    return L1_20
  end
  L1_20 = db
  L1_20 = L1_20.existsRow
  L2_21 = _UPVALUE1_
  L1_20 = L1_20(L2_21, _UPVALUE2_, A0_19)
  L2_21 = _UPVALUE0_
  L2_21 = L2_21.FALSE
  if L1_20 == L2_21 then
    L1_20 = _UPVALUE0_
    L1_20 = L1_20.NOT_EXIST
    return L1_20
  end
  L1_20 = nil
  L2_21 = db
  L2_21 = L2_21.getNextRowId
  L2_21 = L2_21(A0_19, _UPVALUE1_)
  L1_20 = L2_21
  L2_21 = _UPVALUE0_
  L2_21 = L2_21.NIL
  if L1_20 == L2_21 then
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.NOT_EXIST
    return L2_21
  end
  L2_21 = db
  L2_21 = L2_21.getAttribute
  L2_21 = L2_21(_UPVALUE1_, _UPVALUE2_, L1_20, _UPVALUE3_.subnetMask)
  if L2_21 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_20
  end
  return _UPVALUE0_.SUCCESS, L1_20, L2_21
end
function subnetMaskSet(A0_22, A1_23)
  local L2_24
  L2_24 = _UPVALUE0_
  L2_24 = L2_24.NIL
  if A0_22 == L2_24 then
    L2_24 = _UPVALUE0_
    L2_24 = L2_24.INVALID_ARGUMENT
    return L2_24
  end
  L2_24 = tonumber
  L2_24 = L2_24(A0_22)
  if L2_24 == _UPVALUE0_.NIL then
    L2_24 = _UPVALUE0_
    L2_24 = L2_24.INVALID_ARGUMENT
    return L2_24
  end
  L2_24 = db
  L2_24 = L2_24.existsRow
  L2_24 = L2_24(_UPVALUE1_, _UPVALUE2_, A0_22)
  if L2_24 == _UPVALUE0_.FALSE then
    L2_24 = _UPVALUE0_
    L2_24 = L2_24.NOT_EXIST
    return L2_24
  end
  L2_24 = _UPVALUE0_
  L2_24 = L2_24.NIL
  if A1_23 == L2_24 then
    L2_24 = _UPVALUE0_
    L2_24 = L2_24.INVALID_ARGUMENT
    return L2_24
  end
  L2_24 = _UPVALUE3_
  L2_24 = L2_24.ipv4Check
  L2_24 = L2_24(A1_23)
  valid = L2_24
  L2_24 = valid
  if L2_24 ~= _UPVALUE0_.SUCCESS then
    L2_24 = _UPVALUE0_
    L2_24 = L2_24.INVALID_ARGUMENT
    return L2_24
  end
  L2_24 = nil
  L2_24 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_22, _UPVALUE4_.subnetMask, A1_23)
  if L2_24 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_22
  end
  return _UPVALUE0_.SUCCESS, A0_22
end
function aliasGet()
  local L0_25, L1_26, L2_27, L3_28, L4_29
  L1_26 = db
  L1_26 = L1_26.getNextRowId
  L2_27 = _UPVALUE0_
  L3_28 = _UPVALUE1_
  L1_26 = L1_26(L2_27, L3_28)
  L0_25 = L1_26
  L1_26 = _UPVALUE2_
  L1_26 = L1_26.NIL
  if L0_25 == L1_26 then
    L1_26 = _UPVALUE2_
    L1_26 = L1_26.NOT_EXIST
    return L1_26
  end
  L1_26 = {}
  L2_27 = db
  L2_27 = L2_27.getRow
  L3_28 = _UPVALUE1_
  L4_29 = _UPVALUE3_
  L2_27 = L2_27(L3_28, L4_29, L0_25)
  L1_26 = L2_27
  L2_27 = _UPVALUE2_
  L2_27 = L2_27.NIL
  if L1_26 == L2_27 then
    L2_27 = _UPVALUE2_
    L2_27 = L2_27.FAILURE
    return L2_27
  end
  L2_27 = _UPVALUE1_
  L3_28 = "."
  L4_29 = _UPVALUE4_
  L4_29 = L4_29.wanPort
  L2_27 = L2_27 .. L3_28 .. L4_29
  L2_27 = L1_26[L2_27]
  L3_28 = _UPVALUE1_
  L4_29 = "."
  L3_28 = L3_28 .. L4_29 .. _UPVALUE4_.ipAddress
  L3_28 = L1_26[L3_28]
  L4_29 = _UPVALUE1_
  L4_29 = L4_29 .. "." .. _UPVALUE4_.subnetMask
  L4_29 = L1_26[L4_29]
  return _UPVALUE2_.SUCCESS, L0_25, L2_27, L3_28, L4_29
end
function aliasGetNext(A0_30)
  local L1_31, L2_32, L3_33, L4_34, L5_35
  L1_31 = _UPVALUE0_
  L1_31 = L1_31.NIL
  if A0_30 == L1_31 then
    L1_31 = _UPVALUE0_
    L1_31 = L1_31.INVALID_ARGUMENT
    return L1_31
  end
  L1_31 = tonumber
  L2_32 = A0_30
  L1_31 = L1_31(L2_32)
  L2_32 = _UPVALUE0_
  L2_32 = L2_32.NIL
  if L1_31 == L2_32 then
    L1_31 = _UPVALUE0_
    L1_31 = L1_31.INVALID_ARGUMENT
    return L1_31
  end
  L1_31 = db
  L1_31 = L1_31.existsRow
  L2_32 = _UPVALUE1_
  L3_33 = _UPVALUE2_
  L4_34 = A0_30
  L1_31 = L1_31(L2_32, L3_33, L4_34)
  L2_32 = _UPVALUE0_
  L2_32 = L2_32.FALSE
  if L1_31 == L2_32 then
    L1_31 = _UPVALUE0_
    L1_31 = L1_31.NOT_EXIST
    return L1_31
  end
  L1_31 = nil
  L2_32 = db
  L2_32 = L2_32.getNextRowId
  L3_33 = A0_30
  L4_34 = _UPVALUE1_
  L2_32 = L2_32(L3_33, L4_34)
  L1_31 = L2_32
  L2_32 = _UPVALUE0_
  L2_32 = L2_32.NIL
  if L1_31 == L2_32 then
    L2_32 = _UPVALUE0_
    L2_32 = L2_32.NOT_EXIST
    return L2_32
  end
  L2_32 = {}
  L3_33 = db
  L3_33 = L3_33.getRow
  L4_34 = _UPVALUE1_
  L5_35 = _UPVALUE2_
  L3_33 = L3_33(L4_34, L5_35, L1_31)
  L2_32 = L3_33
  L3_33 = _UPVALUE0_
  L3_33 = L3_33.NIL
  if L2_32 == L3_33 then
    L3_33 = _UPVALUE0_
    L3_33 = L3_33.FAILURE
    L4_34 = A0_30
    return L3_33, L4_34
  end
  L3_33 = _UPVALUE1_
  L4_34 = "."
  L5_35 = _UPVALUE3_
  L5_35 = L5_35.wanPort
  L3_33 = L3_33 .. L4_34 .. L5_35
  L3_33 = L2_32[L3_33]
  L4_34 = _UPVALUE1_
  L5_35 = "."
  L4_34 = L4_34 .. L5_35 .. _UPVALUE3_.ipAddress
  L4_34 = L2_32[L4_34]
  L5_35 = _UPVALUE1_
  L5_35 = L5_35 .. "." .. _UPVALUE3_.subnetMask
  L5_35 = L2_32[L5_35]
  return _UPVALUE0_.SUCCESS, L1_31, L3_33, L4_34, L5_35
end
function aliasGetAll()
  local L0_36
  L0_36 = {}
  L0_36 = db.getTable(_UPVALUE0_, false)
  if L0_36 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_36
end
function aliasSet(A0_37, A1_38, A2_39, A3_40)
  local L4_41, L5_42, L6_43, L7_44, L8_45, L9_46, L10_47, L11_48
  L4_41 = _UPVALUE0_
  L4_41 = L4_41.NIL
  if A0_37 == L4_41 then
    L4_41 = _UPVALUE0_
    L4_41 = L4_41.INVALID_ARGUMENT
    return L4_41
  end
  L4_41 = tonumber
  L5_42 = A0_37
  L4_41 = L4_41(L5_42)
  L5_42 = _UPVALUE0_
  L5_42 = L5_42.NIL
  if L4_41 == L5_42 then
    L4_41 = _UPVALUE0_
    L4_41 = L4_41.INVALID_ARGUMENT
    return L4_41
  end
  L4_41 = db
  L4_41 = L4_41.existsRow
  L5_42 = _UPVALUE1_
  L6_43 = _UPVALUE2_
  L7_44 = A0_37
  L4_41 = L4_41(L5_42, L6_43, L7_44)
  L5_42 = _UPVALUE0_
  L5_42 = L5_42.FALSE
  if L4_41 == L5_42 then
    L4_41 = _UPVALUE0_
    L4_41 = L4_41.NOT_EXIST
    return L4_41
  end
  L4_41 = {}
  L5_42 = _UPVALUE0_
  L5_42 = L5_42.NIL
  if A1_38 == L5_42 then
    L5_42 = _UPVALUE0_
    L5_42 = L5_42.INVALID_ARGUMENT
    return L5_42
  end
  L5_42 = _UPVALUE3_
  if A1_38 ~= L5_42 then
    L5_42 = _UPVALUE4_
    if A1_38 ~= L5_42 then
      L5_42 = _UPVALUE0_
      L5_42 = L5_42.INVALID_ARGUMENT
      return L5_42
    end
  end
  L5_42 = _UPVALUE1_
  L6_43 = "."
  L7_44 = _UPVALUE5_
  L7_44 = L7_44.wanPort
  L5_42 = L5_42 .. L6_43 .. L7_44
  L4_41[L5_42] = A1_38
  L5_42 = _UPVALUE0_
  L5_42 = L5_42.NIL
  if A2_39 == L5_42 then
    L5_42 = _UPVALUE0_
    L5_42 = L5_42.INVALID_ARGUMENT
    return L5_42
  end
  L5_42 = _UPVALUE6_
  L5_42 = L5_42.ipv4Check
  L6_43 = A2_39
  L5_42 = L5_42(L6_43)
  valid = L5_42
  L5_42 = valid
  L6_43 = _UPVALUE0_
  L6_43 = L6_43.SUCCESS
  if L5_42 ~= L6_43 then
    L5_42 = _UPVALUE7_
    L5_42 = L5_42.ALIAS_INVALID_IP
    return L5_42
  end
  L5_42 = _UPVALUE1_
  L6_43 = "."
  L7_44 = _UPVALUE5_
  L7_44 = L7_44.ipAddress
  L5_42 = L5_42 .. L6_43 .. L7_44
  L4_41[L5_42] = A2_39
  L5_42 = _UPVALUE0_
  L5_42 = L5_42.NIL
  if A3_40 == L5_42 then
    L5_42 = _UPVALUE0_
    L5_42 = L5_42.INVALID_ARGUMENT
    return L5_42
  end
  L5_42 = _UPVALUE6_
  L5_42 = L5_42.ipv4Check
  L6_43 = A3_40
  L5_42 = L5_42(L6_43)
  valid = L5_42
  L5_42 = valid
  L6_43 = _UPVALUE0_
  L6_43 = L6_43.SUCCESS
  if L5_42 ~= L6_43 then
    L5_42 = _UPVALUE7_
    L5_42 = L5_42.ALIAS_INVALID_NETMASK
    return L5_42
  end
  L5_42 = _UPVALUE1_
  L6_43 = "."
  L7_44 = _UPVALUE5_
  L7_44 = L7_44.subnetMask
  L5_42 = L5_42 .. L6_43 .. L7_44
  L4_41[L5_42] = A3_40
  L5_42 = _UPVALUE1_
  L6_43 = "."
  L7_44 = _UPVALUE5_
  L7_44 = L7_44.phyIfName
  L5_42 = L5_42 .. L6_43 .. L7_44
  L6_43 = db
  L6_43 = L6_43.getAttribute
  L7_44 = _UPVALUE8_
  L8_45 = _UPVALUE5_
  L8_45 = L8_45.wanPort
  L9_46 = A1_38
  L10_47 = _UPVALUE5_
  L10_47 = L10_47.vitualInterface
  L6_43 = L6_43(L7_44, L8_45, L9_46, L10_47)
  L4_41[L5_42] = L6_43
  L5_42 = subnetCheck
  L6_43 = A1_38
  L7_44 = A2_39
  L8_45 = A3_40
  L5_42 = L5_42(L6_43, L7_44, L8_45)
  valid = L5_42
  L5_42 = valid
  L6_43 = _UPVALUE0_
  L6_43 = L6_43.SUCCESS
  if L5_42 ~= L6_43 then
    L5_42 = valid
    return L5_42
  end
  L5_42 = db
  L5_42 = L5_42.getAttribute
  L6_43 = _UPVALUE1_
  L7_44 = _UPVALUE2_
  L8_45 = A0_37
  L9_46 = _UPVALUE5_
  L9_46 = L9_46.ipAddress
  L5_42 = L5_42(L6_43, L7_44, L8_45, L9_46)
  L6_43 = _UPVALUE5_
  L6_43 = L6_43.ruletype
  L7_44 = " = '"
  L8_45 = _UPVALUE9_
  L9_46 = "' and "
  L10_47 = _UPVALUE5_
  L10_47 = L10_47.action
  L11_48 = " != '"
  L6_43 = L6_43 .. L7_44 .. L8_45 .. L9_46 .. L10_47 .. L11_48 .. _UPVALUE10_ .. "' and " .. _UPVALUE5_.SNATAddressType .. " != 7 and " .. _UPVALUE5_.SNATAddress .. " ='" .. L5_42 .. "'"
  L7_44 = db
  L7_44 = L7_44.existsRowWhere
  L8_45 = _UPVALUE11_
  L9_46 = L6_43
  L7_44 = L7_44(L8_45, L9_46)
  L8_45 = _UPVALUE5_
  L8_45 = L8_45.ruletype
  L9_46 = " = '"
  L10_47 = _UPVALUE12_
  L11_48 = "' and "
  L8_45 = L8_45 .. L9_46 .. L10_47 .. L11_48 .. _UPVALUE5_.destinationPublicInterface .. " != '" .. _UPVALUE3_ .. "' and " .. _UPVALUE5_.destinationPublicInterface .. " != '" .. _UPVALUE4_ .. "' and " .. _UPVALUE5_.destinationPublicAddress .. " ='" .. L5_42 .. "'"
  L9_46 = db
  L9_46 = L9_46.existsRowWhere
  L10_47 = _UPVALUE11_
  L11_48 = L8_45
  L9_46 = L9_46(L10_47, L11_48)
  if L7_44 or L9_46 then
    L10_47 = _UPVALUE7_
    L10_47 = L10_47.ALIAS_IPADDR_IN_USE
    return L10_47
  end
  L10_47 = db
  L10_47 = L10_47.getAttribute
  L11_48 = _UPVALUE1_
  L10_47 = L10_47(L11_48, _UPVALUE2_, A0_37, _UPVALUE5_.wanPort)
  if L10_47 ~= A1_38 then
    L11_48 = db
    L11_48 = L11_48.getRowsWhere
    L11_48 = L11_48(_UPVALUE1_, _UPVALUE5_.wanPort .. " = '" .. A1_38 .. "'")
    if #L11_48 >= _UPVALUE13_ then
      return _UPVALUE7_.MAX_ALIASES_CONFIGURED
    end
  end
  L11_48 = nil
  L11_48 = db.update(_UPVALUE1_, L4_41, A0_37)
  if L11_48 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_37
  end
  return _UPVALUE0_.SUCCESS, A0_37
end
function aliasCreate(A0_49, A1_50, A2_51)
  local L3_52, L4_53, L5_54, L6_55
  L3_52 = {}
  L4_53 = _UPVALUE0_
  L4_53 = L4_53.NIL
  if A0_49 == L4_53 then
    L4_53 = _UPVALUE0_
    L4_53 = L4_53.INVALID_ARGUMENT
    return L4_53
  end
  L4_53 = _UPVALUE1_
  if A0_49 ~= L4_53 then
    L4_53 = _UPVALUE2_
    if A0_49 ~= L4_53 then
      L4_53 = _UPVALUE0_
      L4_53 = L4_53.INVALID_ARGUMENT
      return L4_53
    end
  end
  L4_53 = _UPVALUE3_
  L5_54 = "."
  L6_55 = _UPVALUE4_
  L6_55 = L6_55.wanPort
  L4_53 = L4_53 .. L5_54 .. L6_55
  L3_52[L4_53] = A0_49
  L4_53 = _UPVALUE0_
  L4_53 = L4_53.NIL
  if A1_50 == L4_53 then
    L4_53 = _UPVALUE0_
    L4_53 = L4_53.INVALID_ARGUMENT
    return L4_53
  end
  L4_53 = _UPVALUE5_
  L4_53 = L4_53.ipv4Check
  L5_54 = A1_50
  L4_53 = L4_53(L5_54)
  valid = L4_53
  L4_53 = valid
  L5_54 = _UPVALUE0_
  L5_54 = L5_54.SUCCESS
  if L4_53 ~= L5_54 then
    L4_53 = _UPVALUE6_
    L4_53 = L4_53.ALIAS_INVALID_IP
    return L4_53
  end
  L4_53 = _UPVALUE3_
  L5_54 = "."
  L6_55 = _UPVALUE4_
  L6_55 = L6_55.ipAddress
  L4_53 = L4_53 .. L5_54 .. L6_55
  L3_52[L4_53] = A1_50
  L4_53 = _UPVALUE0_
  L4_53 = L4_53.NIL
  if A2_51 == L4_53 then
    L4_53 = _UPVALUE0_
    L4_53 = L4_53.INVALID_ARGUMENT
    return L4_53
  end
  L4_53 = _UPVALUE5_
  L4_53 = L4_53.ipv4Check
  L5_54 = A2_51
  L4_53 = L4_53(L5_54)
  valid = L4_53
  L4_53 = valid
  L5_54 = _UPVALUE0_
  L5_54 = L5_54.SUCCESS
  if L4_53 ~= L5_54 then
    L4_53 = _UPVALUE6_
    L4_53 = L4_53.ALIAS_INVALID_NETMASK
    return L4_53
  end
  L4_53 = _UPVALUE3_
  L5_54 = "."
  L6_55 = _UPVALUE4_
  L6_55 = L6_55.subnetMask
  L4_53 = L4_53 .. L5_54 .. L6_55
  L3_52[L4_53] = A2_51
  L4_53 = subnetCheck
  L5_54 = A0_49
  L6_55 = A1_50
  L4_53 = L4_53(L5_54, L6_55, A2_51)
  valid = L4_53
  L4_53 = valid
  L5_54 = _UPVALUE0_
  L5_54 = L5_54.SUCCESS
  if L4_53 ~= L5_54 then
    L4_53 = valid
    return L4_53
  end
  L4_53 = _UPVALUE3_
  L5_54 = "."
  L6_55 = _UPVALUE4_
  L6_55 = L6_55.phyIfName
  L4_53 = L4_53 .. L5_54 .. L6_55
  L5_54 = db
  L5_54 = L5_54.getAttribute
  L6_55 = _UPVALUE7_
  L5_54 = L5_54(L6_55, _UPVALUE4_.wanPort, A0_49, _UPVALUE4_.vitualInterface)
  L3_52[L4_53] = L5_54
  L4_53 = db
  L4_53 = L4_53.getRowsWhere
  L5_54 = _UPVALUE3_
  L6_55 = _UPVALUE4_
  L6_55 = L6_55.wanPort
  L6_55 = L6_55 .. " = '" .. A0_49 .. "'"
  L4_53 = L4_53(L5_54, L6_55)
  L5_54 = #L4_53
  L6_55 = _UPVALUE8_
  if L5_54 >= L6_55 then
    L5_54 = _UPVALUE6_
    L5_54 = L5_54.MAX_ALIASES_CONFIGURED
    return L5_54
  end
  L5_54 = nil
  L6_55 = db
  L6_55 = L6_55.insert
  L6_55 = L6_55(_UPVALUE3_, L3_52)
  L5_54 = L6_55
  L6_55 = _UPVALUE0_
  L6_55 = L6_55.NIL
  if L5_54 == L6_55 then
    L6_55 = _UPVALUE0_
    L6_55 = L6_55.FAILURE
    return L6_55
  end
  L6_55 = db
  L6_55 = L6_55.getAttributeWhere
  L6_55 = L6_55(_UPVALUE3_, _UPVALUE4_.wanPort .. " = '" .. A0_49 .. "' AND " .. _UPVALUE4_.ipAddress .. " = '" .. A1_50 .. "'", _UPVALUE9_)
  return _UPVALUE0_.SUCCESS, L6_55
end
function aliasDelete(A0_56)
  local L1_57, L2_58, L3_59, L4_60
  L1_57 = _UPVALUE0_
  L1_57 = L1_57.NIL
  if A0_56 == L1_57 then
    L1_57 = _UPVALUE0_
    L1_57 = L1_57.INVALID_ARGUMENT
    return L1_57
  end
  L1_57 = tonumber
  L2_58 = A0_56
  L1_57 = L1_57(L2_58)
  L2_58 = _UPVALUE0_
  L2_58 = L2_58.NIL
  if L1_57 == L2_58 then
    L1_57 = _UPVALUE0_
    L1_57 = L1_57.INVALID_ARGUMENT
    return L1_57
  end
  L1_57 = db
  L1_57 = L1_57.existsRow
  L2_58 = _UPVALUE1_
  L3_59 = _UPVALUE2_
  L4_60 = A0_56
  L1_57 = L1_57(L2_58, L3_59, L4_60)
  L2_58 = _UPVALUE0_
  L2_58 = L2_58.FALSE
  if L1_57 == L2_58 then
    L1_57 = _UPVALUE0_
    L1_57 = L1_57.NOT_EXIST
    return L1_57
  end
  L1_57 = db
  L1_57 = L1_57.getAttribute
  L2_58 = _UPVALUE1_
  L3_59 = _UPVALUE2_
  L4_60 = A0_56
  L1_57 = L1_57(L2_58, L3_59, L4_60, _UPVALUE3_.ipAddress)
  L2_58 = {}
  L3_59 = _UPVALUE3_
  L3_59 = L3_59.ruletype
  L4_60 = " = '"
  L3_59 = L3_59 .. L4_60 .. _UPVALUE4_ .. "' and " .. _UPVALUE3_.action .. " != '" .. _UPVALUE5_ .. "' and " .. _UPVALUE3_.SNATAddressType .. " != 7 and " .. _UPVALUE3_.SNATAddress .. " ='" .. L1_57 .. "'"
  L4_60 = db
  L4_60 = L4_60.existsRowWhere
  L4_60 = L4_60(_UPVALUE6_, L3_59)
  L2_58 = L4_60
  L4_60 = _UPVALUE3_
  L4_60 = L4_60.ruletype
  L4_60 = L4_60 .. " = '" .. _UPVALUE7_ .. "' and " .. _UPVALUE3_.destinationPublicInterface .. " != '" .. _UPVALUE8_ .. "' and " .. _UPVALUE3_.destinationPublicInterface .. " != '" .. _UPVALUE9_ .. "' and " .. _UPVALUE3_.destinationPublicAddress .. " ='" .. L1_57 .. "'"
  firewallRules1 = db.existsRowWhere(_UPVALUE6_, L4_60)
  if L2_58 or firewallRules1 then
    return _UPVALUE10_.ALIAS_IPADDR_IN_USE
  end
  if db.deleteRow(_UPVALUE1_, _UPVALUE2_, A0_56) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_56
  end
  return _UPVALUE0_.SUCCESS, A0_56
end
function aliasDeleteAll()
  local L0_61, L1_62, L2_63, L3_64, L4_65, L5_66, L6_67, L7_68, L8_69, L9_70, L10_71
  L0_61 = {}
  L1_62 = {}
  L1_62 = L2_63
  if L1_62 == L2_63 then
    return L2_63
  end
  for L5_66, L6_67 in L2_63(L3_64) do
    L7_68 = db
    L7_68 = L7_68.getAttribute
    L8_69 = _UPVALUE0_
    L9_70 = _UPVALUE2_
    L10_71 = L1_62[L5_66]
    L10_71 = L10_71[_UPVALUE2_]
    L7_68 = L7_68(L8_69, L9_70, L10_71, _UPVALUE3_.ipAddress)
    L8_69 = {}
    L9_70 = _UPVALUE3_
    L9_70 = L9_70.ruletype
    L10_71 = " = '"
    L9_70 = L9_70 .. L10_71 .. _UPVALUE4_ .. "' and " .. _UPVALUE3_.action .. " != '" .. _UPVALUE5_ .. "' and " .. _UPVALUE3_.SNATAddressType .. " != 7 and " .. _UPVALUE3_.SNATAddress .. " ='" .. L7_68 .. "'"
    L10_71 = db
    L10_71 = L10_71.existsRowWhere
    L10_71 = L10_71(_UPVALUE6_, L9_70)
    L8_69 = L10_71
    L10_71 = _UPVALUE3_
    L10_71 = L10_71.ruletype
    L10_71 = L10_71 .. " = '" .. _UPVALUE7_ .. "' and " .. _UPVALUE3_.destinationPublicInterface .. " != '" .. _UPVALUE8_ .. "' and " .. _UPVALUE3_.destinationPublicInterface .. " != '" .. _UPVALUE9_ .. "' and " .. _UPVALUE3_.destinationPublicAddress .. " ='" .. L7_68 .. "'"
    firewallRules1 = db.existsRowWhere(_UPVALUE6_, L10_71)
    if L8_69 or firewallRules1 then
      return _UPVALUE10_.ALIAS_IPADDR_IN_USE
    end
  end
  for L5_66, L6_67 in L2_63(L3_64) do
    L7_68 = {}
    L7_68 = L6_67
    L8_69 = db
    L8_69 = L8_69.delete
    L9_70 = _UPVALUE0_
    L10_71 = L7_68
    L8_69 = L8_69(L9_70, L10_71)
    valid = L8_69
    L8_69 = valid
    L9_70 = _UPVALUE1_
    L9_70 = L9_70.FALSE
    if L8_69 == L9_70 then
      L8_69 = _UPVALUE1_
      L8_69 = L8_69.FAILURE
      return L8_69
    end
  end
  return L2_63
end
function aliasGetCur(A0_72)
  local L1_73, L2_74, L3_75, L4_76
  L1_73 = db
  L1_73 = L1_73.getRow
  L2_74 = _UPVALUE0_
  L3_75 = _UPVALUE1_
  L4_76 = A0_72
  L1_73 = L1_73(L2_74, L3_75, L4_76)
  L2_74 = _UPVALUE2_
  L2_74 = L2_74.NIL
  if L1_73 == L2_74 then
    L2_74 = _UPVALUE2_
    L2_74 = L2_74.FAILURE
    return L2_74
  end
  L2_74 = _UPVALUE0_
  L3_75 = "."
  L4_76 = _UPVALUE3_
  L4_76 = L4_76.wanPort
  L2_74 = L2_74 .. L3_75 .. L4_76
  L2_74 = L1_73[L2_74]
  L3_75 = _UPVALUE0_
  L4_76 = "."
  L3_75 = L3_75 .. L4_76 .. _UPVALUE3_.ipAddress
  L3_75 = L1_73[L3_75]
  L4_76 = _UPVALUE0_
  L4_76 = L4_76 .. "." .. _UPVALUE3_.subnetMask
  L4_76 = L1_73[L4_76]
  return _UPVALUE2_.SUCCESS, A0_72, L2_74, L3_75, L4_76
end
function subnetCheck(A0_77, A1_78, A2_79)
  local L3_80, L4_81, L5_82, L6_83, L7_84, L8_85, L9_86, L10_87, L11_88, L12_89, L13_90
  L3_80 = _UPVALUE0_
  if A0_77 == L3_80 then
    L3_80 = 0
    L4_81 = _UPVALUE1_
    L4_81 = L4_81.wanPort
    L5_82 = " = '"
    L4_81 = L4_81 .. L5_82 .. L6_83 .. L7_84
    L5_82 = db
    L5_82 = L5_82.getRowsWhere
    L5_82 = L5_82(L6_83, L7_84)
    for L9_86, L10_87 in L6_83(L7_84) do
      L3_80 = L3_80 + 1
      L11_88 = L5_82[L3_80]
      L12_89 = _UPVALUE3_
      L13_90 = "."
      L12_89 = L12_89 .. L13_90 .. _UPVALUE1_.ipAddress
      L12_89 = L11_88[L12_89]
      L13_90 = _UPVALUE3_
      L13_90 = L13_90 .. "." .. _UPVALUE1_.subnetMask
      L13_90 = L11_88[L13_90]
      if L12_89 ~= _UPVALUE4_.NIL and L12_89 ~= _UPVALUE5_ and L13_90 ~= _UPVALUE4_.NIL and L13_90 ~= _UPVALUE5_ then
        valid = _UPVALUE6_.ipv4IsIPinSameNetwork(L12_89, L13_90, A1_78, A2_79)
        if valid == _UPVALUE4_.SUCCESS then
          return _UPVALUE7_.ALIAS_IN_SAME_SUBNET_WAN1
        end
      end
    end
  end
  L3_80 = _UPVALUE2_
  if A0_77 == L3_80 then
    L3_80 = 0
    L4_81 = _UPVALUE1_
    L4_81 = L4_81.wanPort
    L5_82 = " = '"
    L4_81 = L4_81 .. L5_82 .. L6_83 .. L7_84
    L5_82 = db
    L5_82 = L5_82.getRowsWhere
    L5_82 = L5_82(L6_83, L7_84)
    for L9_86, L10_87 in L6_83(L7_84) do
      L3_80 = L3_80 + 1
      L11_88 = L5_82[L3_80]
      L12_89 = _UPVALUE3_
      L13_90 = "."
      L12_89 = L12_89 .. L13_90 .. _UPVALUE1_.ipAddress
      L12_89 = L11_88[L12_89]
      L13_90 = _UPVALUE3_
      L13_90 = L13_90 .. "." .. _UPVALUE1_.subnetMask
      L13_90 = L11_88[L13_90]
      if L12_89 ~= _UPVALUE4_.NIL and L12_89 ~= _UPVALUE5_ and L13_90 ~= _UPVALUE4_.NIL and L13_90 ~= _UPVALUE5_ then
        valid = _UPVALUE6_.ipv4IsIPinSameNetwork(L12_89, L13_90, A1_78, A2_79)
        if valid == _UPVALUE4_.SUCCESS then
          return _UPVALUE7_.ALIAS_IN_SAME_SUBNET_WAN2
        end
      end
    end
  end
  L3_80, L4_81, L5_82, L9_86, L10_87, L11_88, L12_89 = nil, nil, nil, nil, nil, nil, nil
  L13_90 = _UPVALUE8_
  L10_87, L11_88, L12_89 = _UPVALUE9_.vlanGet(L13_90)
  L4_81 = _UPVALUE9_.vlanGet(L13_90)
  L3_80, L9_86, L5_82 = _UPVALUE9_.vlanGet(L13_90)
  if L3_80 ~= _UPVALUE4_.SUCCESS then
    return _UPVALUE7_.SUBNET_CHECK_FAILED
  end
  L3_80 = _UPVALUE6_.ipv4IsIPinSameNetwork(L4_81, L8_85, A1_78, A2_79)
  if L3_80 == _UPVALUE4_.SUCCESS then
    return _UPVALUE7_.ALIAS_IN_SAME_SUBNET_LAN
  end
  L10_87, L11_88, L12_89 = _UPVALUE9_.vlanGetNext(L9_86)
  L4_81 = _UPVALUE9_.vlanGetNext(L9_86)
  L3_80, L9_86, L5_82 = _UPVALUE9_.vlanGetNext(L9_86)
  while L3_80 ~= _UPVALUE4_.NEXT_ROWID_INVALID do
    if L3_80 ~= _UPVALUE4_.SUCCESS then
      return _UPVALUE7_.SUBNET_CHECK_FAILED
    end
    L3_80 = _UPVALUE6_.ipv4IsIPinSameNetwork(L4_81, L8_85, A1_78, A2_79)
    if L3_80 == _UPVALUE4_.SUCCESS then
      return _UPVALUE7_.ALIAS_IN_SAME_SUBNET_VLAN
    end
    L10_87, L11_88, L12_89 = _UPVALUE9_.vlanGetNext(L9_86)
    L4_81 = _UPVALUE9_.vlanGetNext(L9_86)
    L3_80, L9_86, L5_82 = _UPVALUE9_.vlanGetNext(L9_86)
  end
  returnCode = pppPhysicalIPSubnetCheck(A0_77, A1_78, A2_79)
  if returnCode ~= _UPVALUE4_.SUCCESS then
    return returnCode
  end
  return _UPVALUE4_.SUCCESS
end
function wan1TableGet()
  local L0_91, L1_92
  L0_91 = _UPVALUE0_.wanPort .. " = 'WAN1'"
  L1_92 = db.getRowsWhere(_UPVALUE1_, L0_91)
  return L1_92
end
function wan2TableGet()
  local L0_93, L1_94
  L0_93 = _UPVALUE0_.wanPort .. " = 'WAN2'"
  L1_94 = db.getRowsWhere(_UPVALUE1_, L0_93)
  return L1_94
end
function networkIntrTblGet()
  local L0_95
  L0_95 = "ifType = 'bridge'"
  return (db.getRowsWhere(_UPVALUE0_, L0_95))
end
function ifStaticRowsGet(A0_96)
  return (db.getRowWhere(_UPVALUE0_, A0_96))
end
function pppPhysicalIPSubnetCheck(A0_97, A1_98, A2_99)
  local L3_100, L4_101, L5_102, L6_103, L7_104, L8_105
  if A0_97 == _UPVALUE0_.NIL or A1_98 == _UPVALUE0_.NIL or A2_99 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A0_97 ~= _UPVALUE1_ and A0_97 ~= _UPVALUE2_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L5_102, L6_103, L3_100 = _UPVALUE3_.connectionTypeGet(A0_97, _UPVALUE4_)
  if L5_102 ~= _UPVALUE0_.SUCCESS then
    return L5_102
  end
  if L3_100 == _UPVALUE5_ or L3_100 == _UPVALUE6_ then
    L7_104 = db.getAttributeWhere(L3_100, _UPVALUE7_.wanPort .. " = '" .. A0_97 .. "'", _UPVALUE7_.ServerIp)
    if L7_104 == _UPVALUE0_.NIL then
      return _UPVALUE0_.FAILURE
    end
    L8_105 = _UPVALUE8_.ipv4IsIPinSameNetwork(L7_104, _UPVALUE9_, A1_98, A2_99)
    if L8_105 == _UPVALUE0_.SUCCESS then
      return _UPVALUE10_.ALIAS_IN_SAME_WAN_PPP_SUBNET
    end
  end
  L5_102, L6_103, L4_101 = _UPVALUE11_.multiWanModeGet()
  if L5_102 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  if L4_101 == _UPVALUE12_ then
    return _UPVALUE0_.SUCCESS
  end
  if A0_97 == _UPVALUE1_ then
    L5_102, L6_103, L3_100 = _UPVALUE3_.connectionTypeGet(_UPVALUE2_, _UPVALUE4_)
  else
    L5_102, L6_103, L3_100 = _UPVALUE3_.connectionTypeGet(_UPVALUE1_, _UPVALUE4_)
  end
  if L5_102 ~= _UPVALUE0_.SUCCESS then
    return L5_102
  end
  if L3_100 ~= _UPVALUE5_ and L3_100 ~= _UPVALUE6_ then
    return _UPVALUE0_.SUCCESS
  end
  L7_104 = db.getAttributeWhere(L3_100, _UPVALUE7_.wanPort .. " = '" .. A0_97 .. "'", _UPVALUE7_.ServerIp)
  if L7_104 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L8_105 = _UPVALUE8_.ipv4IsIPinSameNetwork(L7_104, _UPVALUE9_, A1_98, A2_99)
  if L8_105 == _UPVALUE0_.SUCCESS then
    return _UPVALUE10_.ALIAS_IN_SAME_MULTI_WAN_PPP_SUBNET
  end
  return _UPVALUE0_.SUCCESS
end
function ipAliasWANPPPsubnetCheck(A0_106, A1_107, A2_108)
  local L3_109, L4_110, L5_111, L6_112, L7_113
  if A0_106 ~= L7_113 then
  elseif A1_107 == L7_113 then
    return L7_113
  end
  if A2_108 == L7_113 then
    A2_108 = _UPVALUE1_
  end
  if A0_106 ~= L7_113 then
    if A0_106 ~= L7_113 then
      return L7_113
    end
  end
  L4_110, L6_112 = L7_113()
  returnCode = L7_113
  if L7_113 ~= _UPVALUE0_.SUCCESS then
    return L7_113
  end
  if L6_112 == L7_113 then
    L5_111 = db.getTable(_UPVALUE6_, false, L7_113)
  else
    L5_111 = L7_113
  end
  if L5_111 == L7_113 then
    return L7_113
  end
  for _FORV_10_, _FORV_11_ in L7_113(L5_111) do
    valid = _UPVALUE8_.ipv4IsIPinSameNetwork(A1_107, A2_108, _FORV_11_.IPAddress, _FORV_11_.SubnetMask)
    if valid == _UPVALUE0_.SUCCESS then
      return _UPVALUE9_.WAN_PPP_IP_IS_IN_ALIAS_NETWORK
    end
  end
  return L7_113
end
function multiWanModePPPSubnetCheck(A0_114, A1_115)
  local L2_116, L3_117, L4_118, L5_119, L6_120, L7_121, L8_122
  L7_121 = _UPVALUE0_
  L7_121 = L7_121.NIL
  L8_122 = _UPVALUE0_
  L8_122 = L8_122.NIL
  if A0_114 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A0_114 == _UPVALUE1_ then
    if A1_115 == _UPVALUE0_.NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    if A1_115 ~= _UPVALUE2_ and A1_115 ~= _UPVALUE3_ and A1_115 ~= _UPVALUE4_ then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
  else
    A1_115 = _UPVALUE4_
  end
  if A1_115 == _UPVALUE2_ or A0_114 ~= _UPVALUE1_ then
    L2_116, L3_117, L4_118 = _UPVALUE5_.connectionTypeGet(_UPVALUE2_, _UPVALUE6_)
    if L2_116 ~= _UPVALUE0_.SUCCESS then
      return L2_116
    end
    if L4_118 == _UPVALUE7_ or L4_118 == _UPVALUE8_ then
      L7_121 = db.getAttributeWhere(L4_118, _UPVALUE9_.wanPort .. " = '" .. _UPVALUE2_ .. "'", _UPVALUE9_.ServerIp)
      if L7_121 == _UPVALUE0_.NIL then
        return _UPVALUE0_.FAILURE
      end
    end
  end
  if A1_115 == _UPVALUE3_ or A0_114 ~= _UPVALUE1_ then
    L2_116, L3_117, L4_118 = _UPVALUE5_.connectionTypeGet(_UPVALUE3_, _UPVALUE6_)
    if L2_116 ~= _UPVALUE0_.SUCCESS then
      return L2_116
    end
    if L4_118 == _UPVALUE7_ or L4_118 == _UPVALUE8_ then
      L8_122 = db.getAttributeWhere(L4_118, _UPVALUE9_.wanPort .. " = '" .. _UPVALUE3_ .. "'", _UPVALUE9_.ServerIp)
      if L8_122 == _UPVALUE0_.NIL then
        return _UPVALUE0_.FAILURE
      end
    end
  end
  if false then
    return _UPVALUE0_.SUCCESS
  end
  L5_119 = db.getTable(_UPVALUE10_, false)
  if L5_119 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  for _FORV_13_, _FORV_14_ in pairs(L5_119) do
    if L7_121 ~= _UPVALUE0_.NIL then
      L6_120 = _UPVALUE11_.ipv4IsIPinSameNetwork(L7_121, _UPVALUE12_, _FORV_14_.IPAddress, _FORV_14_.SubnetMask)
      if L6_120 == _UPVALUE0_.SUCCESS then
        return _UPVALUE13_.WAN1_PPP_IP_IS_IN_ALIAS_NETWORK
      end
    end
    if L8_122 ~= _UPVALUE0_.NIL then
      L6_120 = _UPVALUE11_.ipv4IsIPinSameNetwork(L8_122, _UPVALUE12_, _FORV_14_.IPAddress, _FORV_14_.SubnetMask)
      if L6_120 == _UPVALUE0_.SUCCESS then
        return _UPVALUE13_.WAN2_PPP_IP_IS_IN_ALIAS_NETWORK
      end
    end
  end
  return _UPVALUE0_.SUCCESS
end
