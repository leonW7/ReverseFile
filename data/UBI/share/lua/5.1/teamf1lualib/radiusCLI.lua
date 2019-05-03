local L0_0
L0_0 = require
L0_0("teamf1lualib/radius")
L0_0 = require
L0_0("teamf1lualib/servicesRouteMgmt_bl")
L0_0 = require
L0_0("teamf1lualib/errorMap")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/accounting_core")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.errorMap")
function radiusCfgInputVal(A0_1)
  local L1_2
  L1_2 = A0_1["radiusClient.authserver"]
  if L1_2 ~= nil then
    L1_2 = A0_1["radiusClient.authserver"]
  elseif L1_2 == "" then
    L1_2 = printCLIError
    L1_2("Please configure valid primary radius server.")
    L1_2 = false
    return L1_2
  end
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.checkIpv4Address
  L1_2 = L1_2(A0_1["radiusClient.authserver"])
  if L1_2 == false then
    L1_2 = printCLIError
    L1_2("Please configure valid primary radius server for first octet in 1-223 and last octet in 1-254.")
    L1_2 = false
    return L1_2
  end
  L1_2 = A0_1["radiusClient.authport"]
  if L1_2 ~= nil then
    L1_2 = A0_1["radiusClient.authport"]
  elseif L1_2 == "" then
    L1_2 = printCLIError
    L1_2("Please configure valid auth port for primary radius server.")
    L1_2 = false
    return L1_2
  end
  L1_2 = A0_1["radiusClient.authsecret"]
  if L1_2 ~= nil then
    L1_2 = A0_1["radiusClient.authsecret"]
  elseif L1_2 == "" then
    L1_2 = printCLIError
    L1_2("Please configure valid authentication secret for primary radius server.")
    L1_2 = false
    return L1_2
  end
  L1_2 = A0_1["radiusClient.acctserver"]
  if L1_2 ~= nil then
    L1_2 = A0_1["radiusClient.acctserver"]
  elseif L1_2 == "" then
    L1_2 = printCLIError
    L1_2("Please configure valid primary radius accounting server.")
    L1_2 = false
    return L1_2
  end
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.checkIpv4Address
  L1_2 = L1_2(A0_1["radiusClient.acctserver"])
  if L1_2 == false then
    L1_2 = printCLIError
    L1_2("Please configure valid primary radius accounting server for first octet in 1-223 and last octet in 1-254.")
    L1_2 = false
    return L1_2
  end
  L1_2 = A0_1["radiusClient.acctport"]
  if L1_2 ~= nil then
    L1_2 = A0_1["radiusClient.acctport"]
  elseif L1_2 == "" then
    L1_2 = printCLIError
    L1_2("Please configure valid accounting port for primary radius accounting server.")
    L1_2 = false
    return L1_2
  end
  L1_2 = A0_1["radiusClient.acctsecret"]
  if L1_2 ~= nil then
    L1_2 = A0_1["radiusClient.acctsecret"]
  elseif L1_2 == "" then
    L1_2 = printCLIError
    L1_2("Please configure valid accounting secret for primary radius accounting server.")
    L1_2 = false
    return L1_2
  end
  L1_2 = A0_1["radiusClient.authtimeout"]
  if L1_2 ~= nil then
    L1_2 = A0_1["radiusClient.authtimeout"]
  elseif L1_2 == "" then
    L1_2 = printCLIError
    L1_2("Please configure valid timeout for primary radius server.")
    L1_2 = false
    return L1_2
  end
  L1_2 = A0_1["radiusClient.authretries"]
  if L1_2 ~= nil then
    L1_2 = A0_1["radiusClient.authretries"]
  elseif L1_2 == "" then
    L1_2 = printCLIError
    L1_2("Please configure valid retries for primary radius server.")
    L1_2 = false
    return L1_2
  end
  L1_2 = A0_1["radiusClient.authserver2"]
  if L1_2 ~= nil then
    L1_2 = A0_1["radiusClient.authserver2"]
  elseif L1_2 == "" then
    L1_2 = printCLIError
    L1_2("Please configure valid secondary radius server.")
    L1_2 = false
    return L1_2
  end
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.checkIpv4Address
  L1_2 = L1_2(A0_1["radiusClient.authserver2"])
  if L1_2 == false then
    L1_2 = printCLIError
    L1_2("Please configure valid secondary radius server for first octet in 1-223 and last octet in 1-254.")
    L1_2 = false
    return L1_2
  end
  L1_2 = A0_1["radiusClient.authport2"]
  if L1_2 ~= nil then
    L1_2 = A0_1["radiusClient.authport2"]
  elseif L1_2 == "" then
    L1_2 = printCLIError
    L1_2("Please configure valid auth port for secondary radius server.")
    L1_2 = false
    return L1_2
  end
  L1_2 = A0_1["radiusClient.authsecret2"]
  if L1_2 ~= nil then
    L1_2 = A0_1["radiusClient.authsecret2"]
  elseif L1_2 == "" then
    L1_2 = printCLIError
    L1_2("Please configure valid authentication secret for secondary radius server.")
    L1_2 = false
    return L1_2
  end
  L1_2 = A0_1["radiusClient.acctserver2"]
  if L1_2 ~= nil then
    L1_2 = A0_1["radiusClient.acctserver2"]
  elseif L1_2 == "" then
    L1_2 = printCLIError
    L1_2("Please configure valid secondary radius accounting server.")
    L1_2 = false
    return L1_2
  end
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.checkIpv4Address
  L1_2 = L1_2(A0_1["radiusClient.acctserver2"])
  if L1_2 == false then
    L1_2 = printCLIError
    L1_2("Please configure valid secondary radius accounting server for first octet in 1-223 and last octet in 1-254.")
    L1_2 = false
    return L1_2
  end
  L1_2 = A0_1["radiusClient.acctport2"]
  if L1_2 ~= nil then
    L1_2 = A0_1["radiusClient.acctport2"]
  elseif L1_2 == "" then
    L1_2 = printCLIError
    L1_2("Please configure valid accounting port for secondary radius accounting server.")
    L1_2 = false
    return L1_2
  end
  L1_2 = A0_1["radiusClient.acctsecret2"]
  if L1_2 ~= nil then
    L1_2 = A0_1["radiusClient.acctsecret2"]
  elseif L1_2 == "" then
    L1_2 = printCLIError
    L1_2("Please configure valid accounting secret for secondary radius accounting server.")
    L1_2 = false
    return L1_2
  end
  L1_2 = A0_1["radiusClient.authtimeout2"]
  if L1_2 ~= nil then
    L1_2 = A0_1["radiusClient.authtimeout2"]
  elseif L1_2 == "" then
    L1_2 = printCLIError
    L1_2("Please configure valid timeout for secondary radius server.")
    L1_2 = false
    return L1_2
  end
  L1_2 = A0_1["radiusClient.authretries2"]
  if L1_2 ~= nil then
    L1_2 = A0_1["radiusClient.authretries2"]
  elseif L1_2 == "" then
    L1_2 = printCLIError
    L1_2("Please configure valid retries for secondary radius server.")
    L1_2 = false
    return L1_2
  end
  L1_2 = A0_1["radiusClient.authserver3"]
  if L1_2 ~= nil then
    L1_2 = A0_1["radiusClient.authserver3"]
  elseif L1_2 == "" then
    L1_2 = printCLIError
    L1_2("Please configure valid optional radius server.")
    L1_2 = false
    return L1_2
  end
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.checkIpv4Address
  L1_2 = L1_2(A0_1["radiusClient.authserver3"])
  if L1_2 == false then
    L1_2 = printCLIError
    L1_2("Please configure valid optional radius server for first octet in 1-223 and last octet in 1-254.")
    L1_2 = false
    return L1_2
  end
  L1_2 = A0_1["radiusClient.authport3"]
  if L1_2 ~= nil then
    L1_2 = A0_1["radiusClient.authport3"]
  elseif L1_2 == "" then
    L1_2 = printCLIError
    L1_2("Please configure valid auth port for optional radius server.")
    L1_2 = false
    return L1_2
  end
  L1_2 = A0_1["radiusClient.authsecret3"]
  if L1_2 ~= nil then
    L1_2 = A0_1["radiusClient.authsecret3"]
  elseif L1_2 == "" then
    L1_2 = printCLIError
    L1_2("Please configure valid authentication secret for optional radius server.")
    L1_2 = false
    return L1_2
  end
  L1_2 = A0_1["radiusClient.acctserver3"]
  if L1_2 ~= nil then
    L1_2 = A0_1["radiusClient.acctserver3"]
  elseif L1_2 == "" then
    L1_2 = printCLIError
    L1_2("Please configure valid optional radius accounting server.")
    L1_2 = false
    return L1_2
  end
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.checkIpv4Address
  L1_2 = L1_2(A0_1["radiusClient.acctserver3"])
  if L1_2 == false then
    L1_2 = printCLIError
    L1_2("Please configure valid optional radius accounting server for first octet in 1-223 and last octet in 1-254.")
    L1_2 = false
    return L1_2
  end
  L1_2 = A0_1["radiusClient.acctport3"]
  if L1_2 ~= nil then
    L1_2 = A0_1["radiusClient.acctport3"]
  elseif L1_2 == "" then
    L1_2 = printCLIError
    L1_2("Please configure valid accounting port for optional radius accounting server.")
    L1_2 = false
    return L1_2
  end
  L1_2 = A0_1["radiusClient.acctsecret3"]
  if L1_2 ~= nil then
    L1_2 = A0_1["radiusClient.acctsecret3"]
  elseif L1_2 == "" then
    L1_2 = printCLIError
    L1_2("Please configure valid accounting secret for optional radius accounting server.")
    L1_2 = false
    return L1_2
  end
  L1_2 = A0_1["radiusClient.authtimeout3"]
  if L1_2 ~= nil then
    L1_2 = A0_1["radiusClient.authtimeout3"]
  elseif L1_2 == "" then
    L1_2 = printCLIError
    L1_2("Please configure valid timeout for optional radius server.")
    L1_2 = false
    return L1_2
  end
  L1_2 = A0_1["radiusClient.authretries3"]
  if L1_2 ~= nil then
    L1_2 = A0_1["radiusClient.authretries3"]
  elseif L1_2 == "" then
    L1_2 = printCLIError
    L1_2("Please configure valid retries for optional radius server.")
    L1_2 = false
    return L1_2
  end
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2("WanMode", "_ROWID_", 1, "Wanmode")
  if (tonumber(L1_2) == 1 or tonumber(L1_2) == 3) and A0_1["radiusClient.nasIface"] == nil then
    printCLIError("Invalid NAS Interface.Please configure valid NAS Interface.")
    return false
  end
  return true
