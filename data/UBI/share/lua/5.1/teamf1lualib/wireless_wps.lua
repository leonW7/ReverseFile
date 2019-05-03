local L0_0
L0_0 = module
L0_0("com.teamf1.core.wireless.wps", package.seeall)
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
;({}).name = "name"
;({}).value = "value"
WPS_PIN_PROGRAM_VARIABLE = "WPS_PIN_PROGRAM"
WPS_PBC_PROGRAM_VARIABLE = "WPS_PBC_PROGRAM"
;({}).vapName = "vapName"
;({}).profileName = "profileName"
;({}).wpsEnabled = "wpsEnabled"
;({}).stationPin = "stationPin"
;({}).ROW_ID = "_ROWID_"
;({}).wpsSecurity = "wpsSecurity"
;({}).wpsAuthentication = "wpsAuthentication"
;({}).wpsEncryption = "wpsEncryption"
;({}).wpsStationPin = "wpsStationPin"
;({}).sessionStatus = "sessionStatus"
;({}).security = "security"
;({}).vapEnabled = "vapEnabled"
function vapNameGet()
  local L0_1, L1_2
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(_UPVALUE0_, "_ROWID_", "1", _UPVALUE1_.vapName)
  if L1_2 == nil then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L1_2
end
function vapNameGetNext(A0_3)
  local L1_4, L2_5, L3_6
  L3_6 = db
  L3_6 = L3_6.getAttribute
  L3_6 = L3_6(_UPVALUE0_, "_ROWID_", L2_5, _UPVALUE1_.vapName)
  if L3_6 == nil then
    return _UPVALUE2_.FAILURE, L2_5
  end
  return _UPVALUE2_.SUCCESS, L2_5, L3_6
end
function vapNameSet(A0_7, A1_8)
  local L2_9, L3_10, L4_11
  if A1_8 == nil then
    L3_10 = _UPVALUE0_
    L3_10 = L3_10.INVALID_ARGUMENT
    return L3_10
  end
  L3_10 = status
  if L3_10 == nil then
    L3_10 = _UPVALUE0_
    L3_10 = L3_10.FAILURE
    L4_11 = A0_7
    return L3_10, L4_11
  end
  L3_10 = _UPVALUE0_
  L3_10 = L3_10.SUCCESS
  L4_11 = A0_7
  return L3_10, L4_11
end
function vapNameDelete(A0_12, A1_13)
  local L2_14, L3_15, L4_16
  L3_15 = status
  if L3_15 == nil then
    L3_15 = _UPVALUE0_
    L3_15 = L3_15.FAILURE
    L4_16 = A0_12
    return L3_15, L4_16
  end
  L3_15 = _UPVALUE0_
  L3_15 = L3_15.SUCCESS
  L4_16 = A0_12
  return L3_15, L4_16
end
function iswpsStatusEnabled()
  local L0_17, L1_18
  L1_18 = db
  L1_18 = L1_18.getAttribute
  L1_18 = L1_18(_UPVALUE0_, "_ROWID_", "1", _UPVALUE1_.wpsEnabled)
  if L1_18 == nil then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L1_18
end
function iswpsStatusEnabledNext(A0_19)
  local L1_20, L2_21, L3_22
  L3_22 = db
  L3_22 = L3_22.getAttribute
  L3_22 = L3_22(_UPVALUE0_, "_ROWID_", L2_21, _UPVALUE1_.wpsStatus)
  if L3_22 == nil then
    return _UPVALUE2_.FAILURE, L2_21
  end
  return _UPVALUE2_.SUCCESS, L2_21, L3_22
end
function wpsStatusEnable(A0_23)
  local L1_24, L2_25, L3_26
  L2_25 = status
  if L2_25 == nil then
    L2_25 = _UPVALUE0_
    L2_25 = L2_25.FAILURE
    L3_26 = A0_23
    return L2_25, L3_26
  end
  L2_25 = _UPVALUE0_
  L2_25 = L2_25.SUCCESS
  L3_26 = A0_23
  return L2_25, L3_26
end
function wpsStatusDisable(A0_27)
  local L1_28, L2_29, L3_30
  L2_29 = status
  if L2_29 == nil then
    L2_29 = _UPVALUE0_
    L2_29 = L2_29.FAILURE
    L3_30 = A0_27
    return L2_29, L3_30
  end
  L2_29 = _UPVALUE0_
  L2_29 = L2_29.SUCCESS
  L3_30 = A0_27
  return L2_29, L3_30
