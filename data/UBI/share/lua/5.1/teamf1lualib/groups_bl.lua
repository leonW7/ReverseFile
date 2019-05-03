local L0_0
L0_0 = module
L0_0("com.teamf1.bl.userdb.groups", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/groups_ul")
L0_0 = require
L0_0("teamf1lualib/user-management_groups")
L0_0 = require
L0_0("teamf1lualib/user-management_browserPolicies")
L0_0 = require
L0_0("teamf1lualib/user-management_networkPolicies")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/userdb_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.userdb_returnCodes")
FALSE = false
NIL = nil
IE = "MSIE"
OPERA = "Opera"
CHROME = "Chrome"
FIREFOX = "Firefox"
SAFARI = "Safari"
function groupsGet()
  local L0_1, L1_2, L2_3, L3_4
  L0_1, L3_4, L1_2, L2_3 = _UPVALUE0_.groupGet()
  if L0_1 ~= SUCCESS then
    return L0_1
  end
  return L0_1, L3_4, L1_2, L2_3
end
function groupsGetNext(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10
  L1_6 = A0_5["groups.cookie"]
  if L1_6 == nil then
    L2_7 = util
    L2_7 = L2_7.appendDebugOut
    L3_8 = "GetNext : Invalid Cookie"
    L2_7(L3_8)
    L2_7 = _UPVALUE0_
    L2_7 = L2_7.BAD_PARAMETER
    return L2_7
  end
  L2_7, L3_8, L4_9, L5_10 = nil, nil, nil, nil
  L2_7, L5_10, L3_8, L4_9 = _UPVALUE1_.groupGetNext(L1_6)
  if L2_7 ~= SUCCESS then
    return L2_7
  end
  return L2_7, L5_10, L3_8, L4_9
end
function groupsSet(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18
  L1_12 = ACCESS_LEVEL
  if L1_12 ~= 0 then
    L1_12 = util
    L1_12 = L1_12.appendDebugOut
    L2_13 = "Detected Unauthorized access for page Groups Page"
    L1_12(L2_13)
    L1_12 = _UPVALUE0_
    L1_12 = L1_12.UNAUTHORIZED
    return L1_12
  end
  L1_12 = nil
  L2_13 = A0_11["groupTable.userType"]
  L3_14 = _UPVALUE1_
  if L2_13 == L3_14 then
    L1_12 = _UPVALUE2_
  else
    L2_13 = A0_11["groupTable.userType"]
    L3_14 = _UPVALUE3_
    if L2_13 == L3_14 then
      L1_12 = _UPVALUE4_
    else
      L2_13 = A0_11["groupTable.userType"]
      L3_14 = _UPVALUE5_
      if L2_13 == L3_14 then
        L1_12 = _UPVALUE6_
      end
    end
  end
  L2_13 = A0_11["groupTable.pptp"]
  L3_14 = _UPVALUE7_
  if L2_13 == L3_14 then
    L2_13 = A0_11["groupTable.l2tp"]
    L3_14 = _UPVALUE7_
    if L2_13 == L3_14 then
      L2_13 = _UPVALUE0_
      L2_13 = L2_13.BAD_PARAMETER
      return L2_13
    end
  end
  L2_13 = A0_11["groupTable.userType"]
  L3_14 = _UPVALUE1_
  if L2_13 == L3_14 then
    L2_13 = A0_11["groupTable.xauth"]
    L3_14 = _UPVALUE7_
    if L2_13 == L3_14 then
      L2_13 = _UPVALUE0_
      L2_13 = L2_13.BAD_PARAMETER
      return L2_13
    end
  end
  L2_13 = A0_11["groupTable.pptp"]
  L3_14 = _UPVALUE7_
  if L2_13 == L3_14 then
    L2_13 = _UPVALUE0_
    L2_13 = L2_13.NIL
    if L1_12 == L2_13 then
      L1_12 = _UPVALUE8_
    else
      L2_13 = L1_12
      L3_14 = ","
      L4_15 = _UPVALUE8_
      L1_12 = L2_13 .. L3_14 .. L4_15
    end
  end
  L2_13 = A0_11["groupTable.l2tp"]
  L3_14 = _UPVALUE7_
  if L2_13 == L3_14 then
    L2_13 = _UPVALUE0_
    L2_13 = L2_13.NIL
    if L1_12 == L2_13 then
      L1_12 = _UPVALUE9_
    else
      L2_13 = L1_12
      L3_14 = ","
      L4_15 = _UPVALUE9_
      L1_12 = L2_13 .. L3_14 .. L4_15
    end
  end
  L2_13 = A0_11["groupTable.xauth"]
  L3_14 = _UPVALUE7_
  if L2_13 == L3_14 then
    L2_13 = _UPVALUE0_
    L2_13 = L2_13.NIL
    if L1_12 == L2_13 then
      L1_12 = _UPVALUE10_
    else
      L2_13 = L1_12
      L3_14 = ","
      L4_15 = _UPVALUE10_
      L1_12 = L2_13 .. L3_14 .. L4_15
    end
  end
  L2_13 = A0_11["groupTable.openVpn"]
  L3_14 = _UPVALUE7_
  if L2_13 == L3_14 then
    L2_13 = _UPVALUE0_
    L2_13 = L2_13.NIL
    if L1_12 == L2_13 then
      L1_12 = _UPVALUE11_
    else
      L2_13 = L1_12
      L3_14 = ","
      L4_15 = _UPVALUE11_
      L1_12 = L2_13 .. L3_14 .. L4_15
    end
  end
  L2_13 = A0_11["groupTable.sslvpn"]
  L3_14 = _UPVALUE7_
  if L2_13 == L3_14 then
    L2_13 = _UPVALUE0_
    L2_13 = L2_13.NIL
    if L1_12 == L2_13 then
      L1_12 = _UPVALUE12_
    else
      L2_13 = _UPVALUE12_
      L3_14 = ","
      L4_15 = L1_12
      L1_12 = L2_13 .. L3_14 .. L4_15
    end
  end
  L2_13 = A0_11["groupTable.captivePortal"]
  L3_14 = _UPVALUE7_
  if L2_13 == L3_14 then
    L2_13 = _UPVALUE0_
    L2_13 = L2_13.NIL
    if L1_12 == L2_13 then
      L1_12 = _UPVALUE13_
    else
      L2_13 = L1_12
      L3_14 = ","
      L4_15 = _UPVALUE13_
      L1_12 = L2_13 .. L3_14 .. L4_15
    end
  end
  L2_13 = A0_11["groupTable.sslvpn"]
  L3_14 = _UPVALUE7_
  if L2_13 == L3_14 then
    L2_13 = A0_11["groupTable.sslAuthType"]
    if L2_13 ~= nil then
      L2_13 = A0_11["groupTable.portalName"]
    else
      if L2_13 == nil then
        L2_13 = "local"
        sslAuthType = L2_13
        L2_13 = "None"
        sslPortal = L2_13
    end
    else
      L2_13 = A0_11["groupTable.sslAuthType"]
      sslAuthType = L2_13
      L2_13 = A0_11["groupTable.portalName"]
      sslPortal = L2_13
    end
  else
    L2_13 = nil
    sslAuthType = L2_13
  end
  L2_13 = A0_11["groupTable.cookie"]
  L3_14 = A0_11["groupTable.name"]
  L4_15 = A0_11["groupTable.description"]
  L5_16 = A0_11["groupTable.timeOut"]
  if L2_13 == nil then
    L6_17 = util
    L6_17 = L6_17.appendDebugOut
    L7_18 = "Set : Invalid Cookie"
    L6_17(L7_18)
    L6_17 = _UPVALUE0_
    L6_17 = L6_17.BAD_PARAMETER
    return L6_17
  end
  if L3_14 == nil then
    L6_17 = util
    L6_17 = L6_17.appendDebugOut
    L7_18 = "GetNext : Invalid Cookie"
    L6_17(L7_18)
    L6_17 = _UPVALUE0_
    L6_17 = L6_17.BAD_PARAMETER
    return L6_17
  end
  L6_17, L7_18 = nil, nil
  _UPVALUE14_.start()
  L6_17, L7_18 = _UPVALUE15_.groupSet(L2_13, L3_14, L4_15, L1_12, L5_16, sslAuthType)
  if L6_17 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page Groups " .. L6_17)
    _UPVALUE14_.abort()
    return L6_17, L2_13
  end
  if sslAuthType ~= nil and db.existsRow("USERDBDomains", "GroupId", L7_18) == false then
    L6_17, L7_18 = _UPVALUE15_.sslVpnPolicyCreate(L3_14, sslAuthType, sslPortal)
    if L6_17 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in configuring values in page Groups " .. L6_17)
      _UPVALUE14_.abort()
      return L6_17, 0
    end
  end
  _UPVALUE14_.complete()
  _UPVALUE14_.save()
  return _UPVALUE0_.SUCCESS, L7_18
end
function groupProfileDeleteRow(A0_19)
  local L1_20, L2_21
  L1_20 = ACCESS_LEVEL
  if L1_20 ~= 0 then
    L1_20 = util
    L1_20 = L1_20.appendDebugOut
    L2_21 = "Detected Unauthorized access for page Groups Page"
    L1_20(L2_21)
    L1_20 = _UPVALUE0_
    L1_20 = L1_20.UNAUTHORIZED
    return L1_20
  end
  L1_20 = A0_19["groupTable.cookie"]
  if L1_20 == nil then
    L2_21 = util
    L2_21 = L2_21.appendDebugOut
    L2_21("Delete : Invalid Cookie")
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.BAD_PARAMETER
    return L2_21
  end
  L2_21 = nil
  _UPVALUE1_.start()
  L2_21, cookie = _UPVALUE2_.ul_groupDelete(L1_20)
  if L2_21 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page Groups " .. L2_21)
    _UPVALUE1_.abort()
    return L2_21, L1_20
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function groupsDefaultsGet()
  local L1_22
  L1_22 = _UPVALUE0_
  L1_22 = L1_22.NOT_SUPPORTED
  return L1_22
end
function groupsCreate(A0_23)
  local L1_24, L2_25, L3_26, L4_27, L5_28, L6_29
  L1_24 = ACCESS_LEVEL
  if L1_24 ~= 0 then
    L1_24 = util
    L1_24 = L1_24.appendDebugOut
    L2_25 = "Detected Unauthorized access for page Groups Page"
    L1_24(L2_25)
    L1_24 = _UPVALUE0_
    L1_24 = L1_24.UNAUTHORIZED
    return L1_24
  end
  L1_24 = nil
  L2_25 = A0_23["groupTable.userType"]
  L3_26 = _UPVALUE1_
  if L2_25 == L3_26 then
    L1_24 = _UPVALUE2_
  else
    L2_25 = A0_23["groupTable.userType"]
    L3_26 = _UPVALUE3_
    if L2_25 == L3_26 then
      L1_24 = _UPVALUE4_
    else
      L2_25 = A0_23["groupTable.userType"]
      L3_26 = _UPVALUE5_
      if L2_25 == L3_26 then
        L1_24 = _UPVALUE6_
      end
    end
  end
  L2_25 = A0_23["groupTable.pptp"]
  L3_26 = _UPVALUE7_
  if L2_25 == L3_26 then
    L2_25 = A0_23["groupTable.l2tp"]
    L3_26 = _UPVALUE7_
    if L2_25 == L3_26 then
      L2_25 = _UPVALUE0_
      L2_25 = L2_25.BAD_PARAMETER
      return L2_25
    end
  end
  L2_25 = A0_23["groupTable.userType"]
  L3_26 = _UPVALUE1_
  if L2_25 == L3_26 then
    L2_25 = A0_23["groupTable.xauth"]
    L3_26 = _UPVALUE7_
    if L2_25 == L3_26 then
      L2_25 = _UPVALUE0_
      L2_25 = L2_25.BAD_PARAMETER
      return L2_25
    end
  end
  L2_25 = A0_23["groupTable.pptp"]
  L3_26 = _UPVALUE7_
  if L2_25 == L3_26 then
    L2_25 = _UPVALUE0_
    L2_25 = L2_25.NIL
    if L1_24 == L2_25 then
      L1_24 = _UPVALUE8_
    else
      L2_25 = L1_24
      L3_26 = ","
      L4_27 = _UPVALUE8_
      L1_24 = L2_25 .. L3_26 .. L4_27
    end
  end
  L2_25 = A0_23["groupTable.l2tp"]
  L3_26 = _UPVALUE7_
  if L2_25 == L3_26 then
    L2_25 = _UPVALUE0_
    L2_25 = L2_25.NIL
    if L1_24 == L2_25 then
      L1_24 = _UPVALUE9_
    else
      L2_25 = L1_24
      L3_26 = ","
      L4_27 = _UPVALUE9_
      L1_24 = L2_25 .. L3_26 .. L4_27
    end
  end
  L2_25 = A0_23["groupTable.xauth"]
  L3_26 = _UPVALUE7_
  if L2_25 == L3_26 then
    L2_25 = _UPVALUE0_
    L2_25 = L2_25.NIL
    if L1_24 == L2_25 then
      L1_24 = _UPVALUE10_
    else
      L2_25 = L1_24
      L3_26 = ","
      L4_27 = _UPVALUE10_
      L1_24 = L2_25 .. L3_26 .. L4_27
    end
  end
  L2_25 = A0_23["groupTable.openVpn"]
  L3_26 = _UPVALUE7_
  if L2_25 == L3_26 then
    L2_25 = _UPVALUE0_
    L2_25 = L2_25.NIL
    if L1_24 == L2_25 then
      L1_24 = _UPVALUE11_
    else
      L2_25 = L1_24
      L3_26 = ","
      L4_27 = _UPVALUE11_
      L1_24 = L2_25 .. L3_26 .. L4_27
    end
  end
  L2_25 = A0_23["groupTable.sslvpn"]
  L3_26 = _UPVALUE7_
  if L2_25 == L3_26 then
    L2_25 = _UPVALUE0_
    L2_25 = L2_25.NIL
    if L1_24 == L2_25 then
      L1_24 = _UPVALUE12_
    else
      L2_25 = _UPVALUE12_
      L3_26 = ","
      L4_27 = L1_24
      L1_24 = L2_25 .. L3_26 .. L4_27
    end
  end
  L2_25 = A0_23["groupTable.captivePortal"]
  L3_26 = _UPVALUE7_
  if L2_25 == L3_26 then
    L2_25 = _UPVALUE0_
    L2_25 = L2_25.NIL
    if L1_24 == L2_25 then
      L1_24 = _UPVALUE13_
    else
      L2_25 = L1_24
      L3_26 = ","
      L4_27 = _UPVALUE13_
      L1_24 = L2_25 .. L3_26 .. L4_27
    end
  end
  L2_25 = _UPVALUE0_
  L2_25 = L2_25.NIL
  if L1_24 == L2_25 then
    L2_25 = _UPVALUE14_
    L2_25 = L2_25.GROUPS_CAPABITITE_INVALID
    return L2_25
  end
  L2_25 = A0_23["groupTable.sslvpn"]
  L3_26 = _UPVALUE7_
  if L2_25 == L3_26 then
    L2_25 = A0_23["groupTable.sslAuthType"]
    if L2_25 ~= nil then
      L2_25 = A0_23["groupTable.portalName"]
    elseif L2_25 == nil then
      L2_25 = "local"
      sslAuthType = L2_25
      L2_25 = "None"
      sslPortal = L2_25
    end
  else
    L2_25 = nil
    sslAuthType = L2_25
  end
  L2_25 = A0_23["groupTable.userType"]
  L3_26 = _UPVALUE3_
  if L2_25 == L3_26 then
    L1_24 = _UPVALUE4_
  else
    L2_25 = A0_23["groupTable.userType"]
    L3_26 = _UPVALUE5_
    if L2_25 == L3_26 then
      L1_24 = _UPVALUE6_
    end
  end
  L2_25 = A0_23["groupTable.name"]
  L3_26 = A0_23["groupTable.description"]
  L4_27 = A0_23["groupTable.timeOut"]
  if L2_25 == nil then
    L5_28 = util
    L5_28 = L5_28.appendDebugOut
    L6_29 = "GetNext : Invalid Cookie"
    L5_28(L6_29)
    L5_28 = _UPVALUE0_
    L5_28 = L5_28.BAD_PARAMETER
    return L5_28
  end
  L5_28, L6_29 = nil, nil
  _UPVALUE15_.start()
  L5_28, L6_29 = _UPVALUE16_.ul_groupCreate(L2_25, L3_26, L1_24, L4_27, sslAuthType)
  if L5_28 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page Groups " .. L5_28)
    _UPVALUE15_.abort()
    return L5_28, 0
  end
  L5_28, L6_29 = _UPVALUE17_.loginPolicyCreate(L2_25, L3_26, NIL, NIL)
  if L5_28 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page Groups " .. L5_28)
    _UPVALUE15_.abort()
    return L5_28, 0
  end
  if sslAuthType ~= nil then
    L5_28, L6_29 = _UPVALUE17_.sslVpnPolicyCreate(L2_25, sslAuthType, sslPortal)
    if L5_28 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in configuring values in page Groups " .. L5_28)
      _UPVALUE15_.abort()
      return L5_28, 0
    end
  end
  _UPVALUE15_.complete()
  _UPVALUE15_.save()
  return _UPVALUE0_.SUCCESS, L6_29
end
function loginPolicyGet()
  local L0_30, L1_31, L2_32, L3_33, L4_34, L5_35
  L0_30, L1_31, L2_32, L3_33, L4_34, L5_35 = _UPVALUE0_.loginPolicyGet()
  if L0_30 ~= SUCCESS then
    return L0_30
  end
  if tonumber(L4_34) == _UPVALUE1_ then
    L4_34 = _UPVALUE2_
  elseif tonumber(L4_34) == _UPVALUE3_ then
    L4_34 = _UPVALUE4_
  end
  if tonumber(L5_35) == _UPVALUE1_ then
    L4_34 = _UPVALUE2_
  elseif tonumber(L5_35) == _UPVALUE3_ then
    L4_34 = _UPVALUE4_
  end
  return L0_30, L1_31, L2_32, L3_33, L4_34, L5_35
end
function loginPolicyGetNext(A0_36)
  local L1_37, L2_38, L3_39, L4_40, L5_41, L6_42, L7_43
  L1_37 = A0_36["groups.cookie"]
  if L1_37 == nil then
    L2_38 = util
    L2_38 = L2_38.appendDebugOut
    L3_39 = "GetNext : Invalid Cookie"
    L2_38(L3_39)
    L2_38 = _UPVALUE0_
    L2_38 = L2_38.BAD_PARAMETER
    return L2_38
  end
  L2_38, L3_39, L4_40, L5_41, L6_42, L7_43 = nil, nil, nil, nil, nil, nil
  L2_38, L7_43, L3_39, L4_40, L5_41, L6_42 = _UPVALUE1_.loginPolicyGetNext(L1_37)
  if L2_38 ~= SUCCESS then
    return L2_38
  end
  if tonumber(L5_41) == _UPVALUE2_ then
    L5_41 = _UPVALUE3_
  elseif tonumber(L5_41) == _UPVALUE4_ then
    L5_41 = _UPVALUE5_
  end
  if tonumber(L6_42) == _UPVALUE2_ then
    L5_41 = _UPVALUE3_
  elseif tonumber(L6_42) == _UPVALUE4_ then
    L5_41 = _UPVALUE5_
  end
  return L2_38, L7_43, L3_39, L4_40, L5_41, L6_42
end
function groupLoginPolicySet(A0_44)
  local L1_45, L2_46, L3_47, L4_48, L5_49, L6_50, L7_51
  L1_45 = ACCESS_LEVEL
  if L1_45 ~= 0 then
    L1_45 = util
    L1_45 = L1_45.appendDebugOut
    L2_46 = "Detected Unauthorized access for page Groups"
    L1_45(L2_46)
    L1_45 = _UPVALUE0_
    L1_45 = L1_45.UNAUTHORIZED
    return L1_45
  end
  L1_45 = A0_44["groupLoginTable.cookie"]
  L2_46 = A0_44["groupLoginTable.groupName"]
  L3_47 = A0_44["groupLoginTable.description"]
  L4_48 = A0_44["groupLoginTable.login"]
  L5_49 = A0_44["groupLoginTable.wanLogin"]
  if L1_45 == nil then
    L6_50 = util
    L6_50 = L6_50.appendDebugOut
    L7_51 = "Set : Invalid Cookie"
    L6_50(L7_51)
    L6_50 = _UPVALUE0_
    L6_50 = L6_50.BAD_PARAMETER
    return L6_50
  end
  if L2_46 == nil then
    L6_50 = util
    L6_50 = L6_50.appendDebugOut
    L7_51 = "GetNext : Invalid Cookie"
    L6_50(L7_51)
    L6_50 = _UPVALUE0_
    L6_50 = L6_50.BAD_PARAMETER
    return L6_50
  end
  L6_50, L7_51 = nil, nil
  _UPVALUE1_.start()
  L6_50, L7_51 = _UPVALUE2_.loginPolicySet(L1_45, L2_46, L3_47, L4_48, L5_49)
  if L6_50 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page Groups " .. L6_50)
    _UPVALUE1_.abort()
    return L6_50, L1_45
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L7_51
end
function loginPolicyDeleteRow(A0_52)
  local L1_53, L2_54
  L1_53 = ACCESS_LEVEL
  if L1_53 ~= 0 then
    L1_53 = util
    L1_53 = L1_53.appendDebugOut
    L2_54 = "Detected Unauthorized access for page Groups Page"
    L1_53(L2_54)
    L1_53 = _UPVALUE0_
    L1_53 = L1_53.UNAUTHORIZED
    return L1_53
  end
  L1_53 = A0_52["groups.cookie"]
  if L1_53 == nil then
    L2_54 = util
    L2_54 = L2_54.appendDebugOut
    L2_54("Delete : Invalid Cookie")
    L2_54 = _UPVALUE0_
    L2_54 = L2_54.BAD_PARAMETER
    return L2_54
  end
  L2_54 = nil
  _UPVALUE1_.start()
  L2_54, cookie = _UPVALUE2_.loginPolicyDelete(L1_53)
  if L2_54 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page Groups " .. L2_54)
    _UPVALUE1_.abort()
    return L2_54, L1_53
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function loginPolicyDefaultsGet()
  local L1_55
  L1_55 = _UPVALUE0_
  L1_55 = L1_55.NOT_SUPPORTED
  return L1_55
end
function browserPolicyGet()
  local L0_56, L1_57, L2_58, L3_59, L4_60, L5_61
  L0_56, L1_57, L2_58, L3_59, L4_60, L5_61 = _UPVALUE0_.browserPolicyGet()
  if L0_56 ~= SUCCESS then
    return L0_56
  end
  if tonumber(L5_61) == _UPVALUE1_ then
    L5_61 = _UPVALUE2_
  elseif tonumber(L5_61) == _UPVALUE3_ then
    L5_61 = _UPVALUE4_
  end
  return L0_56, L1_57, L2_58, L3_59, L4_60, L5_61
end
function browserPolicyGetNext(A0_62)
  local L1_63, L2_64, L3_65, L4_66, L5_67, L6_68, L7_69
  L1_63 = A0_62["groups.cookie"]
  if L1_63 == nil then
    L2_64 = util
    L2_64 = L2_64.appendDebugOut
    L3_65 = "GetNext : Invalid Cookie"
    L2_64(L3_65)
    L2_64 = _UPVALUE0_
    L2_64 = L2_64.BAD_PARAMETER
    return L2_64
  end
  L2_64, L3_65, L4_66, L5_67, L6_68, L7_69 = nil, nil, nil, nil, nil, nil
  L2_64, L7_69, L3_65, L4_66, L5_67, L6_68, L7_69 = _UPVALUE1_.browserPolicyGetNext(L1_63)
  if L2_64 ~= SUCCESS then
    return L2_64
  end
  if tonumber(L6_68) == _UPVALUE2_ then
    L6_68 = _UPVALUE3_
  elseif tonumber(L6_68) == _UPVALUE4_ then
    L6_68 = _UPVALUE5_
  end
  return L2_64, L7_69, L3_65, L4_66, L5_67, L6_68, L7_69
end
function groupBrowserPolicySet(A0_70)
  local L1_71, L2_72, L3_73, L4_74, L5_75, L6_76, L7_77
  L1_71 = ACCESS_LEVEL
  if L1_71 ~= 0 then
    L1_71 = util
    L1_71 = L1_71.appendDebugOut
    L2_72 = "Detected Unauthorized access for page Groups Page"
    L1_71(L2_72)
    L1_71 = _UPVALUE0_
    L1_71 = L1_71.UNAUTHORIZED
    return L1_71
  end
  L1_71 = A0_70["groupBrowserTable.cookie"]
  L2_72 = A0_70["groupBrowserTable.cookie"]
  L3_73 = A0_70["groupBrowserTable.groupName"]
  L4_74 = A0_70["groupBrowserTable.browserName"]
  L5_75 = A0_70["groupBrowserTable.loginFromBrowser"]
  if L1_71 == nil then
    L6_76 = util
    L6_76 = L6_76.appendDebugOut
    L7_77 = "Set : Invalid Cookie"
    L6_76(L7_77)
    L6_76 = _UPVALUE0_
    L6_76 = L6_76.BAD_PARAMETER
    return L6_76
  end
  if L3_73 == nil or L4_74 == nil then
    L6_76 = util
    L6_76 = L6_76.appendDebugOut
    L7_77 = "GetNext : Invalid Cookie"
    L6_76(L7_77)
    L6_76 = _UPVALUE0_
    L6_76 = L6_76.BAD_PARAMETER
    return L6_76
  end
  if L5_75 == "1" then
    L5_75 = _UPVALUE1_
  elseif L5_75 == "2" then
    L5_75 = _UPVALUE2_
  end
  if L4_74 == "1" then
    L4_74 = IE
  elseif L4_74 == "2" then
    L4_74 = OPERA
  elseif L4_74 == "3" then
    L4_74 = CHROME
  elseif L4_74 == "4" then
    L4_74 = FIREFOX
  elseif L4_74 == "5" then
    L4_74 = SAFARI
  end
  L6_76, L7_77 = nil, nil
  _UPVALUE3_.start()
  L6_76, L7_77 = _UPVALUE4_.browserPolicySet(L1_71, L2_72, L3_73, L4_74, L5_75)
  if L6_76 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page Groups " .. L6_76)
    _UPVALUE3_.abort()
    return L6_76, L1_71
  end
  _UPVALUE3_.complete()
  _UPVALUE3_.save()
  return _UPVALUE0_.SUCCESS, L7_77
end
function groupBrowserPolicyCreate(A0_78)
  local L1_79, L2_80, L3_81, L4_82, L5_83
  L1_79 = ACCESS_LEVEL
  if L1_79 ~= 0 then
    L1_79 = util
    L1_79 = L1_79.appendDebugOut
    L2_80 = "Detected Unauthorized access for page Groups"
    L1_79(L2_80)
    L1_79 = _UPVALUE0_
    L1_79 = L1_79.UNAUTHORIZED
    return L1_79
  end
  L1_79 = A0_78["groupBrowserTable.cookie"]
  L2_80 = A0_78["groupBrowserTable.groupName"]
  L3_81 = A0_78["groupBrowserTable.browserName"]
  if L2_80 == nil or L3_81 == nil then
    L4_82 = util
    L4_82 = L4_82.appendDebugOut
    L5_83 = "GetNext : Invalid Cookie"
    L4_82(L5_83)
    L4_82 = _UPVALUE0_
    L4_82 = L4_82.BAD_PARAMETER
    return L4_82
  end
  if L3_81 == "1" then
    L3_81 = IE
  elseif L3_81 == "2" then
    L3_81 = OPERA
  elseif L3_81 == "3" then
    L3_81 = CHROME
  elseif L3_81 == "4" then
    L3_81 = FIREFOX
  elseif L3_81 == "5" then
    L3_81 = SAFARI
  end
  L4_82, L5_83 = nil, nil
  _UPVALUE1_.start()
  L4_82, L5_83 = _UPVALUE2_.browserPolicyCreate(L1_79, L2_80, L3_81)
  if L4_82 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page Groups Page" .. L4_82)
    _UPVALUE1_.abort()
    return L4_82, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L5_83
end
function groupBrowserDelete(A0_84, A1_85)
  local L2_86, L3_87, L4_88, L5_89, L6_90, L7_91, L8_92
  L2_86 = ACCESS_LEVEL
  if L2_86 ~= 0 then
    L2_86 = util
    L2_86 = L2_86.appendDebugOut
    L3_87 = "Detected Unauthorized access for page Groups Page"
    L2_86(L3_87)
    L2_86 = _UPVALUE0_
    L2_86 = L2_86.UNAUTHORIZED
    return L2_86
  end
  if A0_84 == nil then
    L2_86 = util
    L2_86 = L2_86.appendDebugOut
    L3_87 = "Delete : Invalid Cookie"
    L2_86(L3_87)
    L2_86 = _UPVALUE0_
    L2_86 = L2_86.BAD_PARAMETER
    return L2_86
  end
  if A1_85 == nil then
    L2_86 = util
    L2_86 = L2_86.appendDebugOut
    L3_87 = "Delete : Invalid Cookie"
    L2_86(L3_87)
    L2_86 = _UPVALUE1_
    L2_86 = L2_86.BROWSER_GROUPID_INPUT_NIL
    return L2_86
  end
  L2_86 = nil
  L3_87 = _UPVALUE2_
  L3_87 = L3_87.start
  L3_87()
  L3_87 = _UPVALUE3_
  L3_87 = L3_87.groupBrowserExists
  L3_87 = L3_87(L4_88)
  if L4_88 == "string" then
    if A1_85 == "Internet Explorer" then
      A1_85 = "MSIE"
    end
    L2_86 = L4_88
    if L2_86 ~= L4_88 then
      L4_88(L5_89)
      L4_88()
      return L2_86
    end
  else
    for L7_91, L8_92 in L4_88(L5_89) do
      if L8_92 == "Internet Explorer" then
        L8_92 = "MSIE"
      end
      L2_86 = _UPVALUE3_.groupBrowserPolicySelectiveDelete(A0_84, L8_92)
      if L2_86 ~= _UPVALUE0_.SUCCESS then
        util.appendDebugOut("Error in Delete Operaion in page Groups Page" .. L2_86)
        _UPVALUE2_.abort()
        return L2_86
      end
    end
  end
  L4_88()
  L4_88()
  return L4_88, L5_89
end
function browserPolicyDefaultsGet()
  local L1_93
  L1_93 = _UPVALUE0_
  L1_93 = L1_93.NOT_SUPPORTED
  return L1_93
end
function browserPolicyAllow(A0_94)
  local L1_95
  L1_95 = ACCESS_LEVEL
  if L1_95 ~= 0 then
    L1_95 = util
    L1_95 = L1_95.appendDebugOut
    L1_95("Detected Unauthorized access for page Groups Page")
    L1_95 = _UPVALUE0_
    L1_95 = L1_95.UNAUTHORIZED
    return L1_95
  end
  L1_95 = _UPVALUE0_
  L1_95 = L1_95.NIL
  if A0_94 == L1_95 then
    L1_95 = _UPVALUE0_
    L1_95 = L1_95.BAD_PARAMETER
    return L1_95
  end
  L1_95 = _UPVALUE1_
  L1_95 = L1_95.start
  L1_95()
  L1_95 = _UPVALUE2_
  L1_95 = L1_95.policyTypeSet
  L1_95 = L1_95(tostring(A0_94), _UPVALUE3_)
  if L1_95 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page Groups Page" .. L1_95)
    _UPVALUE1_.abort()
    return L1_95, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function browserPolicyAllowAll(A0_96)
  local L1_97, L2_98, L3_99, L4_100, L5_101, L6_102
  if L1_97 ~= 0 then
    L1_97(L2_98)
    return L1_97
  end
  if A0_96 == L1_97 then
    return L1_97
  end
  L1_97()
  for L4_100, L5_101 in L1_97(L2_98) do
    L6_102 = _UPVALUE2_
    L6_102 = L6_102.policyTypeSet
    L6_102 = L6_102(tostring(L5_101), _UPVALUE3_)
    if L6_102 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in Delete Operaion in page Groups Page" .. L6_102)
      _UPVALUE1_.abort()
      return L6_102, curCookie
    end
  end
  L1_97()
  L1_97()
  return L1_97, L2_98
end
function browserPolicyDeny(A0_103)
  local L1_104
  L1_104 = ACCESS_LEVEL
  if L1_104 ~= 0 then
    L1_104 = util
    L1_104 = L1_104.appendDebugOut
    L1_104("Detected Unauthorized access for page Groups Page")
    L1_104 = _UPVALUE0_
    L1_104 = L1_104.UNAUTHORIZED
    return L1_104
  end
  L1_104 = _UPVALUE0_
  L1_104 = L1_104.NIL
  if A0_103 == L1_104 then
    L1_104 = _UPVALUE0_
    L1_104 = L1_104.BAD_PARAMETER
    return L1_104
  end
  L1_104 = _UPVALUE1_
  L1_104 = L1_104.start
  L1_104()
  L1_104 = _UPVALUE2_
  L1_104 = L1_104.policyTypeSet
  L1_104 = L1_104(tostring(A0_103), _UPVALUE3_)
  if L1_104 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page Groups Page" .. L1_104)
    _UPVALUE1_.abort()
    return L1_104, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, A0_103
end
function browserPolicyDenyAll(A0_105)
  local L1_106, L2_107, L3_108, L4_109, L5_110, L6_111
  if L1_106 ~= 0 then
    L1_106(L2_107)
    return L1_106
  end
  if A0_105 == L1_106 then
    return L1_106
  end
  L1_106()
  for L4_109, L5_110 in L1_106(L2_107) do
    L6_111 = _UPVALUE2_
    L6_111 = L6_111.policyTypeSet
    L6_111 = L6_111(tostring(L5_110), _UPVALUE3_)
    if L6_111 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in Delete Operaion in page Groups Page" .. L6_111)
      _UPVALUE1_.abort()
      return L6_111, curCookie
    end
  end
  L1_106()
  L1_106()
  return L1_106, L2_107
end
function IPPolicyGet()
  local L0_112, L1_113, L2_114, L3_115, L4_116, L5_117
  L0_112, L1_113, L2_114, L3_115, L5_117, addressType, address, maskLength = _UPVALUE0_.networkPolicyGet()
  if L0_112 ~= SUCCESS then
    return L0_112
  end
  if tonumber(L5_117) == _UPVALUE1_ then
    L5_117 = _UPVALUE2_
  elseif tonumber(L5_117) == _UPVALUE3_ then
    L5_117 = _UPVALUE4_
  end
  return L0_112, L1_113, L2_114, L3_115, L5_117, addressType, address, maskLength
end
function IPPolicyGetNext(A0_118)
  local L1_119, L2_120, L3_121, L4_122, L5_123, L6_124, L7_125, L8_126
  L1_119 = A0_118["groups.cookie"]
  if L1_119 == nil then
    L2_120 = util
    L2_120 = L2_120.appendDebugOut
    L3_121 = "GetNext : Invalid Cookie"
    L2_120(L3_121)
    L2_120 = _UPVALUE0_
    L2_120 = L2_120.BAD_PARAMETER
    return L2_120
  end
  L2_120, L3_121, L4_122, L5_123, L6_124, L7_125, L8_126 = nil, nil, nil, nil, nil, nil, nil
  L2_120, cookie, L3_121, L4_122, L5_123, L6_124, L7_125, L8_126 = _UPVALUE1_.networkPolicyGetNext(L1_119)
  if L2_120 ~= SUCCESS then
    return L2_120
  end
  if tonumber(L5_123) == _UPVALUE2_ then
    L5_123 = _UPVALUE3_
  elseif tonumber(L5_123) == _UPVALUE4_ then
    L5_123 = _UPVALUE5_
  end
  return L2_120, cookie, L3_121, L4_122, L5_123, L6_124, L7_125, L8_126
end
function groupNetworkPolicySet(A0_127)
  local L1_128, L2_129, L3_130, L4_131, L5_132, L6_133, L7_134, L8_135, L9_136
  L1_128 = ACCESS_LEVEL
  if L1_128 ~= 0 then
    L1_128 = util
    L1_128 = L1_128.appendDebugOut
    L2_129 = "Detected Unauthorized access for page Groups Page"
    L1_128(L2_129)
    L1_128 = _UPVALUE0_
    L1_128 = L1_128.UNAUTHORIZED
    return L1_128
  end
  L1_128 = A0_127["groupNetworkTable.cookie"]
  L2_129 = A0_127["groupNetworkTable.cookie"]
  L3_130 = A0_127["groupNetworkTable.groupName"]
  L4_131 = A0_127["groupNetworkTable.loginFromIP"]
  L5_132 = A0_127["groupNetworkTable.addressType"]
  L6_133 = A0_127["groupNetworkTable.ipAddress"]
  L7_134 = A0_127["groupNetworkTable.maskLength"]
  if L1_128 == nil then
    L8_135 = util
    L8_135 = L8_135.appendDebugOut
    L9_136 = "Set : Invalid Cookie"
    L8_135(L9_136)
    L8_135 = _UPVALUE0_
    L8_135 = L8_135.BAD_PARAMETER
    return L8_135
  end
  if L3_130 == nil or L5_132 == nil or L6_133 == nil then
    L8_135 = util
    L8_135 = L8_135.appendDebugOut
    L9_136 = "Set : Invalid Cookie"
    L8_135(L9_136)
    L8_135 = _UPVALUE0_
    L8_135 = L8_135.BAD_PARAMETER
    return L8_135
  end
  if L4_131 == "2" then
    L4_131 = _UPVALUE1_
  elseif L4_131 == "1" then
    L4_131 = _UPVALUE2_
  end
  if L5_132 == "1" then
    L5_132 = _UPVALUE3_
  elseif L5_132 == "2" then
    L5_132 = _UPVALUE4_
  end
  L8_135, L9_136 = nil, nil
  _UPVALUE5_.start()
  L8_135, L9_136 = _UPVALUE6_.networkPolicySet(L1_128, L2_129, L3_130, L4_131, L5_132, L6_133, L7_134)
  if L8_135 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page Groups Page" .. L8_135)
    _UPVALUE5_.abort()
    return L8_135, L1_128
  end
  _UPVALUE5_.complete()
  _UPVALUE5_.save()
  return _UPVALUE0_.SUCCESS, L9_136
end
function groupNetworkPolicyCreate(A0_137)
  local L1_138, L2_139, L3_140, L4_141, L5_142, L6_143, L7_144
  L1_138 = ACCESS_LEVEL
  if L1_138 ~= 0 then
    L1_138 = util
    L1_138 = L1_138.appendDebugOut
    L2_139 = "Detected Unauthorized access for page Groups Page"
    L1_138(L2_139)
    L1_138 = _UPVALUE0_
    L1_138 = L1_138.UNAUTHORIZED
    return L1_138
  end
  L1_138 = A0_137["groupNetworkTable.cookie"]
  L2_139 = A0_137["groupNetworkTable.groupName"]
  L3_140 = A0_137["groupNetworkTable.addressType"]
  L4_141 = A0_137["groupNetworkTable.ipAddress"]
  L5_142 = A0_137["groupNetworkTable.maskLength"]
  if L2_139 == nil or L3_140 == nil or L4_141 == nil then
    L6_143 = util
    L6_143 = L6_143.appendDebugOut
    L7_144 = "Create : Invalid Argument"
    L6_143(L7_144)
    L6_143 = _UPVALUE0_
    L6_143 = L6_143.BAD_PARAMETER
    return L6_143
  end
  if L3_140 == "1" then
    L3_140 = _UPVALUE1_
  elseif L3_140 == "2" then
    L3_140 = _UPVALUE2_
  end
  L6_143, L7_144 = nil, nil
  _UPVALUE3_.start()
  L6_143, L7_144 = _UPVALUE4_.networkPolicyCreate(L1_138, L2_139, L3_140, L4_141, L5_142)
  if L6_143 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page Groups " .. L6_143)
    _UPVALUE3_.abort()
    return L6_143, curCookie
  end
  _UPVALUE3_.complete()
  _UPVALUE3_.save()
  return _UPVALUE0_.SUCCESS, L7_144
end
function groupIpDeleteRow(A0_145)
  local L1_146, L2_147
  L1_146 = ACCESS_LEVEL
  if L1_146 ~= 0 then
    L1_146 = util
    L1_146 = L1_146.appendDebugOut
    L2_147 = "Detected Unauthorized access for page Groups Page"
    L1_146(L2_147)
    L1_146 = _UPVALUE0_
    L1_146 = L1_146.UNAUTHORIZED
    return L1_146
  end
  L1_146 = A0_145["groupNetworkTable.cookie"]
  if L1_146 == nil then
    L2_147 = util
    L2_147 = L2_147.appendDebugOut
    L2_147("Delete : Invalid Cookie")
    L2_147 = _UPVALUE0_
    L2_147 = L2_147.BAD_PARAMETER
    return L2_147
  end
  L2_147 = nil
  _UPVALUE1_.start()
  L2_147, cookie = _UPVALUE2_.networkPolicyDelete(L1_146)
  if L2_147 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page Groups " .. L2_147)
    _UPVALUE1_.abort()
    return L2_147, L1_146
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function IPPolicyDefaultsGet()
  local L1_148
  L1_148 = _UPVALUE0_
  L1_148 = L1_148.NOT_SUPPORTED
  return L1_148
end
function groupsGetAll()
  local L0_149, L1_150
  L0_149 = _UPVALUE0_
  L0_149 = L0_149.groupGetAll
  L1_150 = L0_149()
  if L0_149 ~= _UPVALUE1_.SUCCESS then
    return L0_149
  end
  return _UPVALUE1_.SUCCESS, L1_150
end
function browserGroupsGetAll()
  local L0_151, L1_152
  L0_151 = _UPVALUE0_
  L0_151 = L0_151.groupGetAll
  L1_152 = L0_151()
  if L0_151 ~= _UPVALUE1_.SUCCESS then
    return L0_151
  end
  return _UPVALUE1_.SUCCESS, L1_152
end
function ipGroupsGetAll()
  local L0_153, L1_154
  L0_153 = _UPVALUE0_
  L0_153 = L0_153.groupGetAll
  L1_154 = L0_153()
  if L0_153 ~= _UPVALUE1_.SUCCESS then
    return L0_153
  end
  return _UPVALUE1_.SUCCESS, L1_154
end
function groupsGetRow(A0_155)
  local L1_156, L2_157, L3_158, L4_159, L5_160, L6_161, L7_162, L8_163
  L2_157 = A0_155
  if L2_157 == nil then
    L3_158 = util
    L3_158 = L3_158.appendDebugOut
    L4_159 = "GetNext : Invalid Cookie"
    L3_158(L4_159)
    L3_158 = _UPVALUE0_
    L3_158 = L3_158.BAD_PARAMETER
    return L3_158
  end
  L3_158 = _UPVALUE1_
  L3_158 = L3_158.groupGetRow
  L4_159 = L2_157
  L4_159 = L3_158(L4_159)
  groupTable = L5_160
  cookie = L4_159
  L1_156 = L3_158
  L3_158 = _UPVALUE0_
  L3_158 = L3_158.SUCCESS
  if L1_156 ~= L3_158 then
    L3_158 = _UPVALUE0_
    L3_158 = L3_158.FAILURE
    return L3_158
  end
  L3_158 = 0
  L4_159 = groupTable
  L4_159 = L4_159["groups.capabilities"]
  for L8_163 in L5_160(L6_161, L7_162) do
    if L8_163 == _UPVALUE2_ then
      groupTable["groups.pptp"] = _UPVALUE3_
    elseif L8_163 == _UPVALUE4_ then
      groupTable["groups.l2tp"] = _UPVALUE3_
    elseif L8_163 == _UPVALUE5_ then
      groupTable["groups.sslvpn"] = _UPVALUE3_
    elseif L8_163 == _UPVALUE6_ then
      groupTable["groups.xauth"] = _UPVALUE3_
    elseif L8_163 == _UPVALUE7_ then
      groupTable["groups.captivePortal"] = _UPVALUE3_
    elseif L8_163 == _UPVALUE8_ then
      groupTable["groups.openVpn"] = _UPVALUE3_
    elseif L8_163 == _UPVALUE9_ then
      groupTable["groups.userType"] = _UPVALUE10_
      L3_158 = 1
    elseif L8_163 == _UPVALUE11_ then
      groupTable["groups.userType"] = _UPVALUE12_
      L3_158 = 1
    elseif L8_163 == _UPVALUE13_ then
      groupTable["groups.userType"] = _UPVALUE14_
      L3_158 = 1
    end
  end
  if L3_158 == 0 then
    L5_160["groups.userType"] = L6_161
  end
  for L8_163, _FORV_9_ in L5_160(L6_161) do
    if _FORV_9_ == groupTable["groups.authType"] then
      groupTable["groups.sslAuthType"] = tostring(L8_163)
    end
  end
  return L5_160, L6_161, L7_162
end
function groupProfileDeleteAll()
  local L0_164
  L0_164 = ACCESS_LEVEL
  if L0_164 ~= 0 then
    L0_164 = util
    L0_164 = L0_164.appendDebugOut
    L0_164("Detected Unauthorized access for page groups PAGE")
    L0_164 = _UPVALUE0_
    L0_164 = L0_164.UNAUTHORIZED
    return L0_164
  end
  L0_164 = nil
  _UPVALUE1_.start()
  L0_164, cookie = _UPVALUE2_.groupDeleteAll()
  if L0_164 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page groups" .. L0_164)
    _UPVALUE1_.abort()
    return L0_164
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, 0
end
function groupsLoginPolicyGetAll()
  local L0_165, L1_166
  L0_165 = _UPVALUE0_
  L0_165 = L0_165.groupLoginGetAll
  L1_166 = L0_165()
  if L0_165 ~= _UPVALUE1_.SUCCESS then
    return L0_165
  end
  return _UPVALUE1_.SUCCESS, L1_166
end
function groupsLoginPolicyGetRow(A0_167)
  local L1_168, L2_169
  L2_169 = A0_167
  if L2_169 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_168, cookie, groupLoginTable = _UPVALUE1_.groupLoginGetRow(L2_169)
  if L1_168 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, cookie, groupLoginTable
end
function groupsLoginPolicyDeleteAll()
  local L0_170
  L0_170 = ACCESS_LEVEL
  if L0_170 ~= 0 then
    L0_170 = util
    L0_170 = L0_170.appendDebugOut
    L0_170("Detected Unauthorized access for page groups PAGE")
    L0_170 = _UPVALUE0_
    L0_170 = L0_170.UNAUTHORIZED
    return L0_170
  end
  L0_170 = nil
  _UPVALUE1_.start()
  L0_170, cookie = _UPVALUE2_.groupLoginDeleteAll()
  if L0_170 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page groups" .. L0_170)
    _UPVALUE1_.abort()
    return L0_170
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, 0
end
function groupsBrowserPolicyGetAll()
  local L0_171, L1_172, L2_173, L3_174, L4_175
  L0_171 = _UPVALUE0_
  L0_171 = L0_171.groupBrowserGetAll
  L1_172 = L0_171()
  L2_173 = _UPVALUE1_
  L2_173 = L2_173.SUCCESS
  if L0_171 ~= L2_173 then
    return L0_171
  end
  L2_173 = {}
  L3_174 = 1
  for _FORV_7_, _FORV_8_ in L4_175(L1_172) do
    groupCount = 1
    for _FORV_12_, _FORV_13_ in pairs(L2_173) do
      if _FORV_13_ == _FORV_8_["UserGroups.GroupName"] then
        groupCount = 0
      end
    end
    if groupCount == 1 then
      L2_173[L3_174] = _FORV_8_["UserGroups.GroupName"]
      L3_174 = L3_174 + 1
    end
  end
  for _FORV_11_, _FORV_12_ in pairs(L2_173) do
    ({})[_FORV_11_] = ""
    for _FORV_16_, _FORV_17_ in pairs(L1_172) do
      if _FORV_17_["UserGroups.GroupName"] == L2_173[_FORV_11_] then
        if _FORV_17_["UserGroups.ClientBrowserName"] == "MSIE" then
          _FORV_17_["UserGroups.ClientBrowserName"] = "Internet Explorer"
        end
        ;({})[_FORV_11_] = ({})[_FORV_11_] .. "," .. _FORV_17_["UserGroups.ClientBrowserName"]
        ;({})[_FORV_11_] = _FORV_17_["UserGroups.LoginFromBrowser"]
        ;({})[_FORV_11_] = _FORV_17_["UserGroups.rowid"]
      end
    end
  end
  for _FORV_11_, _FORV_12_ in pairs(L2_173) do
    L4_175[_FORV_11_] = {}
    L4_175[_FORV_11_]["UserGroups.GroupName"] = L2_173[_FORV_11_]
    L4_175[_FORV_11_]["UserGroups.ClientBrowserName"] = string.sub(({})[_FORV_11_], 2)
    L4_175[_FORV_11_]["UserGroups.LoginFromBrowser"] = ({})[_FORV_11_]
    L4_175[_FORV_11_]["UserGroups.rowid"] = ({})[_FORV_11_]
  end
  return _UPVALUE1_.SUCCESS, L4_175
end
function groupsBrowserPolicyGetRow(A0_176)
  local L1_177, L2_178
  L2_178 = A0_176
  if L2_178 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_177, cookie, groupTable = _UPVALUE1_.groupBrowserGetRow(L2_178)
  if L1_177 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, cookie, groupTable
end
function groupBrowserDeleteAll()
  local L0_179
  L0_179 = ACCESS_LEVEL
  if L0_179 ~= 0 then
    L0_179 = util
    L0_179 = L0_179.appendDebugOut
    L0_179("Detected Unauthorized access for page groups PAGE")
    L0_179 = _UPVALUE0_
    L0_179 = L0_179.UNAUTHORIZED
    return L0_179
  end
  L0_179 = nil
  _UPVALUE1_.start()
  L0_179, cookie = _UPVALUE2_.groupBrowserPolicyDeleteAll()
  if L0_179 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page groups" .. L0_179)
    _UPVALUE1_.abort()
    return L0_179
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, 0
end
function groupsNetworkPolicyGetAll()
  local L0_180, L1_181, L2_182, L3_183, L4_184, L5_185, L6_186, L7_187, L8_188, L9_189, L10_190
  L0_180 = _UPVALUE0_
  L0_180 = L0_180.groupNetworkGetAll
  L1_181 = L0_180()
  L2_182 = _UPVALUE1_
  L2_182 = L2_182.SUCCESS
  if L0_180 ~= L2_182 then
    return L0_180
  end
  L2_182 = {}
  L3_183 = 1
  for L7_187, L8_188 in L4_184(L5_185) do
    groupCount = L9_189
    for _FORV_12_, _FORV_13_ in L9_189(L10_190) do
      if _FORV_13_ == L8_188["UserGroups.GroupName"] then
        groupCount = 0
      end
    end
    if L9_189 == 1 then
      L2_182[L3_183] = L9_189
      L3_183 = L3_183 + 1
    end
  end
  L7_187 = {}
  L8_188 = {}
  for _FORV_13_, _FORV_14_ in L10_190(L2_182) do
    L5_185[_FORV_13_] = ""
    L6_186[_FORV_13_] = ""
    L7_187[_FORV_13_] = ""
    for _FORV_18_, _FORV_19_ in pairs(L1_181) do
      if _FORV_19_["UserGroups.GroupName"] == L2_182[_FORV_13_] then
        L5_185[_FORV_13_] = L5_185[_FORV_13_] .. ", " .. _FORV_19_["UserGroups.AddressType"]
        L6_186[_FORV_13_] = L6_186[_FORV_13_] .. ", " .. _FORV_19_["UserGroups.Address"]
        L7_187[_FORV_13_] = L7_187[_FORV_13_] .. ", " .. _FORV_19_["UserGroups.MaskLength"]
        L8_188[_FORV_13_] = _FORV_19_["UserGroups.rowid"]
        L9_189[_FORV_13_] = _FORV_19_["UserGroups.LoginFromIP"]
      end
    end
    L5_185[_FORV_13_] = string.gsub(L5_185[_FORV_13_], "0", "IPAddress")
    L5_185[_FORV_13_] = string.gsub(L5_185[_FORV_13_], "1", "Network")
  end
  for _FORV_14_, _FORV_15_ in pairs(L2_182) do
    L10_190[_FORV_14_] = {}
    L10_190[_FORV_14_]["UserGroups.GroupName"] = L2_182[_FORV_14_]
    L10_190[_FORV_14_]["UserGroups.Address"] = string.sub(L6_186[_FORV_14_], 3)
    L10_190[_FORV_14_]["UserGroups.MaskLength"] = string.sub(L7_187[_FORV_14_], 3)
    L10_190[_FORV_14_]["UserGroups.AddressType"] = string.sub(L5_185[_FORV_14_], 3)
    L10_190[_FORV_14_]["UserGroups.rowid"] = L8_188[_FORV_14_]
    L10_190[_FORV_14_]["UserGroups.LoginFromIP"] = L9_189[_FORV_14_]
  end
  return _UPVALUE1_.SUCCESS, L10_190
end
function groupsNetworkPolicyGetRow(A0_191)
  local L1_192, L2_193
  L2_193 = A0_191
  if L2_193 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_192, cookie, groupNetworkTable = _UPVALUE1_.groupNetworkGetRow(L2_193)
  if L1_192 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, cookie, groupNetworkTable
end
function ipPolicyAllow(A0_194)
  local L1_195
  L1_195 = ACCESS_LEVEL
  if L1_195 ~= 0 then
    L1_195 = util
    L1_195 = L1_195.appendDebugOut
    L1_195("Detected Unauthorized access for page Groups Page")
    L1_195 = _UPVALUE0_
    L1_195 = L1_195.UNAUTHORIZED
    return L1_195
  end
  L1_195 = _UPVALUE0_
  L1_195 = L1_195.NIL
  if A0_194 == L1_195 then
    L1_195 = _UPVALUE0_
    L1_195 = L1_195.BAD_PARAMETER
    return L1_195
  end
  L1_195 = _UPVALUE1_
  L1_195 = L1_195.start
  L1_195()
  L1_195 = _UPVALUE2_
  L1_195 = L1_195.policyTypeSet
  L1_195 = L1_195(tostring(A0_194), _UPVALUE3_)
  if L1_195 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page Groups Page" .. L1_195)
    _UPVALUE1_.abort()
    return L1_195, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function ipPolicyAllowAll(A0_196)
  local L1_197, L2_198, L3_199, L4_200, L5_201, L6_202
  if L1_197 ~= 0 then
    L1_197(L2_198)
    return L1_197
  end
  if A0_196 == L1_197 then
    return L1_197
  end
  L1_197()
  for L4_200, L5_201 in L1_197(L2_198) do
    L6_202 = _UPVALUE2_
    L6_202 = L6_202.policyTypeSet
    L6_202 = L6_202(tostring(L5_201), _UPVALUE3_)
    if L6_202 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in Delete Operaion in page Groups Page" .. L6_202)
      _UPVALUE1_.abort()
      return L6_202, curCookie
    end
  end
  L1_197()
  L1_197()
  return L1_197, L2_198
end
function ipPolicyDeny(A0_203)
  local L1_204
  L1_204 = ACCESS_LEVEL
  if L1_204 ~= 0 then
    L1_204 = util
    L1_204 = L1_204.appendDebugOut
    L1_204("Detected Unauthorized access for page Groups Page")
    L1_204 = _UPVALUE0_
    L1_204 = L1_204.UNAUTHORIZED
    return L1_204
  end
  L1_204 = _UPVALUE0_
  L1_204 = L1_204.NIL
  if A0_203 == L1_204 then
    L1_204 = _UPVALUE0_
    L1_204 = L1_204.BAD_PARAMETER
    return L1_204
  end
  L1_204 = _UPVALUE1_
  L1_204 = L1_204.start
  L1_204()
  L1_204 = _UPVALUE2_
  L1_204 = L1_204.policyTypeSet
  L1_204 = L1_204(tostring(A0_203), _UPVALUE3_)
  if L1_204 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page Groups Page" .. L1_204)
    _UPVALUE1_.abort()
    return L1_204
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function ipPolicyDenyAll(A0_205)
  local L1_206, L2_207, L3_208, L4_209, L5_210, L6_211
  if L1_206 ~= 0 then
    L1_206(L2_207)
    return L1_206
  end
  if A0_205 == L1_206 then
    return L1_206
  end
  L1_206()
  for L4_209, L5_210 in L1_206(L2_207) do
    L6_211 = _UPVALUE2_
    L6_211 = L6_211.policyTypeSet
    L6_211 = L6_211(tostring(L5_210), _UPVALUE3_)
    if L6_211 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in Delete Operaion in page Groups Page" .. L6_211)
      _UPVALUE1_.abort()
      return L6_211, curCookie
    end
  end
  L1_206()
  L1_206()
  return L1_206, L2_207
end
function groupIpDeleteAll()
  local L0_212
  L0_212 = ACCESS_LEVEL
  if L0_212 ~= 0 then
    L0_212 = util
    L0_212 = L0_212.appendDebugOut
    L0_212("Detected Unauthorized access for page groups PAGE")
    L0_212 = _UPVALUE0_
    L0_212 = L0_212.UNAUTHORIZED
    return L0_212
  end
  L0_212 = nil
  _UPVALUE1_.start()
  L0_212, cookie = _UPVALUE2_.groupIpPolicyDeleteAll()
  if L0_212 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page groups" .. L0_212)
    _UPVALUE1_.abort()
    return L0_212
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, 0
end
function sslVpnLayoutGetAll()
  local L0_213, L1_214
  L0_213 = _UPVALUE0_
  L0_213 = L0_213.sslLayoutGetAll
  L1_214 = L0_213()
  if L0_213 ~= _UPVALUE1_.SUCCESS then
    return L0_213
  end
  return _UPVALUE1_.SUCCESS, L1_214
end
function captivePortalUsers()
  local L0_215, L1_216, L2_217, L3_218, L4_219, L5_220, L6_221, L7_222, L8_223
  L0_215 = _UPVALUE0_
  L0_215 = L0_215.groupGetAll
  L1_216 = L0_215()
  L2_217 = _UPVALUE1_
  L2_217 = L2_217.SUCCESS
  if L0_215 ~= L2_217 then
    return L0_215
  end
  L2_217 = {}
  capTable = L2_217
  L2_217 = 1
  for L6_221, L7_222 in L3_218(L4_219) do
    L8_223 = L7_222["UserGroups.Capabilities"]
    for _FORV_12_ in string.gmatch(L8_223, "%d+") do
      if _FORV_12_ == _UPVALUE2_ then
        capTable[L2_217] = L7_222["UserGroups.GroupName"]
        L2_217 = L2_217 + 1
      end
    end
  end
  return L3_218, L4_219
end
function groupBrowserNamesGet(A0_224)
  local L1_225, L2_226
  L1_225 = _UPVALUE0_
  L1_225 = L1_225.NIL
  if A0_224 == L1_225 then
    L1_225 = _UPVALUE0_
    L1_225 = L1_225.BAD_PARAMETER
    return L1_225
  end
  L1_225 = _UPVALUE1_
  L1_225 = L1_225.groupBrowserPolicyGet
  L2_226 = A0_224
  L2_226 = L1_225(L2_226)
  if L1_225 ~= _UPVALUE0_.SUCCESS then
    return L1_225
  end
  return L1_225, L2_226
end
function groupIpPoliciesGet(A0_227)
  local L1_228, L2_229
  L1_228 = _UPVALUE0_
  L1_228 = L1_228.NIL
  if A0_227 == L1_228 then
    L1_228 = _UPVALUE0_
    L1_228 = L1_228.BAD_PARAMETER
    return L1_228
  end
  L1_228 = _UPVALUE1_
  L1_228 = L1_228.groupIpPolicyGet
  L2_229 = A0_227
  L2_229 = L1_228(L2_229)
  if L1_228 ~= _UPVALUE0_.SUCCESS then
    return L1_228
  end
  return L1_228, L2_229
end
function groupIpPolicyDelete(A0_230, A1_231)
  local L2_232, L3_233, L4_234, L5_235, L6_236, L7_237, L8_238
  L2_232 = ACCESS_LEVEL
  if L2_232 ~= 0 then
    L2_232 = util
    L2_232 = L2_232.appendDebugOut
    L3_233 = "Detected Unauthorized access for page Groups Page"
    L2_232(L3_233)
    L2_232 = _UPVALUE0_
    L2_232 = L2_232.UNAUTHORIZED
    return L2_232
  end
  if A0_230 == nil then
    L2_232 = util
    L2_232 = L2_232.appendDebugOut
    L3_233 = "Delete : Invalid Cookie"
    L2_232(L3_233)
    L2_232 = _UPVALUE0_
    L2_232 = L2_232.BAD_PARAMETER
    return L2_232
  end
  if A1_231 == nil then
    L2_232 = util
    L2_232 = L2_232.appendDebugOut
    L3_233 = "Delete : Invalid Cookie"
    L2_232(L3_233)
    L2_232 = _UPVALUE1_
    L2_232 = L2_232.NETWORK_POLICY_INPUT_NIL
    return L2_232
  end
  L2_232 = nil
  L3_233 = _UPVALUE2_
  L3_233 = L3_233.start
  L3_233()
  L3_233 = _UPVALUE3_
  L3_233 = L3_233.groupIpPolicyExists
  L3_233 = L3_233(L4_234)
  if L4_234 == "string" then
    L2_232 = L4_234
    if L2_232 ~= L4_234 then
      L4_234(L5_235)
      L4_234()
      return L2_232
    end
  else
    for L7_237, L8_238 in L4_234(L5_235) do
      L2_232 = _UPVALUE3_.groupIpPolicySelectiveDelete(A0_230, L8_238)
      if L2_232 ~= _UPVALUE0_.SUCCESS then
        util.appendDebugOut("Error in Delete Operaion in page Groups Page" .. L2_232)
        _UPVALUE2_.abort()
        return L2_232
      end
    end
  end
  L4_234()
  L4_234()
  return L4_234
end
function existGroupBrowserPolicyCreate(A0_239)
  local L1_240, L2_241, L3_242, L4_243, L5_244, L6_245, L7_246
  L1_240 = ACCESS_LEVEL
  if L1_240 ~= 0 then
    L1_240 = util
    L1_240 = L1_240.appendDebugOut
    L2_241 = "Detected Unauthorized access for page Groups"
    L1_240(L2_241)
    L1_240 = _UPVALUE0_
    L1_240 = L1_240.UNAUTHORIZED
    return L1_240
  end
  L1_240 = A0_239["groupBrowserTable.cookie"]
  L2_241 = A0_239["groupBrowserTable.browserName"]
  L3_242 = -1
  if L1_240 == nil or L2_241 == nil then
    L4_243 = util
    L4_243 = L4_243.appendDebugOut
    L5_244 = "GetNext : Invalid Cookie"
    L4_243(L5_244)
    L4_243 = _UPVALUE0_
    L4_243 = L4_243.BAD_PARAMETER
    return L4_243
  end
  if L2_241 == "1" then
    L2_241 = IE
  elseif L2_241 == "2" then
    L2_241 = OPERA
  elseif L2_241 == "3" then
    L2_241 = CHROME
  elseif L2_241 == "4" then
    L2_241 = FIREFOX
  elseif L2_241 == "5" then
    L2_241 = SAFARI
  end
  L4_243, L5_244 = nil, nil
  L6_245 = _UPVALUE1_
  L6_245 = L6_245.groupNameGetForBrowser
  L7_246 = L1_240
  L7_246 = L6_245(L7_246)
  _UPVALUE2_.start()
  L4_243, L5_244 = _UPVALUE1_.browserPolicyCreate(L3_242, L7_246, L2_241)
  if L4_243 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page Groups Page" .. L4_243)
    _UPVALUE2_.abort()
    return L4_243, curCookie
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return _UPVALUE0_.SUCCESS, L5_244
end
function existGroupNetworkPolicyCreate(A0_247)
  local L1_248, L2_249, L3_250, L4_251, L5_252, L6_253, L7_254, L8_255, L9_256
  L1_248 = ACCESS_LEVEL
  if L1_248 ~= 0 then
    L1_248 = util
    L1_248 = L1_248.appendDebugOut
    L2_249 = "Detected Unauthorized access for page Groups Page"
    L1_248(L2_249)
    L1_248 = _UPVALUE0_
    L1_248 = L1_248.UNAUTHORIZED
    return L1_248
  end
  L1_248 = -1
  L2_249 = A0_247["groupNetworkTable.cookie"]
  L3_250 = A0_247["groupNetworkTable.addressType"]
  L4_251 = A0_247["groupNetworkTable.ipAddress"]
  L5_252 = A0_247["groupNetworkTable.maskLength"]
  if L2_249 == nil or L3_250 == nil or L4_251 == nil then
    L6_253 = util
    L6_253 = L6_253.appendDebugOut
    L7_254 = "Create : Invalid Argument"
    L6_253(L7_254)
    L6_253 = _UPVALUE0_
    L6_253 = L6_253.BAD_PARAMETER
    return L6_253
  end
  if L3_250 == "1" then
    L3_250 = _UPVALUE1_
  elseif L3_250 == "2" then
    L3_250 = _UPVALUE2_
  end
  L6_253 = _UPVALUE3_
  L6_253 = L6_253.groupNameGetForIpPolicy
  L7_254 = L2_249
  L7_254 = L6_253(L7_254)
  L8_255, L9_256 = nil, nil
  _UPVALUE4_.start()
  L8_255, L9_256 = _UPVALUE3_.networkPolicyCreate(L1_248, L7_254, L3_250, L4_251, L5_252)
  if L8_255 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page Groups " .. L8_255)
    _UPVALUE4_.abort()
    return L8_255, curCookie
  end
  _UPVALUE4_.complete()
  _UPVALUE4_.save()
  return _UPVALUE0_.SUCCESS, L9_256
end
function getGroupcapability(A0_257)
  local L1_258, L2_259
  L1_258 = ACCESS_LEVEL
  if L1_258 ~= 0 then
    L1_258 = util
    L1_258 = L1_258.appendDebugOut
    L2_259 = "Detected Unauthorized access for page Groups Page"
    L1_258(L2_259)
    L1_258 = _UPVALUE0_
    L1_258 = L1_258.UNAUTHORIZED
    return L1_258
  end
  L1_258 = nil
  L2_259 = A0_257["groupTable.userType"]
  if L2_259 == _UPVALUE1_ then
    L1_258 = _UPVALUE2_
  else
    L2_259 = A0_257["groupTable.userType"]
    if L2_259 == _UPVALUE3_ then
      L1_258 = _UPVALUE4_
    else
      L2_259 = A0_257["groupTable.userType"]
      if L2_259 == _UPVALUE5_ then
        L1_258 = _UPVALUE6_
      end
    end
  end
  L2_259 = A0_257["groupTable.pptp"]
  if L2_259 == _UPVALUE7_ then
    L2_259 = _UPVALUE0_
    L2_259 = L2_259.NIL
    if L1_258 == L2_259 then
      L1_258 = _UPVALUE8_
    else
      L2_259 = L1_258
      L1_258 = L2_259 .. "," .. _UPVALUE8_
    end
  end
  L2_259 = A0_257["groupTable.l2tp"]
  if L2_259 == _UPVALUE7_ then
    L2_259 = _UPVALUE0_
    L2_259 = L2_259.NIL
    if L1_258 == L2_259 then
      L1_258 = _UPVALUE9_
    else
      L2_259 = L1_258
      L1_258 = L2_259 .. "," .. _UPVALUE9_
    end
  end
  L2_259 = A0_257["groupTable.xauth"]
  if L2_259 == _UPVALUE7_ then
    L2_259 = _UPVALUE0_
    L2_259 = L2_259.NIL
    if L1_258 == L2_259 then
      L1_258 = _UPVALUE10_
    else
      L2_259 = L1_258
      L1_258 = L2_259 .. "," .. _UPVALUE10_
    end
  end
  L2_259 = A0_257["groupTable.openVpn"]
  if L2_259 == _UPVALUE7_ then
    L2_259 = _UPVALUE0_
    L2_259 = L2_259.NIL
    if L1_258 == L2_259 then
      L1_258 = _UPVALUE11_
    else
      L2_259 = L1_258
      L1_258 = L2_259 .. "," .. _UPVALUE11_
    end
  end
  L2_259 = A0_257["groupTable.sslvpn"]
  if L2_259 == _UPVALUE7_ then
    L2_259 = _UPVALUE0_
    L2_259 = L2_259.NIL
    if L1_258 == L2_259 then
      L1_258 = _UPVALUE12_
    else
      L2_259 = _UPVALUE12_
      L1_258 = L2_259 .. "," .. L1_258
    end
  end
  L2_259 = A0_257["groupTable.captivePortal"]
  if L2_259 == _UPVALUE7_ then
    L2_259 = _UPVALUE0_
    L2_259 = L2_259.NIL
    if L1_258 == L2_259 then
      L1_258 = _UPVALUE13_
    else
      L2_259 = L1_258
      L1_258 = L2_259 .. "," .. _UPVALUE13_
    end
  end
  L2_259 = A0_257["groupTable.cookie"]
  return (_UPVALUE14_.getGroupcapabilities(L1_258, L2_259))
end
