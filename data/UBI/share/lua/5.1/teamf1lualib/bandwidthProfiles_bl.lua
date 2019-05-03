local L0_0
L0_0 = module
L0_0("com.teamf1.bl.network.bandwidthProfiles", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/bandwidthProfilesConfig")
L0_0 = require
L0_0("teamf1lualib/trafficSelectorReturnCodes")
L0_0 = require
L0_0("teamf1lualib/bandwidthProfilesReturnCodes")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function bandwidthProfilesStatusGet()
  local L0_1, L1_2
  L0_1 = _UPVALUE0_
  L0_1 = L0_1.FAILURE
  L1_2 = {}
  L0_1, L1_2 = _UPVALUE1_.bandwidthProfileStatusGet()
  if L0_1 ~= _UPVALUE0_.SUCCESS then
    return L0_1, L1_2
  end
  return L0_1, L1_2
end
function bandwidthProfileGet(A0_3)
  local L1_4, L2_5, L3_6, L4_7
  L1_4 = {}
  L2_5 = {}
  L3_6 = _UPVALUE0_
  L3_6 = L3_6.NIL
  L4_7 = _UPVALUE0_
  L4_7 = L4_7.FAILURE
  if A0_3 == _UPVALUE0_.NIL then
    L4_7 = _UPVALUE0_.BAD_PARAMETER
    return L4_7, L1_4, L2_5, L3_6
  end
  L4_7, L1_4 = _UPVALUE1_.bandwidthProfileInfoGet(A0_3)
  if L4_7 ~= _UPVALUE0_.SUCCESS then
    return L4_7, L1_4, L2_5, L3_6
  end
  L4_7, L2_5 = _UPVALUE1_.vlanInfoGet()
  if L4_7 ~= _UPVALUE0_.SUCCESS then
    return L4_7, L1_4, L2_5, L3_6
  end
  L4_7, L3_6 = _UPVALUE1_.configPortInfoGet()
  if L4_7 ~= _UPVALUE0_.SUCCESS then
    return L4_7, L1_4, L2_5, L3_6
  end
  return L4_7, L1_4, L2_5, L3_6
end
function bandwidthProfileStatusEdit(A0_8)
  local L1_9, L2_10
  L1_9 = _UPVALUE0_
  L1_9 = L1_9.FAILURE
  L2_10 = _UPVALUE0_
  L2_10 = L2_10.NIL
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L2_10 = A0_8["BandWidthProfileStatus.Status"]
  if L2_10 == _UPVALUE0_.NIL or L2_10 ~= "0" and L2_10 ~= "1" then
    L1_9 = _UPVALUE0_.BAD_PARAMETER
    return L1_9
  end
  _UPVALUE1_.start()
  L1_9 = _UPVALUE2_.bandwidthProfileStatusModify(L2_10)
  if L1_9 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page BandwidthProfile.")
    _UPVALUE1_.abort()
    return L1_9
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_9
end
function bandwidthProfilesDelete(A0_11)
  local L1_12
  L1_12 = _UPVALUE0_
  L1_12 = L1_12.FAILURE
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_11 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L1_12 = _UPVALUE2_.deleteAvailableProfiles(A0_11)
  if L1_12 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in deleting the profiles.")
    _UPVALUE1_.abort()
    return L1_12
  end
  L1_12 = _UPVALUE0_.SUCCESS
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_12
end
function bandwidthProfilesCreate(A0_13)
  local L1_14, L2_15, L3_16, L4_17, L5_18, L6_19, L7_20, L8_21
  L1_14 = _UPVALUE0_
  L1_14 = L1_14.FAILURE
  L2_15 = A0_13["BandWidthProfile.ProfileName"]
  L3_16 = A0_13["BandWidthProfile.Policy"]
  L4_17 = A0_13["BandWidthProfile.ProfileType"]
  L5_18 = A0_13["BandWidthProfile.Priority"]
  L6_19 = A0_13["BandWidthProfile.MinimumRate"]
  L7_20 = A0_13["BandWidthProfile.MaximumRate"]
  L8_21 = A0_13["BandWidthProfile.WANID"]
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_13["BandWidthProfile.ProfileName"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L2_15 = A0_13["BandWidthProfile.ProfileName"]
  if A0_13["BandWidthProfile.Policy"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L3_16 = A0_13["BandWidthProfile.Policy"]
  if A0_13["BandWidthProfile.ProfileType"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L4_17 = A0_13["BandWidthProfile.ProfileType"]
  if L4_17 == "0" then
    if A0_13["BandWidthProfile.Priority"] == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
    L5_18 = A0_13["BandWidthProfile.Priority"]
  else
    if A0_13["BandWidthProfile.MinimumRate"] == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
    L6_19 = A0_13["BandWidthProfile.MinimumRate"]
    if A0_13["BandWidthProfile.MaximumRate"] == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
    L7_20 = A0_13["BandWidthProfile.MaximumRate"]
  end
  if A0_13["BandWidthProfile.WANID"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L8_21 = A0_13["BandWidthProfile.WANID"]
  _UPVALUE1_.start()
  L1_14 = _UPVALUE2_.bandwidthProfileAdd(L2_15, L3_16, L4_17, L5_18, L6_19, L7_20, L8_21)
  if L1_14 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in deleting the profiles.")
    _UPVALUE1_.abort()
    return L1_14
  end
  L1_14 = _UPVALUE0_.SUCCESS
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_14
end
function bandwidthProfilesEdit(A0_22)
  local L1_23, L2_24, L3_25, L4_26, L5_27, L6_28, L7_29, L8_30, L9_31
  L1_23 = _UPVALUE0_
  L1_23 = L1_23.FAILURE
  L2_24 = A0_22["BandWidthProfile.ProfileName"]
  L3_25 = A0_22["BandWidthProfile.Policy"]
  L4_26 = A0_22["BandWidthProfile.ProfileType"]
  L5_27 = A0_22["BandWidthProfile.Priority"]
  L6_28 = A0_22["BandWidthProfile.MinimumRate"]
  L7_29 = A0_22["BandWidthProfile.MaximumRate"]
  L8_30 = A0_22["BandWidthProfile.WANID"]
  L9_31 = A0_22["BandWidthProfile.cookie"]
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page.")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_22["BandWidthProfile.ProfileName"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L2_24 = A0_22["BandWidthProfile.ProfileName"]
  if A0_22["BandWidthProfile.Policy"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L3_25 = A0_22["BandWidthProfile.Policy"]
  if A0_22["BandWidthProfile.ProfileType"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L4_26 = A0_22["BandWidthProfile.ProfileType"]
  if L4_26 == "0" then
    if A0_22["BandWidthProfile.Priority"] == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
    L5_27 = A0_22["BandWidthProfile.Priority"]
  else
    if A0_22["BandWidthProfile.MinimumRate"] == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
    L6_28 = A0_22["BandWidthProfile.MinimumRate"]
    if A0_22["BandWidthProfile.MaximumRate"] == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
    L7_29 = A0_22["BandWidthProfile.MaximumRate"]
  end
  if A0_22["BandWidthProfile.WANID"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L8_30 = A0_22["BandWidthProfile.WANID"]
  if A0_22["BandWidthProfile.cookie"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L9_31 = A0_22["BandWidthProfile.cookie"]
  _UPVALUE1_.start()
  L1_23 = _UPVALUE2_.bandwidthProfileSet(L2_24, L3_25, L4_26, L5_27, L6_28, L7_29, L8_30, L9_31)
  if L1_23 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in deleting the profiles.")
    _UPVALUE1_.abort()
    return L1_23
  end
  L1_23 = _UPVALUE0_.SUCCESS
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_23
end
function bandwidthProfilesInfoGetAll()
  local L0_32, L1_33
  L0_32 = _UPVALUE0_
  L0_32 = L0_32.FAILURE
  L1_33 = {}
  L0_32, L1_33 = _UPVALUE1_.bandwidthProfileInfoGetAll()
  if L0_32 ~= _UPVALUE0_.SUCCESS then
    return L0_32, L1_33
  end
  return L0_32, L1_33
end
function qosBandwidthProfileStatusGet()
  local L0_34, L1_35, L2_36
  L0_34 = {}
  L1_35 = nil
  L2_36 = bandwidthProfilesStatusGet
  L0_34, L2_36 = nil, L2_36()
  L1_35 = L2_36
  L2_36 = L0_34["BandWidthProfileStatus.Status"]
  return L1_35, L2_36
end
function qosBandwidthProfileDelete(A0_37)
  local L1_38, L2_39
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for bsndwidthprofile PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_38 = A0_37["BandWidthProfile.cookie"]
  if L1_38 == _UPVALUE0_.NIL then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L2_39, cookie = _UPVALUE2_.qosBandwidthProfileDelete(L1_38)
  if L2_39 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in bandwidthprofile page " .. L2_39)
    _UPVALUE1_.abort()
    return L2_39
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L2_39, cookie
end
function bandwidthManagementCreate(A0_40)
  local L1_41, L2_42, L3_43, L4_44, L5_45
  L1_41 = _UPVALUE0_
  L1_41 = L1_41.FAILURE
  L2_42 = A0_40["BandwidthManagement.WANInterface"]
  L3_43 = A0_40["BandwidthManagement.Servicetype"]
  L4_44 = A0_40["BandwidthManagement.BandwidthManagement"]
  L5_45 = A0_40["BandwidthManagement.BandwidthRate"]
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_41 = _UPVALUE1_.bandwidthManagementConfig(L4_44, L2_42, L3_43, L5_45)
  if L1_41 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in handling bandwidthManagement")
    _UPVALUE2_.abort()
    return L1_41
  end
  L1_41 = _UPVALUE0_.SUCCESS
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return L1_41
end
function bandwidthMgmteGet()
  returnCode, tbl = _UPVALUE0_.bandwidthInfoGet()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode, BandwidthManagement, Servicetype, WANInterface, BandwidthRate
  end
  return returnCode, tbl
end
