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
L0_0("teamf1lualib/vlan_participation")
L0_0 = require
L0_0("teamf1lualib/vlan_vlan")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
portVlanPage = "vlanportmgmt"
portModeName = "portModeName"
function portVlanGet(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9
  L8_9 = _UPVALUE0_
  L8_9 = L8_9.participationGet
  A0_1, L2_3, L3_4, L4_5, L5_6, L7_8, portName, L8_9 = A0_1, nil, nil, nil, nil, nil, nil, L8_9(A0_1)
  L1_2 = L8_9
  L8_9 = tostring
  L8_9 = L8_9(tonumber(L3_4) + 1)
  L3_4 = L8_9
  L8_9 = _UPVALUE1_
  L8_9 = L8_9.SUCCESS
  if L1_2 ~= L8_9 then
    return L1_2
  end
  L8_9 = _UPVALUE2_
  L8_9 = L8_9.vlanIdGetAll
  vlanIdTable, L8_9 = tonumber(L3_4) + 1, L8_9()
  L1_2 = L8_9
  L8_9 = {}
  for _FORV_13_ in L5_6:gmatch("%d+") do
    L8_9[1] = _FORV_13_
  end
  return L1_2, A0_1, L2_3, L3_4, L4_5, L8_9, vlanIdTable, L7_8, portName
end
function portVlanGetAll()
  local L0_10, L1_11
  L0_10, L1_11 = _UPVALUE0_.participationGetAll()
  if L0_10 ~= _UPVALUE1_.SUCCESS then
    return L0_10
  end
  for _FORV_5_, _FORV_6_ in pairs(L1_11) do
    L1_11[_FORV_5_][portVlanPage .. "." .. portModeName] = _UPVALUE2_[tonumber(L1_11[_FORV_5_][portVlanPage .. ".PortVlanMode"]) + 1]
  end
  return L0_10, L1_11
end
function portVlandot11GetAll()
  local L0_12, L1_13
  L0_12, L1_13 = _UPVALUE0_.participationdot11GetAll()
  if L0_12 ~= _UPVALUE1_.SUCCESS then
    return L0_12
  end
  for _FORV_5_, _FORV_6_ in pairs(L1_13) do
    L1_13[_FORV_5_][portVlanPage .. "." .. portModeName] = _UPVALUE2_[tonumber(_FORV_6_[portVlanPage .. ".PortVlanMode"]) + 1]
  end
  return L0_12, L1_13
end
function portVlanGetNext(A0_14)
  local L1_15, L2_16, L3_17, L4_18, L5_19, L6_20, L7_21, L8_22
  L1_15 = A0_14["portVlan.cookie"]
  if L1_15 == nil then
    L2_16 = util
    L2_16 = L2_16.appendDebugOut
    L3_17 = "GetNext : Invalid Cookie"
    L2_16(L3_17)
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.BAD_PARAMETER
    return L2_16
  end
  L2_16, L3_17, L4_18, L5_19, L6_20, L7_21, L8_22 = nil, nil, nil, nil, nil, nil, nil
  L2_16, L7_21, L3_17, L4_18, L5_19, L6_20 = _UPVALUE1_.participationGetNext(L1_15)
  L4_18 = tonumber(L4_18) + 1
  L8_22 = _UPVALUE2_[L4_18]
  if L2_16 ~= _UPVALUE0_.SUCCESS then
    return L2_16
  end
  return L2_16, L7_21, L3_17, L8_22, L5_19, L6_20
end
function portVlanSet(A0_23)
  local L1_24, L2_25, L3_26, L4_27, L5_28, L6_29
  L1_24 = ACCESS_LEVEL
  if L1_24 ~= 0 then
    L1_24 = util
    L1_24 = L1_24.appendDebugOut
    L2_25 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_24(L2_25)
    L1_24 = _UPVALUE0_
    L1_24 = L1_24.UNAUTHORIZED
    return L1_24
  end
  L1_24 = A0_23["portVlan.cookie"]
  L2_25 = tostring
  L3_26 = tonumber
  L4_27 = A0_23["portVlan.mode"]
  L3_26 = L3_26(L4_27)
  L3_26 = L3_26 - 1
  L2_25 = L2_25(L3_26)
  L3_26 = A0_23["portVlan.pvid"]
  L4_27 = A0_23["portVlan.participation"]
  if L1_24 == nil then
    L5_28 = util
    L5_28 = L5_28.appendDebugOut
    L6_29 = "Set : Invalid Cookie"
    L5_28(L6_29)
    L5_28 = _UPVALUE0_
    L5_28 = L5_28.BAD_PARAMETER
    return L5_28
  end
  if L2_25 == nil then
    L5_28 = util
    L5_28 = L5_28.appendDebugOut
    L6_29 = "GetNext : Invalid Cookie"
    L5_28(L6_29)
    L5_28 = _UPVALUE0_
    L5_28 = L5_28.BAD_PARAMETER
    return L5_28
  end
  L5_28, L6_29 = nil, nil
  _UPVALUE1_.start()
  L5_28, L6_29 = _UPVALUE2_.participationSet(L1_24, "", L2_25, L3_26, L4_27)
  if L5_28 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L5_28)
    _UPVALUE1_.abort()
    return L5_28, L1_24
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L6_29
end
function portVlanDelete(A0_30)
  return _UPVALUE0_.NOT_SUPPORTED
end
function dummyPageSectionDefaultsGet()
  local L0_31, L1_32, L2_33, L3_34, L4_35, L5_36, L6_37, L7_38, L8_39, L9_40
  L4_35 = "Access"
  modeVale = L4_35
  L2_33 = "1"
  L3_34 = "1"
  L4_35 = _UPVALUE0_
  L4_35 = L4_35.SUCCESS
  L5_36 = 0
  L6_37 = L0_31
  L7_38 = L1_32
  L8_39 = L2_33
  L9_40 = L3_34
  return L4_35, L5_36, L6_37, L7_38, L8_39, L9_40
end
function portVlanCreate(A0_41)
  return _UPVALUE0_.NOT_SUPPORTED
end
