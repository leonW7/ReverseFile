require("teamf1lualib/db")
require("teamf1lualib/cfpDefines")
cfp = {}
cfp.advQos = {}
cfp.advVlan = {}
cfp.vlanPolicy = {}
cfp.macDstPolicy = {}
cfp.macSrcPolicy = {}
cfp.ipDstAddrPolicy = {}
cfp.ipSrcAddrPolicy = {}
cfp.l4TcpSrcPolicy = {}
cfp.l4TcpDstPolicy = {}
cfp.l4UdpSrcPolicy = {}
cfp.l4UdpDstPolicy = {}
cfp.sip = {}
cfp.h323 = {}
cfp.localDebug = 2
function cfp.debug(A0_0)
  if cfp.localDebug == 1 then
    print(A0_0)
  elseif cfp.localDebug == 2 then
    util.appendDebugOut(A0_0)
  end
end
function cfp.advQos.policyAdd(A0_1)
  local L1_2, L2_3, L3_4, L4_5
  L4_5 = {}
  if cfp.checkMaxRules() == false then
    return cfpDef.ERROR, cfpDef.retString.invalidArg
  end
  L4_5[cfpDef.advQos.attrName] = A0_1[cfpDef.advQos.OIDname]
  L4_5[cfpDef.advQos.attrType] = A0_1[cfpDef.advQos.OIDType]
  L4_5[cfpDef.advQos.attrVlan] = A0_1[cfpDef.advQos.OIDVlan]
  L4_5[cfpDef.advQos.attrPriority] = A0_1[cfpDef.advQos.OIDPriority]
  L4_5[cfpDef.advQos.attrPort] = A0_1[cfpDef.advQos.OIDPort]
  L4_5[cfpDef.advQos.attrVlan] = A0_1[cfpDef.advQos.OIDVlan]
  L4_5[cfpDef.advQos.attrMacDstAddr] = A0_1[cfpDef.advQos.OIDMacDstAddr]
  L4_5[cfpDef.advQos.attrMacSrcAddr] = A0_1[cfpDef.advQos.OIDMacSrcAddr]
  L4_5[cfpDef.advQos.attrIPDstAddr] = A0_1[cfpDef.advQos.OIDIPDstAddr]
  L4_5[cfpDef.advQos.attrIPSrcAddr] = A0_1[cfpDef.advQos.OIDIPSrcAddr]
  L4_5[cfpDef.advQos.attrTCPDstPort] = A0_1[cfpDef.advQos.OIDTCPDstPort]
  L4_5[cfpDef.advQos.attrTCPSrcPort] = A0_1[cfpDef.advQos.OIDTCPSrcPort]
  L4_5[cfpDef.advQos.attrUDPDstPort] = A0_1[cfpDef.advQos.OIDUDPDstPort]
  L4_5[cfpDef.advQos.attrUDPSrcPort] = A0_1[cfpDef.advQos.OIDUDPSrcPort]
  if L4_5 == nil or L4_5[cfpDef.advQos.attrName] == nil or L4_5[cfpDef.advQos.attrPriority] == nil or L4_5[cfpDef.advQos.attrPort] == nil then
    cfp.debug("policyAdd: encounterd a null in the input")
    return cfpDef.ERROR, cfpDef.retString.invalidArg
  end
  L1_2, L2_3 = cfp.policyCheck(L4_5[cfpDef.advQos.attrName])
  if L1_2 == cfpDef.ERROR then
    cfp.debug("policyAdd: policyCheck failed")
    return L1_2, L2_3
  end
  L3_4 = tonumber(L4_5[cfpDef.advQos.attrType])
  if L3_4 == cfpDef.advQos.vlan then
    L1_2, L2_3 = cfp.vlanPolicy.set(L4_5)
  elseif L3_4 == cfpDef.advQos.macDstAddr then
    L1_2, L2_3 = cfp.macDstPolicy.set(L4_5)
  elseif L3_4 == cfpDef.advQos.macSrcAddr then
    L1_2, L2_3 = cfp.macSrcPolicy.set(L4_5)
  elseif L3_4 == cfpDef.advQos.IPDstAddr then
    L1_2, L2_3 = cfp.ipDstAddrPolicy.set(L4_5)
  elseif L3_4 == cfpDef.advQos.IPSrcAddr then
    L1_2, L2_3 = cfp.ipSrcAddrPolicy.set(L4_5)
  elseif L3_4 == cfpDef.advQos.tcpSrcPort then
    L1_2, L2_3 = cfp.l4TcpSrcPolicy.set(L4_5)
  elseif L3_4 == cfpDef.advQos.tcpDstPort then
    L1_2, L2_3 = cfp.l4TcpDstPolicy.set(L4_5)
  elseif L3_4 == cfpDef.advQos.udpSrcPort then
    L1_2, L2_3 = cfp.l4UdpSrcPolicy.set(L4_5)
  elseif L3_4 == cfpDef.advQos.udpDstPort then
    L1_2, L2_3 = cfp.l4UdpDstPolicy.set(L4_5)
  else
    cfp.debug("policyAdd: policyType " .. L3_4 .. "not matched with known types")
    return cfpDef.ERROR, cfpDef.retString.statusErr
  end
  if L1_2 == 0 then
    return cfpDef.SUCCESS, cfpDef.retString.statusOk
  else
    return L1_2, L2_3
  end
  cfp.debug("policyAdd: policyType " .. L3_4 .. " not matched with known types")
  return cfpDef.ERROR, cfpDef.retString.invalidArg
