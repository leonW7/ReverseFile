local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("x509Lib")
L0_0 = require
L0_0("teamf1lualib/validations_cli")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/login")
L0_0 = require
L0_0("loginLib")
L0_0 = require
L0_0("teamf1lualib/external_auth")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
openvpn = {}
openvpnRoutes = {}
openvpnGwRoutes = {}
openvpnCerts = {}
OpenVpnConfigPolicy = {}
OpenvpnClientConfig = {}
EXT_SERVER_DEF_IDLE_TIMEOUT = 10
EXT_SERVER_ID_RADIUS = 10
EXT_SERVER_ID_LDAP = 20
EXT_SERVER_ID_AD = 30
EXT_SERVER_ID_NTDOMAIN = 40
EXT_SERVER_ID_POP3 = 50
function openvpn.config(A0_1, A1_2, A2_3)
  if db.typeAndRangeValidate(A0_1) then
    if A2_3 == "add" then
      return db.insert("OpenVpn", A0_1)
    elseif A2_3 == "edit" then
      return db.update("OpenVpn", A0_1, A1_2)
    elseif A2_3 == "delete" then
      return db.deleteRow("OpenVpn", "_ROWID_", A0_1["OpenVpn._ROWID_"])
    end
  end
  return false
end
function openvpnRoutes.config(A0_4, A1_5, A2_6, A3_7)
  if db.typeAndRangeValidate(A0_4) then
    if A3_7 == "add" then
      return db.insert(A1_5, A0_4)
    elseif A3_7 == "edit" then
      return db.update(A1_5, A0_4, A2_6)
    elseif A3_7 == "delete" then
      if A1_5 == "OpenVpnLanRoutes" then
        return db.deleteRow("OpenVpnLanRoutes", "_ROWID_", A0_4["OpenVpnLanRoutes._ROWID_"])
      else
        return db.deleteRow("OpenVpnGwRoutes", "_ROWID_", A0_4["OpenVpnGwRoutes._ROWID_"])
      end
    end
  end
  return false
end
function openvpnRoutes.addSet(A0_8, A1_9)
  local L2_10, L3_11, L4_12
  L2_10 = false
  L3_11 = "10783"
  L4_12 = {}
  db.beginTransaction()
  if A1_9 == nil then
    L4_12["OpenVpnLanRoutes.Network"] = A0_8["OpenVpnLanRoutes.Network"]
    L4_12["OpenVpnLanRoutes.Netmask"] = A0_8["OpenVpnLanRoutes.Netmask"]
    L2_10 = openvpnRoutes.config(L4_12, "OpenVpnLanRoutes", "-1", "add")
  else
    L4_12["OpenVpnGwRoutes.CommonName"] = A0_8["OpenVpnGwRoutes.CommonName"]
    L4_12["OpenVpnGwRoutes.Network"] = A0_8["OpenVpnGwRoutes.Network"]
    L4_12["OpenVpnGwRoutes.Netmask"] = A0_8["OpenVpnGwRoutes.Netmask"]
    L2_10 = openvpnRoutes.config(L4_12, "OpenVpnGwRoutes", "-1", "add")
  end
  if L2_10 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", L3_11
  end
end
function openvpnRoutes.editSet(A0_13, A1_14, A2_15)
  local L3_16, L4_17, L5_18
  L3_16 = false
  L4_17 = "10789"
  L5_18 = nil
  db.beginTransaction()
  if A2_15 == nil then
    L5_18 = db.getRow("OpenVpnLanRoutes", "_ROWID_", A1_14)
    L5_18["OpenVpnLanRoutes.Network"] = A0_13["OpenVpnLanRoutes.Network"]
    L5_18["OpenVpnLanRoutes.Netmask"] = A0_13["OpenVpnLanRoutes.Netmask"]
    L3_16 = openvpnRoutes.config(L5_18, "OpenVpnLanRoutes", L5_18["OpenVpnLanRoutes._ROWID_"], "edit")
  else
    L5_18 = db.getRow("OpenVpnGwRoutes", "_ROWID_", A1_14)
    L5_18["OpenVpnGwRoutes.CommonName"] = A0_13["OpenVpnGwRoutes.CommonName"]
    L5_18["OpenVpnGwRoutes.Network"] = A0_13["OpenVpnGwRoutes.Network"]
    L5_18["OpenVpnGwRoutes.Netmask"] = A0_13["OpenVpnGwRoutes.Netmask"]
    L3_16 = openvpnRoutes.config(L5_18, "OpenVpnGwRoutes", L5_18["OpenVpnGwRoutes._ROWID_"], "edit")
  end
  if L3_16 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", L4_17
  end
end
function openvpnRoutes.editGet(A0_19, A1_20)
  local L2_21, L3_22, L4_23
  L2_21 = false
  L3_22 = {}
  L4_23 = nil
  if A1_20 == nil then
    L4_23 = db.getRow("OpenVpnLanRoutes", "_ROWID_", A0_19)
    if L4_23 ~= nil then
      L3_22["OpenVpnLanRoutes.Network"] = L4_23["OpenVpnLanRoutes.Network"] or ""
      L3_22["OpenVpnLanRoutes.Netmask"] = L4_23["OpenVpnLanRoutes.Netmask"] or ""
    end
  else
    L4_23 = db.getRow("OpenVpnGwRoutes", "_ROWID_", A0_19)
    if L4_23 ~= nil then
      L3_22["OpenVpnGwRoutes.CommonName"] = L4_23["OpenVpnGwRoutes.CommonName"] or ""
      L3_22["OpenVpnGwRoutes.Network"] = L4_23["OpenVpnGwRoutes.Network"] or ""
      L3_22["OpenVpnGwRoutes.Netmask"] = L4_23["OpenVpnGwRoutes.Netmask"] or ""
    end
  end
  return L3_22
end
function openvpnRoutes.deleteSet(A0_24, A1_25)
  local L2_26, L3_27
  L2_26 = false
  L3_27 = "12735"
  db.beginTransaction()
  if A1_25 == nil then
    L2_26 = db.delete("OpenVpnLanRoutes", A0_24)
  else
    L2_26 = db.delete("OpenVpnGwRoutes", A0_24)
  end
  if L2_26 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", L3_27
  end
end
function openvpnGwRoutes.addSet(A0_28)
  local L1_29, L2_30
  L1_29 = false
  L2_30 = "10783"
  L1_29, L2_30 = openvpnRoutes.addSet(A0_28, "OpenVpnGwRoutes")
  return L1_29, L2_30
end
function openvpnGwRoutes.editSet(A0_31, A1_32)
  local L2_33, L3_34
  L2_33 = false
  L3_34 = "10790"
  L2_33, L3_34 = openvpnRoutes.editSet(A0_31, A1_32, "OpenVpnGwRoutes")
  return L2_33, L3_34
end
function openvpnGwRoutes.editGet(A0_35)
  local L1_36
  L1_36 = {}
  L1_36 = openvpnRoutes.editGet(A0_35, "OpenVpnGwRoutes")
  return L1_36
end
function openvpnGwRoutes.deleteSet(A0_37)
  local L1_38, L2_39
  L1_38 = false
  L2_39 = "10786"
  L1_38, L2_39 = openvpnRoutes.deleteSet(A0_37, "OpenVpnGwRoutes")
  return L1_38, L2_39
end
function openvpnRoutes.display()
  local L0_40, L1_41
  L0_40 = {}
  L1_41 = db
  L1_41 = L1_41.getTable
  L1_41 = L1_41("OpenVpnLanRoutes", true)
  L0_40 = L1_41
  L1_41 = db
  L1_41 = L1_41.getAttribute
  L1_41 = L1_41("OpenVpn", "_ROWID_", "1", "TunnelType")
  return L0_40, L1_41
end
function openvpn.editGet()
  local L0_42
  L0_42 = {}
  if db.getRow("OpenVpn", "_ROWID_", "1") ~= nil then
    L0_42["OpenVpn.ServerEnable"] = db.getRow("OpenVpn", "_ROWID_", "1")["OpenVpn.ServerEnable"]
    L0_42["OpenVpn.OpenVpnMode"] = db.getRow("OpenVpn", "_ROWID_", "1")["OpenVpn.OpenVpnMode"]
    L0_42["OpenVpn.RemoteIpType"] = db.getRow("OpenVpn", "_ROWID_", "1")["OpenVpn.RemoteIpType"]
    L0_42["OpenVpn.RemoteIp"] = db.getRow("OpenVpn", "_ROWID_", "1")["OpenVpn.RemoteIp"]
    L0_42["OpenVpn.OpenVpnNetwork"] = db.getRow("OpenVpn", "_ROWID_", "1")["OpenVpn.OpenVpnNetwork"]
    L0_42["OpenVpn.OpenVpnNetmask"] = db.getRow("OpenVpn", "_ROWID_", "1")["OpenVpn.OpenVpnNetmask"]
    L0_42["OpenVpn.Port"] = db.getRow("OpenVpn", "_ROWID_", "1")["OpenVpn.Port"]
    L0_42["OpenVpn.TunnelProtocol"] = db.getRow("OpenVpn", "_ROWID_", "1")["OpenVpn.TunnelProtocol"]
    L0_42["OpenVpn.EncryptionAlgorithm"] = db.getRow("OpenVpn", "_ROWID_", "1")["OpenVpn.EncryptionAlgorithm"]
    L0_42["OpenVpn.HashAlgorithm"] = db.getRow("OpenVpn", "_ROWID_", "1")["OpenVpn.HashAlgorithm"]
    L0_42["OpenVpn.TunnelType"] = db.getRow("OpenVpn", "_ROWID_", "1")["OpenVpn.TunnelType"]
    L0_42["OpenVpn.AllowClientToClient"] = db.getRow("OpenVpn", "_ROWID_", "1")["OpenVpn.AllowClientToClient"]
    L0_42["OpenVpn.TlsEnabled"] = db.getRow("OpenVpn", "_ROWID_", "1")["OpenVpn.TlsEnabled"]
    L0_42["OpenVpn.BlockCertWithCRL"] = db.getRow("OpenVpn", "_ROWID_", "1")["OpenVpn.BlockCertWithCRL"]
    L0_42["OpenVpn.userAuthSupportEnable"] = db.getRow("OpenVpn", "_ROWID_", "1")["OpenVpn.userAuthSupportEnable"]
    L0_42["OpenVpn.UserName"] = db.getRow("OpenVpn", "_ROWID_", "1")["OpenVpn.UserName"] or ""
    L0_42["OpenVpn.Password"] = db.getRow("OpenVpn", "_ROWID_", "1")["OpenVpn.Password"] or ""
  end
  return L0_42
