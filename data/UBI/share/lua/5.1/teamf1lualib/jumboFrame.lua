local L0_0
L0_0 = module
L0_0("com.teamf1.core.jumboFrame", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/vlan_validation")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/jumbo_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.jumbo_returnCodes")
jumboTable = "PowerModeConf"
mtuTable = "networkinterface"
nimfMtuTbl = "NimfMtu"
nimfConfTbl = "NimfConf"
attribute = {}
attribute.interfaceName = "interfaceName"
attribute.JumboFrameEnable = "JumboFrameEnable"
attribute.mtu = "MTU"
attribute.logicalIfName = "LogicalIfName"
attribute.addressFamily = "AddressFamily"
attribute.mtuSize = "MtuSize"
attribute.useDefaultMtu = "UseDefaultMtu"
attribute.MinMtu = "MinMtu"
attribute.MaxMtu = "MaxMtu"
BDG_NAME = "bdg1"
ENABLE = "1"
DISABLE = "0"
DEFAULT_COOKIE = "1"
ROWID = "_ROWID_"
where = attribute.interfaceName .. " = '" .. BDG_NAME .. "'"
DEFAULT_MTU = "1500"
DEFAULT_MIN_MTU = "1200"
DEFAULT_MAX_MTU = "1500"
JUMBO_MIN_MTU = "1200"
JUMBO_MAX_MTU = "9548"
if UNIT_NAME ~= "DSR-250N" and UNIT_NAME ~= "DSR-250" then
  JUMBO_MAX_MTU = 9198
end
function isJumboFrameEnable()
  local L0_1, L1_2
  L0_1 = firstCookieGet
  L1_2 = jumboTable
  L0_1 = L0_1(L1_2)
  L1_2 = NIL
  if L0_1 == L1_2 then
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.INVALID_COOKIE
    return L1_2
  end
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(jumboTable, ROWID, L0_1, attribute.JumboFrameEnable)
  if L1_2 == NIL then
    return _UPVALUE0_.FAILURE, nil
  end
  return _UPVALUE0_.SUCCESS, nil, L1_2
end
function isJumboFrameEnableGetNext()
  local L1_3
  L1_3 = _UPVALUE0_
  L1_3 = L1_3.NOT_SUPPORTED
  return L1_3
end
function JumboFrameEnable()
  local L0_4
  L0_4 = firstCookieGet
  L0_4 = L0_4(jumboTable)
  if L0_4 == NIL then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if db.setAttribute(jumboTable, ROWID, L0_4, attribute.JumboFrameEnable, ENABLE) == NIL then
    return _UPVALUE0_.FAILURE, nil
  end
  return _UPVALUE0_.SUCCESS, nil
end
function JumboFrameDisable()
  local L0_5
  L0_5 = firstCookieGet
  L0_5 = L0_5(jumboTable)
  if L0_5 == NIL then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if db.setAttribute(jumboTable, ROWID, L0_5, attribute.JumboFrameEnable, DISABLE) == NIL then
    return _UPVALUE0_.FAILURE, nil
  end
  return _UPVALUE0_.SUCCESS, nil
end
function jumboGet()
  local L0_6
  L0_6 = db
  L0_6 = L0_6.getAttribute
  L0_6 = L0_6(jumboTable, ROWID, DEFAULT_COOKIE, attribute.JumboFrameEnable)
  if L0_6 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_6