end
function cfp.advQos.policyDelete(A0_6)
  local L1_7, L2_8, L3_9, L4_10, L5_11, L6_12, L7_13, L8_14, L9_15
  L4_10 = {}
  for L8_14, L9_15 in L5_11(L6_12) do
    advQosTable = db.getRow(cfpDef.advQos.className, "_ROWID_", L9_15)
    L4_10[cfpDef.advQos.attrName] = advQosTable[cfpDef.advQos.OIDname]
    L4_10[cfpDef.advQos.attrType] = advQosTable[cfpDef.advQos.OIDType]
    L4_10[cfpDef.advQos.attrVlan] = advQosTable[cfpDef.advQos.OIDVlan]
    L4_10[cfpDef.advQos.attrPriority] = advQosTable[cfpDef.advQos.OIDPriority]
    L4_10[cfpDef.advQos.attrPort] = advQosTable[cfpDef.advQos.OIDPort]
    L4_10[cfpDef.advQos.attrVlan] = advQosTable[cfpDef.advQos.OIDVlan]
    L4_10[cfpDef.advQos.attrMacDstAddr] = advQosTable[cfpDef.advQos.OIDMacDstAddr]
    L4_10[cfpDef.advQos.attrMacSrcAddr] = advQosTable[cfpDef.advQos.OIDMacSrcAddr]
    L4_10[cfpDef.advQos.attrIPDstAddr] = advQosTable[cfpDef.advQos.OIDIPDstAddr]
    L4_10[cfpDef.advQos.attrIPSrcAddr] = advQosTable[cfpDef.advQos.OIDIPSrcAddr]
    L4_10[cfpDef.advQos.attrTCPDstPort] = advQosTable[cfpDef.advQos.OIDTCPDstPort]
    L4_10[cfpDef.advQos.attrTCPSrcPort] = advQosTable[cfpDef.advQos.OIDTCPSrcPort]
    L4_10[cfpDef.advQos.attrUDPDstPort] = advQosTable[cfpDef.advQos.OIDUDPDstPort]
    L4_10[cfpDef.advQos.attrUDPSrcPort] = advQosTable[cfpDef.advQos.OIDUDPSrcPort]
    cfp.debug("xxx: " .. type(L4_10[cfpDef.advQos.attrName]) .. " xxx")
    if L4_10[cfpDef.advQos.attrName] == nil then
      return cfpDef.ERROR, cfpDef.retString.invalidArg
    end
    L3_9 = tonumber(L4_10[cfpDef.advQos.attrType])
    if L3_9 == cfpDef.advQos.vlan then
      L1_7, L2_8 = cfp.vlanPolicy.del(L4_10)
    elseif L3_9 == cfpDef.advQos.macDstAddr then
      L1_7, L2_8 = cfp.macDstPolicy.del(L4_10)
    elseif L3_9 == cfpDef.advQos.macSrcAddr then
      L1_7, L2_8 = cfp.macSrcPolicy.del(L4_10)
    elseif L3_9 == cfpDef.advQos.IPDstAddr then
      L1_7, L2_8 = cfp.ipDstAddrPolicy.del(L4_10)
    elseif L3_9 == cfpDef.advQos.IPSrcAddr then
      L1_7, L2_8 = cfp.ipSrcAddrPolicy.del(L4_10)
    elseif L3_9 == cfpDef.advQos.tcpSrcPort then
      L1_7, L2_8 = cfp.l4TcpSrcPolicy.del(L4_10)
    elseif L3_9 == cfpDef.advQos.tcpDstPort then
      L1_7, L2_8 = cfp.l4TcpDstPolicy.del(L4_10)
    elseif L3_9 == cfpDef.advQos.udpSrcPort then
      L1_7, L2_8 = cfp.l4UdpSrcPolicy.del(L4_10)
    elseif L3_9 == cfpDef.advQos.udpDstPort then
      L1_7, L2_8 = cfp.l4UdpDstPolicy.del(L4_10)
    else
      cfp.debug("policyAdd: policyType " .. L3_9 .. "not matched with known types")
      return cfpDef.ERROR, cfpDef.retString.statusErr
    end
  end
  if L1_7 == 0 then
    return L5_11, L6_12
  else
    return L5_11, L6_12
  end
end
function cfp.advQos.policyEdit(A0_16)
  cfp.advQos.policyDelete(A0_16)
  return cfp.advQos.policyAdd(A0_16)
end
function cfp.deletePolicyByName(A0_17)
  if A0_17 == nil then
    cfp.debug("deletePolicyByName: nil policyName")
    return cfpDef.ERROR, cfpDef.retString.invalidArg
  end
  cfp.debug("deletePolicyByName: deleting policy with name " .. A0_17)
  return db.deleteRow(cfpDef.advQos.className, cfpDef.advQos.attrName, A0_17)
end
function cfp.policyCheck(A0_18)
  local L1_19, L2_20, L3_21
  if A0_18 == nil then
    cfp.debug("policyCheck: input policyName is nil ")
    return cfpDef.ERROR, cfpDef.retString.invalidArg
  end
  L3_21 = db.getRow(cfpDef.advQos.className, cfpDef.advQos.attrName, A0_18)
  if L3_21 ~= nil then
    cfp.debug("policyCheck: Another policy exists with same name ")
    return cfpDef.ERROR, cfpDef.advQos.nameConflict
  else
    cfp.debug("policyCheck: policyName " .. A0_18 .. " is acceptable")
    return cfpDef.SUCCESS, cfpDef.retString.statusOk
  end
end
function cfp.vlanPolicy.set(A0_22)
  local L1_23, L2_24, L3_25, L4_26, L5_27, L6_28
  L6_28 = cfpDef
  L6_28 = L6_28.advQos
  L6_28 = L6_28.attrVlan
  L3_25 = A0_22[L6_28]
  L6_28 = cfpDef
  L6_28 = L6_28.advQos
  L6_28 = L6_28.attrPriority
  L4_26 = A0_22[L6_28]
  L6_28 = cfpDef
  L6_28 = L6_28.advQos
  L6_28 = L6_28.attrName
  L5_27 = A0_22[L6_28]
  if L3_25 == nil or L4_26 == nil or L5_27 == nil then
    L6_28 = cfp
    L6_28 = L6_28.debug
    L6_28("vlanPolicy.set vlan " .. L3_25 .. " priority " .. L4_26 .. " policyName" .. L5_27)
    L6_28 = cfpDef
    L6_28 = L6_28.ERROR
    return L6_28, cfpDef.retString.invalidArg
  end
  L6_28 = "vlan="
  L6_28 = L6_28 .. L3_25
  query = L6_28
  L6_28 = cfp
  L6_28 = L6_28.debug
  L6_28("SQL Query: " .. query)
  L6_28 = db
  L6_28 = L6_28.getRowWhere
  L6_28 = L6_28(cfpDef.advQos.className, query, false)
  rows = L6_28
  L6_28 = rows
  if L6_28 ~= nil then
    L6_28 = cfp
    L6_28 = L6_28.debug
    L6_28("vlanPolicy.set found rows with vlan " .. L3_25)
    L6_28 = cfpDef
    L6_28 = L6_28.retString
    L6_28 = L6_28.statusErr
    return L6_28, cfpDef.retString.policyConflict
  else
    L6_28 = cfp
    L6_28 = L6_28.debug
    L6_28("No conflicting polocies with Name: " .. L5_27)
  end
  L6_28 = {}
  L6_28[cfpDef.advQos.OIDname] = A0_22[cfpDef.advQos.attrName]
  L6_28[cfpDef.advQos.OIDType] = A0_22[cfpDef.advQos.attrType]
  L6_28[cfpDef.advQos.OIDVlan] = A0_22[cfpDef.advQos.attrVlan]
  L6_28[cfpDef.advQos.OIDPriority] = A0_22[cfpDef.advQos.attrPriority]
  L6_28[cfpDef.advQos.OIDPort] = A0_22[cfpDef.advQos.attrPort]
  L6_28[cfpDef.advQos.OIDDesc] = cfpDef.advQos.vlanPolicyStr .. ":" .. L3_25 .. " Ports:" .. A0_22[cfpDef.advQos.attrPort]
  cfp.debug(cfpDef.advQos.OIDname .. " " .. L6_28[cfpDef.advQos.OIDname])
  cfp.debug(cfpDef.advQos.OIDType .. " " .. L6_28[cfpDef.advQos.OIDType])
  cfp.debug(cfpDef.advQos.OIDVlan .. " " .. L6_28[cfpDef.advQos.OIDVlan])
  cfp.debug(cfpDef.advQos.OIDPriority .. " " .. L6_28[cfpDef.advQos.OIDPriority])
  cfp.debug(cfpDef.advQos.OIDDesc .. " " .. L6_28[cfpDef.advQos.OIDDesc])
  L1_23, L2_24 = db.insert(cfpDef.advQos.className, L6_28)
  cfp.debug(tostring(L1_23) .. L2_24)
  return L1_23, L2_24
