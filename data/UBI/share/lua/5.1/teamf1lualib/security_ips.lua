local L0_0
L0_0 = module
L0_0("com.teamf1.core.security.ips", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).idsEnable = "idsEnable"
;({}).ipsEnable = "ipsEnable"
;({}).ipsEnableLan = "ipsEnable"
;({}).ipsEnableDmz = "ipsEnable"
;({}).numRules = "numRules"
;({}).numDrops = "numDrops"
;({}).numRejects = "numRejects"
;({}).numAlerts = "numAlerts"
function isidsEnableEnabled()
  local L0_1, L1_2
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(_UPVALUE0_, _UPVALUE1_, "1", _UPVALUE2_.idsEnable)
  if L1_2 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L1_2
end
function isidsEnableEnabledNext(A0_3)
  local L1_4, L2_5, L3_6
  L3_6 = db
  L3_6 = L3_6.getAttribute
  L3_6 = L3_6(_UPVALUE0_, _UPVALUE1_, L2_5, _UPVALUE2_.idsEnable)
  if L3_6 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE, L2_5
  end
  return _UPVALUE3_.SUCCESS, L2_5, L3_6
end
function idsEnableEnable(A0_7)
  local L1_8
  status = db.setAttribute(_UPVALUE0_, "_ROWID_", "1", _UPVALUE1_.idsEnable, "1")
  if status == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_7
  end
  return _UPVALUE2_.SUCCESS, A0_7
end
function idsEnableDisable(A0_9)
  local L1_10
  status = db.setAttribute(_UPVALUE0_, "_ROWID_", "1", _UPVALUE1_.idsEnable, "0")
  if status == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_9
  end
  return _UPVALUE2_.SUCCESS, A0_9
end
function isipsEnableEnabled()
  local L0_11, L1_12
  L1_12 = db
  L1_12 = L1_12.getAttribute
  L1_12 = L1_12(_UPVALUE0_, _UPVALUE1_, "1", _UPVALUE2_.ipsEnable)
  if L1_12 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L1_12
end
function isipsEnableEnabledNext(A0_13)
  local L1_14, L2_15, L3_16
  L3_16 = db
  L3_16 = L3_16.getAttribute
  L3_16 = L3_16(_UPVALUE0_, _UPVALUE1_, L2_15, _UPVALUE2_.ipsEnable)
  if L3_16 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE, L2_15
  end
  return _UPVALUE3_.SUCCESS, L2_15, L3_16
end
function ipsEnableEnable(A0_17)
  local L1_18
  status = db.setAttribute(_UPVALUE0_, "_ROWID_", "1", _UPVALUE1_.ipsEnable, "1")
  if status == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_17
  end
  return _UPVALUE2_.SUCCESS, A0_17
end
function ipsEnableDisable(A0_19)
  local L1_20
  status = db.setAttribute(_UPVALUE0_, "_ROWID_", "1", _UPVALUE1_.ipsEnable, "0")
  if status == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_19
  end
  return _UPVALUE2_.SUCCESS, A0_19
end
function isipsEnableLanEnabled()
  local L0_21, L1_22, L2_23
  L1_22 = "FromZoneType = 'SECURE' AND ToZoneType = 'INSECURE'"
  L2_23 = db
  L2_23 = L2_23.getAttributeWhere
  L2_23 = L2_23(_UPVALUE0_, L1_22, _UPVALUE1_.ipsEnableLan)
  if L2_23 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L2_23
end
function isipsEnableLanEnabledNext(A0_24)
  local L1_25, L2_26, L3_27
  L3_27 = db
  L3_27 = L3_27.getAttribute
  L3_27 = L3_27(_UPVALUE0_, _UPVALUE1_, L2_26, _UPVALUE2_.ipsEnableLan)
  if L3_27 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE, L2_26
  end
  return _UPVALUE3_.SUCCESS, L2_26, L3_27
