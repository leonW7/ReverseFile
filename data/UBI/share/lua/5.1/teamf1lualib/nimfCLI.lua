local L0_0
L0_0 = require
L0_0("teamf1lualib/ifStatic")
L0_0 = require
L0_0("teamf1lualib/dhcpc")
L0_0 = require
L0_0("teamf1lualib/pppoe")
L0_0 = require
L0_0("teamf1lualib/pptp")
L0_0 = require
L0_0("teamf1lualib/l2tp")
L0_0 = require
L0_0("teamf1lualib/nimf")
L0_0 = require
L0_0("teamf1lualib/wanPort")
L0_0 = require
L0_0("teamf1lualib/nimfView")
L0_0 = require
L0_0("teamf1lualib/vlanConfig")
L0_0 = require
L0_0("teamf1lualib/I18N")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/wan_vlanOverWan")
L0_0 = require
L0_0("teamf1lualib/errorMap")
L0_0 = require
L0_0("teamf1lualib/wan_ipAliasing")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("validationsLuaLib")
L0_0 = require
L0_0("teamf1lualib/threeg_simCardAuth")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
if UNIT_NAME == "DWC-1000" then
  require("teamf1lualib/lmUtils")
end
;({}).netWorkMode = "netWorkMode"
HW_OFFLOAD_SCRIPT = "/pfrm2.0/etc/hardwareOffload.lua"
SYSTEM_DB_FILE_NAME = "/tmp/system.db"
PFRM_BIN_PATH = "/pfrm2.0/bin/lua"
function wanSetupGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7
  L0_1 = {}
  L1_2 = nimfView
  L1_2 = L1_2.wanConfigurationGet
  L2_3 = "WAN1"
  L1_2 = L1_2(L2_3)
  configRow = L1_2
  L1_2 = configRow
  L1_2 = L1_2["Wan.IspType"]
  L2_3 = ""
  L3_4 = ""
  L4_5 = ""
  L5_6 = ""
  L6_7 = configRow
  L6_7 = L6_7["Wan.AuthOpt"]
  if L6_7 == "1" then
    L4_5 = "Auto-Negotiate"
  else
    L6_7 = configRow
    L6_7 = L6_7["Wan.AuthOpt"]
    if L6_7 == "2" then
      L4_5 = "PAP"
    else
      L6_7 = configRow
      L6_7 = L6_7["Wan.AuthOpt"]
      if L6_7 == "3" then
        L4_5 = "CHAP"
      else
        L6_7 = configRow
        L6_7 = L6_7["Wan.AuthOpt"]
        if L6_7 == "4" then
          L4_5 = "MS-CHAP"
        else
          L4_5 = "MS-CHAPv2"
        end
      end
    end
  end
  L6_7 = configRow
  L6_7 = L6_7["Wan.JAuthOpt"]
  if L6_7 == "1" then
    L5_6 = "Auto-Negotiate"
  else
    L6_7 = configRow
    L6_7 = L6_7["Wan.JAuthOpt"]
    if L6_7 == "2" then
      L5_6 = "PAP"
    else
      L6_7 = configRow
      L6_7 = L6_7["Wan.JAuthOpt"]
      if L6_7 == "3" then
        L5_6 = "CHAP"
      else
        L6_7 = configRow
        L6_7 = L6_7["Wan.JAuthOpt"]
        if L6_7 == "4" then
          L5_6 = "MS-CHAP"
        else
          L5_6 = "MS-CHAPv2"
        end
      end
    end
  end
  L6_7 = configRow
  L6_7 = L6_7["Wan.SplitTunnel"]
  if L6_7 == "1" then
    L2_3 = "Enabled"
  else
    L2_3 = "Disabled"
  end
  L6_7 = configRow
  L6_7 = L6_7["Wan.MppeEncryptSupport"]
  if L6_7 == "1" then
    L3_4 = "Enabled"
  else
    L3_4 = "Disabled"
  end
  if L1_2 == "1" then
    L6_7 = resTab
    L6_7 = L6_7.insertField
    L6_7(L0_1, "STATIC Configuration", "")
  end
  if L1_2 == "9" then
    L6_7 = resTab
    L6_7 = L6_7.insertField
    L6_7(L0_1, "DUAL ACCESS PPPOE Configuration", "")
  end
  if L1_2 == "7" then
    L6_7 = resTab
    L6_7 = L6_7.insertField
    L6_7(L0_1, "Japanese Multiple PPPOE Configuration", "")
  end
  if L1_2 == "0" then
    L6_7 = resTab
    L6_7 = L6_7.insertField
    L6_7(L0_1, "Dynamic IP (DHCP) Configuration", "")
    L6_7 = resTab
    L6_7 = L6_7.insertField
    L6_7(L0_1, "Internet (IP) Address", "Get Dynamically From ISP")
    L6_7 = resTab
    L6_7 = L6_7.insertField
    L6_7(L0_1, "HostName", configRow["Wan.HostName"] or "")
    L6_7 = configRow
    L6_7 = L6_7["Wan.IsDNSDyn"]
    if L6_7 == "0" then
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "Domain Name Servers (DNS) Source", "Use these DNS Servers")
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "Primary DNS Server", configRow["Wan.PriDnsIpAddr"] or "0.0.0.0")
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "Secondary DNS Server", configRow["Wan.SecDnsIpAddr"] or "0.0.0.0")
    else
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "Domain Name Servers (DNS) Source", "Get Dynamically From ISP")
    end
  end
  if L1_2 == "2" then
    L6_7 = resTab
    L6_7 = L6_7.insertField
    L6_7(L0_1, "Pppoe Configuration", "")
  end
  if L1_2 == "3" then
    L6_7 = resTab
    L6_7 = L6_7.insertField
    L6_7(L0_1, "PPTP Configuration", "")
  elseif L1_2 == "4" then
    L6_7 = resTab
    L6_7 = L6_7.insertField
    L6_7(L0_1, "L2TP Configuration", "")
  elseif L1_2 == "5" then
    L6_7 = resTab
    L6_7 = L6_7.insertField
    L6_7(L0_1, "Russian PPTP Configuration", "")
  elseif L1_2 == "6" then
    L6_7 = resTab
    L6_7 = L6_7.insertField
    L6_7(L0_1, "Russian L2TP Configuration", "")
  end
  if L1_2 ~= "0" and L1_2 ~= "2" and L1_2 ~= "7" and L1_2 ~= "9" then
    if L1_2 ~= "1" then
      L6_7 = configRow
      L6_7 = L6_7["Wan.IsGetIpDyn"]
      if L6_7 == "1" then
        L6_7 = resTab
        L6_7 = L6_7.insertField
        L6_7(L0_1, "Address Mode", ":Dynamic Ip")
      else
        L6_7 = resTab
        L6_7 = L6_7.insertField
        L6_7(L0_1, "Address Mode", ":Static Ip")
        L6_7 = configRow
        L6_7 = L6_7["Wan.StaticDNS"]
        if L6_7 ~= nil then
          L6_7 = resTab
          L6_7 = L6_7.insertField
          L6_7(L0_1, "Static DNS IP", configRow["Wan.StaticDNS"])
        end
      end
    end
    L6_7 = configRow
    L6_7 = L6_7["Wan.IsGetIpDyn"]
    if L6_7 ~= "1" then
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "IP Address", configRow["Wan.IpAddr"] or "0.0.0.0")
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "IP Subnet Mask", configRow["Wan.SnetMask"] or "0.0.0.0")
    end
    if L1_2 ~= "1" then
      L6_7 = configRow
      L6_7 = L6_7["Wan.IsGetIpDyn"]
      if L6_7 ~= "1" then
        L6_7 = resTab
        L6_7 = L6_7.insertField
        L6_7(L0_1, "Gateway", configRow["Wan.Gateway"] or "0.0.0.0")
      end
    else
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "Gateway", configRow["Wan.GwIpAddr"] or "0.0.0.0")
    end
    L6_7 = configRow
    L6_7 = L6_7["Wan.IsDNSDyn"]
    if L6_7 == "0" then
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "Domain Name Servers (DNS) Source", "Use these DNS Servers")
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "Primary DNS Server", configRow["Wan.PriDnsIpAddr"] or "0.0.0.0")
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "Secondary DNS Server", configRow["Wan.SecDnsIpAddr"] or "0.0.0.0")
    else
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "Domain Name Servers (DNS) Source", "Get Dynamically From ISP")
    end
  end
  if L1_2 ~= "0" and L1_2 ~= "2" and L1_2 ~= "7" and L1_2 ~= "1" and L1_2 ~= "9" then
    L6_7 = resTab
    L6_7 = L6_7.insertField
    L6_7(L0_1, "Username", configRow["Wan.LoginName"] or "")
    L6_7 = resTab
    L6_7 = L6_7.insertField
    L6_7(L0_1, "Password", configRow["Wan.LoginPassword"] or "")
    L6_7 = resTab
    L6_7 = L6_7.insertField
    L6_7(L0_1, "Server IP Address", configRow["Wan.SvrIpAddr"] or "0.0.0.0")
    L6_7 = resTab
    L6_7 = L6_7.insertField
    L6_7(L0_1, "Split Tunnel", L2_3)
    if L1_2 == "3" or L1_2 == "5" then
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "MMPE EncryptionAddress", L3_4)
    else
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "Secret", configRow["Wan.Secret"] or "")
    end
    L6_7 = configRow
    L6_7 = L6_7["Wan.IdleTimeOutFlag"]
    if L6_7 == "0" then
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "Connectivity Type", "Keep Connected")
    else
      L6_7 = configRow
      L6_7 = L6_7["Wan.IdleTimeOutFlag"]
      if L6_7 == "1" then
        L6_7 = resTab
        L6_7 = L6_7.insertField
        L6_7(L0_1, "Connectivity Type", "Idle Time")
        L6_7 = resTab
        L6_7 = L6_7.insertField
        L6_7(L0_1, "Idle Time (in minutes)", configRow["Wan.IdleTime"])
      end
    end
  end
  if L1_2 == "2" or L1_2 == "7" or L1_2 == "9" then
    L6_7 = configRow
    L6_7 = L6_7["Wan.PIsGetIpDyn"]
    if L6_7 == "1" then
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "Address Mode", "Dynamic Ip")
    else
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "Address Mode", "Static Ip")
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "IP Address", configRow["Wan.PIpAddr"] or "0.0.0.0")
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "IP Subnet Mask", configRow["Wan.PSnetMask"] or "0.0.0.0")
    end
    L6_7 = resTab
    L6_7 = L6_7.insertField
    L6_7(L0_1, "Username", configRow["Wan.UserName"] or "")
    L6_7 = resTab
    L6_7 = L6_7.insertField
    L6_7(L0_1, "Password", configRow["Wan.Password"] or "")
    L6_7 = resTab
    L6_7 = L6_7.insertField
    L6_7(L0_1, "Service", configRow["Wan.Service"] or "")
    L6_7 = configRow
    L6_7 = L6_7["Wan.PppoeIdleTimeOutFlag"]
    if L6_7 == "0" then
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "Connectivity Type", "Keep Connected")
    else
      L6_7 = configRow
      L6_7 = L6_7["Wan.PppoeIdleTimeOutFlag"]
      if L6_7 == "1" then
        L6_7 = resTab
        L6_7 = L6_7.insertField
        L6_7(L0_1, "Connectivity Type", "Idle Time")
        L6_7 = resTab
        L6_7 = L6_7.insertField
        L6_7(L0_1, "Idle Time (in minutes)", configRow["Wan.PppoeIdleTimeOutValue"])
      end
    end
    L6_7 = resTab
    L6_7 = L6_7.insertField
    L6_7(L0_1, "Authentication Type", L4_5)
    L6_7 = configRow
    L6_7 = L6_7["Wan.IsDNSDyn"]
    if L6_7 == "0" then
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "Domain Name Servers (DNS) Source", "Use these DNS Servers")
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "Primary DNS Server", configRow["Wan.PriDnsIpAddr"] or "0.0.0.0")
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "Secondary DNS Server", configRow["Wan.SecDnsIpAddr"] or "0.0.0.0")
    else
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "Domain Name Servers (DNS) Source", "Get Dynamically From ISP")
    end
    if L1_2 == "7" then
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "Japanese Pppoe Configuration", "")
      L6_7 = configRow
      L6_7 = L6_7["Wan.JIsGetIpDyn"]
      if L6_7 == "1" then
        L6_7 = resTab
        L6_7 = L6_7.insertField
        L6_7(L0_1, "Secondary Profile Address Mode", ":Dynamic Ip")
      else
        L6_7 = resTab
        L6_7 = L6_7.insertField
        L6_7(L0_1, "Secondary Profile Address Mode", ":Static Ip")
        L6_7 = resTab
        L6_7 = L6_7.insertField
        L6_7(L0_1, "Secondary Profile IP Address", configRow["Wan.JIpAddr"] or "0.0.0.0")
        L6_7 = resTab
        L6_7 = L6_7.insertField
        L6_7(L0_1, "Secondary Profile IP Subnet Mask", configRow["Wan.JSnetMask"] or "0.0.0.0")
      end
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "Secondary Profile Username", configRow["Wan.JUserName"] or "")
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "Secondary Profile Password", configRow["Wan.JPassword"] or "")
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "Secondary Profile Service", configRow["Wan.JService"] or "")
      L6_7 = configRow
      L6_7 = L6_7["Wan.JppoeIdleTimeOutFlag"]
      if L6_7 == "0" then
        L6_7 = resTab
        L6_7 = L6_7.insertField
        L6_7(L0_1, "Secondary Profile Connectivity Type", "Keep Connected")
      else
        L6_7 = configRow
        L6_7 = L6_7["Wan.JppoeIdleTimeOutFlag"]
        if L6_7 == "1" then
          L6_7 = resTab
          L6_7 = L6_7.insertField
          L6_7(L0_1, "Secondary Profile Connectivity Type", "Idle Time")
          L6_7 = resTab
          L6_7 = L6_7.insertField
          L6_7(L0_1, "Secondary Profile Idle Time (in minutes)", configRow["Wan.JppoeIdleTimeOutValue"])
        end
      end
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "Secondary Profile Authentication Type", L5_6)
    end
    if L1_2 == "9" then
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, [[

DUAL ACCESS PPPOE - Internal Network Configuration]], "")
      L6_7 = configRow
      L6_7 = L6_7["Wan.GetIpFromIspPhy"]
      if L6_7 == "1" then
        L6_7 = resTab
        L6_7 = L6_7.insertField
        L6_7(L0_1, "Address Mode(Phy)", ":Dynamic Ip")
      else
        L6_7 = resTab
        L6_7 = L6_7.insertField
        L6_7(L0_1, "Address Mode(Phy)", ":Static Ip")
        L6_7 = resTab
        L6_7 = L6_7.insertField
        L6_7(L0_1, "IP Address(Phy)", configRow["Wan.StaticIpPhy"] or "0.0.0.0")
        L6_7 = resTab
        L6_7 = L6_7.insertField
        L6_7(L0_1, "IP Subnet Mask(Phy)", configRow["Wan.NetMaskPhy"] or "0.0.0.0")
        L6_7 = resTab
        L6_7 = L6_7.insertField
        L6_7(L0_1, "Gateway(Phy)", configRow["Wan.GatewayPhy"] or "0.0.0.0")
      end
      L6_7 = configRow
      L6_7 = L6_7["Wan.GetDnsFromIspPhy"]
      if L6_7 == "0" then
        L6_7 = resTab
        L6_7 = L6_7.insertField
        L6_7(L0_1, "Domain Name Servers (DNS) Source(Phy)", "Use these DNS Servers")
        L6_7 = resTab
        L6_7 = L6_7.insertField
        L6_7(L0_1, "Primary DNS Server(Phy)", configRow["Wan.PrimaryDnsPhy"] or "0.0.0.0")
        L6_7 = resTab
        L6_7 = L6_7.insertField
        L6_7(L0_1, "Secondary DNS Server(Phy)", configRow["Wan.SecondaryDnsPhy"] or "0.0.0.0")
      else
        L6_7 = resTab
        L6_7 = L6_7.insertField
        L6_7(L0_1, "Domain Name Servers (DNS) Source(Phy)", "Get Dynamically From ISP")
      end
    end
  end
  L6_7 = configRow
  L6_7 = L6_7["Wan.UseMac"]
  if L6_7 == "0" then
    L6_7 = resTab
    L6_7 = L6_7.insertField
    L6_7(L0_1, "MAC Address Source", "Use Default Address")
  else
    L6_7 = configRow
    L6_7 = L6_7["Wan.UseMac"]
    if L6_7 == "1" then
      L6_7 = resTab
      L6_7 = L6_7.insertField
      L6_7(L0_1, "MAC Address Source", "Clone your PC's MAC Address")
    else
      L6_7 = configRow
      L6_7 = L6_7["Wan.UseMac"]
      if L6_7 == "2" then
        L6_7 = resTab
        L6_7 = L6_7.insertField
        L6_7(L0_1, "MAC Address Source", "Use this MAC Address")
        L6_7 = resTab
        L6_7 = L6_7.insertField
        L6_7(L0_1, "MAC Address", configRow["Wan.MacAddr"] or "")
      end
    end
  end
  L6_7 = _UPVALUE0_
  L6_7 = L6_7.vlanOverWanConfigGet
  L6_7 = L6_7("WAN1")
  if L6_7 ~= _UPVALUE1_.SUCCESS then
    statusMessage = _UPVALUE2_.errorStringGet(L6_7)
    return "ERROR", statusMessage
  end
  if L6_7("WAN1")["VlanOverWan.VlanPortMode"] ~= _UPVALUE3_ then
    resTab.insertField(L0_1, "Vlan Over Wan", "ENABLE")
    resTab.insertField(L0_1, "vlan Id", L6_7("WAN1")["VlanOverWan.VlanId"])
  else
    resTab.insertField(L0_1, "Vlan Over Wan", "DISABLE")
  end
  printLabel("WAN1 Setup")
  resTab.print(L0_1, 0)
end
function wanStatusGet()
  local L0_8, L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16, L9_17, L10_18, L11_19, L12_20, L13_21, L14_22, L15_23, L16_24, L17_25, L18_26, L19_27, L20_28, L21_29, L22_30, L23_31, L24_32, L25_33, L26_34, L27_35, L28_36, L29_37, L30_38, L31_39, L32_40, L33_41, L34_42, L35_43, L36_44
  L0_8 = {}
  L1_9, L2_10, L3_11, L4_12, L5_13 = nil, nil, nil, nil, nil
  L6_14 = db
  L6_14 = L6_14.getAttribute
  L7_15 = "environment"
  L8_16 = "name"
  L9_17 = "NIMFSTATUS_PROGRAM"
  L10_18 = "value"
  L6_14 = L6_14(L7_15, L8_16, L9_17, L10_18)
  if L6_14 ~= nil then
    L7_15 = util
    L7_15 = L7_15.appendDebugOut
    L8_16 = "Exec = "
    L9_17 = os
    L9_17 = L9_17.execute
    L10_18 = L6_14
    L11_19 = " "
    L12_20 = DB_FILE_NAME
    L13_21 = " WAN1 2"
    L10_18 = L10_18 .. L11_19 .. L12_20 .. L13_21
    L9_17 = L9_17(L10_18)
    L8_16 = L8_16 .. L9_17
    L7_15(L8_16)
    L7_15 = util
    L7_15 = L7_15.appendDebugOut
    L8_16 = "Exec = "
    L9_17 = os
    L9_17 = L9_17.execute
    L10_18 = L6_14
    L11_19 = " "
    L12_20 = DB_FILE_NAME
    L13_21 = " WAN2 2"
    L10_18 = L10_18 .. L11_19 .. L12_20 .. L13_21
    L9_17 = L9_17(L10_18)
    L8_16 = L8_16 .. L9_17
    L7_15(L8_16)
  end
  L7_15 = db
  L7_15 = L7_15.getAttribute
  L8_16 = "networkInfo"
  L9_17 = "_ROWID_"
  L10_18 = "1"
  L11_19 = "netWorkMode"
  L7_15 = L7_15(L8_16, L9_17, L10_18, L11_19)
  L7_15 = L7_15 or "0"
  if L7_15 == "3" then
    L8_16 = db
    L8_16 = L8_16.getAttribute
    L9_17 = "environment"
    L10_18 = "name"
    L11_19 = "IPV6_GW_UPDATE"
    L12_20 = "value"
    L8_16 = L8_16(L9_17, L10_18, L11_19, L12_20)
    L6_14 = L8_16
    if L6_14 ~= nil then
      L8_16 = util
      L8_16 = L8_16.appendDebugOut
      L9_17 = "Exec = "
      L10_18 = os
      L10_18 = L10_18.execute
      L11_19 = L6_14
      L12_20 = " "
      L13_21 = DB_FILE_NAME
      L11_19 = L11_19 .. L12_20 .. L13_21
      L10_18 = L10_18(L11_19)
      L9_17 = L9_17 .. L10_18
      L8_16(L9_17)
    end
  end
  L8_16 = "WAN1"
  logIfName = L8_16
  L8_16 = "2"
  addressFamily = L8_16
  L8_16 = nimfView
  L8_16 = L8_16.wanStatusGetWrap
  L9_17 = logIfName
  L10_18 = addressFamily
  L8_16 = L8_16(L9_17, L10_18)
  configRow = L8_16
  L8_16 = configRow
  L8_16 = L8_16["Wan.operation"]
  L8_16 = L8_16 or ""
  L9_17 = "LogicalIfName = 'WAN1' and addressFamily = 2"
  L10_18 = db
  L10_18 = L10_18.getRowWhere
  L11_19 = "NimfConf"
  L12_20 = L9_17
  L10_18 = L10_18(L11_19, L12_20)
  L11_19 = db
  L11_19 = L11_19.getRowsWhere
  L12_20 = "ipAddressTable"
  L13_21 = L9_17
  L11_19 = L11_19(L12_20, L13_21)
  L12_20 = db
  L12_20 = L12_20.getRows
  L13_21 = "resolverConfig"
  L14_22 = "LogicalIfName"
  L15_23 = "WAN1"
  L12_20 = L12_20(L13_21, L14_22, L15_23)
  L13_21 = db
  L13_21 = L13_21.getRows
  L14_22 = "defaultRouters"
  L15_23 = "LogicalIfName"
  L16_24 = "WAN1"
  L13_21 = L13_21(L14_22, L15_23, L16_24)
  L14_22 = db
  L14_22 = L14_22.getAttribute
  L15_23 = "networkInterface"
  L16_24 = "LogicalIfName"
  L17_25 = "WAN1"
  L18_26 = "interfaceName"
  L14_22 = L14_22(L15_23, L16_24, L17_25, L18_26)
  L15_23 = db
  L15_23 = L15_23.getAttribute
  L16_24 = "networkInterface"
  L17_25 = "LogicalIfName"
  L18_26 = "WAN1"
  L19_27 = "IfStatus"
  L15_23 = L15_23(L16_24, L17_25, L18_26, L19_27)
  L15_23 = L15_23 or ""
  L16_24 = ""
  L17_25 = ""
  L18_26 = ""
  L19_27 = ""
  L20_28 = ""
  L21_29 = {}
  L22_30 = {}
  L23_31 = {}
  L24_32 = ""
  if L14_22 ~= nil then
    L25_33 = nimfView
    L25_33 = L25_33.macAddressGet
    L26_34 = logIfName
    L25_33 = L25_33(L26_34)
    L16_24 = L25_33
  end
  L25_33 = L10_18["NimfConf.ConnectionType"]
  if L25_33 ~= nil then
    L25_33 = L10_18["NimfConf.ConnectionType"]
    if L25_33 == "dhcpc" then
      L18_26 = "Dynamic IP (DHCP)"
    else
      L25_33 = L10_18["NimfConf.ConnectionType"]
      if L25_33 == "ifStatic" then
        L18_26 = "STATIC"
      else
        L25_33 = L10_18["NimfConf.ConnectionType"]
        if L25_33 == "pppoe" then
          L25_33 = _UPVALUE0_
          L26_34 = " = '"
          L25_33 = L25_33 .. L26_34 .. L27_35 .. L28_36
          L26_34 = false
          L22_30 = L27_35
          if L22_30 ~= L27_35 then
            L26_34 = true
            for L30_38, L31_39 in L27_35(L28_36) do
              L32_40 = _UPVALUE1_
              L33_41 = "."
              L32_40 = L32_40 .. L33_41 .. L34_42
              L32_40 = L31_39[L32_40]
              L33_41 = _UPVALUE4_
              if L32_40 == L33_41 then
                L26_34 = false
              end
            end
          end
          if L26_34 then
            L18_26 = "JPPPOE"
            L21_29 = L22_30
          else
            L18_26 = "PPPOE"
          end
        else
          L25_33 = L10_18["NimfConf.ConnectionType"]
          if L25_33 == "pptp" then
            L18_26 = "PPTP"
          else
            L25_33 = L10_18["NimfConf.ConnectionType"]
            if L25_33 == "l2tp" then
              L18_26 = "L2TP"
            else
              L25_33 = L10_18["NimfConf.ConnectionType"]
              if L25_33 == "dualPppoe" then
                L18_26 = "DPPPOE"
                L25_33 = db
                L25_33 = L25_33.getRowWhere
                L26_34 = "DualPppoe"
                L25_33 = L25_33(L26_34, L27_35)
                L23_31 = L25_33
              end
            end
          end
        end
      end
    end
  end
  if L18_26 == "PPTP" then
    L25_33 = db
    L25_33 = L25_33.getAttribute
    L26_34 = "PPTP"
    L25_33 = L25_33(L26_34, L27_35, L28_36, L29_37)
    L1_9 = L25_33
  elseif L18_26 == "L2TP" then
    L25_33 = db
    L25_33 = L25_33.getAttribute
    L26_34 = "L2TP"
    L25_33 = L25_33(L26_34, L27_35, L28_36, L29_37)
    L2_10 = L25_33
  end
  L25_33 = db
  L25_33 = L25_33.getRowWhere
  L26_34 = "NimfStatus"
  L25_33 = L25_33(L26_34, L27_35)
  if L25_33 ~= nil then
    L26_34 = L25_33["NimfStatus.Nimfstatus"]
    L19_27 = L26_34 or ""
  end
  L26_34 = db
  L26_34 = L26_34.getRowWhere
  L26_34 = L26_34(L27_35, L28_36)
  if L26_34 ~= nil then
    L20_28 = L27_35 or ""
  end
  if L27_35 == "1" then
    L17_25 = "Enabled"
  else
    L17_25 = "Disabled"
  end
  L27_35(L28_36, L29_37, L30_38)
  L30_38 = L16_24 or ""
  L27_35(L28_36, L29_37, L30_38)
  if L18_26 ~= "JPPPOE" then
    if L11_19 then
      for L32_40, L33_41 in L29_37(L30_38) do
        if L28_36 ~= L35_43 then
        end
      end
    end
  else
    if L18_26 == "JPPPOE" then
      if L11_19 then
        for L32_40, L33_41 in L29_37(L30_38) do
          if L28_36 ~= L35_43 then
          end
        end
      end
      if L29_37 == 2 then
        if L29_37 == 2 then
          L32_40 = "r"
          if L30_38 then
            L32_40 = L30_38
            L33_41 = "*all"
            L29_37 = L31_39 or ""
            L32_40 = ", "
            L33_41 = L29_37
            L32_40 = L30_38
            L31_39(L32_40)
          end
        end
      end
    else
    end
  end
  if L18_26 == "DPPPOE" then
    if L31_39 == "1" then
      L32_40 = "/var/russia_dualPppoe.conf"
      L33_41 = "r"
      if L31_39 then
        L33_41 = L31_39
        L32_40 = L31_39.read
        L32_40 = L32_40(L33_41, L34_42)
        L24_32 = L32_40 or "MM"
        L33_41 = L31_39
        L32_40 = L31_39.read
        L32_40 = L32_40(L33_41, L34_42)
        L30_38 = L32_40 or ""
        L33_41 = L31_39
        L32_40 = L31_39.read
        L32_40 = L32_40(L33_41, L34_42)
        L29_37 = L32_40 or ""
      else
        L24_32 = "0.0.0.0"
      end
      L32_40 = L27_35
      L33_41 = ", "
    elseif L31_39 == "0" and L15_23 == "1" then
      if L31_39 ~= nil then
        if L31_39 ~= nil then
          if L31_39 ~= nil then
            L24_32 = L31_39 or "DD"
          end
        end
      else
        L24_32 = "0.0.0.0"
      end
      L32_40 = ", "
      L33_41 = L29_37
    end
  end
  if L1_9 == "1" then
    L32_40 = "WAN1"
    L32_40, L33_41 = nil, nil
    if L34_42 == 0 then
      L3_11 = L34_42 or ""
      L32_40 = L34_42 or ""
      L33_41 = L34_42 or ""
      L4_12 = L34_42 or ""
      L5_13 = "0.0.0.0"
    else
      rPptp_file = L34_42
      if L34_42 then
        L3_11 = L34_42 or ""
        L32_40 = L34_42 or ""
        L33_41 = L34_42 or ""
        L4_12 = L34_42 or ""
        L5_13 = L34_42 or ""
        L34_42(L35_43)
      else
        L3_11 = "0.0.0.0"
        L32_40 = "0.0.0.0"
        L33_41 = "0.0.0.0"
        L4_12 = "0.0.0.0"
        L5_13 = "0.0.0.0"
      end
    end
  elseif L2_10 == "1" then
    L32_40 = "WAN1"
    L32_40, L33_41 = nil, nil
    if L34_42 == 0 then
      L3_11 = L34_42 or ""
      L32_40 = L34_42 or ""
      L33_41 = L34_42 or ""
      L4_12 = L34_42 or ""
      L5_13 = "0.0.0.0"
    else
      rL2tp_file = L34_42
      if L34_42 then
        L3_11 = L34_42 or ""
        L32_40 = L34_42 or ""
        L33_41 = L34_42 or ""
        L4_12 = L34_42 or ""
        L5_13 = L34_42 or ""
        L34_42(L35_43)
      else
        L3_11 = "0.0.0.0"
        L32_40 = "0.0.0.0"
        L33_41 = "0.0.0.0"
        L4_12 = "0.0.0.0"
        L5_13 = "0.0.0.0"
      end
    end
  end
  L32_40 = L27_35 or ""
  L29_37(L30_38, L31_39, L32_40)
  if L15_23 == "1" then
    L15_23 = "UP"
  elseif L15_23 == "2" then
    L15_23 = "UP(IPv6)"
  elseif L15_23 == "3" then
    L15_23 = "UP(IPv4 and IPv6)"
  elseif L15_23 == "0" then
    L15_23 = "DOWN"
  end
  if L18_26 == "JPPPOE" then
    L32_40 = L15_23
    L33_41 = " ("
    if L31_39 == 2 then
      L32_40 = "/var/wan101Ip"
      L33_41 = "r"
      if L31_39 then
        L32_40 = L30_38
        L33_41 = ","
        L33_41 = L31_39
        L32_40 = L31_39.close
        L32_40(L33_41)
      else
        L32_40 = L30_38
        L33_41 = ","
      end
    end
    L15_23 = L30_38
  end
  if L18_26 == "DPPPOE" then
    if L30_38 == "1" then
      L32_40 = "r"
      if L30_38 then
      else
      end
    elseif L30_38 == "0" then
      if L15_23 == "UP" then
      else
      end
    end
    L32_40 = L29_37
    L33_41 = " ("
    L15_23 = L30_38 .. L31_39 .. L32_40 .. L33_41 .. L34_42 .. L35_43
  end
  if L1_9 == "1" then
    L32_40 = "WAN1"
    L33_41 = "GetIpFromIsp"
    L32_40 = "/var/russia_pptp.conf"
    L33_41 = "r"
    isFile = L31_39
    if L31_39 then
      L32_40 = L31_39
      L31_39(L32_40)
    else
    end
    L32_40 = L29_37
    L32_40 = ", "
    L33_41 = L30_38
    L15_23 = L31_39 .. L32_40 .. L33_41 .. L34_42
  elseif L2_10 == "1" then
    L32_40 = "WAN1"
    L33_41 = "GetIpFromIsp"
    L32_40 = "/var/russia_l2tp.conf"
    L33_41 = "r"
    isFile = L31_39
    if L31_39 then
      L32_40 = L31_39
      L31_39(L32_40)
    else
    end
    L32_40 = L29_37
    L32_40 = ", "
    L33_41 = L30_38
    L15_23 = L31_39 .. L32_40 .. L33_41 .. L34_42
  end
  L32_40 = L15_23 or ""
  L29_37(L30_38, L31_39, L32_40)
  L32_40 = L17_25 or ""
  L29_37(L30_38, L31_39, L32_40)
  if L18_26 ~= "DPPPOE" then
    if L1_9 == "1" then
      L32_40 = "Russian dual access PPTP"
      L29_37(L30_38, L31_39, L32_40)
    elseif L2_10 == "1" then
      L32_40 = "Russian dual access L2TP"
      L29_37(L30_38, L31_39, L32_40)
    elseif L18_26 == "JPPPOE" then
      L32_40 = "Japanese multiple PPPoE"
      L29_37(L30_38, L31_39, L32_40)
    else
      L32_40 = L18_26 or ""
      L29_37(L30_38, L31_39, L32_40)
    end
  else
    L32_40 = "Russian dual access PPPoE"
    L29_37(L30_38, L31_39, L32_40)
  end
  L32_40 = L19_27 or ""
  L29_37(L30_38, L31_39, L32_40)
  L32_40 = L20_28 or ""
  L29_37(L30_38, L31_39, L32_40)
  L32_40 = "_ROWID_"
  L33_41 = "1"
  if L30_38 ~= nil then
    L32_40 = L30_38["WanMode.Wanmode"]
    if L32_40 == "2" then
    else
    end
    if L31_39 ~= nil then
      if L31_39 == "WAN1" then
      else
      end
    else
    end
    L32_40 = L30_38["WanMode.Wanmode"]
    if L32_40 == "2" then
      L32_40 = "Auto-Rollover using WAN port"
      L33_41 = L31_39
    else
      L32_40 = L30_38["WanMode.Wanmode"]
      if L32_40 == "1" then
      else
        L32_40 = L30_38["WanMode.Wanmode"]
        if L32_40 == "3" then
        else
          L32_40 = L30_38["WanMode.Wanmode"]
          if L32_40 == "0" then
            L32_40 = "Use only single WAN port"
            L33_41 = L31_39
          end
        end
      end
    end
  end
  L32_40 = "unitInfo"
  L33_41 = "_ROWID_"
  if L31_39 == "DSR-1000N" or L31_39 == "DSR-1000" or L31_39 == "DSR-500N" or L31_39 == "DSR-500" then
    L32_40 = resTab
    L32_40 = L32_40.insertField
    L33_41 = L0_8
    L35_43 = L29_37 or ""
    L32_40(L33_41, L34_42, L35_43)
  end
  L32_40 = ""
  if L13_21 then
    L33_41 = 0
    for _FORV_37_, _FORV_38_ in L34_42(L35_43) do
      L33_41 = L33_41 + 1
      if L13_21[L33_41]["defaultRouters.nextHopGateway"] ~= nil and L13_21[L33_41]["defaultRouters.nextHopGateway"] ~= "" and L32_40 == "" then
        L32_40 = L32_40 .. L13_21[L33_41]["defaultRouters.nextHopGateway"]
      else
      end
    end
  end
  if L18_26 == "JPPPOE" then
    L33_41 = L32_40
    L32_40 = L33_41 .. L34_42 .. L35_43 .. L36_44
    L33_41 = #L21_29
    if L33_41 == 2 then
      L33_41 = io
      L33_41 = L33_41.open
      L33_41 = L33_41(L34_42, L35_43)
      if L33_41 then
        L32_40 = L35_43 .. L36_44 .. L34_42 .. " (" .. "Secondary" .. ")"
        L35_43(L36_44)
      end
    end
  end
  if L18_26 == "DPPPOE" then
    L33_41 = L32_40
    L32_40 = L33_41 .. L34_42 .. L35_43 .. L36_44 .. "Physical" .. ")"
  end
  if L1_9 == "1" then
    L33_41 = L32_40
    L32_40 = L33_41 .. L34_42 .. L35_43 .. L36_44
    L33_41 = resTab
    L33_41 = L33_41.insertField
    L36_44 = L32_40 or ""
    L33_41(L34_42, L35_43, L36_44)
  elseif L2_10 == "1" then
    L33_41 = L32_40
    L32_40 = L33_41 .. L34_42 .. L35_43 .. L36_44
    L33_41 = resTab
    L33_41 = L33_41.insertField
    L36_44 = L32_40 or ""
    L33_41(L34_42, L35_43, L36_44)
  else
    L33_41 = resTab
    L33_41 = L33_41.insertField
    L36_44 = L32_40 or ""
    L33_41(L34_42, L35_43, L36_44)
  end
  L33_41 = ""
  if L12_20 then
    for _FORV_38_, _FORV_39_ in L35_43(L36_44) do
      if L12_20[L34_42]["resolverConfig.nameserver1"] ~= nil and L12_20[L34_42]["resolverConfig.nameserver1"] ~= "" and L33_41 == "" then
        L33_41 = L33_41 .. L12_20[L34_42]["resolverConfig.nameserver1"]
      else
      end
    end
  end
  if L18_26 == "JPPPOE" then
    L33_41 = L34_42 .. L35_43 .. L36_44 .. ")"
    if L34_42 == 2 then
      if L34_42 then
        L33_41 = L36_44 .. ", " .. L35_43 .. " (" .. "Secondary" .. ")"
        L36_44(L34_42)
      end
    end
  end
  if L18_26 == "DPPPOE" then
    if L12_20 then
      for _FORV_39_, _FORV_40_ in L36_44(L12_20) do
        if L12_20[L35_43]["resolverConfig.nameserver3"] ~= nil and L12_20[L35_43]["resolverConfig.nameserver3"] ~= "" and L34_42 == "" then
        else
        end
      end
    end
    L33_41 = L35_43 .. L36_44 .. L34_42 .. " (" .. "Physical" .. ")"
  end
  if L1_9 == "1" then
    L33_41 = L34_42 .. L35_43 .. L36_44 .. "(Physical)"
    L34_42(L35_43, L36_44, L33_41 or "")
  elseif L2_10 == "1" then
    L33_41 = L34_42 .. L35_43 .. L36_44 .. "(Physical)"
    L34_42(L35_43, L36_44, L33_41 or "")
  else
    L34_42(L35_43, L36_44, L33_41 or "")
  end
  if L12_20 then
    for _FORV_39_, _FORV_40_ in L36_44(L12_20) do
      if L12_20[L35_43]["resolverConfig.nameserver2"] ~= nil and L12_20[L35_43]["resolverConfig.nameserver2"] ~= "" and L34_42 == "" then
      else
      end
    end
  end
  if L18_26 == "JPPPOE" then
    if L35_43 == 2 then
      if L35_43 then
        while true do
          if L28_36 == 2 then
            break
          end
        end
        L35_43:close()
      end
    end
  end
  if L18_26 == "DPPPOE" then
    if L12_20 then
      for _FORV_40_, _FORV_41_ in pairs(L12_20) do
        if L12_20[L36_44]["resolverConfig.nameserver4"] ~= nil and L12_20[L36_44]["resolverConfig.nameserver4"] ~= "" and L35_43 == "" then
        else
        end
      end
    end
  end
  if L1_9 == "1" then
    L35_43(L36_44, "Secondary DNS", L34_42 or "")
  elseif L2_10 == "1" then
    L35_43(L36_44, "Secondary DNS", L34_42 or "")
  else
    L35_43(L36_44, "Secondary DNS", L34_42 or "")
  end
  L35_43(L36_44)
  L35_43(L36_44, 0)