end
function cfp.vlanPolicy.del(A0_29)
  cfp.debug("vlanPolicy.del deleting vlan based policy ")
  return cfp.deletePolicyByName(A0_29[cfpDef.advQos.attrName])
end
function cfp.macDstPolicy.set(A0_30)
  local L1_31, L2_32, L3_33, L4_34, L5_35, L6_36
  L3_33 = cfpDef
  L3_33 = L3_33.advQos
  L3_33 = L3_33.attrMacDstAddr
  L3_33 = A0_30[L3_33]
  L4_34 = cfpDef
  L4_34 = L4_34.advQos
  L4_34 = L4_34.attrPriority
  L4_34 = A0_30[L4_34]
  L5_35 = cfpDef
  L5_35 = L5_35.advQos
  L5_35 = L5_35.attrName
  L5_35 = A0_30[L5_35]
  if L3_33 == nil or L4_34 == nil or L5_35 == nil then
    L6_36 = cfp
    L6_36 = L6_36.debug
    L6_36("dstMac " .. L3_33 .. " priority " .. L4_34 .. " policyName " .. L5_35)
    L6_36 = cfpDef
    L6_36 = L6_36.ERROR
    return L6_36, cfpDef.retString.invalidArg
  end
  L6_36 = cfpDef
  L6_36 = L6_36.advQos
  L6_36 = L6_36.attrMacDstAddr
  L6_36 = L6_36 .. "=" .. "'" .. L3_33 .. "'"
  query = L6_36
  L6_36 = cfp
  L6_36 = L6_36.debug
  L6_36("SQL Query " .. query)
  L6_36 = db
  L6_36 = L6_36.getRowWhere
  L6_36 = L6_36(cfpDef.advQos.className, query, false)
  rows = L6_36
  L6_36 = rows
  if L6_36 ~= nil then
    L6_36 = cfp
    L6_36 = L6_36.debug
    L6_36("macDstPolicy.set found rows with dst mac " .. L3_33)
    L6_36 = cfpDef
    L6_36 = L6_36.retString
    L6_36 = L6_36.statusErr
    return L6_36, cfpDef.retString.policyConflict
  end
  L6_36 = {}
  L6_36[cfpDef.advQos.OIDname] = A0_30[cfpDef.advQos.attrName]
  L6_36[cfpDef.advQos.OIDType] = A0_30[cfpDef.advQos.attrType]
  L6_36[cfpDef.advQos.OIDMacDstAddr] = A0_30[cfpDef.advQos.attrMacDstAddr]
  L6_36[cfpDef.advQos.OIDPriority] = A0_30[cfpDef.advQos.attrPriority]
  L6_36[cfpDef.advQos.OIDPort] = A0_30[cfpDef.advQos.attrPort]
  L6_36[cfpDef.advQos.OIDDesc] = cfpDef.advQos.macDstAddrPolicyStr .. ":" .. L3_33 .. " Ports:" .. A0_30[cfpDef.advQos.attrPort]
  cfp.debug(cfpDef.advQos.OIDname .. " " .. L6_36[cfpDef.advQos.OIDname])
  cfp.debug(cfpDef.advQos.OIDType .. " " .. L6_36[cfpDef.advQos.OIDType])
  cfp.debug(cfpDef.advQos.OIDMacDstAddr .. " " .. L6_36[cfpDef.advQos.OIDMacDstAddr])
  cfp.debug(cfpDef.advQos.OIDPriority .. " " .. L6_36[cfpDef.advQos.OIDPriority])
  cfp.debug(cfpDef.advQos.OIDDesc .. " " .. L6_36[cfpDef.advQos.OIDDesc])
  L1_31, L2_32 = db.insert(cfpDef.advQos.className, L6_36)
  cfp.debug(tostring(L1_31) .. L2_32)
  return L1_31, L2_32
end
function cfp.macDstPolicy.del(A0_37)
  cfp.debug("macDstPolicy.del deleting vlan based policy ")
  return cfp.deletePolicyByName(A0_37[cfpDef.advQos.attrName])
