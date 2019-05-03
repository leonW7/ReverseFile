require("teamf1lualib/web")
require("teamf1lualib/errorMap")
require("teamf1lualib/returnCodes")
require("teamf1lualib/db")
require("teamf1lualib/config")
if ACCESS_LEVEL ~= 0 then
  if not util.fileExists("/tmp/bootComplete") then
    statusErrorMessage = require("com.teamf1.core.errorMap").errorStringGet(require("com.teamf1.core.returnCodes").ROUTER_INITIALIZING_AFTER_REBOOT)
  else
    statusErrorMessage = require("com.teamf1.core.errorMap").errorStringGet(require("com.teamf1.core.returnCodes").UNAUTHORIZED)
  end
  Page = "backupRestore.html"
  web.goToPage(Page, false, true)
else
  filename = UNIT_NAME .. "-dbglog.tgz"
  DBGLOG_FILE = "/var/dbglog.tgz"
  DBGLOG_FILE_DIR = "/var/dbglog"
  DBGLOG_SCRIPT = "/pfrm2.0/var/www/dbglog.sh"
  os.execute("/bin/sh " .. DBGLOG_SCRIPT .. " " .. UNIT_NAME)
  if config.compareChecksum() == 1 then
    db.save()
  end
  web.download(DBGLOG_FILE, filename)
  os.execute("/bin/rm -rf " .. DBGLOG_FILE_DIR .. "*")
end
