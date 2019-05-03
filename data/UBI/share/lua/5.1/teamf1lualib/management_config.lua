module("com.teamf1.core.config", package.seeall)
require("teamf1lualib/db")
function start()
  db.beginTransaction()
end
function abort()
  db.rollback()
end
function complete()
  db.commitTransaction()
end
function save()
  db.save()
end
