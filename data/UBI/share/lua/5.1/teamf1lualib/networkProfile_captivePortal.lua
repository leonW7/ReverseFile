local L0_0
L0_0 = module
L0_0("com.teamf1.core.vlan.networkProfileCaptiveportal", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vlan_validation")
L0_0 = require
L0_0("teamf1lualib/captivePortal_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.captivePortal_returnCodes")
captiveportalTable = "CaptivePortalSSID"
captiveTable = "captiveportal"
;({}).vlanId = "vlanId"
;({}).networkId = "networkId"
;({}).ssid = "ssid"
;({}).intfNum = "intfNum"
;({}).captivePortalType = "accessType"
;({}).authenticationType = "authServerId"
;({}).loginProfile = "profileId"
;({}).redirectType = "redirectType"
;({}).captivePortalName = "captivePortalName"
;({}).authenticationSubTypeName = "authenticationSubTypeName"
;({}).authenticationTypeName = "authenticationTypeName"
;({}).profileName = "profileName"
;({}).enable = "enable"
;({}).redirect = "enableRedirect"
;({}).url = "url"
authType = {}
authType.Free = "Free"
authType.SLA = "SLA"
authType.permanent = "Permanent"
authType.temporary = "Temporary"
authServer = {}
authServer.Local = "local"
authServer.radius = "radius"
authServer.ldap = "ldap"
authServer.pop3 = "pop3"
authServer.radiusType = {}
authServer.radiusType.pap = "pap"
authServer.radiusType.chap = "chap"
authServer.radiusType.mschap = "ms-chap"
authServer.radiusType.mschapv1 = "ms-chapv2"
serverValue = {}
serverValue[authServer.Local] = "0"
serverValue[authServer.ldap] = "20"
serverValue[authServer.pop3] = "50"
serverValue[authServer.radiusType.pap] = "11"
serverValue[authServer.radiusType.chap] = "12"
serverValue[authServer.radiusType.mschap] = "13"
serverValue[authServer.radiusType.mschapv1] = "14"
authTypeValue = {}
authTypeValue[authType.Free] = "0"
authTypeValue[authType.SLA] = "1"
authTypeValue[authType.permanent] = "2"
authTypeValue[authType.temporary] = "3"
loginProfileTable = "CaptivePortalPageDetails"
;({}).name = "configurationName"
;({}).profileId = "profileId"
loginProfileSlaTable = "slaProfile"
;({}).name = "slaProfileName"
;({}).profileId = "_ROWID_"
ENABLE = "1"
DISABLE = "0"
vlanMinNumber = 1
vlanMaxNumber = 4096
BDG_NAME = "bdg"
ROWID = "_ROWID_"
REDIRECT2 = "2"
REDIRECT1 = "0"
function captivePortalGet(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12
  L1_2 = db
  L1_2 = L1_2.getRow
  L2_3 = captiveportalTable
  L3_4 = _UPVALUE0_
  L3_4 = L3_4.networkId
  L1_2 = L1_2(L2_3, L3_4, L4_5)
  L2_3 = _UPVALUE1_
  L2_3 = L2_3.NIL
  if L1_2 == L2_3 then
    L2_3 = _UPVALUE1_
    L2_3 = L2_3.FAILURE
    L3_4 = A0_1
    return L2_3, L3_4
  end
  L2_3 = captiveportalTable
  L3_4 = "."
  L2_3 = L2_3 .. L3_4 .. L4_5
  L2_3 = L1_2[L2_3]
  L3_4 = nil
  for L7_8, L8_9 in L4_5(L5_6) do
    if L8_9 == L2_3 then
      L3_4 = L7_8
      break
    end
  end
  for L10_11, L11_12 in L7_8(L8_9) do
    if L11_12 == L4_5 then
      break
    end
  end
  if L5_6 ~= L7_8 then
  elseif L5_6 == L7_8 then
  end
  L10_11 = _UPVALUE0_
  L10_11 = L10_11.loginProfile
  L10_11 = authType
  L10_11 = L10_11.SLA
  if L3_4 == L9_10 then
    L10_11 = authType
    L10_11 = L10_11.Free
  elseif L3_4 ~= L9_10 and L8_9 ~= "0" then
    L10_11 = loginProfileTable
    L11_12 = _UPVALUE2_
    L11_12 = L11_12.profileId
    if L7_8 == L9_10 then
      L10_11 = A0_1
      return L9_10, L10_11
    end
  end
  L10_11 = authType
  L10_11 = L10_11.SLA
  if L3_4 == L10_11 then
    L10_11 = db
    L10_11 = L10_11.getAttribute
    L11_12 = loginProfileSlaTable
    L10_11 = L10_11(L11_12, ROWID, L8_9, _UPVALUE3_.name)
    L10_11 = NIL
    if L9_10 == L10_11 then
      L10_11 = _UPVALUE1_
      L10_11 = L10_11.FAILURE
      L11_12 = A0_1
      return L10_11, L11_12
    end
  end
  L10_11 = captiveportalTable
  L11_12 = "."
  L10_11 = L10_11 .. L11_12 .. _UPVALUE0_.redirect
  L10_11 = L1_2[L10_11]
  L11_12 = captiveportalTable
  L11_12 = L11_12 .. "." .. _UPVALUE0_.url
  L11_12 = L1_2[L11_12]
  return _UPVALUE1_.SUCCESS, A0_1, L1_2[captiveportalTable .. "." .. _UPVALUE0_.networkId], L1_2[captiveportalTable .. "." .. _UPVALUE0_.ssid], L1_2[captiveportalTable .. "." .. _UPVALUE0_.intfNum], L1_2[captiveportalTable .. "." .. _UPVALUE0_.vlanId], L3_4, L5_6, L6_7, L7_8, L10_11, L11_12, L9_10
end
function captivePortalSet(A0_13, A1_14, A2_15, A3_16, A4_17, A5_18, A6_19, A7_20, A8_21, A9_22, A10_23, A11_24)
  local L12_25, L13_26, L14_27, L15_28, L16_29, L17_30
  L12_25 = _UPVALUE0_
  L12_25 = L12_25.NIL
  if A2_15 == L12_25 then
    L12_25 = _UPVALUE1_
    L12_25 = L12_25.COMP_CAPTIVEPORTAL_VLAN_VLANID_NIL
    return L12_25
  end
  L12_25 = tonumber
  L13_26 = A2_15
  L12_25 = L12_25(L13_26)
  L13_26 = vlanMinNumber
  if not (L12_25 < L13_26) then
    L13_26 = vlanMaxNumber
  elseif L12_25 > L13_26 then
    L13_26 = _UPVALUE1_
    L13_26 = L13_26.COMP_CAPTIVEPORTAL_VLAN_VLANID_INVALID
    return L13_26
  end
  L13_26 = _UPVALUE0_
  L13_26 = L13_26.NIL
  if A5_18 == L13_26 then
    L13_26 = _UPVALUE1_
    L13_26 = L13_26.COMP_CAPTIVEPORTAL_VLAN_CAPTIVEPORTALTYPE_NIL
    return L13_26
  end
  L13_26 = authType
  L13_26 = L13_26.Free
  if A5_18 ~= L13_26 then
    L13_26 = authType
    L13_26 = L13_26.permanent
    if A5_18 ~= L13_26 then
      L13_26 = authType
      L13_26 = L13_26.SLA
      if A5_18 ~= L13_26 then
        L13_26 = authType
        L13_26 = L13_26.temporary
        if A5_18 ~= L13_26 then
          L13_26 = _UPVALUE1_
          L13_26 = L13_26.COMP_CAPTIVEPORTAL_VLAN_CAPTIVEPORTALTYPE_INVALID
          return L13_26
        end
      end
    end
  end
  L13_26 = nil
  for L17_30, _FORV_18_ in L14_27(L15_28) do
    if L17_30 == A5_18 then
      L13_26 = _FORV_18_
      break
    end
  end
  if A5_18 ~= L14_27 then
    if A5_18 ~= L14_27 then
      if A5_18 ~= L14_27 then
        if A6_19 ~= L14_27 then
          if A6_19 ~= L14_27 then
            if A6_19 ~= L14_27 then
              if A6_19 ~= L14_27 then
                return L14_27
              end
            end
          end
        end
      end
    end
  end
  if A6_19 == L14_27 then
    if A7_20 ~= L14_27 then
      if A7_20 ~= L14_27 then
        if A7_20 ~= L14_27 then
          if A7_20 ~= L14_27 then
            return L14_27
          end
        end
      end
    end
    A6_19 = A7_20
  end
  for _FORV_18_, _FORV_19_ in L15_28(L16_29) do
    if _FORV_18_ == A6_19 then
      break
    end
  end
  if A5_18 ~= L15_28 then
  else
  end
  if A5_18 ~= L17_30 then
    if A5_18 ~= L17_30 then
      if A8_21 == L17_30 then
        return L17_30
      end
    end
  end
  if A5_18 ~= L17_30 then
  else
  end
  if A5_18 ~= L17_30 then
    if A5_18 ~= L17_30 then
      if L16_29 == L17_30 then
        return L17_30
      end
    end
  elseif A5_18 == L17_30 then
    if L16_29 == L17_30 then
      return L17_30
    end
  end
  if A5_18 ~= L17_30 then
    if A9_22 ~= L17_30 then
      if A9_22 ~= L17_30 then
        return L17_30
      end
    end
    if A9_22 == L17_30 and A10_23 == nil then
      return L17_30
    end
  end
  L17_30[captiveportalTable .. "." .. _UPVALUE4_.vlanId] = A2_15
  L17_30[captiveportalTable .. "." .. _UPVALUE4_.ssid] = A3_16
  L17_30[captiveportalTable .. "." .. _UPVALUE4_.intfNum] = A4_17
  L17_30[captiveportalTable .. "." .. _UPVALUE4_.captivePortalType] = L13_26
  L17_30[captiveportalTable .. "." .. _UPVALUE4_.authenticationType] = L14_27
  L17_30[captiveportalTable .. "." .. _UPVALUE4_.loginProfile] = L16_29
  L17_30[captiveportalTable .. "." .. _UPVALUE4_.redirectType] = L15_28
  L17_30[captiveportalTable .. "." .. _UPVALUE4_.redirect] = A9_22
  L17_30[captiveportalTable .. "." .. _UPVALUE4_.url] = A10_23
  if db.update(captiveportalTable, L17_30, A0_13) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_13
  end
  return _UPVALUE0_.SUCCESS, A0_13
end
