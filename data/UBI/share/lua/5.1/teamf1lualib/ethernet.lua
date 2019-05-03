ethernet = {}
function ethernet.ethernet_config(A0_0, A1_1, A2_2)
  if ACCESS_LEVEL ~= 0 then
    return "ACCESS_DENIED", "10187"
  end
  if ethernet.config(A0_0, A1_1, A2_2) then
    return "OK", "12265"
  else
    return "ERROR", "10768"
  end
end
function ethernet.config(A0_3, A1_4, A2_5)
  if ethernet.inputvalidate(A0_3, A2_5) then
    if A2_5 == "add" then
      return db.insert("ethernet", A0_3)
    elseif A2_5 == "edit" then
      return db.update("ethernet", A0_3, A1_4)
    elseif A2_5 == "delete" then
      return nil
    end
  end
  return false
end
function ethernet.inputvalidate(A0_6, A1_7)
  do return db.typeAndRangeValidate(A0_6) end
  return false
end
function ethernet.import(A0_8)
  local L1_9, L2_10, L3_11, L4_12, L5_13
  for L4_12, L5_13 in L1_9(L2_10) do
    L5_13 = util.addPrefix(L5_13, "ethernet.")
    ethernet.config(L5_13, -1, "add")
  end
end
function ethernet.export()
  return db.getTable("ethernet", false)
end
if config.register then
  config.register("ethernet", ethernet.import, ethernet.export)
end
