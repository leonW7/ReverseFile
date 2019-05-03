local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wan.ipAliasing", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wan_ipAliasing")
L0_0 = require
L0_0("teamf1lualib/wan_configurablePort")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/wan_dhcp")
L0_0 = require
L0_0("teamf1lualib/ipsec_dhcpserver")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.wan.ipaliasing")
ipAliasingTable = "ifStaticIPAlias"
;({}).cookie = "cookie"
;({}).logicalIfName = "LogicalIfName"
;({}).ipaddress = "IPAddress"
;({}).subnetmask = "SubnetMask"
function ipAliasGet()
  local L0_1, L1_2, L2_3, L3_4
  returnCode, L0_1, L1_2, L2_3, L3_4 = _UPVALUE0_.aliasGet()
  if returnCode ~= SUCCESS then
    return returnCode
  end
  return returnCode, L0_1, L1_2, L2_3, L3_4
end
function ipAliasGetNext(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10
  L5_10 = A0_5["ipAliasing.cookie"]
  if L5_10 == _UPVALUE0_.NIL then
    util.appendDebugOut("GetNext : Invalid Cookie ")
    return _UPVALUE0_.BAD_PARAMETER
  end
  returnCode, L1_6, L2_7, L3_8, L4_9 = _UPVALUE1_.aliasGetNext(L5_10)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    return returnCode
  end
  return returnCode, L1_6, L2_7, L3_8, L4_9
end
function ipAliasSet(A0_11)
  local L1_12, L2_13, L3_14, L4_15
  L1_12 = ACCESS_LEVEL
  if L1_12 ~= 0 then
    L1_12 = util
    L1_12 = L1_12.appendDebugOut
    L2_13 = "Detected unauthorized access for Ip Aliasing "
    L1_12(L2_13)
    L1_12 = _UPVALUE0_
    L1_12 = L1_12.UNAUTHORIZED
    return L1_12
  end
  L1_12 = A0_11["ipAliasing.wanPort"]
  L2_13 = A0_11["ipAliasing.ipAddress"]
  L3_14 = A0_11["ipAliasing.subnetMask"]
  L4_15 = A0_11["ipAliasing.cookie"]
  if L4_15 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L2_13 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Ip Address")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L1_12 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Logical name")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L3_14 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Subnet Mask")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.aliasSet(L4_15, L1_12, L2_13, L3_14)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in ip Aliasing page" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
function ipAliasCreate(A0_16)
  local L1_17, L2_18, L3_19
  L1_17 = ACCESS_LEVEL
  if L1_17 ~= 0 then
    L1_17 = util
    L1_17 = L1_17.appendDebugOut
    L2_18 = "Detected unauthorized access for ip Aliasing "
    L1_17(L2_18)
    L1_17 = _UPVALUE0_
    L1_17 = L1_17.UNAUTHORIZED
    return L1_17
  end
  L1_17 = A0_16["ipAliasing.wanPort"]
  L2_18 = A0_16["ipAliasing.ipAddress"]
  L3_19 = A0_16["ipAliasing.subnetMask"]
  if L2_18 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Ip Address")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L1_17 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Logical name")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L3_19 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Subnet Mask")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.aliasCreate(L1_17, L2_18, L3_19)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in ip Aliasing page" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
function ipAliasDelete(A0_20)
  local L1_21, L2_22
  L2_22 = A0_20["ipAliasing.cookie"]
  if L2_22 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie ")
    return _UPVALUE0_.BAD_PARAMETER
  end
  returnCode, L1_21 = _UPVALUE1_.aliasDelete(L2_22)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    return returnCode
  end
  return returnCode, L1_21
end
function ipAliasGetCur(A0_23)
  local L1_24, L2_25, L3_26, L4_27, L5_28
  returnCode, L1_24, L3_26, L4_27, L5_28 = _UPVALUE0_.aliasGetCur(A0_23)
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, L1_24, L3_26, L4_27, L5_28
end
function ipAliasDeleteAll()
  local L0_29
  L0_29 = _UPVALUE0_.aliasDeleteAll()
  if L0_29 ~= _UPVALUE1_.SUCCESS then
    return L0_29
  end
  return L0_29
end
function ipAliasGetAll()
  local L0_30, L1_31
  L1_31 = {}
  L0_30, L1_31 = _UPVALUE0_.aliasGetAll()
  if L0_30 ~= _UPVALUE1_.SUCCESS then
    return L0_30
  end
  return L0_30, L1_31
end
function configurablePortGet()
  local L0_32, L1_33, L2_34
  L0_32 = _UPVALUE0_
  L0_32 = L0_32.configPortUsageGet
  L2_34 = L0_32()
  if L0_32 ~= _UPVALUE1_.SUCCESS then
    return L0_32
  end
  return L0_32, L2_34
end
function dmzRowsGet()
  return (_UPVALUE0_.dmzRows())
end
function wan1TblGet()
  return (_UPVALUE0_.wan1TableGet())
end
function wan2TblGet()
  return (_UPVALUE0_.wan2TableGet())
end
function networkIntrTbl()
  return (_UPVALUE0_.networkIntrTblGet())
end
function ifStaticRows(A0_35)
  return (_UPVALUE0_.ifStaticRowsGet(A0_35))
end
function wan1IPGetRow()
  return (_UPVALUE0_.wan1IPGet())
end
function wan2IPGetRow()
  return (_UPVALUE0_.wan2IPGet())
end
function wanIPGetRow()
  return (_UPVALUE0_.wanIPGet())
end
function configPortGet()
  return (_UPVALUE0_.getConfigPort())
end
function dhcpserverRangeGet()
  local L0_36, L1_37, L2_38, L3_39, L4_40, L5_41, L6_42, L7_43
  L0_36 = _UPVALUE0_
  L0_36 = L0_36.dhcpserverConfigGet
  L4_40 = L0_36()
  L5_41 = L0_36
  L6_42 = L1_37
  L7_43 = L2_38
  return L5_41, L6_42, L7_43, L3_39, L4_40
end