end
function wpsSecurityGet()
  local L0_31, L1_32
  L1_32 = db
  L1_32 = L1_32.getAttribute
  L1_32 = L1_32(_UPVALUE0_, "_ROWID_", "1", _UPVALUE1_.wpsSecurity)
  if L1_32 == nil then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L1_32
end
function wpsSecurityGetNext(A0_33)
  local L1_34, L2_35, L3_36
  L3_36 = db
  L3_36 = L3_36.getAttribute
  L3_36 = L3_36(_UPVALUE0_, "_ROWID_", L2_35, _UPVALUE1_.wpsSecurity)
  if L3_36 == nil then
    return _UPVALUE2_.FAILURE, L2_35
  end
  return _UPVALUE2_.SUCCESS, L2_35, L3_36
end
function wpsSecuritySet(A0_37, A1_38)
  local L2_39, L3_40, L4_41
  if A1_38 == nil then
    L3_40 = _UPVALUE0_
    L3_40 = L3_40.INVALID_ARGUMENT
    return L3_40
  end
  L3_40 = status
  if L3_40 == nil then
    L3_40 = _UPVALUE0_
    L3_40 = L3_40.FAILURE
    L4_41 = A0_37
    return L3_40, L4_41
  end
  L3_40 = _UPVALUE0_
  L3_40 = L3_40.SUCCESS
  L4_41 = A0_37
  return L3_40, L4_41
end
function wpsAuthenticationGet()
  local L0_42, L1_43
  L1_43 = db
  L1_43 = L1_43.getAttribute
  L1_43 = L1_43(_UPVALUE0_, "_ROWID_", "1", _UPVALUE1_.wpsAuthentication)
  if L1_43 == nil then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L1_43
end
function wpsAuthenticationGetNext(A0_44)
  local L1_45, L2_46, L3_47
  L3_47 = db
  L3_47 = L3_47.getAttribute
  L3_47 = L3_47(_UPVALUE0_, "_ROWID_", L2_46, _UPVALUE1_.wpsAuthentication)
  if L3_47 == nil then
    return _UPVALUE2_.FAILURE, L2_46
  end
  return _UPVALUE2_.SUCCESS, L2_46, L3_47
end
function wpsAuthenticationSet(A0_48, A1_49)
  local L2_50, L3_51, L4_52
  if A1_49 == nil then
    L3_51 = _UPVALUE0_
    L3_51 = L3_51.INVALID_ARGUMENT
    return L3_51
  end
  L3_51 = status
  if L3_51 == nil then
    L3_51 = _UPVALUE0_
    L3_51 = L3_51.FAILURE
    L4_52 = A0_48
    return L3_51, L4_52
  end
  L3_51 = _UPVALUE0_
  L3_51 = L3_51.SUCCESS
  L4_52 = A0_48
  return L3_51, L4_52
end
function wpsEncryptionGet()
  local L0_53, L1_54
  L1_54 = db
  L1_54 = L1_54.getAttribute
  L1_54 = L1_54(_UPVALUE0_, "_ROWID_", "1", _UPVALUE1_.wpsEncryption)
  if L1_54 == nil then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L1_54
end
function wpsEncryptionGetNext(A0_55)
  local L1_56, L2_57, L3_58
  L3_58 = db
  L3_58 = L3_58.getAttribute
  L3_58 = L3_58(_UPVALUE0_, "_ROWID_", L2_57, _UPVALUE1_.wpsEncryption)
  if L3_58 == nil then
    return _UPVALUE2_.FAILURE, L2_57
  end
  return _UPVALUE2_.SUCCESS, L2_57, L3_58
end
function wpsEncryptionSet(A0_59, A1_60)
  local L2_61, L3_62, L4_63
  if A1_60 == nil then
    L3_62 = _UPVALUE0_
    L3_62 = L3_62.INVALID_ARGUMENT
    return L3_62
  end
  L3_62 = status
  if L3_62 == nil then
    L3_62 = _UPVALUE0_
    L3_62 = L3_62.FAILURE
    L4_63 = A0_59
    return L3_62, L4_63
  end
  L3_62 = _UPVALUE0_
  L3_62 = L3_62.SUCCESS
  L4_63 = A0_59
  return L3_62, L4_63