end
function jumboSet(A0_7)
  local L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18
  L1_8 = _UPVALUE0_
  L1_8 = L1_8.NIL
  L2_9 = NIL
  if A0_7 == L2_9 then
    L2_9 = _UPVALUE1_
    L2_9 = L2_9.COMP_JUMBO_JUMBO_NIL
    return L2_9
  end
  L2_9 = UNIT_NAME
  if L2_9 ~= "DSR-150N" then
    L2_9 = UNIT_NAME
    if L2_9 ~= "DSR-150" then
      L2_9 = db
      L2_9 = L2_9.getAttribute
      L3_10 = jumboTable
      L4_11 = ROWID
      L5_12 = DEFAULT_COOKIE
      L6_13 = attribute
      L6_13 = L6_13.JumboFrameEnable
      L2_9 = L2_9(L3_10, L4_11, L5_12, L6_13)
      L1_8 = L2_9
      L2_9 = NIL
      if L1_8 == L2_9 then
        L2_9 = _UPVALUE0_
        L2_9 = L2_9.FAILURE
        return L2_9
      end
    end
  end
  L2_9 = db
  L2_9 = L2_9.setAttribute
  L3_10 = jumboTable
  L4_11 = ROWID
  L5_12 = DEFAULT_COOKIE
  L6_13 = attribute
  L6_13 = L6_13.JumboFrameEnable
  L7_14 = A0_7
  L2_9 = L2_9(L3_10, L4_11, L5_12, L6_13, L7_14)
  L3_10 = NIL
  if L2_9 == L3_10 then
    L3_10 = _UPVALUE0_
    L3_10 = L3_10.FAILURE
    return L3_10
  end
  L3_10 = UNIT_NAME
  if L3_10 ~= "DSR-150N" then
    L3_10 = UNIT_NAME
    if L3_10 ~= "DSR-150" then
      L3_10 = nil
      L4_11 = attribute
      L4_11 = L4_11.logicalIfName
      L5_12 = " =  'WAN1'"
      L4_11 = L4_11 .. L5_12
      L5_12 = attribute
      L5_12 = L5_12.logicalIfName
      L6_13 = " =  'WAN2'"
      L5_12 = L5_12 .. L6_13
      L6_13 = tonumber
      L7_14 = A0_7
      L6_13 = L6_13(L7_14)
      if L6_13 == 1 then
        L6_13 = db
        L6_13 = L6_13.setAttributeWhere
        L7_14 = nimfMtuTbl
        L8_15 = L4_11
        L9_16 = attribute
        L9_16 = L9_16.MinMtu
        L10_17 = JUMBO_MIN_MTU
        L6_13 = L6_13(L7_14, L8_15, L9_16, L10_17)
        L3_10 = L6_13
        L6_13 = db
        L6_13 = L6_13.setAttributeWhere
        L7_14 = nimfMtuTbl
        L8_15 = L4_11
        L9_16 = attribute
        L9_16 = L9_16.MaxMtu
        L10_17 = JUMBO_MAX_MTU
        L6_13 = L6_13(L7_14, L8_15, L9_16, L10_17)
        L3_10 = L6_13
        L6_13 = UNIT_NAME
        if L6_13 ~= "DSR-250N" then
          L6_13 = UNIT_NAME
          if L6_13 ~= "DSR-250" then
            L6_13 = db
            L6_13 = L6_13.setAttributeWhere
            L7_14 = nimfMtuTbl
            L8_15 = L5_12
            L9_16 = attribute
            L9_16 = L9_16.MinMtu
            L10_17 = JUMBO_MIN_MTU
            L6_13 = L6_13(L7_14, L8_15, L9_16, L10_17)
            L3_10 = L6_13
            L6_13 = db
            L6_13 = L6_13.setAttributeWhere
            L7_14 = nimfMtuTbl
            L8_15 = L5_12
            L9_16 = attribute
            L9_16 = L9_16.MaxMtu
            L10_17 = JUMBO_MAX_MTU
            L6_13 = L6_13(L7_14, L8_15, L9_16, L10_17)
            L3_10 = L6_13
          end
        end
      end
      L6_13 = tonumber
      L7_14 = A0_7
      L6_13 = L6_13(L7_14)
      if L6_13 == 0 then
        L6_13 = tonumber
        L7_14 = L1_8
        L6_13 = L6_13(L7_14)
        if L6_13 == 1 then
          L6_13, L7_14, L8_15, L9_16, L10_17, L11_18 = nil, nil, nil, nil, nil, nil
          L10_17 = attribute.logicalIfName .. "='WAN1' AND " .. attribute.addressFamily .. "='2'"
          L6_13 = db.getAttributeWhere(nimfConfTbl, L10_17, attribute.mtuSize)
          if UNIT_NAME ~= "DSR-250N" and UNIT_NAME ~= "DSR-250" then
            L11_18 = attribute.logicalIfName .. "='WAN2' AND " .. attribute.addressFamily .. "='2'"
            L7_14 = db.getAttributeWhere(nimfConfTbl, L11_18, attribute.mtuSize)
          end
          if tonumber(L6_13) ~= 1500 or tonumber(L7_14) ~= 1500 then
            L9_16 = true
            L8_15 = db.setAttributeWhere(nimfConfTbl, L10_17, attribute.mtuSize, DEFAULT_MTU)
            if L8_15 ~= false then
              L8_15 = db.setAttributeWhere(nimfConfTbl, L10_17, attribute.useDefaultMtu, ENABLE)
            else
              return _UPVALUE0_.FAILURE
            end
            if UNIT_NAME ~= "DSR-250N" and UNIT_NAME ~= "DSR-250" then
              L9_16 = db.setAttributeWhere(nimfConfTbl, L11_18, attribute.mtuSize, DEFAULT_MTU)
              if L9_16 ~= false then
                L9_16 = db.setAttributeWhere(nimfConfTbl, L11_18, attribute.useDefaultMtu, ENABLE)
              else
                return _UPVALUE0_.FAILURE
              end
            end
            if L8_15 == false or L9_16 == false then
              return _UPVALUE0_.FAILURE
            end
          end
          L3_10 = db.setAttributeWhere(nimfMtuTbl, L4_11, attribute.MinMtu, DEFAULT_MIN_MTU)
          L3_10 = db.setAttributeWhere(nimfMtuTbl, L4_11, attribute.MaxMtu, DEFAULT_MAX_MTU)
          if UNIT_NAME ~= "DSR-250N" and UNIT_NAME ~= "DSR-250" then
            L3_10 = db.setAttributeWhere(nimfMtuTbl, L5_12, attribute.MinMtu, DEFAULT_MIN_MTU)
            L3_10 = db.setAttributeWhere(nimfMtuTbl, L5_12, attribute.MaxMtu, DEFAULT_MAX_MTU)
          end
        end
      end
    end
  end
  L3_10 = _UPVALUE0_
  L3_10 = L3_10.SUCCESS
  L4_11 = cookie
  return L3_10, L4_11
end
function jumboGetNext(A0_19)
  return _UPVALUE0_.NOT_SUPPORTED
end
function jumboCreate()
  local L1_20
  L1_20 = _UPVALUE0_
  L1_20 = L1_20.NOT_SUPPORTED
  return L1_20
end
