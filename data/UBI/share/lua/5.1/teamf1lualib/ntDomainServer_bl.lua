local L0_0
L0_0 = module
L0_0("com.teamf1.bl.authentication.ntdomain", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/authentication_ntdomain")
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
function ntdomainServerGet()
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
  L11_12["ntDomain.cookie"] = FIRST_COOKIE
  L11_12["ntDomain.primaryServer"] = DEFAULT
  L11_12["ntDomain.primaryServer"] = L3_4
  L11_12["ntDomain.secondaryServer"] = L4_5
  L11_12["ntDomain.tertiaryServer"] = L5_6
  L11_12["ntDomain.primaryDomain"] = L6_7
  L11_12["ntDomain.secondaryDomain"] = L7_8
  L11_12["ntDomain.tertiaryDomain"] = L8_9
  L11_12["ntDomain.timeout"] = L9_10
  L11_12["ntDomain.maxRetries"] = L10_11
  L11_12["ntDomain.primaryAdminAccount"] = primaryAdminAccount
  L11_12["ntDomain.primaryAdminPassword"] = primaryAdminPassword
  L11_12["ntDomain.primaryServerHostName"] = primaryServerHostName
  L11_12["ntDomain.secondaryAdminAccount"] = secondaryAdminAccount
  L11_12["ntDomain.secondaryAdminPassword"] = secondaryAdminPassword
  L11_12["ntDomain.secondaryServerHostName"] = secondaryServerHostName
  L11_12["ntDomain.tertiaryAdminAccount"] = tertiaryAdminAccount
  L11_12["ntDomain.tertiaryAdminPassword"] = tertiaryAdminPassword
  L11_12["ntDomain.tertiaryServerHostName"] = tertiaryServerHostName
  return L0_1, L11_12
end
function ntdomainServerGetNext(A0_13)
  if A0_13["ntDomain.cookie"] == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  return _UPVALUE0_.NOT_SUPPORTED
end
function ntdomainServerSet(A0_14)
  local L1_15, L2_16, L3_17, L4_18, L5_19, L6_20, L7_21, L8_22, L9_23, L10_24, L11_25, L12_26, L13_27, L14_28, L15_29, L16_30, L17_31, L18_32, L19_33, L20_34, L21_35, L22_36, L23_37, L24_38, L25_39
  L1_15 = FIRST_COOKIE
  L2_16 = DEFAULT
  L3_17 = A0_14["ntDomain.primaryServer"]
  L4_18 = A0_14["ntDomain.secondaryServer"]
  L5_19 = A0_14["ntDomain.tertiaryServer"]
  L6_20 = A0_14["ntDomain.primaryDomain"]
  L7_21 = A0_14["ntDomain.secondaryDomain"]
  L8_22 = A0_14["ntDomain.tertiaryDomain"]
  L9_23 = A0_14["ntDomain.timeout"]
  L10_24 = A0_14["ntDomain.maxRetries"]
  L11_25 = A0_14["ntDomain.primaryAdminAccount"]
  L12_26 = A0_14["ntDomain.primaryAdminPassword"]
  L13_27 = A0_14["ntDomain.primaryServerHostName"]
  L14_28 = A0_14["ntDomain.secondaryAdminAccount"]
  L15_29 = A0_14["ntDomain.secondaryAdminPassword"]
  L16_30 = A0_14["ntDomain.secondaryServerHostName"]
  L17_31 = A0_14["ntDomain.tertiaryAdminAccount"]
  L18_32 = A0_14["ntDomain.tertiaryAdminPassword"]
  L19_33 = A0_14["ntDomain.tertiaryServerHostName"]
  if L1_15 == nil then
    L20_34 = util
    L20_34 = L20_34.appendDebugOut
    L21_35 = "Set : Invalid Cookie"
    L20_34(L21_35)
    L20_34 = _UPVALUE0_
    L20_34 = L20_34.BAD_PARAMETER
    return L20_34
  end
  L20_34 = nil
  L21_35 = ACCESS_LEVEL
  if L21_35 ~= 0 then
    L21_35 = util
    L21_35 = L21_35.appendDebugOut
    L21_35(L22_36)
    L21_35 = _UPVALUE0_
    L21_35 = L21_35.UNAUTHORIZED
    return L21_35
  end
  L21_35 = HIGH_SEC
  if L21_35 == "HIGH" then
    L21_35 = db
    L21_35 = L21_35.getTable
    L21_35 = L21_35(L22_36)
    for L25_39, _FORV_26_ in L22_36(L23_37) do
      if db.getAttribute(sslVpnExAuthTable, "_ROWID_", L25_39, attribute.authType) == "ntdomain" then
        return _UPVALUE1_.NTDOMAIN_SERVER_SSLPORTAL_CONF
      end
    end
  end
  L21_35 = _UPVALUE2_
  L21_35 = L21_35.start
  L21_35()
  L21_35 = _UPVALUE3_
  L21_35 = L21_35.serverSet
  L25_39 = L4_18
  L21_35 = L21_35(L22_36, L23_37, L24_38, L25_39, L5_19, L6_20, L7_21, L8_22, L9_23, L10_24, L11_25, L12_26, L13_27, L14_28, L15_29, L16_30, L17_31, L18_32, L19_33)
  cookie = L22_36
  L20_34 = L21_35
  L21_35 = _UPVALUE0_
  L21_35 = L21_35.SUCCESS
  if L20_34 ~= L21_35 then
    L21_35 = util
    L21_35 = L21_35.appendDebugOut
    L21_35(L22_36)
    L21_35 = _UPVALUE2_
    L21_35 = L21_35.abort
    L21_35()
    L21_35 = L20_34
    return L21_35, L22_36
  end
  L21_35 = _UPVALUE2_
  L21_35 = L21_35.complete
  L21_35()
  L21_35 = _UPVALUE2_
  L21_35 = L21_35.save
  L21_35()
  L21_35 = _UPVALUE0_
  L21_35 = L21_35.SUCCESS
  return L21_35, L22_36
end
function ntdomainServerDelete(A0_40)
  local L1_41, L2_42
  L1_41 = A0_40["ntDomain.cookie"]
  if L1_41 == nil then
    L2_42 = util
    L2_42 = L2_42.appendDebugOut
    L2_42("GetNext : Invalid Cookie")
    L2_42 = _UPVALUE0_
    L2_42 = L2_42.BAD_PARAMETER
    return L2_42
  end
  L2_42 = _UPVALUE0_
  L2_42 = L2_42.NOT_SUPPORTED
  return L2_42, L1_41
end
function ntdomainCreate(A0_43)
  local L1_44, L2_45
  L1_44 = A0_43["ntDomain.cookie"]
  if L1_44 == nil then
    L2_45 = util
    L2_45 = L2_45.appendDebugOut
    L2_45("GetNext : Invalid Cookie")
    L2_45 = _UPVALUE0_
    L2_45 = L2_45.BAD_PARAMETER
    return L2_45
  end
  L2_45 = _UPVALUE0_
  L2_45 = L2_45.NOT_SUPPORTED
  return L2_45, L1_44
end
function ntdomainServerDefaultsGet()
  local L0_46, L1_47, L2_48, L3_49
  L0_46 = _UPVALUE0_
  L0_46 = L0_46.SUCCESS
  L1_47 = {}
  L2_48 = FIRST_COOKIE
  L1_47["ntDomain.cookie"] = L2_48
  L2_48 = DEFAULT
  L1_47["ntDomain.profile"] = L2_48
  L2_48 = SERVER1
  L1_47["ntDomain.primaryServer"] = L2_48
  L2_48 = SERVER2
  L1_47["ntDomain.secondaryServer"] = L2_48
  L2_48 = SERVER3
  L1_47["ntDomain.tertiaryServer"] = L2_48
  L2_48 = DOMAIN1
  L1_47["ntDomain.primaryDomain"] = L2_48
  L2_48 = DOMAIN2
  L1_47["ntDomain.secondaryDomain"] = L2_48
  L2_48 = DOMAIN3
  L1_47["ntDomain.tertiaryDomain"] = L2_48
  L2_48 = TIMEOUT
  L1_47["ntDomain.timeout"] = L2_48
  L2_48 = RETRIES
  L1_47["ntDomain.maxRetries"] = L2_48
  L2_48 = L0_46
  L3_49 = L1_47
  return L2_48, L3_49
end
function getServerStatus(A0_50)
  local L1_51, L2_52
  L1_51 = _UPVALUE0_
  L1_51 = L1_51.getCheckNow
  L2_52 = A0_50
  L2_52 = L1_51(L2_52)
  if L1_51 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  return L1_51, L2_52
end
function serverStatusSet(A0_53, A1_54)
  local L2_55, L3_56
  L2_55 = _UPVALUE0_
  L2_55 = L2_55.serverCheckConfig
  L3_56 = A0_53
  L3_56 = L2_55(L3_56, A1_54)
  if L2_55 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  return L2_55, L3_56
end