end
function cfp.macSrcPolicy.set(A0_38)
  local L1_39, L2_40, L3_41, L4_42, L5_43, L6_44
  L3_41 = cfpDef
  L3_41 = L3_41.advQos
  L3_41 = L3_41.attrMacSrcAddr
  L3_41 = A0_38[L3_41]
  L4_42 = cfpDef
  L4_42 = L4_42.advQos
  L4_42 = L4_42.attrPriority
  L4_42 = A0_38[L4_42]
  L5_43 = cfpDef
  L5_43 = L5_43.advQos
  L5_43 = L5_43.attrName
  L5_43 = A0_38[L5_43]
  if L3_41 == nil or L4_42 == nil or L5_43 == nil then
    L6_44 = cfp
    L6_44 = L6_44.debug
    L6_44("srcMac " .. L3_41 .. " priority " .. L4_42 .. " policyName " .. L5_43)
    L6_44 = cfpDef
    L6_44 = L6_44.ERROR
    return L6_44, cfpDef.retString.invalidArg
  end
  L6_44 = cfpDef
  L6_44 = L6_44.advQos
  L6_44 = L6_44.attrMacSrcAddr
  L6_44 = L6_44 .. "=" .. "'" .. L3_41 .. "'"
  query = L6_44
  L6_44 = cfp
  L6_44 = L6_44.debug
  L6_44(query)
  L6_44 = db
  L6_44 = L6_44.getRowWhere
  L6_44 = L6_44(cfpDef.advQos.className, query, false)
  rows = L6_44
  L6_44 = rows
  if L6_44 ~= nil then
    L6_44 = cfp
    L6_44 = L6_44.debug
    L6_44("macSrcPolicy.set found rows with src mac " .. L3_41)
    L6_44 = cfpDef
    L6_44 = L6_44.retString
    L6_44 = L6_44.statusErr
    return L6_44, cfpDef.retString.policyConflict
  end
  L6_44 = {}
  L6_44[cfpDef.advQos.OIDname] = A0_38[cfpDef.advQos.attrName]
  L6_44[cfpDef.advQos.OIDType] = A0_38[cfpDef.advQos.attrType]
  L6_44[cfpDef.advQos.OIDMacSrcAddr] = A0_38[cfpDef.advQos.attrMacSrcAddr]
  L6_44[cfpDef.advQos.OIDPriority] = A0_38[cfpDef.advQos.attrPriority]
  L6_44[cfpDef.advQos.OIDPort] = A0_38[cfpDef.advQos.attrPort]
  L6_44[cfpDef.advQos.OIDDesc] = cfpDef.advQos.macDstAddrPolicyStr .. ":" .. L3_41 .. " Ports:" .. A0_38[cfpDef.advQos.attrPort]
  cfp.debug(cfpDef.advQos.OIDname .. " " .. L6_44[cfpDef.advQos.OIDname])
  cfp.debug(cfpDef.advQos.OIDType .. " " .. L6_44[cfpDef.advQos.OIDType])
  cfp.debug(cfpDef.advQos.OIDMacSrcAddr .. " " .. L6_44[cfpDef.advQos.OIDMacSrcAddr])
  cfp.debug(cfpDef.advQos.OIDPriority .. " " .. L6_44[cfpDef.advQos.OIDPriority])
  cfp.debug(cfpDef.advQos.OIDDesc .. " " .. L6_44[cfpDef.advQos.OIDDesc])
  L1_39, L2_40 = db.insert(cfpDef.advQos.className, L6_44)
  cfp.debug(tostring(L1_39) .. L2_40)
  return L1_39, L2_40
end
function cfp.macSrcPolicy.del(A0_45)
  cfp.debug("macSrcPolicy.del deleting macSrc based policy ")
  return cfp.deletePolicyByName(A0_45[cfpDef.advQos.attrName])
end
function cfp.ipDstAddrPolicy.set(A0_46)
  local L1_47, L2_48, L3_49, L4_50, L5_51, L6_52
  L3_49 = cfpDef
  L3_49 = L3_49.advQos
  L3_49 = L3_49.attrIPDstAddr
  L3_49 = A0_46[L3_49]
  L4_50 = cfpDef
  L4_50 = L4_50.advQos
  L4_50 = L4_50.attrPriority
  L4_50 = A0_46[L4_50]
  L5_51 = cfpDef
  L5_51 = L5_51.advQos
  L5_51 = L5_51.attrName
  L5_51 = A0_46[L5_51]
  if L3_49 == nil or L4_50 == nil or L5_51 == nil then
    L6_52 = cfp
    L6_52 = L6_52.debug
    L6_52("dspIP " .. L3_49 .. " priority " .. L4_50 .. " policyName " .. L5_51)
    L6_52 = cfpDef
    L6_52 = L6_52.ERROR
    return L6_52, cfpDef.retString.invalidArg
  end
  L6_52 = cfpDef
  L6_52 = L6_52.advQos
  L6_52 = L6_52.attrIPDstAddr
  L6_52 = L6_52 .. "=" .. "'" .. L3_49 .. "'"
  query = L6_52
  L6_52 = cfp
  L6_52 = L6_52.debug
  L6_52("SQL Query " .. query)
  L6_52 = db
  L6_52 = L6_52.getRowWhere
  L6_52 = L6_52(cfpDef.advQos.className, query, false)
  rows = L6_52
  L6_52 = rows
  if L6_52 ~= nil then
    L6_52 = cfp
    L6_52 = L6_52.debug
    L6_52("ipDstAddrPolicy.set found rows with dst IP " .. L3_49)
    L6_52 = cfpDef
    L6_52 = L6_52.retString
    L6_52 = L6_52.statusErr
    return L6_52, cfpDef.retString.policyConflict
  end
  L6_52 = {}
  L6_52[cfpDef.advQos.OIDname] = A0_46[cfpDef.advQos.attrName]
  L6_52[cfpDef.advQos.OIDType] = A0_46[cfpDef.advQos.attrType]
  L6_52[cfpDef.advQos.OIDIPDstAddr] = A0_46[cfpDef.advQos.attrIPDstAddr]
  L6_52[cfpDef.advQos.OIDPriority] = A0_46[cfpDef.advQos.attrPriority]
  L6_52[cfpDef.advQos.OIDPort] = A0_46[cfpDef.advQos.attrPort]
  L6_52[cfpDef.advQos.OIDDesc] = cfpDef.advQos.ipDstAddrPolicyStr .. ": " .. L3_49 .. " Ports:" .. A0_46[cfpDef.advQos.attrPort]
  cfp.debug(cfpDef.advQos.OIDname .. " " .. L6_52[cfpDef.advQos.OIDname])
  cfp.debug(cfpDef.advQos.OIDType .. " " .. L6_52[cfpDef.advQos.OIDType])
  cfp.debug(cfpDef.advQos.OIDIPDstAddr .. " " .. L6_52[cfpDef.advQos.OIDIPDstAddr])
  cfp.debug(cfpDef.advQos.OIDPriority .. " " .. L6_52[cfpDef.advQos.OIDPriority])
  cfp.debug(cfpDef.advQos.OIDDesc .. " " .. L6_52[cfpDef.advQos.OIDDesc])
  L1_47, L2_48 = db.insert(cfpDef.advQos.className, L6_52)
  cfp.debug(tostring(L1_47) .. L2_48)