end
function radiusCfgSave(A0_3)
  local L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10, L8_11
  L1_4 = "ERROR"
  L2_5 = ""
  L3_6 = ""
  L4_7 = {}
  L5_8 = {}
  L6_9 = {}
  L7_10 = {}
  if A0_3 ~= nil then
    L8_11 = A0_3["radiusClient.ProfileName"]
    L4_7["radiusClient.ProfileName"] = L8_11
    L8_11 = A0_3["radiusClient.isEnable"]
    L4_7["radiusClient.isEnable"] = L8_11
    L8_11 = A0_3["radiusClient.authserver"]
    L4_7["radiusClient.authserver"] = L8_11
    L8_11 = A0_3["radiusClient.authport"]
    L4_7["radiusClient.authport"] = L8_11
    L8_11 = A0_3["radiusClient.authsecret"]
    L4_7["radiusClient.authsecret"] = L8_11
    L8_11 = A0_3["radiusClient.acctserver"]
    L4_7["radiusClient.acctserver"] = L8_11
    L8_11 = A0_3["radiusClient.acctport"]
    L4_7["radiusClient.acctport"] = L8_11
    L8_11 = A0_3["radiusClient.acctsecret"]
    L4_7["radiusClient.acctsecret"] = L8_11
    L8_11 = A0_3["radiusClient.authretries"]
    L4_7["radiusClient.authretries"] = L8_11
    L8_11 = A0_3["radiusClient.authtimeout"]
    L4_7["radiusClient.authtimeout"] = L8_11
    L8_11 = A0_3["radiusClient.ProfileName"]
    L5_8["radiusClient.ProfileName"] = L8_11
    L8_11 = A0_3["radiusClient.isEnable"]
    L5_8["radiusClient.isEnable"] = L8_11
    L8_11 = A0_3["radiusClient.authserver2"]
    L5_8["radiusClient.authserver"] = L8_11
    L8_11 = A0_3["radiusClient.authport2"]
    L5_8["radiusClient.authport"] = L8_11
    L8_11 = A0_3["radiusClient.authsecret2"]
    L5_8["radiusClient.authsecret"] = L8_11
    L8_11 = A0_3["radiusClient.acctserver2"]
    L5_8["radiusClient.acctserver"] = L8_11
    L8_11 = A0_3["radiusClient.acctport2"]
    L5_8["radiusClient.acctport"] = L8_11
    L8_11 = A0_3["radiusClient.acctsecret2"]
    L5_8["radiusClient.acctsecret"] = L8_11
    L8_11 = A0_3["radiusClient.authretries2"]
    L5_8["radiusClient.authretries"] = L8_11
    L8_11 = A0_3["radiusClient.authtimeout2"]
    L5_8["radiusClient.authtimeout"] = L8_11
    L8_11 = A0_3["radiusClient.ProfileName"]
    L6_9["radiusClient.ProfileName"] = L8_11
    L8_11 = A0_3["radiusClient.isEnable"]
    L6_9["radiusClient.isEnable"] = L8_11
    L8_11 = A0_3["radiusClient.authserver3"]
    L6_9["radiusClient.authserver"] = L8_11
    L8_11 = A0_3["radiusClient.authport3"]
    L6_9["radiusClient.authport"] = L8_11
    L8_11 = A0_3["radiusClient.authsecret3"]
    L6_9["radiusClient.authsecret"] = L8_11
    L8_11 = A0_3["radiusClient.acctserver3"]
    L6_9["radiusClient.acctserver"] = L8_11
    L8_11 = A0_3["radiusClient.acctport3"]
    L6_9["radiusClient.acctport"] = L8_11
    L8_11 = A0_3["radiusClient.acctsecret3"]
    L6_9["radiusClient.acctsecret"] = L8_11
    L8_11 = A0_3["radiusClient.authretries3"]
    L6_9["radiusClient.authretries"] = L8_11
    L8_11 = A0_3["radiusClient.authtimeout3"]
    L6_9["radiusClient.authtimeout"] = L8_11
    L8_11 = A0_3["radiusClient.nasIface"]
    L7_10["radAuthConf.nasIface"] = L8_11
  end
  L8_11 = db
  L8_11 = L8_11.existsRow
  L8_11 = L8_11("radiusClient", "ProfileName", A0_3["radiusClient.ProfileName"])
  if not L8_11 then
    L8_11 = radius
    L8_11 = L8_11.radius_config
    L2_5, L8_11 = L4_7, L8_11(L4_7, "-1", "add")
    L1_4 = L8_11
    if L1_4 == "OK" then
      L8_11 = radius
      L8_11 = L8_11.radius_config
      L2_5, L8_11 = L5_8, L8_11(L5_8, "-1", "add")
      L1_4 = L8_11
    end
    if L1_4 == "OK" then
      L8_11 = radius
      L8_11 = L8_11.radius_config
      L2_5, L8_11 = L6_9, L8_11(L6_9, "-1", "add")
      L1_4 = L8_11
    end
  else
    L8_11 = db
    L8_11 = L8_11.getRows
    L8_11 = L8_11("radiusClient", "ProfileName", A0_3["radiusClient.ProfileName"])
    for _FORV_12_, _FORV_13_ in pairs(L8_11) do
      if _FORV_12_ == 1 then
        L1_4, L2_5 = radius.radius_config(L4_7, _FORV_13_["radiusClient._ROWID_"], "edit")
        if L1_4 == "OK" then
          _UPVALUE0_.accountingVlanServerRouteTblUpdate(L4_7["radiusClient.acctserver"], _FORV_13_["radiusClient._ROWID_"])
        end
      elseif _FORV_12_ == 2 then
        if L1_4 == "OK" then
          L1_4, L2_5 = radius.radius_config(L5_8, _FORV_13_["radiusClient._ROWID_"], "edit")
          if L1_4 == "OK" then
            _UPVALUE0_.accountingVlanServerRouteTblUpdate(L5_8["radiusClient.acctserver"], _FORV_13_["radiusClient._ROWID_"])
          end
        end
      elseif L1_4 == "OK" then
        L1_4, L2_5 = radius.radius_config(L6_9, _FORV_13_["radiusClient._ROWID_"], "edit")
        if L1_4 == "OK" then
          _UPVALUE0_.accountingVlanServerRouteTblUpdate(L6_9["radiusClient.acctserver"], _FORV_13_["radiusClient._ROWID_"])
        end
      end
    end
  end
  if L1_4 == "OK" then
    L8_11 = nil
    if db.existsRow("radAuthConf", "_ROWID_", "1") then
      L8_11 = db.update("radAuthConf", L7_10, "1")
    else
      L8_11 = db.insert("radAuthConf", L7_10)
    end
    if not L8_11 then
      L1_4 = "ERROR"
    end
  end
  if L1_4 == "OK" then
    L8_11 = db
    L8_11 = L8_11.save
    L8_11()
  end
  if L1_4 == "OK" then
    L3_6 = "Operation Succeeded"
  else
    L3_6 = "RADIUS configuration Failed"
  end
  L8_11 = L1_4
  return L8_11, L3_6
