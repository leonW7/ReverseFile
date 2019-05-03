require("teamf1lualib/extAuth")
require("teamf1lualib/pop")
require("teamf1lualib/serverCheck")
function ntdomainCfgInputVal(A0_0)
  if A0_0["NTDomainSettings.AuthenticationServer"] == nil or A0_0["NTDomainSettings.AuthenticationServer"] == "" then
    printCLIError("Please provide ip address of first authentication server.")
    return false
  end
  if A0_0["NTDomainSettings.NTDomainWorkGroup"] == nil then
    printCLIError("Please provide a workgroup for the NT Domain Server")
    return false
  end
  if A0_0["NTDomainSettings.SecondAuthenticationServer"] ~= nil and A0_0["NTDomainSettings.SecondAuthenticationServer"] ~= "" and (A0_0["NTDomainSettings.NTDomainSecondWorkGroup"] == nil or A0_0["NTDomainSettings.NTDomainSecondWorkGroup"] == "") or (A0_0["NTDomainSettings.SecondAuthenticationServer"] == nil or A0_0["NTDomainSettings.SecondAuthenticationServer"] == "") and A0_0["NTDomainSettings.NTDomainSecondWorkGroup"] ~= nil and A0_0["NTDomainSettings.NTDomainSecondWorkGroup"] ~= "" then
    printCLIError("Please configure second authentication server and second workgroup both.")
    return false
  end
  if A0_0["NTDomainSettings.ThirdAuthenticationServer"] ~= nil and A0_0["NTDomainSettings.ThirdAuthenticationServer"] ~= "" and (A0_0["NTDomainSettings.ThirdNTDomainWorkGroup"] == nil or A0_0["NTDomainSettings.ThirdNTDomainWorkGroup"] == "") or (A0_0["NTDomainSettings.ThirdAuthenticationServer"] == nil or A0_0["NTDomainSettings.ThirdAuthenticationServer"] == "") and A0_0["NTDomainSettings.ThirdNTDomainWorkGroup"] ~= nil and A0_0["NTDomainSettings.ThirdNTDomainWorkGroup"] ~= "" then
    printCLIError("Please configure third authentication server and third workgroup both.")
    return false
  end
  if A0_0["NTDomainSettings.TimeOut"] == nil or tonumber(A0_0["NTDomainSettings.TimeOut"]) < 1 or tonumber(A0_0["NTDomainSettings.TimeOut"]) > 999 then
    printCLIError("Please provide timeout value between 1 and 999")
    return false
  end
  if A0_0["NTDomainSettings.Retries"] == nil then
    printCLIError("Please provide number of retries.")
    return false
  end
  return true
