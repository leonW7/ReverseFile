local L0_0
L0_0 = module
L0_0("com.teamf1.core.threeg.threeg_simCardAuth", package.seeall)
L0_0 = require
L0_0("smsLib")
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/threeg_createSms")
L0_0 = require
L0_0("teamf1lualib/threeg_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
DISABLED = "disabled"
USB_FILE = "/dev/modem"
function simCardAuthStatusGet()
  local L0_1, L1_2, L2_3, L3_4
  L2_3 = "2"
  L3_4 = "Not Available"
  L0_1, L1_2 = _UPVALUE0_.createSmsGet()
  if L1_2 == DISABLED then
    return _UPVALUE1_.THREEG_NOT_AVAILABLE, L1_2, L2_3, L3_4
  else
    L2_3 = smsLib.simCardAuthInfoGet(USB_FILE)
    if L2_3 == "4" then
      return _UPVALUE1_.SIM_NOT_INSERTED, L1_2, L2_3, L3_4
    end
    if L2_3 == "5" then
      L3_4 = "SIM Card Blocked"
      return _UPVALUE1_.SIM_CARD_BLOCKED, L1_2, L2_3, L3_4
    end
    if L2_3 == "0" then
      L3_4 = "SIM Card Unlocked"
    end
    if L2_3 == "1" then
      L3_4 = "SIM Card Locked"
    end
    if L2_3 == "6" then
      L3_4 = "SIM Card ERROR"
    end
    if L2_3 == "7" then
      return _UPVALUE1_.SIM_BUSY, L1_2, L2_3, L3_4
    end
  end
  return _UPVALUE2_.SUCCESS, L1_2, L2_3, L3_4
end
function simCardPinAuth(A0_5)
  if smsLib.simCardPinAuth(A0_5, USB_FILE) == ERROR then
    return _UPVALUE0_.FAILURE
  end
  if smsLib.simCardPinAuth(A0_5, USB_FILE) == "2" then
    return _UPVALUE0_.SUCCESS
  end
  if smsLib.simCardPinAuth(A0_5, USB_FILE) == "3" then
    return _UPVALUE1_.SIM_WRONG_PIN
  end
  if smsLib.simCardPinAuth(A0_5, USB_FILE) == "6" then
    return _UPVALUE1_.SIM_CARD_ERROR
  end
  if smsLib.simCardPinAuth(A0_5, USB_FILE) == "7" then
    return _UPVALUE1_.SIM_BUSY
  end
end
