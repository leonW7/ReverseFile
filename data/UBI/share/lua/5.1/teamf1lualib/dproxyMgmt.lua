local L0_0
L0_0 = {}
dproxy = L0_0
L0_0 = dproxy
function L0_0.dnsConfig(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7
  L1_2 = ACCESS_LEVEL
  if L1_2 ~= 0 then
    L1_2 = "ACCESS_DENIED"
    return L1_2, L2_3
  end
  L1_2 = db
  L1_2 = L1_2.beginTransaction
  L1_2()
  L1_2 = false
  if A0_1 ~= nil then
    dnsTable = L2_3
    for L5_6, L6_7 in L2_3(L3_4) do
      L6_7["DnsStaticHostsMapping.HostName"] = A0_1["DnsStaticHostsMapping.HostName" .. L6_7["DnsStaticHostsMapping._ROWID_"]]
      L6_7["DnsStaticHostsMapping.IpAddress"] = A0_1["DnsStaticHostsMapping.IpAddress" .. L6_7["DnsStaticHostsMapping._ROWID_"]]
      L1_2 = db.update("DnsStaticHostsMapping", L6_7, L6_7["DnsStaticHostsMapping._ROWID_"])
    end
  end
  if L1_2 then
    L2_3(L3_4)
    return L2_3, L3_4
  else
    L2_3()
    return L2_3, L3_4
  end
end
