local L0_0
L0_0 = module
L0_0("com.teamf1.core.pkg.language", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/pkg_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).status = "Status"
;({}).languageId = "LanguageId"
function languageSettingsGet()
  local L0_1, L1_2
  L0_1 = db
  L0_1 = L0_1.get_connection
  L0_1 = L0_1()
  L1_2 = _UPVALUE0_
  if L1_2 == _UPVALUE1_.NIL then
    L1_2 = db
    L1_2 = L1_2.connect
    L1_2 = L1_2(_UPVALUE2_)
    _UPVALUE0_ = L1_2
  else
    L1_2 = db
    L1_2 = L1_2.set_connection
    L1_2(_UPVALUE0_)
  end
  L1_2 = db
  L1_2 = L1_2.getTable
  L1_2 = L1_2(_UPVALUE3_)
  db.set_connection(L0_1)
  if #L1_2 < 3 then
    return _UPVALUE4_.CONFIGURE_PKGMNGR, L1_2
  end
  return _UPVALUE1_.SUCCESS, L1_2
end
function languageSettingsSet(A0_3)
  local L1_4, L2_5, L3_6, L4_7
  L1_4 = io
  L1_4 = L1_4.open
  L2_5 = _UPVALUE0_
  L3_6 = "w"
  L1_4 = L1_4(L2_5, L3_6)
  L2_5 = db
  L2_5 = L2_5.get_connection
  L2_5 = L2_5()
  L3_6 = _UPVALUE1_
  L4_7 = _UPVALUE2_
  L4_7 = L4_7.NIL
  if L3_6 == L4_7 then
    L3_6 = db
    L3_6 = L3_6.connect
    L4_7 = _UPVALUE3_
    L3_6 = L3_6(L4_7)
    _UPVALUE1_ = L3_6
  else
    L3_6 = db
    L3_6 = L3_6.set_connection
    L4_7 = _UPVALUE1_
    L3_6(L4_7)
  end
  L3_6 = _UPVALUE1_
  cur_DB_con = L3_6
  L3_6 = db
  L3_6 = L3_6.getAttribute
  L4_7 = _UPVALUE4_
  L3_6 = L3_6(L4_7, _UPVALUE5_.status, "1", _UPVALUE5_.languageId)
  L4_7 = false
  L4_7 = db.setAttribute(_UPVALUE4_, _UPVALUE5_.status, "1", _UPVALUE5_.status, "0")
  if db.getRow(_UPVALUE4_, _UPVALUE5_.languageId, A0_3) ~= _UPVALUE2_.NIL then
    L4_7 = db.setAttribute(_UPVALUE4_, _UPVALUE5_.languageId, A0_3, _UPVALUE5_.status, "1")
    L1_4:write(A0_3)
  else
    L1_4:write("en_US")
    L4_7 = false
  end
  L1_4:close()
  if L4_7 == false then
    return _UPVALUE2_.FAILURE
  end
  if HIGH_SEC == "HIGH" then
    os.execute("/pfrm2.0/bin/curl -k https://127.0.0.1/scgi-bin/platform.cgi?page=headerMenuDyn.html -o /var/langFiles/headerMenu.html")
    os.execute("/pfrm2.0/bin/curl -k https://127.0.0.1/scgi-bin/platform.cgi?page=jsOnlyStringsDyn.html -o /var/langFiles/jsOnlyStrings.html")
    os.execute("/pfrm2.0/bin/curl -k https://127.0.0.1/scgi-bin/platform.cgi?page=wizardLanguageStringsDyn.html -o /var/langFiles/wizardLanguageStrings.js")
  else
    os.execute("/pfrm2.0/bin/curl -k http://127.0.0.1/platform.cgi?page=headerMenuDyn.html -o /var/langFiles/headerMenu.html")
    os.execute("/pfrm2.0/bin/curl -k http://127.0.0.1/platform.cgi?page=jsOnlyStringsDyn.html -o /var/langFiles/jsOnlyStrings.html")
    os.execute("/pfrm2.0/bin/curl -k http://127.0.0.1/platform.cgi?page=wizardLanguageStringsDyn.html -o /var/langFiles/wizardLanguageStrings.js")
  end
  db.set_connection(L2_5)
  return _UPVALUE2_.SUCCESS, L3_6
end
