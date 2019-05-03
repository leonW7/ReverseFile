local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("loginLib")
L0_0 = require
L0_0("loginLuaLib")
L0_0 = require
L0_0("timeLib")
L0_0 = {}
login = L0_0
L0_0 = "/tmp/referer/"
function login.authenticate(A0_1, A1_2)
  local L2_3, L3_4, L4_5, L5_6, L6_7
  L2_3 = A1_2["Users.UserName"]
  L3_4 = A1_2["Users.Password"]
  L4_5 = db
  L4_5 = L4_5.execute
  L5_6 = string
  L5_6 = L5_6.format
  L6_7 = [[
                SELECT *, ROWID AS _ROWID_ FROM %s
        WHERE %s = '%s' AND %s = '%s'
    ]]
  L6_7 = L5_6(L6_7, A0_1, "UserName", L2_3, "Password", L3_4)
  L4_5 = L4_5(L5_6, L6_7, L5_6(L6_7, A0_1, "UserName", L2_3, "Password", L3_4))
  L5_6 = false
  L6_7 = "11437"
  if L4_5 then
    L4_5:close()
    L5_6 = L4_5:fetch({}, "a") ~= nil
    if L5_6 == false then
      L6_7 = "USER_LOGIN_INVALID_PASSWORD"
    end
  end
  return L5_6, L6_7
end
function login.getAdminLogin(A0_8)
  if db.getRows("loginSession", "username", A0_8) ~= nil then
    while db.getRows("loginSession", "username", A0_8)[1] ~= nil do
      if (login.verifyUserType(A0_8, "3") or login.verifyUserType(A0_8, "4")) and db.getRows("loginSession", "username", A0_8)[1]["loginSession.loginState"] == "LOGGED_IN" then
        return (db.getRows("loginSession", "username", A0_8))
      else
      end
    end
    return nil
  else
    return nil
  end
end
function login.revalidate(A0_9, A1_10)
  local L2_11, L3_12, L4_13, L5_14, L6_15, L7_16, L8_17, L9_18
  L2_11 = db
  L2_11 = L2_11.getAttribute
  L3_12 = "unitInfo"
  L4_13 = "_ROWID_"
  L5_14 = "1"
  L6_15 = "modelId"
  L2_11 = L2_11(L3_12, L4_13, L5_14, L6_15)
  L2_11 = L2_11 or ""
  L3_12 = ""
  L4_13 = "LOGGED_IN"
  L5_14 = "AUTHENTICATED"
  if A0_9 == nil then
    L6_15 = util
    L6_15 = L6_15.appendDebugOut
    L7_16 = "PLEASE LOGIN - NOT LOGGED IN YET! - no cookie<br>"
    L6_15(L7_16)
    L6_15 = "NO_COOKIE"
    return L6_15
  else
    L6_15 = db
    L6_15 = L6_15.escape
    L7_16 = A0_9
    L6_15 = L6_15(L7_16)
    A0_9 = L6_15
    if L2_11 == "DSR-150N" then
      L6_15 = db
      L6_15 = L6_15.getAttribute
      L7_16 = "Users"
      L8_17 = "UserName"
      L9_18 = "admin"
      L6_15 = L6_15(L7_16, L8_17, L9_18, "Password")
      L7_16 = SAPI
      L7_16 = L7_16.Request
      L7_16 = L7_16.servervariable
      L8_17 = "HTTP_HOST"
      L7_16 = L7_16(L8_17)
      if L7_16 == "mydsr150n.dlink.com" then
        L8_17 = "ipaddr = '"
        L9_18 = SAPI
        L9_18 = L9_18.Request
        L9_18 = L9_18.servervariable
        L9_18 = L9_18("REMOTE_ADDR")
        L3_12 = L8_17 .. L9_18 .. "' AND RefererValue = '" .. L7_16 .. "' AND (loginState = '" .. L4_13 .. "'\tOR loginState = '" .. L5_14 .. "')"
      else
        L8_17 = "ipaddr = '"
        L9_18 = A1_10
        L3_12 = L8_17 .. L9_18 .. "' AND cookie = '" .. A0_9 .. "'"
      end
    else
      L6_15 = "ipaddr = '"
      L7_16 = A1_10
      L8_17 = "' AND cookie = '"
      L9_18 = A0_9
      L3_12 = L6_15 .. L7_16 .. L8_17 .. L9_18 .. "'"
    end
    L6_15 = db
    L6_15 = L6_15.getRowWhere
    L7_16 = "loginSession"
    L8_17 = L3_12
    L6_15 = L6_15(L7_16, L8_17)
    L7_16 = timeLib
    L7_16 = L7_16.uptime
    L8_17 = L7_16()
    L9_18 = "USER_LOGIN_SESSION_EXPIRED,USER_LOGIN_SESSION_TERMINATED,EXPIRED_PWD_CHANGED,USER_LOGIN"
    L9_18 = db.getString(L9_18)
    if L6_15 == nil then
      util.appendDebugOut("PLEASE RELOGIN - LOGIN EXPIRED! - someone else killed your expired session<br>")
      loginLuaLib.luaLoginEventHandler("Please re-login - your session has been expired.", 3, "LOGIN")
      statusMessage = L9_18.USER_LOGIN or "i18nHTMLMissing"
      return "NO_SESSION"
    elseif L6_15["loginSession.loginState"] == "DISCONNECTED" then
      util.appendDebugOut("YOU ARE DISCONNECTED!<br>")
      loginLuaLib.luaLoginEventHandler("Please login - " .. L6_15["loginSession.username"] .. " is disconnected.", 6, "LOGIN")
      statusMessage = L9_18.USER_LOGIN_SESSION_TERMINATED or "i18nHTMLMissing"
      return "DISCONNECTED"
    elseif L6_15["loginSession.loginState"] == "AUTHENTICATED" then
      util.appendDebugOut("YOU ARE AUTHENTICATED!<br>")
      return "AUTHENTICATED"
    elseif L6_15["loginSession.loginState"] == "EXPIRED_PWD_CHANGED" then
      util.appendDebugOut("YOU PASSWORD HAS BEEN CHANGED BY ADMINISTRATOR!<br>")
      loginLuaLib.luaLoginEventHandler("Please login - password of " .. L6_15["loginSession.username"] .. " user has been changes by the administrator.", 3, "LOGIN")
      statusMessage = L9_18.EXPIRED_PWD_CHANGED or "i18nHTMLMissing"
      return "DISCONNECTED"
    elseif tonumber(db.getAttribute("Users", "UserName", L6_15["loginSession.username"], "UserTimeOut")) * 60 < L8_17 - tonumber(L6_15["loginSession.lastAccessTime"]) then
      db.deleteRowWhere("loginSession", L3_12)
      _UPVALUE0_(_UPVALUE1_ .. A0_9)
      loginLib.writeCookieVal()
      util.appendDebugOut("PLEASE RELOGIN - LOGIN EXPIRED! - you waited too long<br>")
      loginLuaLib.luaLoginEventHandler("Please login - session expired for " .. L6_15["loginSession.username"] .. " user.", 6, "LOGIN")
      statusMessage = L9_18.USER_LOGIN_SESSION_EXPIRED or "i18nHTMLMissing"
      return "EXPIRED_SESSION"
    elseif login.verifyUserType(L6_15["loginSession.username"], "4") and tonumber(db.getAttribute("SessionSettings", "GroupCapability", "4", "SessionTimeout")) ~= 0 and tonumber(db.getAttribute("SessionSettings", "GroupCapability", "4", "SessionTimeout")) * 60 < L8_17 - tonumber(L6_15["loginSession.loginTime"]) then
      db.deleteRowWhere("loginSession", L3_12)
      _UPVALUE0_(_UPVALUE1_ .. A0_9)
      util.appendDebugOut("PLEASE RELOGIN - LOGIN EXPIRED! - you waited too long<br>")
      loginLuaLib.luaLoginEventHandler("Please login - session expired for " .. L6_15["loginSession.username"] .. " user.", 6, "LOGIN")
      statusMessage = L9_18.USER_LOGIN_SESSION_EXPIRED or "i18nHTMLMissing"
      return "EXPIRED_SESSION"
    elseif login.verifyUserType(L6_15["loginSession.username"], "3") and tonumber(db.getAttribute("SessionSettings", "GroupCapability", "3", "SessionTimeout")) ~= 0 and tonumber(db.getAttribute("SessionSettings", "GroupCapability", "3", "SessionTimeout")) * 60 < tonumber(L6_15["loginSession.lastAccessTime"]) - tonumber(L6_15["loginSession.loginTime"]) then
      db.deleteRowWhere("loginSession", L3_12)
      _UPVALUE0_(_UPVALUE1_ .. A0_9)
      util.appendDebugOut("PLEASE RELOGIN - LOGIN EXPIRED! - you waited too long<br>")
      loginLuaLib.luaLoginEventHandler("Please login - session expired for " .. L6_15["loginSession.username"] .. " user.", 6, "LOGIN")
      statusMessage = L9_18.USER_LOGIN_SESSION_EXPIRED or "i18nHTMLMissing"
      return "EXPIRED_SESSION"
    else
      util.appendDebugOut("YOU ARE ALREADY LOGGED IN!<br>")
      db.setAttributeWhere("loginSession", L3_12, "lastAccessTime", L8_17)
      if login.verifyUserType(L6_15["loginSession.username"], "3") and util.fileExists("/tmp/bootComplete") then
        ACCESS_LEVEL = 0
      elseif login.verifyUserType(L6_15["loginSession.username"], "12") and util.fileExists("/tmp/bootComplete") then
        ACCESS_LEVEL = 2
      else
        ACCESS_LEVEL = 1
      end
      if util.fileExists("/tmp/bootComplete") then
        REBOOT_STATUS = 0
      else
        REBOOT_STATUS = 1
      end
      return "OK"
    end
  end
