lang = {}
language = {}
function lang.config(A0_0, A1_1, A2_2)
  if db.typeAndRangeValidate(A0_0) then
    if A2_2 == "add" then
      return db.insert(DBTable, A0_0)
    elseif A2_2 == "edit" then
      return db.update(DBTable, A0_0, A1_1)
    elseif A2_2 == "delete" then
      return db.delete(DBTable, A0_0)
    end
  end
  return false
end
function lang.setLanguage(A0_3)
  local L1_4
  L1_4 = ACCESS_LEVEL
  if L1_4 ~= 0 then
    L1_4 = "ACCESS_DENIED"
    return L1_4, "10187"
  end
  L1_4 = db
  L1_4 = L1_4.beginTransaction
  L1_4()
  L1_4 = false
  L1_4 = db.setAttribute("Languages", "Status", "1", "Status", "0")
  if db.getRow("Languages", "LanguageId", A0_3["Languages.LanguageId"]) ~= nil then
    L1_4 = db.setAttribute("Languages", "LanguageId", A0_3["Languages.LanguageId"], "Status", "1")
  else
    L1_4 = false
  end
  if L1_4 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "13125"
  end
end
function language.config(A0_5, A1_6, A2_7, A3_8)
  if db.typeAndRangeValidate(A0_5) then
    if A2_7 == "add" then
      return db.insert(A3_8, A0_5)
    elseif A2_7 == "edit" then
      return db.update(A3_8, A0_5, A1_6)
    elseif A2_7 == "delete" then
      return db.delete(A3_8, A0_5)
    end
  end
  return false
end
function language.import(A0_9, A1_10)
  local L2_11, L3_12, L4_13, L5_14, L6_15, L7_16
  if A0_9 ~= nil then
  elseif L3_12 == 0 then
    A0_9 = A1_10
  end
  if A0_9 then
    if L3_12 < 5 then
      A0_9 = A1_10
    end
  end
  for L6_15, L7_16 in L3_12(L4_13) do
    L7_16 = util.addPrefix(L7_16, "Languages.")
    language.config(L7_16, -1, "add", "Languages")
  end
end
function language.export()
  ({}).Languages = db.getTable("Languages", false)
  return {}
end
if config.register then
  config.register("Languages", language.import, language.export)
end
