HEY HEY HEY
HEY HEY HEY
local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35, L36_36
L0_0 = require
L1_1 = "teamf1lualib/db"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/stats_db"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/web"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/login"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/util"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/factDef"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/I18N"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/pkgMgmt"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/captivePortal"
L0_0(L1_1)
L0_0 = require
L1_1 = "cgilua.cookies"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/pageListAccess"
L0_0(L1_1)
L0_0 = require
L1_1 = "captivePortalLib"
L0_0(L1_1)
L0_0 = require
L1_1 = "validationsLuaLib"
L0_0(L1_1)
L0_0 = "WAN1"
L1_1 = "WAN2"
L2_2 = {}
configRow = L2_2
L2_2 = "-1"
configRowId = L2_2
L2_2 = "NONE"
statusCode = L2_2
L2_2 = ""
statusMessage = L2_2
L2_2 = "OK"
errorFlag = L2_2
L2_2 = false
rebootFlag = L2_2
L2_2 = -2
status = L2_2
L2_2 = ""
FullName = L2_2
L2_2 = {}
SplitParts = L2_2
L2_2 = ""
Page = L2_2
L2_2 = ""
Action = L2_2
L2_2 = "0"
menuNumber = L2_2
L2_2 = "0"
pageId = L2_2
L2_2 = ""
logicalIntName = L2_2
L2_2 = ""
addrFamily = L2_2
L2_2 = ""
urlStr = L2_2
L2_2 = ""
spUrlStr = L2_2
L2_2 = false
isDynLnk = L2_2
L2_2 = ""
vsignUser = L2_2
L2_2 = "0"
vsignRetryCount = L2_2
L2_2 = ""
ButtonType = L2_2
L2_2 = ""
DBTable = L2_2
L2_2 = ""
NextPage = L2_2
L2_2 = "0"
RowId = L2_2
L2_2 = ""
ButtonValue = L2_2
L2_2 = "/tmp/referer/"
L3_3 = "index.html"
HOME_PAGE = L3_3
L3_3 = "sslVpnRedirect.htm"
SSL_PORTAL_PAGE = L3_3
L3_3 = "portalLogin.html"
SSL_PORTAL_LOGIN_PAGE = L3_3
L3_3 = "verisignAuthentication.htm"
VSIGN_AUTH_PAGE = L3_3
L3_3 = "helpVerisignAuthentication.htm"
HELP_VSIGN_AUTH_PAGE = L3_3
L3_3 = "helpIndex.htm"
HELP_INDEX_PAGE = L3_3
L3_3 = "platform.lua"
PLATFORM_PAGE = L3_3
L3_3 = "forcedLogin.html"
FORCED_LOGIN_PAGE = L3_3
L3_3 = "omnisslForcedLogin.html"
OMNISSL_FORCED_LOGIN_PAGE = L3_3
L3_3 = "billingDeskForcedLogin.html"
FRONTDESK_FORCED_LOGIN_PAGE = L3_3
L3_3 = "sslvpnForcedLogin.html"
SSLVPN_FORCED_LOGIN_PAGE = L3_3
L3_3 = "userPortal/portalHelp.htm"
SSLVPN_PORTAL_HELP_PAGE = L3_3
L3_3 = "statusPage.htm"
REBOOT_PAGE = L3_3
L3_3 = "errorPage.html"
ERROR_PAGE = L3_3
L3_3 = "en_US"
LANGUAGE = L3_3
L3_3 = ""
SETTINGS_FILE = L3_3
L3_3 = "/tmp/system.db"
DB_FILE_NAME = L3_3
L3_3 = "/tmp/stats.db"
STATS_DB_FILE_NAME = L3_3
L3_3 = "blocked.html"
BLOCKED_PAGE = L3_3
L3_3 = "deny.html"
DENY_PAGE = L3_3
L3_3 = "OmniSSLPortalLogin.html"
OMNISSLPORTAL_PAGE = L3_3
L3_3 = "omniSslPackage.html"
OMNISSLPACKAGE_PAGE = L3_3
L3_3 = "ovpnLinuxClientConfig.lua"
OVPN_LINUX_CONFIG = L3_3
L3_3 = "ovpnWinClientConfig.lua"
OVPN_WIN_CONFIG = L3_3
L3_3 = "ovpnAndroidClientConfig.lua"
OVPN_ANDROID_CONFIG = L3_3
L3_3 = "ovpniPadClientConfig.lua"
OVPN_IPAD_CONFIG = L3_3
L3_3 = "ovpnMacOsClientConfig.lua"
OVPN_MAC_CONFIG = L3_3
L3_3 = "captivePortal.html"
RUNTIME_LOGIN_PAGE = L3_3
L3_3 = "fbWifiLogin.html"
RUNTIME_FBWIFI_LOGIN_PAGE = L3_3
L3_3 = "mcaptivePortal.html"
MOB_RUNTIME_LOGIN_PAGE = L3_3
L3_3 = "HIGH"
HIGH_SEC = L3_3
L3_3 = "443"
SSLVPN_PORT = L3_3
L3_3 = "n"
LIGHTTPD_SUPPORT = L3_3
L3_3 = "0"
REBOOT_REASON = L3_3
L3_3 = "clickConnectionWizard.htm"
DCC_WIZARD_PAGE = L3_3
L3_3 = "approvedCategory.html"
CAT_FILTERING = L3_3
L3_3 = "userPortal/portalHelp.htm"
PORTAL_HELP_PAGE = L3_3
L3_3 = "dbglog.lua"
DBGLOG_PAGE = L3_3
L3_3 = "omniSSLShowHelp.html"
OMNISSL_SHOWHELP_PAGE = L3_3
L3_3 = "omniSSLGetHelp.html"
OMNISSL_GETHELP_PAGE = L3_3
L3_3 = "blockedSession.html"
SESSIONLIMIT_WARN = L3_3
L3_3 = "I.E 9+, Firefox 20+, Chrome 25+, Safari 5+"
SUPPORTED_BROWSER = L3_3
L3_3 = "HIGH"
HIGH_SEC_LEVEL = L3_3
L3_3 = "LOW"
LOW_SEC_LEVEL = L3_3
L3_3 = -1
ACCESS_LEVEL = L3_3
L3_3 = ""
HELP_TEXT_PATH = L3_3
L3_3 = cgi
L3_3 = L3_3["Users.UserName"]
LOGGED_IN_USER = L3_3
L3_3 = ""
LANG_LOCALE = L3_3
L3_3 = "mynas.local"
MYNAS_DOMAIN = L3_3
L3_3 = "mygateway"
MYGATEWAY = L3_3
L3_3 = "WAN1"
L4_4 = "WAN2"
L5_5 = "WAN3"
L6_6 = io
L6_6 = L6_6.open
L7_7 = "/flash/tmp/lang.txt"
L8_8 = "r"
L6_6 = L6_6(L7_7, L8_8)
L8_8 = L6_6
L7_7 = L6_6.read
L9_9 = "*line"
L7_7 = L7_7(L8_8, L9_9)
langId = L7_7
L7_7 = langId
if L7_7 ~= nil then
  L7_7 = langId
