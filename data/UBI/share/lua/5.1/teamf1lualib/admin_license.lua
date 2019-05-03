local L0_0
L0_0 = module
L0_0("com.teamf1.core.admin.license", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("lmCliLuaLib")
L0_0 = require
L0_0("teamf1lualib/lm_returnCodes")
L0_0 = {}
L0_0.wcfLicenseFile = "/var/wcf_status"
L0_0.WCF_ENABLED = true
L0_0.WCF_DISABLED = false
L0_0.WCF_ENABLED_STR = "enabled"
L0_0.WCF_DISABLED_STR = "disabled"
L0_0.activation = {}
L0_0.activation.failure = 0
L0_0.activation.success = 1
L0_0.activation.no_ntp = 2
L0_0.activation.no_ips = 3
L0_0.activation.license_present = 4
L0_0.activate = 1
LICENSE_MODEL_VPN = "DWC-1000-VPN"
LICENSE_MODEL_AP6 = "DWC-1000-AP6"
LICENSE_MODEL_WCF = "DWC-1000-WCF"
LICENSE_MODEL_VPN_NO = 0
LICENSE_MODEL_AP6_NO = 1
LICENSE_MODEL_WCF_NO = 2
licenseFileStore = "/flash/tmp/lm/activation_keys"
LICENSE_MIN_LENGTH = 0
LICENSE_MAX_LENGTH = 25
EXPIRATION_TIME = "Perpetual"
mode = "r"
INDEX1 = 1
INDEX2 = 2
INDEX3 = 27
INDEX4 = 29
freeTrialFile = "/flash/tmp/lm/freeTrial"
freeTrialTimeFile = "/flash/tmp/lm/freeTrialTime"
function activationCodeGet()
  local L1_1, L2_2
  L1_1 = _UPVALUE0_
  L1_1 = L1_1.NOT_SUPPORTED
  L2_2 = cookie
  return L1_1, L2_2, activationCode
end
function activationCodeGetNext(A0_3)
  return _UPVALUE0_.NOT_SUPPORTED
end
function activationCodeSet(A0_4, A1_5)
  local L2_6
  if A1_5 == nil then
    L2_6 = _UPVALUE0_
    L2_6 = L2_6.INVALID_ARGUMENT
    return L2_6
  end
  L2_6 = string
  L2_6 = L2_6.len
  L2_6 = L2_6(A1_5)
  if not (L2_6 < LICENSE_MIN_LENGTH) then
    L2_6 = string
    L2_6 = L2_6.len
    L2_6 = L2_6(A1_5)
  elseif L2_6 > LICENSE_MAX_LENGTH then
    L2_6 = _UPVALUE1_
    L2_6 = L2_6.ACTIVATION_CODE_INVALID
    return L2_6
  end
  L2_6 = lmCliLuaLib
  L2_6 = L2_6.lmActivate
  L2_6 = L2_6(_UPVALUE2_.Activate, A1_5)
  if L2_6 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  if _UPVALUE2_.activation.success == L2_6 then
    if io.open(freeTrialTimeFile, "r") then
      os.execute("echo 1 > " .. freeTrialTimeFile)
      io.open(freeTrialTimeFile, "r"):close()
    end
    return _UPVALUE0_.SUCCESS, L2_6
  else
    return _UPVALUE0_.FAILURE, L2_6
  end
end
function freeTrialActivationCodeSet(A0_7, A1_8)
  local L2_9
  if A1_8 == nil then
    L2_9 = _UPVALUE0_
    L2_9 = L2_9.INVALID_ARGUMENT
    return L2_9
  end
  L2_9 = os
  L2_9 = L2_9.time
  L2_9 = L2_9()
  L2_9 = L2_9 + 7776000
  os.execute("echo " .. L2_9 .. " > " .. freeTrialTimeFile)
  os.execute("echo " .. A1_8 .. " > " .. freeTrialFile)
  if not io.open(freeTrialFile, "r") then
    return _UPVALUE0_.FAILURE
  end
  io.open(freeTrialFile, "r"):close()
  return _UPVALUE0_.SUCCESS
end
function licenseCodeGet()
  local L0_10, L1_11, L2_12
  L0_10 = io
  L0_10 = L0_10.open
  L1_11 = licenseFileStore
  L2_12 = mode
  L0_10 = L0_10(L1_11, L2_12)
  L2_12 = L0_10
  L1_11 = L0_10.read
  L1_11 = L1_11(L2_12, "*line")
  L2_12 = string
  L2_12 = L2_12.sub
  L2_12 = L2_12(L1_11, INDEX2, INDEX3)
  if L2_12 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L2_12
end
function licenseCodeGetNext(A0_13)
  local L1_14, L2_15, L3_16, L4_17, L5_18, L6_19
  L3_16 = 1
  L4_17 = nil
  L5_18 = io
  L5_18 = L5_18.open
  L6_19 = licenseFileStore
  L5_18 = L5_18(L6_19, mode)
  if A0_13 == nil then
    L6_19 = _UPVALUE0_
    L6_19 = L6_19.INVALID_ARGUMENT
    return L6_19
  end
  L6_19 = A0_13 + 1
  if L5_18 then
    repeat
      L1_14 = L5_18:read("*line")
      if nil ~= L1_14 and "" ~= L1_14 then
        L4_17 = string.sub(L1_14, INDEX2, INDEX3)
        if A0_13 == L3_16 - 1 then
          break
        end
        L3_16 = L3_16 + 1
      end
    until nil == L1_14
    L5_18:close()
  end
  if L4_17 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L6_19, L4_17
end
function licenseCodeSet(A0_20, A1_21)
  local L3_22
  L3_22 = _UPVALUE0_
  L3_22 = L3_22.NOT_SUPPORTED
  return L3_22, A0_20
end
function licenseCodeDelete(A0_23, A1_24)
  local L3_25
  L3_25 = _UPVALUE0_
  L3_25 = L3_25.NOT_SUPPORTED
  return L3_25, A0_23
end
function modelGet()
  local L0_26, L1_27
  L0_26 = io.open(licenseFileStore, mode):read("*line")
  if nil ~= L0_26 and "" ~= L0_26 then
    if tonumber(string.sub(L0_26, INDEX1, INDEX2)) == LICENSE_MODEL_VPN_NO then
      L1_27 = LICENSE_MODEL_VPN
    elseif tonumber(string.sub(L0_26, INDEX1, INDEX2)) == LICENSE_MODEL_AP6_NO then
      L1_27 = LICENSE_MODEL_AP6
    elseif tonumber(string.sub(L0_26, INDEX1, INDEX2)) == LICENSE_MODEL_WCF_NO then
      L1_27 = LICENSE_MODEL_WCF
    end
  end
  if L1_27 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L1_27
end
function modelGetNext(A0_28)
  local L1_29, L2_30, L3_31, L4_32, L5_33
  L3_31 = 1
  L4_32 = io
  L4_32 = L4_32.open
  L5_33 = licenseFileStore
  L4_32 = L4_32(L5_33, mode)
  if A0_28 == nil then
    L5_33 = _UPVALUE0_
    L5_33 = L5_33.INVALID_ARGUMENT
    return L5_33
  end
  L5_33 = A0_28 + 1
  if L4_32 then
    repeat
      L1_29 = L4_32:read("*line")
      if nil ~= L1_29 and "" ~= L1_29 then
        if tonumber(string.sub(L1_29, INDEX1, INDEX2)) == LICENSE_MODEL_VPN_NO then
          model = LICENSE_MODEL_VPN
        elseif tonumber(string.sub(L1_29, INDEX1, INDEX2)) == LICENSE_MODEL_AP6_NO then
          model = LICENSE_MODEL_AP6
        elseif tonumber(string.sub(L1_29, INDEX1, INDEX2)) == LICENSE_MODEL_WCF_NO then
          model = LICENSE_MODEL_WCF
        end
        if A0_28 == L3_31 - 1 then
          break
        end
        L3_31 = L3_31 + 1
      end
    until nil == L1_29
    L4_32:close()
  end
  if model == nil then
    return _UPVALUE0_.FAILURE, L5_33
  end
  return _UPVALUE0_.SUCCESS, L5_33, model
end
function modelSet(A0_34, A1_35)
  local L3_36
  L3_36 = _UPVALUE0_
  L3_36 = L3_36.NOT_SUPPORTED
  return L3_36, A0_34
end
function expirationTimeGet()
  local L0_37, L1_38, L2_39, L3_40, L4_41
  licenseStatus = io.open(licenseFileStore, mode):read("*line")
  if nil ~= licenseStatus and "" ~= licenseStatus then
    L2_39, L3_40, L4_41 = modelGet()
    if L2_39 == _UPVALUE0_.SUCCESS then
      if L4_41 == LICENSE_MODEL_VPN then
        L1_38 = EXPIRATION_TIME
      elseif L4_41 == LICENSE_MODEL_AP6 then
        L1_38 = EXPIRATION_TIME
      else
        L0_37 = string.sub(licenseStatus, INDEX4)
        L1_38 = os.date("%x", L0_37)
      end
    else
      return _UPVALUE0_.FAILURE
    end
    if L1_38 == nil then
      return _UPVALUE0_.FAILURE
    end
    return _UPVALUE0_.SUCCESS, 1, L1_38
  end
end
function expirationTimeGetNext(A0_42)
  local L1_43, L2_44, L3_45, L4_46, L5_47, L6_48, L7_49, L8_50, L9_51
  if A0_42 == nil then
    L1_43 = _UPVALUE0_
    L1_43 = L1_43.INVALID_ARGUMENT
    return L1_43
  end
  L1_43 = A0_42 + 1
  L2_44, L3_45, L4_46, L5_47, L6_48 = nil, nil, nil, nil, nil
  L7_49 = io
  L7_49 = L7_49.open
  L8_50 = licenseFileStore
  L9_51 = mode
  L7_49 = L7_49(L8_50, L9_51)
  L8_50, L9_51 = nil, nil
  if L7_49 then
    repeat
      L8_50 = L7_49:read("*line")
      if nil ~= L8_50 and "" ~= L8_50 then
        L3_45, L2_44, L4_46 = modelGetNext(A0_42)
        if L4_46 == LICENSE_MODEL_VPN then
          L6_48 = EXPIRATION_TIME
        elseif L4_46 == LICENSE_MODEL_AP6 then
          L6_48 = EXPIRATION_TIME
        else
          L9_51 = string.sub(L8_50, INDEX4)
          L6_48 = os.date("%x", L9_51)
        end
        if A0_42 == 1 - 1 then
          break
        end
      end
    until nil == L8_50
    L7_49:close()
  end
  if L6_48 == nil then
    return _UPVALUE0_.FAILURE, L1_43
  end
  return _UPVALUE0_.SUCCESS, L1_43, L6_48
end
function expirationTimeSet(A0_52, A1_53)
  local L3_54
  L3_54 = _UPVALUE0_
  L3_54 = L3_54.NOT_SUPPORTED
  return L3_54, A0_52
end
function licenseInfoGet()
  local L0_55, L1_56, L2_57, L3_58, L4_59
  L0_55, L1_56, L2_57 = licenseCodeGet()
  if L2_57 == nil then
    return _UPVALUE0_.FAILURE
  end
  L0_55, L1_56, L3_58 = modelGet()
  if L3_58 == nil then
    return _UPVALUE0_.FAILURE
  end
  L0_55, L1_56, L4_59 = expirationTimeGet()
  if L4_59 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L2_57, L3_58, L4_59
end
function licenseInfoGetNext(A0_60)
  local L1_61, L2_62, L3_63, L4_64, L5_65, L6_66, L7_67
  if A0_60 ~= nil then
    L7_67 = tonumber
    L7_67 = L7_67(A0_60)
  elseif L7_67 == nil then
    L7_67 = _UPVALUE0_
    L7_67 = L7_67.INVALID_ARGUMENT
    return L7_67
  end
  L7_67 = A0_60 + 1
  L2_62, L1_61, L4_64 = licenseCodeGetNext(A0_60)
  L2_62, L1_61, L3_63 = modelGetNext(A0_60)
  L2_62, L1_61, L5_65 = expirationTimeGetNext(A0_60)
  if L4_64 == nil or L3_63 == nil or L5_65 == nil then
    return _UPVALUE0_.FAILURE, A0_60
  end
  return _UPVALUE0_.SUCCESS, L7_67, L4_64, L3_63, L5_65
end
function licenseInfoSet(A0_68, A1_69, A2_70, A3_71)
  local L5_72
  L5_72 = _UPVALUE0_
  L5_72 = L5_72.NOT_SUPPORTED
  return L5_72, A0_68
end
function licenseInfoCreate(A0_73, A1_74, A2_75)
  local L4_76
  L4_76 = _UPVALUE0_
  L4_76 = L4_76.NOT_SUPPORTED
  return L4_76, cookie
end
function licenseInfoDelete(A0_77)
  return _UPVALUE0_.NOT_SUPPORTED
end
function activatedLicenseGet()
  local L0_78, L1_79, L2_80, L3_81, L4_82
  L0_78 = {}
  L1_79 = io
  L1_79 = L1_79.open
  L2_80 = licenseFileStore
  L3_81 = "r"
  L1_79 = L1_79(L2_80, L3_81)
  L2_80 = {}
  L3_81, L4_82 = nil, nil
  if L1_79 then
    repeat
      L3_81 = L1_79:read("*line")
      if nil ~= L3_81 and "" ~= L3_81 then
        if tonumber(string.sub(L3_81, 1, 2)) == 1 then
          L0_78[1] = {
            UNIT_NAME .. "-VPN",
            string.sub(L3_81, 2, 27),
            "Perpetual"
          }
        elseif tonumber(string.sub(L3_81, 1, 2)) == 2 then
          L0_78[1] = {
            UNIT_NAME .. "-AP6",
            string.sub(L3_81, 2, 27),
            "Perpetual"
          }
        elseif tonumber(string.sub(L3_81, 1, 2)) == 0 then
          L4_82 = string.sub(L3_81, 29)
          L0_78[1] = {
            UNIT_NAME .. "-WCF",
            string.sub(L3_81, 2, 27),
            os.date("%x", L4_82)
          }
        end
      end
    until L3_81 == nil
    L1_79:close()
  end
  if L0_78 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_78
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
function wcfLicenseStatusGet()
  if io.open(_UPVALUE0_.wcfLicenseFile, "r") then
    io.open(_UPVALUE0_.wcfLicenseFile, "r"):close()
    if (io.open(_UPVALUE0_.wcfLicenseFile, "r"):read("*line") or "") == _UPVALUE0_.WCF_ENABLED_STR then
      return _UPVALUE0_.WCF_ENABLED
    else
      return _UPVALUE0_.WCF_DISABLED
    end
  else
    return _UPVALUE0_.WCF_DISABLED
  end
end
