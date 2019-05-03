require("teamf1lualib/web")
require("teamf1lualib/errorMap")
require("teamf1lualib/returnCodes")
require("teamf1lualib/bl_logInfo")
if ACCESS_LEVEL ~= 0 then
  if not util.fileExists("/tmp/bootComplete") then
    statusErrorMessage = require("com.teamf1.core.errorMap").errorStringGet(require("com.teamf1.core.returnCodes").ROUTER_INITIALIZING_AFTER_REBOOT)
  else
    statusErrorMessage = require("com.teamf1.core.errorMap").errorStringGet(require("com.teamf1.core.returnCodes").UNAUTHORIZED)
  end
  Page = "logInfo.html"
  web.goToPage(Page, false, true)
else
  filename = UNIT_NAME .. "-currentLogs.txt"
  CURRENT_LOG_FILE = "/var/currentLogs.txt"
  web.download(CURRENT_LOG_FILE, filename)
  os.execute("/bin/rm -rf " .. CURRENT_LOG_FILE)
end