end
function activedirectoryCfgInputVal(A0_1)
  local L1_2
  L1_2 = 0
  if A0_1["ActiveDirectorySettings.AuthenticationServer"] == nil then
    printCLIError("Please provide ip address of primary authentication server.")
    return false
  end
  if A0_1["ActiveDirectorySettings.ActiveDirectoryDomain"] == nil or A0_1["ActiveDirectorySettings.ActiveDirectoryDomain"] == "" then
    printCLIError("Please provide an active directory domain for the authentication Server")
    return false
  end
  if A0_1["ActiveDirectorySettings.SecondAuthenticationServer"] ~= nil and A0_1["ActiveDirectorySettings.SecondAuthenticationServer"] ~= "" and (A0_1["ActiveDirectorySettings.SecondActiveDirectoryDomain"] == nil or A0_1["ActiveDirectorySettings.SecondActiveDirectoryDomain"] == "") or (A0_1["ActiveDirectorySettings.SecondAuthenticationServer"] == nil or A0_1["ActiveDirectorySettings.SecondAuthenticationServer"] == "") and A0_1["ActiveDirectorySettings.SecondActiveDirectoryDomain"] ~= nil and A0_1["ActiveDirectorySettings.SecondActiveDirectoryDomain"] ~= "" then
    printCLIError("Please configure second authentication server and second active directory domain both.")
    return false
  end
  if A0_1["ActiveDirectorySettings.ThirdAuthenticationServer"] ~= nil and A0_1["ActiveDirectorySettings.ThirdAuthenticationServer"] ~= "" and (A0_1["ActiveDirectorySettings.ThirdActiveDirectoryDomain"] == nil or A0_1["ActiveDirectorySettings.ThirdActiveDirectoryDomain"] == "") or (A0_1["ActiveDirectorySettings.ThirdAuthenticationServer"] == nil or A0_1["ActiveDirectorySettings.ThirdAuthenticationServer"] == "") and A0_1["ActiveDirectorySettings.ThirdActiveDirectoryDomain"] ~= nil and A0_1["ActiveDirectorySettings.ThirdActiveDirectoryDomain"] ~= "" then
    printCLIError("Please configure third authentication server and third activeDirectory domain both.")
    return false
  end
  if A0_1["ActiveDirectorySettings.TimeOut"] == nil or tonumber(A0_1["ActiveDirectorySettings.TimeOut"]) < 1 or tonumber(A0_1["ActiveDirectorySettings.TimeOut"]) > 999 then
    printCLIError("Please provide timeout value between 1 and 999")
    return false
  end
  if A0_1["ActiveDirectorySettings.Retries"] == nil then
    printCLIError("Please provide number of retries.")
    return false
  end
  if A0_1["ActiveDirectorySettings.SecondActiveDirectoryDomain"] ~= nil and A0_1["ActiveDirectorySettings.SecondActiveDirectoryDomain"] ~= "" then
    L1_2 = 1
    if A0_1["ActiveDirectorySettings.ActiveDirectoryDomain"] == A0_1["ActiveDirectorySettings.SecondActiveDirectoryDomain"] then
      printCLIError("Please configure different values for 'Active Directory Domain' and 'Second Active Directory Domain'.")
      return false
    end
  end
  if A0_1["ActiveDirectorySettings.ThirdActiveDirectoryDomain"] ~= nil and A0_1["ActiveDirectorySettings.ThirdActiveDirectoryDomain"] ~= "" and A0_1["ActiveDirectorySettings.ActiveDirectoryDomain"] == A0_1["ActiveDirectorySettings.ThirdActiveDirectoryDomain"] then
    printCLIError("Please configure different values for 'Active Directory Domain' and 'Third Active Directory Domain'.")
    return false
  end
  if L1_2 == 1 and L1_2 == 1 and A0_1["ActiveDirectorySettings.ThirdActiveDirectoryDomain"] == A0_1["ActiveDirectorySettings.SecondActiveDirectoryDomain"] then
    printCLIError("Please configure different values for 'Second Directory Domain' and 'Third Active Directory Domain'.")
    return false
  end
  return true
end
function ldapCfgInputVal(A0_3)
  if A0_3["LDAPSettings.AuthenticationServer"] == nil then
    printCLIError("Please provide ip address of primary authentication server.")
    return false
  end
  if A0_3["LDAPSettings.LDAPBaseDN"] == nil then
    printCLIError("Please provide LDAP Base DN DN")
    return false
  end
  if A0_3["LDAPSettings.SecondAuthenticationServer"] ~= nil and A0_3["LDAPSettings.SecondAuthenticationServer"] ~= "" and (A0_3["LDAPSettings.SecondLDAPBaseDN"] == nil or A0_3["LDAPSettings.SecondLDAPBaseDN"] == "") or (A0_3["LDAPSettings.SecondAuthenticationServer"] == nil or A0_3["LDAPSettings.SecondAuthenticationServer"] == "") and A0_3["LDAPSettings.SecondLDAPBaseDN"] ~= nil and A0_3["LDAPSettings.SecondLDAPBaseDN"] ~= "" then
    printCLIError("Please configure second authentication server and second LDAP BASE DN both.")
    return false
  end
  if A0_3["LDAPSettings.ThirdAuthenticationServer"] ~= nil and A0_3["LDAPSettings.ThirdAuthenticationServer"] ~= "" and (A0_3["LDAPSettings.ThirdLDAPBaseDN"] == nil or A0_3["LDAPSettings.ThirdLDAPBaseDN"] == "") or (A0_3["LDAPSettings.ThirdAuthenticationServer"] == nil or A0_3["LDAPSettings.ThirdAuthenticationServer"] == "") and A0_3["LDAPSettings.ThirdLDAPBaseDN"] ~= nil and A0_3["LDAPSettings.ThirdLDAPBaseDN"] ~= "" then
    printCLIError("Please configure third authentication server and third LDAP BASE DN both.")
    return false
  end
  if A0_3["LDAPSettings.TimeOut"] == nil or tonumber(A0_3["LDAPSettings.TimeOut"]) < 1 or tonumber(A0_3["LDAPSettings.TimeOut"]) > 999 then
    printCLIError("Please provide timeout value between 1 and 999")
    return false
  end
  if A0_3["LDAPSettings.Retries"] == nil then
    printCLIError("Please provide number of retries.")
    return false
  end
  return true
