local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/fwValidations")
L0_0 = "1"
fw.core.webAccess = {}
webAccessStatusTable = "webAccessStatus"
;({}).status = "accessStatus"
webAccessInfoTable = "webAccessInfo"
;({}).name = "name"
;({}).accessType = "accessType"
;({}).IpAddr = "IpAddr"
;({}).vlanName = "vlanName"
;({}).vlanIpAddr = "vlanIpAddr"
;({}).vlanSubnet = "vlanSubnet"
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
  MAX_WEB_ACCESS_MGMT = 50
elseif PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-500_Ax" or PRODUCT_ID == "DSR-500N_Ax" then
  MAX_WEB_ACCESS_MGMT = 30
elseif UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-250N" then
  MAX_WEB_ACCESS_MGMT = 20
elseif UNIT_NAME == "DSR-150" or UNIT_NAME == "DSR-150N" then
  MAX_WEB_ACCESS_MGMT = 10
end
function fw.core.webAccess.statusGet()
  local L0_1
  L0_1 = db.getAttribute(webAccessStatusTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.status)
  if L0_1 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_1
end
function fw.core.webAccess.statusGetNext(A0_2)
  local L2_3
  L2_3 = returnCodes
  L2_3 = L2_3.NOT_SUPPORTED
  return L2_3, A0_2
end
function getVlanInfo(A0_4)
  local L1_5
  L1_5 = "AddressFamily = '2' and LogicalIfName = '"
  L1_5 = L1_5 .. A0_4 .. "'"
  ipAddr = db.getRowWhere("ifStatic", L1_5)["ifStatic.StaticIp"]
  subnet = db.getRowWhere("ifStatic", L1_5)["ifStatic.NetMask"]
  return ipAddr, subnet
end
function fw.core.webAccess.statusEnable()
  local L0_6, L1_7, L2_8, L3_9, L4_10
  L2_8 = db
  L2_8 = L2_8.setAttribute
  L3_9 = webAccessStatusTable
  L4_10 = _UPVALUE0_
  L2_8 = L2_8(L3_9, L4_10, _UPVALUE1_, _UPVALUE2_.status, _UPVALUE3_)
  L1_7 = L2_8
  if not L1_7 then
    L2_8 = returnCodes
    L2_8 = L2_8.FAILURE
    return L2_8
  end
  L2_8 = db
  L2_8 = L2_8.getTable
  L3_9 = webAccessInfoTable
  L2_8 = L2_8(L3_9)
  L3_9 = #L2_8
  if L3_9 == 0 then
    L3_9, L4_10 = nil, nil
    L3_9, L4_10 = getVlanInfo("LAN")
    L1_7 = fw.core.webAccess.add("Default", 1, "NULL", "LAN", L3_9, L4_10)
  end
  L3_9 = returnCodes
  L3_9 = L3_9.SUCCESS
  return L3_9
end
function fw.core.webAccess.statusDisable()
  local L0_11, L1_12
  L1_12 = db.setAttribute(webAccessStatusTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.status, _UPVALUE3_)
  if not L1_12 then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS
end
function fw.core.webAccess.add(A0_13, A1_14, A2_15, A3_16, A4_17, A5_18)
  local L6_19, L7_20, L8_21, L9_22, L10_23, L11_24, L12_25, L13_26, L14_27
  L7_20 = {}
  L8_21, L9_22 = nil, nil
  L10_23 = DUMMY_COOKIE
  L11_24 = nil
  L12_25 = db
  L12_25 = L12_25.getTable
  L13_26 = webAccessInfoTable
  L12_25 = L12_25(L13_26)
  L13_26 = #L12_25
  L14_27 = MAX_WEB_ACCESS_MGMT
  if L13_26 >= L14_27 then
    L13_26 = returnCodes
    L13_26 = L13_26.MAX_WEB_ACCESS_LIST_REACHED
    return L13_26
  end
  L13_26 = fw
  L13_26 = L13_26.core
  L13_26 = L13_26.webAccess
  L13_26 = L13_26.statusGet
  L14_27 = L13_26()
  L11_24 = L14_27
  L6_19 = L13_26
  L13_26 = _UPVALUE0_
  if L11_24 ~= L13_26 then
    L13_26 = returnCodes
    L13_26 = L13_26.COMP_FIREWALL_WEBACCESS_DISABLED
    L14_27 = L10_23
    return L13_26, L14_27
  end
  L13_26 = fw_textValidation
  L14_27 = A0_13
  L13_26 = L13_26(L14_27)
  L6_19 = L13_26
  L13_26 = returnCodes
  L13_26 = L13_26.SUCCESS
  if L6_19 ~= L13_26 then
    L13_26 = returnCodes
    L13_26 = L13_26.INVALID_ARGUMENT
    L14_27 = L10_23
    return L13_26, L14_27
  end
  L13_26 = booleanCheck
  L14_27 = A1_14
  L13_26 = L13_26(L14_27)
  L6_19 = L13_26
  L13_26 = returnCodes
  L13_26 = L13_26.SUCCESS
  if L6_19 ~= L13_26 then
    L13_26 = returnCodes
    L13_26 = L13_26.INVALID_ARGUMENT
    L14_27 = L10_23
    return L13_26, L14_27
  end
  L13_26 = _UPVALUE1_
  if A1_14 == L13_26 then
    L13_26 = _UPVALUE2_
    if A2_15 == L13_26 then
      L13_26 = returnCodes
      L13_26 = L13_26.INVALID_ARGUMENT
      L14_27 = L10_23
      return L13_26, L14_27
    end
    L13_26 = ipv4Check
    L14_27 = A2_15
    L13_26 = L13_26(L14_27)
    L6_19 = L13_26
    if not L6_19 then
      L13_26 = returnCodes
      L13_26 = L13_26.INVALID_ARGUMENT
      return L13_26
    end
  else
    L13_26 = fw_textValidation
    L14_27 = A3_16
    L13_26 = L13_26(L14_27)
    L6_19 = L13_26
    L13_26 = returnCodes
    L13_26 = L13_26.SUCCESS
    if L6_19 ~= L13_26 then
      L13_26 = returnCodes
      L13_26 = L13_26.INVALID_ARGUMENT
      L14_27 = L10_23
      return L13_26, L14_27
    end
    L13_26 = _UPVALUE2_
    if A4_17 == L13_26 then
      L13_26 = returnCodes
      L13_26 = L13_26.INVALID_ARGUMENT
      L14_27 = L10_23
      return L13_26, L14_27
    end
    L13_26 = _UPVALUE2_
    if A5_18 == L13_26 then
      L13_26 = returnCodes
      L13_26 = L13_26.INVALID_ARGUMENT
      L14_27 = L10_23
      return L13_26, L14_27
    end
  end
  L13_26 = _UPVALUE3_
  L13_26 = L13_26.name
  L14_27 = "= '"
  L13_26 = L13_26 .. L14_27 .. A0_13 .. "'"
  L14_27 = db
  L14_27 = L14_27.getRowWhere
  L14_27 = L14_27(webAccessInfoTable, L13_26)
  L6_19 = L14_27
  if L6_19 then
    L14_27 = fwReturnCodes
    L14_27 = L14_27.COMP_FIREWALL_WEB_UNQIUE_VALUE
    return L14_27
  end
  L14_27 = _UPVALUE1_
  if A1_14 == L14_27 then
    L14_27 = _UPVALUE3_
    L14_27 = L14_27.accessType
    L14_27 = L14_27 .. "= 0" .. " and " .. _UPVALUE3_.IpAddr .. "= '" .. A2_15 .. "'"
    L6_19 = db.getRowWhere(webAccessInfoTable, L14_27)
    if L6_19 then
      return fwReturnCodes.COMP_FIREWALL_WEB_UNQIUE_VALUE
    end
  else
    L14_27 = _UPVALUE3_
    L14_27 = L14_27.accessType
    L14_27 = L14_27 .. "= 1" .. " and " .. _UPVALUE3_.vlanName .. "= '" .. A3_16 .. "'"
    L6_19 = db.getRowWhere(webAccessInfoTable, L14_27)
    if L6_19 then
      return fwReturnCodes.COMP_FIREWALL_WEB_UNQIUE_VALUE
    end
  end
  L14_27 = webAccessInfoTable
  L14_27 = L14_27 .. "." .. _UPVALUE3_.name
  L7_20[L14_27] = A0_13
  L14_27 = webAccessInfoTable
  L14_27 = L14_27 .. "." .. _UPVALUE3_.accessType
  L7_20[L14_27] = A1_14
  L14_27 = webAccessInfoTable
  L14_27 = L14_27 .. "." .. _UPVALUE3_.IpAddr
  L7_20[L14_27] = A2_15
  L14_27 = webAccessInfoTable
  L14_27 = L14_27 .. "." .. _UPVALUE3_.vlanName
  L7_20[L14_27] = A3_16
  L14_27 = webAccessInfoTable
  L14_27 = L14_27 .. "." .. _UPVALUE3_.vlanIpAddr
  L7_20[L14_27] = A4_17
  L14_27 = webAccessInfoTable
  L14_27 = L14_27 .. "." .. _UPVALUE3_.vlanSubnet
  L7_20[L14_27] = A5_18
  L14_27 = db
  L14_27 = L14_27.insert
  L14_27 = L14_27(webAccessInfoTable, L7_20)
  L6_19 = L14_27
  if not L6_19 then
    L14_27 = returnCodes
    L14_27 = L14_27.FAILURE
    return L14_27
  end
  L14_27 = db
  L14_27 = L14_27.getAttribute
  L14_27 = L14_27(webAccessInfoTable, _UPVALUE3_.name, A0_13, _UPVALUE4_)
  L10_23 = L14_27
  L14_27 = _UPVALUE2_
  if L10_23 == L14_27 then
    L14_27 = returnCodes
    L14_27 = L14_27.COOKIEFAIL
    return L14_27
  end
  L14_27 = returnCodes
  L14_27 = L14_27.SUCCESS
  return L14_27