end
function login.login(A0_19)
  local L1_20, L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27, L9_28, L10_29, L11_30, L12_31, L13_32, L14_33, L15_34, L16_35, L17_36, L18_37, L19_38, L20_39, L21_40, L22_41
  L1_20 = "USER_LOGIN_INVALID_PASSWORD,USER_DENY_LOGIN_FROM_BROWSER,USER_DENY_LOGIN_FROM_IP,USER_LOGIN_USER_ALREADY_LOGGED_IN,USER_LOGIN_INVALID_USERTYPE"
  L2_21 = db
  L2_21 = L2_21.getString
  L3_22 = L1_20
  L2_21 = L2_21(L3_22)
  L1_20 = L2_21
  L2_21 = db
  L2_21 = L2_21.getAttribute
  L3_22 = "unitInfo"
  L4_23 = "_ROWID_"
  L5_24 = "1"
  L6_25 = "modelId"
  L2_21 = L2_21(L3_22, L4_23, L5_24, L6_25)
  L2_21 = L2_21 or ""
  L3_22 = A0_19["Users.UserName"]
  L4_23 = SAPI
  L4_23 = L4_23.Request
  L4_23 = L4_23.servervariable
  L5_24 = "REMOTE_ADDR"
  L4_23 = L4_23(L5_24)
  ipaddr = L4_23
  if L3_22 then
    L4_23 = db
    L4_23 = L4_23.existsRow
    L5_24 = "Users"
    L6_25 = "UserName"
    L7_26 = A0_19["Users.UserName"]
    L4_23 = L4_23(L5_24, L6_25, L7_26)
    if not L4_23 then
      L4_23 = loginLib
      L4_23 = L4_23.logLoginEvent
      L5_24 = 1
      L6_25 = L3_22
      L7_26 = ipaddr
      L4_23(L5_24, L6_25, L7_26)
      L4_23 = loginLuaLib
      L4_23 = L4_23.luaLoginEventHandler
      L5_24 = "Failed to Login as "
      L6_25 = L3_22
      L7_26 = " from "
      L8_27 = ipaddr
      L9_28 = ". Invalid username or password."
      L5_24 = L5_24 .. L6_25 .. L7_26 .. L8_27 .. L9_28
      L6_25 = 5
      L7_26 = "LOGIN"
      L4_23(L5_24, L6_25, L7_26)
      L4_23 = nil
      L5_24 = L1_20.USER_LOGIN_INVALID_PASSWORD
      L5_24 = L5_24 or "i18nHTMLMissing"
      return L4_23, L5_24
    end
  else
    L4_23 = nil
    L5_24 = L1_20.USER_LOGIN_INVALID_PASSWORD
    L5_24 = L5_24 or "i18nHTMLMissing"
    return L4_23, L5_24
  end
  L4_23 = login
  L4_23 = L4_23.verifyLogin
  L5_24 = A0_19["Users.UserName"]
  L4_23 = L4_23(L5_24)
  if not L4_23 then
    L4_23 = loginLib
    L4_23 = L4_23.logLoginEvent
    L5_24 = 2
    L6_25 = L3_22
    L7_26 = ipaddr
    L4_23(L5_24, L6_25, L7_26)
    L4_23 = loginLuaLib
    L4_23 = L4_23.luaLoginEventHandler
    L5_24 = "Failed to Login as "
    L6_25 = L3_22
    L7_26 = " user from "
    L8_27 = ipaddr
    L9_28 = " as only admin and guest users are allowed to login."
    L5_24 = L5_24 .. L6_25 .. L7_26 .. L8_27 .. L9_28
    L6_25 = 3
    L7_26 = "LOGIN"
    L4_23(L5_24, L6_25, L7_26)
    L4_23 = nil
    L5_24 = L1_20.USER_LOGIN_INVALID_USERTYPE
    L5_24 = L5_24 or "i18nHTMLMissing"
    return L4_23, L5_24
  end
  L4_23 = SAPI
  L4_23 = L4_23.Request
  L4_23 = L4_23.servervariable
  L5_24 = "HTTP_HOST"
  L4_23 = L4_23(L5_24)
  L5_24 = ""
  L6_25 = L1_20.USER_LOGIN_INVALID_PASSWORD
  L6_25 = L6_25 or "i18nHTMLMissing"
  L7_26 = loginLib
  L7_26 = L7_26.userAuthenticate
  L8_27 = A0_19["Users.UserName"]
  L9_28 = A0_19["Users.Password"]
  L7_26 = L7_26(L8_27, L9_28)
  L5_24 = L7_26
  if L5_24 == "1" then
    L7_26 = util
    L7_26 = L7_26.appendDebugOut
    L8_27 = "VALID LOGIN!<br>"
    L7_26(L8_27)
    L7_26 = loginLib
    L7_26 = L7_26.getRandom
    L7_26 = L7_26()
    L8_27 = SAPI
    L8_27 = L8_27.Request
    L8_27 = L8_27.servervariable
    L9_28 = "REMOTE_ADDR"
    L8_27 = L8_27(L9_28)
    ipaddr = L8_27
    L8_27 = SAPI
    L8_27 = L8_27.Request
    L8_27 = L8_27.servervariable
    L9_28 = "SERVER_ADDR"
    L8_27 = L8_27(L9_28)
    serverAddr = L8_27
    L8_27 = ""
    if L2_21 == "DSR-150N" then
      if L4_23 == "mydsr150n.dlink.com" then
        L8_27 = L4_23
      else
        L9_28 = login
        L9_28 = L9_28.parseReferer
        L10_29 = os
        L10_29 = L10_29.getenv
        L11_30 = "HTTP_REFERER"
        L22_41 = L10_29(L11_30)
        L9_28 = L9_28(L10_29, L11_30, L12_31, L13_32, L14_33, L15_34, L16_35, L17_36, L18_37, L19_38, L20_39, L21_40, L22_41, L10_29(L11_30))
        L8_27 = L9_28
      end
    else
      L9_28 = login
      L9_28 = L9_28.parseReferer
      L10_29 = os
      L10_29 = L10_29.getenv
      L11_30 = "HTTP_REFERER"
      L22_41 = L10_29(L11_30)
      L9_28 = L9_28(L10_29, L11_30, L12_31, L13_32, L14_33, L15_34, L16_35, L17_36, L18_37, L19_38, L20_39, L21_40, L22_41, L10_29(L11_30))
      L8_27 = L9_28
    end
    L9_28 = db
    L9_28 = L9_28.getAttribute
    L10_29 = "ipAddressTable"
    L11_30 = "LogicalIfName"
    L12_31 = "LAN"
    L13_32 = "ipAddress"
    L9_28 = L9_28(L10_29, L11_30, L12_31, L13_32)
    L10_29 = A0_19["Users.UserName"]
    L11_30 = A0_19["Login.userAgent"]
    L12_31 = db
    L12_31 = L12_31.getAttribute
    L13_32 = "Users"
    L14_33 = "UserName"
    L15_34 = L10_29
    L16_35 = "GroupId"
    L12_31 = L12_31(L13_32, L14_33, L15_34, L16_35)
    L13_32 = login
    L13_32 = L13_32.cleanUpExpired
    L13_32()
    L13_32 = "LOGGED_IN"
    L14_33 = 0
    L15_34 = nil
    L16_35 = "None"
    L17_36 = login
    L17_36 = L17_36.verifyUserType
    L18_37 = L10_29
    L19_38 = "3"
    L17_36 = L17_36(L18_37, L19_38)
    if not L17_36 then
      L17_36 = login
      L17_36 = L17_36.verifyUserType
      L18_37 = L10_29
      L19_38 = "4"
      L17_36 = L17_36(L18_37, L19_38)
    elseif L17_36 then
      L17_36 = login
      L17_36 = L17_36.getAdminLogin
      L18_37 = L10_29
      L17_36 = L17_36(L18_37)
      L18_37 = db
      L18_37 = L18_37.getRow
      L19_38 = "GroupAccessControl"
      L20_39 = "GroupId"
      L21_40 = L12_31
      L18_37 = L18_37(L19_38, L20_39, L21_40)
      if L18_37 ~= nil then
        L19_38 = true
        L20_39 = "None"
        L21_40 = login
        L21_40 = L21_40.loginAccessPoliciesVerify
        L22_41 = L18_37
        L22_41 = L21_40(L22_41, serverAddr)
        L20_39 = L22_41
        L19_38 = L21_40
        if not L19_38 then
          L16_35 = L20_39
          L21_40 = nil
          L22_41 = L16_35
          return L21_40, L22_41
        end
        L21_40 = login
        L21_40 = L21_40.loginBrowserPoliciesVerify
        L22_41 = L18_37
        L21_40 = L21_40(L22_41, L11_30)
        if not L21_40 then
          L21_40 = L1_20.USER_DENY_LOGIN_FROM_BROWSER
          L16_35 = L21_40 or "i18nHTMLMissing"
          L21_40 = loginLuaLib
          L21_40 = L21_40.luaLoginEventHandler
          L22_41 = "Failed to Login - "
          L22_41 = L22_41 .. L10_29 .. " user has been blocked to login from this browser."
          L21_40(L22_41, 5, "LOGIN")
          L21_40 = nil
          L22_41 = L16_35
          return L21_40, L22_41
        end
        L21_40 = login
        L21_40 = L21_40.loginIpPoliciesVerify
        L22_41 = L18_37
        L21_40 = L21_40(L22_41, ipaddr)
        if not L21_40 then
          L21_40 = L1_20.USER_DENY_LOGIN_FROM_IP
          L16_35 = L21_40 or "i18nHTMLMissing"
          L21_40 = loginLuaLib
          L21_40 = L21_40.luaLoginEventHandler
          L22_41 = "Failed to Login - "
          L22_41 = L22_41 .. L10_29 .. " user has been blocked to Login from this IP Address: " .. ipaddr .. "."
          L21_40(L22_41, 5, "LOGIN")
          L21_40 = nil
          L22_41 = L16_35
          return L21_40, L22_41
        end
      end
      if L17_36 then
        L13_32 = "AUTHENTICATED"
        L14_33 = 1
        L15_34 = L17_36
        L19_38 = L1_20.USER_LOGIN_USER_ALREADY_LOGGED_IN
        L16_35 = L19_38 or "i18nHTMLMissing"
      end
    end
    L17_36 = timeLib
    L17_36 = L17_36.uptime
    L18_37 = L17_36()
    L19_38 = {}
    L19_38["loginSession.username"] = L10_29
    L20_39 = ipaddr
    L19_38["loginSession.ipaddr"] = L20_39
    L19_38["loginSession.RefererValue"] = L8_27
    L19_38["loginSession.cookie"] = L7_26
    L19_38["loginSession.loginTime"] = L18_37
    L19_38["loginSession.lastAccessTime"] = L18_37
    L19_38["loginSession.loginState"] = L13_32
    if L13_32 == "LOGGED_IN" then
      L20_39 = loginLib
      L20_39 = L20_39.logLoginEvent
      L21_40 = 4
      L22_41 = L10_29
      L20_39(L21_40, L22_41, ipaddr)
      L20_39 = loginLuaLib
      L20_39 = L20_39.luaLoginEventHandler
      L21_40 = "Login successful for "
      L22_41 = L10_29
      L21_40 = L21_40 .. L22_41 .. " user from this IP Address: " .. ipaddr .. "."
      L22_41 = 6
      L20_39(L21_40, L22_41, "LOGIN")
    end
    L20_39 = ""
    L21_40 = "mydsr150n.dlink.com"
    if L2_21 == "DSR-150N" then
      if L4_23 == "mydsr150n.dlink.com" then
        L22_41 = "ipaddr = '"
        L20_39 = L22_41 .. ipaddr .. "' AND RefererValue = '" .. L21_40 .. "'"
      else
        L22_41 = "ipaddr = '"
        L20_39 = L22_41 .. ipaddr .. "' AND cookie = '" .. L7_26 .. "'"
      end
    else
      L22_41 = "ipaddr = '"
      L20_39 = L22_41 .. ipaddr .. "' AND cookie = '" .. L7_26 .. "'"
    end
    L22_41 = db
    L22_41 = L22_41.existsRowWhere
    L22_41 = L22_41("loginSession", L20_39)
    if L22_41 then
      db.update("loginSession", L19_38, L22_41)
      creatRefEntry(L7_26)
    else
      db.insert("loginSession", L19_38)
      creatRefEntry(L7_26)
    end
    loginLib.writeCookieVal()
    cgilua.cookies.set("TeamF1Login", L7_26)
    if login.verifyUserType(L10_29, "3") then
      ACCESS_LEVEL = 0
    else
      ACCESS_LEVEL = 1
    end
    return L14_33, L16_35, A0_19
  else
    L7_26 = loginLib
    L7_26 = L7_26.logLoginEvent
    L8_27 = 3
    L9_28 = L3_22
    L10_29 = ipaddr
    L7_26(L8_27, L9_28, L10_29)
    L7_26 = loginLuaLib
    L7_26 = L7_26.luaLoginEventHandler
    L8_27 = "Invalid password to login as "
    L9_28 = A0_19["Users.UserName"]
    L10_29 = " user."
    L8_27 = L8_27 .. L9_28 .. L10_29
    L9_28 = 3
    L10_29 = "LOGIN"
    L7_26(L8_27, L9_28, L10_29)
    L7_26 = nil
    L8_27 = L6_25
    return L7_26, L8_27
  end
