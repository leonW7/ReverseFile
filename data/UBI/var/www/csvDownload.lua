local L0_0, L1_1, L2_2, L3_3
L0_0 = ACCESS_LEVEL
if L0_0 ~= 0 then
  L0_0 = -1
  L1_1 = "Administrator Privileges Are Required"
  statusMessage = L1_1
  errorFlag = L0_0
else
  L0_0 = false
  L1_1 = cgi
  L1_1 = L1_1.tableName
  L1_1 = L1_1 or ""
  L2_2 = ""
  L3_3 = ""
  if L1_1 == nil then
    return "ERROR", "NULL_PARAMETER"
  end
  if L1_1 == "BlockSites" then
    L0_0 = os.execute("/pfrm2.0/bin/exportBlockedKeyword " .. L1_1)
  elseif L1_1 == "TrustedDomains" then
    L0_0 = os.execute("/pfrm2.0/bin/exportApprovedUrls " .. L1_1)
  else
    return "ERROR", "TABLE_NOT_SUPPORTED"
  end
  if L1_1 == "BlockSites" then
    L2_2 = "/tmp/exportBlockedKeyword.csv"
    L3_3 = "blockedKeywords"
  elseif L1_1 == "TrustedDomains" then
    L2_2 = "/tmp/exportApprovedUrls.csv"
    L3_3 = "approvedUrls"
  end
  web.download(L2_2, L3_3 .. ".csv")
end