elseif L7_7 == "" then
  L7_7 = "en_US"
  langId = L7_7
end
L7_7 = "/tmp/"
L8_8 = langId
L9_9 = ".db"
L7_7 = L7_7 .. L8_8 .. L9_9
langString = L7_7
L7_7 = db
L7_7 = L7_7.connect
L8_8 = DB_FILE_NAME
L7_7(L8_8)
L7_7 = db
L7_7 = L7_7.execute
L8_8 = "ATTACH '"
L9_9 = langString
L10_10 = "' as langDB"
L8_8 = L8_8 .. L9_9 .. L10_10
L7_7(L8_8)
L7_7 = stats_db
L7_7 = L7_7.connect
L8_8 = STATS_DB_FILE_NAME
L7_7(L8_8)
L7_7 = db
L7_7 = L7_7.getAttribute
L8_8 = "environment"
L9_9 = "name"
L10_10 = "TEAMF1_CFG_ASCII"
L11_11 = "value"
L7_7 = L7_7(L8_8, L9_9, L10_10, L11_11)
SETTINGS_FILE = L7_7
L7_7 = db
L7_7 = L7_7.getAttribute
L8_8 = "unitInfo"
L9_9 = "_ROWID_"
L10_10 = "1"
L11_11 = "modelId"
L7_7 = L7_7(L8_8, L9_9, L10_10, L11_11)
L7_7 = L7_7 or ""
UNIT_NAME = L7_7
L7_7 = db
L7_7 = L7_7.getAttribute
L8_8 = "unitInfo"
L9_9 = "_ROWID_"
L10_10 = "1"
L11_11 = "hardwareVersion"
L7_7 = L7_7(L8_8, L9_9, L10_10, L11_11)
L7_7 = L7_7 or ""
HW_VERSION = L7_7
L7_7 = HW_VERSION
HW_VER = L7_7
L7_7 = UNIT_NAME
L8_8 = "_"
L9_9 = db
L9_9 = L9_9.getAttribute
L10_10 = "hwFamilyInfo"
L11_11 = "_ROWID_"
L12_12 = "1"
L13_13 = "hwFamilyName"
L9_9 = L9_9(L10_10, L11_11, L12_12, L13_13)
L7_7 = L7_7 .. L8_8 .. L9_9
PRODUCT_ID = L7_7
L7_7 = db
L7_7 = L7_7.getAttribute
L8_8 = "webBrandingTags"
L9_9 = "_ROWID_"
L10_10 = "1"
L11_11 = "companyName"
L7_7 = L7_7(L8_8, L9_9, L10_10, L11_11)
L7_7 = L7_7 or ""
COMPANY_NAME = L7_7
L7_7 = db
L7_7 = L7_7.getAttribute
L8_8 = "webBrandingTags"
L9_9 = "_ROWID_"
L10_10 = "1"
L11_11 = "copyright"
L7_7 = L7_7(L8_8, L9_9, L10_10, L11_11)
L7_7 = L7_7 or ""
COPYRIGHTS = L7_7
L7_7 = "&#169; 2009 Trend Micro Incorporated. All rights reserved."
COPYRIGHTS_TRENDMICRO = L7_7
L7_7 = db
L7_7 = L7_7.getAttribute
L8_8 = "webBrandingTags"
L9_9 = "_ROWID_"
L10_10 = "1"
L11_11 = "webAddress"
L7_7 = L7_7(L8_8, L9_9, L10_10, L11_11)
L7_7 = L7_7 or ""
WEB_ADDRESS = L7_7
L7_7 = db
L7_7 = L7_7.getAttribute
L8_8 = "webBrandingTags"
L9_9 = "_ROWID_"
L10_10 = "1"
L11_11 = "supportLink"
L7_7 = L7_7(L8_8, L9_9, L10_10, L11_11)
L7_7 = L7_7 or ""
SUPPORT_LINK = L7_7
L7_7 = db
L7_7 = L7_7.getAttribute
L8_8 = "webBrandingTags"
L9_9 = "_ROWID_"
L10_10 = "1"
L11_11 = "prodFamily"
L7_7 = L7_7(L8_8, L9_9, L10_10, L11_11)
L7_7 = L7_7 or ""
PRODUCT_FAMILY = L7_7
L7_7 = db
L7_7 = L7_7.getAttribute
L8_8 = "webBrandingTags"
L9_9 = "_ROWID_"
L10_10 = "1"
L11_11 = "appName"
L7_7 = L7_7(L8_8, L9_9, L10_10, L11_11)
L7_7 = L7_7 or ""
APP_NAME = L7_7
L7_7 = db
L7_7 = L7_7.getAttribute
L8_8 = "system"
L9_9 = "_ROWID_"
L10_10 = "1"
L11_11 = "firmwarePri"
L7_7 = L7_7(L8_8, L9_9, L10_10, L11_11)
L7_7 = L7_7 or ""
VERSION = L7_7
L7_7 = db
L7_7 = L7_7.getAttribute
L8_8 = "webBrandingTags"
L9_9 = "_ROWID_"
L10_10 = "1"
L11_11 = "tradeMark"
L7_7 = L7_7(L8_8, L9_9, L10_10, L11_11)
L7_7 = L7_7 or ""
REG_TM = L7_7
L7_7 = db
L7_7 = L7_7.getAttribute
L8_8 = "webBrandingTags"
L9_9 = "_ROWID_"
L10_10 = "1"
L11_11 = "webAddress"
L7_7 = L7_7(L8_8, L9_9, L10_10, L11_11)
L7_7 = L7_7 or ""
WEB_LINK = L7_7
L7_7 = db
L7_7 = L7_7.getAttribute
L8_8 = "webBrandingTags"
L9_9 = "_ROWID_"
L10_10 = "1"
L11_11 = "unitName"
L7_7 = L7_7(L8_8, L9_9, L10_10, L11_11)
if not L7_7 then
  L7_7 = db
  L7_7 = L7_7.getAttribute
  L8_8 = "UDIInfo"
  L9_9 = "_ROWID_"
  L10_10 = "1"
  L11_11 = "udi"
  L7_7 = L7_7(L8_8, L9_9, L10_10, L11_11)
  L7_7 = L7_7 or ""