end
function nimfCfgSave(A0_45)
  local L1_46, L2_47, L3_48, L4_49, L5_50, L6_51, L7_52, L8_53, L9_54
  L1_46 = "OK"
  L2_47 = true
  L3_48 = true
  L4_49 = _UPVALUE0_
  L4_49 = L4_49.vlanOverWanConfigGet
  L5_50 = "WAN1"
  L5_50 = L4_49(L5_50)
  L6_51 = _UPVALUE1_
  L6_51 = L6_51.SUCCESS
  if L4_49 ~= L6_51 then
    L6_51 = _UPVALUE2_
    L6_51 = L6_51.errorStringGet
    L7_52 = L4_49
    L6_51 = L6_51(L7_52)
    statusMessage = L6_51
    L6_51 = "ERROR"
    L7_52 = statusMessage
    return L6_51, L7_52
  end
  L6_51 = db
  L6_51 = L6_51.getAttribute
  L7_52 = "networkInfo"
  L8_53 = "_ROWID_"
  L9_54 = "1"
  L6_51 = L6_51(L7_52, L8_53, L9_54, "netWorkMode")
  L6_51 = L6_51 or "0"
  if L6_51 == "3" then
    L7_52 = "LogicalIfName = 'WAN1'"
    L8_53 = "LogicalIfName = 'WAN1' AND ProfileName='pppoeProfile1'"
    L9_54 = nil
    if db.getRowWhere("Pppoe6", L7_52) == _UPVALUE1_.NIL then
      return false
    end
    L9_54 = db.getRowWhere("Pppoe6", L7_52)["Pppoe6.PppoeSessions"]
    if tonumber(L9_54) == 2 and tonumber(A0_45["Wan.IspType"]) == 2 and tonumber(A0_45["Wan.PppoeIdleTimeOutFlag"]) == 1 then
      printCLIError("Please disable the option Common " .. "Session in IPv6 Wan Settings.")
      return false
    end
    if tonumber(A0_45["Wan.IspType"]) ~= 2 and tonumber(L9_54) == 2 then
      printCLIError("Please disable the option Common Session in " .. "IPv6 Wan Settings.")
      return false
    end
  end
  L7_52 = _UPVALUE3_
  L7_52 = L7_52.start
  L7_52()
  A0_45["NimfConf.LogicalIfName"] = "WAN1"
  L7_52 = L5_50["VlanOverWan.VlanPortMode"]
  oldVlanWanStatus = L7_52
  L7_52 = L5_50["VlanOverWan.VlanId"]
  oldWanVlanId = L7_52
  L7_52 = A0_45["Wan.vlanWan1Status"]
  vlanWan1Status = L7_52
  L7_52 = A0_45["Wan.wanVlanId"]
  wanVlanId = L7_52
  L7_52 = tonumber
  L8_53 = oldVlanWanStatus
  L7_52 = L7_52(L8_53)
  if L7_52 == 2 then
    L2_47 = false
    L7_52 = _UPVALUE4_
    oldVlanWanStatus = L7_52
  end
  L7_52 = oldVlanWanStatus
  L8_53 = vlanWan1Status
  if L7_52 == L8_53 and L2_47 then
    L3_48 = false
  else
    L7_52 = oldVlanWanStatus
    L8_53 = vlanWan1Status
    if L7_52 == L8_53 then
      L7_52 = vlanWan1Status
      L8_53 = _UPVALUE4_
      if L7_52 == L8_53 then
        L7_52 = wanVlanId
        L8_53 = oldWanVlanId
        if L7_52 == L8_53 then
          L3_48 = false
        end
      end
    end
  end
  if L3_48 then
    L7_52 = vlanWan1Status
    L8_53 = _UPVALUE5_
    if L7_52 == L8_53 then
      L7_52 = oldWanVlanId
      wanVlanId = L7_52
    end
    L7_52 = _UPVALUE0_
    L7_52 = L7_52.vlanOverWanConfig
    L8_53 = vlanWan1Status
    L9_54 = wanVlanId
    L7_52 = L7_52(L8_53, L9_54, "WAN1")
    L4_49 = L7_52
    L7_52 = _UPVALUE1_
    L7_52 = L7_52.SUCCESS
    if L4_49 ~= L7_52 then
      L7_52 = _UPVALUE2_
      L7_52 = L7_52.errorStringGet
      L8_53 = L4_49
      L7_52 = L7_52(L8_53)
      statusMessage = L7_52
      L7_52 = "ERROR"
      L8_53 = statusMessage
      return L7_52, L8_53
    end
  end
  L7_52 = nimfView
  L7_52 = L7_52.wanConfigSet
  L8_53 = A0_45
  L9_54 = "1"
  L8_53 = L7_52(L8_53, L9_54, "edit")
  statusCode = L8_53
  L1_46 = L7_52
  if L1_46 == "OK" then
    L7_52 = _UPVALUE3_
    L7_52 = L7_52.complete
    L7_52()
    L7_52 = _UPVALUE3_
    L7_52 = L7_52.save
    L7_52()
  else
    L7_52 = _UPVALUE3_
    L7_52 = L7_52.abort
    L7_52()
  end
  L7_52 = db
  L7_52 = L7_52.getAttribute
  L8_53 = "stringsMap"
  L9_54 = "stringId"
  L7_52 = L7_52(L8_53, L9_54, statusCode, LANGUAGE)
  L7_52 = L7_52 or statusCode
  statusMessage = L7_52
  L7_52 = L1_46
  L8_53 = statusMessage
  return L7_52, L8_53
end
function nimfCfgInit(A0_55)
  local L1_56
  L1_56 = {}
  L1_56 = nimfView.wanConfigurationGet("WAN1")
  L1_56["Wan.Secret"] = ""
  L1_56["Wan.SecDnsIpAddr"] = ""
  L1_56["Wan.MyIpAddr"] = ""
  L1_56["Wan.HostName"] = ""
  L1_56["Wan.LoginName"] = ""
  L1_56["Wan.LoginPassword"] = ""
  L1_56["Wan.IpAddr"] = ""
  L1_56["Wan.SnetMask"] = ""
  L1_56["Wan.IsGetIpDyn"] = "1"
  L1_56["Wan.Gateway"] = ""
  L1_56["Wan.SvrIpAddr"] = ""
  L1_56["Wan.IsDNSDyn"] = "1"
  L1_56["Wan.PriDnsIpAddr"] = ""
  L1_56["Wan.SecDnsIpAddr"] = ""
  L1_56["Wan.MppeEncryptSupport"] = "0"
  L1_56["Wan.IdleTimeOutFlag"] = "0"
  L1_56["Wan.AuthOpt"] = "1"
  L1_56["Wan.PppoeIdleTimeOutFlag"] = "0"
  L1_56["Wan.JAuthOpt"] = "1"
  L1_56["Wan.JPppoeIdleTimeOutFlag"] = "0"
  L1_56["Wan.StaticDNS"] = ""
  L1_56["Wan.IspType"] = ""
  L1_56["Wan.vlanWan1Status"] = ""
  L1_56["Wan.wanVlanId"] = ""
  return 1, L1_56
