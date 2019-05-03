local L0_0, L1_1
L0_0 = {}
gre = L0_0
L0_0 = gre
function L1_1(A0_2, A1_3, A2_4)
  if db.typeAndRangeValidate(A0_2) then
    if A2_4 == "add" then
      return db.insert(DBTable, A0_2)
    elseif A2_4 == "edit" then
      return db.update(DBTable, A0_2, A1_3)
    end
  end
end
L0_0.config = L1_1
L0_0 = gre
function L1_1(A0_5, A1_6, A2_7)
  local L3_8
  L3_8 = ACCESS_LEVEL
  if L3_8 ~= 0 then
    L3_8 = "ACCESS_DENIED"
    return L3_8, "ADMIN_REQD"
  end
  if A2_7 == "add" then
    L3_8 = db
    L3_8 = L3_8.getRowsWhere
    L3_8 = L3_8("GRE", "rowid")
    if UNIT_NAME == "DSR-1000N" or UNIT_NAME == "DSR-1000" or UNIT_NAME == "DSR-1000AC" then
    elseif UNIT_NAME == "DSR-500N" or UNIT_NAME == "DSR-500" or UNIT_NAME == "DSR-500AC" then
    elseif UNIT_NAME == "DSR-250N" or UNIT_NAME == "DSR-250" then
    else
    end
    if #L3_8 == 5 then
      return "ERROR", "MAX_LIMIT_REACHED"
    end
  end
  if A2_7 ~= "delete" then
    L3_8 = "RemoteIp= '"
    L3_8 = L3_8 .. A0_5["GRE.RemoteIp"] .. "' and InterfaceName = '" .. A0_5["GRE.InterfaceName"] .. "'"
    where = L3_8
    L3_8 = db
    L3_8 = L3_8.getRowsWhere
    L3_8 = L3_8("GRE", where)
    if L3_8 ~= nil then
      if A2_7 == "add" then
        if #L3_8 > 0 then
          return "ERROR", "GRE_CONFIGURATION_ALREADY_EXISTS"
        end
      elseif A2_7 == "edit" then
        for _FORV_7_, _FORV_8_ in pairs(L3_8) do
          if A1_6 ~= _FORV_8_["GRE._ROWID_"] then
            return "ERROR", "GRE_CONFIGURATION_ALREADY_EXISTS"
          end
        end
      end
    end
  end
  L3_8 = db
  L3_8 = L3_8.beginTransaction
  L3_8()
  L3_8 = false
  L3_8 = gre.config(A0_5, A1_6, A2_7)
  if L3_8 then
    db.commitTransaction(true)
    return "OK", "Operation Succeeded"
  else
    db.rollback()
    return "ERROR", "GRE_CONFIG_FAILED"
  end
end
L0_0.greConfig = L1_1
L0_0 = gre
function L1_1(A0_9)
  local L1_10, L2_11, L3_12, L4_13, L5_14, L6_15, L7_16, L8_17
  L1_10 = ACCESS_LEVEL
  if L1_10 ~= 0 then
    L1_10 = "ACCESS_DENIED"
    L2_11 = "ADMIN_REQD"
    return L1_10, L2_11
  end
  L1_10 = db
  L1_10 = L1_10.beginTransaction
  L1_10()
  L1_10 = true
  L2_11 = "12265"
  for L6_15, L7_16 in L3_12(L4_13) do
    L8_17 = {}
    L8_17["GRE._ROWID_"] = L7_16
    L1_10 = db.delete("GRE", L8_17)
    if L1_10 == false then
      break
    end
  end
  if L1_10 then
    L3_12(L4_13)
    return L3_12, L4_13
  else
    L3_12()
    return L3_12, L4_13
  end
end
L0_0.greDelete = L1_1