end
function login.logout(A0_42, A1_43)
  local L2_44
  if A0_42 ~= nil then
    L2_44 = db
    L2_44 = L2_44.escape
    L2_44 = L2_44(A0_42)
    A0_42 = L2_44
    L2_44 = "ipaddr = '"
    L2_44 = L2_44 .. A1_43 .. "' AND cookie = '" .. A0_42 .. "'"
    db.deleteRowWhere("loginSession", L2_44)
    _UPVALUE0_(_UPVALUE1_ .. A0_42)
    if db.getRowWhere("loginSession", L2_44) ~= nil then
      loginLuaLib.luaLoginEventHandler(db.getRowWhere("loginSession", L2_44)["loginSession.username"] .. " user has logged out.", 5, "LOGIN")
    end
    loginLib.writeCookieVal()
    return 0
  else
    L2_44 = 1
    return L2_44
  end
end
function login.cleanUpExpired()
  local L0_45, L1_46, L2_47, L3_48, L4_49, L5_50, L6_51, L7_52, L8_53, L9_54
  L0_45 = db
  L0_45 = L0_45.getTable
  L0_45 = L0_45(L1_46)
  for L4_49, L5_50 in L1_46(L2_47) do
    L6_51 = db
    L6_51 = L6_51.getRow
    L7_52 = "Users"
    L8_53 = "UserName"
    L9_54 = L5_50["loginSession.username"]
    L6_51 = L6_51(L7_52, L8_53, L9_54)
    L7_52 = tonumber
    L8_53 = L6_51["Users.UserTimeOut"]
    L7_52 = L7_52(L8_53)
    L7_52 = L7_52 * 60
    L8_53 = L5_50["loginSession._ROWID_"]
    L9_54 = L5_50["loginSession.cookie"]
    if tonumber(L5_50["loginSession.lastAccessTime"]) < timeLib.uptime() - L7_52 then
      db.deleteRow("loginSession", "_ROWID_", L8_53)
      _UPVALUE0_(_UPVALUE1_ .. L9_54)
      loginLuaLib.luaLoginEventHandler("Session for " .. L5_50["loginSession.username"] .. " user has expired.", 5, "LOGIN")
      loginLib.writeCookieVal()
    end
  end
