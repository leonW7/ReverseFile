local L0_0
L0_0 = module
L0_0("com.teamf1.core.wireless.profile", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/dot11_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).profileName = "profileName"
;({}).vapName = "vapName"
;({}).vapEnabled = "vapEnabled"
;({}).radioList = "radioList"
;({}).interfaceName = "interfaceName"
;({}).vapName = "vapName"
;({}).rowId = "_ROWID_"
;({}).radioNo = "radioNo"
;({}).interfaceName = "interfaceName"
;({}).portEnabled = "portEnabled"
;({}).profileName = "profileName"
;({}).ssid = "ssid"
;({}).authserver = "authserver"
;({}).broadcastSSID = "broadcastSSID"
;({}).pskPassAscii = "pskPassAscii"
;({}).pskPassHex = "pskPassHex"
;({}).wepkey0 = "wepkey0"
;({}).wepkey1 = "wepkey1"
;({}).wepkey2 = "wepkey2"
;({}).wepkey3 = "wepkey3"
;({}).defWepkeyIdx = "defWepkeyIdx"
;({}).groupCipher = "groupCipher"
;({}).pairwiseCiphers = "pairwiseCiphers"
;({}).authMethods = "authMethods"
;({}).security = "security"
;({}).wepAuth = "wepAuth"
;({}).preAuthStatus = "preAuthStatus"
;({}).assocTimeout = "assocTimeout"
;({}).radioMode = "radioMode"
;({}).ROWID = "_ROWID_"
DOT11_RADIO_TAB_attr = {}
DOT11_RADIO_TAB_attr.wdsEnabled = "wdsEnabled"
DOT11_RADIO_TAB_attr.opMode = "opMode"
DOT11_RADIO_TAB_attr.radioNo = "radioNo"
DOT11_RADIO_TAB_attr.band = "band"
DOT11_WDS_PEERS_TAB_attr = {}
DOT11_WDS_PEERS_TAB_attr.pairwiseCipher = "pairwiseCipher"
VLANPORT_MGMT_TAB_attr = {}
VLANPORT_MGMT_TAB_attr.PhyInterfaceName = "PhyInterfaceName"
VLANPORT_MGMT_TAB_attr.portName = "portName"
VLANPORT_MGMT_TAB_attr.PortType = "PortType"
;({}).profileName = "profileName"
;({}).vapName = "vapName"
;({}).wpsEnabled = "wpsEnabled"
;({}).regionInfo = "regionInfo"
if UNIT_NAME == "DSR-1000AC" then
  DEFAULT1_PROFILE = "default1"
  DEFAULT2_PROFILE = "default2"
end
if UNIT_NAME == "DSR-500AC" then
  DEFAULT1_PROFILE = "default1"
end
;({}).badParam = require("com.teamf1.core.wireless.dot11.returnCodes").PROF_CONFIG_BADPARAM
;({}).ProfileUsed = require("com.teamf1.core.wireless.dot11.returnCodes").PROF_CONFIG_PROFILEUSED
;({}).noProfilesFound = require("com.teamf1.core.wireless.dot11.returnCodes").PROF_CONFIG_NO_PROFILES_FOUND
;({}).dbError = require("com.teamf1.core.wireless.dot11.returnCodes").PROF_CONFIG_NO_PROFILES_FOUND
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
;({}).ProfileUsedErr = require("com.teamf1.core.wireless.dot11.returnCodes").PROF_CONFIG_PROFILE_USED_ERR
;({}).ProfileDefault = require("com.teamf1.core.wireless.dot11.returnCodes").DEFAULT_AP_DELETE_ERROR
;({}).badSecurity = require("com.teamf1.core.wireless.dot11.returnCodes").HT_WPA_WEP_ERROR
;({}).maxApPerRadioError = require("com.teamf1.core.wireless.dot11.returnCodes").AC_MAX_ALLWOWED_VAPS
function getdefaultAP(A0_1)
  if A0_1 == 2 then
    _UPVALUE0_ = "ap5"
  end
end
function disableBridgePortsForThisProfile(A0_2)
  local L1_3, L2_4, L3_5, L4_6, L5_7, L6_8
  L1_3 = _UPVALUE0_
  L1_3 = L1_3.NIL
  L2_4 = _UPVALUE0_
  L2_4 = L2_4.NIL
  L3_5 = _UPVALUE0_
  L3_5 = L3_5.FALSE
  L4_6 = {}
  L5_7 = {}
  L6_8 = _UPVALUE0_
  L6_8 = L6_8.FAILURE
  L5_7 = db.getRowsWithJoin({
    _UPVALUE1_ .. ":" .. _UPVALUE2_ .. ":" .. _UPVALUE3_
  }, _UPVALUE1_ .. "." .. _UPVALUE4_.vapName, A0_2)
  for _FORV_10_, _FORV_11_ in pairs(L5_7) do
    L2_4 = _FORV_11_[_UPVALUE2_ .. "." .. _UPVALUE5_.interfaceName]
    L1_3 = db.getAttribute(_UPVALUE6_, _UPVALUE6_ .. "." .. _UPVALUE7_.interfaceName, L2_4, _UPVALUE8_)
    L4_6 = {}
    L4_6[_UPVALUE6_ .. "." .. _UPVALUE7_.portEnabled] = _UPVALUE9_
    L3_5 = db.update(_UPVALUE6_, L4_6, L1_3)
    if not L3_5 then
      return L6_8, _UPVALUE10_.opFailed
    end
  end
  L6_8 = _UPVALUE0_.SUCCESS
  return L6_8, _UPVALUE10_.opSuccess
end
function enableBridgePortsForThisProfile(A0_9)
  local L1_10, L2_11, L3_12, L4_13, L5_14, L6_15
  L1_10 = _UPVALUE0_
  L1_10 = L1_10.NIL
  L2_11 = _UPVALUE0_
  L2_11 = L2_11.NIL
  L3_12 = _UPVALUE0_
  L3_12 = L3_12.FALSE
  L4_13 = {}
  L5_14 = {}
  L6_15 = _UPVALUE0_
  L6_15 = L6_15.FAILURE
  L5_14 = db.getRowsWithJoin({
    _UPVALUE1_ .. ":" .. _UPVALUE2_ .. ":" .. _UPVALUE3_
  }, _UPVALUE1_ .. "." .. _UPVALUE4_.vapName, A0_9)
  for _FORV_10_, _FORV_11_ in pairs(L5_14) do
    L2_11 = _FORV_11_[_UPVALUE2_ .. "." .. _UPVALUE5_.interfaceName]
    L1_10 = db.getAttribute(_UPVALUE6_, _UPVALUE6_ .. "." .. _UPVALUE7_.interfaceName, L2_11, _UPVALUE8_)
    L4_13 = {}
    L4_13[_UPVALUE6_ .. "." .. _UPVALUE7_.portEnabled] = _UPVALUE9_
    L3_12 = db.update(_UPVALUE6_, L4_13, L1_10)
    if not L3_12 then
      return L6_15, _UPVALUE10_.opFailed
    end
  end
  L6_15 = _UPVALUE0_.SUCCESS
  return L6_15, _UPVALUE10_.opSuccess
