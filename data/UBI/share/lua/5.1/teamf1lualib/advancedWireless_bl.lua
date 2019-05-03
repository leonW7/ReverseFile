local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wireless.advancedwireless", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wireless_advancedWireless")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function advancedWirelessSectionGet(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.NIL
  if A0_1 == L1_2 then
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.INVALID_ARGUMENT
    return L1_2
  end
  L1_2 = _UPVALUE1_
  if A0_1 ~= L1_2 then
    L1_2 = _UPVALUE2_
    if A0_1 ~= L1_2 then
      L1_2 = _UPVALUE0_
      L1_2 = L1_2.INVALID_ARGUMENT
      return L1_2
    end
  end
  L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-500AC" then
    L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13 = _UPVALUE3_.acAdvancedGroupSettingsGet(A0_1)
  else
    L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10 = _UPVALUE3_.advancedGroupSettingsGet()
  end
  if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-500AC" then
    if L5_6 == "2347" then
      L13_14 = "0"
      L5_6 = "2346"
    else
      L13_14 = "1"
    end
  end
  if L1_2 ~= _UPVALUE0_.SUCCESS then
    return L1_2
  end
  return _UPVALUE0_.SUCCESS, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14
end
function advancedWirelessSectionSet(A0_15)
  local L1_16, L2_17, L3_18, L4_19, L5_20, L6_21, L7_22, L8_23, L9_24, L10_25, L11_26, L12_27
  L1_16 = ACCESS_LEVEL
  if L1_16 ~= 0 then
    L1_16 = util
    L1_16 = L1_16.appendDebugOut
    L2_17 = "Detected Unauthorized access for page advancedWirelss"
    L1_16(L2_17)
    L1_16 = _UPVALUE0_
    L1_16 = L1_16.UNAUTHORIZED
    return L1_16
  end
  L1_16, L2_17, L3_18, L4_19, L5_20, L6_21, L7_22, L8_23, L9_24, L10_25, L11_26, L12_27 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  curCookie = A0_15["advancedWireless.radioId"]
  L3_18 = A0_15["advancedWireless.beaconInterval"]
  L4_19 = A0_15["advancedWireless.dtimInterval"]
  L5_20 = A0_15["advancedWireless.rtsThreshold"]
  L6_21 = A0_15["advancedWireless.fragThreshold"]
  L7_22 = A0_15["advancedWireless.preambleMode"]
  L8_23 = A0_15["advancedWireless.protectionMode"]
  L9_24 = A0_15["advancedWireless.powerSave"]
  L10_25 = A0_15["advancedWireless.rxAntenna"]
  L11_26 = A0_15["advancedWireless.txAntenna"]
  L12_27 = A0_15["advancedWireless.ampdu"]
  if curCookie == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if curCookie ~= _UPVALUE1_ and curCookie ~= _UPVALUE2_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" then
    if A0_15["advancedWireless.txAntenna"] == nil or A0_15["advancedWireless.txAntenna"] == "" then
      A0_15["advancedWireless.txAntenna"] = "0"
    end
    if A0_15["advancedWireless.rxAntenna"] == nil or A0_15["advancedWireless.rxAntenna"] == "" then
      A0_15["advancedWireless.rxAntenna"] = "0"
    end
    if A0_15["advancedWireless.preambleMode"] == nil or A0_15["advancedWireless.preambleMode"] == "" then
      A0_15["advancedWireless.preambleMode"] = "Long"
    end
    L11_26 = A0_15["advancedWireless.txAntenna"]
    L10_25 = A0_15["advancedWireless.rxAntenna"]
    L12_27 = A0_15["advancedWireless.ampdu"]
    if A0_15["advancedWireless.enableRTS"] == "0" then
      L5_20 = "2347"
    end
  end
  _UPVALUE3_.start()
  if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-500AC" then
    L1_16, L2_17 = _UPVALUE4_.acAdvancedGroupSettingsSet(curCookie, L3_18, L4_19, L5_20, L6_21, L7_22, L8_23, L9_24, L10_25, L11_26, L12_27)
  else
    L1_16, L2_17 = _UPVALUE4_.advancedGroupSettingsSet(curCookie, L3_18, L4_19, L5_20, L6_21, L7_22, L8_23, L9_24)
  end
  if L1_16 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page wmm" .. L1_16)
    _UPVALUE3_.abort()
    return L1_16
  end
  _UPVALUE3_.complete()
  _UPVALUE3_.save()
  return _UPVALUE0_.SUCCESS, L2_17
end
function multiToUnicastGet(A0_28)
  local L1_29, L2_30, L3_31
  L1_29, L2_30, L3_31 = _UPVALUE0_.multiToUnicastSettingsGet(A0_28)
  if L1_29 ~= _UPVALUE1_.SUCCESS then
    return L1_29
  end
  return _UPVALUE1_.SUCCESS, L2_30, L3_31
end
function multiToUnicastSet(A0_32)
  local L1_33, L2_34, L3_35
  L1_33 = ACCESS_LEVEL
  if L1_33 ~= 0 then
    L1_33 = util
    L1_33 = L1_33.appendDebugOut
    L2_34 = "Detected Unauthorized access for page advancedWirelss"
    L1_33(L2_34)
    L1_33 = _UPVALUE0_
    L1_33 = L1_33.UNAUTHORIZED
    return L1_33
  end
  L1_33, L2_34, L3_35 = nil, nil, nil
  curCookie = A0_32["advancedWireless.radioId"]
  L3_35 = A0_32["advancedWireless.multiToUnicast"]
  _UPVALUE1_.start()
  L1_33, L2_34 = _UPVALUE2_.multiToUnicastSettingsSet(curCookie, L3_35)
  if L1_33 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page advancedWireless" .. L1_33)
    _UPVALUE1_.abort()
    return L1_33
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L2_34
end
