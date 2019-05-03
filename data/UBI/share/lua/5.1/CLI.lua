if io.open("/etc/security_level.conf", "r") then
  HIGH_SEC = io.open("/etc/security_level.conf", "r"):read("*all") or "HIGH"
  if string.find(HIGH_SEC, "HIGH") then
    HIGH_SEC = "HIGH"
  else
    HIGH_SEC = "LOW"
  end
  io.open("/etc/security_level.conf", "r"):close()
end
if io.popen("/pfrm2.0/bin/printProductData /etc/mtdDevice ModelId") then
  MODEL_ID = io.popen("/pfrm2.0/bin/printProductData /etc/mtdDevice ModelId"):read("*line") or "DSR-1000N"
  io.popen("/pfrm2.0/bin/printProductData /etc/mtdDevice ModelId"):close()
end
UNIT_NAME = MODEL_ID
if io.popen("/pfrm2.0/bin/printProductData /etc/mtdDevice HwVer") then
  HW_VERSION = io.popen("/pfrm2.0/bin/printProductData /etc/mtdDevice HwVer"):read("*line") or "A1"
  io.popen("/pfrm2.0/bin/printProductData /etc/mtdDevice HwVer"):close()
end
hwFamilyName = nil
hwFileP = io.open("/tmp/hwFamilyVersion", "r")
if hwFileP ~= nil then
  hwFamilyName = hwFileP:read()
  hwFileP:close()
else
  hwFamilyName = "Ax"
end
PRODUCT_ID = MODEL_ID .. "_" .. hwFamilyName
require("teamf1lualib/vlanCLI")
require("teamf1lualib/clishCLI")
require("teamf1lualib/db")
require("teamf1lualib/util")
require("teamf1lualib/utilsCLI")
require("teamf1lualib/timeCLI")
require("teamf1lualib/userdbCLI")
require("teamf1lualib/ifDevCLI")
require("teamf1lualib/logConfigCLI")
require("teamf1lualib/loggingCLI")
require("teamf1lualib/utilitiesCLI")
require("teamf1lualib/systemCLI")
require("teamf1lualib/ddnsCLI")
require("teamf1lualib/upnpCLI")
require("teamf1lualib/nimfCLI")
require("teamf1lualib/iprouteCLI")
require("teamf1lualib/dhcpCLI")
require("teamf1lualib/vpnpassthroughCLI")
require("teamf1lualib/natCLI")
require("teamf1lualib/firewall-ruleCLI")
require("teamf1lualib/ripCLI")
require("teamf1lualib/ipAliasCLI")
require("teamf1lualib/customServicesCLI")
require("teamf1lualib/vipsecureCLI")
require("teamf1lualib/snmpCLI")
require("teamf1lualib/intelAmtCLI")
require("teamf1lualib/firewall6-ruleCLI")
require("teamf1lualib/nimf6CLI")
require("teamf1lualib/ipModeCLI")
require("teamf1lualib/remoteCLI")
require("teamf1lualib/idsCLI")
require("teamf1lualib/radiusCLI")
require("teamf1lualib/extAuthCLI")
require("teamf1lualib/trafficMeterCLI")
require("teamf1lualib/schedulesCLI")
require("teamf1lualib/smtpAlgCLI")
require("teamf1lualib/sourceMacFilteringCLI")
require("teamf1lualib/6to4CLI")
if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-500AC" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" then
  require("teamf1lualib/teredoCLI")
end
require("teamf1lualib/isatapCLI")
require("teamf1lualib/radvdCLI")
require("teamf1lualib/portManagementCLI")
require("teamf1lualib/dmzCLI")
require("teamf1lualib/advancedCLI")
require("teamf1lualib/applicationrulesCLI")
require("teamf1lualib/websiteFilteringCLI")
require("teamf1lualib/usbCLI")
require("teamf1lualib/sharePortCLI")
require("teamf1lualib/pptpClientCLI")
require("teamf1lualib/l2tpClientCLI")
require("teamf1lualib/pptpdCLI")
require("teamf1lualib/l2tpdCLI")
if HIGH_SEC == "HIGH" then
  require("teamf1lualib/sslvpnCLI")
  require("teamf1lualib/openvpnCLI")
end
require("teamf1lualib/ethernetCLI")
require("teamf1lualib/tahiCLI")
require("teamf1lualib/switchdriverCLI")
require("teamf1lualib/protocolBindingCLI")
require("teamf1lualib/dmzReservedIpCLI")
if MODEL_ID ~= "DSR-250" and MODEL_ID ~= "DSR-250N" and MODEL_ID ~= "DSR-150" and MODEL_ID ~= "DSR-150N" then
  require("teamf1lualib/ospfCLI")
end
if MODEL_ID ~= "DWC-1000" then
  require("teamf1lualib/bwLimitCLI")
  require("teamf1lualib/dot11ConfigCLI")
  require("teamf1lualib/dot11ShowCLI")
else
  require("teamf1lualib/wlanCLI")
  require("teamf1lualib/widssecurityCLI")
  require("teamf1lualib/clientCLI")
  require("wirelessCtrlLuaLib")
  require("teamf1lualib/peercontrollerCLI")
  require("teamf1lualib/apmanagementCLI")
  require("teamf1lualib/approfileCLI")
  require("teamf1lualib/globalCLI")
  require("teamf1lualib/lmCLI")
  require("teamf1lualib/qosCLI")
end
require("teamf1lualib/greCLI")
require("teamf1lualib/igmpCLI")
require("teamf1lualib/webAccessCLI")
require("teamf1lualib/lmCLI")
require("teamf1lualib/dynamicwebFiltringCLI")
require("teamf1lualib/accountingCLI")
ACCESS_LEVEL = 0
TRUE = 0
FALSE = -1
LANGUAGE = "en_US"
DB_FILE_NAME = "/tmp/system.db"
langId = io.open("/flash/tmp/lang.txt", "r"):read("*line")
if langId == nil or langId == "" then
  langId = "en_US"
end
langString = "/tmp/" .. langId .. ".db"
db.connect(DB_FILE_NAME)
db.execute("ATTACH '" .. langString .. "' as langDB")
SETTINGS_FILE = db.getAttribute("environment", "name", "TEAMF1_CFG_ASCII", "value")