end
function wpsStationPinGet()
  local L0_64, L1_65
  L1_65 = db
  L1_65 = L1_65.getAttribute
  L1_65 = L1_65(_UPVALUE0_, "_ROWID_", "1", _UPVALUE1_.wpsStationPin)
  if L1_65 == nil then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L1_65
end
function wpsStationPinGetNext(A0_66)
  local L1_67, L2_68, L3_69
  L3_69 = db
  L3_69 = L3_69.getAttribute
  L3_69 = L3_69(_UPVALUE0_, "_ROWID_", L2_68, _UPVALUE1_.wpsStationPin)
  if L3_69 == nil then
    return _UPVALUE2_.FAILURE, L2_68
  end
  return _UPVALUE2_.SUCCESS, L2_68, L3_69
end
function wpsStationPinSet(A0_70, A1_71)
  local L2_72, L3_73, L4_74
  if A1_71 == nil then
    L3_73 = _UPVALUE0_
    L3_73 = L3_73.INVALID_ARGUMENT
    return L3_73
  end
  L3_73 = status
  if L3_73 == nil then
    L3_73 = _UPVALUE0_
    L3_73 = L3_73.FAILURE
    L4_74 = A0_70
    return L3_73, L4_74
  end
  L3_73 = _UPVALUE0_
  L3_73 = L3_73.SUCCESS
  L4_74 = A0_70
  return L3_73, L4_74
end
function sessionStatusGet()
  local L0_75, L1_76
  L1_76 = db
  L1_76 = L1_76.getAttribute
  L1_76 = L1_76(_UPVALUE0_, "_ROWID_", "1", _UPVALUE1_.sessionStatus)
  if L1_76 == nil then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L1_76
end
function sessionStatusGetNext(A0_77)
  local L1_78, L2_79, L3_80
  L3_80 = db
  L3_80 = L3_80.getAttribute
  L3_80 = L3_80(_UPVALUE0_, "_ROWID_", L2_79, _UPVALUE1_.sessionStatus)
  if L3_80 == nil then
    return _UPVALUE2_.FAILURE, L2_79
  end
  return _UPVALUE2_.SUCCESS, L2_79, L3_80
end
function sessionStatusSet(A0_81, A1_82)
  local L2_83, L3_84, L4_85
  if A1_82 == nil then
    L3_84 = _UPVALUE0_
    L3_84 = L3_84.INVALID_ARGUMENT
    return L3_84
  end
  L3_84 = status
  if L3_84 == nil then
    L3_84 = _UPVALUE0_
    L3_84 = L3_84.FAILURE
    L4_85 = A0_81
    return L3_84, L4_85
  end
  L3_84 = _UPVALUE0_
  L3_84 = L3_84.SUCCESS
  L4_85 = A0_81
  return L3_84, L4_85
