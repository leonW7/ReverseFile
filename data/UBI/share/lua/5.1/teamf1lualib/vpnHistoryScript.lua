local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32
L0_0 = require
L1_1 = "teamf1lualib/db"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/users_bl"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/activeVpns_bl"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/policies_bl"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/returnCodes"
L0_0(L1_1)
L0_0 = "/tmp/system.db"
DB_FILE_NAME = L0_0
L0_0 = db
L0_0 = L0_0.connect
L1_1 = DB_FILE_NAME
L0_0(L1_1)
L0_0 = "HIGH"
HIGH_SEC = L0_0
L0_0 = io
L0_0 = L0_0.open
L1_1 = "/etc/security_level.conf"
L2_2 = "r"
L0_0 = L0_0(L1_1, L2_2)
if L0_0 then
  L2_2 = L0_0
  L1_1 = L0_0.read
  L3_3 = "*all"
  L1_1 = L1_1(L2_2, L3_3)
  L1_1 = L1_1 or "HIGH"
  HIGH_SEC = L1_1
  L1_1 = string
  L1_1 = L1_1.find
  L2_2 = HIGH_SEC
  L3_3 = "HIGH"
  L1_1 = L1_1(L2_2, L3_3)
  if L1_1 then
    L1_1 = "HIGH"
    HIGH_SEC = L1_1
  else
    L1_1 = "LOW"
    HIGH_SEC = L1_1
  end
  L2_2 = L0_0
  L1_1 = L0_0.close
  L1_1(L2_2)
end
L1_1 = HIGH_SEC
if L1_1 == "HIGH" then
  L1_1 = require
  L2_2 = "teamf1lualib/activeSslVpns_bl"
  L1_1(L2_2)
end
L1_1 = require
L2_2 = "com.teamf1.bl.userdb.users"
L1_1 = L1_1(L2_2)
L2_2 = nil
L3_3 = HIGH_SEC
if L3_3 == "HIGH" then
  L3_3 = require
  L4_4 = "com.teamf1.bl.vpn.sslvpn.currentusers"
  L3_3 = L3_3(L4_4)
  L2_2 = L3_3
end
L3_3 = require
L4_4 = "com.teamf1.bl.ipsec.policy"
L3_3 = L3_3(L4_4)
L4_4 = require
L5_5 = "com.teamf1.bl.ipsec.connectionStatus"
L4_4 = L4_4(L5_5)
L5_5 = require
L6_6 = "com.teamf1.core.returnCodes"
L5_5 = L5_5(L6_6)
L6_6 = 1
L7_7 = 6
L8_8 = 1
L9_9, L10_10 = nil, nil
L11_11 = false
L12_12 = false
L13_13 = {}
L14_14 = {}
L15_15 = {}
L16_16 = "IPsec SA Established"
L17_17 = nil
L18_18 = 0
L19_19 = 0
L20_20 = HIGH_SEC
if L20_20 == "HIGH" then
  L20_20 = {}
  L20_20 = L21_21
  for L24_24, L25_25 in L21_21(L22_22) do
    if L26_26 ~= nil and L26_26 ~= "" then
      if L28_28 == "0" then
        L19_19 = L19_19 + 1
      end
    end
  end
  L22_22()
  L17_17 = L22_22
  if L17_17 == L22_22 then
    for L25_25, L26_26 in L22_22(L23_23) do
      if L27_27 ~= "" then
        L18_18 = L18_18 + 1
      end
    end
  else
    return L22_22
  end
end
L20_20 = 0
L17_17 = L25_25
if L17_17 == L25_25 then
  for L28_28, L29_29 in L25_25(L26_26) do
    if L30_30 ~= "1" then
    else
      if L30_30 == "2" then
        L20_20 = L20_20 + 1
    end
    else
    end
  end
else
  return L25_25
end
L17_17 = L26_26
if L17_17 == L26_26 then
  for L29_29, L30_30 in L26_26(L27_27) do
    L31_31 = L25_25[L29_29]
    L31_31 = L31_31.ConnectionStatus
    if L31_31 == L16_16 then
      L31_31 = L25_25[L29_29]
      L31_31 = L31_31.AutopolicyType
      if L31_31 == "1" then
      else
        L31_31 = L25_25[L29_29]
        L31_31 = L31_31.AutopolicyType
      end
    end
  end
else
  return L26_26
end
L10_10 = L26_26
for L31_31, L32_32 in L28_28(L29_29) do
  for _FORV_36_, _FORV_37_ in pairs(L32_32) do
    if _FORV_36_ == "vpnDataHistory.time" then
      L15_15[L27_27] = _FORV_37_
    end
  end
end
L28_28(L29_29)
if L28_28 >= 0 then
  if L28_28 <= L29_29 then
    L14_14["vpnDataHistory.sslvpnUser"] = L19_19
    L14_14["vpnDataHistory.activeSslvpnUser"] = L18_18
    L14_14["vpnDataHistory.clientTunnels"] = L20_20
    L14_14["vpnDataHistory.gatewayTunnels"] = L21_21
    L14_14["vpnDataHistory.activeClientTunnels"] = L22_22
    L14_14["vpnDataHistory.activeGatewayTunnels"] = L23_23
  end
elseif L7_7 <= L28_28 then
  L29_29()
  L31_31 = "time"
  L32_32 = L28_28
  L11_11 = L29_29
  if L11_11 then
    L29_29(L30_30)
  else
    L29_29()
  end
  L11_11 = false
  L12_12 = false
  L14_14["vpnDataHistory.sslvpnUser"] = L19_19
  L14_14["vpnDataHistory.activeSslvpnUser"] = L18_18
  L14_14["vpnDataHistory.clientTunnels"] = L20_20
  L14_14["vpnDataHistory.gatewayTunnels"] = L21_21
  L14_14["vpnDataHistory.activeClientTunnels"] = L22_22
  L14_14["vpnDataHistory.activeGatewayTunnels"] = L23_23
end
L14_14["vpnDataHistory.time"] = L10_10
L28_28()
L11_11 = L28_28
if L11_11 then
  L28_28(L29_29)
else
  L28_28()
  L11_11 = false
  L12_12 = false
end