end
function radiusCfgInit()
  local L0_12, L1_13
  L0_12 = {}
  L1_13 = {}
  L1_13 = db.getRows("radiusClient", "ProfileName", "Default")
  if L1_13 == nil then
    L0_12["radiusClient._ROWID_"] = "-1"
  else
    L0_12["radiusClient.ProfileName"] = L1_13[1]["radiusClient.ProfileName"]
    L0_12["radiusClient.isEnable"] = L1_13[1]["radiusClient.isEnable"]
    L0_12["radiusClient.authserver"] = L1_13[1]["radiusClient.authserver"]
    L0_12["radiusClient.authport"] = L1_13[1]["radiusClient.authport"]
    L0_12["radiusClient.authsecret"] = L1_13[1]["radiusClient.authsecret"]
    L0_12["radiusClient.acctserver"] = L1_13[1]["radiusClient.acctserver"]
    L0_12["radiusClient.acctport"] = L1_13[1]["radiusClient.acctport"]
    L0_12["radiusClient.acctsecret"] = L1_13[1]["radiusClient.acctsecret"]
    L0_12["radiusClient.authtimeout"] = L1_13[1]["radiusClient.authtimeout"]
    L0_12["radiusClient.authretries"] = L1_13[1]["radiusClient.authretries"]
    L0_12["radiusClient.authserver2"] = L1_13[2]["radiusClient.authserver"]
    L0_12["radiusClient.authport2"] = L1_13[2]["radiusClient.authport"]
    L0_12["radiusClient.authsecret2"] = L1_13[2]["radiusClient.authsecret"]
    L0_12["radiusClient.acctserver2"] = L1_13[2]["radiusClient.acctserver"]
    L0_12["radiusClient.acctport2"] = L1_13[2]["radiusClient.acctport"]
    L0_12["radiusClient.acctsecret2"] = L1_13[2]["radiusClient.acctsecret"]
    L0_12["radiusClient.authtimeout2"] = L1_13[2]["radiusClient.authtimeout"]
    L0_12["radiusClient.authretries2"] = L1_13[2]["radiusClient.authretries"]
    L0_12["radiusClient.authserver3"] = L1_13[3]["radiusClient.authserver"]
    L0_12["radiusClient.authport3"] = L1_13[3]["radiusClient.authport"]
    L0_12["radiusClient.authsecret3"] = L1_13[3]["radiusClient.authsecret"]
    L0_12["radiusClient.acctserver3"] = L1_13[3]["radiusClient.acctserver"]
    L0_12["radiusClient.acctport3"] = L1_13[3]["radiusClient.acctport"]
    L0_12["radiusClient.acctsecret3"] = L1_13[3]["radiusClient.acctsecret"]
    L0_12["radiusClient.authtimeout3"] = L1_13[3]["radiusClient.authtimeout"]
    L0_12["radiusClient.authretries3"] = L1_13[3]["radiusClient.authretries"]
    L0_12["radiusClient._ROWID_"] = "1"
  end
  return L0_12["radiusClient._ROWID_"], L0_12