end
function wpsSettingsGet()
  local L0_86, L1_87, L2_88, L3_89, L4_90, L5_91, L6_92, L7_93, L8_94, L9_95, L10_96, L11_97, L12_98, L13_99, L14_100
  L0_86 = {}
  L1_87 = {}
  L2_88 = {}
  L3_89 = 0
  L4_90 = 0
  L5_91 = 0
  L9_95 = "1"
  L0_86 = L6_92
  if L0_86 == nil then
    L0_86 = L6_92
  end
  L9_95 = "1"
  L1_87 = L6_92
  if L1_87 == nil then
    L1_87 = L6_92
  end
  if L6_92 ~= "DSR-250N" then
  else
    if L6_92 == "DSR-250" then
  end
  else
    if L6_92 == "Bx" then
      L2_88 = L6_92
      for L9_95, L10_96 in L6_92(L7_93) do
        L3_89 = L3_89 + 1
        L11_97 = L2_88[L3_89]
        L12_98 = _UPVALUE3_
        L13_99 = "."
        L14_100 = _UPVALUE1_
        L14_100 = L14_100.profileName
        L12_98 = L12_98 .. L13_99 .. L14_100
        L12_98 = L11_97[L12_98]
        L12_98 = L12_98 or ""
        L13_99 = db
        L13_99 = L13_99.getRow
        L14_100 = _UPVALUE4_
        L13_99 = L13_99(L14_100, _UPVALUE1_.profileName, L12_98)
        if L13_99 ~= nil then
          L14_100 = _UPVALUE4_
          L14_100 = L14_100 .. "." .. _UPVALUE1_.security
          L14_100 = L13_99[L14_100]
          if L14_100 ~= "WPA" then
            L14_100 = _UPVALUE4_
            L14_100 = L14_100 .. "." .. _UPVALUE1_.security
            L14_100 = L13_99[L14_100]
            if L14_100 ~= "WPA2" then
              L14_100 = _UPVALUE4_
              L14_100 = L14_100 .. "." .. _UPVALUE1_.security
              L14_100 = L13_99[L14_100]
            end
          elseif L14_100 == "WPA+WPA2" then
            L4_90 = L4_90 + 1
            L14_100 = _UPVALUE3_
            L14_100 = L14_100 .. "." .. _UPVALUE1_.vapEnabled
            L14_100 = L11_97[L14_100]
            L14_100 = L14_100 or 0
            if tonumber(L14_100) == 1 then
              L5_91 = 1
            end
          end
        end
      end
  end
  else
    L9_95 = _UPVALUE5_
    L2_88 = L6_92
    L9_95 = _UPVALUE1_
    L9_95 = L9_95.profileName
    L10_96 = L6_92
    if L7_93 ~= nil then
      L9_95 = "."
      L10_96 = _UPVALUE1_
      L10_96 = L10_96.security
      if L8_94 ~= "WPA" then
        L9_95 = "."
        L10_96 = _UPVALUE1_
        L10_96 = L10_96.security
        if L8_94 ~= "WPA2" then
          L9_95 = "."
          L10_96 = _UPVALUE1_
          L10_96 = L10_96.security
        end
      elseif L8_94 == "WPA+WPA2" then
        L4_90 = L4_90 + 1
        L9_95 = "."
        L10_96 = _UPVALUE1_
        L10_96 = L10_96.vapEnabled
        L9_95 = tonumber
        L10_96 = L8_94
        L9_95 = L9_95(L10_96)
        if L9_95 == 1 then
          L5_91 = 1
        end
      end
    end
  end
  if L4_90 == 0 or L5_91 == 0 then
    L9_95 = L2_88
    return L6_92, L7_93, L8_94, L9_95
  end
  L9_95 = L2_88
  return L6_92, L7_93, L8_94, L9_95
end
function wpsSettingsGetNext(A0_101)
  local L1_102, L2_103, L3_104, L4_105
  L2_103 = status
  if L2_103 == nil then
    L2_103 = _UPVALUE0_
    L2_103 = L2_103.FAILURE
    L3_104 = A0_101
    return L2_103, L3_104
  end
  L2_103 = _UPVALUE0_
  L2_103 = L2_103.SUCCESS
  L3_104 = L1_102
  L4_105 = wpsSettings
  return L2_103, L3_104, L4_105
end
function wpsSettingsSet(A0_106, A1_107, A2_108)
  local L3_109, L4_110, L5_111, L6_112, L7_113
  L3_109 = {}
  L4_110 = {}
  L5_111 = _UPVALUE0_
  L5_111 = L5_111.NIL
  L6_112 = _UPVALUE0_
  L6_112 = L6_112.NIL
  L7_113 = _UPVALUE0_
  L7_113 = L7_113.NIL
  L5_111 = _UPVALUE1_.booleanCheck(A2_108)
  if L5_111 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L7_113 = db.getAttribute(_UPVALUE2_, _UPVALUE3_.vapName, A1_107, _UPVALUE3_.profileName)
  if L7_113 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_106
  end
  if L7_113 == "WPA" or L7_113 == "WPA2" or L7_113 == "WPA+WPA2" then
    return _UPVALUE4_.WPS_CONFIG_WARNING
  end
  L3_109 = db.getRow(_UPVALUE5_, _UPVALUE3_.ROW_ID, A0_106)
  if L3_109 == _UPVALUE0_.NIL then
    L4_110[_UPVALUE5_ .. "." .. _UPVALUE3_.vapName] = A1_107
    L4_110[_UPVALUE5_ .. "." .. _UPVALUE3_.wpsEnabled] = A2_108
    L6_112 = db.insert(_UPVALUE5_, L4_110)
  else
    L3_109[_UPVALUE5_ .. "." .. _UPVALUE3_.vapName] = A1_107
    L3_109[_UPVALUE5_ .. "." .. _UPVALUE3_.wpsEnabled] = A2_108
    L6_112 = db.update(_UPVALUE5_, L3_109, A0_106)
  end
  if L6_112 == nil then
    return _UPVALUE0_.FAILURE, A0_106
  end
  return _UPVALUE0_.SUCCESS, A0_106
