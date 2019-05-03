local L0_0
L0_0 = require
L0_0("teamf1lualib/accounting_bl")
L0_0 = require
L0_0("teamf1lualib/errorMap")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.errorMap")
function radiusAccCfgInit()
  local L0_1, L1_2
  L0_1 = {}
  L1_2 = -1
  L0_1 = db.getRow("userAccountingEnable", "_ROWID_", 1)
  if L0_1 == nil then
    return L1_2, {}
  end
  L1_2 = L0_1["userAccountingEnable._ROWID_"]
  L0_1["userAccountingEnable.cookie"] = L1_2
  return L1_2, L0_1
end
function radiusAccCfgSave(A0_3)
  local L1_4, L2_5
  L1_4 = false
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.accountingSectionSet
  L2_5 = L2_5(A0_3)
  if L2_5 == _UPVALUE1_.SUCCESS then
    L1_4 = "OK"
  end
  statusMessage = _UPVALUE2_.errorStringGet(L2_5)
  return L1_4, statusMessage
end
function radiusAccCfgInputVal(A0_6)
  local L1_7
  L1_7 = A0_6["userAccountingEnable.captivePortal"]
  if L1_7 == nil then
    L1_7 = printCLIError
    L1_7("Invalid value for enabling/disabling captivePortal Radius Accounting.")
    L1_7 = false
    return L1_7
  end
  L1_7 = A0_6["userAccountingEnable.interimInterval"]
  if L1_7 ~= nil then
    L1_7 = tonumber
    L1_7 = L1_7(A0_6["userAccountingEnable.interimInterval"])
    if not (L1_7 < 300) then
      L1_7 = tonumber
      L1_7 = L1_7(A0_6["userAccountingEnable.interimInterval"])
    end
  elseif L1_7 > 3600 then
    L1_7 = printCLIError
    L1_7("Invalid interim Interval value.Please configure value between 300 and 3600.")
    L1_7 = false
    return L1_7
  end
  L1_7 = db
  L1_7 = L1_7.getAttribute
  L1_7 = L1_7("WanMode", "_ROWID_", 1, "Wanmode")
  if (tonumber(L1_7) == 1 or tonumber(L1_7) == 3) and A0_6["userAccountingEnable.routeIfaceName"] == nil then
    printCLIError("Invalid NAS Interface.Please configure valid NAS Interface.")
    return false
  end
  if A0_6["userAccountingEnable.cookie"] == nil then
    A0_6["userAccountingEnable.cookie"] = 1
  end
  return true
end
function radiusAccConfGet()
  local L0_8, L1_9, L2_10
  L0_8 = {}
  L1_9 = nil
  L2_10 = db
  L2_10 = L2_10.getRow
  L2_10 = L2_10("userAccountingEnable", "_ROWID_", 1)
  if L2_10 == nil then
    L2_10 = {}
    L2_10["userAccountingEnable.captivePortal"] = 0
    L2_10["userAccountingEnable.interimInterval"] = 300
    L2_10["userAccountingEnable.routeIfaceName"] = "WAN1"
  end
  if tonumber(L2_10["userAccountingEnable.captivePortal"]) == 0 then
    L1_9 = "DISABLED"
  else
    L1_9 = "ENABLED"
  end
  printLabel("--------Radius Accounting Configuration--------")
  resTab.insertField(L0_8, "CaptivePortal", L1_9)
  resTab.insertField(L0_8, "Radius Accounting Interim Interval", L2_10["userAccountingEnable.interimInterval"] or 300)
  if db.getAttribute("WanMode", "_ROWID_", 1, "Wanmode") == "1" or db.getAttribute("WanMode", "_ROWID_", 1, "Wanmode") == "3" then
    resTab.insertField(L0_8, "NAS Interface", L2_10["userAccountingEnable.routeIfaceName"] or "WAN1")
  end
  resTab.print(L0_8, 0)
end
