local L0_0
L0_0 = module
L0_0("com.teamf1.core.wireless.statistics", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/stats_db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = UNIT_NAME
if L0_0 ~= "DSR-150N" then
  L0_0 = UNIT_NAME
  if L0_0 == "DSR-250N" then
    L0_0 = HW_SER
  end
elseif L0_0 == "Bx" then
  L0_0 = require
  L0_0("dot11LuaLib")
end
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).vapName = "vapName"
;({}).radioNo = "radioNo"
;({}).interfaceName = "interfaceName"
;({}).rx_packets = "rx_packets"
;({}).tx_packets = "tx_packets"
;({}).rx_bytes = "rx_bytes"
;({}).tx_bytes = "tx_bytes"
;({}).rx_errors = "rx_errors"
;({}).tx_errors = "tx_errors"
;({}).rx_dropped = "rx_dropped"
;({}).tx_dropped = "tx_dropped"
;({}).multicast = "multicast"
;({}).collisions = "collisions"
;({}).rowid = "rowid"
;({}).ROW_ID = "_ROWID_"
;({}).cardNo = "cardNo"
;({}).cardName = "cardName"
;({}).vapEnabled = "vapEnabled"
;({}).connectProgram = "WLAN_CONNECTED_CLIENTS_LIST"
;({}).name = "name"
function statisticsGetAll()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9
  L0_1 = db
  L0_1 = L0_1.getTableWithJoin
  L1_2 = {L2_3}
  L5_6 = ":"
  L6_7 = _UPVALUE2_
  L6_7 = L6_7.vapName
  L0_1 = L0_1(L1_2)
  L1_2 = {}
  i = L2_3
  for L5_6, L6_7 in L2_3(L3_4) do
    L7_8 = i
    L7_8 = L7_8 + 1
    i = L7_8
    L7_8 = i
    L8_9 = {}
    L1_2[L7_8] = L8_9
    L7_8 = stats_db
    L7_8 = L7_8.getRow
    L8_9 = _UPVALUE3_
    L7_8 = L7_8(L8_9, _UPVALUE3_ .. "." .. _UPVALUE2_.interfaceName, L6_7[_UPVALUE1_ .. "." .. _UPVALUE2_.interfaceName])
    L8_9 = db
    L8_9 = L8_9.getAttribute
    L8_9 = L8_9(_UPVALUE4_, _UPVALUE2_.radioNo, L6_7[_UPVALUE1_ .. "." .. _UPVALUE2_.radioNo], _UPVALUE2_.cardNo)
    L7_8[_UPVALUE5_ .. "." .. _UPVALUE2_.cardName] = db.getAttribute(_UPVALUE5_, _UPVALUE2_.cardNo, L8_9, _UPVALUE2_.cardName)
    L7_8[_UPVALUE0_ .. "." .. _UPVALUE2_.vapName] = L6_7[_UPVALUE0_ .. "." .. _UPVALUE2_.vapName]
    L7_8[_UPVALUE1_ .. "." .. _UPVALUE2_.radioNo] = L6_7[_UPVALUE1_ .. "." .. _UPVALUE2_.radioNo]
    L7_8[_UPVALUE1_ .. "." .. _UPVALUE2_.rowid] = L6_7[_UPVALUE1_ .. "." .. _UPVALUE2_.ROW_ID]
    L7_8[_UPVALUE1_ .. "." .. _UPVALUE2_.radioNo] = L6_7[_UPVALUE1_ .. "." .. _UPVALUE2_.radioNo]
    if #L7_8[_UPVALUE0_ .. "." .. _UPVALUE2_.vapName] > 10 then
      L7_8[_UPVALUE0_ .. "." .. _UPVALUE2_.vapName] = string.sub(L7_8[_UPVALUE0_ .. "." .. _UPVALUE2_.vapName], 1, 10) .. "..."
    end
    L1_2[i][_UPVALUE2_.vapName] = L7_8[_UPVALUE0_ .. "." .. _UPVALUE2_.vapName]
    L1_2[i][_UPVALUE2_.radioNo] = L7_8[_UPVALUE1_ .. "." .. _UPVALUE2_.radioNo]
    L1_2[i][_UPVALUE2_.rx_packets] = L7_8[_UPVALUE3_ .. "." .. _UPVALUE2_.rx_packets]
    L1_2[i][_UPVALUE2_.tx_packets] = L7_8[_UPVALUE3_ .. "." .. _UPVALUE2_.tx_packets]
    L1_2[i][_UPVALUE2_.rx_bytes] = L7_8[_UPVALUE3_ .. "." .. _UPVALUE2_.rx_bytes]
    L1_2[i][_UPVALUE2_.tx_bytes] = L7_8[_UPVALUE3_ .. "." .. _UPVALUE2_.tx_bytes]
    L1_2[i][_UPVALUE2_.rx_errors] = L7_8[_UPVALUE3_ .. "." .. _UPVALUE2_.rx_errors]
    L1_2[i][_UPVALUE2_.tx_errors] = L7_8[_UPVALUE3_ .. "." .. _UPVALUE2_.tx_errors]
    L1_2[i][_UPVALUE2_.rx_dropped] = L7_8[_UPVALUE3_ .. "." .. _UPVALUE2_.rx_dropped]
    L1_2[i][_UPVALUE2_.tx_dropped] = L7_8[_UPVALUE3_ .. "." .. _UPVALUE2_.tx_dropped]
    L1_2[i][_UPVALUE2_.multicast] = L7_8[_UPVALUE3_ .. "." .. _UPVALUE2_.multicast]
    L1_2[i][_UPVALUE2_.collisions] = L7_8[_UPVALUE3_ .. "." .. _UPVALUE2_.collisions]
  end
  return L2_3, L3_4
