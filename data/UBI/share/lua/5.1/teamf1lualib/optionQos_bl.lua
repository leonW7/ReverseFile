local L0_0
L0_0 = module
L0_0("com.teamf1.bl.qos.optionQos", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wanqos_bandwidthMonitor")
L0_0 = require
L0_0("teamf1lualib/wanqos_bandwidthLimit")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/bl_trafficSelectors")
L0_0 = require
L0_0("teamf1lualib/qos_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
;({}).profile = "QueueName"
;({}).priority = "HTBClassPrecedence"
;({}).maxBandwidth = "HTBShapingRateMax"
;({}).minBandwidth = "HTBShapingRate"
;({}).wanPort = "ProfileKey"
function optionQosbandwidthLimitFeatureGet()
  local L0_1, L1_2, L2_3
  L1_2, L2_3, L0_1 = _UPVALUE0_.isfeatureEnabled()
  if L1_2 ~= _UPVALUE1_.SUCCESS then
    return L1_2
  end
  return _UPVALUE1_.SUCCESS, L2_3, L0_1
end
function optionQosbandwidthLimitFeatureSet(A0_4)
  local L1_5, L2_6, L3_7, L4_8, L5_9, L6_10
  L1_5 = ACCESS_LEVEL
  if L1_5 ~= 0 then
    L1_5 = util
    L1_5 = L1_5.appendDebugOut
    L2_6 = "Detected Unauthorized access for page optionQos"
    L1_5(L2_6)
    L1_5 = _UPVALUE0_
    L1_5 = L1_5.UNAUTHORIZED
    return L1_5
  end
  L1_5, L2_6 = nil, nil
  L3_7 = A0_4["optionQos.feature"]
  L4_8 = _UPVALUE1_
  L4_8 = L4_8.start
  L4_8()
  L4_8 = _UPVALUE2_
  if L3_7 == L4_8 then
    L4_8 = _UPVALUE3_
    L4_8 = L4_8.featureEnable
    L5_9 = L4_8()
    L2_6 = L5_9
    L1_5 = L4_8
  else
    L4_8 = _UPVALUE3_
    L4_8 = L4_8.featureDisable
    L5_9 = L4_8()
    L2_6 = L5_9
    L1_5 = L4_8
  end
  L4_8 = _UPVALUE0_
  L4_8 = L4_8.SUCCESS
  if L1_5 ~= L4_8 then
    L4_8 = util
    L4_8 = L4_8.appendDebugOut
    L5_9 = "Error in configuring values in page optionQos"
    L6_10 = L1_5
    L5_9 = L5_9 .. L6_10
    L4_8(L5_9)
    L4_8 = _UPVALUE1_
    L4_8 = L4_8.abort
    L4_8()
    L4_8 = L1_5
    L5_9 = L2_6
    return L4_8, L5_9
  end
  L4_8 = _UPVALUE1_
  L4_8 = L4_8.complete
  L4_8()
  L4_8 = _UPVALUE1_
  L4_8 = L4_8.save
  L4_8()
  L4_8 = "/pfrm2.0/etc/hardwareOffload.lua"
  L5_9 = "/tmp/system.db"
  L6_10 = "/pfrm2.0/bin/lua "
  L6_10 = L6_10 .. L4_8 .. " " .. L5_9
  util.appendDebugOut("Exec: " .. os.execute(L6_10))
  return _UPVALUE0_.SUCCESS, L2_6
end
function optionQosbandwidthLimitSectionGet()
  local L0_11, L1_12, L2_13, L3_14, L4_15, L5_16
  L0_11, L5_16, L1_12, L2_13, L3_14, L4_15 = _UPVALUE0_.bandwidthLimitGet()
  if L0_11 ~= _UPVALUE1_.SUCCESS then
    return L0_11
  end
  return L0_11, L5_16, L1_12, L2_13, L3_14, L4_15
end
function optionQosbandwidthLimitSectionSet(A0_17)
  local L1_18, L2_19, L3_20, L4_21, L5_22, L6_23
  L1_18 = ACCESS_LEVEL
  if L1_18 ~= 0 then
    L1_18 = util
    L1_18 = L1_18.appendDebugOut
    L2_19 = "Detected Unauthorized access for page optionQos"
    L1_18(L2_19)
    L1_18 = _UPVALUE0_
    L1_18 = L1_18.UNAUTHORIZED
    return L1_18
  end
  L1_18 = A0_17["optionQos.wan1UpStreamLimit"]
  L2_19 = A0_17["optionQos.wan1DownStreamLimit"]
  L3_20 = A0_17["optionQos.wan2UpStreamLimit"]
  L4_21 = A0_17["optionQos.wan2DownStreamLimit"]
  L5_22 = _UPVALUE0_
  L5_22 = L5_22.NIL
  if L1_18 ~= L5_22 then
    L5_22 = _UPVALUE0_
    L5_22 = L5_22.NIL
    if L2_19 ~= L5_22 then
      L5_22 = _UPVALUE0_
      L5_22 = L5_22.NIL
      if L3_20 ~= L5_22 then
        L5_22 = _UPVALUE0_
        L5_22 = L5_22.NIL
      end
    end
  elseif L4_21 == L5_22 then
    L5_22 = util
    L5_22 = L5_22.appendDebugOut
    L6_23 = "GetNext : Invalid Cookie"
    L5_22(L6_23)
    L5_22 = _UPVALUE0_
    L5_22 = L5_22.BAD_PARAMETER
    return L5_22
  end
  L5_22, L6_23 = nil, nil
  L6_23 = "1"
  _UPVALUE1_.start()
  L5_22 = _UPVALUE2_.bandwidthLimitSet(L1_18, L2_19, L3_20, L4_21)
  if L5_22 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page optionQos" .. L5_22)
    _UPVALUE1_.abort()
    return L5_22, L6_23
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L6_23
end
function optionQosbandwidthMonitorSectionGet()
  local L0_24, L1_25, L2_26, L3_27, L4_28, L5_29, L6_30
  L0_24, L6_30, L1_25, L2_26, L3_27, L4_28, L5_29 = _UPVALUE0_.bandwidthProfileGet()
  if L0_24 ~= _UPVALUE1_.SUCCESS then
    return L0_24
  end
  return L0_24, L6_30, L1_25, L5_29, L3_27, L4_28, L2_26
end
function optionQosbandwidthMonitorSectionGetNext(A0_31)
  local L1_32, L2_33, L3_34, L4_35, L5_36, L6_37, L7_38, L8_39
  L1_32 = A0_31["optionQos.cookie"]
  L2_33 = _UPVALUE0_
  L2_33 = L2_33.NIL
  if L1_32 == L2_33 then
    L2_33 = util
    L2_33 = L2_33.appendDebugOut
    L3_34 = "GetNext : Invalid Cookie"
    L2_33(L3_34)
    L2_33 = _UPVALUE0_
    L2_33 = L2_33.BAD_PARAMETER
    return L2_33
  end
  L2_33, L3_34, L4_35, L5_36, L6_37, L7_38, L8_39 = nil, nil, nil, nil, nil, nil, nil
  L2_33, L8_39, L3_34, L4_35, L5_36, L6_37, L7_38 = _UPVALUE1_.bandwidthProfileGetNextNext(L1_32)
  if L2_33 ~= _UPVALUE0_.SUCCESS then
    return L2_33
  end
  return L2_33, L8_39, L3_34, L7_38, L5_36, L6_37, L4_35
end
function optionQosbandwidthMonitorSectionSet(A0_40)
  local L1_41, L2_42, L3_43, L4_44, L5_45, L6_46, L7_47
  L1_41 = ACCESS_LEVEL
  if L1_41 ~= 0 then
    L1_41 = util
    L1_41 = L1_41.appendDebugOut
    L2_42 = "Detected Unauthorized access for page optionQos"
    L1_41(L2_42)
    L1_41 = _UPVALUE0_
    L1_41 = L1_41.UNAUTHORIZED
    return L1_41
  end
  L1_41 = A0_40["optionQos.cookie"]
  L2_42 = A0_40["optionQos.wanPort"]
  L3_43 = A0_40["optionQos.maxBandwidth"]
  L4_44 = A0_40["optionQos.minBandwidth"]
  L5_45 = A0_40["optionQos.priority"]
  L6_46 = _UPVALUE0_
  L6_46 = L6_46.NIL
  if L1_41 == L6_46 then
    L6_46 = util
    L6_46 = L6_46.appendDebugOut
    L7_47 = "Set : Invalid Cookie"
    L6_46(L7_47)
    L6_46 = _UPVALUE0_
    L6_46 = L6_46.BAD_PARAMETER
    return L6_46
  end
  L6_46 = _UPVALUE0_
  L6_46 = L6_46.NIL
  if L2_42 ~= L6_46 then
    L6_46 = _UPVALUE0_
    L6_46 = L6_46.NIL
    if L3_43 ~= L6_46 then
      L6_46 = _UPVALUE0_
      L6_46 = L6_46.NIL
      if L4_44 ~= L6_46 then
        L6_46 = _UPVALUE0_
        L6_46 = L6_46.NIL
      end
    end
  elseif L5_45 == L6_46 then
    L6_46 = util
    L6_46 = L6_46.appendDebugOut
    L7_47 = "GetNext : Invalid Cookie"
    L6_46(L7_47)
    L6_46 = _UPVALUE0_
    L6_46 = L6_46.BAD_PARAMETER
    return L6_46
  end
  L6_46, L7_47 = nil, nil
  _UPVALUE1_.start()
  L6_46, L7_47 = _UPVALUE2_.bandwidthProfileSet(L1_41, L5_45, L3_43, L4_44, L2_42)
  if L6_46 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page optionQos" .. L6_46)
    _UPVALUE1_.abort()
    return L6_46, L1_41
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L7_47
end
function optionQosbandwidthMonitorSectionCreate(A0_48)
  local L1_49, L2_50, L3_51, L4_52, L5_53, L6_54, L7_55, L8_56, L9_57, L10_58
  L1_49 = ACCESS_LEVEL
  if L1_49 ~= 0 then
    L1_49 = util
    L1_49 = L1_49.appendDebugOut
    L2_50 = "Detected Unauthorized access for page optionQos"
    L1_49(L2_50)
    L1_49 = _UPVALUE0_
    L1_49 = L1_49.UNAUTHORIZED
    return L1_49
  end
  L1_49 = A0_48["optionQos.profile"]
  L2_50 = A0_48["optionQos.wanPort"]
  L3_51 = A0_48["optionQos.maxBandwidth"]
  L4_52 = A0_48["optionQos.minBandwidth"]
  L5_53 = A0_48["optionQos.priority"]
  L6_54 = _UPVALUE0_
  L6_54 = L6_54.NIL
  if L1_49 ~= L6_54 then
    L6_54 = _UPVALUE0_
    L6_54 = L6_54.NIL
    if L2_50 ~= L6_54 then
      L6_54 = _UPVALUE0_
      L6_54 = L6_54.NIL
      if L3_51 ~= L6_54 then
        L6_54 = _UPVALUE0_
        L6_54 = L6_54.NIL
        if L4_52 ~= L6_54 then
          L6_54 = _UPVALUE0_
          L6_54 = L6_54.NIL
        end
      end
    end
  elseif L5_53 == L6_54 then
    L6_54 = util
    L6_54 = L6_54.appendDebugOut
    L7_55 = "GetNext : Invalid Cookie"
    L6_54(L7_55)
    L6_54 = _UPVALUE0_
    L6_54 = L6_54.BAD_PARAMETER
    return L6_54
  end
  L6_54, L7_55 = nil, nil
  L8_56 = _UPVALUE1_
  L8_56 = L8_56.start
  L8_56()
  L8_56 = _UPVALUE2_
  L8_56 = L8_56.bandwidthProfileCreate
  L9_57 = L1_49
  L10_58 = L5_53
  L9_57 = L8_56(L9_57, L10_58, L3_51, L4_52, L2_50)
  L7_55 = L9_57
  L6_54 = L8_56
  L8_56 = _UPVALUE0_
  L8_56 = L8_56.SUCCESS
  if L6_54 ~= L8_56 then
    L8_56 = util
    L8_56 = L8_56.appendDebugOut
    L9_57 = "Error in configuring values in page optionQos"
    L10_58 = L6_54
    L9_57 = L9_57 .. L10_58
    L8_56(L9_57)
    L8_56 = _UPVALUE1_
    L8_56 = L8_56.abort
    L8_56()
    L8_56 = L6_54
    L9_57 = 0
    return L8_56, L9_57
  end
  L8_56 = _UPVALUE1_
  L8_56 = L8_56.complete
  L8_56()
  L8_56 = _UPVALUE1_
  L8_56 = L8_56.save
  L8_56()
  L8_56 = "/pfrm2.0/etc/hardwareOffload.lua"
  L9_57 = "/tmp/system.db"
  L10_58 = "/pfrm2.0/bin/lua "
  L10_58 = L10_58 .. L8_56 .. " " .. L9_57
  util.appendDebugOut("Exec: " .. os.execute(L10_58))
  return _UPVALUE0_.SUCCESS, L7_55
end
function optionQosbandwidthMonitorSectionDelete(A0_59)
  local L1_60, L2_61, L3_62, L4_63, L5_64, L6_65, L7_66, L8_67, L9_68
  L1_60 = ACCESS_LEVEL
  if L1_60 ~= 0 then
    L1_60 = util
    L1_60 = L1_60.appendDebugOut
    L2_61 = "Detected Unauthorized access for page optionQos PAGE"
    L1_60(L2_61)
    L1_60 = _UPVALUE0_
    L1_60 = L1_60.UNAUTHORIZED
    return L1_60
  end
  L1_60 = A0_59["optionQos.cookie"]
  L2_61 = _UPVALUE0_
  L2_61 = L2_61.NIL
  if L1_60 == L2_61 then
    L2_61 = util
    L2_61 = L2_61.appendDebugOut
    L3_62 = "Set : Invalid Cookie"
    L2_61(L3_62)
    L2_61 = _UPVALUE0_
    L2_61 = L2_61.BAD_PARAMETER
    return L2_61
  end
  L2_61 = optionQosbandwidthMonitorSectionGetCur
  L3_62 = L1_60
  L8_67 = L2_61(L3_62)
  L9_68 = isProfileInUse
  L9_68 = L9_68(L4_63)
  L2_61 = L9_68
  L9_68 = _UPVALUE1_
  L9_68 = L9_68.PROFILE_IS_NOTIN_USE
  if L2_61 ~= L9_68 then
    return L2_61
  end
  L9_68 = nil
  _UPVALUE2_.start()
  L9_68, L3_62 = _UPVALUE3_.bandwidthProfileDelete(L1_60)
  if L9_68 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page optionQos PAGE" .. L9_68)
    _UPVALUE2_.abort()
    return L9_68, L1_60
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return _UPVALUE0_.SUCCESS, L3_62
end
function optionQosbandwidthMonitorSectionGetAll()
  local L0_69, L1_70
  L1_70 = {}
  L0_69, L1_70 = _UPVALUE0_.bwProfileGetAll()
  for _FORV_5_, _FORV_6_ in pairs(L1_70) do
    L1_70[_FORV_5_][_UPVALUE1_.wanPort] = _UPVALUE2_[tonumber(L1_70[_FORV_5_][_UPVALUE1_.wanPort])]
    L1_70[_FORV_5_][_UPVALUE1_.priority] = _UPVALUE3_[tonumber(L1_70[_FORV_5_][_UPVALUE1_.priority]) + 1]
  end
  if L0_69 ~= _UPVALUE4_.SUCCESS then
    return L0_69
  end
  return L0_69, L1_70
end
function optionQosbandwidthMonitorSectionGetCur(A0_71)
  local L1_72, L2_73, L3_74, L4_75, L5_76, L6_77, L7_78
  L2_73 = {}
  L3_74 = _UPVALUE0_
  L3_74 = L3_74.bwProfileGetRow
  L4_75 = A0_71
  L4_75 = L3_74(L4_75)
  L2_73 = L4_75
  L1_72 = L3_74
  L3_74 = _UPVALUE1_
  L3_74 = L3_74.SUCCESS
  if L1_72 ~= L3_74 then
    return L1_72
  end
  L3_74, L4_75, L5_76, L6_77, L7_78 = nil, nil, nil, nil, nil
  L3_74 = L2_73[_UPVALUE2_ .. "." .. _UPVALUE3_.profile]
  L4_75 = L2_73[_UPVALUE2_ .. "." .. _UPVALUE3_.priority]
  L5_76 = L2_73[_UPVALUE2_ .. "." .. _UPVALUE3_.maxBandwidth]
  L6_77 = L2_73[_UPVALUE2_ .. "." .. _UPVALUE3_.minBandwidth]
  L7_78 = L2_73[_UPVALUE2_ .. "." .. _UPVALUE3_.wanPort]
  L4_75 = _UPVALUE4_[tonumber(L4_75) + 1]
  L7_78 = _UPVALUE5_[tonumber(L7_78)]
  return L1_72, A0_71, L3_74, L7_78, L5_76, L6_77, L4_75
end
function optionQosbandwidthMonitorSectionDeleteAll()
  local L0_79, L1_80, L2_81
  L0_79 = ACCESS_LEVEL
  if L0_79 ~= 0 then
    L0_79 = util
    L0_79 = L0_79.appendDebugOut
    L1_80 = "Detected Unauthorized access for page optionQos PAGE"
    L0_79(L1_80)
    L0_79 = _UPVALUE0_
    L0_79 = L0_79.UNAUTHORIZED
    return L0_79
  end
  L0_79 = _UPVALUE1_
  L0_79 = L0_79.start
  L0_79()
  L0_79 = _UPVALUE2_
  L0_79 = L0_79.bwProfileGetAll
  L1_80 = L0_79()
  L2_81 = nil
  for _FORV_6_, _FORV_7_ in pairs(L1_80) do
    errorCode = isProfileInUse(L1_80[_FORV_6_].QueueName)
    if errorCode ~= _UPVALUE3_.PROFILE_IS_NOTIN_USE then
      return errorCode
    end
    L0_79, L2_81 = _UPVALUE2_.bandwidthProfileDelete(L1_80[_FORV_6_].QueueKey)
    if L0_79 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in DeleteAll Operaion in page optionQos PAGE" .. L0_79)
      _UPVALUE1_.abort()
      return L0_79
    end
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function isProfileInUse(A0_82)
  local L1_83, L2_84
  L1_83 = _UPVALUE0_
  L1_83 = L1_83.trafficSelectorRuleGetAll
  L2_84 = L1_83()
  for _FORV_6_, _FORV_7_ in pairs(L2_84) do
    if L2_84[_FORV_6_].queueName == A0_82 then
      return _UPVALUE1_.PROFILE_IS_IN_USE
    end
  end
  return _UPVALUE1_.PROFILE_IS_NOTIN_USE
end
