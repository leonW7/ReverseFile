local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wireless.profile", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/wireless_profile")
L0_0 = require
L0_0("teamf1lualib/dot11_returnCodes")
L0_0 = require
L0_0("teamf1lualib/wireless_radio")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).badParam = require("com.teamf1.core.wireless.dot11.returnCodes").PROF_CONFIG_BADPARAM
;({}).ProfileUsed = require("com.teamf1.core.wireless.dot11.returnCodes").PROF_CONFIG_PROFILEUSED
;({}).noProfilesFound = require("com.teamf1.core.wireless.dot11.returnCodes").PROF_CONFIG_NO_PROFILES_FOUND
;({}).dbError = require("com.teamf1.core.wireless.dot11.returnCodes").PROF_CONFIG_DBERROR
;({}).opSuccess = L0_0.SUCCESS
;({}).opFailed = L0_0.FAILURE
;({}).errProfileName = require("com.teamf1.core.wireless.dot11.returnCodes").PROF_CONFIG_ERR_PROFILENAME
;({}).errSSID = require("com.teamf1.core.wireless.dot11.returnCodes").PROF_CONFIG_ERR_SSID
;({}).errbroadcastSSID = require("com.teamf1.core.wireless.dot11.returnCodes").PROF_CONFIG_ERR_BROADCAST_SSID
;({}).errsecurity = require("com.teamf1.core.wireless.dot11.returnCodes").PROF_CONFIG_ERR_SECURITY
;({}).errwepAuth = require("com.teamf1.core.wireless.dot11.returnCodes").PROF_CONFIG_ERR_WEPAUTH
;({}).errgroupCipher = require("com.teamf1.core.wireless.dot11.returnCodes").PROF_CONFIG_ERR_GOUPCHIPHER
;({}).errerrwepKey = require("com.teamf1.core.wireless.dot11.returnCodes").PROF_CONFIG_ERR_WEPKEY
;({}).errpairwiseCiphers = require("com.teamf1.core.wireless.dot11.returnCodes").PROF_CONFIG_ERR_PAIRWISE
;({}).errauthMethods = require("com.teamf1.core.wireless.dot11.returnCodes").PROF_CONFIG_ERR_AUTHMETHODS
;({}).errpskPassAscii = require("com.teamf1.core.wireless.dot11.returnCodes").PROF_CONFIG_ERR_PSKASCII
;({}).errpreAuthStatus = require("com.teamf1.core.wireless.dot11.returnCodes").PROF_CONFIG_ERR_AUTHSTATUS
;({}).errprofileExists = require("com.teamf1.core.wireless.dot11.returnCodes").PROF_CONFIG_ERR_PROFILE_EXISTS
;({}).errssidExists = require("com.teamf1.core.wireless.dot11.returnCodes").PROF_CONFIG_ERR_SSID_EXISTS
;({}).errrowID = require("com.teamf1.core.wireless.dot11.returnCodes").PROF_CONFIG_ERR_ROWID
;({}).errWPSEnabled = require("com.teamf1.core.wireless.dot11.returnCodes").PROF_CONFIG_ERR_WPS_ENABLED
;({}).errWPSEnabled1 = require("com.teamf1.core.wireless.dot11.returnCodes").PROF_CONFIG_ERR_WPS_ENABLED1
;({}).profileConfigError = require("com.teamf1.core.wireless.dot11.returnCodes").PROF_CONFIG_PROFILE_CONFIG_ERR
;({}).UNAUTHORIZED = L0_0.UNAUTHORIZED
;({}).radioInvalid = require("com.teamf1.core.wireless.dot11.returnCodes").SELECT_RADIO_AC_ERR
;({}).addProfile = require("com.teamf1.core.wireless.dot11.returnCodes").MAX_EIGHT_PROFILES
;({}).addProfile1 = require("com.teamf1.core.wireless.dot11.returnCodes").MAX_SIX_TEEN_PROFILES
;({}).errmfpEnabled = require("com.teamf1.core.wireless.dot11.returnCodes").INVALID_MFP_OPTION_ERR
;({}).errforcePMF = require("com.teamf1.core.wireless.dot11.returnCodes").INVALID_PMF_OPTION_ERR
;({}).profileName = "profileName"
;({}).preAuthStatus = "preAuthStatus"
function wirelessProfileGet(A0_1, A1_2)
  local L2_3, L3_4, L4_5, L5_6, L6_7, L7_8
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.FAILURE
  L3_4 = _UPVALUE0_
  L3_4 = L3_4.NIL
  L4_5 = {}
  L5_6 = _UPVALUE0_
  L5_6 = L5_6.NIL
  L6_7 = _UPVALUE0_
  L6_7 = L6_7.NIL
  L7_8 = _UPVALUE0_
  L7_8 = L7_8.FAILURE
  if A0_1 == nil or A0_1 == "" or A0_1 == " " then
    return L7_8, _UPVALUE0_.BAD_PARAMETER
  end
  L7_8, L3_4, L4_5 = _UPVALUE1_.checkProfilesGet(A0_1, A1_2)
  if L7_8 ~= _UPVALUE0_.SUCCESS then
    return L7_8, L3_4, L4_5
  end
  return L7_8, L3_4, L4_5