end
UNIT_INFO = L7_7
L7_7 = db
L7_7 = L7_7.getAttribute
L8_8 = "hwFamilyInfo"
L9_9 = "_ROWID_"
L10_10 = "1"
L11_11 = "hwFamilyName"
L7_7 = L7_7(L8_8, L9_9, L10_10, L11_11)
L7_7 = L7_7 or ""
HW_SER = L7_7
L7_7 = "LogicalIfName='LAN' and AddressFamily=2"
L8_8 = db
L8_8 = L8_8.getRowWhere
L9_9 = "ipAddressTable"
L10_10 = L7_7
L8_8 = L8_8(L9_9, L10_10)
L9_9 = L8_8["ipAddressTable.ipAddress"]
wirelessCtrlIp = L9_9
L9_9 = io
L9_9 = L9_9.open
L10_10 = "/etc/security_level.conf"
L11_11 = "r"
L9_9 = L9_9(L10_10, L11_11)
if L9_9 then
  L11_11 = L9_9
  L10_10 = L9_9.read
  L12_12 = "*all"
  L10_10 = L10_10(L11_11, L12_12)
  L10_10 = L10_10 or "HIGH"
  HIGH_SEC = L10_10
  L10_10 = string
  L10_10 = L10_10.find
  L11_11 = HIGH_SEC
  L12_12 = "HIGH"
  L10_10 = L10_10(L11_11, L12_12)
  if L10_10 then
    L10_10 = "HIGH"
    HIGH_SEC = L10_10
    L10_10 = "WW"
    COUNTRY_CODE = L10_10
  else
    L10_10 = "LOW"
    HIGH_SEC = L10_10
    L10_10 = "RU"
    COUNTRY_CODE = L10_10
  end
  L11_11 = L9_9
  L10_10 = L9_9.close
  L10_10(L11_11)
end
L10_10 = HIGH_SEC
if L10_10 == "HIGH" then
  L10_10 = require
  L11_11 = "teamf1lualib/openvpn"
  L10_10(L11_11)
end
L10_10 = cgi
L10_10 = L10_10.page
if L10_10 ~= "headerMenuDyn.html" then
  L10_10 = cgi
  L10_10 = L10_10.page
  if L10_10 ~= "jsOnlyStringsDyn.html" then
    L10_10 = cgi
    L10_10 = L10_10.page
    if L10_10 ~= "wizardLanguageStringsDyn.html" then
      L10_10 = cgi
      L10_10 = L10_10.page
    end
  end
elseif L10_10 == "" then
  L10_10 = cgilua
  L10_10 = L10_10.lp
  L10_10 = L10_10.include
  L11_11 = cgi
  L11_11 = L11_11.page
  L10_10(L11_11)
  return
end
L10_10 = util
L10_10 = L10_10.appendDebugOut
L11_11 = "<br>SECURITY SET IS : "
L12_12 = HIGH_SEC
L11_11 = L11_11 .. L12_12
L10_10(L11_11)
L10_10 = io
L10_10 = L10_10.open
L11_11 = "/etc/include_lighttpd.conf"
L12_12 = "r"
L10_10 = L10_10(L11_11, L12_12)
if L10_10 then
  L12_12 = L10_10
  L11_11 = L10_10.read
  L13_13 = "*all"
  L11_11 = L11_11(L12_12, L13_13)
  LIGHTTPD_SUPPORT = L11_11
  L11_11 = string
  L11_11 = L11_11.find
  L12_12 = LIGHTTPD_SUPPORT
  L13_13 = "INCLUDE_LIGHTTPD"
  L11_11 = L11_11(L12_12, L13_13)
  if L11_11 then
    L11_11 = "y"
    LIGHTTPD_SUPPORT = L11_11
  end
  L12_12 = L10_10
  L11_11 = L10_10.close
  L11_11(L12_12)
