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
L0_0("teamf1lualib/vlan_voiceVlan")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
voiceVlanMode = {"vlan", "dot1p"}
ENABLE = "1"
DISABLE = "0"
voiceMode = {}
voiceMode.dot1p = "dot1p"
voiceMode.vlan = "vlan"
function featureStatusGet()
  local L0_1, L1_2
  L0_1 = _UPVALUE0_
  L0_1 = L0_1.isfeatureEnabled
  L1_2 = L0_1()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2
end
function featureStatusSet(A0_3)
  local L1_4, L2_5
  L1_4 = ACCESS_LEVEL
  if L1_4 ~= 0 then
    L1_4 = util
    L1_4 = L1_4.appendDebugOut
    L2_5 = "Detected Unauthorized access for managedAps page"
    L1_4(L2_5)
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.UNAUTHORIZED
    return L1_4
  end
  L1_4 = A0_3["voiceVlan.status"]
  L2_5 = nil
  if L1_4 == ENABLE then
    L2_5 = _UPVALUE1_.featureEnable()
  else
    L2_5 = _UPVALUE1_.featureDisable()
  end
  if L2_5 ~= _UPVALUE0_.SUCCESS then
    return L2_5
  end
  return L2_5, L1_4
end
function voiceGetAll()
  local L0_6, L1_7
  L0_6, L1_7 = _UPVALUE0_.voiceVlanGetAll()
  if L0_6 ~= _UPVALUE1_.SUCCESS then
    return L0_6
  end
  return L0_6, L1_7
end
function voiceGet(A0_8)
  local L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16, L9_17, L10_18, L11_19
  L7_15 = _UPVALUE0_
  L7_15 = L7_15.voiceVlanGet
  L5_13, L7_15 = nil, L7_15(L8_16)
  L5_13, L11_19 = nil, L7_15(L8_16)
  L4_12 = L11_19
  L3_11 = L10_18
  L2_10 = L9_17
  L6_14 = L8_16
  L1_9 = L7_15
  L7_15 = _UPVALUE1_
  L7_15 = L7_15.SUCCESS
  if L1_9 ~= L7_15 then
    L7_15 = _UPVALUE1_
    return L7_15
  end
  if L3_11 == "vlan" then
    L5_13 = NIL
  else
    L4_12 = NIL
  end
  L7_15 = nil
  for L11_19, _FORV_12_ in L8_16(L9_17) do
    if _FORV_12_ == L3_11 then
      L7_15 = tostring(L11_19)
    end
  end
  L11_19 = L7_15
  return L8_16, L9_17, L10_18, L11_19, L4_12, L5_13
end
function voiceGetNext(A0_20)
  local L1_21, L2_22, L3_23, L4_24, L5_25, L6_26, L7_27
  L1_21 = A0_20["voiceVlan.cookie"]
  if L1_21 == nil then
    L2_22 = util
    L2_22 = L2_22.appendDebugOut
    L3_23 = "GetNext : Invalid Cookie"
    L2_22(L3_23)
    L2_22 = _UPVALUE0_
    L2_22 = L2_22.BAD_PARAMETER
    return L2_22
  end
  L2_22, L3_23, L4_24, L5_25, L6_26, L7_27 = nil, nil, nil, nil, nil, nil
  L2_22, L7_27, L3_23, L4_24, L5_25, L6_26 = _UPVALUE1_.voiceVlanGetNext(L1_21)
  if L2_22 ~= _UPVALUE0_.SUCCESS then
    return L2_22
  end
  if L4_24 == voiceMode.vlan then
    L6_26 = NIL
  else
    L5_25 = NIL
  end
  L3_23 = "Port" .. L3_23
  return L2_22, L7_27, L3_23, L4_24, L5_25, L6_26