end
function openvpnCerts.editGet()
  local L0_43, L1_44, L2_45, L3_46, L4_47, L5_48, L6_49, L7_50, L8_51, L9_52, L10_53, L11_54, L12_55, L13_56, L14_57, L15_58, L16_59, L17_60, L18_61, L19_62, L20_63, L21_64, L22_65
  L0_43 = {}
  L1_44 = {}
  L2_45 = util
  L2_45 = L2_45.fileExists
  L3_46 = "/var/certs/ca.crt"
  L2_45 = L2_45(L3_46)
  L3_46 = util
  L3_46 = L3_46.fileExists
  L4_47 = "/var/certs/server.crt"
  L3_46 = L3_46(L4_47)
  L4_47 = util
  L4_47 = L4_47.fileExists
  L5_48 = "/var/certs/server.key"
  L4_47 = L4_47(L5_48)
  L5_48 = util
  L5_48 = L5_48.fileExists
  L6_49 = "/var/certs/dh.pem"
  L5_48 = L5_48(L6_49)
  L6_49 = db
  L6_49 = L6_49.getAttribute
  L7_50 = "OpenvpnCertificates"
  L8_51 = "certType"
  L9_52 = "ca"
  L10_53 = "certData"
  L6_49 = L6_49(L7_50, L8_51, L9_52, L10_53)
  L7_50 = db
  L7_50 = L7_50.getAttribute
  L8_51 = "OpenvpnCertificates"
  L9_52 = "certType"
  L10_53 = "crt"
  L11_54 = "certData"
  L7_50 = L7_50(L8_51, L9_52, L10_53, L11_54)
  L8_51 = db
  L8_51 = L8_51.getAttribute
  L9_52 = "OpenvpnCertificates"
  L10_53 = "certType"
  L11_54 = "key"
  L12_55 = "certData"
  L8_51 = L8_51(L9_52, L10_53, L11_54, L12_55)
  L9_52 = db
  L9_52 = L9_52.getAttribute
  L10_53 = "OpenvpnCertificates"
  L11_54 = "certType"
  L12_55 = "dh"
  L13_56 = "certData"
  L9_52 = L9_52(L10_53, L11_54, L12_55, L13_56)
  L10_53 = tonumber
  L11_54 = db
  L11_54 = L11_54.getAttribute
  L12_55 = "OpenVpn"
  L13_56 = "_ROWID_"
  L14_57 = "1"
  L15_58 = "OpenVpnMode"
  L22_65 = L11_54(L12_55, L13_56, L14_57, L15_58)
  L10_53 = L10_53(L11_54, L12_55, L13_56, L14_57, L15_58, L16_59, L17_60, L18_61, L19_62, L20_63, L21_64, L22_65, L11_54(L12_55, L13_56, L14_57, L15_58))
  L11_54 = db
  L11_54 = L11_54.getAttribute
  L12_55 = "OpenVpn"
  L13_56 = "_ROWID_"
  L14_57 = "1"
  L15_58 = "UploadCaOnly"
  L11_54 = L11_54(L12_55, L13_56, L14_57, L15_58)
  if L11_54 == "1" then
    if L2_45 == false and L6_49 == nil then
      L0_43["PrimaryCertTable.Check"] = nil
      L1_44["SecondaryCertTable.Check"] = nil
      L12_55 = L0_43
      L13_56 = L1_44
      return L12_55, L13_56
    end
    if L2_45 == true and L6_49 == nil then
      L0_43["PrimaryCertTable.Check"] = "0"
      L12_55 = nil
      L13_56 = util
      L13_56 = L13_56.fileToString
      L14_57 = "/var/certs/ca.crt"
      L13_56 = L13_56(L14_57)
      L12_55 = L13_56
      L13_56 = x509Lib
      L13_56 = L13_56.certLoad
      L14_57 = L12_55
      L15_58 = "ca"
      L19_62 = L13_56(L14_57, L15_58)
      L20_63 = process
      L21_64 = L15_58
      L20_63 = L20_63(L21_64)
      L0_43["PrimaryCertTable.CaSubName"] = L20_63
      L1_44["SecondaryCertTable.Check"] = nil
      L1_44["SecondaryCertTable.CaSubName"] = ""
      L20_63 = L0_43
      L21_64 = L1_44
      return L20_63, L21_64
    end
    if L2_45 == false and L6_49 ~= nil then
      L0_43["PrimaryCertTable.Check"] = "1"
      L12_55 = process
      L13_56 = db
      L13_56 = L13_56.getAttribute
      L14_57 = "OpenvpnCertificates"
      L15_58 = "certType"
      L16_59 = "ca"
      L17_60 = "subjectName"
      L22_65 = L13_56(L14_57, L15_58, L16_59, L17_60)
      L12_55 = L12_55(L13_56, L14_57, L15_58, L16_59, L17_60, L18_61, L19_62, L20_63, L21_64, L22_65, L13_56(L14_57, L15_58, L16_59, L17_60))
      L0_43["PrimaryCertTable.CaSubName"] = L12_55
      L1_44["SecondaryCertTable.Check"] = nil
      L1_44["SecondaryCertTable.CaSubName"] = ""
      L12_55 = L0_43
      L13_56 = L1_44
      return L12_55, L13_56
    end
    if L2_45 == true and L6_49 ~= nil then
      L0_43["PrimaryCertTable.Check"] = "1"
      L12_55 = process
      L13_56 = db
      L13_56 = L13_56.getAttribute
      L14_57 = "OpenvpnCertificates"
      L15_58 = "certType"
      L16_59 = "ca"
      L17_60 = "subjectName"
      L22_65 = L13_56(L14_57, L15_58, L16_59, L17_60)
      L12_55 = L12_55(L13_56, L14_57, L15_58, L16_59, L17_60, L18_61, L19_62, L20_63, L21_64, L22_65, L13_56(L14_57, L15_58, L16_59, L17_60))
      L0_43["PrimaryCertTable.CaSubName"] = L12_55
      L12_55 = nil
      L13_56 = util
      L13_56 = L13_56.fileToString
      L14_57 = "/var/certs/ca.crt"
      L13_56 = L13_56(L14_57)
      L12_55 = L13_56
      L13_56 = x509Lib
      L13_56 = L13_56.certLoad
      L14_57 = L12_55
      L15_58 = "ca"
      L19_62 = L13_56(L14_57, L15_58)
      L1_44["SecondaryCertTable.Check"] = "0"
      L20_63 = process
      L21_64 = L15_58
      L20_63 = L20_63(L21_64)
      L1_44["SecondaryCertTable.CaSubName"] = L20_63
      L20_63 = L0_43
      L21_64 = L1_44
      return L20_63, L21_64
    end
  end
  if L2_45 == false and L3_46 == false and L4_47 == false and L6_49 == nil and L7_50 == nil and L8_51 == nil then
    L0_43["PrimaryCertTable.Check"] = nil
    L1_44["SecondaryCertTable.Check"] = nil
    if L5_48 then
      L0_43["PrimaryCertTable.DhExists"] = "yes"
    else
      L0_43["PrimaryCertTable.DhExists"] = ""
    end
    L12_55 = L0_43
    L13_56 = L1_44
    return L12_55, L13_56
  end
  if L2_45 == true and L3_46 == true and L4_47 == true and L6_49 == nil and L7_50 == nil and L8_51 == nil then
    L0_43["PrimaryCertTable.Check"] = "0"
    L12_55 = nil
    L13_56 = util
    L13_56 = L13_56.fileToString
    L14_57 = "/var/certs/ca.crt"
    L13_56 = L13_56(L14_57)
    L12_55 = L13_56
    L13_56 = x509Lib
    L13_56 = L13_56.certLoad
    L14_57 = L12_55
    L15_58 = "ca"
    L19_62 = L13_56(L14_57, L15_58)
    L20_63 = process
    L21_64 = L15_58
    L20_63 = L20_63(L21_64)
    L0_43["PrimaryCertTable.CaSubName"] = L20_63
    L20_63 = util
    L20_63 = L20_63.fileToString
    L21_64 = "/var/certs/server.crt"
    L20_63 = L20_63(L21_64)
    L12_55 = L20_63
    L20_63 = x509Lib
    L20_63 = L20_63.certLoad
    L21_64 = L12_55
    L22_65 = "crt"
    L22_65 = L20_63(L21_64, L22_65)
    L0_43["PrimaryCertTable.CertSubName"] = process(L22_65)
    L0_43["PrimaryCertTable.KeyExists"] = "yes"
    if L5_48 then
      L0_43["PrimaryCertTable.DhExists"] = "yes"
    else
      L0_43["PrimaryCertTable.DhExists"] = ""
    end
    L1_44["SecondaryCertTable.Check"] = nil
    L1_44["SecondaryCertTable.CaSubName"] = ""
    L1_44["SecondaryCertTable.CertSubName"] = ""
    L1_44["SecondaryCertTable.KeyExists"] = ""
    L1_44["SecondaryCertTable.DhExists"] = ""
    return L0_43, L1_44
  end
  if L2_45 == false and L3_46 == false and L4_47 == false and L6_49 ~= nil and L7_50 ~= nil and L8_51 ~= nil then
    L0_43["PrimaryCertTable.Check"] = "1"
    L12_55 = process
    L13_56 = db
    L13_56 = L13_56.getAttribute
    L14_57 = "OpenvpnCertificates"
    L15_58 = "certType"
    L16_59 = "ca"
    L17_60 = "subjectName"
    L22_65 = L13_56(L14_57, L15_58, L16_59, L17_60)
    L12_55 = L12_55(L13_56, L14_57, L15_58, L16_59, L17_60, L18_61, L19_62, L20_63, L21_64, L22_65, L13_56(L14_57, L15_58, L16_59, L17_60))
    L0_43["PrimaryCertTable.CaSubName"] = L12_55
    L12_55 = process
    L13_56 = db
    L13_56 = L13_56.getAttribute
    L14_57 = "OpenvpnCertificates"
    L15_58 = "certType"
    L16_59 = "crt"
    L17_60 = "subjectName"
    L22_65 = L13_56(L14_57, L15_58, L16_59, L17_60)
    L12_55 = L12_55(L13_56, L14_57, L15_58, L16_59, L17_60, L18_61, L19_62, L20_63, L21_64, L22_65, L13_56(L14_57, L15_58, L16_59, L17_60))
    L0_43["PrimaryCertTable.CertSubName"] = L12_55
    L0_43["PrimaryCertTable.KeyExists"] = "yes"
    if (L9_52 ~= nil or L5_48) and L10_53 == 0 then
      L0_43["PrimaryCertTable.DhExists"] = "yes"
    elseif L10_53 ~= nil and L10_53 ~= 0 then
      L0_43["PrimaryCertTable.DhExists"] = "N/A"
    else
      L0_43["PrimaryCertTable.DhExists"] = ""
    end
    L1_44["SecondaryCertTable.Check"] = nil
    L1_44["SecondaryCertTable.CaSubName"] = ""
    L1_44["SecondaryCertTable.CertSubName"] = ""
    L1_44["SecondaryCertTable.KeyExists"] = ""
    L1_44["SecondaryCertTable.DhExists"] = ""
    L12_55 = L0_43
    L13_56 = L1_44
    return L12_55, L13_56
  end
  if L2_45 == true and L3_46 == true and L4_47 == true and L6_49 ~= nil and L7_50 ~= nil and L8_51 ~= nil then
    L0_43["PrimaryCertTable.Check"] = "1"
    L12_55 = process
    L13_56 = db
    L13_56 = L13_56.getAttribute
    L14_57 = "OpenvpnCertificates"
    L15_58 = "certType"
    L16_59 = "ca"
    L17_60 = "subjectName"
    L22_65 = L13_56(L14_57, L15_58, L16_59, L17_60)
    L12_55 = L12_55(L13_56, L14_57, L15_58, L16_59, L17_60, L18_61, L19_62, L20_63, L21_64, L22_65, L13_56(L14_57, L15_58, L16_59, L17_60))
    L0_43["PrimaryCertTable.CaSubName"] = L12_55
    L12_55 = process
    L13_56 = db
    L13_56 = L13_56.getAttribute
    L14_57 = "OpenvpnCertificates"
    L15_58 = "certType"
    L16_59 = "crt"
    L17_60 = "subjectName"
    L22_65 = L13_56(L14_57, L15_58, L16_59, L17_60)
    L12_55 = L12_55(L13_56, L14_57, L15_58, L16_59, L17_60, L18_61, L19_62, L20_63, L21_64, L22_65, L13_56(L14_57, L15_58, L16_59, L17_60))
    L0_43["PrimaryCertTable.CertSubName"] = L12_55
    L0_43["PrimaryCertTable.KeyExists"] = "yes"
    if (L9_52 ~= nil or L5_48) and L10_53 == 0 then
      L0_43["PrimaryCertTable.DhExists"] = "yes"
    elseif L10_53 ~= 0 and L10_53 ~= nil then
      L0_43["PrimaryCertTable.DhExists"] = "N/A"
    else
      L0_43["PrimaryCertTable.DhExists"] = ""
    end
    L12_55 = nil
    L13_56 = util
    L13_56 = L13_56.fileToString
    L14_57 = "/var/certs/ca.crt"
    L13_56 = L13_56(L14_57)
    L12_55 = L13_56
    L13_56 = x509Lib
    L13_56 = L13_56.certLoad
    L14_57 = L12_55
    L15_58 = "ca"
    L19_62 = L13_56(L14_57, L15_58)
    L1_44["SecondaryCertTable.Check"] = "0"
    L20_63 = process
    L21_64 = L15_58
    L20_63 = L20_63(L21_64)
    L1_44["SecondaryCertTable.CaSubName"] = L20_63
    L20_63 = util
    L20_63 = L20_63.fileToString
    L21_64 = "/var/certs/server.crt"
    L20_63 = L20_63(L21_64)
    L12_55 = L20_63
    L20_63 = x509Lib
    L20_63 = L20_63.certLoad
    L21_64 = L12_55
    L22_65 = "crt"
    L22_65 = L20_63(L21_64, L22_65)
    L1_44["SecondaryCertTable.CertSubName"] = process(L22_65)
    L1_44["SecondaryCertTable.KeyExists"] = "yes"
    if L5_48 and L9_52 ~= nil and L10_53 == 0 then
      L1_44["SecondaryCertTable.DhExists"] = "yes"
    elseif L10_53 ~= 0 and L10_53 ~= nil then
      L1_44["SecondaryCertTable.DhExists"] = "N/A"
    else
      L1_44["SecondaryCertTable.DhExists"] = ""
    end
    return L0_43, L1_44
  end
  if (L2_45 == true or L3_46 == true or L4_47 == true or L5_48 == true) and L6_49 ~= nil and L7_50 ~= nil and L8_51 ~= nil then
    L0_43["PrimaryCertTable.Check"] = "1"
    L12_55 = process
    L13_56 = db
    L13_56 = L13_56.getAttribute
    L14_57 = "OpenvpnCertificates"
    L15_58 = "certType"
    L16_59 = "ca"
    L17_60 = "subjectName"
    L22_65 = L13_56(L14_57, L15_58, L16_59, L17_60)
    L12_55 = L12_55(L13_56, L14_57, L15_58, L16_59, L17_60, L18_61, L19_62, L20_63, L21_64, L22_65, L13_56(L14_57, L15_58, L16_59, L17_60))
    L0_43["PrimaryCertTable.CaSubName"] = L12_55
    L12_55 = process
    L13_56 = db
    L13_56 = L13_56.getAttribute
    L14_57 = "OpenvpnCertificates"
    L15_58 = "certType"
    L16_59 = "crt"
    L17_60 = "subjectName"
    L22_65 = L13_56(L14_57, L15_58, L16_59, L17_60)
    L12_55 = L12_55(L13_56, L14_57, L15_58, L16_59, L17_60, L18_61, L19_62, L20_63, L21_64, L22_65, L13_56(L14_57, L15_58, L16_59, L17_60))
    L0_43["PrimaryCertTable.CertSubName"] = L12_55
    L0_43["PrimaryCertTable.KeyExists"] = "yes"
    if (L9_52 ~= nil or L5_48) and L10_53 == 0 then
      L0_43["PrimaryCertTable.DhExists"] = "yes"
    elseif L10_53 ~= 0 and L10_53 ~= nil then
      L0_43["PrimaryCertTable.DhExists"] = "N/A"
    else
      L0_43["PrimaryCertTable.DhExists"] = ""
    end
    L12_55, L13_56 = nil, nil
    if L2_45 then
      L14_57 = util
      L14_57 = L14_57.fileToString
      L15_58 = "/var/certs/ca.crt"
      L14_57 = L14_57(L15_58)
      L12_55 = L14_57
      L14_57 = x509Lib
      L14_57 = L14_57.certLoad
      L15_58 = L12_55
      L16_59 = "ca"
      L20_63 = L14_57(L15_58, L16_59)
      L21_64 = process
      L22_65 = L16_59
      L21_64 = L21_64(L22_65)
      L13_56 = L21_64
    else
      L14_57 = ""
      L13_56 = L14_57
    end
    L1_44["SecondaryCertTable.Check"] = nil
    L1_44["SecondaryCertTable.CaSubName"] = L13_56
    if L3_46 then
      L14_57 = util
      L14_57 = L14_57.fileToString
      L15_58 = "/var/certs/server.crt"
      L14_57 = L14_57(L15_58)
      L12_55 = L14_57
      L14_57 = x509Lib
      L14_57 = L14_57.certLoad
      L15_58 = L12_55
      L16_59 = "crt"
      L20_63 = L14_57(L15_58, L16_59)
      L21_64 = process
      L22_65 = L16_59
      L21_64 = L21_64(L22_65)
      L13_56 = L21_64
    else
      L14_57 = ""
      L13_56 = L14_57
    end
    L1_44["SecondaryCertTable.CertSubName"] = L13_56
    if L4_47 then
      L1_44["SecondaryCertTable.KeyExists"] = "yes"
    else
      L1_44["SecondaryCertTable.KeyExists"] = ""
    end
    L1_44["SecondaryCertTable.DhExists"] = ""
    L14_57 = L0_43
    L15_58 = L1_44
    return L14_57, L15_58
  end
  if (L2_45 == true or L3_46 == true or L4_47 == true or L5_48 == true) and L6_49 == nil and L7_50 == nil and L8_51 == nil then
    L0_43["PrimaryCertTable.Check"] = nil
    L12_55, L13_56 = nil, nil
    if L2_45 then
      L14_57 = util
      L14_57 = L14_57.fileToString
      L15_58 = "/var/certs/ca.crt"
      L14_57 = L14_57(L15_58)
      L12_55 = L14_57
      L14_57 = x509Lib
      L14_57 = L14_57.certLoad
      L15_58 = L12_55
      L16_59 = "ca"
      L20_63 = L14_57(L15_58, L16_59)
      L21_64 = process
      L22_65 = L16_59
      L21_64 = L21_64(L22_65)
      L13_56 = L21_64
    else
      L14_57 = ""
      L13_56 = L14_57
    end
    L0_43["PrimaryCertTable.CaSubName"] = L13_56
    if L3_46 then
      L14_57 = util
      L14_57 = L14_57.fileToString
      L15_58 = "/var/certs/server.crt"
      L14_57 = L14_57(L15_58)
      L12_55 = L14_57
      L14_57 = x509Lib
      L14_57 = L14_57.certLoad
      L15_58 = L12_55
      L16_59 = "crt"
      L20_63 = L14_57(L15_58, L16_59)
      L21_64 = process
      L22_65 = L16_59
      L21_64 = L21_64(L22_65)
      L13_56 = L21_64
    else
      L14_57 = ""
      L13_56 = L14_57
    end
    L0_43["PrimaryCertTable.CertSubName"] = L13_56
    if L4_47 then
      L0_43["PrimaryCertTable.KeyExists"] = "yes"
    else
      L0_43["PrimaryCertTable.KeyExists"] = ""
    end
    if L5_48 then
      L0_43["PrimaryCertTable.DhExists"] = "yes"
    else
      L0_43["PrimaryCertTable.DhExists"] = ""
    end
    L1_44["SecondaryCertTable.Check"] = nil
    L1_44["SecondaryCertTable.CaSubName"] = ""
    L1_44["SecondaryCertTable.CertSubName"] = ""
    L1_44["SecondaryCertTable.KeyExists"] = ""
    L1_44["SecondaryCertTable.DhExists"] = ""
    L14_57 = L0_43
    L15_58 = L1_44
    return L14_57, L15_58
  end