end
function file_exists(A0_4)
  local L1_5
  L1_5 = io
  L1_5 = L1_5.open
  L1_5 = L1_5(A0_4, "r")
  if L1_5 ~= nil then
    io.close(L1_5)
    return true
  else
    return false
  end
end
function pop3CfgInputVal(A0_6)
  if A0_6["POPProfiles.Server"] == nil or A0_6["POPProfiles.Server"] == "" then
    printCLIError("Please configure primary authentication server.")
    return false
  end
  if tonumber(A0_6["POPProfiles.AuthenticationPort"]) == nil then
    printCLIError("Please configure authentication port for primary server.")
    return false
  end
  if tonumber(A0_6["POPProfiles.SSLEnable"]) == 1 then
    if A0_6["POPProfiles.CAFile"] == nil or A0_6["POPProfiles.CAFile"] == "" then
      printCLIError("Please configure CAFILE for primary authentication server.")
      return false
    elseif not file_exists("/flash/tmp/caFiles/" .. A0_6["POPProfiles.CAFile"]) then
      printCLIError(A0_6["POPProfiles.CAFile"] .. ": File Not Exist.")
      return false
    end
  end
  if A0_6["POPProfiles.SecondServer"] == nil or A0_6["POPProfiles.SecondServer"] == "" then
    printCLIError("Please configure secondary authentication server.")
    return false
  end
  if A0_6["POPProfiles.SecondAuthenticationPort"] == nil then
    printCLIError("Please configure authentication port for secondary server.")
    return false
  end
  if tonumber(A0_6["POPProfiles.SecondSSLEnable"]) == 1 then
    if A0_6["POPProfiles.SecondCAFile"] == nil or A0_6["POPProfiles.SecondCAFile"] == "" then
      printCLIError("Please configure CAFILE for secondary authentication server.")
      return false
    elseif not file_exists("/flash/tmp/caFiles/" .. A0_6["POPProfiles.SecondCAFile"]) then
      printCLIError(A0_6["POPProfiles.SecondCAFile"] .. ": File Not Exist.")
      return false
    end
  end
  if A0_6["POPProfiles.ThirdServer"] ~= nil and A0_6["POPProfiles.ThirdServer"] ~= "" then
    if A0_6["POPProfiles.ThirdAuthenticationPort"] == nil then
      printCLIError("Please configure authentication port for optional server.")
      return false
    end
    if tonumber(A0_6["POPProfiles.ThirdSSLEnable"]) == 1 then
      if A0_6["POPProfiles.ThirdCAFile"] == nil or A0_6["POPProfiles.ThirdCAFile"] == "" then
        printCLIError("Please configure CAFILE for optional authentication server.")
        return false
      elseif not file_exists("/flash/tmp/caFiles/" .. A0_6["POPProfiles.ThirdCAFile"]) then
        printCLIError(A0_6["POPProfiles.ThirdCAFile"] .. ": File Not Exist.")
        return false
      end
    end
  end
  return true
end
function ntdomainCfgSave(A0_7)
  local L1_8, L2_9, L3_10
  L1_8 = "ERROR"
  L2_9 = ""
  L3_10 = ""
  if A0_7["NTDomainSettings._ROWID_"] == "-1" then
    L1_8, L2_9 = extAuth.ntdomain_config(A0_7, "-1", "add")
  else
    L1_8, L2_9 = extAuth.ntdomain_config(A0_7, A0_7["NTDomainSettings._ROWID_"], "edit")
  end
  if L1_8 == "OK" then
    db.save()
  end
  L3_10 = db.getAttribute("stringsMap", "stringId", L2_9, LANGUAGE)
  return L1_8, L3_10
end
function activedirectoryCfgSave(A0_11)
  local L1_12, L2_13, L3_14
  L1_12 = "ERROR"
  L2_13 = ""
  L3_14 = ""
  if A0_11["ActiveDirectorySettings._ROWID_"] == "-1" then
    L1_12, L2_13 = extAuth.activedirectory_config(A0_11, "-1", "add")
  else
    L1_12, L2_13 = extAuth.activedirectory_config(A0_11, A0_11["ActiveDirectorySettings._ROWID_"], "edit")
  end
  if L1_12 == "OK" then
    db.save()
  end
  L3_14 = db.getAttribute("stringsMap", "stringId", L2_13, LANGUAGE)
  return L1_12, L3_14
