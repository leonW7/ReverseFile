local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17
L0_0 = require
L1_1 = "teamf1lualib/web"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/db"
L0_0(L1_1)
L0_0 = require
L1_1 = "x509Lib"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/util"
L0_0(L1_1)
L0_0 = "client_config.ovpn"
DEFAULT_CONFIG_FILE = L0_0
L0_0 = "/var/certs/client_config.ovpn"
CLIENT_CONFIG_FILE = L0_0
L0_0 = SAPI
L0_0 = L0_0.Request
L0_0 = L0_0.servervariable
L1_1 = "REMOTE_ADDR"
L0_0 = L0_0(L1_1)
L1_1 = SAPI
L1_1 = L1_1.Request
L1_1 = L1_1.servervariable
L2_2 = "SERVER_ADDR"
L1_1 = L1_1(L2_2)
L2_2, L3_3, L4_4, L5_5, L6_6, L7_7 = nil, nil, nil, nil, nil, nil
L8_8 = "ipaddr = '"
L9_9 = L0_0
L10_10 = "' AND loginState = 'LOGGED_IN'"
L8_8 = L8_8 .. L9_9 .. L10_10
L9_9 = "remote "
L10_10 = L1_1
L9_9 = L9_9 .. L10_10
L10_10 = db
L10_10 = L10_10.getRowWhere
L11_11 = "OpenvpnSession"
L12_12 = L8_8
L10_10 = L10_10(L11_11, L12_12)
L11_11 = db
L11_11 = L11_11.getAttribute
L12_12 = "OpenVpn"
L13_13 = "_ROWID_"
L14_14 = "1"
L15_15 = "Port"
L11_11 = L11_11(L12_12, L13_13, L14_14, L15_15)
if L10_10 then
  L2_2 = L10_10["OpenvpnSession.username"]
  L12_12 = db
  L12_12 = L12_12.getAttribute
  L13_13 = "Users"
  L14_14 = "UserName"
  L15_15 = L2_2
  L16_16 = "Password"
  L12_12 = L12_12(L13_13, L14_14, L15_15, L16_16)
  L3_3 = L12_12
  L12_12 = "/var/certs/openvpn/"
  L13_13 = L2_2
  L14_14 = ".ovpn"
  L6_6 = L12_12 .. L13_13 .. L14_14
  L12_12 = util
  L12_12 = L12_12.fileExists
  L13_13 = L6_6
  L12_12 = L12_12(L13_13)
  if L12_12 == false then
    L2_2 = "client"
    L12_12 = "/var/certs/openvpn/"
    L13_13 = L2_2
    L14_14 = ".ovpn"
    L6_6 = L12_12 .. L13_13 .. L14_14
  end
end
L12_12 = L2_2
L13_13 = "_config.ovpn"
L4_4 = L12_12 .. L13_13
L12_12 = io
L12_12 = L12_12.open
L13_13 = "/var/certs/openvpn/client_macos.ovpn"
L14_14 = "w+"
L12_12 = L12_12(L13_13, L14_14)
L14_14 = L12_12
L13_13 = L12_12.write
L15_15 = "\n"
L13_13(L14_14, L15_15)
L14_14 = L12_12
L13_13 = L12_12.write
L15_15 = L9_9
L13_13(L14_14, L15_15)
L14_14 = L12_12
L13_13 = L12_12.write
L15_15 = " "
L13_13(L14_14, L15_15)
L14_14 = L12_12
L13_13 = L12_12.write
L15_15 = L11_11
L13_13(L14_14, L15_15)
L14_14 = L12_12
L13_13 = L12_12.write
L15_15 = "\n"
L13_13(L14_14, L15_15)
L14_14 = L12_12
L13_13 = L12_12.write
L15_15 = "dev tun"
L13_13(L14_14, L15_15)
L14_14 = L12_12
L13_13 = L12_12.write
L15_15 = "\n"
L13_13(L14_14, L15_15)
L13_13 = nil
L14_14 = db
L14_14 = L14_14.getRow
L15_15 = "OpenVpn"
L16_16 = "_ROWID_"
L17_17 = "1"
L14_14 = L14_14(L15_15, L16_16, L17_17)
L5_5 = L14_14
L13_13 = L5_5["OpenVpn.userAuthSupportEnable"]
if L13_13 == "1" then
  L15_15 = L12_12
  L14_14 = L12_12.write
  L16_16 = "auth-user-pass"
  L14_14(L15_15, L16_16)
  L15_15 = L12_12
  L14_14 = L12_12.write
  L16_16 = "\n"
  L14_14(L15_15, L16_16)
end
L14_14 = util
L14_14 = L14_14.fileExists
L15_15 = L6_6
L14_14 = L14_14(L15_15)
if L14_14 == false then
  L14_14 = "Please request administrator to generate Client"
  L15_15 = "Configuration"
  L14_14 = L14_14 .. L15_15
  statusMessage = L14_14
  L14_14 = web
  L14_14 = L14_14.goToPage
  L15_15 = "OmniSSLPortalLogin"
  L16_16 = true
  L17_17 = true
  L14_14(L15_15, L16_16, L17_17)
else
  L14_14 = io
  L14_14 = L14_14.open
  L15_15 = L6_6
  L16_16 = "r"
  L14_14 = L14_14(L15_15, L16_16)
  L16_16 = L14_14
  L15_15 = L14_14.read
  L17_17 = "*all"
  L15_15 = L15_15(L16_16, L17_17)
  L17_17 = L12_12
  L16_16 = L12_12.write
  L16_16(L17_17, "\n")
  L17_17 = L12_12
  L16_16 = L12_12.write
  L16_16(L17_17, L15_15)
  L17_17 = L14_14
  L16_16 = L14_14.close
  L16_16(L17_17)
  L17_17 = L12_12
  L16_16 = L12_12.close
  L16_16(L17_17)
  L16_16 = "/var/certs/openvpn/client_macos.ovpn"
  L17_17 = ""
  L17_17 = L17_17 .. L2_2 .. "_config.ovpn"
  web.download(L16_16, L17_17)
end