end
function openvpn.editSet(A0_66)
  local L1_67, L2_68, L3_69, L4_70, L5_71, L6_72, L7_73, L8_74
  L1_67 = false
  L2_68 = true
  L3_69 = "12736"
  L4_70 = nil
  L5_71 = A0_66["OpenVpn.OpenVpnMode"]
  if L5_71 == "0" then
    L4_70 = "server"
  else
    L4_70 = "client"
  end
  L5_71 = db
  L5_71 = L5_71.getRow
  L6_72 = "OpenVpn"
  L7_73 = "_ROWID_"
  L8_74 = "1"
  L5_71 = L5_71(L6_72, L7_73, L8_74)
  L6_72 = A0_66["OpenVpn.OpenVpnMode"]
  if L6_72 ~= "2" then
    L6_72 = A0_66["OpenVpn.ServerEnable"]
    if L6_72 == "1" then
      L6_72 = A0_66["OpenVpn.userAuthSupportEnable"]
      if L6_72 == "1" then
        L6_72 = A0_66["OpenVpn.OpenVpnMode"]
        if L6_72 == "1" then
          L6_72 = A0_66["OpenVpn.UserName"]
          if L6_72 ~= nil then
            L6_72 = A0_66["OpenVpn.Password"]
            if L6_72 == nil then
              L6_72 = A0_66["OpenVpn.OpenVpnMode"]
              L6_72 = not L6_72
            end
          elseif L6_72 == "0" then
            L3_69 = "10144"
            L6_72 = "ERROR"
            L7_73 = L3_69
            return L6_72, L7_73
          end
          L6_72 = A0_66["OpenVpn.UserName"]
          L5_71["OpenVpn.UserName"] = L6_72
          L6_72 = A0_66["OpenVpn.Password"]
          L5_71["OpenVpn.Password"] = L6_72
        end
      end
    end
    L6_72 = A0_66["OpenVpn.ServerEnable"]
    if L6_72 == "1" then
      L6_72 = A0_66["OpenVpn.OpenVpnMode"]
      if L6_72 == "0" then
        L6_72 = A0_66["OpenVpn.BlockCertWithCRL"]
        L5_71["OpenVpn.BlockCertWithCRL"] = L6_72
      end
    end
  end
  L6_72 = A0_66["OpenVpn.OpenVpnMode"]
  if L6_72 == "2" then
    L6_72 = util
    L6_72 = L6_72.fileExists
    L7_73 = "/var/certs/client.ovpn"
    L6_72 = L6_72(L7_73)
    if L6_72 then
      L6_72 = db
      L6_72 = L6_72.getAttribute
      L7_73 = "OpenvpnCertificates"
      L8_74 = "certType"
      L6_72 = L6_72(L7_73, L8_74, "config", "_ROWID_")
      if L6_72 == nil then
        L7_73 = openvpnCerts
        L7_73 = L7_73.addSet
        L8_74 = "config"
        L7_73 = L7_73(L8_74)
        L2_68 = L7_73 and L2_68
      else
        L7_73 = openvpnCerts
        L7_73 = L7_73.editSet
        L8_74 = "config"
        L7_73 = L7_73(L8_74, L6_72)
        L2_68 = L7_73 and L2_68
      end
      if L2_68 then
      else
        L3_69 = "10144"
        L7_73 = "ERROR"
        L8_74 = L3_69
        return L7_73, L8_74
      end
      L7_73 = os
      L7_73 = L7_73.execute
      L8_74 = "rm"
      L8_74 = L8_74 .. " /var/certs/client.ovpn"
      L7_73(L8_74)
    end
  end
  L6_72 = A0_66["OpenVpn.ServerEnable"]
  L5_71["OpenVpn.ServerEnable"] = L6_72
  L6_72 = A0_66["OpenVpn.OpenVpnMode"]
  L5_71["OpenVpn.OpenVpnMode"] = L6_72
  L6_72 = A0_66["OpenVpn.RemoteIpType"]
  L5_71["OpenVpn.RemoteIpType"] = L6_72
  L6_72 = A0_66["OpenVpn.RemoteIp"]
  L5_71["OpenVpn.RemoteIp"] = L6_72
  L6_72 = A0_66["OpenVpn.FailoverRemoteIpType"]
  L5_71["OpenVpn.FailoverRemoteIpType"] = L6_72
  L6_72 = A0_66["OpenVpn.FailoverRemoteIp"]
  L5_71["OpenVpn.FailoverRemoteIp"] = L6_72
  L6_72 = A0_66["OpenVpn.OpenVpnNetwork"]
  L5_71["OpenVpn.OpenVpnNetwork"] = L6_72
  L6_72 = A0_66["OpenVpn.OpenVpnNetmask"]
  L5_71["OpenVpn.OpenVpnNetmask"] = L6_72
  L6_72 = A0_66["OpenVpn.Port"]
  L5_71["OpenVpn.Port"] = L6_72
  L6_72 = A0_66["OpenVpn.TunnelProtocol"]
  L5_71["OpenVpn.TunnelProtocol"] = L6_72
  L6_72 = A0_66["OpenVpn.EncryptionAlgorithm"]
  L5_71["OpenVpn.EncryptionAlgorithm"] = L6_72
  L6_72 = A0_66["OpenVpn.HashAlgorithm"]
  L5_71["OpenVpn.HashAlgorithm"] = L6_72
  L6_72 = A0_66["OpenVpn.TunnelType"]
  L5_71["OpenVpn.TunnelType"] = L6_72
  L6_72 = A0_66["OpenVpn.AllowClientToClient"]
  L5_71["OpenVpn.AllowClientToClient"] = L6_72
  L6_72 = A0_66["OpenVpn.TlsEnabled"]
  L5_71["OpenVpn.TlsEnabled"] = L6_72
  L6_72 = A0_66["OpenVpn.BlockCertWithCRL"]
  L5_71["OpenVpn.BlockCertWithCRL"] = L6_72
  L6_72 = A0_66["OpenVpn.userAuthSupportEnable"]
  L5_71["OpenVpn.userAuthSupportEnable"] = L6_72
  L6_72 = A0_66["OpenVpn.duplicateCN"]
  L5_71["OpenVpn.duplicateCN"] = L6_72
  L6_72 = A0_66["OpenVpn.ServerEnable"]
  if L6_72 == "1" then
    L6_72 = A0_66["OpenVpn.userAuthSupportEnable"]
    if L6_72 == "1" then
      L6_72 = A0_66["OpenVpn.OpenVpnMode"]
      if L6_72 == "1" then
        L6_72 = A0_66["OpenVpn.UserName"]
        if L6_72 ~= nil then
          L6_72 = A0_66["OpenVpn.Password"]
          if L6_72 == nil then
            L6_72 = A0_66["OpenVpn.OpenVpnMode"]
            L6_72 = not L6_72
          end
        elseif L6_72 == "0" then
          L3_69 = "10144"
          L6_72 = "ERROR"
          L7_73 = L3_69
          return L6_72, L7_73
        end
        L6_72 = A0_66["OpenVpn.UserName"]
        L5_71["OpenVpn.UserName"] = L6_72
        L6_72 = A0_66["OpenVpn.Password"]
        L5_71["OpenVpn.Password"] = L6_72
      end
    end
  end
  L6_72 = A0_66["OpenVpn.authServerId"]
  L5_71["OpenVpn.authServerId"] = L6_72
  L6_72 = A0_66["OpenVpn.certificateVerification"]
  L5_71["OpenVpn.certificateVerification"] = L6_72
  L6_72 = A0_66["OpenVpn.serverClientCertsName"]
  L5_71["OpenVpn.serverClientCertsName"] = L6_72
  L6_72 = A0_66["OpenVpn.TlsCertsName"]
  L5_71["OpenVpn.TlsCertsName"] = L6_72
  L6_72 = A0_66["OpenVpn.CrlCertsName"]
  L5_71["OpenVpn.CrlCertsName"] = L6_72
  L6_72 = db
  L6_72 = L6_72.beginTransaction
  L6_72()
  L6_72 = openvpn
  L6_72 = L6_72.config
  L7_73 = L5_71
  L8_74 = "1"
  L6_72 = L6_72(L7_73, L8_74, "edit")
  L1_67 = L6_72
  if L1_67 then
    L6_72 = "OpenvpnSession"
    L7_73, L8_74 = nil, nil
    L7_73 = db.existsRow(L6_72, "loginState", "LOGGED_IN")
    if L7_73 then
      L8_74 = db.deleteAllRows(L6_72)
      if L8_74 == _UPVALUE0_.NIL then
        return "ERROR"
      end
    end
    db.commitTransaction(true)
    return "OK", "12265"
  else
    L6_72 = db
    L6_72 = L6_72.rollback
    L6_72()
    L6_72 = "ERROR"
    L7_73 = L3_69
    return L6_72, L7_73
  end
