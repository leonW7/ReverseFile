local L0_0, L1_1
L0_0 = {}
radvd = L0_0
L0_0 = {}
radvdPrefix = L0_0
L0_0 = radvd
function L1_1(A0_2, A1_3, A2_4)
  if db.typeAndRangeValidate(A0_2) then
    if A2_4 == "add" then
      return db.insert(DBTable, A0_2)
    elseif A2_4 == "edit" then
      return db.update(DBTable, A0_2, A1_3)
    elseif A2_4 == "delete" then
      return db.delete(DBTable, A0_2)
    end
  end
  return false
end
L0_0.config = L1_1
L0_0 = radvd
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
  L3_8 = radvd.config(A0_5, A1_6, A2_7)
  if L3_8 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "11911"
  end
end
L0_0.profileConfig = L1_1
L0_0 = radvdPrefix
function L1_1(A0_9, A1_10, A2_11)
  if db.typeAndRangeValidate(A0_9) then
    if A2_11 == "add" then
      return db.insert(DBTable, A0_9)
    elseif A2_11 == "edit" then
      return db.update(DBTable, A0_9, A1_10)
    elseif A2_11 == "delete" then
      return db.delete(DBTable, A0_9)
    end
  end
  return false
end
L0_0.config = L1_1
function L0_0(A0_12)
  local L1_13, L2_14
  L1_13 = "0123456789abcdef"
  L2_14 = ""
  while A0_12 > 0 do
    L2_14 = string.sub(L1_13, math.fmod(A0_12, 16) + 1, math.fmod(A0_12, 16) + 1) .. L2_14
    A0_12 = math.floor(A0_12 / 16)
  end
  if L2_14 == "" then
    L2_14 = "0"
  end
  return L2_14
end
num2hex = L0_0
L0_0 = radvdPrefix
function L1_1(A0_15, A1_16, A2_17)
  local L3_18
  L3_18 = ACCESS_LEVEL
  if L3_18 ~= 0 then
    L3_18 = "ACCESS_DENIED"
    return L3_18, "10187"
  end
  L3_18 = A0_15["radvdLANPrefixPool.radvdPrefixType"]
  if L3_18 == "1" then
    L3_18 = tonumber
    L3_18 = L3_18(A0_15["radvdLANPrefixPool.SLAIdentifier"])
    L3_18 = num2hex(L3_18)
    A0_15["radvdLANPrefixPool.radvdAdvPrefix"] = "2002:0:0:" .. L3_18 .. "::"
    A0_15["radvdLANPrefixPool.radvdAdvPrefixLength"] = "64"
  end
  L3_18 = db
  L3_18 = L3_18.beginTransaction
  L3_18()
  L3_18 = false
  L3_18 = radvdPrefix.config(A0_15, A1_16, A2_17)
  if L3_18 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "11912"
  end
end
L0_0.profileConfig = L1_1
L0_0 = radvdPrefix
function L1_1(A0_19)
  local L1_20, L2_21, L3_22, L4_23, L5_24, L6_25, L7_26
  L1_20 = ACCESS_LEVEL
  if L1_20 ~= 0 then
    L1_20 = "ACCESS_DENIED"
    return L1_20, L2_21
  end
  L1_20 = db
  L1_20 = L1_20.beginTransaction
  L1_20()
  L1_20 = false
  for L5_24, L6_25 in L2_21(L3_22) do
    L7_26 = {}
    L7_26["radvdLANPrefixPool._ROWID_"] = L6_25
    L1_20 = db.delete("radvdLANPrefixPool", L7_26)
    if not L1_20 then
      break
    end
  end
  if L1_20 then
    L2_21(L3_22)
    return L2_21, L3_22
  else
    L2_21()
    return L2_21, L3_22
  end
end
L0_0.deleteProfiles = L1_1
