local L0_0
L0_0 = module
L0_0("com.teamf1.bl.network.sessionLimiting", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/sessionLimitProfilesConfig")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/firewallRules_bl")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function sessionLimitProfileGet(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10
  L9_10 = _UPVALUE0_
  L9_10 = L9_10.FAILURE
  if A0_1 == _UPVALUE0_.NIL then
    L9_10 = _UPVALUE0_.BAD_PARAMETER
    return L9_10, A0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9
  end
  L9_10, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9 = _UPVALUE1_.sessionLimitProfileInfoGet(A0_1)
  if L9_10 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE, A0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9
  end
  return L9_10, A0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9
end
function warningMessageEdit(A0_11)
  local L1_12, L2_13
  L1_12 = _UPVALUE0_
  L1_12 = L1_12.FAILURE
  L2_13 = A0_11["sessionLimit.WarningMessage"]
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if L2_13 == _UPVALUE0_.NIL then
    L1_12 = _UPVALUE0_.BAD_PARAMETER
    return L1_12
  end
  _UPVALUE1_.start()
  L1_12 = _UPVALUE2_.warningMessageModify(L2_13)
  if L1_12 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page sessionLimit Profile.")
    _UPVALUE1_.abort()
    L1_12 = _UPVALUE0_.DB_OP_FAILED
    return L1_12
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_12
end
function sessionLimitProfileDelete(A0_14)
  local L1_15, L2_16, L3_17
  L1_15 = _UPVALUE0_
  L1_15 = L1_15.FAILURE
  L2_16 = _UPVALUE0_
  L2_16 = L2_16.NIL
  L3_17 = A0_14["sessionLimit.cookie"]
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if L3_17 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L1_15 = _UPVALUE2_.deleteAvailableProfiles(L3_17)
  if L1_15 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in deleting the profiles.")
    _UPVALUE1_.abort()
    return L1_15
  end
  L1_15 = _UPVALUE0_.SUCCESS
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_15
end
function sessionLimitProfileDeleteAll()
  local L0_18
  L0_18 = ACCESS_LEVEL
  if L0_18 ~= 0 then
    L0_18 = util
    L0_18 = L0_18.appendDebugOut
    L0_18("Detected Unauthorized access for page DUMMY PAGE")
    L0_18 = _UPVALUE0_
    L0_18 = L0_18.UNAUTHORIZED
    return L0_18
  end
  L0_18 = nil
  _UPVALUE1_.start()
  L0_18 = _UPVALUE2_.sessionLimitProfileDeleteAll()
  if L0_18 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L0_18)
    _UPVALUE1_.abort()
    return L0_18
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function sessionLimitProfileCreate(A0_19)
  local L1_20, L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27, L9_28, L10_29
  L1_20 = _UPVALUE0_
  L1_20 = L1_20.FAILURE
  L2_21 = A0_19["sessionLimit.ProfileName"]
  L3_22 = A0_19["sessionLimit.SourceType"]
  L4_23 = A0_19["sessionLimit.StartIPAddress"]
  L5_24 = A0_19["sessionLimit.EndIPAddress"]
  L6_25 = ""
  L7_26 = A0_19["sessionLimit.Interface"]
  L8_27 = A0_19["sessionLimit.MaximumSessions"]
  L9_28 = A0_19["sessionLimit.EnableSchedules"]
  L10_29 = A0_19["sessionLimit.ScheduleProfile"]
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if L2_21 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L3_22 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L3_22 == _UPVALUE1_ and L4_23 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  if tonumber(L3_22) == _UPVALUE2_ and (L4_23 == _UPVALUE0_.NIL or L5_24 == _UPVALUE0_.NIL) then
    return _UPVALUE0_.BAD_PARAMETER
  end
  if tonumber(L3_22) == _UPVALUE3_ then
    L1_20, L4_23, L6_25 = fw.core.firewallRules.Ipv4.interfaceInfoGet(L7_26)
    if L1_20 ~= _UPVALUE0_.SUCCESS then
      return _UPVALUE0_.INTERFACE_NOT_DEFINED
    end
    if L4_23 == _UPVALUE0_.NIL or L6_25 == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
  end
  if tonumber(L8_27) == _UPVALUE0_.NIL then
    L8_27 = _UPVALUE4_
  end
  if tonumber(L9_28) == _UPVALUE5_ and L10_29 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE6_.start()
  L1_20 = _UPVALUE7_.sessionLimitProfileAdd(L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27, L9_28, L10_29)
  if L1_20 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in creating the profiles.")
    _UPVALUE6_.abort()
    return L1_20
  end
  L1_20 = _UPVALUE0_.SUCCESS
  _UPVALUE6_.complete()
  _UPVALUE6_.save()
  return L1_20