end
function radiusGet()
  local L0_14
  L0_14 = "Default"
  resultTab = _UPVALUE0_(L0_14)
  if db.getAttribute("WanMode", "_ROWID_", 1, "Wanmode") == "1" or db.getAttribute("WanMode", "_ROWID_", 1, "Wanmode") == "3" then
    resTab.insertField(resultTab, "NAS Interface", _UPVALUE1_() or "WAN1")
  end
  if resultTab ~= nil then
    printLabel("Radius Server configuration.")
    resTab.print(resultTab, 0)
  else
    printCLIError("Radius-Settings not configured.")
  end
end
function radiusAccGet()
  local L0_15
  L0_15 = "Default"
  resultTab = _UPVALUE0_(L0_15)
  if resultTab ~= nil then
    printLabel("Radius Accounting Server configuration.")
    resTab.print(resultTab, 0)
  else
    printCLIError("Radius-Accounting-Settings not configured.")
  end
end
function serverStatusCheckRadius(A0_16)
  local L1_17, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23
  L1_17 = A0_16[1]
  L2_18 = A0_16[2]
  L3_19 = ""
  L4_20 = ""
  L5_21 = "edit"
  L6_22 = db
  L6_22 = L6_22.getRows
  L7_23 = L2_18
  L6_22 = L6_22(L7_23, "isEnable", "1")
  if L6_22 == nil then
    L7_23 = printCLIError
    L7_23("Radius Server Not Configured.")
    L7_23 = "OK"
    return L7_23
  end
  L7_23 = L6_22[1]
  L3_19 = L7_23["radiusClient.authserver"]
  if L3_19 == nil or L3_19 == "" then
    L7_23 = printCLIError
    L7_23("Radius Server Not Configured.")
    L7_23 = "OK"
    return L7_23
  end
  L7_23 = serverCheck
  L7_23 = L7_23.getCheckNow
  L7_23 = L7_23(L1_17)
  if tonumber(L7_23) == 0 then
    L4_20 = serverCheck.config(L1_17, L5_21)
    if L4_20 ~= "OK" then
      printCLIError("Operation Failed.")
      return "ERROR"
    end
    print("Checking server reachability.. Get result by \"show " .. L1_17 .. "-serverCheck\"")
    return "OK"
  elseif tonumber(L7_23) == 1 then
    print("Checking server reachability.. Get result by \"show " .. L1_17 .. "-serverCheck\"")
    return "OK"
  end
