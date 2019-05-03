local L0_0
L0_0 = module
L0_0("com.teamf1.bl.ipv6.teredo", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/ipv6_teredo")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.ipv6.teredo")
function teredoConfigGet()
  local L0_1, L1_2, L2_3, L3_4
  L0_1 = _UPVALUE0_
  L0_1 = L0_1.teredoConfigGet
  L3_4 = L0_1()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3, L3_4
end
function teredoConfigSet(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10
  L3_8 = ACCESS_LEVEL
  if L3_8 ~= 0 then
    L3_8 = util
    L3_8 = L3_8.appendDebugOut
    L4_9 = "Detected Unauthorized access for page teredoTunnel"
    L3_8(L4_9)
    L3_8 = _UPVALUE0_
    L3_8 = L3_8.UNAUTHORIZED
    return L3_8
  end
  L3_8 = A0_5["teredoTunnel.tunnelStatus"]
  L4_9 = A0_5["teredoTunnel.serverName"]
  L5_10 = A0_5["teredoTunnel.secodndaryServerName"]
  if L3_8 == nil then
    util.appendDebugOut("Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L1_6, L2_7 = _UPVALUE2_.teredoConfigSet(L3_8, L4_9, L5_10)
  if L1_6 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page teredoTunnel" .. L1_6)
    _UPVALUE1_.abort()
    return L1_6, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L2_7
end
