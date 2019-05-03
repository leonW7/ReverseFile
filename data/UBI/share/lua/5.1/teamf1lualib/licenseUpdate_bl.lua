local L0_0
L0_0 = module
L0_0("com.teamf1.bl.admin.license", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/admin_license")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/lm_returnCodes")
L0_0 = require
L0_0("teamf1lualib/system_time")
L0_0 = require
L0_0("loginLuaLib")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.lm.returnCodes")
lmDef = {}
lmDef.activation = {}
lmDef.activation.failure = 0
lmDef.activation.success = 1
lmDef.activation.no_ntp = 2
lmDef.activation.no_ips = 3
lmDef.activation.invalid_params = 4
lmDef.activation.license_present = 5
lmDef.activation.license_expired = 6
freeTrialFile = "/flash/tmp/lm/freeTrial"
freeTrialTimeFile = "/flash/tmp/lm/freeTrialTime"
activationFile = "/flash/tmp/lm/activation_keys"
lmDef.activate = 1
function licenseInfoSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  L0_1, L1_2, L2_3, L3_4, L4_5 = _UPVALUE0_.licenseInfoGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3, L3_4, L4_5
end
function licenseInfoSectionGetNext(A0_6)
  local L1_7, L2_8, L3_9, L4_10, L5_11, L6_12
  L1_7 = A0_6["licenseUpdate.cookie"]
  L2_8 = _UPVALUE0_
  L2_8 = L2_8.NIL
  if L1_7 == L2_8 then
    L2_8 = util
    L2_8 = L2_8.appendDebugOut
    L3_9 = "GetNext : Invalid Cookie"
    L2_8(L3_9)
    L2_8 = _UPVALUE0_
    L2_8 = L2_8.BAD_PARAMETER
    return L2_8
  end
  L2_8, L3_9, L4_10, L5_11, L6_12 = nil, nil, nil, nil, nil
  L2_8, L3_9, L4_10, L5_11, L6_12 = _UPVALUE1_.licenseInfoGetNext(L1_7)
  if L2_8 ~= _UPVALUE0_.SUCCESS then
    return L2_8
  end
  return L2_8, L3_9, L4_10, L5_11, L6_12
end
function licenseCodeSet(A0_13)
  local L1_14, L2_15, L3_16, L4_17
  L1_14 = ACCESS_LEVEL
  if L1_14 ~= 0 then
    L1_14 = util
    L1_14 = L1_14.appendDebugOut
    L2_15 = "Detected Unauthorized access for page licenseUpdate"
    L1_14(L2_15)
    L1_14 = _UPVALUE0_
    L1_14 = L1_14.UNAUTHORIZED
    return L1_14
  end
  L1_14 = A0_13["licenseUpdate.activationKey"]
  L2_15 = "1"
  L3_16 = _UPVALUE0_
  L3_16 = L3_16.NIL
  if L1_14 == L3_16 then
    L3_16 = util
    L3_16 = L3_16.appendDebugOut
    L4_17 = "GetNext : Invalid Cookie"
    L3_16(L4_17)
    L3_16 = _UPVALUE0_
    L3_16 = L3_16.BAD_PARAMETER
    return L3_16
  end
  L3_16 = _UPVALUE1_
  L3_16 = L3_16.isNtpDefaultEnabled
  L3_16 = L3_16()
  L4_17 = _UPVALUE0_
  L4_17 = L4_17.TRUE
  if L3_16 ~= L4_17 then
    L4_17 = _UPVALUE2_
    L4_17 = L4_17.ACTIVATION_NTP_DEFAULT_ENABLE_REQUIRED
    return L4_17
  end
  L4_17 = _UPVALUE3_
  L4_17 = L4_17.start
  L4_17()
  L4_17 = nil
  if io.open("/flash/tmp/lm/activation_keys", "r") then
    L4_17 = io.open("/flash/tmp/lm/activation_keys", "r"):read("*line")
    if L4_17 ~= nil and L4_17 ~= "" then
      loginLuaLib.luaLogEventHandler("License already exists", 6, "PLATFORM")
      return _UPVALUE0_.LICENSES_EXISTING
    end
  end
  returnCode, rc = _UPVALUE4_.activationCodeSet(cookie, L1_14)
  if lmDef.activation.success == rc then
    _UPVALUE3_.complete()
    _UPVALUE3_.save()
    loginLuaLib.luaLogEventHandler("Activated successfully, please reboot the device for the license to take effect", 6, "PLATFORM")
    return _UPVALUE2_.ACTIVATION_CODE_SUCCEEDED
  elseif lmDef.activation.failure == rc then
    loginLuaLib.luaLogEventHandler("License activation failed", 3, "PLATFORM")
    return _UPVALUE2_.ACTIVATION_CODE_FAILED
  elseif lmDef.activation.no_ntp == rc then
    return _UPVALUE2_.ACTIVATION_NTP_ENABLE_REQUIRED
  elseif lmDef.activation.no_ips == rc then
    return _UPVALUE2_.ACTIVATION_IPS_LIC_REQUIRED
  elseif lmDef.activation.license_present == rc then
    loginLuaLib.luaLogEventHandler("License is already activated in the system", 6, "PLATFORM")
    return _UPVALUE2_.ACTIVATION_LIC_ACT_ALREADY
  elseif lmDef.activation.license_expired == rc then
    return _UPVALUE2_.ACTIVATION_LICENSE_EXPIRED
  end
  return returnCode, rc
