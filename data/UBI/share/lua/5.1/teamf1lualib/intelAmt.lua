require("teamf1lualib/db")
intelAmt = {}
function intelAmt.checkEnable(A0_0)
  local L1_1
  L1_1 = A0_0["IntelAmtPorts.enable_16992"]
  if L1_1 ~= "1" then
    L1_1 = A0_0["IntelAmtPorts.enable_16993"]
    if L1_1 ~= "1" then
      L1_1 = A0_0["IntelAmtPorts.enable_16994"]
      if L1_1 ~= "1" then
        L1_1 = A0_0["IntelAmtPorts.enable_16995"]
        if L1_1 ~= "1" then
          L1_1 = A0_0["IntelAmtPorts.enable_9971"]
        end
      end
    end
  else
    if L1_1 == "1" then
      L1_1 = "1"
      return L1_1
  end
  else
    L1_1 = "0"
    return L1_1
  end
end
function intelAmt.config(A0_2, A1_3, A2_4)
  local L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L12_14
  L3_5 = "0"
  L4_6 = "0"
  L5_7 = ""
  L6_8 = ""
  L7_9 = false
  L8_10 = ""
  STATUS_MSG = L8_10
  L8_10 = A0_2["IntelAmt.Status"]
  if L8_10 ~= nil then
    L3_5 = A0_2["IntelAmt.Status"]
  end
  L8_10 = A0_2["IntelAmt.AddressType"]
  if L8_10 ~= nil then
    L4_6 = A0_2["IntelAmt.AddressType"]
  end
  L8_10 = A0_2["IntelAmt.ExternalIpStr"]
  if L8_10 ~= nil then
    L5_7 = A0_2["IntelAmt.ExternalIpStr"]
  end
  L8_10 = A0_2["IntelAmt.LocalServerIp"]
  if L8_10 ~= nil then
    L6_8 = A0_2["IntelAmt.LocalServerIp"]
    if L3_5 == "1" and L4_6 == "1" and L5_7 == "" then
      L8_10 = "ERROR"
      L9_11 = "12749"
      return L8_10, L9_11
    end
    if L3_5 == "1" and L6_8 == "" then
      L8_10 = "ERROR"
      L9_11 = "10760"
      return L8_10, L9_11
    end
  end
  L8_10 = db
  L8_10 = L8_10.beginTransaction
  L8_10()
  if L3_5 == "0" then
    L8_10 = db
    L8_10 = L8_10.setAttribute
    L9_11 = "IntelAmt"
    L10_12 = "_ROWID_"
    L11_13 = "1"
    L12_14 = "Status"
    L8_10 = L8_10(L9_11, L10_12, L11_13, L12_14, L3_5)
    L7_9 = L8_10
  else
    L8_10 = {}
    temptable = L8_10
    L8_10 = temptable
    L8_10["IntelAmt.Status"] = L3_5
    L8_10 = temptable
    L8_10["IntelAmt.AddressType"] = L4_6
    L8_10 = temptable
    L8_10["IntelAmt.ExternalIpStr"] = L5_7
    L8_10 = temptable
    L8_10["IntelAmt.LocalServerIp"] = L6_8
    L8_10 = db
    L8_10 = L8_10.update
    L9_11 = "IntelAmt"
    L10_12 = temptable
    L11_13 = A1_3
    L8_10 = L8_10(L9_11, L10_12, L11_13)
    L7_9 = L8_10
  end
  L8_10 = A0_2["IntelAmtStart.enable"]
  if L8_10 == "1" then
    L9_11 = intelAmt
    L9_11 = L9_11.checkEnable
    L10_12 = A0_2
    L9_11 = L9_11(L10_12)
    if L9_11 == "0" then
      L7_9 = false
      L10_12 = "11932"
      STATUS_MSG = L10_12
    end
    L10_12 = "IntelAmtPorts"
    L11_13 = {}
    L12_14 = nil
    L12_14 = db.getAttribute(L10_12, "destPort", "16992", "_ROWID_")
    L11_13["IntelAmtPorts.enable"] = A0_2["IntelAmtPorts.enable_16992"]
    L11_13["IntelAmtPorts.srcPort"] = A0_2["IntelAmtPorts.srcPort_16992"]
    L7_9 = L7_9 and db.update(L10_12, L11_13, L12_14)
    L12_14 = db.getAttribute(L10_12, "destPort", "16993", "_ROWID_")
    L11_13["IntelAmtPorts.enable"] = A0_2["IntelAmtPorts.enable_16993"]
    L11_13["IntelAmtPorts.srcPort"] = A0_2["IntelAmtPorts.srcPort_16993"]
    L7_9 = L7_9 and db.update(L10_12, L11_13, L12_14)
    L12_14 = db.getAttribute(L10_12, "destPort", "16994", "_ROWID_")
    L11_13["IntelAmtPorts.enable"] = A0_2["IntelAmtPorts.enable_16994"]
    L11_13["IntelAmtPorts.srcPort"] = A0_2["IntelAmtPorts.srcPort_16994"]
    L7_9 = L7_9 and db.update(L10_12, L11_13, L12_14)
    L12_14 = db.getAttribute(L10_12, "destPort", "16995", "_ROWID_")
    L11_13["IntelAmtPorts.enable"] = A0_2["IntelAmtPorts.enable_16995"]
    L11_13["IntelAmtPorts.srcPort"] = A0_2["IntelAmtPorts.srcPort_16995"]
    L7_9 = L7_9 and db.update(L10_12, L11_13, L12_14)
    L12_14 = db.getAttribute(L10_12, "destPort", "9971", "_ROWID_")
    L11_13["IntelAmtPorts.enable"] = A0_2["IntelAmtPorts.enable_9971"]
    L11_13["IntelAmtPorts.srcPort"] = A0_2["IntelAmtPorts.srcPort_9971"]
    L7_9 = L7_9 and db.update(L10_12, L11_13, L12_14)
  end
  L9_11 = {}
  L10_12 = A0_2["IntelAmtStart.enable"]
  L9_11["IntelAmtStart.enable"] = L10_12
  if L7_9 then
    L10_12 = db
    L10_12 = L10_12.update
    L11_13 = "IntelAmtStart"
    L12_14 = L9_11
    L10_12 = L10_12(L11_13, L12_14, A1_3)
    L7_9 = L10_12
  end
  if L7_9 then
    L10_12 = db
    L10_12 = L10_12.commitTransaction
    L11_13 = true
    L10_12(L11_13)
    L10_12 = "OK"
    L11_13 = "12265"
    return L10_12, L11_13
  else
    L10_12 = db
    L10_12 = L10_12.rollback
    L10_12()
    L10_12 = "ERROR"
    L11_13 = STATUS_MSG
    return L10_12, L11_13
  end
end
