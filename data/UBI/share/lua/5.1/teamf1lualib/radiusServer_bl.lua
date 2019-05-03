local L0_0
L0_0 = module
L0_0("com.teamf1.bl.authentication.radius", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/authentication_radius")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/auth_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
DEFAULT = "Default"
NIL = nil
FIRST_COOKIE = 1
sslVpnExAuthTable = "USERDBDomains"
attribute = {}
attribute.authType = "AuthenticationType"
function radiusServerGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21
  L20_21 = _UPVALUE0_
  L20_21 = L20_21.serverGet
  L2_3, L1_2, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, L20_21()
  L0_1 = L20_21
  L20_21 = _UPVALUE1_
  L20_21 = L20_21.SUCCESS
  if L0_1 ~= L20_21 then
    return L0_1
  end
  L20_21 = {}
  L20_21["radiusServer.cookie"] = L2_3
  L20_21["radiusServer.profile"] = L1_2
  L20_21["radiusServer.primaryServer"] = L3_4
  L20_21["radiusServer.primaryPort"] = L4_5
  L20_21["radiusServer.primarySecret"] = L5_6
  L20_21["radiusServer.primaryTimeout"] = L6_7
  L20_21["radiusServer.primaryMaxRetries"] = L7_8
  L20_21["radiusServer.secondaryServer"] = L8_9
  L20_21["radiusServer.secondaryPort"] = L9_10
  L20_21["radiusServer.secondarySecret"] = L10_11
  L20_21["radiusServer.secondaryTimeout"] = L11_12
  L20_21["radiusServer.secondaryMaxRetries"] = L12_13
  L20_21["radiusServer.tertiaryServer"] = L13_14
  L20_21["radiusServer.tertiaryPort"] = L14_15
  L20_21["radiusServer.tertiarySecret"] = L15_16
  L20_21["radiusServer.tertiaryTimeout"] = L16_17
  L20_21["radiusServer.tertiaryMaxRetries"] = L17_18
  L20_21["radiusServer.nasIface"] = L18_19
  return L0_1, L20_21, L19_20
end
function radiusAccServerGet()
  local L0_22, L1_23, L2_24, L3_25, L4_26, L5_27, L6_28, L7_29, L8_30, L9_31, L10_32, L11_33, L12_34
  L12_34 = _UPVALUE0_
  L12_34 = L12_34.accServerGet
  L2_24, L1_23, L3_25, L4_26, L5_27, L6_28, L7_29, L8_30, L9_31, L10_32, tertiaryAccSecret, L12_34 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, L12_34()
  L0_22 = L12_34
  L12_34 = _UPVALUE1_
  L12_34 = L12_34.SUCCESS
  if L0_22 ~= L12_34 then
    return L0_22
  end
  L12_34 = {}
  L12_34["radiusAccServer.cookie"] = L2_24
  L12_34["radiusAccServer.profile"] = L1_23
  L12_34["radiusAccServer.primaryAccServer"] = L3_25
  L12_34["radiusAccServer.primaryAccPort"] = L4_26
  L12_34["radiusAccServer.primaryAccSecret"] = L5_27
  L12_34["radiusAccServer.secondaryAccServer"] = L6_28
  L12_34["radiusAccServer.secondaryAccPort"] = L7_29
  L12_34["radiusAccServer.secondaryAccSecret"] = L8_30
  L12_34["radiusAccServer.tertiaryAccServer"] = L9_31
  L12_34["radiusAccServer.tertiaryAccPort"] = L10_32
  L12_34["radiusAccServer.tertiaryAccSecret"] = tertiaryAccSecret
  return L0_22, L12_34
end
function radiusServerGetNext(A0_35)
  if A0_35["ldapServer.cookie"] == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  return _UPVALUE0_.NOT_SUPPORTED
end
function radiusServerSet(A0_36)
  local L1_37, L2_38, L3_39, L4_40, L5_41, L6_42, L7_43, L8_44, L9_45, L10_46, L11_47, L12_48, L13_49, L14_50, L15_51, L16_52, L17_53, L18_54, L19_55, L20_56, L21_57, L22_58, L23_59
  L1_37 = FIRST_COOKIE
  L2_38 = DEFAULT
  L3_39 = A0_36["radiusServer.primaryServer"]
  L4_40 = A0_36["radiusServer.primaryPort"]
  L5_41 = A0_36["radiusServer.primarySecret"]
  L6_42 = A0_36["radiusServer.primaryTimeout"]
  L7_43 = A0_36["radiusServer.primaryMaxRetries"]
  L8_44 = A0_36["radiusServer.secondaryServer"]
  L9_45 = A0_36["radiusServer.secondaryPort"]
  L10_46 = A0_36["radiusServer.secondarySecret"]
  L11_47 = A0_36["radiusServer.secondaryTimeout"]
  L12_48 = A0_36["radiusServer.secondaryMaxRetries"]
  L13_49 = A0_36["radiusServer.tertiaryServer"]
  L14_50 = A0_36["radiusServer.tertiaryPort"]
  L15_51 = A0_36["radiusServer.tertiarySecret"]
  L16_52 = A0_36["radiusServer.tertiaryTimeout"]
  L17_53 = A0_36["radiusServer.tertiaryMaxRetries"]
  L18_54 = A0_36["radiusServer.nasIface"]
  if L1_37 == nil then
    L19_55 = util
    L19_55 = L19_55.appendDebugOut
    L19_55(L20_56)
    L19_55 = _UPVALUE0_
    L19_55 = L19_55.BAD_PARAMETER
    return L19_55
  end
  L19_55 = HIGH_SEC
  if L19_55 == "HIGH" then
    L19_55 = db
    L19_55 = L19_55.getTable
    L19_55 = L19_55(L20_56)
    for L23_59, _FORV_24_ in L20_56(L21_57) do
      if db.getAttribute(sslVpnExAuthTable, "_ROWID_", L23_59, attribute.authType) == "radius_pap" or db.getAttribute(sslVpnExAuthTable, "_ROWID_", L23_59, attribute.authType) == "radius_chap" or db.getAttribute(sslVpnExAuthTable, "_ROWID_", L23_59, attribute.authType) == "radius_mschap" or db.getAttribute(sslVpnExAuthTable, "_ROWID_", L23_59, attribute.authType) == "radius_mschapv2" then
        return _UPVALUE1_.RADIUS_SERVER_SSLPORTAL_CONF
      end
    end
  end
  L19_55 = nil
  if L20_56 ~= 0 then
    L20_56(L21_57)
    return L20_56
  end
  L20_56()
  L23_59 = L3_39
  cookie = L21_57
  L19_55 = L20_56
  if L19_55 ~= L20_56 then
    L20_56(L21_57)
    L20_56()
    return L20_56, L21_57
  end
  L20_56()
  L20_56()
  return L20_56, L21_57
end
function radiusAccServerSet(A0_60)
  local L1_61, L2_62, L3_63, L4_64, L5_65, L6_66, L7_67, L8_68, L9_69, L10_70, L11_71, L12_72
  L1_61 = FIRST_COOKIE
  L2_62 = DEFAULT
  L3_63 = A0_60["radiusAccServer.primaryAccServer"]
  L4_64 = A0_60["radiusAccServer.primaryAccPort"]
  L5_65 = A0_60["radiusAccServer.primaryAccSecret"]
  L6_66 = A0_60["radiusAccServer.secondaryAccServer"]
  L7_67 = A0_60["radiusAccServer.secondaryAccPort"]
  L8_68 = A0_60["radiusAccServer.secondaryAccSecret"]
  L9_69 = A0_60["radiusAccServer.tertiaryAccServer"]
  L10_70 = A0_60["radiusAccServer.tertiaryAccPort"]
  L11_71 = A0_60["radiusAccServer.tertiaryAccSecret"]
  if L1_61 == nil then
    L12_72 = util
    L12_72 = L12_72.appendDebugOut
    L12_72("Set : Invalid Cookie")
    L12_72 = _UPVALUE0_
    L12_72 = L12_72.BAD_PARAMETER
    return L12_72
  end
  L12_72 = nil
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page radiusAccServer")
    return _UPVALUE0_.UNAUTHORIZED
  end
  _UPVALUE1_.start()
  L12_72, cookie = _UPVALUE2_.accServerSet(L1_61, L2_62, L3_63, L4_64, L5_65, L6_66, L7_67, L8_68, L9_69, L10_70, L11_71)
  if L12_72 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page Radius Accounting Server " .. L12_72)
    _UPVALUE1_.abort()
    return L12_72, L1_61
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function radiusServerDelete(A0_73)
  local L1_74, L2_75, L3_76
  L1_74 = _UPVALUE0_
  L1_74 = L1_74.NOT_SUPPORTED
  L2_75 = L1_74
  L3_76 = A0_73
  return L2_75, L3_76
end
function getServerStatus(A0_77)
  local L1_78, L2_79
  L1_78 = _UPVALUE0_
  L1_78 = L1_78.getCheckNow
  L2_79 = A0_77
  L2_79 = L1_78(L2_79)
  if L1_78 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  return L1_78, L2_79
end
function serverStatusSet(A0_80, A1_81)
  local L2_82, L3_83
  L2_82 = _UPVALUE0_
  L2_82 = L2_82.serverCheckConfig
  L3_83 = A0_80
  L3_83 = L2_82(L3_83, A1_81)
  if L2_82 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.FAILURE
  end
  return L2_82, L3_83
end
