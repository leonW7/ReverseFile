local L0_0
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function ipv6LanDuplicateCheck(A0_1, A1_2, A2_3)
  local L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13
  L10_11 = "NO"
  L11_12 = "LogicalIfName = 'LAN' AND AddressFamily = '10'"
  L12_13 = db
  L12_13 = L12_13.getRowWhere
  L12_13 = L12_13(A0_1, L11_12)
  L5_6 = L12_13
  if L5_6 ~= nil then
    L6_7 = L5_6["ifStatic.StaticIp"]
    L7_8 = L5_6["ifStatic.PrefixLength"]
  else
    L12_13 = _UPVALUE0_
    L12_13 = L12_13.FAILURE
    return L12_13
  end
  L12_13 = validationsLuaLib
  L12_13 = L12_13.ipv6AddressTypeCheck
  L12_13 = L12_13(A1_2)
  L3_4 = L12_13
  L12_13 = validationsLuaLib
  L12_13 = L12_13.ipv6AddressTypeCheck
  L12_13 = L12_13(L6_7)
  L4_5 = L12_13
  if L4_5 == "SITELOCAL" and L3_4 == "SITELOCAL" then
    L10_11 = "YES"
  end
  if L10_11 == "NO" then
    L12_13 = nil
    if tonumber(L7_8) <= tonumber(A2_3) then
      L12_13 = L7_8
    else
      L12_13 = A2_3
    end
    L8_9, L9_10 = _UPVALUE1_.ipv6SingleMaskCheck(L6_7, A1_2, L12_13)
    if L8_9 == _UPVALUE0_.SUCCESS then
      L10_11 = "YES"
    end
  end
  if L10_11 == "YES" then
    L12_13 = _UPVALUE0_
    L12_13 = L12_13.SUCCESS
    return L12_13
  else
    L12_13 = _UPVALUE0_
    L12_13 = L12_13.FAILURE
    return L12_13
  end
end
function ipv6WanConnTableGet(A0_14)
  local L1_15, L2_16, L3_17, L4_18
  L1_15 = "LogicalIfName = '" .. A0_14 .. "' AND " .. "AddressFamily = '10'"
  L2_16 = db.getRowWhere("NimfConf", L1_15)
  if L2_16 ~= nil then
    L3_17 = L2_16["NimfConf.ConnectionType6"]
  else
    return _UPVALUE0_.FAILURE
  end
  if L3_17 == "pppoe6" or L3_17 == "dhcp6c" then
    L4_18 = "ipAddressTable"
  elseif L3_17 == "ifStatic6" then
    L4_18 = "ifStatic"
  end
  return L4_18
end
function ipv6WanDuplicateCheck(A0_19, A1_20, A2_21, A3_22)
  local L4_23, L5_24, L6_25, L7_26, L8_27, L9_28, L10_29, L11_30, L12_31, L13_32, L14_33, L15_34, L16_35, L17_36
  if A0_19 == "ifStatic" then
    L7_26 = "AddressFamily ='10' AND LogicalIfName = '"
    L8_27 = A1_20
    L9_28 = "'"
    L4_23 = L7_26 .. L8_27 .. L9_28
  elseif A0_19 == "ipAddressTable" then
    L7_26 = "addressFamily ='10' AND LogicalIfName = '"
    L8_27 = A1_20
    L9_28 = "'"
    L4_23 = L7_26 .. L8_27 .. L9_28
  end
  L7_26 = db
  L7_26 = L7_26.getRowsWhere
  L8_27 = A0_19
  L9_28 = L4_23
  L7_26 = L7_26(L8_27, L9_28)
  L5_24 = L7_26
  if L5_24 then
    L7_26 = 0
    L8_27, L9_28, L10_29 = nil, nil, nil
    for L14_33, L15_34 in L11_30(L12_31) do
      L7_26 = L7_26 + 1
      L16_35 = {}
      L16_35 = L5_24[L7_26]
      if A0_19 == "ipAddressTable" then
        L8_27 = L16_35["ipAddressTable.ipAddress"]
        L9_28 = L16_35["ipAddressTable.ipv6PrefixLen"]
      elseif A0_19 == "ifStatic" then
        L8_27 = L16_35["ifStatic.StaticIp"]
        L9_28 = L16_35["ifStatic.PrefixLength"]
      end
      if L8_27 ~= nil and L8_27 ~= "" and L8_27 ~= "0.0.0.0" then
        L17_36 = validationsLuaLib
        L17_36 = L17_36.ipv6AddressTypeCheck
        L17_36 = L17_36(L8_27)
        L6_25 = L17_36
        if L6_25 ~= "SITELOCAL" and L6_25 ~= "LINKLOCAL" then
          L17_36 = nil
          if tonumber(L9_28) <= tonumber(A3_22) then
            L17_36 = L9_28
          else
            L17_36 = A3_22
          end
          valid, L10_29 = _UPVALUE0_.ipv6SingleMaskCheck(L8_27, A2_21, L17_36)
          if valid == 0 then
            return _UPVALUE1_.SUCCESS
          end
        else
          L17_36 = validationsLuaLib
          L17_36 = L17_36.ipv6AddressTypeCheck
          L17_36 = L17_36(A2_21)
          wanAddressType = L17_36
          L17_36 = wanAddressType
          if L17_36 == "SITELOCAL" and L6_25 == "SITELOCAL" then
            L17_36 = _UPVALUE1_
            L17_36 = L17_36.SUCCESS
            return L17_36
          end
        end
      end
    end
  end
end
