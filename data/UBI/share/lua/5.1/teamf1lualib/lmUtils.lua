local L0_0
L0_0 = require
L0_0("lmCliLuaLib")
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/licenseDefines")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
freeTrialFile = "/flash/tmp/lm/freeTrial"
freeTrialTimeFile = "/flash/tmp/lm/freeTrialTime"
activationFile = "/flash/tmp/lm/freeTrialTime"
function activatedLicensesGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9
  L0_1 = {}
  retTable = L0_1
  L0_1 = io
  L0_1 = L0_1.open
  L1_2 = "/flash/tmp/lm/activation_keys"
  L2_3 = "r"
  L0_1 = L0_1(L1_2, L2_3)
  L1_2, L2_3 = nil, nil
  L3_4 = {}
  L4_5 = 1
  L5_6 = db
  L5_6 = L5_6.getAttribute
  L6_7 = "unitInfo"
  L7_8 = "_ROWID_"
  L8_9 = "1"
  L5_6 = L5_6(L6_7, L7_8, L8_9, "modelId")
  L6_7 = L5_6
  L7_8 = "-VPN"
  L6_7 = L6_7 .. L7_8
  L7_8 = L5_6
  L8_9 = "-AP6"
  L7_8 = L7_8 .. L8_9
  L8_9 = L5_6
  L8_9 = L8_9 .. "-WCF"
  if L0_1 then
    repeat
      L1_2 = L0_1:read("*line")
      if nil ~= L1_2 and "" ~= L1_2 then
        if tonumber(string.sub(L1_2, 1, 2)) == 1 then
          retTable[L4_5] = {
            L6_7,
            string.sub(L1_2, 2, 27),
            "Perpetual"
          }
        elseif tonumber(string.sub(L1_2, 1, 2)) == 2 then
          retTable[L4_5] = {
            L7_8,
            string.sub(L1_2, 2, 27),
            "Perpetual"
          }
        elseif tonumber(string.sub(L1_2, 1, 2)) == 0 then
          L2_3 = string.sub(L1_2, 29)
          retTable[L4_5] = {
            L8_9,
            string.sub(L1_2, 2, 27),
            os.date("%x", L2_3)
          }
        end
        L4_5 = L4_5 + 1
      end
    until nil == L1_2
    L0_1:close()
  end
  return retTable
end
function vpnLicenseStatusGet()
  if io.open("/var/ips_status", "r") then
    io.open("/var/ips_status", "r"):close()
  end
  if (io.open("/var/ips_status", "r"):read("*line") or "") == "enabled" then
    return true
  else
    return false
  end
end
function wlanNoOfSupportedApsGet()
  local L0_10, L1_11
  L0_10 = io
  L0_10 = L0_10.open
  L1_11 = "/var/ap6_status"
  L0_10 = L0_10(L1_11, "r")
  L1_11 = 6
  if L0_10 then
    L1_11 = L0_10:read("*line") or ""
    L0_10:close()
  end
  return tonumber(L1_11)
end
function licensesClear()
  local L0_12
  L0_12 = _UPVALUE0_
  L0_12 = L0_12.UNAUTHORIZED
  returnCode = L0_12
  L0_12 = ACCESS_LEVEL
  if L0_12 ~= 0 then
    L0_12 = util
    L0_12 = L0_12.appendDebugOut
    L0_12("Detected Unauthorized access for page")
    L0_12 = returnCode
    return L0_12
  end
  L0_12 = nil
  if io.open("/flash/tmp/lm/activation_keys", "r") then
    L0_12 = io.open("/flash/tmp/lm/activation_keys", "r"):read("*line")
    if L0_12 ~= nil and L0_12 ~= "" then
      os.execute("/pfrm2.0/bin/factoryCleanLicenses.sh")
      return _UPVALUE0_.SUCCESS
    end
  end
  return _UPVALUE0_.LICENSES_NONEXISTING