end
function ipsEnableLanEnable(A0_28)
  local L1_29, L2_30
  L2_30 = "FromZoneType = 'SECURE' AND ToZoneType = 'INSECURE'"
  status = db.setAttributeWhere(_UPVALUE0_, L2_30, _UPVALUE1_.ipsEnableLan, "1")
  if status == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_28
  end
  return _UPVALUE2_.SUCCESS, A0_28
end
function ipsEnableLanDisable(A0_31)
  local L1_32, L2_33
  L2_33 = "FromZoneType = 'SECURE' AND ToZoneType = 'INSECURE'"
  status = db.setAttributeWhere(_UPVALUE0_, L2_33, _UPVALUE1_.ipsEnableLan, "0")
  if status == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_31
  end
  return _UPVALUE2_.SUCCESS, A0_31
end
function isipsEnableDmzEnabled()
  local L0_34, L1_35, L2_36
  L1_35 = "FromZoneType = 'PUBLIC' AND ToZoneType = 'INSECURE'"
  L2_36 = db
  L2_36 = L2_36.getAttributeWhere
  L2_36 = L2_36(_UPVALUE0_, L1_35, _UPVALUE1_.ipsEnableDmz)
  if L2_36 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L2_36
end
function isipsEnableDmzEnabledNext(A0_37)
  local L1_38, L2_39, L3_40
  L3_40 = db
  L3_40 = L3_40.getAttribute
  L3_40 = L3_40(_UPVALUE0_, _UPVALUE1_, L2_39, _UPVALUE2_.ipsEnableDmz)
  if L3_40 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE, L2_39
  end
  return _UPVALUE3_.SUCCESS, L2_39, L3_40
end
function ipsEnableDmzEnable(A0_41)
  local L1_42, L2_43
  L2_43 = "FromZoneType = 'PUBLIC' AND ToZoneType = 'INSECURE'"
  status = db.setAttributeWhere(_UPVALUE0_, L2_43, _UPVALUE1_.ipsEnableDmz, "1")
  if status == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_41
  end
  return _UPVALUE2_.SUCCESS, A0_41
end
function ipsEnableDmzDisable(A0_44)
  local L1_45, L2_46
  L2_46 = "FromZoneType = 'PUBLIC' AND ToZoneType = 'INSECURE'"
  status = db.setAttributeWhere(_UPVALUE0_, L2_46, _UPVALUE1_.ipsEnableDmz, "0")
  if status == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_44
  end
  return _UPVALUE2_.SUCCESS, A0_44
end
function ipsGet()
  local L0_47, L1_48, L2_49, L3_50, L4_51, L5_52, L6_53, L7_54
  L7_54 = db
  L7_54 = L7_54.getRow
  L7_54 = L7_54(_UPVALUE0_, _UPVALUE1_, "1")
  if L7_54 == nil then
    L7_54 = {}
  end
  L0_47 = L7_54[_UPVALUE0_ .. "." .. _UPVALUE2_.ipsEnable]
  L1_48 = L7_54[_UPVALUE0_ .. "." .. _UPVALUE2_.idsEnable]
  if db.getRowWhere(_UPVALUE3_, "FromZoneType = 'SECURE' and ToZoneType = 'INSECURE'") ~= nil then
    L3_50 = db.getRowWhere(_UPVALUE3_, "FromZoneType = 'SECURE' and ToZoneType = 'INSECURE'")[_UPVALUE3_ .. "." .. _UPVALUE2_.ipsEnableLan] or ""
  end
  if db.getRowWhere(_UPVALUE3_, "FromZoneType = 'PUBLIC' and ToZoneType = 'INSECURE'") ~= nil then
    L2_49 = db.getRowWhere(_UPVALUE3_, "FromZoneType = 'PUBLIC' and ToZoneType = 'INSECURE'")[_UPVALUE3_ .. "." .. _UPVALUE2_.ipsEnableDmz] or ""
  end
  if db.getRow(_UPVALUE4_, _UPVALUE1_, "1") ~= nil then
    L4_51 = db.getRow(_UPVALUE4_, _UPVALUE1_, "1")[_UPVALUE4_ .. "." .. _UPVALUE2_.numRules]
    L5_52 = db.getRow(_UPVALUE4_, _UPVALUE1_, "1")[_UPVALUE4_ .. "." .. _UPVALUE2_.numAlerts]
    L6_53 = db.getRow(_UPVALUE4_, _UPVALUE1_, "1")[_UPVALUE4_ .. "." .. _UPVALUE2_.numDrops] + db.getRow(_UPVALUE4_, _UPVALUE1_, "1")[_UPVALUE4_ .. "." .. _UPVALUE2_.numRejects]
  end
  return _UPVALUE5_.SUCCESS, 1, L1_48, L0_47, L3_50, L2_49, L4_51, L5_52, L6_53