end
L11_11 = util
L11_11 = L11_11.setDebugStatus
L12_12 = false
L11_11(L12_12)
L11_11 = util
L11_11 = L11_11.setOutputStatus
L12_12 = false
L11_11(L12_12)
L11_11 = UNIT_NAME
if L11_11 == "DSR-150N" then
  L11_11 = db
  L11_11 = L11_11.getAttribute
  L12_12 = "Users"
  L13_13 = "UserName"
  L14_14 = "admin"
  L15_15 = "Password"
  L11_11 = L11_11(L12_12, L13_13, L14_14, L15_15)
  L12_12 = SAPI
  L12_12 = L12_12.Request
  L12_12 = L12_12.servervariable
  L13_13 = "HTTP_HOST"
  L12_12 = L12_12(L13_13)
  if L12_12 == "mydsr150n.dlink.com" and L11_11 == "admin" then
    L13_13 = {}
    L13_13["Users.Password"] = "admin"
    L13_13["Users.UserName"] = "admin"
    L13_13["Login.userAgent"] = "DCC"
    L14_14 = login
    L14_14 = L14_14.login
    L15_15 = L13_13
    L15_15 = L14_14(L15_15)
    if L14_14 == 1 then
      L16_16 = "AUTHENTICATED"
      L17_17 = login
      L17_17 = L17_17.getAdminLogin
      L18_18 = L13_13["Users.UserName"]
      L17_17 = L17_17(L18_18)
      L18_18 = 1
      while true do
        if L17_17 then
          L19_19 = L17_17[L18_18]
        end
        if L19_19 ~= nil then
          L19_19 = db
          L19_19 = L19_19.setAttribute
          L20_20 = "loginSession"
          L19_19(L20_20, L21_21, L22_22, L23_23, L24_24)
          L19_19 = db
          L19_19 = L19_19.setAttribute
          L20_20 = "loginSession"
          L36_36 = L24_24(L25_25)
          L19_19(L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35, L36_36, L24_24(L25_25))
          L19_19 = 1
          L18_18 = L18_18 + L19_19
        end
      end
      L19_19 = "ipaddr = '"
      L20_20 = SAPI
      L20_20 = L20_20.Request
      L20_20 = L20_20.servervariable
      L20_20 = L20_20(L21_21)
      L19_19 = L19_19 .. L20_20 .. L21_21 .. L22_22 .. L23_23
      L20_20 = db
      L20_20 = L20_20[L21_21]
      L20_20(L21_21, L22_22, L23_23, L24_24)
      L20_20 = db
      L20_20 = L20_20[L21_21]
      L36_36 = L24_24()
      L20_20(L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35, L36_36, L24_24())
    end
    L16_16 = DCC_WIZARD_PAGE
    HOME_PAGE = L16_16
  end
end
L11_11 = HOME_PAGE
L12_12 = false
L13_13 = os
L14_14 = "getenv"
L13_13 = L13_13[L14_14]
L14_14 = "HTTP_REFERER"
L13_13 = L13_13(L14_14)
L14_14 = os
L15_15 = "getenv"
L14_14 = L14_14[L15_15]
L15_15 = "REQUEST_METHOD"
L14_14 = L14_14(L15_15)
L15_15 = os
L16_16 = "getenv"
L15_15 = L15_15[L16_16]
L16_16 = "HTTP_USER_AGENT"
L15_15 = L15_15(L16_16)
L16_16 = os
L17_17 = "getenv"
L16_16 = L16_16[L17_17]
L17_17 = "HTTP_HOST"
L16_16 = L16_16(L17_17)
L17_17 = cgi
L17_17 = L17_17.page
L18_18 = nil
if L17_17 ~= L18_18 then
  L17_17 = cgi
  L17_17 = L17_17.page
  if L17_17 ~= "" then
    L17_17 = nil
    if L13_13 ~= L17_17 and L13_13 ~= "" then
      L17_17 = string
      L17_17 = L17_17.find
      L18_18 = L13_13
      L19_19 = "activeVpn.htm"
      L17_17 = L17_17(L18_18, L19_19)
      L18_18 = string
      L18_18 = L18_18.find
      L19_19 = L13_13
      L20_20 = "wirelessClients.htm"
      L18_18 = L18_18(L19_19, L20_20)
      if L17_17 then
        L19_19 = string
        L19_19 = L19_19.find
        L20_20 = cgi
        L20_20 = L20_20.page
        L19_19 = L19_19(L20_20, L21_21)
        L20_20 = nil
      else
        if L19_19 ~= L20_20 then
          if L18_18 then
            L19_19 = string
            L19_19 = L19_19.find
            L20_20 = cgi
            L20_20 = L20_20.page
            L19_19 = L19_19(L20_20, L21_21)
            L20_20 = nil
          end
      end
      elseif L19_19 == L20_20 then
        L19_19 = io
        L19_19 = L19_19.open
        L20_20 = "/tmp/redirectCounter"
        L19_19 = L19_19(L20_20, L21_21)
        if L19_19 then
          L20_20 = L19_19[L22_22]
          L20_20(L21_21, L22_22)
          L20_20 = L19_19.close
          L20_20(L21_21)
        end
        L20_20 = io
        L20_20 = L20_20.open
        L20_20 = L20_20(L21_21, L22_22)
        if L20_20 then
          L21_21(L22_22, L23_23)
          L21_21(L22_22)
        end
      end
      L19_19 = nil
      if L17_17 == L19_19 then
        L19_19 = nil
        if L18_18 == L19_19 then
          L19_19 = io
          L19_19 = L19_19.open
          L20_20 = "/tmp/redirectCounter"
          L19_19 = L19_19(L20_20, L21_21)
          if L19_19 then
            L20_20 = L19_19[L22_22]
            L20_20(L21_21, L22_22)
            L20_20 = L19_19.close
            L20_20(L21_21)
          end
        end
      end
    end
  end
end
function L17_17(A0_37)
  local L1_38
  L1_38 = SESSIONLIMIT_WARN
  return L1_38
end
checkHttpsSlRedirect = L17_17
L17_17 = tonumber
L18_18 = io
L19_19 = "popen"
L18_18 = L18_18[L19_19]
L19_19 = "/pfrm2.0/bin/conntrack -L -p tcp -s "
L20_20 = SAPI
L20_20 = L20_20.Request
L20_20 = L20_20.servervariable
L20_20 = L20_20(L21_21)
L19_19 = L19_19 .. L20_20 .. L21_21
L18_18 = L18_18(L19_19)
L19_19 = L18_18
L18_18 = L18_18.read
L20_20 = "*a"
L36_36 = L18_18(L19_19, L20_20)
L17_17 = L17_17(L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35, L36_36, L18_18(L19_19, L20_20))
L18_18 = tonumber
L19_19 = io
L20_20 = "popen"
L19_19 = L19_19[L20_20]
L20_20 = "/pfrm2.0/bin/conntrack -L -p tcp -s "
L20_20 = L20_20 .. L21_21 .. L22_22
L19_19 = L19_19(L20_20)
L20_20 = L19_19
L19_19 = L19_19.read
L36_36 = L19_19(L20_20, L21_21)
L18_18 = L18_18(L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35, L36_36, L19_19(L20_20, L21_21))
L19_19 = L17_17 + L18_18
L20_20 = 0
if L19_19 > L20_20 then
  L20_20 = SAPI
  L20_20 = L20_20.Request
  L20_20 = L20_20.servervariable
  L20_20 = L20_20(L21_21)
  L16_16 = L20_20
  L20_20 = nil
  if L16_16 ~= L20_20 then
    L20_20 = nil
    if L22_22 == L23_23 then
      L7_7 = L22_22 .. L23_23 .. L24_24
      L20_20 = L22_22
    else
      for L28_28, L29_29 in L25_25(L26_26) do
        L33_33 = "ipv4IsIPinSameNetwork"
        L33_33 = L22_22
        L34_34 = L31_31
        L35_35 = L30_30
        L36_36 = L31_31
        L33_33 = L32_32(L33_33, L34_34, L35_35, L36_36)
        L34_34 = 0
        if L32_32 == L34_34 then
          L34_34 = "ipAddressTable.LogicalIfName"
          L20_20 = L29_29[L34_34]
          break
        end
      end
    end
    if L20_20 ~= L22_22 and L20_20 ~= L3_3 and L20_20 ~= L4_4 and L20_20 ~= L5_5 then
      if L21_21 ~= L22_22 and L16_16 ~= L21_21 then
        if L22_22 ~= L23_23 then
          if L23_23 == L24_24 then
            L23_23(L24_24)
          else
            L23_23(L24_24)
          end
          return
        end
      end
    end
  end
