local L0_0
L0_0 = require
L0_0("teamf1lualib/rip")
L0_0 = {
  "Disabled",
  "RIP-1",
  "RIP-2B",
  "RIP-2M"
}
function ripCfgInit(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11
  L1_2 = {}
  L2_3 = {}
  L3_4 = {}
  L4_5 = {}
  L5_6 = 1
  L6_7 = {}
  L10_11 = "1"
  L6_7 = L7_8
  if L6_7 then
    if L7_8 ~= nil then
      if L7_8 ~= "" then
        L1_2 = L7_8
      end
    end
    if L7_8 ~= nil then
      if L7_8 ~= "" then
        L2_3 = L7_8
      end
    end
    if L7_8 ~= nil then
      if L7_8 ~= "" then
        L3_4 = L7_8
      end
    end
    if L7_8 ~= nil then
      if L7_8 ~= "" then
        L4_5 = L7_8
      end
    end
    for L10_11 = 1, 6 do
      L6_7["Rip.SecondKeyTo" .. L10_11] = L4_5[L10_11]
      L6_7["Rip.SecondKeyFrom" .. L10_11] = L3_4[L10_11]
      L6_7["Rip.FirstKeyTo" .. L10_11] = L2_3[L10_11]
      L6_7["Rip.FirstKeyFrom" .. L10_11] = L1_2[L10_11]
    end
  else
    L6_7 = L7_8
  end
  if L7_8 == "" then
    L6_7["Rip.SecondKeyId"] = nil
  end
  if L7_8 == "" then
    L6_7["Rip.FirstKeyId"] = nil
  end
  return L7_8, L8_9
end
function ripCfgSave(A0_12)
  local L1_13, L2_14, L3_15
  L2_14 = ""
  L3_15 = nil
  L1_13, L2_14 = rip.config(A0_12, "1", "edit")
  if L1_13 == "OK" then
    db.save()
  end
  L3_15 = db.getAttribute("stringsMap", "stringId", L2_14, LANGUAGE)
  return L1_13, L3_15
end
function ripCfgInputVal(A0_16)
  if A0_16["Rip.Direction"] == "0" and A0_16["Rip.AuthenticationType"] == "1" then
    printCLIError("Invalid Rip Direction. Authentication for RIP 2B/2M cannot be enabled\n")
    return false
  end
  if (A0_16["Rip.Version"] == "0" or A0_16["Rip.Version"] == "1") and A0_16["Rip.AuthenticationType"] == "1" then
    printCLIError("Invalid Rip Version. Select RIP-2B or RIP-2M to enable Authentication\n")
    return false
  end
  if A0_16["Rip.AuthenticationType"] == "1" then
    if A0_16["Rip.FirstKeyId"] == "" or A0_16["Rip.SecondKeyId"] == "" or A0_16["Rip.FirstKeyId"] == nil or A0_16["Rip.SecondKeyId"] == nil then
      printCLIError("Enter the unique MD-5 key id\n")
      return false
    end
    if A0_16["Rip.SecondAuthenticationKeyId"] == "" or A0_16["Rip.FirstAuthenticationKeyId"] == "" or A0_16["Rip.SecondAuthenticationKeyId"] == nil or A0_16["Rip.FirstAuthenticationKeyId"] == nil then
      printCLIError("Enter the auth key for this MD5 key\n")
      return false
    end
    if A0_16["Rip.FirstKeyFrom1"] == nil or A0_16["Rip.FirstKeyTo1"] == nil or A0_16["Rip.FirstKeyFrom2"] == nil or A0_16["Rip.FirstKeyTo2"] == nil or A0_16["Rip.FirstKeyFrom3"] == nil or A0_16["Rip.FirstKeyTo3"] == nil or A0_16["Rip.FirstKeyFrom4"] == nil or A0_16["Rip.FirstKeyTo4"] == nil or A0_16["Rip.FirstKeyFrom5"] == nil or A0_16["Rip.FirstKeyTo5"] == nil or A0_16["Rip.FirstKeyFrom6"] == nil or A0_16["Rip.FirstKeyTo6"] == nil or A0_16["Rip.SecondKeyFrom1"] == nil or A0_16["Rip.SecondKeyTo1"] == nil or A0_16["Rip.SecondKeyFrom2"] == nil or A0_16["Rip.SecondKeyTo2"] == nil or A0_16["Rip.SecondKeyFrom3"] == nil or A0_16["Rip.SecondKeyTo3"] == nil or A0_16["Rip.SecondKeyFrom4"] == nil or A0_16["Rip.SecondKeyTo4"] == nil or A0_16["Rip.SecondKeyFrom5"] == nil or A0_16["Rip.SecondKeyTo5"] == nil or A0_16["Rip.SecondKeyFrom6"] == nil or A0_16["Rip.SecondKeyTo6"] == nil then
      printCLIError("Enter the valid start date/end date of the First and Second Key for MD5 based authentication between routers.\n")
      return false
    end
    if A0_16["Rip.FirstKeyId"] ~= nil and A0_16["Rip.SecondKeyId"] ~= nil and (tonumber(A0_16["Rip.FirstKeyId"]) > 255 or tonumber(A0_16["Rip.FirstKeyId"]) < 1 or tonumber(A0_16["Rip.SecondKeyId"]) > 255 or tonumber(A0_16["Rip.SecondKeyId"]) < 1) then
      printCLIError("enter value between 1-255\n")
      return false
    end
    if tonumber(A0_16["Rip.FirstKeyFrom3"]) > tonumber(A0_16["Rip.FirstKeyTo3"]) then
      printCLIError("first_key: valid_to should be greater than valid_from")
      return false
    elseif tonumber(A0_16["Rip.FirstKeyFrom1"]) > tonumber(A0_16["Rip.FirstKeyTo1"]) then
      printCLIError("first_key: valid_to should be greater than valid_from")
      return false
    elseif tonumber(A0_16["Rip.FirstKeyFrom2"]) > tonumber(A0_16["Rip.FirstKeyTo2"]) then
      printCLIError("first_key: valid_to should be greater than valid_from")
      return false
    elseif tonumber(A0_16["Rip.FirstKeyFrom4"]) > tonumber(A0_16["Rip.FirstKeyTo4"]) then
      printCLIError("first_key: valid_to should be greater than valid_from")
      return false
    elseif tonumber(A0_16["Rip.FirstKeyFrom5"]) > tonumber(A0_16["Rip.FirstKeyTo5"]) then
      printCLIError("first_key: valid_to should be greater than valid_from")
      return false
    elseif tonumber(A0_16["Rip.FirstKeyFrom6"]) > tonumber(A0_16["Rip.FirstKeyTo6"]) then
      printCLIError("first_key: valid_to should be greater than valid_from")
      return false
    end
    if tonumber(A0_16["Rip.SecondKeyFrom3"]) > tonumber(A0_16["Rip.SecondKeyTo3"]) then
      printCLIError("Second_key: valid_to should be greater than valid_from")
      return false
    elseif tonumber(A0_16["Rip.SecondKeyFrom1"]) > tonumber(A0_16["Rip.SecondKeyTo1"]) then
      printCLIError("Second_key: valid_to should be greater than valid_from")
      return false
    elseif tonumber(A0_16["Rip.SecondKeyFrom2"]) > tonumber(A0_16["Rip.SecondKeyTo2"]) then
      printCLIError("Second_key: valid_to should be greater than valid_from")
      return false
    elseif tonumber(A0_16["Rip.SecondKeyFrom4"]) > tonumber(A0_16["Rip.SecondKeyTo4"]) then
      printCLIError("Second_key: valid_to should be greater than valid_from")
      return false
    elseif tonumber(A0_16["Rip.SecondKeyFrom5"]) > tonumber(A0_16["Rip.SecondKeyTo5"]) then
      printCLIError("Second_key: valid_to should be greater than valid_from")
      return false
    elseif tonumber(A0_16["Rip.SecondKeyFrom6"]) > tonumber(A0_16["Rip.SecondKeyTo6"]) then
      printCLIError("Second_key: valid_to should be greater than valid_from")
      return false
    end
  end
  return true
end
function ripConfigGet()
  local L0_17, L1_18, L2_19, L3_20, L4_21
  L0_17 = {}
  L1_18 = {}
  L2_19 = db
  L2_19 = L2_19.getRow
  L3_20 = "Rip"
  L4_21 = "_ROWID_"
  L2_19 = L2_19(L3_20, L4_21, "1")
  L3_20 = "0"
  L4_21 = "0"
  printLabel("Dynamic Routing")
  printLabel("RIP")
  if L2_19 ~= nil then
    L3_20 = tonumber(L2_19["Rip.Direction"])
    L3_20 = L3_20 + 1
    print("RIP Direction " .. _UPVALUE0_[L3_20] .. "\t")
    L4_21 = tonumber(L2_19["Rip.Version"])
    L4_21 = L4_21 + 1
    print("RIP Version " .. _UPVALUE1_[L4_21] .. "\t")
    if L2_19["Rip.AuthenticationType"] == "1" then
      print("Authentication for RIP-2B/2M: Enabled\t")
      print("First Key Parameters" .. "")
      print("MD5 Key Id: " .. L2_19["Rip.FirstKeyId"] .. "\t")
      print("MD5 Auth Key:  *****\t")
      print("Not Valid Before: " .. L2_19["Rip.FirstKeyFrom"] .. "\t")
      print("Not Valid After: " .. L2_19["Rip.FirstKeyTo"] .. "\t")
      print("Second Key Parameters\t")
      print("MD5 Key Id: " .. L2_19["Rip.SecondKeyId"] .. "\t")
      print("MD5 Auth Key: *****\t")
      print("Not Valid Before: " .. L2_19["Rip.SecondKeyFrom"] .. "\t")
      print("Not Valid After: " .. L2_19["Rip.SecondKeyTo"] .. "\n")
    elseif L2_19["Rip.AuthenticationType"] == "0" then
      print("Authentication for RIP-2B/2M: Disabled\n")
    end
  end
end