end
function freeTriallicenseCodeSet(A0_18)
  local L1_19
  L1_19 = ACCESS_LEVEL
  if L1_19 ~= 0 then
    L1_19 = util
    L1_19 = L1_19.appendDebugOut
    L1_19("Detected Unauthorized access for page licenseUpdate")
    L1_19 = _UPVALUE0_
    L1_19 = L1_19.UNAUTHORIZED
    return L1_19
  end
  L1_19 = A0_18["licenseUpdate.freeTrial"]
  if L1_19 == _UPVALUE0_.NIL then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if _UPVALUE1_.isNtpDefaultEnabled() ~= _UPVALUE0_.TRUE then
    return _UPVALUE2_.ACTIVATION_NTP_DEFAULT_ENABLE_REQUIRED
  end
  if db.getAttribute("ntp", "_ROWID_", "1", "enabled") == "0" or io.open("/var/timeSynced", "r") == nil then
    return _UPVALUE2_.ACTIVATION_NTP_ENABLE_REQUIRED
  end
  io.open("/var/timeSynced", "r"):close()
  returnCode = _UPVALUE3_.freeTrialActivationCodeSet(cookie, L1_19)
  if returnCode == _UPVALUE0_.SUCCESS then
    return _UPVALUE2_.ACTIVATION_CODE_SUCCEEDED
  end
  return returnCode
end
function licenseListsGet()
  local L0_20, L1_21, L2_22, L3_23, L4_24, L5_25, L6_26, L7_27, L8_28, L9_29
  L1_21 = {}
  L2_22 = _UPVALUE0_
  L2_22 = L2_22.activatedLicenseGet
  L4_24 = L2_22()
  L1_21 = L4_24
  cookie = L3_23
  returnCode = L2_22
  L2_22 = returnCode
  L3_23 = _UPVALUE1_
  L3_23 = L3_23.SUCCESS
  if L2_22 ~= L3_23 then
    L2_22 = returnCode
    return L2_22
  end
  L2_22 = io
  L2_22 = L2_22.open
  L3_23 = freeTrialFile
  L4_24 = "r"
  L2_22 = L2_22(L3_23, L4_24)
  L3_23 = io
  L3_23 = L3_23.open
  L4_24 = activationFile
  L5_25 = "r"
  L3_23 = L3_23(L4_24, L5_25)
  if L2_22 and L3_23 then
    L5_25 = L3_23
    L4_24 = L3_23.read
    L6_26 = "*line"
    L4_24 = L4_24(L5_25, L6_26)
    if L4_24 == nil or L4_24 == "" then
      L5_25 = io
      L5_25 = L5_25.open
      L6_26 = freeTrialTimeFile
      L7_27 = "r"
      L5_25 = L5_25(L6_26, L7_27)
      L7_27 = L5_25
      L6_26 = L5_25.read
      L8_28 = "*line"
      L6_26 = L6_26(L7_27, L8_28)
      L7_27 = os
      L7_27 = L7_27.time
      L7_27 = L7_27()
      L8_28 = tonumber
      L9_29 = L6_26
      L8_28 = L8_28(L9_29)
      L9_29 = tonumber
      L9_29 = L9_29(L7_27)
      L8_28 = L8_28 - L9_29
      L9_29 = math
      L9_29 = L9_29.floor
      L9_29 = L9_29(tonumber(L8_28) / 86400)
      if tonumber(L6_26) == 1 then
        L0_20 = "Trial version completed. Please activate the License"
      elseif L9_29 >= 0 then
        L0_20 = "Just " .. L9_29 .. " days remaining in the Trial" .. " version"
      else
        L0_20 = "Trial version completed. Please activate the License"
      end
    end
    L6_26 = L2_22
    L5_25 = L2_22.close
    L5_25(L6_26)
    L6_26 = L3_23
    L5_25 = L3_23.close
    L5_25(L6_26)
  end
  L4_24 = returnCode
  L5_25 = cookie
  L6_26 = L1_21
  L7_27 = L0_20
  return L4_24, L5_25, L6_26, L7_27
end