end
function L20_20()
  local L0_39, L1_40
  L0_39 = UNIT_NAME
  if L0_39 ~= "DSR-1000AC" then
    L0_39 = UNIT_NAME
    if L0_39 ~= "DSR-1000N" then
      L0_39 = UNIT_NAME
      if L0_39 ~= "DSR-500AC" then
        L0_39 = UNIT_NAME
        if L0_39 ~= "DSR-500N" then
          L0_39 = UNIT_NAME
          if L0_39 ~= "DSR-1000" then
            L0_39 = UNIT_NAME
          end
        end
      end
    end
  elseif L0_39 == "DSR-500" then
    L0_39 = true
    return L0_39
  end
  L0_39 = false
  return L0_39
end
isCaptivePortalSupportedUnit = L20_20
function L20_20()
  if io.open("/var/ips_status", "r") then
    io.open("/var/ips_status", "r"):close()
  end
  if (io.open("/var/ips_status", "r"):read("*line") or "") == "enabled" then
    return true
  else
    return false
  end
end
vpnLicenseStatusGet = L20_20
function L20_20()
  if io.open("/var/wcf_status", "r") then
    io.open("/var/wcf_status", "r"):close()
    if (io.open("/var/wcf_status", "r"):read("*line") or "") == "enabled" then
      return true
    else
      return false
    end
  else
    return false
  end
end
wcfLicenseStatusGet = L20_20
L20_20 = wcfLicenseStatusGet
L20_20 = L20_20()
WCF_LICENCE_STATUS = L20_20
function L20_20()
  if UNIT_INFO ~= "DWC-1000" then
    return "no"
  elseif io.open("/pfrm2.0/bin/licensePageList", "r") then
    line = io.open("/pfrm2.0/bin/licensePageList", "r"):read("*all")
    if line:find(":" .. _UPVALUE0_ .. ":") and not vpnLicenseStatusGet() then
      return "yes"
    else
      return "no"
    end
  end
end
dlinkLicenseCheck = L20_20
L20_20 = {
  L21_21,
  L22_22,
  L23_23,
  L24_24,
  L25_25,
  L26_26,
  L27_27,
  L28_28,
  L29_29,
  L30_30,
  L31_31,
  L32_32,
  L33_33,
  L34_34,
  L35_35,
  L36_36,
  "j2me",
  "java",
  "midp",
  "mini",
  "mmp",
  "mobi",
  "motorola",
  "nec",
  "nokia",
  "palm",
  "panasonic",
  "philips",
  "phone",
  "sagem",
  "sharp",
  "sie",
  "smartphone",
  "sony",
  "symbian",
  "t-mobile",
  "telus",
  "up.browser",
  "up.link",
  "vodafone",
  "wap",
  "webos",
  "wireless",
  "xda",
  "xoom",
  "zte"
}
L29_29 = "docomo"
L33_33 = "iphone"
L34_34 = "ipad"
L35_35 = "ipaq"
L36_36 = "ipod"
if L15_15 then
  L15_15 = L21_21
  for L24_24, L25_25 in L21_21(L22_22) do
    for L29_29 in L26_26(L27_27, L28_28) do
      if L29_29 == L25_25 then
        ismobile = L30_30
        break
      end
    end
  end
end
checkHttpsRedirectCp = L21_21
if L21_21 ~= L22_22 then
  if L21_21 ~= L22_22 then
    if L21_21 ~= L22_22 then
      if L21_21 ~= L22_22 then
        if L21_21 ~= L22_22 then
        end
      end
    end
  end
elseif L21_21 == L22_22 then
  L16_16 = L21_21
  if L16_16 ~= L21_21 then
    if L21_21 == "HIGH" then
      if L21_21 ~= L3_3 and L21_21 ~= L4_4 then
        if L22_22 ~= L24_24 then
          if L23_23 == "1" then
            L24_24(L25_25)
          else
            L24_24(L25_25)
          end
          return
        end
      end
    end
  end
end
checkOmniSSLPage = L21_21
if L21_21 then
  L21_21[L22_22] = L23_23
end
if L21_21 > L22_22 then
  if L22_22 ~= L24_24 then
    Page = L24_24
    FullName = L21_21
    SplitParts = L22_22
    ButtonType = L24_24
    if L24_24 == L25_25 then
      NextPage = L24_24
    else
      DBTable = L24_24
      NextPage = L24_24
    end
    if L24_24 >= L25_25 then
      RowId = L24_24
    end
    ButtonValue = L24_24
    if L24_24 ~= "" then
      L11_11 = Page
    end
  elseif L24_24 then
    L12_12 = true
    L11_11 = L24_24 .. L25_25
  elseif L24_24 then
    L11_11 = L24_24.page
  end
end
if L22_22 ~= "0" then
else
  if L22_22 == L23_23 then
    L11_11 = ERROR_PAGE
    host_ip = L22_22
    if L22_22 == L23_23 then
      L22_22(L23_23)
    else
      L22_22(L23_23)
    end