end
function wirelessProfileGetAll()
  local L0_9, L1_10, L2_11
  L0_9 = _UPVALUE0_
  L0_9 = L0_9.FAILURE
  L1_10 = _UPVALUE0_
  L1_10 = L1_10.NIL
  L2_11 = {}
  L0_9, L1_10, L2_11 = _UPVALUE1_.availableProfilesGet()
  if L0_9 ~= _UPVALUE0_.SUCCESS then
    return L0_9
  end
  return L0_9, L1_10, L2_11
end
function wirelessProfileDeleteAll(A0_12)
  local L1_13, L2_14
  L1_13 = _UPVALUE0_
  L1_13 = L1_13.FAILURE
  L2_14 = _UPVALUE0_
  L2_14 = L2_14.NIL
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page")
    return L1_13, _UPVALUE1_.UNAUTHORIZED
  end
  if A0_12 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE2_.start()
  L1_13, L2_14 = _UPVALUE3_.deleteAvailableProfiles(A0_12)
  if L1_13 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in deleting the profiles : " .. L2_14)
    _UPVALUE2_.abort()
    return L1_13, L2_14
  end
  L1_13 = _UPVALUE0_.SUCCESS
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return L1_13, L2_14
end
function wirelessProfileEditSet(A0_15, A1_16)
  local L2_17, L3_18, L4_19, L5_20, L6_21, L7_22, L8_23, L9_24, L10_25, L11_26, L12_27, L13_28, L14_29, L15_30, L16_31, L17_32, L18_33, L19_34, L20_35, L21_36, L22_37
  L2_17 = _UPVALUE0_
  L2_17 = L2_17.FAILURE
  L3_18 = _UPVALUE0_
  L3_18 = L3_18.NIL
  L4_19 = A0_15["dot11Profile.rowID"]
  L5_20 = A0_15["dot11Profile.profileName"]
  L6_21 = A0_15["dot11Profile.ssid"]
  L7_22 = A0_15["dot11Profile.broadcastSSID"]
  L8_23 = A0_15["dot11Profile.security"]
  L9_24 = A0_15["dot11Profile.wepAuth"]
  L10_25 = A0_15["dot11Profile.groupCipher"]
  L11_26 = A0_15["dot11Profile.pskPassHex"]
  L12_27 = A0_15["dot11Profile.defWepkeyIdx"]
  L13_28 = A0_15["dot11Profile.wepkey0"]
  L14_29 = A0_15["dot11Profile.wepkey1"]
  L15_30 = A0_15["dot11Profile.wepkey2"]
  L16_31 = A0_15["dot11Profile.wepkey3"]
  L17_32 = A0_15["dot11Profile.pairwiseCiphers"]
  L18_33 = A0_15["dot11Profile.authMethods"]
  L19_34 = A0_15["dot11Profile.pskPassAscii"]
  L20_35 = A0_15["dot11Profile.preAuthStatus"]
  L21_36 = A0_15["dot11Profile.mfpEnabled"]
  L22_37 = A0_15["dot11Profile.radioMode"]
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page")
    return L2_17, _UPVALUE1_.UNAUTHORIZED
  end
  if "DSR-500AC" == UNIT_NAME then
    L22_37 = _UPVALUE2_
  end
  if "DSR-1000AC" == UNIT_NAME and L5_20 ~= "default1" and L5_20 ~= "default2" and (L22_37 == _UPVALUE0_.NIL or L22_37 == "" or L22_37 == " ") then
    return L2_17, _UPVALUE1_.radioInvalid
  end
  if "DSR-500AC" == UNIT_NAME and L5_20 ~= "default1" and (L22_37 == _UPVALUE0_.NIL or L22_37 == "" or L22_37 == " ") then
    return L2_17, _UPVALUE1_.radioInvalid
  end
  if A1_16 == "edit" then
    if A0_15["dot11Profile.rowID"] == _UPVALUE0_.NIL or A0_15["dot11Profile.rowID"] == "" or A0_15["dot11Profile.rowID"] == " " then
      return L2_17, _UPVALUE1_.badParam
    end
    L4_19 = A0_15["dot11Profile.rowID"]
  end
  if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-500AC" then
    if UNIT_NAME == "DSR-1000AC" then
      if #db.getTable("dot11Profile", false) > 15 and A1_16 == "add" then
        return L2_17, _UPVALUE1_.addProfile1
      end
    elseif #db.getTable("dot11Profile", false) > 7 and A1_16 == "add" then
      return L2_17, _UPVALUE1_.addProfile
    end
  end
  if A1_16 == "add" and (A0_15["dot11Profile.profileName"] == _UPVALUE0_.NIL or A0_15["dot11Profile.profileName"] == "" or A0_15["dot11Profile.profileName"] == " " or type(A0_15["dot11Profile.profileName"]) ~= "string") then
    return L2_17, _UPVALUE1_.badParam
  end
  L5_20 = A0_15["dot11Profile.profileName"]
  if A0_15["dot11Profile.ssid"] == _UPVALUE0_.NIL or A0_15["dot11Profile.ssid"] == "" or A0_15["dot11Profile.ssid"] == " " or type(A0_15["dot11Profile.ssid"]) ~= "string" then
    return L2_17, _UPVALUE1_.badParam
  end
  L6_21 = A0_15["dot11Profile.ssid"]
  if A0_15["dot11Profile.broadcastSSID"] == _UPVALUE0_.NIL or A0_15["dot11Profile.broadcastSSID"] == "" or A0_15["dot11Profile.broadcastSSID"] == " " then
    return L2_17, _UPVALUE1_.errbroadcastSSID
  end
  A0_15["dot11Profile.broadcastSSID"] = tonumber(A0_15["dot11Profile.broadcastSSID"])
  L7_22 = A0_15["dot11Profile.broadcastSSID"]
  if A0_15["dot11Profile.security"] == _UPVALUE0_.NIL or A0_15["dot11Profile.security"] == "" or A0_15["dot11Profile.security"] == "" or A0_15["dot11Profile.security"] ~= "OPEN" and A0_15["dot11Profile.security"] ~= "WEP" and A0_15["dot11Profile.security"] ~= "WPA" and A0_15["dot11Profile.security"] ~= "WPA2" and A0_15["dot11Profile.security"] ~= "WPA+WPA2" then
    return L2_17, _UPVALUE1_.errsecurity
  end
  A0_15["dot11Profile.security"] = A0_15["dot11Profile.security"]
  L8_23 = A0_15["dot11Profile.security"]
  if A0_15["dot11Profile.security"] == "WEP" then
    if A0_15["dot11Profile.wepAuth"] == _UPVALUE0_.NIL or A0_15["dot11Profile.wepAuth"] == "" or A0_15["dot11Profile.wepAuth"] == " " or A0_15["dot11Profile.wepAuth"] ~= "Open" and A0_15["dot11Profile.wepAuth"] ~= "Shared" or type(A0_15["dot11Profile.wepAuth"]) ~= "string" then
      return L2_17, _UPVALUE1_.badParam
    end
    L9_24 = A0_15["dot11Profile.wepAuth"]
    if A0_15["dot11Profile.groupCipher"] == _UPVALUE0_.NIL or A0_15["dot11Profile.groupCipher"] == "" or A0_15["dot11Profile.groupCipher"] == " " or A0_15["dot11Profile.groupCipher"] ~= "64" and A0_15["dot11Profile.groupCipher"] ~= "128" or type(A0_15["dot11Profile.groupCipher"]) ~= "string" then
      return L2_17, _UPVALUE1_.badParam
    end
    L10_25 = A0_15["dot11Profile.groupCipher"]
    if A0_15["dot11Profile.pskPassHex"] ~= _UPVALUE0_.NIL then
      L11_26 = A0_15["dot11Profile.pskPassHex"]
    end
    if A0_15["dot11Profile.defWepkeyIdx"] == _UPVALUE0_.NIL then
      return L2_17, _UPVALUE1_.badParam
    end
    L12_27 = A0_15["dot11Profile.defWepkeyIdx"]
    if A0_15["dot11Profile.wepkey0"] ~= _UPVALUE0_.NIL then
      L13_28 = A0_15["dot11Profile.wepkey0"]
    end
    if A0_15["dot11Profile.wepkey1"] ~= _UPVALUE0_.NIL then
      L14_29 = A0_15["dot11Profile.wepkey1"]
    end
    if A0_15["dot11Profile.wepkey2"] ~= _UPVALUE0_.NIL then
      L15_30 = A0_15["dot11Profile.wepkey2"]
    end
    if A0_15["dot11Profile.wepkey3"] ~= _UPVALUE0_.NIL then
      L16_31 = A0_15["dot11Profile.wepkey3"]
    end
  end
  if A0_15["dot11Profile.security"] == "WPA" then
    if A0_15["dot11Profile.pairwiseCiphers"] == _UPVALUE0_.NIL or A0_15["dot11Profile.pairwiseCiphers"] == "" or A0_15["dot11Profile.pairwiseCiphers"] == " " or A0_15["dot11Profile.pairwiseCiphers"] ~= "TKIP" and A0_15["dot11Profile.pairwiseCiphers"] ~= "TKIP+CCMP" or type(A0_15["dot11Profile.pairwiseCiphers"]) ~= "string" then
      return L2_17, _UPVALUE1_.badParam
    end
    L17_32 = A0_15["dot11Profile.pairwiseCiphers"]
    if A0_15["dot11Profile.authMethods"] == _UPVALUE0_.NIL or A0_15["dot11Profile.authMethods"] == "" or A0_15["dot11Profile.authMethods"] == " " or A0_15["dot11Profile.authMethods"] ~= "PSK" and A0_15["dot11Profile.authMethods"] ~= "RADIUS" and A0_15["dot11Profile.authMethods"] ~= "PSK+RADIUS" or type(A0_15["dot11Profile.authMethods"]) ~= "string" then
      return L2_17, _UPVALUE1_.badParam
    end
    L18_33 = A0_15["dot11Profile.authMethods"]
    if A0_15["dot11Profile.authMethods"] ~= "RADIUS" then
      if A0_15["dot11Profile.pskPassAscii"] == _UPVALUE0_.NIL then
        return L2_17, _UPVALUE1_.badParam
      end
      L19_34 = A0_15["dot11Profile.pskPassAscii"]
    end
  end
  if A0_15["dot11Profile.security"] == "WPA2" then
    if A0_15["dot11Profile.pairwiseCiphers"] == _UPVALUE0_.NIL or A0_15["dot11Profile.pairwiseCiphers"] == "" or A0_15["dot11Profile.pairwiseCiphers"] == " " or A0_15["dot11Profile.pairwiseCiphers"] ~= "CCMP" and A0_15["dot11Profile.pairwiseCiphers"] ~= "TKIP+CCMP" or type(A0_15["dot11Profile.pairwiseCiphers"]) ~= "string" then
      return L2_17, _UPVALUE1_.badParam
    end
    L17_32 = A0_15["dot11Profile.pairwiseCiphers"]
    if A0_15["dot11Profile.authMethods"] == _UPVALUE0_.NIL or A0_15["dot11Profile.authMethods"] == "" or A0_15["dot11Profile.authMethods"] == " " or A0_15["dot11Profile.authMethods"] ~= "PSK" and A0_15["dot11Profile.authMethods"] ~= "RADIUS" and A0_15["dot11Profile.authMethods"] ~= "PSK+RADIUS" or type(A0_15["dot11Profile.authMethods"]) ~= "string" then
      return L2_17, _UPVALUE1_.badParam
    end
    L18_33 = A0_15["dot11Profile.authMethods"]
    if A0_15["dot11Profile.authMethods"] ~= "RADIUS" then
      if A0_15["dot11Profile.pskPassAscii"] == _UPVALUE0_.NIL then
        return L2_17, _UPVALUE1_.badParam
      end
      L19_34 = A0_15["dot11Profile.pskPassAscii"]
      if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-500AC" then
        if A0_15["dot11Profile.mfpEnabled"] == _UPVALUE0_.NIL then
          L21_36 = db.getAttribute(_UPVALUE3_, _UPVALUE4_.profileName, A0_15["dot11Profile.profileName"], _UPVALUE4_.preAuthStatus)
          if L21_36 == _UPVALUE0_.NIL then
            return L2_17, _UPVALUE1_.errmfpEnabled
          end
        end
        if A0_15["dot11Profile.forcePMF"] == _UPVALUE0_.NIL then
          L21_36 = db.getAttribute(_UPVALUE3_, _UPVALUE4_.profileName, A0_15["dot11Profile.profileName"], _UPVALUE4_.preAuthStatus)
          if L21_36 == _UPVALUE0_.NIL then
            return L2_17, _UPVALUE1_.errforcePMF
          end
        end
        if A0_15["dot11Profile.mfpEnabled"] == "1" then
          if A0_15["dot11Profile.forcePMF"] == "1" then
            L21_36 = "192"
          else
            L21_36 = "128"
          end
        elseif A0_15["dot11Profile.mfpEnabled"] == "0" then
          L21_36 = "0"
        end
        L20_35 = L21_36
      end
    else
      if A0_15["dot11Profile.preAuthStatus"] == _UPVALUE0_.NIL then
        return L2_17, _UPVALUE1_.badParam
      end
      L20_35 = A0_15["dot11Profile.preAuthStatus"]
    end
  end
  if A0_15["dot11Profile.security"] == "WPA+WPA2" then
    if A0_15["dot11Profile.pairwiseCiphers"] == _UPVALUE0_.NIL or A0_15["dot11Profile.pairwiseCiphers"] == "" or A0_15["dot11Profile.pairwiseCiphers"] == " " or A0_15["dot11Profile.pairwiseCiphers"] ~= "TKIP+CCMP" or type(A0_15["dot11Profile.pairwiseCiphers"]) ~= "string" then
      return L2_17, _UPVALUE1_.badParam
    end
    L17_32 = A0_15["dot11Profile.pairwiseCiphers"]
    if A0_15["dot11Profile.authMethods"] == _UPVALUE0_.NIL or A0_15["dot11Profile.authMethods"] == "" or A0_15["dot11Profile.authMethods"] == " " or A0_15["dot11Profile.authMethods"] ~= "PSK" and A0_15["dot11Profile.authMethods"] ~= "RADIUS" and A0_15["dot11Profile.authMethods"] ~= "PSK+RADIUS" or type(A0_15["dot11Profile.authMethods"]) ~= "string" then
      return L2_17, _UPVALUE1_.badParam
    end
    L18_33 = A0_15["dot11Profile.authMethods"]
    if A0_15["dot11Profile.authMethods"] ~= "RADIUS" then
      if A0_15["dot11Profile.pskPassAscii"] == _UPVALUE0_.NIL then
        return L2_17, _UPVALUE1_.badParam
      end
      L19_34 = A0_15["dot11Profile.pskPassAscii"]
      if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-500AC" then
        if A0_15["dot11Profile.mfpEnabled"] == _UPVALUE0_.NIL then
          L21_36 = db.getAttribute(_UPVALUE3_, _UPVALUE4_.profileName, A0_15["dot11Profile.profileName"], _UPVALUE4_.preAuthStatus)
          if L21_36 == _UPVALUE0_.NIL then
            return L2_17, _UPVALUE1_.errmfpEnabled
          end
        end
        if A0_15["dot11Profile.forcePMF"] == _UPVALUE0_.NIL then
          L21_36 = db.getAttribute(_UPVALUE3_, _UPVALUE4_.profileName, A0_15["dot11Profile.profileName"], _UPVALUE4_.preAuthStatus)
          if L21_36 == _UPVALUE0_.NIL then
            return L2_17, _UPVALUE1_.errforcePMF
          end
        end
        if A0_15["dot11Profile.mfpEnabled"] == "1" then
          if A0_15["dot11Profile.forcePMF"] == "1" then
            L21_36 = "192"
          else
            L21_36 = "128"
          end
        elseif A0_15["dot11Profile.mfpEnabled"] == "0" then
          L21_36 = "0"
        end
        L20_35 = L21_36
      end
    end
  end
  _UPVALUE5_.start()
  if A1_16 == "add" then
    if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-500AC" then
      L2_17, L3_18 = _UPVALUE6_.acProfileSettingsCreate(L4_19, L5_20, L6_21, L7_22, L8_23, L9_24, L10_25, L11_26, L12_27, L13_28, L14_29, L15_30, L16_31, L17_32, L18_33, L19_34, L20_35, L22_37)
    else
      L2_17, L3_18 = _UPVALUE6_.profileSettingsCreate(L4_19, L5_20, L6_21, L7_22, L8_23, L9_24, L10_25, L11_26, L12_27, L13_28, L14_29, L15_30, L16_31, L17_32, L18_33, L19_34)
    end
  elseif UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-500AC" then
    L2_17, L3_18 = _UPVALUE6_.acProfileSettingsEdit(L4_19, L5_20, L6_21, L7_22, L8_23, L9_24, L10_25, L11_26, L12_27, L13_28, L14_29, L15_30, L16_31, L17_32, L18_33, L19_34, L20_35, L22_37)
  else
    L2_17, L3_18 = _UPVALUE6_.profileSettingsEdit(L4_19, L5_20, L6_21, L7_22, L8_23, L9_24, L10_25, L11_26, L12_27, L13_28, L14_29, L15_30, L16_31, L17_32, L18_33, L19_34)
  end
  if L2_17 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring profiles " .. L3_18)
    _UPVALUE5_.abort()
    return L2_17, L3_18
  end
  _UPVALUE5_.complete()
  _UPVALUE5_.save()
  L2_17 = _UPVALUE0_.SUCCESS
  return L2_17, L3_18
