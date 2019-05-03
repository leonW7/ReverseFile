require("teamf1lualib/db")
require("teamf1lualib/util")
ospf = {}
ospf6 = {}
ospfConfig = db.crud
ospfAttributeGet = db.getRow
ospfStatusGet = db.getAttribute
function ospf.edit(A0_0, A1_1)
  local L2_2
  L2_2 = db.update("ospf", A0_0, A1_1)
  if L2_2 then
    return "OK", "12265"
  else
    return "ERROR", "12755"
  end
end
function ospf.get(A0_3)
  local L1_4
  L1_4 = {}
  L1_4 = ospfAttributeGet("ospf", "_ROWID_", A0_3)
  if L1_4 == nil then
    return "ERROR", nil
  else
    return L1_4
  end
end
function ospf.getTable()
  if db.getTable("ospf") == nil then
    return "ERROR", nil
  else
    return (db.getTable("ospf"))
  end
end
function isospfv2Enable(A0_5)
  local L1_6
  L1_6 = ospfStatusGet("ospf", "LogicalIfName", A0_5, ospfEnable)
  if L1_6 then
    return 1
  else
    return 0
  end
end
function ospf6.edit(A0_7, A1_8)
  local L2_9
  L2_9 = {}
  L2_9 = db.update("ospf6", A0_7, A1_8)
  if L2_9 then
    return "OK", "12265"
  else
    return "ERROR", "12756"
  end
end
function ospf6.get(A0_10)
  local L1_11
  L1_11 = {}
  L1_11 = ospfAttributeGet("ospf6", "_ROWID_", A0_10)
  if L1_11 == nil then
    return "ERROR", nil
  else
    return L1_11
  end
end
function ospf6.getTable()
  if db.getTable("ospf6") == nil then
    return "ERROR", nil
  else
    return (db.getTable("ospf6"))
  end
end
function isospfv3Enable(A0_12)
  local L1_13
  L1_13 = ospfStatusGet("ospf6", "LogicalIfName", A0_12, ospf6Enable)
  if L1_13 then
    return 1
  else
    return 0
  end
end