end
function wpsSettingsCreate(A0_114, A1_115, A2_116, A3_117, A4_118, A5_119, A6_120)
  return _UPVALUE0_.NOT_SUPPORTED
end
function wpsSettingsDelete(A0_121)
  return _UPVALUE0_.NOT_SUPPORTED
end
function wpsPinSet(A0_122)
  local L1_123, L2_124, L3_125, L4_126
  L1_123 = 0
  L2_124 = 0
  L3_125 = _UPVALUE0_
  L3_125 = L3_125.NIL
  L4_126 = _UPVALUE0_
  L4_126 = L4_126.NIL
  if string.len(A0_122) == 8 then
    L1_123 = tonumber(A0_122)
    L2_124 = math.floor(L2_124 + 3 * (math.floor(L1_123 / 10000000) % 10))
    L2_124 = math.floor(L2_124 + 1 * (math.floor(L1_123 / 1000000) % 10))
    L2_124 = math.floor(L2_124 + 3 * (math.floor(L1_123 / 100000) % 10))
    L2_124 = math.floor(L2_124 + 1 * (math.floor(L1_123 / 10000) % 10))
    L2_124 = math.floor(L2_124 + 3 * (math.floor(L1_123 / 1000) % 10))
    L2_124 = math.floor(L2_124 + 1 * (math.floor(L1_123 / 100) % 10))
    L2_124 = math.floor(L2_124 + 3 * (math.floor(L1_123 / 10) % 10))
    L2_124 = math.floor(L2_124 + 1 * (math.floor(L1_123 / 1) % 10))
    if L2_124 % 10 == 0 then
      L3_125 = db.getAttribute(_UPVALUE1_, _UPVALUE2_.name, WPS_PIN_PROGRAM_VARIABLE, _UPVALUE2_.value)
      if L3_125 ~= nil then
        L4_126 = os.execute(L3_125 .. " " .. A0_122)
        return _UPVALUE0_.SUCCESS
      end
    end
  end
  return _UPVALUE3_.WPSPIN_IS_NOT_VALID
end
function wpsPbcSet()
  local L0_127, L1_128, L2_129
  L0_127 = _UPVALUE0_
  L0_127 = L0_127.NIL
  L1_128 = _UPVALUE0_
  L1_128 = L1_128.NIL
  L2_129 = ""
  L0_127 = db.getAttribute(_UPVALUE1_, _UPVALUE2_.name, WPS_PBC_PROGRAM_VARIABLE, _UPVALUE2_.value)
  if L0_127 ~= nil then
    L2_129 = os.execute(L0_127)
    return _UPVALUE0_.SUCCESS
  end
  return _UPVALUE0_.FAILURE
end
function profileRowGet(A0_130)
  local L1_131, L2_132
  L1_131 = A0_130
  L2_132 = db
  L2_132 = L2_132.getRow
  L2_132 = L2_132(_UPVALUE0_, _UPVALUE1_.profileName, L1_131)
  return _UPVALUE2_.SUCCESS, L2_132
end
function fieldNameGet(A0_133, A1_134, A2_135, A3_136)
  local L4_137
  L4_137 = db
  L4_137 = L4_137.getAttribute
  L4_137 = L4_137(A0_133, A2_135, A3_136, A1_134)
  return _UPVALUE0_.SUCCESS, L4_137
end
function profileNameGet(A0_138)
  local L1_139
  L1_139 = db
  L1_139 = L1_139.getAttribute
  L1_139 = L1_139(_UPVALUE0_, _UPVALUE1_.vapName, A0_138, _UPVALUE1_.profileName)
  L1_139 = L1_139 or ""
  return _UPVALUE2_.SUCCESS, L1_139
end
