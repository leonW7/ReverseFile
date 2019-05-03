local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wan.ipv4_wan3", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wan_client")
L0_0 = require
L0_0("teamf1lualib/wan_port")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/wan_threeg")
L0_0 = require
L0_0("teamf1lualib/wan_multiwan")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.validations")
if UNIT_NAME ~= "DSR-250N" and UNIT_NAME ~= "DSR-250" and UNIT_NAME ~= "DSR-150N" and UNIT_NAME ~= "DSR-150" then
else
end
function wan3settingsSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24
  L10_11 = {}
  L11_12 = _UPVALUE0_
  L11_12 = L11_12.portGroupGet
  L12_13 = _UPVALUE1_
  L13_14 = _UPVALUE2_
  L18_19 = L11_12(L12_13, L13_14)
  L8_9 = L18_19
  L7_8 = L17_18
  L6_7 = L16_17
  L5_6 = L15_16
  L4_5 = L14_15
  L9_10 = L13_14
  L2_3 = L12_13
  L0_1 = L11_12
  L11_12 = _UPVALUE3_
  L11_12 = L11_12.SUCCESS
  if L0_1 ~= L11_12 then
    return L0_1
  end
  L11_12 = _UPVALUE4_
  L12_13 = tonumber
  L13_14 = L6_7
  L12_13 = L12_13(L13_14)
  L12_13 = L12_13 + 1
  L6_7 = L11_12[L12_13]
  L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24 = _UPVALUE5_.threegSettingsGet(_UPVALUE1_)
  if L11_12 ~= _UPVALUE3_.SUCCESS then
    return L11_12
  end
  if L21_22 == "0" then
    L21_22 = "2"
  end
  L10_11.reconnectMode = tostring(tonumber(L13_14) + 1)
  L10_11.idleTime = L14_15
  L10_11.userName = L15_16
  L10_11.password = L16_17
  L10_11.dialNumber = L17_18
  L10_11.authProtocol = L18_19
  L10_11.enableAPN = L19_20
  L10_11.apn = L20_21
  L10_11.dnsType = L21_22
  L10_11.primaryDns = L22_23
  L10_11.secondaryDns = L23_24
  L10_11.mtuType = L6_7
  L10_11.customMTU = L7_8
  return _UPVALUE3_.SUCCESS, L10_11
end
function wan3settingsSectionSet(A0_25)
  local L1_26, L2_27, L3_28, L4_29, L5_30, L6_31, L7_32, L8_33, L9_34, L10_35, L11_36, L12_37, L13_38, L14_39, L15_40, L16_41, L17_42, L18_43, L19_44, L20_45, L21_46, L22_47, L23_48, L24_49, L25_50, L26_51, L27_52
  L1_26 = ACCESS_LEVEL
  if L1_26 ~= 0 then
    L1_26 = util
    L1_26 = L1_26.appendDebugOut
    L2_27 = "Detected Unauthorized access for page wan3Settings"
    L1_26(L2_27)
    L1_26 = _UPVALUE0_
    L1_26 = L1_26.UNAUTHORIZED
    return L1_26
  end
  L1_26 = A0_25["wan3Settings.cookie"]
  L2_27 = A0_25["wan3Settings.reconnectMode"]
  L3_28 = A0_25["wan3Settings.idleTime"]
  L4_29 = A0_25["wan3Settings.userName"]
  L5_30 = A0_25["wan3Settings.password"]
  L6_31 = A0_25["wan3Settings.dialNumber"]
  L7_32 = A0_25["wan3Settings.authProtocol"]
  L8_33 = A0_25["wan3Settings.enableAPN"]
  L9_34 = A0_25["wan3Settings.apn"]
  L10_35 = A0_25["wan3Settings.dnsType"]
  L11_36 = A0_25["wan3Settings.primaryDns"]
  L12_37 = A0_25["wan3Settings.secondaryDns"]
  L13_38 = A0_25["wan3Settings.mtuType"]
  L14_39 = A0_25["wan3Settings.customMTU"]
  L15_40 = {}
  L16_41, L17_42 = nil, nil
  L18_43 = _UPVALUE0_
  L18_43 = L18_43.NIL
  if L1_26 == L18_43 then
    L18_43 = util
    L18_43 = L18_43.appendDebugOut
    L19_44 = "Set : Invalid Cookie"
    L18_43(L19_44)
    L18_43 = _UPVALUE0_
    L18_43 = L18_43.BAD_PARAMETER
    return L18_43
  end
  L18_43 = _UPVALUE1_
  L18_43 = L18_43[1]
  if L13_38 == L18_43 then
    L18_43 = _UPVALUE0_
    L18_43 = L18_43.NIL
    if L14_39 == L18_43 then
      L18_43 = util
      L18_43 = L18_43.appendDebugOut
      L19_44 = "Set : Invalid mtu"
      L18_43(L19_44)
      L18_43 = _UPVALUE0_
      L18_43 = L18_43.BAD_PARAMETER
      return L18_43
    end
  end
  L18_43, L19_44 = nil, nil
  L20_45 = "threeg"
  L21_46, L22_47, L23_48, L24_49 = nil, nil, nil, nil
  L2_27 = L25_50
  for _FORV_28_, _FORV_29_ in L25_50(L26_51) do
    if _FORV_29_ == L13_38 then
      L13_38 = _FORV_28_ - 1
      break
    end
  end
  if L10_35 == "2" then
    L10_35 = "0"
  end
  L19_44 = L27_52
  rowId = L26_51
  L18_43 = L25_50
  if L18_43 ~= L25_50 then
    return L18_43
  end
  L25_50()
  L21_46 = L26_51
  L18_43 = L25_50
  if L18_43 ~= L25_50 then
    L25_50(L26_51)
    L25_50()
    return L25_50, L26_51
  end
  L15_40 = L27_52
  L21_46 = L26_51
  L18_43 = L25_50
  if L18_43 ~= L25_50 then
    L25_50(L26_51)
    L25_50()
    return L25_50, L26_51
  end
  L23_48 = L26_51
  L18_43 = L25_50
  if L18_43 ~= L25_50 then
    L25_50(L26_51)
    L25_50()
    return L25_50, L26_51
  end
  L25_50()
  L25_50()
  util.appendDebugOut("Exec: " .. os.execute(L27_52))
  return _UPVALUE0_.SUCCESS, L21_46
end
