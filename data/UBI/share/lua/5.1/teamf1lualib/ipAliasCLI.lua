local L0_0
L0_0 = require
L0_0("teamf1lualib/ipAlias")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("validationsLuaLib")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wan_ipAliasing")
L0_0 = require
L0_0("teamf1lualib/errorMap")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.validations")
function IpAliasServerCfgInit(A0_1)
  local L1_2, L2_3
  L1_2 = A0_1[1]
  L2_3 = {}
  if L1_2 == "-1" then
    L2_3["ifStaticIPAlias._ROWID_"] = "-1"
  else
    L2_3 = db.getRow("ifStaticIPAlias", "ifStaticIPAlias._ROWID_", L1_2)
    if L2_3 == nil then
      print("Row does not exist")
      return false
    end
  end
  return L1_2, L2_3
end
function IpAliasServerCfgSave(A0_4)
  local L1_5, L2_6, L3_7, L4_8
  L1_5 = ""
  L2_6 = ""
  L3_7 = ""
  L4_8 = A0_4["ifStaticIPAlias._ROWID_"]
  A0_4["ifStaticIPAlias.PhyIfName"] = db.getAttribute("networkInterface", "LogicalIfName", A0_4["ifStaticIPAlias.LogicalIfName"], "VirtualIfName")
  if L4_8 == "-1" then
    L1_5, L2_6 = ipAlias.config(A0_4, L4_8, "add")
  else
    L1_5, L2_6 = ipAlias.config(A0_4, L4_8, "edit")
  end
  if L1_5 == "OK" then
    db.save()
  end
  L3_7 = db.getAttribute("stringsMap", "stringId", L2_6, LANGUAGE)
  return L1_5, L3_7