end
function openvpnCerts.addSet(A0_75)
  local L1_76, L2_77, L3_78
  L1_76 = false
  if A0_75 == "ca" then
    L2_77 = {}
    L3_78 = nil
    L3_78 = util.fileToString("/var/certs/ca.crt")
    if x509Lib.certLoad(L3_78, "ca") == -1 then
      return false
    end
    L2_77["OpenvpnCertificates.format"], L2_77["OpenvpnCertificates.serialNumber"], L2_77["OpenvpnCertificates.expiryTime"], L2_77["OpenvpnCertificates.issuerName"], L2_77["OpenvpnCertificates.subjectName"], L2_77["OpenvpnCertificates.name"] = x509Lib.certLoad(L3_78, "ca")
    L2_77["OpenvpnCertificates.certType"] = "ca"
    L2_77["OpenvpnCertificates.certData"] = L3_78
    L1_76 = db.insert("OpenvpnCertificates", L2_77)
    return L1_76
  elseif A0_75 == "crt" then
    L2_77 = {}
    L3_78 = nil
    L3_78 = util.fileToString("/var/certs/server.crt")
    if x509Lib.certLoad(L3_78, "crt") == -1 then
      return false
    end
    L2_77["OpenvpnCertificates.format"], L2_77["OpenvpnCertificates.serialNumber"], L2_77["OpenvpnCertificates.expiryTime"], L2_77["OpenvpnCertificates.issuerName"], L2_77["OpenvpnCertificates.subjectName"], L2_77["OpenvpnCertificates.name"] = x509Lib.certLoad(L3_78, "crt")
    L2_77["OpenvpnCertificates.certType"] = "crt"
    L2_77["OpenvpnCertificates.certData"] = L3_78
    L1_76 = db.insert("OpenvpnCertificates", L2_77)
    return L1_76
  elseif A0_75 == "key" then
    L2_77 = {}
    L3_78 = nil
    L3_78 = util.fileToString("/var/certs/server.key")
    L2_77["OpenvpnCertificates.certType"] = "key"
    L2_77["OpenvpnCertificates.certData"] = L3_78
    L1_76 = db.insert("OpenvpnCertificates", L2_77)
    return L1_76
  elseif A0_75 == "dh" then
    L2_77 = {}
    L3_78 = nil
    L3_78 = util.fileToString("/var/certs/dh.pem")
    L2_77["OpenvpnCertificates.certType"] = "dh"
    L2_77["OpenvpnCertificates.certData"] = L3_78
    L1_76 = db.insert("OpenvpnCertificates", L2_77)
    return L1_76
  elseif A0_75 == "ta" then
    L2_77 = {}
    L3_78 = nil
    L3_78 = util.fileToString("/var/certs/ta.key")
    L2_77["OpenvpnCertificates.certType"] = "ta"
    L2_77["OpenvpnCertificates.certData"] = L3_78
    L1_76 = db.insert("OpenvpnCertificates", L2_77)
    return L1_76
  elseif A0_75 == "crl" then
    L2_77 = {}
    L3_78 = nil
    L3_78 = util.fileToString("/var/certs/openvpn/crl.pem")
    L2_77["OpenvpnCertificates.certType"] = "crl"
    L2_77["OpenvpnCertificates.certData"] = L3_78
    L1_76 = db.insert("OpenvpnCertificates", L2_77)
    return L1_76
  elseif A0_75 == "config" then
    L2_77 = {}
    L3_78 = nil
    assert(io.open("/var/certs/client.ovpn", "a")):write("daemon\n")
    assert(io.open("/var/certs/client.ovpn", "a")):write("writepid /var/run/openvpn.pid\n")
    assert(io.open("/var/certs/client.ovpn", "a")):write("log /var/openvpn/openvpn.log\n")
    assert(io.open("/var/certs/client.ovpn", "a")):close()
    L3_78 = util.fileToString("/var/certs/client.ovpn")
    L3_78 = string.gsub(L3_78, "'", "")
    L2_77["OpenvpnCertificates.certType"] = "config"
    L2_77["OpenvpnCertificates.certData"] = L3_78
    L1_76 = db.insert("OpenvpnCertificates", L2_77)
    return L1_76
  end