end
function modifyBridgePortsForThisProfile(A0_16, A1_17)
  local L2_18, L3_19, L4_20, L5_21
  L2_18 = _UPVALUE0_
  L2_18 = L2_18.NIL
  L3_19 = _UPVALUE0_
  L3_19 = L3_19.NIL
  L4_20 = {}
  L5_21 = _UPVALUE0_
  L5_21 = L5_21.FAILURE
  L4_20 = db.getRowsWhere(_UPVALUE1_, _UPVALUE2_.vapEnabled .. " = '1' and " .. _UPVALUE2_.profileName .. " = '" .. A0_16 .. "'")
  for _FORV_9_, _FORV_10_ in pairs(L4_20) do
    L2_18 = _FORV_10_[_UPVALUE1_ .. "." .. _UPVALUE2_.vapName]
    if A1_17 == _UPVALUE3_ then
      L5_21, statusMessage = enableBridgePortsForThisProfile(L2_18)
    else
      L5_21, statusMessage = disableBridgePortsForThisProfile(L2_18)
    end
    if L5_21 ~= _UPVALUE0_.SUCCESS then
      return L5_21, statusMessage
    end
  end
  L5_21 = _UPVALUE0_.SUCCESS
  return L5_21, _UPVALUE4_.opSuccess
end
function profileSettingsEdit(A0_22, A1_23, A2_24, A3_25, A4_26, A5_27, A6_28, A7_29, A8_30, A9_31, A10_32, A11_33, A12_34, A13_35, A14_36, A15_37, A16_38)
  local L17_39, L18_40, L19_41, L20_42, L21_43, L22_44, L23_45, L24_46, L25_47, L26_48, L27_49, L28_50
  L17_39 = {}
  L18_40 = {}
  L19_41 = {}
  L20_42 = _UPVALUE0_
  L20_42 = L20_42.NIL
  L21_43 = _UPVALUE0_
  L21_43 = L21_43.NIL
  L22_44 = _UPVALUE1_
  L22_44 = L22_44.opFailed
  L23_45 = _UPVALUE0_
  L23_45 = L23_45.NIL
  L24_46 = _UPVALUE0_
  L24_46 = L24_46.NIL
  L25_47 = _UPVALUE0_
  L25_47 = L25_47.NIL
  L26_48 = _UPVALUE0_
  L26_48 = L26_48.NIL
  L27_49 = _UPVALUE0_
  L27_49 = L27_49.FALSE
  L28_50 = _UPVALUE0_
  L28_50 = L28_50.FAILURE
  L21_43 = db.getAttribute(_UPVALUE2_, _UPVALUE3_.vapName, _UPVALUE4_, _UPVALUE3_.profileName)
  if L21_43 == _UPVALUE0_.NIL then
    return L28_50, _UPVALUE1_.dbError
  end
  L20_42 = db.getAttribute(_UPVALUE5_, _UPVALUE5_ .. "." .. _UPVALUE6_.ROWID, A0_22, _UPVALUE6_.ssid)
  L23_45 = db.getAttribute(_UPVALUE5_, _UPVALUE5_ .. "." .. _UPVALUE6_.ssid, A2_24, _UPVALUE6_.profileName)
  if L23_45 ~= _UPVALUE0_.NIL and A2_24 ~= L20_42 then
    return L28_50, _UPVALUE1_.errssidExists
  end
  oldProfileName = db.getAttribute(_UPVALUE5_, _UPVALUE5_ .. "." .. _UPVALUE6_.ROWID, A0_22, _UPVALUE6_.profileName)
  if oldProfileName == _UPVALUE0_.NIL then
    return L28_50, _UPVALUE1_.dbError
  end
  if oldProfileName == L21_43 then
    L28_50, L25_47 = WDSEnableFieldValueGet()
    if L28_50 == _UPVALUE0_.FAILURE then
      return L28_50, _UPVALUE1_.dbError
    end
    if tonumber(L25_47) == 1 then
      L28_50 = _UPVALUE0_.FAILURE
      return L28_50, _UPVALUE1_.profileConfigError
    end
  end
  L26_48 = _UPVALUE7_ .. "=" .. A0_22
  L17_39 = db.getRowWhere(_UPVALUE5_, L26_48)
  if L17_39 == _UPVALUE0_.NIL then
    return L28_50, _UPVALUE1_.dbError
  end
  L23_45 = db.getAttribute(_UPVALUE2_, _UPVALUE3_.profileName, L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.profileName], _UPVALUE3_.vapName) or _UPVALUE0_.NIL
  if L23_45 then
    L24_46 = db.getAttribute(_UPVALUE8_, _UPVALUE9_.vapName, L23_45, _UPVALUE9_.wpsEnabled) or _UPVALUE0_.NIL
    if L24_46 and tonumber(L24_46) == 1 then
      L28_50 = _UPVALUE0_.FAILURE
      return L28_50, _UPVALUE1_.errWPSEnabled
    end
  end
  if A15_37 and util.isAllMasked(A15_37) then
    A15_37 = L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.pskPassAscii]
  end
  L23_45 = L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.security]
  if L23_45 and (L23_45 == _UPVALUE10_ or L23_45 == _UPVALUE11_ or L23_45 == _UPVALUE12_) then
    L18_40 = db.getRows(_UPVALUE2_, _UPVALUE3_.profileName, L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.profileName])
    if #L18_40 ~= 0 then
      for _FORV_32_ = 1, #L18_40 do
        L19_41 = L18_40[_FORV_32_]
        L23_45 = db.getAttribute(_UPVALUE8_, _UPVALUE9_.vapName, L19_41[_UPVALUE2_ .. "." .. _UPVALUE3_.vapName], _UPVALUE9_.wpsEnabled) or _UPVALUE0_.NIL
        if L23_45 ~= _UPVALUE0_.NIL and tonumber(L23_45) == 1 and (A4_26 == _UPVALUE13_ or A4_26 == _UPVALUE14_) then
          return L28_50, _UPVALUE1_.errWPSEnabled1
        end
      end
    end
  end
  L23_45 = L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.profileName]
  L28_50, L22_44 = modifyBridgePortsForThisProfile(L23_45, _UPVALUE15_)
  if L28_50 ~= _UPVALUE0_.SUCCESS then
    return L28_50, L22_44
  end
  L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.ssid] = A2_24
  L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.broadcastSSID] = A3_25
  L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.security] = A4_26
  if L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.security] == _UPVALUE14_ then
    L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.wepAuth] = A5_27
    L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.groupCipher] = A6_28
    L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.defWepkeyIdx] = A8_30
    if A9_31 then
      L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.wepkey0] = A9_31
    end
    if A10_32 then
      L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.wepkey1] = A10_32
    end
    if A11_33 then
      L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.wepkey2] = A11_33
    end
    if A12_34 then
      L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.wepkey3] = A12_34
    end
    if A7_29 then
      L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.pskPassHex] = A7_29
    end
  end
  if L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.security] == _UPVALUE10_ then
    L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.pairwiseCiphers] = A13_35
    L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.authMethods] = A14_36
    if A15_37 then
      L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.pskPassAscii] = A15_37
    end
  end
  if L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.security] == _UPVALUE11_ then
    L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.pairwiseCiphers] = A13_35
    L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.authMethods] = A14_36
    if A15_37 then
      L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.pskPassAscii] = A15_37
    end
    if A16_38 then
      L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.preAuthStatus] = A16_38
    end
  end
  if L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.security] == _UPVALUE12_ then
    L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.pairwiseCiphers] = A13_35
    L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.authMethods] = A14_36
    if A15_37 then
      L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.pskPassAscii] = A15_37
    end
  end
  L27_49 = db.update(_UPVALUE5_, L17_39, A0_22)
  if not L27_49 then
    return L28_50, _UPVALUE1_.opFailed
  end
  L23_45 = L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.profileName]
  L28_50, L22_44 = modifyBridgePortsForThisProfile(L23_45, _UPVALUE16_)
  if L28_50 ~= _UPVALUE0_.SUCCESS then
    return L28_50, L22_44
  end
  L18_40 = db.getRows(_UPVALUE2_, _UPVALUE3_.profileName, L23_45)
  for _FORV_32_ = 1, #L18_40 do
    L19_41 = L18_40[_FORV_32_]
    L23_45 = db.getAttribute(_UPVALUE17_, _UPVALUE18_, L19_41[_UPVALUE2_ .. "." .. _UPVALUE18_], _UPVALUE19_) or _UPVALUE0_.FALSE
    L27_49 = db.setAttribute(_UPVALUE20_, VLANPORT_MGMT_TAB_attr.PhyInterfaceName, L23_45, VLANPORT_MGMT_TAB_attr.portName, L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.ssid])
    if not L27_49 then
      return L28_50, _UPVALUE1_.opFailed
    end
  end
  L23_45 = L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.profileName]
  if L23_45 == L21_43 then
    pCipher = L17_39[_UPVALUE5_ .. "." .. _UPVALUE6_.pairwiseCiphers] or ""
    L23_45 = string.find(pCipher, "+")
    if L23_45 ~= _UPVALUE0_.NIL then
      pCipher = string.sub(pCipher, L23_45 + 1)
    end
    L18_40 = db.getTable(_UPVALUE21_, false)
    for _FORV_32_, _FORV_33_ in pairs(L18_40) do
      L27_49 = db.setAttribute(_UPVALUE21_, _UPVALUE7_, _FORV_33_[_UPVALUE7_], DOT11_WDS_PEERS_TAB_attr.pairwiseCipher, pCipher)
      if not L27_49 then
        return L28_50, _UPVALUE1_.opFailed
      end
    end
  end
  L28_50 = _UPVALUE0_.SUCCESS
  return L28_50, _UPVALUE1_.opSuccess
