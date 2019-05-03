local L0_0
L0_0 = require
L0_0("teamf1lualib/nimfView")
L0_0 = "WanMode"
;({}).Wanmode = "Wanmode"
function ipModeConfig(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6
  L1_2 = "ERROR"
  errorFlag = L1_2
  L1_2 = ""
  statusCode = L1_2
  L1_2 = ""
  statusMessage = L1_2
  L1_2 = 5
  L2_3 = 0
  L3_4 = ""
  L4_5 = "0"
  L5_6 = "An IP Mode change will cause the device to re-boot.\n"
  if db.getAttribute("networkInfo", "networkInfo._ROWID_", "1", "netWorkMode") ~= A0_1["networkInfo.netWorkMode"] then
    printCLIError(L5_6)
    while L3_4 ~= "Y" and L3_4 ~= "N" and L3_4 ~= "y" and L3_4 ~= "n" and L1_2 > L2_3 do
      printCLIError("Are you sure you want to proceed [Y/N]?")
      L3_4 = io.stdin:read("*l")
      L2_3 = L2_3 + 1
    end
    if L3_4 == "N" or L3_4 == "n" or L2_3 == L1_2 then
      errorFlag = "ERROR"
      statusMessage = "Action Cancelled"
      return errorFlag, statusMessage
    elseif L3_4 == "Y" or L3_4 == "y" then
      L4_5 = "1"
    end
  end
  errorFlag, statusCode = nimfView.ipModeConfig(A0_1, "1", "edit")
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  if L4_5 == "1" then
    utilCLIReboot()
  end
  return errorFlag, statusMessage
end
function ipModeVal(A0_7)
  if db.getAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.Wanmode) ~= _UPVALUE4_ and A0_7["networkInfo.netWorkMode"] == _UPVALUE5_ then
    printCLIError("IP Mode can not be configured in IPv4 & IPv6 mode if " .. "WAN Mode is configured as Load Balancing or Auto-Rollover using WAN Port.")
    return false
  end
  return true
end
function ipModeInit(A0_8)
  local L1_9, L2_10
  L1_9 = 1
  L2_10 = {}
  L2_10 = db.getRow("networkInfo", "_ROWID_", "1")
  if L2_10 == nil then
    L2_10 = db.getDefaults(true, "networkInfo")
  end
  return L1_9, L2_10
end
function ipModeInfoGet()
  printLabel("IP MODE")
  row = db.getRow("networkInfo", "networkInfo._ROWID_", 1)
  if row["networkInfo.netWorkMode"] == "1" then
    print(" IPv4 only mode : Enabled")
  elseif row["networkInfo.netWorkMode"] ~= "1" then
    print(" IPv4 only mode : Disabled")
  end
  if row["networkInfo.netWorkMode"] == "3" then
    print(" IPv4/IPv6 mode : Enabled")
  elseif row["networkInfo.netWorkMode"] ~= "3" then
    print(" IPv4/IPv6 mode : Disabled")
  end
end
