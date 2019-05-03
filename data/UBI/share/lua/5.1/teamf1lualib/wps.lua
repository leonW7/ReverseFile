local L0_0, L1_1
L0_0 = {}
wps = L0_0
L0_0 = wps
function L1_1(A0_2, A1_3, A2_4)
  if db.typeAndRangeValidate(A0_2) then
    if A2_4 == "add" then
      return db.insert("dot11WPS", A0_2)
    elseif A2_4 == "edit" then
      return db.update("dot11WPS", A0_2, A1_3)
    elseif A2_4 == "delete" then
      return db.delete("dot11WPS", A0_2)
    end
  else
    return false
  end
end
L0_0.config = L1_1
L0_0 = wps
function L1_1(A0_5, A1_6, A2_7)
  local L3_8
  L3_8 = ACCESS_LEVEL
  if L3_8 ~= 0 then
    L3_8 = "ACCESS_DENIED"
    return L3_8, "10187"
  end
  L3_8 = db
  L3_8 = L3_8.beginTransaction
  L3_8()
  L3_8 = false
  L3_8 = wps.config(A0_5, A1_6, A2_7)
  if L3_8 then
    db.commitTransaction()
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12782"
  end
end
L0_0.wpsConfig = L1_1
L0_0 = wps
function L1_1(A0_9)
  local L1_10, L2_11
  L1_10 = 0
  L2_11 = 0
  util.appendDebugOut("In wpsValidatePin<br>")
  if string.len(A0_9) == 8 then
    L1_10 = tonumber(A0_9)
    L2_11 = math.floor(L2_11 + 3 * (math.floor(L1_10 / 10000000) % 10))
    L2_11 = math.floor(L2_11 + 1 * (math.floor(L1_10 / 1000000) % 10))
    L2_11 = math.floor(L2_11 + 3 * (math.floor(L1_10 / 100000) % 10))
    L2_11 = math.floor(L2_11 + 1 * (math.floor(L1_10 / 10000) % 10))
    L2_11 = math.floor(L2_11 + 3 * (math.floor(L1_10 / 1000) % 10))
    L2_11 = math.floor(L2_11 + 1 * (math.floor(L1_10 / 100) % 10))
    L2_11 = math.floor(L2_11 + 3 * (math.floor(L1_10 / 10) % 10))
    L2_11 = math.floor(L2_11 + 1 * (math.floor(L1_10 / 1) % 10))
    util.appendDebugOut("accum " .. L2_11 .. "<br>")
    if L2_11 % 10 == 0 then
      util.appendDebugOut("Returning OK<br>")
      return "OK", "12265"
    end
  end
  util.appendDebugOut("Returning ERROR<br>")
  return "ERROR", "11044"
end
L0_0.validatePin = L1_1