end
function ipsGetNext(A0_55)
  local L1_56, L2_57, L3_58, L4_59
  L2_57 = status
  L3_58 = _UPVALUE0_
  L3_58 = L3_58.NIL
  if L2_57 == L3_58 then
    L2_57 = _UPVALUE0_
    L2_57 = L2_57.FAILURE
    L3_58 = A0_55
    return L2_57, L3_58
  end
  L2_57 = _UPVALUE0_
  L2_57 = L2_57.SUCCESS
  L3_58 = L1_56
  L4_59 = ips
  return L2_57, L3_58, L4_59
end
function ipsSet(A0_60, A1_61, A2_62, A3_63, A4_64)
  local L5_65, L6_66, L7_67, L8_68, L9_69, L10_70
  L5_65 = {}
  L6_66 = nil
  L7_67 = _UPVALUE0_
  L7_67 = L7_67.NIL
  if A1_61 == L7_67 then
    L7_67 = _UPVALUE0_
    L7_67 = L7_67.INVALID_ARGUMENT
    return L7_67
  end
  L7_67 = _UPVALUE1_
  L7_67 = L7_67.booleanCheck
  L8_68 = A1_61
  L7_67 = L7_67(L8_68)
  L6_66 = L7_67
  L7_67 = _UPVALUE0_
  L7_67 = L7_67.SUCCESS
  if L6_66 ~= L7_67 then
    L7_67 = _UPVALUE0_
    L7_67 = L7_67.INVALID_ARGUMENT
    return L7_67
  end
  L7_67 = _UPVALUE2_
  L8_68 = "."
  L9_69 = _UPVALUE3_
  L9_69 = L9_69.idsEnable
  L7_67 = L7_67 .. L8_68 .. L9_69
  L5_65[L7_67] = A1_61
  L7_67 = _UPVALUE0_
  L7_67 = L7_67.NIL
  if A2_62 == L7_67 then
    L7_67 = _UPVALUE0_
    L7_67 = L7_67.INVALID_ARGUMENT
    return L7_67
  end
  L7_67 = _UPVALUE1_
  L7_67 = L7_67.booleanCheck
  L8_68 = A2_62
  L7_67 = L7_67(L8_68)
  L6_66 = L7_67
  L7_67 = _UPVALUE0_
  L7_67 = L7_67.SUCCESS
  if L6_66 ~= L7_67 then
    L7_67 = _UPVALUE0_
    L7_67 = L7_67.INVALID_ARGUMENT
    return L7_67
  end
  L7_67 = _UPVALUE2_
  L8_68 = "."
  L9_69 = _UPVALUE3_
  L9_69 = L9_69.ipsEnable
  L7_67 = L7_67 .. L8_68 .. L9_69
  L5_65[L7_67] = A2_62
  L7_67 = db
  L7_67 = L7_67.update
  L8_68 = _UPVALUE2_
  L9_69 = L5_65
  L10_70 = A0_60
  L7_67 = L7_67(L8_68, L9_69, L10_70)
  L8_68 = _UPVALUE0_
  L8_68 = L8_68.NIL
  if L7_67 == L8_68 then
    L8_68 = _UPVALUE0_
    L8_68 = L8_68.FAILURE
    L9_69 = A0_60
    return L8_68, L9_69
  end
  L8_68 = db
  L8_68 = L8_68.getRowWhere
  L9_69 = _UPVALUE4_
  L10_70 = "FromZoneType = 'SECURE' and ToZoneType = 'INSECURE'"
  L8_68 = L8_68(L9_69, L10_70)
  if L8_68 ~= nil then
    L9_69 = _UPVALUE0_
    L9_69 = L9_69.NIL
    if A3_63 == L9_69 then
      L9_69 = _UPVALUE0_
      L9_69 = L9_69.INVALID_ARGUMENT
      return L9_69
    end
    L9_69 = _UPVALUE1_
    L9_69 = L9_69.booleanCheck
    L10_70 = A3_63
    L9_69 = L9_69(L10_70)
    L6_66 = L9_69
    L9_69 = _UPVALUE0_
    L9_69 = L9_69.SUCCESS
    if L6_66 ~= L9_69 then
      L9_69 = _UPVALUE0_
      L9_69 = L9_69.INVALID_ARGUMENT
      return L9_69
    end
    L9_69 = _UPVALUE4_
    L10_70 = "."
    L9_69 = L9_69 .. L10_70 .. _UPVALUE3_.ipsEnableLan
    L8_68[L9_69] = A3_63
    L9_69 = db
    L9_69 = L9_69.update
    L10_70 = _UPVALUE4_
    L9_69 = L9_69(L10_70, L8_68, L8_68[_UPVALUE4_ .. "." .. _UPVALUE5_])
    L10_70 = _UPVALUE0_
    L10_70 = L10_70.NIL
    if L9_69 == L10_70 then
      L10_70 = _UPVALUE0_
      L10_70 = L10_70.FAILURE
      return L10_70, A0_60
    end
    L10_70 = db
    L10_70 = L10_70.getRowWhere
    L10_70 = L10_70(_UPVALUE4_, "FromZoneType = 'PUBLIC' and ToZoneType = 'INSECURE'")
    if L10_70 ~= nil then
      if A4_64 ~= _UPVALUE0_.NIL then
        L6_66 = _UPVALUE1_.booleanCheck(A4_64)
        if L6_66 ~= _UPVALUE0_.SUCCESS then
          return _UPVALUE0_.INVALID_ARGUMENT
        end
        L10_70[_UPVALUE4_ .. "." .. _UPVALUE3_.ipsEnableDmz] = A4_64
      end
      if db.update(_UPVALUE4_, L10_70, L10_70[_UPVALUE4_ .. "." .. _UPVALUE5_]) == _UPVALUE0_.NIL then
        return _UPVALUE0_.FAILURE, A0_60
      end
    else
      return _UPVALUE0_.FAILURE, A0_60
    end
  else
    L9_69 = _UPVALUE0_
    L9_69 = L9_69.FAILURE
    L10_70 = A0_60
    return L9_69, L10_70
  end
  L9_69 = db
  L9_69 = L9_69.getAttribute
  L10_70 = "environment"
  L9_69 = L9_69(L10_70, "name", "HW_OFFLOAD_SCRIPT", "value")
  L10_70 = "/pfrm2.0/bin/lua "
  L10_70 = L10_70 .. L9_69 .. " " .. "/tmp/system.db"
  util.appendDebugOut("Exec: " .. os.execute(L10_70))
  return _UPVALUE0_.SUCCESS, A0_60
end
function ipsCreate(A0_71, A1_72, A2_73, A3_74)
  return _UPVALUE0_.NOT_SUPPORTED
end
function ipsDelete(A0_75)
  local L2_76
  L2_76 = _UPVALUE0_
  L2_76 = L2_76.NOT_SUPPORTED
  return L2_76, A0_75
end