end
function voiceSet(A0_28)
  local L1_29, L2_30, L3_31, L4_32, L5_33, L6_34, L7_35
  L1_29 = ACCESS_LEVEL
  if L1_29 ~= 0 then
    L1_29 = util
    L1_29 = L1_29.appendDebugOut
    L2_30 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_29(L2_30)
    L1_29 = _UPVALUE0_
    L1_29 = L1_29.UNAUTHORIZED
    return L1_29
  end
  L1_29 = A0_28["voiceVlan.cookie"]
  L2_30 = A0_28["voiceVlan.port"]
  L3_31 = voiceVlanMode
  L4_32 = tonumber
  L5_33 = A0_28["voiceVlan.mode"]
  L4_32 = L4_32(L5_33)
  L3_31 = L3_31[L4_32]
  L4_32 = A0_28["voiceVlan.vlan"]
  L5_33 = A0_28["voiceVlan.priority"]
  if L1_29 == nil then
    L6_34 = util
    L6_34 = L6_34.appendDebugOut
    L7_35 = "Set : Invalid Cookie"
    L6_34(L7_35)
    L6_34 = _UPVALUE0_
    L6_34 = L6_34.BAD_PARAMETER
    return L6_34
  end
  if L2_30 == nil or L3_31 == nil then
    L6_34 = util
    L6_34 = L6_34.appendDebugOut
    L7_35 = "GetNext : Invalid Cookie"
    L6_34(L7_35)
    L6_34 = _UPVALUE0_
    L6_34 = L6_34.BAD_PARAMETER
    return L6_34
  end
  L6_34, L7_35 = nil, nil
  _UPVALUE1_.start()
  if L3_31 == voiceVlanMode[1] then
    L5_33 = ""
  elseif L3_31 == voiceVlanMode[2] then
    L4_32 = ""
  end
  L6_34, L7_35 = _UPVALUE2_.voiceVlanSet(L1_29, L2_30, L3_31, L4_32, L5_33)
  if L6_34 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L6_34)
    _UPVALUE1_.abort()
    return L6_34, L1_29
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L7_35
end
function voiceDelete(A0_36)
  local L1_37, L2_38, L3_39
  L1_37 = ACCESS_LEVEL
  if L1_37 ~= 0 then
    L1_37 = util
    L1_37 = L1_37.appendDebugOut
    L2_38 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_37(L2_38)
    L1_37 = _UPVALUE0_
    L1_37 = L1_37.UNAUTHORIZED
    return L1_37
  end
  L1_37 = A0_36["voiceVlan.cookie"]
  if L1_37 == nil then
    L2_38 = util
    L2_38 = L2_38.appendDebugOut
    L3_39 = "Delete : Invalid Cookie"
    L2_38(L3_39)
    L2_38 = _UPVALUE0_
    L2_38 = L2_38.BAD_PARAMETER
    return L2_38
  end
  L2_38, L3_39 = nil, nil
  _UPVALUE1_.start()
  L2_38, L3_39 = _UPVALUE2_.voiceVlanDelete(L1_37)
  if L2_38 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L2_38)
    _UPVALUE1_.abort()
    return L2_38, L1_37
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L3_39
end
function voiceDefaultsGet()
  local L0_40, L1_41, L2_42, L3_43, L5_44, L6_45, L7_46, L8_47, L9_48
  L0_40 = "port1"
  L1_41 = "Vlan"
  L2_42 = "1"
  L3_43 = nil
  L5_44 = _UPVALUE0_
  L5_44 = L5_44.SUCCESS
  L6_45 = 0
  L7_46 = L0_40
  L8_47 = L1_41
  L9_48 = L2_42
  return L5_44, L6_45, L7_46, L8_47, L9_48, L3_43
end
function voiceCreate(A0_49)
  local L1_50, L2_51, L3_52, L4_53, L5_54, L6_55
  L1_50 = ACCESS_LEVEL
  if L1_50 ~= 0 then
    L1_50 = util
    L1_50 = L1_50.appendDebugOut
    L2_51 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_50(L2_51)
    L1_50 = _UPVALUE0_
    L1_50 = L1_50.UNAUTHORIZED
    return L1_50
  end
  L1_50 = A0_49["voiceVlan.port"]
  L2_51 = voiceVlanMode
  L3_52 = tonumber
  L4_53 = A0_49["voiceVlan.mode"]
  L3_52 = L3_52(L4_53)
  L2_51 = L2_51[L3_52]
  L3_52 = A0_49["voiceVlan.vlan"]
  L4_53 = A0_49["voiceVlan.priority"]
  if L1_50 == nil or L2_51 == nil then
    L5_54 = util
    L5_54 = L5_54.appendDebugOut
    L6_55 = "GetNext : Invalid Cookie"
    L5_54(L6_55)
    L5_54 = _UPVALUE0_
    L5_54 = L5_54.BAD_PARAMETER
    return L5_54
  end
  L5_54, L6_55 = nil, nil
  if L2_51 == voiceVlanMode[1] then
    L4_53 = ""
  elseif L2_51 == voiceVlanMode[2] then
    L3_52 = ""
  end
  _UPVALUE1_.start()
  L5_54, L6_55 = _UPVALUE2_.voiceVlanCreate(L1_50, L2_51, L3_52, L4_53)
  if L5_54 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L5_54)
    _UPVALUE1_.abort()
    return L5_54, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L6_55
end
function voiceDeleteAll()
  local L0_56, L1_57
  L0_56 = ACCESS_LEVEL
  if L0_56 ~= 0 then
    L0_56 = util
    L0_56 = L0_56.appendDebugOut
    L1_57 = "Detected Unauthorized access for page DUMMY PAGE"
    L0_56(L1_57)
    L0_56 = _UPVALUE0_
    L0_56 = L0_56.UNAUTHORIZED
    return L0_56
  end
  L0_56, L1_57 = nil, nil
  _UPVALUE1_.start()
  L0_56, L1_57 = _UPVALUE2_.voiceVlanDeleteAll()
  if L0_56 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L0_56)
    _UPVALUE1_.abort()
    return L0_56, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L1_57
end