end
function wirelessenabledVapsGetAll()
  local L0_10
  L0_10 = db
  L0_10 = L0_10.getRowsWhere
  L0_10 = L0_10(_UPVALUE0_, _UPVALUE1_.vapEnabled .. " = 1")
  if L0_10 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_10
end
function wirelessClientRowsGet(A0_11)
  local L1_12
  L1_12 = db
  L1_12 = L1_12.getRowsWithJoin
  L1_12 = L1_12({
    _UPVALUE0_ .. ":" .. _UPVALUE1_ .. ":" .. _UPVALUE2_.vapName
  }, _UPVALUE0_ .. "." .. _UPVALUE2_.vapName, A0_11)
  if L1_12 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L1_12
end
function wirelessClientRowsGet150N(A0_13)
  return (dot11LuaLib.GetStaCliInfo(A0_13))
end
function wirelessClientRowsGet250N(A0_14)
  local L1_15
  L1_15 = db
  L1_15 = L1_15.getAttribute
  L1_15 = L1_15(_UPVALUE0_, _UPVALUE1_.name, _UPVALUE1_.connectProgram, "value")
  if UNIT_NAME ~= "DSR-1000AC" and UNIT_NAME ~= "DSR-500AC" then
    util.appendDebugOut("Exec = " .. os.execute(L1_15 .. " " .. A0_14 .. " " .. "/tmp/system.db") .. "<br>")
  end
  return (db.getRowsWhere(_UPVALUE2_, _UPVALUE1_.interfaceName .. "= '" .. A0_14 .. "'"))