end
else
  if L23_23 ~= L24_24 then
    L29_29 = "sslVpnResources.html"
    L33_33 = "openVpnLocalNetworks.html"
    L34_34 = "openVpnRemoteNetworks.html"
    L35_35 = "openVpnSettings.html"
  else
    if L23_23 ~= L24_24 then
      if L23_23 ~= L24_24 then
        if L23_23 ~= L24_24 then
        end
      end
    elseif L23_23 == L24_24 then
      L29_29 = "radioConfig.html"
      L33_33 = "wds5GHz.html"
      L34_34 = "advancedWireless.html"
      L35_35 = "advancedWireless5GHz.html"
      L36_36 = "wps.html"
    end
    if L23_23 ~= L24_24 then
      if L23_23 ~= L24_24 then
        if L23_23 ~= "DSR-150N" then
        end
      end
    elseif L23_23 == L24_24 then
      L23_23(L24_24, L25_25)
      L23_23(L24_24, L25_25)
      L23_23(L24_24, L25_25)
      L23_23(L24_24, L25_25)
      L23_23(L24_24, L25_25)
      L23_23(L24_24, L25_25)
      L23_23(L24_24, L25_25)
      L23_23(L24_24, L25_25)
      L23_23(L24_24, L25_25)
      L23_23(L24_24, L25_25)
      if L23_23 ~= "DSR-150N" then
      elseif L23_23 == L24_24 then
        L23_23(L24_24, L25_25)
        L23_23(L24_24, L25_25)
      end
    end
    if L23_23 ~= L24_24 then
      if L23_23 ~= L24_24 then
        if L23_23 ~= L24_24 then
        end
      end
    elseif L23_23 == L24_24 then
      L23_23(L24_24, L25_25)
    end
  end
  for L26_26, L27_27 in L23_23(L24_24) do
    if L21_21 == L27_27 then
      L11_11 = HOME_PAGE
    end
  end
end
if L22_22 then
  if L22_22 == L23_23 then
    L11_11 = ERROR_PAGE
  end
end
if L22_22 == L23_23 then
  if L24_24 == L25_25 then
    statusMessage = L25_25
  end
  if not L25_25 then
    L29_29 = "'"
    L29_29 = "3"
    if L27_27 then
      ACCESS_LEVEL = L27_27
    end
  end
  if L25_25 ~= L26_26 then
    L12_12 = false
    L29_29 = LANGUAGE
    statusMessage = L25_25
    L11_11 = HOME_PAGE
    L25_25[L26_26] = ""
  end
end
if L22_22 == "HIGH" then
  if L22_22 ~= L23_23 then
    if L22_22 ~= L23_23 then
      if L22_22 ~= L23_23 then
        if L22_22 ~= L23_23 then
        end
      end
    end
  elseif L22_22 == L23_23 then
    if L24_24 == L25_25 then
      statusMessage = L25_25
    end
    L29_29 = "'"
    if L24_24 == "OK" then
      L29_29 = "_ROWID_"
      if L27_27 == "0" then
        L29_29 = "verifyUserType"
        L29_29 = "OpenvpnSession.username"
        L29_29 = L26_26[L29_29]
        if L28_28 then
          ACCESS_LEVEL = L28_28
        end
      else
        ACCESS_LEVEL = L28_28
      end
    end
    if L27_27 ~= L28_28 then
      L12_12 = false
      if L24_24 == "DISCONNECTED" then
        statusMessage = L27_27
      else
        L29_29 = "stringId"
        statusMessage = L27_27
      end
      L11_11 = OMNISSLPORTAL_PAGE
      L27_27[L28_28] = ""
    end
  end
end
if L22_22 == L23_23 then
  L11_11 = HOME_PAGE
elseif L22_22 == L23_23 then
  L11_11 = HOME_PAGE