end
function licenseActivate(A0_13)
  local L1_14
  L1_14 = lmCliLuaLib
  L1_14 = L1_14.lmActivate
  L1_14 = L1_14(lmDef.Activate, A0_13)
  if lmDef.activation.success == L1_14 then
    return L1_14, "LM_ACTIVATION_SUCCEEDED"
  elseif lmDef.activation.failure == L1_14 then
    return L1_14, "LM_ACTIVATION_FAILED"
  elseif lmDef.activation.no_ntp == L1_14 then
    return L1_14, "LM_NTP_ENABLE_REQUIRED"
  elseif lmDef.activation.no_ips == L1_14 then
    return L1_14, "LM_IPS_LIC_REQUIRED"
  elseif lmDef.activation.license_present == L1_14 then
    return L1_14, "LM_LIC_PRE_REBOOT"
  end
end
function configuredUsersGet()
  if true == vpnLicenseStatus() then
    return {
      "SSL VPN User",
      "Administrator",
      "Guest (readonly)",
      "XAuth User",
      "L2TP User",
      "PPTP User",
      "Local User",
      "RunTimeAuth User"
    }
  else
    return {
      "Administrator",
      "Guest (readonly)",
      "Local User",
      "RunTimeAuth User"
    }
  end
end
function wcfLicenseStatusGet()
  if io.open(lmDef.wcfLicenseFile, "r") then
    io.open(lmDef.wcfLicenseFile, "r"):close()
    if (io.open(lmDef.wcfLicenseFile, "r"):read("*line") or "") == lmDef.WCF_ENABLED_STR then
      return lmDef.WCF_ENABLED
    else
      return lmDef.WCF_DISABLED
    end
  else
    return lmDef.WCF_DISABLED
  end
end
function wcfTrialLicenseActivate()
  local L0_15, L1_16, L2_17, L3_18, L4_19, L5_20, L6_21
  L1_16 = db
  L1_16 = L1_16.getAttribute
  L2_17 = "ntp"
  L3_18 = "_ROWID_"
  L4_19 = "1"
  L5_20 = "enabled"
  L1_16 = L1_16(L2_17, L3_18, L4_19, L5_20)
  L2_17 = db
  L2_17 = L2_17.getAttribute
  L3_18 = "ntp"
  L4_19 = "_ROWID_"
  L5_20 = "1"
  L6_21 = "useDefServers"
  L2_17 = L2_17(L3_18, L4_19, L5_20, L6_21)
  L3_18 = io
  L3_18 = L3_18.open
  L4_19 = "/var/timeSynced"
  L5_20 = "r"
  L3_18 = L3_18(L4_19, L5_20)
  if L1_16 == "0" or L3_18 == nil then
    L4_19 = lmDef
    L4_19 = L4_19.activation
    L4_19 = L4_19.no_ntp
    return L4_19
  end
  if L2_17 == "0" or L2_17 == nil then
    L4_19 = printCLIError
    L5_20 = "NTP with default servers should be enabled and synchronised before activating the WCF license"
    L4_19(L5_20)
    L4_19 = false
    return L4_19
  end
  L5_20 = L3_18
  L4_19 = L3_18.close
  L4_19(L5_20)
  L4_19 = io
  L4_19 = L4_19.open
  L5_20 = freeTrialTimeFile
  L6_21 = "r"
  L4_19 = L4_19(L5_20, L6_21)
  L5_20 = io
  L5_20 = L5_20.open
  L6_21 = activationFile
  L5_20 = L5_20(L6_21, "r")
  if L4_19 then
    L6_21 = L4_19.read
    L6_21 = L6_21(L4_19, "*line")
    if L6_21 ~= "1" then
      return lmDef.activation.license_present
    else
      return "trialCompleted"
    end
    L4_19:close()
  elseif L5_20 then
    L6_21 = L5_20.read
    L6_21 = L6_21(L5_20, "*line")
    if L6_21 ~= nil and L6_21 ~= "" then
      return "actualLicenseActivated"
    end
  end
  L6_21 = os
  L6_21 = L6_21.time
  L6_21 = L6_21()
  L6_21 = L6_21 + 7776000
  os.execute("echo " .. L6_21 .. " > " .. freeTrialTimeFile)
  os.execute("echo Activate > " .. freeTrialFile)
  freeTrial = io.open(freeTrialFile, "r")
  if not freeTrial then
    return lmDef.activation.failure
  end
  freeTrial:close()
  return lmDef.activation.success
end