end
function openvpnCerts.editSet(A0_79, A1_80)
  local L2_81, L3_82, L4_83, L5_84, L6_85
  L2_81 = false
  L3_82 = db
  L3_82 = L3_82.getRow
  L4_83 = "OpenvpnCertificates"
  L5_84 = "_ROWID_"
  L6_85 = A1_80
  L3_82 = L3_82(L4_83, L5_84, L6_85)
  L4_83 = L3_82["OpenvpnCertificates.certType"]
  if L4_83 == "ca" then
    L4_83 = nil
    L5_84 = util
    L5_84 = L5_84.fileToString
    L6_85 = "/var/certs/ca.crt"
    L5_84 = L5_84(L6_85)
    L4_83 = L5_84
    L5_84 = x509Lib
    L5_84 = L5_84.certLoad
    L6_85 = L4_83
    L6_85 = L5_84(L6_85, "ca")
    if L5_84 == -1 then
      return false
    end
    L3_82["OpenvpnCertificates.format"], L3_82["OpenvpnCertificates.serialNumber"], L3_82["OpenvpnCertificates.expiryTime"], L3_82["OpenvpnCertificates.issuerName"], L3_82["OpenvpnCertificates.subjectName"], L3_82["OpenvpnCertificates.name"] = L5_84(L6_85, "ca")
    L3_82["OpenvpnCertificates.format"], L3_82["OpenvpnCertificates.serialNumber"], L3_82["OpenvpnCertificates.expiryTime"], L3_82["OpenvpnCertificates.issuerName"], L3_82["OpenvpnCertificates.subjectName"], L3_82["OpenvpnCertificates.name"] = L5_84(L6_85, "ca")
    L3_82["OpenvpnCertificates.certData"] = L4_83
    L5_84 = db.update("OpenvpnCertificates", L3_82, A1_80)
    return L5_84
  else
    L4_83 = L3_82["OpenvpnCertificates.certType"]
    if L4_83 == "crt" then
      L4_83 = {}
      L5_84 = nil
      L6_85 = util
      L6_85 = L6_85.fileToString
      L6_85 = L6_85("/var/certs/server.crt")
      L5_84 = L6_85
      L6_85 = x509Lib
      L6_85 = L6_85.certLoad
      L6_85 = L6_85(L5_84, "crt")
      if L6_85 == -1 then
        return false
      end
      L4_83["OpenvpnCertificates.format"], L4_83["OpenvpnCertificates.serialNumber"], L4_83["OpenvpnCertificates.expiryTime"], L4_83["OpenvpnCertificates.issuerName"], L4_83["OpenvpnCertificates.subjectName"], L4_83["OpenvpnCertificates.name"] = L6_85(L5_84, "crt")
      L4_83["OpenvpnCertificates.certData"] = L5_84
      L6_85 = db.update("OpenvpnCertificates", L4_83, A1_80)
      return L6_85
    else
      L4_83 = L3_82["OpenvpnCertificates.certType"]
      if L4_83 == "key" then
        L4_83 = {}
        L5_84 = nil
        L6_85 = util
        L6_85 = L6_85.fileToString
        L6_85 = L6_85("/var/certs/server.key")
        L5_84 = L6_85
        L4_83["OpenvpnCertificates.certData"] = L5_84
        L6_85 = db
        L6_85 = L6_85.update
        L6_85 = L6_85("OpenvpnCertificates", L4_83, A1_80)
        L2_81 = L6_85
        return L2_81
      else
        L4_83 = L3_82["OpenvpnCertificates.certType"]
        if L4_83 == "dh" then
          L4_83 = {}
          L5_84 = nil
          L6_85 = util
          L6_85 = L6_85.fileToString
          L6_85 = L6_85("/var/certs/dh.pem")
          L5_84 = L6_85
          L4_83["OpenvpnCertificates.certData"] = L5_84
          L6_85 = db
          L6_85 = L6_85.update
          L6_85 = L6_85("OpenvpnCertificates", L4_83, A1_80)
          L2_81 = L6_85
          return L2_81
        else
          L4_83 = L3_82["OpenvpnCertificates.certType"]
          if L4_83 == "ta" then
            L4_83 = {}
            L5_84 = nil
            L6_85 = util
            L6_85 = L6_85.fileToString
            L6_85 = L6_85("/var/certs/ta.key")
            L5_84 = L6_85
            L4_83["OpenvpnCertificates.certData"] = L5_84
            L6_85 = db
            L6_85 = L6_85.update
            L6_85 = L6_85("OpenvpnCertificates", L4_83, A1_80)
            L2_81 = L6_85
            return L2_81
          else
            L4_83 = L3_82["OpenvpnCertificates.certType"]
            if L4_83 == "crl" then
              L4_83 = {}
              L5_84 = nil
              L6_85 = util
              L6_85 = L6_85.fileToString
              L6_85 = L6_85("/var/certs/openvpn/crl.pem")
              L5_84 = L6_85
              L4_83["OpenvpnCertificates.certData"] = L5_84
              L6_85 = db
              L6_85 = L6_85.update
              L6_85 = L6_85("OpenvpnCertificates", L4_83, A1_80)
              L2_81 = L6_85
              return L2_81
            else
              L4_83 = L3_82["OpenvpnCertificates.certType"]
              if L4_83 == "config" then
                L4_83 = {}
                L5_84 = nil
                L6_85 = assert
                L6_85 = L6_85(io.open("/var/certs/client.ovpn", "a"))
                L6_85:write("daemon\n")
                L6_85:write("writepid /var/run/openvpn.pid\n")
                L6_85:write("log /var/openvpn/openvpn.log\n")
                L6_85:close()
                L5_84 = util.fileToString("/var/certs/client.ovpn")
                L5_84 = string.gsub(L5_84, "'", "")
                L4_83["OpenvpnCertificates.certData"] = L5_84
                L2_81 = db.update("OpenvpnCertificates", L4_83, A1_80)
                return L2_81
              end
            end
          end
        end
      end
    end
  end
end
function openvpnCerts.uploadSet(A0_86, A1_87)
  local L2_88, L3_89, L4_90, L5_91
  L2_88 = false
  L3_89 = "12738"
  if A1_87 == "ca" then
    L4_90 = cgilua
    L4_90 = L4_90.cookies
    L4_90 = L4_90.get
    L5_91 = "TeamF1Login"
    L4_90 = L4_90(L5_91)
    L5_91 = os
    L5_91 = L5_91.execute
    L5_91 = L5_91("mv" .. " " .. "/tmp/" .. L4_90 .. " /var/certs/ca.crt")
    L2_88 = L5_91
    L5_91 = nil
    L5_91 = util.fileToString("/var/certs/ca.crt")
    if x509Lib.certLoad(L5_91, "ca") == -1 or string.find(L5_91, "-----BEGIN CERTIFICATE-----") == nil or string.find(L5_91, "-----END CERTIFICATE-----") == nil then
      os.execute("rm" .. " /var/certs/ca.crt")
      return "ERROR", L3_89
    end
    return "OK", "12265"
  elseif A1_87 == "crt" then
    L4_90 = cgilua
    L4_90 = L4_90.cookies
    L4_90 = L4_90.get
    L5_91 = "TeamF1Login"
    L4_90 = L4_90(L5_91)
    L5_91 = os
    L5_91 = L5_91.execute
    L5_91 = L5_91("mv" .. " " .. "/tmp/" .. L4_90 .. " /var/certs/server.crt")
    L2_88 = L5_91
    L5_91 = nil
    L5_91 = util.fileToString("/var/certs/server.crt")
    if x509Lib.certLoad(L5_91, "crt") == -1 or string.find(L5_91, "-----BEGIN CERTIFICATE-----") == nil or string.find(L5_91, "-----END CERTIFICATE-----") == nil then
      os.execute("rm" .. " /var/certs/server.crt")
      return "ERROR", L3_89
    end
    return "OK", "12265"
  elseif A1_87 == "key" then
    L4_90 = cgilua
    L4_90 = L4_90.cookies
    L4_90 = L4_90.get
    L5_91 = "TeamF1Login"
    L4_90 = L4_90(L5_91)
    L5_91 = os
    L5_91 = L5_91.execute
    L5_91 = L5_91("mv" .. " " .. "/tmp/" .. L4_90 .. " /var/certs/server.key")
    L2_88 = L5_91
    L5_91 = nil
    L5_91 = util.fileToString("/var/certs/server.key")
    if (string.find(L5_91, "-----BEGIN PRIVATE KEY-----") == nil or string.find(L5_91, "-----END PRIVATE KEY-----") == nil) and (string.find(L5_91, "-----BEGIN RSA PRIVATE KEY-----") == nil or string.find(L5_91, "-----END RSA PRIVATE KEY-----") == nil) then
      os.execute("rm" .. " /var/certs/server.key")
      return "ERROR", L3_89
    else
      return "OK", "12265"
    end
  elseif A1_87 == "dh" then
    L4_90 = cgilua
    L4_90 = L4_90.cookies
    L4_90 = L4_90.get
    L5_91 = "TeamF1Login"
    L4_90 = L4_90(L5_91)
    L5_91 = os
    L5_91 = L5_91.execute
    L5_91 = L5_91("mv" .. " " .. "/tmp/" .. L4_90 .. " /var/certs/dh.pem")
    L2_88 = L5_91
    L5_91 = nil
    L5_91 = util.fileToString("/var/certs/dh.pem")
    if string.find(L5_91, "-----BEGIN DH PARAMETERS-----") == nil or string.find(L5_91, "-----END DH PARAMETERS-----") == nil then
      os.execute("rm" .. " /var/certs/dh.pem")
      return "ERROR", L3_89
    else
      return "OK", "12265"
    end
  elseif A1_87 == "ta" then
    L4_90 = cgilua
    L4_90 = L4_90.cookies
    L4_90 = L4_90.get
    L5_91 = "TeamF1Login"
    L4_90 = L4_90(L5_91)
    L5_91 = os
    L5_91 = L5_91.execute
    L5_91 = L5_91("mv" .. " " .. "/tmp/" .. L4_90 .. " /var/certs/ta.key")
    L2_88 = L5_91
    L5_91 = nil
    L5_91 = util.fileToString("/var/certs/ta.key")
    if string.find(L5_91, "-----BEGIN OpenVPN Static key V1-----") == nil or string.find(L5_91, "-----END OpenVPN Static key V1-----") == nil then
      os.execute("rm" .. " /var/certs/ta.key")
      return "ERROR", L3_89
    else
      return "OK", "12265"
    end
  elseif A1_87 == "crl" then
    L4_90 = cgilua
    L4_90 = L4_90.cookies
    L4_90 = L4_90.get
    L5_91 = "TeamF1Login"
    L4_90 = L4_90(L5_91)
    L5_91 = os
    L5_91 = L5_91.execute
    L5_91 = L5_91("mv" .. " " .. "/tmp/" .. L4_90 .. " /var/certs/openvpn/crl.pem")
    L2_88 = L5_91
    L5_91 = nil
    L5_91 = util.fileToString("/var/certs/openvpn/crl.pem")
    if string.find(L5_91, "-----BEGIN X509 CRL-----") == nil or string.find(L5_91, "-----END X509 CRL-----") == nil then
      os.execute("rm" .. " /var/certs/openvpn/crl.pem")
      return "ERROR", L3_89
    else
      return "OK", "12265"
    end
  elseif A1_87 == "config" then
    L4_90 = cgilua
    L4_90 = L4_90.cookies
    L4_90 = L4_90.get
    L5_91 = "TeamF1Login"
    L4_90 = L4_90(L5_91)
    L5_91 = os
    L5_91 = L5_91.execute
    L5_91("mv" .. " " .. "/tmp/" .. L4_90 .. " /var/certs/client.ovpn")
    L5_91 = nil
    L5_91 = util.fileToString("/var/certs/client.ovpn")
    L2_88 = string.find(L5_91, "client") ~= nil and string.find(L5_91, "dev") ~= nil and string.find(L5_91, "CERTIFICATE") ~= nil
    if L2_88 then
      return "OK", "12265"
    else
      os.execute("rm" .. " /var/certs/client.ovpn")
      return "ERROR", L3_89
    end
  end
end
function openvpn.tlsDisplay()
  local L0_92
  L0_92 = false
  L0_92 = util.fileExists("/var/certs/ta.key") or util.fileExists("/var/certs/openvpn/ta.key")
  return L0_92