end
function serverStatusShowRadius(A0_24, A1_25)
  local L2_26, L3_27, L4_28, L5_29, L6_30, L7_31
  L2_26 = {}
  L3_27 = db
  L3_27 = L3_27.getRow
  L4_28 = "serverCheck"
  L5_29 = "serverCheck.authType"
  L6_30 = A0_24
  L3_27 = L3_27(L4_28, L5_29, L6_30)
  L4_28 = db
  L4_28 = L4_28.getRows
  L5_29 = A1_25
  L6_30 = "isEnable"
  L7_31 = "1"
  L4_28 = L4_28(L5_29, L6_30, L7_31)
  L5_29 = ""
  L6_30 = ""
  L7_31 = ""
  if L3_27 == nil then
    return nil
  end
  if L4_28 == nil then
    printCLIError("Radius Server Not Configured.")
    return ""
  end
  L5_29 = L4_28[1]["radiusClient.authserver"]
  L6_30 = L4_28[2]["radiusClient.authserver"]
  L7_31 = L4_28[3]["radiusClient.authserver"]
  if tonumber(L3_27["serverCheck.checkNow"]) == 1 then
    printCLIError("Waiting for server response, Please try after some time.")
    return ""
  end
  if tonumber(L3_27["serverCheck.checkNow"]) == 0 and tonumber(L3_27["serverCheck.response"]) == 0 then
    printCLIError("No Server Status Available.")
    return ""
  end
  if tonumber(L3_27["serverCheck.firstServerStatus"]) == 1 then
    L3_27["serverCheck.firstServerStatus"] = "OK"
  elseif tonumber(L3_27["serverCheck.firstServerStatus"]) == 2 then
    L3_27["serverCheck.firstServerStatus"] = "FAIL"
  elseif tonumber(L3_27["serverCheck.firstServerStatus"]) == 3 then
    L3_27["serverCheck.firstServerStatus"] = "NA"
  elseif tonumber(L3_27["serverCheck.firstServerStatus"]) == 4 then
    L3_27["serverCheck.firstServerStatus"] = "Unknown Error Occurred"
  end
  if tonumber(L3_27["serverCheck.secondServerStatus"]) == 1 then
    L3_27["serverCheck.secondServerStatus"] = "OK"
  elseif tonumber(L3_27["serverCheck.secondServerStatus"]) == 2 then
    L3_27["serverCheck.secondServerStatus"] = "FAIL"
  elseif tonumber(L3_27["serverCheck.secondServerStatus"]) == 3 then
    L3_27["serverCheck.secondServerStatus"] = "NA"
  elseif tonumber(L3_27["serverCheck.secondServerStatus"]) == 4 then
    L3_27["serverCheck.secondServerStatus"] = "Unknown Error Occurred"
  end
  if tonumber(L3_27["serverCheck.thirdServerStatus"]) == 1 then
    L3_27["serverCheck.thirdServerStatus"] = "OK"
  elseif tonumber(L3_27["serverCheck.thirdServerStatus"]) == 2 then
    L3_27["serverCheck.thirdServerStatus"] = "FAIL"
  elseif tonumber(L3_27["serverCheck.thirdServerStatus"]) == 3 then
    L3_27["serverCheck.thirdServerStatus"] = "NA"
  elseif tonumber(L3_27["serverCheck.thirdServerStatus"]) == 4 then
    L3_27["serverCheck.thirdServerStatus"] = "Unknown Error Occurred"
  end
  if L3_27["serverCheck.firstServerStatus"] ~= "NA" then
    resTab.insertField(L2_26, "Authentication Server 1:" .. L5_29 .. "          ", L3_27["serverCheck.firstServerStatus"])
  end
  if L3_27["serverCheck.secondServerStatus"] ~= "NA" then
    resTab.insertField(L2_26, "Authentication Server 2:" .. L6_30 .. "          ", L3_27["serverCheck.secondServerStatus"])
  end
  if L3_27["serverCheck.thirdServerStatus"] ~= "NA" then
    resTab.insertField(L2_26, "Authentication Server 3:" .. L7_31 .. "          ", L3_27["serverCheck.thirdServerStatus"])
  end
  return L2_26
