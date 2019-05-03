local L0_0
L0_0 = module
L0_0("com.teamf1.bl.admin.intelamt", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/admin_intelAmt")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.admin.intelamt")
ENABLE = "1"
function intelAmtFeatureGet()
  local L0_1, L1_2, L2_3
  L0_1, L1_2, L2_3 = _UPVALUE0_.isfeatureEnabled()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3
end
function intelAmtFeatureSet(A0_4)
  local L1_5
  L1_5 = ACCESS_LEVEL
  if L1_5 ~= 0 then
    L1_5 = util
    L1_5 = L1_5.appendDebugOut
    L1_5("Detected Unauthorized access for page intelAmt")
    L1_5 = _UPVALUE0_
    L1_5 = L1_5.UNAUTHORIZED
    return L1_5
  end
  L1_5 = A0_4["intelAmt.cookie"]
  if L1_5 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if A0_4["intelAmt.Status"] == _UPVALUE0_.NIL then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  if A0_4["intelAmt.Status"] == ENABLE then
    returnCode, cookie = _UPVALUE2_.featureEnable(cookie)
  else
    returnCode, cookie = _UPVALUE2_.featureDisable(cookie)
  end
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page intelAmt" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode, L1_5
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
function intelAmtSectionGet()
  local L0_6, L1_7, L2_8, L3_9, L4_10
  L0_6, L1_7, L2_8, L3_9, L4_10 = _UPVALUE0_.intelAmtSetupGet()
  if L0_6 ~= _UPVALUE1_.SUCCESS then
    return L0_6
  end
  return L0_6, L1_7, L2_8, L3_9, L4_10
