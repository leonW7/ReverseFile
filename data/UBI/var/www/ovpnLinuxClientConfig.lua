local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21
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
if L10_10 then
  L2_2 = L10_10["OpenvpnSession.username"]
  L11_11 = db
  L11_11 = L11_11.getAttribute
  L12_12 = "Users"
  L13_13 = "UserName"
  L14_14 = L2_2
  L15_15 = "Password"
  L11_11 = L11_11(L12_12, L13_13, L14_14, L15_15)
  L3_3 = L11_11
  L11_11 = "/var/certs/openvpn/"
  L12_12 = L2_2
  L13_13 = ".ovpn"
  L6_6 = L11_11 .. L12_12 .. L13_13
  L11_11 = util
  L11_11 = L11_11.fileExists
  L12_12 = L6_6
  L11_11 = L11_11(L12_12)
  if L11_11 == false then
    L2_2 = "client"
    L11_11 = "/var/certs/openvpn/"
    L12_12 = L2_2
    L13_13 = ".ovpn"
    L6_6 = L11_11 .. L12_12 .. L13_13
  end
end
L11_11 = L2_2
L12_12 = "_config.ovpn"
L4_4 = L11_11 .. L12_12
L11_11 = io
L11_11 = L11_11.open
L12_12 = "/var/certs/openvpn/tmp.ovpn"
L13_13 = "w+"
L11_11 = L11_11(L12_12, L13_13)
L13_13 = L11_11
L12_12 = L11_11.write
L14_14 = "\n"
L12_12(L13_13, L14_14)
L13_13 = L11_11
L12_12 = L11_11.write
L14_14 = L9_9
L12_12(L13_13, L14_14)
L13_13 = L11_11
L12_12 = L11_11.write
L14_14 = "\n"
L12_12(L13_13, L14_14)
L13_13 = L11_11
L12_12 = L11_11.write
L14_14 = "dev tun1"
L12_12(L13_13, L14_14)
L13_13 = L11_11
L12_12 = L11_11.write
L14_14 = "\n"
L12_12(L13_13, L14_14)
L12_12 = nil
L13_13 = db
L13_13 = L13_13.getRow
L14_14 = "OpenVpn"
L15_15 = "_ROWID_"
L16_16 = "1"
L13_13 = L13_13(L14_14, L15_15, L16_16)
L5_5 = L13_13
L12_12 = L5_5["OpenVpn.userAuthSupportEnable"]
if L12_12 == "1" then
  L14_14 = L11_11
  L13_13 = L11_11.write
  L15_15 = "auth-user-pass"
  L13_13(L14_14, L15_15)
  L14_14 = L11_11
  L13_13 = L11_11.write
  L15_15 = "\n"
  L13_13(L14_14, L15_15)
end
L13_13 = util
L13_13 = L13_13.fileExists
L14_14 = L6_6
L13_13 = L13_13(L14_14)
if L13_13 == false then
  L13_13 = "Please request administrator to generate Client "
  L14_14 = "Configuration"
  L13_13 = L13_13 .. L14_14
  statusMessage = L13_13
  L13_13 = web
  L13_13 = L13_13.goToPage
  L14_14 = "OmniSSLPortalLogin"
  L15_15 = true
  L16_16 = true
  L13_13(L14_14, L15_15, L16_16)
else
  L13_13 = io
  L13_13 = L13_13.open
  L14_14 = L6_6
  L15_15 = "r"
  L13_13 = L13_13(L14_14, L15_15)
  L15_15 = L13_13
  L14_14 = L13_13.read
  L16_16 = "*all"
  L14_14 = L14_14(L15_15, L16_16)
  L16_16 = L11_11
  L15_15 = L11_11.write
  L17_17 = "\n"
  L15_15(L16_16, L17_17)
  L16_16 = L11_11
  L15_15 = L11_11.write
  L17_17 = L14_14
  L15_15(L16_16, L17_17)
  L16_16 = L13_13
  L15_15 = L13_13.close
  L15_15(L16_16)
  L16_16 = L11_11
  L15_15 = L11_11.close
  L15_15(L16_16)
  L15_15 = "/var/certs/openvpn/"
  L16_16 = L2_2
  L17_17 = "_config.sh"
  L15_15 = L15_15 .. L16_16 .. L17_17
  L16_16 = ""
  L17_17 = L2_2
  L18_18 = "_config.sh"
  L16_16 = L16_16 .. L17_17 .. L18_18
  L17_17 = io
  L17_17 = L17_17.open
  L18_18 = "/var/certs/openvpn/tmp.sh"
  L19_19 = "w+"
  L17_17 = L17_17(L18_18, L19_19)
  L19_19 = L17_17
  L18_18 = L17_17.close
  L18_18(L19_19)
  L18_18 = os
  L18_18 = L18_18.execute
  L19_19 = "awk '{print \"### \" $0;}' /var/certs/openvpn/tmp.ovpn "
  L20_20 = "> /var/certs/openvpn/tmp.sh"
  L19_19 = L19_19 .. L20_20
  L18_18(L19_19)
  L18_18 = io
  L18_18 = L18_18.open
  L19_19 = L15_15
  L20_20 = "w+"
  L18_18 = L18_18(L19_19, L20_20)
  L19_19 = ""
  L20_20 = [[

sed -n '/###/p' $0 >> client_config.ovpn]]
  L21_21 = [[

sed -n '/grep/!p' client_config.ovpn > configuration.ovpn]]
  L19_19 = L19_19 .. L20_20 .. L21_21 .. [[

sed -n '/sed/!p' configuration.ovpn > client_config.ovpn]] .. [[

sed 's/### //' client_config.ovpn > openvpn_client_config.ovpn]] .. [[

sudo rm -f configuration.ovpn]] .. [[

sudo rm -f client_config.ovpn]] .. [[

sudo apt-get install openvpn]] .. [[

if [ $? -ne 0 ]]] .. [[

then]] .. [[

sudo yum install openvpn]] .. [[

fi]] .. [[

sudo openvpn --config openvpn_client_config.ovpn]]
  L21_21 = L18_18
  L20_20 = L18_18.write
  L20_20(L21_21, L19_19)
  L21_21 = L18_18
  L20_20 = L18_18.write
  L20_20(L21_21, "\n")
  L20_20 = io
  L20_20 = L20_20.open
  L21_21 = "/var/certs/openvpn/tmp.sh"
  L20_20 = L20_20(L21_21, "r")
  L21_21 = L20_20.read
  L21_21 = L21_21(L20_20, "*all")
  L18_18:write(L21_21)
  L18_18:write("\n")
  L20_20:close()
  L18_18:close()
  os.execute("rm -f /var/certs/openvpn/tmp.sh" .. "/var/certs/openvpn/tmp.ovpn")
  web.download(L15_15, L16_16)
end
