local L0_0
L0_0 = module
L0_0("com.teamf1.core.wireless.wmm", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wireless_accessPoints")
L0_0 = "dot11Profile"
profileTable = L0_0
L0_0 = "dot11VAP"
vapTable = L0_0
L0_0 = "dot11Interface"
interfaceTable = L0_0
L0_0 = "VlanPortMgmt"
vlanPortTable = L0_0
L0_0 = {}
L0_0.ssid = "ssid"
L0_0.vapEnabled = "vapEnabled"
L0_0.apName = "vapName"
L0_0.enableWmm = "qosEnable"
L0_0.defaultCos = "defaultCos"
L0_0.dscpCosMap = "dscpCosMap"
L0_0.interfaceName = "interfaceName"
L0_0.phyInterfaceName = "PhyInterfaceName"
L0_0.portName = "portName"
L0_0.profileName = "profileName"
L0_0.ROW_ID = "_ROWID_"
function profileNameGet()
  local L0_1, L1_2
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(profileTable, _UPVALUE0_.ROW_ID, "1", _UPVALUE0_.profileName)
  if L1_2 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_2
end
function profileNameGetNext(A0_3)
  local L1_4, L2_5
  L1_4 = _UPVALUE0_
  L1_4 = L1_4.NIL
  if A0_3 ~= L1_4 then
    L1_4 = tonumber
    L2_5 = A0_3
    L1_4 = L1_4(L2_5)
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.NIL
  elseif L1_4 == L2_5 then
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.INVALID_ARGUMENT
    return L1_4
  end
  L1_4 = db
  L1_4 = L1_4.existsRow
  L2_5 = profileTable
  L1_4 = L1_4(L2_5, _UPVALUE1_.ROW_ID, A0_3)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.FALSE
  if L1_4 == L2_5 then
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.INVALID_ARGUMENT
    return L1_4
  end
  L1_4 = db
  L1_4 = L1_4.getNextRowId
  L2_5 = A0_3
  L1_4 = L1_4(L2_5, profileTable)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if L1_4 == L2_5 then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.TABLE_IS_FULL
    return L2_5
  end
  L2_5 = db
  L2_5 = L2_5.getAttribute
  L2_5 = L2_5(profileTable, _UPVALUE1_.ROW_ID, L1_4, _UPVALUE1_.profileName)
  if L2_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L2_5
end
function profileNameSet(A0_6, A1_7)
  local L2_8
  if A0_6 == _UPVALUE0_.NIL or tonumber(A0_6) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(profileTable, _UPVALUE1_.ROW_ID, A0_6) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_7 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(profileTable, _UPVALUE1_.ROW_ID, A0_6, _UPVALUE1_.profileName, A1_7) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_6
  end
  return _UPVALUE0_.SUCCESS, A0_6
end
function profileNameDelete(A0_9, A1_10)
  local L3_11
  L3_11 = _UPVALUE0_
  L3_11 = L3_11.NOT_SUPPORTED
  return L3_11, A0_9
end
function isenableWmmEnabled()
  local L0_12, L1_13
  L1_13 = db
  L1_13 = L1_13.getAttribute
  L1_13 = L1_13(profileTable, _UPVALUE0_.ROW_ID, "1", _UPVALUE0_.enableWmm)
  if L1_13 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_13
end
function isenableWmmEnabledNext(A0_14)
  local L1_15, L2_16
  L1_15 = _UPVALUE0_
  L1_15 = L1_15.NIL
  if A0_14 ~= L1_15 then
    L1_15 = tonumber
    L2_16 = A0_14
    L1_15 = L1_15(L2_16)
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.NIL
  elseif L1_15 == L2_16 then
    L1_15 = _UPVALUE0_
    L1_15 = L1_15.INVALID_ARGUMENT
    return L1_15
  end
  L1_15 = db
  L1_15 = L1_15.existsRow
  L2_16 = profileTable
  L1_15 = L1_15(L2_16, _UPVALUE1_.ROW_ID, A0_14)
  L2_16 = _UPVALUE0_
  L2_16 = L2_16.FALSE
  if L1_15 == L2_16 then
    L1_15 = _UPVALUE0_
    L1_15 = L1_15.INVALID_ARGUMENT
    return L1_15
  end
  L1_15 = db
  L1_15 = L1_15.getNextRowId
  L2_16 = A0_14
  L1_15 = L1_15(L2_16, profileTable)
  L2_16 = _UPVALUE0_
  L2_16 = L2_16.NIL
  if L1_15 == L2_16 then
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.TABLE_IS_FULL
    return L2_16
  end
  L2_16 = db
  L2_16 = L2_16.getAttribute
  L2_16 = L2_16(wmmTable, _UPVALUE1_.ROW_ID, L1_15, _UPVALUE1_.enableWmm)
  if L2_16 == nil then
    return _UPVALUE0_.FAILURE, L1_15
  end
  return _UPVALUE0_.SUCCESS, L1_15, L2_16
end
function enableWmmEnable(A0_17)
  if A0_17 == _UPVALUE0_.NIL or tonumber(A0_17) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(profileTable, _UPVALUE1_.ROW_ID, A0_17) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(profileTable, _UPVALUE1_.ROW_ID, A0_17, _UPVALUE1_.enableWmm, _UPVALUE2_) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_17
  end
  return _UPVALUE0_.SUCCESS, A0_17
end
function enableWmmDisable(A0_18)
  if A0_18 == _UPVALUE0_.NIL or tonumber(A0_18) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(profileTable, _UPVALUE1_.ROW_ID, A0_18) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  return _UPVALUE0_.SUCCESS, A0_18
end
function defaultCosGet()
  local L0_19, L1_20
  L1_20 = db
  L1_20 = L1_20.getAttribute
  L1_20 = L1_20(profileTable, _UPVALUE0_.ROW_ID, "1", _UPVALUE0_.defaultCos)
  if L1_20 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_20
end
function defaultCosGetNext(A0_21)
  local L1_22, L2_23
  L1_22 = _UPVALUE0_
  L1_22 = L1_22.NIL
  if A0_21 ~= L1_22 then
    L1_22 = tonumber
    L2_23 = A0_21
    L1_22 = L1_22(L2_23)
    L2_23 = _UPVALUE0_
    L2_23 = L2_23.NIL
  elseif L1_22 == L2_23 then
    L1_22 = _UPVALUE0_
    L1_22 = L1_22.INVALID_ARGUMENT
    return L1_22
  end
  L1_22 = db
  L1_22 = L1_22.existsRow
  L2_23 = profileTable
  L1_22 = L1_22(L2_23, _UPVALUE1_.ROW_ID, A0_21)
  L2_23 = _UPVALUE0_
  L2_23 = L2_23.FALSE
  if L1_22 == L2_23 then
    L1_22 = _UPVALUE0_
    L1_22 = L1_22.INVALID_ARGUMENT
    return L1_22
  end
  L1_22 = db
  L1_22 = L1_22.getNextRowId
  L2_23 = A0_21
  L1_22 = L1_22(L2_23, profileTable)
  L2_23 = _UPVALUE0_
  L2_23 = L2_23.NIL
  if L1_22 == L2_23 then
    L2_23 = _UPVALUE0_
    L2_23 = L2_23.TABLE_IS_FULL
    return L2_23
  end
  L2_23 = db
  L2_23 = L2_23.getAttribute
  L2_23 = L2_23(wmmTable, _UPVALUE1_.ROW_ID, L1_22, _UPVALUE1_.defaultCos)
  if L2_23 == nil then
    return _UPVALUE0_.FAILURE, L1_22
  end
  return _UPVALUE0_.SUCCESS, L1_22, L2_23
end
function defaultCosSet(A0_24, A1_25)
  local L2_26
  if A0_24 == _UPVALUE0_.NIL or tonumber(A0_24) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(profileTable, _UPVALUE1_.ROW_ID, A0_24) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_25 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(profileTable, _UPVALUE1_.ROW_ID, A0_24, _UPVALUE1_.defaultCos, A1_25) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_24
  end
  return _UPVALUE0_.SUCCESS, A0_24
end
function wmmGet(A0_27, A1_28)
  local L2_29
  L2_29 = {}
  if A0_27 == "1" then
    L2_29 = db.getRow(profileTable, profileTable .. "." .. _UPVALUE0_.ROW_ID, A1_28)
  else
    L2_29 = db.getRow(profileTable, profileTable .. "." .. _UPVALUE0_.profileName, A1_28)
  end
  return _UPVALUE1_.SUCCESS, 1, L2_29
end
function wmmGetNext(A0_30)
  local L1_31
end
function wmmSet(A0_32, A1_33, A2_34, A3_35)
  local L4_36, L5_37, L6_38, L7_39, L8_40, L9_41, L10_42, L11_43
  L4_36 = {}
  L5_37 = db
  L5_37 = L5_37.getAttribute
  L6_38 = profileTable
  L7_39 = _UPVALUE0_
  L7_39 = L7_39.profileName
  L5_37 = L5_37(L6_38, L7_39, L8_40, L9_41)
  L6_38 = db
  L6_38 = L6_38.getAttribute
  L7_39 = profileTable
  L6_38 = L6_38(L7_39, L8_40, L9_41, L10_42)
  L7_39 = vapsOnPriflePortEnable
  L7_39 = L7_39(L8_40, L9_41)
  if A0_32 == nil then
    return L8_40
  end
  L4_36[L8_40] = A0_32
  if A1_33 == nil then
    return L8_40
  end
  valid = L8_40
  if L8_40 ~= L9_41 then
    return L8_40
  end
  L4_36[L8_40] = A1_33
  if A2_34 == nil then
    return L8_40
  end
  L4_36[L8_40] = A2_34
  for L11_43 = 0, 64 do
    L4_36[profileTable .. "." .. _UPVALUE0_.dscpCosMap .. L11_43] = A3_35[_UPVALUE0_.dscpCosMap .. L11_43]
  end
  if L8_40 == nil then
    return L9_41, L10_42
  end
  L7_39 = L9_41
  for _FORV_14_, _FORV_15_ in L11_43(L9_41) do
    row = L9_41[L10_42]
    if row[vapTable .. "." .. _UPVALUE0_.profileName] == A0_32 then
      profileUseFlag = "1"
    end
  end
  if L11_43 == "1" then
    vapUsedTbl = L11_43
    for _FORV_14_ = 1, #vapUsedTbl do
      row = vapUsedTbl[_FORV_14_]
      intName = db.getAttribute(interfaceTable, _UPVALUE0_.apName, row[vapTable .. "." .. _UPVALUE0_.apName], _UPVALUE0_.interfaceName)
      valid = db.setAttribute(vlanPortTable, _UPVALUE0_.phyInterfaceName, intName, _UPVALUE0_.portName, L6_38)
    end
  end
  if L11_43 then
    return L11_43, L5_37
  else
    return L11_43, L5_37
  end
end
function wmmCreate(A0_44, A1_45, A2_46)
  local L4_47
  L4_47 = _UPVALUE0_
  L4_47 = L4_47.NOT_SUPPORTED
  return L4_47, rowid
end
function wmmDelete(A0_48)
  local L2_49
  L2_49 = _UPVALUE0_
  L2_49 = L2_49.NOT_SUPPORTED
  return L2_49, A0_48
end
function vapsOnPriflePortEnable(A0_50, A1_51)
  local L2_52, L3_53
  L2_52 = false
  L3_53 = db
  L3_53 = L3_53.getRowsWhere
  L3_53 = L3_53(vapTable, _UPVALUE0_.vapEnabled .. " = '1' and" .. _UPVALUE0_.profileName .. "= '" .. A0_50 .. "'")
  if L3_53 ~= _UPVALUE1_.NIL then
    for _FORV_7_, _FORV_8_ in pairs(L3_53) do
      L2_52 = _UPVALUE2_.vapPortEnableSet(_FORV_8_[vapTable .. "." .. _UPVALUE0_.apName], A1_51)
    end
  else
    L2_52 = true
  end
  if L2_52 then
    return _UPVALUE1_.SUCCESS
  else
    return _UPVALUE1_.FAILURE
  end
end
