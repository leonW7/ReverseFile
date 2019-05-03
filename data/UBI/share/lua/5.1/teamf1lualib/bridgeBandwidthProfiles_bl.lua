local L0_0
L0_0 = module
L0_0("com.teamf1.bl.network.bridgeBandwidthProfiles", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/bandwidthProfilesReturnCodes")
L0_0 = require
L0_0("teamf1lualib/bandwidthProfilesConfig")
L0_0 = require
L0_0("teamf1lualib/bridgeBandwidthProfilesConfig")
L0_0 = require
L0_0("teamf1lualib/trafficSelectorReturnCodes")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function bridgeBandwidthProfilesStatusGet()
  local L0_1, L1_2
  L0_1 = _UPVALUE0_
  L0_1 = L0_1.FAILURE
  L1_2 = {}
  L0_1, L1_2 = _UPVALUE1_.bridgeBandwidthProfileStatusGet()
  if L0_1 ~= _UPVALUE0_.SUCCESS then
    return L0_1, L1_2
  end
  return L0_1, L1_2
end
function bridgeBandwidthProfileStatusEdit(A0_3)
  local L1_4, L2_5
  L1_4 = _UPVALUE0_
  L1_4 = L1_4.FAILURE
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L2_5 = A0_3["L2BandWidthProfileStatus.Status"]
  if L2_5 == _UPVALUE0_.NIL or L2_5 ~= "0" and L2_5 ~= "1" then
    L1_4 = _UPVALUE0_.BAD_PARAMETER
    return L1_4
  end
  _UPVALUE1_.start()
  L1_4 = _UPVALUE2_.bridgeBandwidthProfileStatusModify(L2_5)
  if L1_4 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page BandwidthProfile.")
    _UPVALUE1_.abort()
    L1_4 = _UPVALUE0_.DB_OP_FAILED
    return L1_4
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  L1_4 = _UPVALUE3_.bandwidthHWOffloadHandler()
  if L1_4 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page BandwidthProfile.")
    _UPVALUE1_.abort()
    L1_4 = _UPVALUE0_.DB_OP_FAILED
    return L1_4
  end
  return L1_4
end
function bridgeBandwidthProfilesCreate(A0_6)
  local L1_7, L2_8, L3_9, L4_10, L5_11, L6_12, L7_13, L8_14
  L1_7 = _UPVALUE0_
  L1_7 = L1_7.FAILURE
  L2_8 = A0_6["L2BandWidthProfile.ProfileName"]
  L3_9 = A0_6["L2BandWidthProfile.Policy"]
  L4_10 = A0_6["L2BandWidthProfile.ProfileType"]
  L5_11 = A0_6["L2BandWidthProfile.Priority"]
  L6_12 = A0_6["L2BandWidthProfile.MinimumRate"]
  L7_13 = A0_6["L2BandWidthProfile.MaximumRate"]
  L8_14 = A0_6["L2BandWidthProfile.WANID"]
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_6["L2BandWidthProfile.ProfileName"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L2_8 = A0_6["L2BandWidthProfile.ProfileName"]
  if A0_6["L2BandWidthProfile.Policy"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L3_9 = A0_6["L2BandWidthProfile.Policy"]
  if A0_6["L2BandWidthProfile.ProfileType"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L4_10 = A0_6["L2BandWidthProfile.ProfileType"]
  if L4_10 == "0" then
    if A0_6["L2BandWidthProfile.Priority"] == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
    L5_11 = A0_6["L2BandWidthProfile.Priority"]
  else
    if A0_6["L2BandWidthProfile.MinimumRate"] == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
    L6_12 = A0_6["L2BandWidthProfile.MinimumRate"]
    if A0_6["L2BandWidthProfile.MaximumRate"] == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
    L7_13 = A0_6["L2BandWidthProfile.MaximumRate"]
  end
  if A0_6["L2BandWidthProfile.WANID"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L8_14 = A0_6["L2BandWidthProfile.WANID"]
  _UPVALUE1_.start()
  L1_7 = _UPVALUE2_.bridgeBandwidthProfileAdd(L2_8, L3_9, L4_10, L5_11, L6_12, L7_13, L8_14)
  if L1_7 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in deleting the profiles.")
    _UPVALUE1_.abort()
    return L1_7
  end
  L1_7 = _UPVALUE0_.SUCCESS
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_7
end
function bridgeBandwidthProfilesInfoGetAll()
  local L0_15, L1_16
  L0_15 = _UPVALUE0_
  L0_15 = L0_15.FAILURE
  L1_16 = {}
  L0_15, L1_16 = _UPVALUE1_.bridgeBandwidthProfileInfoGetAll()
  if L0_15 ~= _UPVALUE0_.SUCCESS then
    return L0_15, L1_16
  end
  return L0_15, L1_16
end
function bridgeBandwidthProfilesEdit(A0_17)
  local L1_18, L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26
  L1_18 = _UPVALUE0_
  L1_18 = L1_18.FAILURE
  L2_19 = A0_17["L2BandWidthProfile.ProfileName"]
  L3_20 = A0_17["L2BandWidthProfile.Policy"]
  L4_21 = A0_17["L2BandWidthProfile.ProfileType"]
  L5_22 = A0_17["L2BandWidthProfile.Priority"]
  L6_23 = A0_17["L2BandWidthProfile.MinimumRate"]
  L7_24 = A0_17["L2BandWidthProfile.MaximumRate"]
  L8_25 = A0_17["L2BandWidthProfile.WANID"]
  L9_26 = A0_17["L2BandWidthProfile.cookie"]
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page.")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_17["L2BandWidthProfile.ProfileName"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L2_19 = A0_17["L2BandWidthProfile.ProfileName"]
  if A0_17["L2BandWidthProfile.Policy"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L3_20 = A0_17["L2BandWidthProfile.Policy"]
  if A0_17["L2BandWidthProfile.ProfileType"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L4_21 = A0_17["L2BandWidthProfile.ProfileType"]
  if L4_21 == "0" then
    if A0_17["L2BandWidthProfile.Priority"] == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
    L5_22 = A0_17["L2BandWidthProfile.Priority"]
  else
    if A0_17["L2BandWidthProfile.MinimumRate"] == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
    L6_23 = A0_17["L2BandWidthProfile.MinimumRate"]
    if A0_17["L2BandWidthProfile.MaximumRate"] == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
    L7_24 = A0_17["L2BandWidthProfile.MaximumRate"]
  end
  if A0_17["L2BandWidthProfile.cookie"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L9_26 = A0_17["L2BandWidthProfile.cookie"]
  if A0_17["L2BandWidthProfile.WANID"] == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L8_25 = A0_17["L2BandWidthProfile.WANID"]
  _UPVALUE1_.start()
  L1_18 = _UPVALUE2_.bridgeBandwidthProfileSet(L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26)
  if L1_18 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in deleting the profiles.")
    _UPVALUE1_.abort()
    return L1_18
  end
  L1_18 = _UPVALUE0_.SUCCESS
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_18
end
function bridgeBandwidthProfileGet(A0_27)
  local L1_28, L2_29, L3_30, L4_31
  L1_28 = {}
  L2_29 = {}
  L3_30 = _UPVALUE0_
  L3_30 = L3_30.NIL
  L4_31 = _UPVALUE0_
  L4_31 = L4_31.FAILURE
  if A0_27 == _UPVALUE0_.NIL then
    L4_31 = _UPVALUE0_.BAD_PARAMETER
    return L4_31, L1_28, L2_29, L3_30
  end
  L4_31, L1_28 = _UPVALUE1_.bridgeBandwidthProfileInfoGet(A0_27)
  if L4_31 ~= _UPVALUE0_.SUCCESS then
    return L4_31, L1_28
  end
  return L4_31, L1_28
end
function bridgeBandwidthProfilesDelete(A0_32)
  local L1_33
  L1_33 = _UPVALUE0_
  L1_33 = L1_33.FAILURE
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_32 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L1_33 = _UPVALUE2_.bridgeDeleteAvailableProfiles(A0_32)
  if L1_33 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in deleting the profiles.")
    _UPVALUE1_.abort()
    return L1_33
  end
  L1_33 = _UPVALUE0_.SUCCESS
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L1_33
end