end
function ldapCfgSave(A0_15)
  local L1_16, L2_17, L3_18
  L1_16 = "ERROR"
  L2_17 = ""
  L3_18 = ""
  if A0_15["LDAPSettings._ROWID_"] == "-1" then
    L1_16, L2_17 = extAuth.ldap_config(A0_15, "-1", "add")
  else
    L1_16, L2_17 = extAuth.ldap_config(A0_15, A0_15["LDAPSettings._ROWID_"], "edit")
  end
  if L1_16 == "OK" then
    db.save()
  end
  L3_18 = db.getAttribute("stringsMap", "stringId", L2_17, LANGUAGE)
  return L1_16, L3_18
end
function pop3CfgSave(A0_19)
  local L1_20, L2_21, L3_22
  L1_20 = "ERROR"
  L2_21 = ""
  L3_22 = ""
  if A0_19["POPProfiles._ROWID_"] == "-1" then
    L1_20, L2_21 = pop.profilesConfig(A0_19, "-1", "add")
  else
    L1_20, L2_21 = pop.profilesConfig(A0_19, A0_19["POPProfiles._ROWID_"], "edit")
  end
  if L1_20 == "OK" then
    db.save()
  end
  L3_22 = db.getAttribute("stringsMap", "stringId", L2_21, LANGUAGE)
  return L1_20, L3_22
end
function ntdomainCfgInit()
  configRow = db.getRow("NTDomainSettings", "ProfileName", "Default")
  if configRow == nil then
    configRow = {}
    configRow["NTDomainSettings._ROWID_"] = "-1"
  end
  return configRow["NTDomainSettings._ROWID_"], configRow
end
function activedirectoryCfgInit()
  configRow = db.getRow("ActiveDirectorySettings", "ProfileName", "Default")
  if configRow == nil then
    configRow = {}
    configRow["ActiveDirectorySettings._ROWID_"] = "-1"
  end
  return configRow["ActiveDirectorySettings._ROWID_"], configRow
end
function ldapCfgInit()
  configRow = db.getRow("LDAPSettings", "ProfileName", "Default")
  if configRow == nil then
    configRow = {}
    configRow["LDAPSettings._ROWID_"] = "-1"
  end
  return configRow["LDAPSettings._ROWID_"], configRow
end
function pop3CfgInit()
  configRow = db.getRow("POPProfiles", "ProfileName", "Default")
  if configRow == nil then
    configRow = {}
    configRow["POPProfiles._ROWID_"] = "-1"
  end
  return configRow["POPProfiles._ROWID_"], configRow
end
function ntdomainGetSingle(A0_23)
  local L1_24
  L1_24 = {}
  row = db.getRow("NTDomainSettings", "NTDomainSettings.ProfileName", A0_23)
  if row == nil then
    return nil
  end
  resTab.insertField(L1_24, "Authentication Server 1", row["NTDomainSettings.AuthenticationServer"])
  resTab.insertField(L1_24, "Authentication Server 2", row["NTDomainSettings.SecondAuthenticationServer"] or "NOT SPECIFIED")
  resTab.insertField(L1_24, "Authentication Server 3", row["NTDomainSettings.ThirdAuthenticationServer"] or "NOT SPECIFIED")
  resTab.insertField(L1_24, "Workgroup", row["NTDomainSettings.NTDomainWorkGroup"])
  resTab.insertField(L1_24, "Second Workgroup", row["NTDomainSettings.NTDomainSecondWorkGroup"] or "NOT SPECIFIED")
  resTab.insertField(L1_24, "Third Workgroup", row["NTDomainSettings.ThirdNTDomainWorkGroup"] or "NOT SPECIFIED")
  resTab.insertField(L1_24, "TimeOut", row["NTDomainSettings.TimeOut"])
  resTab.insertField(L1_24, "Retries", row["NTDomainSettings.Retries"])
  resTab.insertField(L1_24, "First Admin Name", row["NTDomainSettings.FirstAdminAccount"] or "NOT SPECIFIED")
  resTab.insertField(L1_24, "First Admin Password", row["NTDomainSettings.FirstAdminPasswd"] or "NOT SPECIFIED")
  resTab.insertField(L1_24, "First Server Hostname", row["NTDomainSettings.FirstServerHostname"] or "NOT SPECIFIED")
  resTab.insertField(L1_24, "Second Admin Name", row["NTDomainSettings.SecondAdminAccount"] or "NOT SPECIFIED")
  resTab.insertField(L1_24, "Second Admin Password", row["NTDomainSettings.SecondAdminPasswd"] or "NOT SPECIFIED")
  resTab.insertField(L1_24, "Second Admin Hostname", row["NTDomainSettings.SecondServerHostname"] or "NOT SPECIFIED")
  resTab.insertField(L1_24, "Third Admin Name", row["NTDomainSettings.ThirdAdminAccount"] or "NOT SPECIFIED")
  resTab.insertField(L1_24, "Third Admin Password", row["NTDomainSettings.ThirdAdminPasswd"] or "NOT SPECIFIED")
  resTab.insertField(L1_24, "Third Admin Hostname", row["NTDomainSettings.ThirdServerHostname"] or "NOT SPECIFIED")
  return L1_24