end
function login.refererValidation(A0_55, A1_56, A2_57)
  local L3_58
  if A0_55 ~= nil and A1_56 ~= nil then
    L3_58 = db
    L3_58 = L3_58.escape
    L3_58 = L3_58(A0_55)
    A0_55 = L3_58
    L3_58 = "ipaddr = '"
    L3_58 = L3_58 .. A1_56 .. "' AND Cookie = '" .. A0_55 .. "'"
    if db.getRowWhere("loginSession", L3_58) == nil then
      return false
    elseif db.getRowWhere("loginSession", L3_58)["loginSession.RefererValue"] ~= nil and db.getRowWhere("loginSession", L3_58)["loginSession.RefererValue"] ~= A2_57 then
      return false
    end
  end
  L3_58 = true
  return L3_58
end
function login.parseReferer(A0_59)
  local L1_60
  L1_60 = ""
  if util.split(A0_59, "//") ~= false and util.split(A0_59, "//")[2] ~= nil then
    L1_60 = util.split(util.split(A0_59, "//")[2], "/")[1] or ""
  end
  return L1_60
end
function login.verifyUserType(A0_61, A1_62)
  local L2_63, L3_64, L4_65
  L2_63 = db
  L2_63 = L2_63.getAttribute
  L3_64 = "Users"
  L4_65 = "UserName"
  L2_63 = L2_63(L3_64, L4_65, A0_61, "GroupId")
  L3_64 = db
  L3_64 = L3_64.getRow
  L4_65 = "UserGroups"
  L3_64 = L3_64(L4_65, "GroupId", L2_63)
  L4_65 = util
  L4_65 = L4_65.split
  L4_65 = L4_65(L3_64["UserGroups.Capabilities"], ",")
  for _FORV_8_, _FORV_9_ in pairs(L4_65) do
    if _FORV_9_ == A1_62 then
      return true
    end
  end
  return false
