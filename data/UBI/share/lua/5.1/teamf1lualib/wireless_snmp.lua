require("teamf1lualib/db")
require("teamf1lualib/errorMap")
require("teamf1lualib/profileConfig_bl")
require("teamf1lualib/wireless_profile")
require("teamf1lualib/accessPoints_bl")
require("teamf1lualib/wireless_accessPoints")
require("teamf1lualib/wirelessClients_bl")
require("teamf1lualib/wireless_statistics")
require("teamf1lualib/radioConfig_bl")
require("teamf1lualib/wireless_radio")
require("timeLib")
errorMap = require("com.teamf1.core.errorMap")
profileConfig_bl = require("com.teamf1.bl.wireless.profile")
wireless_profile = require("com.teamf1.core.wireless.profile")
accessPoints_bl = require("com.teamf1.bl.wireless.accesspoints")
wireless_accessPoints = require("com.teamf1.core.wireless.accesspoints")
wirelessClients_bl = require("com.teamf1.bl.wirelessClients")
wireless_statistics = require("com.teamf1.core.wireless.statistics")
radioConfig_bl = require("com.teamf1.bl.wireless.radio")
wireless_radio = require("com.teamf1.core.wireless.radio")
db.connect("/tmp/system.db")
SETTINGS_FILE = db.getAttribute("environment", "name", "TEAMF1_CFG_ASCII", "value")
UNIT_NAME = db.getAttribute("unitInfo", "_ROWID_", "1", "modelId")
HARDWARE_VER = db.getAttribute("unitInfo", "_ROWID_", "1", "hardwareVersion")
HARDWARE_SER = db.getAttribute("hwFamilyInfo", "_ROWID_", "1", "hwFamilyName")
PRODUCT_ID = UNIT_NAME .. "_" .. HARDWARE_SER
os.execute("echo " .. UNIT_NAME .. ">/var/product_model_id")
CLUSTER_SETTINGS_FILE = db.getAttribute("environment", "name", "CLUSTER_CFG_ASCII", "value")
FIRMWARE_VERSION = db.getAttribute("system", "_ROWID_", "1", "firmwareVerInt")
os.execute("echo " .. FIRMWARE_VERSION .. ">/var/firmwareVerInt")