end
function serverStatusGetRadius(A0_32)
  local L1_33, L2_34
  L1_33 = A0_32[1]
  L2_34 = A0_32[2]
  resultTab = serverStatusShowRadius(L1_33, L2_34)
  if resultTab == nil then
    printCLIError("Failed to get server status.")
  elseif resultTab ~= nil and resultTab ~= "" then
    printLabel("Server Status.")
    resTab.print(resultTab, 0)
  end
end
function servicesRouteCfgInputVal(A0_35)
  if A0_35["servicesRouteMgmt.serviceName"] == nil then
    printCLIError("Please Enter Service Name")
    return false
  end
  if A0_35["servicesRouteMgmt.serviceInterface"] == nil then
    printCLIError("Please Enter Service Interface")
    return false
  end
  if A0_35["servicesRouteMgmt.routeInterface"] == nil then
    printCLIError("Please Enter Route Interface Name")
    return false
  end
  if tonumber(A0_35["servicesRouteMgmt.routeInterface"]) == 1 then
    if A0_35["servicesRouteMgmt.vlanName"] == nil then
      printCLIError("Please Enter VLAN Name")
      return false
    end
    if db.existsRow("vlan", "vlanName", A0_35["servicesRouteMgmt.vlanName"]) == false then
      printCLIError("Please Enter Valid VLAN Name")
      return false
    end
  end
  if tonumber(A0_35["servicesRouteMgmt.routeInterface"]) == 2 then
    if A0_35["servicesRouteMgmt.policyName"] == nil then
      printCLIError("Please Enter Policy Name")
      return false
    end
    if db.existsRow("IpsecVPNPolicy", "VPNPolicyName", A0_35["servicesRouteMgmt.policyName"]) == false then
      printCLIError("Please Enter Valid IPSEC Policy Name")
      return false
    end
  end
  return true