end
function profileSettingsCreate(A0_51, A1_52, A2_53, A3_54, A4_55, A5_56, A6_57, A7_58, A8_59, A9_60, A10_61, A11_62, A12_63, A13_64, A14_65, A15_66, A16_67)
  local L17_68, L18_69, L19_70, L20_71
  L17_68 = {}
  L18_69 = _UPVALUE0_
  L18_69 = L18_69.NIL
  L19_70 = _UPVALUE0_
  L19_70 = L19_70.NIL
  L20_71 = _UPVALUE0_
  L20_71 = L20_71.FAILURE
  L19_70 = db.getAttribute(_UPVALUE1_, _UPVALUE1_ .. "." .. _UPVALUE2_.profileName, A1_52, _UPVALUE3_)
  if L19_70 ~= _UPVALUE0_.NIL then
    return L20_71, _UPVALUE4_.errprofileExists
  end
  L19_70 = db.getAttribute(_UPVALUE1_, _UPVALUE1_ .. "." .. _UPVALUE2_.ssid, A2_53, _UPVALUE2_.profileName)
  if L19_70 ~= _UPVALUE0_.NIL then
    return L20_71, _UPVALUE4_.errssidExists
  end
  L17_68 = db.getDefaults(true, _UPVALUE1_)
  if L17_68 == _UPVALUE0_.NIL then
    return L20_71, _UPVALUE0_.dbError
  end
  L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.profileName] = A1_52
  L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.ssid] = A2_53
  L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.broadcastSSID] = A3_54
  L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.security] = A4_55
  L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.assocTimeout] = _UPVALUE5_
  if L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.security] == _UPVALUE6_ then
    L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.wepAuth] = A5_56
    L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.groupCipher] = A6_57
    L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.defWepkeyIdx] = A8_59
    if A9_60 then
      L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.wepkey0] = A9_60
    end
    if A10_61 then
      L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.wepkey1] = A10_61
    end
    if A11_62 then
      L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.wepkey2] = A11_62
    end
    if A12_63 then
      L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.wepkey3] = A12_63
    end
    if A7_58 then
      L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.pskPassHex] = A7_58
    end
  end
  if L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.security] == _UPVALUE7_ then
    L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.pairwiseCiphers] = A13_64
    L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.authMethods] = A14_65
    if A15_66 then
      L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.pskPassAscii] = A15_66
    end
  end
  if L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.security] == _UPVALUE8_ then
    L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.pairwiseCiphers] = A13_64
    L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.authMethods] = A14_65
    if A15_66 then
      L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.pskPassAscii] = A15_66
    end
    if A16_67 then
      L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.preAuthStatus] = A16_67
    end
  end
  if L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.security] == _UPVALUE9_ then
    L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.pairwiseCiphers] = A13_64
    L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.authMethods] = A14_65
    if A15_66 then
      L17_68[_UPVALUE1_ .. "." .. _UPVALUE2_.pskPassAscii] = A15_66
    end
  end
  L18_69 = db.insert(_UPVALUE1_, L17_68)
  if not L18_69 then
    return L20_71, _UPVALUE4_.Failed
  end
  L20_71 = _UPVALUE0_.SUCCESS
  return L20_71, _UPVALUE4_.opSuccess