end
function cfp.ipDstAddrPolicy.del(A0_53)
  cfp.debug("ipDstAddrPolicy.del deleting macSrc based policy ")
  return cfp.deletePolicyByName(A0_53[cfpDef.advQos.attrName])
end
function cfp.ipSrcAddrPolicy.set(A0_54)
  local L1_55, L2_56, L3_57, L4_58, L5_59, L6_60
  L3_57 = cfpDef
  L3_57 = L3_57.advQos
  L3_57 = L3_57.attrIPSrcAddr
  L3_57 = A0_54[L3_57]
  L4_58 = cfpDef
  L4_58 = L4_58.advQos
  L4_58 = L4_58.attrPriority
  L4_58 = A0_54[L4_58]
  L5_59 = cfpDef
  L5_59 = L5_59.advQos
  L5_59 = L5_59.attrName
  L5_59 = A0_54[L5_59]
  if L3_57 == nil or L4_58 == nil or L5_59 == nil then
    L6_60 = cfp
    L6_60 = L6_60.debug
    L6_60("srcIP " .. L3_57 .. " priority " .. L4_58 .. " policyName " .. L5_59)
    L6_60 = cfpDef
    L6_60 = L6_60.ERROR
    return L6_60, cfpDef.retString.invalidArg
  end
  L6_60 = cfpDef
  L6_60 = L6_60.advQos
  L6_60 = L6_60.attrIPDstAddr
  L6_60 = L6_60 .. "=" .. "'" .. L3_57 .. "'"
  query = L6_60
  L6_60 = cfp
  L6_60 = L6_60.debug
  L6_60("SQL Query: " .. query)
  L6_60 = db
  L6_60 = L6_60.getRowWhere
  L6_60 = L6_60(cfpDef.advQos.className, query, false)
  rows = L6_60
  L6_60 = rows
  if L6_60 ~= nil then
    L6_60 = cfp
    L6_60 = L6_60.debug
    L6_60("ipSrcAddrPolicy.set found rows with src IP " .. L3_57)
    L6_60 = cfpDef
    L6_60 = L6_60.retString
    L6_60 = L6_60.statusErr
    return L6_60, cfpDef.retString.policyConflict
  end
  L6_60 = {}
  L6_60[cfpDef.advQos.OIDname] = A0_54[cfpDef.advQos.attrName]
  L6_60[cfpDef.advQos.OIDType] = A0_54[cfpDef.advQos.attrType]
  L6_60[cfpDef.advQos.OIDIPSrcAddr] = A0_54[cfpDef.advQos.attrIPSrcAddr]
  L6_60[cfpDef.advQos.OIDPriority] = A0_54[cfpDef.advQos.attrPriority]
  L6_60[cfpDef.advQos.OIDPort] = A0_54[cfpDef.advQos.attrPort]
  L6_60[cfpDef.advQos.OIDDesc] = cfpDef.advQos.ipSrcAddrPolicyStr .. ":" .. L3_57 .. " Ports:" .. A0_54[cfpDef.advQos.attrPort]
  cfp.debug(cfpDef.advQos.OIDname .. " " .. L6_60[cfpDef.advQos.OIDname])
  cfp.debug(cfpDef.advQos.OIDType .. " " .. L6_60[cfpDef.advQos.OIDType])
  cfp.debug(cfpDef.advQos.OIDIPSrcAddr .. " " .. L6_60[cfpDef.advQos.OIDIPSrcAddr])
  cfp.debug(cfpDef.advQos.OIDPriority .. " " .. L6_60[cfpDef.advQos.OIDPriority])
  cfp.debug(cfpDef.advQos.OIDDesc .. " " .. L6_60[cfpDef.advQos.OIDDesc])
  L1_55, L2_56 = db.insert(cfpDef.advQos.className, L6_60)
  cfp.debug(tostring(L1_55) .. L2_56)
  return L1_55, L2_56
end
function cfp.ipSrcAddrPolicy.del(A0_61)
  cfp.debug("ipSrcAddrPolicy.del deleting Source IP based policy ")
  return cfp.deletePolicyByName(A0_61[cfpDef.advQos.attrName])
end
function cfp.l4TcpSrcPolicy.set(A0_62)
  local L1_63, L2_64, L3_65, L4_66, L5_67, L6_68
  L3_65 = cfpDef
  L3_65 = L3_65.advQos
  L3_65 = L3_65.attrTCPSrcPort
  L3_65 = A0_62[L3_65]
  L4_66 = cfpDef
  L4_66 = L4_66.advQos
  L4_66 = L4_66.attrPriority
  L4_66 = A0_62[L4_66]
  L5_67 = cfpDef
  L5_67 = L5_67.advQos
  L5_67 = L5_67.attrName
  L5_67 = A0_62[L5_67]
  if L3_65 == nil or L4_66 == nil or L5_67 == nil then
    L6_68 = cfp
    L6_68 = L6_68.debug
    L6_68("tcpSrcPort " .. L3_65 .. " priority " .. L4_66 .. " policyName " .. L5_67)
    L6_68 = cfpDef
    L6_68 = L6_68.ERROR
    return L6_68, cfpDef.retString.invalidArg
  end
  L6_68 = cfpDef
  L6_68 = L6_68.advQos
  L6_68 = L6_68.attrTCPSrcPort
  L6_68 = L6_68 .. "=" .. L3_65
  query = L6_68
  L6_68 = cfp
  L6_68 = L6_68.debug
  L6_68("SQL Query: " .. query)
  L6_68 = db
  L6_68 = L6_68.getRowWhere
  L6_68 = L6_68(cfpDef.advQos.className, query, false)
  rows = L6_68
  L6_68 = rows
  if L6_68 ~= nil then
    L6_68 = cfp
    L6_68 = L6_68.debug
    L6_68("l4TcpSrcPolicy.set found rows with src tcp port " .. L3_65)
    L6_68 = cfpDef
    L6_68 = L6_68.retString
    L6_68 = L6_68.statusErr
    return L6_68, cfpDef.retString.policyConflict
  end
  L6_68 = {}
  L6_68[cfpDef.advQos.OIDname] = A0_62[cfpDef.advQos.attrName]
  L6_68[cfpDef.advQos.OIDType] = A0_62[cfpDef.advQos.attrType]
  L6_68[cfpDef.advQos.OIDTCPSrcPort] = A0_62[cfpDef.advQos.attrTCPSrcPort]
  L6_68[cfpDef.advQos.OIDPriority] = A0_62[cfpDef.advQos.attrPriority]
  L6_68[cfpDef.advQos.OIDPort] = A0_62[cfpDef.advQos.attrPort]
  L6_68[cfpDef.advQos.OIDDesc] = cfpDef.advQos.l4TCPSrcPortPolicyStr .. " " .. L3_65 .. " Ports:" .. A0_62[cfpDef.advQos.attrPort]
  cfp.debug(cfpDef.advQos.OIDname .. " " .. L6_68[cfpDef.advQos.OIDname])
  cfp.debug(cfpDef.advQos.OIDType .. " " .. L6_68[cfpDef.advQos.OIDType])
  cfp.debug(cfpDef.advQos.OIDTCPSrcPort .. " " .. L6_68[cfpDef.advQos.OIDTCPSrcPort])
  cfp.debug(cfpDef.advQos.OIDPriority .. " " .. L6_68[cfpDef.advQos.OIDPriority])
  cfp.debug(cfpDef.advQos.OIDDesc .. " " .. L6_68[cfpDef.advQos.OIDDesc])
  L1_63, L2_64 = db.insert(cfpDef.advQos.className, L6_68)
  cfp.debug(tostring(L1_63) .. L2_64)
  return L1_63, L2_64
