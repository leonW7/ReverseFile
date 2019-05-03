local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vlan_protocolVlan")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
ENABLE = "1"
DISABLE = "0"
protocoList = {
  "IP",
  "IPX",
  "ARP"
}
function featureState()
  local L0_1, L1_2
  L0_1 = _UPVALUE0_
  L0_1 = L0_1.isfeatureEnabled
  L1_2 = L0_1()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2
end
function featureSet(A0_3)
  local L1_4, L2_5
  L1_4 = ACCESS_LEVEL
  if L1_4 ~= 0 then
    L1_4 = util
    L1_4 = L1_4.appendDebugOut
    L2_5 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_4(L2_5)
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.UNAUTHORIZED
    return L1_4
  end
  L1_4 = A0_3["protocolVlan.state"]
  L2_5 = nil
  if L1_4 == ENABLE then
    L2_5 = _UPVALUE1_.featureEnable()
  else
    L2_5 = _UPVALUE1_.featureDisable()
  end
  if L2_5 ~= _UPVALUE0_.SUCCESS then
    return L2_5
  end
  return L2_5
end
function protocolGet(A0_6)
  local L1_7, L2_8, L3_9, L4_10, L5_11, L6_12, L7_13
  L7_13 = _UPVALUE0_
  L7_13 = L7_13.protocolVlanGet
  A0_6, L2_8, L3_9, L4_10, L5_11, L6_12, L7_13 = A0_6, nil, nil, nil, nil, nil, L7_13(A0_6)
  L1_7 = L7_13
  L7_13 = _UPVALUE1_
  L7_13 = L7_13.SUCCESS
  if L1_7 ~= L7_13 then
    return L1_7
  end
  L7_13 = nil
  for _FORV_11_, _FORV_12_ in pairs(protocoList) do
    if _FORV_12_ == L5_11 then
      L7_13 = _FORV_11_
    end
  end
  return L1_7, A0_6, L2_8, L3_9, L4_10, tostring(L7_13), L6_12
end
function protocolGetAll()
  local L0_14, L1_15
  L0_14, L1_15 = _UPVALUE0_.protocolVlanGetAll()
  if L0_14 ~= _UPVALUE1_.SUCCESS then
    return L0_14
  end
  return L0_14, L1_15
end
function protocolVlanGetNext(A0_16)
  local L1_17, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24
  L1_17 = A0_16["protocolVlan.cookie"]
  if L1_17 == nil then
    L2_18 = util
    L2_18 = L2_18.appendDebugOut
    L3_19 = "GetNext : Invalid Cookie"
    L2_18(L3_19)
    L2_18 = _UPVALUE0_
    L2_18 = L2_18.BAD_PARAMETER
    return L2_18
  end
  L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24 = nil, nil, nil, nil, nil, nil, nil
  L2_18, L8_24, L3_19, L4_20, L5_21, L6_22, L7_23 = vlan_protocol.protocolVlanGetNext(L1_17)
  if L2_18 ~= SUCCESS then
    return L2_18
  end
  L5_21 = "Port" .. L5_21
  return L2_18, L8_24, L3_19, L4_20, L5_21, L6_22, L7_23
end
function protocolSet(A0_25)
  local L1_26, L2_27, L3_28, L4_29, L5_30, L6_31, L7_32
  L1_26 = ACCESS_LEVEL
  if L1_26 ~= 0 then
    L1_26 = util
    L1_26 = L1_26.appendDebugOut
    L2_27 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_26(L2_27)
    L1_26 = _UPVALUE0_
    L1_26 = L1_26.UNAUTHORIZED
    return L1_26
  end
  L1_26 = A0_25["protocolVlan.cookie"]
  L2_27 = A0_25["protocolVlan.groupName"]
  L3_28 = A0_25["protocolVlan.port"]
  L4_29 = protocoList
  L5_30 = tonumber
  L6_31 = A0_25["protocolVlan.protocol"]
  L5_30 = L5_30(L6_31)
  L4_29 = L4_29[L5_30]
  L5_30 = A0_25["protocolVlan.vlan"]
  if L1_26 == nil then
    L6_31 = util
    L6_31 = L6_31.appendDebugOut
    L7_32 = "Set : Invalid Cookie"
    L6_31(L7_32)
    L6_31 = _UPVALUE0_
    L6_31 = L6_31.BAD_PARAMETER
    return L6_31
  end
  if L2_27 == nil or L3_28 == nil or L4_29 == nil or L5_30 == nil then
    L6_31 = util
    L6_31 = L6_31.appendDebugOut
    L7_32 = "GetNext : Invalid Cookie"
    L6_31(L7_32)
    L6_31 = _UPVALUE0_
    L6_31 = L6_31.BAD_PARAMETER
    return L6_31
  end
  L6_31 = string
  L6_31 = L6_31.match
  L7_32 = L3_28
  L6_31 = L6_31(L7_32, "%d+")
  L3_28 = L6_31
  L6_31, L7_32 = nil, nil
  _UPVALUE1_.start()
  L6_31, L7_32 = _UPVALUE2_.protocolVlanSet(L1_26, L2_27, L3_28, L4_29, L5_30)
  if L6_31 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L6_31)
    _UPVALUE1_.abort()
    return L6_31, L1_26
  end
  _UPVALUE1_.complete()
  return _UPVALUE0_.SUCCESS, L7_32