end
function servicesRouteCfgSave(A0_36)
  local L1_37
  L1_37 = false
  if A0_36["servicesRouteMgmt.cookie"] == "-1" then
    returnCode, cookie = _UPVALUE0_.servicesRoutingSectionCreate(A0_36)
    if returnCode == _UPVALUE1_.SUCCESS then
      L1_37 = "OK"
    end
    statusMessage = _UPVALUE2_.errorStringGet(returnCode)
  else
    returnCode, cookie = _UPVALUE0_.servicesRoutingSectionSet(A0_36)
    if returnCode == _UPVALUE1_.SUCCESS then
      L1_37 = "OK"
    end
    statusMessage = _UPVALUE2_.errorStringGet(returnCode)
  end
  return L1_37, statusMessage
end
function servicesRouteCfgInit(A0_38)
  if A0_38[1] == nil then
    configRow = {}
    configRow["servicesRouteMgmt.cookie"] = "-1"
  else
    configRow = {}
    returnCode, serviceName, serviceInterface, routeInterface, vlanName, policyName = _UPVALUE0_.servicesRoutingSectionGetCur(A0_38[1])
    if returnCode ~= _UPVALUE1_.SUCCESS then
      return false
    end
    configRow["servicesRouteMgmt.cookie"] = A0_38[1]
    configRow["servicesRouteMgmt.serviceName"] = serviceName
    configRow["servicesRouteMgmt.serviceInterface"] = serviceInterface
    configRow["servicesRouteMgmt.routeInterface"] = routeInterface
    configRow["servicesRouteMgmt.vlanName"] = vlanName
    configRow["servicesRouteMgmt.policyName"] = policyName
  end
  return configRow["radiusClient.cookie"], configRow
