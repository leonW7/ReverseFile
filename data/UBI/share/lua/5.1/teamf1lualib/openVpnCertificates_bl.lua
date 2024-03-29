local L0_0
L0_0 = module
L0_0("com.teamf1.bl.vpn.openVpnCertificates", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/openvpn_returnCodes")
L0_0 = require
L0_0("teamf1lualib/openVpnEasyrsa")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("openvpnLuaLib")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.vpn.openVpnEasyrsa")
TEMP_KEY_PATH = "/var/openvpn/easy-rsa/tempkeys/"
DEFAULT_SERVER_NAME = "server"
DEFAULT_CLIENT_NAME = "client"
;({}).subjectName = "SubjectName"
;({}).serverName = "ServerName"
;({}).clientName = "ClientName"
function easyrsaConfigParamGetAll()
  local L0_1, L1_2
  L0_1, easyrsaParamTable = _UPVALUE0_.easyrsaConfigGetAll()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return _UPVALUE1_.SUCCESS, easyrsaParamTable
end
function subjectParamLengthValidate(A0_3)
  if string.find(A0_3, "C=") and string.len(A0_3) ~= 4 then
    return _UPVALUE0_.C_LEN_EXCEEDED
  end
  if string.find(A0_3, "ST=") and string.len(A0_3) > 23 then
    return _UPVALUE0_.S_LEN_EXCEEDED
  end
  if string.find(A0_3, "L=") and string.len(A0_3) > 22 then
    return _UPVALUE0_.CITY_LEN_EXCEEDED
  end
  if string.find(A0_3, "O=") and string.len(A0_3) > 22 then
    return _UPVALUE0_.O_LEN_EXCEEDED
  end
  if string.find(A0_3, "OU=") and string.len(A0_3) > 23 then
    return _UPVALUE0_.OU_LEN_EXCEEDED
  end
  if string.find(A0_3, "CN=") and string.len(A0_3) > 35 then
    return _UPVALUE0_.CN_LEN_EXCEEDED
  end
  if string.find(A0_3, "E=") and string.len(A0_3) > 34 then
    return _UPVALUE0_.EMAIL_LEN_EXCEEDED
  end
  return _UPVALUE1_.SUCCESS
end
function easyrsaConfigParamCreate(A0_4)
  local L1_5, L2_6, L3_7, L4_8, L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22
  L1_5 = ACCESS_LEVEL
  if L1_5 ~= 0 then
    L1_5 = util
    L1_5 = L1_5.appendDebugOut
    L2_6 = "Detected Unauthorized access for page easyrsaConfig"
    L1_5(L2_6)
    L1_5 = _UPVALUE0_
    L1_5 = L1_5.UNAUTHORIZED
    return L1_5
  end
  L1_5, L2_6, L3_7, L4_8, L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L14_18 = db
  L14_18 = L14_18.getTable
  L14_18 = L14_18(L15_19)
  L13_17 = L14_18
  if L13_17 ~= nil then
    L14_18 = #L13_17
    if L14_18 == L15_19 then
      L14_18 = _UPVALUE2_
      L14_18 = L14_18.EASYRSA_MAX_LIMIT
      return L14_18
    end
  end
  L1_5 = A0_4["openvpnCertificates.countryName"]
  L2_6 = A0_4["openvpnCertificates.provinceName"]
  L3_7 = A0_4["openvpnCertificates.localityName"]
  L4_8 = A0_4["openvpnCertificates.organizationName"]
  L5_9 = A0_4["openvpnCertificates.orgUnitName"]
  L6_10 = A0_4["openvpnCertificates.commonName"]
  L7_11 = A0_4["openvpnCertificates.emailName"]
  L10_14 = A0_4["openvpnCertificates.clientName"]
  L14_18 = A0_4["openvpnCertificates.serverName"]
  serverName = L14_18
  L14_18 = _UPVALUE0_
  L14_18 = L14_18.NIL
  if L1_5 == L14_18 then
    L14_18 = util
    L14_18 = L14_18.appendDebugOut
    L14_18(L15_19)
    L14_18 = _UPVALUE2_
    L14_18 = L14_18.COUNTRY_NAME_MUST
    return L14_18
  else
    L14_18 = "C="
    L11_15 = L14_18 .. L15_19
  end
  L14_18 = _UPVALUE0_
  L14_18 = L14_18.NIL
  if L2_6 ~= L14_18 and L2_6 ~= "" then
    L14_18 = L11_15
    L11_15 = L14_18 .. L15_19 .. L16_20 .. L17_21
  end
  L14_18 = _UPVALUE0_
  L14_18 = L14_18.NIL
  if L3_7 ~= L14_18 and L3_7 ~= "" then
    L14_18 = L11_15
    L11_15 = L14_18 .. L15_19 .. L16_20 .. L17_21
  end
  L14_18 = _UPVALUE0_
  L14_18 = L14_18.NIL
  if L4_8 ~= L14_18 and L4_8 ~= "" then
    L14_18 = L11_15
    L11_15 = L14_18 .. L15_19 .. L16_20 .. L17_21
  end
  L14_18 = _UPVALUE0_
  L14_18 = L14_18.NIL
  if L5_9 ~= L14_18 and L5_9 ~= "" then
    L14_18 = L11_15
    L11_15 = L14_18 .. L15_19 .. L16_20 .. L17_21
  end
  L14_18 = _UPVALUE0_
  L14_18 = L14_18.NIL
  if L6_10 == L14_18 then
    L14_18 = util
    L14_18 = L14_18.appendDebugOut
    L14_18(L15_19)
    L14_18 = _UPVALUE2_
    L14_18 = L14_18.COMMON_NAME_MUST
    return L14_18
  else
    L14_18 = L11_15
    L11_15 = L14_18 .. L15_19 .. L16_20 .. L17_21
  end
  L14_18 = _UPVALUE0_
  L14_18 = L14_18.NIL
  if L7_11 ~= L14_18 and L7_11 ~= "" then
    L14_18 = L11_15
    L11_15 = L14_18 .. L15_19 .. L16_20 .. L17_21
  end
  L14_18 = serverName
  if L14_18 == L15_19 then
    L14_18 = util
    L14_18 = L14_18.appendDebugOut
    L14_18(L15_19)
    L14_18 = _UPVALUE0_
    L14_18 = L14_18.BAD_PARAMETER
    return L14_18
  end
  L14_18 = db
  L14_18 = L14_18.existsRow
  L14_18 = L14_18(L15_19, L16_20, L17_21)
  if L14_18 then
    L14_18 = _UPVALUE2_
    L14_18 = L14_18.SERVER_NAME_EXISTS
    return L14_18
  end
  L14_18 = _UPVALUE0_
  L14_18 = L14_18.NIL
  if L10_14 == L14_18 then
    L14_18 = util
    L14_18 = L14_18.appendDebugOut
    L14_18(L15_19)
    L14_18 = _UPVALUE0_
    L14_18 = L14_18.BAD_PARAMETER
    return L14_18
  end
  L14_18 = db
  L14_18 = L14_18.existsRow
  L14_18 = L14_18(L15_19, L16_20, L17_21)
  if L14_18 then
    L14_18 = _UPVALUE2_
    L14_18 = L14_18.CLIENT_NAME_EXISTS
    return L14_18
  end
  L14_18 = serverName
  if L14_18 == L10_14 then
    L14_18 = _UPVALUE2_
    L14_18 = L14_18.SERVER_CLIENT_SAME
    return L14_18
  end
  L14_18 = _UPVALUE0_
  L14_18 = L14_18.NIL
  if L11_15 == L14_18 then
    L14_18 = util
    L14_18 = L14_18.appendDebugOut
    L14_18(L15_19)
    L14_18 = _UPVALUE0_
    L14_18 = L14_18.BAD_PARAMETER
    return L14_18
  end
  L14_18 = string
  L14_18 = L14_18.find
  L14_18 = L14_18(L15_19, L16_20)
  if L14_18 == L15_19 then
    L14_18 = _UPVALUE2_
    L14_18 = L14_18.COMMON_NAME_MUST
    return L14_18
  end
  L14_18 = nil
  for L18_22 in L15_19(L16_20, L17_21) do
    if subjectParamLengthValidate(L18_22) ~= _UPVALUE0_.SUCCESS then
      return (subjectParamLengthValidate(L18_22))
    end
  end
  if L15_19 == L16_20 then
    return L16_20
  end
  L16_20()
  L18_22 = serverName
  L12_16 = L16_20
  if L12_16 == 0 then
    L16_20()
    L16_20()
    return L16_20
  elseif L12_16 == 1 then
    L18_22 = "openvpnEasyrsaCerts"
    L16_20(L17_21)
    L16_20()
    return L16_20
  elseif L12_16 == 2 then
    L16_20()
    L18_22 = "openvpnEasyrsaCerts"
    L16_20(L17_21)
    return L16_20
  end
end
function easyrsaConfigParamDelete(A0_23)
  local L1_24, L2_25, L3_26
  L3_26 = ACCESS_LEVEL
  if L3_26 ~= 0 then
    L3_26 = util
    L3_26 = L3_26.appendDebugOut
    L3_26("Detected Unauthorized access for easyrsaConfig PAGE")
    L3_26 = _UPVALUE0_
    L3_26 = L3_26.UNAUTHORIZED
    return L3_26
  end
  L1_24 = A0_23["openvpnCertificates.cookie"]
  L3_26 = _UPVALUE0_
  L3_26 = L3_26.NIL
  if L1_24 == L3_26 then
    L3_26 = util
    L3_26 = L3_26.appendDebugOut
    L3_26("Delete : Invalid Cookie")
    L3_26 = _UPVALUE0_
    L3_26 = L3_26.BAD_PARAMETER
    return L3_26
  end
  L3_26 = "_ROWID_="
  L3_26 = L3_26 .. A0_23["openvpnCertificates.cookie"]
  if db.getRowWhere("OpenVpnEasyrsaCert", L3_26, false) == nil then
    util.appendDebugOut("Unable to get configuration from db")
    return _UPVALUE0_.FAILURE
  end
  if db.getRowWhere("OpenVpnEasyrsaCert", L3_26, false)[_UPVALUE1_.clientName] ~= DEFAULT_CLIENT_NAME and db.getRowWhere("OpenVpnEasyrsaCert", L3_26, false)[_UPVALUE1_.serverName] ~= DEFAULT_SERVER_NAME then
    os.execute("/bin/rm -f " .. TEMP_KEY_PATH .. db.getRowWhere("OpenVpnEasyrsaCert", L3_26, false)[_UPVALUE1_.serverName] .. ".crt")
    os.execute("/bin/rm -f " .. TEMP_KEY_PATH .. db.getRowWhere("OpenVpnEasyrsaCert", L3_26, false)[_UPVALUE1_.serverName] .. ".key")
    os.execute("/bin/rm -f " .. TEMP_KEY_PATH .. db.getRowWhere("OpenVpnEasyrsaCert", L3_26, false)[_UPVALUE1_.serverName] .. ".csr")
    os.execute("/bin/rm -f " .. TEMP_KEY_PATH .. db.getRowWhere("OpenVpnEasyrsaCert", L3_26, false)[_UPVALUE1_.clientName] .. ".crt")
    os.execute("/bin/rm -f " .. TEMP_KEY_PATH .. db.getRowWhere("OpenVpnEasyrsaCert", L3_26, false)[_UPVALUE1_.clientName] .. ".key")
    os.execute("/bin/rm -f " .. TEMP_KEY_PATH .. db.getRowWhere("OpenVpnEasyrsaCert", L3_26, false)[_UPVALUE1_.clientName] .. ".csr")
  end
  _UPVALUE2_.start()
  L2_25 = _UPVALUE3_.easyrsaConfigDelete(L1_24)
  if L2_25 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in easyrsaConfig page " .. L2_25)
    _UPVALUE2_.abort()
    return L2_25
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return L2_25
end
function easyrsaConfigParamDeleteAll()
  local L0_27, L1_28, L2_29, L3_30, L4_31, L5_32, L6_33, L7_34, L8_35, L9_36, L10_37, L11_38
  L1_28 = ACCESS_LEVEL
  if L1_28 ~= 0 then
    L1_28 = util
    L1_28 = L1_28.appendDebugOut
    L1_28(L2_29)
    L1_28 = _UPVALUE0_
    L1_28 = L1_28.UNAUTHORIZED
    return L1_28
  end
  L1_28 = _UPVALUE1_
  L1_28 = L1_28.start
  L1_28()
  L1_28 = db
  L1_28 = L1_28.getTable
  L1_28 = L1_28(L2_29)
  if L1_28 == L2_29 then
    return L2_29
  end
  for L5_32, L6_33 in L2_29(L3_30) do
    for L10_37, L11_38 in L7_34(L8_35) do
      if L10_37 == "OpenVpnEasyrsaCert._ROWID_" and L11_38 ~= "1" then
        L0_27 = _UPVALUE2_.easyrsaConfigDelete(L11_38)
        if L0_27 ~= _UPVALUE0_.SUCCESS then
          util.appendDebugOut("Error in Delete Opetation in easyrsaConfig page " .. L0_27)
          _UPVALUE1_.abort()
          return L0_27
        end
      end
    end
  end
  L2_29()
  L2_29()
  return L2_29
end
function easyrsaCertsDownload(A0_39)
  local L1_40, L2_41, L3_42, L4_43, L5_44
  L3_42 = "/tmp/openVpnCerts.tar"
  L4_43 = "openVpnCerts.tar"
  L5_44 = ACCESS_LEVEL
  if L5_44 ~= 0 then
    L5_44 = util
    L5_44 = L5_44.appendDebugOut
    L5_44("Detected Unauthorized access for easyrsaConfig PAGE")
    L5_44 = _UPVALUE0_
    L5_44 = L5_44.UNAUTHORIZED
    return L5_44
  end
  L1_40 = A0_39["openvpnCertificates.cookie"]
  L5_44 = _UPVALUE0_
  L5_44 = L5_44.NIL
  if L1_40 == L5_44 then
    L5_44 = util
    L5_44 = L5_44.appendDebugOut
    L5_44("Delete : Invalid Cookie")
    L5_44 = _UPVALUE0_
    L5_44 = L5_44.BAD_PARAMETER
    return L5_44
  end
  L5_44 = "/pfrm2.0/var/www/openvpnCertsDownload.sh"
  os.execute("/bin/sh " .. L5_44 .. " " .. L1_40)
  web.download(L3_42, L4_43)
  os.execute("/bin/rm -rf " .. "/tmp/openVpnCerts/" .. "*")
  os.execute("/bin/rm -rf " .. "/tmp/openVpnCerts.tar")
end
function easyrsaCertsServerDefault(A0_45)
  local L1_46, L2_47, L3_48, L4_49, L5_50, L6_51, L7_52, L8_53
  L3_48 = "/tmp/openVpnCerts.tar"
  L4_49 = "openVpnCerts.tar"
  L5_50 = ACCESS_LEVEL
  if L5_50 ~= 0 then
    L5_50 = util
    L5_50 = L5_50.appendDebugOut
    L6_51 = "Detected Unauthorized access for easyrsaConfig PAGE"
    L5_50(L6_51)
    L5_50 = _UPVALUE0_
    L5_50 = L5_50.UNAUTHORIZED
    return L5_50
  end
  L1_46 = A0_45["openvpnCertificates.cookie"]
  L5_50 = _UPVALUE0_
  L5_50 = L5_50.NIL
  if L1_46 == L5_50 then
    L5_50 = util
    L5_50 = L5_50.appendDebugOut
    L6_51 = "Delete : Invalid Cookie"
    L5_50(L6_51)
    L5_50 = _UPVALUE0_
    L5_50 = L5_50.BAD_PARAMETER
    return L5_50
  end
  L5_50 = "/pfrm2.0/var/www/openvpnCertsServerDefault.sh"
  L6_51 = os
  L6_51 = L6_51.execute
  L7_52 = "/bin/sh "
  L8_53 = L5_50
  L7_52 = L7_52 .. L8_53 .. " " .. L1_46
  L6_51(L7_52)
  L6_51, L7_52 = nil, nil
  L8_53 = "autoupload"
  _UPVALUE1_.start()
  L6_51 = _UPVALUE2_.uploadCertsCreate(L8_53)
  if L6_51 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page openVpnAuthentication" .. L6_51)
    os.execute("rm" .. " /var/certs/ca.crt")
    os.execute("rm" .. " /var/certs/server.crt")
    os.execute("rm" .. " /var/certs/server.key")
    os.execute("rm" .. " /var/certs/dh.pem")
    _UPVALUE1_.abort()
    return L6_51, L1_46
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function easyrsaCertsClientDefault(A0_54)
  local L1_55, L2_56, L3_57, L4_58, L5_59, L6_60, L7_61, L8_62
  L3_57 = "/tmp/openVpnCerts.tar"
  L4_58 = "openVpnCerts.tar"
  L5_59 = ACCESS_LEVEL
  if L5_59 ~= 0 then
    L5_59 = util
    L5_59 = L5_59.appendDebugOut
    L6_60 = "Detected Unauthorized access for easyrsaConfig PAGE"
    L5_59(L6_60)
    L5_59 = _UPVALUE0_
    L5_59 = L5_59.UNAUTHORIZED
    return L5_59
  end
  L1_55 = A0_54["openvpnCertificates.cookie"]
  L5_59 = _UPVALUE0_
  L5_59 = L5_59.NIL
  if L1_55 == L5_59 then
    L5_59 = util
    L5_59 = L5_59.appendDebugOut
    L6_60 = "Delete : Invalid Cookie"
    L5_59(L6_60)
    L5_59 = _UPVALUE0_
    L5_59 = L5_59.BAD_PARAMETER
    return L5_59
  end
  L5_59 = "/pfrm2.0/var/www/openvpnCertsClientDefault.sh"
  L6_60 = os
  L6_60 = L6_60.execute
  L7_61 = "/bin/sh "
  L8_62 = L5_59
  L7_61 = L7_61 .. L8_62 .. " " .. L1_55
  L6_60(L7_61)
  L6_60, L7_61 = nil, nil
  L8_62 = "autoupload"
  _UPVALUE1_.start()
  L6_60 = _UPVALUE2_.uploadCertsCreate(L8_62)
  if L6_60 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page openVpnCertificate generation" .. L6_60)
    os.execute("rm" .. " /var/certs/ca.crt")
    os.execute("rm" .. " /var/certs/server.crt")
    os.execute("rm" .. " /var/certs/server.key")
    os.execute("rm" .. " /var/certs/dh.pem")
    _UPVALUE1_.abort()
    return L6_60, L1_55
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