end
function acProfileSettingsEdit(A0_72, A1_73, A2_74, A3_75, A4_76, A5_77, A6_78, A7_79, A8_80, A9_81, A10_82, A11_83, A12_84, A13_85, A14_86, A15_87, A16_88, A17_89)
  local L18_90, L19_91, L20_92, L21_93, L22_94, L23_95, L24_96, L25_97, L26_98, L27_99, L28_100, L29_101, L30_102, L31_103, L32_104, L33_105, L34_106, L35_107, L36_108, L37_109, L38_110, L39_111, L40_112, L41_113, L42_114
  L18_90 = {}
  L19_91 = {}
  L20_92 = {}
  L21_93 = _UPVALUE0_
  L21_93 = L21_93.NIL
  L22_94 = _UPVALUE0_
  L22_94 = L22_94.NIL
  L23_95 = _UPVALUE0_
  L23_95 = L23_95.NIL
  L24_96 = _UPVALUE1_
  L24_96 = L24_96.opFailed
  L25_97 = _UPVALUE0_
  L25_97 = L25_97.NIL
  L26_98 = _UPVALUE0_
  L26_98 = L26_98.NIL
  L27_99 = _UPVALUE0_
  L27_99 = L27_99.NIL
  L28_100 = _UPVALUE0_
  L28_100 = L28_100.NIL
  L29_101 = _UPVALUE0_
  L29_101 = L29_101.FALSE
  L30_102 = _UPVALUE0_
  L30_102 = L30_102.FAILURE
  L31_103 = "1"
  if "DSR-1000AC" == L32_104 then
    if A17_89 ~= L32_104 and A17_89 ~= "" and A17_89 ~= " " and A17_89 == "b" then
      L31_103 = "2"
      L32_104(L33_105)
    end
  end
  if A1_73 == nil or A1_73 == "" or A1_73 == " " then
    L35_107 = _UPVALUE4_
    L36_108 = _UPVALUE3_
    L36_108 = L36_108.profileName
    L23_95 = L32_104
  else
    L23_95 = A1_73
  end
  if L23_95 == L32_104 then
    return L32_104, L33_105
  end
  L35_107 = "."
  L36_108 = _UPVALUE6_
  L36_108 = L36_108.ROWID
  L35_107 = A0_72
  L36_108 = _UPVALUE6_
  L36_108 = L36_108.ssid
  L21_93 = L32_104
  L35_107 = "."
  L36_108 = _UPVALUE6_
  L36_108 = L36_108.ssid
  L35_107 = A2_74
  L36_108 = _UPVALUE6_
  L36_108 = L36_108.profileName
  L25_97 = L32_104
  if L25_97 ~= L32_104 and A2_74 ~= L21_93 then
    return L32_104, L33_105
  end
  L35_107 = "."
  L36_108 = _UPVALUE6_
  L36_108 = L36_108.ROWID
  L35_107 = A0_72
  L36_108 = _UPVALUE6_
  L36_108 = L36_108.profileName
  oldProfileName = L32_104
  if L32_104 == "DSR-1000AC" then
    L35_107 = "."
    L36_108 = _UPVALUE6_
    L36_108 = L36_108.ROWID
    L35_107 = A0_72
    L36_108 = _UPVALUE6_
    L36_108 = L36_108.radioMode
    L22_94 = L32_104
  end
  if L32_104 == L33_105 then
    return L32_104, L33_105
  end
  if L32_104 == "DSR-1000AC" then
    L35_107 = L23_95
    L36_108 = _UPVALUE3_
    L36_108 = L36_108.vapName
    if L32_104 ~= L33_105 then
      L35_107 = _UPVALUE8_
      L35_107 = L35_107.vapName
      L36_108 = L32_104
      L37_109 = _UPVALUE8_
      L37_109 = L37_109.interfaceName
      L35_107 = _UPVALUE5_
      L36_108 = _UPVALUE6_
      L36_108 = L36_108.profileName
      L37_109 = L23_95
      if L34_106 == "dual" then
        L35_107 = "radioNo = '1' and vapName = '"
        L36_108 = L32_104
        L37_109 = "'"
        L35_107 = L35_107 .. L36_108 .. L37_109
        L36_108 = "radioNo = '2' and vapName = '"
        L37_109 = L32_104
        L36_108 = L36_108 .. L37_109 .. L38_110
        L37_109 = db
        L37_109 = L37_109.getAttributeWhere
        L37_109 = L37_109(L38_110, L39_111, L40_112)
        if L37_109 == "vap0" or L37_109 == "vap4" then
          if L37_109 == "vap0" then
          else
          end
          L27_99 = L38_110
          if L27_99 == L38_110 then
            L30_102 = L38_110.FAILURE
            return L38_110, L39_111
          end
          if L38_110 == 1 then
            L30_102 = L38_110.FAILURE
            return L38_110, L39_111
          end
        end
        if L38_110 == "vap0" or L38_110 == "vap4" then
          if L38_110 == "vap0" then
          else
          end
          L27_99 = L39_111
          if L27_99 == L39_111 then
            L30_102 = L39_111.FAILURE
            return L39_111, L40_112
          end
          if L39_111 == 1 then
            L30_102 = L39_111.FAILURE
            return L39_111, L40_112
          end
        end
      end
      if L33_105 == "vap0" or L33_105 == "vap4" then
        L35_107 = db
        L35_107 = L35_107.getAttribute
        L36_108 = _UPVALUE9_
        L37_109 = DOT11_RADIO_TAB_attr
        L37_109 = L37_109.band
        L35_107 = L35_107(L36_108, L37_109, L38_110, L39_111)
        L27_99 = L35_107
        L35_107 = _UPVALUE0_
        L35_107 = L35_107.NIL
        if L27_99 == L35_107 then
          L35_107 = _UPVALUE0_
          L30_102 = L35_107.FAILURE
          L35_107 = L30_102
          L36_108 = _UPVALUE1_
          L36_108 = L36_108.dbError
          return L35_107, L36_108
        end
        if L33_105 == "vap0" and L34_106 == "a" then
          L35_107 = tonumber
          L36_108 = L27_99
          L35_107 = L35_107(L36_108)
          if L35_107 == 1 then
            L35_107 = _UPVALUE0_
            L30_102 = L35_107.FAILURE
            L35_107 = L30_102
            L36_108 = _UPVALUE1_
            L36_108 = L36_108.profileConfigError
            return L35_107, L36_108
          end
        end
        if L33_105 == "vap4" and L34_106 == "b" then
          L35_107 = tonumber
          L36_108 = L27_99
          L35_107 = L35_107(L36_108)
          if L35_107 == 1 then
            L35_107 = _UPVALUE0_
            L30_102 = L35_107.FAILURE
            L35_107 = L30_102
            L36_108 = _UPVALUE1_
            L36_108 = L36_108.profileConfigError
            return L35_107, L36_108
          end
        end
      end
    end
  elseif L32_104 == "DSR-500AC" then
    if L23_95 == "default1" then
      L27_99 = L33_105
      L30_102 = L32_104
      if L30_102 == L32_104 then
        return L32_104, L33_105
      end
      if L32_104 == 1 then
        L30_102 = L32_104.FAILURE
        return L32_104, L33_105
      end
    end
  elseif L32_104 == L23_95 then
    L27_99 = L33_105
    L30_102 = L32_104
    if L30_102 == L32_104 then
      return L32_104, L33_105
    end
    if L32_104 == 1 then
      L30_102 = L32_104.FAILURE
      return L32_104, L33_105
    end
  end
  L28_100 = L32_104 .. L33_105 .. L34_106
  L18_90 = L32_104
  if L18_90 == L32_104 then
    return L32_104, L33_105
  end
  L35_107 = _UPVALUE5_
  L36_108 = "."
  L37_109 = _UPVALUE6_
  L37_109 = L37_109.profileName
  L35_107 = L35_107 .. L36_108 .. L37_109
  L35_107 = L18_90[L35_107]
  L36_108 = _UPVALUE3_
  L36_108 = L36_108.vapName
  L25_97 = L32_104 or L32_104.NIL
  if L25_97 then
    L35_107 = L25_97
    L36_108 = _UPVALUE12_
    L36_108 = L36_108.wpsEnabled
    L26_98 = L32_104 or L32_104.NIL
    if L26_98 then
      if L32_104 == 1 then
        L30_102 = L32_104.FAILURE
        return L32_104, L33_105
      end
    end
  end
  if A15_87 then
    if L32_104 then
      A15_87 = L18_90[L32_104]
    end
  end
  L25_97 = L18_90[L32_104]
  if L25_97 then
    if L25_97 ~= L32_104 then
    elseif L25_97 == L32_104 then
      L35_107 = _UPVALUE5_
      L36_108 = "."
      L37_109 = _UPVALUE6_
      L37_109 = L37_109.profileName
      L35_107 = L35_107 .. L36_108 .. L37_109
      L35_107 = L18_90[L35_107]
      L19_91 = L32_104
      if L32_104 ~= 0 then
        for L35_107 = 1, #L19_91 do
          L20_92 = L19_91[L35_107]
          L36_108 = db
          L36_108 = L36_108.getAttribute
          L37_109 = _UPVALUE11_
          L36_108 = L36_108(L37_109, L38_110, L39_111, L40_112)
          L25_97 = L36_108 or L36_108.NIL
          L36_108 = _UPVALUE0_
          L36_108 = L36_108.NIL
          if L25_97 ~= L36_108 then
            L36_108 = tonumber
            L37_109 = L25_97
            L36_108 = L36_108(L37_109)
            if L36_108 == 1 then
              L36_108 = _UPVALUE16_
              if A4_76 ~= L36_108 then
                L36_108 = _UPVALUE17_
              elseif A4_76 == L36_108 then
                L36_108 = L30_102
                L37_109 = _UPVALUE1_
                L37_109 = L37_109.errWPSEnabled1
                return L36_108, L37_109
              end
            end
          end
        end
      end
    end
  end
  L35_107 = _UPVALUE5_
  L36_108 = "."
  L37_109 = _UPVALUE6_
  L37_109 = L37_109.profileName
  L35_107 = L35_107 .. L36_108 .. L37_109
  L35_107 = L18_90[L35_107]
  L36_108 = _UPVALUE3_
  L36_108 = L36_108.vapName
  if L32_104 ~= nil then
    L35_107 = db
    L35_107 = L35_107.getAttribute
    L36_108 = _UPVALUE7_
    L37_109 = _UPVALUE8_
    L37_109 = L37_109.vapName
    L35_107 = L35_107(L36_108, L37_109, L38_110, L39_111)
    if not L35_107 then
      L35_107 = _UPVALUE0_
      L35_107 = L35_107.NIL
    end
    L36_108 = db
    L36_108 = L36_108.getAttribute
    L37_109 = _UPVALUE9_
    L36_108 = L36_108(L37_109, L38_110, L39_111, L40_112)
    if not L36_108 then
      L36_108 = _UPVALUE0_
      L36_108 = L36_108.NIL
    end
  end
  if L34_106 then
    L35_107 = UNIT_NAME
    if L35_107 == "DSR-1000AC" and L22_94 ~= A17_89 then
      L35_107 = nil
      if A17_89 ~= "dual" and A17_89 ~= nil then
        if A17_89 == "b" then
          L35_107 = 2
        else
          L35_107 = 1
        end
        L36_108 = "radioNo = '"
        L37_109 = L35_107
        L36_108 = L36_108 .. L37_109 .. L38_110
        where = L36_108
        L36_108 = db
        L36_108 = L36_108.getRowsWhere
        L37_109 = _UPVALUE7_
        L36_108 = L36_108(L37_109, L38_110)
        L35_107 = L36_108
        if L35_107 ~= nil then
          L36_108 = #L35_107
          if L36_108 > 4 then
            L36_108 = _UPVALUE0_
            L36_108 = L36_108.FAILURE
            L37_109 = _UPVALUE1_
            L37_109 = L37_109.maxApPerRadioError
            return L36_108, L37_109
          end
        end
      elseif A17_89 == "dual" then
        if L22_94 == "b" then
          L35_107 = 2
        else
          L35_107 = 1
        end
        L36_108 = tonumber
        L37_109 = L35_107
        L36_108 = L36_108(L37_109)
        L37_109 = tonumber
        L37_109 = L37_109(L38_110)
        if L36_108 == L37_109 then
          L36_108 = "radioNo = '1' and vapName != 'unused' "
          where = L36_108
          L36_108 = db
          L36_108 = L36_108.getRowsWhere
          L37_109 = _UPVALUE7_
          L36_108 = L36_108(L37_109, L38_110)
          L35_107 = L36_108
          if L35_107 ~= nil then
            L36_108 = #L35_107
            if L36_108 > 4 then
              L36_108 = _UPVALUE0_
              L36_108 = L36_108.FAILURE
              L37_109 = _UPVALUE1_
              L37_109 = L37_109.maxApPerRadioError
              return L36_108, L37_109
            end
          end
        else
          L36_108 = "radioNo = '2' and vapName != 'unused'"
          where = L36_108
          L36_108 = db
          L36_108 = L36_108.getRowsWhere
          L37_109 = _UPVALUE7_
          L36_108 = L36_108(L37_109, L38_110)
          L35_107 = L36_108
          if L35_107 ~= nil then
            L36_108 = #L35_107
            if L36_108 > 4 then
              L36_108 = _UPVALUE0_
              L36_108 = L36_108.FAILURE
              L37_109 = _UPVALUE1_
              L37_109 = L37_109.maxApPerRadioError
              return L36_108, L37_109
            end
          end
        end
      end
    end
  end
  L35_107 = _UPVALUE5_
  L36_108 = "."
  L37_109 = _UPVALUE6_
  L37_109 = L37_109.profileName
  L35_107 = L35_107 .. L36_108 .. L37_109
  L25_97 = L18_90[L35_107]
  L35_107 = modifyBridgePortsForThisProfile
  L36_108 = L25_97
  L37_109 = _UPVALUE18_
  L36_108 = L35_107(L36_108, L37_109)
  L24_96 = L36_108
  L30_102 = L35_107
  L35_107 = _UPVALUE0_
  L35_107 = L35_107.SUCCESS
  if L30_102 ~= L35_107 then
    L35_107 = L30_102
    L36_108 = L24_96
    return L35_107, L36_108
  end
  L35_107 = _UPVALUE5_
  L36_108 = "."
  L37_109 = _UPVALUE6_
  L37_109 = L37_109.ssid
  L35_107 = L35_107 .. L36_108 .. L37_109
  L18_90[L35_107] = A2_74
  L35_107 = _UPVALUE5_
  L36_108 = "."
  L37_109 = _UPVALUE6_
  L37_109 = L37_109.broadcastSSID
  L35_107 = L35_107 .. L36_108 .. L37_109
  L18_90[L35_107] = A3_75
  L35_107 = _UPVALUE5_
  L36_108 = "."
  L37_109 = _UPVALUE6_
  L37_109 = L37_109.security
  L35_107 = L35_107 .. L36_108 .. L37_109
  L18_90[L35_107] = A4_76
  L35_107 = _UPVALUE5_
  L36_108 = "."
  L37_109 = _UPVALUE6_
  L37_109 = L37_109.security
  L35_107 = L35_107 .. L36_108 .. L37_109
  L35_107 = L18_90[L35_107]
  L36_108 = _UPVALUE17_
  if L35_107 == L36_108 then
    if L33_105 and L34_106 then
      L35_107 = _UPVALUE0_
      L35_107 = L35_107.FAILURE
      L36_108 = _UPVALUE1_
      L36_108 = L36_108.badSecurity
      return L35_107, L36_108
    end
    L35_107 = _UPVALUE5_
    L36_108 = "."
    L37_109 = _UPVALUE6_
    L37_109 = L37_109.wepAuth
    L35_107 = L35_107 .. L36_108 .. L37_109
    L18_90[L35_107] = A5_77
    L35_107 = _UPVALUE5_
    L36_108 = "."
    L37_109 = _UPVALUE6_
    L37_109 = L37_109.groupCipher
    L35_107 = L35_107 .. L36_108 .. L37_109
    L18_90[L35_107] = A6_78
    L35_107 = _UPVALUE5_
    L36_108 = "."
    L37_109 = _UPVALUE6_
    L37_109 = L37_109.defWepkeyIdx
    L35_107 = L35_107 .. L36_108 .. L37_109
    L18_90[L35_107] = A8_80
    if A9_81 then
      L35_107 = _UPVALUE5_
      L36_108 = "."
      L37_109 = _UPVALUE6_
      L37_109 = L37_109.wepkey0
      L35_107 = L35_107 .. L36_108 .. L37_109
      L18_90[L35_107] = A9_81
    end
    if A10_82 then
      L35_107 = _UPVALUE5_
      L36_108 = "."
      L37_109 = _UPVALUE6_
      L37_109 = L37_109.wepkey1
      L35_107 = L35_107 .. L36_108 .. L37_109
      L18_90[L35_107] = A10_82
    end
    if A11_83 then
      L35_107 = _UPVALUE5_
      L36_108 = "."
      L37_109 = _UPVALUE6_
      L37_109 = L37_109.wepkey2
      L35_107 = L35_107 .. L36_108 .. L37_109
      L18_90[L35_107] = A11_83
    end
    if A12_84 then
      L35_107 = _UPVALUE5_
      L36_108 = "."
      L37_109 = _UPVALUE6_
      L37_109 = L37_109.wepkey3
      L35_107 = L35_107 .. L36_108 .. L37_109
      L18_90[L35_107] = A12_84
    end
    if A7_79 then
      L35_107 = _UPVALUE5_
      L36_108 = "."
      L37_109 = _UPVALUE6_
      L37_109 = L37_109.pskPassHex
      L35_107 = L35_107 .. L36_108 .. L37_109
      L18_90[L35_107] = A7_79
    end
  end
  L35_107 = _UPVALUE5_
  L36_108 = "."
  L37_109 = _UPVALUE6_
  L37_109 = L37_109.security
  L35_107 = L35_107 .. L36_108 .. L37_109
  L35_107 = L18_90[L35_107]
  L36_108 = _UPVALUE13_
  if L35_107 == L36_108 then
    if L33_105 and L34_106 and A13_85 ~= "TKIP+CCMP" then
      L35_107 = _UPVALUE0_
      L35_107 = L35_107.FAILURE
      L36_108 = _UPVALUE1_
      L36_108 = L36_108.badSecurity
      return L35_107, L36_108
    end
    L35_107 = _UPVALUE5_
    L36_108 = "."
    L37_109 = _UPVALUE6_
    L37_109 = L37_109.pairwiseCiphers
    L35_107 = L35_107 .. L36_108 .. L37_109
    L18_90[L35_107] = A13_85
    L35_107 = _UPVALUE5_
    L36_108 = "."
    L37_109 = _UPVALUE6_
    L37_109 = L37_109.authMethods
    L35_107 = L35_107 .. L36_108 .. L37_109
    L18_90[L35_107] = A14_86
    if A15_87 then
      L35_107 = _UPVALUE5_
      L36_108 = "."
      L37_109 = _UPVALUE6_
      L37_109 = L37_109.pskPassAscii
      L35_107 = L35_107 .. L36_108 .. L37_109
      L18_90[L35_107] = A15_87
    end
  end
  L35_107 = _UPVALUE5_
  L36_108 = "."
  L37_109 = _UPVALUE6_
  L37_109 = L37_109.security
  L35_107 = L35_107 .. L36_108 .. L37_109
  L35_107 = L18_90[L35_107]
  L36_108 = _UPVALUE14_
  if L35_107 == L36_108 then
    L35_107 = _UPVALUE5_
    L36_108 = "."
    L37_109 = _UPVALUE6_
    L37_109 = L37_109.pairwiseCiphers
    L35_107 = L35_107 .. L36_108 .. L37_109
    L18_90[L35_107] = A13_85
    L35_107 = _UPVALUE5_
    L36_108 = "."
    L37_109 = _UPVALUE6_
    L37_109 = L37_109.authMethods
    L35_107 = L35_107 .. L36_108 .. L37_109
    L18_90[L35_107] = A14_86
    if A15_87 then
      L35_107 = _UPVALUE5_
      L36_108 = "."
      L37_109 = _UPVALUE6_
      L37_109 = L37_109.pskPassAscii
      L35_107 = L35_107 .. L36_108 .. L37_109
      L18_90[L35_107] = A15_87
    end
    if A16_88 then
      L35_107 = _UPVALUE5_
      L36_108 = "."
      L37_109 = _UPVALUE6_
      L37_109 = L37_109.preAuthStatus
      L35_107 = L35_107 .. L36_108 .. L37_109
      L18_90[L35_107] = A16_88
    end
  end
  L35_107 = _UPVALUE5_
  L36_108 = "."
  L37_109 = _UPVALUE6_
  L37_109 = L37_109.security
  L35_107 = L35_107 .. L36_108 .. L37_109
  L35_107 = L18_90[L35_107]
  L36_108 = _UPVALUE15_
  if L35_107 == L36_108 then
    L35_107 = _UPVALUE5_
    L36_108 = "."
    L37_109 = _UPVALUE6_
    L37_109 = L37_109.pairwiseCiphers
    L35_107 = L35_107 .. L36_108 .. L37_109
    L18_90[L35_107] = A13_85
    L35_107 = _UPVALUE5_
    L36_108 = "."
    L37_109 = _UPVALUE6_
    L37_109 = L37_109.authMethods
    L35_107 = L35_107 .. L36_108 .. L37_109
    L18_90[L35_107] = A14_86
    if A15_87 then
      L35_107 = _UPVALUE5_
      L36_108 = "."
      L37_109 = _UPVALUE6_
      L37_109 = L37_109.pskPassAscii
      L35_107 = L35_107 .. L36_108 .. L37_109
      L18_90[L35_107] = A15_87
    end
    if A16_88 then
      L35_107 = _UPVALUE5_
      L36_108 = "."
      L37_109 = _UPVALUE6_
      L37_109 = L37_109.preAuthStatus
      L35_107 = L35_107 .. L36_108 .. L37_109
      L18_90[L35_107] = A16_88
    end
  end
  L35_107 = UNIT_NAME
  if "DSR-1000AC" == L35_107 then
    L35_107 = _UPVALUE0_
    L35_107 = L35_107.NIL
    if A17_89 ~= L35_107 and A17_89 ~= "" and A17_89 ~= " " then
      L35_107 = _UPVALUE5_
      L36_108 = "."
      L37_109 = _UPVALUE6_
      L37_109 = L37_109.radioMode
      L35_107 = L35_107 .. L36_108 .. L37_109
      L18_90[L35_107] = A17_89
    end
  end
  L35_107 = db
  L35_107 = L35_107.update
  L36_108 = _UPVALUE5_
  L37_109 = L18_90
  L35_107 = L35_107(L36_108, L37_109, L38_110)
  L29_101 = L35_107
  if not L29_101 then
    L35_107 = L30_102
    L36_108 = _UPVALUE1_
    L36_108 = L36_108.opFailed
    return L35_107, L36_108
  end
  L35_107 = _UPVALUE5_
  L36_108 = "."
  L37_109 = _UPVALUE6_
  L37_109 = L37_109.profileName
  L35_107 = L35_107 .. L36_108 .. L37_109
  L25_97 = L18_90[L35_107]
  L35_107 = modifyBridgePortsForThisProfile
  L36_108 = L25_97
  L37_109 = _UPVALUE19_
  L36_108 = L35_107(L36_108, L37_109)
  L24_96 = L36_108
  L30_102 = L35_107
  L35_107 = _UPVALUE0_
  L35_107 = L35_107.SUCCESS
  if L30_102 ~= L35_107 then
    L35_107 = L30_102
    L36_108 = L24_96
    return L35_107, L36_108
  end
  L35_107 = db
  L35_107 = L35_107.getRows
  L36_108 = _UPVALUE2_
  L37_109 = _UPVALUE3_
  L37_109 = L37_109.profileName
  L35_107 = L35_107(L36_108, L37_109, L38_110)
  L19_91 = L35_107
  L35_107 = 0
  L36_108 = "ap1"
  L37_109 = nil
  for L41_113 = 1, #L19_91 do
    L20_92 = L19_91[L41_113]
    dot11InterfaceRows = L42_114
    for _FORV_45_, _FORV_46_ in L42_114(dot11InterfaceRows) do
      L25_97 = _FORV_46_[_UPVALUE7_ .. "." .. _UPVALUE21_] or _UPVALUE0_.FALSE
      L29_101 = db.setAttribute(_UPVALUE22_, VLANPORT_MGMT_TAB_attr.PhyInterfaceName, L25_97, VLANPORT_MGMT_TAB_attr.portName, L18_90[_UPVALUE5_ .. "." .. _UPVALUE6_.ssid])
    end
    L36_108 = L20_92[L42_114]
    if L42_114 == "DSR-1000AC" then
      L36_108 = L20_92[L42_114]
      if A17_89 == _UPVALUE24_ then
      elseif A17_89 == _UPVALUE26_ then
      else
      end
      L37_109 = db.getAttribute(_UPVALUE2_, _UPVALUE3_.vapName, L20_92[_UPVALUE2_ .. "." .. _UPVALUE20_], _UPVALUE3_.radioList)
      L29_101 = db.setAttribute(_UPVALUE2_, _UPVALUE3_.vapName, L20_92[_UPVALUE2_ .. "." .. _UPVALUE20_], _UPVALUE3_.radioList, L42_114)
      if not L29_101 then
        return L30_102, _UPVALUE1_.opFailed
      end
      if L37_109 ~= L42_114 then
        L35_107 = 1
        if L42_114 == "1" then
          L35_107 = "1"
        elseif L42_114 == "2" then
          L35_107 = "2"
        elseif L42_114 == "1,2" then
          L35_107 = "1,2"
        end
      end
    end
    if not L29_101 then
      return L42_114, _UPVALUE1_.opFailed
    end
  end
  if L38_110 == "DSR-1000AC" then
    if L35_107 == "1,2" then
      L29_101 = L38_110
      freeRow = L38_110
      if L38_110 then
        valid = L38_110
        if not L38_110 then
          return L38_110, L39_111
        end
        vapNameBridge = L38_110
        valid = L38_110
        if not L38_110 then
          return L38_110, L39_111
        end
      end
      freeRow = L38_110
      if L38_110 then
        valid = L38_110
        if not L38_110 then
          return L38_110, L39_111
        end
        vapNameBridge = L38_110
        valid = L38_110
        if not L38_110 then
          return L38_110, L39_111
        end
      end
    elseif L35_107 == "1" or L35_107 == "2" then
      L29_101 = L38_110
      freeRow = L38_110
      if L38_110 then
        valid = L38_110
        if not L38_110 then
          return L38_110, L39_111
        end
        vapNameBridge = L38_110
        valid = L38_110
        if not L38_110 then
          return L38_110, L39_111
        end
      end
    end
    if L38_110 then
      dot11InterfaceRows = L39_111
      for L42_114, _FORV_43_ in L39_111(L40_112) do
        L25_97 = _FORV_43_[_UPVALUE7_ .. "." .. _UPVALUE21_] or _UPVALUE0_.FALSE
        L29_101 = db.setAttribute(_UPVALUE22_, VLANPORT_MGMT_TAB_attr.PhyInterfaceName, L25_97, VLANPORT_MGMT_TAB_attr.portName, L18_90[_UPVALUE5_ .. "." .. _UPVALUE6_.ssid])
      end
    end
    for _FORV_44_, _FORV_45_ in L41_113(L42_114) do
      for _FORV_50_, _FORV_51_ in pairs(L39_111) do
      end
      if 1 == 0 then
        L29_101 = db.setAttribute(_UPVALUE22_, _UPVALUE22_ .. ".PhyInterfaceName", _FORV_45_[_UPVALUE22_ .. ".PhyInterfaceName"], VLANPORT_MGMT_TAB_attr.PortType, _UPVALUE31_)
        if not L29_101 then
          return L30_102, _UPVALUE1_.opFailed
        end
      else
        L29_101 = db.setAttribute(_UPVALUE22_, _UPVALUE22_ .. ".PhyInterfaceName", _FORV_45_[_UPVALUE22_ .. ".PhyInterfaceName"], VLANPORT_MGMT_TAB_attr.PortType, _UPVALUE32_)
        if not L29_101 then
          return L30_102, _UPVALUE1_.opFailed
        end
      end
    end
  end
  L25_97 = L18_90[L38_110]
  if L25_97 == L23_95 then
    pCipher = L38_110
    L25_97 = L38_110
    if A4_76 == "OPEN" or A4_76 == "WEP" then
      pCipher = L38_110
    elseif L25_97 ~= L38_110 then
      pCipher = L38_110
    end
    if L38_110 == "TKIP" then
      pCipher = L38_110
    end
    L19_91 = L38_110
    for L41_113, L42_114 in L38_110(L39_111) do
      if L42_114[_UPVALUE10_] == nil then
        L42_114[_UPVALUE10_] = L42_114["dot11WDSPeers._ROWID_"]
      end
      L29_101 = db.setAttribute(_UPVALUE33_, _UPVALUE10_, L42_114[_UPVALUE10_], DOT11_WDS_PEERS_TAB_attr.pairwiseCipher, pCipher)
      if not L29_101 then
        return L30_102, _UPVALUE1_.opFailed
      end
    end
  end
  L30_102 = L38_110.SUCCESS
  return L38_110, L39_111
