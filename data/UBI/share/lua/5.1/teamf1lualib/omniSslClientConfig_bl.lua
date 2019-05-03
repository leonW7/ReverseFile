local L0_0
L0_0 = "/var/openvpn/easy-rsa/keys/"
BUILD_KEY_PATH = L0_0
L0_0 = "/var/certs/openvpn/"
CLIENT_CONFIG_PATH = L0_0
L0_0 = 1
OK = L0_0
L0_0 = module
L0_0("com.teamf1.bl.vpn.omniSslClientConfig", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/openvpn_core")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/openvpn_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
else
end
function omniSSLClientConfigGet()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getTable
  L0_1 = L0_1("OpenvpnClientConfig", false)
  if L0_1 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_1
end
function omniSSLClientConfigSet(A0_2)
  local L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L12_14, L13_15, L14_16, L15_17, L16_18
  L1_3 = ACCESS_LEVEL
  if L1_3 ~= 0 then
    L1_3 = util
    L1_3 = L1_3.appendDebugOut
    L2_4 = "Detected Unauthorized access for page openVpnClientConfiguration"
    L1_3(L2_4)
    L1_3 = _UPVALUE0_
    L1_3 = L1_3.UNAUTHORIZED
    return L1_3
  end
  L1_3 = "ServerEnable = 1"
  L2_4 = db
  L2_4 = L2_4.getRowWhere
  L3_5 = "OpenVpn"
  L4_6 = L1_3
  L5_7 = false
  L2_4 = L2_4(L3_5, L4_6, L5_7)
  if L2_4 == nil then
    L3_5 = util
    L3_5 = L3_5.appendDebugOut
    L4_6 = "Openvpn: please enable the openvpn server"
    L3_5(L4_6)
    L3_5 = _UPVALUE1_
    L3_5 = L3_5.OPENVPN_SERVER_NOT_ENALBLED
    return L3_5
  end
  L3_5 = A0_2["OpenvpnClientConfig.clientName"]
  L4_6 = "UserName = '"
  L5_7 = L3_5
  L6_8 = "'"
  L4_6 = L4_6 .. L5_7 .. L6_8
  L5_7 = db
  L5_7 = L5_7.getRowWhere
  L6_8 = "Users"
  L5_7 = L5_7(L6_8, L7_9, L8_10)
  if L5_7 ~= nil then
    L6_8 = L5_7.GroupId
    L4_6 = L7_9 .. L8_10 .. L9_11
    L10_12 = false
    if L7_9 == nil then
      return L8_10
    end
  else
    L6_8 = _UPVALUE1_
    L6_8 = L6_8.USER_DOESNT_EXIST
    return L6_8
  end
  L6_8 = db
  L6_8 = L6_8.getTable
  L6_8 = L6_8(L7_9, L8_10)
  for L10_12, L11_13 in L7_9(L8_10) do
    L12_14 = L6_8[L10_12]
    L12_14 = L12_14.clientName
    if L12_14 == L3_5 then
      L12_14 = util
      L12_14 = L12_14.appendDebugOut
      L13_15 = "Already client configuration exists"
      L12_14(L13_15)
      L12_14 = _UPVALUE1_
      L12_14 = L12_14.CLIENT_ALREADY_EXIT
      return L12_14
    end
  end
  L10_12 = "1"
  L11_13 = "serverClientCertsName"
  L10_12 = "'"
  L10_12 = "OpenvpnAuthCertificates"
  L11_13 = L8_10
  if L9_11 == nil then
    L10_12 = util
    L10_12 = L10_12.appendDebugOut
    L11_13 = "Please upload CA cerifications before generating client configuration"
    L10_12(L11_13)
    L10_12 = _UPVALUE1_
    L10_12 = L10_12.CA_CERT_NOT_UPLOADED
    return L10_12
  end
  L10_12 = L9_11["OpenvpnAuthCertificates.caCertData"]
  L11_13 = {}
  L11_13.clientName = L3_5
  L11_13.caCert = L10_12
  L12_14 = os
  L12_14 = L12_14.execute
  L13_15 = "cp /var/certs/openvpn/ca.crt /var/openvpn/easy-rsa/keys/"
  L12_14(L13_15)
  L12_14 = "/bin/sh /pfrm2.0/bin/openvpnClient.sh "
  L13_15 = L3_5
  L14_16 = "> /dev/null 2>&1"
  L12_14 = L12_14 .. L13_15 .. L14_16
  L13_15 = os
  L13_15 = L13_15.execute
  L14_16 = L12_14
  L13_15(L14_16)
  L13_15 = "/var/openvpn/easy-rsa/keys/"
  L14_16 = L3_5
  L15_17 = ".key"
  L13_15 = L13_15 .. L14_16 .. L15_17
  L14_16 = util
  L14_16 = L14_16.fileExists
  L15_17 = L13_15
  L14_16 = L14_16(L15_17)
  if L14_16 then
    L14_16 = io
    L14_16 = L14_16.open
    L15_17 = L13_15
    L16_18 = "r"
    L14_16 = L14_16(L15_17, L16_18)
    L16_18 = L14_16
    L15_17 = L14_16.read
    L15_17 = L15_17(L16_18, "*all")
    L16_18 = L12_14.find
    L16_18 = L16_18(L15_17, "-----BEGIN PRIVATE KEY-----")
    if L16_18 ~= nil then
      L16_18 = L12_14.find
      L16_18 = L16_18(L15_17, "-----END PRIVATE KEY-----")
    elseif L16_18 == nil then
      L16_18 = L12_14.find
      L16_18 = L16_18(L15_17, "-----BEGIN RSA PRIVATE KEY-----")
      if L16_18 ~= nil then
        L16_18 = L12_14.find
        L16_18 = L16_18(L15_17, "-----END RSA PRIVATE KEY-----")
      elseif L16_18 == nil then
        L16_18 = L14_16.close
        L16_18(L14_16)
        L16_18 = os
        L16_18 = L16_18.execute
        L16_18("rm " .. "/var/openvpn/easy-rsa/keys/" .. L3_5 .. ".key")
        L16_18 = util
        L16_18 = L16_18.appendDebugOut
        L16_18("Please regenarate client configuration")
        L16_18 = _UPVALUE1_
        L16_18 = L16_18.REGEN_CLIENT_CONFIG
        return L16_18
      end
    end
    L11_13.clientKey = L15_17
    L16_18 = L14_16.close
    L16_18(L14_16)
  else
    L14_16 = util
    L14_16 = L14_16.appendDebugOut
    L15_17 = "Please regenarate client configuration"
    L14_16(L15_17)
    L14_16 = _UPVALUE1_
    L14_16 = L14_16.REGEN_CLIENT_CONFIG
    return L14_16
  end
  L14_16 = "/var/openvpn/easy-rsa/keys/"
  L15_17 = L3_5
  L16_18 = ".crt"
  L14_16 = L14_16 .. L15_17 .. L16_18
  L15_17 = util
  L15_17 = L15_17.fileExists
  L16_18 = L14_16
  L15_17 = L15_17(L16_18)
  if L15_17 then
    L15_17 = io
    L15_17 = L15_17.open
    L16_18 = L14_16
    L15_17 = L15_17(L16_18, "r")
    L16_18 = L15_17.read
    L16_18 = L16_18(L15_17, "*all")
    if L12_14.find(L16_18, "-----BEGIN CERTIFICATE-----") == nil or L12_14.find(L16_18, "-----END CERTIFICATE-----") == nil then
      L15_17:close()
      os.execute("rm " .. "/var/openvpn/easy-rsa/keys/" .. L3_5 .. ".key")
      util.appendDebugOut("Please regenarate client configuration")
      return _UPVALUE1_.REGEN_CLIENT_CONFIG
    end
    L11_13.clientCert = L16_18
    L15_17:close()
  else
    L15_17 = util
    L15_17 = L15_17.appendDebugOut
    L16_18 = "Please regenarate client configuration"
    L15_17(L16_18)
    L15_17 = _UPVALUE1_
    L15_17 = L15_17.REGEN_CLIENT_CONFIG
    return L15_17
  end
  L15_17 = openVpnClientcfgAdd
  L16_18 = L11_13
  L16_18 = L15_17(L16_18)
  if L15_17 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Client configuration inserting into db is failed")
    return L15_17
  end
  os.execute("cp -rf /var/openvpn/easy-rsa /flash/")
  db.save()
  return _UPVALUE0_.SUCCESS
end
function openvpnClientconfig(A0_19, A1_20, A2_21)
  if A2_21 == "add" then
    return db.insert("OpenvpnClientConfig", A0_19)
  elseif A2_21 == "edit" then
    return db.update("OpenvpnClientConfig", A0_19, A1_20)
  elseif A2_21 == "delete" then
    return db.delete("OpenvpnClientConfig", A0_19)
  end
end
function openVpnClientcfgAdd(A0_22)
  local L1_23, L2_24, L3_25
  if db.getTable("OpenvpnClientConfig", false) ~= nil and #db.getTable("OpenvpnClientConfig", false) >= _UPVALUE0_ then
    return _UPVALUE1_.MAX_LIMIT_REACHED
  end
  A0_22 = util.addPrefix(A0_22, "OpenvpnClientConfig.")
  L1_23, L2_24, L3_25 = openvpnClientconfig(A0_22, -1, "add")
  if not L1_23 then
    if L2_24 then
      util.appendDebugOut("Client configuration failed to add in db")
    end
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS
end
function uploadSectionSet(A0_26)
  local L1_27, L2_28, L3_29, L4_30
  L1_27 = ACCESS_LEVEL
  if L1_27 ~= 0 then
    L1_27 = util
    L1_27 = L1_27.appendDebugOut
    L2_28 = "Detected Unauthorized access for page openVpnClientConfiguration"
    L1_27(L2_28)
    L1_27 = _UPVALUE0_
    L1_27 = L1_27.UNAUTHORIZED
    return L1_27
  end
  if A0_26 == nil then
    L1_27 = util
    L1_27 = L1_27.appendDebugOut
    L2_28 = "GetNext : Invalid Cookie"
    L1_27(L2_28)
    L1_27 = _UPVALUE0_
    L1_27 = L1_27.BAD_PARAMETER
    return L1_27
  end
  L1_27, L2_28 = nil, nil
  L3_29 = "/var/certs/openvpn/ca.key"
  L4_30 = os
  L4_30 = L4_30.execute
  L4_30("mv /tmp/" .. A0_26 .. " " .. L3_29)
  L4_30 = util
  L4_30 = L4_30.fileToString
  L4_30 = L4_30("/var/certs/openvpn/ca.key")
  if (string.find(L4_30, "-----BEGIN PRIVATE KEY-----") == nil or string.find(L4_30, "-----END PRIVATE KEY-----") == nil) and (string.find(L4_30, "-----BEGIN RSA PRIVATE KEY-----") == nil or string.find(L4_30, "-----END RSA PRIVATE KEY-----") == nil) then
    os.execute("rm" .. "/var/certs/openvpn/ca.key")
    return _UPVALUE1_.INVALID_CAKEY
  end
  os.execute("cp /var/certs/openvpn/ca.key /var/openvpn/easy-rsa/keys/ca.key")
  return _UPVALUE0_.SUCCESS
end
function omniSslConfigurationDelete(A0_31)
  local L1_32, L2_33, L3_34, L4_35
  L1_32 = ACCESS_LEVEL
  if L1_32 ~= 0 then
    L1_32 = util
    L1_32 = L1_32.appendDebugOut
    L2_33 = "Detected Unauthorized access for page openvpnclientConfiguration"
    L1_32(L2_33)
    L1_32 = _UPVALUE0_
    L1_32 = L1_32.UNAUTHORIZED
    return L1_32
  end
  L1_32 = A0_31["omniSslConfiguration.cookie"]
  if L1_32 == nil then
    L2_33 = util
    L2_33 = L2_33.appendDebugOut
    L3_34 = "Delete : Invalid Cookie"
    L2_33(L3_34)
    L2_33 = _UPVALUE0_
    L2_33 = L2_33.BAD_PARAMETER
    return L2_33
  end
  L2_33 = "_ROWID_="
  L3_34 = A0_31["omniSslConfiguration.cookie"]
  L2_33 = L2_33 .. L3_34
  L3_34 = db
  L3_34 = L3_34.getRowWhere
  L4_35 = "OpenvpnClientConfig"
  L3_34 = L3_34(L4_35, L2_33, false)
  if L3_34 == nil then
    L4_35 = util
    L4_35 = L4_35.appendDebugOut
    L4_35("Unable to get configuration from db")
    L4_35 = _UPVALUE0_
    L4_35 = L4_35.FAILURE
    return L4_35
  end
  L4_35 = L3_34.clientName
  if L4_35 ~= "client" then
    L4_35 = "/bin/sh /pfrm2.0/bin/openvpnClientDelete.sh "
    L4_35 = L4_35 .. L3_34.clientName .. "> /dev/null 2>&1"
    os.execute(L4_35)
    os.execute("rm -f " .. BUILD_KEY_PATH .. L3_34.clientName .. ".crt")
    os.execute("rm -f " .. BUILD_KEY_PATH .. L3_34.clientName .. ".key")
    os.execute("rm -f " .. BUILD_KEY_PATH .. L3_34.clientName .. ".csr")
    os.execute("rm -f " .. BUILD_KEY_PATH .. L3_34.clientName .. ".ovpn")
    os.execute("rm -f " .. CLIENT_CONFIG_PATH .. L3_34.clientName .. ".crt")
    os.execute("rm -f " .. CLIENT_CONFIG_PATH .. L3_34.clientName .. ".key")
    os.execute("rm -f " .. CLIENT_CONFIG_PATH .. L3_34.clientName .. ".csr")
    os.execute("rm -f " .. CLIENT_CONFIG_PATH .. L3_34.clientName .. ".ovpn")
    if db.deleteRowWhere("OpenvpnClientConfig", L2_33) ~= OK then
      util.appendDebugOut("Unable to delete client configuration from db")
      return _UPVALUE0_.FAILURE
    end
  else
    L4_35 = _UPVALUE1_
    L4_35 = L4_35.DEF_OMNISSL_CLIENT_CANNOT_DEL
    return L4_35
  end
  L4_35 = os
  L4_35 = L4_35.execute
  L4_35("/bin/rm -rf /flash/easy-rsa")
  L4_35 = os
  L4_35 = L4_35.execute
  L4_35("/bin/cp -rf /var/openvpn/easy-rsa /flash/")
  L4_35 = db
  L4_35 = L4_35.save
  L4_35()
  L4_35 = _UPVALUE0_
  L4_35 = L4_35.SUCCESS
  return L4_35, cookie
end
function omniSslConfigurationDeleteAll()
  local L0_36, L1_37, L2_38, L3_39, L4_40, L5_41, L6_42
  L0_36 = ACCESS_LEVEL
  if L0_36 ~= 0 then
    L0_36 = util
    L0_36 = L0_36.appendDebugOut
    L0_36(L1_37)
    L0_36 = _UPVALUE0_
    L0_36 = L0_36.UNAUTHORIZED
    return L0_36
  end
  L0_36 = db
  L0_36 = L0_36.getTable
  L0_36 = L0_36(L1_37, L2_38)
  for L4_40, L5_41 in L1_37(L2_38) do
    L6_42 = L0_36[L4_40]
    L6_42 = L6_42.clientName
    if L6_42 ~= "client" then
      L6_42 = "/bin/sh /pfrm2.0/bin/openvpnClientDelete.sh "
      L6_42 = L6_42 .. L0_36[L4_40].clientName
      os.execute(L6_42)
      os.execute("rm -f " .. BUILD_KEY_PATH .. L0_36[L4_40].clientName .. ".crt")
      os.execute("rm -f " .. BUILD_KEY_PATH .. L0_36[L4_40].clientName .. ".key")
      os.execute("rm -f " .. BUILD_KEY_PATH .. L0_36[L4_40].clientName .. ".csr")
      os.execute("rm -f " .. BUILD_KEY_PATH .. L0_36[L4_40].clientName .. ".ovpn")
      os.execute("rm -f " .. CLIENT_CONFIG_PATH .. L0_36[L4_40].clientName .. ".crt")
      os.execute("rm -f " .. CLIENT_CONFIG_PATH .. L0_36[L4_40].clientName .. ".key")
      os.execute("rm -f " .. CLIENT_CONFIG_PATH .. L0_36[L4_40].clientName .. ".csr")
      os.execute("rm -f " .. CLIENT_CONFIG_PATH .. L0_36[L4_40].clientName .. ".ovpn")
    end
  end
  tablename = L2_38
  tableData = L2_38
  if L2_38 == nil then
    return L2_38
  end
  for L5_41, L6_42 in L2_38(L3_39) do
    keyname = "_ROWID_"
    keyvalue = L6_42._ROWID_
    if keyvalue ~= "1" then
      if L1_37 == nil then
        return nil
      end
    end
  end
  L2_38(L3_39)
  L2_38(L3_39)
  L2_38()
  return L2_38
end
function omniSslConfigurationDeltails(A0_43)
  local L1_44, L2_45, L3_46
  if A0_43 == nil then
    L1_44 = util
    L1_44 = L1_44.appendDebugOut
    L2_45 = "Delete : Invalid Cookie"
    L1_44(L2_45)
    L1_44 = _UPVALUE0_
    L1_44 = L1_44.BAD_PARAMETER
    return L1_44
  end
  L1_44 = "_ROWID_="
  L2_45 = A0_43
  L1_44 = L1_44 .. L2_45
  L2_45 = db
  L2_45 = L2_45.getRowWhere
  L3_46 = "OpenvpnClientConfig"
  L2_45 = L2_45(L3_46, L1_44, false)
  if L2_45 == nil then
    L3_46 = util
    L3_46 = L3_46.appendDebugOut
    L3_46("Unable to get configuration from db")
    L3_46 = _UPVALUE0_
    L3_46 = L3_46.FAILURE
    return L3_46
  end
  L3_46 = "/var/certs/openvpn/"
  L3_46 = L3_46 .. L2_45.clientName .. ".ovpn"
  if util.fileExists(L3_46) then
    io.open(L3_46):close()
    L2_45.clientConfig = io.open(L3_46):read("*a")
  else
    util.appendDebugOut("Please regenarate client configuration")
    return _UPVALUE1_.REGEN_CLIENT_CONFIG
  end
  return _UPVALUE0_.SUCCESS, L2_45
end