elseif L22_22 == L23_23 then
  if L11_11 ~= L23_23 then
    if L11_11 ~= L23_23 then
      if L13_13 ~= L23_23 then
        if L23_23 ~= L24_24 then
          if L24_24 ~= L25_25 then
            if L25_25 == L26_26 then
              portPresent = L26_26
              if L26_26 ~= L27_27 then
                if L26_26 > L27_27 then
                  ipAddr2 = L26_26
                end
              else
                ipAddr2 = L24_24
              end
            else
              L29_29 = L25_25
              portPresent = L26_26
              if L26_26 ~= L27_27 then
                if L26_26 > L27_27 then
                  ipAddr2 = L26_26
                end
              else
                ipAddr2 = L24_24
              end
            end
          end
        end
        if L13_13 ~= L26_26 then
          if L16_16 ~= L26_26 then
            L29_29 = "//"
            if L27_27 ~= L28_28 then
              L29_29 = nil
              if L28_28 ~= L29_29 then
                L29_29 = "split"
                L29_29 = 2
                L29_29 = L27_27[L29_29]
                networkName = L28_28
                L29_29 = networkName
                L29_29 = L29_29[L30_30]
                L29_29 = nil
                if L28_28 == L29_29 then
                  L29_29 = string
                  L29_29 = L29_29.find
                  L29_29 = L29_29(L30_30, L31_31)
                  portPresent = L29_29
                  L29_29 = portPresent
                  if L29_29 ~= L30_30 then
                    L29_29 = portPresent
                    if L29_29 > L30_30 then
                      L29_29 = util
                      L29_29 = L29_29[L30_30]
                      L29_29 = L29_29(L30_30, L31_31)
                    end
                  else
                  end
                else
                  L29_29 = string
                  L29_29 = L29_29.find
                  L29_29 = L29_29(L30_30, L31_31, L32_32)
                  portPresent = L29_29
                  L29_29 = portPresent
                  if L29_29 ~= L30_30 then
                    L29_29 = portPresent
                    if L29_29 > L30_30 then
                      L29_29 = util
                      L29_29 = L29_29[L30_30]
                      L29_29 = L29_29(L30_30, L31_31)
                    end
                  else
                  end
                end
                L29_29 = nil
                if L26_26 ~= L29_29 then
                  L29_29 = 1
                  L29_29 = L26_26[L29_29]
                  if L29_29 ~= L16_16 then
                    L29_29 = RUNTIME_LOGIN_PAGE
                    if L11_11 ~= L29_29 then
                      L29_29 = MOB_RUNTIME_LOGIN_PAGE
                      if L11_11 ~= L29_29 then
                        L29_29 = SSL_PORTAL_LOGIN_PAGE
                        if L11_11 ~= L29_29 then
                          L29_29 = BLOCKED_PAGE
                          if L11_11 ~= L29_29 then
                            L29_29 = DENY_PAGE
                            if L11_11 ~= L29_29 then
                              L29_29 = SSLVPN_FORCED_LOGIN_PAGE
                              if L11_11 ~= L29_29 then
                                L29_29 = PORTAL_HELP_PAGE
                                if L11_11 ~= L29_29 then
                                  L11_11 = HOME_PAGE
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
        if L26_26 ~= L27_27 and L26_26 ~= "" then
          L29_29 = L26_26
          L29_29 = "r"
          L29_29 = nil
          if L27_27 ~= L29_29 then
            L29_29 = L27_27.read
            L29_29 = L29_29(L30_30, L31_31)
            L29_29 = L27_27.close
            L29_29(L30_30)
          else
            L29_29 = RUNTIME_LOGIN_PAGE
            if L11_11 ~= L29_29 then
              L29_29 = MOB_RUNTIME_LOGIN_PAGE
              if L11_11 ~= L29_29 then
                L29_29 = SSL_PORTAL_LOGIN_PAGE
                if L11_11 ~= L29_29 then
                  L29_29 = BLOCKED_PAGE
                  if L11_11 ~= L29_29 then
                    L29_29 = DENY_PAGE
                    if L11_11 ~= L29_29 then
                      L29_29 = SSLVPN_FORCED_LOGIN_PAGE
                      if L11_11 ~= L29_29 then
                        L29_29 = PORTAL_HELP_PAGE
                        if L11_11 ~= L29_29 then
                          L11_11 = HOME_PAGE
                        end
                      end
                    end
                  end
                end
              end
            end
          end
          if L28_28 ~= L25_25 then
            L29_29 = RUNTIME_LOGIN_PAGE
            if L11_11 ~= L29_29 then
              L29_29 = MOB_RUNTIME_LOGIN_PAGE
              if L11_11 ~= L29_29 then
                L29_29 = SSL_PORTAL_LOGIN_PAGE
                if L11_11 ~= L29_29 then
                  L29_29 = BLOCKED_PAGE
                  if L11_11 ~= L29_29 then
                    L29_29 = DENY_PAGE
                    if L11_11 ~= L29_29 then
                      L29_29 = SSLVPN_FORCED_LOGIN_PAGE
                      if L11_11 ~= L29_29 then
                        L29_29 = PORTAL_HELP_PAGE
                        if L11_11 ~= L29_29 then
                          L11_11 = HOME_PAGE
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        elseif L26_26 == L27_27 then
          if L11_11 ~= L27_27 then
            if L11_11 ~= L27_27 then
              if L11_11 ~= L27_27 then
                if L11_11 ~= L27_27 then
                  if L11_11 ~= L27_27 then
                    if L11_11 ~= L27_27 then
                      if L11_11 ~= L27_27 then
                        if L11_11 ~= L27_27 then
                          if L11_11 ~= L27_27 then
                            if L11_11 ~= L27_27 then
                              if L11_11 ~= L27_27 then
                                if L11_11 ~= L27_27 then
                                  if L11_11 ~= L27_27 then
                                    if L11_11 ~= L27_27 then
                                      if L11_11 ~= L27_27 then
                                        if L11_11 ~= L27_27 then
                                          if L11_11 ~= L27_27 then
                                            if L11_11 ~= L27_27 then
                                            else
                                              if L11_11 == L27_27 then
                                                if L27_27 ~= "DSR-150N" then
                                                  if L27_27 ~= L28_28 then
                                                    if L27_27 ~= L28_28 then
                                                    end
                                                  end
                                                elseif L27_27 == L28_28 then
                                                  L11_11 = HOME_PAGE
                                                end
                                            end
                                            else
                                              L11_11 = HOME_PAGE
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
        L29_29 = "refererValidation"
        L29_29 = cgilua
        L29_29 = L29_29[L30_30]
        L29_29 = L29_29[L30_30]
        L29_29 = L29_29(L30_30)
        L29_29 = false
        if L28_28 == L29_29 then
          L29_29 = RUNTIME_LOGIN_PAGE
          if L11_11 ~= L29_29 then
            L29_29 = MOB_RUNTIME_LOGIN_PAGE
            if L11_11 ~= L29_29 then
              L29_29 = SSL_PORTAL_LOGIN_PAGE
              if L11_11 ~= L29_29 then
                L29_29 = BLOCKED_PAGE
                if L11_11 ~= L29_29 then
                  L29_29 = DENY_PAGE
                  if L11_11 ~= L29_29 then
                    L29_29 = SSLVPN_FORCED_LOGIN_PAGE
                    if L11_11 ~= L29_29 then
                      L29_29 = PORTAL_HELP_PAGE
                      if L11_11 ~= L29_29 then
                        L11_11 = HOME_PAGE
                      end
                    end
                  end
                end
              end
            end
          end
        end
      elseif L13_13 == L23_23 then
        if L11_11 ~= L23_23 then
          if L11_11 ~= L23_23 then
            if L11_11 ~= L23_23 then
              if L11_11 ~= L23_23 then
                if L11_11 ~= L23_23 then
                  if L11_11 ~= L23_23 then
                    if L11_11 ~= L23_23 then
                      if L11_11 ~= L23_23 then
                        if L11_11 ~= L23_23 then
                          if L11_11 ~= L23_23 then
                            if L11_11 ~= L23_23 then
                            else
                              if L11_11 == L23_23 then
                                if L23_23 ~= "DSR-150N" then
                                  if L23_23 ~= L24_24 then
                                    if L23_23 ~= L24_24 then
                                    end
                                  end
                                elseif L23_23 == L24_24 then
                                  if L14_14 == L23_23 then
                                    L11_11 = HOME_PAGE
                                  end
                                end
                            end
                            elseif L14_14 == L23_23 then
                              L11_11 = HOME_PAGE
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L36_36 = L25_25(L26_26)
  if L23_23 ~= "OK" then
    if L23_23 == "AUTHENTICATED" then
      if L24_24 == L25_25 then
      end
    elseif L24_24 == "HIGH" then
      if L23_23 ~= L24_24 and L23_23 ~= "DISCONNECTED" then
      elseif L23_23 == L24_24 then
        if not L24_24 then
        elseif L24_24 then
          if L25_25 == "HIGH" then
            if L25_25 ~= L26_26 then
              L29_29 = "REMOTE_ADDR"
              L36_36 = L28_28(L29_29)
            end
          end
          if L24_24 ~= "OK" then
            if L24_24 == "AUTHENTICATED" then
              if L25_25 == L26_26 then
              end
            elseif L25_25 == L26_26 then
            elseif L25_25 == L26_26 then
              if L24_24 ~= L25_25 then
                if L24_24 ~= L25_25 and L24_24 ~= "DISCONNECTED" then
                end
              end
            else
              L11_11 = OMNISSLPORTAL_PAGE
            end
          end
        end
      end
    elseif L11_11 ~= L24_24 then
      if L11_11 ~= L24_24 then
        if L11_11 ~= L24_24 then
          if L11_11 ~= L24_24 then
            if L11_11 == L24_24 then
            else
              if L25_25 == "HIGH" then
                if L25_25 ~= L26_26 then
                  L29_29 = "REMOTE_ADDR"
                  L36_36 = L28_28(L29_29)
                end
              end
              if L11_11 == L25_25 then
                L11_11 = BLOCKED_PAGE
              elseif L11_11 == L25_25 then
                L11_11 = SESSIONLIMIT_WARN
              elseif L11_11 == L25_25 then
                L11_11 = DENY_PAGE
              elseif L11_11 ~= L25_25 then
                if L11_11 ~= L25_25 then
                  if L11_11 == L25_25 then
                  elseif L25_25 == L26_26 then
                    L11_11 = SSLVPN_FORCED_LOGIN_PAGE
                  elseif L25_25 == "HIGH" then
                    if L24_24 ~= "OK" then
                      if L24_24 == "AUTHENTICATED" then
                        elseif L25_25 == L26_26 then
                        end
                  else
                    else
                      L12_12 = false
                      if L25_25 ~= "y" then
                        L11_11 = HOME_PAGE
                      elseif L25_25 ~= L26_26 then
                        L11_11 = HOME_PAGE
                      elseif L26_26 == "1" then
                        L29_29 = "SERVER_ADDR"
                        L29_29 = ":"
                        L26_26(L27_27)
                      else
                        L29_29 = "SERVER_ADDR"
                        L29_29 = "/scgi-bin/platform.cgi?page="
                        L26_26(L27_27)
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
if L22_22 then
  if L11_11 ~= "captivePortal.html" then
  elseif L11_11 == L22_22 then
    if L24_24 ~= L26_26 or L24_24 ~= "" then
      L29_29 = "profileId"
    end
    if L22_22 == "1" then
      L29_29 = "getRedirectType"
      L29_29 = HIGH_SEC
      if L29_29 == "HIGH" then
        if L28_28 == "1" then
          L29_29 = cgilua
          L29_29 = L29_29[L30_30]
          L33_33 = L26_26
          L29_29(L30_30)
        else
          L29_29 = cgilua
          L29_29 = L29_29[L30_30]
          L33_33 = L26_26
          L29_29(L30_30)
        end
      else
        L29_29 = cgilua
        L29_29 = L29_29[L30_30]
        L33_33 = L26_26
        L29_29(L30_30)
      end
    end
  end