end
function login.verifyLogin(A0_66)
  if login.verifyUserType(A0_66, "3") or login.verifyUserType(A0_66, "4") then
    return true
  else
    return false
  end
end
function login.deleteLoginPolicyTablesOfGroup(A0_67)
  local L1_68, L2_69, L3_70, L4_71, L5_72, L6_73, L7_74, L8_75, L9_76, L10_77, L11_78, L12_79, L13_80, L14_81, L15_82
  L1_68 = true
  L2_69 = db
  L2_69 = L2_69.getRow
  L3_70 = "GroupAccessControl"
  L4_71 = "GroupId"
  L5_72 = A0_67
  L2_69 = L2_69(L3_70, L4_71, L5_72)
  if L2_69 == nil then
    L3_70 = true
    return L3_70
  end
  L3_70 = {}
  L4_71 = L2_69["GroupAccessControl._ROWID_"]
  L3_70["GroupAccessControl._ROWID_"] = L4_71
  L4_71 = db
  L4_71 = L4_71.delete
  L5_72 = "GroupAccessControl"
  L4_71 = L4_71(L5_72, L6_73)
  L1_68 = L4_71
  if not L1_68 then
    return L1_68
  end
  L4_71 = HIGH_SEC
  if L4_71 == "HIGH" then
    L4_71 = db
    L4_71 = L4_71.getRows
    L5_72 = "AccessControlUserGroupPolicyIPAddress"
    L4_71 = L4_71(L5_72, L6_73, L7_74)
    if L4_71 == nil then
      L5_72 = true
      return L5_72
    end
    L5_72 = 0
    for L9_76, L10_77 in L6_73(L7_74) do
      L5_72 = L5_72 + 1
      L11_78 = L4_71[L5_72]
      L12_79 = {}
      L13_80 = L11_78["AccessControlUserGroupPolicyIPAddress.GroupId"]
      L14_81 = db
      L14_81 = L14_81.existsRow
      L15_82 = "AccessControlUserGroupPolicyIPAddress"
      L14_81 = L14_81(L15_82, "GroupId", L13_80)
      if L14_81 then
        L12_79["AccessControlUserGroupPolicyIPAddress._ROWID_"] = L14_81
        L15_82 = db
        L15_82 = L15_82.delete
        L15_82 = L15_82("AccessControlUserGroupPolicyIPAddress", L12_79)
        L1_68 = L15_82
        if not L1_68 then
          break
        end
      end
    end
    if not L1_68 then
      return L1_68
    end
    if L6_73 == nil then
      return L7_74
    end
    for L11_78, L12_79 in L8_75(L9_76) do
      L13_80 = L6_73[L7_74]
      L14_81 = {}
      L15_82 = L13_80["AccessControlUserGroupPolicyBrowser.GroupId"]
      if db.existsRow("AccessControlUserGroupPolicyBrowser", "GroupId", L15_82) then
        L14_81["AccessConrolUserGroupPolicyBrowser._ROWID_"] = db.existsRow("AccessControlUserGroupPolicyBrowser", "GroupId", L15_82)
        L1_68 = db.delete("AccessControlUserGroupPolicyBrowser", L14_81)
        if not L1_68 then
          break
        end
      end
    end
  end
  return L1_68