end
function acProfileSettingsCreate(A0_115, A1_116, A2_117, A3_118, A4_119, A5_120, A6_121, A7_122, A8_123, A9_124, A10_125, A11_126, A12_127, A13_128, A14_129, A15_130, A16_131, A17_132)
  local L18_133, L19_134, L20_135, L21_136
  L18_133 = {}
  L19_134 = _UPVALUE0_
  L19_134 = L19_134.NIL
  L20_135 = _UPVALUE0_
  L20_135 = L20_135.NIL
  L21_136 = _UPVALUE0_
  L21_136 = L21_136.FAILURE
  L20_135 = db.getAttribute(_UPVALUE1_, _UPVALUE1_ .. "." .. _UPVALUE2_.profileName, A1_116, _UPVALUE3_)
  if L20_135 ~= _UPVALUE0_.NIL then
    return L21_136, _UPVALUE4_.errprofileExists
  end
  L20_135 = db.getAttribute(_UPVALUE1_, _UPVALUE1_ .. "." .. _UPVALUE2_.ssid, A2_117, _UPVALUE2_.profileName)
  if L20_135 ~= _UPVALUE0_.NIL then
    return L21_136, _UPVALUE4_.errssidExists
  end
  L18_133 = db.getDefaults(true, _UPVALUE1_)
  if L18_133 == _UPVALUE0_.NIL then
    return L21_136, _UPVALUE0_.dbError
  end
  L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.profileName] = A1_116
  L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.ssid] = A2_117
  L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.broadcastSSID] = A3_118
  L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.security] = A4_119
  L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.assocTimeout] = _UPVALUE5_
  if L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.security] == _UPVALUE6_ then
    L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.wepAuth] = A5_120
    L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.groupCipher] = A6_121
    L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.defWepkeyIdx] = A8_123
    if A9_124 then
      L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.wepkey0] = A9_124
    end
    if A10_125 then
      L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.wepkey1] = A10_125
    end
    if A11_126 then
      L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.wepkey2] = A11_126
    end
    if A12_127 then
      L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.wepkey3] = A12_127
    end
    if A7_122 then
      L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.pskPassHex] = A7_122
    end
  end
  if L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.security] == _UPVALUE7_ then
    L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.pairwiseCiphers] = A13_128
    L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.authMethods] = A14_129
    if A15_130 then
      L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.pskPassAscii] = A15_130
    end
  end
  if L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.security] == _UPVALUE8_ then
    L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.pairwiseCiphers] = A13_128
    L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.authMethods] = A14_129
    if A15_130 then
      L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.pskPassAscii] = A15_130
    end
    if A16_131 then
      L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.preAuthStatus] = A16_131
    end
  end
  if L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.security] == _UPVALUE9_ then
    L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.pairwiseCiphers] = A13_128
    L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.authMethods] = A14_129
    if A15_130 then
      L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.pskPassAscii] = A15_130
    end
    if A16_131 then
      L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.preAuthStatus] = A16_131
    end
  end
  if ("DSR-1000AC" == UNIT_NAME or "DSR-500AC" == UNIT_NAME) and A17_132 ~= _UPVALUE0_.NIL and A17_132 ~= "" and A17_132 ~= " " then
    L18_133[_UPVALUE1_ .. "." .. _UPVALUE2_.radioMode] = A17_132
  end
  L19_134 = db.insert(_UPVALUE1_, L18_133)
  if not L19_134 then
    return L21_136, _UPVALUE4_.Failed
  end
  L21_136 = _UPVALUE0_.SUCCESS
  return L21_136, _UPVALUE4_.opSuccess