end
if L22_22 then
  if L22_22 == "1" then
    if L27_27 == L28_28 then
      L29_29 = "' AND addressFamily = 2"
      L7_7 = L27_27 .. L28_28 .. L29_29
      L29_29 = L7_7
    else
      L29_29 = db
      L29_29 = L29_29[L30_30]
      L29_29 = L29_29(L30_30, L31_31)
      for L33_33, L34_34 in L30_30(L31_31) do
        L35_35 = L34_34["ipAddressTable.ipAddress"]
        L36_36 = "ipAddressTable.subnetMask"
        L36_36 = L34_34[L36_36]
        if validationsLuaLib.ipv4IsIPinSameNetwork(L27_27, L36_36, L35_35, L36_36) == 0 then
          break
        end
      end
    end
    if L25_25 ~= L27_27 then
      L29_29 = "ipAddress"
      if L27_27 then
        if L27_27 ~= L28_28 then
          L29_29 = "IpAddr"
        else
          if not L27_27 then
            if L26_26 ~= L27_27 then
              L29_29 = "vlanName"
            end
        end
        elseif L27_27 then
        end
        if L23_23 == L27_27 then
          if L11_11 ~= L27_27 then
            if L11_11 ~= L27_27 then
              L11_11 = DENY_PAGE
              L12_12 = false
            end
          end
        end
      end
    end
  end
end
if L12_12 then
  L22_22(L23_23)
  return
else
  L22_22(L23_23)
  if L22_22 ~= L23_23 then
    if L22_22 ~= L23_23 then
      if L22_22 ~= L23_23 then
        if L11_11 ~= L22_22 and L11_11 ~= "portalLogin.html" then
          L22_22(L23_23)
          L22_22(L23_23)
          if L22_22 == "-1" or L23_23 == "-1" then
            L12_12 = false
            statusMessage = L24_24
            L11_11 = HOME_PAGE
            L24_24[L25_25] = ""
            L24_24(L25_25)
          end
        end
      end
    end
  end
  L22_22(L23_23)
  L22_22(L23_23)
end
if L22_22 == L23_23 then
  L36_36 = L23_23()
  L22_22(L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35, L36_36, L23_23())
end
if L22_22 == L23_23 then
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L22_22(L23_23)
  L36_36 = L23_23()
  L22_22(L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35, L36_36, L23_23())
end