end
function sessionLimitProfileSet(A0_30)
  local L1_31, L2_32, L3_33, L4_34, L5_35, L6_36, L7_37, L8_38, L9_39, L10_40, L11_41
  L1_31 = _UPVALUE0_
  L1_31 = L1_31.FAILURE
  L2_32 = A0_30["sessionLimit.ProfileName"]
  L3_33 = A0_30["sessionLimit.SourceType"]
  L4_34 = A0_30["sessionLimit.StartIPAddress"]
  L5_35 = A0_30["sessionLimit.EndIPAddress"]
  L6_36 = ""
  L7_37 = A0_30["sessionLimit.Interface"]
  L8_38 = A0_30["sessionLimit.MaximumSessions"]
  L9_39 = A0_30["sessionLimit.EnableSchedules"]
  L10_40 = A0_30["sessionLimit.ScheduleProfile"]
  L11_41 = A0_30["sessionLimit.cookie"]
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page.")
    return _UPVALUE0_.UNAUTHORIZED, L11_41
  end
  if L2_32 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER, L11_41
  end
  if L3_33 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER, L11_41
  end
  if tonumber(L3_33 == _UPVALUE1_) and L4_34 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER, L11_41
  end
  if tonumber(L3_33) == _UPVALUE2_ and (L4_34 == _UPVALUE0_.NIL or L5_35 == _UPVALUE0_.NIL) then
    return _UPVALUE0_.BAD_PARAMETER, L11_41
  end
  if tonumber(L3_33) == _UPVALUE3_ then
    L1_31, L4_34, L6_36 = fw.core.firewallRules.Ipv4.interfaceInfoGet(L7_37)
    if L1_31 ~= _UPVALUE0_.SUCCESS then
      return _UPVALUE0_.INTERFACE_NOT_DEFINED, L11_41
    end
    if L4_34 == _UPVALUE0_.NIL or L6_36 == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER, L11_41
    end
  end
  if tonumber(L8_38) == _UPVALUE0_.NIL then
    L8_38 = _UPVALUE4_
  end
  if tonumber(L9_39) == _UPVALUE5_ and L10_40 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER, L11_41
  end
  if L11_41 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER, L11_41
  end
  _UPVALUE6_.start()
  L1_31 = _UPVALUE7_.sessionLimitProfileSet(L2_32, L3_33, L4_34, L5_35, L6_36, L7_37, L8_38, L9_39, L10_40, L11_41)
  if L1_31 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in editing the profiles.")
    _UPVALUE6_.abort()
    return L1_31, L11_41
  end
  L1_31 = _UPVALUE0_.SUCCESS
  _UPVALUE6_.complete()
  _UPVALUE6_.save()
  return L1_31, splCookie
end
function sessionLimitProfileInfoGetAll()
  local L0_42, L1_43, L2_44
  L0_42 = _UPVALUE0_
  L0_42 = L0_42.FAILURE
  L1_43 = {}
  L2_44 = nil
  L0_42, L2_44, L1_43 = _UPVALUE1_.sessionLimitProfileInfoGetAll()
  if L0_42 ~= _UPVALUE0_.SUCCESS then
    return L0_42, L2_44, L1_43
  end
  return L0_42, L2_44, L1_43
end
function getScheduleInfo()
  local L0_45, L1_46
  L0_45 = {}
  L1_46 = _UPVALUE0_
  L1_46 = L1_46.NIL
  L1_46, L0_45 = _UPVALUE1_.getScheduleInfo()
  if L1_46 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  return L1_46, L0_45
end
function getInterfaceInfo()
  local L0_47, L1_48
  L0_47 = _UPVALUE0_
  L0_47 = L0_47.NIL
  L1_48 = {}
  L0_47, L1_48 = _UPVALUE1_.getInterfaceInfo()
  return L0_47, L1_48
end
function sessionLimitStatusGet()
  local L0_49, L1_50
  L0_49 = _UPVALUE0_
  L0_49 = L0_49.NIL
  L1_50 = {}
  L0_49, L1_50 = _UPVALUE1_.sessionLimitStatsGet()
  if L1_50 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_50
  end
  return L1_50
end
function blockAllTrafficEnable(A0_51)
  local L1_52
  L1_52 = _UPVALUE0_
  L1_52 = L1_52.NIL
  L1_52 = _UPVALUE1_.blockAllTrafficEnable(A0_51)
  if L1_52 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  return L1_52
end
function warningMessageGet()
  local L0_53
  L0_53 = _UPVALUE0_.warningMessageGet()
  return L0_53
end