end
function protocolDelete(A0_33)
  local L1_34
  L1_34 = ACCESS_LEVEL
  if L1_34 ~= 0 then
    L1_34 = util
    L1_34 = L1_34.appendDebugOut
    L1_34("Detected Unauthorized access for page DUMMY PAGE")
    L1_34 = _UPVALUE0_
    L1_34 = L1_34.UNAUTHORIZED
    return L1_34
  end
  L1_34 = A0_33["protocolVlan.cookie"]
  if L1_34 == nil then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.protocolVlanDelete(L1_34)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode, L1_34
  end
  _UPVALUE1_.complete()
  return _UPVALUE0_.SUCCESS, cookie
end
function protocolDefaultsGet()
  local L0_35, L1_36, L2_37, L3_38, L4_39, L6_40, L7_41, L8_42, L9_43, L10_44, L11_45
  L0_35 = 1
  L1_36 = "Default"
  L2_37 = "Port1"
  L3_38 = "IP"
  L4_39 = "1"
  L6_40 = _UPVALUE0_
  L6_40 = L6_40.SUCCESS
  L7_41 = 0
  L8_42 = L0_35
  L9_43 = L1_36
  L10_44 = L2_37
  L11_45 = L3_38
  return L6_40, L7_41, L8_42, L9_43, L10_44, L11_45, L4_39
end
function protocolCreate(A0_46)
  local L1_47, L2_48, L3_49, L4_50, L5_51, L6_52, L7_53
  L1_47 = ACCESS_LEVEL
  if L1_47 ~= 0 then
    L1_47 = util
    L1_47 = L1_47.appendDebugOut
    L2_48 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_47(L2_48)
    L1_47 = _UPVALUE0_
    L1_47 = L1_47.UNAUTHORIZED
    return L1_47
  end
  L1_47 = A0_46["protocolVlan.groupId"]
  L2_48 = A0_46["protocolVlan.groupName"]
  L3_49 = A0_46["protocolVlan.port"]
  L4_50 = protocoList
  L5_51 = tonumber
  L6_52 = A0_46["protocolVlan.protocol"]
  L5_51 = L5_51(L6_52)
  L4_50 = L4_50[L5_51]
  L5_51 = A0_46["protocolVlan.vlan"]
  if L1_47 == nil or L2_48 == nil or L3_49 == nil or L4_50 == nil or L5_51 == nil then
    L6_52 = util
    L6_52 = L6_52.appendDebugOut
    L7_53 = "GetNext : Invalid Cookie"
    L6_52(L7_53)
    L6_52 = _UPVALUE0_
    L6_52 = L6_52.BAD_PARAMETER
    return L6_52
  end
  L6_52 = string
  L6_52 = L6_52.match
  L7_53 = L3_49
  L6_52 = L6_52(L7_53, "%d+")
  L3_49 = L6_52
  L6_52, L7_53 = nil, nil
  _UPVALUE1_.start()
  L6_52, L7_53 = _UPVALUE2_.protocolVlanCreate(L1_47, L2_48, L3_49, L4_50, L5_51)
  if L6_52 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L6_52)
    _UPVALUE1_.abort()
    return L6_52, 0
  end
  _UPVALUE1_.complete()
  return _UPVALUE0_.SUCCESS, L7_53
end
function protocolDeleteAll()
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page DUMMY PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.protocolVlanDeleteAll()
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode, curCookie
  end
  _UPVALUE1_.complete()
  return _UPVALUE0_.SUCCESS, cookie
end