end
function cfp.l4TcpSrcPolicy.del(A0_69)
  cfp.debug("l4TcpPolicy.del deleting TCP source port based policy ")
  return cfp.deletePolicyByName(A0_69[cfpDef.advQos.attrName])
end
function cfp.l4TcpDstPolicy.set(A0_70)
  local L1_71, L2_72, L3_73, L4_74, L5_75, L6_76
  L3_73 = cfpDef
  L3_73 = L3_73.advQos
  L3_73 = L3_73.attrTCPDstPort
  L3_73 = A0_70[L3_73]
  L4_74 = cfpDef
  L4_74 = L4_74.advQos
  L4_74 = L4_74.attrPriority
  L4_74 = A0_70[L4_74]
  L5_75 = cfpDef
  L5_75 = L5_75.advQos
  L5_75 = L5_75.attrName
  L5_75 = A0_70[L5_75]
  if L3_73 == nil or L4_74 == nil or L5_75 == nil then
    L6_76 = cfp
    L6_76 = L6_76.debug
    L6_76("tcpDstPort " .. L3_73 .. " priority " .. L4_74 .. " policyName " .. L5_75)
    L6_76 = cfpDef
    L6_76 = L6_76.ERROR
    return L6_76, cfpDef.retString.invalidArg
  end
  L6_76 = cfpDef
  L6_76 = L6_76.advQos
  L6_76 = L6_76.attrTCPSrcPort
  L6_76 = L6_76 .. "=" .. L3_73
  query = L6_76
  L6_76 = cfp
  L6_76 = L6_76.debug
  L6_76("SQL Query: " .. query)
  L6_76 = db
  L6_76 = L6_76.getRowWhere
  L6_76 = L6_76(cfpDef.advQos.className, query, false)
  rows = L6_76
  L6_76 = rows
  if L6_76 ~= nil then
    L6_76 = cfp
    L6_76 = L6_76.debug
    L6_76("l4TcpDstPolicy.set found rows with dst tcp port " .. L3_73)
    L6_76 = cfpDef
    L6_76 = L6_76.retString
    L6_76 = L6_76.statusErr
    return L6_76, cfpDef.retString.policyConflict
  end
  L6_76 = {}
  L6_76[cfpDef.advQos.OIDname] = A0_70[cfpDef.advQos.attrName]
  L6_76[cfpDef.advQos.OIDType] = A0_70[cfpDef.advQos.attrType]
  L6_76[cfpDef.advQos.OIDTCPDstPort] = A0_70[cfpDef.advQos.attrTCPDstPort]
  L6_76[cfpDef.advQos.OIDPriority] = A0_70[cfpDef.advQos.attrPriority]
  L6_76[cfpDef.advQos.OIDPort] = A0_70[cfpDef.advQos.attrPort]
  L6_76[cfpDef.advQos.OIDDesc] = cfpDef.advQos.l4TCPDstPortPolicyStr .. ":" .. L3_73 .. " Ports:" .. A0_70[cfpDef.advQos.attrPort]
  cfp.debug(cfpDef.advQos.OIDname .. " " .. L6_76[cfpDef.advQos.OIDname])
  cfp.debug(cfpDef.advQos.OIDType .. " " .. L6_76[cfpDef.advQos.OIDType])
  cfp.debug(cfpDef.advQos.OIDTCPDstPort .. " " .. L6_76[cfpDef.advQos.OIDTCPDstPort])
  cfp.debug(cfpDef.advQos.OIDPriority .. " " .. L6_76[cfpDef.advQos.OIDPriority])
  cfp.debug(cfpDef.advQos.OIDDesc .. " " .. L6_76[cfpDef.advQos.OIDDesc])
  L1_71, L2_72 = db.insert(cfpDef.advQos.className, L6_76)
  cfp.debug(tostring(L1_71) .. L2_72)
  return L1_71, L2_72
end
function cfp.l4TcpDstPolicy.del(A0_77)
  cfp.debug("l4TcpDstPolicy.del deleting TCP destination port based policy")
  return cfp.deletePolicyByName(A0_77[cfpDef.advQos.attrName])
