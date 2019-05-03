local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
L0_0 = module
L1_1 = "com.teamf1.bl.captiveportal.loginprofilesSla"
L2_2 = package
L2_2 = L2_2.seeall
L0_0(L1_1, L2_2)
L0_0 = require
L1_1 = "teamf1lualib/db"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/util"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/validations"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/returnCodes"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/captiveportal_loginProfileSla"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/management_config"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/system_productData"
L0_0(L1_1)
L0_0 = require
L1_1 = "com.teamf1.core.returnCodes"
L0_0 = L0_0(L1_1)
L1_1 = require
L2_2 = "com.teamf1.core.validations"
L1_1 = L1_1(L2_2)
L2_2 = require
L3_3 = "com.teamf1.core.config"
L2_2 = L2_2(L3_3)
L3_3 = require
L4_4 = "com.teamf1.core.captiveportal.loginprofileSla"
L3_3 = L3_3(L4_4)
L4_4 = require
L5_5 = "com.teamf1.core.system.productdata"
L4_4 = L4_4(L5_5)
L5_5, L6_6 = nil, nil
L5_5, L6_6, COUNTRY_CODE = L4_4.countryCodeGet()
ENABLE = "1"
DISABLE = "0"
NIL = nil
INT_TAHOMA = 1
INT_TIMES_NEW_ROMAN = 2
INT_VERDANA = 3
INT_ARIAL = 4
INT_SMALL = 1
INT_MEDIUM = 2
INT_BIG = 3
INT_WHITE = 1
INT_RED = 2
INT_GREEN = 3
INT_BLUE = 4
INT_CUSTOM = 5
INT_BLACK = 5
INT_RED_FONT_IDX = 1
INT_BLACK_FONT_IDX = 2
INT_GREEN_FONT_IDX = 3
INT_BLUE_FONT_IDX = 4
INT_RIGHT = 1
INT_LEFT = 2
IMAGE_TYPE = 1
COLOR_TYPE = 2
function profileSlaGet(A0_7)
  local L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14, L8_15
  L1_8 = _UPVALUE0_
  L1_8 = L1_8.NIL
  if A0_7 == L1_8 then
    L1_8 = _UPVALUE0_
    L1_8 = L1_8.ERROR
    return L1_8
  end
  L1_8 = _UPVALUE1_
  L1_8 = L1_8.loginProfileSlaRowGet
  L2_9 = A0_7
  L5_12 = L1_8(L2_9)
  L6_13 = L1_8
  L7_14 = L2_9
  L8_15 = L3_10
  return L6_13, L7_14, L8_15, L4_11, L5_12
end
function profileSlaSet(A0_16)
  local L1_17, L2_18, L3_19, L4_20, L5_21
  L1_17 = ACCESS_LEVEL
  if L1_17 ~= 0 then
    L1_17 = util
    L1_17 = L1_17.appendDebugOut
    L2_18 = "Detected Unauthorized access for page loginProfiles"
    L1_17(L2_18)
    L1_17 = _UPVALUE0_
    L1_17 = L1_17.UNAUTHORIZED
    return L1_17
  end
  L1_17 = A0_16["slaProfile.cookie"]
  L2_18 = A0_16["slaProfile.slaProfileName"]
  L3_19 = A0_16["slaProfile.textMessage"]
  L4_20 = A0_16["slaProfile.browserTitle"]
  if L2_18 == nil or L3_19 == nil then
    L5_21 = _UPVALUE0_
    L5_21 = L5_21.BAD_PARAMETER
    return L5_21
  end
  L5_21 = nil
  _UPVALUE1_.start()
  L5_21, _UPVALUE2_ = _UPVALUE3_.loginProfileSlaSet(L1_17, L2_18, L3_19, L4_20)
  if L5_21 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page Captive Portal loginProfiles Page " .. L5_21)
    _UPVALUE1_.abort()
    return L5_21, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, _UPVALUE2_
end
function profileSlaCreate(A0_22)
  local L1_23, L2_24, L3_25, L4_26
  L1_23 = ACCESS_LEVEL
  if L1_23 ~= 0 then
    L1_23 = util
    L1_23 = L1_23.appendDebugOut
    L2_24 = "Detected Unauthorized access for page loginProfiles"
    L1_23(L2_24)
    L1_23 = _UPVALUE0_
    L1_23 = L1_23.UNAUTHORIZED
    return L1_23
  end
  L1_23 = A0_22["slaProfile.slaProfileName"]
  L2_24 = A0_22["slaProfile.textMessage"]
  L3_25 = A0_22["slaProfile.browserTitle"]
  if L1_23 == nil or L2_24 == nil then
    L4_26 = _UPVALUE0_
    L4_26 = L4_26.BAD_PARAMETER
    return L4_26
  end
  L4_26 = nil
  _UPVALUE1_.start()
  L4_26, _UPVALUE2_ = _UPVALUE3_.loginProfileSlaCreate(L1_23, L2_24, L3_25)
  if L4_26 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page Captive Portal loginProfiles Page " .. L4_26)
    _UPVALUE1_.abort()
    return L4_26, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, _UPVALUE2_
end
function profileSlaDelete(A0_27)
  local L1_28, L2_29
  L1_28 = ACCESS_LEVEL
  if L1_28 ~= 0 then
    L1_28 = util
    L1_28 = L1_28.appendDebugOut
    L2_29 = "Detected Unauthorized access for page loginProfiles"
    L1_28(L2_29)
    L1_28 = _UPVALUE0_
    L1_28 = L1_28.UNAUTHORIZED
    return L1_28
  end
  L1_28 = A0_27["slaProfile.cookie"]
  if L1_28 == nil then
    L2_29 = util
    L2_29 = L2_29.appendDebugOut
    L2_29("Delete : Invalid Cookie")
    L2_29 = _UPVALUE0_
    L2_29 = L2_29.BAD_PARAMETER
    return L2_29
  end
  L2_29 = nil
  _UPVALUE1_.start()
  L2_29, _UPVALUE2_ = _UPVALUE3_.loginProfileSlaDelete(L1_28)
  if L2_29 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page CaptivePortal loginProfiles Page" .. L2_29)
    _UPVALUE1_.abort()
    return L2_29, L1_28
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, _UPVALUE2_
end
function profileSlaDeleteAll()
  local L0_30
  L0_30 = ACCESS_LEVEL
  if L0_30 ~= 0 then
    L0_30 = util
    L0_30 = L0_30.appendDebugOut
    L0_30("Detected Unauthorized access for page loginProfiles")
    L0_30 = _UPVALUE0_
    L0_30 = L0_30.UNAUTHORIZED
    return L0_30
  end
  L0_30 = nil
  _UPVALUE1_.start()
  L0_30 = _UPVALUE2_.loginProfileSlaDeleteAll(curCookie)
  if L0_30 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page CaptivePortal loginProfiles Page" .. L0_30)
    _UPVALUE1_.abort()
    return L0_30
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function profileSlaDefaultsGet()
  local L1_31
  L1_31 = _UPVALUE0_
  L1_31 = L1_31.NOT_SUPPORTED
  return L1_31
end
function profilesSlaGetAll()
  local L0_32, L1_33
  L0_32 = _UPVALUE0_
  L0_32 = L0_32.loginProfilesSlaGetAll
  L1_33 = L0_32()
  if L0_32 ~= _UPVALUE1_.SUCCESS then
    return L0_32
  end
  L1_33 = util.removePrefix(L1_33, "slaProfile.")
  return _UPVALUE1_.SUCCESS, L1_33
end