end
function activedirectoryGetSingle(A0_25)
  local L1_26
  L1_26 = {}
  row = db.getRow("ActiveDirectorySettings", "ActiveDirectorySettings.ProfileName", A0_25)
  if row == nil then
    return nil
  end
  resTab.insertField(L1_26, "Authentication Server 1", row["ActiveDirectorySettings.AuthenticationServer"])
  resTab.insertField(L1_26, "Authentication Server 2", row["ActiveDirectorySettings.SecondAuthenticationServer"] or "NOT SPECIFIED")
  resTab.insertField(L1_26, "Authentication Server 3", row["ActiveDirectorySettings.ThirdAuthenticationServer"] or "NOT SPECIFIED")
  resTab.insertField(L1_26, "Active Directory Domain", row["ActiveDirectorySettings.ActiveDirectoryDomain"])
  resTab.insertField(L1_26, "Second Active Directory Domain", row["ActiveDirectorySettings.SecondActiveDirectoryDomain"] or "NOT SPECIFIED")
  resTab.insertField(L1_26, "Third Active Directory Domain", row["ActiveDirectorySettings.ThirdActiveDirectoryDomain"] or "NOT SPECIFIED")
  resTab.insertField(L1_26, "Retries", row["ActiveDirectorySettings.Retries"])
  resTab.insertField(L1_26, "TimeOut", row["ActiveDirectorySettings.TimeOut"])
  resTab.insertField(L1_26, "First Admin Name", row["ActiveDirectorySettings.FirstAdminAccount"] or "NOT SPECIFIED")
  resTab.insertField(L1_26, "First Admin Password", row["ActiveDirectorySettings.FirstAdminPasswd"] or "NOT SPECIFIED")
  resTab.insertField(L1_26, "First Server Hostname", row["ActiveDirectorySettings.FirstServerHostname"] or "NOT SPECIFIED")
  resTab.insertField(L1_26, "Second Admin Name", row["ActiveDirectorySettings.SecondAdminAccount"] or "NOT SPECIFIED")
  resTab.insertField(L1_26, "Second Admin Password", row["ActiveDirectorySettings.SecondAdminPasswd"] or "NOT SPECIFIED")
  resTab.insertField(L1_26, "Second Admin Hostname", row["ActiveDirectorySettings.SecondServerHostname"] or "NOT SPECIFIED")
  resTab.insertField(L1_26, "Third Admin Name", row["ActiveDirectorySettings.ThirdAdminAccount"] or "NOT SPECIFIED")
  resTab.insertField(L1_26, "Third Admin Password", row["ActiveDirectorySettings.ThirdAdminPasswd"] or "NOT SPECIFIED")
  resTab.insertField(L1_26, "Third Admin Hostname", row["ActiveDirectorySettings.ThirdServerHostname"] or "NOT SPECIFIED")
  return L1_26
