local L0_0
L0_0 = module
L0_0("com.teamf1.core.radius.accounting", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/dhcp_returnCodes")
L0_0 = require
L0_0("teamf1lualib/radiusAccounting_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
wlanRadAccClient = "wlanRadAccClient"
wlanRadiusAccGlobalMode = "wlanRadAccGlobalMode"
;({}).radAccProfileName = "radAccProfileName"
;({}).serverIp = "serverIp"
;({}).port = "port"
;({}).secret = "secret"
;({}).serverName = "serverName"
ROWID = "_ROWID_"
function radiusAccountingGetAll()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getTable
  L0_1 = L0_1(wlanRadAccClient)
  if L0_1 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_1
end
function radiusAccConfig(A0_2, A1_3, A2_4)
  local L3_5, L4_6
  L3_5 = "wlanRadAccClient"
  if A2_4 == "add" then
    L4_6 = {}
    L4_6 = db.getTable("wlanRadAccClient")
    if #L4_6 >= _UPVALUE0_ then
      return _UPVALUE1_.MAXIMUM_ACCOUNTING_SERVERS_LIMIT_REACHED
    end
    if db.existsRow(L3_5, "serverIp", A0_2["wlanRadAccClient.serverIp"]) then
      return _UPVALUE1_.IP_ADDRESS_ALREADY_CONFIGURED_PLEASE_CHANGE_THE_SERVER_IP_ADDRESS
    end
    if db.existsRow(L3_5, "serverName", A0_2["wlanRadAccClient.serverName"]) then
      return _UPVALUE1_.SERVER_NAME_ALREADY_CONFIGURED_PLEASE_CHANGE_THE_SERVER_NAME
    end
  elseif A2_4 == "edit" then
    L4_6 = db
    L4_6 = L4_6.getAttribute
    L4_6 = L4_6("wlanRadAccClient", "serverIp", A0_2["wlanRadAccClient.serverIp"], "_ROWID_")
    if L4_6 ~= nil and L4_6 ~= A1_3 then
      return _UPVALUE1_.IP_ADDRESS_ALREADY_CONFIGURED_PLEASE_CHANGE_THE_SERVER_IP_ADDRESS
    end
    L4_6 = db.getAttribute("wlanRadAccClient", "serverName", A0_2["wlanRadAccClient.serverName"], "_ROWID_")
    if L4_6 ~= nil and L4_6 ~= A1_3 then
      return _UPVALUE1_.SERVER_NAME_ALREADY_CONFIGURED_PLEASE_CHANGE_THE_SERVER_NAME
    end
  elseif A2_4 == "delete" then
    L4_6 = db
    L4_6 = L4_6.getAttribute
    L4_6 = L4_6("wlanRadAccClient", "_ROWID_", A0_2, "radAccProfileName")
    radAccProfile = L4_6
    L4_6 = radAccProfile
    if L4_6 == "Default" then
      L4_6 = _UPVALUE1_
      L4_6 = L4_6.DEFAULT_ACCOUNTING_SERVER_CANT_BE_DELETED
      return L4_6
    end
  end
  L4_6 = false
  if A2_4 == "add" then
    A0_2["wlanRadAccClient.radAccProfileName"] = "NotDefault"
    L4_6 = db.insert(wlanRadAccClient, A0_2)
  elseif A2_4 == "edit" then
    if tonumber(A1_3) == 1 then
      A0_2["wlanRadAccClient.radAccProfileName"] = "Default"
    else
      A0_2["wlanRadAccClient.radAccProfileName"] = "NotDefault"
    end
    L4_6 = db.update(wlanRadAccClient, A0_2, A1_3)
  elseif A2_4 == "delete" then
    L4_6 = db.deleteRow(wlanRadAccClient, ROWID, A0_2)
    if L4_6 == NIL then
      return _UPVALUE2_.FAILURE, cookie
    end
  end
  if L4_6 then
    return _UPVALUE2_.SUCCESS, "Operation Succedded."
  else
    return _UPVALUE2_.FAILURE, "Operation Failed."
  end
end
function radiusAccGlobalEdit(A0_7, A1_8)
  local L2_9, L3_10, L4_11
  L2_9 = true
  L3_10 = {}
  L4_11 = nil
  if A0_7 ~= nil then
    L3_10["wlanRadAccGlobalMode.radiusAccEnable"] = A0_7["wlanRadAccGlobalMode.radiusAccEnable"]
    L3_10["wlanRadAccGlobalMode.interimUpdateMode"] = A0_7["wlanRadAccGlobalMode.interimUpdateMode"]
    L3_10["wlanRadAccGlobalMode.interimUpdateInterval"] = A0_7["wlanRadAccGlobalMode.interimUpdateInterval"]
    L4_11 = db.getRows("wlanRadAccGlobalMode", "radAccGlobalProfileName", A1_8)[1]["wlanRadAccGlobalMode._ROWID_"]
  end
  L2_9 = db.update("wlanRadAccGlobalMode", L3_10, L4_11)
  if L2_9 then
    return _UPVALUE0_.SUCCESS, "Operation Succeeded."
  else
    return _UPVALUE1_.RADIUS_ACCOUNTING_CONFIGURATION_FAILED
  end
end
function radGlobalSettingsGet()
  local L0_12
  L0_12 = db
  L0_12 = L0_12.getTable
  L0_12 = L0_12(wlanRadiusAccGlobalMode)
  if L0_12 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_12
end
function radiusServerDetailsGet(A0_13)
  if db.getRow(wlanRadAccClient, ROWID, A0_13) == NIL then
    return _UPVALUE0_.FAILURE, A0_13
  end
  return _UPVALUE0_.SUCCESS, A0_13, db.getRow(wlanRadAccClient, ROWID, A0_13)[wlanRadAccClient .. "." .. _UPVALUE1_.serverIp], db.getRow(wlanRadAccClient, ROWID, A0_13)[wlanRadAccClient .. "." .. _UPVALUE1_.port], db.getRow(wlanRadAccClient, ROWID, A0_13)[wlanRadAccClient .. "." .. _UPVALUE1_.secret], db.getRow(wlanRadAccClient, ROWID, A0_13)[wlanRadAccClient .. "." .. _UPVALUE1_.serverName]
end
