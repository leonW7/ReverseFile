local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/fwL2firewallRules")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/fwPriorityMap")
L0_0 = require
L0_0("teamf1lualib/vlan_vlan")
L0_0 = require
L0_0("teamf1lualib/fwSchedules")
L0_0 = require
L0_0("teamf1lualib/wan_routingMode")
L0_0 = require
L0_0("teamf1lualib/fwCustomServices")
L0_0 = require
L0_0("teamf1lualib/wan_ipAliasing")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.wan.ipaliasing")
L2firewallRulesTable = "L2FirewallRules"
attribute = {}
attribute.ruleType = "RuleType"
attribute.status = "Status"
attribute.serviceName = "L2ServiceName"
attribute.action = "Action"
attribute.scheduleName = "ScheduleName"
attribute.sourceAddressType = "SourceAddressType"
attribute.sourceAddressStart = "SourceAddressStart"
attribute.sourceAddressEnd = "SourceAddressEnd"
attribute.destinationAddressType = "DestinationAddressType"
attribute.destinationAddressStart = "DestinationAddressStart"
attribute.destinationAddressEnd = "DestinationAddressEnd"
attribute.sourceMACAddressStart = "SourceMACAddressStart"
attribute.destinationAddressEnd = "DestinationAddressEnd"
attribute.sourceMACAddressEnd = "SourceMACAddressEnd"
attribute.destinationMACAddressType = "DestinationMACAddressType"
attribute.destinationMACAddressStart = "DestinationMACAddressStart"
attribute.destinationMACAddressEnd = "DestinationMACAddressEnd"
attribute.vlanId = "vlanId"
attribute.dscp = "dscp"
attribute.classId = "classId"
OTHER = "OTHER"
IPFLAG = "4"
ENABLE = "1"
DISABLE = "0"
DEFAULT_ROWID = "1"
l2FirewallRules = {}
l2FirewallRules.defaultfwPolicy = {}
function l2FirewallRules.delete(A0_1)
  local L1_2, L2_3
  L1_2 = ACCESS_LEVEL
  if L1_2 ~= 0 then
    L1_2 = util
    L1_2 = L1_2.appendDebugOut
    L2_3 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_2(L2_3)
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.UNAUTHORIZED
    return L1_2
  end
  L1_2 = A0_1["bridgeFirewallRules.cookie"]
  if L1_2 == nil then
    L2_3 = util
    L2_3 = L2_3.appendDebugOut
    L2_3("Delete : Invalid Cookie")
    L2_3 = _UPVALUE0_
    L2_3 = L2_3.BAD_PARAMETER
    return L2_3
  end
  L2_3 = nil
  _UPVALUE1_.start()
  L2_3, cookie = fw.core.l2firewallRules.L2.delete(L1_2)
  if L2_3 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L2_3)
    _UPVALUE1_.abort()
    return L2_3, L1_2
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function l2FirewallRules.deleteAll()
  local L0_4
  L0_4 = ACCESS_LEVEL
  if L0_4 ~= 0 then
    L0_4 = util
    L0_4 = L0_4.appendDebugOut
    L0_4("Detected Unauthorized access for page DUMMY PAGE")
    L0_4 = _UPVALUE0_
    L0_4 = L0_4.UNAUTHORIZED
    return L0_4
  end
  L0_4 = nil
  _UPVALUE1_.start()
  L0_4, cookie = fw.core.l2firewallRules.L2.deleteAll()
  if L0_4 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L0_4)
    _UPVALUE1_.abort()
    return L0_4, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function l2FirewallRules.config(A0_5)
  local L1_6, L2_7
  L2_7 = ACCESS_LEVEL
  if L2_7 ~= 0 then
    L2_7 = util
    L2_7 = L2_7.appendDebugOut
    L2_7("Detected Unauthorized access for page DUMMY PAGE")
    L2_7 = _UPVALUE0_
    L2_7 = L2_7.UNAUTHORIZED
    return L2_7
  end
  L2_7 = nil
  _UPVALUE1_.start()
  L2_7, cookie = fw.core.l2firewallRules.L2.addSet(A0_5)
  if L2_7 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L2_7)
    _UPVALUE1_.abort()
    return L2_7, cookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function l2FirewallRules.set(A0_8)
  local L1_9, L2_10, L3_11
  L2_10 = ACCESS_LEVEL
  if L2_10 ~= 0 then
    L2_10 = util
    L2_10 = L2_10.appendDebugOut
    L3_11 = "Detected Unauthorized access for page DUMMY PAGE"
    L2_10(L3_11)
    L2_10 = _UPVALUE0_
    L2_10 = L2_10.UNAUTHORIZED
    return L2_10
  end
  L2_10 = nil
  L3_11 = A0_8["bridgeFirewallRules.cookie"]
  _UPVALUE1_.start()
  L2_10, cookie = fw.core.l2firewallRules.L2.editSet(A0_8, L3_11)
  if L2_10 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L2_10)
    _UPVALUE1_.abort()
    return L2_10, cookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function l2FirewallRules.enable(A0_12)
  local L1_13
  L1_13 = ACCESS_LEVEL
  if L1_13 ~= 0 then
    L1_13 = util
    L1_13 = L1_13.appendDebugOut
    L1_13("Detected Unauthorized access for page DUMMY PAGE")
    L1_13 = _UPVALUE0_
    L1_13 = L1_13.UNAUTHORIZED
    return L1_13
  end
  L1_13 = A0_12["bridgeFirewallRules.cookie"]
  _UPVALUE1_.start()
  returnCode, L1_13 = fw.core.l2firewallRules.L2.ruleStatusEnable(L1_13)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function l2FirewallRules.enableAll()
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page DUMMY PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  _UPVALUE1_.start()
  returnCode, cookie = fw.core.l2firewallRules.L2.EnableAll()
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function l2FirewallRules.disable(A0_14)
  local L1_15
  L1_15 = ACCESS_LEVEL
  if L1_15 ~= 0 then
    L1_15 = util
    L1_15 = L1_15.appendDebugOut
    L1_15("Detected Unauthorized access for page DUMMY PAGE")
    L1_15 = _UPVALUE0_
    L1_15 = L1_15.UNAUTHORIZED
    return L1_15
  end
  L1_15 = A0_14["bridgeFirewallRules.cookie"]
  _UPVALUE1_.start()
  returnCode, L1_15 = fw.core.l2firewallRules.L2.ruleStatusDisable(L1_15)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function l2FirewallRules.disableAll()
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page DUMMY PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  _UPVALUE1_.start()
  returnCode, cookie = fw.core.l2firewallRules.L2.DisableAll()
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function l2FirewallRules.listGet()
  local L0_16, L1_17
  L0_16, L1_17 = fw.core.l2firewallRules.L2.listGet()
  return L0_16, L1_17
end
function l2FirewallRules.addGet(A0_18)
  local L1_19
  L1_19 = fw.core.l2firewallRules.L2.addGet(curCookie)
  return L1_19
end
function l2FirewallRules.editGet(A0_20)
  local L1_21, L2_22
  L1_21 = A0_20
  if L1_21 == nil then
    L2_22 = util
    L2_22 = L2_22.appendDebugOut
    L2_22("Delete : Invalid Cookie")
    L2_22 = _UPVALUE0_
    L2_22 = L2_22.BAD_PARAMETER
    return L2_22
  end
  L2_22 = nil
  L2_22 = fw.core.l2firewallRules.L2.editGet(L1_21)
  return L2_22
end