end
function cfp.l4UdpSrcPolicy.set(A0_78)
  local L1_79, L2_80, L3_81, L4_82, L5_83, L6_84
  L3_81 = cfpDef
  L3_81 = L3_81.advQos
  L3_81 = L3_81.attrUDPSrcPort
  L3_81 = A0_78[L3_81]
  L4_82 = cfpDef
  L4_82 = L4_82.advQos
  L4_82 = L4_82.attrPriority
  L4_82 = A0_78[L4_82]
  L5_83 = cfpDef
  L5_83 = L5_83.advQos
  L5_83 = L5_83.attrName
  L5_83 = A0_78[L5_83]
  if L3_81 == nil or L4_82 == nil or L5_83 == nil then
    L6_84 = cfp
    L6_84 = L6_84.debug
    L6_84("udpSrcPort " .. L3_81 .. " priority " .. L4_82 .. " policyName " .. L5_83)
    L6_84 = cfpDef
    L6_84 = L6_84.ERROR
    return L6_84, cfpDef.retString.invalidArg
  end
  L6_84 = cfpDef
  L6_84 = L6_84.advQos
  L6_84 = L6_84.attrUDPSrcPort
  L6_84 = L6_84 .. "=" .. L3_81
  query = L6_84
  L6_84 = cfp
  L6_84 = L6_84.debug
  L6_84("SQL Query: " .. query)
  L6_84 = db
  L6_84 = L6_84.getRowWhere
  L6_84 = L6_84(cfpDef.advQos.className, query, false)
  rows = L6_84
  L6_84 = rows
  if L6_84 ~= nil then
    L6_84 = cfp
    L6_84 = L6_84.debug
    L6_84("l4UdpSrcPolicy.set found rows with src udp port " .. L3_81)
    L6_84 = cfpDef
    L6_84 = L6_84.retString
    L6_84 = L6_84.statusErr
    return L6_84, cfpDef.retString.policyConflict
  end
  L6_84 = {}
  L6_84[cfpDef.advQos.OIDname] = A0_78[cfpDef.advQos.attrName]
  L6_84[cfpDef.advQos.OIDType] = A0_78[cfpDef.advQos.attrType]
  L6_84[cfpDef.advQos.OIDUDPSrcPort] = A0_78[cfpDef.advQos.attrUDPSrcPort]
  L6_84[cfpDef.advQos.OIDPriority] = A0_78[cfpDef.advQos.attrPriority]
  L6_84[cfpDef.advQos.OIDPort] = A0_78[cfpDef.advQos.attrPort]
  L6_84[cfpDef.advQos.OIDDesc] = cfpDef.advQos.l4UDPSrcPortPolicyStr .. ":" .. L3_81 .. " Ports:" .. A0_78[cfpDef.advQos.attrPort]
  cfp.debug(cfpDef.advQos.OIDname .. " " .. L6_84[cfpDef.advQos.OIDname])
  cfp.debug(cfpDef.advQos.OIDType .. " " .. L6_84[cfpDef.advQos.OIDType])
  cfp.debug(cfpDef.advQos.OIDUDPSrcPort .. " " .. L6_84[cfpDef.advQos.OIDUDPSrcPort])
  cfp.debug(cfpDef.advQos.OIDPriority .. " " .. L6_84[cfpDef.advQos.OIDPriority])
  cfp.debug(cfpDef.advQos.OIDDesc .. " " .. L6_84[cfpDef.advQos.OIDDesc])
  L1_79, L2_80 = db.insert(cfpDef.advQos.className, L6_84)
  cfp.debug(tostring(L1_79) .. L2_80)
  return L1_79, L2_80
end
function cfp.l4UdpSrcPolicy.del(A0_85)
  cfp.debug("l4SrcSrcPolicy.del deleting UDP Source port based policy")
  return cfp.deletePolicyByName(A0_85[cfpDef.advQos.attrName])
end
function cfp.l4UdpDstPolicy.set(A0_86)
  local L1_87, L2_88, L3_89, L4_90, L5_91, L6_92
  L3_89 = cfpDef
  L3_89 = L3_89.advQos
  L3_89 = L3_89.attrUDPDstPort
  L3_89 = A0_86[L3_89]
  L4_90 = cfpDef
  L4_90 = L4_90.advQos
  L4_90 = L4_90.attrPriority
  L4_90 = A0_86[L4_90]
  L5_91 = cfpDef
  L5_91 = L5_91.advQos
  L5_91 = L5_91.attrName
  L5_91 = A0_86[L5_91]
  if L3_89 == nil or L4_90 == nil or L5_91 == nil then
    L6_92 = cfp
    L6_92 = L6_92.debug
    L6_92("udpDstPort " .. L3_89 .. " priority " .. L4_90 .. " policyName " .. L5_91)
    L6_92 = cfpDef
    L6_92 = L6_92.ERROR
    return L6_92, cfpDef.retString.invalidArg
  end
  L6_92 = cfpDef
  L6_92 = L6_92.advQos
  L6_92 = L6_92.attrUDPDstPort
  L6_92 = L6_92 .. "=" .. L3_89
  query = L6_92
  L6_92 = cfp
  L6_92 = L6_92.debug
  L6_92("SQL Query: " .. query)
  L6_92 = db
  L6_92 = L6_92.getRowWhere
  L6_92 = L6_92(cfpDef.advQos.className, query, false)
  rows = L6_92
  L6_92 = rows
  if L6_92 ~= nil then
    L6_92 = cfp
    L6_92 = L6_92.debug
    L6_92("l4UdpSrcPolicy.set found rows with src udp port " .. L3_89)
    L6_92 = cfpDef
    L6_92 = L6_92.retString
    L6_92 = L6_92.statusErr
    return L6_92, cfpDef.retString.policyConflict
  end
  L6_92 = {}
  L6_92[cfpDef.advQos.OIDname] = A0_86[cfpDef.advQos.attrName]
  L6_92[cfpDef.advQos.OIDType] = A0_86[cfpDef.advQos.attrType]
  L6_92[cfpDef.advQos.OIDUDPDstPort] = A0_86[cfpDef.advQos.attrUDPDstPort]
  L6_92[cfpDef.advQos.OIDPriority] = A0_86[cfpDef.advQos.attrPriority]
  L6_92[cfpDef.advQos.OIDPort] = A0_86[cfpDef.advQos.attrPort]
  L6_92[cfpDef.advQos.OIDDesc] = cfpDef.advQos.l4UDPDstPortPolicyStr .. ":" .. L3_89 .. " Ports" .. A0_86[cfpDef.advQos.attrPort]
  cfp.debug(cfpDef.advQos.OIDname .. " " .. L6_92[cfpDef.advQos.OIDname])
  cfp.debug(cfpDef.advQos.OIDType .. " " .. L6_92[cfpDef.advQos.OIDType])
  cfp.debug(cfpDef.advQos.OIDUDPDstPort .. " " .. L6_92[cfpDef.advQos.OIDUDPDstPort])
  cfp.debug(cfpDef.advQos.OIDPriority .. " " .. L6_92[cfpDef.advQos.OIDPriority])
  cfp.debug(cfpDef.advQos.OIDDesc .. " " .. L6_92[cfpDef.advQos.OIDDesc])
  L1_87, L2_88 = db.insert(cfpDef.advQos.className, L6_92)
  cfp.debug(tostring(L1_87) .. L2_88)
  return L1_87, L2_88
