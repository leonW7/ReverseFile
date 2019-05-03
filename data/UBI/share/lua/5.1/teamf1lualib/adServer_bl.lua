local L0_0
L0_0 = module
L0_0("com.teamf1.bl.authentication.activedirectory", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/authentication_activedirectory")
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
sslVpnExAuthTable = "USERDBDomains"
attribute = {}
attribute.authType = "AuthenticationType"
function adServerGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12
  L11_12 = _UPVALUE0_
  L11_12 = L11_12.serverGet
  L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, primaryAdminAccount, primaryAdminPassword, primaryServerHostName, secondaryAdminAccount, secondaryAdminPassword, secondaryServerHostName, tertiaryAdminAccount, tertiaryAdminPassword, tertiaryServerHostName, L11_12 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, L11_12()
  L0_1 = L11_12
  L11_12 = _UPVALUE1_
  L11_12 = L11_12.SUCCESS
  if L0_1 ~= L11_12 then
    return L0_1
  end
  L11_12 = {}
  L11_12["adServer.cookie"] = L1_2
  L11_12["adServer.profile"] = L2_3
  L11_12["adServer.primaryServer"] = L3_4
  L11_12["adServer.secondaryServer"] = L4_5
  L11_12["adServer.tertiaryServer"] = L5_6
  L11_12["adServer.primaryDomain"] = L6_7
  L11_12["adServer.secondaryDomain"] = L7_8
  L11_12["adServer.tertiaryDomain"] = L8_9
  L11_12["adServer.timeout"] = L9_10
  L11_12["adServer.maxRetries"] = L10_11
  L11_12["adServer.primaryAdminAccount"] = primaryAdminAccount
  L11_12["adServer.primaryAdminPassword"] = primaryAdminPassword
  L11_12["adServer.primaryServerHostName"] = primaryServerHostName
  L11_12["adServer.secondaryAdminAccount"] = secondaryAdminAccount
  L11_12["adServer.secondaryAdminPassword"] = secondaryAdminPassword
  L11_12["adServer.secondaryServerHostName"] = secondaryServerHostName
  L11_12["adServer.tertiaryAdminAccount"] = tertiaryAdminAccount
  L11_12["adServer.tertiaryAdminPassword"] = tertiaryAdminPassword
  L11_12["adServer.tertiaryServerHostName"] = tertiaryServerHostName
  return L0_1, L11_12
end
function adServerGetNext(A0_13)
  if A0_13["adServer.cookie"] == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  return _UPVALUE0_.NOT_SUPPORTED
end
function adServerSet(A0_14)
  local L1_15, L2_16, L3_17, L4_18, L5_19, L6_20, L7_21, L8_22, L9_23, L10_24, L11_25, L12_26, L13_27, L14_28, L15_29, L16_30, L17_31, L18_32, L19_33, L20_34, L21_35, L22_36, L23_37, L24_38
  L1_15 = FIRST_COOKIE
  L2_16 = DEFAULT
  L3_17 = A0_14["adServer.primaryServer"]
  L4_18 = A0_14["adServer.secondaryServer"]
  L5_19 = A0_14["adServer.tertiaryServer"]
  L6_20 = A0_14["adServer.primaryDomain"]
  L7_21 = A0_14["adServer.secondaryDomain"]
  L8_22 = A0_14["adServer.tertiaryDomain"]
  L9_23 = A0_14["adServer.timeout"]
  L10_24 = A0_14["adServer.maxRetries"]
  L11_25 = A0_14["adServer.primaryAdminAccount"]
  L12_26 = A0_14["adServer.primaryAdminPassword"]
  L13_27 = A0_14["adServer.primaryServerHostName"]
  L14_28 = A0_14["adServer.secondaryAdminAccount"]
  L15_29 = A0_14["adServer.secondaryAdminPassword"]
  L16_30 = A0_14["adServer.secondaryServerHostName"]
  L17_31 = A0_14["adServer.tertiaryAdminAccount"]
  L18_32 = A0_14["adServer.tertiaryAdminPassword"]
  L19_33 = A0_14["adServer.tertiaryServerHostName"]
  if L1_15 == nil then
    L20_34 = util
    L20_34 = L20_34.appendDebugOut
    L20_34(L21_35)
    L20_34 = _UPVALUE0_
    L20_34 = L20_34.BAD_PARAMETER
    return L20_34
  end
  L20_34 = HIGH_SEC
  if L20_34 == "HIGH" then
    L20_34 = db
    L20_34 = L20_34.getTable
    L20_34 = L20_34(L21_35)
    for L24_38, _FORV_25_ in L21_35(L22_36) do
      if db.getAttribute(sslVpnExAuthTable, "_ROWID_", L24_38, attribute.authType) == "active-directory" then
        return _UPVALUE1_.AD_SERVER_SSLPORTAL_CONF
      end
    end
  end
  L20_34 = nil
  if L21_35 ~= 0 then
    L21_35(L22_36)
    return L21_35
  end
  L21_35()
  L24_38 = L3_17
  cookie = L22_36
  L20_34 = L21_35
  if L20_34 ~= L21_35 then
    L21_35(L22_36)
    L21_35()
    return L21_35, L22_36
  end
  L21_35()
  L21_35()
  return L21_35, L22_36
end
function adServerDelete(A0_39)
  local L1_40, L2_41
  L1_40 = A0_39["adServer.cookie"]
  if L1_40 == nil then
    L2_41 = util
    L2_41 = L2_41.appendDebugOut
    L2_41("GetNext : Invalid Cookie")
    L2_41 = _UPVALUE0_
    L2_41 = L2_41.BAD_PARAMETER
    return L2_41
  end
  L2_41 = _UPVALUE0_
  L2_41 = L2_41.NOT_SUPPORTED
  return L2_41, L1_40
end
function adServerCreate(A0_42)
  local L1_43, L2_44
  L1_43 = A0_42["adServer.cookie"]
  if L1_43 == nil then
    L2_44 = util
    L2_44 = L2_44.appendDebugOut
    L2_44("GetNext : Invalid Cookie")
    L2_44 = _UPVALUE0_
    L2_44 = L2_44.BAD_PARAMETER
    return L2_44
  end
  L2_44 = _UPVALUE0_
  L2_44 = L2_44.NOT_SUPPORTED
  return L2_44, L1_43
end
function adServerDefaultsGet()
  local L0_45, L1_46, L2_47, L3_48
  L0_45 = _UPVALUE0_
  L0_45 = L0_45.SUCCESS
  L1_46 = {}
  L2_47 = FIRST_COOKIE
  L1_46["adServer.cookie"] = L2_47
  L2_47 = DEFAULT
  L1_46["adServer.profile"] = L2_47
  L2_47 = SERVER1
  L1_46["adServer.primaryServer"] = L2_47
  L2_47 = SERVER2
  L1_46["adServer.secondaryServer"] = L2_47
  L2_47 = SERVER3
  L1_46["adServer.tertiaryServer"] = L2_47
  L2_47 = DOMAIN1
  L1_46["adServer.primaryDomain"] = L2_47
  L2_47 = DOMAIN2
  L1_46["adServer.secondaryDomain"] = L2_47
  L2_47 = DOMAIN3
  L1_46["adServer.tertiaryDomain"] = L2_47
  L2_47 = TIMEOUT
  L1_46["adServer.timeout"] = L2_47
  L2_47 = RETRIES
  L1_46["adServer.maxRetries"] = L2_47
  L2_47 = L0_45
  L3_48 = L1_46
  return L2_47, L3_48
end
function getServerStatus(A0_49)
  local L1_50, L2_51
  L1_50 = _UPVALUE0_
  L1_50 = L1_50.getCheckNow
  L2_51 = A0_49
  L2_51 = L1_50(L2_51)
  if L1_50 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  return L1_50, L2_51
end
function serverStatusSet(A0_52, A1_53)
  local L2_54, L3_55
  L2_54 = _UPVALUE0_
  L2_54 = L2_54.serverCheckConfig
  L3_55 = A0_52
  L3_55 = L2_54(L3_55, A1_53)
  if L2_54 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  return L2_54, L3_55
end