end
function ldapGetSingle(A0_27)
  local L1_28
  L1_28 = {}
  row = db.getRow("LDAPSettings", "LDAPSettings.ProfileName", A0_27)
  if row == nil then
    return nil
  end
  resTab.insertField(L1_28, "Primary Auth Server", row["LDAPSettings.AuthenticationServer"])
  resTab.insertField(L1_28, "Second Auth Server", row["LDAPSettings.SecondAuthenticationServer"] or "NOT SPECIFIED")
  resTab.insertField(L1_28, "Third Auth Server", row["LDAPSettings.ThirdAuthenticationServer"] or "NOT SPECIFIED")
  resTab.insertField(L1_28, "LDAP Base DN", row["LDAPSettings.LDAPBaseDN"])
  resTab.insertField(L1_28, "Second LDAP Base DN", row["LDAPSettings.SecondLDAPBaseDN"] or "NOT SPECIFIED")
  resTab.insertField(L1_28, "Third LDAP Base DN", row["LDAPSettings.ThirdLDAPBaseDN"] or "NOT SPECIFIED")
  resTab.insertField(L1_28, "LDAP Attribute 1", row["LDAPSettings.LDAPAttribute1"] or "NOT SPECIFIED")
  resTab.insertField(L1_28, "LDAP Attribute 2", row["LDAPSettings.LDAPAttribute2"] or "NOT SPECIFIED")
  resTab.insertField(L1_28, "LDAP Attribute 3", row["LDAPSettings.LDAPAttribute3"] or "NOT SPECIFIED")
  resTab.insertField(L1_28, "LDAP Attribute 4", row["LDAPSettings.LDAPAttribute4"] or "NOT SPECIFIED")
  resTab.insertField(L1_28, "Retries", row["LDAPSettings.Retries"])
  resTab.insertField(L1_28, "TimeOut", row["LDAPSettings.TimeOut"])
  resTab.insertField(L1_28, "First Admin Name", row["LDAPSettings.FirstAdminAccount"] or "NOT SPECIFIED")
  resTab.insertField(L1_28, "First Admin Password", row["LDAPSettings.FirstAdminPasswd"] or "NOT SPECIFIED")
  resTab.insertField(L1_28, "Second Admin Name", row["LDAPSettings.SecondAdminAccount"] or "NOT SPECIFIED")
  resTab.insertField(L1_28, "Second Admin Password", row["LDAPSettings.SecondAdminPasswd"] or "NOT SPECIFIED")
  resTab.insertField(L1_28, "Third Admin Name", row["LDAPSettings.ThirdAdminAccount"] or "NOT SPECIFIED")
  resTab.insertField(L1_28, "Third Admin Password", row["LDAPSettings.ThirdAdminPasswd"] or "NOT SPECIFIED")
  return L1_28
end
function pop3GetSingle(A0_29)
  local L1_30
  L1_30 = {}
  row = db.getRow("POPProfiles", "POPProfiles.ProfileName", A0_29)
  if row == nil then
    return nil
  end
  resTab.insertField(L1_30, "Authentication Server 1 (Primary)", row["POPProfiles.Server"] or "")
  resTab.insertField(L1_30, "Authentication Port 1", row["POPProfiles.AuthenticationPort"] or "")
  resTab.insertField(L1_30, "SSL Enable 1", row["POPProfiles.SSLEnable"] or "")
  resTab.insertField(L1_30, "CA File 1", row["POPProfiles.CAFile"] or "")
  resTab.insertField(L1_30, "Authentication Server 2 (Secondary)", row["POPProfiles.SecondServer"] or "")
  resTab.insertField(L1_30, "Authentication Port 2", row["POPProfiles.SecondAuthenticationPort"] or "")
  resTab.insertField(L1_30, "SSL Enable 2", row["POPProfiles.SecondSSLEnable"] or "")
  resTab.insertField(L1_30, "CA File 2", row["POPProfiles.SecondCAFile"] or "")
  resTab.insertField(L1_30, "Authentication Server 3 (Optional)", row["POPProfiles.ThirdServer"] or "")
  resTab.insertField(L1_30, "Authentication Port 3", row["POPProfiles.ThirdAuthenticationPort"] or "")
  resTab.insertField(L1_30, "SSL Enable 3", row["POPProfiles.ThirdSSLEnable"] or "")
  resTab.insertField(L1_30, "CA File 3", row["POPProfiles.ThirdCAFile"] or "")
  return L1_30
end
function pop3GetAllCa()
  local L0_31
  L0_31 = {}
  radiusTab = db.getTable("POPCAFiles")
  for _FORV_4_, _FORV_5_ in pairs(radiusTab) do
    resTab.insertField(L0_31, "CAFile", _FORV_5_["POPCAFiles.CAFile"])
  end
  return L0_31
end
function ntdomainGet()
  local L0_32
  L0_32 = "Default"
  resultTab = ntdomainGetSingle(L0_32)
  if resultTab ~= nil then
    printLabel("NT-Domain Configuration.")
    resTab.print(resultTab, 0)
  else
    printCLIError("NT-Domain Settings not configured.")
  end
end
function activedirectoryGet()
  local L0_33
  L0_33 = "Default"
  resultTab = activedirectoryGetSingle(L0_33)
  if resultTab ~= nil then
    printLabel("Active-Directory Configuration.")
    resTab.print(resultTab, 0)
  else
    printCLIError("Active-Directory Settings not configured.")
  end
end
function ldapGet()
  local L0_34
  L0_34 = "Default"
  resultTab = ldapGetSingle(L0_34)
  if resultTab ~= nil then
    printLabel("LDAP configuration.")
    resTab.print(resultTab, 0)
  else
    printCLIError("LDAP Settings not configured.")
  end
