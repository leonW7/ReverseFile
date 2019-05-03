require("teamf1lualib/db")
require("dhcpcLuaLib")
dhcpc = {}
function dhcpc.config(A0_0, A1_1, A2_2)
  if db.typeAndRangeValidate(A0_0) then
    if A2_2 == "add" then
      return db.insert("Dhcpc", A0_0)
    elseif A2_2 == "edit" then
      return db.update("Dhcpc", A0_0, A1_1)
    elseif A2_2 == "delete" then
      return nil
    end
  end
  return false
end
function dhcpc.releaselease()
  local L0_3, L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10, L8_11
  L0_3 = dhcpcLuaLib
  L0_3 = L0_3.tmpFileCreate
  L0_3()
  L0_3 = db
  L0_3 = L0_3.getAttribute
  L1_4 = "WanMode"
  L2_5 = "AddressFamily"
  L3_6 = 2
  L4_7 = "Wanmode"
  L0_3 = L0_3(L1_4, L2_5, L3_6, L4_7)
  if L0_3 == "0" then
    L1_4 = db
    L1_4 = L1_4.getAttribute
    L2_5 = "WanMode"
    L3_6 = "AddressFamily"
    L4_7 = 2
    L5_8 = "DedicatedLogicalIfName"
    L1_4 = L1_4(L2_5, L3_6, L4_7, L5_8)
    L2_5 = "LogicalIfName = '"
    L3_6 = L1_4
    L4_7 = "'"
    L2_5 = L2_5 .. L3_6 .. L4_7
    L3_6 = db
    L3_6 = L3_6.getRowWhere
    L4_7 = "networkInterface"
    L5_8 = L2_5
    L3_6 = L3_6(L4_7, L5_8)
    L4_7 = L3_6["networkInterface.ConnectionType"]
    if L4_7 == "dhcpc" then
      L4_7 = L3_6["networkInterface.interfaceName"]
      L5_8 = dhcpcLuaLib
      L5_8 = L5_8.ifSuffixGet
      L6_9 = L1_4
      L5_8 = L5_8(L6_9)
      L6_9 = dhcpcLuaLib
      L6_9 = L6_9.dhcpReleaseLease
      L7_10 = L1_4
      L8_11 = L4_7
      L6_9(L7_10, L8_11, L5_8)
    end
    L4_7 = nil
    return L4_7
  else
    L1_4 = db
    L1_4 = L1_4.getAttribute
    L2_5 = "WanMode"
    L3_6 = "AddressFamily"
    L4_7 = 2
    L5_8 = "FailoverPriLogicalIfName"
    L1_4 = L1_4(L2_5, L3_6, L4_7, L5_8)
    L2_5 = "LogicalIfName = '"
    L3_6 = L1_4
    L4_7 = "'"
    L2_5 = L2_5 .. L3_6 .. L4_7
    L3_6 = db
    L3_6 = L3_6.getRowWhere
    L4_7 = "networkInterface"
    L5_8 = L2_5
    L3_6 = L3_6(L4_7, L5_8)
    L4_7 = L3_6["networkInterface.ConnectionType"]
    if L4_7 == "dhcpc" then
      L4_7 = L3_6["networkInterface.interfaceName"]
      L5_8 = dhcpcLuaLib
      L5_8 = L5_8.ifSuffixGet
      L6_9 = L1_4
      L5_8 = L5_8(L6_9)
      L6_9 = dhcpcLuaLib
      L6_9 = L6_9.dhcpReleaseLease
      L7_10 = L1_4
      L8_11 = L4_7
      L6_9(L7_10, L8_11, L5_8)
    end
    L4_7 = db
    L4_7 = L4_7.getAttribute
    L5_8 = "WanMode"
    L6_9 = "AddressFamily"
    L7_10 = 2
    L8_11 = "FailoverSecLogicalIfName"
    L4_7 = L4_7(L5_8, L6_9, L7_10, L8_11)
    L5_8 = "LogicalIfName = '"
    L6_9 = L4_7
    L7_10 = "'"
    L5_8 = L5_8 .. L6_9 .. L7_10
    L6_9 = db
    L6_9 = L6_9.getRowWhere
    L7_10 = "networkInterface"
    L8_11 = L5_8
    L6_9 = L6_9(L7_10, L8_11)
    L7_10 = L6_9["networkInterface.ConnectionType"]
    if L7_10 == "dhcpc" then
      L7_10 = L6_9["networkInterface.interfaceName"]
      L8_11 = dhcpcLuaLib
      L8_11 = L8_11.ifSuffixGet
      L8_11 = L8_11(L4_7)
      dhcpcLuaLib.dhcpReleaseLease(L4_7, L7_10, L8_11)
    end
    L7_10 = nil
    return L7_10
  end
end