end
function regionInfoGet()
  local L0_137, L1_138
  L0_137 = _UPVALUE0_
  L0_137 = L0_137.FAILURE
  L1_138 = _UPVALUE0_
  L1_138 = L1_138.NIL
  L1_138 = db.getAttribute(_UPVALUE1_, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.regionInfo)
  if L1_138 == _UPVALUE0_.NIL then
    return _UPVALUE0_, L1_138
  end
  L0_137 = _UPVALUE0_.SUCCESS
  return L0_137, L1_138
end
function WDSEnableFieldValueGet(A0_139)
  local L1_140, L2_141
  L1_140 = _UPVALUE0_
  L1_140 = L1_140.FAILURE
  L2_141 = _UPVALUE0_
  L2_141 = L2_141.NIL
  if A0_139 == nil then
    A0_139 = "1"
  end
  L2_141 = db.getAttribute(_UPVALUE1_, _UPVALUE2_, A0_139, DOT11_RADIO_TAB_attr.wdsEnabled)
  if L2_141 == _UPVALUE0_.NIL then
    return _UPVALUE0_, L2_141
  end
  L1_140 = _UPVALUE0_.SUCCESS
  return L1_140, L2_141
end
function checkProfilesGet(A0_142, A1_143)
  local L2_144, L3_145, L4_146, L5_147, L6_148
  L2_144 = {}
  L3_145 = _UPVALUE0_
  L3_145 = L3_145.NIL
  L4_146 = _UPVALUE0_
  L4_146 = L4_146.NIL
  L5_147 = _UPVALUE0_
  L5_147 = L5_147.NIL
  L6_148 = _UPVALUE0_
  L6_148 = L6_148.FAILURE
  L6_148, L3_145 = WDSEnableFieldValueGet()
  if L6_148 == _UPVALUE0_.FAILURE then
    return L6_148, _UPVALUE1_.dbError, L2_144
  end
  L4_146 = db.getAttribute(_UPVALUE2_, _UPVALUE3_.vapName, _UPVALUE4_, _UPVALUE3_.profileName)
  if L4_146 == _UPVALUE0_.NIL then
    return L6_148, _UPVALUE1_.dbError, L2_144
  end
  if A1_143 == "add" then
    L2_144 = db.getDefaults(true, _UPVALUE5_)
    L2_144[_UPVALUE5_ .. "." .. _UPVALUE6_.broadcastSSID] = "1"
    if L2_144 == _UPVALUE0_.NIL then
      return L6_148, _UPVALUE1_.dbError, L2_144
    end
  else
    L2_144 = db.getRow(_UPVALUE5_, _UPVALUE5_ .. "." .. _UPVALUE7_, A0_142)
    if L4_146 == L2_144[_UPVALUE5_ .. "." .. _UPVALUE6_.profileName] and tonumber(L3_145) == 1 then
      return L6_148, _UPVALUE1_.profileConfigError, L2_144
    end
    if L2_144[_UPVALUE5_ .. "." .. _UPVALUE6_.pskPassAscii] then
      L2_144[_UPVALUE5_ .. "." .. _UPVALUE6_.pskPassAscii] = util.mask(L2_144[_UPVALUE5_ .. "." .. _UPVALUE6_.pskPassAscii])
    end
  end
  L6_148, L5_147 = regionInfoGet()
  if L6_148 ~= _UPVALUE0_.FAILURE then
    return L6_148, _UPVALUE1_.dbError, L2_144
  end
  L2_144[_UPVALUE8_] = L3_145
  L2_144[_UPVALUE9_] = L4_146
  L2_144[_UPVALUE10_] = L5_147
  L6_148 = _UPVALUE0_.SUCCESS
  return L6_148, _UPVALUE1_.opSuccess, L2_144