end
function openvpnCerts.uploadStatusGet(A0_93)
  local L1_94
  L1_94 = false
  if A0_93 == "ca" then
    L1_94 = util.fileExists("/var/certs/ca.crt") or util.fileExists("/var/certs/openvpn/ca.crt")
    return L1_94
  elseif A0_93 == "crt" then
    L1_94 = util.fileExists("/var/certs/server.crt") or util.fileExists("/var/certs/openvpn/server.crt")
    return L1_94
  elseif A0_93 == "key" then
    L1_94 = util.fileExists("/var/certs/server.key") or util.fileExists("/var/certs/openvpn/server.key")
    return L1_94
  elseif A0_93 == "dh" then
    L1_94 = util.fileExists("/var/certs/dh.pem") or util.fileExists("/var/certs/openvpn/dh.pem")
    return L1_94
  elseif A0_93 == "ta" then
    L1_94 = util.fileExists("/var/certs/ta.key") or util.fileExists("/var/certs/openvpn/ta.key")
    return L1_94
  elseif A0_93 == "crl" then
    L1_94 = util.fileExists("/var/certs/crl.pem") or util.fileExists("/var/certs/openvpn/crl.pem")
    return L1_94
  elseif A0_93 == "config" then
    L1_94 = util.fileExists("/var/certs/client.ovpn") or util.fileExists("/var/openvpn/client.ovpn")
    return L1_94
  end
end
function openvpnCerts.uploadCrlSectionGet()
  local L0_95, L1_96, L2_97
  L2_97 = 0
  L1_96 = db.getTable("OpenvpnCrlCertificates", false)
  if #L1_96 ~= 0 then
    L2_97 = "1"
  end
  return L2_97
end
function openvpnCerts.uploadTlsSectionGet()
  local L0_98, L1_99, L2_100
  L2_100 = 0
  L1_99 = db.getTable("OpenvpnTlsCertificates", false)
  if #L1_99 ~= 0 then
    L2_100 = "1"
  end
  return L2_100
end
function openvpnCerts.verifyCertificatesStatus(A0_101)
  local L1_102
  L1_102 = false
  if db.getAttribute("OpenvpnCertificates", "certType", "ca", "certData") ~= nil and db.getAttribute("OpenvpnCertificates", "certType", "crt", "certData") ~= nil and db.getAttribute("OpenvpnCertificates", "certType", "key", "certData") ~= nil and (db.getAttribute("OpenvpnCertificates", "certType", "dh", "certData") ~= nil and A0_101 == "server" or A0_101 == "client") then
    return false
  end
  L1_102 = util.fileExists("/var/certs/ca.crt") and util.fileExists("/var/certs/server.crt") and util.fileExists("/var/certs/server.key")
  if L1_102 and util.fileExists("/var/certs/dh.pem") and A0_101 == "server" or L1_102 and A0_101 == "client" then
    return false
  else
    return true
  end
end
function process(A0_103)
  local L1_104, L2_105
  L1_104 = string
  L1_104 = L1_104.find
  L2_105 = A0_103
  L1_104 = L1_104(L2_105, "CN=")
  L2_105 = L1_104 + 12
  return string.sub(A0_103, 1, L2_105) .. " ..."
end
function openvpn.crlDisplay()
  local L0_106
  L0_106 = false
  L0_106 = util.fileExists("/var/certs/crl.pem") or util.fileExists("/var/certs/openvpn/crl.pem")
  return L0_106
end
function openvpn.login(A0_107)
  local L1_108, L2_109, L3_110, L4_111, L5_112, L6_113, L7_114, L8_115, L9_116, L10_117, L11_118, L12_119, L13_120, L14_121, L15_122, L16_123, L17_124, L18_125, L19_126, L20_127, L21_128, L22_129, L23_130, L24_131
  L1_108 = A0_107["Users.UserName"]
  L2_109 = A0_107["Users.Password"]
  L3_110, L4_111 = nil, nil
  L5_112 = "Invalid UserName or Password"
  L6_113 = SAPI
  L6_113 = L6_113.Request
  L6_113 = L6_113.servervariable
  L7_114 = "REMOTE_ADDR"
  L6_113 = L6_113(L7_114)
  ipaddr = L6_113
  L6_113 = db
  L6_113 = L6_113.getAttribute
  L7_114 = "OpenVPN"
  L8_115 = "_ROWID_"
  L9_116 = "1"
  L10_117 = "authServerId"
  L6_113 = L6_113(L7_114, L8_115, L9_116, L10_117)
  L7_114 = db
  L7_114 = L7_114.getAttribute
  L8_115 = "OpenVPN"
  L9_116 = "_ROWID_"
  L10_117 = "1"
  L11_118 = "ServerEnable"
  L7_114 = L7_114(L8_115, L9_116, L10_117, L11_118)
  if L7_114 == "0" then
    L8_115 = 3
    L9_116 = _UPVALUE0_
    L9_116 = L9_116.OPENVPN_NOT_ENABLED
    return L8_115, L9_116
  end
  if L6_113 ~= "0" then
    L8_115 = tonumber
    L9_116 = L6_113
    L8_115 = L8_115(L9_116)
    L9_116 = L8_115 % 10
    L8_115 = L8_115 - L9_116
    L10_117 = EXT_SERVER_ID_RADIUS
    if L8_115 == L10_117 then
      L10_117 = _UPVALUE1_
      L10_117 = L10_117.ExternalAuthRadius
      L11_118 = L1_108
      L12_119 = L2_109
      L13_120 = L9_116
      L14_121 = L5_112
      L12_119 = L10_117(L11_118, L12_119, L13_120, L14_121)
      if L10_117 == 0 or L10_117 == 1 then
        L13_120 = openvpn
        L13_120 = L13_120.RunTimelogin
        L14_121 = A0_107
        L15_122 = L13_120(L14_121)
        A0_107 = L15_122
        L4_111 = L14_121
        L3_110 = L13_120
        L13_120 = L3_110
        L14_121 = L4_111
        L15_122 = A0_107
        L16_123 = L12_119
        return L13_120, L14_121, L15_122, L16_123
      end
      L13_120 = L10_117
      L14_121 = L11_118
      L15_122 = A0_107
      L16_123 = L12_119
      return L13_120, L14_121, L15_122, L16_123
    else
      L10_117 = EXT_SERVER_ID_LDAP
      if L8_115 == L10_117 then
        L10_117 = _UPVALUE1_
        L10_117 = L10_117.ExternalAuthLdap
        L11_118 = L1_108
        L12_119 = L2_109
        L13_120 = L5_112
        L11_118 = L10_117(L11_118, L12_119, L13_120)
        if L10_117 == 0 then
          L12_119 = openvpn
          L12_119 = L12_119.RunTimelogin
          L13_120 = A0_107
          L14_121 = L12_119(L13_120)
          A0_107 = L14_121
          L4_111 = L13_120
          L3_110 = L12_119
          L12_119 = L3_110
          L13_120 = L4_111
          L14_121 = A0_107
          L15_122 = EXT_SERVER_DEF_IDLE_TIMEOUT
          return L12_119, L13_120, L14_121, L15_122
        end
        L12_119 = L10_117
        L13_120 = L11_118
        L14_121 = A0_107
        L15_122 = EXT_SERVER_DEF_IDLE_TIMEOUT
        return L12_119, L13_120, L14_121, L15_122
      else
        L10_117 = EXT_SERVER_ID_POP3
        if L8_115 == L10_117 then
          L10_117 = _UPVALUE1_
          L10_117 = L10_117.ExternalAuthPop3
          L11_118 = L1_108
          L12_119 = L2_109
          L13_120 = L5_112
          L11_118 = L10_117(L11_118, L12_119, L13_120)
          if L10_117 == 0 then
            L12_119 = openvpn
            L12_119 = L12_119.RunTimelogin
            L13_120 = A0_107
            L14_121 = L12_119(L13_120)
            A0_107 = L14_121
            L4_111 = L13_120
            L3_110 = L12_119
            L12_119 = L3_110
            L13_120 = L4_111
            L14_121 = A0_107
            L15_122 = EXT_SERVER_DEF_IDLE_TIMEOUT
            return L12_119, L13_120, L14_121, L15_122
          end
          L12_119 = L10_117
          L13_120 = L11_118
          L14_121 = A0_107
          L15_122 = EXT_SERVER_DEF_IDLE_TIMEOUT
          return L12_119, L13_120, L14_121, L15_122
        else
          L10_117 = EXT_SERVER_ID_AD
          if L8_115 == L10_117 then
            L10_117 = _UPVALUE1_
            L10_117 = L10_117.ExternalAuthActiveDirectory
            L11_118 = L1_108
            L12_119 = L2_109
            L13_120 = L5_112
            L11_118 = L10_117(L11_118, L12_119, L13_120)
            if L10_117 == 0 then
              L12_119 = openvpn
              L12_119 = L12_119.RunTimelogin
              L13_120 = A0_107
              L14_121 = L12_119(L13_120)
              A0_107 = L14_121
              L4_111 = L13_120
              L3_110 = L12_119
              L12_119 = L3_110
              L13_120 = L4_111
              L14_121 = A0_107
              L15_122 = EXT_SERVER_DEF_IDLE_TIMEOUT
              return L12_119, L13_120, L14_121, L15_122
            end
            L12_119 = L10_117
            L13_120 = L11_118
            L14_121 = A0_107
            L15_122 = EXT_SERVER_DEF_IDLE_TIMEOUT
            return L12_119, L13_120, L14_121, L15_122
          else
            L10_117 = EXT_SERVER_ID_NTDOMAIN
            if L8_115 == L10_117 then
              L10_117 = _UPVALUE1_
              L10_117 = L10_117.ExternalAuthNtDomain
              L11_118 = L1_108
              L12_119 = L2_109
              L13_120 = L5_112
              L11_118 = L10_117(L11_118, L12_119, L13_120)
              if L10_117 == 0 then
                L12_119 = openvpn
                L12_119 = L12_119.RunTimelogin
                L13_120 = A0_107
                L14_121 = L12_119(L13_120)
                A0_107 = L14_121
                L4_111 = L13_120
                L3_110 = L12_119
                L12_119 = L3_110
                L13_120 = L4_111
                L14_121 = A0_107
                L15_122 = EXT_SERVER_DEF_IDLE_TIMEOUT
                return L12_119, L13_120, L14_121, L15_122
              end
              L12_119 = L10_117
              L13_120 = L11_118
              L14_121 = A0_107
              L15_122 = EXT_SERVER_DEF_IDLE_TIMEOUT
              return L12_119, L13_120, L14_121, L15_122
            end
          end
        end
      end
    end
  else
    if L1_108 then
      L8_115 = db
      L8_115 = L8_115.existsRow
      L9_116 = "Users"
      L10_117 = "UserName"
      L11_118 = A0_107["Users.UserName"]
      L8_115 = L8_115(L9_116, L10_117, L11_118)
      if not L8_115 then
        L8_115 = loginLib
        L8_115 = L8_115.logLoginEvent
        L9_116 = 1
        L10_117 = L1_108
        L11_118 = ipaddr
        L8_115(L9_116, L10_117, L11_118)
        L8_115 = nil
        L9_116 = "Invalid username or password"
        return L8_115, L9_116
      end
    else
      L8_115 = nil
      L9_116 = "Invalid username or password"
      return L8_115, L9_116
    end
    L8_115 = ""
    L9_116 = "Invalid username or password"
    L10_117 = loginLib
    L10_117 = L10_117.userAuthenticate
    L11_118 = A0_107["Users.UserName"]
    L12_119 = A0_107["Users.Password"]
    L10_117 = L10_117(L11_118, L12_119)
    L8_115 = L10_117
    if L8_115 == "1" then
      L10_117 = util
      L10_117 = L10_117.appendDebugOut
      L11_118 = "VALID LOGIN!<br>"
      L10_117(L11_118)
      L10_117 = loginLib
      L10_117 = L10_117.getRandom
      L10_117 = L10_117()
      L11_118 = SAPI
      L11_118 = L11_118.Request
      L11_118 = L11_118.servervariable
      L12_119 = "REMOTE_ADDR"
      L11_118 = L11_118(L12_119)
      ipaddr = L11_118
      L11_118 = SAPI
      L11_118 = L11_118.Request
      L11_118 = L11_118.servervariable
      L12_119 = "SERVER_ADDR"
      L11_118 = L11_118(L12_119)
      serverAddr = L11_118
      L11_118 = ""
      L12_119 = login
      L12_119 = L12_119.parseReferer
      L13_120 = os
      L13_120 = L13_120.getenv
      L14_121 = "HTTP_REFERER"
      L24_131 = L13_120(L14_121)
      L12_119 = L12_119(L13_120, L14_121, L15_122, L16_123, L17_124, L18_125, L19_126, L20_127, L21_128, L22_129, L23_130, L24_131, L13_120(L14_121))
      L11_118 = L12_119
      L12_119 = db
      L12_119 = L12_119.getAttribute
      L13_120 = "ipAddressTable"
      L14_121 = "LogicalIfName"
      L15_122 = "LAN"
      L16_123 = "ipAddress"
      L12_119 = L12_119(L13_120, L14_121, L15_122, L16_123)
      L13_120 = A0_107["Users.UserName"]
      L14_121 = A0_107["Login.userAgent"]
      L15_122 = db
      L15_122 = L15_122.getAttribute
      L16_123 = "Users"
      L17_124 = "UserName"
      L18_125 = L13_120
      L19_126 = "GroupId"
      L15_122 = L15_122(L16_123, L17_124, L18_125, L19_126)
      L16_123 = login
      L16_123 = L16_123.cleanUpExpired
      L16_123()
      L16_123 = "LOGGED_IN"
      L17_124 = 0
      L18_125 = nil
      L19_126 = "None"
      L20_127 = login
      L20_127 = L20_127.verifyUserType
      L21_128 = L13_120
      L22_129 = "13"
      L20_127 = L20_127(L21_128, L22_129)
      if not L20_127 then
        L20_127 = -1
        L21_128 = "Invalid username Password for openvpn User"
        return L20_127, L21_128
      end
      L20_127 = login
      L20_127 = L20_127.verifyUserType
      L21_128 = L13_120
      L22_129 = "13"
      L20_127 = L20_127(L21_128, L22_129)
      if L20_127 then
        L20_127 = openvpn
        L20_127 = L20_127.getAdminLogin
        L21_128 = L13_120
        L20_127 = L20_127(L21_128)
        if L20_127 then
          L16_123 = "AUTHENTICATED"
          L17_124 = 1
          L18_125 = L20_127
          L19_126 = "OMNISSL__ALREADY_LOGGED_IN"
          L19_126 = "OmniSSL already logged in"
        end
      end
      L20_127 = timeLib
      L20_127 = L20_127.uptime
      L21_128 = L20_127()
      L22_129 = {}
      L22_129["OpenvpnSession.username"] = L13_120
      L23_130 = ipaddr
      L22_129["OpenvpnSession.ipaddr"] = L23_130
      L22_129["OpenvpnSession.RefererValue"] = L11_118
      L22_129["OpenvpnSession.cookie"] = L10_117
      L22_129["OpenvpnSession.loginTime"] = L21_128
      L22_129["OpenvpnSession.lastAccessTime"] = L21_128
      L22_129["OpenvpnSession.loginState"] = L16_123
      if L16_123 == "LOGGED_IN" then
        L23_130 = loginLib
        L23_130 = L23_130.logLoginEvent
        L24_131 = 4
        L23_130(L24_131, L13_120, ipaddr)
      end
      L23_130 = ""
      L24_131 = "ipaddr = '"
      L23_130 = L24_131 .. ipaddr .. "' AND cookie = '" .. L10_117 .. "'"
      L24_131 = db
      L24_131 = L24_131.existsRowWhere
      L24_131 = L24_131("OpenvpnSession", L23_130)
      if L24_131 then
        db.update("OpenvpnSession", L22_129, L24_131)
      else
        db.insert("OpenvpnSession", L22_129)
      end
      loginLib.writeCookieVal()
      cgilua.cookies.set("TeamF1OmniSSLLogin", L10_117)
      return L17_124, L19_126, A0_107
    else
      L10_117 = loginLib
      L10_117 = L10_117.logLoginEvent
      L11_118 = 3
      L12_119 = L1_108
      L13_120 = ipaddr
      L10_117(L11_118, L12_119, L13_120)
      L10_117 = nil
      L11_118 = L9_116
      return L10_117, L11_118
    end
  end
