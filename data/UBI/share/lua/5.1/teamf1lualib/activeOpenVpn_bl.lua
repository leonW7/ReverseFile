local L0_0
L0_0 = module
L0_0("com.teamf1.bl.vpn.openvpn.currentusers", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("openvpnLuaLib")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/sslvpn_currentUsers")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
OpenVpnStatustable = "OpenvpnConnectionStatus"
function activeOpenVpnsSectionGet()
  local L0_1
  L0_1 = openvpnLuaLib
  L0_1 = L0_1.getActiveConnections
  L0_1()
  L0_1 = db
  L0_1 = L0_1.getTable
  L0_1 = L0_1(OpenVpnStatustable)
  if L0_1 ~= NIL then
    return _UPVALUE0_.FAILURE, L0_1
  end
  return _UPVALUE0_.SUCCESS, L0_1
end
function activeOpenVpnClientsInfoGet()
  local L0_2
  L0_2 = db
  L0_2 = L0_2.getTable
  L0_2 = L0_2(OpenVpnStatustable)
  if L0_2 ~= NIL then
    return _UPVALUE0_.FAILURE, L0_2
  end
  return _UPVALUE0_.SUCCESS, L0_2
end