end
function login.loginPolicyConfig(A0_83, A1_84, A2_85, A3_86)
  local L4_87, L5_88, L6_89, L7_90
  L4_87 = ""
  L5_88 = "0"
  L6_89 = ""
  L7_90 = ACCESS_LEVEL
  if L7_90 ~= 0 then
    L7_90 = "ACCESS_DENIED"
    return L7_90, LANG_LOCALE.ADMIN_REQD or "i18nHTMLMissing"
  end
  L7_90 = false
  if A2_85 ~= "-1" then
    L4_87 = db.getAttribute("UserGroups", "_ROWID_", A2_85, "GroupId")
    L5_88 = db.getAttribute("UserGroups", "_ROWID_", A2_85, "DefaultGroup")
    if A0_83 == "GroupAccessControl" and L4_87 == "1" and L5_88 == "1" and A1_84 ~= nil and A1_84["GroupAccessControl.DenyLogin"] == "1" then
      return "ERROR", "DENY_LOGIN_DEFAULT_ADMIN"
    end
    L6_89 = db.getAttribute(A0_83, "GroupId", L4_87, "_ROWID_")
    A1_84[A0_83 .. "GroupId"] = L4_87
  end
  if db.typeAndRangeValidate(A1_84) then
    if A3_86 == "add" then
      L7_90 = db.insert(A0_83, A1_84)
    elseif A3_86 == "edit" then
      L7_90 = db.update(A0_83, A1_84, L6_89)
    elseif A3_86 == "delete" then
      L7_90 = db.delete(A0_83, A1_84)
    end
  end
  if L7_90 then
    return "OK", "Operation Succeeded"
  else
    return "ERROR", "SSLVPN User configuration Failed"
  end
end
function login.loginPolicyBrowserDetailsGet(A0_91)
  local L1_92
  L1_92 = db
  L1_92 = L1_92.getAttribute
  L1_92 = L1_92("UserGroups", "_ROWID_", A0_91, "GroupId")
  return (db.getRows("AccessControlUserGroupPolicyBrowser", "GroupId", L1_92))
end
function login.loginPolicyIPAddressDetailsGet(A0_93)
  local L1_94
  L1_94 = db
  L1_94 = L1_94.getAttribute
  L1_94 = L1_94("UserGroups", "_ROWID_", A0_93, "GroupId")
  return (db.getRows("AccessControlUserGroupPolicyIPAddress", "GroupId", L1_94))
end
function login.loginPolicyAccessControlDetailsGet(A0_95)
  local L1_96
  L1_96 = db
  L1_96 = L1_96.getAttribute
  L1_96 = L1_96("UserGroups", "_ROWID_", A0_95, "GroupId")
  return (db.getRow("GroupAccessControl", "GroupId", L1_96))
end
function login.loginStatusGet(A0_97)
  local L1_98
  L1_98 = db
  L1_98 = L1_98.getAttribute
  L1_98 = L1_98("Users", "UserName", A0_97, "GroupId")
  if db.getRow("GroupAccessControl", "GroupId", L1_98) ~= nil then
    if db.getRow("GroupAccessControl", "GroupId", L1_98)["GroupAccessControl.DenyLogin"] == "1" and db.getRow("GroupAccessControl", "GroupId", L1_98)["GroupAccessControl.DenyLoginFromWan"] == "1" then
    elseif db.getRow("GroupAccessControl", "GroupId", L1_98)["GroupAccessControl.DenyLogin"] == "1" and db.getRow("GroupAccessControl", "GroupId", L1_98)["GroupAccessControl.DenyLoginFromWan"] == "0" then
    elseif db.getRow("GroupAccessControl", "GroupId", L1_98)["GroupAccessControl.DenyLogin"] == "0" and db.getRow("GroupAccessControl", "GroupId", L1_98)["GroupAccessControl.DenyLoginFromWan"] == "1" then
    else
    end
  end
  return "Enabled (LAN) Enabled (WAN)"
end
function login.loginBrowserPoliciesVerify(A0_99, A1_100)
  local L2_101, L3_102, L4_103, L5_104, L6_105
  L4_103 = A0_99["GroupAccessControl.GroupId"]
  L5_104 = A0_99["GroupAccessControl.LoginFromBrowser"]
  L6_105 = db
  L6_105 = L6_105.getRows
  L6_105 = L6_105("AccessControlUserGroupPolicyBrowser", "GroupId", L4_103)
  if L5_104 == "0" and L6_105 ~= nil then
    for _FORV_11_, _FORV_12_ in pairs(L6_105) do
      if string.find(A1_100, _FORV_12_["AccessControlUserGroupPolicyBrowser.ClientBrowserName"]) then
        return false
      end
    end
  end
  if L5_104 == "1" and L6_105 ~= nil then
    for _FORV_11_, _FORV_12_ in pairs(L6_105) do
      if string.find(A1_100, _FORV_12_["AccessControlUserGroupPolicyBrowser.ClientBrowserName"]) then
        return true
      end
    end
  end
  return false
end
function login.loginIpPoliciesVerify(A0_106, A1_107)
  local L2_108, L3_109, L4_110, L5_111, L6_112, L7_113
  L4_110 = true
  L5_111 = A0_106["GroupAccessControl.GroupId"]
  L6_112 = A0_106["GroupAccessControl.LoginFromIP"]
  L7_113 = db
  L7_113 = L7_113.getRows
  L7_113 = L7_113("AccessControlUserGroupPolicyIPAddress", "GroupId", L5_111)
  if L6_112 == "0" and L7_113 ~= nil then
    for _FORV_11_, _FORV_12_ in pairs(L7_113) do
      if loginLib.subnetVerify(A1_107, _FORV_12_["AccessControlUserGroupPolicyIPAddress.Address"], tonumber(_FORV_12_["AccessControlUserGroupPolicyIPAddress.MaskLength"])) == "1" then
        return false
      end
    end
    L4_110 = true
  end
  if L6_112 == "1" and L7_113 ~= nil then
    for _FORV_11_, _FORV_12_ in pairs(L7_113) do
      if loginLib.subnetVerify(A1_107, _FORV_12_["AccessControlUserGroupPolicyIPAddress.Address"], tonumber(_FORV_12_["AccessControlUserGroupPolicyIPAddress.MaskLength"])) == "1" then
        return true
      end
    end
    L4_110 = false
  end
  return L4_110
