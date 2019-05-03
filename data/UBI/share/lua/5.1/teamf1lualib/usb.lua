local L0_0, L1_1
L0_0 = {}
usb = L0_0
L0_0 = usb
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
end
L0_0.config = L1_1
L0_0 = usb
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
  L3_8 = usb.config(A0_5, A1_6, A2_7)
  if L3_8 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12423"
  end
end
L0_0.usbConfig = L1_1
