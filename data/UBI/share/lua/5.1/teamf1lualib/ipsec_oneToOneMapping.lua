local L0_0
L0_0 = module
L0_0("com.teamf1.core.ipsec.oneToOneMapping", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vipsecure_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
oneToOneMapTable = "IpsecLocalTrafficSelectorMapping"
;({}).sourceIpStart = "sourceIpStart"
;({}).mappedIpStart = "mappedIpStart"
;({}).rangeLength = "rangeLength"
;({}).vpnPolicyName = "vpnPolicyName"
;({}).vpnPolicyStatus = "vpnPolicyStatus"
;({}).dstTrafficSeletorType = "dstTrafficSeletorType"
;({}).dstTrafficSelectorIpStart = "dstTrafficSelectorIpStart"
;({}).dstTrafficSelectorIpEnd = "dstTrafficSelectorIpEnd"
;({}).dstTrafficSelectorSubnetMask = "dstTrafficSelectorSubnetMask"
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
else
end
function oneToOneMappingGet(A0_1)
  local L1_2
  L1_2 = db
  L1_2 = L1_2.getRow
  L1_2 = L1_2(oneToOneMapTable, _UPVALUE0_, A0_1)
  if L1_2 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_2
end
function oneToOneMappingGetAll()
  local L0_3, L1_4, L2_5
  L0_3 = db
  L0_3 = L0_3.getTable
  L1_4 = "IpsecVPNPolicy"
  L0_3 = L0_3(L1_4)
  L1_4 = {}
  L2_5 = ""
  if #L0_3 == 0 then
    L2_5 = "1"
  else
    L1_4 = db.getTable("IpsecLocalTrafficSelectorMapping")
  end
  return _UPVALUE0_.SUCCESS, L2_5, L1_4
end
function oneToOneMappingSet(A0_6, A1_7, A2_8, A3_9, A4_10)
  local L5_11, L6_12
  L6_12 = {}
  if A1_7 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L5_11 = _UPVALUE1_.ipAddressCheck("2", A1_7)
  if L5_11 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L6_12[oneToOneMapTable .. "." .. _UPVALUE2_.sourceIpStart] = A1_7
  if A2_8 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L5_11 = _UPVALUE1_.ipAddressCheck("2", A2_8)
  if L5_11 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L6_12[oneToOneMapTable .. "." .. _UPVALUE2_.mappedIpStart] = A2_8
  if A3_9 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(util.split(A1_7, ".")[4]) + tonumber(A3_9) - 1 > 254 or tonumber(util.split(A2_8, ".")[4]) + tonumber(A3_9) - 1 > 254 then
    return _UPVALUE3_.ONE_TO_ONE_MAPPING_CONFIG_FAILED
  end
  L6_12[oneToOneMapTable .. "." .. _UPVALUE2_.rangeLength] = A3_9
  if A4_10 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L6_12[oneToOneMapTable .. "." .. _UPVALUE2_.vpnPolicyName] = A4_10
  L6_12[oneToOneMapTable .. "." .. _UPVALUE2_.vpnPolicyStatus] = db.getRow("IpsecVPNPolicy", "VPNPolicyName", A4_10)["IpsecVPNPolicy.Status"]
  L6_12[oneToOneMapTable .. "." .. _UPVALUE2_.dstTrafficSeletorType] = db.getRow("IpsecVPNPolicy", "VPNPolicyName", A4_10)["IpsecVPNPolicy.RemoteNetworkType"]
  L6_12[oneToOneMapTable .. "." .. _UPVALUE2_.dstTrafficSelectorIpStart] = db.getRow("IpsecVPNPolicy", "VPNPolicyName", A4_10)["IpsecVPNPolicy.RemoteStartAddress"]
  L6_12[oneToOneMapTable .. "." .. _UPVALUE2_.dstTrafficSelectorIpEnd] = db.getRow("IpsecVPNPolicy", "VPNPolicyName", A4_10)["IpsecVPNPolicy.RemoteEndAddress"]
  L6_12[oneToOneMapTable .. "." .. _UPVALUE2_.dstTrafficSelectorSubnetMask] = db.getRow("IpsecVPNPolicy", "VPNPolicyName", A4_10)["IpsecVPNPolicy.RemoteSubnetMask"]
  if db.update(oneToOneMapTable, L6_12, A0_6) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_6
end
function oneToOneMappingCreate(A0_13, A1_14, A2_15, A3_16)
  local L4_17, L5_18
  L5_18 = {}
  if A0_13 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L4_17 = _UPVALUE1_.ipAddressCheck("2", A0_13)
  if L4_17 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L5_18[oneToOneMapTable .. "." .. _UPVALUE2_.sourceIpStart] = A0_13
  if A1_14 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L4_17 = _UPVALUE1_.ipAddressCheck("2", A1_14)
  if L4_17 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L5_18[oneToOneMapTable .. "." .. _UPVALUE2_.mappedIpStart] = A1_14
  if A2_15 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(util.split(A0_13, ".")[4]) + tonumber(A2_15) - 1 > 254 or tonumber(util.split(A1_14, ".")[4]) + tonumber(A2_15) - 1 > 254 then
    return _UPVALUE3_.ONE_TO_ONE_MAPPING_CONFIG_FAILED
  end
  L5_18[oneToOneMapTable .. "." .. _UPVALUE2_.rangeLength] = A2_15
  if A3_16 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L5_18[oneToOneMapTable .. "." .. _UPVALUE2_.vpnPolicyName] = A3_16
  L5_18[oneToOneMapTable .. "." .. _UPVALUE2_.vpnPolicyStatus] = db.getRow("IpsecVPNPolicy", "VPNPolicyName", A3_16)["IpsecVPNPolicy.Status"]
  L5_18[oneToOneMapTable .. "." .. _UPVALUE2_.dstTrafficSeletorType] = db.getRow("IpsecVPNPolicy", "VPNPolicyName", A3_16)["IpsecVPNPolicy.RemoteNetworkType"]
  L5_18[oneToOneMapTable .. "." .. _UPVALUE2_.dstTrafficSelectorIpStart] = db.getRow("IpsecVPNPolicy", "VPNPolicyName", A3_16)["IpsecVPNPolicy.RemoteStartAddress"]
  L5_18[oneToOneMapTable .. "." .. _UPVALUE2_.dstTrafficSelectorIpEnd] = db.getRow("IpsecVPNPolicy", "VPNPolicyName", A3_16)["IpsecVPNPolicy.RemoteEndAddress"]
  L5_18[oneToOneMapTable .. "." .. _UPVALUE2_.dstTrafficSelectorSubnetMask] = db.getRow("IpsecVPNPolicy", "VPNPolicyName", A3_16)["IpsecVPNPolicy.RemoteSubnetMask"]
  if db.getTable(oneToOneMapTable) ~= nil and #db.getTable(oneToOneMapTable) >= _UPVALUE4_ then
    return _UPVALUE0_.MAX_LIMIT_REACHED
  end
  if db.insert(oneToOneMapTable, L5_18) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, rowid
end
function oneToOneMappingDelete(A0_19)
  if A0_19 == _UPVALUE0_.NIL or tonumber(A0_19) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(oneToOneMapTable, _UPVALUE1_, A0_19) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.deleteRow(oneToOneMapTable, _UPVALUE1_, A0_19) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_19
  end
  return _UPVALUE0_.SUCCESS, A0_19
end
function oneToOneMappingDeleteAll()
  local L0_20
  L0_20 = {}
  L0_20 = db.deleteAllRows(oneToOneMapTable)
  if not L0_20 then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function policiesGetAll()
  local L0_21
  L0_21 = db
  L0_21 = L0_21.getTable
  L0_21 = L0_21("IpsecVPNPolicy")
  return _UPVALUE0_.SUCCESS, L0_21
end
