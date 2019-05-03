module("com.teamf1.core.lm.returnCodes", package.seeall)
ACTIVATION_CODE_INVALID = 1476460544
ACTIVATION_CODE_SUCCEEDED = ACTIVATION_CODE_INVALID + 1
ACTIVATION_CODE_FAILED = ACTIVATION_CODE_SUCCEEDED + 1
ACTIVATION_NTP_ENABLE_REQUIRED = ACTIVATION_CODE_FAILED + 1
ACTIVATION_IPS_LIC_REQUIRED = ACTIVATION_NTP_ENABLE_REQUIRED + 1
ACTIVATION_LIC_PRE_REBOOT = ACTIVATION_IPS_LIC_REQUIRED + 1
ACTIVATION_LIC_ACT_ALREADY = ACTIVATION_LIC_PRE_REBOOT + 1
ACTIVATION_NTP_DEFAULT_ENABLE_REQUIRED = ACTIVATION_LIC_ACT_ALREADY + 1
ACTIVATION_LICENSE_EXPIRED = ACTIVATION_NTP_DEFAULT_ENABLE_REQUIRED + 1
returnCodesToString = {
  [ACTIVATION_CODE_INVALID] = "Invalid activation code",
  [ACTIVATION_CODE_SUCCEEDED] = "Activated successfully, please reboot the device for the license to take effect.",
  [ACTIVATION_CODE_FAILED] = "License activation failed.",
  [ACTIVATION_NTP_ENABLE_REQUIRED] = "NTP should be enabled and synchronised before activating the WCF license.",
  [ACTIVATION_IPS_LIC_REQUIRED] = "VPN license should be enabled before activating the WCF license.",
  [ACTIVATION_LIC_PRE_REBOOT] = "One license is already activated, please reboot the device before activating another license.",
  [ACTIVATION_LIC_ACT_ALREADY] = "License is already activated in the system.",
  [ACTIVATION_NTP_DEFAULT_ENABLE_REQUIRED] = "NTP(Default) should be enabled and synchronised before activating the WCF license.",
  [ACTIVATION_LICENSE_EXPIRED] = "License is already expired"
}
