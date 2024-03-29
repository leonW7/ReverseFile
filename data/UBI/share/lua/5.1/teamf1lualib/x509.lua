require("x509Lib")
MAX_ITERATE_COUNT = 5
x509 = {}
cert = {}
function x509.inputValidate(A0_0, A1_1)
  do return db.typeAndRangeValidate(A0_0) end
  return false
end
function x509.uploadTrustedCACert(A0_2)
  local L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L12_14, L13_15, L14_16, L15_17, L16_18
  L1_3 = ACCESS_LEVEL
  if L1_3 ~= 0 then
    L1_3 = "uploadTrustedCertificate"
    NextPage = L1_3
    L1_3 = "ACCESS_DENIED"
    L2_4 = "10187"
    return L1_3, L2_4
  end
  L1_3 = db
  L1_3 = L1_3.beginTransaction
  L1_3()
  L1_3 = false
  L2_4 = util
  L2_4 = L2_4.appendDebugOut
  L3_5 = util
  L3_5 = L3_5.tableToStringRec
  L4_6 = A0_2
  L16_18 = L3_5(L4_6)
  L2_4(L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L12_14, L13_15, L14_16, L15_17, L16_18, L3_5(L4_6))
  L2_4 = A0_2["file.upload"]
  L2_4 = L2_4.filesize
  L3_5 = A0_2["file.upload"]
  L3_5 = L3_5.filename
  L4_6 = A0_2["file.upload"]
  L4_6 = L4_6.file
  L5_7 = cgilua
  L5_7 = L5_7.cookies
  L5_7 = L5_7.get
  L6_8 = "TeamF1Login"
  L5_7 = L5_7(L6_8)
  L6_8 = os
  L6_8 = L6_8.execute
  L7_9 = "mv"
  L8_10 = " "
  L9_11 = "/tmp/"
  L10_12 = L5_7
  L11_13 = " /tmp/"
  L12_14 = "temp.crt"
  L7_9 = L7_9 .. L8_10 .. L9_11 .. L10_12 .. L11_13 .. L12_14
  L6_8 = L6_8(L7_9)
  L7_9 = {}
  L8_10 = nil
  L9_11 = util
  L9_11 = L9_11.fileToString
  L10_12 = "/tmp/temp.crt"
  L9_11 = L9_11(L10_12)
  L8_10 = L9_11
  L9_11 = x509Lib
  L9_11 = L9_11.certLoad
  L10_12 = L8_10
  L11_13 = "ca"
  L15_17 = L9_11(L10_12, L11_13)
  L16_18 = os
  L16_18 = L16_18.execute
  L16_18 = L16_18("rm" .. " /tmp/" .. "temp.crt")
  if L9_11 == -1 then
    return "ERROR", "10383"
  end
  L7_9["cert.name"] = L10_12
  L7_9["cert.subjectName"] = L11_13
  L7_9["cert.issuerName"] = L12_14
  L7_9["cert.expiryTime"] = L13_15
  L7_9["cert.serialNumber"] = L14_16
  L7_9["cert.format"] = L15_17
  L7_9["cert.certType"] = "ca"
  L7_9["cert.certData"] = L8_10
  L16_18 = db.insert("cert", L7_9)
  if L16_18 then
    db.commitTransaction(true)
    return "OK", "10179"
  else
    db.rollback()
    return "ERROR", "10369"
  end
end
function x509.trustedCACertDelete(A0_19)
  local L1_20, L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27, L9_28, L10_29, L11_30, L12_31, L13_32
  L1_20 = require
  L2_21 = "socket"
  L1_20(L2_21)
  L1_20 = nil
  L2_21 = 0
  if L3_22 ~= 0 then
    return L3_22, L4_23
  end
  L3_22()
  for L6_25, L7_26 in L3_22(L4_23) do
    L8_27 = {}
    L8_27["cert._ROWID_"] = L7_26
    L9_28 = db
    L9_28 = L9_28.getAttribute
    L10_29 = "cert"
    L11_30 = "cert._ROWID_"
    L12_31 = L7_26
    L13_32 = "subjectName"
    L9_28 = L9_28(L10_29, L11_30, L12_31, L13_32)
    L10_29 = "issuerName = '"
    L11_30 = L9_28
    L12_31 = "' AND certType = 'self'"
    L10_29 = L10_29 .. L11_30 .. L12_31
    L11_30 = db
    L11_30 = L11_30.getRowsWhere
    L12_31 = "cert"
    L13_32 = L10_29
    L11_30 = L11_30(L12_31, L13_32)
    if L11_30 then
      L12_31 = #L11_30
      if L12_31 >= 1 then
        L12_31 = "ERROR"
        L13_32 = "10372"
        return L12_31, L13_32
      end
    end
    L12_31 = x509Lib
    L12_31 = L12_31.getCertHash
    L13_32 = L7_26
    L13_32 = L12_31(L13_32)
    if L12_31 == -1 then
      return "ERROR", "10373"
    end
    for _FORV_17_ = 0, MAX_ITERATE_COUNT do
      L1_20 = db.delete("cert", L8_27)
      if not L1_20 then
        socket.sleep(1)
      else
        break
      end
    end
    if L1_20 then
      os.execute("rm" .. " /var/certs/ca/" .. L13_32 .. ".0")
      os.execute("rm" .. " /var/certs/ca/" .. "CA" .. L7_26 .. ".crt")
    end
  end
  if L1_20 then
    L3_22(L4_23)
    return L3_22, L4_23
  else
    L3_22()
    return L3_22, L4_23
  end
