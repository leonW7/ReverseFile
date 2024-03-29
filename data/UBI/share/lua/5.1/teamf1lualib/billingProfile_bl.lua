local L0_0
L0_0 = module
L0_0("com.teamf1.bl.captiveportal.billing", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/captiveportal_billing")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
NIL = nil
FALSE = false
ENABLE = "1"
DISABLE = "0"
STR_ACCOUNT_CREATED = "account-creation"
STR_ACCOUNT_LOGIN = "account-login"
STR_CUSTOM_START = "custom-start"
INT_ACCOUNT_CREATED = 0
INT_ACCOUNT_LOGIN = 1
INT_CUSTOM_START = 2
INT_TRAFFIC_MB = 2
INT_TRAFFIC_GB = 3
INT_HOUR = 0
INT_DAY = 1
INT_MB = 2
INT_GB = 3
UNIT = 1
THREE_UNIT = 3
function billingProfileGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26, L26_27, L27_28
  L24_25 = INT_HOUR
  if L9_10 == L24_25 then
    L23_24 = HOUR
  else
    L24_25 = INT_DAY
    if L9_10 == L24_25 then
      L23_24 = DAY
    else
      L24_25 = INT_MB
      if L9_10 == L24_25 then
        L23_24 = MB
      else
        L24_25 = INT_GB
        if L9_10 == L24_25 then
          L23_24 = GB
        end
      end
    end
  end
  L24_25 = nil
  L25_26 = INT_ACCOUNT_CREATED
  if L12_13 == L25_26 then
    L24_25 = ACCOUNT_CREATED
  else
    L25_26 = INT_ACCOUNT_LOGIN
    if L12_13 == L25_26 then
      L24_25 = ACCOUNT_LOGIN
    else
      L25_26 = INT_CUSTOM_START
      if L12_13 == L25_26 then
        L24_25 = CUSTOM_START
      end
    end
  end
  L25_26 = nil
  L26_27 = INT_HOUR
  if L22_23 == L26_27 then
    L25_26 = HOUR
  else
    L26_27 = INT_DAY
    if L22_23 == L26_27 then
      L25_26 = DAY
    end
  end
  L26_27 = nil
  L27_28 = INT_HOUR
  if L18_19 == L27_28 then
    L26_27 = HOUR
  else
    L27_28 = INT_DAY
    if L18_19 == L27_28 then
      L26_27 = DAY
    end
  end
  L27_28 = nil
  if L16_17 == INT_TRAFFIC_MB then
    L27_28 = TRAFFIC_MB
  elseif L16_17 == INT_TRAFFIC_GB then
    L27_28 = TRAFFIC_GB
  end
  L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23 = _UPVALUE0_.billingProfileGet()
  if L0_1 ~= SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23
end
function billingProfileGetNext(A0_29)
  local L1_30, L2_31, L3_32, L4_33, L5_34, L6_35, L7_36, L8_37, L9_38, L10_39, L11_40, L12_41, L13_42, L14_43, L15_44, L16_45, L17_46, L18_47, L19_48, L20_49, L21_50, L22_51, L23_52, L24_53, L25_54, L26_55, L27_56, L28_57, L29_58
  L1_30 = A0_29["billingProfile.cookie"]
  if L1_30 == nil then
    L2_31 = util
    L2_31 = L2_31.appendDebugOut
    L3_32 = "GetNext : Invalid Cookie"
    L2_31(L3_32)
    L2_31 = _UPVALUE0_
    L2_31 = L2_31.BAD_PARAMETER
    return L2_31
  end
  L2_31, L3_32, L4_33, L5_34, L6_35, L7_36, L8_37, L9_38, L10_39, L11_40, L12_41, L13_42, L14_43, L15_44, L16_45, L17_46, L18_47, L19_48, L20_49, L21_50, L22_51, L23_52, L24_53 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L25_54 = _UPVALUE1_
  L25_54 = L25_54.billingProfileGetNext
  L8_37, L9_38, L10_39, L11_40, L12_41, L13_42, L14_43, L15_44, L16_45, L17_46, L18_47, L19_48, L20_49, L21_50, L22_51, L23_52, L24_53, L25_54 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, L25_54()
  L8_37, L9_38, L10_39, L11_40, L12_41, L13_42, L14_43, L15_44, L16_45, L17_46, L18_47, L19_48, L20_49, L21_50, L22_51, L23_52, L24_53, L26_55 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, L25_54()
  L8_37, L9_38, L10_39, L11_40, L12_41, L13_42, L14_43, L15_44, L16_45, L17_46, L18_47, L19_48, L20_49, L21_50, L22_51, L23_52, L24_53, L27_56 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, L25_54()
  L8_37, L9_38, L10_39, L11_40, L12_41, L13_42, L14_43, L15_44, L16_45, L17_46, L18_47, L19_48, L20_49, L21_50, L22_51, L23_52, L24_53, L28_57 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, L25_54()
  L8_37, L9_38, L10_39, L11_40, L12_41, L13_42, L14_43, L15_44, L16_45, L17_46, L18_47, L19_48, L20_49, L21_50, L22_51, L23_52, L24_53, L29_58 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, L25_54()
  L7_36 = L29_58
  L6_35 = L28_57
  L5_34 = L27_56
  L4_33 = L26_55
  L3_32 = L25_54
  L25_54 = SUCCESS
  if L2_31 ~= L25_54 then
    return L2_31
  end
  L25_54 = nil
  L26_55 = INT_HOUR
  if L11_40 == L26_55 then
    L25_54 = HOUR
  else
    L26_55 = INT_DAY
    if L11_40 == L26_55 then
      L25_54 = DAY
    else
      L26_55 = INT_MB
      if L11_40 == L26_55 then
        L25_54 = MB
      else
        L26_55 = INT_GB
        if L11_40 == L26_55 then
          L25_54 = GB
        end
      end
    end
  end
  L26_55 = nil
  L27_56 = INT_ACCOUNT_CREATED
  if L14_43 == L27_56 then
    L26_55 = ACCOUNT_CREATED
  else
    L27_56 = INT_ACCOUNT_LOGIN
    if L14_43 == L27_56 then
      L26_55 = ACCOUNT_LOGIN
    else
      L27_56 = INT_CUSTOM_START
      if L14_43 == L27_56 then
        L26_55 = CUSTOM_START
      end
    end
  end
  L27_56 = nil
  L28_57 = INT_HOUR
  if L24_53 == L28_57 then
    L27_56 = HOUR
  else
    L28_57 = INT_DAY
    if L24_53 == L28_57 then
      L27_56 = DAY
    end
  end
  L28_57 = nil
  L29_58 = INT_HOUR
  if L20_49 == L29_58 then
    L28_57 = HOUR
  else
    L29_58 = INT_DAY
    if L20_49 == L29_58 then
      L28_57 = DAY
    end
  end
  L29_58 = nil
  if L18_47 == INT_TRAFFIC_MB then
    L29_58 = TRAFFIC_MB
  elseif L18_47 == INT_TRAFFIC_GB then
    L29_58 = TRAFFIC_GB
  end
  return L2_31, L3_32, L4_33, L5_34, L6_35, L7_36, L8_37, L9_38, L10_39, L25_54, L12_41, L13_42, L26_55, L15_44, L16_45, L17_46, L29_58, L19_48, L28_57, L21_50, L22_51, L23_52, L27_56
end
function profileSet(A0_59)
  local L1_60, L2_61, L3_62, L4_63, L5_64, L6_65, L7_66, L8_67, L9_68, L10_69, L11_70, L12_71, L13_72, L14_73, L15_74, L16_75, L17_76, L18_77, L19_78, L20_79, L21_80, L22_81, L23_82, L24_83, L25_84, L26_85
  L1_60 = A0_59["profileTable.cookie"]
  L2_61 = A0_59["profileTable.profile"]
  L3_62 = A0_59["profileTable.description"]
  L4_63 = A0_59["profileTable.multiLogin"]
  L5_64 = A0_59["profileTable.customizedAccount"]
  L6_65 = A0_59["profileTable.batchGeneration"]
  L7_66 = A0_59["profileTable.sessionTimeout"]
  L8_67 = A0_59["profileTable.alertLimit"]
  L9_68 = A0_59["profileTable.alertType"]
  L10_69 = A0_59["profileTable.timed"]
  L11_70 = A0_59["profileTable.timeLimit"]
  L12_71 = A0_59["profileTable.startType"]
  L13_72 = A0_59["profileTable.customStartTime"]
  L14_73 = A0_59["profileTable.customizeTime"]
  L15_74 = A0_59["profileTable.maxTrafficUsage"]
  L16_75 = A0_59["profileTable.trafficUsageType"]
  L17_76 = A0_59["profileTable.maxUsageTime"]
  L18_77 = A0_59["profileTable.usageTimeType"]
  L19_78 = A0_59["profileTable.customizeUsage"]
  L20_79 = A0_59["profileTable.maxUsageTimeCheck"]
  L21_80 = A0_59["profileTable.maxTrafficUsageCheck"]
  L22_81 = A0_59["profileTable.timeType"]
  L23_82 = A0_59["profileTable.setPriceEnable"]
  L24_83 = A0_59["profileTable.price"]
  L25_84 = A0_59["profileTable.currency"]
  if L1_60 == nil then
    L26_85 = util
    L26_85 = L26_85.appendDebugOut
    L26_85("Set : Invalid Cookie")
    L26_85 = _UPVALUE0_
    L26_85 = L26_85.BAD_PARAMETER
    return L26_85
  end
  L26_85 = nil
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page bilingProfile")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if L9_68 ~= NIL then
    L9_68 = L9_68 - UNIT
  end
  if L12_71 ~= NIL then
    L12_71 = L12_71 - UNIT
  end
  if L22_81 ~= NIL then
    L22_81 = L22_81 - UNIT
  end
  if L18_77 ~= NIL then
    L18_77 = L18_77 - UNIT
  end
  if L16_75 ~= NIL then
    L16_75 = L16_75 - UNIT
  end
  if L9_68 == HOUR then
  elseif L9_68 == DAY then
  elseif L9_68 == MB then
  else
  end
  if L12_71 == ACCOUNT_CREATED then
  elseif L12_71 == ACCOUNT_LOGIN then
  else
  end
  if L22_81 == HOUR then
  else
  end
  if L18_77 == HOUR then
  else
  end
  if L16_75 == TRAFFIC_MB then
  else
  end
  _UPVALUE1_.start()
  L26_85, cookie = _UPVALUE2_.billingProfileSet(L1_60, L2_61, L3_62, L4_63, L5_64, L6_65, L7_66, L8_67, L9_68, L10_69, L11_70, L12_71, L13_72, L14_73, L15_74, L16_75, L17_76, L18_77, L19_78, L20_79, L21_80, L22_81, L23_82, L24_83, L25_84)
  if L26_85 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page Billing Profile " .. L26_85)
    _UPVALUE1_.abort()
    return L26_85, L1_60
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function profileCreate(A0_86)
  local L1_87, L2_88, L3_89, L4_90, L5_91, L6_92, L7_93, L8_94, L9_95, L10_96, L11_97, L12_98, L13_99, L14_100, L15_101, L16_102, L17_103, L18_104, L19_105, L20_106, L21_107, L22_108, L23_109, L24_110, L25_111
  L1_87 = A0_86["profileTable.profile"]
  L2_88 = A0_86["profileTable.description"]
  L3_89 = A0_86["profileTable.multiLogin"]
  L4_90 = A0_86["profileTable.customizedAccount"]
  L5_91 = A0_86["profileTable.batchGeneration"]
  L6_92 = A0_86["profileTable.sessionTimeout"]
  L7_93 = A0_86["profileTable.alertLimit"]
  L8_94 = A0_86["profileTable.alertType"]
  L9_95 = A0_86["profileTable.timed"]
  L10_96 = A0_86["profileTable.timeLimit"]
  L11_97 = A0_86["profileTable.startType"]
  L12_98 = A0_86["profileTable.customStartTime"]
  L13_99 = A0_86["profileTable.customizeTime"]
  L14_100 = A0_86["profileTable.maxTrafficUsage"]
  L15_101 = A0_86["profileTable.trafficUsageType"]
  L16_102 = A0_86["profileTable.maxUsageTime"]
  L17_103 = A0_86["profileTable.usageTimeType"]
  L18_104 = A0_86["profileTable.customizeUsage"]
  L19_105 = A0_86["profileTable.maxUsageTimeCheck"]
  L20_106 = A0_86["profileTable.maxTrafficUsageCheck"]
  L21_107 = A0_86["profileTable.timeType"]
  L22_108 = A0_86["profileTable.setPriceEnable"]
  L23_109 = A0_86["profileTable.price"]
  L24_110 = A0_86["profileTable.currency"]
  L25_111 = nil
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page bilingProfile")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if L8_94 ~= NIL then
    L8_94 = L8_94 - UNIT
  end
  if L11_97 ~= NIL then
    L11_97 = L11_97 - UNIT
  end
  if L21_107 ~= NIL then
    L21_107 = L21_107 - UNIT
  end
  if L17_103 ~= NIL then
    L17_103 = L17_103 - UNIT
  end
  if L15_101 ~= NIL then
    L15_101 = L15_101 - UNIT
  end
  if L8_94 == HOUR then
  elseif L8_94 == DAY then
  elseif L8_94 == MB then
  else
  end
  if L11_97 == ACCOUNT_CREATED then
  elseif L11_97 == ACCOUNT_LOGIN then
  else
  end
  if L21_107 == HOUR then
  else
  end
  if L17_103 == HOUR then
  else
  end
  if L15_101 == TRAFFIC_MB then
  else
  end
  _UPVALUE1_.start()
  L25_111, cookie = _UPVALUE2_.billingProfileCreate(L1_87, L2_88, L3_89, L4_90, L5_91, L6_92, L7_93, L8_94, L9_95, L10_96, L11_97, L12_98, L13_99, L14_100, L15_101, L16_102, L17_103, L18_104, L19_105, L20_106, L21_107, L22_108, L23_109, L24_110)
  if L25_111 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page Billing Profile " .. L25_111)
    _UPVALUE1_.abort()
    return L25_111, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function profileDelete(A0_112)
  local L1_113, L2_114
  L2_114 = ACCESS_LEVEL
  if L2_114 ~= 0 then
    L2_114 = util
    L2_114 = L2_114.appendDebugOut
    L2_114("Detected Unauthorized access for page Billing Profile Page")
    L2_114 = _UPVALUE0_
    L2_114 = L2_114.UNAUTHORIZED
    return L2_114
  end
  L2_114 = A0_112["profileTable.cookie"]
  if L2_114 == nil then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L1_113, cookie = _UPVALUE2_.billingProfileDelete(L2_114)
  if L1_113 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page Billing Profile" .. L1_113)
    _UPVALUE1_.abort()
    return L1_113, L2_114
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function profileGetAll()
  local L0_115, L1_116
  L0_115 = _UPVALUE0_
  L0_115 = L0_115.billingProfilesGetAll
  L1_116 = L0_115()
  if L0_115 ~= _UPVALUE1_.SUCCESS then
    return L0_115
  end
  L1_116 = util.removePrefix(L1_116, "tempCPUserProfiles.")
  return _UPVALUE1_.SUCCESS, L1_116
end
function profileGetRow(A0_117)
  local L1_118, L2_119
  L2_119 = A0_117
  if L2_119 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_118, cookie, profileTable = _UPVALUE1_.billingProfileGetRow(L2_119)
  if L1_118 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, cookie, profileTable
end
function profileDeleteAll()
  local L0_120
  L0_120 = ACCESS_LEVEL
  if L0_120 ~= 0 then
    L0_120 = util
    L0_120 = L0_120.appendDebugOut
    L0_120("Detected Unauthorized access for page DUMMY PAGE")
    L0_120 = _UPVALUE0_
    L0_120 = L0_120.UNAUTHORIZED
    return L0_120
  end
  L0_120 = nil
  _UPVALUE1_.start()
  L0_120, cookie = _UPVALUE2_.billingProfileDeleteAll()
  if L0_120 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page Billing Profile" .. L0_120)
    _UPVALUE1_.abort()
    return L0_120
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, 0
end
function paymentGWProfileGetAll()
  local L0_121, L1_122, L2_123
  L0_121 = ""
  L1_122 = _UPVALUE0_
  L1_122 = L1_122.paymentGWProfilesGetAll
  L2_123 = L1_122()
  if L1_122 ~= _UPVALUE1_.SUCCESS then
    return L1_122
  end
  for _FORV_6_, _FORV_7_ in pairs(L2_123) do
    L0_121 = ""
    if L2_123[_FORV_6_].MaxUsageTimeCheck == "1" then
      L0_121 = "Time Usage"
    end
    if L2_123[_FORV_6_].MaxUsageTrafficCheck == "1" then
      if L0_121 ~= "" then
        L0_121 = L0_121 .. " + Traffic Usage"
      else
        L0_121 = " Traffic Usage"
      end
    end
    if L2_123[_FORV_6_].ValidDurationCheck == "1" then
      if L0_121 ~= "" then
        L0_121 = L0_121 .. " + Begin/End Duration"
      else
        L0_121 = " Begin/End Duration"
      end
    end
    L2_123[_FORV_6_].billingStatus = L0_121
  end
  return _UPVALUE1_.SUCCESS, L2_123
end