end
function nimfCfgInputVal(A0_57)
  local L1_58, L2_59, L3_60, L4_61, L5_62, L6_63, L7_64, L8_65, L9_66, L10_67
  L1_58 = 0
  L2_59 = 0
  L3_60 = 0
  L4_61 = ""
  L5_62 = ""
  L6_63 = nil
  L7_64 = A0_57["Wan.vlanWan1Status"]
  if L7_64 ~= "" then
    L7_64 = A0_57["Wan.vlanWan1Status"]
  elseif L7_64 == nil then
    L7_64 = printCLIError
    L8_65 = "Enter Valid Enable/Disable for vlan on WAN1\n"
    L7_64(L8_65)
    L7_64 = false
    return L7_64
  end
  L7_64 = A0_57["Wan.vlanWan1Status"]
  if L7_64 == "1" then
    L7_64 = A0_57["Wan.wanVlanId"]
    if L7_64 ~= "" then
      L7_64 = A0_57["Wan.wanVlanId"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.wanVlanId"]
        if L7_64 ~= "1" then
          L7_64 = tonumber
          L8_65 = A0_57["Wan.wanVlanId"]
          L7_64 = L7_64(L8_65)
        end
      end
    elseif L7_64 > 4093 then
      L7_64 = printCLIError
      L8_65 = "Enter Valid Vlan Id, range 2 - 4093\n"
      L7_64(L8_65)
      L7_64 = false
      return L7_64
    end
  end
  L7_64 = A0_57["Wan.IspType"]
  if L7_64 == "1" then
    A0_57["Wan.MppeEncryptSupport"] = "0"
    A0_57["Wan.SplitTunnel"] = "0"
    L7_64 = A0_57["Wan.IpAddr"]
    if L7_64 ~= "" then
      L7_64 = A0_57["Wan.IpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.IpAddr"]
        if L7_64 ~= nil then
          L7_64 = A0_57["Wan.IpAddr"]
        end
      end
    elseif L7_64 == "0.0.0.0" then
      L7_64 = printCLIError
      L8_65 = "Invalid static Address\n"
      L7_64(L8_65)
      L7_64 = false
      return L7_64
    end
    L7_64 = util
    L7_64 = L7_64.split
    L8_65 = A0_57["Wan.IpAddr"]
    L9_66 = "."
    L7_64 = L7_64(L8_65, L9_66)
    L8_65 = tonumber
    L9_66 = L7_64[1]
    L8_65 = L8_65(L9_66)
    if L8_65 ~= 224 then
      L8_65 = tonumber
      L9_66 = L7_64[1]
      L8_65 = L8_65(L9_66)
    elseif L8_65 > 224 then
      L8_65 = printCLIError
      L9_66 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
      L8_65(L9_66)
      L8_65 = false
      return L8_65
    end
    L8_65 = _UPVALUE0_
    L8_65 = L8_65.ipv4SingleMaskCheck
    L9_66 = _UPVALUE1_
    L10_67 = A0_57["Wan.IpAddr"]
    L8_65 = L8_65(L9_66, L10_67, _UPVALUE2_)
    L9_66 = _UPVALUE3_
    L9_66 = L9_66.SUCCESS
    if L8_65 == L9_66 then
      L8_65 = printCLIError
      L9_66 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
      L8_65(L9_66)
      L8_65 = false
      return L8_65
    end
    L8_65 = A0_57["Wan.SnetMask"]
    if L8_65 ~= "" then
      L8_65 = A0_57["Wan.SnetMask"]
      if L8_65 ~= nil then
        L8_65 = A0_57["Wan.SnetMask"]
        if L8_65 ~= nil then
          L8_65 = A0_57["Wan.SnetMask"]
        end
      end
    elseif L8_65 == "0.0.0.0" then
      L8_65 = printCLIError
      L9_66 = "Enter valid subnet mask\n"
      L8_65(L9_66)
      L8_65 = false
      return L8_65
    end
    L8_65 = A0_57["Wan.GwIpAddr"]
    if L8_65 ~= "" then
      L8_65 = A0_57["Wan.GwIpAddr"]
      if L8_65 ~= nil then
        L8_65 = A0_57["Wan.GwIpAddr"]
        if L8_65 ~= nil then
          L8_65 = A0_57["Wan.GwIpAddr"]
        end
      end
    elseif L8_65 == "0.0.0.0" then
      L8_65 = printCLIError
      L9_66 = "Enter valid gateway Address\n"
      L8_65(L9_66)
      L8_65 = false
      return L8_65
    end
    L8_65 = util
    L8_65 = L8_65.split
    L9_66 = A0_57["Wan.GwIpAddr"]
    L10_67 = "."
    L8_65 = L8_65(L9_66, L10_67)
    L7_64 = L8_65
    L8_65 = tonumber
    L9_66 = L7_64[1]
    L8_65 = L8_65(L9_66)
    if L8_65 ~= 224 then
      L8_65 = tonumber
      L9_66 = L7_64[1]
      L8_65 = L8_65(L9_66)
    elseif L8_65 > 224 then
      L8_65 = printCLIError
      L9_66 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
      L8_65(L9_66)
      L8_65 = false
      return L8_65
    end
    L8_65 = _UPVALUE0_
    L8_65 = L8_65.ipv4SingleMaskCheck
    L9_66 = A0_57["Wan.IpAddr"]
    L10_67 = A0_57["Wan.GwIpAddr"]
    L8_65 = L8_65(L9_66, L10_67, A0_57["Wan.SnetMask"])
    L9_66 = _UPVALUE3_
    L9_66 = L9_66.SUCCESS
    if L8_65 ~= L9_66 then
      L8_65 = printCLIError
      L9_66 = "DEFAULT Gateway IP should be in same subnet."
      L8_65(L9_66)
      L8_65 = false
      return L8_65
    end
    L8_65 = _UPVALUE0_
    L8_65 = L8_65.ipv4SingleMaskCheck
    L9_66 = _UPVALUE1_
    L10_67 = A0_57["Wan.GwIpAddr"]
    L8_65 = L8_65(L9_66, L10_67, _UPVALUE2_)
    L9_66 = _UPVALUE3_
    L9_66 = L9_66.SUCCESS
    if L8_65 == L9_66 then
      L8_65 = printCLIError
      L9_66 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
      L8_65(L9_66)
      L8_65 = false
      return L8_65
    end
    L8_65 = A0_57["Wan.PriDnsIpAddr"]
    if L8_65 ~= "" then
      L8_65 = A0_57["Wan.PriDnsIpAddr"]
      if L8_65 ~= nil then
        L8_65 = A0_57["Wan.PriDnsIpAddr"]
        if L8_65 ~= nil then
          L8_65 = A0_57["Wan.PriDnsIpAddr"]
        end
      end
    elseif L8_65 == "0.0.0.0" then
      L8_65 = printCLIError
      L9_66 = "Enter valid primary dns address\n"
      L8_65(L9_66)
      L8_65 = false
      return L8_65
    end
    L8_65 = util
    L8_65 = L8_65.split
    L9_66 = A0_57["Wan.PriDnsIpAddr"]
    L10_67 = "."
    L8_65 = L8_65(L9_66, L10_67)
    L7_64 = L8_65
    L8_65 = tonumber
    L9_66 = L7_64[1]
    L8_65 = L8_65(L9_66)
    if L8_65 ~= 224 then
      L8_65 = tonumber
      L9_66 = L7_64[1]
      L8_65 = L8_65(L9_66)
    elseif L8_65 > 224 then
      L8_65 = printCLIError
      L9_66 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
      L8_65(L9_66)
      L8_65 = false
      return L8_65
    end
    L8_65 = _UPVALUE0_
    L8_65 = L8_65.ipv4SingleMaskCheck
    L9_66 = _UPVALUE1_
    L10_67 = A0_57["Wan.PriDnsIpAddr"]
    L8_65 = L8_65(L9_66, L10_67, _UPVALUE2_)
    L9_66 = _UPVALUE3_
    L9_66 = L9_66.SUCCESS
    if L8_65 == L9_66 then
      L8_65 = printCLIError
      L9_66 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet"
      L8_65(L9_66)
      L8_65 = false
      return L8_65
    end
    L8_65 = A0_57["Wan.SecDnsIpAddr"]
    if L8_65 ~= "" then
      L8_65 = A0_57["Wan.SecDnsIpAddr"]
      if L8_65 ~= nil then
        L8_65 = A0_57["Wan.SecDnsIpAddr"]
        if L8_65 ~= nil then
          L8_65 = A0_57["Wan.SecDnsIpAddr"]
        end
      end
    elseif L8_65 == "0.0.0.0" then
      L8_65 = printCLIError
      L9_66 = "Enter valid secondary dns address\n"
      L8_65(L9_66)
      L8_65 = false
      return L8_65
    end
    L8_65 = util
    L8_65 = L8_65.split
    L9_66 = A0_57["Wan.SecDnsIpAddr"]
    L10_67 = "."
    L8_65 = L8_65(L9_66, L10_67)
    L7_64 = L8_65
    L8_65 = tonumber
    L9_66 = L7_64[1]
    L8_65 = L8_65(L9_66)
    if L8_65 ~= 224 then
      L8_65 = tonumber
      L9_66 = L7_64[1]
      L8_65 = L8_65(L9_66)
    elseif L8_65 > 224 then
      L8_65 = printCLIError
      L9_66 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
      L8_65(L9_66)
      L8_65 = false
      return L8_65
    end
    L8_65 = _UPVALUE0_
    L8_65 = L8_65.ipv4SingleMaskCheck
    L9_66 = _UPVALUE1_
    L10_67 = A0_57["Wan.SecDnsIpAddr"]
    L8_65 = L8_65(L9_66, L10_67, _UPVALUE2_)
    L9_66 = _UPVALUE3_
    L9_66 = L9_66.SUCCESS
    if L8_65 == L9_66 then
      L8_65 = printCLIError
      L9_66 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
      L8_65(L9_66)
      L8_65 = false
      return L8_65
    end
    L8_65 = _UPVALUE0_
    L8_65 = L8_65.checkOpenVpnSubnetRange
    L9_66 = A0_57["Wan.IpAddr"]
    L10_67 = A0_57["Wan.SnetMask"]
    L8_65 = L8_65(L9_66, L10_67)
    L6_63 = L8_65
    L8_65 = _UPVALUE3_
    L8_65 = L8_65.SUCCESS
    if L6_63 == L8_65 then
      L8_65 = printCLIError
      L9_66 = "OpenVPN Network/OpenVPN Remote Network is already configured in same subnet, Please specify IP Address in a different subnet."
      L8_65(L9_66)
      L8_65 = false
      return L8_65
    end
    L8_65 = true
    return L8_65
  end
  L7_64 = A0_57["Wan.IspType"]
  if L7_64 == "0" then
    A0_57["Wan.MppeEncryptSupport"] = "0"
    A0_57["Wan.SplitTunnel"] = "0"
    L7_64 = A0_57["Wan.IsDNSDyn"]
    if L7_64 == "0" then
      L7_64 = A0_57["Wan.PriDnsIpAddr"]
      if L7_64 ~= "" then
        L7_64 = A0_57["Wan.PriDnsIpAddr"]
        if L7_64 ~= nil then
          L7_64 = A0_57["Wan.PriDnsIpAddr"]
          if L7_64 ~= nil then
            L7_64 = A0_57["Wan.PriDnsIpAddr"]
          end
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Enter valid primary dns address\n"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.PriDnsIpAddr"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.PriDnsIpAddr"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = A0_57["Wan.SecDnsIpAddr"]
      if L7_64 ~= "" then
        L7_64 = A0_57["Wan.SecDnsIpAddr"]
        if L7_64 ~= nil then
          L7_64 = A0_57["Wan.SecDnsIpAddr"]
          if L7_64 ~= nil then
            L7_64 = A0_57["Wan.SecDnsIpAddr"]
          end
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Enter valid secondary dns address\n"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.SecDnsIpAddr"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.SecDnsIpAddr"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet ."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
    end
    L7_64 = A0_57["Wan.UseMac"]
    if L7_64 == "2" then
      L7_64 = A0_57["Wan.MacAddr"]
      if L7_64 ~= "" then
        L7_64 = A0_57["Wan.MacAddr"]
      elseif L7_64 == nil then
        L7_64 = printCLIError
        L8_65 = "Enter valid mac address\n"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
    end
    L7_64 = true
    return L7_64
  end
  L7_64 = A0_57["Wan.IspType"]
  if L7_64 == "2" then
    A0_57["NimfConf.RequireLogin"] = "1"
    L7_64 = A0_57["Wan.IsDNSDyn"]
    if L7_64 == "0" then
      L7_64 = A0_57["Wan.PriDnsIpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.PriDnsIpAddr"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.PriDnsIpAddr"]
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Primary DNS Server"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.PriDnsIpAddr"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.PriDnsIpAddr"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = A0_57["Wan.SecDnsIpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.SecDnsIpAddr"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.SecDnsIpAddr"]
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Secondary DNS Server"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.SecDnsIpAddr"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.SecDnsIpAddr"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
    end
    L7_64 = A0_57["Wan.UserName"]
    if L7_64 ~= nil then
      L7_64 = A0_57["Wan.UserName"]
      if L7_64 ~= "" then
        L7_64 = A0_57["Wan.Password"]
        if L7_64 ~= nil then
          L7_64 = A0_57["Wan.Password"]
        end
      end
    elseif L7_64 == "" then
      L7_64 = printCLIError
      L8_65 = "Invalid username/password\n"
      L7_64(L8_65)
      L7_64 = false
      return L7_64
    end
    L7_64 = A0_57["Wan.PppoeIdleTimeOutFlag"]
    if L7_64 == "1" then
      L7_64 = A0_57["Wan.PppoeIdleTimeOutValue"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.PppoeIdleTimeOutValue"]
      elseif L7_64 == "" then
        L7_64 = printCLIError
        L8_65 = "Enter valid idle timeout value\n"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
    end
    L7_64 = A0_57["Wan.PIsGetIpDyn"]
    if L7_64 == "0" then
      L7_64 = A0_57["Wan.PIpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.PIpAddr"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.PIpAddr"]
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Static Ip"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.PIpAddr"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.PIpAddr"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = A0_57["Wan.PSnetMask"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.PSnetMask"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.PSnetMask"]
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Subnet mask"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.checkOpenVpnSubnetRange
      L8_65 = A0_57["Wan.PIpAddr"]
      L9_66 = A0_57["Wan.PSnetMask"]
      L7_64 = L7_64(L8_65, L9_66)
      L6_63 = L7_64
      L7_64 = _UPVALUE3_
      L7_64 = L7_64.SUCCESS
      if L6_63 == L7_64 then
        L7_64 = printCLIError
        L8_65 = "OpenVPN Network/OpenVPN Remote Network is already configured in same subnet, Please specify IP Address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
    end
    L7_64 = true
    return L7_64
  end
  L7_64 = A0_57["Wan.IspType"]
  if L7_64 == "3" then
    A0_57["NimfConf.RequireLogin"] = "1"
    L7_64 = A0_57["Wan.IsDNSDyn"]
    if L7_64 == "0" then
      L7_64 = A0_57["Wan.PriDnsIpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.PriDnsIpAddr"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.PriDnsIpAddr"]
          if L7_64 ~= nil then
            L7_64 = A0_57["Wan.PriDnsIpAddr"]
          end
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Primary DNS Server"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.PriDnsIpAddr"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.PriDnsIpAddr"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = A0_57["Wan.SecDnsIpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.SecDnsIpAddr"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.SecDnsIpAddr"]
          if L7_64 ~= nil then
            L7_64 = A0_57["Wan.SecDnsIpAddr"]
          end
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Secondary DNS Server"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.SecDnsIpAddr"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.SecDnsIpAddr"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
    end
    L7_64 = A0_57["Wan.LoginName"]
    if L7_64 ~= nil then
      L7_64 = A0_57["Wan.LoginName"]
      if L7_64 ~= "" then
        L7_64 = A0_57["Wan.LoginPassword"]
        if L7_64 ~= nil then
          L7_64 = A0_57["Wan.LoginPassword"]
        end
      end
    elseif L7_64 == "" then
      L7_64 = printCLIError
      L8_65 = "Invalid username/password\n"
      L7_64(L8_65)
      L7_64 = false
      return L7_64
    end
    L7_64 = A0_57["Wan.IdleTimeOutFlag"]
    if L7_64 == "1" then
      L7_64 = A0_57["Wan.IdleTime"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.IdleTime"]
      elseif L7_64 == "" then
        L7_64 = printCLIError
        L8_65 = "Enter valid idle timeout value\n"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
    end
    L7_64 = A0_57["Wan.IsGetIpDyn"]
    if L7_64 == "0" then
      L7_64 = A0_57["Wan.IpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.IpAddr"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.IpAddr"]
          if L7_64 ~= nil then
            L7_64 = A0_57["Wan.IpAddr"]
          end
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Static Ip"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.IpAddr"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.IpAddr"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = A0_57["Wan.SnetMask"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.SnetMask"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.SnetMask"]
          if L7_64 ~= nil then
            L7_64 = A0_57["Wan.SnetMask"]
          end
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Subnet mask"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = A0_57["Wan.Gateway"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.Gateway"]
      else
        if L7_64 ~= "0.0.0.0" then
          L7_64 = A0_57["Wan.Gateway"]
          if L7_64 ~= nil then
            L7_64 = A0_57["Wan.Gateway"]
          end
      end
      elseif L7_64 == "" then
        L7_64 = printCLIError
        L8_65 = "Give Gateway"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = A0_57["Wan.IpAddr"]
      L9_66 = A0_57["Wan.Gateway"]
      L10_67 = A0_57["Wan.SnetMask"]
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 ~= L8_65 then
        L7_64 = printCLIError
        L8_65 = "DEFAULT Gateway IP should be in same subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.Gateway"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.checkIpv4Address
      L8_65 = A0_57["Wan.SvrIpAddr"]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= true then
        L7_64 = A0_57["Wan.StaticDNS"]
        if L7_64 ~= nil then
          L7_64 = A0_57["Wan.StaticDNS"]
        else
          if L7_64 ~= "0.0.0.0" then
            L7_64 = A0_57["Wan.StaticDNS"]
            if L7_64 ~= nil then
              L7_64 = A0_57["Wan.StaticDNS"]
            end
        end
        elseif L7_64 == "" then
          L7_64 = printCLIError
          L8_65 = "Please Configure Static DNS IP."
          L7_64(L8_65)
          L7_64 = false
          return L7_64
        end
        L7_64 = _UPVALUE0_
        L7_64 = L7_64.checkIpv4Address
        L8_65 = A0_57["Wan.StaticDNS"]
        L7_64 = L7_64(L8_65)
        if L7_64 ~= true then
          L7_64 = printCLIError
          L8_65 = "Static DNS IP Address is Invalid. Octet 1 should "
          L9_66 = "be in 1-223 and Octet 4 should be in 1-254 range."
          L8_65 = L8_65 .. L9_66
          L7_64(L8_65)
          L7_64 = false
          return L7_64
        end
      end
    end
    L7_64 = A0_57["Wan.SvrIpAddr"]
    if L7_64 ~= "" then
      L7_64 = A0_57["Wan.SvrIpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.SvrIpAddr"]
        if L7_64 == "0.0.0.0" then
          L7_64 = A0_57["Wan.SvrIpAddr"]
        end
      end
    elseif L7_64 ~= nil then
      L7_64 = printCLIError
      L8_65 = "Enter valid IP address of the PPTP server\n"
      L7_64(L8_65)
      L7_64 = false
      return L7_64
    end
    L7_64 = validationsLuaLib
    L7_64 = L7_64.domainNameValidation
    L8_65 = A0_57["Wan.SvrIpAddr"]
    L8_65 = L7_64(L8_65)
    L9_66 = tonumber
    L10_67 = L7_64
    L9_66 = L9_66(L10_67)
    if L9_66 ~= 0 then
      L9_66 = printCLIError
      L10_67 = L8_65
      L9_66(L10_67)
      L9_66 = false
      return L9_66
    end
    L9_66 = _UPVALUE0_
    L9_66 = L9_66.checkOpenVpnSubnetRange
    L10_67 = A0_57["Wan.IpAddr"]
    L9_66 = L9_66(L10_67, A0_57["Wan.SnetMask"])
    L6_63 = L9_66
    L9_66 = _UPVALUE3_
    L9_66 = L9_66.SUCCESS
    if L6_63 == L9_66 then
      L9_66 = printCLIError
      L10_67 = "OpenVPN Network/OpenVPN Remote Network is already configured in same subnet, Please specify IP Address in a different subnet."
      L9_66(L10_67)
      L9_66 = false
      return L9_66
    end
    L9_66 = true
    return L9_66
  end
  L7_64 = A0_57["Wan.IspType"]
  if L7_64 == "4" then
    A0_57["Wan.MppeEncryptSupport"] = "0"
    A0_57["NimfConf.RequireLogin"] = "1"
    A0_57["Wan.MppeEncryptSupport"] = "0"
    L7_64 = A0_57["Wan.IsDNSDyn"]
    if L7_64 == "0" then
      L7_64 = A0_57["Wan.PriDnsIpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.PriDnsIpAddr"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.PriDnsIpAddr"]
          if L7_64 ~= nil then
            L7_64 = A0_57["Wan.PriDnsIpAddr"]
          end
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Primary DNS Server"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.PriDnsIpAddr"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.PriDnsIpAddr"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = A0_57["Wan.SecDnsIpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.SecDnsIpAddr"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.SecDnsIpAddr"]
          if L7_64 ~= nil then
            L7_64 = A0_57["Wan.SecDnsIpAddr"]
          end
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Secondary DNS Server"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.SecDnsIpAddr"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.SecDnsIpAddr"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
    end
    L7_64 = A0_57["Wan.LoginName"]
    if L7_64 ~= nil then
      L7_64 = A0_57["Wan.LoginName"]
      if L7_64 ~= "" then
        L7_64 = A0_57["Wan.LoginPassword"]
        if L7_64 ~= nil then
          L7_64 = A0_57["Wan.LoginPassword"]
        end
      end
    elseif L7_64 == "" then
      L7_64 = printCLIError
      L8_65 = "Invalid username/password\n"
      L7_64(L8_65)
      L7_64 = false
      return L7_64
    end
    L7_64 = A0_57["Wan.IdleTimeOutFlag"]
    if L7_64 == "1" then
      L7_64 = A0_57["Wan.IdleTime"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.IdleTime"]
      elseif L7_64 == "" then
        L7_64 = printCLIError
        L8_65 = "Enter valid idle timeout value\n"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
    end
    L7_64 = A0_57["Wan.IsGetIpDyn"]
    if L7_64 == "0" then
      L7_64 = A0_57["Wan.IpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.IpAddr"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.IpAddr"]
          if L7_64 ~= nil then
            L7_64 = A0_57["Wan.IpAddr"]
          end
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Static Ip"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.IpAddr"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.IpAddr"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = A0_57["Wan.SnetMask"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.SnetMask"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.SnetMask"]
          if L7_64 ~= nil then
            L7_64 = A0_57["Wan.SnetMask"]
          end
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Subnet mask"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = A0_57["Wan.Gateway"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.Gateway"]
      else
        if L7_64 ~= "0.0.0.0" then
          L7_64 = A0_57["Wan.Gateway"]
          if L7_64 ~= nil then
            L7_64 = A0_57["Wan.Gateway"]
          end
      end
      elseif L7_64 == "" then
        L7_64 = printCLIError
        L8_65 = "Give Gateway"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = A0_57["Wan.IpAddr"]
      L9_66 = A0_57["Wan.Gateway"]
      L10_67 = A0_57["Wan.SnetMask"]
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 ~= L8_65 then
        L7_64 = printCLIError
        L8_65 = "DEFAULT Gateway IP should be in same subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.Gateway"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.checkIpv4Address
      L8_65 = A0_57["Wan.SvrIpAddr"]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= true then
        L7_64 = A0_57["Wan.StaticDNS"]
        if L7_64 ~= nil then
          L7_64 = A0_57["Wan.StaticDNS"]
        else
          if L7_64 ~= "0.0.0.0" then
            L7_64 = A0_57["Wan.StaticDNS"]
            if L7_64 ~= nil then
              L7_64 = A0_57["Wan.StaticDNS"]
            end
        end
        elseif L7_64 == "" then
          L7_64 = printCLIError
          L8_65 = "Please Configure Static DNS IP."
          L7_64(L8_65)
          L7_64 = false
          return L7_64
        end
        L7_64 = _UPVALUE0_
        L7_64 = L7_64.checkIpv4Address
        L8_65 = A0_57["Wan.StaticDNS"]
        L7_64 = L7_64(L8_65)
        if L7_64 ~= true then
          L7_64 = printCLIError
          L8_65 = "Static DNS IP Address is Invalid. Octet 1 should "
          L9_66 = "be in 1-223 and Octet 4 should be in 1-254 range."
          L8_65 = L8_65 .. L9_66
          L7_64(L8_65)
          L7_64 = false
          return L7_64
        end
      end
    end
    L7_64 = A0_57["Wan.SvrIpAddr"]
    if L7_64 ~= "" then
      L7_64 = A0_57["Wan.SvrIpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.SvrIpAddr"]
        if L7_64 == "0.0.0.0" then
          L7_64 = A0_57["Wan.SvrIpAddr"]
        end
      end
    elseif L7_64 ~= nil then
      L7_64 = printCLIError
      L8_65 = "Enter valid server IP\n"
      L7_64(L8_65)
      L7_64 = false
      return L7_64
    end
    L7_64 = validationsLuaLib
    L7_64 = L7_64.domainNameValidation
    L8_65 = A0_57["Wan.SvrIpAddr"]
    L8_65 = L7_64(L8_65)
    L9_66 = tonumber
    L10_67 = L7_64
    L9_66 = L9_66(L10_67)
    if L9_66 ~= 0 then
      L9_66 = printCLIError
      L10_67 = L8_65
      L9_66(L10_67)
      L9_66 = false
      return L9_66
    end
    L9_66 = _UPVALUE0_
    L9_66 = L9_66.checkOpenVpnSubnetRange
    L10_67 = A0_57["Wan.IpAddr"]
    L9_66 = L9_66(L10_67, A0_57["Wan.SnetMask"])
    L6_63 = L9_66
    L9_66 = _UPVALUE3_
    L9_66 = L9_66.SUCCESS
    if L6_63 == L9_66 then
      L9_66 = printCLIError
      L10_67 = "OpenVPN Network/OpenVPN Remote Network is already configured in same subnet, Please specify IP Address in a different subnet."
      L9_66(L10_67)
      L9_66 = false
      return L9_66
    end
    L9_66 = true
    return L9_66
  end
  L7_64 = A0_57["Wan.IspType"]
  if L7_64 == "5" then
    A0_57["NimfConf.RequireLogin"] = "1"
    L7_64 = A0_57["Wan.IsDNSDyn"]
    if L7_64 == "0" then
      L7_64 = A0_57["Wan.PriDnsIpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.PriDnsIpAddr"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.PriDnsIpAddr"]
          if L7_64 ~= nil then
            L7_64 = A0_57["Wan.PriDnsIpAddr"]
          end
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Primary DNS Server"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.PriDnsIpAddr"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.PriDnsIpAddr"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = A0_57["Wan.SecDnsIpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.SecDnsIpAddr"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.SecDnsIpAddr"]
          if L7_64 ~= nil then
            L7_64 = A0_57["Wan.SecDnsIpAddr"]
          end
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Secondary DNS Server"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.SecDnsIpAddr"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.SecDnsIpAddr"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
    end
    L7_64 = A0_57["Wan.LoginName"]
    if L7_64 ~= nil then
      L7_64 = A0_57["Wan.LoginName"]
      if L7_64 ~= "" then
        L7_64 = A0_57["Wan.LoginPassword"]
        if L7_64 ~= nil then
          L7_64 = A0_57["Wan.LoginPassword"]
        end
      end
    elseif L7_64 == "" then
      L7_64 = printCLIError
      L8_65 = "Invalid username/password\n"
      L7_64(L8_65)
      L7_64 = false
      return L7_64
    end
    L7_64 = A0_57["Wan.IdleTimeOutFlag"]
    if L7_64 == "1" then
      L7_64 = A0_57["Wan.IdleTime"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.IdleTime"]
      elseif L7_64 == "" then
        L7_64 = printCLIError
        L8_65 = "Enter valid idle timeout value\n"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
    end
    L7_64 = A0_57["Wan.IsGetIpDyn"]
    if L7_64 == "0" then
      L7_64 = A0_57["Wan.IpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.IpAddr"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.IpAddr"]
          if L7_64 ~= nil then
            L7_64 = A0_57["Wan.IpAddr"]
          end
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Static Ip"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.IpAddr"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.IpAddr"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = A0_57["Wan.SnetMask"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.SnetMask"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.SnetMask"]
          if L7_64 ~= nil then
            L7_64 = A0_57["Wan.SnetMask"]
          end
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Subnet mask"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = A0_57["Wan.Gateway"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.Gateway"]
      else
        if L7_64 ~= "0.0.0.0" then
          L7_64 = A0_57["Wan.Gateway"]
          if L7_64 ~= nil then
            L7_64 = A0_57["Wan.Gateway"]
          end
      end
      elseif L7_64 == "" then
        L7_64 = printCLIError
        L8_65 = "Give Gateway"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = A0_57["Wan.IpAddr"]
      L9_66 = A0_57["Wan.Gateway"]
      L10_67 = A0_57["Wan.SnetMask"]
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 ~= L8_65 then
        L7_64 = printCLIError
        L8_65 = "DEFAULT Gateway IP should be in same subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.Gateway"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.checkIpv4Address
      L8_65 = A0_57["Wan.SvrIpAddr"]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= true then
        L7_64 = A0_57["Wan.StaticDNS"]
        if L7_64 ~= nil then
          L7_64 = A0_57["Wan.StaticDNS"]
        else
          if L7_64 ~= "0.0.0.0" then
            L7_64 = A0_57["Wan.StaticDNS"]
            if L7_64 ~= nil then
              L7_64 = A0_57["Wan.StaticDNS"]
            end
        end
        elseif L7_64 == "" then
          L7_64 = printCLIError
          L8_65 = "Please Configure Static DNS IP."
          L7_64(L8_65)
          L7_64 = false
          return L7_64
        end
        L7_64 = _UPVALUE0_
        L7_64 = L7_64.checkIpv4Address
        L8_65 = A0_57["Wan.StaticDNS"]
        L7_64 = L7_64(L8_65)
        if L7_64 ~= true then
          L7_64 = printCLIError
          L8_65 = "Static DNS IP Address is Invalid. Octet 1 should "
          L9_66 = "be in 1-223 and Octet 4 should be in 1-254 range."
          L8_65 = L8_65 .. L9_66
          L7_64(L8_65)
          L7_64 = false
          return L7_64
        end
      end
    end
    L7_64 = A0_57["Wan.SvrIpAddr"]
    if L7_64 ~= "" then
      L7_64 = A0_57["Wan.SvrIpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.SvrIpAddr"]
        if L7_64 == "0.0.0.0" then
          L7_64 = A0_57["Wan.SvrIpAddr"]
        end
      end
    elseif L7_64 ~= nil then
      L7_64 = printCLIError
      L8_65 = "Enter valid IP address of server\n"
      L7_64(L8_65)
      L7_64 = false
      return L7_64
    end
    L7_64 = validationsLuaLib
    L7_64 = L7_64.domainNameValidation
    L8_65 = A0_57["Wan.SvrIpAddr"]
    L8_65 = L7_64(L8_65)
    L9_66 = tonumber
    L10_67 = L7_64
    L9_66 = L9_66(L10_67)
    if L9_66 ~= 0 then
      L9_66 = printCLIError
      L10_67 = L8_65
      L9_66(L10_67)
      L9_66 = false
      return L9_66
    end
    L9_66 = _UPVALUE0_
    L9_66 = L9_66.checkOpenVpnSubnetRange
    L10_67 = A0_57["Wan.IpAddr"]
    L9_66 = L9_66(L10_67, A0_57["Wan.SnetMask"])
    L6_63 = L9_66
    L9_66 = _UPVALUE3_
    L9_66 = L9_66.SUCCESS
    if L6_63 == L9_66 then
      L9_66 = printCLIError
      L10_67 = "OpenVPN Network/OpenVPN Remote Network is already configured in same subnet, Please specify IP Address in a different subnet."
      L9_66(L10_67)
      L9_66 = false
      return L9_66
    end
    L9_66 = true
    return L9_66
  end
  L7_64 = A0_57["Wan.IspType"]
  if L7_64 == "6" then
    A0_57["NimfConf.RequireLogin"] = "1"
    L7_64 = A0_57["Wan.IsDNSDyn"]
    if L7_64 == "0" then
      L7_64 = A0_57["Wan.PriDnsIpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.PriDnsIpAddr"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.PriDnsIpAddr"]
          if L7_64 ~= nil then
            L7_64 = A0_57["Wan.PriDnsIpAddr"]
          end
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Primary DNS Server"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.PriDnsIpAddr"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.PriDnsIpAddr"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = A0_57["Wan.SecDnsIpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.SecDnsIpAddr"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.SecDnsIpAddr"]
          if L7_64 ~= nil then
            L7_64 = A0_57["Wan.SecDnsIpAddr"]
          end
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Secondary DNS Server"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.SecDnsIpAddr"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.SecDnsIpAddr"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
    end
    L7_64 = A0_57["Wan.LoginName"]
    if L7_64 ~= nil then
      L7_64 = A0_57["Wan.LoginName"]
      if L7_64 ~= "" then
        L7_64 = A0_57["Wan.LoginPassword"]
        if L7_64 ~= nil then
          L7_64 = A0_57["Wan.LoginPassword"]
        end
      end
    elseif L7_64 == "" then
      L7_64 = printCLIError
      L8_65 = "Invalid username/password\n"
      L7_64(L8_65)
      L7_64 = false
      return L7_64
    end
    L7_64 = A0_57["Wan.IsGetIpDyn"]
    if L7_64 == "0" then
      L7_64 = A0_57["Wan.IpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.IpAddr"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.IpAddr"]
          if L7_64 ~= nil then
            L7_64 = A0_57["Wan.IpAddr"]
          end
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Static Ip"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.IpAddr"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.IpAddr"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = A0_57["Wan.SnetMask"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.SnetMask"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.SnetMask"]
          if L7_64 ~= nil then
            L7_64 = A0_57["Wan.SnetMask"]
          end
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Subnet mask"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = A0_57["Wan.Gateway"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.Gateway"]
      else
        if L7_64 ~= "0.0.0.0" then
          L7_64 = A0_57["Wan.Gateway"]
          if L7_64 ~= nil then
            L7_64 = A0_57["Wan.Gateway"]
          end
      end
      elseif L7_64 == "" then
        L7_64 = printCLIError
        L8_65 = "Give Gateway"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = A0_57["Wan.IpAddr"]
      L9_66 = A0_57["Wan.Gateway"]
      L10_67 = A0_57["Wan.SnetMask"]
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 ~= L8_65 then
        L7_64 = printCLIError
        L8_65 = "DEFAULT Gateway IP should be in same subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.Gateway"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.checkIpv4Address
      L8_65 = A0_57["Wan.SvrIpAddr"]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= true then
        L7_64 = A0_57["Wan.StaticDNS"]
        if L7_64 ~= nil then
          L7_64 = A0_57["Wan.StaticDNS"]
        else
          if L7_64 ~= "0.0.0.0" then
            L7_64 = A0_57["Wan.StaticDNS"]
            if L7_64 ~= nil then
              L7_64 = A0_57["Wan.StaticDNS"]
            end
        end
        elseif L7_64 == "" then
          L7_64 = printCLIError
          L8_65 = "Please Configure Static DNS IP."
          L7_64(L8_65)
          L7_64 = false
          return L7_64
        end
        L7_64 = _UPVALUE0_
        L7_64 = L7_64.checkIpv4Address
        L8_65 = A0_57["Wan.StaticDNS"]
        L7_64 = L7_64(L8_65)
        if L7_64 ~= true then
          L7_64 = printCLIError
          L8_65 = "Static DNS IP Address is Invalid. Octet 1 should "
          L9_66 = "be in 1-223 and Octet 4 should be in 1-254 range."
          L8_65 = L8_65 .. L9_66
          L7_64(L8_65)
          L7_64 = false
          return L7_64
        end
      end
    end
    L7_64 = A0_57["Wan.IdleTimeOutFlag"]
    if L7_64 == "1" then
      L7_64 = A0_57["Wan.IdleTime"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.IdleTime"]
      elseif L7_64 == "" then
        L7_64 = printCLIError
        L8_65 = "Enter valid idle timeout value\n"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
    end
    L7_64 = A0_57["Wan.SvrIpAddr"]
    if L7_64 ~= "" then
      L7_64 = A0_57["Wan.SvrIpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.SvrIpAddr"]
        if L7_64 == "0.0.0.0" then
          L7_64 = A0_57["Wan.SvrIpAddr"]
        end
      end
    elseif L7_64 ~= nil then
      L7_64 = printCLIError
      L8_65 = "Enter valid IP address of server\n"
      L7_64(L8_65)
      L7_64 = false
      return L7_64
    end
    L7_64 = validationsLuaLib
    L7_64 = L7_64.domainNameValidation
    L8_65 = A0_57["Wan.SvrIpAddr"]
    L8_65 = L7_64(L8_65)
    L9_66 = tonumber
    L10_67 = L7_64
    L9_66 = L9_66(L10_67)
    if L9_66 ~= 0 then
      L9_66 = printCLIError
      L10_67 = L8_65
      L9_66(L10_67)
      L9_66 = false
      return L9_66
    end
    L9_66 = _UPVALUE0_
    L9_66 = L9_66.checkOpenVpnSubnetRange
    L10_67 = A0_57["Wan.IpAddr"]
    L9_66 = L9_66(L10_67, A0_57["Wan.SnetMask"])
    L6_63 = L9_66
    L9_66 = _UPVALUE3_
    L9_66 = L9_66.SUCCESS
    if L6_63 == L9_66 then
      L9_66 = printCLIError
      L10_67 = "OpenVPN Network/OpenVPN Remote Network is already configured in same subnet, Please specify IP Address in a different subnet."
      L9_66(L10_67)
      L9_66 = false
      return L9_66
    end
    L9_66 = true
    return L9_66
  end
  L7_64 = A0_57["Wan.IspType"]
  if L7_64 == "7" then
    A0_57["NimfConf.RequireLogin"] = "1"
    L7_64 = A0_57["Wan.IsDNSDyn"]
    if L7_64 == "0" then
      L7_64 = A0_57["Wan.PriDnsIpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.PriDnsIpAddr"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.PriDnsIpAddr"]
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Primary DNS Server"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.PriDnsIpAddr"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.PriDnsIpAddr"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = A0_57["Wan.SecDnsIpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.SecDnsIpAddr"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.SecDnsIpAddr"]
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Secondary DNS Server"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.SecDnsIpAddr"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.SecDnsIpAddr"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
    end
    L7_64 = A0_57["Wan.UserName"]
    if L7_64 ~= nil then
      L7_64 = A0_57["Wan.UserName"]
      if L7_64 ~= "" then
        L7_64 = A0_57["Wan.Password"]
        if L7_64 ~= nil then
          L7_64 = A0_57["Wan.Password"]
        end
      end
    elseif L7_64 == "" then
      L7_64 = printCLIError
      L8_65 = "Invalid username/password\n"
      L7_64(L8_65)
      L7_64 = false
      return L7_64
    end
    L7_64 = A0_57["Wan.PppoeIdleTimeOutFlag"]
    if L7_64 == "1" then
      L7_64 = A0_57["Wan.PppoeIdleTimeOutValue"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.PppoeIdleTimeOutValue"]
      elseif L7_64 == "" then
        L7_64 = printCLIError
        L8_65 = "Enter valid idle timeout value\n"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
    end
    L7_64 = A0_57["Wan.PIsGetIpDyn"]
    if L7_64 == "0" then
      L7_64 = A0_57["Wan.PIpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.PIpAddr"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.PIpAddr"]
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Static Ip"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.PIpAddr"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.PIpAddr"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = A0_57["Wan.PSnetMask"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.PSnetMask"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.PSnetMask"]
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Subnet mask"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.checkOpenVpnSubnetRange
      L8_65 = A0_57["Wan.PIpAddr"]
      L9_66 = A0_57["Wan.PSnetMask"]
      L7_64 = L7_64(L8_65, L9_66)
      L6_63 = L7_64
      L7_64 = _UPVALUE3_
      L7_64 = L7_64.SUCCESS
      if L6_63 == L7_64 then
        L7_64 = printCLIError
        L8_65 = "OpenVPN Network/OpenVPN Remote Network is already configured in same subnet, Please specify IP Address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
    end
    L7_64 = A0_57["Wan.JIsDNSDyn"]
    if L7_64 == "0" then
      L7_64 = A0_57["Wan.JPriDnsIpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.JPriDnsIpAddr"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.JPriDnsIpAddr"]
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Primary DNS Server"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.JPriDnsIpAddr"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.JPriDnsIpAddr"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = A0_57["Wan.JSecDnsIpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.JSecDnsIpAddr"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.JSecDnsIpAddr"]
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Secondary DNS Server"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.JSecDnsIpAddr"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.JSecDnsIpAddr"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
    end
    L7_64 = A0_57["Wan.JUserName"]
    if L7_64 ~= nil then
      L7_64 = A0_57["Wan.JUserName"]
      if L7_64 ~= "" then
        L7_64 = A0_57["Wan.JPassword"]
        if L7_64 ~= nil then
          L7_64 = A0_57["Wan.JPassword"]
        end
      end
    elseif L7_64 == "" then
      L7_64 = printCLIError
      L8_65 = "Invalid username/password\n"
      L7_64(L8_65)
      L7_64 = false
      return L7_64
    end
    L7_64 = A0_57["Wan.JPppoeIdleTimeOutFlag"]
    if L7_64 == "1" then
      L7_64 = A0_57["Wan.JPppoeIdleTimeOutValue"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.JPppoeIdleTimeOutValue"]
      elseif L7_64 == "" then
        L7_64 = printCLIError
        L8_65 = "Enter valid idle timeout value\n"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
    end
    L7_64 = A0_57["Wan.JIsGetIpDyn"]
    if L7_64 == "0" then
      L7_64 = A0_57["Wan.JIpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.JIpAddr"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.JIpAddr"]
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Static Ip"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.JIpAddr"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.JIpAddr"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = A0_57["Wan.JSnetMask"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.JSnetMask"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.JSnetMask"]
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Subnet mask"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.checkOpenVpnSubnetRange
      L8_65 = A0_57["Wan.JIpAddr"]
      L9_66 = A0_57["Wan.JSnetMask"]
      L7_64 = L7_64(L8_65, L9_66)
      L6_63 = L7_64
      L7_64 = _UPVALUE3_
      L7_64 = L7_64.SUCCESS
      if L6_63 == L7_64 then
        L7_64 = printCLIError
        L8_65 = "OpenVPN Network/OpenVPN Remote Network is already configured in same subnet, Please specify IP Address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
    end
    L7_64 = true
    return L7_64
  end
  L7_64 = A0_57["Wan.IspType"]
  if L7_64 == "9" then
    A0_57["NimfConf.RequireLogin"] = "1"
    L7_64 = A0_57["Wan.IsDNSDyn"]
    if L7_64 == "0" then
      L7_64 = A0_57["Wan.PriDnsIpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.PriDnsIpAddr"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.PriDnsIpAddr"]
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Primary DNS Server"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.PriDnsIpAddr"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.PriDnsIpAddr"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = A0_57["Wan.SecDnsIpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.SecDnsIpAddr"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.SecDnsIpAddr"]
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Secondary DNS Server"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.SecDnsIpAddr"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.SecDnsIpAddr"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
    end
    L7_64 = A0_57["Wan.UserName"]
    if L7_64 ~= nil then
      L7_64 = A0_57["Wan.UserName"]
      if L7_64 ~= "" then
        L7_64 = A0_57["Wan.Password"]
        if L7_64 ~= nil then
          L7_64 = A0_57["Wan.Password"]
        end
      end
    elseif L7_64 == "" then
      L7_64 = printCLIError
      L8_65 = "Invalid username/password\n"
      L7_64(L8_65)
      L7_64 = false
      return L7_64
    end
    L7_64 = A0_57["Wan.PppoeIdleTimeOutFlag"]
    if L7_64 == "1" then
      L7_64 = A0_57["Wan.PppoeIdleTimeOutValue"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.PppoeIdleTimeOutValue"]
      elseif L7_64 == "" then
        L7_64 = printCLIError
        L8_65 = "Enter valid idle timeout value\n"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
    end
    L7_64 = A0_57["Wan.PIsGetIpDyn"]
    if L7_64 == "0" then
      L7_64 = A0_57["Wan.PIpAddr"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.PIpAddr"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.PIpAddr"]
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Static Ip"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.PIpAddr"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.PIpAddr"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = A0_57["Wan.PSnetMask"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.PSnetMask"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.PSnetMask"]
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Subnet mask"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.checkOpenVpnSubnetRange
      L8_65 = A0_57["Wan.PIpAddr"]
      L9_66 = A0_57["Wan.PSnetMask"]
      L7_64 = L7_64(L8_65, L9_66)
      L6_63 = L7_64
      L7_64 = _UPVALUE3_
      L7_64 = L7_64.SUCCESS
      if L6_63 == L7_64 then
        L7_64 = printCLIError
        L8_65 = "OpenVPN Network/OpenVPN Remote Network is already configured in same subnet, Please specify IP Address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
    end
    L7_64 = A0_57["Wan.GetIpFromIspPhy"]
    if L7_64 == "0" then
      L7_64 = A0_57["Wan.StaticIpPhy"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.StaticIpPhy"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.StaticIpPhy"]
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Static Ip of physical interface"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.StaticIpPhy"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.StaticIpPhy"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = A0_57["Wan.NetMaskPhy"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.NetMaskPhy"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.NetMaskPhy"]
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Subnet mask of physical interface"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = A0_57["Wan.GatewayPhy"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.GatewayPhy"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.GatewayPhy"]
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Gateway of physical interface"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = A0_57["Wan.StaticIpPhy"]
      L9_66 = A0_57["Wan.GatewayPhy"]
      L10_67 = A0_57["Wan.NetMaskPhy"]
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 ~= L8_65 then
        L7_64 = printCLIError
        L8_65 = "DEFAULT Gateway IP should be in same subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.GatewayPhy"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
    end
    L7_64 = A0_57["Wan.GetDnsFromIspPhy"]
    if L7_64 == "0" then
      L7_64 = A0_57["Wan.PrimaryDnsPhy"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.PrimaryDnsPhy"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.PrimaryDnsPhy"]
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Primary DNS Server for physical network"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.PrimaryDnsPhy"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.PrimaryDnsPhy"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = A0_57["Wan.SecondaryDnsPhy"]
      if L7_64 ~= nil then
        L7_64 = A0_57["Wan.SecondaryDnsPhy"]
        if L7_64 ~= "" then
          L7_64 = A0_57["Wan.SecondaryDnsPhy"]
        end
      elseif L7_64 == "0.0.0.0" then
        L7_64 = printCLIError
        L8_65 = "Give Secondary DNS Server for physical network"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = util
      L7_64 = L7_64.split
      L8_65 = A0_57["Wan.SecondaryDnsPhy"]
      L9_66 = "."
      L7_64 = L7_64(L8_65, L9_66)
      Octet = L7_64
      L7_64 = tonumber
      L8_65 = Octet
      L8_65 = L8_65[1]
      L7_64 = L7_64(L8_65)
      if L7_64 ~= 224 then
        L7_64 = tonumber
        L8_65 = Octet
        L8_65 = L8_65[1]
        L7_64 = L7_64(L8_65)
      elseif L7_64 > 224 then
        L7_64 = printCLIError
        L8_65 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
      L7_64 = _UPVALUE0_
      L7_64 = L7_64.ipv4SingleMaskCheck
      L8_65 = _UPVALUE1_
      L9_66 = A0_57["Wan.SecondaryDnsPhy"]
      L10_67 = _UPVALUE2_
      L7_64 = L7_64(L8_65, L9_66, L10_67)
      L8_65 = _UPVALUE3_
      L8_65 = L8_65.SUCCESS
      if L7_64 == L8_65 then
        L7_64 = printCLIError
        L8_65 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_64(L8_65)
        L7_64 = false
        return L7_64
      end
    end
    L7_64 = true
    return L7_64
  end
  L7_64 = A0_57["Wan.exitFlag"]
  if L7_64 ~= nil then
    L7_64 = A0_57["Wan.exitFlag"]
    if L7_64 == "1" then
      L7_64 = false
      return L7_64
    end
  end
  L7_64 = printCLIError
  L8_65 = "Please Give connection type first:isp_connection_type"
  L7_64(L8_65)
  L7_64 = false
  return L7_64
end
function wanSetupGetWan2()
  local L0_68, L1_69, L2_70, L3_71, L4_72, L5_73, L6_74
  L0_68 = {}
  L1_69 = nimfView
  L1_69 = L1_69.wanConfigurationGet
  L2_70 = "WAN2"
  L1_69 = L1_69(L2_70)
  configRow = L1_69
  L1_69 = configRow
  L1_69 = L1_69["Wan.IspType"]
  L2_70 = ""
  L3_71 = ""
  L4_72 = ""
  L5_73 = ""
  L6_74 = configRow
  L6_74 = L6_74["Wan.AuthOpt"]
  if L6_74 == "1" then
    L4_72 = "Auto-Negotiate"
  else
    L6_74 = configRow
    L6_74 = L6_74["Wan.AuthOpt"]
    if L6_74 == "2" then
      L4_72 = "PAP"
    else
      L6_74 = configRow
      L6_74 = L6_74["Wan.AuthOpt"]
      if L6_74 == "3" then
        L4_72 = "CHAP"
      else
        L6_74 = configRow
        L6_74 = L6_74["Wan.AuthOpt"]
        if L6_74 == "4" then
          L4_72 = "MS-CHAP"
        else
          L4_72 = "MS-CHAPv2"
        end
      end
    end
  end
  L6_74 = configRow
  L6_74 = L6_74["Wan.JAuthOpt"]
  if L6_74 == "1" then
    L5_73 = "Auto-Negotiate"
  else
    L6_74 = configRow
    L6_74 = L6_74["Wan.JAuthOpt"]
    if L6_74 == "2" then
      L5_73 = "PAP"
    else
      L6_74 = configRow
      L6_74 = L6_74["Wan.JAuthOpt"]
      if L6_74 == "3" then
        L5_73 = "CHAP"
      else
        L6_74 = configRow
        L6_74 = L6_74["Wan.JAuthOpt"]
        if L6_74 == "4" then
          L5_73 = "MS-CHAP"
        else
          L5_73 = "MS-CHAPv2"
        end
      end
    end
  end
  L6_74 = configRow
  L6_74 = L6_74["Wan.SplitTunnel"]
  if L6_74 == "1" then
    L2_70 = "Enabled"
  else
    L2_70 = "Disabled"
  end
  L6_74 = configRow
  L6_74 = L6_74["Wan.MppeEncryptSupport"]
  if L6_74 == "1" then
    L3_71 = "Enabled"
  else
    L3_71 = "Disabled"
  end
  if L1_69 == "1" then
    L6_74 = resTab
    L6_74 = L6_74.insertField
    L6_74(L0_68, "STATIC Configuration", "")
  end
  if L1_69 == "9" then
    L6_74 = resTab
    L6_74 = L6_74.insertField
    L6_74(L0_68, "DUAL ACCESS PPPOE Configuration", "")
  end
  if L1_69 == "7" then
    L6_74 = resTab
    L6_74 = L6_74.insertField
    L6_74(L0_68, "Japanese Multiple PPPOE Configuration", "")
  end
  if L1_69 == "0" then
    L6_74 = resTab
    L6_74 = L6_74.insertField
    L6_74(L0_68, "Dynamic IP (DHCP) Configuration", "")
    L6_74 = resTab
    L6_74 = L6_74.insertField
    L6_74(L0_68, "Internet (IP) Address", "Get Dynamically From ISP")
    L6_74 = resTab
    L6_74 = L6_74.insertField
    L6_74(L0_68, "HostName", configRow["Wan.HostName"] or "")
    L6_74 = configRow
    L6_74 = L6_74["Wan.IsDNSDyn"]
    if L6_74 == "0" then
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Domain Name Servers (DNS) Source", "Use these DNS Servers")
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Primary DNS Server", configRow["Wan.PriDnsIpAddr"] or "0.0.0.0")
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Secondary DNS Server", configRow["Wan.SecDnsIpAddr"] or "0.0.0.0")
    else
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Domain Name Servers (DNS) Source", "Get Dynamically From ISP")
    end
  end
  if L1_69 == "2" then
    L6_74 = resTab
    L6_74 = L6_74.insertField
    L6_74(L0_68, "Pppoe Configuration", "")
  end
  if L1_69 == "3" then
    L6_74 = resTab
    L6_74 = L6_74.insertField
    L6_74(L0_68, "PPTP Configuration", "")
  elseif L1_69 == "4" then
    L6_74 = resTab
    L6_74 = L6_74.insertField
    L6_74(L0_68, "L2TP Configuration", "")
  elseif L1_69 == "5" then
    L6_74 = resTab
    L6_74 = L6_74.insertField
    L6_74(L0_68, "Russian PPTP Configuration", "")
  elseif L1_69 == "6" then
    L6_74 = resTab
    L6_74 = L6_74.insertField
    L6_74(L0_68, "Russian L2TP Configuration", "")
  end
  if L1_69 ~= "0" and L1_69 ~= "2" and L1_69 ~= "7" and L1_69 ~= "9" and L1_69 ~= "8" then
    if L1_69 ~= "1" and L1_69 ~= "8" then
      L6_74 = configRow
      L6_74 = L6_74["Wan.IsGetIpDyn"]
      if L6_74 == "1" then
        L6_74 = resTab
        L6_74 = L6_74.insertField
        L6_74(L0_68, "Address Mode", ":Dynamic Ip")
      else
        L6_74 = resTab
        L6_74 = L6_74.insertField
        L6_74(L0_68, "Address Mode", ":Static Ip")
        L6_74 = configRow
        L6_74 = L6_74["Wan.StaticDNS"]
        if L6_74 ~= nil then
          L6_74 = resTab
          L6_74 = L6_74.insertField
          L6_74(L0_68, "Static DNS IP", configRow["Wan.StaticDNS"])
        end
      end
    end
    L6_74 = configRow
    L6_74 = L6_74["Wan.IsGetIpDyn"]
    if L6_74 ~= "1" then
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "IP Address", configRow["Wan.IpAddr"] or "0.0.0.0")
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "IP Subnet Mask", configRow["Wan.SnetMask"] or "0.0.0.0")
    end
    if L1_69 ~= "1" then
      L6_74 = configRow
      L6_74 = L6_74["Wan.IsGetIpDyn"]
      if L6_74 ~= "1" then
        L6_74 = resTab
        L6_74 = L6_74.insertField
        L6_74(L0_68, "Gateway", configRow["Wan.Gateway"] or "0.0.0.0")
      end
    else
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Gateway", configRow["Wan.GwIpAddr"] or "0.0.0.0")
    end
    L6_74 = configRow
    L6_74 = L6_74["Wan.IsDNSDyn"]
    if L6_74 == "0" then
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Domain Name Servers (DNS) Source", "Use these DNS Servers")
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Primary DNS Server", configRow["Wan.PriDnsIpAddr"] or "0.0.0.0")
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Secondary DNS Server", configRow["Wan.SecDnsIpAddr"] or "0.0.0.0")
    else
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Domain Name Servers (DNS) Source", "Get Dynamically From ISP")
    end
  end
  if L1_69 ~= "0" and L1_69 ~= "2" and L1_69 ~= "7" and L1_69 ~= "1" and L1_69 ~= "9" and L1_69 ~= "8" then
    L6_74 = resTab
    L6_74 = L6_74.insertField
    L6_74(L0_68, "Username", configRow["Wan.LoginName"] or "")
    L6_74 = resTab
    L6_74 = L6_74.insertField
    L6_74(L0_68, "Password", configRow["Wan.LoginPassword"] or "")
    L6_74 = resTab
    L6_74 = L6_74.insertField
    L6_74(L0_68, "Server IP Address", configRow["Wan.SvrIpAddr"] or "0.0.0.0")
    L6_74 = resTab
    L6_74 = L6_74.insertField
    L6_74(L0_68, "Split Tunnel", L2_70)
    if L1_69 == "3" or L1_69 == "5" then
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "MMPE EncryptionAddress", L3_71)
    else
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Secret", configRow["Wan.Secret"] or "")
    end
    L6_74 = configRow
    L6_74 = L6_74["Wan.IdleTimeOutFlag"]
    if L6_74 == "0" then
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Connectivity Type", "Keep Connected")
    else
      L6_74 = configRow
      L6_74 = L6_74["Wan.IdleTimeOutFlag"]
      if L6_74 == "1" then
        L6_74 = resTab
        L6_74 = L6_74.insertField
        L6_74(L0_68, "Connectivity Type", "Idle Time")
        L6_74 = resTab
        L6_74 = L6_74.insertField
        L6_74(L0_68, "Idle Time (in minutes)", configRow["Wan.IdleTime"])
      end
    end
  end
  if L1_69 == "2" or L1_69 == "7" or L1_69 == "9" then
    L6_74 = configRow
    L6_74 = L6_74["Wan.PIsGetIpDyn"]
    if L6_74 == "1" then
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Address Mode", ":Dynamic Ip")
    else
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Address Mode", ":Static Ip")
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "IP Address", configRow["Wan.PIpAddr"] or "0.0.0.0")
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "IP Subnet Mask", configRow["Wan.PSnetMask"] or "0.0.0.0")
    end
    L6_74 = resTab
    L6_74 = L6_74.insertField
    L6_74(L0_68, "Username", configRow["Wan.UserName"] or "")
    L6_74 = resTab
    L6_74 = L6_74.insertField
    L6_74(L0_68, "Password", configRow["Wan.Password"] or "")
    L6_74 = resTab
    L6_74 = L6_74.insertField
    L6_74(L0_68, "Service", configRow["Wan.Service"] or "")
    L6_74 = configRow
    L6_74 = L6_74["Wan.PppoeIdleTimeOutFlag"]
    if L6_74 == "0" then
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Connectivity Type", "Keep Connected")
    else
      L6_74 = configRow
      L6_74 = L6_74["Wan.PppoeIdleTimeOutFlag"]
      if L6_74 == "1" then
        L6_74 = resTab
        L6_74 = L6_74.insertField
        L6_74(L0_68, "Connectivity Type", "Idle Time")
        L6_74 = resTab
        L6_74 = L6_74.insertField
        L6_74(L0_68, "Idle Time (in minutes)", configRow["Wan.PppoeIdleTimeOutValue"])
      end
    end
    L6_74 = resTab
    L6_74 = L6_74.insertField
    L6_74(L0_68, "Authentication Type", L4_72)
    L6_74 = configRow
    L6_74 = L6_74["Wan.IsDNSDyn"]
    if L6_74 == "0" then
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Domain Name Servers (DNS) Source", "Use these DNS Servers")
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Primary DNS Server", configRow["Wan.PriDnsIpAddr"] or "0.0.0.0")
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Secondary DNS Server", configRow["Wan.SecDnsIpAddr"] or "0.0.0.0")
    else
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Domain Name Servers (DNS) Source", "Get Dynamically From ISP")
    end
    if L1_69 == "7" then
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Japanese Pppoe Configuration", "")
      L6_74 = configRow
      L6_74 = L6_74["Wan.JIsGetIpDyn"]
      if L6_74 == "1" then
        L6_74 = resTab
        L6_74 = L6_74.insertField
        L6_74(L0_68, "Seconday Profile Address Mode", ":Dynamic Ip")
      else
        L6_74 = resTab
        L6_74 = L6_74.insertField
        L6_74(L0_68, "Seconday Profile Address Mode", ":Static Ip")
        L6_74 = resTab
        L6_74 = L6_74.insertField
        L6_74(L0_68, "Seconday Profile IP Address", configRow["Wan.JIpAddr"] or "0.0.0.0")
        L6_74 = resTab
        L6_74 = L6_74.insertField
        L6_74(L0_68, "Seconday Profile IP Subnet Mask", configRow["Wan.JSnetMask"] or "0.0.0.0")
      end
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Seconday Profile Username", configRow["Wan.JUserName"] or "")
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Seconday Profile Password", configRow["Wan.JPassword"] or "")
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Seconday Profile Service", configRow["Wan.JService"] or "")
      L6_74 = configRow
      L6_74 = L6_74["Wan.JppoeIdleTimeOutFlag"]
      if L6_74 == "0" then
        L6_74 = resTab
        L6_74 = L6_74.insertField
        L6_74(L0_68, "Seconday Profile Connectivity Type", "Keep Connected")
      else
        L6_74 = configRow
        L6_74 = L6_74["Wan.JppoeIdleTimeOutFlag"]
        if L6_74 == "1" then
          L6_74 = resTab
          L6_74 = L6_74.insertField
          L6_74(L0_68, "Seconday Profile Connectivity Type", "Idle Time")
          L6_74 = resTab
          L6_74 = L6_74.insertField
          L6_74(L0_68, "Seconday Profile Idle Time (in minutes)", configRow["Wan.JppoeIdleTimeOutValue"])
        end
      end
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Seconday Profile Authentication Type", L5_73)
    end
    if L1_69 == "9" then
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, [[

DUAL ACCESS PPPOE - Internal Network Configuration]], "")
      L6_74 = configRow
      L6_74 = L6_74["Wan.GetIpFromIspPhy"]
      if L6_74 == "1" then
        L6_74 = resTab
        L6_74 = L6_74.insertField
        L6_74(L0_68, "Address Mode(Phy)", ":Dynamic Ip")
      else
        L6_74 = resTab
        L6_74 = L6_74.insertField
        L6_74(L0_68, "Address Mode(Phy)", ":Static Ip")
        L6_74 = resTab
        L6_74 = L6_74.insertField
        L6_74(L0_68, "IP Address(Phy)", configRow["Wan.StaticIpPhy"] or "0.0.0.0")
        L6_74 = resTab
        L6_74 = L6_74.insertField
        L6_74(L0_68, "IP Subnet Mask(Phy)", configRow["Wan.NetMaskPhy"] or "0.0.0.0")
        L6_74 = resTab
        L6_74 = L6_74.insertField
        L6_74(L0_68, "Gateway(Phy)", configRow["Wan.GatewayPhy"] or "0.0.0.0")
      end
      L6_74 = configRow
      L6_74 = L6_74["Wan.GetDnsFromIspPhy"]
      if L6_74 == "0" then
        L6_74 = resTab
        L6_74 = L6_74.insertField
        L6_74(L0_68, "Domain Name Servers (DNS) Source(Phy)", "Use these DNS Servers")
        L6_74 = resTab
        L6_74 = L6_74.insertField
        L6_74(L0_68, "Primary DNS Server(Phy)", configRow["Wan.PrimaryDnsPhy"] or "0.0.0.0")
        L6_74 = resTab
        L6_74 = L6_74.insertField
        L6_74(L0_68, "Secondary DNS Server(Phy)", configRow["Wan.SecondaryDnsPhy"] or "0.0.0.0")
      else
        L6_74 = resTab
        L6_74 = L6_74.insertField
        L6_74(L0_68, "Domain Name Servers (DNS) Source(Phy)", "Get Dynamically From ISP")
      end
    end
  end
  if L1_69 ~= "8" then
    L6_74 = configRow
    L6_74 = L6_74["Wan.UseMac"]
    if L6_74 == "0" then
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "MAC Address Source", "Use Default Address")
    else
      L6_74 = configRow
      L6_74 = L6_74["Wan.UseMac"]
      if L6_74 == "1" then
        L6_74 = resTab
        L6_74 = L6_74.insertField
        L6_74(L0_68, "MAC Address Source", "Clone your PC's MAC Address")
      else
        L6_74 = configRow
        L6_74 = L6_74["Wan.UseMac"]
        if L6_74 == "2" then
          L6_74 = resTab
          L6_74 = L6_74.insertField
          L6_74(L0_68, "MAC Address Source", "Use this MAC Address")
          L6_74 = resTab
          L6_74 = L6_74.insertField
          L6_74(L0_68, "MAC Address", configRow["Wan.MacAddr"] or "")
        end
      end
    end
  end
  if L1_69 == "8" then
    L6_74 = resTab
    L6_74 = L6_74.insertField
    L6_74(L0_68, "Mobile Internet Configuration", "")
    L6_74 = configRow
    L6_74 = L6_74["Wan.IdleTimeOutFlag"]
    if L6_74 == "0" then
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Connectivity Type", "Keep Connected")
    else
      L6_74 = configRow
      L6_74 = L6_74["Wan.IdleTimeOutFlag"]
      if L6_74 == "1" then
        L6_74 = resTab
        L6_74 = L6_74.insertField
        L6_74(L0_68, "Connectivity Type", "Idle Time")
        L6_74 = resTab
        L6_74 = L6_74.insertField
        L6_74(L0_68, "Idle Time (in minutes)", configRow["Wan.IdleTime"])
      end
    end
    L6_74 = resTab
    L6_74 = L6_74.insertField
    L6_74(L0_68, "Username", configRow["Wan.UserName"] or "")
    L6_74 = resTab
    L6_74 = L6_74.insertField
    L6_74(L0_68, "Password", util.mask(configRow["Wan.Password"]) or "")
    L6_74 = resTab
    L6_74 = L6_74.insertField
    L6_74(L0_68, "Dial Number", configRow["Wan.DialNumber"] or "")
    L6_74 = configRow
    L6_74 = L6_74["Wan.AuthMethod"]
    if L6_74 == "0" then
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "AuthMethod", "NONE")
    else
      L6_74 = configRow
      L6_74 = L6_74["Wan.AuthMethod"]
      if L6_74 == "1" then
        L6_74 = resTab
        L6_74 = L6_74.insertField
        L6_74(L0_68, "AuthMethod", "PAP")
      else
        L6_74 = configRow
        L6_74 = L6_74["Wan.AuthMethod"]
        if L6_74 == "2" then
          L6_74 = resTab
          L6_74 = L6_74.insertField
          L6_74(L0_68, "AuthMethod", "CHAP")
        end
      end
    end
    L6_74 = resTab
    L6_74 = L6_74.insertField
    L6_74(L0_68, "APN", configRow["Wan.APN"] or "")
    L6_74 = configRow
    L6_74 = L6_74["Wan.IsDNSDyn"]
    if L6_74 == "0" then
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Domain Name Servers (DNS) Source", "Use these DNS Servers")
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Primary DNS Server", configRow["Wan.PriDnsIpAddr"] or "")
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Secondary DNS Server", configRow["Wan.SecDnsIpAddr"] or "")
    else
      L6_74 = resTab
      L6_74 = L6_74.insertField
      L6_74(L0_68, "Domain Name Servers (DNS) Source", "Get Dynamically From ISP")
    end
  end
  L6_74 = _UPVALUE0_
  L6_74 = L6_74.vlanOverWanConfigGet
  L6_74 = L6_74("WAN2")
  if L6_74 ~= _UPVALUE1_.SUCCESS then
    statusMessage = _UPVALUE2_.errorStringGet(L6_74)
    return "ERROR", statusMessage
  end
  if L6_74("WAN2")["VlanOverWan.VlanPortMode"] ~= _UPVALUE3_ then
    resTab.insertField(L0_68, "Vlan Over Wan", "ENABLE")
    resTab.insertField(L0_68, "vlan Id", L6_74("WAN2")["VlanOverWan.VlanId"])
  else
    resTab.insertField(L0_68, "Vlan Over Wan", "DISABLE")
  end
  printLabel("WAN2 Setup")
  resTab.print(L0_68, 0)
end
function wanStatusGetWan2()
  local L0_75, L1_76, L2_77, L3_78, L4_79, L5_80, L6_81, L7_82, L8_83, L9_84, L10_85, L11_86, L12_87, L13_88, L14_89, L15_90, L16_91, L17_92, L18_93, L19_94, L20_95, L21_96, L22_97, L23_98, L24_99, L25_100, L26_101, L27_102, L28_103, L29_104, L30_105, L31_106, L32_107, L33_108, L34_109, L35_110
  L0_75 = {}
  L1_76, L2_77, L3_78, L4_79, L5_80 = nil, nil, nil, nil, nil
  L6_81 = db
  L6_81 = L6_81.getAttribute
  L7_82 = "environment"
  L8_83 = "name"
  L9_84 = "NIMFSTATUS_PROGRAM"
  L10_85 = "value"
  L6_81 = L6_81(L7_82, L8_83, L9_84, L10_85)
  if L6_81 ~= nil then
    L7_82 = util
    L7_82 = L7_82.appendDebugOut
    L8_83 = "Exec = "
    L9_84 = os
    L9_84 = L9_84.execute
    L10_85 = L6_81
    L11_86 = " "
    L12_87 = DB_FILE_NAME
    L13_88 = " WAN2 2"
    L10_85 = L10_85 .. L11_86 .. L12_87 .. L13_88
    L9_84 = L9_84(L10_85)
    L8_83 = L8_83 .. L9_84
    L7_82(L8_83)
    L7_82 = util
    L7_82 = L7_82.appendDebugOut
    L8_83 = "Exec = "
    L9_84 = os
    L9_84 = L9_84.execute
    L10_85 = L6_81
    L11_86 = " "
    L12_87 = DB_FILE_NAME
    L13_88 = " WAN2 2"
    L10_85 = L10_85 .. L11_86 .. L12_87 .. L13_88
    L9_84 = L9_84(L10_85)
    L8_83 = L8_83 .. L9_84
    L7_82(L8_83)
  end
  L7_82 = db
  L7_82 = L7_82.getAttribute
  L8_83 = "networkInfo"
  L9_84 = "_ROWID_"
  L10_85 = "1"
  L11_86 = "netWorkMode"
  L7_82 = L7_82(L8_83, L9_84, L10_85, L11_86)
  L7_82 = L7_82 or "0"
  if L7_82 == "3" then
    L8_83 = db
    L8_83 = L8_83.getAttribute
    L9_84 = "environment"
    L10_85 = "name"
    L11_86 = "IPV6_GW_UPDATE"
    L12_87 = "value"
    L8_83 = L8_83(L9_84, L10_85, L11_86, L12_87)
    L6_81 = L8_83
    if L6_81 ~= nil then
      L8_83 = util
      L8_83 = L8_83.appendDebugOut
      L9_84 = "Exec = "
      L10_85 = os
      L10_85 = L10_85.execute
      L11_86 = L6_81
      L12_87 = " "
      L13_88 = DB_FILE_NAME
      L11_86 = L11_86 .. L12_87 .. L13_88
      L10_85 = L10_85(L11_86)
      L9_84 = L9_84 .. L10_85
      L8_83(L9_84)
    end
  end
  L8_83 = "WAN2"
  logIfName = L8_83
  L8_83 = "2"
  addressFamily = L8_83
  L8_83 = nimfView
  L8_83 = L8_83.wanStatusGetWrap
  L9_84 = logIfName
  L10_85 = addressFamily
  L8_83 = L8_83(L9_84, L10_85)
  configRow = L8_83
  L8_83 = configRow
  L8_83 = L8_83["Wan.operation"]
  L8_83 = L8_83 or ""
  L9_84 = "LogicalIfName = 'WAN2' and addressFamily = 2"
  L10_85 = db
  L10_85 = L10_85.getRowWhere
  L11_86 = "NimfConf"
  L12_87 = L9_84
  L10_85 = L10_85(L11_86, L12_87)
  L11_86 = db
  L11_86 = L11_86.getRowsWhere
  L12_87 = "ipAddressTable"
  L13_88 = L9_84
  L11_86 = L11_86(L12_87, L13_88)
  L12_87 = db
  L12_87 = L12_87.getRows
  L13_88 = "resolverConfig"
  L14_89 = "LogicalIfName"
  L15_90 = "WAN2"
  L12_87 = L12_87(L13_88, L14_89, L15_90)
  L13_88 = db
  L13_88 = L13_88.getRows
  L14_89 = "defaultRouters"
  L15_90 = "LogicalIfName"
  L16_91 = "WAN2"
  L13_88 = L13_88(L14_89, L15_90, L16_91)
  L14_89 = db
  L14_89 = L14_89.getAttribute
  L15_90 = "networkInterface"
  L16_91 = "LogicalIfName"
  L17_92 = "WAN2"
  L18_93 = "interfaceName"
  L14_89 = L14_89(L15_90, L16_91, L17_92, L18_93)
  L15_90 = db
  L15_90 = L15_90.getAttribute
  L16_91 = "networkInterface"
  L17_92 = "LogicalIfName"
  L18_93 = "WAN2"
  L19_94 = "IfStatus"
  L15_90 = L15_90(L16_91, L17_92, L18_93, L19_94)
  L15_90 = L15_90 or ""
  L16_91 = ""
  L17_92 = ""
  L18_93 = ""
  L19_94 = ""
  L20_95 = ""
  L21_96 = {}
  L22_97 = {}
  L23_98 = {}
  L24_99 = ""
  if L14_89 ~= nil then
    L25_100 = nimfView
    L25_100 = L25_100.macAddressGet
    L26_101 = logIfName
    L25_100 = L25_100(L26_101)
    L16_91 = L25_100
  end
  L25_100 = L10_85["NimfConf.ConnectionType"]
  if L25_100 ~= nil then
    L25_100 = L10_85["NimfConf.ConnectionType"]
    if L25_100 == "dhcpc" then
      L18_93 = "Dynamic IP (DHCP)"
    else
      L25_100 = L10_85["NimfConf.ConnectionType"]
      if L25_100 == "ifStatic" then
        L18_93 = "STATIC"
      else
        L25_100 = L10_85["NimfConf.ConnectionType"]
        if L25_100 == "pppoe" then
          L25_100 = _UPVALUE0_
          L26_101 = " = '"
          L25_100 = L25_100 .. L26_101 .. L27_102 .. L28_103
          L26_101 = false
          L22_97 = L27_102
          if L22_97 ~= L27_102 then
            L26_101 = true
            for L30_105, L31_106 in L27_102(L28_103) do
              L32_107 = _UPVALUE1_
              L32_107 = L32_107 .. L33_108 .. L34_109
              L32_107 = L31_106[L32_107]
              if L32_107 == L33_108 then
                L26_101 = false
              end
            end
          end
          if L26_101 then
            L18_93 = "JPPPOE"
            L21_96 = L22_97
          else
            L18_93 = "PPPOE"
          end
        else
          L25_100 = L10_85["NimfConf.ConnectionType"]
          if L25_100 == "pptp" then
            L18_93 = "PPTP"
          else
            L25_100 = L10_85["NimfConf.ConnectionType"]
            if L25_100 == "l2tp" then
              L18_93 = "L2TP"
            else
              L25_100 = L10_85["NimfConf.ConnectionType"]
              if L25_100 == "dualPppoe" then
                L18_93 = "DPPPOE"
                L25_100 = db
                L25_100 = L25_100.getRowWhere
                L26_101 = "DualPppoe"
                L25_100 = L25_100(L26_101, L27_102)
                L23_98 = L25_100
              else
                L25_100 = L10_85["NimfConf.ConnectionType"]
                if L25_100 == "threeg" then
                  L18_93 = "Mobile Internet"
                end
              end
            end
          end
        end
      end
    end
  end
  if L18_93 == "PPTP" then
    L25_100 = db
    L25_100 = L25_100.getAttribute
    L26_101 = "PPTP"
    L25_100 = L25_100(L26_101, L27_102, L28_103, L29_104)
    L1_76 = L25_100
  elseif L18_93 == "L2TP" then
    L25_100 = db
    L25_100 = L25_100.getAttribute
    L26_101 = "L2TP"
    L25_100 = L25_100(L26_101, L27_102, L28_103, L29_104)
    L2_77 = L25_100
  end
  L25_100 = db
  L25_100 = L25_100.getRowWhere
  L26_101 = "NimfStatus"
  L25_100 = L25_100(L26_101, L27_102)
  if L25_100 ~= nil then
    L26_101 = L25_100["NimfStatus.Nimfstatus"]
    L19_94 = L26_101 or ""
  end
  L26_101 = db
  L26_101 = L26_101.getRowWhere
  L26_101 = L26_101(L27_102, L28_103)
  if L26_101 ~= nil then
    L20_95 = L27_102 or ""
  end
  if L27_102 == "1" then
    L17_92 = "Enabled"
  else
    L17_92 = "Disabled"
  end
  L27_102(L28_103, L29_104, L30_105)
  L30_105 = L16_91 or ""
  L27_102(L28_103, L29_104, L30_105)
  if L18_93 ~= "JPPPOE" then
    if L11_86 then
      for L32_107, L33_108 in L29_104(L30_105) do
        if L28_103 ~= L35_110 then
        end
      end
    end
  else
    if L18_93 == "JPPPOE" then
      if L11_86 then
        for L32_107, L33_108 in L29_104(L30_105) do
          if L28_103 ~= L35_110 then
          end
        end
      end
      if L29_104 == 2 then
        if L29_104 == 2 then
          L32_107 = "r"
          if L30_105 then
            L32_107 = L30_105
            L29_104 = L31_106 or ""
            L32_107 = ", "
            L32_107 = L30_105
            L31_106(L32_107)
          end
        end
      end
    else
    end
  end
  if L18_93 == "DPPPOE" then
    if L31_106 == "1" then
      L32_107 = "/var/russia_dualPppoe.conf"
      if L31_106 then
        L32_107 = L31_106.read
        L32_107 = L32_107(L33_108, L34_109)
        L24_99 = L32_107 or ""
        L32_107 = L31_106.read
        L32_107 = L32_107(L33_108, L34_109)
        L30_105 = L32_107 or ""
        L32_107 = L31_106.read
        L32_107 = L32_107(L33_108, L34_109)
        L29_104 = L32_107 or ""
      else
        L24_99 = "0.0.0.0"
      end
      L32_107 = L27_102
    elseif L31_106 == "0" and L15_90 == "1" then
      if L31_106 ~= nil then
        if L31_106 ~= nil then
          if L31_106 ~= nil then
            L24_99 = L23_98["DualPppoe.GatewayPhy"]
          end
        end
      else
        L24_99 = "0.0.0.0"
      end
      L32_107 = ", "
    end
  end
  if L1_76 == "1" then
    L32_107 = "WAN2"
    L32_107 = nil
    if L34_109 == 0 then
      L3_78 = L34_109 or ""
      L32_107 = L34_109 or ""
      L33_108 = L34_109 or ""
      L4_79 = L34_109 or ""
      L5_80 = "0.0.0.0"
    else
      rPptp_file = L34_109
      if L34_109 then
        L3_78 = L34_109 or ""
        L32_107 = L34_109 or ""
        L33_108 = L34_109 or ""
        L4_79 = L34_109 or ""
        L5_80 = L34_109 or ""
        L34_109(L35_110)
      else
        L3_78 = "0.0.0.0"
        L32_107 = "0.0.0.0"
        L4_79 = "0.0.0.0"
        L5_80 = "0.0.0.0"
      end
    end
  elseif L2_77 == "1" then
    L32_107 = "WAN2"
    L32_107 = nil
    if L34_109 == 0 then
      L3_78 = L34_109 or ""
      L32_107 = L34_109 or ""
      L33_108 = L34_109 or ""
      L4_79 = L34_109 or ""
      L5_80 = "0.0.0.0"
    else
      rL2tp_file = L34_109
      if L34_109 then
        L3_78 = L34_109 or ""
        L32_107 = L34_109 or ""
        L33_108 = L34_109 or ""
        L4_79 = L34_109 or ""
        L5_80 = L34_109 or ""
        L34_109(L35_110)
      else
        L3_78 = "0.0.0.0"
        L32_107 = "0.0.0.0"
        L4_79 = "0.0.0.0"
        L5_80 = "0.0.0.0"
      end
    end
  end
  L32_107 = L27_102 or ""
  L29_104(L30_105, L31_106, L32_107)
  if L15_90 == "1" then
    L15_90 = "UP"
  elseif L15_90 == "2" then
    L15_90 = "UP(IPv6)"
  elseif L15_90 == "3" then
    L15_90 = "UP(IPv4 and IPv6)"
  elseif L15_90 == "0" then
    L15_90 = "DOWN"
  end
  if L18_93 == "JPPPOE" then
    L32_107 = L15_90
    if L31_106 == 2 then
      L32_107 = "/var/wan201Ip"
      if L31_106 then
        L32_107 = L30_105
        L32_107 = L31_106.close
        L32_107(L33_108)
      else
        L32_107 = L30_105
      end
    end
    L15_90 = L30_105
  end
  if L18_93 == "DPPPOE" then
    if L30_105 == "1" then
      L32_107 = "r"
      if L30_105 then
      else
      end
    elseif L30_105 == "0" then
      if L15_90 == "UP" then
      else
      end
    end
    L32_107 = L29_104
    L15_90 = L30_105 .. L31_106 .. L32_107 .. L33_108 .. L34_109 .. L35_110
  end
  if L1_76 == "1" then
    L32_107 = "WAN2"
    L32_107 = "/var/russia_pptp.conf"
    isFile = L31_106
    if L31_106 then
      L32_107 = L31_106
      L31_106(L32_107)
    else
    end
    L32_107 = L29_104
    L32_107 = ", "
    L15_90 = L31_106 .. L32_107 .. L33_108 .. L34_109
  elseif L2_77 == "1" then
    L32_107 = "WAN2"
    L32_107 = "/var/russia_l2tp.conf"
    isFile = L31_106
    if L31_106 then
      L32_107 = L31_106
      L31_106(L32_107)
    else
    end
    L32_107 = L29_104
    L32_107 = ", "
    L15_90 = L31_106 .. L32_107 .. L33_108 .. L34_109
  end
  L32_107 = L15_90 or ""
  L29_104(L30_105, L31_106, L32_107)
  L32_107 = L17_92 or ""
  L29_104(L30_105, L31_106, L32_107)
  if L18_93 ~= "DPPPOE" then
    if L1_76 == "1" then
      L32_107 = "Russian dual access PPTP"
      L29_104(L30_105, L31_106, L32_107)
    elseif L2_77 == "1" then
      L32_107 = "Russian dual access L2TP"
      L29_104(L30_105, L31_106, L32_107)
    elseif L18_93 == "JPPPOE" then
      L32_107 = "Japanese multiple PPPoE"
      L29_104(L30_105, L31_106, L32_107)
    else
      L32_107 = L18_93 or ""
      L29_104(L30_105, L31_106, L32_107)
    end
  else
    L32_107 = "Russian dual access PPPoE"
    L29_104(L30_105, L31_106, L32_107)
  end
  L32_107 = L19_94 or ""
  L29_104(L30_105, L31_106, L32_107)
  L32_107 = L20_95 or ""
  L29_104(L30_105, L31_106, L32_107)
  L32_107 = "_ROWID_"
  if L30_105 ~= nil then
    L32_107 = L30_105["WanMode.Wanmode"]
    if L32_107 == "2" then
    else
    end
    if L31_106 ~= nil then
      if L31_106 == "WAN1" then
      else
      end
    else
    end
    L32_107 = L30_105["WanMode.Wanmode"]
    if L32_107 == "2" then
      L32_107 = "Auto-Rollover using WAN port"
    else
      L32_107 = L30_105["WanMode.Wanmode"]
      if L32_107 == "1" then
      else
        L32_107 = L30_105["WanMode.Wanmode"]
        if L32_107 == "3" then
        else
          L32_107 = L30_105["WanMode.Wanmode"]
          if L32_107 == "0" then
            L32_107 = "Use only single WAN port"
          end
        end
      end
    end
  end
  L32_107 = L0_75
  L34_109 = L29_104 or ""
  L31_106(L32_107, L33_108, L34_109)
  if L13_88 then
    L32_107 = 0
    for _FORV_36_, _FORV_37_ in L33_108(L34_109) do
      L32_107 = L32_107 + 1
      if L13_88[L32_107]["defaultRouters.nextHopGateway"] ~= nil and L13_88[L32_107]["defaultRouters.nextHopGateway"] ~= "" and L31_106 == "" then
      else
      end
    end
  end
  if L18_93 == "JPPPOE" then
    L32_107 = L31_106
    L32_107 = #L21_96
    if L32_107 == 2 then
      L32_107 = io
      L32_107 = L32_107.open
      L32_107 = L32_107(L33_108, L34_109)
      if L32_107 then
        L34_109(L35_110)
      end
    end
  end
  if L18_93 == "DPPPOE" then
    L32_107 = L31_106
  end
  if L1_76 == "1" then
    L32_107 = L31_106
    L32_107 = resTab
    L32_107 = L32_107.insertField
    L35_110 = L31_106 or ""
    L32_107(L33_108, L34_109, L35_110)
  elseif L2_77 == "1" then
    L32_107 = L31_106
    L32_107 = resTab
    L32_107 = L32_107.insertField
    L35_110 = L31_106 or ""
    L32_107(L33_108, L34_109, L35_110)
  else
    L32_107 = resTab
    L32_107 = L32_107.insertField
    L35_110 = L31_106 or ""
    L32_107(L33_108, L34_109, L35_110)
  end
  L32_107 = ""
  if L12_87 then
    for _FORV_37_, _FORV_38_ in L34_109(L35_110) do
      if L12_87[L33_108]["resolverConfig.nameserver1"] ~= nil and L12_87[L33_108]["resolverConfig.nameserver1"] ~= "" and L32_107 == "" then
        L32_107 = L32_107 .. L12_87[L33_108]["resolverConfig.nameserver1"]
      else
      end
    end
  end
  if L18_93 == "JPPPOE" then
    L32_107 = L33_108 .. L34_109 .. L35_110 .. ")"
    if L33_108 == 2 then
      if L33_108 then
        L32_107 = L35_110 .. ", " .. L34_109 .. " (" .. "Secondary" .. ")"
        L35_110(L33_108)
      end
    end
  end
  if L18_93 == "DPPPOE" then
    if L12_87 then
      for _FORV_38_, _FORV_39_ in L35_110(L12_87) do
        if L12_87[L34_109]["resolverConfig.nameserver3"] ~= nil and L12_87[L34_109]["resolverConfig.nameserver3"] ~= "" and L33_108 == "" then
        else
        end
      end
    end
    L32_107 = L34_109 .. L35_110 .. L33_108 .. " (" .. "Physical" .. ")"
  end
  if L1_76 == "1" then
    L32_107 = L33_108 .. L34_109 .. L35_110 .. "(Physical)"
    L33_108(L34_109, L35_110, L32_107 or "")
  elseif L2_77 == "1" then
    L32_107 = L33_108 .. L34_109 .. L35_110 .. "(Physical)"
    L33_108(L34_109, L35_110, L32_107 or "")
  else
    L33_108(L34_109, L35_110, L32_107 or "")
  end
  if L12_87 then
    for _FORV_38_, _FORV_39_ in L35_110(L12_87) do
      if L12_87[L34_109]["resolverConfig.nameserver2"] ~= nil and L12_87[L34_109]["resolverConfig.nameserver2"] ~= "" and L33_108 == "" then
      else
      end
    end
  end
  if L18_93 == "JPPPOE" then
    if L34_109 == 2 then
      if L34_109 then
        while true do
          if L28_103 == 2 then
            break
          end
        end
        L34_109:close()
      end
    end
  end
  if L18_93 == "DPPPOE" then
    if L12_87 then
      for _FORV_39_, _FORV_40_ in pairs(L12_87) do
        if L12_87[L35_110]["resolverConfig.nameserver4"] ~= nil and L12_87[L35_110]["resolverConfig.nameserver4"] ~= "" and L34_109 == "" then
        else
        end
      end
    end
  end
  if L1_76 == "1" then
    L34_109(L35_110, "Secondary DNS", L33_108 or "")
  elseif L2_77 == "1" then
    L34_109(L35_110, "Secondary DNS", L33_108 or "")
  else
    L34_109(L35_110, "Secondary DNS", L33_108 or "")
  end
  L34_109(L35_110)
  L34_109(L35_110, 0)
end
function nimfCfgSaveWan2(A0_111)
  local L1_112, L2_113, L3_114, L4_115, L5_116, L6_117, L7_118, L8_119, L9_120
  L1_112 = "OK"
  L2_113 = true
  L3_114 = true
  L4_115 = _UPVALUE0_
  L4_115 = L4_115.vlanOverWanConfigGet
  L5_116 = "WAN2"
  L5_116 = L4_115(L5_116)
  L6_117 = _UPVALUE1_
  L6_117 = L6_117.SUCCESS
  if L4_115 ~= L6_117 then
    L6_117 = _UPVALUE2_
    L6_117 = L6_117.errorStringGet
    L7_118 = L4_115
    L6_117 = L6_117(L7_118)
    statusMessage = L6_117
    L6_117 = "ERROR"
    L7_118 = statusMessage
    return L6_117, L7_118
  end
  L6_117 = db
  L6_117 = L6_117.getAttribute
  L7_118 = "networkInfo"
  L8_119 = "_ROWID_"
  L9_120 = "1"
  L6_117 = L6_117(L7_118, L8_119, L9_120, "netWorkMode")
  L6_117 = L6_117 or "0"
  if L6_117 == "3" then
    L7_118 = "LogicalIfName = 'WAN2'"
    L8_119 = "LogicalIfName = 'WAN2' AND ProfileName='pppoeProfile1'"
    L9_120 = nil
    if db.getRowWhere("Pppoe6", L7_118) == _UPVALUE1_.NIL then
      return false
    end
    L9_120 = db.getRowWhere("Pppoe6", L7_118)["Pppoe6.PppoeSessions"]
    if tonumber(L9_120) == 2 and tonumber(A0_111["Wan.IspType"]) == 2 and tonumber(A0_111["Wan.PppoeIdleTimeOutFlag"]) == 1 then
      printCLIError("Please disable the option Common " .. "Session in IPv6 Wan Settings.")
      return false
    end
    if tonumber(A0_111["Wan.IspType"]) ~= 2 and tonumber(L9_120) == 2 then
      printCLIError("Please disable the option Common Session in " .. "IPv6 Wan Settings.")
      return false
    end
  end
  L7_118 = _UPVALUE3_
  L7_118 = L7_118.start
  L7_118()
  A0_111["NimfConf.LogicalIfName"] = "WAN2"
  L7_118 = A0_111["Wan.IspType"]
  if L7_118 ~= "8" then
    L7_118 = L5_116["VlanOverWan.VlanPortMode"]
    oldVlanWanStatus = L7_118
    L7_118 = L5_116["VlanOverWan.VlanId"]
    oldWanVlanId = L7_118
    L7_118 = A0_111["Wan.vlanWan2Status"]
    vlanWan2Status = L7_118
    L7_118 = A0_111["Wan.wanVlanId"]
    wanVlanId = L7_118
    L7_118 = tonumber
    L8_119 = oldVlanWanStatus
    L7_118 = L7_118(L8_119)
    if L7_118 == 2 then
      L2_113 = false
      L7_118 = _UPVALUE4_
      oldVlanWanStatus = L7_118
    end
    L7_118 = oldVlanWanStatus
    L8_119 = vlanWan2Status
    if L7_118 == L8_119 and L2_113 then
      L3_114 = false
    else
      L7_118 = oldVlanWanStatus
      L8_119 = vlanWan2Status
      if L7_118 == L8_119 then
        L7_118 = vlanWan2Status
        L8_119 = _UPVALUE4_
        if L7_118 == L8_119 then
          L7_118 = wanVlanId
          L8_119 = oldWanVlanId
          if L7_118 == L8_119 then
            L3_114 = false
          end
        end
      end
    end
    if L3_114 then
      L7_118 = vlanWan2Status
      L8_119 = _UPVALUE5_
      if L7_118 == L8_119 then
        L7_118 = oldWanVlanId
        wanVlanId = L7_118
      end
      L7_118 = _UPVALUE0_
      L7_118 = L7_118.vlanOverWanConfig
      L8_119 = vlanWan2Status
      L9_120 = wanVlanId
      L7_118 = L7_118(L8_119, L9_120, "WAN2")
      L4_115 = L7_118
      L7_118 = _UPVALUE1_
      L7_118 = L7_118.SUCCESS
      if L4_115 ~= L7_118 then
        L7_118 = _UPVALUE2_
        L7_118 = L7_118.errorStringGet
        L8_119 = L4_115
        L7_118 = L7_118(L8_119)
        statusMessage = L7_118
        L7_118 = "ERROR"
        L8_119 = statusMessage
        return L7_118, L8_119
      end
    end
  end
  L7_118 = nimfView
  L7_118 = L7_118.wanConfigSet
  L8_119 = A0_111
  L9_120 = "1"
  L8_119 = L7_118(L8_119, L9_120, "edit")
  statusCode = L8_119
  L1_112 = L7_118
  if L1_112 == "OK" then
    L7_118 = _UPVALUE3_
    L7_118 = L7_118.complete
    L7_118()
    L7_118 = _UPVALUE3_
    L7_118 = L7_118.save
    L7_118()
  else
    L7_118 = _UPVALUE3_
    L7_118 = L7_118.abort
    L7_118()
  end
  L7_118 = db
  L7_118 = L7_118.getAttribute
  L8_119 = "stringsMap"
  L9_120 = "stringId"
  L7_118 = L7_118(L8_119, L9_120, statusCode, LANGUAGE)
  L7_118 = L7_118 or statusCode
  statusMessage = L7_118
  L7_118 = L1_112
  L8_119 = statusMessage
  return L7_118, L8_119
end
function nimfCfgInitWan2(A0_121)
  local L1_122
  L1_122 = {}
  L1_122 = nimfView.wanConfigurationGet("WAN2")
  L1_122["Wan.Secret"] = ""
  L1_122["Wan.SecDnsIpAddr"] = ""
  L1_122["Wan.MyIpAddr"] = ""
  L1_122["Wan.HostName"] = ""
  L1_122["Wan.LoginName"] = ""
  L1_122["Wan.LoginPassword"] = ""
  L1_122["Wan.IpAddr"] = ""
  L1_122["Wan.SnetMask"] = ""
  L1_122["Wan.IsGetIpDyn"] = "1"
  L1_122["Wan.Gateway"] = ""
  L1_122["Wan.SvrIpAddr"] = ""
  L1_122["Wan.IsDNSDyn"] = "1"
  L1_122["Wan.PriDnsIpAddr"] = ""
  L1_122["Wan.SecDnsIpAddr"] = ""
  L1_122["Wan.MppeEncryptSupport"] = "0"
  L1_122["Wan.IdleTimeOutFlag"] = "0"
  L1_122["Wan.AuthOpt"] = "1"
  L1_122["Wan.PppoeIdleTimeOutFlag"] = "0"
  L1_122["Wan.JAuthOpt"] = "1"
  L1_122["Wan.JPppoeIdleTimeOutFlag"] = "0"
  L1_122["Wan.APN"] = ""
  L1_122["Wan.IspType"] = ""
  L1_122["Wan.StaticDNS"] = ""
  L1_122["Wan.vlanWan2Status"] = ""
  L1_122["Wan.wanVlanId"] = ""
  L1_122["Wan.UserName"] = ""
  L1_122["Wan.Password"] = ""
  return 1, L1_122
end
function nimfCfgInputValWan2(A0_123)
  local L1_124, L2_125, L3_126, L4_127, L5_128, L6_129, L7_130, L8_131, L9_132, L10_133, L11_134
  L1_124 = 0
  L2_125 = 0
  L3_126 = 0
  L4_127 = ""
  L5_128 = ""
  L6_129 = db
  L6_129 = L6_129.getAttribute
  L7_130 = "unitInfo"
  L8_131 = "_ROWID_"
  L9_132 = "1"
  L10_133 = "modelId"
  L6_129 = L6_129(L7_130, L8_131, L9_132, L10_133)
  if L6_129 == "DSR-1000N" or L6_129 == "DSR-1000" then
    L7_130 = A0_123["Wan.IspType"]
    if L7_130 == "8" then
      L7_130 = printCLIError
      L8_131 = "Mobile internet is not implemented in this box"
      L7_130(L8_131)
      L7_130 = false
      return L7_130
    end
  end
  L7_130 = A0_123["Wan.IspType"]
  if L7_130 ~= "8" then
    L7_130 = A0_123["Wan.vlanWan2Status"]
    if L7_130 ~= "" then
      L7_130 = A0_123["Wan.vlanWan2Status"]
    elseif L7_130 == nil then
      L7_130 = printCLIError
      L8_131 = "Enter Valid Enable/Disable for vlan on WAN2\n"
      L7_130(L8_131)
      L7_130 = false
      return L7_130
    end
    L7_130 = A0_123["Wan.vlanWan2Status"]
    if L7_130 == "1" then
      L7_130 = A0_123["Wan.wanVlanId"]
      if L7_130 ~= "" then
        L7_130 = A0_123["Wan.wanVlanId"]
        if L7_130 ~= nil then
          L7_130 = A0_123["Wan.wanVlanId"]
          if L7_130 ~= "1" then
            L7_130 = tonumber
            L8_131 = A0_123["Wan.wanVlanId"]
            L7_130 = L7_130(L8_131)
          end
        end
      elseif L7_130 > 4093 then
        L7_130 = printCLIError
        L8_131 = "Enter Valid Vlan Id, range 2 - 4093\n"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
    end
  end
  L7_130 = A0_123["Wan.IspType"]
  if L7_130 == "1" then
    A0_123["Wan.MppeEncryptSupport"] = "0"
    A0_123["Wan.SplitTunnel"] = "0"
    L7_130 = A0_123["Wan.IpAddr"]
    if L7_130 ~= "" then
      L7_130 = A0_123["Wan.IpAddr"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.IpAddr"]
        if L7_130 ~= nil then
          L7_130 = A0_123["Wan.IpAddr"]
        end
      end
    elseif L7_130 == "0.0.0.0" then
      L7_130 = printCLIError
      L8_131 = "Invalid static Address\n"
      L7_130(L8_131)
      L7_130 = false
      return L7_130
    end
    L7_130 = util
    L7_130 = L7_130.split
    L8_131 = A0_123["Wan.IpAddr"]
    L9_132 = "."
    L7_130 = L7_130(L8_131, L9_132)
    L8_131 = tonumber
    L9_132 = L7_130[1]
    L8_131 = L8_131(L9_132)
    if L8_131 ~= 224 then
      L8_131 = tonumber
      L9_132 = L7_130[1]
      L8_131 = L8_131(L9_132)
    elseif L8_131 > 224 then
      L8_131 = printCLIError
      L9_132 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
      L8_131(L9_132)
      L8_131 = false
      return L8_131
    end
    L8_131 = _UPVALUE0_
    L8_131 = L8_131.ipv4SingleMaskCheck
    L9_132 = _UPVALUE1_
    L10_133 = A0_123["Wan.IpAddr"]
    L11_134 = _UPVALUE2_
    L8_131 = L8_131(L9_132, L10_133, L11_134)
    L9_132 = _UPVALUE3_
    L9_132 = L9_132.SUCCESS
    if L8_131 == L9_132 then
      L8_131 = printCLIError
      L9_132 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
      L8_131(L9_132)
      L8_131 = false
      return L8_131
    end
    L8_131 = A0_123["Wan.SnetMask"]
    if L8_131 ~= "" then
      L8_131 = A0_123["Wan.SnetMask"]
      if L8_131 ~= nil then
        L8_131 = A0_123["Wan.SnetMask"]
        if L8_131 ~= nil then
          L8_131 = A0_123["Wan.SnetMask"]
        end
      end
    elseif L8_131 == "0.0.0.0" then
      L8_131 = printCLIError
      L9_132 = "Enter valid subnet mask\n"
      L8_131(L9_132)
      L8_131 = false
      return L8_131
    end
    L8_131 = _UPVALUE0_
    L8_131 = L8_131.checkSubnetMask
    L9_132 = A0_123["Wan.SnetMask"]
    L8_131 = L8_131(L9_132)
    L9_132 = _UPVALUE3_
    L9_132 = L9_132.FAILURE
    if L8_131 == L9_132 then
      L8_131 = printCLIError
      L9_132 = "Please enter valid subnet Mask"
      L8_131(L9_132)
      L8_131 = false
      return L8_131
    end
    L8_131 = A0_123["Wan.IpAddr"]
    L9_132 = A0_123["Wan.SnetMask"]
    L10_133 = nimf_lanvlandmzsslclientsubnetRange
    L11_134 = L8_131
    L11_134 = L10_133(L11_134, L9_132)
    if L10_133 == 1 then
      printCLIError(L11_134)
      return false
    end
    valid = _UPVALUE0_.checkOpenVpnSubnetRange(L8_131, L9_132)
    if valid == _UPVALUE3_.SUCCESS then
      printCLIError("OpenVPN Network/OpenVPN Remote Network is already " .. "configured in same subnet. Please specify IP address in " .. "different subnet.")
      return false
    end
    if A0_123["Wan.GwIpAddr"] == "" or A0_123["Wan.GwIpAddr"] == nil or A0_123["Wan.GwIpAddr"] ~= nil and A0_123["Wan.GwIpAddr"] == "0.0.0.0" then
      printCLIError("Enter valid gateway Address\n")
      return false
    end
    if _UPVALUE0_.ipv4SingleMaskCheck(A0_123["Wan.IpAddr"], A0_123["Wan.GwIpAddr"], A0_123["Wan.SnetMask"]) ~= _UPVALUE3_.SUCCESS then
      printCLIError("DEFAULT Gateway IP should be in same subnet.")
      return false
    end
    if _UPVALUE0_.ipv4SingleMaskCheck(_UPVALUE1_, A0_123["Wan.GwIpAddr"], _UPVALUE2_) == _UPVALUE3_.SUCCESS then
      printCLIError("Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet.")
      return false
    end
    if A0_123["Wan.PriDnsIpAddr"] == "" or A0_123["Wan.PriDnsIpAddr"] == nil or A0_123["Wan.PriDnsIpAddr"] ~= nil and A0_123["Wan.PriDnsIpAddr"] == "0.0.0.0" then
      printCLIError("Enter valid primary dns address\n")
      return false
    end
    L7_130 = util.split(A0_123["Wan.PriDnsIpAddr"], ".")
    if tonumber(L7_130[1]) == 224 or tonumber(L7_130[1]) > 224 then
      printCLIError("Invalid IP address. Please enter a value between 1 - 223 for octet 1")
      return false
    end
    if _UPVALUE0_.ipv4SingleMaskCheck(_UPVALUE1_, A0_123["Wan.PriDnsIpAddr"], _UPVALUE2_) == _UPVALUE3_.SUCCESS then
      printCLIError("Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet.")
      return false
    end
    if A0_123["Wan.SecDnsIpAddr"] == "" or A0_123["Wan.SecDnsIpAddr"] == nil or A0_123["Wan.SecDnsIpAddr"] ~= nil and A0_123["Wan.SecDnsIpAddr"] == "0.0.0.0" then
      printCLIError("Enter valid secondary dns address\n")
      return false
    end
    L7_130 = util.split(A0_123["Wan.SecDnsIpAddr"], ".")
    if tonumber(L7_130[1]) == 224 or tonumber(L7_130[1]) > 224 then
      printCLIError("Invalid IP address. Please enter a value between 1 - 223 for octet 1")
      return false
    end
    if _UPVALUE0_.ipv4SingleMaskCheck(_UPVALUE1_, A0_123["Wan.SecDnsIpAddr"], _UPVALUE2_) == _UPVALUE3_.SUCCESS then
      printCLIError("Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet.")
      return false
    end
    valid = _UPVALUE0_.checkOpenVpnSubnetRange(A0_123["Wan.IpAddr"], A0_123["Wan.SnetMask"])
    if valid == _UPVALUE3_.SUCCESS then
      printCLIError("OpenVPN Network/OpenVPN Remote Network is already configured in same subnet, Please specify IP Address in a different subnet.")
      return false
    end
    return true
  end
  L7_130 = A0_123["Wan.IspType"]
  if L7_130 == "0" then
    A0_123["Wan.MppeEncryptSupport"] = "0"
    A0_123["Wan.SplitTunnel"] = "0"
    L7_130 = A0_123["Wan.IsDNSDyn"]
    if L7_130 == "0" then
      L7_130 = A0_123["Wan.PriDnsIpAddr"]
      if L7_130 ~= "" then
        L7_130 = A0_123["Wan.PriDnsIpAddr"]
        if L7_130 ~= nil then
          L7_130 = A0_123["Wan.PriDnsIpAddr"]
          if L7_130 ~= nil then
            L7_130 = A0_123["Wan.PriDnsIpAddr"]
          end
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Enter valid primary dns address\n"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = util
      L7_130 = L7_130.split
      L8_131 = A0_123["Wan.PriDnsIpAddr"]
      L9_132 = "."
      L7_130 = L7_130(L8_131, L9_132)
      Octet = L7_130
      L7_130 = tonumber
      L8_131 = Octet
      L8_131 = L8_131[1]
      L7_130 = L7_130(L8_131)
      if L7_130 ~= 224 then
        L7_130 = tonumber
        L8_131 = Octet
        L8_131 = L8_131[1]
        L7_130 = L7_130(L8_131)
      elseif L7_130 > 224 then
        L7_130 = printCLIError
        L8_131 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.PriDnsIpAddr"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = A0_123["Wan.SecDnsIpAddr"]
      if L7_130 ~= "" then
        L7_130 = A0_123["Wan.SecDnsIpAddr"]
        if L7_130 ~= nil then
          L7_130 = A0_123["Wan.SecDnsIpAddr"]
          if L7_130 ~= nil then
            L7_130 = A0_123["Wan.SecDnsIpAddr"]
          end
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Enter valid secondary dns address\n"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = util
      L7_130 = L7_130.split
      L8_131 = A0_123["Wan.SecDnsIpAddr"]
      L9_132 = "."
      L7_130 = L7_130(L8_131, L9_132)
      Octet = L7_130
      L7_130 = tonumber
      L8_131 = Octet
      L8_131 = L8_131[1]
      L7_130 = L7_130(L8_131)
      if L7_130 ~= 224 then
        L7_130 = tonumber
        L8_131 = Octet
        L8_131 = L8_131[1]
        L7_130 = L7_130(L8_131)
      elseif L7_130 > 224 then
        L7_130 = printCLIError
        L8_131 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.SecDnsIpAddr"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
    end
    L7_130 = A0_123["Wan.UseMac"]
    if L7_130 == "2" then
      L7_130 = A0_123["Wan.MacAddr"]
      if L7_130 ~= "" then
        L7_130 = A0_123["Wan.MacAddr"]
      elseif L7_130 == nil then
        L7_130 = printCLIError
        L8_131 = "Enter valid mac address\n"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
    end
    L7_130 = true
    return L7_130
  end
  L7_130 = A0_123["Wan.IspType"]
  if L7_130 == "2" then
    A0_123["NimfConf.RequireLogin"] = "1"
    L7_130 = A0_123["Wan.IsDNSDyn"]
    if L7_130 == "0" then
      L7_130 = A0_123["Wan.PriDnsIpAddr"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.PriDnsIpAddr"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.PriDnsIpAddr"]
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Primary DNS Server"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = util
      L7_130 = L7_130.split
      L8_131 = A0_123["Wan.PriDnsIpAddr"]
      L9_132 = "."
      L7_130 = L7_130(L8_131, L9_132)
      Octet = L7_130
      L7_130 = tonumber
      L8_131 = Octet
      L8_131 = L8_131[1]
      L7_130 = L7_130(L8_131)
      if L7_130 ~= 224 then
        L7_130 = tonumber
        L8_131 = Octet
        L8_131 = L8_131[1]
        L7_130 = L7_130(L8_131)
      elseif L7_130 > 224 then
        L7_130 = printCLIError
        L8_131 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.PriDnsIpAddr"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = A0_123["Wan.SecDnsIpAddr"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.SecDnsIpAddr"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.SecDnsIpAddr"]
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Secondary DNS Server"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = util
      L7_130 = L7_130.split
      L8_131 = A0_123["Wan.SecDnsIpAddr"]
      L9_132 = "."
      L7_130 = L7_130(L8_131, L9_132)
      Octet = L7_130
      L7_130 = tonumber
      L8_131 = Octet
      L8_131 = L8_131[1]
      L7_130 = L7_130(L8_131)
      if L7_130 ~= 224 then
        L7_130 = tonumber
        L8_131 = Octet
        L8_131 = L8_131[1]
        L7_130 = L7_130(L8_131)
      elseif L7_130 > 224 then
        L7_130 = printCLIError
        L8_131 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.SecDnsIpAddr"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
    end
    L7_130 = A0_123["Wan.UserName"]
    if L7_130 ~= nil then
      L7_130 = A0_123["Wan.UserName"]
      if L7_130 ~= "" then
        L7_130 = A0_123["Wan.Password"]
        if L7_130 ~= nil then
          L7_130 = A0_123["Wan.Password"]
        end
      end
    elseif L7_130 == "" then
      L7_130 = printCLIError
      L8_131 = "Invalid username/password\n"
      L7_130(L8_131)
      L7_130 = false
      return L7_130
    end
    L7_130 = A0_123["Wan.PppoeIdleTimeOutFlag"]
    if L7_130 == "1" then
      L7_130 = A0_123["Wan.PppoeIdleTimeOutValue"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.PppoeIdleTimeOutValue"]
      elseif L7_130 == "" then
        L7_130 = printCLIError
        L8_131 = "Enter valid idle timeout value\n"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
    end
    L7_130 = A0_123["Wan.PIsGetIpDyn"]
    if L7_130 == "0" then
      L7_130 = A0_123["Wan.PIpAddr"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.PIpAddr"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.PIpAddr"]
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Static Ip"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = util
      L7_130 = L7_130.split
      L8_131 = A0_123["Wan.PIpAddr"]
      L9_132 = "."
      L7_130 = L7_130(L8_131, L9_132)
      Octet = L7_130
      L7_130 = tonumber
      L8_131 = Octet
      L8_131 = L8_131[1]
      L7_130 = L7_130(L8_131)
      if L7_130 ~= 224 then
        L7_130 = tonumber
        L8_131 = Octet
        L8_131 = L8_131[1]
        L7_130 = L7_130(L8_131)
      elseif L7_130 > 224 then
        L7_130 = printCLIError
        L8_131 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.PIpAddr"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = A0_123["Wan.PSnetMask"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.PSnetMask"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.PSnetMask"]
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Subnet mask"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.checkOpenVpnSubnetRange
      L8_131 = A0_123["Wan.PIpAddr"]
      L9_132 = A0_123["Wan.PSnetMask"]
      L7_130 = L7_130(L8_131, L9_132)
      valid = L7_130
      L7_130 = valid
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "OpenVPN Network/OpenVPN Remote Network is already configured in same subnet, Please specify IP Address in a different subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
    end
    L7_130 = true
    return L7_130
  end
  L7_130 = A0_123["Wan.IspType"]
  if L7_130 == "3" then
    A0_123["NimfConf.RequireLogin"] = "1"
    L7_130 = A0_123["Wan.LoginName"]
    if L7_130 ~= nil then
      L7_130 = A0_123["Wan.LoginName"]
      if L7_130 ~= "" then
        L7_130 = A0_123["Wan.LoginPassword"]
        if L7_130 ~= nil then
          L7_130 = A0_123["Wan.LoginPassword"]
        end
      end
    elseif L7_130 == "" then
      L7_130 = printCLIError
      L8_131 = "Invalid username/password\n"
      L7_130(L8_131)
      L7_130 = false
      return L7_130
    end
    L7_130 = A0_123["Wan.IdleTimeOutFlag"]
    if L7_130 == "1" then
      L7_130 = A0_123["Wan.IdleTime"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.IdleTime"]
      elseif L7_130 == "" then
        L7_130 = printCLIError
        L8_131 = "Enter valid idle timeout value\n"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
    end
    L7_130 = A0_123["Wan.SvrIpAddr"]
    if L7_130 ~= "" then
      L7_130 = A0_123["Wan.SvrIpAddr"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.SvrIpAddr"]
        if L7_130 == "0.0.0.0" then
          L7_130 = A0_123["Wan.SvrIpAddr"]
        end
      end
    elseif L7_130 ~= nil then
      L7_130 = printCLIError
      L8_131 = "Enter valid IP address of the PPTP server\n"
      L7_130(L8_131)
      L7_130 = false
      return L7_130
    end
    L7_130 = validationsLuaLib
    L7_130 = L7_130.domainNameValidation
    L8_131 = A0_123["Wan.SvrIpAddr"]
    L8_131 = L7_130(L8_131)
    L9_132 = tonumber
    L10_133 = L7_130
    L9_132 = L9_132(L10_133)
    if L9_132 ~= 0 then
      L9_132 = printCLIError
      L10_133 = L8_131
      L9_132(L10_133)
      L9_132 = false
      return L9_132
    end
    L9_132 = A0_123["Wan.IsDNSDyn"]
    if L9_132 == "0" then
      L9_132 = A0_123["Wan.PriDnsIpAddr"]
      if L9_132 ~= "" then
        L9_132 = A0_123["Wan.PriDnsIpAddr"]
        if L9_132 ~= nil then
          L9_132 = A0_123["Wan.PriDnsIpAddr"]
          if L9_132 ~= nil then
            L9_132 = A0_123["Wan.PriDnsIpAddr"]
          end
        end
      elseif L9_132 == "0.0.0.0" then
        L9_132 = printCLIError
        L10_133 = "Enter valid primary dns address\n"
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = util
      L9_132 = L9_132.split
      L10_133 = A0_123["Wan.PriDnsIpAddr"]
      L11_134 = "."
      L9_132 = L9_132(L10_133, L11_134)
      Octet = L9_132
      L9_132 = tonumber
      L10_133 = Octet
      L10_133 = L10_133[1]
      L9_132 = L9_132(L10_133)
      if L9_132 ~= 224 then
        L9_132 = tonumber
        L10_133 = Octet
        L10_133 = L10_133[1]
        L9_132 = L9_132(L10_133)
      elseif L9_132 > 224 then
        L9_132 = printCLIError
        L10_133 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = _UPVALUE0_
      L9_132 = L9_132.ipv4SingleMaskCheck
      L10_133 = _UPVALUE1_
      L11_134 = A0_123["Wan.PriDnsIpAddr"]
      L9_132 = L9_132(L10_133, L11_134, _UPVALUE2_)
      L10_133 = _UPVALUE3_
      L10_133 = L10_133.SUCCESS
      if L9_132 == L10_133 then
        L9_132 = printCLIError
        L10_133 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = A0_123["Wan.SecDnsIpAddr"]
      if L9_132 ~= nil then
        L9_132 = A0_123["Wan.SecDnsIpAddr"]
      else
        if L9_132 ~= "0.0.0.0" then
          L9_132 = A0_123["Wan.SecDnsIpAddr"]
          if L9_132 ~= nil then
            L9_132 = A0_123["Wan.SecDnsIpAddr"]
          end
      end
      elseif L9_132 == "" then
        L9_132 = printCLIError
        L10_133 = "Enter valid secondary dns address\n"
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = util
      L9_132 = L9_132.split
      L10_133 = A0_123["Wan.SecDnsIpAddr"]
      L11_134 = "."
      L9_132 = L9_132(L10_133, L11_134)
      Octet = L9_132
      L9_132 = tonumber
      L10_133 = Octet
      L10_133 = L10_133[1]
      L9_132 = L9_132(L10_133)
      if L9_132 ~= 224 then
        L9_132 = tonumber
        L10_133 = Octet
        L10_133 = L10_133[1]
        L9_132 = L9_132(L10_133)
      elseif L9_132 > 224 then
        L9_132 = printCLIError
        L10_133 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = _UPVALUE0_
      L9_132 = L9_132.ipv4SingleMaskCheck
      L10_133 = _UPVALUE1_
      L11_134 = A0_123["Wan.SecDnsIpAddr"]
      L9_132 = L9_132(L10_133, L11_134, _UPVALUE2_)
      L10_133 = _UPVALUE3_
      L10_133 = L10_133.SUCCESS
      if L9_132 == L10_133 then
        L9_132 = printCLIError
        L10_133 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
    end
    L9_132 = A0_123["Wan.IsGetIpDyn"]
    if L9_132 == "0" then
      L9_132 = A0_123["Wan.IpAddr"]
      if L9_132 ~= nil then
        L9_132 = A0_123["Wan.IpAddr"]
        if L9_132 ~= "" then
          L9_132 = A0_123["Wan.IpAddr"]
          if L9_132 ~= nil then
            L9_132 = A0_123["Wan.IpAddr"]
          end
        end
      elseif L9_132 == "0.0.0.0" then
        L9_132 = printCLIError
        L10_133 = "Give Static Ip"
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = util
      L9_132 = L9_132.split
      L10_133 = A0_123["Wan.IpAddr"]
      L11_134 = "."
      L9_132 = L9_132(L10_133, L11_134)
      Octet = L9_132
      L9_132 = tonumber
      L10_133 = Octet
      L10_133 = L10_133[1]
      L9_132 = L9_132(L10_133)
      if L9_132 ~= 224 then
        L9_132 = tonumber
        L10_133 = Octet
        L10_133 = L10_133[1]
        L9_132 = L9_132(L10_133)
      elseif L9_132 > 224 then
        L9_132 = printCLIError
        L10_133 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = _UPVALUE0_
      L9_132 = L9_132.ipv4SingleMaskCheck
      L10_133 = _UPVALUE1_
      L11_134 = A0_123["Wan.IpAddr"]
      L9_132 = L9_132(L10_133, L11_134, _UPVALUE2_)
      L10_133 = _UPVALUE3_
      L10_133 = L10_133.SUCCESS
      if L9_132 == L10_133 then
        L9_132 = printCLIError
        L10_133 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = A0_123["Wan.SnetMask"]
      if L9_132 ~= nil then
        L9_132 = A0_123["Wan.SnetMask"]
        if L9_132 ~= "" then
          L9_132 = A0_123["Wan.SnetMask"]
          if L9_132 ~= nil then
            L9_132 = A0_123["Wan.SnetMask"]
          end
        end
      elseif L9_132 == "0.0.0.0" then
        L9_132 = printCLIError
        L10_133 = "Give Subnet mask"
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = A0_123["Wan.Gateway"]
      if L9_132 ~= nil then
        L9_132 = A0_123["Wan.Gateway"]
      else
        if L9_132 ~= "0.0.0.0" then
          L9_132 = A0_123["Wan.Gateway"]
          if L9_132 ~= nil then
            L9_132 = A0_123["Wan.Gateway"]
          end
      end
      elseif L9_132 == "" then
        L9_132 = printCLIError
        L10_133 = "Give Gateway"
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = _UPVALUE0_
      L9_132 = L9_132.ipv4SingleMaskCheck
      L10_133 = A0_123["Wan.IpAddr"]
      L11_134 = A0_123["Wan.Gateway"]
      L9_132 = L9_132(L10_133, L11_134, A0_123["Wan.SnetMask"])
      L10_133 = _UPVALUE3_
      L10_133 = L10_133.SUCCESS
      if L9_132 ~= L10_133 then
        L9_132 = printCLIError
        L10_133 = "DEFAULT Gateway IP should be in same subnet."
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = _UPVALUE0_
      L9_132 = L9_132.ipv4SingleMaskCheck
      L10_133 = _UPVALUE1_
      L11_134 = A0_123["Wan.Gateway"]
      L9_132 = L9_132(L10_133, L11_134, _UPVALUE2_)
      L10_133 = _UPVALUE3_
      L10_133 = L10_133.SUCCESS
      if L9_132 == L10_133 then
        L9_132 = printCLIError
        L10_133 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = _UPVALUE0_
      L9_132 = L9_132.checkIpv4Address
      L10_133 = A0_123["Wan.SvrIpAddr"]
      L9_132 = L9_132(L10_133)
      if L9_132 ~= true then
        L9_132 = A0_123["Wan.StaticDNS"]
        if L9_132 ~= nil then
          L9_132 = A0_123["Wan.StaticDNS"]
        else
          if L9_132 ~= "0.0.0.0" then
            L9_132 = A0_123["Wan.StaticDNS"]
            if L9_132 ~= nil then
              L9_132 = A0_123["Wan.StaticDNS"]
            end
        end
        elseif L9_132 == "" then
          L9_132 = printCLIError
          L10_133 = "Please Configure Static DNS IP."
          L9_132(L10_133)
          L9_132 = false
          return L9_132
        end
        L9_132 = _UPVALUE0_
        L9_132 = L9_132.checkIpv4Address
        L10_133 = A0_123["Wan.StaticDNS"]
        L9_132 = L9_132(L10_133)
        if L9_132 ~= true then
          L9_132 = printCLIError
          L10_133 = "Static DNS IP Address is Invalid. Octet 1 should "
          L11_134 = "be in 1-223 and Octet 4 should be in 1-254 range."
          L10_133 = L10_133 .. L11_134
          L9_132(L10_133)
          L9_132 = false
          return L9_132
        end
      end
    end
    L9_132 = _UPVALUE0_
    L9_132 = L9_132.checkOpenVpnSubnetRange
    L10_133 = A0_123["Wan.IpAddr"]
    L11_134 = A0_123["Wan.SnetMask"]
    L9_132 = L9_132(L10_133, L11_134)
    valid = L9_132
    L9_132 = valid
    L10_133 = _UPVALUE3_
    L10_133 = L10_133.SUCCESS
    if L9_132 == L10_133 then
      L9_132 = printCLIError
      L10_133 = "OpenVPN Network/OpenVPN Remote Network is already configured in same subnet, Please specify IP Address in a different subnet."
      L9_132(L10_133)
      L9_132 = false
      return L9_132
    end
    L9_132 = true
    return L9_132
  end
  L7_130 = A0_123["Wan.IspType"]
  if L7_130 == "4" then
    A0_123["NimfConf.RequireLogin"] = "1"
    A0_123["Wan.MppeEncryptSupport"] = "0"
    L7_130 = A0_123["Wan.LoginName"]
    if L7_130 ~= nil then
      L7_130 = A0_123["Wan.LoginName"]
      if L7_130 ~= "" then
        L7_130 = A0_123["Wan.LoginPassword"]
        if L7_130 ~= nil then
          L7_130 = A0_123["Wan.LoginPassword"]
        end
      end
    elseif L7_130 == "" then
      L7_130 = printCLIError
      L8_131 = "Invalid username/password\n"
      L7_130(L8_131)
      L7_130 = false
      return L7_130
    end
    L7_130 = A0_123["Wan.IdleTimeOutFlag"]
    if L7_130 == "1" then
      L7_130 = A0_123["Wan.IdleTime"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.IdleTime"]
      elseif L7_130 == "" then
        L7_130 = printCLIError
        L8_131 = "Enter valid idle timeout value\n"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
    end
    L7_130 = A0_123["Wan.SvrIpAddr"]
    if L7_130 ~= "" then
      L7_130 = A0_123["Wan.SvrIpAddr"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.SvrIpAddr"]
        if L7_130 == "0.0.0.0" then
          L7_130 = A0_123["Wan.SvrIpAddr"]
        end
      end
    elseif L7_130 ~= nil then
      L7_130 = printCLIError
      L8_131 = "Enter valid IP address of the L2TP server\n"
      L7_130(L8_131)
      L7_130 = false
      return L7_130
    end
    L7_130 = validationsLuaLib
    L7_130 = L7_130.domainNameValidation
    L8_131 = A0_123["Wan.SvrIpAddr"]
    L8_131 = L7_130(L8_131)
    L9_132 = tonumber
    L10_133 = L7_130
    L9_132 = L9_132(L10_133)
    if L9_132 ~= 0 then
      L9_132 = printCLIError
      L10_133 = L8_131
      L9_132(L10_133)
      L9_132 = false
      return L9_132
    end
    L9_132 = A0_123["Wan.IsDNSDyn"]
    if L9_132 == "0" then
      L9_132 = A0_123["Wan.PriDnsIpAddr"]
      if L9_132 ~= "" then
        L9_132 = A0_123["Wan.PriDnsIpAddr"]
        if L9_132 ~= nil then
          L9_132 = A0_123["Wan.PriDnsIpAddr"]
          if L9_132 ~= nil then
            L9_132 = A0_123["Wan.PriDnsIpAddr"]
          end
        end
      elseif L9_132 == "0.0.0.0" then
        L9_132 = printCLIError
        L10_133 = "Enter valid primary dns address\n"
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = util
      L9_132 = L9_132.split
      L10_133 = A0_123["Wan.PriDnsIpAddr"]
      L11_134 = "."
      L9_132 = L9_132(L10_133, L11_134)
      Octet = L9_132
      L9_132 = tonumber
      L10_133 = Octet
      L10_133 = L10_133[1]
      L9_132 = L9_132(L10_133)
      if L9_132 ~= 224 then
        L9_132 = tonumber
        L10_133 = Octet
        L10_133 = L10_133[1]
        L9_132 = L9_132(L10_133)
      elseif L9_132 > 224 then
        L9_132 = printCLIError
        L10_133 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = _UPVALUE0_
      L9_132 = L9_132.ipv4SingleMaskCheck
      L10_133 = _UPVALUE1_
      L11_134 = A0_123["Wan.PriDnsIpAddr"]
      L9_132 = L9_132(L10_133, L11_134, _UPVALUE2_)
      L10_133 = _UPVALUE3_
      L10_133 = L10_133.SUCCESS
      if L9_132 == L10_133 then
        L9_132 = printCLIError
        L10_133 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = A0_123["Wan.SecDnsIpAddr"]
      if L9_132 ~= nil then
        L9_132 = A0_123["Wan.SecDnsIpAddr"]
      else
        if L9_132 ~= "0.0.0.0" then
          L9_132 = A0_123["Wan.SecDnsIpAddr"]
          if L9_132 == nil then
            L9_132 = A0_123["Wan.SecDnsIpAddr"]
          end
      end
      elseif L9_132 == "" then
        L9_132 = printCLIError
        L10_133 = "Enter valid secondary dns address\n"
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = util
      L9_132 = L9_132.split
      L10_133 = A0_123["Wan.SecDnsIpAddr"]
      L11_134 = "."
      L9_132 = L9_132(L10_133, L11_134)
      Octet = L9_132
      L9_132 = tonumber
      L10_133 = Octet
      L10_133 = L10_133[1]
      L9_132 = L9_132(L10_133)
      if L9_132 ~= 224 then
        L9_132 = tonumber
        L10_133 = Octet
        L10_133 = L10_133[1]
        L9_132 = L9_132(L10_133)
      elseif L9_132 > 224 then
        L9_132 = printCLIError
        L10_133 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = _UPVALUE0_
      L9_132 = L9_132.ipv4SingleMaskCheck
      L10_133 = _UPVALUE1_
      L11_134 = A0_123["Wan.SecDnsIpAddr"]
      L9_132 = L9_132(L10_133, L11_134, _UPVALUE2_)
      L10_133 = _UPVALUE3_
      L10_133 = L10_133.SUCCESS
      if L9_132 == L10_133 then
        L9_132 = printCLIError
        L10_133 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
    end
    L9_132 = A0_123["Wan.IsGetIpDyn"]
    if L9_132 == "0" then
      L9_132 = A0_123["Wan.IpAddr"]
      if L9_132 ~= nil then
        L9_132 = A0_123["Wan.IpAddr"]
        if L9_132 ~= "" then
          L9_132 = A0_123["Wan.IpAddr"]
          if L9_132 ~= nil then
            L9_132 = A0_123["Wan.IpAddr"]
          end
        end
      elseif L9_132 == "0.0.0.0" then
        L9_132 = printCLIError
        L10_133 = "Give Static Ip"
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = util
      L9_132 = L9_132.split
      L10_133 = A0_123["Wan.IpAddr"]
      L11_134 = "."
      L9_132 = L9_132(L10_133, L11_134)
      Octet = L9_132
      L9_132 = tonumber
      L10_133 = Octet
      L10_133 = L10_133[1]
      L9_132 = L9_132(L10_133)
      if L9_132 ~= 224 then
        L9_132 = tonumber
        L10_133 = Octet
        L10_133 = L10_133[1]
        L9_132 = L9_132(L10_133)
      elseif L9_132 > 224 then
        L9_132 = printCLIError
        L10_133 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = _UPVALUE0_
      L9_132 = L9_132.ipv4SingleMaskCheck
      L10_133 = _UPVALUE1_
      L11_134 = A0_123["Wan.IpAddr"]
      L9_132 = L9_132(L10_133, L11_134, _UPVALUE2_)
      L10_133 = _UPVALUE3_
      L10_133 = L10_133.SUCCESS
      if L9_132 == L10_133 then
        L9_132 = printCLIError
        L10_133 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = A0_123["Wan.SnetMask"]
      if L9_132 ~= nil then
        L9_132 = A0_123["Wan.SnetMask"]
        if L9_132 ~= "" then
          L9_132 = A0_123["Wan.SnetMask"]
          if L9_132 ~= nil then
            L9_132 = A0_123["Wan.SnetMask"]
          end
        end
      elseif L9_132 == "0.0.0.0" then
        L9_132 = printCLIError
        L10_133 = "Give Subnet mask"
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = A0_123["Wan.Gateway"]
      if L9_132 ~= nil then
        L9_132 = A0_123["Wan.Gateway"]
      else
        if L9_132 ~= "0.0.0.0" then
          L9_132 = A0_123["Wan.Gateway"]
          if L9_132 ~= nil then
            L9_132 = A0_123["Wan.Gateway"]
          end
      end
      elseif L9_132 == "" then
        L9_132 = printCLIError
        L10_133 = "Give Gateway"
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = _UPVALUE0_
      L9_132 = L9_132.ipv4SingleMaskCheck
      L10_133 = A0_123["Wan.IpAddr"]
      L11_134 = A0_123["Wan.Gateway"]
      L9_132 = L9_132(L10_133, L11_134, A0_123["Wan.SnetMask"])
      L10_133 = _UPVALUE3_
      L10_133 = L10_133.SUCCESS
      if L9_132 ~= L10_133 then
        L9_132 = printCLIError
        L10_133 = "DEFAULT Gateway IP should be in same subnet."
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = _UPVALUE0_
      L9_132 = L9_132.ipv4SingleMaskCheck
      L10_133 = _UPVALUE1_
      L11_134 = A0_123["Wan.Gateway"]
      L9_132 = L9_132(L10_133, L11_134, _UPVALUE2_)
      L10_133 = _UPVALUE3_
      L10_133 = L10_133.SUCCESS
      if L9_132 == L10_133 then
        L9_132 = printCLIError
        L10_133 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = _UPVALUE0_
      L9_132 = L9_132.checkIpv4Address
      L10_133 = A0_123["Wan.SvrIpAddr"]
      L9_132 = L9_132(L10_133)
      if L9_132 ~= true then
        L9_132 = A0_123["Wan.StaticDNS"]
        if L9_132 ~= nil then
          L9_132 = A0_123["Wan.StaticDNS"]
        else
          if L9_132 ~= "0.0.0.0" then
            L9_132 = A0_123["Wan.StaticDNS"]
            if L9_132 ~= nil then
              L9_132 = A0_123["Wan.StaticDNS"]
            end
        end
        elseif L9_132 == "" then
          L9_132 = printCLIError
          L10_133 = "Please Configure Static DNS IP."
          L9_132(L10_133)
          L9_132 = false
          return L9_132
        end
        L9_132 = _UPVALUE0_
        L9_132 = L9_132.checkIpv4Address
        L10_133 = A0_123["Wan.StaticDNS"]
        L9_132 = L9_132(L10_133)
        if L9_132 ~= true then
          L9_132 = printCLIError
          L10_133 = "Static DNS IP Address is Invalid. Octet 1 should "
          L11_134 = "be in 1-223 and Octet 4 should be in 1-254 range."
          L10_133 = L10_133 .. L11_134
          L9_132(L10_133)
          L9_132 = false
          return L9_132
        end
      end
    end
    L9_132 = _UPVALUE0_
    L9_132 = L9_132.checkOpenVpnSubnetRange
    L10_133 = A0_123["Wan.IpAddr"]
    L11_134 = A0_123["Wan.SnetMask"]
    L9_132 = L9_132(L10_133, L11_134)
    valid = L9_132
    L9_132 = valid
    L10_133 = _UPVALUE3_
    L10_133 = L10_133.SUCCESS
    if L9_132 == L10_133 then
      L9_132 = printCLIError
      L10_133 = "OpenVPN Network/OpenVPN Remote Network is already configured in same subnet, Please specify IP Address in a different subnet."
      L9_132(L10_133)
      L9_132 = false
      return L9_132
    end
    L9_132 = true
    return L9_132
  end
  L7_130 = A0_123["Wan.IspType"]
  if L7_130 == "5" then
    A0_123["NimfConf.RequireLogin"] = "1"
    L7_130 = A0_123["Wan.LoginName"]
    if L7_130 ~= nil then
      L7_130 = A0_123["Wan.LoginName"]
      if L7_130 ~= "" then
        L7_130 = A0_123["Wan.LoginPassword"]
        if L7_130 ~= nil then
          L7_130 = A0_123["Wan.LoginPassword"]
        end
      end
    elseif L7_130 == "" then
      L7_130 = printCLIError
      L8_131 = "Invalid username/password\n"
      L7_130(L8_131)
      L7_130 = false
      return L7_130
    end
    L7_130 = A0_123["Wan.IdleTimeOutFlag"]
    if L7_130 == "1" then
      L7_130 = A0_123["Wan.IdleTime"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.IdleTime"]
      elseif L7_130 == "" then
        L7_130 = printCLIError
        L8_131 = "Enter valid idle timeout value\n"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
    end
    L7_130 = A0_123["Wan.IsGetIpDyn"]
    if L7_130 == "0" then
      L7_130 = A0_123["Wan.IpAddr"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.IpAddr"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.IpAddr"]
          if L7_130 ~= nil then
            L7_130 = A0_123["Wan.IpAddr"]
          end
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Static Ip"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = util
      L7_130 = L7_130.split
      L8_131 = A0_123["Wan.IpAddr"]
      L9_132 = "."
      L7_130 = L7_130(L8_131, L9_132)
      Octet = L7_130
      L7_130 = tonumber
      L8_131 = Octet
      L8_131 = L8_131[1]
      L7_130 = L7_130(L8_131)
      if L7_130 ~= 224 then
        L7_130 = tonumber
        L8_131 = Octet
        L8_131 = L8_131[1]
        L7_130 = L7_130(L8_131)
      elseif L7_130 > 224 then
        L7_130 = printCLIError
        L8_131 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.IpAddr"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = A0_123["Wan.SnetMask"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.SnetMask"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.SnetMask"]
          if L7_130 ~= nil then
            L7_130 = A0_123["Wan.SnetMask"]
          end
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Subnet mask"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = A0_123["Wan.Gateway"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.Gateway"]
      else
        if L7_130 ~= "0.0.0.0" then
          L7_130 = A0_123["Wan.Gateway"]
          if L7_130 ~= nil then
            L7_130 = A0_123["Wan.Gateway"]
          end
      end
      elseif L7_130 == "" then
        L7_130 = printCLIError
        L8_131 = "Give Gateway"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = A0_123["Wan.IpAddr"]
      L9_132 = A0_123["Wan.Gateway"]
      L10_133 = A0_123["Wan.SnetMask"]
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 ~= L8_131 then
        L7_130 = printCLIError
        L8_131 = "DEFAULT Gateway IP should be in same subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.Gateway"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.checkIpv4Address
      L8_131 = A0_123["Wan.SvrIpAddr"]
      L7_130 = L7_130(L8_131)
      if L7_130 ~= true then
        L7_130 = A0_123["Wan.StaticDNS"]
        if L7_130 ~= nil then
          L7_130 = A0_123["Wan.StaticDNS"]
        else
          if L7_130 ~= "0.0.0.0" then
            L7_130 = A0_123["Wan.StaticDNS"]
            if L7_130 ~= nil then
              L7_130 = A0_123["Wan.StaticDNS"]
            end
        end
        elseif L7_130 == "" then
          L7_130 = printCLIError
          L8_131 = "Please Configure Static DNS IP."
          L7_130(L8_131)
          L7_130 = false
          return L7_130
        end
        L7_130 = _UPVALUE0_
        L7_130 = L7_130.checkIpv4Address
        L8_131 = A0_123["Wan.StaticDNS"]
        L7_130 = L7_130(L8_131)
        if L7_130 ~= true then
          L7_130 = printCLIError
          L8_131 = "Static DNS IP Address is Invalid. Octet 1 should "
          L9_132 = "be in 1-223 and Octet 4 should be in 1-254 range."
          L8_131 = L8_131 .. L9_132
          L7_130(L8_131)
          L7_130 = false
          return L7_130
        end
      end
    end
    L7_130 = A0_123["Wan.SvrIpAddr"]
    if L7_130 ~= "" then
      L7_130 = A0_123["Wan.SvrIpAddr"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.SvrIpAddr"]
        if L7_130 == "0.0.0.0" then
          L7_130 = A0_123["Wan.SvrIpAddr"]
        end
      end
    elseif L7_130 ~= nil then
      L7_130 = printCLIError
      L8_131 = "Enter valid IP address of server\n"
      L7_130(L8_131)
      L7_130 = false
      return L7_130
    end
    L7_130 = validationsLuaLib
    L7_130 = L7_130.domainNameValidation
    L8_131 = A0_123["Wan.SvrIpAddr"]
    L8_131 = L7_130(L8_131)
    L9_132 = tonumber
    L10_133 = L7_130
    L9_132 = L9_132(L10_133)
    if L9_132 ~= 0 then
      L9_132 = printCLIError
      L10_133 = L8_131
      L9_132(L10_133)
      L9_132 = false
      return L9_132
    end
    L9_132 = A0_123["Wan.IsDNSDyn"]
    if L9_132 == "0" then
      L9_132 = A0_123["Wan.PriDnsIpAddr"]
      if L9_132 ~= nil then
        L9_132 = A0_123["Wan.PriDnsIpAddr"]
        if L9_132 ~= "" then
          L9_132 = A0_123["Wan.PriDnsIpAddr"]
          if L9_132 ~= nil then
            L9_132 = A0_123["Wan.PriDnsIpAddr"]
          end
        end
      elseif L9_132 == "0.0.0.0" then
        L9_132 = printCLIError
        L10_133 = "Give Primary DNS Server"
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = util
      L9_132 = L9_132.split
      L10_133 = A0_123["Wan.PriDnsIpAddr"]
      L11_134 = "."
      L9_132 = L9_132(L10_133, L11_134)
      Octet = L9_132
      L9_132 = tonumber
      L10_133 = Octet
      L10_133 = L10_133[1]
      L9_132 = L9_132(L10_133)
      if L9_132 ~= 224 then
        L9_132 = tonumber
        L10_133 = Octet
        L10_133 = L10_133[1]
        L9_132 = L9_132(L10_133)
      elseif L9_132 > 224 then
        L9_132 = printCLIError
        L10_133 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = _UPVALUE0_
      L9_132 = L9_132.ipv4SingleMaskCheck
      L10_133 = _UPVALUE1_
      L11_134 = A0_123["Wan.PriDnsIpAddr"]
      L9_132 = L9_132(L10_133, L11_134, _UPVALUE2_)
      L10_133 = _UPVALUE3_
      L10_133 = L10_133.SUCCESS
      if L9_132 == L10_133 then
        L9_132 = printCLIError
        L10_133 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = A0_123["Wan.SecDnsIpAddr"]
      if L9_132 ~= nil then
        L9_132 = A0_123["Wan.SecDnsIpAddr"]
        if L9_132 ~= "" then
          L9_132 = A0_123["Wan.SecDnsIpAddr"]
          if L9_132 ~= nil then
            L9_132 = A0_123["Wan.SecDnsIpAddr"]
          end
        end
      elseif L9_132 == "0.0.0.0" then
        L9_132 = printCLIError
        L10_133 = "Give Secondary DNS Server"
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = util
      L9_132 = L9_132.split
      L10_133 = A0_123["Wan.SecDnsIpAddr"]
      L11_134 = "."
      L9_132 = L9_132(L10_133, L11_134)
      Octet = L9_132
      L9_132 = tonumber
      L10_133 = Octet
      L10_133 = L10_133[1]
      L9_132 = L9_132(L10_133)
      if L9_132 ~= 224 then
        L9_132 = tonumber
        L10_133 = Octet
        L10_133 = L10_133[1]
        L9_132 = L9_132(L10_133)
      elseif L9_132 > 224 then
        L9_132 = printCLIError
        L10_133 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
      L9_132 = _UPVALUE0_
      L9_132 = L9_132.ipv4SingleMaskCheck
      L10_133 = _UPVALUE1_
      L11_134 = A0_123["Wan.SecDnsIpAddr"]
      L9_132 = L9_132(L10_133, L11_134, _UPVALUE2_)
      L10_133 = _UPVALUE3_
      L10_133 = L10_133.SUCCESS
      if L9_132 == L10_133 then
        L9_132 = printCLIError
        L10_133 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L9_132(L10_133)
        L9_132 = false
        return L9_132
      end
    end
    L9_132 = _UPVALUE0_
    L9_132 = L9_132.checkOpenVpnSubnetRange
    L10_133 = A0_123["Wan.IpAddr"]
    L11_134 = A0_123["Wan.SnetMask"]
    L9_132 = L9_132(L10_133, L11_134)
    valid = L9_132
    L9_132 = valid
    L10_133 = _UPVALUE3_
    L10_133 = L10_133.SUCCESS
    if L9_132 == L10_133 then
      L9_132 = printCLIError
      L10_133 = "OpenVPN Network/OpenVPN Remote Network is already configured in same subnet, Please specify IP Address in a different subnet."
      L9_132(L10_133)
      L9_132 = false
      return L9_132
    end
    L9_132 = true
    return L9_132
  end
  L7_130 = A0_123["Wan.IspType"]
  if L7_130 == "6" then
    A0_123["NimfConf.RequireLogin"] = "1"
    L7_130 = A0_123["Wan.IsDNSDyn"]
    if L7_130 == "0" then
      L7_130 = A0_123["Wan.PriDnsIpAddr"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.PriDnsIpAddr"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.PriDnsIpAddr"]
          if L7_130 ~= nil then
            L7_130 = A0_123["Wan.PriDnsIpAddr"]
          end
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Primary DNS Server"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = util
      L7_130 = L7_130.split
      L8_131 = A0_123["Wan.PriDnsIpAddr"]
      L9_132 = "."
      L7_130 = L7_130(L8_131, L9_132)
      Octet = L7_130
      L7_130 = tonumber
      L8_131 = Octet
      L8_131 = L8_131[1]
      L7_130 = L7_130(L8_131)
      if L7_130 ~= 224 then
        L7_130 = tonumber
        L8_131 = Octet
        L8_131 = L8_131[1]
        L7_130 = L7_130(L8_131)
      elseif L7_130 > 224 then
        L7_130 = printCLIError
        L8_131 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.PriDnsIpAddr"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = A0_123["Wan.SecDnsIpAddr"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.SecDnsIpAddr"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.SecDnsIpAddr"]
          if L7_130 ~= nil then
            L7_130 = A0_123["Wan.SecDnsIpAddr"]
          end
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Secondary DNS Server"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = util
      L7_130 = L7_130.split
      L8_131 = A0_123["Wan.SecDnsIpAddr"]
      L9_132 = "."
      L7_130 = L7_130(L8_131, L9_132)
      Octet = L7_130
      L7_130 = tonumber
      L8_131 = Octet
      L8_131 = L8_131[1]
      L7_130 = L7_130(L8_131)
      if L7_130 ~= 224 then
        L7_130 = tonumber
        L8_131 = Octet
        L8_131 = L8_131[1]
        L7_130 = L7_130(L8_131)
      elseif L7_130 > 224 then
        L7_130 = printCLIError
        L8_131 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.SecDnsIpAddr"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
    end
    L7_130 = A0_123["Wan.LoginName"]
    if L7_130 ~= nil then
      L7_130 = A0_123["Wan.LoginName"]
      if L7_130 ~= "" then
        L7_130 = A0_123["Wan.LoginPassword"]
        if L7_130 ~= nil then
          L7_130 = A0_123["Wan.LoginPassword"]
        end
      end
    elseif L7_130 == "" then
      L7_130 = printCLIError
      L8_131 = "Invalid username/password\n"
      L7_130(L8_131)
      L7_130 = false
      return L7_130
    end
    L7_130 = A0_123["Wan.IsGetIpDyn"]
    if L7_130 == "0" then
      L7_130 = A0_123["Wan.IpAddr"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.IpAddr"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.IpAddr"]
          if L7_130 ~= nil then
            L7_130 = A0_123["Wan.IpAddr"]
          end
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Static Ip"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = util
      L7_130 = L7_130.split
      L8_131 = A0_123["Wan.IpAddr"]
      L9_132 = "."
      L7_130 = L7_130(L8_131, L9_132)
      Octet = L7_130
      L7_130 = tonumber
      L8_131 = Octet
      L8_131 = L8_131[1]
      L7_130 = L7_130(L8_131)
      if L7_130 ~= 224 then
        L7_130 = tonumber
        L8_131 = Octet
        L8_131 = L8_131[1]
        L7_130 = L7_130(L8_131)
      elseif L7_130 > 224 then
        L7_130 = printCLIError
        L8_131 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.IpAddr"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = A0_123["Wan.SnetMask"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.SnetMask"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.SnetMask"]
          if L7_130 ~= nil then
            L7_130 = A0_123["Wan.SnetMask"]
          end
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Subnet mask"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = A0_123["Wan.Gateway"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.Gateway"]
      else
        if L7_130 ~= "0.0.0.0" then
          L7_130 = A0_123["Wan.Gateway"]
          if L7_130 ~= nil then
            L7_130 = A0_123["Wan.Gateway"]
          end
      end
      elseif L7_130 == "" then
        L7_130 = printCLIError
        L8_131 = "Give Gateway"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = A0_123["Wan.IpAddr"]
      L9_132 = A0_123["Wan.Gateway"]
      L10_133 = A0_123["Wan.SnetMask"]
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 ~= L8_131 then
        L7_130 = printCLIError
        L8_131 = "DEFAULT Gateway IP should be in same subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.Gateway"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.checkIpv4Address
      L8_131 = A0_123["Wan.SvrIpAddr"]
      L7_130 = L7_130(L8_131)
      if L7_130 ~= true then
        L7_130 = A0_123["Wan.StaticDNS"]
        if L7_130 ~= nil then
          L7_130 = A0_123["Wan.StaticDNS"]
        else
          if L7_130 ~= "0.0.0.0" then
            L7_130 = A0_123["Wan.StaticDNS"]
            if L7_130 ~= nil then
              L7_130 = A0_123["Wan.StaticDNS"]
            end
        end
        elseif L7_130 == "" then
          L7_130 = printCLIError
          L8_131 = "Please Configure Static DNS IP."
          L7_130(L8_131)
          L7_130 = false
          return L7_130
        end
        L7_130 = _UPVALUE0_
        L7_130 = L7_130.checkIpv4Address
        L8_131 = A0_123["Wan.StaticDNS"]
        L7_130 = L7_130(L8_131)
        if L7_130 ~= true then
          L7_130 = printCLIError
          L8_131 = "Static DNS IP Address is Invalid. Octet 1 should "
          L9_132 = "be in 1-223 and Octet 4 should be in 1-254 range."
          L8_131 = L8_131 .. L9_132
          L7_130(L8_131)
          L7_130 = false
          return L7_130
        end
      end
    end
    L7_130 = A0_123["Wan.IdleTimeOutFlag"]
    if L7_130 == "1" then
      L7_130 = A0_123["Wan.IdleTime"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.IdleTime"]
      elseif L7_130 == "" then
        L7_130 = printCLIError
        L8_131 = "Enter valid idle timeout value\n"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
    end
    L7_130 = A0_123["Wan.SvrIpAddr"]
    if L7_130 ~= "" then
      L7_130 = A0_123["Wan.SvrIpAddr"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.SvrIpAddr"]
        if L7_130 == "0.0.0.0" then
          L7_130 = A0_123["Wan.SvrIpAddr"]
        end
      end
    elseif L7_130 ~= nil then
      L7_130 = printCLIError
      L8_131 = "Enter valid IP address of the L2TP server\n"
      L7_130(L8_131)
      L7_130 = false
      return L7_130
    end
    L7_130 = validationsLuaLib
    L7_130 = L7_130.domainNameValidation
    L8_131 = A0_123["Wan.SvrIpAddr"]
    L8_131 = L7_130(L8_131)
    L9_132 = tonumber
    L10_133 = L7_130
    L9_132 = L9_132(L10_133)
    if L9_132 ~= 0 then
      L9_132 = printCLIError
      L10_133 = L8_131
      L9_132(L10_133)
      L9_132 = false
      return L9_132
    end
    L9_132 = _UPVALUE0_
    L9_132 = L9_132.checkOpenVpnSubnetRange
    L10_133 = A0_123["Wan.IpAddr"]
    L11_134 = A0_123["Wan.SnetMask"]
    L9_132 = L9_132(L10_133, L11_134)
    valid = L9_132
    L9_132 = valid
    L10_133 = _UPVALUE3_
    L10_133 = L10_133.SUCCESS
    if L9_132 == L10_133 then
      L9_132 = printCLIError
      L10_133 = "OpenVPN Network/OpenVPN Remote Network is already configured in same subnet, Please specify IP Address in a different subnet."
      L9_132(L10_133)
      L9_132 = false
      return L9_132
    end
    L9_132 = true
    return L9_132
  end
  L7_130 = A0_123["Wan.IspType"]
  if L7_130 == "7" then
    A0_123["NimfConf.RequireLogin"] = "1"
    L7_130 = A0_123["Wan.IsDNSDyn"]
    if L7_130 == "0" then
      L7_130 = A0_123["Wan.PriDnsIpAddr"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.PriDnsIpAddr"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.PriDnsIpAddr"]
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Primary DNS Server for Primary Profile"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = util
      L7_130 = L7_130.split
      L8_131 = A0_123["Wan.PriDnsIpAddr"]
      L9_132 = "."
      L7_130 = L7_130(L8_131, L9_132)
      Octet = L7_130
      L7_130 = tonumber
      L8_131 = Octet
      L8_131 = L8_131[1]
      L7_130 = L7_130(L8_131)
      if L7_130 ~= 224 then
        L7_130 = tonumber
        L8_131 = Octet
        L8_131 = L8_131[1]
        L7_130 = L7_130(L8_131)
      elseif L7_130 > 224 then
        L7_130 = printCLIError
        L8_131 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.PriDnsIpAddr"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = A0_123["Wan.SecDnsIpAddr"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.SecDnsIpAddr"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.SecDnsIpAddr"]
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Secondary DNS Server for Primary Profile"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = util
      L7_130 = L7_130.split
      L8_131 = A0_123["Wan.SecDnsIpAddr"]
      L9_132 = "."
      L7_130 = L7_130(L8_131, L9_132)
      Octet = L7_130
      L7_130 = tonumber
      L8_131 = Octet
      L8_131 = L8_131[1]
      L7_130 = L7_130(L8_131)
      if L7_130 ~= 224 then
        L7_130 = tonumber
        L8_131 = Octet
        L8_131 = L8_131[1]
        L7_130 = L7_130(L8_131)
      elseif L7_130 > 224 then
        L7_130 = printCLIError
        L8_131 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.SecDnsIpAddr"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet "
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
    end
    L7_130 = A0_123["Wan.UserName"]
    if L7_130 ~= nil then
      L7_130 = A0_123["Wan.UserName"]
      if L7_130 ~= "" then
        L7_130 = A0_123["Wan.Password"]
        if L7_130 ~= nil then
          L7_130 = A0_123["Wan.Password"]
        end
      end
    elseif L7_130 == "" then
      L7_130 = printCLIError
      L8_131 = "Invalid username/password for Primary Profile\n"
      L7_130(L8_131)
      L7_130 = false
      return L7_130
    end
    L7_130 = A0_123["Wan.PppoeIdleTimeOutFlag"]
    if L7_130 == "1" then
      L7_130 = A0_123["Wan.PppoeIdleTimeOutValue"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.PppoeIdleTimeOutValue"]
      elseif L7_130 == "" then
        L7_130 = printCLIError
        L8_131 = "Enter valid idle timeout value for Primary Profile\n"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
    end
    L7_130 = A0_123["Wan.PIsGetIpDyn"]
    if L7_130 == "0" then
      L7_130 = A0_123["Wan.PIpAddr"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.PIpAddr"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.PIpAddr"]
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Static Ip for Primary Profile"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = util
      L7_130 = L7_130.split
      L8_131 = A0_123["Wan.PIpAddr"]
      L9_132 = "."
      L7_130 = L7_130(L8_131, L9_132)
      Octet = L7_130
      L7_130 = tonumber
      L8_131 = Octet
      L8_131 = L8_131[1]
      L7_130 = L7_130(L8_131)
      if L7_130 ~= 224 then
        L7_130 = tonumber
        L8_131 = Octet
        L8_131 = L8_131[1]
        L7_130 = L7_130(L8_131)
      elseif L7_130 > 224 then
        L7_130 = printCLIError
        L8_131 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.PIpAddr"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = A0_123["Wan.PSnetMask"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.PSnetMask"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.PSnetMask"]
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Subnet mask for Primary Profile"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.checkOpenVpnSubnetRange
      L8_131 = A0_123["Wan.PIpAddr"]
      L9_132 = A0_123["Wan.PSnetMask"]
      L7_130 = L7_130(L8_131, L9_132)
      valid = L7_130
      L7_130 = valid
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "OpenVPN Network/OpenVPN Remote Network is already configured in same subnet, Please specify IP Address in a different subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
    end
    L7_130 = A0_123["Wan.JIsDNSDyn"]
    if L7_130 == "0" then
      L7_130 = A0_123["Wan.JPriDnsIpAddr"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.JPriDnsIpAddr"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.JPriDnsIpAddr"]
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Primary DNS Server for Secondary Profile"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = util
      L7_130 = L7_130.split
      L8_131 = A0_123["Wan.JPriDnsIpAddr"]
      L9_132 = "."
      L7_130 = L7_130(L8_131, L9_132)
      Octet = L7_130
      L7_130 = tonumber
      L8_131 = Octet
      L8_131 = L8_131[1]
      L7_130 = L7_130(L8_131)
      if L7_130 ~= 224 then
        L7_130 = tonumber
        L8_131 = Octet
        L8_131 = L8_131[1]
        L7_130 = L7_130(L8_131)
      elseif L7_130 > 224 then
        L7_130 = printCLIError
        L8_131 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.JPriDnsIpAddr"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = A0_123["Wan.JSecDnsIpAddr"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.JSecDnsIpAddr"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.JSecDnsIpAddr"]
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Secondary DNS Server for Secondary Profile"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = util
      L7_130 = L7_130.split
      L8_131 = A0_123["Wan.JSecDnsIpAddr"]
      L9_132 = "."
      L7_130 = L7_130(L8_131, L9_132)
      Octet = L7_130
      L7_130 = tonumber
      L8_131 = Octet
      L8_131 = L8_131[1]
      L7_130 = L7_130(L8_131)
      if L7_130 ~= 224 then
        L7_130 = tonumber
        L8_131 = Octet
        L8_131 = L8_131[1]
        L7_130 = L7_130(L8_131)
      elseif L7_130 > 224 then
        L7_130 = printCLIError
        L8_131 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.JSecDnsIpAddr"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
    end
    L7_130 = A0_123["Wan.JUserName"]
    if L7_130 ~= nil then
      L7_130 = A0_123["Wan.JUserName"]
      if L7_130 ~= "" then
        L7_130 = A0_123["Wan.JPassword"]
        if L7_130 ~= nil then
          L7_130 = A0_123["Wan.JPassword"]
        end
      end
    elseif L7_130 == "" then
      L7_130 = printCLIError
      L8_131 = "Invalid username/password for Secondary Profile\n"
      L7_130(L8_131)
      L7_130 = false
      return L7_130
    end
    L7_130 = A0_123["Wan.JPppoeIdleTimeOutFlag"]
    if L7_130 == "1" then
      L7_130 = A0_123["Wan.JPppoeIdleTimeOutValue"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.JPppoeIdleTimeOutValue"]
      elseif L7_130 == "" then
        L7_130 = printCLIError
        L8_131 = "Enter valid idle timeout value for Secondary Profile\n"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
    end
    L7_130 = A0_123["Wan.JIsGetIpDyn"]
    if L7_130 == "0" then
      L7_130 = A0_123["Wan.JIpAddr"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.JIpAddr"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.JIpAddr"]
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Static Ip for Secondary Profile"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = util
      L7_130 = L7_130.split
      L8_131 = A0_123["Wan.JIpAddr"]
      L9_132 = "."
      L7_130 = L7_130(L8_131, L9_132)
      Octet = L7_130
      L7_130 = tonumber
      L8_131 = Octet
      L8_131 = L8_131[1]
      L7_130 = L7_130(L8_131)
      if L7_130 ~= 224 then
        L7_130 = tonumber
        L8_131 = Octet
        L8_131 = L8_131[1]
        L7_130 = L7_130(L8_131)
      elseif L7_130 > 224 then
        L7_130 = printCLIError
        L8_131 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.JIpAddr"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = A0_123["Wan.JSnetMask"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.JSnetMask"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.JSnetMask"]
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Subnet mask for Secondary Profile"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.checkOpenVpnSubnetRange
      L8_131 = A0_123["Wan.JIpAddr"]
      L9_132 = A0_123["Wan.JSnetMask"]
      L7_130 = L7_130(L8_131, L9_132)
      valid = L7_130
      L7_130 = valid
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "OpenVPN Network/OpenVPN Remote Network is already configured in same subnet, Please specify IP Address in a different subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
    end
    L7_130 = true
    return L7_130
  end
  L7_130 = A0_123["Wan.IspType"]
  if L7_130 == "8" then
    A0_123["Wan.MppeEncryptSupport"] = "0"
    A0_123["Wan.SplitTunnel"] = "0"
    L7_130 = A0_123["Wan.IdleTimeOutFlag"]
    if L7_130 == "1" then
      L7_130 = A0_123["Wan.IdleTime"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.IdleTime"]
      elseif L7_130 == "" then
        L7_130 = printCLIError
        L8_131 = "Please Enter a valid Idle Time"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
    end
    L7_130 = A0_123["Wan.IdleTimeOutFlag"]
    if L7_130 == "1" then
      L7_130 = tonumber
      L8_131 = A0_123["Wan.IdleTime"]
      L7_130 = L7_130(L8_131)
      if L7_130 >= 0 then
        L7_130 = tonumber
        L8_131 = A0_123["Wan.IdleTime"]
        L7_130 = L7_130(L8_131)
        if L7_130 < 5 then
          L7_130 = printCLIError
          L8_131 = "Idletime out error: Value entered does not fall in allowed range"
          L7_130(L8_131)
          L7_130 = false
          return L7_130
        end
      end
    end
    L7_130 = A0_123["Wan.DialNumber"]
    if L7_130 ~= "" then
      L7_130 = A0_123["Wan.DialNumber"]
    elseif L7_130 == nil then
      L7_130 = printCLIError
      L8_131 = "Please enter a valid Dial Number"
      L7_130(L8_131)
      L7_130 = false
      return L7_130
    end
    L7_130 = A0_123["Wan.APN"]
    if L7_130 ~= "" then
      L7_130 = A0_123["Wan.APN"]
    elseif L7_130 == nil then
      L7_130 = printCLIError
      L8_131 = "Please enter a valid APN for Mobile Internet Connection."
      L7_130(L8_131)
      L7_130 = false
      return L7_130
    end
    L7_130 = A0_123["Wan.IsDNSDyn"]
    if L7_130 == "0" then
      L7_130 = A0_123["Wan.PriDnsIpAddr"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.PriDnsIpAddr"]
      elseif L7_130 == "" then
        L7_130 = printCLIError
        L8_131 = "Please enter a valid Ip Address"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = util
      L7_130 = L7_130.split
      L8_131 = A0_123["Wan.PriDnsIpAddr"]
      L9_132 = "."
      L7_130 = L7_130(L8_131, L9_132)
      Octet = L7_130
      L7_130 = tonumber
      L8_131 = Octet
      L8_131 = L8_131[1]
      L7_130 = L7_130(L8_131)
      if L7_130 ~= 224 then
        L7_130 = tonumber
        L8_131 = Octet
        L8_131 = L8_131[1]
        L7_130 = L7_130(L8_131)
      elseif L7_130 > 224 then
        L7_130 = printCLIError
        L8_131 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.PriDnsIpAddr"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
    end
    L7_130 = A0_123["Wan.IsDNSDyn"]
    if L7_130 == "0" then
      L7_130 = A0_123["Wan.SecDnsIpAddr"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.SecDnsIpAddr"]
      elseif L7_130 == "" then
        L7_130 = printCLIError
        L8_131 = "Please enter a valid Ip Address"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = util
      L7_130 = L7_130.split
      L8_131 = A0_123["Wan.SecDnsIpAddr"]
      L9_132 = "."
      L7_130 = L7_130(L8_131, L9_132)
      Octet = L7_130
      L7_130 = tonumber
      L8_131 = Octet
      L8_131 = L8_131[1]
      L7_130 = L7_130(L8_131)
      if L7_130 ~= 224 then
        L7_130 = tonumber
        L8_131 = Octet
        L8_131 = L8_131[1]
        L7_130 = L7_130(L8_131)
      elseif L7_130 > 224 then
        L7_130 = printCLIError
        L8_131 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.SecDnsIpAddr"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
    end
    L7_130 = A0_123["Wan.IsDNSDyn"]
    if L7_130 == "0" then
      L7_130 = A0_123["Wan.SecDnsIpAddr"]
      if L7_130 ~= "0.0.0.0" then
        L7_130 = A0_123["Wan.PriDnsIpAddr"]
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = util
      L7_130 = L7_130.split
      L8_131 = A0_123["Wan.SecDnsIpAddr"]
      L9_132 = "."
      L7_130 = L7_130(L8_131, L9_132)
      Octet = L7_130
      L7_130 = tonumber
      L8_131 = Octet
      L8_131 = L8_131[1]
      L7_130 = L7_130(L8_131)
      if L7_130 ~= 224 then
        L7_130 = tonumber
        L8_131 = Octet
        L8_131 = L8_131[1]
        L7_130 = L7_130(L8_131)
      elseif L7_130 > 224 then
        L7_130 = printCLIError
        L8_131 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.SecDnsIpAddr"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
    end
    L7_130 = string
    L7_130 = L7_130.len
    L8_131 = A0_123["Wan.APN"]
    L7_130 = L7_130(L8_131)
    L8_131 = string
    L8_131 = L8_131.len
    L9_132 = A0_123["Wan.DialNumber"]
    L8_131 = L8_131(L9_132)
    L9_132 = string
    L9_132 = L9_132.len
    L10_133 = A0_123["Wan.UserName"]
    L9_132 = L9_132(L10_133)
    L10_133 = string
    L10_133 = L10_133.len
    L11_134 = A0_123["Wan.Password"]
    L10_133 = L10_133(L11_134)
    if L7_130 > 64 then
      L11_134 = printCLIError
      L11_134("APN(Access Point Name) length can be upto 64 characters only")
      L11_134 = false
      return L11_134
    end
    if L8_131 > 32 then
      L11_134 = printCLIError
      L11_134("Dial Number length can be upto 32 characters only")
      L11_134 = false
      return L11_134
    end
    if L9_132 > 32 then
      L11_134 = printCLIError
      L11_134("User Name length can be upto 32 characters only")
      L11_134 = false
      return L11_134
    end
    if L10_133 > 64 then
      L11_134 = printCLIError
      L11_134("Password length can be upto 64 characters only")
      L11_134 = false
      return L11_134
    end
    L11_134 = true
    return L11_134
  end
  L7_130 = A0_123["Wan.IspType"]
  if L7_130 == "9" then
    A0_123["NimfConf.RequireLogin"] = "1"
    L7_130 = A0_123["Wan.IsDNSDyn"]
    if L7_130 == "0" then
      L7_130 = A0_123["Wan.PriDnsIpAddr"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.PriDnsIpAddr"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.PriDnsIpAddr"]
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Primary DNS Server"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = util
      L7_130 = L7_130.split
      L8_131 = A0_123["Wan.PriDnsIpAddr"]
      L9_132 = "."
      L7_130 = L7_130(L8_131, L9_132)
      Octet = L7_130
      L7_130 = tonumber
      L8_131 = Octet
      L8_131 = L8_131[1]
      L7_130 = L7_130(L8_131)
      if L7_130 ~= 224 then
        L7_130 = tonumber
        L8_131 = Octet
        L8_131 = L8_131[1]
        L7_130 = L7_130(L8_131)
      elseif L7_130 > 224 then
        L7_130 = printCLIError
        L8_131 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.PriDnsIpAddr"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = A0_123["Wan.SecDnsIpAddr"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.SecDnsIpAddr"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.SecDnsIpAddr"]
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Secondary DNS Server"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = util
      L7_130 = L7_130.split
      L8_131 = A0_123["Wan.SecDnsIpAddr"]
      L9_132 = "."
      L7_130 = L7_130(L8_131, L9_132)
      Octet = L7_130
      L7_130 = tonumber
      L8_131 = Octet
      L8_131 = L8_131[1]
      L7_130 = L7_130(L8_131)
      if L7_130 ~= 224 then
        L7_130 = tonumber
        L8_131 = Octet
        L8_131 = L8_131[1]
        L7_130 = L7_130(L8_131)
      elseif L7_130 > 224 then
        L7_130 = printCLIError
        L8_131 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.SecDnsIpAddr"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
    end
    L7_130 = A0_123["Wan.UserName"]
    if L7_130 ~= nil then
      L7_130 = A0_123["Wan.UserName"]
      if L7_130 ~= "" then
        L7_130 = A0_123["Wan.Password"]
        if L7_130 ~= nil then
          L7_130 = A0_123["Wan.Password"]
        end
      end
    elseif L7_130 == "" then
      L7_130 = printCLIError
      L8_131 = "Invalid username/password\n"
      L7_130(L8_131)
      L7_130 = false
      return L7_130
    end
    L7_130 = A0_123["Wan.PppoeIdleTimeOutFlag"]
    if L7_130 == "1" then
      L7_130 = A0_123["Wan.PppoeIdleTimeOutValue"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.PppoeIdleTimeOutValue"]
      elseif L7_130 == "" then
        L7_130 = printCLIError
        L8_131 = "Enter valid idle timeout value\n"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
    end
    L7_130 = A0_123["Wan.PIsGetIpDyn"]
    if L7_130 == "0" then
      L7_130 = A0_123["Wan.PIpAddr"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.PIpAddr"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.PIpAddr"]
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Static Ip"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = util
      L7_130 = L7_130.split
      L8_131 = A0_123["Wan.PIpAddr"]
      L9_132 = "."
      L7_130 = L7_130(L8_131, L9_132)
      Octet = L7_130
      L7_130 = tonumber
      L8_131 = Octet
      L8_131 = L8_131[1]
      L7_130 = L7_130(L8_131)
      if L7_130 ~= 224 then
        L7_130 = tonumber
        L8_131 = Octet
        L8_131 = L8_131[1]
        L7_130 = L7_130(L8_131)
      elseif L7_130 > 224 then
        L7_130 = printCLIError
        L8_131 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.PIpAddr"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = A0_123["Wan.PSnetMask"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.PSnetMask"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.PSnetMask"]
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Subnet mask"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.checkOpenVpnSubnetRange
      L8_131 = A0_123["Wan.PIpAddr"]
      L9_132 = A0_123["Wan.PSnetMask"]
      L7_130 = L7_130(L8_131, L9_132)
      valid = L7_130
      L7_130 = valid
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "OpenVPN Network/OpenVPN Remote Network is already configured in same subnet, Please specify IP Address in a different subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
    end
    L7_130 = A0_123["Wan.GetIpFromIspPhy"]
    if L7_130 == "0" then
      L7_130 = A0_123["Wan.StaticIpPhy"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.StaticIpPhy"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.StaticIpPhy"]
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Static Ip of physical interface"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = util
      L7_130 = L7_130.split
      L8_131 = A0_123["Wan.StaticIpPhy"]
      L9_132 = "."
      L7_130 = L7_130(L8_131, L9_132)
      Octet = L7_130
      L7_130 = tonumber
      L8_131 = Octet
      L8_131 = L8_131[1]
      L7_130 = L7_130(L8_131)
      if L7_130 ~= 224 then
        L7_130 = tonumber
        L8_131 = Octet
        L8_131 = L8_131[1]
        L7_130 = L7_130(L8_131)
      elseif L7_130 > 224 then
        L7_130 = printCLIError
        L8_131 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.StaticIpPhy"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = A0_123["Wan.NetMaskPhy"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.NetMaskPhy"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.NetMaskPhy"]
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Subnet mask of physical interface"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = A0_123["Wan.GatewayPhy"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.GatewayPhy"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.GatewayPhy"]
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Gateway of physical interface"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = A0_123["Wan.StaticIpPhy"]
      L9_132 = A0_123["Wan.NetMaskPhy"]
      L10_133 = A0_123["Wan.GatewayPhy"]
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 ~= L8_131 then
        L7_130 = printCLIError
        L8_131 = "DEFAULT Gateway IP should be in same subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.GatewayPhy"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
    end
    L7_130 = A0_123["Wan.GetDnsFromIspPhy"]
    if L7_130 == "0" then
      L7_130 = A0_123["Wan.PrimaryDnsPhy"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.PrimaryDnsPhy"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.PrimaryDnsPhy"]
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Primary DNS Server for physical network"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = util
      L7_130 = L7_130.split
      L8_131 = A0_123["Wan.PrimaryDnsPhy"]
      L9_132 = "."
      L7_130 = L7_130(L8_131, L9_132)
      Octet = L7_130
      L7_130 = tonumber
      L8_131 = Octet
      L8_131 = L8_131[1]
      L7_130 = L7_130(L8_131)
      if L7_130 ~= 224 then
        L7_130 = tonumber
        L8_131 = Octet
        L8_131 = L8_131[1]
        L7_130 = L7_130(L8_131)
      elseif L7_130 > 224 then
        L7_130 = printCLIError
        L8_131 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.PrimaryDnsPhy"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = A0_123["Wan.SecondaryDnsPhy"]
      if L7_130 ~= nil then
        L7_130 = A0_123["Wan.SecondaryDnsPhy"]
        if L7_130 ~= "" then
          L7_130 = A0_123["Wan.SecondaryDnsPhy"]
        end
      elseif L7_130 == "0.0.0.0" then
        L7_130 = printCLIError
        L8_131 = "Give Secondary DNS Server for physical network"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = util
      L7_130 = L7_130.split
      L8_131 = A0_123["Wan.SecondaryDnsPhy"]
      L9_132 = "."
      L7_130 = L7_130(L8_131, L9_132)
      Octet = L7_130
      L7_130 = tonumber
      L8_131 = Octet
      L8_131 = L8_131[1]
      L7_130 = L7_130(L8_131)
      if L7_130 ~= 224 then
        L7_130 = tonumber
        L8_131 = Octet
        L8_131 = L8_131[1]
        L7_130 = L7_130(L8_131)
      elseif L7_130 > 224 then
        L7_130 = printCLIError
        L8_131 = "Invalid IP address. Please enter a value between 1 - 223 for octet 1"
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
      L7_130 = _UPVALUE0_
      L7_130 = L7_130.ipv4SingleMaskCheck
      L8_131 = _UPVALUE1_
      L9_132 = A0_123["Wan.SecondaryDnsPhy"]
      L10_133 = _UPVALUE2_
      L7_130 = L7_130(L8_131, L9_132, L10_133)
      L8_131 = _UPVALUE3_
      L8_131 = L8_131.SUCCESS
      if L7_130 == L8_131 then
        L7_130 = printCLIError
        L8_131 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
        L7_130(L8_131)
        L7_130 = false
        return L7_130
      end
    end
    L7_130 = true
    return L7_130
  end
  L7_130 = A0_123["Wan.exitFlag"]
  if L7_130 ~= nil then
    L7_130 = A0_123["Wan.exitFlag"]
    if L7_130 == "1" then
      L7_130 = false
      return L7_130
    end
  end
  L7_130 = printCLIError
  L8_131 = "Please Give connection type first:isp_connection_type"
  L7_130(L8_131)
  L7_130 = false
  return L7_130
end
function nimfCfgSaveMode(A0_135)
  local L1_136, L2_137, L3_138, L4_139, L5_140
  L1_136 = "OK"
  L2_137 = ""
  L3_138 = A0_135["WanMode.Wanmode"]
  if L3_138 ~= "1" then
    L3_138 = A0_135["WanMode.Wanmode"]
  elseif L3_138 == "3" then
    L3_138 = A0_135["WanMode.LoadBal"]
    if L3_138 ~= "1" then
      L3_138 = A0_135["WanMode.LoadBal"]
    elseif L3_138 == "3" then
      L3_138 = A0_135["WanMode.LoadBal"]
      A0_135["WanMode.Wanmode"] = L3_138
    end
  end
  L3_138 = "Enabling the  LoadBalance SpillOver would result in performance drop. Please confirm(Y/N?)"
  L4_139 = db
  L4_139 = L4_139.getAttribute
  L5_140 = "wanMode"
  L4_139 = L4_139(L5_140, "_ROWID_", "1", "Wanmode")
  L5_140 = tonumber
  L5_140 = L5_140(A0_135["WanMode.Wanmode"])
  if L5_140 == 3 then
    L5_140 = tonumber
    L5_140 = L5_140(L4_139)
    if L5_140 ~= 3 then
      L5_140 = printCLIError
      L5_140(L3_138)
      L5_140 = io
      L5_140 = L5_140.stdin
      L5_140 = L5_140.read
      L5_140 = L5_140(L5_140, "*l")
      if L5_140 ~= "Y" and L5_140 ~= "N" then
        return "ERROR", "Please confirm with Y/N"
      end
      if L5_140 == "N" then
        L1_136 = "ERROR"
        L2_137 = "Action Cancelled"
        return L1_136, L2_137
      end
    end
  end
  L5_140 = nimfView
  L5_140 = L5_140.wanModeConfig
  statusCode, L5_140 = A0_135, L5_140(A0_135, "1", "add")
  L1_136 = L5_140
  L5_140 = A0_135["WanMode.Wanmode"]
  if L5_140 ~= "0" then
    L5_140 = A0_135["WanMode.Wanmode"]
  elseif L5_140 == "2" then
    L5_140 = db
    L5_140 = L5_140.getAttribute
    L5_140 = L5_140("userAccountingEnable", "_ROWID_", "1", "routeIfaceName")
    if L5_140 and L5_140 ~= "WAN1" then
      db.setAttribute("userAccountingEnable", "_ROWID_", "1", "routeIfaceName", "WAN1")
    end
    L5_140 = db.getAttribute("radAuthConf", "_ROWID_", "1", "nasIface")
    if L5_140 and L5_140 ~= "WAN1" then
      db.setAttribute("radAuthConf", "_ROWID_", "1", "nasIface", "WAN1")
    end
  end
  if L1_136 == "OK" then
    L5_140 = db
    L5_140 = L5_140.save
    L5_140()
  end
  if L1_136 == "OK" then
    L5_140 = nimfView
    L5_140 = L5_140.wanMode6Config
    statusCode, L5_140 = A0_135, L5_140(A0_135, "2", "add")
    L1_136 = L5_140
    if L1_136 == "OK" then
      L5_140 = db
      L5_140 = L5_140.save
      L5_140()
    end
  end
  L5_140 = PFRM_BIN_PATH
  L5_140 = L5_140 .. " " .. HW_OFFLOAD_SCRIPT .. " " .. SYSTEM_DB_FILE_NAME
  util.appendDebugOut("Exec: " .. os.execute(L5_140))
  L2_137 = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE) or statusCode
  return L1_136, L2_137
end
function nimfCfgInitMode(A0_141)
  local L1_142
  L1_142 = {}
  L1_142 = db.getRow("WanMode", "_ROWID_", "1")
  if L1_142["WanMode.Wanmode"] == "3" then
    L1_142["WanMode.LoadBal"] = "3"
  elseif L1_142["WanMode.Wanmode"] == "1" then
    L1_142["WanMode.LoadBal"] = "1"
  end
  L1_142["WanMode.AddressFamily"] = nil
  if L1_142 == nil then
    L1_142 = {}
  end
  return 1, L1_142
end
function nimfCfgInputValMode(A0_143)
  local L1_144, L2_145, L3_146, L4_147, L5_148, L6_149
  L1_144 = A0_143["WanMode.Wanmode"]
  if L1_144 ~= "" then
    L1_144 = A0_143["WanMode.Wanmode"]
  elseif L1_144 == nil then
    L1_144 = printCLIError
    L2_145 = "Please enter the WAN Mode\n"
    L1_144(L2_145)
  end
  L1_144 = A0_143["WanMode.Wanmode"]
  if L1_144 == "0" then
    A0_143["WanMode.FailureDetectionMeth"] = "0"
    L1_144 = A0_143["WanMode.DedicatedLogicalIfName"]
    if L1_144 ~= "" then
      L1_144 = A0_143["WanMode.DedicatedLogicalIfName"]
    elseif L1_144 == nil then
      L1_144 = printCLIError
      L2_145 = "Invalid WAN Type for Single WAN Mode\n"
      L1_144(L2_145)
      L1_144 = false
      return L1_144
    end
  end
  L1_144 = nil
  L2_145 = db
  L2_145 = L2_145.getAttribute
  L3_146 = "ConfigPort"
  L4_147 = "_ROWID_"
  L5_148 = "1"
  L6_149 = "LogicalIfName"
  L2_145 = L2_145(L3_146, L4_147, L5_148, L6_149)
  L1_144 = L2_145
  if L1_144 == "DMZ" then
    L2_145 = A0_143["WanMode.Wanmode"]
    if L2_145 == "0" then
      L2_145 = A0_143["WanMode.DedicatedLogicalIfName"]
      if L2_145 == "WAN2" then
        L2_145 = printCLIError
        L3_146 = "WAN2 cannot be configured as Primary/Dedicated WAN \n"
        L4_147 = "when configurable port is DMZ"
        L3_146 = L3_146 .. L4_147
        L2_145(L3_146)
        L2_145 = false
        return L2_145
      end
    else
      L2_145 = A0_143["WanMode.Wanmode"]
      if L2_145 ~= "1" then
        L2_145 = A0_143["WanMode.Wanmode"]
      else
        if L2_145 == "3" then
          L2_145 = printCLIError
          L3_146 = "WAN Mode cannot be configured as Load Balancing \n"
          L4_147 = "when configurable port is DMZ"
          L3_146 = L3_146 .. L4_147
          L2_145(L3_146)
          L2_145 = false
          return L2_145
      end
      else
        L2_145 = A0_143["WanMode.Wanmode"]
        if L2_145 == "2" then
          L2_145 = A0_143["WanMode.FailoverPriLogicalIfName"]
          if L2_145 ~= nil then
            L2_145 = A0_143["WanMode.FailoverPriLogicalIfName"]
          else
            if L2_145 ~= "WAN2" then
              L2_145 = A0_143["WanMode.FailoverSecLogicalIfName"]
              if L2_145 ~= nil then
                L2_145 = A0_143["WanMode.FailoverSecLogicalIfName"]
              end
          end
          elseif L2_145 == "WAN2" then
            L2_145 = printCLIError
            L3_146 = "WAN2 cannot be configured as Primary/secondary WAN port \n"
            L4_147 = "in Auto-rollover when configurable port is DMZ"
            L3_146 = L3_146 .. L4_147
            L2_145(L3_146)
            L2_145 = false
            return L2_145
          end
        end
      end
    end
  end
  L2_145 = db
  L2_145 = L2_145.getAttribute
  L3_146 = "unitInfo"
  L4_147 = "_ROWID_"
  L5_148 = "1"
  L6_149 = "modelId"
  L2_145 = L2_145(L3_146, L4_147, L5_148, L6_149)
  if L2_145 == "DSR-500N" or L2_145 == "DSR-500" then
    L3_146 = A0_143["WanMode.DedicatedLogicalIfName"]
    if L3_146 == "WAN3" then
      L3_146 = printCLIError
      L4_147 = "WAN3 is not supported in this box"
      L3_146(L4_147)
      L3_146 = false
      return L3_146
    end
  end
  if L2_145 == "DSR-500N" or L2_145 == "DSR-500" then
    L3_146 = A0_143["WanMode.FailoverPriLogicalIfName"]
    if L3_146 == "WAN3" then
      L3_146 = printCLIError
      L4_147 = "WAN3 is not supported in this box"
      L3_146(L4_147)
      L3_146 = false
      return L3_146
    end
  end
  if L2_145 == "DSR-500N" or L2_145 == "DSR-500" then
    L3_146 = A0_143["WanMode.FailoverSecLogicalIfName"]
    if L3_146 == "WAN3" then
      L3_146 = printCLIError
      L4_147 = "WAN3 is not supported in this box"
      L3_146(L4_147)
      L3_146 = false
      return L3_146
    end
  end
  L3_146 = db
  L3_146 = L3_146.getAttribute
  L4_147 = _UPVALUE0_
  L5_148 = _UPVALUE1_
  L6_149 = _UPVALUE2_
  L3_146 = L3_146(L4_147, L5_148, L6_149, _UPVALUE3_.netWorkMode)
  L4_147 = _UPVALUE4_
  if L3_146 == L4_147 then
    L4_147 = A0_143["WanMode.Wanmode"]
    L5_148 = _UPVALUE5_
    if L4_147 ~= L5_148 then
      L4_147 = printCLIError
      L5_148 = "Load balancing and Auto Rollover using WAN Port is"
      L6_149 = " not supported for IPv4 & IPv6 dual mode."
      L5_148 = L5_148 .. L6_149
      L4_147(L5_148)
      L4_147 = false
      return L4_147
    end
  end
  L4_147 = db
  L4_147 = L4_147.getAttribute
  L5_148 = "ThreeG"
  L6_149 = "_ROWID_"
  L4_147 = L4_147(L5_148, L6_149, "1", "IdleTimeOutFlag")
  L5_148 = A0_143["WanMode.Wanmode"]
  if L5_148 ~= "1" then
    L5_148 = A0_143["WanMode.Wanmode"]
  elseif L5_148 == "3" then
    L5_148 = A0_143["WanMode.LoadBal"]
    if L5_148 ~= "" then
      L5_148 = A0_143["WanMode.LoadBal"]
    elseif L5_148 == nil then
      L5_148 = printCLIError
      L6_149 = "Invalid LOAD Balnacing Algo Type\n"
      L5_148(L6_149)
      L5_148 = false
      return L5_148
    end
    L5_148 = _UPVALUE6_
    if L4_147 == L5_148 then
      L5_148 = printCLIError
      L6_149 = "Load Balancing mode is not supported when Mobile Internet reconnect mode is On Demand.\n"
      L5_148(L6_149)
      L5_148 = false
      return L5_148
    end
    L5_148 = A0_143["WanMode.FailureDetectionMeth"]
    if L5_148 ~= "" then
      L5_148 = A0_143["WanMode.FailureDetectionMeth"]
    elseif L5_148 == nil then
      L5_148 = printCLIError
      L6_149 = "Enter valid Failure Detection Method\n"
      L5_148(L6_149)
      L5_148 = false
      return L5_148
    end
    L5_148 = A0_143["WanMode.FailureDetectionMeth"]
    if L5_148 == "2" then
      L5_148 = A0_143["WanFailure.DnsIp"]
      if L5_148 ~= "" then
        L5_148 = A0_143["WanFailure.DnsIp"]
        if L5_148 ~= nil then
          L5_148 = A0_143["WanFailure.DnsIp"]
          if L5_148 ~= nil then
            L5_148 = A0_143["WanFailure.DnsIp"]
          end
        end
      elseif L5_148 == "0.0.0.0" then
        L5_148 = printCLIError
        L6_149 = "Enter valid WAN1 DNS Address\n"
        L5_148(L6_149)
        L5_148 = false
        return L5_148
      end
      L5_148 = A0_143["WanFailure.DnsIp1"]
      if L5_148 ~= "" then
        L5_148 = A0_143["WanFailure.DnsIp1"]
        if L5_148 ~= nil then
          L5_148 = A0_143["WanFailure.DnsIp1"]
          if L5_148 ~= nil then
            L5_148 = A0_143["WanFailure.DnsIp1"]
          end
        end
      elseif L5_148 == "0.0.0.0" then
        L5_148 = printCLIError
        L6_149 = "Enter valid WAN2 DNS Address\n"
        L5_148(L6_149)
        L5_148 = false
        return L5_148
      end
    else
      L5_148 = A0_143["WanMode.FailureDetectionMeth"]
      if L5_148 == "3" then
        L5_148 = A0_143["WanFailure.PingIp"]
        if L5_148 ~= "" then
          L5_148 = A0_143["WanFailure.PingIp"]
          if L5_148 ~= nil then
            L5_148 = A0_143["WanFailure.PingIp"]
            if L5_148 ~= nil then
              L5_148 = A0_143["WanFailure.PingIp"]
            end
          end
        elseif L5_148 == "0.0.0.0" then
          L5_148 = printCLIError
          L6_149 = "Enter valid WAN1 PING Address\n"
          L5_148(L6_149)
          L5_148 = false
          return L5_148
        end
        L5_148 = A0_143["WanFailure.PingIp1"]
        if L5_148 ~= "" then
          L5_148 = A0_143["WanFailure.PingIp1"]
          if L5_148 ~= nil then
            L5_148 = A0_143["WanFailure.PingIp1"]
            if L5_148 ~= nil then
              L5_148 = A0_143["WanFailure.PingIp1"]
            end
          end
        elseif L5_148 == "0.0.0.0" then
          L5_148 = printCLIError
          L6_149 = "Enter valid WAN2 PING Address\n"
          L5_148(L6_149)
          L5_148 = false
          return L5_148
        end
      end
    end
    L5_148 = A0_143["WanMode.RetryTime"]
    if L5_148 ~= "" then
      L5_148 = A0_143["WanMode.RetryTime"]
    elseif L5_148 == nil then
      L5_148 = printCLIError
      L6_149 = "Enter valid Retry time\n"
      L5_148(L6_149)
      L5_148 = false
      return L5_148
    end
    L5_148 = A0_143["WanMode.RetryAttempts"]
    if L5_148 ~= "" then
      L5_148 = A0_143["WanMode.RetryAttempts"]
    elseif L5_148 == nil then
      L5_148 = printCLIError
      L6_149 = "Enter valid Retry Attempts\n"
      L5_148(L6_149)
      L5_148 = false
      return L5_148
    end
  end
  L5_148 = A0_143["WanMode.Wanmode"]
  if L5_148 == "2" then
    L5_148 = A0_143["WanMode.FailoverPriLogicalIfName"]
    if L5_148 ~= "" then
      L5_148 = A0_143["WanMode.FailoverPriLogicalIfName"]
    elseif L5_148 == nil then
      L5_148 = printCLIError
      L6_149 = "Invalid WAN Type for Auto Rollover WAN Mode\n"
      L5_148(L6_149)
      L5_148 = false
      return L5_148
    end
    L5_148 = A0_143["WanMode.FailureDetectionMeth"]
    if L5_148 ~= "" then
      L5_148 = A0_143["WanMode.FailureDetectionMeth"]
      if L5_148 ~= nil then
        L5_148 = A0_143["WanMode.FailureDetectionMeth"]
      end
    elseif L5_148 == "0" then
      L5_148 = printCLIError
      L6_149 = "Enter valid Failure Detection Method\n"
      L5_148(L6_149)
      L5_148 = false
      return L5_148
    end
    L5_148 = A0_143["WanMode.FailureDetectionMeth"]
    if L5_148 == "2" then
      L5_148 = A0_143["WanMode.FailoverPriLogicalIfName"]
      if L5_148 == "WAN1" then
        L5_148 = A0_143["WanFailure.DnsIp"]
        if L5_148 ~= "" then
          L5_148 = A0_143["WanFailure.DnsIp"]
          if L5_148 ~= nil then
            L5_148 = A0_143["WanFailure.DnsIp"]
            if L5_148 ~= nil then
              L5_148 = A0_143["WanFailure.DnsIp"]
            end
          end
        elseif L5_148 == "0.0.0.0" then
          L5_148 = printCLIError
          L6_149 = "Enter valid WAN1 DNS Address\n"
          L5_148(L6_149)
          L5_148 = false
          return L5_148
        end
      end
      L5_148 = A0_143["WanMode.FailoverPriLogicalIfName"]
      if L5_148 == "WAN2" then
        L5_148 = A0_143["WanFailure.DnsIp1"]
        if L5_148 ~= "" then
          L5_148 = A0_143["WanFailure.DnsIp1"]
          if L5_148 ~= nil then
            L5_148 = A0_143["WanFailure.DnsIp1"]
            if L5_148 ~= nil then
              L5_148 = A0_143["WanFailure.DnsIp1"]
            end
          end
        elseif L5_148 == "0.0.0.0" then
          L5_148 = printCLIError
          L6_149 = "Enter valid WAN2 DNS Address\n"
          L5_148(L6_149)
          L5_148 = false
          return L5_148
        end
      end
      L5_148 = A0_143["WanMode.FailoverPriLogicalIfName"]
      if L5_148 == "WAN3" then
        L5_148 = A0_143["WanFailure.DnsIp2"]
        if L5_148 ~= "" then
          L5_148 = A0_143["WanFailure.DnsIp2"]
          if L5_148 ~= nil then
            L5_148 = A0_143["WanFailure.DnsIp2"]
            if L5_148 ~= nil then
              L5_148 = A0_143["WanFailure.DnsIp2"]
            end
          end
        elseif L5_148 == "0.0.0.0" then
          L5_148 = printCLIError
          L6_149 = "Enter valid WAN3 DNS Address\n"
          L5_148(L6_149)
          L5_148 = false
          return L5_148
        end
      end
    else
      L5_148 = A0_143["WanMode.FailureDetectionMeth"]
      if L5_148 == "3" then
        L5_148 = A0_143["WanMode.FailoverPriLogicalIfName"]
        if L5_148 == "WAN1" then
          L5_148 = A0_143["WanFailure.PingIp"]
          if L5_148 ~= "" then
            L5_148 = A0_143["WanFailure.PingIp"]
            if L5_148 ~= nil then
              L5_148 = A0_143["WanFailure.PingIp"]
              if L5_148 ~= nil then
                L5_148 = A0_143["WanFailure.PingIp"]
              end
            end
          elseif L5_148 == "0.0.0.0" then
            L5_148 = printCLIError
            L6_149 = "Enter valid WAN1 PING Address\n"
            L5_148(L6_149)
            L5_148 = false
            return L5_148
          end
        end
        L5_148 = A0_143["WanMode.FailoverPriLogicalIfName"]
        if L5_148 == "WAN2" then
          L5_148 = A0_143["WanFailure.PingIp1"]
          if L5_148 ~= "" then
            L5_148 = A0_143["WanFailure.PingIp1"]
            if L5_148 ~= nil then
              L5_148 = A0_143["WanFailure.PingIp1"]
              if L5_148 ~= nil then
                L5_148 = A0_143["WanFailure.PingIp1"]
              end
            end
          elseif L5_148 == "0.0.0.0" then
            L5_148 = printCLIError
            L6_149 = "Enter valid WAN2 PING Address\n"
            L5_148(L6_149)
            L5_148 = false
            return L5_148
          end
        end
        L5_148 = A0_143["WanMode.FailoverPriLogicalIfName"]
        if L5_148 == "WAN3" then
          L5_148 = A0_143["WanFailure.PingIp2"]
          if L5_148 ~= "" then
            L5_148 = A0_143["WanFailure.PingIp2"]
            if L5_148 ~= nil then
              L5_148 = A0_143["WanFailure.PingIp2"]
              if L5_148 ~= nil then
                L5_148 = A0_143["WanFailure.PingIp2"]
              end
            end
          elseif L5_148 == "0.0.0.0" then
            L5_148 = printCLIError
            L6_149 = "Enter valid WAN3 PING Address\n"
            L5_148(L6_149)
            L5_148 = false
            return L5_148
          end
        end
      end
    end
    L5_148 = A0_143["WanMode.RetryTime"]
    if L5_148 ~= "" then
      L5_148 = A0_143["WanMode.RetryTime"]
    elseif L5_148 == nil then
      L5_148 = printCLIError
      L6_149 = "Enter valid Retry time\n"
      L5_148(L6_149)
      L5_148 = false
      return L5_148
    end
    L5_148 = A0_143["WanMode.RetryAttempts"]
    if L5_148 ~= "" then
      L5_148 = A0_143["WanMode.RetryAttempts"]
    elseif L5_148 == nil then
      L5_148 = printCLIError
      L6_149 = "Enter valid Retry Attempts\n"
      L5_148(L6_149)
      L5_148 = false
      return L5_148
    end
  end
  L5_148 = A0_143["WanMode.LoadBal"]
  if L5_148 == "3" then
    L5_148 = A0_143["WanMode.LoadTolerance"]
    if L5_148 ~= "" then
      L5_148 = A0_143["WanMode.LoadTolerance"]
      if L5_148 ~= nil then
        L5_148 = A0_143["WanMode.MaxBandwidth"]
        if L5_148 ~= nil then
          L5_148 = A0_143["WanMode.MaxBandwidth"]
        end
      end
    elseif L5_148 == "" then
      L5_148 = printCLIError
      L6_149 = "Give Spill-Over Configuration parameters\n"
      L5_148(L6_149)
      L5_148 = false
      return L5_148
    end
  end
  L5_148 = tonumber
  L6_149 = A0_143["WanMode.Unit"]
  L5_148 = L5_148(L6_149)
  L5_148 = L5_148 + 1
  L6_149 = tonumber
  L6_149 = L6_149(A0_143["WanMode.MaxBandwidth"])
  if not (L6_149 < _UPVALUE7_[L5_148].MIN_BW) then
    L6_149 = tonumber
    L6_149 = L6_149(A0_143["WanMode.MaxBandwidth"])
  elseif L6_149 > _UPVALUE7_[L5_148].MAX_BW then
    L6_149 = printCLIError
    L6_149("Give Correct values for Spill-Over Configuration parameters:\n")
    L6_149 = false
    return L6_149
  end
  L6_149 = tonumber
  L6_149 = L6_149(A0_143["WanMode.LoadTolerance"])
  if not (L6_149 < 20) then
    L6_149 = tonumber
    L6_149 = L6_149(A0_143["WanMode.LoadTolerance"])
  elseif L6_149 > 80 then
    L6_149 = printCLIError
    L6_149("Give Correct values for Spill-Over Configuration parameters:\n")
    L6_149 = false
    return L6_149
  end
  L6_149 = _UPVALUE8_
  L6_149 = L6_149.multiWanModePPPSubnetCheck
  L6_149 = L6_149(A0_143["WanMode.Wanmode"], A0_143["WanMode.DedicatedLogicalIfName"])
  if L6_149 ~= _UPVALUE9_.SUCCESS then
    printCLIError(_UPVALUE10_.errorStringGet(L6_149))
    return false
  end
end
function wanSetupGetMode()
  local L0_150
  L0_150 = {}
  configRow = db.getRow("WanMode", "_ROWID_", "1")
  configRow["WanMode.LoadBal"] = "1"
  if configRow["WanMode.Wanmode"] == "3" then
    configRow["WanMode.LoadBal"] = "3"
  end
  if configRow == nil then
    configRow = {}
  end
  dnsip = db.getAttribute("WanFailure", "LogicalIfName", "WAN1", "DnsIp")
  dnsip1 = db.getAttribute("WanFailure", "LogicalIfName", "WAN2", "DnsIp")
  dnsip2 = db.getAttribute("WanFailure", "LogicalIfName", "WAN3", "DnsIp")
  pingip = db.getAttribute("WanFailure", "LogicalIfName", "WAN1", "PingIp")
  pingip1 = db.getAttribute("WanFailure", "LogicalIfName", "WAN2", "PingIp")
  pingip2 = db.getAttribute("WanFailure", "LogicalIfName", "WAN3", "PingIp")
  resTab.insertField(L0_150, "WAN Mode Configuration", "")
  if configRow["WanMode.Wanmode"] == "0" then
    if configRow["WanMode.DedicatedLogicalIfName"] == "WAN1" then
      resTab.insertField(L0_150, "WAN Mode", "Single Wan Port Using WAN1")
    elseif configRow["WanMode.DedicatedLogicalIfName"] == "WAN2" then
      resTab.insertField(L0_150, "WAN Mode", "Single Wan Port Using WAN2")
    elseif configRow["WanMode.DedicatedLogicalIfName"] == "WAN3" then
      resTab.insertField(L0_150, "WAN Mode", "Single Wan Port Using WAN3")
    end
  elseif configRow["WanMode.Wanmode"] == "1" or configRow["WanMode.Wanmode"] == "3" then
    if configRow["WanMode.Wanmode"] == "3" then
      resTab.insertField(L0_150, "WAN Mode", "LOAD Balancing Using Spill Over Mode")
      resTab.insertField(L0_150, "Load Tolerance", configRow["WanMode.LoadTolerance"])
      resTab.insertField(L0_150, "Max Bandwidth", configRow["WanMode.MaxBandwidth"] .. " " .. ({
        "bps",
        "Kbps",
        "Mbps"
      })[tonumber(configRow["WanMode.Unit"]) + 1])
    else
      resTab.insertField(L0_150, "WAN Mode", "LOAD Balancing Using RoundRobin")
    end
  elseif configRow["WanMode.Wanmode"] == "2" then
    if configRow["WanMode.FailoverPriLogicalIfName"] == "WAN1" then
      resTab.insertField(L0_150, "WAN Mode", "Auto Rollover on Wan Port Using WAN1")
    elseif configRow["WanMode.FailoverPriLogicalIfName"] == "WAN2" then
      resTab.insertField(L0_150, "WAN Mode", "Auto Rollover on Wan Port Using WAN2")
    elseif configRow["WanMode.FailoverPriLogicalIfName"] == "WAN3" then
      resTab.insertField(L0_150, "WAN Mode", "Auto Rollover on Wan Port Using WAN3")
    end
  end
  if configRow["WanMode.FailureDetectionMeth"] == "0" then
    resTab.insertField(L0_150, "WAN Failure Detection Method", "None")
  elseif configRow["WanMode.FailureDetectionMeth"] == "1" then
    resTab.insertField(L0_150, "WAN Failure Detection Method", "DNS lookup using WAN DNS Servers")
  elseif configRow["WanMode.FailureDetectionMeth"] == "2" then
    resTab.insertField(L0_150, "WAN Failure Detection Method", "DNS lookup using DNS Servers")
    resTab.insertField(L0_150, "DNS for WAN1", dnsip)
    resTab.insertField(L0_150, "DNS for WAN2", dnsip1)
    if db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000AC" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000N" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000" then
      resTab.insertField(L0_150, "DNS for WAN3", dnsip2)
    end
  elseif configRow["WanMode.FailureDetectionMeth"] == "3" then
    resTab.insertField(L0_150, "WAN Failure Detection Method", "Ping these IP addresses")
    resTab.insertField(L0_150, "PING IP for WAN1", pingip)
    resTab.insertField(L0_150, "PING IP for WAN2", pingip1)
    if db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000AC" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000N" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000" then
      resTab.insertField(L0_150, "PING IP for WAN3", pingip2)
    end
  end
  resTab.insertField(L0_150, "Retry Time", configRow["WanMode.RetryTime"] or "")
  resTab.insertField(L0_150, "Retry Attempts", configRow["WanMode.RetryAttempts"] or "")
  printLabel("WAN MODE Setup")
  resTab.print(L0_150, 0)
end
function wanPortCfgInit(A0_151)
  local L1_152, L2_153, L3_154
  L1_152 = {}
  L2_153 = {}
  L3_154 = {}
  L1_152 = wan.wanConfigGetWrap("WAN1")
  if db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000N" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500N" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000AC" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500AC" then
    L2_153 = wan.wanConfigGetWrap("WAN2")
  end
  L3_154 = db.getRow("AttackChecks", "_ROWID_", "1")
  L1_152["AttackChecks.ExternalPing"] = L3_154["AttackChecks.ExternalPing"]
  if db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000N" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500N" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000AC" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500AC" then
    L1_152["Wan.DefMtu2"] = L2_153["Wan.DefMtu"] or ""
    L1_152["Wan.MtuSize2"] = L2_153["Wan.MtuSize"] or ""
    L1_152["Wan.portSpeed2"] = L2_153["Wan.portSpeed"] or ""
  end
  return 1, L1_152
end
function wanPortCfgSave(A0_155)
  errorFlag = ""
  statusCode = ""
  statusMessage = ""
  DBTable = "PppoeProfile"
  errorFlag, statusCode = wan.wanConfigSetWrap(A0_155, "1", "edit")
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  return errorFlag, statusMessage
end
function wanPortCfgInputVal(A0_156)
  local L1_157, L2_158, L3_159, L4_160, L5_161, L6_162
  L1_157 = true
  L2_158 = db
  L2_158 = L2_158.getAttribute
  L3_159 = "PowerModeConf"
  L4_160 = "_ROWID_"
  L5_161 = "1"
  L6_162 = "JumboFrameEnable"
  L2_158 = L2_158(L3_159, L4_160, L5_161, L6_162)
  L3_159 = "LogicalIfName = 'WAN1' and AddressFamily = 2"
  L4_160 = db
  L4_160 = L4_160.getRowWhere
  L5_161 = "NimfConf"
  L6_162 = L3_159
  L4_160 = L4_160(L5_161, L6_162)
  L5_161 = L4_160["NimfConf.ConnectionType"]
  L6_162 = "LogicalIfName = 'WAN2' and AddressFamily = 2"
  if A0_156 == {} then
    return false
  end
  if A0_156["AttackChecks.ExternalPing"] == "" or A0_156["AttackChecks.ExternalPing"] == nil then
    printCLIError("Enter Valid External Ping Value\n")
    L1_157 = false
  end
  if A0_156["Wan.DefMtu"] == "" or A0_156["Wan.DefMtu"] == nil then
    printCLIError("Enter Valid MTU Type for WAN1\n")
    L1_157 = false
  end
  if A0_156["Wan.DefMtu"] == "0" then
    if A0_156["Wan.MtuSize"] == "" or A0_156["Wan.MtuSize"] == nil then
      printCLIError("Enter Valid MTU SIZE for WAN1\n")
      L1_157 = false
    end
    if L2_158 == _UPVALUE0_ and tonumber(A0_156["Wan.MtuSize"]) > 1500 then
      printCLIError("Enter Valid MTU SIZE for WAN1, Range :1200-1500 in case when jumbo frame is Disabled\n")
      L1_157 = false
    end
    if L2_158 == _UPVALUE1_ and L5_161 ~= _UPVALUE2_ and L5_161 ~= _UPVALUE3_ and tonumber(A0_156["Wan.MtuSize"]) > 1500 then
      printCLIError("Enter Valid MTU SIZE for WAN1, Range : 1200-1500 when WAN type is not Static and DHCP.\n")
      L1_157 = false
    end
  end
  if A0_156["Wan.portSpeed"] == "" or A0_156["Wan.portSpeed"] == nil then
    printCLIError("Enter Valid Port Speed for WAN1\n")
    L1_157 = false
  end
  if db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000N" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500N" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000AC" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500AC" then
    if A0_156["Wan.DefMtu2"] == "" or A0_156["Wan.DefMtu2"] == nil then
      printCLIError("Enter Valid MTU Type for WAN2\n")
      L1_157 = false
    end
    if A0_156["Wan.DefMtu2"] == "0" then
      if A0_156["Wan.MtuSize2"] == "" or A0_156["Wan.MtuSize2"] == nil then
        printCLIError("Enter Valid MTU SIZE for WAN2\n")
        L1_157 = false
      end
      if L2_158 == _UPVALUE0_ and 1500 < tonumber(A0_156["Wan.MtuSize2"]) then
        printCLIError("Enter Valid MTU SIZE for WAN2, 1200-1500 in case when jumbo frame is Disabled\n")
        L1_157 = false
      end
      if L2_158 == _UPVALUE1_ and db.getRowWhere("NimfConf", L6_162)["NimfConf.ConnectionType"] ~= _UPVALUE2_ and db.getRowWhere("NimfConf", L6_162)["NimfConf.ConnectionType"] ~= _UPVALUE3_ and 1500 < tonumber(A0_156["Wan.MtuSize2"]) then
        printCLIError("Enter Valid MTU SIZE for WAN1, Range : 1200-1500 when WAN type is not Static and DHCP.\n")
        L1_157 = false
      end
    end
    if A0_156["Wan.portSpeed2"] == "" or A0_156["Wan.portSpeed2"] == nil then
      printCLIError("Enter Valid Port Speed for WAN2\n")
      L1_157 = false
    end
  end
  return L1_157
end
function wanPortCfgGet(A0_163)
  local L1_164, L2_165, L3_166, L4_167, L5_168, L6_169, L7_170, L8_171, L9_172, L10_173, L11_174
  L1_164 = {}
  L2_165 = {}
  L3_166 = {}
  L4_167, L5_168, L6_169, L7_170 = nil, nil, nil, nil
  L8_171 = db
  L8_171 = L8_171.getAttribute
  L9_172 = "unitInfo"
  L10_173 = "_ROWID_"
  L11_174 = "1"
  L8_171 = L8_171(L9_172, L10_173, L11_174, "modelId")
  L9_172 = wan
  L9_172 = L9_172.wanConfigGetWrap
  L10_173 = "WAN1"
  L9_172 = L9_172(L10_173)
  L1_164 = L9_172
  L9_172 = "LogicalIfName = 'WAN1' and AddressFamily = '2'"
  L10_173 = db
  L10_173 = L10_173.getAttributeWhere
  L11_174 = "NimfStatus"
  L10_173 = L10_173(L11_174, L9_172, "Linkstatus")
  if L8_171 ~= "DSR-250N" and L8_171 ~= "DSR-250" and L8_171 ~= "DSR-150" and L8_171 ~= "DSR-150N" then
    L11_174 = wan
    L11_174 = L11_174.wanConfigGetWrap
    L11_174 = L11_174("WAN2")
    L2_165 = L11_174
    L11_174 = db
    L11_174 = L11_174.getAttribute
    L11_174 = L11_174("ConfigPort", "_ROWID_", "1", "LogicalIfName")
    L7_170 = L11_174
    L9_172 = "LogicalIfName = 'WAN2' and AddressFamily = '2'"
    L11_174 = db
    L11_174 = L11_174.getAttributeWhere
    L11_174 = L11_174("NimfStatus", L9_172, "Linkstatus")
    L6_169 = L11_174
  end
  L11_174 = db
  L11_174 = L11_174.getRow
  L11_174 = L11_174("AttackChecks", "_ROWID_", "1")
  L3_166 = L11_174
  L11_174 = nil
  if L8_171 == "DWC-1000" then
    L11_174 = vpnLicenseStatusGet()
  end
  printLabel("WAN Port Setup")
  if L3_166["AttackChecks.ExternalPing"] == "1" then
    print("Respond to Ping:", "Enabled")
  else
    print("Respond to Ping:", "Disabled")
  end
  printLabel("WAN1 Port Setup")
  if L1_164["Wan.DefMtu"] == "0" then
    print("MTU Type:", "Custom")
    print("MTU Size:", L1_164["Wan.MtuSize"] or "")
  else
    print("MTU Type:", "Default")
  end
  if L1_164["Wan.AutoNegEnable"] == "1" then
    if L1_164["Wan.portSpeed"] == "6" then
      print("Port Speed(Configured):", "1000 BaseT Full Duplex")
    else
      print("Port Speed(Configured):", "Auto Sense")
    end
    if L10_173 == "LINK DOWN" then
      print("Port Speed(Actual):", "Link is down")
    elseif L1_164["Wan.linkSpeed"] == "1" then
      print("Port Speed(Actual):", "10 BaseT Half Duplex")
    elseif L1_164["Wan.linkSpeed"] == "2" then
      print("Port Speed(Actual):", "10 BaseT Full Duplex")
    elseif L1_164["Wan.linkSpeed"] == "3" then
      print("Port Speed(Actual):", "100 BaseT Half Duplex")
    elseif L1_164["Wan.linkSpeed"] == "4" then
      print("Port Speed(Actual):", "100 BaseT Full Duplex")
    elseif L1_164["Wan.linkSpeed"] == "5" then
      print("Port Speed(Actual):", "1000 BaseT Half Duplex")
    elseif L1_164["Wan.linkSpeed"] == "6" then
      print("Port Speed(Actual):", "1000 BaseT Full Duplex")
    end
  elseif L1_164["Wan.AutoNegEnable"] == "0" then
    if L1_164["Wan.portSpeed"] == "1" then
      L4_167 = "10 BaseT Half Duplex"
    elseif L1_164["Wan.portSpeed"] == "2" then
      L4_167 = "10 BaseT Full Duplex"
    elseif L1_164["Wan.portSpeed"] == "3" then
      L4_167 = "100 BaseT Half Duplex"
    elseif L1_164["Wan.portSpeed"] == "4" then
      L4_167 = "100 BaseT Full Duplex"
    elseif L1_164["Wan.portSpeed"] == "5" then
      L4_167 = "1000 BaseT Half Duplex"
    elseif L1_164["Wan.portSpeed"] == "6" then
      L4_167 = "1000 BaseT Full Duplex"
    end
    if L10_173 == "LINK DOWN" then
      print("Port Speed(Configured): " .. L4_167 .. " (Link is down)")
    else
      print("Port Speed(Configured): " .. L4_167)
    end
  end
  if L8_171 ~= "DSR-250N" and L8_171 ~= "DSR-250" and L8_171 ~= "DSR-150N" and L8_171 ~= "DSR-150" then
    printLabel("WAN2 Port Setup")
    print("Configurable Port: " .. L7_170)
    if L7_170 ~= "DMZ" then
      if L2_165["Wan.DefMtu"] == "0" then
        print("MTU Type:", "Custom")
        print("MTU Size:", L2_165["Wan.MtuSize"] or "")
      else
        print("MTU Type:", "Default")
      end
      if L2_165["Wan.AutoNegEnable"] == "1" then
        if L2_165["Wan.portSpeed"] == "6" then
          print("Port Speed(Configured):", "1000 BaseT Full Duplex")
        else
          print("Port Speed(Configured):", "Auto Sense")
        end
        if L6_169 == "LINK DOWN" then
          print("Port Speed(Actual):", "Link is down")
        elseif L2_165["Wan.linkSpeed"] == "1" then
          print("Port Speed(Actual):", "10 BaseT Half Duplex")
        elseif L2_165["Wan.linkSpeed"] == "2" then
          print("Port Speed(Actual):", "10 BaseT Full Duplex")
        elseif L2_165["Wan.linkSpeed"] == "3" then
          print("Port Speed(Actual):", "100 BaseT Half Duplex")
        elseif L2_165["Wan.linkSpeed"] == "4" then
          print("Port Speed(Actual):", "100 BaseT Full Duplex")
        elseif L2_165["Wan.linkSpeed"] == "5" then
          print("Port Speed(Actual):", "1000 BaseT Half Duplex")
        elseif L2_165["Wan.linkSpeed"] == "6" then
          print("Port Speed(Actual):", "1000 BaseT Full Duplex")
        end
      elseif L2_165["Wan.AutoNegEnable"] == "0" then
        if L2_165["Wan.portSpeed"] == "1" then
          L5_168 = "10 BaseT Half Duplex"
        elseif L2_165["Wan.portSpeed"] == "2" then
          L5_168 = "10 BaseT Full Duplex"
        elseif L2_165["Wan.portSpeed"] == "3" then
          L5_168 = "100 BaseT Half Duplex"
        elseif L2_165["Wan.portSpeed"] == "4" then
          L5_168 = "100 BaseT Full Duplex"
        elseif L2_165["Wan.portSpeed"] == "5" then
          L5_168 = "1000 BaseT Half Duplex"
        elseif L2_165["Wan.portSpeed"] == "6" then
          L5_168 = "1000 BaseT Full Duplex"
        end
        if L6_169 == "LINK DOWN" then
          print("Port Speed(Configured): " .. L5_168 .. " (Link is down)")
        else
          print("Port Speed(Configured): " .. L5_168)
        end
      end
    end
  end
end
function wanConfigPortCfgInit(A0_175)
  local L1_176
  L1_176 = {}
  L1_176 = db.getRow("ConfigPort", "_ROWID_", "1")
  if L1_176 == nil then
    L1_176 = db.getDefaults(true, "ConfigPort")
  end
  return 1, L1_176
end
function wanConfigPortCfgSave(A0_177)
  local L1_178, L2_179, L3_180
  L1_178 = ""
  errorFlag = L1_178
  L1_178 = ""
  statusCode = L1_178
  L1_178 = ""
  statusMessage = L1_178
  L1_178 = "ConfigPort"
  DBTable = L1_178
  L1_178 = nimfView
  L1_178 = L1_178.checkOptionWanTables
  L2_179 = A0_177
  L2_179 = L1_178(L2_179)
  statusCode = L2_179
  errorFlag = L1_178
  L1_178 = errorFlag
  if L1_178 == "OK" then
    L1_178 = nimfView
    L1_178 = L1_178.configurablePortUsageCheck
    L2_179 = A0_177
    L2_179 = L1_178(L2_179)
    statusCode = L2_179
    errorFlag = L1_178
    L1_178 = db
    L1_178 = L1_178.getAttribute
    L2_179 = "ConfigPort"
    L3_180 = "_ROWID_"
    L1_178 = L1_178(L2_179, L3_180, "1", "LogicalIfName")
    L2_179 = errorFlag
    if L2_179 == "OK" then
      L2_179 = nimfView
      L2_179 = L2_179.portModeConfig
      L3_180 = A0_177
      L3_180 = L2_179(L3_180, "1", "edit")
      statusCode = L3_180
      errorFlag = L2_179
    end
    L2_179 = errorFlag
    if L2_179 == "OK" then
      L2_179 = vlanConfig
      L2_179 = L2_179.portMgmtUpdate
      L3_180 = A0_177
      L3_180 = L2_179(L3_180)
      statusCode = L3_180
      errorFlag = L2_179
    end
    L2_179 = errorFlag
    if L2_179 == "OK" then
      L2_179 = db
      L2_179 = L2_179.save
      L2_179()
      L2_179 = db
      L2_179 = L2_179.getAttribute
      L3_180 = "ConfigPort"
      L2_179 = L2_179(L3_180, "_ROWID_", "1", "LogicalIfName")
      if L1_178 ~= L2_179 then
        if L1_178 == "WAN2" then
          L3_180 = db
          L3_180 = L3_180.getRowWhere
          L3_180 = L3_180("NimfConf", "LogicalIfName = 'WAN2' and AddressFamily = 2")
          if L3_180 ~= nil then
            db.setAttribute("NimfConf", "_ROWID_", L3_180["NimfConf._ROWID_"], "LogicalIfName", L3_180["NimfConf.LogicalIfName"])
          end
        elseif L1_178 == "LAN" then
          L3_180 = db
          L3_180 = L3_180.getRowWhere
          L3_180 = L3_180("ifStatic", "LogicalIfName = 'LAN' and AddressFamily = 2")
          if L3_180 ~= nil then
            db.setAttribute("ifStatic", "_ROWID_", L3_180["ifStatic._ROWID_"], "LogicalIfName", L3_180["ifStatic.LogicalIfName"])
          end
        elseif L1_178 == "DMZ" then
          L3_180 = db
          L3_180 = L3_180.getRowWhere
          L3_180 = L3_180("ifStatic", "LogicalIfName = 'DMZ' and AddressFamily = 2")
          if L3_180 ~= nil then
            db.setAttribute("ifStatic", "_ROWID_", L3_180["ifStatic._ROWID_"], "LogicalIfName", L3_180["ifStatic.LogicalIfName"])
          end
        end
        L3_180 = db
        L3_180 = L3_180.getAttribute
        L3_180 = L3_180("environment", "name", "CONFIG_PORT_UPDATE", "value")
        if L3_180 ~= nil then
          util.appendDebugOut("Exec = " .. os.execute(L3_180 .. " " .. L1_178 .. " " .. L2_179))
        end
        if L2_179 == "WAN2" then
          if db.getRowWhere("NimfConf", "LogicalIfName = 'WAN2' and AddressFamily = 2") ~= nil then
            db.setAttribute("NimfConf", "_ROWID_", db.getRowWhere("NimfConf", "LogicalIfName = 'WAN2' and AddressFamily = 2")["NimfConf._ROWID_"], "LogicalIfName", db.getRowWhere("NimfConf", "LogicalIfName = 'WAN2' and AddressFamily = 2")["NimfConf.LogicalIfName"])
          end
        elseif L2_179 == "LAN" then
          if db.getRowWhere("ifStatic", "LogicalIfName = 'LAN' and AddressFamily = 2") ~= nil then
            db.setAttribute("ifStatic", "_ROWID_", db.getRowWhere("ifStatic", "LogicalIfName = 'LAN' and AddressFamily = 2")["ifStatic._ROWID_"], "LogicalIfName", db.getRowWhere("ifStatic", "LogicalIfName = 'LAN' and AddressFamily = 2")["ifStatic.LogicalIfName"])
          end
        elseif L2_179 == "DMZ" and db.getRowWhere("ifStatic", "LogicalIfName = 'DMZ' and AddressFamily = 2") ~= nil then
          db.setAttribute("ifStatic", "_ROWID_", db.getRowWhere("ifStatic", "LogicalIfName = 'DMZ' and AddressFamily = 2")["ifStatic._ROWID_"], "LogicalIfName", db.getRowWhere("ifStatic", "LogicalIfName = 'DMZ' and AddressFamily = 2")["ifStatic.LogicalIfName"])
        end
      end
    end
  end
  L1_178 = db
  L1_178 = L1_178.getAttribute
  L2_179 = "stringsMap"
  L3_180 = "stringId"
  L1_178 = L1_178(L2_179, L3_180, statusCode, LANGUAGE)
  L1_178 = L1_178 or statusCode
  statusMessage = L1_178
  L1_178 = errorFlag
  L2_179 = statusMessage
  return L1_178, L2_179
end
function wanConfigPortCfgInputVal(A0_181)
  local L1_182
  L1_182 = true
  if A0_181 == {} then
    return false
  end
  if A0_181["ConfigPort.LogicalIfName"] == "" or A0_181["ConfigPort.LogicalIfName"] == nil or A0_181["ConfigPort.LogicalIfName"] ~= "WAN2" and A0_181["ConfigPort.LogicalIfName"] ~= "DMZ" then
    printCLIError("Enter Valid Port Name\n")
    return false
  end
  if db.getRow("WanMode", "_ROWID_", "1") ~= nil then
    if db.getRow("WanMode", "_ROWID_", "1")["WanMode.Wanmode"] ~= nil and db.getRow("WanMode", "_ROWID_", "1")["WanMode.Wanmode"] == "0" then
      if db.getRow("WanMode", "_ROWID_", "1")["WanMode.DedicatedLogicalIfName"] ~= nil and db.getRow("WanMode", "_ROWID_", "1")["WanMode.DedicatedLogicalIfName"] ~= "WAN2" then
      elseif A0_181["ConfigPort.LogicalIfName"] == "DMZ" then
        L1_182 = false
        printCLIError("WAN Mode is Dedicated WAN2. So you can't configure the configurable port as DMZ\n")
      end
    elseif db.getRow("WanMode", "_ROWID_", "1")["WanMode.Wanmode"] ~= nil and db.getRow("WanMode", "_ROWID_", "1")["WanMode.Wanmode"] == "2" then
      if (db.getRow("WanMode", "_ROWID_", "1")["WanMode.FailoverPriLogicalIfName"] ~= nil and db.getRow("WanMode", "_ROWID_", "1")["WanMode.FailoverPriLogicalIfName"] == "WAN2" or db.getRow("WanMode", "_ROWID_", "1")["WanMode.FailoverSecLogicalIfName"] ~= nil and db.getRow("WanMode", "_ROWID_", "1")["WanMode.FailoverSecLogicalIfName"] == "WAN2") and A0_181["ConfigPort.LogicalIfName"] == "DMZ" then
        L1_182 = false
        printCLIError("DMZ cannot be configured when WAN2 is configured as Primary/Secondary WAN port \n" .. "in Auto-rollover mode")
      end
    elseif db.getRow("WanMode", "_ROWID_", "1")["WanMode.Wanmode"] ~= nil and (db.getRow("WanMode", "_ROWID_", "1")["WanMode.Wanmode"] == "1" or db.getRow("WanMode", "_ROWID_", "1")["WanMode.Wanmode"] == "3") and A0_181["ConfigPort.LogicalIfName"] == "DMZ" then
      L1_182 = false
      printCLIError("DMZ cannot be configured when WAN Mode is configured as Load Balancing")
    end
  end
  return L1_182
end
function wanConfigPortCfgGet(A0_183)
  local L1_184
  L1_184 = {}
  L1_184 = db.getRow("ConfigPort", "_ROWID_", "1")
  if L1_184 == nil then
    L1_184 = db.getDefaults(true, "ConfigPort")
  end
  printLabel("Configurable Port ")
  print("Port Selected :", L1_184["ConfigPort.LogicalIfName"] or "")
end
function nimfCfgInitWan3(A0_185)
  local L1_186
  L1_186 = {}
  L1_186 = nimfView.wanConfigurationGet("WAN3")
  L1_186["Wan.UserName"] = ""
  L1_186["Wan.Password"] = ""
  return 1, L1_186
end
function nimfCfgSaveWan3(A0_187)
  local L1_188, L2_189, L3_190
  L1_188 = "ERROR"
  L2_189 = ""
  L3_190 = ""
  _UPVALUE0_.start()
  A0_187["NimfConf.LogicalIfName"] = "WAN3"
  L1_188, L2_189 = nimfView.wanConfigSet(A0_187, "1", "edit")
  if L1_188 == "OK" then
    _UPVALUE0_.complete()
    _UPVALUE0_.save()
  else
    _UPVALUE0_.abort()
  end
  L3_190 = db.getAttribute("stringsMap", "stringId", L2_189, LANGUAGE) or L2_189
  return L1_188, L3_190
end
function nimfCfgInputValWan3(A0_191)
  if A0_191["Wan.IdleTimeOutFlag"] == "1" and (A0_191["Wan.IdleTime"] == nil or A0_191["Wan.IdleTime"] == "") then
    printCLIError("Please Enter a valid Idle Time")
    return false
  end
  if A0_191["Wan.IdleTimeOutFlag"] == "1" then
    if db.getAttribute("WanMode", "_ROWID_", "1", "Wanmode") == _UPVALUE0_ or db.getAttribute("WanMode", "_ROWID_", "1", "Wanmode") == _UPVALUE1_ then
      printCLIError("Reconnect mode On Demand is not supported for Mobile Internet in Load Balancing mode")
      return false
    end
    if tonumber(A0_191["Wan.IdleTime"]) >= 0 and tonumber(A0_191["Wan.IdleTime"]) < 5 then
      printCLIError("Idletime out error: Value entered does not fall in allowed range")
      return false
    end
  end
  if A0_191["Wan.DialNumber"] == "" or A0_191["Wan.DialNumber"] == nil then
    printCLIError("Please enter a valid Dial Number")
    return false
  end
  if A0_191["Wan.APN"] == "" or A0_191["Wan.APN"] == nil then
    printCLIError("Please enter a valid APN for Mobile Internet Connection.")
    return false
  end
  if A0_191["Wan.IsDNSDyn"] == "0" then
    if A0_191["Wan.PriDnsIpAddr"] == nil or A0_191["Wan.PriDnsIpAddr"] == "" then
      printCLIError("Please enter a valid Ip Address")
      return false
    end
    if tonumber(util.split(A0_191["Wan.PriDnsIpAddr"], ".")[1]) == 224 or tonumber(util.split(A0_191["Wan.PriDnsIpAddr"], ".")[1]) > 224 then
      printCLIError("Invalid IP address. Please enter a value between 1 - 223 for octet 1")
      return false
    end
    if _UPVALUE2_.ipv4SingleMaskCheck(_UPVALUE3_, A0_191["Wan.PriDnsIpAddr"], _UPVALUE4_) == _UPVALUE5_.SUCCESS then
      printCLIError("Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet.")
      return false
    end
  end
  if A0_191["Wan.IsDNSDyn"] == "0" and (A0_191["Wan.SecDnsIpAddr"] == nil or A0_191["Wan.SecDnsIpAddr"] == "") then
    printCLIError("Please enter a valid Ip Address")
    return false
  end
  Octet = util.split(A0_191["Wan.SecDnsIpAddr"], ".")
  if tonumber(Octet[1]) == 224 or 224 < tonumber(Octet[1]) then
    printCLIError("Invalid IP address. Please enter a value between 1 - 223 for octet 1")
    return false
  end
  if A0_191["Wan.IsDNSDyn"] == "0" then
    if A0_191["Wan.SecDnsIpAddr"] == "0.0.0.0" or A0_191["Wan.PriDnsIpAddr"] == "0.0.0.0" then
      printCLIError("Invalid IP address. Please enter a value between 1 - 223 for octet 1")
      return false
    end
    if _UPVALUE2_.ipv4SingleMaskCheck(_UPVALUE3_, A0_191["Wan.SecDnsIpAddr"], _UPVALUE4_) == _UPVALUE5_.SUCCESS then
      printCLIError("Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet.")
      return false
    end
  end
  if string.len(A0_191["Wan.APN"]) > 64 then
    printCLIError("APN(Access Point Name) length can be upto 64 characters only")
    return false
  end
  if string.len(A0_191["Wan.DialNumber"]) > 32 then
    printCLIError("Dial Number length can be upto 32 characters only")
    return false
  end
  if string.len(A0_191["Wan.UserName"]) > 32 then
    printCLIError("User Name length can be upto 32 characters only")
    return false
  end
  if string.len(A0_191["Wan.Password"]) > 64 then
    printCLIError("Password length can be upto 64 characters only")
    return false
  end
  return true
end
function wanSetupGetWan3()
  local L0_192
  L0_192 = {}
  configRow = nimfView.wanConfigurationGet("WAN3")
  configRow["NimfConf.ConnectionType"] = "threeg"
  if configRow["NimfConf.ConnectionType"] == "threeg" then
    resTab.insertField(L0_192, "Mobile Internet Configuration", "")
    resTab.insertField(L0_192, "Username", configRow["Wan.UserName"] or "")
    resTab.insertField(L0_192, "Password", util.mask(configRow["Wan.Password"]) or "")
    resTab.insertField(L0_192, "Dial Number", configRow["Wan.DialNumber"] or "")
    if configRow["Wan.AuthMethod"] == "0" then
      resTab.insertField(L0_192, "AuthMethod", "NONE")
    elseif configRow["Wan.AuthMethod"] == "1" then
      resTab.insertField(L0_192, "AuthMethod", "PAP")
    elseif configRow["Wan.AuthMethod"] == "2" then
      resTab.insertField(L0_192, "AuthMethod", "CHAP")
    end
    resTab.insertField(L0_192, "APN", configRow["Wan.APN"] or "")
    if configRow["Wan.IdleTimeOutFlag"] == "0" then
      resTab.insertField(L0_192, "Connectivity Type", "Keep Connected")
    elseif configRow["Wan.IdleTimeOutFlag"] == "1" then
      resTab.insertField(L0_192, "Connectivity Type", "Idle Time")
      resTab.insertField(L0_192, "Idle Time (in minutes)", configRow["Wan.IdleTime"])
    end
    if configRow["Wan.IsDNSDyn"] == "0" then
      resTab.insertField(L0_192, "Domain Name Servers (DNS) Source", "Use these DNS Servers")
      resTab.insertField(L0_192, "Primary DNS Server", configRow["Wan.PriDnsIpAddr"] or "")
      resTab.insertField(L0_192, "Secondary DNS Server", configRow["Wan.SecDnsIpAddr"] or "")
    else
      resTab.insertField(L0_192, "Domain Name Servers (DNS) Source", "Get Dynamically From ISP")
    end
  end
  printLabel("WAN3 Setup")
  resTab.print(L0_192, 0)
end
function wanStatusGetWan3()
  local L0_193, L1_194, L2_195, L3_196, L4_197, L5_198, L6_199, L7_200, L8_201, L9_202, L10_203, L11_204, L12_205, L13_206, L14_207, L15_208, L16_209, L17_210, L18_211, L19_212, L20_213, L21_214, L22_215, L23_216, L24_217, L25_218, L26_219
  L0_193 = {}
  L1_194 = "WAN3"
  logIfName = L1_194
  L1_194 = db
  L1_194 = L1_194.getAttribute
  L2_195 = "environment"
  L3_196 = "name"
  L4_197 = "NIMFSTATUS_PROGRAM"
  L5_198 = "value"
  L1_194 = L1_194(L2_195, L3_196, L4_197, L5_198)
  if L1_194 ~= nil then
    L2_195 = util
    L2_195 = L2_195.appendDebugOut
    L3_196 = "Exec = "
    L4_197 = os
    L4_197 = L4_197.execute
    L5_198 = L1_194
    L6_199 = " "
    L7_200 = DB_FILE_NAME
    L8_201 = " WAN3 2"
    L5_198 = L5_198 .. L6_199 .. L7_200 .. L8_201
    L4_197 = L4_197(L5_198)
    L3_196 = L3_196 .. L4_197
    L2_195(L3_196)
    L2_195 = util
    L2_195 = L2_195.appendDebugOut
    L3_196 = "Exec = "
    L4_197 = os
    L4_197 = L4_197.execute
    L5_198 = L1_194
    L6_199 = " "
    L7_200 = DB_FILE_NAME
    L8_201 = " WAN3 2"
    L5_198 = L5_198 .. L6_199 .. L7_200 .. L8_201
    L4_197 = L4_197(L5_198)
    L3_196 = L3_196 .. L4_197
    L2_195(L3_196)
  end
  L2_195 = "2"
  addressFamily = L2_195
  L2_195 = nimfView
  L2_195 = L2_195.wanStatusGetWrap
  L3_196 = logIfName
  L4_197 = addressFamily
  L2_195 = L2_195(L3_196, L4_197)
  configRow = L2_195
  L2_195 = configRow
  L2_195 = L2_195["Wan.operation"]
  L2_195 = L2_195 or ""
  L3_196 = "LogicalIfName = 'WAN3' and addressFamily = 2"
  L4_197 = db
  L4_197 = L4_197.getRowWhere
  L5_198 = "NimfConf"
  L6_199 = L3_196
  L4_197 = L4_197(L5_198, L6_199)
  L4_197 = L4_197 or {}
  L5_198 = db
  L5_198 = L5_198.getRowsWhere
  L6_199 = "ipAddressTable"
  L7_200 = L3_196
  L5_198 = L5_198(L6_199, L7_200)
  L6_199 = db
  L6_199 = L6_199.getRowsWhere
  L7_200 = "resolverConfig"
  L8_201 = L3_196
  L6_199 = L6_199(L7_200, L8_201)
  L7_200 = db
  L7_200 = L7_200.getRows
  L8_201 = "defaultRouters"
  L9_202 = "LogicalIfName"
  L10_203 = "WAN3"
  L7_200 = L7_200(L8_201, L9_202, L10_203)
  L8_201 = db
  L8_201 = L8_201.getAttribute
  L9_202 = "networkInterface"
  L10_203 = "LogicalIfName"
  L11_204 = "WAN3"
  L12_205 = "interfaceName"
  L8_201 = L8_201(L9_202, L10_203, L11_204, L12_205)
  L9_202 = db
  L9_202 = L9_202.getAttribute
  L10_203 = "networkInterface"
  L11_204 = "LogicalIfName"
  L12_205 = "WAN3"
  L13_206 = "IfStatus"
  L9_202 = L9_202(L10_203, L11_204, L12_205, L13_206)
  L9_202 = L9_202 or ""
  L10_203 = ""
  L11_204 = ""
  L12_205 = ""
  L13_206 = ""
  L14_207 = ""
  L15_208 = ""
  L16_209 = {}
  L17_210 = {}
  if L8_201 ~= nil then
    L18_211 = nimfView
    L18_211 = L18_211.macAddressGet
    L19_212 = logIfName
    L18_211 = L18_211(L19_212)
    L10_203 = L18_211
  end
  L4_197["NimfConf.ConnectionType"] = "threeg"
  L13_206 = "Mobile Internet"
  L12_205 = "Mobile Internet"
  L18_211 = db
  L18_211 = L18_211.getRowWhere
  L19_212 = "NimfStatus"
  L20_213 = L3_196
  L18_211 = L18_211(L19_212, L20_213)
  if L18_211 ~= nil then
    L19_212 = L18_211["NimfStatus.Nimfstatus"]
    L14_207 = L19_212 or ""
  end
  L19_212 = db
  L19_212 = L19_212.getRowWhere
  L20_213 = "NimfStatus"
  L21_214 = L3_196
  L19_212 = L19_212(L20_213, L21_214)
  if L19_212 ~= nil then
    L20_213 = L19_212["NimfStatus.Linkstatus"]
    L15_208 = L20_213 or ""
  end
  L20_213 = db
  L20_213 = L20_213.getAttribute
  L21_214 = "NatTable"
  L20_213 = L20_213(L21_214, L22_215, L23_216, L24_217)
  if L20_213 == "1" then
    L11_204 = "Enabled"
  else
    L11_204 = "Disabled"
  end
  L20_213 = resTab
  L20_213 = L20_213.insertField
  L21_214 = L0_193
  L20_213(L21_214, L22_215, L23_216)
  L20_213 = resTab
  L20_213 = L20_213.insertField
  L21_214 = L0_193
  L23_216 = L10_203 or ""
  L20_213(L21_214, L22_215, L23_216)
  L20_213 = ""
  L21_214 = 0
  if L13_206 ~= "JPPPOE" and L5_198 then
    for L25_218, L26_219 in L22_215(L23_216) do
      L21_214 = L21_214 + 1
      L20_213 = L20_213 .. L5_198[L21_214]["ipAddressTable.ipAddress"] .. " / " .. L5_198[L21_214]["ipAddressTable.subnetMask"]
      if L21_214 ~= #L5_198 then
        L20_213 = L20_213 .. ", "
      end
    end
  end
  L25_218 = L20_213 or ""
  L22_215(L23_216, L24_217, L25_218)
  if L9_202 == "1" then
    L9_202 = "UP"
  elseif L9_202 == "2" then
    L9_202 = "UP(IPv6)"
  elseif L9_202 == "3" then
    L9_202 = "UP(IPv4 and IPv6)"
  elseif L9_202 == "0" then
    L9_202 = "DOWN"
  end
  L25_218 = L9_202 or ""
  L22_215(L23_216, L24_217, L25_218)
  L25_218 = L11_204 or ""
  L22_215(L23_216, L24_217, L25_218)
  L25_218 = L13_206 or ""
  L22_215(L23_216, L24_217, L25_218)
  L25_218 = L14_207 or ""
  L22_215(L23_216, L24_217, L25_218)
  L25_218 = L15_208 or ""
  L22_215(L23_216, L24_217, L25_218)
  L25_218 = "_ROWID_"
  if L23_216 ~= nil then
    L25_218 = L23_216["WanMode.Wanmode"]
    if L25_218 == "2" then
    else
    end
    if L24_217 ~= nil then
      if L24_217 == "WAN1" then
      elseif L24_217 == "WAN2" then
      else
      end
    else
    end
    L25_218 = L23_216["WanMode.Wanmode"]
    if L25_218 == "2" then
      L25_218 = "Auto-Rollover using WAN port"
    else
      L25_218 = L23_216["WanMode.Wanmode"]
      if L25_218 == "1" then
      else
        L25_218 = L23_216["WanMode.Wanmode"]
        if L25_218 == "3" then
        else
          L25_218 = L23_216["WanMode.Wanmode"]
          if L25_218 == "0" then
            L25_218 = "Use only single WAN port "
          end
        end
      end
    end
  end
  L25_218 = L0_193
  L24_217(L25_218, L26_219, L22_215 or "")
  if L7_200 then
    L25_218 = 0
    for _FORV_29_, _FORV_30_ in L26_219(L7_200) do
      L25_218 = L25_218 + 1
      if L7_200[L25_218]["defaultRouters.nextHopGateway"] ~= nil and L7_200[L25_218]["defaultRouters.nextHopGateway"] ~= "" and L24_217 == "" then
      else
      end
    end
  end
  L25_218 = resTab
  L25_218 = L25_218.insertField
  L25_218(L26_219, "Gateway", L24_217 or "")
  L25_218 = ""
  if L6_199 then
    for _FORV_30_, _FORV_31_ in pairs(L6_199) do
      if L6_199[L26_219]["resolverConfig.nameserver1"] ~= nil and L6_199[L26_219]["resolverConfig.nameserver1"] ~= "" and L25_218 == "" then
        L25_218 = L25_218 .. L6_199[L26_219]["resolverConfig.nameserver1"]
      else
      end
    end
  end
  L26_219(L0_193, "Primary DNS", L25_218 or "")
  if L6_199 then
    for _FORV_31_, _FORV_32_ in pairs(L6_199) do
      if L6_199[0 + 1]["resolverConfig.nameserver2"] ~= nil and L6_199[0 + 1]["resolverConfig.nameserver2"] ~= "" and L26_219 == "" then
      else
      end
    end
  end
  resTab.insertField(L0_193, "Secondary DNS", L26_219 or "")
  printLabel("WAN3 Mobile Internet Status")
  resTab.print(L0_193, 0)
end
function rolloverWanStatus()
  local L0_220, L1_221, L2_222, L3_223, L4_224, L5_225, L6_226, L7_227, L8_228, L9_229, L10_230, L11_231, L12_232, L13_233, L14_234, L15_235, L16_236, L17_237, L18_238, L19_239, L20_240, L21_241, L22_242, L23_243, L24_244, L25_245
  L0_220 = {}
  L1_221 = "WAN2"
  logIfName = L1_221
  L1_221 = "2"
  addressFamily = L1_221
  L1_221 = nimfView
  L1_221 = L1_221.wanStatusGetWrap
  L2_222 = logIfName
  L3_223 = addressFamily
  L1_221 = L1_221(L2_222, L3_223)
  configRow = L1_221
  L1_221 = configRow
  L1_221 = L1_221["Wan.operation"]
  L1_221 = L1_221 or ""
  L2_222 = "LogicalIfName = 'WAN2' and addressFamily = 2"
  L3_223 = db
  L3_223 = L3_223.getRowWhere
  L4_224 = "NimfConf"
  L5_225 = L2_222
  L3_223 = L3_223(L4_224, L5_225)
  L3_223 = L3_223 or {}
  L4_224 = db
  L4_224 = L4_224.getRowsWhere
  L5_225 = "ipAddressTable"
  L6_226 = L2_222
  L4_224 = L4_224(L5_225, L6_226)
  L5_225 = db
  L5_225 = L5_225.getRowsWhere
  L6_226 = "resolverConfig"
  L7_227 = L2_222
  L5_225 = L5_225(L6_226, L7_227)
  L6_226 = db
  L6_226 = L6_226.getRows
  L7_227 = "defaultRouters"
  L8_228 = "LogicalIfName"
  L9_229 = "WAN2"
  L6_226 = L6_226(L7_227, L8_228, L9_229)
  L7_227 = db
  L7_227 = L7_227.getAttribute
  L8_228 = "networkInterface"
  L9_229 = "LogicalIfName"
  L10_230 = "WAN2"
  L11_231 = "interfaceName"
  L7_227 = L7_227(L8_228, L9_229, L10_230, L11_231)
  L8_228 = db
  L8_228 = L8_228.getAttribute
  L9_229 = "networkInterface"
  L10_230 = "LogicalIfName"
  L11_231 = "WAN2"
  L12_232 = "IfStatus"
  L8_228 = L8_228(L9_229, L10_230, L11_231, L12_232)
  L8_228 = L8_228 or ""
  L9_229 = ""
  L10_230 = ""
  L11_231 = ""
  L12_232 = ""
  L13_233 = ""
  L14_234 = ""
  L15_235 = {}
  L16_236 = {}
  if L7_227 ~= nil then
    L17_237 = nimfView
    L17_237 = L17_237.macAddressGet
    L18_238 = logIfName
    L17_237 = L17_237(L18_238)
    L9_229 = L17_237
  end
  L3_223["NimfConf.ConnectionType"] = "threeg"
  L12_232 = "Mobile internet"
  L11_231 = "Mobile Internet"
  L17_237 = db
  L17_237 = L17_237.getRowWhere
  L18_238 = "NimfStatus"
  L19_239 = L2_222
  L17_237 = L17_237(L18_238, L19_239)
  if L17_237 ~= nil then
    L18_238 = L17_237["NimfStatus.Nimfstatus"]
    L13_233 = L18_238 or ""
  end
  L18_238 = db
  L18_238 = L18_238.getRowWhere
  L19_239 = "NimfStatus"
  L20_240 = L2_222
  L18_238 = L18_238(L19_239, L20_240)
  if L18_238 ~= nil then
    L19_239 = L18_238["NimfStatus.Linkstatus"]
    L14_234 = L19_239 or ""
  end
  L19_239 = db
  L19_239 = L19_239.getAttribute
  L20_240 = "NatTable"
  L19_239 = L19_239(L20_240, L21_241, L22_242, L23_243)
  if L19_239 == "1" then
    L10_230 = "Enabled"
  else
    L10_230 = "Disabled"
  end
  L19_239 = ""
  L20_240 = 0
  if L12_232 ~= "JPPPOE" and L4_224 then
    for L24_244, L25_245 in L21_241(L22_242) do
      L20_240 = L20_240 + 1
      L19_239 = L19_239 .. L4_224[L20_240]["ipAddressTable.ipAddress"] .. " / " .. L4_224[L20_240]["ipAddressTable.subnetMask"]
      if L20_240 ~= #L4_224 then
        L19_239 = L19_239 .. ", "
      end
    end
  end
  L24_244 = L19_239 or ""
  L21_241(L22_242, L23_243, L24_244)
  if L8_228 == "1" then
    L8_228 = "UP"
  elseif L8_228 == "2" then
    L8_228 = "UP(IPv6)"
  elseif L8_228 == "3" then
    L8_228 = "UP(IPv4 and IPv6)"
  elseif L8_228 == "0" then
    L8_228 = "DOWN"
  end
  L24_244 = L8_228 or ""
  L21_241(L22_242, L23_243, L24_244)
  L24_244 = L10_230 or ""
  L21_241(L22_242, L23_243, L24_244)
  L24_244 = L12_232 or ""
  L21_241(L22_242, L23_243, L24_244)
  L24_244 = L13_233 or ""
  L21_241(L22_242, L23_243, L24_244)
  L24_244 = L14_234 or ""
  L21_241(L22_242, L23_243, L24_244)
  L24_244 = "_ROWID_"
  if L22_242 ~= nil then
    L24_244 = L22_242["WanMode.Wanmode"]
    if L24_244 == "2" then
    else
    end
    if L23_243 ~= nil then
      if L23_243 == "WAN1" then
      else
      end
    else
    end
    L24_244 = L22_242["WanMode.Wanmode"]
    if L24_244 == "2" then
      L24_244 = "Auto-Rollover using WAN port"
    else
      L24_244 = L22_242["WanMode.Wanmode"]
      if L24_244 == "0" then
        L24_244 = "Use only single WAN port "
      end
    end
  end
  L24_244 = L0_220
  L23_243(L24_244, L25_245, L21_241 or "")
  if L6_226 then
    L24_244 = 0
    for _FORV_28_, _FORV_29_ in L25_245(L6_226) do
      L24_244 = L24_244 + 1
      if L6_226[L24_244]["defaultRouters.nextHopGateway"] ~= nil and L6_226[L24_244]["defaultRouters.nextHopGateway"] ~= "" and L23_243 == "" then
      else
      end
    end
  end
  L24_244 = resTab
  L24_244 = L24_244.insertField
  L24_244(L25_245, "Gateway", L23_243 or "")
  L24_244 = ""
  if L5_225 then
    for _FORV_29_, _FORV_30_ in pairs(L5_225) do
      if L5_225[L25_245]["resolverConfig.nameserver1"] ~= nil and L5_225[L25_245]["resolverConfig.nameserver1"] ~= "" and L24_244 == "" then
        L24_244 = L24_244 .. L5_225[L25_245]["resolverConfig.nameserver1"]
      else
      end
    end
  end
  L25_245(L0_220, "Primary DNS", L24_244 or "")
  if L5_225 then
    for _FORV_30_, _FORV_31_ in pairs(L5_225) do
      if L5_225[0 + 1]["resolverConfig.nameserver2"] ~= nil and L5_225[0 + 1]["resolverConfig.nameserver2"] ~= "" and L25_245 == "" then
      else
      end
    end
  end
  resTab.insertField(L0_220, "Secondary DNS", L25_245 or "")
  resTab.print(L0_220, 0)
end
function wanVlanCfgInit(A0_246)
  local L1_247, L2_248, L3_249
  L1_247 = {}
  L1_247["vlanWan1Status.vlanWan1Status"] = ""
  L1_247["vlanWan1Status.restartStatus"] = ""
  L2_248 = 1
  L3_249 = L1_247
  return L2_248, L3_249
end
function wanVlanCfgSave(A0_250)
  errorFlag = ""
  statusCode = ""
  statusMessage = ""
  DBTable = "VlanPortMgmt"
  errorFlag, statusCode = vlanConfig.vlanWAN1Config(A0_250, "1", "edit")
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  return errorFlag, statusMessage
end
function wanVlanCfgInputVal(A0_251)
  local L1_252
  L1_252 = true
  if A0_251 == {} then
    return false
  end
  if A0_251["vlanWan1Status.vlanWan1Status"] == "" or A0_251["vlanWan1Status.vlanWan1Status"] == nil then
    printCLIError("Enter Valid Enable/Disable for trunk mode\n")
    L1_252 = false
  end
  if A0_251["vlanWan1Status.restartStatus"] == "" or A0_251["vlanWan1Status.restartStatus"] == nil then
    printCLIError("Enter Valid Enable/Disable for force mode\n")
    L1_252 = false
  end
  return L1_252
end
function wanVlanIdCfgInit(A0_253)
  local L1_254, L2_255, L3_256
  L1_254 = {}
  L1_254["vlan.vlanId"] = ""
  L2_255 = 1
  L3_256 = L1_254
  return L2_255, L3_256
end
function wanVlanIdAddCfgSave(A0_257)
  errorFlag = ""
  statusCode = ""
  statusMessage = ""
  DBTable = "vlanPSEEntry"
  errorFlag, statusCode = vlanConfig.vlanWAN1AddEdit(A0_257, "1", "edit")
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  return errorFlag, statusMessage
end
function wanVlanIdDeleteCfgSave(A0_258)
  errorFlag = ""
  statusCode = ""
  statusMessage = ""
  DBTable = "vlanPSEEntry"
  errorFlag, statusCode = vlanConfig.vlanWAN1Delete(A0_258, "1", "delete")
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  return errorFlag, statusMessage
end
function wanVlanIdCfgInputVal(A0_259)
  local L1_260
  L1_260 = true
  if A0_259 == {} then
    return false
  end
  if A0_259["vlan.vlanId"] == "" or A0_259["vlan.vlanId"] == nil then
    printCLIError("Enter Valid Vlan Id\n")
    L1_260 = false
  end
  if A0_259["vlan.vlanId"] == "1" or tonumber(A0_259["vlan.vlanId"]) > 4093 then
    printCLIError("Enter Valid Vlan Id, range 2 - 4093\n")
    L1_260 = false
  end
  if db.getAttribute("VlanPortMgmt", "PortLogicalName", "port100", "PortVlanMode") == "0" then
    printCLIError("Trunk Mode VLAN is DISABLE\n")
    L1_260 = false
    return L1_260
  end
  return L1_260
end
function wanVlanPortCfgGet()
  local L0_261, L1_262, L2_263
  L0_261 = db
  L0_261 = L0_261.getAttribute
  L1_262 = "VlanPortMgmt"
  L2_263 = "PortLogicalName"
  L0_261 = L0_261(L1_262, L2_263, "port100", "PortVlanMode")
  L1_262 = db
  L1_262 = L1_262.getAttribute
  L2_263 = "wanRestartonTrunkUpdate"
  L1_262 = L1_262(L2_263, "PortLogicalName", "WAN1", "restartEnable")
  L2_263 = db
  L2_263 = L2_263.getRowsWhere
  L2_263 = L2_263("vlanPSEEntry", "LogicalIfName !='LAN'", false)
  if L0_261 == "2" then
    print("Trunk Mode VLAN is ENABLE\n")
  else
    print("Trunk Mode VLAN is DISABLE\n")
  end
  if L1_262 == "1" then
    print("Force renegotiation on WAN with dynamic IP is ENABLE\n")
  else
    print("Force renegotiation on WAN with dynamic IP is DISABLE\n")
  end
  print("Associate VLAN Id's\n")
  if L2_263 ~= nil then
    for _FORV_6_, _FORV_7_ in pairs(L2_263) do
      print(_FORV_7_["vlanPSEEntry.vlanId"] .. "\n")
    end
  end
end
function simCardPinCfgInit(A0_264)
  local L1_265, L2_266, L3_267
  L1_265 = {}
  L1_265["SimConfig.status"] = ""
  L2_266 = 1
  L3_267 = L1_265
  return L2_266, L3_267
end
function simCardPinCfgSave(A0_268)
  local L1_269
  L1_269 = "ERROR"
  errorFlag = L1_269
  L1_269 = ""
  statusCode = L1_269
  L1_269 = ""
  statusMessage = L1_269
  L1_269 = "SIM Card Unlocked,Please resave mobile internet settings"
  simPIN = A0_268["SimConfig.pin"]
  errorFlag = _UPVALUE0_.simCardPinAuth(simPIN)
  statusMessage = _UPVALUE1_.errorStringGet(errorFlag)
  if errorFlag == _UPVALUE2_.SUCCESS then
    errorFlag = "OK"
    printCLIError(L1_269)
  else
    errorFlag = "ERROR"
  end
  return errorFlag, statusMessage
end
function simCardPinInputVal(A0_270)
  local L1_271
  returnCode, enableState, simCardLock, simCardStatus = _UPVALUE0_.simCardAuthStatusGet()
  if enableState == _UPVALUE1_ then
    printCLIError("Mobile Internet is not available")
    return false
  end
  if simCardLock == "0" then
    printCLIError("SIM card is already unlocked")
    return false
  end
  if tonumber(simCardLock) ~= 1 then
    printCLIError("Failed to get SIM status")
    return false
  end
  if A0_270["SimConfig.pin"] == nil or A0_270["SimConfig.pin"] == "" then
    printCLIError("Please configure the valid pin to unlock the sim")
    return false
  end
  L1_271 = A0_270["SimConfig.pin"]
  return true
end
function simCardPinCfgGet()
  local L0_272, L1_273, L2_274, L3_275, L4_276
  L4_276 = {}
  L0_272, L1_273, L2_274, L3_275 = _UPVALUE0_.simCardAuthStatusGet()
  if L1_273 == _UPVALUE1_ then
    printCLIError("Mobile Internet is not available")
    return false
  end
  printLabel("SIM Card Authentication")
  resTab.insertField(L4_276, "SIM Card Status", L3_275)
  resTab.print(L4_276, 0)
end
function nimf_lanvlandmzsslclientsubnetRange(A0_277, A1_278)
  local L2_279
  if HIGH_SEC == "HIGH" then
    L2_279 = _UPVALUE0_.checkSslClientRange(A0_277, A1_278)
    if L2_279 == _UPVALUE1_.SUCCESS then
      status = 1
      message = "SSL-VPN client range is in the same subnet.Please specify IP address in a different subnet."
      return status, message
    end
  end
  L2_279 = _UPVALUE0_.checkDmzSubnetRange(A0_277, A1_278)
  if L2_279 == _UPVALUE1_.SUCCESS then
    status = 1
    message = "DMZ ip/subnet already configured in same subnet.Please specify IP address in a different subnet."
    return status, message
  end
  L2_279 = _UPVALUE0_.checkLanVlanSubnetRange(A0_277, A1_278)
  if L2_279 == _UPVALUE1_.SUCCESS then
    status = 1
    message = "Lan/Vlan ip/subnet already configured in same subnet.Please specify IP address in a different subnet."
    return status, message
  end
  status = 0
  message = nil
  return status, message
end
