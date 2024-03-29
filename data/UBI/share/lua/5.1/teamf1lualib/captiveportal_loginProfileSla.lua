local L0_0
L0_0 = module
L0_0("com.teamf1.core.captiveportal.loginprofileSla", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/captiveportal_validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/captivePortal_returnCodes")
L0_0 = require
L0_0("teamf1lualib/system_productData")
L0_0 = require
L0_0("captivePortalLib")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
loginprofileSlaTable = "slaProfile"
attribute = {}
attribute.slaProfileName = "slaProfileName"
attribute.textMessage = "textMessage"
attribute.browserTitile = "browserTitle"
captivePortalSsidTable = "CaptivePortalSSID"
captivePortalVlanTable = "captiveportalvlan"
attribute.accessType = "accessType"
attribute.profileId = "profileId"
attribute.vlanId = "vlanId"
attribute.ssid = "ssid"
SLA_ACCESS_TYPE_VALE = "1"
SLA_STATUS = "slaProfile.status"
ENABLE = "1"
DISABLE = "0"
ROWID = "_ROWID_"
FALSE = false
NIL = nil
MAX_INDEX = 6
MIN_INDEX = 1
MAXLEN_PROFILE = 32
MINLEN_PROFILE = 1
MAX_LOGIN_PROFILE = 10
function loginProfileSlaRowGet(A0_1)
  if db.getRow(loginprofileSlaTable, ROWID, A0_1) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_1, db.getRow(loginprofileSlaTable, ROWID, A0_1)[loginprofileSlaTable .. "." .. attribute.slaProfileName], db.getRow(loginprofileSlaTable, ROWID, A0_1)[loginprofileSlaTable .. "." .. attribute.textMessage], db.getRow(loginprofileSlaTable, ROWID, A0_1)[loginprofileSlaTable .. "." .. attribute.browserTitile]
end
function loginProfileSlaSet(A0_2, A1_3, A2_4, A3_5)
  local L4_6, L5_7
  L4_6 = NIL
  if A1_3 == L4_6 or A1_3 == "" then
    L4_6 = _UPVALUE0_
    L4_6 = L4_6.LOGIN_PROFILE_NAME_NIL
    return L4_6
  end
  L4_6 = string
  L4_6 = L4_6.len
  L5_7 = A1_3
  L4_6 = L4_6(L5_7)
  L5_7 = MAXLEN_PROFILE
  if not (L4_6 > L5_7) then
    L5_7 = MINLEN_PROFILE
  elseif L4_6 < L5_7 then
    L5_7 = _UPVALUE0_
    L5_7 = L5_7.LOGIN_PROFILE_NAME_INVALID
    return L5_7
  end
  L5_7 = {}
  L5_7[loginprofileSlaTable .. "." .. attribute.slaProfileName] = A1_3
  L5_7[loginprofileSlaTable .. "." .. attribute.textMessage] = A2_4
  L5_7[loginprofileSlaTable .. "." .. attribute.browserTitile] = A3_5
  if db.update(loginprofileSlaTable, L5_7, A0_2) == NIL then
    return _UPVALUE1_.FAILURE, A0_2
  end
  return _UPVALUE1_.SUCCESS, A0_2
end
function loginProfileSlaCreate(A0_8, A1_9, A2_10)
  local L3_11, L4_12, L5_13
  L3_11 = db
  L3_11 = L3_11.existsRow
  L4_12 = loginprofileSlaTable
  L5_13 = attribute
  L5_13 = L5_13.slaProfileName
  L3_11 = L3_11(L4_12, L5_13, A0_8)
  if L3_11 then
    L4_12 = _UPVALUE0_
    L4_12 = L4_12.LOGIN_PROFILES_NAME_EXISTS
    return L4_12
  end
  L4_12 = NIL
  if A0_8 == L4_12 or A0_8 == "" then
    L4_12 = _UPVALUE0_
    L4_12 = L4_12.LOGIN_PROFILE_NAME_NIL
    return L4_12
  end
  L4_12 = string
  L4_12 = L4_12.len
  L5_13 = A0_8
  L4_12 = L4_12(L5_13)
  L5_13 = MAXLEN_PROFILE
  if not (L4_12 > L5_13) then
    L5_13 = MINLEN_PROFILE
  elseif L4_12 < L5_13 then
    L5_13 = _UPVALUE0_
    L5_13 = L5_13.LOGIN_PROFILE_NAME_INVALID
    return L5_13
  end
  L5_13 = {}
  L5_13[loginprofileSlaTable .. "." .. attribute.slaProfileName] = A0_8
  L5_13[loginprofileSlaTable .. "." .. attribute.textMessage] = A1_9
  L5_13[loginprofileSlaTable .. "." .. attribute.browserTitile] = A2_10
  if db.insert(loginprofileSlaTable, L5_13) == NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, cookie
end
function loginProfileSlaDelete(A0_14)
  local L1_15, L2_16, L3_17, L4_18
  L1_15 = NIL
  if A0_14 == L1_15 then
    L1_15 = _UPVALUE0_
    L1_15 = L1_15.INVALID_ARGUMENT
    return L1_15
  end
  L1_15 = cookieValidate
  L2_16 = ROWID
  L3_17 = A0_14
  L2_16 = L1_15(L2_16, L3_17, L4_18)
  L3_17 = _UPVALUE0_
  L3_17 = L3_17.SUCCESS
  if L1_15 ~= L3_17 then
    return L1_15
  end
  L3_17 = _UPVALUE1_
  if L2_16 == L3_17 then
    L3_17 = _UPVALUE2_
    L3_17 = L3_17.LOGIN_PROFILE_DEFAULT_GROUP_DEL_ERROR
    return L3_17
  end
  L3_17 = attribute
  L3_17 = L3_17.accessType
  L3_17 = L3_17 .. L4_18 .. SLA_ACCESS_TYPE_VALE .. "'"
  where = L3_17
  L3_17 = db
  L3_17 = L3_17.getRowsWhere
  L3_17 = L3_17(L4_18, where)
  if L3_17 ~= L4_18 then
    for _FORV_7_, _FORV_8_ in L4_18(L3_17) do
      if _FORV_8_[captivePortalVlanTable .. "." .. attribute.profileId] == L2_16 then
        return _UPVALUE2_.LOGIN_PROFILE_USED_GROUP_DEL_ERROR
      end
    end
  end
  if L4_18 ~= _UPVALUE0_.NIL then
    for _FORV_8_, _FORV_9_ in pairs(L4_18) do
      if _FORV_9_[captivePortalSsidTable .. "." .. attribute.profileId] == L2_16 then
        return _UPVALUE2_.LOGIN_PROFILE_USED_GROUP_DEL_ERROR
      end
    end
  end
  if db.deleteRow(loginprofileSlaTable, ROWID, L2_16) == NIL then
    return _UPVALUE0_.FAILURE, L2_16
  end
  return _UPVALUE0_.SUCCESS, L2_16
end
function loginProfileSlaDeleteAll()
  local L0_19, L1_20
  L0_19 = attribute
  L0_19 = L0_19.accessType
  L0_19 = L0_19 .. L1_20 .. SLA_ACCESS_TYPE_VALE .. "'"
  where = L0_19
  L0_19 = db
  L0_19 = L0_19.getRowsWhere
  L0_19 = L0_19(L1_20, where)
  if L0_19 ~= L1_20 then
    for _FORV_4_, _FORV_5_ in L1_20(L0_19) do
      if _FORV_5_[captivePortalVlanTable .. "." .. attribute.profileId] ~= _UPVALUE1_ then
        return _UPVALUE2_.LOGIN_PROFILE_USED_GROUP_DEL_ERROR
      end
    end
  end
  if L1_20 ~= _UPVALUE0_.NIL then
    for _FORV_5_, _FORV_6_ in pairs(L1_20) do
      if _FORV_6_[captivePortalSsidTable .. "." .. attribute.profileId] ~= _UPVALUE1_ then
        return _UPVALUE2_.LOGIN_PROFILE_USED_GROUP_DEL_ERROR
      end
    end
  end
  where = ROWID .. "!='" .. _UPVALUE1_ .. "'"
  if db.deleteRowWhere(loginprofileSlaTable, where) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function loginProfilesSlaGetAll()
  local L0_21, L1_22, L2_23, L3_24, L4_25, L5_26, L6_27, L7_28
  L0_21 = db
  L0_21 = L0_21.getTable
  L0_21 = L0_21(L1_22)
  for L4_25, L5_26 in L1_22(L2_23) do
    L6_27 = attribute
    L6_27 = L6_27.accessType
    L6_27 = L6_27 .. L7_28 .. SLA_ACCESS_TYPE_VALE .. "' and " .. attribute.profileId .. "='" .. L5_26[loginprofileSlaTable .. "." .. ROWID] .. "'"
    where = L6_27
    L6_27 = SLA_STATUS
    L5_26[L6_27] = ""
    L6_27 = db
    L6_27 = L6_27.getRowsWhere
    L6_27 = L6_27(L7_28, where)
    if L6_27 ~= nil then
      for _FORV_10_, _FORV_11_ in L7_28(L6_27) do
        if _FORV_11_[captivePortalVlanTable .. "." .. attribute.vlanId] ~= NIL then
          if L5_26[SLA_STATUS] == "" then
            L5_26[SLA_STATUS] = "LAN" .. _FORV_11_[captivePortalVlanTable .. "." .. attribute.vlanId]
          else
            L5_26[SLA_STATUS] = L5_26[SLA_STATUS] .. ",LAN" .. _FORV_11_[captivePortalVlanTable .. "." .. attribute.vlanId]
          end
        end
      end
    end
    if L7_28 ~= nil then
      for _FORV_11_, _FORV_12_ in pairs(L7_28) do
        if _FORV_12_[captivePortalSsidTable .. "." .. attribute.ssid] ~= NIL then
          if L5_26[SLA_STATUS] == "" then
            L5_26[SLA_STATUS] = _FORV_12_[captivePortalSsidTable .. "." .. attribute.ssid]
          else
            L5_26[SLA_STATUS] = L5_26[SLA_STATUS] .. "," .. _FORV_12_[captivePortalSsidTable .. "." .. attribute.ssid]
          end
        end
      end
    end
  end
  if L0_21 == L1_22 then
    return L1_22
  end
  return L1_22, L2_23
end
