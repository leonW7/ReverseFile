local L0_0
L0_0 = module
L0_0("com.teamf1.bl.system.time", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/system_time")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/admin_license")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
freeTrialFile = "/flash/tmp/lm/freeTrial"
freeTrialTimeFile = "/flash/tmp/lm/freeTrialTime"
activationFile = "/flash/tmp/lm/activation_keys"
function dateTimeSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10
  L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10 = _UPVALUE0_.ClockGet()
  if L7_8 == "0" then
    L7_8 = "2"
  elseif L7_8 == "1" then
    L7_8 = "1"
  end
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10
end
function dateTimeSectionSet(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20, L10_21, L11_22, L12_23, L13_24, L14_25, L15_26, L16_27, L17_28
  L1_12 = "/var/timeSynced"
  L2_13, L3_14 = nil, nil
  L4_15 = ACCESS_LEVEL
  if L4_15 ~= 0 then
    L4_15 = util
    L4_15 = L4_15.appendDebugOut
    L5_16 = "Detected Unauthorized access for page dateTime"
    L4_15(L5_16)
    L4_15 = _UPVALUE0_
    L4_15 = L4_15.UNAUTHORIZED
    return L4_15
  end
  L4_15 = db
  L4_15 = L4_15.getRow
  L5_16 = "ntp"
  L6_17 = "_ROWID_"
  L7_18 = "1"
  L4_15 = L4_15(L5_16, L6_17, L7_18)
  L5_16 = io
  L5_16 = L5_16.open
  L6_17 = freeTrialTimeFile
  L7_18 = "r"
  L5_16 = L5_16(L6_17, L7_18)
  L6_17 = io
  L6_17 = L6_17.open
  L7_18 = activationFile
  L8_19 = "r"
  L6_17 = L6_17(L7_18, L8_19)
  if L6_17 ~= nil then
    L8_19 = L6_17
    L7_18 = L6_17.read
    L9_20 = "*line"
    L7_18 = L7_18(L8_19, L9_20)
    if L7_18 ~= nil and L7_18 ~= "" then
      L8_19 = _UPVALUE0_
      L8_19 = L8_19.WCF_ACTIVATED_NO_DATE_TIME_CHANGE
      return L8_19
    elseif L5_16 ~= nil then
      L9_20 = L5_16
      L8_19 = L5_16.read
      L10_21 = "*line"
      L8_19 = L8_19(L9_20, L10_21)
      L3_14 = L8_19
      L8_19 = os
      L8_19 = L8_19.time
      L8_19 = L8_19()
      L2_13 = L8_19
      L8_19 = tonumber
      L9_20 = L3_14
      L8_19 = L8_19(L9_20)
      L9_20 = tonumber
      L10_21 = L2_13
      L9_20 = L9_20(L10_21)
      if L8_19 >= L9_20 then
        L8_19 = A0_11["dateTime.enabled"]
        L9_20 = L4_15["ntp.enabled"]
        if L8_19 == L9_20 then
          L8_19 = A0_11["dateTime.autoDaylight"]
          L9_20 = L4_15["ntp.autoDaylight"]
          if L8_19 == L9_20 then
            L8_19 = A0_11["dateTime.useDefServers"]
            L9_20 = L4_15["ntp.useDefServers"]
            if L8_19 == L9_20 then
              L8_19 = A0_11["dateTime.reSyncNtpVal"]
              L9_20 = L4_15["ntp.reSyncNtpVal"]
            end
          end
        elseif L8_19 ~= L9_20 then
          L8_19 = _UPVALUE0_
          L8_19 = L8_19.WCF_ACTIVATED_NO_DATE_TIME_CHANGE
          return L8_19
        end
      else
        L8_19 = tonumber
        L9_20 = L3_14
        L8_19 = L8_19(L9_20)
        if L8_19 ~= 1 then
          L8_19 = tonumber
          L9_20 = L3_14
          L8_19 = L8_19(L9_20)
          L9_20 = tonumber
          L10_21 = L2_13
          L9_20 = L9_20(L10_21)
          if L8_19 <= L9_20 then
            L9_20 = L5_16
            L8_19 = L5_16.close
            L8_19(L9_20)
            L8_19 = io
            L8_19 = L8_19.open
            L9_20 = freeTrialTimeFile
            L10_21 = "w"
            L8_19 = L8_19(L9_20, L10_21)
            L5_16 = L8_19
            if L5_16 ~= nil then
              L9_20 = L5_16
              L8_19 = L5_16.write
              L10_21 = "1"
              L8_19(L9_20, L10_21)
            else
              L8_19 = _UPVALUE0_
              L8_19 = L8_19.WCF_ACTIVATED_NO_DATE_TIME_CHANGE
              return L8_19
            end
          end
        end
      end
    end
    L9_20 = L6_17
    L8_19 = L6_17.close
    L8_19(L9_20)
  end
  if L5_16 then
    L8_19 = L5_16
    L7_18 = L5_16.close
    L7_18(L8_19)
  end
  L7_18 = A0_11["dateTime.cookie"]
  L8_19 = A0_11["dateTime.currentTime"]
  L9_20 = A0_11["dateTime.timezone"]
  L10_21 = A0_11["dateTime.autoDaylight"]
  L11_22 = A0_11["dateTime.enabled"]
  L12_23 = A0_11["dateTime.reSyncNtpVal"]
  L13_24 = A0_11["dateTime.useDefServers"]
  L14_25 = A0_11["dateTime.server1"]
  L15_26 = A0_11["dateTime.server2"]
  if L7_18 == nil then
    L16_27 = util
    L16_27 = L16_27.appendDebugOut
    L17_28 = "Set : Invalid Cookie"
    L16_27(L17_28)
    L16_27 = _UPVALUE0_
    L16_27 = L16_27.BAD_PARAMETER
    return L16_27
  end
  if L13_24 == "1" then
    L13_24 = "1"
  elseif L13_24 == "2" then
    L13_24 = "0"
  end
  L16_27, L17_28 = nil, nil
  _UPVALUE1_.start()
  L16_27, L17_28 = _UPVALUE2_.ClockSet(L7_18, L8_19, L9_20, L10_21, L11_22, L12_23, L13_24, L14_25, L15_26)
  if L16_27 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page dateTime" .. L16_27)
    _UPVALUE1_.abort()
    return L16_27, L7_18
  end
  if L11_22 == "0" then
    os.execute(" rm -f " .. L1_12)
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L16_27, L17_28
end
