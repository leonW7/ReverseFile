local L0_0
L0_0 = module
L0_0("com.teamf1.bl.vlan.macvlan", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vlan_macVlan")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function macBasedVlanSetupSectionGet()
  local L0_1, L1_2, L2_3
  L0_1 = _UPVALUE0_
  L0_1 = L0_1.isfeatureEnabled
  L2_3 = L0_1()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3
end
function macBasedVlanSectionGet()
  local L0_4, L1_5, L2_6, L3_7, L4_8
  L0_4, L4_8, L1_5, L2_6, L3_7 = _UPVALUE0_.macVlanGet()
  if L0_4 ~= _UPVALUE1_.SUCCESS then
    return L0_4
  end
  return L0_4, L4_8, L1_5, L2_6, L3_7
end
function macBasedVlanSectionGetNext(A0_9)
  local L1_10, L2_11, L3_12, L4_13, L5_14, L6_15
  L1_10 = A0_9["macBasedVlan.cookie"]
  L2_11 = _UPVALUE0_
  L2_11 = L2_11.NIL
  if L1_10 == L2_11 then
    L2_11 = util
    L2_11 = L2_11.appendDebugOut
    L3_12 = "GetNext : Invalid Cookie"
    L2_11(L3_12)
    L2_11 = _UPVALUE0_
    L2_11 = L2_11.BAD_PARAMETER
    return L2_11
  end
  L2_11, L3_12, L4_13, L5_14, L6_15 = nil, nil, nil, nil, nil
  L2_11, L6_15, L3_12, L4_13, L5_14 = _UPVALUE1_.macVlanGetNext(L1_10)
  if L2_11 ~= _UPVALUE0_.SUCCESS then
    return L2_11
  end
  return L2_11, L6_15, L3_12, L4_13, L5_14
end
function macBasedVlanSetupSectionSet(A0_16)
  local L1_17, L2_18, L3_19, L4_20
  L1_17 = ACCESS_LEVEL
  if L1_17 ~= 0 then
    L1_17 = util
    L1_17 = L1_17.appendDebugOut
    L2_18 = "Detected Unauthorized access for page macBasedVlan PAGE"
    L1_17(L2_18)
    L1_17 = _UPVALUE0_
    L1_17 = L1_17.UNAUTHORIZED
    return L1_17
  end
  L1_17 = A0_16["macBasedVlan.feature"]
  L2_18 = _UPVALUE0_
  L2_18 = L2_18.NIL
  if L1_17 == L2_18 then
    L2_18 = util
    L2_18 = L2_18.appendDebugOut
    L3_19 = "GetNext : Invalid Cookie"
    L2_18(L3_19)
    L2_18 = _UPVALUE0_
    L2_18 = L2_18.BAD_PARAMETER
    return L2_18
  end
  L2_18, L3_19 = nil, nil
  L4_20 = _UPVALUE1_
  L4_20 = L4_20.start
  L4_20()
  L4_20 = "1"
  if L1_17 == _UPVALUE2_ then
    L2_18, L3_19 = _UPVALUE3_.featureEnable(L4_20)
  else
    L2_18, L3_19 = _UPVALUE3_.featureDisable(L4_20)
  end
  if L2_18 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page macBasedVlan PAGE" .. L2_18)
    _UPVALUE1_.abort()
    return L2_18, L4_20
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L3_19
end
function macBasedVlanSectionSet(A0_21)
  local L1_22, L2_23, L3_24, L4_25, L5_26, L6_27
  L1_22 = ACCESS_LEVEL
  if L1_22 ~= 0 then
    L1_22 = util
    L1_22 = L1_22.appendDebugOut
    L2_23 = "Detected Unauthorized access for page macBasedVlan PAGE"
    L1_22(L2_23)
    L1_22 = _UPVALUE0_
    L1_22 = L1_22.UNAUTHORIZED
    return L1_22
  end
  L1_22 = A0_21["macBasedVlan.cookie"]
  L2_23 = A0_21["macBasedVlan.macAddress"]
  L3_24 = A0_21["macBasedVlan.vlan"]
  L4_25 = A0_21["macBasedVlan.port"]
  L5_26 = _UPVALUE0_
  L5_26 = L5_26.NIL
  if L1_22 == L5_26 then
    L5_26 = util
    L5_26 = L5_26.appendDebugOut
    L6_27 = "Set : Invalid Cookie"
    L5_26(L6_27)
    L5_26 = _UPVALUE0_
    L5_26 = L5_26.BAD_PARAMETER
    return L5_26
  end
  L5_26 = _UPVALUE0_
  L5_26 = L5_26.NIL
  if L2_23 ~= L5_26 then
    L5_26 = _UPVALUE0_
    L5_26 = L5_26.NIL
    if L3_24 ~= L5_26 then
      L5_26 = _UPVALUE0_
      L5_26 = L5_26.NIL
    end
  elseif L4_25 == L5_26 then
    L5_26 = util
    L5_26 = L5_26.appendDebugOut
    L6_27 = "GetNext : Invalid Cookie"
    L5_26(L6_27)
    L5_26 = _UPVALUE0_
    L5_26 = L5_26.BAD_PARAMETER
    return L5_26
  end
  L5_26, L6_27 = nil, nil
  _UPVALUE1_.start()
  L5_26, L6_27 = _UPVALUE2_.macVlanSet(L1_22, L2_23, L3_24, L4_25)
  if L5_26 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page macBasedVlan PAGE" .. L5_26)
    _UPVALUE1_.abort()
    return L5_26, L1_22
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L6_27
end
function macBasedVlanSectionDelete(A0_28)
  local L1_29, L2_30
  L1_29 = ACCESS_LEVEL
  if L1_29 ~= 0 then
    L1_29 = util
    L1_29 = L1_29.appendDebugOut
    L2_30 = "Detected Unauthorized access for page macBasedVlan PAGE"
    L1_29(L2_30)
    L1_29 = _UPVALUE0_
    L1_29 = L1_29.UNAUTHORIZED
    return L1_29
  end
  L1_29 = A0_28["macBasedVlan.cookie"]
  L2_30 = _UPVALUE0_
  L2_30 = L2_30.NIL
  if L1_29 == L2_30 then
    L2_30 = util
    L2_30 = L2_30.appendDebugOut
    L2_30("Delete : Invalid Cookie")
    L2_30 = _UPVALUE0_
    L2_30 = L2_30.BAD_PARAMETER
    return L2_30
  end
  L2_30 = nil
  _UPVALUE1_.start()
  L2_30 = _UPVALUE2_.macVlanDelete(L1_29)
  if L2_30 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in macVlan PAGE" .. L2_30)
    _UPVALUE1_.abort()
    return L2_30, L1_29
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L1_29
end
function macBasedVlanSectionCreate(A0_31)
  local L1_32, L2_33, L3_34, L4_35, L5_36
  L1_32 = ACCESS_LEVEL
  if L1_32 ~= 0 then
    L1_32 = util
    L1_32 = L1_32.appendDebugOut
    L2_33 = "Detected Unauthorized access for page macBasedVlan PAGE"
    L1_32(L2_33)
    L1_32 = _UPVALUE0_
    L1_32 = L1_32.UNAUTHORIZED
    return L1_32
  end
  L1_32 = A0_31["macBasedVlan.macAddress"]
  L2_33 = A0_31["macBasedVlan.vlan"]
  L3_34 = A0_31["macBasedVlan.port"]
  L4_35 = _UPVALUE0_
  L4_35 = L4_35.NIL
  if L1_32 ~= L4_35 then
    L4_35 = _UPVALUE0_
    L4_35 = L4_35.NIL
    if L2_33 ~= L4_35 then
      L4_35 = _UPVALUE0_
      L4_35 = L4_35.NIL
    end
  elseif L3_34 == L4_35 then
    L4_35 = util
    L4_35 = L4_35.appendDebugOut
    L5_36 = "GetNext : Invalid Cookie"
    L4_35(L5_36)
    L4_35 = _UPVALUE0_
    L4_35 = L4_35.BAD_PARAMETER
    return L4_35
  end
  L4_35, L5_36 = nil, nil
  _UPVALUE1_.start()
  L4_35, L5_36 = _UPVALUE2_.macVlanCreate(L1_32, L2_33, L3_34)
  if L4_35 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page macBasedVlan PAGE" .. L4_35)
    _UPVALUE1_.abort()
    return L4_35, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L5_36
end
function macBasedVlanSectionGetAll()
  local L0_37, L1_38
  L1_38 = {}
  L0_37, L1_38 = _UPVALUE0_.macVlanGetAll()
  if L0_37 ~= _UPVALUE1_.SUCCESS then
    return L0_37
  end
  return L0_37, L1_38
end
function macBasedVlanSectionDeleteAll()
  local L0_39
  L0_39 = ACCESS_LEVEL
  if L0_39 ~= 0 then
    L0_39 = util
    L0_39 = L0_39.appendDebugOut
    L0_39("Detected Unauthorized access for page macBasedVlan PAGE")
    L0_39 = _UPVALUE0_
    L0_39 = L0_39.UNAUTHORIZED
    return L0_39
  end
  L0_39 = nil
  _UPVALUE1_.start()
  L0_39 = _UPVALUE2_.macVlanDeleteAll()
  if L0_39 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in macVlan PAGE" .. L0_39)
    _UPVALUE1_.abort()
    return L0_39
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function macBasedVlanSectionGetCur(A0_40)
  local L1_41, L2_42, L3_43, L4_44, L5_45
  L1_41, L5_45, L2_42, L3_43, L4_44 = _UPVALUE0_.macVlanGetCur(A0_40)
  if L1_41 ~= _UPVALUE1_.SUCCESS then
    return L1_41
  end
  return L1_41, L2_42, L3_43, L4_44
end
