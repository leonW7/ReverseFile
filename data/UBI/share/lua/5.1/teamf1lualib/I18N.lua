local L0_0
L0_0 = require
L0_0("teamf1lualib/pkgMgmt")
L0_0 = {}
I18N = L0_0
L0_0 = nil
LANGUAGE_DB_FILE_NAME = "/tmp/language.db"
function I18N.dbConnect(A0_1)
  _UPVALUE0_ = db.get_connection()
  _UPVALUE1_ = db.connect(A0_1)
  db.set_connection(_UPVALUE1_)
end
function I18N.translate(A0_2)
  local L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10
  L1_3 = pkgMgmt
  L2_4 = db
  L2_4 = L2_4.get_connection
  L2_4 = L2_4()
  L1_3.sys_DB_conn = L2_4
  L1_3 = pkgMgmt
  L1_3 = L1_3.pkgdbConnect
  L1_3()
  L1_3 = db
  L1_3 = L1_3.getAttribute
  L2_4 = "Languages"
  L3_5 = "Status"
  L1_3 = L1_3(L2_4, L3_5, L4_6, L5_7)
  L1_3 = L1_3 or "en_US"
  L2_4 = "/tmp/"
  L3_5 = L1_3
  L2_4 = L2_4 .. L3_5 .. L4_6
  L3_5 = I18N
  L3_5 = L3_5.dbConnect
  L3_5(L4_6)
  L3_5 = {}
  if A0_2 then
    for L7_9 = 1, #A0_2 do
      L8_10 = db
      L8_10 = L8_10.getAttribute
      L8_10 = L8_10("stringsMap", "stringId", A0_2[L7_9], L1_3)
      if L8_10 == nil or L8_10 == "" then
        I18N.dbConnect("/tmp/en_US.db")
        L8_10 = db.getAttribute("stringsMap", "stringId", A0_2[L7_9], "en_US")
        if L8_10 == nil then
          L8_10 = "I18N"
        elseif L8_10 == "" then
          L8_10 = "I18N_Default"
        end
        db.set_connection(_UPVALUE0_)
      end
      L8_10 = string.gsub(L8_10, "\"", "&quot;")
      L3_5[A0_2[L7_9]] = L8_10
    end
  end
  L4_6(L5_7)
  return L3_5
end