end
function login.loginAccessPoliciesVerify(A0_114, A1_115)
  local L2_116, L3_117, L4_118, L5_119
  L2_116 = "30235,11830,USER_DENY_LOGIN"
  L3_117 = db
  L3_117 = L3_117.getString
  L4_118 = L2_116
  L3_117 = L3_117(L4_118)
  L2_116 = L3_117
  L3_117 = {
    L4_118,
    L5_119,
    "WAN3"
  }
  L4_118 = "WAN1"
  L5_119 = "WAN2"
  L4_118 = 1
  L5_119 = {}
  if (A0_114["GroupAccessControl.DenyLogin"] or "0") == "1" then
    return false, L2_116.USER_DENY_LOGIN or "i18nHTMLMissing"
  end
  if (A0_114["GroupAccessControl.DenyLoginFromWan"] or "0") == "1" then
    while L4_118 < 4 do
      L5_119 = db.getRows("ipAddressTable", "LogicalIfName", L3_117[L4_118])
      if L5_119 ~= nil then
        for _FORV_13_, _FORV_14_ in pairs(L5_119) do
          if _FORV_14_["ipAddressTable.ipAddress"] == A1_115 then
            return false, L2_116["30235"] or "i18nHTMLMissing"
          end
        end
      end
      L4_118 = L4_118 + 1
    end
  end
  return true, L2_116["11830"] or "i18nHTMLMissing"
end
function login.frontDeskLogin(A0_120)
  local L1_121, L2_122, L3_123, L4_124, L5_125, L6_126, L7_127, L8_128, L9_129, L10_130, L11_131, L12_132, L13_133, L14_134, L15_135, L16_136, L17_137, L18_138, L19_139, L20_140
  L1_121 = "USER_LOGIN_INVALID_PASSWORD,USER_DENY_LOGIN_FROM_BROWSER,USER_DENY_LOGIN_FROM_IP,USER_LOGIN_USER_ALREADY_LOGGED_IN"
  L2_122 = db
  L2_122 = L2_122.getString
  L3_123 = L1_121
  L2_122 = L2_122(L3_123)
  L1_121 = L2_122
  L2_122 = A0_120["Users.UserName"]
  L3_123 = db
  L3_123 = L3_123.existsRow
  L4_124 = "Users"
  L5_125 = "UserName"
  L6_126 = A0_120["Users.UserName"]
  L3_123 = L3_123(L4_124, L5_125, L6_126)
  if not L3_123 then
    L3_123 = loginLib
    L3_123 = L3_123.logLoginEvent
    L4_124 = 1
    L5_125 = L2_122
    L3_123(L4_124, L5_125)
    L3_123 = nil
    L4_124 = L1_121.USER_LOGIN_INVALID_PASSWORD
    L4_124 = L4_124 or "i18nHTMLMissing"
    return L3_123, L4_124
  end
  L3_123 = login
  L3_123 = L3_123.verifyUserType
  L4_124 = A0_120["Users.UserName"]
  L5_125 = "12"
  L3_123 = L3_123(L4_124, L5_125)
  if not L3_123 then
    L3_123 = loginLib
    L3_123 = L3_123.logLoginEvent
    L4_124 = 2
    L5_125 = L2_122
    L3_123(L4_124, L5_125)
    L3_123 = nil
    L4_124 = "Only FrontDesk Users can login"
    return L3_123, L4_124
  end
  L3_123 = L1_121.USER_LOGIN_INVALID_PASSWORD
  L3_123 = L3_123 or "i18nHTMLMissing"
  L4_124 = loginLib
  L4_124 = L4_124.userAuthenticate
  L5_125 = A0_120["Users.UserName"]
  L6_126 = A0_120["Users.Password"]
  L4_124 = L4_124(L5_125, L6_126)
  if L4_124 == "1" then
    L5_125 = util
    L5_125 = L5_125.appendDebugOut
    L6_126 = "VALID LOGIN!<br>"
    L5_125(L6_126)
    L5_125 = loginLib
    L5_125 = L5_125.getRandom
    L5_125 = L5_125()
    L6_126 = SAPI
    L6_126 = L6_126.Request
    L6_126 = L6_126.servervariable
    L7_127 = "REMOTE_ADDR"
    L6_126 = L6_126(L7_127)
    ipaddr = L6_126
    L6_126 = SAPI
    L6_126 = L6_126.Request
    L6_126 = L6_126.servervariable
    L7_127 = "SERVER_ADDR"
    L6_126 = L6_126(L7_127)
    serverAddr = L6_126
    L6_126 = login
    L6_126 = L6_126.parseReferer
    L7_127 = os
    L7_127 = L7_127.getenv
    L8_128 = "HTTP_REFERER"
    L20_140 = L7_127(L8_128)
    L6_126 = L6_126(L7_127, L8_128, L9_129, L10_130, L11_131, L12_132, L13_133, L14_134, L15_135, L16_136, L17_137, L18_138, L19_139, L20_140, L7_127(L8_128))
    L7_127 = db
    L7_127 = L7_127.getAttribute
    L8_128 = "ipAddressTable"
    L9_129 = "LogicalIfName"
    L10_130 = "LAN"
    L11_131 = "ipAddress"
    L7_127 = L7_127(L8_128, L9_129, L10_130, L11_131)
    L8_128 = A0_120["Users.UserName"]
    L9_129 = A0_120["Login.userAgent"]
    L10_130 = db
    L10_130 = L10_130.getAttribute
    L11_131 = "Users"
    L12_132 = "UserName"
    L13_133 = L8_128
    L14_134 = "GroupId"
    L10_130 = L10_130(L11_131, L12_132, L13_133, L14_134)
    L11_131 = login
    L11_131 = L11_131.cleanUpExpired
    L11_131()
    L11_131 = "LOGGED_IN"
    L12_132 = 0
    L13_133 = nil
    L14_134 = "None"
    L15_135 = login
    L15_135 = L15_135.verifyUserType
    L16_136 = L8_128
    L17_137 = "12"
    L15_135 = L15_135(L16_136, L17_137)
    if L15_135 then
      L15_135 = login
      L15_135 = L15_135.getFrontDeskLogin
      L16_136 = L8_128
      L15_135 = L15_135(L16_136)
      L16_136 = db
      L16_136 = L16_136.getRow
      L17_137 = "GroupAccessControl"
      L18_138 = "GroupId"
      L19_139 = L10_130
      L16_136 = L16_136(L17_137, L18_138, L19_139)
      if L16_136 ~= nil then
        L17_137 = true
        L18_138 = "None"
        L19_139 = login
        L19_139 = L19_139.loginAccessPoliciesVerify
        L20_140 = L16_136
        L20_140 = L19_139(L20_140, serverAddr)
        L18_138 = L20_140
        L17_137 = L19_139
        if not L17_137 then
          L14_134 = L18_138
          L19_139 = nil
          L20_140 = L14_134
          return L19_139, L20_140
        end
        L19_139 = login
        L19_139 = L19_139.loginBrowserPoliciesVerify
        L20_140 = L16_136
        L19_139 = L19_139(L20_140, L9_129)
        if not L19_139 then
          L19_139 = L1_121.USER_DENY_LOGIN_FROM_BROWSER
          L14_134 = L19_139 or "i18nHTMLMissing"
          L19_139 = nil
          L20_140 = L14_134
          return L19_139, L20_140
        end
        L19_139 = login
        L19_139 = L19_139.loginIpPoliciesVerify
        L20_140 = L16_136
        L19_139 = L19_139(L20_140, ipaddr)
        if not L19_139 then
          L19_139 = L1_121.USER_DENY_LOGIN_FROM_IP
          L14_134 = L19_139 or "i18nHTMLMissing"
          L19_139 = nil
          L20_140 = L14_134
          return L19_139, L20_140
        end
      end
      if L15_135 then
        L11_131 = "AUTHENTICATED"
        L12_132 = 1
        L13_133 = L15_135
        L17_137 = L1_121.USER_LOGIN_USER_ALREADY_LOGGED_IN
        L14_134 = L17_137 or "i18nHTMLMissing"
      end
    end
    L15_135 = timeLib
    L15_135 = L15_135.uptime
    L16_136 = L15_135()
    L17_137 = {}
    L17_137["loginSession.username"] = L8_128
    L18_138 = ipaddr
    L17_137["loginSession.ipaddr"] = L18_138
    L17_137["loginSession.RefererValue"] = L6_126
    L17_137["loginSession.cookie"] = L5_125
    L17_137["loginSession.loginTime"] = L16_136
    L17_137["loginSession.lastAccessTime"] = L16_136
    L17_137["loginSession.loginState"] = L11_131
    if L11_131 == "LOGGED_IN" then
      L18_138 = loginLib
      L18_138 = L18_138.logLoginEvent
      L19_139 = 4
      L20_140 = L8_128
      L18_138(L19_139, L20_140)
    end
    L18_138 = "ipaddr = '"
    L19_139 = ipaddr
    L20_140 = "' AND cookie = '"
    L18_138 = L18_138 .. L19_139 .. L20_140 .. L5_125 .. "'"
    L19_139 = db
    L19_139 = L19_139.existsRowWhere
    L20_140 = "loginSession"
    L19_139 = L19_139(L20_140, L18_138)
    L20_140 = false
    db.beginTransaction()
    if L19_139 then
      L20_140 = db.update("loginSession", L17_137, L19_139)
      creatRefEntry(L5_125)
    else
      L20_140 = db.insert("loginSession", L17_137)
      creatRefEntry(L5_125)
    end
    if L20_140 then
      db.commitTransaction(true)
    else
      db.rollback()
    end
    cgilua.cookies.set("TeamF1Login", L5_125)
    if login.verifyUserType(L8_128, "12") then
      ACCESS_LEVEL = 2
    else
      ACCESS_LEVEL = 1
    end
    return L12_132, L14_134, A0_120
  else
    L5_125 = nil
    L6_126 = L3_123
    return L5_125, L6_126
  end
