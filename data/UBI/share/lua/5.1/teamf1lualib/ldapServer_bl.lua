local L0_0
L0_0 = module
L0_0("com.teamf1.bl.authentication.ldap", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/authentication_ldap")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/auth_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
DEFAULT = "Default"
NIL = nil
FIRST_COOKIE = "1"
SERVER1 = ""
SERVER2 = ""
SERVER3 = ""
DOMAIN1 = ""
DOMAIN2 = ""
DOMAIN3 = ""
TIMEOUT = ""
RETRIES = 5
ATTRIBUTE1 = ""
ATTRIBUTE2 = ""
ATTRIBUTE3 = ""
ATTRIBUTE4 = ""
PRIMARY_ADMIN = "admin"
PRIMARY_ADMIN_PASSWORD = "admin"
SEC_ADMIN = ""
SEC_ADMIN_PASSWORD = ""
TER_ADMIN = ""
TER_ADMIN_PASSWORD = ""
sslVpnExAuthTable = "USERDBDomains"
attribute = {}
attribute.authType = "AuthenticationType"
function ldapServerGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22
  L21_22 = _UPVALUE0_
  L21_22 = L21_22.serverGet
  L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, L21_22()
  L0_1 = L21_22
  L21_22 = _UPVALUE1_
  L21_22 = L21_22.SUCCESS
  if L0_1 ~= L21_22 then
    return L0_1
  end
  L21_22 = {}
  L21_22["ldapServer.cookie"] = L1_2
  L21_22["ldapServer.profile"] = L2_3
  L21_22["ldapServer.primaryServer"] = L3_4
  L21_22["ldapServer.secondaryServer"] = L4_5
  L21_22["ldapServer.tertiaryServer"] = L5_6
  L21_22["ldapServer.primaryDomain"] = L6_7
  L21_22["ldapServer.secondaryDomain"] = L7_8
  L21_22["ldapServer.tertiaryDomain"] = L8_9
  L21_22["ldapServer.timeout"] = L9_10
  L21_22["ldapServer.maxRetries"] = L10_11
  L21_22["ldapServer.attribute1"] = L11_12
  L21_22["ldapServer.attribute2"] = L12_13
  L21_22["ldapServer.attribute3"] = L13_14
  L21_22["ldapServer.attribute4"] = L14_15
  L21_22["ldapServer.primaryAdminUser"] = L15_16
  L21_22["ldapServer.primaryAdminPassword"] = L16_17
  L21_22["ldapServer.secondaryAdminUser"] = L17_18
  L21_22["ldapServer.secondrayAdminPassword"] = L18_19
  L21_22["ldapServer.tertiaryAdminUser"] = L19_20
  L21_22["ldapServer.tertiaryAdminPassword"] = L20_21
  return L0_1, L21_22
end
function ldapServerGetNext(A0_23)
  local L1_24
  L1_24 = ldapServer
  L1_24 = L1_24.cookie
  L1_24 = A0_23[L1_24]
  if L1_24 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  return _UPVALUE0_.NOT_SUPPORTED
end
function ldapServerSet(A0_25)
  local L1_26, L2_27, L3_28, L4_29, L5_30, L6_31, L7_32, L8_33, L9_34, L10_35, L11_36, L12_37, L13_38, L14_39, L15_40, L16_41, L17_42, L18_43, L19_44, L20_45, L21_46, L22_47, L23_48, L24_49, L25_50, L26_51
  L1_26 = FIRST_COOKIE
  L2_27 = DEFAULT
  L3_28 = A0_25["ldapServer.primaryServer"]
  L4_29 = A0_25["ldapServer.secondaryServer"]
  L5_30 = A0_25["ldapServer.tertiaryServer"]
  L6_31 = A0_25["ldapServer.primaryDomain"]
  L7_32 = A0_25["ldapServer.secondaryDomain"]
  L8_33 = A0_25["ldapServer.tertiaryDomain"]
  L9_34 = A0_25["ldapServer.timeout"]
  L10_35 = A0_25["ldapServer.maxRetries"]
  L11_36 = A0_25["ldapServer.attribute1"]
  L12_37 = A0_25["ldapServer.attribute2"]
  L13_38 = A0_25["ldapServer.attribute3"]
  L14_39 = A0_25["ldapServer.attribute4"]
  L15_40 = A0_25["ldapServer.primaryAdminUser"]
  L16_41 = A0_25["ldapServer.primaryAdminPassword"]
  L17_42 = A0_25["ldapServer.secondaryAdminUser"]
  L18_43 = A0_25["ldapServer.secondrayAdminPassword"]
  L19_44 = A0_25["ldapServer.tertiaryAdminUser"]
  L20_45 = A0_25["ldapServer.tertiaryAdminPassword"]
  if L1_26 == nil then
    L21_46 = util
    L21_46 = L21_46.appendDebugOut
    L22_47 = "Set : Invalid Cookie"
    L21_46(L22_47)
    L21_46 = _UPVALUE0_
    L21_46 = L21_46.BAD_PARAMETER
    return L21_46
  end
  L21_46 = nil
  L22_47 = ACCESS_LEVEL
  if L22_47 ~= 0 then
    L22_47 = util
    L22_47 = L22_47.appendDebugOut
    L22_47(L23_48)
    L22_47 = _UPVALUE0_
    L22_47 = L22_47.UNAUTHORIZED
    return L22_47
  end
  L22_47 = HIGH_SEC
  if L22_47 == "HIGH" then
    L22_47 = db
    L22_47 = L22_47.getTable
    L22_47 = L22_47(L23_48)
    for L26_51, _FORV_27_ in L23_48(L24_49) do
      if db.getAttribute(sslVpnExAuthTable, "_ROWID_", L26_51, attribute.authType) == "ldap" then
        return _UPVALUE1_.LDAP_SERVER_SSLPORTAL_CONF
      end
    end
  end
  L22_47 = _UPVALUE2_
  L22_47 = L22_47.start
  L22_47()
  L22_47 = _UPVALUE3_
  L22_47 = L22_47.serverSet
  L26_51 = L4_29
  L22_47 = L22_47(L23_48, L24_49, L25_50, L26_51, L5_30, L6_31, L7_32, L8_33, L9_34, L10_35, L11_36, L12_37, L13_38, L14_39, L15_40, L16_41, L17_42, L18_43, L19_44, L20_45)
  cookie = L23_48
  L21_46 = L22_47
  L22_47 = _UPVALUE0_
  L22_47 = L22_47.SUCCESS
  if L21_46 ~= L22_47 then
    L22_47 = util
    L22_47 = L22_47.appendDebugOut
    L22_47(L23_48)
    L22_47 = _UPVALUE2_
    L22_47 = L22_47.abort
    L22_47()
    L22_47 = L21_46
    return L22_47, L23_48
  end
  L22_47 = _UPVALUE2_
  L22_47 = L22_47.complete
  L22_47()
  L22_47 = _UPVALUE2_
  L22_47 = L22_47.save
  L22_47()
  L22_47 = _UPVALUE0_
  L22_47 = L22_47.SUCCESS
  return L22_47, L23_48
end
function ldapServerDelete(A0_52)
  local L1_53, L2_54, L3_55
  L1_53 = _UPVALUE0_
  L1_53 = L1_53.NOT_SUPPORTED
  L2_54 = L1_53
  L3_55 = A0_52
  return L2_54, L3_55
end
function ldapServerDefaultsGet()
  local L0_56, L1_57, L2_58, L3_59
  L0_56 = _UPVALUE0_
  L0_56 = L0_56.SUCCESS
  L1_57 = {}
  L2_58 = FIRST_COOKIE
  L1_57["ldapServer.cookie"] = L2_58
  L2_58 = DEFAULT
  L1_57["ldapServer.profile"] = L2_58
  L2_58 = SERVER1
  L1_57["ldapServer.primaryServer"] = L2_58
  L2_58 = SERVER2
  L1_57["ldapServer.secondaryServer"] = L2_58
  L2_58 = SERVER3
  L1_57["ldapServer.tertiaryServer"] = L2_58
  L2_58 = DOMAIN1
  L1_57["ldapServer.primaryDomain"] = L2_58
  L2_58 = DOMAIN2
  L1_57["ldapServer.secondaryDomain"] = L2_58
  L2_58 = DOMAIN3
  L1_57["ldapServer.tertiaryDomain"] = L2_58
  L2_58 = TIMEOUT
  L1_57["ldapServer.timeout"] = L2_58
  L2_58 = RETRIES
  L1_57["ldapServer.maxRetries"] = L2_58
  L2_58 = ATTRIBUTE1
  L1_57["ldapServer.attribute1"] = L2_58
  L2_58 = ATTRIBUTE2
  L1_57["ldapServer.attribute2"] = L2_58
  L2_58 = ATTRIBUTE3
  L1_57["ldapServer.attribute3"] = L2_58
  L2_58 = ATTRIBUTE4
  L1_57["ldapServer.attribute4"] = L2_58
  L2_58 = PRIMARY_ADMIN
  L1_57["ldapServer.primaryAdminUser"] = L2_58
  L2_58 = PRIMARY_ADMIN_PASSWORD
  L1_57["ldapServer.primaryAdminPassword"] = L2_58
  L2_58 = SEC_ADMIN
  L1_57["ldapServer.secondaryAdminUser"] = L2_58
  L2_58 = SEC_ADMIN_PASSWORD
  L1_57["ldapServer.secondrayAdminPassword"] = L2_58
  L2_58 = TER_ADMIN
  L1_57["ldapServer.tertiaryAdminUser"] = L2_58
  L2_58 = TER_ADMIN_PASSWORD
  L1_57["ldapServer.tertiaryAdminPassword"] = L2_58
  L2_58 = L0_56
  L3_59 = L1_57
  return L2_58, L3_59
end
function getServerStatus(A0_60)
  local L1_61, L2_62
  L1_61 = _UPVALUE0_
  L1_61 = L1_61.getCheckNow
  L2_62 = A0_60
  L2_62 = L1_61(L2_62)
  if L1_61 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  return L1_61, L2_62
end
function serverStatusSet(A0_63, A1_64)
  local L2_65, L3_66
  L2_65 = _UPVALUE0_
  L2_65 = L2_65.serverCheckConfig
  L3_66 = A0_63
  L3_66 = L2_65(L3_66, A1_64)
  if L2_65 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  return L2_65, L3_66
end