end
function x509.activeSelfCertDelete(A0_33)
  local L1_34, L2_35, L3_36, L4_37, L5_38, L6_39, L7_40
  if L1_34 ~= 0 then
    return L1_34, L2_35
  end
  L1_34()
  for L4_37, L5_38 in L1_34(L2_35) do
    L6_39 = {}
    L6_39["cert._ROWID_"] = L5_38
    L7_40 = db
    L7_40 = L7_40.getAttribute
    L7_40 = L7_40("cert", "cert._ROWID_", L5_38, "subjectName")
    db.setAttribute("x509SelfCertReq", "subjectName", L7_40, "requestStatus", 0)
    selfCertReqRow = db.getRow("x509SelfCertReq", "subjectName", L7_40)
    valid = db.delete("cert", L6_39)
    if valid then
      if selfCertReqRow["x509SelfCertReq.appType"] == "https" and db.getAttribute("x509SelfCertReq", "subjectName", L7_40, "requestStatus") == "2" then
        os.execute("rm -f /var/sslvpn/var/cert/server.crt")
        os.execute("rm -f /var/sslvpn/var/cert/server.key")
        os.execute("ln -s /var/certs/self/default/https.crt /var/sslvpn/var/cert/server.crt")
        os.execute("ln -s /var/certs/self/default/https.key /var/sslvpn/var/cert/server.key")
      end
      if db.getAttribute("x509SelfCertReq", "subjectName", L7_40, "requestStatus") == "2" then
        os.execute("rm -f" .. " /var/certs/self/" .. selfCertReqRow["x509SelfCertReq.appType"] .. ".crt")
        os.execute("rm -f" .. " /var/certs/self/" .. selfCertReqRow["x509SelfCertReq.appType"] .. ".key")
        os.execute("ln -s" .. " /var/cert/self/default/https.crt /var/certs/self/" .. selfCertReqRow["x509SelfCertReq.appType"] .. ".crt")
        os.execute("ln -s" .. " /var/cert/self/default/https.key /var/certs/self/" .. selfCertReqRow["x509SelfCertReq.appType"] .. ".key")
      end
      os.execute("rm -f" .. " /var/certs/self/" .. selfCertReqRow["x509SelfCertReq.appType"] .. L5_38 .. ".crt")
      os.execute("rm -f" .. " /var/certs/self/" .. selfCertReqRow["x509SelfCertReq.appType"] .. L5_38 .. ".key")
      if selfCertReqRow["x509SelfCertReq.appType"] == "https" and db.getAttribute("x509SelfCertReq", "subjectName", L7_40, "requestStatus") == "2" then
        httpsMgmtRow = db.getRow("httpsMgmt", "_ROWID_", "1")
        if httpsMgmtRow then
          if httpsMgmtRow["httpsMgmt.certEvent"] ~= "0" then
            httpsMgmtRow["httpsMgmt.certEvent"] = "0"
          elseif httpsMgmtRow["httpsMgmt.certEvent"] == "0" then
            httpsMgmtRow["httpsMgmt.certEvent"] = "1"
          end
          valid1 = db.update("httpsMgmt", httpsMgmtRow, "1")
        end
      end
      db.commitTransaction(true)
    else
      db.rollback()
    end
  end
  if L1_34 then
    return L1_34, L2_35
  else
    return L1_34, L2_35
  end