end
function servicesRouteCfgDel(A0_39)
  local L1_40
  L1_40 = false
  if A0_39[1] == nil then
    printCLIError("Please Enter the RowId")
    return false
  end
  configRow = db.getRow("ServicesRouteMgmt", "_ROWID_", A0_39[1])
  if configRow == nil then
    print("Entered rowid does not exist\n")
    return
  end
  configRow["servicesRouteMgmt.cookie"] = A0_39[1]
  returnCode, cookie = _UPVALUE0_.servicesRoutingSectionDelete(configRow)
  if returnCode == _UPVALUE1_.SUCCESS then
    L1_40 = "OK"
  end
  statusMessage = _UPVALUE2_.errorStringGet(returnCode)
  return L1_40, statusMessage
end
function servicesRouteGetAll()
  local L0_41, L1_42, L2_43, L3_44, L4_45, L5_46, L6_47
  L0_41 = db
  L0_41 = L0_41.getTable
  L1_42 = "ServicesRouteMgmt"
  L0_41 = L0_41(L1_42)
  L1_42 = {}
  L2_43 = {}
  L3_44 = 0
  L4_45 = ""
  L5_46 = ""
  L6_47 = ""
  printLabel("-------------Service Routes----------------\n")
  if L0_41 == nil then
    print("There are no entries of Services Routes on system")
  else
    for _FORV_10_, _FORV_11_ in pairs(L0_41) do
      L3_44 = L3_44 + 1
      L2_43 = L0_41[L3_44]
      if L2_43 ~= nil then
        L4_45 = L2_43["ServicesRouteMgmt.serviceName"]
        L5_46 = L2_43["ServicesRouteMgmt.serviceInterface"]
        L6_47 = L2_43["ServicesRouteMgmt.routingInterface"]
        if tonumber(L4_45) == 1 then
          L4_45 = "Radius"
        end
        if tonumber(L5_46) == 1 then
          L5_46 = "Primary Auth"
        elseif tonumber(L5_46) == 2 then
          L5_46 = "Secondary Auth"
        elseif tonumber(L5_46) == 3 then
          L5_46 = "Tertiary Auth"
        elseif tonumber(L5_46) == 4 then
          L5_46 = "Primary Acct"
        elseif tonumber(L5_46) == 5 then
          L5_46 = "Secondary Acct"
        elseif tonumber(L5_46) == 6 then
          L5_46 = "Tertiary Acct"
        end
        if tonumber(L6_47) == 1 then
          L6_47 = "VLAN"
        elseif tonumber(L6_47) == 2 then
          L6_47 = "IPSEC"
        end
        resTab.insertField(L1_42, "ROWID", L2_43["ServicesRouteMgmt._ROWID_"] or "")
        resTab.insertField(L1_42, "Service Name", L4_45 or "")
        resTab.insertField(L1_42, "Service Interface", L5_46 or "")
        resTab.insertField(L1_42, "Route Interface", L6_47 or "")
      end
    end
    resTab.print(L1_42, 0)
  end
end
