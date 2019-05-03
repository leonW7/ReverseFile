local L0_0
L0_0 = require
L0_0("teamf1lualib/fwCustomServices")
L0_0 = fw
L0_0 = L0_0.ul
L0_0.services = {}
L0_0 = "ServiceName"
function servicesInUseEdit(A0_1)
  local L1_2, L2_3, L3_4
  L2_3 = firewallRowWhereExists
  L2_3 = L2_3(L3_4, "ServiceName = '" .. A0_1 .. "'")
  L1_2 = L2_3
  if L1_2 then
    L2_3 = _UPVALUE0_
    L2_3 = L2_3(L3_4, "ServiceName", A0_1)
    for _FORV_6_, _FORV_7_ in L3_4(L2_3) do
      if _FORV_7_["FirewallRules.Status"] == _UPVALUE1_ then
        return returnCodes.FAILURE, fwReturnCodes.COMP_FIREWALL_SERVICE_IN_USE_BY_FIREWALL_RULES
      end
    end
  end
  L2_3 = firewallRowWhereExists
  L2_3 = L2_3(L3_4, "ServiceName = '" .. A0_1 .. "'")
  L1_2 = L2_3
  if L1_2 then
    L2_3 = _UPVALUE0_
    L2_3 = L2_3(L3_4, "ServiceName", A0_1)
    for _FORV_6_, _FORV_7_ in L3_4(L2_3) do
      if _FORV_7_["FirewallRules6.Status"] == _UPVALUE1_ then
        return returnCodes.FAILURE, fwReturnCodes.COMP_FIREWALL_SERVICE_IN_USE_BY_FIREWALL_RULES
      end
    end
  end
  L2_3 = firewallRowWhereExists
  L2_3 = L2_3(L3_4, "ServiceName = '" .. A0_1 .. "'")
  L1_2 = L2_3
  if L1_2 then
    L2_3 = returnCodes
    L2_3 = L2_3.FAILURE
    return L2_3, L3_4
  end
  L2_3 = firewallRowWhereExists
  L2_3 = L2_3(L3_4, "ServiceName = '" .. A0_1 .. "'")
  L1_2 = L2_3
  if L1_2 then
    L2_3 = _UPVALUE0_
    L2_3 = L2_3(L3_4, "ServiceName", A0_1)
    for _FORV_6_, _FORV_7_ in L3_4(L2_3) do
      if _FORV_7_["ProtocolBinding.Enabled"] == _UPVALUE1_ then
        return returnCodes.FAILURE, fwReturnCodes.COMP_FIREWALL_SERVICE_IN_USE_BY_PROTOCOLBINDING_RULES
      end
    end
  end
  L2_3 = firewallRowWhereExists
  L2_3 = L2_3(L3_4, "service = '" .. A0_1 .. "'")
  L1_2 = L2_3
  if L1_2 then
    L2_3 = _UPVALUE0_
    L2_3 = L2_3(L3_4, "service", A0_1)
    for _FORV_6_, _FORV_7_ in L3_4(L2_3) do
      if _FORV_7_["bandwidthmanagement.action"] == _UPVALUE1_ then
        return returnCodes.FAILURE, fwReturnCodes.COMP_FIREWALL_SERVICE_IN_USE_BY_BANDWIDTH_MANAGEMENT
      end
    end
  end
  L2_3 = firewallRowWhereExists
  L2_3 = L2_3(L3_4, "Service = '" .. A0_1 .. "'")
  L1_2 = L2_3
  if L1_2 then
    L2_3 = returnCodes
    L2_3 = L2_3.FAILURE
    return L2_3, L3_4
  end
  L2_3 = db
  L2_3 = L2_3.getAttribute
  L2_3 = L2_3(L3_4, "ServiceName", A0_1, "_ROWID_")
  if L2_3 == L3_4 then
    return L3_4
  end
  L1_2 = L3_4
  if L1_2 then
    return L3_4, fwReturnCodes.COMP_FIREWALL_SERVICE_IN_USE_BY_FLOWCONTROL_RULES
  end
  L1_2 = L3_4
  if L1_2 then
    for _FORV_7_, _FORV_8_ in pairs(L3_4) do
      if _FORV_8_["L2FirewallRules.Status"] == _UPVALUE1_ then
        return returnCodes.FAILURE, fwReturnCodes.COMP_FIREWALL_SERVICE_IN_USE_BY_BRIDGE_FIREWALL_RULES
      end
    end
  end
  return L3_4
end
function fw.ul.services.edit(A0_5, A1_6, A2_7, A3_8, A4_9, A5_10, A6_11, A7_12, A8_13, A9_14)
  local L10_15, L11_16, L12_17, L13_18
  if A9_14 == NIL then
    return returnCodes.INVALID_ARGUMENT
  end
  L10_15 = db.existsRow(servicesTable, _UPVALUE0_, A9_14)
  if not L10_15 then
    return returnCodes.COOKIEFAIL
  end
  L13_18 = db.getAttribute(servicesTable, _UPVALUE0_, A9_14, attribute.isDefault)
  if L13_18 == _UPVALUE1_ then
    return returnCodes.FAILURE
  end
  L12_17, errCode = servicesInUseEdit(A9_14)
  if L12_17 ~= returnCodes.SUCCESS then
    return errCode
  end
  L12_17 = fw.core.services.edit(A0_5, A1_6, A2_7, A3_8, A4_9, A5_10, A6_11, A7_12, A8_13, A9_14)
  return L12_17, A9_14
end
function fw.ul.services.delete(A0_19)
  local L1_20, L2_21, L3_22, L4_23
  if A0_19 == NIL then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_20 = db.existsRow(servicesTable, _UPVALUE0_, A0_19)
  if not L1_20 then
    return returnCodes.COOKIEFAIL
  end
  L4_23 = db.getAttribute(servicesTable, _UPVALUE0_, A0_19, attribute.isDefault)
  if L4_23 == _UPVALUE1_ then
    return returnCodes.FAILURE
  end
  L3_22, errCode = _UPVALUE2_(A0_19)
  if L3_22 ~= returnCodes.SUCCESS then
    return errCode
  end
  L3_22 = fw.core.services.delete(A0_19)
  return L3_22, A0_19
end
function fw.ul.services.deleteAll()
  local L0_24, L1_25, L2_26
  L1_25 = fw
  L1_25 = L1_25.core
  L1_25 = L1_25.services
  L1_25 = L1_25.customGetAll
  L2_26 = L1_25()
  if L1_25 ~= returnCodes.SUCCESS then
    return returnCodes.FAILURE
  end
  for _FORV_6_, _FORV_7_ in pairs(L2_26) do
    if _UPVALUE0_(_FORV_7_["Services.ServiceName"]) ~= returnCodes.SUCCESS then
      return _UPVALUE0_(_FORV_7_["Services.ServiceName"])
    end
  end
  L0_24 = fw.core.services.deleteAll()
  return L0_24
end
