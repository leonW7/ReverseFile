local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18
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
L11_11 = ""
L9_9 = L9_9 .. L10_10 .. L11_11
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
L11_11 = ""
L12_12 = L2_2
L13_13 = "_config.ovpn"
L4_4 = L11_11 .. L12_12 .. L13_13
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
L14_14 = L11_11
L13_13 = L11_11.close
L13_13(L14_14)
L13_13 = util
L13_13 = L13_13.fileExists
L14_14 = L6_6
L13_13 = L13_13(L14_14)
if L13_13 == false then
  L13_13 = "Please request administrator to generate Client"
  L14_14 = " Configuration"
  L13_13 = L13_13 .. L14_14
  statusMessage = L13_13
  L13_13 = web
  L13_13 = L13_13.goToPage
  L14_14 = "OmniSSLPortalLogin"
  L15_15 = true
  L16_16 = true
  L13_13(L14_14, L15_15, L16_16)
else
  L13_13 = os
  L13_13 = L13_13.execute
  L14_14 = "cat "
  L15_15 = L6_6
  L16_16 = " >> /var/certs/openvpn/tmp.ovpn"
  L14_14 = L14_14 .. L15_15 .. L16_16
  L13_13(L14_14)
  L13_13 = "/var/certs/openvpn/"
  L14_14 = L2_2
  L15_15 = "_script.bat"
  L13_13 = L13_13 .. L14_14 .. L15_15
  L14_14 = ""
  L15_15 = L2_2
  L16_16 = "_script.bat"
  L14_14 = L14_14 .. L15_15 .. L16_16
  L15_15 = io
  L15_15 = L15_15.open
  L16_16 = L13_13
  L17_17 = "w"
  L15_15 = L15_15(L16_16, L17_17)
  L16_16 = os
  L16_16 = L16_16.execute
  L17_17 = "awk '{print \"REM1 \" $0;}' /var/certs/openvpn/tmp.ovpn "
  L18_18 = "> /var/certs/openvpn/temp.txt"
  L17_17 = L17_17 .. L18_18
  L16_16(L17_17)
  L16_16 = "cd %~dp0"
  L17_17 = [[

findstr /B "REM1" "%~nx0"]]
  L18_18 = " > \""
  L16_16 = L16_16 .. L17_17 .. L18_18 .. L2_2 .. "_config.ovpn\""
  L17_17 = ":ENDFILE"
  L18_18 = [[

set P2=.;%PATH%]]
  L17_17 = L17_17 .. L18_18 .. [[

for %%e in (%PATHEXT%) do @for %%i in (openvpn%%e) ]] .. "do @if NOT \"%%~$P2:i\"==\"\" copy " .. L2_2 .. "_config.ovpn \"%%~$P2:i\\..\\..\\config"
  L18_18 = "@echo off"
  L18_18 = L18_18 .. [[

setlocal enableextensions ]] .. "disabledelayedexpansion" .. "\n" .. [[

set "search=REM1 "]] .. [[

set "replace="]] .. "\n" .. [[

set "textFile=]] .. L2_2 .. "_config.ovpn\"" .. "\n" .. [[

for /f "delims=" %%i in ]] .. "('type \"%textFile%\" ^& break ^> " .. "\"%textFile%\" ') do (" .. [[

 set "line=%%i"]] .. [[

 setlocal enabledelayedexpansion]] .. [[

set "line=!line:%search%=%replace%!"]] .. [[

 >>"%textFile%" echo(!line!]] .. [[

endlocal]] .. [[

 )]] .. "\n" .. [[

GOTO :ENDFILE]]
  L15_15:write(L16_16)
  L15_15:write("\n")
  L15_15:write(L18_18)
  L15_15:write("\n")
  L15_15:close()
  os.execute("cat /var/certs/openvpn/temp.txt >>" .. L13_13 .. "")
  L15_15 = io.open(L13_13, "a+")
  L15_15:write(L17_17)
  L15_15:close()
  os.execute("rm -f /var/certs/openvpn/temp.txt")
  os.execute("rm -f /var/certs/openvpn/tmp.ovpn")
  web.download(L13_13, L14_14)
end
