local L0_0
L0_0 = require
L0_0("teamf1lualib/filter_dynamic")
L0_0 = require
L0_0("teamf1lualib/filter_validation")
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.filter.validations")
function DynamicFilteringCfgInit(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8
  L1_2 = A0_1[1]
  RowId = L1_2
  L1_2 = RowId
  if L1_2 == nil then
    L1_2 = db
    L1_2 = L1_2.getDefaults
    L1_2 = L1_2(L2_3, L3_4)
    configRow = L1_2
  else
    L1_2 = db
    L1_2 = L1_2.getRow
    L1_2 = L1_2(L2_3, L3_4, L4_5)
    configRow = L1_2
  end
  L1_2 = configRow
  if L1_2 == nil then
    L1_2 = print
    L1_2(L2_3)
    L1_2 = -1
    return L1_2, L2_3
  end
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(L2_3, L3_4, L4_5, L5_6)
  for L5_6, L6_7 in L2_3(L3_4) do
    L7_8 = _UPVALUE0_
    L7_8 = L7_8[L5_6]
    configRow[L7_8] = "0"
  end
  if L1_2 ~= "--" then
    for L6_7, L7_8 in L3_4(L4_5) do
      configRow[_UPVALUE0_[tonumber(L7_8)]] = "1"
    end
  end
  return L3_4, L4_5
end
function DynamicFilteringCfgInputVal(A0_9)
  if db.getAttribute("contentFiltering", "_ROWID_", "1", "Status") == "0" then
    printCLIError("Please enable content filtering first\n")
    return false
  end
  if io.open("/var/wcf_status", "r") then
    if io.open("/var/wcf_status", "r"):read("*line") == "disabled" then
      printCLIError("Please enable WCF License \n")
      return false
    end
    io.open("/var/wcf_status", "r"):close()
  end
  if A0_9["dynamicFiltering.nonmanagedaction"] == nil or A0_9["dynamicFiltering.nonmanagedaction"] == "" then
    printCLIError("Enter valid Non-Managed Action\n")
    return false
  end
  A0_9["siteCategory.nonManagedVerdict"] = A0_9["dynamicFiltering.nonmanagedaction"]
  if A0_9["dynamicFiltering.allowoverride"] == nil or A0_9["dynamicFiltering.allowoverride"] == "" then
    printCLIError("Enter valid Allow Override\n")
    return false
  end
  A0_9["siteCategory.categoryVerdict"] = A0_9["dynamicFiltering.allowoverride"]
  if A0_9["dynamicFiltering.allowoverride"] == "1" then
    if A0_9["dynamicFiltering.overridetimeout"] == nil or A0_9["dynamicFiltering.overridetimeout"] == "" then
      printCLIError("Enter valid override timeout value\n")
      return false
    end
    if tonumber(A0_9["dynamicFiltering.overridetimeout"]) % 60 ~= 0 then
      printCLIError("Please enter multiple of 60, between 60 - 3600 Seconds\n")
      return false
    end
    if A0_9["dynamicFiltering.updateonaccess"] == nil or A0_9["dynamicFiltering.updateonaccess"] == "" then
      printCLIError("Enter valid update on access\n")
      return false
    end
    A0_9["siteCategory.timeout"] = A0_9["dynamicFiltering.overridetimeout"]
    A0_9["siteCategory.updateAccess"] = A0_9["dynamicFiltering.updateonaccess"]
  else
    A0_9["siteCategory.timeout"] = tonumber(db.getRow("siteCategory", "_ROWID_", "1")["siteCategory.timeout"]) * 60
    A0_9["siteCategory.updateAccess"] = db.getRow("siteCategory", "_ROWID_", "1")["siteCategory.updateAccess"]
  end
  return true
end
function DynamicFilteringCfgSave(A0_10)
  local L1_11, L2_12, L3_13, L4_14, L5_15, L6_16
  L1_11 = ""
  L2_12 = A0_10["siteCategory.nonManagedVerdict"]
  L3_13 = A0_10["siteCategory.categoryVerdict"]
  L4_14 = A0_10["siteCategory.timeout"]
  L5_15 = A0_10["siteCategory.updateAccess"]
  L6_16 = "--"
  categoryList = L6_16
  L6_16 = 0
  for _FORV_10_, _FORV_11_ in pairs(_UPVALUE0_) do
    L6_16 = L6_16 + 1
    if tonumber(A0_10[_FORV_11_]) == 1 then
      if categoryList == "--" then
        categoryList = tostring(L6_16) .. ","
      else
        categoryList = categoryList .. tostring(L6_16) .. ","
      end
    end
  end
  if categoryList == "--" and (L2_12 == "1" or L3_13 == "1") then
    printCLIError("Please enable atleast one category.")
    return "ERROR"
  end
  if categoryList ~= "--" then
    categoryList = string.sub(categoryList, 1, -2)
  end
  db.beginTransaction()
  if _UPVALUE1_.categoryListSet(categoryList, L1_11, L2_12, L3_13, L4_14, L5_15) ~= 0 then
    db.rollback()
    printCLIError("Error in configuring approved category filter ")
    return "ERROR"
  end
  db.save()
  db.commitTransaction(true)
  return "OK"
end
function dynamicfilterShow()
  local L0_17, L1_18, L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26
  L0_17 = db
  L0_17 = L0_17.getRow
  L1_18 = "siteCategory"
  L2_19 = "_ROWID_"
  L0_17 = L0_17(L1_18, L2_19, L3_20)
  L1_18 = printLabel
  L2_19 = "Dynamic Filtering"
  L1_18(L2_19)
  L1_18 = L0_17["siteCategory.nonManagedVerdict"]
  if L1_18 == "1" then
    L1_18 = print
    L2_19 = "Non-Managed Action : Block\n"
    L1_18(L2_19)
  else
    L1_18 = print
    L2_19 = "Non-Managed Action : Allow\n"
    L1_18(L2_19)
  end
  L1_18 = L0_17["siteCategory.categoryVerdict"]
  if L1_18 == "1" then
    L1_18 = print
    L2_19 = "Allow Override : Enable\n"
    L1_18(L2_19)
  else
    L1_18 = print
    L2_19 = "Allow Override : Disable\n"
    L1_18(L2_19)
  end
  L1_18 = L0_17["siteCategory.categoryVerdict"]
  if L1_18 == "1" then
    L1_18 = tonumber
    L2_19 = L0_17["siteCategory.timeout"]
    L1_18 = L1_18(L2_19)
    L1_18 = L1_18 * 60
    L2_19 = print
    L2_19(L3_20)
    L2_19 = L0_17["siteCategory.updateAccess"]
    if L2_19 == "1" then
      L2_19 = print
      L2_19(L3_20)
    else
      L2_19 = print
      L2_19(L3_20)
    end
  end
  L1_18 = db
  L1_18 = L1_18.getAttribute
  L2_19 = "siteCategory"
  L1_18 = L1_18(L2_19, L3_20, L4_21, L5_22)
  L2_19 = {}
  for L6_23, L7_24 in L3_20(L4_21) do
    L8_25 = _UPVALUE0_
    L8_25 = L8_25[L6_23]
    L2_19[L8_25] = "0"
  end
  if L1_18 ~= "--" then
    for L7_24, L8_25 in L4_21(L5_22) do
      L9_26 = _UPVALUE0_
      L9_26 = L9_26[tonumber(L8_25)]
      L2_19[L9_26] = "1"
    end
  end
  for L7_24, L8_25 in L4_21(L5_22) do
    L9_26 = "Disabled"
    if tonumber(L8_25) == 1 then
      L9_26 = "Enabled"
    end
    filterTab = util.split(L7_24, ".")
    L7_24 = filterTab[2] or ""
    print(L7_24 .. " : " .. L9_26)
  end
  return L4_21
end
