local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.wizard", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wlan_returnCodes")
L0_0 = require
L0_0("teamf1lualib/wlanWizard_web")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/bl_authFailedAps")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function wlanWizardConfig(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12
  L2_3 = 0
  L3_4 = ""
  L4_5 = {}
  if L5_6 ~= 0 then
    L5_6(L6_7)
    return L5_6
  end
  if A0_1 == L5_6 then
    return L5_6
  end
  L4_5 = L5_6
  for L8_9, L9_10 in L5_6(L6_7) do
    if L9_10 ~= L10_11 then
      L11_12 = L9_10
      L11_12 = _UPVALUE0_
      L11_12 = L11_12.NIL
      if L10_11 ~= L11_12 then
        L11_12 = L9_10
        L4_5[L8_9] = L10_11
      end
    end
  end
  if L5_6 == L6_7 then
    return L5_6
  end
  if L5_6 == L6_7 then
    return L5_6
  end
  if L5_6 == 2 then
    if L5_6 == L6_7 then
      return L5_6
    end
  elseif L5_6 == 4 then
    if L5_6 == L6_7 then
      return L5_6
    end
  end
  if L5_6 == L6_7 then
    return L5_6
  end
  if L5_6 == L6_7 then
    return L5_6
  end
  if L5_6 == L6_7 then
    return L5_6
  end
  if L5_6 == L6_7 then
    return L5_6
  end
  if L5_6 == L6_7 then
    return L5_6
  end
  if L5_6 == 0 then
    L4_5.radio1OperatingMode = 1
  elseif L5_6 == 1 then
    if L5_6 == L6_7 then
      return L5_6
    end
  else
    return L5_6
  end
  if L5_6 == 0 then
    L4_5.radio2OperatingMode = 2
  elseif L5_6 == 1 then
    if L5_6 == L6_7 then
      return L5_6
    end
  else
    return L5_6
  end
  for L11_12 = 1, L5_6 do
    apManaged = L6_7 .. L11_12
    apMac = L7_8 .. L11_12
    if L4_5[apManaged] == 1 then
      if L3_4 == "" then
        L3_4 = string.sub(L4_5[apMac], 2)
      else
        L3_4 = L3_4 .. "," .. string.sub(L4_5[apMac], 2)
      end
      L2_3 = L2_3 + 1
    end
  end
  configMacParam = L8_9
  apConifgMac = L8_9
  for L11_12 = 1, 6 do
    apConifgMac = configMacParam .. L11_12
    if L4_5[apConifgMac] == _UPVALUE0_.NIL then
      return _UPVALUE0_.BAD_PARAMETER
    end
    if L4_5[apConifgMac] ~= "" then
      valid = _UPVALUE1_.isMacAddress(L4_5[apConifgMac])
      if valid ~= _UPVALUE0_.SUCCESS then
        return _UPVALUE2_.INVALID_MAC_ADDRESS_WIZARD
      end
      L2_3 = L2_3 + 1
      if L3_4 == "" then
        L3_4 = L4_5[apConifgMac]
      else
        L3_4 = L3_4 .. "," .. L4_5[apConifgMac]
      end
    end
  end
  if L2_3 < 1 then
    return L8_9
  end
  L4_5.totalMacAddress = L2_3
  L4_5.macAddressString = L3_4
  L1_2 = L8_9
  if L1_2 ~= L8_9 then
    L8_9(L9_10)
    return L1_2
  end
  return L1_2
end
function wlanWizardAuthFailedApGet()
  local L0_13, L1_14, L2_15, L3_16
  L2_15 = {}
  L3_16 = {}
  L0_13, L1_14 = _UPVALUE0_.authFailedApsGet()
  if L0_13 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  if L1_14 ~= _UPVALUE1_.NIL then
    for _FORV_7_, _FORV_8_ in pairs(L1_14) do
      L2_15.MAC = _FORV_8_.macAddress
      L0_13, L3_16 = _UPVALUE0_.authFailedApsDetailGet(L2_15)
      if L0_13 ~= _UPVALUE1_.SUCCESS then
        return _UPVALUE1_.FAILURE
      end
      if L3_16.reportingController == "Peer Switch" then
        _FORV_8_.macAddress = "*" .. _FORV_8_.macAddress
      else
        _FORV_8_.macAddress = " " .. _FORV_8_.macAddress
      end
    end
  end
  return L0_13, L1_14
end