end
function fw.core.webAccess.edit(A0_28, A1_29, A2_30, A3_31, A4_32, A5_33, A6_34)
  local L7_35, L8_36, L9_37, L10_38, L11_39, L12_40, L13_41
  L8_36 = {}
  L9_37, L10_38 = nil, nil
  L11_39 = _UPVALUE0_
  if A6_34 == L11_39 then
    L11_39 = returnCodes
    L11_39 = L11_39.INVALID_ARGUMENT
    return L11_39
  end
  L11_39 = db
  L11_39 = L11_39.getAttribute
  L12_40 = webAccessInfoTable
  L13_41 = _UPVALUE1_
  L11_39 = L11_39(L12_40, L13_41, A6_34, _UPVALUE2_.name)
  if L11_39 == "Default" then
    L12_40 = returnCodes
    L12_40 = L12_40.NOT_SUPPORTED
    return L12_40
  end
  L12_40 = db
  L12_40 = L12_40.existsRow
  L13_41 = webAccessInfoTable
  L12_40 = L12_40(L13_41, _UPVALUE1_, A6_34)
  L7_35 = L12_40
  if not L7_35 then
    L12_40 = returnCodes
    L12_40 = L12_40.COOKIEFAIL
    return L12_40
  end
  L12_40 = fw_textValidation
  L13_41 = A0_28
  L12_40 = L12_40(L13_41)
  L7_35 = L12_40
  L12_40 = returnCodes
  L12_40 = L12_40.SUCCESS
  if L7_35 ~= L12_40 then
    L12_40 = returnCodes
    L12_40 = L12_40.INVALID_ARGUMENT
    L13_41 = A6_34
    return L12_40, L13_41
  end
  L12_40 = booleanCheck
  L13_41 = A1_29
  L12_40 = L12_40(L13_41)
  L7_35 = L12_40
  L12_40 = returnCodes
  L12_40 = L12_40.SUCCESS
  if L7_35 ~= L12_40 then
    L12_40 = returnCodes
    L12_40 = L12_40.INVALID_ARGUMENT
    L13_41 = A6_34
    return L12_40, L13_41
  end
  L12_40 = _UPVALUE3_
  if A1_29 == L12_40 then
    L12_40 = _UPVALUE0_
    if A2_30 == L12_40 then
      L12_40 = returnCodes
      L12_40 = L12_40.INVALID_ARGUMENT
      L13_41 = A6_34
      return L12_40, L13_41
    end
    L12_40 = ipv4Check
    L13_41 = A2_30
    L12_40 = L12_40(L13_41)
    L7_35 = L12_40
    if not L7_35 then
      L12_40 = returnCodes
      L12_40 = L12_40.INVALID_ARGUMENT
      return L12_40
    end
  else
    L12_40 = fw_textValidation
    L13_41 = A3_31
    L12_40 = L12_40(L13_41)
    L7_35 = L12_40
    L12_40 = returnCodes
    L12_40 = L12_40.SUCCESS
    if L7_35 ~= L12_40 then
      L12_40 = returnCodes
      L12_40 = L12_40.INVALID_ARGUMENT
      L13_41 = A6_34
      return L12_40, L13_41
    end
    L12_40 = _UPVALUE0_
    if A4_32 == L12_40 then
      L12_40 = returnCodes
      L12_40 = L12_40.INVALID_ARGUMENT
      L13_41 = A6_34
      return L12_40, L13_41
    end
    L12_40 = _UPVALUE0_
    if A5_33 == L12_40 then
      L12_40 = returnCodes
      L12_40 = L12_40.INVALID_ARGUMENT
      L13_41 = A6_34
      return L12_40, L13_41
    end
  end
  L12_40 = _UPVALUE2_
  L12_40 = L12_40.name
  L13_41 = "= '"
  L12_40 = L12_40 .. L13_41 .. A0_28 .. "' and " .. _UPVALUE1_ .. " != " .. A6_34
  L13_41 = db
  L13_41 = L13_41.getRowWhere
  L13_41 = L13_41(webAccessInfoTable, L12_40)
  L7_35 = L13_41
  if L7_35 then
    L13_41 = fwReturnCodes
    L13_41 = L13_41.COMP_FIREWALL_WEB_UNQIUE_VALUE
    return L13_41
  end
  L13_41 = _UPVALUE3_
  if A1_29 == L13_41 then
    L13_41 = _UPVALUE2_
    L13_41 = L13_41.accessType
    L13_41 = L13_41 .. "= 0 and " .. _UPVALUE2_.IpAddr .. "= '" .. A2_30 .. "' and " .. _UPVALUE1_ .. "!= " .. A6_34
    L7_35 = db.getRowWhere(webAccessInfoTable, L13_41)
    if L7_35 then
      return fwReturnCodes.COMP_FIREWALL_WEB_UNQIUE_VALUE
    end
  else
    L13_41 = _UPVALUE2_
    L13_41 = L13_41.accessType
    L13_41 = L13_41 .. "= 1 and " .. _UPVALUE2_.vlanName .. "= '" .. A3_31 .. "' and " .. _UPVALUE1_ .. "!= " .. A6_34
    L7_35 = db.getRowWhere(webAccessInfoTable, L13_41)
    if L7_35 then
      return fwReturnCodes.COMP_FIREWALL_WEB_UNQIUE_VALUE
    end
  end
  L13_41 = webAccessInfoTable
  L13_41 = L13_41 .. "." .. _UPVALUE2_.name
  L8_36[L13_41] = A0_28
  L13_41 = webAccessInfoTable
  L13_41 = L13_41 .. "." .. _UPVALUE2_.accessType
  L8_36[L13_41] = A1_29
  L13_41 = webAccessInfoTable
  L13_41 = L13_41 .. "." .. _UPVALUE2_.IpAddr
  L8_36[L13_41] = A2_30
  L13_41 = webAccessInfoTable
  L13_41 = L13_41 .. "." .. _UPVALUE2_.vlanName
  L8_36[L13_41] = A3_31
  L13_41 = webAccessInfoTable
  L13_41 = L13_41 .. "." .. _UPVALUE2_.vlanIpAddr
  L8_36[L13_41] = A4_32
  L13_41 = webAccessInfoTable
  L13_41 = L13_41 .. "." .. _UPVALUE2_.vlanSubnet
  L8_36[L13_41] = A5_33
  L13_41 = db
  L13_41 = L13_41.update
  L13_41 = L13_41(webAccessInfoTable, L8_36, A6_34)
  L7_35 = L13_41
  if not L7_35 then
    L13_41 = returnCodes
    L13_41 = L13_41.FAILURE
    return L13_41
  end
  L13_41 = returnCodes
  L13_41 = L13_41.SUCCESS
  return L13_41, A6_34