end
function getRadioOptionMode()
  local L0_38, L1_39
  L0_38 = _UPVALUE0_
  L0_38 = L0_38.getRadioConfOptionMode
  L1_39 = L0_38()
  return L0_38, L1_39
end
function radioBandGet(A0_40, A1_41)
  return (_UPVALUE0_.getProfileRadioBand(A0_40, A1_41))
end
function snmp_wirelessProfileEditSet(A0_42)
  local L1_43, L2_44, L3_45, L4_46, L5_47, L6_48, L7_49, L8_50, L9_51, L10_52, L11_53, L12_54, L13_55, L14_56, L15_57, L16_58, L17_59, L18_60, L19_61, L20_62, L21_63, L22_64
  L1_43 = _UPVALUE0_
  L1_43 = L1_43.FAILURE
  L2_44 = _UPVALUE0_
  L2_44 = L2_44.NIL
  L3_45 = A0_42["dot11Profile.rowID"]
  L4_46 = A0_42["dot11Profile.profileName"]
  L5_47 = A0_42["dot11Profile.ssid"]
  L6_48 = A0_42["dot11Profile.broadcastSSID"]
  L7_49 = A0_42["dot11Profile.security"]
  L8_50 = A0_42["dot11Profile.wepAuth"]
  L9_51 = A0_42["dot11Profile.groupCipher"]
  L10_52 = A0_42["dot11Profile.pskPassHex"]
  L11_53 = A0_42["dot11Profile.defWepkeyIdx"]
  L12_54 = A0_42["dot11Profile.wepkey0"]
  L13_55 = A0_42["dot11Profile.wepkey1"]
  L14_56 = A0_42["dot11Profile.wepkey2"]
  L15_57 = A0_42["dot11Profile.wepkey3"]
  L16_58 = A0_42["dot11Profile.pairwiseCiphers"]
  L17_59 = A0_42["dot11Profile.authMethods"]
  L18_60 = A0_42["dot11Profile.pskPassAscii"]
  L19_61 = A0_42["dot11Profile.preAuthStatus"]
  L20_62 = A0_42["dot11Profile.mfpEnabled"]
  L21_63 = A0_42["dot11Profile.radioMode"]
  L22_64 = A0_42["dot11Profile.operation"]
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page")
    return L1_43, _UPVALUE1_.UNAUTHORIZED
  end
  if "DSR-500AC" == UNIT_NAME then
    L21_63 = _UPVALUE2_
  end
  if "DSR-1000AC" == UNIT_NAME and L4_46 ~= "default1" and L4_46 ~= "default2" then
    if L21_63 == _UPVALUE0_.NIL or L21_63 == "" or L21_63 == " " then
      return L1_43, _UPVALUE1_.badParam .. _UPVALUE1_.radioInvalid
    end
  elseif "DSR-1000AC" == UNIT_NAME and L4_46 == "default1" then
    L21_63 = "a"
  elseif "DSR-1000AC" == UNIT_NAME and L4_46 == "default2" then
    L21_63 = "b"
  end
  if "DSR-500AC" == UNIT_NAME and L4_46 ~= "default1" and (L21_63 == _UPVALUE0_.NIL or L21_63 == "" or L21_63 == " ") then
    return L1_43, _UPVALUE1_.badParam .. _UPVALUE1_.radioInvalid
  end
  if L22_64 == "edit" then
    if A0_42["dot11Profile.rowID"] == _UPVALUE0_.NIL or A0_42["dot11Profile.rowID"] == "" or A0_42["dot11Profile.rowID"] == " " then
      return L1_43, _UPVALUE1_.badParam .. _UPVALUE1_.errrowID
    end
    L3_45 = A0_42["dot11Profile.rowID"]
  end
  if UNIT_NAME == "DSR-1000AC" then
    if #db.getTable("dot11Profile", false) > 15 and L22_64 == "add" then
      return L1_43, _UPVALUE1_.addProfile1
    end
  elseif #db.getTable("dot11Profile", false) > 7 and L22_64 == "add" then
    return L1_43, _UPVALUE1_.addProfile
  end
  if L22_64 == "add" and (A0_42["dot11Profile.profileName"] == _UPVALUE0_.NIL or A0_42["dot11Profile.profileName"] == "" or A0_42["dot11Profile.profileName"] == " " or type(A0_42["dot11Profile.profileName"]) ~= "string") then
    return L1_43, _UPVALUE1_.badParam .. _UPVALUE1_.errProfileName
  end
  L4_46 = A0_42["dot11Profile.profileName"]
  if A0_42["dot11Profile.ssid"] == _UPVALUE0_.NIL or A0_42["dot11Profile.ssid"] == "" or A0_42["dot11Profile.ssid"] == " " or type(A0_42["dot11Profile.ssid"]) ~= "string" then
    return L1_43, _UPVALUE1_.badParam .. _UPVALUE1_.errSSID
  end
  L5_47 = A0_42["dot11Profile.ssid"]
  if A0_42["dot11Profile.broadcastSSID"] == _UPVALUE0_.NIL or A0_42["dot11Profile.broadcastSSID"] == "" or A0_42["dot11Profile.broadcastSSID"] == " " then
    return L1_43, _UPVALUE1_.errbroadcastSSID
  end
  A0_42["dot11Profile.broadcastSSID"] = tonumber(A0_42["dot11Profile.broadcastSSID"])
  L6_48 = A0_42["dot11Profile.broadcastSSID"]
  if A0_42["dot11Profile.security"] == _UPVALUE0_.NIL or A0_42["dot11Profile.security"] == "" or A0_42["dot11Profile.security"] == "" or A0_42["dot11Profile.security"] ~= "OPEN" and A0_42["dot11Profile.security"] ~= "WEP" and A0_42["dot11Profile.security"] ~= "WPA" and A0_42["dot11Profile.security"] ~= "WPA2" and A0_42["dot11Profile.security"] ~= "WPA+WPA2" then
    return L1_43, _UPVALUE1_.errsecurity
  end
  A0_42["dot11Profile.security"] = A0_42["dot11Profile.security"]
  L7_49 = A0_42["dot11Profile.security"]
  if A0_42["dot11Profile.security"] == "WEP" then
    if A0_42["dot11Profile.wepAuth"] == _UPVALUE0_.NIL or A0_42["dot11Profile.wepAuth"] == "" or A0_42["dot11Profile.wepAuth"] == " " or A0_42["dot11Profile.wepAuth"] ~= "Open" and A0_42["dot11Profile.wepAuth"] ~= "Shared" or type(A0_42["dot11Profile.wepAuth"]) ~= "string" then
      return L1_43, _UPVALUE1_.badParam .. _UPVALUE1_.errwepAuth
    end
    L8_50 = A0_42["dot11Profile.wepAuth"]
    if A0_42["dot11Profile.groupCipher"] == _UPVALUE0_.NIL or A0_42["dot11Profile.groupCipher"] == "" or A0_42["dot11Profile.groupCipher"] == " " or A0_42["dot11Profile.groupCipher"] ~= "64" and A0_42["dot11Profile.groupCipher"] ~= "128" or type(A0_42["dot11Profile.groupCipher"]) ~= "string" then
      return L1_43, _UPVALUE1_.badParam .. _UPVALUE1_.errgroupCipher
    end
    L9_51 = A0_42["dot11Profile.groupCipher"]
    if A0_42["dot11Profile.pskPassHex"] ~= _UPVALUE0_.NIL then
      L10_52 = A0_42["dot11Profile.pskPassHex"]
    end
    if A0_42["dot11Profile.defWepkeyIdx"] == _UPVALUE0_.NIL then
      return L1_43, _UPVALUE1_.badParam .. _UPVALUE1_.errwepKey
    end
    L11_53 = A0_42["dot11Profile.defWepkeyIdx"]
    if A0_42["dot11Profile.wepkey0"] ~= _UPVALUE0_.NIL then
      L12_54 = A0_42["dot11Profile.wepkey0"]
    end
    if A0_42["dot11Profile.wepkey1"] ~= _UPVALUE0_.NIL then
      L13_55 = A0_42["dot11Profile.wepkey1"]
    end
    if A0_42["dot11Profile.wepkey2"] ~= _UPVALUE0_.NIL then
      L14_56 = A0_42["dot11Profile.wepkey2"]
    end
    if A0_42["dot11Profile.wepkey3"] ~= _UPVALUE0_.NIL then
      L15_57 = A0_42["dot11Profile.wepkey3"]
    end
  end
  if A0_42["dot11Profile.security"] == "WPA" then
    if A0_42["dot11Profile.pairwiseCiphers"] == _UPVALUE0_.NIL or A0_42["dot11Profile.pairwiseCiphers"] == "" or A0_42["dot11Profile.pairwiseCiphers"] == " " or A0_42["dot11Profile.pairwiseCiphers"] ~= "TKIP" and A0_42["dot11Profile.pairwiseCiphers"] ~= "TKIP+CCMP" or type(A0_42["dot11Profile.pairwiseCiphers"]) ~= "string" then
      return L1_43, _UPVALUE1_.badParam .. _UPVALUE1_.errpairwiseCiphers
    end
    L16_58 = A0_42["dot11Profile.pairwiseCiphers"]
    if A0_42["dot11Profile.authMethods"] == _UPVALUE0_.NIL or A0_42["dot11Profile.authMethods"] == "" or A0_42["dot11Profile.authMethods"] == " " or A0_42["dot11Profile.authMethods"] ~= "PSK" and A0_42["dot11Profile.authMethods"] ~= "RADIUS" and A0_42["dot11Profile.authMethods"] ~= "PSK+RADIUS" or type(A0_42["dot11Profile.authMethods"]) ~= "string" then
      return L1_43, _UPVALUE1_.badParam .. _UPVALUE1_.errauthMethods
    end
    L17_59 = A0_42["dot11Profile.authMethods"]
    if A0_42["dot11Profile.authMethods"] ~= "RADIUS" then
      if A0_42["dot11Profile.pskPassAscii"] == _UPVALUE0_.NIL then
        return L1_43, _UPVALUE1_.badParam .. _UPVALUE1_.errpskPassAscii
      end
      L18_60 = A0_42["dot11Profile.pskPassAscii"]
    end
  end
  if A0_42["dot11Profile.security"] == "WPA2" then
    if A0_42["dot11Profile.pairwiseCiphers"] == _UPVALUE0_.NIL or A0_42["dot11Profile.pairwiseCiphers"] == "" or A0_42["dot11Profile.pairwiseCiphers"] == " " or A0_42["dot11Profile.pairwiseCiphers"] ~= "CCMP" and A0_42["dot11Profile.pairwiseCiphers"] ~= "TKIP+CCMP" or type(A0_42["dot11Profile.pairwiseCiphers"]) ~= "string" then
      return L1_43, _UPVALUE1_.badParam .. _UPVALUE1_.errpairwiseCiphers
    end
    L16_58 = A0_42["dot11Profile.pairwiseCiphers"]
    if A0_42["dot11Profile.authMethods"] == _UPVALUE0_.NIL or A0_42["dot11Profile.authMethods"] == "" or A0_42["dot11Profile.authMethods"] == " " or A0_42["dot11Profile.authMethods"] ~= "PSK" and A0_42["dot11Profile.authMethods"] ~= "RADIUS" and A0_42["dot11Profile.authMethods"] ~= "PSK+RADIUS" or type(A0_42["dot11Profile.authMethods"]) ~= "string" then
      return L1_43, _UPVALUE1_.badParam .. _UPVALUE1_.errauthMethods
    end
    L17_59 = A0_42["dot11Profile.authMethods"]
    if A0_42["dot11Profile.authMethods"] ~= "RADIUS" then
      if A0_42["dot11Profile.pskPassAscii"] == _UPVALUE0_.NIL then
        return L1_43, _UPVALUE1_.badParam .. _UPVALUE1_.errpskPassAscii
      end
      L18_60 = A0_42["dot11Profile.pskPassAscii"]
      if A0_42["dot11Profile.mfpEnabled"] == _UPVALUE0_.NIL then
        return L1_43, _UPVALUE1_.badParam .. _UPVALUE1_.errmfpEnabled
      end
      if A0_42["dot11Profile.forcePMF"] == _UPVALUE0_.NIL then
        return L1_43, _UPVALUE1_.badParam .. _UPVALUE1_.errforcePMF
      end
      if A0_42["dot11Profile.mfpEnabled"] == "1" then
        if A0_42["dot11Profile.forcePMF"] == "1" then
          L20_62 = "192"
        else
          L20_62 = "128"
        end
      else
        L20_62 = "0"
      end
      L19_61 = L20_62
    else
      if A0_42["dot11Profile.preAuthStatus"] == _UPVALUE0_.NIL then
        return L1_43, _UPVALUE1_.badParam .. _UPVALUE1_.errpreAuthStatus
      end
      L19_61 = A0_42["dot11Profile.preAuthStatus"]
    end
  end
  if A0_42["dot11Profile.security"] == "WPA+WPA2" then
    if A0_42["dot11Profile.pairwiseCiphers"] == _UPVALUE0_.NIL or A0_42["dot11Profile.pairwiseCiphers"] == "" or A0_42["dot11Profile.pairwiseCiphers"] == " " or A0_42["dot11Profile.pairwiseCiphers"] ~= "TKIP+CCMP" or type(A0_42["dot11Profile.pairwiseCiphers"]) ~= "string" then
      return L1_43, _UPVALUE1_.badParam .. _UPVALUE1_.errpairwiseCiphers
    end
    L16_58 = A0_42["dot11Profile.pairwiseCiphers"]
    if A0_42["dot11Profile.authMethods"] == _UPVALUE0_.NIL or A0_42["dot11Profile.authMethods"] == "" or A0_42["dot11Profile.authMethods"] == " " or A0_42["dot11Profile.authMethods"] ~= "PSK" and A0_42["dot11Profile.authMethods"] ~= "RADIUS" and A0_42["dot11Profile.authMethods"] ~= "PSK+RADIUS" or type(A0_42["dot11Profile.authMethods"]) ~= "string" then
      return L1_43, _UPVALUE1_.badParam .. _UPVALUE1_.errauthMethods
    end
    L17_59 = A0_42["dot11Profile.authMethods"]
    if A0_42["dot11Profile.authMethods"] ~= "RADIUS" then
      if A0_42["dot11Profile.pskPassAscii"] == _UPVALUE0_.NIL then
        return L1_43, _UPVALUE1_.badParam .. _UPVALUE1_.errpskPassAscii
      end
      L18_60 = A0_42["dot11Profile.pskPassAscii"]
      if A0_42["dot11Profile.mfpEnabled"] == _UPVALUE0_.NIL then
        return L1_43, _UPVALUE1_.badParam .. _UPVALUE1_.errmfpEnabled
      end
      if A0_42["dot11Profile.forcePMF"] == _UPVALUE0_.NIL then
        return L1_43, _UPVALUE1_.badParam .. _UPVALUE1_.errforcePMF
      end
      if A0_42["dot11Profile.mfpEnabled"] == "1" then
        if A0_42["dot11Profile.forcePMF"] == "1" then
          L20_62 = "192"
        else
          L20_62 = "128"
        end
      else
        L20_62 = "0"
      end
      L19_61 = L20_62
    end
  end
  _UPVALUE3_.start()
  if L22_64 == "add" then
    L1_43, L2_44 = _UPVALUE4_.profileSettingsCreate(L3_45, L4_46, L5_47, L6_48, L7_49, L8_50, L9_51, L10_52, L11_53, L12_54, L13_55, L14_56, L15_57, L16_58, L17_59, L18_60, L19_61, L21_63)
  else
    L1_43, L2_44 = _UPVALUE4_.profileSettingsEdit(L3_45, L4_46, L5_47, L6_48, L7_49, L8_50, L9_51, L10_52, L11_53, L12_54, L13_55, L14_56, L15_57, L16_58, L17_59, L18_60, L19_61, L21_63)
  end
  if L1_43 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring profiles " .. L2_44)
    _UPVALUE3_.abort()
    return L1_43, L2_44
  end
  _UPVALUE3_.complete()
  _UPVALUE3_.save()
  L1_43 = _UPVALUE0_.SUCCESS
  return L1_43, L2_44
end