end
function pop3Get()
  local L0_35
  L0_35 = "Default"
  resultTab = pop3GetSingle(L0_35)
  if resultTab ~= nil then
    printLabel("POP3 configuration.")
    resTab.print(resultTab, 0)
  else
    printCLIError("POP3 Settings not configured.")
  end
end
function pop3CaFileUpload(A0_36)
  local L1_37, L2_38, L3_39
  L1_37 = A0_36[1]
  L2_38 = A0_36[2]
  L3_39 = false
  x = os.execute("tftp -gr " .. L1_37 .. " -l /tmp/" .. L1_37 .. " " .. L2_38)
  if x == 256 then
    printCLIError("TFTP failed ")
  elseif x == 0 then
    L3_39 = pop.CAAddCli(L1_37)
    if L3_39 == "OK" then
      print(L1_37 .. ": Successfully Uploaded.")
    elseif L3_39 == "ERROR" then
      printCLIError(L1_37 .. ": Operation Failed.")
    end
  end
end
function pop3DeleteCaFile(A0_40)
  local L1_41, L2_42, L3_43, L4_44
  L1_41 = A0_40[1]
  L2_42 = false
  if L1_41 ~= nil and L1_41 ~= "" then
    L3_43 = file_exists
    L4_44 = "/flash/tmp/caFiles/"
    L4_44 = L4_44 .. L1_41
    L3_43 = L3_43(L4_44)
    if not L3_43 then
      L3_43 = printCLIError
      L4_44 = L1_41
      L4_44 = L4_44 .. ": no such certificate exist."
      L3_43(L4_44)
    else
      L3_43 = db
      L3_43 = L3_43.getAttribute
      L4_44 = "POPCAFiles"
      L3_43 = L3_43(L4_44, "CAFile", L1_41, "rowid")
      L4_44 = {}
      L4_44[1] = L3_43
      L2_42 = pop.CADelete(L4_44)
      if L2_42 == "OK" then
        print(L1_41 .. ": Successfully Deleted.")
      elseif L2_42 == "ERROR" then
        printCLIError(L1_41 .. ": Deletion Failed.")
      end
    end
  else
    L3_43 = printCLIError
    L4_44 = "Please enter a valid certificate file."
    L3_43(L4_44)
  end
end
function pop3CaGet()
  resultTab = pop3GetAllCa()
  if resultTab ~= nil then
    printLabel("List Of Trusted CA.")
    resTab.print(resultTab, 0)
  else
    printCLIError("No Pop3 Certificate Found.")
  end
end
function serverStatusCheck(A0_45)
  local L1_46, L2_47, L3_48, L4_49, L5_50, L6_51
  L1_46 = A0_45[1]
  L2_47 = A0_45[2]
  L3_48 = ""
  L4_49 = ""
  L5_50 = "edit"
  if L1_46 == "pop3" then
    L6_51 = db
    L6_51 = L6_51.getAttribute
    L6_51 = L6_51(L2_47, "_ROWID_", "1", "Server")
    L3_48 = L6_51
  else
    L6_51 = db
    L6_51 = L6_51.getAttribute
    L6_51 = L6_51(L2_47, "_ROWID_", "1", "AuthenticationServer")
    L3_48 = L6_51
  end
  if L3_48 == nil or L3_48 == "" then
    L6_51 = printCLIError
    L6_51("No Authentication Server is configured.")
    L6_51 = "OK"
    return L6_51
  end
  L6_51 = serverCheck
  L6_51 = L6_51.getCheckNow
  L6_51 = L6_51(L1_46)
  if tonumber(L6_51) == 0 then
    L4_49 = serverCheck.config(L1_46, L5_50)
    if L4_49 ~= "OK" then
      printCLIError("Operation Failed.")
      return "ERROR"
    end
    print("Checking server reachability.. Get result by \"show " .. L1_46 .. "-serverCheck\"")
    return "OK"
  elseif tonumber(L6_51) == 1 then
    print("Checking server reachability.. Get result by \"show " .. L1_46 .. "-serverCheck\"")
    return "OK"
  end
