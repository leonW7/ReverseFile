require("lmCliLuaLib")
require("teamf1lualib/lmUtils")
freeTrialFile = "/flash/tmp/lm/freeTrial"
freeTrialTimeFile = "/flash/tmp/lm/freeTrialTime"
activationFile = "/flash/tmp/lm/activation_keys"
function clishLicenseActivate(A0_0)
  if lmDef.activation.success == lmCliLuaLib.lmActivate(lmDef.Activate, A0_0) then
    if io.open(freeTrialTimeFile, "r") then
      os.execute("echo 1 > " .. freeTrialTimeFile)
      io.open(freeTrialTimeFile, "r"):close()
    end
    print("Activated successfully, please reboot the device for the license to take effect.")
  elseif lmDef.activation.failure == lmCliLuaLib.lmActivate(lmDef.Activate, A0_0) then
    print("License activation failed.")
  elseif lmDef.activation.no_ntp == lmCliLuaLib.lmActivate(lmDef.Activate, A0_0) then
    print("NTP should be enabled and synchronised before activating the WCF license.")
  elseif lmDef.activation.no_ips == lmCliLuaLib.lmActivate(lmDef.Activate, A0_0) then
    print("VPN license should be enabled before activating the WCF license.")
  elseif lmDef.activation.license_present == lmCliLuaLib.lmActivate(lmDef.Activate, A0_0) then
    print("One license is already activated, please reboot the device before activating another license.")
  elseif lmDef.activation.license_expired == lmCliLuaLib.lmActivate(lmDef.Activate, A0_0) then
    print("license is already expired.")
  end
end
function clishLicenseList()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12
  L0_1 = activatedLicensesGet
  L0_1 = L0_1()
  L1_2 = nil
  L2_3(L3_4)
  L2_3(L3_4)
  for L5_6, L6_7 in L2_3(L3_4) do
    for L10_11, L11_12 in L7_8(L8_9) do
      io.write(L11_12, "            ")
    end
    L7_8(L8_9)
  end
end
function clishTrialLicenseActivate()
  if lmDef.activation.success == wcfTrialLicenseActivate() then
    print("Trial License Activated successfully.")
  elseif lmDef.activation.failure == wcfTrialLicenseActivate() then
    print("License activation failed.")
  elseif lmDef.activation.no_ntp == wcfTrialLicenseActivate() then
    print("NTP should be enabled and synchronised before activating the WCF license.")
  elseif "trialCompleted" == wcfTrialLicenseActivate() then
    print("Free trial completed.")
  elseif "actualLicenseActivated" == wcfTrialLicenseActivate() then
    print("No more trial version available once we activate License.")
  elseif lmDef.activation.license_present == wcfTrialLicenseActivate() then
    print("Trial License is already in use.")
  end
end
function clishFreeTrialStatusGet()
  local L0_13, L1_14, L2_15, L3_16, L4_17, L5_18, L6_19
  L0_13 = io
  L0_13 = L0_13.open
  L1_14 = freeTrialTimeFile
  L2_15 = "r"
  L0_13 = L0_13(L1_14, L2_15)
  L1_14 = io
  L1_14 = L1_14.open
  L2_15 = activationFile
  L3_16 = "r"
  L1_14 = L1_14(L2_15, L3_16)
  if L0_13 and L1_14 then
    L3_16 = L1_14
    L2_15 = L1_14.read
    L4_17 = "*line"
    L2_15 = L2_15(L3_16, L4_17)
    if L2_15 == nil or L2_15 == "" then
      L4_17 = L0_13
      L3_16 = L0_13.read
      L5_18 = "*line"
      L3_16 = L3_16(L4_17, L5_18)
      L4_17 = os
      L4_17 = L4_17.time
      L4_17 = L4_17()
      L5_18 = tonumber
      L6_19 = L3_16
      L5_18 = L5_18(L6_19)
      L6_19 = tonumber
      L6_19 = L6_19(L4_17)
      L5_18 = L5_18 - L6_19
      L6_19 = math
      L6_19 = L6_19.floor
      L6_19 = L6_19(tonumber(L5_18) / 86400)
      if tonumber(L3_16) == 1 then
        print("Trial version expired .")
      elseif L6_19 >= 0 then
        print("Just " .. L6_19 .. " days remaining in the Trial version.")
      else
        print("Trial version expired .")
      end
    elseif L2_15 ~= nil and L2_15 ~= "" then
      L3_16 = print
      L4_17 = "Trial version expired ."
      L3_16(L4_17)
    end
    L4_17 = L0_13
    L3_16 = L0_13.close
    L3_16(L4_17)
    L4_17 = L1_14
    L3_16 = L1_14.close
    L3_16(L4_17)
  elseif not L0_13 and L1_14 then
    L3_16 = L1_14
    L2_15 = L1_14.read
    L4_17 = "*line"
    L2_15 = L2_15(L3_16, L4_17)
    if L2_15 ~= nil and L2_15 ~= "" then
      L3_16 = print
      L4_17 = "Actual License is activated .Trial version is expired"
      L3_16(L4_17)
    elseif L2_15 == nil or L2_15 == "" then
      L3_16 = print
      L4_17 = "Trial version is not activated."
      L3_16(L4_17)
    end
    L4_17 = L1_14
    L3_16 = L1_14.close
    L3_16(L4_17)
  end
end