end
function x509.genSelfCert(A0_41)
  local L1_42
  L1_42 = ACCESS_LEVEL
  if L1_42 ~= 0 then
    L1_42 = "generateSelfCertificateRequest"
    NextPage = L1_42
    L1_42 = "ACCESS_DENIED"
    return L1_42, "10187"
  end
  L1_42 = db
  L1_42 = L1_42.beginTransaction
  L1_42()
  L1_42 = false
  if string.find(A0_41["x509SelfCertReq.subjectName"], "=") == nil and string.find(A0_41["x509SelfCertReq.subjectName"], "=") == nil then
    A0_41["x509SelfCertReq.subjectName"] = "CN=" .. A0_41["x509SelfCertReq.subjectName"]
  end
  if db.existsRow("x509SelfCertReq", "subjectName", A0_41["x509SelfCertReq.subjectName"]) then
    db.rollback()
    return "ERROR", "13267"
  end
  if db.existsRow("x509SelfCertReq", "requestName", A0_41["x509SelfCertReq.requestName"]) then
    db.rollback()
    return "ERROR", "13268"
  end
  L1_42 = db.insert("x509SelfCertReq", A0_41)
  if L1_42 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10871"
  end
end
function x509.selfCertDelete(A0_43)
  local L1_44, L2_45, L3_46, L4_47, L5_48, L6_49, L7_50, L8_51, L9_52
  if L1_44 ~= 0 then
    return L1_44, L2_45
  end
  L1_44()
  for L4_47, L5_48 in L1_44(L2_45) do
    L6_49 = {}
    L6_49["x509SelfCertReq._ROWID_"] = L5_48
    L7_50 = db
    L7_50 = L7_50.getAttribute
    L8_51 = "x509SelfCertReq"
    L9_52 = "x509SelfCertReq._ROWID_"
    L7_50 = L7_50(L8_51, L9_52, L5_48, "subjectName")
    L8_51 = db
    L8_51 = L8_51.getAttribute
    L9_52 = "x509SelfCertReq"
    L8_51 = L8_51(L9_52, "x509SelfCertReq._ROWID_", L5_48, "appType")
    L9_52 = "certType = 'self'"
    L9_52 = L9_52 .. " AND subjectName = '" .. L7_50 .. "'"
    if db.getRowsWhere("cert", L9_52) and #db.getRowsWhere("cert", L9_52) >= 1 then
      db.rollback()
      return "ERROR", "13263"
    end
    valid = db.delete("x509SelfCertReq", L6_49)
    if valid then
      os.execute("rm -f /var/certs/self/" .. L8_51 .. L5_48 .. ".csr")
      db.commitTransaction(true)
    else
      db.rollback()
    end
  end
  if L1_44 then
    return L1_44, L2_45
  else
    return L1_44, L2_45
  end
end
function x509.uploadSelfCert(A0_53)
  local L1_54, L2_55, L3_56, L4_57, L5_58, L6_59, L7_60, L8_61, L9_62, L10_63, L11_64, L12_65, L13_66, L14_67, L15_68, L16_69
  L1_54 = ACCESS_LEVEL
  if L1_54 ~= 0 then
    L1_54 = "uploadActiveSelfCertificate"
    NextPage = L1_54
    L1_54 = "ACCESS_DENIED"
    L2_55 = "10187"
    return L1_54, L2_55
  end
  L1_54 = db
  L1_54 = L1_54.beginTransaction
  L1_54()
  L1_54 = false
  L2_55 = util
  L2_55 = L2_55.appendDebugOut
  L3_56 = util
  L3_56 = L3_56.tableToStringRec
  L4_57 = A0_53
  L16_69 = L3_56(L4_57)
  L2_55(L3_56, L4_57, L5_58, L6_59, L7_60, L8_61, L9_62, L10_63, L11_64, L12_65, L13_66, L14_67, L15_68, L16_69, L3_56(L4_57))
  L2_55 = A0_53["file.upload"]
  L2_55 = L2_55.filesize
  L3_56 = A0_53["file.upload"]
  L3_56 = L3_56.filename
  L4_57 = A0_53["file.upload"]
  L4_57 = L4_57.file
  L5_58 = cgilua
  L5_58 = L5_58.cookies
  L5_58 = L5_58.get
  L6_59 = "TeamF1Login"
  L5_58 = L5_58(L6_59)
  L6_59 = os
  L6_59 = L6_59.execute
  L7_60 = "mv"
  L8_61 = " "
  L9_62 = "/tmp/"
  L10_63 = L5_58
  L11_64 = " /tmp/"
  L12_65 = "temp.crt"
  L7_60 = L7_60 .. L8_61 .. L9_62 .. L10_63 .. L11_64 .. L12_65
  L6_59 = L6_59(L7_60)
  L7_60 = {}
  L8_61 = nil
  L9_62 = util
  L9_62 = L9_62.fileToString
  L10_63 = "/tmp/temp.crt"
  L9_62 = L9_62(L10_63)
  L8_61 = L9_62
  L9_62 = x509Lib
  L9_62 = L9_62.certLoad
  L10_63 = L8_61
  L11_64 = "self"
  L15_68 = L9_62(L10_63, L11_64)
  L16_69 = os
  L16_69 = L16_69.execute
  L16_69 = L16_69("rm" .. " /tmp/" .. "temp.crt")
  if L9_62 == -1 then
    return "ERROR", "10382"
  elseif L9_62 == 27 then
    return "ERROR", "11435"
  elseif L9_62 == 26 then
    return "ERROR", "11049"
  end
  L7_60["cert.name"] = L10_63
  L7_60["cert.subjectName"] = L11_64
  L7_60["cert.issuerName"] = L12_65
  L7_60["cert.expiryTime"] = L13_66
  L7_60["cert.serialNumber"] = L14_67
  L7_60["cert.format"] = L15_68
  L7_60["cert.certType"] = "self"
  L7_60["cert.certData"] = L8_61
  if db.existsRow("cert", "subjectName", L11_64) then
    db.rollback()
    return "ERROR", "13264"
  end
  L16_69 = db.insert("cert", L7_60)
  if L16_69 then
    db.commitTransaction(true)
    return "OK", "10177"
  else
    db.rollback()
    return "ERROR", "10367"
  end