end
function IpAliasServerInputVal(A0_9)
  local L1_10, L2_11, L3_12
  L1_10 = A0_9["ifStaticIPAlias.LogicalIfName"]
  if L1_10 ~= nil then
    L1_10 = A0_9["ifStaticIPAlias.LogicalIfName"]
  elseif L1_10 == "" then
    L1_10 = printCLIError
    L2_11 = "Please enter the Interface first"
    L1_10(L2_11)
    L1_10 = false
    return L1_10
  end
  L1_10 = A0_9["ifStaticIPAlias._ROWID_"]
  if L1_10 == "-1" then
    L1_10 = db
    L1_10 = L1_10.getRowsWhere
    L2_11 = "ifStaticIPAlias"
    L3_12 = "LogicalIfName = 'WAN1'"
    L1_10 = L1_10(L2_11, L3_12)
    L2_11 = db
    L2_11 = L2_11.getRowsWhere
    L3_12 = "ifStaticIPAlias"
    L2_11 = L2_11(L3_12, "LogicalIfName = 'WAN2'")
    L3_12 = #L1_10
    if L3_12 >= 8 then
      L3_12 = #L2_11
      if L3_12 >= 8 then
        L3_12 = printCLIError
        L3_12("Maximum Aliases Configured")
        L3_12 = false
        return L3_12
      end
    end
    L3_12 = #L1_10
    if L3_12 >= 8 then
      L3_12 = A0_9["ifStaticIPAlias.LogicalIfName"]
      if L3_12 == "WAN1" then
        L3_12 = printCLIError
        L3_12("Maximum Aliases configured for wan1")
        L3_12 = false
        return L3_12
      end
    end
    L3_12 = #L2_11
    if L3_12 >= 8 then
      L3_12 = A0_9["ifStaticIPAlias.LogicalIfName"]
      if L3_12 == "WAN2" then
        L3_12 = printCLIError
        L3_12("Maximum Aliases configured for wan2")
        L3_12 = false
        return L3_12
      end
    end
  end
  L1_10 = db
  L1_10 = L1_10.getAttribute
  L2_11 = "ConfigPort"
  L3_12 = "_ROWID_"
  L1_10 = L1_10(L2_11, L3_12, "1", "LogicalIfName")
  L2_11 = A0_9["ifStaticIPAlias.LogicalIfName"]
  if L2_11 == "WAN2" and L1_10 ~= "WAN2" then
    L2_11 = printCLIError
    L3_12 = "WAN2 is not configured as configurable port"
    L2_11(L3_12)
    L2_11 = false
    return L2_11
  end
  L2_11 = A0_9["ifStaticIPAlias.LogicalIfName"]
  if L2_11 ~= "WAN1" then
    L2_11 = A0_9["ifStaticIPAlias.LogicalIfName"]
  elseif L2_11 == "WAN2" then
    L2_11 = A0_9["ifStaticIPAlias.IPAddress"]
    if L2_11 ~= nil then
      L2_11 = A0_9["ifStaticIPAlias.IPAddress"]
    elseif L2_11 == "" then
      L2_11 = printCLIError
      L3_12 = "Please Enter Valid Ip Address"
      L2_11(L3_12)
      L2_11 = false
      return L2_11
    end
    L2_11 = util
    L2_11 = L2_11.split
    L3_12 = A0_9["ifStaticIPAlias.IPAddress"]
    L2_11 = L2_11(L3_12, ".")
    L3_12 = tonumber
    L3_12 = L3_12(L2_11[1])
    if L3_12 ~= 224 then
      L3_12 = tonumber
      L3_12 = L3_12(L2_11[1])
      if not (L3_12 > 224) then
        L3_12 = tonumber
        L3_12 = L3_12(L2_11[1])
        if L3_12 ~= 0 then
          L3_12 = A0_9["ifStaticIPAlias.IPAddress"]
        end
      end
    elseif L3_12 == "0.0.0.0" then
      L3_12 = printCLIError
      L3_12("Invalid IP address. Please enter a value between 1 - 223 for octet 1")
      L3_12 = false
      return L3_12
    end
    L3_12 = tonumber
    L3_12 = L3_12(L2_11[4])
    if L3_12 ~= 255 then
      L3_12 = tonumber
      L3_12 = L3_12(L2_11[4])
      if not (L3_12 > 254) then
        L3_12 = tonumber
        L3_12 = L3_12(L2_11[4])
      end
    elseif L3_12 == 0 then
      L3_12 = printCLIError
      L3_12("Invalid IP address. Please enter a value between 1 - 254 for octet 4")
      L3_12 = false
      return L3_12
    end
    L3_12 = A0_9["ifStaticIPAlias.SubnetMask"]
    if L3_12 ~= nil then
      L3_12 = A0_9["ifStaticIPAlias.SubnetMask"]
    elseif L3_12 == "" then
      L3_12 = printCLIError
      L3_12("Please enter valid subnet mask")
      L3_12 = false
      return L3_12
    end
    L3_12 = A0_9["ifStaticIPAlias.SubnetMask"]
    if L3_12 == "0.0.0.0" then
      L3_12 = printCLIError
      L3_12("Please enter valid number of octets.")
      L3_12 = false
      return L3_12
    end
    L3_12 = _UPVALUE0_
    L3_12 = L3_12.checkSubnetMask
    L3_12 = L3_12(A0_9["ifStaticIPAlias.SubnetMask"])
    if L3_12 == _UPVALUE1_.FAILURE then
      L3_12 = printCLIError
      L3_12("Please enter valid subnet Mask")
      L3_12 = false
      return L3_12
    end
    L3_12 = _UPVALUE2_
    L3_12 = L3_12.subnetCheck
    L3_12 = L3_12(A0_9["ifStaticIPAlias.LogicalIfName"], A0_9["ifStaticIPAlias.IPAddress"], A0_9["ifStaticIPAlias.SubnetMask"])
    if L3_12 ~= _UPVALUE1_.SUCCESS then
      printCLIError(_UPVALUE3_.errorStringGet(L3_12))
      return false
    end
  end
  L2_11 = true
  return L2_11
end
function IpAliasCfsDelete(A0_13)
  local L1_14, L2_15, L3_16, L4_17, L5_18
  L1_14 = {}
  L2_15 = "ifStaticIPAlias"
  DBTable = L2_15
  L2_15 = A0_13[1]
  L1_14.rowid = L2_15
  L2_15 = {}
  L3_16 = ""
  L4_17 = ""
  L5_18 = ""
  L2_15 = db.getRow("ifStaticIPAlias", "ifStaticIPAlias._ROWID_", L1_14.rowid)
  if L2_15 == nil then
    printCLIError("Row doesnt exist")
  elseif L1_14 then
    L3_16, L4_17 = ipAlias.deleteIPAlias(L1_14, "-1", "delete")
  end
  if L3_16 == "OK" then
    print("Row Deleted")
    db.save()
  end
  L5_18 = db.getAttribute("stringsMap", "stringId", L4_17, LANGUAGE)
  return L3_16, L5_18
end
function ipAliascfgInfoGet()
  local L0_19, L1_20, L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27
  L0_19 = {}
  L1_20 = db
  L1_20 = L1_20.getTable
  L2_21 = "ifStaticIPAlias"
  L1_20 = L1_20(L2_21)
  L2_21 = 0
  for L6_25, L7_26 in L3_22(L4_23) do
    L8_27 = L1_20[L6_25]
    _UPVALUE0_(L0_19, L8_27)
  end
  L3_22(L4_23)
  L3_22(L4_23, L5_24)
end
