module("com.teamf1.core.errorMap", package.seeall)
require("teamf1lualib/db")
function errorStringGet(A0_0)
  local L1_1
  if A0_0 ~= nil then
    L1_1 = db.getString(A0_0)
  else
    L1_1[tostring(A0_0)] = "i18nHTMLMissing"
  end
  returnString = L1_1[tostring(A0_0)] or "i18nHTMLMissing"
  return returnString
end