end
function x509.markCertDefault(A0_70)
  local L1_71, L2_72, L3_73, L4_74, L5_75, L6_76, L7_77, L8_78, L9_79, L10_80
  if L1_71 ~= 0 then
    return L1_71, L2_72
  end
  L1_71()
  for L4_74, L5_75 in L1_71(L2_72) do
    L6_76 = {}
    L6_76["cert._ROWID_"] = L5_75
    L7_77 = db
    L7_77 = L7_77.getAttribute
    L8_78 = "cert"
    L9_79 = "cert._ROWID_"
    L10_80 = L5_75
    L7_77 = L7_77(L8_78, L9_79, L10_80, "subjectName")
    L8_78 = db
    L8_78 = L8_78.getAttribute
    L9_79 = "x509SelfCertReq"
    L10_80 = "subjectName"
    L8_78 = L8_78(L9_79, L10_80, L7_77, "appType")
    L9_79 = "requestStatus = 2"
    L10_80 = " AND appType = '"
    L9_79 = L9_79 .. L10_80 .. L8_78 .. "'"
    L10_80 = db
    L10_80 = L10_80.getRowsWhere
    L10_80 = L10_80("x509SelfCertReq", L9_79)
    if L10_80 then
      for _FORV_14_, _FORV_15_ in pairs(L10_80) do
        db.setAttribute("x509SelfCertReq", "subjectName", _FORV_15_["x509SelfCertReq.subjectName"], "requestStatus", 1)
      end
    end
    if db.setAttribute("x509SelfCertReq", "subjectName", L7_77, "requestStatus", 2) ~= false then
      if L8_78 == "https" then
        os.execute("rm -f /var/sslvpn/var/cert/server.crt")
        os.execute("rm -f /var/sslvpn/var/cert/server.key")
      end
      os.execute("rm -f /var/certs/self/" .. L8_78 .. ".crt")
      os.execute("rm -f /var/certs/self/" .. L8_78 .. ".key")
      os.execute("cp " .. "/var/certs/self/" .. L8_78 .. L5_75 .. ".crt " .. "/var/certs/self/" .. L8_78 .. ".crt")
      os.execute("cp " .. "/var/certs/self/" .. L8_78 .. L5_75 .. ".key " .. "/var/certs/self/" .. L8_78 .. ".key")
      if L8_78 == "https" then
        os.execute("ln -s /var/certs/self/https.crt /var/sslvpn/var/cert/server.crt")
        os.execute("ln -s /var/certs/self/https.key /var/sslvpn/var/cert/server.key")
        httpsMgmtRow = db.getRow("httpsMgmt", "_ROWID_", "1")
        if httpsMgmtRow then
          if httpsMgmtRow["httpsMgmt.certEvent"] ~= "0" then
            httpsMgmtRow["httpsMgmt.certEvent"] = "0"
          elseif httpsMgmtRow["httpsMgmt.certEvent"] == "0" then
            httpsMgmtRow["httpsMgmt.certEvent"] = "1"
          end
          valid1 = db.update("httpsMgmt", httpsMgmtRow, "1")
        end
      end
      db.commitTransaction(true)
      return "OK", "13265"
    else
      db.rollback()
      return "ERROR", "13266"
    end
  end
end
