local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = {}
SSLVPNStatus = L0_0
L0_0 = SSLVPNStatus
function L0_0.get(A0_1, A1_2)
  local L2_3
  L2_3 = db.getRow(A1_2, "_ROWID_", A0_1)
  if L2_3 == nil then
    L2_3 = {}
    L2_3["SslvpnEnable.sslvpnEnableStatus"] = 0
    L2_3["SslvpnEnable.sslvpnPort"] = 443
  end
  return L2_3
end
function L0_0(A0_4, A1_5, A2_6)
  if db.typeAndRangeValidate(A0_4) then
    if A2_6 == "add" then
      return db.insert("SslvpnEnable", A0_4)
    elseif A2_6 == "edit" then
      return db.update("SslvpnEnable", A0_4, A1_5)
    elseif A2_6 == "delete" then
      return db.deleteRow("SslvpnEnable", "_ROWID_", A0_4["SslvpnEnable._ROWID_"])
    end
  end
  return false
end
function SSLVPNStatus.set(A0_7, A1_8, A2_9)
  local L3_10, L4_11
  L3_10 = false
  L4_11 = "10788"
  db.beginTransaction()
  if db.getRow(A2_9, "_ROWID_", 1) == nil then
    A0_7["SslvpnEnable.sslvpnPort"] = 443
    L3_10 = _UPVALUE0_(A0_7, 1, "add")
  else
    L3_10 = _UPVALUE0_(A0_7, 1, "edit")
  end
  if L3_10 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", L4_11
  end
end