end
function login.getFrontDeskLogin(A0_141)
  if db.getRow("loginSession", "username", A0_141) ~= nil then
    if login.verifyUserType(A0_141, "12") and db.getRow("loginSession", "username", A0_141)["loginSession.loginState"] == "LOGGED_IN" then
      return (db.getRow("loginSession", "username", A0_141))
    else
      return nil
    end
  else
    return nil
  end
end
function creatRefEntry(A0_142)
  local L1_143, L2_144, L3_145, L4_146, L5_147
  L1_143 = os
  L1_143 = L1_143.getenv
  L2_144 = "HTTP_REFERER"
  L1_143 = L1_143(L2_144)
  L2_144 = {}
  if L1_143 == nil then
    L3_145 = HOME_PAGE
    pageToGoTo = L3_145
  elseif L1_143 ~= nil then
    L3_145 = util
    L3_145 = L3_145.split
    L4_146 = L1_143
    L5_147 = "//"
    L3_145 = L3_145(L4_146, L5_147)
    if L3_145 ~= false then
      L4_146 = L3_145[2]
      if L4_146 ~= nil then
        L4_146 = util
        L4_146 = L4_146.split
        L5_147 = L3_145[2]
        L4_146 = L4_146(L5_147, "/")
        L5_147 = string
        L5_147 = L5_147.find
        L5_147 = L5_147(L4_146[1], "%]")
        if L5_147 == nil then
          portPresent = string.find(L4_146[1], ":")
          if portPresent ~= nil and portPresent > 0 then
            L2_144 = util.split(L4_146[1], ":")
          else
            L2_144 = L4_146
          end
        else
          portPresent = string.find(L4_146[1], ":", L5_147)
          if portPresent ~= nil and portPresent > 0 then
            L2_144 = util.split(L4_146[1], "]")
          else
            L2_144 = L4_146
          end
        end
      end
    end
  end
  L3_145 = string
  L3_145 = L3_145.gsub
  L4_146 = L2_144[1]
  L5_147 = "%["
  L3_145 = L3_145(L4_146, L5_147, "")
  L4_146 = string
  L4_146 = L4_146.gsub
  L5_147 = L3_145
  L4_146 = L4_146(L5_147, "%]", "")
  L5_147 = io
  L5_147 = L5_147.open
  L5_147 = L5_147(_UPVALUE0_ .. A0_142, "w")
  L5_147:write(L4_146)
  L5_147:close()
end
