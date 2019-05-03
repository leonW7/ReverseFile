local L0_0
L0_0 = module
L0_0("com.teamf1.bl.usb.status", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/usb_status")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function usb1StatusGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
  L5_6 = "port1"
  returnCode, cookie, L5_6, L0_1, L1_2, L2_3, L3_4, L4_5 = _UPVALUE0_.usbPortStatusGet(L5_6)
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, cookie, L5_6, L0_1, L1_2, L2_3, L3_4, L4_5
end
function usb2StatusGet()
  local L0_7, L1_8, L2_9, L3_10, L4_11, L5_12
  L5_12 = "port2"
  returnCode, cookie, L5_12, L0_7, L1_8, L2_9, L3_10, L4_11 = _UPVALUE0_.usbPortStatusGetNext(L5_12)
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, cookie, L5_12, L0_7, L1_8, L2_9, L3_10, L4_11
end
function usb1UnmountStatusGet(A0_13)
  local L1_14, L2_15
  L1_14 = _UPVALUE0_
  L1_14 = L1_14.usbUnmount
  L2_15 = A0_13
  L2_15 = L1_14(L2_15)
  if L1_14 ~= _UPVALUE1_.SUCCESS then
    return L1_14
  end
  return L1_14, L2_15
end
function us2bUnmountStatusGet(A0_16)
  local L1_17, L2_18
  L1_17 = _UPVALUE0_
  L1_17 = L1_17.usbUnmount
  L2_18 = A0_16
  L2_18 = L1_17(L2_18)
  if L1_17 ~= _UPVALUE1_.SUCCESS then
    return L1_17
  end
  return L1_17, L2_18
end
