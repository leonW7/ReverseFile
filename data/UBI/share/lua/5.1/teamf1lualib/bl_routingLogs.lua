local L0_0
L0_0 = module
L0_0("com.teamf1.bl.logging.configuration", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/logging_configuration")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function routingLogsGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18
  returnCode, L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L17_18, L16_17, L15_16 = _UPVALUE0_.routingPacketslogBitmapGet()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L17_18, L16_17, L15_16
end
function routingLogsSet(A0_19)
  local L1_20, L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27, L9_28, L10_29, L11_30, L12_31, L13_32, L14_33, L15_34, L16_35, L17_36
  L1_20 = ACCESS_LEVEL
  if L1_20 ~= 0 then
    L1_20 = util
    L1_20 = L1_20.appendDebugOut
    L2_21 = "Detected unauthorized access for routingLogs "
    L1_20(L2_21)
    L1_20 = _UPVALUE0_
    L1_20 = L1_20.UNAUTHORIZED
    return L1_20
  end
  L1_20 = A0_19["routingLogs.cookie"]
  L2_21 = A0_19["routingLogs.lanToWanAccept"]
  L3_22 = A0_19["routingLogs.lanToWanDrop"]
  L4_23 = A0_19["routingLogs.wanToLanAccept"]
  L5_24 = A0_19["routingLogs.wanToLanDrop"]
  L6_25 = A0_19["routingLogs.lanToDmzAccept"]
  L7_26 = A0_19["routingLogs.lanToDmzDrop"]
  L8_27 = A0_19["routingLogs.dmzToWanAccept"]
  L9_28 = A0_19["routingLogs.dmzToWanDrop"]
  L10_29 = A0_19["routingLogs.dmzToLanAccept"]
  L11_30 = A0_19["routingLogs.dmzToLanDrop"]
  L12_31 = A0_19["routingLogs.wanToDmzAccept"]
  L13_32 = A0_19["routingLogs.wanToDmzDrop"]
  L14_33 = A0_19["routingLogs.lanToLanAccept"]
  L15_34 = A0_19["routingLogs.lanToLanDrop"]
  L16_35 = A0_19["routingLogs.webCategoryAccept"]
  L17_36 = A0_19["routingLogs.webCategoryDrop"]
  if L1_20 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L2_21 == _UPVALUE0_.NIL or L3_22 == _UPVALUE0_.NIL or L4_23 == _UPVALUE0_.NIL or L5_24 == _UPVALUE0_.NIL or L16_35 == _UPVALUE0_.NIL or L17_36 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L6_25 == _UPVALUE0_.NIL or L7_26 == _UPVALUE0_.NIL or L8_27 == _UPVALUE0_.NIL or L9_28 == _UPVALUE0_.NIL or L10_29 == _UPVALUE0_.NIL or L11_30 == _UPVALUE0_.NIL or L12_31 == _UPVALUE0_.NIL or L13_32 == _UPVALUE0_.NIL or L14_33 == _UPVALUE0_.NIL or L15_34 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.routingLogsSetup(L1_20, L2_21, L3_22, L4_23, L5_24, L12_31, L13_32, L8_27, L9_28, L6_25, L7_26, L10_29, L11_30, L14_33, L15_34, L16_35, L17_36)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in routingLogs page" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