end
function fw.core.webAccess.Get()
  local L0_42, L1_43, L2_44, L3_45, L4_46, L5_47, L6_48, L7_49, L8_50
  L8_50 = {}
  L1_43, L0_42 = getFirstCookie(webAccessInfoTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_43 then
    return L1_43
  end
  L8_50 = db.getRow(webAccessInfoTable, _UPVALUE0_, L0_42)
  if L8_50 == _UPVALUE1_ then
    return returnCodes.FAILURE
  end
  L2_44 = L8_50[webAccessInfoTable .. "." .. _UPVALUE2_.name]
  L3_45 = L8_50[webAccessInfoTable .. "." .. _UPVALUE2_.accessType]
  L4_46 = L8_50[webAccessInfoTable .. "." .. _UPVALUE2_.IpAddr]
  L5_47 = L8_50[webAccessInfoTable .. "." .. _UPVALUE2_.vlanName]
  L6_48 = L8_50[webAccessInfoTable .. "." .. _UPVALUE2_.vlanIpAddr]
  L7_49 = L8_50[webAccessInfoTable .. "." .. _UPVALUE2_.vlanSubnet]
  return returnCodes.SUCCESS, L0_42, L2_44, L3_45, L4_46, L5_47, L6_48, L7_49
end
function fw.core.webAccess.GetNext(A0_51)
  local L1_52, L2_53, L3_54, L4_55, L5_56, L6_57, L7_58, L8_59
  L8_59 = {}
  if A0_51 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_52, rowId = getNextCookie(webAccessInfoTable, _UPVALUE1_, A0_51)
  if returnCodes.SUCCESS ~= L1_52 then
    return L1_52
  end
  L8_59 = db.getRow(webAccessInfoTable, _UPVALUE1_, rowId)
  if subjectListConfigTbl == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  L2_53 = L8_59[webAccessInfoTable .. "." .. _UPVALUE2_.name]
  L3_54 = L8_59[webAccessInfoTable .. "." .. _UPVALUE2_.accessType]
  L4_55 = L8_59[webAccessInfoTable .. "." .. _UPVALUE2_.IpAddr]
  L5_56 = L8_59[webAccessInfoTable .. "." .. _UPVALUE2_.vlanName]
  L6_57 = L8_59[webAccessInfoTable .. "." .. _UPVALUE2_.vlanIpAddr]
  L7_58 = L8_59[webAccessInfoTable .. "." .. _UPVALUE2_.vlanSubnet]
  return returnCodes.SUCCESS, A0_51, L2_53, L3_54, L4_55, L5_56, L6_57, L7_58
end
function fw.core.webAccess.rowGet(A0_60)
  local L1_61, L2_62, L3_63, L4_64, L5_65, L6_66, L7_67, L8_68
  L8_68 = {}
  if A0_60 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  if A0_60 == "-1" then
    L8_68 = db.getDefaults(true, webAccessInfoTable)
  else
    L8_68 = db.getRow(webAccessInfoTable, _UPVALUE1_, A0_60)
  end
  if L8_68 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L8_68
end
function fw.core.webAccess.vlanInfoGet()
  local L0_69, L1_70
  L0_69 = {}
  L1_70 = returnCodes
  L1_70 = L1_70.FAILURE
  L0_69 = db.getTable(_UPVALUE0_)
  if L0_69 == returnCodes.NIL then
    return L1_70, L0_69
  end
  return returnCodes.SUCCESS, L0_69
end
function fw.core.webAccess.GetAll()
  local L0_71, L1_72, L2_73
  L2_73 = {}
  L1_72, L0_71 = fw.core.webAccess.statusGet()
  L2_73 = db.getTable(webAccessInfoTable, false)
  if L2_73 == _UPVALUE0_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L2_73
end
function fw.core.webAccess.delete(A0_74)
  local L1_75, L2_76, L3_77, L4_78, L5_79, L6_80, L7_81, L8_82, L9_83
  L4_78 = 0
  if A0_74 == L5_79 then
    return L5_79
  end
  for L8_82, L9_83 in L5_79(L6_80) do
    tempTab = {}
    L1_75 = db.existsRow(webAccessInfoTable, _UPVALUE1_, L9_83)
    if not L1_75 then
      return returnCodes.COOKIEFAIL
    end
    if db.getAttribute(webAccessInfoTable, _UPVALUE1_, L9_83, "name") ~= "Default" then
      L3_77 = db.deleteRow(webAccessInfoTable, _UPVALUE1_, L9_83)
      L4_78 = L4_78 + 1
      if not L3_77 then
        return returnCodes.FAILURE
      end
    end
  end
  if L5_79 > 0 then
    return L5_79
  else
    return L5_79
  end
end
function fw.core.webAccess.deleteAll()
  local L0_84
  L0_84 = db.deleteAllRows(webAccessInfoTable)
  if not L0_84 then
    return returnCodes.FAILURE, cookie
  end
  return returnCodes.SUCCESS, cookie
end
function fw.core.webAccess.nameGet()
  local L0_85, L1_86, L2_87
  L1_86, L0_85 = getFirstCookie(webAccessInfoTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_86 then
    return L1_86
  end
  L2_87 = db.getAttribute(webAccessInfoTable, _UPVALUE0_, L0_85, _UPVALUE1_.name)
  if L2_87 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_85, L2_87
end
function fw.core.webAccess.nameGetNext(A0_88)
  local L1_89, L2_90, L3_91
  L2_90, rowId = getNextCookie(webAccessInfoTable, _UPVALUE0_, L1_89)
  if returnCodes.SUCCESS ~= L2_90 then
    return L2_90
  end
  L3_91 = db.getAttribute(webAccessInfoTable, _UPVALUE0_, rowId, _UPVALUE1_.name)
  if L3_91 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, rowId, L3_91
end
function fw.core.webAccess.nameSet(A0_92, A1_93)
  local L2_94, L3_95, L4_96
  if A0_92 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_94 = db.existsRow(webAccessInfoTable, _UPVALUE1_, A0_92)
  if not L2_94 then
    return returnCodes.COOKIEFAIL
  end
  L2_94 = fw_textValidation(A1_93)
  if L2_94 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A0_92
  end
  L4_96 = db.setAttribute(webAccessInfoTable, _UPVALUE1_, A0_92, _UPVALUE2_.name, A1_93)
  if not L4_96 then
    return returnCodes.FAILURE, A0_92
  end
  return returnCodes.SUCCESS, A0_92
end
function fw.core.webAccess.accessTypeGet()
  local L0_97, L1_98, L2_99
  L1_98, L0_97 = getFirstCookie(webAccessInfoTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_98 then
    return L1_98
  end
  L2_99 = db.getAttribute(webAccessInfoTable, _UPVALUE0_, L0_97, _UPVALUE1_.accessType)
  if L2_99 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_97, L2_99
end
function fw.core.webAccess.accessTypeGetNext(A0_100)
  local L1_101, L2_102, L3_103
  L2_102, rowId = getNextCookie(webAccessInfoTable, _UPVALUE0_, L1_101)
  if returnCodes.SUCCESS ~= L2_102 then
    return L2_102
  end
  L3_103 = db.getAttribute(webAccessInfoTable, _UPVALUE0_, rowId, _UPVALUE1_.accessType)
  if L3_103 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, rowId, L3_103
end
function fw.core.webAccess.accessTypeSet(A0_104, A1_105)
  local L2_106, L3_107, L4_108
  if A0_104 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_106 = db.existsRow(webAccessInfoTable, _UPVALUE1_, A0_104)
  if not L2_106 then
    return returnCodes.COOKIEFAIL
  end
  L2_106 = fw_textValidation(A1_105)
  if L2_106 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A0_104
  end
  L4_108 = db.setAttribute(webAccessInfoTable, _UPVALUE1_, A0_104, _UPVALUE2_.accessType, A1_105)
  if not L4_108 then
    return returnCodes.FAILURE, A0_104
  end
  return returnCodes.SUCCESS, A0_104
end
function fw.core.webAccess.IpAddrGet()
  local L0_109, L1_110, L2_111
  L1_110, L0_109 = getFirstCookie(webAccessInfoTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_110 then
    return L1_110
  end
  L2_111 = db.getAttribute(webAccessInfoTable, _UPVALUE0_, L0_109, _UPVALUE1_.IpAddr)
  if L2_111 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_109, L2_111
end
function fw.core.webAccess.IpAddrGetNext(A0_112)
  local L1_113, L2_114, L3_115
  L2_114, rowId = getNextCookie(webAccessInfoTable, _UPVALUE0_, L1_113)
  if returnCodes.SUCCESS ~= L2_114 then
    return L2_114
  end
  L3_115 = db.getAttribute(webAccessInfoTable, _UPVALUE0_, rowId, _UPVALUE1_.IpAddr)
  if L3_115 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, rowId, L3_115
end
function fw.core.webAccess.IpAddrSet(A0_116, A1_117)
  local L2_118, L3_119, L4_120
  if A0_116 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_118 = db.existsRow(webAccessInfoTable, _UPVALUE1_, A0_116)
  if not L2_118 then
    return returnCodes.COOKIEFAIL
  end
  L2_118 = fw_textValidation(A1_117)
  if L2_118 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A0_116
  end
  L4_120 = db.setAttribute(webAccessInfoTable, _UPVALUE1_, A0_116, _UPVALUE2_.IpAddr, A1_117)
  if not L4_120 then
    return returnCodes.FAILURE, A0_116
  end
  return returnCodes.SUCCESS, A0_116
end
function fw.core.webAccess.vlanNameGet()
  local L0_121, L1_122, L2_123
  L1_122, L0_121 = getFirstCookie(webAccessInfoTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_122 then
    return L1_122
  end
  L2_123 = db.getAttribute(webAccessInfoTable, _UPVALUE0_, L0_121, _UPVALUE1_.vlanName)
  if L2_123 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_121, L2_123
end
function fw.core.webAccess.vlanNameGetNext(A0_124)
  local L1_125, L2_126, L3_127
  L2_126, rowId = getNextCookie(webAccessInfoTable, _UPVALUE0_, L1_125)
  if returnCodes.SUCCESS ~= L2_126 then
    return L2_126
  end
  L3_127 = db.getAttribute(webAccessInfoTable, _UPVALUE0_, rowId, _UPVALUE1_.vlanName)
  if L3_127 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, rowId, L3_127
end
function fw.core.webAccess.vlanNameSet(A0_128, A1_129)
  local L2_130, L3_131, L4_132
  if A0_128 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_130 = db.existsRow(webAccessInfoTable, _UPVALUE1_, A0_128)
  if not L2_130 then
    return returnCodes.COOKIEFAIL
  end
  L2_130 = fw_textValidation(A1_129)
  if L2_130 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A0_128
  end
  L4_132 = db.setAttribute(webAccessInfoTable, _UPVALUE1_, A0_128, _UPVALUE2_.vlanName, A1_129)
  if not L4_132 then
    return returnCodes.FAILURE, A0_128
  end
  return returnCodes.SUCCESS, A0_128
end
function fw.core.webAccess.vlanIpAddrGet()
  local L0_133, L1_134, L2_135
  L1_134, L0_133 = getFirstCookie(webAccessInfoTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_134 then
    return L1_134
  end
  L2_135 = db.getAttribute(webAccessInfoTable, _UPVALUE0_, L0_133, _UPVALUE1_.vlanIpAddr)
  if L2_135 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_133, L2_135
end
function fw.core.webAccess.vlanIpAddrGetNext(A0_136)
  local L1_137, L2_138, L3_139
  L2_138, rowId = getNextCookie(webAccessInfoTable, _UPVALUE0_, L1_137)
  if returnCodes.SUCCESS ~= L2_138 then
    return L2_138
  end
  L3_139 = db.getAttribute(webAccessInfoTable, _UPVALUE0_, rowId, _UPVALUE1_.vlanIpAddr)
  if L3_139 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, rowId, L3_139
end
function fw.core.webAccess.vlanIpAddrSet(A0_140, A1_141)
  local L2_142, L3_143, L4_144
  if A0_140 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_142 = db.existsRow(webAccessInfoTable, _UPVALUE1_, A0_140)
  if not L2_142 then
    return returnCodes.COOKIEFAIL
  end
  L2_142 = fw_textValidation(A1_141)
  if L2_142 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A0_140
  end
  L4_144 = db.setAttribute(webAccessInfoTable, _UPVALUE1_, A0_140, _UPVALUE2_.vlanIpAddr, A1_141)
  if not L4_144 then
    return returnCodes.FAILURE, A0_140
  end
  return returnCodes.SUCCESS, A0_140
end
function fw.core.webAccess.vlanSubnetGet()
  local L0_145, L1_146, L2_147
  L1_146, L0_145 = getFirstCookie(webAccessInfoTable, _UPVALUE0_)
  if returnCodes.SUCCESS ~= L1_146 then
    return L1_146
  end
  L2_147 = db.getAttribute(webAccessInfoTable, _UPVALUE0_, L0_145, _UPVALUE1_.vlanSubnet)
  if L2_147 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, L0_145, L2_147
end
function fw.core.webAccess.vlanSubnetGetNext(A0_148)
  local L1_149, L2_150, L3_151
  L2_150, rowId = getNextCookie(webAccessInfoTable, _UPVALUE0_, L1_149)
  if returnCodes.SUCCESS ~= L2_150 then
    return L2_150
  end
  L3_151 = db.getAttribute(webAccessInfoTable, _UPVALUE0_, rowId, _UPVALUE1_.vlanSubnet)
  if L3_151 == _UPVALUE2_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, rowId, L3_151
end
function fw.core.webAccess.vlanSubnetSet(A0_152, A1_153)
  local L2_154, L3_155, L4_156
  if A0_152 == _UPVALUE0_ then
    return returnCodes.INVALID_ARGUMENT
  end
  L2_154 = db.existsRow(webAccessInfoTable, _UPVALUE1_, A0_152)
  if not L2_154 then
    return returnCodes.COOKIEFAIL
  end
  L2_154 = fw_textValidation(A1_153)
  if L2_154 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, A0_152
  end
  L4_156 = db.setAttribute(webAccessInfoTable, _UPVALUE1_, A0_152, _UPVALUE2_.vlanSubnet, A1_153)
  if not L4_156 then
    return returnCodes.FAILURE, A0_152
  end
  return returnCodes.SUCCESS, A0_152
end