end
function statisticsGetCurAP(A0_16)
  local L1_17, L2_18, L3_19, L4_20
  L1_17 = {}
  L2_18 = db
  L2_18 = L2_18.getRow
  L3_19 = _UPVALUE0_
  L4_20 = _UPVALUE0_
  L4_20 = L4_20 .. "." .. _UPVALUE1_.ROW_ID
  L2_18 = L2_18(L3_19, L4_20, A0_16)
  L3_19 = db
  L3_19 = L3_19.getAttribute
  L4_20 = _UPVALUE2_
  L3_19 = L3_19(L4_20, _UPVALUE1_.vapName, L2_18[_UPVALUE0_ .. "." .. _UPVALUE1_.vapName], "interfaceName")
  L4_20 = db
  L4_20 = L4_20.getRowsWithJoin
  L4_20 = L4_20({
    _UPVALUE0_ .. ":" .. _UPVALUE2_ .. ":" .. _UPVALUE1_.vapName
  }, _UPVALUE0_ .. "." .. _UPVALUE1_.vapName, L2_18["dot11VAP.vapName"])
  for _FORV_9_, _FORV_10_ in pairs(L4_20) do
    L1_17[0 + 1] = {}
    db.getRow(_UPVALUE3_, _UPVALUE3_ .. "." .. _UPVALUE1_.interfaceName, _FORV_10_[_UPVALUE2_ .. "." .. _UPVALUE1_.interfaceName])[_UPVALUE0_ .. "." .. _UPVALUE1_.vapName] = L2_18[_UPVALUE0_ .. "." .. _UPVALUE1_.vapName]
    db.getRow(_UPVALUE3_, _UPVALUE3_ .. "." .. _UPVALUE1_.interfaceName, _FORV_10_[_UPVALUE2_ .. "." .. _UPVALUE1_.interfaceName])[_UPVALUE2_ .. "." .. _UPVALUE1_.radioNo] = _FORV_10_[_UPVALUE2_ .. "." .. _UPVALUE1_.radioNo]
    db.getRow(_UPVALUE3_, _UPVALUE3_ .. "." .. _UPVALUE1_.interfaceName, _FORV_10_[_UPVALUE2_ .. "." .. _UPVALUE1_.interfaceName])[_UPVALUE2_ .. "." .. _UPVALUE1_.rowid] = _FORV_10_[_UPVALUE2_ .. "." .. _UPVALUE1_.ROW_ID]
    L1_17[0 + 1][_UPVALUE1_.vapName] = db.getRow(_UPVALUE3_, _UPVALUE3_ .. "." .. _UPVALUE1_.interfaceName, _FORV_10_[_UPVALUE2_ .. "." .. _UPVALUE1_.interfaceName])[_UPVALUE0_ .. "." .. _UPVALUE1_.vapName]
    L1_17[0 + 1][_UPVALUE1_.radioNo] = db.getRow(_UPVALUE3_, _UPVALUE3_ .. "." .. _UPVALUE1_.interfaceName, _FORV_10_[_UPVALUE2_ .. "." .. _UPVALUE1_.interfaceName])[_UPVALUE2_ .. "." .. _UPVALUE1_.radioNo]
    L1_17[0 + 1][_UPVALUE1_.rx_packets] = db.getRow(_UPVALUE3_, _UPVALUE3_ .. "." .. _UPVALUE1_.interfaceName, _FORV_10_[_UPVALUE2_ .. "." .. _UPVALUE1_.interfaceName])[_UPVALUE3_ .. "." .. _UPVALUE1_.rx_packets]
    L1_17[0 + 1][_UPVALUE1_.tx_packets] = db.getRow(_UPVALUE3_, _UPVALUE3_ .. "." .. _UPVALUE1_.interfaceName, _FORV_10_[_UPVALUE2_ .. "." .. _UPVALUE1_.interfaceName])[_UPVALUE3_ .. "." .. _UPVALUE1_.tx_packets]
    L1_17[0 + 1][_UPVALUE1_.rx_bytes] = db.getRow(_UPVALUE3_, _UPVALUE3_ .. "." .. _UPVALUE1_.interfaceName, _FORV_10_[_UPVALUE2_ .. "." .. _UPVALUE1_.interfaceName])[_UPVALUE3_ .. "." .. _UPVALUE1_.rx_bytes]
    L1_17[0 + 1][_UPVALUE1_.tx_bytes] = db.getRow(_UPVALUE3_, _UPVALUE3_ .. "." .. _UPVALUE1_.interfaceName, _FORV_10_[_UPVALUE2_ .. "." .. _UPVALUE1_.interfaceName])[_UPVALUE3_ .. "." .. _UPVALUE1_.tx_bytes]
    L1_17[0 + 1][_UPVALUE1_.rx_errors] = db.getRow(_UPVALUE3_, _UPVALUE3_ .. "." .. _UPVALUE1_.interfaceName, _FORV_10_[_UPVALUE2_ .. "." .. _UPVALUE1_.interfaceName])[_UPVALUE3_ .. "." .. _UPVALUE1_.rx_errors]
    L1_17[0 + 1][_UPVALUE1_.tx_errors] = db.getRow(_UPVALUE3_, _UPVALUE3_ .. "." .. _UPVALUE1_.interfaceName, _FORV_10_[_UPVALUE2_ .. "." .. _UPVALUE1_.interfaceName])[_UPVALUE3_ .. "." .. _UPVALUE1_.tx_errors]
    L1_17[0 + 1][_UPVALUE1_.rx_dropped] = db.getRow(_UPVALUE3_, _UPVALUE3_ .. "." .. _UPVALUE1_.interfaceName, _FORV_10_[_UPVALUE2_ .. "." .. _UPVALUE1_.interfaceName])[_UPVALUE3_ .. "." .. _UPVALUE1_.rx_dropped]
    L1_17[0 + 1][_UPVALUE1_.tx_dropped] = db.getRow(_UPVALUE3_, _UPVALUE3_ .. "." .. _UPVALUE1_.interfaceName, _FORV_10_[_UPVALUE2_ .. "." .. _UPVALUE1_.interfaceName])[_UPVALUE3_ .. "." .. _UPVALUE1_.tx_dropped]
    L1_17[0 + 1][_UPVALUE1_.multicast] = db.getRow(_UPVALUE3_, _UPVALUE3_ .. "." .. _UPVALUE1_.interfaceName, _FORV_10_[_UPVALUE2_ .. "." .. _UPVALUE1_.interfaceName])[_UPVALUE3_ .. "." .. _UPVALUE1_.multicast]
    L1_17[0 + 1][_UPVALUE1_.collisions] = db.getRow(_UPVALUE3_, _UPVALUE3_ .. "." .. _UPVALUE1_.interfaceName, _FORV_10_[_UPVALUE2_ .. "." .. _UPVALUE1_.interfaceName])[_UPVALUE3_ .. "." .. _UPVALUE1_.collisions]
  end
  return _UPVALUE4_.SUCCESS, L1_17
end