end
function intelAmtSectionSet(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17
  L1_12 = ACCESS_LEVEL
  if L1_12 ~= 0 then
    L1_12 = util
    L1_12 = L1_12.appendDebugOut
    L2_13 = "Detected Unauthorized access for page intelAmt"
    L1_12(L2_13)
    L1_12 = _UPVALUE0_
    L1_12 = L1_12.UNAUTHORIZED
    return L1_12
  end
  L1_12 = A0_11["intelAmt.cookie"]
  L2_13 = A0_11["intelAmt.wanHostType"]
  L3_14 = A0_11["intelAmt.wanHostAddresses"]
  L4_15 = A0_11["intelAmt.lanServerIpAddress"]
  L5_16 = _UPVALUE0_
  L5_16 = L5_16.NIL
  if L1_12 == L5_16 then
    L5_16 = util
    L5_16 = L5_16.appendDebugOut
    L6_17 = "Set : Invalid Cookie"
    L5_16(L6_17)
    L5_16 = _UPVALUE0_
    L5_16 = L5_16.BAD_PARAMETER
    return L5_16
  end
  L5_16 = _UPVALUE0_
  L5_16 = L5_16.NIL
  if L2_13 ~= L5_16 then
    L5_16 = _UPVALUE0_
    L5_16 = L5_16.NIL
    if L3_14 ~= L5_16 then
      L5_16 = _UPVALUE0_
      L5_16 = L5_16.NIL
    end
  elseif L4_15 == L5_16 then
    L5_16 = util
    L5_16 = L5_16.appendDebugOut
    L6_17 = "GetNext : Invalid Cookie"
    L5_16(L6_17)
    L5_16 = _UPVALUE0_
    L5_16 = L5_16.BAD_PARAMETER
    return L5_16
  end
  L5_16, L6_17 = nil, nil
  _UPVALUE1_.start()
  L5_16, L6_17 = _UPVALUE2_.intelAmtSetupSet(L6_17, L2_13, L3_14, L4_15)
  if L5_16 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page intelAmt" .. L5_16)
    _UPVALUE1_.abort()
    return L5_16, L1_12
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L5_16, L6_17
end
function intelAmtReflectorGet()
  local L0_18, L1_19, L2_20
  L0_18, L1_19, L2_20 = _UPVALUE0_.isreflectorEnabled()
  if L0_18 ~= _UPVALUE1_.SUCCESS then
    return L0_18
  end
  return L0_18, L1_19, L2_20
end
function intelAmtReflectorSet(A0_21)
  local L1_22
  L1_22 = ACCESS_LEVEL
  if L1_22 ~= 0 then
    L1_22 = util
    L1_22 = L1_22.appendDebugOut
    L1_22("Detected Unauthorized access for page intelAmt")
    L1_22 = _UPVALUE0_
    L1_22 = L1_22.UNAUTHORIZED
    return L1_22
  end
  L1_22 = A0_21["intelAmtStart.cookie"]
  if L1_22 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if A0_21["intelAmtStart.enable"] == _UPVALUE0_.NIL then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  if A0_21["intelAmtStart.enable"] == ENABLE then
    returnCode, cookie = _UPVALUE2_.reflectorEnable(cookie)
  else
    returnCode, cookie = _UPVALUE2_.reflectorDisable(cookie)
  end
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page intelAmt" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode, L1_22
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
function intelAmtReflectorSectionGet()
  local L0_23, L1_24, L2_25, L3_26, L4_27
  L0_23, L1_24, L2_25, L3_26, L4_27 = _UPVALUE0_.intelAmtReflectorSetupGet()
  if L0_23 ~= _UPVALUE1_.SUCCESS then
    return L0_23
  end
  return L0_23, L1_24, L2_25, L3_26, L4_27
end
function intelAmtReflectorSectionGetNext(A0_28)
  local L1_29, L2_30, L3_31, L4_32, L5_33, L6_34
  L1_29 = A0_28["intelAmt.cookie"]
  L2_30 = _UPVALUE0_
  L2_30 = L2_30.NIL
  if L1_29 == L2_30 then
    L2_30 = util
    L2_30 = L2_30.appendDebugOut
    L3_31 = "GetNext : Invalid Cookie"
    L2_30(L3_31)
    L2_30 = _UPVALUE0_
    L2_30 = L2_30.BAD_PARAMETER
    return L2_30
  end
  L2_30, L3_31, L4_32, L5_33, L6_34 = nil, nil, nil, nil, nil
  L2_30, L3_31, L4_32, L5_33, L6_34 = _UPVALUE1_.intelAmtReflectorSetupGetNext(L1_29)
  if L2_30 ~= _UPVALUE0_.SUCCESS then
    return L2_30
  end
  return L2_30, L3_31, L4_32, L5_33, L6_34
end
function intelAmtReflectorSectionSet(A0_35)
  local L1_36, L2_37, L3_38, L4_39, L5_40
  L1_36 = ACCESS_LEVEL
  if L1_36 ~= 0 then
    L1_36 = util
    L1_36 = L1_36.appendDebugOut
    L2_37 = "Detected Unauthorized access for page  intelAmt"
    L1_36(L2_37)
    L1_36 = _UPVALUE0_
    L1_36 = L1_36.UNAUTHORIZED
    return L1_36
  end
  L1_36 = A0_35["intelAmt.cookie"]
  L2_37 = A0_35["intelAmt.sourcePort"]
  L3_38 = A0_35["intelAmt.activeReflectorOnPort"]
  L4_39 = _UPVALUE0_
  L4_39 = L4_39.NIL
  if L1_36 == L4_39 then
    L4_39 = util
    L4_39 = L4_39.appendDebugOut
    L5_40 = "Set : Invalid Cookie"
    L4_39(L5_40)
    L4_39 = _UPVALUE0_
    L4_39 = L4_39.BAD_PARAMETER
    return L4_39
  end
  L4_39 = _UPVALUE0_
  L4_39 = L4_39.NIL
  if L2_37 ~= L4_39 then
    L4_39 = _UPVALUE0_
    L4_39 = L4_39.NIL
  elseif L3_38 == L4_39 then
    L4_39 = util
    L4_39 = L4_39.appendDebugOut
    L5_40 = "GetNext : Invalid Cookie"
    L4_39(L5_40)
    L4_39 = _UPVALUE0_
    L4_39 = L4_39.BAD_PARAMETER
    return L4_39
  end
  L4_39, L5_40 = nil, nil
  _UPVALUE1_.start()
  L4_39, L5_40 = _UPVALUE2_.intelAmtReflectorSetupSet(L1_36, L2_37, L3_38)
  if L4_39 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page intelAmt" .. L4_39)
    _UPVALUE1_.abort()
    return L4_39, L1_36
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L4_39, L5_40
end
function intelAmtSetupSectionGetAll()
  local L0_41, L1_42, L2_43, L3_44, L4_45, L5_46
  L0_41, L1_42, L2_43, L3_44, L4_45, L5_46 = _UPVALUE0_.intelAmtSetupGetAll()
  if L0_41 ~= _UPVALUE1_.SUCCESS then
    return L0_41
  end
  return L0_41, L1_42, L2_43, L3_44, L4_45, L5_46
end
function intelAmtReflectorSectionGetAll()
  local L0_47, L1_48, L2_49, L3_50, L4_51, L5_52, L6_53, L7_54, L8_55, L9_56, L10_57, L11_58, L12_59, L13_60
  L0_47, L1_48, L3_50, L4_51, L5_52, L6_53, L7_54, L8_55, L9_56, L10_57, L11_58, L12_59, L13_60 = _UPVALUE0_.intelAmtReflectorGetAll()
  if L0_47 ~= _UPVALUE1_.SUCCESS then
    return L0_47
  end
  return L0_47, L1_48, L3_50, L4_51, L5_52, L6_53, L7_54, L8_55, L9_56, L10_57, L11_58, L12_59, L13_60
end
function intelAmtSetupSectionSetAll(A0_61)
  local L1_62, L2_63, L3_64, L4_65
  L1_62 = ACCESS_LEVEL
  if L1_62 ~= 0 then
    L1_62 = util
    L1_62 = L1_62.appendDebugOut
    L2_63 = "Detected unauthorized access for intelAMt page"
    L1_62(L2_63)
    L1_62 = _UPVALUE0_
    L1_62 = L1_62.UNAUTHORIZED
    return L1_62
  end
  L1_62 = A0_61["intelAmt.ports"]
  L2_63 = A0_61["intelAmt.optionHost"]
  L3_64 = A0_61["intelAmt.wanHostAddress"]
  L4_65 = A0_61["intelAmt.internalIpAddress"]
  if L2_63 == "1" then
    L2_63 = "0"
  elseif L2_63 == "2" then
    L2_63 = "1"
  end
  if L1_62 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid status")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L1_62 == ENABLE and L2_63 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid hostOption")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.intelAmtSetupSetAll(L1_62, L2_63, L3_64, L4_65)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in intelAMt page" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
function intelAmtReflectorSectionSetAll(A0_66)
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected unauthorized access for intelAMt page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.intelAmtReflectorSetAll(A0_66)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in intelAMt page" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
