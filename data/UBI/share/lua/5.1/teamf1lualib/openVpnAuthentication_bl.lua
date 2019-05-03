local L0_0
L0_0 = module
L0_0("com.teamf1.bl.vpn.openvpnAuth", package.seeall)
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
L0_0("teamf1lualib/omniSslClientConfig_bl")
L0_0 = require
L0_0("teamf1lualib/openvpn_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
else
end
function uploadSectionGet(A0_1)
  local L1_2
  L1_2 = false
  L1_2 = _UPVALUE0_.uploadStatusGet(A0_1)
  return L1_2
end
function uploadSectionSet(A0_3, A1_4)
  local L2_5, L3_6, L4_7
  L2_5 = ACCESS_LEVEL
  if L2_5 ~= 0 then
    L2_5 = util
    L2_5 = L2_5.appendDebugOut
    L3_6 = "Detected Unauthorized access for page openVpnAuthentication"
    L2_5(L3_6)
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.UNAUTHORIZED
    return L2_5
  end
  if A0_3 == nil or A1_4 == nil then
    L2_5 = util
    L2_5 = L2_5.appendDebugOut
    L3_6 = "GetNext : Invalid Cookie"
    L2_5(L3_6)
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.BAD_PARAMETER
    return L2_5
  end
  L2_5, L3_6 = nil, nil
  L4_7 = _UPVALUE1_
  L4_7 = L4_7.start
  L4_7()
  L4_7 = "/var/certs/"
  L2_5 = _UPVALUE2_.uploadSet(A0_3, A1_4, L4_7)
  if L2_5 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page openVpnAuthentication" .. L2_5)
    _UPVALUE1_.abort()
    return L2_5, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L3_6
end
function openvpnAuthConfigCreate(A0_8)
  local L1_9, L2_10, L3_11, L4_12
  L1_9 = ACCESS_LEVEL
  if L1_9 ~= 0 then
    L1_9 = "Detected Unauthorized access for page "
    L2_10 = "openVpnAuthentication"
    L1_9 = L1_9 .. L2_10
    L2_10 = util
    L2_10 = L2_10.appendDebugOut
    L2_10(L3_11)
    L2_10 = _UPVALUE0_
    L2_10 = L2_10.UNAUTHORIZED
    return L2_10
  end
  L1_9 = A0_8["serverClientCertificate.certificateName"]
  L2_10 = db
  L2_10 = L2_10.getTable
  L2_10 = L2_10(L3_11, L4_12)
  if L2_10 ~= nil then
    if L3_11 >= L4_12 then
      return L3_11
    end
  end
  for _FORV_6_, _FORV_7_ in L3_11(L4_12) do
    if L2_10[_FORV_6_].name == L1_9 then
      util.appendDebugOut("Already name configuration exists")
      return _UPVALUE2_.CERT_NAME_ALREADY_EXIT
    end
  end
  if L1_9 == nil then
    L3_11(L4_12)
    return L3_11
  end
  _UPVALUE3_.start()
  if L3_11 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page openVpnAuthentication" .. L3_11)
    os.execute("rm" .. " /var/certs/ca.crt")
    os.execute("rm" .. " /var/certs/server.crt")
    os.execute("rm" .. " /var/certs/server.key")
    os.execute("rm" .. " /var/certs/dh.pem")
    _UPVALUE3_.abort()
    return L3_11, curCookie
  end
  _UPVALUE3_.complete()
  _UPVALUE3_.save()
  return _UPVALUE0_.SUCCESS, L4_12
end
function uploadCertsSectionSet(A0_13, A1_14)
  local L2_15, L3_16, L4_17, L5_18, L6_19
  L2_15 = ACCESS_LEVEL
  if L2_15 ~= 0 then
    L2_15 = util
    L2_15 = L2_15.appendDebugOut
    L3_16 = "Detected Unauthorized access for page openVpnAuthentication"
    L2_15(L3_16)
    L2_15 = _UPVALUE0_
    L2_15 = L2_15.UNAUTHORIZED
    return L2_15
  end
  L2_15 = cgilua
  L2_15 = L2_15.cookies
  L2_15 = L2_15.get
  L3_16 = "TeamF1Login"
  L2_15 = L2_15(L3_16)
  L3_16 = nil
  if A0_13 == "ta" then
    L3_16 = A1_14["tlsCertificates.certificateName"]
    L4_17 = db
    L4_17 = L4_17.getTable
    L4_17 = L4_17(L5_18, L6_19)
    if L4_17 ~= nil then
      if L5_18 >= L6_19 then
        return L5_18
      end
    end
    for _FORV_8_, _FORV_9_ in L5_18(L6_19) do
      if L4_17[_FORV_8_].name == L3_16 then
        util.appendDebugOut("Already name configuration exists")
        return _UPVALUE2_.CERT_NAME_ALREADY_EXIT
      end
    end
  elseif A0_13 == "crl" then
    L3_16 = A1_14["crlCertificates.crlCertificateName"]
    L4_17 = db
    L4_17 = L4_17.getTable
    L4_17 = L4_17(L5_18, L6_19)
    if L4_17 ~= nil then
      if L5_18 >= L6_19 then
        return L5_18
      end
    end
    for _FORV_8_, _FORV_9_ in L5_18(L6_19) do
      if L4_17[_FORV_8_].name == L3_16 then
        util.appendDebugOut("Already name configuration exists")
        return _UPVALUE2_.CERT_NAME_ALREADY_EXIT
      end
    end
  end
  if A0_13 == nil or L2_15 == nil then
    L4_17 = util
    L4_17 = L4_17.appendDebugOut
    L4_17(L5_18)
    L4_17 = _UPVALUE0_
    L4_17 = L4_17.BAD_PARAMETER
    return L4_17
  end
  L4_17 = nil
  L6_19()
  L4_17 = _UPVALUE4_.uploadTlsCrlSet(A0_13, L2_15, L6_19, L3_16)
  if L4_17 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page openVpnAuthentication" .. L4_17)
    _UPVALUE3_.abort()
    return L4_17, curCookie
  end
  _UPVALUE3_.complete()
  _UPVALUE3_.save()
  return _UPVALUE0_.SUCCESS, L5_18
end
function uploadTlsSectionGet()
  local L0_20, L1_21
  L0_20, L1_21 = _UPVALUE0_.openvpnTlsSectionGet()
  if L0_20 ~= _UPVALUE1_.SUCCESS then
    return L0_20
  end
  return _UPVALUE1_.SUCCESS, L1_21
end
function uploadCrlSectionGet()
  local L0_22, L1_23
  L0_22, L1_23 = _UPVALUE0_.openvpnCrlSectionGet()
  if L0_22 ~= _UPVALUE1_.SUCCESS then
    return L0_22
  end
  return _UPVALUE1_.SUCCESS, L1_23
end
function openvpnAuthConfigParamGet()
  local L0_24, L1_25
  L0_24, L1_25 = _UPVALUE0_.openvpnAuthConfigGet()
  if L0_24 ~= _UPVALUE1_.SUCCESS then
    return L0_24
  end
  return _UPVALUE1_.SUCCESS, L1_25
end
function tlsCertsDelete(A0_26)
  local L1_27, L2_28, L3_29, L4_30
  L3_29 = {}
  L4_30 = ACCESS_LEVEL
  if L4_30 ~= 0 then
    L4_30 = util
    L4_30 = L4_30.appendDebugOut
    L4_30("Detected Unauthorized access for easyrsaConfig PAGE")
    L4_30 = _UPVALUE0_
    L4_30 = L4_30.UNAUTHORIZED
    return L4_30
  end
  L1_27 = A0_26["tlsCertificates.cookie"]
  L4_30 = _UPVALUE0_
  L4_30 = L4_30.NIL
  if L1_27 == L4_30 then
    L4_30 = util
    L4_30 = L4_30.appendDebugOut
    L4_30("Delete : Invalid Cookie")
    L4_30 = _UPVALUE0_
    L4_30 = L4_30.BAD_PARAMETER
    return L4_30
  end
  L4_30 = "_ROWID_="
  L4_30 = L4_30 .. A0_26["tlsCertificates.cookie"]
  if db.getRowWhere("OpenvpnTlsCertificates", L4_30, false) == nil then
    util.appendDebugOut("Unable to get configuration from db")
    return _UPVALUE0_.FAILURE
  end
  if db.getRowWhere("OpenvpnTlsCertificates", L4_30, false).name == db.getAttribute("OpenVpn", "_ROWID_", "1", "TlsCertsName") and db.getAttribute("OpenVpn", "_ROWID_", "1", "TlsEnabled") == "1" then
    util.appendDebugOut("Selected certificate can not be deleted using this cert in Server/Client")
    return _UPVALUE1_.OPENVPNDELCERT
  end
  _UPVALUE2_.start()
  L2_28 = _UPVALUE3_.tlsCertificatesDelete(L1_27)
  if L2_28 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in easyrsaConfig page " .. L2_28)
    _UPVALUE2_.abort()
    return L2_28
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return L2_28
end
function tlsCertsDeleteAll()
  local L0_31, L1_32, L2_33, L3_34
  L0_31 = ACCESS_LEVEL
  if L0_31 ~= 0 then
    L0_31 = util
    L0_31 = L0_31.appendDebugOut
    L1_32 = "Detected Unauthorized access for page TLSKey"
    L0_31(L1_32)
    L0_31 = _UPVALUE0_
    L0_31 = L0_31.UNAUTHORIZED
    return L0_31
  end
  L0_31 = nil
  L1_32 = db
  L1_32 = L1_32.getAttribute
  L2_33 = "OpenVpn"
  L3_34 = "_ROWID_"
  L1_32 = L1_32(L2_33, L3_34, "1", "TlsCertsName")
  L2_33 = db
  L2_33 = L2_33.getAttribute
  L3_34 = "OpenVpn"
  L2_33 = L2_33(L3_34, "_ROWID_", "1", "TlsEnabled")
  L3_34 = db
  L3_34 = L3_34.getTable
  L3_34 = L3_34("OpenvpnTlsCertificates", false)
  for _FORV_7_, _FORV_8_ in pairs(L3_34) do
    if L3_34[_FORV_7_].name == L1_32 and L2_33 == "1" then
      util.appendDebugOut("Selected certificate can not be deleted using this cert in Server/Client")
      return _UPVALUE1_.OPENVPNDELCERT
    end
  end
  _UPVALUE2_.start()
  L0_31 = _UPVALUE3_.tlsCertificatesDeleteAll()
  if L0_31 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page openVpnRemoteNetworks" .. L0_31)
    _UPVALUE2_.abort()
    return L0_31
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return _UPVALUE0_.SUCCESS
end
function crlCertsDelete(A0_35)
  local L1_36, L2_37, L3_38
  L3_38 = ACCESS_LEVEL
  if L3_38 ~= 0 then
    L3_38 = util
    L3_38 = L3_38.appendDebugOut
    L3_38("Detected Unauthorized access for crlcerts PAGE")
    L3_38 = _UPVALUE0_
    L3_38 = L3_38.UNAUTHORIZED
    return L3_38
  end
  L1_36 = A0_35["OpenvpnCrlCertificates.cookie"]
  L3_38 = _UPVALUE0_
  L3_38 = L3_38.NIL
  if L1_36 == L3_38 then
    L3_38 = util
    L3_38 = L3_38.appendDebugOut
    L3_38("Delete : Invalid Cookie")
    L3_38 = _UPVALUE0_
    L3_38 = L3_38.BAD_PARAMETER
    return L3_38
  end
  L3_38 = "_ROWID_="
  L3_38 = L3_38 .. A0_35["OpenvpnCrlCertificates.cookie"]
  if db.getRowWhere("OpenvpnCrlCertificates", L3_38, false) == nil then
    util.appendDebugOut("Unable to get configuration from db")
    return _UPVALUE0_.FAILURE
  end
  if db.getRowWhere("OpenvpnCrlCertificates", L3_38, false).name == db.getAttribute("OpenVpn", "_ROWID_", "1", "CrlCertsName") and db.getAttribute("OpenVpn", "_ROWID_", "1", "BlockCertWithCRL") == "1" then
    util.appendDebugOut("Selected certificate can not be deleted using this cert in Server/Client")
    return _UPVALUE1_.OPENVPNDELCERT
  end
  _UPVALUE2_.start()
  L2_37 = _UPVALUE3_.crlCertificatesDelete(L1_36)
  if L2_37 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in easyrsaConfig page " .. L2_37)
    _UPVALUE2_.abort()
    return L2_37
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return L2_37
end
function crlCertsDeleteAll()
  local L0_39, L1_40, L2_41, L3_42
  L0_39 = ACCESS_LEVEL
  if L0_39 ~= 0 then
    L0_39 = util
    L0_39 = L0_39.appendDebugOut
    L1_40 = "Detected Unauthorized access for page crlcerts"
    L0_39(L1_40)
    L0_39 = _UPVALUE0_
    L0_39 = L0_39.UNAUTHORIZED
    return L0_39
  end
  L0_39 = nil
  L1_40 = db
  L1_40 = L1_40.getAttribute
  L2_41 = "OpenVpn"
  L3_42 = "_ROWID_"
  L1_40 = L1_40(L2_41, L3_42, "1", "CrlCertsName")
  L2_41 = db
  L2_41 = L2_41.getAttribute
  L3_42 = "OpenVpn"
  L2_41 = L2_41(L3_42, "_ROWID_", "1", "BlockCertWithCRL")
  L3_42 = db
  L3_42 = L3_42.getTable
  L3_42 = L3_42("OpenvpnCrlCertificates", false)
  for _FORV_7_, _FORV_8_ in pairs(L3_42) do
    if L3_42[_FORV_7_].name == L1_40 and L2_41 == "1" then
      util.appendDebugOut("Selected certificate can not be deleted using this cert in Server/Client")
      return _UPVALUE1_.OPENVPNDELCERT
    end
  end
  _UPVALUE2_.start()
  L0_39 = _UPVALUE3_.crlCertificatesDeleteAll()
  if L0_39 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page crlcertificates" .. L0_39)
    _UPVALUE2_.abort()
    return L0_39
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return _UPVALUE0_.SUCCESS
end
function OpenvpnCertsDelete(A0_43)
  local L1_44, L2_45, L3_46
  L3_46 = ACCESS_LEVEL
  if L3_46 ~= 0 then
    L3_46 = util
    L3_46 = L3_46.appendDebugOut
    L3_46("Detected Unauthorized access for Config PAGE")
    L3_46 = _UPVALUE0_
    L3_46 = L3_46.UNAUTHORIZED
    return L3_46
  end
  L1_44 = A0_43["serverClientCertificate.cookie"]
  L3_46 = _UPVALUE0_
  L3_46 = L3_46.NIL
  if L1_44 == L3_46 then
    L3_46 = util
    L3_46 = L3_46.appendDebugOut
    L3_46("Delete : Invalid Cookie")
    L3_46 = _UPVALUE0_
    L3_46 = L3_46.BAD_PARAMETER
    return L3_46
  end
  L3_46 = "_ROWID_="
  L3_46 = L3_46 .. A0_43["serverClientCertificate.cookie"]
  if db.getRowWhere("OpenvpnAuthCertificates", L3_46, false) == nil then
    util.appendDebugOut("Unable to get configuration from db")
    return _UPVALUE0_.FAILURE
  end
  if db.getRowWhere("OpenvpnAuthCertificates", L3_46, false).name == db.getAttribute("OpenVpn", "_ROWID_", "1", "serverClientCertsName") and db.getRowWhere("OpenvpnAuthCertificates", L3_46, false).name ~= "default" then
    util.appendDebugOut("Selected certificate can not be deleted using this cert in Server/Client")
    return _UPVALUE1_.OPENVPNDELCERT
  end
  _UPVALUE2_.start()
  L2_45 = _UPVALUE3_.authCertsDelete(L1_44)
  if L2_45 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in Server/Client Certificate page " .. L2_45)
    _UPVALUE2_.abort()
    return L2_45
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return L2_45
end
function OpenvpnCertsDeleteAll()
  local L0_47, L1_48
  L1_48 = ACCESS_LEVEL
  if L1_48 ~= 0 then
    L1_48 = util
    L1_48 = L1_48.appendDebugOut
    L1_48("Detected Unauthorized access for Server/Client Certificate PAGE")
    L1_48 = _UPVALUE0_
    L1_48 = L1_48.UNAUTHORIZED
    return L1_48
  end
  L1_48 = db
  L1_48 = L1_48.getTable
  L1_48 = L1_48("OpenvpnAuthCertificates", false)
  if L1_48 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  _UPVALUE1_.start()
  for _FORV_6_, _FORV_7_ in pairs(L1_48) do
    if L1_48[_FORV_6_].name == db.getAttribute("OpenVpn", "_ROWID_", "1", "serverClientCertsName") and L1_48[_FORV_6_].name ~= "default" then
      util.appendDebugOut("Selected certificate can not be deleted using this cert in Server/Client")
      return _UPVALUE2_.OPENVPNDELCERT
    end
    if L1_48[_FORV_6_]._ROWID_ ~= "1" then
      L0_47 = _UPVALUE3_.authCertsDelete(L1_48[_FORV_6_]._ROWID_)
      if L0_47 ~= _UPVALUE0_.SUCCESS then
        util.appendDebugOut("Error in Delete Opetation in Server/Client Certificate page " .. L0_47)
        _UPVALUE1_.abort()
        return L0_47
      end
    end
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