end
function openvpn.RunTimelogin(A0_132)
  local L1_133, L2_134, L3_135, L4_136, L5_137, L6_138, L7_139, L8_140, L9_141, L10_142, L11_143, L12_144, L13_145, L14_146, L15_147, L16_148, L17_149
  L1_133 = SAPI
  L1_133 = L1_133.Request
  L1_133 = L1_133.servervariable
  L2_134 = "REMOTE_ADDR"
  L1_133 = L1_133(L2_134)
  L2_134 = SAPI
  L2_134 = L2_134.Request
  L2_134 = L2_134.servervariable
  L3_135 = "SERVER_ADDR"
  L2_134 = L2_134(L3_135)
  L3_135 = ""
  L4_136 = login
  L4_136 = L4_136.parseReferer
  L5_137 = os
  L5_137 = L5_137.getenv
  L6_138 = "HTTP_REFERER"
  L17_149 = L5_137(L6_138)
  L4_136 = L4_136(L5_137, L6_138, L7_139, L8_140, L9_141, L10_142, L11_143, L12_144, L13_145, L14_146, L15_147, L16_148, L17_149, L5_137(L6_138))
  L3_135 = L4_136
  L4_136 = db
  L4_136 = L4_136.getAttribute
  L5_137 = "ipAddressTable"
  L6_138 = "LogicalIfName"
  L7_139 = "LAN"
  L8_140 = "ipAddress"
  L4_136 = L4_136(L5_137, L6_138, L7_139, L8_140)
  L5_137 = A0_132["Users.UserName"]
  L6_138 = A0_132["Login.userAgent"]
  L7_139 = util
  L7_139 = L7_139.appendDebugOut
  L8_140 = "VALID LOGIN!<br>"
  L7_139(L8_140)
  L7_139 = loginLib
  L7_139 = L7_139.getRandom
  L7_139 = L7_139()
  L8_140 = "LOGGED_IN"
  L9_141 = "None"
  L10_142 = 0
  L11_143 = openvpn
  L11_143 = L11_143.getAdminLogin
  L12_144 = L5_137
  L11_143 = L11_143(L12_144)
  if L11_143 then
    L8_140 = "AUTHENTICATED"
    L10_142 = 1
    returnRow = L11_143
    L9_141 = "OMNISSL__ALREADY_LOGGED_IN"
    L9_141 = "OmniSSL already logged in"
  end
  L12_144 = login
  L12_144 = L12_144.cleanUpExpired
  L12_144()
  L12_144 = timeLib
  L12_144 = L12_144.uptime
  L13_145 = L12_144()
  L14_146 = {}
  L14_146["OpenvpnSession.username"] = L5_137
  L14_146["OpenvpnSession.ipaddr"] = L1_133
  L14_146["OpenvpnSession.RefererValue"] = L3_135
  L14_146["OpenvpnSession.cookie"] = L7_139
  L14_146["OpenvpnSession.loginTime"] = L13_145
  L14_146["OpenvpnSession.lastAccessTime"] = L13_145
  L14_146["OpenvpnSession.loginState"] = L8_140
  if L8_140 == "LOGGED_IN" then
    L15_147 = loginLib
    L15_147 = L15_147.logLoginEvent
    L16_148 = 4
    L17_149 = L5_137
    L15_147(L16_148, L17_149, L1_133)
  end
  L15_147 = ""
  L16_148 = "ipaddr = '"
  L17_149 = L1_133
  L15_147 = L16_148 .. L17_149 .. "' AND cookie = '" .. L7_139 .. "'"
  L16_148 = nil
  L17_149 = db
  L17_149 = L17_149.existsRowWhere
  L17_149 = L17_149("OpenvpnSession", L15_147)
  if L17_149 then
    db.update("OpenvpnSession", L14_146, L17_149)
  else
    db.insert("OpenvpnSession", L14_146)
  end
  loginLib.writeCookieVal()
  cgilua.cookies.set("TeamF1OmniSSLLogin", L7_139)
  return L10_142, L9_141, A0_132
end
function openvpn.logout(A0_150, A1_151)
  local L2_152
  if A0_150 ~= nil then
    L2_152 = "ipaddr = '"
    L2_152 = L2_152 .. A1_151 .. "' AND cookie = '" .. A0_150 .. "'"
    db.deleteRowWhere("OpenvpnSession", L2_152)
    loginLib.writeCookieVal()
    return 0
  else
    L2_152 = 1
    return L2_152
  end
end
function openvpn.getAdminLogin(A0_153)
  local L1_154
  L1_154 = SAPI
  L1_154 = L1_154.Request
  L1_154 = L1_154.servervariable
  L1_154 = L1_154("REMOTE_ADDR")
  if db.getRows("OpenvpnSession", "username", A0_153) ~= nil then
    while db.getRows("OpenvpnSession", "username", A0_153)[1] ~= nil do
      if db.getAttribute("OpenVPN", "_ROWID_", "1", "authServerId") == "0" then
        if login.verifyUserType(A0_153, "13") and db.getRows("OpenvpnSession", "username", A0_153)[1]["OpenvpnSession.loginState"] == "LOGGED_IN" then
          return (db.getRows("OpenvpnSession", "username", A0_153))
        else
        end
      elseif db.getRows("OpenvpnSession", "username", A0_153)[1 + 1]["OpenvpnSession.loginState"] == "LOGGED_IN" then
        return (db.getRows("OpenvpnSession", "username", A0_153))
      else
      end
    end
    if db.getRows("OpenvpnSession", "ipaddr", L1_154) ~= nil then
      while db.getRows("OpenvpnSession", "ipaddr", L1_154)[1] ~= nil do
        if db.getRows("OpenvpnSession", "ipaddr", L1_154)[1]["OpenvpnSession.loginState"] == "LOGGED_IN" then
          return (db.getRows("OpenvpnSession", "ipaddr", L1_154))
        else
        end
      end
      return nil
    end
    return nil
  else
    return nil
  end