end
function cfp.l4UdpDstPolicy.del(A0_93)
  cfp.debug("l4UdpDstPolicy.del deleting UDP Destination port based policy")
  return cfp.deletePolicyByName(A0_93[cfpDef.advQos.attrName])
end
function cfp.getCfpRuleCount()
  local L0_94, L1_95
  L0_94 = 0
  L1_95 = db
  L1_95 = L1_95.getTable
  L1_95 = L1_95(cfpDef.advQos.className)
  if L1_95 ~= nil then
    cfp.debug("Rows in Advanced Qos Table " .. #L1_95)
    count = #L1_95
  end
  L1_95 = db.getTable(cfpDef.SIPH323Table.name)
  if L1_95 ~= nil then
    cfp.debug("Rows in SIP H323 Table " .. #L1_95)
    count = count + #L1_95
  end
  L1_95 = db.getTable(cfpDef.flowBandwidthCtrlTable.Name)
  if L1_95 ~= nil then
    cfp.debug("Rows in flow bandwidth control " .. #L1_95)
    count = count + #L1_95
  end
  return tonumber(count)
end
function cfp.checkMaxRules(A0_96)
  local L1_97
  L1_97 = 0
  L1_97 = cfp.getCfpRuleCount()
  if L1_97 <= cfpDef.maxRules then
    return true
  else
    return false
  end
end
function cfp.flowBasedPolicyAdd(A0_98)
  local L1_99, L2_100, L3_101, L4_102, L5_103, L6_104, L7_105
  L1_99 = 0
  L2_100 = 0
  L3_101 = 0
  L4_102, L5_103, L6_104, L7_105 = nil, nil, nil, nil
  if A0_98[cfpDef.flowBandwidthCtrlTable.attrPolicyName] == nil then
    cfp.debug("policyCheck: input policyName is nil ")
    return cfpDef.ERROR, cfpDef.retString.invalidArg
  end
  cfp.debug(A0_98[cfpDef.flowBandwidthCtrlTable.attrPolicyName])
  L5_103 = db.getRow(cfpDef.flowBandwidthCtrlTable.Name, cfpDef.flowBandwidthCtrlTable.attrPolicyName, A0_98[cfpDef.flowBandwidthCtrlTable.attrPolicyName])
  if L5_103 ~= nil then
    cfp.debug("policyCheck: Another policy exists with same name ")
    return cfpDef.ERROR, cfpDef.advQos.nameConflict
  else
    cfp.debug("policyCheck: policyName " .. A0_98[cfpDef.flowBandwidthCtrlTable.attrPolicyName] .. "is acceptable")
  end
  cfp.debug("serviceId : " .. A0_98[cfpDef.flowBandwidthCtrlTable.attrServiceId])
  L1_99 = tonumber(A0_98[cfpDef.flowBandwidthCtrlTable.attrServiceId])
  L2_100 = "_ROWID_ = " .. L1_99
  L3_101 = db.getRowWhere(cfpDef.servicesTable.Name, L2_100)
  cfp.debug(L3_101[cfpDef.servicesTable.ServiceName])
  cfp.debug(L3_101[cfpDef.servicesTable.Protocol])
  cfp.debug(L3_101[cfpDef.servicesTable.IsDefault])
  cfp.debug(L3_101[cfpDef.servicesTable.DstPortDefault])
  cfp.debug(L1_99)
  cfp.debug(A0_98[cfpDef.flowBandwidthCtrlTable.attrDstIP])
  cfp.debug(A0_98[cfpDef.flowBandwidthCtrlTable.attrSrcIP])
  L4_102 = "serviceId = " .. L1_99 .. " AND dstIP = '" .. A0_98[cfpDef.flowBandwidthCtrlTable.attrDstIP] .. "'"
  L4_102 = L4_102 .. " AND srcIP = '" .. A0_98[cfpDef.flowBandwidthCtrlTable.attrSrcIP] .. "'"
  cfp.debug("SQL Query: " .. L4_102)
  L5_103 = db.getRowWhere(cfpDef.flowBandwidthCtrlTable.Name, L4_102)
  if L5_103 ~= nil then
    cfp.debug("There is already another rule with src ip, dst ip and service ")
    return cfpDef.retString.statusErr, cfpDef.retString.policyConflict
  end
  A0_98[cfpDef.flowBandwidthCtrlTable.attrDstPort] = L3_101[cfpDef.servicesTable.DstPortDefault]
  cfp.debug(A0_98[cfpDef.flowBandwidthCtrlTable.attrPolicyName])
  cfp.debug(A0_98[cfpDef.flowBandwidthCtrlTable.attrServiceId])
  cfp.debug(A0_98[cfpDef.flowBandwidthCtrlTable.attrRatePercentage])
  cfp.debug(A0_98[cfpDef.flowBandwidthCtrlTable.attrDstIP])
  cfp.debug(A0_98[cfpDef.flowBandwidthCtrlTable.attrSrcIP])
  cfp.debug(A0_98[cfpDef.flowBandwidthCtrlTable.attrDstPort])
  L6_104, L7_105 = db.insert(cfpDef.flowBandwidthCtrlTable.Name, A0_98)
  cfp.debug(tostring(L6_104) .. L7_105)
  return L6_104, L7_105
end
function cfp.flowBasedPolicyEdit(A0_106, A1_107)
  cfp.flowBasedPolicyDelete(A1_107)
  cfp.flowBasedPolicyAdd(A0_106)
end
function cfp.flowBasedPolicyDelete(A0_108)
  return db.deleteRow(cfpDef.flowBandwidthCtrlTable.Name, "_ROWID_", A0_108)
end
function cfp.sip.set(A0_109)
  local L1_110
  L1_110 = {}
  if 0 == tonumber(A0_109) or 1 == tonumber(A0_109) then
    L1_110[cfpDef.SIPH323Table.SIPAttr] = tostring(A0_109)
    return db.update(cfpDef.SIPH323Table.name, L1_110, cfpDef.ROWID)
  else
    return cfpDef.ERROR, cfpDef.retString.statusErr
  end
end
function cfp.h323.set(A0_111)
  local L1_112
  L1_112 = {}
  cfp.debug("status for h323 is " .. A0_111)
  if 0 == tonumber(A0_111) or 1 == tonumber(A0_111) then
    L1_112[cfpDef.SIPH323Table.H323Attr] = tostring(A0_111)
    return db.update(cfpDef.SIPH323Table.name, L1_112, cfpDef.ROWID)
  else
    return cfpDef.ERROR, cfpDef.retString.statusErr
  end
end