end
function availableProfilesGet(A0_149, A1_150)
  local L2_151, L3_152
  L2_151 = {}
  L3_152 = _UPVALUE0_
  L3_152 = L3_152.FAILURE
  L2_151 = db.getTable(_UPVALUE1_)
  if L2_151 == nil then
    return L3_152, _UPVALUE2_.noProfilesFound, L2_151
  end
  L3_152 = _UPVALUE0_.SUCCESS
  return L3_152, _UPVALUE2_.opSuccess, L2_151
end
function deleteAvailableProfiles(A0_153)
  local L1_154, L2_155, L3_156, L4_157, L5_158, L6_159, L7_160, L8_161, L9_162, L10_163, L11_164, L12_165
  L1_154 = {}
  L2_155 = {}
  L3_156, L4_157 = nil, nil
  L5_158 = 1
  L6_159 = false
  L7_160 = _UPVALUE0_
  L7_160 = L7_160.FAILURE
  L11_164 = _UPVALUE3_
  L12_165 = _UPVALUE2_
  L12_165 = L12_165.profileName
  L4_157 = L8_161
  if L4_157 == L8_161 then
    return L8_161, L9_162
  end
  for L11_164, L12_165 in L8_161(L9_162) do
    L3_156 = db.getAttribute(_UPVALUE6_, _UPVALUE7_, L12_165, _UPVALUE8_.profileName)
    if L3_156 == nil then
      return L7_160, _UPVALUE4_.dbError
    end
    if _UPVALUE9_ == _UPVALUE5_ then
      if L3_156 ~= L4_157 then
        L1_154 = db.getRow(_UPVALUE1_, _UPVALUE2_.profileName, L3_156)
        if L1_154 ~= _UPVALUE0_.NIL then
          return L7_160, _UPVALUE4_.ProfileUsed
        end
        L2_155[L5_158] = {}
        L2_155[L5_158][_UPVALUE2_.profileName] = L3_156
        L5_158 = L5_158 + 1
      elseif #A0_153 == 1 then
        L7_160 = _UPVALUE0_.FAILURE
        return L7_160, _UPVALUE4_.ProfileUsedErr
      end
    end
  end
  if L8_161 ~= "DSR-1000AC" then
  elseif L8_161 == "DSR-500AC" then
    if L8_161 == 0 then
      if L8_161 ~= 0 then
        return L8_161, L9_162
      end
    end
  end
  for L11_164, L12_165 in L8_161(L9_162) do
    L6_159 = db.deleteRow(_UPVALUE6_, _UPVALUE8_.profileName, L12_165[_UPVALUE8_.profileName])
    if not L6_159 then
      return L7_160, _UPVALUE4_.opFailed
    end
  end
  L7_160 = L8_161.SUCCESS
  return L8_161, L9_162
end