end
function openvpn.revalidate(A0_155, A1_156)
  local L2_157, L3_158, L4_159, L5_160, L6_161, L7_162, L8_163, L9_164, L10_165
  L2_157 = db
  L2_157 = L2_157.getAttribute
  L3_158 = "unitInfo"
  L4_159 = "_ROWID_"
  L5_160 = "1"
  L6_161 = "modelId"
  L2_157 = L2_157(L3_158, L4_159, L5_160, L6_161)
  L2_157 = L2_157 or ""
  L3_158 = ""
  L4_159 = "LOGGED_IN"
  L5_160 = "AUTHENTICATED"
  L6_161 = db
  L6_161 = L6_161.getAttribute
  L7_162 = "OpenVPN"
  L8_163 = "_ROWID_"
  L9_164 = "1"
  L10_165 = "authServerId"
  L6_161 = L6_161(L7_162, L8_163, L9_164, L10_165)
  if A0_155 == nil then
    L7_162 = util
    L7_162 = L7_162.appendDebugOut
    L8_163 = "PLEASE LOGIN - NOT LOGGED IN YET! - no cookie<br>"
    L7_162(L8_163)
    L7_162 = "NO_COOKIE"
    return L7_162
  else
    L7_162 = "ipaddr = '"
    L8_163 = A1_156
    L9_164 = "' AND cookie = '"
    L10_165 = A0_155
    L3_158 = L7_162 .. L8_163 .. L9_164 .. L10_165 .. "'"
    L7_162 = db
    L7_162 = L7_162.getRowWhere
    L8_163 = "OpenvpnSession"
    L9_164 = L3_158
    L7_162 = L7_162(L8_163, L9_164)
    L8_163 = timeLib
    L8_163 = L8_163.uptime
    L9_164 = L8_163()
    L10_165 = nil
    if L7_162 == nil then
      L10_165 = "PLEASE RELOGIN - LOGIN EXPIRED. Someone else " .. "killed your session.<br>"
      util.appendDebugOut(L10_165)
      statusMessage = "Session expired. Please login"
      return "NO_SESSION"
    elseif L7_162["OpenvpnSession.loginState"] == "DISCONNECTED" then
      util.appendDebugOut("YOU ARE DISCONNECTED!<br>")
      statusMessage = "Your session has been terminated"
      return "DISCONNECTED"
    elseif L7_162["OpenvpnSession.loginState"] == "AUTHENTICATED" then
      util.appendDebugOut("YOU ARE AUTHENTICATED!<br>")
      statusMessage = ""
      return "AUTHENTICATED"
    elseif L7_162["OpenvpnSession.loginState"] == "EXPIRED_PWD_CHANGED" then
      L10_165 = "YOU PASSWORD HAS BEEN CHANGED BY ADMINISTRATOR!<br>"
      util.appendDebugOut(L10_165)
      statusMessage = "Password changed by Administrator. Please " .. "login with new password"
      return "DISCONNECTED"
    elseif tonumber(db.getAttribute("Users", "UserName", L7_162["OpenvpnSession.username"], "UserTimeOut")) ~= nil and L6_161 == "0" and tonumber(db.getAttribute("Users", "UserName", L7_162["OpenvpnSession.username"], "UserTimeOut")) * 60 < L9_164 - tonumber(L7_162["OpenvpnSession.lastAccessTime"]) then
      db.deleteRowWhere("OpenvpnSession", L3_158)
      loginLib.writeCookieVal()
      L10_165 = "PLEASE RELOGIN - LOGIN EXPIRED! - " .. "you waited too long<br>"
      util.appendDebugOut(L10_165)
      statusMessage = "Session expired. Please login"
      return "EXPIRED_SESSION"
    elseif L6_161 ~= "0" and EXT_SERVER_DEF_IDLE_TIMEOUT * 60 < L9_164 - tonumber(L7_162["OpenvpnSession.lastAccessTime"]) then
      db.deleteRowWhere("OpenvpnSession", L3_158)
      loginLib.writeCookieVal()
      L10_165 = "PLEASE RELOGIN - LOGIN EXPIRED! - " .. "you waited too long<br>"
      util.appendDebugOut(L10_165)
      statusMessage = "Session expired. Please login"
      return "EXPIRED_SESSION"
    else
      util.appendDebugOut("YOU ARE ALREADY LOGGED IN!<br>")
      db.setAttributeWhere("OpenvpnSession", L3_158, "lastAccessTime", L9_164)
      statusMessage = ""
      return "OK"
    end
  end
end
function OpenVpnConfigPolicy.config(A0_166, A1_167, A2_168, A3_169)
  if db.typeAndRangeValidate(A0_166) then
    if A3_169 == "add" then
      return db.insert(A1_167, A0_166)
    elseif A3_169 == "edit" then
      return db.update(A1_167, A0_166, A2_168)
    end
  end
  return false
end
function openvpn.policyConfig(A0_170, A1_171, A2_172)
  local L3_173, L4_174
  L3_173 = 0
  L4_174 = ACCESS_LEVEL
  if L4_174 ~= 0 then
    L4_174 = "ACCESS_DENIED"
    return L4_174, "10187"
  end
  L4_174 = db
  L4_174 = L4_174.beginTransaction
  L4_174()
  L4_174 = false
  if A0_170["OpenVpnConfigPolicy.PolicyType"] == "global" then
    A0_170["OpenVpnConfigPolicy.PolicyOwnerName"] = "global"
  end
  if A2_172 == "add" then
    if db.existsRow("OpenVpnConfigPolicy", "PolicyName", A0_170["OpenVpnConfigPolicy.PolicyName"]) ~= false then
      db.rollback()
      return "ERROR", "14436"
    end
    if db.existsRow("OpenVpnConfigPolicy", "PolicyOwnerName", A0_170["OpenVpnConfigPolicy.PolicyOwnerName"]) ~= false then
      db.rollback()
      return "ERROR", "14436"
    end
  end
  if A0_170["OpenVpnConfigPolicy.DestinationObjectType"] == "1" then
    L3_173 = 1
    A0_170["OpenVpnConfigPolicy.DestinationObject"] = A0_170["OpenVpnConfigPolicy.Address"] .. ":" .. A0_170["OpenVpnConfigPolicy.StartPort"] .. "-" .. A0_170["OpenVpnConfigPolicy.EndPort"]
  elseif A0_170["OpenVpnConfigPolicy.DestinationObjectType"] == "2" then
    L3_173 = 2
    A0_170["OpenVpnConfigPolicy.DestinationObject"] = A0_170["OpenVpnConfigPolicy.Address"] .. "/" .. A0_170["OpenVpnConfigPolicy.MaskLength"] .. ":" .. A0_170["OpenVpnConfigPolicy.StartPort"] .. "-" .. A0_170["OpenVpnConfigPolicy.EndPort"]
  end
  if L3_173 == 1 then
    errorFlag, statusCode, field, skipValidations = validations.isEmpty(A0_170["OpenVpnConfigPolicy.PolicyName"], "Policy Name error")
    if errorFlag == "OK" or errorFlag == 0 then
      errorFlag, statusCode, field, skipValidations = validations.checkboxValidate(A0_170["OpenVpnConfigPolicy.DestinationObjectType"], "1", 1)
    end
    if errorFlag == "OK" or errorFlag == 0 then
      errorFlag, statusCode, field, skipValidations = validations.ipAddressValidate(A0_170["OpennennVpnConfigPolicy.Address"], "", "IP Address error")
    end
    if errorFlag == "OK" or errorFlag == 0 then
      errorFlag, statusCode, field, skipValidations = validations.rangeValidate(0, 65535, A0_170["OpenVpnConfigPolicy.StartPort"], A0_170["OpenVpnConfigPolicy.EndPort"], "Port start/end error")
    end
  else
    errorFlag, statusCode, field, skipValidations = validations.isEmpty(A0_170["OpenVpnConfigPolicy.PolicyName"], "Policy Name error")
    if errorFlag == "OK" or errorFlag == 0 then
      errorFlag, statusCode, field, skipValidations = validations.checkboxValidate(A0_170["OpenVpnConfigPolicy.DestinationObjectType"], "2", 2)
    end
    if errorFlag == "OK" or errorFlag == 0 then
      errorFlag, statusCode, field, skipValidations = validations.ipAddressValidate(A0_170["OpennennVpnConfigPolicy.Address"], "", "IP Address error")
    end
    if errorFlag == "OK" or errorFlag == 0 then
      errorFlag, statusCode, field, skipValidations = validations.rangeValidate(0, 32, A0_170["OpenVpnConfigPolicy.MaskLength"], "", "Mask Length error")
    end
    if errorFlag == "OK" or errorFlag == 0 then
      errorFlag, statusCode, field, skipValidations = validations.rangeValidate(0, 65535, A0_170["OpenVpnConfigPolicy.StartPort"], A0_170["OpenVpnConfigPolicy.EndPort"], "Port start/end error")
    end
  end
  if errorFlag == 1 or errorFlag == "ERROR" then
    statusCode = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE) or statusCode
  end
  if errorFlag == "OK" or errorFlag == 0 then
    L4_174 = OpenVpnConfigPolicy.config(A0_170, "OpenVpnConfigPolicy", A1_171, A2_172)
    if L4_174 then
      db.commitTransaction(true)
      db.save()
      return "OK", "12265"
    else
      db.rollback()
      return "ERROR", "14436"
    end
  else
    db.rollback()
    return errorFlag, statusCode
  end
end
function openvpn.deletePolicy(A0_175)
  local L1_176, L2_177, L3_178, L4_179, L5_180, L6_181, L7_182
  L1_176 = ACCESS_LEVEL
  if L1_176 ~= 0 then
    L1_176 = "ACCESS_DENIED"
    return L1_176, L2_177
  end
  L1_176 = db
  L1_176 = L1_176.beginTransaction
  L1_176()
  L1_176 = false
  for L5_180, L6_181 in L2_177(L3_178) do
    L7_182 = {}
    L7_182["OpenVpnConfigPolicy._ROWID_"] = L6_181
    L1_176 = db.delete("OpenVpnConfigPolicy", L7_182)
    if L1_176 == false then
      break
    end
  end
  if L1_176 then
    L2_177(L3_178)
    return L2_177, L3_178
  else
    L2_177()
    return L2_177, L3_178
  end
end
function openvpn.openvpnTlsConfigCreate(A0_183, A1_184)
  local L2_185, L3_186
  L3_186 = {}
  L3_186["OpenvpnTlsCertificates.name"] = A0_183["OpenvpnTlsCertificates.name"]
  L3_186["OpenvpnTlsCertificates.tlsCertData"] = A1_184
  if A1_184 then
    L3_186["OpenvpnTlsCertificates.tlsExist"] = "yes"
  else
    L3_186["OpenvpnTlsCertificates.tlsExist"] = "no"
  end
  L2_185 = db.insert("OpenvpnTlsCertificates", L3_186)
  if L2_185 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", errMsg
  end
end
function openvpn.openvpnCrlConfigCreate(A0_187, A1_188)
  local L2_189, L3_190
  L3_190 = {}
  L3_190["OpenvpnCrlCertificates.name"] = A0_187["OpenvpnCrlCertificates.name"]
  L3_190["OpenvpnCrlCertificates.crlCertData"] = A1_188
  if A1_188 then
    L3_190["OpenvpnCrlCertificates.crlExist"] = "yes"
  else
    L3_190["OpenvpnCrlCertificates.crlExist"] = "no"
  end
  L2_189 = db.insert("OpenvpnCrlCertificates", L3_190)
  if L2_189 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", errMsg
  end
end