end
function serverStatusShow(A0_52, A1_53)
  local L2_54, L3_55, L4_56, L5_57, L6_58, L7_59
  L2_54 = {}
  L3_55 = db
  L3_55 = L3_55.getRow
  L4_56 = "serverCheck"
  L5_57 = "serverCheck.authType"
  L6_58 = A0_52
  L3_55 = L3_55(L4_56, L5_57, L6_58)
  L4_56 = db
  L4_56 = L4_56.getRow
  L5_57 = A1_53
  L6_58 = "ProfileName"
  L7_59 = "Default"
  L4_56 = L4_56(L5_57, L6_58, L7_59)
  L5_57 = ""
  L6_58 = ""
  L7_59 = ""
  if L3_55 == nil then
    return nil
  end
  if L4_56 == nil then
    printCLIError("Server Not Configured.")
    return ""
  end
  if A1_53 == "POPProfiles" then
    L5_57 = L4_56[A1_53 .. ".Server"] or ""
    L6_58 = L4_56[A1_53 .. ".SecondServer"] or ""
    L7_59 = L4_56[A1_53 .. ".ThirdServer"] or ""
  else
    L5_57 = L4_56[A1_53 .. ".AuthenticationServer"] or ""
    L6_58 = L4_56[A1_53 .. ".SecondAuthenticationServer"] or ""
    L7_59 = L4_56[A1_53 .. ".ThirdAuthenticationServer"] or ""
  end
  if tonumber(L3_55["serverCheck.checkNow"]) == 1 then
    printCLIError("Waiting for server response, Please try after some time.")
    return ""
  end
  if tonumber(L3_55["serverCheck.checkNow"]) == 0 and tonumber(L3_55["serverCheck.response"]) == 0 then
    printCLIError("No Server Status Available.")
    return ""
  end
  if tonumber(L3_55["serverCheck.firstServerStatus"]) == 1 then
    L3_55["serverCheck.firstServerStatus"] = "OK"
  elseif tonumber(L3_55["serverCheck.firstServerStatus"]) == 2 then
    L3_55["serverCheck.firstServerStatus"] = "FAIL"
  elseif tonumber(L3_55["serverCheck.firstServerStatus"]) == 3 then
    L3_55["serverCheck.firstServerStatus"] = "NA"
  elseif tonumber(L3_55["serverCheck.firstServerStatus"]) == 4 then
    L3_55["serverCheck.firstServerStatus"] = "Unknown Error Occurred"
  end
  if tonumber(L3_55["serverCheck.secondServerStatus"]) == 1 then
    L3_55["serverCheck.secondServerStatus"] = "OK"
  elseif tonumber(L3_55["serverCheck.secondServerStatus"]) == 2 then
    L3_55["serverCheck.secondServerStatus"] = "FAIL"
  elseif tonumber(L3_55["serverCheck.secondServerStatus"]) == 3 then
    L3_55["serverCheck.secondServerStatus"] = "NA"
  elseif tonumber(L3_55["serverCheck.secondServerStatus"]) == 4 then
    L3_55["serverCheck.secondServerStatus"] = "Unknown Error Occurred"
  end
  if tonumber(L3_55["serverCheck.thirdServerStatus"]) == 1 then
    L3_55["serverCheck.thirdServerStatus"] = "OK"
  elseif tonumber(L3_55["serverCheck.thirdServerStatus"]) == 2 then
    L3_55["serverCheck.thirdServerStatus"] = "FAIL"
  elseif tonumber(L3_55["serverCheck.thirdServerStatus"]) == 3 then
    L3_55["serverCheck.thirdServerStatus"] = "NA"
  elseif tonumber(L3_55["serverCheck.thirdServerStatus"]) == 4 then
    L3_55["serverCheck.thirdServerStatus"] = "Unknown Error Occurred"
  end
  if L3_55["serverCheck.firstServerStatus"] ~= "NA" then
    resTab.insertField(L2_54, "Authentication Server 1:" .. L5_57 .. "          ", L3_55["serverCheck.firstServerStatus"])
  end
  if L3_55["serverCheck.secondServerStatus"] ~= "NA" then
    resTab.insertField(L2_54, "Authentication Server 2:" .. L6_58 .. "          ", L3_55["serverCheck.secondServerStatus"])
  end
  if L3_55["serverCheck.thirdServerStatus"] ~= "NA" then
    resTab.insertField(L2_54, "Authentication Server 3:" .. L7_59 .. "          ", L3_55["serverCheck.thirdServerStatus"])
  end
  return L2_54
end
function serverStatusGet(A0_60)
  local L1_61, L2_62
  L1_61 = A0_60[1]
  L2_62 = A0_60[2]
  resultTab = serverStatusShow(L1_61, L2_62)
  if resultTab == nil then
    printCLIError("Failed to get server status.")
  elseif resultTab ~= nil and resultTab ~= "" then
    printLabel("Server Status.")
    resTab.print(resultTab, 0)
  end
end
